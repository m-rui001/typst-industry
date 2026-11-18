#set page(paper:"a4", margin:23mm, numbering:"1")
#set text(font:"Libertinus Serif", size:10.5pt)
#set par(justify:true, leading:.6em)
#set heading(numbering:"1.1")
#set math.equation(numbering:"(1)")
#show figure.caption: set text(size:9pt)
#align(center)[
  #text(size:16pt,weight:"bold")[Exceptional Point Dynamics in Photonic Time Crystals for Enhanced Optical Sensing]
  #v(.6em)
  Saurabh Mani Tripathi#super[1], Shalini Kumari#super[2], Krishnan Kundan#super[2], and Neha Ahlawat#super[1]
  #v(.5em)
  #super[1] Optics and Photonics Centre, Indian Institute of Technology Delhi, New Delhi 110016, India \
  #super[2] Department of Physics, Indian Institute of Technology Delhi, New Delhi 110016, India
]

*Abstract.* Exceptional points (EPs) in non-Hermitian photonics offer singular sensitivity enhancements but have thus far been realized almost exclusively in spatially engineered platforms with fixed geometries and limited tunability. Here we extend EP physics into the temporal domain by introducing balanced gain--loss modulation in a photonic time crystal (PTC). A time-periodic refractive-index modulation $n \( t \) = n_0 + delta n cos \( Omega t \)$ generates an effective non-Hermitian Floquet Hamiltonian that supports coalescence of quasi-eigenmodes in frequency space, constituting a genuine #emph[temporal exceptional point]. Using a reduced two-mode model for the dominant frequency sidebands, we derive a non-Hermitian dimer Hamiltonian $H_(upright(P T)) \( Delta \, gamma \, kappa \)$ that is strictly $cal(P T)$-symmetric for $Delta = 0$ and identify the exact EP condition. Numerical analysis reveals the associated Riemann-sheet topology, mode exchange and Berry-phase accumulation upon encirclement of the EP, and the characteristic $sqrt(epsilon)$ perturbation response indicative of enhanced sensing. We further construct a non-Hermitian transmission model that is exact within the reduced two-mode description, compute the Cramér--Rao bound (CRB) for temperature estimation under an explicit noise model, and show that EP-enhanced sensitivity persists when compared to a linewidth-matched Hermitian reference under identical resource constraints. Monte Carlo simulations confirm that the CRB is saturable using spectral measurements. These results establish temporal non-Hermiticity as a new paradigm for dynamically reconfigurable, broadband, and geometry-independent exceptional-point photonics.

= Introduction
<sec:intro>
Non-Hermitian photonics has emerged as a powerful framework for
controlling light--matter interactions by engineering gain and loss in
optical systems~@ElGanainy2018@Feng2017@Ozdemir2019@Miri2019@Cao2020. In
parity--time ($cal(P T)$)-symmetric structures, balanced gain and loss
can yield entirely real eigenvalue spectra below a symmetry-breaking
threshold, even though the underlying Hamiltonian is
non-Hermitian~@ElGanainy2018@Ozdemir2019. At a critical value of the
gain--loss parameter, the system encounters an #emph[exceptional point]
(EP), where both eigenvalues and eigenvectors coalesce and the
Hamiltonian becomes nondiagonalizable. In the vicinity of such a
non-Hermitian degeneracy, observable quantities such as frequency
splitting exhibit a non-linear dependence on external perturbations,
typically scaling as $sqrt(epsilon)$ rather than $epsilon$. This
square-root response amplifies small perturbations and has been proposed
and demonstrated as a route to enhanced
sensing~@Wiersig2014@Wiersig2016@WiersigReview2020@Miri2019.

Optical EPs have been realized in a variety of #emph[spatially]
engineered platforms, including coupled resonators, photonic-crystal
cavities, and microtoroids, as well as in electronic and microwave
circuits~@Schmidt2015@Schindler2012@Lin2016@Xu2021@Park2020@Li2021@Peng2014.
Hodaei #emph[et al.]~@Hodaei2017 and Chen #emph[et al.]~@Chen2017
independently demonstrated EPs in coupled microring and
whispering-gallery resonators, achieving strong enhancement of the
frequency-splitting response to
perturbations~@Hodaei2017@Chen2017@Wiersig2014@WiersigReview2020.
Subsequent work has explored higher-order EPs, cascaded non-Hermitian
structures, and EP-based inertial sensors to further enlarge the
parameter space for ultra-sensitive
measurements~@Hodaei2017@WiersigReview2020@DeCarlo2022@Kononchuk2022.
Dynamical encirclement of EPs and associated chiral mode conversion have
also been demonstrated in optical and microwave
systems~@Hassan2015@Peng2014. Despite these advances, existing
implementations share a common limitation: the non-Hermiticity is
embedded in a fixed #emph[spatial] geometry. Once fabricated, the
refractive-index distribution $n \( x \)$, coupling coefficients, and
gain--loss profiles are largely static, which constrains tunability,
bandwidth, and the ability to reconfigure the EP in situ.

A complementary route to non-Hermitian photonics is to shift the locus
of control from space to #emph[time]. In temporally modulated
media---often referred to as photonic time crystals (PTCs)---the
refractive index varies periodically in time,
$n \( t \) = n_0 + delta n cos \( Omega t \)$, generating a Floquet band
structure in frequency rather than in wave
vector~@Zhang2021@Wang2020@Titchener2020. Temporal modulation couples
spectral components separated by integer multiples of the modulation
frequency $Omega$, leading to bandgaps and mode hybridization in the
frequency domain. When combined with gain and loss, these time-periodic
systems realize explicitly non-Hermitian time-Floquet Hamiltonians that
can host exceptional points and other non-Hermitian singularities in the
#emph[temporal]
domain~@Koutserimpas2018@Longhi2023@Yoshida2020@Wang2020. In this
setting, EPs correspond to coalescence of Floquet quasi-eigenvalues in
frequency space and can be tuned dynamically by varying the modulation
amplitude, frequency, or phase~@Longhi2023@Zhang2021.

