#import "bristle-forces.typ": bristle-forces

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

  show figure.caption: set text(size: 9pt)
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
#let model-box(title, body) = block(
  width: 100%,
  breakable: false,
  stroke: .6pt + black,
  radius: 2pt,
)[
  #block(width: 100%, fill: black, inset: (x: 7pt, y: 4pt))[
    #text(fill: white, weight: "bold", title)
  ]
  #block(width: 100%, inset: (x: 4pt, y: 3pt), body)
]

#show: doc => conf(
  paper: "a4",
  fontsize: 10pt,
  linestretch: .84,
  font: "Libertinus Serif",
  margin: 1in,
  sectionnumbering: "1.1",
  title: [Two-dimensional FrBD friction models for rolling contact],
  authors: (
    ( name: [Luigi Romano#footnote[Corresponding author. Email:
luigi.romano\@liu.se.]],
      affiliation: [Division of Vehicular Systems, Department of Electrical Engineering, Linköping University, SE-581 83 Linköping, Sweden \ Control Systems Technology Group, Department of Mechanical Engineering, Eindhoven University of Technology, Groene Loper 1, 5612 AZ Eindhoven, the Netherlands],
      email: "" ),
    ),
  abstract-title: [Abstract],
  abstract: [This paper develops a comprehensive two-dimensional
generalisation of the recently introduced Friction with Bristle Dynamics
(FrBD) framework for rolling contact problems. The proposed formulation
extends the one-dimensional FrBD model to accommodate simultaneous
longitudinal and lateral slips, spin, and arbitrary transport kinematics
over a finite contact region. The derivation combines a rheological
representation of the bristle element with an analytical local
sliding-friction law. By relying on an application of the Implicit
Function Theorem, the notion of sliding velocity is then eliminated, and
a fully dynamic friction model, driven solely by the rigid relative
velocity, is obtained. Building upon this local model, three distributed
formulations of increasing complexity are introduced, covering standard
linear rolling contact, as well as linear and semilinear rolling in the
presence of large spin slips. For the linear formulations,
well-posedness, stability, and passivity properties are investigated
under standard assumptions. In particular, the analysis reveals that the
model preserves passivity under almost any parametrisation of practical
interest. Numerical simulations illustrate steady-state action surfaces,
transient relaxation phenomena, and the effect of time-varying normal
loads. The results provide a unified and mathematically tractable
friction model applicable to a broad class of rolling contact systems.

],
  pagenumbering: "1",
  cols: 1,
  doc,
)


#heading(level: 1, numbering: none)[Keywords]
<keywords>
Rolling contact; friction; friction modelling; contact mechanics;
distributed parameter systems; semilinear systems

