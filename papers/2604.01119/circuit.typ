#import "@preview/cetz:0.4.2": canvas, draw

#let teng-circuit() = canvas(length: 1cm, {
  import draw: *
  let ink = rgb("#052d49")
  let blue = rgb("#0060ff")
  let wire = 0.52pt + ink
  rect((0.34, 0.55), (3.1, 4.6), stroke: (paint: rgb("#0070be"), thickness: 0.9pt, dash: "dashed"))
  rect((3.72, 0.55), (6.22, 4.6), stroke: (paint: rgb("#a295c3"), thickness: 0.9pt, dash: "dashed"))
  line((1.65, 3.5), (1.65, 4.29), (5.1, 4.29), stroke: wire)
  line((1.65, 1.66), (1.65, 0.85), (5.1, 0.85), stroke: wire)
  for y in (3.5, 3.25) {
    line((1.33, y), (1.98, y), stroke: wire)
  }
  line((1.65, 3.25), (1.65, 2.76), stroke: wire)
  line((1.33, 3.07), (1.97, 3.73), stroke: wire, mark: (end: ">"))
  circle((1.65, 2.21), radius: 0.57, stroke: wire, fill: white)
  content((1.65, 2.42), $+$)
  content((1.65, 1.96), $-$)
  line((3.25, 4.29), (3.49, 4.29), stroke: wire, mark: (end: ">"))
  line((4.08, 4.29), (4.08, 3.03), stroke: wire)
  rect((3.84, 2.03), (4.32, 3.03), stroke: wire, fill: white)
  line((4.08, 2.03), (4.08, 0.85), stroke: wire)
  line((4.72, 0.85), (4.72, 4.29), stroke: wire, mark: (start: "<", end: ">"))
  for y in (0.85, 4.29) {
    line((5.2, y), (5.47, y), stroke: (paint: ink, thickness: 0.8pt, dash: "dotted"))
    line((5.59, y), (6.45, y), stroke: wire)
  }
  for (position, label) in (
    ((1.04, 3.91), $Q^-$), ((1.04, 3.04), $Q^+$),
    ((2.32, 3.12), $V_C$), ((3.41, 4.54), $I_e$), ((4.08, 2.5), $R_L$),
  ) {
    content(position, text(fill: ink, size: 9pt, label))
  }
  for (position, label) in (
    ((2.59, 3.85), $C_T (t)$), ((0.94, 1.79), $V_(O C)(t)$), ((5.26, 2.68), $V(t)$),
  ) {
    content(position, text(fill: blue, size: 9pt, label))
  }
  content((1.68, 0.23), text(size: 8pt)[TENG])
  content((5.05, 0.23), text(size: 8pt)[Arbitrary load circuit])
})
