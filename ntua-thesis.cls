% Class Information
\def\filename{ntua-thesis}
\def\fileversion{1.0}
\def\filedate{2010/05/08}
\NeedsTeXFormat{LaTeX2e}[1996/12/01]
\ProvidesClass{ntua-thesis}[%
    \filedate\space\fileversion LaTeX document class (Finik).]

\RequirePackage{ifthen}
\RequirePackage{graphicx}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{datetime}
\RequirePackage{fancyhdr}
\RequirePackage{tabularx} %for two-author signatures

\newcommand{\s}{\footnotesize}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions
\LoadClass[a4paper,11pt]{book}

%% Show section numbering in \subsubsection, and make it visible
%% in the Table of Contents.
\setcounter{secnumdepth}{2}
\setcounter{tocdepth}{2}

\pagestyle{fancy}
% Title Page and Front Matter

\newcommand{\thesis}[2][του]{%
 \gdef\@thesis@of{#1}%
 \gdef\@thesis@author{#2}}

%% Date helpers.
%% This is also a part of xgreek.sty, though not exported for explicit use.
\newcommand{\grmonth}[1][\presentation@month]{%
    \ifcase #1\or Ιανουάριος\or Φεβρουάριος\or Μάρτιος\or Απρίλιος\or
    Μάιος\or Ιούνιος\or Ιούλιος\or \Αύγουστος\or Σεπτέμβριος\or
    Οκτώβριος\or Νοέμβριος\or Δεκέμβριος\fi
}

\newcommand{\ofgrmonth}[1][\presentation@month]{%
    \ifcase #1\or Ιανουαρίου\or Φεβρουαρίου\or Μαρτίου\or Απριλίου\or
    Μαΐου\or Ιουνίου\or Ιουλίου\or Αυγούστου\or Σεπτεμβρίου\or
    Οκτωβρίου\or Νοεμβρίου\or Δεκεμβρίου\fi
}

\newcommand\date@month{\grmonth}
\newcommand{\date@year}{\number\presentation@year\relax}
\newcommand\where@when{Αθήνα, \date@month\ \date@year}

%% Set presentation date.
\newdateformat{ofdate}{%
    \THEDAY\textsuperscript{η} \ofgrmonth[\THEMONTH], \THEYEAR
}
\newcommand{\presenting}[3]{%
    \newdate{presentation@date}{#1}{#2}{#3}
    \def\presentation@month{#2}
    \def\presentation@year{#3}
}

\newcommand{\supervisor}[2][Καθηγητής]{%
  \gdef\@pre@super{#1}%
  \gdef\@supervisor{#2}}
\newcommand{\epitropiF}[2][Καθηγητής]{%
  \gdef\@pre@epF{#1}%
  \gdef\@epitropiF{#2}}
\newcommand{\epitropiS}[2][Καθηγητής]{%
  \gdef\@pre@epS{#1}%
  \gdef\@epitropiS{#2}}

\def\@subtitle{}          \def\subtitle#1{\gdef\@subtitle{#1}}
\def\@translator{}        \def\translator#1{\gdef\@translator{#1}}
\def\@institution{}       \def\institution#1{\gdef\@institution{#1}}
\def\@department{}        \def\department#1{\gdef\@department{#1}}
\def\@division{}          \def\division#1{\gdef\@division{#1}}
\def\@lab{}               \def\lab#1{\gdef\@lab{#1}}
\def\@other{}             \def\other#1{\gdef\@other{#1}}
\def\@dedication{}        \def\dedication#1{\def\@dedication{#1}}
\def\@uppertitleback{}    \long\def\uppertitleback#1{\def\@uppertitleback{#1}}
\def\@middletitleback{}	  \long\def\middletitleback#1{\def\@middletitleback{#1}}
\def\@lowertitleback{}    \long\def\lowertitleback#1{\def\@lowertitleback{#1}}
\def\@approval{}          \long\def\approval#1{\def\@approval{#1}}
\def\@mysig{}             \long\def\mysig#1{\def\@mysig{#1}}

                          \def\url#1{\gdef\@url{\texttt{#1}}}
                          \def\TRnumber#1{\gdef\@TRnumber{#1}}
\def\@trurl{}             \def\trurl#1{\gdef\@trurl{\texttt{#1}}}
\def\@trftp{}             \def\trftp#1{\gdef\@trftp{\texttt{#1}}}

\def\new@tpage{\newpage\thispagestyle{empty}\null}
% Measurements
\setlength{\oddsidemargin}{7mm}
\setlength{\evensidemargin}{0mm}
\setlength{\textwidth}{150mm}

\setlength{\topmargin}{0mm}
\setlength{\textheight}{235mm}
\advance \topmargin by -\headheight
\advance \topmargin by -\headsep

% Maketitle
\renewcommand{\maketitle}{%
    \begin{titlepage}
        \let\footnotesize\small
        \let\footnoterule\relax
        \renewcommand{\thefootnote}{\fnsymbol{footnote}}
        \new@tpage
        \begin{center}

        \begin{minipage}{2.5cm}
            \includegraphics[width=2.5cm]{pyrforos}
        \end{minipage}

	\vspace{0.5cm}

        \begin{minipage}{15cm}
        \begin{center}
            \textsc{%
            \huge{\@institution} \\
            \large{\@department \\
            \@division \\
            %\@other
            }}
        \end{center}
        \end{minipage}
        %\hfill %\hspace{0.5cm}

        %
        \vfill
        %

           % \fbox{\fbox{%\parbox{14cm}{
                %\vspace{1mm}\hspace{1mm}
                %\begin{minipage}{5cm}
                %    \@ifundefined{@TRnumber}{ΕΣΒΓΔ-ΔΙΠΛ}{\@TRnumber}
                %\end{minipage}
                %\hfill
                %\begin{minipage}{5cm}
                %    \flushright
                %    \@date
                %\end{minipage}
                %
                %\vspace{5mm}
                %
                \begin{center}
                    \LARGE \bfseries \@title
                \end{center}
                \ifx\@subtitle\@empty\else
                \begin{center}
                    \LARGE \@subtitle
                \end{center}
                \fi
                %
                \vspace{5mm}
                %
                \begin{center}
                    \huge{\textsc{\@translator}}\\
                    \vspace{3mm}
                    \normalsize{\@thesis@of}\\
                    \vspace{3mm}
                    \large{\textbf{\@thesis@author}}
                \end{center}
                %
                \vspace{5mm}
                %
                \hspace{1mm}
           \end{center}

           \vfill

                \begin{minipage}{15cm}
                \begin{tabbing}
                    \large \textbf{\supervisorname :} \=\@supervisor\\
                    \>\@pre@super Ε.Μ.Π.
                \end{tabbing}
                \end{minipage}
                \vspace{1mm}
           % }}%}

            %
            \vfill
            %

            %\begin{figure}[ht] \center\leavevmode
            %\epsfxsize=8cm
            %\epsfbox{D:/thesis/figures/cover.eps}
            %\end{figure}

            \begin{center}
                %\Large \textsc{{\bfseries \@translator}}\\[12pt]
                \textsc{\@lab}\\
                \where@when
            \end{center}
            %
            \cleardoublepage

            \if@twoside\new@tpage
                \noindent
                \begin{minipage}[t]{\textwidth}
                    \@uppertitleback
                \end{minipage}
                \par
                \vfill
               \begin{center}
                    \LARGE \bfseries \@title
                \end{center}
                \ifx\@subtitle\@empty\else
                \begin{center}
                    \LARGE \@subtitle
                \end{center}
                \fi
                %
                \vspace{5mm}
                %
                \begin{center}
                    \huge{\textsc{\@translator}}\\
                    \vspace{3mm}
                    \normalsize{\@thesis@of}\\
                    \vspace{3mm}
                    \large{\textbf{\@thesis@author}}
                \end{center}
                %
                \vspace{5mm}
                %
                \hspace{1mm}


           \vfill

                \begin{minipage}{15cm}
                \begin{tabbing}
                    \large \textbf{\supervisorname :} \=\@supervisor\\
                    \>\@pre@super Ε.Μ.Π.
                \end{tabbing}
                \end{minipage}
                \vspace{1mm}
           \vfill

                \begin{minipage}{\textwidth}
                    \@approval
                \end{minipage}

            \vfill
            \begin{center}
                %\Large \textsc{{\bfseries \@translator}}\\[12pt]
                %\textsc{\@lab}\\
                \where@when
            \end{center}
            %
            \fi
           \new@tpage
           \vspace*{7.5cm}
           \begin{minipage}{\textwidth}
             \@mysig
           \end{minipage}
           \vspace*{7.5cm}

            %\cleardoublepage
            %\if@twoside\new@tpage
                %\noindent
                %\begin{minipage}[t]{\textwidth}
                    %\@uppertitleback
                %\end{minipage}
                %\par
                %\vfill
                \noindent
                \begin{minipage}{\textwidth}
                    \@middletitleback
                \end{minipage}
                %\par
                %\vfill
                %\noindent
                %\begin{minipage}[b]{\textwidth}
                    %\@lowertitleback
                %\end{minipage}
            %\fi
           % \ifx\@dedication\@empty\else \new@tpage
           %     {\centering \Large \@dedication \par}
           %     \if@twoside \newt@page \fi
           % \fi
        %\new@tpage
          %\begin{minipage}[b]{\textwidth}
          %  \@mysig
          %\end{minipage}
    \end{titlepage}
    %
    \renewcommand{\thefootnote}{\arabic{footnote}}
    \setcounter{footnote}{0}
    %
    \gdef\@thanks{}\gdef\@author{}\gdef\@translator{}\gdef\@institution{}
    \gdef\@department{}\gdef\@division{}\gdef\@lab{}\gdef\@other{}
  \gdef\@uppertitleback{}\gdef\@lowertitleback{}\gdef\@dedication{}%
  \gdef\@title{}\gdef\@subtitle{}\let\maketitle\relax%
}


% Names
\newcommand{\keywordsname}{Λέξεις Κλειδιά}
\newcommand{\keywordsnameeng}{Keywords}
\newcommand{\abstractname}{}
\newcommand{\draftname}{Προσχέδιο}
\newcommand{\prefacename}{Πρόλογος}
\newcommand{\acknowledgementsname}{Ευχαριστίες}
\newcommand{\supervisorname}{Επιβλέπων}
\newcommand{\pagesname}{Σελίδες}
\newcommand{\urlname}{URL}
\newcommand{\ftpname}{FTP}
% More Names
\translator{Διπλωματική Εργασία}
\institution{Εθνικό Μετσόβιο Πολυτεχνείο}
%\department{Σχολή Ηλεκτρολόγων Μηχανικών και Μηχανικών Υπολογιστών}
%\division{Τομέας Τεχνολογίας Πληροφορικής και Υπολογιστών}
%\lab{Εργαστήριο Συστημάτων Βάσεων Γνώσεων και Δεδομένων}
\other{Ζωγράφου 157 73, Αθήνα}

\mysig{%
%\vspace{15cm}
%\textit{(Υπογραφή)}\\\\\\
\begin{flushright}
.........................................\\
\large{\textbf{\textsc{\@author}}}\\
\large{Διπλωματούχος Ηλεκτρολόγος Μηχανικός\\
       και Μηχανικός Υπολογιστών Ε.Μ.Π.}\\
%\copyright\ \date@year -- All rights reserved
\end{flushright}
}

\uppertitleback{
    \begin{minipage}{2cm}
        \includegraphics[width=2cm]{pyrforos}
    \end{minipage}
    \hspace{0.5cm}
    \begin{minipage}{12cm}
        \@institution \\
        \@department \\
        \@division \\
        \@lab
    \end{minipage}
}

\approval{
\begin{flushleft}
    Εγκρίθηκε από την τριμελή εξεταστική επιτροπή την
    \ofdate\displaydate{presentation@date}.
\end{flushleft}
    \vspace{1em}
    \begin{tabular}[b]{ c c c }
    %\hspace{-3em}
    \\ \\
    %\hspace{-3em}
    ........................ & ........................ & ........................\\
    %\hspace{-3em}
    \s\@supervisor             & \s\@epitropiF              & \s\@epitropiS \\
    %\hspace{-3em}
    \s\@pre@super Ε.Μ.Π. & \s\@pre@epF Ε.Μ.Π. & \s\@pre@epS Ε.Μ.Π. \\
    \end{tabular}
}

\middletitleback{
    Copyright \copyright\ -- All rights reserved\ \ \@author, \date@year.\\
    Με επιφύλαξη παντός δικαιώματος.\\[12pt]
    Απαγορεύεται η αντιγραφή, αποθήκευση και διανομή της παρούσας εργασίας, εξ
    ολοκλήρου ή τμήματος αυτής, για εμπορικό σκοπό.  Επιτρέπεται η ανατύπωση,
    αποθήκευση και διανομή για σκοπό μη κερδοσκοπικό, εκπαιδευτικής ή
    ερευνητικής φύσης, υπό την προϋπόθεση να αναφέρεται η πηγή προέλευσης και να
    διατηρείται το παρόν μήνυμα.  Ερωτήματα που αφορούν τη χρήση της εργασίας
    για κερδοσκοπικό σκοπό πρέπει να απευθύνονται προς τον
    συγγραφέα.\\[8pt]
    Οι απόψεις και τα συμπεράσματα που περιέχονται σε αυτό το έγγραφο εκφράζουν
    τον συγγραφέα και δεν πρέπει να ερμηνευθεί ότι αντιπροσωπεύουν τις επίσημες
    θέσεις του Εθνικού Μετσόβιου Πολυτεχνείου.
}

%
%\def\cr@comma{, }
%\lowertitleback{%
 % \let\cr@old\\%
 % \let\\\cr@comma%
 % \@author,
 % \emph{\@title}, \@translator, \@institution, \@department, \@division,
 % \@lab, \@date.%
  %\let\\\cr@old%
  %\\[6pt]
  %\begin{tabular}{@{}ll@{}}
   % \@ifundefined{@url}{}{%
    %  \urlname:   & \@url \\
    %}
    %\pagesname: %& \pageref{lastfront} +
    %\pageref{lastback}
  %\end{tabular} \\[12pt]
  %\@ifundefined{@TRnumber}{}{%
   % \let\cr@old\\%
    %\let\\\cr@comma%
     %   Διαθέσιμο επίσης ως: Τεχνική Αναφορά
      %  \@TRnumber, \@institution, \@department, \@division, \@lab, \@date.
       %     \let\\\cr@old%
    %\\[6pt]
    %\begin{tabular}{@{}ll@{}}
    %\urlname: & \@trurl \\
    %\ftpname: & \@trftp
    %\end{tabular}
    %}
%}
% Redefining Commands
\renewcommand{\frontmatter}{
    \cleardoublepage
    \@mainmatterfalse \pagenumbering{roman}
}
\renewcommand{\mainmatter}{
    \label{lastfront}
    \cleardoublepage
    \@mainmattertrue\pagenumbering{arabic}
    \addtocontents{toc}{\protect\addvspace{1em}}
}
\renewcommand{\backmatter}{
    \if@openright\cleardoublepage\else\clearpage\fi
    \@mainmatterfalse
}
% Headings
\def\invisiblethingie{\tiny\ }
\def\myemptypage{
    \mbox{}
    \vspace{\fill}
    \begin{flushright}
        \invisiblethingie
    \end{flushright}
    \vspace{5ex}
    \thispagestyle{empty}
}
%
\renewcommand{\cleardoublepage}{
    \clearpage %
    \if@twoside \ifodd\c@page\else
    \myemptypage
    \newpage
    \if@twocolumn\mbox{}\newpage\fi\fi\fi
}
%
\renewcommand{\chaptermark}[1]{
    \markboth{\mbox{\@chapapp}\ \thechapter.\ \ #1}{}
%        \markboth{\mbox{\@chapapp}\ \thechapter.\ \ #1}{}
}
\renewcommand{\sectionmark}[1]{
    \markright{\thesection\ \ #1}{}
}
%
\fancyhf{}
\fancyhead[LE,RO]{\thepage}
\fancyhead[LO]{\slshape\nouppercase{{\rightmark}}}
\fancyhead[RE]{\slshape\nouppercase{{\leftmark}}}
\addtolength{\headheight}{2pt}
\setlength{\headwidth}{\textwidth}
\addtolength{\topmargin}{-2pt}
%
\let\finik@tocont\tableofcontents
\renewcommand{\tableofcontents}{%
    \finik@tocont
    \addcontentsline{toc}{chapter}{\contentsname}
}

\let\finik@lof\listoffigures
\renewcommand{\listoffigures}{%
    \finik@lof
    \addcontentsline{toc}{chapter}{\listfigurename}
}
\let\finik@lot\listoftables
\renewcommand{\listoftables}{%
    \finik@lot
    \addcontentsline{toc}{chapter}{\listtablename}
}
% More Enviroments
\newenvironment{keywords}{\section*{\keywordsname}}{}
\newenvironment{keywordseng}{\section*{\keywordsnameeng}}{}
\newcommand{\footacknowledgement}[1]{%
  \let\@tmp@makefntext\@makefntext
  \long\def\@makefntext##1{%
      \parindent 1em%
      \noindent##1}%
  \footnotetext{#1}%
  \let\@makefntext\@tmp@makefntext
}
\newenvironment{acknowledgements}{%
  \chapter*{\acknowledgementsname}
  \addcontentsline{toc}{chapter}{\acknowledgementsname}
}{}
\newenvironment{abstract}{%
  \chapter*{\abstractname\@mkboth{\abstractname}{\abstractname}}
  \addcontentsline{toc}{chapter}{\abstractname}
}{}

\AtEndDocument{\subparagraph{}\label{lastback}}
\endinput


