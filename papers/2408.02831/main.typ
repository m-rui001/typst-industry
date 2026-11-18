// Adapted from arXiv:2408.02831v1 by Malenica, Zhang, and Angst.
// https://arxiv.org/abs/2408.02831v1
// Original work: CC BY 4.0, https://creativecommons.org/licenses/by/4.0/
#set page(paper: "a4", margin: 20mm)
#set text(size: 10pt, lang: "en")
#set par(justify: true)
#set heading(numbering: "1.1")
#set math.equation(numbering: "(1)")
#title[Towards improved understanding of spontaneous imbibition into dry porous media using pore-scale direct numerical simulations]
#align(center)[Luka Malenica, Zhidong Zhang, and Ueli Angst]
#align(center)[Institute for Building Materials (IfB), ETH Zurich, 8093 Zurich, Switzerland]
#align(center)[Correspondence: #raw("lmalenica@ethz.ch")]

#heading(level: 1, numbering: none)[Abstract]
<abstract>
Traditional approaches to mathematically describe spontaneous imbibition are usually based on either macro-scale models, such as Richards equation, or simplified pore-scale models, such as the bundle of capillary tubes (BCTM) or pore-network modeling (PNM). It is well known that such models cannot provide full microscopic details of the multiphase flow processes and that many pore-scale mechanisms still lack proper mathematical descriptions. To improve the predictive capabilities of traditional models, a fundamental understanding of pore-scale dynamics is needed. The focus of this paper is obtaining detailed insight and consistent explanation of particular processes during capillary-controlled water imbibition into dry porous media. We use two-dimensional model geometries and perform fully dynamic volume-of-fluid based direct numerical simulations of air-water multiphase flow at the pore-scale, to study processes that generally are not considered in traditional models. More specifically, we investigate differences between converging and diverging geometries, dynamic pressure and meniscus reconfiguration during pore-filling events, and the influence of inertia and pore size on imbibition dynamics and the occurrence of capillary barriers. Furthermore, we perform a detailed comparison between non-interacting and interacting BCTM and study the impact of the narrow contractions on imbibition dynamics and the trapping of the non-wetting phase. Obtained knowledge can be used to improve predictive models, which are broadly relevant considering the importance of spontaneous imbibition in many different natural and industrial processes.

#heading(level: 1, numbering: none)[Keywords]
<keywords>
Gas-liquid multiphase flow \; Direct numerical simulations \; Pore-filling \; Capillary barriers \; Inertia \; Cross-flow \; Narrow contraction \; Air trapping

= Introduction
<sec_introduction>
Spontaneous imbibition is a process in which a wetting fluid is spontaneously drawn into porous media displacing a nonwetting fluid due to capillary action \[1\]. Such spontaneous invasion of the wetting phase is important in many scientific and engineering applications, such as hydrocarbon recovery \[2\], $C O_2$ sequestration \[3\], water percolation through the unsaturated zone \[4\], moisture transport in building materials \[5\], water uptake by plants \[6\], design of waterproof clothing \[7\], inkjet printing \[8\] or micro heat pipes \[9\], just to name a few.

Spontaneous imbibition is a complex process governed by many different properties, particularly pore space structure and the pore size distribution, wetting properties (fluid--fluid and porous media--fluid surface interactions), initial water saturation, and the density/viscosity ratios of involved fluids. Despite a significant amount of research done over the last few decades \[10\], \[11\], \[12\], \[13\], significant gaps between simulations, laboratory results and field-scale measurements prevail in complete understanding of flow phenomena in porous media. Thus, a deeper fundamental understanding of spontaneous imbibition processes is essential and has a large potential to improve our predictive capabilities.

Traditional approaches to mathematically describe spontaneous imbibition are usually based on simplified models. At the macro-scale, the Darcy law for saturated flow \[14\] is extended by introducing the relative permeability concept \[15\] and used to study the multiphase flow in porous media \[16\]. Historically, two independent research aspects led to the development of continuum-scale multiphase flow models. In hydrology, soil scientists were mostly interested in water movement through unsaturated soil. For such applications, neglecting the air phase was often reasonable and led to the development of the well-known Richards equation \[17\] and many applications afterward \[18\], \[19\], \[20\]. On the other hand, in petroleum engineering, both phases (usually liquid-liquid system) need to be considered, which led to the development of two-phase flow equations for porous media \[21\]. In both cases, similar assumptions were used. First, the volume averaging technique was applied to derive continuum equations, meaning that flow variables, such as capillary pressure, velocity or saturation, represent averaged values over some representative elementary volume (REV). Moreover, multiphase flow is a fundamentally dynamic process where one phase replaces the other, thus the inherent assumption of static configuration of fluid arrangements inside REV is not actually valid \[22\]. Furthermore, the dependence on the flow rate and viscous coupling between phases were usually ignored which are important physical factors affecting multiphase flow in porous media. Accuracy of the macro-scale approaches highly depends on the relative permeability curves which generally assume that macroscopic capillary pressure is a function of saturation only. However, it is well known that the interaction of capillary and viscous forces at the pore-scale is highly complex and that different pore-scale properties, such as contact angle, pore morphology, viscosity ratio and interfacial area, among others, play important roles \[23\]. Different attempts to understand and to include various individual effects into relative permeability curves were published \[24\], \[25\], \[26\], \[27\], \[28\], \[29\]\; however, many oversimplifications of the pore-scale physics still persist and the validity of relative permeability curves is still an open question.

Parallel to the development of macro-scale models, pore-scale modeling has evolved \[30\]. Such models aim to provide more detailed microscopic insight into multiphase flow without empirical macroscopic properties such as relative permeability \[22\]. Pore-scale studies started by work of Lucas \[31\] and Washburn \[32\] where co-current imbibition of water displacing air in a single capillary tube was studied and led to the development of the well-known Lucas-Washburn equation (LWE). Since then, many theoretical and experimental studies led to modifications and extensions of LWE to account for different effects, such as gravity, inertia, tortuosity, dynamic contact angle, different cross-section shapes and axial variations, among others \[12\], \[33\]. LWE still represents a fundamental equation for modeling imbibition in a single capillary tube, however, it is well known that there are many challenges when applying it to model realistic porous media. Hence, the bundle of capillary tubes models (BCTM) were developed \[34\], \[35\], \[36\], extending the basic LWE approach to better represent realistic complex pore spaces. The main idea was to represent a porous medium as a system of parallel well-defined tubes with varying sizes. Initially, independent capillaries without fluid transfer between tubes were employed. In such models, capillaries with larger diameters are filled first, which however contradicts the behavior observed in real porous media. Thus, interacting capillary bundle tube models with cross-flow between capillaries were developed \[37\], \[38\], \[39\]. Interacting BCTM enabled additional insight into the fundamental mechanism of spontaneous imbibition and are still extensively used and under development \[40\], \[41\], \[42\]. However, in addition to simplified equations, their main drawback is over-simplified geometry representation which, with advances in high-resolution imaging and image processing techniques \[43\], \[44\], \[45\], \[46\], \[47\], it is becoming even more important for modern modeling tools to account for realistic geometrical features of the porous media.

To capture the complex topology of real pore structures more appropriately, the pore-network models (PNM) were developed \[48\], \[49\], \[50\]. In PNM, multiphase flow is modeled in a pore-space represented as a network of connected pore bodies and pore throats. Initially, quasistatic PNM similar to invasion-percolation theory \[51\] were developed. Such models were used to simulate capillary pressure equilibrium states, which has shown appropriate for predicting capillary-dominated systems \[50\], \[52\]. To account for viscous forces and transient processes of multiphase flow between equilibrium states, dynamic PNM were developed \[53\], \[54\], \[55\]. PNM have undergone significant developments and nowadays can accommodate irregular lattices, wetting layer flow, wettability heterogeneity, as well as a variety of different physical processes \[56\], \[57\], \[58\], \[59\]. PNM are extensively used due to their computational efficiency and ability to construct pore-space networks directly from micro-CT images. However, network elements (pores and throats) of real pore spaces are generally approximated with idealized objects, such as spheres and cylinders. In addition to simplifications of the pore-space geometry, different flow assumptions relying on invasion-percolation theory sacrifice the accuracy of multiphase flow description as a trade-off for computational efficiency \[60\]. Nonetheless, various relevant pore-scale processes, such as interface reconfigurations, pore-filling rules or trapping mechanisms are still not fully understood and lack adequate mathematical description within the PNM framework.

On the other hand, direct numerical simulations (DNS), often called direct pore-scale modeling (DPSM) within porous media applications, is an approach that does not require macroscopic transport properties or assumptions about pore-scale mechanisms like above described models. All variables are directly computed at the pore-scale level enabling fundamental insight into the microscopic behavior of pore-scale dynamics by solving full governing equations. DNS can handle geometries of arbitrary complexities, thus it can be applied directly on digital twins of real porous media (e.g. acquired through micro-CT or FIB-SEM tomography) without significant simplifications of pore-space geometries. While there are many applications of DNS for studying single phase flow \[61\], \[62\], \[63\], \[64\], it was only in the last ten years that DNS started to be applied for studying multiphase flow in porous media \[65\], \[66\], \[67\], \[68\], \[69\]. Different numerical approaches have been adjusted for pore-scale simulations of multiphase flow \[70\], such as lattice Boltzmann method (LBM) \[71\], smoothed particle hydrodynamics (SPH) \[72\], level set method (LSM) \[73\], volume of fluid (VOF) method \[74\] and phase field method \[75\]. While DNS simulations of multiphase flow are computationally demanding and require sophisticated numerical algorithms, their main strength is that they can provide insights into variables and processes that conventional models are not able to or that are too difficult to measure experimentally. Thus, they can help us obtain deeper fundamental understanding and ensure that the pore-scale physics is accurately scaled to maintain accuracy and relevance or macroscale models which, together with development of numerical methods \[76\], \[77\], \[78\], should lead to the development of improved macro-scale and predictive pore-scale models \[79\], \[80\], \[81\], \[82\].

This work aims to improve the understanding of spontaneous imbibition mechanisms using direct numerical simulations. Most DNS applications so far were related to hydrocarbon recovery, i.e. water-oil systems. As one of our particular interests is understanding the capillary absorption of water in building materials, such as concrete, stone or brick, we consider the immiscible flow of air and water in this work. However, the significance of the air-water system extends beyond building materials and applies to various fields, such as rainfall infiltration or water uptake by plants, for example. We believe understanding simple systems where particular processes can be investigated in detail is essential before tackling more complex problems and geometries. Thus, in this work, we focus on relatively simple two-dimensional geometries and investigate different effects, such as pore- and throat-filling events and the importance of inertia (at different scales) on the occurrence of capillary barriers during spontaneous imbibition of water in dry porous media. Furthermore, we perform detailed DNS comparisons between classical (non-interacting) and interacting BCTM and demonstrate some new insights. Finally, additional reasons and profound insights into why water imbibes faster through smaller capillaries than in large ones (even without cross-flow between capillaries like in interacting BCTM) are demonstrated together with its effect on the air trapping mechanism. We believe that such a basic understanding of flow physics is of essential importance for developing reliable large-scale models.

= Methodology
<sec_methodology>
== Governing equations for two-phase flow at the pore-scale
<subsec_fullEQ>
=== Equations of motion
<subsec_NS>
In this work, we consider the incompressible flow of two immiscible Newtonian phases. Such flow can be described by mass conservation and one-fluid formulation of Navier-Stokes equations (NSE) for momentum conservation given by \[83\]:

$ nabla dot.op upright(bold(u)) = 0 $ <eq:MassConserv>

$ frac(partial rho upright(bold(u)), partial t) + nabla dot.op \( rho upright(bold(u)) upright(bold(u)) \) = - nabla p + nabla dot.op { mu \[ nabla upright(bold(u)) + \( nabla upright(bold(u)) \)^T \] } + rho upright(bold(g)) + upright(bold(f))_(s t) $ <eq:MomentumConserv>

where $upright(bold(u))$ is velocity vector, $t$ is time, $p$ is pressure, $rho$ is density, $mu$ is viscosity, $upright(bold(g))$ is gravity vector and $upright(bold(f))_(s t)$ is surface tension force. For constant interfacial tension, the surface tension force can be described by the Continuous Surface Force (CSF) model \[84\]:

$ upright(bold(f))_(s t) = sigma kappa upright(bold(n)) delta_Gamma $ <eq:CSF>

where $sigma$ is interfacial tension, $kappa$ is interface curvature, $upright(bold(n))$ is normal vector to fluid/fluid interface and $delta$ is Dirac delta function located at the interface $Gamma$.

Equations (@eq:MassConserv)-(@eq:MomentumConserv) are valid for the whole flow field even in the case when fluid properties, such as density and viscosity, change discontinuously. However, different fluids must be identified. In this work, the algebraic Volume of Fluid (VOF) interface capturing approach \[85\] is used to distinguish between different fluids using a fixed computational grid.

=== Volume of fluid (VOF) method
<subsec_VOF>
In the VOF approach, the interface is tracked using an indicator function $alpha$ which represents the volume fraction of one of the fluids in each grid cell. The indicator function takes value $alpha = 1$ for the first fluid and $alpha = 0$ for the second fluid, while the interface is located at the position where fluid properties change abruptly. Using the indicator function field, the density and viscosity are defined using their single-filed values:

$ rho = alpha rho_1 + \( 1 - alpha \) rho_2 $ <eq:vof_rho>

