#import "hall-geometry.typ": hall-geometry

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

  show figure.where(kind: table): set figure(numbering: "I")
  show figure.caption: set text(size: 8.5pt)
  show figure.where(kind: image): set figure(placement: top)
  show figure.where(kind: table): set figure(placement: top)
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

  place(top + center, float: true, scope: "parent", block(below: 1em, width: 100%)[
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
  ])

  doc
}
#show: doc => conf(
  title: [Thickness-Dependent Charge-Carrier Mobility in Home-Grown High-Purity Germanium Crystals],
  authors: ((name: [Narayan Budhathoki, Dongming Mei, Sanjay Bhattarai, Sunil Chhetri, Kunming Dong, Shasika Panamaldeniya, Athul Prem, and Austin Warren],
    affiliation: [Department of Physics, University of South Dakota, Vermillion, SD 57069, USA],
    email: []),),
  paper: "us-letter",
  margin: (x: 17mm, y: 18mm),
  font: "Libertinus Serif",
  fontsize: 10pt,
  sectionnumbering: "I.",
  abstract-title: [Abstract],
  abstract: [Understanding how charge-carrier mobility evolves as
high-purity germanium (HPGe) is thinned from bulk to micrometer scale is
essential for optimizing advanced radiation detectors, thin-body Ge
electronics, and emerging quantum devices. We report, to our knowledge,
the first systematic thickness-dependent mobility study on bulk-grown,
detector-grade HPGe, performing Hall-effect measurements on $n$- and
$p$-type samples thinned from $2.7 med upright(m m)$ down to
$7 med upright(mu m)$ at room temperature. The mobility follows an
extended-exponential dependence
$mu \( t \) = mu_0 [1 - exp #scale(x: 120%, y: 120%)[\(] - \( t \/ tau \)^beta #scale(x: 120%, y: 120%)[\)]]$
with characteristic electrostatic lengths
$tau = 6$--$50 med upright(mu m)$. Comparison with boundary-scattering
and depletion-based models shows that mobility degradation is dominated
not by Fuchs--Sondheimer surface scattering but by electrostatic
depletion that reduces the effective conducting channel thickness.
Across all samples, the hierarchy $lambda_D < tau lt.tilde W_0$
identifies long-range screening and near-surface electric fields as the
primary mechanisms governing the mobility crossover. This connection
provides a simple device-level design rule: maintaining
$t gt.tilde 3 tau$ preserves most of the bulk mobility, while thinner
devices enter a depletion-controlled regime with sharply reduced
transport. The extracted parameters thus supply quantitative benchmarks
for mobility engineering in ultrathin HPGe and a predictive framework
for Ge-on-insulator structures, fully depleted channels, and future
Ge-based quantum and electronic technologies.

],
  pagenumbering: "1",
  cols: 2,
  doc,
)


= Introduction
<introduction>
High-purity germanium (HPGe) remains a benchmark semiconductor for
radiation detection, infrared photonics, and emerging quantum
technologies due to its exceptional crystalline purity, high carrier
mobility, and narrow band
gap@DARKEN199523@knoll2010radiation@gilmore2008practical@nakano2020ultra.
These intrinsic properties enable efficient charge collection, low
electronic noise, and excellent energy resolution over a wide range of
operating conditions, making HPGe indispensable for low-threshold
ionization detectors and precision semiconductor
devices@mei2025phonon@mei2025quantum_sensors@budhathoki2025aps_irfiber.

Beyond detector applications, Ge has re-emerged as a promising channel
material for next-generation microelectronics as silicon complementary
metal-oxide-semiconductor (CMOS) approaches its electrostatic and
mobility scaling limits@mosfet1@mosfet0@mosfet2@mosfet4@mosfet5@GeOI@i.
Ge exhibits the highest hole mobility among group-IV semiconductors
($mu_h approx 1900 med upright(c m^2 \/ V thin . s)$)@Myronov_2014@jacoboni1983electronic
and an electron mobility well above that of
silicon@mosfet6@mosfet7@mosfet8@mosfet9@mosfetandmob@mosfetandmobilitydeg,
motivating continued development of Ge-on-insulator (GeOI) and
ultra-thin-body Ge transistors. In such devices---and in thinned HPGe
detectors---the active channel thickness is often reduced to tens of
micrometers or below, making it essential to understand how mobility
evolves as a function of thickness.

Carrier mobility in thin semiconductors can degrade through several
mechanisms, including surface-field-induced depletion, long-range
Coulomb scattering, interface disorder, and strain-induced
band-structure modification@fischetti1996band@nakano2016high. While
these mechanisms have been extensively characterized in Si, strained-Ge,
and GeOI
technologies@ando1982electronic@fischetti1996band@mosfetandmobilitydeg,
a systematic experimental framework describing thickness-dependent
mobility in high-purity, bulk-grown Ge remains largely unexplored. In
particular, the interplay between electrostatic screening, depletion
width, and intrinsic band anisotropy has not been fully established for
mechanically thinned HPGe crystals, where interface-induced scattering
is minimal and electrostatic effects are expected to dominate.

