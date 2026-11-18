#import "@preview/cetz:0.4.2": canvas, draw

// Coordinates follow the reference image with its origin at the upper left.
#let bubble-geometry(width: 100%) = layout(size => {
  let w = width * size.width
  let unit = w / 565
  let at(x, y) = (x, 650 - y)
  let red = rgb("#ff0905")
  let orange = rgb("#ff9600")
  let field-red = rgb("#9e0800")
  let diagram = canvas(length: unit, {
    import draw: *
    let poly(points, paint) = line(
      ..points.map(p => at(..p)), close: true, fill: paint, stroke: none,
    )
    let label(x, y, height, body, fill: black) = content(
      at(x, y), text(size: height * unit, fill: fill, body),
    )
    let stroke(paint, pixels) = (paint: paint, thickness: pixels * unit)

    rect(at(0, 650), at(565, 0), stroke: none)
    content(at(0, 650), image("bubble-micrograph-000.png", width: w, height: 516 * unit), anchor: "south-west")
    poly(((2, 75), (146, 75), (146, 57), (211, 93), (146, 130), (146, 112), (2, 112)), field-red)
    line(at(26, 394), at(511, 394), stroke: stroke(red, 8))
    line(at(222, 391), at(315, 177), stroke: (paint: red, thickness: 4.5 * unit, dash: "dashed"))
    arc(at(222, 394), anchor: "origin", start: 0deg, stop: 68deg, radius: 84, stroke: (paint: red, thickness: 6 * unit, dash: "dashed"))
    line(at(315, 177), at(342, 103), stroke: stroke(red, 5))
    arc(at(315, 177), anchor: "origin", start: 22deg, stop: 70deg, radius: 79, stroke: stroke(red, 5))
    line(at(315, 187), at(372, 188), at(364, 162), stroke: stroke(red, 5))
    poly(((281, 191), (357, 159), (353, 148), (400, 146), (366, 178), (362, 167), (284, 198)), orange)

    label(46, 26, 70, $H_x$)
    label(361, 69, 62, $theta - phi$)
    label(361, 228, 70, $phi$)
    label(334, 344, 86, $theta$)
    label(253, 200, 49, strong[m], fill: rgb("#ffab33"))
    label(229, 526, 47, $upright(m)_"in"$)
    label(58, 568, 44, $upright(m)_"out"$, fill: white)
    label(511, 516, 68, $H_z$, fill: white)

    let cross-circle(x, y, r, paint, weight) = {
      circle(at(x, y), radius: r, stroke: stroke(paint, weight))
      let offset = r * 0.707
      line(at(x - offset, y - offset), at(x + offset, y + offset), stroke: stroke(paint, weight))
      line(at(x - offset, y + offset), at(x + offset, y - offset), stroke: stroke(paint, weight))
    }
    cross-circle(252, 504, 14, black, 3.8)
    cross-circle(494, 591, 29, white, 7)
    circle(at(23, 603), radius: 14, stroke: stroke(white, 3.7))
    circle(at(23, 603), radius: 4.5, fill: white, stroke: none)
  })
  align(center, box(width: w, height: 650 * unit, clip: true, place(top + left, diagram)))
})
