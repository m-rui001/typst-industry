#import "cycle-diagram.typ": cycle-diagram

#set document(title: "A High-Efficiency Three-Stroke Quantum Isochoric Heat Engine")
#set page(paper: "us-letter", margin: (x: 1.6cm, y: 2.45cm), numbering: "1")
#set text(font: "Libertinus Serif", size: 10pt)
#set par(justify: true, leading: .42em)
#set heading(numbering: "I.A")
#set math.equation(numbering: "(1)")
#show figure.caption: set text(size: 9pt)

#align(center)[
  #text(size: 15pt, weight: "bold")[A High-Efficiency Three-Stroke Quantum Isochoric Heat Engine: From Infinite Potential Wells to Magic-Angle Twisted Bilayer Graphene]

  #link("mailto:hm.soufy@niser.ac.in")[Hadi Mohammed Soufy] and #link("mailto:colin.nano@gmail.com")[Colin Benjamin]

  #emph[School of Physical Sciences, National Institute of Science Education and Research, HBNI, Jatni-752050, India \
  Homi Bhabha National Institute, Training School Complex, Anushakti Nagar, Mumbai, 400094, India]
]

#block(inset: (x: 1cm), text(size: 9pt)[We introduce a three-stroke quantum isochoric cycle that functions as a heat engine operating between two thermal reservoirs. Implemented for a particle confined in a one-dimensional infinite potential well, the cycle’s performance is benchmarked against the classical three-stroke triangular and isochoric engines. We find that the quantum isochoric cycle achieves a higher efficiency than both classical counterparts and also surpasses the efficiency of the recently proposed three-stroke quantum isoenergetic cycle. Owing to its reduced number of strokes, the design substantially lowers control complexity in nanoscale thermodynamic devices, offering a more feasible route to experimental realization compared to conventional four-stroke architectures. We further evaluate the cycle in graphene-based systems under an external magnetic field, including monolayer graphene (MLG), AB-stacked bilayer graphene (BLG), and twisted bilayer graphene (TBG) at both magic and non-magic twist angles. Among these platforms, magic-angle twisted bilayer graphene (MATBG) attains the highest efficiency at fixed work output, highlighting its promise for quantum thermodynamic applications.])

#show: body => columns(2, gutter: 16pt, body)

= Introduction
<introduction>
The intersection of quantum mechanics and thermodynamics has led to a rapidly developing field focused on microscopic quantum thermodynamic devices (QTDs) @uzdin2015equivalence@kosloff2013quantum@bhattacharjee2021quantum. Operating at the scale of individual atoms and engineered quantum systems, these devices challenge classical intuition by revealing how coherence, discreteness, and quantum statistics influence energy-conversion processes @vinjanampathy2016quantum@millen2016perspective@brask2015autonomous@myers2022quantum. Over the past decade, QTDs have been realized experimentally in a wide range of platforms, including trapped ions @peterson2019experimental@rossnagel2016single, superconducting circuits @uusnakki2025superconducting, nitrogen-vacancy centers in diamond @klatzow2019quantum, ultracold atomic ensembles @bouton2021quantum, and optomechanical systems @zhang2020optomechanical. These breakthroughs demonstrate that thermodynamic cycles, traditionally associated with macroscopic engines, can be meaningfully implemented at the quantum scale, often with enhanced control and access to operational regimes without classical analogues. Designing such machines requires balancing heat exchange and work extraction across discrete thermodynamic strokes @quan2007quantum@quan2009quantum, with the number and nature of the strokes dictating how energy flow is orchestrated. Understanding how each stroke shapes performance is therefore essential for harnessing the capabilities of quantum materials. Although four-stroke cycles form the conventional framework for analyzing work and efficiency, many experimental platforms struggle to realize all four operations with high precision due to decoherence, noise, and limited control resources @deffner2019quantum@abah2014efficiency. Reducing the cycle to three strokes provides a practical alternative that retains essential thermodynamic features while significantly simplifying implementation, making three-stroke models both conceptually insightful and experimentally relevant @koyanagi2022laws@lisboa2022experimental.

In this work, we begin by analyzing two classical three-stroke engines, the triangular cycle and the isochoric cycle, to establish a baseline for comparison. We then introduce a quantum analogue by considering a particle confined in a one-dimensional infinite potential well (IPW) and implementing two distinct quantum three-stroke cycles: a quantum isochoric cycle operating between two thermal baths, and a quantum isoenergetic cycle, originally proposed in Ref.~@ou2016exotic, which operates by maintaining constant internal energy while interacting with a single bath. By systematically comparing their thermodynamic behavior, we show that the quantum isochoric cycle attains both higher efficiency and greater work output than the quantum isoenergetic cycle under identical operating conditions. Building on this insight, we extend our analysis to graphene-based platforms: monolayer graphene (MLG), AB Bernal-stacked bilayer graphene (BLG), and twisted bilayer graphene (TBG) at both magic and non-magic twist angles, in the presence of a perpendicular magnetic field. Implementing the proposed quantum isochoric cycle in these systems allows us to evaluate and compare their performance as quantum heat engines.

Section~@II summarizes the thermodynamic foundations relevant to our analysis, including the conditions for feasibility of a cycle and the operational regimes of quantum heat engines. The specific cycles investigated in this work are then introduced in the subsequent subsections: Section~@IIA reviews the classical triangular cycle; Section~@IIB presents the classical isochoric cycle; Section~@IIC details the proposed three-stroke quantum isochoric cycle; and Section~@IID discusses the three-stroke quantum isoenergetic cycle. For each case, we describe the implementation for a particle in an IPW, analyze compliance with the thermodynamic laws, and compare their performance metrics. Section~@III provides the theoretical background for graphene-based systems---MLG, BLG, and TBG at various twist angles---under an external magnetic field, while Section~@IIIA applies the quantum isochoric cycle to these platforms. Our main results and comparative analysis are presented in Section~@IV, followed by concluding remarks and potential experimental realizations in Section~@V.

= Thermodynamic Cycle
<II>
To understand the performance of a system as a thermodynamic device, we analyze its behavior over a complete thermodynamic cycle. A cycle consists of a series of distinct thermodynamic strokes, that finally return the system to its initial state. The net work output and efficiency, which quantify the device's utility, are derived from the heat exchanged with the thermal reservoirs during these strokes @vinjanampathy2016quantum@quan2007quantum@quan2009quantum@landau2013statistical. For a thermodynamic stroke, the first law of thermodynamics states, $ Delta U = Q - W \, $<eq:firstlaw> where $Q$ is the heat supplied to the system, $W$ is the work done by the system and $Delta U$ is the internal energy change. At the end of a cycle, $Delta U = 0$\; hence, $ W_1 + W_2 + dots.h = W = Q_1 + Q_2 + dots.h $<eq:cycle-formula> $W_1 \, W_2 \, dots.h$ and $Q_1 \, Q_2 \, dots.h$ are the work and heat exchanged in the individual thermodynamic strokes. For a system undergoing a thermodynamic cycle across two reservoirs at temperatures $T_h$ and $T_c$, the heat exchanged with them is denoted by $Q_(upright("hot"))$ and $Q_(upright("cold"))$, respectively. @eq:cycle-formula then reduces to, $ W = Q_(upright("hot")) + Q_(upright("cold")) . $<eq:work-heat>

The second law of thermodynamics requires total entropy change $Delta S_(upright("tot"))$ over a cycle be non-negative, which is a necessary condition for physical realizability @landi2021irreversible@vinjanampathy2016quantum@landau2013statistical. For a system undergoing a thermodynamic stroke while coupled to baths, this is expressed as, $ Delta S_(upright("tot")) = Delta S_(upright("sys")) + Delta S_(upright("bath")) gt.eq 0 \, $

