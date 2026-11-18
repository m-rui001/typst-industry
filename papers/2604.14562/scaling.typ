#import "@preview/cetz:0.4.2": canvas, draw

#let scaling-diagram() = canvas(length: 46.7pt, {
  import draw: *
  let raw = rgb("#efd0d0")
  let raw-edge = rgb("#dc9797")
  let scaled = rgb("#bf6666")
  let scaled-edge = rgb("#7d2828")
  let range-stroke = (paint: black, thickness: .6pt, dash: "dotted")
  let label(x, y, body, size: 8pt, anchor: "center") = {
    content((x, y), text(font: "Arial", size, body), anchor: anchor)
  }
  let bar(x, height, fill, stroke, width: .32) = {
    rect((x, .43), (x + width, .43 + height), fill: fill, stroke: stroke)
  }
  let arrow(x, y) = line((x, y), (x + .40, y), stroke: 1.3pt, mark: (end: ">"))
  let bench(start, end, input, output: none, height: 0, limit: 0, name: none) = {
    line((start, .43), (end, .43), stroke: 2pt + rgb("#262626"))
    bar(input, .27, raw, .65pt + raw-edge)
    arrow(input + .39, .58)
    if output != none {
      bar(output, height, scaled, .65pt + scaled-edge)
      bar(output, limit, none, range-stroke)
      label(output + .16, .43 + calc.max(height, limit) + .13, name, size: 9pt)
    }
  }
  for (x, label-text, fill, stroke) in (
    (.04, [NN’s output], raw, .65pt + raw-edge),
    (1.92, [Physics admissible temperature range], none, range-stroke),
    (5.81, [Scaled NN’s output], scaled, .75pt + scaled-edge),
  ) {
    rect((x, 2.22), (x + .53, 2.46), fill: fill, stroke: stroke)
    label(x + .6, 2.34, [: #label-text], anchor: "west")
  }
  arrow(8.27, 2.34)
  label(8.76, 2.34, [: Output scaling], anchor: "west")
  label(.29, 1.88, [(a)], size: 9pt, anchor: "west")
  label(3.79, 1.88, [(b)], size: 9pt, anchor: "west")

  bench(.55, 3.37, .69)
  for (x, limit, name, height) in (
    (1.60, 1.38, [$lambda^((1))$], .81),
    (2.04, 1.08, [$lambda^((2))$], .81),
    (2.85, .40, [$lambda^((i))$], .81),
  ) {
    bar(x, height, scaled, .65pt + scaled-edge)
    bar(x, limit, none, range-stroke)
    label(x + .16, .43 + limit + .17, name, size: 9pt)
  }
  label(2.59, .65, [$dots.h$], size: 11pt)
  bench(4.06, 5.55, 4.14, output: 5.04, height: 1.43, limit: 1.38, name: [$lambda^((1))$])
  bench(5.82, 7.28, 5.90, output: 6.78, height: 1.15, limit: 1.08, name: [$lambda^((2))$])
  label(7.81, .92, [$dots.h$], size: 12pt)
  bench(8.30, 9.82, 8.39, output: 9.25, height: .45, limit: .40, name: [$lambda^((i))$])
  label(1.99, .17, [$hat(T)_"phys"(lambda; Theta) eq.delta T_"max" + "softplus"(hat(T)_Theta)$], size: 9pt)
  label(6.98, .17, [$hat(T)_"phys"(lambda; Theta) = kappa dot T_"max"(lambda) + "softplus"(hat(T)_Theta)$], size: 9pt)
})
