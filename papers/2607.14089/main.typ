// Adapted from Hyatt et al., arXiv:2607.14089v1 (CC BY 4.0).
// https://arxiv.org/abs/2607.14089v1 | https://creativecommons.org/licenses/by/4.0/
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
  sectionnumbering: none,
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
  title: [Sail membranes for optomechanical accelerometry],
  authors: (
    ( name: [A. D. Hyatt],
      affiliation: [Wyant College of Optical Sciences, University of Arizona, Tucson, AZ 85721, USA],
      email: "" ),
    ( name: [M. Dey Chowdhury],
      affiliation: [Wyant College of Optical Sciences, University of Arizona, Tucson, AZ 85721, USA],
      email: "" ),
    ( name: [M. Chowdhury],
      affiliation: [Mechanical, Automotive and Materials Engineering, University of Windsor, Windsor, ON N9B 3P4, Canada],
      email: "" ),
    ( name: [M. J. Ahamed],
      affiliation: [Mechanical, Automotive and Materials Engineering, University of Windsor, Windsor, ON N9B 3P4, Canada],
      email: "" ),
    ( name: [D. J. Wilson],
      affiliation: [Wyant College of Optical Sciences, University of Arizona, Tucson, AZ 85721, USA],
      email: "" ),
    ),
  date: [2026-11-19],
  abstract-title: [Abstract],
  abstract: [Strained membrane resonators have emerged as a promising
platform for optomechanical accelerometry; however, the desired
combination of low frequency and high $Q$-mass product requires a
rethinking of their dissipation dilution engineering. Applying Bayesian
optimization to a Si$""_3$N$""_4$ membrane, we discover a class of
sail-like trampoline resonators in which the frequency is decreased by
an order of magnitude while preserving the $Q$-mass product. We
demonstrate centimeter-scale sails with kHz frequencies,
$Q tilde.op 10^7$ and $Q times upright(m a s s) tilde.op$ 10 g.
Vertically integrating a 7 kHz device with a nanoribbon, we realize a
monolithic cavity optomechanical accelerometer with a room temperature
thermal noise of $40 #h(0em) upright(n) g_0 \/ sqrt(upright(H z))$,
sufficient to resolve $mu g_0 \/ sqrt(upright(H z))$ ambient vibration
over a bandwidth of 4 kHz with a displacement imprecision of
$10^(- 14) #h(0em) upright(m) \/ sqrt(upright(H z))$. Cryogenic arrays
of sail membranes may be attractive for new physics searches and
distributed quantum sensing experiments.

],
  pagenumbering: "1",
  cols: 1,
  doc,
)


Strained membranes have emerged as a key resonator platform for
optomechanical force sensing and quantum experiments \[1\], featuring
small mass $m$, high $Q$-frequency ($f$) product, large surface area,
and compatibility with micropatterning \[2, 3\] and photonic integration
\[4, 5\]. Over the last decade, a diversity of trampoline, fractal,
phononic crystal, and ribbon-like membranes have been studied \[6\], now
routinely achieving $Q > 10^8$, $Q times f > 10^13$ Hz and thermal force
sensitivities of
$S_F^(upright(t h)) = 8 pi k_B T f m \/ Q lt.tilde \( 10^(- 15) thin upright(N) \/ sqrt(upright(H z)) \)^2$
at $f tilde.op 0.1 - 1$ MHz and room temperature $T = 300$ K. These
advances have been driven by improved understanding of strain-induced
dissipation dilution and its geometry dependence \[6, 7\], combined with
innovative fabrication and design techniques~\[8, 9, 10, 11\].

Looking forward, a new generation of fundamental field searches \[12,
13, 14, 15, 16\] has driven a push towards large-area \[9, 17, 18\] and,
or, mass-loaded membranes \[19, 20, 21\] with increased $Q times m$ and
reduced $f$, broadly characterized by their thermal acceleration noise
\[22\] $ S_a^(upright(t h)) = 8 pi k_B T f \/ \( Q m \) . $ While in
principle simply increasing the size $L$ of a square membrane can
increase acceleration sensitivity as $S_a^(upright(t h)) prop L^(- 4)$
via "hard-clamped" dissipation dilution scaling $Q prop L$ \[7\], in
practice the physical size of strained membranes has been limited to
$L tilde.op upright(c m)$ by wafer-scale fabrication constraints,
motivating a search for alternative geometries that increase $Q m \/ f$.

#figure(image("fig1.svg"),
  caption: [
    \(a) Photo of optimized circular-fillet sail membrane with
    $2.5 times 2.5 #h(0em) upright(m m)^2$ pad and
    10-$mu upright(m)$-wide tethers. (b) Simulated von Mises stress near
    the tether clamps. (c) Compilation of $Q times m$ versus frequency
    for trampoline \[22, 23, 24, 10\], square \[25, 26, 27, 28, 29\],
    phononic crystal \[9, 8, 30, 31, 32\], hierarchical \[33\],
    perimeter mode \[34\], and torsion ribbon \[35, 36\] type
    Si$""_3$N$""_4$ membranes. Open and solid red circles are simulated
    and characterized sail membranes described in Figs. #ref(<fig:2>, supplement: none)–#ref(<fig:3>, supplement: none).
  ]
)
<fig:1>

#figure(image("fig2.svg"),
  caption: [
    Optimizing the $Q m \/ f$ of a Si$""_3$N$""_4$ trampoline resonator
    with fixed tether width. (a) Sail-like trampoline geometries with
    pad-width $W$, tether width $t$, pad fillet radius $R$, and clamp
    fillet radius $r$. Top: square-fillet sail ($W$ independent of $R$).
    Bottom: circular-fillet sail ($W = R$). (b-c) Sweep of $W$ over
    optimized fillets (yellow markers) with $t = 10$ $mu$m. Plots show
    quality factor $Q$, frequency $f$, maximum von Mises stress,
    effective mass $m$, and $Q m \/ f$ versus $W$. (d-e) Bayesian
    optimization algorithm convergence (d) and design objective
    landscape (e) for the bottom device in (a). Colored points in (d)
    correspond to the same points in (e).
  ]
)
<fig:2>

