// Chen and Yaji, arXiv:2610.16716v1. Converted from LaTeX under CC BY 4.0.
// https://arxiv.org/abs/2610.16716v1 | https://creativecommons.org/licenses/by/4.0/
#let horizontalrule = line(start: (25%,0%), end: (75%,0%))

#show terms: it => {
  it.children
    .map(child => [
      #strong[#child.term]
      #block(inset: (left: 1.5em, top: -0.4em))[#child.description]
      ])
    .join()
}

#show table: set text(size: 7pt)
#set table(
  inset: (x: 2pt, y: 3pt),
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
  title: [Versatile two-layer model for thermohydraulic prediction of
microchannel heat sinks],
  authors: (
    ( name: [Chih-Hsiang Chen],
      affiliation: "",
      email: "" ),
    ( name: [Kentaro Yaji],
      affiliation: "",
      email: "" ),
    ),
  abstract-title: [Abstract],
  abstract: [Three-dimensional conjugate heat-transfer simulations
provide detailed predictions for microchannel heat sinks but can be
computationally demanding when many geometries and operating conditions
are evaluated. This study develops a versatile two-layer model (VTLM)
that reduces the three-dimensional problem to two coupled
two-dimensional fields while retaining the in-plane geometry of the flow
passages and fins. Effects associated with the unresolved channel-height
direction are incorporated through hydraulic and thermal closures that
account for wall friction and the fluid- and fin-side contributions to
interlayer heat transfer. The closures are evaluated from the
representative channel geometry, flow-development condition, and fin
configuration. The VTLM was assessed against three-dimensional reference
models across broad ranges of channel aspect ratios and operating
conditions, including uniform and nonuniform fin arrangements. Compared
with the existing two-layer models, the VTLM showed improved overall
agreement with the three-dimensional reference results. The results
showed that prediction accuracy was governed mainly by the
flow-development condition and channel aspect ratio, from which a
conservative screening guideline was proposed for the examined
straight-channel configurations. The assessment of finned
expansion--contraction channels further supported the applicability of
the VTLM to the investigated passages with abrupt width changes.
Overall, the VTLM provides a reduced-dimensional framework for
thermohydraulic analysis across the range of microchannel heat-sink
configurations examined in this study without explicitly resolving the
channel-height direction.

],
  pagenumbering: "1",
  cols: 1,
  doc,
)


#block[
#block[
Microchannel heat sink ,Two-layer model ,Reduced-dimensional modeling
,Conjugate heat transfer

]
]
#block[
#heading(level: 1, numbering: none)[Nomenclature]
<nomenclature>
/ $upright(bold(u))$: #block[
fluid velocity vector ($upright(m \/ s)$)
]

/ $upright(bold(x))$: #block[
in-plane position vector ($upright(m)$)
]

/ $upright(A R)$: #block[
channel aspect ratio, $H \/ W$
]

/ $upright(E R)$: #block[
expansion ratio, $W \/ W_(upright(i o))$
]

/ $upright(N u)$: #block[
Nusselt number
]

/ $upright(P o)$: #block[
Poiseuille number
]

/ $upright(P r)$: #block[
Prandtl number
]

/ $upright(R e)$: #block[
Reynolds number
]

/ $A$: #block[
area ($upright(m)^2$)
]

/ $C_1 \, C_2$: #block[
coefficients in the Poiseuille-number correlation
]

/ $c_p$: #block[
specific heat capacity ($upright(J \/) \( k g dot.op K \)$)
]

/ $c_(upright(w f))$: #block[
wall-friction coefficient ($upright(P a) dot.op s \/ m^2$)
]

/ $C_(t \, 1) \, C_(t \, 2)$: #block[
representative-height closure coefficients
]

/ $D_(upright(h))$: #block[
hydraulic diameter ($upright(m)$)
]

/ $e_psi$: #block[
relative difference in the quantity $psi$ (%)
]

/ $f_(upright(D))$: #block[
Darcy friction factor
]

/ $H$: #block[
common channel and fin height ($upright(m)$)
]

/ $h$: #block[
heat-transfer coefficient ($upright(W \/) \( m^2 dot.op K \)$)
]

/ $k$: #block[
thermal conductivity ($upright(W \/) \( m dot.op K \)$)
]

/ $L$: #block[
length ($upright(m)$)
]

/ $L^(+)$: #block[
dimensionless hydraulic flow-development length
]

/ $L_(upright(h))$: #block[
streamwise length used for the hydraulic closure ($upright(m)$)
]

/ $M$: #block[
number of mesh elements
]

/ $m$: #block[
fin parameter ($upright(m)^(- 1)$)
]

/ $N$: #block[
number of fins
]

/ $n_t$: #block[
blending exponent in the representative-height closure
]

/ $n_(upright(N u))$: #block[
blending exponent in the Nusselt-number correlation
]

/ $n_(upright(P o))$: #block[
blending exponent in the Poiseuille-number correlation
]

/ $P$: #block[
perimeter ($upright(m)$)
]

/ $p$: #block[
pressure ($upright(P a)$)
]

/ $Q$: #block[
heat flow ($upright(W)$)
]

/ $q''$: #block[
heat flux ($upright(W \/ m)^2$)
]

/ $R_(upright(t h))$: #block[
thermal resistance ($upright(K \/ W)$)
]

/ $T$: #block[
temperature ($upright(K)$)
]

/ $t$: #block[
representative height or thickness ($upright(m)$)
]

/ $u_c$: #block[
characteristic velocity ($upright(m \/ s)$)
]

/ $W$: #block[
width ($upright(m)$)
]

/ $w_(upright(e))$: #block[
entrance-region weighting factor
]

/ $x^(*)$: #block[
dimensionless thermal flow-development length
]

/ $z$: #block[
coordinate measured from the fin base ($upright(m)$)
]

/ $beta$: #block[
rectangular-channel aspect ratio
]

/ $Lambda$: #block[
dimensionless fin heat-transfer parameter
]

/ $lambda_x$: #block[
normalized streamwise fin length
]

/ $lambda_y$: #block[
normalized transverse fin width
]

/ $mu$: #block[
dynamic viscosity ($upright(P a) dot.op s$)
]

/ $Omega$: #block[
computational region
]

/ $rho$: #block[
density ($upright(k g \/ m)^3$)
]

/ $tau$: #block[
wall shear stress ($upright(P a)$)
]

/ $phi$: #block[
wall-friction allocation fraction
]

/ $theta.alt$: #block[
fin excess temperature ($upright(K)$)
]

/ $zeta_1$: #block[
dimensionless fin-height parameter
]

/ $1$: #block[
Layer~1
]

/ $2$: #block[
Layer~2
]

/ $upright(a x)$: #block[
axial
]

/ $upright(b)$: #block[
fin base
]

/ $upright(b t)$: #block[
bottom surface
]

/ $upright(c)$: #block[
characteristic
]

/ $upright(d e v)$: #block[
developing flow
]

/ $upright(e)$: #block[
entrance
]

/ $upright(e f f)$: #block[
effective
]

/ $upright(f)$: #block[
fluid
]

/ $upright(f i n)$: #block[
fin
]

/ $upright(f p)$: #block[
flow passage
]

/ $upright(G W)$: #block[
geometry-weighted
]

/ $upright(i n)$: #block[
inlet
]

/ $upright(i n t)$: #block[
interlayer
]

/ $upright(i o)$: #block[
inlet and outlet
]

/ $upright(r e f)$: #block[
reference
]

/ $upright(s)$: #block[
solid
]

/ $upright(s i d e)$: #block[
fin side
]

/ $upright(S W)$: #block[
shear-weighted
]

/ $upright(t b)$: #block[
top and bottom walls
]

/ $upright(t o p)$: #block[
representative Layer~1 height
]

/ $upright(w f)$: #block[
wall friction
]

/ $i$: #block[
fin index
]

/ $x$: #block[
streamwise direction
]

/ $y$: #block[
transverse direction
]

/ $upright(3 D)$: #block[
three-dimensional reference model
]

/ $upright(t o t)$: #block[
total
]

/ $upright(V T L M)$: #block[
versatile two-layer model
]

]
#set heading(numbering: "1.")
#set math.equation(numbering: "(1)")

= Introduction
<introduction>
Microchannel heat sinks are widely used for thermal management because
their small characteristic dimensions and large heat-transfer area
enable efficient heat removal from compact systems ~\[1, 2, 3\]. Their
thermohydraulic behavior is inherently three-dimensional, as coolant
flow and thermal development are coupled with heat conduction through
the fins and substrate~\[4, 5, 6\]. Geometric features such as
interrupted or segmented fins further modify the local flow and thermal
boundary-layer development, increasing the difficulty of accurate
performance prediction~\[7, 8, 9\]. Consequently, detailed analysis
commonly relies on three-dimensional conjugate heat-transfer models that
resolve both the fluid and solid domains.

Three-dimensional conjugate heat-transfer simulations can resolve the
coupled fluid and solid fields in detail, but their computational cost
becomes substantial when repeated evaluations are required for many
geometries or operating conditions~\[10, 11, 12\]. Physics-based
reduced-dimensional modeling provides an alternative for applications
requiring repeated thermohydraulic evaluations. In such models, the
governing equations are averaged or approximated in the height
direction, with additional terms introduced to account for unresolved
out-of-plane momentum and heat-transfer effects~\[13, 14, 15\]. These
models retain conservation equations for the flow and temperature fields
in a lower-dimensional physical domain while substantially reducing the
computational cost.

Porous-medium and averaging approaches have been developed primarily for
microchannel heat sinks composed of regular channel-fin arrays. In
porous-medium formulations, the repeated channel-fin structure is
homogenized as an equivalent porous domain, whereas averaging approaches
describe its thermohydraulic behavior using spatially averaged momentum
and energy equations~\[16, 17\]. A subsequent formulation incorporated
entrance effects by distinguishing between developed and developing-flow
regimes and was assessed against a three-dimensional conjugate
heat-transfer model~\[18\]. These approaches provide efficient
predictions by representing regularly arranged channels and fins through
averaged geometric and thermohydraulic properties.

Reduced-dimensional models have also been developed to retain more
complex in-plane channel and fin arrangements. Harpole and Eninger
formulated an early two-dimensional flow and thermal model for a
manifold microchannel heat exchanger, in which unresolved viscous
resistance and fluid-solid heat exchange were represented through
effective relations~\[19\]. Mandel et al. subsequently developed a 2.5-D
model for manifold microchannels that retained the inertial terms and
incorporated developing-flow effects within a two-dimensional
computational representation. The model substantially reduced the
computational cost relative to fully three-dimensional simulations,
although its accuracy deteriorated when secondary three-dimensional flow
structures became significant~\[20\]. Kamal and Dewan adopted a
two-dimensional model for high-aspect-ratio interrupted microchannels
after comparing its predictions with three-dimensional
simulations~\[21\]. In this case, the validity of the reduced
representation relied on sufficiently high aspect ratios to limit
variations in the unresolved direction. These studies demonstrate that
planar computational models can accommodate relatively complex in-plane
flow passages, although their applicability depends on the significance
of the unresolved three-dimensional effects.

#figure(image("graphics/graph1.svg", width: 80.0%),
  caption: [
    Schematic representation of the VTLM. The three-dimensional
    microchannel heat sink is reduced to two coupled planar fields:
    Layer~1, which contains the fluid and fin regions
    ($Omega_(upright(f))$ and $Omega_(upright(s))$), and Layer~2, which
    represents the fin-base junction and substrate region. The
    representative height associated with Layer~1 and the substrate
    thickness are denoted by $t_1$ and $t_2$, respectively.
  ]
)
<Fig.1>

The need for computationally efficient reduced-dimensional models is
particularly pronounced in topology optimization (TO), where the
governing equations must be solved repeatedly as the fluid--solid
distribution evolves. TO provides a systematic approach for generating
flow-channel layouts by optimizing the spatial distribution of fluid and
solid regions within a prescribed design domain~\[22\]. Following the
density-based formulation introduced by Borrvall and Petersson for
Stokes flow~\[23\], fluid topology optimization was extended to more
general flow problems~\[24, 25, 26\] and coupled thermal--fluid
systems~\[27, 28, 29\]. To reduce the computational cost associated with
these repeated analyses, pseudo-three-dimensional and two-layer models
have also been introduced for heat-sink design and topology
optimization. In these models, the three-dimensional conjugate
heat-transfer problem is reduced to coupled planar domains, while
effects associated with the unresolved direction are represented through
simplifying assumptions or effective relations. Haertel et al. developed
a pseudo-three-dimensional model comprising two thermally coupled planar
layers: a conducting base layer and a thermofluid design layer~\[30\].
Comparison with a three-dimensional model showed that the omission of
top- and bottom-wall friction introduced systematic differences in the
predicted flow rate, although the thermal-resistance predictions
remained in good agreement. A related formulation was adopted by Zeng
and Lee for heat-sink topology optimization, and the resulting designs
were subsequently assessed using three-dimensional simulations and
experiments~\[31\]. Yan et al. proposed a two-layer model for the
topology optimization of microchannel heat sinks based on a plane-flow
assumption, in which coupled fluid and solid thermal fields were used to
approximate three-dimensional conjugate heat transfer~\[32\]. Zhao et
al.~\[33\] introduced a multilayer thermofluid model in which adaptive
temperature profiles in the height direction were employed to better
represent out-of-plane heat-transfer effects. A related multilayer
formulation was later used for heat-sink topology optimization under
turbulent forced-convection conditions~\[34\]. More recently, Jia et al.
incorporated a multilayer representation into a topology optimization
framework for microfluidic heat sinks with non-Newtonian fluids~\[35\].

A useful distinction among the reduced-dimensional modeling approaches
reviewed above is how the in-plane channel-fin geometry is represented.
Porous-medium and averaging approaches replace the detailed channel-fin
structure with an equivalent averaged representation and have been
developed mainly for regularly arranged channel-fin configurations~\[16,
17, 18\]. By contrast, several reduced-dimensional formulations retain
the in-plane flow-passage geometry within the computational domain,
including two-layer models used in heat-sink design and topology
optimization~\[30, 31, 32\]. However, their applicability tends to
depend on the channel-height regime. Models based on a plane-flow
assumption are most appropriate for low-aspect-ratio channels, where
variations across the channel height remain limited~\[32, 33, 34, 35\].
In contrast, the limitation associated with neglecting top- and
bottom-wall friction becomes less significant at high aspect ratios,
where the relative contribution of these walls to the total hydraulic
resistance is reduced~\[30, 31\]. Simplified thermal treatments may
likewise lose accuracy as the channel geometry and thermal-development
condition vary~\[31\].

The applicability of existing reduced-dimensional formulations is
generally limited to particular aspect-ratio regimes. A formulation
capable of retaining the in-plane geometry while accommodating a wide
range of aspect ratios remains needed, and its applicable range should
be clearly established. To address this need, the present study develops
a versatile two-layer model (VTLM) for thermohydraulic prediction of
microchannel heat sinks over a broad range of channel aspect ratios. The
original three-dimensional conjugate heat-transfer problem is
represented by two coupled two-dimensional fields: one describing the
in-plane fluid and fin regions and the other accounting for heat
conduction near the fin-base junction and within the substrate. The VTLM
accounts for the unresolved height-direction effects through three
closure models evaluated according to the representative geometry and
development conditions. The wall-friction closure accounts for momentum
loss at the unresolved top and bottom walls, the fluid-side
heat-transfer closure incorporates flow-passage geometry and thermal
development, and the fin-side effective heat-transfer closure represents
both axial fin conduction and lateral heat transfer to the coolant. The
prediction accuracy and applicable range of the VTLM are systematically
assessed against three-dimensional reference simulations over a wide
range of channel aspect ratios and fin configurations. In addition, the
models of Yan et al.~\[32\] and Zeng and Lee~\[31\] are compared at
representative aspect ratios to evaluate the VTLM relative to existing
two-layer formulations. Although both models were developed in the
context of topology optimization, the present comparison concerns only
their underlying thermohydraulic analysis formulations.

The remainder of this paper is organized as follows.
Section~#ref(label("Mathematical model")) presents the assumptions,
governing equations, and thermohydraulic closure models of the VTLM.
Section~#ref(label("Numerical implementation")) describes the numerical
implementation of the VTLM and the three-dimensional simulations.
Section~#ref(label("Results and discussion")) presents the numerical
assessment for different fin-array configurations and flow-passage
geometries and discusses the applicability of the proposed model.
Finally, Section~@Conclusion summarizes the conclusions.

= Mathematical model
#label("Mathematical model")
== Assumptions
<Assumptions>
As illustrated in Fig.~@Fig.1, the VTLM reduces the three-dimensional
conjugate heat-transfer domain to two coupled planar fields. Layer~1
resolves the in-plane coolant and fin regions, whereas Layer~2
represents heat conduction near the fin--base junction and within the
substrate. Variations in the channel-height direction are not resolved
explicitly. Instead, their effects on momentum loss and heat exchange
between the two layers are incorporated through the closure models
described in Section~@sec:closure-models. The formulation is developed
under the following conditions:

- The coolant flow is steady, laminar, incompressible, and Newtonian.
  The thermophysical properties of the coolant and solid materials are
  assumed to be constant.

- The in-plane channel-fin geometry is extruded uniformly in the height
  direction. This assumption excludes configurations with spatially
  varying channel or fin heights, such as tapered or stepped profiles.

