// Zhou, Bui, and Cox, arXiv:2601.21591v1. Converted from the authors’ LaTeX under CC BY 4.0.
// https://arxiv.org/abs/2601.21591v1 | https://creativecommons.org/licenses/by/4.0/
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
  title: [The roles of bulk and surface thermodynamics in the selective
adsorption of a confined azeotropic mixture],
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
  abstract: [Fluid mixtures that exhibit an azeotrope cannot be purified
by simple bulk distillation. Consequently, there is strong motivation to
understand the behavior of azeotropic mixtures under confinement. We
address this problem using a machine-learning-enhanced classical density
functional theory applied to a binary Lennard--Jones mixture that
exhibits azeotropic phase behavior. As proof-of-principle of a "train
once, learn many" strategy, our approach combines a neural functional
trained on a single-component repulsive reference system with a
mean-field treatment of attractive interactions, derived within the
framework of hyperdensity functional theory (hyper-DFT). The theory
faithfully describes capillary condensation and results from grand
canonical Monte Carlo simulations. Moreover, by taking advantage of a
known accurate equation of state, the theory we present well-describes
bulk thermodynamics by construction. Exploiting the computational
efficiency of hyper-DFT, we systematically evaluate adsorption
selectivity across a wide range of compositions, pressures,
temperatures, and wall--fluid affinities. In cases where the wall--fluid
interaction is the same for both species, we find that the pore becomes
completely unselective at the bulk azeotropic composition. Strikingly,
this unselective point persists far from liquid--vapor coexistence,
including in the supercritical regime. Analysis of the bulk equation of
state across a wide range of thermodynamic state points shows that the
azeotropic composition coincides with equal partial molar volumes and an
extremum in the isothermal compressibility. A complementary
thermodynamic analysis demonstrates that unselective adsorption
corresponds to an aneotrope (a point of zero relative adsorption) and an
extremum in the interfacial free energy. We also find that the two
interfaces of the slit pore behave independently down to remarkably
small slits.

],
  pagenumbering: "1",
  cols: 1,
  doc,
)


#set heading(numbering: "1.1")
#set math.equation(numbering: "(1)")

= Introduction
<introduction>
A detailed understanding of the thermophysical properties of fluid
mixtures under confinement is crucial for a wide range of applications,
including industrial separation processes, gas storage, and healthcare
\[1--3\]. Specific examples span oil recovery \[4\], hydrogen storage
\[5,6\], and microfluidic systems \[7,8\]. From a theoretical
standpoint, molecular simulations are widely regarded as the method of
choice \[9--14\], offering microscopic insight that is often
inaccessible to experiment alone \[15,16\]. However, traditional
approaches rooted in liquid state theory are experiencing a renaissance
\[17,18\]. In particular, classical density functional theory (cDFT) is
attracting renewed interest in physical chemistry, driven by the ability
of machine learning (ML) to deliver highly accurate and computationally
efficient approximations \[19--27\].

In this article, our aim is to demonstrate a recently proposed ML-based
approach to cDFT for a simple Lennard--Jones (LJ) fluid mixture. While
similar ideas have been explored recently in Ref.~, our approach differs
in two key respects. First, methodologically, we train the ML model on a
repulsive #emph[single-component] reference system and incorporate
attractive interactions through a simple mean-field treatment---an
approach that enhances transferability among systems. Second, from an
application standpoint, we focus on a binary mixture with asymmetric
interactions, which exhibits azeotropic phase behavior. As we will see,
the existence of an azeotrope appears to strongly influence the fluid's
behavior---both in bulk and under confinement---across a broad range of
thermodynamic conditions.

The potential appeal of cDFT over molecular simulations becomes
immediately evident when considering its fundamental formalism
\[28,29\]. The central object in cDFT is the grand potential functional
$ 𝛺_V #scale(x: 120%, y: 120%)[\(] \[ { 𝜚_alpha } \] \, T #scale(x: 120%, y: 120%)[\)] = cal(F)_(upright("intr"))^(\( upright(i d) \)) #scale(x: 120%, y: 120%)[\(] \[ { 𝜚_alpha } \] \, T #scale(x: 120%, y: 120%)[\)] + cal(F)_(upright("intr"))^(\( upright(e x) \)) #scale(x: 120%, y: 120%)[\(] \[ { 𝜚_alpha } \] \, T #scale(x: 120%, y: 120%)[\)]\
+ sum_alpha integral #h(-1em) upright("d") bold(italic(r)) thin 𝜚_alpha \( bold(italic(r)) \) #scale(x: 120%, y: 120%)[\[] V_alpha \( bold(italic(r)) \) - mu_alpha #scale(x: 120%, y: 120%)[\]] \, $<eqn:varOmega>
where $cal(F)_(upright("intr"))^(\( upright(i d) \))$ and
$cal(F)_(upright("intr"))^(\( upright(e x) \))$ are, respectively, the
ideal and excess intrinsic Helmholtz free energy functionals. A particle
of species $alpha$, with chemical potential $mu_alpha$, experiences an
external one-body potential $V_alpha$, while $𝜚_alpha$ denotes its
average one-body density, though not necessarily at equilibrium.
Functional minimization of $𝛺_V$ with respect to $𝜚_alpha$ yields the
equilibrium one-body density of species $alpha$, $rho_alpha$, which
satisfies the Euler--Lagrange equation,
$ Lambda_alpha^3 rho_alpha \( bold(italic(r)) \) = exp (- beta #scale(x: 120%, y: 120%)[\[] V_alpha \( bold(italic(r)) \) - mu_alpha #scale(x: 120%, y: 120%)[\]] + c_alpha^(\( 1 \)) \( bold(italic(r)) \; \[ { rho_alpha } \] \, T \)) $<eqn:EL>
with $Lambda_alpha$ denoting the thermal de Broglie wavelength of
species $alpha$, $beta = 1 \/ k_(upright(B)) T$ ($k_(upright(B))$ is the
Boltzmann constant), and
$ c_alpha^(\( 1 \)) \( bold(italic(r)) \; \[ { 𝜚_alpha } \] \, T \) = - frac(delta beta cal(F)_(upright(i n t r))^(\( upright(e x) \)) \( \[ { 𝜚_alpha } \] \, T \), delta 𝜚_alpha \( bold(italic(r)) \)) \, $<eqn:c1-derivative>
is the one-body direct correlation functional. In the context of the
Euler--Lagrange equation, $c_alpha^(\( 1 \))$ acts as a self-consistent
one-body potential that accounts for the effects of correlations on the
structure of the fluid. With the equilibrium densities from Eq.~@eqn:EL,
the grand potential of the system readily follows:
$Omega = 𝛺_V \( \[ { rho_alpha } \] \, T \)$. The procedure for
obtaining the structure and thermodynamics of the system can, therefore,
be succinctly put: minimize a functional to obtain the equilibrium
structure, then evaluate the functional at equilibrium to obtain the
thermodynamic potential of the system. This is a far simpler operation
than explicitly sampling the many-body equilibrium distribution function
with molecular simulations.

What, then, has prevented cDFT from becoming the method of choice for
understanding the equilibrium properties of fluids? The answer is
straightforward. While a rigorous theoretical framework, in practice
cDFT relies upon approximations to
$cal(F_(upright(i n t r))^(\( upright(e x) \)))$. (Only for hard rods in
a single dimension is $cal(F_(upright(i n t r))^(\( upright(e x) \)))$
known exactly \[30\].) In the case of hard spheres, very good
approximations founded on Rosenfeld's fundamental measure theory (FMT)
have been available for several decades \[31--34\]. When combined with
an #emph[ad hoc] mean-field treatment of attractive interactions, cDFT
has been shown to be a powerful practical method for understanding the
physics of simple liquids. In particular, the physics of capillarity
\[35,36\], surface drying and wetting \[37,38\], and solvophobicity
\[39\] have been extensively studied in single-component systems, owing
to the ability of the mean-field approximation to qualitatively capture
liquid--gas phase coexistence. While less intensely studied compared to
single-component fluids, such a mean-field approach has also provided
qualitative insight into the behavior of simple mixtures \[40--47\],
though the richer phase behavior of multicomponent fluids---including
liquid--liquid coexistence, azeotropy and heteroazeotropy
\[48\]---pushes the limits of analytical approximations for
$cal(F)_(upright(i n t r))^(\( upright(e x) \))$.

Going beyond hard spheres and a mean-field treatment for attractive
interactions has, however, proven a major challenge. Naturally, several
groups have recently turned to ML. For example, early works by Oettel
and co-workers focused on one-dimensional systems \[27,49\] and
anisotropic patchy particles \[50\], while Cats #emph[et al.] used ML to
improve the standard mean-field approximation for the three-dimensional
LJ fluid \[25\]. One ML scheme that is gaining significant traction is
"neural functional theory" \[19\] introduced by Sammüller #emph[et al.]
The basis of this physics-informed approach is the Euler--Lagrange
equation (Eq.~@eqn:EL). For known ${ V_alpha }$ and ${ mu_alpha }$, with
${ rho_alpha }$ obtained from grand canonical Monte Carlo (GCMC)
simulation, ${ c_alpha^(\( 1 \)) }$ at equilibrium are determined by
rearranging Eq.~@eqn:EL:
$ c_alpha^(\( 1 \)) \( bold(italic(r)) \; \[ { rho_alpha } \] \, T \) = ln Lambda_alpha^3 rho_alpha \( bold(italic(r)) \) + beta #scale(x: 120%, y: 120%)[\(] V_alpha \( bold(italic(r)) \) - mu_alpha #scale(x: 120%, y: 120%)[\)] . $<eqn:central-ML>
By obtaining ${ c_alpha^(\( 1 \)) }$ from many different GCMC
simulations with different ${ V_alpha }$ and ${ mu_alpha }$, a training
set is established to learn the local functional dependence of
$c_alpha^(\( 1 \))$ on ${ 𝜚_alpha }$ with a neural network.

Originally developed for the single-component hard-sphere fluid---where
it even outperformed FMT-based functionals \[19\]---the neural cDFT
approach has since been extended to more complex systems. For example,
Sammüller #emph[et al.] applied neural cDFT to the LJ fluid,
demonstrating accurate predictions of liquid--vapor coexistence \[22\].
Building on this, Robitscko #emph[et al.] showed that liquid--liquid
coexistence in a simple binary LJ mixture is also well captured \[21\].
By incorporating orientational correlations, Yang #emph[et al.] have
successfully applied neural cDFT to molecular \[26\].

While neural cDFT exploits the local nature of correlations, Bui and Cox
addressed systems with long-ranged electrostatic interactions \[20\],
combining neural cDFT with a systematically improvable mean-field
approach inspired by local molecular field theory (LMFT) \[51\].
Initially developed for primitive electrolyte models \[20\], this
LMFT-style framework was later generalized to systems with nontrivial
coupling between charge and number density, such as polar fluids
\[23,52\]. At the foundation of this generalization lies hyperdensity
functional theory \[53\] (hyper-DFT), also introduced by Sammüller
#emph[et al.] in the context of soft matter, which establishes that any
equilibrium observable can be expressed as a functional of the one-body
density. Leveraging hyper-DFT, Bui and Cox established a rigorous
framework for electromechanics in fluids \[52\] and demonstrated that
electric field gradients can alter liquid--vapor coexistence in polar
fluids, including water \[23\]. This work uncovered a previously unknown
effect---dielectrocapillarity---in which field gradients control
adsorption into porous media.

Clearly, the neural functional approach offers a route to fully harness
the advantages of cDFT over molecular simulations. While the LMFT-style
hyper-DFT arguably remains essential for systems dominated by long-range
interactions, many systems can now be tackled simply by learning
${ c_alpha^(\( 1 \)) }$, without invoking any of the standard
approximations of liquid-state theory. In this light, can traditional
strategies---such as decomposing the system into a repulsive reference
plus mean-field attraction, as in FMT-based approaches---still play a
meaningful role?

We argue that the answer is "yes." Our reasons are twofold. First, when
the bulk equation of state (EoS) is well established by other means, the
hyper-DFT mean-field framework described in Ref.~ offers a
straightforward way to leverage the rich information that it encodes. By
adopting this strategy, we can focus efforts where they are most needed:
neural cDFT can be targeted to the study of inhomogeneous systems where
its advantages are most pronounced, leaving the bulk physics to the
already-known EoS. Second, while cDFT itself is more efficient than
molecular simulations, neural cDFT comes with an initial computational
overhead in obtaining the training data. Decomposing the system into a
repulsive reference---treated with neural cDFT---and mean-field
attractive interactions, opens the door to a "train once, learn many"
strategy, where a single, accurate repulsive reference can be reused
across multiple systems. Such an approach becomes particularly
advantageous in the case of mixtures; in this article, we demonstrate a
proof-of-principle for a binary LJ mixture with asymmetric interactions
that exhibits azeotropy.

The rest of the article is organized as follows. In Sec. II, we
introduce the LJ mixture and outline the underpinning hyper-DFT
framework. In Sec. III, we validate the approach against GCMC
simulations and examine adsorption and selectivity in a slit-pore that
interacts with both species in the same manner. We analyze the bulk
thermodynamic behavior of the mixture, with particular emphasis on the
role of the azeotropic composition across a wide range of pressures and
temperatures, in Sec. IV. In Sec. V, we develop a thermodynamic
description of pore selectivity that sheds light on the underlying
driving forces for selective adsorption. Finally, Sec. VI summarizes our
main findings and discusses their broader implications and possible
extensions.

= Mean-field neural hyper-DFT successfully describes an asymmetric binary LJ mixture
<mean-field-neural-hyper-dft-successfully-describes-an-asymmetric-binary-lj-mixture>
#figure([#box(image("graphics/fig_1.svg"))


  ],
  caption: [
    Effects of confinement on a binary LJ mixture. (a) The
    pressure-composition phase diagram of the mixture at
    $k_(upright(B)) T \/ epsilon.alt = 0.77$. An azeotrope forms at
    $x_(upright(B))^(upright(\( a z \))) approx 0.67$, as indicated by
    the vertical dashed line. The circle indicates the state point of
    the density profiles in (b), where the mixture is confined in a
    slit, for two different wall--fluid interaction strengths (as
    indicated by the labels). Good agreement between the theory and the
    simulation data is observed. (c) Pore selectivities vs
    $x_(upright(B))$ for different wall--fluid interactions, both for
    component A (orange to purple) and B (green to blue) at the
    azeotropic pressure, marked by the horizontal dashed line in (a).
    Lines serve as a guide to the eye. A reversal in selectivity is
    observed at $x_(upright(B))^(upright("(az)"))$, as indicated by the
    vertical dashed line.
  ]
)
<fig:1>