Here we report on a new sail-like membrane resonator that achieves the
$Q times m$ of a square membrane while reducing the fundamental
frequency by an order of magnitude---discovered through Bayesian
optimization of a strained Si$""_3$N$""_4$ trampoline. As shown in Fig.
@fig:1, $L tilde.op upright(c m)$ Si$""_3$N$""_4$ sails are predicted to
have acceleration sensitivities
$S_a^(upright(t h)) tilde.op #h(0em) \( upright(n g_0 \/ sqrt(H z)) \)^2$
more than an order of magnitude lower than previously achieved with
Si$""_3$N$""_4$ membranes of any geometry. We explored this by
fabricating $L = 0.5$ cm sails, realizing
$f < 10 #h(0em) upright(k H z)$, $Q > 10^7$, $Q times m approx 10$~g,
within a factor of 5 of simulation. Vertically integrating a sail with a
nanoribbon, we realize a monolithic cavity optomechanical accelerometer
\[22\] with room temperature thermal noise of
$40 #h(0em) upright(n) g_0 \/ sqrt(upright(H z))$, sufficient to resolve
$1 #h(0em) mu g_0 \/ sqrt(upright(H z))$ ambient vibrations in our
laboratory over a 4 kHz bandwidth. Beyond chipscale sensing, cryogenic
arrays of sail membranes may be attractive for new physics searches
\[37, 38, 16\] and distributed quantum sensing experiments \[39, 40,
41\].

An overview of the resonator geometry and optimization is shown in Fig.
@fig:2. For transverse flexural modes of a membrane with thickness $h$,
Young's modulus $E$, and density $rho$, the quality factor $Q$ and
effective mass $m$ depend on the modeshape $u \( x \, y \)$ and stress
profile $sigma \( x \, y \)$, and can be approximated as
$ Q & approx Q_0 (1 + frac(integral sigma \( nabla u \)^2 d A, E h^2 integral \( nabla^2 u \)^2 d A))\
m & = rho h frac(integral u^2 d A, u_(upright(m a x))^2) $ where $Q_0$
is the intrinsic (undiluted) material quality factor and
$u_(upright(m a x))$ is the maximum value of $u \( x \, y \)$~\[6\].

Optimizing the membrane geometry for high $Q m \/ f$ requires repeated
finite-element simulation of candidate designs. Because the stress
profile $sigma \( x \, y \)$ and modeshape $u \( x \, y \)$ must be
recomputed for each design, multidimensional parameter sweeps are
computationally expensive. We therefore employ Bayesian optimization to
efficiently search the design space, adopting a workflow previously
described in \[36\].

