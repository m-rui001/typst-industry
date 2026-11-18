#set document(title: "Supplementary Material: Controlling Spin-Waves by Inhomogeneous Spin-Transfer Torques")
#set page(paper: "a4", margin: (x: 24mm, y: 22mm), numbering: "1")
#set text(font: "Libertinus Serif", size: 10.5pt)
#set par(justify: true, leading: .55em)
#set math.equation(numbering: "(1)")
#show figure.caption: set text(size: 9pt)
#align(center)[
  #text(size: 17pt, weight: "bold")[Supplementary Material: Controlling Spin-Waves by Inhomogeneous Spin-Transfer Torques]
  #v(.55em)
  Lorenzo Gnoatto#super[1], Jean F. O. da Silva#super[2], Artim L. Bassant#super[3], Rai M. Menezes#super[2,4], Rembert A. Duine#super[1,3], Milorad V. Milo?evi?#super[2], and Reinoud Lavrijsen#super[1]
  #v(.4em)
  #text(size: 9pt)[#super[1]Eindhoven University of Technology, Eindhoven, The Netherlands \
  #super[2]COMMIT, Department of Physics, University of Antwerp, Antwerp, Belgium \
  #super[3]Institute for Theoretical Physics, Utrecht University, Utrecht, The Netherlands \
  #super[4]Departamento de F?sica, Universidade Federal de Pernambuco, Recife, Brazil \
  #link("mailto:l.g.gnoatto@tue.nl") #h(1em) #link("mailto:milorad.milosevic@uantwerpen.be")]

]
#v(.5em)

= EXPERIMENTAL
<sec.EXPERIMENTAL>
== Amplitude measurements
<amplitude-measurements>
#figure(image("source/sup_1.pdf", width: 100.0%),
  caption: [
    a) Transmitted spin-wave spectrum for a device with constriction
    width $w_(upright(c)) = 571$~nm under an applied field of
    $mu_0 H = + 60$~mT, along with a Gaussian fit. b) Extracted fit
    amplitudes for all devices with varying constriction widths. c)
    $w_(e f f)$ calculated for differend widths as a function of the
    applied magnetic field, black dashed line indicate the nominal 2000
    nm width.
  ]
)
<exp.fig.1>

Figure~S@exp.fig.1\(a) shows a representative transmitted signal fitted
with a Gaussian function. This dataset corresponds to the same device
shown in Fig.~2(c) of the main text (though at a different external
magnetic field), and reflects the spin-wave (SW) amplitude transmitted
from antenna 1 to antenna 2. As discussed in the main text, the
geometrical constriction modifies the internal effective field, acting
as a potential scattering or damping site for SWs due to local
variations in demagnetizing fields.

To quantify the overall transmission, we extract the amplitude of the
fitted Gaussian at each value of the applied field. The resulting
amplitudes, summarized in @exp.fig.1\(b), show a clear trend: the
signal amplitude initially increases with field, reaches a maximum, and
subsequently decreases. This behavior arises from the interplay between
two key mechanisms: the field-dependent effective width
$w_(upright(e f f))$ of the waveguide and the corresponding spin-wave
group velocity $v_(upright(g))$.

The effective width, $w_(upright(e f f))$, accounts for demagnetizing
effects and determines the onset of SW conduit behavior. Following the
approach in Ref.~@bracher2017creation, we calculate $w_(upright(e f f))$
and plot it as a function of external magnetic field in
@exp.fig.1\(c). At low fields, $w_(upright(e f f))$ is
significantly reduced due to strong demagnetizing effects near the
edges, suppressing spin-wave propagation and detection. As the field
increases, the magnetization aligns more uniformly along the external
field direction, effectively broadening the conduit region. This results
in increased excitation and transmission of Damon-Eshbach spin waves,
enhancing signal detection.