- The configurations have a predominant mean flow direction, with the
  inlet and outlet located on opposite sides of the computational
  domain. This direction is used to define the representative streamwise
  dimensions and flow-development lengths required by the closure
  models.

- Heat conduction along the fin height is represented by a
  one-dimensional fin model with an adiabatic tip~\[36\].

== Governing equations
#label("Governing equations")
The VTLM is formulated on the two-dimensional plane shown in
Fig.~@Fig.1. Layer~1 is divided into the fluid region
$Omega_(upright(f))$ and the fin region $Omega_(upright(s))$, whereas
Layer~2 spans the entire in-plane footprint and represents the fin-base
junction and the underlying substrate. The velocity and pressure fields
are solved only in $Omega_(upright(f))$. The temperatures in the fluid
and fin regions of Layer~1 are denoted by $T_(1 \, upright(f))$ and
$T_(1 \, upright(s))$, respectively, while $T_2$ denotes the temperature
in Layer~2. The common channel and fin height is denoted by $H$, while
$t_1$ and $t_2$ denote the representative height associated with Layer~1
and the substrate thickness, respectively. The former also specifies the
representative height of Layer~1 in the fin-side closure, whereas the
latter corresponds to the substrate thickness. All spatial differential
operators appearing below act in the in-plane directions. For steady
incompressible flow, mass conservation in the fluid region is expressed
as
$ nabla dot.op upright(bold(u)) = 0 #h(2em) upright("in ") Omega_(upright(f)) \, $<eq:continuity>
where $upright(bold(u))$ is the fluid velocity. The corresponding
momentum equation is
$ rho_(upright(f)) (upright(bold(u)) dot.op nabla) upright(bold(u)) = - nabla p + nabla dot.op [mu_(upright(f)) (nabla upright(bold(u)) + nabla upright(bold(u))^(sans(T)))] - c_(upright(w f)) upright(bold(u)) #h(2em) upright("in ") Omega_(upright(f)) \, $<eq:momentum>
where $rho_(upright(f))$ is the fluid density, $mu_(upright(f))$ is the
dynamic viscosity, and $p$ is the pressure. The final term represents
the momentum loss associated with viscous shear on the unresolved top
and bottom channel walls. The wall-friction coefficient
$c_(upright(w f))$ is evaluated using the closure model presented in
Section~@wall-friction-coef. The energy equation in the fluid region of
Layer~1 is given by
$ rho_(upright(f)) c_(p \, upright(f)) upright(bold(u)) dot.op nabla T_(1 \, upright(f)) = nabla dot.op (k_(upright(f)) nabla T_(1 \, upright(f))) + h_(upright(f)) / H (T_2 - T_(1 \, upright(f))) #h(2em) upright("in ") Omega_(upright(f)) \, $<eq:energy-layer1-fluid>
where $c_(p \, upright(f))$ and $k_(upright(f))$ are the specific heat
and thermal conductivity of the fluid. The coefficient $h_(upright(f))$
represents the effective heat transfer between the fluid region of
Layer~1 and Layer~2. Within the fin region, heat transport in Layer~1 is
governed by
$ nabla dot.op (k_(upright(s)) nabla T_(1 \, upright(s))) + h_(upright(s)) / H (T_2 - T_(1 \, upright(s))) = 0 #h(2em) upright("in ") Omega_(upright(s)) \, $<eq:energy-layer1-solid>
where $k_(upright(s))$ is the thermal conductivity of the solid material
and $h_(upright(s))$ is the fin-side effective heat-transfer
coefficient. The latter accounts for heat conduction along the fin
height and heat transfer from the fin side surfaces, as described in
Section~@subsec:fin_side_htc. To express the coupling with Layer~2 in a
unified form, the Layer~1 temperature and the interlayer coefficient are
defined as
$ (T_1 \, h_(upright(i n t))) = cases(delim: "{", (T_(1 \, upright(f)) \, h_(upright(f))) \, & upright(bold(x)) in Omega_(upright(f)) \,, (T_(1 \, upright(s)) \, h_(upright(s))) \, & upright(bold(x)) in Omega_(upright(s)) \,) $<eq:interlayer-piecewise>
where $upright(bold(x))$ denotes the in-plane position vector. The
energy balance in Layer~2 is then written as
$ nabla dot.op (k_(upright(s)) nabla T_2) + q''_(upright(b t)) / t_2 - h_(upright(i n t)) / t_2 (T_2 - T_1) = 0 \, $<eq:energy-layer2>
where $q''_(upright(b t))$ is the heat flux supplied at the bottom
surface. The second term represents the applied heat input distributed
over the thickness $t_2$, whereas the third term describes heat exchange
between the two planar fields. When the bottom-surface temperature
$T_(upright(b t))$ is required, the in-plane temperature variation is
already represented by the Layer~2 temperature field. The unresolved
temperature drop across the substrate thickness is reconstructed locally
using a one-dimensional conduction relation, following Zeng and
Lee~\[31\]:
$ T_(upright(b t)) = T_2 + frac(q''_(upright(b t)) t_2, k_(upright(s))) . $<eq:bottom-temperature>

== Thermohydraulic closure models
<sec:closure-models>
=== Wall-friction closure
<wall-friction-coef>
The in-plane momentum equation in Layer~1 does not resolve the velocity
gradients normal to the top and bottom channel walls. The associated
viscous resistance is represented by the linear momentum sink
$- c_(upright(w f)) upright(bold(u))$. By matching this sink with the
pressure gradient of laminar flow through a rectangular duct, the
wall-friction coefficient is expressed as
$ c_(upright(w f)) = frac(phi_(upright(t b)) thin upright(P o) thin mu_(upright(f)), 2 D_(upright(h))^2) \, $<eq:sfc_coefficient>
where $upright(P o)$ is the Poiseuille number, and $phi_(upright(t b))$
denotes the fraction of the total wall friction attributed to the
unresolved top and bottom walls. For a rectangular channel of height $H$
and width $W$, hydraulic diameter $D_(upright(h))$ can be expressed as
follows:
$ D_(upright(h)) = frac(2 H W, H + W) . $<eq:sfc_hydraulic_diameter>

To account for both hydrodynamically developing and fully developed
flow, the Poiseuille number is evaluated using the composite correlation
proposed by Muzychka and Yovanovich~\[37\], expressed in the
Churchill--Usagi form~\[38\]:
$ upright(P o) = f_(upright(D)) upright(R e) = [C_1^(thin n_(upright(P o))) + (C_2 / sqrt(L^(+)))^(n_(upright(P o)))]^(1 \/ n_(upright(P o))) \, $<eq:sfc_po>
where $f_(upright(D))$ is the Darcy friction factor,
$n_(upright(P o)) = 2$, $C_2 = 13.76$, and
$ L^(+) = frac(L_(upright(h)), D_(upright(h)) upright(R e)) \, #h(2em) upright(R e) = frac(rho_(upright(f)) u_c D_(upright(h)), mu_(upright(f))) \, $<eq:sfc_dimensionless_length>
where $L_(upright(h))$ denotes the streamwise length of the flow-passage
segment over which the hydraulic closure is evaluated, and $u_c$ is the
characteristic velocity, defined as the mean velocity at the inlet. The
fully developed contribution $C_1$ is obtained from the rectangular-duct
relation of Shah and London~\[39\]:
$ C_1 = 96 #scale(x: 120%, y: 120%)[\(] & 1 - 1.3553 beta + 1.9467 beta^2 - 1.7012 beta^3\
 & + 0.9564 beta^4 - 0.2537 beta^5 #scale(x: 120%, y: 120%)[\)] \, $<eq:sfc_C1>
where $beta$ denotes the cross-sectional aspect ratio, defined as
$ beta = frac(min \( H \, W \), max \( H \, W \)) \, #h(2em) 0 < beta lt.eq 1 . $<eq:sfc_beta>

Consequently, Eq.~#link(<eq:sfc_po>)[\[eq:sfc\_po\]] adjusts the
predicted friction according to both the duct geometry and hydrodynamic
development. The fraction $phi_(upright(t b))$ is evaluated by blending
the geometry-weighted estimate $phi_(upright(G W))$ for the entrance
region with the shear-weighted estimate $phi_(upright(S W))$ for fully
developed flow as follows:
$ phi_(upright(t b)) = w_(upright(e)) phi_(upright(G W)) + (1 - w_(upright(e))) phi_(upright(S W)) \, #h(2em) w_(upright(e)) = min (L_(upright(e)) / L_(upright(h)) \, 1) \, $<eq:sfc_partition>
where $w_(upright(e))$ is the entrance-region weighting factor and
$L_(upright(e)) = 0.05 thin upright(R e) thin D_(upright(h))$ is the
estimated hydrodynamic entrance length~\[40\]. Near the inlet, the
wall-shear profile has not yet approached its fully developed
distribution. Therefore, the top- and bottom-wall contribution is
approximated from the corresponding fraction of the wetted perimeter:
$ phi_(upright(G W)) = frac(2 W, 2 \( H + W \)) = frac(W, H + W) . $<eq:sfc_phi_GW>

Farther downstream, the allocation between the two pairs of opposing
walls is instead determined from their mean shear stresses. Let
$macron(tau)_H$ and $macron(tau)_W$ denote the magnitudes of the mean
shear stresses on the wall groups whose individual lengths are $H$ and
$W$, respectively. Since the top and bottom surfaces belong to the
$W$-wall group, their fully developed contribution is written as
$ phi_(upright(S W)) = frac(W macron(tau)_W, H macron(tau)_H + W macron(tau)_W) . $<eq:sfc_phi_SW>

Following the rectangular-duct solution reported by Delplace~\[41\], the
mean shear-stress magnitudes are evaluated from the following
expressions:
$ macron(tau)_H = frac(16 Delta p thin H, pi^3 L_(upright(h))) sum_(j = 1 \, 3 \, dots.h)^oo 1 / j^3 tanh (frac(j pi W, 2 H)) \, $<eq:sfc_tau_H>
and
$ macron(tau)_W = frac(16 Delta p thin W, pi^3 L_(upright(h))) sum_(j = 1 \, 3 \, dots.h)^oo 1 / j^3 tanh (frac(j pi H, 2 W)) \, $<eq:sfc_tau_W>
where $Delta p$ is the pressure drop over the streamwise length
$L_(upright(h))$, and the summations are taken over the positive odd
integers $j$.

For channels containing fin arrays, the flow passage cannot be uniquely
assigned a rectangular cross-section. Although the hydraulic resistance
associated with the fin boundaries is resolved directly in Layer~1, the
closure still requires a representative rectangular cross-section to
evaluate the top- and bottom-wall contribution. Accordingly, the flow
passage is mapped to an area-preserving straight channel, as shown in
Fig.~@fig:sfc_equivalent_channel. Its effective width is evaluated as
$W_(upright(e f f)) = A_(upright(f p)) \/ L_(upright(h))$ where
$A_(upright(f p))$ is the flow-passage area of the corresponding
segment. The associated aspect ratio and hydraulic diameter are
$ beta_(upright(e f f)) = frac(min \( H \, W_(upright(e f f)) \), max \( H \, W_(upright(e f f)) \)) \, #h(2em) D_(upright(h) \, upright(e f f)) = frac(2 H W_(upright(e f f)), H + W_(upright(e f f))) . $<eq:sfc_effective_geometry>

All quantities in the wall-friction closure are then evaluated for the
equivalent rectangular channel by replacing $W$, $beta$, and
$D_(upright(h))$ with $W_(upright(e f f))$, $beta_(upright(e f f))$, and
$D_(upright(h) \, upright(e f f))$, respectively. Accordingly,
$upright(R e)$, $L^(+)$, and $L_(upright(e))$ are evaluated using
$D_(upright(h) \, upright(e f f))$. This equivalent representation
provides the global geometric quantities required by the
straight-channel friction closure.

#figure(image("graphics/graph2.svg", width: 100.0%),
  caption: [
    Equivalent straight-channel representation used in the wall-friction
    closure for a fin-array passage: (a) original fin-array passage and
    (b) equivalent straight channel.
  ]
)
<fig:sfc_equivalent_channel>

=== Fluid-side heat transfer coefficient
<subsec:fluid_htc>
The fluid-side contribution to the interlayer heat exchange is evaluated
by distinguishing the portions associated with the fin sidewalls and the
flow-passage surface. These two portions generally have different
streamwise thermal-development lengths and are treated separately before
being combined into a single coefficient. The area-averaged fluid-side
heat transfer coefficient is defined as
$ h_(upright(f)) = frac(h_(upright(f \, f i n)) A_(upright(f i n))^(upright(t o t)) + h_(upright(f \, f p)) A_(upright(f p)), A_(upright(f i n))^(upright(t o t)) + A_(upright(f p))) \, $<eq:hf_effective>
where $h_(upright(f \, f i n))$ and $h_(upright(f \, f p))$ denote the
heat-transfer coefficients assigned to the fin and flow-passage
contributions, respectively. The quantity
$A_(upright(f i n))^(upright(t o t))$ denotes the total in-plane fin
area. Both coefficients are evaluated using a laminar developing-flow
correlation for a rectangular channel, with separate thermal-development
lengths for the fin-sidewall and flow-passage contributions:
$ h_(upright(f \, f i n)) = frac(upright(N u)_(upright(d e v)) \( x_(upright(f i n))^(*) \) thin k_(upright(f)), D_(upright(h))) \, #h(2em) h_(upright(f \, f p)) = frac(upright(N u)_(upright(d e v)) \( x_(upright(f p))^(*) \) thin k_(upright(f)), D_(upright(h))) . $<eq:hf_components>

The corresponding dimensionless thermal-development lengths are shown
below:
$ x_(upright(f i n))^(*) = frac(L_(upright(f i n)), upright(R e) thin upright(P r) thin D_(upright(h))) \, #h(2em) x_(upright(f p))^(*) = frac(L_(upright(f p)), upright(R e) thin upright(P r) thin D_(upright(h))) \, $<eq:thermal_development_lengths>
where
$upright(P r) = mu_(upright(f)) c_(p \, upright(f)) \/ k_(upright(f))$
is the Prandtl number, while $L_(upright(f i n))$ and $L_(upright(f p))$
denote the representative streamwise fin length and the streamwise
flow-passage length, respectively. The developing-flow Nusselt number is
calculated using the correlation proposed by Muzychka and
Yovanovich~\[42\]:
$ upright(N u)_(upright(d e v)) \( x^(*) \) = {[0.4886 (C_1 / x^(*))^(1 \/ 3)]^(n_(upright(N u))) + [0.1144 C_1 / sqrt(pi beta^0.1)]^(n_(upright(N u)))}^(1 \/ n_(upright(N u))) \, $<eq:nu_developing>
where $C_1$ is the fully developed rectangular-duct coefficient defined
in Eq.~#link(<eq:sfc_C1>)[\[eq:sfc\_C1\]], $beta$ is the channel aspect
ratio defined in Eq.~#link(<eq:sfc_beta>)[\[eq:sfc\_beta\]], and
$n_(upright(N u)) = 5$ is the blending exponent. The correlation was
originally formulated for a rectangular channel heated on all four
walls. In the present model, it is applied as an approximation to the
three-sided heating configuration.

For a uniform fin array, $L_(upright(f i n))$ is the streamwise fin
length. For a nonuniform fin array, the geometry is mapped to an
equivalent uniform fin array, as illustrated in
Fig.~@fig:equivalent_fin_array, and $L_(upright(f i n))$ is evaluated as
follows:
$ L_(upright(f i n)) = frac(2 A_(upright(f i n))^(upright(t o t)), P_(upright(f i n))^(upright(t o t)) - 2 L_(upright(f i n))^(upright(t o t))) \, $<eq:equivalent_fin_length>
where $P_(upright(f i n))^(upright(t o t))$ and
$L_(upright(f i n))^(upright(t o t))$ denote the total in-plane fin
perimeter and the sum of the streamwise fin lengths, respectively.

#figure(image("graphics/graph3.svg", width: 100.0%),
  caption: [
    Equivalent uniform fin-array representation for evaluating the
    fin-side thermal-development length: (a) nonuniform fin array and
    (b) equivalent uniform fin array characterized by
    $L_(upright(f i n))$.
  ]
)
<fig:equivalent_fin_array>

=== Fin-side effective heat transfer coefficient
<subsec:fin_side_htc>
The fluid-side coefficient introduced in Section~@subsec:fluid_htc
describes heat transfer from the fin sidewalls to the coolant but does
not account for heat conduction within the fin. A fin-side effective
heat transfer coefficient $h_(upright(s))$ is introduced to represent
the combined influence of axial fin conduction and lateral heat transfer
to the fluid.

Fig.~@fig:fin_side_closure illustrates the corresponding heat-flow
representation. Heat entering the fin from Layer~2 is denoted by
$Q_(upright(b))$. A portion of this heat is transferred laterally to the
fluid as $Q_(upright(s i d e))$, while the remaining axial heat flow
$Q_(upright(t o p))$ reaches the representative Layer~1 height $t_1$.
The fin-side effective heat transfer coefficient is defined from this
remaining heat flow as

