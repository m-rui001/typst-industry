// Typst format conversion of arXiv:2512.11176v1. Original text and figures: CC BY-NC-ND 4.0.
#set page(paper: "a4", margin: 22mm, numbering: "1")
#set text(font: "Libertinus Serif", size: 10.5pt)
#set par(justify: true)
#align(center)[
  #text(size: 16pt, weight: "bold")[Gate-controlled analog memcapacitance in LaAlO#sub[3]/SrTiO#sub[3] interface-based devices]
  #v(5pt)
  Soumen Pradhan#super[1], Victor Lopez-Richard#super[2], Igor Ricardo Filgueira e Silva#super[2], Fabian Hartmann#super[1], Ana Luiza Costa Silva#super[2], Leonardo K. Castelano#super[2], Merit Spring#super[1], Silke Kuhn#super[1], Michael Sing#super[1], Ralph Claessen#super[1], and Sven Höfling#super[1]

  #super[1] Julius-Maximilians-Universität Würzburg, Physikalisches Institut and Würzburg-Dresden Cluster of Excellence ct.qmat, Am Hubland, 97074 Würzburg, Deutschland

  #super[2] Department of Physics, Federal University of São Carlos, 13565-905 São Carlos, SP, Brazil

  #link("mailto:soumen.pradhan@uni-wuerzburg.de") · #link("mailto:fabian.hartmann@uni-wuerzburg.de")

  #link("https://arxiv.org/abs/2512.11176v1")[arXiv:2512.11176v1] · #link("https://creativecommons.org/licenses/by-nc-nd/4.0/")[CC BY-NC-ND 4.0]
]

*Abstract.* Current memcapacitor implementations typically demand complex
fabrication processes or depend on organic materials exhibiting poor
environmental stability and reproducibility. Here, we demonstrate
memcapacitor structures utilizing a quasi 2-dimensional electron gas,
formed at the crystalline LaAlO$""_3$/SrTiO$""_3$ heterointerface, as
electrodes and SiO$""_2$/SrTiO$""_3$ as dielectric layer. The observed
memcapacitance originates from the charge localization in a lateral
floating gate, while an applied gate voltage enables reversible tuning
of the device capacitance. Furthermore, preprogrammed or erased gate
biases enable controllable shifts of the capacitance hysteresis window
toward positive or negative bias, leading to an enlarged capacitance gap
at zero bias. A memcapacitor model developed for this system reproduces
the main features of the experimental capacitance hysteresis, capturing
the effects of charge fluctuations and dielectric frequency modulation
within the oxide layer. The demonstrated low-voltage operation and gate
tunability of oxide interface-based memcapacitors highlight their
potential for power-efficient, capacitor-based neuromorphic and synaptic
electronic architectures.

Human brain-inspired neuromorphic computing technologies play a crucial
role in addressing the increasing demands of advanced information
processing systems. The field gained significant attention following the
experimental realization of memristive devices~@strukov2008missing. More
recently, memcapacitors--whose capacitance depends on the history of the
applied voltage or charge--have attracted increasing interest as
alternative mem-elements for neuromorphic computing due to their
ultralow static power consumption compared to
memristors~@demasius2021energy@pei2023power@bhardwaj2025toward@kim2025voltage.
Furthermore, memcapacitors can be integrated as the gate stack in
metal-oxide-semiconductor field-effect transistors (MOSFETs), where
capacitance modulation effectively controls the drain
current~@yang2016memcapacitive@park2018analog. Consequently,
memcapacitor-based MOSFETs present a promising approach to replace
conventional flash memory technologies, in which a charge storage node
shifts the subthreshold voltage to enable memory operation.