Once the strip becomes fully magnetized---marked by the maximum in
transmitted amplitude---further increasing the external field leads to a
gradual decline in signal. This behavior is attributed to the reduction
in group velocity $v_(upright(g))$, as shown in Fig.~2(a) of the main
text. Although the conduit condition is maintained, the lower
$v_(upright(g))$ at higher fields reduces the efficiency with which spin
waves propagate between the antennas, resulting in fewer SWs reaching
the detector and, consequently, a weaker measured signal.

Note that the $w_(upright(e f f))$ model shown in @exp.fig.1\(c)
applies to a uniform strip and does not capture spatial variations
present in constricted geometries. Nonetheless, the same qualitative
trend is observed across all devices. In particular, the maximum signal
amplitude decreases systematically with decreasing constriction width
$w_(upright(c))$, consistent with increased internal field inhomogeneity
and enhanced reflection in narrower constrictions. Based on these
results, we identify $mu_0 H = 100 med upright(m T)$ as the minimum
field required to ensure reliable SW transmission across all tested
constriction widths.

Figure~@exp.fig.03 shows an example of transmitted spectra and its
modification under applied current. When a current is applied, an
overall shift toward lower frequencies is observed.

#figure(image("source/raw_data.pdf", width: 100.0%),
  caption: [
    Example of a transmitted spectrum for a sample with
    $w_(upright(c)) = 857 thin upright(n m)$, shown at zero current and
    under applied currents of approximately
    $plus.minus 5 thin upright(m A)$, with an external magnetic field of
    $100 thin upright(m T)$.
  ]
)
<exp.fig.03>

#figure(image("source/sup_2_IV.pdf", width: 100.0%),
  caption: [
    2-point measured transport characteristics of all devices: a) IV
    curves of all devices and (b) resistance as function of constriction
    width
  ]
)
<exp.fig.02>

== Spin polarization extraction using current-induced spin wave Doppler shift
<sub:SWDS>
To determine the degree of spin polarization, we used spin wave Doppler
shift measurement on a continuous (unconstricted) strip. The data
analysis is the same as our previous report where we determine the
Doppler shift as~@gnoatto2024investigating:

$ Delta f_(upright("dop")) & = frac(delta f_(upright(12)) - delta f_(upright(21)), 4) = - frac(g mu_(upright("B")) P, 4 pi M_(upright(s)) \| e \|) frac(I_(upright("FM")), w med t) k \, $<eq:doppler_frequency>
where $delta f_(upright(12))$ and $delta f_(upright(21))$ are the
current induced frequency shift for oppositely propagating spin waves,
$g approx 2$ is the g-factor, $mu_(upright("B"))$ the Bohr magneton,
$M_(upright(s))$ = 750 kA/m the saturation magnetization, $e$ the
electron charge, $k = 4.9 med upright(mu m^(- 1))$ the spin-wave
wavevector dictated by the antenna, $w$ = 2000 nm is the width of the
ferromagnetic strip, $I_(upright("FM"))$ the current through the
ferromagnet and $t$ the nominal film thickness, resulting on a value of
$P$ = 0.55 $plus.minus med 0.07$ that we use to plot the theoretical
formula in Fig.~3(d) in the main text.

= Simulations
<sec.Simulations>
#figure(image("source/FIG1.png", width: 50.0%),
  caption: [
    Spin-wave propagation in a strip with a constriction in its center.
    The SW is generated in the antenna in +$z$-direction as a result of
    an oscillating field
    $b \( t \) = b_0 upright("sinc") \( 2 pi f t \)$ and propagates in
    \+$x$-direction. $B_(e x t)$ is applied in +$y$-direction. Different
    constriction widths $d_w$ are considered to study their effect on
    the SW propagation.
  ]
)
<sim.fig.1>

To simulate the considered magnetic system, the Mumax$""^3$ package was
employed @Vansteenkiste2014@Leliaert_2018. The magnetization of the
ferromagnetic film is represented by the vector field
$arrow(M) \( upright(bold(r)) \)$ =
$M_S arrow(m) \( upright(bold(r)) \)$, where
$arrow(m) \( upright(bold(r)) \)$ is the normalized magnetization
direction, as $\| arrow(M) \| = M_S$ for any position $bold("r")$ of the
film. The considered energy functional takes into account the
contribution of exchange interaction, the Zeeman energy due to applied
bias magnetic field and the demagnetizing (dipolar) interaction

