#set page(paper:"a4", margin:23mm, numbering:"1")
#set text(font:"Libertinus Serif", size:10.5pt)
#set par(justify:true, leading:.6em)
#set heading(numbering:"1.1")
#set math.equation(numbering:"(1)")
#show figure.caption: set text(size:9pt)
#align(center)[
  #text(size:16pt,weight:"bold")[Resonant states and nuclear dynamics in solid-state systems: the case of silicon-hydrogen bond dissociation]
  #v(.6em)
  Woncheol Lee#super[1], Mark E. Turiansky#super[1], Dominic Waldhör#super[2], Byounghak Lee#super[3], Tibor Grasser#super[2], and Chris G. Van de Walle#super[1]
  #v(.5em)
  #super[1] Materials Department, University of California, Santa Barbara, California 93106-5050, USA \
  #super[2] Institute for Microelectronics, Technische Universität Wien, Gußhausstraße 27–29, 1040 Vienna, Austria \
  #super[3] Samsung Research America, Mountain View, California 94043-2235, USA
]

*Abstract.* Bond breaking in the presence of highly energetic carriers is central to
many important phenomena in physics and chemistry, including radiation
damage, hot-carrier degradation, activation of dopant-hydrogen complexes
in semiconductors, and photocatalysis. Describing these processes from
first principles has remained an elusive goal. Here we introduce a
comprehensive theoretical framework for the dissociation process,
emphasizing the need for a non-adiabatic approach. We develop the
methodology and benchmark the results for the case of silicon-hydrogen
bond dissocation, a primary process for hot-carrier degradation.
Passivation of Si dangling bonds by hydrogen is vital in all Si devices
because it eliminates electrically active mid-gap states; understanding
the mechanism for dissociation of these bonds is therefore crucial for
device technology. While the need for a non-adiabatic approach has been
previously recognized, explicitly obtaining diabatic states for
solid-state systems has been an outstanding challenge. We demonstrate
how to obtain these states by applying a partitioning scheme to the
Hamiltonian obtained from first-principles density functional theory.
This approach enables us to identify the Si--H bonding $\( sigma \)$ and
antibonding $\( sigma^(*) \)$ states, from which we extract their energy
eigenvalues and map the associated potential-energy surfaces. Our
results demonstrate that bond dissociation can occur when electrons
temporarily occupy the antibonding states, generating a highly repulsive
excited-state potential that causes the hydrogen nuclear wavepacket to
shift and propagate rapidly. Based on the Menzel-Gomer-Redhead (MGR)
model, we show that after moving on this excited-state potential on
femtosecond timescales, a portion of the nuclear wavepacket can continue
to propagate even after the system relaxes back to the ground state,
allowing us to determine the dissociation probability. By averaging over
quantum trajectories, we calculate a quantum yield that directly aligns
with experimentally measured desorption yields. Our model effectively
explains key experimental features---such as the 7 V threshold bias for
dissociation, as well as the presence of a finite dissociation
probability even at lower bias ranges, the high isotope ratio between
the desorption yields of hydrogen and deuterium, and the temperature
independence of the dissociation process---observed in scanning
tunneling microscopy (STM) and low-energy electron injection
experiments. Finally, we apply our approach to a representative device
scenario, demonstrating its capability to explain the degradation
observed in oxide-stress experiments. Our results provide essential
insights into the fundamental processes that drive carrier-induced bond
breaking in general, and specifically elucidate hydrogen-related
degradation in Si devices, with potential implications for improving
device reliability and performance.

#link("supplement-figures.typ")[Supplementary figures]

= Introduction
<sec:intro>
It is well known that injection of energetic carriers can lead to
breaking of chemical bonds; the phenomenon is at the heart of
photocatalysis, and is known to create radiation damage and other
detrimental effects in semiconductor devices. An important example is
dissociation of silicon-hydrogen bonds, a primary cause of device
degradation~@VandeWalle2000@grasser2014hot@Fleetwood2023effects.
Hydrogen passivates electrically active mid-gap states, which can arise
from silicon dangling bonds in the bulk, on surfaces, at grain
boundaries, and at interfaces~@Pankove1991@VandeWalle1994. However,
during device operation, hydrogen dissociation can occur, depassivating
the dangling-bond (DB) states~@Pankove1991, as illustrated in
Fig.~@fig:schematic_intro. Consequently, Si-H bond dissociation is
considered to be the origin of hot-carrier degradation in modern
metal-oxide-semiconductor field-effect transistors (MOSFETs), a
phenomenon that greatly influences the stability and lifespan of these
devices~@Tyaginov2012@Starkov2011@Reggiani2013@Bina2014.

#figure(image("source/Figure1.pdf", width: 85.0%),
  caption: [
    Schematic representation of (a) an intact Si-H bond and the
    corresponding band structure with no states in the band gap but
    resonant states in the valence band (VB) and conduction band (CB)
    corresponding to bonding $\( sigma \)$ and antibonding
    $\( sigma^(*) \)$ states; and (b) after dissociation, exposing an
    electronically active Si dangling bond and introducing a mid-gap
    state in the band structure. Isosurfaces of the Si-H antibonding
    state and the Si dangling bond are shown.
  ]
)
<fig:schematic_intro>

In spite of its importance, the exact mechanism by which hydrogen
detaches from passivated silicon dangling bonds has remained unclear. An
important experimental observation was provided by Lyding #emph[et
al.]~@Lyding1996, which demonstrated that deuterium processing can
significantly suppress hot-electron degradation in MOSFETs. This finding
laid the groundwork for subsequent device engineering efforts to
incorporate deuterium, thereby enhancing the reliability of silicon
devices~@Kizilyalli1997@Devine1997@Clark1999. Lyding #emph[et al.]
linked their observations to studies of Si--H/D bond dissociation using
scanning tunneling microscopy (STM)~@Shen1995@Avouris1996, which
uncovered a giant isotope effect, showing that deuterium-passivated
bonds are significantly more resistant to dissociation compared to
hydrogen-passivated bonds. These studies proposed that the Si-H bond
dissociation can be induced by (i) electron excitations from the Si--H
bonding state $\( sigma \)$ to its antibonding state $\( sigma^(*) \)$
or (ii) multiple vibrational excitations driven by hot electrons.

The first mechanism originates from the observation of a threshold bias
voltage of around 7~V, beyond which the hydrogen desorption yield
saturates---a phenomenon reported in multiple STM
studies~@Becker1990@Shen1995@Avouris1996@Avouris1996_2@Shen1997@Sakurai1997@Foley1998@Lyding1998@Kanasaki2008.
This threshold energy was initially attributed to the energy required to
excite an electron from the Si-H bonding state to the Si-H antibonding
state~@Becker1990@Shen1995@Avouris1996. The desorption yield was found
to be independent of tunneling current~@Shen1995@Avouris1996 and also of
temperature at bias voltages above 5~V~@Foley1998, indicating that the
dissociation process is driven by a single-electron process and does not
require thermal activation.

The second mechanism stems from STM
results~@Shen1995@Avouris1996@Avouris1996_2 (which were subsequently
disputed~@Soukiassian2003) reporting that at bias voltages below 3.5~V
the bond dissociation yield strongly depends on the tunneling current.
This led to the hypothesis that sequential inelastic scattering by
multiple electrons can gradually excite the vibrational modes of Si--H
bonds, eventually leading to bond dissociation. In line with this
hypothesis, it was proposed that the significant differences in the
stability of Si--H and Si--D bonds could be explained by the excitation
of bending vibrational modes, as Si--D bending modes relax much faster
than those in Si--H bonds~@van1996comment.

Beside STM, other experimental techniques have also been applied with
the aim of elucidating the Si-H bond dissociation process.
Electron-stimulated desorption based on low-energy electron
collisions~@Bernheim2001@Zoubir2004 resulted in Si-H bond dissociation
through electron injection, with a maximum desorption yield around
7-8~eV. Additionally, studies on the treatment of hydrogen-passivated
silicon surfaces with 7.9~eV
lasers~@Pusel1998@Vondrak1999@Vondrak1999_2@Itoh2001 reported
dissociation of Si-H bonds through laser-induced electronic excitation.
All these observations suggest the existence of a bond dissociation
mechanism induced by an electronic process, distinct from thermal
processes.

A striking observation is that a similar threshold of around 6--7 V also
emerges in degradation experiments performed on actual MOSFET devices.
DiMaria's oxide stress
experiments~@DiMaria1999@DiMaria1999_2@DiMaria2000, which involved
injecting hot electrons from the Si channel across the oxide layer to
the poly-Si gate, reveal that the trap creation probability saturates
above 6--7 V and falls off sharply at lower voltages. This parallel
further supports the idea that the process identified in STM
measurements also takes place in actual silicon devices.

The mechanisms inferred from the STM studies \[(i) direct excitation
model and (ii) inelastic scattering\] have provided a basis for modeling
strategies in device engineering, invoking either single-electron or
multi-electron processes to describe bond dissociation by hot
electrons~@Kolasinski2004@Tyaginov2012@Starkov2011@Reggiani2013@Bina2014.
However, both of these mechanisms have encountered significant
challenges when researchers attempted to validate them through
first-principles calculations. A comprehensive theoretical explanation
for the dissociation process driven by electronic processes is therefore
still lacking, not only for the Si-H bond but for chemical bonds in
general. In the following subsections, we review the proposed mechanisms
and discuss the challenges in validating them.

== Direct excitation model
<ssec:direct>
Initial research efforts used computational studies on small
hydrogenated silicon clusters such as
$upright(S i_4 H_10)$~@Avouris1996@Avouris1996_2. These investigations
revealed that within the spectrum of electronic eigenstates of
$upright(S i_4 H_10)$, there are specific occupied and unoccupied states
whose energy levels are highly sensitive to changes in the Si-H bond
length. These particular states were classified as the bonding and
antibonding states associated with the Si-H bond. Excitation of an
electron from the bonding state to the antibonding state was proposed to
create a repulsive potential, exerting a force on the hydrogen nucleus
that can lead to Si-H bond dissociation \[Fig.~@fig:mechanisms\(a)\].
Many subsequent models of hot carrier degradation have been based on the
notion that the excitation of an electron from the Si-H bonding state to
the antibonding state is responsible for the observed bond
dissociation~@Kolasinski2004@Tyaginov2012@Starkov2011@Reggiani2013@Bina2014.

#figure(image("source/Figure2.pdf"),
  caption: [
    Schematic representation of the proposed mechanism for Si-H bond
    dissociation. Historically, two primary mechanisms have been
    discussed: (a) electron excitation from the Si-H bonding state to
    the antibonding state, generating a repulsive potential that leads
    to dissociation, and (b) inelastic resonant scattering by electrons,
    resulting in vibrational excitations that accumulate and ultimately
    cause dissociation. (c) The electron injection mechanism presented
    in this work: injection into the Si-H antibonding state produces a
    repulsive potential and drives the dissociation process. Mechanisms
    (b) and (c) could likewise occur through the interaction of holes
    with bonding states.
  ]
)
<fig:mechanisms>

As larger-scale calculations became feasible, researchers extended their
investigations to larger systems that contain Si-H
bonds~@Miyamoto2000@Wang2006@Rohlfing2008@Liu2021. However, even with
the application of advanced methods such as the time-dependent density
functional theory (TD-DFT) and the Bethe-Salpeter equation (BSE), these
studies have struggled to offer a definitive theoretical explanation for
Si-H bond dissociation. A major challenge has been the difficulty in
distinguishing the Si-H bonding and antibonding states from the bulk
electronic states because they are resonant with each other. This
resonance indicates the presence of electronic coupling between them,
leading to hybridized electronic eigenstates that become delocalized
throughout the entire structure in the calculation. As a result, each
electronic eigenstate is only weakly localized around the Si-H bond.
Therefore, occupying one of these delocalized hybridized states or
transitioning between them has minimal impact on the Si-H bond and does
not lead to bond dissociation in the calculations.

The absence of identifiable localized states in the electronic
eigenstates for larger systems, combined with the inability of these
calculations to reproduce dissociation events, has called into question
earlier conclusions derived from small cluster models, which suggested
that electron excitation from bonding to antibonding states would lead
to Si-H bond dissociation~@Avouris1996@Avouris1996_2. Some works
acknowledged that the states involved in the dissociation process appear
to be "non-adiabatic states"~@Wang2006@Liu2021, suggesting that a
fundamentally different approach may be needed. However, a clear
identification of these target states within the bulk system is still
lacking.

