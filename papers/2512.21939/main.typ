// Typst format conversion of arXiv:2512.21939v1 under CC BY 4.0.
#set page(paper: "a4", margin: 20mm, numbering: "1")
#set text(font: "Libertinus Serif", size: 10.5pt)
#set par(justify: true)
#set heading(numbering: "1.1")
#set math.equation(numbering: "(1)")
#align(center)[
  #text(size: 16pt, weight: "bold")[Interaction-Induced Spiral Motion and Breathing Dynamics of Néel Skyrmions in Ferromagnetic Thin Films]
  #v(5pt)
  M. Al Busaidi, F. Al Ma'Mari, and R. Sbiaa

  Department of Physics, College of Science, Sultan Qaboos University, P.O. Box 36, PC 123, Muscat, Oman

  #link("mailto:rachid@squ.edu.om")

  #link("https://arxiv.org/abs/2512.21939v1")[arXiv:2512.21939v1] · #link("https://creativecommons.org/licenses/by/4.0/")[CC BY 4.0]
]

*Abstract.* Magnetic skyrmions exhibit particle-like stability and rich dynamical
behaviour arising from their topological nature, making them promising
building blocks for future spintronic devices. In this work, we
investigate the interaction dynamics of two Néel-type skyrmions in an
ultrathin ferromagnetic film through a combined analytical and numerical
approach. Full micromagnetic simulations reveal that when the initial
separation exceeds twice the skyrmion radius, the pair undergoes a
repulsive interaction leading to an outward spiral trajectory whose
radial and angular components depend sensitively on the Gilbert damping,
consistent with particle-like models of skyrmion motion. The simulations
further show a two-component oscillatory behavior in the out-of-plane
magnetization: a fast intrinsic breathing mode superimposed on a slower
interaction-induced modulation. Using Thiele collective-coordinate
model, an expression for the radial drift, angular decay, and
logarithmic growth of the separation distance is derived. The analytical
predictions show excellent agreement with numerical results, confirming
the exponential form of the long-range interaction potential. A
continuum micromagnetic analysis of the skyrmion tail explains the
origin of the exponential decay and its role in governing the
interaction strength. Together, these findings provide a unified
framework for understanding spiral motion, breathing dynamics, and
long-range repulsion in interacting skyrmion systems, offering insights
relevant for multi-skyrmion information carriers and collective
skyrmion-based devices.

= Introduction
<introduction>
Magnetic skyrmions are nanoscale, topologically protected spin textures
that arise in chiral and ultrathin ferromagnets due to the competition
between exchange interaction, anisotropy, and Dzyaloshinskii--Moriya
interaction (DMI)~@Fert2017_NatRevMat_Skyrmions@Nagaosa2013_NatNanotech.
Their particle-like stability, small size, and efficient current-driven
mobility make them promising candidates for next-generation spintronic
devices, including racetrack
memories~@Tomasello2014_SciRep_SkyrmionRacetrack@Song2017_SkyrmionRacetrack@Bessarab2018_SkyrmionLifetime@Huang2020_NatElectron_SkyrmionSynapse@He2023_NanoLett_SkyrmionMemory@Pham2024_Science_SkyrmionSAF,
neuromorphic
architectures~@Zhang2018_NanoLett_SkyrmionNeuron@Song2020_NatElectron_SkyrmionSynapses@Yu2020NanoscaleAdv@Lone2024_Nanoscale_MultilayerSpintronic@Verma2025_APL_FieldFreeSkyrmionNN@Aslam2025_ACSAELM_SkyrmionMemristor,
and logic
components~@Zhang2015_SciRep_SkyrmionLogic@Mankalale2019_IEEE_SkyLogic@Yu2020NanoscaleAdv@Sisodia2022_PRApp_SkyrmionLogic@MousaviCheghabouri2024_AdvTheorySimul_SkyrmionLogic@Belrhazi2024_ACSApplMater_SkyrmionLogic@Pan2024_PRResearch_SkyrmionQubits.
Because skyrmions behave as emergent quasiparticles, understanding their
dynamical interaction laws is essential for predicting collective
phenomena, collision processes, and the formation of composite states
such as
biskyrmions!~@Yu2014_NatCommun_Biskyrmions@Song2023_SciAdv_Biskyrmions@AlSaidi2025_MatTodayE_SkyrmionBiskyrmion
or skyrmion
bags~@Tang2021_NatNanotech_SkyrmionBundles@Bo2023_PRB_SkyrmionBags@Wang2023_PRB_ParticleContinuumSkyrmions.

