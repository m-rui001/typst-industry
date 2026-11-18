// Sasse et al., arXiv:2609.27602v1. Converted from the authors’ LaTeX under CC BY 4.0.
// https://arxiv.org/abs/2609.27602v1 | https://creativecommons.org/licenses/by/4.0/
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
  title: [Efficient Geometry Representation Strategies for the Shape
Optimization of Profile Extrusion Dies],
  authors: (
    ( name: [Jana Sasse, Maximilian Esser, Markus Mügge, Stefan Turek],
      affiliation: "",
      email: "" ),
    ),
  abstract-title: [Abstract],
  abstract: [The design of profile extrusion dies remains a challenging
task due to the complex rheological behavior of polymer melts and the
geometric intricacies of flow channels. Traditional manual optimization
approaches, which rely heavily on human experience, are inefficient and
often employ unvalidated heuristics. To address these challenges, we
present a deterministic and explainable framework for automatic die
design based on adjoint-based shape optimization. This approach enables
the computation of sensitivities that directly indicate beneficial
modifications to the flow channel geometry. A major difficulty in such
optimization processes lies in generating boundary-conforming meshes
that evolve consistently with changing geometries. To overcome this
issue, we employ non-boundary conforming geometry representation methods
that eliminate the need for an explicit surface representation along
physical boundaries. A dedicated reconstruction technique is developed
to recover accurate sensitivity information at the virtual interface
between fluid and solid regions. The proposed algorithm is demonstrated
on 3D geometries with varying complexity, including realistic extrusion
die flow channels. Several objective functionals relevant to industrial
applications, such as flow balance at the outflow, are considered. The
results highlight significant improvements in performance metrics while
maintaining numerical robustness. This work showcases the potential of
adjoint-based techniques for automated die design in a domain still
largely governed by manual trial-and-error procedures, establishing a
foundation for data-efficient, sustainable manufacturing workflows using
computational rheology.

],
  pagenumbering: "1",
  cols: 1,
  doc,
)


#strong[#emph[Keywords---]] CFD, Fictitious Boundary Method, Immersed
Boundary Method, Shape Optimization, Extrusion

#set heading(numbering: "1.1")
#set math.equation(numbering: "(1)")

= Introduction
<introduction>
The design of the flow channel in profile extrusion dies remains
challenging. The optimal flow channel geometry creates a uniform outflow
velocity profile. However, this is highly dependent on the operating
point, i.e., the throughput, processing temperature, and
thermo-rheological properties of the plastic melt. As a result,
extrusion die design still relies heavily on manual design iterations.

The last years have seen an emergence of computational methods for
extrusion die design. However, these methods face various numerical
challenges. For complex 3D geometries, the modeling of the computational
domain alone is a non-trivial task. In addition, the extruded plastic
melt exhibits a complex rheological behavior, since it is
shear-thinning, viscoelastic and temperature-dependent. Furthermore, the
computational cost of established optimization methods~\[1\] is also
significant due to the associated number of solver calls. Adjoint-based
sensitivities are a promising alternative at low computational cost~\[3,
2, 4\].

The goal of the research presented in this paper is to identify the most
efficient method for adjoint-based optimization of complex profile
extrusion dies. This includes the most efficient geometry representation
strategy, but also the best strategy for the sensitivity-based
optimization algorithm.

= Numerical Modeling
<numerical-modeling>
== Geometry Representation Strategies
<sec:Geometry>
The most common method employs a body-fitted mesh that describes the
entire fluid domain. While this method has the advantage that it
operates on the \"exact representation\" of the flow channel geometry,
it also comes with its drawbacks. For complex flow channel geometries,
the computational cost of the mesh generation becomes prohibitively
expensive. In addition, large deformations of the flow channel during
the optimization process often require re-meshing during runtime.

Non-boundary conforming methods offer an alternative approach to
geometry representation. In this paper we will consider two methods,
although there are even more established approaches. The fictitious
boundary method~(FBM)~\[5\] is an implicit non-boundary conforming
method that employs an indicator function $tilde(alpha) \( X \)$ to mask
points in the fluid domain.