== Inelastic scattering model
<ssec:inelastic>
Several studies aimed to explain the dissociation process by vibrational
excitation of H due to inelastic
scattering~@Stokbro1998@Stokbro1998_2@Jech2021@Alavi2000@Seideman2003.
They focused on the resonant aspect of Si-H bonds, proposing that the
electronic states of Si-H bonds are broadened, allowing electrons to
tunnel through them over a range of energies via inelastic resonant
tunneling. The resulting accumulation of vibrational excitations would
then lead to bond dissociation \[Fig.~@fig:mechanisms\(b)\].

Based on this approach, Stokbro #emph[et al.]~@Stokbro1998_2 modeled the
dissociation yield observed in STM experiments~@Shen1995 by attributing
it to inelastic resonant scattering via Si-H antibonding states. The
model could fit the STM data in the low-bias regime (2-3~V) but could
not explain desorption yields at higher biases. They also proposed that
inelastic resonant scattering by approximately 10 electrons was required
to lead to dissociation~@Stokbro1998_2. However, subsequent STM
experimental data indicated that only 1-2 electrons are needed to
dissociate Si-H bonds even in the low-bias regime~@Soukiassian2003.
Overall, the most distinctive observation from STM experiments---where
the desorption yield exponentially increases with bias voltage below 7~V
and saturates above 7 V---remains unexplained.

Alternative approaches have also been proposed. Seideman #emph[et
al.]~@Alavi2000@Seideman2003 proposed a current-driven desorption model,
suggesting that the desorption yield is proportional to the total rate
of electron transfer into the broadened surface-Si-H resonant state.
They found that by assuming a surface state around 7~eV above the Fermi
level of the silicon substrate, with a Gaussian broadening (full width
at half maximum) of approximately 0.6~eV, they could accurately fit the
measured desorption spectrum within the 5-10 V STM bias voltage range.
This approach was noteworthy for its ability to accurately fit the
desorption spectrum at both below-threshold and above-threshold
energies. Nonetheless, resonant states exhibiting such narrow electronic
broadening have not been reproduced by any first-principles
calculations, suggesting a significant unsolved challenge in elucidating
the dissociation mechanism.

== Issues related to charge capture
<ssec:relax>
Some previous studies have assumed that carrier-induced dissociation can
be calculated by performing TD-DFT~@Liu2021 or constrained-DFT
calculations~@OHara2024 in which, e.g., an electron is forced to occupy
a resonant state, and using atomic relaxations or molecular dynamics to
study the structural response. While the concept of charge capture is
appropriate for states with discrete energy levels in the band gap, it
should not be applied to resonant states, because of the extremely short
timescale on which electrons interact with such states. Indeed, the
typical energy relaxation timescale for charge carriers in
semiconductors is on the order of 1--100
femtoseconds~@Goldman1994@Sabbah2002@Schoenlein1987@Ye1999. Such
short-lived occupation cannot lead to effects such as lattice distortion
or bond dissociation, which require phonon-related processes that occur
on much longer timescales. Consideration of strong electron--nuclear
coupling and quantum-mechanical motion of nuclei will turn out to be
essential.

== Our approach
<ssec:our>
=== A non-adiabatic formalism
<sssec:nonadiabatic>
The shortcomings of earlier approaches highlight the outstanding
challenge to identify the precise mechanism of Si-H bond dissociation
and develop accurate models. In this study, we introduce a comprehensive
theoretical framework based on a non-adiabatic approach to uncover the
exact mechanism of the dissociation process, and show it can
consistently explain the experimental findings. Our non-adiabatic
approach is closely linked to methods used to describe chemical
processes at surfaces and
interfaces~@Gross2009Chap9@Saalfrank2006@Frischorn2006. The description
of non-adiabatic processes is effectively formulated in a localized
orbital framework, such as atomic or molecular orbitals. Such
representations provide physical insight into the coupling between
electronic and nuclear motions and enable identification of resonant
states that mediate this interaction. This coupling is central to
understanding processes like bond dissociation, where changes in the
electronic configuration directly drive nuclear motion and determine the
reaction pathway. Identifying the relevant localized orbitals is
therefore essential not only in solids but also in molecular systems,
even though the latter are already expressed in terms of molecular
orbitals by construction.

In addition, we employ a fully quantum-mechanical treatment of nuclear
motion, in which the proton is represented by a wavepacket. The
wavepacket formulation naturally connects to the quantum mechanical
extensions of Marcus-type descriptions and Franck--Condon
frameworks~@Jortner1976@Alkauskas2014, in which the overlap between
initial and final nuclear states determines the transition probability.
This connection explains the finite dissociation probability observed in
the low-bias range and provides important insight into degradation
processes.

DFT, the most commonly used technique to describe solid-state systems,
employs the Born-Oppenheimer (or adiabatic) approximation~@Born1927,
which separates electronic and nuclear motion by assuming that
electronic changes occur much faster than nuclear motion. This allows
electrons to instantly adjust to any shifts in nuclear positions. Within
DFT, the electronic eigenstates result from diagonalization of the
Hamiltonian including all electronic interactions: this leads to the
hybridization of the bonding and antibonding states of the Si-H bonds
with the continuum of the bulk Si electronic states. To differentiate
between the localized bonding/antibonding states of the Si-H bond and
the continuum states of silicon we therefore need to use a partitioning
method.

=== Partitioning
<sssec:partitioning>
The partitioning process is naturally achieved when starting with a
local basis such as molecular orbitals, which chemists often use to
describe reaction mechanisms, bonding properties, and photochemical
processes. We aim to establish a corresponding approach within the field
of condensed matter physics, using the Si-H bond dissociation process as
a prototype example. Our approach begins by deriving localized
bonding/antibonding states from the DFT eigenstates using the maximally
localized Wannier function (MLWF) approach~@Marzari2012, which is used
in solid-state physics to define localized states corresponding to
atomic and molecular orbitals. By integrating the pseudo-atomic-orbital
(PAO) method~@Qiao2023, we define bonding and antibonding orbitals in a
manner analogous to the linear combination of atomic orbitals (LCAO)
theory.

=== Potential energy curves and nuclear dynamics
<sssec:PES>
Based on the partitioning approach, we calculate the energy of bonding
and antibonding orbital states, which agree with experimentally observed
values. We then construct potential energy curves (PECs) representing
the electronic excitation involving these states, allowing us to
explicitly consider the quantum-mechanical motion of the proton by
propagating the nuclear wavefunction on these PECs. We employ the
Menzel-Gomer-Redhead (MGR) model~@Menzel1964@Redhead1964, which has been
used to describe non-adiabatic bond dissociation processes at
surfaces~@Ramsier1991@Menzel1995@Saalfrank2006.

=== Dissociation probability
<sssec:dis_prob>
Direct electron injection into the Si-H antibonding state generates a
repulsive potential, exerting a force on the hydrogen nuclei and
ultimately leading to the electron-stimulated dissociation of Si-H bonds
\[Fig.~@fig:mechanisms\(c)\]. This confirms that a single-electron
process can induce dissociation with a finite probability. Moreover, we
explain how this process can occur at energy ranges much lower than the
7 V threshold identified in STM experiments. By comparing the
dissociation probabilities for hydrogen and deuterium, we can explain
the giant isotope effect observed in experiments, showing that deuterium
is much more resistant to dissociation than hydrogen due to its greater
mass. We also find that, up to room temperature, the dissociation
process is largely independent of temperature, again consistent with
experimental observations.

=== Distinctions
<sssec:distinctions>
Our approach differs from previous theoretical treatments in several
ways. First, our non-adiabatic treatment of the Si-H bond dissociation
process stands apart from previous methods that relied on the adiabatic
approximation. In this context, adopting a partitioning method is
essential for calculating the Si-H bonding and antibonding states, as
well as the corresponding potential energy curves---a key challenge in
previous studies---since these localized states are not directly
accessible through DFT calculations, which provide only adiabatic
states. Our mechanism also differs from previous
hypotheses~@Kolasinski2004@Tyaginov2012@Starkov2011@Reggiani2013@Bina2014,
which invoked electron excitation from the bonding state to the
antibonding state to generate a repulsive potential that causes Si-H
bond dissociation. Finally, our approach is also distinguished from
previous studies by the fact that we treat proton motion
quantum-mechanically. We explicitly calculate the propagation of the
nuclear wavepacket on the potential energy curves, which is essential
for understanding a key aspect of the process: propagation of the proton
wavepacket along the repulsive excited-state potential can lead to bond
dissociation on an ultrashort timescale, even within the sub-femtosecond
range.

== Beyond Si-H bonds
<ssec:beyond>
Processes involving strong electron--nuclear coupling are not limited to
silicon devices; similar phenomena have been observed in other
materials, but their underlying mechanisms remain as poorly understood
as those related to Si-H bond breaking. Examples include: \
(a) #emph[Radiation-induced defects in materials]. Radiation often
produces large concentrations of highly energetic electron-hole pairs,
and it has been suggested that hot carriers directly lead to defect
formation~@Puzyrev2011@Fleetwood2022@Li2025. \
(b) #emph[Device degradation induced by Auger--Meitner recombination.]
Energetic carriers can be generated in valence or conduction bands as a
result of Auger-Meitner recombination in optoelectronic
devices~@Kioupakis2015. In wide-band-gap semiconductors, the energy
resulting from electron-hole recombination could be large enough to lead
to bond breaking. This has been suggested to be a critical issue in
nitride-based ultraviolet light
emitters~@Glaab2019@Piva2020@Buffolo2022. \
(c) #emph[Activation of dopant--hydrogen complexes]. Hydrogen that is
present during growth or processing of semiconductors can passivate
dopant impurities~@VandeWalle2006. Dissociation of dopant-hydrogen
complexes is essential for rendering the dopants electrically active,
and carrier injection has been demonstrated to achieve this. Examples
include P--H complexes in Si~@Johnson1992@Herring2001, Si--H complexes
in GaAs~@Constant1999@Chevallier1999, and Mg--H complexes in
GaN~@Amano1989@Pearton1996@Kamiura1998. \
(d) #emph[Photodegradation]. Degradation in optoelectronic materials,
such as III-nitrides and hybrid perovskites, has been linked to
photo-generated hot carriers~@Buffolo2022@DeSanti2018@Nickel2017. (e)
#emph[Electron-stimulated desorption]. Low-energy electron collisions
have been observed to lead to dissociation of hydrogen-related bonds on
surfaces other than Si. On hydrogen-passivated diamond surfaces,
dissociative electron attachment through resonant surface states has
been identified as a degradation pathway~@Hoffman2001@Azria2001. \
(e) #emph[Photocatalysis]. The transient occupation of surface
resonances by hot electrons is thought to trigger chemical
reactions~@Mukherjee2013@Christopher2012@Zhang2017.

Proposed explanations of these processes frequently rely on simplified
models or illustrative energy-surface sketches, lacking detailed
potential-energy landscapes. The type of first-principles framework we
propose here can straightforwardly be extended to these other problems.

== Outline
<ssec:outline>
Our paper is organized as follows. In Sec.~@sec:method, we outline the
problem of describing resonant states and introduce a precise method for
calculating these states and deriving the corresponding potential energy
curve. In Sec.~@sec:case, we apply our methodology to the Si-H bond in
silicon, calculating the probability of dissociation processes driven by
electron injection based on the derived potential energy curves. We also
offer an explanation for the experimental observations obtained from STM
and oxide-stress experiments. In Sec.~@sec:disc, we discuss the
implications of our findings and compare them with previous experimental
and theoretical studies. Section~@sec:conc concludes the paper.

= Methodology
<sec:method>
== Definition of the problem
<ssec:def>
We build our framework based on the observation that localized
states---specifically the bonding and antibonding states of Si-H
bonds---play a crucial role in the bond dissociation
process~@Avouris1996@Avouris1996_2. However, calculations of large
realistic systems that explicitly include the bulk states have not been
able to identify these
states~@Miyamoto2000@Wang2006@Rohlfing2008@Liu2021. This is due to the
fact that the bonding and antibonding states of the Si-H bonds are
resonant with the bulk states, and interactions lead to hybridization.
Standard DFT calculations, which rely on a diagonalized electronic
Hamiltonian (see left panel of Fig.~@fig:schematic), will therefore
yield eigenstates that are hybridized and delocalized. This inherent
delocalization obscures the direct identification of the distinct
localized states necessary for analyzing the mechanisms that lead to
dissociation.