The intermolecular interactions that govern fluid mixtures can, in
general, be complicated, potentially comprising strongly directional
interactions in the form of hydrogen bonds \[54\], long-ranged
electrostatic effects \[55,56\], and even metallicity \[57\].
Nonetheless, many of the most salient aspects of fluid mixtures are
captured by relatively simple forms for the intermolecular interactions.
For instance, complex liquid--vapor and liquid--liquid phase equilibria
are reproduced with LJ mixtures \[58,59\], alkane phase separation with
generalized Mie potentials \[60\], binary alloys with Stillinger--Weber
\[61,62\] and Tersoff \[63,64\] potentials, and polymer demixing with
Gaussian core models \[65\].

Here, the system we investigate is a binary mixture of species A and B,
whose pairwise interactions are prescribed by the truncated and shifted
LJ pair potential,
$ u_(alpha eta) \( r \) = cases(delim: "{", 4 epsilon.alt_(alpha eta) \[ \( sigma \/ r \)^12 - \( sigma \/ r \)^6 \] \, & r < r_(upright(c)) \,, 0 \, & r gt.eq r_(upright(c)) \,) $
where $alpha$ and $eta$ are species labels,
$r_(upright(c)) = 2.5 sigma$, and the molecular diameter, $sigma$, is
the same for all particles. In contrast, the strength of interaction
between particles is species-dependent. Specifically,
$epsilon.alt_(upright(A A)) = epsilon.alt$,
$epsilon.alt_(upright(B B)) = 0.9 epsilon.alt$, and
$epsilon.alt_(upright(A B)) = 0.806 epsilon.alt$. In
Fig.~#ref(<fig:1>, supplement: none);(a) we present the predicted bulk phase diagram
from the PeTS EoS \[66,67\] at a temperature
$k_(upright(B)) T \/ epsilon.alt = 0.77$, in the $P$--$x_(upright(B))$
plane, where $P$ is pressure and $x_(upright(B))$ is the mole fraction
of B. Previous studies \[58,59,68\] have shown that, at this
temperature, this system exhibits a positive azeotrope---the point on
the phase diagram at which liquid and vapor have the same
composition---at mole fraction
$x_(upright(B))^(upright(\( a z \))) approx 0.67$ and pressure
$P^(upright(\( a z \))) sigma^3 \/ epsilon.alt = 0.0248$.

To describe the structure and thermodynamics of this system in a density
functional framework, we will adopt a hyper-DFT approach \[53\] rather
than the traditional cDFT prescribed by
Eqs.~#ref(<eqn:varOmega>);–@eqn:c1-derivative. In brief, the basis of hyper-DFT
is an extended ensemble approach, which in this context amounts to
modifying the external potential operators,
$ hat(cal(V))_alpha \( bold(italic(r))^(N_alpha) \) = sum_i^(N_alpha) V_alpha \( bold(italic(r))_i \) + sum_i^(N_alpha) phi.alt_alpha \( bold(italic(r))_i \) \, $
where the summations are understood to be restricted to species $alpha$.
The effects of the additional external potentials ${ phi.alt_alpha }$
are incorporated as an additional functional dependence on the excess
intrinsic Helmholtz free energy functional,
$ cal(F)_(upright(i n t r))^(upright(\( e x \))) \( \[ { 𝜚_alpha } \] \, T \) arrow.r cal(F)_(upright(i n t r))^(upright(\( e x \))) \( \[ { 𝜚_alpha } \, { beta phi_alpha } \] \, T \) \, $
and the set of one-body density functionals is introduced, e.g.,
$ rho_alpha^(\( 1 \)) \( bold(italic(r)) \; \[ { 𝜚_alpha } \, { beta phi_alpha } \] \, T \) = frac(delta beta cal(F)_(upright(i n t r))^(upright(\( e x \))), delta beta phi_alpha \( bold(italic(r)) \)) . $
At equilibrium, these one-body density functionals satisfy
$rho_alpha \( bold(italic(r)) \) = rho_alpha^(\( 1 \)) \( bold(italic(r)) \; \[ { rho_alpha } \, 0 \] \, T \)$.
We refer the reader to Ref.~ for a more detailed discussion of the
foundations of hyper-DFT.

For our current purpose, we have introduced hyper-DFT in order to
systematically derive a mean-field treatment for attractive
interactions, in the same spirit as LMFT developed by Weeks and
co-workers \[69--71\]. To this end, we introduce a short-ranged
reference system, with pairwise interactions
$u_(0 \, alpha eta) \( r \)$. For this reference system, we seek the set
of one-body potentials ${ phi.alt_(upright(R) \, alpha) }$ such that the
resulting equilibrium one-body densities satisfy
$rho_(upright(R) \, alpha) \( bold(italic(r)) \) = rho_alpha \( bold(italic(r)) \)$
for all $alpha$, where the subscript 'R' indicates properties pertaining
to the reference system.

As shown in Appendix A of Ref.~, but generalized here for mixtures, a
pragmatic way to obtain ${ phi.alt_(upright(R) \, alpha) }$ is to assert
a mean-field approximation,
$  & cal(F)_(upright(i n t r))^(upright(\( e x \))) \( \[ dot.op \] \, T \) = cal(F)_(upright(i n t r \, R))^(upright(\( e x \))) \( \[ dot.op \] \, T \) + sum_alpha Delta mu_alpha #h(-1em) integral #h(-1em) #h(-1em) upright(d) bold(italic(r)) thin 𝜚_alpha \( bold(italic(r)) \)\
 & + 1 / 2 sum_(alpha eta) integral #h(-1em) #h(-1em) upright(d) bold(italic(r)) #h(-1em) integral #h(-1em) #h(-1em) upright(d) bold(italic(r))' thin delta_(upright(u)) rho_(upright(R) \, alpha)^(\( 1 \)) \( bold(italic(r)) \; \[ dot.op \] \, T \) u_(1 \, alpha eta) \( \| bold(italic(r)) - bold(italic(r))' \| \) delta_(upright(u)) rho_(upright(R) \, eta)^(\( 1 \)) \( bold(italic(r))' \; \[ dot.op \] \, T \) \, $<eqn:mean-field>
where $Delta mu_alpha = mu_alpha - mu_(upright(R \,) alpha)$ is the
difference in chemical potentials between the LJ and reference systems,
$u_(1 \, alpha eta) = u_(alpha eta) - u_(0 \, alpha eta)$, and
$delta_(upright(u)) rho_(upright(R) \, alpha)^(\( 1 \)) = rho_(upright(R) \, alpha)^(\( 1 \)) - macron(rho)_(upright(R) \, alpha)$,
with $macron(rho)_(upright(R) \, alpha)$ denoting the uniform bulk
density for species $alpha$ of the reference system. ($\[ dot.op \]$ has
been used as a shorthand notation for
$\[ { 𝜚_alpha } \, { beta phi_alpha } \]$.)

By setting ${ phi.alt_alpha = 0 }$, following Ref.~, one can show that
$ c_alpha^(\( 1 \)) \( bold(italic(r)) \; \[ & { rho_alpha } \, 0 \] \, T \) =\
 & c_(upright(R) \, alpha)^(\( 1 \)) \( bold(italic(r)) \; \[ { rho_alpha } \, 0 \] \, T \) - beta phi.alt_(upright(R) \, alpha) \( bold(italic(r)) \) - beta Delta mu_alpha \, $<eqn:c1>
where
$ phi.alt_(upright(R) \, alpha) \( bold(italic(r)) \) = sum_eta integral #h(-1em) upright(d) bold(italic(r))' thin u_(1 \, alpha eta) \( \| bold(italic(r)) - bold(italic(r))' \| \) delta_(upright(u)) rho_(upright(R) \, eta)^(\( 1 \)) \( bold(italic(r))' \; \[ { rho_alpha } \, 0 \] \, T \) . $<eqn:phiR>
The hyper-DFT formulation of LMFT that we present is largely similar to
that of Archer and Evans \[72\], who showed the formal similarity of
LMFT and traditional cDFT. A key difference, however, is that in writing
Eq.~@eqn:mean-field, we have separated the bulk and inhomogenoeus
contributions to the mean-field free energy functional. This separation
affords a level of flexibility that can be put to practical advantage;
an accurate description of the bulk fluid can be obtained if
${ Delta mu_alpha }$ is known by any means. For example, in the case of
primitive models of electrolytes and dielectric fluids, analytic
expressions for ${ Delta mu_alpha }$ have been derived based on
Stillinger--Lovett sum rules \[20,52\]. Here, we will take advantage of
the fact that ${ Delta mu_alpha }$ can be obtained from a known EoS.

