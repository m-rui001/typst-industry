// Bogo, Clare, and Liao-McPherson, arXiv:2609.28734v1. Converted from LaTeX under CC BY 4.0.
// https://arxiv.org/abs/2609.28734v1 | https://creativecommons.org/licenses/by/4.0/
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
  title: [ #strong[Iterative Learning Control of the Cooling Rate in a
Dual-Laser Powder Bed Fusion Process]],
  authors: (
    ( name: [Lauren Bogo$""^1$, Adam Clare$""^1$, and Dominic
Liao-McPherson$""^1$ #footnote[© 2026 IEEE. Personal use of this
material is permitted. Permission from IEEE must be obtained for all
other uses, in any current or future media, including
reprinting/republishing this material for advertising or promotional
purposes, creating new collective works, for resale or redistribution to
servers or lists, or reuse of any copyrighted component of this work in
other works.] #footnote[The authors are with the University of British
Columbia Department of Mechanical Engineering, 2054-6250 Applied Science
Ln, Vancouver, BC V6T 1Z4, Canada. Email:
`{lauren.bogo, adam.clare, dominic.liao-mcpherson}@ubc.ca` This work was
supported by the Natural Sciences and Engineering Research Council of
Canada (Reference \# RGPIN-2023-03257).]],
      affiliation: "",
      email: "" ),
    ),
  abstract-title: [Abstract],
  abstract: [The thermal history of the melt pool in laser powder bed
fusion (LPBF) additive manufacturing processes governs the
solidification microstructure and the mechanical properties of the
resulting 3D-printed parts. Dual-laser systems offer additional degrees
of freedom to control the cooling profile by reheating material behind
the melt pool, but calibrating process parameters is challenging due to
the complex physics of the process. We present an optimization-based
iterative learning controller that determines optimal power, velocity,
and offset settings by judiciously combining simulations and
experiments: the model supplies search directions while feedback
obtained from experiments on the real plant corrects for parameter
errors, enabling convergence despite model inaccuracies. The approach is
validated in simulation using a high-fidelity thermal model as a plant
surrogate, with deliberate mismatches in absorption coefficient, latent
heat treatment, and powder-bed effective conductivity between plant and
model. Results show that the controller drives the plant cost down by
over an order of magnitude and reaches a tight band of low-cost
solutions across seeds, while model-only feedforward optimization stalls
at a substantially higher plant cost despite appearing to converge on
the surrogate.

],
  pagenumbering: "1",
  cols: 1,
  doc,
)


#set heading(numbering: "1.1")
#set math.equation(numbering: "(1)")

= Introduction
<sec:intro>
Metal additive manufacturing has emerged as a transformative technology
for producing parts with complex geometries. E.g., in the aerospace and
biomedical fields it has enabled the fabrication of complex, lightweight
components with unprecedented design freedom~\[1\]. However, parts
produced by laser powder bed fusion (LPBF) typically exhibit poor
as-built microstructure including columnar grains, anisotropic
mechanical properties, and residual stress, requiring costly
post-processing such as heat treatment before they can meet performance
specifications~\[1\]. These additional steps negate many of the
efficiency gains offered by additive manufacturing. Controlling
microstructure #emph[during] the build, rather than correcting it
afterward, would improve efficiency and reduce cost.

#figure(image("figs/microstructure_comparison.png"),
  caption: [
    Dual-laser control of solidification microstructure. (Left)
    Single-laser processing produces steep thermal gradients and fast
    cooling, resulting in columnar grain growth. (Right) A trailing
    reheat laser reduces the cooling rate, extending time above the
    liquidus temperature and enabling the columnar-to-equiaxed
    transition. The resulting equiaxed microstructure exhibits improved
    isotropy and crack resistance.
  ]
)
<fig:microstructure>

The mechanical properties of LPBF parts are governed by the thermal
history experienced during solidification~\[2\]. Temperature gradients
on the order of $10^6$~K/m and cooling rates exceeding $10^6$~K/s drive
microstructure formation, with a combination of the thermal gradient and
solidification velocity determining whether columnar or equiaxed grain
morphologies emerge~\[3\], \[4\]. As illustrated in
Figure~@fig:microstructure, steep gradients produce columnar dendritic
structures with anisotropic properties and hot-cracking susceptibility,
while reduced gradients enable equiaxed grains with isotropic, often
superior mechanical performance~\[5\].

The majority of LPBF machines use only a single laser which offers
limited ability to modulate thermal history: once power and scan speed
are set, the temperature field is governed by heat conduction into the
substrate. Dual-laser configurations introduce additional degrees of
freedom which can be used to decouple melting from thermal management.
In dual-laser LPBF, a trailing secondary laser is used to reheat
material during solidification to reduce cooling rates and thermal
gradients~\[6\], \[7\], promoting the columnar-to-equiaxed transition
(CET)~\[7\], \[8\]. However, the additional degrees of freedom must be
used correctly to reliably realize these benefits: incorrect parameters
provide no improvement or can degrade part quality. To date, all
reported dual-laser LPBF studies set trailing laser parameters using
feedforward approaches, either through experimental parameter
sweeps~\[7\] or by selecting parameters based on simulations~\[6\],
\[8\]. These procedures must be repeated for every new material,
machine, or geometry, and the resulting parameters are only as good as
the model or the experimental budget allows. Moreover, derivative-free
alternatives scale unfavorably with input dimension. A grid search over
even a modest 10-point discretization of the four-dimensional input
space $\( P_(L 1) \, P_(L 2) \, d \, v \)$ would require $10^4$ physical
experiments, and Bayesian optimization, while more sample-efficient than
grid search, suffers from the curse of dimensionality and typically
requires a substantial evaluation budget at this input dimension~\[9\].
By contrast, the approach presented here drives the plant cost down by
over an order of magnitude within roughly 20-40 plant evaluations by
exploiting model gradients to determine search directions while using
plant feedback to correct for model error.

