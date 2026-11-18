#import "@preview/cetz:0.4.2": canvas, draw

// Figure 1(a), in the coordinate system of the original composite.
#let junction-geometry(unit) = canvas(length: unit, {
  import draw: *
  let xy(x, y) = (x, 213 - y)
  let path(points, ..style) = line(..points.map(p => xy(..p)), ..style)
  let polygon(points, color) = path(points, close: true, fill: color, stroke: none)
  let label(x, y, body, size: 9) = content(
    xy(x, y), text(font: "Arial", size: size * unit, body),
  )
  let top = rgb("#708586")
  let front = rgb("#91afb0")
  let side = rgb("#a8c7c7")
  let barrier = rgb("#c17a2d")
  let field = rgb("#e52521")
  let wire = .65 * unit + black
  let red = 1.25 * unit + field
  let arrow = (end: ">", fill: field, scale: .7)
  polygon(((0, 0), (171, 0), (171, 213), (0, 213)), white)

  label(15, 17, [(a)], size: 12)
  label(61, 10, [Overlap])
  // The junction sits between the superconducting films.
  polygon(((25, 67), (114, 67), (138, 44), (49, 44)), top)
  polygon(((25, 67), (114, 67), (114, 88), (25, 88)), front)
  polygon(((114, 67), (138, 44), (138, 65), (114, 88)), side)
  polygon(((26, 64), (114, 64), (128, 51), (40, 51)), barrier)
  polygon(((26, 44), (106, 44), (128, 21), (48, 21)), top)
  polygon(((26, 44), (106, 44), (106, 64), (26, 64)), front)
  polygon(((106, 44), (128, 21), (128, 43), (106, 64)), side)
  for (x, y) in ((21, 93), (51, 93), (81, 93)) {
    path(((x, y), (x + 79, y - 79)), stroke: red, mark: arrow)
  }
  path(((36, 54), (105, 54)), stroke: wire, mark: (start: "<", end: ">"))
  label(73, 52, box(fill: front, outset: .5 * unit)[$L_x$])
  path(((16, 50), (16, 71)), stroke: wire, mark: (start: "<", end: ">"))
  path(((16, 73), (16, 92)), stroke: wire)
  label(17, 45, [$Lambda_z$])

  label(34, 121, [Planar])
  label(64, 126, text(fill: field)[$H$], size: 12)
  polygon(((14, 166), (122, 166), (145, 144), (37, 144)), top)
  polygon(((14, 166), (122, 166), (122, 186), (14, 186)), front)
  polygon(((122, 166), (145, 144), (145, 164), (122, 186)), side)
  polygon(((68, 166), (72, 166), (94, 144), (90, 144)), barrier)
  polygon(((68, 166), (72, 166), (72, 186), (68, 186)), barrier)
  path(((83, 201), (83, 186)), stroke: red)
  path(((83, 157), (83, 122)), stroke: red, mark: arrow)
  bezier(xy(74, 204), xy(70, 151), xy(43, 181), xy(48, 165), stroke: red, mark: arrow)
  bezier(xy(92, 186), xy(95, 130), xy(119, 161), xy(120, 149), stroke: red, mark: arrow)
  for x in (27, 69) {
    path(((x, 185), (x, 208)), stroke: (paint: black, thickness: .5 * unit, dash: "dotted"))
  }
  path(((27, 204), (69, 204)), stroke: wire, mark: (start: "<", end: ">"))
  label(47, 200, box(fill: white)[$Lambda_z$])
  path(((122, 153), (145, 130)), stroke: wire, mark: (start: "<", end: ">"))
  label(133, 127, [$L_x$])

  // Both sketches use the same physical axis directions.
  for (x, y, direction) in ((133, 96, 1), (131, 191, -1)) {
    path(((x, y), (x + 16 * direction, y)), stroke: wire, mark: (end: ">"))
    path(((x, y), (x, y - 15 * direction)), stroke: wire, mark: (end: ">"))
    path(((x, y), (x + 12, y - 12)), stroke: wire, mark: (end: ">"))
    label(x + 20 * direction, y + 3, if direction == 1 { [$x$] } else { [$z$] }, size: 7)
    label(x + 5, y - 19 * direction, if direction == 1 { [$z$] } else { [$y$] }, size: 7)
    label(x + 16, y - 12, if direction == 1 { [$y$] } else { [$x$] }, size: 7)
  }
})

#let sensor-figure = block(width: 99%, layout(size => {
  let unit = size.width / 684
  image("source/Figure1_Sensor_Vc.pdf", width: 100%)
  place(top + left, dx: 8 * unit, dy: 2 * unit, junction-geometry(unit))
}))

