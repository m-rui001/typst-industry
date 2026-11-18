#set page(paper: "us-letter", margin: 0.72in, numbering: "1")
#set text(font: "Libertinus Serif", size: 10pt, lang: "en")
#set par(justify: true, first-line-indent: 1em, leading: 0.48em, spacing: 0.55em)
#set heading(numbering: "I.")
#show heading: upper
#show figure.caption: set text(size: 8.5pt)
#show figure.caption: set par(first-line-indent: 0pt, justify: true)

#text(size: 16pt, weight: "bold")[Fabrication Optimization of Suspended Stencil Mask Lithography for Multi-Terminal Josephson Junctions]

#v(0.5em)
Justus Teller#super[1,2], Abdur Rehman Jalil#super[3], Florian Lentz#super[4], Detlev Gr?tzmacher#super[1,2], and Thomas Sch?pers#super[1,2]

#text(size: 9pt)[
 #super[1]Peter Gr?nberg Institut (PGI-9), Forschungszentrum J?lich, 52425 J?lich, Germany \
 #super[2]JARA-Fundamentals of Future Information Technology, J?lich-Aachen Research Alliance, Forschungszentrum J?lich and RWTH Aachen University, 52425 J?lich, Germany \
 #super[3]Peter Gr?nberg Institut (PGI-10), Forschungszentrum J?lich, 52425 J?lich, Germany \
 #super[4]Helmholtz Nano Facility, Forschungszentrum J?lich, 52425 J?lich, Germany
]

#text(size: 8.5pt)[Correspondence: #link("mailto:j.teller@fz-juelich.de"), #link("mailto:th.schaepers@fz-juelich.de")]

#block(inset: (x: 0.25in), text(size: 10pt)[Stencil mask lithography is an advanced technique for fully _in-situ_ fabricating Josephson junctions, which is increasingly being used for multi-terminal Josephson junctions. This study provides information on the optimal mask design and mask reliability. For this, 270 mask designs were systematically fabricated and investigated under scanning electron microscope. Reliable statements are made about mask yield, minimal dimensions, and systematic dependencies on the number of superconducting terminals. We find that stencil mask lithography can be used reliably for fabricating multi-terminal Josephson junctions, enabling lateral mask dimensions down to 40~nm on average.])
#v(0.4em)

#columns(2, gutter: 0.22in)[
= Introduction <sec:Intro>
Stencil mask lithography has a rich history dating back to
\1969.#super[#link(<ref-alix_convenient_1969>)[1], #link(<ref-vazquez-mena_resistless_2015>)[2]] In contrast to
resist patterning, stencil masks can be kept at a distance from the
substrate, moved during processing, and used multiple times, since they
are mechanically stable and
self-supporting.#super[#link(<ref-vazquez-mena_resistless_2015>)[2]] Moreover, the technique is
scalable and applied across several fields.#super[#link(<ref-du_stencil_2017>)[3]] Recent
developments include the fabrication of complex 3-dimensional (3D)
surfaces and self-aligned superlattices,#super[#link(<ref-zeng_direct_2025>)[4]] a plasmonic
metasurface of 3D inclined structures,#super[#link(<ref-jeong_threedimensional_2024>)[5]]
next-generation biochemical sensors,#super[#link(<ref-ali_stencilbased_2024>)[6]] strechable
conductors,#super[#link(<ref-sun_stretchable_2021>)[7]] and transmon
qubits.#super[#link(<ref-tsioutsios_freestanding_2020>)[8]] \
In 2019, Schüffelgen~#emph[et al.]#super[#link(<ref-schuffelgen_selective_2019>)[9]] introduced
stencil mask lithography for the fabrication of Josephson junctions with
normal-conducting weak link. The advantage of this in situ fabrication
technique is that all material layers can be deposited by molecular beam
epitaxy (MBE) or electron beam evaporation without breaking the
ultra-high vacuum. Consequently, the material interfaces are
exceptionally clean, free of residual interface atoms or oxidation. In a
superconductor-normal conductor-superconductor (SNS) junction, the
Josephson supercurrent flows between two closely spaced superconducting
electrodes bridged by the normal-conducting weak-link material. The
smaller the separation, the larger the superconducting coupling. Using a
stencil mask to deposit the superconducting material the distance
between the superconducting electrodes is defined by the width of the
mask. The stencil mask technique can be used to fabricate any kind of
SNS weak link Josephson junction, comprising different weak link
materials, such as metals, semiconductors or topological materials. Over
the last years, a broad range of research studies has been published
using this fabrication technique, including two-terminal Josephson
junctions,#super[#link(<ref-schuffelgen_selective_2019>)[9], #link(<ref-schmitt_integration_2022a>)[10], #link(<ref-schmitt_anomalous_2022>)[11], #link(<ref-rosenbach_ballistic_2023>)[12], #link(<ref-zimmermann_topological_2024>)[13], #link(<ref-hanna_onchip_2025>)[14], #link(<ref-jalil_engineering_2025>)[15]]
three-terminal Josephson
junctions,#super[#link(<ref-kolzer_supercurrent_2023a>)[16], #link(<ref-behner_superconductive_2025a>)[17]] and
whole networks of Josephson junctions.#super[#link(<ref-teller_frustrated_2025>)[18]] \

