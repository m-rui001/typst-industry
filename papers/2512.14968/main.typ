#import "counting-path.typ": counting-path
#set document(title: "Optical Response in Spintronic Poisson Bolometers")
#set page(paper: "us-letter", margin: (x: 19mm, y: 18mm), numbering: "1", columns: 2)
#set text(font: "Libertinus Serif", size: 10pt)
#set par(justify: true, leading: .53em)
#set math.equation(numbering: "(1)")
#set figure(placement: auto)
#show figure.caption: set text(size: 8.8pt)
#place(top, float: true, scope: "parent", clearance: 1em)[
  #align(center)[
    #text(size: 17pt, weight: "bold")[Optical Response in Spintronic Poisson Bolometers]
    #v(.55em)
    Ziyi Yang#super[1,†], Sakshi Gupta#super[2,†], Jehan Shalabi#super[1,†], Leif Bauer#super[1], Daien He#super[1], Mohamed Mousa#super[1], Angshuman Deka#super[1], and Zubin Jacob#super[1,\*]
    #v(.45em)
    #text(size: 9pt)[#super[1]Elmore Family School of Electrical and Computer Engineering, Purdue University, West Lafayette, Indiana 47907, USA \
      #super[2]Department of Physics and Astronomy, Purdue University, West Lafayette, Indiana 47907, USA \
      † These authors contributed equally to this work. \* #link("mailto:zjacob@purdue.edu")[zjacob\@purdue.edu]]
  ]
  #v(.65em)
  #text(size: 9.5pt)[*Abstract.* Analog bolometers based on temperature-dependent phase-transition materials such as vanadium oxide (VOx) and barium titanate (BTO) represent the state of the art in uncooled infrared detectors. Recently, the first room-temperature spintronic Poisson bolometer based on magnetic tunnel junctions (MTJs) was proposed and demonstrated as a promising infrared detector. Unlike conventional bolometers, the spintronic Poisson bolometer operates in a probabilistic regime dominated by Poissonian noise, where the response is governed by resistance fluctuations arising from thermally activated magnetization transitions. Spontaneous transitions between two metastable magnetic states occur even in the absence of incident light, and the transition probability increases under illumination. In this work, we experimentally study the statistical properties of the optical response of the spintronic Poisson bolometer under illumination. We demonstrate that transitions in spintronic Poisson bolometers, both in the absence and presence of light, exhibit Poissonian behavior, with transition rates and interarrival times modulated by incident radiation. Under illumination, we observe a 153% increase in the count rate accompanied by a 70% reduction in interarrival time. These results establish spintronic Poisson bolometers as a promising platform for probabilistic, high-speed, and high-sensitivity infrared detection at room temperature.]
]


= Introduction
<introduction>
Bolometers are thermal detectors in which incident light causes a
temperature-induced resistance change that is read out electrically
@YADAV2022113611. Infrared bolometers are essential for emerging
applications in thermal imaging, autonomous navigation, astronomy, and
time-of-flight sensing
@Bao2023@Lahiri2012@Sivaprakasam2020@Kaushal2017@anderson2023advancements@rodriguez2023remote@PhysRevX.14.041005.
State-of-the-art uncooled bolometers are analog detectors based on
temperature-dependent phase transition of materials such as vanadium
oxide (VOx) and barium titanate (BTO)
@yeh2020performance@scott2022sensing. Other uncooled bolometers are
based on semiconductor and metallic materials with temperature-dependent
resistance, including amorphous silicon and
platinum#cite(label("doi:10.1021/acsphotonics.9b01198"))#cite(label("doi:10.1021/acs.nanolett.1c02972"))#cite(label("doi:10.1021/acs.nanolett.3c03076")).
In VOx bolometers, major noise sources are Johnson noise, thermal noise,
generation--recombination and $1 \/ f$ noise
@philipose2023analyzing#cite(label("10.1063/5.0049633"))@du2013graphene.
Similarly, the dominant noise in barium titanate (BTO) bolometers and
graphene bolometers is Johnson noise
@Hanel:61@du2013graphene@PhysRevB.96.165431. All of the uncooled
bolometers aforementioned are analog detectors that produce a continuous
voltage or current proportional to the incoming signal, and are
dominated by Gaussian noise, as shown in @fig:one\(a).

