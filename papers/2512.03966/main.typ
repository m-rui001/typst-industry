// Typst format conversion of arXiv:2512.03966v1 under CC BY 4.0.
#set page(paper: "a4", margin: 21mm, numbering: "1")
#set text(font: "Libertinus Serif", size: 11pt)
#set par(justify: true)
#set heading(numbering: "1.1")
#set math.equation(numbering: "(1)")
#align(center)[
  #text(size: 16pt, weight: "bold")[A CMOS+X Spiking Neuron With On-Chip Machine Learning]
  #v(4pt)
  Steven Louis#super[1], Matthew Blake Abramson#super[3], Hannah Bradley#super[1],
  Cody Trevillian#super[1], Gene David Nelson#super[3], Andrei Slavin#super[1],
  Artem Litvinenko#super[1], Jason Gorski#super[2], Ilya N. Krivorotov#super[3],
  Darrin Hanna#super[1], and Vasyl Tyberkevych#super[1]

  #super[1] Department of Physics and Department of Electrical and Computer Engineering, Oakland University, Rochester, MI 48309, USA \
  #super[2] MicroNova, Waterford, MI 48328, USA \
  #super[3] Department of Physics and Astronomy, University of California, Irvine, CA 92697, USA

  #link("mailto:SLouis@oakland.edu")
]
#heading(numbering: none)[Abstract]
We present the design and numerical simulation of a spiking neuron
capable of on-chip machine learning. Built within the CMOS+X framework,
the spiking neuron consists of an NMOS transistor combined with a
magnetic tunnel junction (MTJ). This NMOS+MTJ unit, when simulated in
the industry-standard circuit simulation software "LTspice", reproduces
multiple functions of a biological neuron, including threshold spiking,
latency, refractory periods, synaptic integration, inhibition, and
adaptation. These behaviors arise from the intrinsic magnetization
dynamics of the MTJ and do not require any additional control circuitry.
By interconnecting the NMOS+MTJ neurons, we construct a model of an
analog multilayer network that learns through spike-timing-dependent
weight updates derived from a gradient-descent rule, with both training
and inference modeled in the analog domain. The simulated CMOS+X network
achieves reliable spike propagation and successful training on a
nonlinear task, indicating a feasible path toward compact, low-power,
in-memory neuromorphic hardware for edge applications.

*Keywords:* Neuromorphic computing, Magnetic tunnel junctions (MTJ), Beyond CMOS,
CMOS+X, CMOS-X, NMOS+MTJ, Spiking neural networks (SNN), Analog
circuits, Gradient descent, On-chip learning, On-chip training,
Spintronics, Hardware neural networks, Edge computing, Analog
computation, CMOS integration, In-memory computing, Synaptic
integration, leaky integrate and fire (LIF).

= Introduction
<introduction>
edge-computing platforms face growing demands for real-time intelligence
under strict constraints on energy, latency, and silicon area
#link(<ref:li2019edge>)[\[1\]]. Conventional deep-learning architectures rely on dense
matrix operations and high-precision arithmetic, which make them
computationally expensive and poorly suited for battery-powered or
thermally limited devices #link(<ref:jouppi2017datacenter>)[\[2\]]. In contrast, spiking
neural networks (SNNs) offer an alternative that is inherently more
energy-efficient, as the information is carried in sparse, discrete
spikes and computation occurs only when spikes are present
#link(<ref:maass1997networks>)[\[3\]]#link(<ref:davies2018loihi>)[\[4\]]. The timing of these spikes carries
meaning, enabling fast and low-power processing inspired by biological
neural systems. These advantages have made SNNs increasingly attractive
for embedded and edge-AI applications, where the energy-efficiency is as
important as the accuracy.

Achieving these benefits in hardware requires moving beyond traditional
digital architectures #link(<ref:markovic2020physics>)[\[5\]]. However, the implementation
of #emph[digital] SNNs faces memory bottlenecks, clock-synchronous
overhead, and substantial energy per operation #link(<ref:tang2023seneca>)[\[6\]]. As a
result, there is growing interest in analog, in-memory neuromorphic
computing, where the nanoscale analog devices perform neural computation
directly
#link(<ref:markovic2020physics>)[\[5\]]#link(<ref:tang2023seneca>)[\[6\]]#link(<ref:grollier2016bioinspired>)[\[7\]]#link(<ref:finocchio2024roadmap>)[\[8\]]#link(<ref:Incorvia>)[\[9\]]#link(<ref:indiveri2015memory>)[\[10\]].
Such systems can exploit device physics to realize massive parallelism,
sub-femtojoule operation, and ultrasmall circuit footprints, positioning
neuromorphic hardware as a key enabler for scalable, low-power AI
#link(<ref:indiveri2015memory>)[\[10\]].

CMOS+X is a recently proposed hardware framework designed to meet these
needs by integrating standard CMOS with emerging analog devices for
neuromorphic computing #link(<ref:Incorvia>)[\[9\]]#link(<ref:nsf2022cmosx>)[\[11\]]. This device-agnostic
architecture incorporates beyond-CMOS technologies, including
spintronic, memristive, and photonic components, which can be used to
realize compact spiking neurons and tunable synapses within a fully
analog, CMOS-compatible environment. For many CMOS+X approaches, it is
desirable for device-level neural elements to generate spiking behavior
and to participate in learning computations without relying on digital
control or on a separation between memory and compute.

In this work, we demonstrate that a spintronic magnetic tunnel junction
(MTJ) provides an efficient and manufacturable "X" element for the
CMOS-X neuromorphic processors, capable of supporting both on-chip
traning and inference. MTJs offer tunable resistance, well-understood
spin-transfer-torque (STT) dynamics, and established fabrication
processes already deployed in embedded MRAM technology, making MTJs
highly suitable for integration with CMOS
#link(<ref:chappert>)[\[12\]]#link(<ref:alzate>)[\[13\]]#link(<ref:edelstein>)[\[14\]]#link(<ref:everspin>)[\[15\]]#link(<ref:sun>)[\[16\]]. Prior work has shown that MTJs
can emulate neuronal behavior through their magnetization dynamics
#link(<ref:mtjneuron>)[\[17\]], and numerous studies have demonstrated their potential in
neuromorphic and unconventional computing systems
#link(<ref:markovic2020physics>)[\[5\]]#link(<ref:grollier2016bioinspired>)[\[7\]]#link(<ref:finocchio2024roadmap>)[\[8\]]#link(<ref:Incorvia>)[\[9\]]#link(<ref:salinas2023lastmile>)[\[18\]]#link(<ref:chumak2022roadmap>)[\[19\]]#link(<ref:jiang2024spin>)[\[20\]].

We demonstrate below that pairing an MTJ with a single NMOS transistor,
forming a structure nearly identical to a standard 1T-1MTJ MRAM cell
#link(<ref:Lin2009>)[\[21\]], naturally yields spiking behavior through STT-driven
magnetization dynamics. The resulting NMOS+MTJ neuron reproduces
essential neuronal properties, including threshold activation, spike
generation, latency, refractory behavior, synaptic integration,
inhibition, and adaptation. These properties emerge naturally from the
coupled device physics and transistor operation, enabling development of
compact, fully analog artificial neurons compatible with standard
semiconductor manufacturing.

We further demonstrate that networks of NMOS+MTJ neurons, interconnected
by CMOS analog synapses, can perform both feedforward inference and
gradient-descent learning directly in hardware using time-encoded spike
signals. In our model system, each neuron operates as a single-fire
spiking unit, a structure that enables differentiable spike timing and
makes gradient-descent-based learning feasible within an analog SNN
framework. Using simulations in LTspice, we construct a multilayer
spiking neural network capable of learning the nonlinear XOR
classification task, a standard benchmark for evaluating neuromorphic
learning systems, entirely within the analog domain. This includes
analog implementation of supervised learning using spike-timing-based
gradient descent, extending recent theoretical work on the artificial
neuron equation (ANE) and time-domain learning.

This paper proceeds as follows. Section II reviews the electrical and
magnetic properties of MTJs relevant to neuromorphic operation. Section
III demonstrates how a single NMOS+MTJ pair functions as a spiking
neuron and reproduces multiple biologically inspired behaviors. Section
IV describes how these neurons can be interconnected through analog
synapses to form functional multilayer networks. Section V presents a
fully analog, gradient-descent learning demonstration on the XOR task.
Together, these results establish a proof-of-concept path toward
low-power, trainable, CMOS-compatible neuromorphic processors based on
MTJ-enabled spiking neural networks.

= Magnetic Tunnel Junctions
<magnetic-tunnel-junctions>
== Neuron configuration
<neuron-configuration>
Magnetic tunnel junctions and spin valves are nanoscale spintronic
devices that have been used in data storage technologies for several
decades #link(<ref:chappert>)[\[12\]]. These devices were first used as read heads in hard
disk drives, and later were adopted as nonvolatile memory elements in
magnetoresistive random access memory (MRAM) #link(<ref:alzate>)[\[13\]]#link(<ref:edelstein>)[\[14\]]#link(<ref:everspin>)[\[15\]].
A typical MTJ design consists of a multilayer structure composed of
alternating ferromagnetic and nonmagnetic layers. The operation relies
on the tunneling magnetoresistance effect, in which the electrical
resistance of the MTJ depends on the relative orientation of the
magnetization directions in the ferromagnetic layers #link(<ref:sun>)[\[16\]].

A recent theoretical study has shown that under specific operating
conditions, an MTJ can exhibit electrical behaviors that are similar to
those of biological neurons #link(<ref:mtjneuron>)[\[17\]]. These behaviors include
threshold based spiking, integration of input signals over time,
refractory periods, inhibition, and adaptation, which are all features
observed in biological neurons. These behaviors arise from the
magnetization dynamics of the MTJ and do not require any additional
control circuitry.

The MTJ used in this work consists of multiple stacked magnetic and
dielectric layers, as shown in Figure @toon\(a). Two of these layers
have fixed magnetization directions, set by their internal anisotropy
and pinning structure. These layers are referred to as the reference
layer ($upright(bold(p))_1$) and the analyzer layer
($upright(bold(p))_2$). Between these layers is the free layer, whose
magnetization $upright(bold(m))$ is not fixed and can rotate in response
to external influences #link(<ref:mtjneuron>)[\[17\]]. MTJ stacks implemented in commercial
technologies are more complex than this model and often include features
such as synthetic antiferromagnet-pinned fixed layers and low-anisotropy
free layers; however, the simplified model used here is sufficient for
this work.

