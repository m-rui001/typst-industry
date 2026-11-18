#set page(paper:"a4", margin:20mm, numbering:"1")
#set text(font:"Libertinus Serif",size:10.5pt)
#set par(justify:true,leading:.6em)
#set heading(numbering:"1.1")
#set math.equation(numbering:"(1)")
#show figure.caption: set text(size:9pt)
#align(center)[
  #text(size:16pt,weight:"bold")[Efficient calculation of magnetic fields from ferromagnetic materials near strong electromagnets, and application to stellarator coil optimization]
  #v(.6em)
  Matt Landreman#super[1,2], Humberto Torreblanca#super[2], and Antoine Cerfon#super[2]
  #v(.5em)
  #super[1] University of Maryland, College Park, MD 20742, USA \
  #super[2] Type One Energy Group, Inc., Knoxville, TN 37931, USA
]

*Abstract.* In fusion reactor design, steels under consideration for the blanket are ferromagnetic, so the steel's effect on the plasma physics must be examined.
For efficient calculation of these fields, we can exploit the fact that the ferromagnetic material gives a small perturbation relative to the fields from the electromagnetic coils and plasma.
Moreover the magnetization is saturated due to the strong fields in typical fusion systems.
These approximations significantly reduce the nonlinearity of the problem, so the magnetic materials can be described by an array of point dipoles of known magnitude, oriented in the direction of the coil and plasma field.
The approach is verified by comparison to finite-element calculations with commercial software and shown to be accurate.
As no linear or nonlinear solve is required, only evaluation of Biot-Savart-type integrals, the method here is significantly simpler to implement than other methods, and extremely fast.
The method is compatible with arbitrary CAD geometry, and also allows rapid computation of the magnetic forces.
We demonstrate adding the ferromagnetic effects to free-boundary magnetohydrodynamic equilibrium calculations, assessing the effect on plasma physics properties such as confinement and stability.
Moreover, it is straightforward to differentiate through the model to get the derivative of the field with respect to the electromagnet parameters.
We thereby demonstrate gradient-based coil optimization for a quasi-isodynamic stellarator in which the field contribution from a ferromagnetic blanket is included.
Even a significant steel volume is found to have little impact on the plasma physics properties, with the main effects being a slight destabilization of ballooning modes and a radial shift of the edge islands due to decrease in rotational transform.
Both of these issues are corrected by the minor reoptimization of the coil shapes to account for the field from the steel.

= Introduction
<sec:intro>
In the blanket of a fusion reactor, the leading candidates for
structural materials are steels that are ferromagnetic
@tanigawa2017development@mergia2008structural@hirose2014physical. This
choice is based on the requirements that the material maintain adequate
structural properties and low nuclear activation in the presence of high
neutron fluxes and high temperatures. Ferromagnetic materials are also
of interest in fusion for reducing magnetic field ripple from toroidal
field coils @turner1978@sheffield1993use@kawashima2001demonstration. In
fusion and in other magnetic systems such as magnetic resonance imaging
(MRI), pieces of ferritic material can be used as shims to fine-tune the
field @dorri2002passive@lopez2008passive. As physics properties of the
confined plasma can be highly sensitive to the magnetic field, it is
critical to compute the magnetic field including the effects of the
magnetic materials, which have motivated studies for both tokamaks
@tsuzuki2003high@tobita2003reduction@shinohara2011effects@chiariello2015effective
and stellarators
@ikuta1983helical@harmeyer1999effect@ji2017investigation. For all these
applications, it is desirable to have a fast and flexible method to
compute the magnetic field including the ferromagnetic materials, to
include in physics calculation workflows. Moreover, for design
optimization, where the field must be evaluated hundreds of times or
more, efficiency is a priority, and it is valuable to have derivatives
of the field with respect to design variables. In the present work, we
propose a new calculation method that satisfies these criteria, and
demonstrate its use for shape and current optimization of stellarator
electromagnets.

A fundamental challenge in calculating the field in the presence of
ferromagnetic materials is that magnetic material in one region affects
the magnetization in every other region. Therefore to achieve
consistency, it is necessary to solve a large system of equations.
Furthermore, the relationship between field and magnetization is
generally nonlinear, making this system of equations nonlinear,
requiring iteration to solve. Approaches include solving for the field
@newman1972gfun, scalar magnetic potential @carpentier2013resolution, or
vector potential @le2015magnetic in each element, or using analytic
formulas for the field of polyhedra used for the mesh
@bjork2021magtense. These methods share the advantage that there is no
need to mesh the volume outside the magnetic material; only the
ferromagnetic domain is meshed.

In contrast to these methods, our approach eliminates the need to solve
any system of equations and does not require any iteration. This
simplification is made possible by making two approximations which are
well satisfied for fusion systems, as we will show. The first
approximation is that the ferromagnetic materials perturb the total
field by a small amount compared to the field from the electromagnets
and plasma current. In several examples shown in the following sections,
this approximation is verified to be accurate. Second, as the saturation
magnetization of the material is achieved at field strengths much
smaller than the typical fields in magnetic fusion, the material is
saturated. This is true especially for high-field reactor designs based
on high-temperature superconductors
@creely2020overview@hegna2025infinity@lion2025stellaris, but is true
also for lower-field designs based on low-temperature superconductors.
Together, these approximations mean that the magnetization vector has a
known constant magnitude, pointing along the local field computed in the
absence of the steel. Since in this model ferromagnetic material in one
region does not affect magnetization in another, no system of equations
needs to be solved, and the field can be computed rapidly by
straightforward evaluation of Biot-Savart-type integrals without meshing
the volume outside the magnetic material. Specifically our method uses
the field from a large number of point dipoles, which conveniently has
already been available in several stellarator design frameworks
including SIMSOPT @landreman2021simsopt and FAMUS @zhu2020topology, so
minimal software development was required to implement the method.

Our method differs from previous work on magnetic materials in fusion in
several ways. Our approach is most similar to the one in the code FEMAG
@urata2003@shinohara2011effects, which also makes the same two
approximations described above. However the FEMAG approach also requires
that the magnetic material is represented as infinitesmally thin and
flat rectangular plates, whereas the approach here allows for arbitrary
computer-aided design (CAD) geometry. Our approach also differs from the
previous stellarator analysis in @harmeyer1999effect which assumed a
spatially uniform permeability; that is not an accurate approximation
since in fact the magnetization has uniform magnitude due to saturation
whereas the field magnitude varies considerably, so their ratio is
nonuniform. Our work can also be contrasted with the related problem of
producing stellarator fields with hard permanent magnets
@helander2020stellarators@zhu2020topology@hammond2022design@kaptanoglu2023greedy.
The permanent magnet problem considered in those references is
fundamentally different as the magnetization was considered to be
insensitive to the field from electromagnetic coils and plasma current,
in contrast to the case of soft ferromagnetic materials considered here.

