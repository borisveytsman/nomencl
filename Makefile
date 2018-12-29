
PACKAGE=nomencl

SAMPLES = sample01.tex sample02.tex sample03.tex sample04.tex sample05.tex 

CFG = sample04.cfg sample05.cfg sample06.cfg


SAMPLEPDF = ${SAMPLES:%.tex=%.pdf}

PDF = $(PACKAGE).pdf ${SAMPLEPDF}

all:  ${PDF} ${SAMPLES} ${CFG} ${PACKAGE}.sty


%.sty:  %.ins %.dtx
	pdflatex $*.ins

sample%.tex:  nomencl.ins nomencl.sty
	pdflatex nomencl.ins

sample%.cfg: nomencl.ins nomencl.dtx
	pdflatex nomencl.ins


%.pdf:  %.dtx ${PACKAGE}.sty 
	pdflatex $<
	- bibtex $*
	pdflatex $<
	- makeindex -s gind.ist -o $*.ind $*.idx
	- makeindex -s gglo.ist -o $*.gls $*.glo
	pdflatex $<
	while ( grep -q '^LaTeX Warning: Label(s) may have changed' $*.log) \
	do pdflatex $<; done


sample%.pdf: sample%.tex ${CFG} ${PACKAGE}.sty
	pdflatex sample$*.tex
	makeindex sample$*.nlo -s nomencl.ist -o sample$*.nls
	pdflatex sample$*.tex
	pdflatex sample$*.tex



clean:
	$(RM)  ${PACKAGE}.sty *.log *.aux \
	*.cfg *.glo *.idx *.toc \
	*.ilg *.ind *.out *.lof \
	*.lot *.bbl *.blg *.gls *.cut *.hd \
	*.dvi *.ps *.thm *.tgz *.zip *.rpi *.drv *.ist \
	*.nlo *.nls ${SAMPLES} ${CFG}

distclean: clean
	$(RM) $(PDF) 

#
# Archive for the distribution. Includes typeset documentation
#
archive:  all clean
	COPYFILE_DISABLE=1 tar -C .. -czvf ../$(PACKAGE).tgz --exclude '*~' --exclude '*.tgz' --exclude '*.zip'  --exclude CVS --exclude '.git*' $(PACKAGE); mv ../$(PACKAGE).tgz .

zip:  all clean
	zip -r  $(PACKAGE).zip * -x '*~' -x '*.tgz' -x '*.zip' -x CVS -x 'CVS/*'

.PRECIOUS: ${SAMPLES} ${CFG}
