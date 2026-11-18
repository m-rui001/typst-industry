#import "@preview/cetz:0.5.3": canvas, draw
#let confinement = canvas(length: 1mm, {
  import draw: *
  for (x, ratio, description) in (
    (34, [粒径／管径 0.082], [流速升高后曳力分布较窄]),
    (106, [粒径／管径 0.22], [曳力波动随流速非单调变化]),
  ) {
    rect((x - 34, 0), (x + 34, 19), fill: rgb("#edf4f7"), stroke: none)
    content((x, 13), text(weight: "bold", ratio))
    content((x, 6), description)
  }
})
#set text(font: "Microsoft YaHei", size: 9pt, lang: "zh")
#confinement
