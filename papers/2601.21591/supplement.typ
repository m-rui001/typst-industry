// Zhou, Bui, and Cox, arXiv:2601.21591v1. Converted from the authors’ LaTeX under CC BY 4.0.
// https://arxiv.org/abs/2601.21591v1 | https://creativecommons.org/licenses/by/4.0/
#set figure(numbering: "S1")

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
  title: [Supplementary information: The roles of bulk and surface
thermodynamics in the selective adsorption of a confined azeotropic
mixture],
  authors: (
    ( name: [Katie L. Y. Zhou],
      affiliation: "",
      email: "" ),
    ( name: [Anna T. Bui],
      affiliation: "",
      email: "" ),
    ( name: [Stephen J. Cox],
      affiliation: "",
      email: "" ),
    ),
  date: [2026-11-19],
  abstract-title: [Abstract],
  pagenumbering: "1",
  cols: 1,
  doc,
)


#set heading(numbering: "S1.1")
#set math.equation(numbering: "(S1)")

= Comparison to Simulation and Standard Mean-Field Theory
<comparison-to-simulation-and-standard-mean-field-theory>
Archer and Evans previously established a connection between LMFT and
traditional mean-field cDFT \[1\]. While similar to our formalism,
$Delta mu$ was identified as an integration constant, which for mixtures
reads
$ Delta mu_alpha = sum_eta macron(rho)_eta integral #h(-1em) upright(d) bold(italic(r))' thin u_(1 \, alpha eta) \( \| bold(italic(r)) - bold(italic(r))' \| \) #h(0em) . $<eqn:mf-mu>
In this section, we compare our hyper-DFT approach to the standard
mean-field cDFT treatment. That is, we consider the above expression
(Eq.~@eqn:mf-mu) for ${ Delta mu_alpha }$ together with a hard sphere
(HS) reference; here we use the accurate neural functional from Ref.~.

In Fig. @fig:si_cap-cond we show a comparison between our hyper-DFT
framework and standard mean-field cDFT for capillary condensation (Fig.
1b in the main text), with a reservoir at
$k_(upright(B)) T \/ epsilon.alt = 0.77$,
$P sigma^3 \/ epsilon.alt = 0.020$, and $x_(upright(B)) = 0.78$, which
corresponds to the vapor state. Both approaches show the transition from
a gas-like to liquid-like state when going from interaction strength
$epsilon.alt_(upright(w) \, upright(A)) = epsilon.alt_(upright(w) \, upright(B)) = 2.0 k_(upright(B)) T$
to $2.5 k_(upright(B)) T$. While both are in excellent agreement with
GCMC simulation for the gas-like state, they begin to deviate for the
higher-density liquid-like state. Minor discrepancies are observed for
hyper-DFT, while the standard mean-field result overestimates the peaks
in the density profiles.

#figure(image("graphics/SI_capillary_condensation.svg"),
  caption: [
    Comparison with the standard mean-field cDFT treatment for capillary
    condensation. Left: hyper-DFT, using a WCA reference and
    ${ Delta mu_alpha }$ from the PeTS equation of state. Right:
    standard mean-field cDFT, using a HS reference and Eq.~@eqn:mf-mu
    for ${ Delta mu_alpha }$. Top row shows the condensed liquid state
    with
    $epsilon.alt_(upright(w) \, upright(A)) = epsilon.alt_(upright(w) \, upright(B)) = 2.5 thin k_(upright(B)) T$,
    while the bottom row shows the vapor state at
    $epsilon.alt_(upright(w) \, upright(A)) = epsilon.alt_(upright(w) \, upright(B)) = 2.0 thin k_(upright(B)) T$.
  ]
)
<fig:si_cap-cond>

