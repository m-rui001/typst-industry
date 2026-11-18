#import "recovery-plot.typ": recovery-figure

#set page(paper: "a4", margin: (left: 25.4mm, right: 24.6mm, top: 17mm, bottom: 30mm))
#set text(font: "Libertinus Serif", size: 10pt)
#set par(justify: true, leading: .48em, first-line-indent: 5mm)
#set math.equation(numbering: "(1)")
#set figure.caption(separator: [: ])
#show figure.caption: set text(size: 9pt)
#set document(title: "Simulations of zero pressure-gradient turbulent boundary layers over riblets")

#v(16pt)
#align(center)[
  #text(size: 17pt, weight: "bold", smallcaps[Simulations of zero pressure-gradient turbulent boundary layers over riblets])

  #text(size: 13pt, weight: "bold", style: "italic")[
    V. Kumar#super[1], A. Rouhi#super[2], O. Lehmkuhl#super[1], W. Wu#super[3], M. Kozul#super[4] and A. J. Smits#super[5]
  ]

  #text(size: 11pt, style: "italic")[
    #super[1] CASE, Barcelona Supercomputing Center (BSC), Barcelona, Spain \
    #super[2] Department of Engineering, Nottingham Trent University, Nottingham, UK \
    #super[3] Department of Mechanical Engineering, University of Mississippi, Oxford, USA \
    #super[4] Department of Mechanical Engineering, University of Melbourne, Melbourne, Australia \
    #super[5] Department of Mechanical and Aerospace Engineering, Princeton University, Princeton, USA \
    #link("mailto:vishal.kumar@bsc.es")
  ]
]

#v(14pt)
#show: body => columns(2, gutter: 8mm, body)

#set heading(numbering: (..nums) => if nums.pos().len() == 1 { numbering("1", ..nums) })
#heading(numbering: none)[Abstract]

We computationally study the response of zero-pressure-gradient (ZPG) turbulent boundary layers (TBLs) to streamwise step changes from a smooth wall to riblets (S-R), and vice versa (R-S). We consider triangular riblets with tip angle $90^o$ (T9), that increase drag, with viscous-scaled spacing $50$. A novel grid-generation approach is developed for unstructured spectral-element codes, consistent with the size of turbulent scales across the TBL. We generate a ZPG TBL upstream of the step change (with thickness $delta_0$) with momentum thickness Reynolds number $R e_(theta_0) tilde.eq 680$. The TBL departure from equilibrium due to the step change, and its subsequent relaxation, recall previous studies on step changes in surface roughness. Downstream of the R-S step change, the internal equilibrium layer thickness $delta_(I E L)$ reaches $0.4 delta_0$ within $12 delta_0$. However, downstream of the S-R step change $delta_(I E L)$ reaches $0.4 delta_0$ within $4 delta_0$. In all cases, $delta_(I E L)$ does not reach the boundary layer thickness, even up to a distance of $45 delta_0$ downstream of the step change, owing to persistent history effects within the frozen wake region.

= Introduction

Riblets are streamwise-aligned grooves that modify the structure of the near-wall turbulence. Depending on their dimensions in viscous units, they can reduce or increase turbulent skin-friction drag (Endrikat et al., 2021). Over the past four decades, numerous studies have investigated the physical mechanisms behind riblet-induced drag modification. Most computational studies have focused on canonical turbulent channel flows (Modesti et al. 2021; Rouhi et al. 2022), whereas experimental investigations have predominantly considered zero-pressure-gradient (ZPG) turbulent boundary layers (TBLs) (Choi 1989).

A limited number of computational studies have examined riblet effects in TBLs (e.g., Bannier et al.~2015; Boomsma and Sotiropoulos 2015). These works typically generate a turbulent inflow using techniques developed for smooth walls, such as recycling--rescaling or synthetic eddy methods. Consequently, the computational setup consists of a smooth wall, followed by a step change to riblets. Such a surface transition disturbs the equilibrium state of the TBL, which requires some downstream distance to recover.