#figure(image("source/sup_2.png", width: 100.0%),
  caption: [
    a) Simulated magnetization distribution for a uniform
    and a constricted waveguide geometry. Simulated spin-wave intensity
    at the detection region as a function of applied magnetic field for
    (b) the reference, unconstricted waveguide
    ($w_(upright(c)) = w = 2000 med upright(n m)$) and (c) a constricted
    waveguide ($w_(upright(c)) = 571 med upright(n m)$). d) Integrated
    amplitude for different constrictions, the black dashed line denotes
    the threshold taken to define the critical field.
  ]
)
<sim.fig.4>

$ E \[ arrow(m) \] = integral [A \( nabla arrow(m) \)^2 - M_s arrow(B)_(e x t) dot.op arrow(m) - M_s / 2 arrow(B)_(upright("demag")) dot.op arrow(m)] d^3 upright(bold(r)) \, $<eq.E>
with the exchange stiffness $A > 0$, the external field
$arrow(B)_(e x t)$, and the demagnetization field
$arrow(B)_(upright("demag"))$, respectively. Following the experimental
configuration, we consider the external field in the
$+ hat(y)$-direction. We create a localized perturbation in the edge of
the sample in the $+ hat(z)$-direction that allows us to generate the
spin-wave (SW) solutions (see @sim.fig.1). Since the perturbation
is small, we can neglect the oscillations in $m_y$, thus
$delta arrow(m) = \[ delta m_x \, 0 \, delta m_z \]$. The magnetization
dynamics is governed by the Landau-Lifshitz-Gilbert (LLG) equation
@gilbert2004phenomenological:

$ dot(arrow(m)) = - gamma arrow(m) times arrow(H)_(e f f) + alpha arrow(m) times dot(arrow(m)) + arrow(tau)_(S T T) \, $<LLG_equation>
where $gamma$ is the gyromagnetic ratio, $arrow(H)_(e f f)$ is the
effective field given by
$arrow(H)_(e f f) = - delta E \/ delta arrow(M)$, and $alpha$ is the
Gilbert damping factor. The last term on the right-hand side of
Eq.~#link(<LLG_equation>)[\[LLG\_equation\]] represents the spin
transfer torque $arrow(tau)_(S T T)$, which arises when spin-polarized
currents are present
@RALPH20081190@PhysRevB.70.024417@PhysRevLett.93.127204.

For the simulations, we consider a $16000 times 2000 times 20$~nm$""^3$
Permalloy strip, with saturation magnetization
$M_(upright(s)) = 750$~kA/m, gyromagnetic factor
$gamma \/ 2 pi = 29$~GHz/T, $alpha = 0.007$ and the exchange stiffness
constant $A = 13$~pJ/m. The $M_(upright(s))$ value was taken from the
experimental measurements, and the other parameters were taken from
literature @Ni_Py_parameters@exchange_stiffness_parameters_Py. The
system was discretized into $5 times 5 times 5$~nm$""^3$ cells.

To generate the SWs in the simulations, we consider an artificial
antenna to create a localized perturbation with the field
$b \( t \) = b_0 upright("sinc") \( 2 pi f_(m a x) t \) hat(z)$ applied
along the $z$-direction, with amplitude $b_0 = 0.01 B_(upright("ext"))$
and oscillation frequency ranging from 0 to $f_(m a x)$ = 15 GHz. This
creates spin wave solutions that propagate towards the
$+ hat(x)$-direction, as illustrated in @sim.fig.1, to evaluate
the transmitted SW characteristic as a function of the external field
$B_(e x t)$.