In Fig.~@fig:si_cdft-vs-mft we investigate the factors governing these
differences in more detail, such as the reference system and the
treatment of ${ Delta mu_alpha }$. The reservoir is now in a
supercritical state at $k_(upright(B)) T \/ epsilon.alt = 1.50$ and
$x_(upright(B)) = 0.66$, with the total density varied between
$macron(rho) = 0.01$ to $macron(rho) = 0.7$. The two walls are separated
by $L = 8 sigma$ and interact with strength
$epsilon.alt_(upright(w) \, upright(A)) = epsilon.alt_(upright(w) \, upright(B)) = 2.0 thin k_(upright(B)) T$.
As observed in Fig.~#ref(<fig:si_cdft-vs-mft>, supplement: none);(a), the hyper-DFT result, i.e.,
using the WCA reference and the PeTS equation of state for
${ Delta mu_alpha }$, results in excellent agreement with simulation
across all densities. Switching to a HS reference in
Fig.~#ref(<fig:si_cdft-vs-mft>, supplement: none);(b) results in similarly excellent agreement for
most densities, though the system is over-structured at
$macron(rho) = 0.7$. In Figs.~#ref(<fig:si_cdft-vs-mft>, supplement: none);(c)
and~#ref(<fig:si_cdft-vs-mft>, supplement: none);(d), we respectively use WCA and HS as reference,
but ${ Delta mu_alpha }$ is obtained with Eq.~@eqn:mf-mu. While both
reference systems show excellent agreement at the highest and lowest
densities, neither obtains the correct bulk density at intermediate
densities. This is in line with observations made with LMFT \[2,3\].

#figure(image("graphics/SI_cdft_approaches.svg"),
  caption: [
    Comparison of reference systems and cDFT approaches at different
    bulk densities at supercritical conditions. (a) Hyper-DFT, using the
    WCA reference and the PeTS equation of state. (b) HS reference and
    the PeTS equation of state. (c) WCA reference and
    ${ Delta mu_alpha }$ given by Eq.~@eqn:mf-mu. (d) Standard
    mean-field cDFT, using a HS reference and ${ Delta mu_alpha }$ given
    by Eq.~@eqn:mf-mu.
  ]
)
<fig:si_cdft-vs-mft>

Highlighting further the differences in bulk thermodynamics used by
mean-field theory and the two reference systems, we present the binodal
in Fig.~@fig:si_binodal for the single-component truncated and shifted
LJ fluid. The hyper-DFT approach, by construction, reproduces the same
outputs as that from the PeTS equation of state. Fig.~#ref(<fig:si_binodal>, supplement: none);(a)
shows an isotherm of the chemical potential as a function of bulk
density at $k_(upright(B)) T \/ epsilon.alt = 0.90$. All approaches show
a van der Waals loop. Performing a Maxwell construction on these
isotherms gives the binodal in Fig.~#ref(<fig:si_binodal>, supplement: none);(b). Comparing to
simulation results from Ref.~, the PeTS equation of state (and by
extension, hyper-DFT) is the most accurate. The mean-field theories can
accurately reproduce the vapor coexistence densities, though the WCA
reference leads to an underestimate of the liquid densities. The HS
reference, through cancellation of errors, results in accurate liquid
densities below the critical temperature.

#figure(image("graphics/SI_binodal.svg"),
  caption: [
    Bulk liquid--vapor coexistence for the single-component LJ fluid,
    comparing the EoS against the standard mean-field treatment with
    different reference systems. (a) The chemical potential as a
    function of bulk density at
    $k_(upright(B)) T \/ epsilon.alt = 0.90$, highlighted by the dotted
    grey line on the right. The coexistence densities obtained from
    Maxwell construction are shown by the circles. (b) The binodal
    obtained from Maxwell construction. Fits to the binodal to
    Eq.~@eq:binodal_fit are shown by the colored dotted lines.
    Simulation results are from Vrabec #emph[et al.] in Ref.~.
  ]
)
<fig:si_binodal>

In addition to the errors with the coexistence densities, the mean-field
approaches overestimate the critical temperature and underestimate the
critical density. Near the critical temperature, an empirical fit can be
made of the form \[4,5\]
$ rho_plus.minus = a \| T - T_(upright("c")) \| plus.minus b \| T - T_(upright("c")) \|^beta + rho_(upright("c")) $<eq:binodal_fit>
where $rho_(+) = rho^(upright(\( l \)))$ and
$rho_(-) = rho^(upright(\( v \)))$ are the liquid and vapor coexistence
densities respectively, $rho_(upright("c"))$ is the critical density,
$beta$ is the standard 3D Ising result \[6\], and $a$ and $b$ are
parameters to be fitted. Results are presented in Table
@tab:binodal_fit. The PeTS equation of state returns values that are
closest to those observed in literature.