= Introduction
<intro>
Rolling and sliding contact phenomena are central to a wide range of
engineering systems \[#link(<bib-KinematicsMio>)[1], #link(<bib-Flores>)[2], #link(<bib-Flores2>)[3]\], including wheel-rail
interaction \[#link(<bib-Knothe>)[4], #link(<bib-KalkerBook>)[5], #link(<bib-2000RCP>)[6]\], tyre-road dynamics
\[#link(<bib-Pacejka2>)[7], #link(<bib-Guiggiani>)[8], #link(<bib-LibroMio>)[9], #link(<bib-Gauterin>)[10], #link(<bib-Gauterin2>)[11]\], spherical robots
\[#link(<bib-Sphere1>)[12], #link(<bib-Sphere2>)[13], #link(<bib-Sphere3>)[14], #link(<bib-Sphere4>)[15], #link(<bib-SphereNoSlip1>)[16], #link(<bib-SphereNoSlip2>)[17], #link(<bib-SphereNoSlip3>)[18]\],
and general mechanical and tribological components such as continuous
transmissions \[#link(<bib-CarboneTrans>)[19], #link(<bib-TransModel>)[20], #link(<bib-Belt1>)[21], #link(<bib-Frendo1>)[22], #link(<bib-Frendo2>)[23], #link(<bib-Frendo3>)[24]\] and
bearing elements \[#link(<bib-bearing1>)[25], #link(<bib-bearing2>)[26], #link(<bib-bearing3>)[27], #link(<bib-bearing4>)[28], #link(<bib-bearing5>)[29]\].

Historically, the first analytical theory of rolling contact was
developed by Kalker, who combined kinematic relationships with a local
Coulomb-Amontons friction model. Focusing on similar elastic cylinders
undergoing longitudinal slip#footnote[Or #emph[creepage], as better
known within the railway community.] under dry friction conditions,
Kalker was able to analyse both steady-state and transient phenomena
\[#link(<bib-Kalker51>)[30], #link(<bib-Kalker5>)[31]\] within the theoretical framework offered by his full
nonlocal theory of elasticity \[#link(<bib-KalkerPhD>)[32]\]. The solutions obtained in
these seminal works are now regarded as classical results in contact
mechanics and are reported in several authoritative references
\[#link(<bib-KalkerBook>)[5], #link(<bib-Johnson>)[33], #link(<bib-Goryacheva>)[34], #link(<bib-Barber>)[35]\]. However, pure longitudinal slip
remains the only case for which a closed-form analytical solution is
available. The intrinsic complexities associated with unsteady rolling
have confined other exact analyses, particularly those involving
combined slip conditions, to the numerical domain
\[#link(<bib-Vollebregt1>)[36], #link(<bib-Vollebregt2>)[37], #link(<bib-Vollebregt3>)[38], #link(<bib-Vollebregt4>)[39]\], whereas several
authors have proposed approximate analytical solutions
\[#link(<bib-Nielsen>)[40], #link(<bib-Alfredsson>)[41]\].

In fact, more involved cases featuring combined translational and spin
slips can be studied, at least qualitatively, using Kalker's simplified
model \[#link(<bib-KalkerBook>)[5], #link(<bib-Johnson>)[33], #link(<bib-KalkerSimp>)[42]\], which employs a Winkler-type
approximation for the elastic relationship between deformations and
stresses. Closely related formulations, based on local constitutive
laws, quickly became popular in vehicle dynamics, where they are known
as #emph[brush models]. A key advantage of these simplified models is
that they replace the convolution integrals arising from full elasticity
theory with linear algebraic relations, thereby enabling both
steady-state and transient analyses for a wide range of wheel-rail and
tyre-road operating conditions. Analytical solutions derived from brush
models can be found, for example, in
\[#link(<bib-LibroMio>)[9], #link(<bib-Gross>)[44], #link(<bib-Alonso1>)[45], #link(<bib-Alonso2>)[46], #link(<bib-Ciavarella1>)[47], #link(<bib-Ciavarella2>)[48], #link(<bib-Ciavarella3>)[49], #link(<bib-Al-Bender>)[50], #link(<bib-USB>)[51]\].
More recent extensions addressing large spin slips and omnidirectional
rolling are presented in \[#link(<bib-Meccanica2>)[52], #link(<bib-SphericalWheel>)[53]\], whilst
\[#link(<bib-Vollebregt1>)[36], #link(<bib-Vollebregt2>)[37], #link(<bib-Vollebregt3>)[38], #link(<bib-Vollebregt4>)[39]\] discusses adaptations
to account for lubricated friction and third-body layers.

Despite their usefulness and wide adoption, classical brush models
suffer from an important limitation: they require an explicit
distinction between adhesion and sliding regions within the contact
patch. When the rolling contact process is formulated as a spatially
distributed problem, this feature introduces insurmountable obstacles to
obtaining general analytical results whilst complicating rigorous
mathematical treatment, as well as integration with control or
estimation algorithms. To address these drawbacks, several alternative
theories of rolling and spinning friction have been proposed. For
example, the local approaches presented in
\[#link(<bib-Zhuravlev1>)[54], #link(<bib-Zhuravlev2>)[55], #link(<bib-Kireenkov1>)[56], #link(<bib-Kireenkov2>)[57]\] estimate the friction
forces and moments acting on spinning or sliding bodies by relying on
simplified representations of rolling kinematics, permitting the
derivation of compact expressions for the global quantities of interest.
Dynamic friction models, such as the Dahl and LuGre formulations
\[#link(<bib-Astrom1>)[58], #link(<bib-Olsson>)[59], #link(<bib-Astrom2>)[60]\], have also been extended to rolling contact
applications, particularly in tyre-road interaction
\[#link(<bib-Sorine>)[61], #link(<bib-TsiotrasConf>)[62], #link(<bib-Tsiotras1>)[63], #link(<bib-Tsiotras3>)[64], #link(<bib-Deur0>)[65], #link(<bib-Deur1>)[66], #link(<bib-Deur2>)[67]\]. These
descriptions do not differentiate between stick and slip regimes, since
they only model the average deflection of bristle elements within the
contact area. As such, they possess a mathematical structure that is
more amenable to analysis and control design. Conceptually, similar
descriptions may also be adapted starting from other dynamic friction
formulations, including Leuven-type \[#link(<bib-Integrated>)[68], #link(<bib-Leuven>)[69]\] and elastoplastic
models \[#link(<bib-Elasto1>)[70], #link(<bib-Elasto2>)[71]\]. However, most of these approaches remain
empirical in nature and therefore provide only limited physical insight
into the underlying mechanisms of friction.

Recently, as a variant of LuGre, the Friction with Bristle Dynamics
(FrBD) formulation was introduced in \[#link(<bib-FrBD>)[72]\] as a first-order
approximation to a rheological description of bristle-like elements
attached to the rolling components. Being physically motivated, the FrBD
model provides a consistent dynamic description of sliding in the
presence of dry and lubricated friction. However, the variant developed
in \[#link(<bib-FrBD>)[72]\] was conceived for line contact conditions and, albeit able to
capture essential transient and steady-state effects, its applicability
to rolling and spinning contact, which is inherently a two-dimensional
distributed phenomenon, remains limited. The present paper addresses
this intrinsic limitation by presenting a full two-dimensional
generalisation of the FrBD model, suitable to describe rolling contact
processes occurring between a deformable body and a rigid substrate, or
between similarly elastic bodies, in the presence of dry or lubricated
friction. As for its one-dimensional counterpart developed in \[#link(<bib-FrBD>)[72]\], the
main ingredient for the refined formulation is a physically motivated
constitutive relationship postulating the bristle force as a function of
both deformation and deformation rate. This local constitutive
relationship is coupled with an analytical law for sliding friction
through a nonlinear mapping involving a generalised friction coefficient
matrix. The combination leads to an implicit differential equation for
the sliding velocity, which is approximated analytically using a
constructive version of the Implicit Function Theorem. The resulting
dynamic friction law depends solely on the rigid relative velocity and
bristle deflection, eliminating the concept of sliding velocity and
yielding a nonlinear #emph[ordinary differential equation] (ODE)
applicable to both sliding and rolling contexts. In particular, to move
from a local dynamic model to a spatially distributed rolling contact
formulation, the paper adopts an Eulerian approach: through the
definition of a transport-velocity field and a change of variables from
time to travelled distance, the bristle dynamics is expressed, in very
general terms, as a first-order nonlinear #emph[partial differential
equation] (PDE) defined over a possibly time-dependent contact domain.
This reformulation enables the friction state to vary within the contact
area, capturing important dynamical effects such as loading and
unloading, relaxation from leading to trailing edge, and spin-induced
asymmetries.

Specifically, three distributed rolling contact models are derived from
this general PDE. The first is essentially a standard description,
similar to those already encountered, for instance, in
\[#link(<bib-Tsiotras1>)[63], #link(<bib-Tsiotras3>)[64], #link(<bib-Deur0>)[65], #link(<bib-Deur1>)[66]\], and qualifies as the FrBD analogue of
the classical brush models. The second model variant accounts more
explicitly for the presence of large spin slips, which are incorporated
exactly into the expressions for the relative and transport velocities,
yielding a rather involved semilinear PDE. Finally, the third variant is
introduced as an approximation to the semilinear one, and only considers
first-order effects that are relevant for strongly spin-dominated
regimes. It shares some similarities with the advanced brush and
LuGre-brush models proposed in \[#link(<bib-Meccanica2>)[52], #link(<bib-SphericalWheel>)[53]\] and
\[#link(<bib-LuGreSpin>)[73]\], albeit being substantially more complex. For the linear
formulations introduced in the paper, well-posedness is established by
invoking standard results, ensuring existence and uniqueness of mild and
classical solutions under appropriate regularity conditions on the
transport velocity, slip inputs, and matrices of coefficients. The
mathematical analysis further investigates important notions such as
stability -- including #emph[input-to-state stability] (ISS) and
#emph[input-to-output stability] (IOS) --, and passivity, which, apart
from having important physical interpretations, are crucial for
control-oriented applications. A central finding is that, in contrast to
LuGre-based formulations, the linear models delivered by the paper are
(almost) always passive, as inherited from the underlying rheological
structure of the bristle-like elements.

The theoretical findings of the paper are complemented with numerical
results illustrating both steady-state and transient phenomena in
rolling contact. Action surfaces are computed to characterise steady
force-slip relationships, whilst transient simulations focus on
relaxation processes and on the effect of time-varying contact regions
or normal forces. Overall, the paper provides the first mathematically
rigorous, two-dimensional dynamic friction model tailored specifically
to rolling contact systems. It unifies rheological bristle dynamics,
nonlinear friction laws, and PDE representations of distributed contact,
offering a versatile and physically grounded framework for future
developments in wheel-rail, tyre, and general rolling contact modelling.

The remainder of this manuscript is organised as follows.
Section~#link(<sect:2Dext>)[2] details the derivation of the extended
two-dimensional FrBD formulation combining physical-oriented models with
sound analytical arguments. Then, Sect.~#link(<sect:models>)[3] particularieses the
general equations obtained in Sect.~#link(<sect:2Dext>)[2] for rolling contact
systems, delivering three different model variants with increasing level
of complexity. The linear models introduced in Sect.~#link(<sect:models>)[3] are
analysed in Sect.~#link(<sect:math>)[4] in terms of stability and passivity. These
notions are also instrumental in highlighting key mathematical features
connected with friction-related phenomena. A rich variety of numerical
results are then reported and discussed in Sect.~#link(<sect:numer>)[5], concerning
both steady-state and transient behaviours. Finally, the main
conclusions of the paper are summarised in Sect.~#link(<sect:conclusion>)[6], where
possible directions for future research are also indicated. Technical
results and additional modelling details are instead confined to
Appendices~#link(<app:1>)[A],~#link(<app:Patch>)[B], and~#link(<app:details>)[C].

#heading(level: 2, numbering: none)[Notation]
<notation>
In this paper, $bb(R)$ denotes the set of real numbers; $bb(R)_(> 0)$
and $bb(R)_(gt.eq 0)$ indicate the set of positive real numbers
excluding and including zero, respectively. The set of positive integer
numbers is indicated with $bb(N)$, whereas $bb(N)_0$ denotes the
extended set of positive integers including zero, i.e.,
$bb(N)_0 = bb(N) union { 0 }$\; the set of positive even integers is
indicated with $2 bb(N)$. The set of $n times m$ matrices with values in
$bb(F)$ ($bb(F) = bb(R)$, $bb(R)_(> 0)$, $bb(R)_(gt.eq 0)$) is denoted
by $upright(bold(M))_(n times m) \( bb(F) \)$ (abbreviated as
$upright(bold(M))_n \( bb(F) \)$ whenever $m = n$).
$upright(bold(S y m))_n \( bb(R) \)$ represents the group of symmetric
matrices with values in $bb(R)$\; the identity matrix on $bb(R)^n$ is
indicated with $upright(bold(I))_n$. A positive-definite matrix is noted
as
$upright(bold(M))_n \( bb(R) \) in.rev upright(bold(Q)) succ upright(bold(0))$\;
a positive semidefinite one as
$upright(bold(M))_n \( bb(R) \) in.rev upright(bold(Q)) succ.curly.eq upright(bold(0))$.
The standard Euclidean norm on $bb(R)^n$ is indicated with
$∥dot.op∥_2$\; operator norms are simply denoted by $∥dot.op∥$. Given a
domain $Omega$ with closure $overline(Omega)$,
$L^p \( Omega \; cal(Z) \)$ and $C^k \( overline(Omega) \; cal(Z) \)$
($p \, k in { 1 \, 2 \, dots.h \, oo }$) denote respectively the spaces
of $L^p$-integrable functions and $k$-times continuously differentiable
functions on $overline(Omega)$ with values in $cal(Z)$ (for $T = oo$,
the interval $\[ 0 \, T \]$ is identified with $bb(R)_(gt.eq 0)$). In
particular, $L^2 \( Omega \; bb(R)^n \)$ denotes the Hilbert space of
square-integrable functions on $Omega$ with values in $bb(R)^n$, endowed
with inner product
$chevron.l bold(zeta)_1 \, bold(zeta)_2 chevron.r_(L^2 \( Omega \; bb(R)^n \)) = integral_Omega bold(zeta)_1^(upright(T)) \( xi \) bold(zeta)_2 \( xi \) upright(d) xi$
and induced norm
$∥bold(zeta) \( dot.op \)∥_(L^2 \( Omega \; bb(R)^n \))$. The Hilbert
space $H^1 \( Omega \; bb(R)^n \)$ consists of functions
$bold(zeta) in L^2 \( Omega \; bb(R)^n \)$ whose weak derivative also
belongs to $L^2 \( Omega \; bb(R)^n \)$. For a function
$f : Omega mapsto bb(R)$, the sup norm is defined as
$∥f \( dot.op \)∥_oo eq.delta "ess sup"_Omega lr(|f \( dot.op \)|)$\;
$f : Omega mapsto bb(R)$ belongs to the space
$L^oo \( Omega \; bb(R) \)$ if $∥f \( dot.op \)∥_oo < oo$. A function
$f in C^0 \( bb(R)_(gt.eq 0) \; bb(R)_(gt.eq 0) \)$ belongs to the space
$cal(K)$ if it is strictly increasing and $f \( 0 \) = 0$\;
$f in cal(K)$ belongs to the space $cal(K)_oo$ if it is unbounded.
Finally, a function
$f in C^0 \( bb(R)_(gt.eq 0)^2 \; bb(R)_(gt.eq 0) \)$ belongs to the
space $cal(K L)$ if $f \( dot.op \, t \) in cal(K)$ and is strictly
decreasing in its second argument, with
$lim_(t arrow.r oo) f \( dot.op \, t \) = 0$.

= 2D extension of the FrBD friction model
<sect:2Dext>
This section extends the FrBD friction model to cover two-dimensional
contact cases, where relative rolling and sliding motions may occur in
both the longitudinal and lateral directions. The model is derived by
mixing the right doses of physical intuition and algebraic dexterity.
For this, three main ingredients are needed: a rheological description
of a bristle-like element, a local friction model, and a sufficiently
convincing mathematical artifice. The first two modelling ingredients
are introduced in Sect.~#link(<sect:rhelANdFr>)[2.1], and then mixed mathematically
in Sect.~#link(<sect:DynamicDer>)[2.2].

== Rheological and friction models
<sect:rhelANdFr>
As already anticipated, two key constituents in the derivation of the
extended FrBD model are a rheological description of a bristle element,
and an analytical description of the local sliding friction process.
These are discussed in detail in Sects.~#link(<sect:rheol>)[2.1.1]
and~#link(<sect:frictionModel>)[2.1.2].

=== Rheological model
<sect:rheol>
The first step in deriving a two-dimensional FrBD friction model is to
specify an appropriate rheological representation for the bristle
element. This may be achieved by analysing separately the two
configurations illustrated in Fig.~#link(<fig:LumpModel>)[1], where a body slides
over a flat substrate. The problem is studied in a reference frame
$\( O \; x \, y \, z \)$ oriented as follows: the $x$-axis
(longitudinal) is usually directed as the main direction of motion of
the upper body, the $z$-axis (vertical) points downward, into the lower
body, and the $y$-axis (lateral) is oriented so to have a right-handed
system.

First, the situation depicted in Fig.~#link(<fig:LumpModel>)[1]\(a) is considered:
the upper body travels with rigid relative velocity
$bb(R)^2 in.rev bold(v) ""_(upright(r)) = \[ v_(upright(r) x) #h(0em) v_(upright(r) y) \]^(upright(T))$
with respect to the rigid substrate (lower body). It should be noted
that, in Fig.~#link(<fig:LumpModel>)[1], the rigid relative velocity
$bold(v) ""_(upright(r))$ is defined positive with a minus sign in the
reference frame $\( O \; x \, y \, z \)$\; this simplifies the notation
for the final formulae and ensures notational consistency with other
dynamic friction models such as the Dahl and LuGre
\[#link(<bib-Astrom1>)[58], #link(<bib-Olsson>)[59], #link(<bib-Astrom2>)[60]\]. To the lower boundary of the upper body,
deformable massless bristles protrude, whose deflection is denoted by
$bb(R)^2 in.rev bold(z) = \[ z_x #h(0em) z_y \]^(upright(T))$ (not to be
confounded with the vertical axis $z$). The roots of the bristles, which
are attached to the upper body, have rigid relative velocity
$bold(v) ""_(upright(r))$ with respect to the substrate. On the other
hand, the total sliding velocity between the tip of the bristle and the
lower body reads
#math.equation(block: true, numbering: _ => [(1)], $ bold(v) ""_(upright(s)) \( dot(bold(z)) \, bold(v) ""_(upright(r)) \) = bold(v) ""_(upright(r)) - dot(bold(z)) \, $) <eq:slidingS>
and is again defined as positive with a minus sign convention.

#figure(image("figures/SchematicLumped4.svg", width: 100.0%),
  caption: [
    A schematic representation of the friction model: (a) configuration
    with a rigid substrate; (b) configuration with a deformable
    substrate. The problem is studied in a reference frame
    $\( O \; x \, y \, z \)$ with unit vectors
    $\( hat(bold(e))_x \, hat(bold(e))_y \, hat(bold(e))_z \)$.
  ]
)
<fig:LumpModel>

As illustrated in Fig.~#link(<fig:LumpModelForces>)[2], during its sliding over the
rigid substrate, the bristle generates a nondimensional
force#footnote[Essentially, a force per unit of vertical load, which may
be interpreted either as a friction potential or as a dynamic friction
coefficient.],
$bb(R)^2 in.rev bold(f) = \[ f_x #h(0em) f_y \]^(upright(T))$, which, in
the absence of inertial effects, counteracts the friction force per unit
of normal load $p in bb(R)_(> 0)$ acting on its tip,
$bb(R)^2 in.rev bold(f) ""_(upright(r)) = \[ f_(upright(r) x) #h(0em) f_(upright(r) y) \]^(upright(T))$.
A simple but rather general constitutive equation, based on a
Kelvin-Voigt rheological representation of the bristle, is
#math.equation(block: true, numbering: _ => [(2)], $ bold(f) \( dot(bold(z)) \, bold(z) \) = upright(bold(Sigma))_0 bold(z) + upright(bold(Sigma))_1 dot(bold(z)) \, $) <eq:rheol1>
where the matrices
$upright(bold(S y m))_2 \( bb(R) \) in.rev upright(bold(Sigma))_0 succ upright(bold(0))$
and
$upright(bold(S y m))_2 \( bb(R) \) in.rev upright(bold(Sigma))_1 succ.curly.eq upright(bold(0))$
collect the normalised micro-stiffness and micro-damping coefficients:
#math.equation(block: true, numbering: _ => [(3)], $ upright(bold(Sigma))_0 & = mat(delim: "[", sigma_(0 x x), sigma_(0 x y); sigma_(0 x y), sigma_(0 y y)) \,\
upright(bold(Sigma))_1 & = mat(delim: "[", sigma_(1 x x), sigma_(1 x y); sigma_(1 x y), sigma_(1 y y)) \, $) <eq:Sigmas1>
or, in the case of diagonal matrices:
#math.equation(block: true, numbering: _ => [(4)], $ upright(bold(Sigma))_0 & = mat(delim: "[", sigma_(0 x), 0; 0, sigma_(0 y)) \,\
upright(bold(Sigma))_1 & = mat(delim: "[", sigma_(1 x), 0; 0, sigma_(1 y)) . $) <eq:Sigmas2>
In
Eqs.~#link(<eq:rheol1>)[(2)]-#link(<eq:Sigmas2>)[(4)],
$upright(bold(Sigma))_0$ and $upright(bold(Sigma))_1$ have been assumed
constant for simplicity, but the generalisation to nonlinear stiffness
and damping terms is straightforward. It is also worth emphasising that,
in contrast to the LuGre model, Eq.~#link(<eq:rheol1>)[(2)]
does not include viscosus contributions, which will be instead
incorporated correctly in the local model friction model detailed in
Sect.~#link(<sect:frictionModel>)[2.1.2]. This strategy is coherent with the
observations reported in several recent publications (see, for instance,
\[#link(<bib-Trib1>)[74], #link(<bib-Rill>)[75]\]).

#figure(bristle-forces(), kind: image,
  caption: [
    Free-body diagram of the bristle element in the $x$ and
    $z$-directions, along with its reaction on the upper and lower
    bodies in the absence of inertial effects.
  ]
)
<fig:LumpModelForces>

In the second scenario illustrated in Fig.~#link(<fig:LumpModel>)[1]\(b),
deformable bristles
$bb(R)^2 in.rev bold(z) ""^(upright(\( 1 \))) = \[ z_x ""^(upright(\( 1 \))) #h(0em) z_y ""^(upright(\( 1 \))) \]^(upright(T))$
and
$bb(R)^2 in.rev bold(z) ""^(upright(\( s \))) = \[ z_x ""^(upright(\( 2 \))) #h(0em) z_y ""^(upright(\( 2 \))) \]^(upright(T))$
protrude from both bodies (the superscripts $""^(upright(\( 1 \)))$ and
$""^(upright(\( 2 \)))$ refer to body 1 and 2, respectively). In this
case, by defining
$bb(R)^2 in.rev bold(z) eq.delta bold(z) ""^(upright(\( 1 \))) - bold(z) ""^(upright(\( 2 \)))$,
the total sliding velocity between the tips of the bristles attached to
the upper and lower body may be computed again as in
Eq.~#link(<eq:slidingS>)[(1)]. Furthermore, a similar
relationship to Eq.~#link(<eq:rheol1>)[(2)] may be postulated
concerning each body, that is,
#math.equation(block: true, numbering: _ => [(5)], $ bold(f) ""^(upright(\( 1 \))) #scale(x: 120%, y: 120%)[\(] dot(bold(z)) ""^(upright(\( 1 \))) \, bold(z) ""^(upright(\( 1 \))) #scale(x: 120%, y: 120%)[\)] & = upright(bold(Sigma))_0 ""^(upright(\( 1 \))) bold(z) ""^(upright(\( 1 \))) + upright(bold(Sigma))_1 ""^(upright(\( 1 \))) dot(bold(z)) ""^(upright(\( 1 \))) \,\
bold(f) ""^(upright(\( 2 \))) #scale(x: 120%, y: 120%)[\(] dot(bold(z)) ""^(upright(\( 2 \))) \, bold(z) ""^(upright(\( 2 \))) #scale(x: 120%, y: 120%)[\)] & = upright(bold(Sigma))_0 ""^(upright(\( 2 \))) bold(z) ""^(upright(\( 2 \))) + upright(bold(Sigma))_1 ""^(upright(\( 2 \))) dot(bold(z)) ""^(upright(\( 2 \))) . $) <eq:fbSedndss>
Again, it may be assumed that
$upright(bold(S y m))_2 \( bb(R) \) in.rev upright(bold(Sigma))_0 ""^(upright(\( 1 \))) \, upright(bold(Sigma))_0 ""^(upright(\( 2 \))) succ upright(bold(0))$
and
$upright(bold(S y m))_2 \( bb(R) \) in.rev upright(bold(Sigma))_1 ""^(upright(\( 1 \))) \, upright(bold(Sigma))_1 ""^(upright(\( 2 \))) succ.curly.eq upright(bold(0))$.
Clearly, it must hold that
$ bold(f) ""^(upright(\( 1 \))) #scale(x: 120%, y: 120%)[\(] dot(bold(z)) ""^(upright(\( 1 \))) bold(z) ""^(upright(\( 1 \))) #scale(x: 120%, y: 120%)[\)] = - bold(f) ""^(upright(\( 2 \))) #scale(x: 120%, y: 120%)[\(] dot(bold(z)) ""^(upright(\( 2 \))) \, bold(z) ""^(upright(\( 2 \))) #scale(x: 120%, y: 120%)[\)] . $
Consequently, assuming
$upright(bold(Sigma))_0 ""^(upright(\( 1 \))) = upright(bold(Sigma))_0 ""^(upright(\( 2 \)))$,
$upright(bold(Sigma))_1 ""^(upright(\( 1 \))) = upright(bold(Sigma))_1 ""^(upright(\( 2 \)))$
yields
#math.equation(block: true, numbering: _ => [(7)], $ bold(f) \( dot(bold(z)) \, bold(z) \) & eq.delta bold(f) ""^(upright(\( 1 \))) #scale(x: 120%, y: 120%)[\(] dot(bold(z)) ""^(upright(\( 1 \))) \, bold(z) ""^(upright(\( 1 \))) #scale(x: 120%, y: 120%)[\)] equiv - bold(f) ""^(upright(\( 2 \))) #scale(x: 120%, y: 120%)[\(] dot(bold(z)) ""^(upright(\( 2 \))) \, bold(z) ""^(upright(\( 2 \))) #scale(x: 120%, y: 120%)[\)]\
 & equiv 1 / 2 #scale(x: 180%, y: 180%)[\[] bold(f) ""^(upright(\( 1 \))) #scale(x: 120%, y: 120%)[\(] dot(bold(z)) ""^(upright(\( 1 \))) \, bold(z) ""^(upright(\( 1 \))) #scale(x: 120%, y: 120%)[\)] - bold(f) ""^(upright(\( 2 \))) #scale(x: 120%, y: 120%)[\(] dot(bold(z)) ""^(upright(\( 2 \))) \, bold(z) ""^(upright(\( 2 \))) #scale(x: 120%, y: 120%)[\)] #scale(x: 180%, y: 180%)[\]] = upright(bold(Sigma))_0 bold(z) + upright(bold(Sigma))_1 dot(bold(z)) \, $) <eq:rheol2>
where
$ upright(bold(Sigma))_0 eq.delta 1 / 2 upright(bold(Sigma))_0 ""^(upright(\( 1 \))) equiv 1 / 2 upright(bold(Sigma))_0 ""^(upright(\( 2 \))) \,\
upright(bold(Sigma))_1 eq.delta 1 / 2 upright(bold(Sigma))_1 ""^(upright(\( 1 \))) equiv 1 / 2 upright(bold(Sigma))_1 ""^(upright(\( 2 \))) . $
Compared to~#link(<eq:fbSedndss>)[(5)],
Eq.~#link(<eq:rheol2>)[(7)] has exactly the same structure as
Eq.~#link(<eq:rheol1>)[(2)], and describes the bristle force
solely in terms of the relative deflection and velocity $bold(z)$ and
$dot(bold(z))$. Therefore, it may be concluded that, when the stiffness
and damping matrices $upright(bold(Sigma))_0$ and
$upright(bold(Sigma))_1$ are constant,
Eq.~#link(<eq:rheol1>)[(2)] suffices to describe both the
situations depicted in Fig.~#link(<fig:LumpModel>)[1]. In rolling contact, this is
generally true for bodies that are either incommensurably or comparably
rigid, where, to a good approximation, the expressions for the relative
sliding and rigid velocities are independent of the assumed constitutive
model \[#link(<bib-KinematicsMio>)[1]\]. In intermediate cases where the contacting bodies
undergo different amounts of deformation, this no longer holds, and the
kinematics becomes coupled with the material's rheological equations,
even in the simplest case of pure elastic behaviours \[#link(<bib-KinematicsMio>)[1]\].
Such complex situations are deliberately disregarded in this paper, but
will be addressed in future works.

=== Local friction model and friction dissipation
<sect:frictionModel>
In addition to a rheological representation of the bristle element, it
is necessary to specify a local model for the friction force as a
function of the sliding velocity,
$bold(f) ""_(upright(r)) \( bold(v) ""_(upright(s)) \)$. Whereas an
excellent and exhaustive overview of analytical friction models may be
found in \[#link(<bib-Antali>)[76]\], the approach followed in this paper is specifically
inspired by those of \[#link(<bib-Sorine>)[61], #link(<bib-Tsiotras3>)[64]\], and starts with important
considerations about the #emph[passivity] of friction. The fundamental
idea is that the normalised friction force generated during the
reciprocal sliding motion between the contacting bodies should maximise
the #emph[dissipation rate]
$bold(f) ""_(upright(r))^(upright(T)) bold(v) ""_(upright(s))$. To this
end, the following optimisation problem is formulated:
#math.equation(block: true, numbering: _ => [(10)], $ bold(f) ""_(upright(r))^star.op & = "argmax"_(bold(f) ""_(upright(r)) in cal(C) \( bold(v) ""_(upright(s)) \( t \) \)) bold(f) ""_(upright(r))^(upright(T)) bold(v) ""_(upright(s)) \( t \) \, quad bold(v) ""_(upright(s)) \( t \) in bb(R)^2 \, #h(0em) t in \[ 0 \, T \] \, $) <eq:Problem>
where $cal(C) \( bold(v) ""_(upright(s)) \)$ denotes the set of
admissible normalised friction forces, depending on the sliding
velocity:
$ cal(C) \( bold(v) ""_(upright(s)) \) & eq.delta #scale(x: 240%, y: 240%)[{] bold(f) ""_(upright(r)) in bb(R)^2 #scale(x: 240%, y: 240%)[\|] ∥upright(bold(M))^(- 1) \( bold(v) ""_(upright(s)) \) bold(f) ""_(upright(r))∥_2 lt.eq 1 #scale(x: 240%, y: 240%)[}] \, $
and
$ upright(bold(M)) \( bold(v) ""_(upright(s)) \) = mat(delim: "[", mu_(x x) \( bold(v) ""_(upright(s)) \), mu_(x y) \( bold(v) ""_(upright(s)) \); mu_(x y) \( bold(v) ""_(upright(s)) \), mu_(y y) \( bold(v) ""_(upright(s)) \)) $#label("eq;matrixM")
is a symmetric, positive definite matrix, i.e.,
$upright(bold(S y m))_2 \( bb(R) \) in.rev upright(bold(M)) \( bold(y) \) succ upright(bold(0))$
for all $bold(y) in bb(R)^2$. In this manuscript, it is generally
assumed that
$upright(bold(M)) in C^0 \( bb(R)^2 \; upright(bold(S y m))_2 \( bb(R) \) \)$.
For many practical applications, and especially in isotropic conditions,
$upright(bold(M)) \( bold(v) ""_(upright(s)) \)$ is often postulated to
be of the form
$upright(bold(M)) \( bold(v) ""_(upright(s)) \) = mu \( bold(v) ""_(upright(s)) \) upright(bold(I))_2$,
where $mu : bb(R)^2 mapsto \[ mu ""_(upright(m i n)) \, oo \)$, with
$mu ""_(upright(m i n)) in bb(R)_(> 0)$, provides an analytical
expression for the friction coefficient. A very common expression for
$mu \( bold(v) ""_(upright(s)) \)$ is, for instance,
#math.equation(block: true, numbering: _ => [(13)], $ mu \( bold(v) ""_(upright(s)) \) = mu ""_(upright(d)) + \( mu ""_(upright(s)) - mu ""_(upright(d)) \) exp #scale(x: 300%, y: 300%)[\(] - #scale(x: 240%, y: 240%)[\(] frac(∥bold(v) ""_(upright(s))∥_2, v ""_(upright(S))) #scale(x: 240%, y: 240%)[\)]^(delta ""_(upright(S))) #scale(x: 300%, y: 300%)[\)] + mu ""_(upright(v)) \( bold(v) ""_(upright(s)) \) \, $) <eq:muExample>
where $mu ""_(upright(s)) \, mu ""_(upright(d)) in bb(R)_(> 0)$ denote
the static and dynamic friction coefficients,
$v ""_(upright(S)) in bb(R)_(> 0)$ indicates the Stribeck velocity,
$delta ""_(upright(S)) in bb(R)_(gt.eq 0)$ the Stribeck exponent, and
$mu ""_(upright(v)) : bb(R)^2 mapsto bb(R)_(gt.eq 0)$ captures the
viscous friction.

In any case, the solution to the problem described by
Eqs.~#link(<eq:Problem>)[(10)]-#link(label("eq;matrixM"))[\[eq;matrixM\]]
was obtained in \[#link(<bib-Sorine>)[61], #link(<bib-Tsiotras3>)[64]\], and is given as in
Theorem~#link(<lemma:friction>)[2.1] below.

#block[
#strong[Theorem 2.1]. #emph[The solution to
Eqs.~#link(<eq:Problem>)[(10)]-#link(label("eq;matrixM"))[\[eq;matrixM\]]
is given by
#math.equation(block: true, numbering: _ => [(14)], $ bold(f) ""_(upright(r))^star.op #scale(x: 120%, y: 120%)[\(] bold(v) ""_(upright(s)) \( t \) #scale(x: 120%, y: 120%)[\)] = frac(upright(bold(M))^2 #scale(x: 120%, y: 120%)[\(] bold(v) ""_(upright(s)) \( t \) #scale(x: 120%, y: 120%)[\)] bold(v) ""_(upright(s)) \( t \), ∥upright(bold(M)) #scale(x: 120%, y: 120%)[\(] bold(v) ""_(upright(s)) \( t \) #scale(x: 120%, y: 120%)[\)] bold(v) ""_(upright(s)) \( t \)∥_2) \, quad bold(v) ""_(upright(s)) \( t \) in bb(R)^2 \\ { bold(0) } \, #h(0em) t in \[ 0 \, T \] \, $) <eq:fdbddsOrg>
with
#math.equation(block: true, numbering: _ => [(15)], $ bold(f) ""_(upright(r))^star.op #scale(x: 120%, y: 120%)[\(] bold(v) ""_(upright(s)) \( t \) #scale(x: 120%, y: 120%)[\)]^(upright(T)) bold(v) ""_(upright(s)) \( t \) = ∥upright(bold(M)) #scale(x: 120%, y: 120%)[\(] bold(v) ""_(upright(s)) \( t \) #scale(x: 120%, y: 120%)[\)] bold(v) ""_(upright(s)) \( t \)∥_2 \, quad t in \[ 0 \, T \] . $) <eq:dissOpt>]

#block[
#emph[#emph[Proof.] See the proof of Theorem 2 in \[#link(<bib-Tsiotras3>)[64]\].~◻]

]
] <lemma:friction>
Equation~#link(<eq:fdbddsOrg>)[(14)] provides some
preliminary but useful indications to generalise the FrBD model to
two-dimensional contact in a physically consistent manner. Its
interpretation is that the generated friction force, as a function of
the sliding velocity, should maximise the dissipated power at the
interface between the contacting bodies. However, it is worth observing
that Eq.~#link(<eq:fdbddsOrg>)[(14)] is not defined for
$bold(v) ""_(upright(s)) = bold(0)$. For this reason, but also to
facilitate the implementation of numerical algorithms \[#link(<bib-Rill>)[75]\], it may be
convenient to replace Eq.~#link(<eq:fdbddsOrg>)[(14)] with
the following formula:
#math.equation(block: true, numbering: _ => [(16)], $ bold(f) ""_(upright(r))^star.op \( bold(v) ""_(upright(s)) \) = frac(upright(bold(M))^2 \( bold(v) ""_(upright(s)) \) bold(v) ""_(upright(s)), ∥upright(bold(M)) \( bold(v) ""_(upright(s)) \) bold(v) ""_(upright(s))∥_(2 \, epsilon)) \, $) <eq:frModified>
where $epsilon in bb(R)_(gt.eq 0)$ represents a regularisation
parameter, and
$∥dot.op∥_(2 \, epsilon) in C^0 \( bb(R)^2 \; bb(R)_(gt.eq 0) \)$ is a
regularisation of the Euclidean norm $∥dot.op∥_2$ for
$epsilon in bb(R)_(> 0)$, often converging uniformly to $∥dot.op∥_2$ in
$C^0 \( bb(R)^2 \; bb(R)_(gt.eq 0) \)$ for $epsilon arrow.r 0$ (e.g.,
$∥bold(y)∥_(2 \, epsilon) = sqrt(∥bold(y)∥_2^2 + epsilon)$), and with
$∥dot.op∥_(2 \, epsilon) in C^1 \( bb(R)^2 \; bb(R)_(gt.eq 0) \)$ for
$epsilon in bb(R)_(> 0)$.

Before moving to the next Sect.~#link(<sect:DynamicDer>)[2.2], an important
consideration is formalised in Remark~#link(<remark:1>)[2.1] below.

#block[
#strong[Remark 2.1]. #emph[If
$upright(bold(M)) \( bold(v) ""_(upright(s)) \) = mu \( bold(v) ""_(upright(s)) \) upright(bold(I))_2$,
as it happens in the isotropic case, then
Eq.~#link(<eq:fdbddsOrg>)[(14)] reduces to
#math.equation(block: true, numbering: _ => [(17)], $ bold(f) ""_(upright(r))^star.op \( bold(v) ""_(upright(s)) \) = mu \( bold(v) ""_(upright(s)) \) frac(bold(v) ""_(upright(s)), ∥bold(v) ""_(upright(s))∥_2) \, quad bold(v) ""_(upright(s)) in bb(R)^2 \\ { bold(0) } . $) <eq:fdbddsOrg0>
In this case, Eq.~#link(<eq:frModified>)[(16)] may be
modified accordingly as
#math.equation(block: true, numbering: _ => [(18)], $ bold(f) ""_(upright(r))^star.op \( bold(v) ""_(upright(s)) \) = mu \( bold(v) ""_(upright(s)) \) frac(bold(v) ""_(upright(s)), ∥bold(v) ""_(upright(s))∥_(2 \, epsilon)) \, $) <eq:frIsotrEps>
which is the simplest two-dimensional counterpart to Eq. (4) in \[#link(<bib-FrBD>)[72]\].
In this context, it is worth emphasising that, for
$epsilon in bb(R)_(> 0)$, Eq.~#link(<eq:frIsotrEps>)[(18)]
does not follow directly from~#link(<eq:frModified>)[(16)],
and must be obtained by
regularising~#link(<eq:fdbddsOrg>)[(14)] #emph[a
posteriori]. The norm $∥dot.op∥_2$ in
Eq.~#link(<eq:muExample>)[(13)] may be similarly
regularised.]

] <remark:1>
== Dynamic friction model derivation
<sect:DynamicDer>
Section~#link(<sect:rhelANdFr>)[2.1] introduced the two main modelling ingredients
needed to extend the dynamic FrBD friction model to the two-dimensional
contact case. Theorem~#link(<thm:Theorem1>)[2.2] below provides the final, analytical
building block.

#block[
#strong[Theorem 2.2] (Edwards \[#link(<bib-Edwards>)[77]\]). #emph[Suppose that the mapping
$bold(H) : bb(R)^(m + n) mapsto bb(R)^n$ is $C^1$ in a neighbourhood of
a point $\( bold(x)^star.op \, bold(y)^star.op \)$, where
$bold(H) \( bold(x)^star.op \, bold(y)^star.op \) = bold(0)$. If the
Jacobian matrix
$nabla_(bold(y)) bold(H) \( bold(x)^star.op \, bold(y)^star.op \)^(upright(T))$
is nonsingular, there exist a neighbourhood $cal(X)$ of
$bold(x)^star.op$ in $bb(R)^m$, a neighbourhood $cal(Y)$ of
$\( bold(x)^star.op \, bold(y)^star.op \)$ in $bb(R)^(m + n)$, and a
mapping $bold(h) in C^1 \( cal(X) \; bb(R)^n \)$ such that
$bold(y) = bold(h) \( bold(x) \)$ solves the equation
$bold(H) \( bold(y) \, bold(x) \) = bold(0)$ in $cal(Y)$. In particular,
the implicitly defined mapping $bold(h) \( dot.op \)$ is the limit of
the sequence ${ bold(h)_k }_(k in bb(N)_0)^oo$ of the successive
approximations inductively defined by
$ bold(h)_(k + 1) \( bold(x) \) & = bold(h)_k \( bold(x) \) - nabla_(bold(y)) bold(H) \( bold(x)^star.op \, bold(y)^star.op \)^(- upright(T)) bold(H) #scale(x: 120%, y: 120%)[\(] bold(x) \, bold(h)_k \( bold(x) \) #scale(x: 120%, y: 120%)[\)] \,\
bold(h)_0 \( bold(x) \) & = bold(y)^star.op \, $ for
$bold(x) in cal(X)$.]

] <thm:Theorem1>
Starting with Eqs.~#link(<eq:rheol1>)[(2)]
and~#link(<eq:frModified>)[(16)],
Theorem~#link(<thm:Theorem1>)[(2.2)] may be sapiently invoked
to generalise the FrBD model to the two-dimensional contact case. The
fundamental observation is that, in the absence of inertial effects, the
net bristle force $bold(f) \( dot(bold(z)) \, bold(z) \)$ should be
equal to the frictional one
$bold(f) ""_(upright(r)) \( bold(v) ""_(upright(s)) \( dot(bold(z)) \, bold(v) ""_(upright(r)) \) \)$
generated at the bodies' interface. Therefore, adopting the notation of
Theorem~#link(<thm:Theorem1>)[2.2] and equating
Eqs.~#link(<eq:rheol1>)[(2)]
and~#link(<eq:frModified>)[(16)] gives
#math.equation(block: true, numbering: _ => [(20)], $ bold(H) \( dot(bold(z)) \, bold(z) \, bold(v) ""_(upright(r)) \) = bold(f) \( dot(bold(z)) \, bold(z) \) - bold(f) ""_(upright(r)) #scale(x: 120%, y: 120%)[\(] bold(v) ""_(upright(s)) \( dot(bold(z)) \, bold(v) ""_(upright(r)) \) #scale(x: 120%, y: 120%)[\)] = bold(0) \, quad t in \( 0 \, T \) \, $) <eq:H>
which is an implicit nonlinear ODE for the bristle dynamics
$bold(z) \( t \)$. In the sliding regime, where
$∥dot(bold(z))∥_2 lt.double ∥bold(v) ""_(upright(r))∥_2$, and for
sufficiently smooth $bold(H) \( dot.op \, dot.op \, dot.op \)$,
Eq.~#link(<eq:H>)[(20)] may be approximated by invoking
Theorem~#link(<thm:Theorem1>)[2.2] with
$bold(x) = \( bold(z) \, bold(v) ""_(upright(r)) \)$ and
$bold(y) = dot(bold(z))$, yielding
#math.equation(block: true, numbering: _ => [(21)], $ dot(bold(z))_(k + 1) = dot(bold(z))_k - nabla_(bold(dot(z))) bold(H) \( dot(bold(z))^star.op \, bold(z)^star.op \, bold(v) ""_(upright(r))^star.op \)^(- upright(T)) bold(H) \( dot(bold(z))_k \, bold(z) \, bold(v) ""_(upright(r)) \) \, quad k in bb(N)_0 . $) <eq:zk01>
In turn, specifying $bold(f) \( dot(bold(z)) \, bold(z) \)$ and
$bold(f) ""_(upright(r)) \( bold(v) ""_(upright(s)) \) = bold(f) ""_(upright(r))^star.op \( bold(v) ""_(upright(s)) \)$
as in Eqs.~#link(<eq:rheol1>)[(2)]
and~#link(<eq:frModified>)[(16)] leads to
#math.equation(block: true, numbering: _ => [(22)], $ nabla_(bold(dot(z))) bold(H) \( dot(bold(z)) \, bold(z) \, bold(v) ""_(upright(r)) \)^(upright(T)) & = nabla_(dot(bold(z))) bold(f) \( dot(bold(z)) \, bold(z) \)^(upright(T)) - nabla_(dot(bold(z))) bold(v) ""_(upright(s)) \( dot(bold(z)) \, bold(v) ""_(upright(r)) \)^(upright(T)) nabla_(bold(v) ""_(upright(s))) bold(f) ""_(upright(r)) #scale(x: 120%, y: 120%)[\(] bold(v) ""_(upright(s)) \( dot(bold(z)) \, bold(v) ""_(upright(r)) \) #scale(x: 120%, y: 120%)[\)]^(upright(T))\
 & = nabla_(dot(bold(z))) bold(f) \( dot(bold(z)) \, bold(z) \)^(upright(T)) + nabla_(bold(v) ""_(upright(s))) bold(f) ""_(upright(r)) #scale(x: 120%, y: 120%)[\(] bold(v) ""_(upright(s)) \( dot(bold(z)) \, bold(v) ""_(upright(r)) \) #scale(x: 120%, y: 120%)[\)]^(upright(T)) approx nabla_(dot(bold(z))) bold(f) \( dot(bold(z)) \, bold(z) \)^(upright(T)) + frac(upright(bold(M))^2 #scale(x: 120%, y: 120%)[\(] bold(v) ""_(upright(s)) \( dot(bold(z)) \, bold(v) ""_(upright(r)) \) #scale(x: 120%, y: 120%)[\)], ∥upright(bold(M)) #scale(x: 120%, y: 120%)[\(] bold(v) ""_(upright(s)) \( dot(bold(z)) \, bold(v) ""_(upright(r)) \) #scale(x: 120%, y: 120%)[\)] bold(v) ""_(upright(s)) \( dot(bold(z)) \, bold(v) ""_(upright(r)) \)∥_(2 \, epsilon)) \, $) <eq:nablaH>
where the approximation committed in the last line is informally
justified by the fact that the friction force
$bold(f) ""_(upright(r)) \( bold(v) ""_(upright(s)) \)$ may not be
defined for $bold(v) ""_(upright(s)) = bold(0)$ (for instance, when
$epsilon = 0$ in~#link(<eq:frModified>)[(16)]). Moreover,
owing to the assumption $upright(bold(Sigma))_0 succ upright(bold(0))$,
it may be easily inferred that, in steady-state conditions
($dot(bold(z)) = bold(0)$), there exist a unique solution
$bold(z)^star.op = bold(z)^star.op \( bold(v) ""_(upright(r)) \)$ to
Eq.~#link(<eq:H>)[(20)] for all
$bold(v) ""_(upright(r)) in bb(R)^2$. Consequently, combining
Eq.~#link(<eq:zk01>)[(21)] and~#link(<eq:nablaH>)[(22)]
with
$\( dot(bold(z))^star.op \, bold(z)^star.op \, bold(v) ""_(upright(r))^star.op \) = \( bold(0) \, bold(z)^star.op \( bold(v) ""_(upright(r)) \) \, bold(v) ""_(upright(r)) \)$,
and truncating Eq.~#link(<eq:zk01>)[(21)] at $k = 1$ provides,
for an initial guess $dot(bold(z))_0 = bold(0)$,
#math.equation(block: true, numbering: _ => [(23)], $  & dot(bold(z)) \( t \) = - upright(bold(G))^(- 1) #scale(x: 120%, y: 120%)[\(] bold(v) ""_(upright(r)) \( t \) #scale(x: 120%, y: 120%)[\)] #scale(x: 240%, y: 240%)[\[] upright(bold(Sigma))_0 ∥upright(bold(M)) #scale(x: 120%, y: 120%)[\(] bold(v) ""_(upright(r)) \( t \) #scale(x: 120%, y: 120%)[\)] bold(v) ""_(upright(r)) \( t \)∥_(2 \, epsilon) bold(z) \( t \) - upright(bold(M))^2 #scale(x: 120%, y: 120%)[\(] bold(v) ""_(upright(r)) \( t \) #scale(x: 120%, y: 120%)[\)] bold(v) ""_(upright(r)) \( t \) #scale(x: 240%, y: 240%)[\]] \, quad t in \( 0 \, T \) \,\
 & bold(z) \( 0 \) = bold(z)_0 . $) <eq:ODEModel> with
$upright(bold(G)) : bb(R)^2 mapsto upright(bold(S y m))_2 \( bb(R) \)$
according to
#math.equation(block: true, numbering: _ => [(24)], $ upright(bold(G)) \( bold(v) ""_(upright(r)) \) = upright(bold(Sigma))_1 ∥upright(bold(M)) \( bold(v) ""_(upright(r)) \) bold(v) ""_(upright(r))∥_(2 \, epsilon) + upright(bold(M))^2 \( bold(v) ""_(upright(r)) \) . $) <eq:MG>
Equations~#link(<eq:ODEModel>)[(23)]
and~#link(<eq:MG>)[(24)] describe the #emph[two-dimensional FrBD
model]. In the sequel, it will be particularised to describe various
distributed contact phenomena, including rolling and spinning. Before
moving to Sect.~#link(<sect:models>)[3], it is beneficial to draw some preliminary
considerations about the passive and dissipative nature of the FrBD
model, as well as on its mathematical structure. More specifically,
regarding
$bold(v) ""_(upright(s)) \( dot(bold(z)) \, bold(v) ""_(upright(r)) \)$
and $bold(f) \( dot(bold(z)) \, bold(z) \)$ as the input and otuput of
the model, and combining Eqs.~#link(<eq:rheol1>)[(2)]
and~#link(<eq:dissOpt>)[(15)] yields
$ bold(f) ""_(upright(r))^star.op #scale(x: 120%, y: 120%)[\(] bold(v) ""_(upright(s)) \( dot(bold(z)) \, bold(v) ""_(upright(r)) \) #scale(x: 120%, y: 120%)[\)]^(upright(T)) bold(v) ""_(upright(s)) \( dot(bold(z)) \, bold(v) ""_(upright(r)) \) = bold(f) \( dot(bold(z)) \, bold(z) \)^(upright(T)) bold(v) ""_(upright(s)) \( dot(bold(z)) \, bold(v) ""_(upright(r)) \) = bold(z)^(upright(T)) upright(bold(Sigma))_0 bold(v) ""_(upright(s)) \( dot(bold(z)) \, bold(v) ""_(upright(r)) \) + dot(bold(z))^(upright(T)) upright(bold(Sigma))_1 bold(v) ""_(upright(s)) \( dot(bold(z)) \, bold(v) ""_(upright(r)) \) gt.eq 0 . $
Recalling Eq.~#link(<eq:slidingS>)[(1)] and rearranging the
above inequality also gives
#math.equation(block: true, numbering: _ => [(26)], $ bold(f) \( dot(bold(z)) \, bold(z) \)^(upright(T)) bold(v) ""_(upright(r)) = bold(z)^(upright(T)) upright(bold(Sigma))_0 bold(v) ""_(upright(r)) + dot(bold(z))^(upright(T)) upright(bold(Sigma))_1 bold(v) ""_(upright(r)) gt.eq bold(z)^(upright(T)) upright(bold(Sigma))_0 dot(bold(z)) + dot(bold(z))^(upright(T)) upright(bold(Sigma))_1 dot(bold(z)) . $) <eq:dissipationRateRigid>
Since $upright(bold(Sigma))_1 succ.curly.eq upright(bold(0))$ by
assumption, the last term appearing in
Eq.~#link(<eq:dissipationRateRigid>)[(26)] is
always nonnegative. However, the sign of
$bold(z)^(upright(T)) upright(bold(Sigma))_0 dot(bold(z))$ is generally
undetermined. Therefore,
Eq.~#link(<eq:dissipationRateRigid>)[(26)] is
eloquent in telling that, if $bold(v) ""_(upright(r))$ and
$bold(f) \( dot(bold(z)) \, bold(z) \)$ are regarded as the input and
output of the model, the #emph[rigid dissipation rate]
$bold(f) \( dot(bold(z)) \, bold(z) \)^(upright(T)) bold(v) ""_(upright(r))$
need not to be nonnegative. In other words, when
$bold(v) ""_(upright(r))$ is regarded as an external input, passivity
does not automatically hold. However, the dynamic FrBD formulation
described by Eqs.~#link(<eq:ODEModel>)[(23)]
and~#link(<eq:MG>)[(24)] discards
Eq.~#link(<eq:fdbddsOrg>)[(14)]. Consequently, the friction
force is fully determined by the rheological
model~#link(<eq:rheol1>)[(2)]. In this setting, the notion of
sliding velocity is eliminated entirely, and passivity and dissipativity
must instead be assessed with the rigid velocity
$bold(v) ""_(upright(r))$ interpreted as an input. As shown in
Sect.~#link(<sect:diss>)[4.2], the proposed formulation maintains passivity under
virtually all circumstances. This contrasts with the LuGre formulation,
which requires introducing velocity-dependent damping coefficients to
enforce passivity. Nonetheless, within the dynamical FrBD framework,
these properties seem to be mathematical consequences of the
sufficiently accurate approximation of Eq.~#link(<eq:H>)[(20)]
obtained via Theorem~#link(<thm:Theorem1>)[2.2], rather than strict physical
requirements demanding strenuous elucubration.

Finally, it may be noted that, by disregarding the damping contribution
in Eq.~#link(<eq:fxs>)[(34)], the FrBD model reduces to the
two-dimensional formulation of the LuGre model presented in \[#link(<bib-Tsiotras3>)[64]\].
For sliding systems, the term
$upright(bold(Sigma))_1 ∥upright(bold(M)) \( bold(v) ""_(upright(r)) \) bold(v) ""_(upright(r))∥_(2 \, epsilon)$
may not be negligible in general, whereas, in the context of rolling
contact phenomena, the matrix $upright(bold(Sigma))_1$ is often observed
to be small \[#link(<bib-TsiotrasConf>)[62], #link(<bib-Tsiotras1>)[63], #link(<bib-Tsiotras3>)[64], #link(<bib-Deur0>)[65], #link(<bib-Deur1>)[66], #link(<bib-Deur2>)[67]\].

= Distributed rolling contact models
<sect:models>
The present section introduces three rolling contact models with
different degrees of complexity that can be derived from
Eq.~#link(<eq:ODEModel>)[(23)]. Specifically, the next
Sect.~#link(<sect:gener>)[3.1] discusses some generalities, whereas the three
formulations are detailed in
Sects.~#link(<sect:modelRollSimple>)[3.2],~#link(<sect:semilinear>)[3.3],
and~#link(<sect:LinearLargeSpin>)[3.4].

== Generalities
<sect:gener>
Before generalising the novel FrBD model to two-dimensional rolling
contact, three important aspects that deserve a proper discussion
concern the formulation of Eq.~#link(<eq:ODEModel>)[(23)] as
a PDE, following the Eulerian approach, the prescription of appropriate
#emph[boundary conditions] (BCs), and the calculation of the tangential
forces and vertical moment. These are addressed respectively in
Sects.~#link(<sect:eulerian>)[3.1.1],~#link(<sect:BC>)[3.1.2], and~#link(<ect:forces>)[3.1.3].

=== Eulerian approach and transport velocity
<sect:eulerian>
As illustrated in Fig.~#link(<fig:RollingBodies>)[3], the rolling contact problem
between two bodies is typically studied in a contact-fixed reference
frame $\( O \; x \, y \, z \)$, with the $x$-axis (longitudinal)
oriented along the main rolling direction, the $z$-axis (vertical)
pointing into one of the two bodies (often the lower one), and the
$y$-axis (lateral) defined to complete a right-handed coordinate system.
The origin $O$ coincides with the centroid of the (apparent), possibly
time-varying, contact area $cal(C) \( t \)$, which is often supposed to
be independent of the tangential (longitudinal and lateral) interactions
between the two bodies, and solely determined by the normal contact
configuration \[#link(<bib-KalkerBook>)[5]\]. Both the situations of reciprocal rolling, as
depicted in Fig.~#link(<fig:RollingBodies>)[3]\(a), and translational and rolling
contact, as shown in Fig.~#link(<fig:RollingBodies>)[3]\(b), may be considered: in
the first case, the shape of the contact area may vary over time, but
the origin $O$ is typically fixed; in the second scenario, the reference
frame moves together with one of the two bodies (usually, the upper
one).

#figure(image("figures/rollingBodies3.svg", width: 100.0%),
  caption: [
    Rolling contact problem between: (a) two spheres with angular
    velocities $bold(omega)_1 \, bold(omega)_2 in bb(R)^3$\; (b) a
    sphere translating and rolling over a stationary plane, where
    $bold(V)_1 in bb(R)^3$ denotes the translational velocity of its
    centre, and $bold(omega)_1 in bb(R)^3$ its rolling velocity.
  ]
)
<fig:RollingBodies>

In this paper, the contact area is assumed to be a compact subset of
$bb(R)^2$, that is, $cal(C) \( t \) subset bb(R)^2$, with boundary
$partial cal(C) \( t \)$ and interior $accent(cal(C), circle.stroked) \( t \)$. Inside
the contact area, the displacement of a bristle element will depend on
its position, that is,
$bold(z) \( t \) = bold(z) \( bold(x) \, t \) = \[ z_x \( bold(x) \, t \) #h(0em) z_y \( bold(x) \, t \) \]^(upright(T))$,
with $bold(x) in cal(C) \( t \)$. According to the Eulerian approach,
the total time derivative appearing in
Eq.~#link(<eq:ODEModel>)[(23)] becomes
#math.equation(block: true, numbering: _ => [(27)], $ dot(bold(z)) \( bold(x) \, t \) = frac(upright(d) bold(z) \( bold(x) \, t \), upright(d) t) = frac(partial bold(z) \( bold(x) \, t \), partial t) + #scale(x: 120%, y: 120%)[\(] bold(V) \( bold(x) \, t \) dot.op nabla_(bold(x)) #scale(x: 120%, y: 120%)[\)] bold(z) \( bold(x) \, t \) \, $) <eq:Eulerian>
where
$bb(R)^2 in.rev bold(V) \( bold(x) \, t \) = \[ V_x \( bold(x) \, t \) #h(0em) V_y \( bold(x) \, t \) \]^(upright(T))$
dentoes the transport velocity, and
$bb(R)^2 ∋ nabla_(bold(x)) ≜ [frac(partial, partial x) quad frac(partial, partial y)]^upright(T)$
is the tangential gradient. Moreover, considering the #emph[rolling
speed]
$\[ V ""_(upright(m i n)) \, V ""_(upright(m a x)) \] in.rev V ""_(upright(r)) \( t \) eq.delta ∥bold(V) \( bold(0) \, t \)∥_2$,
with $0 < V ""_(upright(m i n)) lt.eq V ""_(upright(m a x))$, it is
customary to define the #emph[travelled distance]
$bb(R)_(gt.eq 0) in.rev s eq.delta integral_0^t V ""_(upright(r)) \( t' \) upright(d) t'$,
so that Eq.~#link(<eq:ODEModel>)[(23)] may be recast as
#math.equation(block: true, numbering: _ => [(28)], $  & frac(partial bold(z) \( bold(x) \, s \), partial s) + #scale(x: 120%, y: 120%)[\(] macron(bold(V)) \( bold(x) \, s \) dot.op nabla_(bold(x)) #scale(x: 120%, y: 120%)[\)] bold(z) \( bold(x) \, s \) = upright(bold(Sigma)) #scale(x: 120%, y: 120%)[\(] macron(bold(v)) ""_(upright(r)) \( bold(x) \, s \) \, s #scale(x: 120%, y: 120%)[\)] bold(z) \( bold(x) \, s \) + bold(h) #scale(x: 120%, y: 120%)[\(] macron(bold(v)) ""_(upright(r)) \( bold(x) \, s \) \, s #scale(x: 120%, y: 120%)[\)] \, quad bold(x) in accent(cal(C), circle.stroked) \( s \) \, #h(0em) s in \( 0 \, S \) \,\
 & bold(z) \( bold(x) \, 0 \) = bold(z)_0 \( bold(x) \) \, quad bold(x) in accent(cal(C), circle.stroked)_0 \, $) <eq:PDenoMOdel09>
where $accent(cal(C), circle.stroked)_0 eq.delta accent(cal(C), circle.stroked) \( 0 \)$,
$bb(R)_(> 0) in.rev S eq.delta integral_0^T V ""_(upright(r)) \( t \) upright(d) t$,
$bb(R)^2 in.rev macron(bold(V)) \( bold(x) \, s \) = \[ macron(V)_x \( bold(x) \, s \) #h(0em) macron(V)_y \( bold(x) \, s \) \]^(upright(T)) eq.delta bold(V) \( bold(x) \, s \) \/ V ""_(upright(r)) \( s \)$,
$bb(R)^2 in.rev macron(bold(v)) ""_(upright(r)) \( bold(x) \, s \) = \[ macron(v)_(upright(r) x) \( bold(x) \, s \) #h(0em) macron(v)_(upright(r) y) \( bold(x) \, s \) \]^(upright(T)) eq.delta bold(v) ""_(upright(r)) \( bold(x) \, s \) \/ V ""_(upright(r)) \( s \)$,
and the functions
$upright(bold(Sigma)) : bb(R)^2 times bb(R)_(gt.eq 0) mapsto upright(bold(M))_2 \( bb(R) \)$
and $bold(h) : bb(R)^2 times bb(R)_(gt.eq 0) mapsto bb(R)^2$ are given
by
#math.equation(block: true, numbering: _ => [(29)], $ upright(bold(Sigma)) \( macron(bold(v)) ""_(upright(r)) \, s \) & eq.delta - frac(1, V ""_(upright(r)) \( s \)) upright(bold(G))^(- 1) #scale(x: 120%, y: 120%)[\(] V ""_(upright(r)) \( s \) macron(bold(v)) ""_(upright(r)) #scale(x: 120%, y: 120%)[\)] upright(bold(Sigma))_0 ∥upright(bold(M)) #scale(x: 120%, y: 120%)[\(] V ""_(upright(r)) \( s \) macron(bold(v)) ""_(upright(r)) #scale(x: 120%, y: 120%)[\)] V ""_(upright(r)) \( s \) macron(bold(v)) ""_(upright(r))∥_(2 \, epsilon) \,\
bold(h) \( macron(bold(v)) ""_(upright(r)) \, s \) & eq.delta upright(bold(H)) \( macron(bold(v)) ""_(upright(r)) \, s \) macron(bold(v)) ""_(upright(r)) \, $) <eq:Hfunct>
with
$upright(bold(H)) : bb(R)^2 times bb(R)_(gt.eq 0) mapsto upright(bold(M))_2 \( bb(R) \)$
reading
#math.equation(block: true, numbering: _ => [(30)], $ upright(bold(H)) \( macron(bold(v)) ""_(upright(r)) \, s \) eq.delta upright(bold(G))^(- 1) #scale(x: 120%, y: 120%)[\(] V ""_(upright(r)) \( s \) macron(bold(v)) ""_(upright(r)) #scale(x: 120%, y: 120%)[\)] upright(bold(M))^2 #scale(x: 120%, y: 120%)[\(] V ""_(upright(r)) \( s \) macron(bold(v)) ""_(upright(r)) #scale(x: 120%, y: 120%)[\)] . $) <eq:matH>
Equation~(28a) is now a PDE, and
more specific a #emph[transport equation]. In addition to the
#emph[initial condition]
(IC)~(28b), it needs to be
supplemented with a BC, as discussed next in Sect.~#link(<sect:BC>)[3.1.2].

=== Boundary condition (BC)
<sect:BC>
In order to formulate an appropriate BC for the
PDE~(28a), the following sets are
introduced:
#math.equation(block: true, numbering: _ => [(31)], $ cal(L) \( s \) & eq.delta partial cal(C)_(-) \( s \) = #scale(x: 180%, y: 180%)[{] bold(x) in partial cal(C) \( s \) #scale(x: 180%, y: 180%)[\|] #scale(x: 120%, y: 120%)[\[] macron(bold(V)) \( bold(x) \, s \) - macron(bold(V))_(partial cal(C)) \( bold(x) \, s \) #scale(x: 120%, y: 120%)[\]] dot.op hat(bold(n))_(partial cal(C)) \( bold(x) \, s \) < 0 #scale(x: 180%, y: 180%)[}] \,\
cal(N) \( s \) & eq.delta partial cal(C)_0 \( s \) = #scale(x: 180%, y: 180%)[{] bold(x) in partial cal(C) \( s \) #scale(x: 180%, y: 180%)[\|] #scale(x: 120%, y: 120%)[\[] macron(bold(V)) \( bold(x) \, s \) - macron(bold(V))_(partial cal(C)) \( bold(x) \, s \) #scale(x: 120%, y: 120%)[\]] dot.op hat(bold(n))_(partial cal(C)) \( bold(x) \, s \) = 0 #scale(x: 180%, y: 180%)[}] \,\
cal(T) \( s \) & eq.delta partial cal(C)_(+) \( s \) = #scale(x: 180%, y: 180%)[{] bold(x) in partial cal(C) \( s \) #scale(x: 180%, y: 180%)[\|] #scale(x: 120%, y: 120%)[\[] macron(bold(V)) \( bold(x) \, s \) - macron(bold(V))_(partial cal(C)) \( bold(x) \, s \) #scale(x: 120%, y: 120%)[\]] dot.op hat(bold(n))_(partial cal(C)) \( bold(x) \, s \) > 0 #scale(x: 180%, y: 180%)[}] \, $) <eq:Inflow0Outflow>
being $hat(bold(n))_(partial cal(C)) \( bold(x) \, s \) in bb(R)^2$ the
outward unit normal to $partial cal(C) \( s \)$, and
$macron(bold(V))_(partial cal(C)) \( bold(x) \, s \) in bb(R)^2$ its
nondimensional velocity. In the literature, the portions
$cal(L) \( s \)$, $cal(N) \( s \)$, and $cal(T) \( s \)$ of the boundary
are traditionally referred to as the #emph[leading], #emph[neutral], and
#emph[trailing edge], respectively.

If the contact area is fixed, that is
$cal(C) \( s \) = cal(C) equiv cal(C)_0$ and
$macron(bold(V))_(partial cal(C)) \( bold(x) \, s \) = bold(0)$, the
mathematical definitions
in~#link(<eq:Inflow0Outflow>)[(31)] simplify to
#math.equation(block: true, numbering: _ => [(32)], $ cal(L) \( s \) & eq.delta partial cal(C)_(-) \( s \) = #scale(x: 120%, y: 120%)[{] bold(x) in partial cal(C) #scale(x: 120%, y: 120%)[\|] macron(bold(V)) \( bold(x) \, s \) dot.op hat(bold(n))_(partial cal(C)) \( bold(x) \) < 0 #scale(x: 120%, y: 120%)[}] \,\
cal(N) \( s \) & eq.delta partial cal(C)_0 \( s \) = #scale(x: 120%, y: 120%)[{] bold(x) in partial cal(C) #scale(x: 120%, y: 120%)[\|] macron(bold(V)) \( bold(x) \, s \) dot.op hat(bold(n))_(partial cal(C)) \( bold(x) \) = 0 #scale(x: 120%, y: 120%)[}] \,\
cal(T) \( s \) & eq.delta partial cal(C)_(+) \( s \) = #scale(x: 120%, y: 120%)[{] bold(x) in partial cal(C) #scale(x: 120%, y: 120%)[\|] macron(bold(V)) \( bold(x) \, s \) dot.op hat(bold(n))_(partial cal(C)) \( bold(x) \) > 0 #scale(x: 120%, y: 120%)[}] \, $) <eq:Inflow0Outflow0>
For a transport equation like
Eq.~(28a), the natural BC should be
prescribed at the inflow boundary, that is, on the leading edge
$cal(L) \( s \)$, for all $s in \( 0 \, S \)$. In particular, enforcing
$bold(z) \( bold(x) \, s \) = bold(0)$, ensures that the bristles enter
the contact area undeformed. For purely elastic materials
($upright(bold(Sigma))_1 = upright(bold(0))$ in
Eq.~#link(<eq:rheol1>)[(2)]), this condition arises naturally
from the continuity of the stresses when transitioning from the free
portions of the bodies to the contact region. Under the assumption of
purely elastic behaviour, continuity of stress is indeed equivalent to
continuity of deformation, which justifies the BC
$bold(z) \( bold(x) \, s \) = bold(0)$. For viscoelastic materials,
however, this equivalence no longer holds. Using, for example,
Eq.~#link(<eq:rheol1>)[(2)], the appropriate boundary
condition would be
$bold(f) \( bold(x) \, s \) = upright(bold(Sigma))_0 bold(z) \( bold(x) \, s \) + V ""_(upright(r)) \( s \) upright(bold(Sigma))_1 frac(upright(d) bold(z) \( bold(x) \, s \), upright(d) s) = bold(0)$
on $cal(L) \( s \)$ for all $s in \( 0 \, S \)$. Despite this, the LuGre
literature has consistently adopted the simpler condition
$bold(z) \( bold(x) \, s \) = bold(0)$. The same approach is adopted
here, both because it leads to a significantly simpler formulation and
because the coefficients of $upright(bold(Sigma))_1$ are typically small
in rolling contact \[#link(<bib-TsiotrasConf>)[62], #link(<bib-Tsiotras1>)[63], #link(<bib-Tsiotras3>)[64], #link(<bib-Deur0>)[65], #link(<bib-Deur1>)[66], #link(<bib-Deur2>)[67]\].

=== Tangential forces and vertical moment
<ect:forces>
To proceed with the determination of the tangential forces and vertical
moment generated by the frictional rolling contact process, with a
little abuse of notation, it is convenient to restate
Eq.~#link(<eq:rheol1>)[(2)] as
#math.equation(block: true, numbering: _ => [(33)], $ bold(f) \( bold(x) \, t \) = upright(bold(Sigma))_0 bold(z) \( bold(x) \, t \) + upright(bold(Sigma))_1 frac(upright(d) bold(z) \( bold(x) \, t \), upright(d) t) \, $) <eq:fxt>
or equivalently, using the travelled distance as independent time-like
variable,
#math.equation(block: true, numbering: _ => [(34)], $ bold(f) \( bold(x) \, s \) = upright(bold(Sigma))_0 bold(z) \( bold(x) \, s \) + V ""_(upright(r)) \( s \) upright(bold(Sigma))_1 frac(upright(d) bold(z) \( bold(x) \, s \), upright(d) s) . $) <eq:fxs>
Equations~#link(<eq:fxt>)[(33)] and~#link(<eq:fxs>)[(34)]
describe the bristle froce per unit of vertical load. Accordingly, the
tangential forces
$bb(R) in.rev bold(F)_(bold(x)) \( s \) = \[ F_x \( s \) #h(0em) F_y \( s \) \]^(upright(T))$
and the vertical moment $M_z \( s \) in bb(R)$ may be computed as
#math.equation(block: true, numbering: _ => [(35)], $ bold(F)_(bold(x)) \( s \) & = integral.double_(cal(C) \( s \)) p \( bold(x) \, s \) bold(f) \( bold(x) \, s \) upright(d) bold(x) \,\
M_z \( s \) & = integral.double_(cal(C) \( s \)) p \( bold(x) \, s \) #scale(x: 120%, y: 120%)[\[] x f_y \( bold(x) \, s \) - y f_x \( bold(x) \, s \) #scale(x: 120%, y: 120%)[\]] upright(d) bold(x) \, quad s in \[ 0 \, S \] \, $) <eq:FandM>
where $p in C^0 \( cal(C) times \[ 0 \, S \] \; bb(R)_(gt.eq 0) \)$
indicates the pressure distribution inside the contact area. A realistic
contact pressure may be expected to be compactly supported (that is,
vanishing on the boundary $partial cal(C)$), but, in many practical
cases, non compactly supported distributions are also adopted, including
the constant or exponentially decreasing ones. These modelling
approaches are mainly motivated by relatively satisfactory agreements
with measured quantities
\[#link(<bib-TsiotrasConf>)[62], #link(<bib-Tsiotras1>)[63], #link(<bib-Tsiotras3>)[64], #link(<bib-Deur0>)[65], #link(<bib-Deur1>)[66], #link(<bib-Deur2>)[67]\].

In any case, it is important to emphasise that the computation of the
vertical moment $M_z \( s \)$ in Eq.~#link(<eq:FandM>)[(35)] is
performed with respect to the undeformed configuration. This is
appropriate when the deformation $bold(z) \( bold(x) \, s \)$ is
sufficiently small or when determining the actual deformed configuration
is impractical, as in the second scenario illustrated in
Fig.~#link(<fig:LumpModel>)[1]. However, when at least one of the bodies in rolling
contact is sufficiently rigid, as in Fig.~#link(<fig:LumpModel>)[1]\(a), the
vertical moment can also be evaluated using the deformed configuration.
In that case, Eq.~(35b) should be
modified as follows:
#math.equation(block: true, numbering: _ => [(36)], $ M_z \( s \) & = integral.double_(cal(C) \( s \)) p \( bold(x) \, s \) #scale(x: 180%, y: 180%)[\[] #scale(x: 120%, y: 120%)[\(] x + z_x \( bold(x) \, s \) #scale(x: 120%, y: 120%)[\)] f_y \( bold(x) \, s \) - #scale(x: 120%, y: 120%)[\(] y + z_y \( bold(x) \, s \) #scale(x: 120%, y: 120%)[\)] f_x \( bold(x) \, s \) #scale(x: 180%, y: 180%)[\]] upright(d) bold(x) \, quad s in \[ 0 \, S \] \, $) <eq:Malt>
whereas~(35a) remains formally unchanged.

Section~#link(<sect:modelRollSimple>)[3.2] below is dedicated to the simplest rolling
contact model that may be deduced from
Eq.~#link(<eq:PDenoMOdel09>)[(28)].

== Standard linear rolling contact model
<sect:modelRollSimple>
Rolling contact models with different orders of complexity may be
derived from Eq.~#link(<eq:PDenoMOdel09>)[(28)] by
appropriately specifying expressions for the (nondimensional) transport
and rigid relative velocities $macron(bold(V)) \( bold(x) \, s \)$ and
$macron(bold(v)) ""_(upright(r)) \( bold(x) \, s \)$. Amongst these, the
simplest variant may be obtained by observing that most rolling contact
processes evolve along a main rolling direction. For instance, in normal
driving conditions, tyres experience limited camber angles and turning
speeds. Similarly, in rail-wheel interactions, geometrical and effective
spin effects are extremely low. In these cases, the transport velocity
appearing in Eq.~#link(<eq:Eulerian>)[(27)] may be fairly
approximately as
$ bold(V) \( bold(x) \, t \) approx - mat(delim: "[", V ""_(upright(r)) \( t \); 0) \, $
and the corresponding nondimensional transport velocity becomes
#math.equation(block: true, numbering: _ => [(38)], $ macron(bold(V)) \( bold(x) \, s \) = macron(bold(V)) = - mat(delim: "[", 1; 0) . $) <eq:VsStandard>
Additionally, the nondimensional rigid relative velocity
$macron(bold(v)) ""_(upright(r)) \( bold(x) \, s \)$ coincides with the
rigid slip velocity
$bb(R)^2 in.rev macron(bold(v)) \( bold(x) \, s \) = \[ macron(v)_x \( bold(x) \, s \) #h(0em) macron(v)_y \( bold(x) \, s \) \]^(upright(T))$
given by
#math.equation(block: true, numbering: _ => [(39)], $ macron(bold(v)) \( bold(x) \, s \) = bold(sigma) \( s \) + upright(bold(A))_phi \( s \) bold(x) \, $) <eq:v0>
where
$bb(R)^2 in.rev bold(sigma) \( s \) = \[ sigma_x \( s \) #h(0em) sigma_y \( s \) \]^(upright(T))$
denotes the #emph[translational slip], and the matrix
$upright(bold(A))_phi \( s \) in upright(bold(M))_2 \( bb(R) \)$ reads
#math.equation(block: true, numbering: _ => [(40)], $ upright(bold(A))_phi \( s \) & eq.delta mat(delim: "[", 0, - phi \( s \); phi \( s \), 0) \, $) <eq:Aphi>
being $phi \( s \) in bb(R)$ the #emph[total spin slip], which is the
sum of the #emph[geometrical spin] $phi_gamma \( s \) in bb(R)$, and the
#emph[effective spin] $phi_psi \( s \)$:
$ phi \( s \) = phi_gamma \( s \) + phi_psi \( s \) . $

Combining the general PDE~#link(<eq:PDenoMOdel09>)[(28)]
with~#link(<eq:VsStandard>)[(38)]-#link(<eq:Aphi>)[(40)]
yields the #emph[standard linear rolling contact model] formalised below
(Model~1).

#model-box([Models 1: Standard linear model], [
#math.equation(block: true, numbering: _ => [(42)], $  & frac(partial bold(z) \( bold(x) \, s \), partial s) - frac(partial bold(z) \( bold(x) \, s \), partial x) = upright(bold(Sigma)) #scale(x: 120%, y: 120%)[\(] macron(bold(v)) \( bold(x) \, s \) \, s #scale(x: 120%, y: 120%)[\)] bold(z) \( bold(x) \, s \) + bold(h) #scale(x: 120%, y: 120%)[\(] macron(bold(v)) \( bold(x) \, s \) \, s #scale(x: 120%, y: 120%)[\)] \, quad bold(x) in accent(cal(C), circle.stroked) \( s \) \, #h(0em) s in \( 0 \, S \) \,\
 & bold(z) \( bold(x) \, s \) = bold(0) \, quad bold(x) in cal(L) \( s \) \, #h(0em) s in \( 0 \, S \) \,\
 & bold(z) \( bold(x) \, 0 \) = bold(z)_0 \( bold(x) \) \, quad bold(x) in accent(cal(C), circle.stroked)_0 . $) <eq:standard0>

]) <stdmodel>
Model~1 represents the FrBD counterpart of the standard brush
models known from the literature, which are also equivalent to Kalker's
simplified theory of rolling contact. In particular, Model~1 is
linear in the variable $bold(z) \( bold(x) \, s \)$, and can be solved
numerically with standard methods for virtually any combination of slip
velocities. For the sequel, it is profitable to introduce the following
functions:
#math.equation(block: true, numbering: _ => [(43)], $ tilde(upright(bold(H))) \( bold(x) \, s \) & eq.delta upright(bold(H)) #scale(x: 120%, y: 120%)[\(] macron(bold(v)) \( bold(x) \, s \) \, s #scale(x: 120%, y: 120%)[\)] \,\
tilde(bold(h)) \( bold(x) \, s \) & eq.delta tilde(upright(bold(H))) \( bold(x) \, s \) macron(bold(v)) \( bold(x) \, s \) = bold(h) #scale(x: 120%, y: 120%)[\(] macron(bold(v)) \( bold(x) \, s \) \, s #scale(x: 120%, y: 120%)[\)] \,\
tilde(upright(bold(Sigma))) \( bold(x) \, s \) & eq.delta upright(bold(Sigma)) #scale(x: 120%, y: 120%)[\(] macron(bold(v)) \( bold(x) \, s \) \, s #scale(x: 120%, y: 120%)[\)] \, $) <eq:Sigmaf0>
so that Eq.~#link(<eq:standard0>)[(42)] may be restated as
#math.equation(block: true, numbering: _ => [(44)], $  & frac(partial bold(z) \( bold(x) \, s \), partial s) - frac(partial bold(z) \( bold(x) \, s \), partial x) = tilde(upright(bold(Sigma))) \( bold(x) \, s \) bold(z) \( bold(x) \, s \) + tilde(bold(h)) \( bold(x) \, s \) \, quad bold(x) in accent(cal(C), circle.stroked) \( s \) \, #h(0em) s in \( 0 \, S \) \,\
 & bold(z) \( bold(x) \, s \) = bold(0) \, quad bold(x) in cal(L) \( s \) \, #h(0em) s in \( 0 \, S \) \,\
 & bold(z) \( bold(x) \, 0 \) = bold(z)_0 \( bold(x) \) \, quad bold(x) in accent(cal(C), circle.stroked)_0 . $) <eq:standard1>
The form~#link(<eq:standard1>)[(44)] is more compact and
amenable to analysis. In fact, due to the term
$tilde(upright(bold(Sigma))) \( bold(x) \, s \)$ being highly nonlinear
in $bold(x)$, it is not possible to derive explicit analytical solutions
to the PDE~#link(<eq:standard1>)[(44)], which makes the
adoption of numerical techniques necessary. With these premises,
Sect.~#link(<sect:wellPosStandard>)[3.2.1] investigates well-posedness of the
PDE~#link(<eq:standard1>)[(44)] considering a fixed contact
area.

=== Well-posedness
<sect:wellPosStandard>
The present section delivers well-posedness results for a simplified
version of Eq.~#link(<eq:standard1>)[(44)], obtained by
assuming a time-invariant contact area. The more general case of a
time-varying contact area may be addressed as explained in \[#link(<bib-Tribology>)[78]\],
after mapping the variable domain into a fixed one. In this paper, the
effect of time-varying vertical forces and contact areas is studied
qualitatively in Sect.~#link(<sect:normVertVar>)[5.2.2], limited to the line contact
case. Proceeding instead with the well-posedness analysis, for a contact
area fixed over time, or equivalently, travelled distance, the
PDE~#link(<eq:standard1>)[(44)] reduces to
#math.equation(block: true, numbering: _ => [(45)], $  & frac(partial bold(z) \( bold(x) \, s \), partial s) - frac(partial bold(z) \( bold(x) \, s \), partial x) = tilde(upright(bold(Sigma))) \( bold(x) \, s \) bold(z) \( bold(x) \, s \) + tilde(bold(h)) \( bold(x) \, s \) \, quad \( bold(x) \, s \) in accent(cal(C), circle.stroked) times \( 0 \, S \) \,\
 & bold(z) \( bold(x) \, s \) = bold(0) \, quad \( bold(x) \, s \) in cal(L) times \( 0 \, S \) \,\
 & bold(z) \( bold(x) \, 0 \) = bold(z)_0 \( bold(x) \) \, quad bold(x) in accent(cal(C), circle.stroked) . $) <eq:standard2>
Well-posedness results for the simplified
Eq.~#link(<eq:standard2>)[(45)] are asserted below by
Theorem~#link(<thm:ex1>)[3.1].

#block[
#strong[Theorem 3.1] (Existence and uniqueness of solutions).
#emph[Suppose that $accent(cal(C), circle.stroked) subset bb(R)^2$ is bounded, with
boundary $partial cal(C)$ piecewise $C^1$. Then, for all
$tilde(upright(bold(Sigma))) in C^0 \( cal(C) times \[ 0 \, S \] \; upright(bold(M))_2 \( bb(R) \) \)$
and
$tilde(bold(h)) in C^0 \( \[ 0 \, S \] \; L^2 \( accent(cal(C), circle.stroked) \; bb(R)^2 \) \)$
as in Eq.~#link(<eq:Sigmaf0>)[(43)], and ICs
$bold(z)_0 in L^2 \( accent(cal(C), circle.stroked) \; bb(R)^2 \)$, the
PDE~#link(<eq:standard2>)[(45)] admits a unique #emph[mild
solution]
$bold(z) in C^0 \( \[ 0 \, S \] \; L^2 \( accent(cal(C), circle.stroked) \; bb(R)^2 \) \)$.
Additionally, if
$tilde(upright(bold(Sigma))) in C^1 \( cal(C) times \[ 0 \, S \] \; upright(bold(M))_2 \( bb(R) \) \)$,
$tilde(bold(h)) in C^1 \( \[ 0 \, S \] \; L^2 \( accent(cal(C), circle.stroked) \; bb(R)^2 \) \)$,
and the IC $bold(z)_0 in H^1 \( accent(cal(C), circle.stroked) \; bb(R)^2 \)$ satisfies
the BC~#link(<eq:standard2>)[(45b)], the solution
is #emph[classical], that is,
$bold(z) in C^1 \( \[ 0 \, S \] \; L^2 \( accent(cal(C), circle.stroked) \; bb(R)^2 \) \) inter C^0 \( \[ 0 \, S \] \; H^1 \( accent(cal(C), circle.stroked) \; bb(R)^2 \) \)$
and satisfies the
BC~#link(<eq:standard2>)[(45b)].]

#block[
#emph[#emph[Proof.] The result follows along the same lines as the proof
of Theorem~#link(<thm:ex2>)[3.2], which is given in Appendix~#link(<app:Proof1>)[A.1].~◻]

]
] <thm:ex1>
Some comments about the regularity of the original matrices and inputs
are as follows:
$upright(bold(M)) in C^0 \( bb(R)^2 \; upright(bold(S y m))_2 \( bb(R) \) \)$
implies
$upright(bold(G)) in C^0 \( bb(R)^2 \; upright(bold(S y m))_2 \( bb(R) \) \)$
for all $epsilon in bb(R)_(gt.eq 0)$, ensuring the existence of mild
solutions for
$macron(bold(v)) in C^0 \( cal(C) times \[ 0 \, S \] \; bb(R)^2 \)$ and
$V ""_(upright(r)) in C^0 \( \[ 0 \, S \] \; \[ V ""_(upright(m i n)) \, V ""_(upright(m a x)) \] \)$.
Additionally,
$upright(bold(M)) in C^1 \( bb(R)^2 \; upright(bold(S y m))_2 \( bb(R) \) \)$
implies
$upright(bold(G)) in C^1 \( bb(R)^2 \; upright(bold(S y m))_2 \( bb(R) \) \)$
for all $epsilon in bb(R)_(> 0)$. Therefore, by composition of
continuously differentiable functions, it follows that
$tilde(upright(bold(Sigma))) in C^1 \( cal(C) times \[ 0 \, S \] \; upright(bold(M))_2 \( bb(R) \) \)$
and
$tilde(bold(h)) in C^1 \( \[ 0 \, S \] \; L^2 \( accent(cal(C), circle.stroked) \; bb(R)^2 \) \)$
for all
$macron(bold(v)) in C^1 \( cal(C) times \[ 0 \, S \] \; bb(R)^2 \)$ and
$V ""_(upright(r)) in C^1 \( \[ 0 \, S \] \; \[ V ""_(upright(m i n)) \, V ""_(upright(m a x)) \] \)$.
Essentially, the regularised rolling contact~Model~1 (with
$epsilon in bb(R)_(> 0)$) admits classical solutions for sufficiently
smooth slip and rolling velocities.

== Semilinear rolling contact model for large spin slips
<sect:semilinear>
Large spin slips give rise to geometric effects that are not accurately
captured by~Model~1. The classes of models introduced below
describe the dynamics of deformable bodies rolling on a rigid, flat
substrate in the presence of substantial spin slip. Their primary
applications include tyre--road interaction and spherical robots. The
same formulations also apply to other elastic rolling contact pairs,
such as wheel-rail systems, but these typically experience only modest
spin slip, making the full theory developed here less relevant in
practice.

In particular, a first spin component distorts the trajectories of the
bristles within the contact area. In the most general case of sideways
rolling, this gives
#math.equation(block: true, numbering: _ => [(46)], $ macron(bold(V)) \( bold(x) \, s \) = - mat(delim: "[", epsilon_y \( s \); - epsilon_x \( s \)) + upright(bold(A))_(phi_1) \( s \) bold(x) \, $) <eq:generalV>
where
$bb(R)^2 in.rev bold(epsilon) \( s \) = \[ epsilon_x \( s \) #h(0em) epsilon_y \( s \) \]^(upright(T))$,
with $∥bold(epsilon) \( s \)∥_2 = 1$, and
$upright(bold(A))_(phi_1) \( s \) in upright(bold(M))_2 \( bb(R) \)$
reads
#math.equation(block: true, numbering: _ => [(47)], $ upright(bold(A))_(phi_1) \( s \) eq.delta mat(delim: "[", 0, phi_1 \( s \); - phi_1 \( s \), 0) . $) <eq:geometricSPinTensor>
In particular, for tyres and railway wheels, there is no sideways
rolling, and therefore $epsilon_y \( s \) = 1$ and
$epsilon_x \( s \) = 0$ in Eq.~#link(<eq:generalV>)[(46)].
The nature of the spin term $phi_1 \( s \) in bb(R)$ appearing in
Eq.~#link(<eq:generalV>)[(46)] depends heavily on the
reciprocal deformative behaviour between the contacting bodies. In the
case where the second body is infinitely rigid compared to the first
one, as it happens in tyre-road interactions,
$phi_1 \( s \) equiv phi_gamma \( s \)$, and the matrix
$upright(bold(A))_(phi_1) \( s \)$ may be fairly referred to as the
#emph[geometric spin tensor]. In contrast, when the two contacting
bodies undergo comparable deformations, as is the case for rail and
wheel,
$phi_1 \( s \) equiv frac(phi_gamma \( s \) - phi_psi \( s \), 2)$. It
is clear that, in the latter situation, $phi_1 \( s \)$ cannot be
interpreted as a pure geometrical spin.

The presence of large spin slips also affects the expression for the
nondimensional rigid relative velocity, which becomes a function of the
bristle deformation according to
#math.equation(block: true, numbering: _ => [(48)], $ macron(bold(v)) ""_(upright(r)) #scale(x: 120%, y: 120%)[\(] bold(z) \( bold(x) \, s \) \, bold(x) \, s #scale(x: 120%, y: 120%)[\)] = macron(bold(v)) \( bold(x) \, s \) + upright(bold(A))_(phi_2) \( s \) bold(z) \( bold(x) \, s \) \, $) <eq:RigidVelSpin>
where $macron(bold(v)) \( bold(x) \, s \)$ reads again as
in~#link(<eq:v0>)[(39)], and
$upright(bold(A))_(phi_2) \( s \) in upright(bold(M))_2 \( bb(R) \)$
reads
#math.equation(block: true, numbering: _ => [(49)], $ upright(bold(A))_(phi_2) \( s \) & eq.delta mat(delim: "[", 0, - phi_2 \( s \); phi_2 \( s \), 0) . $) <eq:turnSpinMatrix>
Again, the specific definition of the spin term $phi_2 \( s \) in bb(R)$
in Eq.~#link(<eq:turnSpinMatrix>)[(49)] is contingent
on the reciprocal deformative behaviour of the contacting bodies. When
one of the two bodies may be regarded as rigid, then
$phi_2 \( s \) equiv phi_psi \( s \)$, and the matrix
$upright(bold(A))_(phi_2) \( s \)$ appearing
in~#link(<eq:RigidVelSpin>)[(48)] may be referred to as
the #emph[effective spin tensor]#footnote[In Vehicle Dynamics, it is
also called #emph[turning tensor] or #emph[turn spin tensor].]\;
#emph[vice versa], in a situation of similarity,
$phi_2 \( s \) equiv - phi_1 \( s \)$. For notational convenience, the
spins $phi_1 \( s \)$ and $phi_2 \( s \)$ may be collected into the
vector#footnote[This definition of $bold(phi) \( s \)$ is simply
convenient for the mathematical analysis of Sect.~#link(<sect:math>)[4]. For a
deformable body rolling over a rigid substrate,
$bold(phi) \( s \) = \[ phi_1 \( s \) #h(0em) phi_2 \( s \) \]^(upright(T)) equiv \[ phi_gamma \( s \) #h(0em) phi_psi \( s \) \]^(upright(T))$,
so that $bold(phi) \( s \)$ is indeed sufficient to completely
characterise spin conditions. Conversely, when the two bodies in rolling
contact exhibit a similar behaviour, the definition
$bold(phi) \( s \) eq.delta \[ phi_gamma \( s \) #h(0em) phi_psi \( s \) \]^(upright(T))$
should be used (since also in this case
$phi \( s \) = phi_gamma \( s \) + phi_psi \( s \)$).]
$bb(R)^2 in.rev bold(phi) \( s \) = \[ phi_1 \( s \) #h(0em) phi_2 \( s \) \]^(upright(T))$.

According to
Eqs.~#link(<eq:generalV>)[(46)]-#link(<eq:turnSpinMatrix>)[(49)],
the #emph[semilinear model for large spin slips] (Model~2)
is formulated below.

#model-box([Models 2: Semilinear model for large spin slips], [
#math.equation(block: true, numbering: _ => [(50a)], $  & frac(partial bold(z) \( bold(x) \, s \), partial s) + #scale(x: 120%, y: 120%)[\(] macron(bold(V)) \( bold(x) \, s \) dot.op nabla_(bold(x)) #scale(x: 120%, y: 120%)[\)] bold(z) \( bold(x) \, s \) = upright(bold(Sigma)) #scale(x: 180%, y: 180%)[\(] macron(bold(v)) ""_(upright(r)) #scale(x: 120%, y: 120%)[\(] bold(z) \( bold(x) \, s \) \, bold(x) \, s #scale(x: 120%, y: 120%)[\)] \, s #scale(x: 180%, y: 180%)[\)] bold(z) \( bold(x) \, s \)\
 & #h(2em) #h(2em) #h(2em) #h(2em) #h(2em) #h(2em) #h(2em) #h(2em) + bold(h) #scale(x: 180%, y: 180%)[\(] macron(bold(v)) ""_(upright(r)) #scale(x: 120%, y: 120%)[\(] bold(z) \( bold(x) \, s \) \, bold(x) \, s #scale(x: 120%, y: 120%)[\)] \, s #scale(x: 180%, y: 180%)[\)] \, quad bold(x) in accent(cal(C), circle.stroked) \( s \) \, #h(0em) s in \( 0 \, S \) \,\
 & bold(z) \( bold(x) \, s \) = bold(0) \, quad bold(x) in cal(L) \( s \) \, #h(0em) s in \( 0 \, S \) \,\
 & bold(z) \( bold(x) \, 0 \) = bold(z)_0 \( bold(x) \) \, quad bold(x) in accent(cal(C), circle.stroked)_0 . $) <eq:semilinear>

]) <semilinmodel>
The above Eq.~#link(<eq:semilinear>)[(50a)] represents a
full semilinear PDE. Its complex structure does not allow for invoking
simple well-posedness results, and a rigorous analysis is beyond the
scope of the present paper. A rich variety of numerical results is,
however, reported in Sect.~#link(<sect:numer>)[5], where the predictions of
Eq.~#link(<eq:semilinear>)[(50a)] are compared to those
obtained using the linear model introduced next in
Sect.~#link(<sect:LinearLargeSpin>)[3.4].

Before moving to Sect.~#link(<sect:LinearLargeSpin>)[3.4], however, it is first
beneficial to draw some considerations about
Eqs.~#link(<eq:generalV>)[(46)]
and~#link(<eq:RigidVelSpin>)[(48)]. These may be
interpreted by introducing the #emph[instantaneous tilting centre]
$C_(phi_1) \( s \)$ with coordinates
#math.equation(block: true, numbering: _ => [(51)], $ bold(x)_(C_(phi_1)) \( s \) = mat(delim: "[", x_(C_(phi_1)) \( s \), y_(phi_1) \( s \))^(upright(T)) eq.delta frac(bold(epsilon) \( s \), phi_1 \( s \)) . $) <eq:xC1>
Utilising~#link(<eq:xC1>)[(51)],
Eq.~#link(<eq:generalV>)[(46)] may be rewritten as
$ macron(bold(V)) \( bold(x) \, s \) = upright(bold(A))_(phi_1) \( s \) #scale(x: 120%, y: 120%)[\(] bold(x) - bold(x)_(C_(phi_1)) \( s \) #scale(x: 120%, y: 120%)[\)] \, $
which states that the trajectories of the bristles inside the contact
patch are instantaneously centred at $C_(phi_1) \( s \)$. For a tyre
rolling over a rigid road, the situation is schematically illustrated in
Fig.~#link(<fig:tireSchematic>)[4], where $C_(phi_1) \( s \) equiv C_gamma \( s \)$
(since $phi_1 \( s \) = phi_gamma \( s \)$). From geometrical
considerations, it is clear that, for a deformable wheel rolling over a
rigid substrate, the point $C_(phi_1) \( s \)$ should always lie outside
of the contact area. In this case, the second spin component represents
an additional contribution to the rigid relative velocity due to
differences in the elastic behaviour of the contact pairs, and should be
regarded as an effective spin component, since deformable bristles only
protrude from the wheel ($phi_2 \( s \) = phi_psi \( s \)$). For
omnidirectional bodies, such as spherical robots, this geometrical
constraint may be violated, but then it becomes unclear how to
distinguish between the tilting and spinning spin components. It seems,
therefore, natural to assume that $C_(phi_1) \( s \)$ should lie outside
$cal(C)$. These considerations were instrumental in deriving explicit
solutions within the simpler theoretical setting offered by the linear
brush models in \[#link(<bib-Meccanica2>)[52], #link(<bib-SphericalWheel>)[53], #link(<bib-LuGreSpin>)[73]\], and will also
prove crucial in Sect.~#link(<sect:InSD0D>)[4.1.1].

In contrast, when the contacting bodies have comparable elastic
properties, as in the case of wheel and rail, the instantaneous tilting
centre $C_(phi_1) \( s \)$ becomes a difference between two signed
curvatures, and, in general, there is no guarantee that it would lie
outside $cal(C)$. However, as already mentioned, railway wheels tend to
experience extremely small spin slips, with the consequence that often
$C_(phi_1) \( s \)$ lies indeed outside the contact area. Moreover, the
fact that $phi_2 \( s \) = - phi_1 \( s \)$ may be explained by
recalling that, conceptually, deformable bristles should be attached to
both bodies (wheel and rail). In such a situation, there exist no real
geometric and effective spins.

#figure(image("figures/wheelTRB.svg", width: 60.0%),
  caption: [
    Schematic of a tyre rolling over a rigid road. For a rigid wheel,
    the spin components would be defined as
    $phi_1 eq.delta frac(sin gamma, R_delta)$ and
    $phi_2 eq.delta - frac(dot(psi), Omega R_delta)$, where
    $gamma in bb(R)$ denotes the camber angle, $dot(psi) in bb(R)$ the
    turning speed, $Omega in bb(R)_(> 0)$ the angular velocity, and
    $R_delta in bb(R)_(> 0)$ the deformed radius. From simple
    trigonometrical considerations, it follows that $C_(phi_1)$ always
    lies outside $cal(C)$. In reality, for a deformable tyre, the spin
    slips are often defined as
    $phi_1 = phi_gamma eq.delta frac(\( 1 - epsilon_gamma \) sin gamma, R ""_(upright(r)))$
    and $phi_2 = phi_psi eq.delta - frac(dot(psi), V ""_(upright(r)))$,
    where $epsilon_gamma in \[ 0 \, 1 \)$ denotes the #emph[camber
    reduction factor], $R ""_(upright(r)) gt.eq R_delta$ the
    #emph[effective rolling radius], and
    $V ""_(upright(r)) in bb(R)_(> 0)$ is the rolling speed. Also in
    this case, $C_(phi_1)$ must necessarily lie outside $cal(C)$.
  ]
)
<fig:tireSchematic>

== Linear rolling contact model for large spin slips
<sect:LinearLargeSpin>
An approximation to the semilinear
PDE~#link(<eq:semilinear>)[(50a)] may be recovered by
conveniently replacing
$macron(bold(v)) ""_(upright(r)) \( bold(z) \( bold(x) \, s \) \, bold(x) \, s \)$
by $macron(bold(v)) \( bold(x) \, s \)$ in the nonlinear functions
$upright(bold(Sigma)) \( dot.op \, dot.op \)$ and
$upright(bold(H)) \( dot.op \, dot.op \)$, yielding the following
#emph[linear model for large spin slips].

#model-box([Models 3: Linear model for large spin slips], [
#math.equation(block: true, numbering: _ => [(53)], $  & frac(partial bold(z) \( bold(x) \, s \), partial s) + #scale(x: 120%, y: 120%)[\(] macron(bold(V)) \( bold(x) \, s \) dot.op nabla_(bold(x)) #scale(x: 120%, y: 120%)[\)] bold(z) \( bold(x) \, s \) = upright(bold(Sigma)) #scale(x: 120%, y: 120%)[\(] macron(bold(v)) \( bold(x) \, s \) \, s #scale(x: 120%, y: 120%)[\)] bold(z) \( bold(x) \, s \)\
 & #h(2em) #h(2em) #h(2em) #h(2em) #h(2em) #h(2em) #h(2em) #h(2em) + upright(bold(H)) #scale(x: 120%, y: 120%)[\(] macron(bold(v)) \( bold(x) \, s \) \, s #scale(x: 120%, y: 120%)[\)] macron(bold(v)) ""_(upright(r)) #scale(x: 120%, y: 120%)[\(] bold(z) \( bold(x) \, s \) \, bold(x) \, s #scale(x: 120%, y: 120%)[\)] \, quad bold(x) in accent(cal(C), circle.stroked) \( s \) \, #h(0em) s in \( 0 \, S \) \,\
 & bold(z) \( bold(x) \, s \) = bold(0) \, quad bold(x) in cal(L) \( s \) \, #h(0em) s in \( 0 \, S \) \,\
 & bold(z) \( bold(x) \, 0 \) = bold(z)_0 \( bold(x) \) \, quad bold(x) in accent(cal(C), circle.stroked)_0 . $) <eq:linwasdir>

]) <linmodel2>
As opposed to~#link(<eq:semilinear>)[(50a)],
Eq.~(53a) is linear in the variable
$bold(z) \( bold(x) \, s \)$, which permits establishing key results
regarding the well-posedness and stability of~Model~3. In fact,
for $epsilon = 0$, linearising
Eq.~(53a) around the equilibrium
$\( bold(z)^star.op \( bold(x) \) \, macron(bold(v))^star.op \( bold(x) \) \) = \( bold(0) \, bold(0) \) in bb(R)^4$
yields the same models analysed in \[#link(<bib-Meccanica2>)[52], #link(<bib-SphericalWheel>)[53]\], which
admit closed-form solutions for certain simple contact shapes both in
steady-state and transient conditions. Moreover, the simplified
PDE~(53a) may serve as a foundation
for fixed-point algorithms designed to iteratively approximate the
solution of~#link(<eq:semilinear>)[(50a)].

For what follows, and in the same spirit of Sect.~#link(<sect:modelRollSimple>)[3.2],
the following functions are introduced:
#math.equation(block: true, numbering: _ => [(54)], $ tilde(upright(bold(H))) \( bold(x) \, s \) & eq.delta upright(bold(H)) #scale(x: 120%, y: 120%)[\(] macron(bold(v)) \( bold(x) \, s \) \, s #scale(x: 120%, y: 120%)[\)] \,\
tilde(bold(h)) \( bold(x) \, s \) & eq.delta tilde(upright(bold(H))) \( bold(x) \, s \) macron(bold(v)) \( bold(x) \, s \) = bold(h) #scale(x: 120%, y: 120%)[\(] macron(bold(v)) \( bold(x) \, s \) \, s #scale(x: 120%, y: 120%)[\)] \,\
tilde(upright(bold(Sigma)))_phi \( bold(x) \, s \) & eq.delta upright(bold(Sigma)) #scale(x: 120%, y: 120%)[\(] macron(bold(v)) \( bold(x) \, s \) \, s #scale(x: 120%, y: 120%)[\)] + tilde(upright(bold(H))) \( bold(x) \, s \) upright(bold(A))_(phi_2) \( s \) . $) <eq:functionsH>
Utilising~#link(<eq:functionsH>)[(54)],
Eq.~#link(<eq:linwasdir>)[(53)] may be recast more
conveniently as
#math.equation(block: true, numbering: _ => [(55)], $  & frac(partial bold(z) \( bold(x) \, s \), partial s) + #scale(x: 120%, y: 120%)[\(] macron(bold(V)) \( bold(x) \, s \) dot.op nabla_(bold(x)) #scale(x: 120%, y: 120%)[\)] bold(z) \( bold(x) \, s \) = tilde(upright(bold(Sigma)))_phi \( bold(x) \, s \) bold(z) \( bold(x) \, s \) + tilde(bold(h)) \( bold(x) \, s \) \, quad bold(x) in accent(cal(C), circle.stroked) \( s \) \, #h(0em) s in \( 0 \, S \) \,\
 & bold(z) \( bold(x) \, s \) = bold(0) \, quad bold(x) in cal(L) \( s \) \, #h(0em) s in \( 0 \, S \) . $) <eq:linearLargeSpinform2>
The form~#link(<eq:linearLargeSpinform2>)[(55)]
is more amenable to mathematical analysis. The next Sect.~#link(<sect:wllPops2>)[3.4.1]
is dedicated to inferring well-posedness and stability properties
for~#link(<eq:linearLargeSpinform2>)[(55)] under
additional assumptions on the domain $accent(cal(C), circle.stroked) \( s \)$ the
transport velocity $macron(bold(V)) \( bold(x) \, s \)$.

Before moving to Sect.~#link(<sect:wllPops2>)[3.4.1], it is worth commenting on the
predictive capabilities of~Model~3 in relation to those
of~1 and~2. In this context, the first observation
concerns the equivalence between the
PDEs~#link(<eq:semilinear>)[(50a)]
and~(53a) for
$phi_2 \( s \) approx 0$, even in the presence of large components
$phi_1 \( s \)$. Essentially, in the context of tyre-road
interactions,~Model~3 can be employed to study the effect of
large camber angles and moderate turn spins. Of course, since the
bristle deformation $bold(z) \( bold(x) \, s \)$ may be expected to be
small, Eq.~(53a) should constitute a
sufficiently good approximation
to~#link(<eq:semilinear>)[(50a)] even when the second spin
component is non-negligible ($phi_2 \( s \) = phi_psi \( s \)$ for tyres
and spherical robots). For wheel-rail systems, small values of
$phi_2 \( s \)$ automatically imply small $phi_1 \( s \)$, and hence the
predictive capabilities of~Model~3 coincide with those
of~1 for $phi_2 \( s \) approx 0$. In fact, Model~1 is
typically sufficient when it comes to describing wheel-rail rolling
contact phenomena.

=== Well-posedness
<sect:wllPops2>
Existence and uniqueness results for~Model~3 are stated under
the assumption that the contact area and the transport velocity are
time-independent. Accordingly, the
PDE~#link(<eq:linearLargeSpinform2>)[(55)] is
reformualted as
#math.equation(block: true, numbering: _ => [(57)], $  & frac(partial bold(z) \( bold(x) \, s \), partial s) + #scale(x: 120%, y: 120%)[\(] macron(bold(V)) \( bold(x) \) dot.op nabla_(bold(x)) #scale(x: 120%, y: 120%)[\)] bold(z) \( bold(x) \, s \) = tilde(upright(bold(Sigma)))_phi \( bold(x) \, s \) bold(z) \( bold(x) \, s \) + tilde(bold(h)) \( bold(x) \, s \) \, quad \( bold(x) \, s \) in accent(cal(C), circle.stroked) times \( 0 \, S \) \,\
 & bold(z) \( bold(x) \, s \) = bold(0) \, quad \( bold(x) \, s \) in cal(L) times \( 0 \, S \) \,\
 & bold(z) \( bold(x) \, 0 \) = bold(z)_0 \( bold(x) \) \, quad bold(x) in accent(cal(C), circle.stroked) \, $) <eq:quasiStationary0>
with the nondimensional transport velocity
$macron(bold(V)) \( bold(x) \)$ given, in the most general case, by
#math.equation(block: true, numbering: _ => [(58)], $ macron(bold(V)) \( bold(x) \) = - mat(delim: "[", epsilon_y; - epsilon_x) + upright(bold(A))_(phi_1) bold(x) . $) <eq:Vss>
Accordingly, well-posedness results are enounced in Theorem~#link(<thm:ex2>)[3.2]
below.

#block[
#strong[Theorem 3.2] (Existence and uniqueness of solutions).
#emph[Suppose that $macron(bold(V)) in C^1 \( cal(C) \; bb(R)^2 \)$
reads as in Eq.~#link(<eq:Vss>)[(58)], and that
$accent(cal(C), circle.stroked) subset bb(R)^2$ is bounded, with boundary
$partial cal(C)$ piecewise $C^1$. Then, for all
$tilde(upright(bold(Sigma)))_phi in C^0 \( cal(C) times \[ 0 \, S \] \; upright(bold(M))_2 \( bb(R) \) \)$
and
$tilde(bold(h)) in C^0 \( \[ 0 \, S \] \; L^2 \( accent(cal(C), circle.stroked) \; bb(R)^2 \) \)$
as in Eq.~#link(<eq:functionsH>)[(54)], and ICs
$bold(z)_0 in L^2 \( accent(cal(C), circle.stroked) \; bb(R)^2 \)$, the
PDE~#link(<eq:quasiStationary0>)[(57)] admits a
unique mild solution
$bold(z) in C^0 \( \[ 0 \, S \] \; L^2 \( accent(cal(C), circle.stroked) \; bb(R)^2 \) \)$.
Additionally, if
$tilde(upright(bold(Sigma)))_phi in C^1 \( cal(C) times \[ 0 \, S \] \; upright(bold(M))_2 \( bb(R) \) \)$,
$tilde(bold(h)) in C^1 \( \[ 0 \, S \] \; L^2 \( accent(cal(C), circle.stroked) \; bb(R)^2 \) \)$,
and the IC $bold(z)_0 in H^1 \( accent(cal(C), circle.stroked) \; bb(R)^2 \)$ satisfies
the BC~#link(<eq:quasiStationary0>)[(57b)], the solution is
classical, that is,
$bold(z) in C^1 \( \[ 0 \, S \] \; L^2 \( accent(cal(C), circle.stroked) \; bb(R)^2 \) \) inter C^0 \( \[ 0 \, S \] \; H^1 \( accent(cal(C), circle.stroked) \; bb(R)^2 \) \)$
and satisfies the BC~#link(<eq:quasiStationary0>)[(57b)].]

#block[
#emph[#emph[Proof.] See Appendix~#link(<app:Proof1>)[A.1].~◻]

]
] <thm:ex2>
Compared to the smoothness requirements for the well-posedness
of~Model~1, it may be realised that Theorem~#link(<thm:ex2>)[3.2] demands
additionally $bold(phi) in bb(R) times C^0 \( \[ 0 \, S \] \; bb(R) \)$
for mild solutions, and
$bold(phi) in bb(R) times C^1 \( \[ 0 \, S \] \; bb(R) \)$ (with
regularisation parameter $epsilon in bb(R)_(> 0)$) for classical
solutions. This concludes the presentation of the three rolling contact
models with FrBD friction. The next Sect.~#link(<sect:math>)[4] is devoted to
investigating the stability and passivity of~Model~1
and~3 (or, more precisely,
Eqs.~#link(<eq:standard2>)[(45)]
and~#link(<eq:quasiStationary0>)[(57)]).

= Mathematical properties
<sect:math>
The present section studies some important mathematical features of
Eqs.~#link(<eq:standard2>)[(45)]
and~#link(<eq:quasiStationary0>)[(57)]. More
specifically, stability is discussed in Sect.~#link(<sect:stability>)[4.1], whereas
Sect.~#link(<sect:diss>)[4.2] focuses on dissipativity and passivity. The analysis is
conducted with particular attention to the physical interpretation of
these mathematical properties.

== Stability
<sect:stability>
Stability is discussed concerning both the input-to-state and
input-to-output behaviours. For the systems described by
Eqs.~#link(<eq:standard2>)[(45)]
and~#link(<eq:quasiStationary0>)[(57)] with
output~#link(<eq:FandM>)[(35)]
(resp.~(35a)
and~#link(<eq:Malt>)[(36)]), the notions of input-to-state and
input-to-output stability are formalised according to
Definitions~#link(<def:ISS>)[4.1] and~#link(<def:IOS>)[4.2] below, which are formulated for
classical solutions of~#link(<eq:standard2>)[(45)]
and~#link(<eq:quasiStationary0>)[(57)], and regarding
the rigid slip velocity $macron(bold(v)) \( bold(x) \, s \)$ as an
input.

#block[
#strong[Definition 4.1] (Input-to-state-stability (ISS)). #emph[The
PDE~#link(<eq:standard2>)[(45)]
(resp.~#link(<eq:quasiStationary0>)[(57)]) is called
(uniformly) #emph[input-to-state stable] (ISS) in the spatial $L^2$-norm
if, for all inputs
$macron(bold(v)) in C^1 \( cal(C) times bb(R)_(gt.eq 0) \; bb(R)^2 \) inter L^oo \( cal(C) times bb(R)_(gt.eq 0) \; bb(R)^2 \)$,
rolling speeds
$V ""_(upright(r)) in C^1 \( bb(R)_(gt.eq 0) \; \[ V ""_(upright(m i n)) \, V ""_(upright(m a x)) \] \)$,
spins
$bold(phi) in bb(R) times C^1 \( bb(R)_(gt.eq 0) \; bb(R) \) inter bb(R) times L^oo \( bb(R)_(gt.eq 0) \; bb(R) \)$,
and ICs $bold(z)_0 in H^1 \( accent(cal(C), circle.stroked) \; bb(R)^2 \)$ satisfying
the BC~#link(<eq:standard2>)[(45b)]
(resp.~#link(<eq:quasiStationary0>)[(57b)]), there exist
functions $beta in cal(K L)$ and $gamma in cal(K)_oo$ such that
#math.equation(block: true, numbering: _ => [(59)], $ ∥bold(z) \( dot.op \, s \)∥_(L^2 \( accent(cal(C), circle.stroked) \; bb(R)^2 \)) & lt.eq beta #scale(x: 180%, y: 180%)[\(] ∥bold(z)_0 \( dot.op \)∥_(L^2 \( accent(cal(C), circle.stroked) \; bb(R)^2 \)) \, s #scale(x: 180%, y: 180%)[\)] + gamma #scale(x: 180%, y: 180%)[\(] ∥macron(bold(v)) \( dot.op \, dot.op \)∥_oo #scale(x: 180%, y: 180%)[\)] \, quad s in bb(R)_(gt.eq 0) . $) <eq:ISSbetaGamma>]

] <def:ISS>
#block[
#strong[Definition 4.2] (Input-to-output stability (IOS)). #emph[The
PDE~#link(<eq:standard2>)[(45)]
(resp.~#link(<eq:quasiStationary0>)[(57)]) with
output~#link(<eq:FandM>)[(35)]
(resp.~(35a)
and~#link(<eq:Malt>)[(36)]) is called #emph[input-to-output
stable] (IOS) if, for all inputs
$macron(bold(v)) in C^1 \( cal(C) times bb(R)_(gt.eq 0) \; bb(R)^2 \) inter L^oo \( cal(C) times bb(R)_(gt.eq 0) \; bb(R)^2 \)$,
rolling speeds
$V ""_(upright(r)) in C^1 \( bb(R)_(gt.eq 0) \; \[ V ""_(upright(m i n)) \, V ""_(upright(m a x)) \] \)$,
spins
$bold(phi) in bb(R) times C^1 \( bb(R)_(gt.eq 0) \; bb(R) \) inter bb(R) times L^oo \( bb(R)_(gt.eq 0) \; bb(R) \)$,
and ICs $bold(z)_0 in H^1 \( accent(cal(C), circle.stroked) \; bb(R)^2 \)$ satisfying
the BC~#link(<eq:standard2>)[(45b)]
(resp.~#link(<eq:quasiStationary0>)[(57b)]), there exist
functions $beta in cal(K L)$ and $alpha in cal(K)$ such that
#math.equation(block: true, numbering: _ => [(60)], $ ∥#scale(x: 120%, y: 120%)[\(] bold(F)_(bold(x)) \( s \) \, M_z \( s \) #scale(x: 120%, y: 120%)[\)]∥_2 & lt.eq beta #scale(x: 180%, y: 180%)[\(] ∥bold(z)_0 \( dot.op \)∥_(L^2 \( accent(cal(C), circle.stroked) \; bb(R)^2 \)) \, s #scale(x: 180%, y: 180%)[\)] + alpha #scale(x: 180%, y: 180%)[\(] ∥macron(bold(v)) \( dot.op \, dot.op \)∥_oo #scale(x: 180%, y: 180%)[\)] \, quad s in bb(R)_(gt.eq 0) . $) <eq:FBBBBBBSS>]

] <def:IOS>
The above definitions, inspired from \[#link(<bib-Khalil>)[79], #link(<bib-Prieur>)[80]\], are contingent on
the specific systems considered in the paper; a modern, exhaustive
introduction to the notions of ISS and #emph[integral input-to-state
stability] (iISS) for infinite-dimensional systems may be instead found
in \[#link(<bib-Prieur>)[80]\]. It is also worth stressing that Definitions~#link(<def:ISS>)[4.1]
and~#link(<def:IOS>)[4.2] have been enounced concerning the simplified
PDEs~#link(<eq:standard2>)[(45)]
and~#link(<eq:quasiStationary0>)[(57)], which, in
contrast to~Model~1 and~3, are postulated on fixed
spatial domains and consider a constant transport velocity. Indeed, for
these equations, well-posedness was established by Theorems~#link(<thm:ex1>)[3.1]
and~#link(<thm:ex2>)[3.2], which cover both classical and mild solutions. Some of the
results advocated in the sequel may, however, be extended to the case of
time-varying domains and transport velocities, albeit not without
additional difficulties. In this context, it should be clarified that
effects associated with variable normal forces and contact areas are not
primarily related to the notions of stability and dissipativity for the
(rolling) friction model; this is another reason why such dynamics are
disregarded in the following analyses.

Finally, it is worth commenting on the choice of identifying
$macron(bold(v)) \( bold(x) \, s \)$ as the main input to the
PDEs~#link(<eq:standard2>)[(45)]
and~#link(<eq:quasiStationary0>)[(57)]. Concerning
specifically Eq.~#link(<eq:standard2>)[(45)], it is clear
that, for a constant rolling velocity, the rigid relative velocity
constitutes indeed the only input, and incorporates all the information
about the translational slips $bold(sigma) \( s \)$ and the total spin
$phi \( s \)$. For
Eq.~#link(<eq:quasiStationary0>)[(57)], this is not
true anymore, since the spin input $bold(phi) \( s \)$ enters the PDE
nonlinearly, causing additional terms to appear in the transport
velocity. Additionally,
$macron(bold(v)) ""_(upright(r)) \( bold(z) \( bold(x) \, s \) \, bold(x) \, s \) eq.not macron(bold(v)) \( bold(x) \, s \)$,
and, more generally, the tuple
$\( bold(sigma) \( s \) \, bold(phi) \( s \) \, V ""_(upright(r)) \( s \) \) in bb(R)^5$
should be regarded as the real input to
Eq.~#link(<eq:quasiStationary0>)[(57)]. However,
since there exists a constant $chi in bb(R)_(> 0)$ such that
$∥macron(bold(v)) \( dot.op \, dot.op \)∥_oo lt.eq chi ∥\( bold(sigma) \( dot.op \) \, bold(phi) \( dot.op \) \, V ""_(upright(r)) \( dot.op \) \)∥_oo$,
the ISS and IOS inequalities of the
type~#link(<eq:ISSbetaGamma>)[(59)]
and~#link(<eq:FBBBBBBSS>)[(60)] may always be reformualted
in terms of
$\( bold(sigma) \( s \) \, bold(phi) \( s \) \, V ""_(upright(r)) \( s \) \)$.

With these premises, ISS and IOS are enounced respectively in
Sects.~#link(<sect:InSD0D>)[4.1.1] and~#link(<sect:IOS>)[4.1.2].

=== Input-to-state stability
<sect:InSD0D>
Concerning both the PDEs~#link(<eq:standard2>)[(45)]
and~#link(<eq:quasiStationary0>)[(57)], ISS results
are asserted by Lemma~#link(<lemma:boundedness>)[4.1] below.

#block[
#strong[Lemma 4.1] (Input-to-state stability (ISS)). #emph[Suppose that
$cal(C) subset bb(R)^2$ is nonempty and compact. Then, the
PDE~#link(<eq:standard2>)[(45)] is (uniformly) ISS in the
spatial $L^2$-norm. For the
PDE~#link(<eq:quasiStationary0>)[(57)], assume
additionally that the point $C_(phi_1)$ with coordinate
$bold(x)_(C_(phi_1)) = bold(epsilon) \/ phi_1$ lies outside $cal(C)$,
and that $cal(C)$ is strictly separable from $C_(phi_1)$ by a line,
i.e., there exists a vector
$bb(R)^2 in.rev macron(bold(nu)) = \[ macron(nu)_x #h(0em) - macron(nu)_y \]^(upright(T)) eq.not bold(0)$
and a constant $macron(eta) in bb(R)_(> 0)$ such that
#math.equation(block: true, numbering: _ => [(61)], $ macron(N) \( bold(x) \) eq.delta macron(bold(nu)) dot.op #scale(x: 120%, y: 120%)[\(] bold(x) - bold(x)_(C_(phi_1)) #scale(x: 120%, y: 120%)[\)] < - macron(eta) \, quad bold(x) in cal(C) . $) <eq:N>
Then, the PDE~#link(<eq:quasiStationary0>)[(57)] is
also (uniformly) ISS in the spatial $L^2$-norm.]

#block[
#emph[#emph[Proof.] See Appendix~#link(<app:Proof2>)[A.2].~◻]

]
] <lemma:boundedness>
The separation condition expressed by Eq.~#link(<eq:N>)[(61)] in
Lemma~#link(<lemma:boundedness>)[4.1] is reminiscent of the discussion already
initiated in Sect.~#link(<sect:semilinear>)[3.3]. As noted earlier, the instantaneous
tilting centre $C_(phi_1)$ (which in this case is fixed) must lie
outside the contact area. If this holds, and if one can draw a line
through $C_(phi_1)$ that does not intersect $cal(C)$, then the
PDE~#link(<eq:quasiStationary0>)[(57)] can be shown
to be ISS. In essence, this condition ensures that spinning effects do
not dominate the rolling dynamics. Of course, the
PDE~#link(<eq:standard2>)[(45)] implicitly assume small spin
slips, and therefore the separation condition of
Eq.~#link(<eq:N>)[(61)] is not formally needed.

Lemma~#link(<lemma:boundedness>)[4.1] is also instrumental in showing the IOS of the
PDEs~#link(<eq:standard2>)[(45)]
and~#link(<eq:quasiStationary0>)[(57)]#footnote[In
this context, it should be observed that, whilst this paper is mainly
concerned with ISS and IOS, suitable iISS estimates \[#link(<bib-Prieur>)[80]\] may also be
derived .], which is addressed next in Sect.~#link(<sect:IOS>)[4.1.2].

=== Input-to-output stability
<sect:IOS>
Intuitively, bounded bristle deformations should also produce bounded
tangential forces and vertical moments. This is the interpretation of
the IOS bound~#link(<eq:FBBBBBBSS>)[(60)]. For coherence, in
what follows, it is assumed that
$p \( bold(x) \, s \) = p \( bold(x) \)$, with
$p in C^0 \( cal(C) \; bb(R)_(gt.eq 0) \)$ (the contact area is
automatically supposed to be fixed over time, or equivalently, travelled
distance, as required by the
PDEs~#link(<eq:standard2>)[(45)]
and~#link(<eq:quasiStationary0>)[(57)]). Accordingly,
from Eq.~(35a) and the conditions
$macron(bold(v)) in C^0 \( cal(C) times bb(R)_(gt.eq 0) \; bb(R)^2 \) inter L^oo \( cal(C) times bb(R)_(gt.eq 0) \; bb(R)^2 \)$,
$V ""_(upright(r)) in C^0 \( bb(R)_(gt.eq 0) \; \[ V ""_(upright(m i n)) \, V ""_(upright(m a x)) \] \)$,
and
$bold(phi) in bb(R) times C^0 \( bb(R)_(gt.eq 0) \; bb(R) \) inter bb(R) times L^oo \( bb(R)_(gt.eq 0) \; bb(R) \)$,
it is possible to infer the existence of constants
$beta_1 \, alpha_1 in bb(R)_(> 0)$ such that
#math.equation(block: true, numbering: _ => [(62)], $ ∥bold(F)_(bold(x)) \( s \)∥_2 lt.eq beta_1 ∥bold(z) \( dot.op \, s \)∥_(L^2 \( accent(cal(C), circle.stroked) \; bb(R)^2 \)) + alpha_1 ∥macron(bold(v)) \( dot.op \, dot.op \)∥_oo \, quad s in bb(R)_(gt.eq 0) . $) <eq:Fbound>
Similarly, from Eqs.~(35b)
and~#link(<eq:Malt>)[(36)], it follows the existence of
$beta_2 \, alpha_2 in bb(R)_(> 0)$ and
$beta_3 \, alpha_3 in bb(R)_(gt.eq 0)$ satisfying
#math.equation(block: true, numbering: _ => [(63)], $ lr(|M_z \( s \)|) & lt.eq beta_2 ∥bold(z) \( dot.op \, s \)∥_(L^2 \( accent(cal(C), circle.stroked) \; bb(R)^2 \)) + beta_3 ∥bold(z) \( dot.op \, s \)∥_(L^2 \( accent(cal(C), circle.stroked) \; bb(R)^2 \))^2 + alpha_2 ∥macron(bold(v)) \( dot.op \)∥_oo + alpha_3 ∥macron(bold(v)) \( dot.op \, dot.op \)∥_oo^2 \, quad s in bb(R)_(gt.eq 0) \, $) <eq:Mbound>
with $beta_3 = alpha_3 = 0$ for~(35b).

Combining Eqs.~#link(<eq:Fbound>)[(62)]
and~#link(<eq:Mbound>)[(63)]
with~#link(<eq:ISSbetaGamma>)[(59)], and exploiting the
fact that all the norms are equivalent in finite-dimensional spaces,
gives IOS for all
$bold(z) \( dot.op \, s \) in L^2 \( accent(cal(C), circle.stroked) \; bb(R)^2 \)$. This
simple result is formalised in Corollary~#link(<corollary:IOS>)[4.1] below.

#block[
#strong[Corollary 1] (Input-to-output stability (IOS)). #emph[Suppose
that $p \( bold(x) \, s \) = p \( bold(x) \)$, with
$p in C^0 \( cal(C) \; bb(R)_(gt.eq 0) \)$. Then, under the
corresponding assumptions as Lemma~#link(<lemma:boundedness>)[4.1], the
PDE~#link(<eq:standard2>)[(45)]
(resp.~#link(<eq:quasiStationary0>)[(57)]) with
output~#link(<eq:FandM>)[(35)]
(resp.~(35a)
and~#link(<eq:Malt>)[(36)]) is IOS.]

] <corollary:IOS>
#block[
#strong[Remark 4.1]. #emph[As explained in detail in \[#link(<bib-DistrLuGre>)[81]\],
replacing the total derivatives appearing in
Eqs.~#link(<eq:fxt>)[(33)] and~#link(<eq:fxs>)[(34)] with
the partial one would preclude a similar result to that asserted by
Corollary~#link(<corollary:IOS>)[4.1].]

] <Remark:oododo>
Remark~#link(<Remark:oododo>)[4.1] concludes the stability analysis of the systems
described by Eqs.~#link(<eq:standard2>)[(45)]
and~#link(<eq:quasiStationary0>)[(57)]. The following
Sect.~#link(<sect:diss>)[4.2] examines their dissipativity and passivity properties.

== Dissipativity and passivity
<sect:diss>
The notion of passivity relates to important physical properties of a
friction model. Before stating its mathematical definition in the
context of this paper, it is beneficial to clarify certain aspects
regarding the power dissipation at the interface between the contacting
bodies. This is done with respect to~Model~1 and~3
separately. For simplicity, in the sequel, the contact area is supposed
to be fixed, although the conclusions of the following analysis are
formally independent of this assumption. First, Model~1 with
output~#link(<eq:FandM>)[(35)] is considered. Accordingly, the
dissipated power per unit of speed may be calculated as
#math.equation(block: true, numbering: _ => [(64)], $ #scale(x: 120%, y: 120%)[chevron.l] p \( bold(x) \) bold(f) \( dot.op \, s \) \, macron(bold(v)) ""_(upright(r)) \( dot.op \, s \) #scale(x: 120%, y: 120%)[chevron.r]_(L^2 \( accent(cal(C), circle.stroked) \; bb(R)^2 \)) & = #scale(x: 120%, y: 120%)[chevron.l] p \( bold(x) \) bold(f) \( dot.op \, s \) \, macron(bold(v)) \( dot.op \, s \) #scale(x: 120%, y: 120%)[chevron.r]_(L^2 \( accent(cal(C), circle.stroked) \; bb(R)^2 \)) = integral.double_(cal(C)) p \( bold(x) \) bold(f)^(upright(T)) \( bold(x) \, s \) macron(bold(v)) \( bold(x) \, s \) upright(d) bold(x)\
 & = integral.double_(cal(C)) p \( bold(x) \) bold(f)^(upright(T)) \( bold(x) \, s \) bold(sigma) \( s \) upright(d) bold(x) + integral.double_(cal(C)) p \( bold(x) \) #scale(x: 120%, y: 120%)[\[] x f_y \( bold(x) \, s \) - y f_x \( bold(x) \, s \) #scale(x: 120%, y: 120%)[\]] phi \( s \) upright(d) bold(x)\
 & = bold(F)_(bold(x))^(upright(T)) \( s \) bold(sigma) \( s \) + M_z \( s \) phi \( s \) \, quad s in \[ 0 \, S \] . $) <eq:Ppass>
Equation~#link(<eq:Ppass>)[(64)] yields the expected result,
consistent with previous literature: the total power dissipated is given
by the product between the tangential forces and vertical moment,
$\( bold(F)_(bold(x)) \( s \) \, M_z \( s \) \) in bb(R)^3$, and the
translational and total spin slips,
$\( bold(sigma) \( s \) \, phi \( s \) \) in bb(R)^3$. This outcome is
unsurprising, as under the assumption of sufficiently small spins, the
slip and spin variables indeed act as the dual quantities of the
tangential forces and vertical moment. It is worth emphasising that the
final equivalence in Eq.~#link(<eq:Ppass>)[(64)] was obtained by
evaluating the vertical equilibrium in the undeformed configuration.
Conversely, when the bristle deformation $bold(z) \( bold(x) \, s \)$ is
relatively large, and the deformed configuration can be identified
uniquely, the vertical equilibrium may be evaluated
using~(35a). Considering
again~Model~1, this leads to
#math.equation(block: true, numbering: _ => [(65)], $ #scale(x: 120%, y: 120%)[chevron.l] p \( bold(x) \) bold(f) \( dot.op \, s \) \, macron(bold(v)) ""_(upright(r)) \( dot.op \, s \) #scale(x: 120%, y: 120%)[chevron.r]_(L^2 \( accent(cal(C), circle.stroked) \; bb(R)^2 \)) & = bold(F)_(bold(x))^(upright(T)) \( s \) bold(sigma) \( s \) + M_z \( s \) phi \( s \)\
 & quad - phi \( s \) integral.double_(cal(C)) p \( bold(x) \) #scale(x: 120%, y: 120%)[\[] z_x \( bold(x) \, s \) f_y \( bold(x) \, s \) - z_y \( bold(x) \, s \) f_x \( bold(x) \, s \) #scale(x: 120%, y: 120%)[\]] upright(d) bold(x) \, quad s in \[ 0 \, S \] \, $) <eq:Ppass0>
which removes a dissipation term proportional to the total spin
$phi \( s \)$ (additional spin contributions felt by the bristle's tip
have been neglected).

Employing instead~Model~1, and considering situations in which
one of the two bodies is rigid, such as in the case of tyre-road
interaction ($phi_1 \( s \) = phi_gamma \( s \)$ and
$phi_2 \( s \) = phi_psi \( s \)$), the vertical equilibrium may be
evaluated using either Eq.~#link(<eq:FandM>)[(35)]
or~(35a). Specifically,
considering~Model~1 with output~#link(<eq:FandM>)[(35)],
similar calculations as previously yield
#math.equation(block: true, numbering: _ => [(66)], $  & #scale(x: 120%, y: 120%)[chevron.l] p \( bold(x) \) bold(f) \( dot.op \, s \) \, macron(bold(v)) ""_(upright(r)) \( bold(z) \( dot.op \, s \) \, dot.op \, s \) #scale(x: 120%, y: 120%)[chevron.r]_(L^2 \( accent(cal(C), circle.stroked) \; bb(R)^2 \)) = bold(F)_(bold(x))^(upright(T)) \( s \) bold(sigma) \( s \) + M_z \( s \) phi \( s \)\
 & #h(2em) #h(2em) quad + phi_psi \( s \) integral.double_(cal(C)) p \( bold(x) \) #scale(x: 120%, y: 120%)[\[] z_x \( bold(x) \, s \) f_y \( bold(x) \, s \) - z_y \( bold(x) \, s \) f_x \( bold(x) \, s \) #scale(x: 120%, y: 120%)[\]] upright(d) bold(x) \, quad s in \[ 0 \, S \] . $) <eq:Ppass2>
On the other hand, when the vertical equilibrium is computed according
to Eq.~(35a), the following expression is
obtained:
#math.equation(block: true, numbering: _ => [(67)], $  & #scale(x: 120%, y: 120%)[chevron.l] p \( bold(x) \) bold(f) \( dot.op \, s \) \, macron(bold(v)) ""_(upright(r)) \( bold(z) \( dot.op \, s \) \, dot.op \, s \) #scale(x: 120%, y: 120%)[chevron.r]_(L^2 \( accent(cal(C), circle.stroked) \; bb(R)^2 \)) = bold(F)_(bold(x))^(upright(T)) \( s \) bold(sigma) \( s \) + M_z \( s \) phi \( s \)\
 & #h(2em) #h(2em) quad - phi_gamma \( s \) integral.double_(cal(C)) p \( bold(x) \) #scale(x: 120%, y: 120%)[\[] z_x \( bold(x) \, s \) f_y \( bold(x) \, s \) - z_y \( bold(x) \, s \) f_x \( bold(x) \, s \) #scale(x: 120%, y: 120%)[\]] upright(d) bold(x) \, quad s in \[ 0 \, S \] . $) <eq:Ppass3>
Equations~#link(<eq:Ppass2>)[(66)]
and~#link(<eq:Ppass3>)[(67)], which apply when one of the
bodies in rolling contact is rigid, differ in how they treat the
geometric and effective spin terms. In essence,
Eq.~#link(<eq:Ppass2>)[(66)] includes an additional
contribution from the turn spin $phi_psi \( s \)$, arising from the fact
that the bristle tips experience a relative velocity component
associated with an effective rotation about the vertical axis. In
contrast, Eq.~#link(<eq:Ppass3>)[(67)] states that the
geometric spin $phi_gamma \( s \)$ does not dissipate power in the
undeformed configuration, since it affects only the trajectory of the
bristles within the contact patch and is therefore related to the
velocity of their roots rather than their tips (which only feel the
effect of $phi_psi \( s \)$). Both Eq.~#link(<eq:Ppass2>)[(66)]
and~#link(<eq:Ppass3>)[(67)] are simultaneously valid; the
difference lies solely in the manner in which the vertical moment is
evaluated. It is also worth remarking that, for~Model~1, the
equivalence
$macron(bold(v)) ""_(upright(r)) \( bold(z) \( bold(x) \, s \) \, bold(x) \, s \) = macron(bold(v)) \( bold(x) \, s \)$
only holds when $phi_2 \( s \) = 0$. Since, from a physical viewpoint,
passivity should be regarded as a property of the friction model in
isolation, it appears reasonable to consider the case
$phi_2 \( s \) = 0$ when analysing~Model~1. Indeed, when
$phi_2 \( s \) eq.not 0$, Model~1 may be interpreted as a
feedback system where the rigid relative velocity depends upon the state
through a feedback term
$upright(bold(A))_(phi_2) \( s \) bold(z) \( bold(x) \, s \)$. In this
context, a question that naturally arises is whether all the
nondimensional velocities $macron(bold(v)) \( bold(x) \, s \)$, rolling
speeds $V ""_(upright(r)) \( s \)$, and spins $bold(phi) \( s \)$ (with
$phi_2 \( s \) = 0$ in
Eq.~#link(<eq:quasiStationary0>)[(57)]) ensuring the
well-posedness of the PDEs~#link(<eq:standard2>)[(45)]
and~#link(<eq:quasiStationary0>)[(57)], as asserted
by Theorems~#link(<thm:ex1>)[3.1] and~#link(<thm:ex2>)[3.2], imply automatically
$chevron.l p \( bold(x) \) bold(f) \( dot.op \, s \) \, macron(bold(v)) ""_(upright(r)) \( dot.op \, s \) chevron.r_(L^2 \( accent(cal(C), circle.stroked) \; bb(R)^2 \)) gt.eq 0$
for all $s in \[ 0 \, S \]$ in~#link(<eq:Ppass>)[(64)]. In
particular, limited to classical solutions of the equations under
consideration, the concepts of dissipativity and passivity are enounced
according to Definition~#link(<def:idss2>)[4.3] below. A more general introduction to
these notions, limited to linear systems, is offered in \[#link(<bib-Zwart>)[82]\].

#block[
#strong[Definition 4.3] (Dissipativity and passivity). #emph[The system
described by the PDE~#link(<eq:standard2>)[(45)]
(resp.~#link(<eq:quasiStationary0>)[(57)]) with
output~(35a)
(resp.~(35a)
and~#link(<eq:Malt>)[(36)]) is called #emph[dissipative] if, for
all inputs
$macron(bold(v)) in C^1 \( cal(C) times bb(R)_(gt.eq 0) \; bb(R)^2 \) inter L^oo \( cal(C) times bb(R)_(gt.eq 0) \; bb(R)^2 \)$,
rolling speeds
$V ""_(upright(r)) in \[ V ""_(upright(m i n)) \, V ""_(upright(m a x)) \]$,
spins $bold(phi) in bb(R) times { 0 }$, and ICs
$bold(z)_0 in H^1 \( accent(cal(C), circle.stroked) \; bb(R)^2 \)$ satisfying the
BC~#link(<eq:standard2>)[(45b)]
(resp.~#link(<eq:quasiStationary0>)[(57b)]), there exist a
supply rate
$w : L^2 \( accent(cal(C), circle.stroked) \; bb(R)^2 \) times L^2 \( accent(cal(C), circle.stroked) \; bb(R)^2 \) mapsto bb(R)$
and a storage function
$W : L^2 \( accent(cal(C), circle.stroked) \; bb(R)^2 \) mapsto bb(R)_(gt.eq 0)$ such
that
#math.equation(block: true, numbering: _ => [(68)], $  & integral_0^s w #scale(x: 120%, y: 120%)[\(] bold(f) \( dot.op \, s' \) \, macron(bold(v)) ""_(upright(r)) \( dot.op \, s' \) #scale(x: 120%, y: 120%)[\)] upright(d) s' = integral_0^s w #scale(x: 120%, y: 120%)[\(] bold(f) \( dot.op \, s' \) \, macron(bold(v)) \( dot.op \, s' \) #scale(x: 120%, y: 120%)[\)] upright(d) s' gt.eq W #scale(x: 120%, y: 120%)[\(] bold(z) \( dot.op \, s \) #scale(x: 120%, y: 120%)[\)] - W #scale(x: 120%, y: 120%)[\(] bold(z)_0 \( dot.op \) #scale(x: 120%, y: 120%)[\)] \, quad s in \[ 0 \, S \] . $) <eq:Fvres>
It is called #emph[passive] if
$w \( bold(f) \( dot.op \, s \) \, macron(bold(v)) \( dot.op \, s \) \) = chevron.l p \( dot.op \) bold(f) \( dot.op \, s \) \, macron(bold(v)) ""_(upright(r)) \( dot.op \, s \) chevron.r_(L^2 \( accent(cal(C), circle.stroked) \; bb(R)^2 \)) = chevron.l p \( dot.op \) bold(f) \( dot.op \, s \) \, macron(bold(v)) \( dot.op \, s \) chevron.r_(L^2 \( accent(cal(C), circle.stroked) \; bb(R)^2 \))$.]

] <def:idss2>
It is important to clarify that the notion of passivity, as formalised
in Definition~#link(<def:idss2>)[4.3], pertains to the rolling contact process rather
than the friction model in isolation. Nonetheless, since rolling contact
dynamics are directly governed by frictional interactions, the system
should be expected to dissipate energy. This observation provides a
physical rationale for the passivity property: the friction-induced
dissipation ensures that the rate of energy supplied to the system is
bounded below by the time derivative of an appropriate storage function.
The main result in this sense is formalised in Lemma~#link(<lemma:DissF20>)[4.2]
below.

#block[
#strong[Lemma 4.2] (Passivity). #emph[Suppose that
$p in C^1 \( cal(C) \; bb(R)_(gt.eq 0) \)$ satisfies
#math.equation(block: true, numbering: _ => [(69)], $ nabla_(bold(x)) dot.op p \( bold(x) \) macron(V) \( bold(x) \) lt.eq 0 \, quad bold(x) in cal(C) \, $) <eq:condP>
and, for all $bold(y) in bb(R)^2$,
$upright(bold(M))^2 \( bold(y) \) upright(bold(G))^(- 1) \( bold(y) \) upright(bold(Sigma))_1 succ.curly.eq upright(bold(0))$.
Then, the system described by the
PDE~#link(<eq:standard2>)[(45)]
(resp.~#link(<eq:quasiStationary0>)[(57)]) with
output~(35a)
(resp.~(35a)
and~#link(<eq:Malt>)[(36)]) is passive with storage function
#math.equation(block: true, numbering: _ => [(70)], $ W #scale(x: 120%, y: 120%)[\(] bold(z) \( dot.op \, s \) #scale(x: 120%, y: 120%)[\)] eq.delta 1 / 2 integral.double_(cal(C)) p \( bold(x) \) bold(z)^(upright(T)) \( bold(x) \, s \) upright(bold(Sigma))_0 bold(z) \( bold(x) \, s \) upright(d) bold(x) . $) <eq:VdissF2>]

#block[
#emph[#emph[Proof.] See Appendix~#link(<app:Proof3>)[A.3].~◻]

]
] <lemma:DissF20>
The inequality in Eq.~#link(<eq:condP>)[(69)] is similar to
those derived for the one-dimensional variants of the distributed LuGre
and FrBD models in \[#link(<bib-FrBD>)[72], #link(<bib-DistrLuGre>)[81]\], confirming the importance of the
vertical pressure distribution in ensuring passivity properties. For
instance, restricting the attention to the line contact case, as well as
a constant nondimensional transport velocity as in~Model~1, it
may be easily concluded from~#link(<eq:condP>)[(69)] that
non-compactly-supported pressure distributions that are either constant
or exponentially decreasing in the longitudinal direction qualify as
valid choices, with the latter type even rendering the model
#emph[strictly dissipative] (the
inequality~#link(<eq:Fvres>)[(68)] is satisfied in a strict
sense). On the other hand, for a parabolic pressure distribution
vanishing on the boundary of the contact area, it is possible to show
that Eq.~#link(<eq:Fvres>)[(68)] cannot be verified. Once again,
it is essential to observe that the result advocated in
Lemma~#link(<lemma:DissF20>)[4.2] requires adopting the total time-like derivative of
the distributed state in Eqs.~#link(<eq:fxt>)[(33)]
and~#link(<eq:fxs>)[(34)]. Before moving to the numerical
experiments reported in Sect. #link(<sect:numer>)[5], some concluding remarks are
formalised below.

#block[
#strong[Remark 4.2]. #emph[The condition
$upright(bold(M))^2 \( bold(y) \) upright(bold(G))^(- 1) \( bold(y) \) upright(bold(Sigma))_1 succ.curly.eq upright(bold(0))$
for all $bold(y) in bb(R)^2$ in Lemma~#link(<lemma:DissF20>)[4.2] is trivially
verified when the matrices $upright(bold(Sigma))_1$ and
$upright(bold(M)) \( bold(y) \)$ are diagonal or commute, as common in
engineering practice. When the condition
$upright(bold(M))^2 \( bold(y) \) upright(bold(G))^(- 1) \( bold(y) \) upright(bold(Sigma))_1 succ.curly.eq upright(bold(0))$
is violated, passivity might not hold, due to the spurious coupling
effects introduced between the longitudinal and lateral deformations of
the bristles and the produced frictional forces, similar to what happens
in the presence of large spin slips $phi_2$. However, dissipativity may
be more generally shown to hold for any combinations of
$upright(bold(Sigma))_1$ and $upright(bold(M)) \( bold(y) \)$, albeit
being less interesting from a physical perspective. The
inequality~#link(<eq:condP>)[(69)] is obviously satisfied when
the pressure distribution is constant (for ~Model~1,
distributions decreasing along the rolling direction also verify
Eq.~#link(<eq:condP>)[(69)] strictly). Whilst admittedly
artificial, the use of spatially varying pressure profiles
fulfilling~#link(<eq:condP>)[(69)] seems necessary to reproduce
the sign reversal of the steady-state vertical moment at large lateral
slips#footnote[#emph[Asymmetries in the vertical pressure distribution
can arise in viscoelastic rolling contact systems due to internal
dissipation effects. This behavior is typically observed, for example,
in rubber tyres.]]. Conversely, the
condition~#link(<eq:condP>)[(69)] is typically violated by
compactly supported pressure distributions such as parabolic and
trapezoidal ones. In this context, it is however important to clarify
that the friction model remains always passive: it is the rolling
contact process, as a macroscopic phenomenon, that may become
non-passive. A more detailed discussion is provided in
Sect.~#link(<sect:miscellaneous>)[5.1.3] and in \[#link(<bib-Tsiotras3>)[64], #link(<bib-Deur1>)[66]\]. In the end, the
requirements imposed by Lemma~#link(<lemma:DissF20>)[4.2] appear very mild.]

]
#block[
#strong[Remark 4.3]. #emph[For simplicity, inequalities of the
type~#link(<eq:ISSbetaGamma>)[(59)],~#link(<eq:FBBBBBBSS>)[(60)],
and~#link(<eq:Fvres>)[(68)] were proven only for classical
solutions ($epsilon in bb(R)_(> 0)$
in~#link(<eq:standard2>)[(45)]
and~#link(<eq:quasiStationary0>)[(57)]); the
extension to mild solutions that may be more generally obtained for
$epsilon in bb(R)_(gt.eq 0)$ may be established with the aid of more
involved (and rather tedious) mathematical machinery, and is not pursued
here. Besides, in the context of this paper, these are inessential
technicalities that would obfuscate the main message of the manuscript
rather than enhancing its readability.]

]
= Numerical simulations
<sect:numer>
In the following,~Model~1,~2, and~Model~3
are numerically simulated and compared concerning both their
steady-state and transient behaviours. More specifically, Sect.~#link(<sect:SS>)[5.1]
is dedicated to steady rolling contact, whereas unstationary phenomena
are investigated in Sect.~#link(<sect:transient>)[5.2]. Implementational and
computational details are reported in Appendix~#link(<sect:details>)[C.1].

== Steady-state behaviour
<sect:SS>
A comprehensive understanding of stationary rolling contact is crucial
for explaining how slip and spin affect steady forces and moments,
whilst also providing the conceptual tools needed to untangle the subtle
and often more convoluted effects observed during transients. The next
Sects.~#link(<sect:slipSurf>)[5.1.1] and~#link(<sect:Action>)[5.1.2] discuss in detail the
steady-state behaviours of the proposed rolling contact models
relatively to the notions of #emph[force-slip surfaces] and #emph[action
surfaces], respectively. Finally, Sect.~#link(<sect:miscellaneous>)[5.1.3] concludes by
presenting a miscellaneous assortment of numerical results.

For simplicity, in the sequel, the attention is restricted to the
configuration depicted in Fig.~#link(<fig:LumpModel>)[1]\(a), where the substrate
is supposed to be infinitely rigid. In this case,
$bold(phi) \( s \) = \[ phi_1 \( s \) #h(0em) phi_2 \( s \) \]^(upright(T)) equiv \[ phi_gamma \( s \) #h(0em) phi_psi \( s \) \]^(upright(T))$,
$phi \( s \) = phi_gamma \( s \) + phi_psi \( s \) equiv phi_1 \( s \) + phi_2 \( s \)$,
and therefore the vector $bold(phi) \( s \)$ fully characterises the
spin state.

=== Force-slip surfaces
<sect:slipSurf>
In steady-state conditions, the main interest typically consists in
deducing analytical relationships between the tangential forces and
vertical moment, $\( bold(F)_(bold(x)) \, M_z \) in bb(R)^3$, and the
slip and spin inputs, $\( bold(sigma) \, bold(phi) \) in bb(R)^4$, in
the form
$ bold(F)_(bold(x)) & = hat(bold(F))_(bold(x)) \( bold(sigma) \, bold(phi) \) \,\
M_z & = hat(M)_z \( bold(sigma) \, bold(phi) \) \, $ where
$\( hat(bold(F))_(bold(x)) \, hat(M)_z \) : bb(R)^4 mapsto bb(R)^3$ may
be generally referred to as the #emph[force-slip surfaces]. Indeed, for
a given value of the rolling speed $V ""_(upright(r))$, regarding the
slip and spin inputs $\( bold(sigma) \, bold(phi) \)$ as independent
variables, each steady-state characteristic, namely the longitudinal
force $F_x$, the lateral force $F_y$, and the vertical moment $M_z$, may
be interpreted as a four-dimensional surface living in a
five-dimensional space. Typically, the force-slip surfaces are usually
continuous, uniformly bounded, and at least locally $C^1$. In this
context, it is worth observing that the rolling speed itself could be
regarded as an input; in which case, the force-slip surfaces should be
more properly interpreted as five-dimensional surfaces embedded in a
six-dimensional space. However, most friction and rolling contact models
assume a minor dependence upon $V ""_(upright(r))$ compared to the slips
and spins.

In the absence of spin ($bold(phi) = bold(0)$), the force-slip surfaces
generated for a rectangular and elliptical contact area with parabolic
pressure distribution, modelled as explained in Appendix~#link(<app:Patch>)[B], are
illustrated in Fig.~#link(<fig:SlipSurfaces>)[5]. More specifically, the surfaces
plotted in Fig.~#link(<fig:SlipSurfaces>)[5] were obtained by sampling slip values
uniformly in $\[ - 1 \, 1 \]^2$, and computing numerically the
corresponding tangential forces and vertical moment
using~Model~1 (all the models presented in the paper are
equivalent for $bold(phi) = bold(0)$), with the parameter values listed
in Table~#link(<tab:parameters>)[1]. As already known from a substantial body of
literature on tyre dynamics, the tangential forces exhibit similar
trends versus the respective spin, whereas the vertical moment is mainly
affected by the lateral component $sigma_y$. The surfaces plotted in
Fig.~#link(<fig:SlipSurfaces>)[5] are similar to those obtained by employing other
descriptions of steady rolling contact, such as the brush models with
Coulomb-Amontons friction. In this context, it is worth observing that
the force-slip surfaces in Fig.~#link(<fig:SlipSurfaces>)[5] were produced
considering an isotropic rolling contact system, whereas the adoption of
anisotropic formulations would introduce asymmetries in the trends of
the tangential forces (for instance, tyres are much stiffer in the
longitudinal direction).

More detailed plots are reported in Sect.~#link(<sect:miscellaneous>)[5.1.3].

#figure(image("figures/SlipSurfaces.svg", width: 100.0%),
  caption: [
    Force-slip surfaces in the absence of spin slips (parabolic pressure
    distribution): (a) rectangular contact area; (b) elliptical contact
    area. Model parameters as in Table~#link(<tab:parameters>)[1].
  ]
)
<fig:SlipSurfaces>

#block[
#figure(
  align(center)[#table(
    columns: 4,
    align: (center,left,center,center,),
    table.header([Parameter], [Description], [Unit], [Value],),
    table.hline(),
    [$a$], [Contact area semilength], [m], [0.075],
    [$b$], [Contact area semiwidth], [m], [0.05],
    [$sigma_(0 x)$], [Longitudinal
    micro-stiffness], [$upright(m)^(- 1)$], [240],
    [$sigma_(0 y)$], [Lateral
    micro-stiffness], [$upright(m)^(- 1)$], [240],
    [$sigma_(1 x)$], [Longitudinal
    micro-damping], [$upright(s) thin upright(m)^(- 1)$], [0],
    [$sigma_(1 y)$], [Lateral
    micro-damping], [$upright(s) thin upright(m)^(- 1)$], [0],
    [$mu ""_(upright(s))$], [Static friction coefficient], [-], [1],
    [$mu ""_(upright(d))$], [Dynamic friction coefficient], [-], [0.7],
    [$mu ""_(upright(v))$], [Viscous friction coefficient], [-], [0],
    [$v ""_(upright(S))$], [Stribeck
    velocity], [$upright(m) thin upright(s)^(- 1)$], [3.49],
    [$delta ""_(upright(S))$], [Stribeck exponent], [-], [0.6],
    [$F_z$], [Vertical force], [N], [4000],
    [$epsilon$], [Regularisation
    parameter], [$upright(m)^2 thin upright(s)^(- 2)$], [$10^(- 12)$],
  )]
  , caption: [Model parameters. Matrices $upright(bold(Sigma))_0$ and
  $upright(bold(Sigma))_1$ as in
  Eq.~#link(<eq:Sigmas2>)[(4)]\;
  $upright(bold(M)) \( bold(y) \) = mu \( bold(y) \) upright(bold(I))_2$
  with $mu \( bold(y) \)$ as in
  Eq.~#link(<eq:muExample>)[(13)]]
  , kind: table
  )

]
<tab:parameters>

=== Action surfaces
<sect:Action>
The interaction between the steady-state characteristics may also be
studied by considering the implicit surface
#math.equation(block: true, numbering: _ => [(72)], $ hat(bold(F)) \( bold(F)_(bold(x)) \, M_z \) = 0 \, $) <eq:ActionSurf>
which describes the vertical moment as a function of the tangential
forces. Inspired by the terminology adopted in \[#link(<bib-Guiggiani>)[8]\] (Chap. 11), in
this paper, $hat(bold(F)) \( bold(F)_(bold(x)) \, M_z \) = 0$ is
referred to as the #emph[action surface]. Mathematically, the notion of
action surface appears strictly related to that of #emph[limit surface]
theorised in \[#link(<bib-Goyal1>)[83], #link(<bib-Goyal2>)[84]\]\; however, it is essential to emphasise
that, within the FrBD and LuGre frameworks, there is no clear
distinction between stick and slip regimes, as both formulations only
attempt to approximate the average (sliding) dynamics of a bristle
element. Nevertheless, Eq.~#link(<eq:ActionSurf>)[(72)]
yields an equivalent principle to investigate the coupling between the
macroscopic forces and torque generated during steady rolling.

The action surfaces obtained for a rectangular and elliptical contact
area by simulating numerically~Model~2 are illustrated in
Fig.~#link(<fig:ActionSurfaces>)[6] for different combinations of spin slips
$bold(phi) = bold(0)$, $\( 3 \, 0 \)$, and $\( 0 \, 3 \)$, respectively.
Inspection of Fig.~#link(<fig:ActionSurfaces>)[6] reveals that large spin slips may
profoundly influence the shape of the action surface. In particular, the
parameters $phi_1 = phi_gamma$ and $phi_2 = phi_psi$ seem to produce
similar effects, with the latter causing a slightly more pronounced
asymmetrisation. Generally speaking, the plots reported in
Fig.~#link(<fig:ActionSurfaces>)[6] confirm the important coupling between the
tangential forces and the vertical moment in rolling contact.

#figure(image("figures/ActionSurfaces.svg", width: 100.0%),
  caption: [
    Action surfaces for different combinations of spin slips
    $bold(phi) = \( phi_1 \, phi_2 \)$ (parabolic pressure
    distribution): (a) rectangular contact area; (b) elliptical contact
    area. Model parameters as in Table~#link(<tab:parameters>)[1].
  ]
)
<fig:ActionSurfaces>

In this context, of particular importance are the projections of the
action surface on the plane $F_x - F y$, which are depicted in
Fig.~#link(<fig:Circles>)[7] for $bold(phi) = bold(0)$ (solid thick lines),
$bold(phi) = \( 3 \, 0 \)$ (solid lines), and $bold(phi) = \( 0 \, 3 \)$
(dashed lines). In tyre dynamics, these projections are widely known as
#emph[friction circles] \[#link(<bib-Guiggiani>)[8]\]. The friction circles are typically
obtained under isotropic assumptions, whereas in the presence of
anisotropy (e.g., $sigma_(0 x) eq.not sigma_(0 y)$ in
Eq.~(4a)) a #emph[friction ellipse] is
more generally obtained \[#link(<bib-Guiggiani>)[8]\].

Representing steady-state characteristics through action surfaces is
particularly valuable for rolling contact systems operating close to the
limit of their capabilities. In vehicle dynamics, for instance, control
algorithms are often designed to keep vehicles at the limits of
handling, where tyres exploit the full friction potential available at
the contact patch. Neglecting the contribution of the vertical moment,
this corresponds to operating along the boundary of the friction
circles, as illustrated in Fig.~#link(<fig:Circles>)[7], by prescribing a desired
acceleration direction. Such strategies are especially effective when
the tyre-road friction coefficient is unknown, but maximum performance
is required, as typically happens in emergency manoeuvres
\[#link(<bib-Fors1>)[85], #link(<bib-Fors2>)[86], #link(<bib-Fors3>)[87], #link(<bib-Fors4>)[88]\]. These algorithms build on concepts closely
related to those used in robotics, particularly the notion of limit
surfaces. Recent work has extended this framework to non-Coulomb
friction models, including LuGre and elastoplastic formulations \[#link(<bib-2D>)[89]\].

#figure(image("figures/FrictionCircles.svg", width: 100.0%),
  caption: [
    Friction circles (parabolic pressure distribution): (a) rectangular
    contact patch; (b) elliptical contact patch. Line styles:
    $bold(phi) = bold(0)$ (solid thick lines),
    $bold(phi) = \( 3 \, 0 \)$ (solid lines), $bold(phi) = \( 0 \, 3 \)$
    (dashed lines). Model parameters as in Table~#link(<tab:parameters>)[1].
  ]
)
<fig:Circles>

=== Miscellaneous results
<sect:miscellaneous>
A variety of composite plots is finally collected into
Figs.~#link(<fig:GoughRect>)[8]--#link(<fig:EllSpins>)[11], where the trend of the main
steady-state characteristics is illustrated for different operating
conditions, and considering again a rectangular and elliptical contact
area. Starting with Figs.~#link(<fig:GoughRect>)[8] and~#link(<fig:GoughEll>)[9], produced in
the absence of spin ($bold(phi) = bold(0)$), it may be observed that the
lateral force $F_y$ and vertical moment $M_z$ as a function of the
lateral slip $sigma_y$ are both symmetric with respect to the origin. It
is worth noting that the vertical moment $M_z$ in Figs.~#link(<fig:GoughRect>)[8]
and~#link(<fig:GoughEll>)[9] does not change sign as the lateral slip increases.
This behaviour should be imputed to the adopted parabolic pressure
distribution, which is symmetric with respect to the centre of the
contact patch. A sign reversal would require an asymmetric pressure
profile, as explained in \[#link(<bib-Tsiotras3>)[64], #link(<bib-Deur1>)[66]\]. Under combined translational
slips, both $F_y$ and $M_z$ exhibit a reduction in magnitude. Overall,
the trends remain qualitatively coherent with those typically reported
in railway and tyre dynamics.

The friction circles are also depicted for different values of the
lateral slip, along with the vertical moment as a function of $sigma_x$,
which is symmetric with respect to the vertical axis. For
$bold(phi) = bold(0)$, Model~1,~2, and~3
are all equivalent and predict the same behaviours.

#figure(image("figures/GoughRect.svg", width: 100.0%),
  caption: [
    Steady-state characteristics in the absence of spin slips
    (rectangular contact area with parabolic pressure distribution).
    Line styles: Model~2 (solid thick lines),
    Model~3 (solid lines), Model~1 (dashed lines).
    Model parameters as in Table~#link(<tab:parameters>)[1].
  ]
)
<fig:GoughRect>

#figure(image("figures/GoughEll.svg", width: 100.0%),
  caption: [
    Steady-state characteristics in the absence of spin slips
    (elliptical contact area with parabolic pressure distribution). Line
    styles: Model~2 (solid thick lines), Model~3
    (solid lines), Model~1 (dashed lines). Model parameters as
    in Table~#link(<tab:parameters>)[1].
  ]
)
<fig:GoughEll>

Some discrepancies emerge when comparing the three formulations under
large spin slips, as illustrated in Figs.~#link(<fig:RectSpins>)[10]
and~#link(<fig:EllSpins>)[11] for rectangular and elliptical contact areas,
respectively. The disagreement is particularly evident in the friction
circles associated with small lateral slips and
$bold(phi) = \( 0 \, 3 \)$. In this case, although the linear
model~Model~3 partially captures the asymmetry induced by high
spin values, consistent with the predictions of~Model~2, the
standard formulation~Model~1 fails to reproduce this behaviour
accurately. For $bold(phi) = \( 3 \, 0 \)$, the discrepancy is less
pronounced. It is worth noting, however, that in tyre dynamics large
values of $phi_1 = phi_gamma$ are often associated with secondary
effects -- such as distortions of the contact shape -- that are not
explicitly modelled here.

#figure(image("figures/RectLargeSpins.svg", width: 100.0%),
  caption: [
    Steady-state characteristics in the presence of large spin slips
    (rectangular contact area with parabolic pressure distribution): (a)
    $bold(phi) = \( 3 \, 0 \)$\; (b) $bold(phi) = \( 0 \, 3 \)$. Line
    styles: Model~2 (solid thick lines), Model~3
    (solid lines), Model~1 (dashed lines). Model parameters as
    in Table~#link(<tab:parameters>)[1].
  ]
)
<fig:RectSpins>

#figure(image("figures/EllipticalLargeSpins.svg", width: 100.0%),
  caption: [
    Steady-state characteristics in the presence of large spin slips
    (elliptical contact area with parabolic pressure distribution): (a)
    $bold(phi) = \( 3 \, 0 \)$\; (b) $bold(phi) = \( 0 \, 3 \)$. Line
    styles: Model~2 (solid thick lines), Model~3
    (solid lines), Model~1 (dashed lines). Model parameters as
    in Table~#link(<tab:parameters>)[1].
  ]
)
<fig:EllSpins>

== Transient behaviour
<sect:transient>
Transient rolling contact is studied considering two main effects:
#emph[relaxation dynamics], and secondary phenomena connected with
time-varying normal forces and contact areas. These are investigated
respectively in Sect.~#link(<sect:relax>)[5.2.1] and~#link(<sect:normVertVar>)[5.2.2].

=== Relaxation phenomena in rolling and spinning contact
<sect:relax>
According to~Model~1,~2, and~3, rolling
contact processes are governed by (possibly nonlinear) transport
equations. Consequently, when a rolling contact system is subjected to a
constant slip or spin input, it does not produce an immediate
steady-state response, but instead evolves through a transient phase.

In first-order dynamical systems described by linear ODEs, a key notion
is that of #emph[relaxation time]: the time required for the system to
reach approximately 63% of its steady-state response following a step
input. This time is typically an integer multiple of a characteristic
time constant. An analogous concept is widely used in tyre dynamics,
where the #emph[relaxation length] denotes the distance a tyre must
travel to develop about 63% of its steady-state characteristics (in
terms of tangential forces and/or vertical moment) \[#link(<bib-Higuchi2>)[90], #link(<bib-Rill1>)[91], #link(<bib-PAC>)[92]\].
The relaxation length is typically influenced by factors other than
friction, including the flexibility of structural components such as the
tyre carcass and sidewall. However, relaxation phenomena are also well
documented in relatively rigid contact pairs, like wheel and rail, where
their duration is on the order of the contact patch length. In
particular, under vanishing sliding conditions (that is, when the slip
inputs are sufficiently small), standard brush models with
Coulomb-Amontons friction predict that transients disappear exactly
after travelling one full contact patch length. In contrast, when
limited friction or local sliding occurs within the contact area, the
transient duration becomes shorter and typically corresponds to the
distance required to reach the so-called #emph[breakaway point]. An
important insight that emerges from this discussion is that, due to the
hyperbolic nature of~Model~1,~2, and~3, the
response of a rolling contact system converges in finite time, and not
exponentially, to a steady state (at least, in the absence of additional
dynamics related to the deformation of compliant elements).

Similar conclusions, which may be reached by directly solving
Eq.~#link(<eq:standard2>)[(45)]#footnote[A formal solution
to Eq.~#link(<eq:standard2>)[(45)] may be recovered using
the method of the characteristic lines; however, since the coefficients
are highly nonlinear in the variables $x$ and $s$, such a representation
formula would be not very neat.], are supported by the simulation
results plotted in Figs.~#link(<fig:trans1>)[12] and~#link(<fig:trans2>)[13], where the
transient characteristics predicted using~Model~3 are plotted
for different combinations of slip and spin inputs. Specifically,
Figs.~#link(<fig:trans1>)[12]\(a) and (b) illustrate the unsteady behaviours of the
tangential forces and vertical moment for
$bold(sigma) = \( 0.16 \, 0.08 \)$ and $\( 0.06 \, 0.18 \)$ in the
absence of spin ($bold(phi) = bold(0)$), and starting from zero initial
conditions. Interestingly, the system exhibits a dynamical response that
is similar to that of a first-order linear ODE, although the concepts
from ODE theory are not directly applicable to the case under
consideration. In particular, it may be observed that convergence is
reached approximately for $s = 0.15$ m, which is in accordance with the
values reported in Table~#link(<tab:parameters>)[1].

#figure(image("figures/TransientNoSpin.svg", width: 100.0%),
  caption: [
    Transient forces predicted by~Model~3 for step slip inputs
    in the absence of spin (parabolic pressure distribution). Line
    styles: rectangular contact area (solid thick line), elliptical
    contact area (dashed lines). Model parameters as in
    Table~#link(<tab:parameters>)[1].
  ]
)
<fig:trans1>

According to both~Model~2 and~3, the presence of
large spins $phi_1 \( s \) = phi_gamma \( s \)$ modifies the transport
velocity, distorting the trajectories of the bristles travelling within
the contact area. For constant $phi_1 \( s \) = phi_1$, these
trajectories are circles centred at $C_(phi_1)$. This phenomenon has a
minor influence on the duration of the transient phase, as revealed by
inspection of Fig.~#link(<fig:trans2>)[13]\(a), where the transient trends of
$bold(F)_(bold(x)) \( s \)$ and $M_z \( s \)$ are illustrated for
$bold(sigma) = \( 0.08 \, 0.08 \)$. More interesting is instead the
effect that large spin slips seem to exert on the dynamics of $M_z$,
whose response is characterised by an initial overshoot in
Fig.~#link(<fig:trans2>)[13], as typically occurs for nonlinear systems.

In any case, it is important to emphasise that, unlike standard brush
models with Coulomb-Amontons friction, the FrBD and LuGre formulations
are inherently unable to predict transients shorter than the
contact-patch length. This limitation arises because their governing
PDEs are defined over the entire contact area. Although this constraint
could, in principle, be alleviated by postulating #emph[ad-hoc]
slip-dependent transport velocities, such a modification would lack a
sound theoretical justification within the present framework and is
therefore not pursued in this work.

#figure(image("figures/TransientSpin.svg", width: 100.0%),
  caption: [
    Transient forces predicted by~Model~3 for step slip inputs
    in the presence of large spins (parabolic pressure distribution).
    Line styles: rectangular contact area (solid thick line), elliptical
    contact area (dashed lines). Model parameters as in
    Table~#link(<tab:parameters>)[1].
  ]
)
<fig:trans2>

=== Effect of time-varying normal forces
<sect:normVertVar>
Relaxation effects are amongst the most significant transient phenomena
in tyre-road and wheel-rail interactions, as they may directly affect
the stability of vehicular systems
\[#link(<bib-Takacs1>)[93], #link(<bib-Takacs2>)[94], #link(<bib-Takacs3>)[95], #link(<bib-Takacs4>)[96], #link(<bib-Takacs5>)[97], #link(<bib-BicyclePDE>)[98], #link(<bib-SemilinearV>)[99]\].
However, dynamical behaviours associated with oscillating normal forces
and time-varying contact patches also play a fundamental role in shaping
key phenomena such as slip losses, wheel polygonalisation, corrugation,
and wear \[#link(<bib-Ciavarella1>)[47], #link(<bib-Ciavarella2>)[48], #link(<bib-Ciavarella3>)[49]\], whilst also influencing
riding comfort in road vehicles \[#link(<bib-Guiggiani>)[8]\]. In Sect.~#link(<sect:models>)[3],
Model~1,~2, and~3 were postulated on a
time-varying domain, providing an adequate framework to investigate the
effect of oscillating vertical forces \[#link(<bib-Colantonio>)[100]\] on the response of a
rolling contact system.

For simplicity, the following analysis is restricted to the case of line
contact, with
$cal(C) \( s \) = { x in bb(R) \| - a \( s \) lt.eq x lt.eq a \( s \) }$
for $a \( s \) in \[ a ""_(upright(m i n)) \, a ""_(upright(m a x)) \]$,
with
$a \( 0 \) eq.delta a_0 in \[ a ""_(upright(m i n)) \, a ""_(upright(m a x)) \]$.
Then, Model~1 may be recast explicitly as
#math.equation(block: true, numbering: _ => [(73)], $  & frac(partial bold(z) \( x \, s \), partial s) - frac(partial bold(z) \( x \, s \), partial x) = tilde(upright(bold(Sigma))) \( x \, s \) bold(z) \( x \, s \) + tilde(bold(h)) \( x \, s \) \, quad bold(x) in \( - a \( s \) \, a \( s \) \) \, #h(0em) s in \( 0 \, S \) \,\
 & bold(z) \( a \( s \) \, s \) = bold(0) \, quad s in \( 0 \, S \) \,\
 & bold(z) \( x \, 0 \) = bold(z)_0 \( x \) \, quad x in \( - a_0 \, a_0 \) . $) <eq:standard0_tv>
It is profitable to reformulate the
PDE~#link(<eq:standard0_tv>)[(73)] on a unit domain. To
this end, the following transformation is introduced:
$ xi eq.delta frac(a \( s \) - x, 2 a \( s \)) \, quad x in \[ - a \( s \) \, a \( s \) \] \, $
so that, with some abuse of notation,
Eq.~#link(<eq:standard0_tv>)[(73)] is converted into
#math.equation(block: true, numbering: _ => [(75)], $  & frac(partial bold(z) \( xi \, s \), partial s) + tilde(V) \( xi \, s \) frac(partial bold(z) \( xi \, s \), partial xi) = tilde(upright(bold(Theta))) \( xi \, s \) bold(z) \( xi \, s \) + tilde(bold(g)) \( x \, s \) \, quad \( xi \, s \) in \( 0 \, 1 \) times \( 0 \, S \) \,\
 & bold(z) \( 0 \, s \) = bold(0) \, quad s in \( 0 \, S \) \,\
 & bold(z) \( xi \, 0 \) = bold(z)_0 \( xi \) \, quad xi in \( 0 \, 1 \) \, $) <eq:standard0_tvFix>
being
#math.equation(block: true, numbering: _ => [(76)], $ tilde(V) \( xi \, s \) & eq.delta frac(1, 2 a \( s \)) #scale(x: 240%, y: 240%)[\(] 1 + \( 1 - 2 xi \) frac(upright(d) a \( s \), upright(d) s) #scale(x: 240%, y: 240%)[\)] \,\
tilde(upright(bold(Theta))) \( xi \, s \) & eq.delta tilde(upright(bold(Sigma))) #scale(x: 120%, y: 120%)[\(] a \( s \) - 2 a \( s \) xi \, s #scale(x: 120%, y: 120%)[\)] \,\
tilde(bold(g)) \( xi \, s \) & eq.delta tilde(bold(h)) #scale(x: 120%, y: 120%)[\(] a \( s \) - 2 a \( s \) xi \, s #scale(x: 120%, y: 120%)[\)] . $) <eq:tildeThetag>
Equation~#link(<eq:standard0_tvFix>)[(75)] is now
reformulated in a form that is more amenable to mathematical analysis.
In this context, albeit not explicitly done in this paper, it is worth
clarifying that~Model~2 and~3 may also be recast as
PDEs evolving on a cylindrical, time-invariant domain, albeit relying on
slightly more sophisticated arguments. For a general treatment of such
problems in the context of rolling contact studies, the reader is
redirected to \[#link(<bib-Tribology>)[78]\].

Theorem~#link(<thm:ex4>)[5.1] asserts the well-posedness of
Eq.~#link(<eq:standard0_tvFix>)[(75)].

#block[
#strong[Theorem 5.1] (Existence and uniqueness of solutions). #emph[For
all
$tilde(V) in C^1 \( \[ 0 \, 1 \] times \[ 0 \, S \] \; \[ tilde(V) ""_(upright(m i n)) \; tilde(V) ""_(upright(m a x)) \] \)$
with $tilde(V) ""_(upright(m i n)) in bb(R)_(> 0)$,
$tilde(upright(bold(Theta))) in C^1 \( \[ 0 \, 1 \] times \[ 0 \, S \] \; upright(bold(M))_2 \( bb(R) \) \)$,
and
$tilde(bold(g)) in L^p \( \( 0 \, S \) \; L^2 \( \( 0 \, 1 \) \; bb(R)^2 \) \)$,
$p gt.eq 1$, as in Eq.~#link(<eq:tildeThetag>)[(76)], and
ICs $bold(z)_0 in L^2 \( \( 0 \, 1 \) \; bb(R)^2 \)$, the
PDE~#link(<eq:standard0_tvFix>)[(75)] admits a unique
mild solution
$bold(z) in C^0 \( \[ 0 \, S \] \; L^2 \( \( 0 \, 1 \) \; bb(R)^2 \) \)$.
Additionally, if
$tilde(bold(g)) in C^1 \( \[ 0 \, S \] \; L^2 \( \( 0 \, 1 \) \; bb(R)^2 \) \)$,
and the IC $bold(z)_0 in H^1 \( \( 0 \, 1 \) \; bb(R)^2 \)$ satisfies
the BC~(75b), the solution is classical,
that is,
$bold(z) in C^1 \( \[ 0 \, S \] \; L^2 \( \( 0 \, 1 \) \; bb(R)^2 \) \) inter C^0 \( \[ 0 \, S \] \; H^1 \( \( 0 \, 1 \) \; bb(R)^2 \) \)$
and satisfies the BC~(75b).]

#block[
#emph[#emph[Proof.] See Theorem 2.1 and Corollary 2.1 in \[#link(<bib-MScthesis>)[101]\].~◻]

]
] <thm:ex4>
Starting with the representation in
Eq.~#link(<eq:standard0_tvFix>)[(75)], and again with
some abuse of notation, the tangential forces and vertical moment may be
determined as
#math.equation(block: true, numbering: _ => [(79)], $ bold(F)_(bold(x)) \( s \) & = 2 a \( s \) integral_0^1 p \( xi \, s \) bold(f) \( xi \, s \) upright(d) xi \,\
M_z \( s \) & = 2 a^2 \( s \) integral_0^1 p \( xi \, s \) \( 1 - 2 xi \) f_y \( xi \, s \) upright(d) xi \, quad s in \[ 0 \, S \] \, $) <eq:FandM_var>
or, alternatively, considering the deformed configuration,
#math.equation(block: true, numbering: _ => [(80)], $ M_z \( s \) & = 2 a^2 \( s \) integral_0^1 p \( xi \, s \) #scale(x: 240%, y: 240%)[\(] 1 - 2 xi + frac(z_x \( xi \, s \), a \( s \)) #scale(x: 240%, y: 240%)[\)] f_y \( xi \, s \) upright(d) xi \, quad s in \[ 0 \, S \] . $) <eq:Malt_var2>

In particular, Fig.~#link(<fig:trans3>)[14] was produced by modelling the vertical
force, contact patch semilength and longitudinal slip as
#math.equation(block: true, numbering: _ => [(81)], $ F_z \( s \) & = F_(z \, 0) + F_(z \, upright(I)) sin \( omega_s s \) \,\
a \( s \) & = a_0 + a ""_(upright(I)) sin \( omega_s s \) \,\
sigma_x \( s \) & = sigma_(x \, 0) + sigma_(x \, upright(I)) sin \( omega_s s \) \, $) <eq:varyignSLipsa>
where $omega_s in bb(R)_(gt.eq 0)$ has the same dimension of a
curvature, and represents a spatial frequency accounting for road or
rail irregularities (such as roughness). The conditions
$a ""_(upright(I)) in \[ 0 \, a_0 \)$ and
$omega_s a ""_(upright(I)) in \[ 0 \, 1 \)$ imply
$tilde(V) in C^1 \( \[ 0 \, 1 \] times \[ 0 \, S \] \; \[ tilde(V) ""_(upright(m i n)) \; tilde(V) ""_(upright(m a x)) \] \)$,
ensuring the regularised
PDE~#link(<eq:standard0_tvFix>)[(75)] to be
well-posed. In particular, the parameters
$F_(z \, upright(I)) \, a ""_(upright(I)) \, sigma_(x \, upright(I)) in bb(R)$
in Eq.~#link(<eq:varyignSLipsa>)[(81)] were specified
respectively as $F_(z \, upright(I)) = 0.1 F_(z \, 0)$,
$a ""_(upright(I)) = 0.1 a_0$, and
$sigma_(x \, upright(I)) = 0.1 sigma_(x \, 0)$, and a constant contact
distribution was employed.

Figure~#link(<fig:trans3>)[14]\(a) illustrates the trend of the longitudinal force
for $omega_s = 10$ $upright(m)^(- 1)$ and two different values of
$sigma_(x \, 0) = 0.02$ and 0.06. By inspection of Fig.~#link(<fig:trans3>)[14]\(a),
it may be promptly concluded that, after a rapid transient phase related
to the initial conditions, the force follows a sinusoidal trend that is
dictated by those of the slip and contact patch length. Analogous
considerations hold for Fig.~#link(<fig:trans3>)[14]\(b), where the effect of higher
excitation frequencies is shown ($omega_s = 20$ $upright(m)^(- 1)$).

#figure(image("figures/TransientArea.svg", width: 100.0%),
  caption: [
    Transient longitudinal force in the presence of an oscillating
    normal load and a time-varying contact area. Line colours: (a)
    $sigma_(x \, 0) = 0.02$ (blue lines), $sigma_(x \, 0) = 0.06$
    (orange lines); (b) $sigma_(x \, 0) = 0.02$ (blue lines),
    $sigma_(x \, 0) = 0.04$ (orange lines). Other parameters as in
    Table~#link(<tab:parameters>)[1].
  ]
)
<fig:trans3>

= Conclusions
<sect:conclusion>
This work introduced a comprehensive two-dimensional extension of the
FrBD friction framework, bridging the gap between physically grounded
bristle-based friction modelling and the spatially distributed nature of
rolling contact. Starting from a general rheological representation of a
bristle-like element, combined with an analytical law for sliding
friction, the proposed approach eliminates the notion of sliding
velocity through a constructive use of the Implicit Function Theorem,
yielding a dynamic friction model expressed solely in terms of the rigid
relative velocity and bristle deformation. Compared to classic
formulations equipped with Coulomb friction, this expedient permits
avoiding the difficulties associated with separately modelling sliding
and rolling regimes.

The distributed formulation developed in the paper enables frictional
stresses to vary within the contact region according to local
kinematics, transport effects, and spin. Specifically, three model
variants of increasing complexity were derived, covering standard linear
rolling contact, large-spin regimes, and semilinear dynamics. Concerning
the linear descriptions, well-posedness was rigorously established,
ensuring that the proposed PDE formulations are mathematically sound and
suitable for the adoption of numerical schemes (at least in the context
of the studies conducted in the manuscript). Stability analyses
demonstrated #emph[input-to-state stability] (ISS) and
#emph[input-to-output stability] (IOS), and clarified the roles of
micro-stiffness and micro-damping in shaping the transient dynamics. In
particular, coherently with previous findings, it emerged that passivity
is almost always preserved if the damping term is modelled in a
physically consistent manner.

Numerical results illustrated steady-state characteristics (including
action and slip-forces surfaces) and transient behaviours connected with
relaxation phenomena and oscillating normal forces. These simulations
confirm that the two-dimensional FrBD framework can capture essential
physical effects known from experiments and higher-fidelity models,
whilst retaining a tractable and analytically transparent structure that
is amenable to mathematical analysis and real-time implementations.

Beyond the specific formulations presented in the paper, the developed
methodology, combining physical-oriented reasoning,
implicit-function-based inversion, and distributed PDE representations,
establishes a general template for future extensions. Potential
directions include incorporating more detailed bristle mechanics, fully
nonlinear damping laws, or coupling with flexible bodies. Indeed, the
results of this work open the way for new physically-grounded,
control-oriented rolling contact representations and provide a rigorous
foundation for next-generation friction modelling in applications
ranging from vehicle dynamics to tribology. Finally, starting with the
formulations introduced in this manuscript, model-order-reduction
strategies could be explored for potential integration with larger,
system-level dynamic simulations of complex mechanical systems.

#heading(level: 1, numbering: none)[Funding declaration]
<funding-declaration>
This research was financially supported by the project FASTEST (Reg. no.
2023-06511), funded by the Swedish Research Council.

#heading(level: 1, numbering: none)[Compliance with Ethical Standards]
<compliance-with-ethical-standards>
The authors declare that they have no conflict of interest.

#heading(level: 1, numbering: none)[Author Contribution declaration]
<author-contribution-declaration>
L.R. is the sole author of and contributor to the manuscript.

#heading(numbering: none)[References]

#block(above: .45em, below: .45em)[\[1\] Romano L. Kinematics of rolling contact: derivation, misconceptions, and

generalisations. Mechanism and Machine Theory, 216 (2025). Available

from: #link("https://doi.org/10.1016/j.mechmachtheory.2025.106201").] <bib-KinematicsMio>

#block(above: .45em, below: .45em)[\[2\] Marques F, Flores P, Claro JCP, et al. Modeling and analysis of friction

including rolling effects in multibody dynamics: a review. Multibody

Syst Dyn 45:223--244 (2019). Available from:

#link("https://doi.org/10.1007/s11044-018-09640-6").] <bib-Flores>

#block(above: .45em, below: .45em)[\[3\] Marques F, Flores P, Pimenta Claro JC, Lankarani HM. A survey and

comparison of several friction force models for dynamic analysis of

multibody mechanical systems. Nonlinear Dyn 86(3):1407--1443 (2016).

Available from: #link("https://doi.org/10.1007/s11071-016-2999-3").] <bib-Flores2>

#block(above: .45em, below: .45em)[\[4\] Knothe K, Stichel S. Rail Vehicle Dynamics. 1st ed. Springer, Cham

(2016).] <bib-Knothe>

#block(above: .45em, below: .45em)[\[5\] Kalker JJ. Three-Dimensional Elastic Bodies in Rolling Contact. 1st ed.

Springer, Dordrecht (1990). Available from:

#link("https://doi.org/10.1007/978-94-015-7889-9").] <bib-KalkerBook>

#block(above: .45em, below: .45em)[\[6\] Kalker JJ. Rolling Contact Phenomena. In: Jacobson B, Kalker JJ (eds)

Rolling Contact Phenomena. International Centre for Mechanical Sciences,

vol. 411. Springer, Vienna (2000).] <bib-2000RCP>

#block(above: .45em, below: .45em)[\[7\] Pacejka HB. Tire and Vehicle Dynamics. 3rd ed. Elsevier, Amsterdam

(2012).] <bib-Pacejka2>

#block(above: .45em, below: .45em)[\[8\] Guiggiani M. The Science of Vehicle Dynamics. 3rd ed. Springer, Cham

(2023). Available from:

#link("https://doi.org/10.1007/978-3-031-06461-6").] <bib-Guiggiani>

#block(above: .45em, below: .45em)[\[9\] Romano L. Advanced Brush Tyre Modelling. SpringerBriefs in Applied

Sciences. Springer, Cham (2022). Available from:

#link("https://doi.org/10.1007/978-3-030-98435-9").] <bib-LibroMio>

#block(above: .45em, below: .45em)[\[10\] Zhang M, Unrau HJ, Gießler M, Gauterin F. Tire tread wear

characteristics: insights from indoor experiments and analytical

modeling. Tribology International 10 (2025). Available from:

#link("https://doi.org/10.1016/j.triboint.2025.110752").] <bib-Gauterin>

#block(above: .45em, below: .45em)[\[11\] Zhang M, Unrau HJ, Gießler M, Gauterin F. A detailed tire tread friction

model considering dynamic friction states. Tribology International 193

(2024). Available from:

#link("https://doi.org/10.1016/j.triboint.2024.109342").] <bib-Gauterin2>

#block(above: .45em, below: .45em)[\[12\] Zheng M, Zhan Q, Liu J, Cai Y. Control of a spherical robot: path

following based on nonholonomic kinematics and dynamics. Chinese Journal

of Aeronautics 23(3):337--345 (2011). Available from:

#link("https://doi.org/10.1016/S1000-9361(11)60040-X").] <bib-Sphere1>

#block(above: .45em, below: .45em)[\[13\] Karavaev YL, Kilin AA. Dynamics and control of a spherical robot with an

internal omniwheel platform. Regul Chaot Dyn 20:134--152 (2015).

Available from: #link("https://doi.org/10.1134/S1560354715020033").] <bib-Sphere2>

#block(above: .45em, below: .45em)[\[14\] Ba PD, Dong Hoang Q, Lee SG, Nguyen TH, Quang Duong X, Tham BC.

Kinematic modeling of spherical rolling robots with a

three-omnidirectional-wheel drive mechanism. Proc. 20th Int. Conf.

Control, Automation and Systems (ICCAS), 463--466 (2020). Available

from: #link("https//doi: 10.23919/ICCAS50221.2020.9268200").] <bib-Sphere3>

#block(above: .45em, below: .45em)[\[15\] Ghariblu H, Mohammadi H. Structure and dynamic modelling of a spherical

robot. Proc. 8th Int. Symp. Mechatronics and Its Applications, 1--5

(2012). Available from: #link("https//doi: 10.1109/ISMA.2012.6215159").] <bib-Sphere4>

#block(above: .45em, below: .45em)[\[16\] Hogan FR, Forbes JR. Modeling of spherical robots rolling on generic

surfaces. Multibody Syst Dyn 35:91--109 (2015). Available from:

#link("https://doi.org/10.1007/s11044-014-9438-3").] <bib-SphereNoSlip1>

#block(above: .45em, below: .45em)[\[17\] Zhuang W, Liu X, Fang C, Sun H. Dynamic modeling of a spherical robot

with arms using Kane's method. Proc. 4th Int. Conf. Natural Computation,

373--377 (2008). Available from:

#link("https//doi: 10.1109/ICNC.2008.595").] <bib-SphereNoSlip2>

#block(above: .45em, below: .45em)[\[18\] Moazami S, Zargarzadeh H, Palanki S. Kinematics of spherical robots

rolling over 3D terrains. Complexity, 14 pages (2019). Available from:

#link("https://doi.org/10.1155/2019/7543969").] <bib-SphereNoSlip3>

#block(above: .45em, below: .45em)[\[19\] Yildiz Y, Piccininni A, Bottiglione F, Carbone G. Modeling chain

continuously variable transmission for direct implementation in

transmission control. Mechanism and Machine Theory 105:428--440 (2016).

Available from:

#link("https://doi.org/10.1016/j.mechmachtheory.2016.07.015").] <bib-CarboneTrans>

#block(above: .45em, below: .45em)[\[20\] Duan C, Hebbale K, Liu F, Yao J. Physics-based modeling of a chain

continuously variable transmission. Mechanism and Machine Theory

105:397--408 (2016). Available from:

#link("https://doi.org/10.1016/j.mechmachtheory.2016.07.018").] <bib-TransModel>

#block(above: .45em, below: .45em)[\[21\] Kumaran VU, Weiss L, Zogg M, Wegener K. Analytical flat belt drive model

considering bilinear elastic behaviour with residual strains. Mechanism

and Machine Theory 190 (2023). Available from:

#link("https://doi.org/10.1016/j.mechmachtheory.2023.105466").] <bib-Belt1>

#block(above: .45em, below: .45em)[\[22\] Frendo F, Bucchi F. "Brush model" for the analysis of flat belt

transmissions in steady-state conditions. Mechanism and Machine Theory

143:103653 (2020). Available from:

#link("https://doi.org/10.1016/j.mechmachtheory.2019.103653").] <bib-Frendo1>

#block(above: .45em, below: .45em)[\[23\] Frendo F, Bucchi F. Enhanced brush model for the mechanics of power

transmission in flat belt drives under steady-state conditions: effect

of belt elasticity. Mechanism and Machine Theory 153:103998 (2020).

Available from:

#link("https://doi.org/10.1016/j.mechmachtheory.2020.103998").] <bib-Frendo2>

#block(above: .45em, below: .45em)[\[24\] Bucchi F, Frendo F. Validation of the brush model for the analysis of

flat belt transmissions in steady-state conditions by finite element

simulation. Mechanism and Machine Theory 167:104556 (2022). Available

from: #link("https://doi.org/10.1016/j.mechmachtheory.2021.104556").] <bib-Frendo3>

#block(above: .45em, below: .45em)[\[25\] Santeramo M, Putignano C, Vorlaufer G, Krenn S, Carbone G. Viscoelastic

steady-state rolling contacts: a generalized boundary element

formulation for conformal and non-conformal geometries. Journal of the

Mechanics and Physics of Solids 171 (2023). Available from:

#link("https://doi.org/10.1016/j.jmps.2022.105129").] <bib-bearing1>

#block(above: .45em, below: .45em)[\[26\] Sawalhi N, Randall RB. Simulating gear and bearing interactions in the

presence of faults: Part I. The combined gear--bearing dynamic model and

the simulation of localised bearing faults. Mech Syst Signal Process

22(8):1924--1951 (2008). Available from:

#link("https://doi.org/10.1016/j.ymssp.2007.12.001").] <bib-bearing2>

#block(above: .45em, below: .45em)[\[27\] Abboud D, Elbadaoui M, Smith WA, Randall RB. Advanced bearing

diagnostics: a comparative study of two powerful approaches. Mech Syst

Signal Process 114:604--627 (2019). Available from:

#link("https://doi.org/10.1016/j.ymssp.2018.05.011").] <bib-bearing3>

#block(above: .45em, below: .45em)[\[28\] Liu Y, Yan C, Shi J, et al. Nonlinear dynamic analysis of supporting

bearings in a rotor--bearing system considering vibration interaction.

Nonlinear Dyn 113:22435--22458 (2025). Available from:

#link("https://doi.org/10.1007/s11071-025-11350-6").] <bib-bearing4>

#block(above: .45em, below: .45em)[\[29\] Zeng Q, Liu Y, Du W, et al. Dynamic characteristic analysis of a

gear--rotor--bearing coupling system considering bearing fit. Nonlinear

Dyn 113:2131--2154 (2025). Available from:

#link("https://doi.org/10.1007/s11071-024-10290-x").] <bib-bearing5>

#block(above: .45em, below: .45em)[\[30\] Kalker JJ. Transient phenomena in two elastic cylinders rolling over

each other with dry friction. J Appl Mech 37(3):677--688 (1970).

Available from: #link("https://doi.org/10.1115/1.3408597").] <bib-Kalker51>

#block(above: .45em, below: .45em)[\[31\] Kalker JJ. Transient rolling contact phenomena. ASLE Trans

14(3):177--184 (1971). Available from:

#link("https://doi.org/10.1080/05698197108983240").] <bib-Kalker5>

#block(above: .45em, below: .45em)[\[32\] Kalker JJ. On the Rolling Contact of Two Elastic Bodies in the Presence

of Dry Friction. PhD thesis, TH Delft (1967).] <bib-KalkerPhD>

#block(above: .45em, below: .45em)[\[33\] Johnson KL. Contact Mechanics. Cambridge University Press (1985).

Available from: #link("https://doi.org/10.1017/CBO9781139171731").] <bib-Johnson>

#block(above: .45em, below: .45em)[\[34\] Goryacheva IG. Contact Mechanics in Tribology. Springer (1998).] <bib-Goryacheva>

#block(above: .45em, below: .45em)[\[35\] Barber JR. Contact Mechanics. Springer (2018). Available from:

#link("https://doi.org/10.1007/978-3-319-70939-0").] <bib-Barber>

#block(above: .45em, below: .45em)[\[36\] Vollebregt EAH. User Guide for CONTACT. Technical report TR09-03

(version 13).] <bib-Vollebregt1>

#block(above: .45em, below: .45em)[\[37\] Vollebregt EAH, Wilders P. FASTSIM2: a second-order accurate frictional

rolling contact algorithm. Comput Mech 47:105--116 (2011). Available

from: #link("https://doi.org/10.1007/s00466-010-0536-7").] <bib-Vollebregt2>

#block(above: .45em, below: .45em)[\[38\] Vollebregt EAH, Iwnicki SD, Xie G, Shackelton P. Assessing the accuracy

of simplified frictional rolling contact algorithms. Veh Syst Dyn

50(1):1--17 (2012). Available from:

#link("https://doi.org/10.1080/00423114.2011.552618").] <bib-Vollebregt3>

#block(above: .45em, below: .45em)[\[39\] Vollebregt EAH. Numerical modeling of measured railway creep--force

curves with CONTACT. Wear 314:87--95 (2014). Available from:

#link("https://doi.org/10.1016/j.wear.2013.11.030").] <bib-Vollebregt4>

#block(above: .45em, below: .45em)[\[40\] Nielsen JB. New Developments in the Theory of Wheel/Rail Contact

Mechanics. PhD thesis, Technical University of Denmark (1998). Available

from:

#link("https://orbit.dtu.dk/en/publications/new-developments-in-the-theory-of-wheelrail-contact-mechanics").] <bib-Nielsen>

#block(above: .45em, below: .45em)[\[41\] Dahlberg J, Alfredsson B. Transient rolling of cylindrical contacts with

constant and linearly increasing applied slip. Wear 266:316--326 (2009).

Available from: #link("https://doi.org/10.1016/j.wear.2008.07.008").] <bib-Alfredsson>

#block(above: .45em, below: .45em)[\[42\] Kalker JJ. Simplified theory of rolling contact. Delft Progress Report,

Series C (1973), 1--10.] <bib-KalkerSimp>

#block(above: .45em, below: .45em)[\[43\] Kalker JJ. Railway wheel and automotive tyre. Veh Syst Dyn

5(15):255--269 (1979).] <bib-Kalker4>

#block(above: .45em, below: .45em)[\[44\] Knothe K, Groß-Thebing A. Short-wavelength rail corrugation and

non-steady-state contact mechanics. Veh Syst Dyn 46(1--2):49--66 (2008).

Available from: #link("https://doi.org/10.1080/00423110701590180").] <bib-Gross>

#block(above: .45em, below: .45em)[\[45\] Alonso A, Giménez JG. Non-steady-state modelling of wheel--rail contact

for dynamic simulation of railway vehicles. Veh Syst Dyn 46(3):179--196

(2008). Available from:

#link("https://doi.org/10.1080/00423110701248011").] <bib-Alonso1>

#block(above: .45em, below: .45em)[\[46\] Guiral A, Alonso A, Baeza L, Giménez JG. Non-steady-state modelling of

wheel--rail contact. Veh Syst Dyn 51(1):91--108 (2013). Available from:

#link("https://doi.org/10.1080/00423114.2012.713499").] <bib-Alonso2>

#block(above: .45em, below: .45em)[\[47\] Ciavarella M, Barber J. Influence of longitudinal creepage and wheel

inertia on short-pitch corrugation. Proc IMechE Part J: Eng Tribol

222(3) (2008). Available from:

#link("https://doi.org/10.1243/13506501JET373").] <bib-Ciavarella1>

#block(above: .45em, below: .45em)[\[48\] Afferrante L, Ciavarella M. Short-pitch rail corrugation: a

resonance-free regime? Wear 266:9--10 (2008). Available from:

#link("https://doi.org/10.1016/j.wear.2008.12.003").] <bib-Ciavarella2>

#block(above: .45em, below: .45em)[\[49\] Afferrante L, Ciavarella M. Short-pitch corrugation of railway tracks

with wooden or concrete sleepers: an enigma solved? Tribol Int 43(3)

(2010). Available from:

#link("https://doi.org/10.1016/j.triboint.2009.09.010").] <bib-Ciavarella3>

#block(above: .45em, below: .45em)[\[50\] Al-Bender F, De Moerlooze K. A model of the transient behavior of

tractive rolling contacts. Advances in Tribology (2008). Available from:

#link("https://doi.org/10.1155/2008/214894").] <bib-Al-Bender>

#block(above: .45em, below: .45em)[\[51\] Romano L, Bruzelius F, Jacobson B. Unsteady-state brush theory. Veh Syst

Dyn (2020). Available from:

#link("https://doi.org/10.1080/00423114.2020.1774625").] <bib-USB>

#block(above: .45em, below: .45em)[\[52\] Romano L, Timpone F, Bruzelius F, Jacobson B. Analytical results in

transient brush tyre models: theory for large camber angles and classic

solutions with limited friction. Meccanica 57:165--191 (2022). Available

from: #link("http://dx.doi.org/10.1007/s11012-021-01422-3").] <bib-Meccanica2>

#block(above: .45em, below: .45em)[\[53\] Romano L, Timpone F, Bruzelius F, Jacobson B. Rolling, tilting and

spinning spherical wheels: analytical results using brush theory.

Mechanism and Machine Theory 173:104836 (2022). Available from:

#link("https://doi.org/10.1016/j.mechmachtheory.2022.104836").] <bib-SphericalWheel>

#block(above: .45em, below: .45em)[\[54\] Zhuravlev VP. The model of dry friction in the problem of rolling rigid

bodies. J Appl Math Mech 62(5):705--710 (1998).] <bib-Zhuravlev1>

#block(above: .45em, below: .45em)[\[55\] Zhuravlev VP. Friction laws in the case of combination of slip and spin.

Mech Solids 38(4):52--58 (2003).] <bib-Zhuravlev2>

#block(above: .45em, below: .45em)[\[56\] Kireenkov AA. About the motion of a symmetric rigid solid on a plane.

Proc. 8th Conf. DSTA, 95--102 (2005).] <bib-Kireenkov1>

#block(above: .45em, below: .45em)[\[57\] Kireenkov AA. Combined model of sliding and rolling friction in the

dynamics of bodies on a rough plane. Mech Solids 43(3):412--425 (2008).] <bib-Kireenkov2>

#block(above: .45em, below: .45em)[\[58\] Canudas-de-Wit C, Olsson H, Åström KJ, Lischinsky P. A new model for

control of systems with friction. IEEE Trans Autom Control

40(3):419--425 (1995).] <bib-Astrom1>

#block(above: .45em, below: .45em)[\[59\] Olsson H. Control Systems with Friction. Doctoral thesis, Lund Institute

of Technology (1996).] <bib-Olsson>

#block(above: .45em, below: .45em)[\[60\] Åström KJ, Canudas-de-Wit C. Revisiting the LuGre friction model. IEEE

Control Syst Mag 28(6):101--114 (2008).] <bib-Astrom2>

#block(above: .45em, below: .45em)[\[61\] Sorine M, Szymanski J. A new dynamic multi d.o.f. tire model.

Transportation Systems 2000, Braunschweig (2000).] <bib-Sorine>

#block(above: .45em, below: .45em)[\[62\] Canudas-de-Wit C, Tsiotras P. Dynamic tire friction models for vehicle

traction control. Proc. 38th IEEE CDC, 3746--3751 (1999). Available

from: #link("https//doi: 10.1109/CDC.1999.827937").] <bib-TsiotrasConf>

#block(above: .45em, below: .45em)[\[63\] Canudas-de-Wit C, Tsiotras P, Velenis E, et al. Dynamic friction models

for road/tire longitudinal interaction. Veh Syst Dyn 39(3):189--226

(2003). Available from:

#link("https//doi: 10.1076/vesd.39.3.189.14152").] <bib-Tsiotras1>

#block(above: .45em, below: .45em)[\[64\] Velenis E, Tsiotras P, Canudas-de-Wit C, Sorine M. Dynamic tyre friction

models for combined slip. Veh Syst Dyn 43:3--29 (2005). Available from:

#link("https//doi: 10.1080/00423110412331290464").] <bib-Tsiotras3>

#block(above: .45em, below: .45em)[\[65\] Deur J. Modeling and analysis of longitudinal tire dynamics based on the

LuGre friction model. IFAC Proc Vol 34(1):91--96 (2001). Available from:

#link("https://doi.org/10.1016/S1474-6670(17)34383-5").] <bib-Deur0>

#block(above: .45em, below: .45em)[\[66\] Deur J, Asgari J, Hrovat D. A 3D brush-type dynamic tire friction model.

Veh Syst Dyn 42(3):133--173 (2004). Available from:

#link("https://doi.org/10.1080/00423110412331282887").] <bib-Deur1>

#block(above: .45em, below: .45em)[\[67\] Deur J, Ivanović V, Troulis M, et al. Extensions of the LuGre tyre

friction model for variable slip speed. Veh Syst Dyn 43(1):508--524

(2005). Available from: #link("https//doi: 10.1080/00423110500229808").] <bib-Deur2>

#block(above: .45em, below: .45em)[\[68\] Swevers J, Al-Bender F, Ganseman CG, Projogo T. An integrated friction

model with improved presliding behavior. IEEE Trans Autom Control

45(4):675--686 (2000).] <bib-Integrated>

#block(above: .45em, below: .45em)[\[69\] Lampaert V, Swevers J, Al-Bender F. Modification of the Leuven

integrated friction model. IEEE Trans Autom Control 47(4):683--687

(2002).] <bib-Leuven>

#block(above: .45em, below: .45em)[\[70\] Dupont P, Armstrong B, Hayward V. Elasto-plastic friction model: contact

compliance and stiction. Proc. 2000 American Control Conference,

1072--1077 (2000).] <bib-Elasto1>

