// Typst adaptation of arXiv:2508.08820v1.
// Original work and this adaptation: CC BY-SA 4.0.
// https://arxiv.org/abs/2508.08820v1
// https://creativecommons.org/licenses/by-sa/4.0/
#set page(paper: "a4", margin: 20mm)
#set text(size: 10pt, lang: "en")
#set par(justify: true)
#set heading(numbering: "1.1")
#set math.equation(numbering: "(1)")
#title[Internal flow and concentration in neighbouring evaporating binary droplets and rivulets]
#align(center)[Pim J. Dekker (1), Duarte Rocha (1), Detlef Lohse (1, 2), and Christian Diddens (1)]
#align(center)[#text(size: 8pt)[(1) Physics of Fluids Department, Max-Planck Center Twente for Complex Fluid Dynamics and J. M. Burgers Centre for Fluid Dynamics, University of Twente, 7500AE Enschede, The Netherlands. (2) Max-Planck Institute for Dynamics and Self-Organization, Am Faßberg 17, 37077 Göttingen, Germany.]]
#align(center)[Correspondence: #raw("p.j.dekker@utwente.nl"), #raw("d.rocha@utwente.nl")]

#heading(level: 1, numbering: none)[Abstract]
<abstract>
In this paper, the evaporation of neighbouring multi-component droplets or rivulets -- often found in applications such as inkjet printing, spray cooling, and pesticide delivery -- is studied numerically and theoretically. The proximity induces a shielding effect that reduces individual evaporation rates and disrupts the symmetry of both the concentration profile and the flow field in the liquids. We examine how the symmetry of flow and concentration fields is affected by key parameters, namely the contact angle, the inter-droplet (or inter-rivulet) distance, and the magnitude of surface tension gradient forces (i.e. the Marangoni number). We focus on binary mixtures, such as water and 1,2-hexanediol, where only one component evaporates and evaporation is slow, thereby allowing simplifications to the governing equations. To manage the complexity of the full three-dimensional droplet problem, we begin with a two-dimensional model of neighbouring rivulets. Solving the complete transient equations for rivulets with pinned contact lines and fixed inter-rivulet distance reveals that the asymmetry -- quantified by the position of the interfacial stagnation point of the flow -- diminishes over time. Using a validated quasi-stationary model, we find, with increasing contact angle and inter-rivulet distance, that the stagnation point migrates closer to the centre, yet it remains unaffected by the Marangoni number. A simplified lubrication model applied to droplets shows similar dependencies on contact angle and distance, although here the stagnation point appears to vary with the Marangoni number. We attribute this dependence to the additional azimuthal flow in droplets, leading to a non-linear evolution of the concentration and therefore a non-trivial dependence of the symmetry on the Marangoni number.

#heading(level: 1, numbering: none)[Keywords]
<keywords>
= Introduction
<introduction>
Applications such as inkjet printing, spray cooling and pesticide delivery often involve the evaporation of neighbouring multi-component droplets or rivulets. In these situations, the proximity of the liquid bodies influences the evaporation rate of each droplet or rivulet, thereby altering the flow dynamics within the liquid phase \[1\], \[2\], \[3\]. A natural first step in understanding these complex systems is to study the evaporation of a single liquid body -- a problem that has been extensively investigated for droplets \[4\], \[5\], \[6\], \[7\], \[8\], \[9\] as well as for rivulets \[1\], \[10\].

For evaporating pure sessile droplets (and rivulets) with a pinned contact line, the geometric singularity at the contact line gives rise to the "coffee-stain" effect \[11\], \[12\], \[13\], where liquid and any suspended particles are drawn towards the pinned contact line to compensate for a higher evaporative loss in that region, resulting in a coffee-ring-like deposit. This is often undesirable in applications such as inkjet printing \[14\]. In the case of a multi-component droplet (or rivulet), selective evaporation can occur. This selective evaporation induces surface tension gradients, which in turn generate Marangoni stresses at the liquid-gas interface \[15\], \[16\], \[17\], \[18\], \[19\]. The resulting flow generated within the liquid is often much stronger than the flow caused by the "coffee-stain" effect and can either enhance or suppress it, depending on the direction of the Marangoni flow \[17\], \[20\], \[21\].

In real-world applications, however, the liquid bodies are rarely isolated and are often found in proximity. In such cases, the vapour concentration in the gas phase surrounding the evaporating components is increased near the liquid bodies. This reduces the evaporation rate -- characterising the so-called shielding effect -- and extends the lifetime of the liquids \[1\], \[3\], \[22\], \[23\], \[24\], \[25\], \[26\]. This shielding effect disrupts the symmetry of the evaporation-driven flows \[2\], \[3\].

While capillary flows in neighbouring pure droplets have been widely studied, Marangoni flows induced by the presence of a second component in the liquid has received less attention. \[27\] observed that neighbouring droplets may either attract -- under conditions that promote Marangoni contraction \[28\] -- or repel one another, depending on the volatility and composition. Moreover, \[29\] reported that preferential pinning on the side further from an adjacent droplet can cause the centres of the droplets to move apart.

Our work builds on the experiments of \[29\], in which the evaporation of two neighbouring droplets of a binary mixture of water and 1,2-hexanediol was investigated. In particular, we develop numerical simulations for both two evaporating droplets and their two-dimensional counterpart, two evaporating rivulets, in order to identify the key parameters that govern the symmetry of the flow field. By employing justified simplifications, we demonstrate that the asymmetry in the internal flow and concentration fields is primarily controlled by three parameters: the contact angle $theta$, the inter-droplet (or inter-rivulet) distance $b$, and the Marangoni number $upright(M a)$. Notably, for rivulets, the asymmetry is nearly independent on the Marangoni number, whereas for droplets the dependence is more marked.

This paper is structured as follows: In §~@sec:governing_equations, we introduce the governing equations for the evaporation of rivulets and droplets, and we present transient numerical simulations for rivulets. The slow evaporation motivates the introduction of a simplified quasi-stationary model (§~@sec:qs_model) and its lubrication version (§~@sec:lubrication). Section~@sec:evaporative_flux examines the local evaporative flux for droplets (§~@sec:evaporative_flux_droplet) and rivulets (§~@sec:evaporative_flux_rivulet), to be used in the simplified models. We then validate the models against transient simulations (§~@sec:validation) and investigate the stagnation point shift, for rivulets (§~@sec:shift_stagnation_point_rivulet, with some analytical results in §~@sec:analytical_rivulet) and droplets (§~@sec:shift_stagnation_point_droplet). Finally, we conclude in §~@sec:conclusions.

= Transient system of equations for evaporating rivulets and droplets
<sec:transient_model>
== Underlying dynamical equations
<sec:governing_equations>
We focus on the evaporation of a single or two neighbouring binary droplets (or rivulets) which form a low contact angle $theta$ with the substrate. Let us consider that: only one component $B$ in the liquid phase can evaporate into the vapour phase; the surface tension monotonically decreases with the concentration of the non-volatile component; and evaporation is slow. Under these assumptions, we avoid complexities arising from Marangoni instabilities \[17\], \[30\], \[31\] and we meet the exact conditions to apply the models introduced by \[32\], which we describe in the following.

At ambient conditions, the evaporation is dominated by the diffusion of vapour in the surrounding air. The solution of the Laplace equation $ nabla^2 c_B = 0 \, $<eq:laplace_cvap> with the boundary conditions $ c_B = c_B^(upright(e q)) = c_B^(upright(p u r e)) gamma_B x_B quad upright("at liquid-gas interface") \, $ $ c_B = c_B^oo quad upright("at far-field") \, $ gives the vapour concentration $c_B$ in the gas phase. Here, $c_B^oo$ is the vapour concentration at far-field, dependent of the relative humidity, $gamma_B$ is the activity coefficient, and $x_B$ is the molar mass of component $B$.

