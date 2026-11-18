// Adapted from arXiv:2402.03020v1 by S. A. Khrapak and A. G. Khrapak.
// https://arxiv.org/abs/2402.03020v1
// Original work: CC BY 4.0, https://creativecommons.org/licenses/by/4.0/
#set page(paper: "a4", margin: 20mm)
#set text(size: 10pt, lang: "en")
#set par(justify: true)
#set heading(numbering: "I.A")
#set math.equation(numbering: "(1)")
#title[Elementary vibrational model for thermal conductivity of Lennard-Jones fluids: Applicability domain and accuracy level]
#align(center)[S. A. Khrapak and A. G. Khrapak]
#align(center)[Joint Institute for High Temperatures, Russian Academy of Sciences, 125412 Moscow, Russia]
#align(center)[Correspondence: #raw("Sergey.Khrapak@gmx.de")]

*Abstract.* Exact mechanisms of thermal conductivity in liquids are not well understood, despite rich research history. A vibrational model of energy transfer in dense simple liquids with soft pairwise interactions seems adequate to partially fill this gap. The purpose of the present paper is to define its applicability domain and to demonstrate how well it works within the identified applicability domain in the important case of the Lennard-Jones model system. The existing results from molecular dynamics simulations are used for this purpose. Additionally, we show that a freezing density scaling approach represents a very powerful tool to estimate the thermal conductivity coefficient across essentially the entire gas-liquid region of the phase diagram, including metastable regions. A simple practical expression serving this purpose is proposed.

= Introduction
<introduction>
The thermal conductivity coefficient is an important characteristic of a material. It can vary greatly depending on specific substance as well on its phase state. While heat transport in gases, plasmas and solids is relatively well understood, mechanisms of heat transfer in liquids have remained elusive.