#figure(image("source/Figure3.pdf", width: 85.0%),
  caption: [
    Schematic representation of the electronic Hamiltonian with its
    basis set and transformation process. The blue shaded region
    indicates the diagonal elements of the Hamiltonian, corresponding to
    the energy of the respective basis states. The areas shaded in grey
    represent the off-diagonal terms that can have non-zero electronic
    coupling values. The conversion from the tight-binding Hamiltonian
    to the Newns-Anderson Hamiltonian leaves the local state itself
    unchanged $\( t_(a \, a) = epsilon.alt_a \)$, while modifying the
    subspace associated with the bulk states and their coupling to the
    local state.
  ]
)
<fig:schematic>

The analysis of bond dissociation processes is complicated by the need
to determine whether they should be addressed within an adiabatic or
non-adiabatic framework. Previous studies attempted to describe bond
dissociation by utilizing DFT eigenstates, i.e., adiabatic states, and
formulating a model within an adiabatic framework. However, the strong
electron--nuclear interactions that drive bond dissociation processes
require the use of a non-adiabatic framework to capture the
dynamics~@Gross2009Chap9@Saalfrank2006@Frischorn2006. Non-adiabatic
processes are more appropriately described using localized molecular
orbitals, which differ from DFT eigenstates and better represent the
dynamic interactions between electrons and nuclei. Our first aim is
therefore to obtain such localized states.

Physical and chemical processes involving a localized electronic state
resonant with continuum levels have been discussed in various contexts,
such as magnetic impurities in metals~@Anderson1961@Hewson1966,
chemisorption and
desorption~@NEWNS1969@Muscat1978@Norsko1990@Gadzuk1995, and resonant
tunneling in semiconductor quantum-well
structures~@Goldman1987@Wingreen1988@Wingreen1989@Gadzuk1991.
Partitioning the system into an isolated (localized) state embedded
within the continuum of (delocalized) bulk
states~@Feshbach1962@Fano1961@Domcke1977 has proven to be an effective
strategy. This approach is often represented by a Newns-Anderson-type
Hamiltonian~@NEWNS1969@Muscat1978@Norsko1990:
$ H_e = sum_k epsilon.alt_k c_k^dagger c_k + epsilon.alt_a c_a^dagger c_a + sum_k (v_(a k) c_a^dagger c_k + c . c . med) #h(0em) \, $<eq:nah>
where $k$ denotes the index of the bulk (continuum) states and $a$ the
isolated (localized) state (see right panel of Fig.~@fig:schematic). The
Newns-Anderson Hamiltonian is block diagonal, as indicated by the
presence of off-diagonal terms $v_(a k)$, which represent the
one-electron hopping parameter between states $a$ and $k$. If we start
from a DFT calculation, a conversion process which transforms the
diagonal DFT Hamiltonian to the Newns-Anderson Hamiltonian is therefore
required.

== Partitioning and derivation of bonding and antibonding states of Si-H bonds
<ssec:part>
We implement the partitioning process discussed in the previous section
by adopting the MLWF approach~@Marzari1997@Souza2001@Marzari2012, which
has been extensively applied across various systems to delineate
localized bonding orbitals and elucidate chemical bonding properties.
The approach converts the extended Bloch orbitals from a
first-principles calculation into a unique set of Wannier functions
through an optimization of their spatial spread. This procedure is
formally equivalent to determining Foster--Boys localized molecular
orbitals~@Boys1960@Foster1960@Edmiston1963, thereby providing a direct
connection between the solid-state and molecular-chemistry descriptions
of electronic structure. Consequently, the MLWF method effectively
generates localized molecular orbitals from DFT calculations on periodic
systems. Specifically for our study, the Si-H bonding and antibonding
states are not identifiable as separate eigenstates due to extensive
hybridization with the Si valence and conduction bands. By creating
localized orbitals, we can identify the specific molecular orbital
states of interest and distinguish them from other states which comprise
the continuum bath.

For instance, applying the MLWF method to the valence bands of a bulk Si
unit cell uniquely defines the bonding orbitals of Si-Si
bonds~@Marzari1997. Similarly, applying this approach to the
valence-band manifold of a structure containing Si-H bonds enables us to
obtain a Wannier function localized at the Si-H bond of interest,
representing its bonding orbital. Additionally, we obtain other states
localized at Si-Si bonds, corresponding to their bonding orbitals. This
Wannierization procedure can be expressed as:
$ \|upright(bold(R)) n⟩ = med V / \( 2 pi \)^3 integral_(B Z) d upright(bold(k)) e^(- i upright(bold(k)) dot.op upright(bold(R))) sum_(m = 1)^J U_(m n)^(\( upright(bold(k)) \)) \|psi_(m upright(bold(k)))⟩ med #h(0em) \, $<eq:wannier>
where $upright(bold(R)) n$ refers to the Wannier function in cell
$upright(bold(R))$ associated with orbital index $n$, $J$ represents the
total number of Bloch bands included in constructing the Wannier
functions, and $U_(m n)^(\( upright(bold(k)) \))$ is the unitary
rotation matrix obtained from the localization procedure. This process
partitions the system, in a way that accurately represents the physical
characteristics of the system, into the target bonding state of Si-H
bonds and the other states associated with Si-Si bonds.

In a similar way, the antibonding orbital of the Si-H bonds can be
derived from conduction bands, but this process requires additional
considerations. Unlike the valence-band manifold, which is an isolated
group of bands, the conduction bands extend into an infinite continuum
of energy levels. This continuum is often referred to as "entangled
bands". Consequently, defining a finite set of MLWFs necessitates a
disentanglement procedure using a projection
method~@Souza2001@Marzari2012. We choose a trial orbital $g_n$ and
project it onto the DFT Bloch wavefunctions to obtain:
$ \|phi.alt_(n upright(bold(k)))⟩ = sum_(m = 1)^J \|psi_(m upright(bold(k)))⟩ \( A_(upright(bold(k))) \)_(m n) #h(0em) . $<eq:wf0>
where
$\( A_(upright(bold(k))) \)_(m n) = ⟨psi_(m upright(bold(k))) mid(bar.v) g_n⟩$
are the projection coefficients. Next, we calculate the overlap matrix
$(S_(upright(bold(k))))_(m n) = ⟨phi.alt_(m upright(bold(k))) mid(bar.v) phi.alt_(n upright(bold(k)))⟩ = (A_(upright(bold(k)))^dagger A_(upright(bold(k))))_(m n)$
and then apply the Löwdin orthonormalization procedure to obtain
Bloch-like manifolds $tilde(psi)_(n upright(bold(k)))$:
$ \|tilde(psi)_(n upright(bold(k)))⟩ = sum_(m = 1)^J \|phi.alt_(m upright(bold(k)))⟩ (S_(upright(bold(k)))^(- 1 \/ 2))_(m n) #h(0em) . $<eq:wf1>
Finally, we can obtain a unique set of Wannier functions from these
Löwdin-orthonormalized Bloch-like manifolds using the maximal
localization procedure~@Marzari2012.

Equations~(@eq:wf0) and (@eq:wf1) indicate that there is an inherent
arbitrariness in selecting trial orbitals and obtaining Wannier
functions through the projection method for entangled bands. One
effective strategy to define orbitals consistently and mitigate the
arbitrariness is to use accurate atomic orbitals as a projection basis,
known as the pseudo-atomic-orbital (PAO) method~@Agapito2016@Qiao2023.
This approach directly employs atomic orbital projectors derived from
the pseudopotential of each atom, enabling us to accurately extract the
target orbital characteristics from the entangled conduction-band
manifolds. For our purposes, we use pseudo-atomic $s$ and $p$ orbitals
of a Si atom and the $s$ orbital of a H atom as projectors for the
disentanglement procedure. Since these orbitals contribute to both the
valence and conduction bands of the system, we then apply a block
diagonalization scheme~@Qiao2023automated to obtain antibonding states
composed exclusively of conduction-band states. This ensures that the
antibonding orbitals are free of valence-band character, maintaining
their orthogonality and independence.

We note that this approach aligns with the linear combination of atomic
orbitals (LCAO) method for describing bonding and antibonding states.
The bonding orbital is derived from the valence-band manifold, composed
solely of the $s$ and $p$ orbitals of Si and the $s$ orbital of H. By
using the PAO method, the antibonding orbital can now be extracted from
the same set of orbitals.

By employing the MLWF approach along with the PAO method, we can
identify localized orbital states and derive a tight-binding Hamiltonian
(middle panel of Fig.~@fig:schematic). Analyzing the diagonal elements
of this Hamiltonian allows us to determine the energies associated with
the localized bonding and antibonding states of Si-H bonds (noting that
$t_(a \, a) = epsilon.alt_a$). Furthermore, by diagonalizing the
subspace that includes interactions among Si-Si orbitals, we construct
the Newns-Anderson Hamiltonian as expressed in Eq.~(@eq:nah). The
overall procedure is schematically illustrated in Fig.~@fig:schematic.

== Electronic transitions and lifetime
<ssec:transitions>
The Newns-Anderson Hamiltonian allows us to identify one localized state
of interest and a set of delocalized bulk states. The off-diagonal terms
$v_(a k)$ represent the electronic coupling between the localized state
$a$ and each delocalized state $k$. These coupling terms determine the
electronic transition rate between the localized and delocalized states,
which can be described by Fermi's Golden Rule~@Zhu2004@Zhang2008.

The electron transfer rate from bulk states to an empty resonant state,
$Gamma_(k arrow.r a)$, is given by:
$ Gamma_(k arrow.r a) = 2 / ℏ integral f_k \( E \) Delta_k \( E \) delta \( E - E_a \) d E #h(0em) . $<eq:Fermi-Golden2>
Here, $f_k$ represents the occupation probability of the bulk states,
and $Delta_k \( E \)$ is a coupling function weighted by the density of
bulk states $g_k \( E \)$ (per unit energy and per unit
volume)~@Zhu2004@Saalfrank2006:
$ Delta_k \( E \) = pi \| v_(a k) \( E \) \|^2 V g_k \( E \) #h(0em) \, $<eq:Fermi-Golden3>
where $V$ is the volume of the system. Since the bulk states are
normalized over the system volume $V$, the coupling elements $v_(a k)$
naturally scale with $1 \/ sqrt(V)$.

In practice, one performs first-principles calculations for a supercell
of volume $V_(upright(c e l l))$. The calculated matrix element
$v_(a k)^(upright(c e l l))$ scale to the bulk coupling via
$ v_(a k) = v_(a k)^(upright(c e l l)) sqrt(V_(upright(c e l l)) / V) $
Using this scaling, one calculates
$ Delta_k \( E \) = pi \| v_(a k)^(upright(c e l l)) \( E \) \|^2 V_(upright(c e l l)) g_k \( E \) #h(0em) . $<eq:Fermi-Golden4>

For localized states that are strongly coupled to local vibrations, such
as the Si--H antibonding states discussed in the subsequent section, the
interaction with vibrational modes significantly influences the energy
of the localized state. This coupling causes the energy level of the
localized state to fluctuate, effectively broadening its energy
distribution. As a result, the delta function in Fermi's Golden Rule,
which assumes a discrete energy level, is no longer adequate to describe
the transition rate. Instead, the delta function must be replaced by a
probability distribution $P_a \( E \)$ that accounts for how the
vibrational ground state modulates the localized level:
$ Gamma_(k arrow.r a) = 2 / ℏ integral f_k \( E \) Delta_k \( E \) P_a \( E \) d E #h(0em) . $<eq:Fermi-Golden5>
$P_a \( E \)$ is equivalent to a Franck-Condon lineshape function.
Similarly, the electron transfer rate from the occupied resonant state
to the bulk states, $Gamma_(a arrow.r k)$, can be expressed as
$ Gamma_(a arrow.r k) = 2 / ℏ integral \[ 1 - f_k \( E \) \] Delta_k \( E \) P_a \( E \) d E #h(0em) \, $<eq:Fermi-Golden6>
where this rate characterizes the lifetime
$tau = 1 \/ Gamma_(a arrow.r k)$ of the resonant state. This lifetime
plays a key role in determining how long the excitations persist that
can trigger the movement of the hydrogen nucleus.

In principle, $Delta_k$, which represents the electronic interaction
between bulk and localized states, depends on both energy and nuclear
configuration. However, it is commonly assumed that the energy
dependence of the electronic coupling is
negligible~@Wingreen1989@Gadzuk1991@Santos2022\; we will therefore
approximate it as being energy-independent. In addition, we will assume
that the dependence on nuclear coordinates is negligible. The electronic
coupling will thus remain invariant and constant throughout the process.
With these assumptions, and in the limit where the bulk states are
mostly unoccupied $\( 1 - f_k \( E \) approx 1 \)$,
Eq.~(@eq:Fermi-Golden6) simplifies to:
$ tau = 1 / Gamma_(a arrow.r k) = frac(ℏ, 2 Delta_k) #h(0em) \, $<eq:Fermi-Golden7>
This simplification facilitates our analysis of nuclear dynamics, which
we discuss in more detail in the next section.

