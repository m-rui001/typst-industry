// Typst format conversion of arXiv:2512.10045v1 under CC BY 4.0.
#set page(paper: "a4", margin: 21mm, numbering: "1")
#set text(font: "Libertinus Serif", size: 10.5pt)
#set par(justify: true)
#set heading(numbering: "1.1")
#set math.equation(numbering: "(1)")
#align(center)[
  #text(size: 16pt, weight: "bold")[Broadband Spatio-Spectral Mode Conversion via Four-Wave Mixing]
  #v(5pt)
  Helaman Flores#super[1], Mahmoud Jalali Mehrabad#super[1], Siavash Mirzaei-Ghormish#super[2], Ryan M. Camacho#super[2], and Dirk Englund#super[1]

  #super[1] Research Laboratory of Electronics, Massachusetts Institute of Technology, Cambridge, Massachusetts 02139, USA \
  #super[2] Department of Electrical and Computer Engineering, Brigham Young University, Provo, Utah 84602, USA

  #link("mailto:floresh2@mit.edu") ? #link("mailto:englund@mit.edu")

  #link("https://arxiv.org/abs/2512.10045v1")[arXiv:2512.10045v1] ? #link("https://creativecommons.org/licenses/by/4.0/")[CC BY 4.0]
]

*Abstract.* We introduce a framework for scalable and broadband free-space
phase-matched four-wave mixing in ring resonators. This method for
four-wave mixing reduces the complexity of coupling an emitter to a
quantum network by combining the spatial and spectral interfaces between
them into one nonlinear optical process. The device is compliant with
current heterogeneous integration capabilities and has a bandwidth of
165 nm for efficient spatio-spectral conversion. We outline a
fabrication-ready diamond-on-insulator pathway towards modular unit
cells that natively bridge visible color centers to the infrared
spectrum for scalable quantum networks. We also present and analyze an
end-to-end framework for considering single-photon coupling efficiency
from a color center to a quantum network. This framework represents a
step forwards in analyzing and reducing system-scale losses in a
spin-photon interface.

= Introduction
<m_Intro>
In order to share computing power between distant quantum computers, a
quantum network, complete with quantum repeaters, is
necessary~@Azuma:2023@lu2019chip@wang2025large@li2025down. Many
promising platforms for a quantum repeater have photonic interfaces in
the visible spectrum, including trapped ions, neutral atoms, and color
centers in
diamond~@Ruf:2021@Covey2023@Ritter2012@Hoffman:2012@Stephenson:2020@Krutyanskiy:2023.
However, in order to achieve long-distance transport of an entangled
photon, light from any such platform requires Quantum Frequency
Conversion (QFC) into the telecom band, where optical fibers operate
with lower
loss~@Ruf:2021@Bock2018@Laneve2025@Strobel2025@singh2019quantum@huang2021hybrid@raghunathan2025telecom@li2016efficient.
Thus, the conversion between visible and infrared wavelengths is an
integral problem in the field of quantum networking. A node in a future
quantum network will also require large-scale integration of thousands
of qubits on one chip. Given the recent developments of high-speed
spatial light modulators (SLM) as a switch, multiplexing free-space
coupled qubits shows increasing promise to meet the needs of large-scale
qubit integration~@duan2021vertically@Peng:19@Panuski2022@Ding:2023.

We design a diamond ring resonator that uses broadband free-space
phase-matched four-wave mixing (FFWM) to fulfill these requirements for
the spin-photon interface between a color center and quantum network,
shown in Figure~@fig:Fig1, while keeping in mind fabrication
capabilities (See ~Sec.~@sm:fab). The nonlinear refractive index of
diamond is about $n_2 = 8.2 dot.op 10^(- 20)$ $m^2 W^(- 1)$ in the
infrared spectrum, and we utilize it in our design as an in-situ
solution to frequency conversion for color centers, which others have
proposed in prior works~@hausmann2014diamond. The ring resonator couples
to a single silicon nitride bus waveguide, depicted in
#link(<fig:Fig1>)[Figure 1(a)], and emits an infrared idler photon (1301 nm) into
free space, converted from a visible signal photon (615 nm) from an
emitter embedded in the diamond. Pump photons enter from the bus
waveguide. A back reflector breaks the symmetry of the emission scheme,
sending output idler photons in the $+ z$ direction. The device is
defined by its ring radius $r$, width $w$, thickness $t_(c a v)$, as
well as the gap $d_(r e f)$ between the bottom of the diamond and the
top of the back reflector. The idler photon generated out of the cavity
plane traverses the optical path length
$Lambda = n \( omega_(i d l) \) t_(c a v)$, where
$n \( omega_(i d l e r) \)$ is the refractive index of the diamond. The
polarization $P^(\( 3 \)) = chi^(\( 3 \)) E_(s i g) E_A E_B^(*)$ has a
uniform phase along $Lambda$. Thus, the phase accumulation of the idler
photon as it traverses $Lambda$ must be close to or less than $pi$, as
depicted in #link(<fig:Fig1>)[Figure 1(d)], to enable constructive interference
between the idler and the $P^(\( 3 \))$.