Figure~S@sim.fig.4 shows the micromagnetic simulations for the spin-wave
dispersion, performed under conditions similar to those used in the
experiments (see Figure 2(a-b) in the main text). In
@sim.fig.4\(a) we present the magnetization profile, here, the
system is first relaxed to obtain the ground-state magnetization
configuration. Because of the geometry and the resulting demagnetizing
fields, this relaxation produces a multidomain state, most prominently
at the constriction center where the $m_(upright(x))$ component exhibits
symmetric dips. After applying the transverse field to generate the
Damon--Eshbach mode, the domain pattern persists, particularly near the
sharp corners of the constriction. This residual nonuniformity does not
qualitatively affect the results, and all simulated trends remain fully
consistent with the experimental observations. @sim.fig.4\(b)
shows the dispersion relation for the full stripe and
@sim.fig.4\(c) for the constricted geometry ($w$ = 571 nm). Figure
~S@sim.fig.4\(d) shows the integrated amplitude for the full spectra for
each $B_(e x t)$, considering all the constrictions, where the black
dashed line sets the threshold to define the critical field. These
spectra were extracted by recording the transmitted amplitude as a
function of the applied external magnetic field. The simulated
dispersion shows more features compared to experiments. (i) Multiple
dispersion branches are observed which we speculate to be from the
excitation of higher-order transverse modes due to the broadband nature
of the sinc-function excitation. In particular, both $n = 1$ and $n = 3$
magnetostatic surface wave modes may be excited, each with distinct
dispersion characteristics~#cite(label("10.1063/1.5099358")). Another
speculation might be that they are due to the multidomain nature of the
magnetization profile, e.g. domain wall guided spin-wave conduction,
albeit a very different dispersion would be expected. (ii) In
Fig.S@sim.fig.4\(d) extra steps are observed in the amplitude most
prominet in the 571 and 286 nm constrictions, these are due to the
dissapearance of the multidomain structure at the constriction being
expelled with larger external magnetic field, something we do not
observe in the experiments. Further analysis and targeted simulations
would be required to unambiguously identify the nature of the modes and
effect of the multidomain nature on PSWS. Such an investigation lies
beyond the scope of this work. In contrast, these higher-order features
are typically not resolved in PSWS measurements, likely due to the
limited mode selectivity of the antenna geometry, which primarily
excites the lowest-order modes~@lucassen2019optimizing.

Thereafter, to consider the bias of the charge carriers in the
magnetization dynamics @SLONCZEWSKI1996L1@PhysRevB.54.9353, we
incorporate the spin transfer torque term $arrow(tau)_(S T T)$ in the
LLG equation following previous steps in the literature
@PhysRevLett.93.127204@PhysRevB.69.094421
$ \( partial_t + arrow(v)_s dot.op nabla \) arrow(m) = - gamma arrow(m) times arrow(H)_(e f f) + alpha arrow(m) times \( partial_t + beta / alpha arrow(v)_s dot.op nabla \) arrow(m) \, $<equation_doormenbal>
the equation above can be linearized assuming small damping $alpha$ and
non-adiabaticity $beta$ to study macroscopic effects of the STT via
@menezes2024toward:
$ omega = frac(2 A gamma, M_S) k^2 + arrow(v)_s dot.op arrow(k) + gamma B_(e x t) . $<disp_STT>
This equation expresses the macroscopic interaction due to the addition
of a polarized current in the system without considering dipolar
interactions. The typical parabolic dispersion relation for SWs in the
exchange regime is shifted by a factor
$Delta omega approx arrow(v)_s dot.op arrow(k)$. It means the current
density will provide a (Doppler) shift in the dispersion relation
calculated by $frac(Delta omega, k) = frac(g mu_B P J, 2 \| e \| M_S)$
for a rectangular geometry. By considering the micromagnetic simulation,
one can take a step further, taking into account the current
distribution for each constriction. By solving the Poisson equation to
consider a realistic current distribution, therein study the STT effect
with more precision, considering that due to non-homogeneity in the
current distribution, the results may follow a different trend.