The interaction between skyrmions plays a central role in their
collective dynamics. While isolated skyrmions exhibit gyrotropic motion
dominated by the Magnus force, skyrmion pairs experience additional
forces arising from their mutual distortion and long-range tail
overlap~@Capic2020_JPhysCondMat_SkyrmionInteraction@Ross2021_SkyrmionInteractions.
Several studies have analyzed the effective skyrmion--skyrmion
potential, revealing regimes of repulsion, attraction, or bound-state
formation depending on chirality, polarity, and DMI
strength~@Capic2020_JPhysCondMat_SkyrmionInteraction@Ross2021_SkyrmionInteractions@Gobel2019_Biskyrmions.
These interactions are also closely tied to the internal eigenmodes of
skyrmions---most notably the breathing mode, in which the skyrmion
radius exhibits high-frequency
oscillations~@Kim2014_PRB_BreathingSkyrmionDots@McKeever2019_PRB_BreathingDynamics@Garanin2020_BreathingMode@Mochizuki2012_PRL_SkyrmionSpinWave.
Such breathing dynamics not only influence the stability of individual
skyrmions but also affect the radial motion and collision outcomes of
skyrmion
pairs~@Kim2014_PRB_BreathingSkyrmionDots@McKeever2019_PRB_BreathingDynamics.

Despite extensive theoretical efforts, a complete and unified
description of the skyrmion--skyrmion interaction dynamics---linking
analytical models to full micromagnetic behavior---remains limited. The
Thiele equation provides a powerful reduced description of skyrmion
motion as a rigid particle subject to gyrotropic, dissipative, and
interaction
forces~@Thiele1973_PRL_DomainMotion@Lin2013_PRB_ParticleModel. However,
it cannot capture internal deformations or high-frequency breathing
oscillations, which become significant during close-range
interactions~@McKeever2019_PRB_BreathingDynamics@Garanin2020_BreathingMode.
Conversely, continuum micromagnetic theory offers analytical insight
into the asymptotic form of the skyrmion tail and the exponential decay
of the interaction
potential~@Ross2021_SkyrmionInteractions@Capic2020_JPhysCondMat_SkyrmionInteraction,
while large-scale micromagnetic simulations reproduce the full nonlinear
dynamics, including spiral trajectories, damping-induced drift, and
complex collision
behavior~@Shi2023_JPhysD_SkyrmionCollision@Reichhardt2020_arXiv_MagnusClusters@Lin2013_PRB_ParticleModel@Buttner2015_NatPhys_SkyrmionDynamics.

In this work, we combine three complementary methodological frameworks
to study the interaction, dynamics, and stability of two skyrmions in an
ultrathin ferromagnetic film: (i) full micromagnetic simulations using
Landau--Lifshitz--Gilbert (LLG)
equation~@Vansteenkiste2014_AIPAdv_MuMax3, (ii) the Thiele
collective-coordinate model to describe radial and angular motion
analytically~@Thiele1973_PRL_DomainMotion@Lin2013_PRB_ParticleModel, and
(iii) a continuum micromagnetic field-theory approach to obtain
closed-form expressions for the long-distance skyrmion
tail~@Capic2020_JPhysCondMat_SkyrmionInteraction@Ross2021_SkyrmionInteractions.
By integrating these approaches, we establish a comprehensive multiscale
description connecting microscopic spin interactions to emergent
quasiparticle behavior.

Our results demonstrate that skyrmion pairs with identical polarity and
opposite chirality and helicity interact repulsively at distances
greater than twice the skyrmion radius, generating spiral trajectories
whose radial expansion is strongly dependent on the Gilbert damping
parameter, in agreement with previous work on Magnus-dominated particle
motion~@Lin2013_PRB_ParticleModel@Ross2021_SkyrmionInteractions.
Moreover, we show that the out-of-plane magnetization exhibits a
two-component oscillatory pattern: a fast breathing oscillation
superimposed on a slow spiral-induced
modulation~@Kim2014_PRB_BreathingSkyrmionDots@Garanin2020_BreathingMode@McKeever2019_PRB_BreathingDynamics@Mochizuki2012_PRL_SkyrmionSpinWave.
Based on Thiele model, we developed an analytical prediction which shows
an excellent agreement with micromagnetic simulations, confirming the
logarithmic increase of separation distance over time and the
exponential form of the interaction
potential~@Capic2020_JPhysCondMat_SkyrmionInteraction@Ross2021_SkyrmionInteractions.
This unified framework provides valuable insights into
skyrmion--skyrmion collisions, stability mechanisms, and the emergence
of breathing dynamics in interacting skyrmion systems.