$ h_(upright(s)) = frac(Q_(upright(t o p)), A_(upright(f i n))^(upright(t o t)) [T_2 - T_(upright(f i n)) \( t_1 \)]) \, $<eq:hs_definition>
where $T_2 = T_(upright(f i n)) \( 0 \)$ is the temperature at the
fin-base junction, and $T_(upright(f i n)) \( t_1 \)$ is the fin
temperature at the representative height. Under the uniform-extrusion
assumption, $A_(upright(f i n))^(upright(t o t))$ also serves as the
total cross-sectional area normal to heat conduction along the fin
height. Here, $t_1$ denotes the representative height of Layer~1 and is
an effective closure parameter rather than a physical geometric
dimension.

#figure(image("graphics/graph4.svg", width: 80.0%),
  caption: [
    Schematic of the fin-side thermal closure. Heat entering the fin
    from Layer~2 is divided into lateral heat transfer to the coolant
    and the remaining axial heat flow evaluated at the representative
    height $t_1$.
  ]
)
<fig:fin_side_closure>

Using a one-dimensional fin approximation with constant properties and
an adiabatic fin tip,
Eq.~#link(<eq:hs_definition>)[\[eq:hs\_definition\]] can be written in
closed form as
$ h_(upright(s)) = k_(upright(s)) / H frac(Lambda sinh zeta_1, cosh Lambda - cosh zeta_1) \, $<eq:hs_closed_form>
where
$ Lambda = H sqrt(frac(h_(upright(f \, f i n)) P_(upright(f i n))^(upright(t o t)), k_(upright(s)) A_(upright(f i n))^(upright(t o t)))) \, #h(2em) zeta_1 = Lambda (1 - t_1 / H) . $<eq:fin_side_parameters>
Here, $H$ denotes the common channel and fin height. The coefficient
$h_(upright(f \, f i n))$ is evaluated using the fluid-side closure
described in Section~@subsec:fluid_htc. The detailed derivation of
Eqs.~#link(<eq:hs_closed_form>)[\[eq:hs\_closed\_form\]] and
#link(<eq:fin_side_parameters>)[\[eq:fin\_side\_parameters\]] is
provided in~@app:fin_side_htc_derivation.

The dimensionless parameter $Lambda$ characterizes lateral heat transfer
relative to axial conduction within the fin. Because the effective
location of the interlayer heat exchange changes with $Lambda$, the
representative height $t_1$ is not prescribed as a fixed fraction of
$H$. As illustrated in Fig.~@fig:representative_height, weak lateral
heat transfer allows heat to travel farther toward the fin tip and gives
a larger $t_1$. By contrast, strong lateral heat transfer concentrates
the effective exchange closer to the fin base and leads to a smaller
$t_1$. The representative-height ratio is evaluated using the following
Churchill--Usagi-type blending relation:
$ t_1 / H = [(C_(t \, 1))^(- n_t) + (C_(t \, 2) / Lambda)^(- n_t)]^(- 1 \/ n_t) \, $<eq:representative_height>
where closure parameters are set to $n_t approx 1.4$,
$C_(t \, 1) = 0.8$, and $C_(t \, 2) = 0.693$. These values were
calibrated using the baseline straight-channel dataset and were retained
without further adjustment in the subsequent cases. For configurations
without fins, the solid region $Omega_(upright(s))$ is absent from
Layer~1. Accordingly, the fin-side coefficient $h_(upright(s))$ and the
representative-height relation in
Eq.~#link(<eq:representative_height>)[\[eq:representative\_height\]] are
not used. Interlayer heat transfer is represented solely by the
fluid-side coefficient $h_(upright(f))$.

#figure(image("graphics/graph5.svg", width: 100.0%),
  caption: [
    Effect of the lateral heat-transfer intensity on the representative
    Layer~1 height: (a) weak lateral heat transfer with small $Lambda$
    and (b) strong lateral heat transfer with large $Lambda$. Increasing
    $Lambda$ shifts the representative Layer~1 height toward the fin
    base.
  ]
)
<fig:representative_height>

= Numerical implementation
#label("Numerical implementation")
The VTLM and the corresponding three-dimensional reference model were
implemented using the finite-element method in COMSOL Multiphysics 6.1.
In both models, the velocity and pressure fields were solved using the
Laminar Flow interface, while conjugate heat transfer in the fluid and
solid regions was evaluated using the Heat Transfer in Solids and Fluids
interface. For the VTLM, Layer~1 and Layer~2 were constructed as
separate two-dimensional components, with Layer~2 modeled using the Heat
Transfer in Solids interface. The velocity and pressure fields were
discretized using equal-order first-order finite elements (P1+P1), while
linear finite elements were used for the temperature field. Consistent
streamline-diffusion and crosswind-diffusion stabilization were applied
to both the flow and heat-transfer equations. The wall-friction sink
term was introduced into the Layer~1 momentum equation, and the
interlayer heat-transfer terms were applied with opposite signs in the
energy equations of the two layers, using $h_(upright(f))$ and
$h_(upright(s))$ in the flow-passage and fin regions, respectively. The
three-dimensional reference model was resolved directly without
reduced-dimensional hydraulic or thermal closure terms. All calculations
were performed under stationary conditions. The same material properties
and boundary conditions were imposed in the VTLM and three-dimensional
calculations for each case. A relative solver tolerance of
$1.0 times 10^(- 4)$ was used throughout the study. All simulations were
performed on the same workstation equipped with a 13th Gen Intel Core
i7-13700 processor. The global energy balance was also verified by
comparing the imposed heat input with the coolant enthalpy increase,
$dot(m) c_(p \, upright(f)) \( T_(upright(o u t)) - T_(upright(i n)) \)$,
confirming that the energy imbalance was negligible for the conjugate
heat-transfer cases.

= Results and discussion
#label("Results and discussion")
== Assessment of the three-dimensional reference model
<subsec:reference_model_verification>
Before its use as the reference model for evaluating the VTLM, the
three-dimensional numerical implementation was examined through a
mesh-independence study and comparison with analytical solutions. Both
tests employed a straight square channel containing only the fluid
domain. No solid domain and conjugate heat transfer were included.

The channel had a width and height of $W = H = 3.0 med upright(m m)$ and
a length of $L = 45.0 med upright(m m)$. For this benchmark, the
streamwise development length in $L^(+)$ was taken as the full channel
length, $L_(upright(h)) = L$. Water was used as the working fluid, with
$rho = 1000 med upright(k g \/ m^3)$,
$mu = 1.0 times 10^(- 3) med upright(P a thin s)$,
$k_(upright(f)) = 0.6 med upright(W \/ \( m thin K \))$, and
$c_(p \, upright(f)) = 4180 med upright(J \/ \( k g thin K \))$. A
uniform velocity and temperature were prescribed at the inlet, while the
outlet pressure was set to zero. No-slip conditions were imposed on all
channel walls, which were subjected to a uniform heat flux. The
hydraulic and thermal predictions were evaluated using the Darcy
friction factor and the mean Nusselt number:
$ f_(upright(D)) = frac(2 Delta p D_(upright(h)), rho u_(upright(c))^(thin 2) L) \, #h(2em) upright(N u) = frac(macron(h) D_(upright(h)), k_(upright(f))) \, $<eq:reference_performance_metrics>
where $macron(h)$ is the mean heat transfer coefficient over the heated
walls. For $psi in { f_(upright(D)) \, upright(N u) }$, the relative
difference from a reference value was defined as
$ e_psi = frac(psi - psi_(upright(r e f)), psi_(upright(r e f))) times 100 % \, $<eq:normalized_difference>
where $e_psi$ is the percentage relative difference in $psi$, and
$psi_(upright(r e f))$ denotes the reference value selected for each
comparison.

=== Mesh-independence study
<subsubsec:mesh_independence>
Mesh sensitivity was examined at $upright(R e) = 10$ and $1000$ using
structured hexahedral meshes successively refined in the streamwise and
cross-sectional directions. These two Reynolds numbers represent
different levels of flow and thermal development. The relative
difference $e_psi$ was evaluated using
Eq.~#link(<eq:normalized_difference>)[\[eq:normalized\_difference\]],
where $psi$ denotes the result obtained using the current mesh and
$psi_(upright(r e f))$ denotes that obtained using the preceding coarser
mesh.

The mesh-independence results are summarized in
Table~@tab:mesh_independence_reference. The variations in both
$f_(upright(D))$ and $upright(N u)$ decreased progressively with
increasing mesh resolution. For the $12 times 360 times 12$ mesh, the
changes relative to the preceding mesh were within $1.5 %$ at both
Reynolds numbers. This mesh was adopted for the subsequent
straight-channel calculations.

=== Comparison with benchmark solutions
<subsubsec:analytical_comparison>
The accuracy of the mesh-independent model was evaluated by comparing
the predicted friction factor and Nusselt number with the
developing-flow solutions of Muzychka and Yovanovich~\[37, 42\].
Calculations were performed over the range
$10 lt.eq upright(R e) lt.eq 1000$. The analytical values of
$f_(upright(D))$ and $upright(N u)$ were obtained from
Eqs.~#link(<eq:sfc_po>)[\[eq:sfc\_po\]] and
#link(<eq:nu_developing>)[\[eq:nu\_developing\]], respectively. For this
comparison, $psi$ and $psi_(upright(r e f))$ in
Eq.~#link(<eq:normalized_difference>)[\[eq:normalized\_difference\]]
denote the three-dimensional and analytical results, respectively.

Table~@tab:analytical_reference_comparison compares the numerical and
analytical values. Good agreement was obtained throughout the
investigated Reynolds-number range, with maximum absolute differences of
$0.82 %$ for $f_(upright(D))$ and $0.85 %$ for $upright(N u)$. These
results confirm that the three-dimensional implementation accurately
predicts both the hydraulic resistance and developing convective heat
transfer in the straight channel.

#block[
#figure(
  align(center)[#table(
    columns: 11,
    align: (center,center,center,center,center,center,center,center,center,center,center,),
    table.header([$M_x$], [$M_y$], [$M_z$], table.cell(align: center, colspan: 4)[$upright(R e) = 10$], table.cell(align: center, colspan: 4)[$upright(R e) = 1000$],),
    table.hline(),
    [4-7 (lr)8-11], [], [], [$f_(upright(D))$], [$e_f$
    (%)], [$upright(N u)$], [$e_(upright(N u))$
    (%)], [$f_(upright(D))$], [$e_f$
    (%)], [$upright(N u)$], [$e_(upright(N u))$ (%)],
    [4], [120], [4], [5.471], [--], [5.738], [--], [0.116], [--], [19.281], [--],
    [6], [180], [6], [5.638], [3.04], [5.584], [-2.69], [0.119], [3.14], [17.576], [-8.84],
    [8], [240], [8], [5.736], [1.74], [5.546], [-0.68], [0.122], [2.29], [16.888], [-3.91],
    [10], [300], [10], [5.801], [1.15], [5.533], [-0.24], [0.124], [1.64], [16.519], [-2.18],
    [12], [360], [12], [5.849], [0.83], [5.527], [-0.10], [0.125], [1.19], [16.298], [-1.34],
    [14], [420], [14], [5.887], [0.64], [5.525], [-0.04], [0.127], [0.90], [16.152], [-0.90],
    [16], [480], [16], [5.917], [0.51], [5.524], [-0.02], [0.127], [0.71], [16.050], [-0.63],
  )]
  , caption: [Mesh-independence results for the straight-channel
  benchmark. The signed errors indicate changes relative to the
  preceding coarser mesh.]
  , kind: table
  ) <tab:mesh_independence_reference>

]
#block[
#figure(
  align(center)[#table(
    columns: 9,
    align: (center,center,center,center,center,center,center,center,center,),
    table.header([$upright(R e)$], [$L^(+)$], [$x^(*)$], table.cell(align: center, colspan: 2)[Analytical], table.cell(align: center, colspan: 2)[3D
      model], table.cell(align: center, colspan: 2)[Error (%)],),
    table.hline(),
    [4-5 (lr)6-7
    (lr)8-9], [], [], [$f_(upright(D))$], [$upright(N u)$], [$f_(upright(D))$], [$upright(N u)$], [$e_f$], [$e_(upright(N u))$],
    [10], [1.500], [0.2152], [5.802], [4.176], [5.849], [4.177], [0.82], [0.04],
    [100], [0.150], [0.0215], [0.671], [6.521], [0.668], [6.514], [-0.47], [-0.10],
    [200], [0.075], [0.0108], [0.380], [8.026], [0.379], [8.010], [-0.16], [-0.20],
    [400], [0.038], [0.0055], [0.228], [10.173], [0.229], [10.134], [0.47], [-0.38],
    [600], [0.025], [0.0036], [0.173], [11.834], [0.174], [11.770], [0.36], [-0.54],
    [800], [0.019], [0.0027], [0.144], [13.246], [0.144], [13.154], [-0.03], [-0.69],
    [1000], [0.015], [0.0022], [0.126], [14.499], [0.125], [14.376], [-0.41], [-0.85],
  )]
  , caption: [Comparison of the analytical and three-dimensional results
  for the straight-channel benchmark.]
  , kind: table
  ) <tab:analytical_reference_comparison>

]
== Straight-channel flow and conjugate heat transfer
<subsec:baseline_straight_channel>
A straight-channel conjugate heat-transfer case was used as the baseline
configuration for calibrating the representative-height closure in
Eq.~(@eq:representative_height). Unlike the fluid-only benchmark in
Section~@subsec:reference_model_verification, this configuration
includes heat conduction through a solid fin and a heated base.
Fig.~@fig:baseline_straight_channel\(a) shows the three-dimensional
domain, while Fig.~@fig:baseline_straight_channel\(b) shows its
two-layer representation. The channel consists of inlet and outlet
sections of length $0.25 L$ and a central section of length $0.5 L$
containing the fin and heated base. The wall-friction closure was
evaluated separately for these streamwise sections, with
$L_(upright(h)) = 0.25 L$ for the inlet and outlet sections and
$L_(upright(h)) = 0.5 L$ for the central section. Unless otherwise
stated, the $L^(+)$ values reported in the subsequent conjugate
heat-transfer assessments refer to the central section and are evaluated
using $L_(upright(h)) = 0.5 L$. In the symmetry-reduced domain, both the
flow passage and the fin have a transverse width of $0.5 W$.

#figure(image("graphics/graph6.svg", width: 75.0%),
  caption: [
    Computational domains for the baseline straight-channel conjugate
    heat-transfer case: (a) symmetry-reduced three-dimensional model and
    (b) corresponding VTLM representation.
  ]
)
<fig:baseline_straight_channel>

The channel length and width were $L = 45.0 med upright(m m)$ and
$W = 3.0 med upright(m m)$, respectively. The substrate thickness was
fixed at $t_2 = 3.0 med upright(m m)$ for all conjugate heat-transfer
cases considered in this study. The water properties were identical to
those used in Section~@subsec:reference_model_verification, and copper
with $k_(upright(s)) = 386 med upright(W \/ \( m thin K \))$ was
assigned to the fin and heated base. The inlet temperature was fixed at
$T_(upright(i n)) = 293.15 med upright(K)$, and a uniform heat flux of
$q''_(upright(b t)) = 50 med upright(k W \/ m^2)$ was applied at the
bottom surface. The Reynolds number was maintained at
$upright(R e) = 400$. The geometric aspect ratio was defined as
$upright(A R) = H \/ W$ and varied from $0.2$ to $5.0$ by changing $H$
while keeping $W$ fixed.

The hydraulic comparison was performed using the Darcy friction factor
defined in
Eq.~#link(<eq:reference_performance_metrics>)[\[eq:reference\_performance\_metrics\]],
with the relative difference $e_f$ evaluated using
Eq.~#link(<eq:normalized_difference>)[\[eq:normalized\_difference\]].
For the thermal comparison, the area-averaged bottom-surface temperature
$overline(T)_(upright(b t))$ was adopted as the primary thermal metric,
consistent with previous two-layer models for microchannel heat
sinks~\[32, 31\]. To avoid a temperature-relative error that depends on
the chosen temperature reference, the thermal discrepancy was defined as
the signed difference
$ Delta T_(upright(b t)) = overline(T)_(upright(b t))^(upright(V T L M)) - overline(T)_(upright(b t))^(upright(3 D)) . $

The calibration results are summarized in
Table~@tab:baseline_straight_channel. Across the baseline dataset, the
hydraulic discrepancy remains within $4.62 %$, while the signed
bottom-temperature difference ranges from $- 1.46$ to
$1.32 med^compose upright(C)$. At low aspect ratios, the VTLM slightly
overpredicts $f_(upright(D))$ and underpredicts
$overline(T)_(upright(b t))$. The bottom-temperature difference changes
sign as $upright(A R)$ increases, whereas the hydraulic prediction
remains slightly higher than the three-dimensional value in all cases.
The parameters in
Eq.~#link(<eq:representative_height>)[\[eq:representative\_height\]]
were determined from this baseline dataset and retained without
readjustment in the remaining cases. Accordingly, these baseline cases
are treated as calibration cases and are not included in the subsequent
assessment of the VTLM prediction accuracy.

