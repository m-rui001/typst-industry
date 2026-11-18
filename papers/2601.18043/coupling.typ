#import "@preview/cetz:0.5.3": canvas, draw
#let coupling = canvas(length: 1mm, {
  import draw: *
  for level in (0, 2, 4, 6) {
    let y = 5 * level
    line((0, y), (103, y), stroke: rgb("#d6e0e6"))
    content((-3, y), str(level), anchor: "east")
  }
  for (x, label, value, color) in (
    (14, [20 μm], 0.5, "#34738a"),
    (38, [16 μm], 3.2, "#34738a"),
    (62, [12 μm], 6.2, "#34738a"),
    (88, [平面 SAW], 3.4, "#697580"),
  ) {
    rect((x - 6, 0), (x + 6, 5 * value), fill: rgb(color), stroke: none)
    content((x, 5 * value + 2), str(value), anchor: "south")
    content((x, -3), label, anchor: "north")
  }
  content((0, 39), [有效机电耦合系数（%）], anchor: "west")
})
#set text(font: "Microsoft YaHei", size: 10pt, lang: "zh")
#coupling
