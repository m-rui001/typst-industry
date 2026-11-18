// Adapted from arXiv:2512.10207v1 by Yanagihara et al.
// https://arxiv.org/abs/2512.10207v1
// Original article and figures: CC0 1.0, https://creativecommons.org/publicdomain/zero/1.0/
#set page(paper: "a4", margin: 20mm)
#set text(size: 10pt, lang: "en")
#set par(justify: true)
#set heading(numbering: "1.1")
#set math.equation(numbering: "(1)")
#set table(inset: 4pt)
#title[Flow-priority optimization of additively manufactured variable-TPMS lattice heat exchanger based on macroscopic analysis]
#align(center)[Kazutaka Yanagihara (1, 2), Jun Iwasaki (1), Kiyoto Saso (1), Taichi Yamashita (1), Shomu Murakoshi (1), and Akihiro Takezawa (1)]
#align(center)[(1) Department of Applied Mechanics and Aerospace Engineering, Waseda University, 59-311, 3-4-1 Okubo, Shinjuku-ku, Tokyo 169-8555, Japan]
#align(center)[(2) AGC Inc., 1-1 Suehiro-cho, Tsurumi-ku, Yokohama-shi, Kanagawa 230-0045, Japan]
#align(center)[Correspondence: #raw("atakezawa@waseda.jp")]

*Abstract.* Heat exchangers incorporating triply periodic minimal surface (TPMS) lattice structures have attracted considerable research interest because they promote uniform flow distribution, disrupt boundary layers, and improve convective heat transfer performance. However, from the perspective of forming a macroscopic flow pattern optimized for heat exchange efficiency, a uniform lattice is not necessarily the optimal configuration. This study presented a macroscopic modeling approach for a two-fluid heat exchanger equipped with a TPMS Primitive lattice. Macroscopic flow analysis was conducted based on the Darcy--Forchheimer theory. Under the assumption that heat is transferred solely at the interface between the fluid and TPMS walls, a macroscopic heat transfer model was developed using a volumetric heat-transfer coefficient, which serves as an artificial property characterizing the unit-volume heat transfer capability. To effectively regulate the relative dominance of the hot and cold flows and the channel widths within the heat exchanger, we adopted the isosurface threshold of the TPMS Primitive lattice as the design variable and constructed an optimization scheme for the lattice distribution using a previously described macroscopic model. Optimization was subsequently performed for a planar heat exchanger, where the hot and cold fluids followed U-shaped flow trajectories. The optimal solution was verified, and its validity was examined through detailed geometric analysis and experiments conducted using metal-based laser powder bed fusion. The optimal solution derived from the macroscopic model demonstrated a clear performance improvement over a uniform lattice, with an average enhancement of 28.7% in the experimental results.

