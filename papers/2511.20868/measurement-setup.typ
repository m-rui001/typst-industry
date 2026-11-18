#import "@preview/cetz:0.4.2": canvas, draw

#let measurement-setup(width) = canvas(length: width / 760, {
  import draw: *
  let brass = rgb("#d5a54c")
  let frame = 0.6pt + rgb("#72592f")
  let light = 1.1pt + rgb("#bb3327")
  let note(p, body, size: 19) = content(p, text(font: "Arial", size: width * size / 760, body))
  rect((0, 0), (760, 545), stroke: none)
  rect((329, 163), (345, 490), fill: luma(215), stroke: .45pt + luma(130))
  rect((403, 77), (413, 290), fill: luma(220), stroke: .45pt + luma(130))
  for (x1, x2, y, tag) in (
    (286, 528, 307, [40 K stage]),
    (320, 502, 169, [4 K stage]),
    (361, 466, 66, [240 mK stage]),
  ) {
    rect((x1, y), (x2, y + 13), radius: 3, fill: brass, stroke: frame)
    line((x2, y + 7), (x2 + 24, y + 7), stroke: .5pt + black)
    content((x2 + 31, y + 7), text(font: "Arial", size: width * 19 / 760, tag), anchor: "west")
  }
  rect((304, 320), (503, 437), radius: 7, fill: rgb("#f1d38d"), stroke: frame)
  note((404, 461), [Grating monochromator], size: 23)
  rect((57, 367), (141, 397), radius: 5, fill: luma(70), stroke: .65pt + black)
  note((100, 330), [Thermal light source])
  rect((175, 357), (186, 407), fill: luma(160), stroke: .5pt + black)
  note((180, 430), [Longpass filter])
  rect((231, 358), (240, 405), fill: rgb("#dbedf3"), stroke: .5pt + black)
  note((237, 332), [KBr window])
  line((140, 382), (322, 382), stroke: light, mark: (end: "stealth"))
  line((322, 382), (382, 382), (448, 342), stroke: light)
  line((436, 338), (456, 356), stroke: .8pt + black)
  bezier((448, 342), (445, 83), (492, 291), (462, 139), stroke: light)
  line((469, 244), (509, 244), stroke: .5pt + black)
  content((516, 244), text(font: "Arial", size: width * 19 / 760)[Hollow-core fiber], anchor: "west")
  rect((435, 78), (454, 90), fill: rgb("#553538"), stroke: frame)
  note((446, 40), [SNSPD])
})
