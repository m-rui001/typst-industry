#import "slab.typ": slab-diagram
#set page(paper: "us-letter", margin: (x: 50pt, y: 53pt), numbering: "1")
#set text(font: "New Computer Modern", size: 10pt)
#set par(justify: true, leading: 0.5em, first-line-indent: (amount: 1em, all: true))
#set heading(numbering: "I.A.1")
#set math.equation(numbering: "(1)")
#show figure.caption: set text(size: 9pt)
#show math.equation.where(block: true): formula => layout(size => {
  let natural = measure(formula).width
  if natural > size.width {
    scale(x: size.width / natural * 100%, reflow: true, formula)
  } else {
    formula
  }
})
#show figure.where(kind: table): set figure.caption(position: top)
#show figure.where(kind: image): set figure(supplement: [FIG.])
#let unnumbered(body) = {
  set math.equation(numbering: none)
  body
}

#title[How it cools? Studying the heat flow out of a semi-infinite slab in welding: An analytical approach]
#align(center)[Fawzi Aly#super[1,2], Alex Kitt#super[2], and Luke Mohr#super[2]]
#align(center, text(size: 8.5pt)[
  #super[1]_Physics Department, SUNY at Buffalo, Buffalo, New York, USA_ \
  #super[2]_EWI, Data Science Team, Buffalo, New York, USA_
])
#pad(x: 29pt)[Additive manufacturing and welding processes are highly sensitive to
heat dissipation, where improper thermal management leads to residual
stresses, distortions, and cracking. Existing heat transfer models, such
as Rosenthal's solutions, fail to handle finite 3D geometries, cooling
effects, or transient behavior, limiting their accuracy. We overcome
these limitations by developing an analytical framework that
incorporates cooling boundary conditions mimicking Newton's Law of
Cooling. Using two different and proven-equivalent approaches---Laplace
transform and Fourier series---we derive closed-form solutions for
transient and steady-state temperature profiles under various heat
sources, including Gaussian, ellipsoidal, double-ellipsoidal, and
time-dependent on/off switch sources. We compare our analytical
solutions to numerical implementations, demonstrating strong agreement
while providing deeper physical insight. This approach significantly
reduces computational cost and experimental requirements, making it a
scalable tool for optimizing thermal predictions and mitigating residual
stresses in metal-based manufacturing. Additionally, our framework
enables the generation of synthetic datasets for machine learning models
to predict heat distribution efficiently.]

#columns(2, gutter: 16pt)[
= Introduction
<Introduction>
Additive Manufacturing (AM) excels in applications requiring complex
geometries, rapid prototyping, and low-volume production without the
need for costly tooling. Its ability to create lightweight, optimized
structures makes it ideal for aerospace, medical implants, and
specialized industrial components @Gibson2021@Ngo2018. However, for AM
to truly compete with traditional methods, advancements in material
properties and defect predictability are essential
@DebRoy2018@Grasso2017@Lewandowski2016.

In AM, the laser moves methodically, melting the powdered material and
fusing it into a solid structure. The part appears flawless as it takes
shape---but beneath the surface, #emph[something unseen is happening].
As the material cools, uneven heat dissipation creates thermal
gradients, leading to internal stresses; without proper thermal
management, microscopic cracks begin to form, weakening the structural
integrity of the part
@DebRoy2018@Mercelis2006@Lewandowski2016@Khairallah2016.

Effective cooling management is essential to minimize residual stresses,
microstructural changes, and crack formation, ultimately improving joint
quality and mechanical performance
@Mercelis2006@Vrancken2016@Patterson2019@Parry2019@Khairallah2016@Ganeriwala2014@Hussein2013.
Nevertheless, the main question remains: #emph[Can we develop more
accurate physics models to predict how a material cools?] Accurately
capturing heat dissipation in AM and welding remains a challenge,
requiring a combination of sophisticated analytical and numerical
approaches. This study contributes to this ongoing effort by proposing a
more refined framework for modeling heat dissipation.

The evolution of the system temperature is governed by the
diffusion-convection equation, which serves as the fundamental model of
heat transfer in this study. To accurately capture cooling effects, one
must account for both the energy input from a moving heat source and the
heat loss to the environment. However, this process is highly complex
due to factors such as the material's geometry, the non-uniform spatial
distribution of the heat source, and its power variation as function of
time @rosenthal1946@eager1983@nguyen1999.

Traditional analytical approaches, as demonstrated in the literature by
Rosenthal and others @rosenthal1946@eager1983@nguyen1999, often assume
an open-domain system to take advantage of Fourier integral
transformations. This method simplifies the problem by reducing it to a
convolution of the heat source with the heat kernel over time. While
effective for simple cases, these models fail to capture realistic
cooling effects due to their inability to incorporate finite-width
constraints and evolving source distributions. As a result, many
previous models have struggled to accurately represent cooling, often
oversimplifying heat dissipation and its impact on temperature evolution
@Kou2003@Goldak2005@Dowden2001@Pavelic1969@Michaleris2014.

While numerical approaches, such as the finite-element method (FEM), can
effectively handle some of these complexities, they are computationally
expensive and often fail to provide clear physical intuition about the
underlying processes @Michaleris2014@Frazier2014@Khairallah2016.
Analytical approaches, on the other hand, offer a more efficient
alternative, not only reducing computational cost and experimental
effort but also providing deeper physical insight into heat transfer
mechanisms @carslaw1959conduction@Michaleris2014@rosenthal1946.
Additionally, they can be seamlessly integrated into physics-informed
machine learning models, further enhancing predictive capabilities in AM
and thermal analysis @Raissi2019@Karniadakis2021.

In this article, we address the challenges of solving the heat equation
under more realistic boundary conditions (B.C.). We also account for the
transient behavior of system's temperature profile by employing the
Laplace transformation (LT), often rendering the equation more amenable
to separation of variables, and naturally incorporates B.C. and I.C.
@schiff1999laplace@krantz2022differential. This approach is not merely
an alternative analytical method but introduces more physically
realistic conditions, such as cooling effects and finite-width
constraints, which are often absent in standard open-domain
formulations. The resulting system of equations remains analytically
tractable while capturing essential thermal behaviors. Moreover, these
refined equations can still be implemented numerically if needed,
providing a more physically accurate alternative to conventional
numerical solutions in literature. While this method is particularly
well-suited for initial-boundary value problems (IBVPs), the inversion
from spectral space $s$ back to the real-time domain $t$ remains a
challenge, often involving complex contour integrals with branch cuts.
Nevertheless, we manage to overcome this obstacle and obtain a
closed-form series solutions for the heat kernel, as well as for
specific heat sources such as Gaussian and ellipsoidal spatial profiles
and other time-dependent variations. These series solutions are shown to
be equivalent to Fourier series (FS) expansions, constrained by the
initial data. Since FS are particularly effective for handling
finite-domain B.C., whereas LT are more suited for IVPs, we propose a
more rigorous approach that begins with LT and later establishes its
equivalence to FS expansions. This dual formulation provides greater
flexibility in implementing the final solution, as we will demonstrate
in this work.

#figure(image("source/figures/Comparison_OpenDomain_Dashed__FiniteWidthNLOC_Solid_.png", width: 8cm),
  caption: [
    Comparison between heat profile evolution for open-domain and
    finite-width solutions with cooling. The dashed lines represent the
    open-domain solution obtained via Fourier integral methods, while
    the solid lines correspond to the finite-width solution with NLOC
    with parameters: $H_1 = 1.2$ and $H_2 = 1.5$. Initially, both
    solutions coincide, indicating that heat didn't diffuse to the
    material boundaries yet. This overlap validates that, at early
    timescales, boundary cooling effects are not on yet. However, as
    time progresses to a critical point, characterized by the material
    width $w$, the source location $z_0$, and the thermal diffusivity
    $alpha$, heat begins to reach the boundaries, activating cooling
    effects. Consequently, a noticeable difference between the two
    solutions develops, with substantial deviations at the boundaries
    over time, as shown in the red and blue profiles. This illustrates
    the significant role of boundary cooling in finite domains at later
    times of evolution.
  ]
)
<fig:open_vs_finite>

== Executive Summary
<executive-summary>
This work develops an analytical framework for solving the
three-dimensional heat transfer problem in finite geometries while
incorporating cooling effects. Heat dissipation is modeled as an energy
flux boundary condition, allowing for a more realistic description of
heat transfer. The framework accounts for Newton's Law of Cooling
(NLOC), Stefan-Boltzmann (SB) radiation, and a generalized
phenomenological cooling model
@incropera2011fundamentals@siegel2015thermal

The main contributions of this work are:

+ #strong[Modeling Cooling Effects:] We model the heat flux out of the
  surfaces of the finite-width slab using B.C. governed by NLOC. This
  framework is readily generalizable to incorporate both radiative heat
  loss and more complex phenomenological cooling behaviors.

+ #strong[Time-dependent heat sources:] We derive closed-form analytical
  solutions for pulsed and continuous sources, solving the on/off switch
  point source model in one dimension for moving sources and in two and
  three dimensions for static sources. A generalization to moving
  sources in three dimensions results in a one-dimensional integral
  suitable for numerical evaluation.

+ #strong[Spatially distributed sources:] The methodology is extended to
  Gaussian, ellipsoidal, and double-ellipsoidal profiles, generalizing
  previous models such as those by Nguyen and Eager & Tsai. For
  short-duration sources, exact analytical solutions are obtained using
  two mathematically equivalent approaches:

  - Two Fourier transforms (FT) and a LT.

  - Two Fourier transforms and a FS.

  Their equivalence is proven, and for long-duration sources, a
  one-dimensional integral formulation remains computationally
  efficient.

+ #strong[Heat kernel solution:] The three-plus-one-dimensional heat
  kernel is derived in closed form using both the LT and FS approaches
  and validated against three solution techniques:

  - A fully numerical implementation of the model.

  - The residue theorem.

  - The FS method.

  While all three yield equivalent results, analytical solutions
  significantly reduce computational costs and provide deeper insight
  into heat transfer dynamics.

+ #strong[Rosenthal model recovery:] The framework naturally recovers
  Rosenthal's solutions for two-dimensional heat transfer with cooling
  and three-dimensional heat transfer without cooling as limiting cases,
  demonstrating its robustness and broad applicability.

This work establishes a rigorous foundation for modeling heat transfer
in finite domains, offering advancements in computational heat transfer
and process optimization for manufacturing applications.

