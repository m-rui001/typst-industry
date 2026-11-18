#import "@preview/cetz:0.4.2": canvas, draw

// Figure 2 is qualitative. The traces preserve the positions and signs
// of the charge regions and current components, without a numerical scale.
#let mos-capacitor = block(width: 96%, layout(size => {
  let u = size.width / 520
  canvas(length: u, {
    import draw: *
    let pt(x, y) = (x, 393 - y)
    let ink = black + 1.4 * u
    let axis = rgb("#666666") + 1.1 * u
    let blue = rgb("#137db6")
    let gold = rgb("#e1a518")
    let orange = rgb("#c85000")
    let segment(x1, y1, x2, y2, stroke: ink, ..args) = {
      line(pt(x1, y1), pt(x2, y2), stroke: stroke, ..args)
    }
    let label(x, y, body, fill: black, anchor: "center") = {
      content(pt(x, y), text(size: 15 * u, fill: fill, body), anchor: anchor)
    }
    let region(points, fill, color) = {
      line(..points.map(((x, y)) => pt(x, y)), close: true, fill: fill, stroke: color + 1.8 * u)
    }
    let curve(points, color) = {
      let (start, control-1, control-2, end) = points.map(((x, y)) => pt(x, y))
      bezier(start, end, control-1, control-2, stroke: color + 2 * u)
    }
    rect(pt(0, 393), pt(520, 0), stroke: none)

    line(pt(58, 100), pt(19, 100), pt(19, 32), pt(250, 32), stroke: ink)
    line(pt(282, 32), pt(507, 32), pt(507, 100), pt(468, 100), stroke: ink)
    for x in (58, 468) { circle(pt(x, 100), radius: 3, fill: black, stroke: none) }
    circle(pt(266, 32), radius: 16, stroke: ink)
    label(266, 32, $V_g$)
    segment(355, 19, 330, 19, mark: (end: ">"))
    label(368, 19, $J_g$)
    segment(19, 100, 19, 118)
    for (i, width) in (20, 14, 8).enumerate() {
      segment(19 - width / 2, 118 + 5 * i, 19 + width / 2, 118 + 5 * i)
    }
    for (x1, x2, mat, eps, fill) in (
      (80, 194, [SiC], $epsilon_s$, "#92b671"),
      (194, 310, [a-SiO#sub[2]], $epsilon_("ox")$, "#d3d3d3"),
      (310, 425, [n#super[+]–Si], $epsilon_g$, "#91c2e2"),
    ) {
      let mid = (x1 + x2) / 2
      rect(pt(x1, 111), pt(x2, 87), fill: rgb(fill), stroke: ink)
      label(mid, 70, mat)
      label(mid, 99, eps)
    }
    label(73, 70, [metal 1])
    label(458, 70, [metal 2])
    segment(65, 132, 452, 132, stroke: axis, mark: (end: ">"))
    for (x, label-x, name) in ((194, 189, $0$), (208, 221, $z_("t,m")$), (310, 310, $L$), (425, 425, $L_m$)) {
      segment(x, 123, x, 140, stroke: axis)
      label(label-x, 150, name)
    }
    label(442, 150, [$z$ (nm)], anchor: "west")

    region(((100, 225), (140, 227), (166, 233), (185, 245), (194, 262), (194, 225)), rgb("#d3e9f5"), blue)
    region(((195, 225), (195, 214), (233, 214), (271, 218), (305, 225)), rgb("#fff0ac"), gold)
    region(((310, 225), (310, 198), (319, 211), (340, 216), (373, 221), (425, 225)), rgb("#fff0ac"), gold)
    segment(65, 225, 454, 225, stroke: axis, mark: (end: ">"))
    segment(195, 261, 195, 177, stroke: axis, mark: (end: ">"))
    label(179, 187, $rho(z)$)
    for (x, y, name, x2, y2) in (
      (142, 211, $Q_s$, 182, 234), (215, 262, $Q_("it,s")$, 195, 253),
      (263, 190, $Q_("ox")$, 236, 219), (331, 189, $Q_("it,g")$, 311, 207),
      (349, 242, $Q_g$, 325, 220),
    ) {
      label(x, y, name)
      segment(x + if x < x2 { 10 } else { -9 }, y + 4, x2, y2, stroke: axis, mark: (end: ">"))
    }

    segment(65, 345, 454, 345, stroke: axis, mark: (end: ">"))
    segment(195, 384, 195, 298, stroke: axis, mark: (end: ">"))
    for (x, top-y, bottom-y) in ((208, 320, 359), (312, 320, 366), (406, 320, 366), (426, 320, 344)) {
      segment(x, top-y, x, bottom-y, stroke: (paint: gray, thickness: u, dash: "dashed"))
    }
    label(176, 303, $J(z)$)
    label(288, 308, $J(z) = J_n(z) + J_p(z)$)
    line(pt(81, 323), pt(195, 323), pt(195, 332), pt(208, 332), pt(208, 323), pt(438, 323), stroke: blue + 2 * u)
    curve(((207, 337), (256, 337), (272, 331), (312, 325)), blue)
    curve(((312, 325), (354, 323), (385, 330), (406, 345)), blue)
    curve(((195, 359), (222, 361), (268, 347), (312, 347)), orange)
    curve(((312, 347), (352, 345), (385, 351), (406, 365)), orange)
    segment(406, 365, 438, 365, stroke: orange + 2 * u)
    label(451, 324, $J_g$)
    label(328, 337, $J_n(z)$, fill: blue)
    label(239, 367, $J_p(z)$, fill: orange)
  })
}))
