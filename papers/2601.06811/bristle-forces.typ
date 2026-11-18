#import "@preview/cetz:0.4.2": canvas, draw

#let bristle-forces() = canvas(length: .126mm, {
  import draw: *
  let pt(x, y) = (x, 522 - y)
  let blue = rgb("#458fd8")
  let wire = .58pt + black
  let label(x, y, body, color: black) = content(
    pt(x, y),
    text(font: "Libertinus Serif", size: 9pt, fill: color, body),
  )
  let arrow(x, y, dx, dy) = {
    let length = calc.sqrt(dx * dx + dy * dy)
    let (ux, uy) = (dx / length, dy / length)
    let (xx, yy) = (x + dx, y + dy)
    let (bx, by) = (xx - 20 * ux, yy - 20 * uy)
    line(pt(x, y), pt(bx, by), stroke: .65pt + blue)
    line(pt(xx, yy), pt(bx - 5 * uy, by + 5 * ux), pt(bx + 5 * uy, by - 5 * ux),
      close: true, stroke: none, fill: blue)
  }

  rect(pt(65, 25), pt(366, 213), fill: luma(227), stroke: wire)
  line(pt(27, 401), pt(403, 401), stroke: wire)
  line(pt(162, 363), pt(215, 250), stroke: 1.5pt + red)
  label(516, 117, [*Upper body*])
  label(516, 307, [*Bristle element*])
  label(516, 435, [*Lower body*])
  for (x, y, dx, dy, lx, ly, symbol) in (
    (215, 213, 0, -75, 247, 136, $p(t)$),
    (215, 213, -103, 0, 110, 187, $f_x(t)$),
    (215, 250, 97, 0, 313, 273, $f_x(t)$),
    (215, 250, 0, 74, 247, 322, $p(t)$),
    (162, 363, 0, -74, 130, 286, $p(t)$),
    (162, 363, -97, 0, 64, 340, $f_(r x)(t)$),
    (162, 401, 97, 0, 259, 376, $f_(r x)(t)$),
    (162, 401, 0, 74, 194, 473, $p(t)$),
  ) {
    arrow(x, y, dx, dy)
    label(lx, ly, symbol, color: blue)
  }
})
