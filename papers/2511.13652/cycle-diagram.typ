#import "@preview/cetz:0.4.2": canvas, draw

#let cycle-diagram(width) = canvas(length: width / 469, {
  import draw: *
  let ink = (paint: black, thickness: width * 4.5 / 469, cap: "round")
  let guide = (paint: black, thickness: width * 2.8 / 469, dash: "dashed")
  let curve-stroke(color) = (paint: rgb(color), thickness: width * 7 / 469)
  let label(p, body, size: 30) = content(
    p, text(font: "Libertinus Serif", size: width * size / 469, weight: "bold", body),
  )
  rect((0, 0), (469, 354), stroke: none)
  line((41, 104), (437, 104), stroke: guide)
  line((41, 293), (437, 293), stroke: guide)
  line((141, 52), (141, 304), stroke: guide)
  line((402, 52), (402, 304), stroke: guide)
  line((41, 52), (457, 52), stroke: ink, mark: (end: ">"))
  line((41, 52), (41, 339), stroke: ink, mark: (end: ">"))

  let a = (141, 293)
  let b = (402, 293)
  let c = (141, 104)
  line(c, a, b, stroke: curve-stroke("#ef4938"))
  line(c, b, stroke: curve-stroke("#58acda"))
  bezier(c, b, (182, 219), (271, 272), stroke: curve-stroke("#9b83cf"))
  bezier(c, b, (252, 134), (363, 214), stroke: curve-stroke("#f4d755"))
  bezier(c, b, (291, 110), (384, 157), stroke: curve-stroke("#a9ec52"))

  for (start, end) in (
    ((141, 188), (141, 223)), ((248, 293), (283, 293)),
    ((254, 244), (228, 223)), ((286, 210), (259, 189)),
    ((303, 185), (276, 165)), ((325, 160), (299, 141)),
  ) {
    line(start, end, stroke: width * 8 / 469 + black, mark: (end: "stealth"))
  }
  label((16, 328), [T])
  label((19, 287), [T#sub[h]])
  label((19, 101), [T#sub[c]])
  label((122, 280), [A])
  label((416, 277), [B])
  label((126, 89), [C])
  label((142, 29), [S#sub[A]])
  label((402, 29), [S#sub[B]])
  label((452, 21), [S])
})