We explore two sail-like trampoline geometries with square and circular
fillets (Fig. #ref(<fig:2>, supplement: none)\(a)), building on the intuition that concentrating
mass in the central pad can reduce the resonance frequency \[20\] while
concentrating stress in the clamps can increase $Q$ \[42\]. Both designs
optimize over the pad width $W$ and clamp fillet radius $r$ but
constrain pad fillet radius $R$ differently: the square sail allows $W$,
$r$, and $R$ to be optimized independently while the circular fillets
fix $R = W$.

Results of a three-parameter $\( W \, r \, R \)$ optimization of a
square Si$""_3$N$""_4$ sail with a pre-stress of $1$ GPa, thickness
$h = 100 thin upright(n m)$, $Q_0 = 60 dot.op h \/ upright(n m)$ \[43\],
tether width $t = 10$ $mu$m \[44\], and window size
$5 times 5 #h(0em) upright(m m)^2$ are shown in Fig. #ref(<fig:2>, supplement: none)\(b-c),
revealing the existence of a geometry with $Q m \/ f$ exceeding that of
a square membrane by two orders of magnitude, while maintaining stress
in the clamps beneath the material yield strength of
$approx 6 thin upright(G P a)$ \[24\]. As evident in Fig. #ref(<fig:2>, supplement: none)\(b), in
which pad size $W$ is swept while fixing $\( r \, R \)$ to the optimal
value, this improvement draws from a combination of enhanced $Q$
(established for trampolines and beams \[43, 23, 45, 42\]), mass loading
$m tilde.op W^2$, and a nontrivial $f tilde.op m^(- 1)$ frequency
scaling, the latter two saturating as the pad size approaches the window
size.

In practice, we favor the circular fillet geometry $\( R = W \)$ for its
relative ease of fabrication and similar optimal performance. (Square
fillets are harder to release due to stress gradients; however, a
similar geometry as Fig. #ref(<fig:4>, supplement: none)\(a) was recently realized using a
strain-relieved, perforated photonic crystal membrane \[46\].) Shown in
Fig. #ref(<fig:2>, supplement: none)\(d-e) is a Bayesian search for the optimum $\( r \, W \)$ of a
$sigma_0 = 1 thin upright(G P a)$, $Q_0 = 60 dot.op h \/ upright(n m)$,
$h = 100 thin upright(n m)$, $t = 10$ $mu$m \[44\], $5 times 5$ mm$""^2$
wide circular-filleted Si$""_3$N$""_4$ sail leading to the optimal
geometry shown in Fig. @fig:1. While the two-dimensional $Q m \/ f$
landscape is non-trivial (contours in Fig. #ref(<fig:2>, supplement: none)\(e)), the Bayesian search
converges to the global optimum after $tilde.op 20$ iterations,
predicting a
$\( r \, W \) approx \( 15 thin upright(mu upright(m)) \, thin 2.5 thin upright(m m) \)$
geometry with $f approx 7 thin upright(k H z)$,
$m approx 1.3 thin upright(mu) g$, and $Q approx 70 upright(M)$,
corresponding to a thermal acceleration noise
$S_a^(upright(t h)) approx 10 thin upright(n) g_0 \/ sqrt(upright(H z))$.

To experimentally validate the optimized circular-fillet sail geometry,
we fabricated devices using a standard photolithography and wet etch
method described in \[47\], starting with a 100-nm-thick,
double-side-coated Si$""_3$N$""_4$-on-Si wafer. The centimeter
dimensions and strain-concentrated clamps of our devices make them more
fragile than typical millimeter-scale trampolines \[23\]. We therefore
first selectively back-etch chips leaving behind 20-40 $mu$m of Si
before KOH wet-etching to release the membrane (see Methods for
details). To improve yield, tether geometries are further constrained so
that the maximum von Mises stress does not exceed 3 GPa.

#figure(image("fig3.svg"),
  caption: [
    Device characterization. (a) Energy ringdown of three sail membranes
    with the geometry shown in Fig. #ref(<fig:1>, supplement: none)\(a). Exponential fits yield
    quality factors as high as $Q = 10 times 10^6$. (b) Free-running
    vibration spectra (blue) showing the 7 kHz fundamental membrane
    mode. Overlaid is the driven response of the 200-$mu$m-thick device
    chip (brown) and a similar 400-$mu$m-thick chip (light brown) taken
    with a scanning vibrometer at atmospheric pressure, showing broad
    resonances at 12 and 25 kHz, respectively. Insets: simulated
    membrane modeshapes and measured chip modeshapes.
  ]
)
<fig:3>

Ringdown and free-running vibration measurements of the Fig. #ref(<fig:1>, supplement: none)\(a)
device are shown in Fig. @fig:3, yielding estimates of mechanical $Q$
and resonance frequency spectrum, respectively. For these measurements,
devices were housed in a high-vacuum chamber
($approx 10^(- 8) #h(0em) upright(m b a r)$) and rested in three-point
contact on a metal washer to minimize gas damping and support loss
\[48\]. A low power $P tilde.op 0.1 #h(0em) upright(m W)$, near-infrared
wavelength $lambda approx 850$ nm diode laser probed the devices through
a viewport. Ringdowns were excited by tapping the vacuum chamber and
read out using the optical lever technique \[49\]. The vibration
spectrum in Fig. #ref(<fig:3>, supplement: none)\(b) was taken using a double-membrane etalon \[22\]
as described below and in Fig. 4.

We characterized three optimized circular-fillet sails with tether
widths $t = { 10 \, 10 \, 15 } thin mu upright(m)$ \[44\], and observed
fundamental resonance frequencies $f = { 7.3 \, 7.4 \, 8.5 }$ kHz and
quality factors $Q = { 2.3 \, 6 \, 10 } times 10^6$. While the resonance
frequencies agree with finite element simulations for a pre-stress
$sigma_0 = 0.9$ GPa, the measured $Q$ factors are lower than predicted
by a factor of $5$. Gas damping is a possible factor; however, the
smallest measured damping $f \/ Q = 0.85$ mHz corresponds to a vacuum
pressure of
$P_(upright(g a s)) approx 2 times 10^(- 6) med upright(m b a r)$ two
orders of magnitude larger than inferred from our ion pump \[50, 51\].
Another possible explanation is mode-hybridization with the 12-mm-wide
device chip, whose fundamental flexure mode frequency is expected to be
near that of the membrane \[52\]. We explored this by conducting a
driven response measurement of the chip with a commercial scanning
vibrometer \[53\] (brown data in Fig. @fig:3\[b\]), revealing a broad 12
kHz resonance with a displacement profile consistent with simulation and
qualitatively overlapping with the membrane mode.

Combined with a simulated effective mass $m = 1.3 #h(0em) mu$g, the
measured damping rates of the circular-fillet devices in Fig. #ref(<fig:3>, supplement: none)\(a)
predict thermal acceleration sensitivities
of~$sqrt(S_a^(upright(t h))) =$
$sqrt(8 pi k_B T f \/ \( Q m beta^2 \)) approx { 43 \, 27 \, 22 } thin upright(n) g_0 \/ sqrt(upright(H z))$,
where here
$beta = u_(upright(m a x)) integral u d A \/ \( integral u^2 d A \) approx 1.2$
is a unitless modal participation factor~\[22\]. By contrast, optimized
$5 times 5 #h(0em) upright(m m)^2$ square and circular-fillet membranes
described in Fig. @fig:2 are predicted to have
$sqrt(S_a^(upright(t h))) = 7 #h(0em) upright(n) g_0 \/ sqrt(upright(H z))$
and $10 #h(0em) upright(n) g_0 \/ sqrt(upright(H z))$, respectively.
Simulated and measured devices are compiled in Fig. #ref(<fig:1>, supplement: none)\(c) alongside
previous Si$""_3$N$""_4$ membrane devices, highlighting access to a
novel
$sqrt(S_a^(upright(t h))) lt.eq 100 #h(0em) upright(n) g_0 \/ sqrt(upright(H z))$
sensitivity regime.

To explore the enhanced acceleration sensitivity of sail membranes, we
fabricated a double-membrane optomechanical accelerometer based on the
method described in \[22\] and carried out vibration measurements as
shown in Fig.~@fig:4. The double-membrane device (Fig. #ref(<fig:4>, supplement: none)\(a)) consists
of a circular-fillet sail with the same dimensions as the Fig. #ref(<fig:1>, supplement: none)\(a)
device vertically-integrated atop a 200-$mu$m-wide nanoribbon \[35\] on
the same 200-$mu$m-thick Si chip. The fundamental flexural mode of the
nanoribbon has a resonance frequency of 40 kHz, allowing it to serve as
a rigid inertial reference plane \[22\].

Vibration measurements were carried out by monitoring the
double-membrane transmitted power $P = macron(P) + delta P \( t \)$ and
tuning the laser wavelength $lambda$ to the side of the Fabry-Perot
interference fringe $macron(P) \( lambda \)$ (Fig.~#ref(<fig:4>, supplement: none)\(b)). Classical
intensity noise was subtracted by combining transmitted and reference
beams on a balanced photodetector \[54\]. Power spectra were converted
to displacement spectra
$S_x \[ omega \] = \( partial macron(P) \/ partial lambda dot.op partial lambda_0 \/ partial x \)^(- 2) S_P \[ omega \]$
using the fitted fringe slope $partial macron(P) \/ partial lambda$ and
known optomechanical coupling factor
$partial lambda_0 \/ partial x = 1 \/ 2$. Acceleration spectra
$S_a \[ omega \] = \| chi \[ omega \] \|^(- 2) S_x \[ omega \]$ were
inferred by dividing out by the
mechanical~susceptibility,~$chi \[ omega \] approx \( omega_0^2 - omega^2 \) + i omega omega_0 \/ Q$.

#figure(image("fig4.svg"),
  caption: [
    Dual membrane accelerometry with an optimized circular-fillet sail
    membrane as a test mass and a ribbon membrane as a reference
    surface. (a) Image of sail-on-ribbon device released from a
    200-$mu$m-thick Si substrate. The top membrane has the sail geometry
    shown in Fig. #ref(<fig:1>, supplement: none)\(a). The bottom membrane is a 200-$mu$m-wide
    ribbon \[35\]. (b) Transmission versus incident wavelength of
    double-membrane cavity with finesse $tilde.op 2$. The red point
    indicates the maximum fringe slope and operating wavelength. (c-e)
    Free-running displacement (c) and acceleration (d,e) spectra
    measured with power
    $macron(P) = { 5 \, 50 \, 500 \, 1000 } med mu upright(W)$. Insets
    show scaling of noise floor and thermal noise bandwidth versus
    $macron(P)$.
  ]
)
<fig:4>

Displacement and acceleration spectra in Fig. @fig:4\(c-e) were taken
with the $f_0 approx 7.3$ kHz, $Q = 2.6 times 10^6$ sail and transmitted
powers $macron(P) = 5$ -$1000 thin mu upright(W)$, yielding a
displacement imprecision (noise floor) as low as
$S_x^(upright(i m p)) approx \( 9 thin upright(f m \/ sqrt(H z)) \)^2$
and acceleration imprecision as low as
$S_a^(upright(i m p)) approx \( 40 thin upright(n) g_0 \/ sqrt(upright(H z)) \)^2$
over a 3 dB bandwidth of $Delta f approx 400 thin upright(H z)$ near
mechanical resonance. The observed power-scaling of
$S_x^(upright(i m p))$ and
$Delta f approx \( f_0 \/ Q \) \( S_x^(upright(t h)) \/ S_x^(upright(i m p)) \)^(1 \/ 2)$
is consistent with shot noise
$S_P^(upright(i m p)) = 4 lambda macron(P) \/ \( h c eta \)$ \[54\] with
a measurement efficiency of $eta approx 0.5$ (Fig. @fig:4\[c,e\]
insets). The acceleration imprecision agrees with the thermal noise
prediction
$S_a^(upright(t h)) approx \( 43 #h(0em) upright(n) g_0 \/ sqrt(upright(H z)) \)^2$,
while baseband noise exceeds the predicted shot-noise-limited value
$S_a^(upright(i m p)) \( f lt.double f_0 \) approx S_x^(upright(i m p)) \/ omega_0^4 tilde.op \( 1 #h(0em) mu g_0 \/ sqrt(upright(H z)) \)^2$
by over an order of magnitude. Measurements performed with a commercial
seismometer (Wilcoxon 797L, gray curve) rigidly attached to the vacuum
chamber suggest that this noise is in excess of seismic and acoustic
noise by roughly a factor of 10, pointing to excess laser intensity
noise.

#emph[Summary & outlook -] In summary, we have used Bayesian
optimization to design Si$""_3$N$""_4$ trampoline resonators with
$Q m \/ f$ products exceeding that of a square membrane by two orders of
magnitude, yielding centimeter-scale, microgram devices with
$tilde.op 10$ kHz resonant frequencies and room temperature thermal
acceleration sensitivities of
$tilde.op 10 thin upright(n) g_0 \/ sqrt(upright(H z))$.

Looking forward, high $Q m \/ f$ sail membranes hold promise for various
applications. A key motivation for our work is proposed fundamental
field sensing experiments based on low noise, scalable membrane
accelerometers \[22\], including searches for ultralight dark matter
\[37, 38\] and high frequency gravitational waves \[16\], and study of
entanglement-enhanced distributed force sensing protocols \[39, 40,
41\]. Large-area, low-stiffness Si$""_3$N$""_4$ trampolines are also
being used to study radiation pressure effects in next-generation solar
sails \[55, 46\], leveraging advances in photonic crystal (PtC)
patterning \[3\]. The geometry optimization strategy explored here may
enable further stiffness reduction; moreover, the flexural modes of such
devices have been little studied in vacuum and could give access to rich
nonlinear optomechanical effects \[56\]. Finally, membrane-based
optomechanical accelerometers \[22\] have been increasingly explored for
practical high speed vibrometry \[57, 20, 26, 58\]. The devices we have
presented are readily implemented in monolithic \[22\] or flip-chip
cavity approaches \[57, 20, 26\], and integrated with PtC reflectors
\[24, 59\]. A particularly attractive approach is to monolithically
integrate a PtC sail membrane with a cavity Bragg mirror, building on
recent work \[5\].

#heading(level: 1, numbering: none)[Methods]
<methods>
#emph[Fabrication of sail membranes -] Centimeter-scale
$upright(S i_3 N_4)$ trampoline resonators have been fabricated using
both wet \[8, 24\] and dry etching \[9, 46\] techniques; however,
several aspects of our device geometries make them uniquely challenging
to release: (1) optimizing $Q m \/ f$ yields localized stress in the
tethers beyond that of a typical trampoline resonator; (2) the
dimensions of the pad are significantly larger than the tethers and chip
thickness, leading to intermediate mass-loading and stress gradients;
(3) we desired to open a window through the Si chip without introducing
overhang. (The combination of (2) and (3) limits direct use of the SF6
dry-etching technique in \[9, 46\].) We overcome these challenges by
optimizing sail membranes with constraints on the maximum von Mises
stress and adopting a two-stage KOH wet-etching approach: First, we
pre-etch chips from the backside to remove all but $20 - 40 #h(0em) mu$m
of substrate material (deep reactive ion etching may also work for this
step); we then perform the double-sided etch and cleaning procedure
outlined in \[47\]. Through trial and error, we found that sail
membranes released safely when the stress was limited to 3 GPa.

#heading(level: 1, numbering: none)[Acknowledgements]
<acknowledgements>
The authors thank Aman Agrawal for guidance in developing the
fabrication procedure. We also thank Osama Jameel and Polytec, Inc
(Plymouth, MI, USA) for assistance with vibrometry measurements in Fig.
@fig:3. This work was supported by the National Science Foundation,
award no. 2209473. MJA and DJW acknowledge additional support from the
Natural Sciences and Engineering Research Council (NSERC) of Canada
Alliance International, award no. ALLRP 591060-23.

#heading(level: 1, numbering: none)[References]
<references>
\[1\]

M.~Metcalfe,~#emph[Applications of cavity
optomechanics,]~#link("https://pubs.aip.org/aip/apr/article/1/3/031105/123596")[Applied Physics Reviews~#strong[1] (2014)]

\[2\]

Y.~Tsaturyan, A.~Barg, E.~S.~Polzik,
~and~A.~Schliesser,~#emph[Ultracoherent nanomechanical resonators via
soft clamping and dissipation
dilution,]~#link("https://www.nature.com/articles/nnano.2017.101.pdf")[Nat. Nanotechnol.~#strong[12],~776 (2017)]

\[3\]

L.~Norder, S.~Yin, M.~H.~de~Jong, F.~Stallone, H.~Aydogmus,
P.~M.~Sberna, M.~A.~Bessa, ~and~R.~A.~Norte,~#emph[Pentagonal photonic
crystal mirrors: scalable lightsails with enhanced acceleration via
neural topology
optimization,]~#link("https://doi.org/10.1038/s41467-025-57749-y")[Nature Communications~#strong[16],~2753 (2025)]

\[4\]

A.~G.~Krause, M.~Winger, T.~D.~Blasius, Q.~Lin, ~and~O.~Painter,~#emph[A
high-resolution microchip optomechanical
accelerometer,]~#link("https://idp.nature.com/authorize/casa?redirect_uri=https://www.nature.com/articles/nphoton.2012.245&casa_token=KX6bdWSa-XoAAAAA:e0fJb4Su915n4ug0sjfHoqUdyZDthBHesbxEJh23fSHrUpbH1CVK_EJIno0ItyEqIM82EfVZPbbFQR49TQ")[Nature Photonics~#strong[6],~768--772 (2012)]

\[5\]

M.~Khokhar, L.~Norder, P.~M.~Sberna, ~and~R.~A.~Norte,~#emph[High-stress
Si$""_3$N$""_4$ reflective membranes monolithically integrated with
cavity Bragg
mirrors,]~#link("https://arxiv.org/pdf/2603.02490")[arXiv preprint arXiv:2603.02490~ (2026)]