#figure(image("figures/Animations.svg", width: 82%),
  caption: [
    a) Visualisation of a suspended stencil mask for a three-terminal
    junction with normal conducting material (N) deposited underneath.
    The mask itself is made of three pillars (SiO$""_2$) holding up the
    top Si$""_3$N$""_4$. b) Deposited Nb on top of the mask. The mask
    casts a shadow onto the underlying Si substrate. Therefore, the
    geometry of the mask is directly connected to the resulting device
    geometry on the substrate. c) Finished three-terminal junction after
    mask removal and subsequent etching step to separate the
    superconducting electrodes, revealing the Si substrate.
  ]
)
<fig:Schematic>

#figure(scope: "parent", placement: top, image("figures/FabLimits_Experiment.svg", width: 90.0%),
  caption: [
    Fabricated masks and determination of mask dimensions. a) Scanning
    electron microscopy image of a fabricated design cell containing
    three rows for two-, three-, and four-terminal masks, respectively.
    The arm width was set for each design cell (here $a w = 300 thin$nm)
    and the center width was increased from left (10~nm) to right
    (100~nm) in 10-nm-steps. Broken (left) and intact (right)
    stencil masks were easily identifiable under SEM. The red-marked
    masks were broken and the green-marked masks were intact for this
    particular design cell. b)-d) In total masks for two-, three-, and
    four- terminal Josephson junctions were investigated. The images
    correspond to the masks in a) and their respective frame color
    equals that of the data, which are presented throughout the study,
    for the corresponding number of arms. e) Geometry of a
    three-terminal junction and design parameters used in this study:
    center width ($c w$), center length ($c l$), arm width ($a w$).
    Together, they define the angle of sharpness ($alpha$). f) An
    exemplary center width measurement of the mask in c) under SEM using
    a line scan. The position of the line scan is indicated in the SEM
    image on the right as a white line. In this particular example, the
    center width was determined to be $c w = 66 thin$nm. Information on
    determining the threshold value (red line) is given in Supplemental
    Material.
  ]
)
<fig:Experiment>

In general, more complex Josephson junctions, i.e., multi-terminal
junctions, have attracted increasing attention
recently.#super[#link(<ref-pfeffer_subgap_2014>)[19], #link(<ref-riwar_multiterminal_2016>)[20], #link(<ref-draelos_supercurrent_2019a>)[21], #link(<ref-graziano_transport_2020>)[22], #link(<ref-pankratova_multiterminal_2020>)[23], #link(<ref-coraiola_2023>)[24], #link(<ref-coraiola_2024>)[25]]
They are defined as a Josephson junction with more than two
superconducting contacts that all share the same weak
link.#super[#link(<ref-duhot_cross_2009a>)[26], #link(<ref-riwar_multiterminal_2016>)[20], #link(<ref-pankratova_multiterminal_2020>)[23]]
For multi-terminal Josephson junctions one can distinguish between two
model descriptions: In the frist model, all superconducting weak link
channels meet at a central scattering region in the
middle#super[#link(<ref-duhot_cross_2009a>)[26], #link(<ref-riwar_multiterminal_2016>)[20], #link(<ref-pankratova_multiterminal_2020>)[23], #link(<ref-graziano_selective_2022>)[27], #link(<ref-coraiola_2023>)[24], #link(<ref-matute_2024>)[28]]
(central scattering transport model) and, in the second model, each
superconducting contact pairwise shares transport channels with a
neighbouring one in a
network.#super[#link(<ref-draelos_supercurrent_2019a>)[21], #link(<ref-graziano_transport_2020>)[22], #link(<ref-arnault_multiterminal_2021a>)[29], #link(<ref-arnault_dynamical_2022>)[30]]
The latter can be described by a resistively and capacitively shunted
junction (RCSJ) network using Kirchhoff's circuit
laws.#super[#link(<ref-graziano_transport_2020>)[22], #link(<ref-arnault_dynamical_2022>)[30]] The central
scattering model is of great interest because it allows direct coupling
of multiple electrodes, thereby enabling novel device
functionalities.#super[#link(<ref-matute_2024>)[28]] Furthermore, it is predicted that
artificial topological states can be created, e.g. topological Weyl
singularities.#super[#link(<ref-riwar_multiterminal_2016>)[20], #link(<ref-peralta-gavensky_2023>)[31]] However,
achieving the central scattering region model poses particular
challenges for the junction geometry, i.e. all electrodes should be as
close as possible in the center part of the device.