Prior studies of mobility in Ge and related systems have largely focused
on Ge-on-insulator (GeOI) and ultrathin epitaxial films, where transport
is strongly influenced by interface disorder, strain relaxation, and
gate-stack engineering@GeOI@mosfetandmobilitydeg@nakano2016high. These
works provide valuable insight into technologically relevant
metal-oxide-semiconductor (MOS) and channel structures, but they do not
address bulk-grown, detector-grade Ge that is mechanically thinned to
the few-micrometer scale while preserving ultra-low impurity levels and
minimal interface damage. In contrast, the present work reports the
first systematic, thickness-dependent mobility study on bulk high-purity
Ge, covering a continuous range from $2.7 med upright(m m)$ down to
$7 med mu upright(m)$ on the same material platform. This geometry is
directly relevant to HPGe detectors, Ge-based quantum sensors, and Ge
electronics where devices are thinned for charge-collection speed,
phonon engineering, or hybrid integration, yet must retain near-bulk
mobility@mei2025phonon@mei2025quantum_sensors@mosfet1.

Classical boundary-scattering models such as the Fuchs--Sondheimer (FS)
formalism predict only mild thickness dependence when the mean free path
is much smaller than the physical thickness, as is the case for HPGe at
room temperature@fuchs1938conductivity@sondheimer1952mean. In contrast,
surface depletion can substantially reduce the effective conducting
thickness when the physical thickness approaches the Debye length,
leading to a strong, monotonic suppression of
mobility@fischetti1996band. A unified empirical description that
captures this electrostatically governed transition from bulk-like to
thin-body transport would therefore be valuable for both detector
optimization and the design of advanced Ge-based electronic and quantum
devices.

In this work, we experimentally investigate charge-carrier mobility in
home-grown HPGe crystals fabricated at the University of South Dakota.
Van der Pauw Hall-effect measurements were performed on p- and n-type
samples thinned from $2.7 med upright(m m)$ to $7 med mu upright(m)$. A
central outcome is that the measured electron and hole mobilities are
accurately described by an extended-exponential law
#math.equation(block: true, numbering: _ => [(1)], $ mu \( t \) = mu_0 #h(-1em) [1 - exp #h(-1em) #scale(x: 120%, y: 120%)[\(] - \( t \/ tau \)^beta #scale(x: 120%, y: 120%)[\)]] \, $) <eq:extended-exponential>
where $mu_0$ is the bulk mobility, $tau$ is a characteristic
electrostatic screening length, and $beta$ quantifies dimensional
sensitivity. Comparison with FS-only and depletion-only models shows
that boundary scattering is negligible, whereas surface-field-induced
depletion dominates the observed thickness dependence. The extracted
characteristic lengths satisfy the hierarchy
$lambda_D < tau lt.tilde W_0$, indicating that mobility suppression in
HPGe is primarily governed by electrostatic effects rather than diffuse
surface scattering. This connection provides a simple device-level
design rule: maintaining the active thickness in the regime
$t gt.tilde 3 tau$ preserves most of the bulk mobility, whereas devices
with $t lt.tilde tau$ enter a depletion-controlled regime with strongly
suppressed transport. In this way, the thickness dependence of mobility
in ultra-pure Ge is reduced to a small set of physically transparent
parameters that can be used directly in detector and device design.

Overall, this study establishes a consistent electrostatic framework for
thickness-dependent transport in HPGe, unifying the behavior of
micrometer-scale samples with their bulk counterparts. These results
provide quantitative guidance for optimizing high-resolution HPGe
detectors and designing thin-body Ge-based electronic and quantum
devices in which mobility engineering and electrostatic control must be
carefully balanced.

= Methods
<methods>
== Crystal Growth and Material Preparation
<crystal-growth-and-material-preparation>
High-purity germanium crystals were grown in-house using successive zone
refining and Czochralski pulling. Commercial Ge ingots with initial
impurity concentrations of $\( 10^13$--$10^14 \) med upright(c m^(- 3))$
were refined to
$\( 2$--$3 \) times 10^11 med upright(c m^(- 3))$@bhattarai2024crystals.
Prior to melting, all components contacting the charge were cleaned in
DI water and acetone, followed by an HNO$""_3$:HF (3:1) etch for Ge
surfaces and H$""_2$O$""_2$ treatment for quartz hardware. The charge
was melted in a quartz crucible on a graphite susceptor using RF
induction heating. Chamber pressure was reduced to $20 med upright(P a)$
and subsequently to $tilde.op 2 times 10^(- 3) med upright(P a)$ before
stabilization.