The distinction between spatial and temporal EP platforms is summarized
schematically in @fig:spatial_vs_temporal_EP. Spatial EP devices,
such as coupled cavities or gratings, realize non-Hermiticity through
engineered distributions $n \( x \)$ and fixed coupling. Their spectra
are defined in $\( k \, omega \)$ space and are constrained by
fabrication tolerances and device
footprint~@Feng2017@ElGanainy2018@Ozdemir2019@WiersigReview2020. By
contrast, temporal EPs arise in uniform media subject to externally
driven $n \( t \)$ and gain--loss modulation. Here, the relevant band
structure is defined in $\( omega \, Omega \)$ space, and the operating
point can be tuned in real time by adjusting drive
parameters~@Zhang2021@Wang2020@Titchener2020. This naturally enables
broadband operation, adaptive sensitivity control, and
reconfigurability, all of which are highly desirable for integrated
photonic sensing.

In this work we develop a minimal, yet fully non-Hermitian, theoretical
model for temporal exceptional points in a photonic time crystal and
connect it quantitatively to sensing performance. Starting from
Maxwell's equations in a time-modulated dielectric, we derive a reduced
two-mode Floquet model that captures the dominant coupling between a
pair of frequency components. This leads to an effective non-Hermitian
dimer Hamiltonian $H_(upright(P T)) \( Delta \, gamma \, kappa \)$,
where $Delta$ is a detuning parameter that can be controlled by
temperature or refractive-index changes, $gamma$ represents balanced
gain/loss, and $kappa$ is the modulation-induced coupling. We obtain
closed-form expressions for the eigenvalues, identify the exact EP
condition, and map out the resulting Riemann surfaces.

We then compute geometric signatures of the temporal EP. By encircling
the EP in the $\( Delta \, gamma \)$ parameter plane, we observe mode
exchange and accumulation of a biorthogonal Berry phase of magnitude
$pi$, which serves as a robust topological indicator of the EP. Next, we
formulate a non-Hermitian scattering problem and derive the transmission
spectrum $\| T \( omega \) \|^2$ of a probe field interacting with the
PTC. This transmission model is used to define a realistic sensing
protocol in which temperature-induced shifts of the detuning are
inferred from spectral measurements. We compute the Cramér--Rao bound
(CRB) for temperature estimation directly from the Fisher information
under a clearly stated noise model, construct a linewidth-matched
Hermitian reference that is operated under identical resource
constraints, and demonstrate a clear EP-induced CRB reduction. Finally,
extensive Monte Carlo simulations confirm that the CRB for both the
temperature and the associated eigenvalue splitting can be saturated
using least-squares fitting to the exact transmission model.

Our results show that temporal non-Hermiticity provides a flexible and
dynamically reconfigurable platform for exceptional-point sensing.
Unlike static spatial EP devices, temporal EPs can be tuned on demand by
adjusting the modulation parameters, enabling broadband operation and
adaptive sensitivity while preserving the underlying EP
topology~@Longhi2023@Wang2020@Zhang2021.

#figure(image("source/Figure1_1.pdf", width: 85.0%),
  caption: [
    Conceptual comparison between spatial and temporal exceptional-point
    (EP) systems. (a) Spatial EP devices rely on engineered
    refractive-index profiles $n \( x \)$ and fixed coupling to realize
    non-Hermitian band structures in momentum space. (b) In photonic
    time crystals (PTCs), a uniform medium with time-periodic
    refractive-index modulation
    $n \( t \) = n_0 + delta n cos \( Omega t \)$ and dynamic gain--loss
    $gamma \( t \)$ yields an effective non-Hermitian Floquet
    Hamiltonian in the frequency domain, enabling tunable temporal EPs.
  ]
)
<fig:spatial_vs_temporal_EP>

= Theoretical Model and Effective Hamiltonian
<sec:model>
== From time-varying permittivity to a non-Hermitian dimer
<from-time-varying-permittivity-to-a-non-hermitian-dimer>
We consider a homogeneous medium whose permittivity varies periodically
in time,
$ epsilon.alt \( t \) = epsilon.alt_0 #scale(x: 120%, y: 120%)[\[] 1 + m cos \( Omega t \) #scale(x: 120%, y: 120%)[\]] \, $<eq:epsilon_time>
where $m lt.double 1$ is the modulation depth and $Omega$ is the
modulation frequency. In the absence of gain and loss, the electric
field $E \( z \, t \)$ in such a medium satisfies the one-dimensional
wave equation
$ partial_z^2 E \( z \, t \) - mu_0 epsilon.alt \( t \) thin partial_t^2 E \( z \, t \) = 0 . $
For a monochromatic carrier at frequency $omega_0$ near a particular
guided or cavity mode with propagation constant $beta_0$, we expand the
field in a truncated Floquet basis as
$ E \( z \, t \) = #scale(x: 180%, y: 180%)[\[] a_1 \( t \) e^(- i omega_0 t) + a_2 \( t \) e^(- i \( omega_0 + Omega \) t) #scale(x: 180%, y: 180%)[\]] e^(i beta_0 z) + upright("H.c.") \, $<eq:floquet_ansatz>
where $a_(1 \, 2) \( t \)$ are slowly varying envelopes associated with
the two dominant frequency components. Substituting this ansatz into
Maxwell's equations in the time-varying medium and applying the
rotating-wave and slowly varying envelope approximations yields a pair
of coupled-mode equations for the Floquet amplitudes. Retaining only
near-resonant terms and assuming a weak modulation $m lt.double 1$ so
that higher-order sidebands remain off-resonant, we obtain
$ dot(a)_1 & = - i \( Delta + i gamma \) thin a_1 - i kappa thin a_2 \,\
dot(a)_2 & = - i kappa thin a_1 \, - i \( - Delta - i gamma \) thin a_2 \, $ <eq:cmt>
where $kappa$ is the effective modulation-induced coupling between the
two Floquet modes, $gamma$ is an effective gain/loss rate that can be
implemented, for example, via pump-induced amplification in one
component and balanced attenuation in the other, and $Delta$ represents
a detuning that can be tuned by temperature or refractive-index changes.
The detailed steps of this reduction from the full Maxwell equations,
together with estimates of the regime of validity of the two-mode
truncation, are provided in the Supplementary Information.

