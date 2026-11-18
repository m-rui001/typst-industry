// Chej et al., arXiv:2603.09607v1. Converted from the authors’ LaTeX under CC BY 4.0.
// https://arxiv.org/abs/2603.09607v1 | https://creativecommons.org/licenses/by/4.0/
#set heading(numbering: "1.")
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
  title: [Swirl flow in microchannels: patterned slip walls enhance heat
transport],
  authors: (
    ( name: [L. G. Chej, M. F. Carusela, A. G. Monastra \
Laboratorio de Modelado y Simulación Computacional, Instituto de
Ciencias \
Universidad Nacional de General Sarmiento \
Los Polvorines, Buenos Aires, CP1613, Argentina \
Consejo Nacional de Investigaciones Científicas y Técnicas \
Ciudad Autónoma de Buenos Aires, C1425FQB, Argentina \
Corresponding author: `lchej@campus.ungs.edu.ar` \
J. Harting \
Helmholtz-Institut Erlangen-Nürnberg für Erneuerbare Energien (IET-2) \
Forschungszentrum Jülich \
Cauerstraße 1, 91058 Erlangen, Germany \
Department Chemie---und Bioingenieurwesen und Department Physik \
Friedrich-Alexander-Universität Erlangen-Nürnberg \
Cauerstraße 1, 91058 Erlangen, Germany P. Malgaretti \
Helmholtz-Institut Erlangen-Nürnberg für Erneuerbare Energien (IET-2) \
Forschungszentrum Jülich \
Cauerstraße 1, 91058 Erlangen, Germany],
      affiliation: "",
      email: "" ),
    ),
  abstract-title: [Abstract],
  abstract: [Microchannel heat sinks (MCHS) are widely used for thermal
management in high-power electronics due to their ability to dissipate
large heat fluxes with minimal coolant consumption. While numerous
strategies---such as geometric modifications, surface disruptions, and
enhanced coolant formulations---have been explored to improve heat
transfer, many of these approaches increase hydraulic resistance and
pumping power requirements. Recent studies have shown that slip/no-slip
wall patterns can enhance flow rates and convective heat removal without
additional energy input, and that patterned microstructures can induce
secondary swirling motions known to promote mixing and heat transfer.
Motivated by these findings, we investigate a slip/no-slip pattern
specifically designed to generate swirl flow inside a straight
microchannel. Building upon prior work on passive chaotic advection and
boundary-condition engineering, we assess the hydrodynamic and thermal
performance of this patterned configuration under conditions relevant to
laminar microchannel cooling. Our results demonstrate that appropriately
arranged slip/no-slip regions can induce swirl without geometric
perturbations or increased pumping power, ultimately improving heat
transfer efficiency at fixed volumetric flow rate. This study highlights
the potential of boundary-condition patterning as a simple,
energy-neutral strategy for enhancing the performance of microfluidic
heat-transfer devices.

],
  pagenumbering: "1",
  cols: 1,
  doc,
)


#set heading(numbering: "1.")

= Introduction
<introduction>
Since the seminal work of Tuckerman and Pease \[1\], microchannel heat
sinks (MCHS) have been established as an efficient solution for
dissipating large heat fluxes---up to
$790 med upright("W") \/ upright("cm")^2$---using minimal coolant. In
recent years, the trend toward smaller transistor sizes and higher chip
densities has increased the thermal load in microprocessors \[2\],
reinforcing the relevance of microchannel cooling technologies. MCHS are
typically fabricated from highly thermal conductive materials such as
silicon, aluminium, or copper, and most often employ liquids (e.g.,
water or ethylene glycol) as coolants.

The main objective of these devices is to maximize heat removal through
forced convection at the outlet. However, a fraction of the input
heat---typically around $10 %$ \[3,4\]---is inevitably lost through
mechanisms such as convective exchange with ambient air, thermal
radiation, and conduction through the device's top wall. For optical
accessibility during diagnostics and temperature measurements \[5--7\],
this wall is often made from insulating transparent materials like
glass, PDMS, or PMMA \[8\].

A key parameter governing hydrodynamic behavior is the aspect ratio
$L \/ w$, which typically ranges between 62 and 210 \[9,10\]. Heat
removal efficiency depends on the volumetric flow rate $dot(V)$, with
most devices operating under laminar conditions characterized by low
Reynolds numbers $R e = macron(u)_z D_h \/ nu$. Although some studies
explore regimes up to the laminar--turbulent transition at
$R e tilde.op 2500$ \[4\], most operate within
$R e = 30 upright("–") 100$ \[11,12\].

#figure([#block[
  #box(image("graphics/fig1.png", width: 70.0%))
  ]],
  caption: [
    Square duct representation with a slip/no-slip pattern in the
    channel walls.
  ]
)
<fig:slip_pattern>

Performance improvements in MCHS have been pursued through variations in
channel geometry and coolant composition, including nanofluids
\[13,14\]. Numerous cross-sectional shapes---trapezoidal, circular,
triangular, among others---and structured perturbations such as
sinusoidal or ribbed channels have been investigated \[15\]. More
recently, swirling flows have been shown to enhance heat transfer
\[16,17\], often generated using ribs, obstacles, or other geometric
disruptions \[18,19\]. While effective, these modifications usually
increase the required pumping power.

Interestingly, it has been shown that patterned grooves can induce
chaotic advection, generating vortical structures\[20--22\]. Moreover,
slip/no-slip patterns have been used to induce swirl flows: Ouroo-Koura
et al. \[23\] examined their role in passive mixing, while Rahbarshahlan
et al. \[24\] and Babaei et al. \[25\], building on Antman et al.
\[26\], analyzed their thermal implications. These works show that such
patterns can enhance the flow rate at constant pumping power and improve
heat removal through forced convection.

In this paper, we extend these efforts by investigating a slip/no-slip
pattern specifically designed to induce swirl flow within the
microchannel. Our aim is to enhance heat transfer without increasing the
volumetric flow rate by increasing the applied pressure.

= Physical Model
#label("sec:physical model")
The physical model consist on a square duct of side
$w = 5 times 10^(- 4)$m and length $L = 50 times w$. The working fluid
is a water ethylene-glycol mixture (75$%$) \[27\]. Its thermophysical
properties at 25 °C are: density $rho = 1088$ kg/m$""^3$, kinematic
viscosity $nu = 6.296 times 10^(- 6)$m$""^2$/s, specific heat capacity
$c_p$ = 2768 J/(kg K), thermal conductivity $kappa = 0.307$ W/(mK) and
thermal diffusivity $alpha = 1.018 times 10^(- 7)$ m$""^2$/s. The flow
is driven by a pressure drop $Delta$P ranging from 0.3 kPa to 10 kPa.
These parameters ensure a laminar flow with a Reynolds number below 50,
and a thermal transport regime dominated by advection over diffusion,
with a Peclet number $P e = w macron(u)_z \/ alpha$ over 300.