In this paper, we present an algorithm for determining optimal process
parameters for dual-laser LPBF process using optimization-based
iterative learning control (OB-ILC). We optimize the leading and
trailing laser powers, lag distance, and scan velocity to track target
thermal profiles through the solidification region, promoting equiaxed
grain formation. The controller uses a low-fidelity differentiable
simulation to compute search directions via a data-driven sequential
quadratic programming (SQP) algorithm, while experiments on the plant
correct for model mismatch at each iteration. We validate the framework
using JAX-FEM thermal simulations~\[10\] where the plant and model
differ in absorption coefficient, latent heat treatment, and powder-bed
effective conductivity, representing the realistic scenario where a fast
surrogate omits physics present in the true process. Results show that
ILC converges to consistent low-cost plant solutions across initial
conditions, while model-only optimization, despite appearing to converge
on the surrogate, settles at significantly higher plant cost. The gap
between the two reflects the model-plant mismatch that the iterative
feedback loop corrects. Because the plant is treated as a black box, the
same algorithm applies directly to hardware experiments: replacing the
high-fidelity simulation with pyrometer measurements requires no
algorithmic changes, which allows for systematic calibration on real
machines without extensive manual tuning.

ILC is well established in the manufacturing domain~\[11\], \[12\] where
it has a natural synergy with the inherently repetitive nature of many
manufacturing processes. ILC was originally formulated as a
discrete-time tracking problem in the iteration domain; OB-ILC extends
the paradigm by formulating the ILC problem as a constrained
optimization problem~\[13\] which provides a natural framework for
integrating constraints and more complex objectives and for obtaining
convergence/robustness guarantees~\[14\], \[15\]. Prior applications of
ILC to AM include passivity-based temperature tracking in selective
laser melting~\[16\], model-free multi-objective thermal
regulation~\[17\], melt pool geometry control~\[18\], layer-to-layer
thermal regulation~\[19\], and spatial height control~\[20\]. To the
best of the authors' knowledge, this work represents the first
application of ILC to dual-laser thermal profile optimization in laser
powder bed fusion.

The remainder of this paper is organized as follows.
Section~@sec:problem formulates the problem. Section~@sec:ilc presents
the multi-fidelity ILC framework. Section~@sec:simulation describes the
simulation study. Section~@sec:results presents single-line geometry
results. Section~@sec:results:zigzag tests transfer to a non-single-line
(zigzag) geometry. Section~@sec:conclusion concludes.

= Problem Formulation
<sec:problem>
We consider a dual-laser powder bed fusion system where two lasers
traverse a shared straight-line scan path at velocity $v$. A leading
laser creates the melt pool while a trailing laser reheats material
during solidification to modulate the cooling rate. We study a single
straight-line geometry as the fundamental building block: most LPBF scan
strategies employ hatching patterns composed of straight lines, so
calibrating the trailing laser for a single line is a natural starting
point. We focus on layer-to-layer control, where trailing laser
parameters are updated between trials rather than within a scan.
Within-scan control would require high-bandwidth thermal monitoring
hardware; layer-to-layer control runs on existing machines.

The thermal response of the powder bed is governed by the transient heat
equation on a three-dimensional domain $Omega subset bb(R)^3$:
$ rho thin c_p \( T \) frac(partial T, partial t) = nabla dot.op \( k nabla T \) + q \( x \, t \) \, $<eq:heat>
where $rho$ is density, $c_p \( T \)$ is the (temperature-dependent)
specific heat, $k$ is thermal conductivity, and $q \( x \, t \)$ is the
volumetric heat source. The boundary conditions are
$ T #scale(x: 120%, y: 120%)[\|]_(z = 0) & = T_0 \,\
- k frac(partial T, partial n) #scale(x: 240%, y: 240%)[\|]_(upright("top")) & = q_(upright("laser")) - h \( T - T_oo \) - sigma epsilon \( T^4 - T_oo^4 \) \,\
- k frac(partial T, partial n) #scale(x: 240%, y: 240%)[\|]_(upright("walls")) & = - h \( T - T_oo \) - sigma epsilon \( T^4 - T_oo^4 \) \, $<eq:bc_bottom>
where $T_0 = T_oo = 300$~K, $h = 100$~W/(m$""^2 dot.op$K) is the
convection coefficient, and $epsilon = 0.3$ is the surface emissivity.
The bottom face acts as the primary heat sink, while the top and side
walls lose heat by convection and radiation.

