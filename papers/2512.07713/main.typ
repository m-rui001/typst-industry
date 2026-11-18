// Typst format conversion of arXiv:2512.07713v1 under CC BY 4.0.
#set page(paper: "a4", margin: 20mm, numbering: "1")
#set text(font: "Libertinus Serif", size: 10.5pt)
#set par(justify: true)
#set heading(numbering: "1.1")
#set math.equation(numbering: "(1)")
#align(center)[
  #text(size: 16pt, weight: "bold")[Magnonics of time-varying media: Giant amplification via phase-transition-driven temporal interfaces]
  #v(5pt)
  Krzysztof Sobucki and Paweł Gruszecki

  Institute of Spintronics and Quantum Information, Department of Physics and Astronomy,
  Adam Mickiewicz University, ul. Uniwersytetu Poznańskiego 4, 61-614 Poznań, Poland

  Correspondence: #link("mailto:krzsob@amu.edu.pl"), #link("mailto:gruszecki@amu.edu.pl") \
  ORCID: #link("https://orcid.org/0000-0003-3273-2305")[Sobucki] · #link("https://orcid.org/0000-0003-3529-1744")[Gruszecki]
]
#heading(numbering: none)[Abstract]
Gilbert damping---the primary obstacle limiting spin-wave propagation in

magnonic devices---can be transformed from an adversary into an asset.

Here we demonstrate 175-fold spin-wave amplitude amplification in

ultrathin films with perpendicular magnetic anisotropy at temporal

interfaces associated with a field-driven transition between a uniform

in-plane state and a stripe-domain state, exceeding existing parametric

and spin-torque schemes (10--50-fold) without a continuous power supply.

When the in-plane bias field is swept through a critical value in the

presence of finite Gilbert damping, the spin-wave dispersion undergoes

dramatic softening, and the eigenfrequency crosses zero and acquires a

positive imaginary part that drives exponential growth. We identify this

as a damping-induced instability operating near an exceptional point---a

non-Hermitian degeneracy where, counterintuitively, increased Gilbert

damping enhances amplification. This mechanism exploits ingredients

specific to these magnetic films: the interplay of Gilbert damping,

Dzyaloshinskii--Moriya-interaction-induced nonreciprocity, and

field-driven phase transitions---a combination that, to our knowledge,

has no direct counterpart in photonic or acoustic time-varying

platforms. Our analytical framework provides explicit design rules,

while micromagnetic simulations capture the full nonlinear dynamics,

including stripe-domain formation. This work establishes temporal

magnonics as a new paradigm for reconfigurable, lithography-free

spin-wave control.


= Introduction
<introduction>
Controlling waves through spatial structuring---mirrors, lenses,
waveguides---has driven technologies from telecommunications to medical
imaging. A fundamentally different approach, manipulating waves by
modulating medium properties in time rather than space, has recently
transformed
photonics@galiffi2022@moussa2023observation@wang2023metasurface, whereas
its implementation in other wave platforms remains comparatively less
developed. Magnonics, which processes information using spin waves in
magnetic materials, is poised to benefit enormously: spin waves offer
nanoscale wavelengths, natural nonreciprocity, and rich nonlinear
dynamics@chumak2015magnon@chumak2021roadmap. However, Gilbert damping
limits propagation distances and prohibits cascaded processing without
amplification. Existing gain mechanisms---parametric
pumping@melkov1999@Serga2010@Rivard2025 and spin--orbit-torque-driven
amplifiers@bauer2015@demidov2017[]---suffer from narrow bandwidth,
threshold behavior, or the need for continuous power injection, with
recent breakthroughs achieving 10--50-fold
gains@Breitbach2023@Merbouche2024@Nikolaev2025 while still relying on
sustained power or operating through threshold-limited processes.

Photonics of time-varying media has demonstrated that temporal
modulation enables wave manipulation impossible with static structures:
time refraction, reflection, and frequency
conversion@pacheco2023@vezzoli2018@bacot2016@fink2001@mostafa2024,
antireflection coatings@akbarzadeh2018, temporal slabs@moussa2023,
photonic time crystals with momentum band
gaps@lustig2018@dikopoltsev2022@wang2023@lyubarov2022@Wang2024_PTC, and
topological
phases@dutt2020@wang2020temporal@ni2025@rechtsman2013@galiffi2022. Most
recently, non-Foster temporal metastructures have extended these
concepts to wave stopping and genuine amplification of electromagnetic
waves@PachecoPena2025, demonstrating that temporal control can go beyond
passive transformations to realize active gain.

Despite these advances, temporal interface control remains
systematically unexplored in magnonics. While non-Hermitian physics and
exceptional points have been extensively studied in magnonic
systems@Yu2024_NonHermitian, temporal interfaces near phase
transitions---where field-driven dispersion changes and DMI-induced
nonreciprocity offer capabilities complementary to photonic
platforms---represent an unexplored regime. Isolated demonstrations
include time reversal@chumak2010, experimental time
reflection@schultheiss2021, numerical time refraction@toedt2021, Floquet
states in magnetic vortices@heins2024@devolder2025@philippe2025, and
space-time periodic magnetization patterns@traeger2021. Recent
amplification breakthroughs via nonlinear magnon-magnon
interactions@Merbouche2024@Nikolaev2025@An2020@elyasi2022 achieved
impressive performance but are fundamentally distinct from temporal
interface physics, which offers complementary advantages: no power
threshold, intrinsic reversibility, and initiation through dispersion
engineering.

Magnetic thin films with perpendicular magnetic anisotropy (PMA) and
interfacial Dzyaloshinskii--Moriya interaction (DMI) provide an ideal
platform. These systems undergo field-driven phase transitions between
uniform magnetization and stripe domains~@Kisielewski2023, providing
dramatic, reversible dispersion changes@Lesniewski2025. Near the
critical field, the spin-wave dispersion softens: the frequency minimum
approaches zero at a finite wavevector and the dynamic susceptibility
diverges. The wavelength at this minimum matches the stripe
period~@Kisielewski2023, indicating a direct link between propagating
waves and phase-transition-induced textures. Temporal interfaces created
by field changes near this critical point exploit a damping-induced
instability emerging from proximity to an exceptional point, where the
spin-wave frequency acquires a positive imaginary component and drives
exponential amplitude growth.

Here we establish a framework for magnonics of time-varying media using
as an example ultrathin CoFeB films with PMA and DMI. We develop an
analytical description based on magnonic impedance and validate it with
micromagnetic simulations, showing that adiabatic field ramps suppress
temporal reflections exponentially, analogous to Landau--Zener
dynamics~@landau1932theorie@zener1932non. We identify three dynamical
regimes---damping, slow instability and strong instability---controlled
by proximity to an exceptional point and the critical field. Operating
in the slow instability regime, we demonstrate up to 175-fold amplitude
amplification. In this regime Gilbert damping enhances gain: the growth
rate scales linearly with $alpha$, so increased dissipation strengthens
amplification.

#figure(image("source/Fig_1.svg"),
  caption: [
    #strong[Temporal versus spatial interface scattering in spin-wave
    systems.] #strong[a,b], Schematic comparison of wave scattering at
    spatial (a) and temporal (b) interfaces between media with different
    dispersion relations, implemented on this example for spin waves by
    different external magnetic fields. #strong[c,d], Corresponding
    scattering processes in reciprocal $\( f \, k \)$-space with
    nonreciprocal dispersion relations for $mu_0 H_1 = 300$~mT and
    $mu_0 H_2 = 227$~mT marked in the background represented by blue and
    orange colors. At spatial interfaces (c), the frequency is conserved
    while the wavevector changes: reflection reverses the sign of $k$
    (and thus the phase velocity), whereas transmission preserves it. At
    temporal interfaces (d), the wavevector is conserved while the
    frequency changes: the time-reflected wave reverses the sign of
    frequency (and thus the phase velocity), whereas the
    time-transmitted wave preserves it. #strong[e], Cross-sectional
    schematic of the CoFeB thin film showing the propagation geometry:
    thickness $d = 2$~nm (vertical, $z$-direction), length $L = 30$~μm
    (horizontal, $x$-direction), and depth extending into the page
    ($y$-direction) with periodic boundary conditions. #strong[f], The
    temporal profile of the external magnetic field showing an
    instantaneous field change at $t = 10$~ns from $mu_0 H_1 = 300$~mT
    to $mu_0 H_2 = 227$~mT. Spin-wave packets are launched with their
    envelope centered at $x = 0$ and $t = 0$, and at each time instant
    the spatial profile is normalized so that the maximum spin-wave
    amplitude equals 1 to clearly visualize their propagation.
    #strong[g], The space-time evolution of spin-wave amplitude
    $m_z \( t \, x \)$, showing the incident wavepacket ($v^i > 0$)
    splitting into the transmitted ($v^t > 0$, higher amplitude) and
    reflected ($v^r < 0$, lower amplitude) packets at the temporal
    interface. Wavepacket amplitudes are normalized independently at
    each time step for better readability of the figure. #strong[h,i],
    The two-dimensional FFT analysis of regions marked in (g). Before
    the time-interface (h, $t < 8$~ns), one spectral peak at the $H_1$
    dispersion. After the time-interface (i, $t > 12$~ns), two peaks at
    matching wavevector but of opposite frequencies on the $H_2$
    dispersion, confirming the wavevector conservation and the frequency
    reversal predicted by the temporal interface theory.
  ]
)
<fig:fig_1>

= Results
<results>
== Reflection and refraction of spin waves at sharp temporal interfaces
<reflection-and-refraction-of-spin-waves-at-sharp-temporal-interfaces>
At a #emph[spatial interface], medium properties change abruptly across
space, creating a boundary between regions with different dispersion
relations. Frequency is conserved while wavevector changes, causing an
incident wave to split into reflected and transmitted waves with
opposite $k$ signs (@fig:fig_1[]a, c).

At a #emph[temporal interface], the medium undergoes an abrupt change of
its dispersion relation throughout the entire system. Magnetization
continuity requires wavevector conservation ($k = upright(c o n s t)$)
while the angular frequency adjusts to satisfy the new dispersion
relation. For an incident rightward-propagating wave with positive phase
velocity $v^(\( i \)) > 0$ (defined as
$v^(\( i \)) = Omega^(\( i \)) \/ k$) and angular frequency
$Omega^(\( i \)) > 0$, two solutions emerge: the transmitted
($v^(\( t \)) > 0 \, Omega^(\( t \)) > 0$) and the reflected
($v^(\( r \)) < 0 \, Omega^(\( r \)) < 0$) waves with opposite frequency
signs (@fig:fig_1[]b,d). This scattering mechanism reveals
fundamentally different wave physics: temporal interfaces enable
frequency conversion while preserving wavevector---the inverse of
spatial scattering.

