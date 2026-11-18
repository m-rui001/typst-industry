// Adapted from arXiv:2511.23197v1 by M. Hoyuelos.
// https://arxiv.org/abs/2511.23197v1
// Original work: CC BY 4.0, https://creativecommons.org/licenses/by/4.0/
#set page(paper: "a4", margin: 20mm)
#set text(size: 10pt, lang: "en")
#set par(justify: true)
#set heading(numbering: "1.1")
#set math.equation(numbering: "(1)")
#title[A thermodynamic framework for the thermal conductivity of dense fluids]
#align(center)[M. Hoyuelos]
#align(center)[Instituto de Investigaciones Físicas de Mar del Plata (IFIMAR-CONICET), Departamento de Física, Facultad de Ciencias Exactas y Naturales, Universidad Nacional de Mar del Plata, Funes 3350, 7600 Mar del Plata, Argentina]
#align(center)[Correspondence: #raw("hoyuelos@mdp.edu.ar")]

#heading(level: 1, numbering: none)[Abstract]
<abstract>
A thermodynamic framework that predicts the thermal conductivity $lambda$ of simple fluids beyond the dilute-gas limit is introduced. By generalizing the transition-rate approach of particles on a lattice to conserved quantities in continuous space, an expression for the ratio $lambda \/ lambda_(upright(i d))$, with $lambda_(upright(i d))$ the dilute-gas-limit value, is derived; it depends solely on equilibrium thermodynamic properties and is therefore directly computable from any equation of state. The resulting formula quantitatively reproduces molecular-dynamics data for hard spheres throughout almost the entire fluid range, and captures the behavior of Lennard-Jones fluids in the supercritical region where thermodynamic fluctuations remain moderate. Comparison with experimental data for argon, reported by other authors, also shows very good agreement. These results provide evidence that transport coefficients of dense fluids can be expressed as their dilute-gas values multiplied by a universal thermodynamic factor.

#heading(level: 1, numbering: none)[Keywords]
<keywords>
transition probabilities,thermal conductivity,simple fluid

= Introduction
<introduction>
Transport coefficients such as diffusivity, thermal conductivity, and viscosity play a central role in nonequilibrium statistical mechanics and in the description of real fluids. While their theoretical expressions are well established for dilute gases through the Chapman--Enskog theory based on the Boltzmann equation \[1\], extending these results to dense fluids remains a longstanding challenge.

Existing approaches attempt to incorporate dense-fluid effects in various ways (see \[2\] for a review). Enskog-type theories include structural information through the radial distribution function at contact \[3\], with refinements such as the Modified \[4\] and Revised \[5\] Enskog theories improving agreement with simulations. Effective hard-sphere mappings \[6\], \[7\] and free-volume theories \[8\], \[9\], \[10\], \[11\], \[12\], \[13\], \[14\] capture aspects of repulsive interactions but require model-dependent prescriptions. Rosenfeld-type excess-entropy scaling \[15\], \[16\], \[17\] succeeds in organizing transport data for a broad class of fluids, yet its exponential form remains empirical. Overall, despite substantial progress, a parameter-free framework capable of predicting transport properties from equilibrium thermodynamics alone has remained elusive.