Abrupt changes in wall texture, for example smooth-to-roughness and vice-versa, trigger a localized yet persistent perturbation to the flow, leading to its departure from equilibrium (Antonia & Luxton 1971). Flow recovery to its new equilibrium state downstream of the step change depends on various parameters, such as geometrical characteristics of surfaces, and Reynolds number (Rouhi et al.~2019, Li et al.~2019). The flow recovery to equilibrium is a bottom-up process from the surface underneath, and is quantified via the internal boundary layer (IBL) and internal equilibrium layer (IEL). The IBL is the region of the flow that 'feels' the presence of the new wall condition, while maintaining upstream history outside of it (Garratt 1990). The IEL is the part of the IBL where the flow has reached complete equilibrium with the surface underneath (Savelyev & Taylor 2005).

In the present study we pursue two objectives: 1) to develop an inflow generation approach to achieve a ZPG TBL over riblets, yet avoiding the smooth-to-riblets surface change, as employed in the past computational investigations, and 2) study the flow recovery to equilibrium downstream of the step changes from smooth-to-riblets, and vice versa.

= Methodology

== Governing equations and numerical discretization

We solve the incompressible conservation of mass and momentum flow equations with constant density $rho$ and kinematic viscosity $nu$: #math.equation(block: true, numbering: _ => [(1#emph[a])], $nabla dot bold(u) = 0.$)
#math.equation(block: true, numbering: _ => [(1#emph[b])], $
  frac(partial bold(u), partial t) + nabla dot bold(u u) = -1/rho nabla p + nu nabla^2 bold(u).
$) <eq:cont_mom>
#counter(math.equation).update(1)
 Where $upright(bold(u)) = \( u \, v \, w \)$ is the velocity vector, and $x \, y \, z$ are the streamwise, wall-normal and spanwise directions, respectively. Equations (1#emph[a,b]) are solved using a well-validated computational solver (SOD2D) developed at Barcelona Supercomputing Center. Spatial discretization is based on a spectral formulation of the Continuous Galerkin Finite Elements model, coupled with an entropy viscosity stabilization (Guermond et al. 2011). We utilize third-order hexahedral element based mesh for all our calculations. Time advancement is $2^(n d)$ order Adams-Bashforth for the convection terms, and $2^(n d)$ order Crank-Nicolson for the diﬀusion terms. High-order operator splitting approach is used to solve the velocity--pressure coupling (Karniadakis et al. 1991). Numerical details for SOD2D are reported in Gasparino et al. (2024).

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
  , caption: [Simulation cases for turbulent half-channel flow over T950 and T615 riblets; $Delta_xi^(+)$ is the viscous-scaled azimuthal grid size over the riblets. For all cases, the domain size is $L_x times L_z tilde.eq 6 h times 3 h$, where $h$ is the half-channel height.]
  , kind: table
  ) <tab:channel>
#figure(image("source/fig1.png", width: 80.0%),
  caption: [
    Mean velocity profiles for the cases from @tab:channel compared with the reference data of Endrikat et al. (2021). The shaded region ($y^(+) > 100$) is discarded from comparison, as the profiles of Endrikat et al. (2021) are from a reduced-domain channel flow simulation.
  ]
)
<fig:channel>

== Code verification