$ mu = alpha mu_1 + \( 1 - alpha \) mu_2 $ <eq:vof_mu>

where $rho_i$ and $mu_i$ are density and viscosity of phase $i$. Similarly, the velocity and pressure fields can be defined as:

$ upright(bold(u)) = alpha upright(bold(u))_1 + \( 1 - alpha \) upright(bold(u))_2 $ <eq:vof_u>

$ p = alpha p_1 + \( 1 - alpha \) p_2 $ <eq:vof_p>

The additional transport equation needs to be solved to advect indicator function (i.e. fluid/fluid interface):

$ frac(partial alpha, partial t) + nabla dot.op \( alpha upright(bold(u)) \) = 0 $ <eq:VOF>

In the VOF method, the normal vector needed to calculate surface tension force (@eq:CSF) is defined by:

$ upright(bold(n)) = frac(nabla alpha, \| \| nabla alpha \| \|) $ <eq:vof_normal>

while the curvature can be calculated by taking the divergence of the normal field as:

$ kappa = nabla dot.op upright(bold(n)) = nabla dot.op #scale(x: 240%, y: 240%)[\(] frac(nabla alpha, \| \| nabla alpha \| \|) #scale(x: 240%, y: 240%)[\)] $ <eq:vof_curvature>

Wetting properties of the porous media are defined by specifying a normal vector to enforce equilibrium contact angle $theta$ at the fluid/fluid/solid contact line:

$ upright(bold(n)) = upright(bold(n))_s c o s theta + upright(bold(t))_s s i n theta $ <eq:normal_BC>

where $n_s$ and $t_s$ are the normal and tangent unit vectors to the solid surface, respectively.

In this work, #emph[interGCFoam] solver implemented in GeoChemFoam code is used for the numerical solution of governing equations presented in this section. GeoChemFoam is a state-of-the-art OpenFOAM-based numerical solver particularly developed for direct numerical simulations at pore-scale and has been applied to a variety of problems, such as upscaling single-phase flow in a micro-porous carbonate \[81\], wettability alteration during low-salinity flooding \[68\], dissolution of $C O_2$ bubbles \[86\], \[87\], mineral dissolution \[88\], \[89\], species transfer across fluid interfaces \[90\], modeling flow and heat transfer \[91\] and multiphase reactive transport \[92\] using micro-CT images of real porous media.

#emph[interGCFoam] uses a collocated finite volume grid with a predictor-corrector strategy based on the Pressure Implicit Splitting Operator (PISO) algorithm \[93\] and explicit coupling between NSE and interface advection equation (@eq:VOF). It implements different numerical procedures to improve the accuracy and stability of the classical VOF approach which is needed for demanding pore-scale multiphase flow modeling. For more details regarding numerical procedures implemented in GeoChemFoam, we refer to \[92\], \[94\].

== Materials, numerical setups and fluid properties
<subsec_system>
Our research interest is understanding water absorption into cement-based materials, such as mortar or concrete \[95\], with a special interest in air-water distribution at the steel-concrete interface as this is highly relevant for steel corrosion in reinforced concrete \[96\], \[97\]. The microstructure of cementitious materials is highly heterogeneous, with pore sizes ranging from nanometer to millimeter scale. Even though very fine (nm scale) porosity exists in such materials, larger capillary pores (in the µm range) are assumed to dominate water absorption properties \[98\]. Thus, most of the presented numerical setups are based on capillaries with radii between 1 and 20 µm. An additional example, ranging radius from 0.1 to 100 µm, was used to investigate the capillary size effects outside the mentioned range. Even though our primary interest is in cementitious porous materials, numerical setups are created to represent specific geometrical features of general porous media and are not in any way restricted to a single particular porous material.

Note that the term radius is used throughout the manuscript for simplicity. It actually represents the half-width of the capillary since the flow through a 2D capillary is equivalent to flow between two infinitely long parallel plates where curvature in the perpendicular direction is zero.

Moreover, in all examples, we consider air and water systems with the following fluid properties: $rho_w = 1000$ \[kg/m$""^3$\], $rho_a = 1.225$ \[kg/m$""^3$\], $mu_w = 10^(- 3)$ \[Pa s\], $mu_a = 1.81 dot.op 10^(- 5)$ \[Pa s\] and $sigma = 0.072$ \[N/m\], where subscripts $w$ and $a$ denote water and air phase, respectively. Gravitational acceleration $g$ \[m/s$""^2$\] is set to zero because its effects on the flow dynamics compared to the capillary forces are negligible due to the small capillaries and domain lengths considered in this work. The contact angle value is assumed to be constant and set to $theta$ = 5°, as our focus is on the air-water system under strongly water-wet conditions.

= Results and discussion
<sec_Results>
In this section, we present the numerical results together with discussions highlighting processes that are still poorly understood and generally not accounted for in simplified pore-scale models, such as PNM and BCTM. The verification examples, where DNS results are compared to analytical solutions (under both static and dynamic conditions), can be found in Supplementary Information.

== Understanding effects of abrupt changes in geometry on multiphase flow
<understanding-effects-of-abrupt-changes-in-geometry-on-multiphase-flow>
=== Pore-filling vs throat-filling
<subsec_PoreVSThroatFilling>
Firstly, we examine imbibition dynamics considering sharp changes in capillary shape, such as diverging and converging geometries. The former is a representative case of the pore-filling process, while the latter is of the throat-filling process. In general, most simplified pore-scale models, such as PNM or BCTM, do not account for what happens in the transition zone (the zone where geometry changes abruptly) but rely on the capillary pressure values and geometrical features (i.e., the radius of the capillary) before and after the transition zone. Here, we use simple geometries to demonstrate that dynamic effects occurring in the transition zone are important and can play a significant role in overall imbibition dynamics.

#figure([],
  caption: [
    Pressure distribution for two cases of abrupt pore geometry changes distinguishing between negative (blue) and positive (red) pressure zones and illustrating that pore filling (A) is a significantly slower process than throat filling (B). Dashed lines at time t=1.0 µs represent the air-water interface at t=0 (initial condition). The complete animation showing the full process can be found in the Supplementary Materials.
  ]
)
<fig_sGeom_06_A_vs_B>

Figure @fig_sGeom_06_A_vs_B shows the pressure distribution at six different times, where case A represents pore-filling while case B represents a throat-filling event. The radius of the narrow (throat) and wide (pore body) part of the capillary are chosen 1 µm and 2 µm, respectively. The domain's left and right ends are free inlet and outlet boundaries, respectively, where the fluid (either liquid or gas) can freely enter or leave the domain. The domain's top and bottom boundaries represent walls with a specified contact angle value ($theta$ = 5°). Dashed white lines on Figure #link(<fig_sGeom_06_A_vs_B>)[1a] represent (initially flat) air-water interface at t=0 (i.e., initial condition). As we consider spontaneous imbibition, the pressure boundary conditions at the inlet and outlet are set to zero ($p = 0$), so initially, there is no driving force in the time $t = 0$. However, because of interfacial tension between air and water and the wettability of water with solid boundaries (i.e., $c o s \( theta \) eq.not 0$) at the walls, this will lead to the formation of curved meniscus producing the non-zero capillary pressure so the capillary driven flow will occur.

A color map for pressure distribution is chosen in an equal range for both negative and positive values to clearly distinguish between under-pressure (blue) and over-pressure (red) fluid zones. In addition to 2D pressure plots, corresponding 1D pressure lines, representing pressure distribution along the central lines, are plotted (for 3 chosen times for each case) in Figure @fig_sGeom_06_A_vs_B_pLine where pressure jumps represent both (dynamic) capillary pressure $P_c$ values as well as the position of the interface.

#figure([],
  caption: [
    Pressure distribution along the central lines for chosen times from Figure @fig_sGeom_06_A_vs_B. pA represents pore-filling while pB represents throat-filling. The complete animation showing the full process can be found in the Supplementary Materials.
  ]
)
<fig_sGeom_06_A_vs_B_pLine>

In the beginning (before reaching the transition zone), the water imbibition is faster in the narrow capillary (case A) as visible in Figures #link(<fig_sGeom_06_A_vs_B>)[1a], #link(<fig_sGeom_06_A_vs_B>)[1b] and Figure @fig_sGeom_06_A_vs_B_pLine (black solid vs red solid line). This is due to inertia effects as the larger capillary (case B) contains a greater mass of water, which needs more time to be accelerated at the beginning of the simulation. If the distance to the transition zone was significantly longer, the meniscus in case B would (at some point) overtake the meniscus distance of case A, and imbibition in the wider capillary would be faster, as described by the basic Lucas-Washburn equation (LWE).

By looking at the pressure fields before reaching the transition zone (Figures #link(<fig_sGeom_06_A_vs_B>)[1a], #link(<fig_sGeom_06_A_vs_B>)[1b] and @fig_sGeom_06_A_vs_B_pLine (t=3.0µs)), it is visible that the water phase is experiencing negative pressure values (under-pressure) for both cases, which is generally expected for the wetting phase during the imbibition process. On the other hand, the air phase needs positive pressure downstream of the interface, as a pressure gradient is needed for air (being \"pushed\" by advancing meniscus) to flow toward the outlet boundary (where pressure is set to zero as the boundary condition for spontaneous imbibition). For case A, over-pressure values in the air phase are low and hardly distinguished from zero pressure values, while for case B, they are larger and non-negligible due to two main reasons: 1) larger volumetric discharge and 2) larger viscous dissipation due to a narrower radius downstream of the transition zone. However, even for case B, over-pressure values in the air phase are significantly lower than (absolute) under-pressure values in the water phase because air has significantly lower viscosity than water (water is approximately 55 times more viscous than air).

Particular focus lies on understanding processes once the interface reaches the transition zone. The throat-filling (case B) is an energetically favorable and rapid process, and fast penetration of water from the pore body to the throat can be observed (Figure #link(<fig_sGeom_06_A_vs_B>)[1b-e]). Multiple factors complementing each other are responsible for this. First, the meniscus transition from a wide pore body to a narrow throat is a quick process where the interface reaches throat walls almost instantaneously, allowing for fast reconfiguration to a stable interface with a large positive (concave) curvature in a narrower throat. Moreover, the reduction in the cross-sectional area will lead to a temporary build-up of (over-) pressure in the water phase, leading to the (temporary) meniscus speed-up even if the total flow rate decreases (due to the reduction of geometry). This over-pressure is expected to be released over time. Further, the larger curvature in the throat leads to larger capillary pressure (driving force), while the viscous dissipation in the upstream part is now reduced as the friction in the pore body is practically negligible due to the larger cross-sectional area compared to the narrow throat. This is visible by looking at evolution of the pressure curve slopes (red lines in Figure @fig_sGeom_06_A_vs_B_pLine), where pressure gradients are directly related to viscous dissipation. Eventually (Figure #link(<fig_sGeom_06_A_vs_B>)[1f]), once meniscus leaves the domain, there won't be driving force anymore, and after friction dissipates residual inertial effects, the flow rate will go to zero and uniform pressure distribution (p=0) is expected.

On the other hand, pore filling (case A) is an energetically highly unfavorable process as the air-water interface needs to bulge from a narrow throat into a wide pore body, resulting in negative capillary pressure, which is acting as an opposing force to the water imbibition as visible in Figure #link(<fig_sGeom_06_A_vs_B>)[1c]. Note that negative capillary pressure, in our case, implies positive water pressure and vice versa due to the definition of capillary pressure ($P_c = P_a - P_w$). The air-water interface must reach the pore body walls first (Figure #link(<fig_sGeom_06_A_vs_B>)[1d]) before it can obtain positive curvature again (#link(<fig_sGeom_06_A_vs_B>)[1e]). After it reaches pore body walls and establishes positive capillary pressure (leading to under-pressure of water phase once again), the imbibition process is significantly slower as the driving force (capillary pressure $P_c$) is smaller than it was inside the throat (larger radius means smaller $P_c$), while the main viscous dissipation is still occurring in the throat which is now filled by water. The pressure line at time t=24µs (Figure @fig_sGeom_06_A_vs_B_pLine) is now divided into two slopes upstream of the interface. The first part related to the flow in the throat has a larger slope (large energy dissipation due to small radius), while the pressure loss in the pore body part is almost negligible as most of the energy is dissipated into the narrow (throat) part of the system.

As demonstrated in this example, throat filling is generally a rapid process and is not expected to slow down the imbibition process. On the other hand, pore filling is a significantly slower process. In this case, filling the diverging geometry is more than four times slower than filling the same geometry from the opposite direction. Moreover, the actual pore-filling process with such sharp changes in geometry (when fluid needs to bulge from the throat into the pore body with negative capillary pressure) can have a significant effect on overall imbibition and dynamic effects happening in the transition zone between throat and pore body are generally not accounted in classical imbibition modeling approaches. The following section looks into the pore-filling process in more detail.

=== Detailed insight into dynamic pressure and meniscus reconfiguration during the pore-filling process
<subsec_Detail>
A more detailed insight into (dynamic) pressure distribution during pore-filling events is performed by zooming in the two details marked on Figures #link(<fig_sGeom_06_A_vs_B>)[1b] and #link(<fig_sGeom_06_A_vs_B>)[1c] and shown on Figure @fig_sGeom_06_detail_p_pL. Again, the same (equal) pressure range is used as in Figure @fig_sGeom_06_A_vs_B, while insight into specific capillary pressure values and pressure ranges can be obtained from pressure line plots below each zoom-in detail.

Figure #link(<fig_sGeom_06_detail_p_pL>)[3a] shows a meniscus in a narrow throat just before reaching the transition zone. A few observations can be stated here. First, strong water-wetting conditions were assumed by setting contact angle $theta = 5$°. This means that the meniscus shape should be close to the shape of the semicircle (which would be expected in the case of perfectly wetting fluid), as it is marked with a white dashed line. However, such curvature is only expected under static conditions, and it is clear that the (dynamic) meniscus obtained from numerical simulations is significantly less curved. It can also be stated that curvature over the meniscus is not constant, which is in accordance with different capillary pressure values at different positions, as seen in line pressure plots in Figure #link(<fig_sGeom_06_detail_p_pL>)[3c]. Most pore-scale models, such as PNM and BCTM, generally rely on capillary pressure values calculated by the Young-Laplace (Y-L) equation. In this case, for given parameters (surface tension, contact angle, and throat radius), the capillary pressure value calculated by Y-L equation would be 71726 Pa. However, it is clear that (dynamic) capillary pressure values are not constant across the interface. The lowest value is in the middle of the meniscus (approximately half of the value predicted by the Y-L equation), and it increases by approaching the capillary walls as visible by looking at pressure plots across lines 2-2, 3-3 and 4-4. The presented numerical results indicate that local capillary pressure near the wall can be significantly higher than one obtained by the Y-L equation (line 4-4).

#figure(image("graphics/sGeom_06_detail_p_pLine_09.png", width: 85.0%),
  caption: [
    Insight into pressure field near the air-water interface during the pore-filling event showing that dynamic capillary pressure varies significantly across the interface. Figures a) and b) are zoom-in details denoted in Figures #link(<fig_sGeom_06_A_vs_B>)[1b] and #link(<fig_sGeom_06_A_vs_B>)[1c] while figures c) and d) represent line pressure plots across colored lines denoted in a) and b), respectively. White dashed line on #link(<fig_sGeom_06_detail_p_pL>)[3a] represents (constant curvature) shape of the meniscus under static conditions for contact angle $theta = 5$°.
  ]
)
<fig_sGeom_06_detail_p_pL>

