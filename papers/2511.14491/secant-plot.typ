#import "@preview/cetz:0.4.2": canvas, draw

// Figure 1(a). Draw each branch to the exact clipping point at |sec α| = 6.
#let secant-plot(unit) = canvas(length: unit, {
  let rotate-label = rotate
  import draw: *
  let xy(x, y) = (x, 298 - y)
  let plot(alpha, yield) = xy(56 + 445 * alpha / calc.pi, 235 - 222 * yield / 6)
  let label(x, y, body, size: 22) = content(
    xy(x, y), text(size: size * unit, body),
  )
  let ink = 2 * unit + black
  let grid = 1.5 * unit + rgb("#d2d2d2")
  let blue = 4 * unit + rgb("#0072bd")
  rect((0, 0), (515, 298), stroke: none, fill: white)

  let ticks = ($0$, $pi/6$, $pi/3$, $pi/2$, $2pi/3$, $5pi/6$, $pi$)
  for (i, tick) in ticks.enumerate() {
    let x = 56 + 445 * i / 6
    line(xy(x, 13), xy(x, 235), stroke: grid)
    line(xy(x, 13), xy(x, 18), stroke: ink)
    line(xy(x, 230), xy(x, 235), stroke: ink)
    label(x, 256, tick)
  }
  for y in (0, 2, 4, 6) {
    let h = 235 - 37 * y
    line(xy(56, h), xy(501, h), stroke: grid)
    line(xy(56, h), xy(61, h), stroke: ink)
    line(xy(496, h), xy(501, h), stroke: ink)
    label(41, h, str(y))
  }
  rect(xy(56, 235), xy(501, 13), stroke: ink)
  let edge = calc.acos(1 / 6) / 1rad
  let branch = range(121).map(i => edge * i / 120)
  for angles in (branch, branch.map(a => calc.pi - a)) {
    line(..angles.map(a => plot(a, calc.min(6, 1 / calc.abs(calc.cos(a * 1rad))))), stroke: blue)
  }
  label(77, 33, [(a)])
  label(278, 286, $alpha$, size: 27)
  content(xy(16, 124), rotate-label(-90deg, reflow: true, text(size: 24 * unit, $|sec(alpha)|$)))
})

#let geometry-figure = block(width: 100%, layout(size => {
  image("source/figs/fig1.png", width: 100%)
  place(top + left, secant-plot(size.width / 515))
}))