Success of this LMFT-style hyper-DFT approach rests upon a suitable
choice of reference system. For the binary LJ mixture that we study
here, in which A and B have the same molecular diameter, we choose the
reference system to be the purely repulsive #emph[single-component]
fluid described by the Weeks--Chandler--Anderson (WCA) potential \[73\],
i.e, $u_(0 \, alpha eta) = u_0$, with
$ u_0 \( r \) = cases(delim: "{", 4 epsilon.alt \[ \( sigma \/ r \)^12 - \( sigma \/ r \)^6 \] + epsilon.alt \, & r < 2^(1 \/ 6) sigma, 0 \, & r gt.eq 2^(1 \/ 6) sigma .) $
Combining Eqs.~@eqn:EL and~@eqn:c1, the Euler--Lagrange equation for
species $alpha$ of the LJ mixture reads,
$  & Lambda_alpha^3 rho_alpha \( bold(italic(r)) \) =\
 & exp #scale(x: 120%, y: 120%)[\(] - beta #scale(x: 120%, y: 120%)[\[] V_alpha \( bold(italic(r)) \) + phi.alt_(upright(R) \, alpha) \( bold(italic(r)) \) - mu_(upright(R) \, alpha) #scale(x: 120%, y: 120%)[\]] + c_(upright(R))^(\( 1 \)) \( bold(italic(r)) \; \[ rho_(upright(A)) + rho_(upright(B)) \] \, T \) #scale(x: 120%, y: 120%)[\)] \, $<eqn:EL2>
with
$ mu_(upright(R \,) alpha) \( macron(rho)_(upright(A)) \, macron(rho)_(upright(B)) \) = k_(upright(B)) T ln Lambda_alpha^3 macron(rho)_alpha - k_(upright(B)) T c_(upright(R))^(\( 1 \)) \( \[ macron(rho)_(upright(A)) + macron(rho)_(upright(B)) \] \, T \) . $

Following Ref.~, and detailed further in #emph[Methods], we trained a
neural functional to represent $c_(upright(R))^(\( 1 \))$ of the WCA
fluid, using data from 900 GCMC simulations at temperatures
$k_(upright(B)) T \/ epsilon.alt = 1.0 \, med 1.5 med upright(a n d) med 2.0$.
To evaluate the grand potential of the binary LJ mixture, we use
Eqs.~@eqn:varOmega and~@eqn:mean-field, with
$cal(F)_(upright(i n t r \, R))^(upright(\( e x \)))$ obtained by
functional line integration \[19\], and
$mu_alpha \( macron(rho)_(upright(A)) \, macron(rho)_(upright(B)) \)$
directly from the PeTS EoS \[66\]. In practice, the neural functional is
limited to a planar geometry, i.e.,
$c_(upright(R))^(\( 1 \)) \( bold(italic(r)) \, \[ { 𝜚_alpha } \, T \] \) arrow.r c_(upright(R))^(\( 1 \)) \( z \, \[ { 𝜚_alpha } \, T \] \)$\;
we direct the reader toward Ref.~ for recent developments that extend
the neural functional approach to resolution in higher dimensions.

In Fig.~#ref(<fig:1>, supplement: none);(b) we show results from this LMFT-style hyper-DFT
for the binary LJ mixture in a slit-pore at equilibrium with a reservoir
at $k_(upright(B)) T \/ epsilon.alt = 0.77$,
$P sigma^3 \/ epsilon.alt = 0.020$, and $x_(upright(B)) = 0.78$, which
corresponds to the vapor state. In these calculations, the left and
right walls of the slit-pore each act as an external potential confining
the particles to a region $- L \/ 2 < z < L \/ 2$
$ V_alpha^(upright(\( s i n g l e \))) \( z \) = 4 epsilon.alt_(upright(w) \, alpha) [(sigma \/ \( z - z_(upright(w)) \))^12 - (sigma \/ \( z - z_(upright(w)) \))^6] \, $
where $z_(upright(w)) = plus.minus L \/ 2$. Similar to the interatomic
potential, each $V_alpha^(upright(\( s i n g l e \)))$ is truncated and
shifted at a cutoff $z_(upright(c)) = 2.5 sigma$. In
Fig.~#ref(<fig:1>, supplement: none);(b), we have considered the symmetric case,
$epsilon.alt_(upright(w) \, upright(A)) = epsilon.alt_(upright(w) \, upright(B)) = 2.0 thin k_(upright(B)) T$.
For a mildly attractive interaction between the confining walls and the
particles, equilibrium densities predicted from our LMFT-style neural
hyper-DFT calculations are in excellent agreement with GCMC simulations,
and overall consistent with a vapor-like state in the pore. Upon
increasing the interaction strength to $2.5 thin k_(upright(B)) T$,
hyper-DFT captures the transition to a liquid-like state predicted by
GCMC simulations. While some minor discrepancies in the density profiles
are observed for these more attractive walls, agreement between theory
and simulation remains very good.

Overall, the combination of the accurate PeTS EoS for bulk, and the
neural functional for the inhomogeneous correlations means that our
hyper-DFT approach outperforms the standard mean-field cDFT treatment
across a broad range of thermodynamic conditions (see Figs.~S1--S3).
Moreover, we also demonstrate the robustness of our approach on other LJ
binary mixtures with different attractive interactions, illustrating the
potential power of the "train once, learn many" strategy (see Fig.~S4).

#figure([#box(image("graphics/fig_2.svg"))

  ],
  caption: [
    The relevance of the azeotropic composition across a broad range of
    thermodynamic conditions. (a) $S_(upright(B))$ vs $x_(upright(B))$
    with varying wall--fluid interaction strengths at different state
    points, as indicated by the labels. The top and bottom panels
    correspond to liquid and vapor, respectively, in the reservoir. In
    all cases, a crossover in selectivity occurs at
    $x_(upright(B)) approx x_(upright(B))^(upright(\( a z \)))$. (b)
    $P$--$T$ phase diagram, with the thermodynamic state points used in
    (a) marked by the circles. The critical azeotropic endpoint is
    $k_(upright(B)) T_(upright("CAEP")) \/ epsilon.alt approx 0.94$
    \[74\] (star) and the upper critical point is
    $k_(upright(B)) T_(upright("C")) \/ epsilon.alt approx 1.09$ (white
    square). The inset shows the region around
    $k_(upright(B)) T_(upright("CAEP")) \/ epsilon.alt$ with the lower
    critical point.
  ]
)
<fig:2>

= Efficient evaluation of pore selectivity unveils a significance of the azeotropic composition under confinement
<efficient-evaluation-of-pore-selectivity-unveils-a-significance-of-the-azeotropic-composition-under-confinement>
Having established the accuracy of our hyper-DFT approach, we now
capitalize on its advantages as a density functional framework.
Specifically, we investigate how confinement influences the overall
composition of the fluid across a broad range of wall--fluid interaction
strengths and thermodynamic conditions; this is especially important for
systems that exhibit azeotropy, such as the binary LJ mixture under
investigation here. While thermodynamic modeling of bulk mixtures is
well-established \[75\], major gaps remain in our understanding of
azeotropy under confinement ("adsorption azeotropy"
\[76--79\])---addressing this issue is of broad relevance to chemical
separation and industrial processes \[80,81\].

To assess the influence of confinement on the composition of the fluid,
we use hyper-DFT to compute the pore selectivity of each species
\[11,44,45,82\],
$ S_alpha = frac(N_alpha \/ \( N_(upright(A)) + N_(upright(B)) \), x_alpha) \, $<eqn:selectivity>
where $N_alpha$ is the total number of adsorbed particles of species
$alpha$,
$ N_alpha = cal(A) integral_(- L \/ 2)^(+ L \/ 2) upright(d) z thin rho_alpha \( z \) \, $
and $cal(A)$ is the cross-sectional area of the slit pore. Note that
$x_alpha$ is a property of the bulk reservoir. In the first instance, we
evaluate $S_alpha$ at fixed $T$ and $P$ over a wide range of
$epsilon.alt_(upright(w \, A)) = epsilon.alt_(upright(w \, B))$ and
$x_(upright(B))$, as shown in Fig.~#ref(<fig:1>, supplement: none);(c).

Our calculations of $S_alpha$ reveal that, relative to the bulk
composition, species B is preferentially adsorbed at low
$x_(upright(B))$, whereas species A is preferred at high
$x_(upright(B))$. This observation is consistent with previous studies
that have found selective adsorption for the component with weaker
fluid--fluid interactions when it is the minority component in bulk
\[43,83\]. The most striking observation from
Fig.~#ref(<fig:1>, supplement: none);(c), however, is that the crossover between B-
and A-selectivity, where $S_(upright(A)) = S_(upright(B)) = 1$, occurs
very close to the azeotropic composition, irrespective of the
wall--fluid interaction strength; for reasons that will become clear in
Sec. V, we refer to this composition, $x^(upright(\( a n \)))$, as the
"aneotropic composition" \[84--86\].

The fact that
$x_(upright(B))^(upright(\( a n \))) approx x_(upright(B))^(upright(\( a z \)))$
appears insensitive to the strength of the wall--fluid interaction
motivates us to investigate the extent to which the azeotropic
composition influences pore selectivity under different thermodynamic
conditions. To this end, we repeat our calculations at the same
temperature $k_(upright(B)) T \/ epsilon.alt = 0.77$ but at both higher
and lower pressures, and again at
$k_(upright(B)) T \/ epsilon.alt = 1.50$, with the results shown in
Fig.~#ref(<fig:2>, supplement: none);(a). The state points considered encompass regions both below
and above the azeotropic and critical lines of the mixture on the
$P$--$T$ phase diagram, as marked in Fig.~#ref(<fig:2>, supplement: none);(b). Remarkably, all show
the same crossover at
$x_(upright(B))^(upright(\( a n \))) approx x_(upright(B))^(upright(\( a z \)))$,
despite being far from the azeotropic line.

So far, we have investigated slit pores that interact with species A and
B in an identical fashion. Yet, even in this simple symmetric case, we
observe selective adsorption. Moreover, we observe completely
unselective behavior close to the azeotropic composition of the
#emph[bulk] fluid. Before going on to investigate how pore selectivity
may vary in the case of asymmetric wall--fluid interactions, we
therefore aim to understand the behavior of the bulk fluid in greater
detail.

= Bulk Thermodynamics and the Robust Signature of Azeotropy
<bulk-thermodynamics-and-the-robust-signature-of-azeotropy>
#figure([#box(image("graphics/fig_3.svg"))

  ],
  caption: [
    Bulk thermodynamic properties vs $x_(upright(B))$ for different $P$
    and $T$. From left to right, the temperatures correspond to
    $T lt.double T_(upright("c"))$,
    $T lt.tilde T_(upright("CAEP")) < T_(upright(c))$,
    $T > T_(upright("c"))$, and $T gt.double T_(upright("c"))$. (a) For
    subcritical temperatures, $Delta_(upright("E")) mu$ collapses into
    liquid and vapor branches that cross at
    $x_(upright(B)) approx x_(upright(B))^(upright(\( a z \)))$\; this
    crossing point persists at supercritical temperatures. The insets
    show schematic representations of the $P$--$x_(upright(B))$ phase
    diagram at subcritical temperatures. (b) The isothermal
    compressibility is locally extremum at
    $x_(upright(B)) approx x_(upright(B))^(upright(\( a z \)))$ at all
    temperatures. In both (a) and (b), discontinuities representing
    liquid--vapor phase transitions are shown with dotted lines.
  ]
)
<fig:3>

The results we present in Figs.~#ref(<fig:1>, supplement: none);(c) and~@fig:2
indicate that the azeotropic composition remains relevant to the
mixture's adsorption behavior even at thermodynamic conditions far from
liquid--vapor coexistence. To shed light on these observations, we
recall that the azeotrope is defined as the point of liquid--vapor
coexistence at which composition of the two phases in bulk is the same:
$x_(upright(B))^(upright(\( l \))) = x_(upright(B))^(upright(\( v \))) = x_(upright(B))^(upright(\( a z \)))$,
where the superscripts "\(l)" and "\(v)" indicate quantities that
pertain to the liquid and vapor phases, respectively. Therefore, in
addition to mechanical and thermal equilibrium, we have \[48\]