= Methodology
<methodology>
The theoretical description of skyrmion interactions in this work is
built on three hierarchically connected models---the full
Landau--Lifshitz--Gilbert (LLG) equation, the Thiele
collective-coordinate formalism, and the continuum micromagnetic field
theory---each capturing different levels of physical
detail~@Fert2017_NatRevMat_Skyrmions@Nagaosa2013_NatNanotech@Ross2021_SkyrmionInteractions.
The starting point is the LLG equation,
$ frac(partial upright(bold(m)), partial t) = - gamma thin upright(bold(m)) times upright(bold(H))_(upright(e f f)) + alpha thin upright(bold(m)) times frac(partial upright(bold(m)), partial t) $
which provides a complete, spatially resolved description of the
magnetization dynamics $upright(bold(m)) \( upright(bold(r)) \, t \)$ in
ultrathin ferromagnetic films. The parameters $gamma$ and $alpha$ are
respectively the gyromagnetic ratio and damping constant. The effective
field derives from the total micromagnetic energy through
$ upright(bold(H))_(upright(e f f)) = - frac(1, mu_0 M_s) thin frac(delta E, delta upright(bold(m))) $
and
$ E = E_(upright(e x)) + E_(upright(a n i)) + E_(upright(D M I)) + E_(upright(Z)) + E_(upright(d e m)) $

The competing interactions give rise to the skyrmion profile. The term
$E_(upright(e x)) = A \( nabla upright(bold(m)) \)^2$ is the exchange
energy that gives rise to the skyrmion profile. The term
$E_(upright(a n i)) = K_u \( 1 - m_z^2 \)$ is the anisotropy energy that
stabilizes the out-of-plane alignment of magnetic moments.
$E_(upright(D M I)) = D #h(-1em) [m_z thin nabla #h(-1em) dot.op #h(-1em) upright(bold(m))_perp - upright(bold(m))_perp #h(-1em) dot.op #h(-1em) nabla m_z]$
is the interfacial DMI which imposes a fixed chirality and sets the
handedness of the Néel wall, while the demagnetizing energy introduces
long-range dipolar
interactions~@Fert2017_NatRevMat_Skyrmions@Nagaosa2013_NatNanotech. In
this study, the saturation magnetization $M_s$, exchange stiffness $A$,
anisotropy constant $K_u$ and iDMI were chosen to be 600 kA/m, 7 pJ/m,
0.65 MJ/$m^3$ and 2 mJ/$m^2$, respectively
multilayers~@Fert2017_NatRevMat_Skyrmions@Woo2016_NatMat_RoomTempSkyrmions@AlSubhi2019_CoNi@Sbiaa2016_CoNiCoPt_FMR.
Solving the LLG equation fully captures skyrmion deformation mechanisms
such as breathing, shrinking, shearing, and skyrmion--skyrmion merging,
which become crucial at small separations where the cylindrical symmetry
of each skyrmion breaks
down~@Shi2023_JPhysD_SkyrmionCollision@Brearton2020_arXiv_SkyrmionInteractions@Gobel2019_Biskyrmions.

To complement the full-field LLG description, we adopt the Thiele
collective-coordinate model, which assumes that a skyrmion behaves
approximately as a rigid quasiparticle whose dynamics are dominated by
the translational mode. Under this assumption, integrating the LLG
equation over space yields the Thiele equation,
$ upright(bold(G)) times upright(bold(v)) + alpha D thin upright(bold(v)) + nabla U \( r \) = 0 \, $
where $upright(bold(v)) = dot(upright(bold(X)))$ is the skyrmion
velocity, $upright(bold(G)) = - 4 pi Q thin hat(upright(bold(z)))$ is
the gyrovector reflecting the topology ($Q = plus.minus 1$), and $D$ is
the dissipative tensor set by the internal magnetization
gradients~@Thiele1973_PRL_DomainMotion@Lin2013_PRB_ParticleModel.
Writing the equation in polar form gives
$ - G dot(phi.alt) + alpha D dot(r) & = F \( r \)\
G dot(r) + alpha D r dot(phi.alt) & = 0 $ with
$F \( r \) = - U' \( r \)$ is the skyrmion--skyrmion interaction force.
These relations explicitly show that the radial force $F \( r \)$ drives
angular motion through the gyrotropic term, producing spiral
trajectories~@Lin2013_PRB_ParticleModel@Reichhardt2020_arXiv_MagnusClusters.
The model is accurate when the skyrmion retains its shape (moderate
separations or low velocities) but becomes unreliable when strong
deformations occur, such as in short-range attraction ($r lt.tilde 2 R$)
or during skyrmionium
formation~@Gobel2019_Biskyrmions@Ross2021_SkyrmionInteractions@Capic2020_JPhysCondMat_SkyrmionInteraction.

