// Typst format conversion of arXiv:2512.13339v1 under CC BY 4.0.
#set page(paper: "a4", margin: 20mm, numbering: "1")
#set text(font: "Libertinus Serif", size: 10.5pt)
#set par(justify: true)
#set heading(numbering: "1.1")
#set math.equation(numbering: "(1)")
#align(center)[
  #text(size: 16pt, weight: "bold")[Influence of Radiation and AC Coupling on Time Performance of Analog Pixels Test Structures in 65 nm CMOS technology]

Gianluca Aglieri Rinella#super[1], Luca Aglietta#super[2,3], Matias Antonelli#super[4], Francesco Barile#super[5,6], Franco Benotto#super[3], Stefania Maria Beolè#super[2,3], Elena Botta#super[2,3], Giuseppe Eugenio Bruno#super[7,6], Domenico Colella#super[5,6], Angelo Colelli#super[5,6], Giacomo Contin#super[8,4], Giuseppe De Robertis#super[6], Floarea Dumitrache#super[3], Domenico Elia#super[6], Chiara Ferrero#super[3], Martin Fransen#super[9], Alessandro Grelli#super[9,11], Hartmut Hillemanns#super[1], Isis Hobus#super[9,10], Alex Kluge#super[1], Shyam Kumar#super[6], Corentin Lemoine#super[1,12], Francesco Licciulli#super[6], Bong-Hwi Lim#super[2,3], Flavio Loddo#super[6], Esther Mwetaminwa M'Bilo#super[9,10], Magnus Mager#super[1], Davide Marras#super[13,14], Paolo Martinengo#super[1], Cosimo Pastore#super[6], Rajendra Nath Patra#super[6,15], Stefania Perciballi#super[2,3], Francesco Piro#super[1], Francesco Prino#super[3], Luciano Ramello#super[3,16], Felix Reidt#super[1], Roberto Russo#super[9,10], Valerio Sarritzu#super[1], Umberto Savino#super[2,3], Serhiy Senyukov#super[12], Mario Sitta#super[3,16], Walter Snoeys#super[1], Jory Sonneveld#super[9,10], Miljenko Suljic#super[1], Triloki Triloki#super[7,6], Håkan Wennlöf#super[9,10]

#super[1] European Organisation for Nuclear Research (CERN), Geneva, Switzerland \
#super[2] University of Torino - Department of Physics, Torino, Italy \
#super[3] INFN, Sezione di Torino, Torino, Italy \
#super[4] INFN, Sezione di Trieste, Trieste, Italy \
#super[5] University of Bari - Department of Physics, Bari, Italy \
#super[6] INFN, Sezione di Bari, Bari, Italy \
#super[7] Polytechnic of Bari - Department of Physics DIF, Bari, Italy \
#super[8] University of Trieste, Trieste, Italy \
#super[9] National Institute for Subatomic Physics (Nikhef), Amsterdam, Netherlands \
#super[10] University of Amsterdam, Amsterdam, Netherlands \
#super[11] Utrecht University, Utrecht, Netherlands \
#super[12] Université de Strasbourg, CNRS, IPHC UMR 7178, Strasbourg, France \
#super[13] University of Cagliari, Cagliari, Italy \
#super[14] INFN, Sezione di Cagliari, Cagliari, Italy \
#super[15] Department of Physics, University of Jammu, Jammu, India \
#super[16] Università del Piemonte Orientale, Vercelli, Italy \
#link("mailto:umberto.savino@unito.it")

#link("https://arxiv.org/abs/2512.13339v1")[arXiv:2512.13339v1] · #link("https://creativecommons.org/licenses/by/4.0/")[CC BY 4.0]
]

*Abstract.* Monolithic Active Pixel Sensors (MAPS) in advanced CMOS imaging
technologies are key to next-generation tracking systems for high-energy
physics, where radiation hardness and precise vertex reconstruction are
essential. As part of the ALICE ITS3 R&D program in synergy with the
CERN R&D, we evaluated the performance of the Analog Pixel Test
Structures (APTS) fabricated in the TPSCo 65 nm CMOS imaging process.
The prototypes employ 10~μm pitch pixels with a fast operational
amplifier--based buffering stage at the output, enabling direct
characterization of intrinsic sensor response. Beam tests with minimum
ionizing particles assessed the timing and charge collection of DC- and
AC-coupled designs, including devices exposed to 1~×~10#super[14] and
1~×~10#super[15] non ioninsing energy loss. DC-coupled sensors
demonstrated stable performance, maintaining time resolution lower than
70~ps and $> 99$% detection efficiency up to 1~×~10#super[15].

AC-coupled sensors demonstrated a wide operational margin, with
efficiencies above 99% for clusterization thresholds below
150~e#super[−]. Even though the AC coupling allows higher reverse bias
than DC-coupled sensors, the reduced signal amplitude lowers the
signal-to-noise ratio, increasing the jitter contribution. At high
reverse bias, the AC-coupled sensors achieve time resolutions comparable
to the DC-coupled version, demonstrating the viability of both
approaches. These results also suggest that combining the low
capacitance of DC-coupled designs with the high-bias capability of AC
coupling could further enhance time resolution.

These results confirm the suitability of 65 nm MAPS for future collider
detectors requiring high radiation tolerance, efficiency, and timing
precision.

*Keywords.* Monolithic Active Pixel Sensors; Solid state detectors; Silicon; CMOS; Particle detection; Test beam.

= Introduction
<introduction>
The development of high-granularity, low-material tracking systems is a
central goal of modern particle physics experiments. As collider
luminosities and data rates continue to increase~@Aberle:2749422,
innovative sensor technologies are required to maintain excellent
spatial and temporal resolution, while minimizing material budget. In
this context, Monolithic Active Pixel Sensors (MAPS) have emerged as a
compelling solution due to their fine segmentation, low power
consumption, and integration of sensor and readout circuitry on the same
silicon die~@CONTIN201860@REIDT2022166632.