This paper is structured as follows: Section #ref(<Introduction>, supplement: none) provides an
overview, followed by the problem definition and setup in Section
#ref(label("Problem Statement")). Section
#ref(label("How to Model Cooling Mathematically?")) develops the
mathematical framework, deriving the three-plus-one-dimensional heat
kernel via integral transforms (Sections
#ref(label("Integral Transform Approach for the 3+1 Heat Kernel")) and
#ref(label("Cooling Boundary Conditions"))), analyzing singularities
(Sections #ref(label("Commuting the integrals")),
#ref(label("Poles and Singular structure")), and
#ref(label("Branch Cut"))), and introducing an alternative FS method
(Section #ref(label("Alternative Approach: Fourier Series"))). Section
#ref(label("Heat Profile for different Source terms")) examines heat
distributions for Gaussian, ellipsoidal, and time-dependent sources
(Section #ref(label("source Using LT"))), while Section
@Rosenthal_as_special_case recovers Rosenthal's models as limiting cases
(Sections #ref(label("Rosenthal 2D")) and #ref(label("Rosenthal 3D")))
and explores transient effects (Sections
#ref(label("Transient Behavior")),
#ref(label("SpecialCase LT Rosenthal")), and @TransientOurModel).
Section #ref(<Conclusion>, supplement: none) summarizes key findings and future directions. The
appendices provide detailed derivations, including point source modeling
(Section #ref(label("source Using LT"))), integral transformations
(Section #ref(label("FS and LT"))), initial condition effects (Section
#ref(label("IC Section"))), and more details on the derivation of our
Green's function (Sections #ref(label("Derive GF")) and @Formulas).

#figure(slab-diagram(),
  caption: [
    This figure illustrates a semi-infinite slab (gray) with a heat
    source (red sphere) positioned at
    $\( tilde(x) \, tilde(y) \, tilde(z) \) = \( 0.4 \, 0.3 \, 0.2 \)$,
    indicating the location of interest for solving the heat kernel $G$.
    Blue arrows represent the heat flux moving outward from both the top
    and bottom surfaces, modeled using NLOC as B.C. A red arrow above
    the sphere shows its motion in the positive $tilde(x)$-direction,
    emphasizing the movement of the heat source across the slab---hence,
    this snapshot is taken in the lab frame $arrow(tilde(x))$. The black
    coordinate system $\( tilde(x) \, tilde(y) \, tilde(z) \)$, placed
    beside the slab, provides spatial reference and that $tilde(z)$
    represents the finite-width $w = 0.4$ dimension.
  ]
)
<Sketch>

= Problem Statement
#label("Problem Statement")
#emph[Why and when is accounting for cooling crucial?] Consider a
semi-infinite material subjected to a short pulse heating, such as the
sample illustrated in Fig.~#ref(<Sketch>, supplement: none). To model this process, we adopt two
approaches:

- #strong[Model A:] The #strong[open-domain solution], exemplified by
  the Rosenthal Model in 3D and similar models developed in prior works
  @eager1983@rosenthal1946@nguyen1999.

- #strong[Model B:] Our #strong[finite-width model], incorporating
  cooling B.C, as developed in this work.

The corresponding temperature profiles at various time instances are
compared in Fig.~#ref(<fig:open_vs_finite>, supplement: none).

Initially, heat propagates rapidly within the material, and the
temperature distributions predicted by both models coincide, as cooling
effects have yet to influence the system. Assuming the heat source
behaves approximately as a point source, thermal diffusion occurs
isotropically at a characteristic speed dictated by the thermal
diffusivity $alpha$, which is assumed to be spatially uniform.

However, after a critical time---when heat has reached the two faces of
the sample---cooling effects encoded in the B.C. start playing a role.
At this stage, Model A and Model B diverge, as the former neglects
cooling. Over time, these effects penetrate deeper into the material,
significantly altering the thermal profile in Model B. The reader can
track this transition by comparing the #emph[dashed] (Model A) and
#emph[solid] (Model B) curves at different moments:
$t = 37.5 \, 150 \, 375 \, 1500$.

For processes involving prolonged heating---such as in welding---the
disparity between Model A and Model B becomes even more pronounced as
the system approaches a steady state. This steady-state behavior is
crucial for refining heat management algorithms and ensuring accurate
thermal predictions. Thus, incorporating cooling effects is essential
for realistic modeling of temperature evolution.

== Setup
<Setup>
To systematically analyze this problem, we consider a semi-infinite slab
subjected to a moving heat source traveling at a constant velocity $v$
along the $tilde(x)$-direction. The slab extends infinitely in
$tilde(x)$ and $tilde(y)$ but has a finite width $w$ in $tilde(z)$.
Cooling effects, governed by Newton's Law of Cooling (NLOC), are imposed
as B.C. at both ends in the $tilde(z)$-direction. Additionally,
Stefan-Boltzmann (SB) radiation terms or polynomial homogeneous cooling
effects can be incorporated for phenomenological applications (see
Appendix #ref(label("Cooling Boundary Conditions")) for details).

#figure(image("source/figures/countour_integralWithPoles.pdf", width: 8cm),
  caption: [
    A schematic of the Bromwich contour integral used in the inverse LT.
    The contour, which includes a large arc defined by points $B D E$
    and $A N L$, contributes zero to the integral by applying the Big
    Lemma theorem. A branch cut extends from $\[ 0 \, oo \)$ along the
    real axis, and an infinite countable number of simple poles are
    located on the negative $s_R$-axis, evaluated using the residue
    theorem. Notably, there is no pole at $s = 0$, and no contributions
    arise from the segments $E O$ and $L O$. This setup allows for
    capturing the essential behavior of the inverse under the conditions
    specified. The poles $s_n$ marked in red dots are on the negative
    $s_R$-axis, and the spacing between them increases monotonically
    with $n$.
  ]
)
#label("LT contour")

= How to Model Cooling Mathematically?
#label("How to Model Cooling Mathematically?")
The heat transfer physics is described by the hyperbolic
diffusion-convection equation, which can, in general, include nonlinear
effects such as temperature-dependent properties, phase changes,
radiative transfer, or non-Fourier conduction
@cattaneo1948@vernotte1958@carslaw1959conduction. However, in this work,
we focus on the linear system. The hyperbolic form of the heat equation
in the lab frame $arrow(tilde(x))$ is given by:

$ frac(partial tilde(T), partial t) - alpha tilde(nabla)^2 tilde(T) = tilde(S) \( t \, arrow(tilde(x)) \) \, $

where $tilde(T) = tilde(T) \( t \, arrow(tilde(x)) \)$ represents the
temperature distribution and $tilde(S) \( t \, arrow(tilde(x)) \)$
represents the heat source term, which generally depends on position
$arrow(tilde(x))$ and time $t$.

We perform the variable transformation $tilde(x) arrow.r x - v t$, where
$v$ is the velocity of the moving source, transforming the problem into
the source's co-moving frame $arrow(x)$. In this frame, the PDE takes
the form:

$ frac(partial T, partial t) - v frac(partial T, partial x) - alpha nabla^2 T = S \( t \, arrow(x) \) . $#label("equation in co moving frame")

In the co-moving frame, the source term simplifies significantly: it
reduces to a $\( 3 + 1 \)$-dimensional Dirac delta pulse at the origin,
which facilitates obtaining the Green's function $G$. After that we can
directly convolve it with the actual source term $S$ to evaluate $T$,
see equation #ref(<Convlution>, supplement: none). Please note that we
use $G$ interchangeably with the terms #emph[heat kernel] and
#emph[Green's function].

The approach employed in this work involves reducing the full $3 + 1$
dimensional PDE to an effective one-dimensional ODE, which we then solve
analytically when possible. This reduction is achieved through three
integral transformations: two Fourier transformations (FT) in the
spatial dimensions $x$ and $y$, leveraging the open-domain nature of
these coordinates, and one LT in time $t$, which transforms the problem
into spectral space $s$ while incorporating the I.C. As demonstrated in
this work, this scheme allows for straightforward computation of the
Heat Kernel.

The B.C. in the open-domain $x$ and $y$ directions are given by:
$ T arrow.r 0 quad upright("as") quad x \, y arrow.r oo . $

Cooling B.C. in the $z$-direction enforce NLOC at the two boundaries.
See Appendix #ref(label("Cooling Boundary Conditions")) for a detailed
derivation and further discussion. Instead of using a single heat
transfer coefficient $h$, we introduce $H_1$ and $H_2$ to describe heat
transfer at the left and right boundaries, respectively. For simplicity
and without loss of generality, we set the ambient temperature
$T_oo = 0$, leading to:

$ 1 / T frac(partial T, partial z)\|_(z = 0) = H_1 \, quad quad quad 1 / T frac(partial T, partial z)\|_(z = w) = - H_2 . $<NLOC>

Importantly, the positive sign on the left and negative on the right
enforce heat flow #emph[outward] from the sample at both ends. For
further discussion on cooling B.C. and their extension to SB radiation,
refer to Appendix #ref(label("Cooling Boundary Conditions")).

== Integral Transform Approach for the 3+1 Heat Kernel
#label("Integral Transform Approach for the 3+1 Heat Kernel")
To solve the heat equation, we apply two FT in $x$ and $y$ as well as
one LT in $t$ on $T$, see Appendix #ref(label("FS and LT")) for
convention in use. This yields the transformed temperature profile
$hat(T)$:

]

$ T \( t \, arrow(x) \) = frac(1, \( 2 pi \)^2) integral_(- oo)^oo d k_x thin e^(i k_x macron(x)) integral_(- oo)^oo d k_y thin e^(i k_y macron(y)) integral_(epsilon.alt - i oo)^(epsilon.alt + i oo) d s thin e^(s macron(t)) hat(T) \( s \, k_x \, k_y \, z \) \, $#label("2+1 transformations")

where $macron(x) = x - x'$, and $hat(T) \( s \, k_x \, k_y \, z \)$
represents the temperature profile in Fourier-Laplace space. The PDE
#ref(label("equation in co moving frame"), supplement: none)
in the co-moving frame transforms into a second-order linear ODE in zz:

$ gamma hat(T) - frac(partial^2 hat(T), partial z^2) = 1 / alpha [hat(S) \( s \, k_x \, k_y \, z \) + T \( t = 0 \, k_x \, k_y \, z \)] \,\
gamma equiv s / alpha + \( k_x^2 + k_y^2 \) - i v k_x . $<Eqz> The I.C.
can be freely chosen to model various scenarios relevant to welding and
AM processes (see Appendix #ref(label("IC Section")) for more examples
in which I.C. are important). Nevertheless, for simplicity, we set
$T_(\( t = 0 \)) = 0$. The solution to #ref(<Eqz>, supplement: none) is obtained
using standard Green's function techniques, denoted by
$tilde(G) \( z \, z' \)$\; see Appendix #ref(label("Derive GF")) for
details:

$ tilde(G) \( z \, z' \) = frac(1, 2 beta \( eta xi - 1 \)) #scale(x: 240%, y: 240%)[\[] eta thin e^(beta \( z_(>) + z_(<) \)) + e^(beta \( z_(>) - z_(<) \)) + eta thin xi thin e^(- beta \( z_(>) - z_(<) \)) + xi thin e^(- beta \( z_(>) + z_(<) \)) #scale(x: 240%, y: 240%)[\]] \,\
eta = frac(beta + H_1, beta - H_1) \, quad quad quad xi = frac(beta + H_2, beta - H_2) thin e^(2 beta w) . $<greenz>
where $beta equiv gamma^(1 \/ 2)$,
$z_(>) = upright("max") \( z \, z' \)$ and
$z_(<) = upright("min") \( z \, z' \)$. However, since both
$eta \( k_x \, k_y \, s \)$ and $xi \( k_x \, k_y \, s \)$ depend on
$k_x \, k_y$, and $s$, solving the inverse Laplace transform (ILT) is
highly nontrivial. In general, the integrals in
#ref(label("2+1 transformations"), supplement: none) do not
commute, making direct evaluation challenging.

=== Commuting the integrals
#label("Commuting the integrals")
To simplify the problem, we apply a useful transformation, redefining
$s arrow.r s - alpha \( k_x^2 + k_y^2 \)$, which consequently shifts
$epsilon.alt arrow.r tilde(epsilon.alt)$ and $beta arrow.r s^(1 \/ 2)$:

$ G_v \( macron(x) \, macron(y) \, macron(t) \, z \, z' \) & = integral_(- oo)^oo d k_x thin e^(i k_x \( macron(x) - v macron(t) \)) e^(- alpha k_x^2 macron(t)) integral_(- oo)^oo d k_y thin e^(i k_y macron(y)) e^(- alpha k_y^2 macron(t)) integral_(tilde(epsilon.alt) - i oo)^(tilde(epsilon.alt) + i oo) d s thin e^(s macron(t)) tilde(G) \( z \, z' \) \,\
 & = frac(pi, alpha macron(t)) thin e^(- frac(\[ macron(x) - v macron(t) \]^2 + macron(y)^2, 4 alpha macron(t))) integral_(tilde(epsilon.alt) - i oo)^(tilde(epsilon.alt) + i oo) d s thin e^(s macron(t)) tilde(G) \( z \, z' \) \,\
 & = G_(0 1 D) \( macron(y) \, macron(t) \) thin G_(v 1 D) \( macron(x) \, macron(t) \) thin g \( z \, z' \, macron(t) \) .\
 $<greenxyz>

#columns(2, gutter: 16pt)[

Here, $G_(0 1 D)$ and $G_(v 1 D)$ represent the Green's functions for a
one-dimensional open domain with static and moving heat sources,
respectively. Thus, our goal is to determine the effective Green's
function $g \( z \, z' \, macron(t) \)$ in the finite-width domain.

The transformation we have applied aligns with our intuition that the
dependence on $x$ and $y$ should factor out and correspond to the Heat
Kernel in 2D. Mathematically, as demonstrated in Appendix
#ref(label("Poles and Singular structure")), all poles of the contour
integral lie on the negative real axis, $s_R$.

Since the shift in $epsilon.alt$ is positive definite, as given by:


#unnumbered[
$ tilde(epsilon.alt) = epsilon.alt + alpha \( k_x^2 + k_y^2 \) \, $
]

 regardless of variations in $k_x$ and $k_y$, the shift
in $epsilon.alt$ only translates the contour integral to the right,
leaving the final integral result unchanged. Consequently, we can
commute the Fourier and Laplace integrals.

This physical intuition and mathematical proof will be further
illustrated by comparing pure numerical schemes used to solve
#ref(label("equation in co moving frame"), supplement: none)
with the numerical evaluation of the integral, see Figures
@fig:comparison1, @fig:comparison2, and @comparison3, as well as the
alternative series approach introduced later in this work.

=== Branch Cut due to $s^(1 \/ 2)$
#label("Branch Cut")
Next, the ILT is further complicated by the presence of a branch point
at $s = 0$ due to $s^(1 \/ 2)$, introducing a branch cut that reflects
the parabolic nature of the PDE, as explained earlier. Naturally,
incorporating a branch cut into our contour integral requires careful
handling; nevertheless, we must still evaluate the integration without
issue. We choose the branch cut to be $\( - oo \, 0 \]$. The
corresponding contour is illustrated in Fig.~#ref(label("LT contour")).

== Evaluating $g \( z \, z' \, macron(t) \)$
<Evaluating>
Substituting #ref(<greenz>, supplement: none) into
#ref(<greenxyz>, supplement: none), we obtain four integrals for computing
$g \( z \, z' \, macron(t) \)$:

]

$ g \( z \, z' \, macron(t) \) = I_(\( + \, + \)) \[ z_(>) - z_(<) \] + I_(\( + \, - \)) \[ \( w - z_(>) \) + \( w - z_(<) \) \] + I_(\( - \, + \)) \[ z_(>) + z_(<) \] + I_(\( - \, - \)) \[ \( w - z_(>) \) + \( w + z_(<) \) \] \,\
I_(\( plus.minus \, plus.minus \)) \( cal(Z) \) = integral_(tilde(epsilon.alt) - i oo)^(tilde(epsilon.alt) + i oo) frac(1, 2 s^(1 \/ 2)) frac(e^(s macron(t)) e^(- s^(1 \/ 2) cal(Z)) \( s^(1 \/ 2) plus.minus H_1 \) \( s^(1 \/ 2) plus.minus H_2 \), \( s^(1 \/ 2) + H_1 \) \( s^(1 \/ 2) + H_2 \) - \( s^(1 \/ 2) - H_1 \) \( s^(1 \/ 2) - H_2 \) e^(- 2 s^(1 \/ 2) w)) thin d s . $<Isintegral>

#columns(2, gutter: 16pt)[

Here, $cal(Z) > 0$ carries the dependence on $z_(<)$ and $z_(>)$, while
$alpha$ has been absorbed $s \/ alpha arrow.r alpha$ for conciseness and
will recovered later, without loss of generality. We also suppress the
explicit $t$-dependence of $I_(\( plus.minus \, plus.minus \))$ for
conciseness.

The key observation is that the four integrals
$I_(\( plus.minus \, plus.minus \))$ share the same singular structure,
which is independent of $z$ and depends only on the cooling coefficients
$H_1 \, H_2$, thermal diffusivity $alpha$, and the width of the sample
$w$. Thus, it requires only a #emph[one-time computation]. A similar
behavior is expected in the SB or polynomial cooling cases.

=== Poles' Rank?
#label("Poles' Rank?")
In addition to the branch cut, this integral presents another challenge:
the singular structure introduced by the term $e^(- 2 s^(1 \/ 2) w)$,
which is difficult to handle analytically. Fortunately, this term does
not alter the rank of the singularities---all remain simple poles, which
can be easily verified numerically.

In the absence of this term, the equation reduces to a quadratic in
$s^(1 \/ 2)$, yielding at most two simple poles. However, while
$e^(- 2 s^(1 \/ 2) w)$ does not change the rank of the poles, it renders
them infinitely countable with monotonically increasing spacing between
them. As demonstrated in Appendix
#ref(label("Poles and Singular structure")), all these poles lie on the
negative $s_R$-axis. We determine their positions numerically.

=== Using the Residue Theorem
#label("Using the Residue Theorem")
Relying on the Estimation Lemma and the causality conditions on
$cal(Z)$, as explained in the previous subsection, we can evaluate the
contour integral using the Residue Theorem
@schiff1999laplace@churchill2009complex.

]

$ g \( z \, z' \, macron(t) \) = sum_(n = 1) A \( beta_n \) e^(- beta_n^2 macron(t)) {H_2 sin [macron(z)_(>) sqrt(beta_n)] + sqrt(beta_n) cos [macron(z)_(>) sqrt(beta_n)]} {H_1 sin [z_(<) sqrt(beta_n)] + sqrt(beta_n) cos [z_(<) sqrt(beta_n)]}\
A \( beta_n \) = frac(2 alpha sqrt(beta_n), sin [w sqrt(beta_n)] {beta_n [\( H_1 + H_2 \) w + 3] - H_1 H_2} + sqrt(beta_n) cos [w sqrt(beta_n)] {w [beta_n - H_1 H_2] - 2 \( H_1 + H_2 \)})\
 $#label("Soltuion eq FS") where $macron(z) equiv w - z$,
$beta_n = sqrt(s_n \/ alpha)$ and we have reinstated the $alpha$ factor
for completeness. In #ref(label("Soltuion eq FS"), supplement: none),
we performed the transformation $s_n arrow.r - s_n$, ensuring that $s_n$
remains positive definite. This avoids ambiguity from taking square
roots in spectral space and makes the exponential damping explicit. We
list some of the poles for the chosen parameters $w = 5 thin m m$,
$H_1 = 1.2 thin W . m m^2 \/ K$ and $H_2 = 1 thin W . m m^2 \/ K$ in
Table~#ref(<Poles>, supplement: none), with their distribution illustrated in Fig.~#ref(<poles>, supplement: none).

#grid(columns: (1fr, 1fr), gutter: 12pt,
[#figure(image("source/figures/temperature_profile_pureNumerical_sold_vsILTNumerical_dashed_vsFS160_cross__.png", width: 100%),
  caption: [
    Comparative analysis of temperature profile evolution using three
    distinct solution methods over time. Dashed Line: Numerical solution
    obtained by inverting the LT with the #smallcaps[MP-python] package.
    Solid Line: Solution generated by the
    #smallcaps[EWI-NumericalHeatSolver] package using the
    Finite-Difference (FD) method on a uniform mesh. Crossed Line:
    Analytical series solution, truncated after 160 terms, reported in
    this article. The alignment of these solutions across different time
    intervals illustrates strong agreement, validating the robustness of
    each method in capturing temperature dynamics and accurately
    modeling heat propagation behavior .
  ]
)
<fig:comparison1>],
[#figure(image("source/figures/PureNumericalVsILNumerical.png", width: 100%),
  caption: [
    A comparison of temperature profile evolution obtained through ILT
    and FD methods. The dashed line represents the temperature profile
    derived by numerically inverting the LT using the
    #smallcaps[MP-python] package. The solid line shows the solution
    generated using the #smallcaps[EWI-NumericalHeatSolver] package,
    implemented via the FD method on a uniform mesh. This comparison
    demonstrates a strong agreement between the two approaches across
    the entire temperature profile evolution, validating the analytical
    model implemented in this work.
  ]
)
<fig:comparison2>],
)

#columns(2, gutter: 16pt)[

#figure(image("source/figures/poles.pdf", width: 8cm),
  caption: [
    Contour plot of integrand of #ref(<Isintegral>, supplement: none) in
    the complex $s$-plane, where
    $s \/ alpha = s_R \/ alpha + i s_I \/ alpha$. The plot highlights
    the simple poles for the specific choice of parameters as stated in
    the text. All poles lie on the negative $s_R$-axis, and not evenly
    spaced as proved in Appendix
    #ref(label("Poles and Singular structure")).
  ]
)
<poles>

#figure(
  align(center)[#table(
    columns: 2,
    align: (center,center,),
    table.header([$n$], [$- s_n \/ alpha$],),
    table.hline(),
    [1], [0.21788344122246012],
    [2], [0.9354984090489751],
    [3], [2.274537277073521],
    [4], [4.323471861197404],
    [5], [7.125975596988451],
    [6], [10.701046303359455],
    [7], [15.057037950335976],
    [8], [20.197859113993204],
    [9], [26.125475142527932],
    [10], [32.840943281468654],
    [11], [40.344866943627416],
    [12], [48.63760847150312],
    [13], [57.71939510962397],
    [⋮], [⋮],
  )]
  , caption: [For the NLOC cooling B.C, this table show the locations of
  first few poles in spectral space $s$, normalized to $alpha$, for a
  specific choice of parameters as stated in the text.]
  , kind: table
  ) <Poles>
=== Causality Structure
#label("Causality Structure")
Moreover, the temperature profile $T$, obtained through the ILT,
exhibits a causality structure that reflects the retardation of the
Green's function. This causality condition ensures that the solution is
valid only after the impact, i.e., for $t > t'$, through the step
function $Theta \( t - t' \)$. Nevertheless, for conciseness, we do not
explicitly write down the step functions in the previous expressions
#ref(<Isintegral>, supplement: none).

== Alternative Approach: Fourier Series
#label("Alternative Approach: Fourier Series")
In this section, we demonstrate that there is an alternative approach to
obtain the Green function $G$, involving the use of the FS instead of
the LT, see Figures ~@fig:comparison1 and ~@comparison3 for a visual
comparison between solutions obtained using both approaches. While LT
leads to a spectral representation in $s$ and is more naturally suited
for dealing with IBVPs or IVPs, FS reformulates the problem in terms of
discrete number of eigenfunctions $phi.alt_n \( z \)$, naturally
accommodating finite-width constraints. It also recovers the
infinite-width case in the limit of $w arrow.r oo$, ultimately becoming
equivalent to a the third FT used in the 3D Rosenthal model.

Although we do not provide a full proof here, we emphasize that as $w$
increases, the spacing between poles $Delta s_n equiv s_(n + 1) - s_n$
should decrease. In the limit $w arrow.r oo$, we obtain
$Delta s_n arrow.r 0$, transforming the FS summation into an FT
integral.

By expanding both the temperature $T$ and source term $S$ in terms of
those eigenfunctions $phi.alt_n \( z \)$, the heat equation reduces to
an effective first-order ODE in $t$, analogous to the LT approach. The
final Green's function representation in this formulation takes the
form:

$ G \( t \, x \, y \, z \, x' \, y' \, z' \) & = G_(0 \, 1 D) \( macron(y) \, macron(t) \) G_(v \, 1 D) \( macron(x) \, macron(t) \) Theta \( macron(t) \)\
 & quad times sum_n phi.alt_n \( z \) phi.alt_n \( z' \) e^(- lambda_n^2 macron(t)) . $

A detailed derivation of this result, including the eigenvalue equation
and B.C, is provided in Appendix #ref(label("FS Derivation")). To
illustrate the equivalence, in Figures ~@fig:comparison1,
~@fig:comparison2, ~@comparison3, and ~@fig:10plots, we compare among
the pure numerical implementation with our analytical solution obtained
using both the FS and LT approaches.

== Brief Summary
#label("Brief Summary")
In this section, we addressed heat transfer in a semi-infinite material
with cooling governed by NLOC B.C. We obtained the Green function $G_v$
as a closed-form analytical solution, incorporating finite-geometry
effects.

To solve this system, we introduce two equivalent approaches, as
sketched in Fig.~#ref(label("SketchFor Apporaches")). The first method
applies two FT in $x$ and $y$ and an LT in $t$, reducing the $3 + 1$
heat equation to a second-order ODE in $z$, which we solve using Green's
function techniques in one dimension. However, inverting the LT is
nontrivial due to poles and a branch cut, requiring careful handling of
the contour integration. The second approach replaces the LT with an FS
expansion in $z$, reformulating the problem in terms of discrete
eigenfunctions. This leads to a first-order ODE in $t$, which is solved
using direct integration before imposing I.C, recovering the continuous
FT in the limit $w arrow.r oo$.

The key objective is to use this analytical Green's function as the
foundation for constructing heat profiles for realistic sources while
incorporating cooling and finite boundary constraints.

#figure(image("source/figures/SketchForApproaches.pdf", width: 8cm),
  caption: [
    This figure compares two approaches for obtaining the Green's
    function. Both methods start with FT in $x$ and $y$. The first
    approach applies a LT in $t$, reducing the problem to a second-order
    ODE in $z$, while the second approach uses a FS in $z$, leading to a
    first-order ODE in $t$, which is solved before imposing I.C. In both
    methods, the Inverse FT in $x$ and $y$ independently of analysis
    needed for solving the effective ODEs. The Green's function obtained
    using both methods are equivalent.
  ]
)
#label("SketchFor Apporaches")

= Heat Profile for different Source terms
#label("Heat Profile for different Source terms")
At this point, we are well-prepared to study the heat profile for more
interesting source terms in the co-moving frame. With the kernel at
hand, we can solve for the heat profile by integrating with the source
term:

]

$ T \( t \, x \, y \, z \) & = integral_(- oo)^t d t' integral_0^w d z' integral_(- oo)^oo d x' integral_(- oo)^oo d y' thin G_v \( macron(x) \, macron(y) \, macron(t) \, z \, z' \) S \( t' \, x' \, y' \, z' \) . $<Convlution>

#figure(grid(columns: 3, gutter: 9pt,
  [#image("source/figures/vsILTNumerical_dashed_vsFS160_cross_vsFS30_dotted_FS3_star_vsFS1_solid_t1_.png", width: 100%) #align(center)[(a) $t = 1$]],
  [#image("source/figures/vsILTNumerical_dashed_vsFS160_cross_vsFS30_dotted_FS3_star_vsFS1_solid_t5_.png", width: 100%) #align(center)[(b) $t = 5$]],
  [#image("source/figures/vsILTNumerical_dashed_vsFS160_cross_vsFS30_dotted_FS3_star_vsFS1_solid_t10_.png", width: 100%) #align(center)[(c) $t = 10$]],
  [#image("source/figures/vsILTNumerical_dashed_vsFS160_cross_vsFS30_dotted_FS3_star_vsFS1_solid_t100_.png", width: 100%) #align(center)[(d) $t = 100$]],
  [#image("source/figures/vsILTNumerical_dashed_vsFS160_cross_vsFS30_dotted_FS3_star_vsFS1_solid_t500_.png", width: 100%) #align(center)[(e) $t = 500$]],
  [#image("source/figures/vsILTNumerical_dashed_vsFS160_cross_vsFS30_dotted_FS3_star_vsFS1_solid_t750_.png", width: 100%) #align(center)[(f) $t = 750$]],
),
  caption: [
    This figure compares temperature profiles derived from the
    implementation of the ILT and truncated FS solutions reported in
    this article. The series solutions are truncated after $n$-terms:
    $1 \, 3 \, 30$, and $160$ and evaluated at various time intervals:
    $t = 1 \, 5 \, 10 \, 100 \, 500 \,$ and $750$. The comparison shows
    that the series solutions converge over time due to the rapid decay
    of higher-order modes compared to the fundamental mode. At later
    times, the profile becomes increasingly dominated by the fundamental
    mode as cooling effects fully manifest. This suggests that for
    late-time evolution, only a few terms are needed to accurately
    represent the profile, as the influence of higher modes diminishes
    significantly after cooling is initiated.
  ]
)
<fig:10plots>

#columns(2, gutter: 16pt)[

We have two options when it comes to evaluate this integral using $G_v$:

+ #strong[Commuting the Integrals:] Interchanging the order of “source\"
  integral with spectral one. If the former one is easier to execute
  under the ILT, potentially leading to closed-form solutions or
  reducing the problem to a more manageable one-dimensional integral. On
  the other hand, this approach might change the pole structure of the
  spectral integral.

+ #strong[Integration inside the Series:] Whether we use LT or FS, we
  end up with a series solution. Thus, we can integrate each term
  individually offers a more straightforward computational approach
  compared to the first method.

Each method has trade-offs, and the best choice depends on the source's
form. In the following subsections, we will focus on the later option.
For examples of the former one, please refer to the Appendix
#ref(label("source Using LT")) and #ref(label("Using LT OPTION1")).

Let's assume a factorized form of the source term
$S \( t \, x \, y \, z \) = S_x \( t \, x \) S_y \( t \, y \) S_z \( t \, z \)$,
in the co-moving frame, then we can re-write the integral as follows:

]

$ T \( t \, x \, y \, z \) & = integral_(- oo)^t d t' thin integral_0^w d z' g \( z \, z' \, macron(t) \) S_z thin integral_(- oo)^oo d x' G_(v 1 D) \( macron(x) \, macron(t) \) S_x thin integral_(- oo)^oo d y' G_(0 1 D) \( macron(y) \, macron(t) \) S_y\
 & = integral_(- oo)^t d t' thin T_x \( macron(t) \, x \) T_y \( macron(t) \, y \) T_z \( macron(t) \, z \) $<FactroizedSourceConv>

#columns(2, gutter: 16pt)[

At this stage, we can proceed by exploring specific cases of the source
terms and attempt to derive the corresponding temperature profile $T$.

#figure(image("source/figures/GaussianSource_FS_5_PolesVersusPureNumericalalphaequal1Sigmaequal1.png", width: 8cm),
  caption: [
    A comparison of temperature profile evolution obtained through ILT
    and FD method. The dashed line represents the temperature profile
    derived by numerically inverting the Laplace integral using the
    #smallcaps[MP-python] package. The solid line shows the solution
    generated using the #smallcaps[EWI-NumericalHeatSolver] package,
    implemented via the FD method on a uniform mesh. This comparison
    demonstrates a strong agreement between the two approaches across
    the entire temperature profile evolution, validating of analytical
    model implemented in this work.
  ]
)
<comparison3>

== Gaussian and Ellipsoidal Profiles
#label("Gaussian and Ellipsoidal Profiles")
Consider a heat source that deposits a constant power density $A_0$ with
a spatial distribution given by:
$ S \( x \, y \, z \) = A_0 e^((- frac(\( x - x_c \)^2, 2 sigma_x^2) - frac(\( y - y_c \)^2, 2 sigma_y^2) - frac(\( z - z_c \)^2, 2 sigma_z^2))) . $
In general, $A_0$ could be $t$-dependent, but we assume it to be
constant for simplicity. Extending to $A_0 arrow.r A \( t \)$ is
straightforward, as discussed later in
#ref(label("Comment on Time-Dependent Source")). Without loss of
generality, we set $x_c = y_c = 0$. A Gaussian distribution is recovered
in the limit: 

#unnumbered[
$ sigma_x = sigma_y = sigma_z . $
]



Integrating over $x$ and $y$ follows directly from Rosenthal's
result@rosenthal1946 :

]

$ T_x \( t \, x \) = frac(2 sqrt(pi A_0) sigma_x exp (- frac([x - v macron(t)]^2, 2 [2 macron(t) alpha + sigma_y^2])), sqrt(2 + frac(sigma_x^2, macron(t) alpha))) quad quad quad quad T_y \( t \, y \) = frac(2 sqrt(pi A_0) sigma_y exp (- frac(y^2, 2 [2 macron(t) alpha + sigma_y^2])), sqrt(2 + frac(sigma_y^2, macron(t) alpha))) $#label("Gaussian in x")
On the other hand, the integration in $z$ is more involved and takes the
following form:

$ T_z \( t \, z \) = frac(sigma_z, 2 sqrt(2)) sum_n e^(- frac(s_n macron(t), alpha) - frac(s_n sigma_z^2, 2 alpha)) (cal(B)_n \( z \) {beta_n cos [macron(z) beta_n] + H_2 sin [macron(z) beta_n]} - cal(C)_n \( z \) {beta_n cos \( z beta_n \) + H_1 sin \( z beta_n \)}) \,\
 $<ZPartSeriesSolution>

#columns(2, gutter: 16pt)[

where $cal(B)_n \( z \)$ and $cal(C)_n \( z \)$ are defined in Appendix
@Formulas.

== Double Ellipsoidal spatial Profiles
#label("Double Ellipsoidal spatial Profiles")
In a more realistic setup, the heat source in the co-moving frame is not
fully axially symmetric, as it does not behave like a rigid body. A
slightly more interesting case arises when the heat profile follows a
double ellipsoidal distribution, mimicking the asymmetry between the
front and back ends along the motion direction @goldak1984.

$ S_x \( x \) = [A_R e^(- frac(x^2, 2 sigma_y^2)) Theta \( x \) + A_L e^(- frac(x^2, 2 sigma_y^2)) Theta \( - x \)] . $

The integration in $x$ can still be carried out analytically using the
error function $upright("Erf")$, as follows:

]

$ T_x \( t \, x \) & = frac(sqrt(pi A_R) sigma_(x R), sqrt(2 + frac(sigma_(x R)^2, macron(t) alpha))) exp (- frac([x - v macron(t)]^2, 2 [2 macron(t) alpha + sigma_(x R)^2])) (1 + "Erf" {(x / macron(t) - v) / sqrt(2 + frac(sigma_(x R)^2, macron(t) alpha)) frac(sigma_(x R), 2 alpha)})\
 & + frac(sqrt(pi A_L) sigma_(x L), sqrt(2 + frac(sigma_(x L)^2, macron(t) alpha))) exp (- frac([x - v macron(t)]^2, 2 [2 macron(t) alpha + sigma_(x L)^2])) (1 - "Erf" {(x / macron(t) - v) / sqrt(2 + frac(sigma_(x L)^2, macron(t) alpha)) frac(sigma_(x L), 2 alpha)})\
 $

#columns(2, gutter: 16pt)[

We can easily recover the Gaussian profile by taking the limit
$sigma_(x L) = sigma_(x R) equiv sigma_x$ and
$A_R = A_L equiv A_0 \/ 2$. The reader can verify that
$T_x \( t \, x \)$ then reduces to the form given in
#ref(label("Gaussian in x"), supplement: none).

== Comment on Time-Dependent Source
#label("Comment on Time-Dependent Source")
For a heat pulse, the source can be modeled as a Dirac delta function in
time, eliminating the need for a one-dimensional integral over $t$. In
this case, the closed-form analytical Green's function for the $3 + 1$
model provides a complete solution.

However, for a long-exposure scenario, the integration in
#ref(<FactroizedSourceConv>, supplement: none) over $t$ becomes
nontrivial. If the power remains constant over time ($A \( t \) = A_0$),
the integral retains the same structural form but simplifies
quantitatively. Conversely, if the power is explicitly time-dependent
($A \( t \) eq.not A_0$), the integral undergoes a qualitative change
due to the evolving source term. From a numerical perspective, both
cases follow the same computational approach; the only modification is
the functional form of $A \( t \)$.

We urge the reader to check some examples on time dependent source in
Appendix #ref(label("source Using LT")).

#figure(image("source/figures/SlabInLimits.pdf", width: 8cm),
  caption: [
    This figure illustrates that our cooling model, as reported in this
    paper, is a generalization of Rosenthal's models in two and three
    dimensions. In the limit of $w arrow.r 0$, our model reduces to the
    2D Rosenthal model with cooling, while in the limit $w arrow.r oo$,
    it converges to the 3D infinite Rosenthal model without cooling.
    Unlike these limiting cases, our model can capture variations in the
    $z$-direction and solve the problem in full three dimensions without
    additional assumptions. Moreover, it can be further generalized to
    account for finite width in both the $x$ and $y$ directions.
  ]
)
<comparisonWithRosenthal>

= Rosenthal's Model as a Special Case of Our Framework
<Rosenthal_as_special_case>
In @rosenthal1946, Rosenthal developed analytical models for 2D heat
transfer with cooling effects and 3D heat transfer without cooling, both
under a steady-state constraint. Our model extends Rosenthal's work in
two key aspects. First, it accommodates finite-geometry 3D heat transfer
while incorporating cooling effects, enabling a more comprehensive
analysis in the finite-width regime. Second, it accounts for transient
behavior which is crucial in understanding crack formation. In the
following subsections, we compare Rosenthal's results with our model and
demonstrate that they emerge as limiting cases, as illustrated in
Fig.~#ref(<comparisonWithRosenthal>, supplement: none).

== Rosenthal's 2D Model as a Special Case at Limit of $w arrow.r 0$
#label("Rosenthal 2D")
Rosenthal's 2D cooling model is formulated under the thin-width
assumption $w arrow.r 0$, which corresponds to a specific limit of our
more general framework, able to probe the temperature profile more in
finite width $w$. To demonstrate this connection, we will work with the
Temperature conformal function $phi.alt$ defined in @rosenthal1946 as
follows:
$ T \( t \, arrow(x) \) = e^(- frac(v x, 2 alpha)) phi.alt \( t \, arrow(x) \) . $

By approximating the second $z$-derivative in the corresponding Heat PDE
on $phi.alt$:

$ frac(partial^2 phi.alt, partial z^2) approx frac(frac(partial phi.alt, partial z) #scale(x: 120%, y: 120%)[\|]_(z = w) - frac(partial phi.alt, partial z) #scale(x: 120%, y: 120%)[\|]_(z = 0), w) . $

Applying the NLOC in #ref(<NLOC>, supplement: none) for $phi.alt$, we obtain:

$ frac(partial^2 phi.alt, partial z^2) & approx frac(- H_1 phi.alt \( w \, r \) - H_2 phi.alt \( 0 \, r \), w)\
 & approx - frac(H_1 + H_2, w) phi.alt \( r \) \,\
 $

assuming that $phi.alt$ does not significantly vary along $z$, which is
valid under $w arrow.r 0$. Substituting this into the governing
equation, the resulting PDE simplifies to:

$ frac(partial^2 phi.alt, partial r^2) + 1 / r frac(partial phi.alt, partial r) - [frac(v^2, 4 alpha^2) + frac(H_1 + H_2, w)] phi.alt = - q' / alpha frac(delta \( r \), r) \, $

which is one used by Rosenthal for the 2D model. This demonstrates that
Rosenthal's model naturally emerges from our generalized formulation
under the thin-width assumption $w arrow.r 0$. However, for finite
values of $w$, the Rosenthal assumption that $phi.alt$ remains uniform
along $z$ no longer holds. Consequently, a more comprehensive treatment,
such as the one provided by our model, is necessary to capture the
cooling effects in a broader range of applications where $w$ is
non-negligible.

== The Limit of $w arrow.r oo$: Recovering Rosenthal's 3D Solution
#label("Rosenthal 3D")
To further validate our model, we examine the behavior of the
temperature field in the limit $w arrow.r oo$. Instead of taking this
limit in the solution itself, a more systematic approach is to revisit
the BVP.

To facilitate this analysis, we symmetrize the problem by shifting the
coordinate system to the midpoint of the thin dimension $z$, i.e.,
$z arrow.r z - w / 2$. Under this transformation, the governing PDE is
unchanged, while the boundary conditions can be rewritten as:

$ T\|_(\( z = - w \/ 2 \)) = e^(- H_1 w \/ 2) \, quad quad T\|_(\( z = w \/ 2 \)) = e^(- H_2 w \/ 2) . $

Since $H_1$ and $H_2$ are finite, the exponential terms decay rapidly as
$w arrow.r oo$, hence in this limit, B.C. are:

$ T\|_(z = - w \/ 2) approx 0 \, quad quad T\|_(z = w \/ 2) approx 0 . $

Thus, for large $w$, the system behaves as an open domain in $z$,
restoring spherical symmetry. The governing PDE can then be rewritten in
spherical coordinates $\( cal(R) \, theta \, phi.alt \)$, where $cal(R)$
is the radial coordinate:

$ frac(partial^2 phi.alt, partial cal(R)^2) + 2 / cal(R) frac(partial phi.alt, partial cal(R)) - frac(v^2, 4 alpha^2) phi.alt = 0 . $

The general solution to this equation is:

$ phi.alt = A e^(- frac(v, 2 alpha) cal(R)) / cal(R) \, $

where $A$ is determined by B.C. near the heat source at
$cal(R) approx 0$. This recovers the well-known Rosenthal 3D solution,
which does not include cooling effects. Thus, we have established that
our model naturally reduces to the 3D Rosenthal solution in the
$w arrow.r oo$, further confirming its consistency.

== Transient Behavior: Beyond Steady-State Solutions
#label("Transient Behavior")
As a proof of concept, we demonstrate that Rosenthal's models can be
extended beyond the steady-state solution, where
$partial phi.alt \/ partial t eq.not 0$. To probe more the transient
behavior of the heat profile, we can use a tool such as the LT, which is
particularly well-suited for IVPs. In contrast, using the FT in $t$ can
only recover the steady-state component of the solution. We solve an
explicit case study within thin width approximation in Appendix
#ref(label("SpecialCase LT Rosenthal")). Furthermore, we examine another
case study within our generalized model, as detailed in Appendix
@TransientOurModel.

In the following analysis, we continue working with the conformal
profile $phi.alt$. We focus on 2D model with cooling, where the PDE
(with no steady state assumption) is given by:

$ frac(partial phi.alt, partial t) - alpha {frac(partial^2 phi.alt, partial x^2) + frac(partial^2 phi.alt, partial y^2) - [frac(v^2, 4 alpha^2) + frac(H_1 + H_2, w)] phi.alt}\
= q' delta \( x - x' \) delta \( y - y' \) . $

While this PDE appears more complex than the steady-state case
(Rosenthal's 2D heat equation), we can simplify the problem by
leveraging the fact that in co-moving frame, the Kernel's source term is
time-independent. Here, we first adopt the FT.

#emph[FT Approach: Recovering the Steady-State Solution]---The
transformed governing equation takes the form:

$ frac(partial^2 phi.alt', partial r^2) + 1 / r frac(partial phi.alt', partial r) - [frac(v^2, 4 alpha^2) + frac(H_1 + H_2, w) + i omega / alpha] phi.alt'\
= - frac(2 pi q', alpha r) delta \( r \) delta \( omega \) \, $ where
$phi.alt arrow.r^(F T) phi.alt'$ in $omega$- space.

This equation closely resembles Rosenthal's steady-state model, with the
only difference being the additional frequency-dependent term
$i omega / alpha$.

The presence of $delta \( omega \)$ ensures that integrating over
$omega$ reduces the solution to its steady-state counterpart:

$ T \( t \, r \) = e^(- frac(v x, 2 alpha)) q' / alpha K_0 (r sqrt(frac(v^2, 4 alpha^2) + frac(H_1 + H_2, w))) . $

This result confirms that the steady-state 2D Rosenthal solution
naturally emerges in the Fourier domain. However, a fundamental
limitation arises: #emph[the FT does not capture transient behavior---it
inherently assumes the system has already reached equilibrium]. To
investigate how the system evolves from its initial state to
steady-state, we must turn to the LT.

#emph[LT Approach: Capturing Transient Behavior]---Applying the LT
instead of the FT yields a governing equation with an additional term
that accounts for I.C.:

$ frac(partial^2 phi.alt', partial r^2) + 1 / r frac(partial phi.alt', partial r) - [frac(v^2, 4 alpha^2) + frac(H_1 + H_2, w) + s / alpha] phi.alt'\
= - frac(2 pi q', alpha r) 1 / s delta \( r \) - phi.alt \( r \, 0 \) . $
where this time $phi.alt arrow.r^(L T) phi.alt'$ in $s$-space.

The Laplace-transformed solution $phi.alt'$ not only contains the
steady-state term but also incorporates a transient component that
encodes the system's evolution from $phi.alt \( r \, 0 \)$ to the
steady-state regime. The solution for $phi.alt$ in the Laplace domain
is:

]

$ phi.alt \( t \, r \) = frac(q' e^(- frac(v x, 2 alpha)), alpha) K_0 (r sqrt(frac(v^2, 4 alpha^2) + frac(H_1 + H_2, w))) + integral_(epsilon.alt - i oo)^(epsilon.alt + i oo) d s frac(e^(s macron(t)), 2 pi i) integral_0^oo d r' phi.alt \( r' \, 0 \) K_0 (\| r - r' \| sqrt(frac(v^2, 4 alpha^2) + frac(H_1 + H_2, w) + s / alpha)) . $

#columns(2, gutter: 16pt)[

The first term recovers the steady-state 2D Rosenthal solution, while
the second term captures the transient behavior, illustrating how the LT
effectively characterizes the system's transition from its initial state
to its steady-state phase. Consequently, if analyzing crack formation
requires deeper insight into the transient state of the system, our
model provides a framework to capture these dynamics as well.

For a concrete example of how the transient solution evolves under
specific I.C., refer to Appendix
#ref(label("SpecialCase LT Rosenthal")), where we illustrate through a
case study the transient response. Additionally, we direct the reader to
the Appendix #ref(<TransientOurModel>, supplement: none),that explores transient behavior in our
full 3D model, extending beyond the thin-width approximation.

= Conclusion and Future Outlook
<Conclusion>
In this work, we developed a comprehensive analytical framework for
finite-geometry 3D heat transfer while systematically incorporating
cooling effects. By treating heat loss as an energy flux B.C, we
provided a natural way to model cooling mechanisms. Our framework
accommodates Newton's Law of Cooling, Stefan-Boltzmann radiation, and a
generalized phenomenological cooling B.C, ensuring flexibility in
modeling diverse physical systems.

A key focus of this study was on the transient behavior of the
temperature profile, which plays a critical role in understanding crack
formation during welding and additive manufacturing processes. We
emphasized the significance of the Laplace Transform in capturing time
evolution, as it effectively describes how the system evolves from its
initial state toward equilibrium. The ability of the Laplace Transform
to resolve both transient and steady-state behavior makes it
particularly well-suited for problems involving time-dependent sources,
which is why it was the primary tool in our analysis.

We analytically solved for time-dependent heat sources, such as the
on/off switch point source model, obtaining closed-form solutions in 1D
for moving sources and in 2D/3D for static sources. A generalization to
a moving heat source in 3D results in a one-dimensional temporal
integral, which can be efficiently evaluated numerically.

Beyond point sources, we extended our analysis to spatially distributed
sources, including Gaussian, Ellipsoidal, and Double Ellipsoidal
profiles, generalizing previous works such as those by Nguyen and Eager
& Tsai. In 3D, for short-duration sources, we provided closed-form
analytical solutions using two equivalent approaches: (1) Two Fourier
Transforms + Laplace Transform and (2) Two Fourier Transforms + Fourier
Series. We proved their equivalence and demonstrated that, for
long-duration sources, a one-dimensional integral is required, which
remains computationally efficient for numerical evaluation.

Furthermore, we derived an analytical closed-form solution for the 3+1
Heat Kernel using both approaches mentioned above. Additionally, we
validated the equivalence of different solution methods: (a) a pure
numerical implementation of the full model, (b) Approach (1), and (c)
Approach (2). Our results confirm that while all three methods yield
equivalent solutions, analytical approaches significantly reduce
computational costs and experimental resource requirements while also
providing deeper physical insight into the dynamics of heat transfer.

Finally, we demonstrated that our framework naturally recovers
Rosenthal's models in 2D with cooling and 3D without cooling as special
limiting cases, reinforcing the generality and robustness of our
approach.

For future work, this methodology can be extended to incorporate
finite-width boundaries in 2D and 3D using Fourier Series, which
provides a natural extension of our current formulation. Another
promising direction is the adaptation of our model to curved geometries,
such as spherical, cylindrical, or elliptical domains, making it
applicable to scenarios where sample geometry plays a crucial role.
Furthermore, more complex heat sources can be analyzed by expanding them
in Fourier or Taylor series in both time and space, allowing for the
modeling of arbitrary heat deposition profiles.

By developing these extensions, our framework can be further refined to
analyze more realistic heat transfer scenarios, aiding in computational
modeling and experimental validation of thermal processes in materials
science, manufacturing, and engineering applications. These advancements
align with ongoing efforts within the Integrated Computational Materials
Engineering (ICME) program to enhance predictive modeling capabilities
for advanced manufacturing.

As a next step, we plan to conduct targeted experimental investigations
to validate and benchmark our generalized thermal modeling framework.
These experiments will focus on directly comparing the predictive
accuracy of our model against other Rosenthal-based models reported in
the literature. By evaluating model performance under realistic process
conditions --- including variable heat source profiles, finite
boundaries, and complex cooling mechanisms --- we aim to further assess
the robustness, applicability, and limitations of our approach.

Additionally, integrating our analytical framework with physics-informed
machine learning models could enhance predictive heat management
strategies. By leveraging ML techniques trained on synthesized data as
well as experimental data, we can develop data-driven models that
optimize heat control in manufacturing processes, ultimately leading to
improved material quality, reduced thermal stresses, and enhanced
process efficiency. Such hybrid approaches could bridge the gap between
theoretical modeling and real-world applications.

#block[
We thank the EWI team for many fruitful discussions.

]
#heading(level: 1, numbering: none)[Author Declarations]
<author-declarations>
#heading(level: 2, numbering: none)[Competing Interests]
<competing-interests>
The authors have no conflicts to disclose.

#heading(level: 2, numbering: none)[Author Contributions]
<author-contributions>
F.A.: conceptualization, theory, methodology, analysis,
writing---original draft. A.K.: validation, software, writing---review &
editing. L.M.: validation, software, writing---review & editing.

#heading(level: 1, numbering: none)[Data Availability]
<data-availability>
The data that support the findings of this study are available from the
corresponding author upon reasonable request.

]
#counter(heading).update(0)
#set heading(numbering: "A.1")
#columns(2, gutter: 16pt)[

]
#set math.equation(numbering: n => "(A" + str(n) + ")")
#counter(math.equation).update(0)
#columns(2, gutter: 16pt)[

= On/Off Point Source
#label("source Using LT")
Handling time-dependent source terms poses significant mathematical
challenges as time is a shared variable across all spatial integrands in
#ref(<Convlution>, supplement: none). Physically, this complexity arises
from causality and retardation effects, encoded in the Heat Kernel $G$,
which govern how heat propagates over time.

To simplify the analysis, we focus on a source term modeled as a point
source with a capturing the gradual increase or decrease in power over
time:

$ S \( t \, x \, y \, z \) = Theta_(upright("switch")) \( t \) A \( t \) delta \( x - x_0 \) delta \( y - y_0 \) delta \( z - z_0 \) \,\
Theta_(upright("switch")) \( t \) equiv Theta \( t - t_(upright("off")) \) - Theta \( t_(upright("on")) - t \) $

$Theta_(upright("switch")) \( t \)$ “turns on\" the heat source at
$t_(upright("on"))$ and “turns it off\" at $t_(upright("off"))$,
mimicking real-world heat pulse scenarios. As we will see below,
generalizing $A \( t \)$ to any polynomial or exponential function is
straightforward.

we choose to commute the “source\" integral with the spectral integral
as discussed in #ref(label("Heat Profile for different Source terms")).
While doing so may simplify the integration, it can introduce additional
poles in the contour integral in the $s$-complex plane, as also further
discussed in Appendix #ref(label("Using LT OPTION1")).

=== 1D Case: Heat Propagation Along $z$
<d-case-heat-propagation-along-z>
To build intuition, we first consider a simplified 1D case in the
$z$-direction with cooling boundary conditions.

#emph[Constant Power Input (Step Function)] --- We begin by assuming a
switched heat source with no explicit time dependence in power. This
reduces the problem to evaluating the following integral:

]