Recently, the first uncooled spintronic Poisson bolometer, called the
spintronic ultrafast nanoscale bolometer (SUN bolometer) @leif_nanolett
was proposed. Unlike analog bolometers, the spintronic Poisson
bolometers convert incoming signals into discrete counting events and
are dominated by Poissonian noise, as shown in @fig:one\(b). In
spintronic Poisson bolometers, magnetic tunnel junctions (MTJs) are
engineered with an energy barrier of the order of thermal infrared
energy at room temperature. It exploits switching between two discrete
magnetization states by intrinsic thermal fluctuations and nanoscale
heating induced by incident radiation. These digital probabilistic
transitions in the absence of light are referred to as dark counts, and
when under illumination, are bright counts. It was demonstrated that the
count rate increases due to the incident light, validating the device's
response through the Néel-Arrhenius law @PhysRevB.104.094433. The
spintronic Poisson bolometer achieved a noise equivalent temperature
difference (NETD) of 103 mK at a 25 Hz frame rate, and high readout
speeds of 10 MHz, which is faster than commercial vanadium dioxide
detectors. The high sensitivity and the high readout speed make it a
promising candidate for state-of-the-art infrared detection.

In other studies in the field, stochastic MTJs have been utilized for
random number generation, probabilistic computing, and neuromorphic
computing
@choi2014magnetic@joshi2020mtj@zhang2021recent@maciel2019magnetic@zink2022review.
The stochastic magnetization transitions, known as magnetic random
telegraph noise (RTN), exhibit relaxation times that follow an
exponential distribution, consistent with Poisson event statistics
@hayakawa2021nanosecond@2021relaxation. Similarly, detection-based
studies have shown exponentially distributed dark-count interarrival
times @leif_nanolett. Notably, previous studies have examined the
statistics of MTJ transitions only in the absence of incident light.

In this work, we extend the study to the optical response of the
spintronic Poisson bolometer under incident radiation. The spintronic
Poisson bolometer operates in a noise-dominated probabilistic regime,
where the response is governed by random resistance fluctuations arising
from thermally activated magnetization switching. We demonstrate that
both dark-count and bright-count statistics in spintronic Poisson
bolometers are well described by the Poisson distribution, with the mean
count rate modulated by incident radiation. Changes in the mean number
of counts indicate enhanced thermal switching between the two
magnetization states in the MTJ sensing layer, serving as a key to
quantifying incident radiation. The spintronic Poisson bolometer thus
offers a fundamentally different detection paradigm based on an
indirect, thermally mediated light--matter interaction, leading to
Poisson statistics that are independent of the light source statistics.

The Poissonian nature of these counts enables time-resolved measurements
with high fidelity and superior signal-to-noise ratio (SNR) compared to
analog systems under identical conditions. The spintronic Poisson
bolometer also exhibits distinct statistics compared to other digital
detectors due to the absence of after-pulsing @WANG2019202 and its
intrinsic Poisson response, irrespective of light statistics. We also
investigate the device's non-probabilistic response. Excitation with a
pulsed laser produces current transients, providing insights into heat
transfer and transport within the device. This systematic experimental
investigation of the response statistics of spintronic Poisson
bolometers under illumination advances our understanding of the
underlying device physics and guides optimization of sensitivity,
response time, dynamic range, and spectral response. Overall, we
establish the spintronic Poisson bolometer as a promising platform for
probabilistic, high-speed, and high-sensitivity infrared detection at
room temperature.

#figure([#image("source/Fig1.png", width: 95%) #v(4pt) #layout(size => counting-path(size.width))],
  caption: [
    (a) In analog detectors, thermal noise and Johnson noise
    follow a Gaussian distribution as they stem from thermal agitation
    of a large number of electrons. (b) In digital detectors, dark
    counts follow a Poisson distribution as they stem from discrete
    independent events happening at a constant mean rate, such as
    thermal excitations and quantum tunneling effects in single photon
    detectors (SPDs), or magnetization flips governed by exponentially
    distributed interarrival times in spintronic Poisson bolometers
    (SPB). (c) Device structure. The main structure has five layers: a
    transduction layer, a magnetic free layer, a tunnel barrier, a
    magnetic fixed layer, and a synthetic antiferromagnetic layer (SAF).
    The magnetization M of the readout layer is pinned by the SAF. The
    magnetization of the sensing layer flips between M1 and M2
    probabilistically due to heat. (d) When no light is incident,
    natural heat in the device causes discrete transitions between these
    two magnetization directions, which we refer to as dark counts. When
    light is incident, a hot spot is formed in the transduction layer,
    which thermalizes through a magnetic tunnel junction (MTJ). This
    increases the probability of transition in the MTJs sensing layer,
    leading to an increased count rate, which is read out through the
    device's resistance. (e) Left: Optical image of the device. Right:
    SEM image of the MTJ nanopillar before Au deposition.
  ]
)
<fig:one>

