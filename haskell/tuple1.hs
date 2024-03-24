fun :: (Int,Int) ->Int
fun (a,b)=a+b

main = do
    [a,b]<-fmap (fmap read . words) getLine
    print(fun(a,b))