$ mu_(upright(B))^(upright(\( l \))) #scale(x: 120%, y: 120%)[\(] x_(upright(B))^(upright(\( a z \))) \, P^(upright(\( a z \))) \, T^(upright(\( a z \))) #scale(x: 120%, y: 120%)[\)] = mu_(upright(B))^(upright(\( v \))) #scale(x: 120%, y: 120%)[\(] x_(upright(B))^(upright(\( a z \))) \, P^(upright(\( a z \))) \, T^(upright(\( a z \))) #scale(x: 120%, y: 120%)[\)] \, $<eqn:muB-azeo>
$ mu_(upright(A))^(upright(\( l \))) #scale(x: 120%, y: 120%)[\(] x_(upright(B))^(upright(\( a z \))) \, P^(upright(\( a z \))) \, T^(upright(\( a z \))) #scale(x: 120%, y: 120%)[\)] = mu_(upright(A))^(upright(\( v \))) #scale(x: 120%, y: 120%)[\(] x_(upright(B))^(upright(\( a z \))) \, P^(upright(\( a z \))) \, T^(upright(\( a z \))) #scale(x: 120%, y: 120%)[\)] \, $<eqn:muA-azeo>

where, $T^(upright(\( a z \)))$ and $P^(upright(\( a z \)))$ are the
temperature and pressure along the azeotropic line \[74\] in the
$P$--$T$ plane (see Fig.~#ref(<fig:2>, supplement: none);(b)). Introducing the exchange potential,
$ Delta_(upright(E)) mu \( x_(upright(B)) \, P \, T \) = mu_(upright(B)) \( x_(upright(B)) \, P \, T \) - mu_(upright(A)) \( x_(upright(B)) \, P \, T \) \, $<eqn:DeltaMu>
and subtracting Eq.~@eqn:muA-azeo from Eq.~@eqn:muB-azeo, we find
$ Delta_(upright(E)) mu^(upright(\( l \))) #scale(x: 120%, y: 120%)[\(] x_(upright(B))^(upright(\( a z \))) \, P^(upright(\( a z \))) \, T^(upright(\( a z \))) #scale(x: 120%, y: 120%)[\)] = Delta_(upright(E)) mu^(upright(\( v \))) #scale(x: 120%, y: 120%)[\(] x_(upright(B))^(upright(\( a z \))) \, P^(upright(\( a z \))) \, T^(upright(\( a z \))) #scale(x: 120%, y: 120%)[\)] . $
Thus, under azeotropic conditions, the reversible work required to
exchange a particle of species A for one of species B, as encoded in
$Delta_(upright(E)) mu$, is identical in the liquid and vapor phases.

Inspired by the observation that the azeotropic composition appears
relevant across a broad range of $P$ and $T$, we investigate the
behavior of the exchange potential away from coexistence. To this end,
in Fig.~#ref(<fig:3>, supplement: none);(a) we show how $Delta_(upright(E)) mu$ varies with
$x_(upright(B))$ for different $P$ and $T$. At subcritical temperatures,
we see that $Delta_(upright(E)) mu \( x_(upright(B)) \)$ obtained at
different pressures collapse into two distinct branches, corresponding
to the vapor and liquid states. Strikingly, we observe that these two
branches cross at $x_(upright(B))^(upright(\( a z \)))$. At
supercritical temperatures, while no longer separated into liquid and
vapor branches, the observation that
$Delta_(upright(E)) mu #scale(x: 120%, y: 120%)[\(] x_(upright(B))^(upright(\( a z \))) #scale(x: 120%, y: 120%)[\)]$
is equal for all $P$ persists. This observation implies that,
$ (frac(partial Delta_(upright(E)) mu, partial P))_(x_(upright(B)) = x_(upright(B))^(upright(\( a z \))) \, T) = 0 \, $<eqn:exchange-deriv>
for all $T$ investigated. An alternative, but equivalent, viewpoint is
that at the azeotropic composition, irrespective of $P$ and $T$, the
partial molar volumes,
$tilde(v)_alpha = \( partial mu_alpha \/ partial P \)_(x \, T)$, of A
and B are identical.

For single component fluids, there has been much interest in
characterizing the nature of the supercritical state. In particular,
while the critical point is defined by the indistinguisablility of
liquid and vapor states, several studies suggest regions in the phase
diagram---often separated by so called "Widom lines"---where the
supercritical state behaves more liquid- or vapor-like \[87--92\]. To
our knowledge, the supercritical state of binary fluids remains much
less intensely studied \[93,94\]. In this context, the observation of
identical partial molar volumes at $x_(upright(B))^(upright(\( a z \)))$
at $T gt.double T_(upright(c))$ is intriguing. While an exhaustive study
into this topic remains beyond the scope of this article, in
Fig.~#ref(<fig:3>, supplement: none);(b) we show how the isothermal compressibility,
$ chi_T \( x_(upright(B)) \, P \, T \) = 1 / macron(rho) #scale(x: 240%, y: 240%)[\(] frac(partial macron(rho), partial P) #scale(x: 240%, y: 240%)[\)]_(x_(upright(B)) \, T) \, $
where
$macron(rho) = macron(rho)_(upright(A)) + macron(rho)_(upright(B))$,
varies with $x_(upright(B))$ for different $P$ and $T$. Though not
unique, locating conditions of maximum isothermal compressibility is a
common approach to mapping Widom lines in single-component systems
\[87--92\]. For the binary system we consider, we see that
$chi_T #scale(x: 120%, y: 120%)[\(] x_(upright(B))^(upright(\( a z \))) \, P \, T #scale(x: 120%, y: 120%)[\)]$
is locally extremum. Specifically, at subcritical temperatures, we
observe that vapor and liquid states are characterized by positive and
negative curvatures, respectively. Remarkably, hallmarks of this
observation persist at supercritical temperatures, with
$chi_T #scale(x: 120%, y: 120%)[\(] x_(upright(B))^(upright(\( a z \))) \, P \, T #scale(x: 120%, y: 120%)[\)]$
a local minimum at low pressures, and a local maximum at high pressures.
For now, we leave this as an intriguing observation. Our initial results
for pore selectivity (Figs.~#ref(<fig:1>, supplement: none);(c) and~@fig:2), however,
hint that such supercritical behavior of the bulk fluid influences
behavior under confinement.

#figure([#box(image("graphics/fig_4.svg"))

  ],
  caption: [
    Coincidence of $S_(upright(B)) = 1$, vanishing relative adsorption,
    and extremal interfacial tension. (a) $S_(upright(B))$ vs
    $x_(upright(B))$ at the four different state points from Fig.~2 (and
    indicated in the inset). (b) $Gamma_(upright(A))^(upright(\( B \)))$
    vs $x_(upright(B))$, with results corresponding to low pressures
    (light and dark grey) multiplied by a factor 20 for clarity. (c)
    wall--fluid interfacial tension. The vertical dashed line indicates
    the azeotropic composition. All results corresponds to a slit pore
    with
    $beta epsilon.alt_(upright(w \, A)) = beta epsilon.alt_(upright(w \, B)) = 2.0$
    and $L = 8 sigma$.
  ]
)
<fig:4>

= Thermodynamic Origin and Control of Selective Adsorption in Confined Azeotropic Mixtures
<sec:thermodynamic>
#figure(image("graphics/fig_5.svg", width: 95%),
  caption: [
    Effect of wall affinity,
    $Delta epsilon.alt_(upright(w)) = epsilon.alt_(upright(w \, B)) - epsilon.alt_(upright(w \, A))$,
    on the pore selectivity. In all cases,
    $beta epsilon.alt_(upright(w \, B)) = 2.0$. (a), (b), and (c)
    respectively show how $S_(upright(B))$,
    $Gamma_(upright(A))^(upright(\( B \)))$, and $gamma$ vary with
    $x_(upright(B))$. In all cases, we observe that
    $S_(upright(B)) = 1$, $Gamma_(upright(A))^(upright(\( B \))) = 0$,
    and a minimum in $gamma$ coincide. The vertical dashed and dotted
    lines indicate $x_(upright(B))^(upright(\( a z \)))$ and
    $x_(upright(B))^(upright(\( a n \)))$, respectively. The solid black
    lines in (c) show fits to a fourth-order polynomial, constrained to
    be minimum at the aneotropic composition. Panel (d) shows how
    $x_(upright(B))^(upright(\( a n \)))$ varies with
    $beta Delta epsilon.alt_(upright(w))$ for different $L$ (as
    indicated in the legend). (e)
    $S_(upright(B)) \( x_(upright(B))^(upright(\( a z \))) \)$ vs
    $beta Delta epsilon.alt_(upright(w))$ for different widths of the
    slit pore. When rescaled according to Eq.~@eqn:S-by-DeltaEps all
    data approximately collapse onto the same master curve, as seen in
    (f).
  ]
)
<fig:5>

For the pores that we have considered so far, i.e., those that interact
with species A and B in the same manner, our analysis indicates that the
bulk thermodynamics of the fluid mixture play an important role in
determining selective adsorption under confinement. While the
observations that the partial molar volumes of A and B are equal at the
azeotropic composition, and
$x_(upright(B))^(upright(\( a n \))) approx x_(upright(B))^(upright(\( a z \)))$,
are intriguing, they do not by themselves provide a clear mechanistic
explanation of the observed adsorption behavior. More generally, there
has been significant interest to understand the mechanisms of selective
adsorption under confinement, especially when B assumes the role of a
minority species dissolved in A, e.g., carbon dioxide in water; in such
cases, $S_(upright(B))$ is often dubbed "oversolubility." In this
context, there has been much work discussing the roles of adsorption vs
confinement-induced changes on the solubility (see, e.g., Ref.~ for a
review). Here, we present a simple thermodynamic analysis that sheds
light on the driving forces that underpin $S_(upright(B))$. Anticipating
the results that follow, we find that, in the thermodynamic sense,
$S_(upright(B))$ is driven solely by adsorption.

Following standard treatments of the thermodynamics of confined fluids
\[29,36\], our starting point is the exact differential of the surface
excess grand potential,
$ upright(d) Omega^(upright(\( e x \))) = - 2 s cal(A) thin upright(d) T - cal(A) sum_alpha Gamma_alpha thin upright(d) mu_alpha + 2 gamma thin upright(d) cal(A) - f_(upright(s)) cal(A) thin upright(d) H \, $<eqn:dOmegaEx>
where $s$ is excess entropy per unit area, $f_(upright(s))$ is the
solvation force, $gamma$ is the fluid--wall interfacial tension, and
$ Gamma_alpha = integral_(- H \/ 2)^(H \/ 2) #h(-1em) upright(d) z thin #scale(x: 120%, y: 120%)[\(] rho_alpha \( z \) - macron(rho)_alpha #scale(x: 120%, y: 120%)[\)] = N_alpha \/ cal(A) - macron(rho)_alpha H \, $<eqn:GammaDef>
is the adsorption of species $alpha$. Note that, in this thermodynamic
picture, there is a degree of flexibility in choosing $H$, the
separation between the two walls; to be consistent with $N_alpha$ used
in Eq.~@eqn:selectivity, $H$ should be large enough to encompass all
particles in the slit pore; we discuss below how we choose $H$ in
practice. As $Omega^(upright(\( e x \))) = 2 gamma cal(A)$, from
Eq.~@eqn:dOmegaEx one can straightforwardly obtain the Gibbs adsorption
equation for mixtures,
$ 2 thin upright(d) gamma + 2 s thin upright(d) T + sum_alpha Gamma_alpha thin upright(d) mu_alpha + f_(upright(s)) thin upright(d) H = 0 \, $
from which it immediately follows that
$ Gamma_alpha = - 2 (partial gamma \/ partial mu_alpha)_(mu_(eta eq.not alpha) \, H \, T) . $<eqn:GammaA-gammaDeriv>