A pioneering implementation of large-scale MAPS in a high-energy physics
environment is the Inner Tracking System (ITS2) of the ALICE (A Large
Ion Collider Experiment) detector at the Large Hadron Collider (LHC).
Commissioned in 2021, covering a surface of approximately 10~m#super[2],
ITS2 is the the largest application of MAPS in a collider
experiment~@REIDT2022166632@Abelev_2014@Acharya_2024. This marks a
significant technological milestone, establishing MAPS as a viable
option for next-generation tracking systems.

To further enhance ALICE vertexing performance, the ITS3
upgrade~@loi#cite(label("doi:10.7566/JPSCP.34.010011"))@The:2890181 aims
to develop a new generation of MAPS using the Tower Partners
Semiconductor Co. (TPSCo) 65~nm CMOS imaging process, TPSCo 65 nm
ISC~@towerjazz. This technology offers enhanced radiation tolerance,
reduced pixel pitch, and faster signal processing capabilities, compared
to previously used technologies. As part of the ITS3 and EP R&D
programs, an Analog Pixel Test Structure (APTS) was designed in several
variants as a test chip aimed at general sensor characterization. Due to
its fast output stage, especially for the variant with the operational
amplifier (OA)-based output stage, it can also be used to characterize
the sensor timing performance. The APTS therefore also targets ALICE 3
@arXiv:2211.02491 by providing an opportunity to validate the 65~nm CMOS
technology for timing MAPS, including those envisioned for
time‑of‑flight detectors, well beyond its tracking application.

The APTS prototype includes a $4 times 4$ matrix of 10~μm square pixels.
It has been implemented with several sensor variants. In the one studied
here, each pixel features a fast operational amplifier (OA)-based
buffering stage, and it employs a n-type implantation in the epitaxial
layer to optimize charge collection~@Munker_2019. By providing direct
access to the analog output of individual pixels, with sufficient
bandwidth, the APTS allows detailed characterization of the charge
collection properties of the sensor. Previous beam test studies have
demonstrated excellent performance, combining a time resolution of
63~ps, spatial resolution of 2~μm, and detection efficiency exceeding
99% for minimum ionizing particles @opamp_2025.

In this work, we present results from an test beam campaign aimed at
evaluating the radiation hardness of the APTS-OA DC-coupled sensors up
to a fluence of 1~×~10#super[15], and compare the performance of
non-irradiated DC@opamp_2025 and AC-coupled sensors. The APTS-OA time
resolution and charge collection efficiency are assessed for all the
above sensors.

= The APTS-OA
<the-apts-oa>
The APTS-OA consists of a $4 times 4$ matrix of 10~μm-pitch pixels, each
directly buffered to output pads for analog readout and operated via
external reference currents and voltages. Dummy pixels surround the
matrix to mitigate edge-related electric field distortions. The
radiation hardness of the DC-coupled design was studied through a
non-ionizing energy loss (NIEL) irradiation campaign with neutrons at
JSI Ljubljana. APTS-OA sensors were irradiated at fluences of
1~×~10#super[14] and 1~×~10#super[15].

== Sensor variants
<sensor-variants>
#figure(image("source/figures/cross_section.png", width: 60.0%),
  caption: [
    Schematic cross section of two pixels in the #emph[modified with
    gap] process.
  ]
)
<fig:cross_section>

The APTS was fabricated using three sensor process variants, derived
from a standard imaging CMOS design and progressively modified to
enhance charge collection speed and reduce charge
sharing~@AGLIERIRINELLA2023168589@APTSSF_2023@SNOEYS201790. In this
study, we focus on the #emph[modified with gap] variant, which features
a small n-well collection electrode (about 1~μm diameter) extended by a
low dose deep n-type implant in a high-resistivity p-type epitaxial
layer. A gap in the deep n-type implant near the pixel edges creates a
lateral electric field, accelerating charge collection, improving timing
performance and radiation hardness. A deep p-well allows full CMOS
circuitry in the pixel matrix without compromising charge collection
efficiency.

Two versions of coupling between the sensor and the front end are
available. In the DC-coupled version, already presented in detail in
@opamp_2025, the sensor is directly connected to the input of the
front-end. In that case the potential of the collection electrode is
dictated by the operating point of the front end, with an upper limit of
1.2~V. Further reverse biasing of the sensor has to be achieved with
lowering the substrate voltage to enhance charge collection. Since the
p-wells containing transistors inside the matrix are exposed to the same
potential as the substrate, this version is limited to a maximum of 6~V
of potential difference to avoid breakdown of the shallow source and
drain junctions, this version is thus limited to about 4.8~V of
substrate bias. However, the small collection electrode leads to a low
capacitance of the input node, which results in a significant signal
despite this limited reverse bias.

#figure(image("source/figures/APTS_OA_AC.svg"),
  caption: [
    Schematic of the front-end of the DC-coupled and AC-coupled APTS-OA.
  ]
)
<fig:front-end>

To explore higher reverse sensor biases, an AC-coupled design was also
manufactured. The schematics of both DC and AC-coupled versions are
visible in Figure~@fig:front-end. The AC-coupled version separates the
collection electrode node ($I N \_ A C$) and the front-end input ($I N$)
with a metal-to-metal capacitance $C_(upright("coupling")) approx$
7.9~fF (simulated value). The collection electrode can then be biased at
higher voltages (up to 50~V from design) , but as no increase in signal
amplitude was observed beyond 18~V when testing up to 37~V, all results
in this paper are reported up to 18~V. Since there is no DC path between
the reset transistor $M 0$ and the sensor, leakage current compensation
and sensor reset are provided by the diode inside the collection
electrode. Due to the coupling capacitance, the total capacitance at the
input node is significantly higher than in the DC-coupled case and the
same collected charge will lead to a smaller amplitude signal. The
front-end is identical for the two coupling versions and described in
Section~@sec:front-end.