The heat source is the superposition of two Gaussian laser beams where
each beam deposits energy as
$ q_i \( x \, t \) = frac(eta P_i, pi r_b^2 thin delta_z) exp #h(-1em) #scale(x: 180%, y: 180%)[\(] - frac(parallel x_(x y) - mu_i \( t \) parallel^2, r_b^2) #scale(x: 180%, y: 180%)[\)] . $<eq:gaussian>
Here $eta$ is the laser absorption coefficient, $P_i$ is the power of
laser $i$, $r_b$ is the beam radius, $delta_z$ is the optical
penetration depth, $x_(x y)$ denotes the in-plane coordinates, and
$mu_i \( t \)$ is the beam centre position at time $t$. The leading
laser moves along the scan direction $hat(e)$ at velocity $v$ with
$mu_1 \( t \) = v t thin hat(e)$, and the trailing laser follows at a
fixed lag distance $d$ behind:
$mu_2 \( t \) = mu_1 \( t \) - d thin hat(e)$. The control input is
$ u = mat(delim: "[", P_(L 1); P_(L 2); d; v) in cal(U) subset bb(R)^4 \, $<eq:input>
where $P_(L 1) in \[ 25 \, 100 \]$~W and $P_(L 2) in \[ 25 \, 100 \]$~W
are the leading and trailing laser powers, $d in \[ 0 \, 250 \] med mu$m
is the lag distance, and $v in \[ 0.25 \, 1.0 \]$~m/s is the scan
velocity. All four parameters influence the thermal history: the laser
powers govern energy input, the lag distance controls the timing of the
reheat pulse relative to solidification, and the scan velocity sets the
interaction time between the lasers and the powder bed.

The system output is the temperature at $m$ control points sampled
during the cooling phase at a single cell on the scan path centreline:
$ y = mat(delim: "[", T \( tau_1 \), T \( tau_2 \), dots.h.c, T \( tau_m \))^T in bb(R)^m \, $
where $tau_j = t_0 + Delta t_j$ and $t_0$ is the last time $T \( t \)$
crosses $T_(upright("liq"))$ from above, marking the onset of final
solidification. This anchoring ensures the control points capture the
cooling history that determines microstructure, regardless of any
trailing-laser-induced remelting. The tracked cell is located in the
middle of the scan path. Spatial invariance along the scan path
(Figure~@fig:invariance) ensures that outside of a small boundary region
cells at different positions experience essentially identical thermal
responses shifted in time, so optimizing at a single interior cell is
effectively identical to optimizing the entire track.

#figure(image("figs/invariance.png"),
  caption: [
    Spatial invariance: cells at different positions along the scan path
    experience identical thermal responses shifted in time. Peak-aligned
    responses collapse to a single curve.
  ]
)
<fig:invariance>

For a given input $u$ we can obtain a thermal response $y = P \( u \)$
from the plant $P : bb(R)^n arrow.r bb(R)^m$ by #emph[running an
experiment.] To help us optimize the process, we also have a simulation
$M : bb(R)^n arrow.r bb(R)^m$ that approximates $P$ by solving
#link(<eq:heat>)[\[eq:heat\]] numerically and can provide us with the
Jacobian $J = nabla M in bb(R)^(m times n)$ via reverse-mode automatic
differentiation in JAX-FEM~\[10\].

The target is a cooling profile through the solidification range, from
the solidus $T_(upright("sol")) = 1290$~K to the liquidus
$T_(upright("liq")) = 1600$~K (shaded in Figure~@fig:objective). Fast
cooling, typical of single-laser LPBF, produces columnar grains, whereas
slower cooling favours equiaxed grains~\[3\], \[4\], \[5\]\; the
trailing laser slows cooling by reheating behind the melt pool~\[7\].
LPBF solidification rates are on the order of $10^6$~K/s~\[3\], \[4\],
\[21\], so we set a target cooling rate
$dot(T)_(upright("target")) = - 2.5$~MK/s, slower than a single-laser
scan, as a representative microstructure-relevant setpoint rather than a
precise transition threshold. The profile is encoded by $m = 6$ control
points at offsets
$Delta t_j in { 0 \, 40 \, 80 \, 120 \, 160 \, 240 } med mu$s after
$t_0$, with targets
$T_j^(*) = { 1600 \, 1500 \, 1400 \, 1300 \, 1200 \, 1100 }$~K, four of
which lie within the solidification range.

#figure(image("figs/fig_baseline_vs_cp.svg"),
  caption: [
    Control point tracking objective. The single-laser baseline thermal
    response ($P_(L 1) = 50$~W, $P_(L 2) = 0$) evaluated on the plant
    heats above the liquidus, peaks near 2950~K, and cools rapidly back
    through the solidification region (shaded). Target temperatures
    $T_j^(*)$ (red diamonds) prescribe a cooling profile favouring
    equiaxed grains at $dot(T)_(upright("target")) = - 2.5$~MK/s from
    $T_(upright("liq"))$ at $t_0$.
  ]
)
<fig:objective>

= Iterative Learning Controller
<sec:ilc>
Our control objective is to determine $u in cal(U)$ that minimizes the
tracking error
$ f \( u \) = sum_(j = 1)^m #scale(x: 120%, y: 120%)[\(] T \( tau_j \; thin u \) - T_j^(*) #scale(x: 120%, y: 120%)[\)]^2 \, $<eq:objective>
where $T \( tau_j \; thin u \)$ are the temperature components of
$y = P \( u \)$ and $T_j^(*)$ are the target temperatures at the $m$
control points, as shown in Figure~@fig:objective.