$ tilde(alpha) \( X \) = { 1 & upright("for ") X in Omega_f\
0 & upright("for ") X in Omega without Omega_f $

The Navier-Stokes equations are then solved on the filtered domain
$Omega_f$.

The immersed boundary method~(IBM)~\[6, 4\] is an explicit non-boundary
conforming method that locally blocks the flow by assigning a
pseudo-porosity $alpha \( X \)$ to each cell of the computational mesh.

$ alpha \( X \) = { 0 & upright("for ") X in Omega_f\
alpha_(m a x) & upright("for ") X in Omega_s $

The numerical solution is then obtained by solving the extended
Navier-Stokes equations on $Omega = Omega_f union Omega_s$:

$ nabla dot.op upright(bold(u)) & = 0\
rho (upright(bold(u)) dot.op nabla) upright(bold(u)) - nabla dot.op sigma \( upright(bold(u \, p)) \) med + alpha upright(bold(u)) & = 0 $

Both non-boundary conforming methods enable computationally cheap mesh
generation that is independent of the geometric complexity of the flow
channel. However, this comes at a loss of accuracy, particularly at the
interface. While the interface in FBM can be recovered through
evaluation of the gradient of the indicator function
$nabla tilde(alpha) \( X \)$, that information is lost in IBM. This,
however, is not necessarily an advantage for FBM, since any data
projected to the interface are prone to artifacts in areas with
insufficient co-planarity between the background mesh and the interface.
As a result, IBM can sometimes be more robust regarding interface
artifacts or instabilities. However, this comes at the additional cost
of interface reconstruction for later processing of the optimization
result.

== Adjoint-based Optimization
<sec:Opt>
The goal of adjoint-based optimization is to minimize an objective
functional $J$ under the PDE constraints $R$, which in this case arise
from the incompressible steady Navier-Stokes equations:

$ min_(upright(bold(b))) J \( chi \, upright(bold(b)) \) quad upright("s. t. ") upright(bold(R)) \( chi \, upright(bold(b)) \) = upright(bold(0)) $

The idea is to introduce a Lagrange functional $L$ with Lagrange
multipliers~$lambda$, also called the adjoint variables:

$ L := J + integral_Omega lambda R d Omega $

This allows for an optimization of a suitable design variable
$upright(bold(b))$ through a gradient descent method
(Eq.~@eq:gradientdescent), where the gradient is provided by the
directional derivative of the Lagrange functional with respect to the
design variable, also known as the design sensitivity:

$ upright(bold(b))_(n + 1) = upright(bold(b))_n - Delta frac(partial L \( upright(bold(b))_n \), partial upright(bold(b))_n) $<eq:gradientdescent>

This directional derivative of the Lagrange functional can be calculated
after solving the primal state equations and their adjoint problem in
only two solver calls~\[2, 3, 4\]. The primal problem can be stated as:
Find $\( upright(bold(u)) \, p \, mu \)$ of sufficient regularity
holding

$ rho \( upright(bold(u)) dot.op nabla \) upright(bold(u)) - nabla dot.op sigma \( upright(bold(u)) \, p \, mu \) + alpha upright(bold(u)) & = 0 \, & upright("in ") #h(0em) Omega \,\
nabla dot.op upright(bold(u)) & = 0 & upright("in") #h(0em) Omega \,\
mu - F \( dot(gamma) \) & = 0 & upright("in") #h(0em) Omega \,\
upright(bold(u)) & = upright(bold(u))_0 & upright("on") #h(0em) partial Omega_(upright("in")) \,\
upright(bold(u)) & = 0 & upright("on") #h(0em) partial Omega without \( partial Omega_(upright("in")) union partial Omega_(upright("out")) \) \,\
\( 2 mu upright(bold(D)) \( upright(bold(u)) \) - p upright(bold(I)) \) dot.op upright(bold(n)) & = 0 & upright("on") #h(0em) partial Omega_(upright("out")) \,\
sigma \( upright(bold(u)) \, p \, mu \) & := \( 2 mu upright(bold(D)) \( upright(bold(u)) \) - upright(bold(I)) p \) \, &  $<eq:primalMomentum>

where Eq.~@eq:primalMomentum is an auxiliary problem needed for the
shear-rate dependent viscosity in the adjoint model~\[2\]. The
corresponding adjoint model reads: Given the primal solution
$\( upright(bold(u)) \, p \, mu \)$, find
$\( upright(bold(u))_a \, p_a \)$ holding

$  & frac(partial j_Omega, partial upright(bold(u))) + rho (upright(bold(u)) dot.op nabla) upright(bold(u_a)) - rho (upright(bold(u_a)) dot.op nabla) upright(bold(u)) - sigma \( upright(bold(u_a)) \, p_a \, mu \) + nabla dot.op (mu_a upright(bold(X))) + alpha upright(bold(u)) = 0 & upright("in") #h(0em) Omega \,\
 & nabla dot.op upright(bold(u_a)) - frac(partial j_Omega, partial p) = 0 & upright("in") #h(0em) Omega \,\
 & frac(partial j_Omega, partial mu) + 2 upright(bold(D)) \( upright(bold(u)) \) : upright(bold(D)) \( upright(bold(u_a)) \) + mu_a = 0 & upright("in") #h(0em) Omega \,\
 & upright(bold(u_a)) \|_t = 0 \, #h(0em) upright(bold(u_a)) \|_(upright(bold(n))) = - frac(partial j_Gamma, partial p) & upright("on") #h(0em) partial Omega without partial Omega_(upright("out")) \,\
 & sigma \( upright(bold(u_a)) \, p_a \, mu \) dot.op upright(bold(n)) = - frac(partial j_Gamma, partial upright(bold(u))) - rho upright(bold(u_a)) \( upright(bold(u)) dot.op upright(bold(n)) \) + mu_a upright(bold(X)) dot.op upright(bold(n)) & upright("on") #h(0em) partial Omega_(upright("out")) \,\
 & mu = F \( dot(gamma) \) \, & \
 & upright(bold(X)) := 2 dot(gamma)^(- 1) F' \( dot(gamma) \) upright(bold(D)) \( upright(bold(u)) \) \, & \
 & mu_a = - 2 upright(bold(D)) \( upright(bold(u)) \) : upright(bold(D)) \( upright(bold(u_a)) \) - frac(partial j_Omega, partial mu) . &  $<eq:adjointMomentum>

Note that the highlighted term $+ alpha upright(bold(u))$ in
Eq.~@eq:primalMomentum and Eq.~@eq:adjointMomentum is only added when
using IBM. The solution of the primal and adjoint system is then used to
calculate the design sensitivity for the optimization of the flow
channel geometry.

Adjoint-based optimization can be performed using two approaches, shape
optimization and topology optimization~\[3\]. In shape optimization, the
design variable is the localized surface normal displacement $beta$ on
the nodes of the design boundary. The corresponding surface sensitivity
$sigma_beta$ is calculated as

$ delta_b L dot.op delta upright(bold(b)) = sigma_beta = [- 2 mu upright(bold(D)) \( upright(bold(u_a)) \) dot.op upright(bold(n)) + mu_a 2 dot(gamma)^(- 1) F' \( dot(gamma) \) upright(bold(D)) \( upright(bold(u)) \) dot.op upright(bold(n))] dot.op frac(partial upright(bold(u)), partial upright(bold(n))) . $

The shape update is then performed by moving the points on the design
boundary according to the localized surface normal displacements $beta$
and performing a subsequent smoothing step on the inner nodes of the
mesh. Topology optimization, on the other hand, offers more design
freedom since it is not restricted to the initial topology of the design
boundary. For our purpose, the design variable is the IBM variable
$alpha$ and the corresponding volume sensitivity $sigma_(alpha_i)$ for
each cell $i$ of the computational mesh is calculated using the local
cell volume $V_i$ with

$ delta_b L dot.op delta upright(bold(b)) = sigma_(alpha_i) = u_(a \, i) dot.op u_i V_i . $<eq:VolSenseCalc>

The subsequent topology update ($n arrow.r n + 1$) is performed using a
gradient-based update scheme

$ alpha_(n + 1) = alpha_n \( 1 + gamma \) + gamma min \( max \( alpha_n - lambda^(*) sigma_alpha \, 0 \) \, alpha_(m a x) \) $<eq:VolSenseUpdate>

where $gamma$ and $lambda^(*)$ refer to an underrelaxation factor and
the response step size, respectively. While this approach offers more
design freedom, it can also require additional geometric constraints to
ensure optimization results that are also viable from an engineering
perspective.

== Discussion
<discussion>
The geometry representation strategies presented in Sec.~@sec:Geometry
and the optimization algorithms presented in Sec.~@sec:Opt allow for
different algorithm pairings. However, not all of them are equally
suitable for a successful optimization for profile extrusion dies. Both
shape optimization using an IBM approach and topology optimization using
an FBM approach are not feasible within the described framework since
the involved components are inherently incompatible.

#figure([#figure(image("images/profileKTP_aligned_surfacesense_000_V2.png", width: 99.0%),
    caption: [
      Surface sensitivities calculated with aligned mesh.
    ]
  )
  <fig:AlignedSurfaceSense>

  #figure(image("images/profileKTP_FDM_volumesense_000_V3.png", width: 99.0%),
    caption: [
      Volume sensitivities calculated using IBM.
    ]
  )
  <fig:IBMVolumeSense>

  #figure(image("images/profileKTP_aligned_surfacesense_009_V2.png", width: 99.0%),
    caption: [
      Resulting flow channel update with aligned mesh.
    ]
  )
  <fig:AlignedSurfaceSenseUpdate>

  #figure(image("images/profileKTP_FDM_volumesense_018_V3.png", width: 99.0%),
    caption: [
      Resulting flow channel update using IBM.
    ]
  )
  <fig:IBMVolumeSenseUpdate>

  ],
  caption: [
    Suitable geometry modeling and optimization strategy pairings for a
    complex flow channel.
  ]
)
<fig:SuitablePairingsProfileKTP>

