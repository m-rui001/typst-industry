#import "@preview/cetz:0.4.2": canvas, draw

// Figure 1 overlays only the geometry insets. The DNS panels use the source image.
#let channel-figure = block(width: 100%, layout(size => {
  let unit = size.width / 327
  let height = 327 * 720 / 692
  let insets = canvas(length: unit, {
    import draw: *
    let xy(x, y) = (x, height - y)
    let stroke = .85 * unit + black
    let tag(x, y, body) = content(xy(x, y), text(size: 10.5 * unit, body))

    rect(xy(0, height), xy(327, 0), stroke: none)
    rect(xy(9, 50), xy(81, 0), stroke: none, fill: white)
    rect(xy(57, 58), xy(73, 49), stroke: none, fill: white)
    rect(xy(197, 38), xy(228, 0), stroke: none, fill: white)
    rect(xy(225, 30), xy(235, 0), stroke: none, fill: white)
    for (name, cx, apex, base, half-width) in (
      ("T950", 44, 13, 43, 30),
      ("T615", 212, 14, 32, 10.4),
    ) {
      let right = cx + half-width
      line(xy(cx - half-width, base), xy(cx, apex), xy(right, base),
        close: true, fill: rgb("#d6d6d6"), stroke: stroke)
      tag(cx, 5, name)
      line(xy(right - 2, base - 4), xy(cx + 6, apex + 4),
        mark: (end: ">", scale: .55), stroke: stroke)
      tag(right + 2, apex + 15, $xi$)
      line(xy(right - 1, base + 4), xy(right - 16, base + 4),
        mark: (end: ">", scale: .55), stroke: stroke)
      tag(right - 9, base + 11, $z$)
    }
  })

  box(width: size.width, height: height * unit)[
    #place(top + left, image("source/fig7.png", width: size.width))
    #place(top + left, insets)
  ]
}))