The diffusive mass flux of the component $B$ through the liquid-gas interface due to evaporation is given by $ j_B = - D_B^(upright(v a p)) bold(nabla) c_B dot.op upright(bold(n)) \, $ where $D_B^(upright(v a p))$ is the diffusion coefficient of vapour and $upright(bold(n))$ is the normal vector at the liquid-gas interface. If only one component evaporates, then the total evaporation rate is $j = j_B$. Naturally, the mass fraction $y_A$ of the non-volatile component $A$ in the liquid phase increases during evaporation, which is accounted for by the Robin boundary condition in the co-moving frame of the liquid-gas interface $ rho D bold(nabla) y_A dot.op upright(bold(n)) = y_A j \, $<eq:robinbc> where $rho$ is the mass density of the liquid phase and $D$ is the diffusivity in the liquid phase. Within the liquid, the mass fraction $y_A$ is governed by the advection-diffusion equation $ rho (partial_t y_A + upright(bold(u)) dot.op bold(nabla) y_A) = bold(nabla) dot.op \( rho D bold(nabla) y_A \) . $ Navier-Stokes flow without body forces in the liquid phase is described by $ partial_t rho + bold(nabla) dot.op \( rho upright(bold(u)) \) = 0 \, $ $ rho \( partial_t upright(bold(u)) + upright(bold(u)) dot.op bold(nabla) upright(bold(u)) \) = - bold(nabla) p + bold(nabla) dot.op (mu bold(nabla) upright(bold(u))) \, $ where $mu$ is the viscosity of the liquid phase and $p$ is the pressure. We neglect gravity since the droplet is small and the contact angle is low. At the substrate, the no-slip boundary condition is applied, i.e. we consider a constant contact radius \[33\]. At the liquid-gas interface, the kinematic boundary condition $ rho \( upright(bold(u)) - upright(bold(u))_I \) dot.op upright(bold(n)) = j \, $ and the dynamic boundary condition $ upright(bold(n)) dot.op (mu \( bold(nabla) upright(bold(u)) + bold(nabla) upright(bold(u))^T \) - p upright(bold(I))) = upright(bold(n)) sigma kappa + bold(nabla)_t sigma \, $<eq:dynamic_bc> are applied, where $upright(bold(u))_I$ is the velocity of the liquid-gas interface, $sigma$ is the surface tension, $kappa$ is the curvature of the liquid-gas interface and $bold(nabla)_t$ is the surface gradient operator. In this manuscript, we neglect the influence of temperature on flow field, for simplicity. All properties are therefore only dependent on the mass fraction $y_A$.

== Numerical simulations results for rivulets
<sec:transient_rivulet>
Due to the non-axisymmetric evaporation rate of neighbouring droplets, the resulting flow field is asymmetric. Accurately computing the flow in this scenario requires solving the full three-dimensional problem, which is computationally expensive. As a starting point, we solve the full two-dimensional problem for rivulets. In later sections, we introduce simplifications to develop a model for droplets. All differential operators introduced in the previous section are expressed in Cartesian coordinates for the rivulet geometry. Note that the solution for $c$ in the gas phase within a two-dimensional domain depends on the distance $L$ to the far-field boundary \[1\], \[34\], \[35\]. We fix the far-field boundary at a distance $L \/ R = 100$.

#figure(image("graphics/fig1.png", width: 100.0%),
  caption: [
    Transient direct numerical simulations, evaluated after 2500 s (a), 5000 s (b), 7500 s (c), and 10000 s (d), of two neighbouring rivulets, with an initial contact angle of $theta = 50 degree$, a 1,2-hexanediol mass fraction of $y_B = 5 %$ and a distance $b =$2.1 mm between their centres, evaporating in an environment with relative humidity of 70 %. The plots are magnified vertically by 2.5 $times$, in order to better visualise the flow inside the rivulet. On the left side of each subfigure, the velocity magnitude is displayed with superimposed streamlines. On the right, the 1,2-hexanediol mass fraction is shown. Additionally, the gas phase illustrates the water vapour mass fraction, while the liquid-gas interface highlights the evaporation flux of water. The $x$-position where the two vortices in the rivulet meet (which we refer to as the stagnation point $x_0$) increases with time.
  ]
)
<fig:transient_rivulet>

The system of equations described in §~@sec:transient_model is solved using a sharp-interface Lagrangian--Eulerian finite element method implemented in the software package #smallcaps[pyoomph] \[36\], which is based on #smallcaps[oomph-lib] \[37\] and #smallcaps[GiNaC] \[38\]. All computational domains are discretised using meshes composed of triangular elements. Linear basis functions are employed for pressure $p$ fields, whereas quadratic basis functions are used for the velocity $upright(bold(u))$, vapour concentration $c$ and mass fraction $y_A$ fields. Time integration is performed using a second-order implicit backward differentiation formula.

At early stages of evaporation, the streamlines in the rivulet nearly form a single vortex (see Figure~@fig:transient_rivulet). We define the stagnation point, $x_0$, as the x-coordinate where the two vortices merge -- identified by a zero value in the tangential interfacial velocity, $upright(bold(u))_t = upright(bold(u)) dot.op upright(bold(t))$. For flat rivulets, this zero-velocity condition is nearly uniform along the vertical direction, which justifies using $upright(bold(u))_t$ to determine $x_0$. Alternatively, we could also find $x_0$ by identifying the point where the velocity close to the substrate crosses zero, but, at least for rivulets, this would yield virtually the same result, particularly for low contact angles. As evaporation progresses, the stagnation point shifts toward the centre of the rivulet, prompting an investigation into how $x_0$ depends on the contact angle, surface tension forces, and the distance between the droplets. We begin by introducing a simplified quasi-stationary system of equations, allowing us to identify the relevant dimensionless control parameters.

= Simplified quasi-stationary system of equations for evaporating rivulets and droplets
<sec:simplified_model>
== Quasi-stationary model
<sec:qs_model>
We focus on the evaporation of droplets (or rivulets) with quasi-stationary evaporation, such as mixtures of water and 1,2-hexanediol #footnote[We ignore the slight nonmonotonicity of the surface tension as a function of the 1,2-hexanediol \[30\]. Though it leads to extremely rich interesting behaviour \[30\], here it distracts from the main point of this paper. So our binary liquid can be seen as a model liquid with material parameters inspired by 1,2-hexanediol-water mixtures.]. In such cases, the internal flow within the liquid remains stable and approximately quasi-steady at each instant during the drying process \[32\], provided that the solutal Marangoni flow induces sufficient mixing. Consequently, we assume small compositional deviations around the spatially averaged mass fraction $y_(A \, 0)$, and express the local mass fraction of component $A$ as $y_A = y_(A \, 0) + y$, where $y$ denotes the deviation from the mean. We also consider, for simplicity, that changes in temperature do not significantly affect the flow field when compared to the effects of composition.

All liquid properties are considered constant, evaluated at the spatially averaged composition and ambient temperature, except for the liquid-gas surface tension, which varies according to the first order Taylor expansion: $sigma \( y_A \) = sigma \( y_(A \, 0) \) + y thin partial_(y_A) sigma$. Since the average composition evolves slowly -- at least for droplets or rivulets with contact angles $theta gt.tilde 5 degree$ -- this expansion can be performed at any given time during the drying process. We introduce the following nondimensional scales: $ x = R tilde(x) \, quad t = R^2 / D_0 tilde(t) \, quad upright(bold(u)) = D_0 / R tilde(upright(bold(u))) \, quad p = frac(mu_0 D_0, R^2) tilde(p) \, $ where $D_0$ and $mu_0$ are the diffusivity and viscosity of the liquid, respectively, and $R$ is the base radius of the droplet or rivulet. These nondimensional scales are, in principle, time-dependent, as the liquid volume $V$ and the average composition $y_(A \, 0)$ evolve. However, as shown by \[32\], the dynamics can be considered quasi-stationary at each instant during evaporation, at least after the initial short transient and as long as Marangoni flow is strong enough.

The vapour concentration $c_B$ in the gas phase is then expressed as: $ c_B = \( c_(B \, 0)^(upright(e q)) - c_B^oo \) tilde(c) + c_B^oo . $ Note that we neglect the effect of the variations on the local composition on the vapour concentration. As argued by \[32\], if the local composition at the interface is close to the average composition, which happens in droplets or rivulets with strong Marangoni induced circulation, then the equilibrium vapour concentration at the interface is approximately constant. Furthermore, for the particular case of 1,2-hexanediol and water mixtures, the equilibrium vapour concentration remains roughly constant for 1,2-hexanediol mass fractions below 0.5 \[29\], based on UNIFAC activity coefficients \[39\]. The Laplace equation~#link(<eq:laplace_cvap>)[\[eq:laplace\_cvap\]] is then given by $ tilde(nabla^2) tilde(c) = 0 \, $<eq:nondim_laplace_cvap> with boundary conditions $tilde(c) = 1$ at the liquid-gas interface, and $tilde(c) = 0$ at the far-field. Accordingly, the evaporation flux $j$ can be expressed as $ j_B = D_B^(upright(v a p)) / R \( c_(B \, 0)^(upright(e q)) - c_B^oo \) tilde(j) \, $ where $tilde(j) = - tilde(partial)_n tilde(c)$ depends solely on the liquid geometry. Neglecting higher-order terms in $y$, the advection-diffusion equation for the deviation $y$ becomes: $ partial_(tilde(t)) y_(A \, 0) + partial_(tilde(t)) y + tilde(upright(bold(u))) dot.op tilde(bold(nabla)) y = tilde(nabla^2) y \, $<eq:nondim_advection_diffusion> with the boundary condition at the liquid-gas interface: $ - tilde(bold(nabla)) y dot.op upright(bold(n)) = upright(E v) j - upright(E v)_(upright(t o t)) y j . $<eq:nondim_robin_bc> The dimensionless evaporation numbers are defined as: $ upright(E v) = frac(- y_(A \, 0) D_B^(upright(v a p)) \( c_(B \, 0)^(upright(e q)) - c_B^oo \), rho_0 D_0) \, quad upright(E v)_(upright(t o t)) = frac(D_B^(upright(v a p)) \( c_(B \, 0)^(upright(e q)) - c_B^oo \), rho_0 D_0) . $

