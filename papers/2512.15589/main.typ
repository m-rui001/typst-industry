#set document(title: "From Complex Magnetic Ground States to Magnetocaloric Effects")
#set page(paper: "us-letter", margin: (x: 19mm, y: 18mm), columns: 2, numbering: "1")
#set text(font: "Libertinus Serif", size: 10pt)
#set par(justify: true, leading: .55em)
#set figure(placement: auto)
#show figure.caption: set text(size: 9pt)
#show table: set text(size: 8.5pt)
#place(top, float: true, scope: "parent", clearance: 1em)[
  #align(center)[
    #text(size: 17pt, weight: "bold")[From Complex Magnetic Ground States to Magnetocaloric Effects: A Review of Rare Earth R?In Intermetallic Compounds]
    #v(.45em)
    Anis Biswas, Ajay Kumar, Prashant Singh, and Yaroslav Mudryk
    #v(.35em)
    #text(size: 9pt)[Ames National Laboratory, U.S. Department of Energy, Iowa State University, Ames, Iowa 50011, USA]
  ]
  #v(.55em)
  *Abstract.* R$""_2$In (R = rare earth) intermetallics exhibit unusual magnetic and
magnetocaloric properties, driven by subtle electronic effects, lattice
distortions, and spin--lattice coupling. Most of these binary compounds
adopt the hexagonal Ni$""_2$In-type structure at room temperature, with
Eu$""_2$In and Yb$""_2$In stabilizing in the orthorhombic
Co$""_2$Si-type lattice. Lighter lanthanide compounds Eu$""_2$In,
Nd$""_2$In, and Pr$""_2$In undergo first-order magnetic transitions with
negligible hysteresis and minimal lattice volume change and exhibit
giant cryogenic magnetocaloric effects, while heavy lanthanide R$""_2$In
compounds including Gd$""_2$In show second-order transitions with
moderate magnetocaloric effect. No lanthanide-based R$""_2$In compound
exhibits symmetry-breaking structural transition, while Y$""_2$In
transforms from hexagonal to orthorhombic structure near 250~K.
Secondary low-temperature transitions, including spin reorientation or
antiferromagnetic ordering, further enrich the magnetic phase landscape
in these compounds. Integrating theoretical descriptors such as
charge-induced strain and electronic structure provides predictive
insight into phase stability and magnetocaloric performance, guiding the
design of rare-earth intermetallics with tunable magnetic properties for
cryogenic applications. \
#strong[Keywords:] R$""_2$In, Magnetic properties, Magnetocaloric
effect, DFT, Phase stability
]

= Introduction
<introduction>
Rare-earth-based intermetallic compounds (RBIs) represent a fascinating
class of magnetic materials that continue to attract significant
research interest due to their complex and diverse chemistry and
physics~#[#link(<bib:Szytula1993>)[1], #link(<bib:Ghazanfar2025>)[2], #link(<bib:Petit2020>)[6], #link(<bib:Kurumaji2019>)[7], #link(<bib:Pecharsky1997>)[10], #link(<bib:Chinchure2002>)[11], #link(<bib:Asti1994>)[12], #link(<bib:DelRose2021>)[13], #link(<bib:Ribeiro2013>)[14], #link(<bib:Guillou2018>)[17], #link(<bib:Biswas2020>)[18], #link(<bib:Ahmed2025>)[20], #link(<bib:Bhattacharya2025>)[21], #link(<bib:Biswas2024>)[24], #link(<bib:Alho2022>)[26], #link(<bib:Chakraborty2022>)[28], #link(<bib:Biswas2024b>)[29], #link(<bib:Kumar2024>)[31], #link(<bib:Chakraborty2024>)[32], #link(<bib:Ribeiro2024>)[33], #link(<bib:Kumar2025a>)[35], #link(<bib:Kumarprb24>)[23], #link(<bib:Mudryk2011>)[36], #link(<bib:Custers2003>)[3], #link(<bib:Paschen2004>)[4], #link(<bib:Custers2012>)[5], #link(<bib:EuAl4Skyrmions2022>)[8], #link(<bib:Caretta2020>)[9], #link(<bib:Zhang2021>)[15], #link(<bib:Kumar2024b>)[16], #link(<bib:Schuberth2016>)[19], #link(<bib:Kenzelmann2008>)[22], #link(<bib:Dong2025>)[25], #link(<bib:Izawa2007>)[27], #link(<bib:Bouaziz2022>)[30], #link(<bib:Gd2PdSi3PRL2025>)[34]].
These materials often exhibit fundamentally interesting and
technologically important magnetic behaviors owing to their strong
electron correlations, high magnetic moments, considerable spin-orbit
coupling, and a common interplay between magnetic and structural degrees
of freedom, features that remain central to contemporary condensed
matter
research~#[#link(<bib:Szytula1993>)[1], #link(<bib:Ghazanfar2025>)[2], #link(<bib:Petit2020>)[6], #link(<bib:Kurumaji2019>)[7], #link(<bib:Pecharsky1997>)[10], #link(<bib:Chinchure2002>)[11], #link(<bib:Asti1994>)[12], #link(<bib:DelRose2021>)[13], #link(<bib:Ribeiro2013>)[14], #link(<bib:Guillou2018>)[17], #link(<bib:Biswas2020>)[18], #link(<bib:Ahmed2025>)[20], #link(<bib:Bhattacharya2025>)[21], #link(<bib:Biswas2024>)[24], #link(<bib:Alho2022>)[26], #link(<bib:Chakraborty2022>)[28], #link(<bib:Biswas2024b>)[29], #link(<bib:Kumar2024>)[31], #link(<bib:Chakraborty2024>)[32], #link(<bib:Ribeiro2024>)[33], #link(<bib:Mudryk2011>)[36], #link(<bib:Kumar2025a>)[35], #link(<bib:Kumarprb24>)[23], #link(<bib:Custers2003>)[3], #link(<bib:Paschen2004>)[4], #link(<bib:Custers2012>)[5], #link(<bib:EuAl4Skyrmions2022>)[8], #link(<bib:Caretta2020>)[9], #link(<bib:Zhang2021>)[15], #link(<bib:Kumar2024b>)[16], #link(<bib:Schuberth2016>)[19], #link(<bib:Kenzelmann2008>)[22], #link(<bib:Dong2025>)[25], #link(<bib:Izawa2007>)[27], #link(<bib:Bouaziz2022>)[30], #link(<bib:Gd2PdSi3PRL2025>)[34]].
These distinctive characteristics of RBIs make them ideal materials for
both current, primarily as permanent magnets, and future applications
ranging from high-density data storage and spintronics to magnetic
refrigeration and renewable energy
technologies~#[#link(<bib:Ghazanfar2025>)[2], #link(<bib:Pecharsky1997>)[10], #link(<bib:Chinchure2002>)[11], #link(<bib:Asti1994>)[12], #link(<bib:DelRose2021>)[13], #link(<bib:Guillou2018>)[17], #link(<bib:Biswas2020>)[18], #link(<bib:Zhang2021>)[15], #link(<bib:Kumar2024b>)[16], #link(<bib:Izawa2007>)[27], #link(<bib:Nakamurascripta18>)[37]].

The complexity of these materials arises largely from the presence of
4$f$ electrons, common for most rare earths (except Sc, Y, and La),
which adds intricacy to the interplay between chemical composition,
crystal structure, and physical behavior. The 4$f$ electrons are
typically localized, leading to magnetic interactions that are
predominantly mediated by conduction electrons via the indirect exchange
mechanism, commonly known as Ruderman-Kittel-Kasuya-Yosida (RKKY)
model~#[#link(<bib:Jensen1991>)[38], #link(<bib:Kasuya1956>)[39], #link(<bib:Campbell1972>)[40]]. The RKKY model, however, is
too simple to quantitatively estimate complex interplay between multiple
magnetic exchange interactions in complex RBIs with a variety of
interatomic distances. Moreover, hybridization between the localized
4$f$ states and the more extended 5$d$ orbitals adds an additional layer
of complexity in describing magnetic interactions in these compounds. On
top of this already complicated scenario, the role of additional $s$-,
$p$-, and $d$-electrons brought by alloying with non-rare-earth atoms
cannot be overstated, even when the added constituents are non-magnetic.
These delocalized electrons that also participate in chemical bonding
can strongly influence the effective exchange coupling of magnetic
atoms, introduce magnetocrystalline anisotropy, and crystalline electric
field splitting of 4$f$ energy levels by virtue of modifying atomic
environments. In turn, alloying can also alter the nature of magnetic
phase transitions~#[#link(<bib:Biswas2024b>)[29], #link(<bib:Mudryk2011>)[36], #link(<bib:Kumar_PRB_25>)[41]]. Investigation of
such systems often uncovers new physical phenomena, which, consequently,
may lead to novel magnetic functionalities.

#figure(image("source/Fig1.JPG", width: 100%), scope: "parent",
  caption: [
    Crystal structure (top-right half, color-coded) and nature of the
    magnetic phase transition (bottom-left half, color-coded) of
    R$""_2$In compounds for different rare-earth elements. The numbers
    in the top-right corners indicate the valence state of the
    rare-earth ions in the corresponding compounds.
  ]
)
<Fig1>

Among the broad class of rare earth-based intermetallic compounds, those
with the general formula R$""_2$In (where R is a rare earth element)
have drawn considerable attention for their recently uncovered
intriguing structural, magnetic, and electronic behaviors, influencing
fundamental condensed matter research and showing potential for
technological
applications~#[#link(<bib:Guillou2018>)[17], #link(<bib:Biswas2020>)[18], #link(<bib:Forker2005>)[42], #link(<bib:Bhattacharyya2009>)[43], #link(<bib:Zhang2009>)[44], #link(<bib:Ravot1993>)[45], #link(<bib:Zhang2011>)[46], #link(<bib:Alho2020>)[47], #link(<bib:Ryan2019>)[48], #link(<bib:MendiveTapia2020>)[49], #link(<bib:Singh2012>)[50], #link(<bib:Bhattacharyya2012>)[51], #link(<bib:Tence2016>)[52], #link(<bib:McAlister1984a>)[53], #link(<bib:Kamali2014>)[54], #link(<bib:Taskaev2021>)[55], #link(<bib:Liu1987>)[56], #link(<bib:Jee1996>)[57], #link(<bib:Bhattacharyya2009b>)[58], #link(<bib:Zhang2009b>)[59], #link(<bib:Ravot1992>)[60], #link(<bib:Ravot1997>)[61], #link(<bib:Biswas2022a>)[62], #link(<bib:Biswas2022b>)[63], #link(<bib:Liu2021>)[64], #link(<bib:Cui2022>)[65], #link(<bib:GamariSeale1979>)[66], #link(<bib:Parviainen1980>)[67], #link(<bib:Bazela1988>)[68], #link(<bib:Ravot1995>)[69], #link(<bib:McAlister1984b>)[70], #link(<bib:OlzonDionysio1992>)[71], #link(<bib:Zhang2009c>)[72], #link(<bib:Liu2024>)[73], #link(<bib:Svanidze2008>)[74], #link(<bib:Guillou2020>)[75], #link(<bib:Biswas2023>)[76], #link(<bib:GegenMater25>)[77]].
These compounds typically crystallize in either orthorhombic (for R = Eu
and Yb) or hexagonal structures for the rest of the rare-earth elements
(see @Fig1)~#[#link(<bib:Guillou2018>)[17], #link(<bib:Biswas2020>)[18], #link(<bib:Bazela1988>)[68]]. A key feature of
many R$""_2$In compounds is the onset of magnetic phase transition at
cryogenic temperatures, often accompanied by a pronounced magnetocaloric
effect
(MCE)~#[#link(<bib:Guillou2018>)[17], #link(<bib:Biswas2020>)[18], #link(<bib:Bhattacharyya2009>)[43], #link(<bib:Zhang2009>)[44], #link(<bib:Zhang2011>)[46], #link(<bib:Tence2016>)[52], #link(<bib:Bhattacharyya2009b>)[58], #link(<bib:Zhang2009b>)[59], #link(<bib:Biswas2022b>)[63], #link(<bib:Liu2021>)[64], #link(<bib:Cui2022>)[65], #link(<bib:Zhang2009c>)[72], #link(<bib:Liu2024>)[73], #link(<bib:Biswas2023>)[76], #link(<bib:GegenMater25>)[77]].
Notably, recent studies have revealed an especially interesting
phenomenon---the presence of first-order magnetic phase transition
(FOMT) with negligibly small thermal hysteresis in members with R = Pr,
Nd, and Eu (see @Fig1), accompanied by invariance of the crystal
symmetry and a very small ($lt.eq$ 0.1%) change in the unit cell volume
at the FOMT~#[#link(<bib:Guillou2018>)[17], #link(<bib:Biswas2020>)[18], #link(<bib:Biswas2022b>)[63], #link(<bib:Liu2021>)[64]]. Such
transitions, which are uncommon yet highly desired due to reversibility
and lack of energy losses, elevate the scientific interest in R$""_2$In
compounds. In addition to the well-established usefulness of such
transitions for next-generation magnetic refrigeration, a fundamental
understanding of the mechanisms responsible for negligible thermal
hysteresis associated with them will impact other advanced technological
applications that utilize magnetic phase changes.

This review provides a comprehensive overview of the $R_2$In family of
rare-earth intermetallic compounds, with a particular focus on their
crystallographic, magnetic, and magnetocaloric properties. We begin by
discussing the structural variations across this rare-earth series,
followed by describing intrinsic magnetic behavior and the nature of
magnetic phase transitions exhibited by these materials. A dedicated
section explores the magnetocaloric effect (MCE), emphasizing compounds
that demonstrate substantial isothermal entropy changes near the boiling
points of technologically useful gases, such as hydrogen
($tilde.op$20~K), oxygen ($tilde.op$90~K) and natural gas
($tilde.op$110~K). These observations highlight the potential of $R_2$In
compounds for use in energy-efficient cooling systems and gas
liquefaction technologies. In addition to the key experimental findings,
the review integrates insights from theoretical modeling and
computational studies that shed light on the complex interplay among
electronic structure, crystallography, and magnetic interactions. These
perspectives are critical for the rational design and optimization of
materials with improved magnetocaloric and other functional aspects of
the materials.

Finally, we outline several promising avenues for future research. One
direction involves chemical substitution strategies, aimed at
systematically tuning the magnetic interactions and magnetocaloric
responses of $R_2$In compounds through controlled modification of
rare-earth or transition-metal sites. Complementary to this, structural
engineering approaches such as strain induction, dimensional
confinement, or controlled defect incorporation, may provide additional
pathways to enhance functional properties, including magnetocrystalline
anisotropy, Curie temperature ($T_C$), and thermal stability. Despite
substantial progress, key scientific questions remain unresolved,
including the detailed mechanisms underlying first-order magnetic
transitions, the role of electronic correlations in magnetocaloric
behavior, and the interplay between lattice distortions and magnetic
ordering. Addressing these challenges will be critical to fully
understanding the rich physics of the $R_2$In family and leveraging
their potential in high-performance magnetic and energy-conversion
applications.

#figure(image("source/Fig2.pdf", width: 100%), scope: "parent",
  caption: [
    \(a) and (b) Room-temperature X-ray diffraction patterns for
    Gd$""_2$In and Yb$""_2$In, collected using Mo K$""_alpha$ and Cu
    K$""_alpha$ radiation, respectively: representative of
    Ni$""_2$In-type hexagonal and Co$""_2$Si-type orthorhombic
    structures adopted by R$""_2$In. Figures (a, b) are reprinted with
    permission from #[#link(<bib:Singh2025>)[84]], Copyright (2025) by the American
    Physical Society. (c, d) Corresponding Ni$""_2$In hexagonal and
    Co$""_2$Si orthorhombic unit cells (red = R, blue = In), with
    rare-earth atoms on two inequivalent sites. (e) Experimental
    unit-cell volume versus atomic number $Z$ for the lanthanide series:
    unit-cell volume of hexagonal compounds (blue) decreases
    monotonically from La to Lu, while the volume of orthorhombic
    Eu$""_2$In and Yb$""_2$In cells (red; normalized cell volume shown,
    i.e., half the full cell) is much higher but follows the same
    contracting trend. The lattice volume values are taken from
    @tab:structure.
  ]
)
<Fig2>

= Discussion
<discussion>
== Sample preparation and handling
<sample-preparation-and-handling>
All hexagonal R$""_2$In compounds reported in the literature were
synthesized using the conventional arc-melting technique under an argon
atmosphere
#[#link(<bib:Zhang2011>)[46], #link(<bib:Bhattacharyya2009b>)[58], #link(<bib:Bhattacharyya2009>)[43], #link(<bib:Zhang2009c>)[72], #link(<bib:Singh2012>)[50], #link(<bib:Biswas2020>)[18], #link(<bib:Biswas2022b>)[63], #link(<bib:Biswas2023>)[76], #link(<bib:Liu2021>)[64]].
Stoichiometric amounts of the constituent elements were arc-melted
several times, with the sample button flipped between melts to ensure
homogeneity. The as-prepared samples were subsequently annealed for
several days in evacuated or He-filled sealed quartz tubes at
temperatures between 700 and 800$""^compose$C, depending on the
composition
#[#link(<bib:Zhang2011>)[46], #link(<bib:Bhattacharyya2009b>)[58], #link(<bib:Bhattacharyya2009>)[43], #link(<bib:Zhang2009c>)[72], #link(<bib:Biswas2020>)[18], #link(<bib:Biswas2022b>)[63], #link(<bib:Biswas2023>)[76]].
For compounds based on heavy lanthanides, the annealing duration
typically ranged from a few days up to, but not exceeding, one week
#[#link(<bib:Zhang2011>)[46], #link(<bib:Bhattacharyya2009b>)[58], #link(<bib:Bhattacharyya2009>)[43], #link(<bib:Zhang2009c>)[72], #link(<bib:Singh2012>)[50]]. In
contrast, for certain light lanthanide-based compounds, such as
Pr$""_2$In and Nd$""_2$In, significantly longer annealing times---up to
three weeks---have been reported #[#link(<bib:Biswas2020>)[18], #link(<bib:Biswas2022b>)[63], #link(<bib:Biswas2023>)[76]]. In
comparison, orthorhombic R$""_2$In compounds (R = Eu and Yb) were
synthesized by melting the constituent elements in sealed tantalum
crucibles under a partial atmosphere of ultrapure argon using a
resistive furnace between 900 and 1000$""^compose$C
#[#link(<bib:Guillou2018>)[17], #link(<bib:Guillou2020>)[75]]. This approach was employed to minimize
rare-earth evaporation during the melting process. During synthesis, the
crucible was enclosed within a highly pure helium-filled quartz tube to
prevent oxidation of the tantalum at elevated temperatures
#[#link(<bib:Guillou2018>)[17], #link(<bib:Guillou2020>)[75]]. Following melting, these compounds required
annealing at lower temperatures, typically between 650 and 700
$""^compose$C, for 1--2 days #[#link(<bib:Guillou2018>)[17], #link(<bib:Guillou2020>)[75]].

Most light rare-earth-based R$""_2$In compounds, as well as Yb$""_2$In
and the non-lanthanide compound Y$""_2$In, are highly air-sensitive and
unstable under ambient conditions
#[#link(<bib:Biswas2020>)[18], #link(<bib:Biswas2022b>)[63], #link(<bib:Biswas2023>)[76], #link(<bib:Guillou2018>)[17], #link(<bib:Guillou2020>)[75], #link(<bib:Ravot1995>)[69], #link(<bib:Svanidze2008>)[74], #link(<bib:Forker2005>)[42]].
Consequently, all sample handling was carried out in an argon-filled
glovebox. In this context, Forker #emph[et al.]~reported significant
difficulties in obtaining reliable X-ray diffraction (XRD) data for
Pr$""_2$In due to its rapid oxidation, even when powders were prepared
in a glovebox and protected with silicone grease #[#link(<bib:Forker2005>)[42]]. By
contrast, successful XRD measurements on several light rare-earth-based
R$""_2$In compounds, including Pr$""_2$In, have been achieved by
preparing and mounting the powders entirely inside a glovebox and
subsequently covering them with a thin Kapton film
#[#link(<bib:Biswas2020>)[18], #link(<bib:Biswas2022b>)[63], #link(<bib:Biswas2023>)[76]] or sealed within a Kapton capillary
#[#link(<bib:Biswas2022a>)[62]]. It is worth noting that Nd$""_2$In exhibits better air
stability compared to Pr$""_2$In and hence partial substitution of Pr by
Nd improves the ambient stability of Pr$""_2$In #[#link(<bib:Biswas2023>)[76]].