#block[
#figure(
  align(center)[#table(
    columns: 7,
    align: (center,center,center,center,center,center,center,),
    table.header([$upright(A R)$], [$f_(upright(D))^(upright(3 D))$], [$overline(T)_(upright(b t))^(upright(3 D))$
      ($""^compose upright(C)$)], [$f_(upright(D))^(upright(V T L M))$], [$overline(T)_(upright(b t))^(upright(V T L M))$
      ($""^compose upright(C)$)], [$e_f$ (%)], [$Delta T_(upright(b t))$
      ($""^compose upright(C)$)],),
    table.hline(),
    [0.2], [0.206], [36.49], [0.213], [35.03], [3.44], [-1.46],
    [0.3], [0.202], [38.38], [0.207], [37.30], [2.30], [-1.08],
    [0.4], [0.202], [39.08], [0.204], [38.46], [1.03], [-0.62],
    [0.5], [0.205], [39.10], [0.206], [38.77], [0.46], [-0.33],
    [1.0], [0.225], [36.34], [0.230], [36.85], [2.10], [0.51],
    [2.0], [0.259], [31.55], [0.268], [32.67], [3.50], [1.12],
    [3.0], [0.276], [29.04], [0.288], [30.34], [4.28], [1.30],
    [4.0], [0.288], [27.63], [0.301], [28.95], [4.55], [1.32],
    [5.0], [0.295], [26.77], [0.309], [28.04], [4.62], [1.27],
  )]
  , caption: [Comparison of the VTLM and three-dimensional reference
  results for the baseline straight-channel conjugate heat-transfer
  cases used for calibration.]
  , kind: table
  ) <tab:baseline_straight_channel>

]
#block[
#figure(
  align(center)[#table(
    columns: 9,
    align: (center,center,center,center,center,center,center,center,center,),
    table.header([], table.cell(align: center, colspan: 2)[3D
      reference], table.cell(align: center, colspan: 2)[VTLM], table.cell(align: center, colspan: 2)[Zeng
      and Lee], table.cell(align: center, colspan: 2)[Yan et al.],),
    table.hline(),
    [2-3 (lr)4-5 (lr)6-7 (lr)8-9
    $upright(A R)$], [$f_(upright(D))$], [$overline(T)_(upright(b t))$], [$f_(upright(D))$], [$overline(T)_(upright(b t))$], [$f_(upright(D))$], [$overline(T)_(upright(b t))$], [$f_(upright(D))$], [$overline(T)_(upright(b t))$],
    [0.2], [0.206], [36.49], [0.213], [35.03], [0.019], [46.70], [0.163], [46.89],
    [1.0], [0.225], [36.34], [0.230], [36.85], [0.108], [40.60], [0.157], [43.70],
    [5.0], [0.295], [26.77], [0.309], [28.04], [0.254], [27.90], [0.250], [28.65],
  )]
  , caption: [Comparison of the VTLM and existing two-layer models with
  the three-dimensional reference results at representative channel
  aspect ratios. The bottom-surface temperature $T_(upright(b t))$ is
  given in $""^compose upright(C)$.]
  , kind: table
  ) <tab:model_comparison>

]
To further compare the behavior of the VTLM with existing
reduced-dimensional approaches, the two-layer models of Zeng and
Lee~\[31\] and Yan et al.~\[32\] were evaluated at representative
channel aspect ratios. The predicted values are summarized in
Table~@tab:model_comparison, and the corresponding hydraulic and thermal
prediction differences from the three-dimensional reference results are
shown in Fig.~@fig:model_comparison_errors. Because these baseline
configurations were used only to calibrate the representative-height
thermal closure, the hydraulic comparison remains independent of that
calibration. Therefore, the thermal comparison is included to illustrate
the behavior of the different reduced-dimensional formulations under the
same baseline conditions rather than to provide an independent
assessment of the VTLM.

The hydraulic comparison in Fig.~@fig:model_comparison_errors\(a) shows
the substantial differences among the models. At $upright(A R) = 0.2$,
the VTLM predicts the Darcy friction factor within $3.40 %$ of the
three-dimensional result, whereas the models of Zeng and Lee and Yan et
al. underpredict it by $90.78 %$ and $20.87 %$, respectively. The large
discrepancy of the Zeng and Lee model is consistent with its omission of
the friction associated with the unresolved top and bottom walls, whose
contribution becomes particularly important at low aspect ratios. The
Yan et al. model also shows appreciable underprediction because its
plane-flow formulation does not account for hydrodynamic development in
the height direction. By contrast, the VTLM incorporates both effects
through its hydraulic closure. As $upright(A R)$ increases, the errors
of the existing models decrease substantially because the relative
contribution of the top and bottom wall friction becomes smaller.

#figure(image("graphics/graph12.svg", width: 82.0%),
  caption: [
    Prediction differences from the three-dimensional reference results
    for the VTLM and existing two-layer models at $upright(A R) = 0.2$,
    1.0, and 5.0: (a) relative difference in the Darcy friction factor
    and (b) area-averaged bottom-temperature difference.
  ]
)
<fig:model_comparison_errors>

#block[
#figure(
  align(center)[#table(
    columns: 6,
    align: (center,center,center,center,center,center,),
    table.header([$upright(A R)$], [3D DOFs], [VTLM
      DOFs], [$t_(upright(3 D))$ (s)], [$t_(upright(V T L M))$
      (s)], [Speedup],),
    table.hline(),
    [0.2], [749525], [25469], [137], [7], [19.6],
    [1.0], [749525], [25469], [138], [4], [34.5],
    [5.0], [3373577], [25469], [682], [4], [170.5],
  )]
  , caption: [Computational cost of the VTLM and three-dimensional
  reference model for representative straight-channel conjugate
  heat-transfer cases.]
  , kind: table
  ) <tab:computational_cost>

]
#block[
#figure(
  align(center)[#table(
    columns: 12,
    align: (center,center,center,center,center,center,center,center,center,center,center,center,),
    table.header([Case], [$upright(R e)$], [$upright(A R)$], [$L^(+)$], [$N_y$], [$lambda_y$], [$f_(upright(D))^(upright(3 D))$], [$f_(upright(D))^(upright(V T L M))$], [$e_f$
      (%)], [$overline(T)_(upright(b t))^(upright(3 D))$
      ($""^compose upright(C)$)], [$overline(T)_(upright(b t))^(upright(V T L M))$
      ($""^compose upright(C)$)], [$Delta T_(upright(b t))$
      ($""^compose upright(C)$)],),
    table.hline(),
    [UT1], [100], [1.0], [0.0750], [1], [0.10], [1.338], [1.374], [2.72], [32.43], [32.72], [0.29],
    [UT2], [100], [1.0], [0.0750], [1], [0.60], [9.517], [9.223], [-3.09], [28.05], [28.63], [0.58],
    [UT3], [100], [1.0], [0.0750], [3], [0.05], [3.994], [3.856], [-3.47], [25.05], [25.63], [0.58],
    [UT4], [100], [1.0], [0.0750], [3], [0.10], [6.767], [6.502], [-3.93], [24.40], [24.99], [0.59],
    [UT5], [100], [1.0], [0.0750], [5], [0.05], [11.692], [11.105], [-5.02], [23.41], [23.89], [0.48],
    [UT6], [100], [1.0], [0.0750], [5], [0.10], [37.903], [36.045], [-4.90], [22.89], [23.32], [0.43],
    [UT7], [500], [1.0], [0.0150], [1], [0.10], [0.342], [0.381], [11.49], [26.67], [27.35], [0.68],
    [UT8], [500], [1.0], [0.0150], [1], [0.40], [0.861], [0.857], [-0.47], [24.94], [25.84], [0.90],
    [UT9], [500], [1.0], [0.0150], [3], [0.05], [0.890], [0.898], [0.85], [23.00], [23.50], [0.50],
    [UT10], [500], [1.0], [0.0150], [5], [0.10], [8.221], [7.668], [-6.72], [21.37], [21.75], [0.38],
    [UT11], [500], [1.0], [0.0225], [1], [0.10], [0.310], [0.341], [9.84], [25.26], [25.74], [0.48],
    [UT12], [500], [1.0], [0.0450], [1], [0.10], [0.276], [0.293], [6.20], [23.59], [23.65], [0.06],
    [UT13], [100], [1.0], [0.2250], [1], [0.10], [1.216], [1.213], [-0.29], [26.56], [26.49], [-0.07],
    [UT14], [100], [1.0], [0.0150], [1], [0.10], [1.911], [2.041], [6.82], [53.69], [56.21], [2.52],
  )]
  , caption: [Comparison of the VTLM and three-dimensional reference
  results for uniform transverse fin arrays at $upright(A R) = 1$.]
  , kind: table
  ) <tab:uniform_transverse_ar1>

]
The thermal comparison in Fig.~@fig:model_comparison_errors\(b) shows a
similar reduction in model differences with increasing aspect ratio. At
$upright(A R) = 0.2$, the VTLM gives a bottom-temperature difference of
$- 1.46 med^compose upright(C)$, whereas the models of Zeng and Lee and
Yan et al. overpredict the bottom temperature by
$10.21 med^compose upright(C)$ and $10.40 med^compose upright(C)$,
respectively. The larger discrepancies of the latter are associated with
their simplified treatment of the height-direction thermal behavior,
using either an effective thermal-resistance representation or a
plane-flow-based formulation. In contrast, the VTLM evaluates its
thermal closures from the representative geometry and development
condition. At $upright(A R) = 1.0$, the VTLM gives a bottom-temperature
difference of only $0.51 med^compose upright(C)$, compared with
$4.26 med^compose upright(C)$ and $7.36 med^compose upright(C)$ for the
Zeng and Lee and Yan et al. models, respectively. At
$upright(A R) = 5.0$, all three models give differences below
$2 med^compose upright(C)$, indicating that the discrepancies among the
reduced-dimensional formulations become less pronounced as the aspect
ratio increases.

The computational cost of the VTLM was also compared with that of the
three-dimensional reference model using the representative
straight-channel cases. The solution times reported in
Table~@tab:computational_cost correspond to the stationary solution
process. The VTLM substantially reduces the computational cost relative
to the three-dimensional model, with solution-time speedups ranging from
approximately 20 to 171 over the examined aspect ratios. The
computational advantage becomes more pronounced at larger aspect ratios,
as the VTLM avoids explicit discretization in the channel-height
direction.

== Fin arrays in a straight channel
#label("Fin arrays in a straight channel")
#block[
#figure(
  align(center)[#table(
    columns: 12,
    align: (center,center,center,center,center,center,center,center,center,center,center,center,),
    table.header([Case], [$upright(R e)$], [$upright(A R)$], [$L^(+)$], [$N_y$], [$lambda_y$], [$f_(upright(D))^(upright(3 D))$], [$f_(upright(D))^(upright(V T L M))$], [$e_f$
      (%)], [$overline(T)_(upright(b t))^(upright(3 D))$
      ($""^compose upright(C)$)], [$overline(T)_(upright(b t))^(upright(V T L M))$
      ($""^compose upright(C)$)], [$Delta T_(upright(b t))$
      ($""^compose upright(C)$)],),
    table.hline(),
    [UT15], [100], [0.2], [0.225], [1], [0.20], [1.016], [1.051], [3.44], [34.65], [33.21], [-1.44],
    [UT16], [100], [0.2], [0.225], [1], [0.60], [2.586], [2.509], [-2.98], [35.41], [34.73], [-0.68],
    [UT17], [500], [0.2], [0.045], [1], [0.20], [0.291], [0.260], [-10.65], [27.24], [26.95], [-0.29],
    [UT18], [500], [0.2], [0.045], [1], [0.60], [0.794], [0.700], [-11.84], [26.20], [30.41], [4.21],
    [UT19], [100], [0.2], [0.225], [3], [0.05], [1.263], [1.273], [0.79], [29.23], [27.96], [-1.27],
    [UT20], [500], [0.2], [0.045], [3], [0.05], [0.284], [0.306], [7.75], [24.58], [24.23], [-0.35],
    [UT21], [500], [0.2], [0.045], [3], [0.15], [0.631], [0.618], [-2.06], [23.97], [23.84], [-0.13],
    [UT22], [500], [0.2], [0.045], [5], [0.075], [0.766], [0.725], [-5.35], [22.83], [22.60], [-0.23],
    [UT23], [100], [5.0], [0.045], [1], [0.20], [3.360], [3.422], [1.85], [26.03], [26.82], [0.79],
    [UT24], [100], [5.0], [0.045], [1], [0.40], [7.248], [7.260], [0.17], [24.33], [25.24], [0.91],
    [UT25], [500], [5.0], [0.009], [1], [0.20], [0.784], [0.806], [2.81], [24.08], [24.71], [0.63],
    [UT26], [500], [5.0], [0.009], [1], [0.40], [1.708], [1.693], [-0.88], [22.85], [23.60], [0.75],
    [UT27], [500], [5.0], [0.009], [1], [0.60], [5.483], [5.320], [-2.97], [22.15], [22.85], [0.70],
    [UT28], [100], [5.0], [0.045], [3], [0.05], [9.405], [9.397], [-0.09], [24.12], [24.22], [0.10],
    [UT29], [500], [5.0], [0.009], [3], [0.05], [2.019], [2.010], [-0.45], [22.80], [23.11], [0.31],
    [UT30], [500], [5.0], [0.009], [3], [0.15], [7.090], [7.038], [-0.73], [21.67], [21.98], [0.31],
    [UT31], [500], [5.0], [0.009], [5], [0.075], [10.478], [10.601], [1.17], [21.51], [21.74], [0.23],
  )]
  , caption: [Comparison of the VTLM and three-dimensional reference
  results for uniform transverse fin arrays at $upright(A R) = 0.2$ and
  $5.0$.]
  , kind: table
  ) <tab:uniform_transverse_ar_effects>

]
#block[
#figure(
  align(center)[#table(
    columns: 12,
    align: (center,center,center,center,center,center,center,center,center,center,center,center,),
    table.header([Case], [$upright(R e)$], [$upright(A R)$], [$L^(+)$], [$N_x$], [$lambda_x$], [$f_(upright(D))^(upright(3 D))$], [$f_(upright(D))^(upright(V T L M))$], [$e_f$
      (%)], [$overline(T)_(upright(b t))^(upright(3 D))$
      ($""^compose upright(C)$)], [$overline(T)_(upright(b t))^(upright(V T L M))$
      ($""^compose upright(C)$)], [$Delta T_(upright(b t))$
      ($""^compose upright(C)$)],),
    table.hline(),
    [S1], [100], [1.0], [0.075], [2], [0.225], [1.669], [1.687], [1.06], [31.68], [32.06], [0.38],
    [S2], [100], [1.0], [0.075], [2], [0.125], [1.325], [1.352], [2.04], [33.60], [34.15], [0.55],
    [S3], [500], [1.0], [0.015], [2], [0.225], [0.432], [0.463], [7.17], [25.88], [26.77], [0.89],
    [S4], [500], [1.0], [0.015], [2], [0.125], [0.379], [0.407], [7.38], [26.32], [27.75], [1.43],
    [S5], [100], [1.0], [0.075], [3], [0.133], [1.638], [1.653], [0.93], [31.83], [32.17], [0.34],
    [S6], [100], [1.0], [0.075], [3], [0.067], [1.312], [1.332], [1.53], [33.63], [34.31], [0.68],
    [S7], [500], [1.0], [0.015], [3], [0.133], [0.429], [0.459], [7.06], [25.84], [26.78], [0.94],
    [S8], [500], [1.0], [0.015], [3], [0.067], [0.383], [0.409], [6.71], [26.02], [27.72], [1.70],
    [S9], [100], [0.2], [0.225], [2], [0.175], [0.970], [1.000], [3.14], [34.41], [32.87], [-1.54],
    [S10], [100], [0.2], [0.225], [3], [0.10], [0.965], [0.992], [2.80], [34.25], [32.61], [-1.64],
    [S11], [500], [0.2], [0.045], [2], [0.175], [0.231], [0.253], [9.62], [26.67], [26.58], [-0.09],
    [S12], [500], [0.2], [0.045], [3], [0.10], [0.232], [0.254], [9.33], [26.31], [26.32], [0.01],
    [S13], [100], [5.0], [0.045], [2], [0.175], [2.844], [2.904], [2.10], [27.35], [27.87], [0.52],
    [S14], [100], [5.0], [0.045], [3], [0.10], [2.775], [2.832], [2.05], [27.77], [28.13], [0.36],
    [S15], [500], [5.0], [0.009], [2], [0.175], [0.717], [0.732], [2.04], [24.71], [25.35], [0.64],
    [S16], [500], [5.0], [0.009], [3], [0.10], [0.718], [0.729], [1.51], [24.84], [25.51], [0.67],
  )]
  , caption: [Comparison of the VTLM and three-dimensional reference
  results for uniform streamwise segmented fin arrays.]
  , kind: table
  ) <tab:uniform_streamwise_segmented_fin_arrays>

]
The straight-channel assessment was extended from the baseline
configuration shown in Fig.~@fig:baseline_straight_channel to channels
containing uniformly arranged fin arrays. The fins were placed within
the central heated section of length $L_(upright(f p)) = 0.5 L$ and were
assigned identical rectangular footprints. The streamwise fin length and
transverse fin width are denoted by $L_(upright(f i n))$ and
$W_(upright(f i n))$, respectively, and their dimensionless values are
defined as

$ lambda_x = L_(upright(f i n)) / L \, #h(2em) lambda_y = W_(upright(f i n)) / W . $<eq:dimensionless_fin_dimensions>

