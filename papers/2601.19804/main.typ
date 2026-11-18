// Typst conversion of arXiv:2601.19804v1 under CC BY 4.0.
#set page(paper: "a4", margin: 21mm, numbering: "1")
#set text(font: "Libertinus Serif", size: 11pt)
#set par(justify: true)
#set heading(numbering: "1.1")
#set math.equation(numbering: "(1)")
#align(center)[
  #text(size: 17pt, weight: "bold")[Hydrodynamic Behavior of Non-spherical Particles in Confined Vertical Flows: A Resolved CFD-DEM Study]
  #v(4pt)
  Amiya Prakash Das#super[1], Shakti Swaroop Choudhury#super[1],
  Sujith Reddy Jaggannagari#super[1], Amudha Krishnan#super[2],
  Gopkumar Kuttikrishnan#super[2], and Ratna Kumar Annabattula#super[1]

  #super[1] Mechanics of Materials Lab, Department of Mechanical Engineering, Indian Institute of Technology Madras, Chennai 600036, Tamil Nadu, India

  #super[2] Deep Sea Mining, National Institute of Ocean Technology, Chennai 600100, Tamil Nadu, India

  #link("mailto:apdas@connect.ust.hk") · Corresponding author: #link("mailto:ratna@iitm.ac.in")
]
#heading(numbering: none)[Abstract]
We investigate the sedimentation and vertical hydraulic transport of
irregular polymetallic nodules (PMNs) using resolved CFD-DEM with
multisphere particles spanning $100 < R e_p < 3000$. Shape effects
induce 2.0-2.3 times drag enhancement relative to volume-equivalent
spheres, arising from 50% larger frontal areas and wake asymmetry,
reducing terminal velocities by 29-33%. Vertical transport exhibits
velocity-driven transitions from intermittent settling to stable
convection, as demonstrated by residence-time and drag-force statistics.
While PMNs exhibit enhanced rotational-translational coupling and
broader force fluctuations, the regime progression qualitatively
resembles that of volume-equivalent spherical particles. Drag variance
evolution reveals contrasting behavior: small particles
$\( d \/ D = 0.082 \)$ show narrow distributions and wake suppression at
higher velocities, while large particles $\( d \/ D = 0.22 \)$ exhibit
non-monotonic variance. These findings elucidate shape-confinement
interactions in vertical transport and establish bounds on the
applicability of volume-equivalent spherical particles in reduced-order
models.

*Keywords:* Non-spherical Particles; Immersed Boundary Method; CFD-DEM; Deep-sea Mining; Polymetallic Nodules

= Introduction
<Sec:Introduction>
The recovery of polymetallic nodules (PMNs) from abyssal plains relies
on hydraulic systems to transport coarse non-spherical particles through
vertical risers extending several
kilometers~@hein2020deep@leng2021brief. The efficiency of these systems
depends on the ability to predict particle entrainment, suspension
stability, and transport behavior under strong gravitational forcing and
geometric
confinement~@van2016stability@dai2024cfd@su2024effects@chen2025deep@yang2025numerical.
In such risers, particles are often comparable in size to the riser
diameter and interact strongly with both the carrier fluid and the
confining walls, leading to complex multiphase flow
behavior~@shen2022resolved@schnorr2022resolved@zhao2022numerical@sun2025transition@yang2025effect.

Hydraulic collection systems are favored in deep-sea mining operations
for their operational efficiency and mechanical
simplicity~@liu2023deep@li2024cfd@zhang2024one. These systems rely on
fluid entrainment to transport PMNs through vertical risers, a process
governed by the hydrodynamic behavior of coarse, non-spherical particles
in dense
slurries~@zhou2010discrete@zhou2011discrete@elskamp2017strategy@fan2024lattice@chen2025particle@huang2025hydraulic.
However, the hydraulic transport of PMNs differs fundamentally from
particle-laden flow owing to strong confinement effects, particle size,
and morphology. Unlike spherical particles, PMNs exhibit complex
particle-flow interactions characterized by enhanced drag,
shape-dependent lift forces, coupled rotational-translational motion,
and altered settling
dynamics~@haider1989drag@ganser1993rational@holzer2008new@chen2020study.
These shape effects significantly influence transport efficiency,
minimum suspension velocity, and energy consumption. The particle-shape
effects have been extensively studied in unconfined and weakly confined
flows~@diamant2009hydrodynamic@suresh2011effects@bagheri2016drag@cheng2023numerical.
Their role in narrow vertical risers with high confinement ratios
$\( d \/ D gt.eq 0.2 \)$, representative of deep-sea mining risers,
remains underexplored.

Existing numerical studies of hydraulic transport use unresolved CFD-DEM
frameworks, in which particle-fluid interactions are modeled using
empirical drag correlations~@di1994voidage@zhao2013coupled. These
correlations are primarily calibrated for spherical particles and do not
capture the mesoscale physics associated with surface morphology of
non-spherical particles, like orientation-dependent drag, wake
asymmetry, and rotational
coupling~@holzer2008new@malone2008particle@nan2022cfd@cheng2023numerical.
The limitations of unresolved approaches are particularly pronounced in
highly confined flows, where particle-fluid and particle-wall
interactions dominate the transport dynamics and may trigger flow
instabilities, intermittent settling, and
jamming~@sommerfeld1992modelling@aponte2016simulation@chen2020prediction.
Resolved CFD-DEM offers a physically robust alternative by explicitly
resolving particle-fluid interactions at the interface without relying
on empirical closures~@luo2007modified@lu2018direct@yan2025complex.
Recent studies have demonstrated the ability of resolved CFD-DEM to
capture shape effects and confinement-induced transport phenomena in
narrow risers, including shear jamming, wake-mediated interactions, and
regime
transitions~@cunez2019plug@cunez2020crystallization@schnorr2022resolved.
Advancements in geometric representation using signed distance functions
(SDF) and multisphere approximations have further enhanced the
adaptability of these methods for modeling arbitrarily shaped
particles~@shen2022resolved@lai2023signed. These developments establish
resolved CFD-DEM as a robust tool for investigating mesoscale
particle-fluid interactions, which are critical to engineering
applications~@nan2023high@hu2024resolved.

Despite advancements, resolved CFD-DEM for industrial-scale riser
simulations remains computationally prohibitive. Resolving realistic PMN
surface morphology for $cal(O) \( 10^3 - 10^4 \)$ particles using
SDF/multisphere over large-scale domains requires substantial CPU hours,
making parametric design intractable. Consequently, large-scale
simulations often resort to spherical representations, achieving
order-of-magnitude reductions in CPU hours at the expense of
morphological fidelity. This raises a critical question: can
volume-equivalent spheres accurately reproduce the transport behavior of
realistic PMNs, or do shape effects persist at the ensemble level?
Addressing this requires systematic validation that isolates
shape-induced hydrodynamic effects from collective phenomena such as
dense-phase interactions and polydispersity, a distinction obscured in
fully representative industrial simulations. The present study employs a
controlled vertical transport configuration with moderate particle
ensembles, enabling direct comparison of X-ray computed tomography (CT)
reconstructed PMNs with volume-equivalent spherical particles under
identical flow conditions.

In this work, we employ resolved CFD-DEM to investigate the hydrodynamic
behavior of non-spherical PMNs in vertical pipes representative of
deep-sea mining risers. The model couples the incompressible
Navier-Stokes equations with Newton's equations of motion for discrete
particles, whose irregular geometries are represented using multisphere
approximations derived from CT scans. We systematically analyze the
influence of particle-to-pipe diameter ratio, particle Reynolds number,
and flow velocity on particle trajectories, residence time
distributions, and drag force statistics. Residence time analysis
characterizes the transition from settling-dominated to
convection-dominated transport, enabling prediction of minimum
suspension velocities~@chen2019cfd@lan2020long, while drag force
statistics reveal underlying force balance mechanisms. The objectives
are twofold: first, to elucidate mechanisms by which particle shape
influences drag, wake dynamics, and rotational-translational coupling in
confined vertical flows; and second, to assess whether ensemble-averaged
transport metrics for non-spherical PMNs qualitatively converge toward
those of volume-equivalent spheres, thereby establishing when spherical
models are suitable for reduced-order simulations of large-scale
hydraulic transport systems.

