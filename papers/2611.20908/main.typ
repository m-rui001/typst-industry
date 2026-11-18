// Typst adaptation of Di Pietro et al., arXiv:2611.20908v1 (CC BY 4.0).
// https://arxiv.org/abs/2611.20908v1 | https://creativecommons.org/licenses/by/4.0/
#import "layout.typ": *
#import "bubble.typ": bubble-geometry
#import "dmi-plot.typ": dmi-plot
#show: article.with(supplement: false)

#align(center)[
#text(15pt, weight: "bold")[How Elasticity and Chiral Damping Shape Domain-Wall Creep]

A. Di Pietro#super[1], A. Magni#super[1], S. Pizzini#super[2], G. Gandini#super[3], F. Dörr#super[4], Y. Shokr#super[5,4], M. Erkovan#super[6,5], G. Durin#super[1], S. Tacchi#super[7], M. Madami#super[8], G. Carlotti#super[8], E. Darwin#super[9,10], A. J. Huxtable#super[9], C. Rinaldi#super[3], C. H. Marrows#super[9], B. J. Hickey#super[9], V.Puliafito#super[11], M. Kuepferling#super[1]

#text(8pt, style: "italic")[
#super[1] Istituto Nazionale di Ricerca Metrologica, Torino, Italy #linebreak()
#super[2] Université Grenoble Alpes, CNRS, Néel Institute, Grenoble, France #linebreak()
#super[3] Dipartimento di Fisica, Politecnico di Milano, Via G. Colombo 81, 20131 Milano, Italy #linebreak()
#super[4] Department of Physics, Freie Universität Berlin, Berlin, Germany #linebreak()
#super[5] Center for Nuclear Radiation Detectors Application and Research (NÜRDAM), Bolu Abant İzzet Baysal University, Bolu, Türkiye. #linebreak()
#super[6] Mehmet Tanrıkulu Health Service Vocational School, Bolu Abant İzzet Baysal University, Bolu, Türkiye #linebreak()
#super[7] Istituto Officina dei Materiali del CNR (CNR-IOM), Sede Secondaria di Perugia, c/o Dipartimento di Fisica e Geologia, Università di Perugia, Perugia, Italy #linebreak()
#super[8] Dipartimento di Fisica e Geologia, Università di Perugia, Perugia, Italy #linebreak()
#super[9] School of Physics and Astronomy, University of Leeds, Leeds, United Kingdom #linebreak()
#super[10] Empa, Dübendorf, Switzerland #linebreak()
#super[11] Department of Electrical and Information Engineering, Politecnico di Bari, 70126, Bari, Italy #linebreak()
]

#text(8pt)[#link("mailto:a.dipietro@inrim.it", "a.dipietro@inrim.it") · Typst adaptation of #link("https://arxiv.org/abs/2611.20908v1")[arXiv:2611.20908v1] · #link("https://creativecommons.org/licenses/by/4.0/")[CC BY 4.0]]

#block(width: 85%)[Asymmetric domain-wall expansion in the creep regime provides an experimentally accessible probe of the interfacial Dzyaloshinskii-Moriya interaction (iDMI) and, in principle, chiral damping. However, severe discrepancies with complementary measurement techniques and the lack of a model describing the full experimental phenomenology of the creep of chiral domain walls, limits the application of these measurements. Here, using a symmetry decomposition of the velocity curve, we derive an analytical model describing the coupled influence of domain-wall stiffness and chiral damping in the creep regime. Their interplay generates the antisymmetric distortion that shifts the velocity minimum away from the DMI field. Applied to Co-based magnetic multilayers, the model yields iDMI values consistent with BLS and flow-regime benchmarks and identifies the reasons for the longstanding discrepancy. The model provides insights for possible strategies to measure chiral damping via creep dynamics of domain walls.]
]

#set heading(numbering: none)
#show heading: set text(size: 10pt, style: "italic", weight: "regular")
#show <eq:lnS>: set text(size: 8.5pt)
#show: columns.with(2, gutter: 16pt)

The interfacial Dzyaloshinskii-Moriya interaction (iDMI) #source-ref(1, <bib:MOR-60>)#source-ref(2, <bib:DZYALOSHINSKY1958241>)#source-ref(3, <bib:fert_role_1980>)#source-ref(4, <bib:CRE-98>) is a key ingredient in the stabilization and dynamics of chiral magnetic textures in heavy-metal/ferromagnet multilayers with perpendicular magnetic anisotropy, including homochiral domain walls #source-ref(5, <bib:THI-12>)#source-ref(6, <bib:parkin_memory_2015>)#source-ref(7, <bib:benitez_magnetic_2015>)#source-ref(8, <bib:meng_regulation_2024>)#source-ref(9, <bib:di_pietro_domain_2023>) and skyrmions #source-ref(10, <bib:Fert2013>)#source-ref(11, <bib:hoffmann_skyrmion-antiskyrmion_2021>)#source-ref(12, <bib:mishra_magnetic_2025>). More recently, chiral damping has emerged as a distinct contribution to domain-wall motion, with possible implications for the mobility of magnetic textures #source-ref(13, <bib:jue_chiral_2016>)#source-ref(14, <bib:ganguly_competition_2021>)#source-ref(15, <bib:safeer_effect_2022>). The quantitative determination of both effects is therefore relevant to the fundamental understanding of chiral magnetism and to the design of future spintronic devices #source-ref(16, <bib:das_exploring_2026>)#source-ref(17, <bib:zhang_perspective_2026>)#source-ref(18, <bib:sankhi_effect_2025>)#source-ref(19, <bib:kuepferling_measuring_2023>).

Field-driven domain-wall expansion in the creep regime, in which an out-of-plane field drives the wall in the presence of an in-plane field #source-ref(20, <bib:Je2013>)#source-ref(14, <bib:ganguly_competition_2021>)#source-ref(21, <bib:krizakova_study_2019>)#source-ref(22, <bib:Lavrijsen2015>) holds promise because it couples experimental accessibility and, in principle, sensitivity to both effects #source-ref(13, <bib:jue_chiral_2016>)#source-ref(23, <bib:lau_disentangling_2018>). To date, however, creep measurements have mainly been used to determine the iDMI. In the conventional analysis, the minimum of the domain-wall velocity curve is identified with the DMI effective field, $H_x^min = - H_(upright(D M I))$, and the DMI constant is obtained as $D = mu_0 M_s H_(upright(D M I)) Delta$, where $Delta$ is the domain-wall width parameter #source-ref(20, <bib:Je2013>)#source-ref(24, <bib:hrabec_measuring_2014>)#source-ref(25, <bib:kim_wide-range_2017>)#source-ref(26, <bib:shahbazi_magnetic_2018>).

#figure(dmi-plot(),
  caption: [
    iDMI values extracted from BLS and conventional DW creep analysis for the investigated Pt/Co multilayers. The experimental data are from Ref.~#source-ref(27, <bib:magni_key_2022>)\; the creep values were obtained using the conventional model of Ref.~#source-ref(20, <bib:Je2013>). Lines are guides to the eye.
  ]
)
<fig:dmi_compare>