$ T \( t \, z \) & = integral_(- oo)^t d t' Theta_(upright("switch")) \( t' \) cal(L)^(- 1) {tilde(G) \( z \, z_0 \; s \)} = integral_(t_(upright("on")))^(t_(upright("off"))) d t' cal(L)^(- 1) {tilde(G) \( z \, z_0 \; s \)} \, $

where $cal(L)^(- 1)$ denotes the inverse Laplace transform (ILT).
Setting $t_(upright("on")) = 0$ and $t_(upright("off")) = t$, meaning
the source remains active until the moment of observation, we obtain:

$ T \( t \, z \) = integral_0^t d t' cal(L)^(- 1) {tilde(G) \( z \, z_0 \; s \)} = cal(L)^(- 1) {frac(tilde(G) \( z \, z_0 \; s \), s)} . $

This result provides the temperature profile while the source is active.
If we also wish to describe the system after $t_(upright("off"))$, we
exploit the linearity of the problem:

$ T \( t \, z \) = - integral_(- oo)^oo d t' H \( t' - t_(upright("on")) \) cal(L)^(- 1) {tilde(G) \( z \, z_0 \; s \)} - integral_(- oo)^oo d t' H \( t' - t_(upright("off")) \) cal(L)^(- 1) {tilde(G) \( z \, z_0 \; s \)}\
= - integral_(t_(upright("on")))^oo d t' cal(L)^(- 1) {tilde(G) \( z \, z_0 \; s \)} - integral_(t_(upright("off")))^oo d t' cal(L)^(- 1) {tilde(G) \( z \, z_0 \; s \)}\
= cal(L)^(- 1) {frac(tilde(G) \( z \, z_0 \; s \), s) #scale(x: 180%, y: 180%)[\|]_(t' = t_(upright("on")))} - cal(L)^(- 1) {frac(tilde(G) \( z \, z_0 \; s \), s) #scale(x: 180%, y: 180%)[\|]_(t' = t_(upright("off")))} . $

#columns(2, gutter: 16pt)[

This approach reduces the double integral to a single effective contour
integral, at the expense of introducing a simple pole at $s = 0$ in the
ILT, as anticipated. This integral can be evaluated using the Residue
theorem, as discussed in #ref(label("Using the Residue Theorem")). A
closed-form series solution follows naturally and corresponds to
#ref(<ZPartSeriesSolution>, supplement: none), where
$A \( beta_n \) arrow.r A \( beta_n \) \/ s_n$ and the series has an
additional pole at $s_n = 0$.

#emph[Linearly Growing Power Input] --- Now, we consider a heat source
with a linearly increasing power input during the heating phase:
$ A \( t \) = c_0 + c_1 t . $

Using the LT property:
$ cal(L) { t^n f \( t \) } = \( - 1 \)^n frac(d^n, d s^n) F \( s \) \, $
where $n$ is a positive integer, we obtain:

]

