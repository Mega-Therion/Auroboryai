% alienfolio.cls — document class for the Alien Aesthetic folios
% RY's standing order 2026-11-02: all papers from now on use this style.
%
% Author-facing commands (see USAGE.md):
%   \folio{IT-PLEROMA}            folio code; auto-selects the canon sigil
%   \usesigil{stems}              override the auto-selected sigil
%   \title{...}                   paper title (standard LaTeX)
%   \papersubtitle{...}           grey serif subtitle on the cover
%   \paperauthors{...}            byline, e.g. Ryan W.\ Yett (Architect) \\ ...
%   \affil{...}                   default: Independent Research, Arkansas
%   \orcidnum{...}                default: 0009-0001-1303-7190
%   \shorttitle{...}              running-head title (defaults to \title)
%   \shortauthors{...}            running-head authors
%   \makecover                    builds the 9-element cover page
%   \begin{convergence}{CLAIM}    convergence statement box (RY's rule:
%   ...                           every manuscript opens with one, naming
%   \end{convergence}             the central claim, its unique angle, and
%                                 cross-refs to sibling papers)
%   \begin{supersession}          supersession / correction note box
%   ... \end{supersession}
%   \goldrule                     centred short gold rule
%   \key{term}                    key term: bold white
%   \tiertag{theorem}             inline mono tier tag, e.g. [TIER: THEOREM]
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{alienfolio}[2026/11/02 Alien Aesthetic folio class]

\LoadClass[11pt,letterpaper]{article}

% ---- palette ----
\RequirePackage{xcolor}
\definecolor{void}{HTML}{060A14}        % page background, near-black navy
\definecolor{gold}{HTML}{B69441}        % borders, rules, section heads
\definecolor{flow}{HTML}{3A8C9B}        % cyan: sigil secondary, subsections
\definecolor{bodytext}{HTML}{E8E6E1}    % warm white body
\definecolor{muted}{HTML}{C5C9D4}       % soft grey subtitles/meta (brightened 2026-11-07 for legibility; was 9AA0B0)
\definecolor{gridline}{HTML}{2A3B5C}    % blueprint grid

% ---- fonts ----
\RequirePackage{lmodern}                % Latin Modern serif body
\renewcommand{\ttdefault}{pcr}        % Courier monospace for kickers/labels
\IfFileExists{microtype.sty}{\RequirePackage{microtype}}{}

% ---- page geometry: US letter, text block inside the gold frame ----
\RequirePackage[letterpaper,
  left=0.95in, right=0.95in,
  top=1.05in, bottom=1.05in,
  headheight=15pt, headsep=0.28in, footskip=0.5in]{geometry}

% ---- the void page ----
\pagecolor{void}

% ---- drawing: grid + gold frame on EVERY page ----
\RequirePackage{tikz}
\RequirePackage{amsmath}                    % \frac,\text,cases,\tfrac (drafter request 2026-11-02)
\RequirePackage{amssymb}                    % \mathbb,\Box
\RequirePackage{eso-pic}
\newcommand{\alienbackground}{%
  \begin{tikzpicture}[remember picture, overlay]
    \draw[gridline, step=0.5cm, line width=0.25pt, opacity=0.16]
      (current page.south west) grid (current page.north east);
    \draw[gold, line width=1pt]
      ([shift={(0.45in,0.45in)}]current page.south west)
      rectangle
      ([shift={(-0.45in,-0.45in)}]current page.north east);
  \end{tikzpicture}%
}
\AddToShipoutPictureBG{\alienbackground}

% ---- sigils ----
\RequirePackage{alien-sigils}

