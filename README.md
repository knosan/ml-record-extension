# ML record extension

This is the implementation of and extension of records in ML.

The implementation uses a version of ML with selected OCaml constructions. In the current implementation of the type system, the following constructions are supported:
- variables
- applications
- abstractions `fun x -> ...`
- let constructions `let x = in ...`
- unit `()`
- integers
- floating point numbers
- strings
- records
- projection of record fields `proj label record`
- record extension `extend label value record`
- default records `default label value record`
- builtin functions

## Syntactic rules
There are some specific syntactic rules that differ from traditional OCaml syntax.
- All declarations must be separated by a double semi-colon `;;`.

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
- Unary functions
  - negative value of an integer `neg_int`
  - negative value of a float `neg_float`
  - string representation of an integer `int_to_string`
  - string representation of a float `float_to_string`
- Binary functions
  - integer addition `add_int`
  - integer substraction `sub_int`
  - integer multiplication `mul_int`
  - integer division `div_int`
  - float addition `add_float`
  - float substraction `sub_float`
  - float multiplication `mul_float`
  - float division `div_float`
  - string concatenation `append_string`
