// Typst adaptation of Di Pietro et al., arXiv:2611.20908v1 (CC BY 4.0).
// https://arxiv.org/abs/2611.20908v1 | https://creativecommons.org/licenses/by/4.0/
#import "layout.typ": *
#show: article.with(supplement: true)

#align(center)[
#text(15pt, weight: "bold")[Supplementary Material: How Elasticity and Chiral Damping Shape Domain-Wall Creep]

A. Di Pietro#super[1], A. Magni#super[1], S. Pizzini#super[2], G. Gandini#super[3], F. Dörr#super[4], Y. Shokr#super[5,4], M. Erkovan#super[6,5], G. Durin#super[1], S. Tacchi#super[7], M. Madami#super[8], G. Carlotti#super[8], E. Darwin#super[9,10], A. J. Huxtable#super[9], C. Rinaldi#super[3], C. H. Marrows#super[9], B. J. Hickey#super[9], V.Puliafito#super[11], M. Kuepferling#super[1]

#text(9pt, style: "italic")[
#super[1] Istituto Nazionale di Ricerca Metrologica, Torino, Italy #v(7pt)
#super[2] Université Grenoble Alpes, CNRS, Néel Institute, Grenoble, France #v(7pt)
#super[3] Dipartimento di Fisica, Politecnico di Milano, Via G. Colombo 81, 20131 Milano, Italy #v(7pt)
#super[4] Department of Physics, Freie Universität Berlin, Berlin, Germany #v(7pt)
#super[5] Center for Nuclear Radiation Detectors Application and Research (NÜRDAM), Bolu Abant İzzet Baysal University, Bolu, Türkiye. #v(7pt)
#super[6] Mehmet Tanrıkulu Health Service Vocational School, Bolu Abant İzzet Baysal University, Bolu, Türkiye #v(7pt)
#super[7] Istituto Officina dei Materiali del CNR (CNR-IOM), Sede Secondaria di Perugia, c/o Dipartimento di Fisica e Geologia, Università di Perugia, Perugia, Italy #v(7pt)
#super[8] Dipartimento di Fisica e Geologia, Università di Perugia, Perugia, Italy #v(7pt)
#super[9] School of Physics and Astronomy, University of Leeds, Leeds, United Kingdom #v(7pt)
#super[10] Empa, Dübendorf, Switzerland #v(7pt)
#super[11] Department of Electrical and Information Engineering, Politecnico di Bari, 70126, Bari, Italy #v(7pt)
]

#text(8pt)[#link("mailto:a.dipietro@inrim.it", "a.dipietro@inrim.it") · Typst adaptation of #link("https://arxiv.org/abs/2611.20908v1")[arXiv:2611.20908v1] · #link("https://creativecommons.org/licenses/by/4.0/")[CC BY 4.0]]
]
#pagebreak()

= Sample preparation and magnetic characterization
<sample-preparation-and-magnetic-characterization>
== Previously characterized Co-based samples
<sec:samples_a1_a5>
Samples a1-a5 are ultrathin Co-based heterostructures previously prepared and characterized in Ref.~#source-ref(1, <bib:magni_key_2022>). All samples contain a nominally $0.8$-nm-thick Co layer deposited on a common Ta(5)/Pt(3) underlayer, while the material and thickness of the upper interface were varied. The nominal layer sequences, listed from bottom to top and with all thicknesses expressed in nanometers, are reported in Table. #ref(<tab:layer_structures>, supplement: none) The complete fabrication and initial characterization were reported previously in Ref.~#source-ref(1, <bib:magni_key_2022>)\; here we summarize only the information required for the analysis presented in this work.

== HZO sample
<hzo-sample>
The a6 sample consists of an SiO/TiN/Hf$""_0.5$Zr$""_0.5$O$""_2$\(10)/Co(0.7)/Pt(6.0) stack fabricated at the Fraunhofer Institute Dresden and characterized at the Politecnico di Milano. Atomic Layer Deposition (ALD) was used for TiN and Hf$""_0.5$Zr$""_0.5$O$""_2$ (HZO), while in-situ Physical Vapour Deposition (PVD) was used for the metallic layers (Co/Pt).

#block[
#figure(
  align(center)[#table(
    columns: 2,
    align: (center,left,),
    table.header([Sample ID], [Layer structure],),
    table.hline(),
    [a1], [$upright(T a) \( 5 \) \/ upright(P t) \( 3 \) \/ upright(C o) \( 0.8 \) \/ upright(P t) \( 3 \) \/ upright(T a) \( 3 \)$],
    [a2], [$upright(T a) \( 5 \) \/ upright(P t) \( 3 \) \/ upright(C o) \( 0.8 \) \/ upright(P t) \( 1 \) \/ upright(T a) \( 3 \)$],
    [a3], [$upright(T a) \( 5 \) \/ upright(P t) \( 3 \) \/ upright(C o) \( 0.8 \) \/ upright(I r) \( 3 \) \/ upright(T a) \( 3 \)$],
    [a4], [$upright(T a) \( 5 \) \/ upright(P t) \( 3 \) \/ upright(C o) \( 0.8 \) \/ upright(I r) \( 1 \) \/ upright(T a) \( 3 \)$],
    [a5], [$upright(T a) \( 5 \) \/ upright(P t) \( 3 \) \/ upright(C o) \( 0.8 \) \/ upright(T a) \( 3 \)$],
    [a6], [Hf$""_0.5$Zr$""_0.5$O$""_2$\(10)/Co(0.7)/Pt(6.0)],
    [], [],
  )]
  , caption: [Layer structures of the investigated samples. Layer thicknesses are given in nanometers.]
  , kind: table
  ) <tab:layer_structures>
]
#block[
#figure(
  align(center)[#table(
    columns: 5,
    align: (left,center,center,center,center,),
    [Sample ID], [$M_s$], [$A$], [$Delta$], [$K_(upright(e f f))$],
    [], [\(MA/m)], [\(pJ/m)], [\(nm)], [\(MJ/m$""^3$)],
    [a1], [$1.58 plus.minus 0.03^b$], [$13 plus.minus 2^b$], [$4.8 plus.minus 0.4^b$], [$0.490 plus.minus 0.02^b$],
    [a2], [$1.74 plus.minus 0.04^b$], [$14 plus.minus 2^b$], [$5.5 plus.minus 0.8^b$], [$0.420 plus.minus 0.03^b$],
    [a3], [$1.14 plus.minus 0.05^b$], [$13 plus.minus 4^a$], [$5.6 plus.minus 0.8^a$], [$0.414 plus.minus 0.001^b$],
    [a4], [$1.20 plus.minus 0.09^b$], [$12 plus.minus 4^a$], [$4.8 plus.minus 0.8^a$], [$0.513 plus.minus 0.002^b$],
    [a5], [$0.90 plus.minus 0.02^b$], [$23 plus.minus 6^a$], [$6.3 plus.minus 0.9^a$], [$0.563 plus.minus 0.005^b$],
    [a6], [$1.42 plus.minus 0.02$], [$20 plus.minus 5^c$], [$5.4 plus.minus 0.9$], [$0.69 plus.minus 0.07$],
  )]
  , caption: [Saturation magnetization $M_s$, Exchange stiffness $A$, Domain wall (DW) width parameter $Delta$, effective anisotropy $K_(upright(e f f))$ for the full sample series of Tab. #ref(<tab:layer_structures>, supplement: none). ]
  , kind: table
  )

#block[
Obtained via measurements in the flow regime as discusses in Sec.@sec:flow_characterization #source-ref(2, <bib:ha_pham_very_2016>)

Obtained from the measurements in Ref.~#source-ref(1, <bib:magni_key_2022>)

Literature value on similar composition stack~#source-ref(3, <bib:Zimmermann2019>)#source-ref(4, <bib:devolder_exchange_2016>)

]
]
= Brillouin light scattering measurements
<sec:BLS>
== DMI evaluation
<dmi-evaluation>
Independent measurements of the interfacial Dzyaloshinskii-Moriya interaction were performed by Brillouin light scattering on samples taken from the same wafers as those used for the domain-wall measurements.

In a typical BLS experiment, a monochromatic laser beam is focused onto the sample surface, and the backscattered light is collected by the same objective and frequency analyzed by a high-resolution spectrometer. BLS measurements were performed in the Damon--Eshbach (DE) geometry by applying an external magnetic field $H$, sufficiently large to magnetize the ferromagnetic film in-plane, and sweeping the spin-wave wave vector $k$ perpendicular to the magnetization direction (Fig. #ref(<fig:BLS_Scheme>, supplement: none)). During the BLS scattering process, magnons can be either created (Stokes process) or annihilated (anti-Stokes process), resulting in a redshift or blueshift of the scattered light relative to the incident beam. In wave-vector space, Stokes and anti-Stokes processes correspond to magnons with opposite wave vectors. In the presence of DMI, the frequency difference between DE modes propagating in opposite direction can be written as:

$ Delta f \( k \) = f_S - f_(A S) = frac(gamma_0 D, pi med M_s) k \, $<eq:BLS_DMI>

where $k$ is the in-plane spin-wave wave vector and $gamma_0$ is the gyromagnetic ratio. The sign of $D$ was assigned using the field, wave-vector, and Stokes/anti-Stokes conventions described below. The BLS measurements probe an area with a lateral dimension of approximately $10$-$40 med mu$m and spin waves with wavelengths of the order of $0.5 med mu$m. The technique therefore provides a spatially averaged measurement that is complementary to domain-wall creep, which is particularly sensitive to disorder and pinning on nanometer length scales.

#figure(image("source/Plots/figura.svg", width: 80.0%),
  caption: [
    Schematic diagram of the BLS interaction setup. The bottom panel shows a typical BLS spectrum in the absence of iDMI (dashed line) and with iDMI (solid line) for negative (left) and positive (right) values of $D$, respectively. Here $k_(upright(i))^(upright(l i g h t))$ denotes the incident light wave numbers, while $H$ and $M$ are the applied in-plane field and magnetization, respectively.
  ]
)
<fig:BLS_Scheme>