#figure(image("source/Fig1CartoonAndCircuit.svg"),
  caption: [
    (a) MTJ structure showing the reference layer $upright(bold(p))_1$,
    the analyzer layer $upright(bold(p))_2$, and the free layer
    $upright(bold(m))$ whose magnetization can rotate in the
    $x y$-plane. The resistance $R_(upright(M T J)) \( phi.alt \)$
    depends on the angle between $upright(bold(m))$ and
    $upright(bold(p))_2$. (b) NMOS+MTJ neuron circuit in which a
    magnetic tunnel junction is connected in series with an NMOS
    transistor. The input voltage $V_(upright(i n))$ is applied to the
    transistor gate, and the output voltage $V_(upright(o u t))$ is
    measured at the drain. The series connection ensures that the same
    current $I_(upright(M T J))$ equals the drain current $I_D$ and
    flows through both elements.
  ]
)
<toon>

The resistance of the MTJ, $R_(upright(M T J)) \( phi.alt \)$, depends
on the angle between $upright(bold(m))$ and $upright(bold(p))_2$ #link(<ref:sun>)[\[16\]],
where $phi.alt$ is defined as the angle between $upright(bold(m))$ and
the x-axis. In this work, the analyzer layer $upright(bold(p))_2$ is
assumed to be fixed in the $upright(bold(hat(y)))$ direction, as shown
in the coordinate system in Figure @toon. The magnetization vector
$upright(bold(m))$ is assumed to remain approximately within the
$upright(bold(hat(x) hat(y)))$-plane #link(<ref:mtjneuron>)[\[17\]]. A small external
magnetic field is applied in the $upright(bold(hat(x)))$ direction so
that in the absence of an external disturbance, $upright(bold(m))$ is
also oriented in the $upright(bold(hat(x)))$ direction.

The relationship between $phi.alt$ and the MTJ resistance is as follows.
When $phi.alt = 90^compose$, $upright(bold(m))$ and $upright(bold(p))_2$
are aligned in parallel, $R_(upright(M T J))$ is at a minimum. In this
work, the resistance in the parallel state is assumed to have a value of
$R_P = 500 med Omega$. When $phi.alt = 270^compose$, $upright(bold(m))$
and $upright(bold(p))_2$ are in antiparallel alignment, and
$R_(upright(M T J))$ is at a maximum. The resistance in the antiparallel
state is assumed to have a value of $R_(A P) = 1500 med Omega$. These
values for $R_P$ and $R_(A P)$ are typical for MTJs. For other values of
$phi.alt$, the $R_(upright(M T J))$ varies between $R_P$ and $R_(A P)$
(eq. (1) in #link(<ref:phyBased>)[\[22\]]).

The magnetization of the reference layer $upright(bold(p))_1$ is
oriented in the $upright(bold(hat(z)))$ direction. When a current
$I_(upright(M T J))$ flows through the MTJ, some of the electrons in the
current become spin polarized by aligning their spins with the
magnetization of $upright(bold(p))_1$. As these spin polarized electrons
reach the free layer, they apply a torque to $upright(bold(m))$ through
a physical effect known as spin transfer torque (STT) #link(<ref:slon1>)[\[23\]]#link(<ref:slon2>)[\[24\]]. This
torque causes $upright(bold(m))$ to evolve over time
#link(<ref:krivorotov2008time>)[\[25\]]. Therefore, the dynamics of $upright(bold(m))$, and
thus the angle $phi.alt$ and indirectly
$R_(upright(M T J)) \( phi.alt \)$, are influenced by
$I_(upright(M T J))$. Please note that the STT from the analyzer layer
is negligible because $upright(bold(p))_2$ is oriented in-plane and
therefore it does not significantly affect the free-layer dynamics
#link(<ref:mtjneuron>)[\[17\]].

The STT effect is responsible for switching memory states in MRAM
#link(<ref:worledge>)[\[26\]]. In MRAM, a current pulse of sufficient magnitude and duration
changes the relative orientation of the free and fixed magnetic layers,
switching the MTJ resistance between the parallel and antiparallel
states~#link(<ref:Bhatti2017>)[\[27\]]#link(<ref:Nguyen2024>)[\[28\]]. This process is repeatable, non-volatile,
and operates within standard CMOS circuit environments. These
characteristics have enabled MRAM to become a commercially available
embedded memory technology #link(<ref:everspin>)[\[15\]]. Consequently, the MTJ-based
circuits described in the following sections can, in principle, be
realized within standard semiconductor manufacturing flows that already
support MRAM.

== MTJs and AI
<mtjs-and-ai>
Our work seeks to use MTJs in analog circuits designed to perform
machine learning. This work builds upon a rapidly expanding body of
research that seeks to implement machine learning functions directly in
spintronic hardware. This section provides concise overview of
representative studies at the intersection of spintronics, artificial
intelligence, and machine learning. This brief survey is intended to
orient readers who are new to spintronics and highlight recent
experimental and theoretical studies. For broader coverage, see these
reviews on neuromorphic and unconventional spintronic computing
#link(<ref:markovic2020physics>)[\[5\]]#link(<ref:grollier2016bioinspired>)[\[7\]]#link(<ref:finocchio2024roadmap>)[\[8\]]#link(<ref:Incorvia>)[\[9\]]#link(<ref:salinas2023lastmile>)[\[18\]]#link(<ref:chumak2022roadmap>)[\[19\]]#link(<ref:jiang2024spin>)[\[20\]].

Experimental studies have demonstrated that magnetic nanodevices can
directly implement machine-learning functions. For instance, a single
MTJ has been used for temporal pattern classification in reservoir
computing applied to spoken-digit recognition~#link(<ref:torrejon2017>)[\[29\]], and a
similar experiment showed single-MTJ reservoir computing for temporal
signal classification~#link(<ref:riou2019>)[\[30\]]. Arrays of coupled MTJs have also been
used for pattern recognition, such as vowel classification using
synchronized dynamics in a four-MTJ network~#link(<ref:romera2018>)[\[31\]]. Another study
achieved image classification with a $4 times 2$ MTJ crossbar
array~#link(<ref:Zhou2021>)[\[32\]]. MTJs have also been used to implement stochastic neuron
behavior, including MTJ-based neural networks #link(<ref:kaiser2022hardware>)[\[33\]].
Larger systems, such as a $15 times 15$ STT-MTJ crossbar array
programmed with binary weights, have experimentally demonstrated
inference on the Wine dataset, validating the feasibility of MTJ-based
hardware classifiers~#link(<ref:Goodwill2022>)[\[34\]]. Together, these results establish
the experimental foundation for spintronic implementations of
machine-learning architectures.

Experimental work in MRAM has also demonstrated its potential for both
analog and digital computation in neural architectures. Multi-level
resistance states in MRAM cells confirm stable switching for analog
synaptic weighting~#link(<ref:Rzeszut2022>)[\[35\]]. An embedded memory array containing
over eight million MTJs was used not only to store quantized synaptic
weights as nonvolatile resistance states, but also to perform
multiply--accumulate (MAC) operations directly within the MTJ
array~#link(<ref:you20238b>)[\[36\]]. MRAM-based arrays have performed logic and arithmetic
operations, directly within memory~#link(<ref:Lv2024>)[\[37\]]. Analog multiply--accumulate
behavior in MRAM crossbars was examined experimentally in~#link(<ref:Kiseleva2025>)[\[38\]],
while mixed-signal MRAM--CMOS circuits demonstrated real-time neural
emulation with multi-level analog synapses and voltage-domain
processing~#link(<ref:Lee2025>)[\[39\]].

The neuron used in this work was described previously in~#link(<ref:mtjneuron>)[\[17\]],
where it was shown that MTJ dynamics can follow the artificial neuron
equation (ANE). Similar ANE equations have been derived for a wide range
of devices, including antiferromagnetic neurons~#link(<ref:Khymyn>)[\[40\]], synthetic
antiferromagnetic oscillators~#link(<ref:Liu>)[\[41\]], optically initialized
antiferromagnetic heavy-metal heterostructures~#link(<ref:Mitro>)[\[42\]], spin Hall
nano-oscillators~#link(<ref:Ovcha>)[\[43\]], and Josephson junctions~#link(<ref:Crotty2010>)[\[44\]]#link(<ref:Schneid>)[\[45\]].
Thermal-fluctuation--assisted MTJ neurons were also simulated
in~#link(<ref:rodrigues2023spintronic>)[\[46\]], and additional MTJ-based neuron
implementations have been reported in~#link(<ref:zhang2025dual>)[\[47\]]. A review of
neurons governed by the ANE was presented in~#link(<ref:Bradley2023>)[\[48\]], which
summarized the theoretical characteristics common to these devices.
Since that publication, two studies have demonstrated machine-learning
applications based on the ANE~#link(<ref:Bradley2024>)[\[49\]]#link(<ref:Sotnyk2025>)[\[50\]], and another has
shown that the same formalism can reproduce a biological withdrawal
reflex and can be mapped onto the Hodgkin--Huxley model~#link(<ref:BradleyWithD>)[\[51\]]. A
review of neurons governed by the ANE was presented in~#link(<ref:Bradley2023>)[\[48\]],
which summarized the theoretical characteristics common to these
devices. Since that publication, two other studies have demonstrated
machine-learning applications based on the ANE~#link(<ref:Bradley2024>)[\[49\]]#link(<ref:Sotnyk2025>)[\[50\]],
and yet another has shown that the same formalism can reproduce a
biological withdrawal reflex and can be mapped onto the Hodgkin--Huxley
model~#link(<ref:BradleyWithD>)[\[51\]].

= NMOS+MTJ Spiking Neuron
<sectmtjnmos>
The present work combines an MTJ with a single NMOS transistor, as shown
in Figure~@toon\(b), to form a functional artificial neuron. This
configuration uses the MTJ to generate spikes through STT driven
magnetization dynamics, and uses the NMOS transistor to control the
current that drives these dynamics. Both the input to the neuron and the
output from the neuron are voltages, which makes the circuit compatible
with conventional CMOS voltage signals. The combination produces a
compact and scalable circuit element that can be used as a building
block for construction of neuromorphic networks. In this section, the
circuit configuration, operating principle, and simulation results for
the NMOS+MTJ neuron are presented.

For the electrical neuron shown in Figure~@toon\(b), the input voltage
$V_(upright(i n))$ is applied to the gate of the NMOS transistor, and
the output voltage $V_(upright(o u t))$ is measured at the drain. The
output is given by the expression
$ V_(upright(o u t)) = V_(upright(D D)) - I_D R_(upright(M T J)) \( phi.alt \) $<ohms>
Here, $V_(upright(D D))$ is the supply voltage,
$R_(upright(M T J)) \( phi.alt \)$ is the resistance of the MTJ, and
$I_D$ is the drain current of the transistor. The MTJ and the NMOS
transistor are connected in series, so that the same current flows
through both elements, that is, $I_D = I_(upright(M T J))$. The gate
voltage $V_(upright(i n))$ determines the value of $I_D$, which controls
the neuron response. Together, the MTJ and NMOS transistor form what is
referred to in this paper as an "NMOS+MTJ neuron".

It is worth noting that the circuit in Figure~@toon\(b) is nearly
identical to a one-transistor-one-MTJ (1T-1MTJ) cell commonly used in
MRAM #link(<ref:Lin2009>)[\[21\]]. In a conventional 1T-1MTJ cell, the MTJ serves as a
non-volatile storage element whose resistance encodes a binary state,
while the access transistor controls read and write operations. By
adapting this familiar structure for dynamic operation, the present
design leverages device technology already optimized for large-scale
manufacturing for established MRAM processes.

The circuit shown in Figure~@toon\(b) provides the foundation for this
work. In this section, we demonstrate that the 1T--1MTJ cell can
reproduce behaviors that are characteristic of biological neurons. In
the following sections, we demonstrate that the NMOS+MTJ neuron can be
interconnected into spiking neural networks with tunable synapses
capable of performing gradient-descent-based learning entirely in the
analog domain.

Simulations of this circuit were carried out using LTspice, a widely
used tool for analog circuit simulation #link(<ref:ltspice>)[\[52\]]. The model of an NMOS
transistor was selected from the default component library included with
the software. The MTJ model was adapted from a previously published
design #link(<ref:phyBased>)[\[22\]], with details of the modifications and the simulation
parameters provided in Appendix~A.

Figure~@demo shows the results of the LTspice simulation. At the
beginning of the simulation, the gate voltage is set to
$V_(upright(i n)) = 0 med upright(V)$, which places the NMOS transistor
in cutoff and prevents current from flowing through the circuit
(Figure~@demo\(b)). Under these conditions, the magnetization vector
$upright(bold(m))$ is aligned with the external magnetic field in the
$upright(bold(hat(x)))$ direction, resulting in an angle $phi.alt$ equal
to $0^compose$ (Figure~@demo\(c)). At this angle, the MTJ maintains a
resistance of $750 med Omega$ (Figure~@demo\(d)), and the output voltage
is equal to the supply voltage $V_(upright(D D)) = 5 med upright(V)$
(Figure~@demo\(e)).

#figure(image("source/Fig2Demo.svg"),
  caption: [
    Simulation results of the NMOS+MTJ neuron circuit in LTspice. (a)
    Input gate voltage $V_(upright(i n))$. (b) Corresponding drain
    current $I_D$. (c) Free layer magnetization angle $phi.alt$. (d)
    Time-dependent MTJ resistance $R_(upright(M T J))$. (e) Output
    voltage $V_(upright(o u t))$.
  ]
)
<demo>