== Crystal structure of R$""_2$In
<crystal-structure-of-r_2in>
R$""_2$In compounds are reported to form with all rare earth elements,
except unstable Pm, and their lattice parameters and structure types are
reported in @tab:structure. Among all R$""_2$In compounds where R
is a lanthanide, only two---Eu$""_2$In and Yb$""_2$In---crystallize in
the Co$""_2$Si orthorhombic structure (space group #emph[Pnma]), while
the remaining members of the family adopt a Ni$""_2$In-type hexagonal
structure (space group #emph[P6$""_3$/mmc]) at room
temperature~#[#link(<bib:Guillou2018>)[17], #link(<bib:Biswas2020>)[18], #link(<bib:Bazela1988>)[68], #link(<bib:Singh2025>)[84]]. The lattice
volume of the hexagonal structure systematically decreases from light to
heavy lanthanide elements \[@Fig2\(e) and @tab:structure\] in
accordance with the lanthanide contraction~#[#link(<bib:Bazela1988>)[68], #link(<bib:Singh2025>)[84]]. A
significantly larger normalized volume per formula unit is observed for
the orthorhombic structure as compared to the hexagonal one
\[@Fig2\(e)\]. Notably, none of the R$""_2$In compounds with R
belonging to the lanthanide series undergo a change in crystal symmetry
upon cooling at the magnetic ordering temperature; they retain their
room-temperature structure as the ground state, even though they may
exhibit variations in lattice parameters and unit cell volume near their
magnetic transition
temperatures~#[#link(<bib:Guillou2018>)[17], #link(<bib:Biswas2020>)[18], #link(<bib:Biswas2022a>)[62], #link(<bib:Biswas2022b>)[63], #link(<bib:Singh2025>)[84]].
A notable exception is Y$""_2$In, a R$""_2$In compound based on the
non-lanthanide rare earth (Y), which transforms from the hexagonal (room
temperature) to the orthorhombic (low temperature) structure around
250~K~#[#link(<bib:Svanidze2008>)[74]]. It is worth mentioning that in both hexagonal and
orthorhombic structures, rare-earth atoms reside in two
symmetry-distinctive sites as shown in @Fig2\(a--d),
respectively~#[#link(<bib:Guillou2018>)[17], #link(<bib:Biswas2020>)[18], #link(<bib:Biswas2022b>)[63]].

#figure(scope: "parent",

  align(center)[#table(
    columns: 7,
    align: (left,left,left,left,left,left,left,),
    table.header([#strong[Compound]], [#strong[Crystal structure]], [$a$
      (Å)], [$b$ (Å)], [$c$ (Å)], [$V$ (Å$""^3$)], [#strong[Reference]],),
    table.hline(),
    [Sc$""_2$In], [Hex-Ni$""_2$In], [5.05], [5.05], [6.30], [139.14], [#[#link(<bib:Wiendlocha2006>)[83]]],
    [Y$""_2$In], [Hex-Ni$""_2$In], [5.3599(2)], [5.3599(2)], [6.7647(3)], [168.57], [#[#link(<bib:Svanidze2008>)[74]]],
    [], [Ortho-Co$""_2$Si (at 200
    K)$""^"@"$], [6.7486(4)], [5.1426(4)], [9.7382(7)], [337.97], [#[#link(<bib:Svanidze2008>)[74]]],
    [La$""_2$In], [Hex-Ni$""_2$In], [5.636], [5.636], [7.065], [194.3501], [#[#link(<bib:Palenzona1968>)[78]]],
    [Ce$""_2$In], [Hex-Ni$""_2$In], [5.562], [5.562], [6.911], [185.1542], [#[#link(<bib:Palenzona1968>)[78]]],
    [], [], [5.47(1)], [5.47(1)], [6.820(1)], [176.7(1)], [#[#link(<bib:Bazela1988>)[68]]],
    [Pr$""_2$In], [Hex-Ni$""_2$In], [5.534], [5.534], [6.893], [182.8173], [#[#link(<bib:Palenzona1968>)[78]]],
    [], [], [5.528(6)], [5.528(6)], [6.878], [182.024], [#[#link(<bib:Cui2022>)[65]]],
    [], [], [5.539(6), 5.539(2)], [5.539(6), 5.539(2)], [6.902(10),
    6.895(3)], [183.254, 183.201], [#[#link(<bib:Biswas2020>)[18]]$""^(*)$],
    [], [], [5.484(1)], [5.484(1)], [6.840(2)], [178.148], [#[#link(<bib:Liu2024>)[73]]],
    [], [], [5.5335], [5.5335], [6.8969], [182.887], [#[#link(<bib:Biswas2022a>)[62]]],
    [Nd$""_2$In], [Hex-Ni$""_2$In], [5.505], [5.505], [6.868], [180.2501], [#[#link(<bib:Palenzona1968>)[78]]],
    [], [], [5.490(1)], [5.490(1)], [6.850(1)], [178.80], [#[#link(<bib:Bazela1988>)[68]]],
    [], [], [5.5085(7)], [5.5085(7)], [6.8745(10)], [180.650], [#[#link(<bib:Biswas2022b>)[63]]],
    [], [], [5.491(3)], [5.491(3)], [6.856(4)], [178.989], [#[#link(<bib:Cui2022>)[65]]],
    [Sm$""_2$In], [Hex-Ni$""_2$In], [5.450], [5.450], [6.785], [174.5314], [#[#link(<bib:Palenzona1968>)[78]]],
    [Eu$""_2$In], [Ortho-Co$""_2$Si], [7.4536(6)], [5.5822(5)], [10.312(1)], [429.056], [#[#link(<bib:Guillou2018>)[17]]],
    [], [], [7.445(2)], [5.573(1)], [10.306(4)], [427.61], [#[#link(<bib:Fornasini1990>)[79]]],
    [Gd$""_2$In], [Hex-Ni$""_2$In], [5.413], [5.413], [6.756], [171.4338], [#[#link(<bib:Palenzona1968>)[78]]],
    [], [], [5.410(1)], [5.410(1)], [6.751(1)], [170.7(1)], [#[#link(<bib:Bazela1988>)[68]]],
    [], [], [5.413], [5.413], [6.750], [178.282], [#[#link(<bib:Singh2012>)[50]]],
    [], [], [5.413], [5.413], [6.756], [171.4], [#[#link(<bib:Tence2016>)[52]]],
    [], [], [5.461], [5.461], [6.771], [174.875], [#[#link(<bib:Taskaev2021>)[55]]],
    [], [], [5.41], [5.41], [6.76], [171.345], [#[#link(<bib:Jee1996>)[57]]],
    [Tb$""_2$In], [Hex-Ni$""_2$In], [5.367], [5.367], [6.707], [167.3101], [#[#link(<bib:Palenzona1968>)[78]]],
    [], [], [5.360(7)], [5.360(7)], [6.702(5)], [166.7(6)], [#[#link(<bib:Bazela1988>)[68]]],
    [], [], [5.367], [5.367], [6.707], [167.310], [#[#link(<bib:OlzonDionysio1992>)[71]]],
    [Dy$""_2$In], [Hex-Ni$""_2$In], [5.346], [5.346], [6.677], [165.2608], [#[#link(<bib:Palenzona1968>)[78]]],
    [], [], [5.340], [5.340], [6.660], [164.470], [#[#link(<bib:Bhattacharyya2009>)[43]]],
    [], [], [5.349(1)], [5.349(1)], [6.675(1)], [165.4(1)], [#[#link(<bib:Bazela1988>)[68]]],
    [Ho$""_2$In], [Hex-Ni$""_2$In], [5.319], [5.319], [6.662], [163.2282], [#[#link(<bib:Palenzona1968>)[78]]],
    [], [], [5.314(3)], [5.314(3)], [6.670(5)], [163.1(3)], [#[#link(<bib:Bazela1988>)[68]]],
    [], [], [5.300], [5.300], [6.660], [162.0155], [#[#link(<bib:Bhattacharyya2009b>)[58]]],
    [], [], [5.3216(10)], [5.3216(10)], [6.6667(9)], [163.5031], [#[#link(<bib:Anh2006>)[80]]],
    [], [], [5.301], [5.301], [6.624], [161.201], [#[#link(<bib:Ravot1992>)[60]]],
    [Er$""_2$In], [Hex-Ni$""_2$In], [5.297], [5.297], [6.641], [161.3705], [#[#link(<bib:Palenzona1968>)[78]]],
    [], [], [5.295(3)], [5.295(3)], [6.580(5)], [161.4(3)], [#[#link(<bib:Bazela1988>)[68]]],
    [], [], [5.2909(6)], [5.2909(6)], [6.6373(9)], [160.9093], [#[#link(<bib:Ravot1993>)[45]]],
    [Tm$""_2$In], [Hex-Ni$""_2$In], [5.274], [5.274], [6.621], [159.4904], [#[#link(<bib:Palenzona1968>)[78]]],
    [Yb$""_2$In], [Ortho-Co$""_2$Si], [7.093(1)], [5.3296(7)], [9.884(2)], [373.643], [#[#link(<bib:Guillou2020>)[75]]],
    [], [], [7.072(2)], [5.340(1)], [9.866(5)], [372.584], [#[#link(<bib:McMasters1971>)[82]]],
    [Lu$""_2$In], [Hex-Ni$""_2$In], [5.239], [5.239], [6.569], [156.1445], [#[#link(<bib:Palenzona1968>)[78]]],
  )]
  , kind: table,
  caption: [Crystal structure types and lattice parameters of R₂In binary compounds at room temperature#super[\@].],
) <tab:structure>

#block[
$""^(*)$Lattice parameters of two different samples of Pr$""_2$In
prepared via different methods as reported in Ref. #[#link(<bib:Biswas2020>)[18]]. \
$""^"@"$Crystal structure and lattice parameters of Y$""_2$In
at 200~K are also presented.

]
#figure(image("source/Fig3.png", width: 78%), scope: "parent",
  caption: [
    Formation energies ($E_(upright(f o r m))$) per atom for R$""_2$In
    across the lanthanide series (La $arrow.r$ Lu). Blue circles mark
    calculated $E_(upright(f o r m))$ (eV$dot.op$atom$""^(- 1)$) for
    compounds relaxed in the hexagonal ($P 6_3 \/ m m c$) motif, while
    the two red squares at $f = 6$ and $f = 13$ indicate much less
    negative enthalpies and a ground-state switch to an orthorhombic
    ($P n m a$) structure (shaded columns). The abrupt energy increase
    at these two $f$-counts ($approx 0.15$--0.18 eV/atom relative to
    neighbors) signals $f$-electron/valence-driven changes in bonding
    (e.g., divalent character or $f$-localization) and coincides with
    the annotated $P 6_3 \/ m m c$ $arrow.r$ $P n m a$ structural
    change. Figure is reprinted with permission from #[#link(<bib:Singh2025>)[84]],
    Copyright (2025) by the American Physical Society.
  ]
)
<Fig3>

To clarify the ground-state stability of crystal structure in R$""_2$In
compounds, @Fig3 reproduces the phase-stability results from
Singh #emph[et al.] #[#link(<bib:Singh2025>)[84]], showing Density functional theory (DFT)
based formation energies, plotted as a function of the 4$f$-electron
count. Notably, most R$""_2$In compounds in the La $arrow.r$ Lu row have
negative formation energies around $- 0.45$ to $- 0.50$ eV/atom,
indicating a clear stability, while two clear outliers appear near
$f = 6$ and $f = 13$. Those two points (red squares) have much less
negative formation energies ($- 0.32$ to $- 0.34$ eV/atom), a change on
the order of $0.15$--$0.18$ eV/atom compared with their neighbors, and
in those compositions the crystal structure changes from the hexagonal
$P 6_3 \/ m m c$ to an orthorhombic $P n m a$. Because the anomalies
align with the specific $f$-electron numbers, the most natural
interpretation is that filling of the $f$-electron shell dictates
changes in valence and localization of the $f$ orbitals, which strongly
modifies bonding and therefore structural preference.

Across the lanthanide series, the DFT-calculated formation energy shows
clear anomaly for Eu$""_2$In and Yb$""_2$In compounds (@Fig3). This
behavior can be attributed to electron transfer from the 5$d^1$ state to
the 4$f^6$/4$f^13$ states, resulting in the more stable 4$f^7$/4$f^14$
configurations. These changes in the 5$d$ state together with the
significant increase in atomic size of now divalent rare-earth atoms
promote stabilization of the orthorhombic $P n m a$ phase in Eu$""_2$In
and Yb$""_2$In, respectively. This highlights the significant influence
of 4$f$--5$d$ electron transfer on the structural phase stability of
R$""_2$In compounds #[#link(<bib:Singh2025>)[84]]. To further elaborate, such valency
change (e.g., divalent behavior of Eu or Yb) or abrupt changes in the
effective ionic radius due to lanthanide contraction can modify R--In
bond lengths and packing and thus destabilize the hexagonal structure in
favor of an orthorhombic distortion #[#link(<bib:Singh2025>)[84]]. Localized $f$-electrons
and associated magnetic/orbital interactions also alter the total energy
and may favor a lower-symmetry lattice that better accommodates the
electronic or magnetic state.

== Magnetic properties and phase transitions of R$""_2$In
<magnetic-properties-and-phase-transitions-of-r_2in>
Depending on the choice of R, R$""_2$In compounds exhibit various types
of phase transitions leading to complex magnetic states. It is well
established that the magnetic ordering temperatures ($T_(upright(C))$)
of rare-earth intermetallics generally scale with the de Gennes factor,
defined as dG $= \( g - 1 \)^2 J \( J + 1 \)$, where $g$ is the Landé
$g$-factor and $J$ is the total angular momentum quantum number
#[#link(<bib:Singh2023>)[85]]. In an earlier study, Forker #emph[et al.] reported an
approximately linear relation between transition temperatures (extracted
from the hyperfine field experiment) and dG for R$""_2$In compounds in
cases of both heavy as well as light rare-earth elements #[#link(<bib:Forker2005>)[42]]. In
@Fig4\(a), we plot the $T_(upright(C))$ of R$""_2$In compounds
alongside the de Gennes factor of the corresponding rare-earth elements
as a function of atomic number ($Z$). Both $T_(upright(C))$ and dG
exhibit a maximum for Gd$""_2$In and decrease away from it. The
variation of $T_(upright(C))$ of different hexagonal R$""_2$In compounds
with dG of respective trivalent rare-earths \[@Fig4\(b)\] shows
that $T_(upright(C))$ linearly scales with dG for only four R$""_2$In
compounds (R = Tm, Er, Ho, and Dy) where the transition is second-order
ferromagnetic. However, a notable deviation from the linear scaling
relation has been observed for compounds with $Z < 66$, possibly because
of either the onset of competition between antiferromagnetic and
ferromagnetic states at low temperature (for Tb$""_2$In, Gd$""_2$In, and
Sm$""_2$In) #[#link(<bib:Zhang2009c>)[72], #link(<bib:Bhattacharyya2012>)[51], #link(<bib:McAlister1984b>)[70]] or because the
nature of the transition changes to first-order (Pr$""_2$In, Nd$""_2$In)
#[#link(<bib:Biswas2020>)[18], #link(<bib:Biswas2022b>)[63], #link(<bib:Liu2021>)[64]]. The reported ordering temperatures and
other magnetic parameters of R$""_2$In compounds are given in
@tab:tc.

#figure(image("source/Fig4.png", width: 100%), scope: "parent",
  caption: [
    \(a) Variation of the $T_(upright(C))$ of R$""_2$In compounds (blue
    dots) and the de Gennes factor (dG) of the corresponding rare-earth
    elements (red dots) with atomic number ($Z$). For Eu$""_2$In
    ($Z = 63$) and Yb$""_2$In ($Z = 70$), dG is calculated assuming the
    divalent state of rare-earth elements, whereas for all other
    compounds, the tri-valency of rare-earths is considered. (b)
    $T_(upright(C))$ versus de Gennes factor for the hexagonal R$""_2$In
    compounds. Here transition temperatures of R$""_2$In compounds are
    taken from Refs.
    #[#link(<bib:Guillou2018>)[17], #link(<bib:Biswas2020>)[18], #link(<bib:Forker2005>)[42], #link(<bib:Bhattacharyya2009>)[43], #link(<bib:Ravot1993>)[45], #link(<bib:Singh2012>)[50], #link(<bib:Bhattacharyya2009b>)[58], #link(<bib:Biswas2022b>)[63], #link(<bib:McAlister1984b>)[70], #link(<bib:Chen1989>)[86]].
  ]
)
<Fig4>

To understand the role of rare-earth elements on magnetic properties and
phase transitions in R$""_2$In, Forker #emph[et al.] explored the
hyperfine interactions---both magnetic and electric---of the probe
isotope $""^111$Cd situated on the indium site in a series of R$""_2$In
compounds (with R = Pr, Nd, Sm, Gd, Dy, Ho, Er, and Tm), using perturbed
angular correlation (PAC) spectroscopy #[#link(<bib:Forker2005>)[42]]. According to their
study, within the paramagnetic regime, the observed quadrupole
interaction shows a substantial decline---over an order of
magnitude---across the series from Pr to Er, highlighting the
significant role of 4$f$ electron configurations in influencing the
local charge environment at the indium site #[#link(<bib:Forker2005>)[42]].

In the magnetically ordered phase, comprehensive measurements were
carried out to evaluate the temperature and spin behavior of the
magnetic hyperfine field, including its alignment with respect to the
crystallographic $c$-axis of the hexagonal structure #[#link(<bib:Forker2005>)[42]].
Comparison between the hyperfine fields of $""^111$Cd in the R$""_2$In
compounds and in elemental rare-earth metals suggests that the indirect
coupling between 4$f$ electrons is primarily mediated through
intra-atomic 4$f$--5$d$ exchange and interatomic 5$d$--5$d$
interactions, rather than through $s$-conduction electron mechanisms.
Differences in the strength of the $f$--$d$ exchange interaction,
characterized by the exchange parameter $tau$, are evident between
lighter (Pr, Nd, Sm) and heavier (Gd, Tb, etc.) rare-earth elements,
with the former exhibiting significantly stronger coupling #[#link(<bib:Forker2005>)[42]].

Interestingly, among the systems studied, only Pr$""_2$In and Nd$""_2$In
exhibit an abrupt discontinuity in the hyperfine field at the magnetic
transition temperature---an indication of a first-order magnetic phase
transition #[#link(<bib:Forker2005>)[42]]. In contrast, the remaining compounds display a
smooth, continuous change in the hyperfine field. Near the transition
temperature, an observable broadening of the magnetic interaction
linewidth points to spatial inhomogeneities in the magnetic exchange and
a distributed range of local Curie temperatures. Additionally, changes
in the angular orientation of the 4$f$ magnetic moments relative to the
crystal's $c$-axis as a function of temperature were inferred from
variations in the hyperfine field direction with respect to the
principal axis of the electric field gradient #[#link(<bib:Forker2005>)[42]].

#figure(scope: "parent",

  align(center)[#table(
    columns: 7,
    align: (left,left,left,left,left,left,left,),
    table.header([Compound], [Transition
      temperature], [$mu_(upright(e f f))$
      ($mu_(upright(B))$/f.u.)], [$M_(upright(s))$
      ($mu_(upright(B))$/f.u.)], [-$Delta S_(upright(M a x))$\(J/kg.K)
      {$Delta$H (kOe)}], [$Delta T_(upright(a d))$\(K) {$Delta$H
      (kOe)}], [References],),
    table.hline(),
    [Ce$""_2$In], [$T_(upright(N)) = 12$
    K], [4.143], [], [], [], [#[#link(<bib:Bazela1988>)[68], #link(<bib:Chen1989>)[86]]],
    [Pr$""_2$In], [$T_(upright(C)) = 57$ K, $T_(upright(S R)) = 35$
    K], [5.2], [3.2], [15 {20}], [2 {20}], [#[#link(<bib:Biswas2020>)[18], #link(<bib:Liu2024>)[73]]],
    [], [$T_(upright(C)) = 57$ K, $T_(upright(S R)) = 38$
    K], [], [], [], [], [#[#link(<bib:Cui2022>)[65]]],
    [Nd$""_2$In], [$T_(upright(C)) = 110$ K, $T_(upright(S R)) = 53$
    K], [5.18], [4.94], [13 {20}], [], [#[#link(<bib:Biswas2022b>)[63]]],
    [], [$T_(upright(C)) = 109$ K, $T_(upright(S R)) = 50$
    K], [], [], [], [1.13 {19.5}], [#[#link(<bib:Liu2021>)[64]]],
    [Sm$""_2$In], [$T_(upright(C)) = 152$
    K], [], [], [], [], [#[#link(<bib:McAlister1984b>)[70]]],
    [Eu$""_2$In], [$T_(upright(C)) = 55$ K], [12.02], [14.4], [26
    {20}], [5 {20}], [#[#link(<bib:Guillou2018>)[17]]],
    [Gd$""_2$In], [$T_(upright(C)) = 187$ K, $T_(upright(N)) = 100$
    K], [], [], [], [], [#[#link(<bib:Singh2012>)[50]]],
    [], [$T_(upright(C)) = 190$ K, $T_(upright(N)) = 105$
    K], [], [], [], [], [#[#link(<bib:Bhattacharyya2012>)[51]]],
    [], [$T_(upright(C)) = 187$ K, $T_(upright(N)) = 99.5$
    K], [], [], [], [], [#[#link(<bib:McAlister1984a>)[53]]],
    [], [$T_(upright(C)) = 194$ K, $T_(upright(N)) = 95$
    K], [], [], [3.25 {30}], [], [#[#link(<bib:Taskaev2021>)[55]]],
    [], [$T_(upright(C)) = 190$ K, $T_(upright(N)) = 100$
    K], [10.06], [], [], [], [#[#link(<bib:Jee1996>)[57]]],
    [Tb$""_2$In], [$T_(upright(C)) = 165$ K, $T_(upright(N)) = 45$
    K], [], [], [6.6 {50}], [], [#[#link(<bib:Zhang2009c>)[72]]],
    [Dy$""_2$In], [$T_(upright(C)) = 125$ K, $T_(upright(S R)) = 50$
    K], [15.6], [17], [7.1 {40}], [], [#[#link(<bib:Bhattacharyya2009>)[43]]],
    [], [$T_(upright(C)) = 130$ K], [], [], [], [], [#[#link(<bib:Zhang2009>)[44]]],
    [Ho$""_2$In], [$T_(upright(C)) = 85$ K, $T_(upright(S R)) = 32$
    K], [15], [], [], [], [#[#link(<bib:Bhattacharyya2009b>)[58]]],
    [], [$T_(upright(C)) = 85$ K, $T_(upright(S R)) = 32$
    K], [], [], [11.2 {50}], [], [#[#link(<bib:Zhang2009b>)[59]]],
    [Er$""_2$In], [$T_(upright(C)) = 40$
    K], [], [16], [], [], [#[#link(<bib:Ravot1993>)[45]]],
    [], [$T_(upright(C)) = 46$ K], [13.58], [], [16
    {50}], [], [#[#link(<bib:Zhang2011>)[46]]],
    [Tm$""_2$In], [$T_(upright(C)) = 17$
    K], [10.75], [], [], [], [#[#link(<bib:Forker2005>)[42], #link(<bib:GamariSeale1979>)[66]]],
    [Yb$""_2$In], [Diamagnetic], [], [], [], [], [#[#link(<bib:Guillou2020>)[75]]],
    [Y$""_2$In], [Paramagnetic], [], [], [], [], [#[#link(<bib:Svanidze2008>)[74]]],
  )]
  , kind: table,
  caption: [Magnetic and magnetocaloric parameters for R₂In compounds.],
) <tab:tc>

#figure(image("source/Fig5.png", width: 100%), scope: "parent",
  caption: [
    The first-order transition with negligible thermomagnetic hysteresis
    in Pr$""_(2 - x)$Nd$""_x$In ($x = 0 \, thin 1 \, thin 2$) is
    evidenced by a sharp transition in the $M$ vs.~$T$ plots shown in
    (a) #[#link(<bib:Biswas2020>)[18], #link(<bib:Biswas2022a>)[62], #link(<bib:Biswas2022b>)[63], #link(<bib:Biswas2023>)[76]]. Open and closed
    circles represent $M \( T \)$ data taken during heating and cooling
    cycles, respectively. (b) The temperature dependence of the specific
    heat for Eu$""_2$In exhibits a pronounced $delta$-like peak at the
    transition, indicating a large latent heat. Inset: $C_p \( T \)$
    near the transition during heating and cooling cycles #[#link(<bib:Guillou2018>)[17]].
    Figure (b) is reproduced from Ref. #[#link(<bib:Guillou2018>)[17]] under Creative
    Commons Attribution 4.0 International license.
  ]
)
<Fig5>

#heading(level: 3, numbering: none)[~ B.1. Peculiarities of magnetic
phase transitions in R$""_2$In with R= light rare-earth atoms
(4$f^(< 7)$)]
<b.1.-peculiarities-of-magnetic-phase-transitions-in-r_2in-with-r-light-rare-earth-atoms-4f7>
#heading(level: 4, numbering: none)[]
<section>
\
First-order magnetic phase transitions (FOMPTs), characterized by their
discontinuous nature, are considerably less prevalent in condensed
matter than their continuous, second-order counterparts. Nevertheless,
they occur across a diverse array of solid materials---including ionic
compounds, metals, semimetals, and semiconductors---positioning them as
a focal point of contemporary research. These transitions are appealing
due to their potential to generate strong non-linear responses to
external stimuli, which may lead to remarkable functionalities such as,
for example, giant magnetocaloric effect (GMCE)
#[#link(<bib:Roy2013>)[87], #link(<bib:Trung2010>)[88], #link(<bib:Wei2015>)[89], #link(<bib:Biswas2019a>)[90], #link(<bib:Bez2019>)[91]]. FOMPTs frequently emerge
when magnetic ordering is coupled to structural modifications of the
crystal lattice, giving rise to magnetostructural transformations (MST)
that are typically accompanied by thermomagnetic hysteresis
#[#link(<bib:Wei2015>)[89], #link(<bib:Biswas2019a>)[90], #link(<bib:Bez2019>)[91], #link(<bib:Fujita2003>)[92], #link(<bib:Ritter2024>)[93]]. However, cycling
materials through hysteretic MSTs leads to energy dissipation, posing a
challenge for practical applications, particularly in energy-related
fields like solid-state caloric cooling.

To overcome these limitations, extensive research has focused on
engineering materials where magnetic and structural sub-lattices evolve
together with minimal hysteresis. Recent advancements suggest that
thermomagnetic hysteresis can, in fact, be mitigated, thereby improving
the reversibility and efficiency of MST-related functionalities, most
notably, the GMCE. Thus far, successful reduction of hysteresis has been
largely restricted to transition-metal-based systems #[#link(<bib:Guillou2018>)[17]]. In
these materials, FOMPTs often involve discontinuous volume changes while
retaining crystallographic symmetry, a behavior governed by
thermodynamic constraints. One prominent example is the
LaFe$""_(13 - x)$Si$""_x$ family of compounds, which exhibit a giant
magnetocaloric response with minimal hysteresis #[#link(<bib:Fujita2003>)[92]]. Their
transition temperatures are tunable between approximately 200 and 350 K
through chemical modification or hydrogenation. The underlying
transitions in these and similar compounds are classified as
magneto-elastic transformations (METs), closely linked to the unusual
characteristics of itinerant-electron metamagnetism (IEM) #[#link(<bib:Asti1994>)[12]].

In a recent breakthrough, an R$""_2$In-type compound Eu$""_2$In was
found to undergo a FOMPT from a high-temperature paramagnetic (PM) state
to a low-temperature ferromagnetic (FM) state at
$T_(upright(C)) = 55$~K. This transition is particularly remarkable as
it is associated with exceptionally low thermomagnetic hysteresis
($tilde.op 0.1$~K), earning it the designation of a "non-hysteretic
first-order transition"#[#link(<bib:Guillou2018>)[17]]. X-ray absorption near edge
spectroscopy (XANES), X-ray magnetic circular dichroism (XMCD), and
$""^151$Eu Mössbauer experiments conclusively confirm that Eu exists in
a divalent state in Eu$""_2$In down to 5~K #[#link(<bib:Guillou2018>)[17], #link(<bib:Ryan2019>)[48]].

The first-order nature of this transition is clearly evidenced by a
pronounced $delta$-like peak in the specific heat data \[see Fig.~5(b)\]
and large latent heat, $Delta L approx 1.4$~kJ/kg. Although the
transition is first-order, the crystallographic symmetry remains
orthorhombic across the studied temperature range between 5 and 300~K,
with relatively minor discontinuous changes in the lattice parameters
($Delta a \/ a approx 0.08 %$, $Delta b \/ b approx 0.04 %$, and
$Delta c \/ c approx 0.03 %$) and a slight increase in lattice volume
($Delta V \/ V approx + 0.1 %$) during heating at $T_(upright(C))$
#[#link(<bib:Guillou2018>)[17]]. Thus, Eu$""_2$In exhibits a unique combination of magnetic
and structural characteristics: a first-order magnetoelastic transition
with significant latent heat yet minimal thermomagnetic hysteresis---an
exceedingly rare combination among rare-earth-based intermetallic
compounds. The application of hydrostatic pressure (up to 0.85~GPa)
causes a slight positive shift in the transition temperature
($partial T_(upright(C)) \/ partial P approx 2$~K$dot.op$GPa$""^(- 1)$).
This is because the low-temperature FM phase is the low-volume phase
#[#link(<bib:Guillou2018>)[17]], and the applied pressure therefore stabilizes the FM
configuration. Free-energy analysis predicts that the first-order nature
of the transition weakens under increasing magnetic field and eventually
becomes second-order for fields $H gt.eq 2.5$~T #[#link(<bib:Alho2020>)[47]].

Mössbauer spectroscopy and neutron diffraction studies on Eu$""_2$In
were also carried out to gain insights into the intriguing magnetism of
the compound #[#link(<bib:Ritter2024>)[93]]. The Mössbauer spectrum of Eu$""_2$In at 5~K
reveals two components of equal area, indicating that Eu occupies two
crystallographic sites of equal multiplicity. However, the distinct
hyperfine fields---27~T and 17~T---suggest different magnetic
environments for the Eu moments on the two $4 c$ sites. Neutron
diffraction data collected at 2.5~K confirm that Eu$""_2$In exhibits
ferromagnetic ordering, with Eu moments on both sites aligned parallel
to the $a$-axis. The measured moment values per Eu1 and Eu2 are
6.8~$mu_(upright(B))$ and 6.5~$mu_(upright(B))$, respectively #[#link(<bib:Ryan2019>)[48]].
Guillou #emph[et al.] also reported the influence of Yb substitution on
the magnetic properties of Eu$""_2$In #[#link(<bib:Guillou2020>)[75]]. Substituting Yb at
the Eu site in Eu$""_2$In leads to a decrease in both the magnetic
ordering temperature and the saturation magnetization. Additionally, the
transition becomes broader compared to that in pure Eu$""_2$In
#[#link(<bib:Guillou2020>)[75]].

#figure(image("source/Fig6.JPG", width: 78%), scope: "parent",
  caption: [
    The variations in lattice parameters and unit cell volume across the
    first-order transition for Pr$""_2$In are presented in (a) and (b),
    respectively #[#link(<bib:Biswas2022a>)[62]]. (c, d) The anomaly in the
    temperature-dependent longitudinal strain under varying magnetic
    fields for Nd$""_2$In reflects a first-order transition. The inset
    in (d) illustrates the corresponding volume change #[#link(<bib:Liu2021>)[64]]. Figures
    (c, d) are reproduced from Ref. #[#link(<bib:Liu2021>)[64]] under Creative Commons
    Attribution 4.0 International license.
  ]
)
<Fig6>

#heading(level: 4, numbering: none)[]
<section-1>
\
The first-order transition with negligible thermomagnetic hysteresis is
also observed in the cases of Pr$""_2$In and Nd$""_2$In
#[#link(<bib:Biswas2020>)[18], #link(<bib:Biswas2022a>)[62], #link(<bib:Biswas2022b>)[63], #link(<bib:Liu2021>)[64], #link(<bib:Cui2022>)[65]]. Unlike Eu$""_2$In,
both samples adopt the hexagonal Ni$""_2$In crystal structure. The
rare-earth atoms (Pr and Nd) are believed to be nominally trivalent in
both compounds, in contrast to Eu$""_2$In where Eu is divalent
#[#link(<bib:Biswas2020>)[18], #link(<bib:Biswas2022a>)[62]].

In Pr$""_2$In, a first-order transition from the paramagnetic to the
ferromagnetic state occurs at $T_(upright(C)) approx 57$~K, as evidenced
by the sharp transition in $M \( T \)$ \[@Fig5\(a)\] and a
$delta$-like anomaly in the heat capacity data #[#link(<bib:Biswas2020>)[18]]. The sample
also exhibits a second-order low-temperature transition at
$tilde.op$35~K \[@Fig5\(a)\], possibly due to spin reorientation
#[#link(<bib:Biswas2020>)[18]]. The high temperature transition shifts to lower values
under the application of hydrostatic pressure
($partial T_(upright(C)) \/ partial P approx - 1.9$~K$dot.op$GPa$""^(- 1)$),
exhibiting a rate of change comparable to that observed in Eu$""_2$In,
although $T_(upright(C))$ decreases in this case. This is because,
unlike Eu$""_2$In, the FM state is the high-volume phase in the case of
Pr$""_2$In, i.e., the unit cell volume increases in the FM state (shown
and discussed below, see @Fig6) #[#link(<bib:Biswas2020>)[18]].

The temperature-dependent X-ray diffraction measurements of Pr$""_2$In
show conventional thermal expansion above $T_(upright(C))$
\[@Fig6\(a, b)\]. However, below $T_(upright(C))$, anomalous
behavior emerges: small but distinct discontinuities appear in the unit
cell volume and the $c$ lattice parameter, while no discontinuity is
detected in the $a b$ basal plane near the transition \[@Fig6\(a)\]
#[#link(<bib:Biswas2022a>)[62]]. As temperature decreases from room temperature toward
$T_(upright(C))$, both the lattice parameter $a$ ($= b$) and the unit
cell volume decrease steadily \[@Fig6\(a)\]. Below
$T_(upright(C))$, both $a$ ($= b$) and the phase volume increase,
whereas the $c$ parameter continues to contract \[@Fig6\(a)\]. The
total volume change across the transition is modest---approximately
0.1%---in agreement with estimates based on the Clausius-Clapeyron
relation #[#link(<bib:Biswas2022a>)[62]]. Importantly, this symmetry-invariant change in
lattice parameters, unit cell volume, and $c \/ a$ ratio coincides with
the magnetic transition \[@Fig6\(a, b)\], providing definitive
evidence for a first-order magnetoelastic phase transition in Pr$""_2$In
#[#link(<bib:Biswas2022a>)[62]]. The preservation of crystallographic symmetry and the
minimal volume change across the transition explain the negligibly small
thermal hysteresis observed in this system.

Notably, the temperature-dependent magnetization behavior is
qualitatively similar for Nd$""_2$In \[@Fig5\(a)\]. A sharp
transition is observed at $tilde.op 110$~K with negligibly small
thermomagnetic hysteresis followed by a second broad transition at
$tilde.op 50$~K \[@Fig5\(a)\] #[#link(<bib:Biswas2022b>)[63], #link(<bib:Liu2021>)[64]]. The sharp
transition at 110~K is believed to be a borderline first-order
transition #[#link(<bib:Biswas2022b>)[63], #link(<bib:GegenMater25>)[77]]. The peak in heat capacity data
associated with this transition is not $delta$-like symmetric as
typically observed in the case of first-order transitions
#[#link(<bib:Biswas2022b>)[63], #link(<bib:GegenMater25>)[77]]. At the same time, Liu #emph[et al.] reported
clear changes in lattice strain during the transition \[@Fig6\(c,
d)\] #[#link(<bib:Liu2021>)[64]]. Their investigations of linear thermal expansion in
multiple magnetic fields point out that the phase transition in
Nd$""_2$In proceeds in two distinct stages, accompanied by negligible
volume change. The longitudinal strain initially increases with applied
magnetic field, followed by a subsequent decrease \[@Fig6\(c, d)\]
#[#link(<bib:Liu2021>)[64]].

The temperature-dependent XRD study shows no change in crystal symmetry
for Nd$""_2$In during the transition. Moreover, unlike in Pr$""_2$In and
Eu$""_2$In, Nd$""_2$In exhibits no discontinuities in either the phase
volume or lattice parameters at $T_(upright(C))$. However, the changes
in the slopes of the temperature dependence of lattice volume and
lattice parameters below $T_(upright(C))$ suggest the presence of weak
magnetoelastic coupling. Further analyses of magnetocaloric parameters
confirm that the magnetoelastic transition in Nd$""_2$In lies on the
borderline between first-order and second-order character. It displays
certain features typical of first-order transitions, such as sharp
magnetic changes #[#link(<bib:Biswas2022b>)[63], #link(<bib:Liu2021>)[64]] and abrupt change in hyperfine
field #[#link(<bib:Forker2005>)[42]], but lacks others, such as structural discontinuities
#[#link(<bib:Biswas2022b>)[63]].

It is worth noting that for both Pr$""_2$In and Nd$""_2$In, the
experimentally observed saturation magnetization is lower than the
theoretically calculated value expected from two symmetry-distinct
rare-earth moments with equal magnetic contributions
#[#link(<bib:Biswas2020>)[18], #link(<bib:Biswas2022b>)[63], #link(<bib:Liu2021>)[64]]. This discrepancy likely arises from
strong crystal field effects, as indicated by hyperfine interaction
measurements #[#link(<bib:Forker2005>)[42]]. Additionally, Pr$""_2$In exhibits significant
magnetic anisotropy, reflected by its large coercivity, whereas
Nd$""_2$In shows comparatively lower coercivity #[#link(<bib:Biswas2020>)[18], #link(<bib:Biswas2022b>)[63]].
Moreover, the solid solution of PrNdIn samples adopts Ni$""_2$In-type
hexagonal crystal structure and also shows borderline first-order
transition with a magnetic transition temperature of 86~K
\[@Fig5\(a)\] #[#link(<bib:Biswas2023>)[76]].

#heading(level: 4, numbering: none)[B.1.c.~R$""_2$In with R = Ce, Sm,
and Y:]
<b.1.c.-r_2in-with-r-ce-sm-and-y>
\
The compound Sm$""_2$In exhibits a ferrimagnetic ground state, setting
it apart from other members of the R$""_2$In series #[#link(<bib:Ravot1995>)[69]]. A
magnetic transition from the paramagnetic to ferrimagnetic state occurs
at approximately 150~K, as confirmed by muon spin spectroscopy studies
#[#link(<bib:Ravot1995>)[69], #link(<bib:McAlister1984b>)[70]]. Notably, McAlister #emph[et al.]
#[#link(<bib:McAlister1984b>)[70]] reported that the ferrimagnetism in Sm$""_2$In is
unusual, as its spontaneous magnetization approaches zero upon cooling
to the lowest temperatures. Ce$""_2$In undergoes a structural phase
transition from a hexagonal structure to an as-yet undefined symmetry
under hydrostatic pressure of 4.6~GPa, suggesting that further
investigation is warranted to determine whether the high-pressure phase
adopts an orthorhombic structure. Magnetization studies indicate that
Ce$""_2$In shows an antiferromagnetic transition at 12~K #[#link(<bib:Chen1989>)[86]].
Y$""_2$In is paramagnetic and exhibits a structural transition from room
temperature Ni$""_2$In crystal structure to low temperature Co$""_2$Si
structure at 250~K #[#link(<bib:Svanidze2008>)[74]].

#heading(level: 3, numbering: none)[~ B.2. R$""_2$In with R = heavy
rare-earth atoms (4$f^(gt.eq 7)$)]
<b.2.-r_2in-with-r-heavy-rare-earth-atoms-4fgeqslant7>
Numerous studies have been reported on the magnetic properties of
R$""_2$In compounds, where R is a heavy rare-earth element (with 4$f$
electron count $gt.eq$ 7). Magnetism of Gd$""_2$In is distinct due to
well characterized metamagnetic behavior, while other compounds are less
studied. Among the R$""_2$In compounds, Gd$""_2$In with zero orbital
magnetic moment exhibits highest paramagnetic to ferromagnetic
transition temperature of $T_(upright(C)) approx 190$ K, followed by a
transition to an antiferromagnetic state at
$T_(upright(N)) approx 100$ K #[#link(<bib:McAlister1984a>)[53], #link(<bib:GamariSeale1979>)[66]].
Pronounced anomalies in the temperature-dependent resistivity near these
transitions have also been observed. McAlister #emph[et al.] proposed
the spiral antiferromagnetic structure along the $c$-axis for the
low-temperature Gd$""_2$In phase #[#link(<bib:McAlister1984a>)[53]]. Subsequent
experimental investigation revealed that the ferromagnetic state of
Gd$""_2$In below $T_(upright(C)) approx 190$ K is actually a helical
ferromagnet #[#link(<bib:Jee1996>)[57]]. Moreover, the antiferromagnetic state below
$T_(upright(N)) approx 100$ K emerges only under low magnetic field and
undergoes a metamagnetic transition at higher fields #[#link(<bib:Jee1996>)[57]].

Further magnetization studies by Bhattacharya #emph[et al.] reaffirmed
these findings, particularly emphasizing the metamagnetic nature of the
antiferromagnetic-to-ferromagnetic (AFM--FM) transition below 100 K
#[#link(<bib:Bhattacharyya2012>)[51]]. The critical field required for this transition at
low temperatures was found to be strongly temperature-dependent. These
magnetization results are consistent with hyperfine-field studies
conducted by Forker #emph[et al.], which indicate that the transition
near 190 K is of second-order nature #[#link(<bib:Forker2005>)[42]]. The influence of
hydrostatic pressure on both magnetic transitions was examined by Liu
#emph[et al.] #[#link(<bib:Liu1987>)[56]]. Their findings show that $T_(upright(C))$
increases slightly under applied pressure, while $T_(upright(N))$
decreases, suggesting that the antiferromagnetic transition may be
completely suppressed below a critical pressure of $tilde.op$30 kbar
#[#link(<bib:Liu1987>)[56]].

The magnetic behavior of Gd$""_2$In is also sensitive to substitution of
In by other $p$-block elements. A comprehensive study by Tencé #emph[et
al.] demonstrated that doping with Group IVA elements (Sn, Pb) enhances
ferromagnetism, as evidenced by a significant increase in
$T_(upright(C))$ (by more than 50 K) and suppression of the
low-temperature antiferromagnetic transition from those obtained for
Gd$""_2$In #[#link(<bib:Tence2016>)[52]]. In contrast, substitution with isoelectronic
Group IIIA elements (Al, Ga) had minimal impact on $T_(upright(C))$,
although the antiferromagnetic transition shifted to lower temperatures
#[#link(<bib:Tence2016>)[52]]. These substitutional effects strongly suggest that
4$f$--5$d$ interactions play a crucial role in magnetic ordering in
Gd$""_2$In.

In the lanthanide series, Lu$""^(3 +)$ ion possesses a fully filled 4$f$
shell (4$f^14$), and has no unpaired electrons. Consequently, Lu$""_2$In
is expected to be non-magnetic, i.e., diamagnetic. In the case of
Yb$""_2$In, analysis based on experimentally obtained lattice parameters
suggests that ytterbium is in a divalent state (Yb$""^(2 +)$\; 4$f^14$),
again leading to a diamagnetic behavior of the compound #[#link(<bib:Guillou2020>)[75]].
Further evidence from resistivity, specific heat, magnetic measurements,
and temperature-dependent X-ray diffraction studies confirms the absence
of magnetic or structural transitions in Yb$""_2$In #[#link(<bib:Guillou2020>)[75]].

Starting from the highest atomic number end of the lanthanide series,
after Lu and Yb, Tm$""_2$In is the first R$""_2$In compound to exhibit
magnetic behavior. Magnetization measurements reveal a maximum in the
temperature-dependent magnetic susceptibility at 17 K, and the
temperature dependent susceptibility obeys the Curie--Weiss law at
higher temperatures, with a paramagnetic Weiss temperature of
approximately 6 K #[#link(<bib:GamariSeale1979>)[66], #link(<bib:Parviainen1980>)[67]].

Magnetic and electrical resistivity measurements, along with Mössbauer
spectroscopy and neutron powder diffraction, show that Er$""_2$In
undergoes a ferromagnetic transition below a critical temperature of
$T_(upright(C)) approx 40$ K #[#link(<bib:Ravot1993>)[45]]. The magnetic moments of
Er$""^(3 +)$ ions at the (2$a$) and (2$d$) crystallographic sites are
found to be identical and Mössbauer spectroscopy reports saturation
moment per Er atom as
$M_(upright(S)) = 8.0 plus.minus 0.4 thin mu_(upright(B))$ at 4.2 K,
while neutron diffraction yields
$M = 7.7 plus.minus 0.2 thin mu_(upright(B))$ at 1.5 K. These values are
slightly lower than the theoretical saturated magnetic moment value for
a free Er$""^(3 +)$ ion ($g J = 9 thin mu_(upright(B))$), likely due to
the influence of the crystalline electric field (CEF) #[#link(<bib:Ravot1993>)[45]]. A
second-order ferromagnetic transition at slightly higher
$T_(upright(C)) = 46$ K has been also reported by Zhang #emph[et al.],
underscored by a $lambda$-type anomaly in the specific heat #[#link(<bib:Zhang2011>)[46]].
Above $T_(upright(C))$, the magnetic susceptibility follows the
Curie--Weiss law, with an effective paramagnetic moment close to the
theoretical value for a free Er$""^(3 +)$ ion #[#link(<bib:Zhang2011>)[46]].

For Ho$""_2$In, magnetization studies indicate two successive magnetic
transitions: a ferromagnetic ordering transition at
$T_(upright(C)) approx 85$ K, followed by a spin-reorientation
transition at $T_(upright(S R)) approx 32$ K #[#link(<bib:Zhang2009b>)[59]]. These
transitions are corroborated by magneto-transport and muon spin rotation
($mu$SR) measurements #[#link(<bib:Bhattacharyya2009b>)[58], #link(<bib:Ravot1997>)[61]]. Bhattacharya
#emph[et al.] also reported the presence of short-range magnetic
fluctuations persisting above $T_(upright(C))$ #[#link(<bib:Bhattacharyya2009b>)[58]].
Neutron diffraction studies on Ho$""_2$In revealed a collinear
ferromagnetic configuration below $tilde.op$80 K, with four equivalent
magnetic moments on Ho$""^(3 +)$ ions within the unit cell #[#link(<bib:Ravot1992>)[60]].
The orientation of these moments is temperature-dependent: at higher
temperatures (40 K $<$ T $<$ 80 K) they align along or near the
hexagonal $c$-axis; at lower temperatures they gradually rotate toward
the basal plane, reaching an inclination of approximately 30$""^compose$
at T = 20 K. The characteristic temperatures (T $approx$ 80 K and 20 K
$<$ T $<$ 40 K) correspond to the two magnetic transitions observed in
the system #[#link(<bib:Ravot1992>)[60]].

#figure(image("source/Fig7.png", width: 78%), scope: "parent",
  caption: [
    The temperature dependence of $Delta T_(upright(a d))$ and $Delta S$
    for Eu$""_2$In is presented in (a) and (b), respectively. The filled
    symbols and open symbols curves represent $Delta S$ calculated from
    calorimetry and magnetization, respectively. Figures (a, b) are
    reproduced from Ref. #[#link(<bib:Guillou2018>)[17]] under Creative Commons Attribution
    4.0 International license. The variation of $Delta S \( T \)$ for
    Pr$""_(2 - x)$Nd$""_x$In at $H = 20$ kOe is shown in (c)
    #[#link(<bib:Biswas2020>)[18], #link(<bib:Biswas2022b>)[63], #link(<bib:Biswas2023>)[76]], while (d) compares the maximum
    $Delta S$ near the magnetic transition of different R$""_2$In
    compounds (for $Delta H = 20$ kOe) as a function of their transition
    temperatures
    #[#link(<bib:Guillou2018>)[17], #link(<bib:Biswas2020>)[18], #link(<bib:Bhattacharyya2009>)[43], #link(<bib:Zhang2011>)[46], #link(<bib:Bhattacharyya2012>)[51], #link(<bib:Zhang2009c>)[72], #link(<bib:Bhattacharyya2009b>)[58]].
  ]
)
<Fig7>

Dy$""_2$In shows second-order ferromagnetic transition at
$T_(upright(C)) approx 130$ K #[#link(<bib:Zhang2009>)[44]], with an additional
low-temperature spin-reorientation transition near 50 K
#[#link(<bib:Bhattacharyya2009>)[43]]. The second-order nature of the ferromagnetic
transition is reflected in a $lambda$-type anomaly in the specific heat
#[#link(<bib:Bhattacharyya2009>)[43]]. Dy$""_2$In also exhibits significant
magnetostriction: near the transition temperature, magnetostriction
increases almost linearly with magnetic field, reaching
$tilde.op$100 ppm at 70 kOe. Substituting part of the indium with
aluminum results in a reduction of the magnetic transition temperature
in Dy$""_2$In$""_(1 - x)$Al$""_x$ #[#link(<bib:Wang2022>)[94]].

Tb$""_2$In undergoes two magnetic transitions: a
paramagnetic-to-ferromagnetic transition at
$T_(upright(C)) approx 165$ K, followed by a
ferromagnetic-to-antiferromagnetic transition at
$T_(upright(N)) approx 45$ K #[#link(<bib:Zhang2009c>)[72]]. In general, for R$""_2$In
compounds with heavy rare-earth elements, the ferromagnetic transition
temperature ($T_(upright(C))$) decreases from Gd to Tm with increasing
4$f$ electron count, as noted earlier. Both Gd$""_2$In and Tb$""_2$In
exhibit secondary antiferromagnetic transitions at lower temperatures.

In summary, based on the existing literature, described in this section,
it can be concluded that none of the R$""_2$In compounds containing
heavy rare-earth elements exhibit a first-order transition from the
paramagnetic to ferromagnetic state. Instead, their $T_(upright(C))$
decreases monotonically with increasing atomic number, with Gd$""_2$In
exhibiting the highest $T_(upright(C))$ among them. In contrast, several
R$""_2$In compounds with light rare-earth elements undergo a
paramagnetic to ferromagnetic transition, which is first-order in
nature. It is interesting to note that two materials that do not have
first-order transitions do not order ferromagnetically: Sm$""_2$In is
ferrimagnetic and Ce$""_2$In is paramagnetic. For light rare-earth
R$""_2$In compounds adopting a hexagonal crystal structure,
$T_(upright(C))$ increases monotonically with increasing atomic number.
The most remarkable feature of the light rare-earth R$""_2$In compounds,
the emergence of first-order transitions accompanied by negligibly small
thermomagnetic hysteresis, contrasts with the typical behavior expected
for such magnetic transitions.

== Magnetocaloric effect of R$""_2$In
<magnetocaloric-effect-of-r_2in>
While magnetocaloric refrigeration has garnered significant attention
for applications near room temperature, its potential advantages in the
cryogenic temperature range are equally noteworthy. In particular, the
development of energy-efficient methods for liquefying technologically
important gases is of growing interest. Notably, R$""_2$In compounds
show magnetic transitions in the temperature range between 10 and 200~K,
which are associated with pronounced magnetocaloric effect.

Among them, Eu$""_2$In stands out for exhibiting the largest MCE,
primarily not only due to its pronounced first-order magnetic transition
occurring near 55~K, but also due to large moment and collinear
ferromagnetic structure #[#link(<bib:Guillou2018>)[17]]. The peak adiabatic temperature
change ($Delta T_(upright(a d))$) reaches 2.2~K and 5.0~K for magnetic
field changes of 10 and 20~kOe, respectively \[@Fig7\(a)\]#[#link(<bib:Guillou2018>)[17]]. This large $Delta T_(upright(a d))$ is
particularly remarkable given that, in this temperature regime, the
material's lattice entropy increases steeply, which typically acts to
diminish adiabatic temperature change. The emergence of large
$Delta T_(upright(a d))$ places Eu$""_2$In among the leading
low-temperature giant magnetocaloric materials currently known. The
abruptness of the magnetic transition, combined with its high
sensitivity to applied magnetic fields
($partial T_(upright(C))$/$partial B approx$ +3.5~K/T #[#link(<bib:Guillou2018>)[17]]),
ensures that even modest field variations---such as 10~kOe---can convert
a significant portion of the latent heat into a magnetocaloric response.
Calorimetric analysis reveals exceptionally large magnetic field induced
entropy change ($Delta S$) with the values of $- 24.4$ and
$- 28.2$~J$dot.op$kg$""^(- 1) dot.op$K$""^(- 1)$ for the applied
magnetic fields of 10 and 20~kOe, respectively. The negligible
thermomagnetic hysteresis associated with magnetic transition also
renders thermal reversibility of magnetocaloric response, which is
highly desirable for magnetic refrigeration #[#link(<bib:Guillou2018>)[17]]. The MCE
diminishes due to broadening of magnetic transition and reduced
magnetization in pseudobinary Eu$""_(2 - x)$Yb$""_x$In and the
transition temperature also shifts to lower temperature ranges
#[#link(<bib:Guillou2020>)[75]].

Pr$""_2$In also exhibits a pronounced magnetocaloric effect (MCE) in the
same temperature range as Eu$""_2$In, driven by its first-order magnetic
transition near 57~K #[#link(<bib:Biswas2020>)[18], #link(<bib:Biswas2022a>)[62], #link(<bib:Cui2022>)[65], #link(<bib:Liu2024>)[73]]. For a
magnetic field change of 20~kOe, the maximum $Delta S$ reaches
approximately 15~J$dot.op$kg$""^(- 1) dot.op$K$""^(- 1)$ #[#link(<bib:Biswas2020>)[18]].
Liu #emph[et al.] reported a large $Delta T_(upright(a d)) tilde.op 2$~K
in fields of 2~T and $tilde.op 4.3$~K in fields of 5~T #[#link(<bib:Liu2024>)[73]].
Nd$""_2$In demonstrates appreciably large magnetocaloric response near
$tilde.op 110$~K #[#link(<bib:Biswas2022b>)[63], #link(<bib:Liu2021>)[64]]. Based on temperature-dependent
magnetization data under varying magnetic fields, the maximum $Delta S$
is calculated as $- 13$~J$dot.op$kg$""^(- 1) dot.op$K$""^(- 1)$ for
$Delta H = 20$~kOe at $T_(upright(C)) = 110$~K, increasing to
$- 18$~J$dot.op$kg$""^(- 1) dot.op$K$""^(- 1)$ for $Delta H = 50$~kOe
#[#link(<bib:Biswas2022b>)[63]]. Although the maximum entropy changes ($Delta S$) observed
for Pr$""_2$In and Nd$""_2$In are somewhat lower than those reported for
Eu$""_2$In, they remain comparable to---or even exceed---the values of
most known rare-earth based magnetocaloric compounds within the
40--150~K temperature range
#[#link(<bib:Goswami_JPCM_2020>)[95], #link(<bib:Kumar2024>)[31], #link(<bib:Chakraborty2024>)[32], #link(<bib:Kumarprb24>)[23], #link(<bib:Alho2022>)[26], #link(<bib:Chakraborty2024>)[32]],
including other members of the R$""_2$In family (see @Fig7\(d)).
The notably high MCE observed near 110~K in Nd$""_2$In is particularly
significant, given its proximity to the boiling point of natural gas
#[#link(<bib:Biswas2022b>)[63], #link(<bib:Liu2021>)[64]]. Moreover, the first-order magnetic transitions
near $T_(upright(C))$ in these compounds exhibit minimal thermal
hysteresis, indicating low hysteresis losses during the refrigeration
cycle.

Magnetocaloric behavior has also been investigated in the pseudo-binary
series Pr$""_(2 - x)$Nd$""_x$In. Compounds in this series display
first-order magnetic transitions accompanied by substantial MCE, with
$T_(upright(C))$ spanning from 55~K to 110~K depending on the Nd
concentration ($x$) (@Fig7\(c)). This temperature range
conveniently encompasses the boiling points of various
application-relevant gases including nitrogen, oxygen, and natural gas.
The intermediate composition PrNdIn demonstrates a maximum entropy
change of $- 10$~J$dot.op$kg$""^(- 1) dot.op$K$""^(- 1)$ for a magnetic
field change of 20~kOe #[#link(<bib:Biswas2023>)[76]]. The first-order nature of the
magnetic transition in Eu$""_2$In, Pr$""_2$In, and Nd$""_2$In is further
evidenced by the magnetic field dependence of $Delta S$. The local
exponent $n \( H \, T \) = frac(d ln \| Delta S \|, d ln H)$ exhibits a
peak exceeding 2 near $T_(upright(C))$ in all three compounds---a
characteristic feature of first-order transitions
#[#link(<bib:Biswas2022a>)[62], #link(<bib:Biswas2022b>)[63], #link(<bib:Liu2021>)[64], #link(<bib:Guillou2020>)[75]].

#figure(image("source/Fig8.png", width: 100%), scope: "parent",
  caption: [
    Crystallography and electronic structure of Eu$""_2$In. (a)
    Orthorhombic unit cell with two inequivalent Eu sublattices (Eu (a),
    Eu (b)) and In framework. (b) Sublattice- and orbital-resolved
    density of states (DOS) in the paramagnetic (PM) state showing
    symmetric spin character and localized Eu 4$f$ peaks near
    $E_(upright(F))$. (c) DOS in the ferromagnetic (FM) state with
    $m = 0.5 thin mu_(upright(F))$, where exchange splitting
    redistributes spectral weight and induces spin polarization via
    Eu--In hybridization. (d--g) Bloch spectral functions at
    $E_(upright(F))$ for majority-spin electrons, illustrating the
    transition from incoherent PM spectra to sharp FM bands with
    reconstructed Fermi surfaces. Figure is reproduced from Ref.
    #[#link(<bib:MendiveTapia2020>)[49]] under Creative Commons Attribution 4.0
    International license.
  ]
)
<Fig8>

A moderate magnetocaloric effect (MCE) is observed in Gd$""_2$In near
its ferromagnetic transition temperature around 190~K
#[#link(<bib:Bhattacharyya2012>)[51]]. Additionally, an inverse MCE appears around 100~K
under low magnetic fields, associated with the transition from the
ferromagnetic to the antiferromagnetic state. At higher magnetic fields,
the entropy change at low temperature becomes negative, consistent with
conventional MCE behavior #[#link(<bib:Bhattacharyya2012>)[51]]. Other R$""_2$In compounds
containing heavy rare-earth elements also exhibit magnetic transitions
accompanied by modest MCE values---comparable to those of Gd$""_2$In but
lower than the MCE observed in light rare-earth analogs that undergo
first-order magnetic transitions (see @Fig7\(d))
#[#link(<bib:Bhattacharyya2009>)[43], #link(<bib:Zhang2009>)[44], #link(<bib:Zhang2011>)[46], #link(<bib:Bhattacharyya2009b>)[58], #link(<bib:Zhang2009b>)[59], #link(<bib:Zhang2009c>)[72]].

A few studies have explored the substitution of other p-block elements
at the In site in R$""_2$In compounds. Tencé #emph[et al.] investigated
the magnetocaloric effect (MCE) in Gd$""_2$In$""_0.8$X$""_0.2$ (X = Pb,
Al) #[#link(<bib:Tence2016>)[52]]. Compared to Gd$""_2$In, the Pb-doped sample exhibited a
reduced magnetic entropy change, despite an increase in the Curie
temperature. In contrast, Al doping had a negligible effect on both MCE
and $T_(upright(C))$ #[#link(<bib:Tence2016>)[52]]. Additionally, a combined magnetocaloric
and magnetostriction study was conducted on
Dy$""_2$In$""_(1 - x)$Al$""_x$ ($x = 0 \, 0.2 \, 0.3 \, 0.4$) alloys,
with Dy$""_2$In$""_0.7$Al$""_0.3$ showing the highest MCE and
magnetostriction #[#link(<bib:Fornasini1990>)[79]].

To summarize, from a magnetocaloric perspective, light rare-earth-based
R$""_2$In compounds exhibit a more pronounced MCE due to their
first-order magnetic transitions, in contrast to the heavy rare-earth
variants. This is unusual because typically MCE of heavy rare-earth
compounds is expected to be higher due to their large magnetic moments.
However, it appears that even modest magnetic field is sufficient to
convert a substantial portion of the latent heat associated with the
first-order transition into a magnetocaloric response in case of light
rare-earth based R$""_2$In #[#link(<bib:Guillou2018>)[17]]. Notably, the magnetic
transitions in R$""_2$In compounds---regardless of being first- or
second-order---are typically associated with negligible thermal
hysteresis, a highly desirable characteristic for potential magnetic
refrigerant materials.

== Theoretical studies
<theoretical-studies>
DFT and related modeling approaches have been widely employed to uncover
how $f$-electron valence fluctuations, exchange interactions, and
magnetoelastic coupling govern phase stability and magnetic transitions
in R$""_2$In compounds. These theoretical efforts highlight that subtle
electronic and structural factors can produce unusual transition
characteristics, such as sharp but reversible first-order behavior.
Eu$""_2$In stands out as the prototypical example where these mechanisms
manifest most clearly, displaying a non-hysteretic first-order magnetic
transition with large latent heat and a giant magnetocaloric effect
#[#link(<bib:Guillou2018>)[17]].

DFT calculations were employed to understand the electronic structure of
Eu$""_2$In #[#link(<bib:Guillou2018>)[17], #link(<bib:MendiveTapia2020>)[49]]. Guillou #emph[et al.] in their
work point out that the Eu 6$s$, 6$p$, and 5$d$ states are strongly
hybridized with the more populated In 5$p$ states, such that the Eu $s$,
$p$, $d$ states lie entirely within the envelope of the In-$p$ states
#[#link(<bib:Guillou2018>)[17]]. Owing to this strong hybridization, the Eu-5$d$ states in
Eu$""_2$In are partially occupied ($tilde.op 0.8$ eV per Eu) rather than
empty, as would be expected for Eu$""^(2 +)$ in the $4 f^7 5 d^0$
configuration. The Eu-4$f$ states are centered just below $- 2$ eV and
also hybridize with the In $p$ states and, consequently, with the Eu
$s$, $p$, $d$ states. These Eu-4$f$ states lie deeper in energy than in
most Eu--TM--X ternaries (where TM is a transition metal and X is a
$p$-block element), consistent with the absence of mixed valence or
valence transitions in Eu$""_2$In #[#link(<bib:Guillou2018>)[17]]. In the FM state, the
Fermi level ($E_(upright(F))$) lies at the edge of a pseudo-gap in the
majority channel, while in the minority channel it corresponds to high
Eu-5$d$ and In-5$p$ density of states (DOS). In the approximated PM
state, $E_(upright(F))$ falls inside a shallow valley flanked by high
Eu-5$d$ and In-5$p$ DOS. High DOS near $E_(upright(F))$ is often
associated with electronic and magnetic instabilities triggered by
external parameters such as temperature, magnetic field, or pressure.
The electronic structures capable of large DOS changes at or near
$E_(upright(F))$ in Eu$""_2$In are attributed to the magnetoelastic
first-order magnetic transitions in this compound #[#link(<bib:Guillou2018>)[17]].

In a subsequent DFT study, Mendive-Tapia #emph[et al.] demonstrated that
Eu$""_2$In exhibits a unique positive feedback between the magnetism of
itinerant valence electrons and the ferromagnetic ordering of localized
$f$-moments, manifested as a topological change in the Fermi surface
that drives its first-order transition #[#link(<bib:MendiveTapia2020>)[49]]. As mentioned
above, Eu$""_2$In crystallizes in an orthorhombic structure
\[@tab:structure, @Fig8\(a)\] with two inequivalent Eu
sublattices, Eu(a) and Eu(b), embedded within an In framework. This
structural inequivalence enables sublattice-dependent magnetic behavior
that becomes crucial in the transition from the paramagnetic (PM) to the
ferromagnetic (FM) state \[@Fig8\(b,c)\]. In the PM phase,
described by the disordered local moment (DLM) model, the density of
states (DOS) shows strong localized Eu 4$f$ features near the Fermi
level, while In contributes weakly through its $s$--$p$ orbitals. The
spin-symmetric DOS reflects statistical averaging of disordered spins,
with hybridization evident between Eu $d \/ f$ and In $s \/ p$ states
#[#link(<bib:MendiveTapia2020>)[49]].

Upon entering the FM state, exchange splitting separates the Eu
sublattices into majority and minority spin channels, redistributing
spectral weight near the Fermi level and inducing spin asymmetry through
Eu--In hybridization. Bloch spectral functions \[@Fig8\(d--g)\]
capture this evolution, revealing a transformation from a broad,
incoherent PM spectrum to a sharp, spin-polarized metallic state
characterized by band sharpening, symmetry breaking, and Fermi surface
reconstruction. Mendive-Tapia #emph[et al.] attributed this behavior to
a feedback loop between itinerant carriers and localized Eu
$f$-moments---enabled by Eu's divalency and crystallographic
inequivalence---that stabilizes ferromagnetism and drives the
first-order transition, a mechanism absent in trivalent Gd$""_2$In
#[#link(<bib:MendiveTapia2020>)[49]].

#figure(image("source/Fig9.JPG", width: 100%), scope: "parent",
  caption: [
    \(a) Charge-induced strain as a descriptor for phase prediction,
    identifying stability zones for hexagonal, transitional
    (hex$arrow.r$ortho), and orthorhombic phases. (b, c) Experimental
    validation by temperature-dependent X-ray diffraction (XRD) showing
    stable hexagonal Nd$""_2$In at low strain, while orthorhombic
    Eu$""_2$In at high strain. Figure is reprinted with permission from
    #[#link(<bib:Singh2025>)[84]], Copyright (2025) by the American Physical Society.
  ]
)
<Fig9>

Alho #emph[et al.] developed a theoretical model to describe the
magnetic and magnetocaloric properties of Eu$""_2$In #[#link(<bib:Alho2020>)[47]]. Their
model incorporates both exchange and magnetoelastic interactions within
the mean-field approximation, while the coupling between magnetic and
lattice entropies is treated using the Grüneisen approach, which relates
the Debye temperature to lattice deformation. The study revealed the
existence of a critical magnetic field above which the compound's
first-order transition becomes second order. By examining the variation
of magnetic free energy with magnetization and temperature, the authors
explained the nonhysteretic first-order transition observed in
Eu$""_2$In. The model not only reproduces the experimentally observed
GMCE in this R$""_2$In compound but also provides a key insight: despite
the relatively small phase volume change, lattice distortion accounts
for nearly one-third of the total magnetic-field-induced entropy change
($Delta S$) in Eu$""_2$In. In contrast, the maximum adiabatic
temperature change ($Delta T_(upright(a d))$) remains unaffected by the
associated phase volume change #[#link(<bib:Alho2020>)[47]].

After the discovery of a first-order transition in Eu$""_2$In, where Eu
is divalent, similar first-order transitions were later observed in
Pr$""_2$In and Nd$""_2$In---two R$""_2$In-type compounds in which the
rare-earth elements are trivalent #[#link(<bib:Biswas2020>)[18], #link(<bib:Biswas2022b>)[63]]. Unlike
Eu$""_2$In, however, these compounds crystallize in a hexagonal
structure. To gain insight into their behavior, DFT-based electronic
structure calculations were carried out
#[#link(<bib:Biswas2020>)[18], #link(<bib:Biswas2022a>)[62], #link(<bib:Biswas2022b>)[63]]. The results indicate that, in the
majority DOS of Pr$""_2$In, the Pr 4$f$ states strongly hybridize with
Pr 5$d$ and In 5$p$ states near $E_(upright(F))$, with a pronounced
$d$-character #[#link(<bib:Biswas2022b>)[63]]. This suggests that the 5$d$ electrons play a
significant role in mediating magnetic interactions between local 4$f$
moments. In contrast, for Nd$""_2$In, the hybridization between Nd 4$f$,
Nd 5$d$, and In 5$p$ states occurs slightly above $E_(upright(F))$,
signaling a weakening of the 5$d$ and 5$d$--5$p$ contributions near
$E_(upright(F))$. The strong lanthanide 5$d$--indium 5$p$ hybridization
with predominantly $d$-character near $E_(upright(F))$ for Pr$""_2$In is
assumed to drive the first-order transition in the compound in analogy
to Eu$""_2$In, where linkage of similar electronic feature with
first-order transition was established by Mendive-Tapia #emph[et al.]
#[#link(<bib:MendiveTapia2020>)[49]]. It was also hypothesized that the lack of $d$
contribution near $E_(upright(F))$ due to the occurrence of hybridized
states slightly above $E_(upright(F))$ for Nd$""_2$In makes the compound
exhibit a weaker first-order character of magnetic transition, making it
borderline between first-order and second-order. The lack of hybridized
states of $d$-character in Nd$""_2$In was also reflected via different
Fermi surface topology of the compound compared to Pr$""_2$In
(@Fig8) #[#link(<bib:Biswas2022b>)[63]].

First-principles electronic structure studies of R$""_2$In compounds
consistently point to the crucial role of orbital hybridization in
shaping their magnetic behavior. In particular, the interaction between
localized 4$f$ states of the rare-earth elements and the more
delocalized 5$d$ states, together with the In 5$p$ conduction states,
produces a pronounced $d$-character near the Fermi level. This
hybridization not only mediates the exchange interactions responsible
for long-range magnetic ordering but also tunes the balance between
first-order and second-order magnetic transitions across the series. In
compounds such as Eu$""_2$In, where $f$--$d$--$p$ hybridization is
particularly strong and sensitive to subtle changes in electronic
occupancy and lattice volume, the result is a sharp yet reversible
first-order transition that gives rise to a giant magnetocaloric effect.
By contrast, in heavier lanthanide members, weaker or less favorable
hybridization channels shift the balance toward conventional
second-order transitions with more moderate caloric responses. Thus, the
degree and nature of $f$--$d$--$p$ hybridization at the Fermi level
provide a unifying framework for understanding the diversity of magnetic
ground states and transition characteristics observed across the
R$""_2$In family.

Among promising systems, R$""_2$In offer a compelling platform as their
complex crystallographic tendencies, strong electronic correlations, and
sensitivity to external stimuli make them rich hosts of structural and
magnetic phase transitions. Recently, Singh #emph[et al.] #[#link(<bib:Singh2025>)[84]]
built a physics-informed approach that links charge-induced atomic
strain with the stability of R$""_2$In phases, which provides a path
toward uncovering predictive descriptors for phase transitions and
guiding the discovery of next-generation functional materials.

@Fig9\(a) shows charge-induced strain plotted against the
phase-transition zone, revealing three distinct regions. Low strain
values ($< 0.15$) correspond to stable hexagonal phases, such as
Nd$""_2$In. Intermediate strain values (0.15--1.0) indicate systems
prone to hexagonal-to-orthorhombic transitions, exemplified by
(Mn$""_0.5$Fe$""_0.5$)Ni(Si$""_(1 - x)$Al$""_x$) #[#link(<bib:Biswas2019a>)[90]]. High
strain values ($> 1.0$) correspond to stable orthorhombic phases,
including Eu$""_2$In, Yb$""_2$In, and Y$""_2$In. A dashed guideline
highlights the progression from hexagonal to orthorhombic stabilization
as strain increases, emphasizing its role as a predictive descriptor of
structural phase transitions in R$""_2$In and other magnetic compounds.
@Fig9\(b,c) provide experimental validation through
temperature-dependent XRD intensity maps. Notably, Nd$""_2$In retains
hexagonal reflections across temperature, consistent with its low strain
and hexagonal stability, while Eu$""_2$In exhibits orthorhombic
reflections, confirming the prediction of a large strain and an
orthorhombic ground state #[#link(<bib:Singh2025>)[84]].

Although these strain-based descriptors apply primarily to charge-driven
displacive transformations in rare-earth intermetallics (such as
R$""_2$In compounds), they do not necessarily extend to purely
reconstructive transitions or entropy-driven, order--disorder changes.
In systems lacking appreciable charge-induced distortion, phase behavior
must instead be rationalized through alternative mechanisms --- such as
configurational entropy effects or bond-rearrangement pathways. However,
this recent study #[#link(<bib:Singh2025>)[84]] opens up a promising area for future
studies of complex phase transitions in intermetallic solids.

= Summary, Outlook, and Future directions
<summary-outlook-and-future-directions>
In this review, we summarize recent experimental and theoretical
advances in the study of binary rare-earth R$""_2$In intermetallics.
These compounds display unusual magnetic behaviors and phase transitions
that are highly sensitive to external stimuli, making them both
fundamentally intriguing and promising for technological applications.
While first-order magnetic transitions are generally accompanied by
significant thermomagnetic hysteresis, several R$""_2$In compounds,
including Eu$""_2$In, Pr$""_2$In, and Nd$""_2$In, exhibit first-order
transitions with negligible hysteresis, an uncommon and striking
phenomenon that challenges conventional understanding of
magneto-structural coupling. Structurally, most R$""_2$In compounds
stabilize in the hexagonal Ni$""_2$In-type lattice, including the
non-lanthanide Y$""_2$In. Exceptions are Eu$""_2$In and Yb$""_2$In,
which adopt the orthorhombic Co$""_2$Si-type structure. Notably, no
R$""_2$In compound has been observed to undergo a symmetry-changing
structural transition, except Y$""_2$In, which transforms from hexagonal
to orthorhombic near 250~K. From a theoretical perspective,
charge-induced lattice distortions and electronic structure
considerations, such as Fermi-surface nesting and sublattice-specific
hybridization, provide predictive descriptors for these structural
tendencies. In particular, strain-based metrics derived from DFT
calculations have successfully rationalized hexagonal-to-orthorhombic
stability trends, offering a quantitative framework for predicting phase
transitions in this family.

Magnetically, Gd$""_2$In exhibits the highest $T_(upright(C))$ across
the series. Among hexagonal compounds, $T_(upright(C))$ decreases with
increasing atomic number for heavy rare-earth elements, while the
opposite trend occurs for lighter members. The choice of rare-earth
element R strongly determines the magnetic ground state, but In also
mediates inter-sublattice interactions in some compounds. Crystal-field
effects, coupled with electronic correlations, further shape the overall
magnetic behavior. Many R$""_2$In compounds display pronounced MCE in
the cryogenic range, encompassing the boiling points of several
technologically relevant gases. Eu$""_2$In stands out for its
exceptionally large MCE, placing it among giant cryogenic magnetocaloric
materials. Significant magnetic entropy changes are also reported in
Pr$""_2$In and Nd$""_2$In, while heavy lanthanide-based members
(Er$""_2$In, Ho$""_2$In, Tb$""_2$In, Dy$""_2$In, and Gd$""_2$In) exhibit
moderate MCE. Despite extensive research, several critical questions
remain. Most notable among them is the mechanism underlying
non-hysteretic first-order transitions in light rare-earth compounds,
particularly the origin of the large latent heat in Eu$""_2$In despite a
minimal lattice volume change (0.1%). Advanced theoretical tools,
including combined DFT and statistical modeling, suggest that subtle
charge redistribution, local lattice distortions, and spin-lattice
coupling may collectively stabilize these transitions without
significant hysteresis. Understanding these mechanisms could establish
design principles to minimize thermomagnetic hysteresis, a key
limitation in practical giant magnetocaloric materials such as
Gd$""_5$Si$""_2$Ge$""_2$, Mn$""_0.5$Fe$""_0.5$NiSi$""_(1 - x)$Al$""_x$,
FeRh, and Ni$""_(50 - x)$Co$""_x$Mn$""_35$Ti$""_15$
#[#link(<bib:Pecharsky1997>)[10], #link(<bib:Biswas2019a>)[90], #link(<bib:Bez2019>)[91], #link(<bib:Biswas_Jalcom_22>)[96]].

Future directions include exploration of pseudobinary systems
R$""_(2 - x)$R$'_x$In, which remain largely understudied. These
materials offer a unique platform to investigate the interplay between
composition, electronic structure, lattice stability, and magnetism, as
well as the effects of multiple rare-earth ions on spin interactions.
Mixing 4$f$ elements expands the chemical and magnetic design space,
potentially enabling emergent behaviors and novel phase transitions that
are highly sensitive to external stimuli. Additionally, integrating
theoretical descriptors such as strain, charge redistribution, and
electronic structure into predictive frameworks could accelerate
discovery of R$""_2$In-based materials with tunable phase behavior and
optimized magnetocaloric performance. Finally, while R$""_2$In compounds
show significant potential for cryogenic MCE, chemical instability under
ambient conditions---particularly in light rare-earth members---remains
a major barrier to practical applications. Future research must focus on
enhancing material stability, leveraging both theoretical guidance and
experimental synthesis strategies, to enable breakthroughs in efficient,
high-performance cryogenic magnetocaloric materials.

= Data availability statement
<data-availability-statement>
Data availability statement All data that support the findings of this
study are included within the article (and any supplementary files).

= Acknowledgments
<acknowledgments>
The work at Ames National Laboratory was supported by the U.S.
Department of Energy, Office of Science, Basic Energy Sciences,
Materials Science and Engineering Division. The research is performed at
the Ames National Laboratory, which is operated for the U.S. DOE by Iowa
State University under contract No. DE-AC02-07CH11358.

#block[
99

A. Szytuła, "Magnetism of rare earth intermetallics," 1993, #emph[Phys.
Scr.] #strong[1993], 284.

H. Ghazanfar, H. Kim, M. Rabeel, M. Ahmed, S. Nisar, M. Zulfiqar, A.
Rehman, G. Dastgeer, D. Kim, "A review of rare earth materials for
emerging memory devices for neuromorphic computing," 2025, #emph[Mater.
Today Phys.] #strong[55], 101763.

J. Custers, P. Gegenwart, H. Wilhelm, K. Neumaier, Y. Tokiwa, O.
Trovarelli, C. Geibel, F. Steglich, C. Pépin, and P. Coleman, "The
break-up of heavy electrons at a quantum critical point," 2003,
#emph[Nature] #strong[424], 524--527.

S. Paschen, T. Lühmann, S. Wirth, P. Gegenwart, O. Trovarelli, C.
Geibel, F. Steglich, P. Coleman, and Q. Si, "Hall-effect evolution
across a heavy-fermion quantum critical point," 2004, #emph[Nature]
#strong[432], 881--885.

J. Custers, K.-A. Lorenzer, M. Müller, A. Prokofiev, A. Sidorenko, H.
Winkler, A. M. Strydom, Y. Shimura, T. Sakakibara, R. Yu, Q. Si, and S.
Paschen, "Destruction of the Kondo effect in the cubic heavy-fermion
compound Ce$""_3$Pd$""_20$Si$""_6$," 2012, #emph[Nat. Mater.]
#strong[11], 189--194.

L. Petit, Z. Szotek, D. Paudyal, A. Biswas, Y. Mudryk, V. K. Pecharsky,
J. B. Staunton, "Magnetic structure of selected Gd intermetallic alloys
from first principles," 2020, #emph[Phys. Rev. B] #strong[101], 014409.

T. Kurumaji, T. Nakajima, M. Hirschberger, A. Kikkawa, Y. Yamasaki, H.
Sagayama, H. Nakao, Y. Taguchi, T. Arima, Y. Tokura, "Skyrmion lattice
with a giant topological Hall effect in a frustrated triangular-lattice
magnet," 2019, #emph[Science] #strong[365], 914.

A. Kuroda, H. Hirose, Q. Xu, #emph[et al.], "Square and rhombic lattices
of magnetic skyrmions in a centrosymmetric binary compound
(EuAl$""_4$)," 2022, #emph[Nat. Commun.] #strong[13], 1201.

L. Caretta, E. Rosenberg, F. Büttner, T. Fakhrul, P. Gargiani, M.
Valvidares, Z. Chen, P. Reddy, D. A. Muller, C. A. Ross, and G. S. D.
Beach, "Interfacial Dzyaloshinskii--Moriya interaction arising from
rare-earth orbital magnetism in insulating magnetic oxides," 2020,
#emph[Nat. Commun.] #strong[11], 1090.

V.K. Pecharsky, K.A. Gschneidner, Jr., "Giant magnetocaloric effect in
Gd$""_5$Si$""_2$Ge$""_2$," 1997, #emph[Phys. Rev. Lett.] #strong[78],
\4494.

A. D. Chinchure, E.M. Sandoval, J. A. Mydosh, "Metamagnetism and giant
magnetoresistance of the rare-earth intermetallic compounds
R$""_2$Ni$""_2$Pb (R=Er, Ho, Dy)," 2002, #emph[Phys. Rev. B]
#strong[66], R020409.

G. Asti, M. Solzi, "Permanent Magnets," in R. Gerber, C.D. Wright, G.
Asti (eds), #emph[Applied Magnetism], NATO ASI Series, vol. 253,
Springer, Dordrecht (1994).

T. Del Rose, A. K. Pathak, Y. Mudryk, V. K. Pecharsky, "Distinctive
exchange bias and unusual memory effects in magnetically compensated
Pr$""_0.75$Gd$""_0.25$ScGe," 2021, #emph[J. Mater. Chem. C] #strong[9],
\181.

P. O. Ribeiro, B. P. Alho, T. S. T. Alvarenga, E. P. Nóbrega, A. Magnus
G. Carvalho, V. S. R. de Sousa, A. Caldas, N. A. de Oliveira, P. J. von
Ranke, "Theoretical investigations on the magnetocaloric and barocaloric
effects in Tb$""_y$Gd$""_(1 - y)$Al$""_2$ series," 2013, #emph[J. Alloys
Compd.] #strong[563], 242.

S. Zhang, S. E. Saji, Z. Yin, H. Zhang, Y. Du, and C.-H. Yan,
"Rare-Earth Incorporated Alloy Catalysts: Synthesis, Properties, and
Applications," 2021, #emph[Adv. Mater.] #strong[33]\(16), e2005988.

S. Kumar, R. Muhammad, S. Kim, J. Yi, K. Son, and H. Oh, "Exploring
Magnetocaloric Materials for Sustainable Refrigeration near Hydrogen Gas
Liquefaction Temperature," 2024, #emph[Adv. Funct. Mater.]
#strong[34]\(39), 2402513.

F. Guillou, A. K. Pathak, D. Paudyal, Y. Mudryk, F. Wilhelm, A. Rogalev,
V. K. Pecharsky, "Non-hysteretic first-order phase transition with large
latent heat and giant low-field magnetocaloric effect," 2018, #emph[Nat.
Commun.] #strong[9], 2925.

A. Biswas, N. A. Zarkevich, A. K. Pathak, O. Dolotko, I. Z. Hlova, A. V.
Smirnov, Y. Mudryk, D. D. Johnson, V. K. Pecharsky, "First-order
magnetic phase transition in Pr$""_2$In with negligible thermomagnetic
hysteresis," 2020, #emph[Phys. Rev. B] #strong[101], 224402.

E. Schuberth, M. Tippmann, L. Steinke, S. Lausberg, A. Steppke, M.
Brando, C. Krellner, C. Geibel, R. Yu, Q. Si, and F. Steglich,
"Emergence of superconductivity in the canonical heavy-electron metal
YbRh$""_2$Si$""_2$," 2016, #emph[Science] #strong[351]\(6272), 485--488.

A. Ahmed, J. Sharma, A. Bhattacharya, A. Biswas, T. Singha, Y. Mudryk,
A. Alam, I. Das, "Unconventional anomalous Hall effect in hexagonal
polar magnet Y$""_3$Co$""_8$Sn$""_4$," 2025, #emph[Adv. Funct. Mater.]
#strong[2025], 2502940.

A. Bhattacharya, A. Ahmed, A. Dutta, A. Kumar, P. Singh, A. Biswas, Y.
Mudryk, I. Das, "Anomalous Hall effect in the polar magnet
Gd$""_3$Ni$""_8$Sn$""_4$: a candidate for hosting skyrmions," 2025,
#emph[Phys. Rev. B] #strong[111], 104410.

M. Kenzelmann, T. Strässle, C. Niedermayer, M. Sigrist, A. D. Bianchi,
R. Movshovich, E. D. Bauer, J. L. Sarrao, and J. D. Thompson, "Coupled
Superconducting and Magnetic Order in CeCoIn$""_5$," 2008,
#emph[Science] #strong[321]\(5896), 1652--1654.

A. Kumar, P. Singh, A. Doyle, D. L. Schlagel, and Y. Mudryk, Multiple
magnetic interactions and large inverse magnetocaloric effect in TbSi
and TbSi$""_0.6$Ge$""_0.4$, Phys. Rev. B#strong[109], 214410 (2024).

A. Biswas, R. K. Chouhan, O. Dolotko, P. Manfrinetti, S. Lapidus, D. L.
Schlagel, Y. Mudryk, "Exceptional magnetic and magnetoelastic behavior
of rare-earth non-centrosymmetric Sm$""_7$Pd$""_3$," 2024, #emph[Acta
Mater.] #strong[265], 119630.

Y. Dong, Y. Kinoshita, M. Ochi, R. Nakachi, R. Higashinaka, S. Hayami,
Y. Wan, Y. Arai, S. Huh, M. Hashimoto, D. Lu, M. Tokunaga, Y. Aoki, T.
D. Matsuda, and T. Kondo, "Pseudogap and Fermi arc induced by Fermi
surface nesting in a centrosymmetric skyrmion magnet," 2025,
#emph[Science] #strong[388]\(6747), 624--630.

B. P. Alho, P. O. Ribeiro, V. S. R. de Sousa, B. C. Margato, A. Biswas,
T. Del Rose, R. S. de Oliveira, E. P. Nóbrega, P. J. von Ranke, Y.
Mudryk, V. K. Pecharsky, "Fathoming the anisotropic magnetoelasticity
and magnetocaloric effect in GdNi," 2022, #emph[Phys. Rev. B]
#strong[106], 184403.

K. Izawa, K. Behnia, Y. Matsuda, H. Shishido, R. Settai, Y. Onuki, and
J. Flouquet, "Thermoelectric Response Near a Quantum Critical Point: The
Case of CeCoIn$""_5$," 2007, #emph[Phys. Rev. Lett.] #strong[99],
\147005.

S. Chakraborty, S. Gupta, S. Pakhira, R. Choudhary, A. Biswas, Y.
Mudryk, V. K. Pecharsky, D. D. Johnson, C. Mazumdar, "Ground-state
degeneracy and complex magnetism of geometrically frustrated
Gd$""_2$Ir$""_0.97$Si$""_2.97$," 2022, #emph[Phys. Rev. B] #strong[106],
\224427.

A. Biswas, A. Kumar, P. Singh, T. Del Rose, R. K. Chouhan, B. C.
Margato, B. P. Alho, E. P. Nóbrega, P. J. von Ranke, P. O. Ribeiro, V.
S. R. de Sousa, Y. Mudryk, "Influence of Ga doping on magnetic
properties, magnetocaloric effect, and electronic structure of
pseudobinary GdZn$""_(1 - x)$Ga$""_x$ (x = 0--0.1)," 2024, #emph[Phys.
Rev. Mater.] #strong[8], 114418.

J. Bouaziz, E. Mendive-Tapia, S. Blügel, and J. B. Staunton,
"Fermi-Surface Origin of Skyrmion Lattices in Centrosymmetric Rare-Earth
Intermetallics," 2022, #emph[Phys. Rev. Lett.] #strong[128], 157206.

A. Kumar, A. Biswas, Y. Mudryk, "Stability of the first-order character
of phase transition in HoCo$""_2$," 2024, #emph[J. Appl. Phys.]
#strong[136], 203902.

S. Chakraborty, S. Gupta, S. Pakhira, S. Dan, A. Biswas, Y. Mudryk, C.
Mazumdar, "Large adiabatic temperature change and magnetic frustration
in triangular lattice antiferromagnet Dy$""_2$IrSi$""_3$," 2024,
#emph[J. Alloys Compd.] #strong[981], 173652.

P. O. Ribeiro, B. P. Alho, R. S. de Oliveira, E. P. Nóbrega, V. S. R. de
Sousa, P. J. von Ranke, D. L. Schlagel, A. Biswas, Y. Mudryk, V. K.
Pecharsky, "Anisotropic magneto-resistivity and magnetocaloric effect in
DyAl$""_2$," 2024, #emph[J. Alloys Compd.] #strong[976], 173149.

M. Gomilšek, T. J. Hicken, M. N. Wilson, K. J. A. Franke, B. M. Huddart,
A. Štefančič, S. J. R. Holt, G. Balakrishnan, D. A. Mayoh, M. T. Birch,
S. H. Moody, H. Luetkens, Z. Guguchia, M. T. F. Telling, P. J. Baker, S.
J. Clark, and T. Lancaster, "Anisotropic skyrmion and multi-$q$ spin
dynamics in centrosymmetric Gd$""_2$PdSi$""_3$," 2025, #emph[Phys. Rev.
Lett.] #strong[134], 046702.

A. Kumar, A. Biswas, Y. Mudryk, "Magnetic glassiness in
noncentrosymmetric Sm$""_7$Pd$""_3$: interplay of magnetic frustration,
long-range order, and frozen domains," 2025, #emph[Phys. Rev. B]
#strong[111], 174448.

Y. Mudryk, V. K. Pecharsky, K. A. Gschneidner Jr., "Extraordinary
responsive intermetallic compounds: the R$""_5$T$""_4$ family (R = rare
earth, T = group 13--15 element)," 2011, #emph[Z. Anorg. Allg. Chem.]
#strong[637], 1948.

H. Nakamura, "The current and future status of rare earth permanent
magnets," 2018, #emph[Scripta Materialia] #strong[154], 273.

J. Jensen, A. R. Mackintosh, #emph[Rare Earth Magnetism], The
International Series of Monographs on Physics, Clarendon Press, Oxford,
\1991.

T. Kasuya, "A theory of metallic ferro- and antiferromagnetism on
Zener's model," 1956, #emph[Prog. Theor. Phys.] #strong[16], 45.

I. A. Campbell, "Indirect exchange for rare earths in metals," 1972,
#emph[J. Phys. F: Metal Phys.] #strong[2], L47.

A. Kumar, A. Biswas, and Y. Mudryk, “Nontrivial critical behavior at
magnetic transitions: A case study of Sm$""_7$Pd$""_3$\", 2025,
#emph[Phys. Rev. B] #strong[112], 224416.

M. Forker, R. Mubeler, S. C. Bedi, M. Olzon-Dionysio, S. Dionysio de
Souza, "Magnetic and electric hyperfine interactions in the rare-earth
indium compounds R$""_2$In studied by $""^111$Cd perturbed angular
correlations," 2005, #emph[Phys. Rev. B] #strong[71], 094404.

A. Bhattacharyya, S. Chatterjee, S. Giri, S. Majumdar, "Magnetic anomaly
and magnetocaloric effect in Dy$""_2$In," 2009, #emph[J. Magn. Magn.
Mater.] #strong[321], 1828.

Q. Zhang, X. G. Liu, F. Yang, W. J. Feng, X. G. Zhao, D. J. Kang, Z. D.
Zhang, "Large reversible magnetocaloric effect in Dy$""_2$In," 2009,
#emph[J. Phys. D: Appl. Phys.] #strong[42], 055011.

D. Ravot, O. Gorochov, T. Roisnel, G. André, F. Bour, J. A. Hodges,
"Magnetic properties of Er$""_2$In," 1993, #emph[J. Magn. Magn. Mater.]
#strong[128], 267.

H. Zhang, B. G. Shen, Z. Y. Xu, J. Chen, J. Shen, F. X. Hu, J. R. Sun,
"Large reversible magnetocaloric effect in Er$""_2$In compound," 2011,
#emph[J. Alloys Compd.] #strong[509], 2602.

B. P. Alho, P. O. Ribeiro, P. J. von Ranke, F. Guillou, Y. Mudryk, V. K.
Pecharsky, "Free-energy analysis of the nonhysteretic first-order phase
transition of Eu$""_2$In," 2020, #emph[Phys. Rev. B] #strong[102],
\134425.

D. H. Ryan, D. Paudyal, F. Guillou, Y. Mudryk, A. K. Pathak, V. K.
Pecharsky, "The first-order magnetoelastic transition in Eu$""_2$In: a
$""^151$Eu Mössbauer study," 2019, #emph[AIP Adv.] #strong[9], 125137.

E. Mendive-Tapia, D. Paudyal, L. Petit, J. B. Staunton, "First-order
ferromagnetic transitions of lanthanide local moments in divalent
compounds: an itinerant electron positive feedback mechanism and Fermi
surface topological change," 2020, #emph[Phys. Rev. B] #strong[101],
\174437.

V. Singh, A. Bhattacharyya, S. Majumdar, I. Dasgupta, "A theoretical and
experimental study of magnetism in Gd$""_2$In," 2012, #emph[J. Appl.
Phys.] #strong[111], 053709.

A. Bhattacharyya, S. Giri, S. Majumdar, "Field induced sign reversal of
magnetocaloric effect in Gd$""_2$In," 2012, #emph[J. Magn. Magn. Mater.]
#strong[324], 1239.

S. Tencé, B. Chevalier, "Magnetic and magnetocaloric properties of
Gd$""_2$In$""_0.8$X$""_0.2$ compounds (X = Al, Ga, Sn, Pb)," 2016,
#emph[J. Magn. Magn. Mater.] #strong[399], 46.

S. P. McAlister, "Magnetic and electrical properties of Gd$""_2$In,"
1984, #emph[J. Phys. F: Met. Phys.] #strong[14], 2167.

N. Kamali Sarvestani, S. Ahmad Ketabi, A. Yazdani, "Electro-mechanical
character of Gd and Gd$""_2$In and possibility of a Kondo-like behavior
in Gd$""_2$In," 2014, #emph[J. Alloys Compd.] #strong[613], 62.

S. V. Taskaev, V. V. Khovaylo, M. N. Ulyanov, D. S. Bataev, A. A.
Basharova, M. V. Kononova, D. V. Plakhotskiy, M. Yu. Bogush, D. A.
Zherebtsov, "Magnetic and magnetocaloric properties of as-cast
Gd$""_2$In," 2021, #emph[Lett. Mater.] #strong[11], 104.

W. Liu, M. Yamashita, M. Kurisu, H. Kadomatsu, H. Fujiwara, "Magnetic
transitions of Gd$""_2$In under pressure," 1987, #emph[J. Phys. Soc.
Jpn.] #strong[56], 421.

C. Jee, C. L. Lin, T. Mihalisin, X. Wang, "Magnetization and specific
heat studies of Gd$""_2$In," 1996, #emph[J. Appl. Phys.] #strong[79],
\5403.

A. Bhattacharyya, S. Chatterjee, S. Giri, S. Majumdar, "Magnetotransport
and magnetocaloric effect in Ho$""_2$In," 2009, #emph[Eur. Phys. J. B]
#strong[70], 347.

Q. Zhang, J. H. Cho, B. Li, W. J. Hu, Z. D. Zhang, "Magnetocaloric
effect in Ho$""_2$In over a wide temperature range," 2009, #emph[Appl.
Phys. Lett.] #strong[94], 182501.

D. Ravot, F. Bourée, T. Roisnel, "Neutron powder diffraction study of
Ho$""_2$In," 1992, #emph[Physica B] #strong[180&181], 119.

D. Ravot, M. Latroche, A. Percheron-Guegan, "Muon study of Gd$""_2$In,
Sm$""_2$In and Ho$""_2$In," 1997, #emph[Physica B] #strong[234-236],
\647.

A. Biswas, R. K. Chouhan, O. Dolotko, A. Thayer, S. Lapidus, Y. Mudryk,
V. K. Pecharsky, "Correlating crystallography, magnetism, and electronic
structure across anhysteretic first-order phase transition in
Pr$""_2$In," 2022, #emph[ECS J. Sol. Stat. Sci. Technol.] #strong[11],
\043005.

A. Biswas, R. K. Chouhan, A. Thayer, Y. Mudryk, I. Z. Hlova, O. Dolotko,
V. K. Pecharsky, "Unusual first-order magnetic phase transition and
large magnetocaloric effect in Nd$""_2$In," 2022, #emph[Phys. Rev.
Mater.] #strong[6], 114406.

W. Liu, F. Scheibel, T. Gottschall, E. Bykov, I. Dirba, K. Skokov, O.
Gutfleisch, "Large magnetic entropy change in Nd$""_2$In near the
boiling temperature of natural gas," 2021, #emph[Appl. Phys. Lett.]
#strong[119], 022408.

W. Cui, G. Yao, S. Sun, Q. Wang, J. Zhu, S. Yang, "Unconventional
metamagnetic phase transition in R$""_2$In (R=Nd, Pr) with lambda-like
specific heat and nonhysteresis," 2022, #emph[J. Mater. Sci. Technol.]
#strong[101], 80.

H. Gamari-Seale, T. Anagnostopoulos, J. K. Yakinthos, "Magnetic
characteristics of rare-earth indium R$""_2$In (R=Y, Nd, Sm, Gd, Tb, Dy,
Ho, Er, and Tm) intermetallic compounds," 1979, #emph[J. Appl. Phys.]
#strong[50], 434.

S. Parviainen, S. Penttila, "On the magnetic properties of rare-earth
intermetallics R$""_2$In and R$""_3$In," 1980, #emph[Phys. Stat. Sol.
(a)] #strong[60], K119.

W. Bazela, A. Szytuła, "Crystal structure and magnetic properties of
RE$""_2$In compounds," 1988, #emph[J. Less-Common Met.] #strong[138],
\123.

D. Ravot, O. Gorochov, T. Roisnel, "Magnetic susceptibility of
Sm$""_2$In: theory and experiment," 1995, #emph[J. Alloys Compd.]
#strong[225], 461.

S. P. McAlister, "Unusual ferrimagnetism in Mn$""_2$Mo$""_3$O$""_8$ and
Sm$""_2$In," 1984, #emph[J. Appl. Phys.] #strong[55], 2343.

M. Olzon-Dionysio et al., "Investigation of the magnetic hyperfine field
at the In site of the rare earth intermetallic Tb$""_2$In," 1992,
#emph[J. Phys.: Condens. Matter] #strong[4], 4307.

Q. Zhang, J. H. Cho, J. Du, F. Yang, X. G. Li, W. J. Feng, Y. J. Zhang,
J. Li, Z. D. Zhang, "Large reversible magnetocaloric effect in
Tb$""_2$In," 2009, #emph[Sol. Stat. Comms.] #strong[149], 396.

W. Liu, F. Scheibel, N. Fortunato, I. Dirba, T. Gottschall, H. Zhang, K.
Skokov, O. Gutfleisch, "Role of Debye temperature in achieving large
adiabatic temperature changes at cryogenic temperatures: a case study on
Pr$""_2$In," 2024, #emph[Phys. Rev. B] #strong[109], L140407.

E. Svanidze, C. Georgen, A. M. Hallas, Q. Huang, J. M. Santiago, J. W.
Lynn, E. Morosan, "Band Jahn-Teller structural phase transition in
Y$""_2$In," 2008, #emph[Phys. Rev. B] #strong[97], 054111.

F. Guillou, H. Yibole, R. Hamane, V. Hardy, Y. B. Sun, J. J. Zhao, Y.
Mudryk, V. K. Pecharsky, "Crystal structure and physical properties of
Yb$""_2$In and Eu$""_(2 - x)$Yb$""_x$In alloys," 2020, #emph[Phys. Rev.
Mater.] #strong[4], 104402.

A. Biswas, A. Thayer, O. Dolotko, Y. Mudryk, "Borderline first-order
phase transition and large cryogenic magnetocaloric effect in PrNdIn,"
2023, #emph[J. Appl. Phys.] #strong[134], 093902.

B. Gegen, B. Huhe, Z.-Q. Ou, F. Guillou, and H. Yibole, Thermal
Hysteresis and Reversibility of the Giant Magnetocaloric Effect at the
Ferromagnetic Transition of Nd$""_2$In, Materials #strong[18], 3104
(2025).

A. Palenzona, "The crystal structure and lattice constants of RE$""_2$In
and some RE$""_5$In$""_3$ compounds," 1968, #emph[J. Less-Common Met.]
#strong[16], 379.

M. L. Fornasini, S. Cirafici, "Crystal structures of Eu$""_3$Ga$""_2$,
EuGa, Eu$""_2$In, EuIn and EuIn$""_4$," 1990, #emph[Z. Kristallogr.]
#strong[190], 295.

D. T. K. Anh, G. Nakamoto, T. Tsuji, M. Kurisu, Y. Andoh, T. Tsutaoka,
N. Achiwa, S. Kawano, "Magnetic, specific heat and powder neutron
diffraction studies of Ho$""_2$In," 2006, #emph[J. Magn. Magn. Mater.]
#strong[304], e517.

O. D. McMasters, C. L. Nipper, K. A. Gschneidner Jr., "The
ytterbium-indium system," 1971, #emph[J. Less-Common Met.] #strong[23],
\253.

B. Wiendlocha, J. Tobola, S. Kaprzyk, D. Fruchart, J. Marcus,
"Competition of ferromagnetism and superconductivity in Sc$""_3$InB,"
2006, #emph[Phys. Status Solidi B] #strong[243], 351.

P. Singh, A. Biswas, A. Thayer, Y. Mudryk, "Charge-induced atomic strain
as a predictor of structural phase transformation in rare-earth
intermetallics," 2025, #emph[Phys. Rev. B] #strong[112], 054403.

P. Singh, T. Del Rose, A. Palasyuk, Y. Mudryk, "Physics-informed
machine-learning prediction of Curie temperatures and its promise for
guiding the discovery of functional magnetic materials," 2023,
#emph[Chem. Mater.] #strong[35], 6304.

Y. Y. Chen, J. M. Lawrence, J. D. Thompson, J. O. Willis, "Thermodynamic
behavior of the heavy-fermion compounds Ce$""_3$X (X= Al, In, Sn),"
1989, #emph[Phys. Rev. B] #strong[40], 10766.

S. B. Roy, "First-order magneto-structural phase transition and
associated multi-functional properties in magnetic solids," 2013,
#emph[J. Phys. Condens. Matter] #strong[25], 183201.

N. T. Trung, L. Zhang, L. Caron, K. H. J. Buschow, E. Bruck, "Giant
magnetocaloric effects by tailoring the phase transitions," 2010,
#emph[Appl. Phys. Lett.] #strong[96], 172504.

Z. Wei, E. Liu, Y. Li, G. Xu, X. Zhang, G. Liu, X. Xi, H. Zhang, W.
Wang, G. Wu, X. Zhang, "Unprecedentedly wide Curie-temperature windows
as phase‐transition design platform for tunable magneto‐multifunctional
materials," 2015, #emph[Adv. Electron. Mater.] #strong[1], 1500076.

A. Biswas, A. K. Pathak, N. A. Zarkevich, X. Liu, Y. Mudryk, V. Balema,
D. D. Johnson, V. K. Pecharsky, "Designed materials with the giant
magnetocaloric effect near room temperature," 2019, #emph[Acta Mater.]
#strong[180], 341.

H. N. Bez, A. K. Pathak, A. Biswas, N. Zarkevich, V. Balema, Y. Mudryk,
D. D. Johnson, V. K. Pecharsky, "Giant enhancement of the magnetocaloric
response in Ni--Co--Mn--Ti by rapid solidification," 2019, #emph[Acta
Mater.] #strong[173], 225.

A. Fujita, S. Fujieda, Y. Hasegawa, K. Fukamichi, "Itinerant-electron
metamagnetic transition and large magnetocaloric effects in
La(Fe$""_x$Si$""_(1 - x)$)$""_13$ compounds and their hydrides," 2003,
#emph[Phys. Rev. B] #strong[67], 104416.

C. Ritter, D. H. Ryan, A. Provino, G. Lamura, Y. Mudryk, R. K. Chouhan,
P. Singh, D. D. Johnson, V. K. Pecharsky, P. Manfrinetti, "Magnetic
ordering in Eu$""_2$In and Eu$""_2$Sn," 2024, #emph[J. Alloys. Compd.]
#strong[980], 173573.

S. Wang, P. Liu, J. Chen, W. Cui, "Magnetostriction and heat-capacity
study on the metamagnetic phase transition of
Dy$""_2$In$""_(1 - x)$Al$""_x$ alloys," 2022, #emph[AIP Adv.]
#strong[12], 035236.

S. Goswami, P. D. Babu, and R. Rawat, “High pressure study of
magnetocaloric effect in Ho$""_3$Co and Tb$""_3$Co\", 2020, #emph[J.
Phys.: Condens. Matter] #strong[32], 365803.

A. Biswas, S. Gupta, D. Clifford, Y. Mudryk, R. Hadimani, R. Barua, and
V. K. Pecharsky, “Bulk-like first-order magnetoelastic transition in
FeRh particles\", 2022, #emph[J. Alloys Compd.], #strong[921], 165993.

]

= References

#block[\[1\] A. Szytuła, "Magnetism of rare earth intermetallics," 1993, #emph[Phys.
Scr.] #strong[1993], 284.] <bib:Szytula1993>

#block[\[2\] H. Ghazanfar, H. Kim, M. Rabeel, M. Ahmed, S. Nisar, M. Zulfiqar, A.
Rehman, G. Dastgeer, D. Kim, "A review of rare earth materials for
emerging memory devices for neuromorphic computing," 2025, #emph[Mater.
Today Phys.] #strong[55], 101763.] <bib:Ghazanfar2025>

#block[\[3\] J. Custers, P. Gegenwart, H. Wilhelm, K. Neumaier, Y. Tokiwa, O.
Trovarelli, C. Geibel, F. Steglich, C. Pépin, and P. Coleman, "The
break-up of heavy electrons at a quantum critical point," 2003,
#emph[Nature] #strong[424], 524--527.] <bib:Custers2003>

#block[\[4\] S. Paschen, T. Lühmann, S. Wirth, P. Gegenwart, O. Trovarelli, C.
Geibel, F. Steglich, P. Coleman, and Q. Si, "Hall-effect evolution
across a heavy-fermion quantum critical point," 2004, #emph[Nature]
#strong[432], 881--885.] <bib:Paschen2004>

#block[\[5\] J. Custers, K.-A. Lorenzer, M. Müller, A. Prokofiev, A. Sidorenko, H.
Winkler, A. M. Strydom, Y. Shimura, T. Sakakibara, R. Yu, Q. Si, and S.
Paschen, "Destruction of the Kondo effect in the cubic heavy-fermion
compound Ce$""_3$Pd$""_20$Si$""_6$," 2012, #emph[Nat. Mater.]
#strong[11], 189--194.] <bib:Custers2012>

#block[\[6\] L. Petit, Z. Szotek, D. Paudyal, A. Biswas, Y. Mudryk, V. K. Pecharsky,
J. B. Staunton, "Magnetic structure of selected Gd intermetallic alloys
from first principles," 2020, #emph[Phys. Rev. B] #strong[101], 014409.] <bib:Petit2020>

#block[\[7\] T. Kurumaji, T. Nakajima, M. Hirschberger, A. Kikkawa, Y. Yamasaki, H.
Sagayama, H. Nakao, Y. Taguchi, T. Arima, Y. Tokura, "Skyrmion lattice
with a giant topological Hall effect in a frustrated triangular-lattice
magnet," 2019, #emph[Science] #strong[365], 914.] <bib:Kurumaji2019>

#block[\[8\] A. Kuroda, H. Hirose, Q. Xu, #emph[et al.], "Square and rhombic lattices
of magnetic skyrmions in a centrosymmetric binary compound
(EuAl$""_4$)," 2022, #emph[Nat. Commun.] #strong[13], 1201.] <bib:EuAl4Skyrmions2022>

#block[\[9\] L. Caretta, E. Rosenberg, F. Büttner, T. Fakhrul, P. Gargiani, M.
Valvidares, Z. Chen, P. Reddy, D. A. Muller, C. A. Ross, and G. S. D.
Beach, "Interfacial Dzyaloshinskii--Moriya interaction arising from
rare-earth orbital magnetism in insulating magnetic oxides," 2020,
#emph[Nat. Commun.] #strong[11], 1090.] <bib:Caretta2020>

#block[\[10\] V.K. Pecharsky, K.A. Gschneidner, Jr., "Giant magnetocaloric effect in
Gd$""_5$Si$""_2$Ge$""_2$," 1997, #emph[Phys. Rev. Lett.] #strong[78],
\4494.] <bib:Pecharsky1997>

#block[\[11\] A. D. Chinchure, E.M. Sandoval, J. A. Mydosh, "Metamagnetism and giant
magnetoresistance of the rare-earth intermetallic compounds
R$""_2$Ni$""_2$Pb (R=Er, Ho, Dy)," 2002, #emph[Phys. Rev. B]
#strong[66], R020409.] <bib:Chinchure2002>

#block[\[12\] G. Asti, M. Solzi, "Permanent Magnets," in R. Gerber, C.D. Wright, G.
Asti (eds), #emph[Applied Magnetism], NATO ASI Series, vol. 253,
Springer, Dordrecht (1994).] <bib:Asti1994>

#block[\[13\] T. Del Rose, A. K. Pathak, Y. Mudryk, V. K. Pecharsky, "Distinctive
exchange bias and unusual memory effects in magnetically compensated
Pr$""_0.75$Gd$""_0.25$ScGe," 2021, #emph[J. Mater. Chem. C] #strong[9],
\181.] <bib:DelRose2021>

#block[\[14\] P. O. Ribeiro, B. P. Alho, T. S. T. Alvarenga, E. P. Nóbrega, A. Magnus
G. Carvalho, V. S. R. de Sousa, A. Caldas, N. A. de Oliveira, P. J. von
Ranke, "Theoretical investigations on the magnetocaloric and barocaloric
effects in Tb$""_y$Gd$""_(1 - y)$Al$""_2$ series," 2013, #emph[J. Alloys
Compd.] #strong[563], 242.] <bib:Ribeiro2013>

#block[\[15\] S. Zhang, S. E. Saji, Z. Yin, H. Zhang, Y. Du, and C.-H. Yan,
"Rare-Earth Incorporated Alloy Catalysts: Synthesis, Properties, and
Applications," 2021, #emph[Adv. Mater.] #strong[33]\(16), e2005988.] <bib:Zhang2021>

#block[\[16\] S. Kumar, R. Muhammad, S. Kim, J. Yi, K. Son, and H. Oh, "Exploring
Magnetocaloric Materials for Sustainable Refrigeration near Hydrogen Gas
Liquefaction Temperature," 2024, #emph[Adv. Funct. Mater.]
#strong[34]\(39), 2402513.] <bib:Kumar2024b>

#block[\[17\] F. Guillou, A. K. Pathak, D. Paudyal, Y. Mudryk, F. Wilhelm, A. Rogalev,
V. K. Pecharsky, "Non-hysteretic first-order phase transition with large
latent heat and giant low-field magnetocaloric effect," 2018, #emph[Nat.
Commun.] #strong[9], 2925.] <bib:Guillou2018>

#block[\[18\] A. Biswas, N. A. Zarkevich, A. K. Pathak, O. Dolotko, I. Z. Hlova, A. V.
Smirnov, Y. Mudryk, D. D. Johnson, V. K. Pecharsky, "First-order
magnetic phase transition in Pr$""_2$In with negligible thermomagnetic
hysteresis," 2020, #emph[Phys. Rev. B] #strong[101], 224402.] <bib:Biswas2020>

#block[\[19\] E. Schuberth, M. Tippmann, L. Steinke, S. Lausberg, A. Steppke, M.
Brando, C. Krellner, C. Geibel, R. Yu, Q. Si, and F. Steglich,
"Emergence of superconductivity in the canonical heavy-electron metal
YbRh$""_2$Si$""_2$," 2016, #emph[Science] #strong[351]\(6272), 485--488.] <bib:Schuberth2016>

#block[\[20\] A. Ahmed, J. Sharma, A. Bhattacharya, A. Biswas, T. Singha, Y. Mudryk,
A. Alam, I. Das, "Unconventional anomalous Hall effect in hexagonal
polar magnet Y$""_3$Co$""_8$Sn$""_4$," 2025, #emph[Adv. Funct. Mater.]
#strong[2025], 2502940.] <bib:Ahmed2025>

#block[\[21\] A. Bhattacharya, A. Ahmed, A. Dutta, A. Kumar, P. Singh, A. Biswas, Y.
Mudryk, I. Das, "Anomalous Hall effect in the polar magnet
Gd$""_3$Ni$""_8$Sn$""_4$: a candidate for hosting skyrmions," 2025,
#emph[Phys. Rev. B] #strong[111], 104410.] <bib:Bhattacharya2025>

#block[\[22\] M. Kenzelmann, T. Strässle, C. Niedermayer, M. Sigrist, A. D. Bianchi,
R. Movshovich, E. D. Bauer, J. L. Sarrao, and J. D. Thompson, "Coupled
Superconducting and Magnetic Order in CeCoIn$""_5$," 2008,
#emph[Science] #strong[321]\(5896), 1652--1654.] <bib:Kenzelmann2008>

#block[\[23\] A. Kumar, P. Singh, A. Doyle, D. L. Schlagel, and Y. Mudryk, Multiple
magnetic interactions and large inverse magnetocaloric effect in TbSi
and TbSi$""_0.6$Ge$""_0.4$, Phys. Rev. B#strong[109], 214410 (2024).] <bib:Kumarprb24>

#block[\[24\] A. Biswas, R. K. Chouhan, O. Dolotko, P. Manfrinetti, S. Lapidus, D. L.
Schlagel, Y. Mudryk, "Exceptional magnetic and magnetoelastic behavior
of rare-earth non-centrosymmetric Sm$""_7$Pd$""_3$," 2024, #emph[Acta
Mater.] #strong[265], 119630.] <bib:Biswas2024>

#block[\[25\] Y. Dong, Y. Kinoshita, M. Ochi, R. Nakachi, R. Higashinaka, S. Hayami,
Y. Wan, Y. Arai, S. Huh, M. Hashimoto, D. Lu, M. Tokunaga, Y. Aoki, T.
D. Matsuda, and T. Kondo, "Pseudogap and Fermi arc induced by Fermi
surface nesting in a centrosymmetric skyrmion magnet," 2025,
#emph[Science] #strong[388]\(6747), 624--630.] <bib:Dong2025>

#block[\[26\] B. P. Alho, P. O. Ribeiro, V. S. R. de Sousa, B. C. Margato, A. Biswas,
T. Del Rose, R. S. de Oliveira, E. P. Nóbrega, P. J. von Ranke, Y.
Mudryk, V. K. Pecharsky, "Fathoming the anisotropic magnetoelasticity
and magnetocaloric effect in GdNi," 2022, #emph[Phys. Rev. B]
#strong[106], 184403.] <bib:Alho2022>

#block[\[27\] K. Izawa, K. Behnia, Y. Matsuda, H. Shishido, R. Settai, Y. Onuki, and
J. Flouquet, "Thermoelectric Response Near a Quantum Critical Point: The
Case of CeCoIn$""_5$," 2007, #emph[Phys. Rev. Lett.] #strong[99],
\147005.] <bib:Izawa2007>

#block[\[28\] S. Chakraborty, S. Gupta, S. Pakhira, R. Choudhary, A. Biswas, Y.
Mudryk, V. K. Pecharsky, D. D. Johnson, C. Mazumdar, "Ground-state
degeneracy and complex magnetism of geometrically frustrated
Gd$""_2$Ir$""_0.97$Si$""_2.97$," 2022, #emph[Phys. Rev. B] #strong[106],
\224427.] <bib:Chakraborty2022>

#block[\[29\] A. Biswas, A. Kumar, P. Singh, T. Del Rose, R. K. Chouhan, B. C.
Margato, B. P. Alho, E. P. Nóbrega, P. J. von Ranke, P. O. Ribeiro, V.
S. R. de Sousa, Y. Mudryk, "Influence of Ga doping on magnetic
properties, magnetocaloric effect, and electronic structure of
pseudobinary GdZn$""_(1 - x)$Ga$""_x$ (x = 0--0.1)," 2024, #emph[Phys.
Rev. Mater.] #strong[8], 114418.] <bib:Biswas2024b>

#block[\[30\] J. Bouaziz, E. Mendive-Tapia, S. Blügel, and J. B. Staunton,
"Fermi-Surface Origin of Skyrmion Lattices in Centrosymmetric Rare-Earth
Intermetallics," 2022, #emph[Phys. Rev. Lett.] #strong[128], 157206.] <bib:Bouaziz2022>

#block[\[31\] A. Kumar, A. Biswas, Y. Mudryk, "Stability of the first-order character
of phase transition in HoCo$""_2$," 2024, #emph[J. Appl. Phys.]
#strong[136], 203902.] <bib:Kumar2024>

#block[\[32\] S. Chakraborty, S. Gupta, S. Pakhira, S. Dan, A. Biswas, Y. Mudryk, C.
Mazumdar, "Large adiabatic temperature change and magnetic frustration
in triangular lattice antiferromagnet Dy$""_2$IrSi$""_3$," 2024,
#emph[J. Alloys Compd.] #strong[981], 173652.] <bib:Chakraborty2024>

#block[\[33\] P. O. Ribeiro, B. P. Alho, R. S. de Oliveira, E. P. Nóbrega, V. S. R. de
Sousa, P. J. von Ranke, D. L. Schlagel, A. Biswas, Y. Mudryk, V. K.
Pecharsky, "Anisotropic magneto-resistivity and magnetocaloric effect in
DyAl$""_2$," 2024, #emph[J. Alloys Compd.] #strong[976], 173149.] <bib:Ribeiro2024>

#block[\[34\] M. Gomilšek, T. J. Hicken, M. N. Wilson, K. J. A. Franke, B. M. Huddart,
A. Štefančič, S. J. R. Holt, G. Balakrishnan, D. A. Mayoh, M. T. Birch,
S. H. Moody, H. Luetkens, Z. Guguchia, M. T. F. Telling, P. J. Baker, S.
J. Clark, and T. Lancaster, "Anisotropic skyrmion and multi-$q$ spin
dynamics in centrosymmetric Gd$""_2$PdSi$""_3$," 2025, #emph[Phys. Rev.
Lett.] #strong[134], 046702.] <bib:Gd2PdSi3PRL2025>

#block[\[35\] A. Kumar, A. Biswas, Y. Mudryk, "Magnetic glassiness in
noncentrosymmetric Sm$""_7$Pd$""_3$: interplay of magnetic frustration,
long-range order, and frozen domains," 2025, #emph[Phys. Rev. B]
#strong[111], 174448.] <bib:Kumar2025a>

#block[\[36\] Y. Mudryk, V. K. Pecharsky, K. A. Gschneidner Jr., "Extraordinary
responsive intermetallic compounds: the R$""_5$T$""_4$ family (R = rare
earth, T = group 13--15 element)," 2011, #emph[Z. Anorg. Allg. Chem.]
#strong[637], 1948.] <bib:Mudryk2011>

#block[\[37\] H. Nakamura, "The current and future status of rare earth permanent
magnets," 2018, #emph[Scripta Materialia] #strong[154], 273.] <bib:Nakamurascripta18>

#block[\[38\] J. Jensen, A. R. Mackintosh, #emph[Rare Earth Magnetism], The
International Series of Monographs on Physics, Clarendon Press, Oxford,
\1991.] <bib:Jensen1991>

#block[\[39\] T. Kasuya, "A theory of metallic ferro- and antiferromagnetism on
Zener's model," 1956, #emph[Prog. Theor. Phys.] #strong[16], 45.] <bib:Kasuya1956>

#block[\[40\] I. A. Campbell, "Indirect exchange for rare earths in metals," 1972,
#emph[J. Phys. F: Metal Phys.] #strong[2], L47.] <bib:Campbell1972>

#block[\[41\] A. Kumar, A. Biswas, and Y. Mudryk, “Nontrivial critical behavior at
magnetic transitions: A case study of Sm$""_7$Pd$""_3$\", 2025,
#emph[Phys. Rev. B] #strong[112], 224416.] <bib:Kumar_PRB_25>

#block[\[42\] M. Forker, R. Mubeler, S. C. Bedi, M. Olzon-Dionysio, S. Dionysio de
Souza, "Magnetic and electric hyperfine interactions in the rare-earth
indium compounds R$""_2$In studied by $""^111$Cd perturbed angular
correlations," 2005, #emph[Phys. Rev. B] #strong[71], 094404.] <bib:Forker2005>

#block[\[43\] A. Bhattacharyya, S. Chatterjee, S. Giri, S. Majumdar, "Magnetic anomaly
and magnetocaloric effect in Dy$""_2$In," 2009, #emph[J. Magn. Magn.
Mater.] #strong[321], 1828.] <bib:Bhattacharyya2009>

#block[\[44\] Q. Zhang, X. G. Liu, F. Yang, W. J. Feng, X. G. Zhao, D. J. Kang, Z. D.
Zhang, "Large reversible magnetocaloric effect in Dy$""_2$In," 2009,
#emph[J. Phys. D: Appl. Phys.] #strong[42], 055011.] <bib:Zhang2009>

#block[\[45\] D. Ravot, O. Gorochov, T. Roisnel, G. André, F. Bour, J. A. Hodges,
"Magnetic properties of Er$""_2$In," 1993, #emph[J. Magn. Magn. Mater.]
#strong[128], 267.] <bib:Ravot1993>

#block[\[46\] H. Zhang, B. G. Shen, Z. Y. Xu, J. Chen, J. Shen, F. X. Hu, J. R. Sun,
"Large reversible magnetocaloric effect in Er$""_2$In compound," 2011,
#emph[J. Alloys Compd.] #strong[509], 2602.] <bib:Zhang2011>

#block[\[47\] B. P. Alho, P. O. Ribeiro, P. J. von Ranke, F. Guillou, Y. Mudryk, V. K.
Pecharsky, "Free-energy analysis of the nonhysteretic first-order phase
transition of Eu$""_2$In," 2020, #emph[Phys. Rev. B] #strong[102],
\134425.] <bib:Alho2020>

#block[\[48\] D. H. Ryan, D. Paudyal, F. Guillou, Y. Mudryk, A. K. Pathak, V. K.
Pecharsky, "The first-order magnetoelastic transition in Eu$""_2$In: a
$""^151$Eu Mössbauer study," 2019, #emph[AIP Adv.] #strong[9], 125137.] <bib:Ryan2019>

#block[\[49\] E. Mendive-Tapia, D. Paudyal, L. Petit, J. B. Staunton, "First-order
ferromagnetic transitions of lanthanide local moments in divalent
compounds: an itinerant electron positive feedback mechanism and Fermi
surface topological change," 2020, #emph[Phys. Rev. B] #strong[101],
\174437.] <bib:MendiveTapia2020>

#block[\[50\] V. Singh, A. Bhattacharyya, S. Majumdar, I. Dasgupta, "A theoretical and
experimental study of magnetism in Gd$""_2$In," 2012, #emph[J. Appl.
Phys.] #strong[111], 053709.] <bib:Singh2012>

#block[\[51\] A. Bhattacharyya, S. Giri, S. Majumdar, "Field induced sign reversal of
magnetocaloric effect in Gd$""_2$In," 2012, #emph[J. Magn. Magn. Mater.]
#strong[324], 1239.] <bib:Bhattacharyya2012>

#block[\[52\] S. Tencé, B. Chevalier, "Magnetic and magnetocaloric properties of
Gd$""_2$In$""_0.8$X$""_0.2$ compounds (X = Al, Ga, Sn, Pb)," 2016,
#emph[J. Magn. Magn. Mater.] #strong[399], 46.] <bib:Tence2016>

#block[\[53\] S. P. McAlister, "Magnetic and electrical properties of Gd$""_2$In,"
1984, #emph[J. Phys. F: Met. Phys.] #strong[14], 2167.] <bib:McAlister1984a>

#block[\[54\] N. Kamali Sarvestani, S. Ahmad Ketabi, A. Yazdani, "Electro-mechanical
character of Gd and Gd$""_2$In and possibility of a Kondo-like behavior
in Gd$""_2$In," 2014, #emph[J. Alloys Compd.] #strong[613], 62.] <bib:Kamali2014>

#block[\[55\] S. V. Taskaev, V. V. Khovaylo, M. N. Ulyanov, D. S. Bataev, A. A.
Basharova, M. V. Kononova, D. V. Plakhotskiy, M. Yu. Bogush, D. A.
Zherebtsov, "Magnetic and magnetocaloric properties of as-cast
Gd$""_2$In," 2021, #emph[Lett. Mater.] #strong[11], 104.] <bib:Taskaev2021>

#block[\[56\] W. Liu, M. Yamashita, M. Kurisu, H. Kadomatsu, H. Fujiwara, "Magnetic
transitions of Gd$""_2$In under pressure," 1987, #emph[J. Phys. Soc.
Jpn.] #strong[56], 421.] <bib:Liu1987>

#block[\[57\] C. Jee, C. L. Lin, T. Mihalisin, X. Wang, "Magnetization and specific
heat studies of Gd$""_2$In," 1996, #emph[J. Appl. Phys.] #strong[79],
\5403.] <bib:Jee1996>

#block[\[58\] A. Bhattacharyya, S. Chatterjee, S. Giri, S. Majumdar, "Magnetotransport
and magnetocaloric effect in Ho$""_2$In," 2009, #emph[Eur. Phys. J. B]
#strong[70], 347.] <bib:Bhattacharyya2009b>

#block[\[59\] Q. Zhang, J. H. Cho, B. Li, W. J. Hu, Z. D. Zhang, "Magnetocaloric
effect in Ho$""_2$In over a wide temperature range," 2009, #emph[Appl.
Phys. Lett.] #strong[94], 182501.] <bib:Zhang2009b>

#block[\[60\] D. Ravot, F. Bourée, T. Roisnel, "Neutron powder diffraction study of
Ho$""_2$In," 1992, #emph[Physica B] #strong[180&181], 119.] <bib:Ravot1992>

#block[\[61\] D. Ravot, M. Latroche, A. Percheron-Guegan, "Muon study of Gd$""_2$In,
Sm$""_2$In and Ho$""_2$In," 1997, #emph[Physica B] #strong[234-236],
\647.] <bib:Ravot1997>

#block[\[62\] A. Biswas, R. K. Chouhan, O. Dolotko, A. Thayer, S. Lapidus, Y. Mudryk,
V. K. Pecharsky, "Correlating crystallography, magnetism, and electronic
structure across anhysteretic first-order phase transition in
Pr$""_2$In," 2022, #emph[ECS J. Sol. Stat. Sci. Technol.] #strong[11],
\043005.] <bib:Biswas2022a>

#block[\[63\] A. Biswas, R. K. Chouhan, A. Thayer, Y. Mudryk, I. Z. Hlova, O. Dolotko,
V. K. Pecharsky, "Unusual first-order magnetic phase transition and
large magnetocaloric effect in Nd$""_2$In," 2022, #emph[Phys. Rev.
Mater.] #strong[6], 114406.] <bib:Biswas2022b>

#block[\[64\] W. Liu, F. Scheibel, T. Gottschall, E. Bykov, I. Dirba, K. Skokov, O.
Gutfleisch, "Large magnetic entropy change in Nd$""_2$In near the
boiling temperature of natural gas," 2021, #emph[Appl. Phys. Lett.]
#strong[119], 022408.] <bib:Liu2021>

#block[\[65\] W. Cui, G. Yao, S. Sun, Q. Wang, J. Zhu, S. Yang, "Unconventional
metamagnetic phase transition in R$""_2$In (R=Nd, Pr) with lambda-like
specific heat and nonhysteresis," 2022, #emph[J. Mater. Sci. Technol.]
#strong[101], 80.] <bib:Cui2022>

#block[\[66\] H. Gamari-Seale, T. Anagnostopoulos, J. K. Yakinthos, "Magnetic
characteristics of rare-earth indium R$""_2$In (R=Y, Nd, Sm, Gd, Tb, Dy,
Ho, Er, and Tm) intermetallic compounds," 1979, #emph[J. Appl. Phys.]
#strong[50], 434.] <bib:GamariSeale1979>

#block[\[67\] S. Parviainen, S. Penttila, "On the magnetic properties of rare-earth
intermetallics R$""_2$In and R$""_3$In," 1980, #emph[Phys. Stat. Sol.
(a)] #strong[60], K119.] <bib:Parviainen1980>

#block[\[68\] W. Bazela, A. Szytuła, "Crystal structure and magnetic properties of
RE$""_2$In compounds," 1988, #emph[J. Less-Common Met.] #strong[138],
\123.] <bib:Bazela1988>

#block[\[69\] D. Ravot, O. Gorochov, T. Roisnel, "Magnetic susceptibility of
Sm$""_2$In: theory and experiment," 1995, #emph[J. Alloys Compd.]
#strong[225], 461.] <bib:Ravot1995>

#block[\[70\] S. P. McAlister, "Unusual ferrimagnetism in Mn$""_2$Mo$""_3$O$""_8$ and
Sm$""_2$In," 1984, #emph[J. Appl. Phys.] #strong[55], 2343.] <bib:McAlister1984b>

#block[\[71\] M. Olzon-Dionysio et al., "Investigation of the magnetic hyperfine field
at the In site of the rare earth intermetallic Tb$""_2$In," 1992,
#emph[J. Phys.: Condens. Matter] #strong[4], 4307.] <bib:OlzonDionysio1992>

#block[\[72\] Q. Zhang, J. H. Cho, J. Du, F. Yang, X. G. Li, W. J. Feng, Y. J. Zhang,
J. Li, Z. D. Zhang, "Large reversible magnetocaloric effect in
Tb$""_2$In," 2009, #emph[Sol. Stat. Comms.] #strong[149], 396.] <bib:Zhang2009c>

#block[\[73\] W. Liu, F. Scheibel, N. Fortunato, I. Dirba, T. Gottschall, H. Zhang, K.
Skokov, O. Gutfleisch, "Role of Debye temperature in achieving large
adiabatic temperature changes at cryogenic temperatures: a case study on
Pr$""_2$In," 2024, #emph[Phys. Rev. B] #strong[109], L140407.] <bib:Liu2024>

#block[\[74\] E. Svanidze, C. Georgen, A. M. Hallas, Q. Huang, J. M. Santiago, J. W.
Lynn, E. Morosan, "Band Jahn-Teller structural phase transition in
Y$""_2$In," 2008, #emph[Phys. Rev. B] #strong[97], 054111.] <bib:Svanidze2008>

#block[\[75\] F. Guillou, H. Yibole, R. Hamane, V. Hardy, Y. B. Sun, J. J. Zhao, Y.
Mudryk, V. K. Pecharsky, "Crystal structure and physical properties of
Yb$""_2$In and Eu$""_(2 - x)$Yb$""_x$In alloys," 2020, #emph[Phys. Rev.
Mater.] #strong[4], 104402.] <bib:Guillou2020>

#block[\[76\] A. Biswas, A. Thayer, O. Dolotko, Y. Mudryk, "Borderline first-order
phase transition and large cryogenic magnetocaloric effect in PrNdIn,"
2023, #emph[J. Appl. Phys.] #strong[134], 093902.] <bib:Biswas2023>

#block[\[77\] B. Gegen, B. Huhe, Z.-Q. Ou, F. Guillou, and H. Yibole, Thermal
Hysteresis and Reversibility of the Giant Magnetocaloric Effect at the
Ferromagnetic Transition of Nd$""_2$In, Materials #strong[18], 3104
(2025).] <bib:GegenMater25>

#block[\[78\] A. Palenzona, "The crystal structure and lattice constants of RE$""_2$In
and some RE$""_5$In$""_3$ compounds," 1968, #emph[J. Less-Common Met.]
#strong[16], 379.] <bib:Palenzona1968>

#block[\[79\] M. L. Fornasini, S. Cirafici, "Crystal structures of Eu$""_3$Ga$""_2$,
EuGa, Eu$""_2$In, EuIn and EuIn$""_4$," 1990, #emph[Z. Kristallogr.]
#strong[190], 295.] <bib:Fornasini1990>

#block[\[80\] D. T. K. Anh, G. Nakamoto, T. Tsuji, M. Kurisu, Y. Andoh, T. Tsutaoka,
N. Achiwa, S. Kawano, "Magnetic, specific heat and powder neutron
diffraction studies of Ho$""_2$In," 2006, #emph[J. Magn. Magn. Mater.]
#strong[304], e517.] <bib:Anh2006>

#block[\[81\] D. Ravot, O. Gorochov, T. Roisnel, "Magnetic properties of Er$""_2$In
and Dy$""_2$In," 1990, #emph[J. Magn. Magn. Mater.] #strong[87], 99.] <bib:Ravot1990>

#block[\[82\] O. D. McMasters, C. L. Nipper, K. A. Gschneidner Jr., "The
ytterbium-indium system," 1971, #emph[J. Less-Common Met.] #strong[23],
\253.] <bib:McMasters1971>

#block[\[83\] B. Wiendlocha, J. Tobola, S. Kaprzyk, D. Fruchart, J. Marcus,
"Competition of ferromagnetism and superconductivity in Sc$""_3$InB,"
2006, #emph[Phys. Status Solidi B] #strong[243], 351.] <bib:Wiendlocha2006>

#block[\[84\] P. Singh, A. Biswas, A. Thayer, Y. Mudryk, "Charge-induced atomic strain
as a predictor of structural phase transformation in rare-earth
intermetallics," 2025, #emph[Phys. Rev. B] #strong[112], 054403.] <bib:Singh2025>

#block[\[85\] P. Singh, T. Del Rose, A. Palasyuk, Y. Mudryk, "Physics-informed
machine-learning prediction of Curie temperatures and its promise for
guiding the discovery of functional magnetic materials," 2023,
#emph[Chem. Mater.] #strong[35], 6304.] <bib:Singh2023>

#block[\[86\] Y. Y. Chen, J. M. Lawrence, J. D. Thompson, J. O. Willis, "Thermodynamic
behavior of the heavy-fermion compounds Ce$""_3$X (X= Al, In, Sn),"
1989, #emph[Phys. Rev. B] #strong[40], 10766.] <bib:Chen1989>

#block[\[87\] S. B. Roy, "First-order magneto-structural phase transition and
associated multi-functional properties in magnetic solids," 2013,
#emph[J. Phys. Condens. Matter] #strong[25], 183201.] <bib:Roy2013>

#block[\[88\] N. T. Trung, L. Zhang, L. Caron, K. H. J. Buschow, E. Bruck, "Giant
magnetocaloric effects by tailoring the phase transitions," 2010,
#emph[Appl. Phys. Lett.] #strong[96], 172504.] <bib:Trung2010>

#block[\[89\] Z. Wei, E. Liu, Y. Li, G. Xu, X. Zhang, G. Liu, X. Xi, H. Zhang, W.
Wang, G. Wu, X. Zhang, "Unprecedentedly wide Curie-temperature windows
as phase‐transition design platform for tunable magneto‐multifunctional
materials," 2015, #emph[Adv. Electron. Mater.] #strong[1], 1500076.] <bib:Wei2015>

#block[\[90\] A. Biswas, A. K. Pathak, N. A. Zarkevich, X. Liu, Y. Mudryk, V. Balema,
D. D. Johnson, V. K. Pecharsky, "Designed materials with the giant
magnetocaloric effect near room temperature," 2019, #emph[Acta Mater.]
#strong[180], 341.] <bib:Biswas2019a>

#block[\[91\] H. N. Bez, A. K. Pathak, A. Biswas, N. Zarkevich, V. Balema, Y. Mudryk,
D. D. Johnson, V. K. Pecharsky, "Giant enhancement of the magnetocaloric
response in Ni--Co--Mn--Ti by rapid solidification," 2019, #emph[Acta
Mater.] #strong[173], 225.] <bib:Bez2019>

#block[\[92\] A. Fujita, S. Fujieda, Y. Hasegawa, K. Fukamichi, "Itinerant-electron
metamagnetic transition and large magnetocaloric effects in
La(Fe$""_x$Si$""_(1 - x)$)$""_13$ compounds and their hydrides," 2003,
#emph[Phys. Rev. B] #strong[67], 104416.] <bib:Fujita2003>

#block[\[93\] C. Ritter, D. H. Ryan, A. Provino, G. Lamura, Y. Mudryk, R. K. Chouhan,
P. Singh, D. D. Johnson, V. K. Pecharsky, P. Manfrinetti, "Magnetic
ordering in Eu$""_2$In and Eu$""_2$Sn," 2024, #emph[J. Alloys. Compd.]
#strong[980], 173573.] <bib:Ritter2024>

#block[\[94\] S. Wang, P. Liu, J. Chen, W. Cui, "Magnetostriction and heat-capacity
study on the metamagnetic phase transition of
Dy$""_2$In$""_(1 - x)$Al$""_x$ alloys," 2022, #emph[AIP Adv.]
#strong[12], 035236.] <bib:Wang2022>

#block[\[95\] S. Goswami, P. D. Babu, and R. Rawat, “High pressure study of
magnetocaloric effect in Ho$""_3$Co and Tb$""_3$Co\", 2020, #emph[J.
Phys.: Condens. Matter] #strong[32], 365803.] <bib:Goswami_JPCM_2020>

#block[\[96\] A. Biswas, S. Gupta, D. Clifford, Y. Mudryk, R. Hadimani, R. Barua, and
V. K. Pecharsky, “Bulk-like first-order magnetoelastic transition in
FeRh particles\", 2022, #emph[J. Alloys Compd.], #strong[921], 165993.] <bib:Biswas_Jalcom_22>
