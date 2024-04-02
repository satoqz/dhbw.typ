TYPST      ?= typst
TYPST_LIVE ?= typst-live

TYPST_ARGS = --root .

SRC  = example/thesis.typ
DEST = example/thesis.pdf

compile:
	$(TYPST) compile $(TYPST_ARGS) $(SRC) $(DEST) 

watch:
	$(TYPST) watch $(TYPST_ARGS) $(SRC) $(DEST) 

live:
	$(TYPST_LIVE) $(SRC) -- $(TYPST_ARGS)

.PHONY: compile watch live
