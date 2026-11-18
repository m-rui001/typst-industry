#import "@preview/cetz:0.5.3": canvas, draw
#let impact = canvas(length: 1mm, {
  import draw: *
  let ink = rgb("#315e75")
  rect((34,6),(84,14),fill:rgb("#dfeef3"),stroke:.6pt+ink)
  line((9,33),(44,15),stroke:1pt+ink,mark:(end:"stealth"))
  line((48,15),(83,33),stroke:1pt+ink,mark:(end:"stealth"))
  content((15,39),text(size:9pt)[入射离子])
  content((83,39),text(size:9pt)[二次离子])
  content((59,10),text(size:9pt)[离子液体薄膜])
})