== Extraction of chiral damping from the BLS linewidths
<extraction-of-chiral-damping-from-the-bls-linewidths>
The Stokes and anti-Stokes components of each Brillouin-light-scattering spectrum were fitted independently with Lorentzian line shapes. Their linewidths, denoted by $Gamma_(upright(S))$ and $Gamma_(upright(A S))$, characterize the dissipation of counterpropagating spin waves. Following Kim #emph[et al.]~#source-ref(5, <bib:kim_chiral_2024>), the linewidths for the field, magnetization, and wave-vector convention adopted here can be written as

$ Gamma_(upright(S)) = C \( alpha_0 + alpha_c \) \( 1 + r_f \) \, #h(2em) Gamma_(upright(A S)) = C \( alpha_0 - alpha_c \) \( 1 - r_f \) \, $<eq:BLS_linewidth_model> where $C$ is the common wave-vector-even linewidth prefactor, $alpha_0$ is the ordinary Gilbert-damping coefficient, and $alpha_c$ is its wave-vector-odd contribution. The DMI frequency contribution is determined from

$ r_f = frac(\| f_(upright(S)) \| - \| f_(upright(A S)) \|, \| f_(upright(S)) \| + \| f_(upright(A S)) \|) = omega_(upright(D M I)) / omega_0 . $<eq:BLS_frequency_asymmetry> We define the sum and difference of the measured linewidths as

$ Gamma_(+) = Gamma_(upright(S)) + Gamma_(upright(A S)) \, #h(2em) Gamma_(-) = Gamma_(upright(S)) - Gamma_(upright(A S)) . $ Equation~(#ref(<eq:BLS_linewidth_model>, supplement: none)) then gives

$ Gamma_(+) = 2 C \( alpha_0 + r_f alpha_c \) \, #h(2em) Gamma_(-) = 2 C \( alpha_c + r_f alpha_0 \) . $ Eliminating the common prefactor $C$ yields the relative chiral-damping contribution directly:

$ alpha_c / alpha_0 = frac(Gamma_(-) - r_f Gamma_(+), Gamma_(+) - r_f Gamma_(-)) . $<eq:BLS_relative_chiral_damping> This expression removes the DMI-induced contribution.

#block[
#figure(
  align(center)[#table(
    columns: 6,
    align: (left,center,center,center,center,center,),
    [Sample], [$Gamma_(upright(S))$], [$Gamma_(upright(A S))$], [$Delta f_(upright(D M I))$], [$r_f$], [$alpha_c \/ alpha_0$],
    [], [\(GHz)], [\(GHz)], [\(GHz)], [\(-)], [\(%)],
    [a1], [$3.0 plus.minus 0.1$], [$3.0 plus.minus 0.2$], [$0.1 plus.minus 0.3$], [$0.4 plus.minus 0.9$], [$0 plus.minus 4$],
    [a2], [$3.2 plus.minus 0.1$], [$3.0 plus.minus 0.2$], [$0.2 plus.minus 0.2$], [$0.4 plus.minus 0.4$], [$3 plus.minus 4$],
    [a3], [$4.3 plus.minus 0.3$], [$5.5 plus.minus 0.9$], [$- 0.7 plus.minus 0.5$], [$- 2 plus.minus 1$], [$- 11 plus.minus 9$],
    [a4], [$5.0 plus.minus 0.2$], [$7.0 plus.minus 0.5$], [$- 0.9 plus.minus 0.3$], [$- 1.9 plus.minus 0.6$], [$- 15 plus.minus 4$],
    [a5], [$4.6 plus.minus 0.2$], [$7.3 plus.minus 0.7$], [$- 1.9 plus.minus 0.2$], [$- 3.8 plus.minus 0.5$], [$- 20 plus.minus 5$],
    [a6], [$12.1 plus.minus 0.5$], [$13.7 plus.minus 0.7$], [$1.1 plus.minus 0.1$], [$2.8 plus.minus 0.3$], [$- 3 plus.minus 3$],
  )]
  , caption: [Stokes ($Gamma_S$) and anti-Stokes linewidths ($Gamma_(A S)$), fitted DMI frequency splitting $Delta f_(upright(D M I))$, normalized frequency asymmetry $r_f$ and extracted relative chiral damping $alpha_c \/ alpha_0$. ]
  , kind: table
  ) <tab:BLS_chiral_damping>
]
#figure(image("source/Plots/BLS_linewidths_vs_chiral_ratio.svg", width: 100.0%),
  caption: [
    (i) Stokes and anti-Stokes BLS linewidths, $Gamma_(upright(S))$ and $Gamma_(upright(A S))$, for samples a1-a5 and a6. (ii) Relative chiral-damping contribution $alpha_c \/ alpha_0$, obtained after removing the DMI-induced frequency contribution from the measured linewidth asymmetry according to Eq.~(#ref(<eq:BLS_relative_chiral_damping>, supplement: none)).
  ]
)
<fig:placeholder>

= Flow-regime characterization
<sec:flow_characterization>
At sufficiently large driving fields, domain-wall motion is no longer governed by the thermally activated energy barriers characteristic of the creep regime #source-ref(6, <bib:metaxas_creep_2007>). The dynamics of chiral domain walls can instead be described within the two-dimensional framework developed for chiral domain walls #source-ref(2, <bib:ha_pham_very_2016>). Flow-regime measurements therefore provide a reference determination of the DMI that is substantially less sensitive to the pinning and elasticity effects that complicate the interpretation of asymmetric bubble expansion in the creep regime (see Main text).

Flow-regime measurements were performed on all Co-base samples described in Sec.~@sec:samples_a1_a5 (i.e. samples a1-a5). For each sample, two complementary measurements were carried out. First, the DW velocity was measured as a function of the out-of-plane field $H_z$ in order to identify the characteristic Walker or high-velocity plateau regime. From the full velocity measurements (see Fig. #ref(<fig:walker_all_samples>, supplement: none)), the depinning fields were extracted according to the procedure detailed in Ref.#source-ref(7, <bib:Jeudy2016>). Second, the domain-wall velocity was measured as a function of the in-plane field $H_x$ at a fixed out-of-plane driving field $H_z$ within the flow regime.

== DMI constant from the Walker/plateau velocity
<subsec:DMI-constant-from-the-Walker-velocity>
A first and independent estimate of the DMI strength was obtained from the OOP field dependence of the domain-wall velocity plateaus. In systems with sufficiently strong DMI, the conventional velocity drop expected immediately above the Walker field is replaced by an extended high-velocity saturation field region. The characteristic Walker or plateau velocity is related to the DMI constant through #source-ref(2, <bib:ha_pham_very_2016>)#source-ref(8, <bib:garcia_magnetic_2021>)

$ v_W = pi / 2 gamma D / M_s \, $<eq:plateau>

where $v_W$ is the characteristic Walker velocity, $gamma$ is the gyromagnetic ratio, $D$ is the interfacial DMI energy density, and $M_s$ is the saturation magnetization.

The domain-wall velocity was measured as a function of $mu_0 H_z$ for every sample in the a1-a5 series, allowing the corresponding characteristic velocity $v_W$ to be determined. The complete set of measurements is shown in Fig. #ref(<fig:walker_all_samples>, supplement: none). The DMI constants obtained using Eq.~(#ref(<eq:plateau>, supplement: none)) are listed in Table~@tab:Aex.

#figure([#figure([#box(image("source/Plots/velocity_vs_Bz_all_samples.svg")) <fig:walker_velocity>

    ],
    caption: [
    ]
  )
  <fig:walker_velocity>

  #figure([#box(image("source/Plots/lnv_vs_Bz_minus_quarter_all_samples.svg")) <fig:creep_scaling_all_samples>

    ],
    caption: [
    ]
  )
  <fig:creep_scaling_all_samples>

  #figure([#box(image("source/Plots/depinning_fields.svg")) <fig:depinning_fields_all_samples>

    ],
    caption: [
    ]
  )
  <fig:depinning_fields_all_samples>

  ],
  caption: [
    Out-of-plane-field-dependent domain-wall dynamics the $a 1 - a 5$ samples investigated in this work. (a) Domain-wall velocity as a function of $mu_0 H_z$. The characteristic Walker or high-velocity plateau value $v_W$ is used to determine the DMI constant through Eq.~(#ref(<eq:plateau>, supplement: none)). (b) Corresponding creep-law representation, $ln v$ versus $\( mu_0 H_z \)^(- 1 \/ 4)$. (c) Depinning fields $mu_0 H_d$ extracted from the full creep-to-depinning #source-ref(7, <bib:Jeudy2016>) fitting procedure for each sample.
  ]
)
<fig:walker_all_samples>

The DMI constants obtained from the flow-regime velocity measurements are reported in Table~@tab:Aex and compared with the independently determined BLS values in Table~@tab:DMI_comparison. The general agreement between the two techniques supports the DMI values obtained in the creep-regime analysis presented in the main text.

