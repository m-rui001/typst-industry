// Typst format conversion of arXiv:2512.10162v1 under CC BY 4.0.
#set page(paper: "a4", margin: 20mm, numbering: "1")
#set text(font: "Libertinus Serif", size: 10.5pt)
#set par(justify: true)
#set heading(numbering: "1.1")
#set math.equation(numbering: "(1)")
#align(center)[
  #text(size: 16pt, weight: "bold")[Solid-state laser cooling]
  #v(5pt)
  Yang Ding#super[1], Shenghao Zhang#super[1], Alexander R. Albrecht#super[2], Zhaojie Feng#super[3], Lars Forberger#super[3], Hiroki Tanaka#super[4], Markus P. Hehlen#super[5], Galina Nemova#super[6], Peter J. Pauzauskie#super[3], Denis V. Seletskiy#super[2,6], Masaru Kuno#super[1,7]

  #super[1] Department of Chemistry and Biochemistry, University of Notre Dame, Notre Dame, IN 46556, USA \
  #super[2] Department of Physics and Astronomy, University of New Mexico, Albuquerque, NM 87131, USA \
  #super[3] Department of Materials Science, University of Washington, Seattle, Washington 98195, USA \
  #super[4] Leibniz-Institut für Kristallzüchtung (IKZ), Max-Born-Str. 2, 12489 Berlin, Germany \
  #super[5] Los Alamos National Laboratory, P.O. Box 1663, Los Alamos, NM, 87545, USA \
  #super[6] Department of Engineering Physics, Polytechnique Montréal, Montréal, QC, H3T 1J4, Canada \
  #super[7] University of Notre Dame, Department of Physics and Astronomy, Notre Dame, IN 46556, USA

  #link("https://arxiv.org/abs/2512.10162v1")[arXiv:2512.10162v1] ? #link("https://creativecommons.org/licenses/by/4.0/")[CC BY 4.0]
]

#heading(level: 1, numbering: none)[Abstract]
<abstract>
#counter(heading).update(0)
Since the first proof-of-concept demonstrations of
photoluminescence-based optical refrigeration, solid-state laser cooling
has developed into a credible competitor to conventional cryogenic
technologies. Solid-state laser cooling continues to advance as new
materials push cooling limits. These developments have created a need to
consolidate progress made to date as well as standardize critical
experimental considerations needed for reliable and verifiable cooling
measurements. This primer therefore outlines essential concepts and
requirements, which underpin solid-state laser cooling. The primer
summarizes key milestones achieved with cooling-grade, rare-earth-doped
glasses and crystals as well as with semiconductors. It additionally
highlights emerging applications of solid-state optical refrigeration.
To strengthen the consistency and reproducibility of cooling results
going forward, two reporting checklists are introduced. They cover
materials, cooling metrics, and thermometry. This primer is intended to
serve as both a tutorial and a practical reference for incoming and
existing researchers involved in solid-state laser-cooling.

= Introduction
<introduction>
Nearly sixty years before atomic gases were Doppler cooled, Peter
Pringsheim proposed a conceptually simple way to cool matter using
photoluminescence (PL).@pringsheim1929zwei In his gedanken experiment,
Pringsheim posited that filtered
($""^2$P$""_(1 / 2) arrow.r^2$S$""_(1 / 2)$, 589.952
nm@risberg1956revision) emission from a sodium vapor lamp could be used
to excite electrons in a neighboring Na vapor from their
$""^2 upright("S")_(1 / 2)$ ground level to their first
$""^2$P$""_(1 / 2)$ excited level. Inelastic collisions in the gas would
then excite some of the electrons from the first $""^2$P$""_(1 / 2)$
excited level to a second excited $""^2$P$""_(3 / 2)$ level from where
electrons relaxing from $""^2$P$""_(3 / 2)$ to $""^2$S$""_(1 / 2)$ would
emit higher energy/shorter wavelength (588.995 nm@risberg1956revision),
PL. Because their emission possessed an energy greater than that
initially absorbed, energy would be removed from the Na vapor. Based on
the $""^2$P$""_(3 / 2)$-$""^2$P$""_(1 / 2)$ level splitting,
approximately 3 meV of translational energy would be removed per
absorbed/emitted photon. In this way, Pringsheim envisioned how
photoluminescence up-conversion could induce refrigeration. Of note is
the broader applicability of Pringsheim's concept to cooling condensed
phases.

In 1945, Vavilov called into question Pringsheim's idea, arguing that
the concept violated a heat engine's Carnot efficiency.@vavilov1945some
The ensuing debate@pringsheim1946some@vavilov1946photoluminescence was
settled by Lev Landau in 1946 when he demonstrated that Pringsheim's PL
cooling did not violate the Second Law of
thermodynamics.@landau1946thermodynamics To do this, he considered the
entropy of a radiation field based on Bose-Einstein statistics applied
to a photon gas. Landau established that radiation's entropy is a
function of its angle of propagation and its frequency bandwidth. So
long as the increase in radiation entropy exceeded the cooling
specimen's entropy decrease, there was no violation of the Second Law.

Nearly seven decades later, Epstein and co-workers provided experimental
proof-of-concept by cooling a rare earth (RE#super[3+])
Yb$""^(3 +)$-doped fluoride glass by 0.3 K below room
temperature.@epstein1995observation Two decades later,
Yb$""^(3 +)$-doped fluoride crystals were cooled to cryogenic
temperatures.@seletskiy2010laser@melgaard2016solid Today, 70 K is within
reach and temperatures as low as 50 K are predicted for next generation
RE#super[3+]-doped crystals, which exhibit 10-fold improvements in
purity.@seletskiy2010laser@seletskiy2011spie@volpi2019optical

RE#super[3+] laser cooling has now become a serious competitor to
conventional, cryogenic cooling technologies. It offers all-optical,
vibration-free cooling in a miniaturaizable format. Case uses include
next-generation metrology and sensing applications. RE#super[3+] optical
refrigeration, however, is not without its limitations.
RE#super[3+]-doped cooling materials possess global minimum achievable
temperatures (gMATs) that result from the thermal depopulation of
RE#super[3+] ground state multiplets as well as from background
absorption-induced heating from impurities. Both ultimately limit how
low RE#super[3+] materials can be cooled.

In the ongoing push to reach lower optical refrigeration temperatures,
new cooling materials are needed. Significant attention has therefore
shifted to demonstrating semiconductor optical refrigeration. This has
been spurred by calculated semiconductor laser cooling floors as low as
10 K and by their ready integration into electronic and optical devices.

This primer develops core concepts underlying photoluminescence-based,
optical refrigeration. It provides key material and experimental design
considerations. It also points to available opportunities where future
frontier studies can push current laser cooling limits. In what follows,
#strong[@section:experimentation] discusses materials and key
relationships that dictate cooling as well as light sources best suited
to realizing solid-state optical refrigeration. #strong[Section
@section:results] presents recent laser cooling advances in
RE#super[3+]-doped solids and semiconductors. #strong[Section
@section:applications] is devoted to applications, focusing on optical
cryocoolers, radiation-balanced lasers, and uses in metrology. Because
solid-state laser cooling results are sensitive to small variations in
material quality, optical coupling, heat management, and thermometry,
#strong[@section:reproducibility] discusses reproducibility and
data deposition standards. #strong[@section:limitations]
describes current limitations of solid state laser cooling that remain
open challenges for the field. #strong[@section:outlook]
concludes with an outlook.

= Experimentation
<section:experimentation>
== Key cooling constraints that dictate material selection and experimental conditions
<subsect:cooling_formulas>
To undergo optical refrigeration, both material and experimental
conditions must ensure a net positive cooling power density,
$P_(upright("cool"))$ (W cm$""^(- 3)$). $P_(upright("cool"))$ arises
within the context of competing absorbed and emitted power densities,
#emph[i.e.],
$P_(upright("cool")) = P_(upright("em")) - P_(upright("abs"))$ with
$P_(upright("abs")) = (alpha + alpha_(upright("b"))) I_(upright("exc"))$
the absorbed, incident laser power density (W cm$""^(- 3)$, red and
green waves, #strong[@fig:Figure_1]), $alpha$ the material's
absorption coefficient (cm$""^(- 1)$) at wavelength
$lambda_(upright("exc"))$ (nm), $alpha_(upright("b"))$ an absorption
coefficient due to the existence of a background absorption that results
in heating, and $I_(upright("exc"))$, an incident laser excitation
intensity (W cm$""^(- 2)$). In the absence of non-linear processes,
#emph[e.g.], for RE$""^(3 +)$ ion ensembles excited well below
saturation, total absorbed powers ($P_(upright("abs,tot"))$, W) can be
approximated by multiplying $P_(upright("abs"))$ with the specimen's
illuminated volume. $P_(upright("abs,tot"))$ is also obtained as the
product of the specimen absorptance, $A \( lambda_(upright(e x c)) \)$
and the incident excitation power $P_(upright("exc"))$ (W), #emph[i.e.],
$P_(upright("abs,tot")) = A \( lambda_(upright(e x c)) \) P_(upright("exc"))$.

An accompanying, emitted PL power density is
$P_(upright("em")) = (eta_(upright("EQE")) eta_(upright("abs")) lambda_(upright("exc")) / macron(lambda)_(upright("em"))) P_(upright("abs"))$
where $macron(lambda)_(upright("em"))$ is the mean emission wavelength
(yellow and blue waves, #strong[@fig:Figure_1]), and
$lambda_(upright("exc")) > macron(lambda)_(upright("em"))$ indicates the
anti-Stokes photoluminescence (ASPL) regime where laser cooling becomes
possible.
$eta_(upright("EQE")) = frac(eta_(upright("e")) W_(upright("r")), eta_(upright("e")) W_(upright("r")) + W_(upright("nr")))$
is the material's external quantum efficiency where $W_(upright("r"))$
and $W_(upright("nr"))$ are radiative (solid black downward arrows,
#strong[@fig:Figure_1]) and non-radiative (dashed red downward
arrows, #strong[@fig:Figure_1]) excited state decay rates,
$eta_(upright("e"))$ is a photon extraction efficiency, and
$eta_(upright("abs")) = frac(alpha, alpha + alpha_(upright("b")))$ is an
absorption efficiency. In some
studies@morozov2017defect@morozov2017photoluminescence@zhang2024resonant@abbas2025efficient@Zhang2025Principles,
$eta_(upright("abs"))$ is referred to as an up-conversion efficiency,
which describes the probability that a below-gap absorption event leads
to ASPL.

When $P_(upright("em"))$ and $P_(upright("abs"))$ are combined, the
following $P_(upright("cool"))$ expression results,
$ P_(upright("cool")) = (eta_(upright("EQE")) eta_(upright("abs")) lambda_(upright("exc")) / macron(lambda)_(upright("em")) - 1) P_(upright("abs")) . $<eqn:Pcool_equation_wavelength>
From this, a cooling efficiency, $eta_(upright("c"))$, emerges and is
$ eta_(upright("c")) = P_(upright("cool")) / P_(upright("abs")) = eta_(upright("EQE")) eta_(upright("abs")) lambda_(upright("exc")) / macron(lambda)_(upright("em")) - 1 . $<eqn:eta_cool_equation_wavelength>
Alternative expressions in terms of energies or frequencies are
$ P_(upright("cool")) = (eta_(upright("EQE")) eta_(upright("abs")) frac(macron(E)_(upright("em")), macron(E)_(upright("em")) - Delta E) - 1) P_(upright("abs")) = (eta_(upright("EQE")) eta_(upright("abs")) macron(nu)_(upright("em")) / nu_(upright("exc")) - 1) P_(upright("abs")) \, $<eqn:Pcool_equation_energy>
and
$ eta_(upright("c")) = eta_(upright("EQE")) eta_(upright("abs")) frac(macron(E)_(upright("em")), macron(E)_(upright("em")) - Delta E) - 1 = eta_(upright("EQE")) eta_(upright("abs")) macron(nu)_(upright("em")) / nu_(upright("exc")) - 1 $#label("eqn:eta_cool_equation energy")
with
$Delta E = macron(E)_(upright("em")) - E_(upright("exc")) = h macron(nu)_(upright("em")) - h nu_(upright("exc"))$
and with $macron(E)_(upright("em"))$ ($macron(nu)_(upright("em"))$) the
mean emission energy (frequency).

#figure(image("source/Figure_1.png", width: 75.0%),
  caption: [
    Schematic of laser cooling cycles in RE#super[3+]-doped
    glasses/crystals (left) and semiconductors (right).
  ]
)
<fig:Figure_1>

In all cases, cooling exists for $P_(upright("cool")) > 0$.
Alternatively stated, $eta_(upright("c"))$ must be positive. Both lead
to stringent requirements on material properties best seen when heating
and cooling powers are balanced, #emph[i.e.], $P_(upright("cool")) = 0$.
In short, cooling requires that
$eta_(upright("EQE")) eta_(upright("abs"))$ satisfy
$eta_(upright("EQE")) eta_(upright("abs")) > macron(lambda)_(upright("em")) / lambda_(upright("exc"))$.

To put this material constraint into focus, for a $Delta E = 25$ meV
$approx 202$ cm$""^(- 1)$ detuning of the laser excitation energy below
a mean emission energy of $macron(E)_(upright("em")) = 1.24$ eV
$= 10000$ cm$""^(- 1)$ ($macron(lambda)_(upright("em")) = 1000$ nm),
$eta_(upright("EQE")) eta_(upright("abs")) > 0.98$. Alternatively, for a
$Delta E = 100$ meV $approx 807$ cm$""^(- 1)$ detuning below a mean
emission energy of $macron(E)_(upright("em")) = 2.44$ eV $= 19679$
cm$""^(- 1)$ ($macron(lambda)_(upright("em")) = 508$ nm),
$eta_(upright("EQE")) eta_(upright("abs")) > 0.96$. In the best-case
scenario where $eta_(upright("abs")) = 1$, a critical (minimum) external
quantum yield (QY) required to cool is
$ eta_(upright("EQE,crit")) = 1 - frac(Delta E, macron(E)_(upright("em"))) . $<eqn:critical_qy>
Consequently, $eta_(upright("EQE,crit")) = 0.98$
($eta_(upright("EQE,crit")) = 0.96$) for the $Delta E = 25$ meV \[with
$macron(E)_(upright("em")) = 1.24$ eV\]($Delta E = 100$ meV, with
\[$macron(E)_(upright("em")) = 2.44$ eV\]) detuning example.

#strong[Equation @eqn:critical_qy] simultaneously illustrates how a
material's energy gap impacts its propensity to cool. For
$Delta E = 100$ meV, $eta_(upright("EQE,crit"))$ decreases from 0.96 to
0.92 when $macron(E)_(upright("em"))$ decreases from 2.44 eV to 1.24 eV.
This illustrates why materials with smaller $macron(E)_(upright("em"))$
are preferred for cooling since they relax $eta_(upright("EQE,crit"))$.
Even then, $eta_(upright("EQE,crit"))$-values for most systems exceed
0.95. #strong[@table:eta_EQE_crit] summarizes calculated
$eta_(upright("EQE,crit"))$-values at 300 K for various cooling
materials at two different laser detunings ($Delta E = 25$ meV and
$Delta E = 100$ meV). For both, $eta_(upright("abs")) = 1$ is assumed.

#block[
#block[
#figure(
  align(center)[#table(
    columns: 4,
    align: (center,center,center,center,),
    [Material], [$macron(E)_(upright("em"))$ (eV) at 300 K], [], [],
    [$Delta E = 25$ meV], [], [], [],
    [$Delta E = 100$ meV], [], [], [],
    [Yb$""^(3 +)$-doped], [1.23$plus.minus$0.02
    @bowman2000new], [0.979-0.980], [0.917-0.920],
    [Er$""^(3 +)$-doped], [0.805-2.13
    @condon2009optical@fernandez2006anti], [0.969-0.983], [0.876-0.931],
    [Tm$""^(3 +)$-doped], [0.678-0.692
    @hoyt2003laser@patterson2008anti@rostami2019tm@nobel2025optical], [0.963-0.964], [0.852-0.855],
    [Ho$""^(3 +)$-doped], [0.615
    @rostami2019observation], [0.959], [0.837],
    [], [1.65-1.91 @Imangholi2005_ELO], [0.985-0.987], [0.939-0.948],
    [CdSe nanocrystals], [1.97-2.38
    @qu2002control], [0.987-0.989], [0.949-0.958],
    [CsPbBr$""_3$ nanocrystals], [2.38-2.58
    @Brennan2017Origin], [0.989-0.990], [0.958-0.961],
  )]
  , caption: [$eta_(upright("EQE,crit"))$-values calculated from
  #strong[Equation @eqn:critical_qy] for cooling grade materials at 300
  K and in the limit that $eta_(upright("abs")) = 1$.]
  , kind: table
  ) <table:eta_EQE_crit>

]

]
Realistic modeling of $eta_(upright("c"))$ must take into account the
$nu$ and $T$ dependencies of $eta_(upright("EQE")) \( T \)$,
$eta_(upright("abs")) \( nu \, T \)$, and
$macron(nu)_(upright("em")) \( T \)$ in #strong[Equation
~#ref(label("eqn:eta_cool_equation energy"))]. Although
$eta_(upright("EQE")) \( T \)$ possesses a weak temperature
dependence@hoyt2003laser@hehlen2007model@seletskiy2016laser@puschel2021temperature,
which can often be ignored, $eta_(upright("abs"))$ and
$macron(nu)_(upright("em"))$ exhibit strong temperature dependencies
seen through exponentially decreasing $alpha$ with decreasing $T$ due to
the thermal depopulation of RE#super[3+] ground-state multiplets.
$eta_(upright("c"))$ therefore rapidly approaches zero with decreasing
temperature and eventually crosses over into a heating regime when
$eta_(upright("c")) < 0$. This crossover temperature is called the
minimum achievable temperature (MAT), which is a pump
frequency-dependent value, #emph[i.e.], MAT($nu$).