The remainder of this paper is structured as
follows.~#link(<Sec:Methodology>)[2] presents the mathematical
formulation of the resolved CFD-DEM framework, detailing the
Navier-Stokes equations for the fluid phase, Newton's equations for
particle dynamics, the immersed boundary method for fluid-solid
coupling, and the multisphere representation for complex
geometries.~#link(<sec:numerical_verification>)[3] presents numerical
verification through comparisons with benchmark experiments for
spherical and non-spherical particle sedimentation, establishing the
model's accuracy across the Stokes-to-intermediate Reynolds number
regime. In addition, we have used the classical DKT problem to resolve
multiple particle interactions using CFD-DEM
framework.~#link(<sec:results_discussion>)[4] discussion presents
results in two parts: sedimentation analysis, which quantifies the
effects of shape on drag coefficients and terminal velocities; and
vertical transport simulations that analyze entrainment dynamics,
residence time distributions, and drag force statistics as functions of
flow velocity and confinement ratio.~#link(<Sec:Summary>)[5] summarizes
key findings and discusses implications for hydraulic transport in
deep-sea mining applications.

= Methodology
<Sec:Methodology>
We employ a resolved CFD-DEM framework to investigate the hydraulic
transport of coarse, non-spherical PMNs in a vertical cylindrical pipe.
The framework couples the Immersed Boundary (IB) method with CFD-DEM,
integrating OpenFOAM for fluid dynamics simulation and LIGGGHTS for
discrete particle tracking~@klossnew. This fully resolved, bidirectional
coupling framework captures the complex multiphase interactions between
fluid flow, particle transport, and sedimentation dynamics by resolving
meso-scale physics at the fluid-solid interface through a
Lagrangian-Eulerian formulation.

== Discrete Element Method for Particle Dynamics
<discrete-element-method-for-particle-dynamics>
Individual particles are modeled within a Lagrangian framework using
DEM, where Newton's second law governs each particle's motion for both
translational and rotational dynamics
$ m_i frac(d upright(bold(u))_i, d t) = m_i upright(bold(g)) + sum_(j eq.not i)^(N_c) upright(bold(F))_(upright("c") \, i j) + sum_k^(N_w) upright(bold(F))_(upright("c") \, i k) + upright(bold(F))_(upright("f") \, i) \, $<eq:translation>
$ bb(I)_i frac(d upright(bold(omega))_i, d t) = sum_(j eq.not i)^(N_c) upright(bold(T))_(upright("c") \, i j) + sum_k^(N_w) upright(bold(T))_(upright("c") \, i k) \, $<eq:rotation>
where $m_i$ and $bb(I)_i$ represent the mass and moment of inertia
tensor of particle $i$, $upright(bold(u))_i$ and
$upright(bold(omega))_i$ denote linear and angular velocity vectors,
$upright(bold(g))$ is the gravitational acceleration vector,
$upright(bold(F))_(upright("c") \, i j)$ and
$upright(bold(T))_(upright("c") \, i j)$ are contact forces and torques
between particles $i$ and $j$, $upright(bold(F))_(upright("c") \, i k)$
and $upright(bold(T))_(upright("c") \, i k)$ represent wall-particle
interactions with wall $k$, and $upright(bold(F))_(upright("f") \, i)$
is the particle-fluid interaction force computed via the IB method. The
particle-particle and particle-wall contact forces are computed using
the Hertz-Mindlin contact model with Coulomb friction, which provides an
accurate representation of non-linear deformation and energy dissipation
during collisions between non-spherical
particles~@mindlin1953elastic@hager2012parallel. The contact detection
algorithm efficiently handles complex particle geometries represented as
multisphere assemblies.

== Computational Fluid Dynamics Formulation
<computational-fluid-dynamics-formulation>
The continuous fluid phase is resolved using an Eulerian framework based
on the incompressible Navier-Stokes equations within the fluid domain
$Omega_(upright("f"))$,
using~@eq:continuity and @eq:momentum
$ upright(bold(nabla)) dot.op upright(bold(u))_(upright("f")) = 0 \, $<eq:continuity>
$ frac(partial upright(bold(u))_(upright("f")), partial t) + \( upright(bold(u))_(upright("f")) dot.op upright(bold(nabla)) \) upright(bold(u))_(upright("f")) = - 1 / rho_(upright("f")) nabla p + nu nabla^2 upright(bold(u))_(upright("f")) \, $<eq:momentum>
where $upright(bold(u))_(upright("f"))$ represents the fluid velocity
field, $p$ is the pressure, $rho_(upright("f"))$ is the fluid density,
and $nu = mu_(upright("f")) \/ rho_(upright("f"))$ is the kinematic
viscosity with $mu_(upright("f"))$ being the dynamic viscosity. The
fluid velocity field is initialized as
$upright(bold(u))_(upright("f")) \( upright(bold(x)) \, t = 0 \) = upright(bold(u))_0 \( upright(bold(x)) \)$
in $Omega_(upright("f"))$, with Dirichlet boundary conditions
$upright(bold(u))_(upright("f")) = upright(bold(u))_Gamma$ imposed at
domain boundaries $Gamma$. At the fluid-solid interface
$Gamma_(upright("s"))$, the no-slip condition enforces velocity
continuity
$ upright(bold(u))_(upright("f")) = upright(bold(u))_(upright("s")) quad upright("on") quad Gamma_(upright("s")) \, $<eq:no_slip>
where $upright(bold(u))_(upright("s"))$ represents the local solid
velocity. The fluid stress tensor is defined as
$bb(sigma) = - p bb(1) + mu_(upright("f")) \( nabla upright(bold(u))_(upright("f")) + \( nabla upright(bold(u))_(upright("f")) \)^T \)$,
and the surface traction at the interface is
$upright(bold(t)) = bb(sigma) dot.op upright(bold(n))$ with
$upright(bold(n))$ being the outward unit normal vector. The governing
equations are discretized using OpenFOAM's finite-volume method with
second-order spatial accuracy, and temporal integration employs the
Pressure-Implicit with Splitting of Operators (PISO) algorithm for
robust pressure-velocity coupling~@shen2022resolved.

== Immersed Boundary Method for Fluid-Solid Coupling
<immersed-boundary-method-for-fluid-solid-coupling>
The immersed boundary method provides direct fluid-solid coupling by
resolving the interface $Gamma_s$ without empirical drag correlations,
offering significant advantages over the unresolved CFD-DEM framework in
terms of accuracy and physical fidelity~@schnorr2022resolved. The
no-slip condition (#link(<eq:no_slip>)[\[eq:no\_slip\]]) is enforced
through a direct forcing approach that modifies the momentum equation.
The total hydrodynamic force acting on particle $i$ is computed by
integrating the fluid stress over the particle surface
$ upright(bold(F))_(upright("f") \, i) = integral_(Gamma_(upright("s") \, i)) bb(sigma) dot.op upright(bold(n)) thin d A approx sum_(upright("c") in V_(Omega_(upright("s") \, i))) (- nabla p + mu_(upright("f")) nabla^2 upright(bold(u))_(upright("f")))_(upright("c")) V_(upright("c")) \, $<eq:fluid_force>

where $V_(Omega_(upright("s") \, i))$ represents the set of fluid cells
overlapping with solid domain $Omega_(upright("s") \, i)$,
$V_(upright("c"))$ is the volume of cell $c$, and the summation extends
over all fluid cells influenced by particle $i$. This formulation
captures pressure (buoyancy), viscous drag, and added mass effects
without requiring empirical closure
relations~@schnorr2022resolved@lai2023signed. Void fraction weighting
ensures accurate force distribution across the fluid-solid interface,
accounting for partial cell occupancy by solid particles.

To ensure accurate resolution of boundary layers around complex particle
geometries, the computational grid satisfies the criterion
$Delta x \/ D < 0.1$, where $Delta x$ is the characteristic grid spacing
and $D$ is the characteristic particle dimension~@shen2022resolved. This
resolution requirement ensures that the viscous boundary layer and
near-wall velocity gradients are properly captured for non-spherical
particles across the range of $R e_(upright("p"))$ investigated. The
coupling between CFD and DEM solver occurs at a coupling interval of 10
timesteps, with fluid forces
from~#link(<eq:fluid_force>)[\[eq:fluid\_force\]] passed to the DEM
solver. The updated particle positions and velocities are communicated
back to the CFD domain. This bidirectional feedback maintains momentum
conservation across the fluid-solid interface while preserving numerical
stability through appropriate time step restrictions based on the
Courant-Friedrichs-Lewy (Courant number) condition and particle
collision time scales.

== Particle Representation
<particle-representation>
Complex particle geometries are represented using the multisphere
approach, where non-spherical particles are constructed as rigid
assemblies of overlapping spherical sub-particles,
see~#link(<fig:particle_representation>)[1]\(a). This approach is
computationally efficient and high-fidelity, capturing the essential
geometric features that influence particle-fluid interactions and
collision dynamics. The void fraction field visualization,
see~#link(<fig:particle_representation>)[1]\(b), demonstrates the
approach's capability to resolve complex particle-fluid interfaces
within the Eulerian CFD grid.

#figure(image("source/Figure1.png", width: 60.0%),
  caption: [
    Multisphere representation of non-spherical particles in the
    resolved CFD-DEM framework. (a) Example particle geometry
    constructed from 14 overlapping spherical sub-particles,
    demonstrating the multisphere approach for capturing irregular
    surface features. (b) Corresponding void fraction field distribution
    in the computational domain, where white regions indicate solid
    particle volume and blue regions represent pure fluid. The void
    fraction field resolves the fluid-solid interface within the
    Eulerian CFD grid, enabling accurate computation of hydrodynamic
    forces via the IB method without requiring empirical drag
    correlations.
  ]
)
<fig:particle_representation>

