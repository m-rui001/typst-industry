#let manuscript(title, body) = {
  set document(title: title, author: ("Hector A. Jimenez-Romero", "Wolfgang Heidrich"))
  set page(paper: "us-letter", margin: (x: 117pt, y: 93pt))
  set text(font: "Times New Roman", size: 10pt, lang: "en")
  set par(justify: true, leading: .56em, first-line-indent: 10pt)
  set heading(numbering: "1.")
  set math.equation(numbering: "(1)")
  set figure(gap: 6pt)
  show figure.where(kind: image): set figure(supplement: [Fig.])
  show figure.caption: set figure.caption(separator: [. ])
  show figure.caption: set text(size: 9pt)
  show figure.caption: set par(first-line-indent: 0pt, leading: .4em)
  show heading.where(level: 2): set text(weight: "regular", style: "italic")
  show heading.where(level: 3): set text(weight: "regular", style: "italic")

  block(width: 100%, {
    text(font: "Arial", size: 16pt, weight: "bold", title)
    v(13pt)
    text(size: 12pt, weight: "bold", smallcaps[
      Hector A. Jimenez-Romero,#super[1] and Wolfgang Heidrich#super[1,\*]
    ])
    v(5pt)
    text(size: 9pt, style: "italic")[
      #super[1]King Abdullah University of Science and Technology (KAUST), Thuwal 23955-6900, Saudi Arabia
    ]
    linebreak()
    text(size: 9pt)[#super[\*]#link("mailto:wolfgang.heidrich@kaust.edu.sa")[wolfgang.heidrich\@kaust.edu.sa]]
  })
  v(22pt)
  body
}
