#import "coupling-cycle.typ": coupling-cycle

#set document(title: "Lagrangian Heterogeneous Multiscale Method (LHMM) for Simulating Polymer Solutions/Melts Behavior under Complex Flows using DPD-SPH")
#set page(paper: "a4", margin: (x: 27mm, y: 25mm), numbering: "1")
#set text(font: "Libertinus Serif", size: 10.5pt)
#set par(justify: true, leading: .65em)
#set heading(numbering: "1.1.")
#set math.equation(numbering: "(1)")
#set figure(placement: auto)
#set figure.caption(separator: [. ])
#show figure.caption: set text(size: 9pt)
#set table(inset: 3pt)

#align(center)[
  #text(size: 16pt, weight: "bold")[Lagrangian Heterogeneous Multiscale Method (LHMM) for Simulating Polymer Solutions/Melts Behavior under Complex Flows using DPD-SPH]
  #v(5pt)
  Edgar A. Patiño-Nariño#super[1], Nicolas Moreno#super[1], and Marco Ellero#super[1,2,3]
  #v(4pt)
  #text(size: 9pt, style: "italic")[
    #super[1] Basque Center for Applied Mathematics, Bilbao, Spain \
    #super[2] IKERBASQUE, Basque Foundation for Science, Bilbao, Spain \
    #super[3] Complex Fluids Research Group, Swansea University, Swansea, UK
  ]
]

*Abstract.*

We present a Lagrangian Heterogeneous Multiscale Method (LHMM) for
simulating the non-Newtonian rheology of polymer melts in complex
two-dimensional flows. The method couples Dissipative Particle Dynamics
(DPD) at the microscale with a GENERIC-compliant Smoothed Particle
Hydrodynamics (SPH) at the macroscale, in a concurrent framework,
overcoming the limitations of traditional Eulerian-based methods in
capturing long-memory and history-dependent effects. At the microscale,
DPD serves as a virtual rheometer, employing FENE (Finitely Extensible
Nonlinear Elastic) bead-spring polymer chains. This approach provides
key rheological properties, including shear-thinning and zero-shear-rate
viscosities, relaxation times, and viscoelastic dynamics, which are
quantified via Carreau-Yasuda fitting and spectral analysis. The LHMM
couples SPH-derived strain rates with microscopic stress responses using
the Irving-Kirkwood formalism. This approach enables a concurrent
interaction between macroscopic strain rates and microscopic stress
tensors, ensuring a consistent viscoelastic response across scales. The
method is validated against benchmark flows, including Reverse
Poiseuille Flow and flow through a Periodic Array of Cylinders, across
Weissenberg numbers $0.5 < upright("Wi") < 30$ and low Reynolds numbers
($upright("Re") < 1$). A final demonstration of flow in a 2D porous
medium highlights LHMM's capability to handle highly heterogeneous
geometries. The LHMM is implemented in LAMMPS, making it suitable for
integrating multiple models to describe microscales. In contrast,
large-scale simulations efficiently utilize GPU and CPU resources,
managing multiple coupling and time-scaling levels to maintain numerical
stability and accuracy. The framework offers a predictive,
constitutive-free tool that links microscopic polymer dynamics to
macroscopic flow behavior, making it suitable for multiscale
applications.

*Keywords.* Polymer melts, heterogeneous multiscale methods, DPD, SPH, viscoelasticity.

= Introduction <sec:intro>
Polymer melts exhibit complex rheological behaviors, including
pronounced viscoelasticity and memory effects, particularly under
nontrivial flow conditions. Accurately simulating these dynamics remains
challenging due to the intrinsically nonlinear coupling between
microscopic and macroscopic scales @Ge2019@Vassaux2020@Hughes1998. Over
the past few decades, numerous multiscale simulation strategies have
emerged to bridge the gap between MD and continuum mechanics
@Gooneie2017@Schmid2022@Smith2023. These strategies include adaptive
resolution schemes that facilitate a seamless transition between
atomistic and coarse-grained models
@Zavadlav2017@Zavadlav2016@Delgado-Buscalioni2008, often utilizing the
MARTINI force field for efficient sampling
@Marrink2007@Souza2021@Zavadlav2017@Zavadlav2016. This approach has
effectively linked molecular structure to macroscopic rheological
behavior @Boyko2025@Xie2023@Svaneborg2016@Borg2018@Borg2014. However,
despite these advancements, a computational framework that accurately
and efficiently captures the non-Newtonian and history-dependent
behavior of polymer melts under arbitrary flow conditions remains
cumbersome.

In the context of multiscale modelling, Laso and Öttinger @Laso1993
introduced the so-called CONNFFESSIT method, combining Eulerian
finite-element solvers (fixed-grid formulation) with stochastic polymer
dynamics @Feigl1995, establishing a foundation for Eulerian--Lagrangian
multiscale formulations @Sherck2021@Khajeh2024@De2013. These efforts
have shown relevant applicability in the modelling of polymer flow
characterized by simple deformation histories
@Boyko2024@Seryo2020@Laso1999, in both dilute and semi-dilute systems
@Sato2019@Schieber2020@Murashima2013. This approach establishes a direct
connection between the macroscopic and microscopic models via the stress
and strain rate tensor fields @Sato2017@Sato2025a@Zhao2021. Subsequent
advancements have included the integration of Brownian Configuration
Field (BCF) methods @Ottinger1997a@Hulsen1997@Borgbjerg1994@Khajeh2024a.
In BCF, for instance, macroscopic domains are represented using Eulerian
descriptions, while the microscopic state of the system is typically
characterized at each grid point. The microscale features are included
through a configuration tensor or ensemble of dumbbell/bead--spring
replicas denoted by $upright(bold(Q))$, which evolves according to an
Eulerian Langevin-type equation:
$d upright(bold(Q)) = cal(A)_(upright("flow")) \( upright(bold(Q)) \) thin d t #h(0em) + #h(0em) cal(R)_(upright("relax")) \( upright(bold(Q)) \) thin d t #h(0em) + #h(0em) cal(N)_(upright("thermal")) thin \,$
where the first term in the equation accounts for both advection and
deformation resulting from the macroscopic flow, the second term
represents the elastic relaxation toward equilibrium, and the third term
captures stochastic fluctuations. Thus, $upright(bold(Q)) \( t \)$
serves as a configuration descriptor, effectively capturing local
stretching and orientation~@De2006@De2013@Liu2019. While this scheme
yields manageable models~@Yasuda2010@Yasuda2011, the description of the
microscopic state is limited to Langevin-type models (e.g., BD or
slip-link) that simplify polymer dynamics~@Xu2023a@Vassaux2020.

Weinan and Engquist introduced the HMM~@Weinan2007@E2009 as a
comprehensive framework for coupling macro- and microscale models. This
coupling allows to deal with more complex macroscopic domains and
provide detailed microscopic representations of systems, such as
Synchronized Molecular Dynamics (SMD)
@Yasuda2009@Yasuda2010@Yasuda2011@Wu2021 and non-equilibrium molecular
dynamics (NEMD) @Tedeschi2021@Mortazavi2015. HMM strategies
@E2009@Lockerby2012@Ren2005 have evolved into robust schemes (see also
@Weinan2007) that integrate numerical algorithms that independently
resolve macro- and microscales. Where microscopically derived quantities
(using a variety of available algorithms, MD, NEMD, DPD, DEM, to name a
few) inform the macroscopic momentum equations
@Ren2005@Stalter2018@Vassaux2020. Following the CONNFFESSIT spirit,
Eulerian HMM-based schemes approximate the microscopic stress at a grid
point $i$ as:
$bold(sigma)_i approx ⟨upright(bold(F)) \( upright(bold(Q))_j \, dot(gamma)_j \) dot.op upright(bold(r))_(i j)⟩_(Omega_i)$,
where $upright(bold(F))$ denotes the microscopic force derived from
configuration descriptors $upright(bold(Q))_j$, $dot(gamma)_j$
represents the local shear rate, and the operator
$chevron.l dot.op chevron.r_(Omega_i)$ indicates statistical sampling
over the microscopic configurations within the sampling volume
$Omega_i$. These methods offer a flexible route to estimate microscopic
stresses. However, its accuracy is critically dependent on rapid
relaxation and timescale separation ($lambda lt.double Delta t$)~
@Vassaux2019@Morii2021, conditions that are often not met in polymeric
flows.

Alternatively, there are more general HMM-based microscopic coupling
strategies available @Ren2005@E2009@Vassaux2019. These include embedded
microscopic simulations at certain macroscopic grid points, where
stresses are obtained using IK averaging
@Irving1950@Lockerby2013@Stalter2018. Variants such as the Seamless HMM
@E2009@Lockerby2013 effectively address the issue of repeated
reinitialization in microscopic simulations. Nevertheless, they still
rely on the assumption of a large timescale separation between macro and
micro descriptions. While there have been HMM schemes aiming to bridge
different temporal scales for polymer
mechanics~@Vassaux2019@Vassaux2020@Leiter2023, these Eulerian-based
descriptions of the macroscopic scales often struggle to capture the
history-dependent nature of polymer melts, limiting their applicability
in realistic flow scenarios~@E2009@Vassaux2019@Vassaux2020@Moreno2023.

In polymer melts, the viscoelastic stress depends on the complete strain
history of fluid elements @Bird1987a@Bird1995@Ottinger1996. This memory
dependence can be represented as
$M \( upright(bold(x)) \, t \) = M #h(-1em) [dot(gamma) #h(-1em) (X \( t' \) \, t') \; thin t' lt.eq t]$,
where $X \( t' \)$ denotes the Lagrangian trajectory. While Eulerian
approaches require challenging backward-tracking or interpolation
@Vassaux2019@Vassaux2020, recent developments in fully Lagrangian (HMM)
frameworks inherently integrates this memory, modelling both macro and
microscales using Lagrangian descriptions
(LL)@Weinan2007@Vassaux2020@Schmid2023@Moreno2023. LL alternatives have
spurred the development of multiscale schemes that adopt the SPH method
to discretize the macroscales, which inherently track material
trajectories and effectively maintain viscoelastic stress buildup
@Vazquez-Quesada2009@Vazquez-Quesada2012@Ye2019@LeTouze2025a. Whereas at
the micro scales, they can adopt a variety of models ---ranging from
Brownian dynamics @Xu2016b@Xu2023a@King2021 and slip-link models
@Feng2016a@Sato2017@Sato2019 to coarse-grained particle methods that
merge MD and DPD @Tang2015@Oda2025@NietoSimavilla2022, as well as
data-driven approaches @Seryo2020@Sato2025a. Current LL implementations
often limit microscopic feedback to polymer stress, treating the solvent
or matrix at a continuum level @Feng2016a@Smith2023@Tang2015. Moreover,
establishing consistent boundary conditions at the microscale presents a
considerable challenge, particularly in complex or transient flow
situations @Schmid2023@Vassaux2020. As a result, many LL schemes tend to
concentrate on idealized conditions, such as simple shear, or on
mean-field polymer models, which restricts their applicability to a
wider range of non-Newtonian systems. This underscores the necessity for
a more adaptive, bidirectional multiscale coupling strategy.

Herein, we adopt a GENERIC (General Equation for Non-Equilibrium
Reversible-Irreversible Coupling) compliant LHMM~@Moreno2023 framework
that enables bidirectional coupling between micro- and macroscales while
accurately preserving the full deformation history within a fully
Lagrangian framework. In this context, our implementation employs a
thermodynamics structure-prescribing, GENERIC-consistent SPH
discretization at the macroscopic level, and a DPD/FENE coarse-grained
model at the microscopic level @Fedosov2010@Litvinov2014. This
formulation allows the polymeric fluid to be represented as a
combination of solvent particles and spring-chain polymers of varying
lengths, with their configurations evolving dynamically. Following
Moreno & Ellero~@Moreno2023, the #emph[top-down coupling] is executed
via the AFBC protocol @Moreno2021. Within this approach, the macroscopic
velocity field
$upright(bold(u))_(upright("macro")) \( upright(bold(x)) \, t \)$
derived from SPH serves as the kinematic input for imposing the local
velocity gradient at the microscale:
$nabla upright(bold(u))_(upright("macro"))$. This coupling strategy
guarantees that the microscale shear rate adheres to the relation
$bold(dot(gamma)_(upright("micro"))) = nabla upright(bold(u))_(upright("macro"))$.
On the other hand, #emph[bottom-up] information is transmitted through
the IK formalism @Yang2012, which calculates the microscopic stress
tensor, enabling the evolving microstructural configuration to influence
the macroscopic momentum balance on-the-fly. This formulation
effectively maintains the complete deformation history across scales
while accurately capturing nonlinear viscoelastic responses derived from
detailed DPD simulations---without the need for the assumptions commonly
associated with generalized Langevin models~@Moreno2023. As a result,
fundamental rheological phenomena---such as viscoelastic relaxation,
shear thinning, and normal stress differences---arise naturally at the
microscale, #emph[without the need for a prescribed evolution equation
like $upright(bold(Q))$]~@Schieber2020@Datta2022@Winters2024. Overall,
the LHMM naturally integrates microstructural memory, making it
especially well-suited for complex viscoelastic systems that require an
in-depth understanding of molecular behavior.

We validate the LHMM using benchmark flows and complex porous-media
configurations @Kumar2023a@Haward2021c@Mokhtari2024@Browne2020. The
implementation is accelerated using GPUs within the LAMMPS environment
@Tang2015@Thompson2022@Nguyen2015, enabling near-linear scaling in
massively parallel computation and stable concurrent time stepping
between the SPH and DPD solvers. The LHMM thus provides a robust and
efficient multiscale avenue for polymer solutions and melts, with
potential applications to a broader class of fluid--structure
interaction problems dominated by history effects and complex kinematics
@Matous2017.

The efficacy and broad applicability of the proposed methodology are
demonstrated through benchmark cases such as Reverse Poiseuille Flow and
flow through a periodic array of cylinders, exhibiting excellent
numerical convergence and accurate recovery of both transient and
steady-state viscoelastic behaviors. Finally, we investigate flow
through 2D porous media with heterogeneous permeability, demonstrating
the LHMM 's ability to capture localized stress concentrations and
spatially varying deformation paths. Owing to GPU acceleration,
simulations with more than 200 million particles were achieved while
maintaining stability across concurrent time stepping between the SPH
and DPD solvers. The structure of this paper is organized as follows.
Sections~@sec:LHMM and @sec:algorithm introduce the LHMM methodology and
algorithmic formulation, including the coupling scheme and numerical
implementation. Section~@sec:micro_results presents the microscale
rheological characterization using DPD simulations.
Section~@sec:macro_results addresses benchmark validations and explores
complex flow geometries. Finally, Section~@sec:conclusions summarizes
the main findings and discusses future directions.

= Lagrangian Heterogeneous Multiscale Method (LHMM) <sec:LHMM>
The LHMM provides a theoretical framework for coupling continuum
descriptions across macroscopic and microscopic scales. At the
macroscopic level, the dynamics of a simple incompressible fluid are
governed by the Navier--Stokes equations, which can be written as:

$ nabla dot.op bold("v") = 0 \, quad rho frac(d bold("v"), d t) = nabla dot.op bold(tau) + bold("f") \, $<eq:NS_01>
where the total stress tensor is given by
$bold(tau)$$= - p upright(bold(I)) + bold(pi)$, with $p$ denoting the
pressure and $bold(pi)$ the extra stress, and $upright(bold(f))$ the
external body forces. For incompressible Newtonian fluids, the stress
($bold(pi)$) is purely viscous and is linearly related to the
strain-rate tensor ($upright(bold(d))$),
$bold(pi) = 2 eta_s upright(bold(d))$ with
$upright(bold(d)) = 1 / 2 (nabla bold("v") + nabla bold("v")^(upright(T)))$,
where $eta_s$ is the solvent viscosity. This linear constitutive
relation allows the flow field to be fully described by
Eq.~@eq:NS_01. However, for non-Newtonian fluids,
such as colloidal suspensions or polymer melts, this linear relationship
no longer holds, and the stress must instead be obtained from either
constitutive equations @Bird1987a or an explicit microscale description
of the extra stress $bold(pi)$, as is customary in
HMMs~@Weinan2007@Abdulle2012.

To maintain clarity in notation, we use an overbar to denote macroscopic
quantities and variables computed from microscopic estimates (e.g., the
macroscopic stress tensor containing microscopic information is denoted
as $macron(bold(pi))$). While purely microscopic quantities or local
microscopic control domains (viewed from the macroscopic level) are
indicated with a prime (e.g., $Omega'$ denotes a microscopic control
volume)~@Moreno2023. Consequently, using an ensemble-averaged of the
microscopic stresses measured over $Omega'$, yields the macroscopic
counterpart given by
$ macron(bold(pi)) \( upright(bold(x)) \) = 1 / Omega' integral_(Omega') bold(pi)' upright(d) Omega' = chevron.l bold(pi)' chevron.r \, $
where $chevron.l dot.op chevron.r$ denotes spatial averaging over the
microscopic domain. In general, the macroscopic stress tensor can be
decomposed as
$macron(bold(pi))$$\( upright(bold(x)) \, t \) = macron(bold(pi))_h \( upright(bold(x)) \, t \) + macron(bold(pi))_m \( upright(bold(x)) \, t \) + macron(bold(pi))_k \( upright(bold(x)) \, t \) \,$
where the subscripts $h$, $m$, and $k$ correspond to the hydrodynamic,
microstructural non-hydrodynamic (e.g polymer chains, colloidal
particles, or interfaces), and kinetic contributions, respectively.
Which leads to
$macron(bold(pi)) \( upright(bold(x)) \) = chevron.l bold(pi)'_h chevron.r + chevron.l bold(pi)'_m chevron.r + chevron.l bold(pi)'_k chevron.r$.
Notice that the term $bold(pi)'_h$ accounts for the hydrodynamic
contributions at the microscale~@Feng2016a@Vazquez-Quesada2009a.
However, as discussed by Moreno and Ellero @Moreno2023, in LHMM the
ideal hydrodynamic contributions can be conveniently accounted for
either from macro, microscale, or a combination of both scales.

Herein, for polymeric systems, the solvent stress contribution
($macron(bold(pi))_(upright(s))$) manifests at the macroscopic level as
an ideal Newtonian component, and for a spatially homogeneous solvent
this leads to $chevron.l bold(pi)'_h chevron.r =$
$macron(bold(pi))_(upright(s))$
$= bold(pi)_s = 2 eta_(upright(s)) upright(bold(d))$. Thus, we consider
that hydrodynamic contributions are fully captured by a Newtonian
description of the fluid at macroscales. In contrast, the
microstructural non-hydrodynamic contributions
$macron(bold(pi))_m \( upright(bold(x)) \) = chevron.l bold(pi)'_m chevron.r$
completely arise from the polymer dynamics modelled at the microscale,
such that
$chevron.l bold(pi)'_m chevron.r = macron(bold(pi))_p \( macron(upright(bold(d))) \, epsilon \) = chevron.l bold(pi)'_p chevron.r \( upright(bold(d))' \, epsilon \)$.
Where, $epsilon$ denotes a characteristic microscopic length-scale
associated with polymer structural features (e.g the end-to-end
distance, monomer size, or radius of gyration) depending on the level of
coarse-graining, which governs the local non-ideal (non-Newtonian)
response and depends on the macroscopic strain-rate field
$macron(upright(bold(d)))$. Accordingly, the total macroscopic stress
tensor can be expressed as the sum of solvent and polymeric
contributions:
$ macron(bold(pi)) \( upright(bold(x)) \) & = macron(bold(pi))_s + chevron.l bold(pi)'_p chevron.r \( upright(bold(d))' \, epsilon \) \,\
macron(bold(pi)) \( upright(bold(x)) \) & = underbrace(2 eta_(upright(s)) upright(bold(d)), upright("macroscopic (solvent)")) + underbrace(macron(bold(pi))_p \( macron(upright(bold(d))) \, epsilon \), upright("micro (polymer-microstructure)")) . $<eq:Hydro_hybrid>

