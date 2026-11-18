#import "architecture.typ": architecture
#set page(paper:"a4", margin:24mm)
#set text(font:("Microsoft YaHei","Libertinus Serif"), lang:"zh", size:10.5pt)
#set par(justify:true, leading:.65em)
#title[可训练频率如何帮助物理信息网络解析畴壁]
#link("https://arxiv.org/abs/2512.03290v1")[Chrisnanto 等 · arXiv:2512.03290]

= 方法

一维复 Ginzburg–Landau 方程的解包含平滑区域和高梯度畴壁。普通多层感知机往往优先拟合低频分量。作者在输入层用正弦和余弦变换时空坐标，将频率矩阵与后续网络权重联合训练。训练目标包含方程残差以及初始和边界条件误差。

#figure(architecture(labels: ([时空坐标],[可训练傅里叶特征],[感知机],[预测解],[方程与边初值损失],[优化器])),caption:[预测解用于计算损失，优化器更新频率矩阵与网络权重。])

= 数值结果

作者以高分辨率数值解作参考。标准 PINN 基线产生了非物理振荡，ASPEN 则复现了畴壁的位置和自由能快速弛豫的趋势。方程残差的中位数为 $5.10 times 10^(-3)$，终止时刻的畴壁位置误差约为 0.11。残差在空间上分布不均，较大的值集中在边界附近，因此还需结合残差分布判断局部精度。

= 适用范围

本文验证的是一个一维算例。结果支持可训练频率对这个基线的改进。若要判断收益来自傅里叶映射本身还是训练过程中对频率的调整，可以进一步比较固定频率映射，并在同一误差水平下记录训练成本和传统求解器的运行时间。