Crystal growth proceeded from a $chevron.l 100 chevron.r$ seed. Boules
(8--8.5~cm diameter) were pulled at $40 med upright(m m \/ h)$ during
necking and $22 med upright(m m \/ h)$ during body growth in 5N H$""_2$.
An initial Dash neck suppressed dislocations, followed by
constant-diameter growth and a tapered
tail-off@dash1958method@bhattarai2024crystals. The crystals were cooled
over a 10~h controlled cycle and removed for characterization.

== Sample Thinning and Surface Preparation
<sample-thinning-and-surface-preparation>
Samples were thinned using sequential mechanical and chemical
processing. Wafers were first sliced using a diamond wire saw and
mechanically lapped to approximately $300 med mu upright(m)$. Coarse and
fine planarization were performed with 10~µm and 5~µm Al$""_2$O$""_3$
abrasives to achieve a uniform surface.

Final thickness control was obtained by iterative wet chemical etching
in HF:HNO$""_3$ (1:6), which provides uniform material removal with
minimal subsurface damage for HPGe@bhattarai2024crystals. During
etching, each sample was mounted on a PTFE base using Crystalbond wax,
which provided mechanical support and resistance to HF. A representative
mounting configuration is shown in Fig.~#link(<fig:sample_photo>)[1].

#figure(image("source/Gesample.png", width: 100%),
  caption: [
    Representative HPGe sample mounted on a PTFE base using Crystalbond
    wax for mechanical stability and HF resistance during thinning.
  ]
)
<fig:sample_photo>

After each etching cycle, samples were rinsed in DI water, dried under
nitrogen, and demounted for inspection. Optical microscopy verified the
absence of pits or etch-induced defects at the resolution limit, and
stylus profilometry confirmed the thickness with a typical uncertainty
of $plus.minus 1 med mu upright(m)$. This protocol reproducibly produced
samples ranging from the bulk scale $2.7 med upright(m m)$ down to
$7 med mu upright(m)$ without detectable surface deterioration relative
to as-grown detector-grade material@bhattarai2024crystals.

== Thickness Determination
<thickness-determination>
The thickness of each sample was determined using the
mass--density--area method. Prior to each thinning step, the sample was
cut to a known area ($A approx 1 med upright(c m^2)$). After each
controlled acid etch, the sample was rinsed, dried, and the remaining
mass ($m$) was measured using a 0.1~mg precision balance. Using the
density of Ge ($rho = 5.323 med upright(g \/ c m^3)$), the instantaneous
thickness after each etch was computed as: #math.equation(block: true, numbering: _ => [(2)], $ t = frac(m, rho A) . $) This
approach provided sub-micrometer accuracy throughout the sequential
thinning process and was cross-validated against profilometry
measurements.

== Electrical Transport Measurements
<electrical-transport-measurements>
Room-temperature ($295 med upright(K)$) charge-transport measurements
were performed using the Van der Pauw Hall-effect method on an Ecopia
HMS-3000 system. Four indium-based ohmic contacts were placed at the
corners of each HPGe specimen to ensure uniform current distribution and
low contact resistance. A representative sample mounted on the carrier
board is shown in Fig.~#link(<fig:vdp_setup>)[2].

#figure(image("source/carrier.jpeg", width: 75.0%),
  caption: [
    HPGe sample mounted in a Van der Pauw geometry with four indium
    corner contacts.
  ]
)
<fig:vdp_setup>

During each measurement, a constant excitation current
($1$--$200 med mu upright(A)$) was applied while a perpendicular
magnetic field up to $0.58 med upright(T)$ was swept. The transverse
Hall voltage $V_H$ and the longitudinal voltage $V_x$ were recorded
simultaneously, allowing for the determination of resistivity, carrier
density, and Hall mobility. The measurement configuration is illustrated
in Fig.~#link(<fig:hall_scheme>)[3].

#figure(hall-geometry(), kind: image,
  caption: [
    Hall-effect measurement geometry. A current $I_x$ flows along the
    $x$-direction under a perpendicular magnetic field $B_z$, producing
    a transverse Hall voltage $V_H$.
  ]
)
<fig:hall_scheme>

Ohmic behavior and the absence of self-heating were verified by checking
that $V_x$ was linear in $I_x$ and that the extracted mobility and
carrier concentration were independent of current within experimental
uncertainty over the range ($1$--$200 med mu upright(A)$). The
resistivity is given by #math.equation(block: true, numbering: _ => [(3)], $ rho = R_s thin t \, $) where $R_s$ is the sheet
resistance obtained from the Van der Pauw relation and $t$ is the
measured sample thickness. The Hall voltage satisfies
#math.equation(block: true, numbering: _ => [(4)], $ V_H = - thin frac(I_x B_z, n q thin t) \, $) <eq:VH> where $q$ is the
elementary charge and $n$ is the carrier concentration. The Hall
mobility is obtained from
#math.equation(block: true, numbering: _ => [(5)], $ mu = frac(1, q n rho) = frac(\| V_H \| thin t, I_x B_z thin rho) \, $) <eq:mu>
and the corresponding carrier concentration follows as
#math.equation(block: true, numbering: _ => [(6)], $ n = - thin frac(I_x B_z, q thin t thin V_H) . $) <eq:n>