In the VOF method, the contact angle is incorporated as boundary conditions, where the normal vector at the fluid/fluid/solid contact line is adjusted to enforce the specified contact angle value. This means that the algorithm should enforce the expected curvature locally (near the solid walls). In the case of static configuration, this will lead to constant capillary pressure and constant curvature (defined by contact angle value) across the whole meniscus (to the accuracy of the numerical algorithm). However, during dynamic processes, this is not necessarily true and leads to a lower apparent contact angle and unequal capillary pressure distribution over the meniscus. The opposite situation (with higher apparent contact angle) is expected during a drainage process, which is in accordance with contact angle and capillary pressure hysteresis, where the relation $theta_R lt.eq theta lt.eq theta_A$ holds. Here $theta_R$, $theta$, and $theta_A$ stand for receding (drainage), static, and advancing (imbibition) apparent contact angles, respectively. Thus, even before reaching the transition zone, dynamic capillary pressure is not necessarily constant across the meniscus and has different values from the static (Young-Laplace) pressure. Even though the constant (equilibrium) contact angle value was used for simulations, the dynamic effects that produce apparent contact angle repercussions observed in reality are, to some extent, accounted for within the VOF framework.

Figure #link(<fig_sGeom_06_detail_p_pL>)[3b] shows Detail 2, where the meniscus is bulging inside the pore body with opposite (convex) curvature and where water pressure has undergone changes from under-pressure to over-pressure (i.e., negative (apparent) capillary pressure has been established). This negative capillary pressure acts as an opposing force to the flow and slows down the imbibition process. However, the VOF results again show large capillary pressure variations across the interface, where some parts of the interface are now (locally) experiencing even under-pressure values. Lines 5-5 and 7-7 in Figure #link(<fig_sGeom_06_detail_p_pL>)[3d] have strictly positive pressure values. However, the pressure values over lines 6-6 and 8-8 clearly show the existence of negative pressure values near the interface. The negative (under-) pressure (i.e., positive capillary pressure) near the solid boundary (line 8-8) is explained by the local suction effects by locally establishing concave curvature (due to water-wetting properties of the solid boundaries). The zoom-in view in Figure #link(<fig_sGeom_06_detail_p_pL>)[3b] shows magnified local pressure distribution together with interface position (white line) and zero pressure contours (black lines). It is visible that this pressure drop occurs only locally near the interface. Even though it seems that the under-pressure zone extends slightly to the air phase, actually, the whole pressure drop occurs only throughout the water phase. This is due to the (diffusive) nature of the VOF method, where the interface cannot fully accurately be represented with a single contour line, as shown here. However, this representation is a good indicator of the interface zone since, on this scale, a fully sharp assumption of an interface is reasonable (in reality, the thickness of the air-water interface is estimated to be below 1 nanometer). This assumption is also supported by the shape of the pressure line 8-8, where (relatively sharp) pressure jump (positive capillary pressure) is clearly visible and believed to occur exactly over the air-water interface. Moreover, pressure line plot 6-6 shows an even more complex pressure distribution. Approaching the interface, the pressure seems to experience a slight increase before the rapid drop to negative pressure values, which is again followed by a jump to (approximately) zero pressure values (as expected in the air phase). At this moment, we cannot give a comprehensive explanation regarding such large local variations and the existence of under-pressure values at this specific location of the interface. For a better insight into pressure variations across the interface, we refer to the animation related to Figure @fig_sGeom_06_interfaceView, which is discussed in the following.

#figure(image("graphics/sGeom_06_detail_3Dview_08.png", width: 90.0%),
  caption: [
    Time evolution (a-h) of the complex meniscus reconfigurations during the pore-filling event. Colors on the interface contour distinguish between different under- and over-pressure zones at the interface. The complete animation showing the full process can be found in the Supplementary Materials.
  ]
)
<fig_sGeom_06_interfaceView>

Figures #link(<fig_sGeom_06_detail_p_pL>)[3b] and #link(<fig_sGeom_06_detail_p_pL>)[3d] indicate that the single meniscus experiences both positive and negative pressure zones simultaneously. Additional insight into complex meniscus reconfigurations during the pore-filling process is shown in Figure @fig_sGeom_06_interfaceView, where pressure colors are used to distinguish between such zones directly at the interface. Initially, Figure #link(<fig_sGeom_06_interfaceView>)[4a] shows a meniscus in a narrow throat before reaching the transition zone, and as explained previously, the water phase and interface are experiencing under-pressure values. Further, in Figure #link(<fig_sGeom_06_interfaceView>)[4b], the air-water interface has reached the transition zone, and complex interface reconfiguration with different pressure zones starts occurring. After this, the interface begins bulging inside the pore body, leading to meniscus curvature changes as shown in Figure #link(<fig_sGeom_06_interfaceView>)[4c]. This change from concave to convex curvature changes water pressure from under-pressure to over-pressure; however, as discussed previously, some zones near the interfaces have negative pressure values (blue zones). At this point, the interface is temporarily pinned, and once the pressure (due to carried momentum) increases enough, the de-pinning will occur, and the meniscus will start advancing on the vertical walls (Figure #link(<fig_sGeom_06_interfaceView>)[4d]). Even the wettability effects produced localized pressure drop and positive capillary pressure next to the wall (as described above), a significant portion of the surface area experiences negative capillary pressure, and the central part of the bulge is expected to start retreating. This will spread water toward vertical pore-body walls and temporally accelerate the imbibition process.

Once the water reaches corners and touches pore body walls (Figure #link(<fig_sGeom_06_interfaceView>)[4e]), meniscus reconfiguration toward positive meniscus curvature will start. During this process, a complex meniscus shape experiences both positive (near horizontal walls where water as wetting fluid is driving imbibition forward) and negative capillary pressure areas (mostly in the central part of the bulge, which is responsible for water flow towards corners but also for temporally reversing flow direction in the throat) can be seen as shown in Figure #link(<fig_sGeom_06_interfaceView>)[4f]. This will be followed with the meniscus transition toward positive capillary pressure (Figure #link(<fig_sGeom_06_interfaceView>)[4g]) until the situation without over-pressure in the water phase happens once again (Figure #link(<fig_sGeom_06_interfaceView>)[4h]), as it was the case before meniscus reached transition zone (Figure #link(<fig_sGeom_06_interfaceView>)[4a]). Note that interface oscillations in the pore-body (after passing the transition zone) can take some time until the meniscus reaches steady-state (dynamic) curvature again.

Here, it was shown that interface reconfigurations during the pore-filling process involve complex multiphase flow dynamics with a range of capillary pressure values, including both positive and negative values. In the following sections, the influence of inertia and absolute pore system size will be investigated.

=== Importance of inertia during pore filling
<subsec_Inertia>
While considering both single-phase and multiphase flow in low-permeability porous media, the inertia effects are usually neglected because of low (averaged) velocities in porous media. This is the case for most pore-scale models, such as BCTM or PNM, as well as Darcy law-based models (e.g., Richards equation), which predict the diffusion-type behavior of the flow. In this work we emphasize that inertia, even on small scales (such as micron and sub-micron size), can significantly affect filling time and be a determining factor if pore filling will occur.

Recently, pore-scale understanding of pore-filling events started gathering attention and the importance of pore-space geometry and inertia started to be recognized. \[99\] have studied inertial effects on meniscus reconfiguration and surface-to-kinetic energy transformation of pore-filling events during forced imbibition. They recognized that the meniscus reconfigurations have their own time scales and local velocities which can be several orders of magnitude larger than injection velocities. It was shown that inertia effects in complex media influence the pore-filling order, leading to different invasion patterns and fluid-fluid distributions. \[100\] performed both experimental and numerical investigations of the pore-filling sequence by considering spontaneous imbibition and recognized that the geometry of pore space is the main deciding factor in the displacement pathways. Both works called into question the simple pore-filling rules based on capillary force. However, in all of their test cases, the wetting phase has always invaded the pore body.

Recently \[60\] investigated the concept of capillary barriers \[101\], \[102\] at pore-scale and found that geometric characteristics of the pore space, contact angle and the fluid properties play an important role during pore filling. They observed the situation where larger pore bodies are getting invaded first, and the smaller pore bodies, in some cases, never get invaded due to the capillary barrier effect, which is the opposite behavior predicted by conventional pore network models. They analytically defined #emph[critical] contact angle ($theta_c$), which depends on the slope of the wall boundary in the transition zone between the throat and the pore body. If the contact angle of the wetting phase is lower than the critical contact angle ($theta < theta_c$), the wetting phase will imbibe the pore body during spontaneous imbibition, while for ($theta gt.eq theta_c$) capillary barrier should occur. However, they also recognized that inertia can assist the wetting phase to overcome the capillary barrier zones. They considered the influences of different contact angles on fluid-fluid systems with the same density and viscosity and used steady-state meniscus velocity as the initial condition. Note that in our case steady-state velocity cannot exist (even for a single capillary with constant radius) due to differences in viscosities between air and water.

More recently, \[103\] simulated capillary barrier effects in pore-throat structures using LBM. They developed an efficient depth-averaged quasi-3D color-gradient LBM model by assuming a constant contact angle in the depth direction. They confirmed this assumption with full 3D LBM simulations for two different contact angle values; however, the influence of inertia on overcoming capillary barriers was not investigated.

#figure([],
  caption: [
    Influence of inertia on pore filling process. The figures a), b) and c) show the air-water distribution at 3 different times for each of 3 different cases, where different shades of blue color show time evolution. For case a), spontaneous imbibition is prevented by the occurrence of a capillary barrier due to positioning the initial interface directly in the transition zone. For cases b) and c), the momentum carried by water is large enough to overcome the capillary barrier, and water will invade the pore body. The larger momentum of case c) will eventually lead to faster filling of the pore body than case b) even if the initial interface was initially further away. Maximum momentum is characterized by the values of the maximum bulge (0.55 and 0.70 µm). Comparing all 3 cases, the pore filling occurs in the opposite sequence (or not at all) compared to the initial imbibition distance because of inertia effects in the transition zone. Details B and C show intermediate times from when the meniscus reaches horizontal walls until stable curvature is achieved. Dimensions of the systems are the same as in Figure @fig_sGeom_06_A_vs_B (i.e., throat radius is set to 1.0 µm). The complete animation showing the full process can be found in the Supplementary Materials.
  ]
)
<fig_sGeom_06_Inertia>

In this work, we investigate how inertia influences pore-filling dynamics and whether a capillary barrier will occur during water imbibition into dry porous media with sharp changes in geometry. The same pore-filling geometry as in the previous example is used, i.e., the pore body-to-throat radius ratio is 2, and the throat has a radius of 1µm. The importance of inertia is investigated by considering three different initial conditions as shown in Figure @fig_sGeom_06_Inertia.