== Potential energy curves for non-adiabatic dynamic processes
<ssec:PEC>
Based on the electronic energy levels of the Si-H bonding and
antibonding states, we investigate how electronic excitations involving
these states can trigger hydrogen nucleus movement and lead to bond
dissociation. Chemical bond dissociation processes are extensively
studied in surface chemistry and are typically analyzed within a
non-adiabatic framework due to the significant electron-nuclear
coupling~@Gross2009Chap9@Saalfrank2006@Frischorn2006. Such studies need
potential energy curves to map the energy landscape as a function of
nuclear coordinates, which is crucial for identifying reaction pathways
and activation energies. Generating such potential energy curves is a
key issue which we address here based on the methods described in
Secs.~@ssec:def and @ssec:part.

We start by calculating the ground-state potential energy curve, which
is directly obtained from the total energy provided by DFT calculations.
We adjust the position of the hydrogen atom along the stretching mode of
the Si-H bond while keeping all other silicon atoms fixed, to obtain the
potential energy as a function of the nuclear coordinate. The rationale
for this approach stems from the significant mass difference between
silicon and hydrogen (28 amu and 1 amu for the dominant isotopes,
respectively), resulting in the reduced mass of the stretching
vibrational mode being primarily determined by the mass of hydrogen.

For the excited-state potential energy curve, we investigate several
scenarios. Early work suggested that the fundamental mechanism for Si-H
bond dissociation was electron excitation from the Si-H bonding orbital
to the antibonding orbital~@Avouris1996@Avouris1996_2. In contrast,
direct carrier injection---where an electron or hole is introduced
directly from the STM tip into the surface state---is more commonly
considered in other cases~@Gross2009Chap9@Komeda2005. Here we aim to
explicitly compare the direct electronic excitation process with the
carrier injection process.

For electron excitation, we obtain the excitation energy by calculating
the difference between the antibonding and bonding orbitals and adding
this to the ground-state potential energy surface. For electron
injection into the antibonding orbital we add the target orbital energy,
referenced to the valence-band maximum (VBM) of the Si host, to the
ground-state potential energy surface.

== Dynamics of the nuclear wavepacket
<ssec:QD>
We are now in a position to investigate the movement of the proton by
explicitly solving the time evolution of the nuclear wavefunction along
the non-adiabatic potential energy curve for the excited state. We
employ the Menzel-Gomer-Redhead (MGR) approach~@Menzel1964@Redhead1964,
a theoretical framework designed to model desorption processes triggered
by electronic transitions, such as photo-desorption or electron
injection~@Menzel1995@Guo1999@Saalfrank2006@Wang2021. Within this
framework, we solve the time-dependent Schrödinger equation for the
nuclear wavefunction $Psi \( z \, t \)$:
$ i frac(partial Psi (z \, t), partial t) = hat(H) Psi (z \, t) #h(0em) . $<eq:schr>

Figure~@fig:mgr shows a schematic representation of the wavepacket
propagation described within the MGR approach. Initially, the system is
in its ground state, represented by the nuclear wavefunction,
$Psi \( z \, 0 \)$. According to the MGR model, the desorption process
consists of three key stages. First, a sudden Franck-Condon transition
occurs, shifting the system from the ground-state potential energy curve
to the excited-state potential energy curve (step 1 in Fig.~@fig:mgr).
This transition means that the initial nuclear wavefunction
$Psi \( z \, 0 \)$, originally a solution of the ground-state
Hamiltonian $H_g$, transitions to evolve on the excited-state potential
energy curve, described by $H_e$. Second, the nuclear wavefunction
evolves and propagates along the excited-state potential for a duration
that reflects the lifetime of the excitation (step 2 in Fig.~@fig:mgr).
Third, eventually the excitation decays as the wavefunction transitions
back to the ground-state potential curve, continuing its evolution there
(step 3 in Fig.~@fig:mgr).

#figure(image("source/Figure4.pdf", width: 85.0%),
  caption: [
    Schematic representation of the wavepacket propagation described
    within the MGR approach. The hydrogen nuclear wavefunction starts in
    the ground-state potential and undergoes excitation, transitioning
    to the excited-state potential. It propagates in this excited state
    for a period of time before eventually decaying back to the ground
    state.
  ]
)
<fig:mgr>

In this framework, Si-H bond dissociation occurs when the proton gains
sufficient kinetic energy while moving along the repulsive excited-state
potential energy curve. If the kinetic energy gained by the proton is
sufficient to overcome the energy barrier it encounters on the
ground-state energy curve, the proton can proceed to move further away
from the Si atom, resulting in Si-H bond dissociation. Within this
framework, the dissociation probability $p \( tau_R \)$ is determined by
how long the nuclear wavefunction evolves on the excited-state
potential, a duration we refer to as the residence time $\( tau_R \)$.
To calculate the dissociation probability, we continue propagating the
wavepacket after it returns to the ground state and determine the
fraction of its amplitude that extends beyond the bond region, where the
ground-state Morse potential ultimately becomes flat.

Lastly, to compute a quantum yield that can be compared with
experimental values, it is essential to incorporate an incoherent
average of quantum trajectories~@Boendgen1998@Vondrak1999@Vondrak1999_2:
$ Q (tau) = frac(integral p (tau_R) e^(- tau_R \/ tau) d tau_R, integral e^(- tau_R \/ tau) d tau_R) #h(0em) \, $<eq:tau>
where $p (tau_R)$ is the dissociation probability described in the
previous paragraph, and $tau$ represents the lifetime of the excited
state. The integration over $tau_R$, weighted by $e^(- tau_R \/ tau)$,
accounts for the variability in residence times of each excitation event
through an exponential distribution. This method accounts for the
statistical distribution of residence times and the probabilistic nature
of the dissociation process, thereby providing a comprehensive
evaluation of the quantum yield.

The MGR approach with averaging using an exponential weighting factor
has been shown to be equivalent to the stochastic Monte Carlo (MC)
method~@Saalfrank1996@Finger1997. In MC simulations, one explicitly
calculates each excitation event with an excited electronic Hamiltonian
that includes a decay term. For extremely rare events, such as the
present bond dissociation process, this requires simulating millions of
excitations to observe a single bond dissociation, which is
computationally prohibitive. The MGR approach allows performing
significantly fewer simulations by utilizing a weighting factor,
enabling cost-efficient calculations without the need to simulate every
individual excitation event.

We note that the decay rate that determines the lifetime can in
principle be obtained from Eq.~(@eq:Fermi-Golden5) and depends on the
nuclear coordinates. By calculating the Newns-Anderson Hamiltonian for
varying nuclear coordinates, we could account for the nuclear
configuration dependence of the decay rate. However, incorporating this
dependence is not directly compatible with the averaging method of
Eq.~(@eq:tau), as discussed in Ref.~@Saalfrank1996@Finger1997. For this
reason, we assume a coordinate-independent fixed decay rate, leading to
a constant lifetime. This assumption simplifies our calculations while
still providing reasonable results.

== Computational methods
<ssec:comp>
We perform DFT calculations with norm-conserving pseudopotentials using
the Perdew-Burke-Ernzerhof (PBE)~@Perdew1996 exchange-correlation
functional, as implemented in Quantum Espresso~@Giannozzi2017. A 40~Ry
plane-wave energy cutoff was sufficient to converge the total energy. We
employed a force convergence criterion of $1.0 times 10^(- 3)$ Ry/Bohr.
Using this setup, we obtained a lattice constant of 5.468~Å for bulk
silicon. This value overestimates the experimental lattice parameter
(5.431~Å~@einspruch2012vlsi) by 0.69%, which is typical for PBE. The
calculated band gap for bulk silicon is 0.61 eV. With this relaxed
lattice parameter, we constructed a Si supercell containing Si-H bonds.
To obtain the Si-H bonding and antibonding states, we used the MLWF
approach and the PAO method as implemented in Wannier90~@Pizzi2020.

= Results
<sec:case>
== Geometry
<ssec:geometry>
As noted in the Introduction, Si-H bond dissociation is relevant both in
the context of surfaces (where detailed STM experiments have been
performed) and for bonds embedded in a bulk environment. Our results
will demonstrate that, while minor quantitative differences occur, the
key conclusions are independent of the precise geometry. We will provide
our most detailed discussion of the calculations for the case of Si-H
embedded in bulk, and refer to results for surfaces where relevant.

To address the dissociation of the Si-H bond embedded in bulk Si, we
perform DFT calculations for a supercell that includes an isolated Si-H
bond. We construct a $4 times 4 times 4$ supercell based on the
conventional (8-atom) cell of Si. Simply removing a single Si atom and
passivating the resulting four dangling bonds with H atoms results in
four Si-H bonds that are closely packed, with a distance between
hydrogen atoms of less than 1.4~Å. This setup would fail to accurately
represent the behavior of an isolated Si-H bond due to the strong
interactions between neighboring hydrogen atoms. To simulate an isolated
Si-H bond, we instead remove four Si atoms and introduce ten H atoms for
passivation~@VandeWalle1994. This strategy allows us to achieve an
isolated Si-H bond in which the H atom is positioned more than 3~Å away
from the other H atoms (Fig.~S1 in the Supplemental
Material~@supplementary). We then perform a structural relaxation
calculation, allowing the H atoms and their first and second nearest Si
atoms to relax.

To address Si-H bonds on silicon surfaces, we investigate two different
hydrogen-passivated surfaces, Si(001)-(2$times$1):H and
Si(111)-(1$times$1):H. For H-passivated Si(001) surfaces, we construct a
14-layer Si(001)-(2$times$1) structure and passivate the surface Si
dangling bonds with hydrogen. We include a vacuum thickness of 20~Å to
prevent interactions between periodic images. We relax the H atoms and
their first and second nearest neighboring Si atoms to obtain the
relaxed Si(001)-(2$times$1):H structure. We then construct a 2$times$4
multiple of the 2$times$1 slab structure, resulting in a 4$times$4
supercell (Fig.~S2 in the Supplemental Material~@supplementary),
and adjust the position of one specific H atom on the surface to obtain
energy levels and potential energy curves. This ensures sufficient
in-plane separation between periodic images of the hydrogen atoms. For
H-passivated Si(111) surfaces, we follow a similar approach by
constructing a 12-layer Si(111)-(1$times$1) orthorhombic structure and
passivating the surface Si dangling bonds with hydrogen. A 20~Å vacuum
thickness is again included, and all H atoms and their first and second
nearest neighboring Si atoms are relaxed. We then utilize a 3$times$2
supercell of the slab structure (Fig.~S3 in the Supplemental
Material~@supplementary) and focus on one specific H atom on the
surface.

== Bonding and antibonding states
<ssec:bonding>
=== Si-H bond in bulk
<sssec:Si-H_bulk>
Based on DFT calculations for the relaxed supercell structures
(Fig.~S1), we obtain Bloch wavefunctions. We then use the
partitioning method of Sec.~@ssec:part to isolate the bonding and
antibonding states of the Si-H bonds. For the bonding orbital, we apply
the MLWF method to the entire valence band manifold, converting it into
a uniquely defined set of Wannier functions. We can then identify the
one Wannier function that is localized along the Si-H bond,
corresponding to the Si-H bonding orbital (Fig.~@fig:wf). The center of
the bonding orbital and its charge distribution lean slightly towards
the hydrogen atom at the equilibrium bond length
$\( d_(upright(S i - H)) = 1.5 upright(angstrom) \)$, reflecting the
somewhat higher electronegativity of hydrogen
$\( chi_(upright(H)) = 2.20 \)$ compared to silicon
$\( chi_(upright(S i)) = 1.90 \)$~@CRC. The other Wannier functions,
which correspond to the Si-Si bonding orbitals, are precisely centered
on the Si-Si bonds.

#figure(image("source/Figure5.pdf"),
  caption: [
    Wavefunctions of the bonding state (left) and antibonding state
    (right) of Si-H bonds obtained from the partitioning process.
  ]
)
<fig:wf>

For the antibonding orbital, we combined the MLWF approach with the PAO
method as described in Sec.~@ssec:part. The antibonding orbital
(Fig.~@fig:wf) is characterized by a node between the Si and H atoms,
distinguishing it from the bonding orbital and highlighting its
antibonding nature. The overall distribution of the wavefunction shifts
toward the Si atom, in contrast to the Si-H bonding state, again
consistent with the lower electronegativity of the Si atom.

