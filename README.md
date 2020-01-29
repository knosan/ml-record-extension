# ML record extension

This is the implementation of and extension of records in ML.

The implementation uses a version of ML with selected OCaml constructions. In the current implementation of the type system, the following constructions are supported:
- variables
- applications
- abstractions (to be added to parser)
- let constructions (to be added to parser)
- unit
- integers
- integer addition
- integer substraction
- floats
- strings
- records (to be added to parser)
- projection of record fields (to be added to parser)
- record extension (to be added to parser)
- default records (to be added to parser)

## Commands
1. To compile the parser and interpreter use the command
> `make`

An executable interpreter `mini-ml` is created that can be used to interpret `.ml` files using the limited syntax:
> `./mini-ml file.ml`

2. To compile the parser and interpreter and run the it on the test file `test.ml` use the command
> `make tests`