= Numerical verification
<sec:numerical_verification>
== Single Sphere Settling
<single-sphere-settling>
The computational framework is verified against experimental data and
numerical benchmarks through simulations of a single spherical particle
settling in quiescent fluid. We compare our results with the
experimental measurements of~#cite(<ten2002particle>, form: "prose") and
numerical predictions from Lattice Boltzmann Method-DEM
(LBM-DEM)~@ten2002particle and CFD-DEM simulations~@lai2023signed to
assess the accuracy of terminal velocity predictions within 5% of
reference values.

The numerical verification configuration follows the experimental setup
of~#cite(<ten2002particle>, form: "prose"), where a submerged sphere
with diameter $d = 15 med upright("m") upright("m")$ and density
$rho_(upright("s")) = 1120 med upright("k") upright("g") upright("/") upright("m")^3$
undergoes free sedimentation within a confined domain of dimensions
$100 times 100 times 160 med upright("m") upright("m")^3$. Two test
cases with different fluid properties are investigated, as summarized
in~#link(<tab:table_2>)[1], with particles' Reynolds numbers
$\( R e_(upright("p")) \)$ spanning from the Stokes regime to
intermediate $R e_(upright("p"))$ where inertial effects become
significant, where
$R e_(upright("p")) = rho_(upright("f")) u_t d \/ mu_(upright("f"))$.
The computational domain is discretized into 819,200 hexahedral cells,
with a particle diameter-to-cell ratio of $d \/ Delta x = 12$, ensuring
adequate boundary-layer resolution around the particle. Dynamic mesh
refinement is applied locally at the particle-fluid interface to
maintain accuracy during particle motion. Time integration employs
$Delta t_(upright("DEM")) = 1 times 10^(- 5) med  med upright("s")$ for
particle dynamics and
$Delta t_(upright("CFD")) = 1 times 10^(- 4) med  med upright("s")$ for
fluid flow, with the Courant number maintained below 0.01 for numerical
stability. Convergence is monitored through pressure and velocity
residuals, with a tolerance of $10^(- 6)$.~#link(<fig:fig1>)[2] presents
the temporal evolution of particle velocity for the verification cases,
where solid lines represent the CFD-DEM predictions and markers denote
experimental measurements. The simulated velocity profiles show good
agreement with experimental data throughout the acceleration phase and
towards the terminal velocity. Quantitative verification metrics are
provided in~#link(<tab:table_2>)[1], where $u_max \/ u_t$ represents the
normalized maximum velocity during the initial acceleration phase, and
$R e_(upright("p"))$ is the particles' Reynolds number based on terminal
velocity. The maximum deviation between simulated and experimental
terminal velocities remains below 10% for the cases, with the
$u_max \/ u_t$ accurately captured within 10% of experimental values.

#figure(
  align(center)[#table(
    columns: 6,
    align: (center,center,center,center,center,center,),
    table.header([#strong[Case]], [#strong[$rho_(upright("f")) \(  med upright("k") upright("g") upright("/") upright("m")^3 \)$]], [#strong[$mu_(upright("f")) \(  med upright("Pa") dot.op upright("s") \)$]], [#strong[$u_t \(  med upright("m") upright("/") upright("s") \)$]#footnote[Experimental
      terminal velocity
      from~#cite(<ten2002particle>, form: "prose")]], [#strong[$u_max \/ u_t$]], [#strong[$R e_(upright("p"))$]],),
    table.hline(),
    [Case 1], [970], [0.373], [0.038], [0.89], [1.3],
    [Case 2], [960], [0.058], [0.128], [0.93], [29.4],
  )]
  , caption: [Verification metrics comparing CFD-DEM predictions with
  experimental data from~#cite(<ten2002particle>, form: "prose").
  Terminal velocity $u_t$ values are calculated from experimental
  measurements.]
  , kind: table
  )

<tab:table_2>

The flow field snapshots
in~@fig:fig2 and @fig:fig3 demonstrate
the transition from viscous-dominated to inertia-dominated settling as
$R e_(upright("p"))$ increases. Case 1 ($R e_(upright("p")) = 1.3$)
exhibits symmetric streamlines characteristic of Stokes flow, where
viscous forces dominate, and inertial effects are negligible.
Streamlines smoothly deflect around the particle and reconverge within
$approx 3.0 d$ downstream with no wake formation,
see~#link(<fig:fig3>)[3]b. The velocity field decays smoothly to the
far-field value, with the pressure distribution remaining nearly
uniform, indicating that viscous shear stress contributes significantly
to the total drag. The symmetric flow structure is consistent with the
analytical Stokes solution for creeping flow past a sphere.

In contrast, Case 2 ($R e_(upright("p")) = 29.8$) shows flow separation
behind the particle with a wake region extending approximately $1.0 d$
downstream. The wake contains slow-moving recirculating fluid, and the
pressure in this wake region is lower than upstream, leading to an
increased drag contribution due to the pressure difference and lower
viscous drag contribution. The transition from symmetric flow to
separated flow (see~#link(<fig:fig2>)[4]b) occurs as inertial forces
become more pronounced relative to viscous forces when
$R e_(upright("p"))$ increases from approximately 1 to 30. The simulated
flow patterns agree well with experimental data from
#cite(<ten2002particle>, form: "prose"). The terminal velocities and
wake structures match the experimental measurements within 5%,
validating the numerical method across the range
$1 < R e_(upright("p")) < 50$.

#figure(image("source/Figure2.svg", width: 55.0%),
  caption: [
    Temporal evolution of settling velocity for verification cases
    comparing CFD-DEM predictions (solid lines) with experimental
    measurements from~#cite(<ten2002particle>, form: "prose") (symbols).
    The simulations capture both the acceleration phase and the approach
    to terminal velocity, with an accuracy of 10%, verifying the IB
    method for hydrodynamic force calculation across the transitional
    Reynolds number regime.
  ]
)
<fig:fig1>

#figure(grid(columns: (3 * (1fr,)), gutter: 2mm, [a) #linebreak() #image("source/Figure3a.png", width: 100%)], [b) #linebreak() #image("source/Figure3b.png", width: 100%)], [c) #linebreak() #image("source/Figure3c.png", width: 100%)]),
  caption: [
    Velocity contours and streamlines for $R e_(upright("p")) = 1.3$
    (case 1) showing symmetric flow patterns characteristic of the
    viscous regime. (a) Initial acceleration phase with developing
    boundary layer. (b) Approach to terminal velocity exhibiting
    symmetric streamlines that, consistent with Stokes flow past a
    sphere. (c) Particle at $0.5 d$ from the domain bottom showing a
    fully developed symmetric flow field with smooth velocity decay to
    far-field values.
  ]
)
<fig:fig3>

#figure(grid(columns: (3 * (1fr,)), gutter: 2mm, [a) #linebreak() #image("source/Figure4a.png", width: 100%)], [b) #linebreak() #image("source/Figure4b.png", width: 100%)], [c) #linebreak() #image("source/Figure4c.png", width: 100%)]),
  caption: [
    Velocity contours and streamlines for $R e_(upright("p")) = 29.8$
    (case 2) showing wake formation and flow separation characteristic
    of the inertial regime. (a) Initial acceleration phase. (b) Approach
    to terminal velocity with clear flow separation and wake region
    extending approximately $1.0 d$ downstream, indicating transition
    from viscous-dominated to inertia-dominated settling. (c) Particle
    at $0.5 d$ from the domain bottom, showing an established
    recirculating wake structure and an asymmetric pressure distribution
    that contributes to enhanced form drag.
  ]
)
<fig:fig2>

== Drafting, Kissing and Tumbling
<drafting-kissing-and-tumbling>
The CFD-DEM capacity to resolve hydrodynamic interactions between
multiple particles is verified through simulations of two settling
spheres in quiescent fluid, following the benchmark configuration of
#cite(<glowinski2001fictitious>, form: "prose"). The computational
domain is a vertical rectangular box (10~mm $times$ 10~mm $times$
40~mm). Two identical spheres are released vertically, initially
separated, and their settling velocities are tracked as they approach,
collide, and tumble.~#link(<fig:N2>)[5] compares the settling velocity
evolution of the two spherical particles with the direct numerical
simulations (DNS) from~#cite(<sharma2005fast>, form: "prose"), revealing
three characteristic phases of particle-particle interactions:

