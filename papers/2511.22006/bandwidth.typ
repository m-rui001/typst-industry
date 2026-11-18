#import "@preview/cetz:0.4.2": canvas, draw

#let rotate-label = rotate

#let bandwidth-panel(width) = canvas(length: width / 169, {
  import draw: *
  let x(f) = 44 + (calc.log(f, base: 10) - 1) * 28.5
  let y(r) = 56 + (calc.log(r, base: 10) - 3) * 42
  let label(at, body, size: 8.3) = content(at, text(font: "Arial", size: width * size / 169, body))
  let color = rgb("#4c2380")
  let f-cutoff = 1 / (2 * calc.pi * 34e-6)
  let response(f) = 9520 / calc.sqrt(1 + (f / f-cutoff) * (f / f-cutoff))
  rect((0, 0), (169, 105.065), stroke: none)
  for decade in range(1, 5) {
    for step in range(1, 10) {
      let freq = step * calc.pow(10, decade)
      line((x(freq), 27), (x(freq), 100), stroke: .16pt + luma(215))
    }
  }
  for decade in range(2, 5) {
    for step in range(1, 10) {
      let gain = step * calc.pow(10, decade)
      if y(gain) >= 27 and y(gain) <= 100 {
        line((44, y(gain)), (158, y(gain)), stroke: .16pt + luma(215))
      }
    }
  }
  line((x(f-cutoff), 27), (x(f-cutoff), 100), stroke: (paint: luma(65), thickness: .45pt, dash: "dashed"))
  line(..range(101).map(i => {
    let f = calc.pow(10, 1 + .04 * i)
    (x(f), calc.max(27, y(response(f))))
  }), stroke: .85pt + color)
  rect((44, 27), (158, 100), stroke: .37pt + luma(75))
  for d in range(1, 6) {
    let loc = x(calc.pow(10, d))
    line((loc, 27), (loc, 24.5), stroke: .32pt + black)
    label((loc, 18), $10^#d$, size: 7.5)
  }
  for d in (3, 4) {
    let loc = y(calc.pow(10, d))
    line((41.5, loc), (44, loc), stroke: .32pt + black)
    label((34, loc), $10^#d$, size: 7.5)
  }
  label((101, 6), [Frequency (Hz)])
  label((9, 64), rotate-label(-90deg, reflow: true, [$|R_lambda|$ (nm/W)]))
  label((132, 95), [$f_("3dB")$], size: 7.5)
  label((7, 99), strong[b], size: 11)
})