#block[
#figure(
  align(center)[#table(
    columns: 5,
    align: (center,center,center,center,center,),
    table.header([], [HS Mean-Field], [WCA
      Mean-Field], [PeTS], [Literature],),
    table.hline(),
    [$T_(upright("c"))$], [$1.236 \( 1 \)$], [$1.1909 \( 6 \)$], [$1.089$
    \[7\]], [$1.0779$ \[8\]],
    [$rho_(upright("c"))$], [$0.2422 \( 7 \)$], [$0.2381 \( 4 \)$], [$0.3092$
    \[7\]], [$0.3190$ \[8\]],
    [$beta$], [$0.500 \( 3 \)$], [$0.472 \( 2 \)$], [$0.350 \( 2 \)$], [$0.32630 \( 22 \)$
    \[6\]],
  )]
  , caption: [Critical exponents extracted from the fits to the binodals
  (Eq. @eq:binodal_fit). The number in parentheses indicates the
  uncertainty in the last digit.]
  , kind: table
  ) <tab:binodal_fit>

]
= Results For Other Systems
<results-for-other-systems>
One of the main benefits of using a single-component reference system is
that it lends itself readily to a "train once, learn many" strategy. As
further demonstration of this transferability, we show brief results in
Fig.~@fig:other_mixtures. Density profiles of truncated and shifted LJ
binary mixtures with varying $epsilon.alt_(upright(B B))$ and
$epsilon.alt_(upright(A B))$ are presented in Fig.~#ref(<fig:other_mixtures>, supplement: none);(a)
and compared to GCMC simulation. Parameters of the mixtures are
summarized in Table @tab:mixture-param. The bulk reservoir is at a
supercritical state with $k_(upright(B)) T \/ epsilon.alt = 1.50$, with
$beta mu_(upright(A)) = beta mu_(upright(B)) = - 2.0$. The two walls
interact with strength
$epsilon.alt_(upright(w) \, upright(A)) = epsilon.alt_(upright(w) \, upright(B)) = 2.0 thin k_(upright(B)) T$.
Excellent agreement of hyper-DFT to the simulation results can be seen.
The same analysis with the pore selectivity conducted in the main paper
can easily be extended to these other mixtures. In
Fig.~#ref(<fig:other_mixtures>, supplement: none);(b), results are presented for the position of the
aneotrope with
$epsilon.alt_(upright(w) \, upright(B)) = 2.0 thin k_(upright(B)) T$ and
varying $Delta epsilon.alt_(upright(w))$ for systems confined in a slit
of width $L = 8 sigma$. The bulk reservoir is at
$k_(upright(B)) T \/ epsilon.alt = 0.77$ and
$P sigma^3 \/ epsilon.alt = 0.10$, a bulk liquid for all systems. The
interaction between unlike species is varied whilst
$epsilon.alt_(upright(B B))$ is kept at $0.9 epsilon.alt$. Like with the
system studied in the main paper, we find that for the case of symmetric
walls
$x_(upright(B))^(upright(\( a n \))) approx x_(upright(B))^(upright(\( a z \)))$.
Varying the asymmetry of the wall potential leads to shifts in
$x_(upright(B))^(upright(\( a n \)))$.

#figure(image("graphics/SI_other_systems.svg"),
  caption: [
    Varying $epsilon.alt_(upright(B B))$ and
    $epsilon.alt_(upright(A B))$ of binary LJ mixtures. (a) Density
    profiles of different binary LJ systems; the parameters are
    summarized in Table @tab:mixture-param. Excellent agreement to GCMC
    simulations can be seen. (b) The position of the aneotrope
    ($S_(upright("B")) = 1$) calculated for varying
    \=$Delta epsilon.alt_(upright(w))$ and $epsilon.alt_(upright(A B))$
    for systems with $epsilon.alt_(upright(B B)) = 0.9 epsilon.alt$. The
    shaded grey regions indicate the azeotropic composition, obtained
    from the PeTS equation of state \[9,10\]. The dotted line indicates
    the system studied in the main paper i.e.
    $epsilon.alt_(upright(A B)) = 0.806 epsilon.alt$.
  ]
)
<fig:other_mixtures>

