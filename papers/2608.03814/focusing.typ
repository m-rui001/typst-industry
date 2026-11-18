#import "@preview/cetz:0.4.2": canvas, draw

#let focusing-figure() = canvas(length: 38pt, {
  import draw: *
  let p(x, y) = ((x - 603) / 100, (520 - y) / 100)
  let caption(x, y, body, size: 7.25pt, anchor: "center") = {
    content(p(x, y), text(font: "Arial", weight: "bold", size, body), anchor: anchor)
  }
  let leader(x, y, end-x, end-y) = {
    circle(p(x, y), radius: .035, stroke: none, fill: black)
    line(p(x, y), p(end-x, end-y), stroke: .45pt)
  }
  content((-6.03, 0), image("irradiance-panel.pdf", width: 229.14pt), anchor: "south-west")
  rect(p(615, 440), p(938, 67), stroke: none, fill: rgb("#eaf6fe"))
  line(p(709, 440), p(709, 67), stroke: (paint: black, thickness: .6pt, dash: "dotted"))

  bezier(p(612, 18), p(708, 284), p(670, 79), p(660, 240), stroke: .75pt + red)
  bezier(p(807, 18), p(709, 284), p(752, 82), p(751, 230), stroke: .7pt + rgb("#ffdddc"))
  line(p(642, 67), p(710, 171), stroke: (paint: red, thickness: .55pt, dash: "dashed"), mark: (end: ">"))
  line(p(679, 240), p(710, 395), stroke: (paint: red, thickness: .55pt, dash: "dashed"), mark: (end: ">"))
  line(p(775, 67), p(710, 171), stroke: (paint: rgb("#f5d2d2"), thickness: .45pt, dash: "dashed"))
  line(p(740, 240), p(710, 395), stroke: (paint: rgb("#f5d2d2"), thickness: .45pt, dash: "dashed"))
  bezier(p(700, 149), p(708, 145), p(703, 146), p(706, 145), stroke: .5pt)
  bezier(p(703, 363), p(709, 361), p(705, 361), p(707, 361), stroke: .5pt)
  circle(p(709, 283), radius: (.25, .28), stroke: .85pt + rgb("#cf9d58"), fill: rgb("#f7d28e"))
  circle(p(709, 283), radius: (.20, .24), stroke: none, fill: rgb("#fff719"))
  circle(p(709, 283), radius: (.10, .14), stroke: none, fill: white)

  for (x, y) in ((749, 284), (765, 396)) {
    line(p(x, 68), p(x, y), stroke: .56pt, mark: (start: "<", end: ">"))
  }
  line(p(737, 284), p(759, 284), stroke: .56pt)
  line(p(709, 396), p(774, 396), stroke: .56pt)
  leader(641, 57, 658, 40)
  leader(701, 291, 685, 309)
  leader(727, 294, 744, 310)
  leader(727, 308, 744, 325)

  caption(707, 26, [Beam path], size: 7.8pt)
  caption(910, 48, [Air], size: 9pt)
  caption(892, 90, [4H-SiC], size: 9pt)
  caption(691, 111, [$theta_1$], size: 9pt)
  caption(683, 377, [$theta_2$], size: 9pt)
  caption(790, 262, [$z_"sf"$], size: 8pt)
  caption(793, 392, [$z_"f"$], size: 8pt)
  caption(874, 262, align(center)[Self-focusing \ depth])
  caption(872, 390, align(center)[Geometric \ focal depth])
  caption(654, 322, align(center)[Micro \ void])
  caption(749, 312, [Plasma plume], anchor: "west")
  caption(749, 335, [Heat affected zone], anchor: "west")
  content(p(778, 486), text(font: "Arial", size: 11.4pt)[(b)])
})
