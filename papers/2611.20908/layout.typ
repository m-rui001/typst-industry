#let article(body, supplement: false) = {
  set page(paper: "us-letter", margin: (x: 47pt, y: 50pt), numbering: "1")
  set text(font: "Libertinus Serif", size: 10pt, lang: "en")
  set par(justify: true, leading: 0.53em)
  set page(margin: (x: 72pt, y: 65pt)) if supplement
  set text(size: 11pt) if supplement
  set par(leading: 0.88em) if supplement
  show figure.where(kind: table): set text(size: 9pt)
  show figure.where(kind: table): set figure.caption(position: top)
  set table(stroke: (x, y) => (top: if y <= 1 { 0.5pt }))
  set math.equation(numbering: "(1)")
  set heading(numbering: "1.1")
  set figure.caption(separator: [. ])
  body
}

#let source-ref(number, destination) = link(destination, text(fill: rgb("#234366"), "[" + str(number) + "]"))

#let reference-entry(number, destination, body) = [
  #block(above: 4pt, below: 4pt)[
    #box(width: 2em)[[#number]]#body
  ]#destination
]