\[6\]

N.~J.~Engelsen, A.~Beccari,
~and~T.~J.~Kippenberg,~#emph[Ultrahigh-quality-factor micro-and
nanomechanical resonators using dissipation
dilution,]~#link("https://doi.org/10.1038/s41565-023-01597-8")[Nature Nanotechnology~,~1--13 (2024)]

\[7\]

S.~A.~Fedorov, N.~J.~Engelsen, A.~H.~Ghadimi, M.~J.~Bereyhi,
R.~Schilling, D.~J.~Wilson, ~and~T.~J.~Kippenberg,~#emph[Generalized
dissipation dilution in strained mechanical
resonators,]~#link("https://doi.org/10.1103/PhysRevB.99.054107")[Physical Review B~#strong[99],~054107 (2019)]

\[8\]

A.~H.~Ghadimi, S.~A.~Fedorov, N.~J.~Engelsen, M.~J.~Bereyhi,
R.~Schilling, D.~J.~Wilson, ~and~T.~J.~Kippenberg,~#emph[Elastic strain
engineering for ultralow mechanical
dissipation,]~#link("https://www.science.org/doi/pdf/10.1126/science.aar6939")[Science~#strong[360],~764--768 (2018)]

\[9\]

A.~Cupertino, D.~Shin, L.~Guo, P.~G.~Steeneken, M.~A.~Bessa,
~and~R.~A.~Norte,~#emph[Centimeter-scale nanomechanical resonators with
low
dissipation,]~#link("https://doi.org/10.1038/s41467-024-48183-7")[Nature Communications~#strong[15],~4255 (2024)]

