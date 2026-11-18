// Typst format conversion of arXiv:2512.12566v1 under CC BY 4.0.
#set page(paper: "a4", margin: 21mm, numbering: "1")
#set text(font: "Libertinus Serif", size: 11pt)
#set par(justify: true)
#set math.equation(numbering: "(1)")
#align(center)[
  #text(size: 16pt, weight: "bold")[Calibrated Plane–Convex Microcavity for Room-Temperature Polaritons with Geometric $g$-Scaling]
  #v(4pt)
  Ling-Qi Huang, Shih-Chung Chen, Chia-Hao Lin, Li-Tzu Wang, Khemendra Shukla,
  Kai-Peng Hsieh, Leng-Hsien Huang, Tsung-Sheng Kao#super[\*], Hyeyoung Ahn#super[\*],
  and Tzu-Ling Chen#super[\*]

  Department of Photonics, College of Electrical and Computer Engineering,
  National Yang Ming Chiao Tung University, Hsinchu, 30010, Taiwan

  Correspondence: #link("mailto:tlc@nycu.edu.tw")
]
#heading(numbering: none)[Abstract]
We present a plane--convex open microcavity that enables
room-temperature polariton spectroscopy with a simple geometric handle
on the coupling rate. The effective length $L_(upright(e f f))$ is
absolutely calibrated from the free-spectral range, and piezo tuning is
performed at near-normal incidence
($k_parallel #h(-1em) approx #h(-1em) 0$) to avoid angle-induced
degradation. Using spin-coated PEA$""_2$PbI$""_4$ quasi-2D perovskites,
we observe clear anti-crossings in reflection, with vacuum Rabi
splittings up to $79 med upright(m e V)$ (reflection) and
$84 med upright(m e V)$ (PL) near
$L_(upright(e f f)) #h(-1em) approx #h(-1em) 3.4 med mu upright(m)$. A
linewidth-corrected analysis converts the apparent splitting into the
coherent exciton-photon coupling rate $g$, revealing a robust geometric
scaling $g prop L_(upright(e f f))^(- 1 \/ 2)$ across multiple
longitudinal orders and spatial sites, consistent with the filled-mode
thin-film limit where transverse area cancels in the mode volume. The
platform establishes a compact, broadly compatible testbed for
room-temperature polaritons and provides a practical design rule:
shortening $L_(upright(e f f))$ is a reliable, geometric lever to
strengthen collective coupling in plane--convex microcavities.

Strong light--matter coupling in optical microcavities hybridizes cavity
photons and excitons into upper/lower polaritons with a resolvable Rabi
splitting, enabling room-temperature condensation, nonlinear optics, and
integrated polaritonic functions
@lidzey1999room@kasprzak2006bose@gu2021enhanced@chikkaraddy2016single,
and motivating emerging studies of cavity-QED--mediated chemical
reactivity @thomas2019tilting@hsu2025chemistry. Achieving large, clearly
resolved splittings at ambient conditions requires maximizing the
coherent exciton-photon coupling rate $g$ while controlling dissipation.
Two-dimensional and layered semiconductors are ideal emitters thanks to
their large oscillator strengths and robust excitons
@lidzey1998strong@wang2016coherent.

Within a coupled-oscillator description, the near--zero-detuning
splitting satisfies $ℏ Omega tilde.eq 2 g$ when cavity and exciton
dephasing rates are small $\( kappa \, gamma_e lt.double g \)$ and
comparable @savona1995quantum@sanchez2022theoretical. Thus, enlarging
the vacuum Rabi splitting amounts to increasing $g$. The coupling rate
scales inversely with the square root of the effective electromagnetic
mode volume ($V_(upright(e f f))$),
$ g #h(0em) prop #h(0em) 1 / sqrt(V_(upright(e f f))) \, #h(2em) V_(upright(e f f)) #h(0em) prop #h(0em) pi w_0^2 L_(upright(e f f)) . $
For a plane--concave cavity, the fundamental Gaussian mode follows ABCD
optics with a well-defined waist ($w_0$); at the plane mirror
$w_0^2 = lambda / pi sqrt(L_(upright(e f f)) #h(-1em) (R - L_(upright(e f f))))$.
In the common limit $L_(upright(e f f)) #h(-1em) lt.double #h(-1em) R$
(concave mirror ROC), this gives $w_0^2 prop sqrt(L_(upright(e f f)))$.
By contrast, in near-instability geometries such as plane--plane or
plane--convex, no closed-form stable Gaussian eigenmode (and hence no
unique $V_(upright(e f f))$) exists. The dependence
$g \( L_(upright(e f f)) \)$ must be established empirically.

Reducing the cavity volume, most effectively by shortening
$L_(upright(e f f))$ while keeping $w_0$ stable, is therefore the
primary lever for stronger coupling. Fixed-length DBR stacks and
monolithic Fabry--Pérot (FP) resonators have demonstrated efficient
light-matter coupling
@hirai2023molecular@timur2020mechanisms@chen20242d@liu2015strong, but
they offer limited in situ control and cumbersome sample exchange.
Angle-resolved tuning can also degrade finesse at large incidence
angles. Open-access microcavities overcome these constraints by varying
the physical length with piezo actuators while preserving free-space
access
@li2019tunable@flatten2016room@hirai2024optical@konrad2015controlling.
However, broadly applicable procedures that keep finesse high during
tuning, provide traceable, absolute calibration of the effective optical
length $L_(upright(e f f))$, and enable quantitative comparisons across
materials and varies cavity longitudinal mode number remain scarce.

Here we realize a finesse-preserving, open-access #emph[plane--convex]
microcavity that provides continuous length tuning down to
$L_(upright(e f f)) #h(-1em) approx #h(-1em) 1.2 med mu upright(m)$
(DBR-limited), absolutely calibrated via the Free-Spectral Range (FSR),
while maintaining $k_parallel #h(-1em) approx #h(-1em) 0$ throughout the
sweep. Using spin-coated PEA$""_2$PbI$""_4$ quasi-2D perovskites, we
observe clear room-temperature anti-crossings and a vacuum Rabi
splitting of $79 med upright(m e V)$ (reflection) at
$L_(upright(e f f)) #h(-1em) approx #h(-1em) 3.4 med mu upright(m)$.
Measurements across multiple longitudinal orders reveal a simple
geometric scaling, $g prop L_(upright(e f f))^(- 1 \/ 2)$, consistent
with a filled-mode thin-film picture in which the lateral dipole number
cancels the transverse mode area.

#figure(image("source/setup6.svg", width: 90.0%),
  caption: [
    #strong[Experimental setup and plane--convex microcavity.]
    #strong[\(a)] Cross-section of the cavity: a SiO$""_2$-terminated
    DBR on a borosilicate coverslip hosts the sample; the opposing
    mirror is a TiO$""_2$-terminated DBR on a convex substrate bonded to
    a ring PZT for axial actuation. (Bottom inset) transfer-matrix field
    profile showing an antinode at the planar DBR surface. #strong[\(b)]
    Opto-mechanical assembly providing independent lateral (XY)
    translation and tip--tilt control for both mirrors, with the ring
    PZT setting $L_(upright(e f f))$. #strong[\(c)] Optical layout for
    white-light reflectance and PL spectroscopy, assisted by a 650 nm
    alignment beam. A $20 times$ objective lens mode-matches the input
    beam to the cavity, while a spectrometer and camera record spectra
    and images, respectively.
  ]
)
<fig:setup_mechanics>

The plane--convex open-access micro-cavity in
Fig.~@fig:setup_mechanics#strong[\(a)] comprises a 0.17~mm borosilicate
coverslip (planar mirror) and a convex mirror (1/2\" diameter, radius of
curvature 51.5~mm), both coated with high-reflectivity DBRs fabricated
at the HOPE Laboratory, Photonics Research Center, National Tsing Hua
University. Each mirror employs 7.5-pair SiO$""_2$/TiO$""_2$
quarter-wave pairs, yielding a reflectivity of $95 plus.minus 0.7 %$
across the wavelength range of 520--650~nm and defining a tunable air
gap $L_(upright(g a p))$. The planar DBR is terminated with a low-index
SiO$""_2$ layer to maximize the electric field at the sample position
and enhance light--matter coupling, while the opposing covex mirror is
terminated with a TiO$""_2$ layer.

The cavity resonance is set by the longitudinal condition,
$ m thin lambda_c / 2 #h(0em) = #h(0em) n_(upright(e f f)) thin L_(upright(e f f)) \, $<eq:res_condition>
where $m in bb(Z)$ is the longitudinal mode index. The index $m$ fixes
the standing-wave order, and therefore the axial pattern of nodes and
antinodes of the intracavity field. This directly governs exciton--field
overlap: positioning a thin emitter at an antinode (and matching its
thickness to the field period) maximizes dipole--mode coupling, whereas
off-antinode placement reduces the effective interaction
@ebbesen2016hybrid. As shown in Fig.~@fig:setup_mechanics#strong[\(a)]
(bottom), the simulated axial field profile peaks at the planar mirror,
where the active layer is located.

Figure~@fig:setup_mechanics#strong[\(b)] shows the mechanical design of
the microcavity, where the convex DBR mirror was mount on a two-axis
adjustable holder (POLARIS-K05S1, $plus.minus$5$""^compose$ angular
range, 11~mrad/rev), which provide the primary angular control required
for preserving mirror parallelism and ensure optimized cavity alignment.
Coarse cavity-length adjustment was achieved using an one-axis
translation stage with a 3~mm traveling range, following by fine tuning
with a piezoelectric actuator. For precise spatial positioning of the
sample, the planar DBR (sample side) was mounted on a two-adjuster tilt
mount combined with a two-axis translation stage for lateral alignment.

The overall optical layout is shown in
Fig.~@fig:setup_mechanics#strong[\(c)], a broadband tungsten--halogen
lamp (SLS201L, Thorlabs) serves as the white-light source for
reflectance spectroscopy (probing the optical states), whereas a 405~nm
externally modulated pulses laser (pulse width $approx$
177~$mu upright("s")$, repetition rate $approx$ 692~Hz) serves as the
excitation source for photoluminescence (PL), probing the excited-state
population. To achieve optimal mode matching and minimize the spot size
on the sample (white-light spot $approx$ 15~$mu upright("m")$, 405~nm
excitation laser spot $approx$ 5~$mu upright("m")$), a 20$times$
objective lens was used for focusing.

#figure(image("source/alignment2.svg"),
  caption: [
    #strong[Alignment workflow.] #strong[\(a)] Concept: co-monitor
    white-light reflection and 650 nm transmission while adjusting
    tip--tilt and axial position of the convex lens. #strong[\(b)]
    Camera frames at three lateral sites (A, B, C) with the cavity
    length tuned to three distinct values. The Newton-ring radius varies
    with the local gap, and 650 nm transmission appears only at
    resonance. The corresponding co-recorded spectra at A, B, and C are
    shown in #strong[\(c)], where the longitudinal modes appear as
    reflection dips. At resonance a narrow 650 nm transmission peak is
    observed.
  ]
)
<fig:alignment_procedure>

