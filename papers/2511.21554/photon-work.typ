#import "@preview/cetz:0.4.2": canvas, draw
#let rotate-label = rotate

#let photon-work() = canvas(length: .135mm, {
  import draw: *
  let pt(x, y) = (x, 525 - y)
  let wire = .63pt + black
  let dotted = (paint: black, thickness: .5pt, dash: "dotted")
  let label(x, y, body) = content(pt(x, y), text(font: "Libertinus Serif", size: 8pt, body))
  let arrow(x, y, xx, yy, stroke: wire) = line(pt(x, y), pt(xx, yy), stroke: stroke, mark: (end: ">"))
  let curve = range(81).map(i => {
    let x = 111 + 423 * i / 80
    let y = 308 + 146 * (1 - calc.exp(-2.1 * i / 80)) / (1 - calc.exp(-2.1))
    pt(x, y)
  })
  line(pt(111, 475), ..curve, pt(534, 475), close: true, stroke: none, fill: luma(194))
  line(..curve, stroke: 1.15pt + black)
  arrow(12, 475, 586, 475)
  arrow(42, 492, 42, 74)
  line(pt(42, 459), pt(534, 459), stroke: dotted)
  line(pt(111, 308), pt(111, 475), stroke: dotted)
  line(pt(534, 454), pt(534, 475), stroke: dotted)
  line(pt(111, 96), pt(111, 308), stroke: wire)
  for (x, y) in ((111, 96), (111, 308), (534, 454)) {
    circle(pt(x, y), radius: 6.5, stroke: none, fill: black)
  }
  bezier(pt(172, 31), pt(109, 84), pt(130, 31), pt(108, 61), stroke: wire, mark: (end: ">"))
  arrow(137, 286, 198, 203, stroke: 1.1pt + black)
  arrow(147, 306, 274, 375, stroke: 1.1pt + rgb("#1a3052"))
  arrow(531, 375, 533, 442)
  label(21, 96, $p$)
  label(24, 459, $p_o$)
  label(87, 94, [A])
  label(87, 298, [B])
  label(559, 445, [C])
  label(91, 199, rotate-label(-90deg, emph[Thermalization]))
  label(305, 25, [Equilibrium solar photon])
  label(290, 196, [Photon removed \ (chemical work)])
  label(269, 314, [Mechanical \ work])
  label(190, 417, [Useful work])
  label(482, 362, [Equilibrium photon at \ temperature $T_o$])
  label(107, 495, $v_S$)
  label(329, 498, $v$)
  label(533, 495, $v_o$)
})


