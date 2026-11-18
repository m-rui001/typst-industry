#import "riblet-geometry.typ": channel-figure

#set page(paper: "a4", margin: (left: 25.4mm, right: 24.6mm, top: 17mm, bottom: 30mm))
#set text(font: "Libertinus Serif", size: 10pt)
#set par(justify: true, leading: .48em, first-line-indent: 5mm)
#set math.equation(numbering: "(1)")
#set figure.caption(separator: [: ])
#show figure.caption: set text(size: 9pt)
#set document(title: "Application of riblets to separating turbulent boundary layers")

#v(16pt)
#align(center)[
  #text(size: 17pt, weight: "bold", smallcaps[Application of riblets to separating turbulent boundary layers])

  #text(size: 13pt, weight: "bold", style: "italic")[
    A. Rouhi#super[1], V. Kumar#super[2], O. Lehmkuhl#super[2], W. Wu#super[3], M. Kozul#super[4] and A. J. Smits#super[5]
  ]

  #text(size: 11pt, style: "italic")[
    #super[1] Department of Engineering, Nottingham Trent University, Nottingham, UK \
    #super[2] CASE, Barcelona Supercomputing Center (BSC), Barcelona, Spain \
    #super[3] Department of Mechanical Engineering, University of Mississippi, Oxford, USA \
    #super[4] Department of Mechanical Engineering, University of Melbourne, Melbourne, Australia \
    #super[5] Department of Mechanical and Aerospace Engineering, Princeton University, Princeton, USA \
    #link("mailto:amirreza.rouhi@ntu.ac.uk")
  ]
]

#v(14pt)
#show: body => columns(2, gutter: 8mm, body)

#set heading(numbering: (..nums) => if nums.pos().len() == 1 { numbering("1", ..nums) })
#heading(numbering: none)[Abstract]