= Introduction
<introduction>
Recent advances in metal additive manufacturing (AM) have profoundly affected the design and evolution of mechanical parts [#link(<ref-1>)[1], #link(<ref-2>)[2]]. Owing to its capability to fabricate intricate internal geometries, metal AM enables the embedding of efficient coolant channels within a part, thereby enabling high-performance heat exchange structures. In practical settings, AM has been increasingly adopted to produce tooling inserts and cooling systems that feature complex channel networks, which is often referred to as conformal cooling [#link(<ref-3>)[3], #link(<ref-4>)[4]]. Similarly, metal AM has been applied to the fabrication of two-fluid heat exchangers [#link(<ref-5>)[5], #link(<ref-6>)[6]].

A distinctive feature of AM is its ability to create lattice architectures that incorporate hollow internal regions. Because lattice structures possess extremely large surface areas, they offer the potential for highly efficient cooling, and early studies frequently reported their application in conformal cooling [#link(<ref-7>)[7], #link(<ref-8>)[8], #link(<ref-9>)[9], #link(<ref-10>)[10], #link(<ref-11>)[11]]. Among the wide variety of lattice configurations, triply periodic minimal surface (TPMS) lattices have become particularly prominent because they are mathematically described as surfaces that repeat periodically in three dimensions while maintaining a uniform zero mean curvature [#link(<ref-12>)[12]]. The inherent continuity and periodicity of TPMS structures generate a uniform flow distribution, sustained boundary-layer disruption, and secondary flows, enabling improved convective heat transfer performance without the excessive pressure losses typically associated with turbulent-enhancing geometries. Therefore, studies on two-fluid heat exchangers that use TPMS lattices have been actively conducted in recent years [#link(<ref-13>)[13], #link(<ref-14>)[14], #link(<ref-15>)[15], #link(<ref-16>)[16], #link(<ref-17>)[17], #link(<ref-18>)[18], #link(<ref-19>)[19], #link(<ref-20>)[20], #link(<ref-21>)[21], #link(<ref-22>)[22], #link(<ref-23>)[23], #link(<ref-24>)[24], #link(<ref-25>)[25], #link(<ref-26>)[26], #link(<ref-27>)[27], #link(<ref-28>)[28], #link(<ref-29>)[29], #link(<ref-30>)[30], #link(<ref-31>)[31], #link(<ref-32>)[32], #link(<ref-33>)[33], #link(<ref-34>)[34], #link(<ref-35>)[35], #link(<ref-36>)[36], #link(<ref-37>)[37], #link(<ref-38>)[38]].

This study focuses on the flow channels of heat exchangers. First, studies have been conducted on heat exchangers in which cells are arranged linearly and heat exchange is achieved through straight counterflow streams [#link(<ref-13>)[13], #link(<ref-16>)[16], #link(<ref-17>)[17], #link(<ref-25>)[25], #link(<ref-26>)[26], #link(<ref-27>)[27], #link(<ref-35>)[35]]. Heat exchangers in which straight flow channels intersect at right angles have also been extensively studied [#link(<ref-15>)[15], #link(<ref-18>)[18], #link(<ref-19>)[19], #link(<ref-20>)[20], #link(<ref-23>)[23], #link(<ref-24>)[24], #link(<ref-29>)[29], #link(<ref-31>)[31], #link(<ref-32>)[32], #link(<ref-33>)[33], #link(<ref-36>)[36], #link(<ref-37>)[37]]. In these cases, the role of the TPMS lattice is to induce secondary flows and enhance convective heat transfer, functioning essentially as a flow filter. The flow within a TPMS lattice is macroscopically straight; thus, the lattice does not need to provide any function to guide or redirect the flow.

However, in some heat exchangers, one or both fluids follow U- or L-shaped flow paths [#link(<ref-14>)[14], #link(<ref-21>)[21], #link(<ref-22>)[22], #link(<ref-28>)[28], #link(<ref-30>)[30], #link(<ref-34>)[34], #link(<ref-38>)[38]]. In such complex flow paths, we must consider not only the generation of local turbulence by the TPMS lattice geometry but also its influence on the macroscopic flow behavior. It is likely that, from the perspective of forming a macroscopic flow pattern optimized for heat-exchange efficiency, a uniform lattice is not necessarily the optimal configuration.

Li et al. concluded that optimizing the lattice wall thickness and porosity is essential for further improving the performance of TPMS-lattice heat exchangers [#link(<ref-14>)[14]]. Similarly, Wang et al. investigated a heat exchanger incorporating U-shaped flow paths and found that a uniformly distributed lattice resulted in different channel structures depending on the relative positions of the inlet and outlet, leading to asymmetric flow resistance; based on this observation, they emphasized the necessity of flow-path optimization [#link(<ref-28>)[28]]. Oh et al. introduced a mathematical filtering strategy that locally alters the TPMS lattice geometries to designate the inlet and outlet regions, embed flow-directional barriers, and reduce the solid fractions near the openings to lower the flow resistance. Using this approach, they achieved a heat exchange performance that was nearly double that of conventional heat exchangers [#link(<ref-22>)[22]]. However, in their work, the placement of these filters was determined heuristically, indicating that further enhancements require a fundamental numerical optimization method for the TPMS lattice geometry.

A major benefit of lattice structures is their ability to emulate the functionally graded material behavior by altering the lattice geometry according to the spatial location [#link(<ref-39>)[39], #link(<ref-40>)[40]]. Therefore, controlling the flow by introducing nonuniform geometries or density distributions is not difficult. Oh et al. implemented an optimization strategy in which the cell size of a gyroid structure was graded [#link(<ref-30>)[30]].

The design of lattice structures with spatial variation is accomplished more effectively using an approximate structural optimization method that utilizes homogenized material properties and applies gradient-driven optimization. Employing numerically homogenized effective properties [#link(<ref-41>)[41], #link(<ref-42>)[42]] avoids the substantial computational cost that would otherwise arise from explicitly resolving the detailed lattice geometry. In this framework, the design variable is defined as either the effective density or a characteristic geometric parameter of the lattice, and it is iteratively updated using a gradient-based algorithm once the sensitivities have been computed. Consequently, the procedure closely resembles that used in conventional topology optimization [#link(<ref-43>)[43], #link(<ref-44>)[44]].

The authors proposed an optimization framework that adjusts the lattice density within a heat exchanger to realize efficient cooling under liquid flow conditions characterized by Reynolds numbers of the order of $10^2$ [#link(<ref-45>)[45], #link(<ref-46>)[46], #link(<ref-47>)[47], #link(<ref-48>)[48]]. In these analyses, fluid behavior was modeled using the Darcy--Forchheimer theory [#link(<ref-49>)[49], #link(<ref-50>)[50], #link(<ref-51>)[51]]. Based on the macroscopic porous-flow approximation method, we propose an approach for optimizing the flow priority between two channels in a TPMS lattice heat exchanger. For the TPMS lattice, we employed the Primitive lattice, prioritizing its orthogonally symmetric geometry and isotropic effective properties, which simplified the modeling process. Under the assumption that heat is transferred solely at the interface between the fluid and TPMS walls, a macroscopic heat transfer model was developed using a volumetric heat-transfer coefficient, which serves as an artificial property characterizing the unit-volume heat transfer capability [#link(<ref-52>)[52]]. Using this volumetric heat-transfer coefficient together with the effective thermal conductivity and Darcy velocity, we derived the advection-diffusion heat transfer equations for each fluid. By simultaneously solving a set of five governing equations, including the heat conduction equation for the TPMS walls, we obtained the macroscopic velocity and temperature fields for each fluid along with the temperature distribution inside the solid walls.

Based on the macroscopic analysis described earlier, we treated the parameter that determined the wall position of the TPMS Primitive lattice as the design variable, which allowed us to optimize the relative flow importance of the hot and cold channels in each cell. The effective properties required in the macroscopic model were computed using representative volume element (RVE) based homogenization. In this study, optimization was applied to a counter-flow heat exchanger, where each fluid on the hot and cold sides moved through a U-shaped channel. Such U-shaped counterflow arrangements present notable design challenges and have been the subject of numerous prior investigations on flow-path topology optimization [#link(<ref-53>)[53], #link(<ref-54>)[54]].

In Section 2, we describe the analysis method, optimization procedure, and experimental approach used in this study. Section 3 presents the optimization results, followed by a reanalysis using detailed simulations and corresponding experimental validations. In Section 4, we examine the soundness of the proposed analytical approach, explore the mechanical principles underlying the optimal solutions, and evaluate the extent to which the optimized design can be reproduced experimentally.

= Methods
<methods>
== Macroscopic analysis model
<macroscopic-analysis-model>
=== Governing equations
<governing-equations>
We employed a TPMS lattice structure as the internal geometry of the two-channel heat exchanger. By optimally distributing the isosurface threshold of the TPMS, we aim to control the flow priority of each fluid, thereby maximizing the overall heat-exchange performance. However, during the iterative optimization process, repeatedly reconstructing the detailed geometry of the lattice, where two fluids and solid walls coexist, and performing full thermal-fluid simulations would require prohibitively high computational costs. Therefore, in this study, to substantially reduce the computational burden, the lattice structure was treated macroscopically as a porous medium, and an approximate porous-flow theory based on the effective material properties was employed.

At the inlet boundary $Gamma_(upright(i n))^(f h)$, the incompressible hot fluid is supplied at pressure $P_(upright(i n))^(f h)$ and temperature $T_(upright(i n))^(f h)$, while at the outlet boundary $Gamma_(upright(o u t))^(f h)$, it discharges under the condition $P^(f h) = 0 thin upright(P a)$. Similarly, incompressible cold fluid enters from $Gamma_(upright(i n))^(f c)$ with pressure $P_(upright(i n))^(f c)$ and temperature $T_(upright(i n))^(f c)$, and leaves through $Gamma_(upright(o u t))^(f c)$ with $P^(f c) = 0 thin upright(P a)$. In this setting, the two fluids exchange heat through the solid walls of the embedded TPMS lattice within the heat exchanger and are assumed to not mix with each other. The outer walls of the heat exchanger were treated as adiabatic and the heat transfer rate between the two fluids was evaluated based on the temperature difference between their respective inlet and outlet boundaries. For simplicity, both fluids were assumed to be composed of the same material.

#figure(image("graphics/fig01.jpg"),
  caption: [
    Outline of analysis model.
  ]
)
<outline>

The full set of governing equations comprises the Navier--Stokes and continuity equations for each fluid along with the heat advection-diffusion equation, which applies to the entire domain.

$ rho (upright(bold(u))^(\( alpha \)) dot.op nabla upright(bold(u))^(\( alpha \))) = - nabla P^(\( alpha \)) + mu nabla^2 upright(bold(u))^(\( alpha \)) $ <eq01>

$ nabla dot.op upright(bold(u))^(\( alpha \)) = 0 $ <eq02>

$ rho C_p thin upright(bold(u))^(\( alpha \)) dot.op nabla T - lambda^(*) nabla^2 T = Q \, $ <eq03>

#math.equation(block: true, numbering: none, $ #h(2em) \( alpha = f h \, f c \) $)

where $upright(bold(u))$ and $P$ represent the velocity and pressure of each fluid, respectively; $rho$ is the fluid density; $mu$ is the dynamic viscosity; $T$ is the temperature; $C_p$ is the specific heat at constant pressure; $lambda$ is the thermal conductivity; and $Q$ corresponds to the volumetric internal heat source.

However, when the lattice structure is treated macroscopically as a porous medium, the relationship between the pressure gradient and flow velocity can be expressed by the Darcy--Forchheimer law as given below [#link(<ref-49>)[49], #link(<ref-50>)[50], #link(<ref-51>)[51]].

$ nabla overline(P) = - mu / kappa thin overline(upright(bold(u))) - beta rho thin \| overline(upright(bold(u))) \| thin overline(upright(bold(u))) $ <eq04>

where $kappa$ and $beta$ denote permeability and drag coefficients, respectively. The quantity $overline(upright(bold(u)))$ refers to the Darcy velocity and $overline(P)$ indicates the macroscopic pressure. By combining Eqs. #link(<eq01>)[\[eq01\]] and #link(<eq04>)[\[eq04\]] in an analogous manner, the flow in the macroscopic model can be expressed using the Brinkman--Forchheimer equation with porosity $epsilon$ of the porous medium [#link(<ref-51>)[51], #link(<ref-55>)[55], #link(<ref-56>)[56], #link(<ref-57>)[57]]:

$ rho / epsilon thin overline(upright(bold(u))) dot.op (nabla overline(upright(bold(u))) / epsilon) = - nabla overline(P) + mu / epsilon nabla^2 overline(upright(bold(u))) - mu / kappa overline(upright(bold(u))) - beta rho thin \| overline(upright(bold(u))) \| thin overline(upright(bold(u))) $ <eq05>

In a TPMS lattice, two fluid channels are separated by solid walls. Consequently, within the macroscopic framework, the Brinkman--Forchheimer and continuity equations were written independently for each fluid. Thus, for hot fluid $f h$ and cold fluid $f c$, these governing equations are expressed as follows:

$ rho / epsilon^(\( alpha \)) thin overline(upright(bold(u)))^(\( alpha \)) dot.op (nabla overline(upright(bold(u)))^(\( alpha \)) / epsilon^(\( alpha \))) = - nabla overline(P)^(\( alpha \)) + mu / epsilon^(\( alpha \)) nabla^2 overline(upright(bold(u)))^(\( alpha \)) - mu / kappa^(\( alpha \)) overline(upright(bold(u)))^(\( alpha \)) - beta^(\( alpha \)) rho thin lr(|overline(upright(bold(u)))^(\( alpha \))|) thin overline(upright(bold(u)))^(\( alpha \)) $ <eq06>

$ nabla dot.op overline(upright(bold(u)))^(\( alpha \)) = 0 $ <eq07>

#math.equation(block: true, numbering: none, $ #h(2em) \( alpha = f h \, f c \) $)

However, for the thermal field, the heat advection-diffusion equation in the macroscopic model is obtained by replacing the velocity in Eq. #link(<eq03>)[\[eq03\]] with the Darcy velocity and by substituting the effective thermal conductivity for the original thermal conductivity. In this formulation, the temperatures of the fluids $f h$ and $f c$, and the solid are treated as distinct variables within a single macroscopic lattice. Accordingly, the macroscopic temperature distributions follow the three equations given below:

$ rho C_p thin overline(upright(bold(u)))^(\( alpha \)) dot.op nabla overline(T)^(\( alpha \)) = overline(lambda)^(\( alpha \)) nabla^2 overline(T)^(\( alpha \)) + overline(Q)^(\( alpha \) arrow.r s) $ <eq08>

$ overline(lambda)^(thin s) nabla^2 overline(T)^(thin s) + sum_i overline(Q)^(\( alpha \) arrow.r s) = 0 $ <eq09>

#math.equation(block: true, numbering: none, $ #h(2em) \( alpha = f h \, f c \) $)

where $overline(lambda)$ denotes effective thermal conductivity. $overline(Q)^(\( alpha \) arrow.r s)$ represents the volumetric heat transfer from fluid $alpha$ to a solid. As described below, the macroscopic description of the heat transfer employs a volumetric heat-transfer coefficient $overline(h)$, which represents the rate of thermal exchange between the solid and each fluid [#link(<ref-52>)[52]].

$ overline(Q)^(\( alpha \) arrow.r s) = overline(h)^(\( alpha \) arrow.r s) (overline(T)^(\( alpha \)) - overline(T)^(thin s)) $ <eq10>

#math.equation(block: true, numbering: none, $ #h(2em) \( alpha = f h \, f c \) $)

=== Effective material properties
<effective-material-properties>
The effective material properties used in the macroscopic model were derived using the RVE-based homogenization. The permeability and drag coefficients in Eqs. #link(<eq06>)[\[eq06\]] and #link(<eq07>)[\[eq07\]] are obtained by solving the Navier--Stokes equations under boundary conditions that impose a pressure gradient, using a unit-cell structure corresponding to one period of the TPMS lattice, as illustrated in Fig. @rve (a). Although the pressure distribution and velocity field inside the unit cell were not uniform, they were treated as macroscopically uniform. The average outlet velocity is regarded as the Darcy velocity and is substituted into Eq. #link(<eq04>)[\[eq04\]] to determine the permeability and drag coefficient. The porosity was calculated geometrically as the ratio of the fluid volume to the total unit-cell volume of the lattice structure.

Similarly, effective thermal properties were derived using the RVE method. The effective properties required in Eq. #link(<eq08>)[\[eq08\]]--#link(<eq10>)[\[eq10\]] are the effective thermal conductivities $lambda^(\( alpha \))$ $\( alpha = f h \, f c \, s \)$ and the volumetric heat-transfer coefficients $overline(h)^(\( alpha \) arrow.r s)$ $\( alpha = f h \, f c \)$. The effective thermal conductivity $lambda^(\( alpha \))$ $\( alpha = f h \, f c \, s \)$ was obtained by imposing a macroscopic temperature gradient on the unit-cell domain, as illustrated in Fig. @rve (b), and substituting the resulting average heat flux $overline(bold(J))$ into the Fourier-type expression shown below:

$ - overline(lambda) nabla T = overline(bold(J)) $ <eq11>

Furthermore, the volumetric heat-transfer coefficient $macron(h)^(f arrow.r s)$ was evaluated for the flow domain, as shown in Fig. @rve (c). As illustrated in Fig. @rve (c), the inlet temperature $T_(upright(i n))^f$ is prescribed at the fluid inlet boundary, and the solid temperature $T^s$ was prescribed at the solid wall. By solving the Navier--Stokes and heat advection-diffusion equations, the temperature field $T^f$ of the fluid is obtained and $macron(h)^(f arrow.r s)$ was derived by substituting the result into the following heat-conservation equation:

$ rho C_p integral.double_(Gamma_(upright(i n))^f) (T_(upright(o u t))^f - T_(upright(i n))^f) u_(upright(n))^f thin d S = macron(h)^(f arrow.r s) integral.triple_V (T^f - T^s) d V $ <eq12>

where $T_(upright(o u t))^f$ denotes the fluid temperature at the outlet boundary. $u_(upright(n))^f$ denotes the velocity component normal to the inlet boundary; $Gamma_(upright(i n))^f$ is the fluid inlet boundary and $V$ is the unit cell volume. As $T^f$ is linear with respect to $T_(upright(i n))^f$ and $T^s$, $macron(h)^(f arrow.r s)$ is a function of $u_(upright(n))^f$.

#figure(image("graphics/fig02.jpg"),
  caption: [
    Analysis models and boundary conditions for calculating the effective physical properties: (a) permeability and drag coefficient, (b) effective heat conductivity, and (c) volumetric heat-transfer coefficient.
  ]
)
<rve>

== Optimization method
<optimization-method>
=== Formulation of the TPMS lattice and definition of design variables
<formulation-of-the-tpms-lattice-and-definition-of-design-variables>
A TPMS is defined as a continuous function that partitions a domain into multiple disjointed regions. This position could be modified by changing the isosurface threshold value of the defining function. In this study, two TPMSs were defined, and the region between them was regarded as the solid lattice domain. The inner and outer regions were defined as the flow domains. We employed a TPMS represented using the primitive function as follows, prioritizing its orthogonally symmetric geometry and isotropic effective properties, which simplifies the modeling process:

$ cos (frac(2 pi, l) x) + cos (frac(2 pi, l) y) + cos (frac(2 pi, l) z) = C $ <eq13>

where $x \, y \, z$ are the spatial coordinates and $l$ is the length corresponding to one period of the Primitive function, which also corresponds to the unit cell size. In this study, $l$ was set to 5 mm. The constant $C$ is the isosurface threshold that determines spatial partitioning. By using this Primitive function, the flow domains $Omega^(f h)$, $Omega^(f c)$, and and the solid domain $Omega^s$ are defined as follows:

$ Omega^(f h) = {x \, y \, z divides cos (frac(2 pi, l) x) + cos (frac(2 pi, l) y) + cos (frac(2 pi, l) z) < C - d C} $ <eq14>

$ Omega^(f c) = {x \, y \, z divides cos (frac(2 pi, l) x) + cos (frac(2 pi, l) y) + cos (frac(2 pi, l) z) > C + d C} $ <eq15>

$ Omega^s = {x \, y \, z divides lr(|cos (frac(2 pi, l) x) + cos (frac(2 pi, l) y) + cos (frac(2 pi, l) z) - C|) lt.eq d C} $ <eq16>

where $d C$ denotes a parameter that determines the thickness of the solid domain. Considering manufacturability, $d C = 0.3$ was chosen such that the minimum wall thickness did not fall below approximately 0.5 mm.

The isosurface threshold value $C$ of the TPMS function determines the position of the solid region as follows: By varying this value, the volumes of the flow regions and the thicknesses of the passages can be adjusted. In this study, we considered the problem of optimizing the flow priority using the isosurface threshold $C$ as the design variable. Figure @threshold illustrates the change in the shape of the solid region when the threshold value was varied. In this study, we considered $C = 0$ as the reference value corresponding to equal flow resistances of the hot and cold channels. When $C > 0$, the high-temperature flow region dominates, whereas when $C < 0$, the low-temperature flow region dominates.

The normalized design variable $d$ ($0 lt.eq d lt.eq 1$) is defined by normalizing the isosurface threshold $C$ as follows:

$ d = frac(C - C_min, C_max - C_min) $ <eq17>

where $C_min$ and $C_max$ represent the lower and upper limits of the feasible range of $C$. To ensure that the minimum passage thickness does not fall below approximately 0.5 . we set $C_min = - 0.65$ and $C_max = 0.65$.

#figure(image("graphics/fig03.jpg"),
  caption: [
    Relationship between the value of the isosurface threshold $C$ and the lattice geometry
  ]
)
<threshold>

Although the design variable $d$ can be defined as the distance from the center of the unit cell to the isosurface, the TPMS value used to generate the lattice is a continuous scalar field distributed throughout space. The TPMS geometry is obtained by selecting a specific level-set value. Consequently, the actual TPMS lattice unit-cell geometry does not perfectly exhibit orthogonal symmetry, unlike the idealized shapes shown in Fig.~@rve. Therefore, the effective material properties derived using the RVE-based homogenization may include discrepancies when applied to the actual geometry. To address this issue, the validity of the macroscopic model is examined through detailed numerical analyses and experiments conducted using the fabricated lattice shapes.

=== Optimization formulation
<optimization-formulation>
The details of the analysis model used for the optimization in this study are shown in Fig. @detailedmodel. All the exterior boundaries of the heat exchanger were modeled as adiabatic, meaning that heat transfer occurred only between the solid walls and flowing fluids. The working fluid on both the hot and cold sides was water with a mass density of 1000 kg/m$""^3$, dynamic viscosity of 0.001 kg/(m$dot.op$s), specific heat of 4200 J/(kg$dot.op$K), and thermal conductivity of 0.6 W/(m$dot.op$K), respectively. The solid region is made of 316L stainless steel with a thermal conductivity of 14.1 W/(m$dot.op$K) [#link(<ref-58>)[58]].

In the macroscopic optimization model, the design variables are discretely defined at the centers of the cubic lattice cells with a spacing corresponding to one unit-cell period, and their values were linearly interpolated between these definition points. Consequently, the total number of design variables was 280.

To avoid blocking the flow passages at the inlet and outlet connections, the design variables of the lattice cells connected directly to the inlets and outlets were fixed. Specifically, the design variables at the cell centers connected to the hot-fluid inlet and outlet were set to $d = 0$, whereas those connected to the cold-fluid inlet and outlet were set to $d = 1$.

#figure(image("graphics/fig04.jpg"),
  caption: [
    Detailed analysis model for optimization.
  ]
)
<detailedmodel>

In this study, following our previous work, we assumed practical constraints such as the pump capacity in real applications, and imposed a pressure drop as a pressure boundary condition at the inlets and outlets to prevent the optimization process from producing solutions that result in excessive pressure losses [#link(<ref-47>)[47], #link(<ref-48>)[48]]. The inlet temperature of the hot fluid was set to $60 thin^compose upright(C)$, and that of the cold fluid was set to $25 thin^compose upright(C)$. For both fluids, the pressure difference between the inlet and outlet was set to $500 thin upright(P a)$. In addition, in the detailed geometric model, the reference coordinate position of the primitive function defining the TPMS was adjusted so that the openings of the lattice structure were aligned with the inlet and outlet ports.

The objective of this study was to maximize the heat transfer rate in the heat exchanger. Assuming that the heat exchanger is thermally insulated from the surroundings, the heat gained by the cold fluid and the heat lost by the hot fluid are equal. Therefore, the objective function of the optimization problem is defined as the maximization of the heat transfer rate, which is calculated using the temperature gap of the hot fluid between the inlet and outlet, as expressed below:

$ upright("maximize") integral_(Gamma_(upright(o u t))^(f h)) rho C_p thin upright(bold(u))^(f h) dot.op upright(bold(n)) (T_(upright(i n))^(f h) - T_(upright(o u t))^(f h)) d S $ <eq18>

where $S$ represents the boundary surface and $upright(bold(n))$ is the outward unit normal vector on the boundary. No additional constraints are imposed.

=== Optimization algorithm
<optimization-algorithm>
A flowchart of the optimization procedure is presented in Fig. @flowchart. Before starting the optimization, the design variable $d$ is initialized to $0$ over the entire design domain. Within each optimization loop, the Brinkman--Forchheimer equations in Eq. #link(<eq06>)[\[eq06\]], the continuity equation in Eq. #link(<eq07>)[\[eq07\]], the macroscopic heat advection-diffusion equations in Eq. #link(<eq08>)[\[eq08\]], and the macroscopic heat conduction equation in Eq. #link(<eq09>)[\[eq09\]] are solved using finite element method (FEM). Subsequently, the objective function shown in Eq. #link(<eq18>)[\[eq18\]] and its sensitivities are evaluated, The design variables were updated using the optimization algorithm. The method of moving asymptotes (MMA) was employed as the update scheme [#link(<ref-59>)[59]].

#figure(image("graphics/fig05.jpg"),
  caption: [
    Optimization algorithm flowchart.
  ]
)
<flowchart>

== Experimental method
<experimental-method>
Heat exchanger specimens were fabricated using a metal laser powder bed fusion (LPBF) apparatus (ORLAS Creator RA, 2onelab Inc., Germany). The powder used was a 316 L stainless steel (Höganäs, Sweden) with a mean particle diameter of 30 μm.

A schematic of the experimental setup is shown in Fig. @expsetup. Chilled water was delivered by using a cooling thermostat unit (LTC-1200$alpha$\; AS ONE Corporation, Japan), while heated water was supplied using a heating thermostat unit (HS-1, Tokyo Rikagaku Kikai Co., Ltd., Japan), with both streams conveyed by pumps. The flow rate was adjusted using valves and flowmeters (LM05ZAT-AR; HORIBA STEC Co., Ltd., Japan). Rod-type thermocouples were installed at the inlets and outlets on both the cold and hot sides via connectors, and steady-state water temperatures were measured after sufficient time had passed. In addition, the surface of the heat exchanger was covered with a thermal insulation material. A differential pressure gauge (PZ-77; Tsukasa Sokken Co., Ltd., Japan) was used to measure the pressure drop through the heat exchanger.

#figure(image("graphics/fig06.jpg"),
  caption: [
    Flow diagram of experimental setup.
  ]
)
<expsetup>

= Results
<results>
== Numerical results
<numerical-results>
In this study, COMSOL Multiphysics, a finite element method solver, was used to derive the effective material properties and analyze the macroscopic model, while Star-CCM+, a finite volume method solver, was employed for reanalysis using detailed geometry.

=== Derivation of effective physical properties
<derivation-of-effective-physical-properties>
Figure @interp shows the approximate effective material properties evaluated using the unit cell depicted in Fig. @rve, as functions of the design variable $d$. In the definition of the unit cell geometry used in this study, the shape of the hot fluid region corresponding to the design variable $d$ is identical to that of the cold fluid region corresponding to $1 - d$. In other words, the effective material properties of the hot fluid region for design variable $d$ are equal to those of the cold fluid region for design variable $1 - d$. Therefore, only the effective material properties of the hot fluid region are presented here. The pressure gradient $d P \/ d l$ applied to the fluid region was set to a maximum of 5 $upright(k P a \/ m)$, assuming a pressure drop of 500 Pa over a channel length of approximately 0.1 m. The permeability $kappa$ and drag coefficient $beta$ are shown in Figs. @interp (a) and (b), the effective thermal conductivity $overline(lambda)$ in Fig. @interp (c), the porosity $epsilon$ and the volume fraction $v$ in Fig. @interp (d), and the volumetric heat-transfer coefficient $overline(h)$ in Fig. @interp (e).

Figures @interp (a), (b), and (e) indicate that as the design variable $d$ increases, the porosity of the hot fluid region decreases and the flow resistance increases, which is a physically reasonable trend. In addition, the volume fraction of the solid region remains nearly constant regardless of $d$, implying that the overall volume fraction of the domain can be regarded as essentially unchanged throughout the optimization.

Furthermore, although the volumetric heat transfer coefficient shown in Fig. @interp (e) is, in principle, an effective property that depends on both the design variable $d$ and the Darcy velocity $macron(bold(u))$, its dependence on $d$ was small within the pressure-gradient range below $d P \/ d l = 5 thin upright(k P a \/ m)$. Therefore, to reduce the nonlinearity of the optimization problem and improve convergence, the volumetric heat-transfer coefficient was approximated in this study as a function of the Darcy velocity alone.

#figure(image("graphics/fig07.jpg"),
  caption: [
    Approximate representations of (a) permeability, (b) drag coefficient, (c) effective thermal conductivity, (d) porosity and solid volume fraction, and (e) the volumetric heat-transfer coefficient.
  ]
)
<interp>

=== Optimization results based on the macroscopic model analysis
<optimization-results-based-on-the-macroscopic-model-analysis>
Figure @history illustrates the convergence history of the objective function. The optimization was terminated at 100 iterations after confirming that the change in the objective function is sufficiently small. The objective function converged stably and the heat transfer rate improved by approximately 20%.

Figure @optimalgeom (a) shows the distribution of optimal design variables, and Fig. @optimalgeom (b) shows the detailed geometry generated from this distribution. The detailed geometry is illustrated in the cross-sectional views taken through the centers of the inlets and outlets of both the hot fluid and cold fluid regions. The distribution of the channel width clearly corresponds to the distribution of the design variables.

#figure(image("graphics/fig08.jpg"),
  caption: [
    Convergence history and corresponding intermediate design variable distributions.
  ]
)
<history>

#figure(image("graphics/fig09.jpg"),
  caption: [
    Outlines of optimal results. (a) Optimal design variable distribution. (b) Detailed geometry generated from the optimal design variable distribution. (c) Fabricated test piece by metal LPBF.
  ]
)
<optimalgeom>

=== Re-analysis for the optimal result
<re-analysis-for-the-optimal-result>
Figure @hydroanalysis compares the hydrodynamic characteristics of the uniform and optimized lattices obtained from both the macroscopic model and the detailed-geometry analysis, and similarly, Fig. @thermalanalysis compares their thermal characteristics. In both comparisons, the results obtained using the macroscopic model and those obtained from the detailed geometry exhibit the same overall trends.

The flow rates and outlet fluid temperatures are listed in Table @temperature. Figure @heattransf shows the heat transfer rates calculated from the flow rates and temperature changes between the inlet and outlet of each flow passage. Although the detailed model yielded slightly higher heat transfer rates, the improvement in the performance from the uniform lattice to the optimized lattice was consistently reproduced.

Furthermore, Fig. @pressure presents a comparison of the pressure losses of the uniform and optimized lattices obtained from both the macroscopic model and the detailed-geometry analysis. To enable comparison with the experimental results, the pressure losses were computed over a wide range of flow rates. The pressure losses for the uniform and optimized lattices exhibit no significant differences, which is consistent with the small difference in the flow rates shown in Table @temperature. However, the macroscopic model generally predicted higher pressure losses than the detailed model.

#figure(image("graphics/fig10.jpg"),
  caption: [
    Comparison of the hydrodynamic characteristics of the uniform and optimized lattices obtained from the macroscopic and the detailed-geometry analysis
  ]
)
<hydroanalysis>

#figure(image("graphics/fig11.jpg"),
  caption: [
    Comparison of the thermal characteristics of the uniform and optimized lattices obtained from the macroscopic and the detailed-geometry analysis
  ]
)
<thermalanalysis>

#figure(
  align(center)[#table(
    columns: 6,
    align: (left,left,center,center,center,center,),
    [], [], table.cell(align: center, colspan: 2)[Flow rate \[mL/min\]], table.cell(align: center, colspan: 2)[Outlet temperature \[$""^compose$C\]],
    [], [], [Hot fluid], [Cold fluid], [Hot fluid], [Cold fluid],
    [Macroscopic], [Uniform lattice], [319.2], [320.9], [46.8], [38.0],
    [simulation], [Optimal lattice], [301.2], [319.0], [43.5], [40.0],
    [Detailed], [Uniform lattice], [414.8], [416.1], [48.5], [36.3],
    [simulation], [Optimal lattice], [328.5], [386.7], [43.7], [39.1],
  )]
  , caption: [Comparison of the flow rates and outlet temperatures of the uniform and optimal lattices obtained from the macroscopic and the detailed-geometry analysis.]
  , kind: table
  ) <temperature>