The most intuitive methods are shape optimization using an aligned mesh
(see Fig.~@fig:AlignedSurfaceSense) and topology optimization using IBM
(see Fig.~@fig:IBMVolumeSense). While the former leads to a visually
superior sensitivity distribution, the optimization result will depend a
lot on the computational mesh. The difference becomes apparent in
Fig.~@fig:AlignedSurfaceSenseUpdate and Fig.~@fig:IBMVolumeSenseUpdate,
where the pattern of the underlying computational mesh dictates the
shape of the optimized surface. As a result, any aligned mesh used for
this purpose has to adhere to even more restrictions than are usually
imposed on meshes for computational fluid dynamics. This makes topology
optimization using IBM the less \"pretty\" but more robust choice for an
optimization algorithm for complex geometries.

#figure([#figure(image("images/flatsheet_aligned_surfacesense_000_V4.png", width: 99.0%),
    caption: [
      Surface sensitivities on an aligned mesh. \
      .
    ]
  )
  <fig:FlatsheetAlignedSurfaceSense>

  #figure(image("images/flatsheet_FBM_surfacesense_000_V4.png", width: 99.0%),
    caption: [
      Surface sensitivities calculated using FBM \
      with a co-planar interface.
    ]
  )
  <fig:FlatsheetFBMSurfaceSense>

  #figure(image("images/profileKTP_FBM_surfacesense_000_V2.png", width: 99.0%),
    caption: [
      Surface sensitivities calculated using FBM \
      with no co-planar interface.
    ]
  )
  <fig:FBMSurfaceSense>

  #figure(image("images/profileKTP_FBM_staircase.png", width: 99.0%),
    caption: [
      Staircase pattern in filtered FBM domain \
      due to no co-planar interface.
    ]
  )
  <fig:FBMStaircase>

  ],
  caption: [
    Example where FBM leads to artifacts in the calculated surface
    sensitivity.
  ]
)
<fig:NotSuitablePairingsProfileKTP>

