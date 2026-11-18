#import "@preview/cetz:0.5.3": canvas, draw

#let two-port(width) = canvas(length: width / 320, {
  import draw: *
  let ink = rgb("#29627d")
  rect((120, 16), (200, 58), radius: 3, stroke: .6pt + ink, fill: rgb("#e5eff4"))
  content((160, 37), text(size: 9pt)[有损声腔])
  line((20, 37), (119, 37), stroke: 1pt + ink, mark: (end: "stealth"))
  line((300, 37), (201, 37), stroke: 1pt + ink, mark: (end: "stealth"))
  content((73, 51), text(size: 8pt)[入射波])
  content((246, 51), text(size: 8pt)[同相等幅入射波])
  content((160, 5), text(size: 8pt)[临界耦合时，输出趋近于零])
})