Optimization-based ILC solves $min_(u in cal(U)) f \( u \)$ iteratively
by combining model gradients with plant feedback. We introduce the
predicted output $hat(y) in bb(R)^m$ as a decision variable and recast
the problem as $ min_(u \, hat(y)) quad & f \( hat(y) \)\
upright("subject to") quad & hat(y) = P \( u \) \, $<eq:opt_problem>
where $f \( hat(y) \) = sum_j \( hat(y)_j - T_j^(*) \)^2$.
Following~\[22\], we apply an iteration of sequential quadratic
programming (SQP) to~#link(<eq:opt_problem>)[\[eq:opt\_problem\]],
replacing the unavailable Jacobian of the true plant $nabla P$ with the
model Jacobian $J = nabla M$. The resulting QP subproblem is:
$ min_(Delta u \, Delta hat(y)) quad & 1 / 2 vec(Delta u, Delta hat(y))^(#h(-1em) T) B_k vec(Delta u, Delta hat(y)) + nabla f \( hat(y)_k \)^T Delta hat(y)\
upright("s.t.") quad & Delta hat(y) - J_k thin Delta u = y_k - hat(y)_k\
 & u_k + Delta u in cal(U) $<eq:qp> where $B_k$ is a Hessian
approximation, $J_k = nabla M \( u_k \) in bb(R)^(m times n)$ is the
model Jacobian, and $nabla f$ is the gradient of the cost with respect
to the predicted output. Each iteration requires one plant evaluation
and one model Jacobian computation. The
constraint~#ref(<eq:qp>); is a
linearization of $hat(y) = P \( u \)$ around $\( u_k \, hat(y)_k \)$,
with the right-hand side $y_k - hat(y)_k$ correcting for model mismatch
at each iteration.

Substituting the linearized
constraint~#ref(<eq:qp>); into the
objective~#ref(<eq:qp>); eliminates $Delta hat(y)$
and yields a quadratic program in the $n$ design variables alone. With
$Delta hat(y) = J_k thin Delta u + \( y_k - hat(y)_k \)$, the predicted
output after the step is
$hat(y)_k + Delta hat(y) = y_k + J_k thin Delta u$, so the objective
reduces to $lr(bar.v.double J_k thin Delta u + e_k bar.v.double)^2$ with
$e_k = y_k - T^(*) in bb(R)^m$ the tracking error. The resulting
#emph[reduced QP] is
$ min_(Delta u) quad & 1 / 2 thin Delta u^top B_(x \, k) thin Delta u + g_(x \, k)^top Delta u\
upright("s.t.") quad & u_k + Delta u in cal(U) \, $<eq:reduced_qp> where
$ g_(x,k) = J_k^top e_k $ <eq:reduced_grad> is the reduced gradient and
$B_(x \, k) in bb(R)^(n times n)$ approximates the reduced Hessian.
Formulation~#link(<eq:reduced_qp>)[\[eq:reduced\_qp\]] is equivalent
to~#link(<eq:qp>)[\[eq:qp\]] but is cheaper to solve and requires only
an $n times n$ BFGS update; we maintain $B_(x \, k)$ directly and never
form the full-space Hessian $B_k$. It also exposes the multi-fidelity
structure directly: the search direction is built from the model
Jacobian $J_k$, while the residual $e_k$ is set by the plant output
$y_k$, so plant feedback enters the gradient at every iteration.

The reduced QP~#link(<eq:reduced_qp>)[\[eq:reduced\_qp\]] is solved for
the step $Delta u$.

We refine the reduced Hessian $B_(x \, k)$ each iteration with a BFGS
update built from the design step $s_k = u_(k + 1) - u_k$ and the
gradient change $p_k = g_(x \, k + 1) - g_(x \, k)$:
$ B_(x \, k + 1) = B_(x \, k) + frac(p_k p_k^top, p_k^top s_k) - frac(B_(x \, k) thin s_k s_k^top B_(x \, k), s_k^top B_(x \, k) thin s_k) . $<eq:rbfgs>
When the curvature $s_k^top p_k$ falls below
$0.2 thin s_k^top B_(x \, k) s_k$, we apply Powell's damping: $p_k$ is
replaced by $tilde(p)_k = theta p_k + \( 1 - theta \) B_(x \, k) s_k$,
with $theta in \( 0 \, 1 \)$ chosen so that
$s_k^top tilde(p)_k = 0.2 thin s_k^top B_(x \, k) s_k$, which keeps
$B_(x \, k + 1)$ positive definite.

This procedure yields a compensator
$ u_(k + 1) = g \( u_k \, y_k \, k \) \, $<eq:compensator> which is
placed in closed-loop with the plant $ y_k = P \( u_k \) + w_k $ where
$w_k$ represents process/measurement noise, as illustrated in
Figure~@fig:block_diagram. Because additive manufacturing is inherently
repetitive, this trial-based formulation is natural: each iteration
corresponds to a scan, and the controller updates parameters between
trials.

#figure(image("figs/blockdiag.png"),
  caption: [
    ILC as a closed-loop controller in the iteration domain. The plant
    (top) is evaluated once per iteration. The compensator (dashed) uses
    $M$ and $J = nabla M$ to solve a QP, yielding
    $u_(k + 1) = g \( u_k \, y_k \, k \)$. The model determines where to
    step; the plant measurement determines how far off we are. The block
    $z^(- 1)$ denotes the unit delay in the iteration domain:
    $z^(- 1) u_(k + 1) = u_k$.
  ]
)
<fig:block_diagram>

The complete procedure is summarized in Algorithm~@alg:mfilc. Model-only
optimization provides the warm start $u_0$\; subsequent iterations
refine using plant feedback.

