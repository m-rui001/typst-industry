#let paper(title, abstract, body) = {
  set document(title: title, author: ("Hyeonsu Lee", "Jihoon Jeong"))
  set page(paper: "us-letter", margin: 72pt, numbering: "1")
  set text(font: "New Computer Modern", size: 10pt, lang: "en")
  set par(justify: true, leading: .45em, spacing: .66em)
  set heading(numbering: "1.")
  set figure(gap: 7pt)
  show figure.caption: set text(size: 9.5pt)
  show figure.where(kind: table): set table(stroke: none, inset: (x: 4pt, y: 3pt))
  show figure.where(kind: table): set text(size: 8.7pt)
  set math.equation(numbering: "(1)")
  line(length: 100%, stroke: 1.5pt)
  v(6pt)
  align(center, text(size: 17pt, smallcaps(title)))
  v(5pt)
  align(center, smallcaps[A Preprint])
  v(4pt)
  line(length: 100%, stroke: .6pt)
  v(16pt)
  align(center)[
    Hyeonsu Lee, Jihoon Jeong#footnote[Corresponding Author] #linebreak()
    Wm Michael Barnes ’64 Department of Industrial and Systems Engineering #linebreak()
    Texas A&M University #linebreak()
    College Station, TX 77843, USA #linebreak()
    {hslee, jihoonjeong}\@tamu.edu
  ]
  v(12pt)
  align(center)[April 17, 2026]
  align(center, smallcaps[Abstract])
  pad(x: 36pt, abstract)
  v(6pt)
  [_Keywords_ #h(8pt) Temperature Prediction · Physics-Informed Neural Networks · Material-Agnostic · Additive Manufacturing]
  body
}

#let snapshots(..items) = grid(columns: (1fr, 1fr, 1fr), gutter: 3pt, ..items.pos())

#let unnumbered(body) = {
  set math.equation(numbering: none)
  body
}

#let procedure(title, ..rows) = figure(
  {
    set text(size: 9pt)
    set par(justify: false)
    line(length: 100%, stroke: .5pt)
    let step = 0
    for (indent, numbered, body) in rows.pos() {
      if numbered { step += 1 }
      block(above: 3pt, below: 3pt, grid(columns: (1.8em, 1fr), align: left,
        if numbered { text(str(step) + ".") },
        pad(left: indent * 1em, body),
      ))
    }
    line(length: 100%, stroke: .5pt)
  },
  kind: "algorithm", supplement: [Algorithm], caption: title,
)