Here, $Delta S_(upright("sys"))$ denotes the entropy change of the system, and $Delta S_(upright("bath"))$ corresponds to that of the baths during the stroke. For a reversible process $Delta S_(upright("tot")) = 0$. For a system undergoing a thermodynamic cycle, which may be reversible or irreversible, between two heat baths at temperatures $T_h$ and $T_c$ ($T_h > T_c$) @vinjanampathy2016quantum@landi2021irreversible, we have,

$ Delta S_(upright("sys")) = 0 \, quad upright("and") quad Delta S_(upright("bath")) = - Q_(upright("hot")) / T_h - Q_(upright("cold")) / T_c \, $ $  & upright("Thus,") quad quad quad Delta S_(upright("tot")) = - Q_(upright("hot")) / T_h - Q_(upright("cold")) / T_c gt.eq 0 \, &  $<eq:secondall> $  & upright("which leads to the condition:") quad quad Q_(upright("hot")) / T_h + Q_(upright("cold")) / T_c lt.eq 0 . &  $<eq:secondlawcond>

A heat engine is characterized by $W > 0$, $Q_(upright("hot")) > 0$, and $Q_(upright("cold")) < 0$, which corresponds to heat $Q_(upright("hot"))$ being absorbed from the hot bath and $Q_(upright("cold"))$ being rejected to the cold bath while performing work $W$ @soufy2025flatband@scharf2020topological.

#figure(layout(size => cycle-diagram(size.width)),
  caption: [
    Entropy - Temperature (T-S) diagrams for three thermodynamic cycles. Shown are: the classical triangular cycle $A arrow.r B arrow.r^(upright("Blue")) C arrow.r A$ @rau2017statistical, the classical isochoric cycle $A arrow.r B arrow.r^(upright("Yellow")) C arrow.r A$, the quantum isochoric cycle $A arrow.r B arrow.r^(upright("Green")) C arrow.r A$, and the quantum isoenergetic cycle $A arrow.r B arrow.r^(upright("Purple")) C arrow.r A$ @ou2016exotic. The classical triangular, classical isochoric and quantum isochoric cycles operate between two baths at fixed temperatures $T_h$ and $T_c$, while the quantum isoenergetic cycle operates with a single bath at $T_h$, where the effective cold temperature $T_c$ is not fixed but is determined by other parameters.
  ]
)
<Fig1>

== Three-Stroke Classical Triangular Cycle
<IIA>
In @Fig1, $A arrow.r^() B arrow.r^(upright("Blue")) C arrow.r^() A$ illustrates three-stroke triangular cycle. It consists of an isothermal stroke ($A arrow.r^() B$), an adiabatic stroke ($C arrow.r^() A$), and an irreversible stroke that connects the endpoints of the first two ($B arrow.r^(upright("Blue")) C$) @rau2017statistical@landau2013statistical. For such a cycle, the performance coefficients depend solely on the temperature gradient between the thermal baths and is irreversible @rau2017statistical@landau2013statistical\(see, @eq:12).

The system exchanges heat $Q_(upright("hot"))$ with the hot bath during the isothermal stroke and heat $Q_(upright("cold"))$ at the end of the irreversible stroke. The system is then brought back to its initial state by an adiabatic process. $Q_(upright("hot"))$ corresponds to the area under line AB, $Q_(upright("cold"))$ is the negative of the area under blue line BC. Thus,

$ Q_(upright("hot")) = T_h \( S_B - S_A \) \, quad quad Q_(upright("cold")) = 1 / 2 \( T_h + T_c \) \( S_A - S_B \) \, $<heatclassical>

and work done $W_(upright("CT"))$ is the area of the cycle ABC (with the blue BC line), $ W_(upright("CT")) = 1 / 2 (T_h - T_c) (S_B - S_A) = W_(upright("c")) / 2 \, $<eq:Workmonotri>

where, $W_c$ is the work done during a Carnot cycle operating between temperatures $T_h$ and $T_c$. For $N$ atoms of a classical ideal gas, work done during a Carnot cycle ($W_c$), is given by @callen2006thermodynamics@landau2013statistical, $ W_c = frac(N k_B, gamma - 1) (T_h - T_c) ln (T_h / T_c) \, $<eq:canot> where $gamma$ is the specific heat capacity ratio and $k_B$ is Boltzmann constant. For a single ($N = 1$) monoatomic ideal gas ($gamma = 5 / 3$), the work done in the triangular cycle ($W_(upright("CT"))$) from Eqs.@eq:Workmonotri and @eq:canot is then given by,

$ W_(upright("CT")) = frac(3 k_B, 4) (T_h - T_c) ln (T_h / T_c) . $<eq:workmonoatomic> At the end of the cycle using Eq.@heatclassical, @eq:secondall becomes,

$  & quad Delta S_(upright("sys")) = 0 \, quad upright("and") quad Delta S_(upright("tot")) = Delta S_(upright("bath")) = - Q_(upright("hot")) / T_h - Q_(upright("cold")) / T_c \,\
 & Delta S_(upright("tot")) = \( S_A - S_B \) + \( S_B - S_A \) frac(T_h + T_c, 2 T_c) = \( S_B - S_A \) thin frac(T_h - T_c, 2 T_c) . $<eq:12>

The second law is not violated if $Q_(upright("hot"))$ and $Q_(upright("cold"))$ obey the condition @eq:secondlawcond,

$ Q_(upright("hot")) / T_h + Q_(upright("cold")) / T_c = \( S_A - S_B \) thin frac(T_h - T_c, 2 T_c) #h(0em) lt.eq #h(0em) 0 . $

Thus, the classical triangular does not violate the second law if $S_A lt.eq S_B$, which gives us $W gt.eq 0$, $Q_(upright("hot")) gt.eq 0$, and $Q_(upright("cold")) lt.eq 0$, therefore the triangular cycle can only operate as a heat engine. The efficiency of the classical triangular cycle as a heat engine is then given as,

$ eta_(upright("CT")) = W_(upright("CT")) / Q_(upright("hot")) = frac(T_h - T_c, 2 T_h) = eta_c / 2 $<eq:trianeta>

where $eta_c = 1 - T_c / T_h$, is the Carnot efficiency. From Eqs. @eq:Workmonotri and @eq:trianeta we notice that the work done and efficiency of the classical triangular cycle is half that of Carnot cycle.

== Three-Stroke Classical Isochoric Cycle
<IIB>
#figure(image("source/Fig2.pdf", width: 95.0%),
  caption: [
    Volume - Temperature diagram of ideal gas during a three-stroke classical isochoric cycle. Stroke $A arrow.r^() B$ is the isothermal stroke, $B arrow.r^(upright("Yellow")) C$ is the isochoric stroke, and $C arrow.r^() A$ is the adiabatic stroke.
  ]
)
<Fig1.5>

@Fig1.5 depicts an ideal gas undergoing a three-stroke classical isochoric cycle. Stroke $A arrow.r B$ is isothermal, where the system at temperature $T_h$ and volume $V_A$ expands to volume $V_B$ while maintaining equilibrium with the hot bath at temperature $T_h$. During this process, the system exchanges heat $Q_(upright("hot"))$ with the hot bath. Stroke $B arrow.r^(upright("Yellow")) C$ is the classical isochoric process, where the volume is kept fixed at $V_B$ as the system cools to temperature $T_c$ of the cold bath. No work is done during this stroke, and the change in internal energy is entirely due to heat exchange $Q_(upright("cold"))$ with the cold bath. Finally, in stroke $C arrow.r A$, the system returns to its initial state through an adiabatic process, where no heat is exchanged and only work is performed. Using standard thermodynamic relations, we compute the heat exchanged with the hot and cold baths. For a classical isothermal process, the internal energy remains constant. Thus, from @eq:firstlaw, we obtain @callen2006thermodynamics@landau2013statistical, $ Q_(upright("hot")) = W_(upright("Isothermal")) = N k_B T_h ln V_B / V_A \, $<eq:classic-isochor-qht> where $N$ is the number of atoms and $k_B$ is the Boltzmann constant. For a classical isochoric process, no work is exchanged. Therefore, from @eq:firstlaw, we obtain @callen2006thermodynamics, $ Q_(upright("cold")) = Delta U = C_v \( T_c - T_h \) = frac(N k_B \( T_c - T_h \), gamma - 1) \, $<eq:classic-isochor-qcld> where $C_v$ is the molar specific heat capacity at constant volume and $gamma$ is the specific heat capacity ratio. The adiabatic stroke $C arrow.r A$ yields the relation @callen2006thermodynamics@landau2013statistical, $ T_c V_B^(gamma - 1) = T_h V_A^(gamma - 1) arrow.r.double V_B / V_A = (T_h / T_c)^(frac(1, gamma - 1)) . $<eq:classic-isochor-adia>