= Results and Discussion
<results-and-discussion>
The spintronic Poisson bolometer studied here consists of five layers: a
transduction layer at the top, a magnetic sensing (free) layer, a
nonmagnetic insulating tunnel barrier, a magnetic readout (fixed) layer,
and a synthetic antiferromagnetic (SAF) layer, as shown in
@fig:one\(c). The latter four layers form a magnetic tunnel
junction (MTJ) that exhibits tunnel magnetoresistance. The magnetization
of the readout layer is pinned by the underlying SAF layer, which
stabilizes an out-of-plane (perpendicular) magnetization in the fixed
layer. The sensing layer possesses two stable magnetization states (M1
and M2). Due to the presence of spin-polarized current in the device,
the resistance depends on the sensing layer's magnetic orientation.

Even without illumination, thermal fluctuations induce spontaneous
transitions between the two sensing-layer states, producing dark counts.
Illumination generates a hot spot in the transduction layer, which
thermalizes through the MTJ stack and increases the probability of
transitions in the sensing layer. This results in an increased count
rate observed through MTJ resistance readout (@fig:one\(d)). The
behavior of these transitions follows the Néel--Arrhenius law for
thermally activated switching@2021relaxation:

$ tau_(M_1 \, \( M_2 \)) = tau_0 exp (frac(E_b, k_B T)) $#label("eq:N-A law")

where $tau_0$ is the attempt time, $k_B$ is Boltzmann's constant, and
$T$ is the temperature, and $E_b$ is the energy barrier:

$ E_b = frac(M V \( H_k minus.plus H \), 2) $

where $M$ is the magnetization, $H_k$ is the magnetic anisotropy field,
V is the volume of the sensing layer, and H is the magnetic field
present in the sensing layer. @fig:one\(e) shows an optical image
of the fabricated spintronic Poisson bolometer device and an SEM image
of the MTJ nanopillar before Au deposition.

We next present a general model for detector signal and response time.
For analog bolometers such as VOx, the detector signal is an output
voltage, whereas for the spintronic Poisson bolometer, the signal is the
count rate. The relationship between incident power and detector signal
is quantified through the temperature increase of the bolometer, which
depends on the thermal properties:

$ Delta T = frac(epsilon P \/ A, (G_(upright(t h))^2 + omega^2 C_(upright(t h))^2)^(1 \/ 2)) $

where $Delta T$ is the temperature change of the detector, $epsilon$ is
emissivity, $P$ is the incident radiant power, and $A$ is the effective
detector area, $G_(upright(t h))$ is the thermal conductance,
$C_(upright(t h))$ is the thermal capacitance, and $omega$ is the
angular modulation frequency @8845784.

The temperature-to-signal conversion is characterized by-

$ k = frac(d V, d T) $

which reflects the sensitivity of the detector output to temperature
change.@8845784 For VOx, $k$ is constant over the operating range,
whereas for the spintronic Poisson bolometer, the change in count rate
follows the Neel-Arrhenius relation @leif_nanolett. For small changes in
temperature, the count rate increase is

$ d N = 2 / tau_0 exp \( frac(- E_b, k_B T) \) * frac(E_b, k_B T^2) * d T $<eq:count-response>

where $d N$ is the increase in counts due to a temperature rise $d T$,
$tau_0$ is the relaxation time, $E_b$ is the energy barrier, $k_B$ is
the Boltzmann constant (Supplementary I). Thus, in both conventional
analog bolometers and digital spintronic Poisson bolometers, the signal
is linearly dependent on temperature.

The detector response time is given by
$ tau_(t o t a l) = tau_(d i f f u s i o n) + tau_(t h e r m a l) + tau_(i n t r i n s i c) $
where $tau_(upright("diffusion"))$ is the diffusion time,
$tau_(upright("thermal"))$ is the thermal time constant, and
$tau_(upright("intrinsic"))$ represents intrinsic system dynamics as
magnetic spin switching. For VOx bolometers, the response time is
dominated by thermal time constant (10 ms), whereas for the spintronic
Poisson bolometer, it is governed by the diffusion time (2.2-3.5
ns)@Abdullah2023@leif_nanolett. Because the spintronic Poisson bolometer
is a probabilistic Poisson detector, deterministic readout of a
transition is further limited by approximately 4.6 times the relaxation
time (0.1-10 $mu s$) (Supplementary II). Overall, the spintronic Poisson
bolometer is faster than $V O_x$ by three orders of magnitude, making it
a strong candidate for high-speed detector applications.