This study systematically investigates the optimal geometric fabrication
parameters for stencil masks of two-, three-, and four-terminal
Josephson junctions. @fig:Schematic a) illustrates the layout of
a stencil mask for a three-terminal Josephson junction. The suspended
Si$""_3$N$""_4$ mask rests on three SiO$""_2$ pillars. The weak-link
material of the junction, e.g., a metal, semiconductor, or topological
material, is present under the bridge. One way to define the weak-link
geometry in situ is to employ selective-area growth, as described by
Schüffelgen #emph[et al.]#super[#link(<ref-schuffelgen_selective_2019>)[9]] When the
superconductor layer is deposited at a fixed angle from above, it casts
a shadow corresponding to the mask layout \[cf. @fig:Schematic
b)\]. This defines the separation of the superconducting electrodes. The
device fabrication is finished by a etching of the superconductor layer
to define separated electrodes, which are later contacted \[cf.
@fig:Schematic c)\]. As shown in the inset of
@fig:Schematic~b), the closest distance is achieved in the central
region of the mask, where the arms of the mask have the smallest width.
A Josephson supercurrent is expected to flow here. Mask optimization
occurs within a trade-off context: the wider a stencil mask is, the more
stable it is. However, the resulting coupling via the weak link of the
Josephson junction is becoming smaller. To achieve good superconducting
coupling, we therefore focus on fabricating the masks as narrow as
possible but stable at the same time. We will also discuss how to ensure
that the fabrication process leaves the mask intact. The masks are
designed in a way that each contact is closest to every other contact in
the center of the weak link, making the central scattering region
transport model more likely.

For a systematic study on the design limits of stencil masks, we created
270 different mask designs, each one fabricated a total of four times on
two different samples. We then investigated by scanning electron
microscopy (SEM) which of the masks were broken or intact. For the
narrowest intact masks, we looked at how their geometrical dimensions
were realized compared to their designed dimensions. \

= Mask Fabrication <sec:Fabrication>
The mask was fabricated using a Si(111) substrate covered with a
300-nm-thick SiO$""_2$ layer and a 100-nm-thick Si$""_3$N$""_4$ layer by
plasma-enhanced chemical vapor deposition and a subsequent heating to
1000$thin^compose$C (5min). For patterning the mask, the substrate was
cleaned with acetone (5$thin$min) and isopropanol (5$thin$min), and then
pre-baked at 130$thin^compose$C (5$thin$min). Then Medusa photoresist
(Medusa~82:AR~600-07,~ratio~1:2) was spin coated on the sample
(4000$thin$rpm, 30$thin$sec) and soft baked at 150$thin^compose$C
(10$thin$min). \
Afterwards, the pattern was written by electron beam lithography (EBL).
The gaussian beam EBL tool Raith EBPG 5200 with an acceleration voltage
of 100 kV was used. The design was split into fine and coarse parts
which were written with beam currents of 500 pA and 150 nA and beam step
sizes of 1 nm and 50 nm, respectively. A multipass scanning mode with
four passes was applied for the fine structures while the coarse
structures were written in a single pass. The total base dose in both
cases amounted to 7096 µC/cm² with an additional proximity effect
correction with dose factors ranging from 1.0 up to 1.63. \
Subsequently, the sample was post exposure baked at 170$thin^compose$C
(10$thin$min) and the resist was developed with AR-300-44 (80$thin$sec).

#figure(image("figures/Standing_probability.svg", width: 82%),
  caption: [
    Number of intact masks $N$ depending on the designed center width
    $c w$ and designed arm width $a w$ with an accuracy of 25$thin %$.
    The more arms a mask has, the smaller its center width can be
    designed. Above a certain designed $c w$, the number of intact masks
    is close to 100$thin %$.
  ]
)
<fig:standing_prob>

The written pattern was then etched into the Si$""_3$N$""_4$ layer by
inductively-coupled plasma reactive-ion etching (ICP-RIE) (RF power:
25$thin$W, ICP power: 100$thin$W, CHF$""_3$: 55$thin$sccm, O$""_2$:
5$thin$sccm, time: 2min$thin$55sec). Then the Si$""_3$N$""_4$ layer was
under etched by buffered hydrofluoric acid (BOE) (5$thin$min) and
1$thin %$-concentrated hydrofluoric acid (3$thin$min). The acid also
removed the Medusa photoresist, so the wet-etch step served as a
cleaning step as well.

#figure(scope: "parent", placement: top, image("figures/Realized_Study.svg", width: 80.0%),
  caption: [
    Geometrical results from the SEM line scans. Each data point is
    indicated by a marker corresponding to the number of terminals of
    its mask. The solid lines serve as a guide to the eye#footnote[In
    Figs.~a)-c), the solid lines connect the means of the $y$-values
    scattering at a certain $x$-value. In Figs.~d)~and~e), the solid
    lines are determined via locally weighted scatterplot smoothing
    (LOWESS). See Supplementary Material for more details.] and data
    points are transparent. a) The optimally designed $c w$ depending on
    the designed $a w$. On average, four-terminal masks can be designed
    down to 30~nm, three-terminal masks masks down to 40~nm,
    and two-terminal masks down to 50~nm. b) The smallest realized
    center width $c w$ vs. designed center width. Two- and
    three-terminal masks show a linear dependence on $c w$ design
    whereas the realized $c w$ of the four-terminal masks scatter around
    a constant value. c) The difference between realized and designed
    arm width. The dashed red line indicates the case of matching of
    designed and achieved values of $a w$. All values scatter equally
    around $- 10 thin$nm. d) Relation between the realized angle of
    sharpness $alpha$ and the realized center width $c w$, assuming an
    as-designed center length of $c l = 1 thin mu$m.
  ]
)
<fig:Experimental_Results>

