#import "@preview/cetz:0.4.2": canvas, draw

#let saved = json("positions-data.json")
#let rotate-label = rotate
#let lens-positions() = canvas(length: 15.2pt, {
  import draw: *
  let point(pair) = (pair.at(0), pair.at(1))
  let front = saved.front.map(path => path.map(point))
  let back = saved.back.map(path => path.map(point))
  let glass = rgb("#e3f0fa")
  let slab = rgb("#e5e7e9")
  let blue = rgb("#2980b9")
  let green = rgb("#27ae60")
  let grid = .12pt + rgb("#d9d9d9")
  let label(body, size: 5.6pt) = text(font: "Arial", size: size, body)

  rect((0, 0), (19.39, 7.69), stroke: none, fill: white)
  rect((11.177, 2.509), (18.994, 3.372), stroke: none, fill: slab)
  for (upper, lower) in front.zip(back) {
    line(..upper, ..lower.rev(), close: true, stroke: none, fill: glass)
  }
  for offset in (0, 9.693) {
    for (index, value) in ("−15", "−10", "−5", "0", "5", "10", "15").enumerate() {
      let x = offset + 1.317 + index * 1.3585
      line((x, 1.405), (x, 7.69), stroke: grid)
      line((x, 1.37), (x, 1.405), stroke: .15pt)
      content((x, 1.16), label(value))
    }
    for (index, value) in ("0", "5", "10", "15").enumerate() {
      let y = 2.509 + index * 1.359
      line((offset + 1.093, y), (offset + 9.69, y), stroke: grid)
      line((offset + 1.058, y), (offset + 1.093, y), stroke: .15pt)
      content((offset + 1.02, y), label(value), anchor: "east")
    }
    content((offset + 5.393, .66), label("x", size: 7pt))
    content((offset + .24, 4.545), rotate-label(-90deg, label("z", size: 7pt)))
  }
  for path in front { line(..path, stroke: .76pt + blue) }
  for path in back { line(..path, stroke: .76pt + green) }
  for (name, color) in (red: rgb("#e74c3c"), amber: rgb("#f39c12")) {
    for path in saved.at(name) { line(..path.map(point), stroke: .24pt + color) }
  }
  for (x, name, color, filled) in (
    (1.12, "Lens medium", glass, true),
    (5.22, "Front surface", blue, false),
    (9.32, "Back surface", green, false),
    (13.38, "Thick transparent slab", slab, true),
  ) {
    if filled {
      rect((x, .03), (x + .73, .29), fill: color, stroke: none)
    } else {
      line((x, .16), (x + .73, .16), stroke: 1.45pt + color)
    }
    content((x + .99, .16), label(name), anchor: "west")
  }
})