We demonstrate temporal-interface physics in a 2-nm CoFeB film with
perpendicular magnetic anisotropy (PMA) and interfacial
Dzyaloshinskii--Moriya interaction (DMI; see Methods for material
parameters). @fig:fig_1[]c,d show the spin-wave dispersion relations
for $mu_0 H_1 = 300$~mT and $mu_0 H_2 = 227$~mT. Interfacial DMI breaks
mirror symmetry around $k = 0$ and $f = 0$, enabling nonreciprocal
propagation---a key ingredient exploited throughout this work. As the
field approaches the critical value $H_c approx 227.2$~mT, only one
dispersion branch softens toward zero frequency. The large PMA produces
the characteristic minimum emerging in the Damon--Eshbach
geometry@Banerjee2017@Lesniewski2025\; we plot both positive and
negative frequencies to make the temporal-interface scattering more
transparent.

Micromagnetic simulations of a Gaussian spin-wave packet in a $2$~nm
CoFeB film at $mu_0 H_1 = 300$~mT, subjected at $t = 10$~ns to a global
step to $mu_0 H_2 = 227$~mT, confirm this picture: as shown in
@fig:fig_1[]f--g, the packet splits at the temporal interface into a
time-transmitted (or time-refracted, $v^t > 0$) and a time-reflected
($v^r < 0$) component at fixed $k$, in quantitative agreement with the
field-dependent dispersion in @fig:fig_1[]b,d and with the
temporal-interface prediction of wavevector conservation and frequency
conversion with sign reversal of the reflected wave
(@fig:fig_1[]h--i).

We obtain analytic scattering coefficients by solving the linearized
Landau--Lifshitz equation within the uniform-mode, thickness-averaged
dipolar-field approximation appropriate for ultrathin films and assuming
small-amplitude dynamics ($m_x \, m_z lt.double M_s$). The key insight
is that continuity of the magnetization at the temporal boundary couples
the two magnetization components through their ellipticity ratio. A
sudden field change $H_1 arrow.r H_2$ creates a temporal interface where
the wavevector $k$ remains invariant while the frequency adjusts to the
new dispersion. Two modes emerge in the final medium: a transmitted wave
($Omega_2^(\( t \)) > 0$) and a time-reflected wave
($Omega_2^(\( r \)) < 0$), with the sign reversal of $Omega$ being
crucial for the scattering phenomenology (see Methods).

Applying the continuity conditions at temporal interface yields
transmission and reflection coefficients that depend on the precession
ellipticity---the ratio of out-of-plane to in-plane magnetization
components $epsilon_i^z = \| m_z^(\( i \)) \| \/ \| m_x^(\( i \)) \|$ in
temporal region $i$. By analogy with photonic and electromagnetic
impedances, we introduce the #emph[magnonic impedance]
$Z_i equiv epsilon_i^z$. The transmission and reflection coefficients
then take the form:
$ T_x = 1 / 2 (1 + Z_1 / Z_2) \, quad R_x = 1 / 2 (1 - Z_1 / Z_2) \, $<eq:T_R_x>
$ T_z = 1 / 2 (1 + Z_2 / Z_1) \, quad R_z = 1 / 2 (1 - Z_2 / Z_1) \, $<eq:T_R_z>
where the impedance ratios are reciprocal for $m_x$ and $m_z$
components. These coefficients are real-valued, indicating that temporal
interfaces redistribute spin-wave amplitude without introducing phase
shifts---a consequence of magnetization continuity preserving the phase
coherence in undamped systems.

The reciprocal structure means $T_x > 1$ when $Z_1 > Z_2$, while
$T_z > 1$ when $Z_2 > Z_1$\; only one component can be amplified at a
given interface. The precession ellipse area of the transmission
coefficients is $T_S = T_x dot.op T_z$, which always exceeds unity when
$Z_1 eq.not Z_2$. This indicates a universal phenomenon: #emph[at any
temporal interface with the impedance mismatch, the precession orbit
expands]. In PMA systems near phase transitions, $epsilon^z$ changes
dramatically with field, enabling strategic impedance engineering for
amplification.

#figure(image("source/Fig_2.svg"),
  caption: [
    #strong[Spin-wave refraction and reflection at sharp temporal
    magnetic interfaces.] #strong[a], Spin-wave dispersion relations
    calculated in the micromagnetic simulations for four different
    magnetic field values: 350~mT (magenta), 300~mT (white), 228~mT
    (red), and 226~mT (blue). #strong[b,c], Time evolution of maximum
    out-of-plane magnetization component ($max \( m_z \)$) for two
    representative wavenumbers: $k = 74$~rad/μm (b) and $k = 49$~rad/μm
    (c). Spin waves are initially excited at $mu_0 H = 300$~mT at
    $t = 0$ and are incident upon a temporal interface at $t = 10$~ns,
    where the field abruptly changes to $mu_0 H = 226$~mT (red),
    $250$~mT (black), or $350$~mT (green). The oscillations of amplitude
    at $t > 10$~ns arise from the interference between reflected and
    transmitted wave packets. #strong[d,e], The decomposition of total
    spin-wave amplitude into incident (dash-dotted), refracted (solid),
    and reflected (dotted) components, corresponding to panels (b) and
    (c), respectively, with color coding matching the field values.
    Decomposition details are in Methods section #strong[f,g], The
    wavenumber dependence of transmission coefficients $T_x$ and $T_z$
    (f) and reflection coefficients $R_x$ and $R_z$ (g) for
    $mu_0 H = 226$~mT (red), $250$~mT (black), and $350$~mT (green).
    Filled squares and open circles represent simulation results for
    $T_x$/$R_x$ and $T_z$/$R_z$, respectively; solid and dashed lines
    denote analytical model predictions
    (Eqs.~@eq:T_R_x
    and~@eq:T_R_z) for the respective
    components. #strong[h,i], The magnetic field dependence of
    transmission (h) and reflection coefficients (i) at fixed
    $k = 49$~rad/μm. Symbols indicate micromagnetic simulation results;
    lines show analytical model predictions.
  ]
)
<fig:fig_2>

To validate the model, we performed systematic simulations varying $H_2$
and $k$, with initial field $mu_0 H_1 = 300$~mT.

@fig:fig_2[]a summarizes the field-dependent dispersion for
$mu_0 H = 226$--$350$~mT: the dispersion minimum at
$k approx 49 med upright(r a d \/ mu m)$ progressively softens and
crosses zero frequency at $mu_0 H_c approx 227.2$~mT, signaling the
onset of the field-driven transition from the uniform state to the
stripe-domain phase. We denote this characteristic wavevector by
$k_(upright(s o f t))$, defined as the wavevector at which the real part
of the spin-wave frequency first vanishes at the critical field $H_c$.
Although this zero-crossing indicates an incipient instability, the
growth of the stripe-domain pattern is sufficiently slow that the
uniform state remains metastable over the tens-of-nanoseconds window
used to extract the dispersion from micromagnetic simulations, even for
fields slightly below $H_c$~@Kisielewski2023. For reference, the
dispersion relation in the fully developed, field-aligned stripe-domain
configuration at $H < H_c$ is presented in the Supplementary Information
(Fig.~S4).

@fig:fig_2[]b,c show that a sudden field step generates an
exponentially modulated envelope with fast oscillations arising from
interference between transmitted and reflected components. The
oscillations are strongest and accompanied by net growth at
$k = 49$~rad/μm and $mu_0 H_2 = 226$~mT, whereas for other field values
the envelope remains nearly constant or decays.

The decomposition into incident, refracted, and reflected amplitudes
(@fig:fig_2[]d,e) confirms this picture: field steps to lower values
($mu_0 H_2 = 226 \, 250$~mT) yield $T > 1$, while an upward step
($mu_0 H_2 = 350$~mT) gives $T < 1$. Reflection is generally
subdominant, except for the resonant case ($k = 49$~rad/μm,
$mu_0 H_2 = 226$~mT), where it becomes comparable and drives strong
interference. This identifies $k = 49$~rad/μm and
$mu_0 H_2 approx 226$~mT as the working point where a single temporal
step most strongly redistributes amplitude between incident,
transmitted, and reflected waves, consistent with the peaks of the
transmission and reflection coefficients in @fig:fig_2[]f--i.

@fig:fig_2[]f--i show transmission and reflection coefficients
versus $H_2$ and $k$. The transmission coefficients follow a simple
monotonic trend with field at fixed $k$: when the field is lowered $T_z$
increases while $T_x$ decreases. At the soft-mode wavevector
$k_(upright(s o f t)) approx 49 med upright(r a d \/ mu m)$, $T_z$ grows
from $T_z = 1$ at $mu_0 H_2 = 300$~mT to approximately $3$ at
$mu_0 H_2 = 226$~mT, whereas $T_x$ is correspondingly suppressed below
unity. The product $T_x T_z > 1$ for all $H_2 eq.not 300$~mT confirms
the universal expansion of the precession orbit at any temporal
impedance mismatch. The reflection coefficients vanish at
$mu_0 H_2 = 300$~mT, and their relative weight swaps across this
impedance-matching point: for $H_2 < 300$~mT one finds
$\| R_z \| > \| R_x \|$, while for $H_2 > 300$~mT the inequality
reverses. Near $H_c$, $\| R_z \|$ exhibits a pronounced maximum
exceeding $2$ at $mu_0 H_2 = 226$~mT and $k = k_(upright(s o f t))$.

An excellent agreement between the analytical predictions and
simulations is evident for $H_2 > H_c$, validating that precession
ellipticity governs transmission. For $H_2 < H_c$ (particularly for
$mu_0 H_2 = 226$~mT), the linear model qualitatively captures the
resonant features but underestimates the $T_z$ and $\| R_z \|$
amplitudes and predicts a slightly lower critical field. In
micromagnetic simulations the mode softening is more pronounced,
yielding a critical field higher by $tilde.op 4.5$~mT. We attribute this
systematic offset and amplitude mismatch to the approximations in the
analytical model (uniform-mode, thickness-averaged dipolar field).