For this study, we created 270 different mask designs using the PHIDL
software.#super[#link(<ref-mccaughan_phidl_2021>)[32]] All design parameter are given in
@fig:Experiment~e). The designs iteratively change the center width
($c w$) and the arm width ($a w$), whereas the center length ($c l$)
stays constant at 1$thin mu$m. This results in a change of the angle of
sharpness, $alpha = upright("arctan") [(a w - c w) \/ 2 c l]$. The
larger $alpha$ is the more the superconducting coupling is located in
the center part, because the coupling is stronger the smaller the
electrode separation is. On a sample, the designs are ordered in
so-called design cells, each having designs with constant arm width
\[see @fig:Experiment~a)\]. The arm widths range from 100~nm
to 500~nm in 50~nm-steps. Within the design cell, there are
three rows with designs for two-, three-, and four-terminal masks,
respectively. In each row, the center width is increased from 10~nm
to 100~nm in 10~nm-steps (from left to right).

= Experimental Results <sec:Experimental>
In order to evaluate systematically the mask properties all fabricated
masks were inspected by scanning electron microscopy. From every mask,
an image was taken on which it is visible whether the mask is broken or
intact \[see @fig:Experiment~a)\]. Starting with the first intact
mask in each row (from left to right), the geometric parameters $c w$
and $a w$ were measured using line scans. \[see @fig:Experiment~f)
and Supplementary Material\]. These values are used for the discussion
in this study.

As mentioned above, the weakest point regarding the mask stability is
its narrow middle part. Therefore, it is expedient to look at the
probability of mask integrity depending on the center width design
parameter $c w$. In general, the center width should be as small as
possible to ensure strong Josephson coupling. In
@fig:standing_prob, the number of intact masks $N$ as a function of
the designed center width is given for arm widths $a w$ ranging from
100 nm to 500 nm, i.e. for each design cell. A strong dependence between
number of intact masks and center width is evident. One finds that above
a certain designed center width, it is possible to fabricate the masks
reliably with close to $100 thin %$ probability. The more terminals a
mask has, the smaller its $c w$ can be designed. This is summarized in
@fig:Experimental_Results~a) where, for each arm width $a w$, the
optimal (i.e. first intact mask from left to right) $c w$ design is
indicated. For the given fixed fabrication parameters for all types of
masks, the two-terminal masks can be designed down to a $c w$ of
$50 thin$nm, three-terminal masks down to $40 thin$nm, and four-terminal
masks down to 30~nm.

Since we are interested in the smallest possible dimensions, we will
analyze and compare for each type of mask the smallest intact masks we
find in the particular rows of the design cells. In the following, the
actual geometries of these masks are discussed in detail. In
@fig:Experimental_Results~b) the smallest achieved center widths
for the three types of masks are plotted as a function of the designed
center widths. We find that contrary to the design limits outlined
above, a two-terminal mask can be realized with the smallest center
width, whereas the smallest realized $c w$ increases the more terminals
a mask has. For two-terminal masks $c w$ values as small as 40 nm are
obtained. Furthermore, in contrast to the two-terminal masks the
smallest achieved $c w$ of the three- and four-terminal masks exceeds
the designed values. As indicated by the blue and orange lines in
@fig:Experimental_Results~b), two- and three-terminal masks show
quasi-linear behavior between realized and designed $c w$. In contrast,
the values of the four-terminal masks scatter around a constant value of
$90 thin$nm on average. The reason for both dependencies (contrast
between $c w$ design limit and realization limit and linear/constant
design dependence) is likely the angle between the mask arms, i.e.
180$""^compose$ for two-terminals, 120$""^compose$ for three-terminals,
and 90$""^compose$ for four-terminals. Electron beam lithography and
wet-etching are both known to have angle dependent fabrication effects:
the electron beam lithography is subject to pattern specific line width
variations by the proximity effect#super[#link(<ref-ren_proximity_2004>)[33], #link(<ref-zhou_electron_2005>)[34]]
and the chemical wet etch rate can be limited by the transport of
reactant species to the etched surface as well as the transport of end
products away from the surface.#super[#link(<ref-sarangan_nanofabrication_2017>)[35]] These
transports are more limited in 90$""^compose$ angles than at straight
lines. Although BOE etches the SiO$""_2$ at a significantly higher rate,
the Si$""_3$N$""_4$ is etched by it as well.

Beside the center width value $c w$, which determines the closest
distance between the superconducting electrodes and by that the strength
of the superconducting coupling the angle of sharpness $alpha$ is of
equal importance for multi-terminal junctions. It expresses how much the
superconducting coupling is restricted to the center part. The larger
$alpha$ is, the more the superconducting electrode are separated when
leaving the junction center. @fig:Experimental_Results~e) shows
the relationship between the angle of sharpness, denoted by $alpha$, and
the minimal width of the center, denoted by $c w$. The minimum center
width increases a little bit with increasing $alpha$, which can be
explained by the proximity effect during electron beam lithography. We
routinely realized an angle of sharpness of more than 10$""^compose$,
which is advantageous for obtaining multi-terminal junctions operated in
the central scattering region transport model.

= Conclusion <sec:Conclusion>
We demonstrated that stencil masks for in situ Josephson junction
fabrication can be fabricated very reliable with close to $100 thin %$
probability. Hereby, the masks can be fabricated as small in width as
40~nm. This study should serve as a basis for complex future
projects. It gives insights into how to design stencil masks more
optimally. However, this study is limited to the fabrication of the
stencil masks themselves, material deposition was neglected. Once a
material is deposited on the masks, the additional strain might break
the most unstable ones. Therefore, it is advisable to leave some room
for failure in future mask designs. Additionally, there is the option to
use an entrenched mask instead of a suspended one (e.g. cf. Ref.~\[\]).
Other mask geometries will likely follow the principles outlined in this
work.

