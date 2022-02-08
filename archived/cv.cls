\ProvidesClass{my-cv}[2014/04/17 CV class]
\NeedsTeXFormat{LaTeX2e}

\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}%
}
\ProcessOptions\relax
\LoadClass{article}


%%%%%%%%%%
% Colors %
%%%%%%%%%%

\RequirePackage{xcolor}

\definecolor{white}{RGB}{255,255,255}


\definecolor{darkgray}{HTML}{424242}
\definecolor{gray}{HTML}{424242}
\definecolor{lightgray}{HTML}{424242}

\definecolor{green}{HTML}{C2E15F}
\definecolor{orange}{HTML}{FDA333}
\definecolor{purple}{HTML}{D3A4F9}
\definecolor{red}{HTML}{FB4485}
\definecolor{blue}{HTML}{6CE0F1}
% \definecolor{color1}{RGB}{175,64,47}%{HTML}{669966}%{RGB}{175,64,47}% light blue\definecolor{color1}{RGB}{3,124,106}% light blue
\definecolor{color1}{HTML}{9E5B5B}

\ifdefined\@cv@print
  \colorlet{green}{gray}
  \colorlet{orange}{gray}
  \colorlet{purple}{gray}
  \colorlet{brown}{gray}
  \colorlet{red}{gray}
  \colorlet{blue}{gray}
  \colorlet{fillheader}{white}
  \colorlet{header}{gray}
\else
  \colorlet{fillheader}{gray}
  \colorlet{header}{white}
\fi
\colorlet{textcolor}{gray}
\colorlet{headercolor}{gray}

%%%%%%%%%
% Fonts %
%%%%%%%%%

\RequirePackage[quiet]{fontspec}
%\RequirePackage[math-style=TeX,vargreek-shape=unicode]{unicode-math}

\newfontfamily\bodyfont[Ligatures=TeX,Scale=0.9]{Open Sans}
\newfontfamily\thinfont[Ligatures=TeX,Scale=0.9]{Open Sans Light}
\newfontfamily\headingfont[Ligatures=TeX,Scale=1]{Oswald Regular}

\defaultfontfeatures{Mapping=tex-text}
\setmainfont[Mapping=tex-text, 
Color=textcolor,Ligatures=TeX,Scale=0.9]{Open Sans Light}

%\setmathfont{XITS Math}

%%%%%%%%%%
% Header %
%%%%%%%%%%

\RequirePackage{tikz}

\newcommand{\rolefont}{%
  \fontsize{14pt}{24pt}\selectfont%
  \thinfont%
  \color{white}%
}

\newcommand{\header}[3]{%
  \begin{tikzpicture}[remember picture,overlay]
    \node [rectangle, fill=fillheader, anchor=north, minimum width=\paperwidth, minimum height=2.6cm] (box) at (current page.north){};
% \node[inner sep=0pt, anchor=center] (mypic) at (-2cm, 0.8cm){\includegraphics[width=2cm]{moi_round_4.png}};
    \node [anchor=center] (name) at (box) {%
      \fontsize{24pt}{42pt}\color{header}%
      {\headingfont #1}{\headingfont  #2}
    };
    \node [anchor=north] at (name.south) {%
      \fontsize{10pt}{24pt}\color{header}%
      \thinfont #3%
    };
  \end{tikzpicture}
  \vspace{1.cm}
  \vspace{-2\parskip}
}


%%%%%%%%%%%%%
% Structure %
%%%%%%%%%%%%%
\RequirePackage{parskip}

\newcounter{colorCounter}
\def\@sectioncolor#1#2#3{%
  {%
    \color{%
      \ifcase\value{colorCounter}%
        blue\or%
        red\or%
        orange\or%
        green\or%
        purple\or%
        brown\else%
        headercolor\fi%
    } #1#2#3%
  }%
  \stepcounter{colorCounter}%
}

\renewcommand{\section}[1]{
  \par\vspace{\parskip}
  {%
    \LARGE\headingfont\color{headercolor}%
   \color{color1} #1%
        %\@sectioncolor #1%
  }
  \par\vspace{\parskip}
}

\renewcommand{\subsection}[2]{
  \par\vspace{.5\parskip}%
  \Large\headingfont\color{headercolor} #2%
  \par\vspace{.25\parskip}%
}

\pagestyle{empty}


%%%%%%%%%%%%%%%%%%%%
% List environment %
%%%%%%%%%%%%%%%%%%%%