+ #strong[Draftingindependent settling regime
  ($t < 0.14 med upright("s")$)]: The particles settle at identical
  velocities as the trailing particle remains beyond the wake of the
  leading particle. Each particle experiences drag from the undisturbed
  far-field flow, producing independent settling dynamics with a
  velocity difference of $< 5 %$.

+ #strong[Kissingwake entrainment regime
  ($0.14 med upright("s") < t < 0.35 med upright("s")$)]: The trailing
  particle enters the leading particle's wake, where streamwise fluid
  velocity is elevated relative to the far-field. The relative velocity
  between the fluid and the trailing particle reduces the drag force,
  leading to an apparent acceleration. The velocity difference causes
  rapid gap closure, bringing the particles to contact at
  $0.35 med upright("s")$.

+ #strong[Tumblingcollision and post-contact dynamics
  ($t > 0.35 med upright("s")$)]: At $t = 0.35 med upright("s")$,
  particles collide, the Hertz-Mindlin contact model calculates normal
  and tangential collision forces, resulting in particle tumbling and
  momentum exchange.

Quantitative comparison from the CFD-DEM shows good agreement with DNS
benchmarks: maximum velocity deviation $< 5 %$ throughout all phases,
accurate prediction of collision time ($0.35 med upright("s")$, within
5% of DNS), and correct post-collision behavior. The verification
confirms that the IB method accurately resolves: (1) long-range
wake-mediated hydrodynamic interactions, (2) transition from independent
to coupled settling, (3) contact collision dynamics, and (4) momentum
transfer during tumbling. Flow field snapshots in~#link(<fig:N3>)[6]
show particle positions and velocity contours at representative times of
($t = 0.0 med upright("s")$, 0.14~s, 0.35~s, 0.7~s), illustrating the
progressive wake entrainment mechanism and collision-induced flow
reorganization.

#figure(image("source/Figure5.svg", width: 55.0%),
  caption: [
    Comparison of settling velocity evolution for the two-particle
    drafting-kissing-tumbling benchmark. CFD-DEM predictions (solid
    lines) show good agreement with DNS results from
    ~#cite(<sharma2005fast>, form: "prose") (dashed lines). The three
    characteristic phases are evident: drafting
    $\( t < 0.14 med upright("s") \)$ with independent settling, kissing
    $\( 0.14 med upright("s") < t < 0.35 med upright("s") \)$ with wake
    entrainment causing trailing particle acceleration and gap closure,
    and tumbling $\( t > 0.35 med upright("s") \)$ following collision
    with momentum exchange. The maximum velocity deviation remains below
    5% throughout the drafting and kissing phases, verifying the IB
    method for multi-particle hydrodynamic interactions.
  ]
)
<fig:N2>

#figure(grid(columns: (4 * (1fr,)), gutter: 2mm, [a) #linebreak() #image("source/Figure6a.png", width: 100%)], [b) #linebreak() #image("source/Figure6b.png", width: 100%)], [c) #linebreak() #image("source/Figure6c.png", width: 100%)], [d) #linebreak() #image("source/Figure6d.png", width: 100%)]),
  caption: [
    Particle positions and fluid velocity magnitude contours at
    representative times during particle sedimentation, illustrating the
    drafting-kissing-tumbling phenomenon. (a) 0~s: initial configuration
    with particles vertically aligned. (b) 0.14~s: onset of kissing
    phase as trailing particle enters leading particle's wake. (c)
    0.35~s: particle collision with maximum velocity difference. (d)
    0.7~s: post-collision tumbling with flow reorganization and momentum
    redistribution.
  ]
)
<fig:N3>

== Non-spherical Particle Settling
<non-spherical-particle-settling>
The framework's suitability in handling complex particle morphologies is
assessed through a sedimentation simulation of an idealized spherical
particle, approximated using a multisphere approach. The test particle
comprises 206 overlapping sub-spheres arranged to approximate a
spherical geometry while maintaining identical density
($rho_(upright("s")) = 1120 med upright("k") upright("g") upright("/") upright("m")^3$)
and volume, as the reference sphere from Case 2
($d = 15 med upright("m") upright("m")$). The configuration enables a
direct comparison of the hydrodynamic behavior of a spherical particle
with that of a non-spherical proxy under identical physical conditions.
The computational setup maintains consistency with the verification case
2; fluid properties
$rho_(upright("f")) = 960 med upright("k") upright("g") upright("/") upright("m")^3$
and $mu_(upright("f")) = 0.058 med upright("Pa") dot.op upright("s")$,
rectangular domain dimensions
$100 times 100 times 160 med upright("m") upright("m")^3$, and particle
is released from the same initial position. The mesh resolution is
enhanced to $d \/ Delta x = 16$ (compared to 12 for the sphere) to
ensure adequate representation of the irregular particle surface. Time
step sizes remain unchanged at
$Delta t_(upright("DEM")) = 1  ×  10^(−5) med upright("s")$ and
$Delta t_(upright("CFD")) = 1  ×  10^(−4) med upright("s")$ to maintain
temporal accuracy and numerical stability.

#link(<fig:fig5>)[7] compares the settling velocity evolution for
spherical and multisphere particles. The multisphere particle exhibits
terminal velocity
$u_t = 0.12 med upright("m") upright("/") upright("s")$, representing
$lt.eq 5 %$ decrease relative to the sphere
($u_t = 0.128 med upright("m") upright("/") upright("s")$). Despite the
irregular surface geometry, particles exhibit quantitatively similar
acceleration dynamics, with a smooth, monotonic approach to terminal
velocity over $t approx 0.8 med upright("s")$. The subtle velocity
decrease for the multisphere particle reflects enhanced drag due to its
increased surface area, which is greater than that of the equivalent
sphere. The flow field around the non-spherical particle exhibits wake
structures similar to those in the spherical case, with symmetric
streamlines characteristic of Stokes flow and no flow separation,
see~#link(<fig:fig4>)[8]. However, subtle asymmetries appear in the
near-wall velocity contours, particularly downstream of surface
protrusions where local velocity gradients intensify. These features
reflect the particle's irregular geometry but do not significantly alter
the global force balance or settling dynamics at this low Reynolds
number.

The close agreement between spherical and multisphere terminal
velocities (within 5.0%) validates two critical aspects of the
computational framework: (1) the multisphere approximation accurately
represents the hydrodynamic resistance of irregular particles while
maintaining computational efficiency, and (2) the IB method accurately
resolves fluid-solid interactions around complex geometries with
accuracy comparable to smooth surfaces. This verification provides
confidence for subsequent investigations of PMN transport, where
particle morphology significantly influences drag coefficients and
suspension dynamics at higher Reynolds numbers
($R e_(upright("p")) = 100$).

#figure(image("source/Figure7.svg", width: 55.0%),
  caption: [
    Settling velocity comparison between spherical and multisphere
    particles verifying the multisphere approximation. The test particle
    comprises 206 overlapping sub-spheres arranged to approximate the
    spherical geometry while maintaining identical density
    ($rho_(upright("s")) = 1120 med upright("k") upright("g") upright("/") upright("m")^3$),
    volume, and mass as the reference sphere from Case 2. The particles
    settle in silicon oil
    ($rho_(upright("f")) = 960 med upright("k") upright("g") upright("/") upright("m")^3$,
    $mu_(upright("f")) = 0.058 med upright("Pa") dot.op upright("s")$).
    Experimental data from #cite(<ten2002particle>, form: "prose") (red
    circles) provides the spherical particle baseline, while numerical
    predictions for the sphere (blue line) and multisphere assembly
    (black line) show close agreement with terminal velocity differences
    within 5%.
  ]
)
<fig:fig5>

#figure(grid(columns: (3 * (1fr,)), gutter: 2mm, [a) #linebreak() #image("source/Figure8a.png", width: 100%)], [b) #linebreak() #image("source/Figure8b.png", width: 100%)], [c) #linebreak() #image("source/Figure8c.png", width: 100%)]),
  caption: [
    Flow field around multisphere particle during sedimentation, showing
    wake asymmetries due to irregular geometry. (a) initial phase. (b)
    Steady settling at terminal velocity exhibiting local velocity
    gradient intensifications near geometric irregularities while
    maintaining globally symmetric streamlines. (c) Near-wall
    interaction showing subtle flow perturbations induced by particle
    morphology.
  ]
)
<fig:fig4>

