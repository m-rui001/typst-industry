#import "@preview/cetz:0.4.2": canvas, draw

#let text-rotate = rotate

#let led-circuit(width) = canvas(length: width / 500, {
  import draw: *
  let ink = rgb("#383838")
  let wire = width * 2.5 / 500 + ink
  let label(p, body, size: 28) = content(p, text(font: "Arial", size: width * size / 500, fill: ink, body))
  let resistor(x, y) = line(
    (x, y), (x - 11, y - 7), (x + 7, y - 15), (x - 10, y - 23),
    (x + 7, y - 31), (x - 10, y - 39), (x + 6, y - 46),
    (x, y - 50), stroke: wire,
  )
  rect((0, 0), (500, 500), stroke: none)
  line((69, 133), (69, 462), (473, 462), (473, 164), (213, 164), (213, 133), stroke: wire)
  line((69, 406), (185, 406), stroke: wire)
  circle((213, 406), radius: 28, stroke: wire)
  line((241, 406), (348, 406), (348, 355), stroke: wire)
  resistor(348, 355)
  line((348, 305), (348, 258), (306, 258), stroke: wire)
  line((69, 258), (277, 258), stroke: wire)
  line((277, 229), (305, 258), (277, 287), close: true, stroke: wire)
  line((305, 226), (305, 289), stroke: wire)
  line((308, 224), (327, 205), stroke: wire, mark: (end: "stealth"))
  line((166, 258), (166, 241), stroke: wire)
  resistor(166, 241)
  line((166, 191), (166, 133), stroke: wire)
  rect((17, 228), (69, 311), stroke: wire)
  rect((55, 42), (225, 133), stroke: wire)
  for p in ((69, 406), (69, 258), (166, 258)) {
    circle(p, radius: 4, stroke: none, fill: ink)
  }
  label((213, 406), [5V])
  label((167, 429), [+])
  label((258, 429), [−])
  label((402, 330), [205 Ω])
  label((212, 219), [1 MΩ])
  label((112, 182), [100 Ω])
  label((95, 111), [pwm], size: 25)
  label((190, 111), [Gnd], size: 25)
  label((140, 64), [Arduino], size: 25)
  content((43, 268), text-rotate(-90deg, text(font: "Arial", size: width * 27 / 500, fill: ink)[GDS]))
})