#figure(image("source/SW_Doppler_shift_propagation.png", width: 100.0%),
  caption: [
    Spin-wave propagation in a constricted strip ($w$ = 1140 nm) for (a)
    0.7, 2, and 4 ns. The spin wave (SW) reaches the dashed line, where
    its maximum amplitude is computed for (d) $I$ = 0 mA. The peak
    amplitude is then analyzed as the current increases to determine the
    group velocity shift up to (e) $I$ = 5.2 mA.
  ]
)
<sim.fig.3>

To explore spin-wave dynamics under inhomogeneous current distributions,
we extended the simulations to include spatially varying current
densities based on realistic geometries. Following the methodology of
Ref.~, the current distribution was obtained by solving the Poisson
equation and incorporated into the micromagnetic model.

To investigate the dynamics of the SWs under inhomogeneous current
distributions, we modeled a 20 nm-thick magnetic thin film, see Fig.
S@sim.fig.3\(a-c), and numerically analyzed the distribution of current
within the constricted geometry. To isolate the influence of current on
SW propagation, a time-dependent perturbation field
$b \( t \) = b_0 upright("sin") \( 2 pi f t \) hat(z)$ (with $f$ = 11
GHz) was applied for 20 ps. Initial simulations were conducted without
any applied current to establish a baseline, enabling the extraction of
the maximum oscillation amplitudes, see @sim.fig.3\(d). We
determined the group velocity of the wavefront by fitting an envelope
curve within the region of interest in the time domain, delineated by
the dashed boundaries in @sim.fig.3\(a-c). The propagation
distance remained constant (i.e. 13.9 $mu$m) in all the simulated
geometries, thus the calculation of the group velocity is given by
$v_g = frac(Delta x, Delta t)$. We then repeated this analysis,
considering different current magnitudes $I$. By tracking the time
associated with the maximum amplitude of the envelope, Fig.
@sim.fig.3\(e), one can calculate the displacement as the current
increases, therefore calculating the group velocity's variation
$Delta v_g = v_g \( I \) - v_g \( I = 0 \)$ for each applied current.

#figure(image("source/sim_fig4.png", width: 90.0%),
  caption: [
    a) Simulated variation in spin-wave group velocity $Delta v_g$ as a
    function of current for different constriction widths. b) Extracted
    slopes of $Delta v_g \( I \)$ compared with theoretical predictions
    from Equation (1) in the main text.
  ]
)
<sim.fig.5>

The full result can be seen in @sim.fig.5\(a), where one can find
the group velocity variation for different constrictions with different
current magnitudes. One should notice that the linear behaviour changes
as we reduce the width of the constriction. We took the slopes from
@sim.fig.5\(a) to compare with the experimental and analytical
results, as shown in the main text.

We also employed simulations to compare these results with the
analytical relation developed in the next section. As one can observe in
@sim.fig.5\(b), the SW group velocity indicates the same trend as
seen in the analytical relation, but the slopes for the simulation
results are a bit higher, possibly indicating the dipolar interactions
in the sample acting to enhance the SW group velocity.

= Analytical theory
<sec.theory>
Here we show the derivation of Eq. (1) from the main text. The
derivation begins by expressing the inductance as a spatial integral and
the susceptibility in terms of spatial coordinates. Subsequently, we
assume small Gilbert damping ($alpha approx 10^(- 3) lt.double 1$),
employ a simplified antenna model, and consider the spin waves to
propagate adiabatically. This allowed us to extract the phase of the
inductance, given by
$phi.alt \( omega \) = integral_(x_1)^(x_2) k_omega \( y \) d y$ where
$x_1$ and $x_2$ are the positions of the antennae and $k_omega \( x \)$
the spatially dependent wave vector. Using a model current density given
in Eq. #link(<eq:modelCurrent>)[\[eq:modelCurrent\]], we find an
analytical expression for the phase. The group velocity from the
analytical expression of the phase is found using
$v_(upright(g)) = D (frac(upright(d) phi.alt \( omega \), upright(d) omega))^(- 1)$,
which is given in the main text.