The parameter $upright(E v)$ quantifies the strength of the concentration gradients induced by the selective evaporation of component $B$ and thereby the Marangoni stresses driving the flow. It plays a central role in determining the flow field.

The parameter $upright(E v)_(upright(t o t))$ measures the total evaporation rate and is associated with flow towards the contact line in pinned liquids, i.e.~the "coffee-stain" effect. This contribution is generally small under strong Marangoni convection and minimal compositional deviation. However, towards the end of the drying process, when the non-volatile component dominates, local compositional effects become more significant. For simplicity, following the well-established model of \[32\], we assume $upright(E v)_(upright(t o t)) = 0$. The kinematic boundary condition at the liquid-gas interface is then reduced to $ upright(bold(n)) dot.op tilde(upright(bold(u))) = 0 . $<eq:nondim_kinbc>

Introducing the scaled variable $xi = y / upright(E v)$, the quasi-stationary form of equation @eq:nondim_advection_diffusion becomes $ tilde(upright(bold(u))) dot.op tilde(bold(nabla)) xi = tilde(nabla^2) xi + tilde(J) / tilde(V) \, $ where $tilde(J) \/ tilde(V)$ is the integrated evaporation flux $tilde(J)$ over the liquid-gas interface, averaged by the nondimensional volume $tilde(V)$ (or cross-sectional area for a rivulet). The Robin boundary condition #link(<eq:nondim_robin_bc>)[\[eq:nondim\_robin\_bc\]] at the liquid-gas interface becomes the Neumann condition $ - tilde(bold(nabla)) xi dot.op upright(bold(n)) = tilde(j) . $<eq:nondim_robin_bc2> The dynamic boundary condition @eq:dynamic_bc at the interface is modified to $ upright(bold(n)) dot.op (tilde(bold(nabla)) tilde(upright(bold(u))) + tilde(bold(nabla)) tilde(upright(bold(u)))^T) = upright(bold(n)) tilde(kappa) / upright(C a) + upright(M a) tilde(bold(nabla))_t xi \, $<eq:dynamic_bc2> where the dimensionless capillary number $upright(C a)$ and Marangoni number $upright(M a)$ are defined as $ upright(C a) = frac(mu_0 D_0, sigma_0 R) \, quad upright(M a) = frac(R partial_(y_A) sigma, mu_0 D_0) upright(E v) . $ For small droplets or rivulets, the capillary number is small. In that case, the liquid will remain with a spherical cap.

Since the flow's characteristic Schmidt number $upright(S c) = mu_0 \/ \( D_0 rho_0 \)$ is typically large and the Reynolds number small, we can neglect the inertial terms in the Navier-Stokes equation. We therefore consider incompressible Stokes flow in the liquid phase to be given by $ accent(bold(nabla) dot.op, ̃) tilde(upright(bold(u))) = 0 \, $<eq:nondim_incomp> $ tilde(bold(nabla)) tilde(p) = tilde(nabla^2) tilde(upright(bold(u))) . $<eq:nondim_stokes>

Naturally, for droplets, the system of equations #link(<eq:nondim_laplace_cvap>)[\[eq:nondim\_laplace\_cvap\]],#link(<eq:nondim_kinbc>)[\[eq:nondim\_kinbc\]]--#link(<eq:nondim_stokes>)[\[eq:nondim\_stokes\]] (hereafter termed the quasi-stationary model) is still three-dimensional and therefore computationally expensive. However, in the limit of small contact angles, the lubrication approximation, introduced in the following subsection, can be employed to effectively reduce the problem to two dimensions.

== Lubrication quasi-stationary model
<sec:lubrication>
In the lubrication quasi-stationary model (hereafter simply lubrication model), we redefine some nondimensional scales to make use of the small vertical length (as compared to the horizontal one) scale of the liquid body: $ h = theta R tilde(h) \, quad upright(bold(u))_bar.v.double = D_0 / R tilde(upright(bold(u)))_bar.v.double \, quad u_z = theta D_0 / R tilde(u)_z \, quad p = frac(mu_0 D_0, theta^2 R^2) tilde(p) \, $ where the subscript $bar.v.double$ indicates the horizontal component of the vector. For brevity, in the following, we drop the horizontal component subscript in the velocity, in the gradient $bold(nabla)$ and divergence $bold(nabla) dot.op$ operators.

Following the standard derivation of the thin film approximation \[40\], \[41\] and assuming negligible "coffee-stain" flow ($upright(E v)_(upright(t o t)) = 0$), we arrive at the following evolution equation for the liquid height $h$: $ tilde(bold(nabla)) dot.op tilde(upright(bold(Q))) = 0 $<eq:nondim_film_thickness> where $ tilde(upright(bold(Q))) = integral_0^(tilde(h)) tilde(upright(bold(u))) d tilde(z) = - tilde(h)^3 / 3 tilde(bold(nabla)) tilde(p) + upright(M a) theta tilde(h)^2 / 2 tilde(bold(nabla)) macron(xi) . $<eq:nondim_flowrate> We consider the limit of zero-$upright(C a)$, i.e.~the droplet (or rivulet) remains a spherical cap. This means that the Laplace pressure is sufficiently strong to prevent any notable deformations. In droplets (or rivulets) with small contact angle, strong Marangoni flow can lead to, depending on its direction, a shape contraction \[28\] or a pancake-like shape \[42\].

For the compositional evolution, we consider a regime where vertical gradients of composition are small, but not negligible. We consider the evolution equation for the vertically averaged mass fraction $macron(xi)$ which includes Taylor-Aris dispersion \[43\]: $ tilde(upright(bold(Q))) dot.op tilde(bold(nabla)) macron(xi) = tilde(bold(nabla)) dot.op \( D_(upright(e f f)) tilde(h) tilde(bold(nabla)) macron(xi) \) - tilde(j) / theta + frac(tilde(J) tilde(h), tilde(V)) \, $<eq:nondim_mass_fraction> where the dimensionless effective diffusivity $D_(upright(e f f))$ is given by $ D_(upright(e f f)) = 1 + theta^2 (frac(2 tilde(upright(bold(Q)))_C^2, 105) + frac(tilde(upright(bold(Q)))_C dot.op tilde(upright(bold(Q)))_M, 20) + tilde(upright(bold(Q)))_M^2 / 30) \, $<eq:Deff>

$ upright("with ") quad tilde(upright(bold(Q)))_C = - tilde(h)^3 / 3 tilde(bold(nabla)) tilde(p) \, quad tilde(upright(bold(Q)))_M = theta upright(M a) tilde(h)^2 / 2 tilde(bold(nabla)) macron(xi) . $

Within the lubrication model, the local evaporative flux cannot be computed directly because doing so would require explicitly modelling the vapour concentration $c_B$ in the gas phase. Instead, this flux must be imposed as a boundary condition at the liquid-gas interface.

= Local evaporative flux of neighbouring drops and rivulets for the lubrication model
<sec:evaporative_flux>
== Droplets
<sec:evaporative_flux_droplet>
For flat pure droplets, the evaporation flux is given by \[13\]: $ j_(B \, 0) = frac(2 D_B^(upright(v a p)) \( c_(B \, 0)^(upright(e q)) - c_B^oo \), pi R sqrt(1 - r^2)) . $<eq:evapfluxbase_droplet> For the sake of simplicity, we consider that the presence of a second component in the droplet does not significantly affect the evaporation flux of the first component. In the particular case of 1,2-hexanediol and water mixtures, the equilibrium vapour concentration remains roughly constant for 1,2-hexanediol mass fractions below 0.5, which justifies the above assumption. For increased accuracy, we consider the analytical integral solution \[13\] for the evaporation flux of the droplet, considering the effect of the contact angle.

When another droplet is present, the evaporation flux is modified due to a shielding effect. The shielding factor $F$, which multiplied by the base evaporative flux of eq.~@eq:evapfluxbase_droplet gives the evaporation rate $j_(B \, 1)$ of each neighbouring droplet, can be written as \[2\]: $ F = 1 - frac(4 sqrt(b^2 - 1), (1 + 2 / pi arcsin 1 / b) (2 pi \( r^2 + b^2 - 2 r b cos phi.alt \))) \, $ where $b$ is the distance between the centres of the two droplets and $phi.alt$ the azimuthal angle in the drop. The shielding factor is independent of $theta$ since it was derived for flat drops.

