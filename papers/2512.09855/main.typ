// Typst format conversion of arXiv:2512.09855v1 under CC BY 4.0.
#set page(paper: "a4", margin: 20mm, numbering: "1")
#set text(font: "Libertinus Serif", size: 10.5pt)
#set par(justify: true)
#set heading(numbering: "1.1")
#set math.equation(numbering: "(1)")
#align(center)[
  #text(size: 16pt, weight: "bold")[Noise dynamics in large mode volume Brillouin lasers]
  #v(5pt)
  Andrew J. Shepherd#super[1,2], Daniel J. Blumenthal#super[3], and Ryan O. Behunin#super[1,2]

  #super[1] Department of Physics, Northern Arizona University, Flagstaff, Arizona 86011, USA \
  #super[2] Center for Materials Interfaces in Research and Applications, Northern Arizona University, Flagstaff, Arizona 86011, USA \
  #super[3] Department of Electrical and Computer Engineering, University of California Santa Barbara, Santa Barbara, CA, USA

  #link("mailto:as5262@nau.edu") ? #link("mailto:ryan.behunin@nau.edu")

  #link("https://arxiv.org/abs/2512.09855v1")[arXiv:2512.09855v1] ? #link("https://creativecommons.org/licenses/by/4.0/")[CC BY 4.0]
]

*Abstract.* Photonic integrated Brillouin lasers have emerged as an important tool
to realize a wide range of precision applications, including atomic
time-keeping, low-noise microwave signal generation, fiber and quantum
sensing, and ultra-high capacity coherent communications. While
Brillouin lasers routinely achieve sub-Hz instantaneous linewidths, many
of these applications also require exceptional frequency stability and
high-power single-mode emission. A recent demonstration showed that
extending the resonator length increases the laser power while
simultaneously improving the frequency stability through suppression of
low-frequency thermorefractive noise. However, as the resonator length
scales to larger size, multiple optical resonances can be found within
the Brillouin gain bandwidth, greatly complicating the laser dynamics
and extending beyond the validity of existing coupled-mode Brillouin
laser models. Given the potential to scale lasers of this type to
watt-level output powers at sub-mHz linewidths, a theoretical model
describing this physics is needed to provide key insights into their
performance. Here, we develop a coupled-mode theory of integrated large
mode volume Brillouin lasers, accounting for multiple cavity modes with
potential to lase within the gain bandwidth. We obtain expressions for
the steady-state dynamics, spontaneous spectrum, relative intensity
noise, and frequency noise. Our analysis reveals that the broad gain
bandwidth results in atypical Brillouin dynamics, giving rise to
distinct features in the noise spectra, and consequently modifications
of the standard, single-mode fundamental linewidth of Brillouin lasers.
Additionally, these features may be used for a variety of tangential
applications, such as phonon spectroscopy or quality factor enhancement.
Furthermore, we find that the linewidth can be significantly impacted by
transferred RIN from the external pump in Brillouin lasers that lack
ideal phase matching.

= Introduction
<introduction>
Integrated photonic lasers with low linewidth and high output power play
a significant role in a wide range of precision applications, such as
coherent optical communications @kikuchi_fundamentals_2016, atomic
clocks @ludlow_optical_2015, environmental and quantum sensing
@mecozzi_use_2023@li_microresonator_2017@xu_sensing_2019, coherent
ranging (LiDAR) @lihachev_low-noise_2022, and coherent microwave and
mmWave generation @sun_integrated_2024@kudelin_photonic_2024. Further
reduction of linewidth and higher output power is critical to these
applications, and also may unlock new opportunities where experimental
reliability and portability is needed. Demonstrating narrow linewidth
and high output power simultaneously has proved challenging; however,
recent work has merged the effects of nonlinear feedback via stimulated
Brillouin scattering with the noise-suppressing benefits of large mode
volume optical resonators, achieving a fundamental linewidth of 31 mHz
with 41 mW output power @liu_large_2025. This work suggests the
potential for linewidth reduction to the sub-mHz level while maintaining
watt-level output powers by increasing the resonator length; however, a
coupled-mode theoretical framework of this system has not yet been
described. Analyzing the unique underlying physics of this system may
enable performance optimization, reveal fundamental limitations, and
uncover potential new applications for this class of high performance
lasers.

External cavity lasers (ECLs), employing semiconductor emission,
leverage a large total intra-cavity photon number and long photon
lifetime for narrow linewidths and high output power
@bai_comprehensive_2022. State-of-the-art integrated ECLs can realize
fundamental linewidths of $tilde.op 10$ Hz and mW to 10s mW class output
powers, though further improvements to either parameter involves a
trade-off with the other
@fan_hybrid_2020@heim_hybrid_2025@wu_hybrid_2024@morton_high-power_2018.
Given these limitations, a key motivation for advancing this class of
lasers is to improve optical pump sources for stimulated Raman and
stimulated Brillouin lasers
@fan_hybrid_2020@pahlavani_linewidth_2025@gundavarapu_sub-hertz_2019,
which offer access to even lower linewidths. Further reduction to
integral linewidths in ECLs--both in lab-scale and integrated
systems--can be realized by locking to a temperature-stabilized
reference cavity @matei_15_2017@liu_36_2022, where the thermorefractive
noise (TRN) floor is lowered due to the large reference cavity mode
volume; however, a trade-off occurs between linewidth and high-frequency
noise, as the reference cavity acts as a low-pass filter for phase noise
beyond its linewidth, e.g., 100 kHz @krinner_low_2024 and the feedback
control actually amplifies higher frequencies @liu_large_2025.

High-performance lasing can be achieved with stimulated Brillouin
scattering (SBS) lasers and self-injection locking (SIL) lasers, where
nonlinear feedback is leveraged for noise suppression. The SIL laser
suppresses noise via optical feedback, facilitated by a
wavelength-selective element that filters light back into an already
lasing semiconducting resonator @lu_emerging_2024. This technology has
realized sub Hz linewidths in state-of-the-art systems
@li_reaching_2021@isichenko_sub-hz_2024\; however, attaining high output
power without compromising linewidth remains a nontrivial task. SBS
lasers use an entirely different form of nonlinear feedback, where
laser-generated phonons suppress noise while mediating light scattering
from an input mode (pump) to an output mode of slightly lower frequency
(Stokes). This mechanism has been shown to inhibit pump noise transfer
@debut_experimental_2001@smith_narrow-linewidth_1991 and limit relative
intensity noise (RIN)
@stepien_intensity_2002@molin_experimental_2008@geng_pump--stokes_2007,
where the phonon noise functions analogously to the spontaneous emission
in conventional lasers resulting in analogies to the linewidth
enhancement factor @li_characterization_2012. Along with the
aforementioned laser designs, SBS laser development has been challenged
with simultaneous narrow linewidth and high output power. Both linewidth
and output power are generally hindered by cascaded emission
@behunin_fundamental_2018, and although this effect can be canceled with
specialized device design, output power grows with the square root of
the injected pump @puckett_higher_2019@liu_integrated_2024.
Additionally, the requirement for single mode lasing has driven designs
in which the cavity length gives a free spectral range such that overlap
occurs between only a single cavity mode and the Brillouin gain
@lee_chemically_2012@li_characterization_2012@gundavarapu_sub-hertz_2019,
ultimately limiting the optical mode volume and thus the TRN floor
@gorodetsky_fundamental_2004@huang_thermorefractive_2019. Leveraging
state-of-the-art fabrication techniques, an SBS laser designed in this
manner realized a 245 mHz fundamental linewidth with 126 mW of output
power @qin_high-power_2022.

Recent work, utilizing a 4 meter coil waveguide resonator, reaches a
fundamental linewidth of 31 mHz and output power 41 mW @liu_large_2025,
marking a new state-of-the-art design for simultaneously achieving
narrow linewidth and high output power. The extended resonator length
increases the intra-cavity photon number, reduces the TRN floor, and
enables higher output power. Additionally, this system departs from
previous approaches by enabling overlap between multiple cavity modes
and a broad bulk-like Brillouin gain spectrum. Despite spontaneous
scattering between multiple optical modes, this large mode volume system
results in a single mode laser, where the cavity mode supporting the
greatest Brillouin gain will lase. Furthermore, this work indicates that
increasing resonator length may allow sub mHz fundamental linewidths
while eclipsing 1 W of output power.