For consistency with previously published results on non-irradiated
DC-coupled sensors @opamp_2025, the devices are operated at the same
analog front-end settings. Since the leakage current, estimated from the
study of the signal reset @APTSSF_2023, is smaller than the default
reset current (100 pA), the operating point was not changed for
irradiated sensors.

== Analog circuit
<sec:front-end>
The APTS-OA analog front-end provides a low-capacitance load for the
sensor and a signal path designed with buffering for high-speed analog
readout. Each pixel is connected to a source-follower buffer that drives
a fast operational amplifier located at the matrix periphery. The
front-end includes an in-pixel pulsing circuit for charge injection to
support calibration. To maintain signal integrity, the output is matched
to a 50~Ω load via a high-speed amplifier with a 1.9~GHz unity-gain
bandwidth. All bias voltages and currents are supplied externally,
enabling fine control of the operating point , which was experimentally
optimized for minimal timing jitter. The estimated power consumption is
150~μW in-pixel and 3.1~mW in the periphery per pixel~@opamp_2025.

== Readout system
<readout-system>
#figure(image("source/figures/setup.svg", width: 90.0%),
  caption: [
    APTS-OA power, control, and readout setup from @opamp_2025.
  ]
)
<fig:OA-setup>

The APTS-OA test setup (see Figure~@fig:OA-setup) consists of a 5~V
FPGA-based DAQ board (USB-controlled via PC), a proximity board
providing power, biases, and ADC readout, a carrier board to which the
sensor is mounted and wire-bonded, and an oscilloscope with high
sampling rate (40~GS/s) and high bandwidth (13~GHz). Further details are
available in Ref.~@opamp_2025. The carrier board includes four
high-bandwidth SMA connectors linked to the innermost pixels for
oscilloscope readout; in this study, three of the four were used, as one
channel was devoted to the time reference (cf. Section~@sec:TBsetup. The
remaining 13 pixels (12 outer and one inner) were read out via 4~MHz
ADCs on the proximity board.

= Test Beam Measurements
<test-beam-measurements>
The APTS-OA time resolution, detection efficiency and spatial resolution
were characterized with a beam test conducted at the CERN-SPS H6
facility using positive 120~~~ctronvolt/c hadrons~@Banerjee:2774716.

== Test beam telescope
<sec:TBsetup>
#figure(image("source/figures/telescope.svg", width: 95.0%),
  caption: [
    Schematic of the test beam setup showing each detector plane.
  ]
)
<fig:telescope>

The setup, as illustrated in Figure @fig:telescope, consisted of six
planes:

- Planes 0, 1, and 4 are reference planes for track reconstruction.
  ALPIDE sensors @ALPIDE-proceedings-3 were used at a threshold of 100
  and a substrate bias of −3~V.

- Plane 2 is an APTS-OA as the device under test (DUT). DC coupled
  irradiated sensors and an AC-coupled sensor were characterized. The
  DUT was placed on xy moving stages for alignment before testing, and
  the temperature was stabilized at 20~^C~using~a~chiller.

- Plane 3 is an APTS equipped with source-follower (SF) output buffer
  @APTSSF_2023 used as trigger plane. The sensor has a pixel pitch of
  15~μm and is implemented with the modified with gap design. Like the
  DUT, this plane was mounted on xy moving stages. It was operated at a
  substrate bias of −1.2~V and all other biases were set to default
  based on @APTSSF_2023.

- Plane 5 is a low gain avalanche detector (LGAD) produced by Fondazione
  Bruno Kessler @Carnesecchi_2023 used as a time reference. It was
  operated at a bias voltage of 110~V.

A large number of events was accumulated to study the in-pixel
contribution of the lateral electric field on charge collection. The
full statistics collected for each sensor at each bias voltage is
reported in @apx:statistics.

== Data reconstruction and analysis
<data-reconstruction-and-analysis>
=== DUT signal extraction
<dut-signal-extraction>
The analog waveforms, shown in Figure~@fig:waveform, were analyzed
offline following the method described in @opamp_2025. In short, the
signal amplitude of the pixels read out via oscilloscope was extracted
as the difference between the baseline and the underline, computed
respectively as the average over a 2.5~ns window 15~ns before and after
the minimum of the waveform's derivative, t0 in Figure~@fig:waveform.
For the pixels read out via ADC's, amplitude was instead defined as the
difference between the minimum of the signal and the baseline taken four
samples earlier, as described in Ref.~@APTSSF_2023.

#figure(image("source/figures/WFMs_parameters.png", width: 90.0%),
  caption: [
    Typical signals measured after charge injection. The inset shows the
    data ranges used to define the baseline and the underline.
  ]
)
<fig:waveform>

=== DUT signal calibration
<dut-signal-calibration>
To enable comparison across pixels and operating conditions, the
measured signal amplitude was converted into collected charge (in
electrons) using an X-ray calibration, following the method detailed in
@opamp_2025. The spectrum of $""^55$Fe, reported in @apx:xray-spectra,
was fitted with a bimodal Gaussian to deconvolve overlapping $K_alpha$
and $K_beta$ peaks. The fitted mean of the $K_alpha$ peak
($mu_(p e a k)$) was then used for the conversion of millivolts to
electrons via: $ Q = frac(E_gamma, mu_(p e a k) dot.op epsilon.alt) $
where $E_gamma$ is the photon energy, assumed to be 5.9~~~ctronvolt, and
$epsilon.alt$ the average energy required to generate an electron-hole
pair in silicon, assumed to be 3.6~~ctronvolt/. Linearity of the
detector response, assumed in this method, is validated in
@APTSSF_2023@opamp_2025.