$ T \( t \, z \) & = c_0 cal(L)^(- 1) {frac(tilde(G) \( z \, z_0 \; s \), s) #scale(x: 180%, y: 180%)[\|]_(t' = t_(upright("on")))} - cal(L)^(- 1) {frac(tilde(G) \( z \, z_0 \; s \), s) #scale(x: 180%, y: 180%)[\|]_(t' = t_(upright("off")))}\
 & quad + c_1 cal(L)^(- 1) {frac(d, d s) (frac(tilde(G) \( z \, z_0 \; s \), s) #scale(x: 180%, y: 180%)[\|]_(t' = t_(upright("on"))))} - cal(L)^(- 1) {frac(d, d s) (frac(tilde(G) \( z \, z_0 \; s \), s) #scale(x: 180%, y: 180%)[\|]_(t' = t_(upright("off"))))} . $

#columns(2, gutter: 16pt)[

From here, obtaining a series solution is straightforward.

This result illustrates the advantage of working in spectral space: a
potentially complicated temporal integration is transformed into a more
manageable algebraic form, simplifying the solution.

=== Static Source in 2D and 3D
<static-source-in-2d-and-3d>
Now, let's extend the analysis to the 2D and 3D cases with a stationary
source:

]

$ T \( t \, x \, y \, z \) & = integral_(t_(upright("on")))^(t_(upright("off"))) d t' A \( t' \) G_(0 1 D) \( x - x_0 \, macron(t) \) G_(0 1 D) \( y - y_0 \, macron(t) \) cal(L)^(- 1) { tilde(G) \( z \, z_0 \; s \) } . $#label("SwitchStatic Source in 2D and 3D")

#columns(2, gutter: 16pt)[

We consider the static source case ($v arrow.r 0$) as performing the
time integral analytically after commutation becomes not straightforward
for $v eq.not 0$. However, for $v = 0$, explicit evaluation is possible
in certain cases. If the power input is constant, $A \( t \) = A_0$, the
time integral can be carried out using error functions $upright("Erf")$,
which leads to a different pole structure that can still be handled
using the Residue Theorem, as discussed earlier. If $A \( t \)$ is a
polynomial in $t$, the integral remains analytically solvable following
similar steps. In contrast, for $v eq.not 0$, the integral does not
admit a closed-form solution and must be evaluated numerically.

]
#set math.equation(numbering: n => "(B" + str(n) + ")")
#counter(math.equation).update(0)
#columns(2, gutter: 16pt)[

