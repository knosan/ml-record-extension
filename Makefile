CMO=HindleyMilner.cmo lexer.cmo parser.cmo interpret.cmo main.cmo
GENERATED = lexer.ml parser.ml parser.mli
FLAGS=-annot -g

all: mini-ml

test: mini-ml
	./mini-ml test.ml

mini-ml: $(CMO)
	ocamlc $(FLAGS) -o $@ $(CMO)

.SUFFIXES: .mli .ml .cmi .cmo .mll .mly

.mli.cmi:
	ocamlc $(FLAGS) -c  $<

.ml.cmo:
	ocamlc $(FLAGS) -c $<

.mll.ml:
	ocamllex $<

.mly.ml:
	menhir -v $<

.mly.mli:
	menhir -v $<

clean:
	rm -f *.cm[io] *.o *.annot *~ mini-ml $(GENERATED)
	rm -f parser.output parser.automaton

.depend depend:$(GENERATED)
	rm -f .depend
	ocamldep $(filter-out test.ml,$(wildcard *.ml)) *.mli > .depend

include .depend
