#import "@preview/cetz:0.5.3": canvas, draw

#let gate-feedback(width) = canvas(length: width / 330, {
  import draw: *
  let ink = rgb("#2f4d5b")
  rect((7, 20), (123, 63), radius: 3, fill: rgb("#e7f1f6"), stroke: .6pt + ink)
  rect((207, 20), (323, 63), radius: 3, fill: rgb("#e9f3eb"), stroke: .6pt + ink)
  content((65, 42), text(size: 9pt)[铁电极化翻转])
  content((265, 42), text(size: 9pt)[栅侧注入与俘获])
  line((124, 49), (205, 49), stroke: .7pt + ink, mark: (end: "stealth"))
  line((205, 34), (124, 34), stroke: .7pt + ink, mark: (end: "stealth"))
  content((165, 69), text(size: 8pt)[增强阻挡层电场])
  content((165, 14), text(size: 8pt)[补偿极化束缚电荷])
})
