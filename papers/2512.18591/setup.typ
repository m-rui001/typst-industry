#import "@preview/cetz:0.4.2": canvas, draw

#let setup(width) = canvas(length: width / 369, {
  import draw: *
  let ink = .62pt + black
  let wire = line.with(stroke: ink)
  let label(p, body) = content(p, text(size: width * .033, body))
  rect((0, 0), (369, 156), stroke: none)
  rect((39, 45), (332, 69), fill: rgb("#ffe082"), stroke: .6pt + rgb("#32616e"))
  rect((47, 69), (98, 82), fill: rgb("#e7e5d9"), stroke: ink)
  rect((272, 69), (323, 82), fill: rgb("#e7e5d9"), stroke: ink)
  wire((60, 84), (310, 84), stroke: 2pt + black)
  for x in (60, 90, 280, 310) {
    bezier((x - 8, 82), (x + 8, 82), (x - 5, 98), (x + 5, 98), fill: rgb("#a8aaa7"), stroke: ink)
    wire((x - 8, 82), (x + 8, 82))
  }
  wire((24, 110), (60, 110), (60, 94))
  wire((90, 94), (90, 131), (280, 131), (280, 94))
  wire((310, 94), (310, 110), (351, 110), (351, 82))
  for (x, y, glyph) in ((24, 110, [∿]), (188, 131, [V])) {
    circle((x, y), radius: 12, fill: white, stroke: ink)
    label((x, y), glyph)
  }
  for x in (24, 351) {
    wire((x, 98), (x, 82))
    for (y, span) in ((82, 11), (76, 8), (70, 4)) {
      wire((x - span, y), (x + span, y))
    }
  }
  wire((48, 24), (329, 24), mark: (end: ">"))
  for (x, name) in ((98, [0]), (272, [$L$])) {
    circle((x, 24), radius: 3.4, fill: black, stroke: none)
    label((x, 8), name)
  }
  label((185, 95), [Pt wire])
  label((185, 57), [Copper])
  for x in (72, 297) { label((x, 75), [AlN]) }
  label((17, 142), strong[a])
})