@eq:cmt can be written compactly as
$ dot(upright(bold(a))) = - i H_(upright(P T)) thin upright(bold(a)) \, #h(2em) upright(bold(a)) = vec(a_1, a_2) \, $
with the effective non-Hermitian dimer Hamiltonian
$ H_(upright(P T)) \( Delta \, gamma \, kappa \) = mat(delim: "(", Delta + i gamma, kappa; kappa, - Delta - i gamma) . $<eq:H_PT>
For $Delta = 0$, this Hamiltonian is $cal(P T)$-symmetric in the
standard sense, with $P = sigma_x$ and $T$ the complex-conjugation
operator, and exhibits an unbroken $cal(P T)$ phase for
$\| gamma \| < \| kappa \|$ and a broken phase for
$\| gamma \| > \| kappa \|$~@ElGanainy2018@Ozdemir2019. For
$Delta eq.not 0$, the Hamiltonian is no longer $cal(P T)$-symmetric,
though the EP still exists at
$Delta = 0 \, med gamma = plus.minus kappa$ for each fixed $kappa$, as
discussed below. In all cases, the degrees of freedom correspond to
frequency sidebands rather than spatial modes, making
@eq:H_PT the temporal analogue of the widely
studied coupled-resonator $cal(P T)$ dimer~@Feng2017@Miri2019.

== Eigenvalues and exceptional-point condition
<eigenvalues-and-exceptional-point-condition>
The eigenvalues of $H_(upright(P T))$ are obtained in closed form as
$ lambda_plus.minus = plus.minus sqrt(\( Delta + i gamma \)^2 + kappa^2) . $<eq:lambda_exact>
We emphasize that @eq:lambda_exact is
used #emph[throughout] our analysis; no approximate eigenvalue formulas
or surrogate polynomials are employed in any of the numerics below. The
corresponding EP condition follows from the coalescence of the two
eigenvalues and eigenvectors, which occurs when the argument of the
square root vanishes, $ \( Delta + i gamma \)^2 + kappa^2 = 0 . $ For
real-valued $Delta$ and $gamma$, this yields the EP locus
$ Delta_(upright(E P)) = 0 \, #h(2em) gamma_(upright(E P)) = plus.minus kappa . $<eq:EP_condition>
In the three-dimensional parameter space $\( Delta \, gamma \, kappa \)$
this locus forms a line; for fixed coupling $kappa$ it corresponds to
the pair of points $\( Delta \, gamma \) = \( 0 \, plus.minus kappa \)$.
At these points $H_(upright(P T))$ becomes nondiagonalizable and the
eigenvectors coalesce, as in other second-order EP
implementations~@Wiersig2014@Ozdemir2019.

== Normalization, parameter choices, and temperature-induced detuning
<normalization-parameter-choices-and-temperature-induced-detuning>
To present the results in a dimensionless and platform-independent way,
we normalize all frequencies and rates to a reference coupling scale
$g_0$. Unless otherwise stated, we set $kappa = g_0$ so that
$Delta \/ g_0$, $gamma \/ g_0$, and $lambda_plus.minus \/ g_0$ provide a
convenient parametrization of the eigenvalue landscape. This choice does
not restrict generality and can be mapped to physical units once a
specific implementation platform is specified.

In a realistic implementation, temperature changes modify the effective
refractive index $n_(upright(e f f)) \( T \)$ and hence the detuning,
$ Delta \( T \) = Delta_0 + alpha_T \( T - T_0 \) \, $ where
$alpha_T = d Delta \/ d T$ is an effective thermo-detuning coefficient.
Throughout the sensing analysis below, we treat $Delta T = T - T_0$ as
the primary perturbation and examine how the complex eigenvalues and
associated observables respond as the system is biased near the EP. For
the numerical examples, we choose parameters such that all effective
decay rates remain negative (see Sec.~@sec:transmission), ensuring
dynamical stability.

= Eigenvalue Topology and EP Encirclement
<sec:topology>
We begin by characterizing the eigenvalue landscape of
@eq:H_PT as a function of detuning $Delta$ and
gain/loss $gamma$. @fig:A summarizes the behavior of the real and
imaginary parts of $lambda_plus.minus$ and highlights the location of
the EP.

#figure(image("source/FigA_Eigs_ExactMaps.pdf"),
  caption: [
    Exact eigenvalue landscape of the temporal non-Hermitian dimer. (a)
    and (b) Real and imaginary parts of $lambda_(+)$ as functions of
    detuning $Delta \/ g_0$ for several values of $gamma \/ g_0$,
    illustrating the transition from the unbroken $cal(P T)$ phase
    ($gamma < kappa$) through the EP ($gamma = kappa$) into the broken
    phase ($gamma > kappa$) at $Delta = 0$. (c) and (d) Two-dimensional
    maps of the mode splitting $\| lambda_(+) - lambda_(-) \| \/ g_0$
    and the magnitude of the imaginary part
    $\| upright(I m) thin lambda_(+) \| \/ g_0$ over the
    $\( Delta \/ g_0 \, gamma \/ g_0 \)$ plane. The EP appears as a
    pinch point at $\( Delta \, gamma \) = \( 0 \, plus.minus kappa \)$.
  ]
)
<fig:A>