=== Creep characterization of the a6 sample
<creep-characterization-of-the-a6-sample>
We were not able to measure the a6 sample up to the depinning regime as the same setup used for samples a1-a5 was unavailable. To check the validity of the creep regime, we performed low field bubble expansion measurements to confirm the linear scaling of $ln \( v \)$ #source-ref(9, <bib:Lemerle1998>) $ ln \( v \) = v_0 + chi_0 \( mu_0 H_z \)^(- 1 \/ 4) $<eq:creep_law> The results are shown in Fig. #ref(<fig:MAN60_creep>, supplement: none)

#figure([#box(image("source/Plots/MAN60_creep.svg", width: 50.0%))
  .

  ],
  caption: [
    Out-of-plane-field-dependent domain-wall dynamics the a6 sample. The dashed line represents the linear fit of Eq.~(#ref(<eq:creep_law>, supplement: none))
  ]
)
<fig:MAN60_creep>

== DMI field from in-plane-field compensation
<subsec:DMI-field-from-in-plane-field-compensation>
For each sample, asymmetric bubble expansion was measured as a function of the applied in-plane field $mu_0 H_x$, while maintaining the out-of-plane driving field within the flow regime (see Table. #ref(<tab:Aex>, supplement: none)). The velocities of the up-down and down-up portions of the expanding bubble were evaluated independently. The velocity curves exhibit a minimum near the compensation condition at which the applied in-plane field balances the DMI effective field #source-ref(2, <bib:ha_pham_very_2016>)#source-ref(10, <bib:krizakova_study_2019>)#source-ref(8, <bib:garcia_magnetic_2021>), $ H_x = - H_(upright(D M I)) . $<eq:flow_compensation> The flow-regime asymmetric bubble-expansion measurements for all samples are shown in Fig. #ref(<fig:flow_parabolas>, supplement: none). The recorded depinning fields $mu_0 H_d$ for the a1-a5 samples and are reported in Table. #ref(<tab:Aex>, supplement: none) alongside the recorded values of the effective DMI field $mu_0 H_(upright(D M I))$.

#figure([#box(image("source/Plots/velocity_vs_Bx_a1.svg", width: 32.0%)) #box(image("source/Plots/velocity_vs_Bx_a2.svg", width: 32.0%)) #box(image("source/Plots/velocity_vs_Bx_a3.svg", width: 32.0%))

  #box(image("source/Plots/velocity_vs_Bx_a4.svg", width: 32.0%)) #box(image("source/Plots/velocity_vs_Bx_a5.svg", width: 32.0%))

  ],
  caption: [
    Domain-wall velocity measured as a function of the in-plane field $mu_0 H_x$ in the flow regime for samples $a_1$-$a_5$. For each sample, the velocities of the up-down (u/d) and down-up (d/u) portions of the expanding bubble domain are shown separately. The position of the velocity minimum identifies the compensation condition $mu_0 H_x = - mu_0 H_(upright(D M I)) equiv - mu_0 H_(upright(D M I))^(upright(f l o w))$ #source-ref(10, <bib:krizakova_study_2019>).
  ]
)
<fig:flow_parabolas>

== Exchange-stiffness consistency check
<exchange-stiffness-consistency-check>
The two flow-regime measurements described above provide complementary information. The in-plane-field-dependent asymmetric bubble expansion determines the DMI effective field $H_(upright(D M I))$, whereas the out-of-plane-field-dependent velocity provides an independent estimate of the DMI energy density $D$. With the sign convention adopted in this work, the DMI constant and the corresponding effective field are related by

$ D = mu_0 M_s H_(upright(D M I)) Delta \, $<eq:D_HD_relation> where

