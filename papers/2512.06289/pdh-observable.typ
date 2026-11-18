#import "@preview/cetz:0.4.2": canvas, draw

#let rotate-label = rotate

#let observable-panel(scale) = canvas(length: scale, {
  import draw: *
  let axis-stroke = black + 0.85pt
  rect((0, 0), (5.42, 3.91), fill: white, stroke: none)
  content((0.34, 3.63), text(8pt)[(c)])
  line((1.52, 1.70), (5.20, 1.70), stroke: axis-stroke, mark: (end: ">"))
  line((3.37, 0.18), (3.37, 3.37), stroke: axis-stroke, mark: (end: ">"))

  // Qualitative error signal from the schematic, with its signed zero crossing.
  bezier((1.61, 1.35), (2.70, 0.65), (2.30, 1.23), (2.54, 1.02), stroke: 0.65pt)
  bezier((2.70, 0.65), (3.37, 1.70), (3.16, -0.39), (3.24, 0.29), stroke: 0.65pt)
  bezier((3.37, 1.70), (4.03, 2.76), (3.48, 3.78), (3.61, 3.18), stroke: 0.65pt)
  bezier((4.03, 2.76), (5.12, 2.05), (4.34, 2.31), (4.64, 2.18), stroke: 0.65pt)
  content((4.94, 1.30), text(7pt)[$f - f_0$])
  content((1.17, 1.94), rotate-label(-90deg, text(7.2pt)[PDH observable ($y_"PDH"$)]))
})



#let pdh-overview = layout(size => {
  let width = size.width
  let scale = width / 20.74
  box(width: width, height: width * 1200 / 3111)[
    #image("source/Final_Picture2_new.pdf", width: width)
    #place(top + left, dx: 4.69 * scale, dy: 4.08 * scale, observable-panel(scale))
  ]
})