The system is heated at the bottom wall with a hot temperature
$T_h = 35^compose$C. The inlet coolant fluid temperature is always
$T_c = 15^compose$C, being also the initial temperature of the fluid
along the channel. The others three walls of the square duct have an
adiabatic boundary condition. Given these conditions, it is expected
that in the stationary regime, the temperature of the fluid ranges
between $15^compose$C $< T < 35^compose$C.

The square duct walls are decorated by stripes, tilted by an angle
$theta$ with respect to the flow direction, with different wetting
properties. This leads to a patterned slip/no-slip condition on the
walls captured by the Maxwell-Navier slip length $b$ that can be
interpreted as a fictitious distance underneath the solid surface where
the no-slip boundary condition would be satisfied \[28\]. To achieve a
full slip boundary condition a slip length $b arrow.r oo$ is considered.
The number of slip and no-slip stripes in a duct along the channel is
$n$, while $L \/ n$ is the width of each stripe. From here on, for
different slip pattern combinations, half of the total duct area has a
no-slip boundary condition and the other half has a full slip boundary
condition (grey/black stripes in Fig. @fig:slip_pattern respectively).

To study the dynamic and thermal transfer behavior of the model, it is
necessary to consider the set of conservation equations for the fluid:

Conservation of mass:
$ frac(partial rho, partial t) + upright(bold(nabla)) dot.op \( rho upright(bold(u)) \) = 0 $<eq:mass>
where $rho$ is the mass density of the fluid and
$upright(bold(u)) = u hat(i) + v hat(j) + w hat(k)$ is the fluid
velocity.

Conservation of momentum:
$ rho frac(D upright(bold(u)), D t) = upright(bold(nabla)) dot.op overline(overline(sigma)) + rho upright(bold(d)) thin \, $<eq:momentum>
$upright(bold(d))$ represents the external forces per unit mass and
$overline(overline(sigma))$ the deviatoric stress tensor.

