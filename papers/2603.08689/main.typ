// Adapted from Das et al., arXiv:2603.08689v1 (CC BY 4.0).
// https://arxiv.org/abs/2603.08689v1 | https://creativecommons.org/licenses/by/4.0/
#set math.equation(numbering: "(1)")
#let horizontalrule = line(start: (25%,0%), end: (75%,0%))

#show terms: it => {
  it.children
    .map(child => [
      #strong[#child.term]
      #block(inset: (left: 1.5em, top: -0.4em))[#child.description]
      ])
    .join()
}

#set table(
  inset: 6pt,
  stroke: none
)

#show figure.where(
  kind: table
): set figure.caption(position: top)

#show figure.where(
  kind: image
): set figure.caption(position: bottom)

#let content-to-string(content) = {
  if content.has("text") {
    content.text
  } else if content.has("children") {
    content.children.map(content-to-string).join("")
  } else if content.has("body") {
    content-to-string(content.body)
  } else if content == [ ] {
    " "
  }
}
#let conf(
  title: none,
  subtitle: none,
  authors: (),
  keywords: (),
  date: none,
  abstract-title: none,
  abstract: none,
  thanks: none,
  cols: 1,
  margin: (x: 1.25in, y: 1.25in),
  paper: "us-letter",
  lang: "en",
  region: "US",
  font: none,
  fontsize: 11pt,
  mathfont: none,
  codefont: none,
  linestretch: 1,
  sectionnumbering: "1.1",
  linkcolor: none,
  citecolor: none,
  filecolor: none,
  pagenumbering: "1",
  doc,
) = {
  set document(
    title: title,
    keywords: keywords,
  )
  set document(
      author: authors.map(author => content-to-string(author.name)).join(", ", last: " & "),
  ) if authors != none and authors != ()
  set page(
    paper: paper,
    margin: margin,
    numbering: pagenumbering,
    columns: cols
  )

  set par(
    justify: true,
    leading: linestretch * 0.65em
  )
  set text(lang: lang,
           region: region,
           size: fontsize)

  set text(font: font) if font != none
  show math.equation: set text(font: mathfont) if mathfont != none
  show raw: set text(font: codefont) if codefont != none

  set heading(numbering: sectionnumbering)

  show link: set text(fill: rgb(content-to-string(linkcolor))) if linkcolor != none
  show ref: set text(fill: rgb(content-to-string(citecolor))) if citecolor != none
  show link: this => {
    if filecolor != none and type(this.dest) == label {
      text(this, fill: rgb(content-to-string(filecolor)))
    } else {
      text(this)
    }
  }

  block(below: 1em, width: 100%)[
    #if title != none {
      align(center, block[
          #text(weight: "bold", size: 1.5em)[#title #if thanks != none {
              footnote(thanks, numbering: "*")
              counter(footnote).update(n => n - 1)
            }]
          #(
            if subtitle != none {
              parbreak()
              text(weight: "bold", size: 1.25em)[#subtitle]
            }
           )])
    }

    #if authors != none and authors != [] {
      let count = authors.len()
      let ncols = calc.min(count, 3)
      grid(
        columns: (1fr,) * ncols,
        row-gutter: 1.5em,
        ..authors.map(author => align(center)[
          #author.name \
          #author.affiliation \
          #author.email
        ])
      )
    }

    #if date != none {
      align(center)[#block(inset: 1em)[
          #date
        ]]
    }

    #if abstract != none {
      block(inset: 2em)[
        #text(weight: "semibold")[#abstract-title] #h(1em) #abstract
      ]
    }
  ]

  doc
}
#show: doc => conf(
  title: [Nonlinear Mode Coupling in Silicon Nitride Membrane
Resonators],
  authors: (
    ( name: [Soumya Kanti Das$""^(*)$],
      affiliation: [Physics, IISER Bhopal],
      email: "" ),
    ( name: [Nishta Arora$""^(* thin dagger)$],
      affiliation: [Centre for Nano Science and Engineering, IISc Bengaluru],
      email: "" ),
    ( name: [Hridhay A S],
      affiliation: [Physics, IISER Bhopal],
      email: "" ),
    ( name: [Akshay Naik],
      affiliation: [Centre for Nano Science and Engineering, IISc Bengaluru],
      email: "" ),
    ( name: [Chandan Samanta$""^dagger.double$],
      affiliation: [Physics, IISER Bhopal],
      email: "" ),
    ),
  abstract-title: [Abstract],
  abstract: [#strong[Nonlinear interactions between vibrational modes
play a crucial role in understanding the dynamical response of
nanomechanical resonators. Here, we report the experimental observation
and theoretical modeling of nonlinear mode coupling in a high-stress
square silicon nitride membrane resonator. We quantify frequency shifts
of the fundamental mode arising from tension-mediated geometric
nonlinearity by increasing the amplitude of the fundamental mode and
higher-order flexural modes. A quantitative theoretical framework based
on Kirchhoff--Love plate theory is developed, which incorporates both
intrinsic Duffing nonlinearity and nonlinear intermodal coupling and
shows good agreement with experimental measurements for the (1,1)-(2,1)
and (1,1)-(2,2) mode pairs. We further compute the nonlinear coupling
matrix across mode families, revealing the role of mode symmetry and
spatial overlap in governing intermodal interactions. These results
establish nonlinear mode coupling as a controllable resource for
multimode frequency tuning and mechanical transduction.]

],
  pagenumbering: "1",
  cols: 1,
  doc,
)