To study the spintronic Poisson bolometer response to incident light
over a range of pulse widths, powers, and wavelengths, we used three
different laser sources: (1) a continuous-wave (CW) 405 nm laser, (2) a
808 nm CW laser with power modulation by an arbitrary waveform
generator, and (3) a 405 nm pico-second laser with a 20 ps pulse width.
A schematic of the corresponding power-time profiles is shown in
@fig:two (a).

== Device Response to 808 nm Modulated Laser
<device-response-to-808-nm-modulated-laser>
#figure(image("source/Fig2.png"),
  caption: [
    (a) Schematic of the power-time relationship of 3 laser
    sources. We study the device response to 3 types of laser sources.
    The first laser is a continuous-wave (CW) 405 nm laser. The second
    laser is a modulated 808 nm CW laser. The power output of this laser
    is modulated by an arbitrary waveform generator (AWG). The third
    laser is a 405 nm pico-second laser that has a pulse width as small
    as 20 ps. (b) Raw readout signal. The orange curve is the laser
    trigger signal. (c) Time correlation. We divide each period into 100
    bins (100 ns per bin) and calculate the probability of a count
    happening in each bin. The red dashed line marks the time of the
    trigger of one of the periods when it turns the laser on, which
    occurs at t = 3233.6 ns. The system has around 80 ns latency between
    the laser trigger and light incidence on the device. We can see a
    stabilized count probability increase at t = 3366.7 ns, which is
    around 53 ns after the light is incident when considering the
    latency. (d) Count statistics. We divide the data into 20 $mu s$
    time bins and calculate the number of counts happening in each time
    bin. For both laser-on and off regions, the number of counts follows
    a Poisson distribution. With the fitted mean number of counts
    $lambda$, we can calculate the mean count rates for laser off and on
    regions, which are 3.373285 Mcps and 3.95123 Mcps, respectively.
    This shows around a 17% increase in the count rate due to incident
    light.
  ]
)
<fig:two>

We first investigate the spintronic Poisson bolometer's response to an
808 nm near-infrared continuous (CW) laser whose intensity is modulated
by an arbitrary waveform generator (AWG). This modulation produces
periodic on-off illumination, enabling a direct comparison of count
statistics in the presence and absence of light. For this measurement,
the device is biased at +175 mV and bias magnetic field of 4 mT. The
incident average optical power is 25 mW, and the laser spot has a 3
$mu m$ full-width half-maximum (FWHM), corresponding to an intensity of
3.5 mW/$mu m^2$. The modulation frequency is 100 kHz with a 50% duty
cycle, producing alternating 5 $mu s$ bright and dark intervals. We
perform the measurement using a bias-tee and low-noise amplifier (LNA)
in the setup and read out the AC part of the signal with an
oscilloscope.

@fig:two (b) shows the device response to the 808 nm modulated
laser. Counts are superimposed on the non-probabilistic voltage signal.
When the laser is ON, we observe an increase in device resistance due to
laser heating of the electrical contacts as well as an increase in count
rate. To understand the statistics of ON and OFF regions, we divide each
period into 100 bins (100 ns per bin) and the probability of detecting a
count in each bin is computed over 6000 periods, as shown in
@fig:two (c). The dotted line indicates the time light was incident
on the device, and the red line is the voltage of the device averaged
over 6000 periods. The probability of a count remains constant over both
ON/OFF regions, indicating stochastic behavior which is characteristic
of Poisson statistics. When the laser is turned ON, we observe that the
probability of a count increases 53 ns after the light is incident
(Supplementary).

We then separate the data into laser-ON and laser-OFF regions and study
the probability distribution of the number of counts $P \( N \)$ for
each region. We divide the data into 100 time bins and calculate the
number of counts that occur in each time bin as shown in @fig:two
(d). We observe that for both laser OFF and laser ON cases, the count
distribution follows a Poisson distribution @van1992stochastic:

$ P \( N \) = frac(lambda^N, N !) e^(- lambda) \, N = 0 \, 1 \, 2 \, . . . \, oo . $

