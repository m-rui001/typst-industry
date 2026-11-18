#set document(title: "Supplementary figures — Accelerating field decay along nonlocal metasurfaces")
#set page(paper: "a4", margin: 21mm)
#title[Supplementary figures]
#link("main.typ")[Accelerating field decay along nonlocal metasurfaces by suppressing the Norton wave]
#set figure(numbering: n => "S." + str(n))
#for n in range(1, 5) {
  figure(image("source/SM_" + str(n) + ".pdf", width: 100%, height: 195mm, fit: "contain"), caption: [Supplementary figure #n.])
  if n < 4 { pagebreak() }
}