== Rivulets
<sec:evaporative_flux_rivulet>
#figure(image("graphics/flux_sketch.png", width: 100.0%),
  caption: [
    Sketch of (a) isolated and (b) neighbouring evaporating rivulets in an infinite half-space of size $L$. In this sketch we have chosen a small value for $L$ for illustration purposes. The top row shows the numerically calculated water vapour concentration in the entire domain. The green arrows indicate the local evaporative flux. The bottom row shows a sketch of the rivulet geometry. The origin of the x-coordinate is chosen at the centre of the rivulet and the right rivulet in the neighbouring case. $R$ is the radius, or half-width, of the rivulet. The distance between rivulets can be defined as the centre-to-centre distance $b$ or the edge-to-edge distance $d$.
  ]
)
<fig:flux_sketch>

Figure @fig:flux_sketch shows the rivulet geometry, the local evaporative flux, and the water vapour concentration in the semi-circular infinite half-space. To the best of the authors' knowledge, the evaporation flux of a rivulet for an arbitrary contact angle has not been derived yet. \[1\] showed the non-existence of an analytical solution for the vapour concentration in the gas phase with and infinite half-space, due to the logarithmic nature of the solution of the two-dimensional Laplace equation. When considering a finite semi-elliptic domain with radii $L$ and points at $R$ (approximately a semi-circular domain for large enough $L$), the evaporation flux of a flat isolated rivulet is given by $ j_(B \, 0) = frac(D_B^(upright(v a p)) \( c_(B \, 0)^(upright(e q)) - c_B^oo \), upright(a r c s i n h) (L \/ R)) 1 / sqrt(R^2 - x^2) \, $<eq:evapfluxbase_rivulet> where $x$ is the distance from the centre of the rivulet to the point of interest. Note that $upright(a r c s i n h) (L \/ R) approx ln (2 L \/ R)$ for $L gt.double R$. For two neighbouring rivulets the evaporative flux is given by

$ j_(B \, 1) = frac(D_B^(upright(v a p)) \( c_(B \, 0)^(upright(e q)) - c_B^oo \), 2 thin upright(a r c s i n h) (L \/ sqrt(2 b R))) 1 / sqrt(R^2 - x^2) frac(b + 2 x, sqrt(\( x + b + R \) \( x + b - R \))) $<eq:evapflux_rivulet> Here, $x$ is the distance from the centre of the right rivulet, as indicated in figure @fig:flux_sketch. Note that \[1\] uses the coordinate $eta$, which is centred between both rivulets. The first term in eq. #link(<eq:evapflux_rivulet>)[\[eq:evapflux\_rivulet\]] is the integral flux, the second term the local flux for an isolated rivulet, and the final term is the local shielding effect. We consider #link(<eq:evapflux_rivulet>)[\[eq:evapflux\_rivulet\]] when applying the lubrication model to neighbouring rivulets.

= Validation of different models and approximations
<sec:validation>
We begin by evaluating the accuracy of the quasi-stationary model (see §@sec:qs_model) against the full transient simulations introduced in §@sec:transient_model. At four distinct time instances from the transient rivulet simulations (Figure~@fig:transient_rivulet), we extract the values of $upright(M a)$ and $theta$. Using these parameters, we compute the corresponding quasi-stationary solutions and compare them with the transient results (see Figure~@fig:validation_stokes).

#figure(image("graphics/fig3.png", width: 100.0%),
  caption: [
    Perfect agreement of the quasi-stationary model (right of each subfigure) with the transient simulations (left of each subfigure) at four different times: 2500 s (a), 5000 s (b), 7500 s (c), and 10000 s (d). Each subfigure shows the composition of the liquid phase (1,2-hexanediol mass fraction $y_B$) and the velocity direction (with superimposed streamlines) in the liquid phase. In the gas phase, the water vapour mass fraction $c_B$ is shown, while the liquid-gas interface highlights the evaporation flux of water. The quasi-stationary model is evaluated at the same time as the transient simulation, using the same parameters $upright(M a)$ and $theta$.
  ]
)
<fig:validation_stokes>

The results indicate that the quasi-stationary model replicates the key flow features very well. As argued by \[32\] and further supported by our numerical tests, the good agreement only holds when the Marangoni number is sufficiently high. In contrast, at lower Marangoni numbers the "coffee-stain" flow becomes relevant by transporting solute to the rim, which accumulates over time as evaporation progresses, resulting in deviations from the quasi-stationary behaviour. For sufficiently large Marangoni numbers the mixing effect due to the Marangoni flow overwhelms the transport by the "coffee-stain" flow.

Nevertheless, even for larger Marangoni number, near the end of the drop/rivulet lifetime the "coffee-stain" flow will always dominate again due to a singularity in time, breaking the quasi-stationary assumption. When the contact angle approaches zero, the "coffee-stain" flow is forced through an increasingly small cross-sectional area, increasing the radial velocity as $1 \/ theta$. This effect is also known as "rush hour" \[44\]. This means that the contact angle must be sufficiently small to be able to use the lubrication model, but not too small to ensure that the dynamics remains quasi-stationary.

We benchmark the lubrication model for rivulets by comparing its predictions for the evaporation rate, $j$, and the vertically averaged mass fraction, $macron(y)_A$, with those from both the transient and quasi-stationary models. Here, the both the quasi-stationary and the lubrication models use the same simulation parameters $upright(M a)$ and $theta$ extracted from the transient runs. Figure~@fig:validation_lubrication also presents the evolution of the stagnation point $x_0$ over time (or as the contact angle $theta$ reduces) as given by the quasi-stationary and lubrication models, when using expression @eq:evapflux_rivulet for the evaporation rate or when using the numerically calculated evaporation rate, by solving eq.~@eq:nondim_laplace_cvap in the gas phase for a given $theta$.

#figure(image("graphics/fig4.png", width: 100.0%),
  caption: [
    Comparison of the lubrication model predictions (green dash-dotted) with transient (blue solid) and quasi-stationary (red dashed) simulations results: the evaporation rate at $t =$2500 s (a) and $t =$7500 s (b), the vertically averaged mass fraction at $t =$2500 s (d) and $t =$7500 s (e), the evolution of the stagnation point $x_0$ over time (c). In (d) and (e), we show, for the transient and quasi-stationary models, the value of $y_A$ at the substrate (lower lines) and at the liquid-gas interface (upper lines), while the lubrication model only provides the vertically averaged value. In (f), we compare the evolution of the stagnation point $x_0$ over time (or as contact angle $theta$ reduces) as given by the quasi-stationary (red) and lubrication (green) models, when using expression @eq:evapflux_rivulet for the evaporation rate (transparent curves) or when using the numerically calculated evaporation rate, by solving eq.~@eq:nondim_laplace_cvap in the gas phase for a given $theta$ (opaque curves).
  ]
)
<fig:validation_lubrication>

For flat rivulets, the evaporation rate predicted by the lubrication model agrees well with the transient results at later times (i.e., lower contact angles), though larger discrepancies are observed at earlier times, particularly in regions near the neighbouring rivulet. Comparing the vertically averaged mass fraction reveals that the lubrication model's solution falls between the substrate and interfacial values from the transient and quasi-stationary models. Notably, for larger contact angles, the deviation of the lubrication model becomes more pronounced in the region closer to the other rivulet, likely due to differences in the evaporation flux.

The stagnation point $x_0$ is not well captured by the lubrication model, particularly when using #link(<eq:nondim_laplace_cvap>)[\[eq:nondim\_laplace\_cvap\]] for the evaporation rate. At earlier times (with higher contact angles), the stagnation point is significantly underestimated and remains nearly constant over time, contrasting with its evolving behaviour in both the transient and quasi-stationary models. At later times (with lower contact angles), the $x_0$ from the transient and quasi-stationary models tends towards the value predicted by the lubrication model. This disagreement partially arises from the approximated evaporation flux used in the lubrication model, which does not account for the contact angle dependence. This is clear in figure @fig:validation_lubrication\(f), where using the same evaporation rate in both the models leads to much closer agreement. For larger contact angles, there is still some disagreement between solutions of quasi-stationary and lubrication models even when the same evaporation rate is considered, likely stemming from the assumption of negligible vertical gradients associated with lubrication model, which gets worse for larger contact angles.

= Shift of the stagnation point
<sec:shift_stagnation_point>
== Rivulets using the quasi-stationary model
<sec:shift_stagnation_point_rivulet>
Hereinafter, all fields are nondimensional and the tildes are dropped for brevity. Acknowledging the accuracy of the quasi-stationary model (§@sec:qs_model) and recognising the limitations of the lubrication model (§@sec:lubrication) for rivulets, we now investigate, with the quasi-stationary model, how the stagnation point $x_0$ shifts with respect to its governing parameters, namely the contact angle $theta$, the Marangoni number $upright(M a)$, and the distance between neighbouring rivulets $b$.