We assess the accuracy of SOD2D and its resolution requirements for riblets by replicating the turbulent channel flow cases of Endrikat et al.~(2021) at friction Reynolds number $R e_tau = 400$ over two triangular riblet geometries; one with tip angle $alpha = 90 upright("°")$ and viscous-scaled spacing $s^(+) = 50$ (termed T950), and another one with $alpha = 60 upright("°")$ and $s^(+) = 15$ (termed T615). These geometries were selected based on their known drag characteristics: T950 increases drag, while T615 reduces drag, compared to the smooth channel. @tab:channel lists the resolutions used for the calculation cases. For T950, the #emph[coarse] and #emph[fine] cases differ in the streamwise resolution, #emph[fine] being the typical DNS resolution prescribed in literature. For T615, #emph[coarse] is the typical DNS resolution, while #emph[fine] has about $1.5$ times finer grid size in all directions. We obtain very good agreement in the mean velocity profiles with the reference DNS data of Endrikat et al.~(2021), even with the coarse grid calculations (@fig:channel). Our study highlights that even with $Delta_x^(+) = 20$ we obtain as accurate results as those with $Delta_x^(+) = 10$. For T615 cases, we employed a multi-block grid generation approach to save the computational cost (@fig:fig3). We discuss this approach next.

== Boundary layer setup

@fig:zpg\(#emph[a]) presents our setup for ZPG TBL. We set the domain width and height $\( L_z \, L_y \)$ three times of the maximum boundary layer thickness near the outlet, where the momentum thickness Reynolds number reaches $R e_theta tilde.eq 1000$ (friction Reynolds number $R e_tau tilde.eq 400$). These dimensions are larger than the ZPG TBL setup by Schlatter et al. (2009).

A laminar boundary layer with displacement thickness Reynolds number $R e_(delta_(upright(i n))^(*)) = 775$ is applied at the inlet. For the setups with the smooth wall at the inlet, we apply a laminar Blasius profile. However, for the cases with riblets at the inlet, we generate the inflow from a precursor calculation of a laminar temporal boundary layer. Slightly downstream of the inlet, we trip the boundary layer via volumetric forcing added to (@eq:cont_mom). This forcing mimics the drag force by a trip wire with length and height $l_x \, l_y$, respectively. The equations read,

$ f_x = - 1 / 2 rho C_D u \| u \| \/ l_x \, quad f_y = 0 \, quad f_z = 0 . $<eq:force> Here $C_D$ is a constant factor. The forcing is applied for $x_(upright("trip")) lt.eq x lt.eq x_(upright("trip")) + l_x$, $0 lt.eq y lt.eq l_y$. From a series of calculations, we arrived at the optimal tripping parameters $C_D = 3.0 \, l_x = l_y = 1.5 delta_(upright(i n))^(*)$ and $x_(upright(t r i p)) = 12 delta_(upright(i n))^(*)$. We apply no-slip condition at the bottom boundary, zero-vorticity condition at the top boundary, and periodic boundary condition in the spanwise direction. At the outlet, we apply a buﬀer region where the flow re-transitions to laminar, following a similar approach as the one by Munters et al.~(2016).

#figure(image("source/fig2.png", width: 100%),
  caption: [
    (#emph[a]) Flow setup and visualization for the case T9\_SM. (#emph[b]) Mean velocity profiles upstream of the step change ($x = - 4 delta_0$) for the T9\_SM and SM\_T9 cases (lines); the profiles are compared with ones from the smooth-wall ZPG TBL of Schlatter et al.~(2009), and T950\_fine case from @tab:channel.
  ]
)
<fig:zpg>

== Calculation cases

We conduct large-eddy simulations of ZPG TBLs over different surface textures (table~@tab:zpg) with Vreman (2004) subgrid-scale model. A case with an entirely smooth wall (case SM), and a case with an entirely triangular riblets with tip angle $alpha = 90 upright("°")$ (case T9). These cases are considered as benchmarks against which we will quantify the flow recovery to equilibrium for the cases with a step change in surface condition. We conduct a case with a riblet-to-smooth step change (T9\_SM) from T9 riblets to a smooth wall; right upstream of the step change, the T9 riblets have $s^(+) tilde.eq 52$, comparable with our validation cases in channel flow (T950 from table~@tab:channel). As a result, the mean velocity profile of the T9\_SM case upstream of the step change agrees well with the T950 profile from channel flow (@fig:zpg#emph[b]). Our last case (SM\_T9) is a step change from a smooth wall to T9 riblets. For the cases with the step change, we place the origin ($x = 0$) at the step change, where $R e_theta tilde.eq 670$ $\( R e_tau tilde.eq 283 \)$, and $delta_0$ (TBL thickness) is our reference length for scaling. The patch length upstream of the step change is $40 delta_0$, and the one downstream is $80 delta_0$.

== Computational grid

For computational efficiency, we generate an optimal locally-varying grid (@fig:fig3), following the resolution prescription of Chen & He (2023). The wall-normal and spanwise grid sizes ($Delta_y^(+) \, Delta_z^(+)$) expand gradually from the near-wall region towards the top boundary, consistent with the turbulent scales across the TBL. Near the riblet ($y^(+) lt.eq 1.5 k^(+)$, $k^(+) equiv$ riblet height), we generate a fine grid with $Delta_xi^(+) = 1 \, Delta z^(+) lt.eq 1$\; plus units is based on the $x -$location where $delta^(+) = 400$, near the outlet (denoted as $delta_400^(+)$). We apply $Delta z^(+) lt.eq 3.0$ up to the beginning of the logarithmic region $\( y^(+) tilde.eq 3 sqrt(delta_400^(+)) \)$ to well resolve the near-wall cycle of turbulence in the buffer region. Then we increase $Delta z^(+)$ to 11.0 near the boundary layer edge $\( y^(+) tilde.eq delta_400^(+) \)$, and further increase that to 25.0 by the top boundary. The wall-normal grid size also grows consistent with $Delta_z^(+)$ ($Delta_y^(+) tilde.eq Delta_z^(+)$). With this optimal grid, we highly resolve the flow near the riblets, yet we do not waste unnecessary grid count above the boundary layer in the inviscid region. We apply a uniform grid in the streamwise direction with $Delta_x^(+) = 20$.

#figure(
  align(center)[#table(
    columns: 3,
    align: (center,center,center,),
    table.header([Case], [$L_(upright(S M))$], [$L_(upright(T 9))$],),
    table.hline(),
    [SM (entirely smooth)], [$120 delta_0$], [$-$],
    [T9 (entirely T9)], [$-$], [$120 delta_0$],
    [T9\_SM (T9 to smooth)], [$80 delta_0$], [$40 delta_0$],
    [SM\_T9 (smooth to T9)], [$40 delta_0$], [$80 delta_0$],
  )]
  , caption: [Simulation cases for the ZPG TBL over entirely smooth or entirely riblet surfaces, as well as step changes from smooth to riblets, and vice versa; $L_(upright(S M))$ and $L_(upright(T 9))$ indicate the length of the smooth and riblet patches, respectively.]
  , kind: table
  ) <tab:zpg>
