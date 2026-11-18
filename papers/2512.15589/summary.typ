#import "entropy-bars.typ": entropy-bars
#set document(title: "稀土铟化物能覆盖哪些低温制冷温区")
#set page(paper: "a4", margin: (x: 25mm, y: 22mm))
#set text(font: ("Microsoft YaHei", "Libertinus Serif"), lang: "zh", size: 10.5pt)
#set par(justify: true, leading: .73em)

#title[稀土铟化物能覆盖哪些低温制冷温区]
#link("https://arxiv.org/abs/2512.15589v1")[Biswas 等 · arXiv:2512.15589v1]

= 相变为什么值得关注

磁制冷依靠外加磁场改变材料的熵，绝热条件下还可观察到样品温度变化。Biswas 等梳理了稀土铟化物 R₂In 的晶体结构、磁相变和磁热数据。Eu₂In、Pr₂In 和 Nd₂In 在各自转变温区出现一阶磁相变，热滞回很小。Eu₂In 是其中的例子，转变附近有约 1.4 kJ/kg 潜热，升温跨过转变时晶胞体积约增加 0.1%，仍保持正交结构。对需要反复加、退磁的循环，较小的滞回有望减少损失。

= 在同一个磁场变化下比较

综述汇总的结果显示，在 20 kOe（对应 $mu_0 Delta H$ 约 2 T）的磁场变化下，Eu₂In 在约 55 K 的峰值熵变幅度为 28.2 J·kg⁻¹·K⁻¹，绝热温变约 5.0 K。Pr₂In 在约 57 K 的熵变峰值约为 15 J·kg⁻¹·K⁻¹，Nd₂In 在约 110 K 的峰值约为 13 J·kg⁻¹·K⁻¹。Eu₂In 的数值来自量热分析，Nd₂In 的数值根据不同磁场下的磁化数据推算。即使磁场跨度相同，峰值依然来自不同温区和测量方法。
#figure(entropy-bars(110mm), caption: [三种材料在 20 kOe 磁场变化下的峰值熵变幅度，数值取自综述。])

= 从峰值到实际工作区间

Pr₂₋ₓNdₓIn 的相变温度可随组成在约 55–110 K 调整。中间组成 PrNdIn 在 20 kOe 下的峰值熵变幅度约为 10 J·kg⁻¹·K⁻¹，展示了改变工作温区时峰值也会随之变化。选材还要看目标温区内的熵变曲线宽度和绝热温变，以及在实际循环中能传给换热介质多少热量。综述中的数据可以用于初步筛选材料，整机制冷量仍需结合循环条件和蓄冷床测试确定。