There also exists a unique pump frequency, $nu_(upright("opt"))$, where
a #emph[global] minimum achievable temperature (gMAT) exists across all
$nu$. Formally, gMAT is found by setting
$d eta_(upright("c")) \( nu \, T \) \/ d nu = 0$.@seletskiy2011oe In
practice, #strong[Equation ~#ref(label("eqn:eta_cool_equation energy"))]
can be used to calculate gMAT, provided that $alpha \( nu \, T \)$ and
$macron(nu)_(upright("em")) \( nu \, T \)$ are measured
independently.@seletskiy2013precise This is how gMAT-values of 190 K for
ZBLANP:Yb#super[3+] and 115 K for YLF:Yb#super[3+] have been
estimated.@seletskiy2011oe In either case, a frequency- and
temperature-independent $alpha_(upright("b"))$ has been assumed. Recent
cooling results from Yb#super[3+]/Tm#super[3+] co-doped crystals
moreover show that $alpha_(upright("b"))$'s temperature dependence must
be taken into account, particularly for $T < 100$
K.@hehlen2007model@volpi2019optical

=== RE#super[3+]-doped materials
<subsect:RE3_materials>
RE#super[3+] ion optical properties are governed by transitions between
electronic states of their partially filled 4#emph[f] orbitals. This
makes them attractive laser-cooling ions as their 4#emph[f] electrons
are shielded from the local environment by radially extended and filled
5#emph[s] and 5#emph[p]
orbitals.@joos1939@freed1940spectra@kastler1950quelques@hehlen201350th
4#emph[f]$arrow.l.r$4#emph[f] electronic transitions therefore only
weakly couple to vibrational modes of the surrounding host matrix.
Non-radiative relaxation rates ($W_(upright("nr"))$) are consequently
suppressed relative to corresponding radiative rates
($W_(upright("r"))$), in turn, enabling certain RE#super[3+] excited
states to decay radiatively with high internal quantum efficiencies.
#strong[#ref(label("table:RE3+_summary"))] summarizes attractive
RE#super[3+] ion choices and excited states. #strong[Figure
@fig:Figure_2] illustrates their ground-state and first excited-state
multiplet crystal-field energies in crystals relevant to solid-state
laser cooling.

#block[
#block[
#figure(
  align(center)[#table(
    columns: 3,
    align: (center,center,center,),
    table.header([RE#super[3+]], [Excited
      state], [$macron(E)_(upright("em"))$ (eV) (cm$""^(- 1)$)],),
    table.hline(),
    [Yb#super[3+]], [#super[2]F#sub[5/2]], [1.23 ($approx 9920$)],
    [Er#super[3+]], [#super[4]I#sub[13/2]], [0.805 ($approx 6490$)],
    [Tm#super[3+]], [#super[3]F#sub[4]], [0.685 ($approx 5525$)],
    [Ho#super[3+]], [#super[5]I#sub[7]], [0.615 ($approx 4960$)],
    [Dy#super[3+]], [#super[6]H#sub[13/2]], [0.429 ($approx 3460$)],
  )]
  , caption: [Cooling RE#super[3+] ion excited states and emission
  energies.]
  , kind: table
  ) #label("table:RE3+_summary")

]

]
#figure(image("source/Figure_2.png", width: 90.0%),
  caption: [
    Crystal-field energies (in wavenumbers relative to the crystal-field
    ground state, not to scale) for the ground and first excited state
    multiplets of Yb#super[3+]
    @demirbas2021detailed@puschel2021temperature, Er#super[3+]
    @gruber2006modeling, Tm#super[3+] @klimin2010high, Ho#super[3+]
    @walsh2004spectroscopy, and Dy#super[3+] @rana1988optical in crystal
    hosts relevant to solid-state laser cooling. Energies in parenthesis
    are calculated. The arrows show $E_(upright("exc"))$ for the
    lowest-energy crystal-field excitations.
  ]
)
<fig:Figure_2>

RE#super[3+] quantum yields are influenced by their host. This is
because multi-phonon relaxation rates are determined by both the
RE#super[3+] electronic structure and the host material through the
energy-gap law, which empirically describes the exponential dependence
of $W_(upright("nr"))$ with the minimum number of vibrational quanta,
$m = frac(macron(E)_(upright("em")), ℏ omega_(upright("max")))$, created
during non-radiative relaxation@riseberg1968multiphonon
$ W_(upright("nr")) = beta e^(- gamma m) . $<eqn:energy_gap_law> In
#strong[Equation @eqn:energy_gap_law], $beta$ and $gamma$ are host
material constants and $ℏ omega_(upright("max"))$ is the highest-energy
vibrational mode responsible for multi-phonon relaxation in the
RE#super[3+] ion's first coordination shell. As a rule of thumb,
radiative relaxation dominates multi-phonon relaxation for
$m > 5$.@henderson1989@shi2022phonon This enables applications such as
solid-state lasers, phosphors, and luminescence thermometers. $m > 8$,
however, may be required for applications exceptionally sensitive to
multi-phonon relaxation. This includes solid-state laser
cooling.@hehlen2009design