The computational method presented in this article should be valid for
any magnetic fusion concept, including tokamaks, stellarators, and
mirror machines, in addition to other high-field devices such as MRI and
accelerators. In the specific case of stellarators, where the shapes and
currents of electromagnetic coils are optimized to achieve a desired
field in the plasma, the model introduced in this work provides a
significant advantage. As the field contribution from steel can be
computed rapidly, it can be included directly in the coil shape and
current optimization, which has not been previously demonstrated. It is
straightforward to obtain analytic derivatives of the field from steel
with respect to the electromagnet parameters, so the magnet optimization
remains gradient-based and efficient. We show that only small changes to
the coil shapes and currents are needed to compensate for the effect of
the steel in the blanket. Therefore, even if significant time is needed
for the engineering design of the shapes and locations of the
ferromagnetic components, the magnetic field effects can be accounted
for by a small adjustment to the coil shapes at the end.

Our mathematical method is described in detail in the following section.
To verify its accuracy, a benchmark with the commercial finite-element
code COMSOL @comsol is presented in section @sec:comsol, where excellent
agreement is demonstrated for the geometry of a modern quasi-isodynamic
stellarator reactor. The coil optimization example is then presented in
section @sec:opt. In that section, we also demonstrate how the effects
of materials can be included straightforwardly in free-boundary
magnetohydrodynamic (MHD) equilibrium calculations, to assess the impact
on physics properties such as confinement and stability. Overall we find
that the magnetic materials have little effect on the plasma physics
properties of the self-consistent MHD equilibria, with the largest
effects being a reduction in rotational transform
@harmeyer1999effect@ji2017investigation that causes a shift in the edge
magnetic islands, and a slight destabilization of ideal ballooning
modes. Both effects are compensated by the coil reoptimization that
includes the magnetic materials. Finally in section @sec:conclusion we
discuss the results and conclude.