The numbers of fins in the streamwise and transverse directions are
denoted by $N_x$ and $N_y$, respectively. In each direction containing
multiple fins, the fins were uniformly spaced. The channel dimensions,
material properties, and boundary conditions were the same as those used
for the straight-channel conjugate heat-transfer case. The VTLM
predictions were compared with the corresponding three-dimensional
results using $f_(upright(D))$ and $overline(T)_(upright(b t))$. The
hydraulic discrepancy was evaluated using the relative difference $e_f$,
while the thermal discrepancy was quantified by the signed
bottom-temperature difference.

The uniform fin-array cases were divided into the three groups
illustrated in Fig.~@fig:uniform_fin_array_groups. Transverse fin arrays
have a single streamwise fin section, $N_x = 1$ and $N_y > 1$, while the
transverse fin number and width are varied. Streamwise segmented fin
arrays have $N_x > 1$ and $N_y = 1$, allowing the effects of segment
number and streamwise fin length to be examined. Two-directional fin
arrays have $N_x > 1$ and $N_y > 1$, providing configurations in which
the flow passage is subdivided in both in-plane directions.

#figure(image("graphics/graph7.svg", width: 60.0%),
  caption: [
    Uniform fin-array groups considered in the straight-channel
    assessment. Only the central heated section is shown: (a) transverse
    fin arrays with $N_x = 1$ and $N_y > 1$, (b) streamwise segmented
    fin arrays with $N_x > 1$ and $N_y = 1$, and (c) two-directional fin
    arrays with $N_x > 1$ and $N_y > 1$.
  ]
)
<fig:uniform_fin_array_groups>

=== Uniform transverse fin arrays
<subsec:uniform_transverse_fin_arrays>
Uniform transverse fin arrays were examined using the configuration
shown in Fig.~@fig:uniform_fin_array_groups\(a). For these cases,
$N_x = 1$ and $lambda_x = 0.5$, so that each fin extends over the full
heated-section length. The transverse arrangement was varied through the
number of fins $N_y$ and the normalized fin width $lambda_y$. Cases
UT11--UT14 vary the hydraulic diameter at fixed $upright(A R) = 1$ and
with the same normalized single-fin configuration to examine the
influence of $L^(+)$ separately from that of the Reynolds number. The
uniform transverse fin-array cases and the corresponding results are
summarized in Table~@tab:uniform_transverse_ar1 for $upright(A R) = 1$
and in Table~@tab:uniform_transverse_ar_effects for $upright(A R) = 0.2$
and $5.0$.

For $upright(A R) = 1$, the dominant change in prediction accuracy is
associated with the flow-development condition. At $L^(+) = 0.075$, the
maximum absolute hydraulic error and bottom-temperature difference are
$5.02 %$ and $0.59 med^compose upright(C)$, respectively. Reducing
$L^(+)$ to $0.015$ increases the hydraulic sensitivity, particularly for
the weakly obstructed single-fin configuration UT7, whereas increasing
the fin width or subdividing the solid region among multiple fins
generally reduces this bias. The bottom-temperature differences remain
within $0.90 med^compose upright(C)$ for these $upright(A R) = 1$
configurations.

The aspect ratio and blockage distribution modify this dependence on
$L^(+)$. At $upright(A R) = 0.2$, combining a low flow-development
length with a large localized blockage produces the largest discrepancy,
as shown by Case UT18, with a hydraulic error of $- 11.84 %$ and a
bottom-temperature difference of $4.21 med^compose upright(C)$.
Configurations with multiple narrower fins exhibit substantially smaller
temperature differences than the single wide-fin case. By contrast, the
$upright(A R) = 5.0$ cases remain thermally robust, with absolute
bottom-temperature differences within $0.91 med^compose upright(C)$,
even at $L^(+) = 0.009$. These comparisons show that $L^(+)$ governs the
overall hydraulic accuracy, while the aspect ratio and localization of
the transverse blockage influence the remaining temperature discrepancy.

=== Uniform streamwise segmented fin arrays
<subsec:uniform_streamwise_segmented_fin_arrays>
Uniform streamwise segmented fin arrays were examined using the
configuration shown in Fig.~@fig:uniform_fin_array_groups\(b). The
transverse fin number was fixed at $N_y = 1$ and $lambda_y = 0.2$, while
the full-length fin was divided into $N_x = 2$ or $3$ equal segments
distributed uniformly within the heated section. The fin-array cases and
corresponding results are summarized in
Table~@tab:uniform_streamwise_segmented_fin_arrays.

Across the streamwise segmented arrays, reducing $L^(+)$ has a greater
influence on the VTLM accuracy than varying the segment number or
length. At $upright(A R) = 1$, the maximum hydraulic error increases
from $2.04 %$ at $L^(+) = 0.075$ to $7.38 %$ at $L^(+) = 0.015$, while
the absolute bottom-temperature differences remain within
$1.70 med^compose upright(C)$. Paired cases with $N_x = 2$ and $3$ give
similar results when their segment dimensions are comparable, indicating
that additional streamwise segmentation does not cause a systematic
deterioration.

The aspect-ratio comparisons support the same interpretation. At
$upright(A R) = 0.2$, reducing $L^(+)$ from $0.225$ to $0.045$ increases
the hydraulic error to approximately $9.5 %$, while the absolute
bottom-temperature differences remain within
$1.64 med^compose upright(C)$. At $upright(A R) = 5.0$, the hydraulic
errors remain within $2.10 %$, and the absolute bottom-temperature
differences remain within $0.67 med^compose upright(C)$, even at
$L^(+) = 0.009$. Thus, the prediction differences are governed primarily
by the flow-development condition and channel aspect ratio, with no
distinct limitation attributable to streamwise segmentation.

#block[
#figure(
  align(center)[#table(
    columns: 14,
    align: (center,center,center,center,center,center,center,center,center,center,center,center,center,center,),
    table.header([Case], [$upright(R e)$], [$upright(A R)$], [$L^(+)$], [$N_x$], [$N_y$], [$lambda_x$], [$lambda_y$], [$f_(upright(D))^(upright(3 D))$], [$f_(upright(D))^(upright(V T L M))$], [$e_f$
      (%)], [$overline(T)_(upright(b t))^(upright(3 D))$
      ($""^compose upright(C)$)], [$overline(T)_(upright(b t))^(upright(V T L M))$
      ($""^compose upright(C)$)], [$Delta T_(upright(b t))$
      ($""^compose upright(C)$)],),
    table.hline(),
    [D1], [100], [1.0], [0.075], [2], [3], [0.225], [0.100], [6.361], [6.102], [-4.09], [24.50], [25.05], [0.55],
    [D2], [100], [1.0], [0.075], [2], [3], [0.075], [0.050], [1.831], [1.831], [0.02], [29.42], [30.08], [0.66],
    [D3], [100], [1.0], [0.075], [5], [3], [0.060], [0.100], [5.137], [4.897], [-4.68], [24.91], [25.56], [0.65],
    [D4], [100], [1.0], [0.075], [5], [3], [0.020], [0.100], [2.785], [2.672], [-4.06], [27.13], [28.40], [1.27],
    [D5], [100], [1.0], [0.075], [5], [5], [0.060], [0.050], [8.116], [7.704], [-5.08], [23.92], [24.36], [0.44],
    [D6], [100], [1.0], [0.075], [9], [3], [0.033], [0.100], [5.614], [5.383], [-4.12], [24.91], [25.29], [0.38],
    [D7], [500], [1.0], [0.015], [2], [3], [0.225], [0.100], [1.450], [1.420], [-2.04], [22.40], [22.95], [0.55],
    [D8], [500], [1.0], [0.015], [2], [3], [0.075], [0.050], [0.496], [0.516], [4.10], [25.41], [26.16], [0.75],
    [D9], [500], [1.0], [0.015], [5], [3], [0.060], [0.100], [1.322], [1.273], [-3.69], [22.44], [23.13], [0.69],
    [D10], [500], [1.0], [0.015], [5], [3], [0.020], [0.100], [0.944], [0.886], [-6.12], [23.40], [24.68], [1.28],
    [D11], [500], [1.0], [0.015], [5], [5], [0.060], [0.050], [2.013], [1.875], [-6.86], [22.02], [22.48], [0.46],
    [D12], [500], [1.0], [0.015], [9], [3], [0.033], [0.100], [1.351], [1.347], [-0.34], [22.60], [22.95], [0.35],
  )]
  , caption: [Comparison of the VTLM and three-dimensional reference
  results for uniform two-directional fin arrays at $upright(A R) = 1$.]
  , kind: table
  ) <tab:uniform_two_directional_ar1>

]
#block[
#figure(
  align(center)[#table(
    columns: 14,
    align: (center,center,center,center,center,center,center,center,center,center,center,center,center,center,),
    table.header([Case], [$upright(R e)$], [$upright(A R)$], [$L^(+)$], [$N_x$], [$N_y$], [$lambda_x$], [$lambda_y$], [$f_(upright(D))^(upright(3 D))$], [$f_(upright(D))^(upright(V T L M))$], [$e_f$
      (%)], [$overline(T)_(upright(b t))^(upright(3 D))$
      ($""^compose upright(C)$)], [$overline(T)_(upright(b t))^(upright(V T L M))$
      ($""^compose upright(C)$)], [$Delta T_(upright(b t))$
      ($""^compose upright(C)$)],),
    table.hline(),
    [D13], [500], [0.2], [0.045], [2], [3], [0.225], [0.100], [0.392], [0.401], [2.23], [24.06], [23.69], [-0.37],
    [D14], [500], [0.2], [0.045], [2], [3], [0.075], [0.050], [0.232], [0.254], [9.34], [25.07], [24.92], [-0.15],
    [D15], [500], [0.2], [0.045], [5], [3], [0.020], [0.100], [0.348], [0.344], [-1.31], [23.29], [23.94], [0.65],
    [D16], [500], [0.2], [0.045], [5], [5], [0.060], [0.050], [0.474], [0.463], [-2.31], [22.60], [22.51], [-0.09],
    [D17], [500], [0.2], [0.045], [9], [3], [0.033], [0.100], [0.381], [0.395], [3.52], [23.75], [23.17], [-0.58],
    [D18], [500], [5.0], [0.009], [2], [3], [0.225], [0.100], [3.500], [3.498], [-0.06], [22.07], [22.28], [0.21],
    [D19], [500], [5.0], [0.009], [2], [3], [0.075], [0.050], [0.951], [0.974], [2.34], [26.02], [27.20], [1.18],
    [D20], [500], [5.0], [0.009], [5], [3], [0.020], [0.100], [1.970], [1.973], [0.14], [23.83], [24.94], [1.11],
    [D21], [500], [5.0], [0.009], [5], [5], [0.060], [0.050], [4.715], [4.939], [4.76], [22.16], [22.84], [0.68],
    [D22], [500], [5.0], [0.009], [9], [3], [0.033], [0.100], [3.091], [3.314], [7.21], [22.58], [22.39], [-0.19],
  )]
  , caption: [Comparison of the VTLM and three-dimensional reference
  results for uniform two-directional fin arrays at $upright(A R) = 0.2$
  and $5.0$.]
  , kind: table
  ) <tab:uniform_two_directional_ar_effects>

]
#block[
#figure(
  align(center)[#table(
    columns: 15,
    align: (center,center,center,center,center,center,center,center,center,center,center,center,center,center,center,),
    table.header([Case], [$upright(R e)$], [$upright(A R)$], [$L^(+)$], [$N_y$], [$lambda_y$], [$lambda_(x \, 1)$], [$lambda_(x \, 2)$], [$lambda_(x \, 3)$], [$f_(upright(D))^(upright(3 D))$], [$f_(upright(D))^(upright(V T L M))$], [$e_f$
      (%)], [$overline(T)_(upright(b t))^(upright(3 D))$
      ($""^compose upright(C)$)], [$overline(T)_(upright(b t))^(upright(V T L M))$
      ($""^compose upright(C)$)], [$Delta T_(upright(b t))$
      ($""^compose upright(C)$)],),
    table.hline(),
    [NT1], [100], [1.0], [0.075], [3], [0.1], [0.500], [0.500], [0.500], [6.755], [6.495], [-3.85], [24.42], [24.89], [0.47],
    [NT2], [100], [1.0], [0.075], [3], [0.1], [0.500], [0.375], [0.250], [4.839], [4.670], [-3.49], [25.28], [25.83], [0.55],
    [NT3], [100], [1.0], [0.075], [3], [0.1], [0.500], [0.250], [0.500], [3.033], [2.971], [-2.05], [27.25], [27.92], [0.67],
    [NT4], [100], [1.0], [0.075], [3], [0.1], [0.250], [0.500], [0.250], [2.537], [2.495], [-1.65], [28.22], [29.09], [0.87],
    [NT5], [500], [1.0], [0.015], [3], [0.1], [0.500], [0.500], [0.500], [1.482], [1.478], [-0.29], [22.44], [22.84], [0.40],
    [NT6], [500], [1.0], [0.015], [3], [0.1], [0.500], [0.375], [0.250], [1.122], [1.122], [0.02], [22.85], [23.41], [0.56],
    [NT7], [500], [1.0], [0.015], [3], [0.1], [0.500], [0.250], [0.500], [0.763], [0.777], [1.89], [24.00], [24.75], [0.75],
    [NT8], [500], [1.0], [0.015], [3], [0.1], [0.250], [0.500], [0.250], [0.649], [0.666], [2.65], [24.41], [25.39], [0.98],
    [NT9], [100], [5.0], [0.045], [3], [0.1], [0.500], [0.500], [0.500], [16.636], [16.514], [-0.73], [23.01], [23.16], [0.15],
    [NT10], [100], [5.0], [0.045], [3], [0.1], [0.250], [0.500], [0.250], [5.599], [5.604], [0.09], [26.83], [27.21], [0.38],
    [NT11], [500], [5.0], [0.009], [3], [0.1], [0.500], [0.500], [0.500], [3.512], [3.512], [-0.02], [22.06], [22.28], [0.22],
    [NT12], [500], [5.0], [0.009], [3], [0.1], [0.250], [0.500], [0.250], [1.318], [1.328], [0.81], [24.60], [25.16], [0.56],
    [NT13], [100], [0.2], [0.225], [3], [0.1], [0.500], [0.500], [0.500], [1.706], [1.678], [-1.61], [28.94], [27.82], [-1.12],
    [NT14], [100], [0.2], [0.225], [3], [0.1], [0.500], [0.375], [0.250], [1.434], [1.425], [-0.62], [29.55], [27.74], [-1.81],
    [NT15], [500], [0.2], [0.045], [3], [0.1], [0.500], [0.500], [0.500], [0.395], [0.407], [3.03], [24.34], [23.77], [-0.57],
    [NT16], [500], [0.2], [0.045], [3], [0.1], [0.250], [0.500], [0.250], [0.266], [0.283], [6.44], [24.64], [24.87], [0.23],
  )]
  , caption: [Comparison of the VTLM and three-dimensional reference
  results for nonuniform transverse fin arrays.]
  , kind: table
  ) <tab:nonuniform_transverse_fin_arrays>

]
#block[
#figure(
  align(center)[#table(
    columns: 15,
    align: (center,center,center,center,center,center,center,center,center,center,center,center,center,center,center,),
    table.header([Case], [$upright(R e)$], [$upright(A R)$], [$L^(+)$], [$N_x$], [$lambda_y$], [$lambda_(x \, 1)$], [$lambda_(x \, 2)$], [$lambda_(x \, 3)$], [$f_(upright(D))^(upright(3 D))$], [$f_(upright(D))^(upright(V T L M))$], [$e_f$
      (%)], [$overline(T)_(upright(b t))^(upright(3 D))$
      ($""^compose upright(C)$)], [$overline(T)_(upright(b t))^(upright(V T L M))$
      ($""^compose upright(C)$)], [$Delta T_(upright(b t))$
      ($""^compose upright(C)$)],),
    table.hline(),
    [NS1], [100], [1.0], [0.075], [3], [0.2], [0.150], [0.150], [0.150], [1.685], [1.697], [0.68], [31.62], [31.66], [0.04],
    [NS2], [100], [1.0], [0.075], [3], [0.2], [0.150], [0.100], [0.050], [1.474], [1.487], [0.84], [32.72], [32.87], [0.15],
    [NS3], [100], [1.0], [0.075], [3], [0.2], [0.150], [0.050], [0.150], [1.567], [1.575], [0.52], [32.11], [32.28], [0.17],
    [NS4], [100], [1.0], [0.075], [3], [0.2], [0.050], [0.150], [0.050], [1.400], [1.412], [0.84], [33.05], [33.35], [0.30],
    [NS5], [100], [1.0], [0.075], [3], [0.2], [0.050], [0.100], [0.150], [1.475], [1.487], [0.81], [32.61], [32.87], [0.26],
    [NS6], [500], [1.0], [0.015], [3], [0.2], [0.150], [0.150], [0.150], [0.434], [0.464], [7.13], [25.88], [26.42], [0.54],
    [NS7], [500], [1.0], [0.015], [3], [0.2], [0.150], [0.100], [0.050], [0.404], [0.435], [7.70], [26.09], [26.94], [0.85],
    [NS8], [500], [1.0], [0.015], [3], [0.2], [0.150], [0.050], [0.150], [0.421], [0.451], [7.03], [25.81], [26.65], [0.84],
    [NS9], [500], [1.0], [0.015], [3], [0.2], [0.050], [0.150], [0.050], [0.397], [0.425], [7.21], [25.97], [27.12], [1.15],
    [NS10], [500], [1.0], [0.015], [3], [0.2], [0.050], [0.100], [0.150], [0.407], [0.435], [6.88], [25.87], [26.91], [1.04],
    [NS11], [100], [5.0], [0.045], [3], [0.2], [0.150], [0.150], [0.150], [3.316], [3.366], [1.53], [26.27], [26.57], [0.30],
    [NS12], [100], [5.0], [0.045], [3], [0.2], [0.050], [0.150], [0.050], [2.553], [2.600], [1.83], [28.64], [28.92], [0.28],
    [NS13], [500], [5.0], [0.009], [3], [0.2], [0.150], [0.150], [0.150], [0.779], [0.799], [2.59], [24.20], [24.45], [0.25],
    [NS14], [500], [5.0], [0.009], [3], [0.2], [0.050], [0.150], [0.050], [0.684], [0.693], [1.36], [25.26], [25.95], [0.69],
    [NS15], [100], [0.2], [0.225], [3], [0.2], [0.150], [0.150], [0.150], [0.998], [1.044], [4.53], [34.60], [32.40], [-2.20],
    [NS16], [100], [0.2], [0.225], [3], [0.2], [0.150], [0.100], [0.050], [0.948], [0.988], [4.21], [34.20], [32.17], [-2.03],
    [NS17], [500], [0.2], [0.045], [3], [0.2], [0.150], [0.150], [0.150], [0.236], [0.260], [10.23], [27.16], [26.27], [-0.89],
    [NS18], [500], [0.2], [0.045], [3], [0.2], [0.150], [0.100], [0.050], [0.226], [0.253], [12.12], [26.52], [25.98], [-0.54],
  )]
  , caption: [Comparison of the VTLM and three-dimensional reference
  results for nonuniform streamwise segmented fin arrays.]
  , kind: table
  ) <tab:nonuniform_streamwise_fin_arrays>

]
=== Uniform two-directional fin arrays
<subsec:uniform_two_directional_fin_arrays>
Uniform two-directional fin arrays were examined using the configuration
shown in Fig.~@fig:uniform_fin_array_groups\(c). In these cases, both
$N_x$ and $N_y$ exceed unity, and the fluid region is divided into
multiple passages in the streamwise and transverse directions. The
uniform two-directional fin-array cases and corresponding results are
summarized in Table~@tab:uniform_two_directional_ar1 for
$upright(A R) = 1$ and in Table~@tab:uniform_two_directional_ar_effects
for $upright(A R) = 0.2$ and $5.0$.

