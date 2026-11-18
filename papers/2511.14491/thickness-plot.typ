#import "@preview/cetz:0.4.2": canvas, draw

// Figure 3, using Eq. (11), δ₀ = 1 and an escape depth of 0.5 nm.
#let thickness-plot = block(width: 100%, layout(size => {
  let unit = size.width / 750
  canvas(length: unit, {
    let rotate-label = rotate
    import draw: *
    let xy(x, y) = (x, 549.2 - y)
    let point(a, yield) = xy(78 + 442 * a / calc.pi, 459 - 442 * yield / 6)
    let ink = 2.6 * unit + black
    let grid = 2.3 * unit + rgb("#d2d2d2")
    let label(x, y, body, size: 29, ..args) = content(
      xy(x, y), text(size: size * unit, body), ..args,
    )
    let samples(start, end) = range(241).map(i => start + (end - start) * i / 240)
    let cos(a) = calc.cos(a * 1rad)

    rect((0, 0), (750, 549.2), stroke: none)
    for (i, tick) in ($0$, $pi/6$, $pi/3$, $pi/2$, $2pi/3$, $5pi/6$, $pi$).enumerate() {
      let x = 78 + 442 * i / 6
      line(xy(x, 17), xy(x, 459), stroke: grid)
      line(xy(x, 17), xy(x, 23), stroke: ink)
      line(xy(x, 453), xy(x, 459), stroke: ink)
      label(x, 487, tick)
    }
    for v in (0, 2, 4, 6) {
      let y = 459 - 442 * v / 6
      line(xy(78, y), xy(520, y), stroke: grid)
      label(58, y, str(v))
    }
    rect(xy(78, 459), xy(520, 17), stroke: ink)
    label(299, 534, $alpha$, size: 35)
    label(20, 237, rotate-label(-90deg, reflow: true, [$delta(alpha)$]), size: 35)

    let colors = (
      "#f9d626", "#f7b629", "#acc32f", "#64cd67", "#32c2a5", "#00b8c7",
      "#1da4e1", "#2683f9", "#414ffe", "#4438ed", "#3d27c4",
    )
    rect(xy(546, 465), xy(747, 18), stroke: ink)
    line(xy(546, 56), xy(747, 56), stroke: ink)
    label(646, 37, text(weight: "bold")[Thickness (nm)], size: 25)
    for (i, shade) in colors.enumerate() {
      let paint = 3.6 * unit + rgb(shade)
      let ratio = i
      let yield(a) = {
        let c = cos(a)
        let path = if calc.abs(c) * ratio <= 1 { ratio } else { 1 / calc.abs(c) }
        path * (1 + c) / 2
      }
      let y = 75 + 33.55 * i
      line(..samples(0, calc.pi).map(a => point(a, yield(a))), stroke: paint)
      line(xy(580, y), xy(636, y), stroke: paint)
      label(643, y, [t = #str(i / 2)], size: 25, anchor: "west")
    }
    for angles in (samples(0, calc.acos(1 / 11) / 1rad), samples(calc.acos(-1 / 13) / 1rad, calc.pi)) {
      line(..angles.map(a => point(a, (1 + cos(a)) / (2 * calc.abs(cos(a))))), stroke: 3.6 * unit + black)
    }
    line(xy(580, 444), xy(636, 444), stroke: 3.6 * unit + black)
    label(643, 444, [t = $infinity$], size: 25, anchor: "west")
  })
}))