Mechanical resonators@bachtold2022mesoscopic@xu2022nanomechanical play
an important role in both fundamental research and emerging
technologies. Their exceptional sensitivity to external stimuli
underpins advances across a wide range of research areas, including
force sensing@mamin2001sub@gavartin2012hybrid@de2018ultrasensitive, mass
spectrometry@naik2009towards@dominguez2018neutral,
magnetometry@forstner2012cavity@rossi2019magnetic@vsivskins2020magnetic@yousuf2025mechanical,
accelerometers@krause2012high@bawden2025precision, pressure
sensors@reinhardt2024self@green2025accurate@chen2022nano, magnetic
resonance imaging@poggio2010force@degen2009nanoscale@grob2019magnetic,
and scanning probe microscopy@de2017universal@rossi2017vectorial. Beyond
sensing, mechanical resonators are widely used in communications and
signal
processing@mahboob2011interconnect@romero2024acoustically@zhang2025few.
They serve as key interfaces in hybrid quantum
systems@kurizki2015quantum@clerk2020hybrid, coupling mechanical motion
to optical@barzanjeh2022optomechanics@chu2020perspective,
electrical@naik2006cooling@urgell2020cooling, and
spin@rugar2004single@thomas2021entanglement@fedele2025coupling degrees
of freedom. These capabilities establish mechanical resonators as a
unifying platform bridging classical and quantum
physics@teufel2011sideband@wollack2022quantum@samanta2023nonlinear@yang2024mechanical,
combining technological relevance with fundamental
discovery@campbell2021searching@manley2024microscale.

Among various classes of mechanical resonators, high-stress silicon
nitride ($S i_3 N_4$) membranes have emerged as a leading platform.
Their resonance frequencies, quality factor, and mechanical mode shapes
can be precisely engineered through device geometry and boundary
conditions. Their exceptionally high quality
factors@tsaturyan2017ultracoherent@yuan2015silicon@chakram2014dissipation@ji2021methods@engelsen2024ultrahigh@xi2025soft
and compatibility with chip-scale integration make these resonators well
suited for precision sensing and for probing mechanical dynamics at room
and cryogenic temperatures@purdy2012cavity@gisler2022soft. As a result,
these resonators are playing an increasingly important role in exploring
light-matter interaction@thompson2008strong@purdy2013observation, ground
state cooling@rossi2018measurement, entanglement@chen2020entanglement,
optomechanical squeezing@purdy2013strong, optical-to-microwave photon
transducers@andrews2014bidirectional, quantum memory@kristensen2024long,
gravitational-wave detection@gely2021superconducting, dark matter
detector@manley2021searching, and advanced precision
sensing@mason2019continuous.

Most studies of $upright(S i_3 N_4)$ membrane resonators have focused on
single, isolated vibrational modes
@fink2016quantum@snell2022heat@yang2019spatial, whereas practical
membranes support a dense spectrum of mechanical resonances whose
interactions can strongly influence device dynamics and performance. At
sufficiently large oscillation amplitudes, mechanical resonators enter
into a nonlinear regime governed by tension-induced geometric
nonlinearity, enabling nonlinear modal coupling that gives rise to
amplitude-dependent frequency tuning, energy exchange between orthogonal
modes, and dynamic control of the mechanical
response@asadi2018nonlinear. These effects enable multimode
functionalities including hybridized
resonances@mestre2025network@prasad2019gate, enhanced energy
transfer@li2025cascade@arora2022qualitative, bandwidth broadening
@arora2024mixed, and tunable dissipation pathways
@guttinger2017energy@kecskekler2021tuning@prasad2023tunable. Despite
their importance, nonlinear modal interactions in square
$upright(S i_3 N_4)$ membranes remain largely unexplored, even though
they are crucial for advanced sensing, signal processing, and hybrid
classical--quantum transduction architectures.