From the definitions of $S_alpha$ (Eq.~@eqn:selectivity) and
$Gamma_alpha$ (Eq.~@eqn:GammaDef), we obtain
$ S_(upright(B)) = 1 / x_(upright(B)) frac(Gamma_(upright(B)) + macron(rho)_(upright(B)) H, Gamma_(upright(A)) + Gamma_(upright(B)) + \( macron(rho)_A + macron(rho)_B \) H) \, $<eqn:SB-GammaA>
This exact relation makes explicit that the adsorptions of species A and
B are the key thermodynamic quantities governing the pore selectivity.
Note that $S_(upright(B))$ is independent of definition of $H$. Given
the flexibility afforded by this invariance, we choose $H$ such that
$Gamma_(upright(B)) = 0$ when $S_(upright(B)) = 1$\; this is only
possible if $Gamma_(upright(A))$ also vanishes. That is, the relative
adsorption,
$ Gamma_(upright(A))^(upright(\( B \))) = Gamma_(upright(A)) - \( macron(rho)_(upright(A)) \/ macron(rho)_(upright(B)) \) Gamma_(upright(B)) \, $
is zero at $S_(upright(B)) = 1$. This result is confirmed in Figs.~4a
and~4b, where we show how $S_(upright(B))$ and
$Gamma_(upright(A))^(upright(\( B \)))$, respectively, vary with
$x_(upright(B))$ at various different thermodynamic state points, for a
slit pore with
$beta epsilon.alt_(upright(w \, A)) = beta epsilon.alt_(upright(w \, B)) = 2.0$
and $L = 8 sigma$.

The point at which the relative adsorption is zero defines the
aneotropic composition \[84--86\]. For the liquid--vapor interface of a
similar binary LJ mixture to that studied here, Telo da Gama and Evans
\[85\] also reported that
$x_(upright(B))^(upright(\( a n \))) approx x_(upright(B))^(upright(\( a z \)))$,
for which they provided a qualitative explanation: at low
$x_(upright(B))$, the vapor phase is relatively enriched in species B,
leading to preferential adsorption of B; at
$x_(upright(B)) = x_(upright(B))^(upright(\( a z \)))$, the liquid and
vapor phases have identical compositions and the adsorption vanishes;
for high $x_(upright(B))$ the liquid becomes relatively richer in
species B than the vapor, causing the adsorption to change sign. In
other words, the sign of $Gamma_(upright(A))^(upright(\( B \)))$ is
controlled by whether the bulk vapor or bulk liquid phase is enriched in
species B.

Telo da Gama and Evans also found that the liquid--vapor surface tension
is minimum at the aneotropic point. From Eq.~@eqn:GammaA-gammaDeriv, and
using the Gibbs--Duhem relation, we find
$ (frac(partial gamma, partial x_(upright(B))))_(H \, P \, T) = - 1 / 2 (frac(partial mu_(upright(A)), partial x_(upright(B))))_(P \, T) #scale(x: 240%, y: 240%)[\[] Gamma_(upright(A)) - #scale(x: 240%, y: 240%)[\(] frac(1 - x_(upright(B)), x_(upright(B))) #scale(x: 240%, y: 240%)[\)] Gamma_(upright(B)) #scale(x: 240%, y: 240%)[\]] . $
Evaluating at $x_(upright(B)) = x_(upright(B))^(upright(\( a n \)))$,
where $Gamma_(upright(A)) = Gamma_(upright(B)) = 0$, we have
$ (frac(partial gamma, partial x_(upright(B))))_(H \, P \, T) #scale(x: 240%, y: 240%)[\|]_(x_(upright(B)) = x_(upright(B))^(upright(\( a n \)))) = 0 . $<eqn:extremum-surfacetension>
While this result is consistent with the minimum reported in Ref.~, more
generally, it states that the aneotropic point corresponds to a extremum
in surface tension. This prediction is borne out by results from
hyper-DFT; as seen in Fig.~4c, $gamma \( x^(upright(\( a n \))) \)$
changes from a local minimum to a local maximum as the system traverses
from high to low pressures.

The above arguments readily extend to cases where the relative wall
affinity
$Delta epsilon.alt_(upright(w)) = epsilon.alt_(upright(w \, B)) - epsilon.alt_(upright(w \, A)) eq.not 0$.
Intuitively, we expect that changing varying
$Delta epsilon.alt_(upright(w))$ will change the pore selectivity, and
the aneotropic point. This notion is confirmed in Figs.~5a, 5b, and~5c,
where we respectively show how $S_(upright(B))$,
$Gamma_(upright(A))^(upright(\( B \)))$, and $gamma$ vary with
$x_(upright(B))$, with
$beta Delta epsilon.alt_(upright(w)) = plus.minus 0.2$, for a system at
$k_(upright(B)) T \/ epsilon.alt = 0.77$,
$P sigma^3 \/ epsilon.alt = 0.0248$, and $L = 8 sigma$. As expected, we
see that $S_(upright(B)) = 1$ and the aneotropic composition coincide.
The results also appear consistent with a minimum in interfacial
tension, albeit a shallow one. Due to this shallowness, we have
performed fits to a fourth-order polynomial, constrained to be minimum
at $x_(upright(B))^(upright(\( a n \)))$, as shown by the solid black
lines in Fig.~5c.

In Fig.~5d, we show how $x^(upright(\( a n \)))$ varies with
$beta epsilon.alt_(upright(w))$ for different slit widths. To a very
good approximation, the variation is linear, and insensitive to $L$. We
interrogate this size-independence further by considering how
selectivity varies with $Delta epsilon.alt_(upright(w))$ within the
context of the thermodynamic model presented above. As we have
established that
$x_(upright(B))^(upright(\( a n \))) approx x_(upright(B))^(upright(\( a z \)))$
when $Delta epsilon.alt_(upright(w)) = 0$, it is a straightforward,
though slightly tedious, matter to show that
$ macron(rho) H #scale(x: 120%, y: 120%)[\(] S_(upright(B)) \( x_(upright(B))^(upright(\( a z \))) \; Delta epsilon.alt_(upright(w)) \) - 1 #scale(x: 120%, y: 120%)[\)] = - Delta epsilon.alt_(upright(w)) (frac(partial Gamma_(upright(A))^(\( upright(B) \)) \( x_(upright(B))^(upright(\( a z \))) \; 0 \), partial Delta epsilon.alt_(upright(w))))_(H \, P \, T) . $<eqn:S-by-DeltaEps>
In Fig.~5e we show how
$S_(upright(B)) \( x_(upright(B))^(upright(\( a z \))) \)$ varies with
$Delta epsilon.alt_(upright(w))$, where we see that variation is
nonlinear, which becomes more pronounced for smaller slit pores. In
Fig.~5f, we plot the left hand side of Eq.~@eqn:S-by-DeltaEps vs
$Delta epsilon.alt_(upright(w))$ for different slit widths. Strikingly,
we observe that all data approximately collapse onto the same curve.
This insensitivity to the slit width suggests that, even for systems
barely large enough to accommodate three layers of particles, the two
interfaces of the slit pore essentially behave independently; in this
case, down to the range of the wall--fluid interaction.

= Conclusions and outlook
<conclusions-and-outlook>
In this study, we have extended the recently developed neural density
functional theory to a binary mixture of Lennard--Jones particles that
exhibits azeotropic phase behavior. In contrast to another recent neural
functional theory study on mixtures \[21\], we have used machine
learning to obtain an accurate representation of a #emph[single
component] repulsive reference system, and treated attractive
interactions in a mean-field fashion. The mean-field approach that we
adopt is rooted in hyperdensity functional theory \[52,53\] and is
similar in spirit to local molecular field theory derived by Weeks and
co-workers \[69--71\]. Within this hyper-DFT framework, we have taken
advantage of the fact that, when known from other sources \[66,67\], the
bulk equation of state of the fluid can be integrated seamlessly,
allowing us to focus applying density functional theory itself to
inhomogeneous systems.

We have used this hyper-DFT framework to understand preferential
adsorption of this binary fluid in a slit-pore geometry. In cases where
the walls of the slit pore interact with both species of the fluid in
the same manner, our numerical results indicate that when the reservoir
is at its azeotropic composition, so too is the composition in the pore.
Remarkably, this observation persists across a broad range of
thermodynamic conditions, including far into the supercritical state. By
analysing the bulk equation of state, we find that the azeotropic
composition coincides with equal partial molar fractions of the
constituent species, and a local extremum of the isothermal
compressibility. Intriguing as these observations are, their generality
to other fluids that exhibit azeotropy is an open question that warrants
further investigation. For example, the system we have investigated has
an azeotropic composition that is largely invariant with temperature and
pressure; this does not generally hold, especially when the components
have markedly different sizes \[95\].

To elucidate the mechanisms underlying pore selectivity, we have
presented a thermodynamic description that connects selectivity directly
to interfacial adsorption. This shows that the aneotropic composition,
defined by vanishing relative adsorption, remains closely tied to the
bulk azeotropic composition over a wide range of thermodynamic
conditions, even under confinement. We show clearly that the relative
adsorption of each species in the mixture is the relevant thermodynamic
driving force, with the wall--fluid interfacial tension reaching an
extremum at the aneotropic composition---a result that generalizes
previous work on the liquid--vapor interface by Telo de Gama and Evans
\[85\]. By analysing our numerical results within the context of this
thermodynamic model, we found that the aneotropic composition shifts
linearly with the relative affinity of the confining walls to the two
species. Moreover, we found that the two interfaces of the slit pore act
essentially independently down to remarkably small separations---a
little over three molecular diameters---between the walls.

With machine learning techniques, it is now possible to accurately model
systems of remarkable complexity---both in terms of their interactions
and emergent phase behavior---using classical density functional theory.
Here, we take "classical density functional theory" in a broad sense to
encompass its recent extensions hyper-DFT \[53\] and meta-DFT \[96\].
Here, we have used hyper-DFT as a means to justify a mean-field
treatment of attractive interactions, as well as to incorporate an
established bulk equation of state into the framework. By learning the
one-body direct correlation function once for a single-component system,
which we then used as reference for a binary fluid, we have demonstrated
a "train once, learn many" strategy as a proof-of-principle. For more
complex systems, especially mixtures where particle sizes differ
significantly, it may be prove fruitful to combine this strategy with
meta-DFT, which aims to learn the functional dependence on the
interaction potential directly. Irrespective of the exact strategy that
one adopts, it seems highly likely that classical density functional
theory combined with machine learning will play an increasingly
important role in understanding fluids relevant to physical chemistry.

#heading(level: 1, numbering: none)[Acknowledgements]
<acknowledgements>
S.J.C. is Royal Society University Research Fellow at Durham University
(Grant No. URF\\R1\\ 211144). A.T.B. acknowledges funding from the
Oppenheimer Fund and Peterhouse College, University of Cambridge. This
work made use of the the Hamilton HPC Service of Durham University and
facilities of the N8 Centre of Excellence in Computationally Intensive
Research (N8 CIR) provided and funded by the N8 research partnership and
EPSRC (Grant No. EP/T022161/1). The Centre is coordinated by the
Universities of Durham, Manchester, and York.

#heading(level: 1, numbering: none)[Data Availability]
<data-availability>
Data and code supporting the findings of this study are openly available
at `<link to be inserted upon publication>`.

#heading(level: 1, numbering: none)[Supporting information]
<supporting-information>
Supporting information includes additional results validating the
accuracy of the mean-field neural hyper-DFT approach, comparison to
standard mean-field cDFT, and additional calculations for other binary
LJ mixtures.