$ Delta = sqrt(A / K_(upright(e f f))) $<eq:dw_width_flow> is the domain-wall-width parameter. Combining Eqs.~(#ref(<eq:D_HD_relation>, supplement: none)) and (#ref(<eq:dw_width_flow>, supplement: none)) gives

$ A = K_(upright(e f f)) (frac(D, mu_0 M_s H_(upright(D M I))))^2 . $<eq:A_from_flow>

The extraction of $A$ is not the primary purpose of the flow measurements. Nevertheless, Eq.~(#ref(<eq:A_from_flow>, supplement: none)) provides an independent consistency check on the material parameters entering the creep-regime calculations. This is particularly useful in ultrathin multilayers, where direct measurements of the exchange stiffness are experimentally challenging. Conventional approaches determine the exchange stiffness $A$ from the temperature dependence of the saturation magnetization, using Bloch-law or related spin-wave analyses of $M_s \( T \)$ #source-ref(11, <bib:yastremsky_thermodynamics_2019>)#source-ref(12, <bib:kuzmin_exchange_2020>), or from the exchange contribution to spin-wave spectra measured by ferromagnetic resonance, perpendicular standing spin-wave spectroscopy, or Brillouin light scattering #source-ref(4, <bib:devolder_exchange_2016>)#source-ref(13, <bib:waring_exchange_2023>). In ultrathin multilayers, however, these methods can be affected by interface anisotropy, magnetic dead layers, proximity-induced magnetic moments, finite-size effects, and uncertain exchange boundary conditions. Applying Eq.~(#ref(<eq:A_from_flow>, supplement: none)) to the samples of the a1-a5 series provides the exchange-stiffness estimates reported in Table~@tab:Aex.

#block[
#figure(
  align(center)[#table(
    columns: 6,
    align: (left,left,center,left,center,center,),
    [Sample], [$mu_0 H_z$], [$mu_0 H_(upright(D M I))^(upright(f l o w))$], [$mu_0 H_d$], [$D_(upright(W a l k e r))$], [$A$],
    [], [\(mT)], [\(mT)], [\(mT)], [\(mJ/m$""^2$)], [\(pJ/m)],
    [$a 1$], [$40$], [$approx 0$], [$36.7 plus.minus 0.5$], [n.o.], [n.o.],
    [$a 2$], [$40$], [$approx 0$], [$30.22 plus.minus 0.04$], [n.o.], [n.o.],
    [$a 3$], [$50$], [$- 70 plus.minus 7$], [$31.9 plus.minus 0.5$], [$- 0.45 plus.minus 0.05$], [$13 plus.minus 4$],
    [$a 4$], [$50$], [$- 88 plus.minus 9$], [$38.1 plus.minus 0.6$], [$- 0.51 plus.minus 0.05$], [$12 plus.minus 4$],
    [$a 5$], [$100$], [$- 160 plus.minus 16$], [$55.3 plus.minus 0.3$], [$- 0.91 plus.minus 0.09$], [$23 plus.minus 6$],
    [a6], [n.m.], [n.m.], [n.m.], [n.m.], [n.m.],
  )]
  , caption: [ Applied OOP field $mu_0 H_z$, DMI field $mu_0 H_(D M I)^(upright(f l o w))$, depinning field $mu_0 H_d$, DMI constant $D_(upright(W a l k e r))$, and exchange stiffness obtained $A$ from flow-regime domain-wall velocity measurements. The DMI field is determined from the compensation minimum in the in-plane-field-dependent velocity. When a Walker or high-velocity plateau is observed, the DMI constant is obtained from Eq.~(#ref(<eq:plateau>, supplement: none)), and the exchange stiffness is subsequently calculated using Eq.~(#ref(<eq:A_from_flow>, supplement: none)). A relative uncertainty of $10 %$ is assigned to the graphically extracted values of $mu_0 H_(D M I)^(upright(f l o w))$ and $D_(upright(W a l k e r))$. The uncertainty in $A$ additionally includes the propagated uncertainties in $M_s$ and $K_(upright(e f f))$ (see Table. #ref(<tab:layer_structures>, supplement: none)). No Walker plateau was observed for samples $a 1$ and $a 2$, preventing the extraction of $D_(upright(W a l k e r))$ and $A$ by this procedure. No flow-regime measurements were performed on the a6 sample. Here, n.o. denotes "not observed" and n.m. denotes "not measured". ]
  , kind: table
  ) <tab:Aex>
]

== Effect of chiral damping in the precessional regime
<effect-of-chiral-damping-in-the-precessional-regime>
We consider the one-dimensional precessional dynamics with an angle-dependent damping $ alpha \( phi.alt \) = alpha_0 (1 + eta cos phi.alt) \, #h(2em) #scale(x: 240%, y: 240%)[\|] alpha_c / alpha_0 #scale(x: 240%, y: 240%)[\|] equiv \| eta \| < 1 . $ The deviation from the DMI compensation field is defined as $ X = H_x + H_(upright(D M I)) \, $ so that the compensation point corresponds to $X = 0$. The internal torque entering the $q$-$phi.alt$ equations is written as $ G \( phi.alt \, X \) = H_K^(D W) / 2 sin 2 phi.alt + frac(pi X, 2) cos phi.alt . $ The cycle-averaged drift velocity is $ chevron.l v chevron.r = gamma Delta J / I \, $<eq:prec_vel> where $ I = integral_0^(2 pi) frac(1 + alpha \( phi.alt \)^2, H_z - alpha \( phi.alt \) G \( phi.alt \, X \)) thin d phi.alt \, $ and $ J = integral_0^(2 pi) frac(alpha \( phi.alt \) H_z + G \( phi.alt \, X \), H_z - alpha \( phi.alt \) G \( phi.alt \, X \)) thin d phi.alt . $ To perform the asymptotic expansion, we introduce the dimensionless parameters $ xi = frac(alpha_0 H_K^(D W), 2 H_z) \, #h(2em) rho = frac(pi X, 2 H_z) \, $ so that $ frac(G \( phi.alt \, X \), H_z) = xi / alpha_0 sin 2 phi.alt + rho cos phi.alt . $ Multiplying the denominator integral by $H_z$, we define $macron(I) = H_z I$, giving $ chevron.l v chevron.r = gamma Delta H_z J / macron(I) . $ The integrands are expanded simultaneously in the small parameters $rho$, $eta$ and $xi$. After integration over one full precessional cycle, all terms linear in $xi$ vanish by symmetry, yielding $ macron(I) = 2 pi \( 1 + alpha_0^2 \) #scale(x: 300%, y: 300%)[\[] & 1 + xi^2 / 2 + frac(alpha_0 \( 1 + 3 alpha_0^2 \), 2 \( 1 + alpha_0^2 \)) eta rho + alpha_0^2 / 2 rho^2\
 & + frac(3 alpha_0 \( 3 + 5 alpha_0^2 \), 4 \( 1 + alpha_0^2 \)) eta rho xi^2 + frac(3 alpha_0^2, 2) rho^2 xi^2 med + cal(O) (eta^2 \, eta rho^2 \, rho^3 \, xi^4) #scale(x: 300%, y: 300%)[\]] \, $ and $ J = & 2 pi alpha_0 #scale(x: 300%, y: 300%)[\[] 1 + frac(1 + alpha_0^2, 2 alpha_0^2) xi^2 + alpha_0 eta rho + frac(1 + alpha_0^2, 2) rho^2\
 & + frac(3 \( 1 + 2 alpha_0^2 \), 2 alpha_0) eta rho xi^2 + frac(3 \( 1 + alpha_0^2 \), 2) rho^2 xi^2 med + cal(O) (eta^2 \, eta rho^2 \, rho^3 \, xi^4) #scale(x: 300%, y: 300%)[\]] . $ Series division then gives $ chevron.l v chevron.r = gamma Delta H_z frac(alpha_0, 1 + alpha_0^2) #scale(x: 300%, y: 300%)[\[] 1 + frac(xi^2, 2 alpha_0^2) + rho^2 / 2 + rho^2 xi^2 med + frac(alpha_0 \( 1 - alpha_0^2 \), 2 \( 1 + alpha_0^2 \)) eta rho\
+ frac(5 + 5 alpha_0^2 - 2 alpha_0^4, 4 alpha_0 \( 1 + alpha_0^2 \)) eta rho xi^2 med + cal(O) (eta^2 \, eta rho^2 \, rho^3 \, xi^4) #scale(x: 300%, y: 300%)[\]] . $ The position of the extremum is obtained from $ frac(partial chevron.l v chevron.r, partial rho) = 0 . $ Differentiating the expanded velocity gives $ \( 1 + 2 xi^2 \) rho_min + eta [frac(alpha_0 \( 1 - alpha_0^2 \), 2 \( 1 + alpha_0^2 \)) + frac(5 + 5 alpha_0^2 - 2 alpha_0^4, 4 alpha_0 \( 1 + alpha_0^2 \)) xi^2] = 0 . $ which gives $ rho_min = - eta frac(frac(alpha_0 \( 1 - alpha_0^2 \), 2 \( 1 + alpha_0^2 \)) + frac(5 + 5 alpha_0^2 - 2 alpha_0^4, 4 alpha_0 \( 1 + alpha_0^2 \)) xi^2, 1 + 2 xi^2) . $ Since the numerator and denominator have been calculated only up to second order in $xi$, their ratio must be consistently re-expanded to the same order. This yields $ rho_min - eta [frac(alpha_0 \( 1 - alpha_0^2 \), 2 \( 1 + alpha_0^2 \)) + frac(5 + alpha_0^2 + 2 alpha_0^4, 4 alpha_0 \( 1 + alpha_0^2 \)) xi^2] + cal(O) (eta^2 \, eta xi^4) . $ Finally, using $ rho = frac(pi X, 2 H_z) \, #h(2em) xi = frac(alpha_0 H_K^(D W), 2 H_z) \, $ the displacement of the minimum from the DMI compensation field is $ \( H_x^star.op \)_(f l o w) & = - H_(upright(D M I)) + frac(alpha_0 H_z, pi) frac(eta, 1 + alpha_0^2) [1 - alpha_0^2 + frac(5 + alpha_0^2 + 2 alpha_0^4, 8) (H_K^(D W) / H_z)^2] + cal(O) . $ For $alpha_0 lt.double 1$, this simplifies to the expressions used in the main text (Eq.~(17)) $ \( H_x^star.op \)_(f l o w) tilde.eq - H_(upright(D M I)) + frac(eta alpha_0 H_z, pi) [1 + 5 / 8 (H_K^(D W) / H_z)^2] . $<eq:min_shift_flow> In Fig. #ref(<fig:2_1>, supplement: none) we report both the minimum obtained numerically from Eq.(#ref(<eq:prec_vel>, supplement: none)) and the analytical estimate of Eq.(#ref(<eq:min_shift_flow>, supplement: none)).

#figure(image("source/Plots/flow_shifts_2.svg", width: 100.0%),
  caption: [
    Difference between the minimum of the domain-wall velocity in the flow regime and the DMI effective field $mu_0 delta H_x^(upright(m i n)) = mu_0 \[ \( H_x^star.op \)_(f l o w) + H_(upright(D M I)) \]$ as computed via the full numerical minimum of Eq.~(#ref(<eq:prec_vel>, supplement: none)) and the analytical estimate Eq.~(#ref(<eq:min_shift_flow>, supplement: none)). The magnetic parameters used in the calculation are from the $upright(P t \/ C o) \/ X$ series. We set Gilbert damping $alpha_0 = 0.05$ and $mu_0 H_z = 120$ mT for all samples. The selected $H_z$ field ensures correspondence with the precessional flow regime in all samples. See Tab. #ref(<tab:Aex>, supplement: none) for the depinning field analysis of the $upright(P t \/ C o) \/ X$ series)
  ]
)
<fig:2_1>

= Derivation of the three-amplitude model
<sec:SI_three_amplitude_derivation>
In this section, we derive the symmetry-decomposed model used in the main text. We start from a creep-velocity Ansatz of the form $ v \( H_x \, H_z \) = v_star.op frac(sigma_(upright(e q)) \( H_x \)^beta, alpha_(upright(e f f)) \( H_x \)) exp [- chi_0 (frac(tilde(sigma) \( H_x \), tilde(sigma) \( 0 \)))^(1 \/ 4) H_z^(- 1 \/ 4)] . $<eq:SI_creep_ansatz> Here, $v_star.op$ is a field-independent attempt-frequency prefactor, $sigma_(upright(e q)) \( H_x \)$ is the equilibrium domain-wall energy density, and $tilde(sigma) \( H_x \)$ is the domain-wall stiffness in the long-wavelength limit #source-ref(14, <bib:pellegren_dispersive_2017>)#source-ref(15, <bib:lau_disentangling_2018>). $ tilde(sigma) \( theta \) = sigma_(upright(e q)) \( theta \) + frac(partial^2 sigma_(upright(e q)), partial theta^2) \( theta \) \, #h(2em) sigma_(upright(e q)) \( theta \) = min_phi.alt sigma \( theta \, phi.alt \) . $<eq:SI_stiffness> The quantity $chi_0$ is the creep scaling parameter at $H_x = 0$, whereas $beta$ is an effective exponent describing the dependence of the velocity prefactor on the equilibrium wall energy #source-ref(15, <bib:lau_disentangling_2018>). It should not be confused with the reduced in-plane field $beta_x$ introduced below. Taking the natural logarithm of the velocity normalized at $H_x = 0$ gives $ ln [frac(v \( H_x \, H_z \), v \( 0 \, H_z \))] & = beta ln [frac(sigma_(upright(e q)) \( H_x \), sigma_(upright(e q)) \( 0 \))] + ln [frac(alpha_(upright(e f f)) \( 0 \), alpha_(upright(e f f)) \( H_x \))]\
 & quad - chi_0 H_z^(- 1 \/ 4) [(frac(tilde(sigma) \( H_x \), tilde(sigma) \( 0 \)))^(1 \/ 4) - 1] . $<eq:SI_lnv_exact> For compactness, we define the relative variations $ delta sigma_(upright(e q)) \( H_x \) equiv frac(sigma_(upright(e q)) \( H_x \) - sigma_(upright(e q)) \( 0 \), sigma_(upright(e q)) \( 0 \)) \, #h(2em) delta tilde(sigma) \( H_x \) equiv frac(tilde(sigma) \( H_x \) - tilde(sigma) \( 0 \), tilde(sigma) \( 0 \)) . $<eq:SI_relative_variations> Equation~(#ref(<eq:SI_lnv_exact>, supplement: none)) can then be expressed as $ ln [frac(v \( H_x \, H_z \), v \( 0 \, H_z \))] & = beta ln [1 + delta sigma_(upright(e q)) \( H_x \)] + ln [frac(alpha_(upright(e f f)) \( 0 \), alpha_(upright(e f f)) \( H_x \))]\
 & quad - chi_0 [(1 + delta tilde(sigma) \( H_x \))^(1 \/ 4) - 1] H_z^(- 1 \/ 4) . $<eq:SI_lnv_variations> Considering the experimentally accessible IP field ranges is asymmetric bubble domain expansions ($\| mu_0 H_x \| lt.eq 200$ mT) we assume small in-plane-field-induced variations, $ lr(|delta sigma_(upright(e q)) \( H_x \)|) lt.double 1 \, #h(2em) lr(|delta tilde(sigma) \( H_x \)|) lt.double 1 \, $ Since direct evaluation of $tilde(sigma) \( H_x \) \/ tilde(sigma) \( 0 \)$, accounting for both mixed and saturated zero-field configurations, shows that the first-order fourth-root expansion is accurate to better than $0.3 %$ for samples a2--a5 over their respective experimental field ranges. Sample a1 provides the most restrictive case, with a maximum error of approximately 3.6 %. With the mentioned assumption, we obtain $ ln [frac(v \( H_x \, H_z \), v \( 0 \, H_z \))] & tilde.eq beta [frac(sigma_(upright(e q)) \( H_x \), sigma_(upright(e q)) \( 0 \)) - 1] + ln [frac(alpha_(upright(e f f)) \( 0 \), alpha_(upright(e f f)) \( H_x \))]\
 & quad - C_z [frac(tilde(sigma) \( H_x \), tilde(sigma) \( 0 \)) - 1] \, $<eq:SI_lnv_linearized> where $ C_z = frac(chi_0 H_z^(- 1 \/ 4), 4) . $<eq:SI_Cz> To retain the correct normalizations of the two energy-dependent terms, we define $ S_0 equiv frac(sigma_(upright(e q)) \( 0 \), sigma_0) \, #h(2em) T_0 equiv frac(tilde(sigma) \( 0 \), sigma_0) \, $<eq:SI_S0T0> where $ sigma_0 = 4 sqrt(A K_(upright(e f f))) $ is the Bloch-wall energy density. Equation~(#ref(<eq:SI_lnv_linearized>, supplement: none)) then becomes $ ln [frac(v \( H_x \, H_z \), v \( 0 \, H_z \))] & tilde.eq beta [frac(sigma_(upright(e q)) \( H_x \) \/ sigma_0, S_0) - 1] + ln [frac(alpha_(upright(e f f)) \( 0 \), alpha_(upright(e f f)) \( H_x \))]\
 & quad - C_z [frac(tilde(sigma) \( H_x \) \/ sigma_0, T_0) - 1] . $<eq:SI_lnv_ST> The two reference values $S_0$ and $T_0$ are generally different: the prefactor contribution is normalized by the equilibrium wall energy at $H_x = 0$, whereas the activation-barrier contribution is normalized by the stiffness at $H_x = 0$. We introduce the dimensionless quantities $ zeta = frac(pi mu_0 M_s Delta H_(upright(D M I)), sigma_0) \, #h(2em) beta_x = frac(pi mu_0 M_s Delta H_x, sigma_0) \, #h(2em) kappa = frac(pi mu_0 M_s Delta H_K^(upright(D W)), 2 sigma_0) . $<eq:SI_reduced_parameters> In terms of these quantities, the domain-wall energy density is $ sigma \( theta \, phi.alt \) = sigma_0 [1 - zeta cos \( phi.alt - theta \) - beta_x cos phi.alt + kappa cos^2 \( phi.alt - theta \)] . $<eq:SI_dw_energy_reduced> For notational compactness, we introduce $ X = H_x + H_(upright(D M I)) . $<eq:SI_shifted_field> The reference axis for all the subsequent symmetry decompositions of the velocity curve is therefore $X = 0$, while the mixed Bloch-Néel region corresponds to $ \| X \| lt.eq H_K^(upright(D W)) . $ For the right-hand side of the expanding bubble, we set $theta = 0$. Minimizing Eq.~(#ref(<eq:SI_dw_energy_reduced>, supplement: none)) with respect to $phi.alt$ gives $ cos phi.alt_(upright(e q)) = cases(delim: "{", - 1 \, & X < - H_K^(upright(D W)) \,, X / H_K^(upright(D W)) \, & \| X \| lt.eq H_K^(upright(D W)) \,, 1 \, & X > H_K^(upright(D W)) .) $<eq:SI_phi_eq> The corresponding equilibrium wall energy is $ frac(sigma_(upright(e q)) \( X \), sigma_0) = cases(delim: "{", 1 + kappa - 2 kappa frac(\| X \|, H_K^(upright(D W))) \, & \| X \| > H_K^(upright(D W)) \,, 1 - kappa (X / H_K^(upright(D W)))^2 \, & \| X \| lt.eq H_K^(upright(D W)) .) $<eq:SI_sigma_eq> It is therefore symmetric around the compensation axis: $ sigma_(upright(e q)) \( X \) = sigma_(upright(e q)) \( - X \) . $<eq:SI_sigma_symmetry> Consequently, the equilibrium-energy contribution to the velocity prefactor contributes only to the symmetric part of the creep curve. Using Eq.~(#ref(<eq:SI_stiffness>, supplement: none)), the symmetric part of the stiffness is $ frac(tilde(sigma)_S \( X \), sigma_0) = cases(delim: "{", 1 - kappa - 2 kappa frac(\| X \|, H_K^(upright(D W))) \, & \| X \| > H_K^(upright(D W)) \,, 1 + 2 kappa - 5 kappa (X / H_K^(upright(D W)))^2 \, & \| X \| lt.eq H_K^(upright(D W)) \,) $<eq:SI_stiffness_symmetric> whereas its antisymmetric part is $ frac(tilde(sigma)_A \( X \), sigma_0) = cases(delim: "{", zeta thin upright(s g n) \( X \) \, & \| X \| > H_K^(upright(D W)) \,, zeta X / H_K^(upright(D W)) \, & \| X \| lt.eq H_K^(upright(D W)) .) $<eq:SI_stiffness_antisymmetric> The normalization point $H_x = 0$ corresponds to $X = H_(upright(D M I))$. The normalization constants are therefore obtained by evaluating the full equilibrium energy and stiffness at this point: $ S_0 = frac(sigma_(upright(e q)) \( X \), sigma_0)\|_(X = H_(upright(D M I))) \, #h(2em) T_0 = frac(tilde(sigma) \( X \), sigma_0)\|_(X = H_(upright(D M I))) . $<eq:SI_S0T0_evaluation> Explicitly, $ S_0 = cases(delim: "{", 1 + kappa - 2 kappa frac(\| H_(upright(D M I)) \|, H_K^(upright(D W))) \, & \| H_(upright(D M I)) \| > H_K^(upright(D W)) \,, 1 - kappa (H_(upright(D M I)) / H_K^(upright(D W)))^2 \, & \| H_(upright(D M I)) \| lt.eq H_K^(upright(D W)) \,) $<eq:SI_S0_explicit> and $ T_0 = cases(delim: "{", 1 - kappa - 2 kappa frac(\| H_(upright(D M I)) \|, H_K^(upright(D W))) + zeta thin upright(s g n) \( H_(upright(D M I)) \) \, & \| H_(upright(D M I)) \| > H_K^(upright(D W)) \,, 1 + 2 kappa - 5 kappa (H_(upright(D M I)) / H_K^(upright(D W)))^2 + zeta H_(upright(D M I)) / H_K^(upright(D W)) \, & \| H_(upright(D M I)) \| lt.eq H_K^(upright(D W)) .) $<eq:SI_T0_explicit> The effective damping is written as $ alpha_(upright(e f f)) \( phi.alt \) = alpha_0 [1 + s eta cos phi.alt] \, $<eq:SI_alpha_eff> where $s = plus.minus 1$ labels the two domain-wall chiralities and $eta$ is the relative chiral-damping strength #source-ref(16, <bib:akosa_phenomenology_2016>)#source-ref(17, <bib:akosa_decoupling_2024>). Expanding the logarithmic damping contribution to second order in $eta$ gives $ ln [frac(alpha_(upright(e f f)) \( 0 \), alpha_(upright(e f f)) \( X \))] & = upright(c o n s t .) - s eta cos phi.alt_(upright(e q)) + eta^2 / 2 cos^2 phi.alt_(upright(e q)) + O \( eta^3 \) . $<eq:SI_damping_expansion> The first-order term is antisymmetric in $X$, whereas the second-order term is symmetric. Since $s = plus.minus 1$ is a convention-dependent chirality label, we absorb the minus sign in the linear term into the definition of $s$ from this point onward. With the convention used in the main text, the linear contribution to the antisymmetric amplitude is therefore written as $s eta$. Collecting all symmetric contributions, and removing one common field-independent offset, symmetric part of the function can be written as $ \( ln v \)_S \( X \) = cases(delim: "{", nu_1 \( H_K^(upright(D W)) \)^2 - nu_3 (X + H_K^(upright(D W))) \, & X < - H_K^(upright(D W)) \,, nu_1 X^2 \, & \| X \| lt.eq H_K^(upright(D W)) \,, nu_1 \( H_K^(upright(D W)) \)^2 + nu_3 (X - H_K^(upright(D W))) \, & X > H_K^(upright(D W)) .) $<eq:SI_lnv_symmetric> The antisymmetric part is $ \( ln v \)_A \( X \) = cases(delim: "{", - nu_2 \, & X < - H_K^(upright(D W)) \,, nu_2 X / H_K^(upright(D W)) \, & \| X \| lt.eq H_K^(upright(D W)) \,, nu_2 \, & X > H_K^(upright(D W)) .) $<eq:SI_lnv_antisymmetric> The three amplitudes appearing in Eqs.~(#ref(<eq:SI_lnv_symmetric>, supplement: none)) and (#ref(<eq:SI_lnv_antisymmetric>, supplement: none)) are $ nu_1 & = frac(1, \( H_K^(upright(D W)) \)^2) [- frac(beta kappa, S_0) + frac(5 C_z kappa, T_0) + eta^2 / 2] \,\
nu_2 & = s eta - frac(zeta C_z, T_0) \,\
nu_3 & = frac(2 kappa, H_K^(upright(D W))) [C_z / T_0 - beta / S_0] . $<eq:SI_nu1> Thus, $nu_1$ has units of T$""^(- 2)$, $nu_2$ is dimensionless, and $nu_3$ has units of T$""^(- 1)$. Dimensionless versions of the amplitudes can be derived by multiplying the values obtained from the fit by the DW anisotropy field $macron(nu)_1 = \( H_K^(D W) \)^2 nu_1 thin \, macron(nu)_2 = nu_2 thin \, thin macron(nu)_3 = H_K^(D W) nu_3$. A complete set of the dimensionless fitting amplitudes $macron(nu)_(1 dots.h.c 3)$ is reported in Table. #ref(<tab:three_amplitude_parameters>, supplement: none). Equations~(#ref(<eq:SI_lnv_symmetric>, supplement: none)) and (#ref(<eq:SI_lnv_antisymmetric>, supplement: none)) define the symmetric and antisymmetric shape functions about the compensation axis $X = 0$, with their vertical origin chosen such that both shape functions vanish at $X = 0$. No independent vertical-offset parameter is introduced in the fit.

The experimental and calculated velocity curves are instead normalized at $H_x = 0$. Defining the total symmetry-centered shape as

$ F \( X \) = \( ln v \)_S \( X \) + \( ln v \)_A \( X \) \, $<eq:SI_total_shape> the function compared with the normalized experimental velocity is $ ln [frac(v \( H_x \, H_z \), v \( 0 \, H_z \))]_(upright(m o d e l)) = F (H_x + H_(upright(D M I))) - F (H_(upright(D M I))) . $<eq:SI_model_normalization> Indeed, at the experimental normalization point $H_x = 0$, the shifted field is $X = H_(upright(D M I))$, and therefore $ ln [frac(v \( H_x \, H_z \), v \( 0 \, H_z \))]_(upright(m o d e l))\|_(H_x = 0) = F \( H_(upright(D M I)) \) - F \( H_(upright(D M I)) \) = 0 . $<eq:SI_model_zero> The term $F \( H_(upright(D M I)) \)$ is a single parameter-dependent constant evaluated at the normalization point. It is recalculated for each trial set of fitting parameters, but it does not constitute an additional fit parameter. In particular, it does not modify the amplitudes $nu_1$, $nu_2$, or $nu_3$: it only fixes the vertical origin of the complete model. Since a field-independent constant is symmetric under the transformation $X arrow.r - X$, the strict symmetry decomposition of the normalized curve may equivalently be written as $ (ln frac(v, v \( 0 \)))_S & = \( ln v \)_S \( X \) - F \( H_(upright(D M I)) \) \,\
(ln frac(v, v \( 0 \)))_A & = \( ln v \)_A \( X \) . $<eq:SI_normalized_symmetric> Thus, the normalization affects only the constant level of the symmetric component. It does not alter the symmetric curvature $nu_1$, the high-field slope $nu_3$, the antisymmetric amplitude $nu_2$, or the position of the velocity minimum. In the mixed Bloch-Néel region, the field-dependent part of the velocity is $ ln [frac(v \( H_x \, H_z \), v \( 0 \, H_z \))] = upright(c o n s t .) + nu_1 X^2 + nu_2 X / H_K^(upright(D W)) \, #h(2em) X = H_x + H_(upright(D M I)) . $<eq:SI_mixed_branch> The apparent minimum is therefore located at $ \( H_x^star.op \)_(c r e e p) = - H_(upright(D M I)) - frac(nu_2, 2 nu_1 H_K^(upright(D W))) . $<eq:SI_apparent_minimum> Equation~(#ref(<eq:SI_apparent_minimum>, supplement: none)) applies provided that the stationary point remains inside the mixed Bloch-Néel region and is a minimum: $ lr(|frac(nu_2, 2 nu_1 H_K^(upright(D W)))|) lt.eq H_K^(upright(D W)) \, #h(2em) nu_1 > 0 . $<eq:SI_minimum_conditions>

== Normalization regimes
<sec:SI_normalization_regimes>
When the normalization point $H_x = 0$ lies in either saturated Néel branch, $\| zeta \| > 2 kappa$, one has $ S_0 = 1 + kappa - \| zeta \| \, #h(2em) T_0 = 1 - kappa . $<eq:SI_normalization_saturated> For the positive saturated branch, $zeta > 2 kappa$, this reduces to $S_0 = 1 - zeta + kappa$. The corresponding coefficients are $ nu_1 \( H_K^(upright(D W)) \)^2 & = - frac(beta kappa, 1 + kappa - \| zeta \|) + frac(5 C_z kappa, 1 - kappa) + eta^2 / 2 \,\
nu_2 & = s eta - frac(zeta C_z, 1 - kappa) \,\
nu_3 H_K^(upright(D W)) & = 2 kappa [frac(C_z, 1 - kappa) - frac(beta, 1 + kappa - \| zeta \|)] . $<eq:SI_nu1_saturated> If instead the normalization point lies inside the mixed Bloch-Néel region, $\| zeta \| lt.eq 2 kappa$, then $ S_0 = 1 - frac(zeta^2, 4 kappa) \, #h(2em) T_0 = 1 + 2 kappa - frac(3 zeta^2, 4 kappa) . $<eq:SI_normalization_mixed> The coefficients become $ nu_1 \( H_K^(upright(D W)) \)^2 & = - frac(beta kappa, 1 - frac(zeta^2, 4 kappa)) + frac(5 C_z kappa, 1 + 2 kappa - frac(3 zeta^2, 4 kappa)) + eta^2 / 2 \,\
nu_2 & = s eta - frac(zeta C_z, 1 + 2 kappa - frac(3 zeta^2, 4 kappa)) \,\
nu_3 H_K^(upright(D W)) & = 2 kappa [frac(C_z, 1 + 2 kappa - frac(3 zeta^2, 4 kappa)) - frac(beta, 1 - frac(zeta^2, 4 kappa))] . $<eq:SI_nu1_mixed>

== Additional fits and full dataset
<additional-fits-and-full-dataset>
The complete three-amplitude fits for all investigated samples are shown in Fig. #ref(<fig:full_fits>, supplement: none), while the corresponding fitting parameters are summarized in Table~@tab:three_amplitude_parameters. The parameter $H_K^(D W)$ is treated as an effective crossover field delimiting the central mixed Bloch-Néel region, rather than as a direct measurement of the microscopic domain-wall anisotropy field. Its extraction is most reliable when the experimental range samples both crossover boundaries, $H_x = - H_(upright(D M I)) plus.minus H_K^(D W)$, together with sufficient data in the outer branches. When one or both boundaries lie outside the accessible field range, $H_K^(D W)$ becomes correlated with $H_(upright(D M I))$ and the fitted amplitudes and is consequently more sensitive to the imposed bounds. In these cases, independently calculated magnetic parameters provide a useful physical constraint, but the resulting DMI field should be interpreted in light of the limited transition coverage.

A useful check for the model validity is provided by comparing the DMI values discrepancy and the predicted shift of Eq.(11) in the main text. As can be seen in Fig. #ref(<fig:dmi_discrepancy_dual_axis>, supplement: none), there is a clear correlation between the discrepancy of the DMI values $\| Delta D \|$ (see Table. #ref(<tab:DMI_comparison>, supplement: none)) and the factor $nu_2 \/ \( 2 nu_1 H_K^(D W) \)$ which quantifies the displacement of the DMI field from the velocity curve minimum.

#figure(image("source/Plots/full_fits.svg", width: 90.0%),
  caption: [
    Complete sample series fits with the three amplitude model of Eqs.~(6-7) performed on the normalized velocity $ln \( v \( H_x \) \/ v \( 0 \) \)$. Panels i)-v) show the fits for samples a1-a5 while panel vi) shows the fit of sample a6. The red line represent the full fitted curve, while the blue and orange dashed lines represent the symmetric and antisymmetric components respectively. The vertical dashed line represents the fitted $mu_0 H_(D M I)^(upright(n e w))$ field reported in Table. #ref(<tab:three_amplitude_parameters>, supplement: none). The shaded region displays the mixed Bloch-Néel transition region.
  ]
)
<fig:full_fits>