In this work, we present an experimental and theoretical study of
nonlinear intra- and intermodal coupling in a high-stress square
$upright(S i_3 N_4)$ membrane resonator. By driving multiple flexural
modes into the nonlinear regime, we observe amplitude-dependent
frequency shifts arising from both intramodal (intrinsic Duffing
nonlinearity) and intermodal coupling. We develop a simple yet
quantitative theoretical framework based on Kirchhoff--Love plate theory
that accurately captures these effects. Through a systematic mapping of
coupling strengths across mode families, we compute the coupling matrix
between the fundamental and higher-order modes, revealing the role of
modal overlap in governing nonlinear interactions. Furthermore, we
compute the selective frequency tuning of a target mode via the
excitation of orthogonal modes, establishing nonlinear mode coupling as
a powerful resource for engineering multimode functionality in
high-stress $upright(S i_3 N_4)$ membrane resonators.

#figure(image("Figures/figure1_V6.png", width: 100.0%),
  caption: [
    Measurement setup and vibrational modes of the device. (a) Schematic
    of the laser Doppler vibrometry (LDV) based measurement setup. A
    Polytec MSA-500 system is used to optically probe the out-of-plane
    motion of $upright(S i_3 N_4)$ membrane, while electrical actuation
    and signal detection are performed using a Zurich instruments HF2LI
    lock-in amplifier. (b) Optical micrograph of the device, showing a
    $500 thin mu upright(m) times 500 thin mu upright(m) med upright(S i_3 N_4)$
    membrane suspended over a silicon substrate. (c) Measured
    displacement amplitude spectrum with drive frequency showing
    multiple mechanical resonances. Higher frequency modes are scaled by
    a factor of $times 5$ and $times 25$ for visibility. Inset shows the
    corresponding spatial mode shapes of the resonant modes.
  ]
)
#label("fig:Figure 1")

The experiments are performed on a suspended silicon nitride square
membrane from Norcada with side length $\( L \)$ of 500 $mu$m and a
thickness $\( h \)$ of 100 nm clamped to a 500 $mu$m thick silicon
substrate. The $S i_3 N_4$/Si substrate is mounted on a piezoelectric
actuator that enables out-of-plane excitation via an applied AC voltage
$V \( t \) = V_0 cos \( omega t \)$. The frequency-amplitude response of
the membrane is measured optically using a laser Doppler vibrometer
(Polytec MSA 500). All measurements were performed under high vacuum at
a base pressure of $2 times 10^(- 5) thin upright(m b a r)$ to minimize
air damping. Figure #ref(label("fig:Figure 1"))\(a) shows a schematic of
the experimental setup, in which a lock-in amplifier (Zurich Instruments
HF2LI) is used to simultaneously actuate and detect the mechanical
motion of the membrane. An optical micrograph of the membrane and the
measured mode spectrum between 700 and 1700 kHz are presented in
Figs.~#ref(label("fig:Figure 1"))\(b) and
#ref(label("fig:Figure 1"))\(c), respectively. Three vibrational modes
are observed within this frequency range; the inset shows the measured
spatial mode shapes, with modes labeled $\( n \, m \)$ according to the
number of anti-nodes along the two in-plane directions of the membrane.

We first characterize the out-of-plane vibrational modes at low drive
amplitudes, where both intramodal and intermodal coupling are
negligible. Figure #ref(label("fig:figure 2"))\(b) shows the linear
frequency response of the $\( 1 \, 1 \)$ mode, while the responses of
the $\( 2 \, 1 \)$ and $\( 2 \, 2 \)$ modes are presented in Fig. S4. In
this regime, all modes exhibit Lorentzian line shapes. The measured
resonance frequencies of the $\( 1 \, 1 \)$, $\( 2 \, 1 \)$, and
$\( 2 \, 2 \)$ modes are 814 kHz, 1286 kHz, and 1628 kHz, with
corresponding quality factors of $5.2 times 10^4$, $12.5 times 10^4$,
and $11.3 times 10^4$, respectively.
Figure~#ref(label("fig:figure 2"))\(a) displays the nonlinear frequency
response of the $\( 1 \, 1 \)$ mode, measured at increasing drive
amplitudes, arising from intrinsic Duffing nonlinearity.