Finally, to determine the static structure, size, and energetic
stability of isolated and interacting skyrmions, we use the continuum
micromagnetic field theory in which the magnetization
$upright(bold(s)) \( upright(bold(r)) \)$ is treated as a continuous
unit vector
field~@Ross2021_SkyrmionInteractions@Capic2020_JPhysCondMat_SkyrmionInteraction.
Minimizing the energy functional,
$ E = integral d^2 r thin #scale(x: 180%, y: 180%)[\[] A \( nabla upright(bold(s)) \)^2 + K_(upright(e f f)) \( 1 - s_z^2 \) +\
D #scale(x: 120%, y: 120%)[\(] s_z nabla #h(-1em) dot.op #h(-1em) upright(bold(s))_perp - upright(bold(s))_perp #h(-1em) dot.op #h(-1em) nabla s_z #scale(x: 120%, y: 120%)[\)] + E_(upright(Z)) + E_(upright(d e m)) #scale(x: 180%, y: 180%)[\]] $
yields the Euler--Lagrange equations governing the radial skyrmion
profile $s_z \( r \)$ and the characteristic domain-wall width
$Delta = sqrt(A \/ K_(upright(e f f)))$. The continuum model also
provides the stability condition
$D < D_c = 4 / pi sqrt(A K_(upright(e f f)))$ and predicts how the
skyrmion radius responds to changes in material
parameters~@Fert2017_NatRevMat_Skyrmions@Ross2021_SkyrmionInteractions.
This establishes the energetic origin of the interaction potential
$U \( r \)$ used in the Thiele model and explains why only skyrmions
with radii close to the equilibrium radius remain dynamically stable.
Altogether, these three frameworks form a unified multiscale
methodology: the continuum model determines the intrinsic skyrmion
structure, the Thiele model captures near-rigid collective motion, and
the LLG equation resolves the full nonlinear dynamics, including
deformation, breathing, repulsion, attraction and skyrmionium
formation~@Gobel2019_Biskyrmions@Shi2023_JPhysD_SkyrmionCollision@Brearton2020_arXiv_SkyrmionInteractions.

= Results and Discussion
<results-and-discussion>
== Numerical Simulation
<numerical-simulation>
In numerical simulations, we investigate the dynamics of two interacting
skyrmions that share the same polarity but possess opposite chirality.
Both skyrmions have an identical radius of $R = 30 med upright(n m)$,
and the initial separation between their centers is set to
$r = 64 med upright(n m)$. The interaction is examined in the absence of
any external stimuli, such as magnetic fields or spin-polarized
currents, so the initial velocity for both of them is the same. In the
absence of external fields, the dynamical behavior of skyrmions depends
strongly on how many of them are present. A single skyrmion is
influenced only by its initial configuration and its interaction with
the system boundaries, whereas when multiple skyrmions exist, their
mutual interactions must also be taken into account. The simplest
non-trivial case is a system containing two skyrmions, which is the
situation considered in this study. Our initial observation is that,
within this regime, the skyrmions experience a repulsive interaction,
causing their separation distance to increase over time, in agreement
with previous studies of skyrmion--skyrmion repulsion at large
separations~@Capic2020_JPhysCondMat_SkyrmionInteraction@Reichhardt2020_arXiv_MagnusClusters@Shi2023_JPhysD_SkyrmionCollision@Ross2021_SkyrmionInteractions.

#figure(image("source/FIG1.png", width: 100.0%),
  caption: [
    Spiral motion of two skyrmions for different damping values. (a),
    (b) and (c) are snapshots taken at different times for
    $alpha = 0 \, 0.02$ and $0.1$, respectively
  ]
)
<fig:FIG1.png>

Fig.~@fig:FIG1.png shows the dynamics of two interacting skyrmions
initially separated by a distance $r > 2 R = 64 med upright("nm")$. In
the presence of damping, the pair follows a spiral trajectory rather
than a straight or circular path, arising from the interplay between the
Magnus force and the repulsive interaction associated with their
identical polarity, as captured by particle-level descriptions of
skyrmion
dynamics~@Thiele1973_PRL_DomainMotion@Lin2013_PRB_ParticleModel@Reichhardt2020_arXiv_MagnusClusters.

In @fig:FIG1.png[](a), the undamped limit ($alpha = 0$) produces a
motion that is almost purely circular, dominated by the gyrovector term;
in an ideal lossless system, the skyrmions would continue rotating
indefinitely. At intermediate damping ($alpha = 0.02$), shown in
@fig:FIG1.png[](b), the rotation persists for a longer duration and
the increase in separation occurs more gradually. In contrast,
@fig:FIG1.png[](c) shows that strong damping ($alpha = 0.1$) rapidly
suppresses the angular motion while significantly enhancing the outward
radial expansion of the pair, consistent with previous reports of
damping-controlled spiral
trajectories~@Reichhardt2020_arXiv_MagnusClusters@Lin2013_PRB_ParticleModel@Buttner2015_NatPhys_SkyrmionDynamics.