Recent studies have explored the possibility of calculating transition rates between neighboring cells, and thus transport coefficients, from the detailed balance relation. In Ref.~\[18\], particle diffusion on a lattice with local interactions was analyzed by expanding the detailed-balance condition in powers of a parameter proportional to the lattice cell volume. This expansion yielded transition rates relative to their ideal values (corresponding to noninteracting particles) that depend only on thermodynamic quantities. This result was used, for example, to reproduce the Darken equation, a relation between the self-diffusion and collective diffusion widely used for diffusion in solids; this result demonstrated that the transition rate approach can provide relevant information on transport properties. The expansion of the detailed balance relation can be performed for transitions of any conserved quantity. With the transition rates, it is not difficult to calculate the average current of conserved quantities and the corresponding transport coefficient. Since the resulting transition rates are expressed relative to their ideal values, the transport coefficients are also obtained in relative form. Denoting a transport coefficient by $xi$, the method implies that $xi \/ xi_(upright(i d)) = phi.alt$, where $phi.alt$ depends only on the thermodynamic state. Although $xi \/ xi_(upright(i d))$ is not equivalent to Rosenfeld scaling, and $phi.alt$ is not an exponential function of the excess entropy, both approaches share an important feature: they link dynamic transport properties to static thermodynamic information. Molecular dynamics simulations of pseudo-hard spheres and Lennard-Jones (LJ) systems, including noise from a Langevin thermostat, show collapse of $xi \/ xi_(upright(i d))$ curves as a function of concentration for different noise intensities. This result, obtained for self-diffusion \[19\] and viscosity \[20\], is consistent with the relation $xi \/ xi_(upright(i d)) = phi.alt$, since the noise does not alter the thermodynamic state.

Here we generalize this transition-rate methodology to simple fluids in continuous space and apply it to the transport of heat. In place of a lattice, a continuous space partitioned into cells satisfying the conditions used in classical irreversible thermodynamics is considered: the system is divided into cells large enough to contain many particles but still small compared to the characteristic length scale of variations in density or temperature. Instead of particle jumps between neighboring sites, the transition of a small amount of heat is considered and an expression for $lambda \/ lambda_(upright(i d))$ is derived, where $lambda$ and $lambda_(upright(i d))$ are the thermal conductivities of the real and ideal systems, respectively; $lambda_(upright(i d))$ follows from Chapman-Enskog theory for dilute gases. The derivation also requires knowledge of the non-extensive terms of the Massieu functions. For example, if $S$ is the thermodynamic (extensive) entropy and $tilde(S)$ is the statistical-mechanics entropy in the Boltzmann formulation, the non-extensive correction is $Delta S = tilde(S) - S$, which becomes relevant when evaluating state probabilities proportional to $exp \( tilde(S) \/ k_B \)$, with $k_B$ the Boltzmann constant. This non-extensive terms are related to thermodynamic fluctuations \[21\]. Consequently, the results do not apply at phase transitions, where fluctuations diverge.

The approach is general, contains no empirical parameters, and does not rely on scaling assumptions. It fails near phase transitions, where the underlying expansion breaks down. As we show below, the resulting formula for the thermal conductivity accurately reproduces simulations of hard spheres across nearly the entire fluid regime, describes supercritical Lennard-Jones fluids, and agrees with experimental data for argon. These results offer evidence that transport properties of dense fluids can be obtained from thermodynamic information, opening a path toward a unified macroscopic theory of transport.

= Thermal conductivity of a simple fluid
<s.thermalcond>
After applying the mentioned procedure, the following expression for the thermal conductivity, for a cell of fixed volume $V$ with $N$ particles at temperature $T$, is obtained: $ lambda / lambda_(upright("id")) = frac(4 thin T^2, 15 thin T_(upright("id"))^2) \( C_V mu_(T N) + T^2 mu_(T T)^2 \) \, $<lambda> where $lambda$ is evaluated at temperature $T$ and $lambda_(upright(i d))$ at $T_(upright(i d))$\; $C_V$ is the heat capacity at constant volume, $mu_(T T) = frac(partial^2 mu, partial T^2)$ and $mu_(T N) = frac(partial^2 mu, partial T partial N)$. The temperature in energy units, $T = k_B cal(T)$, is used for simplicity, where $cal(T)$ is the temperature in kelvins. The real system must be in the same phase than the ideal system, that is, the gas or the supercritical fluid phase.