Firstly, we evaluate the stagnation point $x_0$ for a range of $upright(M a)$ values at four different contact angles -- 10 ° (red), 20 ° (green), 30 ° (orange) and 40 ° (blue) -- while keeping the distance between the rivulets fixed at $b = d + 2 = 2.1$, as shown in Figure~@fig:phase_space_rivulet\(a). It is immediately evident that, for all considered contact angles, the stagnation point $x_0$ is independent of $upright(M a)$. An analytical explanation for this observation will be developed in subsection §@sec:analytical_rivulet.

#figure(image("graphics/fig5.png", width: 100.0%),
  caption: [
    Stagnation point in rivulets using the quasi-stationary model. (a) Stagnation point $x_0$ versus Marangoni number for rivulets at four different contact angles: 10 ° (red), 20 ° (green), 30 ° (orange), and 40 ° (blue) and $b = 2.1$. (b) Phase space showing the variation of the displacement of the stagnation point $x_0$ (quantifying the symmetry breaking) as a function of the contact angle $theta$ and the inter-rivulet distance $b = d + 2$ at fixed $upright(M a) = 10^5$.
  ]
)
<fig:phase_space_rivulet>

Secondly, we assess the stagnation point $x_0$ within a phase space defined by $theta$ and the distance $b$, for a fixed $upright(M a) = 10^5$, as illustrated in Figure~@fig:phase_space_rivulet\(b). Naturally, as $b$ increases, the behaviour of neighbouring rivulets converges towards that of an isolated rivulet, which has a stagnation point at $x_0 = 0$. Interestingly, even for a large distance $b = 10$, $x_0$ is still different from zero, indicating that the neighbouring rivulet still has an influence on the flow field. As the contact angle $theta$ increases, the displacement of the stagnation point $x_0$ also increases. This is expected since the shielding effect near the neighbouring rivulet is amplified with a higher contact angle since the adjacent rivulets' interfaces are closer and there is less "space" for the water vapour to diffuse away, i.e. the water vapour is more confined by the neighbouring surface when the contact angle increases, thereby accentuating the asymmetry in the flow for high contact angles.

=== Analytical solutions for rivulets using the lubrication model
<sec:analytical_rivulet>
For rivulets we can find the shift of the stagnation point analytically when using the lubrication model, without having to solve anything numerically. To obtain an analytical solution for the $x$-shift of the stagnation point of the velocity for rivulets, we must first solve for the velocity in the drop. Similar as before, when using the lubrication theory, we assume that the evaporation is quasi-static and that coffee stain flow is negligible. Eq. #link(<eq:nondim_stokes>)[\[eq:nondim\_stokes\]] in the lubrication approximation becomes $ frac(d p, d x) = frac(partial^2 u_x, partial z^2) . $ Using the following boundary conditions, no slip at the substrate $u #scale(x: 120%, y: 120%)[\|]_(z = 0) = 0$, and Marangoni stress at the interface $frac(partial u_x, partial z) #scale(x: 120%, y: 120%)[\|]_(z = h) = theta thin upright(M a) frac(d macron(xi), d x)$, we find the following solution $ u_x = frac(d p, d x) (z^2 - 2 z h) + theta thin upright(M a) frac(d macron(xi), d x) z . $ Using eq. #link(<eq:nondim_flowrate>)[\[eq:nondim\_flowrate\]] we can write the pressure gradient in terms of the total flow rate $upright(bold(Q))$ and the concentration gradient $ u_x = theta thin upright(M a) (frac(3 z^2, 4 h) - z / 2) frac(d macron(xi), d x) - 3 / 2 (z^2 / h^3 - 2 z / h^2) upright(bold(Q)) dot.op upright(bold(e))_x . $ Due to the no-slip condition, the velocity at the substrate must be zero. Therefore, we determine the velocity close to the surface using $frac(partial u_x, partial z)$ at $z = 0$ and set it to zero to find the shift of the stagnation point. When $upright(bold(Q)) = 0$, this condition translates to $ frac(partial u_x, partial z) #scale(x: 240%, y: 240%)[\|]_(z = 0) = theta thin upright(M a) frac(d macron(xi), d x) = 0 . $ Consequently, the stagnation point coincides with the maxima in the concentration, which we can compute starting from equation #link(<eq:nondim_mass_fraction>)[\[eq:nondim\_mass\_fraction\]] with $upright(bold(Q)) = 0$ and integrating over $x$ $ frac(d, d x) (D_(upright(e f f)) h frac(d macron(xi), d x)) = j / theta - frac(J h, V) \, $ $ D_(upright(e f f)) frac(d macron(xi), d x) = frac(1, theta h) integral j thin d x - frac(J, V h) integral h thin d x . $<eq:dif_adv_int_1> Knowing that $upright(bold(Q)) = 0$ at the contact line, from equation #link(<eq:nondim_film_thickness>)[\[eq:nondim\_film\_thickness\]], we find that $upright(bold(Q)) = 0$ everywhere along the rivulet and therefore $upright(bold(Q))_C = - upright(bold(Q))_M$. Equation #link(<eq:Deff>)[\[eq:Deff\]] then simplifies to $ D_(upright(e f f)) = 1 + theta^2 upright(bold(Q))_M^2 / 420 = 1 + 1 / 1680 h^4 theta^4 upright(M a)^2 (frac(d macron(xi), d x))^2 . $ We can then rewrite the vertically averaged mass fraction evolution equation #link(<eq:dif_adv_int_1>)[\[eq:dif\_adv\_int\_1\]] as $ frac(d macron(xi), d x) + 1 / 1680 h^4 theta^4 upright(M a)^2 (frac(d macron(xi), d x))^3 = frac(1, theta h) integral j thin d x - frac(J, V h) integral h thin d x + a \, $<eq:dif_adv_int_2> with an integration constant $a$. In the limit approaching isolated rivulets ($b gt.double 2$), the concentration $macron(xi)$ in the rivulet must symmetric in $x$. Therefore, all terms in eq. #link(<eq:dif_adv_int_2>)[\[eq:dif\_adv\_int\_2\]] must be odd in $x$. Consequently, $a$ must be zero. Using the following notation: $macron(xi)' \( x \) = frac(d macron(xi), d x)$, $v \( x \) = 1 / 1680 theta^4 upright(M a)^2 h^4$, and $w \( x \) = frac(1, theta h) integral j thin d x - frac(J, V h) integral h thin d x$, we can write #link(<eq:dif_adv_int_2>)[\[eq:dif\_adv\_int\_2\]] more concisely as $ macron(xi)' + v macron(xi)^(' 3) = w . $<eq:dif_adv_int_3> Solving for $macron(xi)'$ gives $ macron(xi)' = psi / v - frac(1, 3 psi) \, quad upright(w i t h) med med psi = [frac(v^2 w, 2) + (v^3 / 3^3 + frac(v^4 w^2, 2^2))^(1 / 2)]^(1 / 3) $<eq:dif_adv_sol> The $x$-shift of the maxima in the concentration can be calculated by evaluating $macron(xi)' = 0$. Using #link(<eq:dif_adv_sol>)[\[eq:dif\_adv\_sol\]] we find $v^(5 \/ 2) w = 0$. Re-substituting $v$ and $w$ gives $ (1 / 1680 theta^4 upright(M a)^2 h^4)^(5 / 2) (frac(1, theta h) integral j thin d x - frac(J, V h) integral h thin d x) = 0 $<eq:ana_x_shift_1> The first factor only depends on $x$ via the height $h$ and is positive definite everywhere except at the rim of the rivulet. Since we are interested in the non-trivial maxima/minima, we focus on the second factor, which, because of the positive-definiteness of the first factor, must be equal to zero, i.e.~$ integral j thin d x - frac(theta J, V) integral h thin d x = 0 . $<eq:ana_x_shift_final> Note that the above expression is independent of the Marangoni number. Even if we would have considered only Marangoni flow, by neglecting the $macron(xi)'$ term in eq. #link(<eq:dif_adv_int_3>)[\[eq:dif\_adv\_int\_3\]], or only diffusion, by neglecting the $macron(xi)^(' 3)$ term, we would have found the same expression for the $x$-shift. However, the $x$-shift cannot be expressed in terms of elementary functions without approximating of $j$ and $h$. Approximating the local evaporative flux of a neighbouring rivulet, eq. #link(<eq:evapflux_rivulet>)[\[eq:evapflux\_rivulet\]], for large rivulet separations $b gt.double 2$ yields $ j_1 = J frac(1, pi sqrt(1 - x^2)) (1 - x / b) + cal(O) (1 / b^2) . $<eq:j1_order_1> Assuming that the rivulet shape is a circular arc, which is analogous to a spherical cap approximation for a drop, the rivulet shape is given by $ h = 1 / theta [tan (theta / 2) - frac(1 - sqrt(1 - x^2 sin^2 theta), sin theta)] . $<eq:riv_h> For low contact angles the rivulet height can be approximated by $ h = 1 / 2 (1 - x^2) + theta^2 / 24 (1 + 2 x^2 - 3 x^4) + cal(O) (theta^4) . $<eq:riv_h_order_3> The first order term in eq. #link(<eq:riv_h_order_3>)[\[eq:riv\_h\_order\_3\]] is a parabola, whose shape is independent of the contact angle. Therefore, we need to include the next higher order term to describe the contact angle dependence of the $x$-shift. Note that this is actually a third order approximation in $theta$, which is obscured by the nondimensionalisation. The volume of the rivulet is given by $ V = theta integral_(- 1)^1 h thin d x = 2 / 3 theta + 4 / 45 theta^3 . $<eq:riv_V_order_3> Combining the first order approximation of the flux in $b^(- 1)$ and the third order approximation of the rivulet height in $theta$ in eq. #link(<eq:ana_x_shift_final>)[\[eq:ana\_x\_shift\_final\]] and omitting the higher order terms, we find $ integral frac(1, pi sqrt(1 - x^2)) (1 - x / b) thin d x - theta / V integral [1 / 2 (1 - x^2) + theta^2 / 24 (1 + 2 x^2 - 3 x^4)] thin d x = 0 \, $<eq:ana_x_shift_approx_1> $ frac(arcsin \( x \), pi) - frac(sqrt(1 - x^2), pi b) - [x / 2 - x^3 / 6 + theta^2 / 24 (x - 2 / 3 x^3 + 3 / 5 x^5)] (2 / 3 + 4 / 45 theta^2)^(- 1) = 0 . $<eq:ana_x_shift_approx_2> Again, we cannot progress in terms of elementary functions without approximating further. Since we have already assumed that the rivulet separation is large, we expect that the $x$-shift will be small, allowing us to approximate eq. #link(<eq:ana_x_shift_approx_2>)[\[eq:ana\_x\_shift\_approx\_2\]] for small $x$ and keep only the zeroth and first order terms in $x$, $ x / pi - frac(1, pi b) - x (1 / 2 + 1 / 24 theta^2) (2 / 3 + 4 / 45 theta^2)^(- 1) = 0 . $<eq:ana_x_shift_approx_3> Solving for $x$ finally gives the $x$-shift of the stagnation point and the maximum concentration in the neighbouring rivulet $ x_0 = 1 / b frac(15 (16 + 2 theta^2), (3 pi - 4) (60 + 5 theta^2) - 12 theta^2) . $<eq:ana_x_shift_approx_final>

