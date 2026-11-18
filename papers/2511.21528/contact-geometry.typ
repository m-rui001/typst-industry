#import "@preview/cetz:0.4.2": canvas, draw

#let contact-geometry(width) = canvas(length: width / 218, {
  import draw: *
  let note(at, body, size: 9) = content(at, text(size: size * width / 218, body))
  let shaft = .45pt + black
  let arrow(from, to, stroke: shaft) = line(from, to, stroke: stroke, mark: (end: "stealth"))
  let green = rgb("#95c900")
  let gold = rgb("#ffca09")

  // The coloured lobes are schematic, as in the source figure.
  rect((12, 0), (216, 83), fill: rgb("#08057d"), stroke: none)
  for x in (41, 90, 139, 188) {
    for (rx, ry, shade) in (
      (24, 64, "#2218e3"), (22, 54, "#2149ef"), (20, 44, "#1b8bfc"),
      (18, 36, "#2fd7ea"), (16, 29, "#67e98a"), (14, 22, "#e7e731"),
      (12, 17, "#f9871a"), (10, 12, "#ed3518"), (7, 8, "#b91300"),
    ) {
      bezier((x - rx, 83), (x + rx, 83), (x - rx, 83 - ry * 1.33), (x + rx, 83 - ry * 1.33), fill: rgb(shade), stroke: none)
    }
  }
  line((10, 60), (10, 85), (60, 85), stroke: shaft, mark: (start: "stealth", end: "stealth"))
  note((55, 91), [$x$])
  note((4, 57), [$y$])
  note((83, 11), text(fill: white)[Rayleigh wave $u_x, u_y$])
  arrow((130, 11), (164, 11), stroke: .65pt + white)

  rect((61, 97), (163, 177), stroke: .4pt + luma(140))
  circle((101, 85), radius: 2, fill: green, stroke: none)
  arrow((103, 87), (113, 96))
  note((117, 89), [$(x,y)$])
  circle((116, 146), radius: (29, 23), fill: green, stroke: none)
  line((64, 100), (159, 100), (159, 131), (137, 126), (98, 126), (84, 128), (64, 131), close: true, fill: gold, stroke: none)
  line((98, 126), (107, 126), stroke: .7pt + aqua)
  line((107, 126), (135, 126), stroke: .7pt + red)
  arrow((116, 160), (116, 131))
  arrow((122, 142), (122, 168))
  arrow((121, 135), (141, 135))
  arrow((117, 126), (157, 126))
  note((103, 141), [$M g$])
  note((129, 160), [$N$])
  note((136, 142), [$T$])
  for (x, tag, fill) in ((120, [0], black), (130, [$s$], white), (135, [$c$], black)) {
    circle((x, 126), radius: 1.1, fill: fill, stroke: .3pt + black)
    note((x, 118), tag)
  }
  note((153, 118), [$rho$])
  note((183, 105), [$x = b + u_x$])
  note((183, 95), [$y = a + u_y$])
})

