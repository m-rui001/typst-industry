#import "@preview/cetz:0.5.3": canvas, draw

#let thermal-switch(width) = canvas(length: width / 335, {
  import draw: *
  let ink = rgb("#3b4b59")
  let label(at, body, size: 11) = content(at, text(size: width * size / 335, body))
  let box(a,b,fill) = rect(a,b,radius: 3,fill: fill,stroke: .65pt + ink)
  box((5,37),(98,81),rgb("#e8f1f9"))
  box((119,37),(216,81),rgb("#f1f0ee"))
  box((237,37),(330,81),rgb("#f8ebe5"))
  label((51,70),[Below 325 K])
  label((51,52),[$bold(M) perp c$])
  label((168,70),[325–367 K])
  label((168,52),[Spin reorientation],size: 10)
  label((284,70),[Above 367 K])
  label((284,52),[$bold(M) parallel c$])
  for (a,b) in ((98,119),(216,237)) {
    line((a,60),(b,60),stroke: .75pt + ink,mark: (end: "stealth"))
  }
  for x in (51,284) {
    line((x,37),(x,22),stroke: .75pt + ink,mark: (end: "stealth"))
  }
  line((51,21),(284,21),stroke: .65pt + ink)
  label((168,8),[Different transverse heat-flux responses under the same bias],size: 10)
})