#figure(image("graphics/fig6.png", width: 95.0%),
  caption: [
    Stagnation point $x_0$ as a function of inter-rivulet distance $b = d + 2$ and contact angle $theta$ for rivulets using the lubrication model. Panel (a) shows $x_0$ for constant $theta$, and panel (b) for constant $b$. The analytical approximation, eq. #link(<eq:ana_x_shift_approx_final>)[\[eq:ana\_x\_shift\_approx\_final\]], valid for small $theta$ and large $b$, uses a third-order expansion for the rivulet shape and a first-order expansion in $1 \/ b$ for the local flux. Panels (c) and (d) compare this approximation with the numerically evaluated shift obtained by solving eq. #link(<eq:ana_x_shift_final>)[\[eq:ana\_x\_shift\_final\]] numerically, without simplifying the local flux or rivulet shape.
  ]
)
<fig:rivulets_analytical>

Figure @fig:rivulets_analytical shows both the analytical approximation we just derived as well as the $x$-shift without any approximations for the local flux or rivulet shape. The latter is calculated by numerically solving eq. #link(<eq:ana_x_shift_final>)[\[eq:ana\_x\_shift\_final\]] for $x$. Comparing the analytical solutions with and without approximations for small values of $d$ we find that with approximations the $x$-shift is underestimated, but the overall shape is captured accurately. The dependence on $theta$ is nearly identical for both solutions, which is to be expected since we are using the lubrication approximation where we have already assumed that $theta$ is small.

However, when comparing the analytical solutions of $x_0$ in figure @fig:rivulets_analytical to the numerical solutions of $x_0$ in figure @fig:phase_space_rivulet, not only do we find that the analytical solutions underestimate the numerical solutions, additionally, we also find that $x_0$ depends much more strongly on $theta$. As mentioned above, the main reason for this dependency can be attributed to the evaporative flux, which should depend on the contact angle. When an analytical expression of the local flux for neighbouring rivulets with non-zero contact angles is found, it will likely be straightforward to update eq. #link(<eq:ana_x_shift_approx_final>)[\[eq:ana\_x\_shift\_approx\_final\]] following the same steps as used here.

== Droplets using the lubrication model
<sec:shift_stagnation_point_droplet>
We employ the lubrication model to investigate the shift of the stagnation point $x_0$ for droplets. Here, we use the contact angle dependent evaporation rate as calculated by \[13\]. Despite the limitations of applying the lubrication model to rivulets, it has been successfully used for droplets in previous studies under the same conditions \[43\].

Notably, although the governing equations for droplets and rivulets differ only in the coordinate system of the operators, the stagnation point $x_0$ is dependent on the Marangoni number $upright(M a)$ for droplets. Figure~@fig:phase_space_droplets presents $x_0$ in phase spaces defined by: $upright(M a)$ and $theta$ for $b = 2.01$ (a); and $b$ and $theta$ for $upright(M a) = 10^5$ (b). For sufficiently large $theta$, the distance of the stagnation point $x_0$ increases with $upright(M a)$, whereas for small contact angles it displays a slightly non-monotonic trend, first decreasing and then increasing with $upright(M a)$.

#figure(image("graphics/fig7.png", width: 100.0%),
  caption: [
    Phase spaces showing the variation of the stagnation point $x_0$ measured at the substrate as a function of: the Marangoni number ($upright(M a)$) and contact angle ($theta$) for droplets with an inter-droplet separation ($b = d + 2$) of 2.01 (a); and $theta$ and $b$ for droplets with fixed $upright(M a) = 10^5$.
  ]
)
<fig:phase_space_droplets>

In contrast to rivulets where the Marangoni flow is largely confined to the radial or vertical directions, droplets permit Marangoni flow in the azimuthal direction as well. This additional degree of freedom leads to a more intricate evolution of the stagnation point $x_0$ in droplets compared to rivulets. Figure~@fig:flow_field_droplet illustrates, for two values of $upright(M a)$, namely $10^3$ (a) and $10^6$ (b), with a contact angle of $theta = 40^compose$ and $b = 2.1$, the volumetric flow rate $upright(bold(Q))$ (top left of each subfigure), the vertically averaged mass fraction $macron(y_A)$ (bottom left), and the velocity magnitude $parallel upright(bold(u)) parallel$ as determined by the parabolic profile of the lubrication model, both at the interface (top right) and at $0.001 thin R$ above the substrate (bottom right). In the left panels, the arrows indicate the direction of the flow rate, with the colour coding distinguishing the dominance of Marangoni-driven flow (yellow) from that of pressure-driven flow (green). In the right panels, the velocity directions are indicated, revealing distinct orientations near the substrate and at the interface, as expected from the vertical recirculation in droplets.

#figure(image("graphics/fig8.png", width: 100.0%),
  caption: [
    Flow field in droplets for two different Marangoni numbers: (a) $upright(M a) = 10^3$ and (b) $upright(M a) = 10^6$, with a contact angle of $theta = 40^compose$ and an inter-droplet separation of $b = 2.1$. The top left panels show the flow rate $upright(bold(Q))$ (with arrows indicating its direction, coloured in yellow if dominated by Marangoni stresses, otherwise green), while the bottom left panels display the vertically averaged mass fraction $macron(y)_A$. The top and bottom right panels illustrate the velocity magnitude $parallel upright(bold(u)) parallel$ at the liquid-gas interface and just above the substrate, respectively, highlighting the vertical recirculation induced by the Marangoni effect. The stagnation point $x_0$, evaluated either at the interface (top) or at the substrate (bottom), is indicated by a red dot in the right panels.
  ]
)
<fig:flow_field_droplet>

Close to the neighbouring droplet, the compositional gradients are more pronounced, resulting in a stronger Marangoni effect in that region. At the droplet axis, the flow rate $upright(bold(Q))$ is directed away from the adjacent droplet, thereby generating a backflow in the azimuthal direction.

