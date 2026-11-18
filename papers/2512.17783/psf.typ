#import "@preview/cetz:0.5.3": canvas, draw
#set text(font: "Microsoft YaHei", lang: "zh")
#let psf = canvas(length: 1mm, {
  import draw: *
  let x0 = 41
  let scale = 90
  line((x0, 0), (x0 + 72, 0), stroke: .5pt)
  for value in (3.2, 3.4, 3.6, 3.8, 4.0) {
    let x = x0 + (value - 3.2) * scale
    line((x, 0), (x, -1.4), stroke: .5pt)
    content((x, -4), text(size: 8pt, [#value]))
  }
  content((77, -9), text(size: 9pt, [轴向半高全宽（µm）]))
  for (y, label, value, error) in ((24, [4 MHz], 3.55, 0.09), (16, [8 MHz], 3.43, 0.22), (8, [16 MHz], 3.55, 0.21)) {
    let x = x0 + (value - 3.2) * scale
    content((23, y), text(size: 9pt, label))
    line((x - error * scale, y), (x + error * scale, y), stroke: rgb("#315e75"))
    circle((x, y), radius: 1, fill: rgb("#315e75"), stroke: none)
  }
})
#psf
