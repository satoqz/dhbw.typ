TYPST      ?= typst
TYPST_ARGS  = --root .

SRC  = example/thesis.typ
DEST = example/thesis.pdf

compile:
	$(TYPST) compile $(TYPST_ARGS) $(SRC) $(DEST) 

watch:
	$(TYPST) watch $(TYPST_ARGS) $(SRC) $(DEST) 

.PHONY: compile watch