Cross-laboratory comparisons have however highlighted an important discrepancy #source-ref(27, <bib:magni_key_2022>)#source-ref(19, <bib:kuepferling_measuring_2023>): Brillouin light scattering (BLS) determines iDMI through spin-wave nonreciprocity #source-ref(28, <bib:Cortes-Ortuno2013>)#source-ref(29, <bib:YAN-15>), and its estimates agree quantitatively with those obtained from DW flow-regime measurements #source-ref(30, <bib:garcia_magnetic_2021>)#source-ref(31, <bib:vanatka_velocity_2015>)\; values obtained from conventional DW creep analysis, instead, often show substantial over- or underestimates #source-ref(27, <bib:magni_key_2022>)#source-ref(32, <bib:soucaille_probing_2016>) (see Fig. #ref(<fig:dmi_compare>, supplement: none)). This ambiguity limits both DMI extraction and the use of creep dynamics to probe chiral damping, whose quantitative experimental determination remains challenging. Domain-wall elasticity #source-ref(33, <bib:pellegren_dispersive_2017>)#source-ref(34, <bib:Hartmann2019>)#source-ref(35, <bib:DiPietro2026>), and chiral damping #source-ref(13, <bib:jue_chiral_2016>)#source-ref(14, <bib:ganguly_competition_2021>) have all been investigated as possible corrections to the conventional creep interpretation, including through numerical treatments #source-ref(23, <bib:lau_disentangling_2018>)#source-ref(36, <bib:davydenko_dzyaloshinskii-moriya_2021>). Nevertheless, an analytical description of the coupled influence of domain-wall elasticity and chiral damping is still missing.

Here, following a symmetry decomposition of the DW velocity curve #source-ref(37, <bib:kim_decoupling_2025>), we derive a unified model describing the coupled action of domain-wall stiffness and chiral damping. We show why this discrepancy is specific to the creep regime and demonstrate that these contributions shift the creep-velocity minimum away from the DMI field, shedding light on the controversies associated with the conventional $H_(D M I)$ extraction method. #source-ref(20, <bib:Je2013>).

We test this description on five magnetron-sputtered $upright(P t \/ C o) \/ X$ multilayers with different capping layers - Pt/Co/Pt(3), Pt/Co/Pt(1), Pt/Co/Ir(3), Pt/Co/Ir(1), and Pt/Co/Ta - and on a structurally distinct Si/SiO$""_2$/TiN(10)/Hf$""_0.5$Zr$""_0.5$O$""_2$\(10)/Co(0.7)/Pt(6) sample, denoted HZO/Co/Pt. Growth details, structural and magnetic characterization of all samples are reported in the Suppl. Mater. #source-ref(49, <bib:SupplementalMaterial>). Across the investigated samples, the symmetry-decomposed DW creep analysis yields iDMI values consistent with the BLS benchmarks and, where available, the DW flow benchmarks. The resulting physical picture improves DMI determination from creep measurements and provides insight to extend creep regime measurements to probe chiral damping.

#figure(bubble-geometry(width: 60%),
  caption: [
    Geometry of asymmetric bubble expansion, defining $H_x$, $H_z$, the wall-normal angle $theta$, and the internal wall angle $phi.alt$.
  ]
)
<fig:bubble_geom>

= Domain wall creep in the presence of domain wall stiffness and chiral damping
<domain-wall-creep-in-the-presence-of-domain-wall-stiffness-and-chiral-damping>

