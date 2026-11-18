#import "@preview/cetz:0.5.3": canvas, draw

#let counting-path(width) = canvas(length: width / 330, {
  import draw: *
  let ink = rgb("#294956")
  let stages = (
    ([Absorbed light], [Local heating], rgb("#f7eddf")),
    ([Magnetic switching], [Two resistance states], rgb("#e7f0f5")),
    ([Electrical counts], [Rate over a window], rgb("#e8f2ec")),
  )
  for (index, (title, detail, tint)) in stages.enumerate() {
    let x = 114 * index
    rect((x, 0), (x + 102, 38), radius: 3, fill: tint, stroke: .5pt + ink)
    content((x + 51, 25), text(size: width * 11 / 330, weight: "bold", title))
    content((x + 51, 12), text(size: width * 10 / 330, detail))
    if index < stages.len() - 1 {
      line((x + 102, 19), (x + 113, 19), stroke: .6pt + ink, mark: (end: "stealth"))
    }
  }
})