#figure(image("source/fig3.png", width: 100%),
  caption: [
    Visualisation of the grid for the case T9\_SM on an $y z$-plane as well as over the riblets and smooth surfaces near the step change. The viscous-scaled spanwise grid size $Delta_z^(+)$ is reported at different viscous-scaled wall-normal distances $y^(+)$\; $delta_400^(+)$ is the viscous-scaled boundary layer thickness at $R e_tau = 400$ (i.e.~$delta_400^(+) = 400$).
  ]
)
<fig:fig3>

#figure(image("source/fig4.png", width: 100%),
  caption: [
    Streamwise variations of (#emph[a]) $R e_theta$, and (#emph[b,c]) $C_f$ for the T9-to-smooth step change. In (#emph[a,b]) the smooth case (SM) is added as a reference. In (#emph[c]), $C_f$ for T9\_SM is normalized by $C_f$ from the smooth case ($C_(f_(upright(S M)))$) at matched $R e_theta$\; rough-to-smooth step change data of Rouhi et al.~(2019) (Ref.~DNS) and Li et al.~(2019) (Ref.~EXP).
  ]
)
<fig:fig4>

#figure(image("source/fig5.png", width: 100%),
  caption: [
    Same quantities as @fig:fig4 but for SM\_T9 step change. In (#emph[a,b]) the T9 case is added as a reference. In (#emph[c]), $C_f$ for SM\_T9 is normalized by $C_f$ from the T9 case ($C_(f_(upright(T 9)))$) at matched $R e_theta$\; smooth-to-rough step change data of Rouhi et al.~(2019) (Ref.~DNS).
  ]
)
<fig:fig5>

