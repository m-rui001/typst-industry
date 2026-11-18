#import "@preview/cetz:0.4.2": canvas, draw

#let fit-flow() = canvas(length: 0.7cm, {
  import draw: *
  let ink = rgb("#071855")
  let panel(x, width, heading, lines) = {
    rect((x, 1.80), (x + width, 3.90), radius: .23,
      stroke: 0.9pt + ink, fill: rgb("#f1f6fc"))
    content((x + width / 2, 4.59), text(9pt, weight: "bold", fill: ink, heading))
    content((x + width / 2, 2.85), align(center, {
      set par(leading: .28em)
      text(7.75pt, lines)
    }))
  }
  let arrow(..points) = line(..points, stroke: 1.55pt + ink, mark: (end: ">"))
  panel(1, 4.72, [Long Sample Data], [Fit for iteration \# $epsilon$ \ Known $x_(u_1), x_(u_2)$])
  panel(8.83, 4.69, [Short Sample Data], [
    Fit for iteration \# $x_(u_1), x_(u_2)$ \ Known $epsilon$ (initially $epsilon = 0-1$)
  ])
  panel(16.61, 4.18, [Real Thermal Properties], [Determined $x_(u_1), x_(u_2), epsilon$])
  arrow((5.82, 2.86), (8.74, 2.86))
  arrow((13.62, 2.86), (16.53, 2.86))
  arrow((11.15, 1.80), (11.15, .22), (3.25, .22), (3.25, 1.74))
  content((7.21, 3.42), text(7.25pt)[Determined $epsilon$])
  content((15.03, 3.42), text(7.25pt)[Convergence])
})
