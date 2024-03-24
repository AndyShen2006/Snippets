

# Rust:let&mut & Haskell:let bindings & OCaml:let&mutable

```rust
let a = 3;
a = 5 // This is unacceptable, You can shadowing it, but cannot write it
let mut b = 3;
b = 5 // This is acceptable. You can write an mutable variable.
```

```haskell
main = do
    let a=3
    a=5 -- This is unacceptable,since haskell didn't allow side effects.
```

```ocaml
let a = 3 in
let 
```

# Rust:Comment & C/C++/Java:Comment

```rust
// aaa
/*
aaa
*/
/// aaa(This can make docs)
```

```cpp
// aaa
/*
aaa
*/
// If you want to make docs, use Doxygen instead.
```

# Rust:If expression & C/C++:If expression

```rust
if expr {   // expr can only be bool expression.
    stmt;
}else if expr {
    stmt;
}else {
    stmt;
}
```

# Rust:While & C/C++:while

```rust
while expr {    // Execute until expr is false.
    stmt;
}
```

```cpp
while(expr) {   // Execute until expr is false.
    stmt;
}
```

# Rust:For & C++11:For in range & Python

```rust
for i in 0..5{
    stmt;
}
```

```cpp
r={0,1,2,3,4,5};
for(int i : r) {
    stmt;
}
```

```python
for x in range(0,5) {
    stmt
}
```

# Rust:Match & Haskell:case & OCaml:Match

```rust
match expression {
    pattern => result,
    pattern => result,
    ...
}
```

```haskell
case expression of pattern -> result
                   pattern -> result
                   pattern -> result
                   ...
```

```ocaml
match expr with
    | pattern -> result;;
    | pattern -> result;;
    ...
```

# Rust:Slice & Haskell:List Comprehension & C++17:string_view