#block(above: .45em, below: .45em)[\[71\] Dupont P, Hayward V, Armstrong B, et al. Single-state elasto-plastic

friction models. IEEE Trans Autom Control 47:787--792 (2002).] <bib-Elasto2>

#block(above: .45em, below: .45em)[\[72\] Romano L, Aamo OM, Åslund J, Frisk E. First-order friction models with

bristle dynamics: lumped and distributed formulations. Submitted to IEEE

Trans Control Syst Technol (2025).] <bib-FrBD>

#block(above: .45em, below: .45em)[\[73\] Romano L, Bruzelius F, Jacobson B. An extended LuGre-brush tyre model

for large camber angles and turning speeds. Veh Syst Dyn (2022).

Available from: #link("https://doi.org/10.1080/00423114.2022.2086887").] <bib-LuGreSpin>

#block(above: .45em, below: .45em)[\[74\] Deubel C, Dittrich B, Meinck J, Prokop G. Experimental analysis and

modelling of friction in automotive shock absorbers under side forces.

Tribology International 215A (2026):111328. Available from:

#link("https://doi.org/10.1016/j.triboint.2025.111328").] <bib-Trib1>

#block(above: .45em, below: .45em)[\[75\] Rill G, Schaeffer T, Schuderer M. LuGre or not LuGre. Multibody Syst Dyn