=== Clustering
<clustering>
The data provided by the DUT, trigger, and tracking planes were
processed using the Corryvreckan software framework @corryvreckan.
Clusters were formed from adjacent pixels, applying a clusterization
threshold of 100~e#super[−]. For analog sensors, only signals exceeding
an offline-defined charge threshold of three time the noise RMS (cf.
Section~@sec:noise) were considered. Signal amplitudes were converted to
electrons using the calibration described earlier. The seed pixel was
identified as the one with the highest charge in the cluster, and the
cluster position was determined via a charge-weighted center-of-gravity
method.

=== Track reconstruction
<track-reconstruction>
The Corryvreckan framework was used for track reconstruction, and
employs the General Broken Lines (GBL) algorithm @Blobel:2006yi to fit
clusters on the reference planes, accounting for multiple scattering.
Software alignment was carried out by iteratively shifting and rotating
planes relative to a fixed reference to optimize tracking precision. To
ensure unbiased results, the DUT was excluded from the fitting of
tracks. The track position on the DUT plane was determined by
interpolation. The quality of the tracking was granted by the following
cuts: a single cluster was required on every tracking plane, the tracks
were selected based on fit quality ($chi^2 \/ n_(upright("dof")) < 5$),
only single-track events triggered by the APTS-SF were accepted, a
region of interest (ROI) was defined to include only tracks passing
through one of the three central pixels read out via oscilloscope. An
association radius of 25~μm was used to match DUT clusters to tracks,
which demonstrated to provide unbiased efficiency estimation in
Ref.~@opamp_2025. This value was optimized to ensure the efficiency
overestimation is less than 0.05%.

=== Detection efficiency analysis
<detection-efficiency-analysis>
Detection efficiency was evaluated as the fraction of tracks crossing
the ROI that had an associated cluster in one of the three oscilloscope
pixels of the DUT. The above mentioned 25~μm association radius is
intended to reduce bias, ensuring the efficiency overestimation is less
than 0.05% @opamp_2025, given the tracking resolution of
$sigma_(t r a c k) = 2.7 plus.minus$ 0.1~μm, obtained using a telescope
optimizer simulation tool @mager_telescope. Baseline fluctuations were
also analyzed to assess noise. The results are reported using thresholds
above three times the maximum RMS noise.

=== Time resolution analysis
<time-resolution-analysis>
Time residuals are computed as the difference between the APTS-OA DUT
seed pixel time at 10% amplitude and the LGAD reference at 40%, where
the LGAD resolution $sigma_(upright("LGAD")) =$ 23~ps~$plus.minus$~2~ps
@Carnesecchi_2023. This constant-fraction method minimizes time walk and
yields the lowest RMS, as demonstrated in @opamp_2025. The DUT time
resolution is extracted by quadratically subtracting the LGAD resolution
from the standard deviation of the time residuals: $ sigma_"t" = sqrt(sigma_(Delta t)^2 - sigma_"LGAD"^2) $ <eq:time_resolution> assuming statistical independence.

== Results and discussion
<results-and-discussion>
=== Noise
<sec:noise>
The noise was characterized from a series of repeated measurements of a
fixed baseline point acquired at constant bias, and the RMS of the
corresponding distribution was used as the noise estimate.

#figure(grid(columns: (1fr, 1fr), gutter: 6pt,
  align(center)[#image("source/figures/irr/noiseVsVsub.png") \
  (a)],
  align(center)[#image("source/figures/AC/AC_OPAMP_Noise_HV_scan_plot.png") \
  (b)]
),
  caption: [
    The average noise RMS of the three central pixels read out using an
    oscilloscope versus the applied depletion voltage for DC-coupled
    irradiated (a) and AC-coupled sensors (b).
  ]
)
<fig:noise>

Figure~@fig:noise presents the noise RMS as a function of the applied
bias voltage. For the DC-coupled irradiated sensors, shown in
Figure~#link(<fig:noise>)[#ref(<fig:noise>, supplement: none);(a)], the curves demonstrate a decrease in the total
noise level with increasing irradiation damage. Two competing mechanisms
influence the noise after irradiation. On one side, the higher leakage
current increases the intrinsic sensor noise. On the other hand,
irradiation reduces the sensor capacitance. Because the front-end noise
can be represented as a series voltage source~@Rivetti, the
corresponding equivalent noise charge is proportional to the input
capacitance. A lower capacitance therefore decreases the equivalent
noise charge, partially compensating the intrinsic noise increase. It is
worth noting that the APTS-SF showed an opposite result for similar
sensors, with increasing noise levels after irradiation~@APTSSF_2023.
This was finally understood to be caused by the much lower sampling rate
of 4 MS/s in the test setup used for the APTS-SF, introducing a sampling
error of the signal amplitude, manifesting itself as an additional noise
source in the measurement. This effect is more significant for
irradiated sensors, with a faster return to zero due to a larger reset
current setting to accommodate the larger sensor leakage
@sanna2025poster@corentin2025thesis.

The AC-coupled sensor (Figure~#link(<fig:noise>)[#ref(<fig:noise>, supplement: none);(b)]) exhibits a higher RMS
noise, mainly due to the coupling capacitor and the additional parasitic
capacitive load it introduces, leading to a lower voltage excursion at
the circuit input for the same signal charge. Both AC-coupled and
irradiated sensors exhibit a reduction in noise with increasing
substrate bias voltage, consistent with the trends reported in previous
studies~@opamp_2025.

To ensure robust signal discrimination, a threshold of more than three
times the RMS noise distribution has been applied. Timing analysis was
studied only at a threshold of 100.

=== Cluster size
<cluster-size>
Figure~@fig:cs_vdepl shows the average cluster size as a function of the
applied substrate voltage and HV for DC-coupled and AC-coupled sensors
respectively. A clear decreasing trend is observed with increasing bias,
which is expected: as the reverse bias increases, the epitaxial layer of
the sensor is depleted more. This results in reduced charge sharing
between pixels and, consequently, smaller cluster sizes.@opamp_2025

#figure(grid(columns: (1fr, 1fr), gutter: 6pt,
  align(center)[#image("source/figures/irr/averageClusterSizeVsVsub.png") \
  (a)],
  align(center)[#image("source/figures/AC/AC_OPAMP_Cluster_Size_HV_scan_plot.png") \
  (b)]
),
  caption: [
    The average estimated cluster size versus the applied reverse bias
    voltage for DC-coupled irradiated sensors (a) and AC-coupled sensor
    (b).
  ]
)
<fig:cs_vdepl>

