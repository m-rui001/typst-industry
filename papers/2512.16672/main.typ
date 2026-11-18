#set document(title: "Acoustic scattering singularities via quasi-bound states in the continuum")
#set page(paper: "us-letter", margin: (x: 19mm, y: 18mm), columns: 2, numbering: "1")
#set text(font: "Libertinus Serif", size: 10pt)
#set par(justify: true, leading: .53em)
#set math.equation(numbering: "(1)")
#set figure(placement: auto)
#show figure.caption: set text(size: 8.8pt)
#place(top, float: true, scope: "parent", clearance: 1em)[
  #align(center)[
    #text(size: 17pt, weight: "bold")[Acoustic scattering singularities via quasi-bound states in the continuum]
    #v(.5em)
    Anis Maddi, Mourad Oudich, Aurelien Merkel, Julio A. Iglesias Mart?nez, and Badreddine Assouar
    #v(.4em)
    #text(size: 9pt)[Universit? de Lorraine, CNRS, IJL, F-54000 Nancy, France \
    Mourad Oudich is also affiliated with Institut Universitaire de France, F-75231 Paris, France. \
    #link("mailto:anis.maddi@univ-lorraine.fr") ? #link("mailto:badreddine.assouar@univ-lorraine.fr")]
  ]
  #v(.55em)
  *Abstract.* Non-Hermitian systems enable advanced control of wave propagation by exploiting engineered losses. This introduces an additional degree of freedom that permits the emergence of exceptional points (EPs). In this letter, we theoretically and experimentally demonstrate the control of scattering singularities in a non-Hermitian acoustic system using quasi–bound states in the continuum (qBICs). Through Friedrich–Wintgen interference, the losses of a two-port cavity are tuned until achieving critical coupling, yielding narrowband coherent perfect absorption (CPA) with a quality factor of 140. Additionally, by coupling two distinct resonators, we observe the emergence of an EP, where both eigenvalues simultaneously coalesce and vanish, resulting in narrowband unidirectional absorption. Our results establish a connection between qBICs and scattering singularities, and offer a route toward acoustic devices featuring narrowband resonances and tunable radiative losses.
]

#emph[Introduction.---] In recent years, interest in the compelling
features of non-Hermitian Hamiltonians has grown substantially.
Non-Hermitian systems #[#link(<bib:ashida2020non>)[1], #link(<bib:el2018non>)[2]] describe non-conservative
dynamics induced by the presence of gain and loss elements. This surge
of interest stems from early work on parity--time (PT) symmetric
systems, which demonstrated that a careful balance between gain and loss
enables unconventional phenomena, such as invisible sensing
#[#link(<bib:fleury2015invisible>)[3]] and coherent perfect absorption--lasing
(CPA-lasing) #[#link(<bib:auregan2017pt>)[4]]#[#link(<bib:poignand2021parity>)[5]]. Inspired by these
developments, studies of non-Hermitian systems have expanded to explore
novel physics arising from exceptional points (EPs)
#[#link(<bib:wang2019extremely>)[6], #link(<bib:achilleos2017non>)[7]], where eigenvalues and eigenstates
coalesce, as well as robust wave transport induced by non-Hermitian
topology #[#link(<bib:ding2022non>)[8]]#[#link(<bib:zhang2021acoustic>)[9]]#[#link(<bib:maddi2024exact>)[10]].

Tailoring losses is essential for designing structures that manipulate
waves #[#link(<bib:jin20252024>)[11]]. In acoustics, minimizing these losses remains
challenging #[#link(<bib:cummer2016controlling>)[12]] and may constrain experimental
implementations of novel phenomena. In conventional systems, acoustic
resonances typically exhibit short lifetimes due to radiative and
viscothermal dissipation. A promising route to overcome this limitation
is provided by bound states in the continuum (BICs), which achieve high
quality factors ($Q$ factors) by strongly suppressing radiation leakage
#[#link(<bib:hsu2016bound>)[13]]. BICs are modes that exist within the continuum of
propagating modes but remain completely decoupled from the radiation
channels, resulting in localized modes. They can emerge through several
mechanisms #[#link(<bib:huang2022general>)[14], #link(<bib:an2024multibranch>)[15], #link(<bib:kronowetter2023realistic>)[16]],
such as Friedrich--Wintgen (FW) and Fabry--Pérot (FP) interferences.
When slightly disturbed, BICs become weakly coupled to the radiation
channels, thus turning into quasi-bound states in the continuum (qBICs).
Resonant structures supporting qBICs have been explored across multiple
physical platforms, including optical
#[#link(<bib:hsu2013observation>)[17], #link(<bib:plotnik2011experimental>)[18], #link(<bib:pankin2020one>)[19], #link(<bib:koshelev2019meta>)[20]],
acoustic
#[#link(<bib:marti2024observation>)[21], #link(<bib:farhat2024observation>)[22], #link(<bib:chen2023phonon>)[23], #link(<bib:kronowetter2025exceptional>)[24], #link(<bib:huang2020extreme>)[25], #link(<bib:krasikova2024acoustic>)[26], #link(<bib:zhang2023topological>)[27]],
and elastic systems #[#link(<bib:lee2023elastic>)[28]]#[#link(<bib:cao2021elastic>)[29]]#[#link(<bib:marti2023bound>)[30]].
Although qBICs have been employed in acoustics to realize several
resonance-based phenomena, their implementation for airborne absorption
problems has received limited attention, particularly in multi-port
systems.