Conservation of energy:
$ rho frac(D e, D t) = - p upright(bold(nabla)) dot.op upright(bold(u)) - upright(bold(nabla)) dot.op upright(bold(q)) + Phi thin \, $<eq:energy>
where $e$ corresponds to the internal energy of the fluid per unit mass
and $Phi$ is the dissipated kinetic energy. The first term on the right
hand side of Eq.~#link(<eq:energy>)[\[eq:energy\]] represents the work
done by the external pressure $p$ on the fluid. The second term
$upright(bold(q))$ is the heat flux
$ upright(bold(q)) = - kappa upright(bold(nabla)) T + upright(bold(q))_(upright("rad")) \, $
with its first term due to heat conduction (Fourier's law) and the
second one due to electromagnetic radiation. $kappa$ is the thermal
conductivity of the coolant.

To simplify the general equations, we consider a Newtonian and
incompressible fluid, with constant thermophysical properties ($rho$,
$nu$, $c_p$ and $kappa$). We neglect the viscous dissipation $Phi$ and
$bold("q")_(r a d)$, and we consider a linear dependence of the internal
energy $e$ with the temperature $T$. Therefore, Eqs. @eq:mass,
@eq:momentum and @eq:energy become

$ upright(bold(nabla)) dot.op upright(bold(u)) = 0 $<eq:C>
$ rho frac(D upright(bold(u)), D t) = - nabla p + mu nabla^2 upright(bold(u)) $<eq:NS>
$ frac(partial T, partial t) + upright(bold(nabla)) dot.op \( T upright(bold(u)) \) = alpha nabla^2 T \, $<eq:AD>
with $mu$ being the dynamic viscosity. The grade of swirl is measured
through the vorticity number, defined by

$ Omega_z = frac(d v, d x) - frac(d u, d y) . $<eq:vorticity>

= Computational Method
#label("sec:computational method")
We use the Lattice Boltzmman Method (LBM)\[29,30\] , to solve the
equations @eq:C, @eq:NS and @eq:AD on the computational domain. The
method solves the Boltzmman Equation on a discrete lattice:

$ f_i \( upright(bold(x)) + upright(bold(c))_i Delta t \, t + Delta t \) - f_i \( upright(bold(x)) \, t \) = hat(Omega) \( f_i \( upright(bold(x)) \, t \) \) thin \, $
here $Delta x$ and $Delta t$ are the units in which space and time are
discretized. The single particle distribution function $f_i$ describes
the probability to find a particle with velocity $upright(bold(c))_i$
reaching the adjacent position
$upright(bold(x)) + upright(bold(c))_i Delta t$, one time step
$t + Delta t$ later. The collision operator $hat(Omega) \( f_i \)$ is
the source term proposed by Bhatnagar, Gross, and Krook (BGK) \[31\]:
$ hat(Omega) \( f_i \( upright(bold(x)) \, t \) \) = - 1 / tau (f_i \( upright(bold(x)) \, t \) - f_i^(\( e q \)) \( upright(bold(x)) \, t \)) med \, $
which describes how the population $f_i$ relaxes towards a local
equilibrium over the characteristic relaxation time $tau$, while
conserving mass and momentum where the equilibrium distribution is
defined as

$ f_i^(upright(e q)) = w_i rho [1 + frac(bold(u) dot.op bold(c)_i, c_s^2) + frac((bold(u) dot.op bold(c)_i)^2, 2 c_s^4) - frac(bold(u) dot.op bold(u), 2 c_s^2)] thin \, $<eq:eq_distr>
with

$ rho \( upright(bold(x)) \, t \) & = sum_(i = 1)^19 f_i \( upright(bold(x)) \, t \) thin \,\
upright(bold(u)) \( upright(bold(x)) \, t \) & = frac(1, rho \( upright(bold(x)) \, t \)) sum_(i = 1)^19 f_i \( upright(bold(x)) \, t \) upright(bold(c))_i thin . $

We adapted the algorithm proposed in the previous work of Peter~\[32\]
and Antunes~\[33\], to solve the thermal advection-diffusion equation~
(Eq. @eq:AD), allowing us to study the heat transfer in the
computational fluid domain. The validation of this adapted algorithm in
a simple 2D case is done comparing with an analytical solution that is
detailed in Appendix~#ref(label("sec:Appendix II")).

We choose the number of LB nodes for our square duct $w^star.op = 32$,
and from now on all the star denoted quantities are in lattice units
(lu). The corresponding spatial resolution results in
$C_x = w \/ w^star.op$. This resolution is chosen after a mesh
convergence study (see Appendix~#ref(label("sec:Appendix II")) ),
seeking for an optimal compromise between computational cost and
accuracy of the results.

The liquid number density is taken as $rho^star.op = 1$ and the
relaxation time (which controls the kinematic viscosity)
$tau^star.op = 0.8$. The lattice speed of sound is
$c_s^star.op = sqrt(1 \/ 3)$. The temperature in lattice units ranges
between $0.1 < T^star.op < 0.3$, with a temperature difference of
$Delta T^star.op = 0.2$ within the system. \
With this variables defined, we can obtain the conversion factor for the
time through the kinematic lattice viscosity $nu^star.op$ equation (Eq.
7.14 from Ref.~\[30\])

$ C_t = c_s^(star.op 2) (tau^star.op - 1 / 2) C_x^2 / nu . $<eq:time_conv_factor>
The pressure drop is mimicked by applying an external force density
which accelerates the fluid along the $z$-direction with
$a in \[ 1 \, 3.5 \] dot.op 10^(- 4)$ in lattice units.

The thermal diffusivity used in Eq.~#link(<eq:AD>)[\[eq:AD\]] can be
expressed in lattice units as $alpha^star.op = alpha \/ C_alpha$, with
$C_alpha = C_x^2 \/ C_t$. In Refs \[34,35\] the slip length $b^star.op$
in lattice units is related to a slip parameter $zeta^star.op$ and
relaxation time $tau$ as

$ b^star.op = frac(zeta^star.op, 3 \( 1 - zeta^star.op \)) tau^star.op thin . $<eq:slip_length>

To obtain a no-slip boundary condition, in our simulations we set
$zeta^star.op = 0$ to obtain a slip length tending to zero. Meanwhile,
$zeta^star.op arrow.r 1$ is recovers the full slip boundary condition.

= Results
<sec:results>
We simulate a microchannel subjected to different pressure gradients
with the following boundary conditions for the velocity at the walls:
(i) homogeneous no slip, (ii) homogeneous full slip, and (iii)
heterogeneous slip pattern. The slip pattern variations are: 25, 50,
100, and 200 stripes at each microchannel wall, and $25^compose$,
$45^compose$ and $65^compose$ stripe angles. For all the simulations, we
checked that both the liquid density $rho^star.op$ and the volumetric
flow rate $dot(V)^star.op$ fluctuates within a range of less than $1 %$
and $2 %$ of their respective mean values.

The temperature of the bottom wall is kept constant at $T = T_h$,
generating an inlet heat flow $Q$. Considering the adiabatic nature of
the external walls the same $Q$ is removed at the outlet by forced fluid
convection, computed as

$ Q = integral_A c_p rho u_z \( T_(upright("out")) - T_(upright("in")) \) d A \, $
where $c_p$, $rho$, and $u_z$ represent the specific heat capacity,
density, and axial velocity of the working fluid, respectively.
$T_(upright("out"))$ and $T_(upright("in")) = T_c$ are the temperatures
at the outlet and inlet, respectively.

#figure(image("graphics/fig2.png", width: 45.0%),
  caption: [
    Heat flow evacuated at different flow rate regimes varying the
    stripe angle $theta$ at the channel walls (triangles for
    $theta = 25^compose$, circles for $theta = 45^compose$, and squares
    for $theta = 65^compose$). Thinner stripes case (largest number of
    stripes, $n = 200$) are the blue ones, and the thicker stripes case
    (fewer number of stripes, $n = 25$) are the red ones. For reference,
    we plot the homogeneous no-slip case (open diamonds) and the
    homogeneous full slip case (filled diamonds). The dashed lines
    between the points serve as a guide for the eye.
  ]
)
<fig:angles>

Firstly, we focus on the dependence of the extracted heat $Q$ at the
outlet as a function of the volumetric fluid flow, $dot(V)$ for
different covering patterns, as it is shown in Fig. @fig:angles. It is
observed, as expected, that the heat flow $Q$ increases with $dot(V)$
for all slip patterns as well as for the full slip and no slip cases. In
Fig. @fig:angles, we present six different pattern configurations
corresponding to $n = 25$ and $n = 200$ as well as three stripe angles
$theta = 25^compose \, 45^compose \, 65^compose$. As shown in
Fig.~@fig:angles, for the case $n = 25$, the three different stripe
angles show very similar values of the heat transfer $Q$. In contrast,
for $n = 200$, the curves for the three different angles clearly
separate, with the case $theta = 45^compose$ being the one leading to
the maximum value of $Q$. Such a behavior persist also for interemediate
stripes number, $n = 50 \, 100$ as shown in Appendix
(#ref(label("sec:Appendix III")))

To quantify the heat flow enhancement observed in Fig.~@fig:angles, we
present in Fig.~@fig:n_variable the heat flow $Q$ normalized by the
standard no-slip case, as a function of $dot(V)$ and for different
numbers of stripes $n$, at a fixed angle $theta = 45^compose$.

#figure(image("graphics/fig3.png", width: 50.0%),
  caption: [
    Heat flow $Q$ normalized by $Q_(upright("no slip"))$ (horizontal
    dashed gray line) evacuated at different flow rate regimes $dot(V)$
    for the different slip-pattern cases $n = 25 \, 50 \, 100 \, 200$
    and $theta = 45^compose$. The heat flow in the full slip case is
    shown with gray diamonds.
  ]
)
<fig:n_variable>

We observe that all the studied patterns show a better performance than
the no slip case. Moreover, this improvement is enhanced for larger
$dot(V)$ and increasing $n$, achieving up to $tilde.op 45 %$ for
$n = 200$.

To gain a more in-depth understanding of the enhancement of the heat
flow we plot in Fig.~@fig:temp_map the temperature map at the outlet
cross-section. We compare the no slip case in Fig.~@fig:no_slip_temp_map
with the case showing the best performance ($n = 200$ and
$theta = 45^compose$) in Fig.~@fig:slip_pattern_temp_map.

#figure([#figure(image("graphics/fig4a.png"),
    caption: [
      No slip walls
    ]
  )
  <fig:no_slip_temp_map>

  #figure(image("graphics/fig4b.png"),
    caption: [
      Slip pattern
    ]
  )
  <fig:slip_pattern_temp_map>

  ],
  caption: [
    Comparison between the temperature cross-sectional profile ($z = L$)
    for the no slip and the optimal slip-pattern microchannel
    ($theta = 45^compose$ $n = 200$).
  ]
)
<fig:temp_map>

We observe that the stripe pattern generates vorticity, that assists
heat transfer from the hot bottom wall to the other adiabatic walls.

#figure(image("graphics/fig5.png"),
  caption: [
    Velocity streamlines and temperature maps at different
    cross-sectional areas along the channel for the optimal slip pattern
    case ($theta = 45^compose$ $n = 200$).
  ]
)
<fig:temp_stream_lines>

To further illustrate this case, in Fig. @fig:temp_stream_lines we show
five cross-sectional slice temperature profiles along the channel
superimposed to the velocity stream lines. A helical vortex (swirl) can
be observed.

