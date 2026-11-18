#import "@preview/cetz:0.4.2": canvas, draw

// Panel a follows the source flowchart. Panel b retains the source material map.
#let simulation-flow() = layout(size => {
  let unit = size.width / 1100
  let at(x, y) = (x, 440 - y)
  let diagram = canvas(length: unit, {
    import draw: *
    let edge = (paint: rgb("#172024"), thickness: 1.2 * unit)
    let pale-yellow = rgb("#eaf48b")
    let write(x, y, body, font-size: 13) = content(
      at(x, y),
      align(center, {
        set par(leading: 0.31em)
        text(font: "Arial", size: unit * font-size, body)
      }),
    )
    let step(x, y, body) = {
      rect(at(x - 56, y - 33.5), at(x + 56, y + 33.5), fill: pale-yellow, stroke: edge)
      write(x, y, body)
    }
    let endpoint(x, y, body, ink) = {
      circle(at(x, y), radius: (56, 33.5), fill: ink, stroke: edge)
      write(x, y, body, font-size: 16)
    }
    let arrow(points) = line(..points.map(p => at(..p)), stroke: (paint: black, thickness: 2.8 * unit), mark: (end: "triangle"))

    rect(at(0, 440), at(1100, 0), stroke: none)
    content(
      at(565.7, 438.8),
      image("material-panel.png", width: 533.2 * unit),
      anchor: "south-west",
    )
    rect(at(0.5, 0.5), at(1099.5, 439.5), stroke: (paint: black, thickness: unit))
    write(24, 24, [a)], font-size: 26)

    endpoint(63, 83.5, [START], rgb("#a7efa2"))
    step(63, 177, [Define System \ Geometry and Set \ Timestep])
    step(63, 270.5, [Define EM and \ Thermal Boundary \ Conditions and \ Initial Conditions])
    step(210.5, 270.5, [Calculate \ Temperature \ Dependent \ Material Properties])
    step(210.5, 177, [Calculate EM \ Frequency Domain \ Mode Profile])
    step(358.5, 177, [Calculate EM \ Power Loss Over \ Time Step])
    step(506.5, 177, [Calculate Change \ in Temperature \ From Heat Loss \ and Heat Transfer])
    line(
      at(506.5, 235), at(563, 270.5), at(506.5, 306), at(450, 270.5),
      close: true, fill: rgb("#8cb0ee"), stroke: edge,
    )
    write(506.5, 270.5, [Final \ Time \ Step?])
    endpoint(506.5, 365, [STOP], rgb("#ed6047"))

    for points in (
      ((63, 117), (63, 143)), ((63, 210.5), (63, 236.5)),
      ((119, 270.5), (154.5, 270.5)), ((210.5, 236.5), (210.5, 211)),
      ((266.5, 177), (302.5, 177)), ((414.5, 177), (450.5, 177)),
      ((506.5, 210.5), (506.5, 235)), ((450, 270.5), (266.5, 270.5)),
      ((506.5, 306), (506.5, 331.5)),
    ) {
      arrow(points)
    }
    write(433, 259, [NO], font-size: 15)
    write(536, 312, [YES], font-size: 15)
  })
  box(width: size.width, height: 440 * unit, place(top + left, diagram))
})
