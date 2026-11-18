#import "@preview/cetz:0.5.3": canvas, draw
#let timing = canvas(length: 1mm, {
  import draw: *
  let ink = rgb("#315e75")
  content((17,24), [连续微波])
  content((17,8), [单像素受光])
  line((36,24),(139,24),stroke:1pt+ink)
  line((36,5),(139,5),stroke:.5pt+gray)
  for x in (49,87,125) {
    rect((x,5),(x+5,13),fill:ink,stroke:none)
  }
  line((54,0),(86,0),stroke:.5pt+ink,mark:(start:"stealth",end:"stealth"))
  content((70,-5), [扫描其余像素])
})