To verify the feasibility of the cycle, we substitute Eqs.~@eq:classic-isochor-qht and @eq:classic-isochor-qcld into @eq:secondlawcond, $ Q_(upright("hot")) / T_h & + Q_(upright("cold")) / T_c = frac(N k_B T_h ln T_h / T_c, T_h \( gamma - 1 \)) + frac(N k_B \( T_c - T_h \), T_c \( gamma - 1 \))\
 & = frac(N k_B, gamma - 1) (ln T_h / T_c - T_h / T_c + 1) lt.eq 0 . $<eq:classical-isochor-work>

For a stable thermodynamic system, $gamma > 1$, and the quantity $(ln T_h / T_c - T_h / T_c + 1)$ is always negative when $T_h > T_c$. Hence, the cycle is consistent with the second law. For one complete cycle, $  & Delta S_(upright("sys")) = 0 \, quad upright("and") quad Delta S_(upright("tot")) = Delta S_(upright("bath")) = - Q_(upright("hot")) / T_h - Q_(upright("cold")) / T_c \,\
 & Delta S_(upright("tot")) = frac(N k_B, gamma - 1) (T_h / T_c - ln T_h / T_c - 1) gt.eq 0 . $

Using Eqs.~@eq:classic-isochor-qht, @eq:classic-isochor-qcld, and @eq:classic-isochor-adia, the total work exchanged during the complete classical isochoric cycle ($W_(upright("CI"))$) for a single ($N = 1$) monoatomic ($gamma = 5 / 3$) ideal gas is, $ W_(upright("CI")) & = Q_(upright("hot")) + Q_(upright("cold")) = frac(N k_B (T_h ln T_h / T_c + \( T_c - T_h \)), gamma - 1)\
 & = 3 / 2 k_B (T_h ln T_h / T_c + \( T_c - T_h \)) . $

The efficiency ($eta_(upright("CI"))$) of the classical three-stroke isochoric cycle operating as a heat engine is then given as, $ eta_(upright("CI")) = W_(upright("CI")) / Q_(upright("hot")) & = 1 + frac(N k_B \( T_c - T_h \), gamma - 1) / frac(N k_B T_h ln T_h / T_c, gamma - 1) \,\
 & = 1 + frac(T_c - T_h, T_h ln T_h / T_c) = 1 + frac(eta_c, ln \( 1 - eta_c \)) \, $<eq:classical-isocho-eta> where $eta_c = 1 - T_c / T_h$ is the Carnot efficiency. The efficiency of the classical isochoric cycle lies between those of the Carnot and classical triangular cycles, i.e., $eta_(upright("CT")) lt.eq eta_(upright("CI")) lt.eq eta_c$. In the following section, we introduce quantum three-stroke cycles where the second stroke is replaced by either a quantum isoenergetic or quantum isochoric process. The efficiency and work output for the classical triangular and classical isochoric cycles are compared with the quantum isochoric and quantum isoenergetic cycles in Figs.~@Fig3 and @Fig5 in Sections~@IIB and @IIC.

== Three-Stroke Quantum Isochoric Cycle for Quantum Particle in an Infinite Potential Well
<IIC>
#figure(image("source/Fig3.pdf", width: 95.0%),
  caption: [
    Length - Temperature diagram of the particle in an IPW during a three-stroke quantum isochoric cycle. Stroke $A arrow.r^() B$ is the isothermal stroke, $B arrow.r^(upright("Green")) C$ is the quantum isochoric stroke, and $C arrow.r^() A$ is the adiabatic stroke.
  ]
)
<Fig2>

We consider a particle in a 1D IPW of variable length $L$, operating as a three-stroke quantum isochoric thermodynamic cycle, as depicted in Figs.~@Fig1 and @Fig2 $\( A arrow.r B arrow.r^(upright("Green")) C arrow.r A \)$. This cycle operates between two thermal baths at temperatures $T_h$ and $T_c$ ($T_h > T_c$), and consists of an isothermal stroke $\( A arrow.r B \)$, followed by a quantum isochoric stroke $\( B arrow.r^(upright("Green")) C \)$, and finally an adiabatic stroke $\( C arrow.r A \)$. The quantized energy levels of a quantum particle in the 1D IPW are given by @landau2013quantum@dirac1981principles,

$ E_n \( L \) = frac(n^2 ℏ^2 pi^2, 2 m L^2) \, $

where $m$ is the particle mass (here taken to be the electron mass). For a system in thermal equilibrium at temperature $T$, with energy eigenvalues $E_n$ and corresponding eigenstates $"|" n "⟩"$, the thermal state ($rho \( L \, T \)$) is given by @vinjanampathy2016quantum@quan2007quantum@quan2009quantum, 

$ rho(L,T) &= sum_n p_n "|" n "⟩" "⟨" n "|" \
p_n(L,T) &= e^(-beta E_n(L)) / Z(L,T) \
Z(L,T) &= sum_n e^(-beta E_n(L)) $<eq:thermal>



where $p_n \( L \, T \)$ are the occupation probabilities, $Z \( L \, T \)$ is the partition function and $beta = frac(1, k_B T)$, where $k_B$ is the Boltzmann constant. Once the thermal state is known, we can calculate other thermodynamic quantities such as entropy $S = - k_B sum_n p_n ln \( p_n \)$ and internal energy $U = sum_n p_n E_n$. For infinitesimal transformations, from @eq:firstlaw, we obtain,



$ Q &= sum_n E_n(L) thin d p_n \
W &= -sum_n p_n(L,T) thin d E_n $<eq:QandW>



- #strong[Stroke A $arrow.r$ B (Isothermal):] The system is coupled to the hot bath at temperature $T_h$. The well length expands from $L_A$ to $L_B$ at constant temperature. Heat exchanged during this process $Q_(upright("hot"))$ is given by @eq:QandW, $ Q_(upright("hot")) = sum_n integral_(L_A)^(L_B) E_n \( L \) frac(partial p_n \( L \, T \), partial L) thin d L \, $ which reduces to, (see, Appendix A), $ Q_(upright("hot")) = T_h [S_B \( L_B \, T_h \) - S_A \( L_A \, T_h \)] . $<eq:qhotisocho>

- #strong[Stroke B $arrow.r^(upright("Green"))$ C (Quantum isochoric):] The well length is fixed at $L_B$ as the system thermalizes with the cold bath at temperature $T_c$. This gives us the condition, $ E_n^B \( L_B \) = E_n^C \( L_B \) . $<eq:isochorpartcodn>

  No work is performed, and heat $Q_(upright("cold"))$ can be found using @eq:QandW, as, $ Q_(upright("cold")) = sum_n E_n^B \( L_B \) [p_n^C \( L_B \, T_c \) - p_n^B \( L_B \, T_h \)] . $<eq:qcoldisoch>