#figure(image("source/fig6.png", width: 100%),
  caption: [
    Identification of IEL based on $d U^(+) \/ d ln y^(+)$ for the T9\_SM case. Profiles of (#emph[b]) $d U^(+) \/ d ln y^(+)$ and (#emph[c]) $overline(u' ""^2)^(+)$ at $6 delta_0$ and $24 delta_0$ downstream of the step change, as indicated with vertical dashed lines in (#emph[a]). At each location, the profiles of T9\_SM case are compared with the ones from the smooth case (SM) at matched $R e_theta$. On each profile, the IEL is located with a magenta bullet. In (#emph[b]), we overlay the wake profile from $4 delta_0$ upstream of the step change (green line).
  ]
)
<fig:fig6>

#figure(recovery-figure,
  caption: [
    Streamwise growth of IEL thickness $delta_(I E L)$ for (#emph[a]) riblet-to-smooth step change, and (#emph[b]) smooth-to-riblet step change.
  ]
)
<fig:fig7>

= Results

We study the variations of $R e_theta$ and $C_f$ for T9\_SM (@fig:fig4) and SM\_T9 (@fig:fig5). In @fig:fig4, we add case SM, to assess the flow recovery downstream of the T9-to-smooth step change. Similarly, in @fig:fig5 we add case T9 to assess the flow recovery downstream of the smooth-to-T9 step change.