= Efficient calculation of fields from ferromagnetic components
<sec:calculation>
== Approximations and model equations
<sec:model>
Let $upright(bold(B))^(f e r r)$ denote the contribution to the magnetic
field due to bound currents in a region of ferromagnetic material. This
quantity at an evaluation point $upright(bold(r))'$ can be computed by
an integral of the magnetization density $upright(bold(M))$ over the
ferromagnetic region $Omega$:
$ upright(bold(B))^(f e r r) (upright(bold(r))') = frac(mu_0, 4 pi) integral_Omega frac(d^3 r, lr(|upright(bold(r))' - upright(bold(r))|)^3) [frac(3 (upright(bold(r))' - upright(bold(r))) (upright(bold(r))' - upright(bold(r))) dot.op upright(bold(M)) (upright(bold(r))), lr(|upright(bold(r))' - upright(bold(r))|)^2) - upright(bold(M)) (upright(bold(r)))] . $<eq:B_from_M>
This formula is straightforward to evaluate if $upright(bold(M))$ can be
determined.

To evaluate the magnetization, consider the $M - H$ curve for a typical
steel under consideration for fusion blankets, EUROFER97
@mergia2008structural, shown in figure @fig:eurofer_MH. Converting the
$H$ values on the x-axis to Tesla by multiplying by $mu_0$, the range of
the x-axis corresponds to $plus.minus 1.26$ Tesla. It is apparent that
the magnetization saturates by $lt.tilde 0.3 T$. Typical field strengths
in the blanket region of fusion reactor designs are far higher than
this, several Tesla or more. Thus, the magnitude
$M = \| upright(bold(M)) \|$ will be fixed at the saturation value,
which we denote $M_(s a t)$. The magnetization is not linearly related
to the field so one should not make an approximation of linear
permeability.

#figure(image("source/Eurofer_MH_curve.png", width: 3in),
  caption: [
    $M - H$ curve for EUROFER97. Figure reproduced from
    @mergia2008structural. The x-axis range of $plus.minus 1000$ kA/m is
    equivalent to $plus.minus 1.26$ T.
  ]
)
<fig:eurofer_MH>

The saturation magnetization of EUROFER97 is
$M_(s a t) tilde.op 1.4 times 10^6$ A/m, so
$mu_0 M_(s a t) tilde.op 1.7$ T. The value for F82M steel is nearly
identical @hirose2014physical. This value again is small compared to
typical reactor field strengths, particularly for recent high-field
designs, so we can approximate
$mu_0 \| upright(bold(M)) \| lt.double \| upright(bold(B)) \|$ and
$\| upright(bold(M)) \| lt.double \| upright(bold(H)) \|$.

It remains to determine $upright(bold(M))$'s direction. To do this, we
make an ansatz that the the magnetic field contribution from the
ferromagnetic material is small compared to the field from the
electromagnetic coils and plasma, $upright(bold(B))^(c o i l s)$ and
$upright(bold(B))^(p l a s m a)$ respectively. Once the total field is
evaluated, one can check if this approximation is indeed consistent.
Later in the paper, evidence will be shown that the approximation is in
fact highly accurate for typical reactor conditions. Thus,
$upright(bold(M))$ will be aligned with the local magnetic field in the
absence of the ferromagnetic material:
$ upright(bold(M)) \( upright(bold(r)) \) #h(0em) \| \| #h(0em) \( upright(bold(B))^(c o i l s) \( upright(bold(r)) \) + upright(bold(B))^(p l a s m a) \( upright(bold(r)) \) \) . $
The quantity $upright(bold(B))^(p l a s m a)$ can be computed from the
Biot-Savart formula by integrating the plasma current over the plasma
volume, or by an integral over the plasma boundary via the virtual
casing principle @shafranov1972use@drevlak2005pies. Note that the
evaluation point for $upright(bold(B))^(p l a s m a)$ is strictly
outside the plasma, so there is no singular denominator, and
sophisticated methods for virtual casing evaluation on the plasma
boundary @malhotra2019efficient are not required. In sum, the magnitude
and direction of $upright(bold(M))$ are known, so eq (@eq:B_from_M) can
be evaluated.

The field from ferromagnetic materials will affect the free-boundary MHD
equilibrium, which will affect $upright(bold(B))^(p l a s m a)$ in the
ferromagnetic region, which in turn affects $upright(bold(M))$ and hence
$upright(bold(B))^(f e r r)$. There are at least four options for
addressing this self-consistency issue, which we list here in order of
increasing complexity. First, in many cases,
$upright(bold(B))^(p l a s m a)$ in the ferromagnetic region will be
significantly smaller than $upright(bold(B))^(c o i l s)$, particularly
for quasi-isodynamic stellarators in which the plasma current is very
small. In this case, $upright(bold(B))^(p l a s m a)$ can reasonably be
neglected when computing the direction of $upright(bold(M))$. Second, if
$upright(bold(B))^(p l a s m a)$ in the ferromagnetic region is smaller
than $upright(bold(B))^(c o i l s)$ but not entirely negligible, one
could do the following. Generate an equilibrium neglecting
$upright(bold(B))^(f e r r)$, compute $upright(bold(B))^(p l a s m a)$
from this equilibrium, find the resulting $upright(bold(B))^(f e r r)$,
update the MHD equilibrium to include $upright(bold(B))^(f e r r)$, but
then not update $upright(bold(B))^(p l a s m a)$ further. This approach
will leave a slight inconsistency between $upright(bold(B))^(f e r r)$
and $upright(bold(B))^(p l a s m a)$, but it will be small when
$\| upright(bold(B))^(p l a s m a) \| lt.double \| upright(bold(B))^(c o i l s) \|$.
In a third approach, a fixed-point (Picard) iteration could be done by
repeating the steps described in the second method. This method would be
more accurate but also more computationally expensive. As a fourth
option, the evaluation of eq (@eq:B_from_M) could be included directly
in the iterations for the free-boundary MHD equilibrium solve. Since our
motivating application is low-current stellarators, we will focus on the
first two iteration-free methods for the remainder of this paper.

== Quadrature
<sec:quadrature>
We must integrate eq (@eq:B_from_M) over each volume containing magnetic
material. For numerical calculations, this requires a set of discrete
quadrature points $upright(bold(r))_k$ and weights $w_k$, such that
volume integrals become
$integral_Omega d^3 r arrow.r sum_k upright(bold(r))_k w_k$. The
quadrature points effectively represent point dipoles. Here we describe
two methods for generating these quadrature grids, using unstructured or
structured grids.

The unstructured grid approach is convenient for interfacing with CAD
designs, and is required for components with holes such as ports. Given
a CAD description of the steel component, a 3D unstructured mesh is
generated. The barycenter of each mesh element then gives
$upright(bold(r))_k$, and the element volume gives the weight $w_k$.

On other occasions, we have found it useful to use a structured mesh
approach to represent toroidally continuous layers. This allows
convenient parameterization of the steel volume, for studies of the
effect of plasma-blanket distance or of steel volume, and also provides
high-order quadrature accuracy. The inner toroidal surface is described
by a position vector $upright(bold(r))_(i n) (theta \, phi.alt)$ where
$theta$ and $phi.alt$ are arbitrary poloidal and toroidal angles.
Similarly, we take the outer bounding surface of each ferromagnetic
layer to be described by the position vector
$upright(bold(r))_(o u t) (theta \, phi.alt)$. The surfaces
$upright(bold(r))_(i n)$ and $upright(bold(r))_(o u t)$ can be defined
by uniform offsets to the plasma surface, or by other means. A radial
coordinate $rho$ is introduced with range $[0 \, 1]$ which interpolates
between $upright(bold(r))_(i n)$ and $upright(bold(r))_(o u t)$, so that
the position vector at any point in the ferromagnetic layer has position
vector
$ upright(bold(r)) (rho \, theta \, phi.alt) = (1 - rho) upright(bold(r))_(i n) (theta \, phi.alt) + rho upright(bold(r))_(o u t) (theta \, phi.alt) . $<eq:position>
Defining uniform grids in $theta$ and $phi.alt$ with spacing
$Delta_theta$ and $Delta_phi.alt$, integration in these angles can be
performed using the trapezoid rule with spectral accuracy due to
periodicity. Integration in $rho$ can be performed using Gauss-Legendre
grid points and weights $w_(rho_k)$. The overall quadrature weight is
then $w_k = Delta_theta Delta_phi.alt w_(rho_k) sqrt(g)$ where
$sqrt(g) = \( partial upright(bold(r)) \/ partial rho \) dot.op \( partial upright(bold(r)) \/ partial theta \) times \( partial upright(bold(r)) \/ partial phi.alt \)$
is the Jacobian.

In either the unstructured or structured approach, for calculations to
be accurate, the distance between quadrature points within the
ferromagnetic region should be smaller than the distance to the
evaluation point. The latter is typically the distance to the plasma.
Thus, for components that are closest to the plasma, finer mesh
resolution is required. If the field must be computed very close to the
magnetic material, the formula for the field from a uniformly magnetized
tetrahedron @nielsen2019stray can be applied, with the magnetization
computed at the element barycenter as in the dipole method. However we
have found that evaluating the field from the simpler dipole formula is
sufficient for the applications here.

#figure(image("source/20251012-01_Ferromagnetic_materials_method_illustration.pdf"),
  caption: [
    Illustration of the approximate method proposed here, eq
    (@eq:dipole_sum)-(@eq:dipole_moments). The field from the coils is
    first evaluated at quadrature points in the ferromangetic material.
    If the plasma current is substantial, its contribution to the total
    field there can be added using the virtual casing method. The field
    at the quadrature points determines the magnetization there, and the
    resulting field from the magnetized material can be computed by
    summing the field of point dipoles at the quadrature points. This
    field is computed at the evaluation points of interest, where the
    direct field from the coils is added.
  ]
)
<fig:illustration>

To summarize our model, the field contribution from ferromagnetic
material is evaluated by a sum of point dipole fields
$ upright(bold(B))^(f e r r) (upright(bold(r))') = frac(mu_0, 4 pi) sum_k 1 / lr(|upright(bold(r))' - upright(bold(r))_k|)^3 [frac(3 (upright(bold(r))' - upright(bold(r))_k) (upright(bold(r))' - upright(bold(r))_k) dot.op upright(bold(m))_k, lr(|upright(bold(r))' - upright(bold(r))_k|)^2) - upright(bold(m))_k] \, $<eq:dipole_sum>
where the dipole magnitudes are
$ upright(bold(m))_k = frac(w_k M_(s a t), lr(|upright(bold(B))^(c o i l s) \( upright(bold(r))_k \) + upright(bold(B))^(p l a s m a) \( upright(bold(r))_k \)|)) [upright(bold(B))^(c o i l s) \( upright(bold(r))_k \) + upright(bold(B))^(p l a s m a) \( upright(bold(r))_k \)] \, $<eq:dipole_moments>
and $upright(bold(B))^(p l a s m a)$ may be negligible in the latter
formula if the plasma current is sufficiently small. An illustration of
the method is given in figure @fig:illustration.

== Forces
<sec:forces>
The method here can also be used to rapidly compute the magnetic force
on ferromagnetic components. The force on a point dipole
$upright(bold(m))$ is
$upright(bold(f)) = \( nabla upright(bold(B))^(e x t) \) dot.op upright(bold(m))$
@griffiths2023introduction, where $upright(bold(B))^(e x t)$ is the
field due to sources other than the dipole, so the force density on a
magnetized region is
$upright(bold(F)) = \( nabla upright(bold(B))^(e x t) \) dot.op upright(bold(M))$.
This same formula can also be derived by summing the Lorentz force
densities for the volume and boundary of the ferromagnetic region,
$upright(bold(F)) = integral_Omega d^3 r upright(bold(J))_b times upright(bold(B))^(e x t) + integral_(partial Omega) d^2 r upright(bold(K))_b times upright(bold(B))^(e x t)$,
where $upright(bold(J))_b = nabla times upright(bold(upright(bold(M))))$
is the current density associated with bound currents and
$upright(bold(K))_b = upright(bold(M)) times upright(bold(n))$ is the
surface current density associated with bound currents. This equivalence
and other approaches to computing the force are discussed further in the
appendix. The total force on a component follows as
$ upright(bold(f)) = integral_Omega d^3 r thin \( nabla upright(bold(B))^(e x t) \) dot.op upright(bold(M)) \, $<eq:force>
where
$upright(bold(B))^(e x t) = upright(bold(B))^(c o i l s) + upright(bold(B))^(p l a s m a)$,
or simply $upright(bold(B))^(e x t) approx upright(bold(B))^(c o i l s)$
if the plasma current is small. The volume integral can be discretized
using the quadrature methods of the previous section. Also
$nabla upright(bold(B))^(e x t)$ in this expression can be found
analytically by differentiating the Biot-Savart law and, if the plasma
contribution is included, the virtual casing formula.

= Verification with the finite element method
<sec:comsol>
To verify that our approximate model is accurate for fusion reactor
parameters, we carry out a comparison with the commercial finite-element
software COMSOL Multiphysics®@comsol. The geometry for the comparison is
shown in figure @fig:example_setup. The plasma shape, shown in pink, is
a three-field-period quasi-isodynamic stellarator. The configuration is
at reactor scale, with average major radius of 12.7 m, and
volume-averaged field strength in the plasma of 8 T. The plasma is
confined by a set of 36 modular coils (6 unique shapes each repeated 6
times), shown in gray. While multi-filament finite-build coils are being
used for the design of Type One Energy's stellarators, a single-filament
model of the coils is used in this example for simplicity; use of
multi-filament coils does not alter any aspect of the method. Two walls
of EUROFER97 are placed between the plasma and coils, one 60 cm from the
plasma, and the other 140 cm from the plasma, both 15 cm thick, with
holes removed for ports. These components are not from an actual blanket
design, but are merely intended to illustrate a possible application of
the method. Only one half period of the walls is shown in the right two
panels, but they extend around the full torus, as in the left panel.
Considering only the field from the coils, the minimum field strength in
the plasma region is $> 6.4$ T, and the minimum in the steel volume is
$> 4.3$ T, so the steel is fully saturated. However the COMSOL
calculation uses the full $M \( H \)$ curve for EUROFER97 without
assuming saturation. COMSOL also fully accounts for the effect of
magnetization in one region on the magnetization in another.
Calculations with the approximate model are performed by first meshing
the steel CAD geometry using GMSH @geuzaine2009gmsh, then applying the
open-source SIMSOPT software @landreman2021simsopt, using its
`DipoleField` class for arrays of point dipoles. Plasma current is
neglected for simplicity in this COMSOL comparison, but will be
considered in later sections.

#figure([#box(image("source/20251005-01_top_view_mesh_full_torus.png", width: 2.2in))
  #box(image("source/20251005-01_side_view_mesh_half_period.png", width: 2.8in))
  #box(image("source/20251005-01-tangent_view_dipoles.png", width: 2.1in))

  ],
  caption: [
    Geometry for the COMSOL benchmark in section @sec:comsol and
    optimization example in section @sec:opt_example. Left: bird's eye
    view. Center: Side view showing the mesh used for the steel layers
    and the holes for ports. Right: Side view showing the dipole
    locations (quadrature points) representing the two steel layers. In
    the right two panels, only one half period of the steel region is
    shown.
  ]
)
<fig:example_setup>

The total field including the steel is computed using both the
approximate model and COMSOL. The field on the plasma boundary is
displayed in figure @fig:comsol. The four panels in the top-left show
the field from only the coils, $upright(bold(B))^(c o i l s)$, and the
total field
$upright(bold(B))^(t o t a l) = upright(bold(B))^(c o i l s) + upright(bold(B))^(f e r r)$,
for both the model and COMSOL. Note that the color scale for these four
panels is identical. These four panels are visually indistinguishable,
showing both that the effect of the steel is small, and that there is
good agreement between the two methods. The remaining four panels show
differences between these fields on a much finer color scale so they can
be seen, using the same color scale for the four panels. The bottom row
shows the difference between our model and COMSOL both for the coil
field alone and for the total field. The differences in coil field alone
(bottom left) are due only to discretization error since the underlying
equations are identical in the absence of steel. The differences in
total field (bottom center) arise due to both discretization error and
the different underlying equations. However the discrepancy in the
bottom center panel is not significantly larger than the bottom left
panel, indicating that the physics differences are not larger than
discretization error. The right two panels show
$\| upright(bold(B))^(f e r r) \|$ computed by the two approaches,
showing close similarity. The maximum $\| upright(bold(B))^(f e r r) \|$
occurs under the vertical edges of the ports.

#figure(image("source/20251005-01_compare_B_from_simsopt_vs_comsol_for_Bsteel_paper_maxSize500.pdf", width: 100%),
  caption: [
    Comparison between our approximate model and a high-fidelity COMSOL
    calculation for the configuration of figure @fig:example_setup,
    showing the magnetic field on the plasma boundary. Comparing the
    four panels in the top-left quadrant, both COMSOL and our model
    agree that the change to $upright(bold(B))$ due to the steel is
    small compared to the field from the coils. The change to
    $upright(bold(B))$ from the steel (right column) agrees between the
    two methods. Differences between the two methods (bottom row) are
    comparable with and without the steel, and are small compared to the
    effect of the steel (right column).
  ]
)
<fig:comsol>

To evaluate the magnetic field for figure @fig:comsol, COMSOL took 409
seconds on a 2023 M2 Macbook Pro. For comparison, generating the data
for figure @fig:comsol with the reduced model took only 0.33 seconds on
the same computer, giving a factor of $> 1000 times$ speed-up.

We can also directly assess the accuracy of the approximation used to
determine the magnetization in the reduced model. This is done in figure
@fig:magnetization_vs_comsol, which shows the norm of the difference in
magnetization vectors between COMSOL and the reduced model. The
magnetization is evaluated on a surface 0.675 m from the plasma, in the
middle of the inner steel layer. The difference is normalized to the
magnitude of the magnetization in the reduced model, i.e. the saturation
magnetization. It can be seen that this relative difference in
magnetization is no more than a few percent, meaning the approximation
is quite good.

#figure(image("source/20251005-01_compare_force_density_vs_comsol_M_0.pdf"),
  caption: [
    The difference in the magnetization vector between COMSOL and the
    approximate model, normalized to the magnitude of magnetization in
    the approximate model, is small. Data are evaluated in the middle of
    the inner steel layer.
  ]
)
<fig:magnetization_vs_comsol>

