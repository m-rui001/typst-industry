#import "@preview/cetz:0.5.3": canvas, draw
#let decay = canvas(length: 1mm, {
  import draw: *
  line((0,0),(92,0),mark:(end:"stealth"))
  line((0,0),(0,33),mark:(end:"stealth"))
  for (slope, color, label) in ((1.5, blue, [$r^(-3/2)$]), (2.5, teal, [$r^(-5/2)$]), (3.5, red, [$r^(-7/2)$])) {
    let y = 29 - 6 * slope
    line((5,29),(73,y),stroke: 1pt + color)
    content((82,y),label)
  }
  content((75,-4),[对数距离])
})