#figure(image("source/Figures/Fig1.png", width: 90.0%),
  caption: [
    (a) Light couples into a diamond resonator from a silicon nitride
    bus waveguide. The bus sits next to the ring, with a back reflector
    embedded in the oxide. The signal emits into the ring from a color
    center embedded in the diamond. Light converts to the infrared using
    the $chi^3$ nonlinearity in diamond, and emits into free space for
    collection into an objective lens that connects to an optical fiber.
    This forms a unit cell for many copies of the same device that can
    be addressed by an objective lens. (b) The energy conservation
    condition for QFC in Bragg scattering mode. (c) The phase matching
    condition in the plane of the cavity. (d) The phase matching
    condition in the free space direction, out of the plane of the
    cavity.
  ]
)
<fig:Fig1>

We define the efficiency of our system as the probability of success for
retrieving a single photon from the color center into a quantum network
upon the decay of the emitter from the excited state,
$ eta = eta_(s p a t i a l) eta_(i d l e r) \, $ where
$eta_(s p a t i a l)$ is the overlap of the electric field of the idler
photon in the far-field $E_(f f)$ with a Gaussian beam, and
$eta_(i d l e r)$ is the probability that a photon at the Zero-Phonon
line is retrieved from the emitter's decay and converted to the idler
mode.

= Phase Matching Condition
<m_PM>
By inducing $P^(\( 3 \))$ in our nonlinear medium that overlaps well
with the paraxial wave equation solutions, we can shape propagation into
the far-field at our target frequency $omega_(i d l)$. This stems from
the fact that far-field propagation of an unconfined near field mode
obeys the paraxial wave equation, and a mode without any momentum in the
plane of a ring resonator will be nearly unconfined~@Haus_2004. We
define the frequency phase matching (FPM) conditions by sorting the
involved waves into the sets $A_p$ and $A_o$, such that
$A_p = { s i g \, A \, B }$, $A_o = i d l$, representing whether the
mode is confined in the cavity plane or traveling out of plane,
respectively. Next, we constrain the phase-matching condition in Figure
#link(<fig:Fig1>)[Figure 1(c)] to require zero in-plane idler momentum,
$ Delta k_p = sum_(i in A_p) c_i n_(e f f \, i) p_i k_(0 \, i) = 0 \, $
where $k_(0 \, i)$ is the wave vector, $n_(e f f \, i)$ is the effective
index for the wave in the cavity, and $p_i in - 1 \, 1$ indicates the
direction of propagation. When $Delta k_p = 0$, the idler photon
constructively interferes in the far-field orthogonal to the plane of
the cavity. In a ring resonator, $Delta k_p = 0$ is analogous to
exciting the $m = 0$ azimuthal order mode with $P^(\( 3 \))$. Others
have used this mode before as a static electric field~@Lu2021. However,
we study its properties at non-zero frequencies. We consider the energy
conservation condition displayed in #link(<fig:Fig1>)[Figure 1(b)],
$ sum_(i in \( A_p union A_o \)) c_i omega_i = 0 \, $ where the
parameter $c in - 1 \, 1$ determines the sign of each mode in the FWM
interaction. We select
$c_(s i g) = 1 \, c_A = 1 \, c_B = - 1 \, c_(i d l) = - 1$. This Bragg
scattering scheme enables transfer of power from the signal to the idler
without vacuum field
amplification~@McKinstrie:05@heuck2019unidirectional. An emitter such as
the SnV center is placed in the diamond resonator, coupling to a
whispering gallery mode (WGM) with azimuthal number $m_(s i g)$ and
symmetric emission given by $p_(s i g) = plus.minus 1$. The pumps must
excite both the clockwise and counter-clockwise direction
$p_A = p_B = plus.minus 1$ of the WGM, with azimuthal mode numbers $m_A$
and $m_B$ to match the emitter symmetry. The resulting FPM equations are
$ 0 = omega_(s i g) + omega_A - omega_B \, $
$ 0 = m_(s i g) - m_A - m_B . $<pm_cond> Additional insight into
competing nonlinear interactions and noise processes is given
in~Sec.~@sm:noise. We solve for multiple idler wavelengths that satisfy
these equations, reporting the results in Figure @fig:Fig2. By fitting
the $n_(e f f)$ of a ring mode across a broad range of wavelengths we
can then find the discretized mode numbers
$m_i = n_(e f f) \/ \( r lambda_0 \)$, plotted in #link(<fig:Fig2>)[Figure 2(a)]. The
idler wavelength can be calculated from the set of pump modes that
fulfill Equation~@pm_cond, as shown in #link(<fig:Fig2>)[Figure 2(b)].

#figure(image("source/Figures/Fig2.png", width: 80.0%),
  caption: [
    \(a) The effective refractive index for discretized mode numbers of
    the ring resonator from mode solver data, plotted for multiple ring
    widths. (b) Output wavelengths that satisfy the in-plane phase
    matching condition in Equation~@pm_cond. (c) Polarization in the
    $hat(r)$ direction obtained from FDTD simulation. (d) The phase of
    the output polarization in the $hat(r)$ direction, confirming that
    the FPM condition $m_(i d l) = 0$ is fulfilled.
  ]
)
<fig:Fig2>

