#import "frequencies.typ": frequencies
#set page(paper: "a4", margin: 23mm)
#set text(font: ("Microsoft YaHei", "Libertinus Serif"), lang: "zh", size: 10.5pt)
#set par(justify: true)
#title[薄膜中 Néel 斯格明子对的螺旋运动和呼吸振荡]
#link("https://arxiv.org/abs/2512.21939v1")[Al Busaidi 等 · arXiv:2512.21939v1]

= 模型与轨迹

论文结合微磁模拟和 Thiele 方程，考察超薄铁磁膜中极性相同、手性相反的一对 Néel 斯格明子。在所研究的参数下，初始中心间距大于两倍半径时，二者的排斥驱动成对运动。陀螺力使速度具有切向分量，Gilbert 阻尼则改变切向和径向分量的比例。无阻尼时轨迹接近圆形。引入阻尼后，角速度下降，向外漂移更明显。

= 两种时间尺度

无阻尼算例的面外磁化信号含有约 3.2 GHz 的快振荡和约 4 MHz 的慢调制。前者来自单个斯格明子半径的周期变化，后者来自斯格明子对的轨道运动。阻尼系数取 0.001 时，快振荡约在 30 ns 后衰减至难以分辨，较慢的信号在模拟时段内仍可辨认。

#figure(frequencies, caption: [原文图 5 对应的无阻尼算例。])

= 解释与范围

Thiele 方程解释了排斥如何转化为转动和径向漂移。微磁模拟还解析了内部半径变化。频率与衰减时间来自特定薄膜参数和初始构型，比较其他材料时需要重新考虑尺寸、间距和阻尼。