We conduct direct numerical simulations of separating turbulent boundary layers (TBLs) over triangular riblets with tip angles $90^o$ (T9) and $60^o$ (T6). Our setup follows the separating TBL study of Wu et al.~(#emph[J. Fluid Mech.], vol.~883, 2020, p.~A45). An equilibrium zero pressure-gradient (ZPG) TBL is generated at a reference location, followed by imposition of a Gaussian suction profile to create a separation bubble. The ZPG TBLs over the riblets and the benchmark smooth case have matched momentum thickness Reynolds number $R e_(theta_0) = 583$ (friction Reynolds number 224). We employ a well-validated spectral-element solver, and leverage its unstructured-grid nature to generate an optimal grid, based on the size of turbulent scales across the TBL. At the reference location, the T9 and T6 riblets respectively increase and reduce drag, with viscous-scaled spacings $52$ and $13$. We discover that for both riblet cases, the mean separation location occurs at a distance of $140 theta_0$ downstream of the reference location, $18 %$ shorter than the mean separation distance for the smooth case ($170 theta_0$). This outcome is related to the progressive enhancement of the Kelvin-Helmholtz (KH) rollers over the riblets, owing to the continuous rise in the adverse pressure-gradient. The KH rollers penetrate into the turbulent separation bubble, with significantly larger size and coherence compared to their counterparts upstream of the mean separation location.

= Introduction

Thanks to the great advancements by the turbulence community, riblets are known to reduce turbulent skin-friction drag, and the underlying physics are unraveled to a great detail (Garcia-Mayoral et al.~2019). These advancements mainly focus on equilibrium turbulent flows. Most computations focus on turbulent channel flows (Choi et al.~1993, Garcia-Mayoral & Jiménez 2011, Endrikat et al.~2021), and most experiments focus on zero pressure-gradient (ZPG) turbulent boundary layers (TBLs) (Walsh & Weinstein 1979, Choi 1989). However, the response of riblets to non-equilibrium flows is investigated to a less extent. In the present study, we focus on TBL separation under a strong Adverse Pressure-Gradient (APG), as a prominent non-equilibrium flow in the Aerospace industry--diffusers, wing trailing edge, and low-pressure turbines to name a few.

Several studies have investigated the response of riblets under APG TBL (Nieuwstadt et al.~1993, Debisschop & Nieuwstad 1996, Klumpp et al.~2010, Boomsma & Sotiropoulos 2015). The consensus is that riblets yield a higher drag-reduction under APG than ZPG, and drag-reduction increases by increasing APG. However, these investigations consider attached TBL under mild APG. Quantitatively, they consider Clauser pressure-gradient parameter $beta lt.tilde 2.2$, where $beta equiv \( delta^(*) \/ tau_w \) \( d P \/ d x \)_e$, and $delta^(*) \, tau_w$ and $\( d P \/ d x \)_e$ are respectively the displacement thickness, mean wall shear-stress and mean pressure-gradient at the edge of the TBL. Among the above-mentioned studies, Debisschop & Nieuwstad (1996) applied the highest $beta = 2.2$, and achieved the highest drag-reduction of $13 %$ over riblets.

In a recent Direct Numerical Simulation (DNS) study, Savino et al.~(2025) applied strong APG TBL over sinusoidal riblets. The APG TBL was attached over the benchmark smooth wall, with $0 lt.eq beta lt.eq 10$. The authors reported drag reduction up to $100 %$ by riblets. Interestingly, the wide-spacing riblets that increase drag under ZPG, yielded higher drag reduction than the narrow-spacing riblets that reduce drag under ZPG. The authors discovered that the riblet-generated Kelvin-Helmholtz (KH) rollers are augmented under APG, in terms of size and frequency; the KH rollers create larger patches of flow reversal, hence reducing $tau_w$. Here, we extend the study of Savino et al.~(2025) to separating TBL. We impose a very strong APG to create massive TBL separation over the riblets, as well as the benchmark smooth wall. We aim to study the role of riblets in modifying the separation point, and the underlying physics.

= Methodology

== Governing equations and solution method

We solve the incompressible conservation of mass and momentum equations with constant density $rho$ and kinematic viscosity $nu$: #math.equation(block: true, numbering: _ => [(1#emph[a,b])], $
  nabla dot bold(u) &= 0, \
  frac(partial bold(u), partial t) + nabla dot bold(u u) &= -1/rho nabla p + nu nabla^2 bold(u).
$) <eq:cont_mom> In our notation, $upright(bold(u)) = \( u \, v \, w \)$ is the velocity vector, and $x \, y \, z$ are the streamwise, wall-normal and spanwise directions, respectively. Equations (1#emph[a,b]) are solved using a well-validated computational solver (SOD2D) developed by Barcelona Supercomputing Center. Spatial discretization is a spectral formulation of the Continuous Galerkin Finite Elements model coupled with a modified version of Guermond's Entropy Viscosity stabilization model (Guermond et al.~2011). Time is advanced using the 2nd-order Adams-Bashforth scheme for the convection terms, and the 2nd-order Crank-Nicolson for the diffusion terms. @eq:cont_mom are marched using fractional-step algorithm.

#figure(channel-figure,
  caption: [
    Channel flow setup at $R e_tau = 400$ over (#emph[a,c]) T950, and (#emph[b,d]) T615 riblets (from @tab:channel). (#emph[a,b]) visualize the instantaneous streamwise velocity $u$ near the riblet crest and on the side boundaries. (#emph[c,d]) visualize the instantaneous $hat(C)_f$ over the streamwise ($x$) and azimuthal ($xi$) coordinates. Contours of $hat(C)_f = 0$ are highlighted in green.
  ]
)
<fig:fig1>

== Riblet geometries

We focus on two isosceles triangular riblet geometries (@fig:fig1), termed T950 and T615, following the naming convention by Endrikat et al.~(2021). Riblet T950 has tip angle $alpha = 90 upright("°")$ and viscous-scaled spacing $s^(+) = 50$, and T615 has $alpha = 60 upright("°")$ and $s^(+) = 14.7$. In a turbulent channel flow at friction Reynolds number $R e_tau = 400$, T950 and T615 respectively increase and reduce drag. We assess the accuracy of SOD2D and its grid resolution requirements for these riblet geometries by replicating the DNSs of Endrikat et al.~(2021) in a turbulent half-channel flow (@fig:fig1). For each riblet geometry we consider two grid resolutions (noted as "coarse" and "fine"), with details provided in @tab:channel. We generate a uniform grid in the streamwise direction, while the wall-normal grid size follows a hyperbolic tangent distribution from $Delta_y^(+) tilde.eq 0.2 - 0.7$ at the bottom wall to $Delta_y^(+) tilde.eq 5.0 - 8.0$ at the top boundary. We apply a uniform azimuthal grid size $Delta_xi^(+) tilde.eq 0.4 - 1.0$ over the riblets, and we gradually expand it to the spanwise grid size $Delta_z^(+) tilde.eq 4.0 - 12.0$ at the top boundary. We further discuss our grid-generation approach when we present our separating TBL setup (@fig:fig4).

#figure(image("source/fig1.png", width: 80.0%),
  caption: [
    Mean velocity profiles for the cases from @tab:channel compared with the reference data of Endrikat et al. (2021). The shaded region ($y^(+) > 100$) is discarded, as the reference profiles are from a reduced-domain channel flow simulation.
  ]
)
<fig:fig2>

