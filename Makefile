TARGET = YOUR_FILE_NAME 
SOURECE = $(shell ls fig/*.eps)

LATEX = platex -kanji=utf8 -shell-escape -src-specials -synctex=1 -halt-on-error
DVIPDFM = dvipdfmx -f ptex-ipaex.map
XDVI = xdvi

.SUFFIXES: .tex .dvi .pdf

$(TARGET).dvi: $(TARGET).aux $(SOURECE)
	$(LATEX) $(TARGET)
	$(LATEX) $(TARGET)

.dvi.pdf: $(TARGET).dvi
	$(DVIPDFM) $<

$(TARGET).aux: $(TARGET).tex
	$(LATEX) $(TARGET)

pdf: $(TARGET).pdf

run: $(TARGET).dvi
	$(XDVI) $(TARGET).dvi &

clean:
	rm -f $(TARGET).dvi $(TARGET).toc $(TARGET).aux $(TARGET).blg $(TARGET).bbl $(TARGET).log $(TARGET).pdf *~