The overall uncertainty in the extracted transport parameters is within
$plus.minus 1 %$, and it is dominated by geometric variations in contact
placement and instrument precision. Each mobility value represents the
average of at least three independent measurement runs at both
magnetic-field polarities to ensure reproducibility.

== Modeling and Data Analysis
<modeling-and-data-analysis>
The experimentally measured mobility was fitted using the
extended-exponential function in
Eq.~#link(<eq:extended-exponential>)[(1)]. The
extracted characteristic length $tau$ was then compared with the Debye
screening length($lambda_D$),
#math.equation(block: true, numbering: _ => [(7)], $ lambda_D = sqrt(frac(epsilon k_B T, q^2 N_(upright(e f f)))) \, $)
where $N_(upright(e f f))$ is the Hall-extracted effective impurity
concentration, and with the zero-temperature depletion width $W_0$
obtained from the electrostatic model discussed in Sec.~#link(<sec:results>)[III].

To benchmark the empirical model, the fitted results were compared with
two classical limits: (i) the Fuchs--Sondheimer surface-scattering
model, and (ii) a depletion-only electrostatic model with a
field-dependent conducting thickness. Consistent with the data, FS
scattering produced negligible thickness dependence, while the depletion
model reproduced the dominant observed trend and bounded the fitted
values of $tau$. All visualizations were created using
`Matplotlib`@matplotlib. Uncertainties were propagated using standard
Gaussian error propagation, and best-fit parameter errors were obtained
from the covariance matrix returned by the fitting routine.

= Results
<sec:results>
== Characteristic Electrostatic and Transport Scales
<characteristic-electrostatic-and-transport-scales>
The characteristic electrostatic and transport length scales that
control thickness-dependent mobility in HPGe are summarized in
Table~#link(<tab:params-compact>)[I] and plotted in Fig.~#link(<fig:lengths>)[4] for all
USD-grown samples (P,Q,R,S,X, and Y). Together, they establish a
consistent physical hierarchy that constrains how the effective
conducting channel evolves as the crystal is thinned.

#block[
#figure(
  align(center)[#table(
    columns: 4,
    align: (left,center,center,center,),
    table.header([#strong[Model / Scale]], [#strong[Governing
      expression]], [#strong[Representative inputs]], [#strong[Value /
      Interpretation]],),
    table.hline(),
    [Debye length,
    $lambda_D$], [$lambda_D = sqrt(frac(epsilon k_B T, q^2 n))$], [$epsilon_r = 16.2$,
    $T = 295$~K,
    $n = \( 5 upright("–") 133 \) #h(-1em) times #h(-1em) 10^10$~cm$""^(- 3)$], [$lambda_D = 4 upright("–") 21 med mu$m
    (decreases with $N_(upright(e f f))$)],
    [Surface depletion width,
    $W_0$], [$W_0 = sqrt(frac(2 epsilon \( V_(b i) - V \), q N))$], [$\( V_(b i) - V \) = 0.1 upright("–") 0.3$~V,
    $N = \( 5 upright("–") 133 \) #h(-1em) times #h(-1em) 10^10$~cm$""^(- 3)$], [$W_0 = 14 upright("–") 73 med mu$m;
    always $> lambda_D$],
    [Mean free path,
    $lambda_(upright(m f p))$], [$lambda_(upright(m f p)) = frac(mu_0 m^(*) v_(t h), q)$], [$mu_0 = 1900 med upright("cm")^2 #h(-1em) \/ #h(-1em) upright("V·s")$,
    $m_e^(*) = 0.12 thin m_0$], [$lambda_(upright(m f p)) approx 44$~nm
    (phonon-limited)],
    [Empirical mobility fit
    (holes)], [$mu \( t \) = mu_0 \[ 1 - e^(- \( t \/ tau \)^beta) \]$], [$mu_0 = 1899.1 med upright("cm")^2 #h(-1em) \/ #h(-1em) upright("V·s")$,
    $tau = 40.4 med mu$m, $beta = 1.12$], [$tau > lambda_D$],
    [Empirical mobility fit
    (electrons)], [$mu \( t \) = mu_0 \[ 1 - e^(- \( t \/ tau \)^beta) \]$], [$mu_0 = 2349.2 med upright("cm")^2 #h(-1em) \/ #h(-1em) upright("V·s")$,
    $tau = 24.6 med mu$m, $beta = 0.59$], [$tau > lambda_D$],
    [Fuchs--Sondheimer
    scattering], [$mu \( t \) #h(-1em) approx #h(-1em) mu_0 \[ 1 - frac(3 lambda_(upright(m f p)), 8 t) \( 1 - p \) \]$], [$p in \[ 0 \, 1 \]$
    (specularity factor)], [Negligible for $t > 10 med mu$m],
  )]
  , kind: table
  ) <tab:params-compact>

]
The Debye screening length ranges from $4$--$21 med mu$m across the
measured impurity concentrations
($5$--$133 \) times 10^10 med upright(c m^(- 3))$, decreasing
systematically with increasing doping. The surface depletion width
($W_0$) spans $14$--$73 med mu$m over the same range, consistent with
typical Ge surface band bending of $0.1$--$0.3$~V. For all samples
$W_0 > lambda_D$, indicating that surface electric fields penetrate
deeply into the crystal and can significantly reduce the electrically
active thickness. By contrast, the phonon-limited mean free path is only
$lambda_(upright(m f p)) approx 44 med upright(n m)$, more than three
orders of magnitude smaller than the thinnest specimen. Thus, diffuse
boundary scattering cannot account for the observed mobility
suppression; the condition $t \/ lambda_(upright(m f p)) gt.double 100$
holds for every sample, placing the system firmly in the bulk-scattering
regime.