When conditions for Equation~@pm_cond are met, an in plane cross-section
of the $P^(\( 3 \))$ inside of the ring, shown in #link(<fig:Fig2>)[Figure 2(c-d)],
has high overlap with a radially polarized beam with azimuthal mode
number $m = 0$. This is a solution to the paraxial wave equation that
remains confined to a low numerical aperture~@Youngworth:00.

= Simulation and Spatial Efficiency
<m_Design>
We obtain the 3D profile of $P^(\( 3 \))$ from the electric field of 3
FDTD simulations for the signal and pump modes, described in further
detail in ~Sec.~@sm:RingProfiles. For simplicity, we exclude the bus
waveguide from the simulation of the signal and pumps, injecting
directly into the WGM. We define the idler mode of the FWM interaction
as equivalent to $P^(\( 3 \))$, which has a similar mode volume to the
signal and pump fields. To determine the far-field and quality factor of
the idler mode, we inject $P^(\( 3 \))$ into a final FDTD simulation as
a perturbative current source, measuring the fields inside the cavity as
well as its emission. The far-field of this mode, shown in
Figure~@fig:Fig3, can be focused by an objective lens. We calculate the
electric field at some distance $z_p^(-)$ from the focal plane of this
objective lens using the Debye-Wolf integral, with a numerical aperture
of 0.82, which captures 72% of the power in the far-field~@Sherif:08. We
sweep of $z_p$, apply the Jones matrix for an S-waveplate to the
electric field to retrieve the field at $z_p^(+)$, then fit the output
field to a Gaussian, resulting in a maximum spatial power overlap of 24%
at $z_p = 27.2$ μm~@BhargavaRam:17. Assuming 90% transmission through
the coated objective and S-waveplate, we find
$eta_(s p a t i a l) = 0.21$.

Determining the amount of constructive interference between
$P^(\( 3 \))$ and the idler photon enables us to calculate the power
required for efficient conversion from the signal to the idler. We
capture the behavior of this partially constructive interference,
assuming that the pump powers cancel the Kerr-induced phase modulation,
by calculating the quality factor of the idler mode in FDTD simulation
(see~Sec.~@sm:quality for further details). This device, with parameters
shared in Table~@tab:optparams, results in the intrinsic idler quality
factor $Q_(i d l)^(c a v) = 7.8$.

#figure(image("source/Figures/Fig3.png", width: 99.0%),
  caption: [
    The ring emits the idler into the far-field through FFWM. We
    calculate the transverse idler electric field profile after the
    objective using the Debye-Wolf integral at $z_p^(-)$, just before
    the S-waveplate. The idler field after S-waveplate transformation at
    $z_p^(+)$ can be collected with efficiency $eta_(s p a t i a l)$
    into the fiber lens. See~Sec.~@sm:Spatial for detailed field profile
    simulations.
  ]
)
<fig:Fig3>

#block[
#figure(
  align(center)[#table(
    columns: 5,
    align: (center,center,center,center,center,),
    table.header([Ring
      Parameters], [$r$], [$w$], [$t_(c a v)$], [$d_(r e f)$],),
    table.hline(),
    [\($mu m$)], [$6$], [$0.75$], [$0.55$], [$0.87$],
    [Resonant Modes], [Signal], [Pump A], [Pump B], [Idler],
    [m], [$143$], [$28$], [$115$], [$0$],
    [$lambda$ ($mu m$)], [$0.615$], [$2.095$], [$0.750$], [$1.301$],
  )]
  , caption: [Parameters and modes of the ring resonator]
  , kind: table
  ) <tab:optparams>

]
\

