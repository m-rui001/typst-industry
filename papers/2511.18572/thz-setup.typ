#import "@preview/cetz:0.4.2": canvas, draw

#let thz-setup() = canvas(length: .13mm, {
  import draw: *
  let pt(x, y) = (x, 312 - y)
  let ink = .48pt + black
  let label(x, y, body, fill: black) = content(pt(x, y), text(size: 7pt, fill: fill, body))
  let path(coords, stroke: ink, fill: none, close: false) = line(
    ..coords.map(((x, y)) => pt(x, y)), stroke: stroke, fill: fill, close: close,
  )
  let box(x, y, xx, yy) = rect(pt(x, y), pt(xx, yy), stroke: ink, fill: white)
  let wire(x, y, xx, yy) = bezier(pt(x, y), pt(xx, yy), pt((2*x+xx)/3, y), pt((x+2*xx)/3, yy), stroke: ink)
  let wave(x, y, n, hue, beat: false) = {
    let points = range(151).map(i => {
      let t = i / 150
      let envelope = if beat { .55 + .45 * calc.cos(720deg * t) } else { 1 }
      (x + 85 * t, y + 18 * envelope * calc.sin(n * 360deg * t))
    })
    path(points, stroke: .32pt + hue)
  }
  box(386, 42, 631, 288)
  label(589, 64, [humidity \ chamber])
  let pink = rgb("#f1c7d8")
  path(((456, 72), (477, 86), (477, 119), (570, 160), (492, 151), (455, 113)), fill: pink, stroke: none, close: true)
  path(((570, 164), (493, 184), (456, 214), (456, 260), (477, 242), (477, 206), (500, 199)), fill: pink, stroke: none, close: true)
  wire(104, 136, 192, 165)
  wire(104, 192, 192, 165)
  wire(228, 165, 420, 81)
  wire(228, 165, 420, 249)
  for (y, tag) in ((119, [laser 1]), (175, [laser 2])) {
    box(16, y, 104, y+35)
    label(60, y+17, tag)
  }
  box(192, 157, 228, 173)
  label(217, 184, [$2 times 2$ coupler])
  wave(106, 113, 12, red)
  wave(106, 218, 13, blue)
  wave(209, 113, 16, rgb("#cf0148"), beat: true)
  wave(209, 218, 16, rgb("#cf0148"), beat: true)
  label(151, 80, $lambda_1$, fill: red)
  label(151, 254, $lambda_2$, fill: blue)
  label(265, 80, [beat note], fill: rgb("#cf0148"))
  label(520, 101, [CW THz], fill: rgb("#d96996"))
  for (y, tag, dy) in ((69, [tx], -10), (243, [rx], 28)) {
    box(420, y, 445, y+18)
    rect(pt(436, y+3), pt(444, y+15), stroke: none, fill: black)
    label(433, y+dy, tag)
  }
  path(((454, 70), (477, 91)), stroke: 1pt + black)
  path(((454, 112), (478, 147)), stroke: 1pt + black)
  path(((454, 217), (478, 182)), stroke: 1pt + black)
  path(((454, 261), (477, 238)), stroke: 1pt + black)
  for (x, y, a) in ((498, 141, -6), (498, 189, 6)) {
    path(((x+a, y - 15), (x - a, y+15)))
    path(((x+a+3, y - 15), (x - a+3, y+15)))
  }
  box(571, 154, 578, 175)
  label(583, 141, [sample])
  label(599, 229, [$x y z$ \ linear \ stage])
  line(pt(566, 183), pt(604, 183), stroke: ink, mark: (start: ">", end: ">"))
  line(pt(586, 165), pt(586, 201), stroke: ink, mark: (start: ">", end: ">"))
  path(((420, 73), (411, 73), (348, 38), (280, 38), (280, 50)))
  path(((272, 50), (289, 50)))
  circle(pt(333, 38), radius: 11, stroke: ink, fill: white)
  label(333, 38, [∿])
  label(333, 13, $V_"bias"$)
  path(((420, 257), (411, 257), (342, 288), (298, 288)))
  path(((340, 278), (340, 298), (324, 288)), fill: white, close: true)
  label(331, 269, [PDA])
  label(252, 288, [lock-in \ detection])
  label(436, 132, [mirror])
  label(510, 213, [lens])
  label(502, 253, [OAP])
})
