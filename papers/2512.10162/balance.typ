#import "@preview/cetz:0.5.3": canvas, draw
#set text(font: "Microsoft YaHei", lang: "zh")

#let balance = canvas(length: 1mm, {
  import draw: *
  let start = 41
  let scale = 74
  let limit = start + 0.987 * scale
  for (y, label, value) in ((14, [外量子效率], 0.995), (2, [乘以吸收效率后], 0.897)) {
    content((19, y + 3), text(size: 9pt, label))
    rect((start, y), (start + value * scale, y + 6), fill: rgb("#3b7390"), stroke: none)
    content((132, y + 3), text(size: 9pt, [#value]))
  }
  line((limit, 0), (limit, 23), stroke: (paint: rgb("#a04632"), dash: "dashed"))
  content((limit, 27), text(size: 9pt, [制冷门槛 0.987]))
})

#balance