For the $upright(A R) = 1$ cases, reducing $L^(+)$ from $0.075$ to
$0.015$ increases the maximum hydraulic error from $5.08 %$ to $6.86 %$,
whereas the maximum absolute bottom-temperature difference remains
nearly unchanged, increasing only from $1.27$ to
$1.28 med^compose upright(C)$. The hydraulic error depends on the
detailed in-plane arrangement rather than simply on the total fin
number. For example, although Case D12 contains more fins than Case D11,
its hydraulic error is only $- 0.34 %$, compared with $- 6.86 %$ for
Case D11.

This behavior is consistent with the subdivision of the fluid region
into narrower passages. As more of the hydraulic resistance is resolved
through the in-plane fin boundaries, the unresolved top- and bottom-wall
contribution represents a smaller fraction of the total pressure loss.
Therefore, increasing the array density does not necessarily increase
the error associated with the wall-friction closure.

The low- and high-aspect-ratio cases show the same general behavior.
Across all two-directional arrays, the maximum absolute hydraulic error
is $9.34 %$, while the maximum absolute bottom-temperature difference is
$1.28 med^compose upright(C)$. The dependence on $L^(+)$ and
$upright(A R)$ remains consistent with the preceding fin-array groups,
and no additional limitation attributable specifically to
two-directional subdivision is evident.

#figure(image("graphics/graph8.svg", width: 65.0%),
  caption: [
    Nonuniform fin-array configurations considered in the VTLM
    assessment: (a) transverse fin arrays and (b) streamwise segmented
    fin arrays. The streamwise fin lengths $L_(upright(f i n) \, i)$
    vary among fins.
  ]
)
<fig:nonuniform_fin_array_configurations>

=== Nonuniform fin arrays
<subsec:nonuniform_fin_arrays>
Fin arrays with unequal streamwise fin lengths were further examined to
assess the representative fin-length treatment used in the thermal
closure. The configurations considered here are shown in
Fig.~@fig:nonuniform_fin_array_configurations. In the transverse arrays,
the fins are centered within the heated section but have different
streamwise lengths. In the streamwise segmented arrays, the upstream and
downstream segments are aligned with the ends of the heated section,
while the middle segment is centered. The individual streamwise
fin-length ratios are denoted by
$lambda_(x \, i) = L_(upright(f i n) \, i) \/ L$, where $i$ identifies
each fin. The representative fin length defined in
Eq.~#link(<eq:equivalent_fin_length>)[\[eq:equivalent\_fin\_length\]]
was used to evaluate the fin-side thermal-development length for each
nonuniform array.

For the nonuniform transverse arrays, $N_y = 3$ and $lambda_y = 0.1$
were fixed, while $lambda_(x \, 1)$, $lambda_(x \, 2)$, and
$lambda_(x \, 3)$ were varied. The nonuniform transverse fin-array cases
and corresponding results are summarized in
Table~@tab:nonuniform_transverse_fin_arrays. Cases with equal values of
$lambda_(x \, 1)$, $lambda_(x \, 2)$, and $lambda_(x \, 3)$ provide
uniform-array references under each operating condition.

For the nonuniform transverse arrays, redistributing the three
streamwise fin lengths produces no systematic deterioration relative to
the corresponding uniform references. At $upright(A R) = 1$ and $5.0$,
the hydraulic errors and bottom-temperature differences remain
comparable to those of the uniform arrays. Larger discrepancies occur at
$upright(A R) = 0.2$, including a bottom-temperature difference of
$- 1.81 med^compose upright(C)$ in Case NT14 and a hydraulic error of
$6.44 %$ in Case NT16. However, the discrepancies do not increase
systematically as the differences among the fin lengths become larger.
These results support the use of the representative fin length for
transverse variations in streamwise fin length.

The nonuniform streamwise segmented fin-array cases and corresponding
results are summarized in Table~@tab:nonuniform_streamwise_fin_arrays.
These arrays show the same tendency. At $L^(+) = 0.075$, redistributing
the segment lengths has little effect, whereas at smaller $L^(+)$, the
hydraulic discrepancy increases for both the uniform and nonuniform
cases. The largest hydraulic error of $12.12 %$ occurs in
shallow-channel Case NS18, while the largest absolute bottom-temperature
difference of $2.20 med^compose upright(C)$ occurs in the uniform
reference Case NS15. Therefore, the reduced accuracy is associated
primarily with the aspect ratio and flow development rather than with
the unequal segment lengths. Overall, no additional limitation
attributable specifically to fin-length nonuniformity is identified
within the tested range.

=== Model applicability
<subsec:model_applicability>
The preceding numerical comparisons show that the hydraulic accuracy of
the VTLM is governed primarily by the dimensionless flow-development
length $L^(+)$. For the $upright(A R) = 1$ configurations, the hydraulic
discrepancies generally increase as $L^(+)$ approaches $0.015$, whereas
the detailed fin-array arrangement has a secondary influence. Fin-length
nonuniformity does not introduce an additional limitation, since its
error levels remain comparable to those of the corresponding uniform
arrays.

The aspect ratio modifies this behavior through the relative
contribution of wall friction. In shallow channels, the unresolved top-
and bottom-wall contributions represent a larger portion of the total
hydraulic resistance, making the prediction more sensitive to the
equivalent straight-channel treatment. By contrast, this contribution
becomes less dominant as the aspect ratio increases. Dense fin arrays
may also reduce the sensitivity by partitioning the fluid region into
narrower passages, for which the relative contribution of the unresolved
wall friction is smaller. Based on these observations, a conservative
lower-bound guideline for the straight-channel fin-array cases is
expressed as
$ L^(+) > 0.015 max (1 \, D_(upright(h \, r e f)) / D_(upright(h))) \, $<eq:model_applicability>
where $D_(upright(h))$ is the hydraulic diameter of the channel under
consideration and $D_(upright(h \, r e f))$ is the hydraulic diameter of
the $upright(A R) = 1$ reference channel. The hydraulic diameters in
Eq.~#link(<eq:model_applicability>)[\[eq:model\_applicability\]] are
evaluated from the original channel cross-section rather than from the
equivalent geometry used in the wall-friction closure. For the present
geometry,
Eq.~#link(<eq:model_applicability>)[\[eq:model\_applicability\]] gives
lower bounds of $L^(+) > 0.045$ at $upright(A R) = 0.2$ and
$L^(+) > 0.015$ at $upright(A R) = 1$.

Eq.~#link(<eq:model_applicability>)[\[eq:model\_applicability\]] should
be interpreted as a screening guideline for straight channels containing
the fin-array configurations examined in this study, rather than as a
strict validity boundary. Hydraulic errors may approach or slightly
exceed $10 %$ near the estimated lower limit, particularly in
low-aspect-ratio channels with sparse or strongly localized blockage.
The absolute bottom-temperature differences are generally less sensitive
to $L^(+)$, although larger deviations may occur when a shallow channel,
a near-limit flow-development condition, and a large localized
transverse blockage are combined. Accordingly, additional assessment may
be necessary for configurations near the lower bound or beyond the
geometric and operating ranges examined in this study.

== Fin arrays in an expansion--contraction channel
<subsec:expansion_contraction_channel>
To evaluate the VTLM beyond straight channels of uniform width, the
configuration shown in Fig.~@fig:expansion_contraction_domain was
considered. The domain comprises a central heated section of length
$0.5 L$, preceded and followed by inlet and outlet sections of length
$0.25 L$, respectively. The heated section has a width of $W$, whereas
the inlet and outlet have a common width $W_(upright(i o))$. Owing to
symmetry about the channel centerline, only half of the domain was
modeled. The expansion ratio is defined as
$upright(E R) = W \/ W_(upright(i o))$. The channel height remains
unchanged throughout the domain, so variations in $upright(E R)$ arise
solely from the lateral change in channel width.

#figure(image("graphics/graph9.svg", width: 75.0%),
  caption: [
    Geometry used to assess the VTLM in an expansion--contraction
    channel: (a) symmetry-reduced three-dimensional reference domain and
    (b) corresponding Layer~1 and Layer~2 domains.
  ]
)
<fig:expansion_contraction_domain>

#block[
#figure(
  align(center)[#table(
    columns: 10,
    align: (center,center,center,center,center,center,center,center,center,center,),
    table.header([Case], [$upright(R e)$], [$upright(E R)$], [$L^(+)$], [$f_(upright(D))^(upright(3 D))$], [$f_(upright(D))^(upright(V T L M))$], [$e_f$
      (%)], [$overline(T)_(upright(b t))^(upright(3 D))$
      ($""^compose upright(C)$)], [$overline(T)_(upright(b t))^(upright(V T L M))$
      ($""^compose upright(C)$)], [$Delta T_(upright(b t))$
      ($""^compose upright(C)$)],),
    table.hline(),
    [E1], [100], [2], [0.056], [0.503], [0.552], [9.65], [46.53], [42.91], [-3.62],
    [E2], [100], [3], [0.050], [0.500], [0.533], [6.57], [42.78], [39.44], [-3.34],
    [E3], [100], [4], [0.047], [0.501], [0.529], [5.44], [41.45], [37.96], [-3.49],
    [E4], [300], [2], [0.019], [0.228], [0.262], [15.17], [38.26], [35.99], [-2.27],
    [E5], [300], [3], [0.017], [0.226], [0.259], [14.68], [36.30], [35.55], [-0.75],
    [E6], [300], [4], [0.016], [0.227], [0.265], [16.96], [35.29], [32.94], [-2.35],
    [E7], [500], [2], [0.011], [0.164], [0.195], [18.58], [34.85], [33.71], [-1.14],
    [E8], [500], [3], [0.010], [0.162], [0.192], [17.99], [33.18], [33.67], [0.49],
    [E9], [500], [4], [0.009], [0.162], [0.189], [16.43], [32.35], [33.34], [0.99],
  )]
  , caption: [Comparison of the VTLM and three-dimensional reference
  results for expansion--contraction channels without fins.]
  , kind: table
  ) <tab:expansion_contraction_baseline>

]
#block[
#figure(
  align(center)[#table(
    columns: 12,
    align: (center,center,center,center,center,center,center,center,center,center,center,center,),
    table.header([Case], [$upright(R e)$], [$upright(E R)$], [$L^(+)$], [$lambda_x$], [$lambda_y$], [$f_(upright(D))^(upright(3 D))$], [$f_(upright(D))^(upright(V T L M))$], [$e_f$
      (%)], [$overline(T)_(upright(b t))^(upright(3 D))$
      ($""^compose upright(C)$)], [$overline(T)_(upright(b t))^(upright(V T L M))$
      ($""^compose upright(C)$)], [$Delta T_(upright(b t))$
      ($""^compose upright(C)$)],),
    table.hline(),
    [EF1], [100], [2], [0.056], [0.50], [0.05], [0.664], [0.681], [2.54], [33.04], [32.69], [-0.35],
    [EF2], [100], [2], [0.056], [0.50], [0.10], [0.734], [0.747], [1.80], [32.52], [31.94], [-0.58],
    [EF3], [100], [2], [0.056], [0.50], [0.20], [1.009], [1.001], [-0.72], [31.55], [31.46], [-0.09],
    [EF4], [100], [2], [0.056], [0.30], [0.05], [0.583], [0.608], [4.32], [35.32], [34.99], [-0.33],
    [EF5], [100], [2], [0.056], [0.10], [0.05], [0.550], [0.581], [5.50], [38.86], [37.85], [-1.01],
    [EF6], [500], [2], [0.011], [0.50], [0.05], [0.223], [0.241], [8.23], [26.26], [27.03], [0.77],
    [EF7], [500], [2], [0.011], [0.50], [0.10], [0.266], [0.280], [5.17], [25.45], [26.54], [1.09],
    [EF8], [500], [2], [0.011], [0.50], [0.20], [0.483], [0.475], [-1.78], [24.46], [25.38], [0.92],
    [EF9], [500], [2], [0.011], [0.30], [0.05], [0.191], [0.211], [10.31], [27.24], [28.33], [1.09],
    [EF10], [500], [2], [0.011], [0.10], [0.05], [0.182], [0.206], [12.90], [28.98], [29.93], [0.95],
  )]
  , caption: [Comparison of the VTLM and three-dimensional reference
  results for single-fin expansion--contraction channels at
  $upright(E R) = 2$.]
  , kind: table
  ) <tab:finned_expansion_contraction_single>

]
#block[
#figure(
  align(center)[#table(
    columns: 14,
    align: (center,center,center,center,center,center,center,center,center,center,center,center,center,center,),
    table.header([Case], [$upright(R e)$], [$upright(E R)$], [$L^(+)$], [$N_x$], [$N_y$], [$lambda_x$], [$lambda_y$], [$f_(upright(D))^(upright(3 D))$], [$f_(upright(D))^(upright(V T L M))$], [$e_f$
      (%)], [$overline(T)_(upright(b t))^(upright(3 D))$
      ($""^compose upright(C)$)], [$overline(T)_(upright(b t))^(upright(V T L M))$
      ($""^compose upright(C)$)], [$Delta T_(upright(b t))$
      ($""^compose upright(C)$)],),
    table.hline(),
    [ES1], [100], [2], [0.056], [2], [1], [0.18], [0.05], [0.601], [0.624], [3.67], [34.30], [33.98], [-0.32],
    [ES2], [100], [2], [0.056], [2], [1], [0.10], [0.05], [0.586], [0.607], [3.66], [35.38], [35.09], [-0.29],
    [ES3], [100], [2], [0.056], [2], [1], [0.02], [0.05], [0.565], [0.590], [4.41], [38.86], [38.25], [-0.61],
    [ES4], [100], [2], [0.056], [3], [1], [0.11], [0.05], [0.600], [0.622], [3.68], [34.44], [34.04], [-0.40],
    [ES5], [500], [2], [0.011], [2], [1], [0.18], [0.05], [0.196], [0.215], [9.37], [26.86], [27.74], [0.88],
    [ES6], [500], [2], [0.011], [2], [1], [0.10], [0.05], [0.193], [0.213], [10.64], [27.39], [28.30], [0.91],
    [ES7], [500], [2], [0.011], [2], [1], [0.06], [0.05], [0.191], [0.213], [11.34], [27.99], [28.89], [0.90],
    [ES8], [500], [2], [0.011], [3], [1], [0.11], [0.05], [0.196], [0.215], [9.41], [26.95], [27.78], [0.83],
    [ES9], [500], [2], [0.011], [3], [1], [0.05], [0.05], [0.194], [0.214], [10.16], [27.52], [28.50], [0.98],
    [ET1], [100], [2], [0.056], [2], [3], [0.18], [0.05], [0.907], [0.894], [-1.47], [26.58], [26.87], [0.29],
    [ET2], [100], [2], [0.056], [2], [3], [0.10], [0.05], [0.770], [0.771], [0.10], [28.03], [28.36], [0.33],
    [ET3], [100], [2], [0.056], [2], [3], [0.06], [0.05], [0.697], [0.707], [1.35], [29.58], [29.90], [0.32],
    [ET4], [100], [2], [0.056], [2], [3], [0.18], [0.25], [13.595], [12.965], [-4.63], [23.69], [23.94], [0.25],
    [ET5], [100], [2], [0.056], [2], [5], [0.18], [0.05], [1.643], [1.577], [-4.02], [24.19], [24.46], [0.27],
    [ET6], [100], [2], [0.056], [2], [5], [0.06], [0.05], [0.971], [0.959], [-1.19], [26.56], [26.99], [0.43],
    [ET7], [500], [2], [0.011], [2], [3], [0.18], [0.05], [0.270], [0.281], [3.97], [23.12], [23.74], [0.62],
    [ET8], [500], [2], [0.011], [2], [3], [0.10], [0.05], [0.245], [0.259], [5.74], [23.71], [24.45], [0.74],
    [ET9], [500], [2], [0.011], [2], [3], [0.06], [0.05], [0.230], [0.246], [6.94], [24.38], [25.25], [0.87],
    [ET10], [500], [2], [0.011], [2], [3], [0.18], [0.25], [3.371], [3.198], [-5.11], [21.49], [21.88], [0.39],
    [ET11], [500], [2], [0.011], [2], [5], [0.18], [0.05], [0.428], [0.428], [0.11], [22.01], [22.41], [0.40],
    [ET12], [500], [2], [0.011], [2], [5], [0.06], [0.05], [0.299], [0.307], [2.74], [23.10], [23.79], [0.69],
  )]
  , caption: [Comparison of the VTLM and three-dimensional reference
  results for streamwise segmented and two-directional fin arrays in the
  expansion--contraction channel at $upright(E R) = 2$.]
  , kind: table
  ) <tab:finned_expansion_contraction_arrays>

]
In the VTLM, the fluid region is represented in Layer~1, while the
heated base is modeled in Layer~2. The material properties and boundary
conditions were the same as those adopted in the straight-channel
fin-array cases, except for the applied bottom heat flux. Because the
heated-section width increases with $upright(E R)$, the bottom heat flux
was scaled as
$q''_(upright(b t)) = 50 \/ upright(E R) med upright(k W \/ m^2)$ to
maintain the same total heat input as in the straight-channel baseline
case. For the expansion--contraction cases, the hydraulic diameter used
to evaluate $L^(+)$ was calculated from the cross-section of the
expanded heated section.

