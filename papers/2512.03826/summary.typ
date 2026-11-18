#import "channels.typ": channels
#set page(paper:"a4",margin:24mm)
#set text(font:("Microsoft YaHei","Libertinus Serif"),lang:"zh",size:10.5pt)
#set par(justify:true,leading:.65em)
#title[VOXES 台式谱仪的双通道读出与透射改造]
#link("https://arxiv.org/abs/2512.03826v1")[Manti 等 · arXiv:2512.03826]

= 波长色散主通道

VOXES 采用 Von Hamos 几何，利用弯曲镶嵌晶体按布拉格条件选出不同能量的 X 射线，并把谱线投到位置灵敏探测器。样品、晶体与探测器的位置可随目标谱线调整。论文给出的工作范围为 5–20 keV，波长色散通道可获得低于 10 eV 的可调能量分辨率。实测发射谱展示了对数电子伏级化学位移的分辨能力。

#figure(channels,caption:[波长色散与能量色散通道的分工。])

= 通量监测与液体样品

新增的硅 PIN 探测器记录能量色散谱，可与波长色散谱同时采集。在 5.9 keV，论文给出的能量色散通道半高全宽为 125–140 eV。它适合监测通量和获取较宽的谱段，高分辨谱线分析则由晶体通道承担。液体样品架扩展了可测样品类型。

= 透射式吸收谱的进展

Y 形支架为光源从样品背面照射留出空间，使仪器可以切换到透射布局。论文展示了与实验室吸收谱测量兼容的机械结构，透射吸收谱仍在实施中。发射模式已测得的分辨率可作为设计参考，吸收模式的性能还取决于入射通量、透射强度归一化及样品厚度。