- #strong[Stroke C $arrow.r$ A (Adiabatic):] The system is brought back to its initial state adiabatically. This enforces the entropy-matching condition that determines the initial length $L_A$, $ S_C \( L_B \, T_c \) = S_A \( L_A \, T_h \) \, $<eq:partboxadia> since the energy levels of particle in an IPW obey the energy scaling condition, (i.e $frac(E_n \( L \), E_m \( L \)) = upright("constant") \,$ for all $n \, m$) @pena2020otto@quan2007quantum, we obtain a stricter condition for @eq:partboxadia, $ p_n^A \( L_A \, T_h \) = p_n^C \( L_B \, T_c \) \, quad forall n . $ Now for some arbitrary energy levels: $n \, m med \( n eq.not m \)$, we have, $  & frac(p_n^A \( L_A \, T_h \), p_m^A \( L_A \, T_h \)) = frac(p_n^C \( L_B \, T_c \), p_m^C \( L_B \, T_c \)) arrow.r.double e^(- beta_h E_n \( L_A \)) / e^(- beta_h E_m \( L_A \)) = e^(- beta_c E_n \( L_B \)) / e^(- beta_c E_m \( L_B \)) \,\
   & e^(- beta_h frac(ℏ^2 pi^2, 2 m L_A^2) \( n^2 - m^2 \)) = e^(- beta_c frac(ℏ^2 pi^2, 2 m L_B^2) \( n^2 - m^2 \)) arrow.r.double L_A = L_B sqrt(T_c / T_h) . $<eq:lengthconditionforadiaisocho>

For the cycle to be consistent with the second law, it must satisfy the condition in @eq:secondlawcond,i.e,



$ Q_"hot"/T_h + Q_"cold"/T_c
&= S_B-S_A + sum_n E_n^B/T_c (p_n^C-p_n^B) \
&= S_B-S_C + sum_n E_n^B/T_c (p_n^C-p_n^B) \
&= sum_n p_n^B [-k_B ln p_n^B - E_n^B/T_c] \
& quad + sum_n p_n^C [k_B ln p_n^C + E_n^B/T_c]. $<eq:lastline>





From @eq:thermal we have
$ p_n^B &= e^(-beta_h E_n^B)/Z_B \
p_n^C &= e^(-beta_c E_n^C)/Z_C. $<eq:populations-BC>

 Rearranging @eq:lastline and using @eq:populations-BC gives,

$ Q_(upright("hot")) / T_h + Q_(upright("cold")) / T_c & = sum_n p_n^B #h(-1em) [- k_B ln e^(- beta_h E_n^B) / Z_B - E_n^B / T_c]\
 & quad + sum_n p_n^C #h(-1em) [k_B ln e^(- beta_c E_n^C) / Z_C + E_n^B / T_c] \,\
 & = sum_n p_n^B #h(-1em) [E_n^B / T_h - E_n^B / T_c + k_B ln (Z_B)]\
 & quad + sum_n p_n^C #h(-1em) [- E_n^C / T_c + E_n^B / T_c - k_B ln (Z_C)] \, $

#figure(image("source/Fig4.pdf", width: 95.0%),
  caption: [
    \(a) Efficiency in units of $eta \/ eta_c$ and (b) Work output (in meV) for a particle in an IPW undergoing a three-stroke quantum isochoric cycle working as a heat engine at different hot bath temperatures. In (a), the black dashed line corresponds to $eta_(upright("CT")) \/ eta_c$ from @eq:trianeta (classical triangular cycle), while the dotted-dashed line shows $eta_(upright("CI")) \/ eta_c$ from Eq.~@eq:classical-isocho-eta (classical isochoric cycle). In (b), the dashed and dotted-dashed lines indicate the work outputs $W_(upright("CT"))$ (@eq:workmonoatomic) and $W_(upright("CI"))$ (Eq.~@eq:classical-isochor-work) for a monoatomic ideal gas undergoing the classical triangular and classical isochoric cycles, respectively. $L_B$ is the length of the well during the quantum isochoric process and $T_c = 1 upright("K")$.
  ]
)
<Fig3>

from @eq:isochorpartcodn, and as $sum_n p_n^B = sum_n p_n^C = 1$, the above result reduces to,

$ Q_(upright("hot")) / T_h & + Q_(upright("cold")) / T_c = k_B #h(-1em) [ln Z_B - ln Z_C] + (1 / T_h - 1 / T_c) sum_n p_n^B E_n^B \,\
 & = - k_B #h(-1em) [ln #h(-1em) (Z_C / Z_B) + \( beta_c - beta_h \) sum_n p_n^B E_n^B] \,\
 & = - k_B #h(-1em) [sum_n p_n^B (ln #h(-1em) (Z_C / Z_B) + ln \( e^(\( beta_c - beta_h \) E_n^B) \))] \,\
 & = - k_B sum_n p_n^B ln #h(-1em) (frac(e^(\( beta_c - beta_h \) E_n^B), Z_B \/ Z_C)) = - k_B sum_n p_n^B ln #h(-1em) (e^(- beta_h E_n^B) / Z_B / e^(- beta_c E_n^B) / Z_C) $

$ = - k_B sum_n p_n^B ln #h(-1em) (p_n^B / p_n^C) = - k_B thin cal(D) #h(-1em) (p^B parallel p^C) lt.eq 0 . $<eq:icho2nd>

$p_n^i \, E_n^i \, S_i \, Z_i \,$ and $U_i$ denote the thermal probabilities, energy levels, entropy, partition function, and internal energy at point $i in { A = \( L_A \, T_h \) \, B = \( L_B \, T_h \) \, C = \( L_B \, T_c \) }$ in parameter space, in Fig.@Fig2. Finally, $cal(D) \( p parallel q \) = sum_n p_n ln #h(-1em) (p_n / q_n)$ is the Kullback--Leibler relative entropy between two probability distributions $p$ and $q$, which is always non-negative @landi2021irreversible@gray2011entropy. Since @eq:secondlawcond is satisfied, the cycle is thermodynamically feasible. For one complete cycle, the entropy change for bath and system can be found using Eqs. @eq:secondall and @eq:icho2nd, $  & Delta S_(upright("sys")) = 0 \, quad Delta S_(upright("tot")) = Delta S_(upright("bath")) = k_B thin cal(D) #h(-1em) (p^B parallel p^C) gt.eq 0 . $<eq:entoiscoho> For the three-stroke quantum isochoric cycle operating as a heat engine, the total work done by the system per cycle is given by $W = Q_(upright("hot")) + Q_(upright("cold"))$, where the heat exchanged $Q_(upright("hot"))$ and $Q_(upright("cold"))$ are defined in Eqs.~@eq:qhotisocho and @eq:qcoldisoch. The work done, efficiency and coefficient of merit are then given as,

$ W & = T_h #scale(x: 120%, y: 120%)[\[] S_B \( L_B \, T_h \) - S_A \( L_A \, T_h \) #scale(x: 120%, y: 120%)[\]]\
 & quad - sum_n E_n \( L_B \) #scale(x: 180%, y: 180%)[\[] p_n^B \( L_B \, T_h \) - p_n^C \( L_B \, T_c \) #scale(x: 180%, y: 180%)[\]] \, med med upright("and")\
eta & = W / Q_(upright("hot")) = 1 - frac(sum_n E_n \( L_B \) #scale(x: 120%, y: 120%)[\[] p_n^B \( L_B \, T_h \) - p_n^C \( L_B \, T_c \) #scale(x: 120%, y: 120%)[\]], T_h #scale(x: 120%, y: 120%)[\[] S_B \( L_B \, T_h \) - S_A \( L_A \, T_h \) #scale(x: 120%, y: 120%)[\]]) \,\
upright("with,") & quad upright("Coefficient of Merit") = W times eta / eta_c . $<eq:isoceffiwork>

@Fig3\(a) and (b) show the efficiency and work output, respectively, for a particle confined in an IPW operating as a three-stroke quantum isochoric heat engine. Both efficiency and work output increase with the temperature difference between the baths and tend to saturate for large well length $L_B$. The efficiency of the quantum isochoric cycle exceeds that of the classical triangular cycle and saturates at larger $L_B$ slightly above the efficiency of a classical three-stroke isochoric cycle. In the limit $T_h arrow.r oo$, @eq:trianeta gives $eta_(upright("CT")) = eta_c \/ 2$ for the triangular cycle, while from Eqs.~@eq:classical-isocho-eta and @eq:isoceffiwork the efficiency of the classical and quantum isochoric cycle approaches the classical four-stroke Carnot efficiency. The work done by a particle in an IPW undergoing the quantum isochoric cycle does not exceed the work produced by a monoatomic ideal gas operating in the classical triangular and classical isochoric cycles between the same temperatures.

== Three-Stroke Quantum Isoenergetic Cycle for Quantum Particle in an Infinite Potential well
<IID>
#figure(image("source/Fig5.pdf", width: 95.0%),
  caption: [
    Length - Temperature diagram of the IPW for a three-stroke quantum isoenergetic cycle. Stroke $A arrow.r^() B$ is the isothermal stroke, $B arrow.r^(upright("Purple")) C$ is the isoenergetic stroke, and $C arrow.r^() A$ is the adiabatic stroke.
  ]
)
<Fig4>