60:191--218 (2024). Available from:

#link("https://doi.org/10.1007/s11044-023-09909-5").] <bib-Rill>

#block(above: .45em, below: .45em)[\[76\] Bekesi BJ, Antali M, Csernak G. Phase portraits and bifurcations induced

by static and dynamic friction models. Nonlinear Dyn 13:15863--15899

(2025). Available from:

#link("https://doi.org/10.1007/s11071-025-10974-y").] <bib-Antali>

#block(above: .45em, below: .45em)[\[77\] Edwards CH. Advanced Calculus of Several Variables, Vol. III --

Successive Approximations and Implicit Functions. Academic Press (1973).] <bib-Edwards>

#block(above: .45em, below: .45em)[\[78\] Romano L, Maglio M, Bruni S. Transient wheel--rail rolling contact

theories. Tribology International (2023).] <bib-Tribology>

#block(above: .45em, below: .45em)[\[79\] Khalil HK. Nonlinear Systems. 3rd ed. Prentice Hall, Upper Saddle River

(2002).] <bib-Khalil>

#block(above: .45em, below: .45em)[\[80\] Mironchenko A, Prieur C. Input-to-state stability of

infinite-dimensional systems: recent results and open questions. SIAM

Review 62(3) (2020).] <bib-Prieur>

