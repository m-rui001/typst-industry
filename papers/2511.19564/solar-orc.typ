#import "@preview/cetz:0.4.2": canvas, draw

#let solar-orc(width) = canvas(length: width / 225, {
  import draw: *
  let pipe = .55pt + black
  let coolant = .55pt + rgb("#cf4538")
  let node(p, label) = content(p, text(size: width * 8 / 225, label))
  let flow(a, b, stroke: pipe) = line(a, b, stroke: stroke, mark: (end: "stealth"))

  // Collector and heat-transfer loop.
  line((12, 26), (21, 20), (60, 75), (52, 81), close: true, stroke: pipe)
  for i in range(6) {
    let x = 10 + 5.4 * i
    let y = 36 + 7.6 * i
    flow((x - 8, y + 6), (x + 4, y - 3))
  }
  line((16, 23), (16, 7), (74, 7), (74, 30), stroke: pipe)
  line((58, 72), (76, 98), (76, 58), stroke: pipe)
  rect((58, 30), (91, 58), stroke: pipe)
  rect((62, 39), (88, 51), stroke: pipe)
  node((36, 61), [a])
  node((51, 28), [b])

  // Working-fluid loop, including mechanical coupling to the generator.
  line((88, 49), (98, 49), (98, 80), (124, 80), stroke: pipe)
  line((124, 74), (124, 86), (141, 91), (141, 70), close: true, stroke: pipe)
  line((141, 81), (157, 81), stroke: pipe)
  circle((166, 82), radius: 9, stroke: pipe)
  bezier((160, 81), (172, 82), (164, 88), (167, 76), stroke: pipe)
  line((140, 70), (140, 53), (148, 53), stroke: pipe)
  rect((148, 39), (178, 59), stroke: pipe)
  line((148, 43), (148, 21), (137, 21), (137, 6), (126, 6), stroke: pipe)
  circle((120, 11), radius: 5, stroke: pipe)
  line((115, 6), (125, 6), (120, 9), close: true, stroke: pipe)
  line((115, 16), (98, 16), (98, 43), (88, 43), stroke: pipe)
  flow((98, 22), (98, 31))
  flow((98, 58), (98, 69))
  flow((141, 70), (141, 61))
  flow((137, 18), (137, 10))
  for y in (43, 48) {
    line((64, y), (68, y), (71, y + 3), (74, y - 1), (77, y + 2), (80, y - 1), (83, y + 2), (87, y), stroke: pipe)
  }
  for y in (45, 50) {
    line((149, y), (156, y), (160, y - 3), (164, y + 1), (167, y - 3), (170, y + 1), (174, y - 3), (177, y), stroke: pipe)
  }
  for (p, label) in (((108, 5), [c]), ((131, 79), [d]), ((143, 45), [e]), ((179, 90), [f])) {
    node(p, label)
  }
  for (p, label) in (((141, 14), [1]), ((93, 24), [2]), ((102, 68), [3]), ((136, 63), [4])) {
    node(p, text(fill: blue, label))
  }

  // Cooling-water circuit.
  rect((185, 46), (202, 67), stroke: pipe)
  rect((161, 5), (189, 20), stroke: pipe)
  line((172, 39), (172, 20), stroke: coolant)
  flow((172, 34), (172, 26), stroke: coolant)
  line((172, 59), (172, 67), (185, 67), stroke: coolant)
  flow((180, 67), (175, 67), stroke: coolant)
  line((193, 46), (193, 24), (211, 24), stroke: coolant)
  flow((193, 31), (193, 41), stroke: coolant)
  line((207, 26), (217, 26), (217, 32), (224, 35), stroke: pipe)
  line((207, 22), (217, 22), (217, 15), (224, 12), stroke: pipe)
  node((208, 15), [g])
  node((194, 55), [h])
  node((173, 12), [i])
})