#block[
#figure(
  align(center)[#table(
    columns: 3,
    align: (center,center,center,),
    table.header([Idler Results], [$Q_(i d l)^(c a v)$], [$V_(c a v)$],),
    table.hline(),
    [], [$7.8$], [$7.3 dot.op 10^(- 19)$ $m^3$],
  )]
  , kind: table
  , numbering: none
  )

]
= Hamiltonian for Idler Efficiency
<m_Hamil>
To determine $eta_(i d l e r)$, we refer to the non-Hermitian effective
Hamiltonian for a FWM process,
$ H = H_(c h a n n e l) + H_(c a v i t y) + H_(c o u p l i n g) + H_(l o s s) \, $
where $H_(c h a n n e l)$ describes the propagating modes that couple in
to the cavity, $H_(c a v i t y)$ represents the interactions and modes
found in the cavity, $H_(c o u p l i n g)$ determines the coupling
between cavity and spatial channels, and $H_(l o s s)$ determines how
light dissipates from the emitter and the cavity
modes~@Vernon2015@Vernon2016. Relevant to the Hamiltonian are the
internal, external, and loaded quality factors of each mode
$Q_J^(i n t)$, $Q_J^(e x t)$, and
$Q_J = \( 1 \/ Q_J^(i n t) + 1 \/ Q_J^(e x t) \)^(- 1)$, as well as the
intrinsic quality factor of the cavity,
$Q_J^(c a v) = omega_J \/ \( 2 Gamma_J^(c a v) \)$, which is related to
the intrinsic cavity loss rate $Gamma_J^(c a v)$. We also consider the
bus coupling rate
$Gamma_J^(b u s) = \| gamma \|^2 \/ \( 2 v_J \) = alpha_J Gamma_J^(c a v)$
with waveguide coupling strength $gamma_J$ and group velocity
$v_J$~@Vernon2016. The parameter $alpha_J$ allows us to model the
waveguide coupling rate as a ratio of the intrinsic cavity loss, with
critical coupling at $alpha_J = 1$. For our evaluation, we select
$alpha_A = 1$, $alpha_B = 1$, and $alpha_(s i g) = 0$. These give rise
to the associated linear channel-cavity coupling rate
$Gamma_J = omega_J \/ \( 2 Q_J^(e x t) \)$ and the cavity loss rate
$M_J = omega_J \/ \( 2 Q_J^(i n t) \)$ for each frequency. We can use
these to calculate the total damping rate
$overline(Gamma)_J = Gamma_J + M_J$. For the pump modes,
$Gamma_J = Gamma_J^(b u s) = alpha_J Gamma_J^(c a v)$, and
$M_J = Gamma_J^(c a v)$, where $Q_J^(c a v)$ is the intrinsic radiative
loss of the cavity mode. Because we are designing around nonlinear
coupling, there is no desirable linear output channel from the cavity at
the signal frequency, thus $Gamma_(s i g) = 0$ and
$M_(s i g) = Gamma_(s i g)^(b u s) + Gamma_(s i g)^(c a v) = \( 1 + alpha_(s i g) \) Gamma_(s i g)^(c a v)$.
In contrast, intrinsic radiation from the idler mode represents the
successfully retrieved idler wave in the far-field. This rate is
$Gamma_(i d l) = Gamma_(i d l)^(c a v)$. The idler mode $m_(i d l) = 0$
is so weakly confined that $Gamma_(i d l)$ is much greater than any
other loss, so $M_(i d l) tilde.eq 0$. This effectively transfers losses
away from the idler mode by fully utilizing the radiation that is
normally considered a loss. All of the cavity coupling rates mentioned
above are summarized in~@tab:rates.