#figure(
  align(center)[#table(
    columns: 5,
    align: (center,center,center,center,center,),
    table.header([Case], [$Delta_x^(+)$], [$Delta_xi^(+)$], [$Delta_z^(+)$], [$Delta_y^(+)$],),
    table.hline(),
    [T950\_coarse], [$20.0$], [$1.0$], [$0.7 - 4.0$], [$0.7 - 8.1$],
    [T950\_fine], [$10.0$], [$1.0$], [$0.7 - 4.0$], [$0.7 - 8.1$],
    [T615\_coarse], [$10.0$], [$0.6$], [$0.3 - 12.0$], [$0.25 - 7.87$],
    [T615\_fine], [$7.0$], [$0.4$], [$0.2 - 8.2$], [$0.17 - 5.13$],
  )]
  , caption: [Grid resolution details for DNSs of turbulent half-channel flow over T950 and T615 riblets; $Delta_xi^(+)$ is the viscous-scaled azimuthal grid size over the riblets.]
  , kind: table
  ) <tab:channel>
@fig:fig2 shows very good agreement in the mean velocity profiles between our setups from @tab:channel and the reference DNSs of Endrikat et al.~(2021). Furthermore, the velocity profiles from the coarse and fine cases are almost identical. This indicates the accuracy of SOD2D, even with $Delta_x^(+) = 20$.

