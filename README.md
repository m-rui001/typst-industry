# Typst Industry

arXiv 应用物理论文的中文评读和 Typst 排版项目。评读沿着原文的推理链，保留关键实验条件和数据，并讨论结论可以用到哪里。

本仓库收录本地已有的 Typst 正文、补充材料、中文评读和图形源码。原文链接指向 arXiv。部分正文和图形需要另行取得所引用的原图、参考文献库或数据文件。仓库的 MIT 许可证适用于项目原创代码，第三方论文内容及素材适用原授权。

- [年度候选目录](papers/arxiv-applied-physics-2025-11-to-2026-11.json)收录 2,665 条 arXiv 应用物理分类记录，含交叉投稿。
- [日期核验目录](papers/arxiv-applied-physics-verified.json)按首次提交日期筛选，目标区间为 2025-11-17 至 2026-11-17 UTC。目录内含当前核验进度。
- 在 `papers` 目录中运行 `python fetch-sources.py --verified-pending --limit 100` 可以分批下载已通过日期核验的论文源码。采集脚本需要 `requests`。
- 用 `typst compile papers/2511.21528/summary.typ` 编译该篇中文总结。字体由各篇源码指定，编译时需要相应字体。

## 论文与 Typst 源码

| 论文 | 正文和补充材料 | 中文评读 | 图形与其他源码 |
| --- | --- | --- | --- |
| [声表面波隔离栅极驱动](https://arxiv.org/abs/2511.13412) | arXiv 上传件为 PDF，未转换全文 | [`summary.typ`](papers/2511.13412/summary.typ) ? [PDF](papers/2511.13412/summary.pdf) | — |
| [双磁控管微波功率合成](https://arxiv.org/abs/2511.13516) | arXiv 上传件为 PDF，未转换全文 | [`summary.typ`](papers/2511.13516/summary.typ) ? [PDF](papers/2511.13516/summary.pdf) | — |
| [用振动读出机械结构存储的图案](https://arxiv.org/abs/2511.13543) | arXiv 上传件为 PDF，未转换全文 | [`summary.typ`](papers/2511.13543/summary.typ) ? [PDF](papers/2511.13543/summary.pdf) | — |
| [显微 FTIR 的红外发射定标](https://arxiv.org/abs/2511.13577) | [`main.typ`](papers/2511.13577/main.typ) | [`summary.typ`](papers/2511.13577/summary.typ) ? [PDF](papers/2511.13577/summary.pdf) | [`heater-data.typ`](papers/2511.13577/heater-data.typ) · [`heater-plot.typ`](papers/2511.13577/heater-plot.typ) |
| [磁振子极化激元的超快传播](https://arxiv.org/abs/2511.13636) | [`main.typ`](papers/2511.13636/main.typ) | [`summary.typ`](papers/2511.13636/summary.typ) ? [PDF](papers/2511.13636/summary.pdf) | [`excitation-chain.typ`](papers/2511.13636/excitation-chain.typ) |
| [三步量子热机与魔角双层石墨烯](https://arxiv.org/abs/2511.13652) | [`main.typ`](papers/2511.13652/main.typ) | [`summary.typ`](papers/2511.13652/summary.typ) ? [PDF](papers/2511.13652/summary.pdf) | [`cycle-diagram.typ`](papers/2511.13652/cycle-diagram.typ) |
| [STEM 二次电子形貌衬度](https://arxiv.org/abs/2511.14491) | [`main.typ`](papers/2511.14491/main.typ) | [`summary.typ`](papers/2511.14491/summary.typ) ? [PDF](papers/2511.14491/summary.pdf) | [`secant-plot.typ`](papers/2511.14491/secant-plot.typ) · [`thickness-plot.typ`](papers/2511.14491/thickness-plot.typ) |
| [用传输线谐振器测反应性负载](https://arxiv.org/abs/2511.14621) | [`main.typ`](papers/2511.14621/main.typ) | [`summary.typ`](papers/2511.14621/summary.typ) ? [PDF](papers/2511.14621/summary.pdf) | [`loss-schematic.typ`](papers/2511.14621/loss-schematic.typ) |
| [光遗传实验用的 3D 打印微型波导](https://arxiv.org/abs/2511.15420) | [`main.typ`](papers/2511.15420/main.typ) · [`supplement.typ`](papers/2511.15420/supplement.typ) | [`summary.typ`](papers/2511.15420/summary.typ) ? [PDF](papers/2511.15420/summary.pdf) | [`led-circuit.typ`](papers/2511.15420/led-circuit.typ) |
| [用铁电极化改变超薄 NiO 的反铁磁响应](https://arxiv.org/abs/2511.15754) | [`main.typ`](papers/2511.15754/main.typ) · [`supplement.typ`](papers/2511.15754/supplement.typ) | [`summary.typ`](papers/2511.15754/summary.typ) ? [PDF](papers/2511.15754/summary.pdf) | [`device.typ`](papers/2511.15754/device.typ) |
| [矩形波导馈电超表面的近场整形](https://arxiv.org/abs/2511.16001) | [`main.typ`](papers/2511.16001/main.typ) | [`summary.typ`](papers/2511.16001/summary.typ) ? [PDF](papers/2511.16001/summary.pdf) | [`waveguide.typ`](papers/2511.16001/waveguide.typ) |
| [磁共振力显微镜的膜式探头与扫描](https://arxiv.org/abs/2511.17192) | [`main.typ`](papers/2511.17192/main.typ) | [`summary.typ`](papers/2511.17192/summary.typ) ? [PDF](papers/2511.17192/summary.pdf) | [`resonator-geometries.typ`](papers/2511.17192/resonator-geometries.typ) |
| [集材机在崎岖地形里的多传感器数据](https://arxiv.org/abs/2511.17318) | [`main.typ`](papers/2511.17318/main.typ) | [`summary.typ`](papers/2511.17318/summary.typ) ? [PDF](papers/2511.17318/summary.pdf) | — |
| [开孔铝板声学波导的被动逻辑门](https://arxiv.org/abs/2511.17949) | [`main.typ`](papers/2511.17949/main.typ) | [`summary.typ`](papers/2511.17949/summary.typ) ? [PDF](papers/2511.17949/summary.pdf) | — |
| [PMMA 玻璃态黏弹性](https://arxiv.org/abs/2511.18406) | [`main.typ`](papers/2511.18406/main.typ) | [`summary.typ`](papers/2511.18406/summary.typ) ? [PDF](papers/2511.18406/summary.pdf) | — |
| [十个频点的太赫兹材料识别](https://arxiv.org/abs/2511.18572) | [`main.typ`](papers/2511.18572/main.typ) | [`summary.typ`](papers/2511.18572/summary.typ) ? [PDF](papers/2511.18572/summary.pdf) | [`thz-setup.typ`](papers/2511.18572/thz-setup.typ) |
| [机械臂显影与约瑟夫森结的一致性](https://arxiv.org/abs/2511.19432) | [`main.typ`](papers/2511.19432/main.typ) | [`summary.typ`](papers/2511.19432/summary.typ) ? [PDF](papers/2511.19432/summary.pdf) | — |
| [用超算模拟博洛尼亚建筑能耗](https://arxiv.org/abs/2511.19463) | [`main.typ`](papers/2511.19463/main.typ) | [`summary.typ`](papers/2511.19463/summary.typ) ? [PDF](papers/2511.19463/summary.pdf) | [`average-energy.typ`](papers/2511.19463/average-energy.typ) |
| [Techno economic feasibility study of solar ORC in India](https://arxiv.org/abs/2511.19564) | [`main.typ`](papers/2511.19564/main.typ)（草稿） | — | — |
| [给铷光学频标加一道光功率补偿](https://arxiv.org/abs/2511.19702) | [`main.typ`](papers/2511.19702/main.typ) · [`supplement.typ`](papers/2511.19702/supplement.typ) | [`summary.typ`](papers/2511.19702/summary.typ) ? [PDF](papers/2511.19702/summary.pdf) | [`feedback.typ`](papers/2511.19702/feedback.typ) |
| [平面约瑟夫森结的传感和电路应用](https://arxiv.org/abs/2511.20424) | [`main.typ`](papers/2511.20424/main.typ) | [`summary.typ`](papers/2511.20424/summary.typ) ? [PDF](papers/2511.20424/summary.pdf) | [`junction-geometry.typ`](papers/2511.20424/junction-geometry.typ) |
| [高纯锗减薄后的霍尔迁移率](https://arxiv.org/abs/2511.20842) | [`main.typ`](papers/2511.20842/main.typ) | [`summary.typ`](papers/2511.20842/summary.typ) ? [PDF](papers/2511.20842/summary.pdf) | [`hall-geometry.typ`](papers/2511.20842/hall-geometry.typ) |
| [钨锗纳米线的中红外单光子探测](https://arxiv.org/abs/2511.20868) | [`main.typ`](papers/2511.20868/main.typ) | [`summary.typ`](papers/2511.20868/summary.typ) ? [PDF](papers/2511.20868/summary.pdf) | [`measurement-setup.typ`](papers/2511.20868/measurement-setup.typ) |
| [声学神经网络的设计与仿真](https://arxiv.org/abs/2511.21313) | [`main.typ`](papers/2511.21313/main.typ) | [`summary.typ`](papers/2511.21313/summary.typ) ? [PDF](papers/2511.21313/summary.pdf) | [`acoustic-network.typ`](papers/2511.21313/acoustic-network.typ) |
| [双光子聚合制造微流控薄膜](https://arxiv.org/abs/2511.21330) | arXiv 上传件为 PDF，未转换全文 | [`summary.typ`](papers/2511.21330/summary.typ) ? [PDF](papers/2511.21330/summary.pdf) | — |
| [瑞利波驱动可变形颗粒](https://arxiv.org/abs/2511.21528) | [`main.typ`](papers/2511.21528/main.typ) | [`summary.typ`](papers/2511.21528/summary.typ) ? [PDF](papers/2511.21528/summary.pdf) | [`contact-geometry.typ`](papers/2511.21528/contact-geometry.typ) |
| [太阳电池的热机械模型](https://arxiv.org/abs/2511.21554) | [`main.typ`](papers/2511.21554/main.typ) | [`summary.typ`](papers/2511.21554/summary.typ) ? [PDF](papers/2511.21554/summary.pdf) | [`photon-work.typ`](papers/2511.21554/photon-work.typ) |
| [用光子晶体读出热成像像素的温度](https://arxiv.org/abs/2511.22006) | [`main.typ`](papers/2511.22006/main.typ) · [`supplement.typ`](papers/2511.22006/supplement.typ) | [`summary.typ`](papers/2511.22006/summary.typ) ? [PDF](papers/2511.22006/summary.pdf) | [`bandwidth.typ`](papers/2511.22006/bandwidth.typ) |
| [编织圆柱受压时，哪一根条带先失稳](https://arxiv.org/abs/2512.01118) | [`main.typ`](papers/2512.01118/main.typ) | [`summary.typ`](papers/2512.01118/summary.typ) ? [PDF](papers/2512.01118/summary.pdf) | [`cross-section.typ`](papers/2512.01118/cross-section.typ) |
| [光滑壁与微肋条交界处的湍流恢复](https://arxiv.org/abs/2512.02034) | [`main.typ`](papers/2512.02034/main.typ) | [`summary.typ`](papers/2512.02034/summary.typ) ? [PDF](papers/2512.02034/summary.pdf) | [`recovery-plot.typ`](papers/2512.02034/recovery-plot.typ) |
| [微肋条对湍流边界层分离的影响](https://arxiv.org/abs/2512.02035) | [`main.typ`](papers/2512.02035/main.typ) | [`summary.typ`](papers/2512.02035/summary.typ) ? [PDF](papers/2512.02035/summary.pdf) | [`riblet-geometry.typ`](papers/2512.02035/riblet-geometry.typ) |
| [碳化硅功率 MOSFET 的栅漏电](https://arxiv.org/abs/2512.02604) | [`main.typ`](papers/2512.02604/main.typ) | [`summary.typ`](papers/2512.02604/summary.typ) ? [PDF](papers/2512.02604/summary.pdf) | [`mos-capacitor.typ`](papers/2512.02604/mos-capacitor.typ) |
| [用风驱动蒸发给浓缩尾矿浆脱水](https://arxiv.org/abs/2512.02939) | [`main.typ`](papers/2512.02939/main.typ) | [`summary.typ`](papers/2512.02939/summary.typ) ? [PDF](papers/2512.02939/summary.pdf) | [`wind-tunnel.typ`](papers/2512.02939/wind-tunnel.typ) |
| [用单麦克风辨别声源方向](https://arxiv.org/abs/2512.04424) | [`main.typ`](papers/2512.04424/main.typ) | [`summary.typ`](papers/2512.04424/summary.typ) ? [PDF](papers/2512.04424/summary.pdf) | [`encoder.typ`](papers/2512.04424/encoder.typ) |
| [微波谐振器的调频读出](https://arxiv.org/abs/2512.06289) | [`main.typ`](papers/2512.06289/main.typ) | [`summary.typ`](papers/2512.06289/summary.typ) ? [PDF](papers/2512.06289/summary.pdf) | [`pdh-observable.typ`](papers/2512.06289/pdh-observable.typ) |
| [自旋波环形振荡器的注入锁定](https://arxiv.org/abs/2512.08796) | [`main.typ`](papers/2512.08796/main.typ) | [`summary.typ`](papers/2512.08796/summary.typ) ? [PDF](papers/2512.08796/summary.pdf) | [`injection-phasors.typ`](papers/2512.08796/injection-phasors.typ) |
| [多端约瑟夫森结的悬空掩模光刻](https://arxiv.org/abs/2512.16690) | [`main.typ`](papers/2512.16690/main.typ) | [`summary.typ`](papers/2512.16690/summary.typ) ? [PDF](papers/2512.16690/summary.pdf) | — |
| [PEM 电解槽的低铂钛铌氧涂层](https://arxiv.org/abs/2512.17721) | [`main.typ`](papers/2512.17721/main.typ) | [`summary.typ`](papers/2512.17721/summary.typ) ? [PDF](papers/2512.17721/summary.pdf) | [`contact-resistance.typ`](papers/2512.17721/contact-resistance.typ) |
| [一根悬空铂丝，怎样在空气里测热物性](https://arxiv.org/abs/2512.18591) | [`main.typ`](papers/2512.18591/main.typ) | [`summary.typ`](papers/2512.18591/summary.typ) ? [PDF](papers/2512.18591/summary.pdf) | [`references.typ`](papers/2512.18591/references.typ) · [`setup.typ`](papers/2512.18591/setup.typ) |
| [二维刷毛模型如何描述滚动接触](https://arxiv.org/abs/2601.06811) | [`main.typ`](papers/2601.06811/main.typ) | [`summary.typ`](papers/2601.06811/summary.typ) ? [PDF](papers/2601.06811/summary.pdf) | [`bristle-forces.typ`](papers/2601.06811/bristle-forces.typ) |
| [滚动接触的二维黏弹性摩擦模型](https://arxiv.org/abs/2601.13818) | [`main.typ`](papers/2601.13818/main.typ) | [`summary.typ`](papers/2601.13818/summary.typ) ? [PDF](papers/2601.13818/summary.pdf) | [`rheology.typ`](papers/2601.13818/rheology.typ) |
| [用打印模具吹塑复杂薄壁件](https://arxiv.org/abs/2603.00111) | [`main.typ`](papers/2603.00111/main.typ) | [`summary.typ`](papers/2603.00111/summary.typ) ? [PDF](papers/2603.00111/summary.pdf) | — |
| [金属增材制造的匙孔声学监测](https://arxiv.org/abs/2603.00789) | arXiv 上传件为 PDF，未转换全文 | [`summary.typ`](papers/2603.00789/summary.typ) ? [PDF](papers/2603.00789/summary.pdf) | — |
| [表面粗糙度与摩擦电发电](https://arxiv.org/abs/2604.01119) | [`main.typ`](papers/2604.01119/main.typ) | [`summary.typ`](papers/2604.01119/summary.typ) ? [PDF](papers/2604.01119/summary.pdf) | [`circuit.typ`](papers/2604.01119/circuit.typ) |
| [金属增材制造的温度场预测](https://arxiv.org/abs/2604.14562) | [`main.typ`](papers/2604.14562/main.typ) | [`summary.typ`](papers/2604.14562/summary.typ) ? [PDF](papers/2604.14562/summary.pdf) | [`layout.typ`](papers/2604.14562/layout.typ) · [`scaling.typ`](papers/2604.14562/scaling.typ) |
| [焊接板材的散热](https://arxiv.org/abs/2604.21250) | [`main.typ`](papers/2604.21250/main.typ) | [`summary.typ`](papers/2604.21250/summary.typ) ? [PDF](papers/2604.21250/summary.pdf) | [`slab.typ`](papers/2604.21250/slab.typ) |
| [复材夹层的光热断层成像](https://arxiv.org/abs/2605.03747) | [`main.typ`](papers/2605.03747/main.typ) | [`summary.typ`](papers/2605.03747/summary.typ) ? [PDF](papers/2605.03747/summary.pdf) | — |
| [气压弯曲晶圆的低畸变键合](https://arxiv.org/abs/2606.04625) | arXiv 上传件为 PDF，未转换全文 | [`summary.typ`](papers/2606.04625/summary.typ) ? [PDF](papers/2606.04625/summary.pdf) | — |
| [4H-SiC 飞秒激光切片](https://arxiv.org/abs/2608.03814) | [`main.typ`](papers/2608.03814/main.typ) | [`summary.typ`](papers/2608.03814/summary.typ) ? [PDF](papers/2608.03814/summary.pdf) | [`focusing.typ`](papers/2608.03814/focusing.typ) · [`layout.typ`](papers/2608.03814/layout.typ) |
| [氮化硅微环倍频的频率精度](https://arxiv.org/abs/2608.04555) | [`main.typ`](papers/2608.04555/main.typ) · [`supplement.typ`](papers/2608.04555/supplement.typ) | [`summary.typ`](papers/2608.04555/summary.typ) ? [PDF](papers/2608.04555/summary.pdf) | — |
| [硅与可伐合金的激光焊接](https://arxiv.org/abs/2608.28423) | [`main.typ`](papers/2608.28423/main.typ) | [`summary.typ`](papers/2608.28423/summary.typ) ? [PDF](papers/2608.28423/summary.pdf) | [`layout.typ`](papers/2608.28423/layout.typ) |
| [粉末微波体积增材制造](https://arxiv.org/abs/2610.00842) | [`main.typ`](papers/2610.00842/main.typ) · [`supplement.typ`](papers/2610.00842/supplement.typ) | [`summary.typ`](papers/2610.00842/summary.typ) ? [PDF](papers/2610.00842/summary.pdf) | [`flow.typ`](papers/2610.00842/flow.typ) · [`layout.typ`](papers/2610.00842/layout.typ) |
| [细纤维瞬态电热测量](https://arxiv.org/abs/2610.03933) | [`main.typ`](papers/2610.03933/main.typ) | [`summary.typ`](papers/2610.03933/summary.typ) ? [PDF](papers/2610.03933/summary.pdf) | [`flow.typ`](papers/2610.03933/flow.typ) · [`layout.typ`](papers/2610.03933/layout.typ) |
| [镜片无接触面形测量](https://arxiv.org/abs/2610.17515) | [`main.typ`](papers/2610.17515/main.typ) · [`supplement.typ`](papers/2610.17515/supplement.typ) | [`summary.typ`](papers/2610.17515/summary.typ) ? [PDF](papers/2610.17515/summary.pdf) | [`layout.typ`](papers/2610.17515/layout.typ) · [`positions.typ`](papers/2610.17515/positions.typ) |
| [无光刻铌酸锂厚度剪切谐振器](https://arxiv.org/abs/2611.00889) | arXiv 上传件为 PDF，未转换全文 | [`summary.typ`](papers/2611.00889/summary.typ) ? [PDF](papers/2611.00889/summary.pdf) | — |
| [用反应文件模拟刻蚀与沉积](https://arxiv.org/abs/2611.03707) | [`main.typ`](papers/2611.03707/main.typ) | [`summary.typ`](papers/2611.03707/summary.typ) ? [PDF](papers/2611.03707/summary.pdf) | [`diagrams.typ`](papers/2611.03707/diagrams.typ) |
| [界面自组织制造复杂结构](https://arxiv.org/abs/2611.09950) | [`main.typ`](papers/2611.09950/main.typ) | [`summary.typ`](papers/2611.09950/summary.typ) ? [PDF](papers/2611.09950/summary.pdf) | — |
| [嵌入式微流道的芯片冷却模拟](https://arxiv.org/abs/2611.10666) | [`main.typ`](papers/2611.10666/main.typ) | [`summary.typ`](papers/2611.10666/summary.typ) ? [PDF](papers/2611.10666/summary.pdf) | [`breakeven.typ`](papers/2611.10666/breakeven.typ) |
| [增材制造陶瓷光学平台](https://arxiv.org/abs/2611.13800) | [`main.typ`](papers/2611.13800/main.typ) | [`summary.typ`](papers/2611.13800/summary.typ) ? [PDF](papers/2611.13800/summary.pdf) | — |
| [磁性畴壁蠕动](https://arxiv.org/abs/2611.20908) | [`main.typ`](papers/2611.20908/main.typ) · [`supplement.typ`](papers/2611.20908/supplement.typ) | [`summary.typ`](papers/2611.20908/summary.typ) ? [PDF](papers/2611.20908/summary.pdf) | [`bubble.typ`](papers/2611.20908/bubble.typ) · [`dmi-plot.typ`](papers/2611.20908/dmi-plot.typ) · [`layout.typ`](papers/2611.20908/layout.typ) |
| [混合键合界面的热学与声学测量](https://arxiv.org/abs/2611.22694) | 未转换全文 | [`summary.typ`](papers/2611.22694/summary.typ) ? [PDF](papers/2611.22694/summary.pdf) | — |