CPA is an interesting strategy for waves absorption, as it enables the
complete suppression of outgoing waves in multi-port systems. CPA, also
known as anti-lasing, corresponds to a time-reversed spectral
singularity, occurring when the zero of the scattering matrix crosses
the real frequency axis. This condition is satisfied when the intrinsic
$gamma_(i n t)$ and radiative $gamma_(r a d)$ decay rates are perfectly
balanced $gamma_(r a d) = gamma_(i n t)$, a condition known as critical
coupling #[#link(<bib:maddi2025direct>)[31]]#[#link(<bib:huang2024acoustic>)[32]]#[#link(<bib:romero2016perfect>)[33]]. CPA
implementations in acoustics
#[#link(<bib:farooqui2022ultrathin>)[34], #link(<bib:baranov2017coherent>)[35], #link(<bib:olivier2022asymmetric>)[36], #link(<bib:achilleos2016coherent>)[37], #link(<bib:merkel2015control>)[38]]
typically rely on resonators with low $Q$ factors to match the strong
radiative leakage, which limits their potential for strong sound
confinement or their implementation as narrowband filters.

In this letter, we extend the framework of acoustic qBICs by
demonstrating their potential to exploit scattering singularities in the
form of CPA and an EP. We show that the combination of a qBIC and CPA in
an acoustic resonator yields narrowband perfect absorption, as
illustrated in @Fig1.(a). The critical coupling condition is
achieved by fine-tuning the resonator geometry, which controls FW
interference and the radiative decay rate. Experimentally, CPA via qBIC
is implemented in a rectangular cavity with two radiation channels,
yielding a sharp resonance with a $Q$ factor of $140$. Afterward, we
demonstrate the appearance of an EP using two distinct resonators (see
@Fig1.(b)). In this configuration, the eigenvalues of the
scattering matrix coalesce and simultaneously vanish, thereby combining
qBIC resonance with absorption at an EP. Experimentally, the setup
consists of two resonators coupled through an intermediate channel. At a
specific channel length, FP interference yields an EP, resulting in a
narrowband unidirectional absorption of 99%.

#figure(image("source/Figure1.pdf", width: 100.0%),
  caption: [
    Interplay between qBICs and absorption in two-port scattering
    problems with input $\( a_1 \, a_2 \)$ and output $\( b_1 \, b_2 \)$
    waves. (a) Resonator $Sigma_1$ with resonance frequency $f_0$,
    radiative $gamma_(r a d)$ and intrinsic $gamma_(i n t)$ decay rates.
    A conventional resonator under critical coupling conditions yields
    CPA when $gamma_(i n t) = gamma_(r a d)$ but typically with a
    moderate or low $Q$ factor. Once a qBIC is employed, the critical
    coupling condition can be satisfied with significantly lower
    $gamma_(r a d)$, resulting in narrowband absorption. (b) EP
    combining qBIC resonance and absorption using a system of coupled
    resonators $Sigma_1$ and $Sigma_2$. In this configuration, the
    eigenvalues and eigenvectors simultaneously vanishes, resulting in a
    unidirectional absorber. Waves impinging from the left are fully
    absorbed while waves propagating from the right are fully reflected.
  ]
)
<Fig1>

#emph[Loss control mechanism.---] To start, we consider the interaction
between two modes in a single open cavity operating above the first
cut-off frequency. This mode coupling, known as FW interference,
originates from mode interferences near an avoided degeneracy and can be
engineered by tuning the system's resonances, for instance, through
geometric modifications of the
cavity~#[#link(<bib:kronowetter2023realistic>)[16]]#[#link(<bib:huang2022general>)[14]]. In acoustics, such FW
interference has been reported to arise from the coupling between
rectangular cavity modes. Building on this concept, we investigate a
rectangular cavity of dimensions $L_x$, $L_y$, and $L_z$ connected to
two radiation channels, as illustrated in @Figure2\(a). For
simplicity, we restrict our analysis to the interaction between the
first two modes, $psi_10$ and $psi_01$, with resonance frequencies
$f_10 = c \/ \( 2 L_x \)$ and $f_01 = c \/ \( 2 L_y \)$, respectively,
and focus on operating frequencies below the cut-off of the radiation
channels.

The interaction between the first two acoustic modes is characterized
through an eigenfrequency analysis for varying cavity length $L_x$, with
$L_y = 94 upright("mm")$ and $L_z = 44 upright("mm")$, as shown in
@Figure2\(b,c). The numerical simulations are performed using the
commercial software COMSOL Multiphysics. As expected from a FW
resonance, the evolution of the resonance frequencies with respect to a
parametric change ($L_x$) exhibits an avoided crossing close to the
degeneracy point $L_x approx L_y$, as shown in @Figure2\(b). This
interaction strongly alters the radiative properties of the system,
giving rise to a hybridized mode with suppressed radiation losses.
Consequently, a narrowband resonance emerges, reaching a maximum $Q$
factor of $Q_(upright("max")) = 467$ at the optimal cavity length
$L_x = 93.6 thin upright("mm")$ (@Figure2\(c)).

