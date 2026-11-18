#import "@preview/cetz:0.5.3": canvas, draw

#let fold-delay(width) = canvas(length: width / 320, {
  import draw: *
  let ink = rgb("#304553")
  let blue = rgb("#246c9d")
  let red = rgb("#b24a32")
  let label(at, body) = content(at, text(size: 9pt, body))
  line((38, 22), (296, 22), mark: (end: "stealth"), stroke: .5pt + ink)
  line((38, 22), (38, 124), mark: (end: "stealth"), stroke: .5pt + ink)
  bezier((56, 43), (134, 83), (84, 72), (110, 83), stroke: 1.1pt + blue)
  bezier((134, 83), (174, 70), (148, 83), (166, 78), stroke: (paint: blue, dash: "dashed", thickness: 1pt))
  bezier((70, 55), (175, 101), (103, 79), (141, 87), stroke: 1.2pt + red)
  line((176, 101), (228, 101), mark: (end: "stealth"), stroke: 1.2pt + red)
  circle((134, 83), radius: 2, fill: blue, stroke: none)
  label((115, 104), [折点])
  label((256, 102), [有限质量：延后跳跃])
  label((103, 43), [临界流形])
  label((288, 10), [快变量 $s$])
  label((30, 138), [慢变量 $r$])
})