The macroscopic strain-rate tensor $macron(upright(bold(d)))$ is
determined by the macroscopic velocity gradient field. The
ensemble-averaged polymeric stress $chevron.l bold(pi)'_p chevron.r$
defines also an effective polymeric viscosity
$macron(eta)_p$$\( upright(bold(x)) \, macron(upright(bold(d))) \, epsilon \)$.
Thus, the total effective viscosity ($eta_(upright(t o t))$)
characterizes the complex fluid and is defined as:
$ eta_(upright(t o t)) \( macron(upright(bold(d))) \, epsilon \) = eta_(upright(s)) + macron(eta)_p \( macron(upright(bold(d))) \, epsilon \) \, $<eq:eta_eff>
where $macron(eta)_p$ denotes the polymeric contribution resulting from
the evolving microstructure. In accordance with the work of Moreno and
Ellero~@Moreno2023, the macroscopic scales are discretized using the
well-established SPH
method~@LeTouze2025a@Pozorski2024@Patino-Narino2025. At the microscopic
level, the polymeric systems are modeled using the DPD method, which has
been extensively utilized in simulating complex polymeric
materials~@Fedosov2008a@Moreno2020@Lei2017a.

== Viscoelastic coupling and nondimensionalization <viscoelastic-coupling-and-nondimensionalization>
The polymeric stress tensor,
$chevron.l bold(pi)'_p chevron.r \( upright(bold(d))' \, epsilon \)$, is
evaluated through Irving--Kirkwood averaging over the microscopic
domains (see Section~@sub_micro_IK), contributing to the total
macroscopic stress tensor
(Eq.~@eq:Hydro_hybrid). To ensure
consistent coupling between the SPH and DPD discretizations, reproducing
the proper viscoelastic response of the polymeric system, we require a
coherent transfer of microscopic stresses to the macroscopic flow field.
To this end, we introduce a set of characteristic viscosity and times
scales for macro and micro descriptions, that define characteristic
stresses $macron(tau)^0$ and $tau'^0$. These characteristic stresses
serve as reference to conduct the communication between scales via
non-dimensional values. This scaling parameter is crucial when numerical
methods differ across scales (such as SPH and DPD), making the scaling
approximation essential for achieving proper coupling between varying
quantities and dimensions.