$W_(upright("nr"))$ is minimized to maximize $eta_(upright("EQE"))$ by
choosing a RE#super[3+] ion with an $macron(E)_(upright("em"))$
(#strong[#ref(label("table:RE3+_summary"))]) that, in combination
with a host material's low $ℏ omega_(upright("max"))$, maximizes $m$.
Fluorides ($ℏ omega_(upright("max")) approx 350 - 590$ cm#super[\-1])
and oxides ($ℏ omega_(upright("max")) gt.eq 550$ cm#super[\-1]) are
therefore potentially suitable materials for Yb#super[3+], Er#super[3+],
Tm#super[3+], and Ho#super[3+] solid-state laser cooling. Hosts with
lower $ℏ omega_(upright("max"))$ (#emph[e.g.], chlorides,
$ℏ omega_(upright("max")) approx 200 - 370$ cm#super[\-1]) are required
for Dy#super[3+].

#emph[Additional host material considerations.] Further host material
considerations include the host's chemical inertness and mechanical
ruggedness as well as large thermal conductivities and known
coefficients of thermal expansion. This will be important for the
success of applications outlined in #strong[Section
@section:applications]. Here, fluorides and oxides are generally
preferred over heavy halides (#emph[i.e.], chlorides, bromides,
iodides), which are hygroscopic and prone to degradation. Fluorides have
the added advantage of possessing relatively low refractive indices
($n approx 1.4 - 1.5$ for $lambda = 2.0 - 1.0$ $mu$m), which enhance
$eta_(upright("e"))$.

The next area of critical concern is the host material's purity. Any
species that absorbs laser light at $lambda_(upright("exc"))$ but
subsequently decays non-radiatively deposits
$tilde.op E_(upright("exc"))$ of heat into the material. This is usually
much greater than the $tilde.op k_(upright("B")) T$ of energy extracted
per cooling cycle. For all practical purposes, the entire emission
energy is converted into heat. Consequently, background impurity
absorption, as captured by $alpha_(upright("b"))$, imparts exquisite
purity requirements on the laser cooling material. Trace impurities at
even the few parts per million (ppm) level severely degrade if not
prevent cooling.@hehlen2007model@melgaard2014identification High-purity
precursors and contamination-free growth are therefore critical to
producing cooling-grade materials. In this regard, single-crystal growth
is a purification process that excludes impurities during a melt's slow
unidirectional solidification. By contrast, glasses are made by rapidly
quenching a melt, and therefore contain all impurities introduced by
their precursors. Whether glass or crystal, surface contamination leads
to optically-induced heating and must be minimized via careful sample
preparation and handling.

Inhomogeneous broadening is another key consideration when choosing
between amorphous and crystalline RE#super[3+] host
materials.@seletskiy2010laser Glasses exhibit broad distributions of
local coordination geometries about RE#super[3+] ions. This leads to
distributions of resonant absorption energies. The resulting,
temperature-independent inhomogeneous broadening typically exceeds an
absorption's temperature-dependent, homogeneous broadening, even at room
temperature.@lei1998determination A pump laser with a linewidth smaller
than the inhomogeneous broadening therefore only excites a fraction of
available RE#super[3+] ions. This limits $P_(upright("abs"))$.

In contrast, a crystal's local coordination geometry is near identical
for all RE#super[3+] ions. This suppresses inhomogeneous broadening and
increases $P_(upright("abs"))$. Narrow resonances stand as one reason
why RE#super[3+]-doped single crystals such as YLF:Yb#super[3+] have
cooled to cryogenic temperatures, reaching 87
K.@gragossian2017optical@volpi2019optical Disordered RE#super[3+]-doped
glasses, by contrast, have not been cooled as extensively.

#emph[RE#super[3+]-doped crystal/glass morphologies.] The morphology and
physical size of laser cooling materials must also be considered. Since
the late 2000s, bulk single crystals have dominated the development of
high-power, solid-state optical refrigerators, aimed at macroscopic
payload cooling and the development of radiation balanced lasers (RBLs)
as well as radiation balanced amplifiers (RBAs). These experiments
typically use crystallographically-oriented samples and polarized
excitation to maximize $P_(upright("abs"))$.

Single-mode optical fibers represent another laser-cooling platform of
interest to RBLs and RBAs. These applications use optical cooling to
offset heat generated by the quantum defect of the stimulated emission
process. Achieving an exact balance between heating and cooling,
however, is difficult@knall2021radiation because of the different
spatial evolution of heating and cooling power densities along
longitudinal (due to pump light being gradually absorbed) and transverse
(due to the non-uniform power density distribution of optical modes)
directions of a gain fiber.

Finally, laser-cooling materials may be in the form of $mu$m- or
nm-sized RE#super[3+]-doped particles. Research in this area has been
motivated by applications of optically levitated nanoparticles for
ultra-sensitive force sensors@yin2013optomechanics wherein optical
refrigeration of the nanoparticle counteracts heating induced by a
trapping laser.@luntz2021laser This reduces thermal noise, increases
readout sensitivity, and prevents sensor degradation.

Challenges exist when working with nanoscale materials. Simply viewing a
nanocrystal as a fragment of the bulk neglects various processes that
become active at the nanoscale. To illustrate, nanocrystal QYs are often
significantly lower than those of their bulk counterparts.@shi2022phonon
This stems from the introduction of defects due to the abrupt
termination of nanocrystal lattices.

Nanocrystal surfaces are consequently passivated with organic ligands to
suppress defect formation. These ligands also help control a
nanocrystal's size, morphology, and may also influence RE#super[3+]
photophysics because of their close proximity to incorporated
RE#super[3+] dopants. In this regard, energy transfer to ligand
vibrational modes may introduce new ligand-mediated, non-radiative
relaxation pathways for RE#super[3+] ions not present in the bulk.
Nanocrystal surface ligands may also produce crystal structures
different from the bulk.@uchino1989dependence Together with structural
disorder near nanocrystal surfaces@shi2022phonon, this can alter host
crystal-field splittings, vibrational frequencies, and extent of
inhomogeneous broadening. All dictate realizable $P_(upright("cool"))$.

Finally, reducing nanocrystal sizes can engineer phonon densities of
state.@shi2022phonon As illustration, at low temperatures, acoustic
phonons play an important role in ensuring energy conservation during
multiphonon decay.@meltzer2000electron Suppressing available acoustic
phonons via reductions of the nanocrystal size can therefore introduce a
phonon bottleneck that suppresses non-radiative relaxation. This can
then promote laser cooling to ultracold
temperatures.@nemova2012photnorth@werschler2016coupling Abovementioned
nanoscale complexities thus motivate ongoing research into
nanostructure-based laser cooling.

=== Semiconductors (Bulk and nanocrystals)
<subsect:cooling_materials>
Unlike RE#super[3+]-doped systems, semiconductors do not experience
thermal depopulation of ground electronic states involved in cooling
transitions. This is because their cooling cycles involve
valence-to-conduction band transitions and because Fermi statistics
guarantee populated valence bands at all temperatures. Cooling floors as
low as $tilde.op 10$ K@PhysRevLett.92.247403 (and potentially
lower@Duan2025ZeroPointPhonons) are therefore possible. Attractive about
semiconductors are large $alpha$-values and ns carrier recombination
lifetimes, which stand in contrast to ms rare-earth dopant timescales.
Semiconductor $P_(upright("cool"))$-values are therefore intrinsically
larger than those of RE#super[3+]-doped
glasses/crystals.@PhysRevLett.92.247403

Key features required of cooling grade semiconductors are near-identical
to those of RE#super[3+]-doped glasses/crystals. Namely, needed are
unity/near-unity $eta_(upright("EQE"))$ and unity/near-unity
$eta_(upright("abs"))$. Both are aided by small
$macron(E)_(upright("em"))$-values as well as by minimal
$alpha_(upright("b"))$-values that adversely impact
$alpha_(upright("abs"))$. Additional semiconductor-specific features
that promote cooling are intrinsic absorption/emission Stokes
shifts@Brennan2017Origin@Brennan2017Existence@brennan2020universal that
minimize photon recycling and large electron-phonon coupling constants,
$g$, or related Huang-Rhys parameters that yield large
$eta_(upright("abs"))$. #strong[@table:semiconductors] summarizes
literature instances where specific cooling requirements have been met.

#block[
#block[
#figure(
  align(center)[#table(
    columns: 4,
    align: (center,center,center,center,),
    table.header([Material], [$eta_(upright("EQE"))$], [$eta_(upright("abs"))$], [$g$
      (meV)],),
    table.hline(),
    [GaAs/GaInP double
    heterostructure], [$0.995 plus.minus 0.001$@Bender2013_GaAsGaInP], [$0.901$@Bender2013_GaAsGaInP], [-],
    [CdSe/CdS
    nanocrystals], [0.99@Hua2020Optical@Ye2021Phonon], [-], [11-12@norris1996size@Ye2021Phonon],
    [CsPbBr$""_3$
    nanocrystals], [$0.96 plus.minus 0.05$@Ding2023Mixed@Roman2020Optically], [0.99@zhang2024resonant], [42-100@ramade2018exciton@iaru2017strong@saran2017giant@shinde2017low@cho2022exciton],
  )]
  , caption: [Compilation of experimentally measured and known cooling
  grade semiconductor metrics.]
  , kind: table
  ) <table:semiconductors>

]

]
Of note is CsPbBr#sub[3]'s near-unity $eta_(upright("abs"))$-value,
which exceeds that for GaAs. This points to sizable electron-phonon
couplings in perovskite materials. Large $g$-values, in turn, enhance
absorption efficiencies (or up-conversion efficiencies). For
CsPbBr#sub[3], what result are unity $eta_(upright("abs"))$-values
within error.@zhang2024resonant Underscoring the importance of this,
although the GaAs specimen in #strong[@table:semiconductors]
possesses an $eta_(upright("EQE"))$-value above a critical quantum yield
required to cool, no cooling has been observed due to its
$eta_(upright("abs")) = 0.901$ value being too small to engender
$P_(upright("cool")) > 0$.@Bender2013_GaAsGaInP Only transient cooling
has been reported on a sub-nanosecond timescale.@Lippmann2019CLEO

Accompanying near-unity, quantum dot $eta_(upright("EQE"))$-values are a
consequence of careful surface engineering. For II-VI nanocrystals such
as CdSe, surface passivation strategies have primarily involved
depositing a thin layer of a larger band gap semiconductor atop the
nanocrystal.@hines1996synthesis@dabbousi1997cdse@peng1997epitaxial
Examples include CdS or ZnS overcoated CdSe quantum dots (#emph[i.e.],
CdSe/CdS or CdSe/ZnS core/shell nanocrystals). This introduces
effective, Type-I band offsets at core/shell interfaces, which confine
carriers to the nanocrystal core and suppress any surface-mediated,
non-radiative recombination. What result are
$eta_(upright("EQE"))$-values as large as unity.@Ye2021Phonon

$eta_(upright("EQE"))$-values of overcoated quantum dots, however, are
critically sensitive to the quality of their core/shell interfaces.
Because core and shell materials generally exhibit lattice mismatches,
epitaxial growth is often not possible. This makes attaining
unity/near-unity QYs challenging. The situation is to be contrasted to
lead-based, all-inorganic perovskite nanocrystals, where an intrinsic
defect tolerance@huang2017lead@kang2017high@kovalenko2017properties
translates to unity/near-unity $eta_(upright("EQE"))$-values without
significant surface modifications.

Another important advantage of colloidal nanocrystals is their size.
Because nanocrystal dimensions are typically of order 5-10 nm, they are
much smaller than the wavelength of light. Their emission is therefore
point-dipole like. This obviates the need for light extraction layers to
maximize $eta_(upright("e"))$ ($eta_(upright("EQE"))$) unlike in bulk or
quantum well semiconductors where large refractive index differences
with a surrounding medium lead to low $eta_(upright("e"))$-values. Of
note is that RE#super[3+] materials are less prone to this issue due to
their smaller refractive indices. Phonon confinement in small
nanocrystals may additionally increase the likelihood of
phonon-assisted, below gap absorption, in turn, enhancing
$eta_(upright("abs"))$.@werschler2016coupling

Finally, colloidal nanocrystals possess band edge, absorption/emission
Stokes shifts, which reduce reabsorption/photon recycling. For systems
such as CdSe or CsPbBr$""_3$, Stokes shifts range from 20-100 meV at
both room and low
temperature.@kuno1997band@Brennan2017Existence@Brennan2017Origin@brennan2020universal
These Stokes shifts are size-dependent and increase with decreasing
nanocrystal size. In most nanocrystal systems, observed Stokes shifts
are attributed to the existence of “dark\" excitons, which emerge from
band edge optical fine
structure.@efros1996band@kuno1997band@efros2000electronic

