# ML record extension

This is the implementation of and extension of records in ML.

The implementation uses a version of ML with selected OCaml constructions. In the current implementation of the type system, the following constructions are supported:
- variables
- applications
- abstractions `fun x -> ...`
- let constructions `let x = in ...`
- unit `()`
- integers
- floats
- strings
- records
- projection of record fields `proj lable record`
- record extension `extend label value record`
- default records `default label value record`
- builtin functions

## Commands
1. To compile the parser and interpreter use the command
> `make`

An executable interpreter `mini-ml` is created that can be used to interpret `.ml` files using the limited syntax (type and evaluate):
> `./mini-ml file.ml`

To type only use command:
> `./mini-ml --type-only file.ml`

To display builtin functions use command:
> `./mini-ml --builtin`


2. To compile the parser and interpreter and run the it on the test file `test.ml` use the command
> `make test`


## Builtin functions
Builtin functions are defined in the file [functions.ml](functions.ml)

Current list of builtin functions:
- integer addition `AddInt`
- integer substraction `SubInt`
- integer multiplication `MulInt`