= Results and Discussion
<sec:results_discussion>
We systematically investigate the hydrodynamic behavior of PMNs in
confined vertical flows, which is directly relevant to hydraulic lifting
systems used in deep-sea mining risers. The analysis is structured in
two parts. First, sedimentation in quiescent fluid is examined to
quantify shape-induced drag enhancement and establish reference settling
velocities for irregular PMNs relative to volume-equivalent spheres.
These results provide calibration data for drag models commonly used in
riser-scale simulations. Second, vertical hydraulic transport is
analyzed using residence-time statistics and drag-force distributions to
identify entrainment behavior and transport stability as flow velocity
increases.

All transport simulations are performed with 40 particles to provide
statistically meaningful ensemble measures while preserving fully
resolved particle-fluid interactions. This particle number captures
particle-to-particle variability without introducing collective effects
such as sustained clustering or plug formation, which are beyond the
scope of the present study. Continuous particle injection is not
considered here; instead, the focus is on isolating the intrinsic
hydrodynamic response of PMNs under controlled confinement. This
approach enables clear physical interpretation and directly supports the
reduced-order modeling strategies in the context of riser-scale
transport.

== Settling Analysis
<settling-analysis>
#link(<fig:fig6>)[9] illustrates the complex and irregular morphology of
PMNs represented using a multisphere approximation based on
high-resolution CT scans. This approach employs 28 and 45 sub-spheres
for PMNs with effective diameters of
$d_(upright("eff")) = 20 med upright("m") upright("m")$ and
$d_(upright("eff")) = 54 med upright("m") upright("m")$, respectively,
where $d_(upright("eff"))$ represents the diameter of the minimum
circumscribed sphere that fully encloses the PMNs. The volume-equivalent
sphere diameter
$d_(upright("v")) = \( 6 V_(upright("p")) \/ pi \)^(1 \/ 3)$, where
$V_(upright("p"))$ is the actual particle volume, yields
$d_(upright("v")) = 16.4 med upright("m") upright("m")$ and
$d_(upright("v")) = 44 med upright("m") upright("m")$ for the small and
large PMNs, respectively. The ratio
$\( d_(upright("v")) \/ d_(upright("eff")) \)^3 approx 0.55$ indicates
that PMNs occupy only 55% of their circumscribed volume, reflecting
their irregular, non-convex morphology with surface protrusions and
concavities characteristic of natural PMNs. The multisphere
representations in #link(<fig:fig6>)[9]b and d show the PMN geometries
superimposed with their volume-equivalent spheres, demonstrating that
the irregular PMN surfaces extend significantly beyond the
volume-equivalent sphere while remaining contained within the
circumscribed sphere envelope. This geometric distinction is crucial for
understanding hydrodynamic behavior, as the effective frontal area and
surface morphology of PMNs differ substantially from volume-equivalent
spheres.

#link(<fig:fig7>)[10] compares the temporal evolution of settling
velocities for PMNs and their volume-equivalent spherical particles in
fluid. The numerical simulations are performed within a cylindrical
computational domain with diameter
$D = 200 med upright("m") upright("m")$ and length
$L = 1200 med upright("m") upright("m")$. The mesh is constructed with
resolution requirements based on the particle characteristic dimension:
for PMNs, we use $d_(upright("eff")) \/ Delta x gt.eq 8$ to resolve
surface irregularities and wake structures; for volume-equivalent
spheres, we use $d_(upright("v")) \/ Delta x gt.eq 8$. This ensures at
least 8 grid cells across the particle dimension in all cases. Both PMNs
and spherical particles have density
$rho_(upright("p")) = 2000 med upright("k") upright("g") upright("/") upright("m")^3$
and identical volumes. They are released from rest at the domain
centerline at height $z = 1000 med upright("m") upright("m")$ in
quiescent fluid with density
$rho_(upright("f")) = 1000 med upright("k") upright("g") upright("/") upright("m")^3$
and dynamic viscosity
$mu_(upright("f")) = 0.05 med upright("Pa") dot.op upright("s")$. The
terminal velocity $u_t$ is determined from the steady-state settling
velocity achieved after initial transients decay.

#block[
#figure(
  align(center)[#table(
    columns: 6,
    align: (left,center,center,center,center,center,),
    table.header([Particle], [$d_(upright("v"))$
      (~mm)], [$d_(upright("eff"))$ (~mm)], [$u_t$
      (~m~s#super[−1])], [$R e_(upright("p"))$], [$C_(upright("D"))$],),
    table.hline(),
    [Small sphere], [16.4], [16.4], [0.45], [148], [1.01],
    [Small PMN], [16.4], [20.0], [0.30], [98], [2.28],
    [Large sphere], [44.0], [44.0], [1.05], [924], [0.44],
    [Large PMN], [44.0], [54.0], [0.75], [660], [0.86],
    table.cell(align: left, colspan: 6)[Note: $R e_(upright("p"))$ based
    on $d_(upright("v"))$\; $C_(upright("D"))$ based on
    $A_(upright("proj")) = pi d_(upright("v"))^2 \/ 4$],
  )]
  , caption: [Comparison of settling characteristics for PMNs and
  volume-equivalent spheres]
  , kind: table
  )

] <tab:settling>
#link(<fig:fig7>)[10] reveals that PMNs settle significantly slower than
volume-equivalent spheres despite identical mass and buoyancy. The small
PMN reaches terminal velocity
$u_t^(upright("PMN")) = 0.30 med upright("m") upright("/") upright("s")$
compared to
$u_t^(upright("sphere")) = 0.45 med upright("m") upright("/") upright("s")$
(33% reduction), while the large PMN achieves
$u_t^(upright("PMN")) = 0.75 med upright("m") upright("/") upright("s")$
versus
$u_t^(upright("sphere")) = 1.05 med upright("m") upright("/") upright("s")$
(29% reduction). These velocity differences are purely shape effects and
correspond to $R e_(upright("p"))$ of 98 and 148 (small PMN and sphere)
and 660 and 924 (large PMN and sphere). The drag coefficient, defined
from terminal force balance as
$C_(upright("D")) = 4 \( rho_(upright("p")) - rho_(upright("f")) \) g d_(upright("v")) \/ \( 3 rho_(upright("f")) u_t^2 \)$
using the projected area
$A_(upright("proj")) = pi d_(upright("v"))^2 \/ 4$, yields
$C_(upright("D"))^(upright("PMN")) = 2.28$ and 0.86 compared to
$C_(upright("D"))^(upright("sphere")) = 1.01$ and 0.44 for small and
large particles, respectivelyrepresenting 2.3 and 2.0 times
enhancements~@vergara2024drag. This drag increase primarily arises from
the 50% larger surface area of PMNs relative to volume-equivalent
spheres ($\( d_(upright("eff")) \/ d_(upright("v")) \)^2 approx 1.5$),
supplemented by irregular particle morphology that creates asymmetric
wake structures, see~#link(<fig:fig9>)[11]. Accounting for surface area
differences through normalized drag coefficients
$C_(upright("D"))^(upright("norm")) = C_(upright("D"))^(upright("PMN")) \( d_(upright("v")) \/ d_(upright("eff")) \)^2$
yields values still 20% above spherical equivalents, confirming
shape-induced effects contribute greatly beyond confinement effects.

#link(<fig:fig8>)[12] shows the temporal evolution of vertical drag
force during sedimentation, revealing distinct transient dynamics. The
particle exhibits an increase during the initial acceleration phase due
to added mass effects. The drag forces reach steady-state values of
$F_(upright("d")) = \( rho_(upright("p")) - rho_(upright("f")) \) V_(upright("p")) g approx 0.0226 med upright("N")$
(small) and $0.44 med upright("N")$ (large), confirming force balance to
within 5%. Critically, both PMNs and spheres experience identical
terminal drag forces since they have equal volumes and densitiesthe
29-33% lower settling velocities of PMNs arise because their enhanced
drag coefficients allow them to generate the required hydrodynamic
resistance at reduced slip velocities. The sharp decrease in
$F_(upright("d"))$ after $t approx 2.8$ s for the small PMN indicates
bottom contact, where wall reaction forces partially support the
particle weight.

#figure(image("source/Figure9.png", width: 60.0%),
  caption: [
    PMN morphology and multisphere approximations. (a) & (c)
    CT-reconstructed surfaces of PMNs showing irregular geometry
    characteristic of natural PMNs. (b) & (d) Multisphere
    representations (blue) comprising 28 and 45 sub-spheres for
    effective diameters
    $d_(upright("eff")) = 20 med upright("m") upright("m")$ and 54~mm,
    respectively, superimposed on volume-equivalent spheres (grey,
    $d_(upright("v")) = 16.4 med upright("m") upright("m")$ and
    $44 med upright("m") upright("m")$). The volume ratio
    $\( d_(upright("v")) \/ d_(upright("eff")) \)^3 approx 0.55$
    indicates that PMNs occupy only 55% of their circumscribed sphere
    volume due to non-convex morphology.
  ]
)
<fig:fig6>