A notable difference between T950 and T615 is in the prominence of the KH rollers. In Figures~@fig:fig1\(#emph[c,d]), we identify the KH rollers by plotting local skin-friction coefficient $hat(C)_f equiv 2 hat(tau)_w \/ \( rho U_b^2 \)$ over the streamwise ($x$) and azimuthal ($xi$) coordinates, where $hat(tau)_w = "sign" \( partial u \/ partial y \) sqrt(\( partial u \/ partial y \)^2 + \( partial u \/ partial z \)^2)$. Negative patches of $hat(C)_f$ (marked by green iso-lines) highlight the local flow reversals by the KH rollers. For T615, patches of $hat(C)_f < 0$ occupy $7.2 %$ of the wetted area, whereas for T950 they occupy $1.8 %$. The formation of the KH rollers has a strong influence on the separating TBL, as discussed in the results section.

== Separating boundary layer setup

<sec:sbl>

#figure(image("source/fig2.png", width: 100%),
  caption: [
    (#emph[a]) Flow setup and visualization for the T9 case. The $x z$-plane visualization is near the riblets crest with the patches of flow reversal $\( u < 0 \)$ enveloped with green isoline. (#emph[b]) Mean velocity profiles at $x = 0$ for the smooth case and the T9 case compared with the reference profiles of Schlatter & Örlü (2010) (Ref.~ZPG) and Wu et al.~(2020) (Ref.~SBL).
  ]
)
<fig:fig3>

@fig:fig3\(#emph[a]) illustrates our setup for the separating TBL over the triangular riblets with $alpha = 90 upright("°")$ (called T9 case). We build a similar setup for the separating TBL over the smooth wall and over the triangular riblets with $alpha = 60 upright("°")$ (called T6 case), with identical domain dimensions and suction profiles. Our setup follows the DNS of separating TBL over a smooth wall by Wu et al.~(2020). A ZPG TBL is generated at a reference location ($x = 0$); at downstream the TBL is separated by applying a suction profile at the top boundary, as formulated by Wu et al.~(2020) $ V_(upright(t o p)) = V_(upright(m a x)) exp [- (frac(x - x_(upright(s u c)), alpha L_y))^2] $<eq:suction> where $V_(upright(m a x)) = 0.9 U_(oo_0) \, x_(upright(s u c)) = 171.1 theta_0 \, alpha = 0.3375 \, L_y = 99.6 theta_0$, and $U_(oo_0)$ and $theta_0$ are respectively the free-stream velocity and momentum thickness at $x = 0$. The suction profile (@eq:suction) triggers a strong APG, similar to the one over the suction surface of a typical airfoil near stall. To generate the ZPG TBL, we apply a laminar boundary layer at the inflow with displacement thickness Reynolds number $R e_(delta^(*)) = 775$, that is tripped by a parametric forcing. For the smooth case, the laminar inflow is the Blasius profile. For the riblet cases, we obtain the laminar inflow from a precursor temporal boundary layer simulation up to the target $R e_(delta^(*)) = 775$. The smooth and riblet cases respond differently to the tripping, i.e.~the resulting ZPG TBL reaches a target $R e_theta$ at different distances downstream. For each case, we ensure that we place $x = 0$ where $R e_(theta_0) = 585$ ($R e_(tau_0) tilde.eq 224$), hence all our smooth and riblet cases have identical $U_(oo_0) = 1.0 \, nu = 1 \/ 775 \, theta_0 = 0.755$, with identical suction profile and location. At $x = 0$, the T9 case has $s_0^(+) = 52.2$, and the T6 case has $s_0^(+) = 12.7$\; these riblet spacings are close to the ones for T950 and T615 (@fig:fig1), that we extensively studied their grid resolution requirements (@fig:fig2). @fig:fig3\(#emph[b]) shows the ZPG TBL profiles at $x = 0$ for the smooth case and the T9 case. The smooth case profile is close to the reference profiles of Schlatter & Örlü (2010) and Wu et al.~(2020); some slight differences exist in the wake region. These are related to the differences in the inflow generation techniques and $R e_theta$. Nevertheless, we show that such differences have marginal influence on the separating TBL (@fig:fig5). We apply periodic boundary condition in the spanwise ($z$-) direction, zero-vorticity condition on the top boundary, and convective boundary condition at the outlet. For all cases, the effective domain length from $x = 0$ is $L_(x_(upright(e f f))) gt.tilde 991 theta_0$, which is larger than the one by Wu et al.~(2020) ($L_(x_(upright(e f f))) tilde.eq 964 theta_0$). Our domain width is $L_z tilde.eq 117 theta_0$, which is the same as the one by Wu et al.~(2020).

#figure(image("source/fig3.png", width: 100%),
  caption: [
    Quadratic elements on a $y z$-plane for the T9 case.
  ]
)
<fig:fig4>

#figure(
  align(center)[#table(
    columns: 5,
    align: (center,center,center,center,center,),
    table.header([Case], [$Delta_x^(+)$], [$Delta_xi^(+)$], [$Delta_z^(+)$], [$Delta_y^(+)$],),
    table.hline(),
    [Smooth], [$30.0$], [$-$], [$5.0 - 41.0$], [$0.25 - 40.0$],
    [Smooth], [$20.0$], [$-$], [$5.0 - 41.0$], [$0.25 - 40.0$],
    [Smooth], [$10.0$], [$-$], [$5.0 - 41.0$], [$0.25 - 40.0$],
    [T9], [$30.0$], [$1.0$], [$0.7 - 40.5$], [$0.7 - 39.3$],
    [T9], [$20.0$], [$1.0$], [$0.7 - 40.5$], [$0.7 - 39.3$],
    [T6], [$30.0$], [$0.6$], [$0.3 - 40.5$], [$0.5 - 40.5$],
  )]
  , caption: [Simulation cases for the separating TBL over smooth wall, as well as T9 and T6 riblets.]
  , kind: table
  ) <tab:sbl>