At time $t = 2 med upright(n s)$, the gate voltage increases to a bias
voltage $V_(upright(b i a s)) = 3.16 med upright(V)$ (Figure~@demo\(a)),
placing the NMOS transistor in saturation with a drain current $I_D$ of
approximately $100 med mu upright(A)$ (Figure~@demo\(b)). This current
applies an STT that rotates the magnetization vector $upright(bold(m))$
in the free layer from $phi.alt = 0^compose$ to approximately
$80^compose$, bringing $upright(bold(m))$ close to alignment with
$upright(bold(p))_2$ (Figure~@demo\(c)). As a result, the MTJ resistance
decreases to about $500 med Omega$, and the output voltage, which can be
calculated from Eq.~(@ohms), drops to approximately
$V_(upright(o u t)) = 4.95 med upright(V)$.

At time $t = 5 med upright(n s)$, the input voltage $V_(upright(i n))$
briefly increases to $3.45 med upright(V)$. This short pulse causes the
drain current $I_D$ to briefly increase to $120 med mu upright(A)$
before returning to $100 med mu upright(A)$. The brief increase in
current, together with the instantaneous value of $R_(upright(M T J))$,
produces a small bump at $t = 5$ ns in the output voltage
$V_(upright(o u t))$, as shown in Figure~@demo\(e). A more important
change also occurs at this time. The elevated current increases the STT
and drives the magnetization angle $phi.alt$ beyond $90^compose$. After
a delay of about $2 med upright(n s)$, the free layer magnetization
$upright(bold(m))$ completes a full $360^compose$ precession at
$t = 7 med upright(n s)$ and then stabilizes at $phi.alt = 440^compose$,
which is equivalent to $80^compose med mod med 360$. During this
rotation, the MTJ resistance $R_(upright(M T J))$ rapidly increases from
$500 med Omega$ to $1500 med Omega$ and then returns to $500 med Omega$.
This sharp and temporary change in resistance causes a distinct peak in
the output voltage with a minimum value of $4.85 med upright(V)$, as
shown in Figure~@demo\(e). In the context of spiking neural networks,
this type of output waveform is referred to as a "spike" because it
resembles the voltage spike of biological neurons. The ability of the
MTJ--NMOS pair to generate such spikes demonstrates its suitability for
use as a spiking artificial neuron.

The rotation of the free layer magnetization can be explained by the
existence of a threshold angle $phi.alt_(upright(t h))$. With only the
bias current applied, the magnetization remains near
$phi.alt = 80^compose$. If $upright(bold(m))$ momentarily rotates past
$phi.alt_(upright(t h))$, the spin transfer torque drives a complete
precession of the magnetization. For the system used in this work, the
threshold angle is $phi.alt_(upright(t h)) = 90^compose$. The value of
the input voltage $V_(upright(i n))$ required to push $phi.alt$ past
this angle represents the circuit-level threshold condition, and it
depends on the combination of the bias voltage $V_(upright(b i a s))$
and the instantaneous impulse voltage applied at the gate. For the bias
condition of $V_(upright(b i a s)) = 3.16 med upright(V)$ used here, a
single input spike that raises $V_(upright(i n))$ above approximately
$V_(upright(t h)) = 3.4 med upright(V)$ is sufficient to exceed
$phi.alt_(upright(t h))$. As shown by the dashed line in
Figure~@demo\(a), the input pulse applied at $t = 5 med upright(n s)$
exceeds $V_(upright(t h))$ and therefore initiates the full
$360^compose$ precession observed in the simulation.

At time $t = 10 med upright(n s)$, there is a second input impulse with
an amplitude of $3.55 med upright(V)$, which is larger than the
amplitude of the first impulse. In other words, the input voltage
$V_(upright(i n))$ is even further above the threshold voltage
$V_(upright(t h))$ than in the first case. The larger input momentarily
produces a stronger STT that causes the magnetization to rotate past the
threshold angle $phi.alt_(upright(t h))$ more quickly. As a result, the
delay between the input pulse and the onset of precession is reduced
from about $2 med upright(n s)$ to about $1 med upright(n s)$. Once a
full $360^compose$ precession is initiated, the free layer magnetization
follows the same trajectory as before, starting from its initial
stationary position, passing through antiparallel alignment, and
returning to its starting orientation. Because the amplitude of the MTJ
resistance spike depends on the total angular excursion rather than the
speed at which the precession begins, the output voltage
$V_(upright(o u t))$ retains the same spike shape regardless of how
quickly the precession is initiated.

At time $t = 15 med upright(n s)$, there is a third input impulse with
an amplitude of $3.35 med upright(V)$, which is below the threshold
voltage $V_(upright(t h))$. This input causes a small increase the drain
current, however, the STT is not sufficient to initiate a full rotation
of the free layer magnetization. As a result, no spike is generated, and
the output voltage $V_(upright(o u t))$ remains unchanged.

Together, the response of the NMOS+MTJ neuron to these three input
perturbations demonstrate an important feature observed in biological
neurons, known as threshold activation. Threshold activation, also
referred to as the all-or-nothing response, means that the neuron
remains inactive if the input is below the threshold condition. If the
input exceeds the threshold, the neuron generates a spike with the same
characteristic shape regardless of the strength of the input. In the
NMOS+MTJ neuron, the threshold condition corresponds to the
magnetization angle $phi.alt$ exceeding the threshold angle
$phi.alt_(upright(t h))$. If $phi.alt$ remains below
$phi.alt_(upright(t h))$, the neuron stays inactive and no spike is
generated. If $phi.alt$ exceeds $phi.alt_(upright(t h))$, the neuron
generates a spike with the same characteristic shape regardless of how
quickly $upright(bold(m))$ moves beyond the threshold angle.

The simulation also demonstrates a second feature observed in biological
neurons, known as response latency. Response latency is the measurable
delay between the application of an input and the onset of spiking
activity #link(<ref:levakova2015review>)[\[53\]]. As in biological neural systems, the
latency in the NMOS+MTJ neuron depends on the strength of the input.
Stronger inputs result in shorter delays, while inputs close to the
threshold condition produce longer delays before a spike occurs. This
was observed in Figure~@demo at $t = 5 \, med 10$ ns.

We next consider a simulation that examines synaptic integration in the
NMOS+MTJ neuron. While the previous results focused on threshold
activation and response latency using single input pulses, this
simulation demonstrates how the neuron responds to multiple subthreshold
inputs applied in close succession. Synaptic integration is an important
computational process in biological neurons in which multiple excitatory
and inhibitory inputs are combined over time to determine whether the
membrane potential reaches the firing threshold. This capability allows
biological neurons to detect temporal patterns, perform coincidence
detection, and encode complex spatiotemporal information.

In neuromorphic computing, temporal aspects of synaptic integration are
commonly approximated using the leaky integrate-and-fire (LIF) model, in
which the membrane potential integrates incoming signals while gradually
decaying toward a resting value, and a spike is produced once the
threshold is crossed #link(<ref:gerstner2002spiking>)[\[54\]]. Figure~@bio\(a) illustrates
that the NMOS+MTJ neuron exhibits this same functional behavior. In the
figure, the orange curve represents the input voltage and the blue curve
represents the output voltage. When a single subthreshold input spike is
applied at $t = 5 med upright(n s)$, the neuron remains inactive and no
spike is generated. When two subthreshold spikes arrive in succession at
$t = 15 med upright(n s)$, their combined effect pushes the
magnetization angle $phi.alt$ past the threshold angle
$phi.alt_(upright(t h)) = 90^compose$, producing an output spike. This
result confirms that the NMOS+MTJ neuron can perform synaptic
integration in a manner consistent with the LIF model.