Topology optimization with an aligned mesh can work. However, this
requires an appropriate interface resolution and is usually not feasible
for complex geometries. Shape optimization using an FBM geometry
representation can be successful. Fig.~@fig:FlatsheetAlignedSurfaceSense
and Fig.~@fig:FlatsheetFBMSurfaceSense depict the surface sensitivity
for a flatsheet extrusion die using both an aligned mesh and FBM.
However, this approach breaks down as soon as the interface is not
co-planar with the background mesh. Revisiting the example given in
Figs.~#ref(<fig:AlignedSurfaceSense>, supplement: none);–@fig:IBMVolumeSense, the surface of the
flow channel is not co-planar with the background mesh (see
Fig.~@fig:FBMStaircase). As a result, the projection of the local
velocity to the interface leads to wave-patterned artifacts (see
Fig.~@fig:FBMSurfaceSense). While these can be reduced by smoothing,
this approach risks removing real results in the process.

As a result, the immersed boundary method combined with a topology
optimization algorithm appears to be the most versatile method for use
cases with industrial relevance. However, shape optimization with
aligned meshes will still produce the most reliable result, provided an
appropriate aligned mesh is available.

= Application to Profile Extrusion
<application-to-profile-extrusion>
== Setup and Numerical Model
<setup-and-numerical-model>
This flow channel geometry is based on a real profile extrusion die for
an extruder with a 45~mm diameter. It shapes the melt into the complex
outflow profile depicted in Fig.~@fig:ProfileKTPSetup. In addition to
other typical features in traditional extrusion die design, it includes
a 15~mm parallel zone near the outlet where the geometry cannot be
modified in order to control the die swell by allowing for sufficient
melt relaxation. The initial and boundary conditions for this use case
are also taken from a real process operating point with a throughput of
10~kg/h and a processing temperature of 220~°C. The extruded material is
a polyethylene of high density (PE-HD) and is modeled with a Carreau-WLF
approach. The first optimization objective for this use case is the
maximization of the flow balance at the outlet (initial configuration
shown in Fig.~@fig:ProfileKTPOutflow), which is equivalent to the
minimization of the deviation of the local velocity from the average
velocity at the outlet $upright(bold(macron(u)))$.