#block(above: .45em, below: .45em)[\[81\] Romano L, Aamo OM, Åslund J, Frisk E. Stability and dissipativity of the

distributed LuGre friction model. IEEE Control Syst Lett (2025).

Available from: #link("https://doi:10.1109/LCSYS.2025.3572419").] <bib-DistrLuGre>

#block(above: .45em, below: .45em)[\[82\] Curtain RF, Zwart H. Introduction to Infinite-Dimensional Systems

Theory: A State-Space Approach. Springer, New York (2020). Available

from: #link("https://doi.org/10.1007/978-1-0716-0590-5").] <bib-Zwart>

#block(above: .45em, below: .45em)[\[83\] Goyal S, Ruina A, Papadopoulos J. Limit surface and moment function

descriptions of planar sliding. Proc. IEEE ICRA, 794--795 (1989).] <bib-Goyal1>

#block(above: .45em, below: .45em)[\[84\] Goyal S, Ruina A, Papadopoulos J. Planar sliding with dry friction. Wear

143(2):307--330 (1991).] <bib-Goyal2>

#block(above: .45em, below: .45em)[\[85\] Fors V, Olofsson B, Nielsen L. Formulation and interpretation of optimal

braking and steering patterns for autonomous safety-critical manoeuvres.

Veh Syst Dyn 57(8):1206--1223 (2019). Available from:

