#import "magnetization.typ": magnetization
#set page(paper: "a4", margin: 23mm)
#set text(font: ("Microsoft YaHei", "Libertinus Serif"), lang: "zh", size: 10.5pt)
#set par(justify: true)
#title[钯掺杂拓宽 Fe₄N 薄膜的溅射生长窗口]
#link("https://arxiv.org/abs/2512.24208v1")[Meena 等 · arXiv:2512.24208v1]

= 相形成窗口

作者用直流磁控反应溅射制备 Fe₄N 薄膜，以 X 射线衍射判断是否出现杂相。在 673 K 下，未掺杂样品在氮气流量占比为 13% 时呈单相，12% 和 14% 分别出现 α-Fe 和 ε-Fe₃N。加入 5 at.% Pd 后，在固定 673 K 的气氛扫描中，Fe₄N 的生长范围扩展至 12–16%。固定气体占比为 13% 时，衬底温度可降至 473 K。两组扫描各固定了另一个变量，体现的是已测工艺点。

= 结构与磁性取舍

扩展 X 射线吸收精细结构（EXAFS）拟合支持 Pd 优先替代 Fe₄N 晶胞角位的 Fe。提高 Pd 含量会使晶格膨胀。在 13 和 24 at.% 样品的衍射图样中，作者还观察到 ε-Fe₃N 峰。5 at.% 样品的饱和磁化强度为 1,202 emu/cm³，约比未掺杂的 1,375 emu/cm³ 低 13%。

#figure(magnetization, caption: [原论文磁性章节报告的四种 Pd 含量下的饱和磁化强度。])

= 工艺意义

5 at.% Pd 的主要收益是降低制备温度并放宽气氛控制，同时保留较高磁化强度。评价该工艺是否适用于器件，还要结合目标磁化强度、杂相容限和实际沉积条件。论文测的是气体流量占比，对应的薄膜氮含量需要单独表征。