The AC-coupled sensor (Figure~#link(<fig:cs_vdepl>)[#ref(<fig:cs_vdepl>, supplement: none);(b)]) follows a trend
consistent with the DC-coupled case. The irradiated sensors
(Figure~#link(<fig:cs_vdepl>)[#ref(<fig:cs_vdepl>, supplement: none);(a)]) exhibit a lower average cluster size,
attributed to charge capturing by trapping centers introduced by
irradiation.

=== Charge collection
<charge-collection>
The cluster charge is defined as the total charge collected by all
pixels belonging to a reconstructed cluster.

#figure(grid(columns: (1fr, 1fr), gutter: 6pt,
  align(center)[#image("source/figures/irr/MPVVsVsub.png") \
  (a)],
  align(center)[#image("source/figures/AC/AC_OPAMP_Fit_MPV_HV_scan_plot.png") \
  (b)]
),
  caption: [
    MPV calculated from Landau-Gauss fit of the charge collection
    distributions versus the applied reverse bias voltage for DC-coupled
    irradiated sensors (a) and AC-coupled sensor (b). The errors are
    statistical only.
  ]
)
<fig:landau_vdepl>

Figure~@fig:landau_vdepl shows the most probable value (MPV) of the
cluster charge collection distributions for the DC-coupled irradiated
(Fig.~#link(<fig:landau_vdepl>)[#ref(<fig:landau_vdepl>, supplement: none);(a)]) and AC-coupled sensor
(Fig.~#link(<fig:landau_vdepl>)[#ref(<fig:landau_vdepl>, supplement: none);(b)]). The cluster charge distributions can be
found in @apx:cluster_charge. In both AC and DC-coupled sensors, the MPV
remains largely independent of the applied bias voltage. This is
expected since the input capacitance suppression is compensated while
applying the charge calibration. In addition, the efficiency at this
threshold (100~e#super[−]) is very close to 100%, therefore all the
charge is collected for any bias voltage.

While the AC-coupled sensor exhibits an MPV consistent with that of the
non-irradiated DC-coupled sensor, the irradiated devices show a
significant reduction in the collected charge. This loss is attributed
to the increased number of trapping centers induced by radiation damage,
consistent with the behavior previously observed in the cluster size
distributions.

=== Detection efficiency
<detection-efficiency>
Figure~@fig:efficiency presents the detection efficiency for the
irradiated sensors (Figure~#link(<fig:efficiency>)[#ref(<fig:efficiency>, supplement: none);(a)]) and AC-coupled sensor
(Figure~#link(<fig:efficiency>)[#ref(<fig:efficiency>, supplement: none);(b)]) as a function of the threshold, for
different irradiation levels and reverse bias voltages respectively.

#figure(grid(columns: (1fr, 1fr), gutter: 6pt,
  align(center)[#image("source/figures/irr/compareEfficiencyThr25um.png") \
  (a)],
  align(center)[#image("source/figures/AC/AC_OPAMP_Eff_vs_thr_HV_scan_modified_with_gap.png") \
  (b)]
),
  caption: [
    Detection efficiency as a function of the applied threshold of
    DC-coupled irradiated sensors at
    \$V\_{\\rm{sub}}=\\SI{-4.8}{\\volt}\$ (a) and AC-coupled sensor at
    different diode voltages (b). The horizontal dashed line indicates
    99% detection efficiency.
  ]
)
<fig:efficiency>

As expected, a clear decrease in detection efficiency is observed with
increasing threshold. Both design variants---non-irradiated DC-coupled
and AC-coupled sensors---achieve a detection efficiency greater than 99%
up to a threshold of 150, in agreement with the results reported in
Ref.~@opamp_2025, thus offering a robust operational margin.

A more detailed study of NIEL effects on charge collection efficiency is
reported in Figure~#link(<fig:efficiency_99p>)[#ref(<fig:efficiency_99p>, supplement: none);(a)], showing the maximum
threshold at which 99% detection efficiency is reached as a function of
reverse bias voltage. As the irradiation level increases, an efficiency
of 99% can only be maintained at lower threshold values, reducing, as
expected, the operational margin. These results further support the
interpretation of more effective charge recombination at the pixel
periphery, as suggested by the reduced average cluster size
(Figure~#link(<fig:cs_vdepl>)[#ref(<fig:cs_vdepl>, supplement: none);(a)]), as well as the overall charge-collection
degradation (Figure~#link(<fig:landau_vdepl>)[#ref(<fig:landau_vdepl>, supplement: none);(a)]) with increasing NIEL. The
corresponding impact on time resolution will be shown in
Figure~@fig:3sigma_rms_vsub_irr.

#figure(grid(columns: (1fr, 1fr), gutter: 6pt,
  align(center)[#image("source/figures/irr/threshold_vs_vbb.png") \
  (a)],
  align(center)[#image("source/figures/AC/AC_OPAMP_THR99_HV_scan_plot.png") \
  (b)]
),
  caption: [
    Maximum threshold at which the sensor achieves 99% detection
    efficiency as a function of the applied reverse bias voltage for
    DC-coupled irradiated sensors (a) and AC-coupled sensor (b).
  ]
)
<fig:efficiency_99p>

=== Timing
<timing>
Figure~@fig:time_res shows the time residuals of the DC-coupled
irradiated sensors and AC-coupled sensor in blue.

#figure(grid(columns: (1fr, 1fr), gutter: 6pt,
  align(center)[#image("source/figures/irr/Pi1_non_vs_corrected_residuals.png") \
  (a)],
  align(center)[#image("source/figures/irr/Pi3_non_vs_corrected_residuals.png") \
  (b)],
  align(center)[#image("source/figures/AC/AC_OPAMP_non_vs_corrected_residuals_HV_4.8.png") \
  (c)]
),
  caption: [
    Time residuals of DC-coupled sensors irradiated to 1~×~10#super[14]
    (a), 1~×~10#super[15] (b) at
    $V_(upright("sub")) = −4.8 med upright("V")$ and AC-coupled sensor
    at \$V\_{\\rm{HV}}=\\SI{4.8}{\\volt}\$. The bottom horizontal axis
    corresponds to the time residual distribution before correction
    shown in blue. The top horizontal axis corresponds to the time
    residual distribution after a time walk-like correction shown in
    orange.
  ]
)
<fig:time_res>

As previously reported @opamp_2025, the measured time reference signals
are delayed relative to those from the DUT, resulting in negative time
residuals (see Eq.~@eq:time_resolution). Despite efforts to minimize the
influence of signal amplitude on timing by using constant fraction
discrimination, the presence of a longer tail in the positive direction
of the time residual distribution indicates residual time walk. This is
further supported by a correlation between time residuals and the DUT
seed signal amplitude, already observed in @opamp_2025.

Time walk persists because constant fraction discrimination only
eliminates it when the signal shape is consistent, and in this case, the
signal shape varies with both the amount of collected charge and the
position of ionization within the pixel. Therefore, an additional
correction based on cluster size is applied to help better remove the
contribution of time walk to the time residuals, as proposed
in~@Braach_2023), classifying data into single- and multi-pixel
clusters. For each group, a quadratic interpolation of mean time
residuals vs. signal amplitude is performed. To avoid biasing the
results, the interpolation is performed on half of the data and
subtracted from the other half, and vice versa. The two corrected halves
are finally merged for the analysis. Two metrics are used to evaluate
the residual time spread: (1) the overall RMS, and (2) the RMS of the
central 99.7% (hereafter called $3 sigma$ RMS) of the distribution.

