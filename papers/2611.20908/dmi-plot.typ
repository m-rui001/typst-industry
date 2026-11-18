#import "@preview/cetz:0.4.2": canvas, draw

// Series and error-bar endpoints traced from the vector paths of original Figure 1.
// Coordinates are PDF positions, in points, with the origin at the upper left.
#let samples = (
  (92.812, [Pt/Co/Pt(3)]),
  (148.642, [Pt/Co/Pt(1)]),
  (204.472, [Pt/Co/Ir(3)]),
  (260.302, [Pt/Co/Ir(1)]),
  (316.132, [Pt/Co/Ta]),
  (371.962, [HZO/Co/Pt]),
)
#let bls = (
  (116.019, 115.435, 116.603), (105.976, 105.275, 106.677),
  (171.372, 170.671, 172.073), (191.224, 190.290, 192.158),
  (220.419, 219.835, 221.003), (38.245, 25.399, 51.090),
)
#let creep = (
  (120.784, 120.214, 121.353), (123.271, 122.810, 123.732),
  (153.505, 149.301, 157.709), (160.278, 154.439, 166.117),
  (178.145, 170.671, 185.619), (68.607, 67.439, 69.775),
)

#let dmi-plot(width: 90%) = layout(size => {
  let w = width * size.width
  let unit = w / 387.36
  let at(x, y) = (x, 315.36 - y)
  let blue = rgb("#1f77b4")
  let red = rgb("#d62728")
  let grid-ink = rgb("#b0b0b0")
  let diagram = canvas(length: unit, {
    import draw: *
    let pen(paint, weight) = (paint: paint, thickness: weight * unit)
    let red-line = (
      paint: red, thickness: 1.8 * unit,
      dash: (array: (6.66 * unit, 2.88 * unit)),
    )
    let label(x, y, font-size, body, anchor: "center", angle: 0deg) = content(
      at(x, y), std.rotate(angle, text(size: font-size * unit, body)), anchor: anchor,
    )
    let marker(x, y, color, triangle: false) = {
      if triangle {
        line(
          at(x, y - 3.8), at(x + 3.8, y + 3.8), at(x - 3.8, y + 3.8),
          close: true, stroke: pen(color, 1), fill: white,
        )
      } else {
        rect(at(x - 3.5, y - 3.5), at(x + 3.5, y + 3.5), stroke: pen(color, 1), fill: white)
      }
    }
    let error-bar(x, low, high, color) = {
      line(at(x, low), at(x, high), stroke: pen(color, 1.8))
      for y in (low, high) {
        line(at(x - 4, y), at(x + 4, y), stroke: pen(color, 1))
      }
    }

    rect(at(0, 315.36), at(387.36, 0), stroke: none)
    for (x, name) in samples {
      line(at(x, 9.05), at(x, 242.61), stroke: pen(grid-ink, 0.8))
      line(at(x, 242.61), at(x, 246.11), stroke: pen(black, 0.8))
      label(x - 29, 280, 13.95, name, angle: -45deg)
    }
    for (y, tick) in ((9.05, [1.0]), (67.44, [0.5]), (125.83, [0.0]), (184.22, [−0.5]), (242.61, [−1.0])) {
      line(at(78.85, y), at(385.92, y), stroke: pen(grid-ink, 0.8))
      line(at(75.35, y), at(78.85, y), stroke: pen(black, 0.8))
      label(72, y, 21.92, tick, anchor: "east")
    }
    label(13, 128, 21.92, [$D$ (mJ/m#super[2])], angle: -90deg)
    line(at(78.85, 125.83), at(385.92, 125.83), stroke: pen(black, 1))
    rect(at(78.85, 9.05), at(385.92, 242.61), stroke: pen(black, 0.8))

    for (series, ink, is-creep) in ((bls, blue, false), (creep, red, true)) {
      let points = samples.zip(series)
      for ((x, _), (_, low, high)) in points {
        error-bar(x, low, high, ink)
      }
      line(..points.map(p => at(p.first().first(), p.last().first())), stroke: if is-creep { red-line } else { pen(ink, 1.8) })
      for ((x, _), (y, _, _)) in points {
        marker(x, y, ink, triangle: is-creep)
      }
    }

    rect(at(85.85, 16.05), at(234.5, 57.25), radius: 2.8, fill: white, stroke: pen(rgb("#cccccc"), 0.8))
    for (y, title, ink, is-creep) in ((26.55, [BLS], blue, false), (46.06, [Standard Creep], red, true)) {
      error-bar(105.45, y - 7, y + 7, ink)
      line(at(91.45, y), at(119.45, y), stroke: if is-creep { red-line } else { pen(ink, 1.8) })
      marker(105.45, y, ink, triangle: is-creep)
      label(130.65, y, 13.95, title, anchor: "west")
    }
  })
  align(center, box(width: w, height: 315.36 * unit, place(top + left, diagram)))
})