@fig:B displays the real parts of the two eigenvalue sheets over
the $\( Delta \, gamma \)$ plane, revealing the characteristic
double-sheeted Riemann surface. The two branches meet at the EP points
and form a square-root branch cut; a continuous path that crosses the
branch cut leads to sheet exchange, in direct analogy with spatial EP
platforms~@Wiersig2014@Ozdemir2019.

#figure(image("source/FigB_Riemann_Re_exact.pdf"),
  caption: [
    Riemann topology of the exact eigenvalues. Real parts of the
    eigenvalue sheets for (a) $lambda_(+)$ and (b) $lambda_(-)$, as
    functions of $\( Delta \/ g_0 \, gamma \/ g_0 \)$. The two sheets
    coalesce at the EP points along $Delta = 0$ and
    $gamma = plus.minus kappa$, forming a double-sheeted Riemann surface
    with a square-root branch point.
  ]
)
<fig:B>

To probe the geometric and topological properties of the EP, we
adiabatically encircle the EP in the $\( Delta \, gamma \)$ plane while
tracking the biorthogonal eigenvectors of $H_(upright(P T))$. We
construct left and right eigenvectors $\( v_L \, v_R \)$ that satisfy
the biorthogonality condition $v_L^dagger v_R = bb(I)$ and compute the
accumulated Berry phase from the biorthogonal Berry connection. In the
continuous limit, the geometric phase acquired along a closed loop $C$
in parameter space is
$ phi.alt_B = i integral.cont_C #h(-1em) #h(-1em) upright(d) bold(lambda) dot.op #scale(x: 120%, y: 120%)[chevron.l] v_L \( bold(lambda) \) #scale(x: 120%, y: 120%)[\|] nabla_(bold(lambda)) v_R \( bold(lambda) \) #scale(x: 120%, y: 120%)[chevron.r] \, $<eq:Berry_cont>
where $bold(lambda) = \( Delta \, gamma \)$. In the numerics, we
discretize the loop into $N$ points labeled by an angle $theta_k$ and
evaluate
$ phi.alt_B approx - upright(I m) thin ln product_(k = 0)^(N - 1) #scale(x: 120%, y: 120%)[chevron.l] v_L \( theta_k \) #scale(x: 120%, y: 120%)[\|] v_R \( theta_(k + 1) \) #scale(x: 120%, y: 120%)[chevron.r] \, $<eq:Berry_discrete>
with $theta_N equiv theta_0$ ensuring gauge invariance. The resulting
mode exchange and phase accumulation are shown in @fig:C. Similar
EP-encirclement phenomena have been reported in spatial non-Hermitian
systems~@Hassan2015@Peng2014.

#figure(image("source/FigC_Encirclement_BerryPhase_exact.pdf"),
  caption: [
    Encirclement of the EP and Berry-phase accumulation. (a) Parametric
    loop in the $\( Delta \/ g_0 \, gamma \/ g_0 \)$ plane encircling
    the EP. (b) Biorthogonal Berry phase $phi.alt_B \( theta \)$ as a
    function of the loop angle $theta$, obtained from the product of
    overlaps of left and right eigenvectors along the path according to
    @eq:Berry_discrete. A total
    phase of magnitude $pi$ is accumulated after one encirclement,
    confirming the nontrivial EP topology. The calculation is purely
    parametric in $\( Delta \, gamma \)$ and does not assume a specific
    dynamical encirclement protocol in time.
  ]
)
<fig:C>

The appearance of mode exchange and a Berry phase of $pi$ is a robust
indicator of a genuine second-order EP and is insensitive to small
deformations of the loop, as further quantified in Supplementary
Fig.~S2.

= Non-Hermitian Transmission Model and Sensing Protocol
<sec:transmission>
To connect the temporal EP to measurable quantities, we embed the
non-Hermitian dimer into a simple scattering geometry in which one of
the modes is coupled to an input/output channel. A concrete physical
realization is a single-mode ring resonator or guided mode whose
effective index is modulated in time according to
@eq:epsilon_time, with balanced gain
and loss implemented via optical pumping or carrier modulation in two
spectral components~@Zhang2021@Park2020. The effective non-Hermitian
Hamiltonian including internal loss $kappa_0$ can be written as
$ H_(upright(e f f)) = H_(upright(P T)) \( Delta \, gamma \, kappa \) - i kappa_0 bb(I) \, $<eq:Heff>
where $kappa_0 > 0$ represents additional uniform decay (e.g., intrinsic
cavity loss) and ensures overall stability when chosen such that all
eigenvalues of $H_(upright(e f f))$ have negative imaginary parts.

For a probe field at frequency $omega$, the steady-state intracavity
amplitudes satisfy the frequency-domain input--output relation
$ #scale(x: 120%, y: 120%)[\[] i omega bb(I) - H_(upright(e f f)) #scale(x: 120%, y: 120%)[\]] upright(bold(a)) \( omega \) = sqrt(kappa_(upright(i n))) thin upright(bold(s))_(upright(i n)) \( omega \) \, $<eq:io_matrix>
where $kappa_(upright(i n))$ is an input coupling rate and
$upright(bold(s))_(upright(i n)) = \( s_(upright(i n)) \, 0 \)^(sans(T))$
denotes a source driving only the first Floquet mode. The transmitted
field in the same channel is then
$ s_(upright(o u t)) \( omega \) = s_(upright(i n)) \( omega \) - sqrt(kappa_(upright(i n))) thin a_1 \( omega \) \, $
so that the observable transmission spectrum is
$ T \( omega \) = frac(s_(upright(o u t)) \( omega \), s_(upright(i n)) \( omega \)) = 1 - kappa_(upright(i n)) #scale(x: 120%, y: 120%)[\[] \( i omega bb(I) - H_(upright(e f f)) \)^(- 1) #scale(x: 120%, y: 120%)[\]]_11 \, $<eq:T_exact>
and $\| T \( omega \) \|^2$ is the measurable intensity transmission.
Equation~@eq:T_exact provides an exact
expression for the transmission within the reduced two-mode
non-Hermitian model. In all numerical calculations we evaluate
@eq:T_exact without additional
approximations.