\[10\]

D.~Høj, F.~Wang, W.~Gao, U.~B.~Hoff, O.~Sigmund,
~and~U.~L.~Andersen,~#emph[Ultra-coherent nanomechanical resonators
based on inverse
design,]~#link("https://doi.org/10.1038/s41565-023-01597-8")[Nature Communications~#strong[12],~5766 (2021)]

\[11\]

D.~Shin, A.~Cupertino, M.~H.~de~Jong, P.~G.~Steeneken, M.~A.~Bessa,
~and~R.~A.~Norte,~#emph[Spiderweb nanomechanical resonators via bayesian
optimization: inspired by nature and guided by machine
learning,]~#link("https://advanced.onlinelibrary.wiley.com/doi/pdfdirect/10.1002/adma.202106248?_utm_campaign=mention57529&_utm_content=lnk241316896300&_utm_medium=inline&_utm_source=xakep")[Advanced Materials~#strong[34],~2106248 (2022)]

\[12\]

D.~Carney, G.~Krnjaic, D.~C.~Moore, C.~A.~Regal, G.~Afek, S.~Bhave,
B.~Brubaker, T.~Corbitt, J.~Cripe, N.~Crisosto,
#emph[et~al.],~#emph[Mechanical quantum sensing in the search for dark
matter,]~#link("https://iopscience.iop.org/article/10.1088/2058-9565/abcfcd/pdf")[Quantum Science & Technology~#strong[6],~024002 (2021a)]

\[13\]

J.~Manley, M.~D.~Chowdhury, D.~Grin, S.~Singh,
~and~D.~J.~Wilson,~#emph[Searching for vector dark matter with an
optomechanical accelerometer,]~ Phys. Rev. Lett.~#strong[126],~061301
(2021)

\[14\]

Y.~Liu, J.~Mummery, J.~Zhou, ~and~M.~A.~Sillanpää,~#emph[Gravitational
forces between nonclassical mechanical
oscillators,]~#link("https://journals.aps.org/prapplied/abstract/10.1103/PhysRevApplied.15.034004")[Physical Review Applied~#strong[15],~034004 (2021)]