As $upright(M a)$ increases, the enhanced mixing within the liquid leads to a more uniform composition throughout the droplet. The flow rate $upright(bold(Q))$ in the backflow region becomes substantially weaker than that along the droplet's axis. Moreover, the position of the stagnation point $x_0$ exhibits a more marked change with increasing $upright(M a)$, particularly when evaluated at the substrate in comparison with its position at the interface, revealing large vertical gradients in the velocity. We attribute this shift in $x_0$ to the nonlinear evolution of the compositional gradients. However, due to the complexity of the flow field, we do not attempt to obtain a quantitative explanation for the observed behaviour of $x_0$ in droplets.

= Conclusions
<sec:conclusions>
When two neighbouring binary drops evaporate, the internal flow and internal composition become asymmetric. Consequently, existing analytical and numerical models that rely on axisymmetry can no longer be used. Moreover, solving for the three-dimensional system of equations is currently computationally infeasible at a mesh resolution required to accurately resolve the evaporation rate, compositional gradients and flow dynamics. Therefore, we first investigated neighbouring cylindrical drops, i.e. rivulets, which are two-dimensional, which allowed us to test different models. By focusing on the horizontal shift of the stagnation point in the velocity close to the substrate we were able to characterise the flow and compare the different models using this single parameter.

We started by modelling the evaporation as quasi-stationary. A critical condition for this assumption to be valid is that the transport of solute via Marangoni flow must overwhelm the transport of solute via the "coffee-stain" flow, which would otherwise lead to the accumulation of solute over time at the rim. This translated to the requirements that the Marangoni number and the contact angle must be sufficiently large. With these conditions, perfect agreement between the transient and quasi-stationary model for rivulets in figure @fig:validation_stokes was found. Moreover, the shift of the stagnation point for rivulets only depends on the inter-rivulet distance and the contact angle and is independent of the Marangoni number as shown in figure @fig:phase_space_rivulet.

Next, we used the lubrication approximation to vertically average the system of quasi-stationary equations, while accounting for the mixing of the composition due to the Marangoni flow using the Taylor-Aris dispersion \[28\]. This allowed us to analytically derive an equation for the shift of the stagnation point eq. #link(<eq:ana_x_shift_final>)[\[eq:ana\_x\_shift\_final\]], which only depends on the local flux and the drop shape and not the Marangoni number. Using a first order expansion for the local flux ($b gt.double 2$) and a third order expansion for the drop shape ($theta lt.double 1$) we obtained an explicit analytical expression for the $x$-shift, eq. #link(<eq:ana_x_shift_approx_final>)[\[eq:ana\_x\_shift\_approx\_final\]].

Comparing the quasi-stationary lubrication model (figure @fig:rivulets_analytical) to the quasi-stationary Stokes model (figure @fig:phase_space_rivulet) we find that the overall agreement of the $x$-shift is qualitatively good. However, the dependence of the $x$-shift on the contact angle is not adequately captured. While part of this discrepancy comes from the lubrication approximation, which is only valid for small contact angles, most of the difference can be attributed to the local evaporative flux, which is for zero contact angle and thus does not account for any contact angle dependence. To the best of the author's knowledge, no analytical expressions of evaporating neighbouring drops/rivulets with non-zero contact angles exist in the literature and remains a topic for future work.

Finally, we applied the lubrication model to neighbouring drops. Due to the extra degree of freedom in the azimuthal direction, the total flow rate is no longer constraint, as a result the shift stagnation point now depends strongly on the Marangoni number (figure @fig:phase_space_droplets). As the Marangoni number increases the stagnation point at the substrate and at the liquid-air interface also shift relative to each other (figure @fig:flow_field_droplet). Moreover, in contrast to rivulets, and despite using the evaporative flux for flat neighbouring drops, we also get a strong dependence on the contact angle.

We have shown that the lubrication model, which is quasi-stationary, can be used to accurately get the internal flow and internal composition of neighbouring drops/rivulets. The main limitation of this model is that "coffee stain" flow cannot be included as this breaks the quasi-stationary assumption. Currently, the lubrication model does not accurately describe the contact angle dependence since we only have access to the local flux for flat drops and rivulets. For neighbouring rivulets, the lateral shift of the stagnation point depends on the inter-drop distance, the contact angle, but not on the Marangoni number. In contrast, for neighbouring rivulets, the lateral shift does depend on the Marangoni number, owing to the extra degree of freedom in the azimuthal direction.

#heading(level: 1, numbering: none)[Funding]
<funding>
This work was supported by an Industrial Partnership Programme, High Tech Systems and Materials (HTSM), of the Netherlands Organisation for Scientific Research (NWO); a funding for public-private partnerships (PPS) of the Netherlands Enterprise Agency (RVO) and the Ministry of Economic Affairs (EZ); Canon Production Printing Netherlands B.V.; University of Twente; and Eindhoven University of Technology. (project TKI HTSM - CANON - P1 - PRINTHEAD & DROPLET FORMATION, grant no. PPS2107).

#heading(level: 1, numbering: none)[Declaration of interests]
<declaration-of-interests>
The authors report no conflict of interest.

#heading(level: 1, numbering: none)[Author contributions]
<author-contributions>
The authors P. J. Dekker and D. Rocha have contributed equally to this work and are both co-first author.

