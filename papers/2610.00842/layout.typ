#let article(body, supplement: false) = {
  set page(paper: "us-letter", margin: (x: 110pt, y: 95pt), numbering: "1")
  set text(font: "Libertinus Serif", lang: "en", size: 11.5pt)
  set par(justify: true, leading: 0.54em, first-line-indent: 1em)
  show figure.caption: set par(first-line-indent: 0pt)
  show figure.caption: set align(left)
  set heading(numbering: "1.1")
  set heading(numbering: "S1.1") if supplement
  set math.equation(numbering: "(1)")
  set figure.caption(separator: [. ])
  body
}

#let author(name, orcid) = link("https://orcid.org/" + orcid, name)
#let mackey = author([Brendan Mackey], "0009-0002-6509-1196")
#let smith = author([Levi Smith], "0000-0001-5996-5745")
#let yu = author([Bosco Yu], "0000-0002-6786-3367")
#let authors = [#mackey, #smith, and #yu]

#let highlights(title, body) = [
  #v(23pt)
  #text(15pt)[Highlights]

  #strong(title)

  #authors

  #body
]

#let front(title) = align(center)[
  #text(16pt, weight: "bold", title)

  #mackey#super[1], #smith#super[2,3], #yu#super[1,3,4]

  #text(8pt, style: "italic")[
    #super[1] Department of Mechanical Engineering, University of Victoria, Victoria, BC V8P 3E6, Canada \
    #super[2] Department of Electrical and Computer Engineering, University of Victoria, Victoria, BC V8P 5C2, Canada \
    #super[3] Center for Advanced Materials and Related Technology, University of Victoria, Victoria, BC V8P 5C2, Canada \
    #super[4] Institute for Integrated Energy Systems, University of Victoria, Victoria, BC V8P 5C2, Canada
  ]

  #text(8pt)[
    Correspondence · #link("mailto:boscoyu@uvic.ca", "boscoyu@uvic.ca") \
    Typst adaptation of #link("https://arxiv.org/abs/2610.00842v1")[arXiv:2610.00842v1] ·
    #link("https://creativecommons.org/licenses/by/4.0/")[CC BY 4.0]
  ]
]

#let abstract(body, keywords: none) = [
  #line(length: 100%, stroke: 0.45pt)
  *Abstract*

  #body

  #if keywords != none [*Keywords.* #keywords]

  #line(length: 100%, stroke: 0.45pt)
]
