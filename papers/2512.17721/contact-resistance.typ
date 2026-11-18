#import "@preview/cetz:0.4.2": canvas, draw

#let contact-resistance() = canvas(length: .66cm, {
  import draw: *
  let gold = rgb("#ffda00")
  let gray-layer = rgb("#adadad")
  let blue = rgb("#a4c9e8")
  let wire = .65pt + black
  let font-label(label, size: 8pt) = text(font: "Arial", size: size, label)
  let panel(y, tag, coated) = {
    let base = if coated { y - 3.1 } else { y - 2.55 }
    let terminal = if coated { y - 2.0 } else { base + .35 }
    let upper = y - .35
    let volt = (upper + terminal) / 2
    let battery = (upper + base + .35) / 2
    let layer(bottom, top, fill, label) = {
      rect((2.3, bottom), (7.45, top), stroke: wire, fill: fill)
      content((4.875, (bottom + top) / 2), font-label(label))
    }
    layer(y - .73, y, gold, [Au-coated electrode])
    layer(y - 1.40, y - .90, gray-layer, [GDL])
    if coated { layer(y - 2.04, y - 1.55, blue, [BPP]) }
    layer(base, base + .73, gold, [])
    line((2.3, upper), (.34, upper), (.34, battery + .05), stroke: wire)
    line((.34, battery - .12), (.34, base + .35), (2.3, base + .35), stroke: wire)
    line((.04, battery + .05), (.64, battery + .05), stroke: .8pt)
    line((.18, battery - .12), (.50, battery - .12), stroke: .8pt)
    line((7.45, upper), (8.65, upper), (8.65, terminal), (7.45, terminal), stroke: wire)
    for (point, name) in (((1.23, upper), [A]), ((8.65, volt), [V])) {
      circle(point, radius: .39, stroke: .75pt, fill: white)
      content(point, font-label(name))
    }
    for (tip, sign) in (((4.78, y + .19), 1), ((4.78, base - .19), -1)) {
      let (x, h) = tip
      line((x, h), (x - .16, h + sign * .23), (x - .05, h + sign * .23),
        (x - .05, h + sign * .72), (x + .05, h + sign * .72),
        (x + .05, h + sign * .23), (x + .16, h + sign * .23),
        close: true, stroke: .75pt, fill: white)
    }
    content((4.78, y + 1.20), font-label([Compaction force]))
    content((.24, y + 1.20), font-label(tag))
  }
  panel(0, [(a)], true)
  panel(-6.3, [(b)], false)
})
