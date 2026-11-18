#import "@preview/cetz:0.4.2": canvas, draw
#import "heater-data.typ": rtd, mch

// The bounding rectangle matches panel 1(b) in the supplied composite.
#let heater-plot(unit) = canvas(length: unit, {
  let rotate-label = rotate
  import draw: *
  let w = 253
  let height = 143
  let xy(x, y) = (x, height - y)
  let point(power, temperature) = xy(48.70 + 15.925 * power, 104.35 - .1637 * (temperature - 300))
  let stroke = .5 * unit + black
  let blue = rgb("#1f77b4")
  let orange = rgb("#ff7f0e")
  let left = 41.145
  let right = 245.926
  let top = 4.418
  let bottom = 111.012
  let caption(x, y, body, ..args) = content(
    xy(x, y), text(font: "Libertinus Serif", size: 10 * unit, body), ..args,
  )

  rect((0, 0), (w, height), stroke: none, fill: white)
  rect(xy(left, bottom), xy(right, top), stroke: stroke)
  caption(4, 5, [*b)*])
  for power in range(13) {
    let (x, y) = point(power, 300)
    let major = calc.rem(power, 4) == 0
    line((x, height - bottom), (x, height - bottom - if major { 3.5 } else { 2 }), stroke: stroke)
    if major { caption(x, 122, str(power)) }
  }
  for temperature in range(300, 901, step: 50) {
    let (x, y) = point(0, temperature)
    let major = calc.rem(temperature - 300, 200) == 0
    line((left, y), (left - if major { 3.5 } else { 2 }, y), stroke: stroke)
    if major { caption(35, height - y, str(temperature), anchor: "east") }
  }
  caption(9, 57, rotate-label(-90deg, reflow: true)[$T$ [K]])
  caption(144, 134, [Heater power $P$ [W]])

  for (series, color, y, name) in (
    (rtd, blue, 13.77, [$T_"RTD"$]),
    (mch, orange, 29.32, [$T_"MCH"$]),
  ) {
    line(..series.map(samples => point(..samples)), stroke: unit + color)
    line(xy(46.66, y), xy(68.75, y), stroke: unit + color)
    caption(76, y, name, anchor: "west")
  }
})

#let calibration-figure = block(width: 100%, layout(size => {
  let unit = size.width / 253
  image("source/Figures/figure_1_tot.pdf", width: 100%)
  place(top + left, dy: 288 * unit, heater-plot(unit))
}))