#figure(image("graphics/fig12.jpg"),
  caption: [
    Comparison of the heat transfer rate of the uniform and optimized lattices obtained from the macroscopic and the detailed-geometry analysis, and experiment.
  ]
)
<heattransf>

#figure(image("graphics/fig13.jpg"),
  caption: [
    Comparison of the pressure loss of the uniform and optimized lattices obtained from the macroscopic and the detailed-geometry analysis, and experiment. (a) Hot-fluid channel of the uniform lattice. (b) Cold-fluid channel of the uniform lattice. (c) Hot-fluid channel of the optimal lattice. (d) Cold-fluid channel of the optimal lattice.
  ]
)
<pressure>

== Experimental results
<experimental-results>
Figure @optimalgeom (c) shows photographs of the fabricated heat exchanger, including its exterior and cross-sectional views captured through the hot- and cold-fluid regions. The fabricated geometry generally matches the original three-dimensional model data.

Figure @heattransf shows the heat transfer rates calculated from the flow rates and temperature differences between the inlet and outlet of each flow passage. The experimental results were in good agreement with the simulations, and the experiments confirmed that the optimization led to an increase in the heat transfer rate.

The measured differential pressures are presented in Fig. @pressure. Because the maximum measurement range of the differential pressure gauge was 2 kPa, fewer experimental data points were available compared with the simulations. In general, the experimental values were between those predicted by the macroscopic and detailed geometry models, except for the hot-fluid channel of the optimized lattice, where the experimental value was the highest.