To date, only a limited number of theoretical and experimental studies
have reported on memcapacitor devices. The approaches explored so far
include variations in effective dielectric thickness@emara2017non and
area@wang2018capacitive, dielectric permittivity@8733844 and ion
migration within the dielectric layer@lai2010ionic. Among these,
charge-trap-based memory devices stand out due to their easy
scalability, compatibility with large-scale fabrication, and potential
for high-density, low-cost data storage@hwang2023memcapacitor@8970565.
For instance, Hwu #emph[et al.] reported capacitance hysteresis in
SiO$""_2$-based concentric metal-oxide-semiconductor (MOS) capacitors
induced by charge trapping in ultrathin SiO$""_2$@chen2014effect, charge
modulation by outer MOS-gate@8608000 and, more recently capacitive
synapses using lateral coupling with high sensitivity in the inversion
regime@kao2025inversion. Beyond realizations based on inorganic
materials, memcapacitors have also been engineered from organic thin
films utilizing charge trapping in polymer electret
layers@cai2019organic. Interestingly partial coverage of the electret
layer enables multiple capacitive states providing analog and
nonvolatile memory functionality@9845432.

As a new player in the game, LaAlO$""_3$/SrTiO$""_3$ (LAO/STO)
heterostructures with quasi 2-dimensional electron gas (q2-DEG) formed
at the interface@ohtomo2004high exhibit exceptionally high gate
capacitance underscoring their potential for low power electronic
applications@li2011very. To date, only a few studies have reported
capacitance memory effects in LAO/STO systems, typically attributed to
structural distortions@bi2016electro, migration of oxygen
vacancies@wu2013electrically or deep trap states@kim2015electric and yet
these mechanisms remain insufficiently explored. In this letter, we have
designed and fabricated lateral nanoelectronic devices based on LAO/STO
heterostructures to systematically investigate memcapacitance behavior.
By employing an auxiliary control gate, operated either at floating
potential or under an applied bias, we demonstrate tunable capacitance
memory and reversible non-linear capacitance characteristics thereby
advancing the prospects of capacitance-based artificial neural networks.

To fabricate the device, a TiO$""_2$ terminated STO single crystalline
substrate was first patterned with a negative photoresist using electron
beam lithography. Then, a 11 nm-thick SiO$""_2$ layer was grown using
thermal evaporation followed by a lift-off process to create well
defined insulating areas. Finally, a 6 unit-cell-thick LAO film was
grown over the entire surface using pulsed laser deposition (PLD). The
process resulted in crystalline LAO growth directly on the exposed STO
regions and amorphous LAO growth on areas covered with SiO$""_2$, as
shown as topographically low and high regions, respectively, in the
3-dimensional atomic force microscopy (AFM) image displayed in Fig.
#link(<fig:f1>)[1(a)]. Therefore, q2-DEG forms at the crystalline
LAO/STO interface, while the amorphous LAO/SiO$""_2$ regions remain
insulating. The resulting lateral capacitor structure comprises the
q2-DEG nanowire channel and a lateral gate ($approx$1 $mu$m wide) as
conducting lateral electrodes separated by a $approx$350 nm-wide
SiO$""_2$ dielectric layer. An identical lateral gate on the opposite
side, also based on the q2-DEG, serves as a control gate with
SiO$""_2$/SrTiO$""_3$ acting as the gate dielectric. Further details on
the fabrication procedure and growth parameters can be found in our
recent report@pradhan2025oxide. For the capacitance measurement, an AC
voltage of 20 mV amplitude superimposed on a DC bias was applied to the
drain contact using a function generator (Model: Keithley 3390). The
resulting current output from one lateral gate was fed into a lock-in
amplifier (EG&G Instruments, model: 7265) while the same input signal
was used as reference. The real and imaginary components of the current
were recorded to extract the device capacitance. The experimental setup
and corresponding two-dimensional AFM image of the device are shown in
Fig. #link(<fig:f1>)[1(b)].

#figure(image("source/newfig1.png", width: 88%),
  caption: [
    Capacitance memory in LAO/STO interface-based lateral
    nanoelectronic device: (a) 3-dimensional atomic force microscopy
    (AFM) image of the nanowire device with two lateral gates. (b)
    2-dimensional AFM image of the device with circuit diagram for
    capacitance measurement. C-V hysteresis curves with drain voltage
    (V$""_D$) sweep between $plus.minus$1 V at an AC voltage of
    frequency 10 Hz with control gate (c) grounded and (d) at floating
    condition for original device and (e) at floating condition for a
    control device of same dimensions without SiO$""_2$ and amorphous
    LAO layer on top of dielectric layer. The insets show the AFM images
    of the devices with gating configurations for the corresponding
    measurements.
  ]
)
<fig:f1>