The time residual distributions for the irradiated sensors, shown in
Figure~#link(<fig:time_res>)[#ref(<fig:time_res>, supplement: none);(a)] and ~#link(<fig:time_res>)[#ref(<fig:time_res>, supplement: none);(b)], exhibit an asymmetric
shape with a $3 sigma$ RMS.

#figure(grid(columns: (1fr, 1fr), gutter: 6pt,
  align(center)[#image("source/figures/irr/timeResolutionsVsVsub.png") \
  (a)],
  align(center)[#image("source/figures/irr/correctedTimeResolutionsVsVsub.png") \
  (b)]
),
  caption: [
    The time residual width versus the applied reverse bias voltage of
    DC-coupled irradiated sensors before (a) and after (b) a time
    walk-like correction. The time resolution is determined by
    quadratically subtracting the time resolution of the LGAD used as a
    time reference from the 3$sigma$ standard deviation of the time
    residuals.
  ]
)
<fig:3sigma_rms_vsub_irr>

The difference becomes more pronounced at lower reverse bias voltages,
as illustrated in Figure~#link(<fig:3sigma_rms_vsub_irr>)[#ref(<fig:3sigma_rms_vsub_irr>, supplement: none);(a)]. This behavior
is attributed to a higher probability of charge recombination for hits
farther from the collection electrode, arising from radiation-induced
trapping centers, as confirmed by the cluster size (Fig.@fig:cs_vdepl).
As a result, the tail at high time residuals is more suppressed
comparing to the non-irradiated sensor @opamp_2025, leading to a reduced
overall RMS.

When applying residual-time-walk correction, the $3 sigma$ RMS values
become compatible between irradiated and non-irradiated sensors at low
substrate bias (Figure~#link(<fig:3sigma_rms_vsub_irr>)[#ref(<fig:3sigma_rms_vsub_irr>, supplement: none);(b)]). The impact of
radiation on the time resolution is driven by two competing mechanisms.
First, radiation damage degrades the time resolution, mainly due to
signal loss caused by reduced electric field and carrier trapping, as
seen in the 1~×~10#super[15] sensor. Second, a partial compensating
effect arises because radiation preferentially suppresses the slow
component of the signal, most evident in the 1~×~10#super[14] sensor.

To further investigate this effect, a radial selection within the pixel
was performed using tracking-based spatial information.
Figure~@fig:3sigma_rms_vsub_irr_radii shows that, at small distances
from the collection electrode, the non-irradiated sensor demonstrates
better time resolution. However, when including signals from the pixel
periphery, a rapid degradation in timing performance is observed for the
non-irradiated sensor. This increase is significantly milder in
irradiated devices and is attributed to charge recombination reducing
contributions from slow-drifting carriers near the sensor edges, as
previously discussed.

A residual-time-walk correction proves to be an effective method for
mitigating these peripheral effects.

#figure(grid(columns: (1fr, 1fr), gutter: 6pt,
  align(center)[#image("source/figures/irr/before_corr_cuts_time_resolution.png") \
  (a)],
  align(center)[#image("source/figures/irr/after_corr_cuts_time_resolution.png") \
  (b)]
),
  caption: [
    Time resolution for different in-pixel cuts of DC-coupled irradiated
    sensors at $V_(upright("sub")) = −4.8 med upright("V")$ before (a)
    and after (b) a time walk-like correction. The time resolution is
    determined by quadratically subtracting the time resolution of the
    LGAD used as a time reference from the 3$sigma$ standard deviation
    of the time residuals.
  ]
)
<fig:3sigma_rms_vsub_irr_radii>

In summary, under optimal operating conditions with full depletion at a
substrate bias of −4.8~V, the sensor irradiated to 1~×~10#super[14]
achieves a time resolution of 62.4~±~1.0~ps, closely matching the
62.7~±~1.6~ps measured for the non-irradiated device. A performance
degradation of approximately 10% is observed for sensor irradiated to
1~×~10#super[15], for which a time resolution of 68.6~±~1.0~ps is
measured.