#block[
#figure(
  align(center)[#table(
    columns: 5,
    align: (center,center,center,center,center,),
    table.header([Cavity Mode (J)], [Signal (sig)], [Pump A (A)], [Pump
      B (B)], [Idler (idl)],),
    table.hline(),
    [$Gamma_J$ (Units of
    $Gamma_J^(c a v)$)], [0], [$alpha_A$], [$alpha_B$], [$1$],
    [$M_J$ (Units of
    $Gamma_J^(c a v)$)], [$\( 1 + alpha_(s i g) \)$], [$1$], [$1$], [$0$],
  )]
  , caption: [Relevant linear coupling rates to the system Hamiltonian.
  Note that when $alpha_A = alpha_B = 1$, the coupling rate equals the
  loss rate for the pumps, leading to critical coupling.]
  , kind: table
  ) <tab:rates>

]
We consider the pumps to be classical waves and drop their evolutionary
terms from the channel Hamiltonian, keeping only their effect on the
coupling between signal and idler. $Gamma_(s i g) = 0$, and
$Gamma_i d l$ belongs to the loss portion of the Hamiltonian, so
$ H_(c h a n n e l) = 0 . $ We drop terms for the cavity modes
$sum_J ℏ omega_J b_J^dagger b_J$, where $b_J \, b_J^dagger$ are the
annihilation and creation operators on the cavity resonances under the
rotating wave approximation. Thus, $ H_(c a v i t y) = H_(N L) \, $
where $H_(N L)$ is the nonlinear portion of the Hamiltonian that
controls the transfer between signal and idler. By assuming
$gamma in Re$, the classical amplitude of the pumps $a_A \, a_B$ in the
cavity given the input pump powers $P_A \, P_B$ follows the relation
$ a_J = - frac(i e^(i xi), omega_J) sqrt(frac(4 alpha_J P_J Q_J^(c a v), ℏ \( alpha_J + 1 \)^2)) \, $
where $xi$ is the constant phase associated with the pump. The nonlinear
Hamiltonian is given by the nonlinear coupling rate
$g_(n l) = Delta a_A a_B^(*)$ and
$ H_(N L) = - ℏ g_(n l) \[ b_(s i g) b_(i d l)^dagger + H . C . \] \, $
$ Delta = 2 ℏ overline(omega)^2 c n_2 \/ \( overline(n)^2 V_(c a v) \) \, $
$ overline(omega)^2 = sqrt(omega_(s i g) omega_A omega_B omega_(i d l)) \, $
$ overline(n)^2 = sqrt(n \( omega_(s i g) \) n \( omega_A \) n \( omega_B \) n \( omega_(i d l) \)) . $
where $b_J^dagger$ and $b_J$ are the creation and lowering operators for
the cavity modes, $Delta$ is the nonlinear coupling strength parameter,
$V_(c a v)$ is the mode volume of the cavity, $n \( omega \)$ is the
linear refractive index of the material, and $n_2$ is the nonlinear
refractive index of the material~@Vernon2016. The coupling portion of
the Hamiltonian only contains the emitter to cavity coupling term, given
the emitter's raising and lowering operators $sigma_(+)$ and
$sigma_(-)$:
$ H_(c o u p l i n g) = ℏ g_e \( b_(s i g)^dagger sigma_(-) + b_(s i g) sigma_(+) \) \, $
$ g_e = 1 / 2 sqrt(F_p M_(s i g) frac(2 pi r_(Z P L), tau_e)) \, $
$ F_p = frac(3, 4 pi) (frac(lambda_(s i g), n \( omega_(s i g) \)))^3 Q_(s i g)^(c a v) / V_(c a v) \, $
where $g_e$ is the emitter to cavity coupling rate, $F_p$ is the Purcell
enhancement of the signal mode, $tau_e$ is the bulk radiative emission
lifetime of the emitter. The ratio of Zero Phonon Line (ZPL) radiative
decay $r_(Z P L) = r_(D e b y e) dot.op r_(Q E)$ is given by
$r_(D e b y e)$, the Debye-Waller factor of the emitter, and $r_(Q E)$,
the quantum efficiency of the emitter due to non-radiative decay. This
ratio is a vital term in determining the absolute efficiency of
obtaining an entangled photon from the spin-photon
interface~@Brooks2021@Janitz:20. The quantum efficiency and Debye-Waller
factor for the SnV center are around 0.8 and 0.6 in bulk diamond,
respectively, leading to a bulk radiative factor of
$r_(Z P L) = 0.48$~@Ruf:2021@Iwasaki2017@Rosenthal2024. This is
relatively high compared to the SiV and NV centers, with radiative
factors of around $r_(Z P L) = 0.24 \, 0.04$, respectively, in bulk
diamond~@Redhu2025@Neu2011@Becker2017@Neu2012@Berthel2015. We choose to
design around the SnV center due to its high radiative factor, using
$r_(Z P L) = 0.48$ for our analysis. The emitter loss rate is then
$M_e = 2 pi \( 1 - r_(Z P L) \) \/ tau_e$. Putting together all sources
of out-coupling from the system gives the non-Hermitian portion of the
Hamiltonian,
$ H_(l o s s) = - i ℏ (M_(s i g) / 2 b_(s i g)^dagger b_(s i g) + Gamma_(i d l) / 2 b_(i d l)^dagger b_(i d l) + M_e / 2 sigma_(+) sigma_(-)) $
where we note that the accumulated radiative loss from the idler mode
divided by the total accumulated loss of the system equals
$eta_(i d l e r)$. The Hamiltonian can be represented by a coupled
amplitude equation with amplitudes
$upright(bold(c)) \( t \) = mat(delim: "(", c_e, c_(s i g), c_(i d l))^T$
for the emitter, signal, and idler populations, respectively. The system
$ upright(bold(c))' \( t \) = - A upright(bold(c \( t \))) \, $
$ A = mat(delim: "[", M_e \/ 2, i g_e, 0; i g_e, M_(s i g) \/ 2 + i Delta_(s i g), i g_(n l); 0, i g_(n l), Gamma_(i d l) \/ 2 + i Delta_(i d l)) $
is a linear constant-coefficient homogeneous system of ordinary
differential equations defined by the coefficient matrix $A$, where
$Delta_(s i g)$ and $Delta_(i d l)$ are the detunings of the signal and
idler frequencies from the resonance. This system has solutions given by
the eigenvectors
$V = mat(delim: "(", upright(bold(v))^(\( 1 \)), upright(bold(v))^(\( 2 \)), upright(bold(v))^(\( 3 \)))$
and corresponding eigenvalues $lambda_j$. The exact solution in time is
given by
$ upright(bold(c)) \( t \) = sum_(j = 1)^3 a_j e^(- lambda_j t) v^(\( j \)) \, $
where $upright(bold(a)) = V^(- 1) upright(bold(c)) \( 0 \)$. We
numerically solve for
$ eta_(i d l e r) = integral_0^oo Gamma_(i d l) \| c_(i d l) \( t \) \|^2 d t = Gamma_(i d l) sum_(j \, k = 1)^3 frac(a_j a_k^(*) v_3^(\( j \)) \( v_3^(\( k \)) \)^(*), lambda_j + lambda_k^(*)) \, $
$ beta = 1 - eta_(e m i t t e r) = 1 - M_e sum_(j \, k = 1)^3 frac(a_j a_k^(*) v_1^(\( j \)) \( v_1^(\( k \)) \)^(*), lambda_j + lambda_k^(*)) \, $
where the $beta$ factor represents the probability that a single decay
leads to radiative ZPL emission, in contrast to lossy decay from the
emitter $eta_(e m i t t e r)$. In bulk diamond, $beta = r_(Z P L)$, but
in a cavity, we find that both the quality factor and $g_(n l)$
(influenced by pump power) lead to a change in $beta$. We plot the
resulting $eta_(i d l e r)$ and $beta$ factor vs pump budget
$P_(b u d g e t) = 2 sqrt(P_A P_B)$, where the factor of 2 accounts for
injection of the pump from both bus waveguide ports, for selected
intrinsic quality factors
$overline(Q^(c a v)) = Q_(s i g)^(c a v) = Q_A^(c a v) = Q_B^(c a v)$ in
Figure~@fig:Fig4. We note that $eta_(i d l e r)$ eventually decreases as
more pump power is applied, shown in~#link(<fig:Fig4>)[Figure 4(a)]. This can be interpreted
as the reduction in the $beta$ factor of the emitter's coupling into the
cavity modes, which occurs when the effective quality factor of the
signal mode decreases due to high out-coupling from $g_(n l)$. The
decrease in $beta$ shows that lossy decay begins to dominate the
emitter's output, causing these devices to have a maximum efficiency
that is limited by the maximum absorption of light from the emitter into
the cavity. We refer to the maximum achievable $eta_(i d l e r)$ for a
chosen $overline(Q^(c a v))$ as the saturation point, and plot it
in~#link(<fig:Fig4>)[Figure 4(b)] for multiple values of $r_(z p l)$. This reveals the
relationship that smaller values of $r_(Z P L)$ lead not just to higher
required pump budget, but also to a lower maximum efficiency.