The pronounced suppression of radiation losses leads to strong
confinement of acoustic energy inside the cavity, preventing it from
leaking into the surrounding channels. For instance, the mode shape (see
Fig. 2(d)) corresponds to the configuration resulting in the highest $Q$
factor and exhibits strong confinement within the cavity. The second
configuration (see Fig 2(e)) corresponds to the mode for $L_x = 91$ mm,
and displays similar features, namely a high $Q$ factor and
localization, albeit with a smaller $Q$ factor due to slight energy
leakage. In contrast, the mode at $L_x = 80$mm (see Fig. 2(f)) radiates
significantly more into the channels, resulting in a much lower $Q$
factor.

Therefore, by tuning the geometrical parameters, one can control the
radiation losses. This property is particularly appealing, as it
provides a means to precisely manipulate wave propagation. Such control
can be exploited in applications like wave absorption, where accurate
tuning of losses is essential.

#figure(image("source/Figure2.pdf", width: 100.0%),
  caption: [
    Formation of a qBIC in an acoustic cavity. (a) Cavity of dimension
    $L_x$, $L_y$ and $L_z$ with two radiation channels. (b) Resonance
    frequencies for varying cavity length $L_x$. The dashed lines
    represents the resonance frequencies $f_01$ and $f_10$ in the
    absence of coupling. (c) $Q$ factors for varying $L_x$. Insets
    (i--iii) represents the pressure field magnitude (mode shapes) for
    $L_x = 93.6 thin upright("mm")$, $L_x = 91 thin upright("mm")$, and
    $L_x = 80 thin upright("mm")$.
  ]
)
<Figure2>

#emph[CPA using qBIC.---] Let us consider a reciprocal and mirror
symmetric two-port acoustic system that can be described by a scattering
matrix $upright(bold(S))$. This matrix relates the outgoing waves
$v_(o u t)$ to the incoming waves $v_(i n)$ as follows,

$ underbrace(vec(b_2, b_1), v_(o u t)) = underbrace(mat(delim: "(", t, r; r, t), upright(bold(S))) underbrace(vec(a_1, a_2), v_(i n)) \, $

where $t$ and $r$ are the transmission and reflection coefficients,
respectively. The matrix has two eigenvalues
$lambda_plus.minus = r plus.minus t$ associated with the eigenvectors
$v_plus.minus = \[ 1 \, plus.minus 1 \]^T$.

In order to completely suppress the outgoing waves $v_(o u t)$, the
scattering matrix must satisfy the following eigenvalue problem,

$ upright(bold(S)) upright(bold(v)) = 0 $

This implies that at least one eigenvalue vanishes
$lambda_plus.minus = 0$, a condition that is satisfied when,

$ r = plus.minus t . $

This absorption mechanism, known as CPA, occurs when two incident waves
with an appropriate relative phase interfere destructively in the
outgoing channels. For this to happen, the resonator and radiation
channels need to be critically coupled, i.e. a perfect match between
intrinsic and radiative losses is required
$gamma_(r a d) = gamma_(i n t)$.

#figure(image("source/Figure3.pdf", width: 100.0%),
  caption: [
    Realization of CPA using qBIC resonance. (a) Eigenvalue
    $\| lambda_(-) \|^2$ as a function of the cavity length $L_x$ and
    frequency, where $lambda_(-) = t - r$. The red markers denote the
    points where CPA is realized via qBIC formation. The inset shows the
    eigenvalue for the lower red point ($L_x = 91$ mm). (b,c) Pressure
    distribution for asymmetrical (+,-) and symmetric input waves (+,+),
    with $L_x = 91$ mm. An asymmetrical input results in CPA with strong
    field localization inside the cavity, whereas a symmetrical input
    radiates strongly in the channels.
  ]
)
<num>

#figure(image("source/Figure4.pdf", width: 100.0%),
  caption: [
    Experimental validation of CPA using a qBIC resonator. (a) 3D
    printed cavity of inner dimensions $L_x = 90$mm, $L_y = 94$mm and
    $L_z = 44$ connected to two channels of inner diameter $29$mm. (b-d)
    Magnitude of the scattering parameters: (b) reflection coefficient
    $r$, (c) transmission coefficient $t$, and (d) the eigenvalue
    $\| lambda_(-) \|^2$. The blue and red colours represent the
    experimental and numerical results, respectively. The cross marker
    corresponds to the point where $r = t$.
  ]
)
<FIgExp>

A straightforward implication of the critical coupling condition is that
a conventional BIC (fully suppressed radiative leakage) cannot act as an
absorber, since it exhibits no radiation losses ($gamma_(r a d) = 0$).
However, as discussed in the previous section, tuning the cavity length
allows the adjustment of radiation losses, which could be employed for
the realization of a high $Q$ factor absorptive filter.

