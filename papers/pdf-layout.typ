#let line-at(x, y, content, angle: 0deg) = {
  let run = text(top-edge: "baseline", bottom-edge: "baseline", content)
  place(top + left, dx: x, dy: y, rotate(angle, origin: top + left, run))
}

#let original-page(width, height, artwork, body) = {
  set page(width: width, height: height, margin: 0pt)
  block(width: width, height: height, clip: true)[
    #if artwork != none {
      let (picture, x, y) = artwork
      place(top + left, dx: x, dy: y, picture)
    }
    #body
  ]
}