Under steady shear conditions, the polymer melt exhibits a zero-shear
viscosity ($eta_p^0$) and a characteristic relaxation time ($lambda$),
where the critical shear rate corresponding to the crossover of the
storage and loss moduli satisfies
$dot(gamma)_(x y)^c approx 1 \/ lambda$~@Santelli2024@Becerra2020@Katzarova2015.
These parameters define the viscoelastic transition between the
Newtonian plateau and the shear-thinning regime, characteristic of
polymer melts ~@Fedosov2010@Litvinov2014, and within the range
determined by the microstructure configuration. Accordingly, a
convenient characteristic stress (associated with the zero-shear
viscosity and relaxation time) can be defined as
$macron(tau)^0 = macron(eta)_p^0 \/ macron(lambda)$ and
$tau' ""^0 = eta' ""_p^0 \/ lambda'$ for the macroscale and microscale,
respectively. Thus, if we require that the dimensionless polymeric
stress tensors remain consistent across scales, then
$macron(bold(pi))_p \/ macron(tau)^0 = chevron.l bold(pi)'_p chevron.r \/ tau' ""^0$.
Consequently, the polymeric stress contribution at the macroscopic level
can be readily expressed as:
$ macron(bold(pi))_p = frac(macron(tau)^0, tau' ""^0) chevron.l bold(pi)'_p chevron.r = frac(\( macron(eta)_p^0 \/ eta' ""_p^0 \), \( macron(lambda) \/ lambda' \)) chevron.l bold(pi)'_p chevron.r dot(=) alpha / lambda^(*) chevron.l bold(pi)'_p chevron.r \, $<eq:pip>
where the introduce
$ alpha dot(=) frac(macron(eta)_p^0, eta' ""_p^0) #h(2em) upright("and") #h(2em) lambda^(*) dot(=) macron(lambda) / lambda' \, $<eq:ratios>
represent the viscosity and time-scale ratios between the macroscopic
and microscopic descriptions, respectively.

At the macroscopic level, from Eq.~@eq:eta_eff,
the total effective viscosity in the zero-shear rate limit is given by
$eta_(upright(t o t))^0$$=$ $macron(eta)_p^0$ $+$ $eta_s$. It should be
noted that $eta_(upright(t o t))^0$ acts as a reference quantity under
zero-shear conditions; however, within the LHMM framework, the effective
viscosity evolves dynamically with the local deformation and the
underlying microstructure. In the context of viscoelastic polymeric
systems, it is customary to define the viscosity ratio $beta$ as the
fraction of the polymeric contribution to the total viscosity. The total
viscosity is often related to material properties such as polymer
concentration or solvent quality. This relationship can be expressed as
$beta$$=$$macron(eta)_p^0$/$eta_(upright(t o t))^0$, where the polymeric
viscosity employed at the macroscopic SPH level is defined, according to
Eq.~@eq:ratios, as
$macron(eta)_p^0$$=$$alpha$$eta' ""_p^0$. Hence:
$ beta = macron(eta)_p^0 / eta_(upright(t o t))^0 = frac(alpha eta' ""_p^0, alpha eta' ""_p^0 + eta_s) \, $<eq:beta>
where $eta' ""_p^0$ denotes the zero-shear viscosity prescribed by the
microscale system, extracted from the microscopic DPD characterization
(Section~@subsec:steady_shear). For consistency, the shear-rate tensor
$macron(upright(bold(d)))$ at the macroscopic level must be rescaled by
$lambda^(*)$ to ensure synchronized deformation timescales between both
scales, such that
$upright(bold(d))' = lambda^(*) macron(upright(bold(d)))$, where
$upright(bold(d))'$ is the actual shear-rate tensor imposed at the
microscale. The scaling factor $alpha$ is varied to represent different
polymer melt configurations, accounting for changes in the polymeric
fraction or molecular structure at the macroscopic level. The
characteristic time ratio $lambda^(*)$$= macron(lambda) \/ lambda'$ is
set to unity, reflecting synchronous description of relaxation times
across scales; this is generally the case when there is no scale
separation between micro-structured timescale and the macroscopic one
(as in long-memory behavior fluids), and can be handled by the same time
stepping schemes. On the other hand, $lambda^(*) eq.not 1$ should be
chosen when dealing with short-memory fluids; its role in temporal
coupling is discussed in Section~@sec:Time-DepentLHMM.

As shown in Eq.~@eq:Hydro_hybrid, the
first term represents the ideal Newtonian response of the solvent,
evaluated at the SPH level. In contrast, the second term incorporates
the microstructural contribution from coarse-grained DPD simulations and
is introduced through Eq.~@eq:pip. This hybrid
approach consistently integrates multiscale physics, enabling the
capture of time-dependent phenomena such as shear thinning, thickening,
and strain hardening without relying on empirical constitutive models.
Consequently, the total stress $bold(tau)$ is formulated within a
Lagrangian framework, incorporating the stress decomposition from
Eq.~@eq:Hydro_hybrid into the momentum
balance (Eq.~@eq:NS_01), leading to:
$ rho frac(d upright(bold(v)), d t) = - nabla p + nabla dot.op (2 eta_(upright(s)) upright(bold(d))) + alpha / lambda^(*) nabla dot.op chevron.l bold(pi)'_p chevron.r + upright(bold(f)) . $<eq:macro>
Here, $d \/ d t$ denotes the material derivative, which represents the
change in velocity of a fluid parcel as it moves through space and time.

== Macroscale: Smoothed Particle Hydrodynamics <macroscale-smoothed-particle-hydrodynamics>
At the macroscale, the fluid is discretized into $I$ particles with
their positions $upright(bold(r))_I$ and velocities
$upright(bold(v))_I$. For clarity, we use uppercase indices $I$ and $J$
to denote the particles in the macroscopic domain. A thermodynamically
consistent SPH formulation of the continuity and momentum equations,
following Español, Revenga & Ellero ~@Espanol2003@Ellero2018 and
consistent with Eq.~@eq:macro, is given by:
$ m_I frac(d upright(bold(v))_I, d t) = sum_J [p_I / d_I^2 + p_J / d_J^2] F_(I J) upright(bold(r))_(I J) - [a upright(bold(v))_(I J) + b \( upright(bold(v))_(I J) dot.op upright(bold(e))_(I J) \) upright(bold(e))_(I J)] frac(F_(I J), d_I d_J) - underbrace(overbrace(alpha / lambda^(*) chevron.l bold(pi)'_p chevron.r_(I J), macron(bold(pi))_(p \, I J)) F_(I J) upright(bold(r))_(I J), upright("Micro-to-Macro Coupling")) . $<eq:sph_continuity>
Here,
$upright(bold(r))_(I J) = upright(bold(r))_I - upright(bold(r))_J$,
$upright(bold(v))_(I J) = upright(bold(v))_I - upright(bold(v))_J$, and
$upright(bold(e))_(I J) = frac(upright(bold(r))_(I J), parallel upright(bold(r))_(I J) parallel)$.
The mass of particle $I$ is denoted as $m_I$, and the friction
coefficients are given by $a = 2 eta_s - zeta_s$ and
$b = 4 zeta_s + 2 eta_s$, which are related to the solvent shear
($eta_s$) and bulk ($zeta_s$) viscosities. The particle number density
is expressed as
$d_I = sum_(J = 1)^N W \( parallel upright(bold(r))_(I J) parallel \, h \)$,
leading to the definition $rho_I$$= m_I d_I$ for the explicit summation
density conservation~@Espanol2003. The kernel gradient is calculated as
$F_(I J) = - nabla W_(I J) \/ parallel upright(bold(r))_(I J) parallel$.
A bell-shaped kernel with compact support, $h$$= 4$$Delta h$, is used
where $Delta h$ is the mean SPH particle spacing, specifically adopting
the Lucy kernel (@AppSPH).

The last term on the right-hand side of
Eq.~@eq:sph_continuity corresponds to an
inter-particle average approximation that incorporates the polymeric
stresses,
$chevron.l bold(pi)'_p chevron.r_(I J) = (chevron.l bold(pi)'_p chevron.r_I \/ d_I^2 + chevron.l bold(pi)'_p chevron.r_J \/ d_J^2)$,
where the stresses of particles $I$ and $J$ are obtained from the
microscale through the IK formulation, thereby facilitating the
micro-to-macro stress coupling. The pressure of particle $I$ ($p_I$) is
governed by the Tait equation of state, expressed as:

$ p_I = frac(c^2 rho_0, 7) [(rho_I / rho_0)^7 - 1] + p_b . $<eq:tait> In
this context, $c$ represents the speed of sound, while $rho_0$ denotes
the reference density. The background pressure is defined as
$p_b = theta c^2 rho_0 \/ 7$ (with $theta < 1$), which ensures that
$p_I > 0$. For numerical stability, it is essential that the Mach number
$upright(M a) = macron(v) \/ c lt.eq 0.1$ (where $macron(v)$ is the
average characteristic velocity). This condition maintains the fluid's
weak compressibility and enables feasible time steps (refer to
@SoundAn).

== Microscale: Polymer Melt Model --- DPD and FENE <subsec:micro>
The DPD method, initially proposed by Hoogerbrugge and Koelman
(1992)~@Hoogerbrugge2007, is employed here as a mesoscopic simulation
technique in which clusters of molecules are represented as Lagrangian
particles. It enables simulations over time and length scales often
inaccessible to atomistic
MD~@Groot1997b@Fedosov2010@Moreno2014b@Moreno2015a. Within the LHMM
framework, polymer melts at the microscale are modeled using DPD
particles representing coarse-grained polymer chains or their
constituent beads. To maintain clarity in our multiscale notation,
lowercase indices $i$ and $j$ are used for particles in the microscopic
domain. Chain connectivity and finite extensibility are ensured through
the FENE potential between DPD polymer beads~@Litvinov2014@Lei2017a.
This combined DPD/FENE approach captures viscous fluid behavior via
dissipative and random forces, conserves momentum, maintains constant
temperature, and provides the microstructural information required for
bottom-up stress calculations.

Each DPD particle $i$, with mass $m_i$, evolves according to Newton's
equations of motion:
$ m_i frac(d upright(bold(v))'_i, d t) = upright(bold(F))_i^(upright("DPD")) + sum_(k in upright("bonds to ") i) upright(bold(F))_(i \, k)^(upright("FENE")) \, $<eq:motion>
where $upright(bold(F))_i^(upright("DPD"))$ is the sum of all non-bonded
interactions with other particles $j$:
$ upright(bold(F))_i^(upright("DPD")) = sum_(j eq.not i) (upright(bold(F))_(i j)^C + upright(bold(F))_(i j)^D + upright(bold(F))_(i j)^R) . $<eq:F_DPD>
The pairwise forces are defined as follows. The conservative force:
$ upright(bold(F))_(i j)^C = a_(i j) (1 - frac(parallel upright(bold(r))'_(i j) parallel, r_c)) upright(bold(e))'_(i j) \, quad parallel upright(bold(r))'_(i j) parallel < r_c \, $<eq:conservative>
where $a_(i j)$ is the conservative force amplitude and $r_c$ is the
cutoff radius. The dissipative force:
$ upright(bold(F))_(i j)^D = - gamma^D thin w^D \( parallel upright(bold(r))'_(i j) parallel \) thin \( upright(bold(e))'_(i j) dot.op upright(bold(v))'_(i j) \) thin upright(bold(e))'_(i j) \, $<eq:dissipative>
with $gamma^D$ the dissipation coefficient,
$w^D \( parallel upright(bold(r))'_(i j) parallel \)$ its weight
function,
$upright(bold(r))'_(i j) = upright(bold(r))'_i - upright(bold(r))'_j$,
$upright(bold(v))'_(i j) = upright(bold(v))'_i - upright(bold(v))'_j$,
and
$upright(bold(e))'_(i j) = frac(upright(bold(r))'_(i j), parallel upright(bold(r))'_(i j) parallel)$.
The random force:
$ upright(bold(F))_(i j)^R = sigma^R thin w^R \( parallel upright(bold(r))'_(i j) parallel \) thin theta_(i j) thin upright(bold(e))'_(i j) \, $<eq:random>
where $sigma^R$ is the random force amplitude,
$w^R \( parallel upright(bold(r))'_(i j) parallel \)$ its weight
function, and $theta_(i j)$ a Gaussian random variable with zero mean
and unit variance. All pairwise forces vanish beyond the cutoff distance
$r_c$. To ensure momentum conservation and maintain a constant
temperature, the fluctuation--dissipation theorem @Espanol1995
stipulates that
$w^D \( parallel upright(bold(r))'_(i j) parallel \) = [w^R \( parallel upright(bold(r))'_(i j) parallel \)]^2$
and that $sigma^D = \( 2 gamma^D k_B T \)^(1 \/ 2 dot.double)$. In these
equations, $T$ denotes the temperature, while $k_B$ represents the
Boltzmann constant. Consequently, polymer chains are formed by
connecting beads with FENE springs. The bonded term in
Eq.~@eq:motion is expressed as follows:
$ upright(bold(F))_(i j)^(upright("FENE")) \( upright(bold(r))'_(i j) \) = frac(H_(upright("FENE")) upright(bold(r))'_(i j), 1 - \( parallel upright(bold(r))'_(i j) parallel \/ R_0 \)^2) \, $<eq:fene_force>
where $H_(upright("FENE"))$ is the spring constant and $R_0$ the maximum
bond extension. This potential captures the finite extensibility of
polymer chains, enabling accurate predictions of shear-dependent and
extensional viscosities. The DPD simulations utilize a reduced
(dimensionless) unit system defined by the bead mass ($m_i$), cutoff
radius ($r_c$), and thermal energy ($k_B$$T$), with further details
provided in Section~@subsec:polymer_details.

== Time-Dependent Dynamics and Relaxation <sec:Time-DepentLHMM>
Polymer melts are viscoelastic fluids
characterized by a flow resistance (viscosity) that is strongly
influenced by shear rate, temperature, and molecular
structure~@Schieber2020@Morii2021. Coarse-grained DPD models can be
calibrated to accurately reproduce the microstructural dynamics of a
polymer melt and predict its specific shear-thinning
behavior~@Litvinov2014@Fedosov2010. This non-Newtonian response arises
from the microscopic dynamics of polymer chains, making the Wi1 a key
dimensionless parameter in the study of viscoelastic fluid
dynamics~@NietoSimavilla2022@Sun2024. It quantifies the ratio between
elastic and viscous forces and is defined as:
$ upright(W i) = dot(gamma) lambda \, $<eq:WI> where $dot(gamma)$ is the
characteristic shear rate, and $lambda$ is the material's characteristic
relaxation time. The relaxation time, influenced by the microscopic
configuration and reflected in the polymeric stress tensor
($chevron.l bold(pi)'_p chevron.r$ in
Eq.~@eq:Hydro_hybrid), governs the
transient response of the melt. It is determined through DPD simulations
using virtual rheometry, as described in Section~@subsec:steady_shear,
for Wi values ranging from 0.5 to 30.

To ensure consistency in timescaling within the LHMM framework
established in Eq.~@eq:pip, the characteristic
relaxation time at the macroscale ($macron(lambda)$) is related to the
microscale measurement ($lambda'$) by the time-scale ratio
$lambda^(*) = macron(lambda) \/ lambda'$
(Eq.~@eq:ratios). For this study, we assume that
the relaxation effects arising from the microstructural system of the
polymeric melt, as simulated with DPD, and the temporal coupling are
configured to satisfy the condition $macron(lambda) = lambda'$, leading
to $lambda^(*) = 1$. This assumption therefore reflects the long
microstructured relaxation effects present in polymeric systems and
facilitates temporal synchronization between the microscopic and
macroscopic solvers, resulting in a cohesive viscoelastic response
across the coupled system and enabling the characterization of a global
rheological parameter. As both levels of description use identical
relaxation dynamics at the microscale, we will refer to the relaxation
time as $lambda$ from this point forward.

=== Temporal Coupling Scheme and Invariant micro-macro Weissenberg Number (Wi) <sec:Time-Coupling>
In the LHMM, maintaining consistent temporal
resolution is critical when coupling SPH for macroscopic scales and DPD
for microscopic scales. Thus, given the macroscopic
Eq.~@eq:sph_continuity and microscopic
Eq.~@eq:motion evolution equations, the
information exchange occurs at every exchange time step ($delta t$). The
SPH time step ($Delta macron(t)_(upright("SPH"))$) governs the
macroscopic flow evolution, while the DPD and FENE time step
($Delta t'_(upright("DPD"))$) resolve the dynamics of the finer
microscopic structures. A fundamental requirement for accurately
capturing microscopic relaxation processes is that the DPD time step
must be significantly smaller than the characteristic relaxation time,
i.e., $Delta t'_(upright("DPD")) lt.double lambda$.

Our proposed Continuous Intermittent (CI) method~@Lockerby2013
effectively manages this temporal consistency. The exchange time step
($delta t$) defines the fixed interval at which information is
transferred between the macroscopic and microscopic models~@Moreno2023.
This interval is expressed as
$delta t = macron(M) dot.op Delta macron(t)_(upright("SPH")) = k' dot.op Delta t'_(upright("DPD"))$,
where $macron(M)$ and $k'$ are positive integers. To accurately map
transient behaviors between scales and ensure proper capture of
relaxation effects, a hierarchical relationship must be satisfied:
$delta t lt.double lambda$. This setup allows the microscopic DPD model
to evolve continuously, capturing relaxation effects, while SPH resolves
macroscopic variations.

Due to the ongoing execution of the microscale DPD simulation and its
intermittent sampling by the macroscale SPH at defined time intervals
($delta t$), the relaxation time ($lambda$) derived from microscopic
dynamics is consistently aligned across both scales and is
systematically mapped to the physical time step of the SPH simulation
through the integers $k'$ and $macron(M)$. Both parameters must satisfy
the condition
$delta t = macron(M) dot.op Delta macron(t)_(upright("SPH")) = k' dot.op Delta t'_(upright("DPD"))$.
This direct scaling ensures that the relaxation time determined by DPD
is implicitly reflected in macroscopic behavior, fulfilling the
assumption of $lambda^(*) = 1$. Consequently, a significant advantage of
this methodology is the invariance of the Weissenberg number
(Eq.~@eq:WI) across scales:
$upright("Wi")_(upright("SPH")) = upright("Wi")_(upright("DPD"))$.

The consistency of the characteristic time scale, combined with the
definition of the macroscopic-to-microscopic rate-of-strain tensor
$macron(upright(bold(d)))$$= lambda^(*) upright(bold(d))'$ as a locally
averaged variable coupling the scales, ensures that Wi remains
effectively identical across them. A detailed analysis of the influence
of different $delta t$ values and of the
$k' dot.op Delta t_(upright("DPD")) = macron(M) dot.op Delta t_(upright("SPH"))$
relationships is presented in Section~#link(<SM>)[SM5] for various test
cases in the #link(<SM>)[Supplementary Material].

== Macro-to-Micro Coupling <sub_micro_bc>
The coupling between macroscopic and microscopic scales
(top-down) occurs at discrete time intervals defined as
$delta t = macron(M) Delta macron(t)_(upright(S P H))$. At each interval
$delta t$, the macroscopic velocity gradient, denoted as
$nabla upright(bold(v))_I$, is computed at the position of SPH particle
$I$ and subsequently assigned to the corresponding microscopic domain
$Omega'$. This procedure, proposed and validated by Moreno & Ellero
(2023) in the context of LHMM~@Moreno2023, determines
$nabla upright(bold(v))_I$ through the SPH kernel approximation:
$ nabla upright(bold(v))_I = sum_J F_(I J) upright(bold(r))_(I J) upright(bold(v))_(I J) . $<eq:macro_micro>

For consistency, the $nabla upright(bold(v))_I$ defining the boundary
condition of the microscopic simulations must be rescaled by the
time-scale ratio $lambda^(*)$ to ensure synchronization between levels,
i.e., $nabla upright(bold(v))'_I = lambda^(*) nabla upright(bold(v))_I$.
The microscopic domain ($Omega'$) applies the AFBC methodology adapted
from Moreno & Ellero~@Moreno2021@Moreno2023 for DPD/FENE
implementations. The AFBC divides $Omega'$ into three regions: the core
region ($Omega'_(upright(c o r e))$), the boundary-condition (BC) region
($Omega'_(upright(b c))$), and the buffer region ($Omega'_0$). For each
microscopic DPD particle $i$ within $Omega'_(upright(b c))$, the
reconstructed microscopic velocity field, denoted $upright(bold(v))'_i$,
is obtained using the macroscopic velocity gradient from
Eq.~@eq:macro_micro:
$ upright(bold(v))'_i = upright(bold(r))'_i dot.op lambda^(*) nabla upright(bold(v))_I \, quad forall i in Omega'_(upright(b c)) \, $<eq:micro_bc>
where $upright(bold(r))'_i$ denotes the position of microscopic particle
$i$ relative to the center of mass of its micro-domain. The velocity
gradient $nabla upright(bold(v))_I$ corresponds to that derived from the
macroscopic particle $I$ (as defined in
Eq.~@eq:macro_micro) at each coupling
interval $delta t = macron(M) Delta t'_(upright(S P H))$. The
application of $upright(bold(v))'_i$ to $Omega'_(upright(b c))$
establishes the macro-to-micro (top-down) coupling. In particular, the
macroscopic rate-of-strain tensor $macron(upright(bold(d)))$, defined in
Eq.~@eq:Hydro_hybrid, is effectively
imposed on the microscopic fluid via the corresponding
$nabla upright(bold(v))_I$. Further details on the coupling protocol are
provided in @subsec:coupling_protocol and in~@Moreno2021@Moreno2023.

== Micro-to-macro Coupling <sub_micro_IK>
The Irving--Kirkwood (IK) formalism serves as the
foundational framework for transferring information from microscale
DPD/FENE simulations to macroscale SPH particles @Moreno2021@Moreno2023.
Central to the bottom-up approach, the IK formalism allows for the
direct computation of the macroscopic polymeric stress tensor
($chevron.l bold(pi)'_p chevron.r$), which functions as the
micro-to-macro coupling term in the SPH momentum equations as
approximated in Eq.~@eq:sph_continuity.
This process is integrated over the temporal interval $delta t$,
capturing the microstructural response of the polymer melt. The
formalism maps statistical averages of microscopic quantities---such as
particle positions, velocities, and interparticle forces---within the
microscale core region ($Omega'_(upright(c o r e))$) to a representative
contribution in the macroscopic stress tensor ($macron(bold(pi))$).

For a given macroparticle SPH $I$, its associated polymeric stress
tensor $chevron.l bold(pi)'_p chevron.r$$""_I$ is obtained by
microscopically averaging the DPD/FENE interactions within its
corresponding micro-domain. That is,
$chevron.l bold(pi)'_p chevron.r$$""_I = chevron.l bold(pi)' ""_p^(upright(I K)) chevron.r_I$.
This local stress tensor within $Omega'_(upright(c o r e))$, denoted as:
$ chevron.l bold(pi)' ""_p^(upright(I K)) chevron.r_I \( upright(bold(x))' \, t \) = chevron.l bold(pi)' ""_p^(upright(k i n)) chevron.r_I \( upright(bold(x))' \, t \) + chevron.l bold(pi)' ""_p^(upright(p o t)) chevron.r_I \( upright(bold(x))' \, t \) . $<eq:IKtotal>
The kinetic stress
($chevron.l bold(pi)' ""_p^(upright(k i n)) chevron.r_I$) accounts for
momentum transport resulting from the thermal motion and flow-induced
fluctuations of individual DPD beads. It captures the energetic and
diffusive aspects of the fluid's response to deformation, and it is
computed as:
$ chevron.l bold(pi)' ""_p^(upright(k i n)) chevron.r_I = - 1 / N'_t sum_(n = 1)^(N'_t) [sum_i m_i thin w_(upright("IK")) \( upright(bold(r))'_i \( n \) - upright(bold(x))' \) thin Delta upright(bold(v))'_i \( n \) times.o Delta upright(bold(v))'_i \( n \)] $<eq:kinetic_stress>
Where $N'_t$ is the number of microscopic time steps used in the
interval $delta t' = k' Delta t_(upright(D P D))$. The quantity
$Delta upright(bold(v))'_i \( n \)$ is the velocity of particle $i$
relative to the local streaming velocity at time step $n$, and
$w_(upright("IK")) \( upright(bold(r))'_i \( n \) - upright(bold(x))' \)$
is a spatial weighting function that projects microscopic quantities
onto the macroscopic point $upright(bold(x))$.

The potential stress
($chevron.l bold(pi)' ""_p^(upright(p o t)) chevron.r_I$) arises from
interparticle forces. This includes the FENE potential, which governs
the elasticity and finite extensibility of polymer bonds. It also
accounts for non-bonded stochastic hydrodynamic interactions such as DPD
conservative, dissipative, and random forces. These contributions
reflect the stored elastic energy and short-range interactions that
characterize the melt's viscoelastic behavior. Assuming a central force
decomposition where
$upright(bold(f))_(i j) = phi_(i j) upright(bold(e))_(i j)$, the
potential stress is given by:
$ chevron.l bold(pi)' ""_p^(upright(p o t)) chevron.r_I = frac(1, 2 N'_t) sum_(n = 1)^(N'_t) [sum_(i \, j\
i eq.not j) upright(bold(f))_(i j) \( n \) times.o upright(bold(r))'_(i j) \( n \) thin cal(B) \( upright(bold(x)) \; upright(bold(r))'_i \( n \) \, upright(bold(r))'_j \( n \) \)] $<eq:potential_stress>
The bond function
$cal(B) \( upright(bold(x))' \; upright(bold(u))' \, upright(bold(v))' \)$
integrates the weighting function $w_(upright("IK"))$ along the path
connecting the two particles:
$ cal(B) \( upright(bold(x))' \; upright(bold(u))' \, upright(bold(v))' \) = integral_0^1 w_(upright("IK")) (\( 1 - s \) upright(bold(u))' + s upright(bold(v))' - upright(bold(x))') d s $
This formulation yields the Hardy stress. Different choices of the
weighting function $w_(upright("IK"))$ recover other well-known
microscopic stress definitions. For more details, we refer the reader to
the work of Moreno & Ellero (2021)~@Moreno2021.

= LHMM Methodology Algorithm <sec:algorithm>
The LHMM proposed in this work operates as a two-way coupling
methodology. The macroscale kinematics informs the microscale model at a
specific, constant frequency defined by the coupling time step $delta t$
as a top-down coupling. Conversely, it is bottom-up since the stress
computed via IK formalism at the microscale closes the macroscopic
conservation equation by the same coupling time step $delta t$. The
coupling between models at different scales is achieved through data
exchange @Smith2023@Matous2017, specifically stress tensors
($chevron.l bold(pi)'_p chevron.r$) from the microscale and velocity
gradients ($nabla upright(bold(v))_I$) from the macroscale. These
top-down and bottom-up approach contrasts with methods that link scales
directly through their solution fields @Larson2015@King2021.

The LHMM framework necessitates careful synchronization between the time
integration schemes of the macroscopic (SPH) and microscopic (DPD/FENE)
solvers, adhering to principles established in earlier studies
@Moreno2023@Moreno2021. Given the inherent differences in time
scales---where DPD/FENE captures the dynamics of polymers at the
microstructural level while SPH addresses macroscopic flow---a
time-stepping strategy is employed to ensure both numerical stability
and physical consistency. This strategy is governed by the relationship
$delta t = macron(M) dot.op Delta macron(t)_(upright("SPH")) = k' dot.op Delta t'_(upright("DPD"))$.
It builds upon concepts discussed in previous
Sections~@sec:Time-DepentLHMM.

== Implementation Framework and Workflow <subsec:flowchart_overview>
The LHMM multiscale coupling scheme employs a C++/MPI architecture that
coordinates LAMMPS simulations @Xu2024@Hue2025. The overall workflow and
data exchange between scales are summarized in
@fig:LHMM_Flowchart and detailed in @sec:Flowchart, while the
step-by-step coupling protocol is provided in @subsec:coupling_protocol.
Together, these appendices complement the description below by offering
both a schematic overview and the full operational procedure.

The LHMM architecture achieves strong scaling performance through three
main features: (1) dedicated MPI sub-communicators connecting macro- and
micro-domains (@fig:LHMM_Flowchart), (2) suitable GPU-accelerated
for the integration of multiple microscopic computations in parallel
distribution @Nguyen2015@Thompson2022, and (3) direct tensor transfer
via the LAMMPS C++ interface @Oda2025@Xie2023. The full implementation
is available at
#link("https://github.com/BCAM-CFD/LHMM/tree/main/LHMM-PolymerDPD"). The
computational performance and scalability of the coupling scheme were
evaluated across various hardware architectures, encompassing both CPU
and GPU computational resources. This approach involved managing
multiple coupling and time-scaling levels to ensure numerical stability
and accuracy. Our implementation adeptly accommodates a particle range
from $1 dot.op 10^7$ to $1 dot.op 10^8$, integrating all particles from
each microsystem with the macro particles within the framework of
High-Performance Computing (HPC) nodes and workstations. Detailed
benchmarks---including CPU/GPU comparisons and single-GPU
performance---are detailed in Section~#link(<SM>)[SM10] in the
#link(<SM>)[Supplementary Material].

The GPU-enabled `DPD/GPU` module (@sec:Flowchart) further boosts
microscale performance by enabling the parallel execution of independent
microdomains. Since each micro simulation proceeds in a decoupled
manner, the domains can be distributed across multiple NVIDIA GPUs with
minimal communication overhead. This strategy noticeably outperforms
single-GPU setups and provides a scalable pathway toward multi-GPU
implementations for large-scale simulations.

== Microscale Domain and Boundary Conditions <sec:boundary_regions>
For all cases, the polymer melt system considered here consists solely
of flexible, monodisperse bead-spring chains with
$N_(upright(d)) in { 8 \, 16 \, 32 }$ beads connected by FENE springs.
As polymer melts, these systems contain no solvent particles, and chains
are distinguished solely by their bead numbers. The computational domain
for these microscale DPD simulations, defining the individual
micro-domains within the LHMM framework, is configured using DPD units
as illustrated in @Fig:1\(a). This domain implements an AFBC to
facilitate the coupling between the macroscopic and microscopic scales
@Moreno2021@Moreno2023. Table @Tab:2 outlines the dimensions of the
core, buffer, and boundary condition regions specific to this setup.

#figure(
  align(center)[#table(
    columns: 5,
    align: (left,center,center,center,center,),
    table.header([$l_(upright("core"))$], [$l_(upright("bc"))$], [$l_(upright("buffer"))$], [$l_(upright("total"))$], [],),
    table.hline(),
    [24], [13], [13], [76], [],
  )]
  , caption: [Dimensions of the DPD simulation regions for Arbitrary
  Flow Boundary Conditions (AFBC) used with monodisperse bead-spring
  chains. $l_(upright("core"))$ is the length of the core region,
  $l_(upright("bc"))$ is the length of the boundary condition region,
  $l_(upright("buffer"))$ is the length of the buffer region, and
  $l_(upright("total"))$ is the total domain length. For more details,
  see @Fig:1\(a).]
  , kind: table
  ) <Tab:2>

#figure(image("source/BoundaryC-eps-converted-to.pdf"),
  caption: [
    \(a) Sketch of the Arbitrary Flow Boundary Conditions and their
    definition of buffer ($Omega'_0$), Boundary Condition
    ($Omega'_(upright(b c))$), and Core ($Omega'_(upright(c o r e))$)
    regions for the DPD/FENE simulation. This diagram also illustrates
    how each micro-domain is delimited within the LHMM framework for
    monodisperse bead-spring chains (polymer melts). Here,
    $l_(upright("total"))$ is the total length of the arbitrary flow
    boundary setup, $l_(upright("core"))$ is the length of the core
    region, $l_(upright("bc"))$ is the length of the boundary condition
    region, and $l_(upright("buffer"))$ is the length of the buffer
    region. (b) Details of the initial configuration within the core
    regions for polymer melts with different chain lengths,
    $N_(upright(d))$$in { 8 \, 16 \, 32 }$.
  ]
)
<Fig:1>

As illustrated in @Fig:1\(a), this computational domain employs
three specialized regions to model complex flow configurations and
enable the micro-macro coupling:

- The #emph[Core region] ($Omega'_(upright(c o r e))$) represents the
  active simulation area where the fluid's physical behavior is
  simulated and where the polymer melt's viscometric properties are
  measured. Specifically, the average polymer stress
  $chevron.l bold(pi)'_p chevron.r$ is computed through the IK formalism
  (Eq.~@eq:IKtotal). As shown in
  @Fig:1\(b), this panel displays the initial configuration within
  the $Omega'_(upright(c o r e))$ for polymer melts with different chain
  lengths, $N_(upright(d)) in { 8 \, 16 \, 32 }$.

- The #emph[Boundary-Condition region] ($Omega'_(upright(b c))$) is
  crucial for the top-down coupling. It imposes target velocity fields
  through interpolation functions, specifically utilizing
  Eq.~@eq:micro_bc (Section~@sub_micro_bc) for
  the transfer of discrete macroscopic velocity gradients
  ($nabla upright(bold(v))_I$) from the associated macro-particle. This
  region ensures smooth velocity transitions and allows for the
  specification of arbitrary flow profiles, including both open and
  closed boundary configurations.

- The #emph[Buffer region] ($Omega'_0$) is designed to stabilize mass
  and momentum fluxes between periodic boundaries and the core domain.
  This region effectively acts as a thermal reservoir, with its capacity
  primarily controlled by adjusting its size ($l_(upright("buffer"))$)
  or modulating its temperature @Moreno2021. While larger buffer regions
  ensure greater stability at increased computational cost, temperature
  modulation offers an alternative for maintaining equilibrium without
  requiring an excessive number of particles. This design is crucial for
  handling strong velocity gradients while preventing disruption of the
  core region dynamics.

== Polymer Melt Model Details <subsec:polymer_details>
Table @Tab:1 presents the set of DPD and FENE simulation parameters
(referencing
Eqs.~@eq:motion -- @eq:fene_force)
adopted for all microsystems investigated in this work. These parameters
are consistent with those successfully employed in previous studies for
polymer melts @Litvinov2014@Fedosov2010 and were applied uniformly
across both the microscale characterization and the LHMM simulations for
all presented cases.

#figure(
  align(center)[#table(
    columns: 10,
    align: (left,center,center,center,center,center,center,center,center,center,),
    table.header([$k_b T$], [$a_(i j)$], [$gamma^D$], [$m_(upright(D P D))$], [$n_(upright(D P D))$], [$d x = n^(- 1 \/ 2)$], [$R_0$], [$r_c$], [$H_(upright("FENE"))$], [$Delta t_(upright(D P D))$],),
    table.hline(),
    [1.0], [25], [4.5], [1], [4], [0.5], [1.5], [1.0], [50], [0.005],
  )]
  , caption: [DPD and FENE simulation parameters for monodisperse
  bead-spring chains. $k_B$ is the Boltzmann constant, $T$ is the
  temperature, $a_(i j)$ is the conservative force coefficient,
  $gamma^D$ is the amplitude of the dissipative force,
  $m_(upright(D P D))$ is mass of a DPD particles, $n_(upright(D P D))$
  is the DPD number density, and $d x$ is the average initial distance
  between beads. $R_0$ is the maximum extension of FENE springs, $r_c$
  is the DPD cutoff radius, and $H_(upright("FENE"))$ is the FENE spring
  constant. $Delta t'_(upright("DPD"))$ is the DPD time step.]
  , kind: table
  ) <Tab:1>

The DPD method makes use of reduced units to ensure the generality of
simulation results. In this framework, physical quantities are made
dimensionless by normalising them with characteristic scales derived
from a set of base units~@Serrano1999@Groot1997. For this work, we
define the particle mass, cutoff radius, and thermal energy as base
units: $m_(upright(D P D)) = 1$, $r_c = 1$, and $k_B T = 1$
(Table~@Tab:1). From these, we derive the characteristic scales for
time,
$tau_(upright(D P D)) = r_c sqrt(m_(upright(D P D)) \/ \( k_B T \))$,
and stress, $pi_(upright(D P D)) = k_B T \/ r_c^3$. Since the base units
are unitary, these scales also become one, simplifying the
interpretation of results. All reported quantities are thus implicitly
dimensionless. For example, the integration step
$Delta t_(upright(D P D)) = 0.005$ in Table~@Tab:1 is equivalent to
$0.005 thin tau_(upright(D P D))$, and all stress tensor components are
normalized by $pi_(upright(D P D))$. This systematic
non-dimensionalisation is essential for the consistent reporting and
subsequent use of the DPD data in our multiscale coupling scheme.

= Rheological characterization <sec:micro_results>
The local rheological characterization is conducted at the microscopic
level using DPD/FENE simulations, specifically designed to show the
complex rheological behavior of our sample method. These preliminary
simulations are conducted within a single micro-domain, whose
configuration is illustrated in @Fig:1 and detailed in
Table~@Tab:2. Within this specific AFBC micro-domain, which functions as
a rheometer, the prescribed pure shear and extensional deformation rates
in the $Omega'_(upright(b c))$ dictate the flow behavior. Subsequently,
the rheological response is measured using the IK stress tensor within
the $Omega'_(upright(c o r e))$. This methodology is based on the
approach developed by Moreno & Ellero (2021)~@Moreno2021, with detailed
implementation specifics for the current work provided in
Section~#link(<SM>)[SM1] in the #link(<SM>)[Supplementary Material]. For
further insights into the definition and measurement of planar
extensional viscosity, please refer to Section~#link(<SM>)[SM2] in the
#link(<SM>)[Supplementary Material].

== Rheological analysis melt: steady-state shear flow <subsec:steady_shear>
This section details the rheological characterization of the proposed
DPD/FENE model for polymer melts under steady shear flow. We
investigated melts with chain lengths ($N_(upright(d))$) of 4, 8, 16,
and 32 beads. The rheometer with AFBC in the micro-domain determines the
polymeric shear viscosity ($chevron.l eta'_(p \, s) chevron.r$) using
Eq.~(#link(<SM>)[S4]) (refer to the #link(<SM>)[Supplementary Material])
by varying the shear rate $dot(gamma)_(x y)$ and the resulting polymeric
$chevron.l bold(pi)'_p chevron.r$ obtained from IK (see
Section~#link(<SM>)[SM1] in the
#link(<SM>)[Supplementary Material])~@Moreno2021.

The non-Newtonian viscous behaviour of these melts is well described by
fitting the C-Y model to our simulation data. As illustrated in
@Fig:2_VirtualRheo\(a), DPD simulation data for viscosity at
various shear rates are fitted to this model, with optimized parameters
for each polymer chain length. The Carreau-Yasuda (C-Y) equation
(Eq.~@eq:Yasuda) describes this behavior, and its
fitted parameters are summarised in Table~@tab:yasuda_params. Further
details on the C-Y model and its parameters are provided in
@app:CY_details. The case with $N_(upright(d))$$= 4$ is included as a
reference point in our analysis. The DPD and FENE parameters used for
these microsystems are detailed in Table~@Tab:1.

As depicted in @Fig:2_VirtualRheo\(b), the polymer chains within
the $Omega'_(upright(c o r e))$ exhibit significant deformation and
alignment under a steady-state shear rate of $dot(gamma)_(x y)$=0.02.
This shear-induced anisotropy, particularly evident for longer chains
($N_(upright(d))$=32), contrasts sharply with the initial isotropic
configuration (@Fig:1\(b)) and highlights the pronounced impact of
the flow on the polymer microstructure.

#figure(image("source/VirtualRheo-eps-converted-to.pdf"),
  caption: [
    \(a) Carreau-Yasuda model validation for polymer melts under steady
    shear flow. Lines represent fitted viscosity using the
    Carreau-Yasuda model, and symbols correspond to DPD simulation data
    for various polymer chain lengths ($N_(upright(d))$). (b) Details of
    the distribution of bead-chains within the
    $Omega'_(upright(c o r e))$ regions for polymer melts with different
    $N_(upright(d)) = \[ 8 \; 16 \; 32 \]$ after reaching the shear rate
    steady-state of $dot(gamma)_(x y) = 0.02$. (c) Normal stress
    coefficients ($psi_1$) for polymers under steady shear flow. Lines
    represent fitted values based on the Carreau-Yasuda model, and
    symbols indicate DPD simulation data for different polymer chain
    lengths ($N_(upright(d))$). (d) Validation of relaxation time using
    constant shear rate for $N_(upright(d))$$= 8$ to
    $N_(upright(d))$$= 32$. The asymptotic values of $lambda$ were
    determined as the shear rate ($dot(gamma)_(x y) arrow.r 0$)
    approaches zero. (e) Relaxation Time ($lambda$) as a function of
    polymer chain length ($N_(upright(d))$). The fitted curve shows a
    power-law relationship $lambda tilde.op N_(upright(d))^1.90$,
    consistent with the Rouse model scaling @Goto2021@Murashima2011.
  ]
)
<Fig:2_VirtualRheo>

#figure(
  align(center)[#table(
    columns: 6,
    align: (center,center,center,center,center,center,),
    table.header([$N_(upright(d))$], [$eta_(upright("cy"))^0$], [$eta_(upright("cy"))^oo$], [$lambda$], [$a_(upright("cy"))$~], [$n_(upright("cy"))$],),
    table.hline(),
    [4~~], [13.20~~~~], [0~~~~~~~~~~~~], [23.50~~~~], [0.71], [0.60],
    [8~~], [34.29~~~~], [3.15~~~~~~~~~], [89.75~~~~], [0.95], [0.37],
    [16~], [173.18~~~], [4.45~~~~~~~~~], [353.48~~~], [0.55], [0.18],
    [32~], [242.83~~~], [4.81~~~~~~~~~], [1307.88~~], [1.23], [0.29],
  )]
  , caption: [Fitted Carreau--Yasuda parameters for different polymer
  chain lengths ($N_(upright(d))$). Here, $eta_(upright("cy"))^0$
  denotes the zero-shear viscosity, $eta_(upright("cy"))^oo$ the
  infinite-shear viscosity, $lambda$ the mean relaxation time,
  $a_(upright("cy"))$ the transition sharpness parameter, and
  $n_(upright("cy"))$ the power-law index.]
  , kind: table
  ) <tab:yasuda_params>

The viscometric characterization of the DPD/FENE simulations provides a
clear indication of the complex non-Newtonian response exhibited by the
microscopic polymer sample, which directly informs the macroscopic
model. The C-Y model offers an excellent quantitative description of the
simulation data, accurately capturing both the shear-thinning behavior
and the Newtonian plateaus across all polymer chain lengths investigated
(@Fig:2_VirtualRheo\(a)).

This microscale analysis is fundamental to the coupled LHMM framework,
as it supplies the macroscopic solver with key rheological parameters.
The zero-shear viscosity, $eta_(upright("cy"))^0$, obtained from the CY
fit (Table~@tab:yasuda_params), serves as the reference viscosity for
defining the viscosity ratio $beta$ (Eq.~@eq:beta),
where $eta' ""_p^0$$=$$eta_(upright("cy"))^0$. Additionally, this
analysis determines the characteristic relaxation time, $lambda$, which
plays a central role in defining the Weissenberg number (Wi) and,
consequently, in characterizing the viscoelastic response of the fluid
across different flow regimes. The same relaxation time also establishes
the scaling condition $lambda^(*) = 1$, ensuring consistent coupling
between micro- and macro-level dynamics.

=== Normal Stress Coefficients and Relaxation Time <normal-stress-coefficients-and-relaxation-time>
The first normal stress coefficient ($psi_1$) is a key parameter for
characterizing the elastic properties of viscoelastic fluids, such as
polymer melts @Fedosov2010@Litvinov2014. Its definition, the first
normal stress by the square of the applied shear rate, is detailed in
@app:NormalStressRelaxation.

@Fig:2_VirtualRheo\(c) illustrates the normal stress coefficients
($psi_1$) for polymers under steady shear flow. The symbols correspond
to the raw simulation data for various polymer chain lengths
($N_(upright(d))$), and the lines represent a fourth-degree polynomial
interpolation. These results exhibit trends similar to those reported in
previous work~@Fedosov2010@Padding2003. To further validate the
relaxation time obtained from the C-Y model, we examined the asymptotic
values of the $lambda$ as the $dot(gamma)_(x y)$ approaches zero. The
calculation of this asymptotic relaxation time, as discussed by
@Fedosov2010, is provided in~@app:NormalStressRelaxation.

@Fig:2_VirtualRheo\(d) illustrates the $lambda$, calculated
according to
Eq.~@eq:tau0_def_appendix as
$lambda = 0.5 psi_1 \/ eta' ""_p^0$. This figure highlights the
asymptotic behavior for polymer chain lengths ranging from
$N_(upright(d))$$= 8$ to $N_(upright(d))$$= 32$. The results exhibit a
strong correlation between the relaxation time $lambda$ predicted by the
C-Y model and $lambda \( dot(gamma)_(x y) arrow.r 0 \)$, thereby
reinforcing the consistency and reliability of our simulation data in
accurately depicting the viscoelastic behavior of polymer melts,
especially within the zero-shear plateau region.

These findings underscore the robustness of the IK approach for
capturing not only shear stress but also normal stresses, demonstrating
its reliability in describing the elastic properties of polymer melts,
with results consistent with those in @Fedosov2010@Padding2003. This
behavior is consistent with the predictions of the Carreau-Yasuda model.

Following the C-Y model analysis, we characterized the system's dynamics
by examining how the characteristic relaxation time, $lambda$, scales
with the polymer chain length, $N_(upright(d))$. These $lambda$ values
were obtained from the C-Y fits of our DPD simulation data
(@Fig:2_VirtualRheo\(a)) for
$N_(upright(d))$$= \[ 4 \; 8 \; 16 \; 32 \]$. As shown in
@Fig:2_VirtualRheo\(e), a power-law fit reveals that the relaxation
time increases with chain length following
$lambda tilde.op N_(upright(d))^b$. The fitted exponent $b = 1.90$ is in
close agreement with the theoretical prediction of the Rouse model
@Rouse1953, which predicts $lambda tilde.op N_(upright(d))^2$ for
unentangled chains @Kremer1990@Padding2002@Cohen-Addad1983. This scaling
confirms that our polymer chains behave as unentangled within the
simulated micro-domains.

The slight deviation of the fitted exponent ($b = 1.90$) from the
expected Rouse prediction of $2.0$ can be attributed to several factors.
One significant contributor is the finite chain length effects, as our
simulations are limited to relatively short chains ($N_(upright(d))$
ranging from 4 to 32 beads), which may display minor deviations from
ideal asymptotic scaling @Kalathi2015. Additionally, the use of soft DPD
potentials, while inherently accounting for some hydrodynamic
interactions, may induce slight correlations that could sightly alter
the ideal Rouse scaling @Groot1997b@Goto2021. Nevertheless, despite
these minor discrepancies, the observed scaling behavior clearly remains
consistent with the Rouse regime.

== Relaxation Behavior Characterization <subsec:relaxation>
To complement the steady-state rheological analysis, we conducted
recovery tests to characterize the viscoelastic behavior of the polymer
melts and to validate the characteristic relaxation time ($lambda$)
obtained from the C-Y model. These tests involved initially subjecting
the system to a constant shear rate
($dot(gamma)_(x y) approx 1 \/ lambda$) until it reached a steady state.
Subsequently, the external shear was abruptly removed, allowing the
system to relax towards equilibrium. The decay of the shear stress,
$chevron.l pi'_(p \, x y) chevron.r$ (the $x y$-component of
$chevron.l bold(pi)'_p chevron.r$), was monitored over time through the
relaxation modulus $G \( t \)$, defined as
$G \( t \) = chevron.l pi'_(p \, x y) \( t \) chevron.r \/ gamma_(x y)$,
where $chevron.l pi'_(p \, x y) chevron.r$$\( t \)$ is the shear stress
at time $t$ after the cessation of shear and $gamma_(x y)$ is the total
applied strain. Further details on the recovery test methodology and the
evolution of $G \( t \)$ are provided in Section~#link(<SM>)[SM3] in the
#link(<SM>)[Supplementary Material], including visual illustrations for
different chain lengths.

The recovery tests provide qualitative validation with sample's
properties calibrated from the C-Y model's predictions, demonstrating an
evident decay in shear stress after the external force is removed. This
behavior is consistent with the higher intrinsic viscosity and longer
characteristic relaxation time expected for longer polymer chains.

Further quantitative analysis of the linear viscoelastic behavior was
performed using spectral analysis, specifically the ILT and the GMM. The
methodologies for obtaining the storage modulus ($G'$) and loss modulus
($G''$) from these methods are detailed in Section~#link(<SM>)[SM4] in
the #link(<SM>)[Supplementary Material].

== Comparative Analysis of Viscoelastic Properties <subsubsec:comparative_analysis>
To provide a comprehensive characterization of the material's
viscoelastic properties, we perform a detailed comparative analysis of
the results obtained from three distinct approaches: GMM, ILT
(unsteady), and the C-Y model fit (steady). The key findings from these
methodologies are summarized in Table~@tab:rheology_results_en and
visually represented in @fig:complex_viscosity. The table and
figure include parameters from the C-Y viscosity fit, as implemented and
discussed in Section~@subsec:steady_shear.

#figure(
  align(center)[#table(
    columns: 12,
    align: (left,center,center,center,center,center,center,center,center,center,center,center,),
    table.header([$N_(upright(d))$], table.cell(align: center, colspan: 3)[GMM], table.cell(align: center, colspan: 3)[ILT], table.cell(align: center, colspan: 2)[C-Y
      Fit], [], [], [],),
    table.hline(),
    [2-4 (lr)5-7
    (lr)8-9], [$tau_2^(upright("GMM"))$], [$tau_3^(upright("GMM"))$], [Crossover
    Freq.], [$tau_1^(upright("Peak"))$], [$tau_2^(upright("Peak"))$], [Crossover
    Freq.], [$lambda$], [$1 \/ lambda$], [], [], [],
    [16], [63.9], [547.0], [0.00364], [40.3], [379.7], [0.00271], [353.48], [0.002829], [], [], [],
    [32], [168.4], [1331.4], [0.00126], [130.3], [1139.0], [0.000902], [1307.88], [0.000765], [], [], [],
  )]
  , caption: [Virtual Rheology Results for $N_(upright(d))$$= 16$ and
  $N_(upright(d))$$= 32$, showing parameters from GMM, ILT, and C-Y
  fitting. $tau_i^(upright("GMM"))$ represents the $i$-th relaxation
  time constant. $tau_j^(upright("Peak"))$ denotes the $j$-th peak
  relaxation time from the ILT relaxation spectrum, $H \( tau \)$ (See
  Section~#link(<SM>)[SM4] in the #link(<SM>)[Supplementary Material]).
  Crossover Freq. indicates the frequency where the storage and loss
  moduli are equal ($G'$=$G''$). $lambda$ is the characteristic
  relaxation time from the C-Y model.]
  , kind: table
  ) <tab:rheology_results_en>
#figure(image("source/dGddG_Cviscosity_N16-32-eps-converted-to.pdf", width: 80.0%),
  caption: [
    Comparison of viscoelastic properties for $N_(upright(d))$$= 16$ (a)
    and $N_(upright(d))$$= 32$ (b). (I) Storage modulus ($G'$) and loss
    modulus ($G''$) derived from GMM and ILT, normalized by their
    crossover point value $upright("G")_(upright("c"))$ ($G'$=$G''$).
    (II) Complex viscosity $eta' \( omega \)$ from GMM and ILT (See
    Section~#link(<SM>)[SM4] in the
    #link(<SM>)[Supplementary Material]), normalized by the maximum
    complex viscosity $eta'_(upright("max"))$. $1 \/ lambda$ is the
    inverse of the characteristic relaxation time from the C-Y model,
    represented in Panels (I) as a vertical line, and CP is the
    crossover point.
  ]
)
<fig:complex_viscosity>

Table~@tab:rheology_results_en and @fig:complex_viscosity
highlight a strong compatibility between the GMM and ILT
characterizations. For both samples, the relaxation times derived from
GMM ($tau_i^(upright("GMM"))$) and ILT ($tau_j^(upright("Peak"))$) show
a consistent shift towards slower processes as chain length increases.
While absolute values may differ, their relative magnitudes and trends
are remarkably consistent, a fact that is made more explicit in
@fig:complex_viscosity. Similarly, the crossover frequencies
(where $G' = G''$) consistently decrease for larger $N_(upright(d))$
values, reflecting the longer relaxation times.

A key finding is also the excellent agreement between the inverse of the
characteristic relaxation time from the C-Y fit ($1 \/ lambda$) and the
crossover frequency from the ILT analysis. This alignment reinforces the
physical relevance of the ILT-derived crossover frequency as a
characteristic relaxation rate of the material, consistent with
established empirical models @Yao2020.

Furthermore, both GMM and ILT accurately describe the complex viscosity
curves, particularly the identification of an apparent zero-shear
viscosity plateau at low frequencies and the subsequent shear-thinning
behavior at higher frequencies, as shown in @fig:complex_viscosity (a.II)-(b.II). The consistency observed across
these three distinct analysis (discrete GMM, continuous ILT, and C-Y
model fit) strengthens the confidence in our virtual rheological
characterization, confirming that our simulated systems exhibit
well-defined viscoelastic properties consistent with established
theoretical frameworks.

= Numerical Results: Macroscopic Flow <sec:macro_results>
This section presents the numerical results of the macroscopic flow
simulations, which validate the large-scale response and explore the
influence of microstructures within the LHMM framework. Three benchmark
cases are considered: RPF, a PAC, and flow through a RPM. These cases
are used to demonstrate the long-term memory effects of polymer
relaxation on stresses and flow dynamics, as well as to assess how
microstructural distribution and spacing affect both steady and
transient regimes. For RPF and PAC, we employ a $L_x times L_y$
($L_x$$=$$L_y$$=$4) box with periodic boundary conditions in both
directions. In comparison, the porous medium is simulated in a
$3 L_x times L_y$ box with the same boundary conditions.

In the RPF case, a sensitivity analysis with respect to the macroscale
resolution $Delta h$ (average SPH particle spacing) was performed to
determine the required number of micro-domains. As detailed in
Section~#link(<SM>)[SM6] in the #link(<SM>)[Supplementary Material], no
significant differences were observed in the macroscopic polymer,
solvent, or total stresses across the tested resolutions. Hence, a
resolution of $Delta h = 0.1$ was adopted for the RPF case and all
subsequent analyses.

== Reverse Poiseuille Flow (RPF) <subsec:rpf>
The RPF setup consists of two counter-flowing streams driven by a
uniform external body force, avoiding the use of solid walls and no-slip
boundary conditions @Fedosov2010@Backer2005. The simulation domain is
divided into two halves along the $y$-direction. In the upper half, a
constant force density $upright(bold(f)) = \( F \, 0 \, 0 \)$ is applied
in the $+ x$ direction, while in the lower half the same magnitude is
used in the opposite direction,
$upright(bold(f)) = \( - F \, 0 \, 0 \)$. Here, $F$ denotes the scalar
magnitude of the applied body force per unit mass. The theoretical shear
stress profile derived from momentum balance is:
$ tau_(x y) \( y \) = cases(delim: "{", F rho thin (L_y / 4 - y) \, & 0 lt.eq y < L_y \/ 2 \,, F rho thin (y - frac(3 L_y, 4)) \, & L_y \/ 2 lt.eq y lt.eq L_y \,) $<eq:RPF>
where $rho$ represents the fluid density and $L_y$ denotes the box
height. This stress field is exact, serving as a direct reference for
validating the simulated polymeric and total stresses. Normalization of
the stress is accomplished using the maximum theoretical shear stress
derived from the RPF analytical solution
(Eq.~@eq:RPF), given by
$tau_(upright(m a x))^(upright(R P F))$$= F rho L_y \/ 4$. Consequently,
the RPF case acts as a fundamental benchmark for evaluating the coupling
dynamics and relaxation behavior of polymer melts within the LHMM
framework.

For these simulations, the coupling time step was set to
$delta t$$= 0.32$, which corresponds to $k'$$= 64$ DPD micro-steps. The
SPH time step was $Delta macron(t)_(upright("SPH"))$$= 0.04$, with a
smoothing length of $Delta h$$= 0.1$, a fluid density of $rho$$= 1.0$
and a solvent viscosity of $eta_s$$= 0.02$. The Weissenberg number (Wi)
and Re were defined as $upright(W i) = frac(2 U_o lambda, L)$ and
$upright(R e) = frac(U_o L, 2 eta_(t o t)^0)$, respectively, where $U_o$
represents the characteristic average velocity,
$eta_(upright(t o t))^0$$=$$eta' ""_p^0$$+$$eta_s$ denotes the total
effective viscosity, and $L = L_y = 4$ indicates the height of the box.

=== Transient response of different polymer chains <subsub:RPF-N>
This section analyzes the transient response of the system for varying
monomer numbers ($N_(upright(d))$) of each chain in the RPF problem. We
utilize polymer microstructures characterized in Section
@subsec:steady_shear. A detailed summary of the simulated conditions,
including varying body forces ($F$), associated polymeric viscosity
fractions ($beta$), Reynolds numbers (Re), and Weissenberg numbers (Wi),
is provided in Tab.~@tab:rpf_conditions. @fig:Micro-Macro-RPF
presents both the spatial distribution and time evolution of key
microscopic and macroscopic variables for $F$$= 1.0 dot.op 10^(- 3)$ and
$alpha$$= 1.0 dot.op 10^(- 4)$. Sub-panel (a.I) shows the particle
distribution. The local viscosity is quantified through a local
Weissenberg number,
$upright("Wi")^(upright(l o c a l))$$= \( underline(underline(dot(bold(gamma)))) : underline(underline(dot(bold(gamma)))) \)^(1 \/ 2) lambda$,
where
$underline(underline(dot(bold(gamma))))$$= nabla bold(v) + nabla bold(v)^(sans(T))$,
representing the macroscopic velocity gradient ($nabla bold(v)_I$) on
each SPH particle $I$. Sub-panel (a.I) shows the particle distribution
and Sub-panel (a.II) displays the corresponding dimensionless polymeric
stress magnitude,
$macron(pi)_p^(*)$$=$$alpha$$\($$chevron.l bold(pi)'_p chevron.r$:$chevron.l bold(pi)'_p chevron.r$$\)^(1 \/ 2) \/$$tau_(upright(m a x))^(upright(R P F))$,
which is passed from the micro-domain to its associated macro-particle.
These sub-panels explicitly demonstrate the micro--macro coupling: how
the local shear rate from the macroscopic flow drives the evolution of
polymeric stress at the microscopic level, and how the microstructure
responds by aligning under the imposed deformation. Streamlines for five
representative particles further illustrate the trajectories and the
coherent interaction between the micro and macro scales at
$t = lambda \( N_(upright(d)) = 16 \)$.

#figure(
  align(center)[#table(
    columns: 10,
    align: (left,center,center,center,center,center,center,center,center,center,),
    table.header([$N_(upright(d))$], table.cell(align: center, colspan: 3)[\(a)
      $F$$= 1.8 dot.op 10^(- 4)$], table.cell(align: center, colspan: 3)[\(b)
      $F$$= 1.0 dot.op 10^(- 3)$], table.cell(align: center, colspan: 3)[\(c)
      $F$$= 1.0 dot.op 10^(- 2)$],),
    table.hline(),
    [2-4 (lr)5-7
    (lr)8-10], [$beta$], [Re], [Wi], [$beta$], [Re], [Wi], [$beta$], [Re], [Wi],
    [8], [0.15], [0.24], [0.13], [0.15], [1.3], [0.7], [0.77], [1.5], [4.15],
    [16], [0.46], [0.14], [0.45], [0.46], [0.83], [2.7], [0.94], [0.48], [15.35],
    [32], [0.55], [0.10], [1.52], [0.55], [0.69], [9.9], [0.96], [0.2], [53.43],
  )]
  , caption: [Set-up for various polymer chain lengths
  ($N_(upright(d))$) and body force ($F$) values in Reverse Poiseuille
  Flow, and the response of Weissenberg (Wi) and Re.]
  , kind: table
  ) <tab:rpf_conditions>
#figure(image("source/Micro-Macro-RPF-eps-converted-to.pdf", width: 70.0%),
  caption: [
    Micro--macro coupling in RPF for $F$$= 1.0 dot.op 10^(- 3)$ and
    $alpha$$= 1.0 dot.op 10^(- 4)$ with $N_(upright(d))$$= 16$
    ($beta$$= 0.46$, Re$= 0.83$, and Wi$= 2.7$). (a) Spatial
    distribution of key variables at $t = lambda \( 16 \)$. Sub-panel
    (a.I) shows the local Weissenberg number,
    $upright("Wi")^(upright(l o c a l))$$= \( underline(underline(dot(bold(gamma)))) : underline(underline(dot(bold(gamma)))) \)^(1 \/ 2) lambda$,
    and sub-panel (a.II) presents the dimensionless polymeric stress
    magnitude,
    $macron(pi)_p^(*)$$=$$alpha$$\($$chevron.l bold(pi)'_p chevron.r$:$chevron.l bold(pi)'_p chevron.r$$\)^(1 \/ 2) \/ tau_(upright(m a x))^(upright(R P F))$.
    Streamlines of five representative particles are overlaid in both
    panels to illustrate their trajectories. s(b) Micro-domain (polymer
    melt $Omega'_(upright(c o r e))$) distributions at
    $t \/ lambda \( 16 \) = 5.5$ for different chain lengths
    $N_(upright(d))$$= { 8 \, 16 \, 32 }$. Sub-panel (b.I) corresponds
    to the micro-domain linked to particle 5, while sub-panel (b.II)
    shows the one linked to particle 2. Both provide insight into the
    local polymeric structure, its dependence on chain length, and its
    deformation relative to the initial monomer distribution
    (@Fig:1\(b)). Videos showing the time evolution of the
    micro-domain deformation for each chain length are provided in the
    #link(<SM>)[SUPPLEMENTARY VIDEOS].
  ]
)
<fig:Micro-Macro-RPF>

@fig:Micro-Macro-RPF\(b) illustrates the conformational state of
the micro-domain (polymer melt) at a dimensionless time of
$t \/ lambda \( 16 \) = 5.5$ for various polymer chain lengths
($N_(upright(d))$=8,16,32). Sub-panels (b.I) and (b.II) depict the
microstructural configuration within the core region
($Omega'_(upright(c o r e))$) corresponding to two distinct material
points, particles 5 and 2, respectively. These snapshots reveal the
dependence of the polymer conformation on chain length, quantifying the
degree of deformation and alignment relative to the initial, isotropic
monomer distribution shown in @Fig:1\(b). Furthermore, the
#link(<SM>)[SUPPLEMENTARY VIDEOS] material visualizes the transient
evolution of the micro-domain, capturing the chain reorganization driven
by the macroscopic flow field. Collectively, these results offer a
direct representation of the dynamic micro-macro coupling, wherein the
local polymer structure continuously adapts to the imposed macroscopic
deformation.

@fig:VelocityVsTime-RPF illustrates the dynamic response of the
system, showing the time evolution of the dimensionless velocity
$v_x \/ U_o$ and the dimensionless total shear stress
$macron(pi)_(x y)^(*)$$= macron(pi)_(x y) \/ tau_(upright(m a x))^(upright(R P F))$,
where $macron(pi)_(x y)$ denotes the $x y$-component of the total stress
tensor $macron(bold(pi))$
(Eq.~@eq:Hydro_hybrid). Results are
reported for different body forces ($F$), weighting parameters
($alpha$), and chain lengths ($N_(upright(d))$), leading to differents
Re, Wi, and $beta$ numbers. Panels (a)--(c) correspond to distinct
$\( F \, alpha \)$ combinations. Sub-panels (I) provide a magnified view
of the velocity plateau, with vertical lines marking the relaxation
times $lambda \( N_(upright(d)) \)$. Sub-panels (II) and (III) show the
temporal evolution of velocity and shear stress, respectively, for
different $N_(upright(d))$. Overall, these results highlight the role of
chain length and micro--macro weighting in governing the relaxation
dynamics and transient response.

#figure(image("source/VelocityVsTime-eps-converted-to.pdf", width: 90.0%),
  caption: [
    Variation of $N_(upright(d))$$= { 8 \, 16 \, 32 }$ and their effects
    on the time evolution of the average velocity in the $x$-direction
    ($v_x$) and the shear stress of $macron(bold(pi))$, compared with
    Newtonian fluid reference simulations (SPH-only). (a) and (b) with
    $alpha = 1.0 dot.op 10^(- 4)$ and $beta = { 0.15 \, 0.46 \, 0.55 }$
    for $N_(upright(d)) = { 8 \, 16 \, 32 }$, and (c) with
    $alpha = 2.0 dot.op 10^(- 3)$ and $beta = { 0.77 \, 0.94 \, 0.96 }$
    for $N_(upright(d)) = { 8 \, 16 \, 32 }$. Results are shown for: (a)
    $F = 1.8 dot.op 10^(- 4)$ with
    $upright(W i) = { 0.13 \, 0.45 \, 1.52 }$. (b)
    $F = 1.0 dot.op 10^(- 3)$ with
    $upright(W i) = { 0.7 \, 2.7 \, 9.9 }$. (c)
    $F = 1.0 dot.op 10^(- 2)$ with
    $upright(W i) = { 4.15 \, 15.35 \, 53.43 }$. (I) Zoomed-in view of
    the velocity plateau, with vertical lines marking
    $lambda \( N_(upright(d)) \)$. (II) Velocity response over time for
    different $N_(upright(d))$. (III) Shear stress response over time,
    showing the dimensionless total shear stress
    $macron(pi)_(x y)^(*)$$= macron(pi)_(x y) \/ tau_(upright(m a x))^(upright(R P F))$.
  ]
)
<fig:VelocityVsTime-RPF>

The transient behavior is analyzed across three regimes. In
Figs.~@fig:VelocityVsTime-RPF\(a)--(b), the weighting parameter $alpha$
is fixed while the forcing $F$ is increased, probing a range of $beta$
and Wi as detailed in Tab.~@tab:rpf_conditions. A key feature in these
cases is the presence of overshoots in both velocity and stress before
the system reaches a steady state. In the low-Wi regime (panel a), the
overshoots are broad and subtle: the velocity peak (sub-panel II)
reflects the initial resistance of the polymer melt, followed by an
acceleration beyond the equilibrium point. The corresponding stress peak
(sub-panel III) is similarly modest. At larger Wi (panel b), the
response is faster: the overshoots become sharper but less pronounced
relative to the steady-state values.

@fig:VelocityVsTime-RPF\(c) examines a high-forcing scenario
($upright(W i)$ reaching up to 53.43), where the polymeric contribution
becomes predominant ($beta > 0.94$). In this case, the system markedly
deviates from the Newtonian reference: both velocity and stress exhibit
sharp transient peaks followed by damped overshoots. This indicates that
a substantial amount of elastic energy is stored in the polymer
microstructure and subsequently released, temporarily overshooting the
steady state. Despite these strong transients, the LHMM-based coupled
solver maintains stability and successfully reaches equilibrium. This
emphasizes the feasibility of operating under polymer-dominated
conditions within the micro-macro coupling. Furthermore, the time
required to reach steady state scales with the relaxation time of the
Carreau--Yasuda fit for each chain length $N_(upright(d))$, as shown in
panels (I). Specifically, longer chains yield longer relaxation times,
with the approach to equilibrium consistently following the magnitude of
$lambda \( N_(upright(d)) \)$.

=== Steady-state response for different polymer chains <subsub:RPF-N-steady>
Following the analysis of the transient response, we now examine the
steady-state profiles obtained from the coupled LHMM simulations. Steady
state is identified by monitoring both velocity and shear stress
profiles, and is considered reached once they display a constant
plateau, as shown in @fig:VelocityVsTime-RPF.

@fig:ShearStressN presents the average steady-state shear stress
profiles along the domain centerline ($x = L_x \/ 2$) for different body
forces ($F$), weighting parameters ($alpha$), and monomer numbers
($N_(upright(d)) = { 8 \, 16 \, 32 }$) effecting directly $beta$ and Wi,
following the configurations of @fig:VelocityVsTime-RPF and
Tab.~@tab:rpf_conditions. The decomposition is shown as: (I) the
microscopic polymeric contribution,
$macron(pi)_(p \, x y)^(*)$=$alpha$$chevron.l pi'_(p \, x y) chevron.r$/$tau_(upright(m a x))^(upright(R P F))$\;
(II) the macroscopic solvent contribution,
$macron(pi)_(upright("s") \, x y)^(*)$=$macron(pi)_(upright("s") \, x y)$/$tau_(upright(m a x))^(upright(R P F))$
(where $macron(pi)_(upright("s") \, x y)$ is the $x y$-component of the
solvent stress tensor $macron(bold(pi))_(upright(s))$); and (III) the
total shear stress, $macron(pi)_(x y)^(*)$. In all cases, the simulated
total stress accurately reproduces the linear analytical profile
$tau_(x y) \( y \)$ from Eq.~@eq:RPF, in agreement
with previous works~@Fedosov2010@NietoSimavilla2022@Backer2005. This
consistency check ensures that the LHMM framework correctly conserves
momentum.

The balance between polymeric and solvent contributions is clearly
illustrated in panels (I) and (II). Their distributions are directly
influenced by $beta$ and the chain length $N_(upright(d))$. Distortions
in the individual $macron(pi)_(p \, x y)^(*)$ and
$macron(pi)_(upright("s") \, x y)^(*)$ profiles are most evident in case
(a), due to lower forcing and $upright(W i) < 1.6$, and in case (c),
where higher forcing, polymer viscosity fraction $beta$, and Wi are
presented. In case (a), the polymeric stress contribution is minimal,
leaving the solvent stress to dominate and closely match the total
stress profile. In contrast, in case (c), the polymeric contribution
becomes dominant, causing the solvent stress profile to deform into a
complex shape that maintains the overall linear profile of the resulting
total stress (Panel III). These findings confirm that the coupling
scheme effectively captures the redistribution of stress between the
solvent and polymers. Additionally, Panel (I) illustrates that the
polymeric contribution increases with chain length $N_(upright(d))$. In
cases (a) and (b), distinct values of $beta$ result in clearly separated
stress curves for each $N_(upright(d))$. However, in case (c), where all
$beta$ values approach unity, the polymeric profiles nearly converge
into a single curve, suggesting similar contributions across different
$N_(upright(d))$.

#figure(image("source/ShearStressN-eps-converted-to.pdf", width: 80.0%),
  caption: [
    Average steady-state shear stress profiles for varying
    $N_(upright(d)) = { 8 \, 16 \, 32 }$. The figure shows the average
    dimensionless stress components profile at $y$ along the line
    $x = 2.0$. Contributions are shown for: (I) The dimensionless shear
    stress of the microscopic polymeric contribution
    ($chevron.l macron(pi)_p chevron.r_(x y)^(*)$), (II) the
    dimensionless shear stress of the macroscopic solvent
    ($macron(pi)_(upright("s") \, x y)^(*)$), and (III) total shear
    stress ($macron(pi)_(x y)^(*)$) compared to the shear stress imposed
    ($tau_(x y) \( y \)$/$tau_(upright(m a x))^(upright(R P F))$) with
    Eq.~@eq:RPF. (a) and (b) with
    $alpha = 1.0 dot.op 10^(- 4)$ and $beta = { 0.15 \, 0.46 \, 0.55 }$
    for $N_(upright(d)) = { 8 \, 16 \, 32 }$, and (c) with
    $alpha = 2.0 dot.op 10^(- 3)$ and $beta = { 0.77 \, 0.95 \, 0.97 }$
    for $N_(upright(d)) = { 8 \, 16 \, 32 }$. Results are shown for: (a)
    $F = 1.8 dot.op 10^(- 4)$ with
    $upright(W i) = { 0.13 \, 0.45 \, 1.52 }$. (b)
    $F = 1.0 dot.op 10^(- 3)$ with
    $upright(W i) = { 0.7 \, 2.7 \, 9.9 }$. (c)
    $F = 1.0 dot.op 10^(- 2)$ with
    $upright(W i) = { 4.15 \, 15.35 \, 53.43 }$. Futhermore, each plot
    also includes an instantaneous snapshot of the particle distribution
    at $t = 2000$, illustrating the stress field for the corresponding
    component and $N_(upright(d))$ (in panel (a), $N_(upright(d)) = 8$\;
    (b), $N_(upright(d)) = 16$\; (c), $N_(upright(d)) = 32$).
  ]
)
<fig:ShearStressN>

The instantaneous snapshots included in each subpanel of
@fig:ShearStressN provide additional spatial insight into the
steady-state stress field distributions at the particle level for
different monomer lengths ($N_(upright(d))$) at $t = 2000$
($t \/ lambda (N_(upright(d)) = 16) = 5.7$). These visualizations
confirm that the differences in $macron(pi)_(p \, x y)^(*)$ and
$macron(pi)_(upright("s") \, x y)^(*)$ intensity are primarily driven by
the $F$ and the ($N_(upright(d))$,$beta$), as discussed above.
Nonetheless, despite local deviations, the particle-level total stress
fields align well with the imposed averaged stress profiles, reinforcing
the consistency of the micro-to-macro coupling in the LHMM framework. \
\
Having established the redistribution of stresses between the
contributions of the solvent and the polymer, we now turn our attention
to how these characteristics are reflected in the corresponding velocity
profiles. @fig:VelosityN illustrates the average steady-state
velocity profiles for $N_(upright(d))$ values of 8, 16, and 32, all
under the same $F$ and ($alpha$, $beta$) configurations as presented in
@fig:ShearStressN. For reference, the simulated velocity profiles
are compared against the Newtonian parabolic solution for a pure solvent
(see @app:velocity) @Fedosov2010@Backer2005.

Figures~@fig:VelosityN\(a) and (b) demonstrate that the simulated
velocity aligns closely with the Newtonian parabolic reference
(Eq.~@eq:velocity), confirming that the coupled
LHMM system accurately reproduces the expected Newtonian-like flow under
conditions of weak to moderate polymeric effects. In contrast,
@fig:VelosityN\(c) reveals a noticeable flattening of the
velocity profile near the center of the channel (in low-shear regions),
which is consistent with the shear-thinning behavior observed in
previous SDPD and DPD
studies~@Litvinov2016@Litvinov2014@NietoSimavilla2022. This deviation
becomes increasingly pronounced with higher $N_(upright(d))$, since the
shear-thinning becomes stronger (@fig:VelosityN\(a)).

#figure(image("source/VelosityN-eps-converted-to.pdf", width: 80.0%),
  caption: [
    Average steady-state velocity profiles for varying
    $N_(upright(d)) = { 8 \, 16 \, 32 }$. The figure shows the average
    dimensionless velocity in the $x$-axis ($v_x \/ v_(upright(m a x))$)
    profile at $y$ along the line $x = 2.0$, and its comparison with the
    Newtonian parabolic result, where $v_(upright(m a x))$ is the
    maximum horizontal velocity in the average velocity profile and is
    compared with the parabolic velocity profile defined in
    Eq.~@eq:velocity. (a) and (b) with
    $alpha = 1.0 dot.op 10^(- 4)$ and $beta = { 0.15 \, 0.46 \, 0.55 }$
    for $N_(upright(d)) = { 8 \, 16 \, 32 }$, and (c) with
    $alpha = 2.0 dot.op 10^(- 3)$ and $beta = { 0.77 \, 0.95 \, 0.97 }$
    for $N_(upright(d)) = { 8 \, 16 \, 32 }$. Results are shown for: (a)
    $F = 1.8 dot.op 10^(- 4)$ with
    $upright(W i) = { 0.13 \, 0.45 \, 1.52 }$. (b)
    $F = 1.0 dot.op 10^(- 3)$ with
    $upright(W i) = { 0.7 \, 2.7 \, 9.9 }$. (c)
    $F = 1.0 dot.op 10^(- 2)$ with
    $upright(W i) = { 4.15 \, 15.35 \, 53.43 }$. Each plot also includes
    an instantaneous snapshot of the velocity particle distribution at
    $t = 2000$ (in panel (a), $N_(upright(d)) = 8$\; (b),
    $N_(upright(d)) = 16$\; (c), $N_(upright(d)) = 32$).
  ]
)
<fig:VelosityN>

The zoomed-in views (detailed in $y = \[ 0.5 \; 0.75 \]$) in
@fig:VelosityN further highlight the alignment with the Newtonian
parabolic shape profile observed in cases (a) and (b), while also
illustrating the systematic deviation noted in case (c). Additionally,
the instantaneous snapshots presented in each subpanel of
@fig:VelosityN showcase the $v_x$ field distributions at the
particle level for varying monomer lengths ($N_(upright(d))$) at
$t = 2000$ ($t \/ lambda (N_(upright(d)) = 16) = 5.7$). These snapshots
reinforce the finding that the alignment of particle-level field
distributions continues to mirror the averaged velocity profiles $v_x$
across different configurations, thereby enhancing the robustness of the
LHMM coupling and supporting the conclusions derived from the stress
field analysis (@fig:ShearStressN).

In this section, we briefly evaluate the impact of the weighting
parameters over polymeric viscosity fraction ($alpha arrow.r$$beta$),
which regulate the relative contributions of polymeric and solvent
stresses within the coupled momentum balance. To explore their influence
under moderate and high forcing, we conducted a series of additional
simulations at $N_(upright(d)) = 16$, covering a range of Weissenberg
numbers ($upright("Wi") tilde.op cal(O) \( 1 - 10 \)$). The findings
indicate that increasing $alpha$ (and correspondingly increase $beta$)
amplifies the polymer contribution, resulting in prolonged stress
overshoots and a slower relaxation process during the transient phase.
In the steady state, the velocity profiles exhibit a noticeable
flattening, which aligns with shear-thinning behavior. Notably, the
balance between polymeric and solvent stresses remains stable across the
various Weissenberg numbers investigated, demonstrating the robustness
of the coupling scheme against variations in $\( alpha \, beta \)$. A
comprehensive examination of these effects, including insights into
transient dynamics and systematic comparisons under different forcing
conditions, can be found in Section~#link(<SM>)[SM7] in the
#link(<SM>)[Supplementary Material].

== Complex flow through a Periodic Array of Cylinders (PAC) <complexflow>
We now analyze flow through a PAC, which is designed to investigate
fluid--structure interactions and complex flow with curved streamlines.
For systems with finite memory, the loss of space invariance renders the
actual Lagrangian dynamics transient, even when the fluid appears steady
in an Eulerian frame. This setup introduces a stationary obstacle into
the flow path, creating heterogeneous flow fields relevant in confined
and porous media~@Morii2021@King2021@Datta2022. The configuration
features a single cylinder with a radius of $R_(c l)$$= 0.56$,
positioned at the center of a box defined by
$\[ L_x \/ 2 \, L_y \/ 2 \]$ ($L_x$=$L_y$=4), with periodic boundary
conditions applied in both directions. An external body force
$upright(bold(f))$ is defined as $upright(bold(f))$$= \[ F \, 0 \]$. For
the LHMM simulations, the exchange time step is set at
$delta t$=$0.125$, with a microscale exchange interval of $k'$$= 25$.
The polymer chain length is fixed to $N_(upright(d))$$= 16$, and the
solvent viscosity is $eta_s$$= 0.08$. This arrangement enables us to
investigate the impact of the cylindrical obstacle and the resulting
complex flow patterns (e.g., extensional flow around the cylinder, shear
flow in the gaps) on the polymeric chains.

We examine how the polymer's rheological response affects overall flow
resistance and velocity profiles. Key simulation parameters for the PAC
flow include the Weissenberg number
($upright(W i) = U_o lambda \/ R_(c l)$), the Reynolds number
($upright(R e) = R_(c l) U_o rho \/$$eta_(upright(t o t))^0$), and the
coupling parameters ($beta$).

To illustrate the complex interaction between microscopic polymer
dynamics and macroscopic flow behavior in a PAC configuration,
@fig:Micro-Macro-PAC provides a comprehensive view of the
micro--macro coupling. It depicts the spatial distribution of particles
and the temporal evolution of critical microscopic and macroscopic
variables associated with flow dynamics, as well as the resulting
macroscopic response. The figure also examines how the conformation of
polymer micro-domains corresponds to the microstructure's response to
stress. Results are shown for $Delta h$$= 1 \/ 25$,
$Delta macron(t)_(upright("SPH"))$$= 1.25 dot.op 10^(- 3)$,
$F$$= 1.0 dot.op 10^(- 3)$, $beta = 0.46$ (corresponding to
$alpha = 4.0 dot.op 10^(- 4)$), with resulting average steady
$upright(W i) = 5.2$ and Re$= 0.032$.

#figure(image("source/Micro-Macro-PAC-eps-converted-to.pdf", width: 98.0%),
  caption: [
    Micro--macro coupling in PAC flow for $d h = 1 \/ 25$,
    $Delta t_(S P H) = 1.25 dot.op 10^(- 3)$, $F = 1.0 dot.op 10^(- 3)$,
    $beta = 0.46$ (corresponding to $alpha = 4.0 dot.op 10^(- 4)$ and
    $N_(upright(d)) = 16$), with resulting $upright(W i) = 5.2$ and
    $R e = 0.032$. Spatial distribution of micro--macro variables at an
    early transient state ($t = lambda \/ 4$). Sub-panel (a) shows the
    local Weissenberg number,
    $upright("Wi")^(upright(l o c a l))$$= \($$underline(underline(dot(bold(gamma))))$$:$$underline(underline(dot(bold(gamma))))$$\)^(1 \/ 2) lambda$,
    and (b) the dimensionless magnitude of the polymeric stress,
    $macron(pi)_p^(*)$$=$$alpha$$\($$chevron.l bold(pi)'_p chevron.r$:$chevron.l bold(pi)'_p chevron.r$$\)^(1 \/ 2) \/$$tau_(upright(P A C))^(*)$.
    In both, streamlines for five representative particles are
    delineated to illustrate their local trajectories. (c) Microdomain
    (polymer melt) distributions at $t = lambda \/ 4$ showing the
    spatial organization of polymer chains (colored by each chain's
    beads) for selected micro-domains. These panels illustrate the
    micro-domains linked to particles 1, 2, 4, and 5, providing further
    insight into the local polymeric structure and its response within
    different flow regions around the cylinder. Videos showing the time
    evolution of the micro-domain deformation for each chain length are
    provided in the #link(<SM>)[SUPPLEMENTARY VIDEOS] (See panels (c)).
  ]
)
<fig:Micro-Macro-PAC>

Sub-panels (a.I) and (a.II) in @fig:Micro-Macro-PAC display the
particle distributions alongside the local Weissenberg number, defined
as
$upright("Wi")^(upright(l o c a l))$$= \($$underline(underline(dot(bold(gamma))))$$:$$underline(underline(dot(bold(gamma))))$$\)^(1 \/ 2) lambda$,
and the dimensionless magnitude of the polymeric stress,
$macron(pi)_p^(*)$$=$$alpha$$\($$chevron.l bold(pi)'_p chevron.r$:$chevron.l bold(pi)'_p chevron.r$$\)^(1 \/ 2) \/$$tau_(upright(P A C))^(*)$
(where
$tau_(upright(P A C))^(*)$$=$$U_o$$eta_(upright(t o t))^0$$\/$$R_(c l)$
and $U_o$ represents the average steady velocity), respectively. Both
sub-panels illustrate the interplay at $t = lambda \/ 4$ between the
shear rate and the polymeric stress. Streamlines for five representative
particles highlight their nearly straight trajectories in this PAC case,
indicating a transient state before significant deformation near the
cylinder.

@fig:Micro-Macro-PAC\(b) shows the temporal evolution of
micro--macro variables for the five representative particles highlighted
in panel (a). Sub-panels (b.I) and (b.II) display the local shear rate
and the dimensionless polymeric stress magnitude, respectively, over one
characteristic period $lambda$. These results demonstrate the strong
correlation between stress and shear rate along particle trajectories,
which, unlike the nearly straight paths in the RPF case, are highly
sensitive to the initial particle position in the PAC flow due to the
presence of the obstacle.

The corresponding micro-domains at $t = lambda \/ 4$ for particles 1, 2,
4, and 5 are shown in @fig:Micro-Macro-PAC\(c), with detailed views
of the core region ($Omega'_(upright(c o r e))$) for each micro-domain
associated with its respective particle. These snapshots illustrate how
local chain stretching, alignment, and deformation vary with the
particle trajectory, establishing a clear connection between
microstructural evolution and the heterogeneous flow field traced by the
streamlines. The #link(<SM>)[SUPPLEMENTARY VIDEOS] material provides a
direct visualization of these transient Lagrangian dynamics, documenting
the continuous evolution of the micro-domain conformation as material
points traverse the heterogeneous flow field. This visualization
reinforces the concept that even in a macroscopically steady flow
(Eulerian frame), the polymer microstructure undergoes a
history-dependent, non-stationary deformation process (Lagrangian
frame). These videos thus animate and extend the static microstructural
snapshots presented in @fig:Micro-Macro-PAC\(c).

=== Resolution Analysis <subsub:Reso>
In the PAC case involving a single cylinder, we evaluate
the sensitivity of the average macro--particle spacing ($Delta h$) with
respect to the total number of particles in the domain, given by
($L_x$/$Delta h$)$times$\($L_y$/$Delta h$). The body force is fixed at
$F$$= 1.0 dot.op 10^(- 3)$, and two coupling-viscosity ratios are
considered: $beta = 0.46$ and $beta = 0.65$. We investigate three
spatial resolutions: $Delta h = 1 \/ 16$ ($64 times 64$ particles),
$Delta h = 1 \/ 20$ ($80 times 80$ particles), and $Delta h = 1 \/ 25$
($100 times 100$ particles). The corresponding exchange intervals for
the macroscale solver ($macron(M)$) are set to $50$, $100$, and $200$ to
determine $Delta macron(t)_(upright("SPH"))$.

#figure(image("source/Stress-Comparisonb46-eps-converted-to.pdf", width: 95.0%),
  caption: [
    Flow/stress field during initial transient at $t = lambda \/ 2$ for
    $beta = 0.46$ with resulting $upright(W i) = 5.2$ and $R e = 0.032$,
    showing particle distribution of local Wi number,
    $upright("Wi")^(upright(l o c a l))$ (leftmost panel), the
    dimensionless stress magnitude of the polymeric stress,
    $macron(pi)_p^(*)$, the solvent, $macron(pi)_(upright(s))^(*)$, and
    the total, $macron(pi)^(*)$ (rightmost Panel). Panels correspond to
    different spatial resolutions: (a) $Delta h = 1 \/ 16$ (`64x64`
    particles), (b) $Delta h = 1 \/ 20$ (`80x80` particles), and (c)
    $Delta h = 1 \/ 25$ (`100x100` particles).
  ]
)
<fig:B46IK>

Building on the transient analysis shown in @fig:Micro-Macro-PAC,
Figures~@fig:B46IK and @fig:B65IK illustrate the particle-level
distributions during the initial transient $t = lambda \/ 2$ for
$beta = 0.46$ and $beta = 0.65$, respectively. Each figure displays four
dimensionless quantities: the local Weissenberg number,
$upright("Wi")^(upright(l o c a l))$$= \($$underline(underline(dot(bold(gamma))))$$:$$underline(underline(dot(bold(gamma))))$$\)^(1 \/ 2) \/$$lambda$\;
the normalized polymeric stress,
$macron(pi)_p^(*)$$=$$alpha$$\($$chevron.l bold(pi)'_p chevron.r$$:$$chevron.l bold(pi)'_p chevron.r$$\)^(1 \/ 2) \/$$tau_(upright(P A C))^(*)$\;
the solvent stress,
$macron(pi)_(upright("s"))^(*)$$= \($$macron(bold(pi))_(upright(s))$$:$$macron(bold(pi))_(upright(s))$$\)^(1 \/ 2) \/$$tau_(upright(P A C))^(*)$\;
and the total stress,
$macron(pi)^(*)$$= \($$macron(bold(pi))$$:$$macron(bold(pi))$$\)^(1 \/ 2) \/$$tau_(upright(P A C))^(*)$.
As expected, increasing the resolution (down to $Delta h = 1 \/ 25$)
yields more clearly resolved flow structures, especially in the
polymeric stress field. Nonetheless, the three resolutions exhibit
consistent results in both the order of magnitude and the spatial
distribution of shear rate and stress components. This consistency
indicates that the LHMM coupling provides adequate accuracy across
different discretizations. The findings hold for both parameter sets:
$upright(W i) = 5.2$ with $R e = 0.032$ and $beta = 0.46$
(@fig:B46IK), and $upright(W i) = 4.5$ with $R e = 0.018$ and
$beta = 0.65$ (@fig:B65IK).

#figure(image("source/Stress-Comparisonb65-eps-converted-to.pdf", width: 95.0%),
  caption: [
    Flow/stress field during initial transient at $t = lambda \/ 2$ for
    $beta = 0.65$ with resulting $upright(W i) = 4.5$ and $R e = 0.018$,
    showing particle distribution of local Wi number,
    $upright(W i)^(upright(l o c a l))$ (leftmost panel), the
    dimensionless stress magnitude of the polymeric stress,
    $chevron.l macron(pi)_p^(*) chevron.r$, the solvent,
    $macron(pi)_(upright(s))^(*)$, and the total, $macron(pi)^(*)$
    (rightmost Panel). Panels correspond to different spatial
    resolutions: (a) $Delta h = 1 \/ 16$ (`64x64` particles), (b)
    $Delta h = 1 \/ 20$ (`80x80` particles), and (c) $Delta h = 1 \/ 25$
    (`100x100` particles).
  ]
)
<fig:B65IK>

To assess the impact of numerical parameters on transient flow dynamics,
@fig:1Reso illustrates the temporal evolution of average velocity
along the x-axis ($v_x$) and stress magnitudes ($macron(pi)_(x y)$ and
$N_1$) for three different spatial resolutions ($Delta h$) at two
different $beta$ values: $0.46$ (Panel (a)) and $0.65$ (Panel (b)). This
analysis focuses on the shear stress component $macron(pi)_(x y)$ and
the first normal stress difference, defined as $N_1$ =
$macron(pi)_(x x)$$-$$macron(pi)_(y y)$ (where $macron(pi)_(x x)$and
$macron(pi)_(y y)$ are the components $- x x$ and $- y y$ of the tensor
$macron(bold(pi))$, respectively), both of which are presented in
dimensionless form in @fig:1Reso.

#figure(image("source/ResolutionVstime-eps-converted-to.pdf", width: 100.0%),
  caption: [
    The effect of the resolution $Delta h$ and $beta$ on the temporal
    evolution of the following parameters is examined: the dimensionless
    magnitude of the x-component of velocity
    $(v_x^(*) = parallel v_x parallel \/ U_o)$ (leftmost Panel), the
    total shear stress
    $(macron(pi)_(x y)^(*) = parallel macron(pi)_(x y) parallel \/ tau_(upright("PAC"))^(*))$,
    and the total normal stress
    $(N_1^(*) = parallel N_1 parallel \/ tau_(upright("PAC"))^(*))$
    (rightmost panel). Panel (a) shows results for $beta = 0.46$, Wi =
    5.2, and Re = 0.032, while panel (b) displays results for
    $beta = 0.65$, $upright("Wi") = 4.5$, and $upright("Re") = 0.018$.
    Here, $U_o$ is the magnitude of the total average velocity, and
    $tau_(upright(P A C))^(*)$$=$$U_o$$eta_(upright(t o t))^0$$\/$$R_(c l)$
    is the dimensionless Stress parameter.
  ]
)
<fig:1Reso>

In Panel (a) ($beta = 0.46$) in @fig:1Reso, we observe behavior
consistent with long-term relaxation effects around one characteristic
period of $t = lambda$ compared with the case with Newtonian SPH. This
is marked by a small peak in $∥v_x∥$ followed by rapid damping to an
apparent equilibrium steady state, where both stress and velocity evolve
constantly. When compared to Panel (b) ($beta = 0.65$), the velocity
peaks are less pronounced in Panel (a), whereas the peaks in Panel (b)
are much clearer, and the damping recovery to reach steady state takes
more time. A similar trend is observed for the first normal stress
difference, $N_1$, while for $macron(pi)_(x y)$, a constant and steady
state emerges abruptly. Notably, the various cases of $Delta h$ produce
remarkably similar results, with minimal variation evident in
@fig:1Reso. This indicates that the resolution has a negligible
impact as the simulated transient dynamics within this range of
$Delta h$ and $beta$.

In addition to the transient analysis, Figures~@fig:B46SS and @fig:B65SS
depict the steady-state spatial distributions of these magnitudes at
various resolutions. Specifically, we present the spatial distributions
of the dimensionless magnitudes of $v_x^(*)$,
$v_y^(*)$, $macron(pi)_(x y)^(*)$, and
$macron(N)_1^(*)$ for the three $Delta h$ cases within the
PAC problem.

#figure(image("source/B46-Resolution-eps-converted-to.pdf", width: 90.0%),
  caption: [
    Spatial distribution of the fields for different resolutions at
    steady-state for Wi = 5.2, Re = 0.032, and $beta = 0.46$. The panels
    display the dimensionless magnitude of the x-component of velocity
    ($v_x^(*)$$= parallel v_x parallel \/ U_o$, leftmost
    panel), the y-component of velocity
    ($v_y^(*)$$= parallel v_y parallel \/ U_o$), the total
    shear stress
    ($macron(pi)_(x y)^(*)$$= parallel macron(pi)_(x y) parallel \/ tau_(upright("PAC"))^(*)$),
    and the total normal stress
    ($macron(N)_1^(*)$$= parallel N_1 parallel \/ tau_(upright("PAC"))^(*)$,
    rightmost panel). Results are computed with different spatial
    resolutions: (a) `64x64` particles ($Delta h$$= 1 \/ 16$), (b)
    `80x80` particles ($Delta h$$= 1 \/ 20$), and (c) `100x100`
    particles ($Delta h$$= 1 \/ 25$). Here, $U_o$ is the magnitude of
    the total average velocity, and
    $tau_(upright(P A C))^(*)$$=$$U_o$$eta_(upright(t o t))^0$$\/$$R_(c l)$
    is the dimensionless Stress parameter.
  ]
)
<fig:B46SS>

In line with the transient analyses, the steady-state distributions for
both $beta$ values (Figures~@fig:B46SS and @fig:B65SS) reveal consistent
trends across resolutions. The profiles of $v_x^(*)$,
$v_y^(*)$, $macron(pi)_(x y)^(*)$, and
$macron(N)_1^(*)$ exhibit comparable magnitudes and spatial
patterns, with only minor differences in sharpness between $Delta h$
cases. A notable feature is the asymmetric peak in $N_1$ downstream of
the cylinder, coinciding with the thin sheet of polymeric stress
($macron(pi)_p^(*)$) wrapping around the cylinder and advected along the
channel centerline (see Figures~@fig:B46IK and @fig:B65IK), a marker of
steady viscoelastic behavior and the aasociated fluid memory. This peak
appears smoother at the finest resolution ($Delta h = 1 \/ 25$), while
the coarser case ($Delta h = 1 \/ 16$) produces a more pronounced
intensity.

#figure(image("source/B65-Resolution-eps-converted-to.pdf", width: 90.0%),
  caption: [
    Spatial distribution of the fields for different resolutions at
    steady-state for Wi = 4.5, Re = 0.032, and $beta = 0.65$. The panels
    display the dimensionless magnitude of the x-component of velocity
    ($v_x^(*)$$= parallel v_x parallel \/ U_o$, leftmost
    panel), the y-component of velocity
    ($v_y^(*)$$= parallel v_y parallel \/ U_o$), the total
    shear stress
    ($macron(pi)_(x y)^(*)$$= parallel macron(pi)_(x y) parallel \/ tau_(upright("PAC"))^(*)$),
    and the total normal stress
    ($macron(N)_1^(*)$$= parallel N_1 parallel \/ tau_(upright("PAC"))^(*)$,
    rightmost panel). Results are computed with different spatial
    resolutions: (a) `64x64` particles ($Delta h$$= 1 \/ 16$), (b)
    `80x80` particles ($Delta h$$= 1 \/ 20$), and (c) `100x100`
    particles ($Delta h$$= 1 \/ 25$). Here, $U_o$ is the magnitude of
    the total average velocity, and
    $tau_(upright(P A C))^(*)$$=$$U_o$$eta_(upright(t o t))^0$$\/$$R_(c l)$
    is the dimensionless Stress parameter.
  ]
)
<fig:B65SS>

@fig:errors provides additional insights into numerical
convergence. Panels (a.I) and (a.II) show the normalized L1 and L2
errors of $v_x^(*)$, $v_y^(*)$,
$parallel$$macron(pi)_(x y)^(*)$$parallel$, and
$macron(N)_1^(*)$ relative to the `100x100` reference for
$beta = 0.46$ and $beta = 0.65$, respectively. In both cases, the L1 and
L2 errors are closely correlated and consistently decrease with finer
resolution, particularly when comparing the `64x64` and `80x80` cases
against the reference. The precise definitions and tabulated values of
these error metrics are provided in Section~#link(<SM>)[SM8] in the
#link(<SM>)[Supplementary Material].

#figure(image("source/L1-2-eps-converted-to.pdf", width: 85.0%),
  caption: [
    L1 and L2 errors for $v_x$, $v_y$,
    $parallel macron(pi)_(x y) parallel$, and $parallel N_1 parallel$
    relative to the `100x100` particles ($Delta h = 1 \/ 25$) reference
    case with (a.I) $beta = 0.46$, and (a.II) $beta = 0.65$.
  ]
)
<fig:errors>

=== Different Wi number regimes <different-wi-number-regimes>
To investigate a wider range of Wi numbers, we systematically varied the
body force $F$ with values of
$[1.25 dot.op 10^(- 4) \; 2.5 dot.op 10^(- 4) \; 3.5 dot.op 10^(- 4) \; 2.0 dot.op 10^(- 3) \; 3.5 dot.op 10^(- 3) \; 5.0 dot.op 10^(- 2)]$,
while maintaining a fixed polymer viscosity ratio of $beta$ = 0.65, a
resolution of $Delta h$ = 1/16 (using `64x64` particles), and a
parameter $macron(M)$ = 50. This approach resulted in Wi numbers ranging
from $\[ 0.48 \; 1.14 \; 2.2 \; 10.0 \; 18.1 \; 26.4 \]$, allowing us to
examine a broad spectrum of regimes and their impact on transient flow
dynamics. @fig:1Low-Mod illustrates the temporal evolution of the
dimensionless velocity component ($v_x^(*)$), the total shear
stress ($macron(pi)_(x y)^(*)$), and the total first normal stress
difference ($macron(N)_1^(*)$).

In the low-Wi regime panel (a) (@fig:1Low-Mod), the system exhibits
long relaxation times ($tilde.op 2 lambda$), visible as an overshoot in
$parallel v_x parallel$ followed by gradual damping towards steady
state. This trend is more pronounced and slower at Wi=0.48, where both
$macron(pi)_(x y)$ and $N_1$ display smoother but delayed relaxation
compared with higher-Wi cases.

#figure(image("source/ModLowPiTauVstime-eps-converted-to.pdf", width: 100.0%),
  caption: [
    Temporal evolution of fields for varying Wi, achieved by adjusting
    the body force $F$. For each Panel (a) and (b), the results display,
    from left to right: The panels display the dimensionless magnitude
    of the x-component of velocity
    ($v_x^(*)$$= parallel v_x parallel \/ U_o$, leftmost
    panel), the total shear stress
    ($macron(pi)_(x y)^(*)$$= parallel macron(pi)_(x y) parallel \/ tau_(upright("PAC"))^(*)$),
    and the total normal stress
    ($macron(N)_1^(*)$$= parallel N_1 parallel \/ tau_(upright("PAC"))^(*)$,
    rightmost panel). Panel (a) shows results for low Wi numbers:
    Wi=0.48 (Re=0.002, $F = 1.25 dot.op 10^(- 4)$), Wi=1.14 (Re=0.004,
    $F = 2.5 dot.op 10^(- 4)$), and Wi=2.2 (Re=0.009,
    $F = 3.5 dot.op 10^(- 4)$). Panel (b) shows results for moderate Wi
    numbers: Wi=10.0 (Re=0.04, $F = 2.0 dot.op 10^(- 3)$), Wi=18.1
    (Re=0.07, $F = 3.5 dot.op 10^(- 3)$), and Wi=26.4 (Re=0.1,
    $F = 5.0 dot.op 10^(- 2)$). Here, $U_o$ is the magnitude of the
    total average velocity, and
    $tau_(upright(P A C))^(*)$$=$$U_o$$eta_(upright(t o t))^0$$\/$$R_(c l)$
    is the dimensionless Stress parameter.
  ]
)
<fig:1Low-Mod>

By contrast, at moderate Wi panles (b)(@fig:1Low-Mod), the
overshoot peaks are sharper and the relaxation to equilibrium requires
longer times. Here, both $N_1$ and $macron(pi)_(x y)$ stabilize into
well-defined steady values, reflecting a reduced impact of transient
microstructural dynamics. These differences emphasize how the imposed
body force (and resulting Wi) strongly modulates the transient response
within the LHMM framework.

We next examine the corresponding steady-state spatial distributions,
shown in @fig:LowSS. Across the tested Wi, the shear stress
fields remain consistent in shape and magnitude. At the same time, $N_1$
displays a peak downstream of the cylinder, forming a sheet-like region
of elevated polymeric stress advected along the centerline. This
feature, associated with extensional-rate, becomes sharper with
increasing Wi. At very low Wi (e.g., 0.48), the peak is broader and less
intense, whereas moderate-Wi cases yield more localized and intense
structures.

#figure(image("source/totWiVsDistibution-eps-converted-to.pdf", width: 90.0%),
  caption: [
    Spatial distribution of fields at steady-state for three low Wi,
    obtained by varying the body force $F$. The panels display, from
    left to right: the total shear stress
    ($macron(pi)_(x y)^(*)$$= parallel macron(pi)_(x y) parallel \/ tau_(upright("PAC"))^(*)$),
    and the total normal stress
    ($macron(N)_1^(*)$$= parallel N_1 parallel \/ tau_(upright("PAC"))^(*)$.
    Panels correspond to: (a) Wi=0.48 (Re=0.002,
    $F = 1.25 dot.op 10^(- 4)$), (b) Wi=1.14 (Re=0.004,
    $F = 2.5 dot.op 10^(- 4)$), (c) Wi=2.2 (Re=0.009,
    $F = 3.5 dot.op 10^(- 4)$), (d) Wi=10.0 (Re=0.04,
    $F = 2.0 dot.op 10^(- 3)$), (e) Wi=18.1 (Re=0.07,
    $F = 3.5 dot.op 10^(- 3)$), and (f) Wi=26.4 (Re=0.1,
    $F = 5.0 dot.op 10^(- 2)$). Here,
    $tau_(upright(P A C))^(*)$$=$$U_o$$eta_(upright(t o t))^0$$\/$$R_(c l)$
    is the dimensionless Stress parameter.
  ]
)
<fig:LowSS>

Consequently, we observe that fluctuations are more prominent in the
low-Wi fields shown in Panels (a)-(c), particularly in areas distant
from the cylinder where shear rates are low. In contrast, their impact
diminishes in the higher Wi panels (d)-(f). Despite these local
variations, the overall similarity of profiles across different regimes
underscores the consistency of the numerical scheme in accurately
capturing steady-state flow characteristics. In summary, both the low-
and moderate-Wi regimes display consistent steady-state stress and
velocity distributions, with variations primarily in intensity (micro
and macro coupling) and relaxation time dynamics. This evidence supports
the notion that the chosen resolution and parameter configuration are
sufficient for capturing essential flow features across a wide range of
Wi.

== Random porous media (RPM) <subsec:porous_media>
Simulating fluid flow through porous media serves as a rigorous test for
our coupled micro-macro framework, as it integrates geometric complexity
with significant viscoelastic effects. In our model of a porous medium,
we utilize a rectangular domain with a length in the x-direction that is
three times that of the y-direction ($L_x = 3 L_y$). This domain
contains 17 non-uniformly distributed cylindrical solid obstacles,
yielding a porosity of $phi.alt = 0.792$ (see @fig:Porous_Setup).
For detailed information on the coordinates and radii of the obstacles,
please refer to Table~#link(<SM>)[S3], which is discussed in
Section~#link(<SM>)[SM9] in the #link(<SM>)[Supplementary Material]. The
Weissenberg number is defined as Wi =
$U_o$$lambda$$\/$$R_(upright(o b s t a c l e s))$, where $U_o$
represents the time-averaged velocity and
$R_(upright(o b s t a c l e s))$ denotes the mean solid obstacle radius
(0.425). The system is characterized by a chain length of
$N_(upright(d))$ = 16, a spatial resolution of $Delta h$ = 1/16, and
coupling parameters $delta t$ = 0.125 and $macron(M)$ =
50($Delta macron(t)_(upright("SPH"))$$= 2.5 dot.op 10^(- 3)$).

#figure(image("source/Porous_Setup-eps-converted-to.pdf", width: 70.0%),
  caption: [
    The schematic setup of the 17 cylindrical solid obstacles that
    define the porous medium geometry (positions and radii), as detailed
    in Table~#link(<SM>)[S3]. The rectangular domain is defined by
    dimensions $L_x = 3 L_y$ and $L_y = 4$, with the origin
    $\( 0 \, 0 \)$ located at the bottom-left corner of the
    cross-section.
  ]
)
<fig:Porous_Setup>

From a computational standpoint, the domain consists of 12,288 SPH
particles, each associated with a micro-domain comprising 23,104 DPD
particles ($N_(upright(d))$$= 16$), leading to a total of approximately
$2.83 times 10^8$ DPD particles. To advance to $t = lambda$
(approximately $1.4 times 10^4$ steps), the simulation required 65.7
hours ($approx 1.68$ s per step) on the BCAM workstation (see
Table~#link(<SM>)[S4]). For further details, please refer to
Section~#link(<SM>)[SM10] in the #link(<SM>)[Supplementary Material].

The steady-state flow fields, obtained after long integration times, are
presented in @fig:PorousSS for two distinct Weissenberg numbers:
a low-Wi$= 0.52$ ($F = 1.0 dot.op 10^(- 3)$) and a high-Wi$= 6.5$
($F = 5.0 dot.op 10^(- 2)$). The velocity fields (Panel I) reveal
complex streamlines wrapping around the obstacles, with high-velocity
channels confined to the narrowest constrictions between solid
obstacles. The total shear stress, $macron(pi)_(x y)^(*)$, concentrates
along the cylinder surfaces and within these same constricted passages
(Panel II).

#figure(image("source/Porous-eps-converted-to.pdf", width: 95.0%),
  caption: [
    Steady-state spatial distribution of fields in the porous medium
    case for (a) Wi=0.52 ($F = 1.0 dot.op 10^(- 3)$) and (b) Wi=6.5
    ($F = 5.0 dot.op 10^(- 2)$). For each panel (a) and (b), the figure
    displays: (I) the dimensionless magnitude of the velocity
    ($v^(*)$=$parallel v parallel \/ U_o$) and its streamlines;
    (II) the dimensionless magnitude of the total shear stress
    $macron(pi)_(x y)^(*)$$=$$macron(pi)_(x y)$$\/$$tau_(upright(o b s t r a c l e))^(*)$\;
    and (III) the dimensionless magnitude of the total normal stress
    $macron(N)_1^(*)$$=$$N_1$$\/$$tau_(upright(o b s t r a c l e))^(*)$.
    Here, $U_o$ represents the magnitude of the total average velocity,
    and
    $tau_(upright(o b s t r a c l e))^(*)$$=$$U_o$$eta_(upright(t o t))^0$$\/$$R_(upright(o b s t a c l e s))$.
  ]
)
<fig:PorousSS>

In contrast, the first normal stress difference,
$macron(N)_1^(*)$, develops sharp, localized peaks in the
wakes downstream of the obstacles, a characteristic signature of the
intense extensional deformation in these regions (@fig:PorousSS
Panel II)@Kawale2017a@Kumar2023a. The magnitude and localization of both
stress components are markedly more pronounced at Wi$= 6.5$. This
highlights the significant role of the polymer's response in altering
the flow field~@Kumar2023a@Varshney2017@Browne2020a.

This benchmark case demonstrates the scalability and robustness of the
LHMM framework in handling geometrically complex flows. The model
successfully captures both the global flow organization and the highly
localized stress concentrations that are critical for understanding
viscoelastic flow conditions. For a detailed analysis of the initial
transient dynamics of this case, please refer to
Section~#link(<SM>)[SM9.2] in the #link(<SM>)[Supplementary Material].

= Conclusions and Future Work <sec:conclusions>
This study successfully developed and applied a Lagrangian Heterogeneous
Multiscale Method (LHMM), uniquely integrating Dissipative Particle
Dynamics (DPD) at the microscale with a thermodynamics
structure-prescribing Particle Hydrodynamics (SPH) formulation at the
macroscale.

Our approach rigorously characterized microscopic rheological properties
by employing DPD as a virtual rheometer. This provided crucial inputs,
such as shear-thinning viscosity and relaxation times, necessary for
parameterizing the LHMM across various Wi regimes. The effectiveness of
the LHMM was validated through benchmark tests, including Reverse
Poiseuille Flow (RPF) and flow through a Periodic Array of Cylinders
(PAC). These assessments consistently demonstrated the framework's
capability to capture both transient and steady-state viscoelastic
behaviors.

Furthermore, the LHMM exhibited scalability and computational
efficiency, enabling its application to highly complex geometries, as
illustrated by detailed simulations of flow through a RPM. This case
underscored the framework's ability to resolve intricate flow patterns,
localized stress concentrations, and microstructural responses in
heterogeneous environments, with particle counts exceeding $10^8$.
Collectively, these findings establish the LHMM as a predictive and
versatile tool for modeling polymer melt rheology in complex 2D flows,
effectively bridging microscopic structure with macroscopic transport.
Beyond its methodological significance, this work opens new avenues for
applications in polymer processing, porous media transport, and the
design of advanced materials.

- Advanced viscoelastic instability analysis: deeper investigation into
  the onset and evolution of viscoelastic instabilities in complex flow
  geometries.

- Extension to three-dimensional flows: expanding the LHMM framework to
  simulate 3D configurations for broader real-world applicability.

- Possible extension to other complex system for which a LAMMPS-based
  implementation is available, for example coupling DEM and SPH for
  multiscale modeling of dense particle suspensions.

#heading(level: 1, numbering: none)[Acknowledgement]
<acknowledgement>
The authors acknowledge the funding provided by IKUR--HPC&AI --
(HPCAI10: MOLD-POLY) and the IKUR Strategy funded by Basque Government
and the European Union NextGenerationEU/PRTR. The research is also
partially funded by the Spanish State Research Agency through BCAM
Severo Ochoa excellence accreditation CEX2021-0011
42-S/MICIN/AEI/10.13039/501100011033, and through the project
PID2024-158994OB-C42 ('Multiscale Modeling of Friction, Lubrication, and
Viscoelasticity in Particle Suspensions' and acronym 'MMFLVPS') funded
by MICIU/AEI/10.13039/501100011033 and cofunded by the European Union.
The authors thankfully acknowledges the computer resources at
MareNostrum and the technical support provided by Barcelona
Supercomputing Center (IM-2024-3-0013 and IM-2025-2-0042).

#heading(level: 1, numbering: none)[Supplementary Information]
<SM>
Supplementary data associated with this article can be found in the
online version. The detailed Supplementary Material, which expands upon
the research presented here, including the Supplementary Document and
Video, is available temporarily via Mendeley's Dataset repository at:
#link("https://data.mendeley.com/preview/vxtbhpfzyt?a=8afc905e-ca15-4325-9dba-c5b8f1edfef3").
Additionally, the complete coding repository for the LHMM framework with
DPD-SPH are publicly accessible at:
#link("https://github.com/BCAM-CFD/LHMM/tree/main/LHMM-PolymerDPD").

= Kernel function approximation <AppSPH>
The Lucy kernel for 2D SPH simulations employs a smoothing length
$h = 4 upright("dx")$, where $upright("dx")$ is the initial particle
spacing. The kernel function is defined as:
$ W \( r_(I J) \) = cases(delim: "{", frac(5, pi h^2) (1 + frac(3 r_(I J), h)) (1 - r_(I J) / h)^3 \, & r_(I J) / h < 1, , 0 \, & r_(I J) / h gt.eq 1 .) $<eq:lucy_kernel>

This formulation provides third-order accuracy while maintaining compact
support within the smoothing domain.

= Artificial sound speed <SoundAn>
The numerical speed $c_s$ is calculated to enforce near-incompressible
flow conditions ($M a < 0.1$) through:

$ c_s = max (frac(\| upright(bold(v)) \| upright("max"), delta) \, sqrt(frac(eta_(upright("total")) \| upright(bold(v)) \|_(upright("max")), delta L)) \, sqrt(frac(\| upright(bold(f))^(upright("ext")) \| L, delta))) $<eq:sound_speed>

where $delta = 0.1$ serves as a compressibility parameter and $L$
represents the characteristic domain length scale.

= Time-Step Calculation for SPH (Macroscopic scale) <sec:time_stepping>
The time-step $Delta t$ is determined by the CFL condition:

$ Delta t_(upright(S P H)) = 0.25 dot.c min {frac(h, parallel upright(bold(v)) parallel_(upright("max")) + c_s) \, (frac(h, parallel upright(bold(f)) parallel))^(1 \/ 2) \, frac(h^2, 2 nu)} $<eq:cfl_condition>

where $nu = eta_(upright("tot")) \/ rho$ is the polymer solution's
kinematic viscosity. The safety factor 0.25 was found optimal for
maintaining stability in viscoelastic flow simulations.

= LHMM flowchart <sec:Flowchart>
This appendix provides a detailed visual representation of the LHMM
multiscale coupling scheme's workflow, supplementing the main text for
readers seeking a comprehensive overview of the implementation. The
diagram outlines the two-way information exchange between the macro and
micro systems in LHMM, including the specific MPI communication commands
and key simulation steps. The LHMM multiscale coupling scheme employs a
C++/MPI architecture that coordinates LAMMPS simulations @Xu2024@Hue2025
across $N_(upright("mac"))$ (macro) and $N_(upright("mic"))$ (micro) MPI
ranks, where $N_(upright("mac")) + N_(upright("mic")) = P$. As detailed
in @fig:LHMM_Flowchart, the macro system executes
`in.lammps.macro` with `pair_style PI/SPH`, computing macroscopic
velocity gradients ($nabla upright(bold(v))$) after $macron(M)$ SPH
steps (defining the coupling time step $delta t$) before broadcasting
via `MPI_Bcast`. The micro system runs `in.lammps.micro` with
`pair_style DPD/GPU`, processing the received $nabla upright(bold(v))$
for $k'$ DPD steps (also defining $delta t$) and returning microscopic
stress tensors ($macron(bold(pi))$) via `MPI_Send`. This cycle repeats
for the total simulation duration ($t_(upright("macro"))$ steps), with
dynamic load balancing across the partitioned communicators. The
detailed step-by-step procedure governing this iterative exchange is
provided in @subsec:coupling_protocol.

#figure([
  #image("source/LHMM_Flowchart-eps-converted-to.pdf", width: 90%)
  #v(5pt)
  #layout(size => coupling-cycle(size.width))
],
  caption: [
    LHMM multiscale coupling workflow. The #strong[Macro System] (top)
    executes SPH simulations using `PI/SPH` pair styles, computing
    velocity gradients ($nabla upright(bold(v))$) that are broadcast to
    the #strong[Micro System] (bottom) via `MPI_Bcast`. The micro system
    runs GPU-accelerated DPD simulations (`DPD/GPU` pair styles) and
    returns stress tensors ($macron(bold(pi))$) via `MPI_Send`. The loop
    continues until completing the total macro steps. Box styles
    indicate active computation (bold borders) and the termination check
    (dashed border).
  ]
)
<fig:LHMM_Flowchart>

= Detailed Coupling Protocol <subsec:coupling_protocol>
The macro and micro systems exchange information iteratively through a
synchronized protocol at each exchange time step $delta t$. This
coupling time step is defined by the relation
$delta t = macron(M) dot.op Delta t_(upright(S P H)) = k' dot.op Delta t_(upright(D P D))$,
where $macron(M)$ and $k'$ are integers representing the number of SPH
and DPD steps within one coupling interval, respectively.

+ #emph[Initialization]: \
  Initialization of the particle distribution for both macroscale and
  micro-domains (linked to macroparticles). This step includes defining
  boundary and initial conditions, the sound speed in the macroscale
  (Eq.~@eq:sound_speed), initial time steps
  for the macroscale ($Delta macron(t)_(upright("SPH"))$, determined by
  Eq.~@eq:cfl_condition) and microscale
  ($Delta t'_(upright("DPD"))$, defined in Section~@sec:micro_results
  from viscometric characterization). Additionally, parameters $alpha$
  and $beta$ for Eqs.~@eq:macro and
  @eq:beta are set.

+ #emph[Coupling Cycle Begins:]

+ #emph[Macroscopic Integration (over $macron(M)$ SPH steps, defining
  $delta t$):]

  - The SPH simulation runs for $macron(M)$ time steps. During this
    interval, particle pressure is computed using the equation of state
    (Eq.~@eq:tait).

  - The SPH approximation for the continuity and momentum conservation
    equations (Eqs.~@eq:sph_continuity)
    is applied.

  - A Velocity-Verlet scheme updates particles' physical properties such
    as position, velocity, and forces.

+ #emph[Top-down (Macro $arrow.r$ Micro, at the end of $delta t$):]

  - The macroscopic velocity gradient $nabla upright(bold(v))_I$ is
    computed from SPH (via
    Eq.~@eq:macro_micro) and transferred to
    each associated DPD simulation in its micro-domain.

  - Boundary conditions are imposed in $Omega'_(upright(b c))$ using
    Eq.~@eq:micro_bc. This local flow
    information deforms the polymer microstructure by applying a linear
    background velocity field or through explicit boundary-driven
    shearing in the DPD microscale, affecting the ensemble of $i$
    particles and bead-chains.

+ #emph[Microscopic Integration (over $k'$ DPD steps, defining
  $delta t$):]

  - The DPD simulations evolve for $k'$ time steps, receiving the
    imposed $upright(bold(v))'_i$ in $Omega'_(upright(b c))$ from the
    previous macro-step.

  - Forces are computed according to DPD interaction forces
    (Eqs.~@eq:conservative - @eq:random)
    and the FENE bonding forces
    (Eq.~@eq:fene_force) for each bead
    within the same polymer chain.

  - A Velocity-Verlet scheme updates particles' physical properties
    (position, velocity, and forces) within the microscale from the
    Eq.~@eq:motion.

+ #emph[Bottom-up (Micro $arrow.r$ Macro, at the end of $delta t$):]

  - After the microstructure has evolved, the polymeric stress tensor
    $chevron.l bold(pi)'_p chevron.r$ is calculated via IK averaging
    over the DPD ensemble, employing
    Eqs.~@eq:IKtotal - @eq:potential_stress
    within the core region ($Omega'_(upright(c o r e))$).

  - This stress is then passed to the corresponding macro-particles and
    incorporated into the macroscopic momentum equations (specifically,
    the SPH approximation for the continuity of mass and momentum
    conservation equations in
    Eq.~@eq:sph_continuity) to update
    the macroscopic flow at time $t + delta t$.

+ Return to Step~1 for the next coupling interval.

= Carreau-Yasuda Model Details <app:CY_details>
This appendix provides further details on the Carreau-Yasuda (C-Y) model
used for fitting the DPD simulation data. The C-Y equation is given by:
$ eta \( dot(gamma)_(x y) \) = eta_(upright("cy"))^oo + \( eta_(upright("cy"))^0 - eta_(upright("cy"))^oo \) [1 + \( lambda dot(gamma)_(x y) \)^(a_(upright("cy")))]^(\( n_(upright("cy")) - 1 \) \/ a_(upright("cy"))) \, $<eq:Yasuda>
where $eta_(upright("cy"))^0$ is the zero-shear viscosity,
$eta_(upright("cy"))^oo$ is the infinite-shear viscosity, $lambda$ is
the mean relaxation time, $a_(upright("cy"))$ is the transition
sharpness parameter, and $n_(upright("cy"))$ is the power-law index.
These parameters are optimized during the fitting process for each
polymer chain length.

= Normal Stress Coefficients and Relaxation Time Definitions <app:NormalStressRelaxation>
This appendix provides an overview of the definitions and calculations
for normal stress coefficients and relaxation times utilized in our
rheological analysis. The first normal stress coefficient ($psi_1$),
crucial for characterizing the elastic properties of viscoelastic
fluids, is defined as the difference between the normal components of
the polymer stress tensor, normalized by the square of the applied shear
rate.
$ psi_1 = frac(macron(N) 1, dot(gamma)_(x y)^2) \, $<eq:psi1_appendix>
where
$macron(N)_1 = chevron.l macron(pi)_p chevron.r_(x x) - chevron.l macron(pi)_p chevron.r_(y y)$
represents the first normal stress difference within the
$Omega'_(upright(c o r e))$, computed from the polymer stress response
$chevron.l bold(pi)'_p chevron.r$. The mean relaxation time
($lambda$)~@Fedosov2010 is defined as a function of the shear rate:
$ lambda \( dot(gamma)_(x y) \) = 0.5 frac(psi_1, chevron.l macron(eta)_p chevron.r_s) \, $<eq:tau0_def>
and its zero-shear value is obtained from the asymptotic limits as
$dot(gamma)_(x y) arrow.r 0$:
$ lambda = 0.5 frac(psi_1 \( dot(gamma)_(x y) arrow.r 0 \), eta_p^0) . $<eq:tau0_def_appendix>

= Analytical velocity profile for pure solvent <app:velocity>
For reference, the steady-state velocity profile of a Newtonian solvent
in planar Poiseuille flow under a constant body force $F$ can be
expressed analytically as~@Fedosov2010@NietoSimavilla2022:

$ v_x \( y \) = v_(upright("max")) [1 - (frac(y, L_y \/ 4))^2] \, $<eq:velocity>

Where $L_y$ is the channel width and $v_(upright("max"))$ is the peak
velocity at the channel centerline, given by

$ v_(upright("max")) = frac(F n L_y^2, 32 eta) \, $

with $n$ the particle number density and $eta$ the Newtonian viscosity.
This parabolic profile is used as a benchmark in Section~@subsub:RPF-N
to assess the velocity response of the coupled LHMM system.

#heading(numbering: none)[Abbreviations]

- AFBC: Arbitrary Flow Boundary Condition
- CFD: Computational Fluid Dynamics
- C-Y: Carreau-Yasuda Model
- DPD: Dissipative Particle Dynamics
- FENE: Finitely Extensible Nonlinear Elastic
- GMM: Generalized Maxwell Model
- HMM: Heterogeneous Multiscale Method
- IK: Irving-Kirkwood
- ILT: Inverse Laplace Transform
- LHMM: Lagrangian Heterogeneous Multiscale Method
- MD: Molecular Dynamics
- PAC: Periodic Array of Cylinders
- RPF: Reverse Poiseuille Flow
- RPM: Random Porous Medium
- SPH: Smoothed Particle Hydrodynamics
- Wi: Weissenberg number
- Re: Reynold number
- 2D: Two-dimensional
- DEM: Discrete Element Method
- BCF: Brownian Configuration Fields

#heading(numbering: none)[Nomenclature]

- $H_(upright("FENE"))$: Spring constant, FENE parameter



- $R_0$: The maximum bond extension, FENE parameter



- $a_(i j)$: conservative force coefficient, DPD parameter



- $r_c$: Cutoff radius, DPD parameter



- $d x$: The average initial distance between beads, DPD parameter



- $sigma^R$: Random force amplitude, DPD parameter



- $gamma^D$: Dissipation coefficient, DPD parameter



- $T$: Temperature



- $k_B$: Boltzmann constant



- $m_i$: Mass of a DPD particle i



- $eta' ""_p^0$: the zero-shear rate viscosity extracted from the

  microscopic DPD characterization



- $macron(eta)_p^0$: Zero-shear-rate viscosity from the macroscopic



- $eta' ""_p^0$: Zero-shear-rate viscosity prescribed by the microscale

  system



- $eta_(upright(t o t))^0$: Total effective viscosity defined as

  $eta_(upright(t o t))^0 = macron(eta)_p^0 + eta_s = alpha eta_p^0 + eta_s$



- $U_o$: Characteristic velocity, average velocity along time in the

  entire macro-domain



- $lambda$: Characteristic relaxation time



- $psi_1$: First normal stress coefficient,

  $psi_1 = N_1 \/ dot(gamma)_(x y)^2$



- $N_1$: First normal stress difference



- $N_(upright(d))$: Number of beads per polymer chain



- $G \( t \)$: Relaxation modulus



- $G'$: Storage modulus



- $G''$: Loss modulus



- $H \( tau \)$: Relaxation spectrum



- $eta' \( omega \)$: Complex viscosity



- $Delta h$: Average inter-particle distance, SPH parameter



- $h$: The compact support of the bell-shaped kernel, SPH parameter



- $rho$: Fluid density



- $bold(pi)$: Viscous stress tensor



- $bold(tau)$: Total stress tensor



- $upright(bold(d))$: Macroscopic strain-rate tensor computed from

  continuum velocity fields



- $Omega'$: Microscopic control volume



- $alpha$: Viscosity ratio between the macroscopic and microscopic

  scale, $alpha = frac(macron(eta)_p^0, eta' ""_p^0)$



- $lambda^(*)$: Time-scale ratio between the macroscopic and microscopic

  scale, $lambda^(*) = macron(lambda) / lambda'$



- $Omega'_(upright(c o r e))$: Microscopic core region, AFBC parameter



- $Omega'_(upright(b c))$: Microscopic boundary-condition region, AFBC

  parameter



- $Omega'_0$: Buffer region, AFBC parameter



- $l_(upright("core"))$: Length of the core region, AFBC parameter



- $l_(upright("bc"))$: Length of the boundary condition region, AFBC

  parameter



- $l_(upright("buffer"))$: Length of the buffer region, AFBC parameter



- $l_(upright("total"))$: Length of the total domain, AFBC parameter



- $upright(bold(v))'_i$: Imposed velocity field for a microscopic

  particle



- $beta$: Polymeric viscosity fraction,

  $beta = eta_p \/ eta_(upright(t o t))$



- $p$: Pressure



- $upright(bold(f))$: External body force vector applied in the flow

  domain



- $F$: Magnitude of the applied body force per unit mass



- $eta_s$: Solvent viscosity (shear viscosity of the fluid)



- $epsilon$: The polymer microstructure of characteristic scale variable



- $macron(eta)_p$: Effective microscopic viscosity arising from polymer



- $chevron.l eta'_(p \, s) chevron.r$: Shear viscosity arising from

  polymer



- $macron(eta)_(p \, epsilon)$: Extensional viscosity arising from

  polymer



- $eta_(upright(t o t))$: The total effective viscosity combining solvent

  and polymer contributions,

  $eta_(upright(t o t)) = eta_(upright(s)) + macron(eta)_p$



- $macron(upright(bold(d)))$: Macroscopic strain-rate tensor prescribed

  or reconstructed from microscopic variables



- $macron(bold(pi))$: Macroscopic stress tensor



- $macron(bold(pi))_(upright(s))$: Solvent stress tensor,

  representing the ideal Newtonian contribution



- $chevron.l bold(pi)'_p chevron.r$: Microscopic polymeric stress

  tensor, including microstructural non-ideal contributions



- $dot(gamma)$: Characteristic or reference shear rate, used for

  non-dimensionalization or defining flow regimes



- $Delta macron(t)_(upright("SPH"))$: SPH macroscopic time step



- $Delta t'_(upright("DPD"))$: DPD microscopic time step



- $delta t$: Exchange time step between macro- and micro-scales



- $macron(M)$: Positive integer for the SPH time step scaling,

  $delta t = macron(M) dot.op Delta macron(t)_(upright("SPH"))$



- $k'$: Positive integer for the DPD time step scaling,

  $delta t = K' dot.op Delta t'_(upright("DPD"))$



- $upright(bold(r))'_i$: Position of a microscopic particle relative to

  its micro-domain center



- $nabla upright(bold(v))_I$: Macroscopic velocity gradient at SPH

  particle I



- $c$: Speed of sound, SPH parameter



- $zeta_s$: Bulk viscosity, SPH parameter



- $rho_0$: Reference density, SPH parameter



- $m_I$: Mass at SPH particle I



- $m_(upright(D P D))$: Mass of a DPD particles



- $n_(upright(D P D))$: DPD number density



- $p_I$: The pressure at SPH particle I



- $rho_I$: The density at SPH particle I



- $eta_(upright("cy"))^0$: Zero-shear viscosity from Carreau--Yasuda fit



- $eta_(upright("cy"))^oo$: Infinite-shear viscosity from

  Carreau--Yasuda fit



- $a_(upright("cy"))$: Transition sharpness parameter from

  Carreau--Yasuda fit



- $n_(upright("cy"))$: Power-law index from Carreau--Yasuda fit



- $dot(gamma)_(x y)$: Shear rate associated with simple (pure) shear in

  the $x y$ plane



- $tau_(upright(m a x))^(upright(R P F))$: Maximum theoretical shear stress

  from the RPF analytical solution, given by

  $tau_(upright(m a x))^(upright(R P F)) = F rho L_y \/ 4$



- $tau_(upright(P A C))^(*)$: Dimensionless Stress parameter to PAC

  cases



- $tau_(upright(o b s t r a c l e))^(*)$: Dimensionless Stress parameter to

  PAC cases



- $v_x^(*)$: the dimensionless magnitude of the x-component of velocity,

  defined as $v_x^(*) = parallel v_x parallel \/ U_o$



- $v_y^(*)$: the dimensionless magnitude of the y-component of velocity,

  defined as $v_y^(*) = parallel v_y parallel \/ U_o$



- $v^(*)$: the dimensionless magnitude of the velocity, defined as

  $v^(*) = parallel bold("v") parallel \/ U_o$



- $macron(N)_1^(*)$: the dimensionless total normal stress, defined as

  $macron(N)_1^(*) = parallel N_1 parallel \/ tau_(upright("PAC"))^(*)$



- $upright("Wi")^(upright(l o c a l))$: local Weissenberg number



- $underline(underline(dot(bold(gamma))))$: Rate-of-strain tensor



- $macron(pi)_p^(*)$: Dimensionless polymeric stress magnitude



- $macron(pi)^(*)$: Dimensionless total stress magnitude



- $macron(pi)_(upright("s"))^(*)$: Dimensionless solvent stress



- $macron(pi)_(p \, x y)^(*)$: Dimensionless microscopic polymeric shear

  stress



- $macron(pi)_(x y)^(*)$: Dimensionless total shear stress



- $macron(pi)_(x y)$: Total shear stress denotes for the $x y$-component

  of the $macron(bold(pi))$



- $macron(pi)_(x x)$: The $x x$-component stress of the

  $macron(bold(pi))$



- $macron(pi)_(y y)$: The $y y$-component stress of the

  $macron(bold(pi))$



- $macron(pi)_(upright("s") \, x y)^(*)$: Dimensionless solvent shear

  stress



- $L_x$: Domain length in the $x$-direction



- $L_y$: Domain length in the $y$-direction



- $chevron.l pi'_(p \, x y) chevron.r$: Average polymeric shear stress,

  $x y$-component of the polymer stress tensor ($bold(pi)'_p$)



- $macron(pi)_(upright("s") \, x y)$: Average solvent shear stress,

  $x y$-component of the polymer stress tensor

  ($macron(bold(pi))_(upright(s))$)



- $R_(c l)$: Radius of cylinder



- $r_(upright(o b s t a c l e))$: Radius of pore



- $R_(upright(o b s t a c l e s))$: The average radius of the pores


#bibliography("references.bib", style: "chicago-author-date")