Additionally, we discuss the limitations of the analytical result and
outline subsequent steps to improve its accuracy.

== The analytical model of inhomogeneous PSWS
<App:groupvelocity>
#figure(image("source/GeometrySymbols.pdf", width: 65.0%),
  caption: [
    A schematic of the setup showing all of the relevant parameters of
    the geometry.
  ]
)
<fig.1>

In the following derivation, we will make use of the following
parameters of the thin film geometry. The distance between the antennae
is given by $D$, the length of the geometry is given by $l$, the largest
(smallest) width of the thin film is given by $w_0$ ($w_c$), and the
thickness of the film is given by $t$. These are schematically given in
@fig.1. In PSWS experiments, the inductance is usually well
approximated by the equation @huber_control_2013:

$ L \( omega \) = mu_0 / 2 integral rho^2 \( k \) tilde(chi) \( k \, omega \) e^(i k D) d k \, $<eq:Lmom>

with $rho \( k \)$ the Fourier transform of the magnetic field from the
antennae, and $tilde(chi) \( k \, omega \)$ is the magnetic
susceptibility. The Fourier transform assumes that the wave guide is
translationally symmetric, which is broken by a varying geometry.
Therefore, we do not transform to reciprocal space in deriving Eq.
#link(<eq:Lmom>)[\[eq:Lmom\]], and we find

$ L \( omega \) = mu_0 / 2 integral.double d x d x' h \( x - x_2 \) h \( x' - x_1 \) chi \( x \, x' \, omega \) \, $<eq:Lspac>

where $x_1$ and $x_2$ are the positions of antenna 1 and 2,
respectively. The magnetic field of the antenna in real space is given
by $h \( x \)$, which we assume to be identical for both antennae. The
susceptibility is given by the eigenfunction expansion,

$ chi \( x \, x' \, omega \) = integral frac(d epsilon, 2 pi) rho \( epsilon \) frac(psi_epsilon \( x \) psi_epsilon^(*) \( x' \), \( 1 + i alpha \) omega - epsilon) . $<eq:sus>

Here, $psi_epsilon \( x \)$ is an eigenfunction of the linearized
Landau-Lifshitz equation with frequency $epsilon$, $rho \( epsilon \)$
is the density of states of spin waves, and $alpha$ is the damping
coefficient. The eigenfunctions form an orthogonal basis, which allows
for this expansion. Unfortunately, the eigenfunctions are generally
difficult to compute for arbitrary geometries, in particular for dipolar
spin waves. We continue by assuming that the spin waves evolve
adiabatically as this move through the constriction. This entails that
the spin waves do not scatter against the boundary and that their wave
vector varies smoothly through space. This results in the eigenfunction
$psi_epsilon \( x \) prop exp \( i integral_(x_1)^x k_epsilon \( y \) d y \)$.
Together with the assumption that the Gilbert damping is small, we use
the Sokhotski-Plemelj theorem to find the imaginary part of the
susceptibility