#link("https://doi.org/10.1080/00423114.2018.1549331").] <bib-Fors1>

#block(above: .45em, below: .45em)[\[86\] Fors V, Olofsson B, Nielsen L. Attainable force volumes for optimal

autonomous at-the-limit manoeuvres. Veh Syst Dyn 58(7):1101--1122

(2020). Available from:

#link("https://doi.org/10.1080/00423114.2019.1608363").] <bib-Fors2>

#block(above: .45em, below: .45em)[\[87\] Fors V, Olofsson B, Nielsen L. Autonomous wary collision avoidance. IEEE

Trans Intell Vehicles 6(2):353--365 (2021). Available from:

#link("https://doi.org/10.1109/TIV.2020.3029853").] <bib-Fors3>

#block(above: .45em, below: .45em)[\[88\] Fors V, Anistratov P, Olofsson B, Nielsen L. Predictive force-centric

emergency collision avoidance. J Dyn Syst Meas Control 143(8):081005

(2021). Available from: #link("https://doi.org/10.1115/1.4050403").] <bib-Fors4>

#block(above: .45em, below: .45em)[\[89\] Waltersson GA, Karayiannidis Y. Planar friction modeling with LuGre

dynamics and limit surfaces. IEEE Trans Robot 40:3166--3180 (2024).] <bib-2D>