The forces on the steel can also be compared between the two methods. In
COMSOL the force is calculated from a surface integral of the Maxwell
stress on the boundary instead of the volume integral (@eq:force). For
this comparison we evaluate the net force on one half field period of
the inner steel region. Results are displayed in figure @fig:force. The
Cartesian components of this force in MN were found to be \[-22.1,
\-24.2, -22.3\] from COMSOL, and \[-21.8, -24.0, -21.9\] according to
the reduced method introduced in this article, based on eq @eq:force).
Thus, good agreement is obtained.

#figure(image("source/20251005-01-comsol_vs_simsopt_force_bar_chart.pdf"),
  caption: [
    The approximate model presented in this article also provides
    accurate calculations of the forces on steel components.
  ]
)
<fig:force>

= Stellarator coil optimization
<sec:opt>
== Overview
<sec:opt_overview>
Next we demonstrate that the approximate model can be applied
straightforwardly to include ferromagnetic components in stellarator
coil optimization. In this example we consider the second stage of the
standard two-stage approach to stellarator design. A target plasma
equilibrium (from stage 1) is given, and the task is to optimize the
shapes and currents of electromagnets to support that equilibrium. This
is done by minimizing the component of the actual magnetic field normal
to the target plasma boundary surface, while satisfying engineering
constraints on the coils such as a maximum allowed curvature and minimum
clearances.