#figure(image("source/Figure10.svg", width: 55.0%),
  caption: [
    Temporal evolution of settling velocity for PMNs and
    volume-equivalent spherical particles. PMNs (squares and circles)
    reach terminal velocities 29% lower than volume-equivalent spheres
    (triangles and pentagons) despite identical mass and volume,
    reflecting enhanced drag coefficients due to increased surface area.
  ]
)
<fig:fig7>

#figure(grid(columns: (2 * (1fr,)), gutter: 2mm, [a) #linebreak() #image("source/Figure11a.png", width: 100%)], [b) #linebreak() #image("source/Figure11b.png", width: 100%)]),
  caption: [
    Instantaneous flow fields and particle trajectories during
    sedimentation of PMNs in quiescent fluid. (a) Small PMN at terminal
    velocity. (b) Large PMN. The fluid velocity magnitude contours show
    asymmetric wake structures resulting from irregular particle
    geometry (left). Three-dimensional particle trajectories colored by
    solid velocity magnitude, demonstrating vertical settling with
    coupled rotational motion (right).
  ]
)
<fig:fig9>

#figure(image("source/Figure12.svg", width: 55.0%),
  caption: [
    Temporal evolution of vertical drag force during sedimentation for
    PMNs and volume-equivalent spheres. Small particles reach
    steady-state drag force
    $F_(upright("d")) approx 0.023 med upright("N")$ (top). Large
    particles achieve $F_(upright("d")) approx 0.43 med upright("N")$
    (bottom).
  ]
)
<fig:fig8>

== Vertical transport
<vertical-transport>
To investigate PMN entrainment in vertical risers, we simulate the
transport of mono-sized spherical particles
($d_(upright("v")) = 16.4 med upright("m") upright("m")$ and 44~mm)
through a vertical cylindrical pipe with diameter
$D = 200 med upright("m") upright("m")$ and length
$L = 1200 med upright("m") upright("m")$ at three fluid velocities:
$u_(upright("f")) = 1.0 u_(upright("t"))$, $2.0 u_(upright("t"))$, and
$3.0 u_(upright("t"))$, where $u_(upright("t"))$ is the terminal
settling velocity,~#link(<tab:tab4>)[3] lists the $R e_(upright("p"))$
values. Particles are initially distributed randomly in the lower
section of the pipe ($0 < y < 200 med upright("m") upright("m")$) and
allowed to reach quasi-steady transport conditions. The flow Reynolds
number ranges from
$R e_(upright("pipe")) = rho_(upright("f")) u_(upright("f")) D \/ mu_(upright("f")) approx 1200$,
placing the flow in the transitional to weakly turbulent regime. We
analyze transport characteristics through residence time distributions
$P \( t_(upright("r")) \)$ and normalized drag force distributions
$P \( hat(f) \)$, where $t_(upright("r"))$ is the time required for a
particle to traverse one meter vertically and
$hat(f) = F_(upright("d")) \/ \( rho_p - rho_f \) V_(upright("p")) g$ is
the ratio of instantaneous vertical drag to particle weight.

#block[
#figure(
  align(center)[#table(
    columns: 6,
    align: (left,center,center,center,center,center,),
    table.header([Particle Type], [$d_(upright("v"))$
      (~mm)], [$u_(upright("t"))$
      (~m~s#super[−1])], table.cell(align: center, colspan: 3)[$R e_(upright("p")) = rho_(upright("f")) u_(upright("f")) d_(upright("v")) \/ mu_(upright("f"))$],),
    table.hline(),
    [4-6], [], [], [$u_(upright("f")) = 1.0 u_(upright("t"))$], [$u_(upright("f")) = 2.0 u_(upright("t"))$], [$u_(upright("f")) = 3.0 u_(upright("t"))$],
    [Small sphere], [16.4], [0.42], [138], [276], [414],
    [Small PMN], [16.4], [0.30], [98], [196], [294],
    [Large sphere], [44.0], [1.1], [968], [1936], [2904],
    [Large PMN], [44.0], [0.80], [704], [1408], [2112],
    table.cell(align: left, colspan: 6)[Note: $R e_(upright("p"))$
    calculated using volume-equivalent diameter $d_(upright("v"))$ and
    fluid velocity $u_(upright("f"))$.],
  )]
  , caption: [Particles' Reynolds numbers $\( R e_(upright("p")) \)$ for
  spherical particles and PMNs during vertical transport at varying
  fluid velocities. Terminal velocities $u_(upright("t"))$ from
  sedimentation analysis with
  $rho_(upright("f")) = 1000 med upright("k") upright("g") upright("/") upright("m")^3$
  and $mu_(upright("f")) = 0.05 med upright("Pa") dot.op upright("s")$.]
  , kind: table
  )

] <tab:tab4>
=== Residence Time Analysis
<residence-time-analysis>
#link(<fig:fig10>)[13] presents the probability distributions of
residence time $\( t_r \)$ for spherical and non-spherical particles at
varying flow velocities. The distributions characterize the transition
from intermittent, settling-dominated transport at low velocities to
steady, convection-dominated entrainment at high velocities.
In~#link(<fig:fig10>)[13]a and c, the small spherical particles and
PMNs, respectively, exhibit broad distributions with extended tails at
$u_f = 1.0 u_t$ and $u_f = 12.0 u_t$, indicating high variability in
individual particle transport velocities. For spheres, the standard
deviation decreases from $sigma_(t r) = 1.55 med upright("s")$ at
$1.0 u_t$ to $sigma = 0.06 med upright("s")$ at $3.0 u_t$. At $1.0 u_t$,
the small PMNs exhibit marginal suspension statesparticles oscillate
near the inlet without achieving consistent upward motion. This is
illustrated in particle trajectory visualizations
(see~#link(<fig:fig11>)[14]e and ~#link(<fig:fig13>)[15]e), where small
PMNs remain confined to the lower pipe section at low velocity,
exhibiting continuous rotational motion without net vertical
displacement. Large spherical particles,~#link(<fig:fig10>)[13]b, show
systematic variance reduction from $sigma = 0.19 med upright("s")$ to
$sigma = 0.02 med upright("s")$ as the fluid velocity increases. Large
PMNs,~#link(<fig:fig10>)[13]d, exhibit broader distributions at all
velocities compared to spherical particles, with more pronounced tails
at $2.0 u_t$ and $3.0 u_t$.

The mean residence times $\( mu_(t r) \)$ for all particles follow the
expected inverse relationship $mu_(t_r) prop 1 \/ u_f$, with measured
values of $mu_(t_r) = 6.87 med upright("s")$, $1.85 med upright("s")$,
and $1.04 med upright("s")$ for small spherical particles at $1.0 u_t$,
$2.0 u_t$, and $3.0 u_t$, respectively.~#link(<tab:tab5>)[4] delineates
the $mu_(t r)$ and $sigma_(t r)$ for various particle groups. Particle
configuration snapshots in~#link(<fig:fig11>)[14] reveal the spatial
distributions underlying these statistical behaviors. At $1.0 u_t$,
small spherical particles,~#link(<fig:fig11>)[14]a exhibit pronounced
vertical dispersion with particles spanning the half pipe length,
consistent with the broad residence time distribution and intermittent
settling events. Small PMNs (see~#link(<fig:fig11>)[14]e) show extreme
clustering near the inlet with minimal upward progression, confirming
marginal suspension. Large particles,~#link(<fig:fig11>)[14]c and g,
show less dispersion due to higher inertia, which reduces susceptibility
to local flow fluctuations.

At $3.0 u_t$, all particle types achieve spatially homogeneous
distributions with minimal vertical dispersion, confirming efficient
entrainment and stable transport (see~#link(<fig:fig11>)[14]b, d, f, and
h). The absence of extended residence time tails at this velocity
indicates that all particles maintain consistent upward motion without
settling reversals. Flow field visualizations show that small PMNs
develop subtle asymmetric wakes and helical trajectories with variable
angular velocity even at high velocities,~#link(<fig:fig11>)[14]f, while
large PMNs exhibit no complex wake structures with angular velocities
reaching 80~rad~s#super[−1],~#link(<fig:fig11>)[14]h. Individual
particle trajectories in~#link(<fig:fig13>)[15] provide a direct
visualization of these transport regimes. Small spherical particles
(#link(<fig:fig13>)[15]a and b) transition from oscillatory motion with
lateral wandering at $1.0 u_t$ to nearly rectilinear trajectories at
$3.0 u_t$. However, the Small PMNs (#link(<fig:fig13>)[15]e) remain in
marginal suspension at low velocity. Large PMNs,~#link(<fig:fig13>)[15]g
and h, exhibit enhanced rotational motion, with PMNs achieving
significantly higher angular velocities, reflecting shape-induced
torques and coupled translational-rotational dynamics.

#block[
#figure(
  align(center)[#table(
    columns: 7,
    align: (left,center,center,center,center,center,center,),
    table.header([Particle], table.cell(align: center, colspan: 3)[$mu_(t r)$
      (s)], table.cell(align: center, colspan: 3)[$sigma_(t r)$ (s)],),
    table.hline(),
    [2-7], [$1.0 u_t$], [$2.0 u_t$], [$3.0 u_t$], [$1.0 u_t$], [$2.0 u_t$], [$3.0 u_t$],
    [Small sphere], [6.87], [1.85], [1.04], [1.55], [0.18], [0.06],
    [Small PMN], [], [3.51], [1.62], [], [0.75], [0.11],
    [Large sphere], [1.48], [0.52], [0.33], [0.19], [0.04], [0.02],
    [Large PMN], [2.11], [0.89], [0.51], [0.39], [0.10], [0.06],
    table.cell(align: left, colspan: 7)[Note: Small PMNs remain in a
    suspended state at $1.0 u_t$],
  )]
  , caption: [Mean residence time ($mu_(t r)$) and standard deviation
  ($sigma_(t r)$) for spherical particles and PMNs during vertical
  transport at varying fluid velocities.]
  , kind: table
  )

] <tab:tab5>
#figure(grid(columns: (2 * (1fr,)), gutter: 2mm, [a) #linebreak() #image("source/Figure13a.svg", width: 100%)], [b) #linebreak() #image("source/Figure13b.svg", width: 100%)], [c) #linebreak() #image("source/Figure13c.svg", width: 100%)], [d) #linebreak() #image("source/Figure13d.svg", width: 100%)]),
  caption: [
    Probability distributions of residence time $t_r$ at fluid
    velocities $u_f = 1.0 u_t$, $2.0 u_t$, and $3.0 u_t$. (a) Small
    spheres. (b) Large spheres. (c) Small PMNs. (d) Large PMNs. The
    distributions narrow systematically with increasing velocity,
    transitioning from broad, variance-dominated profiles at low flow
    rates (insets) to sharp, convection-dominated distributions at high
    rates. Note: Small PMNs remain suspended at $u_f = 1.0 u_t$ without
    net upward transport.
  ]
)
<fig:fig10>