#block(above: .45em, below: .45em)[\[90\] Higuchi A, Pacejka HB. The relaxation length concept at large wheel slip

and camber. Veh Syst Dyn 25(sup001):50--64 (1997). Available from:

#link("https://doi.org/10.1080/00423119708969644").] <bib-Higuchi2>

#block(above: .45em, below: .45em)[\[91\] Rill G. Simple contact calculation for handling tyre models. Multibody

Syst Dyn 45:131--153 (2019). Available from:

#link("https://doi.org/10.1007/s11044-018-9629-4").] <bib-Rill1>

#block(above: .45em, below: .45em)[\[92\] Shaju A, Pandey AK. Modelling transient response using PAC 2002-based

tyre model. Veh Syst Dyn (2020). Available from:

#link("https://doi.org/10.1080/00423114.2020.1802048").] <bib-PAC>

#block(above: .45em, below: .45em)[\[93\] Takács D, Orosz G, Stépán G. Delay effects in shimmy dynamics of wheels

with stretched string-like tyres. Eur J Mech A/Solids 28(3):516--525

(2009).] <bib-Takacs1>

#block(above: .45em, below: .45em)[\[94\] Takács D, Stépán G. Micro-shimmy of towed structures in unstable

parameter domains. Veh Syst Dyn 50(11):1613--1630 (2012).] <bib-Takacs2>

#block(above: .45em, below: .45em)[\[95\] Takács D, Stépán G, Hogan SJ. Large amplitude periodic motions of towed

rigid wheels. Nonlinear Dyn 52:27--34 (2008). Available from:

#link("https://doi.org/10.1007/s11071-007-9253-y").] <bib-Takacs3>

#block(above: .45em, below: .45em)[\[96\] Takács D, Stépán G. Experiments on quasiperiodic wheel shimmy. J Comput

Nonlinear Dyn 4(3):031007 (2009). Available from:

#link("https://doi.org/10.1115/1.3124786").] <bib-Takacs4>

#block(above: .45em, below: .45em)[\[97\] Takács D, Stépán G. Contact patch memory of tyres leading to lateral

vibrations of vehicles. Phil Trans R Soc A 371:20120427 (2013).

Available from: #link("http://doi.org/10.1098/rsta.2012.0427").] <bib-Takacs5>

#block(above: .45em, below: .45em)[\[98\] Romano L, Aamo OM, Åslund J, Frisk E. Stability analysis of linear

single-track models with transient tyre dynamics. Veh Syst Dyn (2024).

Available from: #link("https://doi.org/10.1080/00423114.2024.2445163").] <bib-BicyclePDE>

#block(above: .45em, below: .45em)[\[99\] Romano L, Aamo OM, Åslund J, Frisk E. Semilinear single-track models

with distributed tyre friction dynamics. Nonlinear Dyn (2025).] <bib-SemilinearV>

#block(above: .45em, below: .45em)[\[100\] Colantonio L, Dehombreux P, Hajžman M, et al. 3D projection of the LuGre

friction model adapted to varying normal forces. Multibody Syst Dyn

55:267--291 (2022). Available from:

#link("https://doi.org/10.1007/s11044-022-09820-5").] <bib-Colantonio>

#block(above: .45em, below: .45em)[\[101\] Romano L, Målqvist A. Finite element modelling of linear rolling contact

problems. ESAIM: M2AN 58(5):1541--1579 (2024). Available from:

#link("https://doi.org/10.1051/m2an/2024052").] <bib-MScthesis>

#block(above: .45em, below: .45em)[\[102\] Bardos C. Problèmes aux limites pour les équations du premier ordre à

coefficients réels. Ann Sci Éc Norm Supér 4(3):185--233 (1970).] <bib-Bardos>

#block(above: .45em, below: .45em)[\[103\] Pazy A. Semigroups of Linear Operators and Applications to PDEs.

Springer, New York (1983). Available from:

#link("https://doi.org/10.1007/978-1-4612-5561-1").] <bib-Pazy>

#block(above: .45em, below: .45em)[\[104\] Tanabe H. Equations of Evolution. Pitman, London (1979).] <bib-Tanabe1>

#block(above: .45em, below: .45em)[\[105\] Tanabe H. Functional Analytic Methods for Partial Differential

Equations. CRC Press (1997).] <bib-Tanabe>
#set heading(numbering: "A.1")
#counter(heading).update(0)

= Technical results
<app:1>
This appendix collects some technical results. Specifically,
Appendix~#link(<app:Proof1>)[A.1] below sketches the proof of Theorem~#link(<thm:ex2>)[3.2],
whereas Appendices~#link(<app:Proof2>)[A.2] and~#link(<app:Proof3>)[A.3] contain the proofs of
Lemmata~#link(<lemma:boundedness>)[4.1] and~#link(<lemma:DissF20>)[4.2], respectively.

== Proof of Theorem~#link(<thm:ex2>)[3.2]
<app:Proof1>
The proof of Theorem~#link(<app:Proof1>)[A.1] is sketched below.

