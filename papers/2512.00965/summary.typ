#set page(paper: "a4", margin: 24mm)
#set text(font: ("Microsoft YaHei", "Libertinus Serif"), lang: "zh", size: 10.5pt)
#set par(justify: true)
#title[双频微波整流器中的匹配与谐波控制]
#link("https://arxiv.org/abs/2512.00965v1")[Xiao 等 · arXiv:2512.00965v1]

= 电路原理

肖特基二极管的非线性将射频输入转换成直流，同时产生谐波。作者分别布置双频匹配网络和双频谐波终端。前者在两个基频上改善输入匹配，后者控制各频段的二、三次谐波阻抗，以改变二极管端的电压和电流波形。直流通路滤波后向负载供电。

= 测量条件

样机在 2.45 GHz、200 Ω 负载下的峰值射频到直流转换效率为 74.9%，在 5.8 GHz、500 Ω 负载下为 61.9%。这两个峰值对应不同负载。若系统要求共用固定负载，或在两个频段同时供能，评价时需要看实际输入功率和负载下的效率。

#link("summary.md")[短评] · #link("main.typ")[英文全文]