#figure(image("source/Fig6.pdf", width: 92.0%),
  caption: [
    \(a) Efficiency in units of $eta \/ eta_c$ and (b) Work output (in meV) for a particle in an IPW undergoing a three-stroke quantum isoenergetic cycle working as a heat engine at different bath temperatures. In (a), the black dashed line corresponds to $eta_(upright("CT")) \/ eta_c$ from @eq:trianeta (classical triangular cycle), while the dotted-dashed line shows $eta_(upright("CI")) \/ eta_c$ from Eq.~@eq:classical-isocho-eta (classical isochoric cycle). In (b), the dashed and dotted-dashed lines indicate the work outputs $W_(upright("CT"))$ (@eq:workmonoatomic) and $W_(upright("CI"))$ (Eq.~@eq:classical-isochor-work) for a monoatomic ideal gas undergoing the classical triangular and classical isochoric cycles, respectively. Cold bath temperature used for the classical triangular and classical isochoric cycle is taken to be the average of $T_c$ attained by the system at the end of the isoenergetic stroke within the length considered. $L_B$ is the initial length of the well during the isoenergetic process and $L_A = 1 upright("nm")$ .
  ]
)
<Fig5>

This cycle was first, studied in Ref.~@ou2016exotic, and considers a particle in a 1D IPW of variable length $L$ that interacts with a single heat bath at temperature $T_h$. The cycle (Figs.@Fig1 (purple line) and @Fig4) consists of three strokes, an isothermal stroke ($A arrow.r^() B$), an isoenergetic stroke where the internal energy is held constant ($B arrow.r^(upright("Purple")) C$), and an adiabatic stroke ($C arrow.r^() A$). The exact derivation for the heat exchanged and the work performed can be found in Ref.~@ou2016exotic. Here, we briefly review the cycle.

- #strong[Stroke A $arrow.r$ B (Isothermal):] The system, initially coupled to the hot bath at temperature $T_h$ with well length $L_A$, undergoes an expansion. The well length changes from $L_A$ to $L_B$ at constant temperature $T_h$. The heat absorbed from the hot bath is given by, $ Q_(upright("hot")) = T_h #scale(x: 120%, y: 120%)[\[] S_B \( L_B \, T_h \) - S_A \( L_A \, T_h \) #scale(x: 120%, y: 120%)[\]] . $<eq:Qhot>

- #strong[Stroke B $arrow.r^(upright("Purple"))$ C (Isoenergetic):] This stroke is performed at constant internal energy, and the system is brought to an effective temperature $T_c$ while the well length changes to $L_C$. This step imposes the condition, $ U_B \( L_B \, T_h \) = U_C \( L_C \, T_c \) \, $<eq:Ucondition> the heat rejected ($Q_(upright("cold"))$) during this process is equal to the work exchanged ($W'$) @ou2016exotic, $ Q_(upright("cold")) = W' = integral_(L_B)^(L_C) f \( L \, T \) d L \, $<eq:Qcold> where $f \( L \, T \) = - sum_n frac(partial E_n \( L \), partial L) p_n \( L \, T \)$, is the generalized force. For a particle in an IPW, $frac(partial E_n \( L \), partial L) = - 2 frac(E_n \( L \), L)$, which implies $f \( L \, T \) = 2 frac(U \( L \, T \), L)$ (see Eq.(5) in Ref.@ou2016exotic). Since, internal energy is kept constant throughout this stroke, we obtain, $ Q_(upright("cold")) = - 2 U_B \( L_B \, T_h \) ln #h(-1em) (L_B / L_C) . $<Qcold2>

- #strong[Stroke C $arrow.r$ A (Adiabatic):] The system returns to its initial state without heat exchange in this stroke, which obeys the adiabatic condition; $ S_A \( L_A \, T_h \) = S_C \( L_C \, T_c \) \, $<eq:adia_cond> which, following a derivation similar to @eq:lengthconditionforadiaisocho, reduces to, (see, Eq.(12) of Ref.@ou2016exotic) $ L_C = L_A sqrt(T_h / T_c) . $<eq:lengthconditionforadia>

The two conditions, Eqs.~@eq:Ucondition and @eq:lengthconditionforadia, are solved simultaneously to determine $L_C$ and $T_c$ numerically. It should be emphasized that $T_c$ is not the bath temperature but rather the effective temperature, the system reaches at the end of the isoenergetic process, and it depends on the parameters: $L_A \, L_B$ and $T_h$. The total work performed $W = Q_(upright("hot")) + Q_(upright("cold"))$, is obtained from Eqs.@eq:Qhot and @Qcold2, and the efficiency of the cycle is given by, $ eta = W / Q_(upright("hot")) = 1 - frac(2 U_B \( L_B \, T_h \), Q_(upright("hot"))) ln #h(-1em) (L_B / L_C) . $<eq:efficiency>

@Fig5\(a) and (b) present the corresponding efficiency and work output for a particle in an IPW under a three-stroke quantum isoenergetic cycle. In this cycle, both efficiency and work output exhibit only mild dependence on the bath temperature $T_h$, with work output showing a slight increase as $T_h$ grows. We compare the quantum isoenergetic cycle's performance with a classical triangular and classical isochoric cycle operating between $T_h$ and $T_c^(upright(a v))$, where $T_c^(upright(a v))$ is the average effective cold temperature for a particle in an IPW undergoing the three-stroke quantum isoenergetic cycle across the considered $L_B$ range. In this comparison, we observe that both the efficiency and the work output of the quantum isoenergetic cycle remain below those of the classical triangular and classical isochoric cycle.

#figure(
  table(
    columns: (1.4fr, 1fr, 1fr, 1fr, 1fr),
    align: (left, center, center, center, center),
    table.header(
      [], table.cell(colspan: 2)[$L_B = 50.0$ nm], table.cell(colspan: 2)[$L_B = 100.0$ nm],
      [Parameter], [Isochoric], [Isoenergetic], [Isochoric], [Isoenergetic],
    ),
    [$L_A$ (nm)], [5.270], [1.0], [10.541], [1.0],
    [$T_c$ (K)], [1.0], [1.006], [1.0], [0.965],
    [$eta/eta_c$], [*0.779*], [0.220], [*0.796*], [0.197],
    [Work $W$ (meV)], [*13.610*], [3.905], [*14.642*], [4.579],
    [$W eta/eta_c$ (meV)], [*10.602*], [0.859], [*11.649*], [0.904],
  ),
  caption: [Performance comparison for a particle in a 1D infinite potential well at $T_h = 90$ K. The isochoric cycle uses $T_c = 1.0$ K. The isoenergetic cycle has $L_C = 9.45$ nm and $9.65$ nm for $L_B = 50.0$ nm and $100.0$ nm, respectively.],
  scope: "parent", placement: top,
) <table1>