\[15\]

Z.~Tang, W.~Li, H.~Sun, X.~Cai, T.~Li,
~and~Y.~Liu,~#emph[Cavity-optomechanical probe of gravity between
massive mechanical
oscillators,]~#link("https://journals.aps.org/pra/abstract/10.1103/m2zy-3ywx")[Physical Review A~#strong[112],~053520 (2025)]

\[16\]

D.~Rousso, M.~B.~K.~Kunze, ~and~C.~Reinhardt,~#emph[Optomechanical
platform for high-frequency gravitational wave and vector dark matter
detection,]~#link("https://arxiv.org/abs/2601.02576")[arXiv preprint arXiv:2601.02576~ (2026)]

\[17\]

E.~Serra, M.~Bawaj, A.~Borrielli, G.~Di~Giuseppe, S.~Forte, N.~Kralj,
N.~Malossi, L.~Marconi, F.~Marin, F.~Marino,
#emph[et~al.],~#emph[Microfabrication of large-area circular high-stress
silicon nitride membranes for optomechanical applications,]~ AIP
advances~#strong[6] (2016)

\[18\]

L.~A.~Martinez, A.~R.~Castelli, W.~Delmas, J.~E.~Sharping,
~and~R.~Chiao,~#emph[Electromagnetic coupling to centimeter-scale
mechanical membrane resonators via rf cylindrical
cavities,]~#link("https://pubs.aip.org/aip/adv/article/8/11/115223/127931")[New Journal of Physics~#strong[18],~113015 (2016)]

\[19\]

C.~Condos, J.~Pratt, J.~Manley, A.~Agrawal, S.~Schlamminger, C.~Pluchar,
~and~D.~Wilson,~#emph[Ultralow loss torsion micropendula for chipscale
gravimetry,]~#link("https://doi.org/10.1103/nmx5-hygh")[Physical Review Letters~#strong[134],~253602 (2025)]

\[20\]

N.~Bawden, B.~J.~Carey, P.-M.~Yeo, N.~Arora, L.~Sementilli,
V.~M.~Valenzuela, E.~Romero, G.~I.~Harris, M.~Wegener,
~and~W.~P.~Bowen,~#emph[Precision optomechanical accelerometer via
hybrid test-mass
integration,]~#link("https://link.aps.org/doi/10.1103/knpw-1mdj")[Physical Review Applied~#strong[24],~064008 (2025)]

\[21\]

J.~Depellette, E.~Rej, R.~Cutting, ~and~M.~A.~Sillanpää,~#emph[Strong
actuation of mass-loaded membranes for gravity studies at the milligram
scale,]~#link("https://pubs.aip.org/aip/jap/article/139/14/144501/3386861")[Journal of Applied Physics~#strong[139] (2026)]

\[22\]

M.~D.~Chowdhury, A.~R.~Agrawal, ~and~D.~J.~Wilson,~#emph[Membrane-based
optomechanical
accelerometry,]~#link("https://link.aps.org/pdf/10.1103/PhysRevApplied.19.024011?casa_token=N-268TjmfFkAAAAA:WJyyjoj4LN-CwmEiLtbUuVNP_II12HQGXk-TUcpSCwfmE1pb7-9MT-Q6g2WwU9Xg6ng_NLBVzb8OOxk")[Physical Review Applied~#strong[19],~024011 (2023)]

\[23\]

C.~Reinhardt, T.~Müller, A.~Bourassa,
~and~J.~C.~Sankey,~#emph[Ultralow-noise sin trampoline resonators for
sensing and
optomechanics,]~#link("https://link.aps.org/pdf/10.1103/PhysRevX.6.021001")[Physical Review X~#strong[6],~021001 (2016)]

\[24\]

R.~A.~Norte, J.~P.~Moura, ~and~S.~Gröblacher,~#emph[Mechanical
resonators for quantum optomechanics experiments at room
temperature,]~#link("https://journals.aps.org/prl/abstract/10.1103/PhysRevLett.116.147202")[Physical Review Letters~#strong[116],~147202 (2016)]

\[25\]

M.~Underwood, D.~Mason, D.~Lee, H.~Xu, L.~Jiang, A.~Shkarin, K.~Børkje,
S.~Girvin, ~and~J.~Harris,~#emph[Measurement of the motional sidebands
of a nanogram-scale oscillator in the quantum
regime,]~#link("https://journals.aps.org/pra/abstract/10.1103/PhysRevA.92.061801")[Physical Review A~#strong[92],~061801 (2015)]

\[26\]

W.~Li, W.~Liu, C.~Liu, Y.~Gu, L.~Liu, Y.~Zhou, E.~Xing, Y.~Shi, J.~Tang,
~and~J.~Liu,~#emph[Broadband optomechanical accelerometer reaching the
thermomechanical limit based on suspended si 3 n 4 membrane
resonator,]~#link("https://ieeexplore.ieee.org/abstract/document/10507739?casa_token=IANrWrTs5esAAAAA:2QxrUbG4GuDxUIRd7C3zaYWiGepziUSeAYco0QYSjdmqdEzyAJiKTlXLlLyOENlvgHr_nPzm1w")[IEEE Sensors Journal~#strong[24],~17528--17536 (2024)]

\[27\]

B.~Zwickl, W.~Shanks, A.~Jayich, C.~Yang, A.~Bleszynski~Jayich,
J.~Thompson, ~and~J.~Harris,~#emph[High quality mechanical and optical
properties of commercial silicon nitride
membranes,]~#link("https://pubs.aip.org/aip/apl/article/92/10/103125/145524")[Applied Physics Letters~#strong[92] (2008)]

\[28\]

S.~Chakram, Y.~Patil, L.~Chang, ~and~M.~Vengalattore,~#emph[Dissipation
in ultrahigh quality factor sin membrane
resonators,]~#link("https://doi.org/10.1103/PhysRevLett.112.127201")[Physical Review Letters~#strong[112],~127201 (2014)]

\[29\]