The assessment was conducted in two stages. Channels without fins were
first examined at $upright(E R) = 2 upright("–") 4$ to determine the
influence of the abrupt lateral expansion and contraction independently
of internal structures. Finned channels were subsequently evaluated at
$upright(E R) = 2$, including single-fin, streamwise segmented, and
two-directional configurations. The two groups are discussed separately
in the following subsections.

=== Baseline channels without fins
<subsubsec:baseline_expansion_contraction>
The fin-free channels were first examined to quantify the prediction
differences caused by the abrupt expansion and contraction before
introducing internal fin structures. Because no solid fin region is
present in Layer~1, the fin-side closure is inactive, and only the
fluid-side interlayer heat-transfer coefficient is employed. The
corresponding VTLM and three-dimensional results are listed in
Table~@tab:expansion_contraction_baseline. The VTLM predicts a higher
friction factor than the three-dimensional model in all cases. At
$upright(R e) = 100$, the hydraulic error ranges from $5.44 %$ to
$9.65 %$. The error increases to $14.68 %$--$16.96 %$ at
$upright(R e) = 300$ and $16.43 %$--$18.58 %$ at $upright(R e) = 500$.
The increase with Reynolds number is accompanied by a reduction in
$L^(+)$, whereas the hydraulic error does not exhibit a consistent trend
with $upright(E R)$ across the three Reynolds numbers. This indicates
that the hydraulic discrepancy is more closely associated with the
flow-development condition than with the expansion ratio alone. The
remaining difference can be attributed to flow redistribution near the
width discontinuities, which are not explicitly included in the
equivalent straight-channel representation.

The thermal prediction shows a different trend. The magnitude of
$Delta T_(upright(b t))$ generally decreases with increasing Reynolds
number, whereas no systematic dependence on $upright(E R)$ is observed.
The largest absolute difference is $3.62 med^compose upright(C)$,
obtained at $upright(R e) = 100$ and $upright(E R) = 2$. At higher
Reynolds numbers, the discrepancy becomes smaller and may change sign as
$upright(E R)$ increases, reflecting the combined effects of flow
redistribution and thermal development in the expanded heated section.
These fin-free results provide the reference prediction differences for
the finned expansion--contraction cases examined in the following
subsection. Comparisons with the corresponding fin-free cases allow the
influence of the fin arrangement to be distinguished from that of the
expansion--contraction geometry.

=== Finned expansion--contraction channels
<subsubsec:finned_expansion_contraction>
Fins were subsequently introduced into the expanded heated section at
$upright(E R) = 2$. The investigated layouts comprise a single fin,
streamwise segmented arrays, and arrays subdivided in both the
streamwise and transverse directions. These configurations follow the
same types of in-plane fin arrangement introduced for the
straight-channel cases in Fig.~@fig:uniform_fin_array_groups, but are
placed within the expanded region shown in
Fig.~@fig:expansion_contraction_domain. For the ES and ET cases, the
fins were distributed over a centered streamwise region of length
$0.4 L$ within the $0.5 L$ heated section, leaving a fin-free length of
$0.05 L$ at each end. The single-fin results are summarized in
Table~@tab:finned_expansion_contraction_single, while the streamwise
segmented and two-directional results are listed in
Table~@tab:finned_expansion_contraction_arrays. For all three
configuration groups, $upright(R e) = 100$ and $500$ correspond to
$L^(+) = 0.056$ and $0.011$, respectively. The smaller $L^(+)$ at
$upright(R e) = 500$ is consistent with the generally larger errors
observed at this Reynolds number and motivates comparison with the
straight-channel screening guideline in
Eq.~#link(<eq:model_applicability>)[\[eq:model\_applicability\]].

For the single-fin cases, the hydraulic discrepancy depends clearly on
the fraction of the expanded region occupied by the fin. At fixed
$lambda_x = 0.5$, increasing $lambda_y$ from $0.05$ to $0.2$ changes
$e_f$ from $2.54 %$ to $- 0.72 %$ at $upright(R e) = 100$ and from
$8.23 %$ to $- 1.78 %$ at $upright(R e) = 500$. Conversely, reducing
$lambda_x$ at fixed $lambda_y = 0.05$ increases the hydraulic
overprediction, with the error reaching $12.90 %$ at
$upright(R e) = 500$. The generally larger hydraulic errors at
$upright(R e) = 500$ also indicate an influence of the flow-development
condition. This behavior is consistent with the fin-induced wall
resistance accounting for a smaller fraction of the total pressure loss
as the fin becomes shorter, thereby increasing the relative influence of
the expansion and contraction losses that are not explicitly included in
the closure model. No consistent dependence of the bottom-temperature
difference on $lambda_x$ or $lambda_y$ is observed. At
$upright(R e) = 100$, $Delta T_(upright(b t))$ ranges from $- 1.01$ to
$- 0.09 med^compose upright(C)$, whereas at $upright(R e) = 500$, it
ranges from $0.77$ to $1.09 med^compose upright(C)$. The maximum
absolute bottom-temperature difference among the single-fin cases is
$1.09 med^compose upright(C)$.

For the streamwise segmented arrays, the increase in hydraulic
discrepancy between the two Reynolds numbers is more pronounced than the
variation caused by the segment geometry. The hydraulic error increases
from $3.66 % upright("–") 4.41 %$ at $upright(R e) = 100$ to
$9.37 % upright("–") 11.34 %$ at $upright(R e) = 500$. By contrast, the
absolute bottom-temperature differences remain within
$0.61 med^compose upright(C)$ at $upright(R e) = 100$ and
$0.98 med^compose upright(C)$ at $upright(R e) = 500$. Cases with
$N_x = 2$ and $3$ give similar results at comparable streamwise size
ratios, indicating that additional segmentation does not introduce a
distinct deterioration beyond that associated with the smaller $L^(+)$.

The two-directional arrays exhibit a stronger dependence of the
hydraulic prediction on the detailed transverse arrangement. At
$upright(R e) = 100$, the maximum absolute hydraulic error is $4.63 %$,
while the absolute bottom-temperature differences remain within
$0.43 med^compose upright(C)$. At $upright(R e) = 500$, the maximum
absolute hydraulic error increases to $6.94 %$, whereas the maximum
absolute bottom-temperature difference is $0.87 med^compose upright(C)$.
For $N_y = 3$ and $lambda_y = 0.05$, increasing $lambda_x$ from $0.06$
to $0.18$ changes $e_f$ from $1.35 %$ to $- 1.47 %$ at
$upright(R e) = 100$ and from $6.94 %$ to $3.97 %$ at
$upright(R e) = 500$. At fixed $N_y = 3$ and $lambda_x = 0.18$,
increasing $lambda_y$ from $0.05$ to $0.25$ shifts the hydraulic
prediction toward underprediction at both Reynolds numbers, whereas the
bottom-temperature differences remain comparatively small.

Across the finned expansion--contraction cases, the maximum absolute
hydraulic error is $12.90 %$, while the maximum absolute
bottom-temperature difference is $1.09 med^compose upright(C)$. The
hydraulic error levels follow the distinction implied by the
straight-channel screening guideline. At $L^(+) = 0.056$, which
satisfies
Eq.~#link(<eq:model_applicability>)[\[eq:model\_applicability\]], the
maximum absolute hydraulic error is $5.50 %$, whereas at
$L^(+) = 0.011$, below the lower bound, it increases to $12.90 %$. In
contrast, the maximum absolute bottom-temperature differences are
$1.01 med^compose upright(C)$ and $1.09 med^compose upright(C)$ at
$L^(+) = 0.056$ and $0.011$, respectively, indicating substantially
weaker sensitivity of the thermal prediction to the flow-development
condition within the finned expansion--contraction cases. The hydraulic
errors remain below those of the corresponding fin-free channels at both
Reynolds numbers, indicating that the internal fins do not amplify the
discrepancy associated with the abrupt width changes. As the fin
obstruction increases, fin-induced friction accounts for a larger
fraction of the total pressure loss, reducing the relative contribution
of the unresolved expansion and contraction losses. These results
suggest that the straight-channel screening guideline remains
informative primarily for the hydraulic prediction of the finned channel
at $upright(E R) = 2$, although they do not establish its general
applicability to arbitrary nonuniform-width passages.

== Overall thermal-resistance assessment
<subsec:thermal_resistance_assessment>
To provide an overall assessment of the thermal prediction, the thermal
resistance was evaluated for all assessment cases as
$ R_(upright(t h)) = frac(overline(T)_(upright(b t)) - T_(upright(i n)), Q_(upright(i n))) \, $<eq:thermal_resistance>
where $Q_(upright(i n))$ is the total heat input applied to the heated
bottom surface. The relative difference in thermal resistance between
the VTLM and the three-dimensional reference model was then defined as
$ e_R = frac(R_(upright(t h))^(upright(V T L M)) - R_(upright(t h))^(upright(3 D)), R_(upright(t h))^(upright(3 D))) times 100 % . $<eq:thermal_resistance_error>

The baseline straight-channel cases used to calibrate the
representative-height closure were excluded from this assessment.
Because the VTLM and three-dimensional reference model are subjected to
the same heat input for each case,
Eq.~#link(<eq:thermal_resistance_error>)[\[eq:thermal\_resistance\_error\]]
can also be written as
$ e_R = frac(Delta T_(upright(b t)), overline(T)_(upright(b t))^(upright(3 D)) - T_(upright(i n))) times 100 % . $<eq:thermal_resistance_error_temperature>

This relation shows that the thermal-resistance relative difference
depends not only on the absolute bottom-temperature difference but also
on the reference temperature rise. Fig.~@fig:thermal_resistance_summary
summarizes the thermal-resistance relative differences for all
assessment cases. Fig.~@fig:thermal_resistance_summary\(a) presents the
straight-channel configurations, including the uniform and nonuniform
fin-array groups, whereas Fig.~@fig:thermal_resistance_summary\(b)
presents the fin-free and finned expansion--contraction configurations.
For the straight-channel configurations, cases satisfying the screening
guideline in
Eq.~#link(<eq:model_applicability>)[\[eq:model\_applicability\]]
generally exhibit a more concentrated distribution of $e_R$, whereas
cases near or below the lower bound show a wider spread. The same
tendency is particularly evident for the finned expansion--contraction
configurations. Among the EF, ES, and ET cases, the maximum magnitude of
$e_R$ increases from approximately $6.8 %$ to $26.2 %$ as $L^(+)$
decreases from $0.056$ to $0.011$, with the latter falling below the
straight-channel lower bound. This behavior indicates that the
flow-development condition identified from the preceding hydraulic
assessment also provides a useful first-stage indication of
thermal-resistance accuracy for the examined finned configurations.

#figure(image("graphics/graph13.svg", width: 90.0%),
  caption: [
    Thermal-resistance relative differences for the assessment cases:
    (a) straight-channel configurations and (b) expansion--contraction
    configurations. Each marker represents one case. Markers within each
    case family are slightly offset in the horizontal direction to avoid
    overlap, and the horizontal offset has no physical meaning.
  ]
)
<fig:thermal_resistance_summary>

The thermal-resistance relative difference does not depend on $L^(+)$
alone. As indicated by
Eq.~#link(<eq:thermal_resistance_error_temperature>)[\[eq:thermal\_resistance\_error\_temperature\]],
the magnitude of $e_R$ can also become large when the reference
temperature rise is small. In such cases, even a small
$Delta T_(upright(b t))$ can correspond to a comparatively large
thermal-resistance relative difference. For example, Case ET10 has
$Delta T_(upright(b t)) = 0.39 med^compose upright(C)$ and a reference
temperature rise of only $1.49 med^compose upright(C)$, resulting in
$e_R approx 26 %$. By contrast, Case UT18 exhibits a much larger
$Delta T_(upright(b t)) = 4.21 med^compose upright(C)$, while the
thermal-resistance relative difference is also pronounced. In this case,
the large thermal-resistance relative difference is mainly associated
with the relatively large $Delta T_(upright(b t))$, rather than with a
small reference temperature rise.

Accordingly,
Eq.~#link(<eq:model_applicability>)[\[eq:model\_applicability\]] remains
useful as a conservative first-stage screening guideline for the overall
VTLM prediction accuracy. Its strongest relevance is to the hydraulic
prediction, while the thermal-resistance results indicate that it also
provides a useful indication of thermal accuracy for the examined finned
configurations. It should not be interpreted as a strict
thermal-resistance validity boundary.

= Conclusion
<Conclusion>
A versatile two-layer model (VTLM) was developed for thermohydraulic
prediction of microchannel heat sinks under steady laminar flow. The
model represents the three-dimensional conjugate heat-transfer problem
using two coupled planar fields while retaining the in-plane geometry of
the fluid passages and fins. Effects associated with the unresolved
channel-height direction are incorporated through closures for wall
friction, fluid-side heat transfer, and fin-side effective heat
transfer. These closures are evaluated from the representative channel
geometry, flow-development condition, and fin configuration, enabling
the model to accommodate the range of channel geometries and fin
arrangements examined in this study.

The three-dimensional reference model was first compared with benchmark
solutions for developing laminar flow. The representative-height closure
was then calibrated using baseline straight-channel conjugate
heat-transfer cases spanning a broad range of channel aspect ratios. The
VTLM was also compared with the existing two-layer models of Yan et
al.~\[32\] and Zeng and Lee~\[31\]. Across these baseline cases, the
VTLM showed improved overall agreement with the three-dimensional
reference results, highlighting the benefit of explicitly accounting for
unresolved wall friction and adapting the hydraulic and thermal closures
to the channel geometry and development conditions. With the closure
parameters subsequently fixed, the VTLM was independently assessed using
uniform transverse, streamwise segmented, two-directional, and
nonuniform fin arrays. These comparisons showed that the formulation can
accommodate variations in channel geometry, fin arrangement, and
operating conditions without case-by-case adjustment of the closure
parameters. The results further indicated that the VTLM accuracy is
governed primarily by the flow-development condition and channel aspect
ratio, while no distinct additional limitations associated with
streamwise segmentation or fin-length nonuniformity were identified.
Based on the combined straight-channel fin-array results,
$L^(+) > 0.015 thin max \( 1 \, D_(upright(h \, r e f)) \/ D_(upright(h)) \)$
was proposed as a conservative screening guideline for the
configurations examined in this study. The thermal-resistance assessment
further showed that $e_R$ depends on both the flow-development condition
and the reference temperature rise, so the proposed guideline should not
be interpreted as a strict thermal-resistance validity boundary.

The assessment was extended to expansion--contraction channels to
examine the applicability of the VTLM to passages with abrupt width
changes. Fin-free cases were first considered to isolate the effects of
flow redistribution and local pressure losses associated with the
expansion and contraction. Fins were then introduced into the expanded
heated section. The comparisons showed that the wall-friction closure
based on the equivalent straight-channel representation does not fully
capture the local hydraulic effects caused by the width discontinuities.
Nevertheless, the hydraulic discrepancies of the finned cases remained
below those of the corresponding fin-free channels. This behavior is
consistent with an increased contribution of the fin-induced friction
captured by the VTLM to the total pressure loss. These results support
the applicability of the model to the examined finned
expansion--contraction configurations at $upright(E R) = 2$ and suggest
that the straight-channel screening guideline remains informative for
these cases. Overall, the results support the VTLM as a
reduced-dimensional framework for thermohydraulic analysis of the
microchannel heat-sink configurations examined in this study.