We first consider the case #emph[a] where the initial condition is positioned directly in the throat-pore transition zone. In the previous section, we have seen that pore filling with sharp geometry changes, such as the presence of corners, requires bulging of the fluid from the throat to the pore body with negative capillary pressure. Here, the initial condition is a flat meniscus which corresponds to zero capillary pressure. Due to the wetting effects, we know that a curved meniscus is preferentially formed and capillary-driven flow will occur in case of constant geometry. However, as we have a sharp increase in the capillary radius here, it is energetically not favorable for the meniscus to advance as it should form negative capillary pressure, i.e. opposite curvature. During spontaneous imbibition, there is no external force that would create over-pressure upstream of the interface and \"push\" the meniscus into the pore body. Thus, for the case #emph[a], a flat meniscus corresponding to zero capillary pressure is a stable configuration and pore filling will not occur. This phenomenon is known as the capillary barrier \[60\]. Here, it is worth mentioning that pore filling can eventually occur during numerical simulations if the simulation is carried out for a long time (particularly if coarse mesh is used). This behavior is not physical. Rather, it is related to numerical diffusion and numerical instabilities known as spurious (or parasitic) currents \[104\] which are advecting small oscillations in indicator function (@eq:VOF) and eventually can accumulate over longer simulation periods to produce the non-physical pore filling. Thus, it is important to be aware of such behavior during simulations. Computational remedies are finer spatial and temporal discretization (mesh size and time step) and a more appropriate interface-capturing approach (e.g., geometric VOF, interface-tracking approaches, etc.).

For the remaining two cases (#emph[b] and #emph[c]), pore-filling will happen as momentum carried by water (when it reaches the transition zone) is large enough to overcome the capillary barrier. For the case #emph[b], the interface is initially closer to the transition zone and, once formed, the meniscus will reach the transition zone before the case #emph[c] due to the shorter distance. However, the meniscus velocity when it reaches the transition zone will be lower than that of the case #emph[c] due to the shorter acceleration length (as here, initial acceleration still plays a significant role). This will lead to the pore body of case #emph[c] eventually filling faster than the of the case #emph[b]. The reason for this is explained as follows. As mentioned, water must bulge into the pore body with negative capillary pressure during the pore-filling event for the considered geometry. The difference in momentum between the two cases will lead to different maximum bulges into the pore body (0.55 µm vs 0.70 µm) between #emph[b] and #emph[c] cases, respectively. Once the maximum bulge is achieved, the meniscus will tend to retreat because the negative capillary pressure acts as an opposing force and wants to \"push\" the meniscus back, which will also spread the water toward pore-body walls. A larger maximum bulge means a larger volume of water inside the pore body, so it will reach the horizontal walls (corners) of the pore body faster. Once it reaches corners, meniscus reconfiguration will tend to happen so positive capillary pressure can be established again. However, if the volume of water is insufficient, the non-uniform curvature of the meniscus will be established, as seen in detail B of Figure @fig_sGeom_06_Inertia (b3). This leads to a less curved interface in the central part of the meniscus meaning that the total driving force (integrated value of capillary pressure $P_c$) is lower than it will be after the meniscus advances further into the pore body (compare meniscus curvature between b3 and b6 case on Figure @fig_sGeom_06_Inertia). For the case #emph[c], the process of touching the pore-body walls and forming uniform curvature will be relatively faster due to the larger volume of water produced by the larger bulge into the pore body, which is directly related to the momentum of water carried once the meniscus reaches the throat-pore transition zone. This can be seen by comparing the time needed to establish \"stable\" curvature from the moment water touches pore-body walls (i.e., times between b1 (c1) and b5 (c5)), where this process is almost 7 times slower for case #emph[b]. Additionally, it is worth mentioning that the time since maximum bulge is achieved till water touches the walls of the pore body is also significantly slower (0.86 µs vs 0.16 µs) for case #emph[b].

To conclude, for the presented geometry, pore filling occurs in the opposite sequence (or not at all) compared to the initial imbibition distance. The main reason for such behavior is inertia, which is often neglected when modeling multiphase flow in porous media.

=== Size effect during pore filling
<subsec_Size>
As a final example using a single capillary with sharp changes in the cross-section, we consider size effects, i.e., the same geometry shape on different spatial scales. The throat radius is varied from 0.1 µm to 100 µm with a factor of 10, while the pore-throat ratio is fixed and kept at 2. Figure @fig_sGeom_06_SizeEffect shows the air-water distributions for 4 different sizes, where results are scaled in space with a factor of $1 \/ r$, and $r$ represents the capillary radius (half-width in 2D) of the throat.

#figure([],
  caption: [
    Influence of the spatial scales on the pore-filling process. The Figure shows air-water distributions for 3 different times for each of 4 different throat radii. For the case of r=0.1 µm, results at the 1.1 µs and 1.5 µs overlap, as the interface does not advance inside the pore body. This case demonstrates that capillary barriers are more likely to occur on smaller spatial scales, which contradicts general pore-filling rules in PNM that smaller pores are invaded first due to larger capillary pressure. Dashed lines represent the air-water interface at t=0 (initial condition), while dimensions are scaled by factor 1/r for visualization purposes. The complete animation showing the full process can be found in the Supplementary Materials.
  ]
)
<fig_sGeom_06_SizeEffect>

Dashed lines in Figure @fig_sGeom_06_SizeEffect represent the initial condition (flat interface). If the throat distances were sufficiently long, we would expect that the meniscus velocity would increase with the increasing radius of the throat, just as predicted by the Lucas-Washburn equation. Thus, in larger throats, the meniscus would reach the transition zone faster (relatively comparing, i.e., scaled in both space and time by factor 1/r). However, for a chosen system, the initial acceleration of the liquid plays a role, so at the larger scales, more time is needed for water to accelerate from initially stagnant liquid (due to the larger associated mass). In this case, we see that the meniscus in a capillary with $r =$ 1 µm reaches the pore body first (relatively comparing all cases), meaning that inertia effects related to initial water acceleration are becoming negligible on smaller scales than this. Also note that on a larger scale, meniscus deformation will be more pronounced, and it will take longer until the steady meniscus shape with steady curvature is established, whereas on small scales, this occurs rapidly.

Once the meniscus reaches the transition zone, a larger throat radius means larger momentum, so the capillary barrier will be easier to overcome (as demonstrated in the previous example). Here the most important observation is that on the smallest scale ($r =$ 0.1 µm and lower) pore-filling will not happen for a given configuration. Such behavior is often overlooked as smaller pores are assumed to be invaded first (and faster) due to larger capillary pressure. However, here we show that inertia effects play a crucial role and are often the deciding factor if pore-body filling of very small pore bodies will happen.

This has a significant effect on spontaneous imbibition in many porous materials where many small dry pores will not be invaded at all if the geometrical configurations (e.g., small pores surrounded by the network of the even smaller capillaries) are such that it is not energetically favorable for the meniscus to invade the pore body. The presented results agree with \[60\], where simple pore-filling rules used in PNM were called into question.

== System of capillary tubes
<subsec_SystemOfCapillaryTubes>
=== Interacting capillaries
<subsec_InteractinCapillaries>
As discussed in the Introduction, in the classical bundle of capillary tubes (BCTM) approach, the porous medium is represented as a set of separated tubes, each of them modeled by the Lucas-Washburn equation. Such an approach predicts the fastest imbibition in the capillary with the largest radius which contradicts observed behavior in real porous media \[105\], \[106\], \[107\]. To account for complex fluid interaction occurring in porous media, interacting BCTM were developed \[38\].

In general, interacting BCTM assume pressure equilibrium between capillaries containing the same fluid. This further presumes that the entire fluid transfer takes place only at the meniscus position and neglects any pressure drop between tubes. However, this assumption of pressure equilibrium cannot be physically correct as the pressure difference is needed for the flow between capillaries to occur. Recently, Ashraf et al. \[108\] performed VOF simulations where they showed that pressure difference between tubes does exist, but both pressure drop and fluid transfer occur only in the vicinity of the fluid/fluid interface. However, in their work, they assumed that two capillaries are continuously connected which could be interpreted as a single capillary setup with a complex (but constant) cross-section. Such a setup is not a fully valid representation of general porous media where, for example, solid grains act as no-flow boundaries interrupting cross-flow continuity. Thus, in this work, we investigate a setup where capillaries are connected only at discrete locations. Moreover, \[108\] considered that both phases have the same viscosity and density which led to the same pressure gradient before the first and after the second meniscus. In this work, we consider the multiphase flow of water and air, where significant differences in density and viscosity play a role.

#figure(
  align(center)[#table(
    columns: 7,
    align: (center,center,center,center,center,center,center,),
    table.header([$D_1$], [$D_2$], [$D_3$], [$L_1$], [$L_2$], [$L_3$], [$L_4$],),
    table.hline(),
    [12], [40], [8], [100], [200], [300], [400],
    [$L_5$], [$L_6$], [$L_7$], [$L_8$], [$L_9$], [$L_10$], [$L_11$],
    [52], [96], [100], [60], [400], [40], [120],
  )]
  , caption: [Dimensions (diameters and lengths in µm) specified in Figures @fig_sGeom_10_0050 and @fig_sGeom_10_throats_01.]
  , kind: table
  ) <tab:sGeom_10_dimensions>

Figure #link(<fig_sGeom_10_0050>)[7a] shows the geometry and dimensions for numerical simulations. The left part of the domain represents a large pore with four connected capillaries on the right. Those four capillaries are divided into two sets: set A represents independent capillaries, while set B represents interacting capillaries. The subscripts $n$ and $w$ stand for narrow and wide capillaries, respectively. The initial condition for this case is specified as the flat interface on $L_1 + L_2 \/ 2$ distance from the left edge, and three cross-flow capillaries connecting $B_n$ and $B_w$ are initially filled with water.

#figure([],
  caption: [
    Comparison between independent (set A) and interacting (set B) BCTM demonstrating the cross-flow influence between the capillaries: (a) air-water distribution, (b) pressure distribution, (c) velocity magnitude, and (d) line pressure plots along central lines of capillaries at t=0.5 ms. Dashed lines represent the air-water interface at t=0 (initial condition), while dimensions from the Figure are specified in Table @tab:sGeom_10_dimensions. The complete animation showing the full process can be found in the Supplementary Materials.
  ]
)
<fig_sGeom_10_0050>

Figures @fig_sGeom_10_0050 and @fig_sGeom_10_0100 show air-water distribution, pressure distribution, velocity magnitude distribution and line plots of the pressure through the central line passing each capillary at two different times (t=0.5 ms and t=1.0 ms). As expected, the interface position in the non-interacting capillaries (set A) follows the behavior predicted by the Lucas-Washburn equation, i.e. (except in the very beginning due to inertia effects) the wide capillary is filled faster than the narrow one. As previously mentioned, the capillary pressure is larger for narrow capillary (black solid vs black dashed line in Figures #link(<fig_sGeom_10_0050>)[7d] and #link(<fig_sGeom_10_0100>)[8d] where pressure jumps at the air-water interface represents the value of dynamic capillary pressure $P_c$), however, the friction losses are also larger for narrow capillary which is visible by comparing the slopes of the same pressure lines (black solid vs black dashed). On the other hand, for interacting capillaries (set B) imbibition behavior is different from set A, and interconnections between $B_n$ and $B_w$ affect the flow in such a way that imbibition in the wide capillary $B_w$ is slower (compared to $A_w$), while imbibition in the narrow capillary $B_n$ is faster (compared to $A_n$). The reason for this can be explained by examining pressure and velocity fields and acknowledging that fluid flows from higher toward lower pressure areas.

#figure([],
  caption: [
    Comparison between independent (set A) and interacting (set B) BCTM demonstrating the cross-flow influence between the capillaries: (a) air-water distribution, (b) pressure distribution, (c) velocity magnitude, and (d) line pressure plots along central lines of capillaries at t=1.0 ms.
  ]
)
<fig_sGeom_10_0100>

First, we can notice that larger underpressure is created in the narrow tube ($B_n$) than in the wide tube ($B_w$) due to the smaller radius. Once both meniscus have reached the first cross-flow capillary, pressure differences will lead to cross-flow between two tubes where a part of the flow through $B_w$ will be redirected towards $B_n$. As already mentioned, interacting BCTM assume pressure equilibrium between capillaries containing the same fluid (at the same distance $x$). However, from the Figures @fig_sGeom_10_0050 and @fig_sGeom_10_0100 (obtained by solving full flow equations), it is clear that there is pressure difference between two capillaries. This pressure difference is needed to drive a fluid flow between neighboring tubes and is largest at the latest cross-flow tube where most of the water flow between capillaries occurs (e.g., the difference is visible in 2D pressure plots or by comparing red solid vs red dashed lines in line plots). However, pressure difference and fluid transfer do exist in other areas and not only close to the meniscus (i.e., the latest cross-flow capillary) as generally assumed. The larger the radius of the interconnecting capillary, the smaller the difference in imbibition speed and pressure between $B_w$ and $B_n$ tubes is expected.

Moreover, Figure #ref(label("fig_sGeom_10_x(t)")) shows the imbibition distance as a function of time for all four capillaries. Here it is interesting to notice that imbibition in narrow tube $B_n$ accelerates whenever it passes a cross-flow capillary, which is again followed by a decrease in imbibition speed as it progresses further away. This speed-up is the outcome of mainly two reasons. First, as soon as the interfaces pass a cross-flow capillary, the large pressure difference between $B_w$ and $B_n$ existing before cross-flow will be reduced by increasing pressure in $B_n$ and reducing in $B_w$ which will initiate temporal acceleration of meniscus in $B_n$. Furthermore, the cross-flow leads to the situation where overall viscous dissipation through the narrow capillary is now significantly lower, especially when the meniscus is close to cross-flow capillary (due to large water-air viscosity ratio) as now significant portion of the flow required for advancing meniscus in $B_n$ is flowing through $B_w$ where friction is significantly lower due to larger radius. This decrease in the pressure gradient in the upstream part of the narrow tube and redirection of fluid from wider to narrower parts of porous media due to the suction effect is one of the reasons why imbibition in narrow capillaries is generally faster, contrary to the prediction of basic Lucas-Washburn equation.