Figure~#link(<fig:f1>)[1(c)] shows the capacitance--voltage (C--V)
characteristics measured between the drain and one lateral gate at an AC
frequency of 10 Hz, with the drain voltage ($V_D$) swept between
$plus.minus$1 V at a rate of 26.66 mV/s while keeping the control gate
grounded. A step-like behavior in capacitance is observed, characterized
by a high-capacitance state ($C_(upright("high"))$) at negative voltages
and a low-capacitance state ($C_(upright("low"))$) at positive voltages,
without hysteresis. The bias voltage at which the capacitance begins to
increase from $C_(upright("low"))$ is defined as the threshold voltage
($V_T$). Here, $C_(upright("high"))$ corresponds to the accumulation
regime, dominated by the oxide layer, whereas $C_(upright("low"))$
arises in the depletion regime, where the series combination of
depletion and oxide capacitances reduces the total capacitance. When the
control gate is left floating, the device exhibits pronounced C--V
hysteresis loops, as shown in Fig.~#link(<fig:f1>)[1(d)]. The hysteresis
originates from charge localization on the floating control gate, which
induces a shift in $V_T$ between forward and reverse sweeps, i.e., the
signature of memcapacitance. To further confirm the origin of
memcapacitance, a control device of identical geometry was fabricated by
etching the LAO layer from predefined regions of a crystalline LAO/STO
sample with the same LAO thickness (6 unit cells), thereby avoiding the
SiO$""_2$ and amorphous LAO regions present in the original device. The
C--V characteristics of the control device were measured using the same
protocol, as shown in Fig.~#link(<fig:f1>)[1(e)]. Insets show
2-dimensional AFM images of the devices with the control gate
configurations used for the measurements. The control sample exhibits
similar $C_(upright("low"))$ values but a lower $C_(upright("high"))$,
attributable to the reduced effective dielectric constant due to the
presence of air above the STO surface in the accumulation state. The
persistence of hysteresis in the control sample confirms that the
memcapacitance originates from charge localization on the control gate,
ruling out contributions from traps in the amorphous LAO or SiO$""_2$.

#figure(image("source/newfig2.png", width: 88%),
  caption: [
    Amplitude and frequency modulation of capacitance with
    floating control gate: C-V hysteresis curves for different drain
    voltage (V$""_D$) amplitude with control gate at floating condition
    measured at (a) 10 Hz and (b) 130 Hz with inset showing variation of
    hysteresis area (right) and negative threshold voltage (V$""_T^(-)$)
    (left) with V$""_D$ amplitude extracted from (a) and (b). (c)
    capacitance-frequency (C-f) plots at V$""_D$ of 4 and -4 V, (d) C-f
    plots measured at V$""_D$ of 0 V including its initial state, after
    measuring at V$""_D$=4 V and -4 V showing memory in capacitance in
    the frequency spectrum.
  ]
)
<fig:f2>