Here, we develop a theoretical coupled-mode model to analyze the
steady-state, spontaneous, and lasing dynamics of large mode volume
Brillouin lasers. We model the broad Brillouin gain bandwidth with
multiple-oscillators, in which each oscillator couples the pump to each
cavity mode within the gain bandwidth. By assuming the acoustic fields
decay rapidly in comparison to the optical fields, we find a set of
nonlinear equations that describe the coupled dynamics of the pump and a
collection of cavity modes. Solving the coupled steady state equations
for the non-fluctuating amplitudes of each field, we find that the
cavity mode with the highest Brillouin gain out-competes the other
cavity modes within the Brillouin gain bandwidth, and begins to lase
when its gain equals the loss. At this point, the pump amplitude along
with all cavity modes of lesser Brillouin gain, clamp at a fixed steady
state amplitude. We then linearize these equations around the
steady-state for small amplitude perturbations, giving a compact set of
equations describing the dynamics of the amplitude and phase
fluctuations that lead to the RIN and frequency noise spectra.

The broad Brillouin gain bandwidth gives rise to an inherent
phase-mismatch, resulting in frequency pulling and linewidth narrowing
of the cavity modes below threshold, pulling of the pump frequency above
threshold, and unique features in the noise spectra at high
offset-frequencies which results in a modification to the well-known SBS
Schawlow-Townes-like linewidth
@li_characterization_2012@loh_noise_2015@debut_linewidth_2000. Using
these unique features, we find that this system may be used for
non-lasing applications as well. The magnitude of the frequency pulling
and narrowing of linewidth in each mode is significant enough to be
detectable, and their measurement can lead to construction of the entire
phonon gain spectrum. Additionally, the narrowed linewidth of the
non-lasing cavity modes may permit ultra-high effective quality factors,
increasing with resonator length as cavity modes become more closely
spaced and their respective gains approach that of the lasing mode.

= Theory
<theory>
Conventional stimulated Brillouin lasers leverage photon-phonon
coupling, where incident light scatters from an acoustic wave to a
lower, backward propagating optical field. This interaction allows a
high-frequency 'pump' photon, with frequency $omega_p$ and wavevector
$upright(bold(k))_p$, to decay into a 'Stokes' photon of lower frequency
and a phonon with frequencies $omega_s$, $Omega$ and wavevectors
$upright(bold(k))_s$ and $upright(bold(q))$ respectively. If phase
matching is satisfied, the frequency relation
$omega_p = omega_s + Omega$ holds (conservation of energy) and similarly
for the wave vectors,
$upright(bold(k))_p = upright(bold(k))_s + upright(bold(q))$
(conservation of 'momentum'). Drawing analogies to traditional laser
systems, the phonon's fluctuations facilitate spontaneous emission from
pump-to-Stokes, and Stokes photons in turn stimulate the scattering
process, ensuring optical amplification. To satisfy phase matching
relations, resonators are normally designed to support a single cavity
mode within the phonon gain bandwidth, and the cavity free spectral
range (FSR) is fabricated to match the Brillouin shift. The
amplification then occurs in a narrow gain bandwidth that depends on the
decay rate $Gamma$ of the acoustic field.

#figure(image("source/coupling_diagram_2.png", width: 85%),
  caption: [
    \(a) Illustration of large mode volume Brillouin laser dynamics,
    where the pump mode $a_p$, is coupled (denoted by the sum and mixer
    symbol) to multiple cavity modes $a_j$, with each $a_p arrow.r a_j$
    coupling mediated by a distinct set of phonon modes $b_(j k)$. (b)
    Brillouin gain spectrum for a given cavity mode $j$. (c) Contrasting
    cascaded control in standard Brillouin lasers (top) vs. a large mode
    volume Brillouin laser (bottom), where removal of the lasing mode
    from the supported cavity modes will not cancel cascading.
  ]
)
<fig:diagram>

In large mode volume Brillouin lasers, a greater resonator length
supports a relatively small FSR, leading to multiple closely spaced
cavity modes falling under a broad gain bandwidth. A pump laser will
spontaneously scatter to each of these modes, mediated by a set of
phonon modes in which each wavevector is distinct with respect to each
cavity resonance. We model this interaction with the following
Hamiltonian,
$ H = ℏ omega_p a_p^dagger a_p + sum_j #scale(x: 180%, y: 180%)[\(] ℏ omega_j & a_j^dagger a_j + sum_k \( ℏ Omega_(j k) b_(j k)^dagger b_(j k)\
 & + g_(j k) a_p a_j^dagger b_(j k)^dagger + upright(H . c) \) #scale(x: 180%, y: 180%)[\)] \, $<eq:H>
where $j$ indexes the cavity modes within the gain bandwidth, with
annihilation operator $a_j$ and frequency $omega_j$. The collection of
phonon modes coupled to cavity mode $j$ are indexed by $j k$, with
annihilation operator $b_(j k)$ and frequency $Omega_(j k)$. The pump
mode is represented with annihilation operator $a_p$ and frequency
$omega_p$, and H.c stands for the Hermitian conjugate. The interactions
described in this Hamiltonian are illustrated in @fig:diagram\(a),
where the $Sigma$ symbol denotes coupling between the pump and cavity
modes. This symbol is further described by the lower box, showing a
collection of mixer symbols which depicts how each $a_p arrow.r a_j$
coupling is mediated by a collection of phonon modes. By modeling the
system with Eq. @eq:H, we are assuming the rotating
wave approximation is valid, amplitudes are independent of space
@dallyn_thermal_2022@behunin_fundamental_2018, and processes produced by
Kerr nonlinearities, i.e., self- and cross-phase modulation, are
negligible due to the relatively strong electrostriction effect in
participating materials @dallyn_thermal_2022. The multi-phonon model can
be described with the gain spectrum @kharel_noise_2016,
$ G_(B \, j) \( Omega \) = sum_k frac(4 \| g_(j k) \|^2 L, v_p v_j ℏ omega_p Gamma_(j k)) frac(\( Gamma_(j k) \/ 2 \)^2, \( Gamma_(j k) \/ 2 \)^2 + \( Omega - Omega_(j k) \)^2) \, $<eq:gain>
shown in Fig @fig:diagram (b), where $Gamma_(j k)$ is the decay rate for
each phonon mode, $v_(p \/ j)$ is group velocity for each mode, and $L$
is the resonator length. All parameters can be found in @table1
and @table2, taken from either listed values in a physically realized
system @liu_large_2025, or determined by finite element simulations
using those values. The parameters comprising the phonon gain spectrum,
in @table2, are found to be insensitive to cavity mode index $j$,
and are therefore assumed constant with respect to $j$.