It is assumed that the compressibility factor, $Z = p \/ \( rho T \)$, and the internal energy per particle, $u \( rho \, T \)$, are known, where $p$ is the pressure and $rho = N \/ V$ is the particle density; the chemical potential $mu$ and the pressure $p$ are functions of $rho$ and $T$. The quantities that appear in #link(<lambda>)[\[lambda\]] are obtained from standard thermodynamic relationships. The heat capacity is $C_V = N frac(partial u, partial T)$. Using the thermodynamic factor $Gamma = rho / T frac(partial mu, partial rho)$, we can write $mu_(T N) = 1 / N frac(partial \( T Gamma \), partial T)$. It can be shown that $Gamma = frac(partial \( rho Z \), partial rho)$, then, $ mu_(T N) = 1 / N frac(partial, partial T) (T frac(partial \( rho Z \), partial rho)) . $<muTN> For $mu_(T T)$, the relation $(frac(partial U, partial N))_(T \, V) = mu - T frac(partial mu, partial T) = - T^2 frac(partial mu \/ T, partial T)$ can be used. After a few steps, it can be shown that $ mu_(T T) = - 1 / T frac(partial^2 \( rho u \), partial T partial rho) . $<muTT>

The temperature of the ideal system is given by

$ T_(upright("id")) = T_0 + 2 / 3 \[ u \( rho \, T \) - u \( rho \, T_0 \) \] \, $<Tid> where $T_0$ is a reference temperature for which $T_(upright(i d)) = T$. The equation for $T_(upright("id"))$ is deduced from the procedure that leads to Eq.~#link(<lambda>)[\[lambda\]]. It can be shown that Eq.~#link(<lambda>)[\[lambda\]] implies that $lambda arrow.r lambda_(upright(i d))$ for the dilute-gas limit $rho arrow.r 0$, where $Z arrow.r 1$ and $u arrow.r 3 T \/ 2$.

== Hard spheres
<hard-spheres>
A system of hard spheres is athermal, this means that the compressibility factor, $Z$, and also the thermodynamic factor, $Gamma$, do not depend on temperature. The internal energy per particle is $u = 3 T \/ 2$ (composed only by thermal energy, since particle overlap is forbidden for hard spheres). In this case, $ mu_(T N) & = Gamma \/ N \,\
mu_(T T) & = - frac(3, 2 T) \,\
C_V & = 3 / 2 N \,\
T_(upright("id")) & = T \, $ and #link(<lambda>)[\[lambda\]] simplifies to $ lambda / lambda_(upright(i d)) = 2 / 5 Gamma + 3 / 5 . $<e.lambdaHS>

The Carnahan and Starling \[22\] equation of state (EoS) is appropriate for the description of a hard sphere system in the fluid phase. The thermodynamic factor $Gamma$, calculated from the compressibility factor, is $ Gamma = frac(eta^4 - 4 thin eta^3 + 4 thin eta^2 + 4 thin eta + 1, eta^4 - 4 thin eta^3 + 6 thin eta^2 - 4 thin eta + 1) \, $ where $eta = rho pi / 6 d^3$ is the packing fraction, and $d$ is the particle diameter.

In Fig.~@f.lambdaHS we compare Eq.~#link(<e.lambdaHS>)[\[e.lambdaHS\]], using the Carnahan and Starling EoS, with numerical simulation results obtained by Pieprzyk #emph[et al.] \[23\] for the fluid hard sphere system. No significative differences appear using, for example, the EoS proposed by Kolafa #emph[et al.]~in \[24\] for $rho < 0.98$. In any case, the relative error is smaller than 0.03 for $rho < 0.85$, and increases up to 0.07 for $rho > 0.85$.

#figure(image("graphics/condHS.png"),
  caption: [
    Relative thermal conductivity, $lambda \/ lambda_(upright(i d))$ for fluid hard spheres against concentration, $rho$. The concentration units are $d^(- 3)$, with $d$ the particle diameter. The dots are numerical results taken from Ref.~\[23\]. The curve corresponds to Eq.~#link(<e.lambdaHS>)[\[e.lambdaHS\]]. The vertical dotted line indicates the limit of the fluid phase at density $0.939$.
  ]
)
<f.lambdaHS>