Now that we have identified the Si-H bonding and antibonding states we
can examine the changes in their energy levels as the hydrogen atom
moves along the direction of the stretching mode (Fig.~@fig:energy). At
the equilibrium Si-H bond length, the energy of the bonding state is 5.5
eV below the VBM of the Si host, while the antibonding state is 7.0 eV
above the VBM. Changing the Si-H bond length causes a significant energy
level shift for both states. An increase in the bond length by 1 Å leads
to an upward shift of over 3 eV for the energy level of the bonding
state and a downward shift of 4 eV for the antibonding state. Decreasing
the Si-H bond length, on the other hand, results in different trends for
the bonding and antibonding levels. The bonding energy level
consistently decreases as the bond length shortens, while the
antibonding energy level initially increases and then slightly
decreases. These differing behaviors stem from their spatial charge
distributions (see Fig.~@fig:wf). For the bonding orbital, the charge is
localized mainly around hydrogen, so changing the hydrogen position
primarily affects the bonding orbital without influencing other Si-Si
orbitals. For the antibonding orbital, however, the charge is more
concentrated around the silicon atom. Consequently, when the bond length
becomes shorter, nearby Si-Si antibonding orbitals are also affected,
leading to changes in their energy levels as well.

In addition to examining motion along the stretching mode, we also
investigated changes in the bonding/antibonding levels as the hydrogen
atom moves along the Si-H bending mode (see Supplemental
Material~@supplementary, Fig.~S4). In this scenario, the
energy levels of both the bonding and antibonding states remain almost
unaffected, indicating their sensitivity is primarily to bond length.
This observation supports our approach in the following analysis, where
we will focus on the stretching mode and develop the potential energy
curve along this path to describe the bond dissociation process.

We note that the energy levels of the other Wannier functions obtained
through the partitioning approach remain unaffected by changes in the
Si-H bond length (Fig.~@fig:energy). These results emphasize the highly
localized nature of the derived Si-H bonding and antibonding states,
while the remaining states accurately represent the continuum bulk Si
states.

#figure(image("source/Figure6.pdf", width: 90.0%),
  caption: [
    Energy levels of the bonding (blue) and antibonding (red) states of
    Si-H bonds, obtained through the partitioning method using the MLWF
    approach combined with the PAO method, as a function of Si-H bond
    length. Other states associated with Si-Si bonds and additional Si-H
    bonds are also displayed (gray). The vertical dashed line represents
    the equilibrium length of the Si-H bond, while the horizontal solid
    line marks the VBM of silicon, set as the reference energy level at
    0 eV.
  ]
)
<fig:energy>

=== Si-H bond on the surface
<sssec:Si-H_surface>
The results presented above are for an isolated Si-H bond in bulk Si;
they turn out to be very similar to results for a Si-H bond on the
surface. For the slab geometries described in Sec.~@ssec:geometry we
modified the position of a specific H atom at the surface to obtain
energy levels and potential energy curves. Explicit calculations of the
Si-H bond states on silicon surfaces (Fig.~S5 in the
Supplemental Material~@supplementary) showed that they are nearly
identical to those for the Si-H bond in bulk silicon. The states derived
from our partitioning method thus exhibit consistent characteristics
across different systems. This observation confirms that it is
sufficient to conduct further analysis using the energy levels obtained
for the Si-H bond in bulk Si.

#figure(image("source/Figure7_DW.pdf"),
  caption: [
    (a) Energies of the DFT eigenstates of the $upright(S i_4 H_10)$
    cluster (open symbols). Blue and red dots denote the energy of
    occupied and unoccupied states, respectively. Filled symbols
    correspond to the bonding (blue, $E_(upright(B))$) and antibonding
    orbitals (red, $E_(upright(A B))$) obtained through the partitioning
    process. (b) Wavefunctions of specific DFT eigenstates (1-4), along
    with wavefunctions of the bonding and antibonding orbitals obtained
    with the partitioning process, all at a Si-H bond length of 1.5~Å.
    Isosurfaces are plotted at 16% of the maximum value.
  ]
)
<fig:molecule>

=== Si-H bond in a small cluster
<sssec:Si-H_molecule>
We also performed DFT calculations on the $upright(S i_4 H_10)$ cluster
as examined in Ref.~@Avouris1996_2@Miyamoto2000@Liu2021. In agreement
with this earlier research, we find that changing the length of a single
Si-H bond in the cluster results in notable change in the energy of some
of the DFT eigenstates \[states 1--4 in Fig.~@fig:molecule\(a)\]. The
previous studies suggested that this allows identifying the bonding and
antibonding states. However, as shown in Fig.~@fig:molecule\(b), the
wavefunctions of these states (which are consistent with those reported
in Ref.~@Liu2021 and were identified there as bonding and antibonding
states) extend across the entire cluster, rather than being confined to
a single Si-H bond. This delocalization is in sharp contrast to the
localized bonding and antibonding states we identified using our
partionining procedure (Fig.~@fig:wf), and indicates these DFT
eigenstates should #emph[not] be used to model excitation processes. The
delocalization observed in the $upright(S i_4 H_10)$ cluster is
exemplary of the issues faced when attempting to use DFT eigenstates
obtained in larger clusters or slab
structures~@Miyamoto2000@Wang2006@Rohlfing2008@Liu2021, where electronic
eigenstates are similarly delocalized throughout the supercell. We
emphasize that the observed delocalization is #emph[n]ot a manifestation
of some inherent DFT error, but correctly reflects the nature of the
states within the adiabatic DFT framework.

The delocalization problem can be overcome by applying our partitioning
framework described in Sec.~@ssec:part, as shown in Fig.~@fig:molecule.
We observe that both the energy gap between bonding and antibonding
orbitals ($tilde.op$12 eV) and the shape of the corresponding
wavefunctions are very similar to those found for the Si-H bond in bulk
Si (Fig.~@fig:energy) and on the Si surface (Fig.~S5). We can
understand this similarity across different systems based on two
reasons. First, the bonding and antibonding orbitals derived from the
partitioning method possess physical significance as molecular orbitals
(unlike the DFT eigenstates), ensuring consistency across different
systems. Second, the highly localized nature of these orbitals renders
them insensitive to the details of the bonding environment, ensuring
that their characteristics remain similar across various systems.

We thus conclude that previous
attempts~@Avouris1996@Avouris1996_2@Miyamoto2000@Wang2006@Rohlfing2008@Liu2021
to interpret and analyze the bond-dissociation process solely within the
framework of DFT eigenstates, while insightful, are limited in their
ability to describe the non-adiabatic coupling mechanisms underlying the
observed phenomena. The states previously identified as localized
orbitals do not capture non-adiabatic effects, and their behavior as a
function of bond length is likely to merely result from the inherent
localization effects of the small cluster itself. We argue that a
correct understanding of non-adiabatic dynamic processes, such as bond
dissociation, requires proper identification of the involved states
(through our partitioning process), rather than simply relying on the
electronic eigenstates of the system.

== Potential energy curves
<ssec:nature>
Based on the electronic energy levels of the bonding and antibonding
states, we can construct the potential energy curves for the ground and
excited states, as illustrated in Fig.~@fig:pes. We examine three
different excitation scenarios: (i) an electron is excited from the
bonding orbital to the antibonding orbital; (ii) an electron is injected
into the antibonding orbital of Si-H bonds; and (iii) a hole is injected
into the bonding orbital of Si-H bonds. Scenario (i) was initially
proposed for the single-electron bond dissociation
mechanism~@Avouris1996@Avouris1996_2, whereas scenarios (ii) and (iii)
were considered as potential mechanisms for multi-electron dissociation
processes and discussed within the framework of inelastic resonant
scattering~@Avouris1996@Avouris1996_2@Stokbro1998@Stokbro1998_2@Jech2021.

#figure(image("source/Figure8.pdf"),
  caption: [
    Potential energy curves for the ground state and for the excited
    state in three scenarios. Black symbols represent the ground-state
    DFT potential energies, fitted with a Morse potential
    \[Eq.~(@eq:ground)\]. Case i (green symbols): an electron is excited
    from the Si-H bonding state to the antibonding state. The
    corresponding excited-state energy is obtained from the
    Newns--Anderson Hamiltonian, as discussed in Sec.~@ssec:PEC. Case ii
    (red symbols): an electron is injected into the antibonding state.
    Case iii (blue symbols): a hole is injected into the bonding state.
    The excited-state potential curves are fitted with exponentially
    decaying functions \[Eq.~(@eq:excited)\], highlighting the repulsive
    nature of these excitations.
  ]
)
<fig:pes>

First, we note that the ground-state potential energy curve of the Si-H
bond is anharmonic and well described by the Morse potential~@Morse1929:
$ V_g (z) = D (1 - e^(- a (z - z_0)))^2 #h(0em) . $<eq:ground> The fit
to the Morse potential is shown in Fig.~@fig:pes, with parameters:
$D = 3.351$~eV, $a = 1.548$~Å$""^(- 1)$, and $z_0 = 1.508$~Å.

In contrast, the excited state potential energy curves exhibit an
exponentially decaying trend, indicating their repulsive nature. This
repulsion can cause the proton to move away, potentially leading to Si-H
bond dissociation. Such bond dissociation processes driven by repulsive
potentials are frequently discussed in contexts such as
electron-stimulated desorption, desorption induced by electronic
transitions, and dissociative electron
attachment~@Avouris1989@Ramsier1991@Thorman2015.

The excited-state potential energy curve for case (i) lies at
significantly higher energy compared to the other two cases. Starting
from the Si-H bond at its equilibrium bond length (1.5 Å), the energy
needed to excite an electron from the Si-H bonding state to the Si-H
antibonding state exceeds 12 eV. This observation conflicts with the
assumptions made in earlier studies, which attributed the 7 eV threshold
observed in STM experiments to the energy required to excite an electron
from the Si-H bonding state to the antibonding
state~@Avouris1996@Avouris1996_2.

Our calculations indicate that the potential energy for an electron
injected into the Si-H antibonding state is close to 7 eV (again
starting from the Si-H bond at its equilibrium length) \[Fig.~@fig:pes,
case (ii)\]. Considering that STM studies report a 6--7 V threshold
voltage on $n$-type
Si@Shen1995@Avouris1996@Avouris1996_2@Shen1997 ? implying a threshold
energy of approximately 7--8 eV relative to the valence band
maximum-----our result is in good agreement, albeit with a slight
underestimation. This difference is likely due to the underestimation of
energy levels by the PBE functional employed in our calculations. Our
findings thus indicate that electron injection into the Si--H
antibonding state is responsible for the bond dissociation observed in
these experiments.

For the excited state corresponding to an electron injected into the
antibonding state, we fit the potential energy curve with an
exponentially decaying curve (Fig.~@fig:pes):
$ V_e (z) = D' e^(- a' (z - z'_0)) + E_0 #h(0em) \, $<eq:excited> with
fitting parameters: $D' = 1.301$ eV, $a' = 2.115$ Å$""^(- 1)$,
$z'_0 = 1.803$ Å, and $E_0 = 4.490$ eV.

Hole injection into the bonding orbital also exhibits a repulsive
potential energy curve. The mechanism of hole-injection-induced
dissociation is relatively unexplored; to our knowledge, Ref.~ is the
only paper reporting dissociation via a hole resonance, showing a
maximum desorption rate at a bias voltage of $-$7 V. Since the bias
voltage is referenced to the Fermi level, and Ref.~ used $n$-type
samples in which the Fermi level is close to the conduction-band minimum
(at an energy $E_g$=1.12 eV above the VBM), this observation closely
matches our prediction of the bonding orbital at 5.5 eV below the VBM
(case iii in Fig.~@fig:pes). Due to the limited experimental evidence
available for hole injection, the following analysis will focus on
electron injection.

== Dynamics of dissociation
<ssec:nonad>
Our analysis of the potential energy curve suggests that electrons
temporarily occupying Si-H antibonding states generate a repulsive
potential, exerting force on the proton. If the electron remains in the
antibonding state long enough, the proton may experience significant
displacement, potentially leading to the dissociation of the Si-H bond.
This underscores the need to explicitly consider both electronic
processes and nuclear motion.

In this section, we explore the quantum dynamics of the nuclear
wavepacket within the framework discussed in Sec.~@ssec:QD. Using the
MGR model and the potential energy curves obtained in Sec.~@ssec:nature,
we explicitly solve the time-dependent Schrödinger equation for the
hydrogen nucleus under electronic excitation, where an electron is
injected into the Si-H antibonding state. This approach enables us to
observe the evolution of the nuclear wavepacket across varying residence
times on the excited-state potential energy curve.

=== Dissociation probability
<sssec:dis_prob>
To quantify the dissociation probability, we define a cutoff distance
$Z_c = 12$ au = 6.350 Å; a fraction of the wavefunction beyond $Z_c$ at
the final time step ($t =$ 300 fs) is considered dissociated.
Justification for these values is provided in Figs.~S6 and
S7 in the Supplemental Material~@supplementary. To prevent
numerical issues at the boundary, we used a broad spatial grid that
extends from 0.5 au to 200 au. We checked that a time step of 1
attosecond and a spatial grid increment of 0.025 au are sufficient for
obtaining converged results. For the residence time $tau_R$, we
considered a range from 0.01 fs to 20 fs with increments of 0.01 fs,
resulting in a total of 2000 data points. We select the lowest
vibrational eigenstate of the ground-state potential energy curve as the
initial condition for the time-dependent wavefunction calculation, akin
to assuming low temperature. Figure @fig:prob displays the resulting
dissociation probabilities for hydrogen and deuterium as a function of
their residence times.

#figure(image("source/Figure9.pdf"),
  caption: [
    Dissociation probability of hydrogen and deuterium as a function of
    the residence time. Vertical dashed lines denotes the classical
    limit.
  ]
)
<fig:prob>

