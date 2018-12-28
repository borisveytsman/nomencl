
PACKAGE=nomencl

SAMPLECFG = sample01.cfg sample02.cfg sample04.cfg sample05.cfg

SAMPLES = ${SAMPLECFG:%.cfg=%.pdf}

PDF = $(PACKAGE).pdf ${SAMPLES} 

all:  ${PDF} ${SAMPLECFG}


%.sty:  %.ins %.dtx
	pdflatex $*.ins

example.tex:  nomencl.ins nomencl.sty
	pdflatex nomencl.ins

sample%.cfg: nomencl.ins nomencl.dtx
	pdflatex nomencl.ins


%.pdf:  %.dtx ${PACKAGE}.sty example.tex
	pdflatex $<
	- bibtex $*
	pdflatex $<
	- makeindex -s gind.ist -o $*.ind $*.idx
	- makeindex -s gglo.ist -o $*.gls $*.glo
	pdflatex $<
	while ( grep -q '^LaTeX Warning: Label(s) may have changed' $*.log) \
	do pdflatex $<; done


sample%.pdf:  sample%.cfg example.tex
	ln -sf $< nomencl.cfg
	$(RM) example.nls example.nlo
	pdflatex example.tex
	makeindex example.nlo -s nomencl.ist -o example.nls
	pdflatex example.tex
	pdflatex example.tex
	$(RM) nomencl.cfg
	mv example.pdf $@


clean:
	$(RM)  ${PACKAGE}.sty *.log *.aux \
	*.cfg *.glo *.idx *.toc \
	*.ilg *.ind *.out *.lof \
	*.lot *.bbl *.blg *.gls *.cut *.hd \
	*.dvi *.ps *.thm *.tgz *.zip *.rpi *.drv *.ist \
	*.nlo *.nls example.tex nomencl.cfg

distclean: clean
	$(RM) $(PDF) ${SAMPLECFG}

#
# Archive for the distribution. Includes typeset documentation
#
archive:  all clean
	COPYFILE_DISABLE=1 tar -C .. -czvf ../$(PACKAGE).tgz --exclude '*~' --exclude '*.tgz' --exclude '*.zip'  --exclude CVS --exclude '.git*' $(PACKAGE); mv ../$(PACKAGE).tgz .

zip:  all clean
	zip -r  $(PACKAGE).zip * -x '*~' -x '*.tgz' -x '*.zip' -x CVS -x 'CVS/*'

