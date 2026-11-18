#import "@preview/cetz:0.5.3": canvas, draw
#let texture = canvas(length: 8mm, {
  import draw: *
  let ink = rgb("#2b6984")
  circle((0,0), radius: 1.4, stroke: .6pt + ink, fill: rgb("#e8f0f5"))
  for i in range(8) {
    let angle = i * 45deg
    let vector(r) = (r * calc.cos(angle), r * calc.sin(angle))
    line(vector(.32), vector(1.14), stroke: .7pt + ink, mark: (end: "stealth"))
  }
  circle((0,0), radius: .07, fill: ink, stroke: none)
})
