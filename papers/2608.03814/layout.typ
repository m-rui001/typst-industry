#let manuscript(title, abstract, keywords, body) = {
  set document(title: title, author: (
    "Dong Hee Kang", "Jaeseung Lim", "Mishfaqur Rahman", "Seongheum Han",
    "Jae-Hak Lee", "Seungman Kim", "Jihoon Jeong",
  ))
  set page(paper: "us-letter", margin: (x: 117pt, y: 91pt), numbering: "1")
  set text(font: "New Computer Modern", size: 12pt, lang: "en")
  set par(justify: true, leading: .65em, first-line-indent: 1em)
  set heading(numbering: "1.")
  show heading.where(level: 2): set text(size: 12pt, style: "italic", weight: "regular")
  set math.equation(numbering: "(1)")
  set figure(gap: 8pt)
  show figure.caption: set text(size: 10pt)
  show figure.caption: set par(first-line-indent: 0pt, leading: .55em)
  show figure.where(kind: table): set table(stroke: none, inset: (x: 3pt, y: 4pt))
  show figure.where(kind: table): set text(size: 9pt)
  align(center, {
    set par(first-line-indent: 0pt, justify: false, leading: .42em)
    text(16pt, title)
    v(8pt)
    text(11pt)[
      Dong Hee Kang#super[a], Jaeseung Lim#super[b,c], Mishfaqur Rahman#super[a],
      Seongheum Han#super[b], Jae-Hak Lee#super[b], Seungman Kim#super[b,c,∗],
      Jihoon Jeong#super[a,∗]#footnote(numbering: "*")[
        Corresponding authors: jihoonjeong\@tamu.edu and kimsm\@kimm.re.kr
      ]
    ]
    v(4pt)
    text(9pt, style: "italic")[
      #super[a]Wm Michael Barnes ’64 Department of Industrial & Systems Engineering,
      Texas A&M University, College Station, TX 77843, United States \\
      #super[b]Semiconductor Manufacturing Research Center, Korea Institute of Machinery
      and Materials (KIMM), Daejeon 34103, Republic of Korea \\
      #super[c]Department of Robot · Manufacturing Systems, University of Science and
      Technology (UST), Daejeon 34113, Republic of Korea
    ]
  })
  v(20pt)
  strong[Abstract]
  par(first-line-indent: 0pt, abstract)
  par(first-line-indent: 0pt)[_Keywords:_ #keywords]
  body
}

#let appendix(letter, key, title, body) = {
  counter(math.equation).update(0)
  counter(heading).update((0,))
  set math.equation(numbering: n => "(" + letter + "." + str(n) + ")")
  set heading(numbering: (..levels) => "Appendix " + letter + "." + levels.pos().slice(1).map(str).join(".") + ".")
  [#heading(numbering: none)[Appendix #letter. #title]#label(key)]
  body
}

#let sources(..entries) = {
  heading(numbering: none)[References]
  for (i, item) in entries.pos().enumerate() {
    block(above: 5pt, below: 5pt, grid(columns: (2em, 1fr), [\[#(i + 1)\]], item))
  }
}
