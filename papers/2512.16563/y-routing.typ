#import "@preview/cetz:0.5.3": canvas, draw

#let y-routing(width) = canvas(length: width / 320, {
  import draw: *
  let blue = rgb("#276782")
  let red = rgb("#ac543e")
  let guide = 5pt + rgb("#dce8ee")
  line((30, 53), (145, 53), (252, 91), stroke: guide)
  line((145, 53), (252, 15), stroke: guide)
  line((43, 53), (119, 53), stroke: 1pt + blue, mark: (end: "stealth"))
  line((145, 24), (145, 82), stroke: 1pt + red, mark: (end: "stealth"))
  content((78, 69), text(size: 9pt)[自旋波入射])
  content((195, 52), text(size: 9pt)[局部横向电流])
  content((265, 91), text(size: 9pt)[$O_1$])
  content((265, 15), text(size: 9pt)[$O_2$])
})