In our implementation, we choose $kappa$ and $gamma$ such that the
system is biased close to the EP while ensuring dynamical stability by
enforcing $upright(I m) thin lambda_plus.minus - kappa_0 < 0$\; a
representative choice is $kappa \/ g_0 = 1$, $gamma \/ g_0 lt.tilde 1$,
and $kappa_0 \/ g_0 gt.tilde 1$. Temperature enters via $Delta \( T \)$,
and we treat $Delta T$ as the parameter to be inferred from noisy
measurements of $\| T \( omega \) \|^2$. This defines a concrete sensing
protocol that can be analyzed within the framework of estimation theory,
in direct analogy to EP-based sensing strategies discussed in
Refs.~@Wiersig2014@Wiersig2016@WiersigReview2020@DeCarlo2022.

In this work, we adopt a frequency-independent Gaussian noise model for
the measured spectrum $\| T \( omega \) \|^2$, corresponding to the
experimentally relevant regime where the dominant fluctuations arise
from detector and electronic technical noise rather than photon shot
noise. In such configurations the variance $sigma^2$ remains
approximately constant across the full scan window, which justifies the
likelihood and Fisher--information expressions in
@eq:19 through @eq:CRB_theta.
Importantly, our sensitivity enhancement is therefore not claimed as a
fundamental quantum-limit violation; the "no-go" theorems for EP-based
metrology under fixed-photon-flux, shot-noise-limited conditions remain
fully valid. Instead, the advantage demonstrated here reflects a
practical enhancement that naturally emerges in realistic
detector-noise-limited experiments, where steep dispersive features near
an EP increase the slope of the transmittance curve without
simultaneously amplifying the technical noise floor.

= Sensing Response and CRB-Based Enhancement
<sec:results_sensing>
== Noise model, Fisher information, and Cramér--Rao bound
<noise-model-fisher-information-and-cramérrao-bound>
We model the sensing process as follows. The transmission spectrum is
sampled at a discrete set of probe frequencies ${ omega_j }_(j = 1)^N$
over a fixed bandwidth, and the measured intensities are
$ y_j = \| T \( omega_j \; Delta T \) \|^2 + xi_j \, $ where $xi_j$
represents additive measurement noise. Throughout, we assume
independent, zero-mean Gaussian noise with variance $sigma^2$,
$ xi_j tilde.op cal(N) \( 0 \, sigma^2 \) \, $ representing the combined
effect of detector noise and technical fluctuations under a fixed input
power and integration time. The same noise variance $sigma^2$ and
sampling grid ${ omega_j }$ are used for both the EP configuration and
the Hermitian reference, ensuring that the comparison is carried out
under identical resource constraints.

Let $theta equiv Delta T$ denote the parameter to be estimated. The
noise-free model predictions are
$mu_j \( theta \) = \| T \( omega_j \; theta \) \|^2$, and the
likelihood of the data $upright(bold(y)) = \( y_1 \, dots.h \, y_N \)$
is
$ p \( upright(bold(y)) \| theta \) prop exp #h(-1em) [- frac(1, 2 sigma^2) sum_(j = 1)^N #scale(x: 120%, y: 120%)[\(] y_j - mu_j \( theta \) #scale(x: 120%, y: 120%)[\)]^2] . $<eq:19>
The Fisher information for $theta$ is then
$ F \( theta \) = 1 / sigma^2 sum_(j = 1)^N #scale(x: 240%, y: 240%)[\(] frac(partial mu_j \( theta \), partial theta) #scale(x: 240%, y: 240%)[\)]^2 \, $<eq:Fisher>
and the Cramér--Rao bound (CRB) states that the variance of any unbiased
estimator $hat(theta)$ obeys
$ upright(V a r) \( hat(theta) \) gt.eq upright(C R B)_theta = frac(1, F \( theta \)) . $<eq:CRB_theta>
For the eigenvalue splitting
$R \( theta \) = \| lambda_(+) \( theta \) - lambda_(-) \( theta \) \|$,
the corresponding CRB is obtained by error propagation,
$ upright(C R B)_R = #scale(x: 240%, y: 240%)[\(] frac(partial R, partial theta) #scale(x: 240%, y: 240%)[\)]^2 upright(C R B)_theta . $<eq:CRB_R>

In the numerics, we choose $N = 201$ frequency samples uniformly
spanning a window of width $4 g_0$ around the resonance and a
representative noise level $sigma tilde.op 10^(- 3)$ in normalized
intensity units. These values are consistent with realistic
photodetector noise levels for moderate optical powers and integration
times. All reported CRBs are evaluated using
@eq:Fisher through @eq:CRB_R
and the exact transmission model~@eq:T_exact.
This CRB-based analysis directly addresses concerns that EP-enhanced
eigenvalue susceptibilities do not automatically translate into improved
signal-to-noise ratio or estimation
precision~@Langbein2018@LauClerk2018@Bao2021@Duggan2022@Loughlin2024.

== Spectral response, CRB, and Monte Carlo validation
<spectral-response-crb-and-monte-carlo-validation>
We first examine how the transmission spectrum responds to
temperature-induced detuning shifts. @fig:D shows
$\| T \( omega \) \|^2$ for several values of $Delta T$ around the
operating point, together with the corresponding eigenvalue splitting
and its estimation accuracy.

