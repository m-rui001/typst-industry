#import "@preview/cetz:0.5.3": canvas, draw
#let pendulum = canvas(length:1mm, {
  import draw: *
  let ink = rgb("#315e75")
  rect((17,35),(43,39),fill:gray,stroke:none)
  rect((29,14),(31,35),fill:ink,stroke:none)
  rect((16,3),(44,14),fill:rgb("#e8f1f5"),stroke:.6pt+ink)
  line((31,25),(52,25),stroke:.5pt+ink)
  line((44,9),(52,9),stroke:.5pt+ink)
  content((67,25),[氮化硅悬带])
  content((64,9),[硅摆锤])
})