#block[
#figure(
  align(center)[#table(
    columns: 3,
    align: (center,center,center,),
    table.header([Mixture], [$epsilon.alt_(upright(B B)) \/ epsilon.alt_(upright(A A))$], [$epsilon.alt_(upright(A B)) \/ sqrt(epsilon.alt_(upright(A A)) epsilon.alt_(upright(B B)))$],),
    table.hline(),
    [1], [0.5], [0.85],
    [2], [0.5], [1.25],
    [3], [0.9], [0.85],
    [4], [0.9], [1.25],
  )]
  , caption: [Parameters of the LJ binary mixtures in
  Fig.~#ref(<fig:other_mixtures>, supplement: none);(a). Mixture 3 is the same as that studied in
  the main paper.]
  , kind: table
  ) <tab:mixture-param>

]
#block[
#block[
\[1\] Archer AJ, Evans R. Relationship between local molecular field
theory and density functional theory for non-uniform liquids. J Chem
Phys 2013;138:014502. #link("https://doi.org/10.1063/1.4771976").

] <ref-archerRelationshipLocalMolecular2013>
#block[
\[2\] Weeks JD, Vollmayr K, Katsov K. Intermolecular forces and the
structure of uniform and nonuniform fluids. Phys Stat Mech Its Appl
1997;244:461--75.
#link("https://doi.org/10.1016/S0378-4371(97)00241-0").

] <ref-weeksIntermolecularForcesStructure1997>
#block[
\[3\] Weeks JD, Katsov K, Vollmayr K. Roles of Repulsive and Attractive
Forces in Determining the Structure of Nonuniform Liquids: Generalized
Mean Field Theory. Phys Rev Lett 1998;81:4400--3.
#link("https://doi.org/10.1103/PhysRevLett.81.4400").

] <ref-weeksRolesRepulsiveAttractive1998>
#block[
\[4\] Sammüller F, Schmidt M, Evans R. Neural Density Functional Theory
of Liquid-Gas Phase Coexistence. Phys Rev X 2025;15:011013.
#link("https://doi.org/10.1103/PhysRevX.15.011013").

] <ref-sammullerNeuralDensityFunctional2025>
#block[
\[5\] Wilding NB. Critical-point and coexistence-curve properties of the
Lennard-Jones fluid: A finite-size scaling study. Phys Rev E
1995;52:602--11. #link("https://doi.org/10.1103/PhysRevE.52.602").

] <ref-wildingCriticalpointCoexistencecurveProperties1995>
#block[
\[6\] Ferrenberg AM, Xu J, Landau DP. Pushing the limits of Monte Carlo
simulations for the three-dimensional Ising model. Phys Rev E
2018;97:043301. #link("https://doi.org/10.1103/PhysRevE.97.043301").

] <ref-ferrenbergPushingLimitsMonte2018>
#block[
\[7\] Stephan S, Liu J, Langenbach K, Chapman WG, Hasse H. Vapor-Liquid
Interface of the Lennard-Jones Truncated and Shifted Fluid: Comparison
of Molecular Simulation, Density Gradient Theory, and Density Functional
Theory. J Phys Chem C 2018;122:24705--15.
#link("https://doi.org/10.1021/acs.jpcc.8b06332").

] <ref-stephanVaporLiquidInterfaceLennardJones2018>
#block[
\[8\] Vrabec J, Kedia GK, Fuchs G, Hasse H. Comprehensive study of the
vapour--liquid coexistence of the truncated and shifted Lennard--Jones
fluid including planar and spherical interface properties. Mol Phys
2006;104:1509--27. #link("https://doi.org/10.1080/00268970600556774").

] <ref-vrabecComprehensiveStudyVapour2006>
#block[
\[9\] Heier M, Stephan S, Liu J, Chapman WG, Hasse H, Langenbach K.
Equation of state for the Lennard-Jones truncated and shifted fluid with
a cut-off radius of 2.5 $sigma$ based on perturbation theory and its
applications to interfacial thermodynamics. Mol Phys 2018;116:2083--94.
#link("https://doi.org/10.1080/00268976.2018.1447153").

] <ref-heierEquationStateLennardJones2018>
#block[
\[10\] Rehner P, Bauer G, Gross J. FeOs: An Open-Source Framework for
Equations of State and Classical Density Functional Theory. Ind Eng Chem
Res 2023;62:5347--57. #link("https://doi.org/10.1021/acs.iecr.2c04561").

] <ref-rehnerFeOsOpenSourceFramework2023>
] <refs>