Regarding the results for the time resolution of the AC-coupled sensor,
the effect of the increased electric field at the collection electrode
was investigated by varying the high voltage from 4.8 to 18~V. As in the
previous case, the time-walk correction is applied to the time residual
distribution (Fig.~#link(<fig:time_res>)[#ref(<fig:time_res>, supplement: none);(c)]) to reduce its asymmetric shape. The
effect of the time-walk correction is shown in
Figure~@fig:AC_3sigma_rms_vsub_AC. The overall time resolution improves
consistently at all voltage values. The $3 sigma$ RMS of the time
distribution confirms this trend, showing progressively better timing
performance with increasing bias, and reaching the value of
67.2~±~3.6~ps at 18~V, where the time resolution becomes comparable to
that of the DC-coupled sensor biased at −4.8~V~@opamp_2025 within twice
the uncertainty.

#figure(image("source/figures/AC/AC_OPAMP_time_resolution_HV_scan_plot.png"),
  caption: [
    The time resolution versus the applied reverse bias voltage before
    (a) and after (b) a time walk-like correction. The errors are
    statistical only. The dashed line at $63 med upright("ps")$
    represents the time resolution reached using a DC-coupled non
    irradiated sensor.
  ]
)
<fig:AC_3sigma_rms_vsub_AC>

#figure(grid(columns: (1fr, 1fr), gutter: 6pt,
  align(center)[#image("source/figures/AC/AC_OPAMP_Uncorrected_Time_Resolution_Radius_scan_plot_merged_HV.png") \
  (a)],
  align(center)[#image("source/figures/AC/AC_OPAMP_Corrected_Time_Resolution_Radius_scan_plot_merged_HV.png") \
  (b)]
),
  caption: [
    The time resolution for different in-pixel cuts of AC-coupled
    sensors at all bias voltages before (a) and after (b) a time
    walk-like correction. The time resolution is determined by
    quadratically subtracting the time resolution of the LGAD used as a
    time reference from the 3$sigma$ standard deviation of the time
    residuals.
  ]
)
<fig:3sigma_rms_vsub_AC_merged_HV>

Figure~#link(<fig:3sigma_rms_vsub_AC_merged_HV>)[#ref(<fig:3sigma_rms_vsub_AC_merged_HV>, supplement: none);(b)] confirms that, as in case
of the DC-coupled sensor, a smaller radial cuts allows for a better
timing resolution, as charge collection is dominated by drift under the
collection diode.

The results indicate that the input capacitance seen by the front-end of
the AC-coupled sensor is higher, resulting in a reduced signal-to-noise
ratio, as also indicated by the noise measurements. This, in turn, leads
to a larger jitter contribution to the time resolution compared to the
DC-coupled configuration.

= Conclusions
<conclusions>
This work presents the performance of analog pixel test structures
(APTS) fabricated using the 65~nm TPSCo CMOS imaging technology, with a
particular focus on radiation hardness and a comparison between
different sensor coupling schemes to the front-end electronics.

The APTS-OA sensor was integrated into a beam telescope to evaluate its
time resolution, charge collection, and detection efficiency using
minimum ionizing particles. The DC-coupled sensors exhibited excellent
radiation tolerance, maintaining consistent timing performance up to a
fluence of 1~×~10#super[14], and achieving detection efficiencies
exceeding 99% at a substrate voltage of −4.8~V with a threshold of 100.

AC-coupled sensors, similarly, showed a good operational margin, with
efficiencies well above 99% for clusterization thresholds lower than
150~e#super[−]. AC coupling allows the sensor to be reverse biased
beyond the limits of the DC-coupled version, leading to observable
improvements in time resolution up to 18 V. However, due to the lower
signal amplitude introduced by AC coupling, the signal-to-noise ratio is
smaller than in the DC configuration, making the jitter contribution
more significant. At high reverse bias, the AC-coupled version reaches a
time resolution comparable to the DC-coupled one. This demonstrates the
viability of both approaches, while also highlighting the potential
benefit of combining the small capacitance of the DC-coupled design with
the high reverse bias capability of the AC-coupled configuration to
achieve further improvements in time resolution.

These results highlight the potential of the 65~nm CMOS imaging process,
particularly with regard to radiation hardness and high-precision timing
capabilities. Monolithic active pixel sensors based on this technology
are strong candidates for future high-energy physics vertex and timing
detectors, such as the one foreseen for ALICE 3 time-of-flight, but also
for broader applications requiring precise timing.

#heading(level: 1, numbering: none)[Acknowledgements]
<acknowledgements>
This project has received funding from the European Union's Horizon
Europe research and innovation programme under grant agreement No
\101057511. Funding sources: (1) Project "Dipartimenti di eccellenza" at
the Dept of Physics, University of Turin, funded by Italian MIUR. (2)
The National Research Foundation of Korea (NRF) grant funded by the
Korean government (MSIT) (No. 2022R1A6A3A03054907) Project 2022LJT55R,
Concession Decree No. 104 of 02.02.2022 adopted by the Italian Ministry
of University and Research, cup D53D23002810006. The measurements
leading to these results have been performed at the SPS Test Beam
Facility at CERN (Switzerland). We would like to thank the coordinators
at CERN for their valuable support of these test beam measurements and
for the excellent test beam environment. ITS3 R&D and construction is
supported by several ITS3 project grants including LM2023040 of the
Ministry of Education, Youth, and Sports of the Czech Republic and
Suranaree University of Technology, the National Science and Technology
Development Agency (JRA-CO-2563-12905-TH, P-2050706), and the NSRF via
the Program Management Unit for Human Resources & Institutional
Development, Research and Innovation (PMU-B B47G670091) of Thailand.