During the T9-to-smooth step change, there is a jump in $R e_theta$ (@fig:fig4#emph[a]). This is due to the near-wall flow acceleration, as reported in the past studies of rough-to-smooth step change (Rouhi et al.~2019). During the step change, there is an overshoot in $C_f$ followed by an undershoot below zero (@fig:fig4#emph[b]), and then a quick rise towards $C_(f_(upright(S M)))$ within a distance of $tilde.op delta_0$ (@fig:fig4#emph[c]). Such undershoot is also seen in the overlaid rough-to-smooth data of Rouhi et al.~(2019) (gray line) and experimental data of Li et al.~(2019) (symbols).

The undershoot in $C_f$ downstream of the step change, and its subsequent recovery to its equilibrium counterpart ($C_(f_(upright(S M)))$) depends on the high and low shear regions at downstream of the step change, which in turn depend on the geometrical details of the upstream surface, as well as the Reynolds number. Rouhi et al.~(2019) conducted DNS of turbulent channel flow over egg-carton roughness to smooth step change at $R e_tau tilde.eq 590$ with roughness height $k^(+) tilde.eq 39$. Li et al.~(2019) conducted experiments of ZPG TBL over sandpaper to smooth step change at $R e_tau tilde.eq 4100$ and $k^(+) tilde.eq 139$. The recovery to $C_(f_(upright(S M)))$ is within $2 delta_0$ in Rouhi et al.~(2019) and within $12 delta_0$ in Li et al.~(2019). For our present T9\_SM case, $C_f \/ C_(f_(upright(S M)))$ reaches an asymptotic value of $tilde.op 0.97$ within $7 delta_0$, but does not recover to $1.0$, even after $48 delta_0$ downstream (@fig:fig4#emph[c], inset). Note that to calculate $C_f \/ C_(f_(upright(S M)))$, $C_f$ and $C_(f_(upright(S M)))$ are at matched $R e_theta$, following Li et al.~(2021).

For the SM\_T9 case, there is a drop in $R e_theta$ during the step change (@fig:fig5#emph[a]), due to the momentum deficit and the flow deceleration near the wall. During the step change, we observe an undershoot in $C_f$, followed by an overshoot (@fig:fig5#emph[b]) consistent with the past studies on smooth-to-rough step change (Rouhi et al.~2019, Cogo et al.~2025). For the SM\_T9 case, $C_f \/ C_(f_(upright(T 9)))$ reaches an asymptotic value of $1.04$ within $5 delta_0$ (@fig:fig5#emph[c]), which is shorter than the asymptotic distance for $C_f \/ C_(f_(upright(S M)))$ for the T9\_SM case (@fig:fig4#emph[c]). Nevertheless, $C_f \/ C_(f_(upright(T 9)))$ does not converge to $1.0$, even after $58 delta_0$ (@fig:fig5#emph[c], inset). To calculate $C_f \/ C_(f_(upright(T 9)))$, $C_f$ and $C_(f_(upright(T 9)))$ are at matched $R e_theta$.

Downstream of the T9-to-smooth and smooth-to-T9 step changes, $C_f$ converges to within $plus.minus 4 %$ of its equilibrium counterpart, but does not reach it. We explain this behavior through @fig:fig6\(#emph[b]), by studying the profiles of $d U^(+) \/ d ln \( y^(+) \)$ at $6 delta_0$ and $24 delta_0$ downstream of the T9-to-smooth step change (blue curves), compared with the one at $4 delta_0$ upstream of the step change (green curve). Also, for each downstream profile, we overlay the profile from the smooth case (SM) at matched $R e_theta$ (black curves). The internal equilibrium layer thickness ($delta_(I E L)$) is the $y^(+)$ to which the profiles of T9\_SM and SM collapse on each other (marked with a magenta bullet). In @fig:fig6\(#emph[c]), we follow a similar approach to identify $delta_(I E L)$ based on the agreement in the streamwise turbulent stress profiles $overline(u' ""^2)^(+)$\; the resulting $delta_(I E L)$ is almost the same as the one based on $d U^(+) \/ d ln \( y^(+) \)$. Considering @fig:fig6\(#emph[b]), at $x = 6 delta_0$, the profiles of T9\_SM and SM agree up to $y^(+) tilde.eq 8$ ($delta_(I E L)^(+) tilde.eq 8$); at $x = 24 delta_0$, the two profiles agree up to a height $y^(+) tilde.eq 70$ ($delta_(I E L)^(+) tilde.eq 70$). Beyond $y^(+) tilde.eq 70$, the profiles of T9\_SM and SM significantly differ from each other, which corresponds to their wake region. Such difference in the wake region persists up to the farthest distance that we simulated. Interestingly, the wake profile of the T9\_SM case downstream of the step change (blue curve) is close to its counterpart from upstream of the step change (green curve). This indicates a frozen wake region that preserves its history, and remains uninfluenced by the underneath smooth surface. Since the wake profile of the T9\_SM case does not recover to the one from the SM case, $C_f \/ C_(f_(upright(S M)))$ does not recover to $1.0$ (@fig:fig4#emph[c]). To elaborate more, $C_f equiv 2 tau_w \/ \( rho U_oo^2 \) equiv 2 \/ U_oo^(+)^2$, and $U_oo^(+)$ is the integral of the $d U^(+) \/ d ln \( y^(+) \)$ profile. Therefore, agreement in $C_f$ values requires agreement in the entire $d U^(+) \/ d ln \( y^(+) \)$ profiles. For the SM\_T9 case, we observe similar frozen wake region with strong history effects, hence $C_f \/ C_(f_(upright(T 9)))$ does not converge to $1.0$ (@fig:fig5#emph[c]).

We study the growth of $delta_(I E L)$ downstream of the T9-to-smooth step change (@fig:fig7#emph[a]), compared with the one downstream of the smooth-to-T9 step change (@fig:fig7#emph[b]). Initially, $delta_(I E L)$ stays below $0.1 delta_0$, equivalent to $delta_(I E L)^(+) lt.tilde 30$. This initial slow growth corresponds to the recovery in the near-wall turbulence up to the beginning of the logarithmic region. This slow growth continues up to $x tilde.eq 12 delta_0$ for the T9\_SM case, and up to $x tilde.eq 4 delta_0$ for the SM\_T9 case. Thus, the near-wall turbulence has a slower recovery during the T9-to-smooth step change. After the initial slow growth, $delta_(I E L)$ jumps to $tilde.op 0.4 delta_0$ and does not grow any further. This height is the beginning of the wake region, that remains uninfluenced by the the surface underneath. Thus, $delta_(I E L)$ does not reach the boundary layer thickness.

= Conclusions

We investigated the recovery of a ZPG TBL downstream of a riblet-to-smooth step change, and vice versa. We focused on drag-increasing triangular riblets with tip angle $90 upright("°")$ and viscous-scaled spacing $50$ (T9 riblets). The ZPG TBL has $R e_(theta_0) tilde.eq 680$ right upstream of the step change, and grows up to $R e_theta tilde.eq 1000$ downstream of the step change. To evaluate the flow recovery to equilibrium, we conducted additional calculations of a ZPG TBL over an entirely smooth wall, as well as one covered entirely by T9 riblets. To make the computations affordable, we proposed a novel grid generation approach for unstructured spectral element solvers, where the elements size grows consistent with the size of turbulent scales. We observed that $C_f$ converged to its equilibrium value with a faster rate during smooth-to-T9 step change (within $4 delta_0$), than during T9-to-smooth step change (within $7 delta_0$). However, for both step changes, $C_f$ did not completely reach equilibrium, even after $45 delta_0$ downstream of the step change. Similarly, the internal equilibrium layer thickness $delta_(I E L)$ did not reach the TBL thickness, and stayed within $0.4 delta_0$. Assessment of the profiles of the mean velocity derivative $d U^(+) \/ d ln \( y^(+) \)$ and streamwise turbulent stress $overline(u' ""^2)^(+)$ revealed that the wake region does not recover, even up to $45 delta_0$, leading to the incomplete recovery in $C_f$ and $delta_(I E L)$.

#heading(numbering: none)[Acknowledgments]

VK acknowledges his AI4S fellowship within the Generación D initiative by Red.es, Ministerio para la Transformación Digital y de la Función Pública, for talent attraction (C005/24-ED CV1), funded by NextGenerationEU through PRTR. AR acknowledges the support from the Air Force Office of Scientific Research (AFOSR) under award number FA8655-24-1-7008, monitored by Dr.~Douglas Smith and Dr.~Barrett Flake. WW acknowledges the support from AFOSR Grant No. FA9550-25-1-0033, monitored by Dr.~Gregg Abate. We thank EPSRC for the computational time made available on ARCHER2 via the UK Turbulence Consortium (EP/R029326/1), and the UKRI access to the HPC call 2024.

#heading(numbering: none)[References]

#block[
#block[

Antonia, R. A. & Luxton, R. E. (1971) The response of a turbulent boundary layer to a step change in surface roughness. Part 1. Smooth to rough. #emph[J. Fluid Mech.] 48, 721--761.

Bannier, A., Garnier, É. and Sagaut, P. (2015). Riblet flow model based on an extended FIK identity. #emph[Flow Turbul. Combust.], Vol. 95, pp. 351-376.

Boomsma, A. and Sotiropoulos, F. (2015). Riblet drag reduction in mild adverse pressure gradients: a numerical investigation. #emph[Int. J. Heat Fluid Flow], Vol.~56, pp. 251-260.

Chen, C. & He, L. 2023 Two-scale solution for tripped turbulent boundary layer. #emph[J. Fluid Mech.] 955, A5.

Choi, K.S. (1989). Near-wall structure of a turbulent boundary layer with riblets. #emph[J. Fluid Mech.], Vol. 208, pp. 417-458.

Cogo, M., Modesti, D., Bernardini, M. and Picano, F. (2025). Surface roughness effects on subsonic and supersonic turbulent boundary layers. #emph[J. Fluid Mech.], Vol. 1009, p. A56.

Endrikat, S., Modesti, D., Garcia-Mayoral, R., Hutchins, N. and Chung, D. (2021). Influence of riblet shapes on the occurrence of Kelvin--Helmholtz rollers, #emph[J. Fluid Mech.], Vol. 913, pp. A37.

Garratt, J. R. (1990). The internal boundary layer - A review. #emph[Boundary-Layer Meteorol.], 50(1--4), 171--203.

Gasparino, L., Spiga, F., & Lehmkuhl, O. (2024). SOD2D: A GPU-enabled Spectral Finite Elements Method for compressible scale-resolving simulations. #emph[Comput. Phys. Commun], 297, 109067.

Guermond, J.-L., Pasquetti, R., & Popov, B. (2011). Entropy viscosity method for nonlinear conservation laws. #emph[J. Comput. Phys], 230(11), 4248--4267.

Ismail, U., Zaki, T. A., & Durbin, P. A. (2018). Simulations of rib-roughened rough-to-smooth turbulent channel flows. #emph[J. Fluid Mech.], 843, 419--449.

Karniadakis, G. E., Israeli, M., & Orszag, S. A. (1991). High-order splitting methods for the incompressible Navier-Stokes equations. #emph[J. Comput. Phys], 97(2), 414--443.

Li, M., de Silva, C. M., Rouhi, A., Baidya, R., Chung, D., Marusic, I., & Hutchins, N. (2019). Recovery of wall-shear stress to equilibrium flow conditions after a rough-to-smooth step change in turbulent boundary layers. #emph[J. Fluid Mech.], 872, 472--491.

Li, M., De Silva, C.M., Chung, D., Pullin, D.I., Marusic, I. and Hutchins, N. (2021). Experimental study of a turbulent boundary layer with a rough-to-smooth change in surface conditions at high Reynolds numbers. #emph[J. Fluid Mech.], Vol. 923, p. A18.

Modesti, D., Endrikat, S., Hutchins, N., & Chung, D. (2021). Dispersive stresses in turbulent flow over riblets. #emph[J. Fluid Mech.], 917, A55.

Munters, W., Meneveau, C. and Meyers, J. (2016). Turbulent inflow precursor method with time-varying direction for large-eddy simulations and applications to wind farms. #emph[Boundary Layer Meteorol.], Vol. 159, pp. 305-328.

Rouhi, A., Chung, D., & Hutchins, N. (2019). Direct numerical simulation of open-channel flow over smooth-to-rough and rough-to-smooth step changes. #emph[J. Fluid Mech.], 866, 450--486.

Rouhi, A., Endrikat, S., Modesti, D., Sandberg, R. D., Oda, T., Tanimoto, K., Hutchins, N. & Chung, D. (2022) Riblet-generated flow mechanisms that lead to local breaking of reynolds analogy. #emph[J. Fluid Mech.] 951, A45.

Savelyev, S. A. & Taylor, P. A. (2005) Internal boundary layers: I. Height formulae for neutral and diabatic ﬂows. #emph[Boundary-Layer Meteorol.] 115, 1--25.

Schlatter, P., Örlü, R., Li, Q., Brethouwer, G., Fransson, J. H. M., Johansson, A. V., Alfredsson, P. H., & Henningson, D. S. (2009). Turbulent boundary layers up to $R e_theta = 2500$ studied through simulation and experiment. #emph[Phys. Fluids], 21(5).

Vreman, A.W. (2004). An eddy-viscosity subgrid-scale model for turbulent shear flow: Algebraic theory and applications. #emph[Phys Fluids], Vol. 16, pp. 3670-3681.

]
]
