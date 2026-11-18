#import "@preview/cetz:0.5.3": canvas, draw
#let plateau-gain = canvas(length: 1mm, {
  import draw: *
  let y(gain) = 15 * calc.log(gain, base: 10)
  let x(duration) = duration * 0.88
  for tick in (1, 10, 100) {
    line((0, y(tick)), (94, y(tick)), stroke: rgb("#d9e2e8"))
    content((-2, y(tick)), str(tick), anchor: "east")
  }
  for tick in (20, 40, 60, 80, 100) {
    content((x(tick), -2), str(tick), anchor: "north")
  }
  line((0, 37), (0, 0), (94, 0))
  content((0, 41), [振幅增益（倍）], anchor: "west")
  content((47, -10), [低场平台时长（ns）])
  let samples = ((20, 5), (40, 13), (60, 32), (80, 78), (100, 175))
  for (duration, gain) in samples {
    circle((x(duration), y(gain)), radius: 0.85, fill: rgb("#166586"), stroke: none)
    content((x(duration), y(gain) + 2), str(gain), anchor: "south")
  }
})