\setlength{\tabcolsep}{0pt}
\newenvironment{entrylist}{%
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
  \end{tabular*}
}
\renewcommand{\bfseries}{\headingfont\color{headercolor}}
\newcommand{\entry}[4]{%
  \parbox[t]{1.8cm}{#1\hfill}&\parbox[t]{11.8cm}{%
    \textbf{#2}%
    \hfill%
    {\footnotesize\addfontfeature{Color=lightgray} #3}\\%
    #4\vspace{\parsep}%
  }\\}


%%%%%%%%%%%%%%
% Side block %
%%%%%%%%%%%%%%

\RequirePackage[absolute,overlay]{textpos}
\setlength{\TPHorizModule}{1cm}
\setlength{\TPVertModule}{1cm}
\newenvironment{aside}{%
  \let\oldsection\section
  \renewcommand{\section}[1]{
    \par\vspace{\baselineskip}{\Large\headingfont\color{headercolor} ##1}
  }
  \begin{textblock}{3.8}(1.4, 2.64)
  \begin{flushright}
  \obeycr
}{%
  \restorecr
  \end{flushright}
  \end{textblock}
  \let\section\oldsection
}



%%%%%%%%%%%%%%%%
% Bibliography %
%%%%%%%%%%%%%%%%

\RequirePackage{keyval}
\RequirePackage[maxnames=5, sorting=chronological, backend=biber, giveninits, defernumbers=true]{biblatex}%defernumbers=true ,
%
\setlength{\biblabelsep}{-\the\fontdimen2\font}
\DeclareFieldFormat{labelnumberwidth}{\addspace}

\DeclareFieldFormat[article]{title}{#1 \addperiod\space}
\DeclareFieldFormat[book]{title}{#1 \addperiod\space}
\DeclareFieldFormat[inproceedings]{title}{#1 \addperiod\space}
\DeclareFieldFormat[misc]{title}{#1 \addperiod\space}
\DeclareFieldFormat[report]{title}{#1 \addperiod\space}

% \DeclareBibliographyDriver{article}{%
%   \printfield{title}%
%   \newblock%
%   \printnames{author}%
%   \par%
%   \newblock%
%   {%
%     \footnotesize\addfontfeature{Color=lightgray}\itshape%
%     \usebibmacro{journal+issuetitle}%
%     \setunit{\space}%
%     \printfield{pages}%
%     \newunit%
%     \printlist{publisher}%
%     \setunit*{\addcomma\space}%
%     %\printfield{year}%
%     \newunit%
%   }
%   \par\vspace{0.3\baselineskip}
% }


\DeclareBibliographyDriver{article}{%
    \printnames{author}%
    \addperiod\space
  \newblock%
  \itshape\printfield{title}%
  \newblock%
  {%
    \addfontfeature{Color=lightgray}\itshape%
    \usebibmacro{journal+issuetitle}%
    \setunit{\space}%
    \printfield{pages}%
%     \newunit%
%     \printlist{publisher}%
    %\setunit*{\addcomma\space}%
    %\printfield{year}%
    %\newunit%
  }
  \par\vspace{0.3\baselineskip}
}


\DeclareBibliographyDriver{book}{%
    \printnames{author}%
    \addperiod\space
  \newblock%
  \itshape\printfield{title}%
  \newblock%
  {%
    \addfontfeature{Color=lightgray}\itshape%
    \printlist{publisher}%
    \setunit*{\addcomma\space}%
    \printfield{note}%
    \setunit*{\addcomma\space}%
    \printfield{year}%
    \setunit{\addcomma\space}%
    \printlist{location}%
%     \newunit%
  }
  \par\vspace{0.3\baselineskip}
}


\DeclareBibliographyDriver{inproceedings}{%
    \printnames{author}%
    \addperiod\space
  \newblock%
  \itshape\printfield{title}%
  \newblock%
  {%
   \addfontfeature{Color=lightgray}%
    \printfield{booktitle}%
    \setunit{\addcomma\space}%
    \printfield{year}%
    \setunit{\addcomma\space}%
    \printlist{location}%
    %\newunit%
  }
  \par\vspace{0.3\baselineskip}
}

\DeclareBibliographyDriver{misc}{%
  \printnames{author}%
    \addperiod\space
  \newblock%
  \itshape\printfield{title}%
  \newblock%
  {%
    \addfontfeature{Color=lightgray}\itshape%
    \printfield{booktitle}%
    \setunit*{\addcomma\space}%
    \printfield{note}%
    \setunit*{\addcomma\space}%
    \printfield{year}%
    \setunit{\addcomma\space}%
    \printlist{location}%
%     \newunit%
  }
  \par\vspace{0.3\baselineskip}
}

\DeclareBibliographyDriver{report}{%
  \printnames{author}%
    \addperiod\space
  \newblock%
  \itshape\printfield{title}%
  \newblock%
  {%
   \addfontfeature{Color=lightgray}\itshape%
    \printfield{type}%
    \setunit{\space}%
    \printfield{number}%
    \setunit{\addcomma\space}%
    \printfield{year}%
%     \newunit%
  }
  \par\vspace{0.3\baselineskip}
}

% \DeclareNameFormat{author}{%
%   \addfontfeature{Color=lightgray}%
%   \ifthenelse{\value{listcount}<\value{liststop}\namepartgiven\space\namepartfamily\addcomma\space}
% }


% \DeclareNameFormat{author}{%
% \addfontfeature{Color=lightgray}%
% %     \nameparts{#1}
%      \usebibmacro{name:family}
%       {\namepartfamily}
%       {\namepartgiven}
%       {\namepartprefix}
%       {\namepartsuffix}%
%      }


\DeclareSortingScheme{chronological}{
  \sort[direction=descending]{\field{year}}
  \sort[direction=descending]{\field{month}}
}


\newcommand{\printbibsection}[2]{
  \begin{refsection}
    \nocite{*}
    \printbibliography[type={#1}, title={#2}, heading=subbibliography]
  \end{refsection}
}



%%%%%%%%%%%%%%%%
% Other tweaks %
%%%%%%%%%%%%%%%%


\RequirePackage{geometry}

\RequirePackage{fontawesome5}


% \RequirePackage{marvosym}
% % symbols
% \newcommand{\mobilesymbol}{\marvosymbol{72}~}
% \newcommand{\phonesymbol}{\marvosymbol{84}~}
% \newcommand{\faxsymbol}{\marvosymbol{117}~}
% \newcommand{\emailsymbol}{\marvosymbol{66}~}
% \newcommand{\homepagesymbol}{{\Large\marvosymbol{205}}~}