= Discussion
<discussion>
First, with respect to the optimal solution, the design variable distribution and streamlines shown in Fig. @hydroanalysis indicate that, while the flow in the uniform lattice develops predominantly in the vertical direction for both the hot and cold fluids, the optimal solution induces the flow in a diagonal direction. Therefore, it can be inferred that optimization increased the interaction length between the two fluids. This approach of extending the distance over which the flow paths intersect was also implemented by Oh et al. through the introduction of internal walls [#link(<ref-22>)[22]], and it can be considered a rational method for enhancing the heat exchange performance.

In addition, the velocity distribution exhibited a clearer variation in the optimized lattice than in the uniform lattice. Oh et al. argued that a uniform velocity distribution is optimal for heat-exchange efficiency in their optimization of graded lattice geometries [#link(<ref-30>)[30]]\; however, this conclusion was derived under the condition that the flow passages on the hot and cold sides were identical. In contrast, because our study optimized the flow priority between the two fluids, a different result was obtained.

These advantages in the flow behavior are reflected in the temperature distributions of each fluid, as shown in Fig. @thermalanalysis. For example, from the perspective of the hot-fluid channel, the flow near the left wall became stronger because it was close to both the inlet and outlet of the hot channel. In contrast, on the cold-fluid side, this region is farther from the inlet and outlet; therefore, the influence of the hot-fluid flow becomes more pronounced, and the temperature decreases less readily. Near the right wall, the opposite behavior occurred. As a result, a temperature imbalance was generated, that is, higher temperatures near the left wall and lower temperatures near the right wall. However, in the optimized lattice, the induced diagonal crossing of the flow reduced the temperature difference between the left and right sides of the heat exchanger. Such a flat and unbiased temperature distribution is typically observed in straight heat exchangers; however, it is difficult to achieve this in more complex configurations such as U-shaped flows. Therefore, this result can be regarded as a clear benefit of the numerical optimization.

These characteristics were consistently observed in both the macroscopic and detailed geometry analyses with respect to the flow and temperature distributions. Although the macroscopic analysis exhibited quantitative discrepancies relative to the detailed analysis, as shown by the heat transfer rate in Fig. @heattransf and the pressure loss in Fig. @pressure, it can be concluded that the macroscopic model is sufficiently reliable for qualitative flow priority optimization.

However, the macroscopic model clearly predicted higher pressure losses than the detailed model; a similar tendency was observed in our previous studies. In Ref. [#link(<ref-48>)[48]], the authors attributed the overestimation of pressure loss in the macroscopic model to the fact that the effective material properties were derived under the assumption of perfect lattice periodicity, while the optimized lattice becomes non-periodic, thereby invalidating the applicability of those effective properties. This theoretical limitation also applies to the present study, and the pressure-loss discrepancy is considered to have arisen for the same reason.

Figures @heattransf and @pressure show that the experimental results agree well with those of the detailed-geometry analysis, thereby confirming that the optimal solution is practically attainable. However, in Fig. @pressure, only the hot-fluid channel of the optimized lattice exhibits a significantly larger pressure loss in the experiment than in the simulations. To investigate the reason for this, we first note that in the optimized lattice, the optimization of the flow priority can result in the throat of one of the fluid channels becoming extremely narrow, with a minimum diameter as small as $phi.alt 0.5 thin upright(m m)$. Because the shape resolution of LPBF is fixed by the equipment and processing conditions, the smaller the fabricated geometry, the greater the risk of geometric inaccuracies [#link(<ref-60>)[60]]. Although the fabricated specimen shown in Fig. @optimalgeom (c) generally reproduces the 3D model, geometric imperfections can be observed when focusing on the throat region. Such imperfections are likely to have a more severe impact on the hot-fluid channel, resulting in a significantly larger pressure loss. This issue can be resolved by increasing the size of the reference unit-cell, which was set to 5 mm in this study.

Finally, because the optimization in this study was performed under the condition of a fixed pressure difference applied between the inlet and outlet, the resulting optimal solution yielded different flow rates on the hot and cold sides. For a simpler performance evaluation, both flow rates were equalized, and the system was re-evaluated; the results are shown in Fig. @comparison. Macroscopic simulations, detailed-geometry simulations, and experiments were conducted under this equal-flow condition. Based on a comparison of the heat exchange performance at the same flow rate (experimentally measured), the optimized lattice exhibited an average improvement of 28.7% compared to the uniform lattice. This indicates that the structure obtained in this study is clearly superior to the uniform lattice, even when the flow rates differ slightly from those used to obtain the optimal solution and are adjusted to be equal on the hot and cold sides.

#figure(image("graphics/fig14.jpg"),
  caption: [
    Comparison of heat exchange rate under equal flow-rate conditions for the hot and cold fluids. (a) Uniform lattice. (b) Optimal lattice
  ]
)
<comparison>

It can also be observed that the discrepancy between the macroscopic and detailed geometry analyses increases as the flow rate increases. A similar trend was observed in the pressure loss results shown in Fig. @pressure, suggesting that the error originates from the flow analysis.

The reason for this flow rate dependent error in the macroscopic flow model is that the effective material properties used in the macroscopic analysis were derived by applying a pressure difference of 500 Pa over a channel length of 0.1 m, as described in Section 3.1.1. This pressure difference corresponds to a flow rate of approximately 300--400 mL/min. In other words, the model yielded good accuracy within the flow-rate range. However, as the flow rate increases, the validity of the effective material properties deteriorates, leading to reduced accuracy.

= Conclusion
<conclusion>
In this paper, we propose a macroscopic analysis model for a two-fluid heat exchanger by incorporating a TPMS Primitive lattice. Macroscopic flow analysis was conducted based on the Darcy--Forchheimer theory. Assuming that heat transfer occurs only between the fluid and the TPMS walls, we formulated a macroscopic heat transfer model by introducing a volumetric heat-transfer coefficient representing the macroscopic heat transfer rate per unit volume.

To optimize the priority between the hot and cold flows within the heat exchanger, namely, the channel widths, we employed the isosurface threshold of the primitive lattice as the design variable and developed a lattice-distribution optimization algorithm based on the aforementioned macroscopic analysis model. Optimization was then performed for a planar heat exchanger in which both the hot and cold fluids formed U-shaped flow paths. A stable optimal solution was obtained, and its validity was examined through detailed-geometry analysis and experiments conducted using a metal LPBF. The optimal solution derived from the macroscopic model also demonstrated a clear performance advantage over a uniform lattice in the experimental results. A physical interpretation of this improvement is that the optimization effectively increases the interaction length between the hot and cold fluids, enabling more uniform temperature distributions in each fluid.

However, several limitations of the proposed macroscopic analysis and optimization methods have been identified. The accuracy of the macroscopic analysis depends on the pressure-gradient conditions under which the effective material properties were derived; therefore, it becomes difficult to maintain accuracy when the pressure or flow rate varies over a wide range. Furthermore, when the optimization produces lattices with narrow throats, geometric imperfections can occur during fabrication, leading to significantly increased pressure loss in the experiments.

Finally, the optimization of the flow priority is a general methodology that can be applied not only to primitive lattices but also to other TPMS lattices and is not limited to U-shaped counterflow channels. Therefore, to demonstrate the versatility of the proposed method, it should be tested on various types of heat exchangers with different flow-path configurations and different TPMS lattices.

#heading(level: 1, numbering: none)[Acknowledgments]
<acknowledgments>
This study was partly funded by JSPS KAKENHI (Grant No. 23H01324).

#set heading(numbering: none)
= References

#par[[1] W.~E. Frazier, Metal additive manufacturing: A review, J. Mater. Eng. Perform. 23~(6) (2014) 1917--1928.] <ref-1>

#par[[2] D.~Herzog, V.~Seyda, E.~Wycisk, C.~Emmelmann, Additive manufacturing of metals, Acta Mater. 117 (2016) 371--392.] <ref-2>

#par[[3] M.~S. Shinde, K.~M. Ashtankar, Additive manufacturing--assisted conformal cooling channels in mold manufacturing processes, Adv. Mech. Eng. 9~(5) (2017) 1687814017699764.] <ref-3>

#par[[4] S.~Feng, A.~M. Kamat, Y.~Pei, Design and fabrication of conformal cooling channels in molds: Review and progress updates, Int. J. Heat Mass Transf. 171 (2021) 121082.] <ref-4>

#par[[5] I.~Kaur, P.~Singh, State-of-the-art in heat exchanger additive manufacturing, Int. J. Heat Mass Transf. 178 (2021) 121600.] <ref-5>

#par[[6] S.~A. Niknam, M.~Mortazavi, D.~Li, Additively manufactured heat exchangers: a review on opportunities and challenges, Int. J. Adv. Manuf. Technol. 112~(3) (2021) 601--618.] <ref-6>

#par[[7] M.~Wong, S.~Tsopanos, C.~J. Sutcliffe, I.~Owen, Selective laser melting of heat transfer devices, Rapid Prototyp. J. 13~(5) (2007) 291--297.] <ref-7>

#par[[8] M.~Wong, I.~Owen., C.~J. Sutcliffe, A.~Puri, Convective heat transfer and pressure losses across novel heat sinks fabricated by selective laser melting, Int. J. Heat Mass Tran. 52~(1-2) (2009) 281--288.] <ref-8>

#par[[9] H.~Brooks, K.~Brigden, Design of conformal cooling layers with self-supporting lattices for additively manufactured tooling, Addit. Manufact. 11 (2016) 16--22.] <ref-9>

#par[[10] B.~B. Kanbur, S.~Shen, Y.~Zhou, F.~Duan, Thermal and mechanical simulations of the lattice structures in the conformal cooling cavities for 3d printed injection molds, Mater. Today: Proc. 28 (2020) 379--383.] <ref-10>

#par[[11] C.~Tan, D.~Wang, W.~Ma, Y.~Chen, S.~Chen, Y.~Yang, K.~Zhou, Design and additive manufacturing of novel conformal cooling molds, Mater. Des. 196 (2020) 109147.] <ref-11>

#par[[12] A.~H. Schoen, Infinite periodic minimal surfaces without self-intersections, NASA Technical Note 5541.] <ref-12>

#par[[13] J.~Kim, D.~Yoo, 3d printed compact heat exchangers with mathematically defined core structures, J. Comput. Des. Eng. 7~(4) (2020) 527--550.] <ref-13>

#par[[14] W.~Li, G.~Yu, Z.~Yu, Bioinspired heat exchangers based on triply periodic minimal surfaces for supercritical co2 cycles, Appl. Therm. Eng. 179 (2020) 115686.] <ref-14>

#par[[15] M.~Alteneiji, M.~I.~H. Ali, K.~A. Khan, R.~K.~A. Al-Rub, Heat transfer effectiveness characteristics maps for additively manufactured tpms compact heat exchangers, Energy Storage and Saving 1~(3) (2022) 153--161.] <ref-15>

#par[[16] J.~Iyer, T.~Moore, D.~Nguyen, P.~Roy, J.~Stolaroff, Heat transfer and pressure drop characteristics of heat exchangers based on triply periodic minimal and periodic nodal surfaces, Appl. Therm. Eng. 209 (2022) 118192.] <ref-16>

#par[[17] W.~Li, W.~Li, Z.~Yu, Heat transfer enhancement of water-cooled triply periodic minimal surface heat exchangers, Appl. Therm. Eng. 217 (2022) 119198.] <ref-17>

#par[[18] S.~Gao, S.~Qu, J.~Ding, H.~Liu, X.~Song, Influence of cell size and its gradient on thermo-hydraulic characteristics of triply periodic minimal surface heat exchangers, Appl. Therm. Eng. 232 (2023) 121098.] <ref-18>

#par[[19] D.~Liang, C.~Shi, W.~Li, W.~Chen, M.~K. Chyu, Design, flow characteristics and performance evaluation of bioinspired heat exchangers based on triply periodic minimal surfaces, Int. J. Heat Mass Transf. 201 (2023) 123620.] <ref-19>

#par[[20] D.~Liang, K.~Yang, H.~Gu, W.~Chen, M.~K. Chyu, The effect of unit size on the flow and heat transfer performance of the Schwartz-D heat exchanger, Int. J. Heat Mass Transf. 214 (2023) 124367.] <ref-20>

#par[[21] D.~Mahmoud, S.~R.~S. Tandel, M.~Yakout, M.~Elbestawi, F.~Mattiello, S.~Paradiso, C.~Ching, M.~Zaher, M.~Abdelnabi, Enhancement of heat exchanger performance using additive manufacturing of gyroid lattice structures, Int. J. Adv. Manuf. Technol. 126~(9-10) (2023) 4021--4036.] <ref-21>

#par[[22] S.~Oh, C.~An, B.~Seo, J.~Kim, C.~Y. Park, K.~Park, Functional morphology change of TPMS structures for design and additive manufacturing of compact heat exchangers, Addit. Manuf. 76 (2023) 103778.] <ref-22>

#par[[23] B.~W. Reynolds, C.~J. Fee, K.~R. Morison, D.~J. Holland, Characterisation of Heat Transfer within 3D Printed TPMS Heat Exchangers, Int. J. Heat Mass Transf. 212 (2023) 124264.] <ref-23>

#par[[24] T.~Röver, M.~Kuehne, F.~Bischop, L.~Clague, B.~Bossen, C.~Emmelmann, Design and numerical assessment of an additively manufactured Schwarz diamond triply periodic minimal surface fluid-fluid heat exchanger, J. Laser Appl. 35~(4) (2023) 042071.] <ref-24>

#par[[25] J.~Wang, K.~Chen, M.~Zeng, T.~Ma, Q.~Wang, Z.~Cheng, Assessment of flow and heat transfer of triply periodic minimal surface based heat exchangers, Energy 282 (2023) 128806.] <ref-25>

#par[[26] K.~Yan, J.~Wang, L.~Li, H.~Deng, Numerical investigation into thermo-hydraulic characteristics and mixing performance of triply periodic minimal surface-structured heat exchangers, Appl. Therm. Eng. 230 (2023) 120748.] <ref-26>

#par[[27] Y.~Song, Y.~Sun, Z.~Zou, M.~Li, W.~Chen, F.~Du, W.~Zheng, M.~Hao, Systematic study of the thermal and hydraulic characteristics of a heat exchanger based on the Schwartz-D structure for aviation application, Int. Commun. Heat Mass Transf. 156 (2024) 107611.] <ref-27>

#par[[28] J.~Wang, C.~Qian, X.~Qiu, B.~Yu, L.~Yan, J.~Shi, J.~Chen, Numerical and experimental investigation of additive manufactured heat exchanger using triply periodic minimal surfaces (TPMS), Therm. Sci. Eng. Prog. 55 (2024) 103007.] <ref-28>

#par[[29] K.~Yan, H.~Deng, Y.~Xiao, J.~Wang, Y.~Luo, Thermo-hydraulic performance evaluation through experiment and simulation of additive manufactured Gyroid-structured heat exchanger, Appl. Therm. Eng. 241 (2024) 122402.] <ref-29>

#par[[30] S.~H. Oh, J.~E. Kim, C.~H. Jang, J.~Kim, C.~Y. Park, K.~Park, Multifunctional gradations of TPMS architected heat exchanger for enhancements in flow and heat exchange performances, Sci. Rep. 15~(19931) (2025) 1--18.] <ref-30>

#par[[31] C.~Qian, J.~Wang, X.~Qiu, R.~Ma, W.~Xuan, B.~Yu, J.~Shi, J.~Chen, Optimization design and heat transfer investigation of TPMS compact heat exchanger based on field synergy principle, Int. Commun. Heat Mass Transf. 165 (2025) 109003.] <ref-31>

#par[[32] Y.~Xiao, H.~Deng, J.~Wang, K.~Yan, Numerical investigation of functional modulation in Gyroid-type TPMS structures: Convex and concave-convex geometries, Int. Commun. Heat Mass Transf. 169 (2025) 109536.] <ref-32>

#par[[33] K.~Yan, H.~Deng, Y.~Wu, J.~Wang, Y.~Huang, Effects of lattice geometric manipulation on thermo-hydraulic performance of Gyroid-structured heat exchanger: A numerical study, Int. J. Heat Mass Transf. 248 (2025) 127217.] <ref-33>

#par[[34] K.~Yan, H.~Deng, Y.~Wu, T.~Yu, Y.~Xiao, J.~Wang, Gyroid-structured heat exchanger optimization via lattice geometric manipulation for enhanced thermo-hydraulic performance: an experimental and numerical research, Int. J. Therm. Sci. 215 (2025) 109966.] <ref-34>

#par[[35] F.~Zhang, J.~Wang, C.~Qian, J.~Shi, B.~Yu, J.~Chen, Performance comparison and analysis of gradient-optimized triply periodic minimal surface heat exchangers based on field synergy principle, Appl. Therm. Eng. 275 (2025) 126887.] <ref-35>

#par[[36] Z.~Zhang, Z.~Li, J.~Zhang, J.~Wang, T.~Ma, L.~Yang, Numerical investigation on the effect of convex textured surface on thermal-hydraulic performance of gyroid-structured heat exchangers, Appl. Therm. Eng. 279 (2025) 127754.] <ref-36>

#par[[37] X.~Zhao, Z.~Zhang, L.~Wang, Y.~Man, J.~Wang, W.~Yang, D.~Zheng, Numerical investigation on thermal-hydraulic performance of gyroid heat exchangers with Voronoi-derived convex textures, Appl. Therm. Eng. 281 (2025) 128618.] <ref-37>

#par[[38] Z.~Zou, W.~Chen, Y.~Song, M.~Li, S.~Li, W.~Huang, Y.~Sun, X.~Tian, M.~Hao, Experimental investigation of the performance of an Industrial-Grade Schwartz-D heat exchanger, Appl. Therm. Eng. 270 (2025) 126243.] <ref-38>

#par[[39] P.~Zhang, J.~Toman, Y.~Yu, E.~Biyikli, M.~Kirca, M.~Chmielus, A.~C. To, Efficient design-optimization of variable-density hexagonal cellular structure by additive manufacturing: Theory and validation, ASME J. Manuf. Sci. Eng. 137~(2) (2015) 021004.] <ref-39>

#par[[40] A.~Clausen, N.~Aage, O.~Sigmund, Exploiting additive manufacturing infill in topology optimization for improved buckling load, Engineering 2~(2) (2016) 250--257.] <ref-40>

#par[[41] J.~M. Guedes, N.~Kikuchi, Preprocessing and postprocessing for materials based on the homogenization method with adaptive finite element methods, Comput. Meth. Appl. Mech. Eng. 83~(2) (1990) 143--198.] <ref-41>

#par[[42] E.~Andreassen, B.~S. Lazarov, O.~Sigmund, Design of manufacturable 3d extremal elastic microstructure, Mech. Mater. 69~(1) (2014) 1--10.] <ref-42>

#par[[43] M.~P. Bendsøe, N.~Kikuchi, Generating optimal topologies in structural design using a homogenization method, Comput. Meth. Appl. Mech. Eng. 71~(2) (1988) 197--224.] <ref-43>

#par[[44] M.~P. Bendsøe, O.~Sigmund, Topology Optimization: Theory, Methods, and Applications, Springer-Verlag, Berlin, 2003.] <ref-44>

#par[[45] A.~Takezawa, X.~Zhang, M.~Kato, M.~Kitamura, Method to optimize an additively-manufactured functionally-graded lattice structure for effective liquid cooling, Addit. Manufact. 28 (2019) 285--298.] <ref-45>

#par[[46] A.~Takezawa, X.~Zhang, M.~Kitamura, Optimization of an additively manufactured functionally graded lattice structure with liquid cooling considering structural performances, Int. J. Heat Mass Trans. 143 (2019) 118564.] <ref-46>

#par[[47] A.~Takezawa, K.~Matsui, S.~Murakoshi, K.~Taniguchi, R.~Moritoyo, M.~Kitamura, Validity of the quasi-2d optimal variable density lattice for effective liquid cooling based on darcy--forchheimer theory, Therm. Sci. Eng. Prog. 55 (2024) 102898.] <ref-47>

#par[[48] K.~Yanagihara, S.~Murakoshi, A.~Takezawa, Fin angles optimization of water-cooled plate-fin heat sink based on anisotropic darcy--forchheimer theory, Int. J. Heat Mass Transf. 236 (2025) 126325.] <ref-48>

#par[[49] J.~C. Ward, Turbulent flow in porous media, J. Hydraul. Div. 90~(5) (1964) 1--12.] <ref-49>

#par[[50] D.~D. Joseph, D.~A. Nield, G.~Papanicolaou, Nonlinear equation governing flow in a saturated porous medium, Water Resour. Res. 18~(4) (1982) 1049--1052.] <ref-50>

#par[[51] D.~A. Nield, A.~Bejan, Convection in Porous Media, Springer New York, 2013.] <ref-51>

#par[[52] L.~B. Younis, R.~Viskanta, Experimental determination of the volumetric heat transfer coefficient between stream of air and ceramic foam, Int. J heat Mass Transf. 36~(6) (1993) 1425--1434.] <ref-52>

#par[[53] L.~C. Høghøj, D.~R. Nørhave, J.~Alexandersen, O.~Sigmund, C.~S. Andreasen, Topology optimization of two fluid heat exchangers, Int. J. Heat Mass Transf. 163 (2020) 120543.] <ref-53>

#par[[54] H.~Kobayashi, K.~Yaji, S.~Yamasaki, K.~Fujita, Topology design of two-fluid heat exchange, Struct. Multidisc. Optim. 63~(2) (2021) 821--834.] <ref-54>

#par[[55] K.~Vafai, C.~L. Tien, Boundary and inertia effects on flow and heat transfer in porous media, Int. J. Heat Mass Trans. 24~(2) (1981) 195--203.] <ref-55>

#par[[56] K.~Vafai, C.~L. Tien, Boundary and inertia effects on convective mass transfer in porous media, Int. J. Heat Mass Trans. 25~(8) (1982) 1183--1190.] <ref-56>

#par[[57] C.~T. Hsu, P.~Cheng, Thermal dispersion in a porous medium, Int. J. Heat Mass Trans. 33~(8) (1990) 1587--1597.] <ref-57>

#par[[58] J.~C. Simmons, X.~Chen, A.~Azizi, M.~A. Daeumer, P.~Y. Zavalij, G.~Zhou, S.~N. Schiffres, Influence of processing and microstructure on the local and bulk thermal conductivity of selective laser melted 316l stainless steel, Addit. Manufact. 32 (2020) 100996.] <ref-58>

#par[[59] K.~Svanberg, The method of moving asymptotes- a new method for structural optimization, Int. J. Numer. Meth. Eng. 24~(2) (1987) 359--373.] <ref-59>

#par[[60] A.~Takezawa, Y.~Koizumi, M.~Kobashi, High-stiffness and strength porous maraging steel via topology optimization and selective laser melting, Addit. Manufact. 18 (2017) 194--202.] <ref-60>