In future, one could use the PHIDL software #super[#link(<ref-mccaughan_phidl_2021>)[32]] in
connection with the results of this study to create a library of
reliable masks to choose from for projects. This work will enable other
researchers to fabricate Josephson junctions with extremely small weak
link lengths using the stencil mask lithography technique. In general,
stencil masks work reliable for short weak links as well as for
multi-terminal Josephson junctions.

#heading(numbering: none)[Acknowledgments]

We thank Herbert Kertz for technical assistance and Sebastian Droege for
the stencil mask visualisations (@fig:Schematic). All samples have
been prepared at the Helmholtz Nano Facility.#super[#link(<ref-albrecht_hnf_2017>)[36]] This
work is funded by the Deutsche Forschungsgemeinschaft (DFG, German
Research Foundation) under Germany's Excellence Strategy -- Cluster of
Excellence Matter and Light for Quantum Computing (ML4Q) EXC 2004/1 --
390534769, by the German Federal Ministry of Education and Research
(BMBF) via the Quantum Futur project 'MajoranaChips' (Grant No.
13N15264), as well as the Bavarian Ministry of Economic Affairs,
Regional Development and Energy within Bavaria's High-Tech Agenda
Project ”Bausteine für das Quantencomputing auf Basis topologischer
Materialien mit experimentellen und theoretischen Ansätzen” (grant no.
07 02/686 58/1/21 1/22 2/23).
#emph[Data availability] --- The data that support the findings of this
article are openly available.~#super[#link(<ref-data_ref>)[37]]


#heading(numbering: none)[References]

