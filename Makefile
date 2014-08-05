TEX=xelatex -synctex=-1
BIB=bibtex

# You can get pulp here: https://github.com/dmwit/pulp
PULP = "$(shell which pulp || echo \"$(HOME)\"~/.cabal/bin/pulp)"

THESIS=thesis
BIBFILE=bibliography.bib

default: $(THESIS).tex $(THESIS).bbl
	$(TEX) $(THESIS)
	$(TEX) $(THESIS)

pdf: default clean

$(THESIS).bbl: $(THESIS).tex $(BIBFILE)
	$(TEX) $(THESIS)
	$(BIB) $(THESIS)

pulp: $(THESIS).tex $(BIBFILE)
	rm -f $(THESIS).log
	-$(TEX) -interaction nonstopmode $< &> /dev/null
	-bibtex $(THESIS) &> /dev/null
	-$(TEX) -interaction nonstopmode $< &> /dev/null
	-$(TEX) -interaction nonstopmode $< &> /dev/null
	-$(PULP) $(THESIS).log

clean:
	rm -fv *.aux *.log *.bbl *.blg *.toc *.out *.lot *.lof *.lol

distclean: clean
	rm $(THESIS).pdf