#figure(image("source/l_plot.png", width: 100%),
  caption: [
    Electrostatic and transport length scales for USD-grown HPGe samples
    (P,Q,R,S,X, and Y). Symbols denote the Debye length ($lambda_D$),
    depletion width ($W_0$), and fitted mobility characteristic length
    ($tau$). Blue (top axis) and red (bottom axis) scales correspond to
    $lambda_D$ and $W_0$. Linear fits quantify how the characteristic
    length $tau$ tracks the electrostatic scales across all samples.
  ]
)
<fig:lengths>

Across the full set of samples, the fitted characteristic length $tau$
obeys the hierarchy
#math.equation(block: true, numbering: _ => [(8)], $ lambda_(upright(m f p)) lt.double lambda_D < tau lt.tilde W_0 \, $) <eq:hierarchy>
showing that the mobility crossover is governed by electrostatic
constraints rather than by boundary scattering. A key result of
Fig.~#link(<fig:lengths>)[4] is that $tau$ exhibits approximately linear
correlations with both $lambda_D$ and $W_0$.

#heading(level: 4, numbering: none)[a. Linear trend between $tau$ and
$lambda_D$:]
<a.-linear-trend-between-tau-and-lambda_d>
A global linear fit for samples (P, Q, R, S, X, and Y) yields
$ frac(d tau, d lambda_D) approx 2.55 \, $ so that $tau$ increases more
than twice as fast as the Debye length. This indicates that the mobility
recovery with thickness is strongly screening-driven: as $lambda_D$
increases (weaker doping), the surface potential extends further into
the bulk and the effective conducting thickness expands accordingly. The
slope greater than one implies that $tau$ is influenced not only by
screening but also by the gradual relaxation of the depletion field.

#heading(level: 4, numbering: none)[b. Linear trend between $tau$ and
$W_0$:]
<b.-linear-trend-between-tau-and-w_0>
A second linear trend appears between $tau$ and the depletion width,
with a smaller slope, $ frac(d tau, d W_0) approx 0.74 . $ Here $tau$
grows more slowly than the total depleted region, which shows that only
a portion of the depletion layer participates in conduction. The
characteristic length $tau$ therefore probes a partially depleted,
partially screened channel rather than the full depletion width.

#heading(level: 4, numbering: none)[c. Interpretation of slope ratio:]
<c.-interpretation-of-slope-ratio>
The ratio
$ frac(\( d tau \/ d lambda_D \), \( d tau \/ d W_0 \)) approx 3.44 $
demonstrates that $tau$ responds 3.4 times more strongly to changes in
the Debye length than to changes in the depletion width. In other words,
the mobility crossover is controlled primarily by long-range screening
rather than by the absolute size of the depleted region. The persistent
ordering $lambda_D < tau < W_0$ indicates that $tau$ marks the depth at
which surface fields substantially distort the potential, but not
necessarily the depth of full depletion.

Taken together, these trends identify $tau$ as an electrostatic
thickness scale that interpolates smoothly between screening-controlled
and depletion-controlled limits. Its magnitude and scaling behavior
provide the physical basis for the extended-exponential mobility law
used in the following subsections and for the design rule
$t gt.tilde 3 tau$ that preserves near-bulk mobility.