% folio code -> canon sigil map
\newcommand{\foliomap}[2]{\expandafter\def\csname fsmap@#1\endcsname{#2}}
\foliomap{IT-PLEROMA}{pentagons}
\foliomap{IT-OMEGA}{starpolygon}
\foliomap{IT-HORIZON}{hyperbola}
\foliomap{IT-COGNITION}{dial}
\foliomap{IT-FIELD}{dipole}
\foliomap{IT-RY-HAM}{stems}
\foliomap{IT-MARKET}{spiral}
\foliomap{IT-NEURO}{network}

% ---- manuscript metadata ----
\def\thefoliocode{IT-XXXX}
\def\thefoliosigil{pentagons}
\newcommand{\folio}[1]{%
  \def\thefoliocode{#1}%
  \@ifundefined{fsmap@#1}{%
    \PackageWarning{alienfolio}{No canon sigil mapped for folio '#1'; use \protect\usesigil{name}}%
    \def\thefoliosigil{pentagons}%
  }{%
    \edef\thefoliosigil{\csname fsmap@#1\endcsname}%
  }%
}
\newcommand{\usesigil}[1]{\def\thefoliosigil{#1}}

\def\thepapersubtitle{}
\newcommand{\papersubtitle}[1]{\def\thepapersubtitle{#1}}
\def\thepaperauthors{Ryan W.\ Yett (Architect)\\Chyren (Sovereign Analysis)}
\newcommand{\paperauthors}[1]{\def\thepaperauthors{#1}}
\def\theaffil{Independent Research, Arkansas}
\newcommand{\affil}[1]{\def\theaffil{#1}}
\def\theorcid{0009-0001-1303-7190}
\newcommand{\orcidnum}[1]{\def\theorcid{#1}}
\def\theshorttitle{}
\newcommand{\shorttitle}[1]{\def\theshorttitle{#1}}
\def\theshortauthors{R.\,W.\ Yett \& Chyren}
\newcommand{\shortauthors}[1]{\def\theshortauthors{#1}}
\AtBeginDocument{%
  \ifx\theshorttitle\empty\def\theshorttitle{\@title}\fi
  \color{bodytext}%
}
\everymath{\color{bodytext}}
% NOTE (2026-11-02): \everydisplay{\color{bodytext}} REMOVED — it breaks
% amsmath align/gather ("Improper \halign inside display"). Display math
% inherits bodytext from \AtBeginDocument automatically.

% ---- running head / foot for interior pages ----
\RequirePackage{fancyhdr}
\fancypagestyle{alien}{%
  \fancyhf{}
  % single full-width tabular*: title left, authors center,
  % affiliation + ORCID right — columns share \textwidth, never overlap
  \fancyhead[L]{%
    \scriptsize\color{muted}%
    \begin{tabular*}{\textwidth}{@{}l@{\extracolsep{\fill}}c@{\extracolsep{\fill}}r@{}}%
      \theshorttitle & \theshortauthors & \theaffil\ -- ORCID \theorcid
    \end{tabular*}%
  }
  \fancyhead[C]{}
  \fancyhead[R]{}
  \renewcommand{\headrulewidth}{0.5pt}
  \renewcommand{\headrule}{{\color{gold}\hrule height\headrulewidth}}
  \fancyfoot[C]{%
    \tikz[baseline=-0.5ex]\node[draw=gold, line width=0.6pt,
      inner sep=4pt, outer sep=0] {\small\color{gold}\thepage};%
  }
}
\fancypagestyle{cover}{\fancyhf{}\renewcommand{\headrulewidth}{0pt}}
\pagestyle{alien}

% ---- sectioning: gold serif heads, cyan italic subsections ----
\RequirePackage{titlesec}
\titleformat{\section}
  {\Large\bfseries\color{gold}}
  {\thesection}{0.8em}{}
  [\vspace{0.6ex}{\color{gold}\titlerule[0.7pt]}]
\titleformat{\subsection}
  {\large\itshape\color{flow}}
  {\thesubsection}{0.8em}{}
\titlespacing*{\section}{0pt}{2.4ex plus 0.6ex}{1.4ex}
\titlespacing*{\subsection}{0pt}{1.8ex plus 0.4ex}{1.0ex}

% ---- links: gold ----
\RequirePackage{hyperref}
\hypersetup{colorlinks=true, linkcolor=gold, urlcolor=gold,
  citecolor=gold, filecolor=gold}

% ---- cover: v2 — the emblem large on the upper-right thirds
% intersection, title block left-aligned below it. (RY 2026-11-02:
% larger emblem, offset rule-of-thirds composition, softer grid.)
% Legibility pass 2026-11-07 (RY approved): title \LARGE -> \huge with
% wider tracking (textls 55 -> 70); muted grey brightened 9AA0B0 -> C5C9D4.
% NOTE: title was already \bfseries — the size bump, not a weight change,
% is what makes it pop; the grey brightening is the bigger legibility win.
% 1 void+grid, 2 gold frame (both from the shipout background)
\newcommand{\makecover}{%
  \thispagestyle{cover}%
  % 3 — the emblem, large, on the upper-right thirds intersection
  \begin{tikzpicture}[remember picture, overlay]
    % monumental sigil, clipped to just inside the gold frame (0.47in) so
    % the border stays clean and unbroken
    \clip ([shift={(0.47in,0.47in)}]current page.south west)
          rectangle ([shift={(-0.47in,-0.47in)}]current page.north east);
    \node (emblem) at (current page.center) [yshift=-0.25in]
      {\sigil[scale=11.85]{\thefoliosigil}};
  \end{tikzpicture}%
  % title block — centered on the page, at the heart of the sigil
  \begin{tikzpicture}[remember picture, overlay]
    \node[align=center, text width=0.8\textwidth] at (current page.center) {%
      % centered titles never hyphenate (a broken word across lines reads
      % as a mistake on a cover); wrap at word boundaries instead
      \hyphenpenalty=10000
      {\huge\color{white}\bfseries
       \IfFileExists{microtype.sty}{\textls[70]{\@title}}{\@title}\par}
      \vspace{0.14in}
      \ifx\thepapersubtitle\empty\else
        {\large\itshape\color{muted}\thepapersubtitle\par}
        \vspace{0.14in}
      \fi
      {\color{gold}\rule{4cm}{0.8pt}\par}
      % byline rides with the title in the sigil's central void, where the
      % star's edges leave a wide clear band (the foot is too narrow for it)
      \vspace{0.18in}
      {\large\color{bodytext}\thepaperauthors\par}
    };
  \end{tikzpicture}%
  \begin{center}
    \vspace*{0.30in}
    % 4 — monospace kicker, two short centered lines so each fits the
    % clear band between the star's converging edges (a single full-width
    % line is struck by the star's diagonal edges at this scale)
    {\ttfamily\footnotesize\color{muted}%
     TRANSMISSION / GEOMETRICALLY ORDERED DYNAMICS\par}
    \vspace{0.04in}
    {\ttfamily\footnotesize\color{muted}%
     FOLIO \thefoliocode\par}
    \vspace{0.16in}
    % 5 — short gold rule
    {\color{gold}\rule{4cm}{0.8pt}\par}
  \end{center}
  % title block now lives in the centered overlay node above; the byline
  % stays anchored at the foot by \vfill
  \vfill
  % 9 — affiliation + tier footer, anchored toward the foot of the cover,
  % each line short enough to sit inside the star's narrowing lower V
  \begin{center}
    % affiliation split over two centered lines so each fits the clear
    % band between the star's converging lower edges
    {\small\color{muted}\theaffil\par}
    \vspace{0.06in}
    {\small\color{muted}ORCID \theorcid\par}
    \vspace{0.30in}
    % tier footer — design element AND honesty system; never leaves the cover.
    % Split over three short lines so each clears the star's edges.
    {\ttfamily\footnotesize\color{gold}%
     results stated in tier --\par}
    {\ttfamily\footnotesize\color{gold}%
     theorem / empirical /\par}
    {\ttfamily\footnotesize\color{gold}%
     conjecture -- limits first\par}
    % trailing space lifts the foot block up into the wider part of the
    % star's lower V, so every line clears the converging edges — but not
    % so far that the affiliation rides the star's horizontal cyan edge
    \vspace{0.80in}
  \end{center}
  \clearpage
}

% ---- notice boxes: gold-bordered, shared style ----
% RY's convergence rule: every manuscript opens with a convergence
% statement naming (1) the central claim it converges on, (2) its unique
% angle vs the sibling papers, (3) cross-references to sibling papers as
% other angles on the same claim.
% Canonical claim names: INFORMATION TENSION, THE SHADOW (E8xE8),
% THE OBSERVER (ARI / sovereign cognition).
\newenvironment{convergence}[1]{%
  \par\vspace{1.5ex}
  \noindent{\color{gold}\rule{\textwidth}{0.7pt}}\par
  \noindent{\ttfamily\small\color{gold} CONVERGENCE -- #1}\par\smallskip
  \noindent\color{bodytext}\ignorespaces
}{%
  \par\noindent{\color{gold}\rule{\textwidth}{0.7pt}}\par\vspace{1.5ex}
}

% supersession / correction note (canon rule: a correction BECOMES the
% paper; the note records what was superseded)
\newenvironment{supersession}{%
  \par\vspace{1.5ex}
  \noindent{\color{gold}\rule{\textwidth}{0.7pt}}\par
  \noindent{\ttfamily\small\color{gold} SUPERSESSION NOTE}\par\smallskip
  \noindent\color{bodytext}\ignorespaces
}{%
  \par\noindent{\color{gold}\rule{\textwidth}{0.7pt}}\par\vspace{1.5ex}
}

% ---- small author utilities ----
\newcommand{\goldrule}{%
  \begin{center}\textcolor{gold}{\rule{0.35\textwidth}{0.7pt}}\end{center}}
\newcommand{\key}[1]{\textbf{\textcolor{white}{#1}}}   % key terms: bold white
\newcommand{\tiertag}[1]{{%
  \ttfamily\small\color{gold}[TIER: \MakeUppercase{#1}]}}
\newcommand{\doi}[1]{\href{https://doi.org/#1}{\nolinkurl{#1}}}