#figure(image("graphics/fig6.png", width: 50.0%),
  caption: [
    Mean vorticity $macron(Omega)_z$ at different flow regimes $dot(V)$
    for the different slip-pattern cases $n = 25 \, 50 \, 100 \, 200$
    and $theta = 45^compose$
  ]
)
<fig:vorticity>

This swirl can be quantified by the mean vorticity $macron(Omega)_z$
which is computed as the average over the whole channel volume of the
local vorticity given in Eq.~#link(<eq:vorticity>)[\[eq:vorticity\]].
Figure ~@fig:vorticity shows this mean vorticity $macron(Omega)_z$ as a
function of $dot(V)$ for different stripe numbers $n$. We observe an
almost linear dependence, with increasing slopes of fluid flow
($dot(V)$) with respect to $n$. Consequently, mean vorticity
($macron(Omega)_z$) takes its highest values at an angle of 45° and for
$n = 200$ (see Fig. @fig:vorticity), the configuration that exhibits the
best heat transport.

These results highlight the dependence between the increase in the heat
flow and the vorticity induced by the slip pattern, which is a key
finding of the study. Fig. @fig:heatFluxVorticity illustrates this
dependence by showing the heat flow ($Q$) as a function of the vorticity
($macron(Omega)_z$), for various volumetric flows and patterns.
Interestingly, all the data points collapse onto a master curve that can
be fitted with a power law function compatible with an exponent
$1 \/ 2$. While we do not have a clear understanding of the functional
form of the master curve, the collapse of the data clearly shows that
the vorticity number, $Omega_z$ is the relevant parameter controlling
the heat transport along the channel.

#figure([#box(image("graphics/fig7.png", width: 50.0%))
  .

  ],
  caption: [
    Heat flow $Q$ as a function of vorticity $macron(Omega)_z$, for
    $theta = 45^compose$. Color map indicates the different values of
    $n$. Data are fitted with a function
    $y \( x \) = b dot.op x^(1 \/ 2)$, shown with a dashed black line.
    For each $n$ (color), the flow rates increase from left to right as
    it is shown in Fig. @fig:vorticity
  ]
)
<fig:heatFluxVorticity>

= Conclusions
<sec:conclusions>
In this work we presented a novel strategy to enhance the thermal
performance of a MCHS based on slip-no slip pattern designs. Our model
considered channels with adiabatic walls, except for the bottom one,
which was kept at a constant temperature to mimic a heat source.

We simulated different pattern configurations by varying the number of
stripes and their inclination angle. We evaluated the thermal
performance of each case at different volumetric flows and compared them
to the standard channel under no-slip condition. Our results showed that
the underlying mechanism for improving heat transfer is swirling flow
produced by the patterning.

Among all the studied pattern configurations, the one with the largest
number of stripes and an inclination angle of $45^compose$ showed the
largest mean vorticity, with a consequent improvement in the dissipated
heat of up to $45 %$ compared to the standard no-slip case.

We also observed a clear correlation between vorticity and heat flux
extracted by the microchannel (Fig. @fig:heatFluxVorticity). This
exhibited a power-law dependence with an exponent of $1 \/ 2$. However,
a complete understanding of this relationship and how the exponent can
vary with fluid and geometric parameters, remains an open question for
future work.

In situations involving advection-dominated regimes, it is possible to
enhance heat removal from localised hot spots by generating swirling
flows. These flows can be produced by an appropriate combination of
surface patterning, channel geometry and flow rate.

Rather than using channels that encompass pillars, posts or ribs, as is
often found in the literature, we propose an alternative approach which
reduces additional pressure losses, a critical issue for technological
implementations. Surface patterning with hydrophobic/hydrophilic
properties has emerged as an effective way to improve the thermal
performance of microchannel heat sinks.

#block[
#set heading(numbering: "I")
#counter(heading).update(0)

= Unit Conversion
#label("sec:Appendix I")
Following the literature~\[30,36\], in this section we detail the
conversion units that map quantities between the LB scale Sec.
#ref(label("sec:computational method")) and the physical units of the
model Sec. #ref(label("sec:physical model")). In order to do so we need
to specify the system dymensions and the properties of the fluid.

Here we focus on the case of a square channel with cross section of side
$w = 5 times 10^(- 4)$m and length $L = 50 times w$ with a system
temperature range of $15^compose C < T < 35^compose C$. As a working
fluid we focus on ethylen-glycol/water mixture at $75 %$ volume fraction
with constant thermo-physical properties at $25^compose C$~\[27\]:
$rho = 1088$ $k g \/ m^3$, $mu = 6.85 times 10^(- 3)$ $P a dot.op s$,
$alpha = 1.02 times 10^(- 7)$ $m^2 \/ s$ and $kappa = 0.307$ $W \/ m K$.

Given the above mentioned physical properties, we choose the conversions
of time, length and temperature shown in Table~@table:conv-1. We note
that while for time and length the relations between lattice units and
SI units are simply direct proportionality, for the temperature we
choose $ T = T_0 + C_T T^star.op thin \, $ being $T_0 = 278.15$ K a
reference temperature and $C_T$ the temperature conversion factor given
in Table @table:conv-1 and $0.1 < T^star.op < 0.3$.

#block[
#figure(
  align(center)[#table(
    columns: 4,
    align: (center,center,center,center,),
    table.header([Property], [Conversion Factor], [Value], [],),
    table.hline(),
    [length], [$C_x = w \/ w^star.op$], [$1.56 times 10^(- 5)$ m], [],
    [time], [$C_t = c_s^(star.op 2) (tau^star.op - 1 / 2) C_x^2 / nu$], [$3.88 times 10^(- 6)$
    s], [],
    [temperature], [$C_T = Delta T \/ Delta T^star.op$], [$100$ K], [],
  )]
  , caption: [Conversion factors for time, length, and temperature]
  , kind: table
  ) <table:conv-1>

]

Using the conversion factors in Table~@table:conv-1 we derive the
conversion factors for other quantities of interest, see
Table~@table:conv-2

#block[
#figure(
  align(center)[#table(
    columns: 4,
    align: (center,center,center,center,),
    table.header([Property], [Conversion Factor], [Value], [],),
    table.hline(),
    [thermal
    diffusivity], [$C_alpha = C_x^2 \/ C_t$], [$6.29 times 10^(- 5)$
    m$""^2$/s], [],
    [aceleration], [$C_a = C_x \/ C_t^2$], [$1.04 times 10^6$
    m/s$""^2$], [],
    [volume flow
    rate], [$C_(dot(V)) = C_x^3 \/ C_t$], [$9.84 times 10^(- 10)$
    m$""^3$/s], [],
    [velocity], [$C_u = C_x \/ C_t$], [$4.03$ m/s], [],
    [convective heat
    flow], [$C_Q = c_p rho \( C_x^3 \/ C_t \) C_T$], [$0.29$ W], [],
  )]
  , caption: [Conversion factors for other physical magnitudes]
  , kind: table
  ) <table:conv-2>

]