A.~Borrielli, L.~Marconi, F.~Marin, F.~Marino, B.~Morana, G.~Pandraud,
A.~Pontin, G.~A.~Prodi, P.~M.~Sarro, E.~Serra,
~and~M.~Bonaldi,~#emph[Control of recoil losses in nanomechanical sin
membrane
resonators,]~#link("https://doi.org/ 10.1103/PhysRevB.94.121403")[Physical Review B~#strong[94],~121403(R) (2016)]

\[30\]

C.~Reetz, R.~Fischer, G.~G.~Assumpcao, D.~P.~McNally, P.~S.~Burns,
J.~C.~Sankey, ~and~C.~A.~Regal,~#emph[Analysis of membrane phononic
crystals with wide band gaps and low-mass
defects,]~#link("https://journals.aps.org/prapplied/abstract/10.1103/PhysRevApplied.12.044027")[Physical Review Applied~#strong[12],~044027 (2019)]

\[31\]

M.~Rossi, D.~Mason, J.~Chen, Y.~Tsaturyan,
~and~A.~Schliesser,~#emph[Measurement-based quantum control of
mechanical
motion,]~#link("https://idp.nature.com/authorize/casa?redirect_uri=https://www.nature.com/articles/s41586-018-0643-8&casa_token=RSrP0KbP_KgAAAAA:0XW5F_2-41EGmJ3SU7d1DtEcpWRRiSoQtMzmzmVGo2fy2GbtBDYmimPa2q8q5fNj74QICaj-KOxk6aZA1w")[Nature~#strong[563],~53--58 (2018)]

\[32\]

Y.~Seis, T.~Capelle, E.~Langman, S.~Saarinen, E.~Planz,
~and~A.~Schliesser,~#emph[Ground state cooling of an ultracoherent
electromechanical
system,]~#link("https://www.nature.com/articles/s41467-022-29115-9.pdf")[Nature Communications~#strong[13],~1507 (2022)]

\[33\]

M.~J.~Bereyhi, A.~Beccari, R.~Groth, S.~A.~Fedorov, A.~Arabmoheghi,
T.~J.~Kippenberg, ~and~N.~J.~Engelsen,~#emph[Hierarchical tensile
structures with ultralow mechanical
dissipation,]~#link("https://doi.org/10.1038/s41467-022-30586-z")[Nature Communications~#strong[13],~3097 (2022a)]

\[34\]

M.~J.~Bereyhi, A.~Arabmoheghi, A.~Beccari, S.~A.~Fedorov, G.~Huang,
T.~J.~Kippenberg, ~and~N.~J.~Engelsen,~#emph[Perimeter modes of
nanomechanical resonators exhibit quality factors exceeding 10 9 at room
temperature,]~#link("https://link.aps.org/pdf/10.1103/PhysRevX.12.021036")[Physical Review X~#strong[12],~021036 (2022b)]

\[35\]

J.~R.~Pratt, A.~R.~Agrawal, C.~A.~Condos, C.~M.~Pluchar,
S.~Schlamminger, ~and~D.~J.~Wilson,~#emph[Nanoscale torsional
dissipation dilution for quantum experiments and precision
measurement,]~#link("https://journals.aps.org/prx/abstract/10.1103/PhysRevX.13.011018")[Phys. Rev. X~#strong[13],~011018 (2023)]

\[36\]

A.~D.~Hyatt, A.~R.~Agrawal, C.~M.~Pluchar, C.~A.~Condos,
~and~D.~J.~Wilson,~#emph[Ultrahigh-q torsional nanomechanics through
bayesian
optimization,]~#link("https://pubs.acs.org/doi/pdf/10.1021/acs.nanolett.5c06306?casa_token=lORIGoEhvdsAAAAA:mc44UQw53O-IGDWE1odJjs-PRmtQ2wtvrLZTxUebZc-S5p7Br5FUWpT95QoDK32PSj7RMEqTsib_3NQv")[Nano Letters~ (2025a)]

\[37\]

D.~Carney, A.~Hook, Z.~Liu, J.~M.~Taylor, ~and~Y.~Zhao,~#emph[Ultralight
dark matter detection with mechanical quantum
sensors,]~#link("https://iopscience.iop.org/article/10.1088/1367-2630/abd9e7/meta")[New J. Phys.~#strong[23],~023041 (2021b)]

\[38\]

M.~Dey~Chowdhury, J.~Manley, C.~Condos, A.~Agrawal,
~and~D.~Wilson,~#emph[Optomechanical accelerometer search for ultralight
dark
matter,]~#link("https://link.aps.org/pdf/10.1103/16yd-qj5v")[Physical Review D~#strong[113],~L121303 (2026)]

\[39\]

Y.~Xia, A.~R.~Agrawal, C.~M.~Pluchar, A.~J.~Brady, Z.~Liu, Q.~Zhuang,
D.~J.~Wilson, ~and~Z.~Zhang,~#emph[Entanglement-enhanced optomechanical
sensing,]~#link("https://www.nature.com/articles/s41566-023-01178-0.pdf")[Nature Photonics~#strong[17],~470--477 (2023)]

\[40\]

Q.~Li, W.~Li, Y.~Wang, Y.~Wang, L.~Tian, S.~Shi,
~and~Y.~Zheng,~#emph[Quantum-enhanced optomechanical sensor
network,]~#link("https://onlinelibrary.wiley.com/doi/abs/10.1002/lpor.202501636")[Laser & Photonics Reviews~#strong[20],~e01636 (2026)]

\[41\]

A.~J.~Brady, X.~Chen, Y.~Xia, J.~Manley, M.~Dey~Chowdhury, K.~Xiao,
Z.~Liu, R.~Harnik, D.~J.~Wilson, Z.~Zhang,
~and~Q.~Zhuang,~#emph[Entanglement-enhanced optomechanical sensor array
with application to dark matter
searches,]~#link("https://doi.org/ 10.1038/s42005-023-01357-z")[Commun. Phys.~#strong[6],~237 (2023)]

\[42\]

