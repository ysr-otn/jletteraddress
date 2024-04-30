%%
%% Copyright (c) 2014 Shin'ya Ueoka <ibenza@i-beam.org>
%%

\NeedsTeXFormat{pLaTeX2e}
\ProvidesClass{jletteraddress}

\LoadClass[]{article}

\usepackage{plext}
\usepackage{xstring}
\ifx\kanjiskip\undefined\else
  \usepackage{atbegshi}
  \ifx\ucs\undefined
    \ifnum 42146=\euc"A4A2
      \AtBeginShipoutFirst{\special{pdf:tounicode EUC-UCS2}}
    \else
      \AtBeginShipoutFirst{\special{pdf:tounicode 90ms-RKSJ-UCS2}}
    \fi
  \else
    \AtBeginShipoutFirst{\special{pdf:tounicode UTF8-UCS2}}
  \fi
  \usepackage[dvipdfmx]{hyperref}

  %% Set a paper size for dvipdfmx
  \special{papersize=100truemm,148truemm}
\fi

%% Layouts
\setlength{\hoffset}{-1truein}
\setlength{\voffset}{-1truein}
\setlength{\oddsidemargin}{0pt}
\setlength{\evensidemargin}{0pt}
\setlength{\topmargin}{0pt}
\setlength{\topmargin}{0pt}
\setlength{\headheight}{0pt}
\setlength{\headsep}{0pt}
\setlength{\paperwidth}{100truemm}
\setlength{\paperheight}{148truemm}

\setlength{\tabcolsep}{0pt}
\setlength\tabbingsep{0pt}
\setlength{\unitlength}{1truemm} %

%% Sender macros
\def\sendername#1{\gdef\@sendername{#1}}
\def\sendernameb#1{\gdef\@sendernameb{#1}}
\def\senderpostcode#1{\gdef\@senderpostcode{#1}}
\def\senderaddressa#1{\gdef\@senderaddressa{#1}}
\def\senderaddressb#1{\gdef\@senderaddressb{#1}}

%% Make a address-side
\newcommand{\addaddress}[7] {
  % #1 : Receiver name
  % #2 : Receiver name suffix
  % #3 : Sub Receiver name
  % #4 : Sub Receiver name suffix
  % #5 : Receiver postcode
  % #6 : Receiver address 1
  % #7 : Receiver address 2
  \clearpage
  \refstepcounter{section}
  \addcontentsline{toc}{section}{#1}
  \noindent %
  \begin{picture}(100,148)(0,0)%
    \put(42,139){ %
      \vtop to 8truemm{\vfil\hbox{\fontsize{15pt}{0pt}\selectfont%
        \hbox to 8truemm{\hfil\StrChar{#5}{1}\hfil}%
        \hbox to 8truemm{\hfil\StrChar{#5}{2}\hfil}%
        \hbox to 8truemm{\hfil\StrChar{#5}{3}\hfil}\hskip0.8truemm
        \hbox to 7truemm{\hfil\StrChar{#5}{4}\hfil}%
        \hbox to 7truemm{\hfil\StrChar{#5}{5}\hfil}%
        \hbox to 7truemm{\hfil\StrChar{#5}{6}\hfil}%
        \hbox to 7truemm{\hfil\StrChar{#5}{7}\hfil}%
    }\vfil}}
    \put(83,120){\fontsize{15pt}{0pt}\selectfont%
        \parbox<t>[t]{120truemm}{#6}}
    \put(75,125){\fontsize{15pt}{0pt}\selectfont%
        \parbox<t>[t]{120truemm}{\hfil#7}}
    \put(50,130){\kanjiskip=.3zw\fontsize{27pt}{0pt}\selectfont%
        \parbox<t>[t]{120truemm}{\hfil#1\hskip0.275zw#2}\hfil}
    \put(40,130){\kanjiskip=.3zw\fontsize{27pt}{0pt}\selectfont%
        \parbox<t>[t]{120truemm}{\hfil#3\hskip0.275zw#4}\hfil}
    \put(25,87){\fontsize{11.5pt}{0pt}\selectfont%
        \parbox<t>[t]{70truemm}{\@senderaddressa}}
    \put(19,77){\fontsize{11.5pt}{0pt}\selectfont%
        \parbox<t>[t]{70truemm}{\@senderaddressb}}
    \put(12.5,75){\kanjiskip=0.3zw\fontsize{15pt}{0pt}\selectfont%
        \parbox<t>[t]{55truemm}{\hfil\@sendername}\hfil}
    \put(7.5,75){\kanjiskip=0.3zw\fontsize{15pt}{0pt}\selectfont%
        \parbox<t>[t]{55truemm}{\hfil\@sendernameb}\hfil}
    \put(2,22){ %
      \vtop to 6.5truemm{\vfil\hbox{\fontsize{12pt}{0pt}\selectfont%
        \hbox to 4truemm{\hfil\StrChar{\@senderpostcode}{1}\hfil}%
        \hbox to 4truemm{\hfil\StrChar{\@senderpostcode}{2}\hfil}%
        \hbox to 4truemm{\hfil\StrChar{\@senderpostcode}{3}\hfil}\hskip2truemm %
        \hbox to 4truemm{\hfil\StrChar{\@senderpostcode}{4}\hfil}%
        \hbox to 4truemm{\hfil\StrChar{\@senderpostcode}{5}\hfil}%
        \hbox to 4truemm{\hfil\StrChar{\@senderpostcode}{6}\hfil}%
        \hbox to 4truemm{\hfil\StrChar{\@senderpostcode}{7}\hfil}%
    }\vfil}}
  \end{picture} %
}