#block[
#block[
Plant $P$, Model $M$, Cost $f$, target $T^(*)$, tolerance $epsilon.alt$
Initialize: solve $min_u f \( M \( u \) \)$ for $u_0$\; set
$B_(x \, 0) = I$ Evaluate plant: $y_k = P \( u_k \)$ Compute model
Jacobian: $J_k = nabla M \( u_k \)$ Compute reduced gradient:
$g_(x \, k) = J_k^top \( y_k - T^(*) \)$ Solve reduced
QP~#link(<eq:reduced_qp>)[\[eq:reduced\_qp\]] for $Delta u$ Update:
$u_(k + 1) = u_k + Delta u$ Update $B_(x \, k + 1)$ via reduced-space
BFGS~#link(<eq:rbfgs>)[\[eq:rbfgs\]] $u_k$

]
]
#figure(
  kind: "algorithm",
  supplement: [Algorithm],
  caption: [Multi-Fidelity SQP-Based ILC],
  [
    *Inputs:* Plant $P$, model $M$, cost $f$, target $T^*$, tolerance $epsilon$.

    + Solve $min_u f(M(u))$ for $u_0$ and initialize $B_(x,0) = I$.
    + Evaluate $y_k = P(u_k)$ and compute $J_k = nabla M(u_k)$.
    + Compute $g_(x,k) = J_k^top (y_k - T^*)$.
    + Solve the reduced QP @eq:reduced_qp for $Delta u$.
    + Set $u_(k+1) = u_k + Delta u$ and update $B_(x,k+1)$ using reduced-space BFGS @eq:rbfgs.
    + Repeat the evaluation and update until $abs(f(u_k) - f(u_(k-1))) < epsilon$. Return $u_k$.
  ],
) <alg:mfilc>

= Simulation Study
<sec:simulation>
We validate the framework using two JAX-FEM thermal simulations~\[10\].
The high-fidelity (HF) simulation serves as the plant $P$, providing
temperature evaluations but no gradients to the optimizer. The
low-fidelity (LF) simulation serves as the model $M$, providing the
Jacobian $J = nabla M$ via reverse-mode automatic differentiation but
containing deliberate physical mismatch representative of real modelling
uncertainty. Both solve~#link(<eq:heat>)[\[eq:heat\]] with Inconel~625
properties (Table~@tab:material) and beam radius
$r_b = 50 med mu upright(m)$. The algorithm is initialized from 7 random
starting points sampled across $cal(U)$ to account for non-convexity and
to characterize convergence reliability.

#block[
#figure(
  align(center)[#table(
    columns: 3,
    align: (left,center,center,),
    table.header([Property], [Value], [Units],),
    table.hline(),
    [Thermal conductivity $k$ (solid)], [15.0], [W/(m$dot.op$K)],
    [Density $rho$], [8440], [kg/m$""^3$],
    [Specific heat $c_p$], [588], [J/(kg$dot.op$K)],
    [Liquidus temperature $T_(upright("liq"))$], [1600], [K],
    [Solidus temperature $T_(upright("sol"))$], [1290], [K],
    [Latent heat of fusion $L_f$], [227], [kJ/kg],
  )]
  , caption: [Material properties for Inconel~625.]
  , kind: table
  ) <tab:material>

]
Table~@tab:model_config summarizes the two configurations. We introduce
mismatch on three quantities that are genuinely uncertain in practice
for LPBF. The effective absorptivity governing laser energy coupling is
uncertain in LPBF, varying with powder state and melt-pool
regime~\[23\]\; we use $eta$ = 0.25 (plant) and 0.20 (model) as
representative values, introducing the difference as model mismatch.
Latent heat of fusion is included in the plant via the
apparent-heat-capacity method, which raises the specific heat by
$L_f \/ \( T_(upright("liq")) - T_(upright("sol")) \)$ across the
freezing range (more than doubling it in the solidification region), and
is omitted from the model. The effective thermal conductivity of the
powder bed is an uncertain parameter in LPBF, depending strongly on bed
porosity~\[24\]. The HF model uses $k = 8$~W/(m$dot.op$K) as a
porosity-corrected effective value, while the LF model uses the bulk
solid value $k = 15$~W/(m$dot.op$K), reflecting the common
fast-surrogate simplification of treating the build region as fully
consolidated. The HF model does not include a vaporization sink, so peak
temperatures above approximately 3000~K should be read as numerical
artifacts rather than physical predictions. The cost function and
reported metrics are evaluated in the solidification region (1290 to
1600~K), which is governed by conduction and is unaffected by the
missing vapour physics.

#block[
#figure(
  align(center)[#table(
    columns: 3,
    align: (left,center,center,),
    table.header([Parameter], [HF (Plant)], [LF (Model)],),
    table.hline(),
    [Absorption coeff. $eta$], [0.25], [0.20],
    [Latent heat], [Active ($c_(p \, upright("eff"))$)], [Off],
    [Powder-bed $k$ (W/(m$dot.op$K))], [8.0], [15.0],
    [Mesh (relative)], [Full], [$2.0 times$ coarser],
  )]
  , caption: [Model configurations for plant (HF) and surrogate (LF).]
  , kind: table
  ) <tab:model_config>

]
Figure~@fig:mismatch illustrates the cumulative effect of these
mismatches: for identical leading-laser-only input, the plant and the
model produce thermal responses that differ in both peak temperature and
cooling-rate structure through the solidification region. Parameters
optimized on the LF model alone are not guaranteed to be optimal, or
even good, when applied to the plant.

#figure(image("figs/fig_lf_hf_comparison_eta020_lx10_mc20_50W.png"),
  caption: [
    Thermal response (left) and cooling rate (right) of plant (HF:
    $eta = 0.25$, $k = 8$, latent heat on) and model (LF: $eta = 0.20$,
    $k = 15$, no latent heat) at identical input. The plant exhibits
    both reduced peak temperature and structurally different cooling
    rate through the solidification region (shaded).
  ]
)
<fig:mismatch>

We compare two cases, both evaluated on the plant:

+ #strong[Model-only (MO)]: minimize $f \( M \( u \) \)$ on the LF
  model, apply result to the plant without feedback.

+ #strong[ILC]: optimize using LF gradients with plant feedback
  (Algorithm~@alg:mfilc).