== Light source selection
<subsect:light_source_selection>
Principal requirements for the light source in optical refrigeration
measurements include power stability at the 0.1--1% level, low
M$""^2$-values that allow tight focusing, and polarization control. The
latter is essential for structurally anisotropic materials, which
exhibit polarization-dependent absorption and emission. Pump linewidths
must also be narrower than the spectral scale over which
$eta_(upright("abs"))$ changes appreciably. In general, continuous-wave
operation is preferred as high peak fluence (#emph[i.e.], pulsed)
sources risk the onset of two-photon absorption. For semiconductors,
undesired Auger carrier recombination is also
avoided.@klimov1997auger@klimov2000quantization@shen2018unexpectedly

More crucial is that the laser excitation wavelength,
$lambda_(upright("exc"))$, be greater than
$macron(lambda)_(upright("em"))$ so that $P_(upright("cool")) > 0$. A
balance exists though. Too small a $Delta E$ results in a small
$P_(upright("cool"))$-value that is readily overwhelmed by any heating
in the system. Too large a $Delta E$-value results in insufficient
cooling efficiencies/powers due to decreases in $eta_(upright("abs"))$
(#strong[Equation @eqn:Pcool_equation_wavelength]).

For RE#super[3+]-doped materials, fixed wavelength sources are adequate
for cooling studies. This is because so long as no phase transitions
occur, the crystal-field energies of RE#super[3+]-doped materials are
largely temperature independent. To first order, crystal-field
splittings increase as $R^(- 5)$ with decreasing RE#super[3+]-ligand
bond length, $R$.@song2022basic In a YLF crystal, cooling from 300 to
100 K causes a lattice contraction of $tilde.op 0.187 %$ and
$tilde.op 0.153 %$ along $a$ and $c$ axes,
respectively.@aggarwal2005measurement Although the $R^(- 5)$
relationship points to an increase of the crystal field splitting by
$tilde.op 0.85 %$ in YLF:Yb#super[3+], the corresponding
$E 4 arrow.r E 5$ transition wavelength in #strong[@fig:Figure_2]
only changes by a fraction of a nm, from 1019.26 nm (300 K) to 1019.60
nm (100 K).@seletskiy2012cryogenic. Such small changes make it possible
to use fixed-wavelength lasers, tuned to the absorption transition of a
given RE#super[3+]-doped material, to conduct RE#super[3+] cooling
studies over a wide temperature range.

For semiconductors with relatively broad absorption band edges,
detunings of a few tens of meV below the mean emission energy are
typical. As illustration, in CdS nanobelts@Zhang2013Laser (CsPbBr$""_3$
nanocrystals@Roman2020Optically), $Delta E = 38 - 119$ meV
($Delta E = 70 - 90$ meV). Unlike RE#super[3+] systems, though,
temperature-dependent absorption edges, as parameterized by
material-specific Varshni
relationships@vurgaftman2001band@mannino2020temperature, necessitate
tunable laser sources to maintain (or vary) $Delta E$ with changing
specimen temperature.

== Appropriate non-contact thermometry
<subsect:thermometry>
Crucial to solid state laser cooling are reliable temperature
measurement approaches for performance benchmarking and optimization. To
this end, commercial/conventional temperature sensors have been
successfully used to measure the temperature of a coldfinger@hehlen2018,
fully shielded from the pump and PL (see #strong[Section
@subsect:cryocooler]). Miniaturized thermocouples, glued to the back of
optical mirrors deposited onto ZBLAN:Yb#super[3+] glasses, have also
been used.@thiede2005cooling The approach, however, reduces
$P_(upright("cool"))$ by an estimated 10-15% due to photoluminescence
absorption by unshielded parts of the electrical probe. These
complications and accompanying performance limitations at cryogenic
temperatures explain why non-contact approaches have since emerged as
the preferred means of measuring temperature in solid-state optical
cooling measurements.

Two general categories of non-contact thermometry are discussed in what
follows. Passive methods assess temperature by analyzing information
emitted by a cooling medium during laser cooling (either thermal
radiation or ASPL). Active approaches require an auxiliary (probe) laser
or other temperature reporter, in addition to the pump laser, to measure
a cooling specimen's thermometric properties.

=== Passive, non-contact thermometry
<subsubsect:passive_thermometry>
#emph[Thermal imaging.] A material being optically cooled emits infrared
(blackbody) radiation that carries information about its average
temperature. Emitted blackbody radiation can be monitored using
calibrated thermal imagers such as microbolometers and focal-plane InSb,
InAs, and HgCdTe arrays. While convenient, device temperature
measurement ranges are often limited. Moreover, in some instances, data
quality is adversely impacted by noise due to liquid cryogen boil-off.
The low spectral emissivity of many semiconductors (#emph[e.g.], GaAs)
additionally restricts use of thermal imaging for their thermometry.

#emph[Differential Luminescence Thermometry (DLT).] PL emitted by
specimens can simultaneously be used to ascertain cooling. This entails
monitoring temperature-induced changes to emission lineshapes and
energies. One approach, called differential luminescence thermometry,
involves a differential analysis of PL spectra to monitor the
temperature of RE#super[3+]@Mungan1997PRL@Patterson2007SPIE and
semiconductor@imangholi2006differential specimens during cooling.
Because DLT spectral information is read out using charge-coupled device
(CCD) or complementary-metal-oxide-semiconductor (CMOS) arrays, coupled
to dispersive elements, among immediate limitations of the technique are
its sensitivity and its speed. The former is determined by the spectral
resolution of employed dispersive elements. The latter is established by
CCD/CMOS readout rates. Among workarounds is the use of dispersive
elements coupled to balanced photodiode pairs to monitor
temperature-induced ASPL
changes.@seletskiy2011oe@patterson2010measurement

At a deeper level, the temperature reporting fidelity of DLT is highly
premised on the precise calibration of a specimen's PL lineshape as a
function of temperature, observation angle, and optical mean-path
length. This is because DLT is sensitive to reabsorption-induced changes
to PL lineshapes that ultimately impact corresponding DLT traces. This
may result in erroneous temperature measurements. The issue arises in
large optical pathlength specimens or those that are optically dense. It
also arises when multipass excitation schemes are used to maximize
$P_(upright("abs"))$ in a cooling specimen.@Kock2025UNM
Reabsorption-related issues are particularly problematic for simpler DLT
variants that involve the ratiometric measurement of PL
peaks.@Bigotta2007SPIE

#emph[Other approaches.] Pump-induced ASPL can also be used to estimate
temperature. This entails monitoring integrated ASPL intensities, taking
advantage of the fact that $eta_(upright("c"))$ is exquisitely sensitive
to the temperature-dependence of $eta_(upright("abs"))$. For
CsPbBr#sub[3] nanocrystals, a near exponential temperature dependence of
the ASPL intensity has been used to establish specimen
temperatures.@zhang2020up@Roman2020Optically

=== Active, non-contact thermometry
<subsubsect:active_thermometry>
#emph[PL spectroscopy.] Although uncommon, above gap-excited PL has been
used to measure specimen temperatures. The approach has been used to
estimate GaAs lattice temperatures during transient cooling
measurements@Lippmann2019CLEO and has involved fitting the exponential
decay of the high-energy tail in PL spectra to establish lineshape
variations, stemming from thermal changes to phonon populations.
Analogous PL thermometry on a YLF:Yb#super[3+] crystal has been carried
out using above gap-excited PL from a GaAs/GaInP heterostructure crystal
connected to it.@seletskiy2010oe

#emph[Photothermal Deflection Spectroscopy (PDS).] Among active,
non-contact thermometries that involve the introduction of a secondary
probe laser, photothermal deflection spectroscopy is a commonly employed
technique. It was, in fact, originally used to validate the first
observation of solid-state optical refrigeration.@epstein1995observation

In PDS, a (cooling) pump laser produces a radially-symmetric thermal
lens in the illumination region. The lens then deflects an
axially-shifted, probe beam that co-propagates through the specimen
parallel to the pump.@bowman2000new Observed deflection angles are
proportional to the sign of the local, radial thermal gradient.
Deflection angles can therefore be used to discern cooling from heating.
PDS requires exquisite alignment and understanding of the interplay
between temperature-induced and population-induced lensing for accurate
temperature measurements.@Silva2013OL

#emph[Optical interferometry.] Alternative, active non-contact
techniques use optical interferometry to monitor temperature via
temperature-induced changes to specimen refractive indices. An example
is the homodyne detection of reflected probe light, which picks up a
temperature-dependent phase shift upon transmission through the
specimen, and a reference beam, which remains unaffected. The resulting
interference signal possesses a magnitude proportional to
$Delta T$.@hoyt2000PRL While having the potential to offer extreme
sensitivity, interferometric readout introduces measurement sensitivity
to vibrations of requisite vacuum equipment. This introduces additional
stabilization requirements that increase experimental complexity. A
related approach uses fiber Bragg gratings (FBGs)@Filho2014OE directly
glued to cooling specimens where the monolithic design of the
interferometer makes it largely insensitive to environmental
noise.@Filho2013OE

#emph[Cantilever approaches.] Finally, for very small cooling specimens
(#emph[e.g.], RE#super[3+]-doped microcrystals
@dobretsova2021hydrothermal), thermometric information can be extracted
from temperature-induced changes to vibrational quality-factors of
micrometer-sized cantilevers.@pant2018optomechanical In the approach,
specimens are deposited atop cantilevers. Their subsequent cooling
induces changes to the cantilever's mechanical response. A balanced
photodiode then records the time domain response of scattered probe
light off the cantilever's back whereupon the signal is Fourier
transformed. Temperature information is then extracted from the
linewidth of the obtained frequency response.

=== Thermometry guidelines
<subsubsect:guidelines_thermometry>
Among above-described passive and active non-contact thermometries,
thermal cameras remain the tool of choice for near room temperature
experiments in RE#super[3+]-based cooling studies. This includes its use
to assess cooling efficiencies within the context of Laser-Induced
Thermal Modulation Spectroscopy (LITMoS).@Hoyt2003JOSAB

At cryogenic temperatures, DLT remains the tool of choice. Of note then
is recent work on sub-130 K and high-cooling-power operation in
YLF:Yb#super[3+], which has revealed a sensitivity of DLT thermometry to
the details of its signal collection. Namely, $P_(upright("abs"))$ is
often maximized in cooling measurements by using a multipass pump
scheme. What results, however, is a complex, three-dimensional network
of passes through the cooling medium. Because DLT is sensitive to
reabsorption effects, local variations of pump positions relative to the
detection region impact DLT signals and can lead to erroneous
conclusions.@Kock2025UNM

Ongoing efforts have therefore worked to mitigate DLT's reabsorption
sensitivity by performing a comprehensive, temperature-dependent
calibration procedure that includes mapping PL lineshape dependencies
with observation direction relative to the optical axis (if any) of the
cooling medium and to the mean optical path ASPL takes to escape the
specimen. The resulting calibration yields a laboratory- and
setting-agnostic DLT methodology@Kock2025UNM, applicable to arbitrary
specimens.

= Results
<section:results>
== RE#super[3+]-doped material cooling milestones
<subsect:RE3_milestones>
In 1995, Epstein and co-workers at Los Alamos National Laboratory used a
glassy ZBLANP
(48%ZrF$""_4$-17%BaF$""_2$-4%LaF$""_3$-3%AlF$""_3$-20%NaF-8%PbF$""_2$,
mol% @poulin2024heavy) fiber preform with a 1 wt% Yb#super[3+]-doped
core to experimentally demonstrate net optical refrigeration of a solid
for the first time.@epstein1995observation Cooling was induced by
exciting the sample with a Ti:sapphire laser at
$lambda_(upright("exc")) = 1020$ nm to achieve a $Delta T tilde.op 0.3$
K net cooling below room temperature. Temperature changes were probed
using both PDS and thermal imaging. Subsequent improvements/increases in
sample quality, absorbed excitation power, and thermal management
resulted in cooling ZBLANP:Yb$""^(3 +)$ to a final temperature of
$T_(upright("final")) tilde.op 208$ K from room temperature
($lambda_(upright("exc")) = 1026$ nm, $P_(upright("exc")) = 9.6$
W).@thiede2005cooling #strong[Table
#ref(label("table:RE3+_glass_milestones"))] summarizes additional
Yb#super[3+]-doped glass cooling milestones.

#block[
#block[
#block[
#figure(
  align(center)[#table(
    columns: 9,
    align: (center,center,center,center,center,center,center,center,center,),
    table.header([Year], [Host glass], [Doping], [$Delta T$
      (K)], [$T_(upright("final"))$
      (K)], [Method], [$lambda_(upright("exc"))$
      (nm)], [$P_(upright("exc"))$ (W)], [Reference],),
    table.hline(),
    [1995], [ZBLANP], [1 wt%], [0.3], [$upright("RT") - Delta T$], [PDS,
    IR], [1020], [0.70], [@epstein1995observation],
    [2002], [CNBZn], [1
    mol%], [-], [-], [PDS], [988-1025], [-], [@fernandez2002origin],
    [2005], [ZBLANP], [2
    wt%], [87], [208], [TC], [1026], [9.6], [@thiede2005cooling],
    [2006], [ABCYS], [2
    wt%], [0.13], [$upright("RT") - Delta T$], [IR], [1020-1050], [-], [#cite(label("guiheen2006yb3+"))],
    [2023], [GAYY], [$4.0 times 10^26$
    m$""^(- 3)$], [0.9], [$upright("RT") - Delta T$], [FBG,
    IR], [1029], [6.5], [@thomas2023demonstration],
    [2024], [SiO$""_2$], [$6.56 times 10^25$
    m$""^(- 3)$], [67], [$upright("RT") - Delta T$], [PL], [1032], [97], [@topper2024laser],
  )]
  , caption: [Yb#super[3+]-doped glass cooling milestones and key
  metrics.]
  , kind: table
  ) #label("table:RE3+_glass_milestones")

]
#block[
PDS=Photothermal deflection spectroscopy, IR=Thermal camera,
TC=Thermocouple, FBG=Fiber Bragg grating, PL=Photoluminescence

RT=Room temperature (exact temperature not specified)

ZBLANP=48%ZrF$""_4$-17%BaF$""_2$-4%LaF$""_3$-3%AlF$""_3$-20%NaF-8%PbF$""_2$
(mol%)

CNBZn=CdF$""_2$-CdCl$""_2$-NaF-BaF$""_2$-BaCl$""_2$-ZnF$""_2$

ABCYS=40%AlF$""_3$-12%BaF$""_2$-22%CaF$""_2$-16%YF$""_3$-10%SrF$""_2$
(mol%)