#set text(size: 8.5pt)
#enum(
 [E. C. Alix, “A convenient stencil for glass etching,” Journal of Chemical Education 46, 863 (1969). <ref-alix_convenient_1969>],
 [O. Vazquez-Mena, L. Gross, S. Xie, L. G. Villanueva, and J. Brugger, “Resistless nanofabrication by stencil lithography: A review,” Microelectronic Engineering Micro and Nanofabrication Breakthroughs for Electronics, MEMS and Life Sciences, 132, 236–254 (2015). <ref-vazquez-mena_resistless_2015>],
 [K. Du, J. Ding, Y. Liu, I. Wathuthanthri, and C.-H. Choi, “Stencil Lithography for Scalable Micro- and Nanomanufacturing,” Micromachines 8, 131 (2017). <ref-du_stencil_2017>],
 [S. Zeng, T. Tian, J. Oh, Z.-H. Lin, and C.-J. Shih, “Direct nanopatterning of complex 3D surfaces and self-aligned superlattices via molecular-beam holographic lithography,” Nature Communications 16, 3436 (2025). <ref-zeng_direct_2025>],
 [T.-I. Jeong, S. Kim, S. Kim, M. Shin, A. Gliserin, T. Y. Kang, K. Kim, and S. Kim, “Three-dimensional surface lattice plasmon resonance effect from plasmonic inclined nanostructures via one-step stencil lithography,” Nanophotonics 13, 1169–1180 (2024). <ref-jeong_threedimensional_2024>],
 [B. Ali, S. N. Özkan, U. Kerimzade, M. Nasr Esfahani, S. Akinci, Y. Leblebici, E. Öztürk, and B. E. Alaca, “Stencil-Based Selective Surface Functionalization of Silicon Nanowires in 3D Device Architectures for Next-Generation Biochemical Sensors,” ACS Applied Nano Materials 7, 10634–10647 (2024). <ref-ali_stencilbased_2024>],
 [Y.-C. Sun, G. Boero, and J. Brugger, “Stretchable Conductors Fabricated by Stencil Lithography and Centrifugal Force-Assisted Patterning of Liquid Metal,” ACS Applied Electronic Materials 3, 5423–5432 (2021). <ref-sun_stretchable_2021>],
 [I. Tsioutsios, K. Serniak, S. Diamond, V. V. Sivak, Z. Wang, S. Shankar, L. Frunzio, R. J. Schoelkopf, and M. H. Devoret, “Free-standing silicon shadow masks for transmon qubit fabrication,” AIP Advances 10, 065120 (2020). <ref-tsioutsios_freestanding_2020>],
 [P. Schüffelgen, D. Rosenbach, C. Li, T. W. Schmitt, M. Schleenvoigt, A. R. Jalil, S. Schmitt, J. Kölzer, M. Wang, B. Bennemann, U. Parlak, L. Kibkalo, S. Trellenkamp, T. Grap, D. Meertens, M. Luysberg, G. Mussler, E. Berenschot, N. Tas, A. A. Golubov, A. Brinkman, T. Schäpers, and D. Grützmacher, “Selective area growth and stencil lithography for in situ fabricated quantum devices,” Nature Nanotechnology 14, 825–831 (2019). <ref-schuffelgen_selective_2019>],
 [T. W. Schmitt, M. R. Connolly, M. Schleenvoigt, C. Liu, O. Kennedy, J. M. Chávez-Garcia, A. R. Jalil, B. Bennemann, S. Trellenkamp, F. Lentz, E. Neumann, T. Lindström, S. E. de Graaf, E. Berenschot, N. Tas, G. Mussler, K. D. Petersson, D. Grützmacher, and P. Schüffelgen, “Integration of Topological Insulator Josephson Junctions in Superconducting Qubit Circuits,” Nano Letters 22, 2595–2602 (2022). <ref-schmitt_integration_2022a>],
 [T. W. Schmitt, B. Frohn, W. Wittl, A. R. Jalil, M. Schleenvoigt, E. Zimmermann, A. Schmidt, T. Schäpers, J. C. Cuevas, A. Brinkman, D. Grützmacher, and P. Schüffelgen, “Anomalous temperature dependence of multiple Andreev reflections in a topological insulator Josephson junction,” Superconductor Science and Technology 36, 024002 (2022). <ref-schmitt_anomalous_2022>],
 [D. Rosenbach, A. R. Jalil, T. W. Schmitt, B. Bennemann, G. Mussler, P. Schüffelgen, D. Grützmacher, and T. Schäpers, “Ballistic surface channels in fully in situ defined Bi4Te3 Josephson junctions with aluminum contacts,” (2023), arXiv:2301.03968 \[cond-mat\]. <ref-rosenbach_ballistic_2023>],
 [E. Zimmermann, A. Rehman Jalil, M. Schleenvoigt, J. Karthein, B. Frohn, Fabrication Optimization of Suspended Stencil Mask Lithography for Multi-Terminal Josephson Junctions 6 G. Behner, F. Lentz, S. Trellenkamp, E. Neumann, P. Schüffelgen, H. Lüth, D. Grützmacher, and T. Schäpers, “Topological insulator based axial superconducting quantum interferometer structures,” Superconductor Science and Technology 37, 085028 (2024). <ref-zimmermann_topological_2024>],
 [R. Hanna, S. Ihssen, S. Geisert, U. Kocak, M. Arfini, A. Hertel, T. J. Smart, M. Schleenvoigt, T. Schmitt, J. Domnick, K. Underwood, A. R. Jalil, J. H. Bae, B. Bennemann, M. Féchant, M. Field, M. Spiecker, N. Zapata, C. Dickel, E. Berenschot, N. Tas, G. A. Steele, D. Grützmacher, I. M. Pop, and P. Schüffelgen, “On-chip stencil lithography for superconducting qubits,” (2025), arXiv:2507.17005 \[quant-ph\]. <ref-hanna_onchip_2025>],
 [A. R. Jalil, T. W. Schmitt, P. Rüßmann, X.-K. Wei, B. Frohn, M. Schleenvoigt, W. Wittl, X. Hou, A. Schmidt, K. Underwood, G. Bihlmayer, M. Luysberg, J. Mayer, S. Blügel, D. Grützmacher, and P. Schüffelgen, “Engineering Epitaxial Interfaces for Topological Insulator — Superconductor Hybrid Devices with Al Electrodes,” Advanced Quantum Technologies 8, 2400343 (2025). <ref-jalil_engineering_2025>],
 [J. Kölzer, A. R. Jalil, D. Rosenbach, L. Arndt, G. Mussler, P. Schüffelgen, D. Grützmacher, H. Lüth, and T. Schäpers, “Supercurrent in Bi4Te3 Topological Material-Based Three-Terminal Junctions,” Nanomaterials 13, 293 (2023). <ref-kolzer_supercurrent_2023a>],
 [G. Behner, A. R. Jalil, A. Rupp, H. Lüth, D. Grützmacher, and T. Schäpers, “Superconductive Coupling Effects in Selectively Grown Topological Insulator-Based Three-Terminal Junctions,” ACS Nano 19, 3878–3885 (2025). <ref-behner_superconductive_2025a>],
 [J. Teller, C. Schäfer, K. Moors, B. Bennemann, M. Lyatti, F. Lentz, D. Grützmacher, R.-P. Riwar, and T. Schäpers, “Frustrated Frustration of Arrays with Four-Terminal Nb-Pt-Nb Josephson Junctions,” Physical Review Letters 135, 156002 (2025). <ref-teller_frustrated_2025>],
 [A. H. Pfeffer, J. E. Duvauchelle, H. Courtois, R. Mélin, D. Feinberg, and F. Lefloch, “Subgap structure in the conductance of a three-terminal Josephson junction,” Physical Review B 90, 075401 (2014). <ref-pfeffer_subgap_2014>],
 [R.-P. Riwar, M. Houzet, J. S. Meyer, and Y. V. Nazarov, “Multi-terminal Josephson junctions as topological matter,” Nature Communications 7, 11167 (2016). <ref-riwar_multiterminal_2016>],
 [A. W. Draelos, M.-T. Wei, A. Seredinski, H. Li, Y. Mehta, K. Watanabe, T. Taniguchi, I. V. Borzenets, F. Amet, and G. Finkelstein, “Supercurrent Flow in Multiterminal Graphene Josephson Junctions,” Nano Letters 19, 1039–1043 (2019). <ref-draelos_supercurrent_2019a>],
 [G. V. Graziano, J. S. Lee, M. Pendharkar, C. J. Palmstrøm, and V. S. Pribiag, “Transport studies in a gate-tunable three-terminal Josephson junction,” Physical Review B 101, 054510 (2020). <ref-graziano_transport_2020>],
 [N. Pankratova, H. Lee, R. Kuzmin, K. Wickramasinghe, W. Mayer, J. Yuan, M. G. Vavilov, J. Shabani, and V. E. Manucharyan, “Multiterminal Josephson Effect,” Physical Review X 10, 031051 (2020). <ref-pankratova_multiterminal_2020>],
 [M. Coraiola, D. Z. Haxell, D. Sabonis, H. Weisbrich, A. E. Svetogorov, M. Hinderling, S. C. Ten Kate, E. Cheah, F. Krizek, R. Schott, et al., “Phase-engineering the Andreev band structure of a three-terminal Josephson junction,” Nature Communications 14, 6784 (2023). <ref-coraiola_2023>],
 [M. Coraiola, A. E. Svetogorov, D. Z. Haxell, D. Sabonis, M. Hinderling, S. C. Ten Kate, E. Cheah, F. Krizek, R. Schott, W. Wegscheider, et al., “Flux-tunable Josephson diode effect in a hybrid four-terminal Josephson junction,” ACS nano 18, 9221–9231 (2024). <ref-coraiola_2024>],
 [S. Duhot, F. Lefloch, and M. Houzet, “Cross Correlation of Incoherent Multiple Andreev Reflections,” Physical Review Letters 102, 086804 (2009). <ref-duhot_cross_2009a>],
 [G. V. Graziano, M. Gupta, M. Pendharkar, J. T. Dong, C. P. Dempsey, C. Palmstrøm, and V. S. Pribiag, “Selective control of conductance modes in multi-terminal Josephson junctions,” Nature Communications 13, 5933 (2022). <ref-graziano_selective_2022>],
 [F. Matute-Cañadas, L. Tosi, and A. L. Yeyati, “Quantum circuits with multiterminal Josephson-Andreev junctions,” PRX Quantum 5, 020340 (2024). <ref-matute_2024>],
 [E. G. Arnault, T. F. Q. Larson, A. Seredinski, L. Zhao, S. Idris, A. Mc- Connell, K. Watanabe, T. Taniguchi, I. Borzenets, F. Amet, and G. Finkelstein, “Multiterminal Inverse AC Josephson Effect,” Nano Letters 21, 9668– 9674 (2021). <ref-arnault_multiterminal_2021a>],
 [E. G. Arnault, S. Idris, A. McConnell, L. Zhao, T. F. Larson, K. Watanabe, T. Taniguchi, G. Finkelstein, and F. Amet, “Dynamical Stabilization of Multiplet Supercurrents in Multiterminal Josephson Junctions,” Nano Letters 22, 7073–7079 (2022). <ref-arnault_dynamical_2022>],
 [L. Peralta Gavensky, G. Usaj, and C. A. Balseiro, “Multi-terminal Josephson junctions: A road to topological flux networks,” Europhysics Letters 141, 36001 (2023). <ref-peralta-gavensky_2023>],
 [A. N. McCaughan, A. N. Tait, S. M. Buckley, D. M. Oh, J. T. Chiles, J. M. Shainline, and S. W. Nam, “PHIDL: Python-based layout and geometry creation for nanolithography,” Journal of Vacuum Science & Technology B 39, 062601 (2021). <ref-mccaughan_phidl_2021>],
 [L. Ren and B. Chen, “Proximity effect in electron beam lithography,” in Proceedings. 7th International Conference on Solid-State and Integrated Circuits Technology, 2004., Vol. 1 (2004) pp. 579–582 vol.1. <ref-ren_proximity_2004>],
 [Z. J. Zhou, “Electron Beam Lithography,” in Handbook of Microscopy for Nanotechnology, edited by N. Yao and Z. L. Wang (Springer US, Boston, MA, 2005) pp. 287–321. <ref-zhou_electron_2005>],
 [A. Sarangan, Nanofabrication: Principles to Laboratory Practice, Optical Sciences and Applications of Light (CRC Press, Taylor & Francis Group, Boca Raton, 2017). <ref-sarangan_nanofabrication_2017>],
 [W. Albrecht, J. Moers, and B. Hermanns, “HNF - Helmholtz Nano Facility,” Journal of large-scale research facilities JLSRF 3, A112–A112 (2017). <ref-albrecht_hnf_2017>],
 [J. Teller, A. R. Jalil, F. Lentz, D. Grützmacher, and T. Schäpers, “Data for: Fabrication Optimization of Suspended Stencil Mask Lithography for Multi-Terminal Josephson Junctions,” (2025), V2, JülichDATA, DOI: 10.26165/JUELICH-DATA/7WRRRH. <ref-data_ref>],
)

]