= Option 1. Commuting Integrals: Ellipsoidal and Gaussian Sources Example
#label("Using LT OPTION1")
Returning to the case of an ellipsoidal Gaussian source, we aim to
demonstrate that the heat profile $T \( t \, x \, y \, z \)$ can be
obtained by commuting the integrals rather than evaluating the source
integral first. Both methods are discussed in
#ref(label("Heat Profile for different Source terms")). However, as we
will show, this approach is analytically more involved for this specific
example.

]

$ T \( t \, x \, y \, z \) & = integral_(- oo)^t d t' T_x \( macron(t) \, x \) T_y \( macron(t) \, y \) G_(0 1 D) \( y \, macron(t) \) integral_0^w d z' e^(- frac(\( z' - z_c \)^2, sigma_z^2)) integral_(tilde(epsilon.alt) - i oo)^(tilde(epsilon.alt) + i oo) d s e^(s macron(t)) tilde(G) \( z \, z' \) $<eq:T_solution>

There is nothing forbidden about commuting the integrals and integrating
the source terms with the $z'$ dependence in $tilde(G) \( z \, z' \)$,
leading to the following expression:

$ cal(J) \( macron(t) \, z \) = integral_(tilde(epsilon.alt) - i oo)^(tilde(epsilon.alt) + i oo) d s integral_(- oo)^oo d z' e^(- frac(\( z' - z_c \)^2, sigma^2)) e^(s macron(t)) tilde(G) \( z \, z' \) = frac(sqrt(pi) sigma_z, 2) (J_(\( + \, + \)) + J_(\( + \, - \)) + J_(\( - \, + \)) + J_(\( - \, - \))) $<eq:I_final>

Each $J_(\( plus.minus \, plus.minus \))$ is given by:
$ J_(\( plus.minus \, plus.minus \)) = integral_(tilde(epsilon.alt) - i oo)^(tilde(epsilon.alt) + i oo) d s frac(j_(\( plus.minus \, plus.minus \)), D \( beta \, w \, H_1 \, H_2 \)) $<eq:I_signs>

where the denominator is defined as:
$ D \( beta \, w \, H_1 \, H_2 \) = 2 beta [\( H_1 + beta \) \( H_2 + beta \) - \( H_1 - beta \) \( H_2 - beta \) e^(- 2 w beta)] $<eq:D_beta>

The numerator $j_(plus.minus \, plus.minus)$ is more intricate,
involving error functions $"Erf"$, as shown below:



#unnumbered[
$ j_(\( + \, - \)) = - e^(\( - 2 w + z + z_c \) beta + frac(beta^2 sigma^2, 4)) \( H_1 + beta \) \( H_2 - beta \) ["Erf" (frac(w - z_c, sigma) - frac(beta sigma, 2)) + "Erf" (z_c / sigma + frac(beta sigma, 2))]\
j_(\( - \, + \)) = - e^(1 / 4 beta \( - 4 z - 4 z_c + beta sigma^2 \)) \( H_1 - beta \) \( H_2 + beta \) ["Erf" (z_c / sigma - frac(beta sigma, 2)) + "Erf" (frac(2 w - 2 z_c + beta sigma^2, 2 sigma))]\
j_(\( + \, + \)) = e^(1 / 4 beta \( - 4 z - 4 z_c + beta sigma^2 \)) \( H_1 + beta \) \( H_2 + beta \) \[e^(2 z_c beta) "Erf" (z / sigma - z_c / sigma - frac(beta sigma, 2)) + e^(2 z_c beta) "Erf" (z_c / sigma + frac(beta sigma, 2))\
quad + e^(2 z beta) {"Erf" (frac(2 w - 2 z_c + beta sigma^2, 2 sigma)) - "Erf" (frac(2 z - 2 z_c + beta sigma^2, 2 sigma))}\]\
j_(\( - \, - \)) = e^(1 / 4 beta \( - 8 w - 4 z - 4 z_c + beta sigma^2 \)) \( H_1 - beta \) \( - H_2 + beta \) \[- e^(2 z_c beta) "Erf" (w / sigma - z_c / sigma - frac(beta sigma, 2)) + e^(2 z_c beta) "Erf" (z / sigma - z_c / sigma - frac(beta sigma, 2))\
quad - e^(2 z beta) {"Erf" (z_c / sigma - frac(beta sigma, 2)) + "Erf" (frac(2 z - 2 z_c + beta sigma^2, 2 sigma))}\] . $
]