Since the effects of ferromagnetic materials are minor, as shown in
figure @fig:comsol and as will be shown in more detail below, coils can
initially be designed without considering magnetic materials. Next, the
ferromagnetic components associated with the blanket, first wall, and
divertor can be designed. This step may be a labor-intensive process
involving detailed engineering design. Then, a few iterations of
optimization are carried out that include the ferromagnetic components.
The coil parameters will only slightly change in this step. The change
may be sufficiently small that no design modification of the
ferromagnetic components is required. If some adjustments are required,
they should be small. A few more iterations of coil optimization could
then be carried out, and the process should converge rapidly.

== Derivatives
<sec:derivative>
The efficiency of optimization is significantly improved when derivative
information is available, which is usually the case for stellarator coil
optimization. Let us therefore examine the relevant derivatives
involving the ferromagnetic material to ensure they can be computed.
Usually the objective function for coil design is based on the quantity
$f = integral_(partial P) d^2 a \( upright(bold(B))^(t o t a l) dot.op upright(bold(n)) \)^2$,
where the integral is over the desired surface shape of the plasma
$partial P$ and $upright(bold(n))$ is the unit normal. The gradient of
this quantity with respect to the coil shapes and current is required.
Let $x$ denote one of these design variables, so the derivatives
required for optimization are $partial f \/ partial x$. Since the
objective $f$ depends on $upright(bold(B))^(t o t a l)$ and hence on
$upright(bold(B))^(f e r r)$, then we need
$partial upright(bold(B))^(f e r) \/ partial x$, where the numerator is
evaluated at any of the fixed set of points on the target plasma
surface. If the coils do not evolve much when the ferromagnetic material
is introduced, then $upright(bold(B))^(f e r)$ will be approximately
constant, so $partial upright(bold(B))^(f e r) \/ partial x$ could be
neglected. However it is straightforward to compute
$partial upright(bold(B))^(f e r) \/ partial x$, so it may as well be
retained. To compute this derivative, we can write
$ frac(partial upright(bold(B))^(f e r r), partial x) = sum_(i \, j \, k) frac(partial upright(bold(B))^(f e r r), partial m_i \( upright(bold(r))_k \)) frac(partial m_i \( upright(bold(r))_k \), partial B_j^(c o i l s) \( upright(bold(r))_k \)) frac(partial B_j^(c o i l s) \( upright(bold(r))_k \), partial x) . $<eq:chain_rule>
Here, $i$ and $j$ are sums over the three Cartesian components, $m_i$
and $B_j^(c o i l s)$ are the components of the dipole moments
$upright(bold(m))$ and coil field $upright(bold(B))^(c o i l s)$, and
$k$ is a sum over the dipole locations. The effect of
$upright(bold(B))^(p l a s m a)$ on the dipole moments does not appear
in (@eq:chain_rule) because $upright(bold(B))^(p l a s m a)$ is
considered fixed during the optimization, as is normally done when
evaluating the gradient of $f$. The first term,
$partial upright(bold(B))^(f e r r) \/ partial m_i \( upright(bold(r))_k \)$,
is readily evaluated from (@eq:dipole_sum):
$ frac(partial B_ell^(f e r r) (upright(bold(r))'), partial m_i \( upright(bold(r))_k \)) = frac(mu_0, 4 pi lr(|upright(bold(r))' - upright(bold(r))_k|)^3) [frac(3 (upright(bold(r))' - upright(bold(r))_k)_i (upright(bold(r))' - upright(bold(r))_k)_ell, lr(|upright(bold(r))' - upright(bold(r))_k|)^2) - delta_(i \, ell)] \, $
for each component $ell$. The middle term of (@eq:chain_rule) is
evaluated from (@eq:dipole_moments):
$ frac(partial m_i, partial B_j^(c o i l s)) & = & frac(w_k M_(s a t), lr(|upright(bold(B))^(c o i l s) + upright(bold(B))^(p l a s m a)|))\
 &  & times [delta_(i \, j) - frac(\( B_i^(c o i l s) + B_i^(p l a s m a) \) \( B_j^(c o i l s) + B_j^(p l a s m a) \), lr(|upright(bold(B))^(c o i l s) + upright(bold(B))^(p l a s m a)|)^2)] \, $
where all quantities are evaluated at $upright(bold(r))_k$. The last
term of (@eq:chain_rule),
$partial B_j^(c o i l s) \( upright(bold(r))_k \) \/ partial x$, is
already routinely computed for coil optimization (albeit with the
numerator evaluated on the plasma surface rather than at the dipole
locations), so we assume this term can be calculated. Thus all the
factors in (@eq:chain_rule) can be evaluated. To get the gradient of the
scalar objective $f$, it is most efficient to proceed from left to right
(in "reverse mode") using vector-Jacobian products.

For the optimization example in the next section, we find that
neglecting $partial upright(bold(B))^(f e r r) \/ partial x$ in the
optimization does not reduce the convergence rate, since
$\| upright(bold(B))^(f e r r) \|$ is so much smaller than
$\| upright(bold(B))^(c o i l s) \|$, and dropping this term reduces the
time per iteration. However in cases with lower field strength where
$upright(bold(B))^(f e r r)$ is relatively more significant, retaining
this term may be important.

== Example
<sec:opt_example>
To illustrate the method with an example, we return to the
quasi-isodynamic stellarator and steel geometry shown in figure
@fig:example_setup, and explained in section @sec:comsol. The magnetic
field for the initial state is displayed in figure @fig:initial_B. The
eight panels all show aspects of the magnetic field on the target plasma
surface, i.e. the surface that was used in the initial optimization of
the coil shapes in which the ferromagnetic components were neglected.
The plasma configuration has a ratio of plasma pressure to magnetic
pressure of $beta = 1.7 %$, so the field due to the plasma current is
non-negligible compared to coil ripple on the plasma surface, and is
computed using the virtual casing method @malhotra2019efficient.
However, throughout the steel region, the ratio
$\| upright(bold(B))^(p l a s m a) \| \/ \| upright(bold(B))^(c o i l s) \|$
is found to be quite small, $< 2.4 %$, so
$\| upright(bold(B))^(p l a s m a) \|$ is neglected for determining the
steel magnetization in the rest of this paper. Indeed, the effect of
plasma current on the steel field would be a small correction to an
already small correction. The four columns show the total field and the
separate contributions from coils, plasma current, and the steel. The
top row shows the magnitude of the field in Tesla, while the bottom row
shows the field component normal to the target plasma surface, as this
normal component highlights the errors in producing the desired flux
surface. It can be seen that $upright(bold(B))^(f e r r)$ is quite
small, less than 1% of the total field. This fact supports our
approximation that $upright(bold(B))^(f e r r)$ can be neglected when
computing the direction of the magnetization, and suggests that the
effect of $upright(bold(B))^(f e r r)$ on the plasma properties is
unlikely to be dramatic. Nonetheless, looking at the components normal
to the target plasma surface in the bottom row,
$upright(bold(B))^(f e r r) dot.op upright(bold(n))$ is comparable to
the modular coil ripple and
$upright(bold(B))^(p l a s m a) dot.op upright(bold(n))$. Therefore
$upright(bold(B))^(f e r r)$ should not be ignored completely, and we
can expect it may be large enough to have some effect on certain physics
properties of the plasma. As noted above, the largest magnetic
perturbation from the steel is in the region under the ports.

#figure(image("source/20251005-01-plot_B_steel_results_before_reoptimization.pdf", width: 100%),
  caption: [
    Contributions to the magnetic field and its component normal to the
    target plasma surface. Data here are for the initial coils shown in
    figure @fig:example_setup.
  ]
)
<fig:initial_B>

Free-boundary MHD equilibria are computed for these initial coils, both
without and with the steel. The equilibria are computed using the code
VMEC @hirshman1986three. For the free-boundary calculation with
$upright(bold(B))^(f e r r)$, the field from the dipoles representing
the steel is evaluated on a tensor-product grid in cylindrical
coordinates and saved in VMEC's standard MGRID input format.

Figure @fig:iota shows the profiles of rotational transform $iota$ for
the original fixed-boundary target configuration as well as for
free-boundary equilibria both excluding and including the field from the
steel. If the steel field is excluded, the coils do a good job matching
the $iota$ profile of the target configuration. However when the steel
field is included, there is a systematic decrease in the $iota$ profile.
This $iota$ downshift due to ferromagnetic material has been noted
previously @harmeyer1999effect@ji2017investigation. It can be understood
from analysis of a straight cylinder, where the ferromagnetic layers
reduce the poloidal field while not affecting the toroidal field
@harmeyer1999effect.

For stellarator designs with an island divertor, such as W7-X and the
configuration here (which uses the $iota = 3 \/ 4$ resonance just
outside the plasma), this shift to $iota$ will affect the locations of
heat strike points on the divertor, so it must be accounted for. This
effect is seen in figure @fig:islands, which show Poincare plots at the
operating $beta = 1.7 %$ computed using the code HINT
@suzuki2006development@suzuki2017hint. The Poincare plots at $beta = 0$
($upright(bold(B))^(c o i l s) + upright(bold(B))^(f e r r)$ only) are
nearly identical. The original coils were designed to produce a chain of
four islands at the plasma edge (top panel). When the field from the
steel is included (middle panel), the islands are shifted outward from
the domain. Also a small higher-harmonic island has arisen due to the
field perturbation. While both of these issues could be corrected with
additional control coils, we can address them directly with small
adjustments to the modular coil shapes.

#figure(image("source/20251005-01-plot_iota_profiles_without_and_with_steel_for_paper.pdf"),
  caption: [
    Rotational transform profiles for different equilibria associated
    with the plasma configuration in figure @fig:example_setup.
  ]
)
<fig:iota>

#figure(image("source/20251005-01-plot_combined_HINT_results_ms3.png"),
  caption: [
    The downshift in $iota$ due to the steel causes an outward shift of
    the edge island chain, in addition to distortion from harmonic
    resonances. The island location and shape is restored by minor
    reoptimization of the coils including the fields from the steel. The
    same initial locations for field line tracing are used in all three
    panels.
  ]
)
<fig:islands>

