\version "2.20"

\header {
  title = 	"L'Arabesque"
  composer =	"Friedrich Burgmüller (1806 - 1874)"
  maintainer = 	"Tim Burgess"
  maintainerEmail = "timburgess@mac.com"
  tagline = ""
}

\paper {
    oddHeaderMarkup = \markup {
        \fill-line
        {
          \fromproperty #'page:page-number-string                   %% left
          \on-the-fly #not-first-page \fromproperty #'header:title  %% center
          " "                                                       %% right
         }
    }
    evenHeaderMarkup = \oddHeaderMarkup
}

global = {
  \key c \major
  \numericTimeSignature \time 2/4
  %\tempo 4 = 96
}

primaryone = \relative g' {
  a16-1( b16 c16 b16 a8-.) r8 |
}

primaryonenoslur = \relative g' {
  a16-1 b16 c16 b16 a8-.) r8 |
}

primarytwo = \relative g' {
  a16( b16 c16 d16 e8-.) r8 |
}

primarythree = \relative g'' {
  d16(-1 e16 f16 g16 a8-.) r8 |
}

primaryfour = \relative g'' {
  a16-1( b16 c16 d16 e8-.) r8 |
}

secondaryonetwo = \relative g'' {
  r8 e8-.-3 e8( f8 d8-.) r8 d4~(-> d8 g8 d8 e8 
}

secondarythree = \relative g' {
  c8) r8 e4(-5
}

bridge = \relative g' {
  \clef "treble"
  d16(-5 e16 f16 g16 a8) g8( | f8-1 e8 d8 cis8-2 | e8 d8 c8 b8) |
  \clef "bass"
}

aminor = \relative g { <a c e>4-. <a c e>4-. }
dminor = \relative g { <a d f>4-. <a d f>4-. }
cmajor = \relative g { <g c e>4-. <g c e>4-. }
gseven = \relative g { <g b f'>4-. <g b f'>4-. }

rh =  {
  \clef "treble"
  \relative g {
  R2*2
  \primaryone \primarytwo \break
  \primarythree \primaryfour
  \secondaryonetwo \break
  \secondarythree \primaryonenoslur \primarytwo \primarythree \break
  \primaryfour \secondaryonetwo c'4 c'8)-. r8 | \break
  % measure 19
  e,4.(-5 b8-2 | c4.) a8(-1 | e'4. b8 | c4.) a8( | \break
  a'4.-> e8-2 | f4.)-3 e8( |
  d8 c8-3 b8 a8 | gis4-2 e'4) | \break
  \primaryone \primarytwo \primarythree \primaryfour

    \bar "||"
  }
}

lh =  {
  \clef "bass"
  \relative g {
  \aminor \aminor \aminor \aminor \dminor \aminor
  \cmajor \gseven \gseven
  <c e>8 r8 e4 |
  \aminor \aminor \dminor \aminor
  \cmajor \gseven \gseven <c e>4. r8 |
  gis16 a16 b16 a16 gis8 r8 |
  a16 b16 c16 d16 e8 r8 |
  gis,16 a16 b16 a16 gis8 r8 | %repeat
  a16 b16 c16 d16 e8 r8 | %repeat
  % measure 19
  cis16-3 d16 e16 d16 cis8-. r8 |
  \bridge
  \aminor \aminor \dminor \aminor |

  }
}

\score {
   \context PianoStaff \with { instrumentName = "Piano" } << 
      \context Staff = "rh" <<
        \global
        \rh
      >>
      \context Staff = "lh" <<
        \global
        \lh
      >>
    >>
  \layout { }
  \midi { }
}