#block[
#emph[Sketch of the proof of Theorem~#link(<thm:ex2>)[3.2].] Under the stated
assumptions on $partial cal(C)$, the unbounded operator
$\( cal(A) \, cal(D) \( cal(A) \) \)$, defined by
$ \( cal(A) bold(zeta) \) \( bold(x) \) & eq.delta - #scale(x: 120%, y: 120%)[\(] macron(bold(V)) \( bold(x) \) dot.op nabla_(bold(x)) #scale(x: 120%, y: 120%)[\)] bold(zeta) \( bold(x) \) \,\
cal(D) \( cal(A) \) & eq.delta #scale(x: 180%, y: 180%)[{] bold(zeta) in H^1 \( accent(cal(C), circle.stroked) \; bb(R)^2 \) #scale(x: 180%, y: 180%)[\|] bold(zeta) = bold(0) \, #h(0em) bold(x) in cal(L) #scale(x: 180%, y: 180%)[}] \, $
generates a $C_0$-semigroup on $L^2 \( accent(cal(C), circle.stroked) \; bb(R)^2 \)$
(see \[#link(<bib-Bardos>)[102]\]). The following perturbative term
$bold(f) : L^2 \( accent(cal(C), circle.stroked) \; bb(R)^2 \) times \[ 0 \, S \] mapsto L^2 \( accent(cal(C), circle.stroked) \; bb(R)^2 \)$
is now considered:
$ bold(f) \( bold(z) \, s \) eq.delta tilde(upright(bold(Sigma))) \( bold(x) \, s \) bold(z) \( bold(x) \) + tilde(bold(h)) \( bold(x) \, s \) . $
The conditions
$tilde(upright(bold(Sigma)))_phi in C^0 \( cal(C) times \[ 0 \, S \] \; upright(bold(M))_2 \( bb(R) \) \)$
and
$tilde(bold(h)) in C^0 \( \[ 0 \, S \] \; L^2 \( accent(cal(C), circle.stroked) \; bb(R)^2 \) \)$
imply that
$bold(f) : L^2 \( accent(cal(C), circle.stroked) \; bb(R)^2 \) times \[ 0 \, S \] mapsto L^2 \( accent(cal(C), circle.stroked) \; bb(R)^2 \)$
is continuous in $s$ on $\[ 0 \, S \]$, and uniformly Lipschitz
continuous on $L^2 \( accent(cal(C), circle.stroked) \; bb(R)^2 \)$. Hence, all the
hypotheses of Theorem 6.1.2 in \[#link(<bib-Pazy>)[103]\] are verified, ensuring the
existence and uniqueness of a mild solution
$bold(z) in C^0 \( \[ 0 \, S \] \; L^2 \( accent(cal(C), circle.stroked) \; bb(R)^2 \) \)$
for all ICs $bold(z)_0 in L^2 \( accent(cal(C), circle.stroked) \; bb(R)^2 \)$.
Similarly, for
$tilde(upright(bold(Sigma)))_phi in C^1 \( cal(C) times \[ 0 \, S \] \; upright(bold(M))_2 \( bb(R) \) \)$
and
$tilde(bold(h)) in C^1 \( \[ 0 \, S \] \; L^2 \( accent(cal(C), circle.stroked) \; bb(R)^2 \) \)$,
all the hypotheses of Theorems 6.1.5 in \[#link(<bib-Pazy>)[103]\] or 2.2 in \[#link(<bib-MScthesis>)[101]\] are
verified (see also \[#link(<bib-Tanabe1>)[104], #link(<bib-Tanabe>)[105]\]), ensuring the existence and
uniqueness of a classical solution
$bold(z) in C^1 \( \[ 0 \, S \] \; L^2 \( accent(cal(C), circle.stroked) \; bb(R)^2 \) \) inter C^0 \( \[ 0 \, S \] \; cal(D) \( cal(A) \) \)$
for all ICs $bold(z)_0 in cal(D) \( cal(A) \)$, which is equivalent to
$bold(z) in C^1 \( \[ 0 \, S \] \; L^2 \( accent(cal(C), circle.stroked) \; bb(R)^2 \) \) inter C^0 \( \[ 0 \, S \] \; H^1 \( accent(cal(C), circle.stroked) \; bb(R)^2 \) \)$
satisfying the BC~#link(<eq:quasiStationary0>)[(57b)].~◻

]
== Proof of Lemma~#link(<lemma:boundedness>)[4.1]
<app:Proof2>
The proof of Lemma~#link(<lemma:boundedness>)[4.1] is given below.

#block[
#emph[Proof of Lemma~#link(<lemma:boundedness>)[4.1].] The proof is worked out for
the PDE~#link(<eq:quasiStationary0>)[(57)]\; the
result for~#link(<eq:standard2>)[(45)] follows as a special
case. To start, it must be noted that Eq.~#link(<eq:N>)[(61)]
implies the existence of a vector
$bb(R)^2 in.rev bold(nu) = \[ nu_x #h(0em) - nu_y \]^(upright(T)) eq.not bold(0)$
and a constant $eta in bb(R)_(> 0)$ such that
#math.equation(block: true, numbering: _ => [(84)], $ N \( bold(x) \) eq.delta phi_1 bold(nu) dot.op #scale(x: 120%, y: 120%)[\(] bold(x) - bold(x)_(C_(phi_1)) #scale(x: 120%, y: 120%)[\)] < - eta \, quad bold(x) in cal(C) . $) <eq:N2>
Accordingly, the following Lyapunov function candidate is considered:
#math.equation(block: true, numbering: _ => [(85)], $ W #scale(x: 120%, y: 120%)[\(] bold(z) \( dot.op \, s \) #scale(x: 120%, y: 120%)[\)] eq.delta 1 / 2 integral.double_(cal(C)) P \( bold(x) \) bold(z)^(upright(T)) \( bold(x) \, s \) bold(z) \( bold(x) \, s \) upright(d) bold(x) \, $) <eq:Lyapunov1>
where $P \( bold(x) \) = exp \( theta bold(nu) dot.op bold(x) \)$ with
$theta in bb(R)_(> 0)$ to be appropriately selected. Taking the
derivative of the above~#link(<eq:Lyapunov1>)[(85)] along
the dynamics~(57a)
yields
$ dot(W) \( s \) & = - 1 / 2 integral.double_(cal(C)) P \( bold(x) \) macron(bold(V)) \( bold(x) \) dot.op nabla_(bold(x)) ∥bold(z) \( bold(x) \, s \)∥_2^2 upright(d) bold(x) + integral.double_(cal(C)) P \( bold(x) \) bold(z)^(upright(T)) \( bold(x) \, s \) tilde(upright(bold(Sigma)))_phi \( bold(x) \, s \) bold(z) \( bold(x) \, s \) upright(d) bold(x)\
 & quad + integral.double_(cal(C)) P \( bold(x) \) bold(z)^(upright(T)) \( bold(x) \, s \) tilde(bold(h)) \( bold(x) \, s \) upright(d) bold(x) \, quad s in bb(R)_(> 0) . $
Integrating by parts the first term and recalling that
$macron(bold(V)) \( bold(x) \)$ is solenoidal, namely
$nabla_(bold(x)) dot.op macron(bold(V)) \( bold(x) \) = 0$, gives
#math.equation(block: true, numbering: _ => [(87)], $ dot(W) \( s \) & lt.eq - 1 / 2 integral.cont_(partial cal(C)) P \( bold(x) \) ∥bold(z) \( bold(x) \, s \)∥_2^2 macron(bold(V)) \( bold(x) \) dot.op hat(bold(n))_(partial cal(C)) \( bold(x) \) upright(d) l + 1 / 2 integral.double_(cal(C)) theta P \( bold(x) \) N \( bold(x) \) ∥bold(z) \( bold(x) \, s \)∥_2^2 upright(d) bold(x)\
 & quad + integral.double_(cal(C)) P \( bold(x) \) bold(z)^(upright(T)) \( bold(x) \, s \) tilde(upright(bold(Sigma)))_phi \( bold(x) \, s \) bold(z) \( bold(x) \, s \) upright(d) bold(x) + integral.double_(cal(C)) P \( bold(x) \) bold(z)^(upright(T)) \( bold(x) \, s \) tilde(bold(h)) \( bold(x) \, s \) upright(d) bold(x) \, quad s in bb(R)_(> 0) \, $) <eq:Lyap11>
with $N \( bold(x) \)$ as in Eq.~#link(<eq:N>)[(61)]. The
BC~#link(<eq:quasiStationary0>)[(57b)] ensures the first term
on the right-hand side of Eq.~#link(<eq:Lyap11>)[(87)] to be
nonpositive. Hence, utilising the inequality~#link(<eq:N>)[(61)]
gives
#math.equation(block: true, numbering: _ => [(88)], $ dot(W) \( s \) & lt.eq - 1 / 2 integral.double_(cal(C)) theta eta P \( bold(x) \) ∥bold(z) \( bold(x) \, s \)∥_2^2 upright(d) bold(x) + integral.double_(cal(C)) P \( bold(x) \) bold(z)^(upright(T)) \( bold(x) \, s \) tilde(upright(bold(Sigma)))_phi \( bold(x) \, s \) bold(z) \( bold(x) \, s \) upright(d) bold(x)\
 & quad + integral.double_(cal(C)) P \( bold(x) \) bold(z)^(upright(T)) \( bold(x) \, s \) tilde(bold(h)) \( bold(x) \, s \) upright(d) bold(x) \, quad s in bb(R)_(> 0) . $) <eq:Lyap12>
Moreover,
$macron(bold(v)) in C^0 \( cal(C) times bb(R)_(gt.eq 0) \; bb(R)^2 \) inter L^oo \( cal(C) times bb(R)_(gt.eq 0) \; bb(R)^2 \)$,
$V ""_(upright(r)) in C^0 \( bb(R)_(gt.eq 0) \; \[ V ""_(upright(m i n)) \, V ""_(upright(m a x)) \] \)$,
and
$bold(phi) in bb(R) times C^0 \( bb(R)_(gt.eq 0) \; bb(R) \) inter bb(R) times L^oo \( bb(R)_(gt.eq 0) \; bb(R) \)$
imply the existence of constants
$M_(tilde(upright(bold(Sigma)))_phi) \, M_(upright(bold(H))) in bb(R)_(gt.eq 0)$
such that
$ ∥tilde(upright(bold(Sigma)))_phi \( bold(x) \, s \)∥ & lt.eq M_(tilde(upright(bold(Sigma)))_phi) \,\
∥tilde(bold(h)) \( bold(x) \, s \)∥_2 & lt.eq M_(upright(bold(H))) ∥macron(bold(v)) \( bold(x) \, s \)∥_2 \, $
for all $\( bold(x) \, s \) in cal(C) times bb(R)_(gt.eq 0)$. Then,
Applying Cauchy-Schwarz and subsequently Young's inequality for products
to the last integral in Eq.~#link(<eq:Lyap12>)[(88)] produces
#math.equation(block: true, numbering: _ => [(90)], $ dot(W) \( s \) & lt.eq - 1 / 2 integral.double_(cal(C)) \( theta eta - 2 M_(tilde(upright(bold(Sigma)))_phi) - 1 \) P \( bold(x) \) ∥bold(z) \( bold(x) \, s \)∥_2^2 upright(d) bold(x) + 1 / 2 M_(upright(bold(H)))^2 integral.double_(cal(C)) P \( bold(x) \) ∥bold(v) \( bold(x) \, s \)∥_2^2 upright(d) bold(x) \, quad s in bb(R)_(> 0) . $) <eq:Lyap13>
Thus, choosing
$theta > \( 2 M_(tilde(upright(bold(Sigma)))_phi) + 1 \) \/ eta$ yields
the existence of $rho \, mu in bb(R)_(> 0)$ such that
#math.equation(block: true, numbering: _ => [(91)], $ dot(W) \( s \) & lt.eq - rho W \( s \) + mu ∥macron(bold(v)) \( dot.op \, dot.op \)∥_oo^2 \, quad s in bb(R)_(> 0) . $) <eq:Lyap14>
Finally, invoking the Grönwall-Bellman inequality provides
#math.equation(block: true, numbering: _ => [(92)], $ W #scale(x: 120%, y: 120%)[\(] bold(z) \( dot.op \, s \) #scale(x: 120%, y: 120%)[\)] & lt.eq exp \( - rho s \) W #scale(x: 120%, y: 120%)[\(] bold(z)_0 \( dot.op \) #scale(x: 120%, y: 120%)[\)] + mu / rho ∥macron(bold(v)) \( dot.op \, dot.op \)∥_oo^2 \, quad s in bb(R)_(gt.eq 0) . $) <eq:LyapGron>
Since the Lyapunov function~#link(<eq:Lyapunov1>)[(85)] is
equivalent to a squared norm on $L^2 \( accent(cal(C), circle.stroked) \; bb(R)^2 \)$,
Eq.~#link(<eq:LyapGron>)[(92)]
implies~#link(<eq:ISSbetaGamma>)[(59)]. Concerning more
specifically the PDE~#link(<eq:standard2>)[(45)], the vector
$bold(nu)$ in $P \( bold(x) \)$ may be specified as
$bold(nu) = \[ 1 #h(0em) 0 \]^(upright(T))$ (the same is also true if
$bold(epsilon) = \[ 0 #h(0em) 1 \]^(upright(T))$ in
Eq.~#link(<eq:Vss>)[(58)]).~◻

]
== Proof of Lemma~#link(<lemma:DissF20>)[4.2]
<app:Proof3>
The proof of Lemma~#link(<lemma:DissF20>)[4.2] is given below.

#block[
#emph[Proof of Lemma~#link(<lemma:DissF20>)[4.2].] Computing
$chevron.l p \( dot.op \) bold(f) \( dot.op \, s \) \, macron(bold(v)) \( dot.op \, s \) chevron.r_(L^2 \( accent(cal(C), circle.stroked) \; bb(R)^2 \))$
provides
#math.equation(block: true, numbering: _ => [(93)], $ #scale(x: 120%, y: 120%)[chevron.l] p \( dot.op \) bold(f) \( dot.op \, s \) \, macron(bold(v)) \( dot.op \, s \) #scale(x: 120%, y: 120%)[chevron.r]_(L^2 \( accent(cal(C), circle.stroked) \; bb(R)^2 \)) & = integral.double_(cal(C)) p \( bold(x) \) bold(z)^(upright(T)) \( bold(x) \, s \) upright(bold(Sigma))_0 macron(bold(v)) \( bold(x) \, s \) upright(d) bold(x) + integral.double_(cal(C)) p \( bold(x) \) frac(upright(d) bold(z)^(upright(T)) \( bold(x) \, s \), upright(d) s) V ""_(upright(r)) upright(bold(Sigma))_1 macron(bold(v)) \( bold(x) \, s \) upright(d) bold(x)\
 & = integral.double_(cal(C)) p \( bold(x) \) bold(z)^(upright(T)) \( bold(x) \, s \) #scale(x: 180%, y: 180%)[\[] upright(bold(Sigma))_0 + V ""_(upright(r)) tilde(upright(bold(Sigma))) \( bold(x) \, s \)^(upright(T)) upright(bold(Sigma))_1 #scale(x: 180%, y: 180%)[\]] macron(bold(v)) \( bold(x) \, s \) upright(d) bold(x)\
 & quad + integral.double_(cal(C)) V ""_(upright(r)) p \( bold(x) \) macron(bold(v))^(upright(T)) \( bold(x) \, s \) upright(bold(H)) #scale(x: 120%, y: 120%)[\(] macron(bold(v)) \( bold(x) \, s \) \, s #scale(x: 120%, y: 120%)[\)]^(upright(T)) upright(bold(Sigma))_1 macron(bold(v)) \( bold(x) \, s \) upright(d) bold(x) \, quad s in \( 0 \, S \) . $) <eq:w0>
Moreover, differentiating Eq.~#link(<eq:VdissF2>)[(70)] along
the dynamics~#link(<eq:standard2>)[(45a)]
or~(57a) gives
#math.equation(block: true, numbering: _ => [(94)], $ dot(W) #scale(x: 120%, y: 120%)[\(] bold(z) \( dot.op \, s \) #scale(x: 120%, y: 120%)[\)] & = integral.double_(cal(C)) p \( bold(x) \) bold(z)^(upright(T)) \( bold(x) \, s \) upright(bold(Sigma))_0 frac(partial bold(z) \( bold(x) \, s \), partial s) upright(d) bold(x)\
 & = integral.double_(cal(C)) p \( bold(x) \) bold(z)^(upright(T)) \( bold(x) \, s \) upright(bold(Sigma))_0 #scale(x: 180%, y: 180%)[\(] tilde(upright(bold(Sigma))) \( bold(x) \, s \) bold(z) \( bold(x) \, s \) + upright(bold(H)) #scale(x: 120%, y: 120%)[\(] macron(bold(v)) \( bold(x) \, s \) \, s #scale(x: 120%, y: 120%)[\)] macron(bold(v)) \( bold(x) \, s \) #scale(x: 180%, y: 180%)[\)] upright(d) bold(x)\
 & quad - 1 / 2 integral.double_(cal(C)) p \( bold(x) \) macron(bold(V)) \( bold(x) \) dot.op nabla_(bold(x)) #scale(x: 180%, y: 180%)[\(] bold(z)^(upright(T)) \( bold(x) \, s \) upright(bold(Sigma))_0 bold(z) \( bold(x) \, s \) #scale(x: 180%, y: 180%)[\)] upright(d) bold(x) \, quad s in \( 0 \, S \) . $) <eq:WdotPass>
Subtracting Eq.~#link(<eq:WdotPass>)[(94)] from both sides
of~#link(<eq:w0>)[(93)] yields
$  & #scale(x: 120%, y: 120%)[chevron.l] p \( dot.op \) bold(f) \( dot.op \, s \) \, macron(bold(v)) \( dot.op \, s \) #scale(x: 120%, y: 120%)[chevron.r]_(L^2 \( accent(cal(C), circle.stroked) \; bb(R)^2 \)) - dot(W) #scale(x: 120%, y: 120%)[\(] bold(z) \( dot.op \, s \) #scale(x: 120%, y: 120%)[\)] = integral.double_(cal(C)) p \( bold(x) \) bold(z)^(upright(T)) \( bold(x) \, s \) upright(bold(Q))_1 \( bold(x) \, s \) bold(z) \( bold(x) \, s \) upright(d) bold(x)\
 & #h(2em) + integral.double_(cal(C)) V ""_(upright(r)) p \( bold(x) \) macron(bold(v))^(upright(T)) \( bold(x) \, s \) upright(bold(Q))_2 \( bold(x) \, s \) macron(bold(v)) \( bold(x) \, s \) upright(d) bold(x)\
 & #h(2em) + 1 / 2 integral.double_(cal(C)) p \( bold(x) \) macron(bold(V)) \( bold(x) \) dot.op nabla_(bold(x)) #scale(x: 180%, y: 180%)[\(] bold(z)^(upright(T)) \( bold(x) \, s \) upright(bold(Sigma))_0 bold(z) \( bold(x) \, s \) #scale(x: 180%, y: 180%)[\)] upright(d) bold(x) \, quad s in \( 0 \, S \) \, $
where
$ upright(bold(Q))_1 \( bold(x) \, s \) & eq.delta - upright(bold(Sigma))_0 tilde(upright(bold(Sigma))) \( bold(x) \, s \) = frac(1, V ""_(upright(r))) ∥upright(bold(M)) #scale(x: 120%, y: 120%)[\(] V ""_(upright(r)) macron(bold(v)) \( bold(x) \, s \) #scale(x: 120%, y: 120%)[\)] V ""_(upright(r)) macron(bold(v)) \( bold(x) \, s \)∥_(2 \, epsilon) upright(bold(Sigma))_0 upright(bold(G))^(- 1) #scale(x: 120%, y: 120%)[\(] V ""_(upright(r)) macron(bold(v)) \( bold(x) \, s \) #scale(x: 120%, y: 120%)[\)] upright(bold(Sigma))_0 \,\
upright(bold(Q))_2 \( bold(x) \, s \) & eq.delta upright(bold(H)) #scale(x: 120%, y: 120%)[\(] macron(bold(v)) \( bold(x) \, s \) \, s #scale(x: 120%, y: 120%)[\)]^(upright(T)) upright(bold(Sigma))_1 = upright(bold(M))^2 #scale(x: 120%, y: 120%)[\(] V ""_(upright(r)) macron(bold(v)) \( bold(x) \, s \) #scale(x: 120%, y: 120%)[\)] upright(bold(G))^(- 1) #scale(x: 120%, y: 120%)[\(] V ""_(upright(r)) macron(bold(v)) \( bold(x) \, s \) #scale(x: 120%, y: 120%)[\)] upright(bold(Sigma))_1 . $
Clearly,
$upright(bold(S y m))_2 \( bb(R) \) in.rev upright(bold(Q))_1 \( bold(x) \, s \) succ.curly.eq upright(bold(0))$
for all $\( bold(x) \, s \) in cal(C) times bb(R)_(gt.eq 0)$. Moreover,
the condition
$upright(bold(M))^2 \( bold(y) \) upright(bold(G))^(- 1) \( bold(y) \) upright(bold(Sigma))_1 succ.curly.eq upright(bold(0))$
for all $bold(y) in bb(R)^2$ ensures that
$upright(bold(S y m))_2 \( bb(R) \) in.rev upright(bold(Q))_2 \( bold(x) \, s \) succ.curly.eq upright(bold(0))$
for all $\( bold(x) \, s \) in cal(C) times bb(R)_(gt.eq 0)$. Hence,
$ #scale(x: 120%, y: 120%)[chevron.l] p \( dot.op \) bold(f) \( dot.op \, s \) \, macron(bold(v)) \( dot.op \, s \) #scale(x: 120%, y: 120%)[chevron.r]_(L^2 \( accent(cal(C), circle.stroked) \; bb(R)^2 \)) & gt.eq dot(W) #scale(x: 120%, y: 120%)[\(] bold(z) \( dot.op \, s \) #scale(x: 120%, y: 120%)[\)] + 1 / 2 integral.double_(cal(C)) p \( bold(x) \) macron(bold(V)) \( bold(x) \) dot.op nabla_(bold(x)) #scale(x: 180%, y: 180%)[\(] bold(z)^(upright(T)) \( bold(x) \, s \) upright(bold(Sigma))_0 bold(z) \( bold(x) \, s \) #scale(x: 180%, y: 180%)[\)] upright(d) bold(x) \, quad s in \( 0 \, S \) . $
Integrating by parts and enforcing the
BC~#link(<eq:standard2>)[(45b)]
or~#link(<eq:quasiStationary0>)[(57b)] gives
#math.equation(block: true, numbering: _ => [(98)], $ #scale(x: 120%, y: 120%)[chevron.l] p \( dot.op \) bold(f) \( dot.op \, s \) \, macron(bold(v)) \( dot.op \, s \) #scale(x: 120%, y: 120%)[chevron.r]_(L^2 \( accent(cal(C), circle.stroked) \; bb(R)^2 \)) & gt.eq dot(W) #scale(x: 120%, y: 120%)[\(] bold(z) \( dot.op \, s \) #scale(x: 120%, y: 120%)[\)] - 1 / 2 integral.double_(cal(C)) #scale(x: 120%, y: 120%)[\(] nabla_(bold(x)) dot.op p \( bold(x) \) macron(bold(V)) \( bold(x) \) #scale(x: 120%, y: 120%)[\)] bold(z)^(upright(T)) \( bold(x) \, s \) upright(bold(Sigma))_0 bold(z) \( bold(x) \, s \) upright(d) bold(x) \, quad s in \( 0 \, S \) . $) <eq:w02>
Therefore, if inequality~#link(<eq:condP>)[(69)] holds, it may
be concluded that
#math.equation(block: true, numbering: _ => [(99)], $ #scale(x: 120%, y: 120%)[chevron.l] p \( dot.op \) bold(f) \( dot.op \, s \) \, macron(bold(v)) \( dot.op \, s \) #scale(x: 120%, y: 120%)[chevron.r]_(L^2 \( accent(cal(C), circle.stroked) \; bb(R)^2 \)) & gt.eq dot(W) #scale(x: 120%, y: 120%)[\(] bold(z) \( dot.op \, s \) #scale(x: 120%, y: 120%)[\)] \, quad s in \( 0 \, S \) . $) <eq:w03>
Integrating the above Eq.~#link(<eq:w03>)[(99)]
proves~#link(<eq:Fvres>)[(68)] with
$w \( bold(f) \( dot.op \, s \) \, macron(bold(v)) \( dot.op \, s \) \) = chevron.l p \( dot.op \) bold(f) \( dot.op \, s \) \, macron(bold(v)) ""_(upright(r)) \( dot.op \, s \) chevron.r_(L^2 \( accent(cal(C), circle.stroked) \; bb(R)^2 \)) = chevron.l p \( dot.op \) bold(f) \( dot.op \, s \) \, macron(bold(v)) \( dot.op \, s \) chevron.r_(L^2 \( accent(cal(C), circle.stroked) \; bb(R)^2 \))$.~◻

]
= Details on contact area and pressure distribution modelling
<app:Patch>
A general way of modelling a steady-state contact area is using the
superellipse
#math.equation(block: true, numbering: _ => [(100)], $ cal(C) = #scale(x: 300%, y: 300%)[{] bold(x) in bb(R)^2 #scale(x: 300%, y: 300%)[\|] #scale(x: 240%, y: 240%)[\(] x / a #scale(x: 240%, y: 240%)[\)]^n + #scale(x: 240%, y: 240%)[\(] y / b #scale(x: 240%, y: 240%)[\)]^m lt.eq 1 #scale(x: 300%, y: 300%)[}] \, $) <eq:contactPatch>
where $a in bb(R)_(> 0)$ and $b in bb(R)_(> 0)$ denote the contact area
semilength and semiwidth, respectively. For $n = m = 2$,
Eq.~#link(<eq:contactPatch>)[(100)] obviously yields an
elliptical contact patch, and it may also approximate arbitrarily well a
rectangular shape for large $n \, m in 2 bb(N)$. Similarly, a
steady-state contact pressure may be modelled as
$ p \( bold(x) \) = p_0 macron(p) \( bold(x) \) \, quad bold(x) in cal(C) \, $
where
$ p_0 eq.delta frac(F_z, integral.double_(cal(C)) macron(p) \( bold(x) \) upright(d) bold(x)) \, $
and $macron(p) in C^0 \( cal(C) \; bb(R)_(gt.eq 0) \)$ denotes a shape
function. In particular, for a constant pressure distribution, the
following expressions may be deduced:
#math.equation(block: true, numbering: _ => [(103)], $ p_0 = frac(F_z, 4 a b upright(B) #scale(x: 240%, y: 240%)[\(] 1 / n \, 1 / m + 1 #scale(x: 240%, y: 240%)[\)]) \, quad upright(a n d) quad macron(p) \( bold(x) \) = 1 \, quad bold(x) in cal(C) \, $) <eq:constantPress>
where $upright(B) \( dot.op \, dot.op \)$ denotes the Beta function,
defined as
$ upright(B) \( p \, q \) = upright(B) \( p \, q \) = frac(upright(Gamma) \( p \) upright(Gamma) \( q \), upright(Gamma) \( p + q \)) \, $
in which $upright(Gamma) \( dot.op \)$ indicates the Gamma function. For
a parabolic pressure distribution, it is instead possible to infer the
following expressions:
#math.equation(block: true, numbering: _ => [(105)], $ p_0 = frac(F_z n \( m + 1 \), 4 m a b upright(B) #scale(x: 240%, y: 240%)[\(] 1 / n \, frac(m + 1, m) + 1 #scale(x: 240%, y: 240%)[\)]) \, quad upright(a n d) quad macron(p) \( bold(x) \) = 1 - #scale(x: 240%, y: 240%)[\(] x / a #scale(x: 240%, y: 240%)[\)]^n - #scale(x: 240%, y: 240%)[\(] y / b #scale(x: 240%, y: 240%)[\)]^m \, quad bold(x) in cal(C) . $) <eq:parabolicPressure>
For instance, the numerical results reported in Sect.~#link(<sect:numer>)[5] for a
rectangular contact area with a parabolic pressure distribution were
generated using $n = m = 18$ in
Eqs.~#link(<eq:contactPatch>)[(100)]
and~#link(<eq:parabolicPressure>)[(105)].

The function $macron(p) \( dot.op \)$ appearing in
Eqs.~#link(<eq:constantPress>)[(103)]
and~#link(<eq:parabolicPressure>)[(105)] may be
modified to account for asymmetric trends towards the leading edge.
Possible choices are, respectively,
#math.equation(block: true, numbering: _ => [(106)], $ macron(p) \( bold(x) \) = exp #scale(x: 180%, y: 180%)[\(] - gamma #scale(x: 120%, y: 120%)[\(] x_(cal(L)) \( y \) - x #scale(x: 120%, y: 120%)[\)] #scale(x: 180%, y: 180%)[\)] \, quad bold(x) in cal(C) \, $) <eq:constModified>
and
#math.equation(block: true, numbering: _ => [(107)], $ macron(p) \( bold(x) \) = #scale(x: 300%, y: 300%)[\[] 1 - #scale(x: 240%, y: 240%)[\(] x / a #scale(x: 240%, y: 240%)[\)]^n - #scale(x: 240%, y: 240%)[\(] y / b #scale(x: 240%, y: 240%)[\)]^m #scale(x: 300%, y: 300%)[\]] exp #scale(x: 180%, y: 180%)[\(] - gamma #scale(x: 120%, y: 120%)[\(] x_(cal(L)) \( y \) - x #scale(x: 120%, y: 120%)[\)] #scale(x: 180%, y: 180%)[\)] \, quad bold(x) in cal(C) \, $) <eq:parabolicModified>
where $gamma in bb(R)_(gt.eq 0)$ is an appropriately selected parameter,
and $x_(cal(L)) \( y \)$ denotes an explicit parametrisation of the
leading edge:
$ x_(cal(L)) \( y \) = a #scale(x: 300%, y: 300%)[\[] 1 - #scale(x: 240%, y: 240%)[\(] y / b #scale(x: 240%, y: 240%)[\)]^m #scale(x: 300%, y: 300%)[\]]^(1 / n) \, quad y in \[ - b \, b \] . $
Although the corresponding expressions for $p_0 in bb(R)_(> 0)$ are not
particularly neat, Eqs.~#link(<eq:constModified>)[(106)]
and~#link(<eq:parabolicModified>)[(107)] may ensure
the fulfillment of inequality~#link(<eq:condP>)[(69)] (e.g.,
for~Model~1), whilst also capturing the sign reversal of the
steady-state vertical moment $M_z$ at large slip values.

= Additional considerations
<app:details>
Appendices~#link(<sect:details>)[C.1] and~#link(<app:param>)[C.2] provide additional details about
the implementation of the models and their parametrisation.

== Implementational and computational details
<sect:details>
The numerical results presented in Sect.~#link(<sect:numer>)[5] were generated in
MATLAB#super[®] R2024a on an Intel(R) Core(TM) Ultra 7 155U (1.70 GHz)
with a 32 GB RAM. ~Model~1 and~3 were implemented using
a finite-difference Upwind scheme, whereas~Model~2 employed
a fixed-point iteration of~Model~3. In particular,
using~Model~1 with a $50 times 50$ spatial meshgrid and 300
gridpoints for the slip variable, the elapsed time needed to generate
Figs.~#link(<fig:GoughRect>)[8] and~#link(<fig:GoughEll>)[9] was 25.23 s and 8.3 s,
respectively. Using~Model~2 with the same settings,
Figs.~#link(<fig:RectSpins>)[10] and~#link(<fig:EllSpins>)[11] required 81.43 s and 64.95 s,
respectively. The computational cost of the steady-state models is
therefore relatively low, with an average of 0.054 s for every
combination of slip and spin inputs in the worst scenario. The transient
simulations performed in Sect.~#link(<sect:relax>)[5.2.1] were instead computationally
expensive, requiring approximately 50 s each, which is unacceptable for
applications demanding real-time or close-to-real-time performance. In
this context, model-order-reduction strategies similar to those proposed
in \[#link(<bib-Tsiotras1>)[63], #link(<bib-Tsiotras3>)[64], #link(<bib-LuGreSpin>)[73]\] may be explored for potential
integration with larger, system-level dynamic simulations of complex
mechanical systems.

== Considerations on model parametrisation
<app:param>
Model~1,~2, and~3 depend on several
parameters that must be identified as functions of the material
properties and the operating conditions, including the applied vertical
load and the frictional characteristics at the contact interface. In
this context, a comprehensive set of recommendations for model
parametrisation can be found in \[#link(<bib-Deur1>)[66]\]\; the present appendix is limited
to providing a set of practical guidelines aimed at simplifying the
parametrisation process.

Specifically, the normalised micro-stiffness and micro-damping
coefficients contained in the matrices $upright(bold(Sigma))_0$ and
$upright(bold(Sigma))_1$ may be identified using standard optimisation
techniques by considering the linearised forms of
Model~1,~2, and~3 obtained for small slip
and spin inputs. In this regime, the models reduce to linear brush
formulations equivalent to those presented in
\[#link(<bib-Meccanica2>)[52], #link(<bib-SphericalWheel>)[53]\]. Importantly, the resulting equations are
independent of friction-related parameters, which enables a simpler,
two-stage identification procedure. In this context, it is worth noting
that both $upright(bold(Sigma))_0$ and $upright(bold(Sigma))_1$ may be
identified solely from steady-state experiments, since
$upright(bold(Sigma))_1$ multiplies the total time derivatives appearing
in Eqs.~#link(<eq:fxt>)[(33)] and~#link(<eq:fxs>)[(34)].

Once these parameters have been identified, the coefficients governing
frictional behaviour may be optimised by considering highly nonlinear
operating conditions associated with large slip values. In practice, it
is common to assume that the matrix
$upright(bold(M)) \( bold(v) ""_(upright(r)) \)$ admits a factorisation
of the type
$upright(bold(M)) \( bold(v) ""_(upright(r)) \) = theta macron(upright(bold(M))) \( bold(v) ""_(upright(r)) \)$,
where
$macron(upright(bold(M))) in C^0 \( bb(R)^2 \; upright(bold(S y m)) 2 \( bb(R) \) \)$
represents a matrix of nominal friction coefficients, and the scalar
parameter $theta in bb(R)_(> 0)$ captures additional functional
dependencies. For instance, in tyre-road interactions, $theta$ may
account for variations in friction arising from tread temperature,
asphalt conditions, or third-body layer effects.

Finally, geometric parameters related to the contact patch may be
inferred directly from measurements of the contact area, whilst the
total vertical load is typically known from steady-state experiments. In
the absence of direct measurements, a rectangular contact patch may be
assumed for tyres and an elliptical one for railway wheels; alternative
choices should be justified based on the geometry of the contacting
bodies. With regard to the pressure distribution, a uniform vertical
pressure is the simplest assumption, although non-uniform distributions,
mildly decreasing along the rolling direction, may be adopted when
passivity requirements must be satisfied.