Future work will extend the VTLM to more complex channel layouts,
including U-shaped channels and passages with multiple bends~\[20\], and
further refine the thermal-side closure to improve thermal-resistance
prediction accuracy over wider operating and geometric ranges. The
extended model can then be integrated into a topology optimization
framework for efficient microchannel heat-sink design.

#heading(level: 1, numbering: none)[CRediT authorship contribution
statement]
<credit-authorship-contribution-statement>
#strong[Chih-Hsiang Chen:] Writing -- original draft, Conceptualization,
Methodology, Validation, Formal analysis, Investigation, Data curation,
Visualization. #strong[Kentaro Yaji:] Writing-- review & editing,
Conceptualization, Methodology, Software, Supervision, Resources,
Project administration, Funding acquisition.

#heading(level: 1, numbering: none)[Acknowledgement]
<acknowledgement>
This work was supported by JSPS KAKENHI (Grant No. 23K26018).

= Derivation of the fin-side effective heat transfer coefficient
<app:fin_side_htc_derivation>
The fin-side effective heat-transfer coefficient is derived by
representing the collection of fins as an equivalent one-dimensional fin
of uniform cross section. Let $z$ denote the coordinate measured from
the fin base, with $z = 0$ at the fin-base junction represented by
Layer~2 and $z = H$ at the fin tip. Under the uniform-extrusion
assumption, the total cross-sectional area normal to the $z$-direction
and the total wetted perimeter are $A_(upright(f i n))^(upright(t o t))$
and $P_(upright(f i n))^(upright(t o t))$, respectively. The fluid-side
heat-transfer coefficient $h_(upright(f \, f i n))$ and the
representative Layer~1 fluid temperature $T_(1 \, upright(f))$ are
assumed to be uniform along the fin height.

For a differential fin element, the balance between axial conduction and
lateral heat transfer gives
$ frac(d, d z) (k_(upright(s)) A_(upright(f i n))^(upright(t o t)) frac(d T_(upright(f i n)), d z)) - h_(upright(f \, f i n)) P_(upright(f i n))^(upright(t o t)) (T_(upright(f i n)) - T_(1 \, upright(f))) = 0 . $<eq:app_fin_energy_balance>

Because $k_(upright(s))$ and $A_(upright(f i n))^(upright(t o t))$ are
constant, the excess temperature is introduced as
$theta.alt \( z \) = T_(upright(f i n)) \( z \) - T_(1 \, upright(f))$.
Eq.~#link(<eq:app_fin_energy_balance>)[\[eq:app\_fin\_energy\_balance\]]
then reduces to
$ frac(d^2 theta.alt, d z^2) - m^2 theta.alt = 0 \, #h(2em) m = sqrt(frac(h_(upright(f \, f i n)) P_(upright(f i n))^(upright(t o t)), k_(upright(s)) A_(upright(f i n))^(upright(t o t)))) . $<eq:app_fin_governing_equation>

The fin-base temperature is given by the Layer~2 temperature,
$T_(upright(f i n)) \( 0 \) = T_2$, and the fin tip is treated as
adiabatic. The corresponding boundary conditions are given as follows:
$ theta.alt \( 0 \) = theta.alt_(upright(b)) = T_2 - T_(1 \, upright(f)) \, #h(2em) frac(d theta.alt, d z)\|_(z = H) = 0 . $<eq:app_fin_boundary_conditions>

Solving
Eq.~#link(<eq:app_fin_governing_equation>)[\[eq:app\_fin\_governing\_equation\]]
subject to
Eq.~#link(<eq:app_fin_boundary_conditions>)[\[eq:app\_fin\_boundary\_conditions\]]
gives
$ theta.alt \( z \) = theta.alt_(upright(b)) frac(cosh [m \( H - z \)], cosh \( m H \)) . $<eq:app_fin_temperature_solution>

The axial conductive heat flow crossing the fin section at position $z$
is obtained from Fourier's law:
$ Q_(upright(a x)) \( z \) = - k_(upright(s)) A_(upright(f i n))^(upright(t o t)) frac(d T_(upright(f i n)), d z) = k_(upright(s)) A_(upright(f i n))^(upright(t o t)) m theta.alt_(upright(b)) frac(sinh [m \( H - z \)], cosh \( m H \)) . $<eq:app_fin_axial_heat_flow>

At the representative Layer~1 height $z = t_1$, the dimensionless
parameters are defined as
$ Lambda = m H = H sqrt(frac(h_(upright(f \, f i n)) P_(upright(f i n))^(upright(t o t)), k_(upright(s)) A_(upright(f i n))^(upright(t o t)))) \, #h(2em) zeta_1 = m \( H - t_1 \) = Lambda (1 - t_1 / H) . $<eq:app_fin_dimensionless_parameters>

The remaining axial heat flow at the representative height is denoted by
$Q_(upright(t o p)) = Q_(upright(a x)) \( t_1 \)$.
Eq.~#link(<eq:app_fin_axial_heat_flow>)[\[eq:app\_fin\_axial\_heat\_flow\]]
therefore gives
$ Q_(upright(t o p)) = frac(k_(upright(s)) A_(upright(f i n))^(upright(t o t)), H) Lambda theta.alt_(upright(b)) frac(sinh zeta_1, cosh Lambda) . $<eq:app_fin_heat_flow_t1>

The temperature difference used to define the fin-side effective
heat-transfer coefficient is obtained from
Eq.~#link(<eq:app_fin_temperature_solution>)[\[eq:app\_fin\_temperature\_solution\]]:
$ T_2 - T_(upright(f i n)) \( t_1 \) & = (T_2 - T_(1 \, upright(f))) - [T_(upright(f i n)) \( t_1 \) - T_(1 \, upright(f))]\
 & = theta.alt_(upright(b)) (1 - frac(cosh zeta_1, cosh Lambda))\
 & = theta.alt_(upright(b)) frac(cosh Lambda - cosh zeta_1, cosh Lambda) . $<eq:app_fin_temperature_difference>

Using the definition introduced in
Eq.~#link(<eq:hs_definition>)[\[eq:hs\_definition\]],
$ h_(upright(s)) = frac(Q_(upright(t o p)), A_(upright(f i n))^(upright(t o t)) [T_2 - T_(upright(f i n)) \( t_1 \)]) \, $<eq:app_hs_definition>
and substituting
Eqs.~#link(<eq:app_fin_heat_flow_t1>)[\[eq:app\_fin\_heat\_flow\_t1\]]
and
#link(<eq:app_fin_temperature_difference>)[\[eq:app\_fin\_temperature\_difference\]]
yields
$ h_(upright(s)) = k_(upright(s)) / H frac(Lambda sinh zeta_1, cosh Lambda - cosh zeta_1) . $<eq:app_hs_final>

This expression corresponds to
Eq.~#link(<eq:hs_closed_form>)[\[eq:hs\_closed\_form\]], with $Lambda$
and $zeta_1$ defined by
Eq.~#link(<eq:fin_side_parameters>)[\[eq:fin\_side\_parameters\]].

#heading(level: 1, numbering: none)[References]
<references>
+ J.~Zhou, X.~Cao, N.~Zhang, Y.~Yuan, X.~Zhao, D.~Hardy, Micro-channel
  heat sink: a review, Journal of Thermal Science 29~(6) (2020)
  1431--1462.

+ J.~Gao, Z.~Hu, Q.~Yang, X.~Liang, H.~Wu, Fluid flow and heat transfer
  in microchannel heat sinks: Modelling review and recent progress,
  Thermal Science and Engineering Progress 29 (2022) 101203.

+ Z.-Q. Yu, M.-T. Li, B.-Y. Cao, A comprehensive review on microchannel
  heat sinks for electronics cooling, International Journal of Extreme
  Manufacturing 6~(2) (2024) 022005.

+ A.~G. Fedorov, R.~Viskanta, Three-dimensional conjugate heat transfer
  in the microchannel heat sink for electronic packaging, International
  Journal of Heat and Mass Transfer 43~(3) (2000) 399--415.

+ W.~Qu, I.~Mudawar, Analysis of three-dimensional heat transfer in
  micro-channel heat sinks, International Journal of heat and mass
  transfer 45~(19) (2002) 3973--3985.

+ K.~Bala~Subrahmanyam, P.~Das, V.~Ranjith~Kumar, An overview of
  conjugate heat transfer augmentation methods for thermal management
  and recent advancements in microchannel heat sink overall performance,
  Proceedings of the Institution of Mechanical Engineers, Part E:
  Journal of Process Mechanical Engineering 240~(2) (2026) 2292--2305.

+ J.~Xu, Y.~Song, W.~Zhang, H.~Zhang, Y.~Gan, Numerical simulations of
  interrupted and conventional microchannel heat sinks, International
  Journal of Heat and Mass Transfer 51~(25-26) (2008) 5906--5917.

+ N.~H. Naqiuddin, L.~H. Saw, M.~C. Yew, F.~Yusof, H.~M. Poon, Z.~Cai,
  H.~San~Thiam, Numerical investigation for optimizing segmented
  micro-channel heat sink by taguchi-grey method, Applied energy 222
  (2018) 437--450.

+ Y.~Ma, R.~Mohebbi, Z.~Yang, M.~A. Sheremet, Numerical analysis of heat
  sink configurations and their impact on conjugate heat transfer in
  manifold systems, International Journal of Thermal Sciences 218 (2025)
  \110145.

+ K.~Kulkarni, A.~Afzal, K.-Y. Kim, Multi-objective optimization of a
  double-layered microchannel heat sink with temperature-dependent fluid
  properties, Applied Thermal Engineering 99 (2016) 262--272.

+ Y.~Alperen, C.~Sertac, Multi objective optimization of a micro-channel
  heat sink through genetic algorithm, International Journal of Heat and
  Mass Transfer 146 (2020) 118847.

+ O.~Mohammadbeigi, S.~Hassani, S.~Mazloumi, Numerical investigation and
  hybrid optimization of pin-fin microchannel heat sinks using
  taguchi-anova and ahp-topsis methods, International Communications in
  Heat and Mass Transfer 172 (2026) 110284.

+ S.~Zeng, B.~Kanargi, P.~S. Lee, Experimental and numerical
  investigation of a mini channel forced air heat sink designed by
  topology optimization, International Journal of Heat and Mass Transfer
  121 (2018) 663--679.

+ A.~Zou, R.~Chuan, F.~Qian, W.~Zhang, Q.~Wang, C.~Zhao, Topology
  optimization for a water-cooled heat sink in micro-electronics based
  on pareto frontier, Applied Thermal Engineering 207 (2022) 118128.

+ L.~Xie, Y.~Zhang, M.~Ge, Y.~Zhao, Topology optimization of heat sink
  based on variable density method, Energy Reports 8 (2022) 718--726.

+ C.~Zhao, T.~Lu, Analysis of microchannel heat sinks for electronics
  cooling, International Journal of Heat and Mass Transfer 45~(24)
  (2002) 4857--4869.

+ D.-K. Kim, S.~J. Kim, Averaging approach for microchannel heat sinks
  subject to the uniform wall temperature condition, International
  Journal of Heat and Mass Transfer 49~(3-4) (2006) 695--706.

+ G.~V. Kewalramani, A.~Agrawal, S.~K. Saha, Modeling of microchannel
  heat sinks for electronic cooling applications using volume averaging
  approach, International Journal of Heat and Mass Transfer 115 (2017)
  395--409.

+ G.~M. Harpole, J.~E. Eninger, et~al., Micro-channel heat exchanger
  optimization, in: Proceeding of the 7th IEEE SEMI-THERM Symposium,
  IEEE, 1991, pp. 59--63.

+ R.~Mandel, A.~Shooshtari, M.~Ohadi, A "2.5-d" modeling approach for
  single-phase flow and heat transfer in manifold microchannels,
  International Journal of Heat and Mass Transfer 126 (2018) 317--330.

+ H.~Kamal, A.~Dewan, Analysis of interrupted rectangular microchannel
  heat sink with high aspect ratio, Journal of Applied Fluid Mechanics
  10 (2017) 117--126.

+ M.~P. Bendsøe, O.~Sigmund, et~al., Topology optimization: theory,
  methods, and applications, Vol.~2, Springer Berlin, 2004.

+ T.~Borrvall, J.~Petersson, Topology optimization of fluids in stokes
  flow, International journal for numerical methods in fluids 41~(1)
  (2003) 77--107.

+ L.~H. Olesen, F.~Okkels, H.~Bruus, A high-level programming-language
  implementation of topology optimization applied to steady-state
  navier--stokes flow, International Journal for Numerical Methods in
  Engineering 65~(7) (2006) 975--1001.

+ Y.~Deng, Z.~Liu, P.~Zhang, Y.~Liu, Y.~Wu, Topology optimization of
  unsteady incompressible navier--stokes flows, Journal of Computational
  Physics 230~(17) (2011) 6688--6708.

+ C.~B. Dilgen, S.~B. Dilgen, D.~R. Fuhrman, O.~Sigmund, B.~S. Lazarov,
  Topology optimization of turbulent flows, Computer Methods in Applied
  Mechanics and Engineering 331 (2018) 363--393.

+ E.~M. Dede, Multiphysics topology optimization of heat transfer and
  fluid flow systems, in: proceedings of the COMSOL Users Conference,
  Vol. 715, 2009.

+ K.~Yaji, T.~Yamada, S.~Kubo, K.~Izui, S.~Nishiwaki, A topology
  optimization method for a coupled thermal--fluid problem using level
  set boundary expressions, International Journal of Heat and Mass
  Transfer 81 (2015) 878--888.

+ C.-H. Chen, K.~Yaji, Topology optimization for microchannel heat sinks
  with nanofluids using an eulerian-eulerian approach, International
  Journal of Heat and Mass Transfer 243 (2025) 126870.

+ J.~H. Haertel, K.~Engelbrecht, B.~S. Lazarov, O.~Sigmund, Topology
  optimization of a pseudo 3d thermofluid heat sink model, International
  Journal of Heat and Mass Transfer 121 (2018) 1073--1088.

+ S.~Zeng, P.~S. Lee, Topology optimization of liquid-cooled
  microchannel heat sinks: An experimental and numerical study,
  International Journal of Heat and Mass Transfer 142 (2019) 118401.

+ S.~Yan, F.~Wang, J.~Hong, O.~Sigmund, Topology optimization of
  microchannel heat sinks using a two-layer model, International Journal
  of Heat and Mass Transfer 143 (2019) 118462.

+ J.~Zhao, M.~Zhang, Y.~Zhu, R.~Cheng, L.~Wang, Topology optimization of
  planar cooling channels using a three-layer thermofluid model in fully
  developed laminar flow problems, Structural and Multidisciplinary
  Optimization 63~(6) (2021) 2789--2809.

+ J.~Zhao, M.~Zhang, Y.~Zhu, R.~Cheng, L.~Wang, Topology optimization of
  turbulent forced convective heat sinks using a multi-layer thermofluid
  model, Structural and Multidisciplinary Optimization 64~(6) (2021)
  3835--3859.

+ K.~Jia, B.~Zhang, Y.~Xu, F.~Zhao, J.~Zhu, L.~Gao, Z.~Zhang, X.~Lu,
  C.~Ma, X.~Long, Multilayer topology optimization of microfluidic heat
  sinks using non-newtonian fluid for electronics cooling, Applied
  Mathematical Modelling (2026) 116809.

+ S.-M. Kim, I.~Mudawar, Analytical heat diffusion models for different
  micro-channel heat sink cross-sectional geometries, International
  Journal of Heat and Mass Transfer 53~(19-20) (2010) 4002--4016.

+ Y.~S. Muzychka, M.~M. Yovanovich, Laminar flow friction and heat
  transfer in non-circular ducts and channels: Part i---hydrodynamic
  problem, in: Compact Heat Exchangers: A Festschrift on the 60th
  Birthday of Ramesh K. Shah, 2002, pp. 123--130.

+ S.~Churchill, R.~Usagi, A general expression for the correlation of
  rates of transfer and other phenomena, AIChE Journal 18~(6) (1972)
  1121--1128.

+ R.~K. Shah, A.~L. London, Laminar flow forced convection in ducts: a
  source book for compact heat exchanger analytical data, Academic
  press, 2014.

+ P.-S. Lee, S.~V. Garimella, D.~Liu, Investigation of heat transfer in
  rectangular microchannels, International journal of heat and mass
  transfer 48~(9) (2005) 1688--1704.

+ F.~Delplace, Laminar flow of newtonian liquids in ducts of rectangular
  cross-section a model for both physics and mathematics, Open Access J.
  Math. Theor. Phys. 1~(5) (2018) 198--201.

+ Y.~S. Muzychka, M.~M. Yovanovich, Laminar flow friction and heat
  transfer in non-circular ducts and channels: Part ii---thermal
  problem, in: Compact Heat Exchangers: A Festschrift on the 60th
  Birthday of Ramesh K. Shah, 2002, pp. 131--139.
