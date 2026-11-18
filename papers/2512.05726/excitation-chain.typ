#import "@preview/cetz:0.5.3": canvas, draw

#let excitation-chain(width) = canvas(length: width / 410, {
  import draw: *
  let excitation = 1.35pt + rgb("#a66800")
  let trigger = 1.15pt + rgb("#ab322f")
  let optical = .75pt + rgb("#32658b")
  let device(x, y, w, label) = {
    rect((x, y), (x + w, y + 29), radius: 3, fill: rgb("#f4f7fa"), stroke: .65pt + rgb("#43566a"))
    content((x + w / 2, y + 14.5), text(size: width * 10 / 410, label))
  }
  let arrow(stroke, ..points) = line(..points, stroke: stroke, mark: (end: "stealth"))
  device(3, 26, 83, [5 Signal generator])
  device(105, 26, 79, [6 Power amplifier])
  device(203, 26, 91, [7 Matching transformer])
  device(313, 26, 94, [1 Tube transducer])
  device(116, 82, 88, [4 High-speed camera])
  device(256, 82, 151, [2 Ring light / 3 Laser illumination])
  arrow(excitation, (86, 40), (104, 40))
  arrow(excitation, (184, 40), (202, 40))
  arrow(excitation, (294, 40), (312, 40))
  arrow(trigger, (44, 55), (44, 96), (115, 96))
  arrow(optical, (332, 82), (332, 56))
  line((4, 7), (19, 7), stroke: excitation)
  content((23, 7), text(size: width * 9 / 410)[Tube excitation], anchor: "west")
  line((117, 7), (132, 7), stroke: trigger)
  content((136, 7), text(size: width * 9 / 410)[Camera trigger], anchor: "west")
})
