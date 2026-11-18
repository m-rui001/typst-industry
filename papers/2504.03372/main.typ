// LaTeX to Typst adaptation of arXiv:2504.03372v1 by Basaran et al.
// https://arxiv.org/abs/2504.03372v1
// Original paper and figures licensed CC BY 4.0: https://creativecommons.org/licenses/by/4.0/
#set page(paper: "a4", margin: 20mm)
#set text(size: 10pt, lang: "en")
#set par(justify: true)
#set heading(numbering: "1.1")
#set math.equation(numbering: "(1)")
#set table(inset: 3pt, stroke: (y: 0.25pt + luma(215)))
#show figure.where(kind: table): set figure.caption(position: top)
#title[Optimal Sizing and Material Choice for Additively Manufactured Compact Plate Heat Exchangers]
#align(center)[Mehmet Basaran (1, 3), Frederik Rogiers (2), Martine Baelmans (2, 3), Maarten Blommaert (1, 3)]
#align(center)[#text(size: 8pt)[(1) KU Leuven, Department of Mechanical Engineering, Faculty of Engineering Technology, B-2440 Geel, Belgium]]
#align(center)[#text(size: 8pt)[(2) KU Leuven, Department of Mechanical Engineering, Division of Applied Mechanics and Energy Conversion (TME), B-3001 Leuven, Belgium]]
#align(center)[#text(size: 8pt)[(3) EnergyVille, Thor Park, B-3600 Genk, Belgium]]
#align(center)[Correspondence: #link("mailto:mehmet.basaran@kuleuven.be")[#raw("mehmet.basaran@kuleuven.be")]]

*Abstract.* With advancements in additive manufacturing (AM) capabilities, new opportunities arise to design compact heat exchangers (cHEXs) that leverage AM's degrees of freedom (DOFs) to enhance energy and material efficiency. However, excessive size reduction in counterflow cHEXs can compromise effectiveness due to axial heat conduction through the solid material, which is strongly influenced by thermal conductivity and wall thickness. This study investigates how AM material selection and related limitations in AM thin-wall production might compromise the core size of counterflow plate heat exchangers when targeting maximum power density. An optimization framework evaluates maximum power densities for six materials, i.e., plastic, austenitic steel, Al#sub[2]O#sub[3], AlN, aluminum, and copper. The evaluations are conducted under constant effectiveness and pressure drop while accounting for AM-specific plate thickness limitations and a lower bound on plate spacing to address fouling concerns. Across all scenarios, copper cHEXs exhibit the lowest maximum power density, despite their high thermal conductivity. Without constraints on plate thickness and spacing, the optimal plastic heat exchanger achieves a power density 1800 times greater than the steel baseline, while copper shows a decrease by a factor of 0.98. With an equal plate thickness of 0.5 mm for all materials, plastic retains the highest power density, achieving 12.2 times more than copper. Introducing a fouling constraint of 0.8 mm plate spacing shifts the optimal material to austenitic steel. When material-specific plate thicknesses are considered, the plastic cHEX achieves the highest power density, five times greater than copper, due to superior thin-wall resolution. This study highlights the significant impact of AM constraints on the energy and material efficiency of cHEXs. It also demonstrates that materials with lower thermal conductivity, such as plastic or austenitic steel, can outperform high-conductivity materials like copper in compact heat exchanger designs.

*Keywords.* Heat exchanger; counterflow; axial wall conduction; design optimization; additive manufacturing; manufacturing constraints.

= Introduction
<sec:introduction>
Heat exchangers are crucial components in various engineering fields, including the automobile and aerospace industries, microelectronics cooling, and energy conversion systems. Increasing demands for compact and lightweight solutions, particularly in mobile applications, have intensified the need for high-performance compact heat exchangers (cHEXs).

Producing cHEXs using conventional manufacturing (CM) poses significant challenges. CM methods, such as subtractive techniques and forming processes, often require the assembly of components through welding or brazing, making it difficult to achieve leak-proof designs. Additionally, CM's limitations in machining complex geometries further complicate the production of compact, high-performance heat exchangers~[#link(<ref-1>)[1]].

