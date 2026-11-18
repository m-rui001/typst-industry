#import "coupling.typ": coupling
#set page(paper: "a4", margin: 23mm)
#set text(font: "Microsoft YaHei", size: 10pt, lang: "zh")
#set par(justify: true)
#align(center)[#text(size: 17pt, weight: "bold")[侧壁电极如何提高铌酸锂声学谐振器的耦合]]
#align(center)[#link("https://arxiv.org/abs/2601.18043v1")[Ni 与 Bhave · arXiv:2601.18043v1]]

= 摘要
FinLN 把厚铌酸锂刻成窄鳍，再把叉指电极布到侧壁。波长为 12 μm 的样品在约 310 MHz 的主谐振处给出约 430 的机械品质因数，有效机电耦合系数达 6.2%，约为同片平面声表面波参照器件的 1.8 倍。

= 三维结构与实验
作者在 5 μm 厚的 Z 切绝缘体上铌酸锂器件层上用深氩离子刻蚀定义鳍，再用掠角蒸发形成 Ti/Al 侧壁电极。窄鳍提供横向声约束，沿鳍排列的交替电极产生周期性电场并激励纵向振动。COMSOL 周期单元计算指出，增大鳍高宽比和缩短声波长有利于提高耦合。实验将鳍宽固定为 2 μm，从网络分析仪测得的导纳中用修正 Butterworth–Van Dyke 模型提取耦合系数。

#figure(coupling, caption: [三种 FinLN 波长及同片平面参照的实测拟合值。])

= 结果能说明什么
同片对照固定了薄膜厚度、晶向和叉指方向，支持三维结构与侧壁驱动组合能提升耦合。两项结构变化一起出现，分别贡献多少仍需独立对照。321 MHz 附近的更高表观品质因数与纵向泛音有关，评价器件应以约 310 MHz 的目标模态为准。论文给出了单谐振器的实测数据，滤波器级插损和跨片工艺一致性仍需器件测量。
