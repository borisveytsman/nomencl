This is the README file for the nomencl package. Please read the
license information at the end of this file.


PURPOSE

The nomenclature package can be used to generate and format a
nomenclature using MakeIndex.


INSTALLATION

To install the nomencl package you need:
  nomencl.ins
  nomencl.dtx
  docstrip.tex (part of the standard LaTeX2e distribution)
               (I think you need at least version 2.4)

Run LaTeX on the file nomencl.ins to strip the comments from nomencl.dtx and 
produce the style file nomencl.sty, the index format file nomencl.ist and some
sample configuration files. Put the file nomencl.sty somewhere LaTeX can find 
it and nomencl.ist somewhere MakeIndex can find. Read the documentation of 
your LaTeX system to find out where this might be. 

If you're new to this, see
http://www.tex.ac.uk/cgi-bin/texfaq2html?label=instpackages for more
information on installing packages.


DOCUMENTATION

To produce the documentation you also need:
  ltxdoc.cls (part of the standard LaTeX2e distribution)
  doc.sty (part of the standard LaTeX2e distribution)
  url.sty (part of almost all LaTeX2e distributions)

If you want the standard documentation, run LaTeX on nomencl.dtx.
If you want a more detailed documentation with the code and an index,
use nomencl.drv and modify it according to the following notes.

To get documentation of the code, put a percent sign in front of the
\OnlyDescription.

If you additionally want to know about the change history, uncomment the
indicated lines in nomencl.drv and use the following commands:
    latex nomencl.drv
    makeindex -s gglo.ist -o nomencl.gls nomencl.glo
    latex nomencl.drv
Then the change history should appear at the end of the documentation.
Note that this list is only complete if you include the code (see above).

If you want to have an index of all the new and redefined macros and
environments, uncomment the indicated lines and use the following 
commands:
    latex nomencl.drv
    makeindex -s gind.ist nomencl.idx
    latex nomencl.drv


COPYING AND MODIFICATION

Copyright 1996 Boris Veytsman
Copyright 1999-2001 Bernd Schandl

The nomencl package consists of the following files:

  README       Instructions on installation and documentation.
  nomencl.ins  The installation driver.
  nomencl.dtx  The documentation and the documented source code.

This package can be redistributed and/or modified under the terms
of the LaTeX Project Public License distributed from CTAN
archives in the directory macros/latex/base/lppl.txt; either
version 1.2 of the license, or (at your option) any later version.

You might like to keep nomencl.ins and nomencl.dtx somewhere safe as a 
backup, or in case you want to pass the nomencl package on to someone 
else.


HELP

CV Radhakrishnan
Lee Netherton
www   http://sarovar.org/projects/nomencl/