To compensate for the field from the steel, derivative-based coil
optimization is then run to adjust the coil shapes. The objective
function minimized is conventional, with terms to produce the desired
plasma shape and control the coil length, coil-coil distance,
coil-plasma distance, maximum curvature, and islands respectively:
$ f & = & 1 / 2 integral_(partial P) d^2 a (upright(bold(B))^(t o t a l) dot.op upright(bold(n)))^2 / B^2 + (L_(*) - sum_(j = 1)^N L_j)^2\
 &  & + sum_(j = 1)^N sum_(k = 1)^(j - 1) integral_j d ell integral_k d ell #h(0em) max (0 \, #h(0em) d_(c c *) - \| upright(bold(r))_j - upright(bold(r))_k \|)^2\
 &  & + sum_(j = 1)^N integral_j d ell integral_(partial P) d^2 a #h(0em) max (0 \, #h(0em) d_(c s *) - \| upright(bold(r))_j - upright(bold(r))_S \|)^2\
 &  & + 1 / 2 sum_(j = 1)^N integral_j d ell #h(0em) max (0 \, #h(0em) kappa - kappa_(*))^2\
 &  & + sum_(k = 1)^3 w_k (b_k^(r e s) - b_(k *)^(r e s))^2 . $<eq:objective>
Here, $integral_(partial P) d^2 a$ is a surface integral over the plasma
boundary, $N$ is the number of unique coil shapes, $j$ is an index over
these shapes, $L_j$ is the length of coil $j$, $integral_j d ell$ is an
integral over coil $j$ with respect to arclength, $kappa \( ell \)$ is
the curvature, $upright(bold(r))_j \( ell \)$ is the position vector
along coil $j$, and $upright(bold(r))_S$ is a position vector on this
surface. The quantity $b_k^(r e s)$ is the $k$-th harmonic resonant
field, eq (14) in @boozer2004physics, associated with the edge island
chain. The quantities $L_(*)$, $kappa_(*)$, $d_(c c *)$, $d_(c s *)$,
and $b_(k *)^(r e s)$ are constant target values, and are set to the
same values used to generate the original coils in figure
@fig:example_setup. Therefore the coil lengths, maximum curvature,
minimum coil-coil distance, and minimum coil-plasma distance are
practically unchanged during the optimization that includes the steel.
Other than the weights $w_k$ on the resonances, no additional weights in
(@eq:objective) are required. The coils before and after the
optimization are compared in figure @fig:compare_coils. It can be seen
that the changes to the coil shapes are relatively minor, which is not
surprising given that the field from the steel is small compared to the
total field. The most noticeable changes to the coil shapes are in the
regions on the outboard midplane near the ports.