#figure(image("source/Plots/dmi_discrepancy_dual_axis.svg", width: 70.0%),
  caption: [
    Comparison of the DMI discrepancy between BLS and conventional creep-regime measurements (left axis) with the fitted shift scale $nu_2 \/ \( 2 nu_1 H_K^(upright(D W)) \)$ (right axis). Here, $H_K^(upright(D W))$ denotes the crossover field between mixed Bloch--Néel and saturated Néel domain-wall configurations. Error bars represent propagated uncertainties; lines are guides to the eye.
  ]
)
<fig:dmi_discrepancy_dual_axis>

#block[
#figure(
  align(center)[#table(
    columns: 8,
    align: (left,left,center,center,center,center,center,center,),
    [Sample], [$mu_0 H_z$], [$macron(nu)_1$], [$macron(nu)_2$], [$macron(nu)_3$], [$mu_0 H_(K \, upright(f i t))^(D W)$], [$mu_0 H_(upright(D M I))^(upright(n e w))$], [$mu_0 H_(upright(D M I))^(upright(f l o w))$],
    [], [\(mT)], [\($-$)], [\($-$)], [\($-$)], [\(mT)], [\(mT)], [\(mT)],
    [$a 1$], [12.6], [$1.0 plus.minus 0.2$], [$0.94 plus.minus 0.05$], [$0.78 plus.minus 0.08$], [$15 plus.minus 1$], [$- 2 plus.minus 1$], [$approx 0$],
    [$a 2$], [11.2], [$7 plus.minus 2$], [$0.14 plus.minus 0.09$], [$4.1 plus.minus 0.5$], [$40 plus.minus 4$], [$4 plus.minus 2$], [$approx 0$],
    [$a 3$], [10.5], [$0.7 plus.minus 0.1$], [$0.69 plus.minus 0.03$], [$0.83 plus.minus 0.06$], [$55 plus.minus 4$], [$- 62 plus.minus 2$], [$- 70 plus.minus 7$],
    [$a 4$], [12.4], [$0.37 plus.minus 0.07$], [$0.36 plus.minus 0.03$], [$0.37 plus.minus 0.03$], [$62 plus.minus 5$], [$- 69 plus.minus 5$], [$- 88 plus.minus 9$],
    [$a 5$], [35], [$1.3 plus.minus 0.2$], [$2.36 plus.minus 0.08$], [$0.71 plus.minus 0.04$], [$70 plus.minus 3$], [$- 144 plus.minus 4$], [$- 160 plus.minus 16$],
    [a6], [20], [$0.7 plus.minus 0.2$], [$0.22 plus.minus 0.08$], [$1.5 plus.minus 0.2$], [$113 plus.minus 13$], [$88 plus.minus 7$], [n.m.],
  )]
  , caption: [ Fitting parameters obtained from the three-amplitude creep model. We report the applied bubble expansion fields $mu_0 H_z$, the dimensionless amplitudes $macron(nu)_(1 dots.h 3)$, the fitted crossover field $mu_0 H_(K \, upright(f i t))^(D W)$, and the fitted DMI effective field $mu_0 H_(upright(D M I))^(upright(n e w))$. The uncertainties in $macron(nu)_1$ and $macron(nu)_3$ include the propagated uncertainty in $mu_0 H_(K \, upright(f i t))^(D W)$, assuming the fitted quantities are statistically independent. We also include the effective DMI field measured in the flow regime $mu_0 H_(upright(D M I))^(upright(f l o w))$ (see #ref(<subsec:DMI-field-from-in-plane-field-compensation>)) for comparison. ]
  , kind: table
  ) <tab:three_amplitude_parameters>
]
#heading(level: 2, numbering: none)[Smoothing procedure and bootstrap uncertainty]
<sec:bootstrap>
The fitting procedure used to extract $H_(upright(D M I))$ from the creep-regime velocity curves is based on the three-amplitude model derived above. In this model the logarithmic velocity is written as the sum of a symmetric and an antisymmetric contribution with respect to the shifted field coordinate $ X = H_x + H_(upright(D M I)) . $ The ideal analytical form contains piecewise branches separated by the boundaries $ X = plus.minus H_K^(D W) \, $ which delimit the mixed Bloch-Néel region. While this piecewise form is useful for identifying the physical origin of the different contributions, the sharp transition at the boundaries can make numerical error estimation unstable. In particular, small changes of the fitting parameters can move experimental points across the boundary between branches, producing a non-smooth local optimization landscape. To avoid this purely numerical instability, the antisymmetric contribution was regularized by replacing the sharp transition between the central linear branch and the saturated outer branches with a smooth interpolation. The unsmoothed form is $ \( ln v \)_A = cases(delim: "{", - nu_2 \, & X < - H_K^(D W) \,, nu zws_2 X \/ H_K^(D W) \, & \| X \| lt.eq H_K^(D W) \,, nu_2 \, & X > H_K^(D W) .) $ In the numerical implementation, the three branches were blended using smooth switching functions of the form $ S_plus.minus \( X \) = 1 / 2 [1 + tanh (frac(plus.minus X - H_K^(D W), w))] \, $ where $w$ is a fixed smoothing width. The smoothed antisymmetric contribution can then be written schematically as $ \( ln v \)_A^(upright(s m o o t h)) = S_(-) \( X \) \( - nu_2 \) + [1 - S_(-) \( X \) - S_(+) \( X \)] nu_2 X / H_K^(D W) + S_(+) \( X \) nu_2 . $ The smoothing width was kept small compared with the field scale over which the velocity varies and was not treated as a free fitting parameter. Its role is only to regularize the branch boundaries for numerical minimization and uncertainty estimation.

