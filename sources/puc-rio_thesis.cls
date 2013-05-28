
% ====================================================
%   puc-rio_thesis.cls
%
%   LaTeX document class for PUC-Rio theses written in english.
% -----------------------------------------------------------------
%   Authors:
%   Americo Barbosa da Cunha Junior --- americo.cunhajr@gmail.com
%   Thomas Lewiner --- lewiner@gmail.com
%   Marcelo Roberto Jimenez
%
%   last update: July 14, 2012
% -----------------------------------------------------------------
%   This document class is free: you can redistribute it and/or modify it,
%   but any any modified versions of this file must be renamed with new
%   filenames distinct from  'puc-rio_thesis.cls'.
%   This document class is distributed in the hope that it will be useful,
%   but WITHOUT ANY WARRANTY; without even the implied warranty of
%   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. 
% ====================================================



% -----------------------------------------------------------------
% version control
% -----------------------------------------------------------------
\newcommand{\docdate}{}
\newcommand{\filedate}{}
\newcommand{\fileversion}{}
\renewcommand{\docdate}{2012/06/08}
\renewcommand{\filedate}{2012/06/08}
\renewcommand{\fileversion}{3.14159265358}
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{puc-rio_thesis}
[\filedate\space v\fileversion\space 
LaTeX document class for PUC-Rio theses written in english]
% -----------------------------------------------------------------



% -----------------------------------------------------------------
% style options
% -----------------------------------------------------------------

% booleans
\makeatletter
\RequirePackage{ifthen}

% hyphenation
\RequirePackage[english,brazil]{babel}

% Doctoral Thesis or Master Dissertation
\newboolean{puc@dsc}
\setboolean{puc@dsc}{false}
\DeclareOption{msc}{\setboolean{puc@dsc}{false}}
\DeclareOption{dsc}{\setboolean{puc@dsc}{true}}

% Thesis Proposal or Dissertation Proposal
\newboolean{puc@prop}
\setboolean{puc@prop}{false}
\DeclareOption{prop}{\setboolean{puc@prop}{true}}

% tight or wide page layout
\newboolean{puc@tight}
\setboolean{puc@tight}{false}
\DeclareOption{wide}{\setboolean{puc@tight}{false}}
\DeclareOption{tight}{\setboolean{puc@tight}{true}}

% hyphenation
\DeclareOption{american,english,brasil,brazil,portugues,portuguese,french,german}
{\PassOptionsToPackage{\CurrentOption}{babel}}

% twoside
\newboolean{puc@twoside}
\setboolean{puc@twoside}{false}
\DeclareOption{twoside}{\setboolean{puc@twoside}{true}}
\DeclareOption{oneside}{\setboolean{puc@twoside}{false}}

% autolabel
\newboolean{puc@autolabel}
\setboolean{puc@autolabel}{false}
\DeclareOption{autolabel}{\setboolean{puc@autolabel}{true}}
\DeclareOption{noautolabel}{\setboolean{puc@autolabel}{false}}

% cover
\newboolean{puc@cover}
\setboolean{puc@cover}{false}
\DeclareOption{cover}{\setboolean{puc@cover}{true}}
\DeclareOption{nocover}{\setboolean{puc@cover}{false}}

% draft for debugging overful boxes
\newboolean{puc@draft}
\setboolean{puc@draft}{false}
\DeclareOption{draft}{\setboolean{puc@draft}{true}}

% nomenclarure
\newboolean{puc@nomencl}
\setboolean{puc@nomencl}{false}
\DeclareOption{nomencl}{\setboolean{puc@nomencl}{true}}
\DeclareOption{nonomencl}{\setboolean{puc@nomencl}{false}}

% bibliography
\newboolean{puc@bibkey}
\setboolean{puc@bibkey}{false}
\DeclareOption{bibkey}{\setboolean{puc@bibkey}{true}}
\DeclareOption{bibnum}{\setboolean{puc@bibkey}{false}}

% Linux/Mac/Windows
\newboolean{puc@unix}
\setboolean{puc@unix}{false}
\DeclareOption{linux}{\setboolean{puc@unix}{true}}
\DeclareOption{mac}{\setboolean{puc@unix}{true}}
\DeclareOption{win}{\setboolean{puc@unix}{false}}

% twoside
\newboolean{puc@links}
\setboolean{puc@links}{false}
\DeclareOption{links}{\setboolean{puc@links}{true}}

\ProcessOptions\relax
% -----------------------------------------------------------------



% -----------------------------------------------------------------
% base style
% -----------------------------------------------------------------
\ifthenelse{\boolean{puc@twoside}}
{
   \LoadClass[a4paper,12pt\ifpuc@draft,draft\else\fi]{book}
   \raggedbottom
}
{
   \LoadClass[a4paper,12pt\ifpuc@draft,draft\else\fi]{report}
}
\makeatother
% -----------------------------------------------------------------



% -----------------------------------------------------------------
% required packages
% -----------------------------------------------------------------

\ifthenelse{\boolean{puc@links}}
{
  \RequirePackage[dvipdfm,colorlinks=false,bookmarksopen=true,breaklinks=true]{hyperref}
}
{
  \RequirePackage[dvipdfm]{hyperref}
  \RequirePackage{nohyperref}  % This makes hyperref commands do nothing without errors
  \RequirePackage{url}
}

% fonts and symbols
\RequirePackage{amsfonts}
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{ae}
\RequirePackage{aecompl}

% graphics inclusion (in particular the PUC-Rio logo)
\RequirePackage{graphicx}
%\RequirePackage{epstopdf}

%\ifpdf
%  \RequirePackage[pdftex]{graphicx}
%\else
%  \RequirePackage[dvipdfm]{graphicx}
%\fi

% subfigure loaded here for spacing definition
\RequirePackage[FIGBOTCAP,TABBOTCAP]{subfigure}

% section titles
\RequirePackage[clearempty,compact]{titlesec}

% table of contents
\RequirePackage[subfigure]{tocloft}

% nomenclature
\RequirePackage{nomencl}

% actively change margins
\RequirePackage{chngpage}

% line spacing
\RequirePackage{setspace}

% header and footer
\RequirePackage{fancyhdr}

% front matter inclusion and space in environment
\RequirePackage{atbeginend}

% indent first line of sections and chapters
%\RequirePackage{indentfirst}

% number of pages
\RequirePackage{lastpage}




% hyperlink and pdf bookmarks
%\ifpdf
%	\RequirePackage[dvipdfm,colorlinks=false,bookmarksopen=true,breaklinks=true]{hyperref} % backref,
	%linkcolor=blue,anchorcolor=black,citecolor=cyan,urlcolor=red,pagecolor=black,bookmarksnumbered=false,
%\else
%	\RequirePackage[colorlinks=false,bookmarksopen=true,breaklinks=true]{hyperref} % backref,
%	%linkcolor=blue,anchorcolor=black,citecolor=cyan,urlcolor=red,pagecolor=black,bookmarksnumbered=false,
%\fi

