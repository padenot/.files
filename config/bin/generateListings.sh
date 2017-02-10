#!/bin/bash -x

if [ $# != 2 ]
then
    echo "The root directory shall be passed as argument, followed by the language."
    exit 1
fi

FILENAME="listing.tex"
ROOTDIR=$1
LANGUAGE=$2
AUTHORS="ADENOT Paul \& SOUMEILLAN Thomas"

rm $FILENAME

cat ~/bin/include.tex >> $FILENAME

echo "% Couleur des url et des liens internes.
\hypersetup{urlcolor=blue,linkcolor=black,citecolor=black,colorlinks=true}

%headers, footers
\pagestyle{fancy}
\\rhead{INSA de Lyon -- 2009/2010}
\\lhead{$AUTHORS}
\\cfoot{\\thepage}

\\title{Listes de l'application}
\\begin{document}
\\maketitle
\\tableofcontents
\\newpage
" >> $FILENAME

generate()
{
    for i in `ls $1`
    do
	if [ -d $1/$i ]
	then
	    echo "\\section{Package {\\tt $i}}" >> $FILENAME
	    generate $1/$i
	else
	    file=${i%.*}.java
	    echo "\\subsection{Classe $file}" >> $FILENAME
	    echo "\\addCode{$1/$i}{$LANGUAGE}" >> $FILENAME
	fi
    done
}

generate $ROOTDIR

echo "\end{document}" >> $FILENAME