#figure(image("source/Fig_3.svg"),
  caption: [
    #strong[Complex spin-wave dispersion and dynamical regimes near the
    exceptional point.] #strong[a], Real part of frequency Re($Omega$)
    versus wavevector $k$ for the conservative case ($alpha = 0$) at
    four representative magnetic field values: $H < H_(upright(E P))$
    (red), $H = H_(upright(E P))$ (black), $H_(upright(E P)) < H < H_c$
    (green), and $H > H_c$ (orange). Solid and dash-dotted curves
    represent the two dispersion branches $Omega_(+)$ and $Omega_(-)$,
    respectively. #strong[b], Imaginary part Im($Omega$) versus $k$ for
    $alpha = 0$. Note the symmetric logarithmic scale. For
    $H gt.eq H_(upright(E P))$, Im($Omega$) = 0 identically. Instability
    occurs only for $H < H_(upright(E P))$ (red curves). #strong[c],
    Same as (a) for finite damping ($alpha = 0.002$). The dispersion
    structure is qualitatively similar to the conservative case.
    #strong[d], Same as (b) for $alpha = 0.002$. Finite damping induces
    non-zero Im($Omega$) across all field regimes. Crucially, the green
    curves ($H_(upright(E P)) < H < H_c$) show Im($Omega$)
    $> 0$---amplification in a regime that is stable for $alpha = 0$.
    #strong[e], Zoom near the exceptional point at
    $H = H_(upright(E P))$, showing the characteristic $sqrt(alpha)$
    splitting of the branches for $alpha = 0.001$ (red) and
    $alpha = 0.01$ (green), relative to the conservative case
    $alpha = 0$ (black dashed). #strong[f], Frequency splitting at the
    EP ($k = k_(upright(E P))$, $H = H_(upright(E P))$) versus damping
    parameter $alpha$. Red solid line: numerical solution; black dashed
    line: $prop sqrt(alpha)$ scaling, confirming the square-root
    dependence characteristic of exceptional points. #strong[g], Minimum
    of Re($Omega$) over all wavevectors as a function of magnetic field
    for three damping values. Background colors indicate dynamical
    regimes: strong instability (purple, $H < H_(upright(E P))$), slow
    instability (white, $H_(upright(E P)) < H < H_c$), and damping
    (green, $H > H_c$). Vertical dashed lines mark $H_(upright(E P))$
    and $H_c$. #strong[h], Maximum of Im($Omega$) over all wavevectors
    versus magnetic field. Larger damping produces stronger
    amplification in the slow instability regime, demonstrating the
    counterintuitive enhancement of growth rate with increased
    dissipation.
  ]
)
<fig:fig_3>

== Origin of amplification below the critical field
<origin-of-amplification-below-the-critical-field>
The amplification mechanism follows from the complex frequency
$Omega = Omega_r + i Omega_i$: amplitude evolves as
$\| m \| prop e^(Omega_i t)$, with positive $Omega_i$ producing growth.
Conventionally, Gilbert damping yields $Omega_i < 0$, requiring external
mechanisms for amplification. Here, the interplay of damping and DMI
creates an intrinsic amplification channel.

The system dynamics are governed by two characteristic fields
(@fig:fig_3[]g,h). We define the critical field $H_c$ by the
condition $upright(R e) \( Omega_(+) \( k_(upright(s o f t)) \) \) = 0$,
i.e. by $omega_x = omega_x^(*) = omega_D^2 \/ omega_z$, which marks the
onset of the field-driven phase transition (see Methods). The lower
characteristic field $H_(upright(E P))$ is defined by $omega_x = 0$. In
the conservative limit ($alpha = 0$), this point is an exceptional point
where both eigenvalues and eigenvectors coalesce. For finite damping,
the degeneracy is lifted with a characteristic splitting
$\| Omega_(+) - Omega_(-) \| prop sqrt(alpha)$ (@fig:fig_3[]e,f),
while $H_(upright(E P))$ still delineates the boundary between dynamical
regimes. Since $omega_x^(*) > 0$, one always has
$H_(upright(E P)) < H_c$.

These two fields delineate three distinct dynamical regimes presented in
@tab:regimes_results and @fig:fig_3[]g,h.

#figure(
  align(center)[#table(
    columns: 5,
    align: (left,center,center,center,center,),
    table.header([Regime], [Field
      range], [$upright(R e) \( Omega \)$], [$upright(I m) \( Omega \)$], [Amplitude
      dynamics],),
    table.hline(),
    [Damping], [$H > H_c$], [$> 0$], [$< 0$], [Decay, rate
    $prop alpha$],
    [Slow
    instability], [$H_(upright(E P)) < H < H_c$], [$< 0$], [$> 0$], [Growth,
    rate $prop alpha$],
    [Strong
    instability], [$H < H_(upright(E P))$], [$< 0$], [$> 0$], [Growth,
    rate $tilde.op sqrt(\| omega_x \| omega_z)$],
  )]
  , caption: [#strong[Dynamical regimes of spin-wave amplification.]
  $H_c$ denotes the critical field (phase transition onset,
  $omega_x = omega_x^(*)$); $H_(upright(E P))$ marks the exceptional
  point ($omega_x = 0$). In the damping and slow-instability regimes the
  rate scales linearly with $alpha$, whereas in the strong-instability
  regime it is set primary by $sqrt(\| omega_x \| omega_z)$ (cf.
  @eq:Im_strong_instability).]
  , kind: table
) <tab:regimes_results>
The comparison between conservative ($alpha = 0$) and dissipative
($alpha > 0$) cases reveals the central result (@fig:fig_3[]a--d).
For $alpha = 0$, the frequency is purely real when $omega_x > 0$
(@fig:fig_3[]a); instability ($upright(I m) \( Omega \) > 0$) occurs
only for $H < H_(upright(E P))$ where the uniform magnetic configuration
itself is unstable (@fig:fig_3[]b, red curves). In stark contrast,
for $alpha > 0$, amplification emerges in the range
$H_(upright(E P)) < H < H_c$---a regime that would be completely stable
in the absence of damping (@fig:fig_3[]d, green curves showing
$upright(I m) \( Omega \) > 0$).

The physical origin lies in the proximity to the exceptional point in
parameter space. At $omega_x = 0$ in the limit $alpha = 0$, both
dispersion branches coalesce:
$Omega_(+) = Omega_(-) = - s omega_D \( k \)$ (@fig:fig_3[]a, black
curves at $H = H_(upright(E P))$), and the dynamical matrix becomes
non-diagonalizable (see SI for a rigorous proof). Crucially, when
damping is introduced as shown in @fig:fig_3[]e-f, this degeneracy is
lifted with characteristic splitting
$\| Omega_(+) - Omega_(-) \| prop sqrt(alpha)$---the hallmark of EP
physics, distinct from linear splitting at ordinary degeneracies. This
lifting of degeneracy is precisely what creates the slow instability
regime: the two branches that touch at $H = H_(upright(E P))$ for
$alpha = 0$ acquire distinct imaginary parts for $alpha > 0$, with one
branch ($Omega_(+)$) gaining a positive imaginary component in the range
$H_(upright(E P)) < H < H_c$. Thus, the damping-induced splitting of the
exceptional point directly enables amplification in a field window that
would be completely stable without dissipation. Exceptional points and
dissipation-induced instabilities have been extensively explored in
photonic systems@Miri2019_EP, yet the specific realization demonstrated
here---coupling Gilbert damping to DMI-mediated nonreciprocity near a
field-driven magnetic phase transition---represents a distinctly
magnonic pathway to amplification. This represents an amplification
mechanism where dissipation enables gain--a counterintuitive behavior
that, while conceptually related to loss-induced phenomena in
non-Hermitian photonics, emerges here from the specific interplay of
Gilbert damping and magnetic phase transition dynamics. In practical
terms, a small field window opens up between the onset of instability
and the phase transition, where spin waves that would normally decay
instead grow exponentially because damping lifts the exceptional-point
degeneracy.

In the damping regime ($H > H_c$, green background in
@fig:fig_3[]g,h), the decay rate scales linearly with $alpha$. In the
slow instability regime ($H_(upright(E P)) < H < H_c$, white
background), the growth rate also scales linearly with $alpha$---this
damping-induced amplification vanishes in the conservative limit
$alpha arrow.r 0$. Remarkably, these two regimes are governed by a
single unified expression (see Methods,
@eq:Im_unified):
$upright(I m) \( Omega_(+) \) prop alpha \[ sqrt(omega_x^(*) \/ omega_x) - 1 \]$,
where the sign is determined solely by whether $omega_x$ lies below
($upright(I m) > 0$, amplification) or above ($upright(I m) < 0$,
damping) the critical value $omega_x^(*) = omega_D^2 \/ omega_z$. In the
strong instability regime ($H < H_(upright(E P))$, purple background),
growth is governed by the magnetic instability with a dominant
$alpha$-independent term $sqrt(\| omega_x \| omega_z)$.

Counterintuitively, larger damping enhances amplification in the slow
instability regime since the growth rate $upright(I m) \( Omega \)$ is
proportional to $alpha$ when $omega_x < omega_x^(*)$. This is evident in
@fig:fig_3[]h, where larger $alpha$ (green curve, $alpha = 0.01$)
produces higher $upright(I m) \( Omega \)$ values compared to smaller
$alpha$ (red curve, $alpha = 0.001$), and is confirmed by micromagnetic
simulations showing $T prop exp \( upright(c o n s t) dot.op alpha \)$
(@fig:fig_6[]e,f). The amplification window
$Delta H = H_c - H_(upright(E P))$ spans approximately $3$--$4$~mT for
our CoFeB parameters (@fig:fig_3[]g). Importantly, this width scales
as $D^2$ and is independent of $alpha$ (see Methods), while damping
controls only the growth rate within the window. Consequently, standard
ferromagnetic materials with moderate damping ($alpha tilde.op 0.01$)
are well-suited for this mechanism---the damping enhances gain without
narrowing the operational field range.

While linearized theory predicts instability onset and growth rates,
large-amplitude dynamics involve nonlinear processes: as magnetization
grows beyond the small-angle regime, the system evolves toward stripe
domain formation. Micromagnetic simulations capture the complete
evolution including saturation.

