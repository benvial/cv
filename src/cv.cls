\ProvidesClass{cv}[2021/07/03 CV class]
\NeedsTeXFormat{LaTeX2e}

\DeclareOption{print}{\def\@academia@orderbib{}}
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{academia}%
    \PassOptionsToClass{orderbib}{academia}%
}
\ProcessOptions\relax
\LoadClass{academia}

%%%%%%%%%%%%%%%%
% Bibliography %
%%%%%%%%%%%%%%%%


% remove numbers adnd adjust space
\setlength{\biblabelsep}{-\the\fontdimen2\font}
\DeclareFieldFormat{labelnumberwidth}{\addspace}


\renewfontfamily\bodyfont[Ligatures=TeX,Scale=0.9]{Source Sans Pro}
\renewfontfamily\thinfont[Ligatures=TeX,Scale=0.9]{Source Sans Pro}
\renewfontfamily\headingfont[Ligatures=TeX,Scale=0.9]{Oswald}

\defaultfontfeatures{Mapping=tex-text}
\setmainfont[Mapping=tex-text,
Color=textcolor,Ligatures=TeX,Scale=0.9]{Source Sans Pro}

\titleformat{\subsection}{\large\bfseries\bfseries}{}{0.7em}{}
