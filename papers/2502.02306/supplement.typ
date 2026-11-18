// Kozlowski and Pugnaloni, arXiv:2502.02306v1. Converted from LaTeX under CC BY 4.0.
// https://arxiv.org/abs/2502.02306v1 | https://creativecommons.org/licenses/by/4.0/
#let horizontalrule = line(start: (25%,0%), end: (75%,0%))

#show terms: it => {
  it.children
    .map(child => [
      #strong[#child.term]
      #block(inset: (left: 1.5em, top: -0.4em))[#child.description]
      ])
    .join()
}

#set table(
  inset: 6pt,
  stroke: none
)

#show figure.where(
  kind: table
): set figure.caption(position: top)

#show figure.where(
  kind: image
): set figure.caption(position: bottom)

#let content-to-string(content) = {
  if content.has("text") {
    content.text
  } else if content.has("children") {
    content.children.map(content-to-string).join("")
  } else if content.has("body") {
    content-to-string(content.body)
  } else if content == [ ] {
    " "
  }
}
#let conf(
  title: none,
  subtitle: none,
  authors: (),
  keywords: (),
  date: none,
  abstract-title: none,
  abstract: none,
  thanks: none,
  cols: 1,
  margin: (x: 1.25in, y: 1.25in),
  paper: "us-letter",
  lang: "en",
  region: "US",
  font: none,
  fontsize: 11pt,
  mathfont: none,
  codefont: none,
  linestretch: 1,
  sectionnumbering: none,
  linkcolor: none,
  citecolor: none,
  filecolor: none,
  pagenumbering: "1",
  doc,
) = {
  set document(
    title: title,
    keywords: keywords,
  )
  set document(
      author: authors.map(author => content-to-string(author.name)).join(", ", last: " & "),
  ) if authors != none and authors != ()
  set page(
    paper: paper,
    margin: margin,
    numbering: pagenumbering,
    columns: cols
  )

  set par(
    justify: true,
    leading: linestretch * 0.65em
  )
  set text(lang: lang,
           region: region,
           size: fontsize)

  set text(font: font) if font != none
  show math.equation: set text(font: mathfont) if mathfont != none
  show raw: set text(font: codefont) if codefont != none

  set heading(numbering: sectionnumbering)

  show link: set text(fill: rgb(content-to-string(linkcolor))) if linkcolor != none
  show ref: set text(fill: rgb(content-to-string(citecolor))) if citecolor != none
  show link: this => {
    if filecolor != none and type(this.dest) == label {
      text(this, fill: rgb(content-to-string(filecolor)))
    } else {
      text(this)
    }
  }

  block(below: 1em, width: 100%)[
    #if title != none {
      align(center, block[
          #text(weight: "bold", size: 1.5em)[#title #if thanks != none {
              footnote(thanks, numbering: "*")
              counter(footnote).update(n => n - 1)
            }]
          #(
            if subtitle != none {
              parbreak()
              text(weight: "bold", size: 1.25em)[#subtitle]
            }
           )])
    }

    #if authors != none and authors != [] {
      let count = authors.len()
      let ncols = calc.min(count, 3)
      grid(
        columns: (1fr,) * ncols,
        row-gutter: 1.5em,
        ..authors.map(author => align(center)[
          #author.name \
          #author.affiliation \
          #author.email
        ])
      )
    }

    #if date != none {
      align(center)[#block(inset: 1em)[
          #date
        ]]
    }

    #if abstract != none {
      block(inset: 2em)[
        #text(weight: "semibold")[#abstract-title] #h(1em) #abstract
      ]
    }
  ]

  doc
}
#show: doc => conf(
  title: [Supplemental materials: Flow rate from a vertical silo with a
tilted orifice],
  authors: (
    ( name: [Ryan Kozlowski],
      affiliation: "",
      email: "" ),
    ( name: [Luis A. Pugnaloni],
      affiliation: "",
      email: "" ),
    ),
  abstract-title: [Abstract],
  pagenumbering: "1",
  cols: 1,
  doc,
)


#block[
]
#set heading(numbering: "1.1")
#set math.equation(numbering: "(1)")

= Profiles of $v_perp$ and $v_(\| \|)$ along orifice and narrowest opening cross-sections
<profiles-of-v_perp-and-v_-along-orifice-and-narrowest-opening-cross-sections>
Profiles of each component of velocity $v_perp$ and $v_(\| \|)$ with
respect to the cross-section normal vector are shown in
Fig.~@fig:profilevperpvpar1 (cross-section along the orifice) and
Fig.~@fig:profilevperpvpar2 (narrowest opening cross-section). $v_perp$
is the component perpendicular to the cross-section, or aligned with the
normal vector of the cross-section. $v_(\| \|)$ is the component
parallel to the cross-section, or aligned with the cross-section itself.
Refer to Secs. 2 and 3 in the main text for the definitions of $v_perp$
and $v_(\| \|)$ and the protocol for measuring profiles, as well as
Figs. 6 and 15 for profiles of packing fraction, speed, and flow angle.