To gain deeper insight into the characteristics of the original device,
amplitude- and frequency-dependent capacitance modulation were
investigated. Figures~#link(<fig:f2>)[2(a)] and~#link(<fig:f2>)[2(b)]
show the C--V hysteresis loops for the device at 10 Hz and 130 Hz,
respectively, using a voltage sweep sequence of
$+ V arrow.r - V arrow.r + V$ for various amplitudes with the control
gate left floating. At 10 Hz, both $C_(upright("high"))$ and
$C_(upright("low"))$ remain unchanged even when $V_D$ is increased to 4
V. In contrast, at 130 Hz, $C_(upright("high"))$ increases gradually
with increasing $V_D$, while $C_(upright("low"))$ remains constant. This
behavior reflects frequency-dependent dipole dynamics: at low
frequencies, dipoles can fully align even under small biases, whereas at
high frequencies their response lags behind the applied field, resulting
in a bias-dependent increase in the effective dipole moment. The bias at
which the capacitance sharply rises during the reverse sweep ($V_T^(+)$)
remains nearly constant for all voltage amplitudes and frequencies. In
contrast, during the forward sweep, the threshold voltage ($V_T^(-)$)
shifts systematically toward more negative values with increasing
voltage amplitude. The variation of $V_T^(-)$ and the corresponding
hysteresis area with voltage amplitude are shown in the inset of
Fig.~#link(<fig:f2>)[2(b)] for both frequencies, showing an almost
linear dependence of $V_T^(-)$ on the applied amplitude and a strongly
linear increase of the hysteresis area. For further analysis,
capacitance--frequency (C--f) curves were measured at $V_D = 4$ V and
$- 4$ V with the control gate left floating, as shown in
Fig.~#link(<fig:f2>)[2(c)]. At $V_D = 4$ V, the capacitance remains
nearly constant at $tilde.op$150 pF across the entire frequency range.
In contrast, at $V_D = - 4$ V, a pronounced enhancement in capacitance
is observed at low frequencies, consistent with
Figs.~#link(<fig:f2>)[2(a)] and~#link(<fig:f2>)[2(b)]. This
frequency-dependent modulation at negative bias can be partially
attributed to the tuning of the effective dielectric function: as
frequency increases, the capacitance progressively decreases,
approaching $C_(upright("low"))$ near 1 kHz through approximately two
reduction rates. To further probe the memory behavior, C--f measurements
were performed at $V_D = 0$ V in three conditions: initial state, after
applying $V_D = 4$ V, and after applying $V_D = - 4$ V, as shown in
Fig.~#link(<fig:f2>)[2(d)]. The results reveal a high capacitance at
zero bias across all frequencies following a 4 V measurement and a low
capacitance after a -4 V measurement, consistent with the direction of
the hysteresis loop. In contrast, the initial state exhibits an
intermediate capacitance over the full frequency range. These
observations confirm that the device exhibits robust capacitance memory
at low frequencies, which gradually diminishes as frequency increases.

#figure(image("source/newfig3.png", width: 88%),
  caption: [
    (a) Schematic band diagram of the oxide layer and the
    adjacent bent bands in the depleted semiconductor region of the
    device, with interface states involved in electronic transitions
    indicated by arrows. (b) Equivalent circuit representing the carrier
    dynamics, and its reduction to a simpler series combination of an
    effective resistance and an effective capacitance. (c) Calculated
    effective capacitance as a function of the applied DC bias and the
    driving frequency of the AC component. (d) Simulated effective
    capacitance as a function of bias potential for two different values
    of the oxide-layer capacitance and (e) corresponding effective
    resistance calculated under the same conditions as in (d)
  ]
)
<fig:f3>