Additionally, we also notice here that capillary pressure at the air-water interface is different between non-interacting and interacting capillaries (e.g. $A_n$ vs $B_n$ on Figures #link(<fig_sGeom_10_0050>)[7d] or #link(<fig_sGeom_10_0100>)[8d]). The reasons for this are related to flow dynamics and interface movement and reconfiguration which generally tend to reduce $P_c$. Similar behavior was reported in section @subsec_Detail during the pore-filling process where differences between dynamic and static (Young-Laplace) capillary pressures were observed.

#figure([],
  caption: [
    Comparison between independent ($A_n$,$A_w$) and interacting ($B_n$,$B_w$) capillaries: imbibition distance as a function of time.
  ]
)
#label("fig_sGeom_10_x(t)")

In this example, three short cross-flow (interconnecting) capillaries that connect $B_n$ and $B_w$ tubes were set as initially filled with water. The main reason for this was to have the direct (transient) comparison with set $A$ of non-interacting capillaries. The results for initially dry cross-flow capillaries do lead to slightly different imbibition speeds due to cross-flow capillary filling and air flow downstream of the imbibition front; however main conclusions stated here remain the same. Animations for both initially dry and initially filled cross-flow capillaries are included in Supplementary Information.

Finally, in this example, the interfaces between $B_n$ and $B_w$ were following each other relatively closely (Figure #ref(label("fig_sGeom_10_x(t)"))). As explained, the interface in $B_n$ would accelerate every time it passes a new cross-flow capillary. However, as the front in the narrow capillary would move further away from it, it would slow down due to high viscous dissipation. Thus, for this particular case, the imbibition front of interacting capillaries moves relatively uniformly through the domain. In the following, the same size capillaries will be used; however, the configuration will be changed to demonstrate another reason why imbibition can be significantly faster in narrow capillaries compared to wide ones.

=== Influence of narrow contractions on imbibition dynamics and air trapping
<subsec_InfluenceOfThroatsAndAirTrapping>
In the following section, we look into the influence of contractions (i.e. narrow throats) on imbibition dynamics and the trapping of the non-wetting phase. We compare the set of independent tubes (set $E$, the same as set $A$ from the previous example) to the set $F$ containing narrow throat at outlet boundary and the set $G$ containing narrow throats both at inlet and outlet as shown in Figure #link(<fig_sGeom_10_throats_01>)[9a].

First, we compare differences between case $E$ and case $F$, i.e. we look into the influence of the narrow throat at the outlet. Figure #link(<fig_sGeom_10_throats_01>)[9b] shows the interface position at t=0.4 ms, just before the interface of the fastest capillary ($E_w$) has reached the end of the domain. Like in the previous example, we use subscripts $w$ and $n$ to distinguish between wide and narrow capillaries, respectively. We can see that set $F$ has the same behavior as a set $E$ (following Lucas-Washburn prediction) where larger capillary is filled first; however, we can also see that filling is slower than in the case of independent capillaries (set $E$). The only difference here is a narrow throat at the end of the domain, where neither of the air-water interfaces in $F_w$ or $F_n$ didn't reach the throat yet. Thus, this behavior has to be related to the flow of the air through the narrow throat at the end of the domain, which can be visible by looking at the pressure and velocity distribution in Figures #link(<fig_sGeom_10_throats_01>)[9c] and #link(<fig_sGeom_10_throats_01>)[9d]. We can see that, compared to set $E$, the pressure in the air phase (downstream/right from the interface) is higher (darker red color) which slows down the imbibition of water in set $F$. The reason for this can be understood by looking at a velocity magnitude field where the local velocity through the outlet throat is very high (because the sum of discharges from both $F_w$ and $F_n$ needs to flow through this narrow contraction) which needs a non-negligible pressure gradient in the gas phase even considering the small viscosity of the air. As the outlet pressure is set the same as at the inlet pressure (i.e. relative atmospheric pressure p=0), this leads to increased air pressure downstream of the interface acting as an opposing force and slows down water imbibition. The air viscosity is often neglected since water is significantly more viscous fluid (approximately 55 times more viscous than air). However, here we see that air viscosity can play a role and slow down overall imbibition. This is expected to have the most significant effect in the early stages of the imbibition (where local velocities are largest) and for the case where porosity is reducing downstream compared to porosity at the imbibition front.

#figure([],
  caption: [
    Influence of narrow contractions: (a) air-water initial condition, (b) air-water distribution, (c) pressure distribution and (d) velocity magnitude at t=0.4ms. Set E follows basic Lucas-Washburn behavior, while set F is slower due to airflow through the downstream contraction, demonstrating the influence of air viscosity. Upstream contraction in set G leads to totally different behavior and shows that narrow contractions could have a larger influence on imbibition than cross-flow between parallel capillaries, as shown in the previous example. Dimensions denoted in Figure #link(<fig_sGeom_10_throats_01>)[9a] are specified in Table @tab:sGeom_10_dimensions. The complete animation showing the full process can be found in the Supplementary Materials.
  ]
)
<fig_sGeom_10_throats_01>

However, the effect of the narrow contraction will become more significant and have a larger effect on overall imbibition dynamics once it is filled by water, as seen in the results of the set $G$, which has additional contraction between the inlet pore and two capillaries. When compared to two previous sets, imbibition dynamics in set $G$ is not just significantly slower but now has an opposite behavior as a smaller tube is filled faster than a larger one (Figures #link(<fig_sGeom_10_throats_01>)[9b]). This behavior is often seen in real porous media and can be explained by the pressure and velocity distributions in Figures #link(<fig_sGeom_10_throats_01>)[9c] and #link(<fig_sGeom_10_throats_01>)[9d]. A particular feature in this example is the T-junction where the flow is divided from the inlet throat (connected to a large pore) to wide and narrow ($G_w$ and $G_n$) capillaries. We can see that most of the flow is redirected toward narrow capillary $G_n$ and the reason for this is the local pressure distribution. To get better insight, Figure @fig_sGeom_10_throats_polyLine shows pressure distribution along two polylines passing centers of $G_n$ and $G_w$ capillaries at time $t = 0.4$ ms (polylines are denoted with numbers and green dashed lines in Figure #link(<fig_sGeom_10_throats_01>)[9a]). Point $3$ is the location where the flow starts branching into two directions and most of the flow is redirected toward $G_n$ because of lower pressure at point $4_n$ than at $4_w$. This larger under-pressure at $4_n$ results from higher capillary pressure $P_c$ at the air-water interface because of the smaller radius of the narrower tube. As previously discussed and demonstrated by the results of non-interacting capillaries, imbibition in narrow tube will create larger under-pressure but, due to larger viscous dissipation, overall imbibition will be slower than in the wider capillary as predicted by the Lucas-Washburn equation. In the case of set $G$, viscous losses are higher in the narrow tube (slope of the red dashed line between point $4_n$ and interface position) than in the wider tube (slope of the solid black line between point $4_w$ and interface). However, in this case, the difference is that capillaries are not connected to large pore as before, but rather source of inflow water is limited by narrow contraction (throat) and the local pressure distribution in the T-junction redirects most of the flow toward the narrow capillary.

#figure([],
  caption: [
    Pressure distribution for G set at 0.4ms along poly-lines denoted at Figure #link(<fig_sGeom_10_throats_01>)[9a]
  ]
)
<fig_sGeom_10_throats_polyLine>

Moreover, because two capillaries with different imbibition speeds merge into the narrow throat at the outlet of the domain (for cases $F$ and $G$), this will result in the entrapment of the non-wetting phase in the system. Figure @fig_sGeom_10_throats_03 shows air-water distribution and pressure fields for all three cases at the time t=4 ms where steady-state configurations have been reached. For case $E$, there is no air entrapment as there is no merging of capillaries. For the middle case $F$, imbibition in the wide capillary will reach the outlet throat sooner than narrow capillary which will lead to trapping of air in the narrow capillary $F_n$ while for the case $G$ situation will be the opposite and air will be entrapped in wide capillary $G_w$ as shown in the Figure #link(<fig_sGeom_10_throats_03>)[11a]. Figure #link(<fig_sGeom_10_throats_03>)[11b] shows corresponding pressure fields where it is clear that the trapped air phase has a higher pressure than water as is expected for the non-wetting phase. Since there is no flow after the steady state is reached, the value of pressure in the water phase is constant and defined by boundary conditions (i.e. $p = 0$). Thus, pressure in the air phase is the same (to the accuracy of a numerical algorithm) as the static $P_c$ calculated using the Young-Laplace equation.

Finally, we see that the final positions and the volumes of the entrapped air between different cases are significantly different, which can have an important effect on many physical and chemical processes for transport in porous media. Moreover, note that the downstream air-water interface is not located directly at the outlet throat position. For the case $F$, this is mostly due to inertia effects as the interface entering a narrow tube from a wide capillary will have significant momentum and push trapped air back downstream until viscous forces dissipate this momentum. For the case $G$, the reason for this is not inertia but rather unbalanced capillary pressures between downstream and upstream air-water interfaces, pushing trapped air volume upstream until curvature on both ends becomes the same and pressures in the system equilibrate. We refer to the animations provided in the Supplementary Information for additional insight into the described processes.

#figure([],
  caption: [
    Influence of contractions on entrapment of the air (non-wetting) phase: (a) air-water distribution and (b) pressure distribution after steady-state conditions have been reached.
  ]
)
<fig_sGeom_10_throats_03>

= Implications
<sec_implications>
Understanding spontaneous imbibition phenomena from the pore-scale perspective is of fundamental importance and has large potential to improve the predictive capabilities of many simplified models. The DNS approach enables detailed microscopic insight into multiphase flow physics by solving full flow variables without simplifications. This work combined DNS with simplified 2D geometries to simulate different pore-level processes relevant during spontaneous imbibition.

First, dynamic effects in the transition zone from throat-to-pore and pore-to-throat were investigated. Such events are parts of every natural porous media and are generally implemented in PNM as simple capillary pressure rules. This study confirms that throat-filling is a fast process, and thus, dynamic effects in the transition zone are not expected to influence the imbibition prediction by PNM. On the other hand, interfaces passing the transition zone during a pore-filling event (a situation before and after positive capillary pressure is established across the whole meniscus) can significantly slow down imbibition. In the case of spontaneous imbibition with sharp changes in geometry, the inertial forces are crucial and determine the time needed for the interface to pass the transition zone. The larger water momentum at the transition zone's entrance means a faster filling process. When momentum is insufficient to overcome abrupt changes in the shape of pore space, the capillary barrier will occur, and imbibition into the pore-body will be prevented. This is particularly significant on smaller scales (due to smaller momentum), which generally contradicts the general hypothesis used in conventional PNM that smaller pores are filled first due to larger capillary pressure. The inertial effects are often considered irrelevant in porous media due to low (averaged) velocities. However, from the pore-scale perspective, it is clear that inertia significantly influences the local interface reconfigurations, which eventually can lead to significantly different imbibition speeds and invasion patterns in complex porous media.

Moreover, the apparent contact angle is generally lower than its static value during the imbibition process. This is true even for a single capillary with a constant cross-section, and dynamic contact angle approaches have been developed to describe such behavior \[109\], \[110\]. However, this phenomenon is naturally included in the VOF framework, even when a static (constant) contact angle is specified as a boundary condition. This is because the interface is advected based on the multidimensional pressure and velocity fields obtained by solving the full mass and momentum equations. This further leads to dynamic capillary pressure not being constant across the meniscus. VOF simulations show that capillary pressure has the lowest value in the middle of the meniscus, which can be significantly lower than predicted by the Young-Laplace (Y-L) equation, and its value increases by approaching wall boundaries, where it can significantly exceed the Y-L value. Such insight not only enhances our fundamental understanding but could also contribute to the development of improved dynamic contact angle models.

Once the interface reaches the entrance of the pore body, a complex meniscus reconfiguration, with a whole range of capillary pressure values, will occur. This will be followed by multiple dynamical transitions between concave and convex curvatures of different interfacial zones. Even after interfaces pass the transition zone, oscillations in the pore-body can take some time until the meniscus reaches steady-state (dynamic) curvature again. As suggested by \[99\], these irreversible reconfigurations characterize the amount of surface energy that is spontaneously released and transformed into kinetic energy and can be related to the pressure drop in Darcy's law. Thus, more work is needed to better understand the relevance and upscaling of such pore-scale reconfigurations.

Furthermore, we presented a DNS comparison between non-interacting and interacting bundles of capillary tube setup where cross-flow exchange occurs perpendicularly to the flow direction. This was followed by investigating the influence of narrow contractions, where the flow from a single capillary divides into multiple capillaries. Both cross-flow and narrow contraction can explain why imbibition is generally faster into narrow capillaries (opposite to predictions of the basic Lucas-Washburn equation). However, our results suggest that narrow contractions could have a far more significant effect than cross-flow between capillaries. Moreover, narrow contractions, which are generally not included in BCTM, can explain why the non-wetting phase is generally trapped in large pores, which has a significant influence on many different applications. An example is the trapping of air in the capillary movement of water through concrete, where the air plays an important role in the context of durability (e.g., freeze-thaw damage or reinforcing steel corrosion).

