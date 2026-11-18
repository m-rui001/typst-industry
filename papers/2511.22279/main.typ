#set page(paper:"a4", margin:23mm, numbering:"1")
#set text(font:"Libertinus Serif",size:10.5pt)
#set par(justify:true,leading:.6em)
#set heading(numbering:"1.1")
#set math.equation(numbering:"(1)")
#show figure.caption: set text(size:9pt)
#align(center)[
  #text(size:16pt,weight:"bold")[Optimal Multi-Objective Wave-Momentum Shaping in Scattering Media]
  #v(.6em)
  Tristan Nerson#super[1], Jakob Hüpfl#super[2], Clément Ferise#super[1], David Globosits#super[2], Marlene Hudler#super[2], Matthieu Malléjac#super[3,4], Stefan Rotter#super[2], and Romain Fleury#super[1]
  #v(.5em)
  #super[1] Laboratory of Wave Engineering, School of Electrical Engineering, EPFL, Lausanne, Switzerland \
  #super[2] Institute for Theoretical Physics, Vienna University of Technology (TU Wien), A-1040 Vienna, Austria \
  #super[3] Univ. Bordeaux, CNRS, Bordeaux INP, I2M, UMR 5295, F-33400 Talence, France \
  #super[4] Arts et Metiers Institute of Technology, CNRS, Bordeaux INP, I2M, UMR 5295, F-33400 Talence, France \
  #link("mailto:tristan.nerson@epfl.ch") · #link("mailto:romain.fleury@epfl.ch")
]

*Abstract.* Radiation forces and torques are key to manipulating objects with acoustic or electromagnetic waves. An important concept in this context is the Generalized Wigner–Smith (GWS) matrix, which has previously been primarily studied for optimizing radiation forces and torques on single objects embedded inside complex scattering environments. Here, we develop a unified scattering framework that rigorously establishes this connection for arbitrary inhomogeneous, lossless electromagnetic and acoustic media, as well as for controlling multiple objects individually. Variational identities relate parametric changes of the medium to perturbations of the scattering fields, from which the GWS matrix emerges as a natural generator of radiation forces and torques. For a single object, its extremal eigenstates yield maximal force or torque along a chosen direction; for multiple objects, the same framework defines Pareto-optimal compromises among competing objectives and reveals uncertainty relations for their simultaneous optimization. This establishes a comprehensive foundation towards collective and selective manipulation of objects in complex media.