#figure(image("source/20251005-01-top_view_comparing_old_vs_new_coil_shapes.png"),
  caption: [
    Coils before (white) and after (red) the optimization that includes
    $upright(bold(B))^(f e r r)$.
  ]
)
<fig:compare_coils>

Figure @fig:final_B shows the contributions to $upright(bold(B))$, and
their components normal to the target plasma boundary, following the
optimization. Comparing figures @fig:initial_B and @fig:final_B, the
right columns show that $upright(bold(B))^(f e r r)$ is nearly
unchanged, reflecting the fact that the change to the coil shapes is
small. Looking at the sixth panel
($upright(bold(B))^(c o i l s) dot.op upright(bold(n)) \) \/ \| upright(bold(B))^(t o t a l) \|$,
focusing on the lower left corner, it can be seen that the optimized
coils generate an approximately equal and opposite ripple to the ripple
from the steel near the ports. As a result, comparing the lower-left
panels of figures @fig:initial_B and @fig:final_B, the total ripple near
the ports is significantly reduced.

#figure(image("source/20251005-01-plot_B_steel_results_after_reoptimization.pdf", width: 100%),
  caption: [
    Contributions to the magnetic field and its component normal to the
    target plasma surface. Data here are for the coils after
    optimization to include $upright(bold(B))^(f e r r)$.
  ]
)
<fig:final_B>

A free-boundary equilibrium calculation is run using the optimized coils
and including $upright(bold(B))^(f e r r)$. The resulting profile of
rotational transform is included in figure @fig:iota. It can be seen
that the coil optimization including $upright(bold(B))^(f e r r)$
eliminates the downshift in $iota$, making it nearly indistinguishable
from the free-boundary solution with the original coils without the
steel. The bottom panel of figure @fig:islands shows that the modified
coils also restore the edge island chain to the desired location and
shape.

From the free-boundary equilibria that include the steel field, we can
also examine the effect of the steel on other stability and confinement
properties. Figure @fig:Mercier shows the Mercier stability measure
$D_(M e r c)$ for the original coils without and with the steel, and for
the reoptimized coils. Positive value indicate stability. The ferritic
material has no significant effect. The effect on ideal ballooning
stability is shown in figure @fig:ballooning. At each radius, stability
calculations are carried out for field lines centered on many poloidal
and toroidal locations, and the maximum growth rate is shown, so
positive values indicate instability. When the steel field is added to
the original coils, ballooning modes are slightly destabilized, although
the growth rate is small. The reoptimized coils restore ballooning
stability, by better matching the target plasma configuration.

#figure(image("source/20251005-01-effect_of_steel_on_Mercier_for_paper.pdf"),
  caption: [
    The steel is found to have negligible impact on the Mercier
    criterion for MHD stability. Positive values indicate stability.
  ]
)
<fig:Mercier>

#figure(image("source/20251005-01-effect_of_steel_on_ballooning_growth_rate_for_paper.pdf"),
  caption: [
    The steel is found to slightly destabilize ideal MHD ballooning
    modes, but this issue is corrected when the coils are reoptimized to
    acount for the steel.
  ]
)
<fig:ballooning>

We also find that the field from the ferritic material has negligible
effect on several measures of confinement. The neoclassical transport
measure $epsilon.alt_(e f f)$ is shown in figure @fig:eps_eff for the
three free-boundary configurations. No systematic difference is
apparent. Figure @fig:simple shows the results of guiding-center
trajectory calculations in the three free-boundary configurations. For
these calculations, conducted using the code SIMPLE
@albert2020accelerated@albert2020symplectic, 5000 particles are
initialized on a flux surface, and followed without collisions for 0.1
seconds. The original size and field strength of the configurations are
used for the tracing. In all three configurations, no particles are lost
if the initial surface $s$ (normalized toroidal flux) is $< 0.5$, and
losses from $s = 0.5$ are $< 0.9 %$. For particles initialized farther
out ($s$= 0.6-0.7), losses may be slightly higher for the original coils
with steel, but the effect is small. Overall, we conclude that the field
from the steel components does not significantly affect these two
neoclassical confinement measures.

#figure(image("source/20251005-01-effect_of_steel_on_eps_eff_for_paper.pdf"),
  caption: [
    The steel is found to have no significant effect on the neoclassical
    transport metric $epsilon.alt_(e f f)$ (effective ripple).
  ]
)
<fig:eps_eff>

#figure(image("source/20251005-01-020_plot_simple_results_for_paper.pdf"),
  caption: [
    The steel is found to have only a minor effect on confinement of
    guiding-center trajectories.
  ]
)
<fig:simple>

= Discussion and conclusion
<sec:conclusion>
In this work we have demonstrated a method to efficiently account for
the magnetic fields from ferromagnetic materials in systems with strong
electromagnets, such as fusion reactors. In this case, when the field
from the ferromagnetic materials is small compared to that from the
coils, the magnetization is nearly aligned with the coil field. This
approximation eliminates the need to solve a large system of equations
to account for the effect of magnetization in one region on another,
significantly accelerating calculations. Instead, all that is required
is evaluating the Biot-Savart formula for the coil field inside the
material, and then evaluating the formula for the field of dipoles
representing the material. Moreover in fusion systems the magnetic
material is fully saturated, so the magnetization's magnitude is a
constant, further simplifying calculations. The method also enables
rapid calculation of the forces on ferromagnetic components. By
comparisons to COMSOL calculations that fully account for interactions
of the material with itself, we have shown that the approximations in
our model are extremely well satisfied for modern stellarator reactor
parameters. We expect the method will be useful and accurate for
tokamaks as well, and for other $gt.approx 1$ Tesla devices such as
magnetic resonance imaging systems.