Additive manufacturing (AM) has emerged as a transformative technology for cHEX production, offering unparalleled freedom in design complexity and the ability to manufacture components in a single run~[#link(<ref-2>)[2], #link(<ref-3>)[3], #link(<ref-4>)[4]]. This capability reduces the risk of fluid leakage, minimizes material waste, and supports strength-critical designs~[#link(<ref-1>)[1], #link(<ref-5>)[5]]. These outstanding features have gathered significant interest among heat exchanger designers, driving ongoing efforts to develop lightweight cHEX using AM technology.

Despite AM's promise, axial heat conduction remains a critical issue in cHEX design. As heat exchanger volume decreases, axial conduction within the solid plate separating the fluids becomes more significant, reducing thermal effectiveness~[#link(<ref-6>)[6], #link(<ref-7>)[7], #link(<ref-8>)[8], #link(<ref-5>)[5]]. This phenomenon can dominate performance, potentially offsetting the benefits of AM-enabled design enhancements.

While extensive research exists on AM cHEXs and axial conduction effects, these topics are often addressed separately. Studies on AM processes frequently prioritize high thermal conductivity materials, such as aluminum and copper~[#link(<ref-4>)[4], #link(<ref-9>)[9]]. Conversely, research on axial wall conduction emphasizes that high thermal conductivity may negatively impact the thermal efficiency of cHEX~[#link(<ref-10>)[10], #link(<ref-11>)[11], #link(<ref-12>)[12]]. Additionally, thin plates are known to mitigate axial conduction~[#link(<ref-13>)[13]], but AM processes impose constraints on minimum achievable plate thickness compared to CM. A comprehensive evaluation of axial conduction in AM cHEXs, accounting for these limitations, remains unexplored.

Several studies have demonstrated the potential of AM in heat exchanger design. For instance, Saltzman et al.[#link(<ref-14>)[14]] compared conventionally manufactured plate-fin air-liquid crossflow heat exchangers with AM-produced counterparts, showing improvements in heat transfer performance but noting higher pressure drops due to AM surface roughness. Da Silva et al.[#link(<ref-15>)[15]] and Moon et al.~[#link(<ref-16>)[16]] further demonstrated the feasibility of AM for producing compact and efficient heat exchangers, highlighting its ability to fabricate geometries unattainable with CM. However, these studies do not fully address the interplay between material properties, axial conduction, and AM constraints.

For general (non-AM) cHEXs, axial conduction has been extensively studied theoretically~[#link(<ref-6>)[6], #link(<ref-17>)[17], #link(<ref-18>)[18], #link(<ref-19>)[19]], numerically~[#link(<ref-20>)[20], #link(<ref-21>)[21], #link(<ref-22>)[22], #link(<ref-23>)[23]], and experimentally~[#link(<ref-24>)[24], #link(<ref-25>)[25]]. Researchers have examined its effects on thermal performance under various conditions, emphasizing the importance of parameters such as thermal conductivity, plate thickness, and plate spacing~[#link(<ref-13>)[13], #link(<ref-26>)[26]]. Optimization studies, such as those by Rogiers and Baelmans~[#link(<ref-27>)[27]] and Buckinx et al.~[#link(<ref-28>)[28]], have further explored the effect of geometric parameters on the power density. These studies provide valuable insights but often assume ideal manufacturing conditions without considering AM-specific constraints.

In this paper, we investigate the influence of material thermal properties on the design of additively manufactured cHEX and evaluate the impact of axial wall conduction, considering the limitations of AM in producing thin walls. The goal is to achieve the minimum size of a heat exchanger without compromising on pressure drop and thermal effectiveness. When thermal power is fixed, achieving the minimum size corresponds to a maximal power density, which is thus defined as the design objective. The study simplifies the analysis by focusing on a parallel flat plate counterflow heat exchanger, using length and plate spacing as design variables and plate thickness as a design constraint. Unlike the typical heat exchanger design approach, where plate thickness and spacing are predetermined and sizing is adjusted to fit available space~[#link(<ref-29>)[29]], this alternative approach explores how plate thickness, spacing, and length can be chosen to optimize power density. In the optimizations, the constant pressure drop and effectiveness are first determined based on a baseline heat exchanger. Then, the maximal power density geometry is calculated considering AM constraints for six different materials. To address the risk for fouling in maximal power density designs, a minimum plate spacing constraint (“fouling constraint\") is introduced and its impact is studied. Furthermore, to examine the effect of effectiveness and plate thickness on power density, optimizations are repeated under various effectiveness and plate thickness conditions. Hence, this comprehensive evaluation discusses the impact of AM constraints on the design of cHEX manufactured with different materials.

The text is organized as follows: Section~@sec:methodology describes the model employed for assessing thermal performance. Section~@sec:results1 discusses unconstrained optimizations for minimizing size across different materials. Section~@sec:results2 revisits these optimizations, incorporating AM and fouling constraints. Section~@sec:results3 evaluates the effect of manufacturing resolution on optimal outcomes. Finally, Section~@sec:discussion presents a discussion of the results.

= Thermal model
<sec:methodology>
The present investigation is conducted on a simple parallel flat plate heat exchanger (PFPHE), as illustrated in Figure~@PFPHE_geo. The configuration comprises $2 n + 1$ flat, thin plates arranged in parallel, with each plate stacked on top of the preceding one. The plates have a thickness of $t$ and form $2 n$ fluid channels in a repeating sequence, alternating between cold and hot flows. The channels are of identical spacing $D$, length $L$, and width $W$. While this type of heat exchanger can be configured with various flow arrangements, including parallel flow, crossflow, and counterflow, only counterflow is considered in this investigation. Furthermore, this study assumes a perfectly balanced heat exchanger with equal mass flow rates, identical pressure drops, and uniform fluid properties on both the hot and cold sides.

#figure(image("graphics/figure1.png"),
  caption: [
    Counterflow parallel flat plate heat exchanger geometry with $n$ hot and $n$ cold side channels
  ]
)
<PFPHE_geo>

The goal of this study is to minimize the size of a parallel-plate counterflow heat exchanger without compromising pressure drop and thermal effectiveness. For a given thermal power, this implies maximizing thermal power density. This section provides a comprehensive description of the thermal-hydraulic model used to evaluate power density taking axial heat conduction into account.

In heat exchangers, power density $cal(D)$ refers to the heat transfer rate per unit volume:

$ cal(D) equiv frac(dot(q), H L W) = frac(epsilon dot(m) c_p Delta T, 2 n D \( 1 + t \/ D \) L W) \, $ <PD>

where $epsilon$ is the effectiveness, representing the ratio of the actual heat transfer rate to the maximum possible heat transfer rate~[#link(<ref-30>)[30]], $dot(m)$ is the mass flow rate, $c_p$ is the fluid specific heat at constant pressure, and $Delta T$ is the temperature difference between the hot and cold side inlets. Assuming a sufficiently large number of plates, the total height of the heat exchanger is approximated as $H = \( 2 n \) D + \( 2 n + 1 \) t approx 2 n D \( 1 + t \/ D \)$.

The mass flow rate $dot(m)$ at each side is expressed in terms of plate spacing $D$:

$ dot(m) = n rho V D W \, $ <mdot>

where $rho$ is the density, and $V$ is the bulk velocity. The pressure drop $Delta P$ relates to the bulk channel velocity $V$ through the equation

$ V = frac(2, f upright(R e) mu) frac(D^2 Delta P, L) \, $ <bulk_velocity>

where $f$ is the Fanning friction factor, $upright(R e)$ is the Reynolds number, and $mu$ is the dynamic viscosity. Upon substituting Eq.~@bulk_velocity into Eq~@mdot, the mass flow rate $dot(m)$ becomes

$ dot(m) = frac(2 n rho, f upright(R e) mu) frac(D^3 Delta P, L) W . $ <mdot2>

Subsequently, by substituting Eq.~@mdot2 into Eq.~@PD and performing some rearrangements, an analytical relation for a non-dimensional power density $Q^diamond.stroked.small$ is obtained:

$ Q^diamond.stroked.small equiv frac(cal(D) mu, c_p Delta T rho Delta P_(upright("ref"))) = psi frac(1, f upright(R e)) frac(1, 1 + t \/ D) epsilon (D / L)^2 \, $ <NPD>

where $psi$ represents the ratio of the actual pressure drop $Delta P$ to a reference pressure drop $Delta P_(upright("ref"))$. Throughout this work $Delta P_(upright("ref"))$ is set equal to the pressure drop of the initial design given in @use_case.

Kroeger~[#link(<ref-6>)[6]] derived an expression to calculate the effectiveness of a balanced counterflow heat exchanger by taking the axial heat conduction in the wall into account.

$ epsilon = 1 - frac(1, 1 + upright(N T U) \( 1 + upright(M) dot.op phi.alt \) \/ \( 1 + upright(M) dot.op upright(N T U) \)) \, $ <effectiveness>

with

$ phi.alt = sqrt(frac(upright(M) dot.op upright(N T U), 1 + upright(M) dot.op upright(N T U))) tanh upright(N T U) / sqrt(upright(M) dot.op upright(N T U) \/ \( 1 + upright(M) dot.op upright(N T U)) . $ <phi>

The number of transfer units $upright(N T U)$ is a dimensionless parameter that combines the dimensional terms of the overall heat transfer coefficient $U$, heat transfer surface area $A$, mass flow rate $dot(m)$, and specific heat $c_p$ into a single term~[#link(<ref-31>)[31]], i.e.~$upright(N T U) = frac(U A, dot(m) c_p)$. Meanwhile, the axial conduction parameter~$upright(M) = frac(U A_(a x), dot(m) c_p)$ addresses the effect of heat conduction along the heat exchanger wall~[#link(<ref-6>)[6], #link(<ref-20>)[20]], with $A_(a x)$ is the heat transfer surface area in the axial direction.

For the current PFPHE, the combination of hot and cold side convection and the lateral conduction gives $U A$ as:

$ U A = 2 n L W (2 / h + t / k_w)^(- 1) \, $ <UA>

where $h$ is the convective heat transfer coefficient, and $k_w$ is the thermal conductivity of the plate. The first term within the brackets accounts for the combined convective resistances of the hot and cold flow sides, while the second term addresses the lateral conduction resistance through the plate. By substituting the expression for the convective heat transfer coefficient $h = frac(upright(N u) k, 2 D)$, $U A$ is transformed into

$ U A = 2 n k L / D upright(N u) / 4 W (1 + upright(N u) / 4 k / k_w t / D)^(- 1) \, $ <UA2>

with $upright(N u)$ is the Nusselt number. The axial plate conductance per unit length $U A_(a x)$, which is used in the calculation of the axial conduction parameter $upright(M)$, is defined as

$ U A_(a x) = 2 n frac(k_w t, L) W . $ <UA_ax>

Rogiers and Baelmans~[#link(<ref-27>)[27]] formulated the number of transfer units $upright(N T U)$ and the axial conduction parameter $upright(M)$ as functions of the dimensionless Bejan number $upright(B e) = frac(Delta P L^2, mu alpha)$ and relative plate spacing $tilde(D) = D / L$. To this end, Eqs.~@mdot2 and~@UA2 are substituted into the $upright(N T U)$ definition, while Eqs.~@mdot2 and~@UA_ax are substituted into the $upright(M)$ definition:

$ upright(N T U) \( tilde(D) \, upright(B e) \) = frac(f upright(R e) upright(N u), 4) (1 + upright(N u) / 4 k / k_w t / D)^(- 1) tilde(D)^(- 4) upright(B e)^(- 1) \, $ <NTU>

$ upright(M) \( tilde(D) \, upright(B e) \) = f upright(R e) k_w / k t / D tilde(D)^(- 2) upright(B e)^(- 1) . $ <M>

As a result, by combining Eqs.~@NTU, @M, and Eq.~@effectiveness, the effectiveness $epsilon$ can be analytically expressed as a function of the Bejan number $upright(B e)$, which can be interpreted as the dimensionless plate length, and $tilde(D)$ as the dimensionless plate spacing.

Within the scope of this paper, only heat exchangers operating in the fully developed laminar flow regime are investigated. For a laminar channel flow between parallel planes, $f upright(R e)$=24~[#link(<ref-32>)[32]]. The flow is assumed to be a two-dimensional (2D) planar channel flow, and it is also assumed that the Nusselt number $upright(N u)$ is known prior to optimization. For a 2D planar channel flow subjected to constant surface heat flux, $upright(N u)$=8.235~[#link(<ref-32>)[32]].

= Material selection for maximal power density
<sec:results1>
A wide variety of materials prove suitable for the manufacture of heat exchangers, and the choice is typically driven by the requirements and operating conditions of the device. Stainless steel, for example, finds widespread applications in heat exchanger manufacturing due to its resistance to corrosion and high temperatures~[#link(<ref-33>)[33]]. Copper is often preferred in heat transfer applications due to its superior thermal conductivity~[#link(<ref-4>)[4]]. Aluminum stands out as a common choice due to its lightweight, excellent thermal conductivity, and affordability compared to other metals~[#link(<ref-34>)[34]]. Ceramic materials are increasingly considered advantageous for heat exchangers due to their temperature and corrosion resistance, outperforming traditional metallic variants~[#link(<ref-35>)[35]]. Beyond metals and ceramics, polymers also offer advantages in heat exchanger manufacturing, such as cost-effectiveness, lightweight construction, and resistance to corrosion and fouling~[#link(<ref-9>)[9]].

Considering this diversity, the current study investigates the effect of six different materials on the maximum power density. These materials are copper (with a thermal conductivity, $k_(upright("Cu")) = 398 med upright("W/m") dot.op upright("K")$), aluminum ($k_(upright("Al")) = 237 med upright("W/m") dot.op upright("K")$), aluminum nitride (AlN, $k_(upright("AlN")) = 180 med upright("W/m") dot.op upright("K")$), aluminum oxide (Al#sub[2]O#sub[3], $k_(upright(A l)_2 upright(O)_3) = 27 med upright("W/m") dot.op upright("K")$), austenitic steel ($k_(upright("A.st")) = 20 med upright("W/m") dot.op upright("K")$), and a typical plastic ($k_(upright("Pl")) = 0.2 med upright("W/m") dot.op upright("K")$).

First, we investigate the effect of different materials on the maximum power density at a given effectiveness, without accounting for manufacturing and fouling constraints. To achieve this, we formulate an optimization problem that investigates the maximal power density that can be achieved for each material as a function of the Bejan number $upright(B e)$, and the relative plate spacing $tilde(D)$. This optimization problem is defined as follows:

$ max_(tilde(D) in bb(R)_0^(+) \, thin upright(B e) in bb(R)_0^(+)) & #h(2em) Q^diamond.stroked.small (tilde(D) \, upright(B e)) \,\
upright("s.t.") & #h(2em) epsilon (tilde(D) \, upright(B e)) = epsilon_d \,\
 $<maxQ>

where $epsilon_d$ is the design effectiveness.

Rogiers and Baelmans~[#link(<ref-27>)[27]] demonstrated that the optimal Bejan number $upright(B e)_(o p t)$, which maximizes power density, also maximizes effectiveness when the relative plate thickness $t \/ D$ is kept constant in the optimization problem. Their method simplifies the original two-dimensional optimization problem into two sequential steps. In the first step, for a given relative plate spacing $tilde(D)$, the optimal Bejan number $upright(B e)^(*)$ is determined through the following one-dimensional unconstrained optimization problem:

$ upright(B e)^(*) = "arg max"_(upright(B e) in bb(R)_0^(+)) epsilon (tilde(D) \, upright(B e)) . $ <opt_Be>

This equation yields the Bejan number that maximizes effectiveness for the specified $tilde(D)$. However, this intermediate result does not fully solve the optimization problem, as the optimal relative plate spacing, $tilde(D)_(o p t)$, remains to be determined. In the second step, $tilde(D)_(o p t)$ is identified by ensuring that the corresponding maximum effectiveness meets the design requirement:

$ epsilon_(m a x) (tilde(D)) = epsilon_d . $ <eff_max>

The global optimal Bejan number is then obtained as $upright(B e)_(o p t) = upright(B e)^(*) \( tilde(D)_(o p t) \)$. The resulting optimal variables, $upright(B e)_(o p t)$ and $tilde(D)_(o p t)$, represent the Bejan number and relative plate spacing of the heat exchanger that achieves the maximum power density while satisfying the design effectiveness.

To optimize a cHEX design using various materials, this simplified method is applied with a design effectiveness $epsilon_d$ of 0.79, corresponding to the effectiveness of the initial heat exchanger, detailed in @use_case, that is used as the baseline. To maintain consistency with the baseline geometry, the constant $t \/ D$ is fixed at 0.16, and the target pressure drop for the optimization is set equal to the pressure drop of the initial design in @use_case. Since the thermal model assumes constant fluid properties, the thermophysical properties of the working fluid are evaluated at the average inlet temperature of the cold and hot fluid channels in the baseline case. These properties are also listed in @use_case.

#figure(
  align(center)[#table(
    columns: 2,
    align: (left,left,),
    table.header([Property], [Value],),
    table.hline(),
    [Working fluid], [Air],
    [Fluid density, $rho$], [0.4816~kg/m#super[3]],
    [Fluid isobaric specific heat, $C_p$], [1.082~kJ/(kg·K)],
    [Fluid dynamic viscosity, $mu$], [34.31~×~10#super[−6]~Pa~s],
    [Fluid thermal conductivity, $k$], [53.6~mW/(m·K)],
    [Cold fluid inlet temperature, $T_(i n \, c)$], [20~°C],
    [Hot fluid inlet temperature, $T_(i n \, h)$], [900~°C],
    [Pressure drop, $Delta P$], [1150~Pa],
    [Effectiveness, $epsilon$], [0.79],
    [Material], [Austenitic steel],
  )]
  , caption: [Working fluid and initial heat exchanger properties]
  , kind: table
  ) <use_case>

The optimization results are converted into dimensional parameters, and the optimal geometrical parameters, together with the corresponding power densities, $cal(D)$, for each heat exchanger made of different materials, are presented in @opt_without_manuf_const. Furthermore, the table provides a comparative analysis of these optimized heat exchangers against the baseline case, referred to as “austenitic steel (initial).\" This comparison is expressed as the ratio of the power density of the optimal configuration to that of the initial heat exchanger, defined as the Improvement Factor, IF.

#figure(
  align(center)[#table(
    columns: 8,
    align: (left,right,right,right,right,right,right,right,),
    table.header([#strong[Material]], [#strong[$k_w$ \[W/m$dot.op$K\]]], [#strong[$L$ \[mm\]]], [#strong[$D$ \[mm\]]], [#strong[$t$ \[mm\]]], [#strong[$dot(m)'_(upright("single"))$ \[kg/s$dot.op$m\]]], [#strong[$cal(D) \/ 10^7$ \[W/m$""^3$\]]], [#strong[IF]],),
    table.hline(),
    [Austenitic steel (Initial)], [20.0], [158.00], [1.000], [0.1600], [8.51e-03], [1.75], [1.00],
    [Plastic], [0.2], [0.06], [0.016], [0.0025], [8.87e-05], [3118.09], [1785.91],
    [Austenitic steel], [20.0], [5.46], [0.155], [0.0247], [9.11e-04], [34.94], [20.01],
    [Ceramic (Al#sub[2]O#sub[3])], [27.0], [7.60], [0.182], [0.0292], [1.07e-03], [25.11], [14.38],
    [Ceramic (AlN)], [180.0], [50.66], [0.471], [0.0754], [2.78e-03], [3.77], [2.16],
    [Aluminum], [237.0], [66.70], [0.541], [0.0865], [3.19e-03], [2.86], [1.64],
    [Copper], [398.0], [112.01], [0.700], [0.1121], [4.13e-03], [1.70], [0.98],
  )]
  , caption: [Dimensional properties of initial and optimized heat exchangers without manufacturing constraints, with associated improvement factors]
  , kind: table
  ) <opt_without_manuf_const>

In the optimal configurations, the geometrical parameters (length, spacing, and thickness) increase with the material's thermal conductivity, leading to a reduction in power density, $cal(D)$. For instance, in the plastic heat exchanger, which has the lowest plate conductivity, $cal(D)$ increases by approximately 1785 times compared to the initial heat exchanger. In contrast, the copper heat exchanger, with the highest plate conductivity, experiences a slight decrease in $cal(D)$ by a factor of 0.98, making copper the only material for which $cal(D)$ is lower than in the initial geometry.

A comparison of the copper heat exchanger's geometrical parameters with the baseline reveals that its length, spacing, and thickness are all smaller. However, despite this reduction in size, the lower power density is attributed to a decrease in the mass flow rate per unit width for a single channel $dot(m)'_(upright("single"))$, caused by the smaller channels. To compensate for this reduced $dot(m)'_(upright("single"))$, the number of layers $n$, the width $W$, or both must be increased, resulting in a larger total volume to achieve the same thermal power as the initial heat exchanger. To ensure that the optimal heat exchanger delivers the same thermal power with the same effectiveness as the initial configuration, $n$ and $W$ must be adjusted such that~$\( n W dot(m)'_(upright("single")) \)_(upright("initial")) = \( n W dot(m)'_(upright("single")) \)_(upright("optimal")) .$

Without any constraints on plate thickness and spacing, the optimal configurations feature plate thicknesses ranging from 0.0025 mm to 0.11 mm. However, such thin structures raise concerns about structural integrity and manufacturability. The AM process cannot reliably ensure the producibility or reproducibility of these thin features, and the accuracy error increases as the component thickness decreases~[#link(<ref-4>)[4]]. This challenge is especially pronounced for copper and its alloys due to their high surface reflectivity and low laser absorption. Additionally, the plate spacings in the optimal heat exchangers range from 0.016 mm to 0.7 mm, increasing the risk of fouling. Therefore, the optimization problem must be revised to address these limitations. The next section presents the formulation of this revised optimization problem and the results of the new approach.

= Design optimization considering additive manufacturing and fouling constraints
<sec:results2>
The goal of this section is to design a cHEX with minimal size while maintaining a given pressure drop and effectiveness, considering constraints related to manufacturing, fouling, and structural limitations on plate thickness and spacing. In cHEX design, thinner plates are generally preferred because they reduce axial heat conduction and minimize lateral conduction resistance, enhancing thermal performance. However, the minimum feasible plate thickness is influenced by the selected manufacturing process and material type. Therefore, it should be explicitly included in the optimization process as a design constraint.

In the previous section, where the relative plate thickness $t \/ D$ was kept constant, the optimization problem could be simplified to a one-dimensional, unconstrained optimization, since the Bejan number maximized power density also maximized the effectiveness. This simplification no longer applies in the current section, as the points of maximum effectiveness and maximum power density differ when using a specified design plate thickness $t_d$ instead of a fixed relative plate thickness $t \/ D$. Figure~@Eff_and_NPD_vs_Be illustrates this distinction by showing the variation in effectiveness and non-dimensional power density as a function of the Bejan number, for a given $tilde(D) = 0.0106$ and $t_d = 0.5 m m$. Hence, the original problem definition in Eq.~@maxQ is altered to obtain the following optimization problem:

$ max_(tilde(D) in bb(R)_0^(+) \, thin upright(B e) in bb(R)_0^(+)) & #h(2em) Q^diamond.stroked.small (tilde(D) \, upright(B e)) \,\
s . t . & #h(2em) epsilon (tilde(D) \, upright(B e)) = epsilon_d \,\
 & #h(2em) t = t_d \,\
 & #h(2em) D gt.eq D_(m i n) . $<maxQ_t_cons>

In addition to the plate thickness, a restriction on the plate spacing is imposed to reduce the risk of fouling. To mitigate this risk, the additional constraint ensures that the plate spacing $D$ is not less than a specified minimum value $D_(m i n)$. This formulation results in a constrained nonlinear optimization problem. The problem is solved numerically using Python's SciPy optimization library, specifically employing the minimize function, which supports various constrained optimization algorithms [#link(<ref-36>)[36]]. In this study, Sequential Least Squares Programming (SLSQP) was used to obtain the optimal values of $tilde(D)$ and $upright(B e)$ while satisfying the given constraints.

#figure(image("graphics/figure2.png"),
  caption: [
    Effectiveness and non-dimensional power density profiles with Bejan Number for $tilde(D) = 0.0106$ and $t = 0.5 m m$
  ]
)
<Eff_and_NPD_vs_Be>

== Thickness-constrained power density optimization for a design effectiveness of 0.79
<thickness-constrained-power-density-optimization-for-a-design-effectiveness-of-0.79>
The optimizations in this section use the same fluid properties, pressure drop, and effectiveness as the baseline heat exchanger, outlined in the previous section and detailed in @use_case. The results of these optimizations are illustrated in Figure~@opt_results, which compares three distinct optimization strategies aimed at maximizing power density.

The first strategy, labeled “#emph[Thickness Constraint]\", maintains a fixed $t_d$=0.5 mm for all materials, with no constraint on plate spacing. The second strategy, labeled “#emph[Thickness and Fouling Constraints]\", introduces a fouling constraint that imposes $D_(m i n)$=0.8 mm, while still maintaining the fixed plate thickness of 0.5 mm for all materials. The third strategy, labeled “#emph[Material-Specific Thickness and Fouling Constraints]\", incorporates both plate thickness and fouling constraints simultaneously. Unlike the previous strategies, this approach applies a material-specific thickness constraint to account for variations in manufacturing resolution in AM.

To address AM resolutions for ceramic and metal heat exchangers, the plate thickness is determined based on the melt pool size, a characteristic of the manufacturing process. It is assumed that a sealed plate requires a thickness of twice the melt pool size. Consequently, the following plate thickness values are used: 0.5 mm for copper~[#link(<ref-37>)[37]], 0.3 mm for aluminum~[#link(<ref-38>)[38]], and 0.25 mm for aluminum nitride (AlN), aluminum oxide (Al#sub[2]O#sub[3])~[#link(<ref-39>)[39]], and austenitic steel~[#link(<ref-40>)[40]]. These values are characteristic of the Laser Powder Bed Fusion (LPBF) process, which is the most common technique for AM of metals and ceramics. For plastic heat exchangers, the plate thickness is not derived from melt pool size, as LPBF is not typically used for plastic printing. Instead, Material Extrusion (MEX), Vat Photopolymerization (VPP), and Sheet Lamination (SHL) processes are widely used~[#link(<ref-41>)[41], #link(<ref-42>)[42]]. While these techniques can achieve thin walls with resolutions below 0.1 mm, a plate thickness of 0.1 mm is assumed in this study. This value is selected to balance manufacturing feasibility with structural integrity, as heat exchangers with wall thicknesses below 0.1 mm are prone to plastic deformation~[#link(<ref-43>)[43]].

In addition to the three optimization strategies, Figure~@opt_results presents the non-dimensional power density values for heat exchangers with baseline length and plate spacing, labeled as “#emph[Additive Manufacturable Initial]” in the figure. These designs serve as a reference for comparison and are adapted from the baseline heat exchanger by applying material-specific plate thicknesses for each of the six considered materials. Unlike in the optimal designs, the pressure drop in these cases is lower than 1150 Pa to maintain a constant effectiveness of 0.79. As a result, $psi$ in the non-dimensional power density equation (Eq.~@NPD) is no longer equal to 1; instead, it takes values of 0.96, 0.99, 0.98, and 0.75 for plastic, austenitic steel, AlN, and Al#sub[2]O#sub[3], respectively. However, for copper and aluminum, even with adjustments to the pressure drop, the design with the baseline length and plate spacing is insufficient to achieve the target effectiveness. Therefore, no Additive Manufacurable Initial designs are included in the figure for these materials.

#figure(image("graphics/figure3.png"),
  caption: [
    Maximum non-dimensional power densities obtained from optimizations with~$epsilon_d med = med 0.79$
  ]
)
<opt_results>

To provide additional context for the designs presented in Figure~@opt_results, @opt_with_manuf_const lists the key geometrical dimensions of the heat exchangers for each optimization strategy and the reference designs. The table includes values such as plate thickness, plate spacing, and overall heat exchanger length, reflecting the influence of material properties and manufacturing constraints on the final optimized geometries.

#figure(
  align(center)[#table(
    columns: (35%, 21%, auto, auto, auto),
    align: (left,left,right,right,right,),
    table.header([#strong[Case]], [#strong[Material]], [#strong[t \[mm\]]], [#strong[D \[mm\]]], [#strong[L \[mm\]]],),
    table.hline(),
    [Thickness constraint], [Plastic], [0.5], [0.14], [5.6],
    [], [Austenitic steel], [0.5], [0.48], [46.0],
    [], [Ceramic (Al#sub[2]O#sub[3])], [0.5], [0.54], [56.8],
    [], [Ceramic (AlN)], [0.5], [0.95], [188.2],
    [], [Aluminum], [0.5], [1.03], [223.6],
    [], [Copper], [0.5], [1.19], [310.4],
    [Thickness and fouling constraints], [Plastic], [0.5], [0.8#super[\*]], [116.4],
    [], [Austenitic steel], [0.5], [0.8#super[\*]], [105.3],
    [], [Ceramic (Al#sub[2]O#sub[3])], [0.5], [0.8#super[\*]], [107.2],
    [], [Ceramic (AlN)], [0.5], [0.95], [188.2],
    [], [Aluminum], [0.5], [1.03], [223.6],
    [], [Copper], [0.5], [1.19], [310.4],
    [Material-specific thickness and fouling constraints], [Plastic], [0.1], [0.8#super[\*]], [103.8],
    [], [Austenitic steel], [0.25], [0.8#super[\*]], [102.8],
    [], [Ceramic (Al#sub[2]O#sub[3])], [0.25], [0.8#super[\*]], [103.7],
    [], [Ceramic (AlN)], [0.25], [0.8#super[\*]], [126.6],
    [], [Aluminum], [0.3], [0.88], [161.6],
    [], [Copper], [0.5], [1.19], [310.4],
    [Additively manufacturable initial design], [Plastic], [0.1], [1.00], [158.0],
    [], [Austenitic steel], [0.25], [1.00], [158.0],
    [], [Ceramic (Al#sub[2]O#sub[3])], [0.25], [1.00], [158.0],
    [], [Ceramic (AlN)], [0.25], [1.00], [158.0],
  )]
  , caption: [Geometrical dimensions of heat exchanger designs for different optimization strategies and reference cases with $epsilon_d = 0.79$]
  , kind: table
  ) <opt_with_manuf_const>

\* Fouling constraint is active.

As shown in Figure~@opt_results, under the “#emph[Thickness Constraint]\" strategy, where the plate thickness is fixed at 0.5 mm and the fouling constraint is not considered, plastic, the material with the lowest thermal conductivity, achieves the highest power density. This result corresponds to a plate spacing of 0.14 mm and a length of 5.6 mm, dimensions that are significantly smaller than those of all other designs (see @opt_with_manuf_const). When the fouling constraint is included, austenitic steel emerges as the material with the highest power density, while the plastic heat exchanger drops to third place, following Al#sub[2]O#sub[3]. However, in the “#emph[Material-Specific Thickness and Fouling Constraints]\" strategy, where material-specific resolutions are explicitly accounted for, plastic achieves the highest power density due to its ability to utilize thinner plates.

In contrast, despite having the highest thermal conductivity among the materials considered, copper exhibits the lowest power density across all optimization strategies in Figure~@opt_results. This indicates that the dimensions of copper heat exchangers need to be significantly higher than the others to achieve the design effectiveness of 0.79, as confirmed by @opt_with_manuf_const.

Across all three optimization scenarios, heat exchangers made from relatively higher-conductivity materials such as copper and aluminum consistently result in increased length and spacing compared to those made from materials with lower thermal conductivity. Consequently, the fouling constraint for copper and aluminum remains inactive. As marked in @opt_with_manuf_const, for AlN, the fouling constraint is inactive under the “#emph[Thickness and Fouling Constraints]\" strategy, where the plate thickness is 0.5 mm, but becomes active under the “#emph[Material-Specific Thickness and Fouling Constraints] strategy, where the plate thickness is reduced to 0.25 mm. These results underscore that using thicker plates and high-conductivity materials in cHEX designs leads to larger heat exchangers to offset axial wall conduction effects and maintain the target design effectiveness.

== Influence of design effectiveness on optimal heat exchanger
<influence-of-design-effectiveness-on-optimal-heat-exchanger>
In the previous optimizations, a design effectiveness of 0.79 was used to ensure consistency with the baseline heat exchanger (see @use_case). These studies demonstrated that both material selection and plate thickness significantly influence cHEX power density. To further explore these effects, this section investigates how varying the design effectiveness influences material selection and power density under AM-imposed plate thickness constraints. The “#emph[Material-Specific Thickness and Fouling Constraints]\" optimization strategy is repeated across a range of $epsilon_d$, from 0.55 to 0.94, to examine the interplay between effectiveness, material type, and power density. The outcomes of these optimizations for all materials are illustrated in Figure~@opt_results_varying_eff.

#figure(image("graphics/figure4.png"),
  caption: [
    Maximum non-dimensional power density with varying effectiveness (fouling constraint active if filled, inactive if open)
  ]
)
<opt_results_varying_eff>

As expected, the non-dimensional power density increases as the design effectiveness decreases for all material cases, indicating that lower effectiveness results in smaller heat exchangers. While this increase in power density is relatively linear across the effectiveness range for low thermal conductivity materials, it becomes more pronounced for higher thermal conductivity materials. This suggests that the dimensions of high thermal conductivity heat exchangers are more sensitive to changes in design effectiveness compared to low thermal conductivity heat exchangers. As a result, the fouling constraint, which is inactive for high thermal conductivity heat exchangers at high effectiveness levels, becomes active at low effectiveness levels due to the reduction in plate spacing (see copper, aluminum, and AlN heat exchangers in Figure~@opt_results_varying_eff).

Figure~@opt_results_varying_eff further demonstrates that, while plastic consistently achieves the highest power density across the entire range of design effectiveness values considered, non-dimensional power density decreases as material thermal conductivity increases. Notably, the optimal material choice remains unaffected by changes in design effectiveness.

= Impact of the plate thickness on maximal power density
<sec:results3>
The previous section determined the plate thickness based on AM limits for metal and ceramic heat exchangers. However, these limits can be significantly exceeded with conventional manufacturing (CM) techniques. For instance, the literature reports microchannels made from stainless steel plates as thin as 0.051 mm~[#link(<ref-44>)[44]], or even copper plates as thin as 0.003 mm~[#link(<ref-45>)[45]], achieved through hydroforming and pressing, respectively. Such thicknesses are far beyond the level of precision currently achievable with AM. This raises the question of whether the optimal material choice changes if AM resolution is improved, or whether current AM methods will continue to act as a bottleneck in cHEX design.

To address this question, optimization studies are conducted for plastic, austenitic steel, and copper with varying minimal plate thicknesses while maintaining the fouling constraint at various design effectiveness levels. The range of plate thicknesses used in this section is set around the material-specific values from the previous section. For plastic, the material-specific thickness was determined based on structural concerns rather than the limitations of AM. Nonetheless, the same procedure is applied to the plastic heat exchanger to examine the effect of plate thickness on its power density. The results of these optimizations are depicted in Figure~@NPD_vs_t_d. Each point in this figure corresponds to an optimization run.

Figure~@NPD_vs_t_d illustrates that the limitations of AM in producing thin features restrict the maximum power density and, consequently, the minimum achievable size of the heat exchanger. For all effectiveness values examined across the three materials, reducing the plate thickness leads to an increase in maximum power density. This increase is relatively modest for plastic and austenitic steel but significantly more noticeable for copper. This suggests that advancements in AM capabilities, particularly in thin-wall manufacturing, would have a greater impact on reducing the volume of copper heat exchangers compared to those made from other materials.

Despite this, due to copper's higher thermal conductivity, it still results in a larger heat exchanger compared to austenitic steel and plastic, as shown in Figure~@NPD_vs_t_d. When the same plate thickness of 0.1 mm or 0.2 mm is used in the optimizations for all materials, copper consistently exhibits the lowest power density across all effectiveness values. However, the austenitic steel heat exchanger achieves the highest power density for all effectiveness values except 0.94. This indicates that advancements in austenitic steel thin-wall production through AM could make austenitic steel competitive with, or even superior to, plastic heat exchangers in terms of compactness.

Broadening the scope to consider the influence of effectiveness values, Figure~@NPD_vs_t_d also shows that the impact of plate thickness on power density becomes less significant at effectiveness values of 0.9 and above for all materials. This is because, at these high effectiveness levels, the heat exchangers are already dimensionally large, even at the smallest plate thickness considered. As a result, the additional increase in size caused by a thicker plate has a relatively limited impact on the volume of the heat exchanger and, consequently, on the power density.

#figure([#box(image("graphics/figure5a.png", width: 45.0%))
  Plastic

  #box(image("graphics/figure5b.png", width: 45.0%))
  Austenitic steel

  #box(image("graphics/figure5c.png", width: 45.0%))
  Copper

  ],
  caption: [
    Non-dimensional power density variation with plate thickness $t_d$ (fouling constraint active if filled, inactive if open)
  ]
)
<NPD_vs_t_d>

= Discussion
<sec:discussion>
This study demonstrates that materials with lower thermal conductivity, such as plastics and ceramics, exhibit greater potential for maximizing compactness in cHEX design compared to metals like copper or aluminum. This is primarily attributed to the dominance of axial heat conduction in highly thermally conductive materials, which diminishes effectiveness in cHEXs. Consequently, for a given effectiveness, heat exchangers made from materials with higher thermal conductivity need to be larger than those made from lower thermal conductivity materials. However, the final compactness of a cHEX is influenced not only by material properties but also by manufacturing and fouling constraints, such as the minimum achievable plate thickness and required plate spacing.

In optimizations conducted without manufacturing or fouling constraints at $epsilon_d$~=~0.79, plastics outperform other materials in terms of power density, achieving an improvement factor of 1785.91 compared to the initial heat exchanger. Although fixing the plate thickness at 0.5 mm for all materials reduces this difference, plastic still achieves the highest power density among the materials, with an improvement factor of nearly 4.0 compared to the additive manufacturable initial steel heat exchanger. However, when the fouling constraint is introduced at the same fixed plate thickness, austenitic steel emerges as the material with the highest power density. These findings align with the existing literature. Stief et al.~[#link(<ref-11>)[11]] suggest that the high thermal conductivity of cHEX plates negatively impacts thermal performance, while very low thermal conductivity can act as insulation, also reducing thermal performance.

When the fixed plate thickness of 0.5 mm is replaced with material-specific plate thicknesses to represent the varying resolution capabilities in AM, the plastic heat exchanger once again achieves the highest power density. This is primarily because AM thin-wall production has not yet reached the desired precision for metal and ceramic materials. With material-specific plate thicknesses, the power density of the plastic heat exchanger is 5.06 times higher than that of the optimal copper heat exchanger. Similarly, the power density of austenitic steel is 4.42 times higher, Al#sub[2]O#sub[3] is 4.34 times higher, AlN is 2.91 times higher, and aluminum is 2.12 times higher than copper. This means that even the aluminum heat exchanger achieves nearly half the volume of the copper heat exchanger in this optimization scenario. This outcome is driven not only by the increased volume associated with thicker plates but also by the effect of thicker plates enhancing axial heat conduction. This increased conduction necessitates longer heat exchanger lengths and wider plate spacings to achieve the desired design effectiveness.

The observation that the copper heat exchanger has the lowest power density compared to other materials holds true for all $epsilon_d$ in the range of 0.55 to 0.94 when using material-specific plate thicknesses, as shown in Figure~@opt_results_varying_eff. Meanwhile, plastic consistently outperforms all other materials across this range. However, as expected, the power density decreases with rising effectiveness for all materials, indicating the increase in heat exchanger dimensions with effectiveness. The increase in plate spacing with effectiveness can be observed by examining the activation of the fouling constraint in the same figure. At high effectiveness values, particularly for plates with high thermal conductivity, the fouling constraint becomes inactive. This occurs because the maximum power density is achieved with a plate spacing configuration exceeding the 0.8 mm minimum requirement.

Another critical aspect investigated in this study is the effect of plate thickness on the power density of cHEXs, as given in Section~@sec:results3. The optimizations in this section evaluate how advancements in AM resolution could enhance power density or influence the optimal material selection for cHEX designs.

Figure~@NPD_vs_t_d demonstrates that the limitations of AM in producing thin features constrain the maximum power density. Reducing plate thickness increases the maximum power density across all examined materials, with the effect being most pronounced for copper compared to plastic and austenitic steel. These results highlight the potential for advancements in thin-wall manufacturing to significantly improve the compactness of copper heat exchangers. Despite this potential, copper's high thermal conductivity still results in larger heat exchangers compared to austenitic steel and plastic. Even with plate thicknesses of 0.1 mm or 0.2 mm, copper consistently achieves the lowest power density across all effectiveness values.

Interestingly, when the plate thickness is set to 0.1 mm or 0.2 mm, austenitic steel achieves the highest power density for all effectiveness values except 0.94. At an effectiveness of 0.6, its power density surpasses that of plastic by factors of 1.06 and 1.12 for plate thicknesses of 0.1 mm and 0.2 mm, respectively. However, at an effectiveness of 0.92, the power densities of austenitic steel and plastic are nearly identical for both plate thickness values. Finally, at an effectiveness of 0.94, the power density of austenitic steel falls below that of plastic by factors of 0.98 and 0.96 for plate thicknesses of 0.1 mm and 0.2 mm, respectively. While these findings highlight the potential of austenitic steel, these plate thickness values exceed the current capabilities of AM technology for producing stable, leak-proof austenitic steel heat exchangers.

This study focused on a counterflow PFPHE. However, the results obtained for maximum power density without plate thickness and fouling constraints were compared with those of a crossflow PFPHE. The analysis of crossflow PFPHE utilized the correlations presented by Buckinx et al.~[#link(<ref-28>)[28]]. For the crossflow heat exchangers, the same design effectiveness value of 0.79 was used, and the maximum power density, along with the corresponding optimal length and plate spacing for the same six materials, was calculated. The results showed that the inverse relationship between maximum power density and thermal conductivity observed in the counterflow case was maintained. However, for each material, crossflow heat exchangers exhibited approximately nine times lower maximum power density compared to counterflow heat exchangers.

Finally, it is crucial to note that although plastic yields the smallest volume heat exchanger for most of the optimization scenarios, its susceptibility to high temperatures limits its practical applicability.

= Conclusions
<sec:conclusion>
This study investigates the influence of thermal material properties and AM constraints on the sizing of compact heat exchangers (cHEXs). The findings reveal that, for a given effectiveness, a typical plastic, austenitic steel, copper, aluminum, aluminum nitride (AlN), and aluminum oxide (Al#sub[2]O#sub[3]) enable varying levels of compactness. Among these, plastic allows for the design of significantly more compact heat exchangers compared to the other materials when manufacturing and fouling constraints are not considered. Even with a fixed plate thickness constraint of 0.5 mm for all materials, plastic retains the highest power density, achieving 12.2 times greater power density than copper.

However, the absence of fouling constraints results in impractically small plate spacing values in some configurations, such as 0.02 mm for plastic in unconstrained optimization or 0.14 mm with only a plate thickness constraint. These designs are highly prone to fouling. Introducing a fouling constraint shifts the optimal material to austenitic steel when the same manufacturable plate thickness is applied across all materials.

Copper, despite its high thermal conductivity, consistently exhibits the lowest power density in all optimization strategies due to significant performance degradation caused by axial conduction in the wall. This results in less compact designs. High thermal conductivity materials are further limited by the relatively lower resolution of AM techniques for producing thin walls. Thicker plate requirements worsen axial conduction effects and cause further increases in heat exchanger dimensions when maintaining constant effectiveness.

Using material-specific plate thicknesses in the optimizations accounts for AM's varying capabilities for thin-wall production in different materials. These optimizations confirm that plastic remains the most promising material, benefiting from the relatively higher resolution of AM plastics. This trend is consistent across all effectiveness values considered, with plastic maintaining the highest power density.

The effect of plate thickness on power density underscores the importance of advanced manufacturing techniques in improving cHEX performance. Reducing plate thickness increases power density across all materials, with copper showing the most significant impact due to its high thermal conductivity and axial conduction losses. While plastic maintains the highest power density with thinner plates, advancements in thin-wall manufacturing could make austenitic steel a competitive choice for compact heat exchangers. At an effectiveness of 0.9 or higher, the influence of plate thickness diminishes, as the larger size required to achieve the desired effectiveness reduces its impact on power density.

This study assumes constant material properties for the fluid and solid, and does not consider the mechanical strength of plates or allowable operational temperatures. For high-temperature applications, the results suggest that austenitic steel may be a favorable choice. Additionally, for simplicity, only unfinned parallel flat plate heat exchangers are investigated. Future research should address these factors to draw more general conclusions on the most suitable materials for AM cHEXs.

= Acknowledgment
<acknowledgment>
This work received funding from VLAIO through the SIM/Flux50 cSBO IAMHEX project and from a KU Leuven starting grant with reference STG/21/016.

#set heading(numbering: none)
= References

#par[[1] I.~Kaur, P.~Singh, State-of-the-art in heat exchanger additive manufacturing, International Journal of Heat and Mass Transfer 178 (2021) 121600.] <ref-1>

#par[[2] D.~Jafari, W.~W. Wits, The utilization of selective laser melting technology on heat transfer devices for thermal energy conversion applications: A review, Renewable and Sustainable Energy Reviews 91 (2018) 420--442. #link("https://doi.org/10.1016/j.rser.2018.03.109")[doi:https:\/\/doi.org/10.1016/j.rser.2018.03.109].] <ref-2>

#par[[3] L.-Y. Chen, S.-X. Liang, Y.~Liu, L.-C. Zhang, Additive manufacturing of metallic lattice structures: Unconstrained design, accurate fabrication, fascinated performances, and challenges, Materials Science and Engineering: R: Reports 146 (2021) 100648. #link("https://doi.org/10.1016/j.mser.2021.100648")[doi:https:\/\/doi.org/10.1016/j.mser.2021.100648].] <ref-3>

#par[[4] F.~Careri, R.~H. Khan, C.~Todd, M.~M. Attallah, Additive manufacturing of heat exchangers in aerospace applications: a review, Applied Thermal Engineering 235 (2023) 121387. #link("https://doi.org/10.1016/j.applthermaleng.2023.121387")[doi:https:\/\/doi.org/10.1016/j.applthermaleng.2023.121387].] <ref-4>

#par[[5] M.~Fuchs, X.~Luo, S.~Kabelac, Influence of axial heat conduction in solid walls and fins on the overall thermal performance of an additively manufactured high-temperature heat exchanger, Applied Thermal Engineering 212 (2022) 118566.] <ref-5>

#par[[6] P.~Kroeger, Performance deterioration in high effectiveness heat exchangers due to axial heat conduction effects, in: Advances in Cryogenic Engineering: Proceedings of the 1966 Cryogenic Engineering Conference University of Colorado Engineering Research Center and Cryogenics Division NBS Institute for Materials Research Boulder, Colorado June 13--15, 1966, Springer, 1967, pp. 363--372.] <ref-6>

#par[[7] T.~Nagasaki, R.~Tokue, S.~Kashima, Y.~Ito, Conceptual design of recuperator for ultramicro gas turbine, in: Proceedings of the International Gas Turbine Congress, Citeseer, 2003, pp. 2--7.] <ref-7>

#par[[8] G.~Maranzana, I.~Perry, D.~Maillet, Mini-and micro-channels: influence of axial conduction in the walls, International journal of heat and mass transfer 47~(17-18) (2004) 3993--4004.] <ref-8>

#par[[9] L.~Hein, M.~Mortean, Theoretical and experimental thermal performance analysis of an additively manufactured polymer compact heat exchanger, International Communications in Heat and Mass Transfer 124 (2021) 105237. #link("https://doi.org/10.1016/j.icheatmasstransfer.2021.105237")[doi:https:\/\/doi.org/10.1016/j.icheatmasstransfer.2021.105237].] <ref-9>

#par[[10] W.~Bier, W.~Keller, G.~Linder, D.~Seidel, K.~Schubert, H.~Martin, Gas to gas heat transfer in micro heat exchangers, Chemical Engineering and Processing: Process Intensification 32~(1) (1993) 33--43. #link("https://doi.org/10.1016/0255-2701(93)87004-E")[doi:https:\/\/doi.org/10.1016/0255-2701(93)87004-E].] <ref-10>

#par[[11] T.~Stief, O.-U. Langer, K.~Schubert, Numerical investigations of optimal heat conductivity in micro heat exchangers, Chemical Engineering & Technology 22~(4) (1999) 297--303. #link("https://doi.org/10.1002/(SICI)1521-4125(199904)22:4<297::AID-CEAT297>3.0.CO;2-Y")[doi:https:\/\/doi.org/10.1002/(SICI)1521-4125(199904)22:4\<297::AID-CEAT297\>3.0.CO;2-Y].] <ref-11>

#par[[12] S.~Borjigin, T.~Ma, M.~Zeng, Q.~Wang, A numerical study of small-scale longitudinal heat conduction in plate heat exchangers, Energies 11~(7) (2018). #link("https://doi.org/10.3390/en11071727")[doi:10.3390/en11071727].] <ref-12>

#par[[13] I.~Mitra, I.~Ghosh, Axial conduction in cross-flow heat exchangers: An analytical approach to the coupled heat transfer problem, International Journal of Heat and Mass Transfer 200 (2023) 123502. #link("https://doi.org/10.1016/j.ijheatmasstransfer.2022.123502")[doi:https:\/\/doi.org/10.1016/j.ijheatmasstransfer.2022.123502].] <ref-13>

#par[[14] D.~Saltzman, M.~Bichnevicius, S.~Lynch, T.~W. Simpson, E.~W. Reutzel, C.~Dickman, R.~Martukanitz, Design and evaluation of an additively manufactured aircraft heat exchanger, Applied Thermal Engineering 138 (2018) 254--263.] <ref-14>

#par[[15] R.~Da~Silva, M.~Mortean, K.~de~Paiva, L.~Beckedorff, J.~Oliveira, F.~Brandão, A.~Monteiro, C.~Carvalho, H.~Oliveira, D.~Borges, et~al., Thermal and hydrodynamic analysis of a compact heat exchanger produced by additive manufacturing, Applied Thermal Engineering 193 (2021) 116973.] <ref-15>

#par[[16] H.~Moon, D.~J. McGregor, N.~Miljkovic, W.~P. King, Ultra-power-dense heat exchanger development through genetic algorithm design and additive manufacturing, Joule 5~(11) (2021) 3045--3056. #link("https://doi.org/10.1016/j.joule.2021.08.004")[doi:https:\/\/doi.org/10.1016/j.joule.2021.08.004].] <ref-16>

#par[[17] S.~Pradeep Narayanan, G.~Venkatarathnam, Performance of a counterflow heat exchanger with heat loss through the wall at the cold end, Cryogenics 39~(1) (1999) 43--52. #link("https://doi.org/10.1016/S0011-2275(98)00123-4")[doi:https:\/\/doi.org/10.1016/S0011-2275(98)00123-4].] <ref-17>

#par[[18] M.~Aminuddin, S.~M. Zubair, Analytical solutions to counter-flow heat exchanger subjected to external heat flux and axial conduction, International Journal of Refrigeration 74 (2017) 22--37. #link("https://doi.org/10.1016/j.ijrefrig.2016.10.011")[doi:https:\/\/doi.org/10.1016/j.ijrefrig.2016.10.011].] <ref-18>

#par[[19] L.~Ratna Raju, T.~Nandi, Effective ntu of a counterflow heat exchanger with unbalanced flow and longitudinal heat conduction through fluid separating and outer walls, Applied Thermal Engineering 112 (2017) 1172--1177. #link("https://doi.org/10.1016/j.applthermaleng.2016.10.200")[doi:https:\/\/doi.org/10.1016/j.applthermaleng.2016.10.200].] <ref-19>

#par[[20] C.~Ranganayakulu, K.~Seetharamu, K.~Sreevatsan, The effects of longitudinal heat conduction in compact plate-fin and tube-fin heat exchangers using a finite element method, International Journal of Heat and Mass Transfer 40~(6) (1997) 1261--1277. #link("https://doi.org/10.1016/S0017-9310(96)00182-2")[doi:https:\/\/doi.org/10.1016/S0017-9310(96)00182-2].] <ref-20>

#par[[21] G.~Nellis, A heat exchanger model that includes axial conduction, parasitic heat loads, and property variations, Cryogenics 43~(9) (2003) 523--538. #link("https://doi.org/10.1016/S0011-2275(03)00132-2")[doi:https:\/\/doi.org/10.1016/S0011-2275(03)00132-2].] <ref-21>

#par[[22] A.~E. Quintero, M.~Vera, Laminar counterflow parallel-plate heat exchangers: An exact solution including axial and transverse wall conduction effects, International Journal of Heat and Mass Transfer 104 (2017) 1229--1245. #link("https://doi.org/10.1016/j.ijheatmasstransfer.2016.09.025")[doi:https:\/\/doi.org/10.1016/j.ijheatmasstransfer.2016.09.025].] <ref-22>

#par[[23] M.~I. Hasan, H.~M. Hasan, G.~A. Abid, Study of the axial heat conduction in parallel flow microchannel heat exchanger, Journal of King Saud University - Engineering Sciences 26~(2) (2014) 122--131, thermal and Micro structure Properties. #link("https://doi.org/10.1016/j.jksues.2012.12.004")[doi:https:\/\/doi.org/10.1016/j.jksues.2012.12.004].] <ref-23>

#par[[24] P.~Gupta, M.~Atrey, Performance evaluation of counter flow heat exchangers considering the effect of heat in leak and longitudinal conduction for low-temperature applications, Cryogenics 40~(7) (2000) 469--474. #link("https://doi.org/10.1016/S0011-2275(00)00069-2")[doi:https:\/\/doi.org/10.1016/S0011-2275(00)00069-2].] <ref-24>

#par[[25] Y.~Yang, G.~Morini, J.~J. Brandner, Experimental analysis of the influence of wall axial conduction on gas-to-gas micro heat exchanger effectiveness, International Journal of Heat and Mass Transfer 69 (2014) 17--25. #link("https://doi.org/10.1016/j.ijheatmasstransfer.2013.10.008")[doi:https:\/\/doi.org/10.1016/j.ijheatmasstransfer.2013.10.008].] <ref-25>

#par[[26] M.~Vera, A.~E. Quintero, On the role of axial wall conduction in mini/micro counterflow heat exchangers, International Journal of Heat and Mass Transfer 116 (2018) 840--857. #link("https://doi.org/10.1016/j.ijheatmasstransfer.2017.09.055")[doi:https:\/\/doi.org/10.1016/j.ijheatmasstransfer.2017.09.055].] <ref-26>

#par[[27] F.~Rogiers, M.~Baelmans, Towards maximal heat transfer rate densities for small-scale high effectiveness parallel-plate heat exchangers, International journal of heat and mass transfer 53~(4) (2010) 605--614.] <ref-27>

#par[[28] G.~Buckinx, F.~Rogiers, M.~Baelmans, Thermal design and optimization of small-scale high effectiveness cross-flow heat exchangers, International Journal of Heat and Mass Transfer 60 (2013) 210--220.] <ref-28>

#par[[29] W.~M. Kays, A.~L. London, Compact heat exchangers, McGraw-Hill, New York, NY, 1984.] <ref-29>

#par[[30] Y.~Cengel, J.~Cimbala, R.~Turner, EBOOK: Fundamentals of Thermal-Fluid Sciences (SI units), McGraw Hill, 2012.] <ref-30>

#par[[31] L.-Z. Zhang, L.~Zhang, Effectiveness-ntu methods for heat and mass transfer processes, Conjugate Heat and Mass Transfer in Heat Mass Exchanger Ducts, Academic Press Inc (2013) 309--334.] <ref-31>

#par[[32] W.~M. Rohsenow, J.~P. Hartnett, Y.~I. Cho, et~al., Handbook of heat transfer, Vol.~3, Mcgraw-hill New York, 1998.] <ref-32>

#par[[33] A.~Zadi-Maad, R.~Rohib, A.~Irawan, Additive manufacturing for steels: a review, IOP Conference Series: Materials Science and Engineering 285~(1) (2018) 012028. #link("https://doi.org/10.1088/1757-899X/285/1/012028")[doi:10.1088/1757-899X/285/1/012028].] <ref-33>

#par[[34] B.~Cantor, H.~Assender, P.~Grant, Aerospace materials, CRC Press, 2015. #link("https://doi.org/10.1201/9781420034721")[doi:https:\/\/doi.org/10.1201/9781420034721].] <ref-34>

#par[[35] A.~Sommers, Q.~Wang, X.~Han, C.~T'Joen, Y.~Park, A.~Jacobi, Ceramics and ceramic matrix composites for heat exchangers in advanced thermal systems---a review, Applied Thermal Engineering 30~(11) (2010) 1277--1291. #link("https://doi.org/10.1016/j.applthermaleng.2010.02.018")[doi:https:\/\/doi.org/10.1016/j.applthermaleng.2010.02.018].] <ref-35>

#par[[36] P.~Virtanen, R.~Gommers, T.~E. Oliphant, M.~Haberland, T.~Reddy, D.~Cournapeau, E.~Burovski, P.~Peterson, W.~Weckesser, J.~Bright, S.~J. van der Walt, M.~Brett, J.~Wilson, K.~J. Millman, N.~Mayorov, A.~R.~J. Nelson, E.~Jones, R.~Kern, E.~Larson, C.~J. Carey, İ.~Polat, Y.~Feng, E.~W. Moore, J.~VanderPlas, D.~Laxalde, J.~Perktold, R.~Cimrman, I.~Henriksen, E.~A. Quintero, C.~R. Harris, A.~M. Archibald, A.~H. Ribeiro, F.~Pedregosa, P.~van Mulbregt, SciPy 1.0 Contributors, SciPy 1.0: Fundamental Algorithms for Scientific Computing in Python, Nature Methods 17 (2020) 261--272. #link("https://doi.org/10.1038/s41592-019-0686-2")[doi:10.1038/s41592-019-0686-2].] <ref-36>

#par[[37] S.~D. Jadhav, L.~R. Goossens, Y.~Kinds, B.~V. Hooreweder, K.~Vanmeensel, Laser-based powder bed fusion additive manufacturing of pure copper, Additive Manufacturing 42 (2021) 101990. #link("https://doi.org/10.1016/j.addma.2021.101990")[doi:https:\/\/doi.org/10.1016/j.addma.2021.101990].] <ref-37>

#par[[38] A.~Ghasemi, E.~Fereiduni, M.~Balbaa, S.~D. Jadhav, M.~Elbestawi, S.~Habibi, Influence of alloying elements on laser powder bed fusion processability of aluminum: A new insight into the oxidation tendency, Additive Manufacturing 46 (2021) 102145. #link("https://doi.org/10.1016/j.addma.2021.102145")[doi:https:\/\/doi.org/10.1016/j.addma.2021.102145].] <ref-38>

#par[[39] S.~H. Liming~Yao, Zhongmin~Xiao, U.~Ramamurty, The formation mechanism of metal-ceramic interlayer interface during laser powder bed fusion, Virtual and Physical Prototyping 18~(1) (2023) e2235324. #link("https://doi.org/10.1080/17452759.2023.2235324")[doi:10.1080/17452759.2023.2235324].] <ref-39>

#par[[40] Y.~Yang, A.~Großmann, P.~Kühn, J.~Mölleney, L.~Kropholler, C.~Mittelstedt, B.-X. Xu, Validated dimensionless scaling law for melt pool width in laser powder bed fusion, Journal of Materials Processing Technology 299 (2022) 117316. #link("https://doi.org/10.1016/j.jmatprotec.2021.117316")[doi:https:\/\/doi.org/10.1016/j.jmatprotec.2021.117316].] <ref-40>

#par[[41] A.~Bhatia, A.~K. Sehgal, Additive manufacturing materials, methods and applications: A review, Materials Today: Proceedings 81 (2023) 1060--1067, international Virtual Conference on Sustainable Materials (IVCSM-2k20). #link("https://doi.org/10.1016/j.matpr.2021.04.379")[doi:https:\/\/doi.org/10.1016/j.matpr.2021.04.379].] <ref-41>

#par[[42] S.~C. Ligon, R.~Liska, J.~Stampfl, M.~Gurr, R.~Mülhaupt, Polymers for 3d printing and customized additive manufacturing, Chemical Reviews 117~(15) (2017) 10212--10290, pMID: 28756658. #link("https://doi.org/10.1021/acs.chemrev.7b00074")[doi:10.1021/acs.chemrev.7b00074].] <ref-42>

#par[[43] Y.~Rua, R.~Muren, S.~Reckinger, Limitations of additive manufacturing on microfluidic heat exchanger components, Journal of Manufacturing Science and Engineering 137~(3) (2015) 034504.] <ref-43>

#par[[44] S.~Mahabunphachai, M.~Koç, Fabrication of micro-channel arrays on thin metallic sheet using internal fluid pressure: Investigations on size effects and development of design guidelines, Journal of Power Sources 175~(1) (2008) 363--371.] <ref-44>

#par[[45] B.~Joo, S.~Oh, Y.~Son, Forming of micro channels with ultra thin metal foils, CIRP Annals 53~(1) (2004) 243--246.] <ref-45>