As the dynamics evolve, damping reduces the skyrmion velocity by
weakening both the gyrotropic force and the skyrmion--skyrmion
interaction force. This reduction leads to a gradual increase in the
separation distance between the
skyrmions~@Reichhardt2020_arXiv_MagnusClusters@Lin2013_PRB_ParticleModel.
The force directions governing this behavior are depicted schematically
in Fig.~@fig:spiral_alpha. For both skyrmions, the gyrovector points
into the film along the $- z$ axis because the topological charge
satisfies $Q > 0$. The right skyrmion moves along $- y$ while the left
skyrmion moves along $+ y$. According to the right-hand rule, the Magnus
force deflects the right skyrmion to the left and the left skyrmion to
the right. Combined with the long-range repulsive force between the
skyrmions, this deflection produces the characteristic clockwise spiral
trajectory observed in the
simulations~@Capic2020_JPhysCondMat_SkyrmionInteraction@Brearton2020_arXiv_SkyrmionInteractions@Ross2021_SkyrmionInteractions@Reichhardt2020_arXiv_MagnusClusters@Lin2013_PRB_ParticleModel.

#figure(image("source/clockwise.png", width: 90.0%),
  caption: [
    Schematic illustration of the forces, velocity and damping
    directions for two interacting skyrmions.
  ]
)
<fig:spiral_alpha>

#figure(image("source/FIG3.png", width: 100.0%),
  caption: [
    Time evolution of the angular position for two interacting skyrmions
    at different damping values $alpha$.
  ]
)
<fig:FIG3>

The damping dependence of the rotation is quantified in Fig.~@fig:FIG3,
which shows the time evolution of the angular position for several
damping values. The angular displacement increases approximately
linearly with time, confirming a nearly constant angular velocity during
the spiral motion. Lower damping ($alpha = 0$ and $alpha = 0.001$)
results in higher angular velocities, whereas higher damping
($alpha = 0.02$ and $alpha = 0.1$) significantly suppresses the rotation
rate, as expected from the Thiele formalism and previous numerical
studies~@Thiele1973_PRL_DomainMotion@Lin2013_PRB_ParticleModel@Reichhardt2020_arXiv_MagnusClusters.

#figure(image("source/spiralxy.png", width: 100.0%),
  caption: [
    Spiral trajectory of one skyrmion in the $x$--$y$ plane for
    $alpha = 0.1$.
  ]
)
<fig:spiral_plane>

The trajectory shown in Fig.~4 corresponds to the in-plane magnetization
components of a single isolated Néel skyrmion plotted in the
$\( m_x \, m_y \)$ plane. The motion forms a clockwise spiral in which
$m_x$ oscillates noticeably while $m_y$ remains nearly constant. This
behavior arises from the intrinsic gyrotropic precession of a skyrmion
with topological charge $Q = 1$, for which the gyrovector
$G = - 4 pi Q < 0$ enforces clockwise rotation. Because a Néel skyrmion
has a predominantly radial in-plane structure, the $m_x$ component is
the one most sensitive to the periodic deformation associated with
gyrotropic motion, whereas $m_y$ varies only weakly. The slow inward
contraction of the spiral is caused by Gilbert damping, which gradually
reduces the amplitude of the gyrotropic orbit in the absence of external
forces or skyrmion--skyrmion interactions.
~@Capic2020_JPhysCondMat_SkyrmionInteraction@Brearton2020_arXiv_SkyrmionInteractions@Reichhardt2020_arXiv_MagnusClusters@Lin2013_PRB_ParticleModel.

#figure(image("source/FIG5.png", width: 100.0%),
  caption: [
    Breathing and long-period oscillations of the skyrmion pair during
    spiral motion at $alpha = 0$.
  ]
)
<fig:FIG5>

In Fig.~@fig:FIG5, for $alpha = 0$, the out-of-plane magnetization
$m_z \( t \)$ exhibits a two-component oscillatory behavior arising from
the conservative skyrmion--skyrmion interaction. In the short-time
dynamics shown in @fig:FIG5[](a) which is a zoom area in small
portion of @fig:FIG5[](b), the signal exhibits a high-frequency
breathing oscillation of small amplitude. This behaviour originates from
the rapid periodic expansion and contraction of the skyrmion radius
$R \( t \)$ due to the interaction force between the two skyrmions. As
the radius varies, the spin configuration adjusts to accommodate the
change in size, which modifies the out-of-plane component through the
relation $m_z \( r \) = cos theta \( r \)$. This intrinsic breathing
mode results from the internal exchange--DMI--anisotropy energy balance
and appears at a frequency of about $3.2 med upright(G H z)$, consistent
with previous studies of skyrmion breathing
dynamics~@Kim2014_PRB_BreathingSkyrmionDots@Garanin2020_BreathingMode@McKeever2019_PRB_BreathingDynamics@Mochizuki2012_PRL_SkyrmionSpinWave.