Although this integral appears quite involved, it retains the same pole
structure as the Heat Kernel itself. Hence, we can find use Reside
theorem and have a closed form series solution.

Moreover, from a computational perspective, this integral can be
decomposed into 16 smaller sub-integrals using the linearity property of
integration, in the same manner that the point source integral was split
into four.

#columns(2, gutter: 16pt)[

]
#set math.equation(numbering: n => "(C" + str(n) + ")")
#counter(math.equation).update(0)
#columns(2, gutter: 16pt)[

= Modeling Heat Loss as Boundary Conditions
#label("Cooling Boundary Conditions")
NLOC describes the rate of heat loss of a body proportional to the
difference in temperature between the body and its surroundings
@incropera2011fundamentals:
$ frac(partial T, partial t) = - h \( T - T_oo \) $ where $h$ is the
heat transfer coefficient, $T$ is the temperature of the body, and
$T_oo$ is the ambient temperature. On the other hand, when considering
SB radiation, the heat loss includes a term proportional to the fourth
power of the temperature $T$, reflecting radiative heat transfer:
$ frac(partial T, partial t) = - epsilon.alt macron(sigma) \( T^4 - T_oo^4 \) $<SBC>
where $epsilon.alt$ is the emissivity of the surface and $macron(sigma)$
is the SB constant. Moreover, a phenomenological homogeneous cooling
term can be expressed as:
$ frac(partial T, partial t) = - sum_(n = 1)^(n') cal(C)_n \( T^n - T_oo^n \) $<PBC>
where $n'$ is a positive integer and $cal(C)_n$ represents coefficients
for different powers of $n$, enabling a general model to account for
different cooling mechanisms simultaneously.

When considering SB radiation, the heat loss includes a term
proportional to $T^4$ @siegel2015thermal.

Since we mean by cooling loss of energy flux to the environment it we
choose to model cooling as B.C. For example in the setup we have in this
article, we choose to apply #ref(<NLOC>, supplement: none),
#ref(<PBC>, supplement: none), and #ref(<SBC>, supplement: none) at a condition on $T$
at $z = 0$ and $z = w$.

Since cooling represents energy flux loss to the environment, we impose
it as a B.C. In the framework of this study, we apply equations
#ref(<NLOC>, supplement: none), #ref(<PBC>, supplement: none), or #ref(<SBC>, supplement: none)
at $z = 0$ and $z = w$.

]
#set math.equation(numbering: n => "(D" + str(n) + ")")
#counter(math.equation).update(0)
#columns(2, gutter: 16pt)[