As the method requires only evaluating the field of an array of dipoles,
with no complicated solvers, it is straightforward to include in fusion
device design workflows. Here we have demonstrated including the field
from ferritic blanket components in free-boundary MHD equilibrium
calculations. Thus it was possible to assess the effect of the steel
components on plasma confinement and stability. Even for a significant
volume of steel with large edges that create magnetic ripple, the
effects on the physics properties were found to be quite minor. The
primary effects were the previously-known decrease in rotational
transform, which can be important for an island divertor, and a slight
destabilization of ideal ballooning modes.

We also demonstrated that the magnetic effects of the steel can be
included in stellarator optimization. Differentiating through the model
is straightforward, preserving the efficiency of gradient-based
optimization. In the example here, the electromagnet shapes were
optimized, but in principle the location and shape of steel components
could be optimized as well in the same framework. Since only a small
adjustment to the coil shapes was needed to compensate for the steel, it
may not be necessary to adjust the steel location when the coils are
adjusted. This is advantageous since design of the blanket components
may be a labor-intensive process. Through optimization of the
electromagnets to account for the steel, we demonstrated it was possible
to restore the edge island chain and ballooning stability. We expect
that the methods here will thus be valuable and effective for optimizing
designs of the next generation of fusion facilities.

#heading(level: 1, numbering: none)[Declaration of competing interest]
<declaration-of-competing-interest>
The work of M.L. was performed as a consultant and was not part of the
employee's responsibilities to the University of Maryland.

#heading(level: 1, numbering: none)[Acknowledgments]
<acknowledgments>
This research was funded by Type One Energy. We gratefully acknowledge
assistance with CAD geometry from Bonita Goh, Dan Theilen, Kevin Rogers,
and Ian Harnett, guidance from Tate McCartney regarding the HINT code,
and conversations about this work with Chris Hegna, John Canik, Daniel
Clark, Madelynn Knilans, Michael Zarnstorff, and Dominic Seidita. This
work was also enabled by the computational tools developed and
maintained by the Type One Energy optimization group.

= Force on a magnetized region
<app1>
Forces on magnetized objects can be computed in a wide variety of ways:
integration of the Maxwell stress over a surface, differentiating an
energy (giving the so-called Korteweg--Helmholtz force), equivalent
magnetic charges, or the Lorentz force on magnetization currents or
dipoles
@Melcher@deMedeiros1999distribution@engel2002electromagnetic@jackson@bobbio2000equivalent.
Some of these methods can be expressed either in terms of the total
magnetic field or the part from sources outside the magnetized domain
@bobbio2000equivalent. Here we demonstrate the equivalence of two
intuitive methods for computing the force, the magnetization current and
dipole methods. Let $upright(bold(f))$ denote the total force on a
magnetized region $Omega$. This force can be understood to originate
from the Lorentz force on the magnetization currents:
$ upright(bold(f)) = integral_Omega d^3 r thin upright(bold(J))_b times upright(bold(B)) + integral_(partial Omega) d^2 r thin upright(bold(K))_b times upright(bold(B)) \, $<eq:force_lorentz>
where $upright(bold(J))_b = nabla times upright(bold(upright(bold(M))))$
is the current density associated with bound currents and
$upright(bold(K))_b = upright(bold(M)) times upright(bold(n))$ is the
surface current density associated with bound currents, with
$upright(bold(n))$ the outward unit normal of $Omega$. In
(@eq:force_lorentz), $upright(bold(B))$ can be taken to be
$upright(bold(B))^(e x t)$, the field from only sources outside $Omega$,
namely $upright(bold(B))^(c o i l s) + upright(bold(B))^(p l a s m a)$,
since the field from the magnetized material cannot exert any net force
on itself @jackson@landau. To simplify notation the ext superscript is
omitted in this appendix. We apply
$\( nabla times upright(bold(M)) \) times upright(bold(B)) = - nabla \( upright(bold(M)) dot.op upright(bold(B)) \) + \( nabla upright(bold(B)) \) dot.op upright(bold(M)) + upright(bold(B)) dot.op nabla upright(bold(M))$
to the first term of (@eq:force_lorentz), and apply the BAC-CAB rule to
the second term. Using
$integral_Omega d^3 r nabla g = integral_(partial Omega) d^2 r thin upright(bold(n)) g$
for $g = upright(bold(M)) dot.op upright(bold(B))$, a cancellation
occurs to leave
$ upright(bold(f)) = integral_Omega d^3 r [\( nabla upright(bold(B)) \) dot.op upright(bold(M)) + upright(bold(B)) dot.op nabla upright(bold(M))] - integral_(partial Omega) d^2 r thin upright(bold(n)) dot.op upright(bold(B)) upright(bold(M)) . $<eq:appendix_almost_done>
Next we apply
$integral_Omega d^3 r nabla dot.op arrow.l.r(upright(bold(T))) = integral_(partial Omega) d^2 r thin upright(bold(n)) dot.op arrow.l.r(upright(bold(T)))$
(true for any tensor $arrow.l.r(upright(bold(T)))$) for
$arrow.l.r(upright(bold(T))) = upright(bold(B)) upright(bold(M))$. This
identity, with $nabla dot.op upright(bold(B)) = 0$, implies
$integral_(partial Omega) d^2 r thin upright(bold(n)) dot.op upright(bold(B)) upright(bold(M)) = integral_Omega d^3 r thin upright(bold(B)) dot.op nabla upright(bold(M))$.
Therefore the last two terms in (@eq:appendix_almost_done) cancel to
leave
$ upright(bold(f)) = integral_Omega d^3 r thin \( nabla upright(bold(B)) \) dot.op upright(bold(M)) \, $
consistent with (@eq:force).

Since
$upright(bold(B)) = upright(bold(B))^(c o i l s) + upright(bold(B))^(p l a s m a)$
is curl-free in $Omega$,
$\( nabla upright(bold(B)) \) dot.op upright(bold(M)) - upright(bold(M)) dot.op nabla upright(bold(B)) = upright(bold(M)) times \( nabla times upright(bold(B)) \)$
vanishes in $Omega$. Thus, we also have
$upright(bold(f)) = integral_Omega d^3 r thin upright(bold(M)) dot.op nabla upright(bold(B))$.

#let references = read("source/Ferromagnetic_components.bib").replace("year      = {Stockholm, Sweden}", "address   = {Stockholm, Sweden}")
#bibliography(bytes(references),style:"ieee")
