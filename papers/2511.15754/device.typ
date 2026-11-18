#import "@preview/cetz:0.4.2": canvas, draw

#let hall-device(width) = canvas(length: width / 100, {
  import draw: *
  rect((0, 0), (100, 76), stroke: none)
  let label(p, body, size: 4.1) = content(p, text(size: width * size / 100, body))
  let edge = .55pt + rgb("#5a5442")
  let gold = rgb("#f3de88")
  let lead = line.with(stroke: .65pt + rgb("#343841"))
  rect((9, 10), (91, 59), fill: gold, stroke: edge)
  rect((22, 19), (79, 49), fill: rgb("#e5e1b4"), stroke: edge)
  line((18, 34), (82, 34), stroke: 3pt + rgb("#a28883"))
  for x in (36, 64) {
    line((x, 23), (x, 46), stroke: 2.1pt + rgb("#a28883"))
    for y in (23, 46) { rect((x - 3, y - 2), (x + 3, y + 2), fill: rgb("#233047"), stroke: none) }
  }
  for x in (18, 82) { rect((x - 3, 32), (x + 3, 36), fill: rgb("#233047"), stroke: none) }
  lead((18, 36), (18, 63), (8, 63), mark: (end: "stealth", fill: black))
  lead((36, 48), (36, 63), (46, 63))
  lead((56, 63), (64, 63), (64, 48))
  circle((51, 63), radius: 5, fill: white, stroke: edge)
  lead((64, 48), (73, 48), (73, 40))
  lead((73, 30), (73, 22), (64, 22))
  circle((73, 35), radius: 5, fill: white, stroke: edge)
  lead((82, 36), (82, 65))
  for (y, r) in ((65, 4), (67, 2.8), (69, 1.4)) { lead((82-r,y),(82+r,y)) }
  lead((91, 25), (96, 25), (96, 15), (91, 15))
  label((51, 63), [$V_(x x)$], size: 3.2)
  label((73, 35), [$V_(x y)$], size: 3.2)
  label((50, 42), [NiO])
  label((51, 34), [Pt])
  label((55, 6), [PMN–PT])
  label((18, 70), [$I_("measure")$])
  label((83, 19), [Gate])
  label((6, 70), strong[b], size: 5.6)
  lead((13, 16), (13, 24), mark: (end: "stealth", fill: black))
  lead((13, 16), (20, 16), mark: (end: "stealth", fill: black))
  label((16, 27), [[010]], size: 3.0)
  label((26, 15), [[100]], size: 3.0)
  label((78, 12), [● [001]], size: 3.0)
})