Parameter uncertainties were estimated using a residual bootstrap. First, the model was fitted to the experimental data, yielding the best-fit parameter vector $ hat(theta) = (H_(upright(D M I)) \, nu_1 \, nu_2 \, nu_3 \, H_K^(D W)) . $ The fitted values are $ hat(y)_i = f \( H_(x \, i) \; hat(theta) \) \, $ where $y_i = ln v_i$, and the residuals are $ r_i = y_i - hat(y)_i . $ A synthetic bootstrap dataset was generated by sampling the residuals with replacement, $ y_i^(*) = hat(y)_i + r_i^(*) \, $ where each $r_i^(*)$ is randomly drawn from the original residual set. The model was then refitted to each synthetic dataset, producing a bootstrap parameter vector $theta^(*)$. Repeating this procedure $N_(upright(b o o t))$ times gives an ensemble $ {theta_1^(*) \, theta_2^(*) \, dots.h \, theta_(N_(upright(b o o t)))^(*)} . $ The statistical uncertainty of each fitted parameter was estimated from the spread of this ensemble. For the DMI field, we report $ u \( H_(upright(D M I)) \) = upright(s t d) (H_(upright(D M I) \, 1)^(*) \, H_(upright(D M I) \, 2)^(*) \, dots.h \, H_(upright(D M I) \, N_(upright(b o o t)))^(*)) . $ Since the bootstrap distribution was approximately symmetric, this standard deviation was used as the one-sigma statistical uncertainty. The quoted uncertainty should therefore be interpreted as the statistical fitting uncertainty within the adopted smoothed three-amplitude model.