From the Poisson fit of the probability distribution in @fig:two
(d), the mean count rates for laser off and on regions are calculated to
be 3.3 Mcps and 3.9 Mcps, respectively. This shows around a 17% increase
in the count rate due to incident light. The shifted mean number of
counts manifests increased temperature and energy in the sensing layer,
and thus increased probability of transitions according to equation
#ref(label("eq:N-A law")). These results suggest that the spintronic
Poisson bolometer demonstrates Poissonian statistics for both dark
counts and bright counts with incident radiation.

#figure(image("source/fig3.jpg", width: 80.0%),
  caption: [
    \(a) Probability histogram of detector counts over
    $3.8 med mu upright("s")$ intervals under 405 nm CW laser
    illumination. The count statistics follow a Poisson distribution, as
    shown by the black fit curve. When the laser is off, the mean count
    is $lambda$= 17; under illumination, the mean increases to $lambda$
    \= 43, indicating light-induced switching events. (b) Voltage state
    distributions under dark and illuminated conditions show two
    distinct peaks corresponding to the parallel (low-resistance) and
    antiparallel (high-resistance) magnetization states. (c) Histogram
    of relaxation times spent in the parallel (low-voltage) state before
    transitioning to the antiparallel (high-voltage) state. The
    distribution follows an exponential decay, consistent with
    Poissonian statistics. Illumination reduces the mean relaxation time
    by 66%, increasing the switching rate. Inset: Bright count rate
    versus laser intensity shows a significant increase in counts in
    response to higher optical power. (d) Histogram of relaxation times
    in the antiparallel state before switching to the parallel state.
    Like the parallel case, the distribution follows an exponential
    profile, with mean relaxation time decreasing by 70% under
    illumination. Inset: Field dependence of both dark and bright count
    rates shows a maximum near H=1 mT, corresponding to the field
    strength where the energy barrier between magnetic states is
    minimized and switching is most probable.
  ]
)
<fig:Rot_Curve>

== Device Poissonian Response to 405 nm CW Laser
<device-poissonian-response-to-405-nm-cw-laser>
In this section, we examine the spintronic Poisson bolometer's response
to a 405 nm CW laser of intensity of
$0.18 upright(m W) \/ mu upright(m)^2$ on the device and analyze the
statistical behavior of both dark and bright counts, assessing the count
statistics. The device registers a dark count rate of ~4.5 Mcps. When
illuminated with a 405 nm CW laser, the count rate increases to ~11.4
Mcps—a 153 % increase. The gold top contact of the device absorbs
approximately $60 %$ of incident light at 405 nm, compared to $1 %$
absorption at 808 nm. Thus, there is a higher count rate increase under
a 405nm laser illumination than under 808nm, indicating a strong
wavelength dependence of the statistical response.

Figure 3(a) presents histograms of detector counts over
$3.8 med mu upright("s")$ intervals under dark and illuminated
conditions. Both distributions follow Poissonian fits, with mean number
of counts shifting from $lambda$ = 17 (dark) to $lambda$ = 43 (bright).
This demonstrates that incident photons increase the probability of
stochastic switching in the magnetic tunnel junction (MTJ), consistent
with thermally activated transitions. Figure 3(b) shows the voltage
state probability distributions for both conditions. Each case exhibits
two distinct peaks corresponding to the parallel (low resistance) and
antiparallel (high resistance) magnetization states of the sensing
layer. Under illumination, a voltage shift is observed as a result of
changes in magnetoresistance, providing further confirmation of
light-induced modulation.

#figure(image("source/figure4.pdf", width: 98.0%),
  caption: [
    \(a) For a 405 nm picosecond laser, the laser-induced response is
    observed in the spintronic Poisson bolometer readout when light is
    incident on or near the device. (b) We observe different behavior
    with the 808 nm laser, where the photocurrent response does not
    reduce further away from the device. Inset is the reflection
    spectrum of the Au top contact. (c)The pulse width dependence is
    studied by varying the duty cycle of the 808 nm modulated laser. We
    observe that for larger pulse widths, the photocurrent is reduced,
    which signifies power dependence. (d) The peak power dependence of
    the laser-induced voltage is linear at low powers and saturates at
    high powers.
  ]
)
<fig:pulsed>

