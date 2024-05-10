-module(example_gen_server).
-behaviour(gen_server).

-export([start_link/0]).
-export([
    make_call/1
    , make_cast/1
]).

start_link() -> 
    ProcessName = ?MODULE,
    Module = ?MODULE,
    InitArgs = [],
    Opts = [],
    gen_server:start_link({local,ProcessName},Module,InitArgs,Opts).

make_call(Msg) ->
    gen_server:call(?MODULE,Msg).

make_cast(Msg) ->
    gen_server:cast(?MODULE,Msg).

init([]) ->
    process_flag(trap_exit,true),
    {ok,#{}}.