#figure(image("source/Figures/Fig4.png", width: 80.0%),
  caption: [
    \(a) $eta_(i d l e r)$ and $beta$ factor plotted as a function of
    pump budget and $overline(Q_(c a v))$ for $r_(Z P L) = 0.48$. (b)
    The maximum $eta_(i d l e r)$ possible at saturation and
    corresponding $beta$ factor, plotted for multiple values of
    $r_(Z P L)$, with a maximum pump budget of 10 kW. Note that
    $eta_(i d l e r)$ must be lower than the $beta$ factor,
    demonstrating the need for high quality factor devices.
  ]
)
<fig:Fig4>

= Discussion
<m_Discussion>
Using a pump budget of 15.2 W and assuming an overall cavity quality
factor of $overline(Q^(c a v)) = 10^5$ leads to a saturated efficiency
of $eta_(i d l e r) = 85.3 %$. Thus, with reasonable powers for pumped
lasers and attainable quality factor, the total efficiency of the system
can be up to $eta = 0.18$ directly from the color center to an optical
fiber at 1314 nm. In contrast, with fully radiative coupling
($r_(Z P L) = 1$), the same cavity model with
$overline(Q^(c a v)) = 10^5$ yields efficiencies of
$eta_(i d l e r) = 95.3 %$ and $eta = 0.21$ with a pump budget of 18.3
W. What is notable about this system is not that the modes are lossless
but rather that the losses are transferred away from the conversion of
the idler's mode by the careful selection of $Gamma_(i d l)$ such that
$M_(i d l) tilde.eq 0$. This design effectively utilizes the loss of the
idler mode as engineered coupling into the far-field, rather than
introducing a separate source of out-coupling. Using an SLM after the
S-wave-plate could change the output beam, which is polarized in
$hat(x)$, to overlap nearly perfectly with a Gaussian beam~@Forbes:16.
This could bring the spatial efficiency to the limit of the numerical
aperture collection and bulk optics transmission,
$eta_(s p a t i a l) = 0.73 dot.op 0.9 = 0.66$, leading to overall
efficiencies of $eta = 0.56$ for $r_(Z P L) = 0.48$, or $eta = 0.63$ for
$r_(Z P L) = 1$. An SLM could also steer the beam spatially or modify
the beam to a higher-order Gaussian mode for spatial or modal
multiplexing. Replacing the nonlinear out-coupling $g_(n l)$ with
waveguide coupling or other free space coupling techniques still leads
to a corresponding reduction in the $beta$ factor, as long as
$r_(Z P L) eq.not 1$. The saturation of the efficiency is similar to
previous results obtained for FWM when the signal source is a waveguide
instead of an emitter~@Vernon2016. Using the correct out-coupling is
important to optimizing the efficiency of collection from an emitter.
Nonlinear coupling provides a distinct advantage of tunability compared
to physically structured mode coupling: the optimal operating point for
$eta_(i d l e r)$ can be found by sweeping the power of the pumps to
obtain the best combination of $beta$ and $g_(n l)$. We provide
additional insight on the importance of the $beta$ factor in
Sec.~@sm:Weighing. Coupling to a lossy idler mode subsequently demands
higher pump powers to build up the idler field. While the pump powers
for high efficiency is limited by the quality factor of the resonator
modes, fabrication methods in diamond have the capability to achieve a
$Q = 10^5$, and quasi-static pulsed lasers have been shown to be
effective in delivering high instantaneous power while maintaining low
average
power~@Ding2024@flower2024observation@xu2025chip@mehrabad2025multi@mehrabad2025quantum,
leading us to believe that implementing this method is possible with
current technologies. A diamond ring integrated onto another platform
with a higher nonlinearity might reduce the power requirements, and
could even utilize methods such as bound-state-in-continuum
modes~@ye2025sum. We also note that our method has the highest
saturation efficiency when there is minimal coupling between the signal
mode in the cavity and the bus waveguide ($alpha_(s i g) = 0$). This can
be achieved using a two-point coupling scheme that destructively
interferes for the signal mode and couples well for the pump
modes~@Bo2017@Shoman:20. Given $Q_(i d l)^(c a v) = 7.8$ at 1310 nm, we
estimate the bandwidth for the idler cavity mode is 165 nm. However, the
output wavelengths that can be generated by a single ring are limited to
discretized solutions to the phase matching condition, as shown in
#link(<fig:Fig2>)[Figure 2(b)]. By allowing for higher-order azimuthal phase in the
idler mode number $m_(i d l)$, which would correspond to higher-order
Laguerre-Gaussian modes with radial polarization, the density of output
wavelengths could be increased. An SLM could correct this azimuthal
phase before passing through an S-wave plate. Further analysis into
these modes and their quality factor is necessary in order to enable
such a feature.