$ Im (chi \( x \, x' \, omega \)) = & frac(rho \( omega \), 2) Im \( psi_omega \( x \) psi_omega^(*) \( x' \) \) \,\
prop & frac(rho \( omega \), 2) Im (exp (i integral_(x')^x k_omega \( y \) d y)) . $<eq:sus>

The Kramer-Kronig relation allows us to compute the real part of the
susceptibility. However, in this case, the imaginary part suffices to
find the phase of the non-local inductance. We model the antennae as a
Dirac delta ($h \( x - x' \) = delta \( x - x' \)$), which equates to an
infinitely thin strip. The generalisation to antennae with finite width
does not affect the physical result. Varying the antenna's width changes
the distribution of the excited wave vectors, but each wave vector has
an equivalent STT term in the dispersion. The mathematical treatment,
however, becomes more involved. We find that the imaginary part of the
inductance is

$ Im \( L \( omega \) \) prop Im (exp (i integral_(x_1)^(x_2) k_omega \( y \) d y)) . $

Therefore the phase of the inductance is given by
$phi.alt \( omega \) = integral_(x_1)^(x_2) k_omega \( y \) d y$. To
compute the phase of the constricted geometry, we need to derive the
spatially dependent wave vector $k_omega \( x \)$. For $k t lt.double 1$
and $k approx k_(e x p)$ where $k_(e x p)$ is the experimentally excited
wave vector and $t$ the thickness, we find that

$ k_omega \( x \) = frac(c_1 + c_2 omega, c_3 + c_2 c_J j_e \( x \)) . $

Herein, we do not take into account the current effects on the
magnetisation, such as Joule heating. Their effects are considered at
the end of this section. The current density is the spatially dependent
part of the wave vector and is given by $j_e \( x \)$. The coefficients
$c_i$ are given by

$ c_1 = & - (2 B_0 gamma \( B_0 + M_(e f f) \) + 1 / 2 gamma t k_(e x p) M_(e f f) M_s) \,\
c_2 = & 2 gamma sqrt(B_0 \( B_0 + M_(e f f) \) - 1 / 2 t^2 k_(e x p)^2 M_s (M_(e f f) + M_s / 2) + 1 / 2 t k_(e x p) M_(e f f) M_s) \,\
c_3 = & gamma (frac(t M_(e f f) M_s, 2) - t^2 k_(e x p) M_s (M_(e f f) + M_s / 2)) \,\
c_J = & frac(mu_B P, \| e \| M_s) . $

We used that $B_0$ is the external magnetic field, $M_(e f f)$ is the
effective magnetization, $M_s$ is the saturation magnetization, $gamma$
the gyromagnetic ratio, $mu_B$ the Bohr magneton, $P$ the polarization,
and $e$ the elementary charge. To solve for the phase, we approximate
the current density as

$ j_e \( x \) = (1 - w_0 / w_c) I / A min (1 \, frac(2 \| x \|, l)) + w_0 / w_c I / A . $<eq:modelCurrent>

Where $I$ is the total current, $A$ is the surface through which the
current passes, $w_0$ is the largest width and $w_c$ is the smallest
width in the constriction, and $l$ is the length of the geometry. The
current density is defined such that $x = 0$ is the middle of the
geometry. Therefore, the antennae are at $x = plus.minus D \/ 2$, and
the geometry starts/ends at $x = plus.minus l \/ 2$. This current
density ensures that the total current passing is constant throughout
the thin film. The phase can be separated into two parts,

$ phi.alt \( omega \) = underbrace(integral_(- D \/ 2)^(- l \/ 2) k_omega \( y \) d y + integral_(l \/ 2)^(D \/ 2) k_omega \( y \) d y, phi.alt_0) + underbrace(integral_(- l \/ 2)^(l \/ 2) k_omega \( y \) d y, phi.alt_1) . $

The total phase is thus given by $phi.alt = phi.alt_0 + phi.alt_1$,
where $phi.alt_0$ is the phase accumulated outside the canting geometry
and $phi.alt_1$ is the phase accumulated inside the geometry. The two
parts of the phase can be computed,

$ phi.alt_0 = & \( D - l \) frac(c_1 + c_2 omega, c_3 + c_2 c_J j_(m i n)) \,\
phi.alt_1 = & 2 integral_(j_(m i n))^(j_(m a x)) lr(|frac(d j_e, d x)|)^(- 1) frac(c_1 + c_2 omega, c_3 + c_2 c_J j_e) d j_e \,\
= & ((w_0 / w_c - 1) j_(m i n) / l)^(- 1) frac(c_1 + c_2 omega, c_2 c_J) ln (frac(c_3 + c_2 c_J j_(m a x), c_3 + c_2 c_J j_(m i n))) . $<eq:phi0>

The integration is done from the lowest current density
$j_(m i n) = I \/ A$ to the largest current density
$j_(m a x) = w_0 I \/ w_c A$. In the experiment, we find that the
spin-drift velocity $v_d = c_J I \/ A$ is smaller than the group
velocity of the experimentally excited wave vector in the Damon-Eshbach
(DE) geometry, $v_(D E) = c_3 \/ c_2$. Therefore, we linearised the
phase using $v_d lt.double v_(D E S W)$ or equally
$j_(m i n) lt.double c_3 \/ c_2 c_J$.

$ phi.alt_0 approx & \( D - l \) frac(c_1 + c_2 omega, c_3) (1 - frac(c_2 c_J, c_3) j_(m i n) + frac(c_2^2 c_J^2, c_3^2) j_(m i n)^2) \,\
phi.alt_1 approx & l frac(c_1 + c_2 omega, c_3) (1 - frac(c_2 c_J, 2 c_3) (1 + w_0 / w_c) j_(m i n) + frac(c_2^2 c_J^2, 3 c_3^2) (1 + w_0 / w_c + (w_0 / w_c)^2) j_(m i n)^2) . $

The sum of these expressions gives us the total phase. From Eqs.
#ref(<eq:phi0>), we compute
the group velocity. For small current densities, we find

$ v_g = & D (frac(d phi.alt, d omega))^(- 1) \,\
approx & c_3 / c_2 (1 + frac(c_2 c_J, c_3) (1 + frac(l, 2 D) (w_0 / w_c - 1)) I / A - frac(c_2^2 c_J^2, c_3^2) l / D frac(4 D - 3 l, 12 D) (w_0 / w_c - 1)^2 (I / A)^2) . $

Here, we again used that $j_(m i n) lt.double c_3 \/ c_2 c_J$. The first
term is the group velocity at the experimentally excited wave vector,
$v_(D E) = c_3 \/ c_2$. Thus, the change of the group velocity induced
by the current is given by

$ Delta v_g approx underbrace(c_J (1 + frac(l, 2 D) (w_0 / w_c - 1)) I / A, upright("STT")) - l / D frac(4 D - 3 l, 12 D) (w_0 / w_c - 1)^2 c_2 / c_3 (c_J I / A)^2 . $<eq:vg>

The first term is a change in group velocity solely due to the
inhomogeneous STT. The second term is proportional to
$\( v_d \/ v_(D E) \) v_d$ and therefore also incorporates the largest
order correction due to the shape of the dispersion relation. In the
main text, we only consider the first term since the higher-order terms
are small and masked by the Joule heating effect.

Eq. #link(<eq:vg>)[\[eq:vg\]] is a result of several simplifications,
such as vanishing Gilbert damping and infinitely thin antennae. This
causes the analytical result to slightly deviate from experimental data.
In particular, both a large Gilbert damping and an antenna with a finite
width cause a larger range of spin waves to contribute to the group
velocity. Taking this into account makes the analytical result more
difficult, but does not alter the result, since the first term of Eq.
#link(<eq:vg>)[\[eq:vg\]] is independent of the excited wave vectors.

Another simplification is the model for the current density. In Eq.
#link(<eq:modelCurrent>)[\[eq:modelCurrent\]], we used that at any point
in the permalloy, the total current stays constant. This causes the
current density to vary linearly with position, and in the middle it is
not smooth. In reality, the current density varies smoothly through the
permalloy, which changes the accumulated phase of the spin waves in the
constriction. This effect gives a small correction to the result, which
could slightly increase the change in the group velocity.

Lastly, this analytical result is only true for small currents, since it
does not take into account effects caused by Joule heating. The
magnetisation of the permalloy decreases approximately quadratically
with current due to heating. Since the heating changes with position,
the magnetisation can change with position. Taking this into account in
the numerical evaluation of the change group velocity showed us a
similar trend as Fig. 3(d) of the main text. Unfortunately, taking into
account the exact decrease in magnetisation at every position due to
current is complex, since the different devices have different heat
dissipation. A possible solution could be simulating or experimentally
measuring the magnetisation change due to current. This, in turn, can be
used to numerically evaluate the phase and, therefore, also the group
velocity.

#bibliography("references_sup.bib", style: "american-physics-society", title: [References])