= Integral Transformations and Their Inverses
#label("FS and LT")
For foundational LT and inversion via Bromwich contour we refer to
@schiff1999laplace. Standard differential-equation techniques referenced
in @krantz2022differential.

The LT of a function $f \( t \)$ is defined as
$ cal(L) { f \( t \) } = F \( s \) = integral_0^oo e^(- s t) f \( t \) thin d t . $
Here, $s$ is a complex variable, and the integral is evaluated over
$t in \[ 0 \, oo \)$. The Inverse Laplace Transform (ILT) recovers
$f \( t \)$ from $F \( s \)$ and is given by
$ f \( t \) = cal(L)^(- 1) { F \( s \) } = frac(1, 2 pi i) lim_(T arrow.r oo) integral_(epsilon.alt - i T)^(epsilon.alt + i T) e^(s t) F \( s \) thin d s \, $<ILT>
where $epsilon.alt$ is chosen such that all singularities of $F \( s \)$
lie to the left of $s_R = epsilon.alt$, ensuring convergence.

The FT decomposes a function into its frequency components and is
particularly useful for infinite-domain problems. It is defined as
$ cal(F) { f \( x \) } = hat(f) \( k \) = integral_(- oo)^oo f \( x \) e^(- i k x) thin d x . $
The Inverse Fourier Transform (IFT) reconstructs $f \( x \)$ from
$hat(f) \( k \)$ using

$ f \( x \) = cal(F)^(- 1) { hat(f) \( k \) } = frac(1, 2 pi) integral_(- oo)^oo hat(f) \( k \) e^(i k x) thin d k . $

]
#set math.equation(numbering: n => "(E" + str(n) + ")")
#counter(math.equation).update(0)
#columns(2, gutter: 16pt)[

= Why Are Initial Conditions Important?
#label("IC Section")
Understanding I.C. is essential for analyzing transient thermal
behavior, which plays a critical role in crack formation. Rapid
temperature changes create thermal gradients that induce internal
stresses, leading to material failure. This is particularly important in
AM processes, where uneven cooling rates can cause defects such as
warping, dimensional inaccuracies, and phase transformations. Accurately
modeling I.C. helps predict and mitigate these issues.

#emph[powder bed fusion (PBF)]---A relevant example arises in PBF
processes, where each newly fused layer inherits thermal effects from
the previously processed layers. The I.C. for a newly deposited layer is
non-trivial due to residual heat retention. For instance, the initial
temperature distribution can be modeled as an exponentially decaying
function with depth:



#unnumbered[
$ T \( t = 0 \, x \, y \, z \) = T_0 e^(- lambda z) exp (- x^2 / hat(sigma)_x - y^2 / hat(sigma)_y) \, $
]



where $T_0$ is the surface temperature of the top layer, $lambda$
represents the thermal penetration depth into the underlying layers, and
$hat(sigma)_x$, $hat(sigma)_y$ control heat spread in the spatial
dimensions. This I.C. directly affects heat propagation in the new
layer, influencing cooling rates and residual stresses.

#emph[Laser Cladding]---Another complex scenario arises in laser
cladding, where a laser fuses powdered or wire material onto a substrate
to form a coating or enhance surface properties. In this process, the
I.C. is critical because the base material retains residual heat from
previous passes. The new material being deposited must bond properly
while avoiding defects like cracks or incomplete fusion. The temperature
distribution in the substrate varies depending on the time between
cladding passes and the thickness of the deposited layer. A suitable
I.C. in this case may be an exponentially decaying temperature profile
along both depth and radial directions:



#unnumbered[
$ T \( t = 0 \, x \, y \, z \) = T_0 e^(- lambda z) exp (- alpha r^2) \, $
]



where $r = sqrt(x^2 + y^2)$ represents the radial distance from the
laser center, and $alpha$ describes the radial decay of heat. Properly
accounting for retained heat in the substrate and the evolving initial
temperature distribution is essential for ensuring a high-quality bond
and preventing defects.

]
#set math.equation(numbering: n => "(F" + str(n) + ")")
#counter(math.equation).update(0)
#columns(2, gutter: 16pt)[

= Derivation of Our Model's Green Function
#label("Derive GF")
The Green's function $tilde(G)$ for #ref(<Eqz>, supplement: none) satisfies the
ODE:

$ gamma tilde(G) - frac(partial^2 tilde(G), partial z^2) = delta \( z - z' \) . $

Let $phi.alt_H$ be the homogeneous solution of this ODE:

$ phi.alt_H = A e^(beta z) + C e^(- beta z) . $

Thus, $tilde(G) \( z \, z' \)$ can be written in the general form:

$ tilde(G) \( z \, z' \) = frac(phi.alt_H^(+) \( z_(>) \) phi.alt_H^(-) \( z_(<) \), W [phi.alt_H^(+) \( x \) \, phi.alt_H^(-) \( x \)]) \,\
W [phi.alt_H^(+) \( x \) \, phi.alt_H^(-) \( x \)] = phi.alt_H^(+) frac(partial phi.alt_H^(-), partial x) - phi.alt_H^(-) frac(partial phi.alt_H^(+), partial x) \, $<GreenFunctionWFormula>

where $-$ ($+$) indicates the solution satisfying the left (right) B.C.
To solve for $phi.alt_H$, we consider

$ gamma phi.alt_H - frac(partial^2 phi.alt_H, partial z^2) = 0 \,\
 $

So far, we have enforced the B.C. in $x$ and $y$ through a Fourier
integral. Next, focusing on the NLOC B.C, we use (@NLOC). The functions
$phi.alt_H^(-) \( z_(<) \)$ and $phi.alt_H^(+) \( z_(>) \)$ are given
by:

$ phi.alt_H^(-) \( z_(<) \) = C [eta e^(beta z_(<)) + e^(- beta z_(<))] \,\
phi.alt_H^(+) \( z_(>) \) = E [e^(beta z_(>)) + xi e^(- beta z_(>))] \,\
eta = frac(beta + H_1, beta - H_1) \, quad quad xi = frac(beta + H_2, beta - H_2) e^(2 beta w) . $<leftBC>

Substituting (@leftBC) into (@GreenFunctionWFormula), we obtain

$ tilde(G) \( z \, z' \) & = frac(1, 2 beta \( eta xi - 1 \)) #scale(x: 240%, y: 240%)[\[] eta e^(beta \( z_(>) + z_(<) \)) + e^(beta \( z_(>) - z_(<) \))\
 & quad + eta xi e^(- beta \( z_(>) - z_(<) \)) + xi e^(- beta \( z_(>) + z_(<) \)) #scale(x: 240%, y: 240%)[\]] . $

Following a similar approach, the Green's function can be derived for
the SB B.C. (@SBC) or polynomial B.C. (@PBC).

]
#set math.equation(numbering: n => "(G" + str(n) + ")")
#counter(math.equation).update(0)
#columns(2, gutter: 16pt)[

= Poles and Singular structure
#label("Poles and Singular structure")
For contour/branch-cut handling and estimation lemma background, see
@schiff1999laplace@churchill2009complex. We aim to prove by elimination
that the poles $s_n$ of the integrand in
#ref(<Isintegral>, supplement: none) must be negative, purely real, and
infinitely countable, thereby validating the factorization of the
$x \, y \, z$ dependencies in the Green function. We start with the
denominator of the integrand:

$ \( s^(1 \/ 2) - H_1 \) \( s^(1 \/ 2) - H_2 \) e^(- 2 s^(1 \/ 2) w)\
- \( s^(1 \/ 2) + H_1 \) \( s^(1 \/ 2) + H_2 \) = 0 . $<dem>

#emph[Case 1: The Root at $s = 0$]---The equation has a simple root at
$s = 0$. However, this does not correspond to a pole of the integration,
as the numerator in #ref(<Isintegral>, supplement: none) also vanishes
due to a simple root, ensuring that the integrand remains well-defined
at $s = 0$. Thus, there is no singularity at this point.

To facilitate further analysis, we introduce the following
redefinitions: $ beta equiv sqrt(frac(s, H_1 H_2)) \,\
chi equiv frac(H_1 + H_2, sqrt(H_1 H_2)) > 0 \,\
gamma_(+) equiv beta^2 + chi beta + 1 \,\
gamma_(-) equiv beta^2 - chi beta + 1 \,\
zeta equiv 2 w sqrt(H_1 H_2) > 0 . $ Rewriting Eq. #ref(<dem>, supplement: none)
in terms of these variables, we obtain:
$ gamma_(-) e^(- zeta beta) - gamma_(+) = 0 . $

#emph[Case 2: Real $beta$ (Positive $s$)]---For $beta > 0$, we note
that:
$ gamma_(+) > gamma_(-) arrow.r.double gamma_(+) > e^(- zeta beta) gamma_(-) . $
Thus, the equation cannot be satisfied for $beta > 0$. Similarly, for
$beta < 0$, we have:
$ gamma_(+) < gamma_(-) arrow.r.double gamma_(+) < e^(- zeta beta) gamma_(-) . $
Again, the equation is not satisfied. Therefore, no real values of
$beta$ (positive $s$) can be solutions.

#emph[Case 3: Purely Imaginary $beta$ (Negative $s_n$)]---Setting
$beta arrow.r i tilde(beta)$, we rewrite the equation in terms of
trigonometric functions:
$ \( - tilde(beta)^2 - i alpha tilde(beta) + 1 \) e^(- i zeta tilde(beta)) - \( - tilde(beta)^2 + i alpha tilde(beta) + 1 \) = 0 . $
Splitting into real and imaginary parts yields
$ \( cos \( zeta tilde(beta) \) - 1 \) \( 1 - tilde(beta)^2 \) = alpha tilde(beta) sin \( zeta tilde(beta) \) \,\
alpha tilde(beta) \( 1 + cos \( zeta tilde(beta) \) \) = \( tilde(beta)^2 - 1 \) sin \( zeta tilde(beta) \) . $
This results in the following transcendental condition:
$ cos \( zeta tilde(beta) \) = frac(\( H_1^2 - tilde(beta)^2 \) \( H_2^2 - tilde(beta)^2 \) - 4 H_1 H_2 tilde(beta)^2, \( H_1^2 + tilde(beta)^2 \) \( H_2^2 + tilde(beta)^2 \)) < 1 \, $
which admits infinitely many solutions. These roots $s_n$ are purely
real, negative, and not evenly spaced.

#emph[Case 4: Complex $beta$ (Complex $s_n$)]---Repeating the analysis
from Case 2, one can verify that the equation can only hold if the real
part of $s_n$ is zero. Hence, complex roots with nonzero real parts are
eliminated.

Since we have ruled out all cases except for purely real, negative roots
$s_n$, we conclude that the only poles of the integrand lie on the
negative real $s_R$-axis in spectral space, see Fig.~#ref(<poles>, supplement: none).

]
#set math.equation(numbering: n => "(H" + str(n) + ")")
#counter(math.equation).update(0)
#columns(2, gutter: 16pt)[

= Fourier Series Approach: Full Derivation
#label("FS Derivation")
To obtain the Green's function $G$ using the FS approach, we expand the
solution's $z$-dependence in terms of discrete eigenfunctions in $z$
dimension. This method naturally accommodates finite-width constraints
and converges to the FT in the limit $w arrow.r oo$, as discussed in the
main text.

The eigenfunctions $phi.alt_n \( z \)$ are determined by the BVP stemmed
from #ref(<Eqz>, supplement: none):

$ frac(d^2 phi.alt_n, d z^2) + lambda_n^2 phi.alt_n = 0 \, $

where the eigenvalues $lambda_n$ satisfy

$ tan (lambda_n w) = frac(\( H_1 + H_2 \) lambda_n, - H_1 H_2 + lambda_n^2) . $

The corresponding eigenfunctions take the form

$ phi.alt_n \( z \) & = lambda_n cos [macron(z) lambda_n] + H_2 sin [macron(z) lambda_n]\
 & = cos \( z lambda_n \) + H_1 / lambda_n sin \( z lambda_n \) . $

We expand $tilde(T) \( t \, k_x \, k_y \, z \)$ and
$tilde(S) \( t \, k_x \, k_y \, z \)$ in terms of these eigenfunctions:

$ tilde(T) \( t \, k_x \, k_y \, z \) & = sum_n hat(T)_n \( t \, k_x \, k_y \) phi.alt_n \( z \) \,\
tilde(S) \( t \, k_x \, k_y \, z \) & = sum_n hat(S)_n \( t \, k_x \, k_y \) phi.alt_n \( z \) . $

Similarly, the Green's function and Dirac delta function are expanded as

$ tilde(G) \( t \, k_x \, k_y \, z \, z' \) & = sum_n phi.alt_n \( z \) phi.alt_n \( z' \) tilde(G)_n \( t \, k_x \, k_y \) \,\
delta \( z - z' \) & = sum_n phi.alt_n \( z \) phi.alt_n \( z' \) . $

After applying this expansion, the heat equation reduces to an effective
first-order ODE in $t$:

$ frac(partial tilde(G)_n, partial t) + (k_x^2 + k_y^2 - i k_x v + lambda_n^2) tilde(G)_n = delta \( macron(t) \) . $

Solving this ODE through direct integration gives

$ tilde(G)_n = Theta \( macron(t) \) e^(- (k_x^2 + k_y^2 - i k_x v + lambda_n^2) macron(t)) . $

Finally, performing the IFT yields the Green's function in the spatial
domain:

]

$ G \( t \, x \, y \, z \, x' \, y' \, z' \) = Theta \( macron(t) \) sum_n phi.alt_n \( z \) phi.alt_n \( z' \) integral_(- oo)^oo integral_(- oo)^oo e^(- (k_x^2 + k_y^2 - i k_x v + lambda_n^2) t) e^(i k_x \( x - x' \) + i k_y \( y - y' \)) thin d k_x thin d k_y . $

which simplifies to

$ G \( t \, x \, y \, z \, x' \, y' \, z' \) = G_(0 1 D) \( macron(y) \, macron(t) \) G_(v 1 D) \( macron(x) \, macron(t) \) Theta \( macron(t) \) sum_n phi.alt_n \( z \) phi.alt_n \( z' \) e^(- lambda_n^2 macron(t)) . $

#columns(2, gutter: 16pt)[

This result confirms that the FS approach provides a fully equivalent
solution to the LT approach, up to an eigenfunction normalization
factor. This normalization introduces an additional constraint on the
FT, specifically related to the I.C. of the system. On the other hand,
the LT method inherently incorporates I.C, while in the FS approach,
they must be explicitly imposed through normalization. The primary
trade-off is that ILT involves evaluating a complex integral, whereas FS
yields a series solution, making it computationally efficient when
convergence is fast.

]
#set math.equation(numbering: n => "(I" + str(n) + ")")
#counter(math.equation).update(0)
#columns(2, gutter: 16pt)[