We now develop an analytical framework for the combined effects of chiral damping and domain-wall elasticity on creep-regime motion. At low driving fields, the domain-wall velocity is governed by an Arrhenius law #source-ref(38, <bib:Lemerle1998>)#source-ref(39, <bib:chauve_creep_2000>)#source-ref(40, <bib:kim_universality_2019>), $v = v_0 exp \[ - chi \( H_x \) H_z^(- 1 \/ 4) \]$. Here, the dimensionless exponent $chi \( H_x \) H_z^(- 1 \/ 4)$ represents the field-dependent activation energy in units of $k_(upright(B)) T$. In the following, we adopt a semi-phenomenological approximation in which the activation-energy coefficient $chi \( H_x \)$ is controlled by the domain-wall stiffness $tilde(sigma)$, whereas the prefactor $v_0 \( H_x \)$ depends on the equilibrium wall energy $sigma_(upright(e q)) = min_phi.alt sigma \( theta \, phi.alt \)$. Since the stiffness introduces an angular-curvature correction to the equilibrium wall energy, its influence is amplified in the creep exponent, while its contribution to the algebraic prefactor is expected to be comparatively smaller. We therefore retain this correction in the activation barrier while neglecting it in the prefactor #source-ref(22, <bib:Lavrijsen2015>). The domain-wall energy density $sigma \( theta \, phi.alt \)$ is $ sigma \( theta \, phi.alt \) = & sigma_0 - pi mu_0 M_s Delta #scale(x: 180%, y: 180%)[\[] H_x cos phi.alt + H_(upright(D M I)) cos \( phi.alt - theta \) #scale(x: 180%, y: 180%)[\]]\
 & + frac(ln \( 2 \), pi) t mu_0 M_s^2 cos^2 \( phi.alt - theta \) . $<eq:DW_density> where $theta$ and $phi.alt$ represent the azimuthal angles of the DW normal and magnetization (see Fig. #ref(<fig:bubble_geom>, supplement: none)). $sigma_0 = 4 sqrt(A K_(upright(e f f)))$ is the Bloch wall energy, $Delta = sqrt(A \/ K_(upright(e f f)))$ is the domain-wall width parameter, $A$ is the exchange stiffness, $K_(upright(e f f)) = K_u - frac(mu_0 M_s^2, 2)$ is the effective perpendicular magnetic anisotropy, $M_s$ is the saturation magnetization, $H_(upright(D M I))$ is the DMI field, and $t$ is the effective magnetic thickness. $K_u$ represents the uniaxial magnetocrystalline anisotropy. In this approximation, we write $ chi \( H_x \) = chi_0 (frac(tilde(sigma) \( H_x \), tilde(sigma) \( 0 \)))^(1 \/ 4) \, quad v_0 prop sigma_(upright(e q))^beta alpha_(upright(e f f))^(- 1) \, $ where $chi_0$ is the creep scaling coefficient at $H_x = 0$, and $beta$ describes the scaling of the velocity prefactor with the equilibrium domain-wall energy density #source-ref(41, <bib:akosa_decoupling_2024>). We model the DW stiffness according to the description of Refs.~#source-ref(33, <bib:pellegren_dispersive_2017>)#source-ref(23, <bib:lau_disentangling_2018>), $ tilde(sigma) \( theta \) = sigma \( theta \, phi.alt_(upright(e q)) \) + frac(partial^2 sigma \( theta thin \, phi.alt \), partial theta^2) #scale(x: 240%, y: 240%)[\|]_(phi.alt = phi.alt_(upright(e q))) . $ Here, $phi.alt_(upright(e q)) = upright("argmin")_phi.alt sigma \( theta \, phi.alt \)$. We couple this expression with the chiral damping parametrization $ alpha_(upright(e f f)) \( phi.alt \) = alpha_0 [1 + s eta cos \( phi.alt - theta \)] \, $<eq:CD> where $s = plus.minus 1$ labels the two wall chiralities, $eta$ is the dimensionless relative chiral-damping strength, and $alpha_0$ is ordinary Gilbert damping~#source-ref(42, <bib:akosa_phenomenology_2016>)#source-ref(41, <bib:akosa_decoupling_2024>). Assuming $theta = 0$, the logarithmic velocity, up to irrelevant constants, is $ ln v \( H_x \, H_z \) & = beta ln (frac(sigma_(upright(e q)) \( H_x \), sigma_(upright(e q)) \( 0 \))) - ln alpha_(upright(e f f)) \( H_x \)\
 & quad - chi_0 (frac(tilde(sigma) \( H_x \), tilde(sigma) \( 0 \)))^(1 \/ 4) H_z^(- 1 \/ 4) . $<eq:lnv> To translate this coupled expression into a functional tool, we decompose the velocity curve about the field $- H_(upright(D M I))$, at which the applied in-plane field compensates the DMI contribution to the wall energy #source-ref(37, <bib:kim_decoupling_2025>). The symmetric component is even and the antisymmetric component is odd about this decomposition center. Under the approximations of small in-plane-field-induced variations of the equilibrium domain-wall energy and stiffness, and retaining chiral damping up to second order $cal(O) \( eta^2 \)$, Eq.~(#ref(<eq:lnv>, supplement: none)) reduces to a minimal semi-phenomenological model (see #source-ref(49, <bib:SupplementalMaterial>) for the full derivation). Combining all variables not directly related to $H_(upright(D M I)) + H_x$ and defining $H_K^(D W) = 2 ln \( 2 \) thin t M_s \( pi^2 Delta \)^(- 1)$ as the DW anisotropy field, we identify $\| H_x + H_(upright(D M I)) \| lt.eq H_K^(D W)$ as the mixed Bloch-Néel region, in which the equilibrium wall magnetization rotates continuously between the two limiting configurations. The symmetric component of the velocity is governed by two parameters, $nu_1$ and $nu_3$:

Write $X = H_x + H_(upright("DMI"))$.

$ \( ln v \)_S = cases(delim: "{", nu_1 \( H_K^(D W) \)^2 - nu_3 \( X + H_K^(D W) \) \, & X < - H_K^(D W) \,, nu_1 \( X \)^2 \, & \| X \| lt.eq H_K^(D W) \,, nu_1 \( H_K^(D W) \)^2 + nu_3 \( X - H_K^(D W) \) \, & X > H_K^(D W) .) $<eq:lnS>

The antisymmetric component, under these approximations, is governed by a single parameter $nu_2$: $ \( ln v \)_A = cases(delim: "{", - nu_2 \, & X < - H_K^(D W) \,, nu_2 frac(X, H_K^(D W)) \, & \| X \| lt.eq H_K^(D W) \,, nu_2 \, & X > H_K^(D W) .) $<eq:lnA> Introducing the reduced variables $  & zeta = frac(pi mu_0 M_s Delta H_(upright(D M I)), sigma_0) \, quad beta_x = frac(pi mu_0 M_s Delta H_x, sigma_0) \, $

$ kappa = frac(pi mu_0 M_s Delta H_K^(D W), 2 sigma_0) \, $ and defining $C_z = \( chi_0 H_z^(- 1 \/ 4) \) \/ 4$ for compactness, where $C_z$ carries the $H_z$ dependence of the elastic creep contribution, we obtain $ nu_1 & = frac(1, \( H_K^(upright(D W)) \)^2) #scale(x: 240%, y: 240%)[\[] - frac(beta kappa, 1 + kappa - \| zeta \|) + frac(5 C_z kappa, 1 - kappa) + eta^2 / 2 #scale(x: 240%, y: 240%)[\]] \, $<eq:nu1>

$ nu_2 & = s eta - frac(zeta C_z, 1 - kappa) \, $<eq:nu2>

$ nu_3 & = frac(2 kappa, H_K^(upright(D W))) [frac(C_z, 1 - kappa) - frac(beta, 1 + kappa - \| zeta \|)] . $<eq:nu3> We can now analytically express the shift of the velocity minimum. In the mixed Bloch-Néel region, the velocity minimum $H_x^star.op$ is located at $ \( H_x^star.op \)_(c r e e p) & = - H_(upright(D M I)) - frac(nu_2, 2 nu_1 H_K^(D W)) . $<eq:min> While derived under specific approximations, this expression captures the phenomenology observed experimentally. First, it explicitly shows how the minimum is shifted from the compensation field $- H_(upright(D M I))$ whenever $nu_2 eq.not 0$. The shift is controlled by the antisymmetric amplitude $nu_2$, which contains two contributions: the chiral-damping term $s eta$ , and the elastic term $- zeta C_z \/ \( 1 - kappa \)$ generated by the DMI-dependent DW stiffness in the activation exponent \[Eq.~(#ref(<eq:nu2>, supplement: none))\]. The sign of the chiral-damping term $prop s eta$ is sample dependent and not necessarily related to the sign of DMI #source-ref(15, <bib:safeer_effect_2022>)#source-ref(42, <bib:akosa_phenomenology_2016>). We also highlight the $H_z$ field dependence of the velocity minimum #source-ref(40, <bib:kim_universality_2019>), which in this formalism can be clearly attributed to the elastic contribution $tilde.op zeta C_z$ in $nu_2$.

#figure(image("source/Plots/fig2_0.svg", width: 90.0%),
  caption: [
    i) Representative BLS spectrum (sample Pt/Co/Ir(1)) showing both the Stokes/anti-Stokes frequencies $f_(upright(S)) \, f_(upright(A S))$, used to extract $D$, and the peak-widths $Gamma_S \, Gamma_(A S)$. ii) relative chiral damping $alpha_c \/ alpha_0$ contributions obtained from $Gamma_S \, Gamma_(A S)$ (left axis) and DMI values measured from BLS spectra (right axis).
  ]
)
<fig:2_0>

= Chiral damping and domain-wall elasticity in BLS and DW flow measurements
<chiral-damping-and-domain-wall-elasticity-in-bls-and-dw-flow-measurements>
#figure(image("source/Plots/fig3_v4.svg", width: 75%), placement: top, scope: "parent",
  caption: [
    i) iDMI constant values measured with different techniques. No Flow comparison was possible for sample HZO/Co/Pt. ii) Normalized log of the velocity $ln \( v \( H_x \) \/ v \( 0 \) \)$ in the asymmetric bubble expansion on sample Pt/Co/Ta performed at different OOP fields ranging from $mu_0 H_z = 13$ mT to $50$ mT. A vertical offset is applied to improve clarity. The inset on the top shows the location of the minimum $mu_0 H_x^(upright(m i n))$ as a function of the applied OOP field $mu_0 H_z$. Representative velocity decompositions according to Eqs.~(#ref(<eq:lnS>, supplement: none))-(#ref(<eq:lnA>, supplement: none)) for samples iii) Pt/Co/Pt(3), iv) Pt/Co/Ta, and v) HZO/Co/Pt. The arrows identify the magnetization directions of the two domains and the intervening DW. The blue dashed line represents the symmetric part (#ref(<eq:lnS>, supplement: none)) of the curve, while the orange dashed line represents its antisymmetric component (#ref(<eq:lnA>, supplement: none)). The shaded area represents the mixed Bloch-Néel regime.
  ]
)
<fig:3>

