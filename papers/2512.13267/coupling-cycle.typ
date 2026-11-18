#import "@preview/cetz:0.5.3": canvas, draw

#let coupling-cycle(width) = canvas(length: width / 400, {
  import draw: *
  let label(p, body, size: 10) = content(p, text(size: width * size / 400, body))
  let box(a, b, fill) = rect(a, b, fill: fill, radius: 4, stroke: .6pt + luma(95))
  box((90, 97), (310, 139), rgb("#e0eef8"))
  box((90, 7), (310, 49), rgb("#ebf3e2"))
  label((200, 126), [Macroscopic SPH], size: 13)
  label((200, 111), [Advance #emph[M] steps and compute local velocity gradients])
  label((200, 36), [Microscopic DPD/FENE], size: 13)
  label((200, 21), [Apply the local flow, integrate #emph[K] steps, and sample stress])
  let down = .85pt + rgb("#286795")
  let up = .85pt + rgb("#4b7635")
  line((117, 97), (117, 50), stroke: down, mark: (end: "stealth"))
  line((283, 49), (283, 96), stroke: up, mark: (end: "stealth"))
  label((63, 79), [$nabla bold(v)$])
  label((63, 64), [MPI_Bcast])
  label((342, 79), [Mean stress])
  label((342, 64), [MPI_Send])
  label((200, 74), [Repeat until the final macro step])
})