We derive equations of motion for the large mode volume laser using Eq.
@eq:H and adding in the effects of optical and
acoustic damping, quantum and thermal fluctuations, and the external
pump laser. We move to a rotating reference frame where
$b_(j k) arrow.r b_(j k) exp { - i Omega'_(j k) t }$, with
$Omega'_(j k) = Omega_(j k) - Delta Omega_(j k)$ and $Delta Omega_(j k)$
is the difference between the driving beat note and the resonant phonon
frequency, i.e.,
$Delta Omega_(j k) = Omega_(j k) - \( omega'_p - omega'_j \)$ (visually
shown in @fig:diagram\(a)). Additionally, we assume the pump mode
and external laser are locked, oscillating at
$a_p arrow.r a_p exp { - i omega'_p t }$,
$F arrow.r F exp { - i omega'_p t }$, and the cavity modes oscillate at
$a_j arrow.r a_p exp { - i omega'_j t }$. The associated frequencies are
taken as $omega'_p = omega_p - Delta omega_p$ and
$omega'_j = omega_j - Delta omega_j$, which accounts for the possibility
of oscillation away from resonance. In doing this, the set of coupled
Heisenberg-Langevin Eqs are
$ dot(a)_p = - \( i Delta omega_p & + gamma \/ 2 \) a_p - i sum_(j k) g_(j k)^(*) a_j b_(j k)\
 & + sqrt(gamma_(e x t)) F + eta_p \, $<eq:p_HL>
$ dot(a)_j = - \( i Delta omega_j + gamma \/ 2 \) a_j - i sum_k g_(j k) a_p b_(j k)^dagger + eta_j \, $<eq:j_HL>
$ dot(b)_(j k) = - \( i Delta Omega_(j k) + Gamma_(j k) \/ 2 \) b_(j k) - i g_(j k) a_p a_j^dagger + xi_(j k) \, $<eq:phononHL>
where $gamma$ is the optical decay rate and $gamma_(e x t)$ is the
external coupling rate. The latter describes the coupling between the
resonator and the bus waveguide, which supplies the external pump laser.
The pump laser amplitude $F$ is normalized such that $\| F \|^2$ is
given in units of photon flux, and relates to the externally supplied
power by $P = ℏ omega_p \| F \|^2$. Time dependent phases have been
absorbed into the respective optical and acoustic Langevin forces,
$eta_(p \/ j)$ and $xi_(j k)$, which describe the quantum and thermal
fluctuations
@behunin_fundamental_2018@loh_noise_2015@li_characterization_2012. These
are assumed to be zero-mean, white noise variables which have the
correlation properties,
$ chevron.l eta_m^dagger \( t \) eta_(m') \( t' \) chevron.r = delta_(m \, m') gamma N_m delta \( t - t' \) $<eq:langevin_corr_optics1>
$ chevron.l eta_m \( t \) eta_(m')^dagger \( t' \) chevron.r = delta_(m \, m') gamma \( N_m + 1 \) delta \( t - t' \) $<eq:langevin_corr_optics2>
$ chevron.l xi_(j k)^dagger \( t \) xi_(j' k') \( t' \) chevron.r = delta_(j j') delta_(k k') Gamma_(j k) n_(j k) delta \( t - t' \) $
$ chevron.l xi_(j k) \( t \) xi_(j' k')^dagger \( t' \) chevron.r = delta_(j j') delta_(k k') Gamma_(j k) \( n_(j k) + 1 \) delta \( t - t' \) . $
where $N_m$ and $n_(j k)$ are the optical and acoustic thermal
populations respectively (i.e.,
$N_m = \[ exp { ℏ omega_m \/ k_B T } - 1 \]^(- 1)$ and
$n_(j k) = \[ exp { ℏ Omega_(j k) \/ k_B T } - 1 \]^(- 1)$), with $m$ as
either pump $p$, or Stokes index $j$. The assumption that the Langevin
forces are zero-mean, white noise variables is justified under the
rotating wave approximation and the phonon linewidth being much narrower
than the thermal distribution of the bath (i.e.,
$ℏ Gamma lt.double k_B T$) @vahala_back-action_2008.

#block[
#block[
#figure(
  align(center)[#table(
    columns: 3,
    align: (left,left,right,),
    [$gamma$], [$\( 2 pi \) 2.55$ MHz], [optical decay rate],
    [$gamma_(e x t)$], [$\( 2 pi \) 0.95$ MHz], [external optical loss
    rate],
    [$omega_p$], [$\( 2 pi \) 195.3$ THz], [pump mode frequency],
    [$L$], [4.0 m], [resonator length],
    [FSR], [$48.1$ MHz], [free spectral range],
    [$v_(p \/ j)$], [$2.0 times 10^8$ m/s], [optical group velocity],
  )]
  , caption: [Large mode volume parameters (taken from Ref.
  @liu_large_2025).]
  , kind: table
  ) <table1>

]
]

#block[
#block[
#figure(
  align(center)[#table(
    columns: 4,
    align: (left,center,center,right,),
    [Mode ($k$)], [$g_(j k)$ \[Hz\]], [$Omega_(j k) \/ \( 2 pi \)$
    \[GHz\]], [$Gamma_(j k) \/ \( 2 pi \)$ \[MHz\]],
    [0], [117.5], [10.87], [33],
    [1], [94.5], [10.93], [30],
    [2], [68.5], [10.97], [40],
    [3], [78], [11.07], [40],
    [4], [58.5], [11.19], [27],
    [5], [41], [11.27], [36],
    [6], [38], [11.39], [90],
  )]
  , caption: [Large mode volume parameters derived from finite element
  simulations based off of the experimental design in Ref.
  @liu_large_2025. The parameters $g_(j k)$, $Omega_(j k)$,
  $Gamma_(j k)$ are insensitive across the cavity modes with potential
  to lase and thus are assumed to be constant with respect to $j$.]
  , kind: table
  ) <table2>

]
]

== Adiabatic elimination
<adiabatic-elimination>
Here, we solve the Heisenberg-Langevin equation for the phonon (Eq.
@eq:phononHL) to gather the time-dynamics of
the acoustic fields. The solution to Eq.
@eq:phononHL is
$ b_(j k) \( t \) = integral_(- oo)^t & d tau e^(- \( i Delta Omega_(j k) + Gamma_(j k) / 2 \) \( t - tau \))\
 & times #scale(x: 180%, y: 180%)[\(] xi_(j k) \( tau \) - i g_(j k) a_p \( tau \) a_j^dagger \( tau \) #scale(x: 180%, y: 180%)[\)] . $<eq:integral>