#figure(image("source/Fig_4.svg"),
  caption: [
    #strong[Temporal interfaces and spin-wave response to adiabatic
    field changes.] #strong[a--i], Comparison of field-dependent
    spin-wave responses. For each set of three panels, the left column
    (a,d,g) shows magnetic field $mu_0 H_y$ versus time, the middle
    column (b,e,h) show the space--time evolution of the spin-wave
    amplitude $m_z \( t \, x \)$, normalized to unity at each time step,
    and the right column (c,f,i) displays $max \( \| m_z \| \)$ (black
    curve) and FWHM (red curve, not shown in c) versus time. Panels
    (a--c): abrupt field change ($tau = 0$) from $mu_0 H_1 = 300$~mT to
    $mu_0 H_2 = 225$~mT. Panels (d--f): adiabatic temporal interface
    ($tau = 2$~ns) from $mu_0 H_1 = 300$~mT to $mu_0 H_2 = 225$~mT.
    Panels (g--i): adiabatic temporal interface ($tau = 2$~ns) from
    $mu_0 H_1 = 300$~mT to $mu_0 H_2 = 224$~mT, showing increased FWHM
    broadening compared to (f). #strong[j], Space-time magnetization
    $m_z \( t \, x \)$ zoom from panel (e), showing the frequency and
    phase velocity changes while preserving wavelength across the
    temporal interface. #strong[k], Frequency-domain analysis: before
    interface ($t < 8$~ns, black), spectrum peaks at $f_0 = 4.09$~GHz;
    after interface ($t > 12$~ns, red), negative frequency component
    appears at $f_1 = - 0.42$~GHz with enhanced amplitude. #strong[l],
    Amplitude ratio $\| R \| \/ T$ versus transition time $tau$ for
    final field values $H_2 = 225$--$260$~mT. Curves show an exponential
    decay with fitted parameter $C approx 0.5$. #strong[m], Amplitude
    evolution $max \( \| m_z \| \)$ versus time for different $H_2$
    values. The curves show growth for lower fields and the decay for
    higher fields. #strong[n], FWHM evolution versus time showing
    wavepacket broadening for different $H_2$ values and for
    $mu_0 H_2 gt.eq 225$ is small.
  ]
)
<fig:fig_4>

== Smooth temporal interfaces for frequency conversion and amplification
<smooth-temporal-interfaces-for-frequency-conversion-and-amplification>
Sharp temporal interfaces induce unwanted reflections. To suppress them,
we consider smooth interfaces where the field changes over finite time
$tau$. By analogy with the Landau-Zener problem in quantum mechanics,
which describes two-level systems where the probability of avoiding an
energy level transition decays exponentially when parameters change at a
finite rate (with the exponent proportional to the square of the energy
splitting divided by the rate of
change)~@landau1932theorie@zener1932non, we expect that when the field
changes adiabatically (slowly compared to the spin-wave precession
frequency) reflections can be suppressed. Specifically, if:
$ \| dot(Omega) \| = frac(Delta Omega_0, tau) med lt.double macron(Omega)_0^2 \, $<eq:adiabatic_criterion>
where $macron(Omega)_0 = \( Omega_1 + Omega_2 \) \/ 2$ and
$Delta Omega_0 = \| Omega_2 - Omega_1 \|$, the spin wave adiabatically
follows the changing dispersion without reflection. We predict:
$ \| R \| tilde.op exp (- C frac(macron(Omega)_0^2, \| dot(Omega) \|)) \, $<eq:reflection_suppression>
where $C$ is determined from the micromagnetic simulations. A full WKB
treatment~@Griffiths2018[p. 274] would provide analytically $C$, but it
is beyond this work's scope.

We model smooth temporal interfaces using:

$ H_y = H_1 - 0.5 thin \( H_1 - H_2 \) [tanh (frac(4 \( t - t_i \), tau)) + 1] \, $<eq:singleSmoothInterface>
where $t_i = 10$~ns is the temporal interface center, $tau$ is the
temporal width, $mu_0 H_1 = 300$~mT is the initial (high) field, and
$mu_0 H_2$ is the final (low) field value we vary in the range
$224$--$260$~mT. At $t = t_i + tau \/ 2$, approximately 98% of the
transition is complete.

Increasing the transition time $tau$ suppresses temporal reflections
while preserving transmitted amplitude; for fields too far below $H_c$
(e.g. $mu_0 H_2 = 224$~mT) the exponential growth quickly saturates and
strong full width at half maximum (FWHM) broadening signals
stripe-domain formation (@fig:fig_4[]a--i,n).

A combined space--time and spectral analysis confirms that the
wavelength (and thus the wavevector) is preserved while the frequency
content is continuously redistributed during the smooth temporal ramp,
so that temporal refraction generates a strong negative-frequency
component at $- 0.42$~GHz from an incident packet at $4.09$~GHz
(@fig:fig_4[]j,k).

Numerical data follow the predicted exponential suppression
$\| R \| \/ T tilde.op exp \( - C macron(Omega)_0^2 \/ \| dot(Omega) \| \)$
with a fitted constant $C approx 0.5$ (@fig:fig_4[]l) validating the
Landau-Zener analogy. For the transition from $mu_0 H_1 = 300$ to
$mu_0 H_2 = 225$~mT (evaluated at $k = k_(upright(s o f t))$,
$f_0 = 4.09$~GHz, $f_1 = - 0.42$~GHz), the reflection amplitude
decreases to approximately 10% for $tau = 1$~ns and 1% for $tau = 2$~ns
relative to sharp-interface values.

Amplitude traces and FWHM evolution show that for $H_2$ below $H_c$ we
indeed observe exponential amplitude growth, while for $H_2 > H_c$ there
is exponential decay, with rates increasing as we move further from
$H_c$. Importantly, the FWHM analysis confirms that within the chosen
field range and time window, the wavepacket width remains nearly
unchanged, ensuring stable amplification conditions
(@fig:fig_4[]m,n). Thus, the optimal operational window is the
slow-instability regime $H_(upright(E P)) < H_2 < H_c$: $H_2$ must be
low enough below $H_c$ to provide damping-induced gain, yet remain
sufficiently above $H_(upright(E P))$ so that the growth rate stays
controllable and the slow-instability amplification does not collapse
into the fast, strong-instability--driven stripe-domain transition.

#figure(image("source/Fig_5.svg"),
  caption: [
    #strong[Temporal amplification slab: dynamics and parametric
    dependence.] #strong[a], Temporal magnetic field profile showing
    downward $upright(t a n h)$ gradient ($tau = 2$~ns) from
    $mu_0 H_1 = 300$~mT to $mu_0 H_2 = 225$~mT, constant low-field
    plateau ($t_(upright(l o w)) = 10$~ns), and upward gradient
    ($tau = 2$~ns) returning to $mu_0 H_1$. #strong[b], Space-time
    evolution of spin-wave amplitude $m_z \( t \, x \)$ for
    $mu_0 H_2 = 225$~mT, normalized to unity at each time step.
    #strong[c], Amplitude envelope $max \( \| m_z \| \)$ versus time for
    the same field value. Horizontal lines indicate temporal landmarks:
    $t_(upright(i n)) = t_i - tau \/ 2$ (slab entrance at 98% field
    descent) and
    $t_(upright(o u t)) = t_i + t_(upright(l o w)) + 1.5 tau$ (slab exit
    at 98% field recovery). #strong[d], Amplitude evolution in
    logarithmic scale for different low-field values
    $mu_0 H_2 = 225$--$300$~mT ($tau = 2$~ns,
    $t_(upright(l o w)) = 10$~ns, $k = 49$~rad/μm). Three temporal
    regions are marked: initial high-field propagation, constant
    low-field plateau, and final high-field recovery. Gray horizontal
    lines (a--c) and red vertical lines (d) indicate the positions of
    the temporal interfaces. #strong[e], Transmission coefficient $T$
    versus $mu_0 H_2$ for low-field plateau durations
    $t_(upright(l o w)) = 0 \, 5 \, 10 \, 15 \, 20$~ns ($tau = 2$~ns,
    $k = 49$~rad/μm). #strong[f], Transmission coefficient $T$ versus
    $mu_0 H_2$ for transition time duration $tau = 1 \, 2 \, 3 \, 5$~ns
    ($t_(upright(l o w)) = 10$~ns, $k = 49$~rad/μm). #strong[g],
    Transmission coefficient $T$ versus spin-wave wavevector $k$ for
    field values $mu_0 H_2 = 225$--$250$~mT ($tau = 2$~ns,
    $t_(upright(l o w)) = 10$~ns). #strong[h], Decomposition of
    transmission into components: $T_1$ (first interface), $T_2$
    (low-field plateau), $T_3$ (second interface), with products
    $T_1 T_3$ and total transmission $T = T_1 T_2 T_3$ versus $mu_0 H_2$
    ($tau = 2$~ns, $t_(upright(l o w)) = 10$~ns, $k = 49$~rad/μm).
  ]
)
<fig:fig_5>

== Frequency-preserving amplification via temporal slabs
<frequency-preserving-amplification-via-temporal-slabs>
The temporal interface phenomenon enables frequency conversion with
amplification. However, many magnonic devices require amplification
#emph[without] frequency shift to maintain signal integrity. Here, we
demonstrate that cascading two complementary temporal
interfaces---forming a temporal amplification slab---enables net gain
while preserving the original frequency. The temporal field profile is
described by:
$ H_y = H_1 - 0.5 thin \( H_1 - H_2 \) [tanh (frac(4 \( t - t_i \), tau)) - tanh (frac(4 \( t - \( t_i + 2 tau + t_(upright(l o w)) \) \), tau))] \, $<eq:temporal_slab>
where the first $tanh$ term describes the downward field transition and
the second $tanh$ term describes the upward recovery, separated by the
low-field plateau duration $t_(upright(l o w))$. A spin-wave packet thus
experiences a high-field $arrow.r$ low-field $arrow.r$ high-field
sequence defined by
@eq:temporal_slab: it enters the slab
at $H_1$, dwells at $H_2$ for a time $t_(upright(l o w))$, and exits
back at $H_1$, so that the temporal slab can be viewed as a
frequency-preserving amplifier acting on a selected $k$--mode
(@fig:fig_5[]a--c).