As shown above, creep domain-wall dynamics are particularly sensitive to the coupled effects of chiral damping and DW stiffness~#source-ref(41, <bib:akosa_decoupling_2024>). It is therefore important to assess whether the same effects bias BLS and DW flow measurements. DW stiffness is not relevant in the interpretation of BLS spectra, as the technique probes propagating spin waves rather than domain-wall motion #source-ref(43, <bib:nembach_linear_2015>)#source-ref(44, <bib:belmeguenai_brillouin_2016>). The Stokes/anti-Stokes peak positions and linewidths nevertheless contain signatures of both the iDMI and chiral damping. As discussed by Kim #emph[et al.] #source-ref(45, <bib:kim_chiral_2024>), the iDMI produces a nonreciprocal frequency shift and, through the frequency dependence of ordinary Gilbert damping, also contributes to the linewidth asymmetry. Chiral damping, instead, introduces an additional odd-in-wave-vector contribution to the linewidth asymmetry. Defining $Delta f = \| f_S \| - \| f_(A S) \|$ where $f_S$ and $f_(A S)$ represent the Stokes and Anti-Stokes peak frequencies \[Fig. #ref(<fig:2_0>, supplement: none)\(i)\], the DMI constant is obtained as $D = pi M_s Delta f \/ \( 2 gamma k \)$, where $k$ is the spin-wave wave vector and $gamma$ is the gyromagnetic ratio in frequency units, for the sign convention used here. Defining the measured linewidth sum and difference $Gamma_plus.minus = Gamma_S plus.minus Gamma_(A S)$ \[Fig. #ref(<fig:2_0>, supplement: none)\(i)\], we can isolate the chiral-damping contribution via $ alpha_c / alpha_0 = frac(Gamma_(-) - r_f Gamma_(+), Gamma_(+) - r_f Gamma_(-)) \, $<eq:Gamma_S_AS> where $r_f = \( \| f_S \| - \| f_(A S) \| \) \/ \( \| f_S \| + \| f_(A S) \| \)$ #source-ref(49, <bib:SupplementalMaterial>). Here, $alpha_c$ denotes the chiral contribution to the damping. The resulting chiral-damping contributions for our sample series are shown in Fig. #ref(<fig:2_0>, supplement: none)\(ii). Within the $upright(P t \/ C o) \/ X$ series, the sign and magnitude of the linewidth asymmetry broadly track those of $D$. This suggests a sample-dependent correlation rather than a general proportionality: DMI and chiral damping correspond to distinct energetic and dissipative responses and can vary independently~#source-ref(45, <bib:kim_chiral_2024>), as illustrated here by the weak linewidth asymmetry of sample HZO/Co/Pt despite its sizable DMI.

= DW flow measurements
<dw-flow-measurements>
The domain-wall stiffness correction governing the creep activation barrier does not enter the flow regime, where the motion is no longer controlled by thermally activated depinning #source-ref(46, <bib:metaxas_creep_2007>)#source-ref(47, <bib:slonczewski_dynamics_1972>). In the strong-DMI limit, the Walker-velocity plateau provides a direct estimate of the DMI strength #source-ref(48, <bib:ha_pham_very_2016>), $ v_W tilde.eq pi / 2 gamma D / M_s \, $<eq:vW> Since Eq.~(#ref(<eq:vW>, supplement: none)) contains no damping parameter at leading order, this estimate is insensitive to chiral damping within the present approximation #source-ref(42, <bib:akosa_phenomenology_2016>)#source-ref(41, <bib:akosa_decoupling_2024>). A second DW flow estimate of $H_(upright(D M I))$ is obtained from the minimum of the precessional-flow velocity as a function of $H_x$ #source-ref(30, <bib:garcia_magnetic_2021>). Chiral damping weakly breaks the symmetry of this velocity curve. Expanding the average drift velocity #source-ref(30, <bib:garcia_magnetic_2021>)#source-ref(31, <bib:vanatka_velocity_2015>) to first order in $eta$ yields the following $\( H_x^star.op \)_(upright(f l o w))$ field corresponding to the velocity minimum $ \( H_x^star.op \)_(upright(f l o w)) tilde.eq - H_(upright(D M I)) + frac(s eta alpha_0 H_z, pi) [1 + 5 / 8 (H_K^(D W) / H_z)^2] . $<eq:flow_shift> The derivation and comparison with the full numerical minimum are given in the Supplementary material #source-ref(49, <bib:SupplementalMaterial>). Equation~(#ref(<eq:flow_shift>, supplement: none)) shows that the displacement is suppressed by $eta alpha_0$. For the parameters of the investigated samples, the calculated shift is of the order of $1$~mT and is comparable to the experimental resolution of the in-plane-field coils. To summarize, domain-wall elasticity does not enter the flow physics, the Walker velocity is damping independent to leading order, and the chiral-damping-induced displacement of the drift-velocity minimum is experimentally negligible. We conclude that DW flow measurements are expected to agree with BLS, providing a reference for the present analysis of iDMI strength #source-ref(48, <bib:ha_pham_very_2016>).