In the following, we show that by carefully controlling the balance
between intrinsic and radiative losses, the system can achieve CPA.
Throughout this analysis, the absorption properties are discussed via
the power matrix, $Pi$,

$ Pi = upright(bold(S))^dagger upright(bold(S)) \, $

whose eigenvalues $\| lambda_plus.minus \|^2$ are quantities directly
related to the dissipated power #[#link(<bib:auregan1999determination>)[39]]. For instance,
a value of $1$ indicates perfect energy conservation, whereas $0$
corresponds to complete absorption of the incident power.

The eigenvalue of the power matrix $\| lambda_(-) \|^2$ obtained by
varying the excitation frequency and cavity length $L_x$ is shown in
@num\(a). The black area indicates the parameter region where the
absorption is high. In particular, the eigenvalue completely vanishes
for two specific lengths, $L_x approx 96.5 thin upright("mm")$ and
$L_x approx 91 thin upright("mm")$. To highlight the absorption, the
eigenvalue $\| lambda_(-) \|^2$ for $L_x = 91 thin upright(m m)$ is
provided in the inset of @num\(a). Note that the other CPA
configuration ($L_x = 96.5 thin upright(m m)$) provides similar results
but with a frequency shift. At these configurations, the critical
coupling condition $gamma_(upright(r a d)) = gamma_(upright(i n t))$ is
satisfied through a reduction of radiation losses, leading to CPA with a
high $Q$ factor ($Q_(upright(C P A)) approx 224$).

The configurations capable of achieving CPA via qBICs can also be
deduced from the eigenfrequency analysis. In particular, the $Q$ factor
can be approximated as $Q_(upright(m a x)) \/ 2$, since the maximum $Q$
factor (see @Figure2\(c)) is primarily limited by intrinsic losses,
i.e., $Q_(upright(m a x)) approx 1 \/ \( 2 gamma_(upright(i n t)) \)$.
Introducing radiative losses to reach the critical coupling condition
reduces the $Q$ factor by roughly a factor of two. Furthermore, the
curve in @Figure2\(c) crosses $Q_(upright(m a x)) \/ 2$ at two
cavity lengths, consistent with the scattering analysis above.

Moreover, the CPA condition also requires the input waves to match the
corresponding eigenvectors. @num\(b--c) illustrates the pressure
field at the CPA point achieved for $L_x = 91$ mm under symmetric
(in-phase) and asymmetric (out of phase) excitations. In our setup, CPA
is realized when the input waves have a relative phase shift of $pi$, in
which case most of the energy is confined inside the cavity (see Fig.
3.b). By contrast, when a symmetric input is applied (Fig. 3.c),
corresponding to the eigenvector associated with $lambda_(+)$, the
energy is predominantly radiated into the channels. Therefore, a
symmetric input excites a radiant mode, whereas an asymmetric input
results in a CPA with strong confinement inside the cavity.

#emph[Experimental validation.---] In this section, the implementation
of CPA using a qBIC acoustic resonator is investigated experimentally.
The experimental setup is shown in @FIgExp\(a). It consists of a 3D
printed cavity made of polylactic acid (PLA), with dimensions
$L_x = 90 thin upright("mm")$, $L_y = 94 thin upright("mm")$, and
$L_z = 44 thin upright("mm")$, connected to two ducts of diameter
$29 thin upright("mm")$. The cavity walls are made sufficiently thick
($10$ mm) to minimize acoustic--structure coupling. The scattering
coefficients $r$ and $t$ are measured experimentally using an impedance
tube (B&K, Type 4206).

The magnitudes of the experimentally measured (blue) and numerically
computed (red) scattering coefficients, $r$ and $t$, are shown in
@FIgExp\(b--c). A good agreement is observed between the experiment
and the simulation, with both capturing the main resonance features. In
addition, the reflection coefficient exhibits a characteristic Fano-like
resonance. @FIgExp\(d) shows the frequency dependence of the
eigenvalue $\| lambda_(-) \|^2$. The experimental data (blue) exhibit a
vanishing eigenvalue around $f_(C P A) approx 1868$ Hz, which is
associated with a high $Q$ factor of $Q_(e x p) approx 140$. The
numerical results (in red) display good overall agreement but do not
vanish. In fact, the numerical simulation predicts the CPA condition at
a slightly larger cavity length, $L_x = 91$ mm, compared to $L_x = 90$
mm used experimentally. This small discrepancy is attributed to higher
effective losses in the measurements, likely resulting from the surface
roughness introduced by the additive manufacturing process, which has
been shown to affect the effective viscosity #[#link(<bib:ciochon2023impact>)[40]].
Additional contributions may arise from slight energy losses due to wall
vibrations.

Moreover, achieving CPA requires that the incident waves correspond to
the appropriate eigenvectors, i.e., with the same phase and amplitude in
our case. This aspect is analyzed via the measured pressure in the
channels and is discussed in the Supplementary Information.