$ min med J = integral_(Gamma_(o u t)) 1 / 2 (upright(bold(u)) - upright(bold(macron(u))))^2 $

#figure([#figure(image("images/profileKTP_shell_000_V3.png"),
    caption: [
      Initial flow channel geometry.
    ]
  )
  <fig:ProfileKTPSetup>

  #figure(image("images/profileKTP_velocity_000.png"),
    caption: [
      Velocity distribution at outlet before optimization.
    ]
  )
  <fig:ProfileKTPOutflow>

  ],
  caption: [
    Setup of the demonstrator profile extrusion die.
  ]
)
<fig:DemonstratorCaseSetup>

The imbalance in the outflow velocity distribution is exacerbated by the
high viscosity and shear-thinning behavior of the extruded material. In
practice, this means that the flow channel of the die is not filled
appropriately (see Fig.~@fig:realFlowChannel).

#figure(image("images/Motivation.svg", width: 44.0%),
  caption: [
    Difference between the target profile (red) and the actual profile
    (white) in extrusion trials before flow channel optimization. Image
    provided by Kunststofftechnik Paderborn~(KTP).
  ]
)
<fig:realFlowChannel>

The flow channel geometry was modeled using an IBM approach, embedding
the geometry in a cartesian background mesh. $alpha_(m a x)$ was chosen
at $10^5$, balancing blockage of the flow with numerical stability. The
optimization algorithm calculates the volume sensitivity according to
Eq.~@eq:VolSenseCalc. The topology update is effectively reduced to a
shape update by restricting the geometry update in
Eq.~@eq:VolSenseUpdate to cells at the interface, i.~e., cells that have
vertices on the fluid and the solid side of the interface. No
underrelaxation was used in this case ($gamma = 1$) and the response
step size was manually fitted to $lambda^(*) = 10^10$. A total of 20
optimization loops were performed, meaning that the results shown later
will represent the optimization result after 19 optimization steps. The
resulting flow channel geometry is reconstructed using a SurfaceNets
algorithm~\[7\], ensuring a 2-manifold surface using the approach by
#emph[Schaefer et al.]~\[8\], and exported as a surface mesh file.

