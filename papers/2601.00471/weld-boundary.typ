#import "@preview/cetz:0.5.3": canvas, draw

#let weld-boundary(width) = canvas(length: width / 432, {
  import draw: *
  let green = rgb("#76a591")
  let heat = rgb("#ce7770")
  let blue = rgb("#224ba8")
  let edge = .55pt + black
  let label(p, t) = content(p, text(size: width * 13 / 432, t))
  let arrow(a,b, color: black) = line(a,b,stroke: .55pt + color,mark: (end: "stealth"))

  rect((30,54), (402,96), fill: green, stroke: edge)
  line((181,96),(206,54),(226,54),(251,96),close: true,fill: heat,stroke: edge)
  line((192,96),(212,59),(212,54),(220,54),(220,59),(240,96),
    close: true,fill: luma(172),stroke: edge)
  bezier((192,96),(240,96),(208,102),(224,102), stroke: edge)
  for (x,y,w) in ((198,85,36),(204,74,24),(210,63,12)) {
    bezier((x,y),(x+w,y),(x+w*.3,y - 3),(x+w*.7,y - 3),stroke: edge)
  }

  line((30,98),(30,130),stroke: edge)
  line((402,98),(402,130),stroke: edge)
  line((30,127),(402,127),stroke: edge,mark: (start: "stealth",end: "stealth"))
  label((216,138),[$L_0$])
  label((216,113),[Weld metal])
  label((267,109),[HAZ])
  arrow((254,104),(245,96))
  label((83,72),[Base metal])
  label((70,113),text(fill: blue)[$C_L = 0$])
  arrow((89,108),(106,96))
  line((325,54),(325,96),stroke: edge,mark: (start: "stealth",end: "stealth"))
  label((349,74),[$t_"pipe"$])
  for y in (55,65,75,85,95) {
    arrow((30,y),(15,y))
    arrow((402,y),(417,y))
  }
  label((6,75),[$u_l$])
  label((426,75),[$u_l$])
  for i in range(28) {
    let x = 34 + 13.5 * i
    arrow((x,43),(x,53),color: if calc.rem(i,2)==0 { blue } else { black })
  }
  label((182,37),[$u_r$])
  label((243,35),text(fill: blue)[$C_L = s sqrt(p_(H_2))$])
  for x in (54,99,314,355,391) { label((x,26),text(fill: blue)[$H_2$]) }
  line((30,12),(402,12),stroke: (paint: black, thickness: .55pt,dash: "dash-dotted"))
  arrow((30,12),(30,54))
  label((19,33),[$r$])
})