#figure(image("source/Fig3GraphAll.svg"),
  caption: [
    Biological neuron-like behaviors reproduced by the NMOS+MTJ neuron
    circuit. In the plot, the red curve shows the input voltage and the
    blue curve shows the output voltage. (a) Leaky integrate and fire /
    synaptic integration: multiple subthreshold inputs combine over time
    to trigger a spike. (b) Refractory period: demonstrates absolute and
    relative refraction following an initial spike. (c) Inhibition: an
    inhibitory signal prevents spiking that would otherwise occur. (d)
    Frequency modulation: constant input above threshold produces a
    spike train whose frequency depends on input amplitude. (e)
    Adaptation: response latency changes due to a shift in input bias,
    even with identical stimulus pulses.
  ]
)
<bio>

Figure @bio presents additional demonstrations of biologically inspired
behaviors exhibited by the NMOS+MTJ neuron in LTspice simulations.
Figure~@bio\(b) illustrates the refractory response, a fundamental
property of biological neurons #link(<ref:gerstner2002spiking>)[\[54\]]. The absolute
refractory period is the short interval immediately following a spike
during which no subsequent firing can occur. In the LTspice simulation,
absolute refraction occurs when an input pulse at
$t = 1 med upright(n s)$ generates a spike, but a second pulse of equal
amplitude at $t = 4.1 med upright(n s)$ fails to produce any output. The
relative refractory period is the interval during which a second spike
is possible but occurs with altered timing due to incomplete recovery of
the free layer magnetization. In the LTspice simulation, relative
refraction occurs when an input pulse at $t = 13 med upright(n s)$
generates a spike, and a subsequent pulse at $t = 16.2 med upright(n s)$
also triggers firing; however, the output waveform exhibits a different
response latency because the neuron has not yet fully returned to its
equilibrium state.

Figure~@bio\(c) illustrates inhibition, another important feature of
biological neurons. At $t = 2 med upright(n s)$, an uninhibited input
pulse with an amplitude above the firing threshold of
$V_(upright(t h)) = 3.4 med upright(V)$ triggers a spike. Later,
$t = 14 med upright(n s)$ there is an excitatory input the same
amplitude which is preceded by an inhibitory signal at
$t = 13 med upright(n s)$. The inhibitory signal prevents the neuron
from reaching the firing threshold in response to the excitatory input,
and no spike is generated. This is an example of negative inhibition,
where an inhibitory input suppresses spiking that would otherwise occur.

Figure~@bio\(d) demonstrates frequency modulation, where a neuron
produces a spike train whose frequency depends on the input amplitude.
When a constant input bias that is above the spike train firing
threshold is applied, the NMOS+MTJ neuron generates a continuous series
of spikes with a fixed period. The spike frequency changes at
$t = 11 med upright(n s)$ when the input bias amplitude is altered,
producing a shorter period between spikes. This behavior mirrors the
ability of biological neurons to encode stimulus strength in their
firing rate.

Figure~@bio\(e) shows neuronal adaptation, in which the excitability and
response latency of the neuron vary depending on its recent bias and
stimulus conditions. Adaptation is demonstrated here by applying two
identical input pulses at $t = 5 med upright(n s)$ and
$t = 15 med upright(n s)$, while increasing the bias voltage at
$t = 10 med upright(n s)$. Although the stimulus pulses are identical,
the neuron responds with different response latencies due to the change
in bias. Adaptation allows neurons to adjust responsiveness to ongoing
conditions, enabling more flexible and context-dependent signal
processing.

Together, the behaviors shown in Figures~@demo and @bio represent a
subset of biologically inspired dynamics that NMOS+MTJ neurons can
intrinsically reproduce using compact, CMOS-compatible circuitry. The
ability to capture these behaviors in circuit simulations without
complex control schemes underscores the potential of MTJ neurons as
fundamental building blocks for neuromorphic systems that combine
biological realism with practical hardware implementation.

= Interconnection of NMOS+MTJ Neurons
<synapsy>
Complex computation in both biological and artificial neural networks
requires neurons to be interconnected so that activity in one neuron can
influence others. In biological systems, these connections are formed by
synapses, which transmit signals between neurons and determine the
timing and strength of neural responses. An analogous mechanism is
needed in this system to enable information to flow through multiple
processing stages. The simulations in this section demonstrate that
synaptic connections can allow reliable spike propagation across
multiple stages, providing a foundation for scalable neuromorphic
circuits.

#figure(image("source/Fig4Chain.svg"),
  caption: [
    Signal propagation in a chain of NMOS+MTJ neurons with tunable
    synapses. (a) Diagram of a three-neuron chain, where circles
    represent neurons and arrows represent synapses. (b) Electrical
    schematic of the NMOS+MTJ neuron chain, with each synapse
    implemented as a tunable voltage amplifier. (c) Output voltage
    waveforms from neuron~1 (orange), neuron~2 (blue), and neuron~3
    (green). (d) Corresponding synapse outputs, showing the amplifier
    signals at their respective applied synaptic weights. (e) Response
    latency as a function of synaptic weight, where synaptic weight is
    expressed as an absolute value.
  ]
)
<network>

Figure~@network\(a) depicts a chain of three neurons, represented by
circles, interconnected by two synapses, represented by arrows. In the
physical implementation, each neuron is an NMOS+MTJ pair, as described
in the previous section. The synapses are implemented as tunable voltage
amplifiers that relay signals from one neuron to the next.
Figure~@network\(b) shows the corresponding electrical circuit schematic
for this neuron-synapse chain, where the triangular symbols represent
generic amplifiers.

The circuit was simulated in LTspice using neurons with the same
parameters described in Section~@sectmtjnmos. Results are shown in
Figures~@network\(c) and~@network\(d). Neuron~1, activated by an
external input pulse, produces a spike at approximately
$t = 3 med upright(n s)$, shown in orange in Figure~@network\(c). This
spike passes through synapse~I, which removes the DC offset and
amplifies the signal by $- 4 med upright(V) \/ upright(V)$. The
amplified output, shown in orange in Figure~@network\(d), drives
neuron~2, which spikes after a $2 med upright(n s)$ latency. This output
passes through synapse~II, amplified by
$- 5.0 med upright(V) \/ upright(V)$, and drives neuron~3 after a
$1 med upright(n s)$ latency. The spike from neuron~3, shown in green in
Figure~@network\(c), is amplified by $- 1 med upright(V) \/ upright(V)$,
producing the green waveform in Figure~@network\(d). In this hardware
implementation, synaptic weight is set by the amplifier gain, with
larger gains producing stronger connections and shorter latencies, as
seen in the $2 med upright(n s)$ latency of neuron~2 (blue) compared to
the $1 med upright(n s)$ latency of neuron~3 (green).

This simulation demonstrates that NMOS+MTJ neurons can propagate spiking
signals across multiple stages, with the output from each neuron
effectively triggering the next. The successful transmission of spikes
through a chain of connected neurons confirms that these circuits can
exhibit both individual neuron-like behavior and coordinated network
dynamics. This capability forms a foundation for scalable neuromorphic
hardware, where signals propagate through successive processing stages
that transform and relay information, analogous to biological neural
networks.

Figure~@network\(e) shows how the synaptic weight, expressed as an
absolute value, influences the response latency of the NMOS+MTJ neuron
configuration. Synaptic weights below approximately
$4 med upright(V) \/ upright(V)$ produce a rapid increase in response
latency, approaching a maximum of about $4.5 med upright(n s)$. In
contrast, synaptic weights greater than $6 med upright(V) \/ upright(V)$
result in shorter latencies that converge toward a lower bound of about
$0.5 med upright(n s)$. These results suggest that, for the NMOS+MTJ
neuron system described in this work, inter-neuron delays should
typically fall between $1$ and $2 med upright(n s)$, with synaptic
weights in the practical range of $4$ to
$6 med upright(V) \/ upright(V)$. In this implementation, the synaptic
weight is set by the voltage gain of the amplifier that connects two
neurons. In the simulations that follow, the synaptic circuits are
assumed to support a maximum gain of $10 med upright(V) \/ upright(V)$.

Simulations of synapses were implemented with ideal voltage amplifiers.
However, CMOS-compatible designs with practical gain values ranging from
$0$ to $10 med upright(V) \/ upright(V)$ can be achieved using compact
circuit topologies. Incorporating such practical synapse designs will
allow the NMOS+MTJ neuron architecture demonstrated here to be realized
in complete hardware-based neuromorphic systems.

= Machine learning with physical neural network with NMOS+MTJ neurons
<sectxor>
The preceding sections established that NMOS+MTJ neurons reproduce a
wide range of biologically inspired behaviors and can reliably propagate
spikes through analog synaptic connections. These results confirm that
the NMOS+MTJ pair functions not only as a compact spiking element but
also as a scalable building block for constructing larger neuromorphic
circuits. We now extend this framework from individual neurons and short
chains to a complete trainable spiking neural network composed entirely
of NMOS+MTJ neurons and CMOS analog synapses. In this architecture, each
neuron operates in a single-fire regime, producing at most one spike per
input pattern; this timing-based representation makes the neuron's
firing time differentiable with respect to synaptic weights, enabling
gradient-descent learning directly in the analog domain without
surrogate gradients or backpropagation-through-time. This section
presents the network design, the analog signal-flow implementation, and
the supervised learning mechanism used to achieve on-chip training.

To evaluate the learning capability of the NMOS+MTJ network, we apply it
to the two-input XOR classification task, a widely used, simple
nonlinear benchmark in both neuromorphic computing and machine learning
because it cannot be solved by a single-layer perceptron. Successful
learning of XOR demonstrates that the hardware supports nonlinear
activation, multilayer processing, and stable weight adaptation, all
essential for practical supervised learning in neuromorphic systems. The
following subsections describe the network structure, the timing-based
gradient-descent rule, and LTspice simulation results showing that the
NMOS+MTJ architecture can learn the XOR mapping entirely through analog
circuitry.