= Conclusion
<m_Conclusion>
We proposed a method for QFC that enables the collection of the idler
mode from a direction normal to the propagation of the signal and pump
waves. When applied to quantum networking, this method could be used to
create contained unit cells for a qubit that interfaces directly with
the infrared, reducing overall losses and increasing the scalability of
color center qubits. Future work may be to experimentally validate the
FFWM unit cell, quantifying added noise and single-photon purity under
pulsed pumping, and extend the scheme to other material stacks such as
quantum dots in lithium niobate circuits~@wang2025large. Our co-designed
spatio-spectral interface can enable compact, fabrication-ready building
blocks for scalable telecom-band quantum networking architectures,
beyond the limitation of narrow-band and bulky fiber
platforms~@amorim2025spatial. We also presented an end-to-end analysis
of the factors determining the efficiency of the spin-photon interface
in a FFWM scheme, and found pump powers for which the $beta$ factor and
conversion to the idler mode lead to an optimal $eta_(i d l e r)$. By
considering the non-radiative emission of the color center, we provide a
more accurate model for the performance of color centers that
demonstrates the impact of the quality factor and Purcell enhancement on
spatio-spectral conversion. Continued system-level efficiency analysis
of such integrated nonlinear photonic circuits~@wu2025bidirectional can
pave the way forward to the improvement and realization of highly
efficient spin-photon interfaces.

= Acknowledgements
<acknowledgements>
The authors wish to acknowledge fruitful discussions with Kartik
Srinivasan and Ian Christian, as well as Sofia Patomaki, Yuqin Sophia
Duan, Thomas Propson and Hamza Raniwala. This material is based upon
work supported by the National Science Foundation Graduate Research
Fellowship under Grant No. 2141064.

= Competing interests
<competing-interests>
The authors declare no competing interests.

= Data and materials availability
<data-and-materials-availability>
All of the data that support the findings of this study are reported in
the main text and Supplementary Materials. Source data are available
from the corresponding authors on reasonable request.

#pagebreak()
#counter(figure.where(kind: image)).update(0)
#set heading(numbering: "S1.1")
#show figure.where(kind: image): set figure(numbering: "S1")
#heading(level: 1, numbering: none, outlined: false)[Supplementary Materials for \
Broadband Spatio-Spectral Mode Conversion via Four-Wave Mixing]
<supplementary-materials-for-broadband-spatio-spectral-mode-conversion-via-four-wave-mixing>
#heading(level: 1, numbering: none, outlined: false)[Table of Contents]
<table-of-contents>

#line(length: 100%)

S1. #link(<sm:fab>)[Fabrication Considerations]

S2. #link(<sm:noise>)[Competing Nonlinear Processes]

S3. #link(<sm:RingProfiles>)[Ring Mode Profiles]

S4. #link(<sm:quality>)[Low Quality Factor Estimation]

S5. #link(<sm:Spatial>)[Spatial Mode Propagation]

S6. #link(<sm:Weighing>)[Weighing the importance of the $beta$ factor in the Total Loss]

#counter(heading).update(0)
= Fabrication Considerations
<sm:fab>
Microdisks have been fabricated with quality factors of up to
$10^5$~@Mitchell2019. Ring resonators could be fabricated by providing
inner supports that connect to a central pillar, as depicted in
Supplementary Figure~@fig:SupFig1. An undercut frees the outer ring,
while remaining attached to the substrate via the central pillar. The
crossing location between the supports and the ring can be optimized to
reduce losses. Transferring this to a photonic chip with a waveguide
could be performed with similar pick-and-place capabilities that already
exist for diamond chiplets~@Zhu2022@Starling2023@Pholsen:25.

#figure(image("source/Figures/SupFig1.png", width: 30.0%),
  caption: [
    A potential fabrication scheme, displayed as a positive mask in
    diamond.
  ]
)
<fig:SupFig1>

= Competing Nonlinear Processes
<sm:noise>
We note that the conditions given by
$ 0 = omega_(s i g) + omega_A - omega_B \, $
$ 0 = m_(s i g) + m_A - m_B $ also exists due to the symmetric injection
of pumps; however, by phase matching according to the first set of FPM
equations, this secondary condition is automatically phase-matched, and
will be negligible compared to the main FFWM process.

We also note two spontaneous four-wave mixing processes that could
pollute the signal channel. In the first, two 750 nm photons are
destroyed and create one 619 nm and and 950 nm photon. In the second
noise process that fulfills energy conservation, one 750 nm and one 2100
nm photon is destroyed to create one 619 nm and one 5150 nm photon. The
950 nm and 5150 nm will likely not be resonant in the cavity. Assuming
this, these noise processes are in a similar situation to the main FFWM
process: 3 resonant modes, and an off resonant idler. However, the 950
nm photon has a phase mismatch that leads to a coherence length of
around 17 um. The circumference of the ring is twice as large, which
should suppress this noise even further relative to the main FFWM
process. The nonlinear coupling strength also scales with frequency,
meaning that the 5150 nm process will be significantly weaker than the
main process. Using a pulsed laser with a pulse width that matches the
lifetime of the emitter can help to reduce the amount of time in which a
signal photon could be accidentally created.