#pagebreak()
#counter(page).update(1)
#counter(heading).update(0)
#counter(figure.where(kind: image)).update(0)
#set heading(numbering: n => [Supplemental Note #n:])
#show ref: it => if it.element != none and it.element.func() == heading and it.target == <sec:SUPP_Fig4> { link(it.target)[Supplemental Note 3] } else { it }
#set figure(numbering: "S1", supplement: [Supplemental Figure])

#let panel-set(metric) = grid(
 columns: (1fr, 1fr), column-gutter: 1em, row-gutter: 0.8em,
 ..((2, "a", "Two"), (3, "b", "Three"), (4, "c", "Four")).map(((n, letter, name)) => align(center)[
   #image("figures/" + str(n) + "TJJ_" + metric + ".svg", width: 100%)
   #linebreak()
   #text(size: 8.5pt)[(#letter) #(name)-terminal masks.]
 ]),
)

#align(center, text(size: 13pt, weight: "bold")[Fabrication Optimization of Suspended Stencil Mask Lithography for Multi-Terminal Josephson Junctions (Supplemental Material)])

= Abstract
<abstract>
In this supplemental material, we explain the technique used to
determine geometrical values from the scanning electron micrographs
(@sec:SUPP_SEM_Measurement), comment on the methods used to
show data in @fig:Experimental_Results and
@fig:SUPP_Opt_Pos through @fig:SUPP_cw_real_vs_alpha (@sec:SUPP_Fig4), and discuss the differences between the two
samples of this study (@sec:SUPP_Diff_Samples).