= Experimental interpretation
<experimental-interpretation>
We now apply the symmetry-decomposed DW creep model of Eqs.~(#ref(<eq:lnS>, supplement: none))-(#ref(<eq:lnA>, supplement: none)) to the samples introduced above. We test whether the model yields iDMI values consistent with BLS and DW flow measurements and whether the fitted antisymmetric response helps identify the physical origin of the discrepancies found with conventional DW creep analysis.

The symmetry-decomposed estimates are obtained by fitting each measured $\( ln \[ v \( H_x \) \/ v \( 0 \) \] \)$ as $ ln v \( H_x \) = \( ln v \)_S + \( ln v \)_A \, $<eq:full_response> where $\( ln v \)_S \, \( ln v \)_A$ come from Eqs.(#ref(<eq:lnS>, supplement: none))-(#ref(<eq:lnA>, supplement: none)). We see how $H_x = - H_(upright(D M I))$ is the symmetry axis of $\( ln v \)_S$, while $\( ln v \)_A$ displaces the velocity minimum from this center. In Fig. #ref(<fig:3>, supplement: none)\(i), The blue circles represent BLS measurements, the green squares are the DW flow estimate extracted from the Walker-velocity plateau using Eq.~(#ref(<eq:vW>, supplement: none)), the red triangles are the conventional DW creep estimate~#source-ref(20, <bib:Je2013>), and the black stars are the symmetry-decomposed DW creep estimate \[Eq.~(#ref(<eq:full_response>, supplement: none))\]. We immediately notice how the symmetry-decomposed DMI estimates agree with independent BLS measurements and, where available, DW flow estimates. The conventional DW creep estimates, on the other hand, show substantial discrepancies. An in depth discussion of the error estimation of $D = mu_0 M_s Delta H_(upright(D M I))$ for each sample as well as the fitted values of $nu_(1 \, 2 \, 3)$ and $H_K^(D W) \, H_(upright(D M I))$ are reported in #source-ref(49, <bib:SupplementalMaterial>). We can now discuss some representative cases: sample $upright(P t \/ C o \/ P t) \( 3 \)$ \[Fig. #ref(<fig:3>, supplement: none)\(iii)\] has a small antisymmetric component and a symmetric part centered close to zero, with a weakly biased conventional DW creep estimate. Sample $upright(P t \/ C o \/ T a)$ \[Fig. #ref(<fig:3>, supplement: none)\(iv)\] has a large antisymmetric component and a symmetric part centered at large $H_x$, with a large displacement of the minimum from the symmetry axis. Sample HZO/Co/Pt \[Fig. #ref(<fig:3>, supplement: none)\(v)\] combines a small antisymmetric component with a symmetric part centered at large $H_x$, yet retains a finite discrepancy between the conventional DW creep and BLS estimates \[inset of Fig. #ref(<fig:3>, supplement: none)\(v)\]. The inverted sign of $H_(upright(D M I))$ in this sample follows from the inverted layer stacking: Pt is on top of Co, in contrast to the $upright(P t \/ C o) \/ X$ series.

Comparing these decompositions with the BLS spectra provides further insights. As shown in Fig. #ref(<fig:2_0>, supplement: none)\(i), the spectra provide both the Stokes/anti-Stokes frequency shift used to extract DMI and the relative linewidth asymmetry $Gamma_(-)$, which we associate with chiral damping~#source-ref(45, <bib:kim_chiral_2024>)#source-ref(49, <bib:SupplementalMaterial>) via Eq.(#ref(<eq:Gamma_S_AS>, supplement: none)). Across the $upright(P t \/ C o) \/ X$ series \[Fig. #ref(<fig:2_0>, supplement: none)\(ii)\], the largest linewidth asymmetries occur in the samples where the discrepancy between conventional DW creep analysis and BLS is largest. However, sample HZO/Co/Pt in Fig. #ref(<fig:3>, supplement: none)\(v) shows that this correspondence is not one-to-one: a sizable minimum displacement persists at large DMI even when the BLS chiral damping signature is weak \[Fig. #ref(<fig:2_0>, supplement: none)\(ii)\], consistent with an elastic contribution to the asymmetry $nu_2$. Its discrepancy is nevertheless smaller than that of $upright(P t \/ C o \/ T a)$, but accounting for the asymmetric part yields a DMI value closer to the BLS benchmark. Combining these observations, we conclude that elastic and chiral damping contributions mix with sample-dependent weights, obscuring the origin of the discrepancy in the full creep velocity curve.

We emphasize, in fact, how the magnitude of the antisymmetric component alone cannot establish the relative roles of DW elasticity and chiral damping. At a single $H_z$, the fit determines the net $nu_2$ of Eq.~(#ref(<eq:nu2>, supplement: none)), but does not separate its elastic and dissipative contributions. Such a separation would require extracting $nu_2$ from velocity curves measured over a range of $H_z$, since the elastic term varies through $C_z prop H_z^(- 1 \/ 4)$.

The different $H_z$ dependencies of elasticity and chiral damping in $nu_2$ (see Eq.~(#ref(<eq:nu2>, supplement: none))) provide a way to test this interpretation. Figure~@fig:3\(ii) shows that the conventional DW creep minimum is not a fixed material observable. In sample $upright(P t \/ C o \/ T a)$, the normalized DW creep curves $ln \[ v \( H_x \) \/ v \( 0 \) \]$, measured over OOP fields spanning $mu_0 H_z = 13$-$50$ mT (all values below the depinning field for sample $upright(P t \/ C o \/ T a)$, $mu_0 H_d = 55.3 plus.minus 0.3$ mT #source-ref(49, <bib:SupplementalMaterial>)), display a systematic displacement of $mu_0 H_x^(upright(m i n))$ with the out-of-plane driving field. This trend, summarized in the inset, is consistent with Eq.~(#ref(<eq:min>, supplement: none)): changing $H_z$ modifies the activation-barrier contribution through $C_z$, and therefore changes the relative weight of the elastic term in the shift of the velocity minimum.

= Conclusion
<conclusion-->
In this work, we analyzed how domain-wall elasticity and chiral damping collectively affect the creep dynamics of chiral domain walls. The derived model shows that the antisymmetric component responsible for shifting the domain-wall creep-velocity minimum away from the DMI field arises from a nontrivial interplay of these contributions. Moreover, because the domain-wall stiffness contribution depends on the out-of-plane driving field, the position of this minimum can vary with the measurement conditions rather than representing an intrinsic material parameter. Fits to velocity curves measured in a series of Pt/Co samples with different overlayers and growth procedures yield DMI values consistent with BLS and the available DW flow benchmarks, whose iDMI signatures are not affected by the same interplay between elasticity and chiral damping. With additional measurement of the $H_z$ dependence of the $nu_2$ component of the velocity curves (see. Eq.(#ref(<eq:nu2>, supplement: none))), creep measurements could also serve as a probe of chiral damping in magnetic thin films, providing a basis for future quantitative comparisons with BLS.

= Acknowledgments
<acknowledgments>
We acknowledge R. Lavrijsen for the fruitful discussions. This project is supported by the European Union (EU) and the Italian ministry of University and Research (MUR) under the grant PRIN 2022 "Metrology for spintronics: A machine learning approach for the reliable determination of the Dzyaloshinskii-Moriya interaction (MetroSpin)". Project code: 2022SAYARY. Yasser Shokr gratefully acknowledges financial support from TÜBİTAK under grant number 124C509, which supported his work. This work was supported by the France 2030 government plan managed by the Agence Nationale de la Recherche (project PEPR SPIN CHIREX ANR‐22‐EXSP‐0002). This work was supported in part by the European Metrology Programme for Innovation and Research (EMPIR) Programme co-financed by the Participating States under Project 17FUN08-TOPS.

= References

#reference-entry(1, <bib:MOR-60>)[
T.~Moriya,~ Anisotropic Superexchange Interaction and Weak Ferromagnetism,~#link("https://doi.org/10.1103/physrev.120.91")[  Physical Review~#strong[120],~91 ( 1960)],~publisher: American Physical Society (APS)

]
#reference-entry(2, <bib:DZYALOSHINSKY1958241>)[
I.~Dzyaloshinsky,~ A thermodynamic theory of "weak" ferromagnetism of antiferromagnetics,~#link("https://doi.org/10.1016/0022-3697(58)90076-3")[  Journal of Physics and Chemistry of Solids~#strong[4],~241 ( 1958)]

]
#reference-entry(3, <bib:fert_role_1980>)[
A.~Fert~and~P.~M.~Levy,~ Role of Anisotropic Exchange Interactions in Determining the Properties of Spin-Glasses,~#link("https://doi.org/10.1103/PhysRevLett.44.1538")[  Physical Review Letters~#strong[44],~1538 ( 1980)]

]
#reference-entry(4, <bib:CRE-98>)[
A.~Crépieux~and~C.~Lacroix,~ Dzyaloshinsky--Moriya interactions induced by symmetry breaking at a surface,~ Journal of magnetism and magnetic materials~#strong[182],~341 ( 1998),~publisher: Elsevier

]
#reference-entry(5, <bib:THI-12>)[
A.~Thiaville, S.~Rohart, É.~Jué, V.~Cros,~and~A.~Fert,~ Dynamics of Dzyaloshinskii domain walls in ultrathin magnetic films,~#link("https://doi.org/10.1209/0295-5075/100/57002")[  EPL (Europhysics Letters)~#strong[100],~57002 ( 2012)],~publisher: IOP Publishing

]
#reference-entry(6, <bib:parkin_memory_2015>)[
S.~Parkin~and~S.-H.~Yang,~ Memory on the racetrack,~#link("https://doi.org/10.1038/nnano.2015.41")[  Nature Nanotechnology~#strong[10],~195 ( 2015)]

]
#reference-entry(7, <bib:benitez_magnetic_2015>)[
M.~J.~Benitez, A.~Hrabec, A.~P.~Mihai, T.~A.~Moore, G.~Burnell, D.~McGrouther, C.~H.~Marrows,~and~S.~McVitie,~ Magnetic microscopy and topological stability of homochiral Néel domain walls in a Pt/Co/$upright(A l O)_x$ trilayer,~#link("https://doi.org/10.1038/ncomms9957")[  Nature Communications~#strong[6],~8957 ( 2015)],~publisher: Nature Publishing Group

]
#reference-entry(8, <bib:meng_regulation_2024>)[
Y.~Meng, F.~Meng, M.~Hou, Q.~Zheng, B.~Wang, R.~Zhu, C.~Feng,~and~G.~Yu,~ Regulation of interfacial Dzyaloshinskii--Moriya interaction in ferromagnetic multilayers,~#link("https://doi.org/10.1088/1361-648X/ad2386")[  Journal of Physics: Condensed Matter~#strong[36],~193001 ( 2024)],~publisher: IOP Publishing

]
#reference-entry(9, <bib:di_pietro_domain_2023>)[
A.~Di~Pietro, F.~Garcı́a-Sánchez,~and~G.~Durin,~ Domain wall statics and dynamics in nanowires with arbitrary Dzyaloshinskii-Moriya tensors,~#link("https://doi.org/10.1103/PhysRevB.108.174427")[  Physical Review B~#strong[108],~174427 ( 2023)]

]
#reference-entry(10, <bib:Fert2013>)[
A.~Fert, V.~Cros,~and~J.~Sampaio,~ Skyrmions on the track,~#link("https://doi.org/10.1038/nnano.2013.29")[  Nature Nanotechnology 2013 8:3~#strong[8],~152 ( 2013)],~publisher: Nature Publishing Group

]
#reference-entry(11, <bib:hoffmann_skyrmion-antiskyrmion_2021>)[
M.~Hoffmann, G.~P.~Müller, C.~Melcher,~and~S.~Blügel,~ Skyrmion-Antiskyrmion Racetrack Memory in Rank-One DMI Materials,~#link("https://doi.org/10.3389/FPHY.2021.769873/BIBTEX")[  Frontiers in Physics~#strong[9],~668 ( 2021)],~publisher: Frontiers Media S.A.

]
#reference-entry(12, <bib:mishra_magnetic_2025>)[
K.~K.~Mishra, A.~H.~Lone, S.~Srinivasan, H.~Fariborzi,~and~G.~Setti,~ Magnetic skyrmion: from fundamental physics to pioneering applications,~#link("https://doi.org/10.1063/5.0223004")[  Applied Physics Reviews~#strong[12],~011315 ( 2025)]

]
#reference-entry(13, <bib:jue_chiral_2016>)[
E.~Jué, C.~Safeer, M.~Drouard, A.~Lopez, P.~Balint, L.~Buda-Prejbeanu, O.~Boulle, S.~Auffret, A.~Schuhl, A.~Manchon, I.~M.~Miron,~and~G.~Gaudin,~ Chiral damping of magnetic domain walls,~#link("https://doi.org/10.1038/nmat4518")[  Nature Materials~#strong[15],~272 ( 2016)]

]
#reference-entry(14, <bib:ganguly_competition_2021>)[
A.~Ganguly, S.~Zhang, I.~M.~Miron, J.~Kosel, X.~Zhang, A.~Manchon, N.~Singh, D.~H.~Anjum,~and~G.~Das,~ Competition between Chiral Energy and Chiral Damping in the Asymmetric Expansion of Magnetic Bubbles,~#link("https://doi.org/10.1021/acsaelm.1c00592")[  ACS Applied Electronic Materials~#strong[3],~4734 ( 2021)],~publisher: American Chemical Society

]
#reference-entry(15, <bib:safeer_effect_2022>)[
C.~K.~Safeer, M.-A.~Nsibi, J.~Nath, M.~S.~Gabor, H.~Yang, I.~Joumard, S.~Auffret, G.~Gaudin,~and~I.-M.~Miron,~ Effect of Chiral Damping on the dynamics of chiral domain walls and skyrmions,~#link("https://doi.org/10.1038/s41467-022-28815-6")[  Nature Communications~#strong[13],~1192 ( 2022)],~publisher: Nature Publishing Group

]
#reference-entry(16, <bib:das_exploring_2026>)[
P.~Das, M.~M.~Rajib,~and~J.~Atulasimha,~ Exploring the role of interfacial Dzyaloshinskii--Moriya interaction in write error rate anomalies of spin-transfer torque magnetic tunnel junctions,~#link("https://doi.org/10.1038/s44306-026-00137-z")[  npj Spintronics~#strong[4],~18 ( 2026)],~publisher: Nature Publishing Group

]
#reference-entry(17, <bib:zhang_perspective_2026>)[
W.~Zhang, Y.~Xiong, J.-M.~Hu, J.~Sklenar, M.~M.~Subedi, M.~B.~Jungfleisch, V.~S.~Bhat, Y.~Li, L.~Liu, Q.~Wang, Y.~K.~Luo, Y.~J.~Bae,~and~B.~Flebus,~ Perspective: Magnon-magnon coupling in hybrid magnonics,~#link("https://doi.org/10.1038/s44306-025-00123-x")[  npj Spintronics~#strong[4],~11 ( 2026)],~publisher: Nature Publishing Group

]
#reference-entry(18, <bib:sankhi_effect_2025>)[
B.~R.~Sankhi, C.~D'Angelo, D.~Thompson,~and~P.~Tyagi,~ Effect of Dzyaloshinskii Moriya interaction on magnetic tunnel junction based molecular spintronics devices (MTJMSD),~#link("https://doi.org/10.1038/s41598-025-88741-7")[  Scientific Reports~#strong[15],~5576 ( 2025)],~publisher: Nature Publishing Group

]
#reference-entry(19, <bib:kuepferling_measuring_2023>)[
M.~Kuepferling, A.~Casiraghi, G.~Soares, G.~Durin, F.~Garcia-Sanchez, L.~Chen, C.~Back, C.~Marrows, S.~Tacchi,~and~G.~Carlotti,~ Measuring interfacial Dzyaloshinskii-Moriya interaction in ultrathin magnetic films,~#link("https://doi.org/10.1103/RevModPhys.95.015003")[  Reviews of Modern Physics~#strong[95],~015003 ( 2023)]

]
#reference-entry(20, <bib:Je2013>)[
S.~G.~Je, D.~H.~Kim, S.~C.~Yoo, B.~C.~Min, K.~J.~Lee,~and~S.~B.~Choe,~ Asymmetric magnetic domain-wall motion by the Dzyaloshinskii-Moriya interaction,~#link("https://doi.org/10.1103/PhysRevB.88.214401")[  Physical Review B - Condensed Matter and Materials Physics~#strong[88],~1 ( 2013)]

]
#reference-entry(21, <bib:krizakova_study_2019>)[
V.~Krizakova, J.~P.~Garcia, J.~Vogel, N.~Rougemaille, D.~D.~S.~Chaves, S.~Pizzini,~and~A.~Thiaville,~ Study of the velocity plateau of Dzyaloshinskii domain walls,~#link("https://doi.org/10.1103/PhysRevB.100.214404")[  Physical Review B~#strong[100],~214404 ( 2019)]

]
#reference-entry(22, <bib:Lavrijsen2015>)[
R.~Lavrijsen, D.~M.~Hartmann, A.~Van Den~Brink, Y.~Yin, B.~Barcones, R.~A.~Duine, M.~A.~Verheijen, H.~J.~Swagten,~and~B.~Koopmans,~ Asymmetric magnetic bubble expansion under in-plane field in Pt/Co/Pt: Effect of interface engineering,~#link("https://doi.org/10.1103/PhysRevB.91.104414")[  Physical Review B - Condensed Matter and Materials Physics~#strong[91],~1 ( 2015)],~arXiv: 1503.08999

]
#reference-entry(23, <bib:lau_disentangling_2018>)[
D.~Lau, J.~P.~Pellegren, H.~T.~Nembach, J.~M.~Shaw,~and~V.~Sokalski,~ Disentangling factors governing Dzyaloshinskii domain-wall creep in Co/Ni thin films using $upright(P t)_x upright(I r)_(1 - x)$ seed layers,~#link("https://doi.org/10.1103/PhysRevB.98.184410")[  Physical Review B~#strong[98],~184410 ( 2018)]

]
#reference-entry(24, <bib:hrabec_measuring_2014>)[
A.~Hrabec, N.~A.~Porter, A.~Wells, M.~J.~Benitez, G.~Burnell, S.~McVitie, D.~McGrouther, T.~A.~Moore,~and~C.~H.~Marrows,~ Measuring and tailoring the Dzyaloshinskii-Moriya interaction in perpendicularly magnetized thin films,~#link("https://doi.org/10.1103/PhysRevB.90.020402")[  Physical Review B~#strong[90],~020402 ( 2014)]

]
#reference-entry(25, <bib:kim_wide-range_2017>)[
D.-H.~Kim, S.-C.~Yoo, D.-Y.~Kim, B.-C.~Min,~and~S.-B.~Choe,~ Wide-Range Probing of Dzyaloshinskii--Moriya Interaction,~#link("https://doi.org/10.1038/srep45498")[  Scientific Reports~#strong[7],~45498 ( 2017)]

]
#reference-entry(26, <bib:shahbazi_magnetic_2018>)[
K.~Shahbazi,~ Magnetic properties and field-driven dynamics of chiral domain walls in epitaxial $upright(P t) \/ upright(C o) \/ upright(A u)_x upright(P t)_(1 - x)$ trilayers,~ Physical Review B~#strong[98],~#link("https://doi.org/10.1103/PhysRevB.98.214413")[10.1103/PhysRevB.98.214413] ( 2018)

]
#reference-entry(27, <bib:magni_key_2022>)[
A.~Magni, G.~Carlotti, A.~Casiraghi, E.~Darwin, G.~Durin, L.~H.~Diez, B.~J.~Hickey, A.~Huxtable, C.~Y.~Hwang, G.~Jakob, C.~Kim, M.~Klaui, J.~Langer, C.~H.~Marrows, H.~T.~Nembach, D.~Ravelosona, G.~A.~Riley, J.~M.~Shaw, V.~Sokalski, S.~Tacchi,~and~M.~Kuepferling,~ Key Points in the Determination of the Interfacial Dzyaloshinskii--Moriya Interaction From Asymmetric Bubble Domain Expansion,~#link("https://doi.org/10.1109/TMAG.2022.3217891")[  IEEE Transactions on Magnetics~#strong[58],~1 ( 2022)]

]
#reference-entry(28, <bib:Cortes-Ortuno2013>)[
D.~Cortés-Ortuño~and~P.~Landeros,~ Influence of the Dzyaloshinskii-Moriya interaction on the spin-wave spectra of thin films,~ Journal of Physics Condensed Matter~#strong[25],~#link("https://doi.org/10.1088/0953-8984/25/15/156001")[10.1088/0953-8984/25/15/156001] ( 2013)

]
#reference-entry(29, <bib:YAN-15>)[
H.~Yang, A.~Thiaville, S.~Rohart, A.~Fert,~and~M.~Chshiev,~ Anatomy of Dzyaloshinskii-Moriya Interaction at Co/Pt Interfaces,~ Physical Review Letters~#strong[115],~#link("https://doi.org/10.1103/physrevlett.115.267210")[10.1103/physrevlett.115.267210] ( 2015),~publisher: American Physical Society (APS)

]
#reference-entry(30, <bib:garcia_magnetic_2021>)[
J.~P.~Garcia, A.~Fassatoui, M.~Bonfim, J.~Vogel, A.~Thiaville,~and~S.~Pizzini,~ Magnetic domain wall dynamics in the precessional regime: Influence of the Dzyaloshinskii-Moriya interaction,~#link("https://doi.org/10.1103/PhysRevB.104.014405")[  Physical Review B~#strong[104],~014405 ( 2021)]

]
#reference-entry(31, <bib:vanatka_velocity_2015>)[
M.~Vaňatka, J.-C.~Rojas-Sánchez, J.~Vogel, M.~Bonfim, M.~Belmeguenai, Y.~Roussigné, A.~Stashkevich, A.~Thiaville,~and~S.~Pizzini,~ Velocity asymmetry of Dzyaloshinskii domain walls in the creep and flow regimes,~#link("https://doi.org/10.1088/0953-8984/27/32/326002")[  Journal of Physics: Condensed Matter~#strong[27],~326002 ( 2015)]

]
#reference-entry(32, <bib:soucaille_probing_2016>)[
R.~Soucaille, M.~Belmeguenai, J.~Torrejon, J.-V.~Kim, T.~Devolder, Y.~Roussigné, S.-M.~Chérif, A.~A.~Stashkevich, M.~Hayashi,~and~J.-P.~Adam,~ Probing the Dzyaloshinskii-Moriya interaction in CoFeB ultrathin films using domain wall creep and Brillouin light spectroscopy,~#link("https://doi.org/10.1103/PhysRevB.94.104431")[  Physical Review B~#strong[94],~104431 ( 2016)]

]
#reference-entry(33, <bib:pellegren_dispersive_2017>)[
J.~P.~Pellegren, D.~Lau,~and~V.~Sokalski,~ Dispersive Stiffness of Dzyaloshinskii Domain Walls~#link("https://doi.org/10.1103/PhysRevLett.119.027203")[10.1103/PhysRevLett.119.027203] ( 2017)

]
#reference-entry(34, <bib:Hartmann2019>)[
D.~M.~Hartmann, R.~A.~Duine, M.~J.~Meijer, H.~J.~Swagten,~and~R.~Lavrijsen,~ Creep of chiral domain walls,~#link("https://doi.org/10.1103/PhysRevB.100.094417")[  Physical Review B~#strong[100],~1 ( 2019)],~publisher: American Physical Society

]
#reference-entry(35, <bib:DiPietro2026>)[
Di Pietro, A., Magni, A., Pizzini, S., Dörr, F., Shokr, Y., Durin, G., Tacchi, S., Madami, M., Carlotti, G., Darwin, E., Huxtable, A., Marrows, C., Hickey, B. & Kuepferling, M. Anisotropic Domain‐Wall Velocity Profiles in the Creep Regime: The Interplay of Chiral Damping, Stiffness, and Dzyaloshinskii--Moriya Interaction. #emph[Physica Status Solidi (RRL) -- Rapid Research Letters]. #strong[20] (2026,11), http:\/\/dx.doi.org/10.1002/pssr.70265

]
#reference-entry(36, <bib:davydenko_dzyaloshinskii-moriya_2021>)[
A.~V.~Davydenko, A.~G.~Kozlov, M.~E.~Stebliy, A.~G.~Kolesnikov, N.~I.~Sarnavskiy, I.~G.~Iliushin,~and~A.~P.~Golikov,~ Dzyaloshinskii-Moriya interaction and chiral damping effect in symmetric epitaxial Pd/Co/Pd\(111) trilayers,~#link("https://doi.org/10.1103/PhysRevB.103.094435")[  Physical Review B~#strong[103],~094435 ( 2021)]

]
#reference-entry(37, <bib:kim_decoupling_2025>)[
D.-Y.~Kim,~ Decoupling chiral energy and chiral damping contributions in domain wall dynamics via symmetry arguments,~#link("https://doi.org/10.1063/5.0286237")[  Journal of Applied Physics~#strong[138],~063906 ( 2025)]

]
#reference-entry(38, <bib:Lemerle1998>)[
S.~Lemerle, J.~Ferré, C.~Chappert, V.~Mathet, T.~Giamarchi,~and~P.~Le~Doussal,~ Domain wall creep in an ising ultrathin magnetic film,~#link("https://doi.org/10.1103/PhysRevLett.80.849")[  Physical Review Letters~#strong[80],~849 ( 1998)]

]
#reference-entry(39, <bib:chauve_creep_2000>)[
P.~Chauve, T.~Giamarchi,~and~P.~Le~Doussal,~ Creep and depinning in disordered media,~#link("https://doi.org/10.1103/PhysRevB.62.6241")[  Physical Review B~#strong[62],~6241 ( 2000)]

]
#reference-entry(40, <bib:kim_universality_2019>)[
D.-H.~Kim, D.-Y.~Kim, S.-C.~Yoo, B.-C.~Min,~and~S.-B.~Choe,~ Universality of Dzyaloshinskii-Moriya interaction effect over domain-wall creep and flow regimes,~#link("https://doi.org/10.1103/PhysRevB.99.134401")[  Physical Review B~#strong[99],~134401 ( 2019)]

]
#reference-entry(41, <bib:akosa_decoupling_2024>)[
C.~A.~Akosa, G.~Tatara, A.~Manchon,~and~M.~Mochizuki,~ Decoupling the influences of chiral damping and Dzyaloshinskii-Moriya interaction in chiral magnetic domain walls,~#link("https://doi.org/10.1103/PhysRevB.110.024420")[  Physical Review B~#strong[110],~024420 ( 2024)]

]
#reference-entry(42, <bib:akosa_phenomenology_2016>)[
C.~A.~Akosa, I.~M.~Miron, G.~Gaudin,~and~A.~Manchon,~ Phenomenology of chiral damping in noncentrosymmetric magnets,~#link("https://doi.org/10.1103/PhysRevB.93.214429")[  Physical Review B~#strong[93],~214429 ( 2016)]

]
#reference-entry(43, <bib:nembach_linear_2015>)[
H.~T.~Nembach, J.~M.~Shaw, M.~Weiler, E.~Jué,~and~T.~J.~Silva,~ Linear relation between Heisenberg exchange and interfacial Dzyaloshinskii--Moriya interaction in metal films,~#link("https://doi.org/10.1038/nphys3418")[  Nature Physics~#strong[11],~825 ( 2015)]

]
#reference-entry(44, <bib:belmeguenai_brillouin_2016>)[
M.~Belmeguenai, M.~S.~Gabor, Y.~Roussigné, A.~Stashkevich, S.~M.~Chérif, F.~Zighem,~and~C.~Tiusan,~ Brillouin light scattering investigation of the thickness dependence of Dzyaloshinskii-Moriya interaction in $upright(C o)_0.5 upright(F e)_0.5$ ultrathin films,~#link("https://doi.org/10.1103/PhysRevB.93.174407")[  Physical Review B~#strong[93],~174407 ( 2016)]

]
#reference-entry(45, <bib:kim_chiral_2024>)[
D.-Y.~Kim, I.~Berrai, T.~Suraj, Y.~Roussigné, S.~Yang, M.~Belmeguenai, F.~Hu, G.~Shi, H.~R.~Tan, J.~Huang, A.~Soumyanarayanan, K.-W.~Kim, S.~Mourad~Cherif,~and~H.~Yang,~ Chiral Damping of Magnons,~#link("https://doi.org/10.1103/PhysRevLett.133.156704")[  Physical Review Letters~#strong[133],~156704 ( 2024)]

]
#reference-entry(46, <bib:metaxas_creep_2007>)[
P.~J.~Metaxas, J.~P.~Jamet, A.~Mougin, M.~Cormier, J.~Ferré, V.~Baltz, B.~Rodmacq, B.~Dieny,~and~R.~L.~Stamps,~ Creep and Flow Regimes of Magnetic Domain-Wall Motion in Ultrathin $upright(P t) \/ upright(C o) \/ upright(P t)$ Films with Perpendicular Anisotropy,~#link("https://doi.org/10.1103/PhysRevLett.99.217208")[  Physical Review Letters~#strong[99],~217208 ( 2007)],~publisher: American Physical Society

]
#reference-entry(47, <bib:slonczewski_dynamics_1972>)[
J.~C.~Slonczewski,~ DYNAMICS OF MAGNETIC DOMAIN WALLS,~#link("https://doi.org/10.1063/1.3699416")[  AIP Conference Proceedings~#strong[5],~170 ( 1972)]

]
#reference-entry(48, <bib:ha_pham_very_2016>)[
T.~Ha~Pham, J.~Vogel, J.~Sampaio, M.~Vaňatka, J.-C.~Rojas-Sánchez, M.~Bonfim, D.~S.~Chaves, F.~Choueikani, P.~Ohresser, E.~Otero, A.~Thiaville,~and~S.~Pizzini,~ Very large domain wall velocities in Pt/Co/$upright(G d O)_x$ and Pt/Co/Gd trilayers with Dzyaloshinskii-Moriya interaction,~#link("https://doi.org/10.1209/0295-5075/113/67001")[  EPL (Europhysics Letters)~#strong[113],~67001 ( 2016)]

]
#reference-entry(49, <bib:SupplementalMaterial>)[
See Supplemental Material at \[URL will be inserted by publisher\] for sample-preparation details, derivations of the analytical model, additional measurements, and fitted parameters.
]