#figure(grid(columns: (4 * (1fr,)), gutter: 2mm, [a) #linebreak() #image("source/Figure14a.png", width: 100%)], [b) #linebreak() #image("source/Figure14b.png", width: 100%)], [c) #linebreak() #image("source/Figure14c.png", width: 100%)], [d) #linebreak() #image("source/Figure14d.png", width: 100%)], [e) #linebreak() #image("source/Figure14e.png", width: 100%)], [f) #linebreak() #image("source/Figure14f.png", width: 100%)], [g) #linebreak() #image("source/Figure14g.png", width: 100%)], [h) #linebreak() #image("source/Figure14h.png", width: 100%)]),
  caption: [
    Particle configurations and flow fields during vertical transport.
    Small spheres $\( d_v = 16.4 med upright("m") upright("m") \)$: (a)
    $u_f = 1.0 u_t$ shows vertical dispersion and lateral spread; (b)
    $u_f = 3.0 u_t$ shows homogeneous distribution with rectilinear
    motion. Large spheres
    $\( d_v = 44 med upright("m") upright("m") \)$: (c) $u_f = 1.0 u_t$
    shows moderate dispersion; (d) $u_f = 3.0 u_t$ shows homogeneous
    distribution. Small PMNs: (e) $u_f = 1.0 u_t$ shows asymmetric wakes
    and helical trajectories; (f) $u_f = 3.0 u_t$ shows reduced
    dispersion with continued rotational motion. Large PMNs: (g)
    $u_f = 1.0 u_t$ shows complex wake structures; (h) $u_f = 3.0 u_t$
    shows linear trajectories with angular velocity up to
    80~rad~s#super[−1] and intermittent wall-proximity events. Fluid
    velocity is colored by magnitude, and streamlines are shown as tube
    elements (left). Particle trajectories colored by velocity (top
    right rows) or angular velocity (bottom right rows).
  ]
)
<fig:fig11>

#figure(grid(columns: (4 * (1fr,)), gutter: 2mm, [a) #linebreak() #image("source/Figure15a.png", width: 100%)], [b) #linebreak() #image("source/Figure15b.png", width: 100%)], [c) #linebreak() #image("source/Figure15c.png", width: 100%)], [d) #linebreak() #image("source/Figure15d.png", width: 100%)], [e) #linebreak() #image("source/Figure15e.png", width: 100%)], [f) #linebreak() #image("source/Figure15f.png", width: 100%)], [g) #linebreak() #image("source/Figure15g.png", width: 100%)], [h) #linebreak() #image("source/Figure15h.png", width: 100%)]),
  caption: [
    Particle trajectory for a random particle during vertical hydraulic
    transport, colored by instantaneous translational $\( u_s \)$ or
    angular velocity $\( omega \)$. Small particles with (a) & (b) as
    spheres and (e) & (f) as PMNs at $u_f = 1.0 u_t$ and $3.0 u_t$,
    respectively, colored by translational $\( u_s \)$ or angular
    $\( omega \)$ velocity. The small PMNs remain in a state of marginal
    suspension near the pipe inlet, exhibiting oscillatory motion
    without net upward transportthe fluid velocity is insufficient to
    overcome gravitational settling, resulting in a dynamic equilibrium
    in which the particles hover with continuous rotational adjustments.
    Large particles with (c) & (d) as spheres and (g) & (h) as PMNs at
    $u_f = 1.0 u_t$ and $3.0 u_t$, respectively. At low flow velocity
    $\( u_f = 1.0 u_t \)$, trajectories exhibit significant lateral
    dispersion and velocity fluctuations reflecting intermittent
    transport. At high flow velocity $\( u_f = 3.0 u_t \)$, trajectories
    become more vertically aligned with reduced dispersion, indicating
    stable convection-dominated transport. The PMNs exhibit enhanced
    rotational motion due to shape-induced torque than volume-equivalent
    spheres.
  ]
)
<fig:fig13>

=== Drag Force Analysis
<drag-force-analysis>
#link(<fig:fig12>)[16]a and b illustrate the probability distributions
of the normalized axial drag force,
$hat(f) = F_d \/ \( rho_p - rho_f \) V_p g$, providing insight into the
force balance mechanisms governing particle suspension. Across all fluid
velocities examined, the mean normalized drag force remains
approximately near one (i.e.,$chevron.l hat(f) chevron.r approx 1$),
confirming that drag effectively balances particle weight under
steady-state conditions. Particles continuously adjust their slip
velocity to maintain this equilibrium, regardless of the imposed fluid
velocity. This behavior aligns with classical multiphase flow theory,
where terminal velocity defines the threshold for suspension, and higher
entrainment velocities enhance stability without significantly altering
the mean force balance. While gravitational and hydrodynamic forces
remain dynamically balanced on average, the distinction between
different operating conditions arises from the shape of the
distributions, which encapsulate the fluctuating components of the drag
force and their dependence on turbulence, inertia, and confinement.

The evolution of drag-force statistics can be directly interpreted in
light of the resolved flow fields shown in~#link(<fig:fig11>)[14]. For
the smaller spherical particles, at $u_f = u_t$, the flow exhibits clear
local velocity deficits and moderate streamline curvature around
individual particles, indicating the presence of short, attached wakes,
see~#link(<fig:fig11>)[14]a. In this regime, the particle inertia is low
$\( S t approx 30.6 \)$, such that particle motion remains strongly
coupled to the carrier flow and rapidly adapts to local velocity
fluctuations~@balachandar2010turbulent. The Stokes number $S t$ is
defined as $ S t = frac(rho_p d_v u_t, 9 mu_f) . $ As a result, drag
fluctuations remain weak, and the corresponding force distribution is
narrow,~#link(<fig:fig12>)[16]a. As the flow velocity increases to
$u_f = 3 u_t$, the streamline patterns appear straighter and individual
wake structures become less visually distinct,~#link(<fig:fig11>)[14]b.
This does not imply the absence of wake dynamics. Instead, the increase
in $R e_(upright("p"))$ leads to wake structures that are rapidly
convected downstream, while axial shear and inter-particle interactions
inhibit the formation of spatially coherent recirculation
zones~@crowe1998multiphase. In this regime, wake-induced disturbances
persist but are temporally short-lived and not spatially localized,
resulting in a modest broadening of the drag-force distribution without
significant intermittency.