== Thickness-Dependent Mobility Behavior
<thickness-dependent-mobility-behavior>
Figures~#link(<fig:mobility_hole>)[5] and~#link(<fig:mobility_electron>)[6] show the measured
hole and electron mobilities as a function of crystal thickness for all
USD-grown samples. In the bulk regime ($t > 100 med mu$m), both carrier
types asymptotically approach their intrinsic room-temperature limits,
$ mu_(0 \, h) approx 1.899 times 10^3 med upright(c m^2 \/ V thin . s) \, #h(2em) mu_(0 \, e) approx 2.349 times 10^3 med upright(c m^2 \/ V thin . s) \, $
consistent with established benchmarks for ultrapure
Ge@jacoboni1983electronic@nakano2020ultra@panth2020characterization. In
this regime, carrier motion is dominated by phonon scattering and is
essentially independent of thickness.

Below $t approx 100 med mu$m, the mobility decreases sharply as the
electrically active thickness becomes comparable to the electrostatic
screening length. This suppression originates from the reduction of the
undepleted channel thickness by long-range surface fields, band bending,
and Coulomb scattering associated with near-surface space-charge
regions.

#figure(image("source/PQRS.png", width: 100%),
  caption: [
    Hole mobility for USD-grown p-type HPGe Samples (P,Q,R, and S).
    Symbols: measured data ($plus.minus 1 %$). Colored curves:
    individual extended-exponential fits. Black curve: global fit. All
    samples exhibit a smooth crossover from thin, screening-limited
    transport to bulk-like behavior.
  ]
)
<fig:mobility_hole>

The extended-exponential model reproduces the mobility data for all
samples with $R^2 > 0.92$. For holes (Samples P, Q, R, and S), the
global best-fit parameters are
$mu_0 = 1899.1 med upright(c m^2 \/ V thin . s)$,
$tau_h = 40.4 med mu$m, and $beta_h = 1.12$. For electrons (X, Y), the
corresponding values are
$mu_0 = 2349.2 med upright(c m^2 \/ V thin . s)$,
$tau_e = 24.6 med mu$m, and $beta_e = 0.59$. The smaller $tau_e$ and
$beta_e$ reflect shorter screening lengths and weaker band-structure
sensitivity of the conduction band, consistent with the reduced
thickness sensitivity of electron transport.

Across all samples, the similarity between $tau$ and the calculated
Debye length $lambda_D$ confirms that the mobility crossover is governed
primarily by electrostatic depletion rather than interface roughness or
boundary scattering. In practical terms, keeping $t$ several times
larger than $tau$ ensures that the mobility remains within a few percent
of its bulk value.

#figure(image("source/XY.png", width: 100%),
  caption: [
    Electron mobility for USD-grown n-type HPGe Samples (X, and Y).
    Symbols: measured data. Black curve: global extended-exponential
    fit.
  ]
)
<fig:mobility_electron>

== Model Validation
<model-validation>
The extended-exponential description was benchmarked against two
classical limiting cases: (i) a Fuchs--Sondheimer (FS-only)
boundary-scattering model, and (ii) a depletion-only electrostatic
model. Figures~#link(<fig:hole_model>)[7] and~#link(<fig:electron_model>)[8] show these
comparisons.

#figure(image("source/PQRSmodel.png", width: 100%),
  caption: [
    Model comparison for p-type mobility of samples (P, Q, R, and S).
    The FS-only model (red dashed) predicts almost thickness-independent
    mobility. The depletion-only model (green) captures the qualitative
    trend but misses the curvature at small thickness. The
    extended-exponential model (blue solid) yields minimal,
    structureless residuals (inset).
  ]
)
<fig:hole_model>

For thick samples ($t gt.tilde 100 med mu$m), all models converge to the
same bulk limit. As thickness decreases, the FS-only model fails
completely: because $lambda_(upright(m f p))$ is so short, it predicts
only a weak, nearly linear correction that cannot reproduce the strong
mobility suppression. The depletion-only model produces the correct
qualitative trend but systematically underestimates the steep curvature
of the experimental roll-off, especially in the $t lt.tilde 50 med mu$m
regime. The extended-exponential model, by contrast, matches the data
across the full thickness range with small, non systematic residuals.
The fitted values of $tau_h$ and $tau_e$ lie between $lambda_D$ and
$W_0$, in agreement with the hierarchy in
Eq.~#link(<eq:hierarchy>)[(8)] and Fig.~#link(<fig:lengths>)[4]. This
confirms that the mobility suppression in HPGe is governed by
electrostatic depletion of the active layer rather than by boundary
scattering.

#figure(image("source/XYmodel.png", width: 100%),
  caption: [
    Model comparison for electron mobility of samples (X, and Y). Only
    the extended-exponential model captures both the high-$t$ saturation
    and steep low-$t$ suppression, with small residuals (inset).
  ]
)
<fig:electron_model>

Overall, these results show that a single compact functional form
captures the electrostatically controlled crossover from
depletion-limited to bulk-like transport in HPGe. The parameters $mu_0$,
$tau$, and $beta$ provide a physically meaningful and device-ready
parametrization for mobility engineering in ultrathin Ge detectors and
electronic or quantum devices.

