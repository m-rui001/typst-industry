#import "@preview/cetz:0.4.2": canvas, draw

#let rheology() = canvas(length: .136mm, {
  import draw: *
  let pt(x, y) = (x, 449 - y)
  let wire = .42pt + black
  let segment(x, y, xx, yy, stroke: wire) = line(pt(x, y), pt(xx, yy), stroke: stroke)
  let box-at(x, y, xx, yy, fill: none) = rect(pt(x, y), pt(xx, yy), stroke: wire, fill: fill)
  let h-spring(x, y, turns) = {
    let bends = range(2 * turns).map(i => pt(x + 10.7 + i * 21.4, y + if calc.even(i) { -10.7 } else { 10.7 }))
    line(pt(x, y), ..bends, pt(x + turns * 42.8, y), stroke: wire)
  }
  let v-spring(x, y, turns, step) = {
    let bends = range(2 * turns).map(i => pt(x + if calc.even(i) { 9 } else { -9 }, y + step / 2 + i * step))
    line(pt(x, y), ..bends, pt(x, y + 2 * turns * step), stroke: wire)
  }
  let k(i) = $macron(bold(K))_#i$
  let c(i) = $macron(bold(C))_#i$
  let label(x, y, body) = content(pt(x, y), text(font: "Libertinus Serif", size: 7.3pt, body))
  let gray = luma(198)
  let dashed = (paint: black, thickness: .4pt, dash: "dashed")

  label(203, 21, [(a) *Generalised Maxwell*])
  label(678, 21, [(b) *Generalised Kelvin-Voigt*])
  for x in (9, 374) {
    box-at(x, 65, x + 10, 287, fill: gray)
    box-at(x, 368, x + 10, 439, fill: gray)
    segment(x, 287, x, 368, stroke: dashed)
    segment(x + 10, 287, x + 10, 368, stroke: dashed)
  }
  h-spring(19, 100, 8)
  segment(361.4, 100, 374, 100)
  label(95, 69, k(0))
  for (y, i) in ((175, 1), (251, 2), (403, $n$)) {
    h-spring(19, y, 3)
    segment(147.4, y, 237, y)
    box-at(237, y - 15, 313, y + 15)
    segment(275, y - 15, 275, y + 15)
    segment(275, y, 374, y)
    label(95, y - 31, k(i))
    label(275, y - 31, c(i))
  }

  box-at(576, 65, 779, 75, fill: gray)
  box-at(576, 429, 779, 439, fill: gray)
  segment(677.5, 75, 677.5, 105)
  v-spring(677.5, 105, 4, 7.75)
  segment(677.5, 167, 677.5, 201)
  label(716, 137, k(0))
  for (y, i) in ((201, 1), (327, $n$)) {
    segment(627, y, 728, y)
    segment(627, y + 76, 728, y + 76)
    segment(627, y, 627, y + 4)
    v-spring(627, y + 4, 4, 8.5)
    segment(627, y + 72, 627, y + 76)
    segment(728, y, 728, y + 19)
    box-at(715, y + 19, 741, y + 57)
    segment(715, y + 38, 741, y + 38)
    segment(728, y + 38, 728, y + 76)
    label(587, y + 38, k(i))
    label(766, y + 38, c(i))
  }
  segment(677.5, 277, 677.5, 327, stroke: dashed)
  segment(677.5, 403, 677.5, 429)
})

