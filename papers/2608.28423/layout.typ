#let article(body) = {
  set page(paper: "a4", margin: (x: 17mm, y: 17mm), numbering: "1")
  set text(font: "New Computer Modern", size: 10pt)
  set par(justify: true, leading: 0.54em)
  set heading(numbering: "1.1")
  show heading: set text(size: 10pt)
  set math.equation(numbering: "(1)")
  set figure(placement: auto)
  show figure.caption: set text(size: 8.5pt)
  show figure.where(kind: table): set figure.caption(position: top)
  show table: set text(size: 8pt)
  show table: set table(inset: (x: 3pt, y: 4pt))
  body
}