In this work, incompressible flow assumption was used. Such an assumption is appropriate in most porous media applications since the flow of a compressible fluid (such as air) at a low Mach number ($tilde.op$ Ma \< 0.3) is essentially incompressible \[111\] (note that incompressible #emph[flow] and incompressible #emph[fluid] are different terms). However, once the air phase gets trapped, compressibility effects could become important since over-pressure in the air phase (imposed by capillary pressure) could potentially lead to air compression and dissolution \[112\]. While this topic extends beyond the scope of the present study, it is worth mentioning that such effects are anticipated to be particularly pronounced on smaller spatial scales (due to the significant capillary pressure), as well as on longer temporal scales. Considering that the provided example had a maximum capillary pressure of around 0.12 bar and a full simulation time of 4 ms, these effects are not expected to influence conclusions from this study. However, the long-term dissolution of trapped air has important consequences for many applications and could be one of the explanations for the later stage of (anomalous) water absorption into cementitious materials \[95\].

We mostly discussed how investigated processes are implemented or how gained insight could be used for simplified pore-scale models (PNM and BCTM). However, all the mentioned processes are relevant to imbibition physics; thus, macroscale models based on a homogenization approach (i.e., continuum-based models using Darcy law) could also benefit from such findings. Finding a way to upscale described pore-level physics, either by modifying governing equations or improving the description of material properties (e.g., relative permeability curves), has the potential to improve their predictive capabilities.

= Conclusions
<sec_conclusions>
Understanding how water is absorbed in dry porous materials is crucial due to its wide range of applications. It's important to consistently enhance our knowledge and ability to predict these processes. In this work, accurate physical simulations of air-water multiphase flow have been performed using direct numerical simulations (DNS) to investigate different pore-scale effects and their impacts on imbibition dynamics during capillary-driven water imbibition. The main findings can be summarised as follows:

- Throat-filling process is a more energetically favorable process than pore-filling. This can lead to significantly increased time for the meniscus to pass the transition zone (from throat to pore body) during a pore-filling event. Simple capillary pressure rules implemented in PNM do not account for such complex dynamic effects.

- Dynamic capillary pressure $P_c$ is generally not constant across the interface and can differ significantly from its equilibrium value predicted by the Young-Laplace equation. This leads to uneven meniscus curvature with a different (apparent) contact angle than its intrinsic (local) value, even for the flat and homogeneous surface. These effects are inherently included in the VOF method, even when static contact angle boundary condition is used.

- Inertia plays an important role during pore-filling events and can be a deciding factor if pore-filling will occur or not. Larger water momentum at the entrance of the pore body leads to faster interface reconfigurations and, eventually, faster pore filling. If the momentum is insufficient, the capillary barrier can occur, and imbibition will be prevented. This is particularly significant on the smaller scales (e.g. submicron porosity), which generally contradicts the general hypothesis used in conventional PNM that smaller pores are filled first due to larger capillary pressure.

- The pressure equilibrium assumption used in interacting BCTM, which assumes that pressure drop and fluid transfer occur only at the meniscus locations, is generally not valid; rather, a more complex hydrodynamic situation exists in reality, and the potential significance of these effects should be considered and further investigated when applying BCTM.

- Narrow contractions where flow divides to multiple capillaries could be a more important reason why imbibition is generally faster in narrow capillaries than the cross-flow between capillaries.

- Narrow contractions are important components for non-wetting phase entrapment and can explain why the non-wetting is often trapped in the large pores. Including such effects has the potential to improve the predictive capabilities of existing BCTM.

- The viscosity of the air, in some cases, can have a non-negligible effect and slow down overall imbibition.

The findings from this study have the potential to offer valuable insights to researchers seeking to advance their understanding of imbibition processes. Furthermore, this study could be particularly beneficial to those working with simplified pore-scale models like PNM and BCTM. Additionally, it illustrates the utility of DNS in answering critical questions, examining different hypotheses, and validating different components of existing predictive models.

#heading(level: 1, numbering: none)[Author contributions]
<author-contributions>
Luka Malenica: Conceptualization, Investigation, Methodology, Software, Validation, Visualization, Writing -- original draft, Writing -- review & editing

Zhidong Zhang: Conceptualization, Formal analysis, Investigation, Validation, Writing -- review & editing

Ueli Angst: Conceptualization, Funding acquisition, Investigation, Resources, Supervision, Writing -- review & editing

#heading(level: 1, numbering: none)[Acknowledgement]
<acknowledgement>
This work was supported by the Swiss National Science Foundation (SNSF, grant no. 196919) and the European Research Council (ERC) under the European Union's Horizon 2020 research and innovation program (grant agreement no. 848794).

#heading(level: 1, numbering: none)[References]
<bibliography>
#block[
#block[
\[1\] N. R. Morrow and G. Mason, “Recovery of oil by spontaneous imbibition,” #emph[Current Opinion in Colloid & Interface Science], vol. 6, no. 4, pp. 321--337, 2001.

] <ref-morrow2001recovery>
#block[
\[2\] P. Andersen, S. Evje, and H. Kleppe, “A model for spontaneous imbibition as a mechanism for oil recovery in fractured reservoirs,” #emph[Transport in porous media], vol. 101, no. 2, pp. 299--331, 2014.

] <ref-andersen2014model>
#block[
\[3\] A. Scanziani, K. Singh, H. Menke, B. Bijeljic, and M. J. Blunt, “Dynamics of enhanced gas trapping applied to CO2 storage in the presence of oil using synchrotron x-ray micro tomography,” #emph[Applied Energy], vol. 259, p. 114136, 2020.

] <ref-scanziani2020dynamics>
#block[
\[4\] L. Malenica, H. Gotovac, G. Kamber, S. Simunovic, S. Allu, and V. Divic, “Groundwater Flow Modeling in Karst Aquifers: Coupling 3D Matrix and 1D Conduit Flow via Control Volume Isogeometric Analysis with a 3D Physical Model,” #emph[Water], vol. 10, no. 12, p. 1787, Dec. 2018, doi: #link("https://doi.org/10.3390/w10121787")[10.3390/w10121787].

] <ref-malenicaGroundwaterFlowModeling2018>
#block[
\[5\] Z. Zhang and U. Angst, “A dual-permeability approach to study anomalous moisture transport properties of cement-based materials,” #emph[Transport in Porous Media], vol. 135, no. 1, pp. 59--78, 2020.

] <ref-zhang2020dual>
#block[
\[6\] X. Wang, Y. Li, H. W. Chau, D. Tang, J. Chen, and M. Bayad, “Reduced root water uptake of summer maize grown in water-repellent soils simulated by HYDRUS-1D,” #emph[Soil and Tillage Research], vol. 209, p. 104925, 2021.

] <ref-wang2021reduced>
#block[
\[7\] E. Ezzatneshan and R. Goharimehr, “Study of spontaneous mobility and imbibition of a liquid droplet in contact with fibrous porous media considering wettability effects,” #emph[Physics of Fluids], vol. 32, no. 11, 2020.

] <ref-ezzatneshan2020study>
#block[
\[8\] H. Aslannejad, S. Loginov, B. van der Hoek, E. Schoonderwoerd, H. Gerritsen, and S. Hassanizadeh, “Liquid droplet imbibition into a thin coating layer: Direct pore-scale modeling and experimental observations,” #emph[Progress in Organic Coatings], vol. 151, p. 106054, 2021.

] <ref-aslannejad2021liquid>
#block[
\[9\] J. P. Mooney, P. A. Walsh, J. Punch, and V. Egan, “A capillary flow model for discretely graded porous media in two phase heat transfer applications,” #emph[International Journal of Thermofluids], vol. 15, p. 100183, 2022.

] <ref-mooney2022capillary>
#block[
\[10\] P. M. Adler and H. Brenner, “Multiphase flow in porous media,” #emph[Annual review of fluid mechanics], vol. 20, no. 1, pp. 35--59, 1988.

] <ref-adler1988multiphase>
#block[
\[11\] W. G. Gray and S. M. Hassanizadeh, “Unsaturated flow theory including interfacial phenomena,” #emph[Water Resources Research], vol. 27, no. 8, pp. 1855--1863, 1991.

] <ref-gray1991unsaturated>
#block[
\[12\] G. Mason and N. R. Morrow, “Developments in spontaneous imbibition and possibilities for future work,” #emph[Journal of Petroleum Science and Engineering], vol. 110, pp. 268--293, 2013.

] <ref-mason2013developments>
#block[
\[13\] C. Li, H. Singh, and J. Cai, “Spontaneous imbibition in shale: A review of recent advances,” #emph[Capillarity], vol. 2, no. 2, pp. 17--32, 2019.

] <ref-li2019spontaneous>
#block[
\[14\] H. Gotovac, L. Malenica, and B. Gotovac, “Control volume isogeometric analysis for groundwater flow modeling in heterogeneous porous media,” #emph[Advances in Water Resources], vol. 148, p. 103838, 2021.

] <ref-gotovac2021control>
#block[
\[15\] J. Bear, C. Braester, and P. C. Menier, “Effective and relative permeabilities of anisotropie porous media,” #emph[Transport in porous media], vol. 2, pp. 301--316, 1987.

] <ref-bear1987effective>
#block[
\[16\] S. Whitaker, “Flow in porous media II: The governing equations for immiscible, two-phase flow,” #emph[Transport in porous media], vol. 1, pp. 105--125, 1986.

] <ref-whitaker1986flow_II>
#block[
\[17\] L. Richards, “Capillary conduction of liquids through porous medium,” #emph[Physics], vol. 1, pp. 318--333, 1931.

] <ref-richrds1931capillary>
#block[
\[18\] L. Malenica, “Numerical modeling based on spline basis functions: Application to groundwater flow modeling in karst aquifers and advection dominated problems,” PhD thesis, University of Split. Faculty of Civil Engineering, Architecture\; Geodesy, 2019.

] <ref-malenica2019numerical>
#block[
\[19\] Y. Zha, J. Yang, J. Zeng, C.-H. M. Tso, W. Zeng, and L. Shi, “Review of numerical solution of richardson--richards equation for variably saturated flow in soils,” #emph[Wiley Interdisciplinary Reviews: Water], vol. 6, no. 5, p. e1364, 2019.

] <ref-zha2019review>
#block[
\[20\] Z. Zhang and U. Angst, “Modeling anomalous moisture transport in cement-based materials with kinetic permeability,” #emph[International journal of molecular sciences], vol. 21, no. 3, p. 837, 2020.

] <ref-zhang2020modeling>
#block[
\[21\] M. Muskat and M. W. Meres, “The flow of heterogeneous fluids through porous media,” #emph[Physics], vol. 7, no. 9, pp. 346--363, 1936.

] <ref-muskat1936flow>
#block[
\[22\] M. J. Blunt, #emph[Multiphase Flow in Permeable Media: A Pore-Scale Perspective]. Cambridge: Cambridge University Press, 2017. doi: #link("https://doi.org/10.1017/9781316145098")[10.1017/9781316145098].

] <ref-blunt_multiphase_2017>
#block[
\[23\] R. T. Armstrong, M. L. Porter, and D. Wildenschild, “Linking pore-scale interfacial curvature to column-scale capillary pressure,” #emph[Advances in Water resources], vol. 46, pp. 55--62, 2012.

] <ref-armstrong2012linking>
#block[
\[24\] S. M. Hassanizadeh and W. G. Gray, “Thermodynamic basis of capillary pressure in porous media,” #emph[Water resources research], vol. 29, no. 10, pp. 3389--3405, 1993.

] <ref-hassanizadeh1993thermodynamic>
#block[
\[25\] P. C. Reeves and M. A. Celia, “A functional relationship between capillary pressure, saturation, and interfacial area as revealed by a pore-scale network model,” #emph[Water resources research], vol. 32, no. 8, pp. 2345--2358, 1996.

] <ref-reeves1996functional>
#block[
\[26\] M. L. Porter, M. G. Schaap, and D. Wildenschild, “Lattice-boltzmann simulations of the capillary pressure--saturation--interfacial area relationship for porous media,” #emph[Advances in Water Resources], vol. 32, no. 11, pp. 1632--1640, 2009.

] <ref-porter2009lattice>
#block[
\[27\] Y. Liu, D. Nolte, and L. Pyrak-Nolte, “Hysteresis and interfacial energies in smooth-walled microfluidic channels,” #emph[Water Resources Research], vol. 47, no. 1, 2011.

] <ref-liu2011hysteresis>
#block[
\[28\] M. Fan #emph[et al.], “Comprehensive study of the interactions between the critical dimensionless numbers associated with multiphase flow in 3D porous media,” #emph[Fuel], vol. 252, pp. 522--533, 2019.

] <ref-fan2019comprehensive>
#block[
\[29\] R. Guo #emph[et al.], “Role of heterogeneous surface wettability on dynamic immiscible displacement, capillary pressure, and relative permeability in a CO2-water-rock system,” #emph[Advances in Water Resources], vol. 165, p. 104226, 2022.

] <ref-guo2022role>
#block[
\[30\] A. Golparvar, Y. Zhou, K. Wu, J. Ma, and Z. Yu, “A comprehensive review of pore scale modeling methodologies for multiphase flow in porous media,” #emph[Advances in Geo-Energy Research], vol. 2, no. 4, pp. 418--440, 2018.

] <ref-golparvar2018comprehensive>
#block[
\[31\] R. Lucas, “Ueber das Zeitgesetz des kapillaren Aufstiegs von Flüssigkeiten,” #emph[Kolloid-Zeitschrift], vol. 23, no. 1, pp. 15--22, Jul. 1918, doi: #link("https://doi.org/10.1007/BF01461107")[10.1007/BF01461107].

] <ref-lucasUeberZeitgesetzKapillaren1918a>
#block[
\[32\] E. W. Washburn, “The Dynamics of Capillary Flow,” #emph[Physical Review], vol. 17, no. 3, pp. 273--283, Mar. 1921, doi: #link("https://doi.org/10.1103/PhysRev.17.273")[10.1103/PhysRev.17.273].

] <ref-washburnDynamicsCapillaryFlow1921>
#block[
\[33\] J. Cai, T. Jin, J. Kou, S. Zou, J. Xiao, and Q. Meng, “Lucas-Washburn Equation-Based Modeling of Capillary-Driven Flow in Porous Systems,” #emph[Langmuir: the ACS journal of surfaces and colloids], vol. 37, no. 5, pp. 1623--1636, Feb. 2021, doi: #link("https://doi.org/10.1021/acs.langmuir.0c03134")[10.1021/acs.langmuir.0c03134].

] <ref-caiLucasWashburnEquationBasedModeling2021>
#block[
\[34\] S. Yuster, “Theoretical considerations of multiphase flow in idealized capillary systems,” in #emph[World petroleum congress], WPC, 1951, pp. WPC--4129.

] <ref-yuster1951theoretical>
#block[
\[35\] J. T. Bartley and D. W. Ruth, “Relative Permeability Analysis of Tube Bundle Models,” #emph[Transport in Porous Media], vol. 36, no. 2, pp. 161--188, Aug. 1999, doi: #link("https://doi.org/10.1023/A:1006575231732")[10.1023/A:1006575231732].

] <ref-bartleyRelativePermeabilityAnalysis1999>
#block[
\[36\] F. A. Dullien, #emph[Porous media: Fluid transport and pore structure]. Academic press, 2012.

] <ref-dullien2012porous>
#block[
\[37\] M. Dong, F. A. Dullien, L. Dai, and D. Li, “Immiscible displacement in the interacting capillary bundle model part i. Development of interacting capillary bundle model,” #emph[Transport in Porous media], vol. 59, pp. 1--18, 2005.

] <ref-dong2005immiscible>
#block[
\[38\] M. Dong, F. A. Dullien, L. Dai, and D. Li, “Immiscible displacement in the interacting capillary bundle model part ii. Applications of model and comparison of interacting and non-interacting capillary bundle models,” #emph[Transport in Porous media], vol. 63, pp. 289--304, 2006.

] <ref-dong2006immiscible>
#block[
\[39\] J. Wang, F. A. Dullien, and M. Dong, “Fluid transfer between tubes in interacting capillary bundle models,” #emph[Transport in porous media], vol. 71, pp. 115--131, 2008.

] <ref-wang2008fluid>
#block[
\[40\] S. Li, M. Dong, and P. Luo, “A crossflow model for an interacting capillary bundle: Development and application for waterflooding in tight oil reservoirs,” #emph[Chemical Engineering Science], vol. 164, pp. 133--147, 2017.

] <ref-li2017crossflow>
#block[
\[41\] S. Ashraf, Y. Méheust, and J. Phirani, “Spontaneous imbibition dynamics in interacting multi-capillary systems: A generalized model,” #emph[arXiv preprint arXiv:2012.11335], 2020.

] <ref-ashraf2020spontaneous>
#block[
\[42\] S. Ashraf, Y. Méheust, and J. Phirani, “Spontaneous imbibition dynamics in two-dimensional porous media: A generalized interacting multi-capillary model,” #emph[Physics of Fluids], vol. 35, no. 1, 2023.

] <ref-ashraf2023spontaneous>
#block[
\[43\] A. Kaestner, E. Lehmann, and M. Stampanoni, “Imaging and image processing in porous media research,” #emph[Advances in Water Resources], vol. 31, no. 9, pp. 1174--1187, 2008.

] <ref-kaestner2008imaging>
#block[
\[44\] M. J. Blunt #emph[et al.], “Pore-scale imaging and modelling,” #emph[Advances in Water resources], vol. 51, pp. 197--216, 2013.

] <ref-blunt2013pore>
#block[
\[45\] M. Prodanović #emph[et al.], “Digital rocks portal (digital porous media): Connecting data, simulation and community,” in #emph[E3S web of conferences], EDP Sciences, 2023.

] <ref-prodanovic2023digital>
#block[
\[46\] A. Mohamed and M. Prodanović, “Scale-independent rock heterogeneity classification algorithm applied to microtomography images,” #emph[Transport in Porous Media], pp. 1--28, 2023.

] <ref-mohamed2023scale>
#block[
\[47\] Z. Zhang, P. Trtik, F. Ren, T. Schmid, C. H. Dreimol, and U. Angst, “Dynamic effect of water penetration on steel corrosion in carbonated mortar: A neutron imaging, electrochemical, and modeling study,” #emph[Cement], vol. 9, p. 100043, 2022.

] <ref-zhang2022dynamic>
#block[
\[48\] I. Fatt, “The network model of porous media,” #emph[Transactions of the AIME], vol. 207, no. 1, pp. 144--181, 1956.

] <ref-fatt1956network>
#block[
\[49\] S. Bakke and P.-E. Øren, “3-d pore-scale modelling of sandstones and flow simulations in the pore networks,” #emph[Spe Journal], vol. 2, no. 2, pp. 136--149, 1997.

] <ref-bakke19973>
#block[
\[50\] M. J. Blunt, “Flow in porous media---pore-network models and multiphase flow,” #emph[Current opinion in colloid & interface science], vol. 6, no. 3, pp. 197--207, 2001.

] <ref-blunt2001flow>
#block[
\[51\] B. Berkowitz and I. Balberg, “Percolation theory and its application to groundwater hydrology,” #emph[Water Resources Research], vol. 29, no. 4, pp. 775--794, 1993.

] <ref-berkowitz1993percolation>
#block[
\[52\] M. A. Celia, P. C. Reeves, and L. A. Ferrand, “Recent advances in pore scale models for multiphase flow in porous media,” #emph[Reviews of Geophysics], vol. 33, no. S2, pp. 1049--1057, 1995.

] <ref-celia1995recent>
#block[
\[53\] M. S. Al-Gharbi and M. J. Blunt, “Dynamic network modeling of two-phase drainage in porous media,” #emph[Physical Review E], vol. 71, no. 1, p. 016308, 2005.

] <ref-al2005dynamic>
#block[
\[54\] V. Joekar-Niasar and S. Hassanizadeh, “Analysis of fundamentals of two-phase flow in porous media using dynamic pore-network models: A review,” #emph[Critical reviews in environmental science and technology], vol. 42, no. 18, pp. 1895--1976, 2012.

] <ref-joekar2012analysis>
#block[
\[55\] C.-Z. Qin and H. van Brummelen, “A dynamic pore-network model for spontaneous imbibition in porous media,” #emph[Advances in Water Resources], vol. 133, p. 103420, 2019.

] <ref-qin2019dynamic>
#block[
\[56\] Q. Xiong, T. G. Baychev, and A. P. Jivkov, “Review of pore network modelling of porous media: Experimental characterisations, network constructions and applications to reactive transport,” #emph[Journal of contaminant hydrology], vol. 192, pp. 101--117, 2016.

] <ref-xiong2016review>
#block[
\[57\] S. Foroughi, B. Bijeljic, Q. Lin, A. Q. Raeini, and M. J. Blunt, “Pore-by-pore modeling, analysis, and prediction of two-phase flow in mixed-wet rocks,” #emph[Physical Review E], vol. 102, no. 2, p. 023302, 2020.

] <ref-foroughi2020pore>
#block[
\[58\] J. Zhao, F. Qin, Q. Kang, C. Qin, D. Derome, and J. Carmeliet, “A dynamic pore network model for imbibition simulation considering corner film flow,” #emph[Water Resources Research], vol. 58, no. 7, p. e2022WR032332, 2022.

] <ref-zhao2022dynamic>
#block[
\[59\] S. Foroughi, B. Bijeljic, Y. Gao, and M. J. Blunt, “Incorporation of sub-resolution porosity into two-phase flow models with a multiscale pore network,” #emph[Authorea Preprints], 2023.

] <ref-foroughi2023incorporation>
#block[
\[60\] S. Pavuluri, J. Maes, J. Yang, M. Regaieg, A. Moncorgé, and F. Doster, “Towards pore network modelling of spontaneous imbibition: Contact angle dependent invasion patterns and the occurrence of dynamic capillary barriers,” #emph[Computational Geosciences], vol. 24, no. 2, pp. 951--969, Apr. 2020, doi: #link("https://doi.org/10.1007/s10596-019-09842-7")[10.1007/s10596-019-09842-7].

] <ref-pavuluri_towards_2020>
#block[
\[61\] S. Molins, D. Trebotich, C. I. Steefel, and C. Shen, “An investigation of the effect of pore scale flow on average geochemical reaction rates using direct numerical simulation,” #emph[Water Resources Research], vol. 48, no. 3, 2012.

] <ref-molins2012investigation>
#block[
\[62\] V. Starchenko, C. J. Marra, and A. J. Ladd, “Three-dimensional simulations of fracture dissolution,” #emph[Journal of Geophysical Research: Solid Earth], vol. 121, no. 9, pp. 6421--6444, 2016.

] <ref-starchenko2016three>
#block[
\[63\] V. Ramanuj, V. Starchenko, R. Sankaran, and M. K. Kidder, “Characteristics of flow through randomly packed impermeable and permeable particles using pore resolved simulations,” #emph[Chemical Engineering Science], vol. 228, p. 115969, 2020.

] <ref-ramanuj2020characteristics>
#block[
\[64\] V. Ramanuj, R. Sankaran, L. Malenica, K. Cole, M. Day, and J. McCutcheon, “Macrovoid resolved simulations of transport through HPRO relevant membrane geometries,” #emph[Journal of Membrane Science], vol. 662, p. 120958, 2022.

] <ref-ramanuj2022macrovoid>
#block[
\[65\] A. Q. Raeini, M. J. Blunt, and B. Bijeljic, “Modelling two-phase flow in porous media at the pore scale using the volume-of-fluid method,” #emph[Journal of Computational Physics], vol. 231, no. 17, pp. 5653--5668, 2012.

] <ref-raeini2012modelling>
#block[
\[66\] H. Liu #emph[et al.], “Multiphase lattice boltzmann simulations for porous media applications: A review,” #emph[Computational Geosciences], vol. 20, pp. 777--805, 2016.

] <ref-liu2016multiphase>
#block[
\[67\] I. Lunati, M. Prodanović, and M. L. Porter, “Special issue in advances in water resources: Pore-scale modeling and experiments,” #emph[Advances in Water Resources], vol. 95, pp. 1--2, 2016.

] <ref-lunati2016special>
#block[
\[68\] J. Maes and S. Geiger, “Direct pore-scale reactive transport modelling of dynamic wettability changes induced by surface complexation,” #emph[Advances in Water Resources], vol. 111, pp. 6--19, Jan. 2018, doi: #link("https://doi.org/10.1016/j.advwatres.2017.10.032")[10.1016/j.advwatres.2017.10.032].

] <ref-maes_direct_2018>
#block[
\[69\] C. Soulaine, J. Maes, and S. Roman, “Computational microfluidics for geosciences,” #emph[Frontiers in Water], vol. 3, p. 643714, 2021.

] <ref-soulaine2021computational>
#block[
\[70\] B. Zhao #emph[et al.], “Comprehensive comparison of pore-scale models for multiphase flow in porous media,” #emph[Proceedings of the National Academy of Sciences], vol. 116, no. 28, pp. 13799--13806, 2019.

] <ref-zhao2019comprehensive>
#block[
\[71\] Y. Liu #emph[et al.], “Influence of fractal surface roughness on multiphase flow behavior: Lattice Boltzmann simulation,” #emph[International Journal of Multiphase Flow], vol. 134, p. 103497, Jan. 2021, doi: #link("https://doi.org/10.1016/j.ijmultiphaseflow.2020.103497")[10.1016/j.ijmultiphaseflow.2020.103497].

] <ref-liu_influence_2021>
#block[
\[72\] A. M. Tartakovsky, N. Trask, K. Pan, B. Jones, W. Pan, and J. R. Williams, “Smoothed particle hydrodynamics and its applications for multiphase flow and reactive transport in porous media,” #emph[Computational Geosciences], vol. 20, pp. 807--834, 2016.

] <ref-tartakovsky2016smoothed>
#block[
\[73\] H. A. Friis, J. Pedersen, E. Jettestuen, J. O. Helland, and M. Prodanović, “Pore-scale level set simulations of capillary-controlled displacement with adaptive mesh refinement,” #emph[Transport in Porous Media], vol. 128, no. 1, pp. 123--151, 2019.

] <ref-friis2019pore>
#block[
\[74\] M. Shams, A. Q. Raeini, M. J. Blunt, and B. Bijeljic, “A numerical model of two-phase flow at the micro-scale using the volume-of-fluid method,” #emph[Journal of Computational Physics], vol. 357, pp. 159--182, 2018.

] <ref-shams2018numerical>
#block[
\[75\] F. Frank, C. Liu, F. O. Alpak, S. Berg, and B. Riviere, “Direct numerical simulation of flow on pore-scale images using the phase-field method,” #emph[SPE Journal], vol. 23, no. 5, pp. 1833--1850, 2018.

] <ref-frank2018direct>
#block[
\[76\] L. Malenica and H. Gotovac, “Full space-time adaptive method based on collocation strategy and implicit multirate time stepping,” #emph[International Journal for Numerical Methods in Fluids], vol. 93, no. 5, pp. 1606--1626, 2021.

] <ref-malenica2021full>
#block[
\[77\] M. Liem, S. Matthai, and P. Jenny, “Adaptive conservative time integration for transport in fractured porous media,” #emph[Advances in Water Resources], vol. 165, p. 104213, 2022.

] <ref-liem2022adaptive>
#block[
\[78\] H. Wu, M. Veyskarami, M. Schneider, and R. Helmig, “A new fully implicit two-phase pore-network model by utilizing regularization strategies,” #emph[Transport in Porous Media], pp. 1--26, 2023.

] <ref-wu2023new>
#block[
\[79\] A. Ferrari and I. Lunati, “Direct numerical simulations of interface dynamics to link capillary pressure and total surface energy,” #emph[Advances in water resources], vol. 57, pp. 19--31, 2013.

] <ref-ferrari2013direct>
#block[
\[80\] A. Q. Raeini, B. Bijeljic, and M. J. Blunt, “Generalized network modeling of capillary-dominated two-phase flow,” #emph[Physical Review E], vol. 97, no. 2, p. 023308, 2018.

] <ref-raeini2018generalized>
#block[
\[81\] H. P. Menke, J. Maes, and S. Geiger, “Upscaling the porosity--permeability relationship of a microporous carbonate for Darcy-scale flow with machine learning,” #emph[Scientific Reports], vol. 11, no. 1, p. 2625, Jan. 2021, doi: #link("https://doi.org/10.1038/s41598-021-82029-2")[10.1038/s41598-021-82029-2].

] <ref-menke_upscaling_2021>
#block[
\[82\] L. M. Giudici, A. Qaseminejad Raeini, M. J. Blunt, and B. Bijeljic, “Representation of fully three-dimensional interfacial curvature in pore-network models,” #emph[Water Resources Research], vol. 59, no. 4, p. e2022WR033983, 2023.

] <ref-giudici2023representation>
#block[
\[83\] G. Tryggvason, R. Scardovelli, and S. Zaleski, #emph[Direct Numerical Simulations of Gas--Liquid Multiphase Flows]. Cambridge University Press, 2011.

] <ref-tryggvason_direct_2011>
#block[
\[84\] J. U. Brackbill, D. B. Kothe, and C. Zemach, “A continuum method for modeling surface tension,” #emph[Journal of Computational Physics], vol. 100, no. 2, pp. 335--354, Jun. 1992, doi: #link("https://doi.org/10.1016/0021-9991(92)90240-Y")[10.1016/0021-9991(92)90240-Y].

] <ref-brackbill_continuum_1992>
#block[
\[85\] C. W. Hirt and B. D. Nichols, “Volume of fluid (VOF) method for the dynamics of free boundaries,” #emph[Journal of Computational Physics], vol. 39, no. 1, pp. 201--225, Jan. 1981, doi: #link("https://doi.org/10.1016/0021-9991(81)90145-5")[10.1016/0021-9991(81)90145-5].

] <ref-hirt_volume_1981>
#block[
\[86\] J. Maes and C. Soulaine, “Direct Pore-Scale Modelling Of Dissolution And Trapping Of Supercritical CO2 In Reservoir Brine,” in #emph[ECMOR XVI - 16th European Conference on the Mathematics of Oil Recovery], European Association of Geoscientists & Engineers, Sep. 2018, pp. 1--12. doi: #link("https://doi.org/10.3997/2214-4609.201802238")[10.3997/2214-4609.201802238].

] <ref-maesDirectPoreScaleModelling2018>
#block[
\[87\] J. Maes and C. Soulaine, “A unified single-field Volume-of-Fluid-based formulation for multi-component interfacial transfer with local volume changes,” #emph[Journal of Computational Physics], vol. 402, p. 109024, Feb. 2020, doi: #link("https://doi.org/10.1016/j.jcp.2019.109024")[10.1016/j.jcp.2019.109024].

] <ref-maes_unified_2020>
#block[
\[88\] J. Maes, C. Soulaine, and H. P. Menke, “Improved Volume-Of-Solid Formulations for Micro-Continuum Simulation of Mineral Dissolution at the Pore-Scale,” #emph[Frontiers in Earth Science], vol. 10, 2022.

] <ref-maes_improved_2022>
#block[
\[89\] H. P. Menke, J. Maes, and S. Geiger, “Channeling is a distinct class of dissolution in complex porous media,” #emph[Scientific Reports], vol. 13, no. 1, p. 11312, 2023.

] <ref-menke2023channeling>
#block[
\[90\] J. Maes and C. Soulaine, “A new compressive scheme to simulate species transfer across fluid interfaces using the Volume-Of-Fluid method,” #emph[Chemical Engineering Science], vol. 190, pp. 405--418, Nov. 2018, doi: #link("https://doi.org/10.1016/j.ces.2018.06.026")[10.1016/j.ces.2018.06.026].

] <ref-maes_new_2018>
#block[
\[91\] J. Maes and H. P. Menke, “GeoChemFoam: Direct modelling of flow and heat transfer in micro-CT images of porous media,” #emph[Heat and Mass Transfer], vol. 58, no. 11, pp. 1937--1947, Nov. 2022, doi: #link("https://doi.org/10.1007/s00231-022-03221-2")[10.1007/s00231-022-03221-2].

] <ref-maes_geochemfoam_2022>
#block[
\[92\] J. Maes and H. P. Menke, “GeoChemFoam: Direct Modelling of Multiphase Reactive Transport in Real Pore Geometries with Equilibrium Reactions,” #emph[Transport in Porous Media], vol. 139, no. 2, pp. 271--299, Sep. 2021, doi: #link("https://doi.org/10.1007/s11242-021-01661-8")[10.1007/s11242-021-01661-8].

] <ref-maes_geochemfoam_2021>
#block[
\[93\] R. I. Issa, “Solution of the implicitly discretised fluid flow equations by operator-splitting,” #emph[Journal of Computational Physics], vol. 62, no. 1, pp. 40--65, Jan. 1986, doi: #link("https://doi.org/10.1016/0021-9991(86)90099-9")[10.1016/0021-9991(86)90099-9].

] <ref-issa_solution_1986>
#block[
\[94\] J. Maes and H. P. Menke, “GeoChemFoam: Operator splitting based time-stepping for efficient volume-of-fluid simulation of capillary-dominated two-phase flow,” #emph[arXiv preprint arXiv:2105.10576], 2021.

] <ref-maes2021geochemfoam>
#block[
\[95\] Z. Zhang and U. Angst, “Different anomalies of two-stage water absorption in carbonated and non-carbonated cement-based materials,” #emph[Cement and Concrete Research], vol. 183, p. 107560, Sep. 2024, doi: #link("https://doi.org/10.1016/j.cemconres.2024.107560")[10.1016/j.cemconres.2024.107560].

] <ref-zhangDifferentAnomaliesTwostage2024>
#block[
\[96\] U. M. Angst #emph[et al.], “The steel--concrete interface,” #emph[Materials and Structures], vol. 50, no. 2, p. 143, Feb. 2017, doi: #link("https://doi.org/10.1617/s11527-017-1010-1")[10.1617/s11527-017-1010-1].

] <ref-angst_steelconcrete_2017>
#block[
\[97\] L. Malenica, Z. Zhang, and U. Angst, “Direct Numerical Modelling Of Capillary Driven Multiphase Flow at the Embedded Steel - Porous Media Interface,” in #emph[The 9th World Congress on Momentum, Heat and Mass Transfer], Apr. 2024. doi: #link("https://doi.org/10.11159/icmfht24.175")[10.11159/icmfht24.175].

] <ref-malenicaDirectNumericalModelling2024>
#block[
\[98\] H. Dong, P. Gao, and G. Ye, “Characterization and comparison of capillary pore structures of digital cement pastes,” #emph[Materials and Structures], vol. 50, no. 2, p. 154, Mar. 2017, doi: #link("https://doi.org/10.1617/s11527-017-1023-9")[10.1617/s11527-017-1023-9].

] <ref-dongCharacterizationComparisonCapillary2017>
#block[
\[99\] A. Ferrari and I. Lunati, “Inertial effects during irreversible meniscus reconfiguration in angular pores,” #emph[Advances in Water Resources], vol. 74, pp. 1--13, Dec. 2014, doi: #link("https://doi.org/10.1016/j.advwatres.2014.07.009")[10.1016/j.advwatres.2014.07.009].

] <ref-ferrari_inertial_2014>
#block[
\[100\] I. Zacharoudiou, E. M. Chapman, E. S. Boek, and J. P. Crawshaw, “Pore-filling events in single junction micro-models with corresponding lattice Boltzmann simulations,” #emph[Journal of Fluid Mechanics], vol. 824, pp. 550--573, Aug. 2017, doi: #link("https://doi.org/10.1017/jfm.2017.363")[10.1017/jfm.2017.363].

] <ref-zacharoudiou_pore-filling_2017>
#block[
\[101\] R. Wu, A. Kharaghani, and E. Tsotsas, “Two-phase flow with capillary valve effect in porous media,” #emph[Chemical Engineering Science], vol. 139, pp. 241--248, 2016.

] <ref-wu2016two>
#block[
\[102\] B. Hu, Z. Gu, C. Zhou, L. Wang, C. Huang, and J. Su, “Investigation of the Effect of Capillary Barrier on Water--Oil Movement in Water Flooding,” #emph[Applied Sciences], vol. 12, no. 12, p. 6285, Jan. 2022, doi: #link("https://doi.org/10.3390/app12126285")[10.3390/app12126285].

] <ref-hu_investigation_2022>
#block[
\[103\] H. Liu, S. Sun, R. Wu, B. Wei, and J. Hou, “Pore-scale modeling of spontaneous imbibition in porous media using the lattice boltzmann method,” #emph[Water Resources Research], vol. 57, no. 6, p. e2020WR029219, 2021.

] <ref-liu2021pore>
#block[
\[104\] S. Pavuluri, J. Maes, and F. Doster, “Spontaneous imbibition in a microchannel: Analytical solution and assessment of volume of fluid formulations,” #emph[Microfluidics and Nanofluidics], vol. 22, no. 8, p. 90, Aug. 2018, doi: #link("https://doi.org/10.1007/s10404-018-2106-9")[10.1007/s10404-018-2106-9].

] <ref-pavuluri_spontaneous_2018>
#block[
\[105\] J. Bico and D. Quéré, “Precursors of impregnation,” #emph[Europhysics Letters], vol. 61, no. 3, p. 348, 2003.

] <ref-bico2003precursors>
#block[
\[106\] S. Ashraf, G. Visavale, S. Bahga, and J. Phirani, “Spontaneous imbibition in parallel layers of packed beads,” #emph[The European Physical Journal E], vol. 40, pp. 1--6, 2017.

] <ref-ashraf2017spontaneous>
#block[
\[107\] S. Ashraf and J. Phirani, “Capillary displacement of viscous liquids in a multi-layered porous medium,” #emph[Soft matter], vol. 15, no. 9, pp. 2057--2070, 2019.

] <ref-ashraf2019capillary>
#block[
\[108\] S. Ashraf, G. Visavale, and J. Phirani, “Spontaneous imbibition in randomly arranged interacting capillaries,” #emph[Chemical Engineering Science], vol. 192, pp. 218--234, 2018.

] <ref-ashraf2018spontaneous>
#block[
\[109\] M. Bianchi Janetti and H. Janssen, “Effect of dynamic contact angle variation on spontaneous imbibition in porous materials,” #emph[Transport in Porous Media], vol. 142, no. 3, pp. 493--508, Apr. 2022, doi: #link("https://doi.org/10.1007/s11242-022-01754-y")[10.1007/s11242-022-01754-y].

] <ref-bianchi_janetti_effect_2022>
#block[
\[110\] L. Zhang #emph[et al.], “Mathematical Model of Two-Phase Spontaneous Imbibition with Dynamic Contact Angle,” #emph[Transport in Porous Media], vol. 148, no. 1, pp. 157--172, May 2023, doi: #link("https://doi.org/10.1007/s11242-023-01934-4")[10.1007/s11242-023-01934-4].

] <ref-zhangMathematicalModelTwoPhase2023>
#block[
\[111\] J. H. Ferziger, M. Perić, and R. L. Street, #emph[Computational Methods for Fluid Dynamics]. Cham: Springer International Publishing, 2020. doi: #link("https://doi.org/10.1007/978-3-319-99693-6")[10.1007/978-3-319-99693-6].

] <ref-ferzigerComputationalMethodsFluid2020>
#block[
\[112\] S. H. Smith, M. Vandamme, and K. E. Kurtis, “Dissolution kinetics of trapped air in a spherical void: Modeling the long-term saturation of cementitious materials,” #emph[Cement and Concrete Research], vol. 130, p. 105996, Apr. 2020, doi: #link("https://doi.org/10.1016/j.cemconres.2020.105996")[10.1016/j.cemconres.2020.105996].

] <ref-smithDissolutionKineticsTrapped2020>
] <refs>
