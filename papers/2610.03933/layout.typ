#let manuscript(title, authors, abstract, keywords, body) = {
  set document(title: title, author: authors)
  set page(paper: "a4", margin: (x: 28.8mm, y: 34.5mm), numbering: "1")
  set text(font: "New Computer Modern", size: 12pt, lang: "en")
  set par(justify: true, leading: .74em, first-line-indent: 1em)
  set heading(numbering: "1.")
  show heading.where(level: 2): set text(size: 12pt, weight: "regular", style: "italic")
  set math.equation(numbering: "(1)")
  set figure(gap: 9pt)
  show figure.caption: set text(size: 10pt)
  show figure.caption: set par(leading: .56em, first-line-indent: 0pt)
  align(center, {
    set par(first-line-indent: 0pt, justify: false)
    text(17pt, title)
    v(14pt)
    text(11pt)[#authors.join(", ")#footnote(numbering: "*")[Corresponding Author Email: #link("mailto:heng.ban@pitt.edu")[heng.ban\@pitt.edu]]]
    v(5pt)
    text(9pt, style: "italic")[
      Department of Mechanical Engineering and Materials Science, University of Pittsburgh,
      3700 O’Hara St, Pittsburgh, 15213, PA, USA
    ]
  })
  v(21pt)
  strong[Abstract]
  par(first-line-indent: 0pt, abstract)
  par(first-line-indent: 0pt)[_Keywords:_ #keywords]
  body
}

#let panels(columns, ..items) = {
  set text(size: 10pt)
  set par(first-line-indent: 0pt, justify: false)
  grid(columns: (1fr,) * columns, column-gutter: 5pt, row-gutter: 5pt,
    ..items.pos())
}

#let panel(file, letter) = block(width: 100%, align(center)[
  #image(file, width: 100%) \\
  (#letter)
])