Figure~@fig:prob shows that the dissociation probabilities for hydrogen
and deuterium exhibit a sharp rise around 6 fs and 8 fs, respectively.
The distinction between hydrogen and deuterium originates from the
difference in how fast their wavefunctions move along the excited-state
potential energy curve. Although they share identical electronic
properties, the disparity in their masses leads to different dynamics.
The heavier deuterium exhibits a slower response, leading to a lower
dissociation probability for the same residence time.

From a classical mechanics perspective, it is anticipated that there is
a specific threshold time: if the propagation time along the
excited-state potential energy curve exceeds this threshold, the
hydrogen atom will dissociate. Within the classical mechanics framework,
the desorption probability would thus be a step function, as depicted by
the dotted lines in Fig.~@fig:prob. In contrast, our explicit
calculation of the nuclear wavefunction incorporates the
quantum-mechanical aspects of the dissociation process, resulting in a
more gradual curve for the desorption probability, shown by the solid
lines in Fig.~@fig:prob.

#figure(image("source/Figure10.pdf", width: 82.0%),
  caption: [
    Time evolution of the nuclear wavepacket for three different
    residence times: (a) $tau_R = 2$ fs, (b) $tau_R = 6$ fs, and
    $tau_R = 10$ fs, plotted as a function of the coordinate along the
    Si-H stretching mode.
  ]
)
<fig:wavepacket>

The probabilistic nature of the dissociation process becomes clear when
examining the time evolution of the nuclear wavepacket.
Figure~@fig:wavepacket depicts this time evolution for three different
residence times. (a) For short residence times ($tau_R = 2$ fs), most of
the nuclear wavepacket remains near its initial position, indicating
that the bond dissociation probability is small. (b) At intermediate
residence times ($tau_R = 6$ fs), the nuclear wavepacket splits into two
parts: one part stays near the initial position, while the other moves
forward, suggesting a significant dissociation probability. (c) For long
residence times ($tau_R = 10$ fs), the majority of the nuclear
wavepacket propagates forward, indicating an almost certain
dissociation.

=== Quantum yield
<sssec:quant_yield>
Following our analysis of dissociation probability, we now examine the
quantum yield. In experiments, the quantum yield is defined as the ratio
of the number of dissociated bonds to the total number of injected
electrons. Observing bond dissociation typically involves millions of
excitation events, each characterized by its own residence time.
Therefore, it is crucial to implement an averaging process that accounts
for the statistical distribution of residence times across all these
excitation events. This approach, known as incoherent averaging of
quantum trajectories \[Eq.~(@eq:tau)\], allows us to calculate the
quantum yield in a manner that aligns with experimental observations.

Figure~@fig:yield shows the quantum yield of hydrogen
$\( Q_(upright(H)) \)$ and deuterium $\( Q_(upright(D)) \)$ and the
isotope ratio $I = Q_(upright(H)) \/ Q_(upright(D))$ as a function of
lifetime $\( tau \)$. We observe that the quantum yield of both H and D
increases exponentially as a function of lifetime. Importantly, the
isotope ratio sharply rises when the lifetime is reduced, which can be
attributed to the different propagation speeds of hydrogen and deuterium
wavefunctions. Within a short lifetime (in the femtosecond range), the
nuclear wavefunction propagates only a short distance. Consequently,
only a small portion of the wavefunction, particularly the tail part
that has gained enough kinetic energy for dissociation, can overcome the
dissociation barrier and contribute to the quantum yield. Under these
conditions, H and D exhibit a significant disparity in quantum yields
because the differences in their propagation speeds result in markedly
different fractions of the tail part gaining enough kinetic energy for
dissociation. The isotope ratio declines as the lifetime increases and
eventually converges to one. This is because, at long lifetimes, a
relatively larger fraction of the wavefunctions of both H and D will
gain enough energy for dissociation.

#figure(image("source/Figure11_DW_v2.pdf"),
  caption: [
    Quantum yield (left y-axis) of hydrogen (blue) and deuterium (red)
    as a function of the lifetime $tau$. Black dashed line corresponds
    to the isotope ratio (right y-axis). The green shaded region marks
    the experimentally reported range of isotope ratios, and the green
    vertical dotted lines mark the corresponding range of quantum
    yields.
  ]
)
<fig:yield>

We compared our computational results with experimental data and found
that the isotope ratios extracted from STM experiments, ranging from 50
to 200~@Avouris1996_2@Shen1997@Foley1998@Lyding1998, correspond to
electron lifetimes of approximately 0.40 to 0.55 fs. Within this range
of lifetimes, our calculations predict a hydrogen quantum yield between
$4 times 10^(- 6)$ and $7 times 10^(- 5)$. These quantum yield values
are slightly higher than desorption yields measured in STM experiments
above the threshold, which are on the order of $10^(- 6)$ electrons per
incident
electron~@Shen1995@Avouris1996@Avouris1996_2@Shen1997@Lyding1998@Foley1998.
This difference can be explained by considering that, in STM
experiments, not all electrons from the STM tip are injected into the
Si-H antibonding states. A more detailed analysis of the desorption
yield spectrum obtained from STM experiments is presented in
Sec.~@ssec:bias.

=== Temperature dependence
<sssec:temperature>
So far, we have examined the desorption probability and yield at zero
temperature, with the lowest vibrational eigenfunction as the initial
state. At finite temperatures, higher vibrational states can be
occupied, and their impact on the dissociation dynamics must be taken
into account. We therefore conduct the time-dependent wavefunction
calculations for higher vibrational states; see Fig.~S8 in the
Supplemental Material~@supplementary. These states also exhibit a sharp
rise in the dissociation probability curves (Fig.~S9), similar
to the lowest vibrational state analyzed above, but they show
intermediate steps due to the presence of nodes in their wavefunctions
(Fig.~S8).

We then calculate the quantum yield as a function of temperature by
taking the thermal average of these states, and assuming a lifetime
$tau$ of 0.5 fs. The results in Fig.~@fig:T-dep show that up to room
temperature, the quantum yield remains nearly the same as when
considering only the lowest vibrational state. In this temperature
range, higher vibrational states are barely occupied due to their
relatively high energy levels (with the second and third eigenstates
lying 0.248 eV and 0.486 eV above the first vibrational state,
respectively, as shown in Fig.~S8 in the Supplemental
Material~@supplementary). As a result, their contribution to the quantum
yield is negligible up to room temperature range. Only at much higher
temperatures does occupation of higher states noticeably affect the
quantum yield, but at these temperatures thermal dissociation may become
more important.

#figure(image("source/Figure12.pdf"),
  caption: [
    Temperature dependence of the quantum yield, with each curve
    obtained by considering only the first 1, 2, or 3 vibrational
    eigenstates, assuming a lifetime of 0.5 fs.
  ]
)
<fig:T-dep>

== Bias dependence
<ssec:bias>
So far, our focus has been on one aspect of the degradation process:
what happens once an electron is injected into the Si-H antibonding
state, leading to potential dissociation. To make a connection with
experimental observations, it is essential to also examine the process
of electron injection into the Si-H antibonding states, addressing the
energy range over which this occurs (and hence the dependence on applied
bias) and the associated rate.

A calculation of the injection rate allows us to address key
experimental quantities, including desorption yields measured in STM
studies~@Shen1995@Avouris1996@Avouris1996_2@Shen1997@Foley1998@Lyding1998
and trap creation probabilities estimated in oxide stress
experiments~@DiMaria1999@DiMaria1999_2@DiMaria2000. In both cases, the
measured quantity is determined by the ratio between the dissociation
rate and the total carrier injection rate:
$ upright(M e a s u r e d med q u a n t i t y) = frac(Gamma_(upright(t o t a l)) times Q, Phi_(upright(t o t a l))) #h(0em) . $<eq:general_model>
Here $Gamma_(upright(t o t a l))$ is the rate of electron injection into
the localized resonant state, $Q$ is the quantum yield, which quantifies
the probability of bond dissociation per injected electron
\[Eq.~(@eq:tau)\], and $Phi_(upright(t o t a l))$ is the total carrier
injection rate.

To quantify the injection rate $Gamma_(upright(t o t a l))$, we employ
Fermi's golden rule \[Eq.~(@eq:Fermi-Golden5)\]. As discussed in
Sec.~@ssec:transitions, the Si--H antibonding state is modulated by the
vibrational wavefunction; electron injection into the Si-H antibonding
state therefore does not occur at a single, discrete energy. Rather,
Si-H antibonding states span a range of energies shaped by the
ground-state nuclear wavefunction \[see Fig.~@fig:bias_dep\]; therefore
electron injection can take place at energies below the energy of the
antibonding state, albeit with a small probability . We can address this
quantitatively using our calculations of the Si--H antibonding energy
levels (Sec.~@ssec:bonding) and potential energy curves
(Sec.~@ssec:nature).

#figure(image("source/Figure13.pdf", width: 80.0%),
  caption: [
    Potential energy curves for the ground (blue) and excited (red)
    states, taken from Fig.~@fig:pes. The ground-state hydrogen nuclear
    wavefunction is illustrated as a gray filled area. Adjacent to this,
    the probability distribution for the excited-state energy,
    $P_(upright(A B)) \( E \)$, is displayed as a green area.
  ]
)
<fig:bias_dep>

=== STM experiments
<ssec:STMresults>
As mentioned in the introduction, STM experiments have shown measurable
desorption yields even for bias voltages below 7 V, which we will refer
to as the subthreshold regime. We aim to explain the desorption yield
spectrum at both subthreshold and above-threshold energies.

First, the STM junction is modeled by a resonant‐level Hamiltonian
\[Eq.~(@eq:nah)\], where the index $k in { t \, s }$ represents either
tip states $\( t \)$ or Si substrate states $\( s \)$. Electrons are
assumed to be injected from the occupied tip states into the antibonding
state, as described in other STM analyses~@Alavi2000@Seideman2003. The
STM measurements are conducted in constant-current mode, i.e.,
$Phi_(upright(t o t a l))$ is kept fixed. We can then write
Eq.~(@eq:general_model) for the desorption yield $P_d$ as a function of
bias $V_B$ as follows:
$ P_d prop integral f_t \( E \) Delta_t \( E \) P_(upright(A B)) \( E \) d E times Q #h(0em) \, $<eq:previous_model>
where $Delta_t \( E \)$ represents the electronic coupling between the
tip states and the antibonding state \[as defined in
Eq.~(@eq:Fermi-Golden4)\], and $P_(upright(A B))$ represents the
distribution of the antibonding state energy. $Q$ denotes the quantum
yield discussed in Sec.~@ssec:QD and calculated in
Sec.~@sssec:quant_yield. For the occupation function $f_t \( E \)$, we
consider all tip states occupied up to the energy $E_F + e V_B$, with
$E_F$ corresponding to the Fermi level of the $n$-type Si substrate and
$V_B$ representing the applied bias. Under the assumption that
$Delta_t \( E \)$ does not significantly depend on energy, the yield
equation becomes:
$ P_d \( V_B \) prop integral_(E_F)^(E_F + e V_B) P_(upright(A B)) \( E \) d E times Q #h(0em) . $<eq:new_model>
Based on Eq.~(@eq:new_model), we aim to model the experimentally
measured desorption yield from STM experiments~@Avouris1996_2 \[symbols
in Fig.~@fig:fitting\]. Since neither the experiments~@Avouris1996_2 nor
our model provide an absolute value for the desorption yield, we
adjusted the magnitude of our calculated desorption yield to match the
experimental yield in the above-threshold regime. In addition, a +0.9 eV
shift was applied to align the threshold behavior, a correction that
accounts for the underestimation of energy levels by the PBE functional.
Our model successfully captures two key features: the saturation of the
desorption yield at bias voltages above the threshold of approximately 7
V, and the exponential decrease in desorption yield observed as the bias
voltage drops below 7 V.

