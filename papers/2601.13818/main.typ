#import "rheology.typ": rheology

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
  font: "Libertinus Serif",
  margin: 1in,
  sectionnumbering: "1.1",
  title: [Two-dimensional FrBD friction models for rolling contact: \
extension to linear viscoelasticity],
  authors: (
    ( name: [Luigi Romano#footnote[Corresponding author. Email:
luigi.romano\@liu.se.]],
      affiliation: [Division of Vehicular Systems, Department of Electrical Engineering, Linköping University, SE-581 83 Linköping, Sweden \ Control Systems Technology Group, Department of Mechanical Engineering, Eindhoven University of Technology, Groene Loper 1, 5612 AZ Eindhoven, the Netherlands],
      email: "" ),
    ),
  abstract-title: [Abstract],
  abstract: [This paper extends the distributed rolling contact FrBD
framework to linear viscoelasticity by considering classic derivative
Generalised Maxwell and Kelvin-Voigt rheological representations of the
bristle element. With this modelling approach, the dynamics of the
bristle, generated friction forces, and internal deformation states are
described by a system of $2 \( n + 1 \)$ hyperbolic #emph[partial
differential equations] (PDEs), which can capture complex relaxation
phenomena originating from viscoelastic behaviours. By appropriately
specifying the analytical expressions for the transport and rigid
relative velocity, three distributed formulations of increasing
complexity are introduced, which account for different levels of spin
excitation. For the linear variants, well-posedness and passivity are
analysed rigorously, showing that these properties hold for any
physically meaningful parametrisation. Numerical experiments complement
the theoretical results by illustrating steady-state characteristics and
transient relaxation effects. The findings of this paper substantially
advance the FrBD paradigm by enabling a unified and systematic treatment
of linear viscoelasticity.

],
  pagenumbering: "1",
  cols: 1,
  doc,
)


#heading(level: 1, numbering: none)[Keywords]
<keywords>
Viscoelastic rolling contact; friction; friction modelling; contact
mechanics; distributed parameter systems; semilinear systems