#figure(image("source/Fig5Plan.svg"),
  caption: [
    Architecture of the NMOS+MTJ neural network for XOR classification.
    (a) Network diagram with encoding neurons ($A$, $B$), input-layer
    neurons ($i_1$, $i_2$), and output neuron ($o_1$), and synaptic
    weights. (b) XOR truth table with bias input and target output for
    each input combination.
  ]
)
<xor>

Figure~@xor\(a) shows the neural network architecture used for the XOR
task. The network consists of an input layer with two neurons, $i_1$ and
$i_2$, and an output layer with a single neuron, $o_1$. This
configuration represents the minimal structure required to solve the XOR
problem, which is not linearly separable. The use of multiple layers,
nonlinear spiking behavior, and adjustable synaptic weights enables the
network to represent the nonlinear decision boundaries needed for
correct classification.

Figure~@xor\(b) presents the truth table for the two-input XOR gate. The
table lists two primary inputs, $A$ and $B$, along with a constant bias
input that is fixed at one. For each input combination, the
corresponding target output is also specified. These input-output pairs
define the desired behavior that the neural network is trained to learn
and reproduce.

In addition to the primary network layers, external encoding neurons are
used to generate the spike patterns that drive the network during both
inference and training. The system includes six such encoding neurons
that operate independently from the neurons within the main layers.
Neurons $A$ and $B$, shown in Figure~@xor\(a), encode the XOR truth
table inputs as spike waveforms. Three additional neurons,
$b i a s_(i 1)$, $b i a s_(i 2)$, and $b i a s_(o 1)$, provide constant
bias spikes at times chosen specifically for neurons $i_1$, $i_2$, and
$o_1$, respectively. A sixth encoding neuron, named $g$, produces a
timed spike that represents the desired output during training and
serves as the temporal reference signal for learning. Together, these
bias and reference spikes implement time encoding within the network,
enabling the NMOS+MTJ neural architecture to represent and process
information through precise spike timing.

In the network, neurons communicate through synapses, which are
represented by arrows in the diagrams and implemented as voltage
amplifiers in the LTspice simulations, as was demonstrated in section
@synapsy. The names of the synapses are labeled in Figure~@xor\(a).
Because the neurons operate with voltage signals, multiple incoming
signals must be combined before reaching the gate of each NMOS+MTJ
neuron. This combining function is performed by signal adders. For
example, neuron $i_1$ receives inputs from three separate sources: $A$,
$B$, and $b i a s_(i 1)$. In the LTspice simulation, these inputs are
summed using an ideal voltage adder, while practical hardware
implementations could employ a standard CMOS summing circuit. The summed
signal is then applied to the gate of the NMOS+MTJ neuron, where it
controls the drain current and thereby influences whether the neuron
produces a spike.

The network uses a fully connected feedforward architecture, where
signals move in one direction from the encoding layer to the input layer
and then from the input layer to the output layer. As shown in
Figure~@xor\(a), encoding neurons $A$ and $B$ are connected to both
input-layer neurons $i_1$ and $i_2$. Each input-layer neuron is
connected to the output-layer neuron $o_1$. In addition, each of the
three bias neurons connects to its corresponding target neuron to
provide a constant bias input.

#figure(image("source/Fig6Results.svg"),
  caption: [
    Encoding, inference, and training results for the NMOS+MTJ neural
    network. (a) Bias spike signals for neurons $i_1$ and $i_2$ (black)
    and neuron $o_1$ (gray). (b--c) Spike encoding for inputs $A$
    (orange) and $B$ (blue) across the four XOR input conditions:
    $\( 0 \, 0 \)$, $\( 0 \, 1 \)$, $\( 1 \, 0 \)$, and $\( 1 \, 1 \)$.
    (d) Before training, output spikes from neuron $o_1$ (purple) do not
    align with target spikes from neuron $g$ (green). (e--g) Evolution
    of individual synaptic weights over training epochs, showing
    convergence by approximately epoch~16. (h) Loss function over
    training epochs, with a sharp drop around epoch~16 indicating
    successful learning. (i) After training, output spikes from neuron
    $o_1$ (purple) align with target spikes from neuron $g$ (green).
  ]
)
<xorcycle>

Inference for the XOR truth table is performed by sequentially
presenting input spikes, with each row encoded at $10 med upright(n s)$
intervals. A full inference cycle, or epoch, takes approximately
$40 med upright(n s)$, corresponding to the four rows of the XOR truth
table. Figures~@xorcycle\(a) through @xorcycle\(c) illustrate how each
row of the truth table is encoded. Figure~@xorcycle\(a) shows the spikes
from the bias neurons $b i a s_(i 1)$ and $b i a s_(i 2)$, plotted in
gray, occurring at $t = 10$, $20$, $30$, and $40 med upright(n s)$, once
for each truth table row. The bias neuron $b i a s_(o 1)$, plotted in
black, fires $1 med upright(n s)$ later than $b i a s_(i 1)$ and
$b i a s_(i 2)$ because it is located in the downstream output layer.

Figures~@xorcycle\(b) and @xorcycle\(c) show the spikes generated by
neurons $A$ and $B$ for each row of the XOR truth table. At
$t = 10 med upright(n s)$, corresponding to inputs $A = 0$ and $B = 0$,
neither neuron $A$ nor neuron $B$ fires, and only the bias neurons
produce spikes. At $t = 20 med upright(n s)$, corresponding to inputs
$A = 0$ and $B = 1$, neuron $B$ fires together with the bias neurons. At
$t = 30 med upright(n s)$, corresponding to inputs $A = 1$ and $B = 0$,
neuron $A$ fires together with the bias neurons. At
$t = 40 med upright(n s)$, corresponding to inputs $A = 1$ and $B = 1$,
both neuron $A$ and neuron $B$ fire together with the bias neurons.

Figure~@xorcycle\(d) shows the output response of the neural network
before training. The expected spike times, referred to as the "goal"
times, are shown in green and are generated by neuron $g$. In the XOR
encoding scheme used here, a spike occurring $2.0 med upright(n s)$
after the bias input represents a logical zero, while a spike occurring
$2.5 med upright(n s)$ after the bias input represents a logical one.
The actual output spikes from neuron $o_1$ are shown in purple and
result from the propagation of the encoded input signals through the
network. Before training, all synaptic weights were initialized to
random values between $3$ and $6 med upright(V) \/ upright(V)$, with the
exception of the bias weights, which were set to zero. As shown in
Figure~@xorcycle\(d), the untrained network fails to produce a spike for
the first input condition, and the spikes generated for the remaining
cases occur at incorrect times. This mismatch between the output and the
goal times demonstrates the need for training to align the network
behavior with the desired XOR function.

To achieve correct performance, the network must adjust the synaptic
weights so that the output neuron $o_1$ fires at the goal spike times,
expressed in nanoseconds, defined by the reference neuron $g$. This
alignment is achieved using a supervised learning strategy that follows
the general structure of feedforward operation and gradient-based error
backpropagation #link(<ref:kheradpisheh2020temporal>)[\[55\]], but with modifications
tailored to our analog architecture. Each synaptic weight is denoted by
$w_(k \, j)$, where $j$ is the presynaptic (upstream) neuron and $k$ is
the postsynaptic (downstream) neuron. The update to each weight,
$Delta w_(k \, j)$, follows the rule
$ Delta w_(k j) = - eta frac(d L, d t_k) frac(partial t_k, partial w_(k \, j)) $<upsy>
where $eta$ is the learning rate, $L$ is the loss function, and $t_j$ is
the firing time of the presynaptic neuron. The loss function is defined
as
$ L = 1 / 2 \( t_(upright(a c t u a l)) - t_(upright(d e s i r e d)) \)^2 $
with $t_(upright("actual"))$ representing the firing time of neuron
$o_1$ and $t_(upright("desired"))$ the target spike time specified by
neuron $g$. The derivative of the loss function with respect to firing
time is
$ frac(d L, d t_j) = frac(partial L, partial t_j) + sum_(k < j) frac(d L, d t_k) dot.op frac(partial t_k, partial t_j) $
which accounts for both direct and indirect timing dependencies within
the network.

Completing the gradient update in (@upsy) requires evaluating the terms
$partial t_k \/ partial w_(k \, j)$ and $partial t_k \/ partial t_j$,
which quantify how the firing time of the postsynaptic neuron changes in
response to variations in the synaptic weight or the spike time of the
presynaptic neuron, respectively. In this work, these derivatives are
approximated as
$ frac(partial t_k, partial w_(k \, j)) = u \( t_k - t_j \) $
$ frac(partial t_k, partial t_j) = w_(k \, j) thin u \( t_k - t_j \) $
where $u \( med \)$ is the unit step function, which enforces causality
by ensuring that only presynaptic spikes occurring before the
postsynaptic spike can contribute to weight changes that advance or
delay the postsynaptic firing time. Additional details on how the
gradient descent learning rule was implemented in analog form are
provided in Appendix~B.

The network was trained entirely in LTspice using repeated cycles of
inference, with each cycle followed by synaptic weight adjustment based
on the gradient descent learning rule described earlier. The four input
patterns of the XOR truth table, $\( 0 \, 0 \)$, $\( 0 \, 1 \)$,
$\( 1 \, 0 \)$, and $\( 1 \, 1 \)$, were applied sequentially during
each training epoch, giving a total epoch duration of
$40 med upright(n s)$. Each pattern occupied a fixed
$10 med upright(n s)$ interval. Within each interval, the network first
executed feedforward inference to generate a spike response at the
output neuron. Because the MTJ--NMOS neuron exhibits a typical response
latency of less than $5 med upright(n s)$, the remaining portion of the
interval between approximately $5$ and $10 med upright(n s)$ was
available for error evaluation and synaptic weight updates. The timing
error between the observed and target spike times was computed, and the
gradient descent rule was applied to adjust the synaptic weights. This
procedure was repeated for each input pattern in succession, completing
one full training epoch with four weight updates.

Figures~@xorcycle\(e)--@xorcycle\(g) show the evolution of individual
synaptic weights, which gradually converged toward stable values after
the fifteenth epoch. As shown in Figure~@xorcycle\(h), the loss function
remained high during the early epochs, dropped sharply after epoch 15,
and approached zero thereafter, indicating successful alignment between
the network output and the target spike times. The weight convergence
and loss minimization are consistent with the MTJ--NMOS neural network
having learned the XOR mapping in the simulated hardware environment.