== Lennard-Jones
<lennard-jones>
The Lennard-Jones (LJ) truncated and shifted potential as a function of the interparticle distance $r$ is given by $ phi.alt \( r \) = {4 epsilon.alt [(sigma / r)^12 - (sigma / r)^6 - (sigma / r_c)^12 + (sigma / r_c)^6] & r lt.eq r_c\
0 & r > r_c $ where $sigma$ is the distance at which the potential is zero, $epsilon.alt$ is the depth of the attractive well and $r_c$ is the cutoff radio. Values of $r_c$ equal to $2.5 sigma$ or $4.5 sigma$ are usually found in the literature. Combinations of $sigma$, $epsilon.alt$ and $m$, the particle mass, are used to represent the so-called LJ units.

A $T$-$rho$ phase diagram of the LJ system shows that the gas region is narrow compared to the supercritical fluid region; values of $lambda$ obtained from Eq.~#link(<lambda>)[\[lambda\]] are influenced by the near presence of the gas-liquid phase transition. The supercritical fluid region is considered instead, with $T_0$ equal to the critical temperature $T_c = 1.32$\; this value is used in #link(<Tid>)[\[Tid\]] to calculate $T_(upright(i d))$. The region is determined by $T > T_c$ and density $rho$ smaller than $rho_(upright(l i q))$, the liquid density of the melting line. Close to the limits of this fluid region, a loss of accuracy is expected.

The EoS proposed by Pieprzyk #emph[et al.] \[25\] for the LJ system was used to evaluate the thermal conductivity, that is, to evaluate $T_(upright("id"))$, $C_V$, $mu_(T N)$ and $mu_(T T)$ in Eq.~#link(<lambda>)[\[lambda\]] (the results obtained using, for example, the EoS of Kolafa and Nezbeda \[26\] were similar). Dimensionless quantities are used. Units of temperature (in kelvins), thermal conductivity and particle density are recovered multiplying by $epsilon.alt \/ k_B$, $k_B sigma^(- 2) sqrt(epsilon.alt \/ m)$ and $sigma^(- 3)$ respectively.

With the expressions for $Z$ and $u$ provided by Ref.~\[25\] \[see Eqs.~(4) and (A2) in that reference\], $mu_(T N)$ and $mu_(T T)$ are calculated using Eqs.~#link(<muTN>)[\[muTN\]] and #link(<muTT>)[\[muTT\]], and we can obtain the thermal conductivity from Eq.~#link(<lambda>)[\[lambda\]].

The Chapman-Enskog \[1\] theory provides the expression for the ideal thermal conductivity, $ lambda_(upright("id")) = frac(75 thin k_B, 64 thin sigma^2) (frac(k_B T_(upright(i d)), pi m))^(1 \/ 2) 1 / Omega^(\( 2 \, 2 \)) . $<eq:LambdaB> The interpolation provided by Fokin #emph[et al.] \[27\] was used for the collision integral $Omega^(\( 2 \, 2 \))$. A correction factor is sometimes included in #link(<eq:LambdaB>)[\[eq:LambdaB\]]\; it can be shown that, in the temperature range used, its influence is less than 1%; see Appendix B in \[28\].

Numerical results for the thermal conductivity in the LJ system were taken from Ref.~\[29\] for $T = 2$, 3, 4 and 6. Fig.~@f.lambdaLJ shows the comparison between the theoretical expression of Eq.~#link(<lambda>)[\[lambda\]] and the numerical results. There is a good agreement between theory and simulations, except for $rho = 0.8$\; this loss of accuracy is probably caused by the vicinity of the liquid melting density, that is between 1.06 and 1.38 for temperatures between 2 and 6 \[30\].

#figure(image("graphics/condLJ.png"),
  caption: [
    Thermal conductivity, $lambda$, for the LJ system against concentration, $rho$, for different temperatures, $T$, in LJ units. The dots are numerical results taken from Ref.~\[29\] and the curve corresponds to Eq.~#link(<lambda>)[\[lambda\]], evaluated using the EoS of Ref.~\[25\].
  ]
)
<f.lambdaLJ>