@fig:fig_5\(d) quantifies field-dependent behavior across
$mu_0 H_2 = 225$--$300$~mT ($tau = 2$~ns, $t_(upright(l o w)) = 10$~ns,
$k = 49 med upright(r a d \/ mu m)$). Three distinct dynamical regimes
are visible: (1) downward transition (falling field edge)---all
trajectories show the amplitude increase during this interface crossing;
(2) constant low-field plateau---amplitude exhibits the exponential
behavior determined by $H_2$, namely: exponential growth for $H_2 < H_c$
(approximately $227.2$~mT), exponential decay for $H_2 > H_c$, minimal
change at $H_2 approx H_c$\; (3) upward transition (rising external
magnetic field)---amplitude decreases as the field returns to
$mu_0 H_1$. The logarithmic scale reveals the exponential characters of
growth and decay in the constant-field regions, enabling clear
quantification of the amplification rate. Net amplification results from
exponential growth on the low-field plateau overcoming the net interface
effect, with a modest gain at the entrance and a stronger loss at the
exit. We define the transmission coefficient $T$ as the ratio of
wavepacket amplitudes at the slab exit and entrance:
$ T = frac(max \( \| m_z \| \( t_(upright(o u t)) \) \), max \( \| m_z \| \( t_(upright(i n)) \) \)) \, $<eq:transmission>
where $t_(upright(i n)) = t_i - tau \/ 2$ and
$t_(upright(o u t)) = t_i + t_(upright(l o w)) + 1.5 tau$ denote the
temporal positions of slab beginning and end. At both times, the
magnetic field is approximately equal to $H_1$, differing by only
$Delta H_(upright(o f f s e t)) approx 0.018 \( H_1 - H_2 \)$
(approximately 1.8% of the total field change). This symmetric
definition ensures that amplitudes are measured at times of equivalent
magnetic field values. The transmission coefficient value of $T > 1$
indicates net amplification, while $T < 1$ indicates attenuation. To
systematically optimize the temporal slab for amplification, we examine
the transmission coefficient $T$ as a function of the slab parameters.
@fig:fig_5[]e-g present detailed parametric studies: the transition
time $tau$, low-field plateau duration $t_(upright(l o w))$, and values
of spin-wave wavevector $k$, revealing how each parameter influences the
amplification characteristics near the critical magnetic field.

@fig:fig_5\(e) reveals a critical field-dependent transition. For
$H_2 > H_c$, increasing $t_(upright(l o w))$ decreases transmission
(damping dominance). For subcritical fields ($H_2 < H_c$), the opposite
occurs: at $H_2 = 225$~mT, transmission increases from ~1.3
($t_(upright(l o w)) = 10$~ns) to ~2.1 ($t_(upright(l o w)) = 20$~ns),
while at $H_2 = 226$~mT, gain emerges only at
$t_(upright(l o w)) gt.eq 20$~ns. This demonstrates that extended
low-field residence in slow instability enables amplification.

@fig:fig_5\(f) shows how transmission decreases monotonically with
increasing $tau$. Although $tau = 1$~ns yields highest transmission
numerically, @fig:fig_4[]l reveals that sharp transitions produce
reflections (~10% $\| R \| \/ T$ per interface) with the interference
oscillations degrading wavepacket quality. At $tau = 2$~ns, transmission
remains near-optimal while eliminating these artifacts. A further $tau$
increase to $5$~ns reduces transmission as the damping accumulation
outweighs adiabatic benefits.

@fig:fig_5\(g) reveals wide peaks in transmission versus $k$ whose
width remains constant but whose amplitudes increase dramatically as the
field decreases toward $H_c$. The maximum peak height occurs near
$k approx 49$~rad/μm at $mu_0 H_2 = 226$~mT, while peaks nearly vanish
for fields higher than $H_c$. This wavenumber selectivity arises from
matching to the softened spin-wave mode whose frequency approaches zero
at the critical field.

@fig:fig_5\(h) decomposes transmission coefficient: $T_1$ (first
interface), $T_2$ (low-field plateau), $T_3$ (second interface), with
$T = T_1 T_2 T_3$. The critical observation: $T_1 T_3 < 1$ across all
fields, showing the interfaces alone actually attenuate spin-waves. At
high fields, $T_2 < 1$ yields no net gain. Below $H_c$, $T_2$ grows
dramatically (reaching ~2 at $H_2 = 225$~mT), offsetting the interface
losses.

#strong[Design conclusions:] (1) #emph[Net amplification requires
operation in the slow-instability window]
$H_(upright(E P)) < H_2 < H_c$: all useful gain resides in $T_2$ (slow
instability with $upright(I m) thin Omega_(+) > 0$). For lower fields
the dynamics enter the strong-instability regime, where rapid
stripe-domain nucleation within the $t_(upright(l o w))$ plateau
degrades the wavepacket. For our CoFeB stack this operational trade-off
is met for $mu_0 H_2 approx 225$--227~mT. (2) Since $T_1 times T_3 < 1$
for all fields (the interfaces act as passive impedance transformers),
net gain requires $T_2 gt.double 1$, i.e., sufficient dwell time in the
slow-instability regime to offset interface attenuation. (3)
Optimization therefore prioritizes: (a) biasing $H_2$ within the
slow-instability window; (b) adiabatic transitions ($tau approx 2$~ns)
that suppress temporal reflections and stabilize $T_1$\; (c) low-field
plateaus long enough to build up $T_2$\; and (d) wavevector selection
around the softened-mode.

#figure(image("source/Fig_6.svg"),
  caption: [
    #strong[Giant temporal amplification and its dependence on slab
    parameters and damping constant.] #strong[a], The space-time
    evolution of spin-wave envelope structure normalized to unity at
    each time step during the passage through an optimized temporal slab
    ($t_(upright(l o w)) = 100$~ns, $mu_0 H_2 = 225$~mT, $tau = 2$~ns).
    The amplitude grows dramatically within the low-field plateau
    (shaded region) before decaying upon field restoration, as
    quantified in panels (c,d). #strong[b], The time evolution of $m_z$
    at fixed position ($x = 0$), showing the growth of oscillation
    amplitude across the temporal slab. An inset zoom reveals the smooth
    frequency transition at the temporal interface. The background
    colors indicate temporal regions: green (high field,
    $mu_0 H = 300$~mT), purple (low-field plateau, $mu_0 H = 225$~mT),
    and the smooth color transitions marking adiabatic field changes
    ($tau = 2$~ns). #strong[c], The maximum amplitude
    $max \( \| m_z \| \)$ versus time for five plateau durations
    ($t_(upright(l o w)) = 20 \, 40 \, 60 \, 80 \, 100$~ns). The legend
    shows exponential growth rates increase with $t_(upright(l o w))$,
    demonstrating cumulative amplification with extended slab residence
    time. #strong[d], Transmission coefficient $T_z$ against the plateau
    duration $t_(upright(l o w))$, showing the exponential scaling
    $T_z prop exp \( upright(c o n s t) dot.op t_(upright(l o w)) \)$,
    reaching $175$-fold amplification at $t_(upright(l o w)) = 100$~ns.
    #strong[e], The amplitude evolution for three different damping
    values ($alpha = 0.0003 \, 0.001 \, 0.01$) at fixed slab parameters
    ($t_(upright(l o w)) = 20$~ns, $tau = 2$~ns, $mu_0 H = 225$~mT).
    Larger damping values produce faster growth within the low-field
    plateau and faster decay outside, counterintuitively enhancing net
    amplification. #strong[f], Transmission coefficient versus damping
    parameter, revealing exponential dependence
    $T_z prop exp \( Omega_i t_(upright(l o w)) \)$ with
    $Omega_i prop alpha$. The straight line represents fit according to
    @eq:Im_unified and field value
    approximately 2~mT below $mu_0 H_c$.
  ]
)
<fig:fig_6>

== Giant amplification via temporal slabs
<giant-amplification-via-temporal-slabs>
We examine the ultimate performance limits of optimized temporal slabs
under near-optimal conditions: field within slow instability regime
($mu_0 H_2 = 225$~mT), extended low-field plateau durations
($t_(upright(l o w)) = 20$--$100$~ns), smooth temporal transitions
($tau = 2$~ns) and $k = k_(upright(s o f t))$.

@fig:fig_6[]a--d demonstrate giant amplification: $T$ reaches 5-,
13-, 32-, 78-, and 175-fold for $t_(upright(l o w)) = 20$--$100$~ns.
@fig:fig_6[]b shows smooth, continuous amplitude evolution,
confirming the coherent wavepacket dynamics. The amplification exhibits
exponential dependence on plateau duration (@fig:fig_6[]d) with gains
reaching 175-fold for the extended 100-ns-long temporal slab.

Remarkably, transmission exhibits the same exponential structure when
varying damping rather than plateau duration. A systematic comparison
across damping values ($alpha = 0.0003$, 0.001, 0.01) at fixed temporal
parameters ($tau = 2$~ns, $t_(upright(l o w)) = 20$~ns) reveals that
larger damping produces stronger amplification (@fig:fig_6[]e,f),
with transmission coefficient
$T_z prop exp \( upright(c o n s t) dot.op alpha \)$. This
counterintuitive behavior---where increased dissipation enhances
gain---is fully consistent with the analytical model: in the slow
instability regime, the growth rate $upright(I m) \( Omega_(+) \)$
scales linearly with $alpha$ (see Methods,
@eq:Im_unified). Since amplitude evolves
as $\| m \| prop exp \[ upright(I m) \( Omega \) dot.op t \]$, the
transmission coefficient follows
$T prop exp \( upright(c o n s t) dot.op alpha dot.op t_(upright(l o w)) \)$,
explaining why both $t_(upright(l o w))$ and $alpha$ contribute to the
exponential scaling with consistent functional form.

#heading(level: 1, numbering: none)[Discussion]
<discussion>
Our results demonstrate that temporal interfaces near magnetic phase
transitions provide a fundamentally new approach to spin-wave
amplification, distinct from existing parametric and spin-torque
mechanisms.