Unlike the single-bath isoenergetic cycle, where increasing $T_h$ does not enhance efficiency (see, Fig.@Fig5\(a)), the three-stroke quantum isochoric cycle in Sec.@IIB, demonstrates clear gains in both efficiency and work output (see, Fig.@Fig3\(a) and (b)). A performance comparison between the three-stroke quantum isochoric and isoenergetic cycles is presented in Table @table1. The temperature of the cold bath during the quantum isochoric cycle, $T_c$, is fixed at 1 K. This $T_c$ is approximately the effective cold temperature achieved in the isoenergetic cycle for the parameters considered. The results indicate that the quantum isochoric cycle achieves superior efficiency, work output and a higher overall coefficient of merit compared to isoenergetic cycle. Furthermore, implementing a quantum isochoric stroke is experimentally more feasible than realizing a quantum isoenergetic stroke~@pena2016optimization@uusnakki2025experimental. For these reasons, in the following section we concentrate on graphene-based systems undergoing the quantum isochoric cycle.

= Landau Levels of Graphene Systems
<III>
In the presence of a perpendicular magnetic field, for MLG and BLG, the Landau level energies $E_n^(upright("MLG")) \( B \)$ and $E_n^(upright("BLG")) \( B \)$ are calculated using the low-energy effective Hamiltonians near the Dirac points ~@goerbig2011electronic@python2019@mccann2013electronic@mccann2006landau, i.e,



$ E_n^"MLG"(B) &= plus.minus v_f sqrt(2 e B ℏ n) \
E_n^"BLG"(B) &= plus.minus frac(ℏ e B, m_"eff") sqrt(n(n-1)). $<eq:spec_mono_bi>



where $m_(upright("eff")) approx 0.035 thin m_e$ the effective electron mass in BLG~@mccann2006landau. For TBG, the continuum model consists of two Dirac-like Hamiltonians for each layer, coupled via interlayer tunneling across the rotated layers~@moire@python2019. Restricting interactions to the first moiré shell yields an effective eight-band Hamiltonian~@moire@bistritzer2011moire@lopes2012continuum,



$ script(H)_theta^"TBG"(bold(k)) = mat(
h_(theta/2)^"MLG"(bold(k)), T_b, T_(t r), T_(t l);
T_b^dagger, h_(-theta/2)^"MLG"(bold(k)_b), 0, 0;
T_(t r)^dagger, 0, h_(-theta/2)^"MLG"(bold(k)_(t r)), 0;
T_(t l)^dagger, 0, 0, h_(-theta/2)^"MLG"(bold(k)_(t l))
). $<eq:TBG>



where $upright(bold(k))$ is the momentum in the moiré Brillouin zone, and $bold("k")_i = bold("k") + tilde(bold("k"))_i$ with $i in { upright("b,tr,tl") }$ indexing the shifted momenta $tilde(bold("k"))_i$. $h_theta^(upright("MLG")) \( upright(bold(k)) \)$ denotes the monolayer Dirac Hamiltonian rotated by $theta$~@python2019@soufy2025flatband@singh2021magic. The shifted momenta are given as,

$ tilde(bold("k"))_b = kappa_theta \( 0 \, - 1 \) \, quad tilde(bold("k"))_(t r) = kappa_theta (sqrt(3) / 2 \, 1 / 2) \, quad tilde(bold("k"))_(t l) = kappa_theta (- sqrt(3) / 2 \, 1 / 2) \, $<eq:Hoppingvectors>

with $kappa_theta = frac(8 pi, 3 a) sin (theta \/ 2)$, where $a = 2.46 thin upright("Å")$ is the graphene lattice constant. The interlayer hopping matrices are given as,

$ T_b = omega mat(delim: "[", 1, 1; 1, 1) \, quad T_(t r) = omega mat(delim: "[", e^(- i phi.alt), 1; e^(i phi.alt), e^(- i phi.alt)) \, quad T_(t l) = omega mat(delim: "[", e^(i phi.alt), 1; e^(- i phi.alt), e^(i phi.alt)) \, $<eq:Hoppingmatrix>

with $omega = 110 med upright("meV")$ being the interlayer hopping energy and $phi.alt = 2 pi \/ 3$ @moire. This Hamiltonian can be reduced to a two-band model~@moire@python2019,

$ cal(H)_theta^(upright("TBG")) \( upright(bold(k approx 0)) \) = ℏ v_f^(*) thin bold(sigma^(*) dot.op k) \, quad v_f^(*) = v_f frac(1 - 3 alpha_theta^2, 1 + 6 alpha_theta^2) \, $<eq:TBG_2band>

with $v_f^(*)$ representing the renormalized Fermi velocity and $alpha_theta = omega \/ \( ℏ v_f kappa_theta \)$ defining the dimensionless interlayer coupling. The renormalized Fermi velocity $v_f^(*)$ goes to zero at the magic angle $theta^(*) = 1.05^compose$, which indicates the presence of a flat band dispersion. The complete derivation of Landau levels for TBG in a magnetic field is provided in Ref.~@python2019.

== Three-Stroke Quantum Isochoric Cycle for Graphene Based system
<IIIA>
#figure(image("source/Fig7.pdf", width: 95.0%),
  caption: [
    Magnetic field - Temperature (B-T) diagram for graphene based systems in a three-stroke quantum isochoric cycle. Stroke $A arrow.r^() B$ is the isothermal stroke, $B arrow.r^(upright("Green")) C$ is the quantum isochoric stroke, and $C arrow.r^() A$ is the adiabatic stroke.
  ]
)
<Fig6>

Similar to a quantum particle in an IPW, a three-stroke quantum isochoric cycle can be defined for graphene based systems, with the magnetic field $B$ replacing the well length as the tunable parameter. The Landau level energies for graphene based systems can be obtained using Eqs.@eq:spec_mono_bi and @eq:TBG. We can then define thermal state ($rho \( B \, T \)$) for a graphene based systems as, @vinjanampathy2016quantum@quan2007quantum@quan2009quantum, 

$ rho(B,T) &= sum_n p_n "|" n "⟩" "⟨" n "|" \
p_n(B,T) &= e^(-beta E_n(B))/Z(B,T) \
Z(B,T) &= sum_n e^(-beta E_n(B)). $<eq:thermal_forB>



where $p_n \( B \, T \)$ are the occupation probabilities, $Z \( B \, T \)$ is the partition function and $beta = frac(1, k_B T)$, where $k_B$ is the Boltzmann constant. Once the thermal state is determined, other thermodynamic quantities can be computed, such as entropy $S = - k_B sum_n p_n ln p_n$ and internal energy $U = sum_n p_n E_n$. For infinitesimal transformations, using @eq:firstlaw, we obtain for the work done and heat exchanged, $ W = - sum_n p_n \( B \, T \) d E_n \, quad Q = sum_n E_n \( B \) d p_n . $<eq:QandW_forB>

These relations are used to evaluate the performance of various graphene based systems. Now, we briefly discuss the three stroke quantum isochoric cycle for graphene based systems as depicted in Fig.@Fig6.

- #strong[Stroke A $arrow.r$ B (Isothermal):] The system in equilibrium with the hot bath at temperature $T_h$ at magnetic field $B_A$ is brought to a magnetic field $B_B$ isothermally. The heat absorbed from the hot reservoir can be calculated using @eq:QandW_forB, $ Q_(upright("hot")) = sum_n integral_(B_A)^(B_B) E_n \( B \) frac(partial p_n \( B \, T \), partial B) thin d B \, $ which reduces to (see Appendix A),

  $ Q_(upright("hot")) = T_h (S_B \( B_B \, T_h \) - S_A \( B_A \, T_h \)) . $<eq:Qhot_graphene>

- #strong[Stroke B $arrow.r^(upright("Green"))$ C (Isochoric):] The magnetic field is held constant at $B_B$ as the system thermalizes to temperature $T_c$ of the cold bath. The heat rejected to the cold reservoir is obtained using @eq:QandW_forB, $ Q_(upright("cold")) = sum_n E_n \( B_B \) (p_n^C \( B_B \, T_c \) - p_n^B \( B_B \, T_h \)) . $<eq:Qcold_graphene>

