#import "@preview/cetz:0.4.2": canvas, draw

// The two traces were digitized from the blue lines in the original PNG assets.
// Plot-frame intersections and grid lines define the coordinate transform.
#let traces = json("recovery-traces.json")

#let recovery-panel(width, panel, trace, x-max, aspect) = {
  let unit = width / 540
  let height = 540 / aspect
  let left = 78
  let right = 536
  let bottom = 65
  let top = height - 50
  let point(x, y) = (
    left + (right - left) * x / x-max,
    bottom + (top - bottom) * y / .6,
  )
  canvas(length: unit, {
    let rotate-label = rotate
    import draw: *
    let ink = 2 * unit + black
    let grid = 1.7 * unit + rgb("#d2d2d2")
    let tag(at, body, size: 20) = content(at, text(size: size * unit, body))
    rect((0, 0), (540, height), stroke: none)
    for x in (0, 5, 10, 15, 20) {
      let (pos, _) = point(x, 0)
      line((pos, bottom), (pos, top), stroke: grid)
      line((pos, bottom), (pos, bottom + 6), stroke: ink)
      line((pos, top), (pos, top - 6), stroke: ink)
      tag((pos, bottom - 18), str(x))
    }
    for y in (0, .2, .4, .6) {
      let (_, pos) = point(0, y)
      line((left, pos), (right, pos), stroke: grid)
      line((left, pos), (left + 6, pos), stroke: ink)
      line((right, pos), (right - 6, pos), stroke: ink)
      content((left - 7, pos), text(size: 20 * unit, str(y)), anchor: "east")
    }
    rect((left, bottom), (right, top), stroke: ink)
    line(..trace.map(((x, y)) => point(x, y)), stroke: 3 * unit + blue)
    tag((17, height - 15), $lr((#panel))$, size: 25)
    tag(((left + right) / 2, 21), $x / delta_0$, size: 25)
    tag((19, (bottom + top) / 2), rotate-label(-90deg, reflow: true, [$delta_("IEL") / delta_0$]), size: 25)
  })
}

#let recovery-figure = block(width: 100%, layout(size => {
  stack(
    dir: ttb,
    spacing: 0pt,
    recovery-panel(size.width, [a], traces.at(0), 24, 3229 / 1872),
    recovery-panel(size.width, [b], traces.at(1), 23, 3241 / 1845),
  )
}))