The numerical model was implemented in the open-source finite element
software FEAT3, which is part of the FEATFLOW software family~\[9\]. The
spatial discretization is performed using $Q^2$/$P_(d i s c)^1$
elements, which are inf-sup stable and particularly suited for
non-Newtonian flows without the need for additional
stabilization~\[10\]. The numerical model is solved as follows~\[11\]:
The nonlinear primal system is solved directly into its steady state
using a monolithic Newton solver. The adjoint system does not require
this step since it is already linear. The linearized systems are then
solved using a monolithic geometric multigrid solver. Using a background
mesh with 3,750 hexahedral elements on the coarsest level with three
refinement levels, this results in a total of $tilde.op$48,000,000
degrees of freedom per optimization loop. The solver uses a Vanka-type
cell-wise additive Schwarz smoother with a GMRES solver at the coarsest
level. Simulations were run using two compute servers, each containing
two AMD EPYC 9354 CPUs with a total of 64 cores and 1.5 TB of DDR5 \@
4800 MHz RAM, resulting in a run time of 20~minutes in the first
optimization loop. Later optimization steps are initialized using the
solutions from the previous step to reduce computational cost.

== Results
<results>
Fig.~@fig:SensitivityBefore depicts the resulting volume sensitivities
in the first optimization loop. Positive sensitivities (red areas)
highlight areas where the algorithm wants to restrict the flow channel,
while negative sensitivities (blue areas) highlight parts of the flow
channels that should be expanded to improve the flow balance. The former
primarily affects the flow channel near the upper T-junction, where the
outflow velocities are too high, while the latter mainly affects the
lower parts of the flow channel, where the small channel widths
previously led to an incomplete filling of the die's flow channel (see
Fig.~@fig:realFlowChannel). Figs.~#ref(<fig:GeometryBefore>, supplement: none);–@fig:GeometryAfter
show how the flow channel was adapted according to
Eq.~@eq:VolSenseUpdate, reducing the cost functional from 439.435 to
207.800 in the process.

#figure([#figure(image("images/profileKTP_cellsense_000_V4.png"),
    caption: [
      Volume sensitivity before optimization.
    ]
  )
  <fig:SensitivityBefore>

  #figure(image("images/profileKTP_cellsense_018_V4.png"),
    caption: [
      Volume sensitivity after 19 optimization steps.
    ]
  )
  <fig:SensitivityAfter>

  #figure(image("images/Folie12.PNG"),
    caption: [
      Flow channel geometry before optimization.
    ]
  )
  <fig:GeometryBefore>

  #figure(image("images/Folie13.PNG"),
    caption: [
      Flow channel geometry after 19 optimization steps.
    ]
  )
  <fig:GeometryAfter>

  #figure(image("images/profileKTP_velocity_000_V2.png"),
    caption: [
      Velocity distribution at outlet before optimization. \
      .
    ]
  )
  <fig:VelocityBefore>

  #figure(image("images/profileKTP_velocity_019_V2.png"),
    caption: [
      Velocity distribution at outlet after \
      19 optimization steps.
    ]
  )
  <fig:VelocityAfter>

  ],
  caption: [
    Changes to flow channel geometry and resulting changes to outflow
    velocity distribution.
  ]
)
<fig:OptimizationResults>