Once the network converges, the output spikes from neuron $o_1$ align
with the target spikes from neuron $g$ for all input conditions. This
alignment is illustrated for epoch 22 occurring at approximately
$t = 900 med upright(n s)$ in Figure~@xorcycle\(i). The figure shows
that the output spikes from the neural network (purple) match closely
with the spikes from neuron $g$ (green), confirming that the network
successfully learned the XOR function.

It is important to note that the entire training process for the XOR
classification task was performed within the LTspice simulation
environment using only analog circuitry. Both the neuron dynamics and
the learning algorithm, including gradient descent and
spike-timing-based weight updates, were implemented using analog circuit
components without external data processing. This demonstrates that
machine learning for a nonlinear classification problem can be performed
entirely in the analog domain using time-encoded spike signals and
analog hardware, providing a proof of concept for fully hardware-based
supervised learning.

By demonstrating end-to-end supervised learning entirely in the analog
domain, this work provides a proof-of-principle for a CMOS+X
implementation that combines training and inference within a single
hardware platform suitable for semiconductor manufacturing. The NMOS+MTJ
neuron used in this work illustrates this concept by integrating an
MRAM-derived 1T-1MTJ structure with dynamic operation, showing the
potential for in-memory AI neuromorphic computing in edge machine
learning applications where battery and processing limits require
scalable, energy-efficient hardware.

The network learned the XOR function through continuous cycles of spike
generation, inference, error evaluation, and synaptic weight adjustment,
all governed by voltage-based interactions in the simulated circuit. The
total simulated training time was approximately $1 med mu upright(s)$,
and the complete LTspice simulation can be completed in about $15$
seconds on a conventional laptop. These results provide a concrete
example of real-time, hardware-trainable neuromorphic computation using
spintronic devices and analog electronics, demonstrating the feasibility
of integrated learning within a purely analog domain. Overall, the
simulation results confirm that the NMOS+MTJ neural network can perform
supervised learning entirely within an analog hardware framework. Using
gradient-based spike-timing-dependent weight updates, the network
successfully learned the two-input XOR mapping, with output spike times
converging to the desired targets for all input conditions. The
implementation in LTspice shows that both inference and training can be
achieved through voltage-based interactions in spintronic-CMOS circuits,
without digital computation or external data processing. This capability
confirms that the NMOS+MTJ neuron architecture can support
hardware-trainable neuromorphic systems for nonlinear classification.

= Conclusion
<conclusion>
This work has presented the design, simulation, and evaluation of a
NMOS+MTJ neuron architecture capable of reproducing multiple
biologically inspired behaviors and supporting machine learning through
gradient-based weight adaptation. Starting from the demonstration of
single-neuron properties such as threshold activation, spike generation,
response latency, and synaptic integration, the study progressed to
multi-neuron configurations that successfully propagated spike signals
through tunable synapses. Extending these capabilities, a three-layer
NMOS+MTJ neural network was constructed in LTspice and trained to
perform the two-input XOR task, achieving convergence entirely within an
analog hardware framework. Both neuron dynamics and the learning
algorithm were implemented using analog components without digital
computation, showing that time-encoded spike signals and analog
circuitry can support fully integrated inference and learning. The
results highlight the potential of NMOS+MTJ neurons as scalable building
blocks for neuromorphic systems, bridging nanoscale spintronic devices
with CMOS-compatible analog electronics. Future work will focus on
experimental validation, optimization for energy efficiency, and
extension to larger, more complex networks, paving the way toward
practical hardware neuromorphic processors.

#heading(level: 1, numbering: none)[Acknowledgments]
<acknowledgments>
I.N.K., M.B.A., and G.D.N. acknowledge partial support from the National
Science Foundation via awards ECCS-2213690 and DMREF-2324203 as well as
from the University of California National Laboratory Fees Research
Program.

#heading(level: 1, numbering: none)[Appendix A: Simulation Model and
Parameters]
<appendix-a-simulation-model-and-parameters>
Accurate simulation of the NMOS+MTJ neuron in a standard electrical
circuit simulator is important for validating device behavior, exploring
circuit-level interactions, and ensuring compatibility with conventional
CMOS circuitry. MTJs can be simulated by a compact equivalent circuit
models, as in Figures~1(b) and~1(c) of~#link(<ref:phyBased>)[\[22\]]. These models allow the
magnetization dynamics of the MTJ free layer to be solved alongside
electronic circuit elements in a unified SPICE environment, enabling
both device-level and system-level analysis.

In this work, we extend the two-ferromagnetic-layer MTJ model
of~#link(<ref:phyBased>)[\[22\]] to represent an MTJ with three ferromagnetic layers, as
depicted in Figure~@toon\(a). The corresponding electrical equivalent,
shown in Figure~@spice\(a), models the total MTJ resistance as two
intrinsic magnetoresistive elements connected in series:
$ R_(upright(M T J)) \( phi.alt \) = R_(p 1) \( phi.alt \) + R_(p 2) \( phi.alt \) \, $<allRs>
where $R_(p 1) \( phi.alt \)$ represents the resistance from
$upright(bold(p))_1$ and $upright(bold(m))$, while
$R_(p 2) \( phi.alt \)$ represents the resistance from
$upright(bold(p))_2$ and $upright(bold(m))$.

Both $R_(p 1) \( phi.alt \)$ and $R_(p 2) \( phi.alt \)$ vary explicitly
with the free layer magnetization angle $phi.alt$, making accurate
determination of $phi.alt$ important to reproducing the MTJ response.
The magnetization orientation is obtained by solving the spin-circuit
model shown in Figure~@spice\(b), which calculates $upright(bold(m))$
from the charge current $I_C$ and voltage $V_L$. This spin-circuit is
adapted from~#link(<ref:phyBased>)[\[22\]] and includes additional dependent sources to
capture the behavior of the extended three-layer structure.

#figure(image("source/Fig7Spice.svg"),
  caption: [
    Circuit models for the MTJ. (a) Equivalent circuit model of the
    three-layer MTJ, represented as two intrinsic magnetoresistors in
    series: $R_(p 1) \( phi.alt \)$ for the reference and free layers,
    and $R_(p 2) \( phi.alt \)$ for the analyzer and free layers. (b)
    Spin-circuit representation used to determine the free layer
    magnetization orientation $upright(bold(m))$ from the calculated
    charge current $I_C$ and voltage $V_L$. The spin-circuit is based
    on~#link(<ref:phyBased>)[\[22\]] with additional dependent sources.
  ]
)
<spice>

All modeling elements were implemented in LTspice, enabling the MTJ to
be simulated alongside CMOS-compatible electronic components such as
NMOS transistors, voltage sources, and amplifiers. The NMOS transistor
is taken from the default LTspice component library, and is connected in
series with the MTJ to form the neuron core. The positive supply voltage
$V_(upright(D D))$ is fixed at $5.0 med upright(V)$ and serves as the
drain supply for the NMOS. A complete LTspice package containing the
model files, simulation examples, and usage documentation is available
in the MTJ Spice Models~\[2026\].

The simulation parameters are summarized in Table~@params. The MTJ free
layer is modeled as an ellipse with semiaxes of $30 med upright(n m)$
and $20 med upright(n m)$, and a thickness of $3 med upright(n m)$.
Interface resistances for the parallel ($R_(upright(P))$) and
antiparallel ($R_(upright(A P))$) states are specified independently for
both the reference-free and analyzer-free layer pairs. The polar angle
$theta$ and azimuthal angle $phi$ define the orientation of each
magnetic layer.

#figure(
  align(center)[#table(
    columns: 2,
    align: (left,left,),
    table.header([#strong[Parameter]], [#strong[Value]],),
    table.hline(),
    [Free layer volume ($upright(m^3)$)], [$5.65487 times 10^(- 24)$],
    [Saturation magnetization $M_s$ (A/m)], [$795775$],
    [Gyromagnetic ratio $gamma$ (GHz/T)], [$2 pi 28$],
    [Gilbert damping $alpha_G$], [$0.1$],
    [External field $B_e$ (mT)], [$5.3$],
    [Demagnetizing field $B_d$, (T)], [1],
    [Anisotropy field $B_a$ (T)], [$0$],
    [Analyzer layer orientation
    $\( theta \, med phi \)$], [$\( pi \/ 2 \, med pi \/ 2 \)$],
    [Reference layer orientation
    $\( theta \, med phi \)$], [$\( 0 \, med 0 \)$],
    [Free layer initial orientation
    $\( theta \, med phi \)$], [$\( pi \/ 2 \, med 0 \)$],
    [Analyzer-free layer resistances
    $R_(upright(P \, p 1)) \, R_(upright(A P \, p 1))$
    ($Omega$)], [$500 \, med 1500$],
    [Reference-free layer resistances
    $R_(upright(P \, p 2)) \, R_(upright(A P \, p 2))$
    ($Omega$)], [$0.5 \, med 1.5$],
    [Drain supply $V_(upright(D D))$ (V)], [$5.0$],
  )]
  , caption: [MTJ--NMOS neuron model simulation parameters.]
  , kind: table
  )

<params>
#heading(level: 1, numbering: none)[Appendix B: Analog Realization of
Gradient-Descent Learning]
<appendix-b-analog-realization-of-gradient-descent-learning>
In the main text, the gradient descent learning algorithm was
implemented entirely within the LTspice simulation environment using
analog circuit components. Section~@sectxor presented the derivation of
the learning rule, beginning with the loss function and its derivatives,
and showed how spike timing differences drive synaptic weight updates in
the NMOS+MTJ neural network. This appendix provides details about
performing these operations in hardware.