- #strong[Stroke C $arrow.r$ A (Adiabatic):] The system is decoupled from the bath and the magnetic field is changed back to its initial value $B_A$ with no heat exchange. As this is an isoentropic process, we have, $ S_C \( B_B \, T_c \) = S_A \( B_A \, T_h \) . $<eq:adiabatic_condition_graphene>

#figure(image("source/Fig8.pdf", width: 100.0%),
  caption: [
    Adiabatic condition from @eq:adiabatic_condition_graphene relating the initial and final magnetic fields $B_A$ and $B_B$ for graphene-based systems, with bath temperatures $T_h = 100 thin upright(K)$ and $T_c = 50 thin upright(K)$.
  ]
)
<Fig7>

#figure(
  table(
    columns: (1fr, 1.25fr),
    table.header([System], [$alpha$]),
    [MLG], [$2.0000 plus.minus 0.0000 approx 2.0$],
    [BLG], [$1.0000 plus.minus 0.0000 approx 1.0$],
    [MATBG ($theta = 1.05^compose$)], [$0.4977 plus.minus 0.0001 approx 0.5$],
    [TBG ($theta = 3.0^compose$)], [$2.0140 plus.minus 0.0002 approx 2.0$],
  ),
  caption: [Best-fit exponents in $B_B = B_A (T_c/T_h)^alpha$ at $T_h = 100$ K and $T_c = 50$ K.],
) <table2>

As shown earlier in Sec.@IIC, Eqs.@eq:icho2nd and @eq:entoiscoho, the second law of thermodynamics holds for three-stroke quantum isochoric cycle. Since this derivation is general, it also applies to this cycle, yielding the same entropy changes as in @eq:entoiscoho. The net work done can be obtained from Eqs. @eq:Qhot_graphene and @eq:Qcold_graphene as $W = Q_(upright("cold")) + Q_(upright("hot"))$. The work done and efficiency is then,

$ W & = T_h (S_B \( B_B \, T_h \) - S_A \( B_A \, T_h \))\
 & - sum_n E_n \( B_B \) (p_n^B \( B_B \, T_h \) - p_n^C \( B_B \, T_c \)) \,\
eta & = 1 - frac(sum_n E_n \( B_B \) (p_n^B \( B_B \, T_h \) - p_n^C \( B_B \, T_c \)), T_h (S_B \( B_B \, T_h \) - S_A \( B_A \, T_h \))) . $

For MLG and BLG, the adiabatic condition imposes stricter constraints on the thermal probabilities due to the energy-scaling condition @pena2020otto@quan2007quantum@soufy2025flatband, $ p_n^C \( B_B \, T_c \) = p_n^A \( B_A \, T_h \) quad forall med n . $<eq:population_constraint>

#figure(image("source/Fig9.pdf", width: 100.0%),
  caption: [
    \(a) Efficiency in units of $eta \/ eta_c$ and (b) Work output (in meV) for graphene based systems undergoing a three-stroke quantum isochoric cycle. $B_B$ is the external magnetic field during the quantum isochoric process. In (a), the black dashed line corresponds to $eta_(upright("CT")) \/ eta_c$ from @eq:trianeta (classical triangular cycle), while the dotted-dashed line shows $eta_(upright("CI")) \/ eta_c$ from Eq.~@eq:classical-isocho-eta (classical isochoric cycle). In (b), the dashed and dotted-dashed lines indicate the work outputs $W_(upright("CT"))$ (@eq:workmonoatomic) and $W_(upright("CI"))$ (Eq.~@eq:classical-isochor-work) for a monoatomic ideal gas undergoing the classical triangular and classical isochoric cycles, respectively, at $T_h = 100 K$ and $T_c = 50 K$.
  ]
)
<Fig8>

Following an analogous derivation to that of @eq:lengthconditionforadia, we obtain explicit scaling relations linking the magnetic field to the bath temperatures, $ B_B = B_A (T_c / T_h)^2 quad upright("(MLG)") \, #h(2em) B_B = B_A (T_c / T_h) quad upright("(BLG)") . $<eq:scaling_relations>

Since an analytical expression for the Landau levels of TBG cannot be obtained, we determine the relation between $B_B$ and $B_A$ using @eq:adiabatic_condition_graphene. @Fig7 illustrates this relation across different graphene systems. We observe that the isoentropic lines of TBG at larger twist angles (i.e, $theta approx 3^compose$) coincide with those of MLG, reflecting the effective decoupling of TBG into MLG at large angle regime, as predicted in Refs.@bistritzer2011moire@python2019. Using a linear fit to the data in @Fig7, we find the coefficient $alpha$ for the relation $B_B = B_A \( T_c \/ T_h \)^alpha$. Table~@table2 lists the obtained values for the different graphene-based systems for $T_h = 100 thin upright(K)$ and $T_c = 50 thin upright(K)$.

= Results and discussion
<IV>
In this section, we present numerical results for graphene based systems operating under a three-stroke quantum isochoric cycle. For computational accuracy, we take the first 500 Landau levels, which has been verified to yield convergent and reliable results across various graphene systems @python2019@singh2021magic@soufy2025flatband. All numerical codes used to produce the results and figures in this work are available in @ThreestrokeCode.

#figure(
  table(
    columns: (1.4fr, 1fr, 1fr, auto),
    table.header([System], [A (T or nm)], [B (T or nm)], [$eta/eta_c$]),
    [MLG], [1.756], [0.439], [0.418],
    [BLG], [4.916], [2.458], [0.505],
    [MATBG ($1.05^compose$)], [1.392], [0.986], [*0.563*],
    [TBG ($3.0^compose$)], [3.268], [0.809], [0.408],
    [Particle in 1D IPW], [6.547], [9.259], [0.536],
  ),
  caption: [Efficiency and operating parameters at equal work output $W = 0.815$ meV with $T_h = 100$ K and $T_c = 50$ K. Columns A and B give magnetic field in tesla, or well width in nanometres for the infinite potential well.],
) <table3>

@Fig8 (a) and (b) illustrate the performance of various graphene platforms operating under the three-stroke quantum isochoric cycle. We see that the thermodynamic efficiency of MATBG surpasses that of other graphene platforms, and it exceeds the classical triangular cycle efficiency across the entire range of the magnetic field and slightly surpasses the three-stroke classical isochoric cycle efficiency for lower magnetic field $B_B$ considered. Large-angle TBG and MLG display the lowest efficiency and work output, both of which decrease rapidly as $B_B$ increases. BLG on the other hand is seen to operate with modest efficiency and work output, with the efficiency dropping below the classical triangular cycle efficiency for larger values of $B_B$. From @Fig7 and Table~@table2, it is evident that the magnetic field values $B_B$ and $B_A$ are relatively closer for MATBG than for other graphene based systems operating between bath temperatures $T_h = 100$K and $T_c = 50$K. This results in a smaller work output for MATBG, as the area enclosed by the quantum three-stroke isochoric cycle will be smaller. Nevertheless, MATBG achieves higher efficiency, indicating a more effective conversion of input heat into work (see, Fig. @Fig8). Since the cycle sizes differ across graphene based systems, we compare their efficiencies at equivalent work output for a fair performance assessment. Table~@table3 provides an analysis of efficiency and the required parameters for equal work output in graphene based systems and a particle in an IPW, operating under a three-stroke quantum isochoric cycle with bath temperatures $T_c = 50$ K and $T_h = 100$ K. This reveals that MATBG attains the highest efficiency at similar work output despite operating within a smaller cycle in the parameter space. The smaller area of the three-stroke quantum isochoric cycle of MATBG due to relatively close $B_B$ and $B_A$, leads to reduced heat absorption from the hot bath, as depicted in @eq:Qhot_graphene in turn due to a smaller entropy difference. However, MATBG rejects even less heat to the cold bath, as per @eq:Qcold_graphene, owing to smaller Landau level energies and spacing (see, Appendix B). These factors collectively enable MATBG to achieve higher efficiency with moderate work output.