\selectlanguage{english}
\makeatletter
% -----------------------------------------------------------------



% -----------------------------------------------------------------
% page layout
% -----------------------------------------------------------------
\setlength{\parindent}{1cm}
\setlength{\voffset}{-1in}
\setlength{\topmargin}{20pt}
\setlength{\topskip}{0.001cm}
\addtolength{\headheight}{2.5pt}

\newcommand{\puc@setallmargins}[5]
{
 % declare length
 \expandafter\newlength\csname puc@topmargin@#1\endcsname
 \expandafter\newlength\csname puc@bottommargin@#1\endcsname
 \expandafter\newlength\csname puc@leftmargin@#1\endcsname
 \expandafter\newlength\csname puc@rightmargin@#1\endcsname
 \expandafter\newlength\csname puc@textwidth@#1\endcsname
 \expandafter\newlength\csname puc@oddsidemargin@#1\endcsname
 \expandafter\newlength\csname puc@evensidemargin@#1\endcsname
 \expandafter\newlength\csname puc@textheight@#1\endcsname
 \expandafter\newlength\csname puc@headsep@#1\endcsname

 % adjust margins
 \expandafter\setlength{\csname puc@topmargin@#1\endcsname}{#2}
 \expandafter\setlength{\csname puc@bottommargin@#1\endcsname}{#3}
 \expandafter\setlength{\csname puc@leftmargin@#1\endcsname}{#4}
 \expandafter\setlength{\csname puc@rightmargin@#1\endcsname}{#5}

 % converts margins to text size
 \expandafter\setlength{\csname puc@textwidth@#1\endcsname}{\paperwidth}
 \expandafter\addtolength{\csname puc@textwidth@#1\endcsname}{-\csname puc@leftmargin@#1\endcsname}
 \expandafter\addtolength{\csname puc@textwidth@#1\endcsname}{-\csname puc@rightmargin@#1\endcsname}

 \expandafter\setlength{\csname puc@oddsidemargin@#1\endcsname}{\csname puc@leftmargin@#1\endcsname}
 \expandafter\addtolength{\csname puc@oddsidemargin@#1\endcsname}{-1in}
 \expandafter\addtolength{\csname puc@oddsidemargin@#1\endcsname}{-\hoffset}

 \ifthenelse{\boolean{puc@twoside}}
 {
   \expandafter\setlength{\csname puc@evensidemargin@#1\endcsname}{\csname puc@rightmargin@#1\endcsname}%
 }
 {
   \expandafter\setlength{\csname puc@evensidemargin@#1\endcsname}{\csname puc@leftmargin@#1\endcsname}%
 }
 \expandafter\addtolength{\csname puc@evensidemargin@#1\endcsname}{-1in}
 \expandafter\addtolength{\csname puc@evensidemargin@#1\endcsname}{-\hoffset}

 \expandafter\setlength{\csname puc@headsep@#1\endcsname}{\csname puc@topmargin@#1\endcsname}
 \expandafter\addtolength{\csname puc@headsep@#1\endcsname}{-1in}
 \expandafter\addtolength{\csname puc@headsep@#1\endcsname}{-\voffset}
 \expandafter\addtolength{\csname puc@headsep@#1\endcsname}{-\topmargin}
 \expandafter\addtolength{\csname puc@headsep@#1\endcsname}{-\headheight}

 \expandafter\setlength{\csname puc@textheight@#1\endcsname}{\paperheight}
 \expandafter\addtolength{\csname puc@textheight@#1\endcsname}{-\csname puc@topmargin@#1\endcsname}
 \expandafter\addtolength{\csname puc@textheight@#1\endcsname}{-\csname puc@bottommargin@#1\endcsname}

 % dynamic margin adjustment
 \expandafter\newcommand\csname puc@setmargins@#1\endcsname
 {
   \setpage
   {\csname puc@textheight@#1\endcsname}
   {\csname puc@textwidth@#1\endcsname}
   {\csname puc@evensidemargin@#1\endcsname}
   {\csname puc@oddsidemargin@#1\endcsname}
   {}{}{}
   {\csname puc@headsep@#1\endcsname}
   {}
 }
}

% text
\ifthenelse{\boolean{puc@tight}}
{
   \puc@setallmargins{text}{2.5cm}{2.5cm}{3.5cm}{7.0cm}
}
{
   \puc@setallmargins{text}{2.5cm}{2.5cm}{3.0cm}{4.0cm}
}

% cover
\puc@setallmargins{cover}{7.0cm}{3.0cm}{7.0cm}{2.0cm}

% front
\puc@setallmargins{front}{2.5cm}{2.5cm}{6.0cm}{4.0cm}

% dedication
\puc@setallmargins{dedication}{2.5cm}{2.5cm}{3.0cm}{4.0cm}
% -----------------------------------------------------------------



% -----------------------------------------------------------------
% to debug the layout
% -----------------------------------------------------------------
%\newcommand{\puc@leftmargin}[1]{\noindent\fbox{\begin{minipage}[top]{\textwidth}#1\end{minipage}}}
%\newcommand{\puc@rightmargin}[1]{\noindent\fbox{\begin{minipage}[top]{\textwidth}\begin{flushright}#1\end{flushright}\end{minipage}}}

\newcommand{\puc@leftmargin}[1]{\noindent\begin{minipage}[top]{\textwidth}#1\end{minipage}}
\newcommand{\puc@rightmargin}[1]{\puc@leftmargin{\begin{flushright}#1\end{flushright}}}
% -----------------------------------------------------------------



% -----------------------------------------------------------------
% line spacing
% -----------------------------------------------------------------
\ifthenelse{\boolean{puc@tight}}{}{\onehalfspacing}
\frenchspacing
\clubpenalty=2000
\emergencystretch=20pt
\pretolerance=500
\tolerance=2500
\widowpenalty=2000
% -----------------------------------------------------------------



% -----------------------------------------------------------------
% number of floats per page
% -----------------------------------------------------------------
\renewcommand{\floatpagefraction}{.7}
\renewcommand{\topfraction}{.7}
\renewcommand{\bottomfraction}{.7}
\renewcommand{\textfraction}{.3}
\setcounter{totalnumber}{10}
\setcounter{topnumber}{10}
\setcounter{bottomnumber}{10}
% -----------------------------------------------------------------



% -----------------------------------------------------------------
% subfigures
% -----------------------------------------------------------------
\renewcommand{\thesubfigure}{\thefigure (\alph{subfigure})}
\renewcommand{\@thesubfigure}{\thesubfigure:\space}
\renewcommand{\p@subfigure}{}
% -----------------------------------------------------------------



% -----------------------------------------------------------------
% fonts
% -----------------------------------------------------------------
\newcommand{\arial}{\sf}
% -----------------------------------------------------------------



% -----------------------------------------------------------------
% section titles
% -----------------------------------------------------------------
\newcommand{\noaccent}[1]{
 \begingroup
  \inputencoding{noaccent}
  \renewcommand{\`}[1]{#1}
  \renewcommand{\'}[1]{#1}
  \renewcommand{\^}[1]{#1}
  \renewcommand{\~}[1]{#1}
  \renewcommand{\=}[1]{#1}
  \renewcommand{\.}[1]{#1}
  \renewcommand{\"}[1]{#1}
  \renewcommand{\c}[1]{#1}
  \renewcommand{\u}[1]{#1}
  \renewcommand{\v}[1]{#1}
  \renewcommand{\H}[1]{#1}
  \renewcommand{\c}[1]{#1}
  \renewcommand{\d}[1]{#1}
  \renewcommand{\b}[1]{#1}
  \renewcommand{\t}[1]{#1}
  \renewcommand{\ref}[1]{#1}
  \renewcommand{\-}{}
  \renewcommand{\aa}{a}
  \renewcommand{\AA}{A}
  \renewcommand{\o}{o}
  \renewcommand{\O}{o}
  \renewcommand{\l}{l}
  \renewcommand{\L}{L}
  \renewcommand{\i}{i}
  \renewcommand{\j}{j}
  \renewcommand{\oe}{oe}
  \renewcommand{\OE}{OE}
  \renewcommand{\ae}{ae}
  \renewcommand{\AE}{AE}
  \renewcommand{\mathrm}[1]{#1}
  \renewcommand{\mathit}[1]{#1}
  \renewcommand{\mathnormal}[1]{#1}
  \renewcommand{\mathcal}[1]{#1}
  \renewcommand{\mathfrak}[1]{#1}
  \renewcommand{\mathbb}[1]{#1}
  \renewcommand{\textrm}[1]{#1}
  \renewcommand{\textsf}[1]{#1}
  \renewcommand{\texttt}[1]{#1}
  \renewcommand{\textmd}[1]{#1}
  \renewcommand{\textbf}[1]{#1}
  \renewcommand{\textup}[1]{#1}
  \renewcommand{\textit}[1]{#1}
  \renewcommand{\textsl}[1]{#1}
  \renewcommand{\textsc}[1]{#1}
  \renewcommand{\emph}[1]{#1}
  \renewcommand{\textnormal}[1]{#1}
  \renewcommand{\rm}{}
  \renewcommand{\sf}{}
  \renewcommand{\tt}{}
  \renewcommand{\bf}{}
  \renewcommand{\it}{}
  \renewcommand{\sl}{}
  \renewcommand{\sc}{}
  \renewcommand{\bfseries}{}
  \renewcommand{\itshape}{}
  \renewcommand{\mdseries}{}
  \renewcommand{\rmfamily}{}
  \renewcommand{\scshape}{}
  \renewcommand{\sffamily}{}
  \renewcommand{\slshape}{}
  \renewcommand{\ttfamily}{}
  \renewcommand{\upshape}{}
  \renewcommand{\Large}[1]{#1}
  \renewcommand{\tiny}[1]{#1}
  \renewcommand{\scriptsize}[1]{#1}
  \renewcommand{\LARGE}[1]{#1}
  \renewcommand{\footnotesize}[1]{#1}
  \renewcommand{\small}[1]{#1}
  \renewcommand{\huge}[1]{#1}
  \renewcommand{\normalsize}[1]{#1}
  \renewcommand{\large}[1]{#1}
  \renewcommand{\Huge}[1]{#1}
  \renewcommand{\\}{}
  \renewcommand{\$}{}
  \renewcommand{\_}{}
  \renewcommand{\backslash}{}
  #1
 \endgroup
}

\ifthenelse{\boolean{puc@autolabel}}
{\newcommand{\autolabel}[1]{\noaccent{\label{sec:#1}}#1}}
{\newcommand{\autolabel}[1]{#1}}

\titleformat{name=\chapter}
   [display]
   {\singlespacing\large\arial\bfseries}
   {\thechapter}
   {0pt}
   {\autolabel}
\titleformat{name=\section}
   [display]
   {\penalty -5000\singlespacing\normalsize\arial\bfseries}
   {\thesection}
   {0pt}
   {\autolabel}
\titleformat{name=\section,numberless}
   [display]
   {\penalty -5000\singlespacing\normalsize\arial\bfseries}
   {}
   {0pt}
   {}
\titleformat{name=\subsection}
   [display]
   {\penalty -4000\singlespacing\normalsize\arial\bfseries}
   {\thesubsection}
   {0pt}
   {\autolabel}
\titleformat{name=\subsection,numberless}
   [display]
   {\penalty -4000\singlespacing\normalsize\arial\bfseries}
   {}
   {0pt}
   {}
\titleformat{name=\subsubsection}
   [display]
   {\penalty -3000\singlespacing\normalsize\arial\bfseries}
   {\thesubsubsection}
   {0pt}
   {\autolabel}
\titleformat{name=\paragraph}
   [runin]
   {\singlespacing\normalsize\arial\bfseries}
   {2\wordsep}
   {}
   {}
\titleformat{name=\subparagraph}
   [runin]
   {\singlespacing\normalsize\arial\bfseries}
   {2\wordsep}
   {}
   {}
% -----------------------------------------------------------------



% -----------------------------------------------------------------
% page styles
% -----------------------------------------------------------------
\makeatletter
\newcommand{\puc@setpagestyle}
{
   \pagestyle{fancy}
   % delete current setting for header and footer
   \fancyhf{}
   \fancyfoot{}
   \ifthenelse{\boolean{puc@twoside}}
   {
      \fancyhead[LE]{\slshape \nouppercase{\leftmark}}
      \fancyhead[RE]{\thepage}
      \fancyhead[LO]{\thepage}
      \fancyhead[RO]{\itshape \nouppercase{\rightmark}}
   }
   {
      \fancyhead[L]{\slshape \nouppercase{\leftmark}}
      \fancyhead[R]{\thepage}
   }
   \renewcommand{\headrulewidth}{0pt}
}
\fancypagestyle{empty}{\fancyhead{} \fancyfoot{} \renewcommand{\headrulewidth}{0pt}}
\fancypagestyle{plain}{\fancyhead{} \fancyfoot{} \renewcommand{\headrulewidth}{0pt}}
% -----------------------------------------------------------------



% -----------------------------------------------------------------
% table of contents
% -----------------------------------------------------------------
\setcounter{tocdepth}{3}
\setcounter{lofdepth}{1}
\setcounter{lotdepth}{1}
\renewcommand{\cfttoctitlefont}{\large \arial \bfseries}
\setlength{\cftbeforetoctitleskip}{0pt}
\renewcommand{\cftloftitlefont}{\large \arial \bfseries}
\setlength{\cftbeforeloftitleskip}{0pt}
\renewcommand{\cftlottitlefont}{\large \arial \bfseries}
\setlength{\cftbeforelottitleskip}{0pt}
\renewcommand{\cftdot}{}
\renewcommand{\cftsecfont}{}
\setlength{\cftbeforesecskip}{3pt}
\setlength{\cftbeforesubsecskip}{0pt}
\setlength{\cftchapnumwidth}{1.9em}
\setlength{\cftsecnumwidth}{2.5em}
\setlength{\cftsubsecnumwidth}{3.1em}
\setlength{\cftfignumwidth}{3.0em}
\renewcommand{\cftchapindent}{0pt}
\renewcommand{\cftsecindent}{0pt}
\renewcommand{\cftsubsecindent}{0pt}
\renewcommand{\cftchapfont}{\arial}
\renewcommand{\cftsecfont}{\arial}
\newcommand{\blanktext}[1]{\csname#1}
\renewcommand{\cftsubsecpresnum}{\blanktext}
\renewcommand{\cftsubsecaftersnum}{\endcsname}
\renewcommand{\cftsubsecfont}{\footnotesize\arial\itshape}
\renewcommand{\cftsubsecpagefont}{\footnotesize\arial\itshape}
\renewcommand{\cftfigfont}{\arial}
\renewcommand{\cfttabfont}{\arial}
% -----------------------------------------------------------------



% -----------------------------------------------------------------
% citations
% -----------------------------------------------------------------
\def\@cite#1#2{[{#1\if@tempswa , #2\fi}]}
% -----------------------------------------------------------------



% -----------------------------------------------------------------
% theorems environments
% -----------------------------------------------------------------
\renewcommand{\theequation}{\thechapter.\arabic{equation}}
\newtheorem{definition}{Definition}
\newtheorem{theorem}[definition]{Theorem}
\newtheorem{proposition}[definition]{Proposition}
\newtheorem{corollary}[definition]{Corollary}
\newtheorem{lemma}[definition]{Lemma}
\newenvironment{proof}[1][]{\par \noindent \textit{Proof#1}:\hspace*{1em}}{\hfill $\blacksquare$}
% -----------------------------------------------------------------



% -----------------------------------------------------------------
% space in environment
% -----------------------------------------------------------------
\AfterBegin{itemize}{\addtolength{\itemsep}{-0.5em}}
\renewcommand{\labelitemi}{--}
\BeforeBegin{equation}{\vspace{-0.5em}}
\BeforeEnd{equation}{\vspace{-0.5em}}
\BeforeBegin{theorem}{\vspace{-0.4em}}
\BeforeEnd{theorem}{\vspace{-0.2em}}
\BeforeBegin{definition}{\vspace{-0.4em}}
\BeforeEnd{definition}{\vspace{-0.2em}}
\BeforeBegin{corollary}{\vspace{-0.4em}}
\BeforeEnd{corollary}{\vspace{-0.2em}}
\BeforeBegin{proposition}{\vspace{-0.4em}}
\BeforeEnd{proposition}{\vspace{-0.2em}}
% -----------------------------------------------------------------



% -----------------------------------------------------------------
% front matter elements
% -----------------------------------------------------------------
\makeatletter

\newcommand{\puc@author}{}
\renewcommand{\author}[1]{\renewcommand{\puc@author}{#1}}

\newcommand{\puc@authorR}{}
\newcommand{\authorR}[1]{\renewcommand{\puc@authorR}{#1}}

\newcommand{\puc@advisor}{}
\newcommand{\advisor}[1]{\renewcommand{\puc@advisor}{#1}}

\newcommand{\puc@advisorR}{}
\newcommand{\advisorR}[1]{\renewcommand{\puc@advisorR}{#1}}

\newcommand{\puc@advisorInst}{}
\newcommand{\advisorInst}[1]{\renewcommand{\puc@advisorInst}{#1}}

\newcommand{\puc@coadvisor}{}
\newcommand{\coadvisor}[1]{\renewcommand{\puc@coadvisor}{#1}}

\newcommand{\puc@coadvisorR}{}
\newcommand{\coadvisorR}[1]{\renewcommand{\puc@coadvisorR}{#1}}

\newcommand{\puc@coadvisorInst}{}
\newcommand{\coadvisorInst}[1]{\renewcommand{\puc@coadvisorInst}{#1}}

\newcommand{\puc@coadvisorII}{}
\newcommand{\coadvisorII}[1]{\renewcommand{\puc@coadvisorII}{#1}}

\newcommand{\puc@coadvisorIIR}{}
\newcommand{\coadvisorIIR}[1]{\renewcommand{\puc@coadvisorIIR}{#1}}

\newcommand{\puc@coadvisorIIInst}{}
\newcommand{\coadvisorIIInst}[1]{\renewcommand{\puc@coadvisorIIInst}{#1}}

\newcommand{\puc@coadvisorIII}{}
\newcommand{\coadvisorIII}[1]{\renewcommand{\puc@coadvisorIII}{#1}}

\newcommand{\puc@coadvisorIIIR}{}
\newcommand{\coadvisorIIIR}[1]{\renewcommand{\puc@coadvisorIIIR}{#1}}

\newcommand{\puc@coadvisorIIIInst}{}
\newcommand{\coadvisorIIIInst}[1]{\renewcommand{\puc@coadvisorIIIInst}{#1}}

\newcommand{\puc@title}{}
\renewcommand{\title}[1]{\renewcommand{\puc@title}{#1}}

\newcommand{\puc@titleBR}{}
\newcommand{\titleBR}[1]{\renewcommand{\puc@titleBR}{#1}}

\newcommand{\puc@subtitle}{}
\newcommand{\subtitle}[1]{\renewcommand{\puc@subtitle}{#1}}

\newcommand{\puc@subtitleBR}{}
\newcommand{\subtitleBR}[1]{\renewcommand{\puc@subtitleBR}{#1}}

\newcommand{\puc@day}{}
\renewcommand{\day}[1]{\renewcommand{\puc@day}{#1}}

\newcommand{\puc@month}{}
\renewcommand{\month}[1]{\renewcommand{\puc@month}{#1}}

\newcommand{\puc@year}{}
\renewcommand{\year}[1]{\renewcommand{\puc@year}{#1}}

\newcommand{\puc@city}{Rio de Janeiro}
\newcommand{\city}[1]{\renewcommand{\puc@city}{#1}}

\newcommand{\puc@department}{}
\newcommand{\department}[1]{\renewcommand{\puc@department}{#1}}

\newcommand{\puc@program}{}
\newcommand{\program}[1]{\renewcommand{\puc@program}{#1}}

\newcommand{\puc@programBR}{}
\newcommand{\programBR}[1]{\renewcommand{\puc@programBR}{#1}}

\newcommand{\puc@school}{}
\newcommand{\school}[1]{\renewcommand{\puc@school}{#1}}

\newcommand{\puc@university}{Pontif\'{i}cia Universidade Cat\'{o}lica do Rio de Janeiro}
\newcommand{\university}[1]{\renewcommand{\puc@university}{#1}}

\newcommand{\puc@uni}{PUC--Rio}
\newcommand{\uni}[1]{\renewcommand{\puc@uni}{#1}}

\newcommand{\puc@CDD}{}
\newcommand{\CDD}[1]{\renewcommand{\puc@CDD}{#1}}

\newcommand{\jurymember}[2]{}
\newcommand{\jurymemberDr}[2]{}
\newcommand{\schoolhead}[1]{\jurymember{#1}{Coordinator of the \puc@school\ \\ \puc@university}}
\newcommand{\puc@jury}{}
\newcommand{\jury}[1]{\renewcommand{\puc@jury}{#1}}

\newcommand{\puc@resume}{}
\newcommand{\resume}[1]{\renewcommand{\puc@resume}{#1}}

\newboolean{hasdedication}
\setboolean{hasdedication}{false}
\newcommand{\puc@dedication}{}
\newcommand{\dedication}[1]
{
   \renewcommand{\puc@dedication}{#1}
   \setboolean{hasdedication}{true}
}

\newcommand{\puc@acknowledgment}{}
\newcommand{\acknowledgment}[1]{\renewcommand{\puc@acknowledgment}{#1}}

\newcommand{\key}[1]{}
\newcommand{\puc@keywords}{}
\newcommand{\keywords}[1]{\renewcommand{\puc@keywords}{#1}}

\newcommand{\puc@abstract}{}
\ifthenelse{\boolean{puc@twoside}}
{
   \newcommand{\abstract}[1]{\renewcommand{\puc@abstract}{#1}}
}
{
   \renewcommand{\abstract}[1]{\renewcommand{\puc@abstract}{#1}}
}

\newcommand{\puc@keywordsBR}{}
\newcommand{\keywordsBR}[1]{\renewcommand{\puc@keywordsBR}{#1}}

\newcommand{\puc@abstractBR}{}
\newcommand{\abstractBR}[1]{\renewcommand{\puc@abstractBR}{#1}}

\newcommand{\puc@tablesmode}{figtab}
\newcommand{\tablesmode}[1]{\renewcommand{\puc@tablesmode}{#1}}

\newboolean{hasepigraph}
\setboolean{hasepigraph}{false}
\newcommand{\puc@epigraph}{}
\newcommand{\epigraph}[1]
{
   \renewcommand{\puc@epigraph}{#1}
   \setboolean{hasepigraph}{true}
}

\newcommand{\puc@epigraphauthor}{}
\newcommand{\epigraphauthor}[1]{\renewcommand{\puc@epigraphauthor}{#1}}

\newcommand{\puc@epigraphbook}{}
\newcommand{\epigraphbook}[1]{\renewcommand{\puc@epigraphbook}{#1}}
% -----------------------------------------------------------------



% -----------------------------------------------------------------
% cover
% -----------------------------------------------------------------
\newcommand{\puc@showcover}
{
   \puc@setmargins@cover
   \thispagestyle{empty}
   \pdfbookmark[0]{Cover}{anchor:cover}
   \singlespacing \arial
   \begin{titlepage}
      \setcounter{page}{0}
      \renewcommand{\baselinestretch}{1.2}
      \puc@rightmargin{\LARGE \arial \textbf{\puc@author} \normalsize}
      \vspace*{\stretch{4}}
      \par
      \puc@rightmargin{\LARGE \arial \textbf{\puc@title\relax} \normalsize}
      \ifthenelse{ \equal{\puc@subtitle}{} }
      {}
      {
         \vspace*{\stretch{0.5}}
         \par
         \puc@rightmargin{\LARGE \arial \puc@subtitle\relax \normalsize}
      }
      \vspace*{\stretch{5}}
      \par
      \puc@rightmargin
      { 
         \Large \arial
         \textbf
         {
            \ifthenelse{ \boolean{puc@prop} }
            {	
               \ifthenelse{ \boolean{puc@dsc} }
               {PROPOSTA DE TESE DE DOUTORADO}
               {PROPOSTA DE DISSERTA\c{C}\~{A}O DE MESTRADO}
            }
            {
               \ifthenelse{ \boolean{puc@dsc} }
               {TESE DE DOUTORADO}
               {DISSERTA\c{C}\~{A}O DE MESTRADO}
            }
         }
      }
      \vspace*{\stretch{1.5}}
      \par
      \puc@rightmargin{\textbf{DEPARTAMENTO DE \MakeUppercase{\puc@department}}}
      \vspace*{\stretch{0.5}}
      \par
      \renewcommand{\baselinestretch}{1.0}
      \puc@rightmargin{\Large \arial Programa de Pós-Graduação em \puc@program}
      \vspace*{\stretch{9}}
      \par
      \puc@rightmargin{\normalsize \arial \puc@city \\ \puc@month\ \puc@year}
   \end{titlepage}
   \setcounter{page}{1}
}
% -----------------------------------------------------------------



% -----------------------------------------------------------------
% front page
% -----------------------------------------------------------------
\newcommand{\puc@showfront}
{
   \cleardoublepage
   \puc@setmargins@front
   \thispagestyle{empty}
   \pdfbookmark[0]{Front Page}{anchor:front}
   \singlespacing \arial
   \ifpdf
		\puc@rightmargin{\includegraphics{puc_logo.pdf}}
	\else
  		\puc@rightmargin{\includegraphics{puc_logo.eps}}
	\fi
   \vspace*{\stretch{1}}
   \par
   \puc@rightmargin{\large \arial \textbf{\puc@author} \normalsize}
   \vspace*{\stretch{4}}
   \par
   \puc@rightmargin{\large \arial \textbf{\puc@title\relax} \normalsize}
   \ifthenelse{ \equal{\puc@subtitle}{} }
   {}
   {
      \vspace*{\stretch{0.5}}
      \par
      \puc@rightmargin{\arial \textbf{\puc@subtitle} \relax}
   }
   \vspace*{\stretch{5}}
   \par
   \puc@rightmargin
   {
      \arial
      \textbf
      {
         \ifthenelse{ \boolean{puc@prop} }
         {
            \ifthenelse{ \boolean{puc@dsc} }
            {Proposta de Tese de Doutorado}
            {Proposta de Disserta\c{c}\~{a}o de Mestrado}
         }
         {
            \ifthenelse{ \boolean{puc@dsc} }
            {Tese de Doutorado}
            {Disserta\c{c}\~{a}o de Mestrado}
         }
      }
   }
   \vspace*{\stretch{1.5}}
   \par
   \puc@leftmargin
   {
      \arial
      \ifthenelse{ \boolean{puc@prop} }
      {
         \ifthenelse{ \boolean{puc@dsc} }
         {
            \mbox{Thesis} \mbox{Proposal} \mbox{presented} to the \mbox{Programa de Pós-Graduação} em \puc@program\ of the Departamento de \puc@department, \puc@uni\ as \mbox{partial} \mbox{fulfillment} of the \mbox{requirements} for the \mbox{degree} of \mbox{Doutor} em \puc@programBR.
         }
         {
            \mbox{Dissertation} \mbox{Proposal} \mbox{presented} to the \mbox{Programa de Pós-Graduação} em \puc@program\ of the Departamento de \puc@department, \puc@uni\ as \mbox{partial} \mbox{fulfillment} of the \mbox{requirements} for the \mbox{degree} of \mbox{Mestre} em \puc@programBR.
         }
      }
      {
         \ifthenelse{ \boolean{puc@dsc} }
         {
            \mbox{Thesis} \mbox{presented} to the \mbox{Programa de Pós-Graduação} em \puc@program\ of the Departamento de \puc@department, \puc@uni\ as \mbox{partial} \mbox{fulfillment} of the \mbox{requirements} for the \mbox{degree} of \mbox{Doutor}~em~\puc@programBR.
         }
         {
            \mbox{Dissertation} \mbox{presented} to the \mbox{Programa de Pós-Graduação} em \puc@program\ of the Departamento de \puc@department, \puc@uni\ as \mbox{partial} \mbox{fulfillment} of the \mbox{requirements} for the \mbox{degree} of \mbox{Mestre}~em~\puc@programBR.
         }
      }
   }
   \vspace*{\stretch{1}}
   \par
   \puc@rightmargin
   {
      \begin{tabular}{l@{: }r}
         Advisor & Prof. \puc@advisor
         \ifthenelse{ \equal{\puc@coadvisor}{} }
         {}
         {
            \\ Co--Advisor & Prof. \puc@coadvisor
         }
         \ifthenelse{ \equal{\puc@coadvisorII}{} }
         {}
         {
            \\ Co--Advisor & Prof. \puc@coadvisorII
         }
         \ifthenelse{ \equal{\puc@coadvisorIII}{} }
         {}
         {
            \\ Co--Advisor & Prof. \puc@coadvisorIII
         }
      \end{tabular}
   }
   \vspace*{\stretch{6}}
   \par
   \puc@rightmargin{\puc@city \\ \puc@month\ \puc@year}
}
% -----------------------------------------------------------------



% -----------------------------------------------------------------
% jury
% -----------------------------------------------------------------
\newcommand{\puc@showjury}
{
   \cleardoublepage
   \puc@setmargins@front
   \thispagestyle{empty}
   \pdfbookmark[0]{Jury}{anchor:jury}
   \singlespacing \arial
   \ifpdf
		\puc@rightmargin{\includegraphics{puc_logo.pdf}}
	\else
  		\puc@rightmargin{\includegraphics{puc_logo.eps}}
	\fi
   \vspace*{\stretch{0.5}}
   \par
   \puc@rightmargin{\large \arial \textbf{\puc@author} \normalsize}
   \vspace*{\stretch{1}}
   \par
   \puc@rightmargin{\large \arial \textbf{\puc@title\relax} \normalsize}
   \ifthenelse{ \equal{\puc@subtitle}{} }
   {}
   {
      \vspace*{\stretch{0.1}}
      \par
      \puc@rightmargin{\arial \textbf{\puc@subtitle} \relax}
   }
   \vspace*{\stretch{1.5}}
   \par
   \puc@leftmargin
   {
      \arial
      \ifthenelse{ \boolean{puc@prop} }
      {
         \ifthenelse{ \boolean{puc@dsc} }
         {
            \mbox{Thesis} \mbox{Proposal} \mbox{presented} to the \mbox{Programa de Pós-Graduação} em \puc@program\ of the Departamento de \puc@department, \puc@uni\ as \mbox{partial} \mbox{fulfillment} of the \mbox{requirements} for the \mbox{degree} of \mbox{Doutor} em \puc@programBR.
         }
         {
            \mbox{Dissertation} \mbox{Proposal} \mbox{presented} to the \mbox{Programa de Pós-Graduação} em \puc@program\ of the Departamento de \puc@department, \puc@uni\ as \mbox{partial} \mbox{fulfillment} of the \mbox{requirements} for the \mbox{degree} of \mbox{Mestre} em \puc@programBR.
         }
      }
      {
         \ifthenelse{ \boolean{puc@dsc} }
         {
            \mbox{Thesis} \mbox{presented} to the \mbox{Programa de Pós-Graduação} em \puc@program\ of the Departamento de \puc@department, \puc@uni\ as \mbox{partial} \mbox{fulfillment} of the \mbox{requirements} for the \mbox{degree} of \mbox{Doutor} em \puc@programBR.
         }
         {
            \mbox{Dissertation} \mbox{presented} to the \mbox{Programa de Pós-Graduação} em \puc@program\ of the Departamento de \puc@department, \puc@uni\ as \mbox{partial} \mbox{fulfillment} of the \mbox{requirements} for the \mbox{degree} of \mbox{Mestre} em \puc@programBR.
         }
      }
      \mbox{Approved} by the \mbox{following} \mbox{commission:}
   }
   \vspace*{\stretch{1}}
   \renewcommand{\jurymember}[2]
   {
      \ifthenelse{ \equal{##1}{} }
      {}
      {
         \puc@rightmargin{\textbf{Prof. ##1}\\##2} \vspace*{\stretch{1}} \par
      }
   }
   \renewcommand{\jurymemberDr}[2]
   {
      \ifthenelse{ \equal{##1}{} }
      {}
      {
         \puc@rightmargin{\textbf{Dr. ##1}\\##2} \vspace*{\stretch{1}} \par
      }
   }      
   \par
   \ifthenelse{ \equal{\puc@advisorInst}{} }
   {
      \jurymember{\puc@advisor}{Advisor \\ \puc@university}
   }
   {
      \jurymember{\puc@advisor}{Advisor \\ \puc@advisorInst}
   }
   \ifthenelse{ \equal{\puc@coadvisorInst}{} }
   {
      \jurymember{\puc@coadvisor}{Co--Advisor \\ \puc@university}
   }
   {
      \jurymember{\puc@coadvisor}{Co--Advisor \\ \puc@coadvisorInst}
   }
   \ifthenelse{ \equal{\puc@coadvisorIIInst}{} }
   {
      \jurymember{\puc@coadvisorII}{Co--Advisor \\ \puc@university}
   }
   {
      \jurymember{\puc@coadvisorII}{Co--Advisor \\ \puc@coadvisorIIInst}
   }
   \ifthenelse{ \equal{\puc@coadvisorIIIInst}{} }
   {
      \jurymember{\puc@coadvisorIII}{Co--Advisor \\ \puc@university}
   }
   {
      \jurymember{\puc@coadvisorIII}{Co--Advisor \\ \puc@coadvisorIIIInst}
   }
   \puc@jury
   \puc@rightmargin{\puc@city\ --- \puc@month\ \puc@day, \puc@year}
}
% -----------------------------------------------------------------



% -----------------------------------------------------------------
% copyright
% -----------------------------------------------------------------
\newcommand{\puc@showcopyrights}
{
   \cleardoublepage
   \puc@setmargins@front
   \thispagestyle{empty}
   \pdfbookmark[0]{Copyrights}{anchor:copyrights}
   \singlespacing\arial
   \puc@leftmargin{\normalfont \normalsize All rights reserved. 
    It is forbidden partial or complete \mbox{reproduction} without previous 
    authorization of the university, the author and the advisor.}
   \vspace*{\stretch{2}}
   \par
   \puc@rightmargin{\arial \textbf{\puc@author}}
   \vspace*{\stretch{0.2}}
   \par
   \puc@leftmargin{\normalfont \puc@resume}%
   \vspace*{\stretch{2}}
   \par
   \puc@rightmargin{\small \arial Bibliographic data}
   \par
   \puc@leftmargin
   {
      \begin{tabular}{|p{0.95\linewidth}|}
         \hline
         \noindent \puc@authorR \\ \\ \par
         \hspace*{.6cm} 
         \puc@title\relax\ / \puc@author; 
		 \mbox{advisor:} \puc@advisor
         \ifthenelse{\equal{\puc@coadvisor}{}}{}{; co--advisor\ifthenelse{\equal{\puc@coadvisorII}{}}{}{s}:\puc@coadvisor}
         \ifthenelse{\equal{\puc@coadvisorII}{}}{}{, \puc@coadvisorII}
         \ifthenelse{\equal{\puc@coadvisorIII}{}}{}{, \puc@coadvisorIII}. --- \puc@year. \\
         \hspace*{.6cm} 
         \pageref{LastPage} f. : il. ; 30 cm \\ \\ \par
         \hspace*{.6cm} 
         1.   \ifthenelse{\boolean{puc@dsc}}{Tese (Doutorado em \puc@programBR)}{Disserta\c{c}\~{a}o (Mestrado em \puc@programBR)} - \puc@university, \puc@city, \puc@year. \\ \\
         \hspace*{.6cm} 
         Bibliography included \\ \\ \par
         \hspace*{.6cm}
         \newcounter{keycount}\setcounter{keycount}{1}
         \renewcommand{\key}[1]{\arabic{keycount}. ##1.\addtocounter{keycount}{1}\ }
         \key{\puc@department\ -- Teses}
         \puc@keywordsBR
         \setcounter{keycount}{1}
         \renewcommand{\key}[1]{\ifthenelse{\equal{##1}{}}{}{\Roman{keycount}. ##1.\addtocounter{keycount}{1}\ }}
         \key{\puc@advisorR}
         \key{\puc@coadvisorR}
         \key{\puc@coadvisorIIR}
         \key{\puc@coadvisorIIIR}
         \key{\puc@university. \mbox{Departamento} de \puc@department}
         \key{T\'{\i}tulo}
         \\
         \hline
      \end{tabular}
   }
   \renewcommand{\footnoterule}{}\renewcommand{\@makefnmark}{\relax}
   \footnotetext{\begin{flushright}\normalsize CDD: \puc@CDD \end{flushright}}
   \renewcommand{\@makefnmark}{\@textsuperscript{\normalfont\@thefnmark}}
%   \clearpage
%   \ifthenelse{\boolean{puc@tight}}{}{\onehalfspacing}\normalfont
%   \renewcommand{\footnoterule}{\kern-3\p@\hrule width 2truein \kern 2.6\p@}
}
% -----------------------------------------------------------------



% -----------------------------------------------------------------
% dedication
% -----------------------------------------------------------------
\newcommand{\puc@showdedication}
{
   \cleardoublepage
   \puc@setmargins@dedication
   \markboth{Dedication}{Dedication}
   \thispagestyle{empty}
   \pdfbookmark[0]{Dedication}{anchor:dedication}
   \singlespacing\normalfont
   \vspace*{\stretch{1}}
   \puc@rightmargin{ \puc@dedication }
}
% -----------------------------------------------------------------



% -----------------------------------------------------------------
% acknowledgment
% -----------------------------------------------------------------
\newcommand{\puc@showacknowledgment}
{
   \cleardoublepage
   \puc@setmargins@dedication
   \markboth{Acknowledgements}{Acknowledgements}
   \thispagestyle{empty}
   \pdfbookmark[0]{Acknowledgements}{anchor:acknowledgements}
   \onehalfspacing\normalfont
   \noindent \large \arial \textbf{Acknowledgments}
   \normalfont \normalsize \vspace*{\stretch{1}}
   \par
   \puc@acknowledgment
}
% -----------------------------------------------------------------



% -----------------------------------------------------------------
% abstract
% -----------------------------------------------------------------
\newcommand{\puc@showabstract}
{
   \cleardoublepage
   \puc@setmargins@dedication
   \markboth{Abstract}{Abstract}
   \thispagestyle{empty}
   \singlespacing\normalfont
   \pdfbookmark[0]{Abstract}{anchor:abstract}
   \noindent \large \arial \textbf{Abstract} \normalfont \normalsize
   \vspace{\stretch{3}}
   \par\indent
   \begin{minipage}{12cm}
      \singlespacing
      \puc@authorR; \puc@advisorR\ (Advisor)\ifthenelse{\equal{\puc@coadvisor}{}}{}{; \puc@coadvisorR}\ifthenelse{\equal{\puc@coadvisorII}{}}{}{; \puc@coadvisorIIR}\ifthenelse{\equal{\puc@coadvisorIII}{}}{}{; \puc@coadvisorIIIR}. \textbf{\puc@title}. \puc@city, \puc@year. \pageref{LastPage}p.   \ifthenelse{\boolean{puc@dsc}}{Tese de Doutorado}{Disserta\c{c}\~{a}o de Mestrado} --- \mbox{Departamento} de \puc@department, \puc@university.
   \end{minipage}
   \onehalfspacing
   \vspace*{\stretch{1}}
   \par
   \noindent
   \begin{minipage}{13.5cm}
      \setlength{\parindent}{1cm}
      \indent
      \puc@abstract
   \end{minipage}
   \vspace*{\stretch{3}}
   \par
   \noindent \large \arial \textbf{Keywords} \normalfont \normalsize
   \par
   \renewcommand{\key}[1]{##1;\hspace{3mm} }
   \indent \puc@keywords
   \vspace*{\stretch{4}}
   \par
}
% -----------------------------------------------------------------



% -----------------------------------------------------------------
% abstract (BR)
% -----------------------------------------------------------------
\newcommand{\puc@showabstractBR}
{
   \selectlanguage{brazil}
   \cleardoublepage
   \puc@setmargins@dedication
   \markboth{Resumo}{Resumo}
   \thispagestyle{empty}
   \singlespacing\normalfont
   \pdfbookmark[0]{Resumo}{anchor:resumo}
   \noindent \large \arial \textbf{Resumo} \normalfont \normalsize
   \vspace{\stretch{3}}
   \par\indent
   \begin{minipage}{12cm}
      \singlespacing
      \puc@authorR; \puc@advisorR\ifthenelse{\equal{\puc@coadvisor}{}}{}{; \puc@coadvisorR}\ifthenelse{\equal{\puc@coadvisorII}{}}{}{; \puc@coadvisorIIR}\ifthenelse{\equal{\puc@coadvisorIII}{}}{}{; \puc@coadvisorIIIR}. \textbf{\puc@titleBR}. \puc@city, \puc@year. \pageref{LastPage}p.   \ifthenelse{\boolean{puc@dsc}}{Tese de Doutorado}{Disserta\c{c}\~{a}o de Mestrado} --- \mbox{Departamento} de \puc@department, \puc@university.
   \end{minipage}
   \onehalfspacing
   \vspace*{\stretch{1}}
   \par
   \noindent
   \begin{minipage}{13.5cm}
      \setlength{\parindent}{1cm}
      \indent
      \puc@abstractBR
   \end{minipage}
   \vspace*{\stretch{3}}
   \par
   \noindent \large \arial \textbf{Palavras--chave} \normalfont \normalsize
   \par
   \renewcommand{\key}[1]{##1;\hspace{3mm} }
   \indent \puc@keywordsBR
   \vspace*{\stretch{4}}
   \par
   \selectlanguage{english}
}
% -----------------------------------------------------------------



% -----------------------------------------------------------------
% tables
% -----------------------------------------------------------------
\newcommand{\puc@showtables}
{
   \cleardoublepage
   \puc@setmargins@dedication
   \renewcommand{\contentsname}{Contents}
   \renewcommand{\listfigurename}{List of Figures}
   \renewcommand{\listtablename}{List of Tables}
   \markboth{\contentsname}{\contentsname}
   \thispagestyle{empty}
   \pdfbookmark[0]{\contentsname}{anchor:contents}
   \singlespacing\normalfont
   \tableofcontents
   \ifthenelse{\equal{\puc@tablesmode}{fig} \or \equal{\puc@tablesmode}{figtab}}
   {
     \cleardoublepage
     \puc@setmargins@dedication
     \markboth{\listfigurename}{\listfigurename}
     \thispagestyle{empty}
     \pdfbookmark[0]{\listfigurename}{anchor:listfigurename}
     \singlespacing\normalfont
     \listoffigures
   }
   {}
   \ifthenelse{\equal{\puc@tablesmode}{tab} \or \equal{\puc@tablesmode}{figtab}}
   {
     \cleardoublepage
     \puc@setmargins@dedication
     \markboth{\listtablename}{\listtablename}
     \thispagestyle{empty}
     \pdfbookmark[0]{\listtablename}{anchor:listtablename}
     \singlespacing\normalfont
     \listoftables
   }
   {}
}
% -----------------------------------------------------------------



% -----------------------------------------------------------------
% epigraph
% -----------------------------------------------------------------
\newcommand{\puc@showepigraph}
{
   \cleardoublepage
   \puc@setmargins@text
   \markboth{\contentsname}{\contentsname}
   \thispagestyle{empty}
   \singlespacing\normalfont
   \pdfbookmark[0]{Epigraph}{anchor:epigraph}
   \vspace*{\stretch{1}}\par\indent
   \hspace*{\stretch{2}}
   \begin{minipage}[c]{8.2cm}
      \it \puc@epigraph
   \end{minipage}
   \hspace*{\stretch{1}}
   \par
   \begin{flushright}
      \textbf{\puc@epigraphauthor}\ifthenelse{\boolean{\puc@epigraphbook}}{, \textit{\puc@epigraphbook}}{}
   \end{flushright}
}
% -----------------------------------------------------------------



% -----------------------------------------------------------------
% nomenclature (to have the right bookmark in the pdf)
% -----------------------------------------------------------------
\renewenvironment{thenomenclature}
{
   \nompreamble
   \list{}
   {
      \labelwidth\nom@tempdim
      \leftmargin\labelwidth
      \advance\leftmargin\labelsep
      \itemsep\nomitemsep
      \let\makelabel\nomlabel
   }
}
{}

\newcommand{\puc@shownomencl}
{
   \makenomenclature
   \cleardoublepage
   \puc@setmargins@dedication
%   \renewcommand{\nomname}{List of Symbols}
   \renewcommand{\nomname}{Nomenclature}  % modified by A. B Cunha Jr %
   \markboth{\nomname}{\nomname}
   \thispagestyle{empty}
   \pdfbookmark[0]{\nomname}{anchor:nomname}
   \noindent \large \arial \textbf{\nomname}
   \normalfont \normalsize \vspace*{\stretch{1}}
   \par
   \printnomenclature[17mm]
}
% -----------------------------------------------------------------



% -----------------------------------------------------------------
% index (to have the right bookmark in the pdf)
% -----------------------------------------------------------------
\renewenvironment{theindex}
{
   \if@twocolumn
      \@restonecolfalse
   \else
      \@restonecoltrue
   \fi
   \twocolumn
   \columnseprule \z@
   \columnsep 35\p@
   \renewcommand{\indexname}{Subject Index}
   \chapter*{\indexname}
   \addcontentsline{toc}{chapter}{\indexname}
   \markboth{\indexname}{\indexname}
   \parskip\z@ \@plus .3\p@\relax
   \let\item\@idxitem
}
{
   \if@restonecol\onecolumn\else\clearpage\fi
}
% -----------------------------------------------------------------



% -----------------------------------------------------------------
% all front matter
% -----------------------------------------------------------------
\newcommand{\puc@showfrontmatter}
{
   \pagestyle{empty}
   \ifthenelse{\boolean{puc@cover}}{\puc@showcover}{}
   \puc@showfront
   \puc@showjury
   \ifthenelse{\boolean{puc@prop}}
   {
      \puc@showtables
      \ifthenelse{\boolean{puc@nomencl}}{\puc@shownomencl}{}
   }
   {
      \puc@showcopyrights
      \ifthenelse{\boolean{hasdedication}}{\puc@showdedication}{}
      \puc@showacknowledgment
      \puc@showabstract
      \puc@showabstractBR
      \puc@showtables
      \ifthenelse{\boolean{puc@nomencl}}{\puc@shownomencl}{}
      \ifthenelse{\boolean{hasepigraph}}{\puc@showepigraph}{}
   }
   \puc@setmargins@text
   \ifthenelse{\boolean{puc@tight}}{}{\onehalfspacing}
   \normalfont
   \puc@setpagestyle
}
% -----------------------------------------------------------------



% -----------------------------------------------------------------
\AtBeginDocument
{
   \renewcommand{\bibname}{Bibliography}
   \markboth{\bibname}{\bibname}
   \ifthenelse{\boolean{puc@bibkey}}
   {\bibliographystyle{puc-rio_bib_us}}
   {\bibliographystyle{puc-rio_num_us}}
   \renewcommand{\key}[1]{#1. }
   \special{ pdf: docinfo << /Author (\puc@author) /Title (\puc@title) /Keywords (\puc@keywords) >> }
}
\AfterBegin{document}{\makeatletter\puc@showfrontmatter\makeatother}
% -----------------------------------------------------------------



% -----------------------------------------------------------------
\endinput
% -----------------------------------------------------------------
% End of file 'puc-rio_thesis.cls'
% -----------------------------------------------------------------
