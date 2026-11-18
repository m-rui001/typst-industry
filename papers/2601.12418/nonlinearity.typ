#import "@preview/cetz:0.5.3": canvas, draw
#let nonlinearity = canvas(length: 1mm, {
  import draw: *
  let y(v) = 10 * (1 + calc.log(v, base: 10))
  for v in (0.1, 1, 10, 100, 1000) {
    line((0, y(v)), (118, y(v)), stroke: rgb("#dce4ea"))
    content((-2, y(v)), str(v), anchor: "east")
  }
  for (x, v, label, color) in (
    (18, 151, [295 K], "#566675"), (40, 573, [4 K], "#18718c"),
    (80, 0.3, [295 K], "#566675"), (102, 1.3, [4 K], "#18718c"),
  ) {
    rect((x - 5, 0), (x + 5, y(v)), fill: rgb(color), stroke: none)
    content((x, y(v) + 1), str(v), anchor: "south")
    content((x, -2), label, anchor: "north")
  }
  content((29, -9), [Rayleigh])
  content((91, -9), [Sezawa])
  content((0, 46), [模态非线性系数（mW⁻¹ mm⁻¹）], anchor: "west")
})
#set text(font: "Microsoft YaHei", size: 9pt, lang: "zh")
#nonlinearity