We leveraged the unstructured-grid nature of SOD2D and put a considerable effort to generate an optimal grid (@fig:fig4). Our aim was to minimize the computational cost, yet achieve accurate results. The grid size distribution is inspired by the study of Chen & He (2023). We apply a uniform grid in the streamwise direction, but we increase the grid sizes in the $y z$-plane from the bottom wall to the top boundary. We apply $Delta_z^(+) lt.eq 3.0$ up to the beginning of the logarithmic region of the ZPG TBL at $x = 0$ $\( y^(+) tilde.eq 3 sqrt(delta_0^(+)) \)$ to well resolve the near-wall cycle of turbulence in the buffer region. Then we increase $Delta_z^(+)$ to $10.0$ at the boundary layer thickness $\( y^(+) = delta_0^(+) \)$, and further increase $Delta_z^(+)$ to $40.0$ by the top boundary. The wall-normal grid size follows a hyperbolic-tangent distribution from the bottom wall $\( Delta_y^(+) lt.eq 0.7 \)$ to $y^(+) = delta_0^(+) \( Delta_y^(+) tilde.eq 8.0 \)$. Then it further increases to $Delta_y^(+) tilde.eq 40.0$ at $y^(+) = 8 delta_0^(+)$. We refine $Delta_y^(+)$ near the top boundary to avoid numerical instabilities due to the zero-vorticity condition. We generated this grid for all our separating TBL cases, with some differences for $y^(+) lt.eq 3 sqrt(delta_0^(+))$ (@tab:sbl).

#figure(image("source/fig4.png", width: 100%),
  caption: [
    Comparison of separating TBL over smooth wall between our cases (@tab:sbl) and the reference study of Wu et al.~(2020). (#emph[b]) Streamwise variation of $C_f$, and (#emph[c]) mean velocity profiles at $x \/ theta_0 = 100 \, 300 \, 500 \, 700$ as indicated in (#emph[a]) with vertical dashed lines.
  ]
)
<fig:fig5>