= Introduction
<intro>
Rolling contact phenomena are ubiquitous in mechanical and mechatronics
engineering \[#link(<bib-KinematicsMio>)[1], #link(<bib-Flores>)[2], #link(<bib-Flores2>)[3]\], where they play a pivotal
role in railway and road vehicle dynamics
\[#link(<bib-Knothe>)[4], #link(<bib-KalkerBook>)[5], #link(<bib-2000RCP>)[6], #link(<bib-Pacejka2>)[7], #link(<bib-Guiggiani>)[8], #link(<bib-LibroMio>)[9], #link(<bib-Gauterin>)[10], #link(<bib-Gauterin2>)[11]\],
robotics
\[#link(<bib-Sphere1>)[12], #link(<bib-Sphere2>)[13], #link(<bib-Sphere3>)[14], #link(<bib-Sphere4>)[15], #link(<bib-SphereNoSlip1>)[16], #link(<bib-SphereNoSlip2>)[17], #link(<bib-SphereNoSlip3>)[18]\],
and tribology
\[#link(<bib-CarboneTrans>)[19], #link(<bib-TransModel>)[20], #link(<bib-Belt1>)[21], #link(<bib-Frendo1>)[22], #link(<bib-Frendo2>)[23], #link(<bib-Frendo3>)[24], #link(<bib-bearing1>)[25], #link(<bib-bearing2>)[26], #link(<bib-bearing3>)[27], #link(<bib-bearing4>)[28], #link(<bib-bearing5>)[29]\].
Given the central role of rolling contact mechanics in engineering
practice, it is unsurprising that a rich body of analytical theories has
emerged to model and elucidate these phenomena. Early contributions
include those of Bentall and Johnson \[#link(<bib-Bentall>)[30]\] and Nowell and Hills
\[#link(<bib-Nowell>)[31]\], who studied numerically the two-dimensional tractive rolling
contact problem between elastically dissimilar rollers. Within the
framework of linear elasticity, a comprehensive analytical treatment of
rolling contact was then pioneered by Kalker, who formulated his famous
theory combining rolling kinematics with a local Coulomb-Amontons
friction law. Restricting attention to elastically similar cylinders
undergoing longitudinal slip (or creepage) under dry friction, Kalker
examined both steady and unsteady rolling behaviours in
\[#link(<bib-Kalker51>)[32], #link(<bib-Kalker5>)[33], #link(<bib-KalkerPhD>)[34]\]. In the two-dimensional case, viscoelastic
rolling was subsequently investigated independently by Hunter \[#link(<bib-Hunter>)[35]\]
and Goryacheva \[#link(<bib-GoryachevaP>)[36]\], whilst numerical approaches capable of
addressing fully three-dimensional contact problems were developed by
Kalker \[#link(<bib-Panek1>)[37], #link(<bib-Panek2>)[38]\]. Most of these studies considered viscoelastic
materials characterised by a single relaxation time, which can be
effectively represented by a linear elastic solid rheological model.
These pioneering contributions, comprehensively documented in standard
references \[#link(<bib-KalkerBook>)[5], #link(<bib-Johnson>)[39], #link(<bib-Goryacheva>)[40], #link(<bib-Barber>)[41]\], are now recognised as
cornerstones of contact mechanics and have inspired the development of
numerous numerical algorithms aimed at solving more complex rolling
problems involving combined translational and spin slips
\[#link(<bib-Vollebregt1>)[42], #link(<bib-Vollebregt2>)[43], #link(<bib-Vollebregt3>)[44], #link(<bib-Vollebregt4>)[45], #link(<bib-Nielsen>)[46], #link(<bib-Alfredsson>)[47]\].
Indeed, although elegant analytical solutions exist for steady or
quasi-steady rolling \[#link(<bib-GoryachevaBook>)[48]\], the inherently nonlocal nature of
Kalker's theory renders the derivation of closed-form results
intractable, particularly when viscoelastic effects are incorporated
\[#link(<bib-Goryacheva4>)[49], #link(<bib-Goryacheva1>)[50], #link(<bib-Goryacheva2>)[51], #link(<bib-Guler>)[52], #link(<bib-Julia1>)[53], #link(<bib-Julia2>)[54]\].

Alternatively, Kalker's simplified theory -- also known as the
#emph[brush models] in road vehicle dynamics -- offers a qualitatively
valid alternative by replacing the full Cerruti-Boussinesq coupling with
a Winkler-type foundation, postulating a local relationship between
stresses and deformations \[#link(<bib-KalkerBook>)[5], #link(<bib-Johnson>)[39], #link(<bib-KalkerSimp>)[55]\]. Following this
approach, analytical solutions are reported, for instance, in
\[#link(<bib-LibroMio>)[9], #link(<bib-Kalker4>)[56], #link(<bib-Gross>)[57], #link(<bib-Alonso1>)[58], #link(<bib-Alonso2>)[59], #link(<bib-Ciavarella1>)[60], #link(<bib-Ciavarella2>)[61], #link(<bib-Ciavarella3>)[62], #link(<bib-Al-Bender>)[63], #link(<bib-USB>)[64], #link(<bib-Meccanica2>)[65], #link(<bib-SphericalWheel>)[66], #link(<bib-LuGreSpin>)[67], #link(<bib-Tribology>)[68]\].
Despite their success, conventional brush models exhibit a significant
drawback, since they rely on an explicit partition of the contact region
into adhesion and sliding zones. When rolling contact is described as a
spatially distributed process, this feature severely hampers the
derivation of general analytical results, complicates rigorous
mathematical analysis, and limits compatibility with control and
estimation frameworks. Motivated by these shortcomings, alternative
formulations of rolling and spinning friction have been proposed. For
instance, the local models introduced in
\[#link(<bib-Zhuravlev1>)[69], #link(<bib-Zhuravlev2>)[70], #link(<bib-Kireenkov1>)[71], #link(<bib-Kireenkov2>)[72]\] compute resultant friction
forces and moments by employing rigid rolling kinematics, leading to
compact expressions for global quantities. In parallel, dynamic friction
models such as Dahl and LuGre \[#link(<bib-Astrom1>)[73], #link(<bib-Olsson>)[74], #link(<bib-Astrom2>)[75]\] have been adapted
to rolling contact problems, with an emphasis on tyre-road applications
\[#link(<bib-Sorine>)[76], #link(<bib-TsiotrasConf>)[77], #link(<bib-Tsiotras1>)[78], #link(<bib-Tsiotras3>)[79], #link(<bib-Deur0>)[80], #link(<bib-Deur1>)[81], #link(<bib-Deur2>)[82]\], where
viscoelastic effects may be non-negligible. These approaches do not
explicitly distinguish between sticking and slipping, as they describe
only the averaged deformation of bristle-like elements within the
contact interface. This feature endows them with a mathematical
structure that is more amenable to analysis and control design.
Comparable modelling philosophies can also be pursued starting from
other dynamic friction frameworks, including Leuven-type formulations
\[#link(<bib-Integrated>)[83], #link(<bib-Leuven>)[84]\] and elastoplastic descriptions \[#link(<bib-Elasto1>)[85], #link(<bib-Elasto2>)[86]\].
Nevertheless, the majority of these models remain largely
phenomenological and thus offer limited insight into the physical
mechanisms governing friction.

More recently, lumped and distributed LuGre-inspired formulations,
termed #emph[Friction with Bristle Dynamics] (FrBD), have been proposed
in \[#link(<bib-FrBD>)[87], #link(<bib-FrBDroll>)[88]\] as a first-order approximation of a rheological model
for bristle-like elements attached to sliding and rolling bodies. Owing
to its physical grounding, the FrBD framework yields a coherent dynamic
description of sliding phenomena under both dry and lubricated friction.
In particular, the first-order version presented in \[#link(<bib-FrBDroll>)[88]\], renamed
in this paper the rolling contact FrBD$""_1$-KV model, was based on a
Kelvin-Voigt (KV) rheological representation of the bristle element,
which qualifies as the simplest constitutive model of a linear
viscoelastic solid \[#link(<bib-Rheology1>)[89], #link(<bib-bookRheol1>)[90], #link(<bib-bookRheol2>)[91], #link(<bib-bookRheol3>)[92]\].
Consequently, the formulation presented in \[#link(<bib-FrBDroll>)[88]\] is suitable for
studying purely elastic rolling contact, or viscoelastic contact when
hysteretic effects are minor. However, for highly viscoelastic
materials, such as the polymers commonly used in tyres, more
sophisticated rheological models are necessary \[#link(<bib-JMPS1>)[93], #link(<bib-JMPS2>)[94], #link(<bib-JMPS3>)[95]\] to
capture internal stress relaxation across a broad frequency spectrum
\[#link(<bib-Rheology2>)[96], #link(<bib-Rheology2-3>)[97], #link(<bib-Rheology3>)[98], #link(<bib-Fractional1>)[99], #link(<bib-Fractional2>)[100], #link(<bib-Fractional3>)[101]\].
Therefore, restricting itself to the classic derivative framework
\[#link(<bib-Rheology1>)[89], #link(<bib-Fractional1>)[99], #link(<bib-Fractional2>)[100], #link(<bib-Fractional3>)[101]\], the present work
advances the distributed FrBD paradigm by adopting the two most general
constitutive descriptions of linear viscoelasticity, namely the
Generalised Maxwell (GM) and Generalised Kelvin-Voigt (GKV) elements,
thereby substantially extending the modelling capability of the
approach. The governing PDEs of the new rolling contact models,
collectively referred to as FrBD$""_(n + 1)$, are first derived
following the general approach outlined in \[#link(<bib-FrBDroll>)[88]\]. Subsequently,
three distinct variants are presented and discussed in detail. For the
two linear formulations, well-posedness, #emph[input-to-state stability]
(ISS), and #emph[input-to-output stability] (IOS) results can be
established by invoking semigroup arguments \[#link(<bib-Pazy>)[102], #link(<bib-Tanabe1>)[103], #link(<bib-Tanabe>)[104]\] as in
\[#link(<bib-FrBDroll>)[88]\], and are briefly recollected. Conversely, passivity is proved
explicitly, showing that this property holds for any meaningful
parametrisation of the models. The theoretical developments are
complemented by numerical simulations illustrating steady-state and
transient rolling contact behaviours. Force-slip relationships are
computed and compared employing three different rheological
descriptions, whilst transient analyses focus on relaxation dynamics.
Compared to \[#link(<bib-FrBDroll>)[88]\], the main novelties of this work can be summarised
as follows:

#block[
#set enum(numbering: "(i)", start: 1)
+ Systematic extension of FrBD to arbitrary-order linear viscoelasticity
  via GM and GKV models,

+ Derivation of distributed hyperbolic PDEs with internal relaxation
  states,

+ Rigorous passivity proof for rolling contact with viscoelastic
  bristles.
]

From an engineering perspective, the proposed FrBD$""_(n + 1)$ models
enable the direct incorporation of experimentally identified relaxation
spectra of polymers and rubbers into rolling contact simulations,
without resorting to #emph[ad hoc] creep-force laws. Beyond automotive
tyres, the results of this paper apply to a wide range of rolling
contact elements involving viscoelastic materials, such as rubber-coated
rollers used in conveying, printing, and paper-handling machinery, drive
and pinch rollers in packaging and mechatronic systems, and
polymer-covered calendering cylinders in plastics and rubber processing.

The remainder of the manuscript is organised as follows.
Section~#link(<sect:2Dext>)[2] presents the derivation of the FrBD$""_(n + 1)$
formulations, combining physically motivated assumptions with solid
analytical arguments. Section~#link(<sect:models>)[3] specialises the general
equations to rolling contact systems and introduces three model variants
of increasing complexity. The linear formulations are then analysed in
Sect.~#link(<sect:math>)[4], with particular emphasis on well-posedness and
passivity properties. Numerical results illustrating both steady and
transient responses are discussed in Sect.~#link(<sect:numer>)[5]. Finally,
conclusions and directions for future research are outlined in
Sect.~#link(<sect:conclusion>)[6], whilst additional details are provided in
Appendices~#link(<app:param>)[A] and~#link(<app:alt>)[B]. Specifically, to facilitate
practical adoption, Appendix~#link(<app:param>)[A] provides guidelines for
parametrising the proposed FrBD$""_(n + 1)$ models from experimental
frequency-domain data, whereas alternative parametrisations of certain
variants are given in Appendix~#link(<app:alt>)[B].

#heading(level: 2, numbering: none)[Notation]
<notation>
In this paper, $bb(R)$ denotes the set of real numbers; $bb(R)_(> 0)$
and $bb(R)_(gt.eq 0)$ indicate the set of positive real numbers
excluding and including zero, respectively. The set of positive integer
numbers is indicated with $bb(N)$, whereas $bb(N)_0$ denotes the
extended set of positive integers including zero, i.e.,
$bb(N)_0 = bb(N) union { 0 }$. The set of $n times m$ matrices with
values in $bb(F)$ ($bb(F) = bb(R)$, $bb(R)_(> 0)$, $bb(R)_(gt.eq 0)$) is
denoted by $upright(bold(M))_(n times m) \( bb(F) \)$ (abbreviated as
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
$∥f \( dot.op \)∥_oo ? "ess sup"_Omega lr(|f \( dot.op \)|)$\;
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

= Viscoelastic extension of the two-dimensional FrBD friction model
<sect:2Dext>
This section presents an extended version of the two-dimensional FrBD
friction model introduced in \[#link(<bib-FrBDroll>)[88]\], based on more refined GM and GKV
rheological descriptions of the bristle element. In particular, the
proposed rheological models are described in Sect.~#link(<sect:rhelANdFr>)[2.1],
whilst Sect.~#link(<sect:DynamicDer>)[2.2] is devoted to the analytical derivation of
the dynamic one.

== Viscoelastic rheological models
<sect:rhelANdFr>
Following \[#link(<bib-FrBDroll>)[88]\], the proposed approach is elucidated by first
considering the configuration illustrated in Fig.~#link(<fig:LumpModel>)[1]\(a),
where a viscoelastic body slides over a flat, rigid substrate. The
mechanical problem is studied in a reference frame
$\( O \; x \, y \, z \)$ oriented as follows: the $x$-axis
(longitudinal) is usually directed as the main direction of motion of
the upper body, the $z$-axis (vertical) points downward, into the lower
body, and the $y$-axis (lateral) is oriented so to have a right-handed
system.

The rigid relative velocity of the upper body with respect to the rigid
substrate (lower body) is denoted by
$bb(R)^2 in.rev bold(v) ""_(upright(r)) = \[ v_(upright(r) x) #h(0em) v_(upright(r) y) \]^(upright(T))$.
To the lower boundary of the upper body, massless bristles are attached,
whose deformation is denoted by
$bb(R)^2 in.rev bold(z) = \[ z_x #h(0em) z_y \]^(upright(T))$ (not to be
confounded with the vertical axis $z$). The total sliding velocity
between the tip of the bristle and the substrate reads
#math.equation(block: true, numbering: _ => [(1)], $ bold(v) ""_(upright(s)) \( dot(bold(z)) \, bold(v) ""_(upright(r)) \) = bold(v) ""_(upright(r)) + dot(bold(z)) \, $) <eq:slidingS>
where Newton's notation has been adopted for the total time derivative
$dot(bold(z)) = frac(upright(d) bold(z), upright(d) t)$.

#figure(image("figures/SchematicLumped5.svg", width: 100.0%),
  caption: [
    A schematic representation of the friction model: (a) configuration
    with a rigid substrate; (b) configuration with a deformable
    substrate. The problem is studied in a right-handed reference frame
    $\( O \; x \, y \, z \)$ with unit vectors
    $\( hat(bold(e))_x \, hat(bold(e))_y \, hat(bold(e))_z \)$.
  ]
)
<fig:LumpModel>

By deflecting, the bristle generates a nondimensional force
$bb(R)^2 in.rev bold(f) = \[ f_x #h(0em) f_y \]^(upright(T))$, which
opposes the sliding motion. The (possibly dynamic) relationship between
the deformation and the produced force may be specified by adopting an
appropriate rheological model for the bristle element. Within the
framework of linear viscoelasticity, as considered in this paper, the
two most general formulations are the GM and GKV models illustrated in
Fig.~#link(<fig:Dashpot>)[2]. These two models are ultimately equivalent, meaning
that every GM element admits an equivalent GKV representation, and
#emph[vice versa] \[#link(<bib-Rheology2-3>)[97]\]. However, this paper considers each
formulation separately to provide a unified and more comprehensive
treatment of linear viscoelasticity within the theoretical FrBD
framework#footnote[As mentioned in the introduction,
fractional-differential models are deliberately excluded from the
analysis. However, recent works have shown that fractional models can be
typically reparametrised as GM or GKV ones \[#link(<bib-Rheology3>)[98]\], and may therefore
be accommodated within the proposed framework.]. Starting with the GM
element with $n + 1$ branches, depicted in Fig.~#link(<fig:Dashpot>)[2]\(a), the
force $bold(f)$ may be expressed as
#math.equation(block: true, numbering: _ => [(2)], $ bold(f) & = macron(upright(bold(K)))_0 bold(z) + sum_(i = 1)^n bold(f)_i \,\
frac(upright(d) bold(f)_i, upright(d) t) & = - bold(tau)_i^(- 1) bold(f)_i + macron(upright(bold(K)))_i dot(bold(z)) \, quad i in { 1 \, dots.h \, n } \, $) <eq:force0>
where
$bb(R)^2 in.rev bold(f)_i = \[ f_(i x) #h(0em) f_(i y) \]^(upright(T))$,
$i in { 1 \, dots.h \, n }$, denote the internal forces generated by the
dissipative branches, that is, the spring-damper elements, and
$upright(bold(S y m))_2 \( bb(R) \) in.rev macron(upright(bold(K)))_i succ upright(bold(0))$,
$i in { 0 \, dots.h \, n }$, and
$bold(tau)_i in upright(bold(M))_2 \( bb(R) \)$,
$i in { 1 \, dots.h \, n }$, are matrices of normalised micro-stiffness
coefficients and relaxation times, respectively:
#math.equation(block: true, numbering: _ => [(3)], $ macron(upright(bold(K)))_i & = mat(delim: "[", macron(k)_(i x x), macron(k)_(i x y); macron(k)_(i x y), macron(k)_(i y y)) \, quad i in { 0 \, dots.h \, n } \,\
bold(tau)_i & = mat(delim: "[", tau_(i x x), tau_(i x y); tau_(i x y), tau_(i y y)) \, quad i in { 1 \, dots.h \, n } \, $) <eq:Sigmas1>
or, in the diagonal case,
#math.equation(block: true, numbering: _ => [(4)], $ macron(upright(bold(K)))_i & = mat(delim: "[", macron(k)_(i x), 0; 0, macron(k)_(i y)) \, quad i in { 0 \, dots.h \, n } \,\
bold(tau)_i & = mat(delim: "[", tau_(i x), 0; 0, tau_(i y)) \, quad i in { 1 \, dots.h \, n } . $) <eq:Sigmas2>
In particular, the relaxation matrices appearing in
Eq.~#link(<eq:force0>)[(2)] are given by
$ bold(tau)_i ? macron(upright(bold(C)))_i macron(upright(bold(K)))_i^(- 1) \, quad i in { 1 \, dots.h \, n } \, $
where
$upright(bold(S y m))_2 \( bb(R) \) in.rev macron(upright(bold(C)))_i succ upright(bold(0))$,
$i in { 1 \, dots.h \, n }$, are matrices of normalised micro-damping
coefficients:
$ macron(upright(bold(C)))_i & = mat(delim: "[", macron(c)_(i x x), macron(c)_(i x y); macron(c)_(i x y), macron(c)_(i y y)) \, quad i in { 1 \, dots.h \, n } \,\
 $ or, in the diagonal case,
$ macron(upright(bold(C)))_i & = mat(delim: "[", macron(c)_(i x), 0; 0, macron(c)_(i y)) \, quad i in { 1 \, dots.h \, n } . $
The off-diagonal terms in $macron(upright(bold(K)))_i$,
$i in { 0 \, dots.h \, n }$, and $macron(upright(bold(C)))_i$,
$i in { 1 \, dots.h \, n }$, model coupling between longitudinal and
lateral bristle deformations, which may arise from anisotropic
microstructure or oriented polymer chains. In most practical
applications, these matrices are diagonal, but the general formulation
allows for coupled viscoelastic effects.

Equation #link(<eq:force0>)[(2)] completely characterises the
internal state dynamics of a viscoelastic solid modelled by a GM
element. On the other hand, by adopting a Generalised Kelvin-Voigt (GKV)
representation, as illustrated in Fig.~#link(<fig:Dashpot>)[2]\(b), the following
relationships may be deduced:
#math.equation(block: true, numbering: _ => [(9)], $ bold(f) & = macron(upright(bold(K)))_0 bold(z) - macron(upright(bold(K)))_0 sum_(i = 1)^n bold(z)_i \,\
bold(f) & = macron(upright(bold(K)))_i bold(z)_i + macron(upright(bold(C)))_i dot(bold(z))_i \, quad i in { 1 \, dots.h \, n } \, $) <eq:force0GKV>
where
$bb(R)^2 in.rev bold(z)_i = \[ z_(i x) #h(0em) z_(i y) \]^(upright(T))$,
$i in { 1 \, dots.h \, n }$, indicate the internal deformations of the
dissipative branches, and
$upright(bold(S y m))_2 \( bb(R) \) in.rev macron(upright(bold(K)))_i succ upright(bold(0))$,
$i in { 0 \, dots.h \, n }$ and
$upright(bold(S y m))_2 \( bb(R) \) in.rev macron(upright(bold(C)))_i succ upright(bold(0))$,
$i in { 1 \, dots.h \, n }$, have the same meaning as before.
Differentiating and manipulating Eqs.~#link(<eq:force0>)[(2)]
and~#link(<eq:force0GKV>)[(9)], a general constitutive
equation may be derived in differential form
as#footnote[Equation~#link(<eq:rheol1_diff>)[(10)]
provides an equivalence between the GM and GKV representations. In this
context, it is worth observing that the matrices
$macron(upright(bold(K)))_i$, $i in { 0 \, dots.h \, n }$, and
$macron(upright(bold(C)))_i \, bold(tau)_i$,
$i in { 1 \, dots.h \, n }$, appearing in
Eqs.~#link(<eq:force0>)[(2)]
and~#link(<eq:force0GKV>)[(9)] are supposed to have
constant coefficients in space (see also Appendix~#link(<app:param>)[A]). This is a
standard assumption in the literature
\[#link(<bib-Sorine>)[76], #link(<bib-TsiotrasConf>)[77], #link(<bib-Tsiotras1>)[78], #link(<bib-Tsiotras3>)[79], #link(<bib-Deur0>)[80], #link(<bib-Deur1>)[81], #link(<bib-Deur2>)[82]\].]
#math.equation(block: true, numbering: _ => [(10)], $ bold(f) + sum_(i = 1)^n upright(bold(Gamma))_i frac(upright(d)^i bold(f), upright(d) t^i) = sum_(i = 0)^n upright(bold(Sigma))_i frac(upright(d)^i bold(z), upright(d) t^i) \, $) <eq:rheol1_diff>
where the matrices
$upright(bold(Gamma))_i in upright(bold(M))_2 \( bb(R) \)$,
$i in { 1 \, dots.h \, n }$, and
$upright(bold(Sigma))_i in upright(bold(M))_2 \( bb(R) \)$,
$i in { 0 \, dots.h \, n }$, may be inferred from the
$macron(upright(bold(K)))_i$'s and $bold(tau)_i$'s appearing in
Eq.~#link(<eq:force0>)[(2)] when considering the GM
representation, and from the $macron(upright(bold(K)))_i$'s and
$upright(bold(C))_i$'s in~#link(<eq:force0GKV>)[(9)] when
using the GKV model. Their specification is not essential for what
follows, and therefore an explicit parametrisation of the
$upright(bold(Gamma))_i$'s and $upright(bold(Sigma))_i$'s in terms of
the models' physical coefficients is not provided. Besides, it should be
mentioned that inferring interconversions of a general nature for every
$n in bb(N)$ is a rather arduous task \[#link(<bib-Rheology2>)[96], #link(<bib-Rheology2-3>)[97]\]. For
$n = 1$ and $n = 2$, closed-form expressions are reported, for instance,
in \[#link(<bib-Rheology2-3>)[97]\], but omitted here.

What is instead important to clarify in the context of the present paper
is that equations formally identical
to~#link(<eq:force0>)[(2)]
and~#link(<eq:rheol1>)[(12)] may also be deduced when
considering the scenario depicted in Fig.~#link(<fig:LumpModel>)[1]\(b), where the
upper and lower bodies exhibit a similar viscoelastic behaviour (see
\[#link(<bib-FrBDroll>)[88]\] for a comprehensive justification of this claim).

Equations~#link(<eq:force0>)[(2)] and
~#link(<eq:rheol1>)[(12)] provide the main physical ingredients
required to derive the extended FrBD model, as explained in the
following Sect.~#link(<sect:DynamicDer>)[2.2].

#figure(rheology(), kind: image,
  caption: [
    A schematic representation of the Generalised Maxwell (GM) and
    Generalised Kelvin-Voigt (GKV) rheological models. The matrix
    $macron(upright(bold(K)))_0$ collects the normalised
    micro-stiffnesses of the zeroth element, modelled as an elastic
    spring. The matrices $macron(upright(bold(K)))_i$ and
    $macron(upright(bold(C)))_i$ denote the normalised micro-stiffness
    and micro-damping matrices of the element $i$,
    $i in { 1 \, dots.h \, n }$. For the GM, the corresponding matrix of
    time constants is given by
    $bold(tau)_i ? macron(upright(bold(C)))_i macron(upright(bold(K)))_i^(- 1)$,
    $i in { 1 \, dots.h \, n }$.
  ]
)
<fig:Dashpot>

== Dynamic friction models derivation
<sect:DynamicDer>
Combining the viscoelastic rheological models detailed in
Sect.~#link(<sect:rhelANdFr>)[2.1] with a static law for the friction coefficient,
the equations governing the bristle dynamics may be inferred via an
application of Theorem~#link(<thm:Theorem1>)[2.1] below.

#block[
#strong[Theorem 2.1] (Edwards \[#link(<bib-Edwards>)[105]\]). #emph[Suppose that the mapping
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
By invoking Theorem~#link(<thm:Theorem1>)[2.1], it is possible to proceed with the
derivation of the new dynamic friction models following a similar
rationale as in \[#link(<bib-FrBDroll>)[88]\]. The main steps are repeated here for
self-containment. First,
Eq.~#link(<eq:rheol1_diff>)[(10)] is reinterpreted
algebraically, that is,
#math.equation(block: true, numbering: _ => [(12)], $ bold(f) #scale(x: 300%, y: 300%)[\(] frac(upright(d)^n bold(z), upright(d) t^n) \, dots.h \, frac(upright(d) bold(z), upright(d) t) \, bold(z) \, frac(upright(d)^n bold(f), upright(d) t^n) \, dots.h \, frac(upright(d) bold(f), upright(d) t) #scale(x: 300%, y: 300%)[\)] = sum_(i = 0)^n upright(bold(Sigma))_i frac(upright(d)^i bold(z), upright(d) t^i) - sum_(i = 1)^n upright(bold(Gamma))_i frac(upright(d)^i bold(f), upright(d) t^i) . $) <eq:rheol1>
As a second step, it should be observed that, in the absence of inertial
effects, the normalised bristle force per unit of length must counteract
the friction force per unit of normal load $p in bb(R)_(> 0)$ acting on
its tip,
$bb(R)^2 in.rev bold(f) ""_(upright(r)) = \[ f_(upright(r) x) #h(0em) f_(upright(r) y) \]^(upright(T))$.
Inspired by \[#link(<bib-FrBDroll>)[88]\], the latter may be modelled as
#math.equation(block: true, numbering: _ => [(13)], $ bold(f) ""_(upright(r)) \( bold(v) ""_(upright(s)) \) = - frac(upright(bold(M))^2 \( bold(v) ""_(upright(s)) \) bold(v) ""_(upright(s)), ∥upright(bold(M)) \( bold(v) ""_(upright(s)) \) bold(v) ""_(upright(s))∥_(2 \, epsilon)) \, $) <eq:frModified>
where
$ upright(bold(M)) \( bold(v) ""_(upright(s)) \) = mat(delim: "[", mu_(x x) \( bold(v) ""_(upright(s)) \), mu_(x y) \( bold(v) ""_(upright(s)) \); mu_(x y) \( bold(v) ""_(upright(s)) \), mu_(y y) \( bold(v) ""_(upright(s)) \)) $#label("eq;matrixM")
is a symmetric, positive definite matrix of friction coefficients, i.e.,
$upright(bold(S y m))_2 \( bb(R) \) in.rev upright(bold(M)) \( bold(y) \) succ upright(bold(0))$
for all $bold(y) in bb(R)^2$, and $epsilon in bb(R)_(gt.eq 0)$
represents a regularisation parameter, and
$∥dot.op∥_(2 \, epsilon) in C^0 \( bb(R)^2 \; bb(R)_(gt.eq 0) \)$ is a
regularisation of the Euclidean norm $∥dot.op∥_2$ for
$epsilon in bb(R)_(> 0)$, often converging uniformly to $∥dot.op∥_2$ in
$C^0 \( bb(R)^2 \; bb(R)_(gt.eq 0) \)$ for $epsilon arrow.r 0$ (e.g.,
$∥bold(y)∥_(2 \, epsilon) = sqrt(∥bold(y)∥_2^2 + epsilon)$), and with
$∥dot.op∥_(2 \, epsilon) in C^1 \( bb(R)^2 \; bb(R)_(gt.eq 0) \)$ for
$epsilon in bb(R)_(> 0)$.

Accordingly, starting with Eqs.~#link(<eq:rheol1>)[(12)]
and~#link(<eq:frModified>)[(13)], and adopting the notation
of Theorem~#link(<thm:Theorem1>)[2.1], equating
Eqs.~#link(<eq:rheol1>)[(12)]
and~#link(<eq:frModified>)[(13)] gives
#math.equation(block: true, numbering: _ => [(15)], $  & bold(H) #scale(x: 300%, y: 300%)[\(] frac(upright(d)^n bold(z), upright(d) t^n) \, dots.h \, frac(upright(d) bold(z), upright(d) t) \, bold(z) \, frac(upright(d)^n bold(f), upright(d) t^n) \, dots.h \, frac(upright(d) bold(f), upright(d) t) \, bold(v) ""_(upright(r)) #scale(x: 300%, y: 300%)[\)]\
 & quad = bold(f) #scale(x: 300%, y: 300%)[\(] frac(upright(d)^n bold(z), upright(d) t^n) \, dots.h \, frac(upright(d) bold(z), upright(d) t) \, bold(z) \, frac(upright(d)^n bold(f), upright(d) t^n) \, dots.h \, frac(upright(d) bold(f), upright(d) t) #scale(x: 300%, y: 300%)[\)] - bold(f) ""_(upright(r)) #scale(x: 120%, y: 120%)[\(] bold(v) ""_(upright(s)) \( dot(bold(z)) \, bold(v) ""_(upright(r)) \) #scale(x: 120%, y: 120%)[\)] = bold(0) \, quad t in \( 0 \, T \) . $) <eq:H>
In the sliding regime, where
$∥dot(bold(z))∥_2 lt.double ∥bold(v) ""_(upright(r))∥_2$,
Eq.~#link(<eq:H>)[(15)] may be approximated by invoking
Theorem~#link(<thm:Theorem1>)[2.1] with
$bold(x) = \( bold(z) \, frac(upright(d) \[, upright(d) 2) \] bold(z) t \, dots.h \, frac(upright(d) \[, upright(d) n) \] bold(z) t \, frac(upright(d) bold(f), upright(d) t) \, dots.h \, frac(upright(d) \[, upright(d) n) \] bold(f) t \, bold(v) ""_(upright(r)) \)$
and $bold(y) = dot(bold(z)) = frac(upright(d) bold(z), upright(d) t)$,
yielding
#math.equation(block: true, numbering: _ => [(16)], $ frac(upright(d) bold(z)_(k + 1), upright(d) t) & = frac(upright(d) bold(z)_k, upright(d) t) - nabla_(bold(dot(z))) bold(H) #scale(x: 300%, y: 300%)[\(] frac(upright(d)^n bold(z), upright(d) t^n)^star.op \, dots.h \, frac(upright(d) bold(z), upright(d) t)^star.op \, bold(z)^star.op \, frac(upright(d)^n bold(f), upright(d) t^n)^star.op \, dots.h \, frac(upright(d) bold(f), upright(d) t)^star.op \, bold(v) ""_(upright(r))^star.op #scale(x: 300%, y: 300%)[\)]^(- upright(T))\
 & quad times bold(H) #scale(x: 300%, y: 300%)[\(] frac(upright(d)^n bold(z)_k, upright(d) t^n) \, dots.h \, frac(upright(d) bold(z), upright(d) t) \, bold(z) \, frac(upright(d)^n bold(f), upright(d) t^n) \, dots.h \, frac(upright(d) bold(f), upright(d) t) \, bold(v) ""_(upright(r)) #scale(x: 300%, y: 300%)[\)] \, quad k in bb(N)_0 . $) <eq:zk01>
In turn, committing the additional approximation \[#link(<bib-FrBD>)[87], #link(<bib-FrBDroll>)[88], #link(<bib-Rill>)[107]\]
#math.equation(block: true, numbering: _ => [(17)], $  & nabla_(bold(dot(z))) bold(H) #scale(x: 300%, y: 300%)[\(] frac(upright(d)^n bold(z)_k, upright(d) t^n) \, dots.h \, frac(upright(d) bold(z), upright(d) t) \, bold(z) \, frac(upright(d)^n bold(f), upright(d) t^n) \, dots.h \, frac(upright(d) bold(f), upright(d) t) \, bold(v) ""_(upright(r)) #scale(x: 300%, y: 300%)[\)]^(upright(T)) approx upright(bold(Sigma))_1 + frac(upright(bold(M))^2 #scale(x: 120%, y: 120%)[\(] bold(v) ""_(upright(s)) \( dot(bold(z)) \, bold(v) ""_(upright(r)) \) #scale(x: 120%, y: 120%)[\)], ∥upright(bold(M)) #scale(x: 120%, y: 120%)[\(] bold(v) ""_(upright(s)) \( dot(bold(z)) \, bold(v) ""_(upright(r)) \) #scale(x: 120%, y: 120%)[\)] bold(v) ""_(upright(s)) \( dot(bold(z)) \, bold(v) ""_(upright(r)) \)∥_(2 \, epsilon)) \, $) <eq:nablaH>
recalling Eqs.~#link(<eq:force0>)[(2)]
and~#link(<eq:rheol1>)[(12)], and truncating
Eq.~#link(<eq:zk01>)[(16)] at $k = 1$ provides, for an initial
guess $dot(bold(z))_0 = bold(0)$,
#math.equation(block: true, numbering: _ => [(18)], $ dot(bold(z)) \( t \) = - upright(bold(M))^(- 2) #scale(x: 120%, y: 120%)[\(] bold(v) ""_(upright(r)) \( t \) #scale(x: 120%, y: 120%)[\)] ∥upright(bold(M)) #scale(x: 120%, y: 120%)[\(] bold(v) ""_(upright(r)) \( t \) #scale(x: 120%, y: 120%)[\)] bold(v) ""_(upright(r)) \( t \)∥_(2 \, epsilon) bold(f) \( t \) - bold(v) ""_(upright(r)) \( t \) \, quad t in \( 0 \, T \) . $) <eq:ODEz>
The above ODE~#link(<eq:ODEz>)[(18)] is valid regardless of the
assumed rheological representation of the bristle element. However, the
expression for the total normalised force $bold(f) \( t \)$ appearing in
Eq.~#link(<eq:ODEz>)[(18)] depends on the specific set of
constitutive relationships, namely~#link(<eq:force0>)[(2)]
or~#link(<eq:force0GKV>)[(9)]. In particular, the GM
element described by Eq.~#link(<eq:force0>)[(2)] yields the
following ODE system:
#math.equation(block: true, numbering: _ => [(19)], $  & dot(bold(z)) \( t \) = - upright(bold(M))^(- 2) #scale(x: 120%, y: 120%)[\(] bold(v) ""_(upright(r)) \( t \) #scale(x: 120%, y: 120%)[\)] ∥upright(bold(M)) #scale(x: 120%, y: 120%)[\(] bold(v) ""_(upright(r)) \( t \) #scale(x: 120%, y: 120%)[\)] bold(v) ""_(upright(r)) \( t \)∥_(2 \, epsilon) #scale(x: 300%, y: 300%)[\(] macron(upright(bold(K)))_0 bold(z) \( t \) + sum_(i = 1)^n bold(f)_i \( t \) #scale(x: 300%, y: 300%)[\)] - bold(v) ""_(upright(r)) \( t \) \,\
 & dot(bold(f))_i \( t \) = - bold(tau)_i^(- 1) bold(f)_i \( t \) + macron(upright(bold(K)))_i dot(bold(z)) \( t \) \, quad t in \( 0 \, T \) \, #h(0em) i in { 1 \, dots.h \, n } \,\
 & bold(z) \( 0 \) = bold(z)_0 \, #h(0em) bold(f)_i \( 0 \) = bold(f)_(i \, 0) \, quad i in { 1 \, dots.h \, n } \, $) <eq:ODEModel>
whereas employing the GKV~#link(<eq:force0GKV>)[(9)]
provides
#math.equation(block: true, numbering: _ => [(20)], $  & dot(bold(z)) \( t \) = - upright(bold(M))^(- 2) #scale(x: 120%, y: 120%)[\(] bold(v) ""_(upright(r)) \( t \) #scale(x: 120%, y: 120%)[\)] ∥upright(bold(M)) #scale(x: 120%, y: 120%)[\(] bold(v) ""_(upright(r)) \( t \) #scale(x: 120%, y: 120%)[\)] bold(v) ""_(upright(r)) \( t \)∥_(2 \, epsilon) macron(upright(bold(K)))_0 #scale(x: 300%, y: 300%)[\(] bold(z) \( t \) - sum_(i = 1)^n bold(z)_i \( t \) #scale(x: 300%, y: 300%)[\)] - bold(v) ""_(upright(r)) \( t \) \,\
 & dot(bold(z))_i \( t \) = - macron(upright(bold(C)))_i^(- 1) macron(upright(bold(K)))_i bold(z)_i \( t \) + macron(upright(bold(C)))_i^(- 1) macron(upright(bold(K)))_0 #scale(x: 300%, y: 300%)[\(] bold(z) \( t \) - sum_(i = 1)^n bold(z)_i \( t \) #scale(x: 300%, y: 300%)[\)] \, quad t in \( 0 \, T \) \, #h(0em) i in { 1 \, dots.h \, n } \,\
 & bold(z) \( 0 \) = bold(z)_0 \, #h(0em) bold(z)_i \( 0 \) = bold(z)_(i \, 0) \, quad i in { 1 \, dots.h \, n } \, $) <eq:ODEModelKV>
The ODE system~#link(<eq:ODEModel>)[(19)] describes the
dynamics of the bristle $bold(z) \( t \) in bb(R)^2$ and element forces
$bold(f)_i \( t \) in bb(R)^2$, $i in { 1 \, dots.h \, n }$, depending
on the rigid relative velocity input
$bold(v) ""_(upright(r)) \( t \) in bb(R)^2$. In this paper, it is
referred to as the FrBD$""_(n + 1)$-GM model, where $n + 1$ indicates
the dynamical order#footnote[More precisely, since all the state
variables are in $bb(R)^2$, the actual order is $2 \( n + 1 \)$.
However, here $n + 1$ indicates the order in one dimension, which also
coincides with the number of branches employed in the GM model.], and
the suffix GM clarifies that it corresponds to a Generalised Maxwell
rheological element. In the
ODE~#link(<eq:ODEModelKV>)[(20)], the dynamics of the
bristle is instead coupled to that of the deformations
$bold(z)_i \( t \) in bb(R)^2$, $i in { 1 \, dots.h \, n }$. The model
described by Eq.~#link(<eq:ODEModelKV>)[(20)] is named in
this paper the FrBD$""_(n + 1)$-GKV, to clarify that it is obtained by
adopting a GKV rheological description of the bristle element. Together,
the FrBD$""_(n + 1)$-GM and FrBD$""_(n + 1)$-GKV are collectively called
FrBD$""_(n + 1)$ models. It is worth emphasising that the
FrBD$""_(n + 1)$-GM and FrBD$""_(n + 1)$-GKV are dynamically equivalent,
since there always exists an interconversion between the GM and GKV
descriptions, as implied by the general constitutive
relationship~#link(<eq:rheol1_diff>)[(10)]. Essentially,
they correspond to two alternative realisations of the viscoelastic
friction dynamics, albeit the specific interpretation of their internal
state variables may differ in practice. In this context, it is
interesting to draw some considerations about the stationary solutions
of Eqs.~#link(<eq:ODEModel>)[(19)]
and~#link(<eq:ODEModelKV>)[(20)]. Starting with the
steady-state bristle force, both formulations give
#math.equation(block: true, numbering: _ => [(21)], $ bold(f) \( bold(v) ""_(upright(r)) \) = bold(f) ""_(upright(r)) \( bold(v) ""_(upright(r)) \) = - frac(upright(bold(M))^2 \( bold(v) ""_(upright(r)) #scale(x: 120%, y: 120%)[\)] bold(v) ""_(upright(r)), ∥upright(bold(M)) \( bold(v) ""_(upright(r)) \) bold(v) ""_(upright(r))∥_(2 \, epsilon)) \, $) <eq:fStat>
which agrees with the expression deduced for the FrBD$""_1$-KV models
developed in \[#link(<bib-FrBDroll>)[88]\]. It is worth noting that, in contrast to LuGre, a
minus sign appears in Eq.~#link(<eq:fStat>)[(21)], which
reflects the nature of the sliding problem, and is consistent with the
formulae reported in \[#link(<bib-FrBDroll>)[88], #link(<bib-Antali>)[106]\].

Concerning instead the internal variables, the FrBD$""_(n + 1)$-GM
model~#link(<eq:ODEModel>)[(19)] yields
$ bold(z) \( bold(v) ""_(upright(r)) \) = - macron(upright(bold(K)))_0^(- 1) frac(upright(bold(M))^2 \( bold(v) ""_(upright(r)) #scale(x: 120%, y: 120%)[\)] bold(v) ""_(upright(r)), ∥upright(bold(M)) \( bold(v) ""_(upright(r)) \) bold(v) ""_(upright(r))∥_(2 \, epsilon)) \, quad bold(f)_i \( bold(v) ""_(upright(r)) \) = bold(0) \, quad i in { 1 \, dots.h \, n } \, $
which coincides with the stationary solution of the FrBD$""_1$-KV model,
whereas the FrBD$""_(n + 1)$-GKV
variant~#link(<eq:ODEModelKV>)[(20)] provides
$ bold(z) \( bold(v) ""_(upright(r)) \) = - sum_(i = 0)^n macron(upright(bold(K)))_i^(- 1) frac(upright(bold(M))^2 \( bold(v) ""_(upright(r)) #scale(x: 120%, y: 120%)[\)] bold(v) ""_(upright(r)), ∥upright(bold(M)) \( bold(v) ""_(upright(r)) \) bold(v) ""_(upright(r))∥_(2 \, epsilon)) \, quad bold(z)_i \( bold(v) ""_(upright(r)) \) = - macron(upright(bold(K)))_i^(- 1) frac(upright(bold(M))^2 \( bold(v) ""_(upright(r)) #scale(x: 120%, y: 120%)[\)] bold(v) ""_(upright(r)), ∥upright(bold(M)) \( bold(v) ""_(upright(r)) \) bold(v) ""_(upright(r))∥_(2 \, epsilon)) \, quad i in { 1 \, dots.h \, n } \, $
which is consistent with the parallel structure of the GKV element.

For $n = 0$ and $n = 1$ and suitable parametrisations, respectively, the
FrBD$""_(n + 1)$ models~#link(<eq:ODEModel>)[(19)]
and~#link(<eq:ODEModelKV>)[(20)] reduce to the Dahl and
FrBD$""_2$-SLS formulations, which are based on a single elastic
element, and on a Standard Linear Solid (SLS) or Zener model. In turn,
it may be easily concluded that the FrBD$""_2$-SLS description further
simplifies into the FrBD$""_1$-KV model introduced in \[#link(<bib-FrBDroll>)[88]\] for a
specific parametrisation of the matrices $macron(upright(bold(K)))_1$
and $bold(tau)_1$, generalising all the FrBD formulations currently
available in the literature (see Appendix~#link(<app:alt>)[B]).

Equations~#link(<eq:ODEModel>)[(19)]
and~#link(<eq:ODEModelKV>)[(20)] are, however, still
finite-dimensional, and cannot accurately capture spatially-varying
rolling contact phenomena that evolve over a finite area. The
distributed-parameter extension of
Eqs.~#link(<eq:ODEModel>)[(19)]
and~#link(<eq:ODEModelKV>)[(20)] is worked out next in
Sect. #link(<sect:models>)[3].

= Distributed rolling contact models
<sect:models>
This section introduces three rolling contact models of varying
complexity that can be derived from
Eqs.~#link(<eq:ODEModel>)[(19)]
and~#link(<eq:ODEModelKV>)[(20)]. Specifically, the next
Sect.~#link(<sect:gener>)[3.1] discusses some generalities, whereas the three
formulations are detailed in Sect.~#link(<sect:modelRollSimple>)[3.2].

== Generalities
<sect:gener>
Following the discussion initiated in \[#link(<bib-FrBDroll>)[88]\], three important aspects
that are first clarified concern the formulation of
Eqs.~#link(<eq:ODEModel>)[(19)]
and~#link(<eq:ODEModelKV>)[(20)] as a PDE systems in the
Eulerian setting, the prescription of appropriate #emph[boundary
conditions] (BCs), and the calculation of the tangential forces and
vertical moment. These are addressed respectively in
Sects.~#link(<sect:eulerian>)[3.1.1],~#link(<sect:BC>)[3.1.2], and~#link(<ect:forces>)[3.1.3].

=== Eulerian approach and transport velocity
<sect:eulerian>
The following discussion is adapted from \[#link(<bib-FrBDroll>)[88]\]. As illustrated in
Fig.~#link(<fig:RollingBodies>)[3], the rolling contact problem between two bodies
is typically studied in a contact-fixed reference frame
$\( O \; x \, y \, z \)$, with the $x$-axis (longitudinal) oriented
along the main rolling direction, the $z$-axis (vertical) pointing into
one of the two bodies (often the lower one), and the $y$-axis (lateral)
defined to complete a right-handed coordinate system. The origin $O$
coincides with the centroid of the (apparent), possibly time-varying,
contact area $cal(C) \( t \)$, which is often supposed to be independent
of the tangential (longitudinal and lateral) interactions between the
two bodies, and solely determined by the normal contact configuration
\[#link(<bib-KalkerBook>)[5]\]. Both the situations of reciprocal rolling, as depicted in
Fig.~#link(<fig:RollingBodies>)[3]\(a), and translational and rolling contact, as
shown in Fig.~#link(<fig:RollingBodies>)[3]\(b), may be considered: in the first
case, the shape of the contact area may vary over time, but the origin
$O$ is typically fixed; in the second scenario, the reference frame
moves together with one of the two bodies (usually, the upper one).

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
the contact area, the displacement of a bristle, the force generated by
each element, and the deformations will depend on their position, that
is,
$bold(z) \( t \) = bold(z) \( bold(x) \, t \) = \[ z_x \( bold(x) \, t \) #h(0em) z_y \( bold(x) \, t \) \]^(upright(T))$,
$bold(f)_i \( t \) = bold(f)_i \( bold(x) \, t \) = \[ f_(i x) \( bold(x) \, t \) #h(0em) f_(i y) \( bold(x) \, t \) \]^(upright(T))$,
and
$bold(z)_i \( t \) = bold(z)_i \( bold(x) \, t \) = \[ z_(i x) \( bold(x) \, t \) #h(0em) z_(i y) \( bold(x) \, t \) \]^(upright(T))$,
$i in { 1 \, dots.h \, n }$, with $bold(x) in cal(C) \( t \)$. According
to the Eulerian approach, the total time derivatives appearing in
Eq.~#link(<eq:ODEModel>)[(19)] become
#math.equation(block: true, numbering: _ => [(24)], $ dot(bold(z)) \( bold(x) \, t \) = frac(upright(d) bold(z) \( bold(x) \, t \), upright(d) t) & = frac(partial bold(z) \( bold(x) \, t \), partial t) + #scale(x: 120%, y: 120%)[\(] bold(V) \( bold(x) \, t \) dot.op nabla_(bold(x)) #scale(x: 120%, y: 120%)[\)] bold(z) \( bold(x) \, t \) \,\
dot(bold(f))_i \( bold(x) \, t \) = frac(upright(d) bold(f)_i \( bold(x) \, t \), upright(d) t) & = frac(partial bold(f)_i \( bold(x) \, t \), partial t) + #scale(x: 120%, y: 120%)[\(] bold(V) \( bold(x) \, t \) dot.op nabla_(bold(x)) #scale(x: 120%, y: 120%)[\)] bold(f)_i \( bold(x) \, t \) \,\
dot(bold(z))_i \( bold(x) \, t \) = frac(upright(d) bold(z)_i \( bold(x) \, t \), upright(d) t) & = frac(partial bold(z)_i \( bold(x) \, t \), partial t) + #scale(x: 120%, y: 120%)[\(] bold(V) \( bold(x) \, t \) dot.op nabla_(bold(x)) #scale(x: 120%, y: 120%)[\)] bold(z)_i \( bold(x) \, t \) \, quad i in { 1 \, dots.h \, n } \, $) <eq:Eulerian>
where
$bb(R)^2 in.rev bold(V) \( bold(x) \, t \) = \[ V_x \( bold(x) \, t \) #h(0em) V_y \( bold(x) \, t \) \]^(upright(T))$
dentoes the transport velocity, and
$bb(R)^2 ? nabla_(bold(x)) ? [frac(partial, partial x) quad frac(partial, partial y)]^upright(T)$
is the tangential gradient. Moreover, considering the #emph[rolling
speed]
$\[ V ""_(upright(m i n)) \, V ""_(upright(m a x)) \] in.rev V ""_(upright(r)) \( t \) ? ∥bold(V) \( bold(0) \, t \)∥_2$,
with $0 < V ""_(upright(m i n)) lt.eq V ""_(upright(m a x))$, it is
customary to define the #emph[travelled distance]
$bb(R)_(gt.eq 0) in.rev s ? integral_0^t V ""_(upright(r)) \( t' \) upright(d) t'$
to replace the time variable $t$.

Utilising Eqs.~#link(<eq:Eulerian>)[(24)], the distributed
FrBD$""_(n + 1)$-GM and FrBD$""_(n + 1)$-GKV models may be obtained
directly from their lumped counterparts described by
Eqs.~#link(<eq:ODEModel>)[(19)]
and~#link(<eq:ODEModelKV>)[(20)]. Starting with the
FrBD$""_(n + 1)$-GM formulation, introducing the state vector
$bb(R)^(2 \( n + 1 \)) in.rev bold(u) \( bold(x) \, s \) ? \[ bold(z)^(upright(T)) \( bold(x) \, s \) #h(0em) bold(f)_1^(upright(T)) \( bold(x) \, s \) #h(0em) bold(f)_2^(upright(T)) \( bold(x) \, s \) #h(0em) dots.h #h(0em) bold(f)_n^(upright(T)) \( bold(x) \, s \) \]^(upright(T))$,
Eq.~#link(<eq:ODEModel>)[(19)] may be recast as
#math.equation(block: true, numbering: _ => [(25)], $  & frac(partial bold(u) \( bold(x) \, s \), partial s) + #scale(x: 120%, y: 120%)[\(] macron(bold(V)) \( bold(x) \, s \) dot.op nabla_(bold(x)) #scale(x: 120%, y: 120%)[\)] bold(u) \( bold(x) \, s \) = upright(bold(Sigma)) #scale(x: 120%, y: 120%)[\(] macron(bold(v)) ""_(upright(r)) \( bold(x) \, s \) \, s #scale(x: 120%, y: 120%)[\)] bold(u) \( bold(x) \, s \) + bold(h) #scale(x: 120%, y: 120%)[\(] macron(bold(v)) ""_(upright(r)) \( bold(x) \, s \) #scale(x: 120%, y: 120%)[\)] \, quad bold(x) in accent(cal(C), circle.stroked) \( s \) \, #h(0em) s in \( 0 \, S \) \,\
 & bold(u) \( bold(x) \, 0 \) = bold(u)_0 \( bold(x) \) \, quad bold(x) in accent(cal(C), circle.stroked)_0 \, $) <eq:PDenoMOdel09>
where $accent(cal(C), circle.stroked)_0 ? accent(cal(C), circle.stroked) \( 0 \)$,
$bb(R)_(> 0) in.rev S ? integral_0^T V ""_(upright(r)) \( t \) upright(d) t$,
$bb(R)^2 in.rev macron(bold(V)) \( bold(x) \, s \) = \[ macron(V)_x \( bold(x) \, s \) #h(0em) macron(V)_y \( bold(x) \, s \) \]^(upright(T)) ? bold(V) \( bold(x) \, s \) \/ V ""_(upright(r)) \( s \)$,
$bb(R)^2 in.rev macron(bold(v)) ""_(upright(r)) \( bold(x) \, s \) = \[ macron(v)_(upright(r) x) \( bold(x) \, s \) #h(0em) macron(v)_(upright(r) y) \( bold(x) \, s \) \]^(upright(T)) ? bold(v) ""_(upright(r)) \( bold(x) \, s \) \/ V ""_(upright(r)) \( s \)$,
the functions
$upright(bold(Psi)) : bb(R)^2 times bb(R)_(gt.eq 0) mapsto upright(bold(M))_2 \( bb(R) \)$
and $bold(h) : bb(R)^2 mapsto bb(R)^(2 \( n + 1 \))$ given by
#math.equation(block: true, numbering: _ => [(26)], $ upright(bold(Psi)) \( macron(bold(v)) ""_(upright(r)) \, s \) & ? - frac(1, V ""_(upright(r)) \( s \)) upright(bold(M))^(- 2) #scale(x: 120%, y: 120%)[\(] V ""_(upright(r)) \( s \) macron(bold(v)) ""_(upright(r)) #scale(x: 120%, y: 120%)[\)] ∥upright(bold(M)) #scale(x: 120%, y: 120%)[\(] V ""_(upright(r)) \( s \) macron(bold(v)) ""_(upright(r)) #scale(x: 120%, y: 120%)[\)] V ""_(upright(r)) \( s \) macron(bold(v)) ""_(upright(r))∥_(2 \, epsilon) \,\
bold(h) \( macron(bold(v)) ""_(upright(r)) \) & ? upright(bold(H)) macron(bold(v)) ""_(upright(r)) \, $) <eq:Psifuns>
and
$upright(bold(Sigma)) : bb(R)^2 times bb(R)_(gt.eq 0) mapsto upright(bold(M))_(2 \( n + 1 \)) \( bb(R) \)$
and
$upright(bold(H)) in upright(bold(M))_(2 \( n + 1 \) times 2) \( bb(R) \)$
read

#block[
#math.equation(block: true, numbering: _ => [(27)], $ upright(bold(Sigma)) \( macron(bold(v)) ""_(upright(r)) \, s \) & ? mat(delim: "[", upright(bold(Psi)) \( macron(bold(v)) ""_(upright(r)) \, s \) macron(upright(bold(K)))_0, upright(bold(Psi)) \( macron(bold(v)) ""_(upright(r)) \, s \), upright(bold(Psi)) \( macron(bold(v)) ""_(upright(r)) \, s \), dots.h, upright(bold(Psi)) \( macron(bold(v)) ""_(upright(r)) \, s \); macron(upright(bold(K)))_1 upright(bold(Psi)) \( macron(bold(v)) ""_(upright(r)) \, s \) macron(upright(bold(K)))_0, - frac(bold(tau)_1^(- 1), V ""_(upright(r)) \( s \)) + macron(upright(bold(K)))_1 upright(bold(Psi)) \( macron(bold(v)) ""_(upright(r)) \, s \), macron(upright(bold(K)))_1 upright(bold(Psi)) \( macron(bold(v)) ""_(upright(r)) \, s \), dots.h, macron(upright(bold(K)))_1 upright(bold(Psi)) \( macron(bold(v)) ""_(upright(r)) \, s \); macron(upright(bold(K)))_2 upright(bold(Psi)) \( macron(bold(v)) ""_(upright(r)) \, s \) macron(upright(bold(K)))_0, macron(upright(bold(K)))_2 upright(bold(Psi)) \( macron(bold(v)) ""_(upright(r)) \, s \), - frac(bold(tau)_2^(- 1), V ""_(upright(r)) \( s \)) + macron(upright(bold(K)))_2 upright(bold(Psi)) \( macron(bold(v)) ""_(upright(r)) \, s \), dots.h, macron(upright(bold(K)))_2 upright(bold(Psi)) \( macron(bold(v)) ""_(upright(r)) \, s \); dots.v, dots.v, dots.v, dots.down, dots.v; macron(upright(bold(K)))_n upright(bold(Psi)) \( macron(bold(v)) ""_(upright(r)) \, s \) macron(upright(bold(K)))_0, macron(upright(bold(K)))_n upright(bold(Psi)) \( macron(bold(v)) ""_(upright(r)) \, s \), macron(upright(bold(K)))_n upright(bold(Psi)) \( macron(bold(v)) ""_(upright(r)) \, s \), dots.h, - frac(bold(tau)_n^(- 1), V ""_(upright(r)) \( s \)) + macron(upright(bold(K)))_n upright(bold(Psi)) \( macron(bold(v)) ""_(upright(r)) \, s \)) \,\
upright(bold(H)) & ? - mat(delim: "[", upright(bold(I))_2, macron(upright(bold(K)))_1, macron(upright(bold(K)))_2, dots.h, macron(upright(bold(K)))_n)^(upright(T)) . $) <eq:Hfunct>

]
On the other hand, defining
$bb(R)^(2 \( n + 1 \)) in.rev bold(u) \( bold(x) \, s \) ? \[ bold(z)^(upright(T)) \( bold(x) \, s \) #h(0em) bold(z)_1^(upright(T)) \( bold(x) \, s \) #h(0em) bold(z)_2^(upright(T)) \( bold(x) \, s \) #h(0em) dots.h #h(0em) bold(z)_n^(upright(T)) \( bold(x) \, s \) \]^(upright(T))$,
Eq.~#link(<eq:ODEModelKV>)[(20)] admits a distributed
parameter representation equivalent
to~#link(<eq:PDenoMOdel09>)[(25)], with
$upright(bold(Psi)) \( macron(bold(v)) ""_(upright(r)) \, s \)$ and
$bold(h) \( macron(bold(v)) ""_(upright(r)) \)$ as in
Eq.~#link(<eq:Psifuns>)[(26)], and
#math.equation(block: true, numbering: _ => [(28)], $ upright(bold(Sigma)) \( macron(bold(v)) ""_(upright(r)) \, s \) & ? mat(delim: "[", upright(bold(Psi)) \( macron(bold(v)) ""_(upright(r)) \, s \) macron(upright(bold(K)))_0, - upright(bold(Psi)) \( macron(bold(v)) ""_(upright(r)) \, s \) macron(upright(bold(K)))_0, - upright(bold(Psi)) \( macron(bold(v)) ""_(upright(r)) \, s \) macron(upright(bold(K)))_0, dots.h, - upright(bold(Psi)) \( macron(bold(v)) ""_(upright(r)) \, s \) macron(upright(bold(K)))_0; frac(macron(upright(bold(C)))_1^(- 1) macron(upright(bold(K)))_0, V ""_(upright(r)) \( s \)), - frac(macron(upright(bold(C)))_1^(- 1), V ""_(upright(r)) \( s \)) \( macron(upright(bold(K)))_0 + macron(upright(bold(K)))_1 \), - frac(macron(upright(bold(C)))_1^(- 1) macron(upright(bold(K)))_0, V ""_(upright(r)) \( s \)), dots.h, - frac(macron(upright(bold(C)))_1^(- 1) macron(upright(bold(K)))_0, V ""_(upright(r)) \( s \)); frac(macron(upright(bold(C)))_2^(- 1) macron(upright(bold(K)))_0, V ""_(upright(r)) \( s \)), - frac(macron(upright(bold(C)))_2^(- 1) macron(upright(bold(K)))_0, V ""_(upright(r)) \( s \)), - frac(macron(upright(bold(C)))_2^(- 1), V ""_(upright(r)) \( s \)) \( macron(upright(bold(K)))_0 + macron(upright(bold(K)))_2 \), dots.h, - frac(macron(upright(bold(C)))_2^(- 1) macron(upright(bold(K)))_0, V ""_(upright(r)) \( s \)); dots.v, dots.v, dots.v, dots.down, dots.v; frac(macron(upright(bold(C)))_n^(- 1) macron(upright(bold(K)))_0, V ""_(upright(r)) \( s \)), - frac(macron(upright(bold(C)))_n^(- 1) macron(upright(bold(K)))_0, V ""_(upright(r)) \( s \)), - frac(macron(upright(bold(C)))_n^(- 1) macron(upright(bold(K)))_0, V ""_(upright(r)) \( s \)), dots.h, - frac(macron(upright(bold(C)))_n^(- 1), V ""_(upright(r)) \( s \)) \( macron(upright(bold(K)))_0 + macron(upright(bold(K)))_n \)) \,\
upright(bold(H)) & ? - mat(delim: "[", upright(bold(I))_2, upright(bold(0)), upright(bold(0)), dots.h, upright(bold(0)))^(upright(T)) . $) <eq:Hfunct2>
Equations~#link(<eq:PDenoMOdel09>)[(25)]-#link(<eq:Hfunct2>)[(28)]
define systems of first-order hyperbolic PDEs with internal relaxation
dynamics, whose characteristic structure directly reflects the rolling
kinematics of the contact interface. In particular, to ensure
well-posedness, Eq.~#link(<eq:PDenoMOdel09>)[(25)] needs
to be supplemented with a set of BCs, as discussed next in
Sect.~#link(<sect:BC>)[3.1.2].

=== Boundary condition (BC)
<sect:BC>
Appropriate BC for the PDE~(25a) may
be formulated by defining the #emph[leading edge] $cal(L) \( s \)$,
#emph[neutral edge] $cal(N) \( s \)$, and #emph[trailing edge]
$cal(T) \( s \)$ as follows \[#link(<bib-FrBDroll>)[88]\]:
#math.equation(block: true, numbering: _ => [(29)], $ cal(L) \( s \) & ? partial cal(C)_(-) \( s \) = #scale(x: 180%, y: 180%)[{] bold(x) in partial cal(C) \( s \) #scale(x: 180%, y: 180%)[\|] #scale(x: 120%, y: 120%)[\[] macron(bold(V)) \( bold(x) \, s \) - macron(bold(V))_(partial cal(C)) \( bold(x) \, s \) #scale(x: 120%, y: 120%)[\]] dot.op hat(bold(n))_(partial cal(C)) \( bold(x) \, s \) < 0 #scale(x: 180%, y: 180%)[}] \,\
cal(N) \( s \) & ? partial cal(C)_0 \( s \) = #scale(x: 180%, y: 180%)[{] bold(x) in partial cal(C) \( s \) #scale(x: 180%, y: 180%)[\|] #scale(x: 120%, y: 120%)[\[] macron(bold(V)) \( bold(x) \, s \) - macron(bold(V))_(partial cal(C)) \( bold(x) \, s \) #scale(x: 120%, y: 120%)[\]] dot.op hat(bold(n))_(partial cal(C)) \( bold(x) \, s \) = 0 #scale(x: 180%, y: 180%)[}] \,\
cal(T) \( s \) & ? partial cal(C)_(+) \( s \) = #scale(x: 180%, y: 180%)[{] bold(x) in partial cal(C) \( s \) #scale(x: 180%, y: 180%)[\|] #scale(x: 120%, y: 120%)[\[] macron(bold(V)) \( bold(x) \, s \) - macron(bold(V))_(partial cal(C)) \( bold(x) \, s \) #scale(x: 120%, y: 120%)[\]] dot.op hat(bold(n))_(partial cal(C)) \( bold(x) \, s \) > 0 #scale(x: 180%, y: 180%)[}] \, $) <eq:Inflow0Outflow>
where $hat(bold(n))_(partial cal(C)) \( bold(x) \, s \) in bb(R)^2$
denotes the outward unit normal to $partial cal(C) \( s \)$, and
$macron(bold(V))_(partial cal(C)) \( bold(x) \, s \) in bb(R)^2$ is its
nondimensional velocity. For a transport equation like
Eq.~(25a), the natural BC should be
prescribed at the inflow boundary, that is, on the leading edge
$cal(L) \( s \)$, for all $s in \( 0 \, S \)$. In particular, enforcing
$bold(u) \( bold(x) \, s \) = bold(0)$ ensures the continuity of both
the deformations and generated forces at the transition between the free
portions of the bodies and those making contact. This resolves the
long-standing issues arising from lower-order models, as those presented
in \[#link(<bib-FrBDroll>)[88]\], which only guarantee the continuity of the deformations
\[#link(<bib-TsiotrasConf>)[77], #link(<bib-Tsiotras1>)[78], #link(<bib-Tsiotras3>)[79], #link(<bib-Deur0>)[80], #link(<bib-Deur1>)[81], #link(<bib-Deur2>)[82]\].

=== Tangential forces and vertical moment
<ect:forces>
Recalling Eqs.~#link(<eq:force0>)[(2a)]
and~#link(<eq:force0GKV>)[(9a)], the total force generated
by the bristle deflection may be generally expressed as
#math.equation(block: true, numbering: _ => [(30)], $ bold(f) \( bold(x) \, s \) = upright(bold(C)) bold(u) \( bold(x) \, s \) \, $) <eq:ftot>
with the matrix
$upright(bold(C)) in upright(bold(M))_(2 times 2 \( n + 1 \))$ reading
#math.equation(block: true, numbering: _ => [(31)], $ upright(bold(C)) ? mat(delim: "[", macron(upright(bold(K)))_0, upright(bold(I))_2, upright(bold(I))_2, dots.h upright(bold(I))_2) \, $) <eq:C1>
for the FrBD$""_(n + 1)$-GM model, and
#math.equation(block: true, numbering: _ => [(32)], $ upright(bold(C)) ? mat(delim: "[", macron(upright(bold(K)))_0, - macron(upright(bold(K)))_0, - macron(upright(bold(K)))_0, dots.h, - macron(upright(bold(K)))_0) \, $) <eq:C2>
for the FrBD$""_(n + 1)$-GKV one. Starting with
Eqs.~#link(<eq:ftot>)[(30)],~#link(<eq:C1>)[(31)],
and~#link(<eq:C2>)[(32)], the tangential forces
$bb(R) in.rev bold(F)_(bold(x)) \( s \) = \[ F_x \( s \) #h(0em) F_y \( s \) \]^(upright(T))$
and the vertical moment $M_z \( s \) in bb(R)$ may then be computed as
#math.equation(block: true, numbering: _ => [(33)], $ bold(F)_(bold(x)) \( s \) & = integral.double_(cal(C) \( s \)) p \( bold(x) \, s \) bold(f) \( bold(x) \, s \) upright(d) bold(x) \,\
M_z \( s \) & = integral.double_(cal(C) \( s \)) p \( bold(x) \, s \) #scale(x: 120%, y: 120%)[\[] x f_y \( bold(x) \, s \) - y f_x \( bold(x) \, s \) #scale(x: 120%, y: 120%)[\]] upright(d) bold(x) \, quad s in \[ 0 \, S \] \, $) <eq:FandM>
where $p in C^0 \( cal(C) times \[ 0 \, S \] \; bb(R)_(gt.eq 0) \)$
indicates the pressure distribution inside the contact area.

In alternative to Eq.~(33b), the
vertical moment can also be evaluated considering the deformed
configuration:
#math.equation(block: true, numbering: _ => [(34)], $ M_z \( s \) & = integral.double_(cal(C) \( s \)) p \( bold(x) \, s \) #scale(x: 180%, y: 180%)[\[] #scale(x: 120%, y: 120%)[\(] x + z_x \( bold(x) \, s \) #scale(x: 120%, y: 120%)[\)] f_y \( bold(x) \, s \) - #scale(x: 120%, y: 120%)[\(] y + z_y \( bold(x) \, s \) #scale(x: 120%, y: 120%)[\)] f_x \( bold(x) \, s \) #scale(x: 180%, y: 180%)[\]] upright(d) bold(x) \, quad s in \[ 0 \, S \] . $) <eq:Malt>
Equation~(33a) remains formally unchanged.

The next Sect. #link(<sect:modelRollSimple>)[3.2] presents three different
FrBD$""_(n + 1)$-GM rolling contact models.

== FrBD$""_(n + 1)$ rolling contact models
<sect:modelRollSimple>
In order to solve the PDE #link(<eq:PDenoMOdel09>)[(25)],
it is necessary to specify the (nondimensional) transport and rigid
relative velocities $macron(bold(V)) \( bold(x) \, s \)$ and
$macron(bold(v)) ""_(upright(r)) \( bold(x) \, s \)$. Concerning the
former, for a viscoelastic body rolling a sliding over a flat substrate,
the most general expression may be deduced as \[#link(<bib-FrBDroll>)[88]\]
#math.equation(block: true, numbering: _ => [(35)], $ macron(bold(V)) \( bold(x) \, s \) = - mat(delim: "[", epsilon_y \( s \); - epsilon_x \( s \)) + upright(bold(A))_(phi_1) \( s \) bold(x) \, $) <eq:generalV>
where
$bb(R)^2 in.rev bold(epsilon) \( s \) = \[ epsilon_x \( s \) #h(0em) epsilon_y \( s \) \]^(upright(T))$,
with $∥bold(epsilon) \( s \)∥_2 = 1$, and
$upright(bold(A))_(phi_1) \( s \) in upright(bold(M))_2 \( bb(R) \)$
reads
#math.equation(block: true, numbering: _ => [(36)], $ upright(bold(A))_(phi_1) \( s \) ? mat(delim: "[", 0, phi_1 \( s \); - phi_1 \( s \), 0) \, $) <eq:geometricSPinTensor>
being $phi_1 \( s \) in bb(R)$ a spin component depending on the
reciprocal deformative behaviour between the contacting bodies
\[#link(<bib-FrBDroll>)[88]\]. On the other hand, the nondimensional rigid relative velocity
is generally a function of the bristle deformation \[#link(<bib-FrBDroll>)[88]\], according
to
#math.equation(block: true, numbering: _ => [(37)], $ macron(bold(v)) ""_(upright(r)) #scale(x: 120%, y: 120%)[\(] bold(u) \( bold(x) \, s \) \, bold(x) \, s #scale(x: 120%, y: 120%)[\)] = macron(bold(v)) \( bold(x) \, s \) - upright(bold(A))_(phi_2) \( s \) bold(z) \( bold(x) \, s \) \, $) <eq:RigidVelSpin>
with
$bb(R)^2 in.rev macron(bold(v)) \( bold(x) \, s \) = \[ macron(v)_x \( bold(x) \, s \) #h(0em) macron(v)_y \( bold(x) \, s \) \]^(upright(T))$
given by
#math.equation(block: true, numbering: _ => [(38)], $ macron(bold(v)) \( bold(x) \, s \) = - bold(sigma) \( s \) - upright(bold(A))_phi \( s \) bold(x) \, $) <eq:v0>
where
$bb(R)^2 in.rev bold(sigma) \( s \) = \[ sigma_x \( s \) #h(0em) sigma_y \( s \) \]^(upright(T))$
denotes the #emph[translational slip], and the matrix
$upright(bold(A))_phi \( s \) in upright(bold(M))_2 \( bb(R) \)$ reads
#math.equation(block: true, numbering: _ => [(39)], $ upright(bold(A))_phi \( s \) & ? mat(delim: "[", 0, - phi \( s \); phi \( s \), 0) \, $) <eq:Aphi>
being $phi \( s \) in bb(R)$ the #emph[total spin slip], which is the
sum of the #emph[geometrical spin] $phi_gamma \( s \) in bb(R)$, and the
#emph[effective spin] $phi_psi \( s \)$:
$ phi \( s \) = phi_gamma \( s \) + phi_psi \( s \) . $ Finally, the
matrix
$upright(bold(A))_(phi_2) \( s \) in upright(bold(M))_2 \( bb(R) \)$ in
Eq.~#link(<eq:RigidVelSpin>)[(37)] writes
#math.equation(block: true, numbering: _ => [(41)], $ upright(bold(A))_(phi_2) \( s \) & ? mat(delim: "[", 0, - phi_2 \( s \); phi_2 \( s \), 0) \, $) <eq:turnSpinMatrix>
where $phi_2 \( s \) in bb(R)$ is a second spin component, whose
definition also depends on the reciprocal material properties. For a
general interpretation of the terms $phi_1 \( s \)$ and $phi_2 \( s \)$,
the reader is referred to \[#link(<bib-FrBDroll>)[88]\]. For notational convenience, in this
paper, they are collected into the vector
$bb(R)^2 in.rev bold(phi) \( s \) = \[ phi_1 \( s \) #h(0em) phi_2 \( s \) \]^(upright(T))$.

Rolling contact models with different orders of complexity may be
deduced from
Eqs.~#link(<eq:generalV>)[(35)]-#link(<eq:turnSpinMatrix>)[(41)]
by further simplifying the expressions for the transport and rigid
relative velocities. Specifically, by approximating
$macron(bold(V)) \( bold(x) \, s \) approx - \[ 1 #h(0em) 0 \]^(upright(T))$
in Eq.~#link(<eq:generalV>)[(35)] and neglecting the term
$upright(bold(A))_(phi_2 \( s \)) bold(z) \( bold(x) \, s \)$
in~#link(<eq:RigidVelSpin>)[(37)], the #emph[standard
linear FrBD$""_(n + 1)$ rolling contact models] formalised below are
obtained (Models~#link(<stdmodel>)[1]).

#model-box([Models 1: Standard linear FrBD$""_(n + 1)$ models], [
#math.equation(block: true, numbering: _ => [(42)], $  & frac(partial bold(u) \( bold(x) \, s \), partial s) - frac(partial bold(u) \( bold(x) \, s \), partial x) = upright(bold(Sigma)) #scale(x: 120%, y: 120%)[\(] macron(bold(v)) \( bold(x) \, s \) \, s #scale(x: 120%, y: 120%)[\)] bold(z) \( bold(x) \, s \) + bold(h) #scale(x: 120%, y: 120%)[\(] macron(bold(v)) \( bold(x) \, s \) #scale(x: 120%, y: 120%)[\)] \, quad bold(x) in accent(cal(C), circle.stroked) \( s \) \, #h(0em) s in \( 0 \, S \) \,\
 & bold(u) \( bold(x) \, s \) = bold(0) \, quad bold(x) in cal(L) \( s \) \, #h(0em) s in \( 0 \, S \) \,\
 & bold(u) \( bold(x) \, 0 \) = bold(u)_0 \( bold(x) \) \, quad bold(x) in accent(cal(C), circle.stroked)_0 . $) <eq:standard0>

]) <stdmodel>
Models~#link(<stdmodel>)[1] can adequately describe rolling contact processes
evolving along a main direction in the presence of small spin slips,
such as wheel-rail and tyre-road interactions in normal driving
conditions (small camber angles and turn spins). Considering instead the
exact expressions
Eqs.~#link(<eq:generalV>)[(35)]-#link(<eq:turnSpinMatrix>)[(41)],
the #emph[semilinear FrBD$""_(n + 1)$ models for large spin slips]
(Models~#link(<semilinmodel>)[2]) are formulated below.

#model-box([Models 2: Semilinear FrBD$""_(n + 1)$ models for large spin slips], [
#math.equation(block: true, numbering: _ => [(43a)], $  & frac(partial bold(u) \( bold(x) \, s \), partial s) + #scale(x: 120%, y: 120%)[\(] macron(bold(V)) \( bold(x) \, s \) dot.op nabla_(bold(x)) #scale(x: 120%, y: 120%)[\)] bold(u) \( bold(x) \, s \) = upright(bold(Sigma)) #scale(x: 180%, y: 180%)[\(] macron(bold(v)) ""_(upright(r)) #scale(x: 120%, y: 120%)[\(] bold(u) \( bold(x) \, s \) \, bold(x) \, s #scale(x: 120%, y: 120%)[\)] \, s #scale(x: 180%, y: 180%)[\)] bold(u) \( bold(x) \, s \)\
 & #h(16em) + bold(h) #scale(x: 180%, y: 180%)[\(] macron(bold(v)) ""_(upright(r)) #scale(x: 120%, y: 120%)[\(] bold(u) \( bold(x) \, s \) \, bold(x) \, s #scale(x: 120%, y: 120%)[\)] #scale(x: 180%, y: 180%)[\)] \, quad bold(x) in accent(cal(C), circle.stroked) \( s \) \, #h(0em) s in \( 0 \, S \) \,\
 & bold(u) \( bold(x) \, s \) = bold(0) \, quad bold(x) in cal(L) \( s \) \, #h(0em) s in \( 0 \, S \) \,\
 & bold(u) \( bold(x) \, 0 \) = bold(u)_0 \( bold(x) \) \, quad bold(x) in accent(cal(C), circle.stroked)_0 . $) <eq:semilinear>

]) <semilinmodel>
Compared to~Models~#link(<stdmodel>)[1],~Models~#link(<semilinmodel>)[2] capture nonlinear
effects induced by large spin slips, which arise, for instance, in
automotive tyres subjected to high camber angles or during low-speed
parking manoeuvres. However, in contrast to~Models~#link(<stdmodel>)[1], they are
highly nonlinear in the variable $bold(u) \( bold(x) \, s \)$, which
makes their numerical resolution more delicate.

Finally, an approximation to the semilinear
PDE~#link(<eq:semilinear>)[(43a)] may be recovered by
replacing
$macron(bold(v)) ""_(upright(r)) \( bold(z) \( bold(x) \, s \) \, bold(x) \, s \)$
by $macron(bold(v)) \( bold(x) \, s \)$ in the nonlinear function
$upright(bold(Sigma)) \( dot.op \, dot.op \)$, yielding the following
#emph[linear FrBD$""_(n + 1)$ models for large spin slips]
(Models~#link(<linmodel2>)[3]).

#model-box([Models 3: Linear FrBD$""_(n + 1)$ models for large spin slips], [
#math.equation(block: true, numbering: _ => [(44)], $  & frac(partial bold(u) \( bold(x) \, s \), partial s) + #scale(x: 120%, y: 120%)[\(] macron(bold(V)) \( bold(x) \, s \) dot.op nabla_(bold(x)) #scale(x: 120%, y: 120%)[\)] bold(u) \( bold(x) \, s \) = upright(bold(Sigma)) #scale(x: 120%, y: 120%)[\(] macron(bold(v)) \( bold(x) \, s \) \, s #scale(x: 120%, y: 120%)[\)] bold(u) \( bold(x) \, s \)\
 & #h(16em) + bold(h) #scale(x: 180%, y: 180%)[\(] macron(bold(v)) ""_(upright(r)) #scale(x: 120%, y: 120%)[\(] bold(u) \( bold(x) \, s \) \, bold(x) \, s #scale(x: 120%, y: 120%)[\)] #scale(x: 180%, y: 180%)[\)] \, quad bold(x) in accent(cal(C), circle.stroked) \( s \) \, #h(0em) s in \( 0 \, S \) \,\
 & bold(u) \( bold(x) \, s \) = bold(0) \, quad bold(x) in cal(L) \( s \) \, #h(0em) s in \( 0 \, S \) \,\
 & bold(u) \( bold(x) \, 0 \) = bold(u)_0 \( bold(x) \) \, quad bold(x) in accent(cal(C), circle.stroked)_0 . $) <eq:linwasdir>

]) <linmodel2>
Models~#link(<linmodel2>)[3] are appropriate in regimes where the spin
$phi_1 \( s \)$ may attain large values, whereas $phi_2 \( s \)$ remains
moderate. They may be regarded as a linear, zeroth-order approximation
to~Models~#link(<semilinmodel>)[2], and can therefore be employed as an initial
iterate in fixed-point-based numerical solution procedures.

Models~#link(<stdmodel>)[1],~2, and~3 represent the
FrBD$""_(n + 1)$-GM and FrBD$""_(n + 1)$-GKV counterparts of the
FrBD$""_1$-KV formulations introduced in \[#link(<bib-FrBDroll>)[88]\]. The next
Sect.~#link(<sect:math>)[4] proceeds to the rigorous analysis of~Models~#link(<stdmodel>)[1]
and~3 under standard assumptions.

= Mathematical properties
<sect:math>
The present section is devoted to the mathematical analysis
of~Models~#link(<stdmodel>)[1] and~3. More specifically, Sect.~#link(<sect:wellp>)[4.1]
investigates their well-posedness, whereas passivity is studied in
Sect.~#link(<sect:pass>)[4.2].

== Well-posedness
<sect:wellp>
Well-posedness for~Models~#link(<stdmodel>)[1] and~3 may be asserted
within different functional settings. For simplicity, the following
results are enounced considering a time-invariant contact area, which
permits recovering existence and uniqueness results by invoking standard
semigroup arguments \[#link(<bib-Pazy>)[102], #link(<bib-Tanabe1>)[103], #link(<bib-Tanabe>)[104]\]. Extensions to slowly varying
domains may be pursued using time-dependent semigroups \[#link(<bib-FrBDroll>)[88]\] or
ALE-based techniques.

For what follows, it is convenient to introduce the functions
#math.equation(block: true, numbering: _ => [(45)], $ tilde(bold(h)) \( bold(x) \, s \) & ? bold(h) #scale(x: 120%, y: 120%)[\(] macron(bold(v)) \( bold(x) \, s \) #scale(x: 120%, y: 120%)[\)] \,\
tilde(upright(bold(Sigma))) \( bold(x) \, s \) & ? upright(bold(Sigma)) #scale(x: 120%, y: 120%)[\(] macron(bold(v)) \( bold(x) \, s \) \, s #scale(x: 120%, y: 120%)[\)] \,\
tilde(upright(bold(Sigma)))_phi \( bold(x) \, s \) & ? upright(bold(Sigma)) #scale(x: 120%, y: 120%)[\(] macron(bold(v)) \( bold(x) \, s \) \, s #scale(x: 120%, y: 120%)[\)] - upright(bold(H)) upright(bold(A))_(phi_2) \( s \) . $) <eq:Sigmaf0>
so that Eq.~#link(<eq:standard0>)[(42)] may be restated as
#math.equation(block: true, numbering: _ => [(46)], $  & frac(partial bold(u) \( bold(x) \, s \), partial s) - frac(partial bold(u) \( bold(x) \, s \), partial x) = tilde(upright(bold(Sigma))) \( bold(x) \, s \) bold(u) \( bold(x) \, s \) + tilde(bold(h)) \( bold(x) \, s \) \, quad \( bold(x) \, s \) in accent(cal(C), circle.stroked) times \( 0 \, S \) \,\
 & bold(u) \( bold(x) \, s \) = bold(0) \, quad \( bold(x) \, s \) in cal(L) times \( 0 \, S \) \,\
 & bold(u) \( bold(x) \, 0 \) = bold(u)_0 \( bold(x) \) \, quad bold(x) in accent(cal(C), circle.stroked) . $) <eq:standard2>
For the simplified Eq.~#link(<eq:standard2>)[(46)],
existence and uniqueness of the solution are asserted below by
Theorem~#link(<thm:ex1>)[4.1].

#block[
#strong[Theorem 4.1] (Existence and uniqueness of solutions
of~Models~#link(<stdmodel>)[1]). #emph[Suppose that $accent(cal(C), circle.stroked) subset bb(R)^2$
is bounded, with boundary $partial cal(C)$ piecewise $C^1$. Then, for
all
$tilde(upright(bold(Sigma))) in C^0 \( cal(C) times \[ 0 \, S \] \; upright(bold(M))_(2 \( n + 1 \)) \( bb(R) \) \)$
and
$tilde(bold(h)) in C^0 \( \[ 0 \, S \] \; L^2 \( accent(cal(C), circle.stroked) \; bb(R)^(2 \( n + 1 \)) \) \)$
as in Eq.~#link(<eq:Sigmaf0>)[(45)], and ICs
$bold(u)_0 in L^2 \( accent(cal(C), circle.stroked) \; bb(R)^(2 \( n + 1 \)) \)$, the
PDE~#link(<eq:standard2>)[(46)] admits a unique #emph[mild
solution]
$bold(u) in C^0 \( \[ 0 \, S \] \; L^2 \( accent(cal(C), circle.stroked) \; bb(R)^(2 \( n + 1 \)) \) \)$.
Additionally, if
$tilde(upright(bold(Sigma))) in C^1 \( cal(C) times \[ 0 \, S \] \; upright(bold(M))_(2 \( n + 1 \)) \( bb(R) \) \)$,
$tilde(bold(h)) in C^1 \( \[ 0 \, S \] \; L^2 \( accent(cal(C), circle.stroked) \; bb(R)^(2 \( n + 1 \)) \) \)$,
and the IC
$bold(u)_0 in H^1 \( accent(cal(C), circle.stroked) \; bb(R)^(2 \( n + 1 \)) \)$
satisfies the BC~#link(<eq:standard2>)[(46b)],
the solution is #emph[classical], that is,
$bold(u) in C^1 \( \[ 0 \, S \] \; L^2 \( accent(cal(C), circle.stroked) \; bb(R)^(2 \( n + 1 \)) \) \) inter C^0 \( \[ 0 \, S \] \; H^1 \( accent(cal(C), circle.stroked) \; bb(R)^(2 \( n + 1 \)) \) \)$
and satisfies the
BC~#link(<eq:standard2>)[(46b)].]

#block[
#emph[#emph[Proof.] The result follows along the same lines as the proof
of Theorem 3.1 in \[#link(<bib-FrBDroll>)[88]\].~◻]

]
] <thm:ex1>
Owing to these premises, the PDE~#link(<eq:linwasdir>)[(44)]
is reformualted as
#math.equation(block: true, numbering: _ => [(47)], $  & frac(partial bold(u) \( bold(x) \, s \), partial s) + #scale(x: 120%, y: 120%)[\(] macron(bold(V)) \( bold(x) \) dot.op nabla_(bold(x)) #scale(x: 120%, y: 120%)[\)] bold(u) \( bold(x) \, s \) = tilde(upright(bold(Sigma)))_phi \( bold(x) \, s \) bold(u) \( bold(x) \, s \) + tilde(bold(h)) \( bold(x) \, s \) \, quad \( bold(x) \, s \) in accent(cal(C), circle.stroked) times \( 0 \, S \) \,\
 & bold(u) \( bold(x) \, s \) = bold(0) \, quad \( bold(x) \, s \) in cal(L) times \( 0 \, S \) \,\
 & bold(u) \( bold(x) \, 0 \) = bold(u)_0 \( bold(x) \) \, quad bold(x) in accent(cal(C), circle.stroked) \, $) <eq:quasiStationary0>
with the nondimensional transport velocity
$macron(bold(V)) \( bold(x) \)$ given, in the most general case, by
#math.equation(block: true, numbering: _ => [(48)], $ macron(bold(V)) \( bold(x) \) = - mat(delim: "[", epsilon_y; - epsilon_x) + upright(bold(A))_(phi_1) bold(x) . $) <eq:Vss>
Accordingly, well-posedness results are enounced in Theorem~#link(<thm:ex2>)[4.2]
below.

#block[
#strong[Theorem 4.2] (Existence and uniqueness of solutions
of~Models~#link(<linmodel2>)[3]). #emph[Suppose that
$macron(bold(V)) in C^1 \( cal(C) \; bb(R)^2 \)$ reads as in
Eq.~#link(<eq:Vss>)[(48)], and that
$accent(cal(C), circle.stroked) subset bb(R)^2$ is bounded, with boundary
$partial cal(C)$ piecewise $C^1$. Then, for all
$tilde(upright(bold(Sigma)))_phi in C^0 \( cal(C) times \[ 0 \, S \] \; upright(bold(M))_(2 \( n + 1 \)) \( bb(R) \) \)$
and
$tilde(bold(h)) in C^0 \( \[ 0 \, S \] \; L^2 \( accent(cal(C), circle.stroked) \; bb(R)^(2 \( n + 1 \)) \) \)$
as in Eq.~#link(<eq:Sigmaf0>)[(45)], and ICs
$bold(u)_0 in L^2 \( accent(cal(C), circle.stroked) \; bb(R)^(2 \( n + 1 \)) \)$, the
PDE~#link(<eq:quasiStationary0>)[(47)] admits a
unique mild solution
$bold(z) in C^0 \( \[ 0 \, S \] \; L^2 \( accent(cal(C), circle.stroked) \; bb(R)^(2 \( n + 1 \)) \) \)$.
Additionally, if
$tilde(upright(bold(Sigma)))_phi in C^1 \( cal(C) times \[ 0 \, S \] \; upright(bold(M))_(2 \( n + 1 \)) \( bb(R) \) \)$,
$tilde(bold(h)) in C^1 \( \[ 0 \, S \] \; L^2 \( accent(cal(C), circle.stroked) \; bb(R)^(2 \( n + 1 \)) \) \)$,
and the IC
$bold(u)_0 in H^1 \( accent(cal(C), circle.stroked) \; bb(R)^(2 \( n + 1 \)) \)$
satisfies the BC~#link(<eq:quasiStationary0>)[(47b)], the
solution is classical, that is,
$bold(u) in C^1 \( \[ 0 \, S \] \; L^2 \( accent(cal(C), circle.stroked) \; bb(R)^(2 \( n + 1 \)) \) \) inter C^0 \( \[ 0 \, S \] \; H^1 \( accent(cal(C), circle.stroked) \; bb(R)^(2 \( n + 1 \)) \) \)$
and satisfies the BC~#link(<eq:quasiStationary0>)[(47b)].]

#block[
#emph[#emph[Proof.] The result follows along the same lines as the proof
of Theorem 3.2 in \[#link(<bib-FrBDroll>)[88]\].~◻]

]
] <thm:ex2>
Some comments about the regularity of the original matrices and inputs
are as follows. Starting with~Models~#link(<stdmodel>)[1],
$upright(bold(M)) in C^0 \( bb(R)^2 \; upright(bold(S y m))_2 \( bb(R) \) \)$
ensures the existence of mild solutions for
$macron(bold(v)) in C^0 \( cal(C) times \[ 0 \, S \] \; bb(R)^2 \)$ and
$V ""_(upright(r)) in C^0 \( \[ 0 \, S \] \; \[ V ""_(upright(m i n)) \, V ""_(upright(m a x)) \] \)$.
Additionally, by composition of continuously differentiable functions,
$upright(bold(M)) in C^1 \( bb(R)^2 \; upright(bold(S y m))_2 \( bb(R) \) \)$
implies
$tilde(upright(bold(Sigma))) in C^1 \( cal(C) times \[ 0 \, S \] \; upright(bold(M))_2 \( bb(R) \) \)$
and
$tilde(bold(h)) in C^1 \( \[ 0 \, S \] \; L^2 \( accent(cal(C), circle.stroked) \; bb(R)^2 \) \)$
for all
$macron(bold(v)) in C^1 \( cal(C) times \[ 0 \, S \] \; bb(R)^2 \)$ and
$V ""_(upright(r)) in C^1 \( \[ 0 \, S \] \; \[ V ""_(upright(m i n)) \, V ""_(upright(m a x)) \] \)$.
Essentially, for the regularised version (with
$epsilon in bb(R)_(> 0)$), classical solutions are guaranteed for
sufficiently smooth slip and rolling velocities. Theorem~#link(<thm:ex2>)[4.2]
demands additionally
$bold(phi) in bb(R) times C^0 \( \[ 0 \, S \] \; bb(R) \)$ for mild
solutions, and
$bold(phi) in bb(R) times C^1 \( \[ 0 \, S \] \; bb(R) \)$ (with
regularisation parameter $epsilon in bb(R)_(> 0)$) for classical
solutions.

For~Models~#link(<stdmodel>)[1] and~3, ISS and IOS may also be proved for
all inputs
$macron(bold(v)) in C^1 \( cal(C) times bb(R)_(gt.eq 0) \; bb(R)^2 \) inter L^oo \( cal(C) times bb(R)_(gt.eq 0) \; bb(R)^2 \)$,
rolling speeds
$V ""_(upright(r)) in C^1 \( bb(R)_(gt.eq 0) \; \[ V ""_(upright(m i n)) \, V ""_(upright(m a x)) \] \)$,
spins
$bold(phi) in bb(R) times C^1 \( bb(R)_(gt.eq 0) \; bb(R) \) inter bb(R) times L^oo \( bb(R)_(gt.eq 0) \; bb(R) \)$,
and ICs $bold(u)_0 in H^1 \( accent(cal(C), circle.stroked) \; bb(R)^(2 \( n + 1 \)) \)$
satisfying the BC~#link(<eq:standard2>)[(46b)]
(resp.~#link(<eq:quasiStationary0>)[(47b)]) under the same
assumptions as Lemma 4.1 and Corollary 4.1 in \[#link(<bib-FrBDroll>)[88]\].

== Passivity
<sect:pass>
Passivity arguably constitutes the most important mathematical property
of a #emph[bona fide] friction model, as it ensures consistency with the
inherently dissipative nature of the underlying physical phenomenon. For
the rolling contact processes described by
Eqs.~#link(<eq:standard2>)[(46)]
and~#link(<eq:quasiStationary0>)[(47)], passivity
guarantees that energy is not generated during frictional rolling
contact. For the FrBD$""_(n + 1)$ models presented in this paper,
passivity is also is particularly relevant for control-oriented
simulations, as it guarantees stability when they are coupled with
mechanical systems or observers. It is worth emphasising that, in this
context, passivity should be understood as a property of the process
rather than of the friction model itself.

Owing to these preliminary considerations, the corresponding
mathematical definition, adopted from \[#link(<bib-FrBDroll>)[88]\], is given below.

#block[
#strong[Definition 4.1] (Dissipativity and passivity). #emph[The system
described by the PDE~#link(<eq:standard2>)[(46)]
(resp.~#link(<eq:quasiStationary0>)[(47)]) with
output~(33a)
(resp.~(33a)
and~#link(<eq:Malt>)[(34)]) is called #emph[dissipative] if, for
all inputs
$macron(bold(v)) in C^1 \( cal(C) times bb(R)_(gt.eq 0) \; bb(R)^2 \) inter L^oo \( cal(C) times bb(R)_(gt.eq 0) \; bb(R)^2 \)$,
rolling speeds
$V ""_(upright(r)) in \[ V ""_(upright(m i n)) \, V ""_(upright(m a x)) \]$,
spins $bold(phi) in bb(R) times { 0 }$, and ICs
$bold(u)_0 in H^1 \( accent(cal(C), circle.stroked) \; bb(R)^(2 \( n + 1 \)) \)$
satisfying the BC~#link(<eq:standard2>)[(46b)]
(resp.~#link(<eq:quasiStationary0>)[(47b)]), there exist a
supply rate
$w : L^2 \( accent(cal(C), circle.stroked) \; bb(R)^2 \) times L^2 \( accent(cal(C), circle.stroked) \; bb(R)^2 \) mapsto bb(R)$
and a storage function
$W : L^2 \( accent(cal(C), circle.stroked) \; bb(R)^(2 \( n + 1 \)) \) mapsto bb(R)_(gt.eq 0)$
such that
#math.equation(block: true, numbering: _ => [(49)], $  & integral_0^s w #scale(x: 120%, y: 120%)[\(] bold(f) \( dot.op \, s' \) \, - macron(bold(v)) ""_(upright(r)) \( dot.op \, s' \) #scale(x: 120%, y: 120%)[\)] upright(d) s' = integral_0^s w #scale(x: 120%, y: 120%)[\(] bold(f) \( dot.op \, s' \) \, - macron(bold(v)) \( dot.op \, s' \) #scale(x: 120%, y: 120%)[\)] upright(d) s' gt.eq W #scale(x: 120%, y: 120%)[\(] bold(u) \( dot.op \, s \) #scale(x: 120%, y: 120%)[\)] - W #scale(x: 120%, y: 120%)[\(] bold(u)_0 \( dot.op \) #scale(x: 120%, y: 120%)[\)] \, quad s in \[ 0 \, S \] . $) <eq:Fvres>
It is called #emph[passive] if
$w \( bold(f) \( dot.op \, s \) \, - macron(bold(v)) \( dot.op \, s \) \) = - chevron.l p \( dot.op \) bold(f) \( dot.op \, s \) \, macron(bold(v)) ""_(upright(r)) \( dot.op \, s \) chevron.r_(L^2 \( accent(cal(C), circle.stroked) \; bb(R)^2 \)) = - chevron.l p \( dot.op \) bold(f) \( dot.op \, s \) \, macron(bold(v)) \( dot.op \, s \) chevron.r_(L^2 \( accent(cal(C), circle.stroked) \; bb(R)^2 \))$.]

] <def:idss2>
The two main results of this section are formalised in
Lemmata~#link(<lemma:DissF20>)[4.1] and~#link(<lemma:DissF202>)[4.2], which consider respectively
the FrBD$""_(n + 1)$-GM and FrBD$""_(n + 1)$-GKV realisations of the
distributed friction model.

#block[
#strong[Lemma 4.1] (Passivity of the FrBD$""_(n + 1)$-GM models).
#emph[Consider the PDE~#link(<eq:standard2>)[(46)]
(resp.~#link(<eq:quasiStationary0>)[(47)]) with
$upright(bold(Sigma)) \( macron(bold(v)) ""_(upright(r)) \, s \)$ and
$upright(bold(H))$ as in Eq. #link(<eq:Hfunct>)[(27)], and
suppose that $p in C^1 \( cal(C) \; bb(R)_(gt.eq 0) \)$ satisfies
#math.equation(block: true, numbering: _ => [(50)], $ nabla_(bold(x)) dot.op p \( bold(x) \) macron(V) \( bold(x) \) lt.eq 0 \, quad bold(x) in cal(C) . $) <eq:condP>
Then, the system described by the
PDE~#link(<eq:standard2>)[(46)]
(resp.~#link(<eq:quasiStationary0>)[(47)]) with
output~(33a)
(resp.~(33a)
and~#link(<eq:Malt>)[(34)]) is passive with storage function
#math.equation(block: true, numbering: _ => [(51)], $ W #scale(x: 120%, y: 120%)[\(] bold(u) \( dot.op \, s \) #scale(x: 120%, y: 120%)[\)] ? 1 / 2 integral.double_(cal(C)) p \( bold(x) \) bold(z)^(upright(T)) \( bold(x) \, s \) macron(upright(bold(K)))_0 bold(z) \( bold(x) \, s \) upright(d) bold(x) + 1 / 2 sum_(i = 1)^n integral.double_(cal(C)) p \( bold(x) \) bold(f)_i^(upright(T)) \( bold(x) \, s \) macron(upright(bold(K)))_i^(- 1) bold(f)_i \( bold(x) \, s \) upright(d) bold(x) . $) <eq:VdissF2>]

#block[
#emph[#emph[Proof.] Differentiating
Eq.~#link(<eq:VdissF2>)[(51)] along the
dynamics~#link(<eq:standard2>)[(46a)]
or~(47a) yields
$ dot(W) #scale(x: 120%, y: 120%)[\(] bold(u) \( dot.op \, s \) #scale(x: 120%, y: 120%)[\)] & = integral.double_(cal(C)) p \( bold(x) \) #scale(x: 300%, y: 300%)[\(] bold(z)^(upright(T)) \( bold(x) \, s \) macron(upright(bold(K)))_0 + sum_(i = 1)^n bold(f)_i^(upright(T)) \( bold(x) \, s \) #scale(x: 300%, y: 300%)[\)] frac(partial bold(z) \( bold(x) \, s \), partial s) upright(d) bold(x)\
 & quad - sum_(i = 1)^n integral.double_(cal(C)) p \( bold(x) \) bold(f)_i^(upright(T)) \( bold(x) \, s \) macron(upright(bold(K)))_i^(- 1) frac(bold(tau)_i^(- 1), V ""_(upright(r))) bold(f) \( bold(x) \, s \) upright(d) bold(x) + sum_(i = 1)^n integral.double_(cal(C)) p \( bold(x) \) bold(f)_i^(upright(T)) \( bold(x) \, s \) #scale(x: 120%, y: 120%)[\(] macron(bold(V)) \( bold(x) \) dot.op nabla_(bold(x)) #scale(x: 120%, y: 120%)[\)] bold(z) \( bold(x) \, s \) upright(d) bold(x)\
 & quad - 1 / 2 sum_(i = 1)^n integral.double_(cal(C)) p \( bold(x) \) macron(bold(V)) \( bold(x) \) dot.op nabla_(bold(x)) #scale(x: 180%, y: 180%)[\(] bold(f)_i^(upright(T)) \( bold(x) \, s \) macron(upright(bold(K)))_i^(- 1) bold(f)_i \( bold(x) \, s \) #scale(x: 180%, y: 180%)[\)] upright(d) bold(x) \, quad s in \( 0 \, S \) . $
Recalling from Eq.~#link(<eq:ftot>)[(30)] that
$macron(upright(bold(K)))_0 bold(z) \( bold(x) \, s \) + sum_(i = 1)^n bold(f)_i \( bold(x) \, s \) = bold(f) \( bold(x) \, s \)$
and using~(26a) gives
#math.equation(block: true, numbering: _ => [(53)], $ dot(W) #scale(x: 120%, y: 120%)[\(] bold(u) \( dot.op \, s \) #scale(x: 120%, y: 120%)[\)] & = - #scale(x: 120%, y: 120%)[chevron.l] p \( dot.op \) bold(f) \( dot.op \, s \) \, macron(bold(v)) \( dot.op \, s \) #scale(x: 120%, y: 120%)[chevron.r]_(L^2 \( accent(cal(C), circle.stroked) \; bb(R)^2 \))\
 & quad + integral.double_(cal(C)) p \( bold(x) \) bold(f)^(upright(T)) \( bold(x) \, s \) upright(bold(Psi)) #scale(x: 120%, y: 120%)[\(] macron(bold(v)) \( bold(x) \, s \) #scale(x: 120%, y: 120%)[\)] bold(f) \( bold(x) \, s \) upright(d) bold(x) - sum_(i = 1)^n integral.double_(cal(C)) p \( bold(x) \) bold(f)_i^(upright(T)) \( bold(x) \, s \) macron(upright(bold(K)))_i^(- 1) frac(bold(tau)_i^(- 1), V ""_(upright(r))) bold(f) \( bold(x) \, s \) upright(d) bold(x)\
 & quad - 1 / 2 integral.double_(cal(C)) p \( bold(x) \) macron(bold(V)) \( bold(x) \) dot.op nabla_(bold(x)) #scale(x: 300%, y: 300%)[\(] bold(z)^(upright(T)) \( bold(x) \, s \) macron(upright(bold(K)))_0 bold(z) \( bold(x) \, s \) + sum_(i = 1)^n bold(f)_i^(upright(T)) \( bold(x) \, s \) macron(upright(bold(K)))_i^(- 1) bold(f)_i \( bold(x) \, s \) #scale(x: 300%, y: 300%)[\)] upright(d) bold(x) \, quad s in \( 0 \, S \) . $) <eq:WdotSemiFinal>
Integrating by parts the last term in
Eq.~#link(<eq:WdotSemiFinal>)[(53)] and enforcing the
BC~#link(<eq:standard2>)[(46b)]
or~#link(<eq:quasiStationary0>)[(47b)] leads then to
#math.equation(block: true, numbering: _ => [(54)], $ dot(W) #scale(x: 120%, y: 120%)[\(] bold(u) \( dot.op \, s \) #scale(x: 120%, y: 120%)[\)] & = - #scale(x: 120%, y: 120%)[chevron.l] p \( dot.op \) bold(f) \( dot.op \, s \) \, macron(bold(v)) \( dot.op \, s \) #scale(x: 120%, y: 120%)[chevron.r]_(L^2 \( accent(cal(C), circle.stroked) \; bb(R)^2 \))\
 & quad + integral.double_(cal(C)) p \( bold(x) \) bold(f)^(upright(T)) \( bold(x) \, s \) upright(bold(Psi)) #scale(x: 120%, y: 120%)[\(] macron(bold(v)) \( bold(x) \, s \) #scale(x: 120%, y: 120%)[\)] bold(f) \( bold(x) \, s \) upright(d) bold(x) - sum_(i = 1)^n integral.double_(cal(C)) p \( bold(x) \) bold(f)_i^(upright(T)) \( bold(x) \, s \) macron(upright(bold(K)))_i^(- 1) frac(bold(tau)_i^(- 1), V ""_(upright(r))) bold(f) \( bold(x) \, s \) upright(d) bold(x)\
 & quad + 1 / 2 integral.double_(cal(C)) #scale(x: 120%, y: 120%)[\(] nabla_(bold(x)) dot.op p \( bold(x) \) macron(bold(V)) \( bold(x) \) #scale(x: 120%, y: 120%)[\)] #scale(x: 300%, y: 300%)[\(] bold(z)^(upright(T)) \( bold(x) \, s \) macron(upright(bold(K)))_0 bold(z) \( bold(x) \, s \) + sum_(i = 1)^n bold(f)_i^(upright(T)) \( bold(x) \, s \) macron(upright(bold(K)))_i^(- 1) bold(f)_i \( bold(x) \, s \) #scale(x: 300%, y: 300%)[\)] upright(d) bold(x) \, quad s in \( 0 \, S \) . $) <eq:WdotFinal>
Since
$macron(upright(bold(K)))_i^(- 1) bold(tau)_i^(- 1) = macron(upright(bold(C)))_i^(- 1) succ.curly.eq upright(bold(0))$
for all $i in { 1 \, dots.h \, n }$, the second and third terms
appearing on the right-hand side of
Eq.~#link(<eq:WdotFinal>)[(54)] are negative semidefinite.
Therefore, if inequality~#link(<eq:condP>)[(50)] holds, it may
be concluded that
#math.equation(block: true, numbering: _ => [(55)], $ - #scale(x: 120%, y: 120%)[chevron.l] p \( dot.op \) bold(f) \( dot.op \, s \) \, macron(bold(v)) \( dot.op \, s \) #scale(x: 120%, y: 120%)[chevron.r]_(L^2 \( accent(cal(C), circle.stroked) \; bb(R)^2 \)) gt.eq dot(W) #scale(x: 120%, y: 120%)[\(] bold(u) \( dot.op \, s \) #scale(x: 120%, y: 120%)[\)] \, quad s in \( 0 \, S \) . $) <eq:w03>
Finally, integrating the above Eq.~#link(<eq:w03>)[(55)]
proves~#link(<eq:Fvres>)[(49)] with
$w \( bold(f) \( dot.op \, s \) \, - macron(bold(v)) \( dot.op \, s \) \) = - chevron.l p \( dot.op \) bold(f) \( dot.op \, s \) \, macron(bold(v)) ""_(upright(r)) \( dot.op \, s \) chevron.r_(L^2 \( accent(cal(C), circle.stroked) \; bb(R)^2 \)) = - chevron.l p \( dot.op \) bold(f) \( dot.op \, s \) \, macron(bold(v)) \( dot.op \, s \) chevron.r_(L^2 \( accent(cal(C), circle.stroked) \; bb(R)^2 \))$.~◻]

]
] <lemma:DissF20>
#block[
#strong[Lemma 4.2] (Passivity of the FrBD$""_(n + 1)$-GKV models).
#emph[Consider the PDE~#link(<eq:standard2>)[(46)]
(resp.~#link(<eq:quasiStationary0>)[(47)]) with
$upright(bold(Sigma)) \( macron(bold(v)) ""_(upright(r)) \, s \)$ and
$upright(bold(H))$ as in Eq. #link(<eq:Hfunct2>)[(28)], and
suppose that $p in C^1 \( cal(C) \; bb(R)_(gt.eq 0) \)$
satisfies~#link(<eq:condP>)[(50)]. Then, the system described by
the PDE~#link(<eq:standard2>)[(46)]
(resp.~#link(<eq:quasiStationary0>)[(47)]) with
output~(33a)
(resp.~(33a)
and~#link(<eq:Malt>)[(34)]) is passive with storage function
#math.equation(block: true, numbering: _ => [(56)], $ W #scale(x: 120%, y: 120%)[\(] bold(u) \( dot.op \, s \) #scale(x: 120%, y: 120%)[\)] & ? 1 / 2 integral.double_(cal(C)) p \( bold(x) \) #scale(x: 300%, y: 300%)[\(] bold(z) \( bold(x) \, s \) - sum_(i = 1)^n bold(z)_i \( bold(x) \, s \) #scale(x: 300%, y: 300%)[\)]^(upright(T)) macron(upright(bold(K)))_0 #scale(x: 300%, y: 300%)[\(] bold(z) \( bold(x) \, s \) - sum_(i = 1)^n bold(z)_i \( bold(x) \, s \) #scale(x: 300%, y: 300%)[\)] upright(d) bold(x)\
 & quad + 1 / 2 sum_(i = 1)^n integral.double_(cal(C)) p \( bold(x) \) bold(f)_i^(upright(T)) \( bold(x) \, s \) macron(upright(bold(K)))_i^(- 1) bold(f)_i \( bold(x) \, s \) upright(d) bold(x) . $) <eq:VdissF23>]

#block[
#emph[#emph[Proof.] To prove the result, it is convenient to introduce
the auxiliary state
$bb(R)^2 in.rev bold(z)_0 \( bold(x) \, s \) ? bold(z) \( bold(x) \, s \) - sum_(i = 1)^n bold(z)_i \( bold(x) \, s \)$,
so that
$bold(f) \( bold(x) \, s \) = macron(upright(bold(K)))_0 bold(z)_0 \( bold(x) \, s \)$.
Furthermore, the dynamics of $bold(z)_0 \( bold(x) \, s \)$ is governed
by
$  & frac(partial bold(z)_0 \( bold(x) \, s \), partial s) + #scale(x: 120%, y: 120%)[\(] macron(bold(V)) \( bold(x) \, s \) dot.op nabla_(bold(x)) #scale(x: 120%, y: 120%)[\)] bold(z)_0 \( bold(x) \, s \) = upright(bold(Psi)) #scale(x: 120%, y: 120%)[\(] macron(bold(v)) \( bold(x) \, s \) #scale(x: 120%, y: 120%)[\)] macron(upright(bold(K)))_0 bold(z)_0 \( bold(x) \, s \)\
 & #h(16em) - sum_(i = 1)^n frac(upright(d) bold(z)_i \( bold(x) \, s \), upright(d) s) - macron(bold(v)) \( bold(x) \, s \) \, quad \( bold(x) \, s \) in accent(cal(C), circle.stroked) times \( 0 \, S \) \,\
 & bold(z)_0 \( bold(x) \, s \) = bold(0) \, quad \( bold(x) \, s \) in cal(L) times \( 0 \, S \) \,\
 & bold(z)_0 \( bold(x) \, 0 \) = bold(z)_(0 \, 0) \( bold(x) \) \, quad bold(x) in accent(cal(C), circle.stroked) . $
Accordingly, differentiating Eq.~#link(<eq:VdissF2>)[(51)]
along the dynamics~#link(<eq:standard2>)[(46a)]
or~(47a) yields
#math.equation(block: true, numbering: _ => [(58)], $ dot(W) #scale(x: 120%, y: 120%)[\(] bold(u) \( dot.op \, s \) #scale(x: 120%, y: 120%)[\)] & = - #scale(x: 120%, y: 120%)[chevron.l] p \( dot.op \) bold(f) \( dot.op \, s \) \, macron(bold(v)) \( dot.op \, s \) #scale(x: 120%, y: 120%)[chevron.r]_(L^2 \( accent(cal(C), circle.stroked) \; bb(R)^2 \)) + integral.double_(cal(C)) p \( bold(x) \) bold(z)_0^(upright(T)) \( bold(x) \, s \) macron(upright(bold(K)))_0 upright(bold(Psi)) #scale(x: 120%, y: 120%)[\(] macron(bold(v)) \( bold(x) \, s \) #scale(x: 120%, y: 120%)[\)] macron(upright(bold(K)))_0 bold(z)_0 \( bold(x) \, s \) upright(d) bold(x)\
 & quad - sum_(i = 1)^n integral.double_(cal(C)) p \( bold(x) \) bold(z)_0^(upright(T)) \( bold(x) \, s \) macron(upright(bold(K)))_0 frac(upright(d) bold(z)_i \( bold(x) \, s \), upright(d) s) upright(d) bold(x)\
 & quad + sum_(i = 1)^n integral.double_(cal(C)) p \( bold(x) \) #scale(x: 240%, y: 240%)[\(] macron(upright(bold(K)))_0 bold(z)_0 - V ""_(upright(r)) macron(upright(bold(C)))_i frac(upright(d) bold(z)_i \( bold(x) \, s \), upright(d) s) #scale(x: 240%, y: 240%)[\)]^(upright(T)) frac(upright(d) bold(z)_i \( bold(x) \, s \), upright(d) s) upright(d) bold(x)\
 & quad - 1 / 2 sum_(i = 0)^n integral.double_(cal(C)) p \( bold(x) \) macron(bold(V)) \( bold(x) \) dot.op nabla_(bold(x)) #scale(x: 180%, y: 180%)[\(] bold(z)_i^(upright(T)) \( bold(x) \, s \) macron(upright(bold(K)))_i bold(z)_i \( bold(x) \, s \) #scale(x: 180%, y: 180%)[\)] upright(d) bold(x) \, quad s in \( 0 \, S \) . $) <eq:WKVS>
Integrating by parts the last term in Eq. #link(<eq:WKVS>)[(58)]
and enforcing the BC~#link(<eq:standard2>)[(46b)]
or~#link(<eq:quasiStationary0>)[(47b)] produces
#math.equation(block: true, numbering: _ => [(59)], $ dot(W) #scale(x: 120%, y: 120%)[\(] bold(u) \( dot.op \, s \) #scale(x: 120%, y: 120%)[\)] & = - #scale(x: 120%, y: 120%)[chevron.l] p \( dot.op \) bold(f) \( dot.op \, s \) \, macron(bold(v)) \( dot.op \, s \) #scale(x: 120%, y: 120%)[chevron.r]_(L^2 \( accent(cal(C), circle.stroked) \; bb(R)^2 \)) + integral.double_(cal(C)) p \( bold(x) \) bold(z)_0^(upright(T)) \( bold(x) \, s \) macron(upright(bold(K)))_0 upright(bold(Psi)) #scale(x: 120%, y: 120%)[\(] macron(bold(v)) \( bold(x) \, s \) #scale(x: 120%, y: 120%)[\)] macron(upright(bold(K)))_0 bold(z)_0 \( bold(x) \, s \) upright(d) bold(x)\
 & quad - sum_(i = 1)^n integral.double_(cal(C)) p \( bold(x) \) V ""_(upright(r)) frac(upright(d) bold(z)_i^(upright(T)) \( bold(x) \, s \), upright(d) s) macron(upright(bold(C)))_i frac(upright(d) bold(z)_i \( bold(x) \, s \), upright(d) s) upright(d) bold(x)\
 & quad + 1 / 2 sum_(i = 0)^n integral.double_(cal(C)) #scale(x: 120%, y: 120%)[\(] nabla_(bold(x)) dot.op p \( bold(x) \) macron(bold(V)) \( bold(x) \) #scale(x: 120%, y: 120%)[\)] bold(z)_i^(upright(T)) \( bold(x) \, s \) macron(upright(bold(K)))_i bold(z)_i \( bold(x) \, s \) upright(d) bold(x) \, quad s in \( 0 \, S \) . $) <eq:WKVS2>
The second and third terms appearing on the right-hand side of
Eq.~#link(<eq:WKVS2>)[(59)] are always negative semidefinite.
Therefore, if the condition~#link(<eq:condP>)[(50)] is
satisfied, it may be concluded that an inequality formally identical
to~#link(<eq:w03>)[(55)] holds. Hence, the result follows from
similar arguments as in the proof of Lemma~#link(<lemma:DissF20>)[4.1].~◻]

]
] <lemma:DissF202>
Lemmata~#link(<lemma:DissF20>)[4.1] and~#link(<lemma:DissF202>)[4.2] yields passivity for
virtually all meaningful parametrisations of~Models~#link(<stdmodel>)[1]
and~3, concerning both the FrBD$""_(n + 1)$-GM and
FrBD$""_(n + 1)$-GKV realisations. Some additional remarks are collected
below.

#block[
#strong[Remark 4.1]. #emph[The inequality in
Eq.~#link(<eq:condP>)[(50)] is the same as that in Lemma 4.2 of
\[#link(<bib-FrBDroll>)[88]\], and is obviously satisfied when the pressure distribution is
constant (for~Models~#link(<stdmodel>)[1], distributions decreasing along the
rolling direction also verify Eq.~#link(<eq:condP>)[(50)]
strictly). For viscoelastic materials, contact pressures decreasing
along the rolling direction can be explained by considering
non-interpenetration constraints. In the literature, spatially varying
pressure profiles fulfilling~#link(<eq:condP>)[(50)] are also
employed to reproduce the sign reversal of the steady-state vertical
moment at large lateral slips. Essentially, provided that the pressure
distribution evolves moderately along the contact area, the rolling
process inherits passivity properties from those of the Maxwell and
Kelvin-Voigt elements, which are intrinsically dissipative.]

]
#block[
#strong[Remark 4.2]. #emph[If
$p \( bold(x) \) gt.eq p ""_(upright(m i n))$ and
$nabla_(bold(x)) dot.op p \( bold(x) \) macron(bold(V)) \( bold(x) \) lt.eq - gamma$,
with $p ""_(upright(m i n)) \, gamma in bb(R)_(> 0)$, for all
$bold(x) in cal(C)$, then the storage functions
$W \( bold(u) \( dot.op \, s \) \)$ in
Eqs.~#link(<eq:VdissF2>)[(51)]
and~#link(<eq:VdissF23>)[(56)] are indeed a Lyapunov
functions, and ensures ISS for the
PDEs~#link(<eq:standard2>)[(46)]
and~#link(<eq:quasiStationary0>)[(47)]. In this
context, it is worth observing that, for $n = 0$, the storage
functions~#link(<eq:VdissF2>)[(51)]
and~#link(<eq:VdissF23>)[(56)] reduce to that obtained for
the FrBD$""_1$-KV model introduced in \[#link(<bib-FrBDroll>)[88]\].]

]
#block[
#strong[Remark 4.3]. #emph[For simplicity, Lemmata~#link(<lemma:DissF20>)[4.1]
and~#link(<lemma:DissF202>)[4.2] were proven only for classical solutions
($epsilon in bb(R)_(> 0)$ in~#link(<eq:standard2>)[(46)]
and~#link(<eq:quasiStationary0>)[(47)]); as mentioned
in \[#link(<bib-FrBDroll>)[88]\], the extension to mild solutions obtained for
$epsilon in bb(R)_(gt.eq 0)$ may be established by invoking density and
convergence arguments.]

]
= Numerical simulations
<sect:numer>
In the following, FrBD$""_2$-GM and
FrBD$""_3$-GM~Models~#link(<stdmodel>)[1],~2, and~Models~#link(<linmodel2>)[3] are
numerically simulated and compared to the corresponding FrBD$""_1$-KV
versions concerning both their steady-state and transient behaviours.
More specifically, Sect.~#link(<sect:SS>)[5.1] is dedicated to steady rolling
contact, whereas unstationary phenomena are investigated in
Sect.~#link(<sect:transient>)[5.2]. As discussed in Appendix~#link(<app:alt>)[B], the
FrBD$""_2$-GM models correspond directly to a Standard Linear Solid
element, for which the interconversion to an equivalent FrBD$""_2$-KV
parametrisations is available analytically. In the remainder of the
paper, the GM formulation is preferred because it is more widely used in
the literature, and also because yields a more intuitive state-space
reformulation for the FrBD$""_2$-SLS dynamics (see Appendix #link(<app:alt>)[B]).
Additional implementational and computational details may be found in
\[#link(<bib-FrBDroll>)[88]\].

== Steady-state behaviour
<sect:SS>
Due to the distributed nature of the rolling contact process, the
relaxation phenomena introduced by viscoelastic components in
higher-order rheological representations of the bristle element are not
limited to transient regimes, but manifest even under steady-state
conditions. Indeed, as suggested already by
Eq.~#link(<eq:condP>)[(50)], structural damping acts also
spatially, contributing to energy dissipation as the system's dynamics
evolves along the rolling direction. It is therefore of interest to
investigate how more refined viscoelastic descriptions of the bristle
dynamics affect the so-called #emph[force-slip surfaces], namely the
mapping
$\( hat(bold(F))_(bold(x)) \, hat(M)_z \) : bb(R)^4 mapsto bb(R)^3$
given by
$ bold(F)_(bold(x)) & = hat(bold(F))_(bold(x)) \( bold(sigma) \, bold(phi) \) \,\
M_z & = hat(M)_z \( bold(sigma) \, bold(phi) \) . $ In the absence of
spin ($bold(phi) = bold(0)$), the main characteristics obtained for
rectangular and elliptical contact areas with parabolic pressure
distributions, and using the model parameters listed in
Table~#link(<tab:parameters>)[1], are shown in Figs.~#link(<fig:GoughRect>)[4]
and~#link(<fig:GoughEll>)[5]. Assuming isotropic friction, the matrix
$upright(bold(M)) \( bold(v) ""_(upright(s)) \)$ was modelled as
$upright(bold(M)) \( bold(v) ""_(upright(s)) \) = mu \( bold(v) ""_(upright(s)) \) upright(bold(I))_2$,
with
#math.equation(block: true, numbering: _ => [(61)], $ mu \( bold(v) ""_(upright(s)) \) = mu ""_(upright(d)) + \( mu ""_(upright(s)) - mu ""_(upright(d)) \) exp #scale(x: 300%, y: 300%)[\(] - #scale(x: 240%, y: 240%)[\(] frac(∥bold(v) ""_(upright(s))∥_2, v ""_(upright(S))) #scale(x: 240%, y: 240%)[\)]^(delta ""_(upright(S))) #scale(x: 300%, y: 300%)[\)] + mu ""_(upright(v)) \( bold(v) ""_(upright(s)) \) \, $) <eq:muExample>
where $mu ""_(upright(s)) \, mu ""_(upright(d)) in bb(R)_(> 0)$ denote
the static and dynamic friction coefficients,
$v ""_(upright(S)) in bb(R)_(> 0)$ the Stribeck velocity,
$delta ""_(upright(S)) in bb(R)_(gt.eq 0)$ the Stribeck exponent, and
$mu ""_(upright(v)) : bb(R)^2 mapsto bb(R)_(gt.eq 0)$ captures the
viscous friction.

Compared with the FrBD$""_1$-KV formulation employed in \[#link(<bib-FrBDroll>)[88]\],
inspection of Figs.~#link(<fig:GoughRect>)[4] and~#link(<fig:GoughEll>)[5] indicates that the
additional relaxation effects introduced by the FrBD$""_2$-GM and
FrBD$""_3$-GM models tend to attenuate both the tangential forces and
moments, yielding trends of slightly lower magnitude. The effect is
particularly evident in the vertical moment, for both rectangular and
elliptical contact areas. These conclusions remain valid when
considering the presence of large spin slips, as illustrated in
Figs.~#link(<fig:GoughRect>)[4] and~#link(<fig:GoughEll>)[5].

#figure(image("figures/GoughRect_GM.svg", width: 100.0%),
  caption: [
    Steady-state characteristics in the absence of spin slips predicted
    using Models~#link(<semilinmodel>)[2] (rectangular contact area with parabolic
    pressure distribution). Line styles: FrBD$""_1$-KV from \[#link(<bib-FrBDroll>)[88]\]
    (solid thick lines), FrBD$""_2$-GM (solid lines), FrBD$""_3$-GM
    (dashed lines). Model parameters as in Table~#link(<tab:parameters>)[1].
  ]
)
<fig:GoughRect>

#figure(image("figures/GoughEll_GM.svg", width: 100.0%),
  caption: [
    Steady-state characteristics in the absence of spin slips predicted
    using Models~#link(<semilinmodel>)[2] (elliptical contact area with parabolic
    pressure distribution). Line styles: FrBD$""_1$-KV from \[#link(<bib-FrBDroll>)[88]\]
    (solid thick lines), FrBD$""_2$-GM (solid lines), FrBD$""_3$-GM
    (dashed lines). Model parameters as in Table~#link(<tab:parameters>)[1].
  ]
)
<fig:GoughEll>

#figure(image("figures/RectLargeSpins_GM.svg", width: 100.0%),
  caption: [
    Steady-state characteristics in the presence of large spin slips
    predicted using Models~#link(<semilinmodel>)[2] (rectangular contact area with
    parabolic pressure distribution): (a) $bold(phi) = \( 3 \, 0 \)$\;
    (b) $bold(phi) = \( 0 \, 3 \)$. Line styles: FrBD$""_1$-KV from
    \[#link(<bib-FrBDroll>)[88]\] (solid thick lines), FrBD$""_2$-GM (solid lines),
    FrBD$""_3$-GM (dashed lines). Model parameters as in
    Table~#link(<tab:parameters>)[1].
  ]
)
<fig:RectSpins>

#figure(image("figures/EllLargeSpins_GM.svg", width: 100.0%),
  caption: [
    Steady-state characteristics in the presence of large spin slips
    predicted using Models~#link(<semilinmodel>)[2] (elliptical contact area with
    parabolic pressure distribution): (a) $bold(phi) = \( 3 \, 0 \)$\;
    (b) $bold(phi) = \( 0 \, 3 \)$. Line styles: FrBD$""_1$-KV from
    \[#link(<bib-FrBDroll>)[88]\] (solid thick lines), FrBD$""_2$-GM (solid lines),
    FrBD$""_3$-GM (dashed lines). Model parameters as in
    Table~#link(<tab:parameters>)[1].
  ]
)
<fig:EllSpins>

#block[
#figure(
  align(center)[#table(
    columns: 4,
    align: (center,left,center,center,),
    table.header([Parameter], [Description], [Unit], [Value],),
    table.hline(),
    [$a$], [Contact area semilength], [m], [0.075],
    [$b$], [Contact area semiwidth], [m], [0.05],
    [$macron(k)_(0 x)$], [Longitudinal micro-stiffness (0th
    branch)], [$upright(m)^(- 1)$], [240],
    [$macron(k)_(0 y)$], [Lateral micro-stiffness (0th
    branch)], [$upright(m)^(- 1)$], [240],
    [$macron(k)_(1 x)$], [Longitudinal micro-stiffness (1st
    branch)], [$upright(m)^(- 1)$], [240],
    [$macron(k)_(1 y)$], [Lateral micro-stiffness (1st
    branch)], [$upright(m)^(- 1)$], [240],
    [$macron(k)_(2 x)$], [Longitudinal micro-stiffness (2nd
    branch)], [$upright(m)^(- 1)$], [260],
    [$macron(k)_(2 y)$], [Lateral micro-stiffness (2nd
    branch)], [$upright(m)^(- 1)$], [260],
    [$tau_(1 x)$], [Longitudinal relaxation time (1st
    branch)], [s], [0.1],
    [$tau_(1 y)$], [Lateral relaxation time (1st branch)], [s], [0.1],
    [$tau_(2 x)$], [Longitudinal relaxation time (2nd
    branch)], [s], [0.05],
    [$tau_(2 y)$], [Lateral relaxation time (2nd branch)], [s], [0.05],
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
  , caption: [Model parameters. Matrices $macron(upright(bold(K)))_0$,
  $macron(upright(bold(K)))_1$, $macron(upright(bold(K)))_2$,
  $bold(tau)_1$, and $bold(tau)_2$ as in
  Eq.~#link(<eq:Sigmas2>)[(4)]\;
  $upright(bold(M)) \( bold(y) \) = mu \( bold(y) \) upright(bold(I))_2$
  with $mu \( bold(y) \)$ as in
  Eq.~#link(<eq:muExample>)[(61)]]
  , kind: table
  )

]
<tab:parameters>

== Transient behaviour
<sect:transient>
Relaxation phenomena play a critical role in rolling contact. In tyre
dynamics, for instance, relaxation effects associated with the local
evolution of stresses and deformations within the contact patch can
trigger unstable behaviours in road vehicles, as confirmed both
theoretically and experimentally in a robust body of literature
\[#link(<bib-Takacs1>)[108], #link(<bib-Takacs2>)[109], #link(<bib-Takacs3>)[110], #link(<bib-Takacs4>)[111], #link(<bib-Takacs5>)[112], #link(<bib-BicyclePDE>)[113], #link(<bib-SemilinearV>)[114]\].

In tyres, relaxation arises from three main sources: (i) flexibility of
secondary structural components, such as the carcass and sidewall
\[#link(<bib-Higuchi2>)[115], #link(<bib-Rill1>)[116], #link(<bib-PAC>)[117]\]\; (ii) microscopic transient phenomena, which
produce dynamics akin to finite-time delays
\[#link(<bib-USB>)[64], #link(<bib-Meccanica2>)[65], #link(<bib-SphericalWheel>)[66], #link(<bib-FrBDroll>)[88]\]\; and (iii) polymeric
dissipation, effectively captured by higher-order rheological elements
such as those considered in this manuscript. The following qualitative
analysis focuses on the latter, examining how refined descriptions of
the bristle dynamics affect the unsteady behaviour of rolling contact
forces and moments. For simplicity, the discussion is restricted to
translational slip inputs, as spin slips have only marginal influence
upon the general transient dynamics \[#link(<bib-FrBDroll>)[88]\].

First, the system's response to a step input in the rigid relative
velocity is considered. Figure~#link(<fig:trans1>)[8], produced using
Models~#link(<stdmodel>)[1] in line contact, illustrates the tangential forces and
vertical moment for a step slip input
$bold(sigma) = \( 0.08 \, 0.16 \)$. The FrBD$""_1$-KV model (solid thick
lines) exhibits a response closely resembling a first-order system in
all characteristics. In contrast, the higher-order FrBD$""_2$-GM and
FrBD$""_3$-GM models (solid and dashed lines) display richer dynamics,
including an initial overshoot characteristic of nonlinear systems.
Notably, whilst the FrBD$""_1$-KV formulation predicts convergence of
the forces and moment to their steady-state values for $s lt.eq 0.1$ m,
the refined models require approximately $s = 0.3$ m. This highlights
the significant role of hysteretic damping in shaping the transient
response of rolling contact elements, including pneumatic and
non-pneumatic tyres.

Additional simulations were conducted to investigate the rolling contact
system's response to a sinusoidal slip input, generally modelled as
#math.equation(block: true, numbering: _ => [(62)], $ bold(sigma) \( s \) = macron(bold(sigma)) #scale(x: 120%, y: 120%)[\[] 1 + 0.5 sin \( omega_1 s \) + 0.25 sin \( omega_2 s \) #scale(x: 120%, y: 120%)[\]] \, quad s in \[ 0 \, S \] . $) <eq:sigmaSIn>
Figures~#link(<fig:trans2>)[9] and~#link(<fig:trans3>)[10] visualise the tangential forces and
vertical moment for $macron(bold(sigma)) = \( 0.04 \, 0.08 \)$ and
$\( omega_1 \, omega_2 \) = \( 50 \, 0 \)$,
$\( omega_1 \, omega_2 \) = \( 50 \, 100 \)$ $upright(m)^(- 1)$,
respectively. The trends confirm the previous analysis: whilst the
simplest model reproduces the input oscillations almost immediately, the
more sophisticated FrBD$""_2$-GM and FrBD$""_3$-GM introduce additional
delay effects that are not adequately captured by standard rheological
representations. This discrepancy is particularly pronounced for the
vertical moment, which is consistent with the observations reported in
Sect.~#link(<sect:SS>)[5.1].

#figure(image("figures/transientStep_Comp.svg", width: 90.0%),
  caption: [
    Transient characteristics predicted by~Models~#link(<stdmodel>)[1] for a step
    slip input $bold(sigma) = \( 0.08 \, 0.16 \)$ in the absence of spin
    (line contact with parabolic pressure distribution). Line styles:
    FrBD$""_1$-KV from \[#link(<bib-FrBDroll>)[88]\] (solid thick lines), FrBD$""_2$-GM
    (solid lines), FrBD$""_3$-GM (dashed lines). Model parameters as in
    Table~#link(<tab:parameters>)[1].
  ]
)
<fig:trans1>

#figure(image("figures/transientOmega50_Comp.svg", width: 90.0%),
  caption: [
    Transient forces predicted by~Models~#link(<linmodel2>)[3] for a sinusoidal
    slip input as in Eq.~#link(<eq:sigmaSIn>)[(62)], with
    $bold(sigma) = \( 0.04 \, 0.08 \)$ and
    $\( omega_1 \, omega_2 \) = \( 50 \, 0 \)$ $upright(m)^(- 1)$ (line
    contact with parabolic pressure distribution). Line styles:
    FrBD$""_1$-KV from \[#link(<bib-FrBDroll>)[88]\] (solid thick lines), FrBD$""_2$-GM
    (solid lines), FrBD$""_3$-GM (dashed lines). Model parameters as in
    Table~#link(<tab:parameters>)[1].
  ]
)
<fig:trans2>

#figure(image("figures/transientOmega100_Comp.svg", width: 90.0%),
  caption: [
    Transient forces predicted by~Models~#link(<linmodel2>)[3] for a sinusoidal
    slip input as in Eq.~#link(<eq:sigmaSIn>)[(62)], with
    $bold(sigma) = \( 0.04 \, 0.08 \)$ and
    $\( omega_1 \, omega_2 \) = \( 50 \, 100 \)$ $upright(m)^(- 1)$
    (line contact with parabolic pressure distribution). Line styles:
    FrBD$""_1$-KV from \[#link(<bib-FrBDroll>)[88]\] (solid thick lines), FrBD$""_2$-GM
    (solid lines), FrBD$""_3$-GM (dashed lines). Model parameters as in
    Table~#link(<tab:parameters>)[1].
  ]
)
<fig:trans3>

= Conclusions
<sect:conclusion>
The present paper significantly extended the recently developed rFrBD
framework, providing a unified and systematic treatment of viscoelastic
rolling contact. This was achieved by integrating the two most advanced
rheological descriptions of viscoelastic solids available within the
classical derivatives framework: the Generalised Maxwell (GM) and
Generalised Kelvin-Voigt (GKV) models. By combining standard elements in
series or parallel, these representations can accurately capture complex
multi-frequency relaxation behaviours that simpler models are unable to
reproduce.

The resulting FrBD models, renamed FrBD$""_(n + 1)$, were formulated as
systems of $2 \( n + 1 \)$ hyperbolic PDEs, describing the distributed
evolution of total bristle deflection, friction force, and internal
stress and deformation variables. This formulation enables realistic
representation of spatially varying phenomena in the contact region,
incorporating local kinematics, transport effects, and spin. Following
\[#link(<bib-FrBDroll>)[88]\], three model variants of increasing complexity, accounting for
different levels of spin excitation, were derived from both the GM- and
GKV-based formulations. The linear versions were analysed with respect
to key mathematical properties, including well-posedness and passivity.
Notably, it was shown that the transition from linear differential
rheological models to the corresponding frictional PDEs preserves
passivity for virtually any physically meaningful parameterisation. This
not only guarantees the passivity of the rolling contact process but
also corroborates the theoretical soundness of the developed friction
models, which are always consistent with the physical reality.

The theoretical developments of this work were complemented by numerical
simulations that illustrated the influence of higher-order rheological
descriptions and their associated relaxation effects on both
steady-state and transient behaviours. In particular, it was
qualitatively demonstrated that the hysteretic phenomena introduced by
dissipative components correctly accounted for by GM and GKV models can
significantly affect rolling dynamics even in steady state, since the
structural damping contributions act across both time and space. The
trend of the generated vertical moment appears to be especially
influenced by these internal relaxation effects, demanding the adoption
of refined viscoelastic descriptions. Moreover, relaxation processes
distributed over multiple time scales seem to excite dynamical responses
that are typical of nonlinear systems. Higher-order viscoelastic
dynamics may thus be expected to influence the stability and transient
behaviour of interconnected mechanical systems -- including road and
railway vehicles -- where rolling contact is a key interaction
mechanism.

Finally, it should be emphasised that the models presented in this paper
are exclusively based on classical derivative rheological descriptions.
Recent studies have shown that fractional-derivative models can
successfully capture viscoelasticity with fewer parameters. Future work
may therefore focus on deriving more sophisticated formulations that
combine PDEs with fractional ODEs, providing physically and
thermodynamically consistent descriptions of viscoelastic rolling
contact.

#heading(level: 1, numbering: none)[Funding declaration]
<funding-declaration>
This research was financially supported by the project FASTEST (Reg. no.
2023-06511), funded by the Swedish Research Council.

#heading(level: 1, numbering: none)[Compliance with Ethical Standards]
<compliance-with-ethical-standards>
The authors declare that they have no conflict of interest.

#heading(level: 1, numbering: none)[Author Contribution declaration]
<author-contribution-declaration>
L.R. is the sole author and contributor to the manuscript.

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

#block(above: .45em, below: .45em)[\[30\] Bentall R, Johnson K. Slip in the rolling contact of two dissimilar

elastic rollers. Int J Mech Sci 9:389-404 (1967).] <bib-Bentall>

#block(above: .45em, below: .45em)[\[31\] Nowell D, Hills D. Tractive rolling of dissimilar elastic cylinders. Int

J Mech Sci 30:427-39 (1988).] <bib-Nowell>

#block(above: .45em, below: .45em)[\[32\] Kalker JJ. Transient phenomena in two elastic cylinders rolling over

each other with dry friction. J Appl Mech 37(3):677--688 (1970).

Available from: #link("https://doi.org/10.1115/1.3408597").] <bib-Kalker51>

#block(above: .45em, below: .45em)[\[33\] Kalker JJ. Transient rolling contact phenomena. ASLE Trans

14(3):177--184 (1971). Available from:

#link("https://doi.org/10.1080/05698197108983240").] <bib-Kalker5>

#block(above: .45em, below: .45em)[\[34\] Kalker JJ. On the Rolling Contact of Two Elastic Bodies in the Presence

of Dry Friction. PhD thesis, TH Delft (1967).] <bib-KalkerPhD>

#block(above: .45em, below: .45em)[\[35\] Hunter SC. The rolling contact of a rigid cylinder with a viscoelastic

half space. Trans. ASME, Ser. E, J. Appl. Mech. 28:611--617 (1961).] <bib-Hunter>

#block(above: .45em, below: .45em)[\[36\] Goryacheva I. Contact problem of rolling of a viscoelastic cylinder on a

base of the same material. J. Appl. Math. Mech. 37(5), 925933 (1973).

Available from: #link("https://doi.org/10.1016/0021-8928(73)90017-8")] <bib-GoryachevaP>

#block(above: .45em, below: .45em)[\[37\] Panek C, Kalker JJ. Three-dimensional Contact of a Rigid Roller

Traversing a Viscoelastic Half Space. J. Inst. Maths Applies 26:299-313

(1980).] <bib-Panek1>

#block(above: .45em, below: .45em)[\[38\] Kalker JJ. Viscoelastic Multilayered Cylinders Rolling With Dry

Friction. ASME. J. Appl. Mech. September 58(3):666--679 (1991).

Available from: #link("https://doi.org/10.1115/1.2897247")] <bib-Panek2>

#block(above: .45em, below: .45em)[\[39\] Johnson KL. Contact Mechanics. Cambridge University Press (1985).

Available from: #link("https://doi.org/10.1017/CBO9781139171731").] <bib-Johnson>

#block(above: .45em, below: .45em)[\[40\] Goryacheva IG. Contact Mechanics in Tribology. Springer (1998).] <bib-Goryacheva>

#block(above: .45em, below: .45em)[\[41\] Barber JR. Contact Mechanics. Springer (2018). Available from:

#link("https://doi.org/10.1007/978-3-319-70939-0").] <bib-Barber>

#block(above: .45em, below: .45em)[\[42\] Vollebregt EAH. User Guide for CONTACT. Technical report TR09-03

(version 13).] <bib-Vollebregt1>

#block(above: .45em, below: .45em)[\[43\] Vollebregt EAH, Wilders P. FASTSIM2: a second-order accurate frictional

rolling contact algorithm. Comput Mech 47:105--116 (2011). Available

from: #link("https://doi.org/10.1007/s00466-010-0536-7").] <bib-Vollebregt2>

#block(above: .45em, below: .45em)[\[44\] Vollebregt EAH, Iwnicki SD, Xie G, Shackelton P. Assessing the accuracy

of simplified frictional rolling contact algorithms. Veh Syst Dyn

50(1):1--17 (2012). Available from:

#link("https://doi.org/10.1080/00423114.2011.552618").] <bib-Vollebregt3>

#block(above: .45em, below: .45em)[\[45\] Vollebregt EAH. Numerical modeling of measured railway creep--force

curves with CONTACT. Wear 314:87--95 (2014). Available from:

#link("https://doi.org/10.1016/j.wear.2013.11.030").] <bib-Vollebregt4>

#block(above: .45em, below: .45em)[\[46\] Nielsen JB. New Developments in the Theory of Wheel/Rail Contact

Mechanics. PhD thesis, Technical University of Denmark (1998). Available

from:

#link("https://orbit.dtu.dk/en/publications/new-developments-in-the-theory-of-wheelrail-contact-mechanics").] <bib-Nielsen>

#block(above: .45em, below: .45em)[\[47\] Dahlberg J, Alfredsson B. Transient rolling of cylindrical contacts with

constant and linearly increasing applied slip. Wear 266:316--326 (2009).

Available from: #link("https://doi.org/10.1016/j.wear.2008.07.008").] <bib-Alfredsson>

#block(above: .45em, below: .45em)[\[48\] Goryacheva IG. Contact Mechanics in Tribology. 1st ed. Springer

Dordrecht (2010). Available from:

#link("https://doi.org/10.1007/978-94-015-9048-8").] <bib-GoryachevaBook>

#block(above: .45em, below: .45em)[\[49\] Goryacheva I, Sadeghi F. Contact characteristics of a rolling/sliding

cylinder and a viscoelastic layer bonded to an elastic substrate. Wear

184(2):125-132 (1995). Available from:

#link("https://doi.org/10.1016/0043-1648(94)06561-6").] <bib-Goryacheva4>

#block(above: .45em, below: .45em)[\[50\] Goryacheva IG, Yakovenko AA: Indentation of a rigid cylinder with a flat

rough base into a thin viscoelastic layer. J. Appl. Mech. Tech. Phys.,

62(5):723--735 (2021).] <bib-Goryacheva1>

#block(above: .45em, below: .45em)[\[51\] Goryacheva IG, Gubenko MM, Makhovskaya YY. Sliding of a spherical

indenter on a viscoelastic foundation with the forces of molecular

attraction taken into account. Prikl. J. Appl. Mech. Tech. Phys.,

55(1):81--88 (2014).] <bib-Goryacheva2>

#block(above: .45em, below: .45em)[\[52\] Güler MA, Alinia Y, Adibnazari S. On the rolling contact problem of two

elastic solids with graded coatings. Int J Mech Sci 64:62-81 (2012).] <bib-Guler>

#block(above: .45em, below: .45em)[\[53\] Juliá JM, Rodríguez-Tembleque L. Subsurface stress evolution under

orthotropic wear and frictional contact conditions. Int J Mech Sci

234:107695 (2022).] <bib-Julia1>

#block(above: .45em, below: .45em)[\[54\] Juliá JM, Rodríguez-Tembleque L. Wear and subsurface stress evolution in

tractive rolling contact. Int J Mech Sci 294, 110195, ISSN 0020-7403

(2025).] <bib-Julia2>

#block(above: .45em, below: .45em)[\[55\] Kalker JJ. Simplified theory of rolling contact. Delft Progress Report,

Series C (1973), 1--10.] <bib-KalkerSimp>

#block(above: .45em, below: .45em)[\[56\] Kalker JJ. Railway wheel and automotive tyre. Veh Syst Dyn

5(15):255--269 (1979).] <bib-Kalker4>

#block(above: .45em, below: .45em)[\[57\] Knothe K, Groß-Thebing A. Short-wavelength rail corrugation and

non-steady-state contact mechanics. Veh Syst Dyn 46(1--2):49--66 (2008).

Available from: #link("https://doi.org/10.1080/00423110701590180").] <bib-Gross>

#block(above: .45em, below: .45em)[\[58\] Alonso A, Giménez JG. Non-steady-state modelling of wheel--rail contact

for dynamic simulation of railway vehicles. Veh Syst Dyn 46(3):179--196

(2008). Available from:

#link("https://doi.org/10.1080/00423110701248011").] <bib-Alonso1>

#block(above: .45em, below: .45em)[\[59\] Guiral A, Alonso A, Baeza L, Giménez JG. Non-steady-state modelling of

wheel--rail contact. Veh Syst Dyn 51(1):91--108 (2013). Available from:

#link("https://doi.org/10.1080/00423114.2012.713499").] <bib-Alonso2>

#block(above: .45em, below: .45em)[\[60\] Ciavarella M, Barber J. Influence of longitudinal creepage and wheel

inertia on short-pitch corrugation. Proc IMechE Part J: Eng Tribol

222(3) (2008). Available from:

#link("https://doi.org/10.1243/13506501JET373").] <bib-Ciavarella1>

#block(above: .45em, below: .45em)[\[61\] Afferrante L, Ciavarella M. Short-pitch rail corrugation: a

resonance-free regime? Wear 266:9--10 (2008). Available from:

#link("https://doi.org/10.1016/j.wear.2008.12.003").] <bib-Ciavarella2>

#block(above: .45em, below: .45em)[\[62\] Afferrante L, Ciavarella M. Short-pitch corrugation of railway tracks

with wooden or concrete sleepers: an enigma solved? Tribol Int 43(3)

(2010). Available from:

#link("https://doi.org/10.1016/j.triboint.2009.09.010").] <bib-Ciavarella3>

#block(above: .45em, below: .45em)[\[63\] Al-Bender F, De Moerlooze K. A model of the transient behavior of

tractive rolling contacts. Advances in Tribology (2008). Available from:

#link("https://doi.org/10.1155/2008/214894").] <bib-Al-Bender>

#block(above: .45em, below: .45em)[\[64\] Romano L, Bruzelius F, Jacobson B. Unsteady-state brush theory. Veh Syst

Dyn (2020). Available from:

#link("https://doi.org/10.1080/00423114.2020.1774625").] <bib-USB>

#block(above: .45em, below: .45em)[\[65\] Romano L, Timpone F, Bruzelius F, Jacobson B. Analytical results in

transient brush tyre models: theory for large camber angles and classic

solutions with limited friction. Meccanica 57:165--191 (2022). Available

from: #link("http://dx.doi.org/10.1007/s11012-021-01422-3").] <bib-Meccanica2>

#block(above: .45em, below: .45em)[\[66\] Romano L, Timpone F, Bruzelius F, Jacobson B. Rolling, tilting and

spinning spherical wheels: analytical results using brush theory.

Mechanism and Machine Theory 173:104836 (2022). Available from:

#link("https://doi.org/10.1016/j.mechmachtheory.2022.104836").] <bib-SphericalWheel>

#block(above: .45em, below: .45em)[\[67\] Romano L, Bruzelius F, Jacobson B. An extended LuGre-brush tyre model

for large camber angles and turning speeds. Veh Syst Dyn (2022).

Available from: #link("https://doi.org/10.1080/00423114.2022.2086887").] <bib-LuGreSpin>

#block(above: .45em, below: .45em)[\[68\] Romano L, Maglio M, Bruni S. Transient wheel--rail rolling contact

theories. Tribology International (2023).] <bib-Tribology>

#block(above: .45em, below: .45em)[\[69\] Zhuravlev VP. The model of dry friction in the problem of rolling rigid

bodies. J Appl Math Mech 62(5):705--710 (1998).] <bib-Zhuravlev1>

#block(above: .45em, below: .45em)[\[70\] Zhuravlev VP. Friction laws in the case of combination of slip and spin.

Mech Solids 38(4):52--58 (2003).] <bib-Zhuravlev2>

#block(above: .45em, below: .45em)[\[71\] Kireenkov AA. About the motion of a symmetric rigid solid on a plane.

Proc. 8th Conf. DSTA, 95--102 (2005).] <bib-Kireenkov1>

#block(above: .45em, below: .45em)[\[72\] Kireenkov AA. Combined model of sliding and rolling friction in the

dynamics of bodies on a rough plane. Mech Solids 43(3):412--425 (2008).] <bib-Kireenkov2>

#block(above: .45em, below: .45em)[\[73\] Canudas-de-Wit C, Olsson H, Åström KJ, Lischinsky P. A new model for

control of systems with friction. IEEE Trans Autom Control

40(3):419--425 (1995).] <bib-Astrom1>

#block(above: .45em, below: .45em)[\[74\] Olsson H. Control Systems with Friction. Doctoral thesis, Lund Institute

of Technology (1996).] <bib-Olsson>

#block(above: .45em, below: .45em)[\[75\] Åström KJ, Canudas-de-Wit C. Revisiting the LuGre friction model. IEEE

Control Syst Mag 28(6):101--114 (2008).] <bib-Astrom2>

#block(above: .45em, below: .45em)[\[76\] Sorine M, Szymanski J. A new dynamic multi d.o.f. tire model.

Transportation Systems 2000, Braunschweig (2000).] <bib-Sorine>

#block(above: .45em, below: .45em)[\[77\] Canudas-de-Wit C, Tsiotras P. Dynamic tire friction models for vehicle

traction control. Proc. 38th IEEE CDC, 3746--3751 (1999). Available

from: #link("https//doi: 10.1109/CDC.1999.827937").] <bib-TsiotrasConf>

#block(above: .45em, below: .45em)[\[78\] Canudas-de-Wit C, Tsiotras P, Velenis E, et al. Dynamic friction models

for road/tire longitudinal interaction. Veh Syst Dyn 39(3):189--226

(2003). Available from:

#link("https//doi: 10.1076/vesd.39.3.189.14152").] <bib-Tsiotras1>

#block(above: .45em, below: .45em)[\[79\] Velenis E, Tsiotras P, Canudas-de-Wit C, Sorine M. Dynamic tyre friction

models for combined slip. Veh Syst Dyn 43:3--29 (2005). Available from:

#link("https//doi: 10.1080/00423110412331290464").] <bib-Tsiotras3>

#block(above: .45em, below: .45em)[\[80\] Deur J. Modeling and analysis of longitudinal tire dynamics based on the

LuGre friction model. IFAC Proc Vol 34(1):91--96 (2001). Available from:

#link("https://doi.org/10.1016/S1474-6670(17)34383-5").] <bib-Deur0>

#block(above: .45em, below: .45em)[\[81\] Deur J, Asgari J, Hrovat D. A 3D brush-type dynamic tire friction model.

Veh Syst Dyn 42(3):133--173 (2004). Available from:

#link("https://doi.org/10.1080/00423110412331282887").] <bib-Deur1>

#block(above: .45em, below: .45em)[\[82\] Deur J, Ivanović V, Troulis M, et al. Extensions of the LuGre tyre

friction model for variable slip speed. Veh Syst Dyn 43(1):508--524

(2005). Available from: #link("https//doi: 10.1080/00423110500229808").] <bib-Deur2>

#block(above: .45em, below: .45em)[\[83\] Swevers J, Al-Bender F, Ganseman CG, Projogo T. An integrated friction

model with improved presliding behavior. IEEE Trans Autom Control

45(4):675--686 (2000).] <bib-Integrated>

#block(above: .45em, below: .45em)[\[84\] Lampaert V, Swevers J, Al-Bender F. Modification of the Leuven

integrated friction model. IEEE Trans Autom Control 47(4):683--687

(2002).] <bib-Leuven>

#block(above: .45em, below: .45em)[\[85\] Dupont P, Armstrong B, Hayward V. Elasto-plastic friction model: contact

compliance and stiction. Proc. 2000 American Control Conference,

1072--1077 (2000).] <bib-Elasto1>

#block(above: .45em, below: .45em)[\[86\] Dupont P, Hayward V, Armstrong B, et al. Single-state elasto-plastic

friction models. IEEE Trans Autom Control 47:787--792 (2002).] <bib-Elasto2>

#block(above: .45em, below: .45em)[\[87\] Romano L, Aamo OM, Åslund J, Frisk E. First-order friction models with

bristle dynamics: lumped and distributed formulations. Submitted to IEEE

Trans Control Syst Technol (2025).] <bib-FrBD>

#block(above: .45em, below: .45em)[\[88\] Romano L. Two-dimensional FrBD friction models for rolling contact.

Nonlinear Dyn (2026).] <bib-FrBDroll>

#block(above: .45em, below: .45em)[\[89\] Sakhnevych A, Maglione R, Suero R, et al. Nonlinear mathematical

modeling of frequency-temperature dependent viscoelastic materials for

tire applications. Nonlinear Dyn 112:21729--21750 (2024). Available

from: #link("https://doi.org/10.1007/s11071-024-10175-z").] <bib-Rheology1>

#block(above: .45em, below: .45em)[\[90\] Shaw MT, MacKnight WJ. Introduction to polymer viscoelasticity. Wiley,

Amsterdam (2018).] <bib-bookRheol1>

#block(above: .45em, below: .45em)[\[91\] Mark JE, Erman B, Roland M. The science and technology of rubber.

Academic press, London (2013).] <bib-bookRheol2>

#block(above: .45em, below: .45em)[\[92\] Gutierrez-Lemini D. Engineering viscoelasticity. Springer, New York

(2014).] <bib-bookRheol3>

#block(above: .45em, below: .45em)[\[93\] Wallace ER, Chaise T, Nelias D. Three-dimensional rolling/sliding

contact on a viscoelastic layered half-space. Journal of the Mechanics

and Physics of Solids 143, 104067 (2020).] <bib-JMPS1>

#block(above: .45em, below: .45em)[\[94\] Carbone G, Putignano P. A novel methodology to predict sliding and

rolling friction of viscoelastic materials: Theory and experiments.

Journal of the Mechanics and Physics of Solids 61(8):1822-1834 (2013).] <bib-JMPS2>

#block(above: .45em, below: .45em)[\[95\] Koumi KE, Chaise T, Nelias D. Rolling contact of a rigid sphere/sliding

of a spherical indenter upon a viscoelastic half-space containing an

ellipsoidal inhomogeneity. Journal of the Mechanics and Physics of

Solids 80:1-25 (2015).] <bib-JMPS3>

#block(above: .45em, below: .45em)[\[96\] Serra-Aguila A, Puigoriol-Forcada JM, Reyes G, et al. Viscoelastic

models revisited: characteristics and interconversion formulas for

generalized Kelvin--Voigt and Maxwell models. Acta Mech. Sin.

35:1191--1209 (2019). Available from:

#link("https://doi.org/10.1007/s10409-019-00895-6").] <bib-Rheology2>

#block(above: .45em, below: .45em)[\[97\] Loy RJ, de Hoog FR, Anderssen RS. Interconversion of Prony series for

relaxation and creep. J. Rheol. 59, 1261--1270 (2015).] <bib-Rheology2-3>

#block(above: .45em, below: .45em)[\[98\] Xiao R, Sun H, Chen W. An equivalence between generalized Maxwell model

and fractional Zener model, Mechanics of Materials 100:148-153 (2016).

Available from: #link("https://doi.org/10.1016/j.mechmat.2016.06.016").] <bib-Rheology3>

#block(above: .45em, below: .45em)[\[99\] Shitikova M. Fractional operator viscoelastic models in dynamic problems

of mechanics of solids: a review. Mech. solids 57:1--33 (2022).] <bib-Fractional1>

#block(above: .45em, below: .45em)[\[100\] Meral F, Royston T, Magin R. Fractional calculus in viscoelasticity: an

experimental study. Commun. Nonlinear Sci. Numer. Simul. 15:939--945

(2010).] <bib-Fractional2>

#block(above: .45em, below: .45em)[\[101\] Wagner CE, Barbati AC, Engmann J, et al. Quantifying the consistency and

rheology of liquid foods using fractional calculus. Food Hydrocoll.

69:242--254 (2017).] <bib-Fractional3>

#block(above: .45em, below: .45em)[\[102\] Pazy A. Semigroups of Linear Operators and Applications to PDEs.

Springer, New York (1983). Available from:

#link("https://doi.org/10.1007/978-1-4612-5561-1").] <bib-Pazy>

#block(above: .45em, below: .45em)[\[103\] Tanabe H. Equations of Evolution. Pitman, London (1979).] <bib-Tanabe1>

#block(above: .45em, below: .45em)[\[104\] Tanabe H. Functional Analytic Methods for Partial Differential

Equations. CRC Press (1997).] <bib-Tanabe>

#block(above: .45em, below: .45em)[\[105\] Edwards CH. Advanced Calculus of Several Variables, Vol. III --

Successive Approximations and Implicit Functions. Academic Press (1973).] <bib-Edwards>

#block(above: .45em, below: .45em)[\[106\] Bekesi BJ, Antali M, Csernak G. Phase portraits and bifurcations induced

by static and dynamic friction models. Nonlinear Dyn 13:15863--15899

(2025). Available from:

#link("https://doi.org/10.1007/s11071-025-10974-y").] <bib-Antali>

#block(above: .45em, below: .45em)[\[107\] Rill G, Schaeffer T, Schuderer M. LuGre or not LuGre. Multibody Syst Dyn

60:191--218 (2024). Available from:

#link("https://doi.org/10.1007/s11044-023-09909-5").] <bib-Rill>

#block(above: .45em, below: .45em)[\[108\] Takács D, Orosz G, Stépán G. Delay effects in shimmy dynamics of wheels

with stretched string-like tyres. Eur J Mech A/Solids 28(3):516--525

(2009).] <bib-Takacs1>

#block(above: .45em, below: .45em)[\[109\] Takács D, Stépán G. Micro-shimmy of towed structures in unstable

parameter domains. Veh Syst Dyn 50(11):1613--1630 (2012).] <bib-Takacs2>

#block(above: .45em, below: .45em)[\[110\] Takács D, Stépán G, Hogan SJ. Large amplitude periodic motions of towed

rigid wheels. Nonlinear Dyn 52:27--34 (2008). Available from:

#link("https://doi.org/10.1007/s11071-007-9253-y").] <bib-Takacs3>

#block(above: .45em, below: .45em)[\[111\] Takács D, Stépán G. Experiments on quasiperiodic wheel shimmy. J Comput

Nonlinear Dyn 4(3):031007 (2009). Available from:

#link("https://doi.org/10.1115/1.3124786").] <bib-Takacs4>

#block(above: .45em, below: .45em)[\[112\] Takács D, Stépán G. Contact patch memory of tyres leading to lateral

vibrations of vehicles. Phil Trans R Soc A 371:20120427 (2013).

Available from: #link("http://doi.org/10.1098/rsta.2012.0427").] <bib-Takacs5>

#block(above: .45em, below: .45em)[\[113\] Romano L, Aamo OM, Åslund J, Frisk E. Stability analysis of linear

single-track models with transient tyre dynamics. Veh Syst Dyn (2024).

Available from: #link("https://doi.org/10.1080/00423114.2024.2445163").] <bib-BicyclePDE>

#block(above: .45em, below: .45em)[\[114\] Romano L, Aamo OM, Åslund J, Frisk E. Semilinear single-track models

with distributed tyre friction dynamics. Nonlinear Dyn (2025).] <bib-SemilinearV>

#block(above: .45em, below: .45em)[\[115\] Higuchi A, Pacejka HB. The relaxation length concept at large wheel slip

and camber. Veh Syst Dyn 25(sup001):50--64 (1997). Available from:

#link("https://doi.org/10.1080/00423119708969644").] <bib-Higuchi2>

#block(above: .45em, below: .45em)[\[116\] Rill G. Simple contact calculation for handling tyre models. Multibody

Syst Dyn 45:131--153 (2019). Available from:

#link("https://doi.org/10.1007/s11044-018-9629-4").] <bib-Rill1>

#block(above: .45em, below: .45em)[\[117\] Shaju A, Pandey AK. Modelling transient response using PAC 2002-based

tyre model. Veh Syst Dyn (2020). Available from:

#link("https://doi.org/10.1080/00423114.2020.1802048").] <bib-PAC>
#set heading(numbering: "A.1")
#counter(heading).update(0)

= Model parametrisation
<app:param>
This appendix outlines a practical procedure for parametrising the
FrBD$""_(n + 1)$ models based on Generalised Maxwell (GM) and
Generalised Kelvin-Voigt (GKV) rheological representations from
frequency-domain experimental data. The discussion is restricted to
linear viscoelasticity and aims at bridging the theoretical formulation
presented in Sect.~#link(<sect:2Dext>)[2] with commonly employed experimental
characterisation techniques.

== Linear viscoelastic response in the frequency domain
<linear-viscoelastic-response-in-the-frequency-domain>
In the present formulation, the bristle deformation
$bold(z) \( t \) in bb(R)^2$ and the corresponding force
$p bold(f) \( t \) in bb(R)^2$ are vector-valued quantities.
Accordingly, the linear viscoelastic response is described by a
matrix-valued complex modulus
$upright(bold(G))^(*) \( omega \) in upright(bold(S y m))_2 \( bb(C) \)$.
For a harmonic deformation
$bold(z) \( t \) = "Re" { hat(bold(z)) upright(e)^(upright(i) omega t) }$,
the resulting force response reads
$bold(f) \( t \) = "Re" { upright(bold(G))^(*) \( omega \) hat(bold(z)) e^(upright(i) omega t) }$.
The real and imaginary parts of $upright(bold(G))^(*) \( omega \)$,
$ upright(bold(G))' \( omega \) ? "Re" #scale(x: 120%, y: 120%)[{] upright(bold(G))^(*) \( omega \) #scale(x: 120%, y: 120%)[}] \, quad upright(a n d) quad upright(bold(G))^('') \( omega \) ? "Im" #scale(x: 120%, y: 120%)[{] upright(bold(G))^(*) \( omega \) #scale(x: 120%, y: 120%)[}] \, $
are referred to as the storage and loss moduli \[#link(<bib-Rheology1>)[89], #link(<bib-bookRheol1>)[90]\],
respectively, and belong to $upright(bold(S y m))_2 \( bb(R) \)$. In
many practical applications, experimental characterisation is performed
independently in the longitudinal and lateral directions. In such cases,
$upright(bold(G))^(*) \( omega \)$ is taken diagonal, and the storage
and loss moduli reduce to scalar functions along each principal
direction. The present formulation, however, also accommodates coupled
or anisotropic viscoelastic responses by allowing for full symmetric
matrices. For a GM element with $n + 1$ branches, the complex modulus
admits the representation
#math.equation(block: true, numbering: _ => [(64)], $ upright(bold(G))^(*) \( omega \) = upright(bold(K))_0 + sum_(i = 1)^n upright(i) omega upright(bold(C))_i \( upright(bold(K))_i + upright(i) omega upright(bold(C))_i \)^(- 1) upright(bold(K))_i \, $) <eq:GM_complex_modulus>
where
$upright(S y m)_2 \( bb(R) \) in.rev upright(bold(K))_i succ upright(bold(0))$,
$i in { 0 \, dots.h \, n }$, and
$upright(S y m)_2 \( bb(R) \) in.rev upright(bold(C))_i succ upright(bold(0))$,
$i in { 1 \, dots.h \, n }$, denote stiffness and damping matrices,
i.e., $upright(bold(K))_i = p macron(upright(bold(K)))_i$, and
$upright(bold(C))_i = p macron(upright(bold(C)))_i$. An equivalent
expression can be derived for the GKV representation, yielding the same
complex modulus $upright(bold(G))^(*) \( omega \)$, in accordance with
the equivalence stated in
Eq.~#link(<eq:rheol1_diff>)[(10)].
Equation~#link(<eq:GM_complex_modulus>)[(64)]
highlights that GM and GKV elements naturally generate a discrete
relaxation spectrum, with characteristic relaxation time matrices
$bold(tau)_i = macron(upright(bold(C)))_i macron(upright(bold(K)))_i^(- 1) = upright(bold(C))_i upright(bold(K))_i^(- 1)$,
$i in { 1 \, dots.h \, n }$.

== Identification from frequency-domain measurements
<identification-from-frequency-domain-measurements>
In practice, the viscoelastic properties of polymers and rubbers are
commonly identified using dynamic mechanical analysis (DMA)
\[#link(<bib-Rheology1>)[89], #link(<bib-Rheology2>)[96]\], which provides measurements of
$upright(bold(G))' \( omega \)$ and $upright(bold(G))^('') \( omega \)$
over a prescribed frequency range. The identification of a GM or GKV
model then amounts to fitting
Eq.~#link(<eq:GM_complex_modulus>)[(64)] to the
experimentally measured complex modulus.

A standard identification pipeline consists of: (i) selecting #emph[a
priori] a finite number $n$ of relaxation branches; (ii) assuming
$bold(tau)_i = tau_i upright(bold(I))_2$, $i in { 1 \, dots.h \, n }$,
prescribing a set of relaxation times ${ tau_i }_(i = 1)^n$\; (iii)
estimating the matrices $upright(bold(K))_i$ and $upright(bold(C))_i$
via least-squares fitting of $upright(bold(G))^(*) \( omega \)$. In most
engineering applications, a small number of branches (typically
$n = 2$-$5$) suffices to accurately reproduce the viscoelastic response
over the frequency range relevant to rolling contact phenomena. In
particular, the relaxation times $tau_i$ determine the frequency range
over which viscoelastic dissipation occurs. A common and effective
strategy consists in distributing them logarithmically over a prescribed
interval $\[ tau ""_(upright(m i n)) \, tau ""_(upright(m a x)) \]$,
with
$tau ""_(upright(m i n)) \, tau ""_(upright(m a x)) in bb(R)_(> 0)$,
according to
#math.equation(block: true, numbering: _ => [(65)], $ tau_i = tau ""_(upright(m i n)) #scale(x: 240%, y: 240%)[\(] frac(tau ""_(upright(m a x)), tau ""_(upright(m i n))) #scale(x: 240%, y: 240%)[\)]^(frac(i - 1, n - 1)) \, quad i in { 1 \, dots.h \, n } . $) <eq:log_spaced_taus>
Short relaxation times capture high-frequency, rate-dependent effects,
whereas long relaxation times govern slow stress relaxation and
hysteresis. The bounds $tau ""_(upright(m i n))$ and
$tau ""_(upright(m a x))$ may be chosen based on the expected range of
excitation frequencies induced by rolling, which depend on rolling
speed, contact patch dimensions, and slip conditions.

== FrBD$""_(n + 1)$ model parameters and interconversions
<frbd_n1-model-parameters-and-interconversions>
Once the stiffness and damping matrices $upright(bold(K))_i$ and
$upright(bold(C)) i$ have been identified, they can be directly employed
in the FrBD$n + 1$ models introduced in Sect.~#link(<sect:DynamicDer>)[2.2] by
introducing the normalised parameters
$macron(upright(bold(K)))_i = upright(bold(K))_i \/ p$,
$i in { 0 \, dots.h \, n }$, and
$macron(upright(bold(C)))_i = upright(bold(C))_i \/ p$,
$i in { 1 \, dots.h \, n }$. where $p \( bold(x) \, s \)$ denotes the
local normal pressure. For the GM realisation, these parameters enter
the dynamics through Eq.~#link(<eq:ODEModel>)[(19)], whereas
for the GKV realisation they appear in
Eq.~#link(<eq:ODEModelKV>)[(20)].

In the developments of Sect.~#link(<sect:2Dext>)[2], the normalised matrices
$macron(upright(bold(K)))_i$ and $macron(upright(bold(C)))_i$ have been
assumed to be spatially constant. This assumption is automatically
satisfied in the case of uniform pressure distributions. In practical
rolling-contact applications, however, mildly non-uniform pressure
distributions, typically decreasing along the rolling direction, are
often preferred, as they permit reproducing the sign reversal of the
vertical moment at large slips \[#link(<bib-Tsiotras3>)[79], #link(<bib-Deur1>)[81], #link(<bib-Deur2>)[82], #link(<bib-FrBDroll>)[88]\], and
ensure strict passivity of the distributed models
(Eqs.~#link(<eq:VdissF2>)[(51)]
and~#link(<eq:VdissF23>)[(56)] become Lyapunov functions). In
such cases, it is convenient to allow the original matrices
$upright(bold(K))_i$ and $upright(bold(C))_i$ to vary proportionally
with the local pressure, so that the corresponding normalised matrices
remain constant over the contact patch.

Finally, additional comments are provided regarding possible model
interconversions. For any finite $n$, the GM and GKV representations are
equivalent, in the sense that they generate the same constitutive
relation between force and deformation \[#link(<bib-Rheology2>)[96], #link(<bib-Rheology2-3>)[97]\], as
expressed in Eq.~#link(<eq:rheol1_diff>)[(10)] (provided
that the matrices $macron(upright(bold(K)))_i$ and
$macron(upright(bold(C)))_i$ are constant). Whilst closed-form
interconversion formulas become increasingly involved as $n$ grows, both
representations yield identical input-output behaviour. However, from a
numerical perspective, the GM realisation introduces internal force
states $bold(f)_i \( bold(x) \, s \)$, whereas the GKV formulation
employs internal deformation states $bold(z)_i \( bold(x) \, s \)$. The
choice between the two may therefore be guided by considerations related
to numerical conditioning or implementation convenience. In this
context, it should be mentioned that fractional viscoelastic models may
also be interpreted as the limit of GM or GKV models with a continuous
relaxation spectrum \[#link(<bib-Rheology3>)[98]\]. In this sense, the FrBD$""_(n + 1)$
framework provides a finite-dimensional approximation of fractional
constitutive laws, whilst retaining a clear physical interpretation and
a state-space structure amenable to analysis. Increasing the number of
dissipative branches $n$ allows approximating increasingly complex
relaxation behaviours without resorting to fractional derivatives.

= Alternative state-space representations of the FrBD$""_2$-SLS model
<app:alt>
The present appendix discusses some alternative representation of the
FrBD$""_2$-SLS model, which is based on a Standard Linear Solid
rheological bristle element, and may be obtained from certain
parametrisations of Eqs.~#link(<eq:ODEModel>)[(19)]
and~#link(<eq:ODEModelKV>)[(20)] for $n = 1$.

Starting with the FrBD$""_2$-GM,
Eq.~#link(<eq:ODEModel>)[(19)] for $n = 1$, admits an
alternative state-space representation as
#math.equation(block: true, numbering: _ => [(66)], $  & dot(bold(z)) \( t \) = - upright(bold(M))^(- 2) #scale(x: 120%, y: 120%)[\(] bold(v) ""_(upright(r)) \( t \) #scale(x: 120%, y: 120%)[\)] ∥upright(bold(M)) #scale(x: 120%, y: 120%)[\(] bold(v) ""_(upright(r)) \( t \) #scale(x: 120%, y: 120%)[\)] bold(v) ""_(upright(r)) \( t \)∥_(2 \, epsilon) bold(f) \( t \) - bold(v) ""_(upright(r)) \( t \) \,\
 & dot(bold(f)) \( t \) = - bold(tau)^(- 1) bold(f) \( t \) + bold(tau)^(- 1) macron(upright(bold(K)))_0 bold(z) \( t \) + #scale(x: 120%, y: 120%)[\(] macron(upright(bold(K)))_0 + macron(upright(bold(K)))_1 #scale(x: 120%, y: 120%)[\)] dot(bold(z)) \( t \) \, quad t in \( 0 \, T \) \,\
 & bold(z) \( 0 \) = bold(z)_0 \, #h(0em) bold(f) \( 0 \) = bold(f)_0 \, $) <eq:ODEModelSLS>
where, for notational convenience, it has been renamed
$upright(bold(S y m))_2 \( bb(R) \) in.rev bold(tau) ? bold(tau)_1 = macron(upright(bold(C)))_1 macron(upright(bold(K)))_1^(- 1)$.
From the above Eq.~#link(<eq:ODEModelSLS>)[(66)], it may
be easily realised that, for
$macron(upright(bold(C)))_1 = upright(bold(0))$, the FrBD$""_2$-SLS
model degenerates into the Dahl one, whereas the FrBD$""_1$-KV
formulation introduced in \[#link(<bib-FrBDroll>)[88]\], corresponding to an amended LuGre,
is recovered when
$∥macron(upright(bold(K)))_1∥ gt.double ∥macron(upright(bold(K)))_0∥$.

Defining the distributed state as
$bb(R)^4 in.rev bold(u) \( bold(x) \, s \) ? \[ bold(z)^(upright(T)) \( bold(x) \, s \) #h(0em) bold(f)^(upright(T)) \( bold(x) \, s \) \]^(upright(T))$,
the distributed rolling contact model may be put in the
form~(25a) with
$ upright(bold(Sigma)) \( macron(bold(v)) ""_(upright(r)) \, s \) & ? mat(delim: "[", upright(bold(0)), upright(bold(Psi)) \( macron(bold(v)) ""_(upright(r)) \, s \); frac(bold(tau)^(- 1), V ""_(upright(r)) \( s \)) macron(upright(bold(K)))_0, - frac(bold(tau)^(- 1), V ""_(upright(r)) \( s \)) + \( macron(upright(bold(K)))_0 + macron(upright(bold(K)))_1 \) upright(bold(Psi)) \( macron(bold(v)) ""_(upright(r)) \, s \)) \,\
upright(bold(H)) & ? - mat(delim: "[", upright(bold(I))_2, macron(upright(bold(K)))_0 + macron(upright(bold(K)))_1)^(upright(T)) . $
The corresponding storage function in
Eq.~#link(<eq:VdissF2>)[(51)] rewrites accordingly
#math.equation(block: true, numbering: _ => [(68)], $ W #scale(x: 120%, y: 120%)[\(] bold(u) \( dot.op \, s \) #scale(x: 120%, y: 120%)[\)] & ? 1 / 2 integral.double_(cal(C)) p \( bold(x) \) bold(z)^(upright(T)) \( bold(x) \, s \) macron(upright(bold(K)))_0 bold(z) \( bold(x) \, s \) upright(d) bold(x)\
 & quad + 1 / 2 integral.double_(cal(C)) p \( bold(x) \) #scale(x: 120%, y: 120%)[\(] bold(f) \( bold(x) \, s \) - macron(upright(bold(K)))_0 bold(z) \( bold(x) \, s \) #scale(x: 120%, y: 120%)[\)]^(upright(T)) macron(upright(bold(K)))_1^(- 1) #scale(x: 120%, y: 120%)[\(] bold(f) \( bold(x) \, s \) - macron(upright(bold(K)))_0 bold(z) \( bold(x) \, s \) #scale(x: 120%, y: 120%)[\)] upright(d) bold(x) . $) <eq:VdissF2SLS>
On the other hand, introducing the variable
$bb(R) in.rev bold(z)_0 \( t \) ? bold(z) \( t \) - bold(z)_1 \( t \)$,
Eq.~#link(<eq:ODEModelKV>)[(20)] can be recast as
#math.equation(block: true, numbering: _ => [(69)], $  & dot(bold(z))_0 \( t \) = - upright(bold(M))^(- 2) #scale(x: 120%, y: 120%)[\(] bold(v) ""_(upright(r)) \( t \) #scale(x: 120%, y: 120%)[\)] ∥upright(bold(M)) #scale(x: 120%, y: 120%)[\(] bold(v) ""_(upright(r)) \( t \) #scale(x: 120%, y: 120%)[\)] bold(v) ""_(upright(r)) \( t \)∥_(2 \, epsilon) macron(upright(bold(K)))_0 bold(z)_0 - dot(bold(z))_1 \( t \) - bold(v) ""_(upright(r)) \( t \) \,\
 & dot(bold(z))_1 \( t \) = - macron(upright(bold(C)))_1^(- 1) macron(upright(bold(K)))_1 bold(z)_1 \( t \) + macron(upright(bold(C)))_1^(- 1) macron(upright(bold(K)))_0 bold(z)_0 \( t \) \, quad t in \( 0 \, T \) \,\
 & bold(z)_0 \( 0 \) = bold(z)_(0 \, 0) \, #h(0em) bold(z)_1 \( 0 \) = bold(z)_(1 \, 0) \, $) <eq:ODEModelSLS2>
With the distributed state vector
$bb(R)^4 in.rev bold(u) \( bold(x) \, s \) ? \[ bold(z)_0^(upright(T)) \( bold(x) \, s \) #h(0em) bold(z)_1^(upright(T)) \( bold(x) \, s \) \]^(upright(T))$,
the distributed rolling contact model may be put in the
form~(25a) with
$ upright(bold(Sigma)) \( macron(bold(v)) ""_(upright(r)) \, s \) & ? mat(delim: "[", #scale(x: 300%, y: 300%)[\(] upright(bold(Psi)) \( macron(bold(v)) ""_(upright(r)) \, s \) - frac(macron(upright(bold(C)))_1^(- 1), V ""_(upright(r)) \( s \)) #scale(x: 300%, y: 300%)[\)] macron(upright(bold(K)))_0, frac(macron(upright(bold(C)))_1^(- 1), V ""_(upright(r)) \( s \)) macron(upright(bold(K)))_1; frac(macron(upright(bold(C)))_1^(- 1), V ""_(upright(r)) \( s \)) macron(upright(bold(K)))_0, - frac(macron(upright(bold(C)))_1^(- 1), V ""_(upright(r)) \( s \)) macron(upright(bold(K)))_1) \,\
upright(bold(H)) & ? - mat(delim: "[", upright(bold(I))_2, upright(bold(0)))^(upright(T)) . $
The corresponding storage function in
Eq.~#link(<eq:VdissF23>)[(56)] rewrites accordingly
#math.equation(block: true, numbering: _ => [(71)], $ W #scale(x: 120%, y: 120%)[\(] bold(u) \( dot.op \, s \) #scale(x: 120%, y: 120%)[\)] & ? 1 / 2 integral.double_(cal(C)) p \( bold(x) \) bold(z)_0^(upright(T)) \( bold(x) \, s \) macron(upright(bold(K)))_0 bold(z)_0 \( bold(x) \, s \) upright(d) bold(x) + 1 / 2 integral.double_(cal(C)) p \( bold(x) \) bold(z)_1^(upright(T)) \( bold(x) \, s \) macron(upright(bold(K)))_1 bold(z)_1 \( bold(x) \, s \) upright(d) bold(x) . $) <eq:VdissF2SLS3>