Over longer timescales, as shown in @fig:FIG5[](b), a low-frequency
modulation of about $4 med upright(M H z)$ becomes visible, generating a
large envelope superimposed on the fast oscillation. This slow component
originates from the gradual spiral motion of the skyrmion pair: as their
separation slowly changes along the spiral orbit, the average value of
$m_z$ is modulated, producing a large-amplitude waveform. Because the
damping vanishes ($alpha = 0$), no energy is dissipated, and both the
fast breathing oscillation and the slow spiral-motion modulation persist
without decay. The pair completes a full $2 pi$ reorientation with a
characteristic period of $T approx 250 thin upright("ns")$. Throughout
this cycle, the out-of-plane magnetization of each skyrmion displays a
pronounced oscillatory response: the core value $m_z$ varies between
approximately $- 0.66$ and $- 0.76$ as the skyrmions rotate from a
horizontal alignment to a vertical one. The resulting asymmetry between
the upper and lower turning points reflects the anharmonic nature of the
skyrmion--skyrmion potential and the nonuniform rate at which the spin
texture reorganizes during the
motion~@McKeever2019_PRB_BreathingDynamics@Garanin2020_BreathingMode.

In summary, $m_z \( t \)$ signal contains two well-separated
frequencies: a fast breathing mode set by the intrinsic eigenfrequency
of an individual skyrmion, and a slow modulation associated with the
long-period spiral motion of the skyrmion
pair~@Kim2014_PRB_BreathingSkyrmionDots@Garanin2020_BreathingMode@McKeever2019_PRB_BreathingDynamics@Mochizuki2012_PRL_SkyrmionSpinWave.

#figure(image("source/0.001.jpeg", width: 100.0%),
  caption: [
    Breathing and long-period oscillations of the skyrmion pair during
    spiral motion at $alpha = 0.001$.
  ]
)
<fig:FIG6>

In Fig.~@fig:FIG6, when a small but finite damping is present
($alpha = 0.001$), the high-frequency breathing mode gradually decreases
in amplitude and becomes fully damped after approximately
$30 med upright(n s)$ \[@fig:FIG6[](a)\]. However, the long-period
oscillation associated with the skyrmion spiral motion remains clearly
visible and persists over the full simulation time
\[@fig:FIG6[](b)\]. This behaviour is consistent with the picture
that Gilbert damping primarily affects the internal eigenmodes, while
the slow spiral motion is governed by the balance of gyrotropic and
interaction forces captured by the Thiele
equation~@Thiele1973_PRL_DomainMotion@Lin2013_PRB_ParticleModel@Buttner2015_NatPhys_SkyrmionDynamics.

#figure(image("source/FIG6.png", width: 100.0%),
  caption: [
    The out-of-plane magnetization $m_z$ versus time for $alpha = 0$,
    $alpha = 0.001$, and $alpha = 0.02$.
  ]
)
<fig:FIG7>

In Fig.~@fig:FIG7, the short-time evolution of the out-of-plane
magnetization $m_z \( t \)$ is shown for two interacting skyrmions under
different damping conditions, $alpha = 0$, $alpha = 0.001$, and
$alpha = 0.02$. In all cases, the system exhibits a high-frequency
breathing oscillation with $f approx 3.2 med upright(G H z)$. The
frequency is essentially the same because it is set by the intrinsic
skyrmion eigenmode rather than by damping. For $alpha = 0$, the
oscillation maintains a slightly larger amplitude with an almost
perfectly periodic waveform, as no energy is lost during the motion.
When a very small damping is introduced ($alpha = 0.001$), the breathing
frequency remains nearly unchanged, but the amplitude decreases
slightly. Overall, the curves demonstrate that the breathing mode is an
intrinsic, high-frequency component of skyrmion dynamics, while damping
primarily influences the amplitude rather than the
frequency~@Garanin2020_BreathingMode@McKeever2019_PRB_BreathingDynamics@Kim2014_PRB_BreathingSkyrmionDots@Mochizuki2012_PRL_SkyrmionSpinWave.

== Theoretical Arguments Supporting Numerical Results
<theoretical-arguments-supporting-numerical-results>
We start from Eq.~(6) and rewrite the velocity in polar coordinates
following the standard collective-coordinate treatment of skyrmion
motion~@Thiele1973_PRL_DomainMotion@Lin2013_PRB_ParticleModel. The unit
vectors $hat(upright(bold(r)))$, $hat(bold(phi.alt))$ and
$hat(upright(bold(z)))$ are linked through
$ hat(upright(bold(z))) times hat(upright(bold(r))) & = hat(bold(phi.alt))\
hat(upright(bold(z))) times hat(bold(phi.alt)) & = - hat(upright(bold(r))) $