#emph[Interplay between EP and qBIC.---] As demonstrated above,
controlling the radiative losses enables to obtain a CPA. In the
following, we investigate the implementation of an EP via a similar loss
control approach. To this end, we consider a new system composed of two
coupled resonators, as displayed in @EPs.(a). This system can be
described by the following scattering matrix and its corresponding
eigenvalues,

$ upright(bold(S)) = mat(delim: "(", t, r^p; r^m, t) \, thin thin thin thin thin thin thin lambda_plus.minus = t plus.minus sqrt(r^m r^p) \, $
where $r^m$ and $r^p$ represent the reflection coefficients for left and
right incident waves, respectively.

Here, we focus on the formation of an EP, which occurs when both the
eigenvalues $lambda_plus.minus$ and their corresponding eigenvectors
$v_plus.minus$ coalesce. This condition is satisfied when one of the
reflection coefficients vanishes, yielding a degenerate pair of
eigenvalues $lambda_plus.minus = t$ and linearly dependent eigenvectors
#[#link(<bib:merkel2018unidirectional>)[41]]. Furthermore, when this condition coincides
with a vanishing transmission ($\| t \| = 0$), both eigenvalues
simultaneously vanish, resulting in a configuration that merges
absorption and EP. In fact, the system operates as a unidirectional
perfect absorber, completely absorbing waves incident from the left
while reflecting those incident from the right.

#figure(image("source/Figure5.pdf", width: 100.0%),
  caption: [
    Emergence of an EP and unidirectional absorption using a qBIC. (a)
    Sketch of the coupled system. (b) Experimental setup using two
    acoustic resonators. The experimental results are presented as
    follow: (c) Magnitude of the scattering coefficient. (d) Absorption
    coefficient for left $alpha^m = 1 - \| t \|^2 - \| r^m \|^2$ and
    right impinging waves $alpha^p = 1 - \| t \|^2 - \| r^p \|^2$. (e)
    Real and imaginary part of the eigenvalues of the scattering matrix.
  ]
)
<EPs>

To implement this configuration experimentally, we employ the critically
coupled resonator introduced previously, which provides CPA with a high
$Q$ factor. The latter is coupled to a second cavity of identical
cross-section but with a length of $92$ mm, as displayed in
@EPs.(b). The second (white) resonator is engineered to act
predominantly as a reflector near the CPA frequency (see Supplementary
Information for its scattering coefficients). By adjusting the spacing
between the two resonators, FP interference enables perfect absorption
of waves incident from the left. Conversely, waves incident from the
right encounter the white resonator, which reflects them almost entirely
$\| r^p \| approx 1$. In the experiments that follow, a duct length of
$78$ mm was selected after fine tuning (see supplementary information).

The measured scattering coefficients shown in @EPs\(c) indicate
that the transmission remains below $0.3$ across the selected frequency
range, while the reflection for waves incident from the right is
broadband and close to unity. In contrast, for waves impinging from the
left, a pronounced reflection dip appears near the CPA frequency,
reaching $\| r^m \| approx 0.025$ at $f_(E P) = 1853$ Hz. At this
frequency, left-incident waves are almost completely absorbed, yielding
a narrowband absorption of $alpha^m approx 0.99$, as highlighted in
@EPs\(d), whereas right-incident waves are predominantly reflected.
As discussed, the unidirectionality of absorption is linked to the
formation of an EP. The latter can be observed in @EPs\(e), where
both real and imaginary parts of $lambda_plus.minus$ simultaneously
approach zero near $f_(E P)$. Note that the numerical results were
adjusted to better match the experimental data by increasing the
effective dynamic viscosity $mu$ by a factor of 6 from its expected
value at ambient conditions
($mu_0 = 1.85 times 10^(-5) thin upright("Pa") dot upright("s")$). This
correction accounts for the additional dissipation caused by surface
roughness from the manufacturing process (FDM printing), which has been
found to significantly enhance acoustic losses #[#link(<bib:ciochon2024efficient>)[42]].
The impact of effective viscosity in our setup is discussed in the
supplementary information.

#emph[Conclusion.---] Control over wave scattering fundamentally relies
on the ability to tailor dissipation, especially in applications seeking
efficient absorption. In this regard, mechanisms inducing qBICs are
particularly interesting as they enable precise tuning and significant
suppression of radiative losses. Here, we harness qBIC physics to
achieve high $Q$ absorption in airborne acoustic setups. In a two-port
configuration, CPA is achieved by controlling the decay rates of a
Friedrich--Wintgen resonance and tuning the system to satisfy the
critical coupling condition, yielding a $Q$ factor of $140$. Afterward,
two distinct resonators are coupled through an acoustic channel, where
FP interference at a specific channel length induces a narrowband
scattering EP. At this EP, waves incident from one side are almost
completely absorbed, while waves from the opposite side are
predominantly reflected, resulting in unidirectional absorption.

While this study focuses on fundamental modes and simple cavity
structures, the approach can be extended to more complex geometries,
higher-order modes, and alternative qBIC-generation mechanisms. The
incorporation of active acoustic components, for instance via
electroacoustic elements #[#link(<bib:padlewski2023active>)[43]], could enable further
functionalities leveraging the presence of gain and loss units, such as
CPA-lasing #[#link(<bib:sakotic2023non>)[44]], which combines strong wave amplification
with absorption.

