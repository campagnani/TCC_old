% !TeX program = xelatex
% !TeX encoding = UTF-8 Unicode
% !BIB program = bibtex

% Declaration for this class
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{tcc}[2019/11/17 Modelo de TCC do CEFET em XeLaTeX]

% This command has to be defined for every class
\newcommand{\headlinecolor}{\normalcolor}

\PassOptionsToPackage{english,french,brazil}{babel}
\PassOptionsToPackage{shortlabels}{enumitem}

% Base our class on the ABNTeX2
\LoadClass[sumario=tradicional,12pt,openright,twoside,a4paper,english,french,brazil]{abntex2}

% Declares options accepted by this class. No \RequirePackage allowed from now
% on. Since we cannot \RequirePackage inside \DeclareOption, we have to create a
% variable to hold whether the package should be loaded.
\newif\if@langen
\newif\if@langfr
\newif\if@useminted
\newif\if@final

\DeclareOption{english}{\@langentrue}
\DeclareOption{french}{\@langfrtrue}
\DeclareOption{minted}{\@usemintedtrue}
\DeclareOption{final}{\@finaltrue}

% Processes all options and puts us back into normal mode. \RequirePackage
% allowed again.
\ProcessOptions\relax

\RequirePackage{fontspec}
\defaultfontfeatures{Ligatures=TeX,Scale=MatchLowercase}
\renewcommand{\baselinestretch}{1.5} % Line height of 1.5

\if@langfr
    \RequirePackage[decimalsymbol=comma,
                    input-complex-roots=j,
                    output-complex-root=j,
                    complex-root-position=after-number,
                    loctolang={FR:french}]{siunitx} % SI units
    \selectlanguage{french}
\elsif@langen
    \RequirePackage[decimalsymbol=dot,
                    input-complex-roots=j,
                    output-complex-root=j,
                    complex-root-position=after-number,
                    loctolang={UK:english}]{siunitx} % SI units
    \selectlanguage{english}
\else
    \RequirePackage[decimalsymbol=comma,
                    input-complex-roots=j,
                    output-complex-root=j,
                    complex-root-position=after-number,
                    loctolang={BR:portuguese}]{siunitx} % SI units
    \selectlanguage{brazil}
\fi

\RequirePackage[useregional]{datetime2}
\RequirePackage[style=abnt]{biblatex}
\RequirePackage[top=3cm,bottom=2cm,left=3cm,right=2cm]{geometry}
\RequirePackage{float}
\RequirePackage{framed}
\RequirePackage{etoolbox}
\RequirePackage{pgffor}

% Image manipulation
\RequirePackage{graphicx} % For images
\RequirePackage{rotate} % To rotate images
\RequirePackage[section]{placeins} % Prevents figures from floating to wrong places
\RequirePackage{epsf}
\RequirePackage{caption}[2004/07/16]

% Math related
\RequirePackage{amssymb}
\RequirePackage{amsmath} % Mathematic symbols and stuff
\RequirePackage{amsfonts} % Mathematical fonts
\RequirePackage{cancel} % In math mode, variables to strike
\RequirePackage{subscript} % For subscript

% Table manipulation
\RequirePackage{longtable} % For long tables that take more than one page
\RequirePackage{multirow} % Multirow tables
\RequirePackage{tabulary} % Table tabulation
\RequirePackage{array}

%listas
%\usepackage[shortlabels]{enumitem}


% Makes the column type L, that is centered and allows line wrap.
\newcolumntype{L}{>{\centering\arraybackslash}m{3cm}}

% Utilities
\RequirePackage{pdfpages} % Advanced PDF importing
\RequirePackage{pdflscape} % One page panorama
\RequirePackage[european,cuteinductors,smartlabels,oldvoltagedirection]{circuitikz} % For circuits
\RequirePackage{indentfirst} % Indents first paragraph after section
\RequirePackage{chngcntr} % Change numberings
\RequirePackage{fvextra}
\RequirePackage{csquotes} % \enquote
\RequirePackage{url}
\RequirePackage{ragged2e} % Justify
\RequirePackage{lastpage}
\RequirePackage{fancyhdr} % Set headers and footers
\RequirePackage[Lenny]{fncychap} % Square chapter
\RequirePackage{acro} % abbreviations and accronyms
\RequirePackage{tocloft}