We describe the membrane dynamics within the framework of
Kirchhoff--Love plate theory@leissa1969vibration. The transverse
displacement $w \( x \, y \, t \)$ satisfies
$ D nabla^4 w \( x \, y \, t \) & - (N_(x x) frac(partial^2 w, partial x^2) + 2 N_(x y) frac(partial^2 w, partial x partial y) + N_(y y) frac(partial^2 w, partial y^2))\
 & quad + rho h frac(partial^2 w, partial t^2) = 0 \, $<1> where $D$ is
the flexural rigidity, $N_(x x) \, N_(x y) \, N_(y y)$ are the in-plane
stress resultants, $rho$ is the mass density of the membrane and $h$ is
the thickness. Within the high stressed thin membrane
approximation@vogl2006nonlinear the in-plane stress components can be
expressed as
$ N_(x x) & = E h (epsilon.alt_0 + 1 / 2 (frac(partial w, partial x))^2) \,\
N_(y y) & = E h (epsilon.alt_0 + 1 / 2 (frac(partial w, partial y))^2) \,\
N_(x y) & = 1 / 2 E h (frac(partial w, partial x) frac(partial w, partial y)) \, $<2>
where $E$ is the Young's modulus, and $epsilon.alt_0$ is the built-in
tensile strain of the membrane. The transverse displacement is expressed
as $w \( x \, y \, t \) = phi.alt \( x \, y \) thin z \( t \)$, where
$phi.alt \( x \, y \) = sin #h(-1em) (frac(n pi x, L)) sin #h(-1em) (frac(m pi y, L))$
is the spatial mode shape and $z \( t \)$ is the corresponding out of
plane displacement. Substituting the mode expansion into Eq.
#link(<1>)[\[1\]] and applying the Galerkin discretizations procedure,
followed by the inclusion of linear damping ($nu$) and external driving
force ($f_d thin c o s \( omega_d t \)$), yields the Duffing equation of
motion
$ dot.double(z) thin + omega_(n m)^2 z thin + nu dot(z) thin + alpha_(n m) z^3 thin = f_d thin c o s \( omega_d t \) \, $<3>
The expressions for the linear resonance frequency $omega_(n m)$ and the
Duffing coefficient $alpha_(n m)$ for a general mode $\( n \, m \)$ are
given by
$ omega_(n m)^2 & = frac(E epsilon.alt_0 pi^2 \( n^2 + m^2 \), rho L^2) \, $<4>
$ alpha_(n m) & = frac(3 E, 32 rho) (pi / L)^4 [n^4 + m^4 - 2 / 3 n^2 m^2] . $<5>

#figure(image("Figures/Figure2_v4.svg", width: 100.0%),
  caption: [
    Intramodal coupling and Duffing constant. (a) Nonlinear frequency
    response of the $\( 1 \, 1 \)$ mode, measured at increasing drive
    strengths. (b) Linear response of the $\( 1 \, 1 \)$ mode at the
    lowest drive amplitude; solid lines indicate Lorentzian fits used to
    extract the resonance frequency and quality factor. (c)
    Amplitude-dependent frequency shift corresponding to the maximum
    displacement amplitudes extracted from (a). Solid line show fit
    using Eq. (@6) to extract the Duffing coefficient. (d) Comparison of
    the experimentally extracted Duffing coefficients with theoretical
    values calculated from Eq. (@5) for the $\( 1 \, 1 \)$,
    $\( 2 \, 1 \)$, and $\( 2 \, 2 \)$ modes.
  ]
)
#label("fig:figure 2")