=  Experimental Realization and Conclusion
<V>
#figure(image("source/Fig10.pdf", width: 95.0%),
  caption: [
    T-S diagram of MATBG with isochoric contour lines
  ]
)
<Fig9>

@Fig9 shows the temperature--entropy (T--S) diagram for MATBG, highlighting the isochoric contours and the three-stroke quantum isochoric cycle explored in this work. Realizing such a cycle experimentally requires precise control of both temperature and magnetic field, with feasibility determined by the ability to implement each thermodynamic stroke reliably. A quantum isochoric stroke can be achieved by coupling the system to a thermal reservoir while maintaining a constant magnetic field, an operation that is considerably more accessible experimentally than the quantum isoenergetic stroke~@pena2016optimization@uusnakki2025experimental. Few-stroke engines further reduce experimental overhead by minimizing the number of required control operations per cycle while retaining quantum-enhanced performance~@klatzow2019quantum. Recent advances in nanoscale thermodynamic measurements, such as single-electron transistor, based thermometry and scanning thermoelectric probes capable of entropy mapping~@rozen2021entropic@abualnaja2023entropy@pyurbeeva2021entropy, provide the essential tools for implementing and characterizing quantum thermodynamic cycles in MATBG and other strongly correlated two-dimensional materials.

In this work, we introduced and analyzed a three-stroke quantum isochoric cycle operating as a heat engine between two thermal reservoirs. Using a particle in a one-dimensional infinite potential well as a prototype system, we demonstrated that the cycle achieves higher efficiency than the classical triangular engine, which reaches only half the Carnot limit, and also surpasses the performance of the previously proposed three-stroke quantum isoenergetic cycle~@ou2016exotic. We then extended our analysis to graphene-based systems under perpendicular magnetic fields, including monolayer graphene (MLG), AB-stacked bilayer graphene (BLG), and twisted bilayer graphene (TBG) at both magic and non-magic angles. Among these platforms, magic-angle TBG (MATBG) achieves the highest efficiency for comparable work output, even with a smaller cycle size. This result underscores the promise of engineered quantum materials, particularly those with tunable flat-band electronic structures such as TBG, as optimal working substances for controllable, high-performance quantum thermodynamic devices.

Overall, the three-stroke quantum isochoric cycle offers distinct experimental advantages for probing and exploiting thermodynamic behavior in complex quantum materials. Its reduced operational complexity makes it well suited for nanoscale implementations, while its ability to leverage quantum effects provides a pathway toward enhanced thermodynamic performance. When combined with state-of-the-art experimental techniques, such as nanoscale thermometry, entropy imaging, and magneto-transport measurements~@mecklenburg2015nanoscale, the cycle provides a powerful framework for studying microscopic energy-conversion mechanisms in quantum systems. More broadly, our results position tunable moiré materials and low-dimensional heterostructures as versatile platforms for developing functional quantum thermodynamic technologies, including efficient nanoscale energy harvesters and integrated quantum cooling architectures.

#bibliography("references.bib", style: "ieee")

#heading(level: 2, numbering: none)[Appendix A: Heat Exchange in Quantum Isothermal Processes]
<appendix-a-heat-exchange-in-quantum-isothermal-processes>
In quantum thermodynamics, an isothermal process is characterized by the system maintaining thermal equilibrium with a heat reservoir at a constant temperature as its external parameters change. For a quantum system subjected to a changing magnetic field $B$, this process ensures the system evolves through instantaneous thermal states. From the first law of thermodynamics, the infinitesimal heat exchange during such a process is given by the energy-level weighted change in occupation probabilities, $ delta Q = sum_n E_n \( B \) thin d p_n \( B \, T \) \, $ where $E_n \( B \)$ are the energy eigenvalues and $p_n \( B \, T \)$ are the occupation probabilities. For a finite change in magnetic field from $B_1$ to $B_2$, the total heat exchanged becomes, $ Q = integral_(B_1)^(B_2) sum_n E_n \( B \) frac(partial p_n \( B \, T \), partial B) d B . $<eq:appendix_heat_integral> This integral is path-dependent in parameter space, reflecting the fact that heat is a path-dependent quantity. Now, consider the derivative of entropy ( $S \( B \, T \) = - k_B sum_n p_n \( B \, T \) ln p_n \( B \, T \)$) with respect to the magnetic field, $ frac(partial S, partial B) & = - k_B sum_n [frac(partial p_n, partial B) ln p_n + p_n frac(partial, partial B) \( ln p_n \)]\
 & = - k_B sum_n frac(partial p_n, partial B) ln p_n - k_B sum_n frac(partial p_n, partial B) \, $ where the second term vanishes due to probability conservation $sum_n partial p_n \/ partial B = 0$. Thus, $ frac(partial S, partial B) = - k_B sum_n frac(partial p_n, partial B) ln p_n \( B \, T \) . $<eq:entropy_derivative>

Using the thermal distribution expression $ln p_n \( B \, T \) = - beta E_n \( B \) - ln Z \( B \, T \)$, we substitute into @eq:entropy_derivative, $ frac(partial S, partial B) & = - k_B sum_n frac(partial p_n, partial B) (- beta E_n - ln Z)\
 & = 1 / T sum_n frac(partial p_n, partial B) E_n + k_B ln Z sum_n frac(partial p_n, partial B) . $

The second term again vanishes due to probability conservation, yielding, $ frac(partial S, partial B) = 1 / T sum_n frac(partial p_n, partial B) E_n . $<eq:entropy_heat_relation>

Integrating @eq:entropy_heat_relation from $B_1$ to $B_2$, $ integral_(B_1)^(B_2) frac(partial S, partial B) d B = 1 / T integral_(B_1)^(B_2) sum_n frac(partial p_n, partial B) E_n d B . $

Recognizing the right-hand side as $Q \/ T$ from @eq:appendix_heat_integral, we obtain the fundamental isothermal relation, $ S \( B_2 \, T \) - S \( B_1 \, T \) = Q / T quad arrow.r.double quad Q = T Delta S \, $<eq:isothermal_heat_entropy> where $Delta S = S \( B_2 \, T \) - S \( B_1 \, T \)$. This result demonstrates that for quantum isothermal processes, the heat exchange is directly proportional to the entropy change, with the temperature serving as the proportionality constant. This relation holds regardless of the specific functional forms of $E_n \( B \)$.

#heading(level: 2, numbering: none)[Appendix B: Comparative analysis of Landau level spectra and occupation probabilities in various graphene platforms]
<appendix-b-comparative-analysis-of-landau-level-spectra-and-occupation-probabilities-in-various-graphene-platforms>
@Fig10 illustrates the distinct Landau level across various graphene systems, highlighting fundamental differences in their response to magnetic fields. MLG and BLG exhibit characteristic $sqrt(B)$ and linear $B$ dependencies respectively, as seen in @eq:spec_mono_bi, while TBG display more complex spectral features. MATBG ($theta = 1.05^compose$) shows exceptionally tight level packing resulting from moiré flat band formation, whereas larger twist angles ($theta = 3.0^compose$) progressively approach monolayer-like behavior due to interlayer decoupling @python2019. These unique Landau level spectra has profound influence over the occupation probabilities as seen in @Fig11. MATBG's minimal level spacing and low energies enable nearly uniform occupation probability distributions, in contrast to other graphene systems where occupation is more concentrated in lower energy levels due to wider level separations.

#figure(
  image("source/Fig11.pdf", width: 100%),
  caption: [Magnetic field dependence of Landau level splitting in (a) MLG, (b) BLG, (c) MATBG at $theta = 1.05^compose$, and (d) TBG at $theta = 3.0^compose$.],
) <Fig10>

#figure(
  image("source/Fig12.pdf", width: 100%),
  caption: [Occupation probabilities in thermal equilibrium ($T = 50$ K, $B = 0.5$ T) for the same four graphene systems.],
) <Fig11>