= Statistics acquired.
<apx:statistics>
#block[
#figure(
  align(center)[#table(
    columns: 5,
    align: (right,center,center,center,center,),
    table.header([DUT], table.cell(align: center, colspan: 4)[#block[
      #figure(
        align(center)[#table(
          columns: 1,
          align: (center,),
          [Irradiated],
          [1~×~10#super[14]],
        )]
        , caption: [Number of events]
        , kind: table
        )

      ] <tab:statistics_1e14>],),
    table.hline(),
    [$V_(upright("sub"))$], [−1.2~V], [−2.4~V], [−3.6~V], [−4.8~V],
    [All events], [70,000], [70,000], [90,000], [735,000],
    [Coincident events], [3,271], [3,214], [3,412], [37,618],
  )]
  , caption: [Number of events]
  , kind: table
  )

] <tab:statistics_1e14>
#block[
#figure(
  align(center)[#table(
    columns: 5,
    align: (right,center,center,center,center,),
    table.header([DUT], table.cell(align: center, colspan: 4)[#block[
      #figure(
        align(center)[#table(
          columns: 1,
          align: (center,),
          [Irradiated],
          [1~×~10#super[15]],
        )]
        , caption: []
        , kind: table
        )

      ] <tab:statistics_1e15>],),
    table.hline(),
    [$V_(upright("sub"))$], [−1.2~V], [−2.4~V], [−3.6~V], [−4.8~V],
    [All events], [670,000], [60,000], [60,000], [830,000],
    [Coincident events], [32,107], [3,129], [3,180], [34,111],
  )]
  , caption: []
  , kind: table
  )

] <tab:statistics_1e15>
#block[
#figure(
  align(center)[#table(
    columns: 6,
    align: (right,center,center,center,center,center,),
    table.header([DUT], table.cell(align: center, colspan: 4)[AC-coupled], [],),
    table.hline(),
    [$V_(upright("HV"))$], [4.8~V], [7.2~V], [10.8~V], [14.4~V], [18.0~V],
    [All events], [210,000], [220,000], [346,000], [210,000], [70,000],
    [Coincident
    events], [10,356], [11,077], [17,215], [10,800], [3,549],
  )]
  , caption: []
  , kind: table
  )

] <tab:statistics_ac>
The statistics of the total events triggered by the beam is reduced to
about 5% due to the large acceptance of the trigger plane, the signal
extraction method cut, and the clusterization threshold.

= X-ray spectra.
<apx:xray-spectra>
#figure(grid(columns: (1fr, 1fr), gutter: 6pt,
  align(center)[#image("source/figures/fe55Spectra.png") \
  (a)],
  align(center)[#image("source/figures/fe55Spectra_calibrated.png") \
  (b)]
),
  caption: [
    X-ray spectra from DC-coupled irradiated (at
    $V_(upright("sub")) = −4.8 med upright("V")$) and AC-coupled sensors
    (at $V_(upright("HV")) = 4.8 med upright("V")$) in mV (a) and
    converted to electrons (b).
  ]
)
<fig:x-ray>

Figure #link(<fig:x-ray>)[#ref(<fig:x-ray>, supplement: none);(a)] shows the X-ray spectra of irradiated and
AC-coupled sensors. For the AC-coupled sensor, the $K_alpha$ peak shows
up at lower amplitude than the DC-coupled sensors due to a higher total
capacitance. Irradiation damage decreases the energy resolution of the
sensor and so broadens the $K_alpha$ peak, as also seen in~@APTSSF_2023.
A corresponding apparent reduction in capacitance, reflected in the
variation of signal amplitudes between irradiated and non-irradiated
devices, in qualitative agreement with the acceptor-removal mechanism.
The conversion to electrons (Fig.#link(<fig:x-ray>)[#ref(<fig:x-ray>, supplement: none);(b)]) effectively equalizes the
peak positions, differences due to the different sensor energy
resolution remain.

= Charge collection Landau distribution.
<apx:cluster_charge>
#figure(grid(columns: (1fr, 1fr), gutter: 6pt,
  align(center)[#image("source/figures/irr/non_gain_calibrated_merged_cluster_signal_amplitude_Landau_fit_charge.png") \
  (a)],
  align(center)[#image("source/figures/AC/AC_OPAMP_non_gain_calibrated_merged_cluster_signal_amplitude_Landau_fit_charge_HV_4.8V_paper_plots.png") \
  (b)],
  align(center)[#image("source/figures/AC/AC_OPAMP_non_gain_calibrated_merged_cluster_signal_amplitude_Landau_fit_charge_HV_7.2V_paper_plots.png") \
  (c)],
  align(center)[#image("source/figures/AC/AC_OPAMP_non_gain_calibrated_merged_cluster_signal_amplitude_Landau_fit_charge_HV_10.8V_paper_plots.png") \
  (d)],
  align(center)[#image("source/figures/AC/AC_OPAMP_non_gain_calibrated_merged_cluster_signal_amplitude_Landau_fit_charge_HV_14.4V_paper_plots.png") \
  (e)],
  align(center)[#image("source/figures/AC/AC_OPAMP_non_gain_calibrated_merged_cluster_signal_amplitude_Landau_fit_charge_HV_18.0V_paper_plots.png") \
  (f)]
),
  caption: [
    Charge collection distributions of DC-coupled irradiated sensors at
    $V_(upright("sub")) = −4.8 med upright("V")$ (a) and the AC-coupled
    sensor at \$V\_{\\rm{HV}}=\\SI{4.8}{\\volt}\$,
    $7.2 med upright("V")$, $10.8 med upright("V")$,
    $14.4 med upright("V")$ and $18 med upright("V")$ (b, c, d, e and f,
    respectively). The data are shown in the shaded histogram with a
    solid line showing the result from a Landau+Gaussian fit. The dashed
    line shows the fit result outside of the fitting region.
  ]
)
<fig:landau_dist>

#bibliography("references.bib", style: "ieee", title: [References])