#figure(image("source/Figure14.pdf", width: 95.0%),
  caption: [
    Desorption yield derived from Eq.~(@eq:new_model), where the blue
    and red solid lines correspond to H and D, respectively.
    Experimental data (from Ref.~@Avouris1996_2) for H and D are
    depicted by blue and red circle symbols.
  ]
)
<fig:fitting>

=== Oxide stress experiments
<ssec:oxide>
Our quantum yield calculations also allow us to address the degradation
process observed in silicon devices.
DiMaria~@DiMaria1999@DiMaria1999_2@DiMaria2000 conducted controlled
oxide stress experiments by injecting carriers uniformly across
metal-oxide-semiconductor structures, applying a bias voltage between 2
and 8 V. The trap generation probability, $P_g$, was determined using
the following expression~@DiMaria1999:
$ P_g = frac(q Delta N_s, Delta Q_(upright(i n j))) #h(0em) \, $<eq:oxide_Pg>
where $Delta N_s$ is the total number of generated traps and
$Delta Q_(upright(i n j))$ is the total injected charge.
DiMaria~@DiMaria1999 attributed the trap generation to hydrogen release
from the poly-Si/oxide interface, where poly-Si is the gate. The
resulting $P_g$ spectra exhibited a threshold near 6~V relative to the
Fermi level of poly-Si. A decrease in dissociation probability was
observed with decreasing bias voltage; values were measured down to 2~V.
The sensitivity at low voltage was much higher than what could be
achieved in the STM experiments discussed in Sec.~@ssec:STMresults.

We will again model Si-H bond dissociation based on electron injection
into Si--H antibonding states. For the quantitative analysis, we adopt
two key assumptions as in Refs.~: (1) All measurements were conducted
under Fowler--Nordheim injection conditions. Hence, we assume that
electron injection takes place at the energy level corresponding to the
bias voltage relative to the Fermi level of the $n^(+)$poly-Si. (2)
Because the oxide layers have a thickness of less than 5~nm, electron
transport is ballistic. Therefore, we assume the injected electron
distribution remains unchanged upon reaching the SiO$""_2$/$n^(+)$
poly-Si interface. Hence, we assume that monoenergetic electron
injection takes place at the energy level corresponding to the bias
voltage relative to the Fermi level of the $n^(+)$poly-Si.

Under these assumptions, we show that the trap generation probability
\[Eq.~(@eq:oxide_Pg)\] is determined by the ratio between the
monoenergetic electron flow rate across the bulk oxide--poly-Si region,
and the rate at which these electrons are captured by the antibonding
states. First, the total injected charge, $Delta Q_(upright(i n j))$, in
Eq.~(@eq:oxide_Pg) is given by
$ Delta Q_(upright(i n j)) = q times Phi_(upright(t o t a l)) times Delta t #h(0em) \, $<eq:oxide_Qinj>
where $Phi_(upright(t o t a l))$ represents the total number of
electrons flowing per unit time across the entire poly-Si surface area
$A$ containing Si--H bonds, and $Delta t$ denotes the injection
duration. Next, the total number of generated traps, $Delta N_s$, is
calculated as
$ Delta N_s = N_(upright(S i - H)) times A times Gamma_(k arrow.r upright(A B)) times Q times Delta t #h(0em) \, $<eq:oxide_Ns>
where $N_(upright(S i - H))$ denotes the areal density of Si--H bonds
near the poly-Si/SiO$""_2$ interface, $Gamma_(k arrow.r upright(A B))$
represents the rate at which electrons are injected into each Si--H
antibonding state, and $Q$ represents the quantum yield (determined as
discussed in Secs.~@ssec:QD and @sssec:quant_yield). Using
Eqs.~(@eq:oxide_Qinj) and~(@eq:oxide_Ns), the trap generation
probability simplifies to
$ P_g = N_(upright(S i - H)) times Gamma_(k arrow.r upright(A B)) / phi.alt_(upright(t o t a l)) times Q #h(0em) . $<eq:oxide_Pg2>
Here, the total electron flux
$phi.alt_(upright(t o t a l)) = Phi_(upright(t o t a l)) \/ A$ is given
by
$ phi.alt_(upright(t o t a l)) = integral f_k \( E \) g_k \( E \) v \( E \) d E #h(0em) \, $<eq:oxide_flux>
where $f_k \( E \)$ denotes the electron distribution function,
$g_k \( E \)$ the density of states, and $v \( E \)$ the velocity, all
specific to the poly-Si surface. The electron capture rate
$Gamma_(k arrow.r upright(A B))$ follows from Fermi's Golden Rule
\[Eq.~(@eq:Fermi-Golden5)\]:
$ Gamma_(k arrow.r upright(A B)) = 2 / ℏ integral f_k \( E \) Delta_k \( E \) P_(upright(A B)) \( E \) d E #h(0em) . $<eq:oxide_Fermi>
We note that in device modeling, the same process is commonly expressed
through an energy-dependent capture cross section
$sigma_(upright(A B))$~@Tyaginov2012@Starkov2011@Reggiani2013@Bina2014:
$ Gamma_(k arrow.r upright(A B)) = integral f_k \( E \) g_k \( E \) v \( E \) sigma_(upright(A B)) \( E \) d E #h(0em) \, $<eq:old_model>
For a monoenergetic electron beam, the ratio
$Gamma_(k arrow.r upright(A B)) \/ phi.alt_(upright(t o t a l))$ reduces
to an areal quantity that corresponds to the capture cross section
$sigma_(upright(A B)) \( E \)$ at the injection energy
$E = E_F + e V_B$. Utilizing Eq.~(@eq:Fermi-Golden7) with constant
$Delta_k$, this cross section is given by:
$ sigma_(upright(A B)) \( E \) equiv frac(P_(upright(A B)) \( E \), g_k \( E \) v \( E \) tau) #h(0em) . $<eq:oxide_cross>
Thus, the trap generation probability simplifies to
$ P_g \( V_B \) = N_(upright(S i - H)) times sigma_(upright(A B)) \( E_F + e V_B \) times Q #h(0em) . $<eq:oxide_Pg3>
For $N_(upright(S i - H))$, we assume a typical value of
$10^12 \/ upright(c m^2)$ for the Si/SiO$""_2$
interface~@Stesmans1998@Keunen2011@Maeda1998. For the quantum yield, we
again use $tau = 0.5$ fs and find $Q = 3.24 times 10^(- 5)$
(Sec.~@sssec:quant_yield). To evaluate $sigma_(upright(A B)) \( E \)$,
we assume a carrier velocity of $v = 10^7$ cm/s~@Shiue1999. For density
of states $g_k \( E \)$, we used the following expression :
$ g_k \( E \) = frac(1, 2 pi^2) (frac(2 m_e^(*), ℏ^2))^(3 \/ 2) sqrt(E - E_c) \, $<eq:DOS>
with the conduction-band density-of-states effective mass of silicon
taken as $m_e^(*) = 1.08 thin m_0$~@Neamen2011@Nguyen2000. Additionally,
a +0.9 eV shift was applied, consistent with the procedure used in the
STM analysis (Sec.~@ssec:STMresults.).

Figure~@fig:trap shows the trap creation probability $P_g$ calculated
from Eq.~(@eq:oxide_Pg3). We emphasize that no fitting was used; given
the uncertainties in some of our assumptions and approximations, the
agreement with the experimental results from Ref.~@DiMaria1999 is very
gratifying. Our results show a decrease in probability from
approximately $10^(- 5)$ at 7~V bias to below $10^(- 21)$ at a 2~V bias
voltage, consistent with the experimental observations. The observed
deviations are no doubt due to the crudeness of some of our
approximations, which could be improved upon by performing a more
comprehensive device-level simulation. Some additional discussion is
included in Sec.~@sssec:disc_oxide. A major conclusion, however, is that
we are able to account for the finite probability of trap generation
even at biases as low as 2~V on the basis of a #emph[single electron]
model, i.e., injection of an electron into a Si-H antibonding
state---something that no previous model had been able to address.

#figure(image("source/Figure15.pdf"),
  caption: [
    Trap generation probability calculated using Eq.~(@eq:oxide_Pg3)
    depicted by solid blue lines, with experimental data from
    Ref.~@DiMaria1999 represented by circle symbols.
  ]
)
<fig:trap>

= Discussion
<sec:disc>
== Interpretation of experimental data
<ssec:disc_exp>
=== STM experiments
<sssec:disc_STM>
In Sec.~@ssec:STMresults, we demonstrated that our approach successfully
reproduces the strongly bias-dependent desorption yield observed in STM
experiments. Here, we discuss key experimental observations and how they
can be interpreted within the framework of our approach.

First, our method captures the small but finite desorption yield in the
sub-threshold regime---a phenomenon that has remained poorly understood.
Previous studies~@Alavi2000@Seideman2003 attempted to explain this
behavior purely through fitting, without explicitly identifying the
target orbital states or providing potential energy curves based on
first-principles calculations. We attribute the finite probability for
dissociation to the modulation of the Si-H antibonding state by the
ground-state nuclear wavefunction, which enables electron injection (and
subsequent dissociation) at bias levels below the energy of the
anitbonding state. This argumentation aligns with analyses found in
dissociative electron attachment studies~@Thorman2015@Fabrikant2017,
which state that the cross section for excitation or electron attachment
depends on the vibrational wavefunction of the ground state.

Second, our calculated spectra show saturation of the desorption yield
above the threshold. In STM measurements, all the occupied states of the
STM tip can contribute to electron injection. Therefore, even if the
Fermi level of the STM tip surpasses the energy of the antibonding state
of Si-H bonds, there are still occupied states below the Fermi level
that allow direct electron injection into the antibonding state. We note
that similar saturation behavior is observed in desorption experiments
using STM on other systems~@Alavi2000@Sloan2003, suggesting that our
approach could be useful for understanding and analyzing other cases.

Finally, our approach successfully explains the giant isotope effect
observed between hydrogen and deuterium. We demonstrate that it arises
from the extremely short timescale of the electronic excitation process,
which magnifies any effect due to the mass difference between H and D
(see Sec.~@sssec:quant_yield).

=== Low-energy electron collision experiments
<sssec:disc_LEEC>
While STM studies have reported saturation of the desorption yield with
increasing bias voltage, low-energy electron collision experiments have
shown a peak in the desorption yield around an energy similar to the
threshold voltage observed in STM experiments~@Bernheim2001@Zoubir2004.
We attribute these differing results to the different carrier injection
methods.

In low-energy electron collision experiments~@Bernheim2001@Zoubir2004,
electrons are injected with a specific energy, explaining why the
desorption yield peaks when the bias voltage reaches 7--8~V (aligning
with the energy level of the antibonding states of Si-H bonds) and
decreases as the bias voltage deviates from this range.

The estimated full width at half maximum of the desorption yield spectra
is about 2.5 eV, somewhat broader than the width of the distribution we
presented in Fig.~@fig:bias_dep. We believe the difference results from
limitations of the experimental setup, as the energy dispersion of the
injected electrons can be significantly wider than the intended
injection energy, an issue acknowledged in Ref.~@Bernheim2001.

=== Oxide-stress experiments
<sssec:disc_oxide>
In Sec.~@ssec:oxide, we computed the trap generation probability spectra
as a function of bias, allowing direct comparison with oxide stress
experiment results. Again, our calculations successfully reproduce the
dependence of trap generation probability on bias voltage, down to the
very low bias of 2~V. These findings align with the assessment in
Ref.~@Cartier1998 that hot-carrier degradation in these experiments is
driven by a single-electron process, since the low current densities
under stress make multi-electron scattering models less likely to
explain the observations.