When the phonon decay rate greatly exceeds the optical decay rate
($Gamma_(j k) gt.double gamma$), common for Brillouin lasers, the phonon
field adiabatically follows the electrostrictive force produced by the
optical beat note. In other words, the optical fields are assumed to
vary slowly in time, so that the phonon field reaches its steady state
amplitude at each instant. Under this condition, the integral in Eq.
@eq:integral can be approximated by writing
$a_p \( tau \) a_j^dagger \( tau \) tilde.eq a_p \( t \) a_j^dagger \( t \)$,
leading to the solution
$ b_(j k) approx - i g_(j k) chi_(j k) a_p a_j^dagger + hat(b)_(j k) \, $<eq:ph_eq>
where $chi_(j k) = \( i Delta Omega_(j k) + Gamma_(j k) \/ 2 \)^(- 1)$
and $hat(b)_(j k)$ quantifies the thermal and quantum fluctuations of
the phonon given by
$ hat(b)_(j k) = integral_(- oo)^t d tau e^(- \( i Delta Omega_(j k) + Gamma_(j k) / 2 \) \( t - tau \)) xi_(j k) \( tau \) \, $<eq:dressed_ph_L>
with two-time correlation function
$ chevron.l hat(b)_(j k)^dagger \( t \) hat(b)_(j' k') \( t' \) & chevron.r #h(-1em) = #h(-1em) n_(t h) delta_(j j') delta_(k k') e^(- Gamma_(j k) / 2 \| t - t' \|) e^(i Delta Omega_(j k) \( t - t' \)) . $<eq:bhatcorrelation>
As experiments scale to longer resonators, a regime may be reached where
treatment of this physics with adiabatic elimination is no longer
appropriate, as it results in a divergent description of amplitude at a
critical feedback parameter. This is overcome in a 'three-wave model',
which predicts pulsed steady state dynamics at the critical value
@montes_bifurcation_1994.

Inserting Eq. @eq:ph_eq into Eqs.
@eq:p_HL and @eq:j_HL, we
find coupled equations for the optical modes,
$ dot(a)_p = - #scale(x: 120%, y: 120%)[\(] i Delta omega_p & + gamma \/ 2 + sum_j mu_j^(*) a_j^dagger a_j #scale(x: 120%, y: 120%)[\)] a_p\
 & + sqrt(gamma_(e x t)) F + h_p $<eq:p_eq>
$ dot(a)_j = - #scale(x: 120%, y: 120%)[\(] i Delta omega_j + gamma \/ 2 - mu_j a_p^dagger a_p #scale(x: 120%, y: 120%)[\)] a_j + h_j . $<eq:j_eq>
Here, $mu_j = sum_k \| g_(j k) \|^2 chi_(j k)^(*)$,
$h_p = eta_p - i sum_(j k) g_(j k)^(*) a_j hat(b)_(j k)$, and
$h_j = eta_j - i sum_(j k) g_k^(*) a_p hat(b)_(j k)^dagger .$ The
Langevin forces $h_(p \/ j)$ describe how colored multiplicative noise
is introduced on the optical fields via spontaneous Brillouin
scattering, beyond the intrinsic quantum and thermal fluctuations of the
optical modes. The function $mu_j$ represents a nonlinear susceptibility
associated with Brillouin scattering, where Re\[$mu_j$\] is proportional
to the Brillouin gain factor for each cavity mode, which is given by
$ G_(B \, j) = frac(2 upright(R e) \[ mu_j \] L, ℏ omega_j v_p v_j) . $
The Brillouin gain factor is a constant that is determined by properties
of the waveguide.

== Steady state dynamics
<steady-state-dynamics>
We analyze the amplitudes of the optical modes in steady state (denoted
here as $alpha_p$ and $alpha_j$) by dropping fluctuating terms and
setting derivatives to zero Eqs. @eq:p_eq and
@eq:j_eq, giving
$ alpha_p \( i Delta omega_p + gamma \/ 2 + sum_j mu_j^(*) alpha_j^2 \) = sqrt(gamma_(e x t)) F $<eq:ss_p>
$ alpha_j \( i Delta omega_j + gamma \/ 2 - mu_j alpha_p^2 \) = 0 . $<eq:ss_j>
Equation @eq:ss_j has two solutions: below
threshold when all $alpha_j = 0$, and above threshold when
$i Delta omega_j + gamma \/ 2 - mu_j alpha_p^2 = 0$. The relation for
above threshold is satisfied when both real and imaginary parts vanish
independently. This results in two conditions. (1) The cavity mode with
the highest gain,
$upright(R e) \[ mu_l \] > upright(R e) \[ mu_(j eq.not l) \]$, will
satisfy the threshold relation first, giving the clamping condition for
the pump, $ alpha_p^2 = frac(gamma, 2 mu'_l) \, $<eq:pump_clamp> and
will be the mode to lase, and (2) the frequency pulling of the lasing
mode is
$ Delta omega_l = alpha_p^2 mu''_l = frac(gamma mu''_l, 2 mu'_l) . $
Here, we've introduced the notation $mu'_j = upright(R e) \[ mu_j \]$
and $upright(I m) \[ mu_l \] = mu''_l$. The frequency pulling is a
consequence of phase matching not being satisfied between the beat note
and the multiple phonon modes (i.e., $mu''_l eq.not 0$). This feature is
somewhat unique as Brillouin lasers can be made resonant. All other
modes remain with a steady state amplitude of zero,
$alpha_(j eq.not l) = 0$, as
$\( i Delta omega_(j eq.not l) + gamma \/ 2 - mu_(j eq.not l) alpha_p^2 \) eq.not 0$,
showing that although multiple optical modes experience gain, only one
mode lases. Once threshold is reached, the lasing cavity mode amplitude
grows with the injected laser amplitude $F$, and is found using Eqs.
@eq:ss_p and
@eq:pump_clamp,
$ alpha_l^2 = 1 / mu'_l #scale(x: 180%, y: 180%)[\(] frac(sqrt(gamma_(e x t)) F, alpha_p) - gamma / 2 #scale(x: 180%, y: 180%)[\)] . $<lasing_amp>
The pump frequency pulls with increasing lasing amplitude at
$Delta omega_p = - mu''_l alpha_l^2$, shown in the inset of Fig
@fig:spontaneous\(b).

Below threshold, there is no pump frequency pulling
($Delta omega_p = 0$), and the pump amplitude growing with $F$ as
$ alpha_p = frac(2 sqrt(gamma_(e x t)) F, gamma) . $<eq:pump_before_lasing>
Combining Eqs. @eq:pump_clamp and
@eq:pump_before_lasing, and using
the relation between $F$ and input power $P$, we find expression for the
pump threshold power,
$ P_(upright(t h))^P = frac(gamma^3 ℏ omega_p, 8 mu'_l gamma_(e x t)) . $
Using the values from @table1 and @table2, we find the first
cavity mode has the highest gain (i.e., $mu'_l = mu'_0$) and
$P_(t h)^P = 78.8$ mW.

The lasing cavity mode will climb in amplitude, with $alpha_p$ given by
the pump clamping condition in Eq.
@eq:pump_clamp, until it reaches threshold
for cascaded order Brillouin lasing
$alpha_l^2 = gamma \/ \( 2 mu'_(l 2) \)$, where $mu'_(l 2)$ relates to
the gain of the cascaded lasing mode @behunin_fundamental_2018. Using
this result, and assuming that $mu'_(l 2) tilde.eq mu'_l$, we find the
threshold of supplied power to reach cascaded lasing,
$ P_(upright(t h))^(S 1) = frac(gamma^3 ℏ omega_p, 8 mu'_l gamma_(e x t)) #scale(x: 180%, y: 180%)[\(] mu'_l / mu'_(l 2) + 1 #scale(x: 180%, y: 180%)[\)]^2 tilde.eq 4 P_(upright(t h))^P . $<eq:cascading>
Noting that output power is given by
$P_(upright(o u t)) = ℏ omega_p gamma_(e x t) alpha_l^2$, the output
power at $S 1$ cascading can be written as
$ P_(upright(o u t))^(S 1) = frac(gamma_(e x t) gamma ℏ omega_p, 2 mu'_l) = frac(gamma_(e x t) gamma L, G_(B \, l) v_p v_l) \, $
evaluated as 43.7 mW. The external coupling can be described in terms of
the length, coupling factor $kappa$, and group velocity as
$gamma_(e x t) = v_g kappa \/ L$. By fixing $gamma_(e x t)$ (i.e.,
tailoring the bus-waveguide distance so that $kappa \/ L$ remains
constant with increasing $L$), lasing threshold powers
$P_(upright(t h))^P$ and $P_(upright(t h))^(S 1)$ grow linearly with
increasing length.

Standard Brillouin lasers can further increase output power by negating
the onset of cascading with destructive interference via changes the
resonator structure @puckett_higher_2019@liu_integrated_2024. In a large
mode volume Brillouin laser, the altered structure would need to remove
a broad band of frequencies, approximately equal to that of the phonon
gain bandwidth. This difference is illustrated in @fig:diagram\(c),
where removal of the lasing mode from the cavity-supported modes does
not negate cascading, as the mode with the next highest gain will lase.

#figure(image("source/Fig2_LMV.png", width: 85%),
  caption: [
    \(a) Spontaneous power spectrum below threshold with increasing
    input power from gray to orange. The gain spectrum shape is shown as
    the dotted line, with no relation to the y-axis. (b) Frequency
    pulling of each mode from cavity resonance vs. increasing input
    power. The vertical, dashed gray line represents $P_(t h)^P$, where
    the frequency drift clamps with the pump. Inset: zoomed in power
    spectrum of the $j = 0$ mode as power increases, where frequency
    pulling is contrasted with the cavity resonance, given by the gray
    vertical line.
  ]
)
<fig:spontaneous>

== Spontaneous scattering
<spontaneous-scattering>
Here, we solve for the spontaneous scattering power spectrum both before
and after lasing occurs by solving the coupled Eqs.
@eq:p_eq and @eq:j_eq. This
is done using the steady state solution for $alpha_p$ (either Eq.
@eq:pump_before_lasing before
threshold or Eq. @eq:pump_clamp above
threshold), and taking the Fourier transform of Eq.
@eq:j_eq. This gives
$a_j \( omega \) = ell_j \( omega \) h_j \( omega \)$ with
$ell_j \( omega \) = \( - i omega + i Delta omega_j + gamma \/ 2 - mu_j alpha_p^2 \)^(- 1)$.
Using this, the power spectrum for each mode $j$ is obtained by
calculating
$ S_j \[ omega \] = frac(chevron.l a_j^dagger \( omega \) a_(j') \( omega' \) chevron.r, 2 pi delta \( omega - omega' \)) = \| ell_j \( omega \) \|^2 S_(h_j) \[ omega \] . $<eq:powerspec>
The power spectrum for the Langevin force $h_j$ can be found using the
stationary two time correlation function,
$ chevron.l h_j^dagger & \( t \) h_(j') \( t' \) chevron.r equiv delta_(j j') C_(h_j) \( tau \) = delta_(j j') #scale(x: 180%, y: 180%)[\(] gamma N_j delta \( tau \)\
 & + sum_k \| g_(j k) \|^2 alpha_p^2 \( n_(j k) + 1 \) e^(- Gamma_(j k) / 2 \| tau \|) e^(- i Delta Omega_(j k) tau) #scale(x: 180%, y: 180%)[\)] \, $<hj_corr_spontaneous>
where $t - t' = tau$, and the Wiener-Khinchine theorem,
$ S_(h_j) \[ omega \] = integral_(- oo)^oo d tau e^(i omega tau) C_(h_j) \( tau \) . $<eq:WK>
Inserting the solution of Eq. @eq:WK into Eq.
@eq:powerspec, exiting the rotating frame, and
discarding the negligible $gamma N_j$, we find the full spontaneous
power spectrum by summing over $j$,
$ S \[ omega \] = sum_(j k) \| ell_j \( omega \) \|^2 frac(alpha_p^2 \| g_(j k) \|^2 \( n_(j k) + 1 \) Gamma_(j k), \( Gamma_(j k) \/ 2 \)^2 + \( omega + omega'_p - Omega_(j k) \)^2) \, $<eq:spont_spec>
noting that the cavity modes' individual power spectra are uncorrelated,
and $omega'_j - Delta Omega_(j k) = omega'_p - Omega_(j k)$.

Equation @eq:spont_spec is plotted in Fig.
@fig:spontaneous\(a) for varying input powers below threshold, where
$alpha_p$ depends on the input power and $omega'_p = omega_p$. The gain
shape is shown as the dotted line, to emphasize the influence of $mu_j$
in the spontaneous scattering. Examining Eq.
@eq:spont_spec below threshold reveals that
each mode experiences frequency pulling, given by
$Delta omega_j = - mu''_j alpha_p^2$, and an effective narrowing of
linewidth given by
$gamma_(upright(e f f) \, j) = gamma - 2 mu'_j alpha_p^2$. As a
consequence of these dynamics, the center frequency and linewidth of
each cavity mode is fixed once the pump clamps at threshold. The
frequency pulling is plotted against increasing power in Fig.
@fig:spontaneous\(b) for each mode, showing a maximum drift magnitude
ranging between $0.5 - 2.4$ MHz at $P_(upright(t h))^P$ for each mode.
Additionally, the magnitude of linewidth reduction ranges from
$0.09 - 0.9$ MHz. With this information, paired with the steady state
values that relate to the lasing mode, the real and imaginary parts of
$mu_j$ can be obtained for all cavity modes within the phonon gain
bandwidth. This means that by simply reaching threshold in a large mode
volume Brillouin laser, and measuring the linewidths and frequency
drifts of each mode, full construction of the phonon gain spectrum is
possible. By fitting a multiple-oscillator model to that spectrum, all
values of $g_(j k)$, $Omega_(j k)$, and $Gamma_(j k)$ can be determined,
making this system an interesting tool for phonon spectroscopy.

The narrowed linewidth of the mode with the second highest gain could be
the foundation for an interesting application in terms of a high
effective $Q$ resonator mode. In the 4 meter resonator coil, the mode
with the second highest gain sees an effective $1.5 times$ increase in
$Q$ at $P_(upright(t h))^P$, resulting in
$Q_(e f f) = omega_p \/ gamma_(e f f) = 194$ million, compared to the
fabricated loaded quality factor of $77$ million. Although this is only
a modest increase, longer resonators will bring the cavity modes closer
together in frequency. In turn, the modes adjacent to the lasing mode
will begin to approach equal gain, resulting in
$gamma_(upright(e f f) \, j)$ trending closer to zero, and increasing
the effective quality factor. For example, when calculating the dynamics
of this system with a resonator length of $50$ m, the quality factor
sees a $75 times$ increase at $P_(upright(t h))^P$, making
$Q_(e f f) = 5.9$ billion. Examining Eq.
@eq:spont_spec above threshold, the
spontaneous spectrum appears to be dependent on increasing input power
as $omega'_p = omega_p + mu''_l alpha_l^2$, and $alpha_l$ grows with
input power; however, the frequency pulling of the pump is found to be
effectively negligible in changing the spontaneous spectrum.

== Above threshold: Lasing
<above-threshold-lasing>
In this section we explore the dynamics of amplitude and frequency
fluctuations, using Eq. @eq:j_eq for the lasing
cavity mode ($j = l$). When examining above laser threshold, it is
convenient to decompose each field as
$ a = \( alpha + delta alpha \) e^(i phi) \, $<eq:decomp> which includes
the steady state amplitude $alpha$, fluctuations in amplitude
$delta alpha$ which describe the RIN, and fluctuations to the phase
$phi$ which describe phase/frequency noise. Additionally, we capture the
transferred amplitude and phase noise from the external pump with the
decomposition $F = \( F_0 + delta F \) e^(i phi_f)$, where $phi_f$ is
assumed to randomly fluctuate in time with a variance determined by the
external laser's linewidth $Delta nu_f$. We assume that the fluctuations
are small compared to the amplitude, (i.e.,
$\| delta alpha \| lt.double alpha$). Additionally, when the resonator
linewidth is much larger than the external laser linewidth,
($gamma gt.double 2 pi Delta nu_f$), one finds that the pump phase noise
adiabatically follows the phase of the external source
@debut_linewidth_2000@behunin_fundamental_2018@dallyn_thermal_2022, such
that $ phi_p approx phi_f . $<eq:phase_p_fluc> After inserting the
decomposition from Eq. @eq:decomp into the
time-dependent equations for the optical modes in the rotating frame
(Eqs. @eq:p_eq and
@eq:j_eq), keeping only terms linear in
$delta alpha$ and $phi$, incorporating steady state definitions where
appropriate, and using Eq.
@eq:phase_p_fluc, we take the real and
imaginary parts to find the following equations
$ accent(delta alpha, ̇)_p approx - 2 mu'_l & alpha_l alpha_p delta alpha_l - sqrt(gamma_(e x t)) F_0 frac(delta alpha_p, alpha_p)\
 & + upright(R e) \[ tilde(h)_p \] + sqrt(gamma_(e x t)) delta F . $<eq:ampfluct_p_eq>
$ accent(delta alpha, ̇)_l = 2 mu'_l alpha_p alpha_l delta alpha_p + upright(R e) \[ tilde(h)_l \] $<eq:ampfluct_l_eq>
$ dot(phi)_l = 2 mu''_l alpha_p delta alpha_p + 1 / alpha_l upright(I m) \[ tilde(h)_l \] . $<eq:phase_eq>
The previous considerations have altered the quantum/thermal
fluctuation's definition, now precisely represented as
$h_p = eta_p - i sum_k g_(l k)^(*) alpha_l e^(i phi_l) hat(b)_(l k)$ and
$h_l = eta_l - sum_k i g_(l k) alpha_p e^(i phi_p) hat(b)_(l k)^dagger$,
differing from prior theoretical descriptions which assume phase matched
coupling to a single phonon mode
@behunin_fundamental_2018@dallyn_thermal_2022. Additionally,
$tilde(h)_p = h_p e^(- i phi_p)$, $tilde(h)_l = h_l e^(- i phi_l)$.
Here, one can observe that the lasing Stokes' phase fluctuations couple
to the pump's amplitude fluctuations as a consequence of this system
lacking phase matching for each phonon mode ($mu''_l eq.not 0$).

#figure(image("source/RINplot.png", width: 85%),
  caption: [
    Theoretical RIN for the large mode volume Brillouin laser (solid red
    line) vs. a single mode laser involving overlap between one phonon
    and one cavity mode (dashed) with 314 mW of input power
    ($P_(t h)^(S 1)$). The vertical gray lines represent
    $Delta Omega_(l k)$'s, highlighting the source of additional noise
    at high-offset frequencies. Inset: Increasing input power from blue
    to red. Solid lines represent no transferred RIN, (i.e.,
    $S_(e x t)^(upright(R I N)) = 0$) and dotted lines show the
    inclusion of constant white noise, where
    $S_(e x t)^(upright(R I N)) = - 140$ dBc/Hz.
  ]
)
<fig:RIN>

=== Relative intensity noise of lasing cavity mode
<relative-intensity-noise-of-lasing-cavity-mode>
In this section, we begin our analysis of the large mode volume laser
noise by calculating the RIN, which is defined by the two-sided power
spectrum
$ S_l^(upright(R I N)) \[ omega \] = 1 / P_l^2 integral_(- oo)^oo d tau e^(i omega tau) chevron.l delta P_l \( t + tau \) delta P_l \( t \) chevron.r \, $
where the time-dependent variations of laser power are represented by
$delta P_l$. Noting that
$\( P_l + delta P_l \) prop \( alpha_l + delta alpha_l \)^2$ and
$delta alpha_l$'s are small compared to the amplitude, we can express
the RIN as
$ S_l^(upright(R I N)) \[ omega \] = 4 / alpha_l^2 integral_(- oo)^oo d tau e^(i omega tau) chevron.l delta alpha_l \( t + tau \) delta alpha_l \( t \) chevron.r \, $
The amplitude coupling in Eqs.
@eq:ampfluct_p_eq and
@eq:ampfluct_l_eq leads to relaxation
oscillations, with resonant frequency
$omega_0^(upright(r e l)) = 2 mu'_l alpha_l alpha_p$ and damping rate
$Gamma_(upright(R I N)) = sqrt(gamma_(e x t)) F_0 \/ alpha_p$. We solve
these coupled equations in the Fourier domain for $delta alpha_l$,
giving
$ delta alpha_l \( omega \) = chi_(upright(R I N)) & \( omega \) #scale(x: 120%, y: 120%)[\(] sqrt(gamma_(e x t)) delta F \( omega \) omega_0^(upright(r e l)) + upright(R e) \[ tilde(h)_p \( omega \) \] omega_0^(upright(r e l))\
 & + \( Gamma_(upright(R I N)) - i omega \) upright(R e) \[ tilde(h)_l \( omega \) \] #scale(x: 120%, y: 120%)[\)] . $<eq:FT_delta_alpha_l>
where
$chi_(upright(R I N)) = \( - omega^2 - i omega Gamma_(upright(R I N)) + omega_0^(upright(r e l^2)) \)^(- 1)$.
Using Eq. @eq:FT_delta_alpha_l and
the correlation properties of $upright(R e) \[ tilde(h)_p \]$ and
$upright(R e) \[ tilde(h)_l \]$ (see Appendix A), we calculate the
correlation function
$chevron.l delta alpha_l^(*) \( omega \) delta alpha_l \( omega' \) chevron.r$.
The resulting function is used to find the power spectrum for the RIN of
a large mode volume Brillouin laser,
$  & S_l^(upright(R I N)) \[ omega \] = frac(\| chi_(upright(R I N)) \( omega \) \|^2, alpha_l^2) #scale(x: 300%, y: 300%)[\[] \( Gamma_(upright(R I N)) alpha_p omega_0^(upright(r e l)) \)^2 S_(e x t)^(upright(R I N)) \[ omega \]\
 & + 2 gamma \( N_p + 1 \/ 2 \) omega_0^(upright(r e l)^2) + 2 gamma \( N_l + 1 \/ 2 \) \( Gamma_(upright(R I N))^2 + omega^2 \)\
 & + #scale(x: 180%, y: 180%)[\(] omega_0^(upright(r e l^2)) alpha_l^2 - 2 omega_0^(upright(r e l)) Gamma_(upright(R I N)) alpha_p alpha_l + \( Gamma_(upright(R I N))^2 + omega^2 \) alpha_p^2 #scale(x: 180%, y: 180%)[\)] beta_l \( omega \) #scale(x: 300%, y: 300%)[\]] \, $<eq:RIN>
where,
$ beta_l \( omega \) = & sum_k \| g_(l k) \|^2 #scale(x: 240%, y: 240%)[\[] frac(\( n_(l k) + 1 \) Gamma_(l k), Gamma_(l k)^2 \/ 4 + \( omega - Delta Omega_(l k) \)^2)\
 & + frac(n_(l k) Gamma_(l k), Gamma_(l k)^2 \/ 4 + \( omega + Delta Omega_(l k) \)^2) #scale(x: 240%, y: 240%)[\]] . $
The transferred RIN from the external laser is given as
$S_(e x t)^(upright(R I N)) \[ omega \] = 4 chevron.l delta F \( omega \) delta F \( omega' \) chevron.r \/ F_0^2$.

Equation @eq:RIN can be shown to reproduce the RIN
of a single mode Brillouin laser
@loh_noise_2015@behunin_fundamental_2018 by assuming pump-Stokes
coupling results from only one phase matched phonon mode (i.e., no sum
on $k$ and $Delta Omega_l = 0$, and assuming there is no transferred
RIN). The RIN for the large mode volume Brillouin laser is plotted in
@fig:RIN as a solid line, contrasted with the RIN of a standard
Brillouin laser (dashed line), with an input power of $314$ mW
($P_(upright(t h))^(S 1)$). The added noise at high offset frequency can
be attributed to $beta \( omega \)$, which differs as a consequence of
coupling to multiple phonon modes lacking phase matching. This is
highlighted by the gray vertical lines in @fig:RIN, which are
placed at $Delta Omega_(l k)$ for $k = 1$ to $6$. The inset of Fig.
@fig:RIN shows the effect of increasing input power from just above
$P_(upright(t h))^P$ to $P_(upright(t h))^(S 1)$. The solid lines
correspond to no transferred RIN from the external pump, and the dotted
lines assume a constant white noise spectrum for the external RIN at
$- 140$ dBc/Hz.

#figure(image("source/freq_noise.png", width: 85%),
  caption: [
    \(a) Theoretical frequency noise spectrum for a large mode volume
    Brillouin laser (solid red line) vs. a single mode laser involving
    overlap between one phonon and one cavity mode (dashed) with an
    input power of 314 mW ($P_(t h)^(S 1)$). Inset: increasing input
    power from blue to red, and $S_(e x t)^(upright(R I N)) = 0$ (solid)
    and $- 140$ dBc/Hz (dotted). (b) Plotting $S_Delta \[ omega \]$ and
    the second term of Eq. @eq:freqnoise
    separated for $S_(e x t)^(upright(R I N)) = 0$ (solid) and $- 140$
    dBc/Hz (dashed). Inset: Effect of $0 arrow.r - 140$ dBc/Hz (solid
    $arrow.r$ dashed) transferred external RIN on linewidth in the
    low-frequency limit (i.e., contents in the brackets of Eq.
    @eq:STLW). The vertical line represents
    $P_(t h)^(upright(S 1))$.
  ]
)
<fig:freqnoise>

=== Frequency Noise of lasing cavity mode
<frequency-noise-of-lasing-cavity-mode>
We now investigate the noise of the lasing mode frequency, $nu_l$, where
$2 pi nu_l \( t \) = dot(phi_l)$. As seen previously in Eq.
@eq:phase_eq, the frequency noise and
amplitude noise of the pump are coupled due to the lack of phase
matching between the optical beat note and the multiple phonon modes
that make up the broad gain bandwidth ($mu''_l eq.not 0$). In turn, this
couples the lasing mode's phase and amplitude. The pump amplitude
fluctuations in the Fourier domain can be expressed as
$ delta alpha_p \( omega \) #h(-1em) = #h(-1em) frac(- omega_0^(upright(r e l)) delta alpha_l \( omega \) + sqrt(gamma_(e x t)) delta F \( omega \) + upright(R e) \[ tilde(h)_p \( omega \) \], - i omega + Gamma_(upright(R I N))) \, $
yielding,
$ 2 pi nu_l \( omega \) & = frac(2 mu''_l alpha_p, - i omega + Gamma_(upright(R I N))) #scale(x: 180%, y: 180%)[\(] - omega_0^(upright(r e l)) delta alpha_l \( omega \) + sqrt(gamma_(e x t)) delta F \( omega \)\
 & + upright(R e) \[ tilde(h)_p \( omega \) \] #scale(x: 180%, y: 180%)[\)] + 1 / alpha_l upright(I m) \[ tilde(h)_l \( omega \) \] . $<eq:freq_variation>
Using Eq. @eq:freq_variation and the
correlation properties of $tilde(h)_p$ and $tilde(h)_l$ detailed in the
Appendix A, we calculate
$chevron.l nu_l^(*) \( omega \) nu_l \( omega' \) chevron.r$, which
provides the two-sided power spectrum for the frequency noise as
$ S_(nu_l) \[ omega \] #h(-1em) = #h(-1em) S_Delta \[ omega \] #h(-1em) + #h(-1em) frac(1, 8 pi^2 alpha_l^2) #scale(x: 180%, y: 180%)[\(] gamma \( N_l #h(-1em) + #h(-1em) 1 \/ 2 \) + 1 / 2 alpha_p^2 beta_l \( omega \) #scale(x: 180%, y: 180%)[\)] \, $<eq:freqnoise>
where $S_Delta \[ omega \]$ is a consequence of phase-amplitude
coupling, given by
$ S_Delta \[ omega \] = frac(1, 4 pi^2) & frac(mu'' ""_l^2 alpha_p^2, omega^2 + Gamma_(upright(R I N))^2) #scale(x: 180%, y: 180%)[\(] alpha_l^2 omega_0^(upright(r e l)^2) S_l^(upright(R I N)) \[ omega \] + 2 gamma \( N_p + 1 \/ 2 \)\
 & + Gamma_(upright(R I N))^2 alpha_p^2 S_(e x t)^(upright(R I N)) \[ omega \] + alpha_l^2 beta_l \( omega \) #scale(x: 180%, y: 180%)[\)] . $
Here, both the RIN of the Brillouin laser and the RIN of the external
pump have an effect on the frequency noise. The frequency noise spectra
is shown in @fig:freqnoise\(a) as a solid red line, contrasted with
a single mode, phase matched Brillouin laser as the dashed red line.
This contrast, arising from the lack of phase matching, appears more
significant in the frequency noise compared to the RIN spectra. The
inset of @fig:freqnoise\(a) shows increasing power from blue to
red, with no transferred external RIN (solid lines) vs. an assumed
constant white noise external RIN of
$S_(e x t)^(upright(R I N)) \[ omega \] = - 140$ dBc/Hz (dashed), with
the same values for power as @fig:RIN\(b).

The contributions from $S_Delta \[ omega \]$ and the second term of Eq.
@eq:freqnoise are shown separated in Fig
@fig:freqnoise\(b), where input power matches the solid red line in Fig.
@fig:freqnoise\(a). Here, assuming an ideal external laser (no RIN)
leaves $S_Delta$ an order of magnitude smaller (solid lines); however,
with a modest transferred RIN of $- 140$ dBc/Hz (dashed line), these two
terms are of the same order. We analyze the impact of this on the
linewidth by examining the low frequency limit,
$ S_(nu_l) \[ omega tilde.op 0 \] tilde.eq & frac(1, 2 pi) #scale(x: 240%, y: 240%)[\[] 2 pi S_Delta \[ omega tilde.op 0 \]\
 & + frac(gamma, 4 pi alpha_l^2) \( N_l + n_(t h) + 1 \) #scale(x: 240%, y: 240%)[\]] \, $<eq:STLW>
where the quantity in the brackets is the modified Schawlow-Townes-like
linewidth for this system when an ideal external pump is assumed, with
the low-offset frequency contribution from the inherent phase-mismatch
given by
$ S_Delta \[ omega #h(-1em) tilde.op #h(-1em) 0 \] #h(-1em) & tilde.eq #h(-1em) frac(mu''_l ""^2 alpha_p^2, 4 pi^2 Gamma_(upright(R I N))^2) #scale(x: 240%, y: 240%)[\[] 4 gamma \( N_p #h(-1em) + #h(-1em) 1 \/ 2 \) #h(-1em) + #h(-1em) 2 gamma Gamma_(upright(R I N))^2 / omega_0^(upright(r e l^2)) \( N_l #h(-1em) + #h(-1em) 1 \/ 2 \)\
 & + 2 Gamma_(upright(R I N))^2 alpha_p^2 S_(e x t)^(upright(R I N)) \[ omega #h(-1em) tilde.op #h(-1em) 0 \] + 8 mu'_l #scale(x: 240%, y: 240%)[\(] alpha_l^2 #h(-1em)\
 & - frac(alpha_l Gamma_(upright(R I N)) alpha_p, omega_0^(upright(r e l))) + #h(-1em) frac(Gamma_(upright(R I N))^2 alpha_p^2, 2 omega_0^(upright(r e l^2))) #scale(x: 240%, y: 240%)[\)] \( n_(t h) #h(-1em) + #h(-1em) 1 \/ 2 \) #scale(x: 240%, y: 240%)[\]] . $<eq:s_delta_STLW>
The inset of @fig:freqnoise\(b) shows the significant implications
of external RIN in Brillouin lasers that lack ideal phase matching,
where the fundamental linewidth (Eq. @eq:STLW) is
plotted vs increasing input power for $S_(e x t)^(upright(R I N)) = 0$
(solid line) and $S_(e x t)^(upright(R I N)) = - 140$ dBc/Hz (dashed
line). Although this sensitivity is inherent to large mode volume
Brillouin lasers, this result emphasizes the importance of operating
traditional Brillouin lasers in perfect phase matching conditions for
lowest achievable linewidths.

= Conclusion
<conclusion>
In this paper, we have developed a multiple oscillator model to
understand the dynamics and noise properties of large mode volume
Brillouin lasers. Through a coupled-mode approach, we model the unique
dynamics of a large mode volume system where multiple cavity modes have
the potential to lase given a small FSR and broad Brillouin gain
bandwidth. Using experimentally determined parameters in our model, we
capture the key features of spontaneous scattering, steady-state
dynamics, amplitude fluctuations, and frequency fluctuations. Notably,
the spontaneous calculation reveals that the frequency pulling and
linewidth narrowing of the cavity modes below lasing threshold may be
used to uncover all salient features of the phonon field, and the
non-lasing modes above threshold may result in ultra-high effective
quality factors as designs scale to longer resonators.

The steady-state dynamics confirm the onset of single-mode lasing,
despite the many optical modes lying within the gain bandwidth. Through
characterization of amplitude fluctuations, we find a RIN spectra that
essentially reproduces that of a single-mode Brillouin laser; however,
the intrinsic off-resonant coupling to multiple phonon modes gives rise
to unique noise features at frequency offsets equal to the degree of
frequency mismatch, which are slightly higher than that of a standard
Brillouin laser. We find this atypical noise feature is even more
significant in the frequency noise spectrum. With inclusion of
transferred external RIN in our analysis, we find that Brillouin lasers
lacking phase matching between the optical beat note and the phonon
mode--or modes--are sensitive to a noisy pump. Consequently, this may
have a significant impact on the achievable linewidth.

#emph[Acknowledgments] This work was supported by NSF Awards No. 2145724
and No. 2427169. The authors thank Kaikai Liu for stimulating
discussions.

#bibliography("references.bib", style: "ieee", title: [References])

#heading(level: 1, numbering: none)[Appendix A. Correlation functions]
<correlation-functions>
#block[
With the solution for $hat(b)_(j k)$ in
@eq:bhatcorrelation and the properties
of the phonon Langevin force $xi_(j k)$, we find the two time
correlation functions
$ chevron.l hat(b)_(j k)^dagger \( t \) hat(b)_(j' k') \( t' \) chevron.r = & integral_(- oo)^t d tau integral_(- oo)^(t') d tau' e^(\( i Delta Omega_(j k) - Gamma_(j k) \/ 2 \) \( t - tau \)) e^(- \( i Delta Omega_(j k) + Gamma_(j k) \/ 2 \) \( t' - tau' \)) delta_(j j') delta_(k k') Gamma_(j k) n_(t h) delta \( tau - tau' \) e^(- i Omega'_(j k) \( tau - tau' \))\
 & = n_(j k) delta_(j j') delta_(k k') e^(- Gamma_(j k) / 2 \| t - t' \|) e^(i Delta Omega_(j k) \( t - t' \)) $
and
$ chevron.l hat(b)_(j k) \( t \) hat(b)_(j' k')^dagger \( t' \) chevron.r = \( n_(j k) + 1 \) delta_(j j') delta_(k k') e^(- Gamma_(j k) / 2 \| t - t' \|) e^(- i Delta Omega_(j k) \( t - t' \)) . $
Using this to calculate the correlation functions for the optical
fluctuating forces, $tilde(h)_p$ and $tilde(h)_l$ (above threshold), we
find
$ chevron.l tilde(h)_p^dagger \( t \) tilde(h)_p \( t' \) chevron.r = & chevron.l #scale(x: 120%, y: 120%)[\[] eta_p^dagger \( t \) + i sum_k g_(l k)^(*) alpha_l e^(- i phi_l \( t \)) hat(b)_(l k)^dagger \( t \) #scale(x: 120%, y: 120%)[\]] e^(i phi_p \( t \)) times #scale(x: 120%, y: 120%)[\[] eta_p \( t' \) - t sum_(k') g_(l k') alpha_l e^(i phi_l \( t' \)) hat(b)_(l k') \( t' \) #scale(x: 120%, y: 120%)[\]] e^(- i phi_p \( t' \)) chevron.r\
 & = chevron.l eta_p^dagger \( t \) eta_p \( t' \) chevron.r chevron.l e^(- i phi_p \( t \)) e^(i phi_p \( t' \)) chevron.r + sum_(k \, k') g_(l k)^(*) g_(l k') alpha_l^2 chevron.l hat(b)_(l k)^dagger \( t \) hat(b)_(l k') \( t' \) chevron.r chevron.l e^(- i \[ phi_l \( t \) - phi_p \( t \) \]) e^(i \[ phi_l \( t' \) - phi_p \( t' \) \]) chevron.r $
Due to the assumption that fluctuation in phase is a white noise
gaussian process,
$chevron.l e^(- i phi_p \( t \)) e^(i phi_p \( t' \)) chevron.r = 1$ and
$ chevron.l e^(- i \[ phi_l \( t \) - phi_p \( t \) \]) e^(i \[ phi_l \( t \) - phi_p \( t' \) \]) chevron.r tilde.op e^(- 1 / 2 gamma_phi.alt \| t - t' \|) \, $<eq:phase_correlation>
where $gamma_phi.alt$ characterizes the correlation time of the phases.
This will relate to the laser linewidths, which is much less than the
phonon damping rate, i.e., $gamma_phi.alt lt.double Gamma_(p h)$. In
this limit, Eq. @eq:phase_correlation
$tilde.op 1$. This gives
$ chevron.l tilde(h)_p^dagger \( t \) tilde(h)_p \( t' \) chevron.r approx gamma N_p delta \( t - t' \) + sum_k \| g_(l k) \|^2 alpha_l^2 delta_(k k') n_(l k) e^(- Gamma_(l k) / 2 \| t - t' \|) e^(i Delta Omega_(l k) \( t - t \)) . $
Following the same logic, we arrive at the two-time correlation function
for $tilde(h)_l$,
$ chevron.l tilde(h)_l^dagger \( t \) tilde(h)_l \( t' \) chevron.r approx gamma N_l delta \( t - t' \) + sum_k \| g_(l k) \|^2 alpha_p^2 delta_(k k') \( n_(l k) + 1 \) e^(- Gamma_(l k) / 2 \| t - t' \|) e^(- i Delta Omega_(l k) \( t - t \)) . $
For $chevron.l tilde(h)_p \( t \) tilde(h)_p^dagger \( t' \) chevron.r$,
change $N_p arrow.r N_p + 1$, $n_(l k) arrow.r n_(l k) + 1$, and flip
the phase of $e^(i Delta Omega_(l k) \( t - t' \))$. For
$chevron.l tilde(h)_l \( t \) tilde(h)_l^dagger \( t' \) chevron.r$,
change $N_l arrow.r N_l + 1$, $\( n_(l k) + 1 \) arrow.r n_(l k)$, and
flip the phase. Additionally, we find
$chevron.l tilde(h)_p \( t \) tilde(h)_p \( t' \) chevron.r = chevron.l tilde(h)_l \( t \) tilde(h)_l \( t' \) chevron.r = 0$
and
$ chevron.l tilde(h)_p \( t \) tilde(h)_l \( t' \) chevron.r = - sum_k \| g_(l k) \|^2 alpha_p alpha_l \( n_(l k) + 1 \) e^(- Gamma_(l k) / 2 \| t - t' \|) e^(- i Delta Omega_(l k) \( t - t \)) = chevron.l tilde(h)_l^dagger \( t \) tilde(h)_p^dagger \( t' \) chevron.r . $
where $p$ and $l$ can be exchanged by changing
$n_(l k) + 1 arrow.r n_(l k)$ and flipping the phase. Leveraging the
definitions $upright(R e) \[ h \] = 1 \/ 2 \( h + h^dagger \)$ and
$upright(I m) \[ tilde(h) \] = - i \/ 2 \( h - h^dagger \)$, we compute
additional useful correlation functions here,
$ chevron.l upright(R e) & \[ tilde(h)_(p \/ l) \( t \) \] upright(R e) \[ tilde(h)_(p \/ l) \( t' \) \] chevron.r = chevron.l upright(I m) \[ tilde(h)_(p \/ l) \( t \) \] upright(I m) \[ tilde(h)_(p \/ l) \( t' \) \] chevron.r\
 & = 1 / 2 gamma delta \( t - t' \) \( N_(p \/ l) + 1 \/ 2 \) + 1 / 4 sum_k \| g_(l k) \|^2 alpha_(l \/ p)^2 e^(- Gamma_(l k) / 2 \| t - t' \|) #scale(x: 120%, y: 120%)[\[] n_(l k) e^(i Delta Omega_(l k) \( t - t' \)) + \( n_(l k) + 1 \) e^(- i Delta Omega_(l k) \( t - t' \)) #scale(x: 120%, y: 120%)[\]] $
$ chevron.l upright(R e) \[ tilde(h)_p \( t \) \] & upright(R e) \[ tilde(h)_l \( t' \) \] chevron.r = chevron.l upright(R e) \[ tilde(h)_l \( t \) \] upright(R e) \[ tilde(h)_p \( t' \) \] chevron.r\
 & = - 1 / 4 sum_k \| g_(l k) \|^2 alpha_l alpha_p delta_(k k') e^(- Gamma_(l k) / 2 \| t - t' \|) #scale(x: 120%, y: 120%)[\[] n_(l k) e^(i Delta Omega_(l k) \( t - t' \)) + \( n_(l k) + 1 \) e^(- i Delta Omega_(l k) \( t - t' \)) #scale(x: 120%, y: 120%)[\]] $
$ chevron.l upright(R e) \[ tilde(h)_p \( t \) \] & upright(I m) \[ tilde(h)_l \( t' \) \] chevron.r = - chevron.l upright(I m) \[ tilde(h)_l \( t \) \] upright(R e) \[ tilde(h)_p \( t' \) \] chevron.r\
 & = frac(1, 4 i) sum_k \| g_(l k) \|^2 alpha_l alpha_p e^(- Gamma_(l k) / 2 \| t - t' \|) #scale(x: 120%, y: 120%)[\[] n_(l k) e^(i Delta Omega_(l k) \( t - t' \)) - \( n_(l k) + 1 \) e^(- i Delta Omega_(l k) \( t - t' \)) #scale(x: 120%, y: 120%)[\]] . $

]