== Uncertainty estimation of D
<uncertainty-estimation-of-d>
The uncertainty in the $D$ value is then obtained through standard uncertainty propagation of the relevant physical quantities through the formula $D = mu_0 M_s Delta H_(upright(D M I))$, i.e. $ u \( D \) = \| D \| sqrt(#scale(x: 240%, y: 240%)[\[] frac(u \( M_s \), M_s) #scale(x: 240%, y: 240%)[\]]^2 + #scale(x: 240%, y: 240%)[\[] frac(u \( Delta \), Delta) #scale(x: 240%, y: 240%)[\]]^2 + #scale(x: 240%, y: 240%)[\[] frac(u \( H_(upright(D M I)) \), H_(upright(D M I))) #scale(x: 240%, y: 240%)[\]]^2) . $ Given the rather complex ensemble of experimental data, we summarize here the source of all the relevant quantities for each sample. For a1 and a2, $M_s \, u \( M_s \)$ and $Delta \, u \( Delta \)$ are taken from Ref.#source-ref(1, <bib:magni_key_2022>). For a3, a4 and a5, $M_s \, u \( M_s \)$ is taken from Ref.#source-ref(1, <bib:magni_key_2022>), while $Delta$ and $u \( Delta \)$ are taken from the comparison of flow measurements as discussed in Sec.@sec:flow_characterization. For sample a6, $M_s \, u \( M_S \)$ and $K_(upright(e f f)) \, u \( K_(upright(e f f)) \)$ are measured while the exchange stiffness $A \, u \( A \)$ is taken from a literature survey on similar stacks #source-ref(4, <bib:devolder_exchange_2016>)#source-ref(3, <bib:Zimmermann2019>). The DW width $Delta$ and its standard uncertainty $u \( Delta \)$ are obtained by propagating the uncertainty in $A$ and $K_(upright(e f f))$ in $Delta = sqrt(A \/ K_(upright(e f f)))$. $ u \( Delta \) = Delta / 2 sqrt(#scale(x: 240%, y: 240%)[\[] frac(u \( A \), A) #scale(x: 240%, y: 240%)[\]]^2 + frac(u \( K_(upright(e f f)) \), K_(upright(e f f))) #scale(x: 240%, y: 240%)[\]]^2) . $

.

#block[
#figure(
  align(center)[#table(
    columns: 5,
    align: (left,center,center,center,center,),
    [Sample], [$D_(upright(B L S))$~#source-ref(1, <bib:magni_key_2022>)], [$D_(upright(W a l k e r))$], [$D_(upright(c r e e p))^(upright(o l d))$], [$D_(upright(c r e e p))^(upright(n e w))$],
    [], [\(mJ/m$""^2$)], [\(mJ/m$""^2$)], [\(mJ/m$""^2$)], [\(mJ/m$""^2$)],
    [a1], [$0.084 plus.minus 0.005$], [n.o.], [$0.043 plus.minus 0.005$], [$0.060 plus.minus 0.008$],
    [a2], [$0.170 plus.minus 0.006$], [n.o.], [$0.022 plus.minus 0.004$], [$0.05 plus.minus 0.02$],
    [a3], [$- 0.390 plus.minus 0.006$], [$- 0.45 plus.minus 0.05$], [$- 0.24 plus.minus 0.06$], [$- 0.40 plus.minus 0.06$],
    [a4], [$- 0.560 plus.minus 0.008$], [$- 0.51 plus.minus 0.05$], [$- 0.3 plus.minus 0.1$], [$- 0.40 plus.minus 0.08$],
    [a5], [$- 0.810 plus.minus 0.005$], [$- 0.91 plus.minus 0.09$], [$- 0.45 plus.minus 0.06$], [$- 0.8 plus.minus 0.1$],
    [a6], [$0.8 plus.minus 0.1$], [n.m.], [$0.5 plus.minus 0.1$], [$0.7 plus.minus 0.2$],
  )]
  , caption: [DMI values obtained from BLS ($D_(upright(B L S))$), Walker-field ($D_(upright(W a l k e r))$), conventional-creep #source-ref(18, <bib:Je2013>) ($D_(upright(c r e e p))^(upright(o l d))$) and new-creep analyses ($D_(upright(c r e e p))^(upright(n e w))$)]
  , kind: table
  ) <tab:DMI_comparison>
]