#heading(level: 1, numbering: none)[Acknowledgments]
<acknowledgments>
This work has been supported by l'Agence de l'Innovation de Défense
(AID) in the context of the joint research laboratory MOLIERE, and by
the IMPACT project LUE "I-META," part of the French PIA project
"Lorraine Université d'Excellence" reference ANR-15- IDEX-04-LUE.

#heading(level: 1, numbering: none)[DATA AVAILABILITY]
<data-availability>
The data that support the findings of this study are available from the
corresponding authors upon reasonable request.

#heading(level: 1, numbering: none)[References]

#block[\[1\] Y.~Ashida, Z.~Gong,~and~ M.~Ueda,~ Non-hermitian physics,~ Advances in
Physics~ #strong[69],~ 249 ( 2020).] <bib:ashida2020non>

#block[\[2\] R.~El-Ganainy, K.~G.~Makris, M.~Khajavikhan, Z.~H.~Musslimani,
S.~Rotter,~and~ D.~N.~Christodoulides,~ Non-hermitian physics and pt
symmetry,~ Nature Physics~ #strong[14],~ 11 ( 2018).] <bib:el2018non>

#block[\[3\] R.~Fleury, D.~Sounas,~and~ A.~Alu,~ An invisible acoustic sensor based
on parity-time symmetry,~ Nature communications~ #strong[6],~ 5905 (
2015).] <bib:fleury2015invisible>

#block[\[4\] Y.~Aurégan~and~ V.~Pagneux,~ Pt-symmetric scattering in flow duct
acoustics,~ Physical review letters~ #strong[118],~ 174301 (
2017).] <bib:auregan2017pt>

#block[\[5\] G.~Poignand, C.~Olivier,~and~ G.~Penelet,~ Parity-time symmetric system
based on the thermoacoustic effect,~ The Journal of the Acoustical
Society of America~ #strong[149],~ 1913 ( 2021).] <bib:poignand2021parity>

#block[\[6\] X.~Wang, X.~Fang, D.~Mao, Y.~Jing,~and~ Y.~Li,~ Extremely asymmetrical
acoustic metasurface mirror at the exceptional point,~ Physical review
letters~ #strong[123],~ 214302 ( 2019).] <bib:wang2019extremely>

#block[\[7\] V.~Achilleos, G.~Theocharis, O.~Richoux,~and~ V.~Pagneux,~ Non-hermitian
acoustic metamaterials: Role of exceptional points in sound absorption,~
Physical Review B~ #strong[95],~ 144303 ( 2017).] <bib:achilleos2017non>

#block[\[8\] K.~Ding, C.~Fang,~and~ G.~Ma,~ Non-hermitian topology and
exceptional-point geometries,~ Nature Reviews Physics~ #strong[4],~ 745
( 2022).] <bib:ding2022non>

#block[\[9\] L.~Zhang, Y.~Yang, Y.~Ge, Y.-J.~Guan, Q.~Chen, Q.~Yan, F.~Chen, R.~Xi,
Y.~Li, D.~Jia, #emph[et~al.],~ Acoustic non-hermitian skin effect from
twisted winding topology,~ Nature communications~ #strong[12],~ 6297 (
2021).] <bib:zhang2021acoustic>

#block[\[10\] A.~Maddi, Y.~Aurégan, G.~Penelet, V.~Pagneux,~and~ V.~Achilleos,~ Exact
analog of the hatano-nelson model in one-dimensional continuous
nonreciprocal systems,~ Physical Review Research~ #strong[6],~ L012061 (
2024).] <bib:maddi2024exact>

#block[\[11\] Y.~Jin, D.~Torrent, B.~D.~Rouhani, L.~He, Y.~Xiang, F.-Z.~Xuan, Z.~Gu,
H.~Xue, J.~Zhu, Q.~Wu, #emph[et~al.],~ The 2024 phononic crystals
roadmap,~ Journal of Physics D: Applied Physics~ #strong[58],~ 113001 (
2025).] <bib:jin20252024>

#block[\[12\] S.~A.~Cummer, J.~Christensen,~and~ A.~Alù,~ Controlling sound with
acoustic metamaterials,~ Nature Reviews Materials~ #strong[1],~ 1 (
2016).] <bib:cummer2016controlling>

#block[\[13\] C.~W.~Hsu, B.~Zhen, A.~D.~Stone, J.~D.~Joannopoulos,~and~ M.~Soljačić,~
Bound states in the continuum,~ Nature Reviews Materials~ #strong[1],~ 1
( 2016).] <bib:hsu2016bound>

#block[\[14\] L.~Huang, B.~Jia, A.~S.~Pilipchuk, Y.~Chiang, S.~Huang, J.~Li, C.~Shen,
E.~N.~Bulgakov, F.~Deng, D.~A.~Powell, #emph[et~al.],~ General framework
of bound states in the continuum in an open acoustic resonator,~
Physical Review Applied~ #strong[18],~ 054021 ( 2022).] <bib:huang2022general>