Noise processes are unlikely to pollute the idler channel. Any idler
photon generated will have high momentum in the cavity plane, leading to
heavily reduced overlap with the gaussian mode at the fiber, which must
be reached by exiting the cavity plane.

= Ring Mode Profiles
<sm:RingProfiles>
We obtain the electric field for the signal and pumps from FDTD
simulation using Tidy3d. We use two passes to obtain the field: the
first to extract resonances and quality factors, and the second to store
a high density 3D grid of the electric field in the ring, shown in
Figure~@fig:SupFig2. Then we calculate the idler mode from the
$P^(\( 3 \))$ these fields generate.

#figure(image("source/Figures/SupFig2.png", width: 60.0%),
  caption: [
    The real part of the radial component of the electric field, plotted
    for the signal, pump A, and pump B modes, respectively.
  ]
)
<fig:SupFig2>

= Low Quality Factor Estimation
<sm:quality>
Because the idler mode decays much faster than the duration of a source
pulse, we cannot measure the quality factor using traditional FDTD
methods that fit the decay of the resonance after the source finishes
emitting. However, because $P^(\( 3 \))$ completely decays by the end of
a short simulation, we use the definition of quality factor given
by~@Haus_2004 $ Q = frac(omega U, P_d) \, $ where $U$ is the stored
energy in the mode (measured by projecting a field monitor covering the
mode volume onto the idler mode field), and $P_d$ is the power
dissipated from the mode (measured as all flux out of the simulation).

= Spatial Mode Propagation
<sm:Spatial>
#figure(image("source/Figures/SupFig3.png", width: 50.0%),
  caption: [
    Spatial mode matching of the idler. (a) Far-field of the idler mode.
    (b) Transverse idler electric field profile calculated from
    Debye-Wolf integral, just before the S-waveplate. (c) Idler field
    $E_x \( z_p^(+) \)$ after S-waveplate transformation, next to its
    fitted Gaussian profile $E_(x \, g a u s s)$.
  ]
)
<fig:SupFig3>

Here we provide further depth on the stages of transformation used to
compute the spatial overlap with a Gaussian beam, as depicted in
Supplementary Figure~@fig:SupFig3. After obtaining the far-field in
#link(<fig:SupFig3>)[Figure S3(a)], we apply the Debye-Wolf integral~@Sherif:08
$ upright(bold(E)) \( x_p \, y_p \, z_p \) = - thin frac(i k_(0 \, i d l), 2 pi) integral.double_Theta frac(upright(bold(a)) \( s_x \, s_y \), s_z) thin exp #h(-1em) #scale(x: 180%, y: 180%)[\[] i k #scale(x: 120%, y: 120%)[\(] s_x x_p + s_y y_p + s_z z_p #scale(x: 120%, y: 120%)[\)] #scale(x: 180%, y: 180%)[\]] thin d s_x thin d s_y \, $
integrating over unit ray vector $upright(bold(s))$ the ray strengths
$upright(bold(a)) \( s_x \, s_y \)$, resulting in the field in
#link(<fig:SupFig3>)[Figure S3(b)]. We sweep values of $z_p$ near the focal plane,
recording the electric field in the $x y$ plane, then apply the Jones
matrix transformation for an S-waveplate~@BhargavaRam:17,
$ upright(bold(E_(o u t))) \( rho \, phi.alt \, z_p \) = mat(delim: "[", cos #h(-1em) phi.alt, sin #h(-1em) phi.alt; sin #h(-1em) phi.alt, - cos #h(-1em) phi.alt) upright(bold(E)) \( rho \, phi.alt \, z_p \)^T $
This results in an electric field that is nearly completely polarized in
$E_x$. We plot this next to a Gaussian beam with waist size
$w_0 = 4.6$~$mu$m and a waist offset from the focal plane
$Delta z_p = - 5$~$mu$m in #link(<fig:SupFig3>)[Figure S3(c)], resulting in the final
power overlap of 24%.

= Weighing the importance of the Emitter Loss in the Total Loss
<sm:Weighing>
Here, we provide further depth to the effect of $r_(r a d)$ on the
efficiency limitations of emitters. We plot the ratio of emitter loss to
total loss $frac(1 - beta, 1 - eta)$ at saturation in Supplementary
Figure~@fig:SupFig4, assuming a SLM is used to achieve
$eta_(s p a t i a l) = 0.66$. It is clear that the imperfect $beta$
factor dominates the loss of this system for low quality factors, and
only as the quality factor increases do the losses from
$eta_(s p a t i a l)$ begin to dominate. This illustrates the continued
need for improvements to the Purcell enhancement in fabrication, as
emitter losses become an even more dominant source of loss.

#figure(image("source/Figures/SupFig4.png", width: 40.0%),
  caption: [
    The ratio of emitter loss to total loss, plotted for several values
    of $r_(Z P L)$
  ]
)
<fig:SupFig4>

#bibliography("source/Main.bib", style: "ieee", title: [References])