= References

#reference-entry(1, <bib:magni_key_2022>)[
A.~Magni, G.~Carlotti, A.~Casiraghi, E.~Darwin, G.~Durin, L.~H.~Diez, B.~J.~Hickey, A.~Huxtable, C.~Y.~Hwang, G.~Jakob, C.~Kim, M.~Klaui, J.~Langer, C.~H.~Marrows, H.~T.~Nembach, D.~Ravelosona, G.~A.~Riley, J.~M.~Shaw, V.~Sokalski, S.~Tacchi,~and~M.~Kuepferling,~ Key Points in the Determination of the Interfacial Dzyaloshinskii--Moriya Interaction From Asymmetric Bubble Domain Expansion,~#link("https://doi.org/10.1109/TMAG.2022.3217891")[  IEEE Transactions on Magnetics~#strong[58],~1 ( 2022)]

]
#reference-entry(2, <bib:ha_pham_very_2016>)[
T.~Ha~Pham, J.~Vogel, J.~Sampaio, M.~Vaňatka, J.-C.~Rojas-Sánchez, M.~Bonfim, D.~S.~Chaves, F.~Choueikani, P.~Ohresser, E.~Otero, A.~Thiaville,~and~S.~Pizzini,~ Very large domain wall velocities in Pt/Co/GdO$""_x$ and Pt/Co/Gd trilayers with Dzyaloshinskii-Moriya interaction,~#link("https://doi.org/10.1209/0295-5075/113/67001")[  EPL (Europhysics Letters)~#strong[113],~67001 ( 2016)]

]
#reference-entry(3, <bib:Zimmermann2019>)[
B.~Zimmermann, G.~Bihlmayer, M.~Böttcher, M.~Bouhassoune, S.~Lounis, J.~Sinova, S.~Heinze, S.~Blügel,~and~B.~Dupé,~ Comparison of first-principles methods to extract magnetic parameters in ultrathin films: Co/Pt\(111),~ Physical Review B~#strong[99],~#link("https://doi.org/10.1103/PhysRevB.99.214426")[10.1103/PhysRevB.99.214426] ( 2019),~arXiv: 1904.06954

]
#reference-entry(4, <bib:devolder_exchange_2016>)[
T.~Devolder, J.-V.~Kim, L.~Nistor, R.~Sousa, B.~Rodmacq,~and~B.~Diény,~ Exchange stiffness in ultrathin perpendicularly magnetized CoFeB layers determined using the spectroscopy of electrically excited spin waves,~#link("https://doi.org/10.1063/1.4967826")[  Journal of Applied Physics~#strong[120],~183902 ( 2016)]

]
#reference-entry(5, <bib:kim_chiral_2024>)[
D.-Y.~Kim, I.~Berrai, T.~Suraj, Y.~Roussigné, S.~Yang, M.~Belmeguenai, F.~Hu, G.~Shi, H.~R.~Tan, J.~Huang, A.~Soumyanarayanan, K.-W.~Kim, S.~Mourad~Cherif,~and~H.~Yang,~ Chiral Damping of Magnons,~#link("https://doi.org/10.1103/PhysRevLett.133.156704")[  Physical Review Letters~#strong[133],~156704 ( 2024)]

]
#reference-entry(6, <bib:metaxas_creep_2007>)[
P.~J.~Metaxas, J.~P.~Jamet, A.~Mougin, M.~Cormier, J.~Ferré, V.~Baltz, B.~Rodmacq, B.~Dieny,~and~R.~L.~Stamps,~ Creep and Flow Regimes of Magnetic Domain-Wall Motion in Ultrathin Pt/Co/Pt Films with Perpendicular Anisotropy,~#link("https://doi.org/10.1103/PhysRevLett.99.217208")[  Physical Review Letters~#strong[99],~217208 ( 2007)],~publisher: American Physical Society

]
#reference-entry(7, <bib:Jeudy2016>)[
V.~Jeudy, A.~Mougin, S.~Bustingorry, W.~Savero~Torres, J.~Gorchon, A.~B.~Kolton, A.~Lemaı̂tre,~and~J.~P.~Jamet,~ Universal Pinning Energy Barrier for Driven Domain Walls in Thin Ferromagnetic Films,~#link("https://doi.org/10.1103/PhysRevLett.117.057201")[  Physical Review Letters~#strong[117],~1 ( 2016)],~arXiv: 1603.01674

]
#reference-entry(8, <bib:garcia_magnetic_2021>)[
J.~P.~Garcia, A.~Fassatoui, M.~Bonfim, J.~Vogel, A.~Thiaville,~and~S.~Pizzini,~ Magnetic domain wall dynamics in the precessional regime: Influence of the Dzyaloshinskii-Moriya interaction,~#link("https://doi.org/10.1103/PhysRevB.104.014405")[  Physical Review B~#strong[104],~014405 ( 2021)]

]
#reference-entry(9, <bib:Lemerle1998>)[
S.~Lemerle, J.~Ferré, C.~Chappert, V.~Mathet, T.~Giamarchi,~and~P.~Le~Doussal,~ Domain wall creep in an ising ultrathin magnetic film,~#link("https://doi.org/10.1103/PhysRevLett.80.849")[  Physical Review Letters~#strong[80],~849 ( 1998)]

]
#reference-entry(10, <bib:krizakova_study_2019>)[
V.~Krizakova, J.~P.~Garcia, J.~Vogel, N.~Rougemaille, D.~D.~S.~Chaves, S.~Pizzini,~and~A.~Thiaville,~ Study of the velocity plateau of Dzyaloshinskii domain walls,~#link("https://doi.org/10.1103/PhysRevB.100.214404")[  Physical Review B~#strong[100],~214404 ( 2019)]

]
#reference-entry(11, <bib:yastremsky_thermodynamics_2019>)[
I.~A.~Yastremsky, O.~M.~Volkov, M.~Kopte, T.~Kosub, S.~Stienen, K.~Lenz, J.~Lindner, J.~Fassbender, B.~A.~Ivanov,~and~D.~Makarov,~ Thermodynamics and Exchange Stiffness of Asymmetrically Sandwiched Ultrathin Ferromagnetic Films with Perpendicular Anisotropy,~#link("https://doi.org/10.1103/PhysRevApplied.12.064038")[  Physical Review Applied~#strong[12],~064038 ( 2019)],~publisher: American Physical Society

]
#reference-entry(12, <bib:kuzmin_exchange_2020>)[
M.~D.~Kuz'min, K.~P.~Skokov, L.~V.~B.~Diop, I.~A.~Radulov,~and~O.~Gutfleisch,~ Exchange stiffness of ferromagnets,~#link("https://doi.org/10.1140/epjp/s13360-020-00294-y")[  The European Physical Journal Plus~#strong[135],~301 ( 2020)]

]
#reference-entry(13, <bib:waring_exchange_2023>)[
H.~J.~Waring, Y.~Li, N.~A.~B.~Johansson, C.~Moutafis, I.~J.~Vera-Marun,~and~T.~Thomson,~ Exchange stiffness constant determination using multiple-mode FMR perpendicular standing spin waves,~#link("https://doi.org/10.1063/5.0135024")[  Journal of Applied Physics~#strong[133],~063901 ( 2023)]

]
#reference-entry(14, <bib:pellegren_dispersive_2017>)[
J.~P.~Pellegren, D.~Lau,~and~V.~Sokalski,~ Dispersive Stiffness of Dzyaloshinskii Domain Walls~#link("https://doi.org/10.1103/PhysRevLett.119.027203")[10.1103/PhysRevLett.119.027203] ( 2017)

]
#reference-entry(15, <bib:lau_disentangling_2018>)[
D.~Lau, J.~P.~Pellegren, H.~T.~Nembach, J.~M.~Shaw,~and~V.~Sokalski,~ Disentangling factors governing Dzyaloshinskii domain-wall creep in Co/Ni thin films using Pt$""_x$Ir$""_(1 - x)$ seed layers,~#link("https://doi.org/10.1103/PhysRevB.98.184410")[  Physical Review B~#strong[98],~184410 ( 2018)]

]
#reference-entry(16, <bib:akosa_phenomenology_2016>)[
C.~A.~Akosa, I.~M.~Miron, G.~Gaudin,~and~A.~Manchon,~ Phenomenology of chiral damping in noncentrosymmetric magnets,~#link("https://doi.org/10.1103/PhysRevB.93.214429")[  Physical Review B~#strong[93],~214429 ( 2016)]

]
#reference-entry(17, <bib:akosa_decoupling_2024>)[
C.~A.~Akosa, G.~Tatara, A.~Manchon,~and~M.~Mochizuki,~ Decoupling the influences of chiral damping and Dzyaloshinskii-Moriya interaction in chiral magnetic domain walls,~#link("https://doi.org/10.1103/PhysRevB.110.024420")[  Physical Review B~#strong[110],~024420 ( 2024)]

]
#reference-entry(18, <bib:Je2013>)[
S.~G.~Je, D.~H.~Kim, S.~C.~Yoo, B.~C.~Min, K.~J.~Lee,~and~S.~B.~Choe,~ Asymmetric magnetic domain-wall motion by the Dzyaloshinskii-Moriya interaction,~#link("https://doi.org/10.1103/PhysRevB.88.214401")[  Physical Review B - Condensed Matter and Materials Physics~#strong[88],~1 ( 2013)]
]
