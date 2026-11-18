#import "@preview/cetz:0.4.2": canvas, draw

#let simplex() = canvas(length: 3.9cm, {
  import draw: *
  let reject = rgb("#b02a2a")
  let accept = rgb("#146e46")
  let m = (.22, .30)
  let d = (.34, .42)
  let x = (.46, .54)
  let u = (.62, .70)
  line((0, 0), (1, 0), (0, 1), close: true,
    fill: rgb("#e2ecf7"), stroke: .55pt + luma(45%))
  line((-.04, 0), (1.20, 0), stroke: .55pt, mark: (end: ">"))
  line((0, -.04), (0, 1.16), stroke: .55pt, mark: (end: ">"))
  content((1.24, 0), text(8pt)[$theta_1$], anchor: "west")
  content((0, 1.20), text(8pt)[$theta_2$], anchor: "south")
  content((1, -.07), text(7pt)[1])
  content((-.07, 1), text(7pt)[1])
  content((.09, .11), text(8pt)[$theta_1 + theta_2 <= 1$], anchor: "west")
  line(m, u, stroke: (paint: reject, thickness: .85pt, dash: "dashed"), mark: (end: ">"))
  line(m, d, stroke: 1pt + accept, mark: (end: ">"))
  line(x, (.60, .48), stroke: .4pt + gray)
  content((.62, .48), text(7pt)[bound reached here], anchor: "west")
  for (point, fill, outline) in ((m, black, none), (d, accept, none), (u, reject, none), (x, white, .4pt + gray)) {
    circle(point, radius: .014, fill: fill, stroke: outline)
  }
  content((.65, .72), text(8pt, fill: reject)[$+ bold(delta)$], anchor: "west")
  content((.28, .46), text(8pt, fill: accept)[$+ lambda bold(delta)$], anchor: "east")
  content((.24, .24), text(8pt)[$bold(theta)^((m))$])
})

#let coverage-transfer() = canvas(length: 1.42cm, {
  import draw: *
  let old = luma(47%)
  let new = rgb("#2a78d6")
  let accent = rgb("#be1e2d")
  let contour = ((0, 1.30), (1.1, 1.44), (2.2, 1.32), (3.3, .92),
    (4.4, .58), (5.5, .52), (6.6, .68), (7.6, .88))
  let previous = ((.35, 1.35), (1.45, 1.42), (2.55, 1.22), (3.65, .80),
    (4.75, .55), (5.85, .55), (6.95, .75))
  let current = ((.2, 1.59), (1, 1.69), (1.8, 1.66), (2.6, 1.48), (4.2, .90),
    (5, .79), (5.8, .80), (6.6, .94), (7.4, 1.11))
  let target = (3.42, 1.15)
  hobby(..contour, stroke: (paint: old, thickness: .85pt, dash: "dashed"))
  hobby(..contour.map(((x, y)) => (x, y + .26)), stroke: .85pt + new)
  for point in previous { circle(point, radius: .067, fill: white, stroke: .75pt + old) }
  for point in current { circle(point, radius: .065, fill: new, stroke: none) }
  for point in previous.slice(2, 5) {
    line(point, target, stroke: .65pt + accent, mark: (end: ">"))
  }
  circle(target, radius: .065, fill: new, stroke: none)
  circle(target, radius: .13, stroke: 1pt + accent)
  content((7.72, 1.14), text(7.5pt, fill: new)[new points], anchor: "west")
  content((7.72, .86), text(7.5pt, fill: old)[previous points], anchor: "west")
  content((4.90, 1.73), text(8pt)[$theta_i = (sum_k w_k theta_i^"old") / (sum_k w_k), quad w_k = 1/d_k$], anchor: "west")
  content((2.3, .29), text(7.5pt, fill: accent)[the $k = 3$ nearest previous points], anchor: "west")
})