Tables~@table:conv-1,@table:conv-2 allow to convert the value of any
physical magnitude $Z$ to the corresponding value $Z^(*)$ in lattice
units via $Z^(*) = Z thin thin C_Z$, with $C_Z$.

= Analytical Solution validation
#label("sec:Appendix II")
We consider a laminar flow in between two infinite planar plates,
established by a pressure gradient along the $z$ direction. This
situation reduces to an effective 2D problem.

#figure(image("graphics/fig8.png", width: 65.0%),
  caption: [
    2D physical model diagram
  ]
)
<fig:2d_analytical_layout>

From the Navier-Stokes equation, imposing velocity in the $z$ direction
with a no slip boundary condition in the plates, the Hagen-Poiseuille
solution reads
$ u_z \( x \) = u_(upright("max")) \[ 1 - \( x \/ h \)^2 \] thin \, $<eq:hagen-poiseuille>
with
$ u_(upright("max")) = 1 / 2 frac(Delta P, Delta z) h^2 / mu thin \, $

The general advection-diffusion equation for the temperature $T$ into a
moving fluid is
$ rho c_p (frac(partial T, partial t) + upright(bold(u)) dot.op nabla T) = kappa nabla^2 T + Phi + Q thin \, $<advection-diffusion>
where $rho$ is the fluid density, $c_p$ is the specific heat capacity at
constant pressure, $upright(bold(u))$ is the fluid velocity vector,
$kappa$ is the thermal conductivity of the fluid, $Phi$ is the viscous
dissipation term, and $Q$ is a volumetric heat source term.

For a stationary situation, and neglecting heat dissipation and sources,
the equation reduces to

$ upright(bold(u)) dot.op nabla T = alpha nabla^2 T thin \, $ where
$alpha = kappa \/ \( rho c_p \)$ is the thermal diffusivity of the
fluid. For the 2D Poiseuille velocity profile, in Cartesian coordinates
we obtain

$ [frac(partial^2 T, partial x^2) + frac(partial^2 T, partial z^2)] = u_(upright("max")) / alpha [1 - (x / h)^2] frac(partial T, partial z) thin . $<eq:app-B5>

We have an inlet temperature profile of the fluid $T_0 \( x \)$, and
constant temperature of each plate $T_(upright("A"))$ and
$T_(upright("B"))$, see Fig. @fig:2d_analytical_layout. Considering
these boundary conditions for the temperature we express the solution as

$ T \( x \, z \) = sum_(n = 1)^oo gamma_n med e^(- lambda_n z / h) phi.alt_n (x / h) + T_oo \( x \) thin \, $<eq:generalSolution>
with
$ T_oo \( x \) = frac(\( T_(upright("A")) - T_(upright("B")) \), 2) x / h + frac(\( T_(upright("A")) + T_(upright("B")) \), 2) thin . $<eq:Tinfinity>
The asymptotic solution for $z arrow.r oo$, $phi.alt_n$ and $lambda_n$
are eigenfunctions and eigenvalues to be determined, and $gamma_n$ are
coefficients that will depend on the inlet temperature profile.
Replacing into the differential equation:

$ 0 = sum_(n = 1)^oo gamma_n med e^(- lambda_n z / h) med \[1 / h^2 med phi.alt''_n (x / h) + lambda_n^2 / h^2 med phi.alt_n (x / h) + lambda_n / h u_(upright("max")) / alpha med [1 - (x / h)^2] med phi.alt_n (x / h)\] med . $
To fulfill this equation, every term in the sum should be zero, arriving
to a differential equation

$ 0 = phi.alt'' \( eta \) + lambda^2 phi.alt \( eta \) + lambda beta med \( 1 - eta^2 \) med phi.alt \( eta \) thin \, $<ParabolicDiff>
with $eta = x \/ h$ the dimensionless transversal $x$ coordinate, and
$beta = h u_(upright("max")) \/ alpha$ a dimensionless parameter
proportional to the maximum velocity. For the proposed solution Eq.
(@eq:generalSolution) to give a constant temperature at
$x = plus.minus h$, the functions $phi.alt$ should fulfill the boundary
conditions:

$ phi.alt \( 1 \) = phi.alt \( - 1 \) = 0 thin . $ Eq. (@ParabolicDiff)
is a parabolic differential equation with two independent solutions
$ psi_1 \( beta \, lambda \, eta \) & = e^(- 1 / 2 sqrt(beta lambda) thin eta^2) thin F_1 (1 / 4 - a \( beta \, lambda \) \; 1 / 2 \; sqrt(beta lambda) thin eta^2) thin \,\
psi_2 \( beta \, lambda \, eta \) & = eta thin e^(- 1 / 2 sqrt(beta lambda) thin eta^2) thin F_1 (3 / 4 - a \( beta \, lambda \) \; 3 / 2 \; sqrt(beta lambda) thin eta^2) thin \, $
where $zws_1 F_1$ is the Kummer confluent hypergeometric function\[37\],
with
$ a \( beta \, lambda \) = 1 / 4 \( beta + lambda \) sqrt(lambda / beta) thin . $
These two solutions depend parametrically on $beta$ and $lambda$, being
even and odd functions of $eta$, respectively. The general solution to
Eq. (@ParabolicDiff) is

$ phi.alt \( eta \) = D_1 psi_1 \( beta \, lambda \, eta \) + D_2 psi_2 \( beta \, lambda \, eta \) thin . $
In order to fulfill the temperature boundary conditions (see right after
Eq.~#link(<eq:app-B5>)[\[eq:app-B5\]]) we need
$ phi.alt \( 1 \) & = 0 = D_1 thin psi_1 \( beta \, lambda \, 1 \) + D_2 thin psi_2 \( beta \, lambda \, 1 \) thin \,\
phi.alt \( - 1 \) & = 0 = D_1 thin psi_1 \( beta \, lambda \, - 1 \) + D_2 thin psi_2 \( beta \, lambda \, - 1 \) thin . $
For non trivial solutions, the determinant of this linear homogeneous
system
$ det \( beta \, lambda \) = psi_1 \( beta \, lambda \, 1 \) med psi_2 \( beta \, lambda \, - 1 \) thin - psi_1 \( beta \, lambda \, - 1 \) med psi_2 \( beta \, lambda \, 1 \) thin \, $
must be zero. Fixing a specific value for $beta$, this determinant is an
oscillating function of $lambda$ with infinitely many zeros. We
numerically compute the first ones, ordering them by increasing values
${ lambda_1 \, lambda_2 \, dots.h \, lambda_n }$, being the eigenvalues
with the corresponding eigenfunctions
$ phi.alt_n \( eta \) = psi_2 \( beta \, lambda_n \, 1 \) med psi_1 \( beta \, lambda_n \, eta \) - psi_1 \( beta \, lambda_n \, 1 \) med psi_2 \( beta \, lambda_n \, eta \) thin . $
We consider that the given inlet temperature profile
$T_0 \( x \) = T \( x \, z = 0 \)$ fulfills the conditions
$T_0 \( h \) = T_(upright("A"))$ and $T_0 \( - h \) = T_(upright("B"))$,
to avoid discontinuities of the temperature at the walls.

Numerical inspections revealed that the eigenfunctions $phi.alt_n$ are
not orthogonal on the domain $eta = \[ - 1 \, 1 \]$.

#figure(image("graphics/fig9.png", width: 50.0%),
  caption: [
    Velocity profile for different mesh sizes ($n x =$20, 40, 60 and
    100) compared to the analytical Hagen-Poiseuille
    Eq.~@eq:hagen-poiseuille (dotted line).
  ]
)
<fig:vel_check>