To elucidate the device characteristics, first we employ a theoretical
capacitor model adapted from the classical framework introduced in
Ref.~@Nicollian1967. In this approach, the effective capacitance is governed by charge
fluctuations activated within the dielectric (oxide) layer of the
capacitor, which couple to the interfacial states and modulate the
overall carrier dynamics, as represented in Fig. #link(<fig:f3>)[3(a)].
Under a voltage difference between the drain and the gate, consisting of
a DC bias $V_D$ modulated by an AC component $delta V_t$, the apparent
impedance can be represented by the equivalent circuit shown in the top
panel of Fig. #link(<fig:f3>)[3(b)] and expressed as
$ Z_T = frac(1, Y_s + i omega C_D) + frac(1, i omega C_(o x)) \, $ where
$C_(o x)$ is the capacitance of the oxide layer, $C_D$ is the
depletion-region capacitance, and $Y_s$ is the admittance associated
with carrier capture--emission dynamics at the oxide/semiconductor
interface~@Nicollian1967, given by
$ Y_s = frac(1, R_s - frac(i, omega C_s)) . $ Here,
$C_s = frac(e^2 N_s f_0 \( V_s \) \[ 1 - f_0 \( V_s \) \], k_B T)$ and
$R_s = tau \/ C_s$, with $N_s$ denoting the density of interface trap
states (defects) and $f_0 \( V_s \)$ the occupation probability
determined by the surface potential
$ V_s = eta V_D + frac(delta Q_(a c), C_(a c) A) . $ In this expression,
$delta Q_(a c)$ denotes the slowly varying charge fluctuations in the
floating gate (relative to the AC frequency $omega$), while $eta$
represents the fraction of the total voltage drop appearing at the
surface potential. For the sake of a qualitative analysis, $eta$ is
treated here as a constant. The total apparent impedance can thus be
reduced to a simpler equivalent circuit consisting of an effective
resistance in series with an effective capacitance, as represented in
the lower panel of Fig. #link(<fig:f3>)[3(b)]. These quantities are
defined as
$ R_(upright(e f f)) = Re #scale(x: 120%, y: 120%)[\(] Z_T #scale(x: 120%, y: 120%)[\)] \, #h(2em) C_(upright(e f f)) = - frac(1, omega thin Im #scale(x: 120%, y: 120%)[\(] Z_T #scale(x: 120%, y: 120%)[\)]) \, $
which allows direct correlation of the model with the effective
parameters obtained experimentally. The resulting effective capacitance,
normalized to the oxide-layer capacitance, is shown in Fig.
#link(<fig:f3>)[3(c)] as a function of the AC frequency and the applied
DC bias. The oxide-layer capacitance defines the upper bound for the
total effective capacitance, which decreases with increasing bias due to
the expansion of the depletion region in the semiconductor. At low
frequencies ($omega tau < 1$), an additional capacitive contribution
arises from the delayed response of trapped carriers at the interface.

To analyze the origin of the capacitance hysteresis we consider that the
fluctuating charge in the floating gate evolves according to the
relaxation-time approximation described in Ref.~@LopezRichard2022,
$ frac(d thin delta Q_(a c), d t) = - frac(delta Q_(a c), tau) + g \( V_D \) \, $
where $g \( V_D \)$ represents a suitable generation function. Within
this framework, the effective capacitance develops a hysteresis, as
shown in Fig.~#link(<fig:f3>)[3(d)], in close correspondence with the
experimental observations. To assess the influence of the oxide
dielectric properties, two different values of $C_(o x)$ were
considered, thereby examining how variations in dielectric capacitance
contribute to the overall device response. The interfacial charge
dynamics affect not only the capacitance but also induce a
bias-dependent modulation of the resistance, which cannot be neglected.
This effect has a direct impact on the overall device performance, as
illustrated in Fig.~#link(<fig:f3>)[3(e)]. To verify the presence of
this resistance hysteresis we also measured the resistance using the
same voltage sweep protocol employed for the capacitance measurement.The
resulting hysteresis loops, consistent with the model predictions, are
presented in supplementary Fig.~S1.