A qualitatively different behavior is observed for the larger spherical
particles $\( d_v = 44 med upright("m") upright("m") \)$. At
$u_f = u_t$, the flow field reveals strong streamline distortion and a
pronounced velocity deficit downstream of the particle cluster. The wake
remains coherent and visibly asymmetric due to lateral confinement by
the pipe wall $\( d_v \/ D = 0.220 \)$, but adjusts quasi-steadily to
particle motion. Such confinement-induced wake asymmetry and deflection
are well documented for bluff bodies in pipes and
channels~@zdravkovich1997flow@sahin2004numerical. Despite the higher
particle inertia $\( S t approx 215 \)$, the quasi-steady wake
adjustment yields relatively narrow distributions of drag force,
see~#link(<fig:fig12>)[16]b. At $u_f = 3 u_t$, the instantaneous flow
visualizations show predominantly axial streamlines with no clearly
identifiable recirculation~#link(<fig:fig11>)[14]d. This apparent
suppression of wake structures does not indicate steady drag conditions.
At high inertia $\( S t approx 645 \)$ and elevated
$R e_(upright("p"))$, wake dynamics transition to a regime dominated by
rapid downstream convection, confinement-induced suppression of lateral
wake expansion, and strong interactions with neighboring particles and
the confining wall~@zdravkovich1997flow. Under these conditions, the
particle response time becomes comparable to the characteristic time
scales of wake evolution, resulting in history-dependent drag forces
that are not uniquely determined by the instantaneous slip velocity
@balachandar2010turbulent@leskovec2024turbulent. Consequently, drag
fluctuations become intermittent and heavy-tailed, even though wake
structures are not readily apparent in instantaneous streamline plots.

The drag force distribution for small PMNs in #link(<fig:fig12>)[16]c
exhibits behavior quantitatively similar to that of spherical particles,
with sharp peaks centered around $hat(f) approx 1.1 - 1.3$ across all
flow velocities. This indicates that, for small particles, geometric
irregularity plays a secondary role relative to inertia and confinement.
Owing to their low effective inertia and rapid rotational dynamics,
small PMNs remain strongly coupled to the carrier flow, such that
orientation-dependent variations in projected area are rapidly averaged
out and drag fluctuations are primarily governed by local flow
variability. In contrast, the drag-force distributions for large PMNs,
#link(<fig:fig12>)[16]d, exhibit distinct features associated with
orientation-dependent forcing. At $1.0 u_t$, the distribution is
relatively narrow but shifted toward higher values, with a peak at
$hat(f) approx 1.5$ and a tail extending to $hat(f) approx 2.0$,
reflecting enhanced form drag associated with non-spherical geometry. As
the flow velocity increases to $2.0 u_t$ and $3.0 u_t$, the
distributions broaden and shift toward $hat(f) approx 1.7$, accompanied
by extended high-drag tails. At $3.0 u_t$, the distribution becomes more
sharply peaked than at intermediate velocities, yet remains
substantially broader than that of spherical particles and retains a
long tail extending to $hat(f) approx 4.0$.

Across all velocities, both small spheres and small PMNs maintain
narrow, peaked distributions, whereas pronounced differences between
spherical and non-spherical particles emerge for the larger size class.
Large spherical particles exhibit a monotonic broadening of the drag
distribution with increasing velocity, consistent with wake unsteadiness
modified by confinement. For large PMNs, drag variability is further
amplified by orientation-dependent forcing, which introduces an
additional source of intermittency beyond wake dynamics alone. At
$1.0 u_t$, large PMNs experience irregular translational and rotational
motion, including intermittent settling, wall-proximity events, and
re-entrainment, leading to strong drag fluctuations. Flow-field
visualizations in~#link(<fig:fig11>)[14]g reveal complex
three-dimensional wake structures with multiple separation points
arising from the non-convex particle morphology. Particle trajectory
snapshots (see~#link(<fig:fig13>)[15]) confirm irregular lateral motion
and variable angular velocity with intermittent wall-proximity events at
low velocities. At higher velocities, increased angular velocity
promotes more rapid reorientation and sustained transport upward through
a more uniform mean flow. Although wake structures become less visually
distinct due to rapid convection and confinement, orientation-induced
variations in projected area persist, giving rise to intermittent
high-drag events and the extended tails observed
in~#link(<fig:fig12>)[16]d.

#figure(grid(columns: (2 * (1fr,)), gutter: 2mm, [a) #linebreak() #image("source/Figure16a.svg", width: 100%)], [b) #linebreak() #image("source/Figure16b.svg", width: 100%)], [c) #linebreak() #image("source/Figure16c.svg", width: 100%)], [d) #linebreak() #image("source/Figure16d.svg", width: 100%)]),
  caption: [
    Probability distributions of normalized drag force,
    $hat(f) = F_d \/ m_p g$, for spherical and non-spherical particles.
    (a) Small spherical particles. (b) Large spherical particles. (c)
    Small non-spherical PMNs (d) Large non-spherical PMNs.
  ]
)
<fig:fig12>

= Summary and Conclusions
<Sec:Summary>
This study employed a fully resolved CFD-DEM approach to investigate the
hydrodynamic behavior of irregular polymetallic nodules (PMNs) during
sedimentation and vertical hydraulic transport in confined risers, which
are relevant to deep-sea mining operations. By explicitly resolving
particle-fluid interactions without empirical drag closures. The
simulations provide mechanistic insight into how particle shape,
confinement, and flow velocity collectively govern settling dynamics,
residence time statistics, and fluctuations in drag force across low to
moderate $R e_(upright("p"))$. The key findings are outlined below.

+ Shape-induced drag enhancement governs PMN sedimentation, leading to
  reduced terminal velocities without altering the terminal force
  balance. Sedimentation simulations demonstrate that PMNs settle 29-33%
  slower than volume-equivalent spheres, irrespective of having the same
  mass and buoyancy. This reduction arises from an increase in the drag
  coefficient and morphology-induced wake asymmetry. Remarkably, the
  PMNs and spheres experience identical terminal drag forces equal to
  their submerged weight. The reduced settling velocity of PMNs reflects
  that the irregular particles generate the required hydrodynamic
  resistance at lower slip velocities, rather than an alteration in the
  equilibrium force balance.

+ The residence time distributions $\( t_r \)$ highlight a
  velocity-driven transition from intermittent to convection-dominated
  transport, particularly showing that non-spherical particles
  experience delayed entrainment. At low flow velocities, the spherical
  particles and PMNs display broad $t_r$ indicative of intermittent
  motion and partial settling, with small PMNs remaining marginally
  suspended and exhibiting oscillatory trajectories. As flow velocity
  increases, these distributions narrow and peak, signifying a shift to
  stable convection-dominated transport. The PMNs demonstrate larger
  mean residence times and variances compared to spherical particles
  under similar flow conditions, which is attributable to the greater
  drag $\( hat(f) > 1 \)$ and rotational-translational coupling that
  contribute to the delayed entrainment.

+ Drag force statistics are significantly influenced by particle
  morphology and confinement, with non-spherical particles amplifying
  unsteady force fluctuations. The mean normalized drag force fluctuates
  around $hat(f) = 1 - 1.5$ across configurations, indicating a steady
  transport equilibrium between hydrodynamic drag and submerged weight.
  Distinct transport regimes are characterized by variations in drag
  fluctuations. Small particles exhibit narrow distributions in drag
  fluctuations, which aligns with their rapid response to flow changes
  and low Stokes number dynamics. In contrast, large particles at high
  confinement ratios exhibit non-monotonic drag statistics,
  characterized by increased force fluctuations at higher velocities.
  For PMNs, the interplay of orientation-dependent drag and
  shape-induced rotation further expands drag distributions.

While PMNs exhibit 40-90% longer residence times and 2 times higher drag
coefficients compared to volume-equivalent spheres, the underlying
transport physics remains qualitatively similar. Both particle types
undergo the same progression from a settling transitional
convection-dominated regime as flow velocity increases. This suggests
that first-order transport behavior can be captured using
volume-equivalent spherical particles with appropriately calibrated drag
laws, though quantitative predictions require shape-specific
corrections. Future work will extend this framework to polydisperse
systems with continuous particle injection and quantify pressure drop
and transport efficiency under realistic operating conditions.

#heading(level: 1, numbering: none)[Acknowledgements]
<acknowledgements>
RKA acknowledges the financial support from National Institute of Ocean
Technology, Ministry of Earth Sciences, Government of India.

#heading(level: 1, numbering: none)[Conflict of Interest]
<conflict-of-interest>
The authors declare that they have no conflict of interest.

#bibliography("references.bib", style: "ieee")