We use the measured resonance frequency of the fundamental
$\( 1 \, 1 \)$ mode to extract the built-in tensile strain
$epsilon.alt_0 = 3.7 times 10^(- 3)$ from Eq. (@4). This value is
subsequently used to estimate the theoretical resonance frequencies of
higher-order modes, shown by the dashed lines in Fig.
#ref(label("fig:Figure 1"))\(c), which are in good agreement with the
experimentally observed higher mode frequencies. Solving Eq.
#link(<3>)[\[3\]] using the method of multiple scales yields an
amplitude-dependent nonlinear pulling of the resonance frequency,
$ omega_(n m)^(p e a k) = omega_(n m) thin + thin frac(3 alpha_(n m), 8 omega_(n m)) \( z^(p e a k) \)^2 \, $<6>
where $z^(p e a k)$ denotes the maximum displacement amplitude of the
$\( n \, m \)$ mode. The measured values of $z^(p e a k)$ is plotted as
a function of the shift in peak frequency
$\( omega_(n m)^(p e a k) - omega_(n m) \)$ for the $\( 1 \, 1 \)$ mode
in Fig. #ref(label("fig:figure 2"))\(c). The data is fitted using Eq.
(@6), with Duffing constant as the sole free parameter. The experimental
Duffing coefficients for the $\( 1 \, 1 \)$, $\( 2 \, 1 \)$, and
$\( 2 \, 2 \)$ modes are extracted and found to be $2 times 10^22$
$m^(- 2) s^(- 2)$, $2.5 times 10^23$ $m^(- 2) s^(- 2)$, and
$4.7 times 10^23$ $m^(- 2) s^(- 2)$, respectively. Figure
#ref(label("fig:figure 2"))\(d) shows good agreement between the
experimentally obtained Duffing coefficients and the theoretical values
calculated from Eq. (@5). The corresponding analysis for the
$\( 2 \, 1 \)$ and $\( 2 \, 2 \)$ modes are presented in Fig.~S4 of the
Supplementary Material.

#figure(image("Figures/Figure3_v3.svg", width: 100.0%),
  caption: [
    Nonlinear intermodal coupling. (a,c) Resonance frequency-shifting
    phenomena of the fundamental $\( 1 \, 1 \)$ mode induced by strong
    excitation of the $\( 2 \, 2 \)$ and $\( 2 \, 1 \)$ modes,
    respectively.(b,d) Extracted resonance frequency of the
    $\( 1 \, 1 \)$ mode as a function of the displacement amplitude of
    the driven $\( 2 \, 2 \)$ and $\( 2 \, 1 \)$ modes, respectively.
    Solid lines represent fits to the data using Eq. (@9) to extract the
    nonlinear intermodal coupling constants. (e) Comparison of
    experimentally extracted coupling constants (stars) with theoretical
    values (circles) calculated from Eq. S40.
  ]
)
#label("fig:figure 3")

When a higher order mode is driven into the nonlinear regime, its large
amplitude oscillation modifies the tensile stress of the membrane. This
displacement-dependent tension acts as an effective parametric
perturbation for other modes, leading to nonlinear intermodal coupling.
As a result the resonance frequency of the fundamental mode becomes
dependent on the oscillation amplitude of the driven higher-order mode.
To experimentally probe this effect, we strongly drive the
$\( 2 \, 1 \)$ and $\( 2 \, 2 \)$ modes near their resonance frequencies
while simultaneously monitoring the response of the fundamental
$\( 1 \, 1 \)$ mode using a weak probe tone. Figures
#ref(label("fig:figure 3"))\(a) and #ref(label("fig:figure 3"))\(c) show
color plots of the fundamental-mode response as a function of probe
frequency and drive frequency applied to the higher-order modes. A clear
amplitude-dependent frequency shift of the $\( 1 \, 1 \)$ mode is
observed, indicative of nonlinear frequency pulling due to intermodal
coupling. The localized enhancement in spectral amplitude of the
fundamental mode observed near a drive frequency
$tilde.op 1628 med upright(k H z)$ in Fig.
#ref(label("fig:figure 3"))\(a) arises from a subharmonic component of
the drive signal. This feature is absent in Fig.
#ref(label("fig:figure 3"))\(c), where such harmonic components are not
resonant with the fundamental mode.