#block[\[15\] S.~An, T.~Liu, L.~Cao, Z.~Gu, H.~Fan, Y.~Zeng, L.~Cheng, J.~Zhu,~and~
B.~Assouar,~ Multibranch elastic bound states in the continuum,~
Physical review letters~ #strong[132],~ 187202 ( 2024).] <bib:an2024multibranch>

#block[\[16\] F.~Kronowetter, M.~Maeder, Y.~K.~Chiang, L.~Huang, J.~D.~Schmid,
S.~Oberst, D.~A.~Powell,~and~ S.~Marburg,~ Realistic prediction and
engineering of high-q modes to implement stable fano resonances in
acoustic devices,~ Nature Communications~ #strong[14],~ 6847 (
2023).] <bib:kronowetter2023realistic>

#block[\[17\] C.~W.~Hsu, B.~Zhen, J.~Lee, S.-L.~Chua, S.~G.~Johnson,
J.~D.~Joannopoulos,~and~ M.~Soljačić,~ Observation of trapped light
within the radiation continuum,~ Nature~ #strong[499],~ 188 (
2013).] <bib:hsu2013observation>

#block[\[18\] Y.~Plotnik, O.~Peleg, F.~Dreisow, M.~Heinrich, S.~Nolte,
A.~Szameit,~and~ M.~Segev,~ Experimental observation of optical bound
states in the continuum,~ Physical review letters~ #strong[107],~ 183901
( 2011).] <bib:plotnik2011experimental>

#block[\[19\] P.~Pankin, B.-R.~Wu, J.-H.~Yang, K.-P.~Chen, I.~Timofeev,~and~
A.~Sadreev,~ One-dimensional photonic bound states in the continuum,~
Communications Physics~ #strong[3],~ 91 ( 2020).] <bib:pankin2020one>

#block[\[20\] K.~Koshelev, A.~Bogdanov,~and~ Y.~Kivshar,~ Meta-optics and bound states
in the continuum,~ Science Bulletin~ #strong[64],~ 836 (
2019).] <bib:koshelev2019meta>

#block[\[21\] M.~Martı́-Sabaté, J.~Li, B.~Djafari-Rouhani, S.~A.~Cummer,~and~
D.~Torrent,~ Observation of two-dimensional acoustic bound states in the
continuum,~ Communications Physics~ #strong[7],~ 122 (
2024).] <bib:marti2024observation>

#block[\[22\] M.~Farhat, Y.~Achaoui, J.~A.~I.~Martı́nez, M.~Addouche, Y.~Wu,~and~
A.~Khelif,~ Observation of ultra-high-q resonators in the ultrasound via
bound states in the continuum,~ Advanced Science~ #strong[11],~ 2402917
( 2024).] <bib:farhat2024observation>

#block[\[23\] Y.~Chen, K.~Wang, M.~Kadic, S.~Guenneau, C.~Wang,~and~ M.~Wegener,~
Phonon transmission through a nonlocal metamaterial slab,~
Communications Physics~ #strong[6],~ 75 ( 2023).] <bib:chen2023phonon>

#block[\[24\] F.~Kronowetter, A.~Melnikov, M.~Maeder, T.~Yang, Y.~K.~Chiang,
S.~Oberst, D.~A.~Powell,~and~ S.~Marburg,~ Exceptional energy harvesting
from coupled bound states,~ Nature Communications~ #strong[16],~ 3515 (
2025).] <bib:kronowetter2025exceptional>

#block[\[25\] S.~Huang, T.~Liu, Z.~Zhou, X.~Wang, J.~Zhu,~and~ Y.~Li,~ Extreme sound
confinement from quasibound states in the continuum,~ Physical Review
Applied~ #strong[14],~ 021001 ( 2020).] <bib:huang2020extreme>

#block[\[26\] M.~Krasikova, F.~Kronowetter, S.~Krasikov, M.~Kuzmin, M.~Maeder,
T.~Yang, A.~Melnikov, S.~Marburg,~and~ A.~Bogdanov,~ Acoustic bound
states in the continuum in coupled helmholtz resonators,~ Physical
Review Applied~ #strong[22],~ 024045 ( 2024).] <bib:krasikova2024acoustic>

#block[\[27\] H.~Zhang, S.~Liu, Z.~Guo, S.~Hu, Y.~Chen, Y.~Li, Y.~Li,~and~ H.~Chen,~
Topological bound state in the continuum induced unidirectional acoustic
perfect absorption,~ Science China Physics, Mechanics & Astronomy~
#strong[66],~ 284311 ( 2023).] <bib:zhang2023topological>

#block[\[28\] D.~Lee, J.~Park, S.~Kim, J.~Mun, J.~Kim, X.~Piao, N.~Park,~and~ J.~Rho,~
Elastic bound states in the continuum by acoustoelastic interaction,~
Extreme Mechanics Letters~ #strong[61],~ 101965 ( 2023).] <bib:lee2023elastic>

#block[\[29\] L.~Cao, Y.~Zhu, Y.~Xu, S.-W.~Fan, Z.~Yang,~and~ B.~Assouar,~ Elastic
bound state in the continuum with perfect mode conversion,~ Journal of
the Mechanics and Physics of Solids~ #strong[154],~ 104502 (
2021).] <bib:cao2021elastic>