A vibrational model of thermal conductivity in simple liquids with soft pairwise interactions has been recently proposed and discussed~[#link(<ref-1>)[1]]. In this model it is assumed that atoms in liquids exhibit solid-like oscillations about temporary equilibrium positions corresponding to a local minimum on the system's potential energy surface~[#link(<ref-2>)[2], #link(<ref-3>)[3], #link(<ref-4>)[4]]. The equilibrium positions are not fixed like in solids, but are allowed to diffuse (and this is why liquids can flow). However, this diffusion occurs on long enough time scales, which are irrelevant for the process of energy transfer. Furthermore, liquid is approximated by a quasi-layered structure with layers perpendicular to the temperature gradient and separated by the distance $Delta = rho^(- 1 \/ 3)$, where $rho$ is the atomic number density. The average interatomic separation in each quasi-layer is also $Delta$. Then elementary consideration based on the assumption that the energy difference between the atoms in neighbouring layers is transferred at an average frequency of their solid-like vibrations leads immediately to a simple expression~[#link(<ref-1>)[1]]

$ lambda tilde.eq c_(upright(v)) frac(chevron.l omega chevron.r, 2 pi Delta) . $ <tc1>

Here $lambda$ is the thermal conductivity coefficient (which does not include the Boltzmann constant and hence is measured in cm$""^(- 1)$s$""^(- 1)$), $c_(upright(v))$ is the specific heat at constant volume, and $chevron.l omega chevron.r$ is the average vibrational frequency that approximates the energy transfer rate. Actually, specific heat at constant volume $c_(upright(v))$ appears in Eq.~(@tc1) under the assumption of a small thermal expansion coefficient. Dense liquids with soft interactions near the liquid-solid phase transition are essentially incompressible and this represents a good approximation.

We note in passing that the vibrational paradigm sketched above is useful not only in relation to the problem of thermal conductivity of dense fluids. It also allows to relate the self-diffusion and the shear viscosity coefficients in the form of Stokes-Einstein relation without the hydrodynamic diameter~[#link(<ref-4>)[4], #link(<ref-6>)[6], #link(<ref-7>)[7], #link(<ref-8>)[8]]. The present paper is, however, mostly focused on the thermal conductivity mechanism.

Equation (@tc1) emphasises the relation between the thermal conductivity and collective modes properties of dense liquids. To evaluate the average vibrational frequency one would require to know the liquid vibrational density of states (VDOS). This is a formidable task, because collective properties can greatly differ from one liquid system to another and depend considerably on the state point in the phase diagram. Some progress has recently been reported~[#link(<ref-9>)[9], #link(<ref-10>)[10]]. Zaccone and Baggioli have developed an analytical model for VDOS, based on overdamped Langevin liquid dynamics~[#link(<ref-9>)[9]]. Distinct from the Debye approximation, $g \( omega \) prop omega^2$, for solids, the universal law for liquids reveals a linear relationship, $g \( omega \) prop omega$, in the low-energy region. Stamper #emph[et al.] have confirmed this universal law with experimental VDOS measured by inelastic neutron scattering on real liquid systems~[#link(<ref-10>)[10]]. Nevertheless, the applicability regime and accuracy level of this model still require clarification. In the meantime, it is natural to employ some approximations and simplifications which can differ depending on the type of liquid under investigation (some examples are provided below).

Interestingly enough, Eq.~(@tc1) can be reduced to the known previous results under special simplifying assumptions about the vibrational properties~[#link(<ref-1>)[1]]. In the simplest approximation all atoms are oscillating with the same Einstein frequency $Omega_(upright(E))$ (this approximation is known as the Einstein model in the solid state physics). Averaging is then trivial, $chevron.l omega chevron.r = Omega_(upright(E))$. We get

$ lambda tilde.eq c_(upright(v)) frac(Omega_(upright(E)), 2 pi Delta) . $ <Horrocks>

This is very similar to to the results obtained by Rao~[#link(<ref-11>)[11]] and later by Horrocks and McLaughlin~[#link(<ref-12>)[12], #link(<ref-13>)[13]]. This form is particularly suitable for extremely soft interactions such as Coulomb and screened Coulomb potentials, relevant in the plasma-related context~[#link(<ref-14>)[14], #link(<ref-15>)[15], #link(<ref-16>)[16]]. In dense liquids near freezing conditions we can set $c_(upright(v)) tilde.op 3$, according to Dulong-Petit law. The Einstein frequency at the liquid-solid phase transition can be estimated using the Lindeman's melting criterion in its simplest formulation. Then, quasi-universality of the thermal conductivity coefficient at freezing conditions emerges in the form~[#link(<ref-11>)[11], #link(<ref-17>)[17]]

#math.equation(block: true, numbering: none, $ lambda tilde.eq upright(c o n s t) sqrt(frac(T, m Delta^4)) \, $)

where $T$ is the temperature in energy units ($= k_(upright(B)) T$) and $m$ is the atomic mass. The value of the constant is about $tilde.eq 10$ for usual simple model systems such as Lennard-Jones, Coulomb, screened Coulomb, as well as monatomic liquids (e.g. liquefied noble gases)~[#link(<ref-18>)[18], #link(<ref-19>)[19]]. It is somewhat larger for the hard-sphere fluid at freezing and reaches values $tilde.eq 15 - 20$ for liquids with more complex molecular structure~[#link(<ref-20>)[20]].

Alternatively, we can relate the average frequency to the sound velocity. Namely, consider an acoustic dispersion of the form $omega = k c_(upright(s))$, where $k$ is the wave-number and $c_(upright(s))$ is the sound velocity. The characteristic wave-number for energy transfer between nearest neighbours is $k tilde.op 2 pi \/ Delta$. This yields $chevron.l omega chevron.r tilde.op 2 pi c_(upright(s)) \/ Delta$ and hence

$ lambda tilde.op c_(upright(v)) c_(upright(s)) / Delta^2 . $ <Bridgman>

This resembles Bridgman's expression for the thermal conductivity coefficient~[#link(<ref-21>)[21]]. Actually, Bridgman postulated that the energy is transferred at the speed of sound, thus leading to a linear correlation between the thermal conductivity coefficient and the sound velocity. He also used a constant coefficient of two, that is $lambda tilde.eq 2 c_(upright(s)) \/ Delta^2$. This numerical coefficient remained somewhat controversial, values between 2 and 3 were used in the literature~[#link(<ref-22>)[22], #link(<ref-23>)[23], #link(<ref-1>)[1], #link(<ref-24>)[24]]. In a recent extensive study of correlations between the thermal conductivity coefficient and the sound velocity of various liquids~[#link(<ref-20>)[20], #link(<ref-25>)[25]], it has been demonstrated that linear correlations are well reproduced for model liquids as well as real monatomic and diatomic liquids. However, they are less convincing in polyatomic molecular liquids. The actual coefficient of proportionality in Bridgman's formula is not fixed. It is about unity for monatomic liquids and generally increases with molecular complexity.

Just like in solids, dense liquids support one longitudinal and two transverse collective modes~[#link(<ref-26>)[26], #link(<ref-27>)[27], #link(<ref-28>)[28], #link(<ref-29>)[29], #link(<ref-30>)[30]]. A Debye-like approximation for the vibrational spectra of dense liquid is thus not completely irrelevant and has demonstrated reasonable success in deriving the Stokes-Einstein coefficient without the hydrodynamic diameter~[#link(<ref-4>)[4]] and estimating thermodynamic properties of dense liquids ~[#link(<ref-31>)[31], #link(<ref-32>)[32]]. In this approach the dispersion relations of one longitudinal and two transverse collective modes are approximated by their corresponding acoustic asymptotes $omega_(upright(l)) \( k \) = k c_(upright(l))$ and $omega_(upright(t)) \( k \) = k c_(upright(t))$, terminating at respective cut-off wavelengths $k_(upright(c u t))$. Application to the problem of thermal conductivity results in the expression~[#link(<ref-1>)[1]]

$ lambda tilde.eq 1 / 4 (frac(3, 4 pi))^(1 \/ 3) c_(upright(v)) frac(c_l + 2 c_t, Delta^2) . $ <Cahill1>

Using $c_(upright(v)) tilde.eq 3$ near freezing we get a formula similar to that of minimal thermal conductivity model proposed by Cahill and Pohl~[#link(<ref-33>)[33], #link(<ref-34>)[34]] for amorphous solids.

Equation (@Cahill1) can be applicable to liquids with conventional acoustic dispersion relation of the longitudinal collective mode, but should not be used when dispersion is non-acoustic (e.g. in the case of Coulomb one-component plasma and weakly screened Yukawa systems). In such cases actual dispersion relations can be used to perform averaging~[#link(<ref-14>)[14], #link(<ref-8>)[8]]). Another complication arises due to the presence of the so called $k$-gap (zero-frequency domain at sufficiently long wavelengths) in the dispersion relation of the liquid transverse mode, which has received considerable attention in recent years~[#link(<ref-35>)[35], #link(<ref-36>)[36], #link(<ref-37>)[37], #link(<ref-38>)[38], #link(<ref-39>)[39], #link(<ref-40>)[40]]. The effect of $k$-gap in the transverse mode has not yet been discussed in detail in the context of the vibrational paradigm of transport properties in liquids and will not be addressed here.

Formula (@Cahill1) provides a good compromise between simplicity and accuracy. Notably, it does not contain free parameters and adjustable coefficients.

One of us demonstrated previously that Eq.~(@Cahill1) applies reasonably well to dense Lennard-Jones (LJ) fluids~[#link(<ref-1>)[1]]. However, only a single exemplary slightly supercritical isotherm was considered in that work. The purpose of this paper is to provide a detailed and extensive verification of its applicability domain and accuracy level across the LJ fluid phase diagram. We demonstrate that for the LJ fluid, Eq.~(@Cahill1) allows to express the thermal conductivity coefficient in terms of thermodynamic properties such as specific heat, excess internal energy, and excess pressure. An appropriate equation of state is then used to evaluate the thermal conductivity coefficient and to quantify the accuracy of the approach. This is a remarkable example of a direct relation between transport and thermodynamics. The applicability domain is defined with reference to a gas-to-liquid dynamical crossover in supercritical fluids (Frenkel line in the phase diagram), which represents an important current research topic. Finally, we reiterate our recent freezing density scaling approach to transport properties~[#link(<ref-41>)[41], #link(<ref-42>)[42], #link(<ref-19>)[19]], and put forward an #emph[ad hoc] expression for the thermal conductivity coefficient. Overall, the results reported represent an important step toward better understanding main mechanisms and peculiarities of transport phenomena in the liquid state.

= Methods
<methods>
The LJ model is one of the most popular and best studied systems in condensed matter research. It combines relative simplicity with adequate representation (at least at the qualitative level) of interatomic interactions in real substances, exhibiting steep short-range repulsion and softer long-range attraction. The LJ potential is

#math.equation(block: true, numbering: none, $ phi.alt \( r \) = 4 epsilon.alt [(sigma / r)^12 - (sigma / r)^6] \, $)

where $epsilon.alt$ and $sigma$ are the energy and length scales (or LJ units). The reduced density and temperature expressed in LJ units are $rho^(*) = rho sigma^3$, $T^(*) = T \/ epsilon.alt$.

Transport properties of the LJ system have been extensively studied in the literature. Recent overview of available simulation data can be found in Refs.~[#link(<ref-43>)[43], #link(<ref-44>)[44], #link(<ref-45>)[45]]. Particularly extensive and useful datasets have been published by Meier #emph[et al.]~[#link(<ref-46>)[46], #link(<ref-47>)[47], #link(<ref-48>)[48]] and by Baidakov #emph[et al.]~[#link(<ref-49>)[49], #link(<ref-50>)[50], #link(<ref-51>)[51]]. Transport data have been tabulated along different isotherms in a wide regions of the LJ system phase diagram. Good agreement between the two datasets for overlapping regimes has been reported~[#link(<ref-44>)[44]]. Previously, we used the numerical results of Meier~[#link(<ref-46>)[46]] to demonstrate the adequacy of Eq.~(@Cahill1). Using the data for the thermal conductivity coefficient, specific heat, reduced energy and pressure along a single close-critical isotherm $T^(*) = 1.35$ tabulated in Ref.~[#link(<ref-47>)[47]] we documented a very good accuracy of Eq.~(@Cahill1) in the dense liquid regime. Here we first make use of the thermal conductivity data from Ref.~[#link(<ref-51>)[51]], which cover a rather extended area on the LJ system phase diagram.

#figure(image("graphics/LJ_PD.png", width: 8.5cm),
  caption: [
    \(Color online) Phase diagram of the LJ system on the density-temperature plane ($rho^(*)$, $T^(*)$). The squares correspond to the fluid-solid coexistence boundaries as tabulated in Refs.~[#link(<ref-52>)[52]], the fluid-solid coexistence curves are simple fits by Eq.~(@fit_freezing). The liquid-vapour coexistence boundary is plotted using the formulas provided in Ref.~[#link(<ref-53>)[53]]. The reduced triple point and critical temperatures are $T_(upright(t r))^(*) tilde.eq 0.69$~[#link(<ref-52>)[52]] and $T_(upright(c))^(*) tilde.eq 1.33$~[#link(<ref-53>)[53]], respectively. The crosses correspond to the state points investigated in Ref.~[#link(<ref-51>)[51]]. Only data points with the temperature above the triple point are considered. The dashed line corresponding to a fixed reduced density $rho \/ rho_(upright(f r)) tilde.eq 0.6$ marks the onset of the vibrational model applicability (for further details see the text).
  ]
)
<FigLJ_PD>

The phase diagram of LJ system is shown in Fig.~@FigLJ_PD. Here the solid-liquid coexistence data are taken from Ref.~[#link(<ref-52>)[52]]. For convenience, they are fitted by simple expressions

$ T_(upright(f r))^(*) & tilde.eq 2.111 \( rho^(*) \)^4 - 0.615 \( rho^(*) \)^2 \,\
T_(upright(m))^(*) & tilde.eq 1.988 \( rho^(*) \)^4 - 1.019 \( rho^(*) \)^2 \, $ <fit_freezing>

where subscripts "$upright(f r)$" and "$upright(m)$" denote freezing and melting. respectively. The functional form of these expressions arises in various simple approaches to fluid-solid coexistence in the LJ model~[#link(<ref-54>)[54], #link(<ref-55>)[55], #link(<ref-56>)[56], #link(<ref-57>)[57], #link(<ref-58>)[58], #link(<ref-59>)[59]]. The liquid-vapour coexistence boundary is plotted using the formulas provided in Ref.~[#link(<ref-53>)[53]]. The crosses are the state points for which the thermal conductivity coefficients was numerically evaluated by means of equilibrium molecular dynamics with the use of the Green-Kubo formalism in Ref.~[#link(<ref-51>)[51]]. Some of investigated state points correspond to metastable regions: superheated and supercooled liquids, supersaturated vapour. Here we only consider state points with the temperature above the triple point temperature (lower temperatures are not relevant because they are beyond the applicability limits of the vibrational model). An additional dashed line marks the onset of validity of the vibrational model. This was identified in Ref.~[#link(<ref-7>)[7]] from the analysis of the Stokes-Einstein (SE) product $D eta \( Delta \/ T \)$, where $D$ is the self-diffusion coefficient and $eta$ is the shear viscosity coefficient. At low densities the SE product scales as $\( rho^(*) \)^(- 4 \/ 3)$ as it should in the gaseous regime. However, it approaches a constant asymptotic value of $tilde.eq 0.15$ at sufficiently high densities, not too far from that at freezing. The two asymptotes intersect at $rho \/ rho_(upright(f r)) tilde.eq 0.35$ and this can be considered as an indication of the gas-to-fluid dynamical crossover~[#link(<ref-60>)[60]]. At about twice this density, $rho \/ rho_(upright(f r)) gt.tilde 0.6$, the SE product becomes practically constant and this can be identified as a lower boundary of the validity of the SE relation and hence of the vibrational picture of atomic dynamics~[#link(<ref-7>)[7]]. Note, that the analysis of various model systems (such as Lennard-Jones, Coulomb, Yukawa) indicated that the onset of validity of vibrational dynamics corresponds to nearly the same value of excess entropy, $s_(upright(e x)) tilde.eq - 2$~[#link(<ref-7>)[7]], and this can be considered as a more general condition of the validity of the vibrational model.

The numerical results for the thermal conductivity coefficient are traditionally expressed in LJ units as

$ lambda^(*) = frac(lambda sigma^2, k_(upright(B))) (m / epsilon.alt)^(1 \/ 2) . $ <LJunits>

Since we measure temperature in energy units, the Boltzmann constant $k_(upright(B))$ should disappear. Also, we find it more convenient to work with macroscopically reduced units (sometimes referred to as Rosenfeld's normalization~[#link(<ref-61>)[61]]). This is particularly advantageous when comparing transport properties of different systems~[#link(<ref-62>)[62], #link(<ref-61>)[61], #link(<ref-63>)[63]]. The macroscopically reduced thermal conductivity coefficient reads

$ lambda_(upright(R)) = lambda rho^(- 2 \/ 3) (m / T)^(1 \/ 2) . $ <Rnorm>

From Eqs.~(@LJunits) and (@Rnorm) a trivial relation emerges

$ lambda_(upright(R)) = frac(lambda^(*), \( T^(*) \)^(1 \/ 2) \( rho^(*) \)^(2 \/ 3)) . $ <Relation>

This relation has been used to evaluate $lambda_(upright(R))$ from the available numerical results.

To compare with the vibrational mechanism of heat transfer, the longitudinal and transverse instantaneous sound velocities have to be evaluated. For the LJ system these can be expressed using the excess energy and pressure of the system as demonstrated by Zwanzig and Mountain~[#link(<ref-64>)[64]] (see also Ref.~[#link(<ref-65>)[65]] for further details):

$ c_l^2 / v_(upright(T))^2 = 3 - 72 / 5 u_(upright(e x)) + 11 p_(upright(e x)) \, $ <cl>

$ c_t^2 / v_(upright(T))^2 = 1 - 24 / 5 u_(upright(e x)) + 3 p_(upright(e x)) . $ <ct>

Here $u_(upright(e x)) = U \/ N T - 3 \/ 2$ is the excess internal energy, $p_(upright(e x)) = P \/ rho T - 1$ is the excess pressure, $U$, $P$, and $N$ being the internal energy, pressure, and the number of atoms, respectively. The sound velocities are expressed in units of the thermal velocity $v_(upright(T)) = sqrt(T \/ m)$. It is a simple exercise to verify that Cauchy relation is satisfied in this approach:

#math.equation(block: true, numbering: none, $ (c_l / v_(upright(T)))^2 - 3 (c_t / v_(upright(T)))^2 = 2 p_(upright(e x)) . $)

In order to evaluate the sound velocities, an appropriate equation of state (EoS) is required. A large number of different EOS of have been proposed in the literature to describe thermodynamic properties of LJ fluids (see e.g. Refs. [#link(<ref-66>)[66], #link(<ref-67>)[67]] for review). Here we use the equation of state developed by Thol #emph[et al].~[#link(<ref-68>)[68]]. This is an empirical equation of state, formulated in terms of the Helmholtz free energy and based on a large molecular simulation data set and thermal virial coefficients. Its applicability range $0.7 < T^(*) < 9$, $rho^(*) < 1.08$ is sufficient for the present purpose. This EoS demonstrates reasonable level of accuracy when compared to others~[#link(<ref-67>)[67]], is relatively simple and convenient in implementation. We use Thol #emph[et al]. EoS to calculate the specific heat $c_(upright(v))$, excess pressure $p_(upright(e x))$ and energy $u_(upright(e x))$. From the latter thermodynamic quantities the sound velocities $c_l$ and $c_t$ are calculated. This is all input needed to calculate the thermal conductivity coefficient from Eq.~(@Cahill1). Thus, application of the vibrational model to LJ fluids represents a remarkable example when a transport property (thermal conductivity in the considered case) is determined explicitly by thermodynamic quantities and knowledge of EoS is sufficient to calculate it. In Section~@Results we will see how well theory compares with results from numerical simulations.

#figure(image("graphics/Theor_vs_MD.png", width: 17cm),
  caption: [
    \(Color online) Reduced thermal conductivity coefficient $lambda_(upright(R))$ of the Lennard-Jones fluid as a function of the reduced density $rho^(*)$. Results for eight isotherms are shown: $T^(*) = 0.7$ (a), 0.85 (b), 1.0(c), 1.15 (d), 1.2 (e), 1.3 (f), 1.5 (g), and 2.0 (h). The circles denote the numerical results from Ref.~[#link(<ref-51>)[51]], the solid curves are calculated by means of vibrational model using Eq.~(@Cahill1), as discussed in the text. The shaded regions in each figure mark the conditions of applicability of the theory.
  ]
)
<Compar>

= Results
<Results>
Figure~@Compar demonstrates the comparison between the vibrational model, as calculated using Eq.~(@Cahill1) complemented by the thermodynamic quantities from Thol #emph[et al]. EoS~[#link(<ref-68>)[68]], with the MD results from Baidakov #emph[et al].~[#link(<ref-51>)[51]]. The circles correspond to the results from MD simulation. We have selected only the isotherms with $T^(*) > T_(upright(t p))^(*)$, where vibrational model makes sense and Thol~#emph[et al]. EoS is applicable. We have also considered supercritical densities for which the vibrational model might be adequate. For this reason we, have omitted the two isotherms $T^(*) = 1.25$ and $T^(*) = 1.35$ for which only irrelevant low-density data are available. The remaining data for eight isotherms are depicted in Fig.~@Compar (a)-(h). The solid curves in each figure correspond to our theoretical calculation.

The shaded regions in each figure correspond to the regime of applicability of the present model. From the side of high densities the applicability is limited by the fluid boundary of the fluid-solid coexistence. From the side of low densities the onset of the applicability is either the condition $rho \/ rho_(upright(f r)) tilde.eq 0.6$ where vibrational picture is adequate or the liquid boundary of the gas-liquid coexistence. Although metastable state points are present in Fig.~@Compar they should not be used to judge the applicability of the vibrational model. Neither the model itself was designed to deal with coexisting phases, nor the EoS from Ref.~[#link(<ref-68>)[68]] can be expected to be reliable there.

#figure(image("graphics/Accuracy.png", width: 8cm),
  caption: [
    \(Color online) Relative disagreement between theory \[Eq.~(@Cahill1)\] and MD simulations of Ref.~[#link(<ref-51>)[51]]. The quantity $\( lambda_(upright(T h e o r y)) - lambda_(upright(M D)) \) \/ lambda_(upright(T h e o r y))$ is plotted as a function of the reduced density $rho^(*)$ for eight isotherms. Only the state points within the applicability regime of the theoretical model are considered.
  ]
)
<Accuracy>

Careful examination of eight panels in Fig.~@Compar demonstrates a very good agreement between the theoretical calculation and MD simulation in the regime where theory is applicable. This is further quantified in Fig.~@Accuracy. Relative deviations are typically limited by few percent, increasing to $tilde.eq 5 %$ towards the boundaries of the applicability domain. Some simulation data for the thermal conductivity reported previously have considerably larger standard deviations compared to the observed deviations (see e.g. Table II in Ref.~[#link(<ref-69>)[69]]). For this reason the agreement can be considered as excellent, especially taking into account that the theoretical model does not contain any free adjustable parameters.

To reinforce this conclusion and demonstrate that the documented agreement is not the result of some fortunate coincidence, we have performed an additional comparison using the set of simulation data reported by Galliero and Boned~[#link(<ref-70>)[70]]. The purpose is two-fold. First, in contrast to Ref.~[#link(<ref-51>)[51]], Galliero and Boned employed #emph[non-equilibrium] molecular dynamics simulations to obtain thermal conductivity of LJ fluids. In this way, we can potentially quantify discrepancies between different methods, if such exist. Second, the data set from Ref.~[#link(<ref-70>)[70]] covers considerably higher range of temperatures and hence we can verify whether the vibrational model remains meaningful as the temperature further increases. Figure~@Galliero presents the comparison between the theory and non-equilibrium simulations. We observe that for $rho^(*) gt.tilde 0.6$ the deviation between theory and numerical experiment is mostly within numerical data uncertainty. For a common temperature $T^(*) = 2$ the theoretical model compares equally well with equilibrium and non-equilibrium simulations, demonstrating no major discrepancies between the two latter. For higher temperatures there is no any sign that the theory may behave inappropriately.

#figure(image("graphics/ComparGalliero.png", width: 8cm),
  caption: [
    \(Color online) Reduced thermal conductivity coefficient $lambda_(upright(R))$ of the Lennard-Jones fluid as a function of the reduced density $rho^(*)$. The symbols denote the numerical results from the non-equilibrium simulations in Ref.~[#link(<ref-70>)[70]]. The solid curves are calculated using Eq.~(@Cahill1).
  ]
)
<Galliero>

Thus, where applicable the vibrational model of heat transport agrees very well with the results from different numerical simulations. Yet, there is another practical approach -- the freezing density scaling (FDS) -- which allows to predict the transport properties, including the thermal conductivity coefficient, in an even wider parameter regime. We would like to use this opportunity and reiterate the application of FDS scaling to the thermal conductivity coefficient of the LJ fluid. Section~@SecFDS serves this purpose.

= Freezing density scaling
<SecFDS>
It has been recently demonstrated that macroscopically reduced self-diffusion, shear viscosity, and thermal conductivity coefficients of LJ fluids along isotherms exhibit quasi-universal scaling on the density divided by its value at the freezing point, $rho_(upright(f r))$~[#link(<ref-41>)[41]]. Originally considered as a useful empirical observation~[#link(<ref-41>)[41]], it has been later discussed in the context of quasi-universal excess entropy scaling and isomorph theory~[#link(<ref-42>)[42], #link(<ref-19>)[19], #link(<ref-71>)[71]]. FDS approach implies that the transport coefficients are functions of a single variable $rho \/ rho_(upright(f r))$, and thus it represents a very convenient corresponding states principle to estimate transport properties in LJ fluids. Importantly, it has been shown that FDS holds even at quite low densities where neither the original form of the excess entropy scaling nor the isomorph theory are expected to work. Additionally, the functional form of the FDS scaling is similar (although not identical) to that in the hard-sphere fluid. Thus, it can be expected that FDS is not a special property of LJ fluids, but applies (possibly with some modifications) to a wider class of fluids.

#figure(image("graphics/FDS.png", width: 8cm),
  caption: [
    \(Color online) Reduced thermal conductivity coefficient $lambda_(upright(R))$ vs reduced density $rho \/ rho_(upright(f r))$ demonstrating the success of the freezing density scaling of transport coefficients. Symbols correspond to the numerical data from Baidakov #emph[et al]~[#link(<ref-51>)[51]]. along different isotherms (see the label). The solid curve corresponds to a quasi-universal fit of Eq.~(@fiteq).
  ]
)
<FDS>

Detailed analysis of the numerical dataset from Ref.~[#link(<ref-51>)[51]] has been further extended to reinforce the FDS concept. The results are shown in Fig.~@FDS, demonstrating that the data tend to collapse on a universal master curve. The only region where the FDS fails is the vicinity of the critical point, where critical enhancement of the thermal conductivity coefficient becomes important. For the dataset produced in Ref.~[#link(<ref-51>)[51]] this concerns only a few data points, mostly on the near-critical isotherm $T^(*) = 1.3$ (see Fig.~@FDS). Importantly, FDS approach seemingly works well for metastable state points, which are also shown in Fig.~@FDS. No clear distinction between thermodynamically stable and metastable states can be seen. Also, it is remarkable that the FDS approach applies to rather low densities. This is rather unexpected, because at such low densities it is natural to assume that any ”memory” about the location of the fluid-solid phase transition and the freezing density is completely lost. However, it is necessary to remark that in the low-density gaseous regime established methods to calculate the transport cross sections and the transport properties of the LJ system do exist (see e.g. Refs.~[#link(<ref-72>)[72], #link(<ref-73>)[73], #link(<ref-74>)[74], #link(<ref-75>)[75], #link(<ref-76>)[76], #link(<ref-77>)[77], #link(<ref-78>)[78]] and references therein for some related works).

The appealing quasi-universality of the data shown in Fig.~@FDS calls for an appropriate mathematical description. Among various fitting functions that we attempted, a particularly simple but appropriate form is provided by

$ lambda_(upright(R)) = alpha / cal(R)^(2 \/ 3) + beta + gamma cal(R)^delta . $ <fiteq>

Here $cal(R)$ is the density ratio, $cal(R) = rho \/ rho_(upright(f r))$. The first term is chosen as to provide a correct asymptote of the thermal conductivity coefficient in the low-density limit, $lambda_(upright(R)) prop \( rho^(*) \)^(- 2 \/ 3)$~[#link(<ref-41>)[41]]. Furthermore, $alpha$, $beta$, $gamma$, and $delta$ are the fitting coefficients. Based on the dataset for the supercritical isotherm $T^(*) = 2$, the coefficients $alpha tilde.eq 0.43$, $beta tilde.eq 1.18$, $gamma tilde.eq 8.39$, and $delta tilde.eq 2.30$ have been obtained. The solid curve in Fig.~@FDS represents this fit. It is representative for other isotherms, except those very near the critical temperature, because the critical enhancement is not accounted for. Importantly, it appears also representative for all metastable state points that were investigated in Ref.~[#link(<ref-51>)[51]].

= Conclusion
<conclusion>
Thermal conductivity is an important characteristic of a material. While this property is relatively well understood in gases, solids and plasmas, the same cannot be said about liquids. In this paper we have considered the Lennard-Jones fluid as an important simple model system to investigate the applicability limits and check the accuracy of theoretical approaches to the thermal conductivity coefficient. This program has been realised with the help of an extensive MD simulation datasets provided by Baidakov #emph[et al].~[#link(<ref-51>)[51]] and Galliero and Boned~[#link(<ref-70>)[70]].

Two theoretical methods have been highlighted in this paper. The first one -- the vibrational paradigm of heat transfer -- leads to an expression \[Eq.~(@Cahill1)\], which relates the thermal conductivity coefficient to the thermodynamic properties of the LJ fluid. Although very simplistic and to some extent naive, the vibrational model is able to describe the numerical data on the thermal conductivity coefficient with a remarkable accuracy. No adjustable parameters are involved and the theoretical calculation requires only the input from thermodynamics. The applicability region spans from the gas-liquid coexistence boundary to the liquid-solid coexistence boundary for subcritical temperatures and from a constant density ratio $rho \/ rho_(upright(f r)) tilde.eq 0.6$ to the fluid-solid coexistence boundary for supercritical temperatures.

The second method is the corresponding state principle, based on the freezing density scaling approach. This is more intuitive approach, although solid relations to the excess entropy scaling and the isomorph theory do exist. The FDS approach implies that the reduced thermal conductivity coefficients depends quasi-universally on the density reduced by its value at the freezing point (at a given temperature). The applicability domain of the FDS approach covers almost the entire gas-liquid-fluid region in the LJ system phase diagram (probably excluding very low densities and deep gas-liquid coexistence region). It is applicable even to metastable regions of superheated and supercooled liquids and supersaturated vapour. This can make the FDS approach a very useful practical tool to estimate the thermal conductivity coefficient under various conditions and a tentative fitting formula is provided for this purpose. The only domain where FDS clearly fails is the close vicinity of the critical point, because it does not account for critical enhancement.

Overall, the reported results shed new light on the properties and mechanisms of heat transport in liquids and provide new accurate methods for the estimation of the thermal conductivity coefficient. This can be of interest for researchers in condensed matter, physics of fluids, materials science and beyond.

The authors have no conflicts of interest to disclose.

Data sharing is not applicable to this article as no new data were created or analyzed in this study.

#set heading(numbering: none)
= References

#par[[1] S.~A.~Khrapak,~"Vibrational model of thermal conduction for fluids with soft interactions,"~#link("https://doi.org/10.1103/physreve.103.013207")[Phys. Rev. E~#strong[103],~013207 (2021a)].] <ref-1>

#par[[2] Y.~Frenkel,~#link("https://cds.cern.ch/record/106808")[#emph[Kinetic theory of liquids]]~(Dover,~New York, NY,~1955).] <ref-2>

#par[[3] F.~H.~Stillinger~and~T.~A.~Weber,~"Hidden structure in liquids,"~#link("https://doi.org/10.1103/physreva.25.978")[Phys. Rev. A~#strong[25],~978--989 (1982)].] <ref-3>

#par[[4] R.~Zwanzig,~"On the relation between self-diffusion and viscosity of liquids,"~#link("https://doi.org/10.1063/1.446338")[J. Chem. Phys.~#strong[79],~4507--4508 (1983)].] <ref-4>

#par[[5] S.~Khrapak,~"Vibrational model of heat conduction in a fluid of hard spheres,"~#link("https://doi.org/10.3390/app12157939")[Appl. Sci.~#strong[12],~7939 (2022a)].] <ref-5>

#par[[6] L.~Costigliola, D.~M.~Heyes, T.~B.~Schrøder, ~and~J.~C.~Dyre,~"Revisiting the Stokes-Einstein relation without a hydrodynamic diameter,"~#link("https://doi.org/10.1063/1.5080662")[J. Chem. Phys.~#strong[150],~021101 (2019)].] <ref-6>

#par[[7] S.~A.~Khrapak~and~A.~G.~Khrapak,~"Excess entropy and Stokes-Einstein relation in simple fluids,"~#link("https://doi.org/10.1103/physreve.104.044110")[Phys. Rev. E~#strong[104],~044110 (2021a)].] <ref-7>

#par[[8] S.~A.~Khrapak,~"Self-diffusion in simple liquids as a random walk process,"~#link("https://doi.org/10.3390/molecules26247499")[Molecules~#strong[26],~7499 (2021b)].] <ref-8>

#par[[9] A.~Zaccone~and~M.~Baggioli,~"Universal law for the vibrational density of states of liquids,"~#link("https://doi.org/10.1073/pnas.2022303118")[Proc. Natl. Acad. Sci.~#strong[118],~e2022303118 (2021)].] <ref-9>

#par[[10] C.~Stamper, D.~Cortie, Z.~Yue, X.~Wang, ~and~D.~Yu,~"Experimental confirmation of the universal law for the vibrational density of states of liquids,"~#link("https://doi.org/10.1021/acs.jpclett.2c00297")[J. Phys. Chem. Lett.~#strong[13],~3105--3111 (2022)].] <ref-10>

#par[[11] M.~R.~Rao,~"Thermal conductivity of liquids,"~#link("https://doi.org/10.1103/physrev.59.212")[Phys. Rev.~#strong[59],~212--212 (1941)].] <ref-11>

#par[[12] J.~K.~Horrocks~and~E.~McLaughlin,~"Thermal conductivity of simple molecules in the condensed state,"~#link("https://doi.org/10.1039/tf9605600206")[Trans. Faraday Soc.~#strong[56],~206 (1960)].] <ref-12>

#par[[13] J.~Horrocks~and~E.~McLaughlin,~"Temperature dependence of the thermal conductivity of liquids,"~#link("https://doi.org/10.1039/tf9635901709")[Trans. Faraday Soc.~#strong[59],~1709 (1963)].] <ref-13>

#par[[14] S.~A.~Khrapak,~"Thermal conduction in two-dimensional complex plasma layers,"~#link("https://doi.org/10.1063/5.0038078")[Phys. Plasmas~#strong[28],~010704 (2021c)].] <ref-14>

#par[[15] S.~A.~Khrapak,~"Thermal conductivity of strongly coupled Yukawa fluids,"~#link("https://doi.org/10.1063/5.0056763")[Phys. Plasmas~#strong[28],~084501 (2021d)].] <ref-15>

#par[[16] S.~A.~Khrapak,~"Vibrational model of heat transfer in strongly coupled Yukawa fluids (dusty plasma liquids),"~#link("https://doi.org/10.1134/s1063780x22600876")[Plasma Phys. Rep.~#strong[49],~15--22 (2023a)].] <ref-16>

#par[[17] E.~N.~da~C.~Andrade,~"Viscosity and thermal conductivity of liquid argon,"~#link("https://doi.org/10.1038/170794b0")[Nature~#strong[170],~794--794 (1952)].] <ref-17>

#par[[18] S.~A.~Khrapak~and~A.~G.~Khrapak,~"Minima of shear viscosity and thermal conductivity coefficients of classical fluids,"~#link("https://doi.org/10.1063/5.0082465")[Phys. Fluids~#strong[34],~027102 (2022a)].] <ref-18>

#par[[19] S.~A.~Khrapak~and~A.~G.~Khrapak,~"Freezing density scaling of fluid transport properties: Application to liquefied noble gases,"~#link("https://doi.org/10.1063/5.0096947")[J. Chem. Phys.~#strong[157],~014501 (2022b)].] <ref-19>

#par[[20] S.A.~Khrapak,~"Bridgman formula for the thermal conductivity of atomic and molecular liquids,"~#link("https://doi.org/10.1016/j.molliq.2023.121786")[J. Mol. Liq.~#strong[381],~121786 (2023b)].] <ref-20>

#par[[21] P.~W.~Bridgman,~"The thermal conductivity of liquids under pressure,"~#link("https://doi.org/10.2307/20026073")[PNAAS~#strong[59],~141 (1923)].] <ref-21>

#par[[22] A.~Z.~Zhao, M.~C.~Wingert, R.~Chen, ~and~J.~E.~Garay,~"Phonon gas model for thermal conductivity of dense, strongly interacting liquids,"~#link("https://doi.org/10.1063/5.0040734")[J. Appl. Phys.~#strong[129],~235101 (2021)].] <ref-22>

#par[[23] Q.~Xi, J.~Zhong, J.~He, X.~Xu, T.~Nakayama, Y.~Wang, J.~Liu, J.~Zhou, ~and~B.~Li,~"A ubiquitous thermal conductivity formula for liquids, polymer glass, and amorphous solids,"~#link("https://doi.org/10.1088/0256-307x/37/10/104401")[Chin. Phys. Lett.~#strong[37],~104401 (2020)].] <ref-23>

#par[[24] R.~B.~Bird, E.~N.~Lightfoot, ~and~W.~E.~Stewart,~ #emph[Transport Phenomena -]~(J. Wiley,~New York,~2002).] <ref-24>

#par[[25] S.~A.~Khrapak~and~A.~G.~Khrapak,~"Sound velocities in liquids near freezing: Dependence on the interaction potential and correlations with thermal conductivity,"~#link("https://doi.org/10.1063/5.0157945")[Phys. Fluids~#strong[35],~077129 (2023)].] <ref-25>

#par[[26] J.-P.~Hansen~and~I.~R.~McDonald,~ #emph[Theory of Simple Liquids -]~(Elsevier,~Amsterdam,~2006).] <ref-26>

#par[[27] U.~Balucani~and~M.~Zoppi,~ #emph[Dynamics of the Liquid State]~(Clarendon Press,~Oxford,~1994).] <ref-27>

#par[[28] H.~Ohta~and~S.~Hamaguchi,~"Wave dispersion relations in Yukawa fluids,"~#link("https://doi.org/10.1103/physrevlett.84.6026")[Phys. Rev. Lett.~#strong[84],~6026--6029 (2000)].] <ref-28>

#par[[29] S.~Hosokawa, M.~Inui, Y.~Kajihara, S.~Tsutsui, ~and~A.~Q.~R.~Baron,~"Transverse excitations in liquid Fe, Cu and Zn,"~#link("https://doi.org/10.1088/0953-8984/27/19/194104")[J. Phys.: Condens. Matter~#strong[27],~194104 (2015)].] <ref-29>

#par[[30] T.~Bryk, A.~Huerta, V.~Hordiichuk, ~and~A.~D.~Trokhymchuk,~"Non-hydrodynamic transverse collective excitations in hard-sphere fluids,"~#link("https://doi.org/10.1063/1.4997640")[J. Chem. Phys.~#strong[147],~064509 (2017)].] <ref-30>

#par[[31] D.~Bolmatov, V.~V.~Brazhkin, ~and~K.~Trachenko,~"The phonon theory of liquid thermodynamics,"~#link("https://doi.org/10.1038/srep00421")[Sci. Rep.~#strong[2],~421 (2012)].] <ref-31>

#par[[32] S.~A.~Khrapak~and~S.~O.~Yurchenko,~"Entropy of simple fluids with repulsive interactions near freezing,"~#link("https://doi.org/10.1063/5.0063559")[J. Chem. Phys.~#strong[155],~134501 (2021)].] <ref-32>

#par[[33] D.~G.~Cahill~and~R.O.~Pohl,~"Heat flow and lattice vibrations in glasses,"~#link("https://doi.org/10.1016/0038-1098(89)90630-3")[Solid State Commun.~#strong[70],~927--930 (1989)].] <ref-33>

#par[[34] D.~G.~Cahill, S.~K.~Watson, ~and~R.~O.~Pohl,~"Lower limit to the thermal conductivity of disordered crystals,"~#link("https://doi.org/10.1103/physrevb.46.6131")[Phys. Rev. B~#strong[46],~6131--6140 (1992)].] <ref-34>

#par[[35] J.~Goree, Z.~Donkó, ~and~P.~Hartmann,~"Cutoff wave number for shear waves and Maxwell relaxation time in Yukawa liquids,"~#link("https://doi.org/10.1103/physreve.85.066401")[Phys. Rev. E~#strong[85],~066401 (2012)].] <ref-35>

#par[[36] C.~Yang, M.~T.~Dove, V.~V.~Brazhkin, ~and~K.~Trachenko,~"Emergence and evolution of the k-gap in spectra of liquid and supercritical states,"~#link("https://doi.org/10.1103/physrevlett.118.215502")[Phys. Rev. Lett.~#strong[118],~215502 (2017)].] <ref-36>

#par[[37] K.~Trachenko~and~V.~V.~Brazhkin,~"Collective modes and thermodynamics of the liquid state,"~#link("https://doi.org/10.1088/0034-4885/79/1/016502")[Rep. Progr. Phys.~#strong[79],~016502 (2015)].] <ref-37>

#par[[38] S.~A.~Khrapak, A.~G.~Khrapak, N.~P.~Kryuchkov, ~and~S.~O.~Yurchenko,~"Onset of transverse (shear) waves in strongly-coupled Yukawa fluids,"~#link("https://doi.org/10.1063/1.5088141")[J. Chem. Phys.~#strong[150],~104503 (2019)].] <ref-38>

#par[[39] N.~P.~Kryuchkov, L.~A.~Mistryukova, V.~V.~Brazhkin, ~and~S.~O.~Yurchenko,~"Excitation spectra in fluids: How to analyze them properly,"~#link("https://doi.org/10.1038/s41598-019-46979-y")[Sci. Rep.~#strong[9],~10483 (2019)].] <ref-39>

#par[[40] N.~P.~Kryuchkov~and~S.~O.~Yurchenko,~"Collective excitations in active fluids: Microflows and breakdown in spectral equipartition of kinetic energy,"~#link("https://doi.org/10.1063/5.0054854")[J. Chem. Phys.~#strong[155],~024902 (2021)].] <ref-40>

#par[[41] S.~A.~Khrapak~and~A.~G.~Khrapak,~"Transport properties of Lennard-Jones fluids: Freezing density scaling along isotherms,"~#link("https://doi.org/10.1103/physreve.103.042122")[Phys. Rev. E~#strong[103],~042122 (2021b)].] <ref-41>

#par[[42] S.~A.~Khrapak~and~A.~G.~Khrapak,~"Freezing temperature and density scaling of transport coefficients,"~#link("https://doi.org/10.1021/acs.jpclett.2c00408")[J. Phys. Chem. Lett.~#strong[13],~2674--2678 (2022c)].] <ref-42>

#par[[43] I.~H.~Bell, R.~Messerly, M.~Thol, L.~Costigliola, ~and~J.~C.~Dyre,~"Modified entropy scaling of the transport properties of the Lennard-Jones fluid,"~#link("https://doi.org/10.1021/acs.jpcb.9b05808")[J. Phys. Chem. B~#strong[123],~6345--6363 (2019)].] <ref-43>

#par[[44] K.~R.~Harris,~"Thermodynamic or density scaling of the thermal conductivity of liquids,"~#link("https://doi.org/10.1063/5.0016389")[J. Chem. Phys.~#strong[153],~104504 (2020)].] <ref-44>

#par[[45] J.~P.~Allers, J.~A.~Harvey, F.~H.~Garzon, ~and~T.~M.~Alam,~"Machine learning prediction of self-diffusion in Lennard-Jones fluids,"~#link("https://doi.org/10.1063/5.0011512")[J. Chem. Phys.~#strong[153],~034102 (2020)].] <ref-45>

#par[[46] K.~Meier,~ #emph[Computer Simulation and Interpretation of the Transport Coefficients of the Lennard-Jones Model Fluid (PhD Thesis)]~(Shaker,~Aachen,~2002).] <ref-46>

#par[[47] K.~Meier, A.~Laesecke, ~and~S.~Kabelac,~"Transport coefficients of the Lennard-Jones model fluid. I. Viscosity,"~#link("https://doi.org/10.1063/1.1770695")[J. Chem. Phys.~#strong[121],~3671--3687 (2004a)].] <ref-47>

#par[[48] K.~Meier, A.~Laesecke, ~and~S.~Kabelac,~"Transport coefficients of the Lennard-Jones model fluid. II. Self-diffusion,"~#link("https://doi.org/10.1063/1.1786579")[J. Chem. Phys.~#strong[121],~9526--9535 (2004b)].] <ref-48>

#par[[49] V.G.~Baidakov, S.P.~Protsenko, ~and~Z.R.~Kozlova,~"The self-diffusion coefficient in stable and metastable states of the LennardJones fluid,"~#link("https://doi.org/10.1016/j.fluid.2011.03.002")[Fluid Phase Equilibria~#strong[305],~106--113 (2011)].] <ref-49>

#par[[50] V.~G.~Baidakov, S.~P.~Protsenko, ~and~Z.~R.~Kozlova,~"Metastable Lennard-Jones fluids. I. Shear viscosity,"~#link("https://doi.org/10.1063/1.4758806")[J. Chem. Phys.~#strong[137],~164507 (2012)].] <ref-50>

#par[[51] V.~G.~Baidakov~and~S.~P.~Protsenko,~"Metastable Lennard-Jones fluids. II. Thermal conductivity,"~#link("https://doi.org/10.1063/1.4880958")[J. Chem. Phys.~#strong[140],~214506 (2014)].] <ref-51>

#par[[52] J.~M.~G.~Sousa, A.~L.~Ferreira, ~and~M.~A.~Barroso,~"Determination of the solid-fluid coexistence of the n - 6 Lennard-Jones system from free energy calculations,"~#link("https://doi.org/10.1063/1.4707746")[J. Chem. Phys.~#strong[136],~174502 (2012)].] <ref-52>

#par[[53] D.~M.~Heyes, D.~Dini, L.~Costigliola, ~and~J.~C.~Dyre,~"Transport coefficients of the Lennard-Jones fluid close to the freezing line,"~#link("https://doi.org/10.1063/1.5128707")[J. Chem. Phys.~#strong[151],~204502 (2019)].] <ref-53>

#par[[54] Y.~Rosenfeld,~"Additivity of melting curves,"~#link("https://doi.org/10.1016/0009-2614(76)80048-6")[Chem. Phys. Lett.~#strong[38],~591--593 (1976a)].] <ref-54>

#par[[55] Y.~Rosenfeld,~"Universality of melting and freezing indicators and additivity of melting curves,"~#link("https://doi.org/10.1080/00268977600102381")[Mol. Phys.~#strong[32],~963--977 (1976b)].] <ref-55>

#par[[56] S.~A.~Khrapak, M.~Chaudhuri, ~and~G.~E.~Morfill,~"Liquid-solid phase transition in the Lennard-Jones system,"~#link("https://doi.org/10.1103/physrevb.82.052101")[Phys. Rev. B~#strong[82],~052101 (2010)].] <ref-56>

#par[[57] S.~A.~Khrapak~and~G.~E.~Morfill,~"Accurate freezing and melting equations for the Lennard-Jones system,"~#link("https://doi.org/10.1063/1.3561698")[J. Chem. Phys.~#strong[134],~094108 (2011)].] <ref-57>

#par[[58] U.~R.~Pedersen, L.~Costigliola, N.~P.~Bailey, T.~B.~Schrøder, ~and~J.~C.~Dyre,~"Thermodynamics of freezing and melting,"~#link("https://doi.org/10.1038/ncomms12386")[Nature Commun.~#strong[7],~12386 (2016)].] <ref-58>

#par[[59] L.~Costigliola, T.~B.~Schrøder, ~and~J.~C.~Dyre,~"Freezing and melting line invariants of the Lennard-Jones system,"~#link("https://doi.org/10.1039/c5cp06363a")[Phys. Chem. Chem. Phys.~#strong[18],~14678--14690 (2016)].] <ref-59>

#par[[60] S.~A.~Khrapak,~"Gas-liquid crossover in the Lennard-Jones system,"~#link("https://doi.org/10.1063/5.0085181")[J. Chem. Phys.~#strong[156],~116101 (2022b)].] <ref-60>

#par[[61] Y.~Rosenfeld,~"A quasi-universal scaling law for atomic transport in simple fluids,"~#link("https://doi.org/10.1088/0953-8984/11/28/303")[J. Phys.: Condens. Matter~#strong[11],~5415--5427 (1999)].] <ref-61>

#par[[62] Y.~Rosenfeld,~"Relation between the transport coefficients and the internal entropy of simple systems,"~#link("https://doi.org/10.1103/physreva.15.2545")[Phys. Rev. A~#strong[15],~2545--2549 (1977)].] <ref-62>

#par[[63] S.~A.~Khrapak,~"Elementary vibrational model for transport properties of dense fluids,"~ Phys. Rep.~ (2023, submitted).] <ref-63>

#par[[64] R.~Zwanzig~and~R.~D.~Mountain,~"High-frequency elastic moduli of simple fluids,"~#link("https://doi.org/10.1063/1.1696718")[J. Chem. Phys.~#strong[43],~4464--4471 (1965)].] <ref-64>

#par[[65] S.~A.~Khrapak,~"Sound velocities of Lennard-Jones systems near the liquid-solid phase transition,"~#link("https://doi.org/10.3390/molecules25153498")[Molecules~#strong[25],~3498 (2020)].] <ref-65>

#par[[66] S.~Stephan, M.~Thol, J.~Vrabec, ~and~H.~Hasse,~"Thermophysical properties of the Lennard-Jones fluid: Database and data assessment,"~#link("https://doi.org/10.1021/acs.jcim.9b00620")[J. Chem. Informat. Model.~#strong[59],~4248--4265 (2019)].] <ref-66>

#par[[67] S.~Stephan, J.~Staubach, ~and~H.~Hasse,~"Review and comparison of equations of state for the Lennard-Jones fluid,"~#link("https://doi.org/10.1016/j.fluid.2020.112772")[Fluid Phase Equilibria~#strong[523],~112772 (2020)].] <ref-67>

#par[[68] M.~Thol, G.~Rutkai, A.~Köster, R.~Lustig, R.~Span, ~and~J.~Vrabec,~"Equation of state for the Lennard-Jones fluid,"~#link("https://doi.org/10.1063/1.4945000")[J. Phys. Chem. Ref. Data~#strong[45],~023101 (2016)].] <ref-68>

#par[[69] A.~E.~Nasrabad, R.~Laghaei, ~and~B.~C.~Eu,~"Molecular theory of thermal conductivity of the Lennard-Jones fluid,"~#link("https://doi.org/10.1063/1.2166394")[J. Chem. Phys.~#strong[124],~084506 (2006)].] <ref-69>

#par[[70] G.~Galliero~and~C.~Boned,~"Thermal conductivity of the Lennard-Jones chain fluid model,"~#link("https://doi.org/10.1103/physreve.80.061202")[Phys. Rev. E~#strong[80],~061202 (2009)].] <ref-70>

#par[[71] D.~M.~Heyes, D.~Dini, S.~Pieprzyk, ~and~A.~C.~Brańka,~"Departures from perfect isomorph behavior in Lennard-Jones fluids and solids,"~#link("https://doi.org/10.1063/5.0143651")[J. Chem. Phys.~#strong[158],~134502 (2023)].] <ref-71>

#par[[72] J.~O.~Hirschfelder, C.~F.~Curtiss, ~and~R.~B.~Bird,~ #emph[The Molecular Theory of Gases and Liquids -]~(Wiley,~New York,~1954).] <ref-72>

#par[[73] J.~O.~Hirschfelder, R.~B.~Bird, ~and~E.~L.~Spotz,~"The transport properties for non-polar gases,"~#link("https://doi.org/10.1063/1.1746696")[J. Chem. Phys.~#strong[16],~968--981 (1948)].] <ref-73>

#par[[74] F.~J.~Smith~and~R.~J.~Munn,~"Automatic calculation of the transport collision integrals with tables for the Morse potential,"~#link("https://doi.org/10.1063/1.1725768")[J. Chem. Phys.~#strong[41],~3560--3568 (1964)].] <ref-74>

#par[[75] S.~A.~Khrapak,~"Classical scattering in strongly attractive potentials,"~#link("https://doi.org/10.1103/physreve.89.032145")[Phys. Rev. E~#strong[89],~032145 (2014a)].] <ref-75>

#par[[76] S.~A.~Khrapak,~"Accurate transport cross sections for the Lennard-Jones potential,"~#link("https://doi.org/10.1140/epjd/e2014-50449-y")[Eur. Phys. J. D~#strong[68],~276 (2014b)].] <ref-76>

#par[[77] S.~U.~Kim~and~C.~W.~Monroe,~"High-accuracy calculations of sixteen collision integrals for Lennard-Jones (12-6) gases and their interpolation to parameterize neon, argon, and krypton,"~#link("https://doi.org/10.1016/j.jcp.2014.05.018")[J. Comput. Phys.~#strong[273],~358--373 (2014)].] <ref-77>

#par[[78] K.~R.~Kristiansen,~"Transport properties of the simple Lennard-Jones/spline fluid I: Binary scattering and high-accuracy low-density transport coefficients,"~#link("https://doi.org/10.3389/fphy.2020.00271")[Frontiers Phys.~#strong[8],~271 (2020)].] <ref-78>