Substituting into the Thiele equation and separating components gives
the radial and azimuthal components as expressed in the two following
equations (12) and (13), respectively.

$ - G dot(phi.alt) + alpha D dot(r) = F \( r \) $
$ G dot(r) + alpha D r dot(phi.alt) = 0 $ where
$F \( r \) = - frac(d U, d r)$ is the radial interaction force. From
these two equations, the radial velocity can be expressed as

$ dot(r) = frac(alpha D, G^2 + \( alpha D \)^2) thin F \( r \) $ Since
the denominator is constant, $dot(r)$ is thus proportional to
$alpha D thin F \( r \)$. For $F \( r \) < 0$ case, the radial velocity
becomes negative and the spiral motion is then inward. In contrast, if
$F \( r \) > 0$, the spiral motion is outward.

The radial motion requires a material with a non-zero damping constant.
Therefore, increasing $alpha$ increases the radial velocity, as revealed
by simulation results and reported by analytical
predictions~@Lin2013_PRB_ParticleModel@Reichhardt2020_arXiv_MagnusClusters.

#heading(level: 2, numbering: none)[Integrating the Radial Motion]
<integrating-the-radial-motion>
Equation 12 can be written as

$ dot(r) = C thin F \( r \) $ where C is equal to
$alpha D \/ #scale(x: 120%, y: 120%)[\(] G^2 + \( alpha D \)^2 #scale(x: 120%, y: 120%)[\)]$.
This gives the separable differential equation
$ frac(d r, F \( r \)) = C thin d t $ With the initial condition
$r \( 0 \) = r_0$, the motion of two skyrmions away from each other can
be described by the autonomous equation
$ integral_(r_0)^(r \( t \)) frac(d r', F \( r' \)) = C t $

In our system, the interaction force decays exponentially at large
separations, which leads to a logarithmic increase of the
skyrmion--skyrmion distance over time, consistent with analytical forms
of the interaction potential reported in
Refs.~@Capic2020_JPhysCondMat_SkyrmionInteraction@Ross2021_SkyrmionInteractions@Lin2013_PRB_ParticleModel.

#heading(level: 2, numbering: none)[Angular Velocity]
<angular-velocity>
Solving the azimuthal component gives
$ dot(phi.alt) = - frac(G, r [G^2 + \( alpha D \)^2]) F \( r \) $ The
sign of $dot(phi.alt)$ is determined by $G prop - Q$, which leads to
clockwise (counterclockwise) rotation for $Q > 0$ ($Q < 0$). These
results are in agreement with the handedness of skyrmion trajectories in
chiral magnets~@Nagaosa2013_NatNanotech@Lin2013_PRB_ParticleModel. Its
magnitude depends on $F \( r \) \/ r$ and increases as $alpha$ is
reduced (Fig.~@fig:FIG3).

#heading(level: 2, numbering: none)[Spiral Trajectory]
<spiral-trajectory>
Dividing the two sides of Eq. (16) by $dot(r)$ and integrating them from
$phi.alt_0$ to $phi.alt$ gives

$ phi.alt \( r \) = phi.alt_0 - frac(G, alpha D) ln (r / r_0) $

Equivalently,
$ r \( phi.alt \) = r_0 thin exp #h(-1em) [- frac(alpha D, G) (phi.alt - phi.alt_0)] $
showing that each rotation decreases (or increases) the radius
exponentially. For a full $2 pi$ rotation one obtains
$ r \( 2 pi \) = r_0 exp #h(-1em) (- 2 pi frac(alpha D, G)) $ which
provides the spiral contraction (or expansion) rate per cycle, in
qualitative agreement with the trajectories observed in
Fig.~@fig:spiral_plane and the particle-based analysis of
Ref.~@Lin2013_PRB_ParticleModel.

#figure(image("source/mathe.png", width: 70.0%),
  caption: [
    Spiral trajectory of the skyrmion obtained from the analytical
    Eq.~(26), illustrating the gradual radial contraction with
    increasing rotation angle.
  ]
)
<fig:spiral_analytic>

#heading(level: 2, numbering: none)[Long-Distance Behavior of Skyrmions]
<long-distance-behavior-of-skyrmions>
To analyze the asymptotic behavior of isolated skyrmions, we used the
reduced micromagnetic functional in which dipolar interactions, external
fields, and the Dzyaloshinskii--Moriya interaction become negligible at
large
distances~@Capic2020_JPhysCondMat_SkyrmionInteraction@Ross2021_SkyrmionInteractions.
In this limit, the energy is reduced to
$ E = integral d^2 r thin [A \( nabla upright(bold(s)) \)^2 + K_(upright(e f f)) (1 - s_z^2)] $<eq:reduced_energy>
where $upright(bold(s)) = \( s_x \, s_y \, s_z \)$ is the unit
magnetization vector.