= Measurement Technique
<sec:SUPP_SEM_Measurement>
The data for this study is based on measurements with scanning electron
microscope (SEM). For @fig:standing_prob, one SEM image was of
every mask in which it is visible whether the mask is intact or broken.
For all other geometrical data, line scans through SEM images were used
for measurements \[see @fig:Experiment~f)\]. To determine a
distance within the line scan data, a threshold is first determined
where the first data point (left and right of a feature) above it is set
as a boundary for the distance measurement. The threshold is determined
using the first 20$thin %$ of a line scan data as background signal,
e.g. from 0 to about 40~nm in @fig:Experiment~f). Here, the
signal offset is determined by calculating the background mean ($mu$).
The noise level is determined by taking the background standard
deviation ($sigma$). The threshold is set to the signal offset plus five
times the noise level (threshold = $mu + 5 sigma$). The line scan
measurements were used to determine the center width ($c w$) and the arm
width ($a w$).

= Comment about display of data in Figure 4 and Supplemental Figures S2?S6
<sec:SUPP_Fig4>
In main text @fig:Experimental_Results, each mask measurement is
indicated individually. The markers are transparent for indicating
overlays. The solid lines serve as a guide to the eye where each line
stands for the behavior of two- (blue), three- (orange), or
four-terminal (green) masks. To determine the solid lines accurately,
two methods were used:

- For the data in
  @fig:Experimental_Results~a)-c),~@fig:SUPP_Opt_Pos,~@fig:SUPP_cw_real_vs_designed,~and~@fig:SUPP_aw_real_vs_designed,
  the y-values scatter at a specific x-value. The solid line connects
  the means of the y-values scattering at a certain x-value.

- For the data in
  @fig:Experimental_Results~d),~@fig:SUPP_cw_real_vs_aw_real,~and~@fig:SUPP_cw_real_vs_alpha,
  the x-values are more scattered than for the other graphs. Here, the
  solid line is determined via a locally weighted scatterplot smoothing
  (LOWESS; fraction of data used for weighting: 0.5).

= Differences between first and second sample
<sec:SUPP_Diff_Samples>
Both samples presented in this study were fabricated from the same wafer
with the same SiO$""_2$/Si$""_3$N$""_4$ layer stack. They used the same
mask designs and were fabricated in the same run. Their measurement
results are shown independently in
@fig:SUPP_Standing_Prob through @fig:SUPP_cw_real_vs_alpha. Both samples
exhibit comparable behavior.

#figure(image("figures/Standing_comparison.svg", width: 98.0%),
  caption: [
    Number of intact masks $N$ with two-terminals (a), three-terminals
    (b), and four-terminals (c). Data shown for each sample
    individually, with every mask design twice on each sample.
  ]
)
<fig:SUPP_Standing_Prob>

#figure(panel-set("optimal_position"),
  caption: [
    Optimally designed center width depending on the designed arm width.
    The lines serve as a guide to the eye, as described in @sec:SUPP_Fig4.
  ]
)
<fig:SUPP_Opt_Pos>

#figure(panel-set("real_center_width"),
  caption: [
    The realized compared to the designed center width. The lines serve
    as a guide to the eye, as described in @sec:SUPP_Fig4.
  ]
)
<fig:SUPP_cw_real_vs_designed>

#figure(panel-set("real_arm_width"),
  caption: [
    Difference between realized and designed arm width. The lines serve
    as a guide to the eye, as described in @sec:SUPP_Fig4.
  ]
)
<fig:SUPP_aw_real_vs_designed>

#figure(panel-set("cw_vs_aw_realized"),
  caption: [
    Dependence between realized center width and realized arm width. The
    lines serve as a guide to the eye, as described in @sec:SUPP_Fig4.
  ]
)
<fig:SUPP_cw_real_vs_aw_real>

#figure(panel-set("cw_vs_angle_realized"),
  caption: [
    Dependence of the realized center width on the angle of pointedness
    $alpha$, assuming an as-designed center length of
    $c l = 1 thin mu$m. The lines serve as a guide to the eye, as
    described in @sec:SUPP_Fig4.
  ]
)
<fig:SUPP_cw_real_vs_alpha>