In order to theoretically evaluate the intermodal coupling constant, we
modify the in-plane stress component as
$ N_(x x) & = E h [epsilon.alt_0 thin + thin 1 / 2 {(frac(partial w_1, partial x))^2 thin + thin (frac(partial w_2, partial x))^2}] \,\
N_(y y) & = E h [epsilon.alt_0 thin + thin 1 / 2 {(frac(partial w_1, partial y))^2 thin + thin (frac(partial w_2, partial y))^2}] \,\
N_(x y) & = 1 / 2 E h [(frac(partial w_1, partial x) frac(partial w_1, partial y)) thin + thin (frac(partial w_2, partial x) frac(partial w_2, partial y))] \, $<7>
where
$w_1 = s i n \( frac(n pi x, L) \) thin s i n \( frac(m pi y, L) \) thin z_1 \( t \)$
and
$w_2 = s i n \( frac(p pi x, L) \) thin s i n \( frac(q pi y, L) \) thin z_2 \( t \)$
represent the transverse displacements of the probing and driving modes,
respectively. Substituting the mode shapes into the governing plate
equation and applying the Galerkin discretization procedure, followed by
the inclusion of linear damping ($nu_1$) and external probing force
($f_p thin c o s \( omega_p t \)$) terms, yields the probe mode equation
of motion as
$ dot.double(z_1) & + omega_(n m)^2 z_1 + nu_1 dot(z_1) + alpha_(n m) z_1^3 + lambda_(n m)^(p q) z_1 z_2^2 = f_p thin c o s \( omega_p t \) \, $<8>
where $lambda_(n m)^(p q)$ represents the coupling constant between the
driving mode $\( p \, q \)$ and the probing mode $\( n \, m \)$.
Applying the method of multiple scales to Eq. (@8), we obtain the
effective resonance frequency of the fundamental mode arising from
intermodal coupling as
$ omega = omega_(n m) + frac(3 alpha_(n m), 8 omega_(n m)) \( z_1^(p e a k) \)^2 + frac(lambda_(n m)^(p q), 2 omega_(n m)) z_2^2 \, $<9>
where $z_2$ is the amplitude of the driven higher order mode. The
experimentally measured frequency shifts are shown in Figs.
#ref(label("fig:figure 3"))\(b) and #ref(label("fig:figure 3"))\(d). The
data are fitted using Eq. (@9), with $lambda_(n m)^(p q)$ as the sole
fitting parameter. From these fits, we extract the intermodal coupling
constants for the $\( 1 \, 1 \)$--$\( 2 \, 1 \)$ and
$\( 1 \, 1 \)$--$\( 2 \, 2 \)$ mode pairs, yielding values of
$5.3 times 10^22$ $m^(- 2) s^(- 2)$and $9.2 times 10^22$
$m^(- 2) s^(- 2)$, respectively. As shown in Fig.
#ref(label("fig:figure 3"))\(e), the extracted coupling constants are in
good agreement with the theoretical predictions obtained from Eq. S40.
At very high drive amplitudes, the model breaks down due to the onset of
higher-order nonlinearities in the driven mode, which modify the
standard Duffing response@arora2024mixed@samanta2018tuning.

Using the Kirchhoff-Love plate theory, we further compute the nonlinear
coupling constants between the fundamental mode and higher-order modes
using Eq. S40.

#figure(image("Figures/Figure4_v3.svg", width: 100.0%),
  caption: [
    Theoretical estimation of the nonlinear mode coupling matrix. (a--d)
    Calculated coupling constants as a function of the driven mode
    indices $\( p \, q \)$ for $p \, q = 1$--$10$, coupled to the probe
    modes $\( 1 \, 1 \)$, $\( 2 \, 2 \)$, $\( 3 \, 3 \)$, and
    $\( 4 \, 4 \)$, respectively. (e) Predicted frequency shift of the
    fundamental mode as a function of the coupled-mode amplitude,
    calculated using the theoretical coupling constants listed in Table
    #ref(label("tab:Table 1")).
  ]
)
#label("fig:Figure 4")