#figure(image("source/FigD_Spectra_CRB_MC_Residuals_exact.pdf"),
  caption: [
    Exact spectral response and estimator validation. (a) Transmission
    spectra $\| T \( omega \) \|^2$ for several temperature shifts
    $Delta T$, computed from the exact non-Hermitian scattering model in
    @eq:T_exact. (b) Eigenvalue splitting
    $R = \| lambda_(+) - lambda_(-) \| \/ g_0$ versus $Delta T$, showing
    excellent agreement between the true splitting (solid), the
    Cramér--Rao bound (CRB) prediction obtained from
    @eq:Fisher through @eq:CRB_R,
    and Monte Carlo (MC) estimates from noisy spectra (error bars).
    (c1)--(c3) Representative residuals between noisy spectra and
    best-fit spectra at three values of $Delta T$, $- 3.0$ K, $0.0$ K,
    and $+ 3.0$ K. (d) Histogram of residuals at $Delta T approx 0$,
    demonstrating Gaussian noise and negligible model mismatch.
  ]
)
<fig:D>

To validate the CRB analysis, we generate $10^3$ synthetic spectra at
each $Delta T$ by sampling the noise according to the Gaussian model and
fit them using nonlinear least squares to the exact transmission model
with $Delta T$ as the only free parameter. The variances of the
resulting estimates $accent(Delta T, ̂)$ and $hat(R)$ are found to agree
with the CRBs within a few percent. The residuals are
Gaussian-distributed and have subpercent magnitude, confirming that the
model accurately captures the spectral response and that the estimator
is effectively optimal (see also Supplementary Fig.~S4).

== CRB-based sensitivity enhancement at the EP
<crb-based-sensitivity-enhancement-at-the-ep>
To quantify the enhancement provided by the temporal EP, we compare the
CRB for temperature estimation at the EP bias to that of a Hermitian
reference system with the same effective linewidth and operated under
the same noise and sampling conditions. Specifically, we define
$ eta_(upright(C R B)) = upright(C R B)_(Delta T \, upright(l i n)) / upright(C R B)_(Delta T \, upright(E P)) \, $
where $upright(C R B)_(Delta T \, upright(E P))$ is computed at a
near-EP operating point and $upright(C R B)_(Delta T \, upright(l i n))$
is evaluated for a purely lossy (Hermitian) cavity whose linewidth is
matched to that of the EP configuration. The Hermitian reference is
described by a single-mode transmission function
$ T_(upright(l i n)) \( omega \) = 1 - frac(kappa_(upright(i n)), i \( omega - omega_c \) + kappa_(upright(t o t))) \, $
with total decay rate $kappa_(upright(t o t))$ chosen such that the full
width at half maximum of $\| T_(upright(l i n)) \( omega \) \|^2$
coincides with that of the EP configuration at the operating point. The
same set of probe frequencies ${ omega_j }$ and noise variance $sigma^2$
is used to compute $upright(C R B)_(Delta T \, upright(l i n))$ via
@eq:Fisher and
@eq:CRB_theta.

@fig:E summarizes the dependence of $eta_(upright(C R B))$ on
$gamma \/ g_0$ and confirms that $eta_(upright(C R B)) > 1$ over a broad
parameter range.

#figure(image("source/FigE_SNR_enhancement_exact.pdf"),
  caption: [
    Cramér--Rao bound (CRB) based sensitivity enhancement. (a)
    Enhancement factor
    $eta_(upright(C R B)) = upright(C R B)_(Delta T \, upright(l i n)) \/ upright(C R B)_(Delta T \, upright(E P))$
    as a function of the gain--loss parameter $gamma \/ g_0$, showing
    $eta_(upright(C R B)) > 1$ over a broad range. (b) Comparison of
    effective linewidths of the EP configuration and the matched
    Hermitian reference, demonstrating that the enhancement is not a
    trivial consequence of linewidth narrowing. Both systems are
    compared under identical noise variance, sampling grid, and input
    power.
  ]
)
<fig:E>

This comparison addresses a key concern in EP sensing, namely that
enhanced sensitivity might arise solely from narrowing spectral features
rather than from the non-Hermitian degeneracy itself. By matching the
linewidths and enforcing identical noise and sampling conditions while
still observing a significant CRB reduction, we demonstrate that the
temporal EP provides a genuine sensitivity advantage within the
specified noise model.

== Square-root scaling versus linear response
<square-root-scaling-versus-linear-response>
Finally, we verify the characteristic square-root scaling of the
eigenvalue splitting with respect to a small perturbation. @fig:F
compares the splitting $R \( p \)$ obtained from the exact eigenvalues
at the EP to that of a linear reference. A log--log fit yields a slope
of $0.5$ for the EP and $1.0$ for the linear reference, in agreement
with the expected $R_(upright(E P)) prop p^(1 \/ 2)$ and
$R_(upright(l i n)) prop p$ behavior~@Wiersig2014@Wiersig2016. Here, the
parameter $p$ denotes a small physical perturbation applied to the
detuning, i.e., $Delta arrow.r Delta + p$, while $gamma$ and $kappa$ are
held fixed. This corresponds to the experimentally accessible case where
a small change in temperature, index, or cavity dispersion induces a
shift in the detuning term of the Hamiltonian. The eigenvalue splitting
$R \( p \) = \| lambda_(+) \( p \) - lambda_(-) \( p \) \|$ therefore
represents the response to this controlled detuning perturbation.
Scaling exponents (linear vs. square-root) are extracted for small but
finite $p$, ensuring the system remains in the near-EP regime without
evaluating $R$ exactly at the EP itself.