= Formulas
<Formulas>
]

$ cal(B)_n \( z \) = A \( s_n \) {e^(- i z_c beta_n) \( i H_1 + beta_n \) ["Erf" (a_n^(-) \[ z_c \]) + "Erf" (a_n^(+) \[ tilde(z) \])] + e^(i z_c beta_n) \( - i H_1 + beta_n \) ["Erf" (a_n^(-) \[ tilde(z) \]) + "Erf" (a_n^(+) \[ z_c \])]} \,\
 $
$ cal(C)_n \( z \) = A \( s_n \) {e^(i macron(z)_c beta_n) \( - i H_2 + beta_n \) ["Erf" (- a_n^(+) \[ macron(z)_c \]) + "Erf" (a_n^(+) \[ tilde(z) \])] + e^(- i macron(z)_c beta_n) \( i H_2 + beta_n \) ["Erf" (- a_n^(-) \[ macron(z)_c \]) + "Erf" (a_n^(-) \[ tilde(z) \])]} \, $
$ a_n^plus.minus \( z \) equiv 1 / sqrt(2) (z / sigma_z plus.minus i beta_n sigma_z) \,\
tilde(z) equiv z - z_c . $

#columns(2, gutter: 16pt)[

]
#set math.equation(numbering: n => "(J" + str(n) + ")")
#counter(math.equation).update(0)
#columns(2, gutter: 16pt)[

= Illustration of Transient Behavior in 2D Model: A Case Study
#label("SpecialCase LT Rosenthal")
To better illustrate the role of transient dynamics in 2D model, we
analyze a specific example where the I.C. is explicitly incorporated. As
previously shown, the solution to the IVP consists of two terms:

- The first term, with appropriate handling, recovers the steady-state
  Rosenthal solution.

- The second term encodes information about the transient response,
  capturing the system's evolution from its I.C. to steady-state.

To explore this transient behavior, we consider a physically reasonable
initial condition:

$ phi.alt \( r' \, 0 \) = e^(- a r') \, quad upright("where") quad a > 0 . $

Accordingly, the transient solution takes the form:

]

$ phi.alt_(upright("transient")) \( r \, t \) = frac(e^(- a r), 2 pi i) lim_(T arrow.r oo) integral_(epsilon.alt - i T)^(epsilon.alt + i T) d s thin e^(s t) [integral_0^r e^(a u) K_0 \( u B \( s \) \) thin d u + frac(ln (frac(a + sqrt(a^2 + B \( s \)^2), B \( s \))), sqrt(a^2 + B \( s \)^2))] \,\
B \( s \) = sqrt(frac(v^2, 4 alpha^2) + frac(H_1 + H_2, w) + s / alpha) . $

#columns(2, gutter: 16pt)[

For simplicity, consider the case where $r approx 0$. In this regime,
the first integral vanishes, and the I.C. modifies the pole structure,
introducing explicit time dependence into the system.

The transient component reflects the system's memory of its initial
state. A fundamental question in heat conduction is determining the
characteristic timescale over which the system transitions from its
transient state to steady-state. This transition defines the point at
which the influence of the initial condition is effectively erased,
leaving only the steady-state solution dictated by the continuous heat
source.

A more intense or time-dependent heat source would result in richer
transient behavior. However, even with this simple example, using LT
captures key physical features expected in practical applications such
as welding, where heat propagation evolves over time before reaching a
steady-state distribution.

This example highlights a key distinction between the Fourier and LT
approaches:

- #strong[FT:] Highlights intrinsic frequency modes, ideal for
  steady-state analysis. For a stationary source with time-translation
  symmetry, it retrieves steady-state behavior but omits transient
  evolution.

- #strong[LT:] Captures both transient and steady-state behavior, making
  it effective for analyzing I.Cs. and system relaxation timescales.

By incorporating the LT, we extend beyond Rosenthal's steady-state
analysis even in 2D and provide a more complete description of heat
conduction. This approach allows us to investigate how the system
evolves over time, offering insights into transient dynamics that are
essential in applications such as welding and AM.

]
#set math.equation(numbering: n => "(K" + str(n) + ")")
#counter(math.equation).update(0)
#columns(2, gutter: 16pt)[

= Transient-State Analysis in Our 3D Model
<TransientOurModel>
In this appendix, we analyze the transient behavior of our full 3D model
with cooling effects. Unlike steady-state solutions, which describe the
long-term thermal distribution, transient solutions capture the system's
evolution from an initial condition to equilibrium. Understanding this
transition is crucial in applications such as welding, where rapid
thermal variations affect material properties.

In co-moving frame, the PDE for the $phi.alt$'s Kernel is
$ frac(partial phi.alt, partial t) - alpha {frac(partial^2 phi.alt, partial x^2) + frac(partial^2 phi.alt, partial y^2) + frac(partial^2 phi.alt, partial z^2) - frac(v^2, 4 alpha^2) phi.alt}\
= q' delta \( x - x' \) delta \( y - y' \) delta \( z - z' \) . $

To solve this PDE, we consider two approaches: FT and separation of
variables.

#emph[FT]---Applying a FT in the $x$-$y$ plane,
$phi.alt \( x \, y \, z \) arrow.r hat(phi.alt) \( k_x \, k_y \, z \)$,
reduces the PDE to:

$ - macron(k)^2 hat(phi.alt) + frac(partial^2 hat(phi.alt), partial z^2) = A .\
hat(phi.alt) \( k_x \, k_y \, z \) = C_(+) e^(macron(k) z) + C_(-) e^(- macron(k) z) - A / macron(k)^2 . $

where: $ macron(k)^2 equiv k_x^2 + k_y^2 + frac(v^2, 4 alpha^2) \,\
A equiv - e^(frac(v x', 2 alpha)) q' / alpha e^(- i \( k_x x' + k_y y' \)) \, $

For the special case where $H_1 = H_2 = h$, the coefficients simplify
to:
$ C_plus.minus = frac(A h, macron(k)^2 [\( h plus.minus macron(k) \) e^(plus.minus macron(k) w) + h minus.plus macron(k)])\
 $

]

Reconstructing $phi.alt \( x \, y \, z \)$ in real space via IFT:

$ phi.alt \( x \, y \, z \) = frac(1, \( 2 pi \)^2) integral_(- oo)^oo integral_(- oo)^oo hat(phi.alt) \( k_x \, k_y \, z \) e^(i \( k_x x + k_y y \)) thin d k_x thin d k_y . $

The temperature profile consists of two contributions:

\1. Free solution without boundary effects:
$ T_(upright("free")) \( x \, y \) = frac(q', 2 pi alpha) e^(frac(- v \( x - x' \), 2 alpha)) K_0 (frac(v, 2 alpha) sqrt(\( x - x' \)^2 + \( y - y' \)^2)) \, $

\2. Cooling contribution with B.C.:
$ T_(upright("cool")) \( r \, z \) = q' / alpha frac(e^(frac(- v Delta x, 2 alpha)), \( 2 pi \)^2) integral_0^oo d k thin frac(2 sin k r, k^2 + frac(v^2, 4 alpha^2)) {frac(H [e^(- macron(k) z) + e^(- macron(k) \( w - z \))], \( H - macron(k) \) e^(- macron(k) w) + H + macron(k))} . $

#columns(2, gutter: 16pt)[

#emph[Separation of Variables]---Since solving the radial integral in
Fourier space seems to be complicated analytically, we also consider
solving the PDE using separation of variables. This method is
particularly useful when modeling the heat source as a B.C. at $r = 0$,
similar to the original Rosenthal approach. We assume a solution of the
form:

$ phi.alt \( r \, z \) = sum_n R_n \( r \) Z_n \( z \) \, $

which leads to the separated equations:

$ frac(d^2 R_n, d r^2) + 1 / r frac(d R_n, d r) - (lambda_n^2 + frac(v^2, 4 alpha^2)) R_n \( r \) = 0 \, $

$ frac(d^2 Z_n, d z^2) + lambda_n^2 Z_n = 0 . $

The solutions are:

$ R_n \( r \) = C K_0 (sqrt(lambda_n^2 + frac(v^2, 4 alpha^2)) r) \, $

$ Z_n \( z \) = A_n (cos lambda_n z + B sin lambda_n z) . $

Applying the NLOC B.C, this eigenvalues are given by:

$ lambda_n / H_2 sin \( lambda_n w \) - H_1 / H_2 cos \( lambda_n w \) = cos \( lambda_n w \) + H_1 / lambda_n sin \( lambda_n w \) . $

Finally, the full transient-state solution is:

]

$ phi.alt = sum_n A_n (cos lambda_n z' + H_1 / lambda_n sin lambda_n z') (cos lambda_n z + H_1 / lambda_n sin lambda_n z) K_0 (sqrt(lambda_n^2 + frac(v^2, 4 alpha^2)) r) \, $

#columns(2, gutter: 16pt)[

where $A_n$ is determined by the source condition at $r = 0$.

Each approach offers valuable insights into heat propagation and cooling
process. These solutions extend the steady-state analysis by capturing
the full temporal evolution of the system, which is crucial in
applications like welding and thermal modeling especially while
examining crack formation.
#bibliography("source/main.bib", style: "american-institute-of-physics")
]