#heading(level: 1, numbering: none)[Methods]
<methods>
#strong[Generation of training data.] Following Ref.~, 900 GCMC
simulations using our own code available on Github
(#link("https://github.com/annatbui/dielectrocapillarity-cdft")) or
Zenodo \[97\] were performed for a single-component WCA fluid at
temperatures
$k_(upright(B)) T \/ epsilon.alt = 1.0 \, 1.5 thin upright(a n d) thin 2.0$
with randomized chemical and external potentials. The chemical
potentials were chosen from the range $- 10 lt.eq beta mu lt.eq 3$ and
the external potentials had the form
$ V \( z \) = sum_(n = 1)^4 A_n sin (frac(2 pi n z, ell) + Phi_n) + sum_n V_n^(upright("lin")) \( z \) $
where $A_n$ were randomly chosen Fourier coefficients from a normal
distribution of variance $2.5 \( k_(upright(B)) T \)^2$ and the phases
$Phi_n$ were chosen uniformly between 0 and $2 pi$. The simulation box
was cubic with length $ell = 10 sigma$ and periodic boundary conditions
were applied. The linear function $V_n^(upright("lin")) \( z \)$ takes
the form
$ V_n^(upright("lin")) \( z \) = V_(n \, 1) + frac(\( V_(n \, 2) - V_(n \, 1) \) \( z - z_(n \, 1) \), \( z_(n \, 2) - z_(n \, 1) \)) $
for $z_(n \, 1) < z < z_(n \, 2)$ and 0 otherwise, where $z_(n \, 1)$
and $z_(n \, 2)$ were uniformly chosen such that
$0 < z_(n \, 1) < z_(n \, 2) < ell$, and $V_(n \, 1)$ and $V_(n \, 2)$
were randomly chosen from a normal distribution with variance
$4 \( k_(upright(B)) T \)^2$. Each external potential had four
sinusoidal segments, and between $1$ and $5$ linear segments. Half of
the potentials had planar hard walls, where $V \( z \) = oo$ for
$z lt.eq z_(upright("w")) \/ 2$ and
$z gt.eq ell - z_(upright("w")) \/ 2$\; $z_(upright("w"))$ was randomly
chosen uniformly between $1 sigma$ and $3 sigma$.

Each simulation was run for $10^9$ steps, with equilibration for $10^6$
steps. For each simulation, the planar density profile $rho \( z \)$ was
obtained from a histogram of the positions of the particles, and
$c_(upright(R))^(\( 1 \)) \( z \; \[ rho \] \, T \)$ was obtained from
numerical evaluation of the single component variant of Eq.
@eqn:central-ML. The total computation time for the generation of the
entire training dataset is on the order of $10^4$ CPU hours.

#strong[Training the neural functional.] Our training procedure largely
follows that of previous work \[19--22\]. A neural network was trained
to represent $c_(upright(R))^(\( 1 \)) \( z \; \[ rho \] \, T \)$,
implemented using Keras/Tensorflow with the standard Adam optimizer
\[98\]. The input layers take in the temperature and the density in a
window of size $3 sigma$ around the location of interest, with spatial
discretization $Delta z = 0.005 sigma$. This was followed by two hidden
layers of 32 nodes with softplus activation functions, and then the
single-node output. The simulation dataset was split 3:1:1 for the
training, validation, and test datasets, respectively. Data augmentation
allowed the doubling of the training data through mirroring. The model
was trained for 100 epochs in batches of size 256 with the mean squared
error as the loss function. The initial learning rate was 0.001,
decreasing by 5% per epoch. The training was done on an
`NVIDIA GH200 Grace Hopper Superchip` in under an hour.

#strong[Using the neural functional.] Once the neural functional has
been trained, combining with LMFT using Eq.~@eqn:c1 gives
$c^(\( 1 \)) \( z \; \[ rho \] \, T \)$. Minimization of the
Euler-Lagrange equation to obtain density profiles is done
self-consistently using a mixed Picard scheme, and typically takes
around 2 minutes on a standard CPU (and faster on a GPU). For
measurements of the pore selectivity, we first pick a bulk state point
to obtain $mu_(upright(A))$ and $mu_(upright(B))$ from the PeTS EoS. We
then perform a minimization to obtain the equilibrium density profiles
of both species. To obtain surface tensions, we first use functional
line integration to calculate
$cal(F)_(upright("intr"))^(\( upright(e x) \))$,
$ beta cal(F)_(upright("intr"))^(\( upright(e x) \)) \/ cal(A) = - integral_0^1 #h(-1em) #h(-1em) upright(d) lambda thin sum_alpha integral #h(-1em) #h(-1em) upright(d) z thin rho_alpha \( z \) c_alpha^(\( 1 \)) \( z \; \[ { lambda rho_alpha } \] \, T \) \, $
obtain
$beta cal(F)_(upright("intr"))^(upright("(id)")) \/ cal(A) = sum_alpha integral upright("d") z thin rho_alpha \( z \) (ln \[ Lambda_alpha^3 rho_alpha \( z \) \] - 1)$,
and then calculate $Omega$ from Eq. @eqn:varOmega. The surface tension
is then obtained from $ gamma = frac(Omega + P V, 2 cal(A)) \, $ where
$V = cal(A) H$, and $P$ the bulk pressure. Overall we have performed
approximately 6200 cDFT calculations, from which we directly obtain both
equilibrium density profiles and free energies.

#block[
#block[
\[1\] Sholl DS, Lively RP. Seven chemical separations to change the
world. Nature 2016;532:435--7. #link("https://doi.org/10.1038/532435a").

] <ref-shollSevenChemicalSeparations2016>
#block[
\[2\] Furukawa H, Cordova KE, O'Keeffe M, Yaghi OM. The Chemistry and
Applications of Metal-Organic Frameworks. Science 2013;341:1230444.
#link("https://doi.org/10.1126/science.1230444").

] <ref-furukawaChemistryApplicationsMetalOrganic2013>
#block[
\[3\] Capelo-Avilés S, de Fez-Febré M, Balestra SRG, Cabezas-Giménez J,
Tomazini de Oliveira R, Gallo Stampino II, et al. Selective adsorption
of CO2 in TAMOF-1 for the separation of CO2/CH4 gas mixtures. Nat Commun
2025;16:3243. #link("https://doi.org/10.1038/s41467-025-58426-w").

] <ref-capelo-avilesSelectiveAdsorptionCO22025>
#block[
\[4\] Barsotti E, Tan SP, Saraji S, Piri M, Chen J-H. A review on
capillary condensation in nanoporous media: Implications for hydrocarbon
recovery from tight reservoirs. Fuel 2016;184:344--61.
#link("https://doi.org/10.1016/j.fuel.2016.06.123").

] <ref-barsottiReviewCapillaryCondensation2016>
#block[
\[5\] Clauzier S, Ho LN, Pera-Titus M, Coasne B, Farrusseng D. Enhanced
H2 Uptake in Solvents Confined in Mesoporous Metal--Organic Framework. J
Am Chem Soc 2012;134:17369--71.
#link("https://doi.org/10.1021/ja308157a").

] <ref-clauzierEnhancedH2Uptake2012>
#block[
\[6\] Clauzier S, Ho LN, Pera-Titus M, Farrusseng D, Coasne B. Enhanced
H2 Uptake of n-Alkanes Confined in Mesoporous Materials. J Phys Chem C
2014;118:10720--7. #link("https://doi.org/10.1021/jp411526f").

] <ref-clauzierEnhancedH2Uptake2014>
#block[
\[7\] Yang Q, Sun PZ, Fumagalli L, Stebunov YV, Haigh SJ, Zhou ZW, et
al. Capillary condensation under atomic-scale confinement. Nature
2020;588:250--3. #link("https://doi.org/10.1038/s41586-020-2978-1").

] <ref-yangCapillaryCondensationAtomicscale2020>
#block[
\[8\] Khanjani E, Fergola A, López Martínez JA, Nazarnezhad S, Casals
Terre J, Marasso SL, et al.
#link("https://doi.org/10.3389/frlct.2025.1502127")[Capillary microfluidics for diagnostic applications: Fundamentals, mechanisms, and capillarics].
Front Lab Chip Technol 2025;4.

] <ref-khanjaniCapillaryMicrofluidicsDiagnostic2025>
#block[
\[9\] Wilding NB. Critical-point and coexistence-curve properties of the
Lennard-Jones fluid: A finite-size scaling study. Phys Rev E
1995;52:602--11. #link("https://doi.org/10.1103/PhysRevE.52.602").

] <ref-wildingCriticalpointCoexistencecurveProperties1995>
#block[
\[10\] Ho LN, Schuurman Y, Farrusseng D, Coasne B. Solubility of Gases
in Water Confined in Nanoporous Materials: ZSM-5, MCM-41, and MIL-100. J
Phys Chem C 2015;119:21547--54.
#link("https://doi.org/10.1021/acs.jpcc.5b06660").

] <ref-hoSolubilityGasesWater2015>
#block[
\[11\] Hu Y, Huang, Zhao, Liu, and Gubbins KE. Effect of confinement in
nano-porous materials on the solubility of a supercritical gas. Mol Phys
2016;114:3294--306.
#link("https://doi.org/10.1080/00268976.2016.1229871").

] <ref-huEffectConfinementNanoporous2016>
#block[
\[12\] Fertig D, Hasse H, Stephan S. Molecular dynamics study of
adsorption and wetting of mixtures of simple fluids on planar walls. J
Phys Chem C 2024;128:11340--54.
#link("https://doi.org/10.1021/acs.jpcc.4c01765").

] <ref-Fertig2024>
#block[
\[13\] Wang X, Cheng B. Integrating molecular dynamics simulations and
experimental data for azeotrope predictions in binary mixtures. J Chem
Phys 2024;161:034111. #link("https://doi.org/10.1063/5.0217232").

] <ref-wangIntegratingMolecularDynamics2024>
#block[
\[14\] Shen VK, Errington JR. Determination of fluid-phase behavior
using transition-matrix Monte Carlo: Binary Lennard-Jones mixtures. J
Chem Phys 2005;122:064508. #link("https://doi.org/10.1063/1.1844372").

] <ref-Shen2005>
#block[
\[15\] Kellay H, Bonn D, Meunier J. Prewetting in a binary liquid
mixture. Phys Rev Lett 1993;71:2607--10.
#link("https://doi.org/10.1103/PhysRevLett.71.2607").

] <ref-kellayPrewettingBinaryLiquid1993>
#block[
\[16\] Bonn D, Kellay H, Wegdam GH. Wetting and layering in critical
binary fluid mixtures. J Chem Phys 1993;99:7115--23.
#link("https://doi.org/10.1063/1.465430").

] <ref-bonnWettingLayeringCritical1993>
#block[
\[17\] Bui AT, Cox SJ. A classical density functional theory for
solvation across length scales. J Chem Phys 2024;161:104103.
#link("https://doi.org/10.1063/5.0223750").

] <ref-buiClassicalDensityFunctional2024>
#block[
\[18\] Wu J, Gu M. Perfecting Liquid-State Theories with Machine
Intelligence. J Phys Chem Lett 2023;14:10545--52.
#link("https://doi.org/10.1021/acs.jpclett.3c02804").

] <ref-wuPerfectingLiquidStateTheories2023>
#block[
\[19\] Sammüller F, Hermann S, De Las Heras D, Schmidt M. Neural
functional theory for inhomogeneous fluids: Fundamentals and
applications. Proc Natl Acad Sci 2023;120:e2312484120.
#link("https://doi.org/10.1073/pnas.2312484120").

] <ref-sammullerNeuralFunctionalTheory2023>
#block[
\[20\] Bui AT, Cox SJ. Learning Classical Density Functionals for Ionic
Fluids. Phys Rev Lett 2025;134:148001.
#link("https://doi.org/10.1103/PhysRevLett.134.148001").

] <ref-buiLearningClassicalDensity2025>
#block[
\[21\] Robitschko S, Sammüller F, Schmidt M, Evans R. Learning the bulk
and interfacial physics of liquid--liquid phase separation with neural
density functionals. J Chem Phys 2025;163:161101.
#link("https://doi.org/10.1063/5.0290261").

] <ref-robitschkoLearningBulkInterfacial2025>
#block[
\[22\] Sammüller F, Schmidt M, Evans R. Neural Density Functional Theory
of Liquid-Gas Phase Coexistence. Phys Rev X 2025;15:011013.
#link("https://doi.org/10.1103/PhysRevX.15.011013").

] <ref-sammullerNeuralDensityFunctional2025>
#block[
\[23\] Bui AT, Cox SJ. Dielectrocapillarity for exquisite control of
fluids 2025. #link("https://doi.org/10.48550/arXiv.2503.09855").

] <ref-buiDielectrocapillarityExquisiteControl2025>
#block[
\[24\] Ahmed A, Sadus RJ. Phase diagram of the Weeks-Chandler-Andersen
potential from very low to high temperatures and pressures. Phys Rev E
2009;80:061101. #link("https://doi.org/10.1103/PhysRevE.80.061101").

] <ref-ahmedPhaseDiagramWeeksChandlerAndersen2009>
#block[
\[25\] Cats P, Kuipers S, de Wind S, van Damme R, Coli GM, Dijkstra M,
et al. Machine-learning free-energy functionals using density profiles
from simulations. APL Mater 2021;9:031109.
#link("https://doi.org/10.1063/5.0042558").

] <ref-catsMachinelearningFreeenergyFunctionals2021>
#block[
\[26\] Yang J, Pan R, Sun J, Wu J. High-Dimensional Operator Learning
for Molecular Density Functional Theory. J Chem Theory Comput
2025;21:5905--15. #link("https://doi.org/10.1021/acs.jctc.5c00484").

] <ref-yangHighDimensionalOperatorLearning2024>
#block[
\[27\] Lin S-C, Martius G, Oettel M. Analytical classical density
functionals from an equation learning network. J Chem Phys
2020;152:021102. #link("https://doi.org/10.1063/1.5135919").

] <ref-linAnalyticalClassicalDensity2020>
#block[
\[28\] Evans R. The nature of the liquid-vapour interface and other
topics in the statistical mechanics of non-uniform, classical fluids.
Adv Phys 1979;28:143--200.
#link("https://doi.org/10.1080/00018737900101365").

] <ref-Evans1979>
#block[
\[29\] Hansen J-P, McDonald IR. Theory of Simple Liquids: With
Applications to Soft Matter. 4th edition. Amstersdam: Elsevier/AP; 2013.

] <ref-hansenTheorySimpleLiquids2013>
#block[
\[30\] Percus J. Equilibrium state of a classical fluid of hard rods in
an external field. J Stat Phys 1976;15:505--11.
https:\/\/doi.org/#link("https://doi.org/10.1007/BF01020803").

] <ref-percus1976equilibrium>
#block[
\[31\] Rosenfeld Y. Free-energy model for the inhomogeneous hard-sphere
fluid mixture and density-functional theory of freezing. Phys Rev Lett
1989;63:980--3. #link("https://doi.org/10.1103/PhysRevLett.63.980").

] <ref-rosenfeldFreeenergyModelInhomogeneous1989>
#block[
\[32\] Roth R. Fundamental measure theory for hard-sphere mixtures: A
review. J Phys Condens Matter 2010;22:063102.
#link("https://doi.org/10.1088/0953-8984/22/6/063102").

] <ref-rothFundamentalMeasureTheory2010>
#block[
\[33\] Roth R, Evans R, Lang A, Kahl G. Fundamental measure theory for
hard-sphere mixtures revisited: The White Bear version. J Phys Condens
Matter 2002;14:12063--78.
#link("https://doi.org/10.1088/0953-8984/14/46/313").

] <ref-rothFundamentalMeasureTheory2002>
#block[
\[34\] Hansen-Goos H, Roth R. Density functional theory for hard-sphere
mixtures: The White Bear version mark II. J Phys Condens Matter
2006;18:8413. #link("https://doi.org/10.1088/0953-8984/18/37/002").

] <ref-hansen-goosDensityFunctionalTheory2006>
#block[
\[35\] Evans R, Marconi UMB, Tarazona P. Fluids in narrow pores:
Adsorption, capillary condensation, and critical points. J Chem Phys
1986;84:2376--99. #link("https://doi.org/10.1063/1.450352").

] <ref-evansFluidsNarrowPores1986a>
#block[
\[36\] Evans R, Marini Bettolo Marconi U. Phase equilibria and solvation
forces for fluids confined between parallel walls. J Chem Phys
1987;86:7138--48. #link("https://doi.org/10.1063/1.452363").

] <ref-evansPhaseEquilibriaSolvation1987>
#block[
\[37\] Evans R, Stewart MC, Wilding NB. Critical Drying of Liquids. Phys
Rev Lett 2016;117:176102.
#link("https://doi.org/10.1103/PhysRevLett.117.176102").

] <ref-evansCriticalDryingLiquids2016>
#block[
\[38\] Evans R, Stewart MC, Wilding NB. A unified description of
hydrophilic and superhydrophobic surfaces in terms of the wetting and
drying transitions of liquids. Proc Natl Acad Sci 2019;116:23901--8.
#link("https://doi.org/10.1073/pnas.1913587116").

] <ref-evansUnifiedDescriptionHydrophilic2019>
#block[
\[39\] Coe MK, Evans R, Wilding NB. Density depletion and enhanced
fluctuations in water near hydrophobic solutes: Identifying the
underlying physics. Phys Rev Lett 2022;128:045501.
#link("https://doi.org/10.1103/PhysRevLett.128.045501").

] <ref-Coe2022>
#block[
\[40\] Tan Z, Gubbins KE. Selective adsorption of simple mixtures in
slit pores: A model of methane-ethane mixtures in carbon. J Phys Chem
1992;96:845--54. #link("https://doi.org/10.1021/j100181a059").

] <ref-tanSelectiveAdsorptionSimple1992>
#block[
\[41\] Kierlik E, Rosinberg ML. Density-functional theory for
inhomogeneous fluids: Adsorption of binary mixtures. Phys Rev A
1991;44:5025--37. #link("https://doi.org/10.1103/PhysRevA.44.5025").

] <ref-kierlikDensityfunctionalTheoryInhomogeneous1991>
#block[
\[42\] Kierlik E, Fan Y, Monson PA, Rosinberg ML. Liquid--liquid
equilibrium in a slit pore: Monte Carlo simulation and mean field
density functional theory. J Chem Phys 1995;102:3712--9.
#link("https://doi.org/10.1063/1.468553").

] <ref-kierlikLiquidLiquidEquilibrium1995>
#block[
\[43\] Taghizadeh A, Keshavarzi E(Tahmineh). Population Inversion of
Binary Lennard-Jones Mixtures in Nanoslit Pores (A Density Functional
Theory Study). J Phys Chem B 2011;115:3551--9.
#link("https://doi.org/10.1021/jp1116883").

] <ref-taghizadehPopulationInversionBinary2011>
#block[
\[44\] Jiang S, Gubbins KE, Balbuena PB. Theory of Adsorption of Trace
Components. J Phys Chem 1994;98:2403--11.
#link("https://doi.org/10.1021/j100060a030").

] <ref-jiangTheoryAdsorptionTrace1994>
#block[
\[45\] Qiao C, Yu X, Song X, Zhao T, Xu X, Zhao S, et al. Enhancing Gas
Solubility in Nanopores: A Combined Study Using Classical Density
Functional Theory and Machine Learning. Langmuir 2020;36:8527--36.
#link("https://doi.org/10.1021/acs.langmuir.0c01160").

] <ref-qiaoEnhancingGasSolubility2020>
#block[
\[46\] Denton AR, Ashcroft NW. Weighted-density-functional theory of
nonuniform fluid mixtures: Application to freezing of binary hard-sphere
mixtures. Phys Rev A 1990;42:7312--29.
#link("https://doi.org/10.1103/PhysRevA.42.7312").

] <ref-Denton1990>
#block[
\[47\] Napari I, Laaksonen A, Talanquer V, Oxtoby DW. A density
functional study of liquid--liquid interfaces in partially miscible
systems. J Chem Phys 1999;110:5906--12.
#link("https://doi.org/10.1063/1.478490").

] <ref-Napari1999>
#block[
\[48\] Konynenburg PH van, Scott RL. Critical lines and phase equilibria
in binary van der waals mixtures. Philos Trans R Soc, A
1980;298:495--540. #link("https://doi.org/10.1098/rsta.1980.0266").

] <ref-vanKonynenburg1980>
#block[
\[49\] Shang-Chun L, Oettel M. A classical density functional from
machine learning and a convolutional neural network. SciPost Phys
2019;6:025. #link("https://doi.org/10.21468/SciPostPhys.6.2.025").

] <ref-shang-chunClassicalDensityFunctional2019>
#block[
\[50\] Simon A, Weimar J, Martius G, Oettel M. Machine learning of a
density functional for anisotropic patchy particles. J Chem Theory
Comput 2024;20:1062--77.
#link("https://doi.org/10.1021/acs.jctc.3c01238").

] <ref-Simon2024>
#block[
\[51\] Rodgers JM, Weeks JD. Local molecular field theory for the
treatment of electrostatics. J Phys Condens Matter 2008;20:494206.
#link("https://doi.org/10.1088/0953-8984/20/49/494206").

] <ref-rodgersLocalMolecularField2008>
#block[
\[52\] Bui AT, Cox SJ. A first-principles approach to electromechanics
in liquids. J Phys: Condens Matter 2025;37:285101.
#link("https://doi.org/10.1088/1361-648X/ade7e7").

] <ref-buiFirstPrinciplesApproach2025>
#block[
\[53\] Sammüller F, Robitschko S, Hermann S, Schmidt M. Hyperdensity
Functional Theory of Soft Matter. Phys Rev Lett 2024;133:098201.
#link("https://doi.org/10.1103/PhysRevLett.133.098201").

] <ref-sammullerHyperdensityFunctionalTheory2024>
#block[
\[54\] Noskov SYu, Lamoureux G, Roux B. Molecular dynamics study of
hydration in ethanol−water mixtures using a polarizable force field. J
Phys Chem B 2005;109:6705--13.
#link("https://doi.org/10.1021/jp045438q").

] <ref-Noskov2005>
#block[
\[55\] Dhattarwal HS, Remsing RC. Electronic fluctuations, cation
clustering, and ionic dynamics in molten silver iodide. J Chem Phys
2025;163:234503. #link("https://doi.org/10.1063/5.0301431").

] <ref-Dhattarwal2025>
#block[
\[56\] Joung IS, Cheatham III TE. Determination of alkali and halide
monovalent ion parameters for use in explicitly solvated biomolecular
simulations. J Phys Chem B 2008;112:9020--41.
#link("https://doi.org/10.1021/jp8001614").

] <ref-Joung2008>
#block[
\[57\] Rosenbrock CW, Gubaev K, Shapeev AV, Pártay LB, Bernstein N,
Csányi G, et al. Machine-learned interatomic potentials for alloys and
alloy phase diagrams. Npj Comput Mater 2021;7:24.
#link("https://doi.org/10.1038/s41524-020-00477-2").

] <ref-Rosenbrock2021>
#block[
\[58\] Stephan S, Langenbach K, Hasse H. Interfacial properties of
binary Lennard-Jones mixtures by molecular simulation and density
gradient theory. J Chem Phys 2019;150:174704.
#link("https://doi.org/10.1063/1.5093603").

] <ref-stephanInterfacialPropertiesBinary2019>
#block[
\[59\] Stephan S, Hasse H. Influence of dispersive long-range
interactions on properties of vapour--liquid equilibria and interfaces
of binary Lennard-Jones mixtures. Mol Phys 2020;118:e1699185.
#link("https://doi.org/10.1080/00268976.2019.1699185").

] <ref-stephanInfluenceDispersiveLongrange2020>
#block[
\[60\] Potoff JJ, Bernard-Brunel DA. Mie potentials for phase equilibria
calculations: Application to alkanes and perfluoroalkanes. J Phys Chem B
2009;113:14725--31. #link("https://doi.org/10.1021/jp9072137").

] <ref-Potoff2009>
#block[
\[61\] Laradji M, Landau DP, Dünweg B. Structural properties of
$upright(S i)_(1 upright(-) italic(x))$$upright(G e)_(italic(x))$
alloys: A monte carlo simulation with the stillinger-weber potential.
Phys Rev B 1995;51:4894--902.
#link("https://doi.org/10.1103/PhysRevB.51.4894").

] <ref-Laradji1995>
#block[
\[62\] Stillinger FH, Weber TA. Computer simulation of local order in
condensed phases of silicon. Phys Rev B 1985;31:5262--71.
#link("https://doi.org/10.1103/PhysRevB.31.5262").

] <ref-Stillinger1985>
#block[
\[63\] Tersoff J. New empirical model for the structural properties of
silicon. Phys Rev Lett 1986;56:632--5.
#link("https://doi.org/10.1103/PhysRevLett.56.632").

] <ref-Tersoff1986>
#block[
\[64\] Kelires PC, Tersoff J. Equilibrium alloy properties by direct
simulation: Oscillatory segregation at the si-ge(100) 21 surface. Phys
Rev Lett 1989;63:1164--7.
#link("https://doi.org/10.1103/PhysRevLett.63.1164").

] <ref-Kelires1989>
#block[
\[65\] Archer AJ, Evans R. Binary gaussian core model: Fluid-fluid phase
separation and interfacial properties. Phys Rev E 2001;64:041501.
#link("https://doi.org/10.1103/PhysRevE.64.041501").

] <ref-Archer2001>
#block[
\[66\] Heier M, Stephan S, Liu J, Chapman WG, Hasse H, Langenbach K.
Equation of state for the Lennard-Jones truncated and shifted fluid with
a cut-off radius of 2.5 $sigma$ based on perturbation theory and its
applications to interfacial thermodynamics. Mol Phys 2018;116:2083--94.
#link("https://doi.org/10.1080/00268976.2018.1447153").

] <ref-heierEquationStateLennardJones2018>
#block[
\[67\] Rehner P, Bauer G, Gross J. FeOs: An Open-Source Framework for
Equations of State and Classical Density Functional Theory. Ind Eng Chem
Res 2023;62:5347--57. #link("https://doi.org/10.1021/acs.iecr.2c04561").

] <ref-rehnerFeOsOpenSourceFramework2023>
#block[
\[68\] Stephan S, Hasse H. Molecular interactions at vapor-liquid
interfaces: Binary mixtures of simple fluids. Phys Rev E
2020;101:012802. #link("https://doi.org/10.1103/PhysRevE.101.012802").

] <ref-stephanMolecularInteractionsVaporliquid2020>
#block[
\[69\] Weeks JD, Katsov K, Vollmayr K. Roles of Repulsive and Attractive
Forces in Determining the Structure of Nonuniform Liquids: Generalized
Mean Field Theory. Phys Rev Lett 1998;81:4400--3.
#link("https://doi.org/10.1103/PhysRevLett.81.4400").

] <ref-weeksRolesRepulsiveAttractive1998>
#block[
\[70\] Weeks JD, Selinger RLB, Broughton JQ. Self-Consistent Treatment
of Repulsive and Attractive Forces in Nonuniform Liquids. Phys Rev Lett
1995;75:2694--7. #link("https://doi.org/10.1103/PhysRevLett.75.2694").

] <ref-weeksSelfConsistentTreatmentRepulsive1995>
#block[
\[71\] Remsing RC, Liu S, Weeks JD. Long-ranged contributions to
solvation free energies from theory and short-ranged models. Proc Natl
Acad Sci 2016;113:2819--26.
#link("https://doi.org/10.1073/pnas.1521570113").

] <ref-remsingLongrangedContributionsSolvation2016>
#block[
\[72\] Archer AJ, Evans R. Relationship between local molecular field
theory and density functional theory for non-uniform liquids. J Chem
Phys 2013;138:014502. #link("https://doi.org/10.1063/1.4771976").

] <ref-archerRelationshipLocalMolecular2013>
#block[
\[73\] Weeks JD, Chandler D, Andersen HC. Role of Repulsive Forces in
Determining the Equilibrium Structure of Simple Liquids. J Chem Phys
1971;54:5237--47. #link("https://doi.org/10.1063/1.1674820").

] <ref-weeksRoleRepulsiveForces1971>
#block[
\[74\] Staubach J, Stephan S. Interfacial properties of binary
azeotropic mixtures of simple fluids: Molecular dynamics simulation and
density gradient theory. J Chem Phys 2022;157:124702.
#link("https://doi.org/10.1063/5.0100728").

] <ref-staubachInterfacialPropertiesBinary2022>
#block[
\[75\] Prausnitz JM, Lichtenthaler RN, Azevedo EG de. Molecular
thermodynamics of fluid-phase equilibria. Pearson Education; 1998.

] <ref-prausnitz1998molecular>
#block[
\[76\] Do DD, Do HD. On the Azeotropic Behaviour of Adsorption Systems.
Adsorption 1999;5:319--29.
#link("https://doi.org/10.1023/A:1008944329330").

] <ref-doAzeotropicBehaviourAdsorption1999>
#block[
\[77\] Hamid U, Chen C-C. On the Thermodynamic Condition for Adsorption
Azeotropes. Langmuir 2023;39:16209--18.
#link("https://doi.org/10.1021/acs.langmuir.3c01369").

] <ref-hamidThermodynamicConditionAdsorption2023>
#block[
\[78\] Ritter JA, Pan H, Balbuena PB. Adsorption of Binary Gas Mixtures
in Heterogeneous Carbon Predicted by Density Functional Theory: On the
Formation of Adsorption Azeotropes. Langmuir 2010;26:13968--75.
#link("https://doi.org/10.1021/la101865m").

] <ref-ritterAdsorptionBinaryGas2010>
#block[
\[79\] Jiang H, Ebner AD, Ritter JA. Theoretical Analysis of the
Necessary and Sufficient Conditions for the Formation of Adsorption
Azeotropes in Binary Gas Mixtures. Langmuir 2021;37:13584--94.
#link("https://doi.org/10.1021/acs.langmuir.1c01933").

] <ref-jiangTheoreticalAnalysisNecessary2021>
#block[
\[80\] Widagdo S, Seider WD. Journal review. Azeotropic distillation.
AIChE J 1996;42:96--130. #link("https://doi.org/10.1002/aic.690420110").

] <ref-widagdoJournalReviewAzeotropic1996>
#block[
\[81\] Luyben WL, Chien I-L. Design and control of distillation systems
for separating azeotropes. 1st edition. New York: John Wiley & Sons,
Inc.; 2010.

] <ref-cholletDesign2021>
#block[
\[82\] Coasne B, Farrusseng D. Gas oversolubility in nanoconfined
liquids: Review and perspectives for adsorbent design. Microporous
Mesoporous Mater 2019;288:109561.
#link("https://doi.org/10.1016/j.micromeso.2019.109561").

] <ref-coasneGasOversolubilityNanoconfined2019>
#block[
\[83\] Rother G, Woywod D, Schoen M, Findenegg GH. Confinement effect on
the adsorption from a binary liquid system near liquid/liquid phase
separation. J Chem Phys 2004;120:11864--73.
#link("https://doi.org/10.1063/1.1755667").

] <ref-rotherConfinementEffectAdsorption2004>
#block[
\[84\] McLure IA, Edmonds B, Lal M. Extremes in surface tension of
fluorocarbon + hydrocarbon mixtures. Nature Physical Science
1973;241:71--1. #link("https://doi.org/10.1038/physci241071a0").

] <ref-McLure1973>
#block[
\[85\] Telo da Gama MM, Evans R. The structure and surface tension of
the liquid-vapour interface near the upper critical end point of a
binary mixture of Lennard-Jones fluids: I. The two phase region. Mol
Phys 1983;48:229--50.
#link("https://doi.org/10.1080/00268978300100181").

] <ref-telodagamaStructureSurfaceTension1983>
#block[
\[86\] Fouad WA, Vega LF. The phase and interfacial properties of
azeotropic refrigerants: The prediction of aneotropes from molecular
theory. Phys Chem Chem Phys 2017;19:8977--88.
#link("https://doi.org/10.1039/C6CP08031F").

] <ref-Fouad2017>
#block[
\[87\] Li X, Jin Y. Thermodynamic crossovers in supercritical fluids.
Proc Natl Acad Sci 2024;121:e2400313121.
#link("https://doi.org/10.1073/pnas.2400313121").

] <ref-liThermodynamicCrossoversSupercritical2024>
#block[
\[88\] Fomin YuD, Ryzhov VN, Tsiok EN, Brazhkin VV. Thermodynamic
properties of supercritical carbon dioxide: Widom and Frenkel lines.
Phys Rev E 2015;91:022111.
#link("https://doi.org/10.1103/PhysRevE.91.022111").

] <ref-Fomin2015>
#block[
\[89\] Gorelli F, Santoro M, Scopigno T, Krisch M, Ruocco G. Liquidlike
behavior of supercritical fluids. Phys Rev Lett 2006;97:245702.
#link("https://doi.org/10.1103/PhysRevLett.97.245702").

] <ref-Gorelli2006>
#block[
\[90\] Pipich V, Schwahn D. Densification of supercritical carbon
dioxide accompanied by droplet formation when passing the Widom line.
Phys Rev Lett 2018;120:145701.
#link("https://doi.org/10.1103/PhysRevLett.120.145701").

] <ref-Pipich2018>
#block[
\[91\] Cockrell C, Brazhkin VV, Trachenko K.
#link("https://www.sciencedirect.com/science/article/pii/S0370157321003732")[Transition in the supercritical state of matter: Review of experimental evidence].
Phys Rep 2021;941:1--27.

] <ref-Cockrell2021>
#block[
\[92\] Simeoni GG, Bryk T, Gorelli FA, Krisch M, Ruocco G, Santoro M, et
al. The Widom line as the crossover between liquid-like and gas-like
behaviour in supercritical fluids. Nat Phys 2010;6:503--7.
#link("https://doi.org/10.1038/nphys1683").

] <ref-Simeoni2010>
#block[
\[93\] Raju M, Banuti DT, Ma PC, Ihme M. Widom lines in binary mixtures
of supercritical fluids. Sci Rep 2017;7:3027.
#link("https://doi.org/10.1038/s41598-017-03334-3").

] <ref-Raju2017>
#block[
\[94\] Saric D, Guevara-Carrion G, Vrabec J. Thermodynamics of
supercritical carbon dioxide mixtures across the widom line. Phys Chem
Chem Phys 2022;24:28257--70.
#link("https://doi.org/10.1039/D2CP02701A").

] <ref-Saric2022>
#block[
\[95\] Pandit SP, Kofke DA. Evaluation of a locus of azeotropes by
molecular simulation. AIChE J 1999;45:2237--44.
#link("https://doi.org/10.1002/aic.690451021").

] <ref-panditEvaluationLocusAzeotropes1999>
#block[
\[96\] Kampa SM, Sammüller F, Schmidt M, Evans R. Metadensity Functional
Theory for Classical Fluids: Extracting the Pair Potential. Phys Rev
Lett 2025;134:107301.
#link("https://doi.org/10.1103/PhysRevLett.134.107301").

] <ref-kampaMetadensityFunctionalTheory2025>
#block[
\[97\] Bui AT. GCMC with Gaussian truncated potentials 2026.

] <ref-gcmc>
#block[
\[98\] Kingma DP, Ba J. Adam: A Method for Stochastic Optimization. In:
Bengio Y, LeCun Y, editors. 3rd International Conference on Learning
Representations, ICLR, San Diego, CA, USA: 2015.

] <ref-kingmaAdamMethodStochastic2015>
] <refs>