We extensively validated our separating TBL setup by replicating the DNS of separating TBL over a smooth wall by Wu et al.~(2020) (@fig:fig5), with comparable $R e_(theta_0)$ (@fig:fig3#emph[b]), as well as matched suction profiles and location. We employed a $y z$-grid distribution as in @fig:fig4, and conducted three cases with $Delta_x^(+) = 30 \, 20$ and $10$. Figures~@fig:fig5\(#emph[b,c]) show little difference between these three cases, which are in good agreement with the data of Wu et al.~(2020). We further refined the $y z$-grid and observed little difference in $C_f$, as well as profiles of the mean velocity $U$ and turbulent kinetic energy (TKE). We also extended the effective domain length from $L_(x_(upright(e f f))) tilde.eq 991 theta_0$ to $1390 theta_0$ and observed no difference in $C_f \, U$ and TKE. We also refined $Delta_x^(+)$ from $30$ to $20$ for the T9 case, and obtained small change in $C_f$ and $U$, and only $1.5 %$ change in the mean separation location.

#figure(image("source/fig5.png", width: 100%),
  caption: [
    Streamwise variations of (#emph[a]) $C_f$, and (#emph[b]) wall pressure-coefficient $C_p$ and Clauser pressure-gradient parameter $beta$. In (#emph[a]), the inset plots the percentage reduction in $C_f$ over the riblet cases compared to the smooth case. (#emph[c]) Mean velocity profiles at $x \/ theta_0 = 40 \, 80$ and $120$, as indicated in (#emph[a]) with vertical dotted lines.
  ]
)
<fig:fig6>

= Results

Variations of $C_f$ indicate that both T9 and T6 cases hasten the mean separation location compared to the smooth case (@fig:fig6#emph[a]). Interestingly, the evolution of $C_f$ from $x = 0$ to $x tilde.eq 110 theta_0$ differs significantly between T9 and T6. However, the $C_f$ of the two riblet cases approach together from $x tilde.eq 110 theta_0$ up to the mean separation location at $x tilde.eq 140 theta_0$\; this separation distance is $18 %$ shorter than the one for the smooth case $\( x tilde.eq 170 theta_0 \)$. For T9, $C_f$ is higher than the smooth $C_f$ at $x = 0$, where there is a ZPG TBL. However, further downstream, the TBL is exposed to an APG, and the T9 $C_f$ drops below the smooth $C_f$, hence the T9 riblet reduces drag $\( Delta_(C_f) < 0 \)$ when is exposed to an APG (@fig:fig6#emph[a], inset). The higher the APG, the higher the drag reduction, in accordance with previous works in the literature. The Clauser pressure-gradient parameter grows $prop x^2.5$ from $beta = 0.26$ at $x = 40 theta_0$ to $beta = 2.73$ at $x = 100 theta_0$ (@fig:fig6#emph[b], inset); within this distance, $Delta_(C_f)$ for T9 decreases from $+ 2.6 %$ to $- 20.5 %$.

#figure(image("source/fig6.png", width: 100%),
  caption: [
    Visualizations of the local $hat(C)_f$ for (#emph[b]) smooth case, (#emph[c]) T9 riblets and (#emph[d]) T6 riblets; isolines of $hat(C)_f = 0$ are highlighted in green. (#emph[a]) Streamwise variations of $C_f$, same as @fig:fig6\(#emph[a]). In all panels, the mean separation location is highlighted with a vertical dashed line.
  ]
)
<fig:fig7>

The drag-reducing response of T9 under APG is also evident from the mean velocity profiles (@fig:fig6#emph[c]). At $x = 0$ ($Delta_(C_f) = + 5.6 %$), the $U^(+)$ profile of T9 is below the smooth case. However, at $x = 120 theta_0$ ($Delta_(C_f) = - 47.9 %$), the $U^(+)$ profile of T9 falls above the smooth case for $y^(+) gt.tilde 10$. For the drag-reducing T6, $Delta_(C_f)$ becomes more negative from $x = 0$ by increasing APG, similar to T9 (@fig:fig6#emph[a], inset). However, the rate of drop in $Delta_(C_f)$ for $0 lt.eq x lt.eq 120 theta_0$ is milder for T6 than T9, despite being exposed to almost equal $beta$ (@fig:fig6#emph[b], inset). From $x tilde.eq 120 theta_0$ up to the mean separation location, $Delta_(C_f)$ from the two riblet cases are close to each other.

The streamwise variations of $C_f$ over riblets up to the mean separation location is consistent with the study of Savino et al.~(2025). They apply APG to an attached TBL over sinusoidal riblets with $k \/ s tilde.eq 0.95$. They consider combinations of two $beta$ profiles ($0 lt.eq beta lt.tilde 5$ and $0 lt.eq beta lt.tilde 10$), and three riblet spacings ($s_0^(+) = 16 \, 26 \, 60$). Their range of $beta$ is comparable with ours for $0 lt.eq x lt.tilde 100 theta_0$, and their lowest $s_0^(+)$ is comparable with our T6 case with $k \/ s tilde.eq 0.87$ and $s_0^(+) tilde.eq 13$. For all cases, they discover that riblets under APG reduce drag as high as $100 %$. Drag reduction is higher for the riblets with larger $s_0^(+)$ that increase drag under ZPG.

Savino et al.~(2025) associate the significant drag-reducing response of riblets under APG to the enhancement of the KH rollers. We conjecture that hastening the mean separation location by riblets is also related to the KH rollers. We support this conjecture by visualizing the instantaneous local $hat(C)_f$ for the smooth case (@fig:fig7#emph[b]), compared with T9 (@fig:fig7#emph[c]) and T6 riblets (@fig:fig7#emph[d]). Similar to @fig:fig1, we plot $hat(C)_f$ over the azimuthal $xi$ and streamwise $x$ directions, to better identify the KH rollers. For $0 lt.eq x lt.tilde 50 theta_0$, under mild $0 lt.eq beta lt.tilde 0.5$, we observe sparse patches of $hat(C)_f < 0$ over T9 and T6 riblets, indicating some weak KH rollers with little coherence and large streamwise spacing. However, comparatively, the KH rollers are more coherent over the T6 riblets, consistent with @fig:fig1. From $x tilde.eq 50 theta_0$ ($beta tilde.eq 0.5$) up to the mean separation location ($beta tilde.eq 10$), the patches of $hat(C)_f < 0$ (hence KH rollers) become larger and more coherent, with reduced spacing; this behavior is more prominent for the T6 riblets. By the mean separation location, we observe large KH rollers that are elongated over the entire domain width. These large rollers penetrate into the turbulent separation bubble.

It is well established that KH rollers are among the prominent mechanisms for drag-increasing behavior of riblets (Garcia-Mayoral & Jiménez 2011, Endrikat et al.~2021). However, these findings consider turbulent channel flow, where KH rollers have structural differences compared to those under APG TBL. We also observe such differences between our channel flow (@fig:fig1) and separating TBL cases (@fig:fig7). In a turbulent channel flow, KH rollers (hence patches of $hat(C)_f < 0$) have a spacing $lambda_x^(+) tilde.eq 200 - 400$ (Rowin et al.~2025). Patches of $hat(C)_f < 0$ are accompanied by high-shear (high $hat(C)_f$) regions between them. On average, high $hat(C)_f$ regions overbalance $hat(C)_f < 0$ regions, leading to $Delta_(C_f) > 0$. Under APG, however, the spacing between patches of $hat(C)_f < 0$ is significantly reduced, leading to $Delta_(C_f) < 0$.

= Conclusions

We investigated the effects of riblets on the structure of TBL separation. We followed the setup of Wu et al.~(2020), and generated a ZPG TBL with $R e_(theta_0) = 583$ at a reference location, followed by its separation through imposition of a suction profile. We focused on two riblet geometries: 1) a triangular riblet with tip angle $90 upright("°")$, that at the reference location has $s_0^(+) = 52$ and increases drag, and 2) a triangular riblet with tip angle $60 upright("°")$, that at the reference location has $s_0^(+) = 13$ and reduces drag. We leveraged the unstructured-grid nature of our spectral-element solver, and generated an optimal grid that well resolves the riblet surface and grows in size away from the wall, consistent with the physics of TBL. We extensively validated our computational setup by replicating the DNSs of turbulent channel flow over riblets (Endrikat et al.~2021) and the separating TBL (Wu et al.~2020). Both riblet geometries shorten the mean separation distance from the reference point, $140 theta_0$ compared to $170 theta_0$ for the benchmark smooth case. Consistent with the observations of Savino et al.~(2025), as APG increases from the reference location, both riblet geometries significantly reduce drag compared to the smooth case. Such behavior of riblets, as well as their hastening of the mean separation location is related to the enhancement of the riblet-generated KH rollers under APG. As APG increases, the KH rollers become larger with shorter streamwise spacing. By the mean separation location, we observe large coherent rollers that are elongated over the entire domain width, and travel through the turbulent separation bubble.

#heading(numbering: none)[Acknowledgments]

AR acknowledges the support from the Air Force Office of Scientific Research (AFOSR) under award number FA8655-24-1-7008, monitored by Dr.~Douglas Smith and Dr.~Barrett Flake. VK acknowledges his AI4S fellowship within the Generación D initiative by Red.es, Ministerio para la Transformación Digital y de la Función Pública, for talent attraction (C005/24-ED CV1), funded by NextGenerationEU through PRTR. WW acknowledges the support from the AFOSR Grant No.~FA9550-25-1-0033, monitored by Dr.~Gregg Abate. We thank EPSRC for the computational time made available on ARCHER2 via the UK Turbulence Consortium (EP/R029326/1), and the UKRI access to the HPC call 2024.

#heading(numbering: none)[References]

#block[
#block[

Boomsma, A. and Sotiropoulos, F. (2015). Riblet drag reduction in mild adverse pressure gradients: A numerical investigation. #emph[Int. J. Heat Fluid Flow], Vol. 56, pp. 251-260.

Chen, C. and He, L. (2023). Two-scale solution for tripped turbulent boundary layer. #emph[J. Fluid Mech.], Vol. 955, pp. A5.

Choi, K.S. (1989). Near-wall structure of a turbulent boundary layer with riblets. #emph[J. Fluid Mech.], Vol. 208, pp. 417-458.

Choi, H., Moin, P. and Kim, J. (1993). Direct numerical simulation of turbulent flow over riblets. #emph[J. Fluid Mech.], Vol. 255, pp. 503-539.

Debisschop, J.R. and Nieuwstadt, F.T.M. (1996). Turbulent boundary layer in an adverse pressure gradient-effectiveness of riblets. #emph[AIAA J], Vol. 34, pp. 932-937.

Endrikat, S., Modesti, D., Garcia-Mayoral, R., Hutchins, N. and Chung, D. (2021). Influence of riblet shapes on the occurrence of Kelvin--Helmholtz rollers. #emph[J. Fluid Mech.], Vol. 913, pp. A37.

Garcia-Mayoral, R. and Jiménez, J. (2011). Hydrodynamic stability and breakdown of the viscous regime over riblets. #emph[J. Fluid Mech.], Vol. 678, pp. 317-347.

Garcia-Mayoral, R., Gómez-de-Segura, G. and Fairhall, C.T. (2019). The control of near-wall turbulence through surface texturing. Fluid Dyn. Res., Vol. 51, pp. 011410.

Guermond, J.L., Pasquetti, R. and Popov, B. (2011). Entropy viscosity method for nonlinear conservation laws. #emph[J. Comput. Phys.], Vol. 230, pp. 4248-4267.

Klumpp, S., Guldner, T., Meinke, M. and Schr oder, W. (2010), Riblets in a turbulent adverse-pressure gradient boundary layer. #emph[In 5th Flow Control Conference] pp. 4706.

Nieuwstadt, F.T.M., Wolthers, W., Leijdens, H., Krishna Prasad, K. and Schwarz-van Manen, A. (1993). The reduction of skin friction by riblets under the influence of an adverse pressure gradient. #emph[Exp. Fluids], Vol. 15, pp. 17-26.

Rowin, W.A., Deshpande, R., Wang, S., Kozul, M., Chung, D., Sandberg, R.D. and Hutchins, N. (2025). Experimental characterisation of Kelvin--Helmholtz rollers over riblet surfaces. #emph[J. Fluid Mech.], Vol. 1009, pp. A65.

Savino, B.S., Rouhi, A. and Wu, W. (2025). Attached Decelerating Turbulent Boundary Layers over Riblets. #emph[arXiv preprint arXiv:2505.16962.]

Schlatter, P. and Örlü, R. (2010). Assessment of direct numerical simulation data of turbulent boundary layers, #emph[J. Fluid Mech.], Vol. 659, pp. 116-126.

Walsh, M.J. and Weinstein, L.M. (1979). Drag and heat-transfer characteristics of small longitudinally ribbed surfaces. #emph[AIAA J], Vol. 17, pp. 770-771.

Wu, W., Meneveau, C. and Mittal, R. (2020). Spatio-temporal dynamics of turbulent separation bubbles, #emph[J. Fluid Mech.], Vol. 883, pp. A45.

]
]