The signal reflected from the micro-cavity on the sample side is
directed to a beam splitter, where it is divided into two paths: one
directed to a high-resolution spectrometer (Andor Kymera 328i
spectrograph; spectral resolution $approx$ 0.31--0.44~nm) via a
fiber-coupled setup for spectral acquisition. During a single PZT scan,
each spectrum was acquired with an exposure time of 200~ms.

#figure(image("source/cavity-spectrum5.svg", width: 75.0%),
  caption: [
    #strong[Plano--convex microcavity and FSR calibration.]
    #strong[\(a)] Bare-cavity reflection spectra at several PZT
    voltages; dip spacings yield the FSR. #strong[\(b)] FSR (black) and
    derived $L_(upright(e f f))$ (blue) vs.~PZT bias, demonstrating
    continuous tuning down to $tilde.op$1.2~$mu upright(m)$.
  ]
)
<fig:plano_convex_fsr>

To optimize light--cavity coupling and minimize the cavity length, we
combine white-light reflection with 650~nm transmission imaging to
center the beam on the convex mirror apex
\[Fig.~@fig:alignment_procedure\]. The 650~nm beam produces transmitted
Newton's rings that provide tip--tilt feedback, locate the minimum-gap
region, and verify mirror parallelism. When the mirrors approach, a
clear interference pattern appears on the camera
\[Fig.~@fig:alignment_procedure#strong[\(b)]\], with co-recorded
reflection spectra shown in
\[Fig.~@fig:alignment_procedure#strong[\(c)]\]. Fine tilt adjustments
align the ring center with the detection area, yielding the strongest,
most stable cavity resonance.

Figure~@fig:plano_convex_fsr#strong[\(a)] shows bare-cavity reflection
spectra acquired at different PZT voltages. From these spectra we
extract the FSR and use it to derive the effective cavity length
$L_(upright(e f f))$. At normal incidence the frequency-domain FSR is
$ upright(F S R)_nu = frac(c, 2 thin n_(upright(e f f)) thin L_(upright(e f f))) \, $<eq:fsr_freq>
with $c$ the speed of light and
$n_(upright(e f f)) #h(-1em) approx #h(-1em) 1$ for an air-gap cavity.
Equivalently, near a central wavelength $lambda_c$,
$upright(F S R)_lambda #h(-1em) approx #h(-1em) lambda_c^2 \/ \( 2 thin n_(upright(e f f)) thin L_(upright(e f f)) \)$.
The shortest attainable length in the empty cavity is
$L_(upright(e f f)) #h(-1em) approx #h(-1em) 1.2 med mu upright("m")$,
inferred from the largest measured wavelength-domain FSR of
$tilde.op #h(-1em) 140 med upright("nm")$
\[Fig.~@fig:plano_convex_fsr #strong[\(b)]\]. This is primarily limited
by the DBR penetration depths on the two mirrors; for the terminating
layers we estimate
$L_(upright(p e n)) #h(-1em) approx #h(-1em) 0.15 med mu upright("m")$
(TiO$""_2$) and $approx #h(-1em) 0.55 med mu upright("m")$ (SiO$""_2$)
@koks2021microcavity. Once $L_(upright(e f f)) \( V_(upright(P Z T)) \)$
is determined, the nearest longitudinal mode index $m$ is assigned via
#link(<eq:res_condition>)[\[eq:res\_condition\]].

The PEA$""_2$PbI$""_4$ films on the planar DBR exhibit a pronounced
excitonic absorption at
$lambda_(upright(a b s)) #h(-1em) approx #h(-1em) 520$~nm and resonant
photoluminescence at
$lambda_(upright(P L)) #h(-1em) approx #h(-1em) 524$~nm
\[Fig.~@fig:rabi#strong[\(a)]\]. The narrow spectral features are
consistent with strong excitonic confinement characteristic of quasi-2D
perovskites (here, nominal $n = 1$). The perovskite precursor was
prepared by dissolving 51.9~mg PEAI and 48.1~mg PbI$""_2$ in
1000~$mu upright("L")$ DMF, followed by stirring at $65 med^compose$C
for 30~min. During stirring, DBR substrates were treated by UV--ozone
for 30~min to remove residual organics and increase surface
hydrophilicity. A 50~$mu upright("L")$ aliquot of the precursor was
dispensed onto the DBR and spin-coated at 6000~rpm for 20~s, then
annealed at $100 med^compose$C for 1~min.

#figure(image("source/PEA-splitting7.svg", width: 100.0%),
  caption: [
    #strong[Energy-resolved reflectivity of the tunable microcavity.]
    #strong[\(a)] PEA$""_2$PbI$""_4$ film on a planar DBR: excitonic
    absorption ($tilde.op$520 nm) and resonant PL ($tilde.op$524 nm).
    #strong[\(b)] Stacked reflection spectra while $L_(upright(e f f))$
    is scanned. A bare-cavity resonance in the non-absorbing region
    keeps a constant linewidth, indicating finesse is preserved during
    PZT tuning. Near $E_x$, the resonance splits into UP/LP.
    #strong[\(c)] Reflection-intensity map versus wavelength and
    $L_(upright(e f f))$ with fitted UP/LP (blue) and coupled-oscillator
    branches (purple). The minimum splitting at (near) zero detuning is
    $ℏ Omega_R approx 71$ meV.
  ]
)
<fig:rabi>

Sweeping the cavity length with the PZT tunes the bare-cavity mode
$E_c = h c \/ lambda_c$ through the exciton energy $E_x$, yielding a
clear anti-crossing in reflection \[Fig.~@fig:rabi#strong[\(b,c)]\] and
PL \[Fig. S1\]. Upper- and lower-polariton (UP/LP) peak centers are
obtained by Lorentzian fits (fitting uncertainty $< #h(-1em) 5 %$) and
compared with the coupled-oscillator eigenvalues
@canales2023polaritonic:
$ E_plus.minus = frac(E_c + E_x, 2) #h(0em) plus.minus #h(0em) 1 / 2 sqrt(Delta^2 + 4 g^2) \, #h(2em) Delta equiv E_c - E_x . $<eq:co_eigs>
At (near) zero detuning ($Delta approx 0$), the fitted normal-mode
separation gives $ℏ Omega_R approx 71 med upright(m e V)$ (site~A in
Fig.~@fig:g-length).

To incorporate finite linewidths, we convert the apparent splitting into
a coupling rate via
$ g #h(0em) = #h(0em) sqrt((frac(ℏ Omega_R, 2))^2 + (frac(kappa - gamma, 4))^2) \, $<eq:g_from_split>
where the dephasing rates $kappa$ and $gamma$ are measured using the
HWHM energy linewidths of the bare cavity mode and exciton,
respectively. The exciton linewidth $gamma$ is taken from single-pass
absorption/PL of the perovskite film, and the cavity linewidth $kappa$
from the bare-cavity reflection dip. Across our datasets, we find
$gamma approx 26 #h(-1em) - #h(-1em) 36 med upright(m e V)$ and
$kappa approx 7 #h(-1em) - #h(-1em) 11 med upright(m e V)$.

Figure~@fig:g-length#strong[\(a)] plots the linewidth-corrected $g$
versus the longitudinal order $m$, with colors indicating distinct
measurement sites on the same film. The mode index $m$ is assigned from
the calibrated bare-cavity FSR and decreases consecutively as the cavity
is scanned in length (details in Fig.~S2). Coupling strengths extracted
at three representative sites (from both reflection- and PL-derived
splittings) collapse onto a single geometric law,
$ g #h(0em) prop #h(0em) L_(upright(e f f))^(- 1 \/ 2) \, $ as shown in
Fig.~@fig:g-length#strong[\(a)]. This scaling follows the filled--mode
thin--film picture: when the perovskite laterally covers the optical
mode, $N #h(-1em) prop #h(-1em) pi w_0^2 t$ while
$V_(upright(m o d e)) #h(-1em) prop #h(-1em) pi w_0^2 L_(upright(e f f))$\;
the transverse area cancels, giving
$g prop sqrt(t \/ L_(upright(e f f)))$. The large mirror radius in our
plane--convex geometry keeps $w_0$ nearly constant over the tuning
range, enhancing this scaling.

#figure(image("source/g-versus-length.svg"),
  caption: [
    #strong[Splitting and coupling vs.~cavity length.] #strong[\(a)]
    Coupling rate $g$ from Eq.~(@eq:g_from_split)
    vs.~$L_(upright(e f f))$ for reflection (circles) and PL
    (triangles). Dashed curves are $L_(upright(e f f))^(- 1 \/ 2)$ fits.
    #strong[\(b)] Reflection-derived Rabi splittings vs.~longitudinal
    order $m$. The solid line is a fit using the Savona analytic model
    with
    $g \( L_(upright(e f f)) \) prop L_(upright(e f f))^(- 1 \/ 2)$.
    Inset: FDTD simulated thickness dependence of the vacuum Rabi
    splitting at fixed cavity order.
  ]
)
<fig:g-length>

Using the empirical
$g \( L_(upright(e f f)) \) prop L_(upright(e f f))^(- 1 \/ 2)$, we fit
the measured reflection splittings versus $m$ with the Savona analytic
expression for the observable zero-detuning splitting \[Eq.~(19) in
Ref.~@savona1995quantum. See Sec.~S4 of the SI for details\]. The solid
curve in Fig.~@fig:g-length\(b) captures the overall trend and
site-to-site spread. The site-to-site variation on a single sample is
attributed to film-thickness nonuniformity. Three-dimensional
finite-difference time-domain (FDTD) simulations quantify the
sensitivity of the Rabi splitting to the perovskite thickness and
reproduce the observed scatter across sites. The measured thickness
varies from ($tilde.op 135 #h(-1em) - #h(-1em) 160$~nm), and Fig.~S3
shows that, over this range, the splitting depends approximately
linearly on thickness..

In conclusion, we have realized a finesse-preserving, open-access
plane--convex microcavity with FSR-calibrated length control down to
$L_(upright(e f f)) #h(-1em) approx #h(-1em) 1.2 med mu upright(m)$,
providing a compact platform for quantitative polariton studies. Using
spin-coated PEA$""_2$PbI$""_4$ at room temperature, we observed clear
anti-crossings in reflection/PL and extracted vacuum Rabi splittings up
to $79$~meV (reflection) and $84$~meV (PL) near
$L_(upright(e f f)) #h(-1em) approx #h(-1em) 3.4 med mu upright(m)$.
After correcting for finite linewidths, the coupling rate follows a
simple geometric law, $g prop L_(upright(e f f))^(- 1 \/ 2)$, across
multiple longitudinal orders and spatial sites.

Even in the absence of a closed‐form Gaussian mode and a unique
$V_(upright(e f f))$ for plane--convex geometries, the measured
$g \( L_(upright(e f f)) \)$ establishes a practical and portable rule:
shortening $L_(upright(e f f))$ reliably strengthens the collective
coupling ($g prop L_(upright(e f f))^(- 1 \/ 2)$). This provides a clear
design guideline for open plane--convex microcavities.

Because the platform separates length tuning from angular dispersion,
supports rapid sample exchange, and enables traceable comparisons
between reflection and PL, it constitutes a versatile testbed for
room‐temperature polaritons. The approach is readily extendable to other
thin‐film emitters, time‐resolved measurements, electrically assisted
tuning, and device‐oriented polaritonic architectures.

#block[
This work was supported by the National Science and Technology Council
(NSTC), Taiwan, under grants NSTC 113-2628-M-A49-002, and by the
Ministry of Education (Taiwan) through the Yushan Young Scholar Program.
H.-Y.~A. acknowledges support from NSTC 113-2112-M-A49-021-MY3.
T.-S.~Kao acknowledges support from NSTC 113-2221-E-A49-053. L.-Q. Huang
thanks the support from NSTC Graduate Research Fellowship (NSTC-GRF).

T.-L.~Chen thanks Prof.~Jhih-Sheng Wu for valuable discussions. The
authors declare no conflict of interest.

Data underlying the results presented in this paper are not publicly
available at this time but can be obtained from the authors upon
reasonable request.

]

#bibliography("references.bib", style: "ieee")