= Discussion
<discussion>
The measured thickness-dependent mobilities establish a clear transition
in high-purity Ge from bulk, phonon-limited transport to an
electrostatically confined conduction regime at $T = 295$~K. In the
thick-sample limit ($t gt.tilde 100 med mu$m), the extracted mobilities,
$mu_(0 \, h) approx 1.899 times 10^3$~cm$""^2$/V .s and
$mu_(0 \, e) approx 2.349 times 10^3$~cm$""^2$/V .s, agree with
well-established intrinsic
values@jacoboni1983electronic@fischetti1996band@panth2020characterization,
confirming that carrier momentum relaxation is dominated by acoustic and
optical phonons when the thickness greatly exceeds all microscopic
length scales.

A central result of this study is that the sharp mobility suppression
observed for $t < 100 med mu$m cannot be attributed to classical diffuse
boundary scattering. The phonon-limited mean free path,
$lambda_(upright(m f p)) approx 44$~nm, remains more than three orders
of magnitude smaller than the thinnest samples. Consequently, all
specimens lie well outside the geometric-confinement regime in which the
Fuchs--Sondheimer (FS) model is applicable. This explains the failure of
the FS-only prediction in Figs.~#link(<fig:mobility_hole>)[5]?#link(<fig:electron_model>)[8],
which incorrectly yields an almost thickness-independent mobility.

Instead, the mobility crossover is governed by electrostatic effects.
The characteristic lengths extracted from the extended-exponential fits,
$tau_h approx 40.4 med mu$m and $tau_e approx 24.6 med mu$m, fall
between the Debye screening length $lambda_D$ and the depletion width
$W_0$, obeying
$ lambda_(upright(m f p)) lt.double lambda_D < tau lt.tilde W_0 . $ This
hierarchy directly links the mobility roll-off to long-range surface
electric fields, which reduce the undepleted channel thickness and
constrain the volume available for current flow. The linear trends in
Fig.~#link(<fig:lengths>)[4] further quantify this behavior: $tau$ increases with
$lambda_D$ with a slope larger than 2, indicating that mobility recovery
is strongly controlled by electrostatic screening, while its weaker
dependence on $W_0$ reflects the partial, but not complete, occupation
of the depletion region by mobile carriers.

The fitted exponents ($beta_h = 1.12$, $beta_e = 0.59$) capture the
distinct band-structure responses of holes and electrons. The sublinear
$beta_e$ reflects the weaker nonparabolicity and anisotropy of the Ge
conduction band, while $beta_h > 1$ is consistent with the strongly
warped valence band and its enhanced sensitivity to electrostatic
confinement@luttinger1956quantum@bir1974symmetry. Although these
parameters are extracted from micrometer-scale samples, where
quantum-well subband formation is absent, the pair $\( tau \, beta \)$
provides an effective, coarse-grained description of how band structure
and electrostatics jointly shape the thickness dependence of mobility at
room temperature.

== Extrapolation toward the nanoscale limit
<extrapolation-toward-the-nanoscale-limit>
While chemical--mechanical thinning cannot reliably produce
nanometer-thick HPGe layers with atomically smooth surfaces, the
experimentally observed trends allow a physically grounded extrapolation
toward the nanoscale. The strong correlation between $tau$ and
$lambda_D$ for lightly doped samples (P, Q, R, and S) implies that
reducing the thickness into the few-tens-of-nanometers range would place
the entire film within the electrostatic screening region; in this
limit, mobility is dictated directly by the surface potential profile
and should fall rapidly as $t$ approaches $lambda_D$.

For the more heavily doped samples (X, and Y), the weaker $tau$--$W_0$
slope shows that the conduction channel is already highly compressed by
the surface-space-charge field. As $t$ approaches the mean free path
($t tilde.op lambda_(upright(m f p))$), surface-scattering mechanisms,
negligible at micrometer thickness, are expected to become dominant,
leading to a transition toward boundary-limited transport consistent
with ultrathin Ge films and Ge-on-insulator
structures@nakatsuka2019enhanced@imajo2021strain. In this sense, the
present results bridge the regime where electrostatic confinement
dominates (micrometer-scale HPGe) and the regime where both
electrostatics and surface scattering control mobility in truly
nanoscale Ge. A full treatment of the low-temperature case, where mean
free paths become longer and additional decoherence channels appear, is
left for future work.

== Device implications
<device-implications>
These findings have direct consequences for HPGe detectors, thin-film
electronics, and quantum devices. For low-threshold radiation detectors,
thinning below a few times the characteristic length $tau$ significantly
reduces mobility, increasing carrier transit time and electronic noise.
Maintaining the active thickness in the regime $t gt.tilde 3 tau$
preserves most of the bulk mobility, whereas devices with
$t lt.tilde tau$ operate in a depletion-controlled regime with sharply
degraded transport. In practice, this can be addressed by keeping
critical drift regions thicker than the electrostatic scale or by
mitigating surface fields through passivation, dielectric engineering,
and optimized contact geometries.

