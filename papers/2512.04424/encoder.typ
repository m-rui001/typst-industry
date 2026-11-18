#import "@preview/cetz:0.4.2": canvas, draw

#let encoder(width) = canvas(length: width / 292, {
  import draw: *
  let note(p, body, size: 10) = content(p, text(font: "Arial", size: width * size / 292, body))
  let ink = .36pt + rgb("#41413a")
  rect((0, 0), (292, 266), stroke: none)
  rect((33, 117), (268, 216), fill: rgb("#f8f8dc"), stroke: none)
  rect((33, 18), (268, 117), fill: rgb("#fae7bb"), stroke: none)
  line((151, 11), (151, 224), stroke: .22pt + luma(145))
  line((26, 117), (274, 117), stroke: .22pt + luma(145))
  note((151, 249), [Metagrating-based Encoder], size: 13)
  for (p, name) in (((156, 231), [0°]), ((22, 125), [−90°]), ((279, 125), [90°]), ((151, 2), [−180°])) {
    note(p, name)
  }
  for (y, w, fill, border) in (
    (142, 18, rgb("#e5db91"), rgb("#a99c61")),
    (81, 23, rgb("#c69708"), rgb("#976e17")),
  ) {
    for i in range(7) {
      let x = 47 + 31 * i
      line((x,y), (x+w,y), (x+w,y+3), (x+w*.75,y+3), (x+w*.75,y+6),
        (x+w*.5,y+6), (x+w*.5,y+9), (x,y+9), close: true, fill: fill, stroke: .25pt + border)
    }
  }
  circle((151, 117), radius: 3.3, fill: rgb("#77725f"), stroke: none)
  let arrow = line.with(stroke: ink, mark: (end: "stealth", fill: black))
  arrow((158,114),(171,105))
  note((190,105),[sensor],size: 9)
  arrow((220,160),(232,173))
  note((258,174),[Front layer],size: 9)
  arrow((85,77),(72,63))
  note((53,60),[Rear layer],size: 9)
  note((39,198),[Incident wave at \ unknown direction],size: 9)
  for offset in (0, 5, 10) {
    bezier((80+offset,188),(91+offset,205),(86+offset,188),(94+offset,198),stroke: ink)
  }
  arrow((86,205),(102,189))
})
