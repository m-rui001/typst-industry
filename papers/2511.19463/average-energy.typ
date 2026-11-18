#import "@preview/cetz:0.4.2": canvas, draw

// Values digitized from AppendixA.2.2_new.png, rounded to the nearest kWh.
#let rotate-label = rotate

#let average-energy(width) = canvas(length: width / 630, {
  import draw: *
  let x(radius) = 98 + (radius - 10) * 5.547
  let y(energy) = 80 + (energy - 150200) * .3458
  let blue = rgb("#1f77b4")
  let axis = width / 630 + black
  let grid = width * .8 / 630 + luma(173)
  let label(p, body) = content(p, text(font: "Arial", size: width * 11 / 630, body))
  rect((0, 0), (630, 470), stroke: none)

  for radius in (20, 40, 60, 80, 100) {
    line((x(radius), 42), (x(radius), 462), stroke: grid)
    line((x(radius), 38), (x(radius), 42), stroke: axis)
    label((x(radius), 29), str(radius))
  }
  for energy in range(150200, 151201, step: 200) {
    line((73, y(energy)), (622, y(energy)), stroke: grid)
    line((69, y(energy)), (73, y(energy)), stroke: axis)
    label((44, y(energy)), str(energy))
  }
  rect((73, 42), (622, 462), stroke: axis)
  let values = (150145, 150294, 150519, 150743, 150937, 151084, 151074, 151114, 151251, 151238)
  line(..values.enumerate().map(((i, energy)) => (x(10 + i * 10), y(energy))), stroke: width * 1.65 / 630 + blue)
  label((347, 14), [Shading radius (m)])
  content((13, 250), rotate-label(-90deg, text(font: "Arial", size: width * 11 / 630)[Average Total Energy (kWh)]))
  rect((78, 437), (187, 456), fill: white, stroke: width * .75 / 630 + luma(192))
  line((83, 447), (106, 447), stroke: width * 1.65 / 630 + blue)
  label((148, 447), [Total Energy])
})