#let concept() = canvas(length: 0.88cm, {
  import draw: *
  let geometry = rgb("#2869af")
  let transport = rgb("#c66923")
  let chemistry = rgb("#14784b")
  let ink = luma(28%)
  let node(x, y, label, paint, fill, width: 2.95) = {
    rect((x - width / 2, y - .52), (x + width / 2, y + .52),
      radius: .10, stroke: .65pt + paint, fill: fill)
    content((x, y), text(8pt, align(center, label)))
  }
  let arrow(..points, paint: ink) = line(..points, stroke: .65pt + paint, mark: (end: ">"))
  let label(x, y, title, paint: ink, anchor: "center") = content((x, y), text(7pt, fill: paint, title), anchor: anchor)
  let geo-fill = rgb("#e4effa")
  let flux-fill = rgb("#fdeee2")
  let chem-fill = rgb("#e1f3e8")
  for (x, y, title, paint, fill) in (
    (2.7, 0, [level-set  surface], geometry, geo-fill),
    (6.9, 0, [surface points  #text(6.8pt)[normal, material]], geometry, geo-fill),
    (11.1, 0, [ray tracing], transport, flux-fill),
    (11.1, -2.05, [fluxes $Gamma_g$  at each point], transport, flux-fill),
    (6.9, -2.05, [*surface model*  $theta_i, v_n$], chemistry, chem-fill),
    (2.7, -4.45, [reaction file  #text(6.8pt)[YAML]], chemistry, chem-fill),
    (6.9, -4.45, [mechanism data  #text(6.8pt)[arrays]], chemistry, chem-fill),
    (11.1, -4.45, [Python evaluator  #text(6.8pt)[reference]], chemistry, chem-fill),
  ) { node(x, y, title, paint, fill) }
  label(0, .52, [(a)], anchor: "west")
  arrow((4.17, 0), (5.42, 0))
  label(4.8, .20, [sample])
  arrow((8.38, 0), (9.62, 0))
  arrow((11.1, -.52), (11.1, -1.53))
  arrow((9.62, -2.05), (8.38, -2.05))
  arrow((5.42, -2.05), (2.7, -2.05), (2.7, -.52))
  label(3.9, -2.27, [advect by $v_n$])
  line((1.22, -3.23), (12.57, -3.23), stroke: (paint: gray, thickness: .42pt, dash: "dashed"))
  label(12.57, -3.05, [*ViennaPS*], paint: geometry, anchor: "east")
  label(12.57, -3.45, [*ViennaChem*], paint: chemistry, anchor: "east")
  arrow((4.17, -4.45), (5.42, -4.45))
  label(4.8, -4.22, [compile])
  arrow((6.9, -3.93), (6.9, -2.57))
  label(7.02, -3.63, [read], anchor: "west")
  arrow((8.38, -4.45), (9.62, -4.45))
  label(9, -4.22, [read])
  let key(x, y, title, paint) = {
    rect((x, y - .12), (x + .24, y + .12), stroke: none, fill: paint)
    label(x + .34, y, title, anchor: "west")
  }
  key(1.23, -5.46, [geometry], geometry)
  key(5.05, -5.46, [surface chemistry], chemistry)
  key(9.18, -5.46, [particle transport], transport)

  let manual = rgb("#b02a2a")
  let tool = rgb("#146e46")
  label(0, -6.13, [(b)], anchor: "west")
  label(3.25, -6.38, [*manual derivation*], anchor: "west")
  label(3.25, -8.92, [*derivation from chemistry*], anchor: "west")
  node(1.30, -8.05, [chemistry], ink, white, width: 2.25)
  line((3.1, -8), (14.72, -8), stroke: .4pt + luma(72%))
  for (x, y, title, paint, stacked) in (
    (4.51, -7.13, [closed form $theta(Gamma)$], manual, true),
    (8.07, -7.13, [model source], manual, true),
    (11.63, -7.13, [simulator], tool, true),
    (4.51, -9.67, [reaction file], manual, true),
    (8.07, -9.67, [compiled data], tool, true),
    (11.63, -9.67, [one  simulator], tool, false),
  ) {
    if stacked {
      for delta in (.16, .08) {
        rect((x - 1.26 + delta, y - .52 + delta), (x + 1.26 + delta, y + .52 + delta),
          radius: .08, stroke: .42pt + gray, fill: white)
      }
    }
    node(x, y, title, paint, white, width: 2.52)
  }
  arrow((2.43, -7.82), (3.25, -7.23), paint: manual)
  arrow((2.43, -8.32), (3.25, -9.47), paint: manual)
  label(2.70, -7.43, [solve], paint: manual)
  label(2.65, -8.92, [write], paint: manual)
  for (x1, x2, y, title, paint) in (
    (5.77, 6.81, -7.13, [code], manual),
    (9.33, 10.37, -7.13, [build], tool),
    (5.77, 6.81, -9.67, [compile], tool),
    (9.33, 10.37, -9.67, [read], tool),
  ) {
    arrow((x1, y), (x2, y), paint: paint)
    label((x1 + x2) / 2, y - .24, title, paint: paint)
  }
  label(13.03, -7.13, [per chemistry], anchor: "west")
  label(13.03, -9.67, [any chemistry], anchor: "west")
  key(2.65, -10.66, [written by a person, per chemistry], manual)
  key(8.90, -10.66, [produced by the tools], tool)
})