#heading(level: 1, numbering: none)[References]
<bibliography>
#block[
#block[
\[1\] F. G. Schofield, A. W. Wray, D. Pritchard, and S. K. Wilson, “The shielding effect extends the lifetimes of two-dimensional sessile droplets,” #emph[J. Eng. Math.], vol. 120, no. 1, pp. 89--110, 2020.

] <ref-schofield2020shielding>
#block[
\[2\] A. W. Wray, B. R. Duffy, and S. K. Wilson, “Competitive evaporation of multiple sessile droplets,” #emph[J. Fluid Mech.], vol. 884, p. A45, 2020.

] <ref-wray2020competitive>
#block[
\[3\] H. Masoud, P. D. Howell, and H. A. Stone, “Evaporation of multiple droplets,” #emph[J. Fluid Mech.], vol. 927, p. R4, 2021.

] <ref-masoud2021evaporation>
#block[
\[4\] K. Sefiane, “Patterns from drying drops,” #emph[Adv. Colloid Interface Sci.], vol. 206, pp. 372--381, 2014.

] <ref-sefiane2014patterns>
#block[
\[5\] D. Brutin and V. Starov, “Recent advances in droplet wetting and evaporation,” #emph[Chem. Soc. Rev.], vol. 47, no. 2, pp. 558--585, 2018.

] <ref-brutin2018recent>
#block[
\[6\] D. Zang, S. Tarafdar, Y. Y. Tarasevich, M. D. Choudhury, and T. Dutta, “Evaporation of a droplet: From physics to applications,” #emph[Phys. Rep.], vol. 804, pp. 1--56, 2019.

] <ref-zang2019evaporation>
#block[
\[7\] D. Lohse and X. Zhang, “Physicochemical hydrodynamics of droplets out of equilibrium,” #emph[Nat. Rev. Phys.], vol. 2, no. 8, pp. 426--443, 2020.

] <ref-lohse2020physicochemical>
#block[
\[8\] H. Gelderblom, C. Diddens, and A. Marin, “Evaporation-driven liquid flow in sessile droplets,” #emph[Soft Matter], vol. 18, no. 45, pp. 8535--8553, 2022.

] <ref-gelderblom2022evaporation>
#block[
\[9\] S. K. Wilson and H.-M. D'Ambrosio, “Evaporation of sessile droplets,” #emph[Annu. Rev. Fluid Mech.], vol. 55, no. 1, pp. 481--509, 2023.

] <ref-wilson2023evaporation>
#block[
\[10\] A. Yarin, J. Szczech, C. Megaridis, J. Zhang, and D. Gamota, “Lines of dense nanoparticle colloidal suspensions evaporating on a flat surface: Formation of non-uniform dried deposits,” #emph[J. Colloid Interface Sci.], vol. 294, no. 2, pp. 343--354, 2006.

] <ref-yarin2006lines>
#block[
\[11\] R. D. Deegan, O. Bakajin, T. F. Dupont, G. Huber, S. R. Nagel, and T. A. Witten, “Capillary flow as the cause of ring stains from dried liquid drops,” #emph[Nature], vol. 389, no. 6653, pp. 827--829, 1997.

] <ref-deegan1997capillary>
#block[
\[12\] R. D. Deegan, O. Bakajin, T. F. Dupont, G. Huber, S. R. Nagel, and T. A. Witten, “Contact line deposits in an evaporating drop,” #emph[Phys. Rev. E], vol. 62, no. 1, p. 756, 2000.

] <ref-deegan2000contact>
#block[
\[13\] Y. O. Popov, “Evaporative deposition patterns: Spatial dimensions of the deposit,” #emph[Phys. Rev. E], vol. 71, p. 036313, Mar. 2005, doi: #link("https://doi.org/10.1103/PhysRevE.71.036313")[10.1103/PhysRevE.71.036313].

] <ref-popov2005evaporative>
#block[
\[14\] D. Lohse, “Fundamental fluid dynamics challenges in inkjet printing,” #emph[Annu. Rev. Fluid Mech.], vol. 54, no. 1, pp. 349--382, 2022.

] <ref-lohse2022fundamental>
#block[
\[15\] L. Scriven and C. Sternling, “The marangoni effects,” #emph[Nature], vol. 187, no. 4733, pp. 186--188, 1960.

] <ref-scriven1960marangoni>
#block[
\[16\] H. Hu and R. G. Larson, “Analysis of the effects of Marangoni stresses on the microflow in an evaporating sessile droplet,” #emph[Langmuir], vol. 21, no. 9, pp. 3972--3980, 2005.

] <ref-hu2005analysis>
#block[
\[17\] C. Diddens #emph[et al.], “Evaporating pure, binary and ternary droplets: Thermal effects and axial symmetry breaking,” #emph[J. Fluid Mech.], vol. 823, pp. 470--497, 2017.

] <ref-diddens2017evaporating>
#block[
\[18\] H. Kim and H. A. Stone, “Direct measurement of selective evaporation of binary mixture droplets by dissolving materials,” #emph[J. Fluid Mech.], vol. 850, pp. 769--783, 2018.

] <ref-kim2018direct>
#block[
\[19\] A. Marin #emph[et al.], “Solutal Marangoni flow as the cause of ring stains from drying salty colloidal drops,” #emph[Phys. Rev. Fluids], vol. 4, no. 4, p. 041601, 2019.

] <ref-marin2019solutal>
#block[
\[20\] H. Hu and R. G. Larson, “Marangoni effect reverses coffee-ring depositions,” #emph[J. Phys. Chem. B], vol. 110, no. 14, pp. 7090--7094, 2006.

] <ref-hu2006marangoni>
#block[
\[21\] D. Mampallil and H. B. Eral, “A review on suppression and utilization of the coffee-ring effect,” #emph[Adv. Colloid Interface Sci.], vol. 252, pp. 38--54, 2018.

] <ref-mampallil2018review>
#block[
\[22\] V. Fabrikant, “On the potential flow through membranes,” #emph[Zeitschrift für angewandte Mathematik und Physik ZAMP], vol. 36, no. 4, pp. 616--623, 1985.

] <ref-fabrikant1985potential>
#block[
\[23\] G. Laghezza #emph[et al.], “Collective and convective effects compete in patterns of dissolving surface droplets,” #emph[Soft matter], vol. 12, no. 26, pp. 5787--5796, 2016.

] <ref-laghezza2016collective>
#block[
\[24\] D. Khilifi, W. Foudhil, K. Fahem, S. Harmand, and J. Ben, “Study of the phenomenon of the interaction between sessile drops during evaporation,” #emph[Therm. Sci.], vol. 23, no. 2 Part B, pp. 1105--1114, 2019.

] <ref-khilifi2019study>
#block[
\[25\] S. Hatte, K. Pandey, K. Pandey, S. Chakraborty, and S. Basu, “Universal evaporation dynamics of ordered arrays of sessile droplets,” #emph[J. Fluid Mech.], vol. 866, pp. 61--81, 2019.

] <ref-hatte2019universal>
#block[
\[26\] K. L. Chong, Y. Li, C. S. Ng, R. Verzicco, and D. Lohse, “Convection-dominated dissolution for single and multiple immersed sessile droplets,” #emph[J. Fluid Mech.], vol. 892, p. A21, 2020.

] <ref-chong2020convection>
#block[
\[27\] N. J. Cira, A. Benusiglio, and M. Prakash, “Vapour-mediated sensing and motility in two-component droplets,” #emph[Nature], vol. 519, no. 7544, pp. 446--450, 2015.

] <ref-cira2015vapour>
#block[
\[28\] S. Karpitschka, F. Liebig, and H. Riegler, “Marangoni contraction of evaporating sessile droplets of binary mixtures,” #emph[Langmuir], vol. 33, no. 19, pp. 4682--4687, 2017.

] <ref-karpitschka2017marangoni>
#block[
\[29\] P. J. Dekker, M. N. van der Linden, and D. Lohse, “Pinning induced motion and internal flow in neighbouring evaporating multi-component drops,” #emph[arXiv preprint arXiv:2412.08495], 2024.

] <ref-dekker2024pinning>
#block[
\[30\] C. Diddens, P. J. Dekker, and D. Lohse, “Non-monotonic surface tension leads to spontaneous symmetry breaking in a binary evaporating drop,” #emph[arXiv preprint arXiv:2402.17452], 2024.

] <ref-diddens2024non>
#block[
\[31\] D. Rocha, D. Lohse, and C. Diddens, “Marangoni flow driven hysteresis and azimuthal symmetry breaking in evaporating binary droplets,” #emph[arXiv preprint arXiv:2412.17096], 2024.

] <ref-rocha2024marangoni>
#block[
\[32\] C. Diddens, Y. Li, and D. Lohse, “Competing Marangoni and Rayleigh convection in evaporating binary droplets,” #emph[J. Fluid Mech.], vol. 914, p. A23, 2021.

] <ref-diddens2021competing>
#block[
\[33\] R. Picknett and R. Bexon, “The evaporation of sessile or pendant drops in still air,” #emph[J. Colloid Interface Sci.], vol. 61, no. 2, pp. 336--350, 1977.

] <ref-picknett1977evaporation>
#block[
\[34\] I. N. Sneddon, #emph[Mixed boundary value problems in potential theory]. North-Holland, Amsterdam, 1966.

] <ref-sneddon1966mixed>
#block[
\[35\] H. Masoud and J. D. Felske, “Analytical solution for Stokes flow inside an evaporating sessile drop: Spherical and cylindrical cap shapes,” #emph[Phys. Fluids], vol. 21, no. 4, 2009.

] <ref-masoud2009analytical>
#block[
\[36\] C. Diddens and D. Rocha, “Bifurcation tracking on moving meshes and with consideration of azimuthal symmetry breaking instabilities,” #emph[J. Comput. Phys.], vol. 518, p. 113306, 2024.

] <ref-diddens2024bifurcation>
#block[
\[37\] M. Heil and A. L. Hazel, “oomph-lib--An Object-Oriented Multi-Physics Finite-Element Library,” in #emph[Fluid-structure interaction: Modelling, simulation, optimisation], Springer, 2006, pp. 19--49.

] <ref-heil2006oomph>
#block[
\[38\] C. Bauer, A. Frink, and R. Kreckel, “Introduction to the GiNaC Framework for Symbolic Computation within the C++ Programming Language,” #emph[J. Symb. Comput.], vol. 33, no. 1, pp. 1--12, 2002, doi: #link("https://doi.org/10.1006/jsco.2001.0494").

] <ref-bauer2002introduction>
#block[
\[39\] D. Constantinescu and J. Gmehling, “Further development of modified UNIFAC (Dortmund): Revision and extension 6,” #emph[J. Chem. Eng. Data], vol. 61, no. 8, pp. 2738--2748, 2016.

] <ref-constantinescu2016further>
#block[
\[40\] J. Eggers and L. M. Pismen, “Nonlocal description of evaporating drops,” #emph[Phys. Fluids], vol. 22, no. 11, 2010.

] <ref-eggers2010nonlocal>
#block[
\[41\] C. Diddens, J. G. Kuerten, C. Van der Geld, and H. Wijshoff, “Modeling the evaporation of sessile multi-component droplets,” #emph[J. Colloid Interface Sci.], vol. 487, pp. 426--436, 2017.

] <ref-diddens2017modeling>
#block[
\[42\] A. A. Pahlavan, L. Yang, C. D. Bain, and H. A. Stone, “Evaporation of binary-mixture liquid droplets: The formation of picoliter pancakelike shapes,” #emph[Phys. Rev. Lett.], vol. 127, no. 2, p. 024501, 2021.

] <ref-pahlavan2021evaporation>
#block[
\[43\] O. Ramírez-Soto and S. Karpitschka, “Taylor dispersion in thin liquid films of volatile mixtures: A quantitative model for Marangoni contraction,” #emph[Phys. Rev. Fluids], vol. 7, no. 2, p. L022001, Feb. 2022, doi: #link("https://doi.org/10.1103/PhysRevFluids.7.L022001")[10.1103/PhysRevFluids.7.L022001].

] <ref-ramirez-soto_taylor_2022>
#block[
\[44\] Á. G. Marı́n, H. Gelderblom, D. Lohse, and J. H. Snoeijer, “Order-to-disorder transition in ring-shaped colloidal stains,” #emph[Phys. Rev. Lett.], vol. 107, p. 085502, Aug. 2011, doi: #link("https://doi.org/10.1103/PhysRevLett.107.085502")[10.1103/PhysRevLett.107.085502].

] <ref-marin2011>
] <refs>