The learning rule in Section~@sectxor was expressed in general form
using gradient descent with spike-timing-dependent derivatives. Here, we
restate the explicit implementation used in our LTspice simulations.
These equations apply to all synapses in the network, including bias
connections. The complete set of update equations is
$ Delta w_(o 1 i 1) & = eta d_o u \( t_(o 1) - t_(i 1) \) \,\
Delta w_(o 1 i 2) & = eta d_o u \( t_(o 1) - t_(i 2) \) \,\
Delta w_(i 1 A) & = eta d_o w_(o 1 \, i 1) a \( t \) u \( t_(o 1) - t_(i 1) \) \,\
Delta w_(i 1 B) & = eta d_o w_(o 1 \, i 1) b \( t \) u \( t_(o 1) - t_(i 2) \) \,\
Delta w_(i 2 A) & = eta d_o w_(o 1 \, i 2) a \( t \) u \( t_(o 1) - t_(i 1) \) \,\
Delta w_(i 2 B) & = eta d_o w_(o 1 \, i 2) b \( t \) u \( t_(o 1) - t_(i 2) \) \,\
Delta w_(upright(b i a s)_(o 1)) & = eta d_o \,\
Delta w_(upright(b i a s)_(i 1)) & = eta d_o w_(o 1 i 1) \,\
Delta w_(upright(b i a s)_(i 2)) & = eta d_o w_(o 1 i 2) . $<explic>
Here, $d_o = t_(upright(a c t u a l)) - t_(upright(d e s i r e d))$ is
the time difference between the spike from output neuron $o_1$ and the
target spike from reference neuron $g$. The functions $a \( t \)$ and
$b \( t \)$ represent the binary inputs '0' and '1' for $A$ and $B$ in
the truth table.

From (@explic), it follows that only three functional blocks are
required to implement the weight update rule in hardware: (i) an analog
register to store the synaptic weight, (ii) subtraction to compute $d_o$
and other spike timing differences, and (iii) multiplication to
calculate the weight changes. These three operations form the minimal
set needed for a physical realization of the learning algorithm. In the
simulations presented here, they were implemented using behavioral
sources and behavioral analog registers in LTspice to verify functional
correctness, as a proof-of-principle.

Although behavioral models were used for expedience in simulation, each
function can be realized using practical CMOS-compatible analog
circuitry. The gain values that define the synaptic weights could be
stored in an analog register implemented with a capacitor to hold a
voltage. These stored voltages would directly control the tunable
amplifiers that implement the synapses, ensuring that each amplifier
maintains its programmed gain between training updates. Spike timing
detection could be achieved entirely in the analog domain using
monostable circuits or pulse-width measurement blocks that generate a
voltage proportional to the time interval between two events. In this
application, such a circuit would measure the time difference between
pre-synaptic and post-synaptic spikes directly as an analog voltage,
providing the $d_o$ term in (@explic) without any conversion to the
digital domain. Multiplication could be performed with a simple analog
scheme, such as a single-quadrant multiplier using a MOSFET in the
triode region, where the drain current is proportional to the product of
two input voltages. This approach would complete the weight update
computation while remaining compatible with standard CMOS processes.
These examples are presented as illustrative pathways for eventual
hardware implementation and are consistent with the proof-of-principle
nature of this work, in which the emphasis is on demonstrating
functional feasibility rather than delivering a fabrication-ready
design.

#heading(numbering: none)[References]

#block[\[1\] E.~Li, L.~Zeng, Z.~Zhou, and X.~Chen, "Edge AI: On-demand accelerating
deep neural network inference via edge computing," #emph[IEEE Trans.
Wireless Commun.], vol.~19, no.~1, pp. 447--457, 2020.] <ref:li2019edge>

#block[\[2\] N.~P. Jouppi, C.~Young, N.~Patil, D.~Patterson, G.~Agrawal, R.~Bajwa,
S.~Bates, #emph[et~al.], "In-datacenter performance analysis of a tensor
processing unit," in #emph[Proc. 44th Annu. Int. Symp. Comput. Archit.
(ISCA)], 2017, pp. 1--12.] <ref:jouppi2017datacenter>

#block[\[3\] W.~Maass, "Networks of spiking neurons: the third generation of neural
network models," #emph[Neural Netw.], vol.~10, no.~9, pp. 1659--1671,
\1997.] <ref:maass1997networks>

#block[\[4\] M.~Davies, N.~Srinivasa, T.-H. Lin, G.~Chinya, Y.~Cao, S.~H. Choday,
#emph[et~al.], "Loihi: A neuromorphic manycore processor with on-chip
learning," #emph[IEEE Micro], vol.~38, no.~1, pp. 82--99, 2018.] <ref:davies2018loihi>

#block[\[5\] D. Markovi'c, A. Mizrahi, D. Querlioz, and J. Grollier, "Physics for
neuromorphic computing," #emph[Nat. Rev. Phys.], v. 2, no. 9, pp.
499-510, 2020.] <ref:markovic2020physics>

#block[\[6\] G.~Tang, K.~Vadivel, Y.~Xu, R.~Bilgic, K.~Shidqi, P.~Detterer, #emph[et
al.], "SENECA: building a fully digital neuromorphic processor, design
trade-offs and challenges," #emph[Front. Neurosci.], vol.~17,
p.~1187252, 2023.] <ref:tang2023seneca>

#block[\[7\] J.~Grollier, D.~Querlioz, and M.~D.~Stiles, "Spintronic nanodevices for
bioinspired computing," #emph[Proceedings of the IEEE], vol.~104,
no.~10, pp.~2024--2039, 2016.] <ref:grollier2016bioinspired>

#block[\[8\] G.~Finocchio, J.~Incorvia, J.~Friedman, Q. Yang, Qu, A. Giordano, J.
Grollier, #emph[et al.], "Roadmap for unconventional computing with
nanotechnology," #emph[Nano Futures], vol.~8, no.~1, p.~012001, 2024,
doi: 10.1088/2399-1984/ad299a.] <ref:finocchio2024roadmap>

#block[\[9\] J. Incorvia, P. Xiao, N. Zogbi, A. Naeemi, C. Adelmann, F. Catthoor,
#emph[et al.], "Spintronics for achieving system-level energy-efficient
logic," #emph[Nat Rev Electr Eng], vol. 1, no. 11, pp. 700-713, Oct.
2024, doi: 10.1038/s44287-024-00103-z.] <ref:Incorvia>

#block[\[10\] G.~Indiveri and S.~Liu, "Memory and information processing in
neuromorphic systems," #emph[Proc. IEEE], vol.~103, no.~8,
pp.~1379--1397, 2015.] <ref:indiveri2015memory>

#block[\[11\] National Science Foundation, "Partnership for Prototyping of CMOS+X
Systems," #emph[Dear Colleague Letter NSF-22-076], Apr. 22, 2022.
\[Online\]. Available:
https:\/\/www.nsf.gov/funding/opportunities/dcl-partnership-prototyping-cmosx-systems.] <ref:nsf2022cmosx>

#block[\[12\] C. Chappert, A. Fert, and F. N. Van Dau, "The emergence of spin
electronics in data storage," #emph[Nature Mater], vol. 6, no. 11, pp.
813-823, 2007, doi: 10.1038/nmat2024.] <ref:chappert>

#block[\[13\] J. G. Alzate, P. K. Amiri, and K. L. Wang, "Magnetic Tunnel Junctions
and Their Applications in Non-volatile Circuits," #emph[Handbook of
Spintronics. Springer Netherlands], pp. 1127-1171, 2016.] <ref:alzate>

#block[\[14\] D.~Edelstein, M.~Rizzolo, D.~Sil, A.~Dutta, J.~DeBrosse, M.~Wordeman,
#emph[et al.], "A 14 nm embedded STT-MRAM CMOS technology," in
#emph[Proc. IEEE Int. Electron Devices Meeting (IEDM)], 2020, pp.~11--5.] <ref:edelstein>

#block[\[15\] Everspin Technologies, Inc., "Everspin Technologies," Accessed: Aug. 11,
\2025. \[Online\]. Available: #link("https://www.everspin.com/")] <ref:everspin>

#block[\[16\] J. Z. Sun and D. C. Ralph, "Magnetoresistance and spin-transfer torque
in magnetic tunnel junctions," #emph[Journal of Magnetism and Magnetic
Materials], vol. 320, no. 7, pp. 1227-1237, Apr. 2008.

‌S. Louis, H. Bradley, C. Trevillian, A. Slavin, and V. Tyberkevych,
"Spintronic Neuron Using a Magnetic Tunnel Junction for Low-Power
Neuromorphic Computing," #emph[IEEE Magn. Lett.], vol. 15, pp. 1-5,
\2024.] <ref:sun>

#block[\[17\] S. Louis, H. Bradley, C. Trevillian, A. Slavin, and V. Tyberkevych,
"Spintronic Neuron Using a Magnetic Tunnel Junction for Low-Power
Neuromorphic Computing," #emph[IEEE Magn. Lett.], vol. 15, pp. 1-5,
2024.] <ref:mtjneuron>

#block[\[18\] R.~Salinas, P.~Chen, C.~Yang, and C.~Lai, "Spintronic materials and
devices towards an artificial neural network: accomplishments and the
last mile," #emph[Materials Research Letters], v.11, no.5, 305--326,
\2023.] <ref:salinas2023lastmile>

#block[\[19\] A.~V.~Chumak, P.~Kabos, M.~Wu, C.~Abert, C.~Adelmann, A.~O.~Adeyeye,
#emph[et al.], "Advances in magnetics roadmap on spin-wave computing,"
#emph[IEEE Trans. Magn.], vol.~58, no.~6, pp.~1--72, 2022.] <ref:chumak2022roadmap>

#block[\[20\] S. Jiang, L. Yao, S. Wang, D. Wang, L. Liu, A. Kumar, #emph[et al.],
"Spin-torque nano-oscillators and their applications," #emph[Appl. Phys.
Rev.], vol. 11, no. 4, 2024.] <ref:jiang2024spin>

#block[\[21\] C.~J.~Lin, S.~H.~Kang, Y.~J.~Wang, K.~Lee, X.~Zhu, W.~C.~Chen, #emph[et
al.], "45nm low power CMOS logic compatible embedded STT MRAM utilizing
a reverse-connection 1T/1MTJ cell," in #emph[Proc. IEEE Int. Electron
Devices Meeting (IEDM)], pp.~1-4, 2009.] <ref:Lin2009>

#block[\[22\] S. Louis, H. Bradley, A. Litvinenko, and V. Tyberkevych, "A
Physics-Based Circuit Model for Magnetic Tunnel Junctions," #emph[IEEE
Magn. Lett.], vol. 16, pp. 1-5, 2025, doi: 10.1109/lmag.2025.3577475.] <ref:phyBased>

#block[\[23\] J. C. Slonczewski, "Conductance and exchange coupling of two
ferromagnets separated by a tunneling barrier," #emph[Phys. Rev. B],
vol.39, no. 10, pp. 6995-7002, Apr. 1989.] <ref:slon1>

#block[\[24\] J. C. Slonczewski and J. Z. Sun, "Theory of voltage-driven current and
torque in magnetic tunnel junctions," #emph[Journal of Magnetism and
Magnetic Materials], vol. 310, no. 2, pp. 169-175, Mar. 2007.] <ref:slon2>