Far from the skyrmion core, the magnetisation is nearly uniform; i.e,
$s_x \, s_y lt.double 1$ and $s_z approx 1$, which gives the small-angle
approximation Substituting into
Eq.~@eq:reduced_energy and keeping terms
up to second order leads to
$ E = integral d^2 r [A #h(-1em) (\( nabla s_x \)^2 + \( nabla s_y \)^2) + K_(upright(e f f)) / 2 \( s_x^2 + s_y^2 \)] $<eq:quadratic_energy>
which coincides with the quadratic exchange--anisotropy functional used
in
Refs.~@Capic2020_JPhysCondMat_SkyrmionInteraction@Ross2021_SkyrmionInteractions.
Variation of Eq.~@eq:quadratic_energy
yields the Helmholtz-type equation $ -2 A nabla^2 s_i + K_"eff" s_i = 0, quad i = x, y $ <eq:Helmholtz> describing small transverse fluctuations on top of a
uniform ferromagnetic
background~@Nagaosa2013_NatNanotech@Ross2021_SkyrmionInteractions. For a
circular Néel-type structure we use
$ s_x = S_perp \( r \) cos phi \, #h(2em) s_y = S_perp \( r \) sin phi $
which gives the radial equation
$ S''_perp \( r \) + 1 / r S'_perp \( r \) - (1 / r^2 + frac(K_(upright(e f f)), 2 A)) S_perp \( r \) = 0 $<eq:radial>

Defining the decay length $delta_k$ as $sqrt(A \/ K_(upright(e f f)))$,
Eq.~@eq:radial becomes the modified Bessel
equation with solution
$ S_perp \( r \) = C_1 I_1 #h(-1em) (r / delta_k) + C_2 K_1 #h(-1em) (r / delta_k) $
The physical decay requires $C_1 = 0$, giving the long-distance tail
$ s_perp \( r \) = C thin K_1 #h(-1em) (r / delta_k) $<eq:tail_solution>
with asymptotic limits
$ r lt.double delta_k & : quad s_perp \( r \) tilde.op 1 / r\
r gt.double delta_k & : quad s_perp \( r \) tilde.op C sqrt(frac(pi delta_k, 2 r)) exp #h(-1em) (- r / delta_k) $
The overlap between two skyrmion tails therefore decreases as
$exp \( - r \/ delta_k \)$, implying an exponentially decaying
long-range skyrmion--skyrmion interaction, as shown in Fig.~@fig:kdecay
and reported in
Refs.~@Capic2020_JPhysCondMat_SkyrmionInteraction@Ross2021_SkyrmionInteractions.

#figure(image("source/k.png", width: 100.0%),
  caption: [
    Exponential decay of the out-of-plane spin component
    $s_perp \( r \)$, consistent with the asymptotic form obtained from
    Eq.~(24).
  ]
)
<fig:kdecay>

= Conclusion
<conclusion>
In this work, we presented a numerical and analytical study of the
interaction dynamics of two Néel skyrmions in an ultrathin ferromagnetic
film. Micromagnetic simulations revealed that skyrmion pairs with
identical polarity and opposite chirality exhibit a long-range repulsive
interaction when their initial separation exceeds twice the skyrmion
radius. This repulsion drives an outward spiral motion whose angular and
radial components depend sensitively on the Gilbert damping constant. In
the undamped limit, the dynamics are dominated by the gyrotropic force,
producing nearly circular orbits accompanied by a persistent
high-frequency breathing mode. When damping is introduced, the angular
velocity decreases, the radial drift increases, and the breathing
oscillations are gradually suppressed, leaving a slow modulation
associated with the evolving skyrmion separation.

To interpret these results, we used the Thiele collective-coordinate
model, which accurately captures the spiral trajectories, the
logarithmic increase of the separation distance, and the damping
dependence of both radial and angular velocities. The analytical
expressions derived from the Thiele equation show excellent agreement
with the simulated trajectories. Furthermore, a continuum micromagnetic
analysis of the skyrmion tail demonstrates that the in-plane
magnetization decays rapidly at large distances, explaining the
exponential form of the long-range interaction potential observed in
both the numerical and analytical models.

Overall, this multiscale approach establishes a unified physical picture
linking skyrmion topology, long-range repulsion, gyrotropic motion, and
internal breathing dynamics. The insights of the study provide a
fundamental understanding of skyrmion--skyrmion interactions and offer
guidance for designing future skyrmion-based information carriers,
devices relying on collective skyrmion motion, and architectures where
controlled multi-skyrmion dynamics are essential.

#bibliography("references.bib", style: "ieee", title: [References])