#figure(image("source/FigF_Sqrt_vs_Linear_exact_eigs.pdf"),
  caption: [
    Square-root versus linear scaling of the eigenvalue splitting. (a)
    Splitting $R \/ g_0$ versus perturbation amplitude $p$ on a
    logarithmic horizontal axis, comparing the EP response (circles) to
    a linear reference (squares). (b) log--log plot with fitted slopes,
    confirming $R_(upright(E P)) prop p^(1 \/ 2)$ and
    $R_(upright(l i n)) prop p$. The splitting $R$ is computed directly
    from the exact eigenvalues in
    @eq:lambda_exact, without
    surrogate approximations.
  ]
)
<fig:F>

The observation of a clean square-root scaling using the exact
eigenvalues, without surrogate approximations, is central to the
validity of the EP-enhanced sensing mechanism.

= Discussion and Outlook
<sec:discussion>
The analysis presented here establishes a self-consistent picture of
temporal exceptional points in photonic time crystals and their
application to optical sensing. By deriving and employing the exact
eigenvalues of the non-Hermitian dimer Hamiltonian, and by using a
transmission model that is exact within the reduced two-mode
description, we avoid the inconsistencies that can arise when
approximate eigenvalue formulas or surrogate lineshapes are used. The
eigenvalue landscapes, Riemann surfaces, and Berry-phase calculations
(@fig:A through @fig:C) provide clear evidence of the EP topology, while
the CRB-based sensitivity analysis and Monte Carlo validation
(@fig:D through @fig:F) demonstrate that EP-enhanced sensitivity is both
physically meaningful and practically attainable under realistic noise
levels~@WiersigReview2020@DeCarlo2022.

From a device perspective, thin-film lithium niobate on insulator (TFLN)
and silicon nitride (SiN) photonic integrated circuits provide
complementary platforms for realizing temporal EPs. In a TFLN ring or
Mach--Zehnder geometry operating near
$lambda_0 approx 1550 med upright(n m)$, electro-optic modulation at
$Omega \/ 2 pi tilde.op 5$--$20 med upright(G H z)$ with index swings
$delta n tilde.op \( 1$--$3 \) times 10^(- 3)$ is routinely achievable,
which corresponds to Floquet coupling rates on the order of
$g_0 \/ 2 pi tilde.op 50$--$200 med upright(M H z)$ for practical device
lengths~@Zhang2021. Biasing the system near the temporal EP then
requires balanced gain--loss parameters $gamma \/ 2 pi lt.tilde g_0$ and
total decay rates
$kappa_0 \/ 2 pi tilde.op 200$--$500 med upright(M H z)$, consistent
with reported quality factors in state-of-the-art TFLN resonators. In
this regime, a thermo-optic coefficient of order
$alpha_T \/ 2 pi tilde.op 5$--$20 med upright(M H z \/ K)$ yields
sub-mK-level temperature resolution for the CRB values reported in
@fig:E. By contrast, SiN platforms naturally support low-loss,
large-footprint time-crystal sections with thermo-optic modulation at
$Omega \/ 2 pi tilde.op 1$--$100 med upright(M H z)$ and
$delta n tilde.op 10^(- 4)$, favoring slower but broadband operation in
which the same temporal EP mechanism can be exploited with reduced RF
complexity~@Zhang2021@Wang2020@Titchener2020. Together, these estimates
indicate that the dimensionless EP physics developed here can be mapped
onto realistic integrated-photonics parameter ranges without requiring
exotic material properties or unreasonably high modulation strengths.

Future work may explore experimental realizations using electro-optic
modulation in TFLN or thermo-optic modulation in SiN platforms, as well
as extensions to multimode and multidimensional temporal
crystals~@Longhi2023@Yoshida2020@Xu2021. Incorporating realistic
material dispersion, nonlinearities, and technical noise sources into
the model will be essential for optimizing performance in specific
application scenarios. At a more fundamental level, the temporal EP
framework developed here provides a starting point for investigating
non-Hermitian Floquet phases, time-dependent symmetry breaking, and
nonreciprocal phenomena in driven photonic
systems~@Koutserimpas2018@Titchener2020. It also offers a clean setting
in which to further examine the interplay between EP-induced singular
response and ultimate noise-limited sensitivity, a topic of ongoing
interest in the broader EP-sensing
literature~@Langbein2018@LauClerk2018@Bao2021@Duggan2022@Loughlin2024.

#heading(level: 1, numbering: none)[Acknowledgments]
<acknowledgments>
The authors acknowledge helpful discussions with colleagues at IIT
Delhi. S.M.T.~acknowledges institutional support for computational
resources.

#bibliography("source/refs1.bib",style:"ieee")

#pagebreak()
#heading(level: 1, numbering: none)[Supplementary Information]
<supplementary-information>
#heading(level: 2, numbering: none)[S1. Derivation of the two-mode
Floquet model and imaginary parts of the Riemann sheets]
<s1.-derivation-of-the-two-mode-floquet-model-and-imaginary-parts-of-the-riemann-sheets>
Here we briefly outline the derivation of the coupled-mode system in
@eq:cmt from the full Maxwell equations
and then present additional information on the imaginary parts of the
eigenvalue surfaces.

We start from the time-domain wave equation
$ partial_z^2 E \( z \, t \) - mu_0 partial_t^2 \[ epsilon.alt \( t \) E \( z \, t \) \] = 0 . $

