#import "@preview/cetz:0.5.3": canvas, draw

#let entropy-bars(width) = canvas(length: width / 305, {
  import draw: *
  let ink = rgb("#274251")
  for (index, (material, value, label, fill)) in (
    ([Eu₂In], 28.2, [28.2], rgb("#245e79")),
    ([Pr₂In], 15, [约 15], rgb("#4e8095")),
    ([Nd₂In], 13, [约 13], rgb("#6b94a2")),
  ).enumerate() {
    let y = 66 - index * 22
    let right = 52 + value * 6.6
    content((26, y), text(size: 9pt, material))
    rect((52, y - 6), (right, y + 6), fill: fill, stroke: none)
    content((right + 20, y), text(size: 9pt, label))
  }
  line((52, 13), (255, 13), stroke: .5pt + ink)
  content((152, 3), text(size: 8.5pt, [峰值熵变幅度（J·kg⁻¹·K⁻¹）]))
})