This results in a reduction of the standard deviation of the velocity at
the outlet from 2507.75 to 1128.65, which in turn means an improvement
in the flow balance by 55% (see
Figs.~#ref(<fig:VelocityBefore>, supplement: none);–@fig:VelocityAfter). Although the optimization
algorithm has not fully converged at this point, the most significant
changes to the shape are finished; the remaining areas with potential
for optimization focus on the parts of the flow channel that could still
be expanded a bit more (see Fig.~@fig:SensitivityAfter).

= Conclusion and Outlook
<conclusion-and-outlook>
The results of this study demonstrate that adjoint-based optimization
can be successful using various pathways, but not all of them are
equally suited for engineering applications. In particular, not all
methods suited for CFD analysis are automatically suited for shape or
topology optimization. For complex profile extrusion dies, topology
optimization using an immersed boundary method is the most versatile
approach. Applying the optimization algorithm to a complex profile
extrusion die led to an improvement of the flow balancing by 55% using
fewer solver calls than other established CFD-based optimization
methods.

Future work will focus on the investigation of further improvements to
geometry representation, e.g., through adaptive mesh refinement or local
deformation of the mesh \[12\]. In addition, the developed optimization
algorithm will be extended to fully non-isothermal flows and routines
improving the robustness of the optimization algorithm will be added.
The final step in this research will be the manufacturing of an
optimized profile extrusion die based on these optimization results for
subsequent validation in lab trials.

#heading(level: 1, numbering: none)[Acknowledgments]
<acknowledgments>
This project is supported by the Federal Ministry for Economic Affairs
and Energy (BMWE) on the basis of a decision by the German Bundestag.

#heading(level: 1, numbering: none)[References]
<references>
+ A. Gaspar-Cunha, J. A. Covas, J. Sikora. Optimization of Polymer
  Processing: A Review (Part I---Extrusion), Materials, Vol. 15, No. 1,
  p. 384, 2022.

+ G. Bletsos, N. Kühl, T. Rung. Adjoint shape sensitivities of blood
  flows considering non‐Newtonian properties. International Journal for
  Numerical Methods in Fluids, Vol. 95, No.~11, pp.~1791--1819, 2023.

+ C. Othmer. A continuous adjoint formulation for the computation of
  topological and surface sensitivities of ducted flows. International
  Journal for Numerical Methods in Fluids, Vol. 58, No. 8, pp. 861--877,
  \2008.

+ J. Sasse, #emph[Adjoint Topology Optimization of Polymer Melt Flow
  Channels Producible by Additive Manufacturing], Dissertation, RWTH
  Aachen University, 2025.

+ S. Turek, D. Wan, L. S. Rivkind. The Fictitious Boundary Method for
  the Implicit Treatment of Dirichlet Boundary Conditions with
  Applications to Incompressible Flow Simulations. Challenges in
  Scientific Computing - CISC 2002, Lecture Notes in Computational
  Science and Engineering. pp. 37-68, 2003.

+ K. Khadra, P. Angot, S. Parneix, J.-P. Caltagirone. Fictitious domain
  approach for numerical modelling of Navier-Stokes equations.
  International Journal for Numerical Methods in Fluids, Vol. 34, No.~8,
  pp.~651--684, 2000.

+ S. F. F. Gibson. Constrained elastic surface nets: Generating smooth
  surfaces from binary segmented data, Medical Image Computing and
  Computer-Assisted Intervention --- MICCAI'98, Springer Berlin
  Heidelberg, pp. 888--898, 1998.

+ S. Schaefer, T. Ju, J. Warren. Manifold Dual Contouring, IEEE
  Transactions on Visualization and Computer Graphics, Vol. 13, No. 3,
  pp. 610--619, 2007.

+ Chair for Applied Mathematics and Numerics (LS3), TU Dortmund
  University. #emph[FEATFLOW Software Homepage]. Available at:
  #link("https://wwwold.mathematik.tu-dortmund.de/~featflow/en/index.html").
  Accessed: 08 September 2026.

+ D. Boffi, F. Brezzi, M. Fortin, #emph[Mixed Finite Element Methods and
  Applications], Springer Berlin Heidelberg (2013).

+ M. Esser, S. Turek. On the Automation and Scaling of a
  Fictitious-Boundary Method for Non-Newtonian Extrusion Die Flows.
  Ergebnisberichte des Instituts für Angewandte Mathematik No. 687, TU
  Dortmund (2026).

+ M. Grajewski, M. Köster, S. Turek. Mathematical and Numerical Analysis
  of a Robust and Efficient Grid Deformation Method in the Finite
  Element Context. SIAM Journal on Scientific Computing, Vol. 31, No.~2,
  pp.~1539--1557, 2009.