#figure([#figure(image("graphics/fig10a.png"),
    caption: [
      Temperature profile along channel height at $z = Delta z \/ 2$
    ]
  )
  <fig:temp_analytical_x>

  #figure(image("graphics/fig10b.png"),
    caption: [
      Temperature profile along channel length at $x = 0$
    ]
  )
  <fig:temp_analytical_z>

  ],
  caption: [
    Temperature profiles for different mesh sizes ($n x =$20, 40, 60 and
    100) compared to the analytical solution
    Eq.~#link(<eq:generalSolution>)[\[eq:generalSolution\]] (dotted
    line).
  ]
)
<fig:temp_check>

Therefore, to obtain the coefficients $gamma_n$ we have to truncate the
basis up to some maximum value $N$, solving the linear system

$ bold(A) dot.op bold(gamma) = bold(B) thin \, $ with the matrix
$bold(A)$ with elements

$ A_(i j) = integral_(- 1)^1 phi.alt_i \( eta \) med phi.alt_j \( eta \) med upright("d") eta thin \, $
and the vector
$ B_j = integral_(- 1)^1 f_0 \( eta \) med phi.alt_j \( eta \) med upright("d") eta thin \, $
with $f_0 \( eta \) = T_0 \( h eta \) - T_oo \( h eta \)$, a function
that it is zero for $eta = - 1$ and $eta = 1$. With the computed
eigenvalues $lambda_n$, eigenfunctions $phi.alt_n$ and the $gamma_n$
coefficients, we can replace them into the general solution
(@eq:generalSolution), and we obtain the temperature map of the fluid
for $z > 0$.

We use these analytical results to validate the thermal calculations
with the LBM. For this purpose, the following physical quantities are
taken into consideration: pressure difference $Delta P = 8$ Pa,
$H = 2 h = 2 times 10^(- 4)$ m, and $Delta z = 0.002$ m. The
acceleration $a = Delta P \/ \( Delta z thin rho \) = 4$m/s$""^2$ . We
consider thermophysical properties of pure water at $20^compose$C:
density $rho = 1000$ kg/m$""^3$, dynamic viscosity $mu = 10^(- 3)$ Pa.s,
and thermal diffusivity $alpha = 1.4 times 10^(- 7)$m$""^2$/s. The
temperature boundary conditions at the plates are
$T_(upright("A")) = T_(upright("B")) = 30^compose$ C, and the inlet
temperature is
$ T_0 \( x \) = 10^compose upright("C") + 20^compose upright("C") (x / h)^12 thin \, $
With these values the maximum velocity $u_(m a x) = 0.02$ m/s, which
gives $beta = 14.28$ for the analytical solution.

Regarding the Lattice Boltzmann quantities, a mesh convergence study was
performed by testing various grid resolutions with
$n x = 20 \, 40 \, 60 \,$ and $100$, the number of lattice nodes in
x-axis direction. The lattice velocity of sound is
$c_s^(*) = sqrt(1 \/ 3)$, and the relaxation time is $tau^(*) = 1$. The
total height of the channel in lattice units is $H^star.op = n x$
($h^star.op = n x \/ 2$). The density is fixed at $rho^(*) = 1$.

The procedure was carried out as follows:

+ The transverse grid size $n x$ is defined (20, 40, 60, 100), and the
  longitudinal size is set to $n z = 10 thin n x$. The spatial
  resolution is then computed as $C_x = H \/ n x$.

+ The relaxation time $tau^star.op = 1$, the lattice speed of sound
  $c_s^star.op = sqrt(1 \/ 3)$, and given the kinematic viscosity $nu$,
  the time conversion factor $C_t$ is obtained according to Eq.
  @eq:time_conv_factor.

+ The force density $F^star.op = a^star.op rho^star.op$ used to run the
  simulation is calculated using $C_x$, $C_t$ and $a$.

+ The lattice temperature boundary conditions are
  $T_A^star.op = T_B^star.op = 0.3$ and $T_0^star.op = 0.1$, obtained
  using the conversion factors from Table @table:conv-1. Additionally,
  the lattice thermal diffusivity $alpha^star.op$ is calculated (See
  Table @table:conv-2).

Finally, the numerical results for each $n x$ are converted to MKS
units, as detailed in Appendix #ref(label("sec:Appendix I")). These
results are compared with the analytical solutions presented in Eqs.
@eq:hagen-poiseuille and @eq:generalSolution. Figures @fig:vel_check and
@fig:temp_check show a good agreement achieved between the numerical
results and the analytical model as the lattice resolution increases.

= Stripe angle variation study
#label("sec:Appendix III")
We present Q vs $dot(V)$ for the different pattern configurations
corresponding to $n = 25 \, 100 \, 150 \, 200$, as well as three stripe
angles $theta = 25^compose \, 45^compose \, 65^compose$. For reference,
the homogeneous no-slip case (open diamonds) and the homogeneous full
slip case (filled diamonds) are also plotted in each Figure. As can be
seen, in each of the four cases, $theta = 45^compose$ corresponds to the
best configuration.

#figure([#box(image("graphics/fig11a.png", width: 45.0%))
  #box(image("graphics/fig11b.png", width: 45.0%))
  #box(image("graphics/fig11c.png", width: 45.0%))
  #box(image("graphics/fig11d.png", width: 45.0%))

  ],
  caption: [
    Heat flow evacuated at different flow rate regimes varying the
    stripe angle $theta$ at the channel walls (triangles for
    $theta = 25^compose$, circles for $theta = 45^compose$, and squares
    for $theta = 65^compose$) for each stripe number case ($n = 25$,
    $50$, $100$ and $200$).
  ]
)
<fig:app-C>

]
#heading(numbering: none)[References]