From an application perspective, our results show that a spatially
uniform PMA film with a time-modulated field can operate as a high-gain,
frequency-preserving spin-wave amplifier without any lithographic
patterning or continuous microwave drive. At the level of a single
temporal interface, the linear theory shows that any impedance mismatch
$Z_1 eq.not Z_2$ expands the precession ellipse and, for fields between
$H_(upright(E P))$ and $H_c$, creates the conditions for
slow-instability-driven gain. Building on this, the temporal slab
amplifier guides a wavepacket through a high-field $arrow.r$ low-field
$arrow.r$ high-field trajectory, with total transmission
$T = T_1 T_2 T_3$ factorized into the contributions from the first
interface ($T_1$), propagation on the low-field plateau ($T_2$) and the
second interface ($T_3$). As shown in @fig:fig_5[]h, the interfaces
act as impedance transformers: $T_1 gt.tilde 1$ and $T_3 lt.tilde 1$,
with their product $T_1 T_3 < 1$, so they do not provide net gain on
their own. All substantial amplification is accumulated in $T_2$ during
propagation in the slow-instability regime, such that $T > 1$ only when
the low-field plateau overcompensates the interface losses.

The analytical framework based on linearized Landau-Lifshitz theory
successfully predicts the instability onset and the initial growth rate,
while micromagnetic simulations capture the full nonlinear spin-wave
dynamics including the stripe domain nucleation and the amplitude
saturation. This complementary approach---linear theory for design
criteria and nonlinear simulations for quantitative
predictions---provides a practical methodology for engineering temporal
magnonic devices.

The analytical model developed here provides explicit expressions for
the complex frequency in each dynamical regime and yields three key
design rules: (i) the amplification window width $Delta H prop D^2$ is
independent of damping, (ii) the growth rate in the slow instability
regime scales linearly with $alpha$, and (iii) the ratio of growth rates
between slow and strong instability is
$tilde.op alpha omega_D \/ \( 2 omega_x \) approx 0.01$--$0.1$ for
typical parameters. These scaling laws guide material selection and
operating point optimization.

Since we consider the wavepacket propagation, it is sufficient to vary
the bias magnetic field amplitude only in the region where the
wavepacket is localized. Consequently, even a microstrip inducing a
localized magnetic field should work effectively, provided its
modulation is synchronized with the wavepacket propagation.

Our simulations demonstrate the amplification factors up to 175-fold
(@fig:fig_6) with a complete frequency preservation, enabling
seamless integration with fixed-frequency magnonic circuits. The
mechanism itself requires only spatially uniform films and global field
control, avoiding any nanofabrication overhead. The approach exhibits
intrinsic wavevector selectivity with high resonant gain at
$k = k_(upright(s o f t))$ (@fig:fig_5[]g). Critically, reversing the
temporal sequence reverses the amplification, enabling on-demand control
without any permanent device modification.

Amplification is concentrated in a narrow field window between
$H_(upright(E P))$ and $H_c$. For our CoFeB stack, the operational range
is $H in \( H_(upright(E P)) \, H_c \)$ with width
$Delta H approx 3$--$4$~mT: below $H_(upright(E P))$ the
strong-instability regime rapidly nucleates stripes, whereas at $H_c$
the slow-instability growth rate changes sign and the system crosses
over into the purely damped regime ($Im \[ Omega_(+) \] < 0$). Within
this window the gain is inherently $k$-selective, peaking around
$k_(upright(s o f t)) approx 49$~rad/μm with an effective bandwidth that
can exceed $20$~rad/μm for fields approaching $H_(upright(E P))$
(@fig:fig_5[]g and SI, Fig.~S2), which naturally provides filtering
and can be re-engineered in other material platforms by tuning
$k_(upright(s o f t))$.

The conventional wisdom suggests that Gilbert damping universally
opposes amplification. However, our simulations (@fig:fig_6[]e,f)
reveal a striking counterexample: in the slow instability regime
($H_(upright(E P)) < H < H_c$), #emph[larger damping produces stronger
amplification]. This follows directly from the analytical model
(Methods): the growth rate $upright(I m) \( Omega_(+) \) prop alpha$ in
this regime, so increased dissipation enhances rather than suppresses
gain. Physically, this damping-induced instability has no counterpart in
conservative systems---it emerges from the lifting of the exceptional
point degeneracy by finite damping, which creates the slow instability
regime with growth rate proportional to $alpha$. Consequently, our
approach does #emph[not] require exotic ultra-low-damping
materials---standard CoFeB films with $alpha tilde.op 0.01$ would
produce an excellent amplification.

Our analytical framework depends only on the magnonic impedance
$Z_i equiv epsilon_i^z$ (the ratio of out-of-plane to in-plane
magnetization amplitudes) suggesting universality across the magnonic
platforms. The transmission and reflection coefficients depend only on
the impedance ratio $Z_1 \/ Z_2$
\[@eq:T_R_x[]--@eq:T_R_z\],
and the product $T_x dot.op T_z > 1$ whenever impedance mismatch
occurs---a universal feature absent from spatial interfaces where
frequency is conserved. Near the critical field, impedance changes
dramatically \[@fig:fig_2\(a)\], creating maximum impedance
mismatch precisely where the dynamic susceptibility diverges.

Interfacial DMI plays a dual role in the amplification mechanism. First,
it generates the slow-instability regime itself: the amplification
window width vanishes for $D = 0$, so without DMI the critical field and
exceptional point coincide, and the system switches directly from
damping to strong instability with no field range for controlled,
damping-induced amplification. Second, DMI breaks mirror symmetry so
that only #emph[one] dispersion branch softens to $omega arrow.r 0$
while the other remains at finite frequency (@fig:fig_2[]a). This
selective softening enables adiabatic tracking across the temporal
interfaces with exponentially suppressed reflections (@fig:fig_4[]l),
yielding clean amplification and the 175-fold amplitude gain observed in
this work.

In contrast, reciprocal systems without DMI (see SI, Fig.~S3) exhibit
symmetric dispersion in which both branches approach zero frequency
simultaneously at $H_c = H_(upright(E P))$. Driving the field into the
strong-instability regime ($H < H_c$) still enables substantial gain,
but during field restoration the mode passes through the degeneracy at
$f = 0$ and splits symmetrically onto the two branches, producing
transmitted and time-reflected waves with comparable amplitudes. As a
result, the accumulated gain is redistributed between these components
and their interference degrades the usable output signal. Although our
analytical framework is formulated for DMI-induced nonreciprocity, other
mechanisms that break mirror symmetry---such as asymmetric multilayers
without DMI @Szulc2022 or thickness-dependent material-parameter
gradients---should, in principle, enable analogous behavior, though this
remains to be verified.

The temporal slab mechanism applies to any PMA system with tunable
dispersion near the phase transition (a survey of suitable platforms
without DMI with mode softening appears in @Lesniewski2025). Beyond
CoFeB, YIG offers access to longer wavelengths compatible with standard
magneto-optical detection, but its much lower damping
($alpha tilde.op 10^(- 4)$) reduces the amplification rate by
$tilde.op 100 times$ compared to CoFeB ($alpha tilde.op 0.01$);
YIG-based temporal amplifiers may therefore need to operate in, or close
to, the strong-instability regime ($H < H_(upright(E P))$), where the
growth rate is dominated by alpha-independent term
$sqrt(\| omega_x \| omega_z)$, at the expense of tighter control over
stripe-domain nucleation and more demanding nonreciprocity engineering.
Our demonstration employs electromagnet modulation, while device-level
implementations could leverage voltage-controlled magnetic anisotropy
(VCMA) for sub-nanosecond switching and direct $H_c$
control@yamamoto2022vcma. In our ultrathin CoFeB film with PMA and
interfacial DMI, $k_(upright(s o f t))$ is pinned to the dispersion
minimum at $H = H_c$, where $f = 0$ and
$v_g \( k_(upright(s o f t)) \) = 0$, so amplification in the
slow-instability window $H_(upright(E P)) < H < H_c$ targets modes in a
low--$v_g$ sector of the spectrum, whereas efficient routing outside the
temporal slab benefits from larger group velocities. This motivates
co-engineering the dispersion landscape and temporal control so that the
mode traversing the temporal slab connects to high--$v_g$ states in the
surrounding propagation regions, for example via VCMA-driven tuning of
PMA or other temporal control of PMA, DMI, saturation magnetization, or
exchange stiffness, thereby enabling temporal amplification of spin
waves that propagate rapidly outside the slab.

#strong[Outlook.] This work establishes temporal magnonics as an
emerging field, providing the first systematic framework for a temporal
interface control of propagating spin waves. The demonstrated 175-fold
amplitude amplification through a reversible, lithography-free field
modulation represents a fundamental advance over existing parametric and
spin-torque schemes, which typically achieve gains of 10--50-fold while
requiring a continuous power injection or fixed structural elements.

Several limitations warrant discussion. First, our predictions rely on
the micromagnetic simulations; an experimental validation remains
essential. Two complementary pathways exist: systems with nonreciprocal
dispersion (e.g., CoFeB/Pt with interfacial DMI) combined with smooth
temporal interfaces enable clean amplification without time-reflected
waves, while the reciprocal systems will exhibit both transmitted and
reflected components. Second, wavevector selectivity poses
platform-dependent challenges. In CoFeB, the resonant amplification
occurs at short wavelengths ($lambda tilde.op 100$--$200$~nm), requiring
electrical detection@yu2013@che2020 or advanced microscopy
techniques@grafe2019@traeger2021. YIG-based systems offer access to
longer wavelengths compatible with standard magneto-optical methods,
though engineering nonreciprocity is more demanding. Third, the
operational window of $tilde.op$3--4~mT below $H_c$ demands precise
field control, achievable with modern electromagnets.

Beyond amplification, the efficient frequency conversion (range from
4.09~GHz to $- 0.42$~GHz, @fig:fig_4[]k) suggests applications in
magnonic frequency mixing and signal processing. Furthermore, the
unified description of damping and slow instability regimes reveals a
remarkable feature at the critical field $H_c$: both
$upright(R e) \( Omega \)$ and $upright(I m) \( Omega \)$ vanish
simultaneously. This coincidence is not accidental---it follows directly
from @eq:Im_unified, where
$omega_x = omega_x^(*)$ yields $upright(I m) \( Omega \) = 0$ at exactly
the same field where
$upright(R e) \( Omega \) = sqrt(omega_x omega_z) - omega_D = 0$. At
this marginal stability point, spin waves are effectively "frozen": they
neither oscillate nor decay. Combined with the vanishing group velocity
$v_g arrow.r 0$ at the dispersion minimum, this creates an ideal
condition for spin-wave storage. Unlike photonic slow-light systems,
where absorption typically limits storage time (since
$upright(I m) \( omega \) < 0$ persists even as $v_g arrow.r 0$), our
system offers a fundamentally different regime where both propagation
and dissipation are simultaneously suppressed. By operating slightly
below $H_c$, one can even achieve slow-wave conditions with net
amplification ($upright(I m) \( Omega \) > 0$), compensating for
residual losses. While photonic time-varying media have demonstrated
related capabilities through different mechanisms, the magnonic
realization offers complementary advantages: field-driven reversibility
and intrinsic coupling to magnetic phase transitions.