#figure(image("graphics/FigureS1_ProfilesVperpVpar.svg", width: 70.0%),
  caption: [
    Profiles along the orifice of (a,c) outpouring velocity $v_perp$ and
    (b,d) the component of velocity along the orifice $v_(\| \|)$ for
    (top row) the flat edge case and (bottom row) the fixed grain case,
    at varying elevation angles $theta$ (see color scale).
  ]
)
<fig:profilevperpvpar1>

#figure(image("graphics/FigureS2_ProfilesVperpVparNarrowest.svg", width: 70.0%),
  caption: [
    Profiles along the narrowest opening cross-section of (a,c) the
    component of velocity $v'_perp$ directed along the cross-section
    normal and (b,d) the component of velocity along the cross-section
    $v'_(\| \|)$ for (top row) the flat edge case and (bottom row) the
    fixed grain case, at varying elevation angles $theta$ (see color
    scale).
  ]
)
<fig:profilevperpvpar2>

= Heat maps of average flow
<heat-maps-of-average-flow>
The average speed $v$ and $phi.alt$ heat maps for all $theta$, in both
the flat edge and fixed grain cases, are shown in Fig.~@fig:heatmapspeed
and~@fig:heatmappf. The heat maps are obtained by segmenting
experimental images into $1 d times 1 d$ bins and averaging the packing
fraction $phi.alt$ and speed $v$ (weighting the speed average based on
contribution to packing fraction in each bin) of grains overlapping each
bin throughout all frames.

#figure(image("graphics/FigureS3_HeatmapSpeed.svg", width: 100.0%),
  caption: [
    Heat map of speed $v$ for flat edge and fixed grain cases. Labels
    indicate the orifice angle $theta$.
  ]
)
<fig:heatmapspeed>

#figure(image("graphics/FigureS4_HeatmapPackingFraction.svg", width: 100.0%),
  caption: [
    Heat map of packing fraction $phi.alt$ for flat edge and fixed grain
    cases. Labels indicate the orifice angle $theta$.
  ]
)
<fig:heatmappf>

= Supplemental videos
<supplemental-videos>
The following sample videos from experiment trials in this manuscript
are available as Supplemental Materials. The imaging frame rate for each
video is given below. All videos are played back 25$times$ slower than
real time.

- #strong[flat edge 0 degrees]: 2000 frames per second.

- #strong[flat edge 10 degrees]: 2000 frames per second.

- #strong[flat edge 19 degrees]: 2000 frames per second.

- #strong[flat edge 29 degrees]: 2000 frames per second.

- #strong[flat edge 38 degrees]: 2000 frames per second.

- #strong[flat edge 47 degrees]: 2000 frames per second.

- #strong[flat edge 57 degrees]: 2000 frames per second.

- #strong[flat edge 66 degrees]: 2000 frames per second.

- #strong[flat edge 76 degrees]: 2000 frames per second.

- #strong[flat edge 86 degrees]: 1000 frames per second.

- #strong[flat edge 96 degrees]: 1000 frames per second.

- #strong[flat edge 106 degrees]: 1000 frames per second.

- #strong[flat edge 116 degrees]: 750 frames per second.

- #strong[flat edge 127 degrees]: 750 frames per second.

- #strong[flat edge 137 degrees]: 750 frames per second.

- #strong[fixed grain 0 degrees]: 2000 frames per second.

- #strong[fixed grain 10 degrees]: 2000 frames per second.

- #strong[fixed grain 19 degrees]: 2000 frames per second.

- #strong[fixed grain 29 degrees]: 2000 frames per second.

- #strong[fixed grain 38 degrees]: 2000 frames per second.

- #strong[fixed grain 47 degrees]: 2000 frames per second.

- #strong[fixed grain 57 degrees]: 2000 frames per second.

- #strong[fixed grain 66 degrees]: 2000 frames per second.

- #strong[fixed grain 76 degrees]: 2000 frames per second.

- #strong[fixed grain 86 degrees]: 1000 frames per second.

- #strong[fixed grain 96 degrees]: 1000 frames per second.

- #strong[fixed grain 106 degrees]: 1000 frames per second.

- #strong[fixed grain 116 degrees]: 750 frames per second.