== Argon
<argon>
Since Eq.~#link(<lambda>)[\[lambda\]] gives a good description of the thermal conductivity for the LJ system in the supercritical fluid phase at moderate concentrations, the same equation can be used to represent experimental data for systems that are well described by the LJ model. That is the case of fluid Argon, with $epsilon.alt \/ k_B = 116.79$ K and $sigma = 3.3952 thin 10^(- 10)$ m \[31\].

#figure(image("graphics/condArgon.png"),
  caption: [
    Thermal conductivity, $lambda$, for fluid Argon, against concentration, $rho$. The dots are experimental results taken from Ref.~\[32\] ($T =$ 378 K and 429 K) and Ref.~\[33\] ($T =$ 300 K, 320 K and 340 K) and the curve corresponds to Eq.~#link(<lambda>)[\[lambda\]], where the EoS of Ref.~\[25\] is used.
  ]
)
<f.lambdaAr>

Experimental data, taken from Refs.~\[32\], \[33\], for thermal conductivity of supercritical fluid Argon at temperatures 300 K, 320 K, 340 K, 378 K and 429 K, are compared with the theoretical result #link(<lambda>)[\[lambda\]] in Fig.~@f.lambdaAr. The temperature range in LJ units is between 2.5 and 3.7, and the maximum density of Fig.~@f.lambdaAr corresponds to 0.08 in Fig.~@f.lambdaLJ. The maximum density, although small compared to the density range in Fig.~@f.lambdaLJ, is large enough to show an increase of $lambda$ with $rho$, that is, a departure from the value predicted by the Chapman-Enskog theory for dilute gases. This departure is correctly described by Eq.~#link(<lambda>)[\[lambda\]].

= Conclusions
<s.conclusions>
This work introduces a general thermodynamic framework for deriving transport coefficients of dense fluids, extending the transition-rate approach for particles on a lattice of Ref. \[18\] to conserved quantities in continuous space. The resulting expression for the thermal conductivity, Eq.~#link(<lambda>)[\[lambda\]], whose derivation is sketched in the introduction, accurately reproduces the hard-sphere data across nearly the entire fluid regime. The appearance of the gas-liquid phase transition in the LJ model reduces the applicability of the result to the supercritical fluid. The equation is straightforward to evaluate for any system as long as its EoS is available.

Beyond the specific case of heat transport, the present framework points to a broader principle: transport coefficients can be written as their dilute-gas values multiplied by a thermodynamic function that encapsulates dense-fluid effects. The extension of the formalism to viscosity and self-diffusion, and its potential applicability to solids motivates further investigation. Overall, the results presented here support the emergence of a unified macroscopic description of transport rooted in equilibrium thermodynamics.