The MO case represents current practice: parameters are tuned offline on
a simulation and applied open loop. ILC instead corrects for model
mismatch iteratively using plant measurements, mimicking operation on
hardware with thermal monitoring.

= Single-line geometry: results
<sec:results>
We evaluate the controller on the powder-bed mismatch configuration
described in Section~@sec:simulation, with 7 initial conditions for each
of ILC and MO.

== Initial conditions (seeds) and convergence
<initial-conditions-seeds-and-convergence>
We refer to each random starting point $u_0 in cal(U)$ as a #emph[seed]:
a seed is just an initial condition for both ILC and MO, sampled across
$cal(U)$ to characterize how the controller behaves under different
starting points. Figure~@fig:convergence shows convergence of the plant
cost $J \( u_k \)$ across iterations for both methods. The ILC
trajectory uses plant feedback at every step and converges to a tight
band across 7 seeds. The MO trajectory differs between fidelities: the
LF cost (dashed) descends monotonically while MO optimizes against its
own model, but the HF cost (solid) at the same iterates stays well above
the ILC band. MO's best plant cost is 127,329 with coefficient of
variation 6.4, while its LF cost reaches 57,676. The gap between MO's LF
and HF traces is the model-plant mismatch; ILC closes it iteratively by
using plant measurements to correct the LF gradients.

#figure(image("figs/fig_convergence.svg"),
  caption: [
    Convergence of cost $J \( u_k \)$ over 7 initial conditions, shaded
    envelopes across seeds. ILC (green) uses plant feedback at each
    iteration and decreases by an order of magnitude. MO's LF cost
    (orange dashed) descends monotonically; its HF reeval (orange solid)
    plateaus far above ILC. Blue dotted: single-laser baseline at
    $P_(L 1) = 50$~W. The vertical gap between MO's LF and HF traces is
    the model-plant mismatch ILC closes.
  ]
)
<fig:convergence>

== Convergence history at a single seed
<sec:results:perseed>
Figure~@fig:perseed shows the convergence at a single representative
seed (seed~7), the seed for which we currently have the most complete MO
HF reeval data. ILC reduces the plant cost by over an order of
magnitude; MO descends modestly on its LF objective and plateaus, and
its plant cost (HF reeval) stays at roughly $10^5$~K$""^2$ throughout.
The two methods reach qualitatively different parameter regions. ILC
settles on a fast scan with the leading-laser power at its lower bound,
reaching the target by removing energy. MO settles on a hot
configuration with the trailing laser near its upper bound and a slow
scan, reaching its LF target by adding energy. That strategy overshoots
on the plant (Section~@sec:results:thermal).

#figure(image("figs/fig_convergence_seed7.svg"),
  caption: [
    Per-seed dynamics (seed~7). ILC (green) and MO (orange) overlaid.
    Top-left: cost $J$ -- ILC on the HF plant (solid green), MO on the
    LF model (dashed orange), and MO re-evaluated on the HF plant at the
    iterates where that data is available (solid orange). Top-right:
    $P_(L 1)$ and $P_(L 2)$ (W). Bottom-left: lag $d$ ($mu$m).
    Bottom-right: scan velocity $v$ (m/s). ILC and MO converge to
    qualitatively different regions of the design space.
  ]
)
<fig:perseed>

== Thermal profile tracking
<sec:results:thermal>
Figure~@fig:profiles compares the thermal response at the tracked cell,
evaluated on the plant, for three cases at seed~7: baseline single-laser
($P_(L 2) = 0$), ILC-optimized, and MO-optimized. ILC tracks the target
control points (red diamonds) closely through the solidification region,
with a mean cooling rate of $- 2.34$~MK/s against the target
$- 2.50$~MK/s (a deviation of 6%). The single-laser baseline cools too
fast (mean $- 2.96$~MK/s, 18% faster than target) and drops below the
target profile shortly after $t_0$. The MO-optimized trace differs from
the target qualitatively, cooling at $- 1.36$~MK/s (roughly half the
target rate) and stays well above the target through the solidification
region.

MO and ILC solve the same reduced
QP~#link(<eq:reduced_qp>)[\[eq:reduced\_qp\]] and differ only in the
residual used to form the reduced gradient $g_(x \, k) = J_k^top e_k$:
the model residual $M \( u \) - T^(*)$ for MO and the plant residual
$P \( u \) - T^(*)$ for ILC. The LF model runs cooler and loses heat
faster than the plant ($k_(upright("LF")) = 15$
vs.~$k_(upright("HF")) = 8$~W/(m$dot.op$K), no latent heat), so the two
residuals lie on opposite sides of $T^(*)$ and the resulting gradients
point in opposite directions. MO raises the energy input (higher powers,
slower scan, shorter lag) to correct an error present only in its model;
on the plant the excess energy holds the cell hot, producing the
slow-cooling trace in Figure~@fig:profiles. ILC, with the residual
evaluated on the plant, lowers the energy input instead
(Figure~@fig:perseed). MO converges to a minimizer of the model cost,
and the model error appears unattenuated in the plant response at that
solution. In ILC the model only determines the search direction; because
the residual is evaluated on the plant, errors in the predicted thermal
response are compensated from one iteration to the next, and the final
iterate reflects plant measurements rather than model predictions. The
method therefore tolerates substantial model error, provided the model
gradients remain descent directions for the plant cost.