When propagating through complex media, waves -- acoustic or
electromagnetic, among others -- undergo repeated scattering events due
to inhomogeneities, which challenges our ability to control and predict
their propagation. Foundational works in acoustics by Fink and
colleagues showed that wavefronts can be time-reversed to refocus
through complex media, revealing that multiple scattering does not
necessarily lead to information loss
\[#link(<bib:fink_time-reversed_2000>)[1], #link(<bib:horodynski2021invariance>)[2]\]. Building on these
ideas, Vellekoop et al.~later demonstrated that tailored wavefronts can
focus light through opaque, strongly scattering media, marking the
experimental inception of the field of wavefront shaping in optics
\[#link(<bib:vellekoop_focusing_2007>)[3], #link(<bib:mosk_controlling_2012>)[4]\], and further accelerated
by the experimental measurement of the optical transmission matrix (a
subset of the full scattering matrix $upright(bold(S))$ capturing the
far-field information of the wave propagation)
\[#link(<bib:popoffMeasuringTransmissionMatrix2010>)[5]\]. A key concept in modern
wavefront shaping is the use of the Generalized Wigner-Smith (GWS)
matrix, defined as
$ upright(bold(Q))_alpha = upright(j) upright(bold(S))^dagger partial_alpha upright(bold(S)) \, $<eq:GWS>
where $alpha$ denotes a given global or local parameter of the
scattering region, and $dagger$ denotes the conjugate transpose. Here,
we assume the $+ upright(j) omega t$ time-harmonic convention, with the
angular frequency $omega$. First described in nuclear and mesoscopic
quantum physics
\[#link(<bib:smithLifetimeMatrixCollision1960>)[6], #link(<bib:froissart_spatial_1963>)[7], #link(<bib:brouwer_quantum_1997>)[8]\],
this matrix was repurposed as a practical tool to optimize incoming
waves for given operations
\[#link(<bib:ambichl_focusing_2017>)[9], #link(<bib:horodynski_optimal_2020>)[10]\]. This has notably found
applications in wave focusing, particle cooling and trapping,
information retrieval, inverse design and analysis of scattering
resonances
\[#link(<bib:bouchetMaximumInformationStates2021a>)[11], #link(<bib:matthes_learning_2021>)[12], #link(<bib:delhougneCoherentWaveControl2021>)[13], #link(<bib:horodynski_anti-reflection_2022>)[14], #link(<bib:hupflOptimalCoolingMultiple2023a>)[15], #link(<bib:solOptimalBlindFocusing2024>)[16], #link(<bib:butaitePhotonefficientOpticalTweezers2024>)[17], #link(<bib:globosits2024pseudounitary>)[18], #link(<bib:goicoecheaDetectingFocusingNonlinear2025>)[19], #link(<bib:byrnesPerturbingScatteringResonances2025>)[20], #link(<bib:bliokhDynamicGeometricShifts2025>)[21]\].

Beyond controlling the spatial distribution of wave amplitude or phase,
many applications rely on the mechanical action that waves exert on
objects through radiation forces and torques. A connection between these
mechanical effects and the GWS matrix has previously been identified,
showing that its extremal states can maximize the response of a single
object undergoing a small translation or rotation in a scattering
environment
\[#link(<bib:ambichl_focusing_2017>)[9], #link(<bib:horodynski_optimal_2020>)[10], #link(<bib:horodynskiTractorBeamsOptimal2023a>)[22], #link(<bib:orazbayevWavemomentumShapingMoving2024>)[23]\].
What has been lacking, however, is a general theoretical framework that
unifies these ideas for arbitrary acoustic or electromagnetic media and
extends them to the individual control of multiple objects.

Here, we develop such a framework based on variational relations that
link parametric changes of the medium to modifications of the scattering
fields, leading naturally to GWS matrices that encode individual forces
and torques on multiple particles at once. This multi-objective
formulation establishes that compromises between competing mechanical
targets are inevitable, with GWS eigenstates defining Pareto-optimal
solutions that outperform naive Monte Carlo approaches. In particular,
we demonstrate how tailored input states can realize coordinated motion
of several objects (#link(<fig:scattering_media>)[1]a) and establish a
fundamental bound governing simultaneous optimization of incompatible
objectives. Finally, we identify constrained variants that enable
selective manipulation, such as maximizing the force on a target object
along a prescribed direction while suppressing its motion in an
orthogonal direction and simultaneously constraining forces experienced
by some other objects (#link(<fig:scattering_media>)[1]b).

#figure(image("source/fig1.pdf"),
  caption: [
    Two examples of 2D inhomogeneous media described by the scattering
    matrix formalism, together with two optimization goals. The volume
    $V$ is represented in gray, comprising both the background and the
    inclusions, and is delimited by the dashed boundary
    $upright(bold(A))$ oriented away from the scattering region.
    #strong[a)] Multimode disordered waveguide in which two objects must
    be displaced. #strong[b)] Multiport open disordered cavity with
    monomode waveguides (here plane waves as in acoustics) in which one
    object must be displaced in the $y$-direction only, and one object
    must not be displaced at all.
  ]
)
<fig:scattering_media>

= Radiation forces in inhomogeneous media
<radiation-forces-in-inhomogeneous-media>
In the following, we assume lossless propagation, under which the
$upright(bold(S))$-matrix is unitary. In acoustics, we are interested in
the radiation force density in a fluid containing some inclusions. It is
assumed that the inclusions, even though potentially of solid nature,
can be modeled as equivalent inviscid fluids in which the Euler
equations hold, so that the whole medium is described as an
inhomogeneous fluid, while any transverse wave is neglected. A rule of
thumb is to consider solid inclusions of characteristic size $d$ in
which $omega lt.double pi c_s \/ d$, where $c_s$ is the shear speed of
sound. It has been shown that the time-averaged acoustic body force
density can then be written as \[#link(<bib:karlsenAcousticForceDensity2016>)[24]\]
$ overline(upright(bold(f)))_(upright("ac")) = - 1 / 4 \( \| p_1 \|^2 nabla kappa_0 + \| upright(bold(v))_1 \|^2 nabla rho_0 \) \, $<eq:force_density_ac>
where $kappa_0$, $rho_0$, $p_1$ and $upright(bold(v))_1$ are the
compressibility, density, first order complex pressure and acoustic
velocity fields, respectively, with
$ nabla dot.op upright(bold(v))_1 = - upright(j) omega kappa_0 p_1 upright(" and ") nabla p_1 = - upright(j) omega rho_0 upright(bold(v))_1 . $<eq:acoustics_hamronic_approx_equations>

In electromagnetism, for a linear, isotropic, non-dispersive and
lossless inhomogeneous medium with no free charges or currents, the
time-averaged force density for harmonic fields is analogous to the one
in acoustics \[#link(<bib:anghinoniFormulationsElectromagneticStress2022>)[25]\]:
$ overline(upright(bold(f)))_(upright("em")) = - 1 / 4 \( \| upright(bold(E)) \|^2 nabla epsilon + \| upright(bold(H)) \|^2 nabla mu \) \, $<eq:force_density_em>
where $epsilon$ and $mu$ are the permittivity and permeability of the
inhomogeneous medium, respectively, and $upright(bold(E))$ and
$upright(bold(H))$ the complex electric and magnetic vector fields. By
exploiting the analogy between
@eq:force_density_ac and @eq:force_density_em,
and using an immittance scattering formalism, we now formulate a general
theory of radiation forces expressed as scattering variational
integrals.

= Immittance formalism of scattering
<immittance-formalism-of-scattering>
Following circuit theory nomenclature
\[#link(<bib:zemanian1963n>)[26], #link(<bib:dickeGeneralMicrowaveCircuit1987>)[27]\], we introduce effective
scattering quantities -- hereafter called immittance voltage $u_m$ and
current $i_m$ -- at a scattering port $m$ as:

$ u_m = sqrt(2) \( s_m^(+) + s_m^(-) \) \, quad i_m = sqrt(2) \( s_m^(+) - s_m^(-) \) \, $
where $s_m^plus.minus$ is the incident ($+$) and outgoing ($-$) complex
amplitude of the wave, normalized such that $\| s_m^plus.minus \|^2$ is
equal to the incident/outgoing power at the corresponding port. The
scattering matrix $upright(bold(S))$ is defined as
$upright(bold(s))_(-) = upright(bold(S)) upright(bold(s))_(+)$, hence
the immittance vectors read
$ upright(bold(u)) = sqrt(2) \( bb(1) + upright(bold(S)) \) upright(bold(s))_(+) \, quad upright(bold(i)) = sqrt(2) \( bb(1) - upright(bold(S)) \) upright(bold(s))_(+) \, $<eq:immittance_def>
where $bb(1)$ denotes the identity matrix. In practice, the $N$ ports
correspond to the asymptotic modes that couple the scattering region to
its environment. In the multimode disordered waveguide of
#link(<fig:scattering_media>)[1]a, they are the propagating guided modes
of the homogeneous leads, while in the open cavity of
#link(<fig:scattering_media>)[1]b they are the ones of the attached
monomode waveguides. In both cases, the far-field information about the
volume $V$ inside the dashed boundary $upright(bold(A))$ is described by
its scattering matrix with respect to these ports. Note that by
convention, $i_m$ is positive when flowing into the scattering region.
Defining the complex Poynting vector as
$ bold(Pi) = cases(1 / 2 p_1 upright(bold(v))_1^(*) quad upright("(in acoustics)") \,, 1 / 2 upright(bold(E)) times upright(bold(H))^(*) quad upright("(in electromagnetism)") \,) $
it can be shown that in both acoustics and electromagnetism
\[#link(<bib:barybinModalExpansionsOrthogonal1998>)[28]\],
$ - 2 integral_A \( upright(bold(Pi)) + upright(bold(Pi))^(*) \) dot.op upright(d) upright(bold(A)) = upright(bold(u^dagger)) upright(bold(i)) + upright(bold(i))^dagger upright(bold(u)) . $<eq:immittance_integral>
Equation #link(<eq:immittance_integral>)[\[eq:immittance\_integral\]]
holds whenever no reactive wave enters the volume $V$, i.e., the
scattering region is only excited via propagating waves from the
outside. Experimentally, this often requires placing sources in the
far-field, so that all evanescent waves are sufficiently decayed.

= Variational integrals
<variational-integrals>
We extend here an important variational integral relation
\[#link(<bib:hupfl2023optimal>)[29]\] connecting parametric changes occurring in the
scattering region to changes of the immittance voltages and currents in
the asymptotic regions. We are interested in the variations of the
fields $delta p_1$ and $delta upright(bold(v))_1$ (resp.
$delta upright(bold(E))$ and $delta upright(bold(H))$) when a parameter
$upright(bold(alpha))$ in the system is slightly varied. Consider a
system built from $N_p$ spherical particles of diameter $d_i$ and
density $rho_(0 \, i)$ in a $rho_0^(\( b \)) \( upright(bold(r)) \)$
background, such that the density distribution can be written as
$ rho_0 \( upright(bold(r)) \) = rho_0^(\( b \)) \( upright(bold(r)) \) + sum_(i = 1)^(N_p) upright("rect")_(d_i) \( \| upright(bold(r)) - upright(bold(r))_i \| \) \( rho_(0 \, i) - rho_0^(\( b \)) \( upright(bold(r)) \) \) \, $
with $upright("rect")_(d_i) \( r \)$ being the rectangular function of
width $d_i$, and $upright(bold(r))_i$ the positions of the particles. We
decide to move the $k$#super[th] particle by
$upright(bold(alpha)) = Delta upright(bold(r))$, inducing a local change
in the system, and modify the density distribution by changing
$upright(bold(r))_k$ into $upright(bold(r))_k + Delta upright(bold(r))$
in the formula. In a volume $V_p$ surrounding the particle, we assume
that the background density is constant and that only the $k$#super[th]
term of the sum contributes to the density distribution. We then observe
that
$ nabla rho_0 \( upright(bold(r)) \, Delta upright(bold(r)) \) = - nabla_(Delta upright(bold(r))) rho_0 \( upright(bold(r)) \, Delta upright(bold(r)) \) quad upright("in ") V_p \, $<eq:density_negative>
with
$nabla_(Delta upright(bold(r))) = \( partial_(Delta x) \, partial_(Delta y) \)$
in 2D. This also applies to the compressibility, the permittivity and
the permeability.

Now, we use $delta$ to denote small variations of fields or parameters
due to perturbations such that
$delta f = nabla_(upright(bold(alpha))) f dot.op delta upright(bold(alpha))$.
In acoustics,
#link(<eq:acoustics_hamronic_approx_equations>)[\[eq:acoustics\_hamronic\_approx\_equations\]]
leads at first variational order to
$  & nabla dot.op \( delta upright(bold(v))_1 \) = - upright(j) omega delta upright(bold(alpha)) dot.op nabla_(upright(bold(alpha))) \( kappa_0 p_1 \) \,\
 & nabla \( delta p_1 \) = - upright(j) omega delta upright(bold(alpha)) dot.op nabla_(upright(bold(alpha))) \( rho_0 upright(bold(v))_1 \) . $<eq:var_ac1>

To relate this to the immittance vectors,
@eq:var_ac1 may
be combined as follows:
$ - nabla dot.op \( p_1^(*) upright(bold(delta upright(bold(v))_1)) + delta p_1 upright(bold(v))_1^(*) \) = upright(j) omega delta upright(bold(alpha)) dot.op \( \| p_1 \|^2 nabla_(upright(bold(alpha))) kappa_0 + \| upright(bold(v))_1 \|^2 nabla_(upright(bold(alpha))) rho_0 \) . $<eq:ac_nabla_alpha>
It is then possible to compute the volume integral of
#link(<eq:ac_nabla_alpha>)[\[eq:ac\_nabla\_alpha\]] and use
#link(<eq:immittance_integral>)[\[eq:immittance\_integral\]] to obtain
$ upright(bold(u))^dagger delta upright(bold(i)) + upright(bold(i))^dagger delta upright(bold(u)) = upright(j) omega delta upright(bold(alpha)) dot.op integral_V \( \| p_1 \|^2 nabla_(upright(bold(alpha))) kappa_0 + \| upright(bold(v))_1 \|^2 nabla_(upright(bold(alpha))) rho_0 \) upright(d) V . $<eq:acous-varia>
Derivation details, as well as the electromagnetic equivalent of
#link(<eq:acous-varia>)[\[eq:acous-varia\]] are shown in the End Matter.
With this, we evidence that the variations of the immittance vectors (at
the ports) can be linked to the local changes in the scattering medium.

We now prove the link between these variations, the local radiation
force, the GWS matrix and the optimal motion of an object.

= Optimal motion of one object
<optimal-motion-of-one-object>
If $upright(bold(alpha))$ is the spatial shift $Delta upright(bold(r))$,
#link(<eq:density_negative>)[\[eq:density\_negative\]] applies. The
volume of integration in #link(<eq:acous-varia>)[\[eq:acous-varia\]] can
be reduced from $V$ to $V_p$ since all the
$nabla_(upright(bold(alpha)))$ terms are zero outside of $V_p$. Using
@eq:force_density_ac and @eq:force_density_em
for the time-averaged force densities, the total radiation force
$overline(upright(bold(F)))$ on the volume $V_p$ in the direction of the
shift is
$ overline(upright(bold(F))) dot.op delta Delta upright(bold(r)) = - frac(upright(j), 4 omega) \( upright(bold(u))^dagger delta upright(bold(i)) + upright(bold(i))^dagger delta upright(bold(u)) \) . $<eq:Fdeltar>
Yet, from #link(<eq:immittance_def>)[\[eq:immittance\_def\]],
$  & delta upright(bold(u)) = sqrt(2) \[ \( bb(1) + upright(bold(S)) \) delta upright(bold(s))_(+) + delta \( upright(bold(S)) \) upright(bold(s))_(+) \]\
 & delta upright(bold(i)) = sqrt(2) \[ \( bb(1) - upright(bold(S)) \) delta upright(bold(s))_(+) - delta \( upright(bold(S)) \) upright(bold(s))_(+) \] $
For a fixed chosen input state,
$delta upright(bold(s))_(+) = upright(bold(0))$, and the change in
immittance vectors is only due to the parametric change of the
$upright(bold(S))$-matrix:
$ upright(bold(u))^dagger delta upright(bold(i)) + upright(bold(i))^dagger delta upright(bold(u)) = - 4 upright(bold(s))_(+)^dagger upright(bold(S))^dagger delta \( upright(bold(S)) \) upright(bold(s))_(+) . $
We extend the GWS matrix defined in #link(<eq:GWS>)[\[eq:GWS\]] to
multidimensional parameters $Delta upright(bold(r))$ to arrive at this
normalized GWS matrix:
$ upright(bold(Q))_(Delta upright(bold(r))) & = upright(j) upright(bold(S))^dagger \( hat(upright(bold(e)))_(upright(bold(r))) dot.op nabla_(Delta upright(bold(r))) \) upright(bold(S))\
 & = frac(1, \| delta Delta upright(bold(r)) \|) \( delta \( Delta x \) upright(bold(Q))_(Delta x) + delta \( Delta y \) upright(bold(Q))_(Delta y) \) \, $
where
$hat(upright(bold(e)))_(upright(bold(r))) = delta Delta upright(bold(r)) \/ \| delta Delta upright(bold(r)) \|$.
The expectation value over the input states is
$ ⟨upright(bold(Q))_(Delta upright(bold(r)))⟩_(upright(bold(s))_(+)) = upright(bold(s))_(+)^dagger upright(bold(Q))_(Delta upright(bold(r))) upright(bold(s))_(+) = - frac(upright(j), 4 \| delta Delta upright(bold(r)) \|) \( upright(bold(u))^dagger delta upright(bold(i)) + upright(bold(i))^dagger delta upright(bold(u)) \) . $
Using #link(<eq:Fdeltar>)[\[eq:Fdeltar\]], we finally obtain
$ 1 / omega ⟨upright(bold(Q))_(Delta upright(bold(r)))⟩_(upright(bold(s))_(+)) = overline(upright(bold(F))) dot.op hat(upright(bold(e)))_(upright(bold(r))) . $<eq:main_res>
#link(<eq:main_res>)[\[eq:main\_res\]] is the central equation of our
Letter. Since $upright(bold(Q))_(Delta upright(bold(r)))$ is Hermitian
for a unitary scattering matrix, the projection of the radiation force
can be written as a Rayleigh quotient. The Courant--Fischer min--max
theorem then ensures that
$ lambda_1 / omega \| upright(bold(s))_(+) \|^2 lt.eq overline(upright(bold(F))) dot.op hat(upright(bold(e)))_(upright(bold(r))) lt.eq lambda_N / omega \| upright(bold(s))_(+) \|^2 \, $
where the eigenvalues of $upright(bold(Q))_(Delta upright(bold(r)))$ are
ordered as $lambda_1 lt.eq lambda_2 lt.eq dots.h.c lt.eq lambda_N$. Of
particular interest are the extremal values of
$overline(upright(bold(F))) dot.op hat(upright(bold(e)))_(upright(bold(r)))$,
which are reached when the incident state coincides with the associated
eigenvector, enabling the maximization or minimization of the applied
force projection. More generally, if only $L$ out of $N$ ports are
accessible, the largest force projection lies between
$lambda_L \/ omega$ and $lambda_N \/ omega$, with typical values in
between. In the following, all the expectation values $⟨dot.op⟩$ are
taken with respect to the normalized input state such that
$\| upright(bold(s))_(+) \|^2 = 1 upright("W")$.

= Optimal motion of multiple objects
<optimal-motion-of-multiple-objects>
When $N_d$ objects are displaced, the variational integrals split into
non-overlapping contributions over the disjoint volumes $V_(p \, i)$.
The total quantity
$ 1 / omega ⟨upright(bold(Q))_(Delta upright(bold(r))_(upright("tot")))⟩ = frac(1, \| delta Delta upright(bold(r_(upright("tot")))) \|) sum_(i = 1)^(N_d) \| delta Delta upright(bold(r))_i \| thin overline(upright(bold(F)))_i dot.op hat(upright(bold(e)))_(upright(bold(r))_i) \, $<eq:Fdeltar_tot>
therefore measures the infinitesimal (virtual) work of the radiation
force on the system. Here,
$delta Delta upright(bold(r))_(upright("tot")) = \( delta Delta upright(bold(r))_1 \, dots.h.c \, delta Delta upright(bold(r))_(N_d) \)$
is the stacked displacement vector and
$overline(upright(bold(F)))_i dot.op hat(upright(bold(e)))_(upright(bold(r))_i)$
is the time-averaged force on the $i$#super[th] object in the direction
of its push. Without loss of generality, we can focus on the generic
case of two objects ($N_d = 2$). Because
$upright(bold(Q))_(Delta upright(bold(r))_1)$ and
$upright(bold(Q))_(Delta upright(bold(r))_2)$ typically do not commute,
they cannot, in general, be diagonalized simultaneously; hence, no
single incident state maximizes both projections
$overline(upright(bold(F)))_1 dot.op hat(upright(bold(e)))_(upright(bold(r))_1)$
and
$overline(upright(bold(F)))_2 dot.op hat(upright(bold(e)))_(upright(bold(r))_2)$
#footnote[An exception occurs if the two matrices happen to share the
same eigenvector associated with their maximal eigenvalues. This
non-generic case is understood in
#link(<eq:SR-Pareto>)[\[eq:SR-Pareto\]] by observing that what matters
is not ultimately the commutation of the two matrices but the vanishing
of the expectation value of the commutator.]. Yet, the largest
eigenvector of
$upright(bold(Q))_(Delta upright(bold(r))_(upright("tot")))$ maximizes
the sum of the projections. Consequently, the multi-object formulation
can be directly interpreted through the lens of multi-objective
optimization \[#link(<bib:miettinenNonlinearMultiobjectiveOptimization1999>)[31]\]. Each
$overline(upright(bold(F)))_i dot.op hat(upright(bold(e)))_(upright(bold(r))_i)$
defines an objective to be maximized and
$⟨upright(bold(Q))_(Delta upright(bold(r))_(upright("tot")))⟩$
corresponds to a so-called linear scalarization of this problem (i.e.,
forming a weighted sum to be maximized), with the coefficients
$\| delta Delta upright(bold(r))_i \|$ playing the role of optimization
weights. An extension of the theory to optimal torque on objects is
proposed in the End Matter. For two objectives -- such as
displacing/rotating two objects along/about one direction each -- the
feasible set of force components corresponds to the joint numerical
range of two Hermitian matrices, which is always convex
\[#link(<bib:hausdorffWertvorratBilinearform1919>)[32]\]. This is also true for three
objectives when $N > 2$ \[#link(<bib:fan1987generalized>)[33]\]. In these cases, it is known
that linear scalarization generates an entire Pareto front
\[#link(<bib:miettinenNonlinearMultiobjectiveOptimization1999>)[31]\] -- that is, the set of
solutions where no objective can be improved without degrading another.
We then discover that the GWS explores the full set of such compromises.
For four or more objectives, convexity can fail, and the GWS recovers
only the exposed subset of the Pareto front, leaving non-convex regions
inaccessible.

As an example, a bi-objective Pareto front for the simultaneous
translation of two objects in a 20-port disordered acoustic cavity is
simulated in #link(<fig:subfigs>)[2]a (red solid line).

#figure(image("source/fig2.pdf"),
  caption: [
    Collective and selective manipulation of objects in scattering
    media. #strong[a)] Bi-objective optimization: probability
    distribution of the force projections on two objects for $10^7$
    random input states. The marginal distributions form B-splines. The
    Pareto front (red solid line) is compared to a heuristic weighted
    sum of eigenstates (green dashed line). #strong[b)] Full wave
    simulation of the squared acoustic pressure field corresponding to
    the Pareto-optimal solution for which the force projections are
    equal, i.e.,
    $⟨upright(bold(Q))_(Delta upright(bold(r))_1)⟩ = ⟨upright(bold(Q))_(Delta upright(bold(r))_2)⟩$.
    The blue arrows are the objectives and the black arrows are the net
    forces exerted on the objects. #strong[c)] Constrained optimization:
    the object ① is displaced along the vertical direction only (net
    force in black perfectly overlapping with the objective in blue),
    while the object ② experiences local forces (small red arrows with
    their width and length logarithmically scaling with the local force
    magnitude) which globally compensate to obtain zero net force. The
    wavelength $lambda$ is shown on the right.
  ]
)
<fig:subfigs>

For comparison, we also show the corresponding force projections for
$10^7$ random inputs represented by the distribution of dots, the color
of which indicates the number of occurrences. Strikingly, the Pareto
front obtained from the GWS procedure greatly outperforms all the random
inputs, thus demonstrating that naive Monte Carlo exploration of the
input space cannot realistically be implemented to tailor radiation
forces in complex media. In the Supplemental Material, we conjecture
that the force projections -- whose respective probability distributions
are B-splines
\[#link(<bib:gallayNumericalMeasureComplex2012>)[34], #link(<bib:dunklNumericalShadowsMeasures2011>)[35], #link(<bib:camposvenutiProbabilityDensityQuantum2013>)[36], #link(<bib:wangProbabilityDistributionCoherent2025>)[37]\]
-- can never compete with the GWS procedure for sufficiently high number
of ports. Moreover, the Pareto front is compared to the result of a
heuristic procedure also based on the GWS matrix, where a linear
combination of eigenvectors of
$upright(bold(Q))_(Delta upright(bold(r))_1)$ and
$upright(bold(Q))_(Delta upright(bold(r))_2)$ is performed (green dashed
line). In terms of maximum force projections, the newly proposed
procedure consistently outperforms this technique, hitherto viewed as
the benchmark approach and closely aligned with the most recent
literature \[#link(<bib:orazbayevWavemomentumShapingMoving2024>)[23]\]. The result of the
Pareto optimization is shown in #link(<fig:subfigs>)[2]b, where blue
arrows correspond to the objectives, and black arrows correspond to the
net forces exerted on the objects, computed via the Brillouin stress
tensor. Further examples can be found in the Supplemental Material.

= Uncertainty relation
<uncertainty-relation>
In two-objective optimization with GWS matrices, one seeks to
simultaneously maximize the expectation values of the matrices
$upright(bold(Q))_alpha$ and $upright(bold(Q))_beta$, corresponding for
instance to distinct forces or torques on one or multiple objects. We
define the deficits from utopia values (highest eigenvalues) for a given
input state $upright(bold(s))_(+)$ as
$ epsilon.alt_alpha = lambda_N \( upright(bold(Q))_alpha \) - ⟨upright(bold(Q))_alpha⟩ \, quad epsilon.alt_beta = lambda_N \( upright(bold(Q))_beta \) - ⟨upright(bold(Q))_beta⟩ . $
A direct application of the Schrödinger-Robertson uncertainty relation
\[#link(<bib:schrodinger1999heisenberg>)[38]\], combined with the Bhatia-Davis inequality
\[#link(<bib:bhatia2000better>)[39]\], yields the following bound:
$ epsilon.alt_alpha epsilon.alt_beta gt.eq frac(1 / 4 \| chevron.l \[ upright(bold(Q))_alpha \, upright(bold(Q))_beta \] chevron.r \|^2 + upright(C o v) \( upright(bold(Q))_alpha \, upright(bold(Q))_beta \)^2, \( ⟨upright(bold(Q))_alpha⟩ - lambda_1 \( upright(bold(Q))_alpha \) \) \( ⟨upright(bold(Q))_beta⟩ - lambda_1 \( upright(bold(Q))_beta \) \)) . $<eq:SR-Pareto>
Here, the symmetrized covariance is
$ upright(C o v) \( upright(bold(Q))_alpha \, upright(bold(Q))_beta \) = 1 / 2 chevron.l { upright(bold(Q))_alpha - ⟨upright(bold(Q))_alpha⟩ \, upright(bold(Q))_beta - ⟨upright(bold(Q))_beta⟩ } chevron.r \, $
and $\[ upright(bold(A)) \, upright(bold(B)) \]$ and
${ upright(bold(A)) \, upright(bold(B)) }$ denote the commutator and
anti-commutator, respectively. The right-hand side of
#link(<eq:SR-Pareto>)[\[eq:SR-Pareto\]] cannot vanish unless the
expectation value of the commutator vanishes and the two GWS matrices
are uncorrelated in the chosen input state. In particular, the case
$epsilon.alt_alpha = epsilon.alt_beta = 0$ corresponds to the situation
where the two matrices share the same eigenstate associated with their
respective maximal eigenvalues, which is very non-generic. This
inequality highlights that the two objectives cannot be simultaneously
optimized: reducing the deficit for one inevitably increases the other,
which is precisely the trade-off structure captured by the Pareto front.

= Constrained optimization
<constrained-optimization>
Another interesting problem is the one of maximizing the expectation
value of a given $upright(bold(Q))_alpha$ while enforcing $N_c$
constraints on the expectation value of other objectives
$upright(bold(Q))_(beta_i)$:
$ max_(upright(bold(s))_(+) in bb(C)^N) quad & ⟨upright(bold(Q))_alpha⟩\
upright("s.t.") quad & ⟨upright(bold(Q))_(beta_i)⟩ gt.closed_i b_i \, quad i = 1 \, dots.h \, N_c\
 & upright(bold(s))_(+)^dagger upright(bold(s))_(+) = 1 thin \, $ where
"$gt.closed$" can signify "=", "$lt.eq$" or "$gt.eq$". This is known as a
complex-valued homogeneous quadratically constrained quadratic program,
and is generally an NP-hard problem for $N_c > 2$
\[#link(<bib:huangRankConstrainedSeparableSemidefinite2010>)[40], #link(<bib:luoSemidefiniteRelaxationQuadratic2010>)[41]\].
However, local optima are generally easy to find, enabling the selective
manipulation of objects.

As an example, we show in #link(<fig:subfigs>)[2]c the manipulation of
object in the $y$-direction only, while object is kept still, i.e.,
$⟨upright(bold(Q))_(Delta y_1)⟩$ is maximized, while
$⟨upright(bold(Q))_(Delta x_1)⟩$, $⟨upright(bold(Q))_(Delta x_2)⟩$ and
$⟨upright(bold(Q))_(Delta y_2)⟩$ are forced to be close to zero (a
10$""^8$ magnitude difference is observed in our simulation between
$⟨upright(bold(Q))_(Delta y_1)⟩$ and other expectation values). The
Gurobi Optimization solver is used for this task \[#link(<bib:gurobi>)[42]\]. It can be
readily seen that the resulting wave field indeed manages to compensate
local forces (represented by the red arrows in the inset of
#link(<fig:subfigs>)[2]c) on the objects and cancel the desired force
projections.

= Discussion
<discussion>
We have shown that radiation forces in complex media can be optimized
through the Generalized Wigner--Smith matrix: its extremal eigenstates
maximize force or torque projections on a single object, while in the
multi-object case they realize Pareto-optimal trade-offs among competing
objectives. Together with a realistic demonstration of constrained
optimization of objects' motion along targeted directions, our Letter
establishes a unified framework across acoustics and electromagnetism,
and provides a principled route to coordinated manipulation in strongly
scattering environments. In addition, the uncertainty relation of
#link(<eq:SR-Pareto>)[\[eq:SR-Pareto\]] quantifies the fundamental
trade-offs that emerge when simultaneously optimizing forces or torque
components. From the present study, the state-of-the-art strategies of
Horodynski et al.~\[#link(<bib:horodynski_optimal_2020>)[10]\] (superposition of two torque
eigenstates to suppress unwanted linear forces) and Orazbayev et
al.~\[#link(<bib:orazbayevWavemomentumShapingMoving2024>)[23]\] (separate optimization of
$upright(bold(Q))_(Delta x)$ and $upright(bold(Q))_(Delta y)$ instead of
diagonalizing $upright(bold(Q))_(Delta upright(bold(r)))$) can be seen
as important first steps, but they may fail or become suboptimal in a
general situation; the present framework unifies and extends these
ideas, providing a systematic route to the truly optimal radiation force
control.

Beyond fundamental interest, our results may contribute to the
development of in-vivo precision therapy and drug delivery, where
navigation through deep tissues requires controlling radiation forces in
multiply scattering media
\[#link(<bib:del_campo_fonseca_ultrasound_2024>)[43], #link(<bib:ghanemNoninvasiveAcousticManipulation2020>)[44], #link(<bib:loTornadoinspiredAcousticVortex2021a>)[45], #link(<bib:delcampofonsecaUltrasoundTrappingNavigation2023a>)[46], #link(<bib:yangInvivoProgrammableAcoustic2023>)[47], #link(<bib:medanyModelbasedReinforcementLearning2025>)[48], #link(<bib:burstowEvaluatingAccuracyAcoustic2025>)[49]\].
We also note interesting connections between our findings and a recent
preprint \[#link(<bib:liJointControlCoherent2025>)[50]\], which investigates the
simultaneous control of transmission, reflection and absorption. Our
Letter strongly suggests that the notion of Pareto-optimality for
multi-objective wavefront shaping introduced here could offer a general
framework that naturally extends from optimal radiation forces and
torques to other joint-control scenarios such as those considered in
Ref.~\[#link(<bib:liJointControlCoherent2025>)[50]\].

= Acknowledgments
<acknowledgments>
This work was supported by the Swiss National Science Foundation (SNSF)
under the grant No. 10001567.

#heading(numbering:none)[References]

#block[\[1\] M.~Fink, D.~Cassereau, A.~Derode, C.~Prada, P.~Roux, M.~Tanter,
J.-L.~Thomas,~and~F.~Wu,~Time-reversed
acoustics,~#link("https://doi.org/10.1088/0034-4885/63/12/202")[Rep. Prog. Phys.~#strong[63],~1933 (2000)].] <bib:fink_time-reversed_2000>

#block[\[2\] M.~Horodynski, D.~Bouchet, M.~Kühmayer,~and~S.~Rotter,~Invariance
property of the Fisher information in scattering media,~ Phys. Rev.
Lett.~#strong[127],~233201 (2021).] <bib:horodynski2021invariance>

#block[\[3\] I.~M.~Vellekoop~and~A.~P.~Mosk,~Focusing coherent light through opaque
strongly scattering
media,~#link("https://doi.org/10.1364/OL.32.002309")[Opt. Lett.~#strong[32],~2309 (2007)].] <bib:vellekoop_focusing_2007>

#block[\[4\] A.~P.~Mosk, A.~Lagendijk, G.~Lerosey,~and~M.~Fink,~Controlling waves in
space and time for imaging and focusing in complex
media,~#link("https://doi.org/10.1038/nphoton.2012.88")[Nat. Photon.~#strong[6],~283 (2012)].] <bib:mosk_controlling_2012>

#block[\[5\] S.~M.~Popoff, G.~Lerosey, R.~Carminati, M.~Fink,
A.~C.~Boccara,~and~S.~Gigan,~Measuring the transmission matrix in
optics: an approach to the study and control of light propagation in
disordered
media,~#link("https://doi.org/10.1103/PhysRevLett.104.100601")[Phys. Rev. Lett.~#strong[104],~100601 (2010)].] <bib:popoffMeasuringTransmissionMatrix2010>

#block[\[6\] F.~T.~Smith,~Lifetime matrix in collision
theory,~#link("https://doi.org/10.1103/PhysRev.118.349")[Phys. Rev.~#strong[118],~349 (1960)].] <bib:smithLifetimeMatrixCollision1960>

#block[\[7\] M.~Froissart, M.~L.~Goldberger,~and~K.~M.~Watson,~Spatial separation of
events in #strong[S]-matrix
theory,~#link("https://doi.org/10.1103/PhysRev.131.2820")[Phys. Rev.~#strong[131],~2820 (1963)].] <bib:froissart_spatial_1963>

#block[\[8\] P.~W.~Brouwer, K.~M.~Frahm,~and~C.~W.~J.~Beenakker,~Quantum mechanical
time-delay matrix in chaotic
scattering,~#link("https://doi.org/10.1103/PhysRevLett.78.4737")[Phys. Rev. Lett.~#strong[78],~4737 (1997)].] <bib:brouwer_quantum_1997>

#block[\[9\] P.~Ambichl, A.~Brandstötter, J.~Böhm, M.~Kühmayer,
U.~Kuhl,~and~S.~Rotter,~Focusing inside disordered media with the
generalized Wigner-Smith
operator,~#link("https://doi.org/10.1103/PhysRevLett.119.033903")[Phys. Rev. Lett.~#strong[119],~033903 (2017)].] <bib:ambichl_focusing_2017>

#block[\[10\] M.~Horodynski, M.~Kühmayer, A.~Brandstötter, K.~Pichler, Y.~V.~Fyodorov,
U.~Kuhl,~and~S.~Rotter,~Optimal wave fields for micromanipulation in
complex scattering
environments,~#link("https://doi.org/10.1038/s41566-019-0550-z")[Nat. Photon.~#strong[14],~149 (2020)].] <bib:horodynski_optimal_2020>

#block[\[11\] D.~Bouchet, S.~Rotter,~and~A.~P.~Mosk,~Maximum information states for
coherent scattering
measurements,~#link("https://doi.org/10.1038/s41567-020-01137-4")[Nat. Phys.~#strong[17],~564 (2021)].] <bib:bouchetMaximumInformationStates2021a>

#block[\[12\] M.~W.~Matthès, Y.~Bromberg, J.~de~Rosny,~and~S.~M.~Popoff,~Learning and
avoiding disorder in multimode
fibers,~#link("https://doi.org/10.1103/PhysRevX.11.021060")[Phys. Rev. X~#strong[11],~021060 (2021)].] <bib:matthes_learning_2021>

#block[\[13\] P.~del Hougne, K.~B.~Yeo, P.~Besnier,~and~M.~Davy,~Coherent wave control
in complex media with arbitrary
wavefronts,~#link("https://doi.org/10.1103/PhysRevLett.126.193903")[Phys. Rev. Lett.~#strong[126],~193903 (2021)].] <bib:delhougneCoherentWaveControl2021>

#block[\[14\] M.~Horodynski, M.~Kühmayer, C.~Ferise,
S.~Rotter,~and~M.~Davy,~Anti-reflection structure for perfect
transmission through complex
media,~#link("https://doi.org/10.1038/s41586-022-04843-6")[Nature~#strong[607],~281 (2022)].] <bib:horodynski_anti-reflection_2022>

#block[\[15\] J.~Hüpfl, N.~Bachelard, M.~Kaczvinszki, M.~Horodynski,
M.~Kühmayer,~and~S.~Rotter,~Optimal cooling of multiple levitated
particles through far-field wavefront
shaping,~#link("https://doi.org/10.1103/PhysRevLett.130.083203")[Phys. Rev. Lett.~#strong[130],~083203 (2023)].] <bib:hupflOptimalCoolingMultiple2023a>

#block[\[16\] J.~Sol, L.~Le~Magoarou,~and~P.~del Hougne,~Optimal blind focusing on
perturbation-inducing targets in sub-unitary complex
media,~#link("https://doi.org/10.1002/lpor.202400619")[Laser Photonics Rev.~#strong[19],~2400619 (2024)].] <bib:solOptimalBlindFocusing2024>

#block[\[17\] U.~G.~Būtaitė, C.~Sharp, M.~Horodynski, G.~M.~Gibson, M.~J.~Padgett,
S.~Rotter, J.~M.~Taylor,~and~D.~B.~Phillips,~Photon-efficient optical
tweezers via wavefront
shaping,~#link("https://doi.org/10.1126/sciadv.adi7792")[Sci. Adv.~#strong[10],~eadi7792 (2024)].] <bib:butaitePhotonefficientOpticalTweezers2024>

#block[\[18\] D.~Globosits, J.~Hüpfl,~and~S.~Rotter,~Pseudounitary Floquet scattering
matrix for wave-front shaping in time-periodic photonic media,~ Phys.
Rev. A~#strong[110],~053515 (2024).] <bib:globosits2024pseudounitary>

#block[\[19\] A.~Goïcoechea, J.~Hüpfl, S.~Rotter, F.~Sarrazin,~and~M.~Davy,~Detecting
and focusing on a nonlinear target in a complex
medium,~#link("https://doi.org/10.1103/PhysRevLett.134.183802")[Phys. Rev. Lett.~#strong[134],~183802 (2025)].] <bib:goicoecheaDetectingFocusingNonlinear2025>

#block[\[20\] N.~Byrnes~and~M.~R.~Foreman,~Perturbing scattering resonances in
non-hermitian systems: a generalized Wigner-Smith operator
formulation,~#link("https://doi.org/10.1016/j.newton.2025.100194")[Newton~#strong[1],~100194 (2025)].] <bib:byrnesPerturbingScatteringResonances2025>

#block[\[21\] K.~Y.~Bliokh, Z.~Kuang,~and~S.~Rotter,~Dynamic and geometric shifts in
wave
scattering,~#link("https://doi.org/10.1088/1361-6633/ae0bac")[Rep. Prog. Phys.~#strong[88],~107901 (2025)].] <bib:bliokhDynamicGeometricShifts2025>

#block[\[22\] M.~Horodynski, T.~Reiter, M.~Kühmayer,~and~S.~Rotter,~Tractor beams with
optimal pulling force using structured
waves,~#link("https://doi.org/10.1103/PhysRevA.108.023504")[Phys. Rev. A~#strong[108],~023504 (2023)].] <bib:horodynskiTractorBeamsOptimal2023a>

#block[\[23\] B.~Orazbayev, M.~Malléjac, N.~Bachelard,
S.~Rotter,~and~R.~Fleury,~Wave-momentum shaping for moving objects in
heterogeneous and dynamic
media,~#link("https://doi.org/10.1038/s41567-024-02538-5")[Nat. Phys.~#strong[20],~1441 (2024)].] <bib:orazbayevWavemomentumShapingMoving2024>

#block[\[24\] J.~T.~Karlsen, P.~Augustsson,~and~H.~Bruus,~Acoustic force density
acting on inhomogeneous fluids in acoustic
fields,~#link("https://doi.org/10.1103/physrevlett.117.114504")[Phys. Rev. Lett.~#strong[117],~114504 (2016)].] <bib:karlsenAcousticForceDensity2016>

#block[\[25\] B.~Anghinoni, G.~Flizikowski, L.~Malacarne, M.~Partanen,
S.~Bialkowski,~and~N.~Astrath,~On the formulations of the
electromagnetic stress--energy
tensor,~#link("https://doi.org/10.1016/j.aop.2022.169004")[Ann. Phys.~#strong[443],~169004 (2022)].] <bib:anghinoniFormulationsElectromagneticStress2022>

#block[\[26\] A.~Zemanian,~An n-port realizability theory based on the theory of
distributions,~ IEEE Trans. Circuit Theory~#strong[10],~265 (1963).] <bib:zemanian1963n>

#block[\[27\] R.~H.~Dicke,~General microwave circuit theorems,~in~#emph[Principles of
Microwave Circuits],~IET Electromagnetic Waves Series~No.~25,~edited
by~C.~G.~Montgomery,
R.~H.~Dicke,~and~E.~M.~Purcell~(IET,~1987)~pp.~130--161.] <bib:dickeGeneralMicrowaveCircuit1987>

#block[\[28\] A.~A.~Barybin,~Modal expansions and orthogonal complements in the theory
of complex media waveguide excitation by external sources for isotropic,
anisotropic, and bianisotropic
media,~#link("https://doi.org/10.2528/PIER97120800")[Prog. Electromagn. Res.~#strong[19],~241 (1998)].] <bib:barybinModalExpansionsOrthogonal1998>

#block[\[29\] J.~Hüpfl, N.~Bachelard, M.~Kaczvinszki, M.~Horodynski,
M.~Kühmayer,~and~S.~Rotter,~Optimal cooling of multiple levitated
particles: Theory of far-field wavefront shaping,~ Phys. Rev.
A~#strong[107],~023112 (2023).] <bib:hupfl2023optimal>

#block[\[30\] An exception occurs if the two matrices happen to share the same
eigenvector associated with their maximal eigenvalues. This non-generic
case is understood in #link(<eq:SR-Pareto>)[\[eq:SR-Pareto\]] by
observing that what matters is not ultimately the commutation of the two
matrices but the vanishing of the expectation value of the commutator..] <bib:Note1>

#block[\[31\] K.~Miettinen,~#link("https://doi.org/10.1007/978-1-4615-5563-6")[#emph[Nonlinear multiobjective optimization]],~edited
by~F.~S.~Hillier,~International Series in Operations Research &
Management Science, Vol.~12~(Springer US,~Boston, MA,~1999).] <bib:miettinenNonlinearMultiobjectiveOptimization1999>

#block[\[32\] F.~Hausdorff,~Der wertvorrat einer
bilinearform,~#link("https://doi.org/10.1007/BF01292610")[Math. Z.~#strong[3],~314 (1919)].] <bib:hausdorffWertvorratBilinearform1919>

#block[\[33\] M.~K.~Fan~and~A.~L~Tits,~On the generalized numerical range,~ Linear
Multilinear Algebra~#strong[21],~313 (1987).] <bib:fan1987generalized>

#block[\[34\] T.~Gallay~and~D.~Serre,~Numerical measure of a complex
matrix,~#link("https://doi.org/10.1002/cpa.20374")[Commun. Pure Appl. Math.~#strong[65],~287 (2012)].] <bib:gallayNumericalMeasureComplex2012>

#block[\[35\] C.~F.~Dunkl, P.~Gawron, J.~A.~Holbrook,
Z.~Puchała,~and~K.~Życzkowski,~Numerical shadows: measures and densities
on the numerical
range,~#link("https://doi.org/10.1016/j.laa.2010.12.003")[Linear Algebra Its Appl.~#strong[434],~2042 (2011)].] <bib:dunklNumericalShadowsMeasures2011>

#block[\[36\] L.~Campos~Venuti~and~P.~Zanardi,~Probability density of quantum
expectation
values,~#link("https://doi.org/10.1016/j.physleta.2013.05.041")[Phys. Lett. A~#strong[377],~1854 (2013)].] <bib:camposvenutiProbabilityDensityQuantum2013>

#block[\[37\] Y.~Wang~and~C.~Guo,~#link("https://doi.org/10.48550/arXiv.2511.04602")[Probability distribution for coherent transport of random waves]
(2025),~ arXiv:2511.04602 \[physics.optics\] .] <bib:wangProbabilityDistributionCoherent2025>

#block[\[38\] E.~Schrödinger,~#link("https://doi.org/10.48550/arXiv.quant-ph/9903100")[About Heisenberg uncertainty relation]
(1999),~ arXiv:quant-ph/9903100 \[quant-ph\] .] <bib:schrodinger1999heisenberg>

#block[\[39\] R.~Bhatia~and~C.~Davis,~A better bound on the variance,~ Am. Math.
Mon.~#strong[107],~353 (2000).] <bib:bhatia2000better>

#block[\[40\] Y.~Huang~and~D.~P.~Palomar,~Rank-constrained separable semidefinite
programming with applications to optimal
beamforming,~#link("https://doi.org/10.1109/TSP.2009.2031732")[IEEE Trans. Signal Process.~#strong[58],~664 (2010)].] <bib:huangRankConstrainedSeparableSemidefinite2010>

#block[\[41\] Z.-Q.~Luo, W.-K.~Ma, A.~M.-C.~So, Y.~Ye,~and~S.~Zhang,~Semidefinite
relaxation of quadratic optimization
problems,~#link("https://doi.org/10.1109/MSP.2010.936019")[IEEE Signal Process. Mag.~#strong[27],~20 (2010)].] <bib:luoSemidefiniteRelaxationQuadratic2010>

#block[\[42\] Gurobi Optimization,
LLC,~#link("https://www.gurobi.com")[Gurobi Optimizer Reference Manual]
(2024).] <bib:gurobi>

#block[\[43\] A.~Del Campo~Fonseca~and~D.~Ahmed,~Ultrasound robotics for precision
therapy,~#link("https://doi.org/10.1016/j.addr.2023.115164")[Adv. Drug Deliv. Rev.~#strong[205],~115164 (2024)].] <bib:del_campo_fonseca_ultrasound_2024>

#block[\[44\] M.~A.~Ghanem, A.~D.~Maxwell, Y.-N.~Wang, B.~W.~Cunitz, V.~A.~Khokhlova,
O.~A.~Sapozhnikov,~and~M.~R.~Bailey,~Noninvasive acoustic manipulation
of objects in a living
body,~#link("https://doi.org/10.1073/pnas.2001779117")[Proc. Natl. Acad. Sci. U.S.A.~#strong[117],~16848 (2020)].] <bib:ghanemNoninvasiveAcousticManipulation2020>

#block[\[45\] W.-C.~Lo, C.-H.~Fan, Y.-J.~Ho,
C.-W.~Lin,~and~C.-K.~Yeh,~Tornado-inspired acoustic vortex tweezer for
trapping and manipulating
microbubbles,~#link("https://doi.org/10.1073/pnas.2023188118")[Proc. Natl. Acad. Sci. U.S.A.~#strong[118],~e2023188118 (2021)].] <bib:loTornadoinspiredAcousticVortex2021a>

#block[\[46\] A.~Del Campo~Fonseca, C.~Glück, J.~Droux, Y.~Ferry, C.~Frei, S.~Wegener,
B.~Weber, M.~El~Amki,~and~D.~Ahmed,~Ultrasound trapping and navigation
of microrobots in the mouse brain
vasculature,~#link("https://doi.org/10.1038/s41467-023-41557-3")[Nat. Commun.~#strong[14],~5889 (2023)].] <bib:delcampofonsecaUltrasoundTrappingNavigation2023a>

#block[\[47\] Y.~Yang, Y.~Yang, D.~Liu, Y.~Wang, M.~Lu, Q.~Zhang, J.~Huang, Y.~Li,
T.~Ma, F.~Yan,~and~H.~Zheng,~In-vivo programmable acoustic manipulation
of genetically engineered
bacteria,~#link("https://doi.org/10.1038/s41467-023-38814-w")[Nat. Commun.~#strong[14],~3297 (2023)].] <bib:yangInvivoProgrammableAcoustic2023>

#block[\[48\] M.~Medany, L.~Piglia, L.~Achenbach,
S.~K.~Mukkavilli,~and~D.~Ahmed,~Model-based reinforcement learning for
ultrasound-driven autonomous
microrobots,~#link("https://doi.org/10.1038/s42256-025-01054-2")[Nat. Mach. Intell.~#strong[7],~1076 (2025)].] <bib:medanyModelbasedReinforcementLearning2025>

#block[\[49\] R.~Burstow~and~A.~N.~Pouliopoulos,~Evaluating the accuracy of acoustic
holograms for precise spatial targeting within the
brain,~#link("https://doi.org/10.1038/s44384-025-00031-8")[npj Acoust.~#strong[1],~24 (2025)].] <bib:burstowEvaluatingAccuracyAcoustic2025>

#block[\[50\] S.~Li, D.~Kim,
S.~Fan,~and~C.~Guo,~#link("https://doi.org/10.48550/arXiv.2511.04788")[Joint control of coherent transmission, reflection, and absorption]
(2025),~ arXiv:2511.04788 \[physics.optics\] .] <bib:liJointControlCoherent2025>

#block[\[51\] P.~Blanchard~and~E.~Brüning,~Inner product spaces and Hilbert
spaces,~in~#link("https://doi.org/10.1007/978-3-319-14045-2_15")[#emph[Mathematical Methods in Physics]],~Progress
in Mathematical Physics, Vol.~69~(Birkhäuser,~Cham,~2015)~pp.~213--225.] <bib:blanchard2015inner>

#block[\[52\] I.~Toftul, S.~Golat, F.~J.~Rodríguez-Fortuño, F.~Nori,
Y.~Kivshar,~and~K.~Y.~Bliokh,~#link("https://doi.org/10.48550/arXiv.2410.23670")[Radiation forces and torques in optics and acoustics]
(2025),~ arXiv:2410.23670 \[physics.optics\] .] <bib:toftulRadiationForcesTorques2025>

#block[\[53\] P.~L.~Marston~and~J.~H.~Crichton,~Radiation torque on a sphere caused by
a circularly-polarized electromagnetic
wave,~#link("https://doi.org/10.1103/PhysRevA.30.2508")[Phys. Rev. A~#strong[30],~2508 (1984)].] <bib:marstonRadiationTorqueSphere1984>

#block[\[54\] L.~Zhang~and~P.~L.~Marston,~Angular momentum flux of nonparaxial
acoustic vortex beams and torques on axisymmetric
objects,~#link("https://doi.org/10.1103/PhysRevE.84.065601")[Phys. Rev. E~#strong[84],~065601 (2011)].] <bib:zhangAngularMomentumFlux2011>

#block[\[55\] G.~T.~Silva, T.~P.~Lobo,~and~F.~G.~Mitri,~Radiation torque produced by
an arbitrary acoustic
wave,~#link("https://doi.org/10.1209/0295-5075/97/54003")[EPL~#strong[97],~54003 (2012)].] <bib:silvaRadiationTorqueProduced2012>

#block[\[56\] M.~Smagin, I.~Toftul, K.~Y.~Bliokh,~and~M.~Petrov,~Acoustic lateral
recoil force and stable lift of anisotropic
particles,~#link("https://doi.org/10.1103/PhysRevApplied.22.064041")[Phys. Rev. Appl.~#strong[22],~064041 (2024)].] <bib:smaginAcousticLateralRecoil2024>

#block[\[57\] P.~C.~Chaumet~and~A.~Rahmani,~Electromagnetic force and torque on
magnetic and negative-index
scatterers,~#link("https://doi.org/10.1364/OE.17.002224")[Opt. Express~#strong[17],~2224 (2009)].] <bib:chaumetElectromagneticForceTorque2009>

#block[\[58\] Y.~E.~Lee, K.~H.~Fung, D.~Jin,~and~N.~X.~Fang,~Optical torque from
enhanced scattering by multipolar plasmonic
resonance,~#link("https://doi.org/10.1515/nanoph-2014-0005")[Nanophotonics~#strong[3],~343 (2014)].] <bib:leeOpticalTorqueEnhanced2014>

#block[\[59\] M.~Nieto-Vesperinas,~Optical torque on small bi-isotropic
particles,~#link("https://doi.org/10.1364/OL.40.003021")[Opt. Lett.~#strong[40],~3021 (2015)].] <bib:nieto-vesperinasOpticalTorqueSmall2015>

#pagebreak()
= Supplemental Material
<supplemental-material>
== Statistics of expectation values
<statistics-of-expectation-values>
The probability density of expectation values of any Hermitian matrix
$upright(bold(Q))_alpha$ over some random input states forms a unimodal
non-negative B-spline (also called an M-spline) of degree $N - 2$, with
knots corresponding to the eigenvalues of the matrix:
$ f_(⟨upright(bold(Q))_alpha⟩) \( xi \) = \( N - 1 \) sum_(i = 1)^N frac(max \( 0 \, lambda_i - xi \)^(N - 2), product_(j eq.not i) \( lambda_i - lambda_j \)) . $
Examples of this distribution for some random Hermitian matrices are
given in #link(<fig:pdf>)[3].

#figure(image("source/pdf_mspline.pdf", width: 70.0%),
  caption: [
    Probability density function of expectation values of Hermitian
    matrices of size $N$. Comparison between $10^5$ random input states
    (in grey) and the theoretical M-spline (black curves).
  ]
)
<fig:pdf>

The expected value of $⟨upright(bold(Q))_alpha⟩$ is
$ bb(E) \( ⟨upright(bold(Q))_alpha⟩ \) = frac("tr" \( upright(bold(Q))_alpha \), N) \, $
and the variance is
$ "Var" \( ⟨upright(bold(Q))_alpha⟩ \) = frac(frac("tr" \( upright(bold(Q))_alpha^2 \), N) - \( frac("tr" \( upright(bold(Q))_alpha \), N) \)^2, N + 1) lt.eq frac(max \( \| lambda_1 \| \, \| lambda_N \| \)^2, N + 1) \, $
which goes to zero for large $N$, since $\| lambda_1 \|$ and
$\| lambda_N \|$ are physically bounded. The probability that the
expectation value on a random input state approaches the largest
eigenvalue of $upright(bold(Q))_alpha$ up to a small fixed parameter
$epsilon.alt$ is
$ bb(P) \( ⟨upright(bold(Q))_alpha⟩ > lambda_N - epsilon.alt \) = frac(epsilon.alt^(N - 1), product_(i = 1)^(N - 1) \( lambda_N - lambda_i \)) lt.eq \( frac(epsilon.alt, lambda_N - lambda_(N - 1)) \)^(N - 1) \, quad epsilon.alt < lambda_N - lambda_(N - 1) . $
The upper bound goes to zero for increasing $N$, if
$ lim_(N arrow.r + oo) N \( 1 - frac(epsilon.alt, lambda_N - lambda_(N - 1)) \) = + oo \, $
which is likely to hold, except if the spectrum of
$upright(bold(Q))_alpha$ shrinks to the top (i.e.,
$lambda_(N - 1) arrow.r lambda_N$) sufficiently fast. We conjecture that
this is unexpected without any symmetry in the system. It is worth
noting that the exact statistics of the distributions of eigenvalues of
$upright(bold(Q))_alpha$ have been studied by Brouwer, Frahm and
Beenakker \[#link(<bib:brouwer_quantum_1997>)[8]\], which may provide a good basis for a
more in-depth treatment of this likelihood. Analogue discussions were
recently performed in the case of the transmissivity distribution by
Wang and Guo \[#link(<bib:wangProbabilityDistributionCoherent2025>)[37]\].

== Further examples of collective manipulation of objects
<further-examples-of-collective-manipulation-of-objects>
#figure(image("source/supp_bi-obj.png"),
  caption: [
    Further examples of bi-objective optimization for which
    $⟨upright(bold(Q))_(Delta upright(bold(r))_1)⟩ = ⟨upright(bold(Q))_(Delta upright(bold(r))_2)⟩$.
    As in #link(<fig:subfigs>)[2]b, blue arrows represent the objectives
    and black arrows represent the realized Pareto-optimal net
    equal-projection forces on the scatterers.
  ]
)
<fig:supp-biobj>