#block[\[25\] I.~N.~Krivorotov, N.~C.~Emley, R.~A.~Buhrman, and D.~C.~Ralph,
"Time-domain studies of very-large-angle magnetization dynamics excited
by spin transfer torques," #emph[Phys. Rev. B], vol.~77, no.~5,
p.~054440, Feb.~2008.] <ref:krivorotov2008time>

#block[\[26\] D.~Worledge, G.~Hu, D.~Abraham, J.~Sun, P.~Trouilloud, J.~Nowak,
#emph[et al.], "Spin torque switching of perpendicular TaCoFeBMgO-based
magnetic tunnel junctions," #emph[Appl. Phys. Lett.], vol.~98, no.~2,
p.~022501, 2011.] <ref:worledge>

#block[\[27\] S.~Bhatti, R.~Sbiaa, A.~Hirohata, H.~Ohno, S.~Fukami, and
S.~N.~Piramanayagam, "Spintronics based random access memory: A review,"
#emph[Materials Today], vol.~20, no.~9, pp.~530--548, 2017.] <ref:Bhatti2017>

#block[\[28\] V.~D.~Nguyen, S.~Rao, K.~Wostyn, and S.~Couet, "Recent progress in
spin-orbit torque magnetic random-access memory," #emph[npj
Spintronics], vol.~2, article~48, 2024.] <ref:Nguyen2024>

#block[\[29\] J.~Torrejon, M.~Riou, F.~A.~Araujo, S.~Tsunegi, G.~Khalsa, D.~Querlioz,
#emph[et al.], "Neuromorphic computing with nanoscale spintronic
oscillators," #emph[Nature], vol.~547, pp.~428--431, 2017.] <ref:torrejon2017>

#block[\[30\] M.~Riou, J.~Torrejon, B.~Garitaine, F.~Abreu~Araujo, P.~Bortolotti,
V.~Cros, #emph[et al.], "Temporal pattern recognition with
delayed-feedback spin-torque nano-oscillators," #emph[Phys. Rev. Appl.],
vol.~12, p.~024049, 2019.] <ref:riou2019>

#block[\[31\] M.~Romera, P.~Talatchian, S.~Tsunegi, F.~A.~Araujo, V.~Cros,
P.~Bortolotti, #emph[et al.], "Vowel recognition with four coupled
spin-torque nano-oscillators," #emph[Nature], vol.~563, pp.~230--234,
\2018.] <ref:romera2018>

#block[\[32\] P.~Zhou, A.~Edwards, F.~Mancoff, D.~Houssameddine, S.~Aggarwal, and
J.~Friedman, "Experimental demonstration of neuromorphic network with
STT-MTJ synapses," #emph[arXiv preprint arXiv:2112.04749], 2021.] <ref:Zhou2021>

#block[\[33\] J.~Kaiser, W.~Borders, K.~Camsari, S.~Fukami, H.~Ohno, and S.~Datta,
"Hardware-aware in situ learning based on stochastic magnetic tunnel
junctions," #emph[Phys. Rev. Appl.], vol.~17, no.~1, p.~014016,
Jan.~2022.] <ref:kaiser2022hardware>

#block[\[34\] J.~Goodwill, N.~Prasad, B.~Hoskins, M.~Daniels, A.~Madhavan, L.~Wan,
#emph[et al.], "Implementation of a binary neural network on a passive
array of magnetic tunnel junctions," #emph[Phys. Rev. Appl.], vol.~18,
no.~1, p.~014039, 2022.] <ref:Goodwill2022>

#block[\[35\] P.~Rzeszut, J.~Checinski, I.~Brzozowski, S.~Zietek, W.~Skowronski, and
T.~Stobiecki, "Multi-state MRAM cells for hardware neuromorphic
computing," #emph[Scientific Reports], vol.~12, article~7178, 2022.] <ref:Rzeszut2022>

#block[\[36\] D. You, Y.~Chiu, W.~Khwa, C.~Li, F.~Hsieh, Y.~Chien, #emph[et al.], "An
8b-precision 8-Mb STT-MRAM near-memory-compute macro using
weight-feature and input-sparsity aware schemes for energy-efficient
edge AI devices," #emph[IEEE Journal of Solid-State Circuits], vol.~59,
no.~1, pp.~219--230, 2023.] <ref:you20238b>

#block[\[37\] Y.~Lv, B.~Zink, R.~Bloom, H.~Cılasun, P.~Khanal, S.~Resch, #emph[et
al.], "Experimental demonstration of magnetic tunnel junction-based
computational random-access memory," #emph[npj Unconventional
Computing], vol.~1, article~3, 2024.] <ref:Lv2024>

#block[\[38\] K.~Kiseleva, D.~Cherkasov, G.~Kichin, V.~Antonov, and K.~Zvezdin,
"Influence of parameters of crossbars with STT-MRAM on the accuracy of
analog neural network," #emph[Bulletin of the Russian Academy of
Sciences: Physics], vol.~89, no.~5, pp.~774--779, 2025.] <ref:Kiseleva2025>

#block[\[39\] J.~Lee, J.~Song, H.~Im, J.~Kim, W.~Lee, W.~Yi, #emph[et al.], "A
scalable neural network emulator with MRAM-based mixed-signal circuits,"
#emph[Frontiers in Neuroscience], vol.~19, article~1599144, 2025.] <ref:Lee2025>

#block[\[40\] R.~Khymyn, I.~Lisenkov, J.~Voorheis, O.~Sulymenko, O.~Prokopenko,
V.~Tiberkevich, #emph[et al.], "Ultra-fast artificial neuron: generation
of picosecond-duration spikes in a current-driven antiferromagnetic
auto-oscillator," #emph[Sci. Rep.], vol.~8, no.~1, p.~15727, 2018.] <ref:Khymyn>

#block[\[41\] Y. Liu, I. Barsukov, Y. Barlas, I. N. Krivorotov, and R. K. Lake,
"Synthetic antiferromagnet-based spin Josephson oscillator,"
#emph[Applied Physics Letters], vol. 116, no. 13, Mar. 2020.] <ref:Liu>

#block[\[42\] A. Mitrofanova, A. Safin, O. Kravchenko, S. Nikitov, and A. Kirilyuk,
"Optically initialized and current-controlled logical element based on
antiferromagnetic-heavy metal heterostructures for neuromorphic
computing," #emph[Applied Physics Letters], vol. 120, no. 7, Feb. 2022.] <ref:Mitro>

#block[\[43\] R. V. Ovcharov, E. G. Galkina, B. A. Ivanov, and R. S. Khymyn, "Spin
Hall Nano-Oscillator Based on an Antiferromagnetic Domain Wall,"
#emph[Phys. Rev. Applied], vol. 18, no. 2, Aug. 2022.] <ref:Ovcha>

#block[\[44\] P. Crotty, D. Schult, and K. Segall, "Josephson junction simulation of
neurons," #emph[Phys. Rev. E], vol. 82, no. 1, July 2010.] <ref:Crotty2010>

#block[\[45\] M. L. Schneider, C. A. Donnelly, and S. E. Russek, "Tutorial: High-speed
low-power neuromorphic systems based on magnetic Josephson junctions,"
#emph[Journal of Applied Physics], vol. 124, no. 16, Oct. 2018.] <ref:Schneid>

#block[\[46\] D.~R.~Rodrigues, R.~Moukhader, Y.~Luo, B.~Fang, A.~Pontlevy, A.~Hamadeh,
Z.~Zeng, M.~Carpentieri, and G.~Finocchio, "Spintronic
Hodgkin--Huxley--analogue neuron implemented with a single magnetic
tunnel junction," #emph[Phys. Rev. Appl.], vol.~19, no.~6, p.~064010,
June 2023.] <ref:rodrigues2023spintronic>

#block[\[47\] L.~Zhang, Z.~Liu, Y.~Wang, S.~Liu, W.~Wang, B.~Fang, #emph[et al.],
"Spin torque induced dual type artificial neurons based on an in-plane
magnetic tunnel junction," #emph[Appl. Phys. Lett.], vol.~127, 202401,
\2025.] <ref:zhang2025dual>

#block[\[48\] H.~Bradley, S.~Louis, C.~Trevillian, L.~Quach, E.~Bankowski, A.~Slavin,
and V.~Tyberkevych, "Artificial neurons based on antiferromagnetic
auto-oscillators as a platform for neuromorphic computing," #emph[AIP
Advances], vol.~13, no.~1, 2023.] <ref:Bradley2023>

#block[\[49\] H.~Bradley, S.~Louis, A.~Slavin, and V.~Tyberkevych, "Pattern
recognition using spiking antiferromagnetic neurons," #emph[Scientific
Reports], vol.~14, no.~1, p.~22373, 2024.] <ref:Bradley2024>

#block[\[50\] I.~Sotnyk and O.~Prokopenko, "Antiferromagnetic programmable neuron:
structure, training, and pattern recognition applications,"
#emph[Authorea Preprints], 2025.] <ref:Sotnyk2025>

#block[\[51\] H. Bradley, L. Quach, S. Louis, and V. Tyberkevych, “Antiferromagnetic
artificial neuron modeling of the withdrawal reflex,” #emph[J Comput
Neurosci], vol. 52, no. 3, pp. 197-206, July 2024.] <ref:BradleyWithD>

#block[\[52\] Analog Devices, Inc., "LTspice simulator," Accessed: Mar. 14, 2025.
\[Online\]. Available:
https:\/\/www.analog.com/en/resources/design-tools-and-calculators/ltspice-simulator.html] <ref:ltspice>

#block[\[53\] M.~Levakova, M.~Tamborrino, S.~Ditlevsen, and P.~Lansky, "A review of
the methods for neuronal response latency estimation,"
#emph[Biosystems], vol.~136, pp. 23--34, 2015.] <ref:levakova2015review>

#block[\[54\] W.~Gerstner and W.~M. Kistler, "Spiking Neuron Models: Single Neurons,
Populations, Plasticity." #emph[Cambridge University Press], 2002.] <ref:gerstner2002spiking>

#block[\[55\] S.~R. Kheradpisheh and T.~Masquelier, "Temporal backpropagation for
spiking neural networks with one spike per neuron," #emph[Int. J. Neural
Syst.], vol.~30, no.~6, p. 2050027, 2020.] <ref:kheradpisheh2020temporal>
