#import "@preview/cetz:0.4.2": canvas, draw

#let slab-diagram() = canvas(length: 1cm, {
  import draw: *
  let point(x, y) = (x / 82.5, (660 - y) / 82.5)
  let path(..args) = line(..args.pos().map(p => point(..p)), ..args.named())
  let left-front = (231, 260)
  let right-front = (289, 271)
  let left-back = (385, 133)
  let right-back = (439, 142)
  let bottom-left-front = (234, 508)
  let bottom-right-front = (291, 520)
  let bottom-left-back = (383, 366)
  let bottom-right-back = (436, 376)
  let edge = 0.65pt + black
  let pale-blue = rgb("#d1e8ee")
  let face-blue = rgb("#cce4eb")
  let flux = rgb("#4aa44c")

  rect((0, 0), (8, 8), fill: white, stroke: none)
  for (x, y) in ((231, 202), (192, 233), (151, 265), (193, 293),
                 (153, 326), (194, 351), (154, 386)) {
    path((x + 65, y + 13), (x, y), stroke: 0.8pt + flux.lighten(48%))
    path((x + 18, y + 4), (x, y), stroke: 0.88pt + flux)
  }
  path(left-front, left-back, bottom-left-back, bottom-left-front,
    close: true, stroke: edge, fill: pale-blue.transparentize(23%))
  path(right-front, right-back, bottom-right-back, bottom-right-front,
    close: true, stroke: edge, fill: face-blue.transparentize(20%))
  path(left-front, right-front, bottom-right-front, bottom-left-front,
    close: true, stroke: edge, fill: pale-blue.transparentize(32%))
  path(left-front, left-back, right-back, right-front,
    close: true, stroke: edge, fill: pale-blue)
  path(bottom-left-front, bottom-left-back, bottom-right-back, stroke: 0.65pt + rgb("#2c3c41"))

  for (x, y) in ((458, 244), (423, 277), (457, 304), (422, 338),
                 (456, 363), (386, 373), (421, 398), (385, 435)) {
    path((x, y), (x + 68, y + 13), stroke: 0.8pt + flux.lighten(48%))
    path((x + 49, y + 9), (x + 68, y + 13), stroke: 0.88pt + flux)
  }
  circle(point(363, 185), radius: 0.042, stroke: none, fill: red)
  path((363, 172), (344, 188), stroke: 0.65pt + red)
  path((344, 188), (349, 179), (353, 185), close: true, stroke: none, fill: red)

  path((623, 433), (631, 435), (632, 424), stroke: edge)
  path((631, 435), (627, 441), stroke: edge)
  content(point(620, 448), text(size: 5pt)[$x$])
  content(point(633, 414), text(size: 5pt)[$y$])
  content(point(615, 430), text(size: 5pt)[$z$])
})
