#import "@preview/cetz:0.5.3": canvas, draw
#set text(font: "Microsoft YaHei", lang: "zh")

#let workflow = canvas(length: 1mm, {
  import draw: *
  for (x, top, bottom) in (
    (21, [蒙特卡洛模板], [随调查条件调整]),
    (70, [负二项似然], [拟合全谱计数]),
    (119, [贝叶斯反演], [活度与可信区间]),
  ) {
    rect((x - 19, 0), (x + 19, 16), fill: rgb("#edf5f8"), stroke: none)
    content((x, 11), text(size: 9pt, weight: "bold", top))
    content((x, 5), text(size: 8pt, bottom))
  }
  content((45.5, 8), [$arrow.r$])
  content((94.5, 8), [$arrow.r$])
})
#workflow