We first consider the probe mode with $n = m$.
Figure~#ref(label("fig:Figure 4"))\(a--d) shows the variation of the
coupling constant as the driven mode indices $\( p \, q \)$ are varied
from 1 to 10, while the probe modes are fixed at $\( 1 \, 1 \)$,
$\( 2 \, 2 \)$, $\( 3 \, 3 \)$, and $\( 4 \, 4 \)$, respectively. For
driven modes with $p \, q eq.not n$, the coupling constant
$lambda_(n m)^(p q)$ increases monotonically with increasing $p$ or $q$
when the other index is held fixed. In the special case $p = n$ or
$q = m$, $lambda_(n m)^(p q)$ exhibits a sharp increase with increasing
$p$ or $q$, respectively, due to enhanced mode overlap. When
$n = m = p = q$, $lambda_(n m)^(p q)$ reduces to intramodal coupling and
equals the Duffing constant of the mode. For probe modes with
$n eq.not m$, the symmetry is broken (see Supplementary Fig.~S1). In
this case, $lambda_(n m)^(p q)$ exhibits a sharp increase when either
$p = n$ or $q = m$. When $n < m$, the coupling constant
$lambda_(n m)^(p q)$ is larger for $p = n$ than for $q = m$. Conversely,
when $m < n$, $lambda_(n m)^(p q)$ is larger for $q = m$ than for
$p = n$. When $p = n$ and $q = m$ then $lambda_(n m)^(p q)$ again
reduces to the intramodal coupling constant. The calculated coupling
parameters for mode indices $p \, q = 1$--$4$, shown in Fig.
#ref(label("fig:Figure 4"))\(a), are listed in Table
#ref(label("tab:Table 1")). The coupling matrix exhibits clear symmetry
with respect to the mode indices and reveals a systematic increase in
coupling strength for higher-order modes, as discussed above. Using the
coupling parameters in Table #ref(label("tab:Table 1")), we predict the
frequency shift of the fundamental mode as a function of the
coupled-mode amplitude, as shown in Fig.
#ref(label("fig:Figure 4"))\(e). These results highlight nonlinear
intermodal coupling as an effective mechanism for frequency control.

#block[
#block[
#figure(
  align(center)[#table(
    columns: 5,
    align: (center,center,center,center,center,),
    table.header([], [$q = 1$], [$q = 2$], [$q = 3$], [$q = 4$],),
    table.hline(),
    [$p = 1$], [0.17], [1.12], [2.41], [4.22],
    [$p = 2$], [1.12], [1.38], [2.24], [3.44],
    [$p = 3$], [2.41], [2.24], [3.09], [4.30],
    [$p = 4$], [4.22], [3.44], [4.30], [5.51],
  )]
  , caption: [This table shows the value of coupling constant per unit
  modal mass for different modes with mode number (p,q), which is
  coupled to (1,1) mode. All the values here are of the order
  $10^23$ $m^(- 2) s^(- 2)$. The intramode coupling constant (Duffing
  constant) is highlighted in blue.]
  , kind: table
  ) #label("tab:Table 1")
]
]
In conclusion, we experimentally demonstrate and quantitatively model
nonlinear intra- and intermodal coupling in a high-stress silicon
nitride membrane resonator arising from tension induced geometric
nonlinearity. By independently driving selected flexural modes into the
nonlinear regime, we directly measure amplitude-dependent frequency
shifts originating from intrinsic Duffing nonlinearity as well as from
nonlinear coupling between orthogonal modes. Using a Kirchhoff--Love
plate theory framework, we derived expressions for the Duffing and
intermodal coupling coefficients and showed quantitative agreement with
experimental measurements for multiple mode pairs, including the
(1,1)-(2,1) and (1,1)-(2,2) interactions. Beyond individual mode pairs,
we computed the full nonlinear coupling matrix across mode families,
explicitly demonstrating how mode symmetry and spatial overlap determine
the magnitude and selectivity of intermodal interactions. These results
establish nonlinear mode coupling in $S i_3 N_4$ membranes as a
predictable and controllable mechanism for frequency tuning and
multimode transduction. The presented framework provides a direct route
to engineering mechanical responses in membrane resonators, with
immediate implications for multimode sensing, mechanically mediated
signal processing, and hybrid opto- and electro-mechanical systems where
controlled mode interactions are
essential@nielsen2017multimode@mestre2025network@meng2022measurement@zhao2025quantum.

#block[
#block[
$""^(*)$

] <equal>
These authors contributed equally to this work. \
$""^dagger$<corrA> Corresponding author: nishta\@iisc.ac.in \
$""^dagger.double$<corrB> Corresponding author: csamanta\@iiserb.ac.in

]
#strong[Acknowledgments]

A.N. acknowledges funding support from MHRD, MeitY and DST Nano Mission
through NNetRA. N.A. acknowledges fellowship support under Visvesvaraya
Ph.D. Scheme, Ministry of Electronics and Information Technology
(MeitY), India. C.S. acknowledges financial support from the Anusandhan
National Research Foundation (ANRF), India, under Project
No.~ANRF/ECRG/2024/006637/PMS.

#strong[Competing Interests]

The authors declare no competing interests.

#bibliography("References.bib", style: "ieee")