However, a seeming disagreement with the experimental results occurs at
bias voltages above $tilde.op$7~V, where experimental results show a
continued increase in the trap generation probability (albeit with a
significantly reduced slope), while our results fall off sharply. The
discrepancy is due to the fact that we only consider the process of
electron injection into antibonding states of Si-H; the decrease in the
computed $P_g$ values is then due a decrease in
$P_(upright(A B)) \( E \)$ at higher energies. However, in actual
devices with thin oxides, additional degradation mechanisms become
active at higher biases. DiMaria~@DiMaria1999@DiMaria1999_2@DiMaria2000
noted that hot-hole-induced degradation processes occur above
7~V~@Fischetti1985@Cartier1998.

In deriving Eq.~(@eq:oxide_Pg3) we made the simple approximation that
electrons are injected at a single discrete energy. In actual
experiments, the injected electrons exhibit a distribution of energies.
Given that the energy relaxation length in SiO$""_2$ is only
3~nm~@Dimaria1987@Dimaria1989, some amount of phonon scattering will
occur, resulting in a broadening of electron energies towards lower
energies. In particular, thicker oxides are more likely to lead to a
broader distribution of electron energies, and we note that the
experimental data in Fig.~@fig:trap was collected from samples with
oxide thicknesses between 1.4 and 5.0~nm. In addition, the assumption of
Fowler-Nordheim injection at a single energy may not strictly hold.
Detailed modeling of these effects (if it is actually feasible) would
probably improve the agreement between our calculated $P_g \( E \)$ and
the experimental data in Fig.~@fig:trap.

In summary, our model reproduces key experimental features of the device
degradation process, even accounting for the small but finite
probability of trap creation at biases as low as 2~V.

== Reassessing models for hot-carrier degradation
<ssec:revisit>
As mentioned in the Introduction, models for hot-carrier degradation
used in silicon device engineering fall into two main
categories~@Tyaginov2012@Starkov2011@Reggiani2013@Bina2014@Jech2021: (1)
a single-electron process \[associated with electron excitation from
bonding to antibonding states, Fig.~@fig:mechanisms\(a)\] and (2) a
multi-electron process \[associated with inelastic resonant scattering
leading to vibrational excitation, Fig.~@fig:mechanisms\(b)\], both of
which originated from findings and interpretations of STM
experiments~@Becker1990@Shen1995@Avouris1996@Avouris1996_2@Shen1997@Sakurai1997@Foley1998@Lyding1998@Kanasaki2008.
Based on the results of the present work, we reexamine the validity of
these approaches.

=== Single-electron mechanism
<sssec:single>
The threshold behavior observed in STM results was initially attributed
to one-electron excitation from the bonding to the antibonding states of
Si-H bonds (Fig.~@fig:mechanisms\(a))~@Avouris1996@Avouris1996_2. This
interpretation was subsequently widely adopted as the single-electron
dissociation mechanism in device
modeling~@Tyaginov2012@Starkov2011@Bina2014@Jech2021. However, clear and
consistent evidence for this process has been lacking. Our findings
conclusively show that the single-electron process involves electron
injection into the antibonding states of Si-H bonds
(Fig.~@fig:mechanisms\(c)), rather than electron excitation from the
bonding to the antibonding states of Si-H bonds.

Furthermore, we challenge the validity of the empirical equations used
in device modeling. Historically, the rate of single-electron process
$Gamma_(upright(S E))$ has been modeled by the following
equation~@Tyaginov2012@Starkov2011@Reggiani2013@Bina2014:
$ Gamma_(upright(S E)) = integral f_k \( E \) g_k \( E \) v \( E \) sigma_(upright(S E)) \( E \) d E #h(0em) \, $<eq:old_model>
where $f_k$, $g_k$, and $v$ are defined as in Eq.~(@eq:oxide_flux), and
$sigma_(upright(S E))$ is a cross section that is assumed to be of the
form :
$ sigma_(upright(S E)) \( E \) = sigma_0 \( E - E_(upright(t h \, S E)) \)^(P_(upright(S E))) #h(0em) . $<eq:old_model_SE>
The parameters $sigma_0$ and $E_(upright(t h \, S E))$ in these models
were often inconsistent, varied widely across different studies, and
were frequently adjusted without adequate justification. More
importantly, the exponential factor $P_(upright(S E))$, often set to 11,
lacks a physical basis. In contrast, our model for the dissociation
presented in Sec.~@ssec:bias is grounded in physics and can explain
yield spectra observed in both STM (Sec.~@ssec:STMresults) and
oxide-stress experiments (Sec.~@ssec:oxide), eliminating the need for
empirical approaches.

=== Multi-electron mechanism
<sssec:multi>
The multi-electron mechanism, which assumes inelastic resonant
scattering, was originally proposed as an explanation for the
dissociation observed in the low-bias regime of STM experiments (down to
2~V) ~@Shen1995@Avouris1996@Stokbro1998_2@Jech2021. It was suggested
that electron resonant tunneling through an electronically broadened
Si-H bond state delivers energy to Si-H vibrational modes, leading to an
accumulation of vibrational excitations that eventually results in
dissociation \[Fig.~@fig:mechanisms\(b)\]. The multi-electron nature of
the process seemed to be supported by STM experiments reporting that the
desorption yield depended on current $I$ according to a power law
$I^alpha$, with $alpha = 10$ in Ref.~@Shen1995 and $alpha = 15$ in
~Ref.~@Stokbro1998_2. These values suggested that at least 10 electrons
are needed to "climb the vibrational ladder", ultimately leading to bond
dissociation. However, this proposed mechanism has critical issues.

First, on the experimental side, Soukiassian #emph[et
al.]~@Soukiassian2003 pointed out the inherently large error margin in
desorption measurements and emphasized the importance of averaging
multiple measurements to achieve statistically reliable results. They
also noted the potential influence of other factors, such as the effect
of the metal tip on desorption yield, the possibility of the dissociated
atom reflecting off the tip apex, and the chance of readsorption onto
the surface. Their careful experiments and analysis at a bias voltage of
2.5 V produced a dependence $I^alpha$ with $alpha$=0.3 --1.3, very
different from the earlier results, and more consistent with a
single-electron mechanism. These findings suggest that clear
experimental evidence to support the multi-electron or the "climbing the
vibrational ladder" mechanism is still lacking.

Second, we comment on the empirical equations used to describe
multi-electron process~@Starkov2011@Tyaginov2012@Reggiani2013@Bina2014.
The assumed cross section for multielectron processes follows the same
functional form as that for the single-electron process
\[Eq.~(@eq:old_model_SE)\]:
$ sigma_(upright(M E)) \( E \) = sigma_0 \( E - E_(upright(t h \, M E)) \)^(P_(upright(M E))) #h(0em) . $<eq:old_model_ME>
Assumed values for the exponent $p_(upright(M E))$ have ranged from
$0.1$ to $1$. The choice of $E_(upright(t h \, M E))$ has been
inconsistent as well, with some studies assuming it to be the same for
both single-electron and multi-electron processes
($E_(upright(t h \, S E)) = E_(upright(t h \, M E))$), while others
interpreting it as the phonon vibrational energy
($E_(upright(t h \, M E)) = ℏ omega$). Notably, some papers explicitly
acknowledge their inability to provide a physical justification for
these assumptions~@Starkov2011.

=== Assessment
<sssec:assessment>
In Sec.~@sssec:multi we critiqued a number of aspects of the
multi-electron model, but the most relevant consideration is that, based
on our present work, we see no need for invoking such a model to explain
experimental observations. The multi-electron model was originally
introduced because it appeared that a single-electron excitation
mechanism could not possibly explain dissociation at low bias voltage.
In our present work, we have demonstrated that a mechanism based on
single-electron injection can lead to finite dissociation rates even at
low bias, and agrees with experimental measurements both from STM and
oxide-stress experiments.

To the best of our knowledge, no first-principles calculations had
previously been able to quantitatively explain the observed defect
generation at biases as low as 2 V based on a single-electron process.

One aspect that may require further attention is the role of the bending
modes of Si-H bonds. While we demonstrated in Sec.~@sssec:Si-H_bulk (and
Supplemental Material~@supplementary, Fig.~S4) that bending
modes do not play a #emph[direct] role in the process of dissociation,
they could affect the spreading of the nuclear wave packet that enters
into the dissociation probability \[Fig.~@fig:bias_dep and
Eqs.~(@eq:new_model) and (@eq:oxide_cross)\]. Our current analysis is
based on the standard MGR approach, where the reaction pathway is
described using a 1D diagram that follows the stretching mode of the
Si-H bond. A more complete description could be obtained by
incorporating nuclear dynamics across the full 3D potential energy
surface, accounting for both the stretching and bending modes. While
this refinement would not alter our key results, it could affect the
detailed shape of the desorption or trap-generation rate as a function
of bias (Figs.~@fig:fitting and @fig:trap). Incorporating these effects
could improve the quantitative accuracy of the dissociation probability.

Finally, we note that in the present work the applied bias enters the
yield and transition-rate expressions, whereas the potential-energy
surfaces were computed at zero external field. Although an electric
field can, in principle, modify the Si--H potential and shift the energy
of the antibonding resonant states, such effects are expected to be
small and not affect the overall qualitative conclusions~@Jech2021.
Future first-principles calculations could explicitly include such
electric-field effects---for example, by using finite-field or
slab-based DFT calculations---and evaluate the corresponding
field-dependent non-adiabatic couplings.

= Conclusion
<sec:conc>
In summary, using first-principles approaches we have investigated the
mechanisms involved in carrier-induced bond dissociation, a phenomenon
that is critically important for radiation damage, photodegradation,
photocatalysis, and degradation of Si devices. Taking the latter as our
case study, we focused on Si-H bond dissociation, which directly impacts
the performance and reliability of silicon-based devices. In contrast to
earlier computational studies that assumed the Si-H bonding and
antibonding states involved in the dissociation process exist as
electronic eigenstates of the system, our approach is based on a
fundamentally different premise: these states are instead transient,
non-adiabatic states. Based on this perspective, we developed a
non-adiabatic framework for the bond dissociation process, consistent
with approaches used to describe chemical reactions involving strong
electron--nuclear coupling. First, we employed a partitioning method
using MLWFs to extract these localized states from DFT calculations.
Then, we applied the MGR approach, which explicitly accounts for the
quantum mechanical aspects of nuclear dynamics, allowing us to capture
the probabilistic aspect of the bond dissociation process.

We demonstrate that the Si-H bond dissociation observed in various
experiments~@Becker1990@Shen1995@Avouris1996@Avouris1996_2@Shen1997@Sakurai1997@Foley1998@Lyding1998@Vondrak1999@Vondrak1999_2@Pusel1998@Bernheim2001@Zoubir2004
is consistently explained by the electron‐stimulated dissociation
process \[Fig.~@fig:mechanisms\(c)\], in which direct electron injection
into the antibonding orbital of the Si--H bond generates a repulsive
potential that exerts a force on the hydrogen nucleus, ultimately
leading to bond cleavage. We offer a comprehensive explanation for
several key observations, including the physical origin of the threshold
energy for dissociation, the occurrence of dissociation at significantly
lower energies with a finite probability, the high isotope ratio, and
the temperature independence of the dissociation process. Our conclusion
contrasts with the previously accepted hypothesis, which assumed that
electron excitation from the bonding orbital to the antibonding orbital
caused bond dissociation. Our approach is equally applicable to
hole-injection-induced dissociation process. We offer a direct
explanation for the Si-H bond dissociation observed in STM measurements,
as well as the hot-carrier-induced trap creation observed in
oxide-stress experiments, along with modeling the dissociation spectrum
as a function of bias.

Given the significance of hot carrier degradation in modern silicon
devices, our framework offers a deeper understanding of the Si-H bond
dissociation process and can lead to improved engineering and
reliability in silicon-based technologies. More generally, our framework
can be readily applied to other bond-breaking processes involving strong
electron--nuclear coupling, thus offering a comprehensive approach to
hot-carrier-induced nuclear dynamics.

#heading(level: 1, numbering: none)[Acknowledgements]
<acknowledgements>
This work was supported by the Air Force Office of Scientific Research
(FA9550-22-1-0165) and by a Global Research Outreach grant from Samsung
Semiconductor, Inc. It used the Stampede3 at Texas Advanced
Supercomputing Center (TACC) through allocation DMR070069 from the
Advanced Cyberinfrastructure Coordination Ecosystem: Services & Support
(ACCESS) program, which is supported by National Science Foundation
Grants No. 2138259, 2138286, 2138307, 2137603 and 2138296.

#let references = read("source/ref.bib").replace("year         = {},", "")
#bibliography(bytes(references),style:"ieee")