Looking forward, this framework opens pathways toward magnonic time
crystals through a periodic field modulation, temporal topological
phases exploiting momentum-space band gaps, and cascaded amplifiers for
ultra-high gain. The ability to exploit field-driven magnetic phase
transitions---offering rapid, reversible, and precisely controllable
dispersion changes distinct from phase-change or ENZ approaches in
photonics---combined with the discovered synergy between damping and
amplification, suggests that temporal magnonics may complement rather
than compete with existing technologies. By establishing the temporal
modulation as a first-class degree of freedom, this work expands the
magnonic control toolkit beyond the spatial design, enabling
reconfigurable systems where gain, frequency, and routing are programmed
dynamically rather than fixed during the fabrication.

= Methods
<methods>
== Analytical model
<analytical-model>
We consider an ultrathin ferromagnetic film (thickness $d$) with
equilibrium magnetization $upright(bold(m))_0 = \( 0 \, M_s \, 0 \)$
under an external magnetic field
$upright(bold(H))_0 = H_(1 \, 2) hat(upright(bold(y)))$. Small-amplitude
spin-wave dynamics are described by deviations
$upright(bold(m)) = \( m_x \, M_s \, m_z \)$ with
$m_x \, m_z lt.double M_s$.

Neglecting damping, the linearized Landau-Lifshitz equation yields the
dispersion relation:
$ Omega \( k \) = sqrt(omega_x omega_z) - upright(s g n) \( v_(upright(p h)) \) omega_D \, $
where
$omega_x = A \[ h + l_(upright(e x))^2 k^2 - Q + 1 - xi \( \| k \| d \) \]$,
$omega_z = A \[ h + l_(upright(e x))^2 k^2 + xi \( \| k \| d \) \]$, and
$omega_D = A l_D \| k \|$ are characteristic frequencies. Here
$A = gamma mu_0 M_s$, $h = H_1 \/ M_s$, $Q$ parameterizes perpendicular
magnetic anisotropy,
$l_(upright(e x)) = sqrt(A_(upright(e x)) \/ \( 1 / 2 mu_0 M_s^2 \))$
and $l_D = D \/ \( 1 / 2 mu_0 M_s^2 \)$ are exchange and DMI lengths,
and
$xi \( \| k \| d \) = 1 - \( 1 - e^(- \| k \| d) \) \/ \( \| k \| d \)$
accounts for dipolar interactions.

The ellipticity of precession is defined as
$epsilon^z = \| m_z \| \/ \| m_x \| = sqrt(omega_z \/ omega_x)$, which
is independent of DMI and characterizes the precession orbit shape.

=== Temporal interface
<temporal-interface>
A sudden change in the bias field $h_1 arrow.r h_2$ at time $t_0$
creates a temporal interface. The physical continuity of magnetization
requires the wavevector $k$ to remain constant while the frequency
changes: $Omega_1 arrow.r Omega_2$. For an incident
rightward-propagating wave, two waves emerge: transmitted (rightward,
$Omega_2^(\( t \)) > 0$) and reflected (leftward,
$Omega_2^(\( r \)) < 0$).

Applying continuity conditions at the temporal interface yields
transmission and reflection coefficients. For the $m_x$ component:
$ T_x = 1 / 2 (1 + epsilon_1^z / epsilon_2^z) \, quad R_x = 1 / 2 (1 - epsilon_1^z / epsilon_2^z) \, $
and for the $m_z$ component:
$ T_z = 1 / 2 (1 + epsilon_2^z / epsilon_1^z) \, quad R_z = 1 / 2 (1 - epsilon_2^z / epsilon_1^z) \, $
where $epsilon_i^z$ is the precession ellipticity in a temporal region
$i$ (see SI for the detailed derivation).

=== Magnonic impedance
<magnonic-impedance>
By analogy with photonic and electronic impedances, we define the
magnonic impedance $Z_i equiv epsilon_i^z$. In this notation, the
transmission and reflection coefficients become:
$ T_x = 1 / 2 (1 + Z_1 / Z_2) \, quad R_x = 1 / 2 (1 - Z_1 / Z_2) \, $<eq:T_R_impedance_x>
$ T_z = 1 / 2 (1 + Z_2 / Z_1) \, quad R_z = 1 / 2 (1 - Z_2 / Z_1) . $<eq:T_R_impedance_z>
The precession ellipse area transmission coefficient is
$T_S = T_x dot.op T_z$, which always exceeds unity when
$Z_1 eq.not Z_2$, indicating a universal orbit expansion at temporal
interfaces.

=== Complex spin-wave dispersion with Gilbert damping
<complex-spin-wave-dispersion-with-gilbert-damping>
Incorporating Gilbert damping into the linearized
Landau-Lifshitz-Gilbert equations yields:
$ partial_t m_x = omega_x m_z + i s omega_D m_x + alpha partial_t m_z \, $
$ partial_t m_z = - omega_z m_x + i s omega_D m_z - alpha partial_t m_x \, $
where $alpha$ is the Gilbert damping parameter,
$s = upright(s g n) \( v_(upright(p h)) \)$, and $omega_x$, $omega_z$
are the characteristic frequencies defined as
$omega_(x \, z) = gamma mu_0 H_(upright(e f f) \; x \, z)$. Substituting
the plane-wave ansatz in time, $m_(x \, z) prop exp \( - i Omega t \)$,
the condition for nontrivial solutions leads to a quadratic equation
with #strong[complex coefficients]:
$ \( 1 + alpha^2 \) Omega^2 + \[ 2 s omega_D + i alpha \( omega_x + omega_z \) \] Omega + \( omega_D^2 - omega_x omega_z \) = 0 . $<eq:quadratic_dispersion>

The solution
$Omega_plus.minus = upright(R e) \( Omega_plus.minus \) + i thin upright(I m) \( Omega_plus.minus \)$
is given by:
$ upright(R e) \( Omega_plus.minus \) = frac(- 2 s omega_D plus.minus u, 2 \( 1 + alpha^2 \)) \, #h(2em) upright(I m) \( Omega_plus.minus \) = frac(- alpha \( omega_x + omega_z \) plus.minus v, 2 \( 1 + alpha^2 \)) \, $<eq:ReIm_Omega>
where $u$ and $v$ are determined by the complex discriminant
$Delta = X + i Y$:
$ u = sqrt(frac(\| Delta \| + X, 2)) \, #h(2em) v = upright(s g n) \( Y \) sqrt(frac(\| Delta \| - X, 2)) \, $
with $\| Delta \| = sqrt(X^2 + Y^2)$ and
$ X & = 4 \( 1 + alpha^2 \) omega_x omega_z - alpha^2 \[ \( omega_x + omega_z \)^2 + 4 omega_D^2 \] \,\
Y & = 4 s alpha omega_D \( omega_x + omega_z \) . $

The critical frequency separating dynamical regimes is:
$ omega_x^(*) = omega_D^2 / omega_z \, $<eq:omega_x_critical>
corresponding to the condition $upright(R e) \( Omega \) = 0$ at the
onset of the magnetic phase transition. The exceptional point occurs at
$omega_x = 0$, where the two branches coalesce for $alpha = 0$ with
characteristic splitting $\| Omega_(+) - Omega_(-) \| prop sqrt(alpha)$
for finite damping. The physical interpretation of the resulting
dynamical regimes is discussed in the Results section and summarized in
@tab:regimes_results.

=== Amplification rates
<amplification-rates>
For small Gilbert damping ($alpha lt.double 1$, typically
$alpha lt.tilde 0.01$), the imaginary part of frequency exhibits
distinct scaling in each regime. For larger damping
($alpha tilde.op 0.1$), corrections of order 10--20% may apply, but the
qualitative conclusions remain unchanged.

In the #strong[strong instability regime] ($omega_x < 0$):
$ upright(I m) \( Omega_(+) \) approx sqrt(\| omega_x \| omega_z) + frac(alpha \( \| omega_x \| - omega_z \), 2) . $<eq:Im_strong_instability>
The growth rate is dominated by the magnetic instability term
$sqrt(\| omega_x \| omega_z)$, which is independent of $alpha$. The
correction term is linear in $alpha$ and typically small (a few percent
for $alpha tilde.op 0.01$).

For $omega_x > 0$, encompassing both the #strong[slow instability] and
#strong[damping] regimes, a unified formula applies:
$ upright(I m) \( Omega_(+) \) approx frac(alpha \( omega_x + omega_z \), 2) [omega_D / sqrt(omega_x omega_z) - 1] = frac(alpha \( omega_x + omega_z \), 2) [sqrt(omega_x^(*) / omega_x) - 1] . $<eq:Im_unified>
This expression is positive (amplification) when $omega_x < omega_x^(*)$
and negative (damping) when $omega_x > omega_x^(*)$, with the
growth/decay rate scaling #emph[linearly] with $alpha$ in both cases.
The accuracy of these approximations is validated in SI, Fig.~S1.

Specifically, in the #strong[slow instability regime]
($0 < omega_x < omega_x^(*)$):
$ upright(I m) \( Omega_(+) \) > 0 \, quad upright("with rate") prop alpha . $<eq:Im_slow_instability>
Amplification vanishes in the conservative limit $alpha arrow.r 0$.

In the #strong[damping regime] ($omega_x > omega_x^(*)$):
$ upright(I m) \( Omega_(+) \) < 0 \, quad upright("with rate") prop alpha . $<eq:Im_damping>