For emerging nanoscale Ge-based platforms, including phonon-coupled
quantum sensors and Ge qubits, the results show that impurity control
alone is insufficient: precise engineering of the surface potential and
depletion geometry is essential to prevent severe mobility loss at
reduced dimensions. The parameters $\( mu_0 \, tau \, beta \)$ extracted
here thus serve as a compact, device-level design rule for estimating
mobility penalties in the thinned Ge under realistic electrostatic
conditions.

In summary, this work establishes a quantitative and physically grounded
framework linking Debye screening, depletion geometry, and
thickness-dependent mobility in HPGe at room temperature. By connecting
the parameters of the extended-exponential model to fundamental
electrostatic scales, we provide a compact description of the transition
from bulk phonon-limited transport to electrostatically confined
conduction. These insights inform the optimization of Ge-based detectors
and ultrathin semiconductor devices that operate at the boundary between
bulk and mesoscale physics and provide a starting point for future
extensions to cryogenic operation and quantum architectures.

= Conclusion
<conclusion>
We have experimentally established the thickness dependence of
charge-carrier mobility in HPGe over a wide range of micrometer-scale
thicknesses at room temperature. The data reveal a clear transition from
bulk, phonon-limited transport to an electrostatically confined
conduction regime as the crystal is thinned. The measured mobilities
cannot be described by classical diffuse boundary scattering: the
phonon-limited mean free path remains orders of magnitude smaller than
the physical thickness for all samples. Instead, the characteristic
lengths extracted from an extended-exponential model satisfy
$ lambda_(upright(m f p)) lt.double lambda_D < tau lt.tilde W_0 \, $
demonstrating that mobility suppression is governed primarily by Debye
screening and surface depletion rather than geometric confinement.

The strong linear correlation between $tau$ and $lambda_D$ in lightly
doped samples, together with the weaker $tau$--$W_0$ relation in more
heavily doped material, quantifies how the effective conducting channel
evolves with doping and surface band bending. These trends show that the
mobility crossover reflects the depth of the electrostatic perturbation
into the crystal rather than interface roughness. The fitted exponents
$\( beta_h \, beta_e \)$ further encode the distinct valence- and
conduction-band responses to electrostatic confinement and provide an
effective, band-structure-aware description of thickness-dependent
transport.

Although our measurements are confined to the micrometer regime, the
observed hierarchy of length scales provides a physically grounded path
to extrapolate toward nanoscale Ge. As thickness approaches tens of
nanometers, the conducting volume becomes fully confined within the
screening region and transport is expected to evolve from purely
electrostatic limitation toward a regime where surface scattering also
contributes significantly, consistent with behavior reported in
epitaxial and Ge-on-insulator ultrathin films. Extending this framework
to cryogenic temperatures, where mean free paths and additional
decoherence channels change, is a natural direction for future work.

Overall, this study provides a compact, quantitative framework
connecting Debye screening, depletion geometry, and thickness-dependent
mobility in HPGe. The extended-exponential model, with parameters
$\( mu_0 \, tau \, beta \)$ tied to fundamental electrostatic scales,
offers a physically meaningful parametrization of transport from bulk to
mesoscale dimensions and a practical design rule: maintaining
$t gt.tilde 3 tau$ preserves near-bulk mobility, while $t lt.tilde tau$
pushes devices into a depletion-controlled regime. These insights
directly inform the optimization of Ge-based radiation detectors,
thin-film electronics, and emerging quantum-sensitive devices that must
maintain high mobility in confined geometries.

#heading(level: 1, numbering: none)[Author Contributions]
<author-contributions>
N.~Budhathoki performed sample fabrication, surface processing,
Hall-effect measurements, data analysis, and manuscript preparation.
D.-M.~Mei provided conceptual guidance, supervision, and theoretical
interpretation. S.~Bhattarai, S.~Chhetri, K.~Dong, S.~Panamaldeniya,
A.~Prem, and A.~Warren contributed to crystal growth and material
preparation.

#heading(level: 1, numbering: none)[Acknowledgments]
<acknowledgments>
This work was supported in part by the National Science Foundation (NSF)
under Grants No.~NSF OISE-1743790, NSF PHYS 2117774, NSF OIA 2427805,
NSF PHYS-2310027, and NSF OIA-2437416, and by the U.S. Department of
Energy (DOE) under Grants No.~DE-SC0024519 and DE-SC0004768. Additional
support was provided by a research center funded by the State of South
Dakota.

#heading(level: 1, numbering: none)[Data Availability]
<data-availability>
The data that support the findings of this study are available from the
corresponding author upon reasonable request.




#bibliography("source/name1.bib", style: "american-physics-society")