#figure(image("figs/fig_thermal_response_seed7.svg"),
  caption: [
    Thermal-profile tracking at the tracked cell on the plant for
    seed~7. Top: $T \( t \)$ aligned at $t_0$ for baseline (blue,
    $P_(L 1) = 50$~W, $P_(L 2) = 0$, $v = 0.50$~m/s), ILC (green,
    $25.0$/$43.5$~W, $d = 138 med mu$m, $v = 0.92$~m/s), and MO (orange,
    $63.8$/$96.3$~W, $d = 37 med mu$m, $v = 0.39$~m/s); target control
    points (red diamonds, dashed) prescribe $- 2.5$~MK/s through the
    solidification region (shaded). Bottom: cooling rate
    $dot(T) \( t \)$ with target step-rate (dashed red). ILC tracks the
    target; baseline cools too fast and drops below; MO -- driven by LF
    model mismatch -- holds the cell hot at roughly half the target
    rate.
  ]
)
<fig:profiles>

= Non-single-line geometry
<sec:results:zigzag>
AM scan paths are not globally repetitive: ILC's iteration-domain
formulation assumes the same scan is repeated each trial, while in
practice each layer is composed of strokes joined by corners and
direction reversals. We use a three-stroke zigzag (Figure~@fig:zigzag)
with layer stacking as a robustness check: we hold the single-line ILC
parameters fixed and apply them to the zigzag without re-optimizing, and
we monitor the thermal response at two locations along the path: a
stroke midpoint (M, representative of the straight section) and a turn
vertex (V, the corner that accumulates the most heat from the
scan-direction reversal) -- to test whether the qualitative improvement
still holds.

At both monitors the controlled scan tracks the target cooling profile
through the solidification region more closely than the single-laser
baseline, which cools too fast. The controlled scan extends the time
spent in the solidification region by 480% at the stroke midpoint and
364% at the turn vertex relative to the baseline. The vertex is the
worst case for transfer where heat accumulates at the scan-direction
reversal, and the controlled response runs hotter than the target there
(Figure~@fig:zigzag), but remains far closer to the target profile than
the baseline. Peak temperatures under control are higher than the
baseline at both locations but peak temperature is not the controlled
quantity, and the improvement appears in the cooling rate through the
solidification region, which is. The parameters were optimized on a
single straight line and applied to the zigzag without re-optimization,
showing the controller's benefit is not specific to the straight-line
setup it was tuned on.

#figure(image("figs/fig_zigzag.svg"),
  caption: [
    Transfer of ILC-optimized parameters to a three-stroke zigzag scan
    with a velocity profile through corners. Top: geometry with two
    monitors -- stroke midpoint (M) and turn vertex (V). Bottom:
    $t_0$-aligned thermal response at each monitor for baseline (blue)
    and ILC-controlled (green); target control points are red diamonds
    along the dashed target line, solidification region (1290--1600~K)
    shaded. Both monitors track the target cooling profile under
    control; the baseline cools too fast. Peaks (off-screen, left of
    $t_0$) are higher under control because the trailing laser adds
    energy to an already-hot leading-laser pass; cooling rate, not peak
    temperature, is the controlled quantity.
  ]
)
<fig:zigzag>

= Conclusion
<sec:conclusion>
We presented an SQP-based iterative learning control framework for
dual-laser LPBF that tracks a cooling profile favouring equiaxed grains
by optimizing the leading and trailing laser powers, lag distance, and
scan velocity. Across 7 initial conditions, ILC reaches a tight band of
plant solutions (CV 5.6%) within roughly 20 iterations, despite
realistic mismatch in absorption, latent heat treatment, and powder-bed
conductivity. Model-only optimization converges to the LF optimum with
parameter selections that overshoot the target cooling profile when
evaluated on the plant. The framework requires no algorithmic changes to
deploy on hardware with pyrometer feedback. Future work includes
experimental validation and extension to spatially varying control along
the scan path.