M.~J.~Bereyhi, A.~Beccari, S.~A.~Fedorov, A.~H.~Ghadimi, R.~Schilling,
D.~J.~Wilson, N.~J.~Engelsen,
~and~T.~J.~Kippenberg,~#emph[Clamp-tapering increases the quality factor
of stressed
nanobeams,]~#link("https://pubs.acs.org/doi/abs/10.1021/acs.nanolett.8b04942")[Nano letters~#strong[19],~2329--2333 (2019)]

\[43\]

L.~G.~Villanueva~and~S.~Schmid,~#emph[Evidence of surface loss as
ubiquitous limiting damping mechanism in sin micro-and nanomechanical
resonators,]~#link("https://doi.org/10.1103/PhysRevLett.113.227201")[Physical Review Letters~#strong[113],~227201 (2014)]

\[44\]

We optimized sail membranes over a range of tether widths and only saw
significant changes in the frequency between each design---Q-m product
remained roughly constant. We opted to focus on devices with 10 and 15
micron tethers because of their predicted performance and robustness
during fabrication.

\[45\]

P.~Sadeghi, M.~Tanzer, S.~L.~Christensen,
~and~S.~Schmid,~#emph[Influence of clamp-widening on the quality factor
of nanomechanical silicon nitride
resonators,]~#link("https://doi.org/10.1063/1.5111712")[Journal of Applied Physics~#strong[126] (2019)]

\[46\]

L.~Norder, A.~Keşkekler, ~and~R.~A.~Norte,~#emph[High-power laser drives
motion in ultra-thin photonic crystal lightsails via radiation
pressure,]~#link("https://arxiv.org/abs/2606.20149")[arXiv preprint arXiv:2606.20149~ (2026)]

\[47\]

A.~D.~Hyatt, O.~A.~Flores, A.~R.~Agrawal, C.~A.~Condos,
~and~D.~J.~Wilson,~#emph[Fabrication and characterization of high-q
silicon nitride membrane
resonators,]~#link("https://doi.org/ https://app.jove.com/v/68706/fabrication-characterization-high-q-silicon-nitride-membrane")[JoVE~,~e68706 (2025b)]

\[48\]

D.~J.~Wilson, C.~A.~Regal, S.~B.~Papp, ~and~H.~Kimble,~#emph[Cavity
optomechanics with stoichiometric sin
films,]~#link("https://journals.aps.org/prl/abstract/10.1103/PhysRevLett.103.207204")[Physical Review Letters~#strong[103],~207204 (2009)]

\[49\]

C.~M.~Pluchar, A.~R.~Agrawal, ~and~D.~J.~Wilson,~#emph[Quantum-limited
optical lever measurement of a torsion
oscillator,]~#link("https://opg.optica.org/optica/abstract.cfm?URI=optica-12-3-418")[Optica~#strong[12],~418--423 (2025)]

\[50\]

O.~R.~Green, Y.~Bao, J.~R.~Lawall, J.~J.~Gorman,
~and~D.~S.~Barker,~#emph[Accurate, precise pressure sensing with
tethered
optomechanics,]~#link("https://link.aps.org/pdf/10.1103/9dtb-sk2j")[Physical Review Applied~#strong[24],~024069 (2025)]

\[51\]

C.~Reinhardt, H.~Masalehdan, S.~Croatto, A.~Franke, M.~B.~Kunze,
J.~Schaffran, N.~Sueltmann, A.~Lindner,
~and~R.~Schnabel,~#emph[Self-calibrating gas pressure sensor with a
10-decade measurement
range,]~#link("https://pubs.acs.org/doi/pdf/10.1021/acsphotonics.3c01488")[ACS photonics~#strong[11],~1438--1446 (2024)]

\[52\]

M.~H.~de~Jong, M.~A.~ten Wolde, A.~Cupertino, S.~Gröblacher,
P.~G.~Steeneken, ~and~R.~A.~Norte,~#emph[Mechanical dissipation by
substrate--mode coupling in sin
resonators,]~#link("https://doi.org/10.1063/5.0092894")[Applied Physics Letters~#strong[121] (2022)]

\[53\]

Polytec VibroScan-QTec.

\[54\]

The laser beam was split before passing through the cavity, creating an
auxiliary reference beam. The transmitted and referenced beams were
combined on a balanced photodetector to cancel classical (technical)
laser noise. This results in an extra factor of two in our expression
for intensity shot noise, $S_P^(upright(i m p))$.

\[55\]

L.~Michaeli, R.~Gao, M.~D.~Kelzenberg, C.~U.~Hail, A.~Merkt,
J.~E.~Sader, ~and~H.~A.~Atwater,~#emph[Direct radiation pressure
measurements for lightsail
membranes,]~#link("https://www.nature.com/articles/s41566-024-01605-w")[Nature Photonics~#strong[19],~369--377 (2025a)]

\[56\]

L.~Michaeli, R.~Gao, M.~D.~Kelzenberg, C.~U.~Hail, J.~E.~Sader,
~and~H.~A.~Atwater,~#emph[Optically actuated transitions in multimodal,
bistable micromechanical
oscillators,]~#link("https://arxiv.org/abs/2507.22605")[arXiv preprint arXiv:2507.22605~ (2025b)]

\[57\]

F.~Zhou, Y.~Bao, R.~Madugani, D.~A.~Long, J.~J.~Gorman,
~and~T.~W.~LeBrun,~#emph[Broadband thermomechanically limited sensing
with an optomechanical
accelerometer,]~#link("https://opg.optica.org/viewmedia.cfm?uri=optica-8-3-350&seq=0")[Optica~#strong[8],~350--356 (2021)]

\[58\]

R.~St-Gelais, S.~Bernard, C.~Reinhardt,
~and~J.~C.~Sankey,~#emph[Swept-frequency drumhead optomechanical
resonators,]~#link("https://pubs.acs.org/doi/full/10.1021/acsphotonics.8b01519")[ACS Photonics~#strong[6],~525--530 (2019)]

\[59\]

A.~Agrawal, J.~Manley, D.~Allepuz-Requena,
~and~D.~Wilson,~#emph[Focusing membrane metamirrors for integrated
cavity
optomechanics,]~#link("https://doi.org/ 10.1364/OPTICA.522509")[Optica~#strong[11],~1235--1241 (2024)]