GAYY=SiO$""_2$ codoped with Al$""^(3 +)$ (7.6 at.%), Y$""^(3 +)$ (4.6
at.%), and Yb$""^(3 +)$

]
]

]
In 2000, Bowman and Mungan demonstrated the first cooling of a
RE#super[3+]-doped crystal. This entailed using PDS to observe net
cooling in a KGd(WO#sub[4])#sub[2]:3.5%Yb#super[3+] crystal
(KGW:Yb#super[3+], $lambda_(upright("exc")) = 1008 dash.en 1026$
nm).@bowman2000new In 2001, Epstein #emph[et al.] cooled a
Y$""_3$Al$""_5$O$""_12$:2.3%Yb$""^(3 +)$ (YAG:Yb$""^(3 +)$) crystal by
$Delta T = 8.9$ K from room temperature
($lambda_(upright("exc")) = 1030$ nm, $P_(upright("exc")) = 1.8$ W) and
a Y$""_2$SiO$""_5$:5%Yb$""^(3 +)$ (YSO:Yb$""^(3 +)$) crystal by
$Delta T tilde.op 1$ K ($lambda_(upright("exc")) = 1050$
nm).@epstein2001measurements Subsequent work by Bigotta #emph[et al.] in
2007 demonstrated promising results by cooling a
YLiF$""_4$:5%Yb$""^(3 +)$ (YLF:Yb$""^(3 +)$) crystal by $Delta T = 69$ K
from room temperature ($lambda_(upright("exc")) = 1030$ nm,
$P_(upright("exc")) = 15$ W).@bigotta2007laser

Seletskiy #emph[et al.] subsequently modeled the cooling performance of
YLF:Yb#super[3+] by taking into account its temperature-dependent
absorption. They predicted the possibility of cooling YLF:Yb#super[3+]
to 110 K when pumped at $lambda_(upright("exc")) = 1020$ nm to be in
resonance with Yb#super[3+]'s $E 4 arrow.r E 5$ crystal-field transition
(#strong[@fig:Figure_2]).@seletskiy2010laser Seletskiy #emph[et
al.] went on to demonstrate YLF:Yb#super[3+] cooling to
$T_(upright("final")) tilde.op 155$ K from room temperature
\[$eta_(upright("EQE")) = 0.995 plus.minus 0.001$,
$alpha_(upright("b")) = \( 4.2 plus.minus 0.2 \) times 10^(- 4)$
cm$""^(- 1)$\] using $lambda_(upright("exc"))$ = 1023 nm. These results
pointed to suppressed inhomogeneous broadening in crystalline, as
opposed to glassy, hosts offering significant enhancements of
$eta_(upright("abs"))$, thus opening up an era of cryogenic research in
solid-state laser refrigeration.

The first verification of solid-state optical refrigeration to cryogenic
temperatures came in 2013 when Melgaard #emph[et al.] cooled a
YLF:5%Yb$""^(3 +)$ crystal
\[$eta_(upright("EQE")) = 0.994 plus.minus 0.001$,
$alpha_(upright("b")) = \( 4.4 plus.minus 0.2 \) times 10^(- 4)$
cm$""^(- 1)$\], placed inside a Herriott cell, to
$T_(upright("final")) = 123.7 plus.minus 1.0$ K from room temperature
($lambda_(upright("exc")) = 1020.7$ nm, $P_(upright("exc")) = 45$ W,
$P_(upright("abs,tot")) = 18$ W).@melgaard2013optical The crystal was
further cooled to $T_(upright("final")) = 118.7 plus.minus 1$ K by
lowering the temperature of a clamshell surrounding the crystal to 208
K. Further improvements in sample purity
\[$eta_(upright("EQE")) = 0.996 plus.minus 0.001$,
$alpha_(upright("b")) lt.eq \( 1 plus.minus 0.1 \) times 10^(- 4)$
cm#super[\-1]\] and optical refrigerator design improved the cooling to
$T_(upright("final")) = 91$ K in a YLF:10%Yb#super[3+]
crystal.@melgaard2016solid YLF:5%Yb$""^(3 +)$ was subsequently cooled to
$T_(upright("final")) = 87$ K from room temperature by using an
astigmatic Herriott cell to increase the number of pump laser passes
through the sample from 22 @melgaard2016solid to $> 300$ while
simultaneously increasing the specimen's absorptance to nearly
100%.@gragossian2017optical

To date, the lowest $T_(upright("final"))$ reported for YLF:Yb$""^(3 +)$
is by Volpi #emph[et al.] who cooled very lightly Tm$""^(3 +)$ co-doped
($tilde.op 16$ ppm) YLF:5%Yb$""^(3 +)$ @di2014influence to
$T_(upright("final")) = 87$ K from room temperature
($lambda_(upright("exc")) = 1020$ nm, $P_(upright("exc")) = 50$
W).@volpi2019optical The reported $T_(upright("final")) = 87$ K is lower
than a calculated YLF:Yb$""^(3 +)$ gMAT of 110-120 K at 1020 nm, based
on temperature-independent $eta_(upright("EQE")) = 0.994$ and
$alpha_(upright("b")) = 2 times 10^(- 4)$ cm$""^(- 1)$ values. This
suggests a temperature-dependent $alpha_(upright("b"))$-value in
YLF:Yb$""^(3 +)$, which decreases with decreasing temperature. In
support of this, a direct measurement has revealed an order of magnitude
decrease in $alpha_(upright("b"))$ between 300 K and 100 K. A revised
YLF:Yb$""^(3 +)$ gMAT is therefore $tilde.op 70$ K.@volpi2019optical
#strong[#ref(label("table:RE3+_crystal_milestones"))] summarizes
important Yb$""^(3 +)$-doped crystal cooling results.

#block[
#block[
#block[
#figure(
  align(center)[#table(
    columns: 9,
    align: (center,center,center,center,center,center,center,center,center,),
    table.header([Year], [Host crystal], [Doping], [$Delta T$
      (K)], [$T_(upright("final"))$
      (K)], [Method], [$lambda_(upright("exc"))$
      (nm)], [$P_(upright("exc"))$ (W)], [Reference],),
    table.hline(),
    [2000], [KGd(WO#sub[4])#sub[2]], [3.5 at.%], [-], [-], [PDS], [1000,
    1028], [-], [@bowman2000new],
    [2001], [YAG], [2.3
    at.%], [8.9], [-], [IR], [1030], [0.75], [@epstein2001measurements],
    [2001], [Y#sub[2]SiO#sub[5]], [5
    at.%], [1], [-], [IR], [1050], [-], [@epstein2001measurements],
    [2002], [KPb#sub[2]Cl#sub[5]], [$tilde.op$5$times 10^19 med upright(c m)^(- 3)$], [-], [-], [PDS], [985
    \- 1035], [-], [@fernandez2002origin@mendioroz2002anti],
    [2006,2007], [BaY#sub[2]F#sub[8]], [2.5
    at.%], [4], [-], [IR], [1025], [3], [@bigotta2007laser@bigotta2006spectroscopic@bigotta2006laser],
    [2007], [YLF], [5
    at.%], [69], [-], [PL], [1030], [15], [@bigotta2007laser],
    [2013], [YLF], [5
    at.%], [162/89], [124/119], [PL], [1020], [45], [@melgaard2013optical],
    [2016], [YLF], [10
    at.%], [178.5], [91], [PL], [1020], [54], [@melgaard2016solid],
    [2017], [YLF], [5
    at.%], [$tilde.op$200], [87], [PL], [1020], [-], [@gragossian2017optical@volpi2019optical],
    [2018], [KYF#sub[4]], [10
    at.%], [1.8], [-], [IR], [1025], [1.5], [@volpi2018anti],
    [2020], [KY(WO#sub[4])#sub[2]], [1
    at.%], [1.5], [-], [IR], [1025], [-], [@cheng2020laser],
    [2021], [YAG], [3
    at.%], [81], [219], [PL], [1030], [37], [@zhong2021optical],
    [2022], [LuLiF#sub[4]], [7.5
    at.%], [145], [121], [PL], [1020], [80], [@lei2022laser],
    [2022], [CaF#sub[2]], [5 at.%], [-], [-], [IR], [1019 -
    1080], [-], [@puschel2022solid],
    [2022], [SrF#sub[2]], [5 at.%], [-], [-], [IR], [1012 -
    1075], [-], [@puschel2022solid],
    [2022,2023], [KY#sub[3]F#sub[10]], [3 at.%], [-], [-], [IR], [1002 -
    1067], [-], [@puschel2022laser@puschel2023ytterbium],
    [2024], [CaF#sub[2]], [5
    at.%], [97], [200], [PL], [1020], [100], [@puschel2024thesis],
    [2024], [BaY#sub[2]F#sub[8]], [5
    at.%], [100], [194], [PL], [1020], [100], [@puschel2024thesis],
    [2024], [KY#sub[3]F#sub[10]], [3
    at.%], [120], [177], [PL], [1020], [100], [@puschel2024thesis],
  )]
  , caption: [Yb#super[3+]-doped crystal cooling milestones.]
  , kind: table
  ) #label("table:RE3+_crystal_milestones")

]
#block[
Doping concentration in atomic percentage (at.%) refers to the ratio
with respect to the cations substituted by Yb#super[3+]. For example,
the chemical formula corresponding to YLF:5 at.% Yb#super[3+] is
(Yb#sub[0.05]Y#sub[0.95])LiF#sub[4].

PDS=Photothermal deflection spectroscopy, IR=Thermal camera,
PL=Photoluminescence

Results with the temperature of the crystal's surrounding at 285/208 K.

]
]

]
Above efforts along with a low gMAT have made YLF:Yb$""^(3 +)$ the
workhorse material for high-power cooling experiments seeking to realize
solid-state, cryogenic optical refrigeration. This has been aided by
progressive improvements in the quality of Czochralski-grown
YLF:Yb$""^(3 +)$ over the last decade. Today, crystals with
$eta_(upright("EQE")) > 0.99$ and $alpha_(upright("b")) approx 10^(- 4)$
cm#super[\-1] are routinely reported.

To achieve lower temperatures with YLF:Yb$""^(3 +)$, one must increase
Yb$""^(3 +)$'s concentration while lowering $alpha_(upright("b"))$ by
reducing impurity concentrations.@puschel2021temperature This requires
more stringent precursor purification processes, #emph[e.g.], by zone
refining YF$""_3$, LiF, and YbF$""_3$ precursors and/or polycrystalline
YLF:Yb$""^(3 +)$ prior to single crystal growth. Alternatively,
increased cooling performance at cryogenic temperatures is possible by
choosing a different Yb$""^(3 +)$ host that possesses improved
spectroscopic properties. Here, Püschel #emph[et al.] have demonstrated
cooling KY$""_3$F$""_10$:Yb#super[3+] (a system that possesses a laser
cooling figure-of-merit more than five times greater than that of
YLF:Yb$""^(3 +)$ at temperatures below 200 K@puschel2022laser) by
$Delta T = 177$ K from room temperature
($lambda_(upright("exc")) = 1020$ nm, $P_(upright("exc")) = 100$
W).@puschel2024thesis This promising development suggests future
opportunities for improving the performance of Yb$""^(3 +)$-doped
fluoride crystals.

=== Beyond Yb#super[3+]
<subsubsect:beyond_Yb3>
Given that #strong[Equation @eqn:eta_cool_equation_wavelength] has shown
$eta_(upright("c"))$ to scale as
$frac(Delta E, \( macron(E)_(upright("em")) - Delta E \))$ (in the limit
that $eta_(upright("em"))$$eta_(upright("abs"))$ = 1), using cooling
ions with $macron(E)_(upright("em"))$ lower than that of Yb#super[3+]
(#strong[#ref(label("table:RE3+_summary"))]) should increase
$eta_(upright("c"))$ and enable greater $P_(upright("cool"))$-values for
the same $P_(upright("abs"))$. Several studies have therefore pursued
this optimization strategy to demonstrate laser cooling with
Er#super[3+], Tm#super[3+], Ho#super[3+], and Cr#super[3+]. For these
ions, $m > 8$ for all halide hosts. Large $eta_(upright("ext"))$ are
therefore possible. #strong[#ref(label("table:beyond_yb3+"))]
summarizes these studies.

#block[
#block[
#block[
#figure(
  align(center)[#table(
    columns: 6,
    align: (center,center,center,center,center,center,),
    table.header([Host], [Doping%], [$Delta T$
      (K)], [$lambda_(upright("exc"))$ (nm)], [$P_(upright("exc"))$
      (W)], [Reference],),
    table.hline(),
    table.cell(align: center, colspan: 6)[Er#super[3+]],
    [CNBZn], [0.5
    mol%], [0.5$plus.minus$0.1], [860], [1.9], [@fernandez2006anti],
    [KPb#sub[2]Cl#sub[5]], [0.5
    mol%], [0.7$plus.minus$0.1], [879], [1.9], [@fernandez2006anti@condon2009optical],
    table.cell(align: center, colspan: 6)[Tm#super[3+]],
    [ZBLANP], [1
    wt.%], [24], [1900], [4.5], [@hoyt2000PRL@hoyt2003laser],
    [BaY#sub[2]F#sub[8]], [1.2
    at.%], [3.2], [1855], [4.4], [@patterson2008anti],
    [YLF], [1 at.% / 2
    at.%], [-], [1860-1945/1880-2000], [-], [@rostami2019tm],
    [InF], [1 mol%], [2.4], [1900], [4.4], [@nobel2025optical],
    table.cell(align: center, colspan: 6)[Ho#super[3+]],
    [YLF], [1 at.%], [-], [2056-2220], [-], [@rostami2019observation],
    [BaY#sub[2]F#sub[8]], [1
    at.%], [-], [2023-2100], [-], [@rostami2021observation],
    table.cell(align: center, colspan: 6)[Cr#super[3+]],
    [LiSAF], [1 at.%], [-], [1000], [-], [@silva2025observation],
  )]
  , caption: [RE#super[3+]-doped crystal/glass cooling beyond
  Yb#super[3+].]
  , kind: table
  ) #label("table:beyond_yb3+")

]
#block[
CNBZn = CdF#sub[2]-CdCl#sub[2]-NaF-BaF#sub[2]-BaCl#sub[2]-ZnF#sub[2].

0.5 mol% of ErCl#sub[3] doping.

0.5 mol% of ErF#sub[3] doping.

]
]

]
The next ion in this series of decreasing $macron(E)_(upright("em"))$
and potentially increasing $eta_(upright("c"))$ is Dy#super[3+]. With
$macron(E)_(upright("em")) approx 3200$ cm#super[\-1] (#strong[Table
#ref(label("table:RE3+_summary"))]), host materials with
$ℏ omega_(upright("max")) < 400$ cm#super[\-1] are required to achieve
high $eta_(upright("EQE"))$-values. This points to the use of chloride,
bromide, or iodide hosts. Notably, solid-state laser cooling of
Dy#super[3+] in any host remains to be demonstrated.

=== Yb#super[3+]-doped nanostructures and other morphologies
<subsubsect:yb3_nanostructures>
In tandem, significant work has focused on demonstrating solid-state
laser cooling in RE#super[3+]-doped particles.@nemova2022laser Among
examples, levitated YLF:10%Yb#super[3+] nanocrystals have been
refrigerated to $T_(upright("final")) = 130$ K by pumping them at
$lambda_(upright("exc")) = 1020$ nm in a single-beam dipole
trap.@rahman2017laser Such particles have also been cooled by
$Delta T = 10$ K in a D#sub[2]O medium@roder2015laser and by
$Delta T = 23.6$ K when placed atop a CdS cantilever.@pant2020solid
Similar results were achieved with LLF:10%Yb#super[3+] microcrystals,
which were cooled by $Delta T = 20.4$ K in
vacuum@dobretsova2021hydrothermal and by $Delta T = 5$ K in deionized
water.@dobretsova2022safe

Cooling has also been investigated in the potassium lutetium fluorides
(K#sub[2]LuF#sub[5], KLuF#sub[4], KLu#sub[2]F#sub[7]), in
KLu#sub[3]F#sub[10] nanocrystals @xia2021hydrothermal, and in
$beta$-NaYF#sub[4]:10%Yb#super[3+] nanowires. The latter were cooled by
$Delta T > 9$ K in a D#sub[2]O medium ($lambda_(upright("exc")) = 1020$
nm)@zhou2016laser@ortiz2021laser while optically levitated nanocrystals
of the same material were cooled by $Delta T = 42$ K
($lambda_(upright("exc")) = 1020$ nm).@luntz2021laser Laser cooling has
also been observed in porous $alpha$-NaYF#sub[4]
nanocubes@forberger2024synthesis and CaF#sub[2]:Yb#super[3+] spherical
microcrystals.@chen2024optical

Finally, laser cooling has been demonstrated in optical fibers. A
ZBLAN:Yb#super[3+] fiber has been cooled by $Delta T > 7$ K
($lambda_(upright("exc")) = 1030$ nm, $P_(upright("exc")) = 36.5$
W)@xie2023laser while a Yb#super[3+]-doped silica fiber has been cooled
by $Delta T = 18.4$ K ($lambda_(upright("exc")) = 1035$ nm,
$P_(upright("exc")) = 20$ W).@topper2021laser

