#import "nonlinearity.typ": nonlinearity
#set page(paper: "a4", margin: 23mm)
#set text(font: "Microsoft YaHei", size: 10pt, lang: "zh")
#set par(justify: true)
#align(center)[#text(size: 17pt, weight: "bold")[低温下导波声子的四波混频]]
#align(center)[#link("https://arxiv.org/abs/2601.12418v1")[Behera 等 · arXiv:2601.12418v1]]

= 摘要
在 500 nm 厚的 AlScN 薄膜与 4H-SiC 衬底组成的器件中，作者测量了 GHz 表面声波的连续波四波混频。由 295 K 冷却到 4 K 后，Rayleigh 和 Sezawa 模态的有效三阶非线性系数都上升。两种模态在同一器件中的差距达到数百倍，说明模态选择可以显著改变混频强度。

= 测量与结果
作者驱动邻近频率的声波，用输出边带估算混频效率，并独立测量传播损耗，以有效作用长度换算模态非线性。按单程模型，冷却使 Rayleigh 模态从 151 增至 573，Sezawa 模态从 0.30 增至 1.3，单位均为 mW⁻¹ mm⁻¹。Rayleigh 的应变能更集中在压电薄膜中，Sezawa 则有更多应变能进入 SiC。空间分布与测得的耦合差距相符。

#figure(nonlinearity, caption: [单程模型拟合的模态非线性系数。纵轴采用对数刻度。])

= 反射修正与解释边界
叉指换能器的残余反射会形成弱声学腔，抬高局部泵浦功率。按文中腔内增益模型修正后，Rayleigh 模态的低温增幅从约 3.8 倍降至约 2.4 倍。Sezawa 仍约为 4 倍，两种模态的强弱排序也保持一致。绕过器件的测量在同等输入功率下未观察到边带，支持混频信号来自器件。提取系数还随输入功率变化，因此这些数据宜用于比较测试条件下的有效非线性。若要确定材料本征三阶参数随温度的变化，还需进一步区分材料响应、模式分布和损耗。