\if@useminted
    \RequirePackage[section]{minted} % Code highlighting with Pygments
    
    
    % Removes red boxes when lexer can not understand something (like @ in Python 3)
    \AtBeginEnvironment{minted}{\renewcommand{\fcolorbox}[4][]{#4}}

    % pythoncode environment for hightlight
    \newminted{python3}
    {autogobble,linenos,python3,fontseries=Consolas,fontsize=\scriptsize,frame=lines}
    \newmintedfile[python]{python3}
    {autogobble,linenos,python3,fontseries=Consolas,fontsize=\scriptsize,frame=lines}

    % ccode environment for highlight
    \newminted{c}
    {autogobble,linenos,fontseries=Consolas,fontsize=\scriptsize,frame=lines}

    \newfloat{code}{htp}{loc}
    \floatname{code}{Código}
    \newlistof{listofcodes}{loc}{Lista de Códigos}
    \newlistentry[chapter]{code}{loc}{0}
    \cftsetindents{code}{0em}{2.3em}
\fi

% End of \RequirePackage's

\usetikzlibrary{shapes,arrows}

\renewcommand{\rm}{\textrm} % needed with memoir
\renewcommand{\chaptermark}[1]{\markboth{\chaptername\ \thechapter. \ #1}{ }}
\renewcommand{\sectionmark}[1]{\markright{\thesection. \ #1}}
\renewcommand{\tocheadstart}{\rm}
\renewcommand{\ABNTEXchapterfont}{\rm}
\renewcommand{\ABNTEXchapterfontsize}{\huge}
\ChTitleVar{\ABNTEXchapterfontsize\ABNTEXchapterfont}
\setsecheadstyle{\bfseries\Large}

% % more space between lines in table.
\renewcommand{\arraystretch}{1.2}

\newcommand{\norm}[1]{\left\lVert#1\right\rVert}

\newcounter{authors}
\newcommand\addauthor[2]{%
  \stepcounter{authors}%
  \csdef{author\theauthors}{#1}%
  \csdef{authoremail\theauthors}{#2}%
}
\newcommand\getauthor[1]{\csuse{author#1}}
\newcommand\getauthoremail[1]{\csuse{authoremail#1}}
\newcommand\getauthors{\foreach \i in {1,...,\theauthors}{\getauthor{\i}\ifnum\i=\theauthors\@\else,\ \fi}}

\newcommand\setorientador[1]{\csdef{getorientador}{#1}}

\newcounter{coorientador}
\newcommand\addcoorientador[1]{%
  \stepcounter{coorientador}%
  \csdef{coorientador\thecoorientador}{#1}%
}
\newcommand\getcoorientador[1]{\csuse{coorientador#1}}
\newcommand\getcoorientadores{\foreach \i in {1,...,\thecoorientador}{\getcoorientador{\i}\ifnum\i=\thecoorientador\@\else,\ \fi}}

\newcommand\setcoordenador[1]{\csdef{getcoordenador}{#1}}

\newcounter{membrobanca}
\newcommand\addmembrobanca[1]{%
  \stepcounter{membrobanca}%
  \csdef{membrobanca\themembrobanca}{#1}%
}
\newcommand\getmembrobanca[1]{\csuse{membrobanca#1}}

\newcommand\seteixodeformacao[1]{\csdef{eixodeformacao}{#1}}

\newcommand\setlocal[1]{\csdef{local}{#1}}
\newcommand\setano[1]{\csdef{ano}{#1}}
\newcommand\setmes[1]{\csdef{mes}{#1}}
\newcommand\setdedicatoria[1]{\csdef{dedicatoria}{#1}}
\newcommand\setagradecimentos[1]{\csdef{agradecimentos}{#1}}
\newcommand\setfrase[1]{\csdef{frase}{#1}}
\newcommand\setfraseautor[1]{\csdef{fraseautor}{#1}}

\newcommand\preamble{%
    \hypersetup{
        unicode=true,
        pdftitle={\@title},
        pdfsubject={TCC da Engenharia Mecatrônica do CEFET-MG},
        pdfauthor={\getauthor{1}},
        pdfstartview={FitH}
    }%
}

\makepagestyle{cefet}
  %%cabeçalhos
  \makeevenhead{cefet} %%pagina par
     {~}
     {~}
     {\rightmark}
  \makeoddhead{cefet} %%pagina ímpar ou com oneside
     {~}
     {~}
     {\rightmark}
  \makeheadrule{cefet}{\textwidth}{\normalrulethickness} %linha
  %% rodapé
  \makeevenfoot{cefet}
     {~} %%pagina par
     {\thepage}
     {~} 
  \makeoddfoot{cefet} %%pagina ímpar ou com oneside
     {~}
     {\thepage}
     {~}
\makepagestyle{cefetchapter}
  %%cabeçalhos
  \makeevenhead{cefetchapter} %%pagina par
     {~}
     {~}
     {~}
  \makeoddhead{cefetchapter} %%pagina ímpar ou com oneside
     {~}
     {~}
     {~}
  %% rodapé
  \makeevenfoot{cefetchapter}
     {~} %%pagina par
     {\thepage}
     {~} 
  \makeoddfoot{cefetchapter} %%pagina ímpar ou com oneside
     {~}
     {\thepage}
     {~}

\renewcommand{\maketitle}{
    \pretextual{}
    \renewcommand{\printtoctitle}{\chapter*}
    \renewcommand{\printloftitle}{\chapter*}
    \renewcommand{\printlottitle}{\chapter*}
    \textual{}
    \pagestyle{cefetchapter}
    \pagenumbering{roman}
    %================================================================================================
    %=========================================== CAPA 1 =============================================
    %================================================================================================
    \vspace*{1.0cm}
    \begin{center}
        \textsc{Centro Federal de Educaçào Tecnológica de Minas Gerais\\
            \textit{Campus} \local\\
            Graduação em Engenharia Mecatrônica}
    \end{center}
    \vspace*{3.0cm}
    \begin{center}
        \large{\getauthors{}}
    \end{center}
    \vspace*{2.5cm}
    \begin{center}
        \Large{\textsc{\@title}}
    \end{center}
    \vspace*{4cm}
    \epsfxsize=0.175\columnwidth{}
    \centerline{\epsffile{Imagens/cefet.eps}}
    \null\vfill
    \begin{center}
        \local\\\(\ano\)
    \end{center}
    \thispagestyle{empty}
    \cleardoublepage{}
    %================================================================================================
    %=========================================== CAPA 2 =============================================
    %================================================================================================
    \vspace*{1cm}
    \begin{center}
        \large{\getauthors{}}
    \end{center}
    \vspace*{1.5cm}
    \begin{center}
        \Large{\textsc{\@title}}
    \end{center}
    \vspace*{1.5cm}
    \begin{flushright}
        \begin{minipage}{9.0cm}
            Monografia de Trabalho de Conclusão de Curso apresentada ao Colegiado de Graduação do curso de Engenharia Mecatrônica como parte dos requisitos exigidos para a obtenção do título de Engenheiro Mecatrônico.\\
            Eixo de Formação: \eixodeformacao{}.
            \vspace*{1cm}\\
            Orientador: \getorientador\\
            Coorientador: \getcoorientadores{}
        \end{minipage}
    \end{flushright}
    \vspace*{1cm}
    \epsfxsize=0.175\columnwidth{}
    \centerline{\epsffile{Imagens/cefet.eps}} % Aqui poderia ser substituido por um logo do curso ou do campus
    \null\vfill
    \begin{center}
        \local\\
        \(\ano\)
    \end{center}
    \cleardoublepage{}
    %================================================================================================
    %============================== Ficha (Somente na versão final) =================================
    %================================================================================================
    \if@final
        \includepdf[pages=-]{ficha.pdf} % após scanear, colocar a ficha catalográfica do texto
        \cleardoublepage{}
    \fi
    %================================================================================================
    %============================== Folha de aprovação (Somente na versão final) ====================
    %================================================================================================
    \if@final
        \begin{table}[]
            \begin{tabular}{ll}
            \multirow{3}{*}{\includegraphics[width=3cm]{Imagens/cefet}} & Centro Federal de Educação Tecnológica de Minas Gerais \\
                                                                     & CEFET-MG / Divinópolis                                 \\
                                                                     & Curso de Engenharia Mecatrônica                       
            \end{tabular}
        \end{table}
        \vspace*{2.0cm}
        Monografia intitulada \enquote{\@title}, de autoria do(as) graduando(as) \getauthors, aprovada pela banca examinadora constituída pelos seguintes professores:
        \vspace*{1cm}
        \begin{center}
            \hrulefill{}\\
            \getorientador{}\\
            \vspace*{1cm}
            \foreach \i in {1,...,\themembrobanca}{%
                \hrulefill{}\\
                \getmembrobanca{\i}\\
                \vspace*{1cm}
            }
            \vfill{}
            \hrulefill{}\\
            Coordenador do Curso de Engenharia Mecatrônica\\
            \getcoordenador{}\\
~\\
            \local\\
            \mes{}\ de\ \ano
        \end{center}
        \vfill{}
        \cleardoublepage{}
    \fi
    %======================================== Dedicatória =========================================
    %\null{}
    %\vfill{}
    %\begin{flushright}
    %    \begin{minipage}{6.5cm}
    %        \textsc{\dedicatoria}
    %    \end{minipage}\\[8mm]
    %\end{flushright}
    %\cleardoublepage{}
    %==============================================================================================
    %======================================= Agradecimentos =======================================
    %\chapter*{Agradecimentos}
    %\noindent Agradeço,\\[2mm]
    %\agradecimentos{}
    %\thispagestyle{plain}
    %\cleardoublepage{}
    %==============================================================================================
    %======================================== Frase Miss Brasil ===================================
    %\null{}
    %\vfill{}
    %\begin{flushright}
    %    \begin{minipage}{9.0cm}
    %        \frase{}
    %    \end{minipage}
    %\end{flushright}
    %\begin{flushright}
    %    \fraseautor{}
    %\end{flushright}
    %\cleardoublepage{}
    %==============================================================================================
}

\newcommand\toc{
    \pdfbookmark[0]{\contentsname}{toc}
    \tableofcontents*{}
    \thispagestyle{plain}
    \cleardoublepage{}
    \renewcommand{\listfigurename}{Lista de figuras}
    \listoffigures*{}
    \thispagestyle{plain}
    \cleardoublepage{}
    \listoftables*{}
    \thispagestyle{plain}
    \cleardoublepage{}
    \if@useminted
        \listofcodes*{}
        \thispagestyle{plain}
        \cleardoublepage{}
    \fi
    \include{abbrpage}
    \pagenumbering{arabic}
    \pagestyle{cefet}
    \aliaspagestyle{chapter}{cefetchapter}
    \newtheorem{theorem}{Teorema}
    \counterwithin{figure}{chapter}
    \counterwithin{table}{chapter}
}