To further investigate the switching dynamics, we analyze the relaxation
time, i.e., the time between consecutive magnetization transitions.
Figures 3(c) and 3(d) present histograms of relaxation times for the
parallel and antiparallel states under both laser-off and laser-on
conditions. In both cases, the distributions exhibit exponential decay,
consistent with a Poisson process, as described by:
$ P \( tau \) = 1 / mu e^(- 1 / mu tau) $ where, $mu$ is the mean
relaxation time. Under illumination, $mu$ decreases significantly: from
$121 upright("ns")$ to $41 upright("ns")$ in the parallel state, and
from $266 upright(" ns")$ to $81 upright("ns")$ in the antiparallel
state, resulting in an increased switching rate. This confirms that
optical excitation enhances the probability of transition events, and is
consistent with Néel--Arrhenius' law (see Eq. 1), where the switching
rate increases as the energy barrier decreases via optical heating that
increases the temperature of the sensing layer.

The inset of Fig. 3(c) demonstrates that as the laser intensity
increased from $0$ to $0.18 thin frac(upright(m W), mu upright(m)^2)$,
the count rate nearly triples, from 4.5 Mcps to 11.4 Mcps—approaching
saturation at higher intensities. Meanwhile, the inset of Fig. 3(d)
shows that both dark and bright count rates follow a Gaussian dependence
on the applied magnetic field, peaking near H = 1 mT where we operate
our device. At this field bias, the energy barrier is minimum, leading
to an increased transition rate. These results confirm the field-tunable
nature of Poissonian distributed thermal switching events in the
spintronic Poisson bolometer under 405 nm illumination, with optical
modulation of both count rate and relaxation dynamics.

== Laser Induced Current in MTJ-based detector due to a pulsed picosecond laser
<laser-induced-current-in-mtj-based-detector-due-to-a-pulsed-picosecond-laser>
Finally, we investigate the response of the spintronic Poisson bolometer
to nanosecond and picosecond pulsed lasers. When the laser pulse is
incident on the device, the absorbed light produces phonons and hot
electrons. The top contact of the device is made up of 75 nm Au, which
is known to induce bulk photocurrent due to pulsed laser. Since the
device has an electrical readout, this photocurrent response is read out
in addition to the MTJ tunnel magneto-resistance. We studied the
induced-current response due to a 405 nm picosecond laser with a pulse
width of 20 ps (Figure 4a) and an 808 nm modulated laser with a
nanosecond (200-1000 ns) pulse width (Figure 4b) by analyzing the
average voltage of the response. With high power of incident radiation,
we observe a photocurrent in the metallic Au top contact.

The positional dependence of the photocurrent is studied for the two
laser signals. For the 405 nm ps laser, we observe that the current is
highest when light is incident on top of the device, and it reduces
significantly when light is incident away from the device. This implies
the presence of hot electron effects. Additionally, it takes the same
time to get to the peak current for different powers of light, while the
relaxation time depends on the power of incident radiation. For 808nm,
we observe that the current induced is largely position-independent,
indicating the presence of hot electron effects. The effect of the laser
on the top and bottom contacts was also studied, with no major
differences found in voltage, indicating the absence of thermo-voltaic
effects. The presence of hot-electron effects at 405 nm can be explained
by differences in the reflection spectrum. For 405 nm, Au is
significantly absorptive (reflection=40%) while at 808 nm Au is highly
reflecting (reflection=99%).

The induced current is studied for different pulse widths (Figure 4c).
For smaller pulse widths, since the peak power of the laser is higher,
the induced current is higher. The induced-current duration is smaller
than an 800 ns pulse width, as it is a non-equilibrium effect. The power
dependence is also analyzed (Figure 4d). The induced current is found to
be linearly proportional to low incident powers and has a saturation at
higher powers. Thus, we demonstrate a non-probabilistic response with
ultrafast pulsed light and show a response dominated by photocurrent and
hot-electron effects.

= Conclusion
<conclusion>
In conclusion, we have experimentally demonstrated that spintronic
Poisson bolometers exhibit Poissonian response statistics under both
dark and illuminated conditions, independent of the statistics of the
incident light source. Time-resolved measurements confirm that both dark
and bright counts follow Poisson distributions, with interarrival times
exhibiting exponential behavior. This validates the indirect thermally
activated switching mechanism governed by the Néel-Arrhenius model.
These findings establish spintronic Poisson bolometers as a new class of
digital probabilistic infrared detectors with high-speed,
high-sensitivity, room-temperature operation. By leveraging their
inherent Poisson statistics, spintronic Poisson bolometers present a
promising platform for next-generation time-resolved infrared detection
and effectively address the limitations of current state-of-the-art
analog detectors.

= Acknowledgments
#block[
This work is partially supported by the Elmore Chaired Professorship of
Purdue University.

]

#bibliography("source/refs.bib", style: "american-institute-of-physics", title: [References])