In the limit $Omega < < omega_0$ and small modulation depth $m < < 1$,
terms $prop dot(epsilon.alt) dot(E)$ are negligible compared to
$epsilon.alt dot.double(E)$, so we adopt the following as our effective
wave equation
$ partial_z^2 E \( z \, t \) - mu_0 epsilon.alt \( t \) thin partial_t^2 E \( z \, t \) = 0 . $
With $epsilon.alt \( t \)$ given by
@eq:epsilon_time, we insert the
Floquet ansatz of @eq:floquet_ansatz
and collect terms oscillating at $e^(- i omega_0 t)$ and
$e^(- i \( omega_0 + Omega \) t)$. Neglecting second-order time
derivatives of the slow envelopes $a_(1 \, 2) \( t \)$ and discarding
non-resonant terms that couple to higher-order sidebands
$e^(- i \( omega_0 + n Omega \) t)$ with $\| n \| gt.eq 2$ yields a pair
of first-order differential equations for $a_(1 \, 2) \( t \)$. The
effective coupling strength $kappa$ is proportional to the modulation
depth $m$ and depends on the overlap between the unperturbed mode and
the time-varying permittivity; explicit expressions can be obtained once
a specific spatial mode profile is specified. The gain/loss rate $gamma$
arises from a small imaginary component of the permittivity, which may
itself be modulated in time to realize balanced gain and loss in the two
Floquet components. The resulting equations are of the form of
@eq:cmt,
and the validity of the two-mode truncation requires $m lt.double 1$ and
that the detunings to higher-order sidebands exceed the effective
coupling strengths.

@fig:S1 plots the imaginary parts of the eigenvalues
$lambda_plus.minus$ over the $\( Delta \/ g_0 \, gamma \/ g_0 \)$ plane,
complementing the real-part surfaces shown in @fig:B. The white
contour marks the locus $upright(I m) thin lambda = 0$, separating
decaying and amplifying regimes. The EP lies at the intersection of the
two sheets along this boundary.

#figure(image("source/FigS1.pdf", width: 95.0%),
  caption: [
    Imaginary parts of the eigenvalue sheets $lambda_plus.minus$ as
    functions of $\( Delta \/ g_0 \, gamma \/ g_0 \)$. The white contour
    indicates $upright(I m) thin lambda = 0$, and the EP is located at
    $\( Delta \, gamma \) = \( 0 \, kappa \)$.
  ]
)
<fig:S1>

#heading(level: 2, numbering: none)[S2. Berry phase versus loop radius]
<s2.-berry-phase-versus-loop-radius>
In @fig:S2, we examine how the magnitude of the biorthogonal Berry
phase depends on the radius of the loop encircling the EP in the
$\( Delta \, gamma \)$ plane. For loops that do not enclose the EP, the
accumulated phase is zero (mod $2 pi$). Once the loop radius exceeds a
critical value $r_c$ such that the EP lies inside the loop, the Berry
phase jumps to $pi$ in magnitude and remains robust for larger radii.
This step-like behavior confirms the topological nature of the EP.

#figure(image("source/FigS2_BerryPhase_vs_Radius_exact.pdf", width: 75.0%),
  caption: [
    Magnitude of the biorthogonal Berry phase $\| phi.alt_B \|$ as a
    function of the loop radius $r \/ g_0$ in the $\( Delta \, gamma \)$
    plane. A transition from $0$ to $pi$ occurs when the loop begins to
    enclose the EP, demonstrating topological robustness.
  ]
)
<fig:S2>

#heading(level: 2, numbering: none)[S3. Exceptional-point coordinates
versus coupling strength]
<s3.-exceptional-point-coordinates-versus-coupling-strength>
@fig:S3 verifies the analytic EP condition in
@eq:EP_condition by plotting the EP
coordinates for several coupling strengths $kappa$. In each case, the EP
is found at $\( Delta \, gamma \) = \( 0 \, plus.minus kappa \)$, in
agreement with theory.

#figure(image("source/FigS3_EP_vs_kappa_exact.pdf", width: 60.0%),
  caption: [
    Exceptional-point locations in the
    $\( Delta \/ g_0 \, gamma \/ g_0 \)$ plane for several values of the
    coupling strength $kappa \/ g_0$. All EPs occur at $Delta = 0$ and
    $gamma = plus.minus kappa$, confirming the analytic condition.
  ]
)
<fig:S3>

#heading(level: 2, numbering: none)[S4. Cramér--Rao bound versus Monte
Carlo reconstruction]
<s4.-cramérrao-bound-versus-monte-carlo-reconstruction>
@fig:S4 compares the Cramér--Rao bound (CRB) for the temperature
shift $Delta T$ and the eigenvalue splitting $R$ to Monte Carlo (MC)
histograms obtained by fitting noisy transmission spectra to the exact
non-Hermitian model. The operating point is chosen such that
$partial R \/ partial T eq.not 0$, ensuring a finite CRB for $R$. In
both cases, the MC variances agree with the CRB predictions to within a
few percent, confirming estimator optimality and validating the
Fisher-information analysis used in the main text.

#figure(image("source/FigS4_CRB_vs_MC_exact.pdf", width: 95.0%),
  caption: [
    Comparison of Cramér--Rao bounds (CRB) with Monte Carlo (MC)
    estimator statistics at a nonzero bias point. Left: histogram of
    temperature estimates $accent(Delta T, ̂)$ with CRB indicated. Right:
    histogram of splitting estimates $hat(R) \/ g_0$, again in excellent
    agreement with the corresponding CRB.
  ]
)
<fig:S4>

#heading(level: 2, numbering: none)[S5. Fit quality and splitting bias]
<s5.-fit-quality-and-splitting-bias>
Finally, @fig:S5 quantifies the goodness-of-fit and relative bias
in the reconstructed splitting across a range of temperature shifts. The
mean spectral coefficient of determination $R^2$ exceeds $0.995$ for all
$Delta T$ in the range considered, and the relative error in $R$ remains
below $tilde.op 3 %$. These metrics confirm that the exact non-Hermitian
transmission model provides an accurate and robust basis for parameter
estimation in the proposed temporal EP sensing scheme.

#figure(image("source/FigS5_R2_and_Rbias_vs_dT_exact.pdf", width: 80.0%),
  caption: [
    Goodness-of-fit and splitting bias. Left axis: mean spectral $R^2$
    for fits to noisy transmission spectra as a function of $Delta T$.
    Right axis: relative error in the reconstructed splitting $R$ (in
    percent).
  ]
)
<fig:S5>