== Semiconductor laser cooling claims
<subsect:semiconductor_cooling_claims>
Early semiconductor cooling attempts focused on GaAs quantum wells and
GaAs/GaInP heterostructures. This stemmed from the availability of high
quality specimens grown using molecular beam
epitaxy.@Gauck1997_GaAsGaInP@Bender2013_GaAsGaInP@giannini2021near@finkeissen1999cooling
Although Sheik-Bahae and co-workers realized a record setting GaAs/GaInP
double heterostructure $eta_(upright("EQE"))$ of
$0.995 plus.minus 0.001$ (a value above
$eta_(upright("EQE,crit")) = 0.987$), no cooling was observed. This was
ultimately attributed to too low a $eta_(upright("abs"))$-value
($eta_(upright("abs")) tilde.op 0.901$, $alpha_(upright("b"))$ = 91
cm$""^(- 1)$, #strong[@table:semiconductors]) due to the presence
of a parasitic background absorption that induced
heating.@Gauck1997_GaAsGaInP@Bender2013_GaAsGaInP While the origin of
this background absorption remains unknown, it is thought to relate to
point defects at GaAs/GaInP heterojunctions.

The one GaAs laser cooling claim to emerge from these early
studies@finkeissen1999cooling suggested a $Delta T tilde.op 7$ K cooling
below liquid nitrogen temperature. $Delta T$ was inferred by changes to
the intensity ratio of heavy hole to light hole emission. This claim,
though, was refuted by Sheik-Bahae and co-workers@hasselbeck2007effect,
who attributed observed spectral changes to photocarrier
density--dependent screening effects that altered exciton binding
energies.

More recent reports have investigated laser cooling in semiconductor
nanostructures. In 2013, Xiong and co-workers reported cooling a
chemical vapor deposition-grown CdS nanobelt by $Delta T = 40$ K from
room temperature.@Zhang2013Laser Cooling was reported as a blueshift of
the CdS emission when nanobelts were excited below gap. This contrasts
to redshifts seen when exciting above gap. Despite these observations
being in qualitative agreement with cooling, the claim has been
challenged due to significant disparities in observed versus predicted
cooling/heating timescales.@morozov2019can Up to a nine orders of
magnitude difference in timescales exists. Moreover, there are concerns
regarding the use of estimated, not measured,
$eta_(upright("EQE"))$-values and the lack of $eta_(upright("abs"))$
measurements or estimates. This is especially important given the likely
involvement of donor-acceptor states in the CdS nanobelt PL
up-conversion process.@xu2011dynamics@morozov2017defect

Xiong and co-workers have also reported cooling lead-based, hybrid
perovskite crystals, namely methylammonium lead iodide (MAPbI$""_3$)
microcrystals by $Delta T = 23$ K and two-dimensional (2D)
Ruddlesden-Popper, phenethylammonium lead iodide (PhEPbI$""_4$) crystals
by $Delta T = 58.7$ K, both from room temperature.@ha2016laser As with
their earlier CdS nanobelt report, similar concerns exist over
underreported cooling metrics and, more importantly, about observed
cooling/heating timescales being significantly longer than predicted.

In the realm of colloidal quantum dots, there are three primary cooling
claims for CdSe-based core/shell nanocrystals. The first is by Fontenot
#emph[et al.] who report laser cooling CdSe/ZnS quantum dots by
$Delta T = 2.3$ K from room
temperature.@fontenot2017optical@fontenot2016measuring The second is by
Decca #emph[et al.] who report a $Delta T = 0.37 plus.minus 0.08$~K
cooling from room temperature of analogous CdSe/CdS quantum
dots.@Hua2020Optical Finally, Peng and co-workers report a 0.18 K
relative cooling of their CdSe/CdS quantum dots.@Ye2021Phonon The
relative descriptor indicates suppressed heating.

For all-inorganic, CsPbBr$""_3$ perovskite nanocrystals, Sheldon
#emph[et al.] reported a $Delta T = 25$ K cooling of their particles
from room temperature.@Roman2020Optically Yamada #emph[et al.] have
likewise reported a $Delta T = 9$ K cooling of CsPbBr$""_3$ nanocrystal
inclusions in zero dimensional Cs$""_4$PbBr$""_6$ from room
temperature.@Yamada2024Optical

Despite all abovementioned results, stated claims of semiconductor
nanostructure optical refrigeration remain highly debated. This stems
from concerns about material quality and specifically as to whether said
cooling materials possess requisite unity/near-unity
$eta_(upright("EQE"))$-values. Attesting to this,
$eta_(upright("EQE"))$-values have often been assumed or estimated.
Additional concerns emerge from whether reported data adhere to known
thermodynamic constraints, which dictate the extent of cooling
(#emph[i.e.], $T_(upright("final"))$) as well as corresponding
cooling/heating timescales. Reference @morozov2019can provides more
details about these concerns with existing semiconductor cooling claims.
To standardize cooling assessments and to ensure their reliability going
forward, we have therefore developed an experimental checklist that
authors should follow when reporting semiconductor cooling claims,
published in Reference @Zhang2025Principles and summarized in
#strong[Section @subsect:reporting_standards].

= Applications
<section:applications>
== Optical cryocoolers
<subsect:cryocooler>
The low temperatures achieved with RE#super[3+]-doped crystals position
them as excellent candidates for creating vibration-free optical
cryocoolers. Such a cooler is designed to refrigerate an arbitrary
payload, typically by attaching it to a cold finger. The cold finger is
connected to the cooling crystal via a thermal link, which provides good
thermal contact. The entire system resides in vacuum to minimize
convective heat loads. As such, a crycooler is a composite system,
consisting of three subsystems: (I) a cooling sample at temperature
$T_(upright(s a m p l e))$, (II) a thermal link at temperature
$T_(upright(l i n k))$, and (III) a cold finger/payload at temperature
$T_(upright(p a y l o a d))$.

To maximize the system's cooling power, the interplay of all thermal
loads on the system is modeled. For the sample, a governing equation
is@seletskiy2010oe@Melgaard2011UNM@Meng2020UNM
$ C \( T \) frac(d T_(upright(s a m p l e)), d t) = - dot(Q)_(upright("cool")) + dot(Q)_(upright("env")) \, $<eqn:T_change>
where $C \( T \) = rho c_(upright("v")) \( T \) V_(upright("sample"))$
is the sample's heat capacity given a density $rho$, a specific heat
capacity $c_(upright("v")) \( T \)$, and a sample volume
$V_(upright("sample"))$. $dot(Q)_(upright(e n v))$ is an environmental
heat load and is
$ dot(Q)_(upright("env")) = frac(kappa_(upright("link")) \( T_(upright(l)) \) A_(upright("link")), d_(upright("l"))) \( T_(upright("link")) - T_(upright("sample")) \) + frac(epsilon.alt_(upright("sample")) A_(upright("sample")), 1 + chi) sigma \( T_(upright("clamshell"))^4 - T_(upright(s a m p l e))^4 \) \, $<eqn:heat_load>
where $sigma$ is the Stefan-Boltzmann constant and the first term is a
conductive heat load on the sample from the thermal link while the
second is a radiative load. For brevity, a term describing a conductive
heat load from sample mechanical supports (which can be minimized, see
below) is omitted. The thermal link is parameterized by a
cross-sectional area, $A_(upright("link"))$, an average length,
$d_(upright("link"))$, and a thermal conductivity,
$kappa_(upright("link"))$ so that in the second term,
$ chi = \( 1 - epsilon.alt_(upright("clamshell")) \) frac(epsilon.alt_(upright("sample")) A_(upright("sample")), epsilon.alt_(upright("clamshell")) A_(upright("clamshell"))) \, $<eqn:chi_radiative>
where $A_(upright("sample"))$ and $A_(upright("clamshell"))$ are the
surface areas of the sample and a surrounding enclosure (called a
clamshell), each with thermal emissivity
$epsilon.alt_(upright("sample"))$ and
$epsilon.alt_(upright("clamshell"))$, respectively.

Equations of state for subsystems II and III exclude
$dot(Q)_(upright("cool"))$ and follow the framework outlined in
#strong[Equations @eqn:T_change]-#strong[@eqn:chi_radiative], adapted to
their respective environments (for details, see @Meng2020UNM).
Temperatures
${ T_(upright(s a m p l e)) \, T_(upright(l i n k)) \, T_(upright(p a y l o a d)) }$
are obtained from a self-consistent solution to the coupled equations of
state for the three subsystems.

We now discuss how each subsystem is optimized to ensure maximal cooling
power delivery to the payload. In short, the general strategy entails
maximizing $dot(Q)_(upright(c o o l))$, maximizing its delivery to the
payload all while minimizing heat loads across subsystems. The payload
must simultaneously be protected against absorption of ASPL and/or
scattered pump light, either of which, if absorbed, could reduce or even
negate available cooling power.

#emph[Sample design.] To achieve useful optical cryocooler performance,
cooling materials with a sufficiently low gMAT must be used.
$P_(upright("cool")) = eta_(upright("c")) P_(upright("abs"))$
(#strong[Equation @eqn:Pcool_equation_wavelength]) is maximized by using
a multi-pass pumping scheme, #emph[e.g.], through use of an astigmatic
Herriott cell.@Gragossian2016OE See #strong[Sections
@section:experimentation] and #strong[@section:results] for additional
considerations.

#emph[Thermal link design.] The main function of the thermal link is to
provide good thermal contact between subsystems I (sample) and III
(payload). Unless the payload is transparent to the ASPL from the
cooling sample (#emph[e.g.], cooling a GaAs device with YLF:Yb#super[3+]
@seletskiy2010oe), the thermal link must simultaneously prevent emission
reaching the payload. This is a critical issue, since the cooling power
is only a fraction of the incoming laser power
($P_(upright("cool")) = eta_(upright("c")) P_(upright("abs")) approx eta_(upright("c")) P_(upright("em"))$),
which becomes small when
$T_(upright(s a m p l e)) approx T_(upright(g M A T))$. Yet, the payload
can potentially see the full magnitude of $P_(upright(e m))$. Hence,
payload optical isolation must considerably exceed
(1-$eta_(upright(c))$). In practice, this amounts to a 99.5% or higher
requirement for stray light suppression.

Presently, the best thermal link designs are based on transparent
materials, which fulfill criteria such as low parasitic absorption, high
thermal conductivity, and a closely matched coefficient of thermal
expansion (CTE) between cooling crystal and link.@Meng2020UNM In the
case of a YLF:Yb#super[3+] cooler, thermal link candidate materials
include sapphire (suffers from a CTE mismatch), undoped YLF (low thermal
conductivity), and MgF$""_2$. To optically isolate payloads, one or more
near-90-degree bends can be employed. An optimized geometry is
highlighted in Reference @hehlen2018. Textured surfaces can also be used
to limit ASPL waveguiding towards payloads (#strong[Figure
#link(<fig:Figure_3>)[Figure 3(a)]]). Ideally, adhesive-free bonding should be used to
connect the cooling crystal to the thermal link @hehlen2018, although a
very thin layer of cyanoacrylate adhesive has been successfully
demonstrated.@kock2022ol

#emph[Conductive load minimization.] Cryocooler mechanical supports
typically dominate parasitic conductive heat loads. To minimize this
(#strong[Equation @eqn:heat_load]), low thermal conductivity supports
such as a silica aerogel@Fesmire_2019 or small cross-section and long
length supports, like optical fibers or a Kevlar
suspension@TIMBIE1990271 can be implemented.

#emph[Radiative load minimization.] A tight-fitting clamshell with
surface area $A_(upright(c l a m s h e l l))$ surrounds most of the
cryocooler assembly (surface area, $A_(upright(s y s t e m))$). This
reduces the system's radiative load by maximizing $chi$ in
#strong[Equation @eqn:chi_radiative] (#emph[i.e.],
$A_(upright(c l a m s h e l l)) arrow.r A_(upright(s y s t e m))$).
Cooling sample and thermal link material properties determine their
emissivities. The parasitic radiative load on the cold finger and any
metallic component of the payload is reduced by mechanical polishing or
surface gold-plating, lowering their respective thermal emissivities.
The clamshell is coated with a solar-selective coating@thiede2005cooling
that exhibits low thermal emissivity near thermal wavelengths of 10
$mu$m. For Yb#super[3+] cryocoolers, the coating is highly absorptive in
the 1 $mu$m wavelength range where Yb#super[3+] fluoresces to suppresses
scattered or reflected PL. The clamshell's close proximity to the cooler
assembly (approximately 1 mm) along with additional baffling prevents
direct or scattered ASPL or pump laser light from reaching the cold
finger or payload.

In this way, a HgCdTe detector payload has been cooled to 135 K by a
YLF:Yb#super[3+] cryocooler.@hehlen2018 More recent demonstrations have
shown payload cooling to 125 K@kock2022ol (#strong[Figure
#link(<fig:Figure_3>)[Figure 3(b)]]), opening up opportunities for high-precision metrology
applications.@Kessler2012NaPho

#figure(image("source/Figure_3.png", width: 80.0%),
  caption: [
    \(a) Photograph of a cryocooler. The cooling crystal
    (YLF:Yb#super[3+] 10%) is attached to a copper cold finger (CF) via
    a textured MgF#sub[2] thermal link. Note that the clamshell has been
    removed for this photograph. (b) Measured temperature of YLF (via
    DLT) and CF (via silicon diode) during payload cooling to 125
    K.@kock2022ol
  ]
)
<fig:Figure_3>

== Radiation-balanced lasers and amplifiers
<subsect:rbl_and_rba>
In 1999, Bowman established conditions where the heat produced by a
laser's operation could be balanced by optical refrigeration to create
an "athermal", radiation-balanced laser (RBL).@Bowman1999JQE Motivating
this was the desire to overcome heating effects such as
temperature-induced and spatially-varying birefringence. Furthermore, an
athermal RBL would overcome power scaling roll-over issues that plague
conventional high-power lasers, even in thin-disk
configurations.@Giesen1994

A complementarity between RBL operation and optical refrigeration is
seen through the lens of a heat engine. Shortly after the invention of
the maser, Scovil and Schulz-DuBois established its formal connection to
the Second Law of thermodynamics.@Scovil1956PRL These arguments were
later extended to the laser.@Kosloff2014ARPC By defining a maser/laser
efficiency,
$eta_(upright("laser")) = nu_(upright("l")) / nu_(upright("p"))$, where
$nu_(upright("l"))$ is the laser output frequency and
$nu_(upright("p"))$ is the pump frequency, Scovil and Schulz-DuBois
demonstrated that $eta_(upright("laser"))$ obeyed the Carnot limit
wherein
$eta_(upright("laser")) lt.eq eta_(upright("Carnot")) = 1 - T_(upright("c")) / T_(upright("h"))$.

A three-level laser is therefore a heat engine that operates between a
hot bath at a temperature, $T_(upright("h"))$, and a cold bath at a
temperature, $T_(upright("c"))$, generating coherent radiation
(#emph[i.e.], work) at a frequency $nu_(upright("l"))$. The hot
reservoir provides energy, a portion of which becomes work. The
remainder, in the form of entropy, is deposited into the cold reservoir.
For a laser, the cold reservoir entails lattice phonons, spontaneous
emission, parasitic non-radiative decay, and any other decay channel
that does not produce work. Energy deposited into the cold reservoir
irreversibly increases the laser's entropy via heating.

When run in reverse, the laser heat engine acts as a heat pump,
transferring heat from the cold reservoir to the hot one through
inputted work. Optical refrigeration can therefore be visualized as a
laser heat pump, which uses inputted, coherent laser radiation to pump
heat from a cold reservoir (the material-to-be-cooled) to a hot one
(photoluminescence emitted into the surroundings). The reversing of the
laser heat engine should not be confused with recent demonstrations of
"time-reversed lasers" where resonant cavities are used to achieve a
"coherent perfect absorber".@Chong2010PRL A true thermodynamic analogue
requires that the intracavity element be cooled and has only been
demonstrated through cavity-enhanced optical
refrigeration.@seletskiy2010APL@seletskiy2016laser

Various lasing materials have been evaluated for their RBL
suitability.@bowman2000new@Nemova2021ApSci The first RBL was
demonstrated in 2002 using a bulk KGd(WO$""_4$)$""_2$:Yb#super[3+]
(KGW:Yb#super[3+]) crystal.@Bowman2002CLEO Shortly thereafter, detailed
pump-wavelength stability/gain fluctuation modeling@Bowman2002JQE,
coupled to the development of a thermodynamic RBL
formalism@Mungan2003JOSAB, motivated demonstrations of athermal 490-W
KGW:Yb#super[3+] disk@Bowman2005JQE and 500-W YAG:Yb#super[3+] rod
lasers@Bowman2010JQE, both operating in quasi-CW modes. The success of
high-power laser designs using thin-disk gain media@Giesen1994 motivated
theoretical@Nemova2014OC and experimental@Yang2019OE implementations of
RBLs in Yb#super[3+]-doped thin-disk geometries. This led to the
realization that input pump and output laser modes needed to be matched
to avoid thermal gradients in the gain
medium.@Mungan2003JOSAB@Nemova2014OC@Yang2019OE These efforts culminated
in a full analysis of optimal RBL performance.@Sheik-Bahae2020JQE
Parallel efforts on gain-material platforms that naturally avoid thermal
parasitics include theoretical analyses@Nemova2009JOSAB@Mafi2020JOSAB as
well as experimental demonstrations of RBAs@Knall2021PRL and
RBLs@knall2021radiation in single-mode optical fibers
(Yb#super[3+]-doped fused silica) and microspheres.@Xia2021SPIE

Other RBL advances include the development and optimization of
Yb#super[3+]-doped YLF, LuLiF$""_4$ (LLF)@Volpi2021SPIE, YAG, and
KY(WO$""_4$)$""_2$ (KYW:Yb#super[3+])@Cheng2023PhD hosts, as well as
proposals for tandem material systems, including
semiconductor/YLF:Yb#super[3+]@Khurgin2020JOSAB and mid-infrared
YLF:Tm#super[3+]/YLF:Ho#super[3+] RBLs.@rostami2019tm There have also
been promising cooling results reported for YLF:Tm#super[3+] and
BaY$""_2$F$""_8$:Tm#super[3+] (BYF:Tm#super[3+]) systems@Rostami2020UNM
along with analogous advances with fiber-based RBLs, in terms of
improved materials science@Thomas2023OM and design
optimization.@Chen2025SPIE In whole, the above efforts point to the
eventual realization of high-power, RBLs/RBAs in the near- and
mid-infrared frequency regions, which will advance laser science as well
as critical, low laser noise applications.

== Metrology
<sect:metrology>
=== Surface enhanced Raman spectroscopy
<subsect:SERS>
High precision sensing is another branch of applications that stands to
benefit from laser refrigeration. As illustration, surface-enhanced
Raman spectroscopy (SERS) provides molecular-level sensitivity and
nanoscale temperature mapping of materials. In these measurements,
photosensitive substrates or analytes are susceptible to photothermal
damage. This stems from strong field confinement and absorption
associated with field enhancing plasmonic nanostructures. Induced local
heating can consequently photobleach dyes, denature proteins, or cause
chemistry in fragile molecules.@kneipp1997single These thermal effects
distort Raman spectral signatures, restrict excitation
powers/acquisition times, and ultimately limit the Raman technique's
quantitative reliability.

Numerous approaches have been explored to alleviate heating in SERS
measurements.@altangerel2023 This includes using pulsed illumination,
thermal conduction layers, or cryogenic environments. These methods,
however, are largely passive and do not dynamically counteract nanoscale
temperature rises.

Integrating optical refrigeration into plasmonic systems offers an
active and potentially transformative solution. This includes using
Yb$""^(3 +)$-, Er$""^(3 +)$-, or Tm$""^(3 +)$-doped YLF or NaYF$""_4$ to
cool plasmonic
structures.@roder2015laser@seletskiy2010laser@zhou2016laser In such
systems, heating and cooling coexist synergystically wherein plasmonic
amplification of Raman scattering cross-sections is accompanied by
RE#super[3+]-induced cooling that reduces photothermal stress during
measurements.

Early studies of laser cooling-assisted SERS platforms now report
measurable temperature reductions and improved spectral stabilities
under continuous-wave illumination.@pant2020solid Beyond mitigating
sample degradation, such active cooling stands to refine the accuracy of
Raman thermometry by providing nanoscale temperature control of
specimens. With continued advances in RE#super[3+]-doped materials and
plasmonic design, future self-cooling SERS systems may enable
long-duration, high-power Raman spectroscopy of sensitive biological and
molecular systems without external cryogenics.

=== Optomechanics
<subsect:optomechanics>
Another area that will benefit from solid-state laser cooling is
levitated optomechanics. In these studies, heating induced by high-power
trapping lasers, leads to instability and increased noise levels,
especially at low pressures. An encouraging development has therefore
been the $Delta T = 59$ K laser refrigeration of individual
$alpha$-NaYF:Yb#super[3+] nanoparticles, levitated by a single beam trap
in vacuum. This holds promise for studying optically-levitated
nanomaterials at lower pressure with intrinsic temperature control to
minimize noise levels.@luntz2021laser Spherical CaF$""_2$:Yb$""^(3 +)$
microparticles trapped in dual beam vacuum levitation setups similarly
represent promising candidate systems.@gregoire2025exploring

=== Actively cooled sensors
<subsubsect:actively_cooled_sensors>
Composite laser refrigeration/sensor materials have additionally been
developed and demonstrated. Specific examples include nanodiamonds with
nitrogen vacancy (NV) centers deposited atop YLF:Yb$""^(3 +)$ crystals.
By optically cooling YLF:Yb$""^(3 +)$ $Delta T = 27$ K below room
temperature, thermally-induced spectral wandering of nanodiamond NV
centers has been suppressed.@pant2020solidb Similarly, YLF:Yb$""^(3 +)$
microcystals have been used to cool CdS optomechanical resonators by
over 20 K.@pant2020solid This opens the door to potential applications
in scanning probe microscopy, force sensing, and the ultraprecise
measurement of atomic masses.

Finally, nanodiamonds shelled with $alpha$-NaYF:Yb$""^(3 +)$ have been
developed for applications in optically-levitated, high precision
quantum sensing.@forberger2022synthesis To date, these composites have
not refrigerated. These early-stage efforts in laser-refrigerated,
levitated optomechanics and optically-cooled sensor composite materials,
however, show promise and point to many fields of metrology being
enhanced by micro- or nanoscale laser cooling materials.

=== Gravitational waves and extremely narrow-linewidth lasers
<subsubsect:frequency_combs>
The vibration-free nature of optical refrigeration likewise makes it
attractive for applications in high-precision sensing, which require
cooling without mechanical vibrations that accompany the operation of
mechanical pumps or the evaporation of liquid cryogens. As an
illustration, a recent proposal for detecting high-frequency
gravitational waves relies on the optical levitation of two-dimensional,
disc-shaped particles within the arms of a Michelson
interferometer.@aggarwal2022 The two-dimensional morphology of the discs
enhances forward-scattering of laser radiation, which increases the
interferometer's sensitivity. Laser heating of the disc, caused by
absorption of infrared levitation laser light, however, increases photon
shot-noise from blackbody radiation. This decreases the interferometer's
sensitivity. Recently, hexagonal $beta$-NaYF disks with micron-scale
diameters have been optically levitated in vacuum within two
standing-wave trap arms of a Michelson interferometer.@winstone2022
These discs have also been demonstrated to undergo laser
cooling@Felsted2022 and point to the eventual mitigation of blackbody
photon shot noise in these measurements via laser cooling.

Of similar note is the recent realization of an ultrastable
laser@Kessler2012NaPho, achieved by locking it to an external,
cryogenically-refrigerated, monolithic Si cavity. The etalon is cooled
to 124 K, where Si possesses a null coefficient of thermal expansion.
This dramatically reduces cavity thermomechanical noise and imparts
unprecedented frequency stability to the locked laser. Although, cooling
was achieved using a vibration-stabilized, nitrogen gas cryostat, future
studies will likely use vibration-free optical cryocoolers once cooling
powers of approximately 0.2 W have been realized (see #strong[Section
@subsubsect:power_scaling]).

= Reproducibility and data deposition
<section:reproducibility>
== Rationale for reporting standards
<rationale-for-reporting-standards>
Because solid state laser cooling is premised on the delicate and
precarious balance between radiative and non-radiative processes in
materials (#strong[Section @subsect:cooling_formulas]), it is
exquisitely sensitive to small variations in material quality, optical
coupling, heat management and thermometry.@hasselbeck2007effect This has
led to questions about the reliability of condensed phase laser cooling
claims over the
years@finkeissen1999cooling@Clark1996laser@mungan1996comment, most
recently within the area of semiconductor
cooling.@Zhang2013Laser@morozov2019can@nemova2010laser

The ongoing debate regarding semiconductor optical refrigeration
highlights the need for a standardized, experimental minimum reporting
criterion to ensure the reliability and reproducibility of cooling
claims. Reference @Zhang2025Principles summarizes this criterion whose
key points are outlined below.

- #strong[$eta_(upright("EQE"))$ and $eta_(upright("abs"))$:] Most
  important is that requisite unity/near-unity $eta_(upright("EQE"))$-
  and $eta_(upright("abs"))$-values be measured and reported. For the
  former, absolute quantum yield measurements are preferred given
  complications with less direct (relative) approaches. These
  complications have been detailed in Reference @zhang2019progress. For
  the latter, accurate estimates of RE#super[3+] or semiconductor
  $alpha_(upright("b"))$-values are required. Alternatively, more
  involved temperature- and $Delta E$-dependent up-conversion
  measurements can be used to estimate
  $eta_(upright("abs"))$.@zhang2024resonant

- #strong[Timescales:] Observed $Delta T$, $T_(upright("final"))$, and
  associated cooling timescales, $tau$, must be reported. This is
  because thermodynamic constraints due to a specimen's effective heat
  capacity, including all potential heat loads from a substrate or
  surrounding matrix as well as environmental blackbody radiation,
  dictate realizable $Delta T$, $T_(upright("final"))$, and involved
  timescales.

  Temperature changes follow
  $T \( t \) approx T_0 - P_(bold("cool")) / kappa \( 1 - e^(- t / tau) \)$
  where $T_0$ is the initial temperature (K) and $kappa$ is a heat
  transfer coefficient (W K$""^(- 1)$). An associated final temperature
  is therefore $T_(upright("final")) = P_(bold("cool")) / kappa$ with an
  associated cooling (or heating) timescale of $tau = C / kappa$. $C$ is
  the specimen's effective heat capacity (J K$""^(- 1)$) and includes
  contributions from all thermal loads on the cooling material.

- #strong[Thermometry:] Details of the temperature measurement approach,
  as well as calibration procedure, must be provided. In general,
  specimen-independent measurement techniques such as thermal cameras
  are preferred (#strong[Section @subsect:thermometry]). Primary
  thermometry should be cross-checked using a second, independent
  approach. For example, calibrated DLT thermometry could be used to
  confirm measured temperatures. However, it should be kept in mind that
  PL-based techniques such as
  DLT@imangholi2006differential@patterson2010measurement@seletskiy2010laser
  are susceptible to influence by extrinsic or intrinsic sources of
  spectral changes@hasselbeck2007effect, as described in #strong[Section
  @subsect:thermometry].

- #strong[Cooling and Heating:] Finally, reversible cooling and heating
  must be demonstrated. This is motivated by the need to exclude
  extraneous changes to materials, which mimic cooling. Here,
  #strong[Equation @eqn:eta_cool_equation_wavelength] and #strong[Figure
  @fig:Figure_4] reveal two heating/cooling transition points as
  $lambda_(upright("exc"))$ is increased above
  $macron(lambda)_(upright("em"))$. Both transition points occur when
  $eta_(upright("c")) = 0$ (#strong[Equation
  @eqn:eta_cool_equation_wavelength]) where
  $lambda_(upright("exc")) = frac(macron(lambda)_(upright("em")), eta_(upright("EQE")) eta_(upright("abs")))$.
  Between these points, there exists a cooling window where
  $P_(upright("cool")) > 0$ ($eta_(upright("cool")) > 0$). Outside the
  window, $P_(upright("cool")) < 0$ ($eta_(upright("cool")) < 0$) so
  that only heating is observed. Studies should therefore demonstrate
  reversible cooling and heating about these points via control of
  $lambda_(upright("exc"))$. One approach that readily satisfies this
  requirement and which simultaneously provides independent estimates of
  $eta_(upright("EQE"))$ is
  LITMoS.@melgaard2014identification@seletskiy2013precise

#figure(image("source/Figure_4.png", width: 65.0%),
  caption: [
    Simulated (a) $eta_(upright("c"))$ and (b) $eta_(upright("abs"))$
    for CsPbBr$""_3$ nanocrystals ($eta_(upright("EQE")) = 0.991$,
    $alpha_(upright("b")) = 3 times 10^(- 4)$ cm$""^(upright("-1"))$).
    Indicated are cooling and heating regimes as well as corresponding
    transition points.
  ]
)
<fig:Figure_4>

== Reporting and data deposition checklists
<subsect:reporting_standards>
Reporting entails a comprehensive description of the methods used to
acquire cooling data. This includes the following recommended reporting
checklist.

=== Specimen-related checklist
<specimen-related-checklist>
- For RE#super[3+]-doped materials, report specimen doping
  levels/concentrations and material purity.

- For either RE#super[3+]-doped or semiconductor nanostructures, provide
  information on crystallinity, mean size, ensemble polydispersity, and
  nature of the surface passivation. This includes nanostructure
  concentrations in systems that involve ensembles or dispersions.

- Provide cooling specimen details (#emph[e.g.], substrate, specimen
  supports, thermal isolation) as well as origin of parasitic heat
  loads.

=== Laser cooling-related checklist
<laser-cooling-related-checklist>
- Report $eta_(upright("EQE"))$, details on how it was measured
  (#emph[e.g.], integrating sphere or otherwise), and measurement
  errors.

- Report $eta_(upright("abs"))$ and/or $alpha_(upright("b"))$. Ensure
  that the product, $eta_(upright("EQE")) eta_(upright("abs"))$, exceeds
  a critical cooling metric,
  $eta_(upright("EQE")) eta_(upright("abs")) > 1 - frac(Delta E, macron(E)_(upright("em")))$.

- Provide demonstrations of explicit cooling versus heating, including
  reversible transitions between the two regimes about
  $frac(macron(lambda)_(upright("em")), eta_(upright("EQE")) eta_(upright("abs")))$
  See #strong[Equation @eqn:eta_cool_equation_wavelength] and
  #strong[@fig:Figure_4].

- Provide measurement details of all temperature thermometries employed,
  including information on their calibration as well as temperature and
  time resolution.

- Report estimated cooling/heating $tau$ based on thermodynamic
  constraints on the system. Provide estimated $Delta T$ and
  $T_(upright("final"))$. Values should be accompanied by explicit
  comparisons to experiment.

- Detail employed excitation sources, including information on spectral
  linewidths, wavelength tuning method, output polarization, output
  power, power stability, and beam characteristics at the sample,
  #emph[e.g.], $1 / e^2$ diameter.

= Solid state cooling limitations
<section:limitations>
== Minimum achievable temperature
<subsubsect:MAT_and_gMAT>
For YLF:Yb#super[3+], the workhorse material of bulk optical
refrigerators, its gMAT is $approx$70 K for a 10% doping
concentration.@volpi2019optical This cooling floor primarily stems from
its non-zero, background absorption coefficient of
$alpha_(upright(b)) = 2 times 10^(- 4) med upright(c m)^(- 1)$ at room
temperature, which decreases with decreasing
temperature.@volpi2019optical Transition-metal ions such as iron are
considered to be the primary contributor to
$alpha_(upright("b"))$.@hehlen2007model@melgaard2014identification
Although increasing Yb#super[3+] concentrations can compensate for
$alpha_(upright("b"))$, realizing net cooling with Yb#super[3+] doping
values larger than 20% remains challenging due to pronounced energy
transfer to said impurities.@puschel2024impact

Reducing YLF:Yb#super[3+] impurity levels is therefore key to achieving
a lower YLF:Yb#super[3+] gMAT-value. To this end, Patterson #emph[et
al.] have reported preparing ultra pure metal fluorides by combining
chelate-assisted solvent extraction with HF-gas fluorination. What
results is a 1000-fold reduction of transition-metal contamination to
the 100 part-per-billion (ppb) level.@patterson2011case Repetitive
crystallization processes, such as zone-refining or zone-melting also
represent promising techniques for eliminating impurities with low
segregation coefficients.

Despite above noted YLF:Yb#super[3+] milestones (#strong[Table
#ref(label("table:RE3+_crystal_milestones"))]), its predominance stems
from the availability of high-quality, high-purity single crystals
rather than any intrinsic advantage it possesses over other
Yb#super[3+]-doped crystals. We have already indicated
KY#sub[3]F#sub[10]:Yb#super[3+] as a promising alternative material,
which possesses a lower gMAT.@puschel2022laser@puschel2023ytterbium
Using different RE#super[3+] ions with lower
$macron(E)_(upright("em"))$-values than Yb#super[3+] (#strong[Table
#ref(label("table:RE3+_summary"))]) may further reduce RE#super[3+] gMAT
values. Here, Rostami and Sheik-Bahae have identified
BaY#sub[2]F#sub[8]:Ho#super[3+] as a candidate system for 2-$mu$m
optical refrigeration with the potential for a sub 70 K
gMAT.@rostami2021observation

For cooling nanocrystals, the Purcell effect, which enhances spontaneous
emission rates in resonant optical cavities or photonic structures, can
substantially increase $eta_(upright("c"))$ and, by extension, reduce
associated gMAT-values.@ju2024purcell@benzaouia2024purcell A numerical
analysis by Peng #emph[et al.] reveals a YLF:Yb#super[3+] nanocrystal
gMAT of 38 K for a Purcell factor of 180 along with realistic
$eta_(upright(E Q E))$ and $eta_(upright(a b s))$-values.@ju2024purcell
This assumes no additional losses are introduced, as parameterized by
$alpha_(upright("b"))$.

== Power scaling
<subsubsect:power_scaling>
An important challenge for any optical cryocooler is to increase its
cooling power. Current best of class RE#super[3+] cryocoolers have
$P_(upright("cool"))$-values of order 0.1 W.@seletskiy2010laser Although
#strong[Equation @eqn:Pcool_equation_wavelength] points to
$P_(upright("cool"))$ increasing linearly with increasing
$P_(upright("abs"))$, this only applies at intensities much smaller than
the saturation intensity of RE#super[3+] resonant transitions. Above
saturation, $eta_(upright("abs"))$ and $eta_(upright("c"))$ decrease
and, in turn, lower $P_(upright("cool"))$ ($alpha_(upright("b"))$ is
assumed to not saturate).

Current astigmatic Herriott cell@Gragossian2016OE multi-pass pumping
schemes minimize saturation effects by spreading laser passes throughout
the whole specimen volume. This comes at the cost of increasing the
complexity of Herriott cell engineering. Another strategy reduces
saturation effects by using total internal reflection to trap pump light
at vacuum/crystal interfaces.@thiede2005cooling This is done by coating
cooling elements with highly reflective mirrors. A drawback of the
approach, though, is a reduced absorption efficiency, due to sub-optimal
orientation of internally reflected pump light polarizations relative to
a cooling element's optical axis.

Increasing specimen size also effectively lowers pump intensities.
Unfortunately, the approach increases the likelihood of detrimental PL
reabsorption, which redshifts $macron(lambda)_(upright("em"))$ to reduce
$eta_(upright("c"))$ (#strong[Equation
@eqn:eta_cool_equation_wavelength]). For RE#super[3+] cryocoolers, large
or oddly-shaped crystals further impede good thermal conductivity to
payloads (#strong[Section @subsect:cryocooler]). Thus, in combination
with above-outlined $P_(upright("cool"))$ enhancement strategies, the
only current solution for scaling solid state optical refrigeration
cooling powers involves parallelizing cooling by attaching multiple
cooling elements to individual payloads. This increases the complexity
of solid state laser cooling solutions and stands as an open challenge
for the field going forward.

= Outlook
<section:outlook>
Solid-state laser refrigeration remains a vibrant and dynamic research
field with wide-ranging opportunities for breakthroughs in the design
and discovery of materials with unity/near-unity $eta_(upright("EQE"))$-
as well as with correspondingly large $eta_(upright("abs"))$-values.
Attesting to this, advances in the synthesis of high-quality,
RE#super[3+]-doped materials have enabled important demonstrations of
payload cooling to cryogenic temperatures.@hehlen2018@kock2022ol

Analogous advances in the synthesis of RE#super[3+]-doped ceramic nano-
and micron-scale materials promise important breakthroughs in the
solid-state laser refrigeration of dielectrics used in quantum
communication and quantum sensing@gali2019, the generation of quantum
squeezed states of light@magrini2022, high-power optically-levitated
accelerometers@gregoire2025exploring, the detection of high-frequency
gravitational waves@aggarwal2022@winstone2022, surface-enhanced Raman
spectroscopy@altangerel2023, and also the design and realization of
radiation balanced microlasers and amplifiers.@knall2021radiation@fb2018
Additionally, based on pioneering demonstrations of cold Brownian motion
at physiological conditions@roder2015laser, the in vitro laser cooling
of organelles, ion channels, and molecular machines represents a
promising future direction for single-molecule biophysics.@peng2025

For all above use cases, semiconductor optical refrigeration represents
a significant advance given lower predicted cooling floors. However,
despite decades of efforts, their laser cooling remains a significant
challenge. An ongoing debate exists as to whether actual semiconductor
cooling examples exist.@pant2019@morozov2019can Here, we identify
low-dimensional semiconductors as a promising future direction of
research towards realizing verifiable examples of semiconductor optical
refrigeration.

Key challenges remain in improving the overall thermodynamic efficiency
of solid-state laser cooling. ASPL photon recycling is one viable
approach for boosting thermodynamic efficiencies closer to the Carnot
limit.@epstein2009optical Proposed designs for scaling cooling power
already approach the performance requirements of various applications
discussed in this Primer. In parallel, the development of narrow-gap
materials in the telecom ($tilde.op 1.5$ $mu$m) or mid-infrared (2.5-5
$mu$m) spectral ranges represents another promising pathway for
increasing thermodynamic efficiencies. With these enhancements,
solid-state laser coolers are poised to enable multiple uses, from basic
and applied research to industrial applications.

#bibliography("references.bib", style: "ieee", title: [References])

= Acknowledgments
<section:Acknowledgments>
Y.D., S.Z., A.R.A., M.P.H., P.J.P., D.V.S., and M.K. thank the Air Force
Office of Scientific Research for financial support via the MURI:MARBLe
project (FA9550-16-1-0362) and Grant FA9550-24-1-0668. We dedicate this
work to Professor Mansoor Sheik-Bahae (1956-2023), a pioneer in the
field of solid-state laser cooling who laid the foundations of many
theoretical insights, modeling results, and experimental ideas,
summarized in this Primer.

= Author information
<section:AuthorInfo>
#heading(level: 2, numbering: none)[Authors and Affiliations]
<authors-and-affiliations>
#strong[Department of Chemistry and Biochemistry,
University of Notre Dame, Notre Dame, IN, USA.] Yang Ding, Shenghao
Zhang & Masaru Kuno

#strong[Department of Physics and Astronomy,
University of New Mexico, Albuquerque, NM, USA.] Alexander R. Albrecht &
Denis V. Seletskiy

#strong[Department of Materials Science, University
of Washington, Seattle, Washington, USA.] Zhaojie Feng, Lars Forberger &
Peter J. Pauzauskie

#strong[Leibniz-Institut für Kristallzüchtung (IKZ),
Berlin, Germany.] Hiroki Tanaka

#strong[Los Alamos National Laboratory, Los Alamos,
NM, USA.] Markus P. Hehlen

#strong[Department of Engineering Physics,
Polytechnique Montréal, Montreal, Canada.] Galina Nemova & Denis V.
Seletskiy

#strong[Department of Physics and Astronomy,
University of Notre Dame, Notre Dame, IN 46556, USA] Masaru Kuno

#heading(level: 2, numbering: none)[Contributions]
<contributions>
All authors contributed to each section, and reviewed and edited the
manuscript before submission.

= Ethics declarations
<ethics-declarations>
#heading(level: 2, numbering: none)[Competing interests]
<competing-interests>
The authors declare no competing interests.
