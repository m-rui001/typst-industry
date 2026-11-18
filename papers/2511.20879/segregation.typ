#import "@preview/cetz:0.5.3": canvas, draw
#let segregation = canvas(length: 1mm, {
  import draw: *
  let ink = rgb("#315e75")
  line((26,0),(130,0),mark:(end:"stealth"))
  for (x, label) in ((26,[0.1]),(58,[1]),(90,[10])) {
    line((x,0),(x,3))
    content((x,-4),label)
  }
  line((58,3),(58,38),stroke:.5pt+gray)
  for (lower, value, upper, y, label) in (
    (.10,.17,.24,9,[磷]),
    (.61,.67,.73,19,[铝＋镓]),
    (10.05,11.41,12.77,29,[硼]),
  ) {
    let x(k) = 58 + 32 * calc.log(k)
    content((11,y),label)
    line((x(lower),y),(x(upper),y),stroke:1pt+ink)
    circle((x(value),y),radius:1.1,fill:ink,stroke:none)
  }
  content((80,-10),[有效偏析系数（对数轴）])
})