#block[
#block[
\[1\] Tuckerman DB, Pease RFW. High-performance heat sinking for VLSI.
IEEE Electron Device Letters 1981;2:126--9.
#link("https://doi.org/10.1109/EDL.1981.25367").

] <ref-tuckermanHighperformanceHeatSinking1981>
#block[
\[2\] Bahiraei M, Heshmatian S. Electronics cooling with nanofluids: A
critical review. Energy Conversion and Management 2018;172:438--56.
#link("https://doi.org/10.1016/j.enconman.2018.07.047").

] <ref-bahiraeiElectronicsCoolingNanofluids2018>
#block[
\[3\] Khoshvaght-Aliabadi M, Sahamiyan M, Hesampour M, Sartipzadeh O.
Experimental study on cooling performance of sinusoidal--wavy
minichannel heat sink. Applied Thermal Engineering 2016;92:50--61.
#link("https://doi.org/10.1016/j.applthermaleng.2015.09.015").

] <ref-khoshvaght-aliabadiExperimentalStudyCooling2016a>
#block[
\[4\] Lee P-S, Garimella SV, Liu D. Investigation of heat transfer in
rectangular microchannels. International Journal of Heat and Mass
Transfer 2005;48:1688--704.
#link("https://doi.org/10.1016/j.ijheatmasstransfer.2004.11.019").

] <ref-leeInvestigationHeatTransfer2005>
#block[
\[5\] Jung SY, Park JH, Lee SJ, Park H. Heat transfer and flow
characteristics of forced convection in PDMS microchannel heat sink.
Experimental Thermal and Fluid Science 2019;109:109904.
#link("https://doi.org/10.1016/j.expthermflusci.2019.109904").

] <ref-jungHeatTransferFlow2019>
#block[
\[6\] Chaudhuri J, Timung S, Dandamudi CB, Mandal TK, Bandyopadhyay D.
Discrete electric field mediated droplet splitting in microchannels:
Fission, Cascade, and Rayleigh modes. ELECTROPHORESIS 2017;38:278--86.
#link("https://doi.org/10.1002/elps.201600276").

] <ref-chaudhuriDiscreteElectricField2017>
#block[
\[7\] Timung S, Chaudhuri J, Borthakur MP, Mandal TK, Biswas G,
Bandyopadhyay D. Electric field mediated spraying of miniaturized
droplets inside microchannel. ELECTROPHORESIS 2017;38:1450--7.
#link("https://doi.org/10.1002/elps.201600311").

] <ref-timungElectricFieldMediated2017>
#block[
\[8\] Lin L, Chung C-K. PDMS Microfabrication and Design for
Microfluidics and Sustainable Energy Application: Review. Micromachines
(Basel) 2021;12:1350. #link("https://doi.org/10.3390/mi12111350").

] <ref-linPDMSMicrofabricationDesign2021>
#block[
\[9\] Qu W, Mudawar I. Experimental and numerical study of pressure drop
and heat transfer in a single-phase micro-channel heat sink.
International Journal of Heat and Mass Transfer 2002;45:2549--65.
#link("https://doi.org/10.1016/s0017-9310(01)00337-4").

] <ref-quExperimentalNumericalStudy2002b>
#block[
\[10\] Harms TM, Kazmierczak MJ, Gerner FM. Developing convective heat
transfer in deep rectangular microchannels. International Journal of
Heat and Fluid Flow 1999;20:149--57.
#link("https://doi.org/10.1016/S0142-727X(98)10055-3").

] <ref-harms1999>
#block[
\[11\] Kim B. An experimental study on fully developed laminar flow and
heat transfer in rectangular microchannels. International Journal of
Heat and Fluid Flow 2016;62:224--32.
#link("https://doi.org/10.1016/j.ijheatfluidflow.2016.10.007").

] <ref-kimExperimentalStudyFully2016a>
#block[
\[12\] Sohel MR, Khaleduzzaman SS, Saidur R, Hepbasli A, Sabri MFM,
Mahbubul IM. An experimental investigation of heat transfer enhancement
of a minichannel heat sink using Al2O3--H2O nanofluid. International
Journal of Heat and Mass Transfer 2014;74:164--72.
#link("https://doi.org/10.1016/j.ijheatmasstransfer.2014.03.010").

] <ref-sohelExperimentalInvestigationHeat2014>
#block[
\[13\] Sohel Murshed SM, Nieto de Castro CA. A critical review of
traditional and emerging techniques and fluids for electronics cooling.
Renewable and Sustainable Energy Reviews 2017;78:821--33.
#link("https://doi.org/10.1016/j.rser.2017.04.112").

] <ref-sohelmurshedCriticalReviewTraditional2017>
#block[
\[14\] Kalteh M, Abbassi A, Saffar-Avval M, Frijns A, Darhuber A,
Harting J. Experimental and numerical investigation of nanofluid forced
convection inside a wide microchannel heat sink. Applied Thermal
Engineering 2012;36:260--8.
#link("https://doi.org/10.1016/j.applthermaleng.2011.10.023").

] <ref-kaltehExperimentalNumericalInvestigation2012>
#block[
\[15\] Mohammed Adham A, Mohd-Ghazali N, Ahmad R. Thermal and
hydrodynamic analysis of microchannel heat sinks: A review. Renewable
and Sustainable Energy Reviews 2013;21:614--22.
#link("https://doi.org/10.1016/j.rser.2013.01.022").

] <ref-mohammedadhamThermalHydrodynamicAnalysis2013>
#block[
\[16\] Fan Y, Chen C, Fu R, Wang Q, Cao L, Chen X, et al. Heat transfer
performance study of fluid rotating microchannel heat sink. Case Studies
in Thermal Engineering 2024;58:104390.
#link("https://doi.org/10.1016/j.csite.2024.104390").

] <ref-fanHeatTransferPerformance2024>
#block[
\[17\] Feng Z, Luo X, Guo F, Li H, Zhang J. Numerical investigation on
laminar flow and heat transfer in rectangular microchannel heat sink
with wire coil inserts. Applied Thermal Engineering 2017;116:597--609.
#link("https://doi.org/10.1016/j.applthermaleng.2017.01.091").

] <ref-fengNumericalInvestigationLaminar2017a>
#block[
\[18\] Sheikholeslami M, Gorji-Bandpy M, Ganji DD. Review of heat
transfer enhancement methods: Focus on passive methods using swirl flow
devices. Renewable and Sustainable Energy Reviews 2015;49:444--69.
#link("https://doi.org/10.1016/j.rser.2015.04.113").

] <ref-sheikholeslamiReviewHeatTransfer2015a>
#block[
\[19\] Kumar B, Srivastava GP, Kumar M, Patil AK. A review of heat
transfer and fluid flow mechanism in heat exchanger tube with inserts.
Chemical Engineering and Processing - Process Intensification
2018;123:126--37. #link("https://doi.org/10.1016/j.cep.2017.11.007").

] <ref-kumarReviewHeatTransfer2018>
#block[
\[20\] Stroock AD, Dertinger SKW, Ajdari A, Mezić I, Stone HA,
Whitesides GM. Chaotic Mixer for Microchannels. Science
2002;295:647--51. #link("https://doi.org/10.1126/science.1066238").

] <ref-stroockChaoticMixerMicrochannels2002>
#block[
\[21\] Sarkar A, Narváez A, Harting J. Quantification of the performance
of chaotic micromixers on the basis of finite time Lyapunov exponents.
Microfluid Nanofluid 2012;13:19--27.
#link("https://doi.org/10.1007/s10404-012-0936-4").

] <ref-sarkarQuantificationPerformanceChaotic2012a>
#block[
\[22\] Gluzdov DS, Gatapova EYa. A slip length analysis of microchannel
flow with smooth and structured surfaces. Physics of Fluids
2024;36:122024. #link("https://doi.org/10.1063/5.0243494").

] <ref-gluzdovSlipLengthAnalysis2024a>
#block[
\[23\] Ouro-Koura H, Ogunmolasuyi A, Suleiman O, Omodia I, Easter J,
Roye Y, et al. Boundary condition induced passive chaotic mixing in
straight microchannels. Physics of Fluids 2022;34:051703.
#link("https://doi.org/10.1063/5.0088014").

] <ref-ouro-kouraBoundaryConditionInduced2022>
#block[
\[24\] Rahbarshahlan S, Esmaeilzadeh E, Rostamzadeh Khosroshahi A,
Ghaffarzadeh Bakhshayesh A. Numerical simulation of fluid flow and heat
transfer in microchannels with patterns of hydrophobic/hydrophilic
walls. Eur Phys J Plus 2020;135:157.
#link("https://doi.org/10.1140/epjp/s13360-019-00095-y").

] <ref-rahbarshahlanNumericalSimulationFluid2020>
#block[
\[25\] Babaei A, Aminian E, Saffari H. Numerical study of heat transfer
and pressure drop of nanofluids in a combined porous media of
hydrophobic and hydrophilic surfaces. Proceedings of the Institution of
Mechanical Engineers, Part A 2023;237:1308--28.
#link("https://doi.org/10.1177/09576509231158668").

] <ref-babaeiNumericalStudyHeat2023>
#block[
\[26\] Antman SS, Marsden JE, Sirovich L, editors. Microflows and
Nanoflows. vol. 29. New York: Springer-Verlag; 2005.
#link("https://doi.org/10.1007/0-387-28676-4").

] <ref-antmanMicroflowsNanoflows2005>
#block[
\[27\] Bohne D, Fischer S, Obermeier E. Thermal, Conductivity, Density,
Viscosity, and Prandtl-Numbers of Ethylene Glycol-Water Mixtures.
Berichte Der Bunsengesellschaft Für Physikalische Chemie
1984;88:739--42. #link("https://doi.org/10.1002/bbpc.19840880813").

] <ref-bohneThermalConductivityDensity1984>
#block[
\[28\] Lauga E, Brenner M, Stone H. Microfluidics: The No-Slip Boundary
Condition. In: Tropea C, Yarin AL, Foss JF, editors. Springer Handbook
of Experimental Fluid Mechanics, Berlin, Heidelberg: Springer; 2007, p.
1219--40. #link("https://doi.org/10.1007/978-3-540-30299-5_19").

] <ref-laugaMicrofluidicsNoSlipBoundary2007>
#block[
\[29\] Schmieschek S, Shamardin L, Frijters S, Krüger T, Schiller UD,
Harting J, et al. LB3D: A parallel implementation of the
lattice-boltzmann method for simulation of interacting amphiphilic
fluids. Computer Physics Communications 2017;217:149--61.
https:\/\/doi.org/#link("https://doi.org/10.1016/j.cpc.2017.03.013").

] <ref-Schiller2017>
#block[
\[30\] Krüger T, Kusumaatmaja H, Kuzmin A, Shardt O, Silva G, Viggen EM.
The Lattice Boltzmann Method: Principles and Practice. Cham: Springer
International Publishing; 2017.
#link("https://doi.org/10.1007/978-3-319-44649-3").

] <ref-krugerLatticeBoltzmannMethod2017b>
#block[
\[31\] Bhatnagar PL, Gross EP, Krook M. A Model for Collision Processes
in Gases. I. Small Amplitude Processes in Charged and Neutral
One-Component Systems. Phys Rev 1954;94:511--25.
#link("https://doi.org/10.1103/PhysRev.94.511").

] <ref-bhatnagarModelCollisionProcesses1954>
#block[
\[32\] Peter T, Malgaretti P, Rivas N, Scagliarini A, Harting J,
Dietrich S. Numerical simulations of self-diffusiophoretic colloids at
fluid interfaces. Soft Matter 2020;16:3536--47.
#link("https://doi.org/10.1039/C9SM02247C").

] <ref-peterNumericalSimulationsSelfdiffusiophoretic2020>
#block[
\[33\] Antunes GC, Malgaretti P, Harting J, Dietrich S. Pumping and
Mixing in Active Pores. Phys Rev Lett 2022;129:188003.
#link("https://doi.org/10.1103/PhysRevLett.129.188003").

] <ref-antunesPumpingMixingActive2022a>
#block[
\[34\] Khalid Ahmed N, Hecht M. A boundary condition with adjustable
slip length for lattice Boltzmann simulations. Journal of Statistical
Mechanics: Theory and Experiment 2009;2009:P09017.
#link("https://doi.org/10.1088/1742-5468/2009/09/P09017").

] <ref-khalidahmed2009>
#block[
\[35\] Hecht M, Harting J. Implementation of on-site velocity boundary
conditions for D3Q19 lattice Boltzmann simulations. J Stat Mech
2010;2010:P01018.
#link("https://doi.org/10.1088/1742-5468/2010/01/P01018").

] <ref-hechtImplementationOnsiteVelocity2010>
#block[
\[36\] Baakeem SS, Bawazeer SA, Mohamad AA. A Novel Approach of Unit
Conversion in the Lattice Boltzmann Method. Applied Sciences
2021;11:6386. #link("https://doi.org/10.3390/app11146386").

] <ref-baakeemNovelApproachUnit2021>
#block[
\[37\] Abramowitz M, Stegun IA.
#link("https://books.google.com?id=ZboM5tOFWtsC")[Handbook of Mathematical Functions with Formulas, Graphs, and Mathematical Tables].
U.S. Government Printing Office; 1972.

] <ref-abramowitzHandbookMathematicalFunctions1972>
] <refs>
