#import "@preview/cetz:0.4.2": canvas, draw

#let rotate-text = rotate

#let acoustic-network = canvas(length: 14mm, {
  import draw: *
  let ink = rgb("#171a20")
  let blue = rgb("#1877b8")
  let attenuation = (
    rgb("#e3ecf2"), rgb("#b7c5d3"), rgb("#899aab"),
    rgb("#5c6b7c"), rgb("#374353"),
  )
  let input = (0.35, 2.30)
  let hidden = ((2.55, 3.55), (2.55, 2.75), (2.55, 1.95), (2.55, 1.15))
  let output = (4.75, 2.30)

  let wave(x, y) = {
    let points = range(33).map(i => (
      x - 0.28 + i * 0.56 / 32,
      y + 0.090 * calc.sin(i * 24deg),
    ))
    line(..points, stroke: 0.8pt + blue, mark: (end: ">"))
  }

  let neuron(pt) = {
    circle(pt, radius: 0.37, stroke: 0.6pt + ink, fill: white)
    wave(..pt)
  }

  for (i, node) in hidden.enumerate() {
    line(input, node, stroke: 4pt + attenuation.at((3, 1, 4, 0).at(i)))
    line(node, output, stroke: 4pt + attenuation.at((0, 4, 3, 1).at(i)))
  }
  for node in (input, ..hidden, output) {
    neuron(node)
  }
  content((1.30, 3.04), rotate-text(-42deg, text(6.3pt)[propagation path]))
  content((0.35, 1.83), text(6.5pt)[neuron])
  content((0.35, 1.25), text(7pt)[input])
  content((4.75, 1.25), text(7pt)[output])

  rect((0.01, 4.02), (2.55, 5.86), radius: 0.055, stroke: 0.55pt + ink)
  wave(0.46, 5.54)
  content((1.74, 5.56), text(6.5pt)[acoustic wave])
  for (i, shade) in attenuation.enumerate() {
    let y = 5.24 - i * 0.18
    rect((0.09, y - 0.18), (0.77, y), fill: shade, stroke: none)
  }
  content((0.43, 5.15), text(5.4pt, fill: attenuation.last())[high])
  content((0.43, 4.43), text(5.4pt, fill: white)[low])
  content((1.67, 4.78), align(center, text(6.3pt)[acoustic \ attenuation]))

  circle((4.75, 4.90), radius: 0.99, stroke: (paint: ink, thickness: 0.6pt, dash: "dashed"))
  line((2.92, 3.76), (3.89, 4.37), stroke: (paint: ink, thickness: 0.6pt, dash: "dashed"), mark: (end: ">"))
  content((4.75, 5.38), text(6.4pt)[nonlinearity])
  line((4.37, 4.43), (5.31, 4.43), stroke: 0.55pt + ink, mark: (end: ">"))
  line((4.37, 4.43), (4.37, 5.09), stroke: 0.55pt + ink, mark: (end: ">"))
  line((4.38, 4.52), (4.67, 4.52), (5.11, 4.99), stroke: 1pt + rgb("#e69c00"))
  content((4.12, 5.08), text(6.2pt)[$f(I)$])
  content((5.24, 4.29), text(6.2pt)[$I$])

  line((1.11, 0.12), (4.39, 0.12), stroke: 0.65pt + ink, mark: (end: ">"))
  content((2.75, -0.08), text(7pt)[acoustic wave propagation])
})