To investigate the tunability of capacitance using the control gate,
full C--V sweep measurements between $plus.minus$1 V were performed for
various control gate voltages ($V_(C G)$) ranging from -1 to 1 V, as
shown in Fig.~#link(<fig:f4>)[4(a)]. The $V_T$ shifts systematically,
with a maximum tunability ($Delta V_T$) of $tilde.op$1 V, without the
emergence of memory~@cai2019organic. The extracted $V_T$ values and
their dependence on $V_(C G)$ are presented in Supplementary Fig.~S2. At
negative $V_(C G)$, additional electron accumulation at the control gate
restricts charge flow through the drain, requiring a more negative $V_D$
to achieve accumulation. Conversely, positive $V_(C G)$ facilitates
accumulation, yielding positive $V_T$ values that gradually saturate at
higher $V_(C G)$. To further understand the nonlinear C--V
characteristics, charge--voltage (Q--V) curves were obtained by
integrating the C--V data, as shown in Supplementary Fig.~S3. The
state-dependent charge distribution highlights the potential of MOS
capacitor-based crossbar arrays with NAND flash-like architecture, where
the synaptic weight of each cell corresponds to the integrated charge
($integral C thin d V$) used in vector--matrix multiplication, as
reported by Hwang #emph[et al.]~@hwang2023memcapacitor. Additional C--V
measurements performed by varying $V_(C G)$ at $V_D = 0$ V
(Supplementary Fig.~S4) reveal a continuous modulation of capacitance
from $tilde.op$147 pF to $tilde.op$386 pF within a narrow $V_(C G)$
range of $plus.minus$1 V, demonstrating the existence of multiple
capacitance states. Finally, to explore the effect of the control gate
on memcapacitance, C--V hysteresis loops were measured under three
conditions: (i) the initial state with a floating control gate, (ii) a
programmed state after applying +1 V for 30 s, and (iii) an erased state
after applying --1 V for 30 s, as shown schematically in the top panel
of Fig.~#link(<fig:f4>)[4(b)]. The hysteresis loop shifts toward
positive bias in the programmed state and toward negative bias in the
erased state, both exhibiting larger loop areas compared to the initial
condition. Moreover, at zero bias, the capacitance gap ($Delta C$)
increases from approximately 100 pF in the initial state to a maximum of
about 243 pF between the programmed and erased states. These results
demonstrate that control-gate-induced tuning of the memcapacitance
provides an additional degree of freedom for achieving linearity and
precision in capacitor-based synaptic weight modulation, an essential
feature for neuromorphic computing architectures.

#figure(image("source/newfig4.png", width: 88%),
  caption: [
    Tuning of reversible capacitance and its memory window
    using control gate: (a) C-V reversible curves with full cycle
    V$""_D$ sweep between $plus.minus$1 V for different control gate
    voltage (V$""_(C G)$) showing positive and negative shift of
    threshold voltage (V$""_T$), (b) C-V hysteresis curves for same
    V$""_D$ range with control gate at floating condition including its
    initial state, programmed state (P) after programming with
    V$""_(C G)$=1 V for 30 s and erased state (E) after erasing with
    V$""_(C G)$=-1 V for 30 s, showing flexibility to tune the
    capacitance gap at V$""_D$=0 V. The schematic representation for the
    measurements are shown on top panel.
  ]
)
<fig:f4>

In summary, we demonstrate charge-localization-mediated analog
memcapacitance in lateral LAO/STO-based nanoelectronic devices, where
gate control enables reversible and tunable capacitance states. The
observed hysteresis, frequency dependence, and bias-driven modulation
are consistently captured by a model incorporating interfacial charge
dynamics and dielectric fluctuations, establishing a clear
correspondence between experiment and theory. These findings highlight
the potential of oxide memcapacitors as energy-efficient building blocks
for synaptic electronics, where the coexistence of volatile and tunable
capacitive responses provides enhanced flexibility for neuromorphic and
adaptive computing architectures.

The additional supporting results are provided in the Supplementary
Material.

= Acknowledgments

The authors gratefully acknowledge financial support from the state of
Bavaria and the Deutsche Forschungsgemeinschaft (DFG, German Research
Foundation) under Germany's Excellence Strategy through the
Würzburg-Dresden Cluster of Excellence on Complexity and Topology in
Quantum Matter "ct.qmat" (EXC 2147, Project ID 390858490) as well as
through the Collaborative Research Center SFB 1170 "ToCoTronics"
(Project ID 258499086). V.L.R. acknowledges the support from Conselho
Nacional de Desenvolvimento Científico e Tecnológico (CNPq-Brasil) Proj.
311536/2022-0. V.L.R and L.K.C. acknowledge FAPESP Projs. 2024/09298-7,
2025/00677-8, and 2025/04805-0. V.L.R and A.L.C.S. acknowledge FAPESP
Projs. 2023/17490-2 and 2024/17787-8.

#bibliography("source/aipsamp.bib", style: "ieee")

#pagebreak()
#include "supplement.typ"