=== Field boundaries
<field-boundaries>
The regime boundaries in terms of normalized bias field $h = H_0 \/ M_s$
are:
$ h_(upright(E P)) \( k \) = Q - 1 + xi \( k \) - l_(upright(e x))^2 k^2 \, $<eq:h_EP>
$ h_c \( k \) = h_(upright(E P)) \( k \) + frac(omega_D^2 \( k \), gamma mu_0 M_s thin omega_z \( k \)) \, $<eq:h_c>
where $h_(upright(E P))$ corresponds to $omega_x = 0$ (exceptional
point) and $h_c$ to $omega_x = omega_x^(*)$ (critical field, phase
transition onset). The amplification window width:
$ Delta h = h_c - h_(upright(E P)) = frac(omega_D^2, gamma mu_0 M_s thin omega_z) \, $<eq:Delta_h>
scales as $D^2$ and is independent of $alpha$, while the growth rate
within this window scales linearly with $alpha$.

== Micromagnetic simulations
<micromagnetic-simulations>
Numerical simulations were performed using Mumax3
@vansteenkiste2014design to solve the full Landau-Lifshitz-Gilbert
equation. We simulated a CoFeB film with thickness $d = 2$ nm and the
following material parameters: saturation magnetization $M_s = 1420$
kA/m, exchange stiffness $A_(upright(e x)) = 13$ pJ/m, DMI strength
$D = 0.5$ mJ/m$""^2$, damping parameter $alpha = 0.002$ (unless stated
otherwise), and reduced anisotropy constant $Q = 1.1$, where
$Q = frac(K_(upright(P M A)), 1 / 2 mu_0 M_s^2)$ with
$K_(upright(P M A))$ being the uniaxial anisotropy constant. The system
was discretized with unit cells of size $3 times 3 times 2$ nm$""^3$
along the $x$-, $y$-, and $z$-directions respectively. The simulated
geometry comprised a length of 90 μm and width of $30$~nm with periodic
boundary conditions applied along the $x$- and $y$-directions. To
validate that the quasi-one-dimensional geometry does not introduce
artifacts, we performed additional simulations with 1000 cells along the
$y$-direction (instead of a single cell with periodic conditions) and
obtained identical results, confirming that the relevant physics is
effectively one-dimensional for the propagation geometry considered
here.

Each simulation began with a uniform magnetic configuration along the
$y$-direction, which was subsequently relaxed to equilibrium
configuration under a static magnetic field of $300$~mT applied along
the $y$-direction. The dynamic simulations were performed with a locally
applied microwave magnetic field of spatial and temporal profiles
designed first to obtain the dispersion relation and later to excite
propagating wavepackets.

For simulations with a single temporal interface, we employed the
following time dependence of the $y$-component of the external magnetic
field
@eq:singleSmoothInterface. The
step-function limit was obtained by setting the limit $tau arrow.r 0$.
For the simulations with two temporal interfaces forming a temporal
slab, we used @eq:temporal_slab. In
all simulations, we set the location of the center of first temporal
interface at $t_i = 10$~ns.

To compute the dispersion relation, we used the spatial and temporal
dependences of the out-of-plane applied microwave field
$ h_(upright(e x c) \, z) \( t \, x \) = h_0 upright(s i n c) \( k_(upright(c)) x \) upright(s i n c) \( 2 pi f_(upright(c)) \( t - t_0 \) \) \, $
where $t_0 = 10 \/ f_c$, the cutoff parameters
$k_(upright(c)) = 100$~rad/μm and $f_(upright(c)) = 8$~GHz define the
range of excited wavenumbers and frequencies. The simulation results
were recorded with the time step of $\( 2.2 f_(upright(c)) \)^(- 1)$.
The dispersion relation was obtained by computing the two-dimensional
FFT in time and space of the out-of-plane magnetization component $m_z$:
$\| tilde(M)_z \| \( f \, k_x \) = upright(F F T)_(t \, x) \( m_z \)$.
For each dispersion plot, the color scale was normalized to maximize the
readability. To compare dispersions for different magnetic field values
(as shown in @fig:fig_1\(c,d) and~@fig:fig_2\(a)), each FFT result
was mapped to one or more RGB color channels, enabling composite
visualization of multiple field configurations in a single image.

For simulations of spin-wave wavepackets propagating in a selected
direction, we employed the following spatial and temporal dependence of
the out-of-plane applied microwave field@whitehead2019graded:
$ h_(upright(e x c) \, z) \( t \, x \) = h_(upright(e x c) \, 0) G \( t \) G \( x \) \[ sin \( k x \) sin \( 2 pi f_0 t \) + cos \( k x \) cos \( 2 pi f_0 t \) \] \, $
where $h_(upright(e x c) \, 0)$ is the peak amplitude of the excitation
field (typically $mu_0 h_(upright(e x c) \, 0) = 20$ μT),
$G \( t \) = exp \[ - 2.77 \( t - t_0 \)^2 \/ \( 2 sigma_t^2 \) \]$ with
$sigma_t = 1 \/ f_0$ provides the temporal envelope centered at
$t_0 = 4 T$ ($T$ being one period of microwave field oscillation), and
$G \( x \) = exp \[ - x^2 \/ \( 2 sigma_x^2 \) \]$ with
$sigma_x = 40 pi \/ k$ defines the spatial profile. The envelope
parameters correspond to FWHM in space and time domains of approximately
$w_t = 2.355 \/ f_0$ and $w_x = 295.6 \/ k$ (or $w_x = 47.1 thin lambda$
wavelengths), respectively. The wavenumber $k$ and frequency $f_0$ were
determined from the dispersion relations obtained in the previous
simulations. The simulation results of wavepacket scattering were
recorded with the time step of $\( 4 f_0 \)^(- 1)$.

To analyze the spatiotemporal propagation of spin-wave wavepackets, we
processed the micromagnetic simulation results of the in-plane and
out-of-plane magnetization component $m_(x \, z) \( t \, x \)$ using the
Hilbert transform. At each time instant, the Hilbert transform was
applied to extract the wavepacket envelope. To maximize the accuracy of
the envelope representation, we applied Fourier filtering to remove
high-frequency spatial components of wavelength smaller than $10$~nm,
and adjusted the envelope maximum to align with the actual wavepacket
maximum. This refinement was justified because the wavepackets were
significantly broader than the wavelength. Using this procedure, we
tracked both the trajectory (center of mass) and the FWHM of the
wavepacket envelope with high precision. Representative examples of
wavepacket propagation and envelope evolution are shown in
@fig:fig_1[]--@fig:fig_6.

To extract transmission and reflection coefficients from the
micromagnetic simulations, we separated incident, transmitted, and
reflected wavepackets using two-dimensional Fourier analysis of the
magnetization dynamics $m \( x \, t \)$.

The power spectrum in frequency-wavevector space reveals two branches
corresponding to rightward ($k > 0$ at $f > 0$ and $k < 0$ at $f < 0$)
and leftward ($k < 0$ at $f > 0$ and $k > 0$ at $f < 0$) propagating
modes. Due to nonreciprocal dispersion, counterpropagating modes at
$plus.minus \| k \|$ have different frequencies. We identified the
dominant wavevector $\| k \|$ from the integrated power spectrum, then
extracted frequency profiles at $k = plus.minus \| k \|$ using a narrow
integration window. Peak detection with Gaussian smoothing identified
the characteristic frequencies for each propagation direction.

Wavepackets were separated by applying spectral masks to the
Fourier-transformed data. Each mask consisted of two Gaussian envelopes
centered at $\( f_i \, + \| k \| \)$ and $\( - f_i \, - \| k \| \)$ with
widths $sigma_f = 10$ and $sigma_k = 5$ frequency and wavevector points,
respectively. Inverse FFT of the masked spectra yielded complex
wavepackets amplitude $psi \( x \, t \)$.

The envelope amplitudes were obtained as spatial maxima of
$\| psi \( x \, t \) \|$ at each simulation time step and fitted to
exponential functions $A + B exp \( - t \/ eta \)$ in the
quasi-steady-state regime ($t gt.double t_i$). This approach avoids
artifacts from the FFT boundary effects due to assumed temporal
periodicity. Transmission and reflection coefficients were calculated by
extrapolating these fits to the interface time $t_i$ and computing
amplitude ratios immediately after and before the temporal interface.

For gradual temporal interfaces (@fig:fig_4\(j)), the
dispersion-based FFT filtering approach was unsuccessful, as gradual
field transitions do not produce sharp, well-defined modes in the
dispersion relation. Instead, we employed a direct fitting approach: the
time-dependent amplitude envelope was fitted to a damped oscillation
model superimposed on a polynomial background:
$ A \( t \) = A_(upright(o s c)) e^(- t \/ tau) cos \( omega t + phi.alt \) + P \( t \) \, $
where $A_(upright(o s c))$ is the oscillation amplitude, $tau$ is the
decay time, $omega$ and $phi.alt$ are the frequency and phase, and
$P \( t \)$ is a polynomial background. From the fitted parameters
$A_(upright(o s c))$ and the background value $B = P \( 0 \)$, the
transmission and reflection coefficients were calculated using:
$ \| t \| = frac(sqrt(B + A_(upright(o s c))) + sqrt(B - A_(upright(o s c))), 2) \, quad \| r \| = frac(sqrt(B + A_(upright(o s c))) - sqrt(B - A_(upright(o s c))), 2) . $

= Acknowledgements
<acknowledgements>
The research leading to these results has received funding from the
Polish National Science Centre projects No. 2019/35/D/ST3/03729 and
2022/45/N/ST3/01844.

#heading(level: 1, numbering: none)[Author Contributions]
<author-contributions>
P.G. conceived the project and developed the analytical framework. K.S.
developed the simulation codes, performed the micromagnetic simulations,
and designed the wave-packet separation algorithm. P.G. conducted the
theoretical analysis and prepared the Supplementary Information
including the simulations presented therein. P.G. wrote the manuscript
with the input of K.S. Both authors discussed the results and revised
the manuscript. P.G. supervised the project. P.G. and K.S. independently
acquired funding.

#heading(level: 1, numbering: none)[Competing Interests]
<competing-interests>
The authors declare no competing financial interests.

#heading(level: 1, numbering: none)[Data availability]
<data-availability>
The data that support the findings of this study are available from the
corresponding authors upon reasonable request. The micromagnetic
simulations were performed using the open-source software Mumax3
(version 3.10). Example Mumax3 input files and minimal post-processing
scripts used to generate the key figures in this work will be made
available on Zenodo under DOI: XX.XXXX/zenodo.XXXXXXX upon publication
of the manuscript.

#bibliography("references.bib", style: "nature")