#block[\[30\] M.~Martı́-Sabaté, B.~Djafari-Rouhani,~and~ D.~Torrent,~ Bound states in
the continuum in circular clusters of scatterers,~ Physical Review
Research~ #strong[5],~ 013131 ( 2023).] <bib:marti2023bound>

#block[\[31\] A.~Maddi, G.~Poignand, V.~Achilleos, V.~Pagneux,~and~ G.~Penelet,~
Direct experimental observation of total absorption and loss
compensation using sound waves with complex frequencies,~ Journal of
Applied Physics~ #strong[137] ( 2025).] <bib:maddi2025direct>

#block[\[32\] L.~Huang, S.~Huang, C.~Shen, S.~Yves, A.~S.~Pilipchuk, X.~Ni, S.~Kim,
Y.~K.~Chiang, D.~A.~Powell, J.~Zhu, #emph[et~al.],~ Acoustic resonances
in non-hermitian open systems,~ Nature Reviews Physics~ #strong[6],~ 11
( 2024).] <bib:huang2024acoustic>

#block[\[33\] V.~Romero-Garcı́a, G.~Theocharis, O.~Richoux, A.~Merkel, V.~Tournat,~and~
V.~Pagneux,~ Perfect and broadband acoustic absorption by critically
coupled sub-wavelength resonators,~ Scientific reports~ #strong[6],~
19519 ( 2016).] <bib:romero2016perfect>

#block[\[34\] M.~Farooqui, Y.~Aurégan,~and~ V.~Pagneux,~ Ultrathin resistive sheets
for broadband coherent absorption and symmetrization of acoustic waves,~
Physical Review Applied~ #strong[18],~ 014007 ( 2022).] <bib:farooqui2022ultrathin>

#block[\[35\] D.~G.~Baranov, A.~Krasnok, T.~Shegai, A.~Alù,~and~ Y.~Chong,~ Coherent
perfect absorbers: linear control of light with light,~ Nature Reviews
Materials~ #strong[2],~ 1 ( 2017).] <bib:baranov2017coherent>

#block[\[36\] C.~Olivier, A.~Maddi, G.~Poignand,~and~ G.~Penelet,~ Asymmetric
transmission and coherent perfect absorption in a periodic array of
thermoacoustic cells,~ Journal of Applied Physics~ #strong[131] (
2022).] <bib:olivier2022asymmetric>

#block[\[37\] V.~Achilleos, O.~Richoux,~and~ G.~Theocharis,~ Coherent perfect
absorption induced by the nonlinearity of a helmholtz resonator,~ The
Journal of the Acoustical Society of America~ #strong[140],~ EL94 (
2016).] <bib:achilleos2016coherent>

#block[\[38\] A.~Merkel, G.~Theocharis, O.~Richoux, V.~Romero-Garcı́a,~and~
V.~Pagneux,~ Control of acoustic absorption in one-dimensional
scattering by resonant scatterers,~ Applied Physics Letters~
#strong[107] ( 2015).] <bib:merkel2015control>

#block[\[39\] Y.~Aurégan~and~ R.~Starobinski,~ Determination of acoustical energy
dissipation/production potentiality from the acoustical transfer
functions of a multiport,~ Acta Acustica united with Acustica~
#strong[85],~ 788 ( 1999).] <bib:auregan1999determination>

#block[\[40\] A.~Ciochon, J.~Kennedy, R.~Leiba, L.~Flanagan,~and~ M.~Culleton,~ The
impact of surface roughness on an additively manufactured acoustic
material: An experimental and numerical investigation,~ Journal of Sound
and Vibration~ #strong[546],~ 117434 ( 2023).] <bib:ciochon2023impact>

#block[\[41\] A.~Merkel, V.~Romero-Garcı́a, J.-P.~Groby, J.~Li,~and~ J.~Christensen,~
Unidirectional zero sonic reflection in passive pt-symmetric willis
media,~ Physical Review B~ #strong[98],~ 201102 ( 2018).] <bib:merkel2018unidirectional>

#block[\[42\] A.~Ciochon~and~ J.~Kennedy,~ Efficient modelling of surface roughness
effects in additively manufactured materials,~ Applied Acoustics~
#strong[220],~ 109953 ( 2024).] <bib:ciochon2024efficient>

#block[\[43\] M.~Padlewski, M.~Volery, R.~Fleury, H.~Lissek,~and~ X.~Guo,~ Active
acoustic su-schrieffer-heeger-like metamaterial,~ Physical Review
Applied~ #strong[20],~ 014022 ( 2023).] <bib:padlewski2023active>

#block[\[44\] Z.~Sakotic, P.~Stankovic, V.~Bengin, A.~Krasnok, A.~Alú,~and~
N.~Jankovic,~ Non-hermitian control of topological scattering
singularities emerging from bound states in the continuum,~ Laser &
Photonics Reviews~ #strong[17],~ 2200308 ( 2023).] <bib:sakotic2023non>