#block[
#block[
\[1\] T. DebRoy #emph[et al.], “Additive manufacturing of metallic
components--process, structure and properties,” #emph[Progress in
materials science], vol. 92, pp. 112--224, 2018.

] <ref-debroy2018additive>
#block[
\[2\] H. Y. Chia, J. Wu, X. Wang, and W. Yan, “Process parameter
optimization of metal additive manufacturing: A review and outlook,”
#emph[Journal of Materials Informatics], vol. 2, no. 4, pp. N--A, 2022.

] <ref-chia2022process>
#block[
\[3\] W. Kurz, C. Bezençon, and M. Gäumann, “Columnar to equiaxed
transition in solidification processing,” #emph[Science and technology
of advanced materials], vol. 2, no. 1, pp. 185--191, 2001.

] <ref-kurz2001columnar>
#block[
\[4\] J. D. Hunt, “Steady state columnar and equiaxed growth of
dendrites and eutectic,” #emph[Materials science and engineering], vol.
65, no. 1, pp. 75--83, 1984.

] <ref-hunt1984steady>
#block[
\[5\] M. Gäumann, C. Bezençon, P. Canalis, and W. Kurz, “Single-crystal
laser deposition of superalloys: Processing--microstructure maps,”
#emph[Acta materialia], vol. 49, no. 6, pp. 1051--1062, 2001.

] <ref-gaumann2001single>
#block[
\[6\] W. Zhang, W. M. Abbott, A. Sasnauskas, and R. Lupoi, “Process
parameters optimisation for mitigating residual stress in dual-laser
beam powder bed fusion additive manufacturing,” #emph[Metals], vol. 12,
no. 3, p. 420, 2022.

] <ref-zhang2022process>
#block[
\[7\] S. Bergmueller, J. Scheiber, L. Kaserer, and G. Leichtfried,
“Enhancing equiaxed grain formation in a high-alloy tool steel using
dual laser powder bed fusion,” #emph[Additive Manufacturing], vol. 74,
p. 103727, 2023.

] <ref-bergmueller2023enhancing>
#block[
\[8\] M. Vanini, S. Searle, L. Vanmunster, K. Vanmeensel, and B.
Vrancken, “Local microstructure engineering of super duplex stainless
steel via dual laser powder bed fusion--an analytical modeling and
experimental approach,” #emph[Additive Manufacturing], p. 104994, 2025.

] <ref-vanini2025local>
#block[
\[9\] B. Shahriari, K. Swersky, Z. Wang, R. P. Adams, and N. De Freitas,
“Taking the human out of the loop: A review of bayesian optimization,”
#emph[Proceedings of the IEEE], vol. 104, no. 1, pp. 148--175, 2015.

] <ref-shahriari2015taking>
#block[
\[10\] T. Xue #emph[et al.], “JAX-FEM: A differentiable GPU-accelerated
3D finite element solver for automatic inverse design and mechanistic
data science,” #emph[Computer Physics Communications], vol. 291, p.
108802, 2023.

] <ref-xue2023jax>
#block[
\[11\] D. A. Bristow, M. Tharayil, and A. G. Alleyne, “A survey of
iterative learning control,” #emph[IEEE control systems magazine], vol.
26, no. 3, pp. 96--114, 2006.

] <ref-bristow2006survey>
#block[
\[12\] Y. Wang, F. Gao, and F. J. Doyle III, “Survey on iterative
learning control, repetitive control, and run-to-run control,”
#emph[Journal of process control], vol. 19, no. 10, pp. 1589--1600,
\2009.

] <ref-wang2009survey>
#block[
\[13\] D. H. Owens and J. Hätönen, “Iterative learning control---an
optimization paradigm,” #emph[Annual reviews in control], vol. 29, no.
1, pp. 57--70, 2005.

] <ref-owens2005iterative>
#block[
\[14\] S. Mishra, U. Topcu, and M. Tomizuka, “Optimization-based
constrained iterative learning control,” #emph[IEEE Transactions on
Control Systems Technology], vol. 19, no. 6, pp. 1613--1621, 2010.

] <ref-mishra2010optimization>
#block[
\[15\] D. Liao-McPherson, E. C. Balta, A. Rupenyan, and J. Lygeros, “On
robustness in optimization-based constrained iterative learning
control,” #emph[IEEE Control Systems Letters], vol. 6, pp. 2846--2851,
\2022.

] <ref-liao2022robustness>
#block[
\[16\] M. J. Spector, Y. Guo, S. Roy, M. O. Bloomfield, A. Maniatty, and
S. Mishra, “Passivity-based iterative learning control design for
selective laser melting,” in #emph[2018 annual american control
conference (ACC)], IEEE, 2018, pp. 5618--5625.

] <ref-spector2018passivity>
#block[
\[17\] U. Inyang-Udoh, R. Hu, S. Mishra, J. Wen, and A. Maniatty,
“Model-free multi-objective iterative learning control for selective
laser melting,” in #emph[2022 american control conference (ACC)], IEEE,
2022, pp. 2879--2885.

] <ref-inyang2022model>
#block[
\[18\] D. Liao-McPherson, E. C. Balta, M. Afrasiabi, A. Rupenyan, M.
Bambach, and J. Lygeros, “Layer-to-layer melt pool control in laser
powder bed fusion,” #emph[IEEE transactions on control systems
technology], vol. 33, no. 1, pp. 207--218, 2024.

] <ref-liao2024layer>
#block[
\[19\] B. Kavas, E. C. Balta, L. Witte, M. R. Tucker, J. Lygeros, and M.
Bambach, “Layer-to-layer closed-loop switched heating and cooling
control of the laser powder bed fusion process,” #emph[arXiv preprint
arXiv:2512.17518], 2025.

] <ref-kavas2025layer>
#block[
\[20\] E. C. Balta, D. M. Tilbury, and K. Barton, “Iterative learning
spatial height control for layerwise processes,” #emph[Automatica], vol.
167, p. 111756, 2024.

] <ref-balta2024iterative>
#block[
\[21\] G. Marchese, G. Piscopo, S. Lerda, A. Salmi, E. Atzeni, and S.
Biamino, “Heat-treated inconel 625 by laser powder bed fusion:
Microstructure, tensile properties, and residual stress evolution,”
#emph[Journal of Materials Engineering and Performance], vol. 33, no.
13, pp. 6825--6834, 2024.

] <ref-marchese2024heat>
#block[
\[22\] S. Balula, E. C. Balta, D. Liao-McPherson, A. Rupenyan, and J.
Lygeros, “Sequential quadratic programming-based iterative learning
control for nonlinear systems,” in #emph[2023 IEEE conference on control
technology and applications (CCTA)], IEEE, 2023, pp. 162--167.

] <ref-balula2023sequential>
#block[
\[23\] J. Trapp, A. M. Rubenchik, G. Guss, and M. J. Matthews, “In situ
absorptivity measurements of metallic powders during laser powder-bed
fusion additive manufacturing,” #emph[Applied Materials Today], vol. 9,
pp. 341--349, 2017.

] <ref-trapp2017situ>
#block[
\[24\] S. Zhang, B. Lane, J. Whiting, and K. Chou, “On thermal
properties of metallic powder in laser powder bed fusion additive
manufacturing,” #emph[Journal of manufacturing processes], vol. 47, pp.
382--392, 2019.

] <ref-zhang2019thermal>
] <refs>
