% ----------
% IDENTIFICATION
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{brthesis}[2015/12/17]

% ----------
% INITIAL CODE
\RequirePackage{ifthen}

% ----------
% DECLARATION OF OPTIONS
\newboolean{isenglish}
\DeclareOption{english}{\setboolean{isenglish}{true}}

\DeclareOption{a5}{\PassOptionsToClass{a5paper,10pt}{abntex2}}
\DeclareOption{a4}{\PassOptionsToClass{a4paper,12pt}{abntex2}}

\DeclareOption*{%
 \PassOptionsToClass{\CurrentOption}{abntex2}%
}

% ----------
% EXECUTION OF OPTIONS
\ProcessOptions\relax

% ----------
% LOADING
\LoadClass[twoside,sumario=tradicional]{abntex2}

% ----------
% MAIN CODE

% standard packages for inputing accented characters
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}

% font setup: use palatino 
% there seems to be a bug with using Palatino and amsmath, because they both define a command \iint
% I'm using a solution from the TeX UK FAQ (http://www.tex.ac.uk/cgi-bin/texfaq2html?label=alreadydef)
% with this, I'm alreding loading amsmath, which is useful sometimes

\RequirePackage{savesym}
\RequirePackage{amsmath}
\savesymbol{iint}

\RequirePackage{pxfonts}

%the pxfonts version can be invoked via \PXFiint
\restoresymbol{PXF}{iint}

% Some fundamental packages, as suggested by abntex2 templates
\RequirePackage{cmap} % map special characters in PDF
\RequirePackage{color}
\RequirePackage{graphicx}

% abntex citation
\ifthenelse{\boolean{isenglish}}{%
\RequirePackage[alf,abnt-etal-list=0,abnt-and-type=&]{abntex2cite}}{%
\RequirePackage[alf,abnt-etal-list=0]{abntex2cite}}	% Citações padrão ABNT

% sinutix

\ifthenelse{\boolean{isenglish}}{%
\RequirePackage[output-decimal-marker={.},per-mode=symbol]{siunitx}}{%else
\RequirePackage[output-decimal-marker={,},per-mode=symbol]{siunitx}}

% change figure list in Brazilian
\addto\captionsbrazil{
    \renewcommand{\listfigurename}{Lista de figuras}
}

% configure margins
\setlrmarginsandblock{2.5cm}{1.5cm}{*}
\setulmarginsandblock{2.0cm}{1.5cm}{*}
\checkandfixthelayout

\setlength{\parindent}{1.0cm}

% Eliminate spacing between parapgrahs
\setlength{\parskip}{0.0cm}

% espaçamento simples
\OnehalfSpacing

% ---
% Modify the \textual command, to print page number at the top right corner
\renewcommand{\textual}{%
  \ifthenelse{\equal{\ABNTEXisarticle}{true}}{%
    \pagestyle{simple}% no chapter names, to avoid priting "Summary" and "References"
  }{%else  
    \pagestyle{abntheadings}%
    \aliaspagestyle{chapter}{abntchapfirst}% customizing chapter pagestyle
  }  
  \nouppercaseheads%
  \bookmarksetup{startatroot}% 
}

\ifthenelse{\boolean{isenglish}}{
\selectlanguage{english}
\newcommand{\covername}{Cover}
% this commands rename reference names to be used by \autoref
\renewcommand{\figureautorefname}{Fig.}
\renewcommand{\tableautorefname}{Tab.}
\renewcommand{\chapterautorefname}{Chapter}
\renewcommand{\sectionautorefname}{Section}
\renewcommand{\subsectionautorefname}{Section}
\renewcommand{\subsubsectionautorefname}{Section}
% from https://tex.stackexchange.com/questions/52410/how-to-use-the-command-autoref-to-implement-the-same-effect-when-use-the-comman
\def\equationautorefname~#1\null{%
  Eq.~(#1)\null
}%
}{%
% this commands rename reference names to be used by \autoref
\renewcommand{\figureautorefname}{Fig.}
\renewcommand{\tableautorefname}{Tab.}
\renewcommand{\chapterautorefname}{Capítulo}
\renewcommand{\sectionautorefname}{Seção}
\renewcommand{\subsectionautorefname}{Seção}
\renewcommand{\subsubsectionautorefname}{Seção}
% from https://tex.stackexchange.com/questions/52410/how-to-use-the-command-autoref-to-implement-the-same-effect-when-use-the-comman
\def\equationautorefname~#1\null{%
  Eq.~(#1)\null
}%
\newcommand{\covername}{Capa}}

% table of contents formatting
\cftsetindents{chapter}{0em}{1em}
\cftsetindents{section}{1em}{2em}
\cftsetindents{subsection}{2em}{3em}
\cftsetindents{subsubsection}{3em}{4em}
\renewcommand{\cftchapterfont}{\mdseries}
\renewcommand{\cftchapterpagefont}{\normalfont}
\renewcommand{\cftchapterleader}{\normalfont\cftdotfill{\cftchapterdotsep}}
\renewcommand{\cftsectionfont}{\normalfont}
\renewcommand{\cftsubsectionfont}{\normalfont}
\renewcommand{\cftsubsubsectionfont}{\normalfont}%
\renewcommand{\bibsection}{%
    \chapter*{\bibname}
    \bibmark
    \ifnobibintoc\else
    \addcontentsline{toc}{chapter}{\bibname}
    \fi
    \prebibhook

}


% change section titles formatting
\renewcommand{\ABNTEXchapterfont}{\rmfamily\scshape}
\renewcommand{\ABNTEXsectionfont}{\rmfamily\bfseries}
\renewcommand{\ABNTEXsubsectionfont}{\rmfamily\itshape}

% load some other useful packages
\RequirePackage{lastpage}
\RequirePackage{indentfirst}

\RequirePackage{esdiff}
\RequirePackage[noprefix]{nomencl}

% with this command, figures in a 'fig' folder can be used as if they were in the top level folder
\graphicspath{{fig/}}

% commands to configure pdf printing
\newcommand{\configurepdf}{
\hypersetup{
  pdftitle={\@title}, 
  pdfauthor={\@author},
  pdfsubject={\imprimirpreambulo},
  pdfcreator={LaTeX with abnTeX2},
  colorlinks=true,       		% false: boxed links; true: colored links
  linkcolor=black,          	% color of internal links
  citecolor=black,        		% color of links to bibliography
  filecolor=black,      		% color of file links
  urlcolor=black,
  bookmarksdepth=4
}}

% these commands print cover and "list of ..." elements and automatically add PDf bookmarks to it


\newcommand{\printcover}{%
\pdfbookmark[0]{\covername}{cover}%
\imprimircapa}

\newcommand{\printlof}{%
\pdfbookmark[0]{\listfigurename}{lof}%
\listoffigures*%
\cleardoublepage}

\newcommand{\printlot}{%
\pdfbookmark[0]{\listtablename}{lot}%
\listoftables*%
\cleardoublepage}

\newcommand{\printlos}{%
\renewcommand{\nomname}{\listadesimbolosname}%
\pdfbookmark[0]{\nomname}{las}%
\printnomenclature%
\cleardoublepage}

\newcommand{\printtoc}{%
\pdfbookmark[0]{\contentsname}{toc}%
\tableofcontents*%
\cleardoublepage}

