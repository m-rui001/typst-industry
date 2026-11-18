#import "@preview/cetz:0.4.2": canvas, draw

// Signal chain at the top of Figure 1(a), using the parent PDF's dimensions.
#let excitation-chain(unit) = canvas(length: unit, {
  import draw: *
  let xy(x, y) = (x, 58 - y)
  let ink = .65 * unit + black
  let label(x, y, body, size: 9.7) = content(
    xy(x, y), text(font: "Arial", size: size * unit, body),
  )
  let trace(points, ..style) = line(..points.map(p => xy(..p)), stroke: ink, ..style)
  let box(x0, y0, x1, y1, fill: white) = rect(
    xy(x0, y1), xy(x1, y0), fill: fill, stroke: ink,
  )

  rect((0, 0), (286, 58), fill: white, stroke: none)
  label(13, 10, [a], size: 12)
  box(26, 13, 111, 35)
  box(41, 16, 63, 32)
  for y in (19, 23, 27, 31) {
    box(34, y - 1, 37, y + 1)
    for x in (68, 73, 78) { box(x, y - 1, x + 2.6, y + 1) }
  }
  circle(xy(92, 21), radius: 3.1, fill: white, stroke: ink)
  for y in (18, 24, 30) {
    circle(xy(105, y), radius: 1.3, fill: white, stroke: ink)
  }
  trace(((111, 29), (160, 29), (160, 23)))
  box(156, 7, 176, 23)
  box(158, 23, 161, 26)
  box(171, 23, 174, 26)
  trace(((173, 26), (173, 30), (206, 30), (206, 38)))

  line(
    xy(209, 43), xy(231, 29), xy(282, 29), xy(260, 43),
    stroke: ink, fill: rgb("#98cfa5"), close: true,
  )
  line(
    xy(221, 40), xy(234, 32), xy(248, 32), xy(236, 40),
    stroke: ink, fill: rgb("#d8b56c"), close: true,
  )
  line(
    xy(244, 40), xy(257, 32), xy(265, 33), xy(253, 40),
    stroke: ink, fill: rgb("#d8b56c"), close: true,
  )
  trace(((206, 38), (228, 38), (228, 30), (252, 30), (252, 39)))
  trace(((269, 18), (257, 31)), mark: (end: ">"))
  label(72, 49, [Microwave signal generator])
  label(166, 49, [Amplifier])
  label(239, 49, [Sample])
  label(238, 13, [Microstrip antenna])
})

#let setup-figure = block(width: 100%, layout(size => {
  image("source/Fig1.pdf", width: 100%)
  place(top + left, excitation-chain(size.width / 511))
}))