#heading(level: 1, numbering: none)[Acknowledgments]
<acknowledgments>
#block[
Discussions that were fundamental to the development of this article with M. A. Di Muro, M. Sampayo Puelles, L. Marchioni, P. Giménez and A. Alés are gratefully acknowledged. This work was partially supported by National University of Mar del Plata (UNMdP, Argentina, EXA1190/24).

]
#heading(level: 1, numbering: none)[References]
<bibliography>
#block[
#block[
\[1\] S. Chapman and T. G. Cowling, #emph[The mathematical theory of non-uniform gases], 3rd ed. Cambridge University Press, 1970.

] <ref-chapman>
#block[
\[2\] C. M. Silva and H. Liu, “Modelling of transport properties of hard sphere fluids and related systems, and its applications,” in #emph[Theory and simulation of hard-sphere fluids and related systems], A. Mulero, Ed., Springer, 2008, p. 383.

] <ref-silva>
#block[
\[3\] D. Enskog, “Kinetische theorie der wärmeleitung, reibung und selbstdiffusion in gewissen verdichteten gasen und flüssigkeiten,” #emph[Kungl. Svenska Vetensk. Handl.], vol. 63, p. 1, 1922.

] <ref-enskog>
#block[
\[4\] H. J. M. Hanley, R. D. McCarty, and E. G. D. Cohen, “Analysis of the transport coefficients for simple dense fluid: Application of the modified enskog theory,” #emph[Physica], vol. 60, pp. 322--356, 1972.

] <ref-hanley>
#block[
\[5\] H. van Beijeren and M. H. Ernst, “The modified enskog equation,” #emph[Physica], vol. 68, p. 437, 1973.

] <ref-Beijeren2>
#block[
\[6\] J. D. Weeks, D. Chandler, and H. C. Andersen, “The role of repulsive forces in determining the equilibrium structure of simple liquids,” #emph[J. Chem. Phys.], vol. 54, p. 5237, 1971.

] <ref-weeks>
#block[
\[7\] F. D. C. Silva, L. A. Coelho, F. W. Tavares, and M. J. E. M. Cardoso, “Shear viscosity calculated by perturbation theory and molecular dynamics for dense fluids,” #emph[Inter. J. Quant. Chem.], vol. 95, pp. 79--87, 2003.

] <ref-SilvaCoelho>
#block[
\[8\] J. H. Dymond, “Corrected Enskog theory and the transport coefficients of liquids,” #emph[J. Chem. Phys.], vol. 60, p. 969, 1974.

] <ref-dymond>
#block[
\[9\] J. H. Hildebrand, “Motions of molecules in liquids: Viscosity and diffusivity,” #emph[Science], vol. 174, p. 490, 1971.

] <ref-hildebrand>
#block[
\[10\] A. J. Batschinski, “Investigations of internal friction of fluids,” #emph[Z. Phys. Chem.], vol. 84, p. 643, 1913.

] <ref-batschinski>
#block[
\[11\] A. K. Doolittle, “Studies in Newtonian flow. II. The dependence of the viscosity of liquids on free‐space,” #emph[J. Appl. Phys.], vol. 22, p. 1471, 1951.

] <ref-doolittle>
#block[
\[12\] M. H. Cohen and D. Turnbull, “Molecular transport in liquids and glasses,” #emph[J. Chem. Phys.], vol. 31, p. 1164, 1959.

] <ref-cohen2>
#block[
\[13\] D. Turnbull and M. H. Cohen, “On the free‐volume model of the liquid‐glass transition,” #emph[J. Chem. Phys.], vol. 52, p. 3038, 1970.

] <ref-turnbull>
#block[
\[14\] P. B. Macedo and T. A. Litovitz, “On the relative roles of free volume and activation energy in the viscosity of liquids,” #emph[J. Chem. Phys.], vol. 42, p. 245, 1965.

] <ref-macedo>
#block[
\[15\] Y. Rosenfeld, “Relation between the transport coefficients and the internal entropy of simple systems,” #emph[Phys. Rev. A], vol. 15, p. 2545, 1977.

] <ref-rosenfeld>
#block[
\[16\] Y. Rosenfeld, “Comments on the transport coefficients of dense hard core systems,” #emph[Chem. Phys. Lett.], vol. 48, p. 467, 1977.

] <ref-rosenfeld2>
#block[
\[17\] J. C. Dyre, “Perspective: Excess-entropy scaling,” #emph[J. Chem. Phys.], vol. 149, p. 210901, 2018.

] <ref-dyre>
#block[
\[18\] M. A. Di Muro and M. Hoyuelos, “Application of the Widom insertion formula to transition rates in a lattice,” #emph[Phys. Rev. E], vol. 104, p. 044104, 2021.

] <ref-dimuro>
#block[
\[19\] L. Marchioni, M. A. D. Muro, and M. Hoyuelos, “Dependence on the thermodynamic state of self-diffusion of pseudo-hard-sphere and lennard-jones potentials,” #emph[Phys. Rev. E], vol. 107, p. 014134, 2023.

] <ref-marchioni>
#block[
\[20\] L. Marchioni, M. A. D. Muro, and M. Hoyuelos, “Viscosity as the product of its ideal low-concentration value and a thermodynamic function,” #emph[Phys. Rev. E], vol. 111, p. 064128, 2025.

] <ref-marchioni2>
#block[
\[21\] M. Hoyuelos, M. A. D. Muro, and P. Giménez, “Physical meaning of non-extensive term in Massieu functions,” #emph[Phys. Rev. E], vol. 111, p. 024120, 2025.

] <ref-hoyuelos>
#block[
\[22\] N. F. Carnahan and K. E. Starling, “Equation of state for nonattracting rigid spheres,” #emph[J. Chem. Phys.], vol. 51, p. 635, 1969.

] <ref-carnahan>
#block[
\[23\] S. Pieprzyk, A. C. Brańka, D. M. Heyes, and M. N. Bannerman, “A comprehensive study of the thermal conductivity of the hard sphere fluid and solid by molecular dynamics simulation,” #emph[Phys. Chem. Chem. Phys.], vol. 22, p. 8834, 2020.

] <ref-pieprzyk3>
#block[
\[24\] J. Kolafa, S. Labík, and A. Malijevský, “Accurate equation of state of the hard sphere fluid in stable and metastable regions,” #emph[Phys. Chem. Chem. Phys.], vol. 6, p. 2335, 2004.

] <ref-kolafa2>
#block[
\[25\] S. Pieprzyk, A. C. Brańka, Sz. Maćkowiak, and D. M. Heyes, “Comprehensive representation of the Lennard-Jones equation of state based on molecular dynamics simulation data,” #emph[J. Chem. Phys.], vol. 148, p. 114505, 2018.

] <ref-pieprzyk>
#block[
\[26\] J. Kolafa and I. Nezbeda, “The Lennard-Jones fluid: An accurate analytic and theoretically-based equation of state,” #emph[Fluid Ph. Equilibria], vol. 100, p. 1, 1994.

] <ref-kolafa>
#block[
\[27\] L. R. Fokin, V. N. Popov, and A. N. Kalashnikov, “Analytical representation of collision integrals for the (m-6) Lennard-Jones potentials in the EPIDIF database,” #emph[High Temp.], vol. 37, p. 45, 1999.

] <ref-fokin>
#block[
\[28\] K. Meier, “Computer simulation and interpretation of the transport coefficients of the Lennard-Jones model fluid,” PhD thesis, Department of Mechanical Engineering of the University of the Federal Armed Forces Hamburg, 2002.

] <ref-meier1>
#block[
\[29\] G. Galliero and Ch. Boned, “Thermal conductivity of the Lennard-Jones chain fluid model,” #emph[Phys. Rev. E], vol. 80, p. 061202, 2009.

] <ref-galliero>
#block[
\[30\] E. A. Mastny and J. J. de Pablo, “Melting line of the lennard-jones system, infinite size, and full potential,” #emph[J. Chem. Phys.], vol. 127, p. 104504, 2007.

] <ref-mastny>
#block[
\[31\] J. Vrabec, J. Stoll, and H. Hasse, “A set of molecular models for symmetric quadrupolar fluids,” #emph[J. Phys. Chem. B], vol. 105, p. 12126, 2001.

] <ref-vrabec>
#block[
\[32\] U. V. Mardolcar, C. A. N. de Castro, and W. A. Wakeham, “Thermal conductivity of Argon in the temperature range 107 to 423 K,” #emph[International Journal of Thermophysics], vol. 7, p. 259, 1986.

] <ref-mardolcar>
#block[
\[33\] L. Sun and J. E. S. Venart, “Thermal conductivity, thermal diffusivity, and heat capacity of gaseous Argon and Nitrogen,” #emph[International Journal of Thermophysics], vol. 26, p. 325, 2005.

] <ref-sun>
] <refs>
