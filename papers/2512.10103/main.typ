#set page(paper:"a4",margin:23mm,numbering:"1")
#set text(font:"Libertinus Serif",size:10.5pt)
#set par(justify:true,leading:.6em)
#set heading(numbering:"1.1")
#set math.equation(numbering:"(1)")
#show figure.caption: set text(size:9pt)
#align(center)[
  #text(size:16pt,weight:"bold")[Investigation of Real-Space Transfer Noise in InP Quantum Wells]
  #v(.6em)
  #link("https://orcid.org/0009-0005-0736-3554")[Jiayin Zhang]#super[1], #link("https://orcid.org/0000-0001-8667-1208")[Anthony J. Ardizzi]#super[1], #link("https://orcid.org/0000-0002-8214-8265")[Kieran A. Cleary]#super[2], and #link("https://orcid.org/0000-0002-9671-9540")[Austin J. Minnich]#super[1]
  #v(.5em)
  #super[1] Division of Engineering and Applied Science, California Institute of Technology, Pasadena, CA, USA \
  #super[2] Division of Physics, Mathematics, and Astronomy, California Institute of Technology, Pasadena, CA 91125, USA \
  Corresponding author #link("mailto:aminnich@caltech.edu")
]

*Abstract.* Indium phosphide (InP) high electron-mobility transistors (HEMTs) are widely used in many fields such as quantum computing because of their unparalleled microwave noise performance. Achieving improved noise performance requires a physical understanding of the noise mechanisms. Here, we experimentally test a theoretical proposal for drain (output) noise as originating in part from real-space transfer (RST) by characterizing the microwave noise temperature of transfer-length method structures with the same channel composition but two different barrier compositions. This choice was made to alter the confining potential of electrons in the channel, thereby affecting the RST mechanism, while avoiding changes to the channel transport properties. We observe trends of noise temperature with physical temperature and source-drain voltage which are compatible with the predictions of RST noise theory. This finding supports the hypothesis that RST contributes to drain noise in HEMTs.

= Introduction
<introduction>
Low noise amplifiers (LNAs) based on InP HEMTs are widely used in fields
such as radio astronomy, weather and climate studies, and quantum
computing due to their excellent noise performance at room and cryogenic
temperatures
@bardin_microwaves_2021@pospieszalski_extremely_2005@krantz_quantum_2019.
Indium phosphide (InP) HEMTs currently exhibit the best noise
performance among all HEMT techonologies. For state-of-the-art InP
HEMTs, the reported cryogenic noise figures are around 5 times the
standard quantum limit in the 1 - 100 GHz frequency range
@schleeh_characterization_2013@cuadrado-calle_broadband_2017@jo_l_2020@cha_inp_2020@heinz_50-nm_2021@cha_optimization_2023@li_investigation_2024.

To further improve noise performance, understanding the physical origin
of the noise is of high importance. According to the Pospieszalski
model, noise in HEMTs is attributed to gate noise and drain noise at the
input and output of the device, respectively
@pospieszalski_modeling_1989. It is generally accepted that gate noise
originates from Nyquist-Johnson noise in the gate metal at the gate
physical temperature
@pospieszalski_dependence_2017@schleeh_phonon_2015@ardizzi_anthony_j_self-heating_2022.
Drain noise, on the other hand, has traditionally been used as a fitting
parameter without an accepted physical explanation. One of the earliest
theories by Pucel et al. attributed drain noise to the generation of
dipole layers @pucel_signal_1975. Several studies have proposed that
drain noise arises from suppressed shot noise
@gonzalez_noise_1997@pospieszalski_limits_2017, while others suggested
the origin as impact ionization
@shigekawa_impact-ionization-induced_1999@ruiz_impact_2019@yuce_large-signal_2024.

A recent theoretical study by Esho et al. attributed drain noise to the
real-space transfer (RST) mechanism @esho_theory_2022. Real-space
transfer is a process in which channel electrons are thermionically
emitted over the confining potential at the heterointerface into the
adjacent barrier film, thereby transferring their location in real
space. It is distinguished from intervalley scattering in which
electrons change their state in reciprocal space rather than real
space@price_intervalley_1960. Real-space transfer is possible in HEMTs
because electric fields may exceed 20 kV/cm under the gate, heating the
electrons out of equilibrium with the lattice to temperatures exceeding
1000 K. @schwierz_modern_2003@shah_investigation_1981 Real-space
transfer was originally proposed as a means to achieve negative
differential resistance via transport parallel to an interface,
@hess_negative_1979 and various transferred-electron devices have been
proposed based on this effect @kastalsky_novel_1983@luryi_charge_1984.
Microwave partition noise arises from real-space transfer because the
electrical transport properties of the channel and barrier films are
very different, satisfying the requirements of the partition noise
mechanism @ambrozy_electronic_1982.

The investigation of RST as contributing to microwave noise of quantum
wells has a long history. Aninkevičius et al. attributed the hot
electron noise in the AlGaAs/GaAs heterostructure to
RST@aninkevicius_comparative_1993. Matulionis et al. experimentally
studied microwave noise in InAlAs/InGaAs/InAlAs quantum wells,
confirming that there exists a strong dependence of drain noise on the
electric field that was attributed to RST
@matulionis_qw-shape-dependent_1997. It was also reported that
increasing the conduction band offset in the InP HEMT heterojunction
improves quantum confinement and thus suppress RST noise
@matulionis_hot-electron_1999. Recently, Gabritchidze et al.
characterized GaAs mHEMTs and provided evidence that RST contributes to
drain noise in HEMT devices @gabritchidze_experimental_2022. Li et al.
also attributed the excess noise part of the drain noise to RST noise in
state-of-the-art InP HEMTs @li_epitaxial_2024. However, additional
direct evidence for the contribution of RST to microwave noise in InP
quantum wells used in modern HEMTs, without the complication of the
additional noise sources present in full HEMTs, is important to further
validate the RST theory.

Here, we report an experimental study of microwave noise in
transfer-length method (TLM) structures fabricated on state-of-art
epitaxial quantum wells used for InP HEMTs. By characterizing gate-less
devices, the contribution of the gate noise is eliminated. Two sets of
ungated HEMT devices are fabricated on two InP substrates, with the only
difference being the barrier indium composition. This approach allows
the confining potential of the electrons in the channel to be modified,
thereby affecting the RST mechanism, while avoiding any change to the
transport properties of the channel electrons. The measured trends are
in good qualitative agreement with a model which attributes noise to a
combination of thermal and RST noise. This finding suggests that drain
noise in InP HEMTs arises from the same mechanisms and that RST noise
could be suppressed by improving quantum confinement of channel
electrons.

= Theory
<sec:theory>
We begin by presenting the equations for noise temperature that will be
used to interpret the experimental measurements. Our model for microwave
noise in the TLM structures attributes the noise to two components:
noise from the RST mechanisms with a noise temperature $T_(R S T)$, and
thermal noise from the electron gas at the physical electron temperature
$T_(upright("e"))$. We first consider the noise contributed by RST as
derived by Esho et al. @esho_theory_2022. The RST partition velocity
fluctuation noise power spectral density $S_(nu \, R S T)$ can then be
written as (see @hartnagel_microwave_2001 Eq. 9.6) as:
$ S_(nu \, R S T) = 4 frac(n_(c h) n_(b a), n^2) \( v_(c h) - v_(b a) \)^2 frac(overline(tau)_(R S T), 1 + \( omega overline(tau)_(R S T) \)^2) $<eq:RST2>
where $n_(c h)$ ($n_(b a)$) is the carrier density in the channel
(barrier), $v_(c h)$ ($v_(b a)$) is the drift velocity in the channel
(barrier), $n = n_(c h) + n_(b a)$ is the total carrier density,
$omega = 2 pi f$ is the angular frequency, and $overline(tau)_(R S T)$
is the RST relaxation time.

The Ramo-Shockley theorem can be used to relate the velocity fluctuation
and current noise power spectral densities (see
@hartnagel_microwave_2001 Eq 8.4):
$ S_I = frac(e^2 n W, L) S_nu $<eq:RST3> where $e$ is the electron
charge, and $W$ and $L$ are the width and length of the channel,
respectively.

Since emission across the channel-barrier interface is thermionic, the
barrier electron density $n_(b a)$ depends on the channel electron
density $n_(c h)$ (see @sze_physics_2007 Ch. 3 Eq. 61) as:
$ n_(b a) = gamma eta n_(c h) $<eq:RST4> where $gamma$ is the
probability for a hot electron to emit across the barrier,
$eta = exp \[ - Delta E_c \/ \( k_B T_e \) \]$, is the fraction of
electrons with sufficient thermal energy to cross the interface, $T_e$
is the electron temperature, and $Delta E_c$ is the conduction band
offset between InGaAs and In$""_x$Al$""_(1 - x)$As. For simplicity, we
assume $gamma = 1$ in this study.

The effective noise temperature for an arbitrary current noise power
spectral density in the direction parallel to an applied electric field
$E$ can be defined using the generalized Johnson-Nyquist equation as:
$ T_(N \, \| \|) \( E \) = frac(S_(I \| \|) \( E \) Re \( Z_(\| \|) \( E \) \), 4 k_B) $<eq:RST5>
where $k_B$ is the Boltzmann constant, and $Re \( Z_(\| \|) \( E \) \)$
is the real part of the electrical impedance along the direction of the
applied field @hartnagel_microwave_2001.

Finally, we consider the limit
$omega overline(tau)_(R S T) lt.double 1$, which is justified in the
microwave regime of approximately $f < 100$~GHz because
$overline(tau)_(R S T) tilde.op 10$ ps, @hartnagel_microwave_2001 and
$v equiv v_(c h) gt.double v_(b a)$ due to the much higher mobility of
the channel compared to the barrier. Combining the above equations, we
obtain the RST noise temperature ($T_(R S T)$) as:

$ T_(R S T) \( E \) = frac(e^2 n v \( E \)^2 overline(tau)_(R S T), k_B) W_(upright("re")) / L_(upright("re")) frac(eta \( E \), \( 1 + eta \( E \) \)^2) Re \( Z \( omega \, E \) \) $<eq:TRST>
where $W_(upright("re"))$ and $L_(upright("re"))$ are the width and
length of the recess, respectively.

For the thermal noise of the channel electrons, an expression for
$T_(upright("e"))$ is obtained using the standard formula for Joule
heating of electrons with electric field $E$ and assuming electrons lose
energy to the lattice with an energy relaxation time $tau_E$
@matulionis_qw-shape-dependent_1997:
$ T_e \( E \) = T_(l a t) + frac(e mu \( E \) overline(tau)_E, k_B) E^2 $<eq:Te>
where $T_(l a t)$ is the lattice temperature which is assumed to be the
ambient temperature, $mu$ is the channel electron mobility, and
$overline(tau)_E$ is the electron energy relaxation time.

The final expression for the drain noise along the direction of the
applied field ($T_(N \| \|)$) can then be written as:

$ T_(N \| \|) \( E \) = T_(R S T) \( E \) + T_e \( E \) $<eq:TN>

because the thermal and RST noise sources are uncorrelated. For fitting
purposes, the hot-electron energy relaxation time $overline(tau)_E$ and
the RST relexation time $overline(tau)_(R S T)$ are the only free
fitting parameters.

= Experiment
<experiment>
== Sample fabrication
<sec:Fabrication>
#figure([#box(image("source/Figures/Fig1_Structure.png", width: 100.0%))],
  caption: [
    #strong[\(a)] Cross section schematic of the ungated HEMT device.
    The epitaxial layers are grown on an InP substrate. From bottom to
    top, the epitaxial layers include a 500 nm
    In$""_(upright("0.52"))$Al$""_(upright("0.48"))$As buffer, a 15 nm
    In$""_(upright("0.53"))$Ga$""_(upright("0.47"))$As channel, a 9 nm
    In$""_(upright("x"))$Al$""_(upright("1-x"))$As barrier/spacer, a 4
    nm InP etch stop, and a 20 nm
    In$""_(upright("0.53"))$Ga$""_(upright("0.47"))$As cap. The $delta$
    doping is located at 4 nm above the channel. A recess with
    controlled recess length $L_(upright("re"))$ is etched on the cap to
    the etch stop. #strong[\(b)] Top view SEM image of the ungated HEMT
    device. The cross section shown in (a) is located at the center of
    the device.
  ]
)
<fig:DeviceSEM>

TLM structures were fabricated on epitaxial films with the structure
shown in @fig:DeviceSEM\(a). The
wafers were grown by molecular beam epitaxy by IntelliEpi. Two sets of
samples were used in which the substrates were identical except for the
barrier (In$""_x$Al$""_(1 - x)$As) Indium composition, $x$. For the
lattice-matched sample (LM), $x = 0.52$, and for the tensile-barrier
sample (TB), $x = 0.45$. With these barrier compositions, the conduction
band offsets ($Delta E_c$) of the LM sample and TB samples were
calculated as 0.52 eV and 0.66 eV, respectively, using conduction band
offsets and bowing parameter values from Vurgaftman et al
@vurgaftman_band_2001. As a result, the channel transport properties of
each sample are nominally the same, but the electrons have greater
quantum confinement in the TB sample.

The substrates were diced into $1 times 1$ cm#super[2] chips for further
processing. Each TLM structure was designed as a co-planar wave guide
(CPW). @fig:DeviceSEM shows a top view scanning electron
microscope (SEM) image of the device. This design enabled the devices to
be mounted in a home-built cryogenic probe station for three-pin
ground-source-ground (GSG) probing @russell_cryogenic_2012. The samples
were fabricated with various recess lengths ($L_(upright("re"))$) of 1,
3, 8, 13, and 18 μm. The side wall of the recess was fixed to be 1~μm
away from the edge of the source and drain metal, such that the distance
between the Ohmic contacts ($L_c$) was 3, 5, 10, 15, and 20 μm,
respectively.

Two other sets of devices were fabricated to determine the contact
resistance using the TLM method in
@lamarre_ohmic_1993@lee_theoretical_2021. One set of devices had fixed
$L_(upright("re")) = 1$ μm and varying $L_c =$ 3, 5, 10, 15, and 20 μm,
while the other set had no recess ($L_(r e) = 0$) but the same variation
in $L_c$. The latter set was used to determine the contact resistance
and sheet resistivity of the cap layer. With these three sets of
devices, contact resistance, and sheet resistances of the cap and
channel, as well as the effective channel-barrier resistivity, were
determined. These sets of devices were then patterned periodically
across the $1 times 1$ cm#super[2] chip.

For fabrication of devices for microwave noise characterization, mesas
were first created by wet etching. A citric acid and hydrogen peroxide
mixture was used to selectively etch the InGaAs cap layer, hydrochloric
acid was used to selectively etch the InP etch stop, and a phosphoric
acid and hydrogen peroxide mixture was used to etch into the buffer.
Then an Ohmic contact metal stack of Pt/Ti/Pt/Au (9/15/15/20 nm) at the
source and drain was deposited by electron-beam evaporation. The
room-temperature contact resistance to the cap was measured to be 40
m$Omega$ mm. The recess was patterned by electron beam lithography and
was etched to the InP etch stop using a citric acid/hydrogen peroxide
mixture. Next, the overlay metallization layer of Ti/Au (10/300 nm) was
deposited by electron beam evaporation, and the devices were passivated
with 30 nm of Al$""_(upright("2"))$O$""_(upright("3"))$ using thermal
ALD at 300 °C. Finally, the overlay metallization pads were plated with
$tilde.op 3$ μm of Au using electroplating for probing.

== Microwave characterization
<sec:Measurement>
We measured the microwave S-parameters and noise temperature with
50~$Omega$ source impedance ($T_50$) in a custom-built probe station.
The probe station has been described previously @russell_cryogenic_2012,
with some modifications made for this work. In particular, the
modifications enabled noise measurements of lossy two-port devices such
as the TLM structures measured here, in contrast to active HEMTs with
gain; as well as pulsed measurements to enable sufficiently high biases
to observe RST noise while minimizing excessive self-heating of the
samples.

Full details of the calibration, measurement, and data processing
procedure are available in @ardizzi_variable_2025. In brief, pulsed
biasing was performed using an arbitrary waveform generator, which
supplied voltage pulses with a 20~ms period and 500~$mu$s pulse width,
for a duty cycle of 2.5%. Voltage and current time series were measured
simultaneously with both S-parameter and noise measurements on an
oscilloscope using a custom high-speed current probe. The pulse
parameters were chosen to avoid excessive Joule heating of the channel,
which has been shown to mask and in some cases suppress RST
@hartnagel_microwave_2001. The pulse duration was limited by the
time-domain resolution of the vector network analyzer (VNA) used for
S-parameter measurements. In general, the DUT gain can be extracted from
Y-factor measurements, but since the resistance of the ungated
structures changes appreciably over the range of biases measured here,
the impedance match becomes poor at high biases and must be considered
in the analysis.

The microwave noise temperature ($T_50$) in 4-8 GHz was measured using
the Y-factor method @arthur_measurement_1974. Noise power at the output
of the probe station was measured using a home-built backend receiver
with an InP-based low-noise amplifier (Low Noise Factory LNF-LNC4\_8C)
as the first stage amplifier. A mixer was used to down-convert from
5~GHz into an 800~MHz wide band centered at DC, with a 27.5~MHz
high-pass filter employed to avoid 1/f noise. A zero-bias tunnel-diode
detector with ultra-fast response time of $tilde.op 5$~ns was used to
linearly convert RF noise power into a DC voltage. A time series
measurement was then performed using an oscilloscope, synchronized with
the pulse biasing and IV-curve oscilloscope measurement.

The backend noise temperature referred to the input of the output probe
tip was measured using the Y-factor method, with a room-temperature and
liquid nitrogen cooled 50~$Omega$ load at the probe station input as the
hot and cold reference loads, respectively. The value was measured as
$T_(upright("BE")) = 132 plus.minus 9$~K. Corrections were applied to
account for the S-parameters and physical temperature of the coaxial
cabling from the probe station input to the probe tip (See SI of Ref.
@ardizzi_self-heating_2022).

A high excess-noise-ratio noise source (ENR$tilde.op 25$~dB at 5~GHz;
model MMW TECHNOLOGY INC 10MHz--40GHz NOISE SOURCE S/M12) was used to
supply input noise. The Y-factor method, along with the previously
measured $T_(upright("BE"))$, was used to calibrate the noise
temperature at the output of the input probe tip. These were measured to
be $T_h = 40916 plus.minus 822$~K and $T_c = 295.2 plus.minus 0.9$~K at
5~GHz with the noise source on and off, respectively. This temperature
range enabled accurate noise measurements at high biases where the DUT
noise is in excess of 10,000~K and the loss approaches $20$~dB, while
sacrificing measurement precision at low biases where the noise is on
the order of room temperature. The S-Parameter and Y-factor noise power
of a series of TLM structures of differing gate recess lengths were then
measured over a range of biases, and $T_50$ was extracted using the
measurements of $T_(upright("BE"))$, $T_h$ and $T_c$. In order to
extract the effective noise temperature of the recessed region of the
device, impedance mismatch corrections were applied to extract the noise
temperature of the lumped TLM device (a full description of this
correction is given in Section II of @ardizzi_variable_2025, see
specifically equation 11). The noise contributions from the access
region, particularly the ohmic contacts and unetched cap, were then
assumed to be negligible compared to the noise originating in the
recessed region since the access region noise does not depend on bias
and can contribute at most thermal noise.

= Results
<results>
== DC and RF characteristics
<sec:Data>
We begin by showing representative I-V characteristics for the LM device
in @fig:Spar\(a). In the low-bias linear regions of the
I-V curves, longer gate recesses produce IV curves with smaller slopes
due to the larger total resistance of the longer channel. All I-V curves
eventually saturate at high bias. From these measurements, electron
mobilities ($mu$) and drift velocities ($v$) can be obtained for further
analysis.

The electric field in the channel is determined from the TLM geometry,
contact resistance, and applied bias. To do so, the resistance of the
bias lines was measured by landing on an open gold pad, yielding the
voltage dropped only across the DUT. Then, the total resistance of the
device was compared to the statistical average of 5 nominally identical
devices, and the difference was attributed to a difference in contact
resistance. This offset was then subtracted from the nominal
(statistically averaged) contact resistance to find the per-device
contact resistance, yielding the voltage $V_(c h)$ dropped across the
channel. The electric field was then computed as
$E = V_(c h) \/ L_(upright("re"))$. While the variation in contact
resistance was typically better than 5%, the above calibration procedure
was found to produce the best agreement in drift velocity versus
electric field across devices of different channel lengths. As shown in
the inset of @fig:Spar\(a), the drift velocities collapse
onto a single curve when plotted versus electric field, as expected.

The microwave S-parameters were also measured as shown in
@fig:Spar. The devices are poorly matched to 50 $Omega$,
especially at higher biases. For example, for a $L_(upright("re"))$ = 13
μm device on the LM sample between 3.5 - 8.5 GHz, $S_11$ is
approximately 5 $Omega$. However, this mismatch is accounted for using
the methods described in @ardizzi_variable_2025.

#figure([#box(image("source/Figures/Fig2_RawData.png", width: 100.0%))],
  caption: [
    #strong[\(a)] Room-temperature I-V characteristics of the LM device.
    Inset: drift velocity versus electric field. #strong[\(b)]
    Representative $S_11$ data on a LM device with $L_(upright("re"))$ =
    13 μm from 3.5 - 8.5 GHz.
  ]
)
<fig:Spar>

We next present the raw data from the microwave noise measurement.
@fig:ZoomedYfactor\(a) plots a representative hot noise
voltage time series data (for simplicity, cold noise voltage data is not
shown). The upper panel shows the pulsed bias applied to the device with
a 20~ms period and 500~$mu$s pulse width. The lower panel shows the
measured hot noise power with pulsed biasing. The first
$tilde.op 0.08$~s shows the zero-power voltage offset ($V_0$)
calibration for the tunnel-diode detector.

@fig:ZoomedYfactor shows a magnified view of an individual
bias pulse and the associated change in noise voltage. In this case, the
noise, loss, and impedance mismatch all simultaneously increase with
bias, ultimately manifesting as a decrease in measured noise power with
bias. The noise voltage measured with the bias on was averaged across
all 20 pulses, yielding the average hot noise power arriving at the
detector. The Y-factor was then calculated by repeating this procedure
with the noise source off and calculating the ratio
$Y = \( overline(V)_(upright("N,Hot")) - overline(V)_(0 \, upright("Hot")) \) \/ \( overline(V)_(upright("N,Cold")) - overline(V)_(0 \, upright("Cold")) \)$,
where $overline(V)_(upright("N,Hot"))$ and
$overline(V)_(upright("N,Cold"))$ are the averaged hot and cold noise
power with the noise source on, respectively, and
$overline(V)_(0 \, upright("Hot"))$ and
$overline(V)_(0 \, upright("Cold"))$ are the hot and cold noise power
with the noise source off, respectively.

#figure([#box(image("source/Figures/Fig3_Yfactor.png", width: 100.0%))],
  caption: [
    #strong[\(a)] Representative raw noise power data versus time for a
    LM sample with recess length $L_(upright("re"))$ = 13 μm at 5 GHz
    and room temperature. The pulsed bias $V_(upright("ds,Hot"))$ (black
    line) and the diode detector hot voltage $V_(upright("N,Hot"))$
    (orange line) are shown. #strong[\(b)] Zoom-in view of (a) showing a
    single bias pulse and the noise power data respectively. The offset
    between the bias pulse and noise measurement is due to a slight
    difference in trigger timing between the noise voltage and bias
    voltage oscilloscopes, which is accounted for in software.
  ]
)
<fig:ZoomedYfactor>

== Microwave noise temperature
<sec:NoiseTemp>
We next present the microwave noise data obtained from the Y-factor
measurements. The lumped noise temperature of the DUT is extracted from
the measured Y-factor. This lumped noise consists of the noise from the
access regions and the intrinsic channel region. Since the noise from
the access regions for all devices does not vary with bias, the
bias-dependence of the lumped noise temperature coincides with that of
the intrinsic channel region.

#figure([#box(image("source/Figures/Fig4_Lre_LMTB.png", width: 100.0%))],
  caption: [
    #strong[\(a)] Noise temperature parallel to the channel
    ($T_N \| \|$) of LM sample vs electric field. All data are taken at
    5 GHz at room temperature. #strong[\(b)] Analogous plot for TB
    sample.
  ]
)
<fig:TNvsLre>

@fig:TNvsLre\(a) plots the measured noise
temperature of devices of all recess lengths on the LM sample. All
devices show an initial increase in noise with field, followed by a
rapid increase in noise at an electric field value that depends on the
recess length, $L_(r e)$. For the $L_(upright("re"))$ = 18 μm device,
this field is around 2.5 kV/cm, while for the $L_(upright("re"))$ = 1 μm
device, this increase is not observed until approximately 5.3 kV/cm.
This recess-length-dependent trend can also be observed on the devices
fabricated on the TB chip, as shown in
@fig:TNvsLre\(b). From these measurements,
it is observed that with a shorter recess length, the rapid increase in
noise temperature occurs at a higher electric field.

The qualitative features in @fig:TNvsLre are compatible with
expectations from RST noise theory. As discussed in
@hartnagel_microwave_2001, a length-dependence for the onset of the
rapid increase in noise can be attributed to the following mechanism.
For longer recesses, the transit time from source to drain is longer,
increasing the probability that channel electrons will thermionically
emit into the barrier. This point implies that even at the same electric
field, the noise for a device with a longer recess will be higher
because of the higher probability of real-space transfer. An additional
conclusion is that the noise trend measured in this study is unlikely to
be caused by impact ionization, which is not expected to exhibit a
length dependence of noise for a given electric field.

== Comparison to noise model
#label("sec:RSTModel fitting")
#figure([#box(image("source/Figures/Fig5_TvsE.png", width: 100.0%))],
  caption: [
    Noise temperature parallel to the channel ($T_N \| \|$) of LM and TB
    samples versus electric field. The black (orange) data are taken on
    $L_(upright("re"))$ = 13 μm devices on the LM (TB) sample at 5 GHz
    at room temperature. The dashed lines are the predicted electron
    temperature ($T_e$) from #link(<eq:Te>)[\[eq:Te\]]. The dash-dotted
    lines are the calculated real-space transfer noise ($T_(R S T)$)
    from the model described in #link(<eq:TN>)[\[eq:TN\]]. The solid
    lines are the combined noise temperature predicted by the electron
    temperature and the real-space transfer model. Inset: low field
    region, showing that both fitted model and the measured data are
    about 300 K at zero field.
  ]
)
<fig:TNvsEfield_LMTB>

We now use the noise model from #link(<sec:theory>)[2] to interpret the
experimental data. @fig:TNvsEfield_LMTB presents the noise
temperature ($T_(N \| \|)$) of both LM and TB samples versus electric
field for $L_(upright("re"))$ = 13 μm devices on both LM and TB samples
at 5 GHz at room temperature shown in @fig:TNvsLre. The black
dashed lines in @fig:TNvsEfield_LMTB are the predicted
electron temperature ($T_e$) calculated by #link(<eq:Te>)[\[eq:Te\]]. By
fitting #link(<eq:Te>)[\[eq:Te\]] to the measured data in the low-field
region, the electron energy relaxation time-constant $overline(tau)_E$
was obtained. For this pair of devices, $overline(tau)_E$ is 1.40 ps for
the LM sample and 1.96 ps for the TB sample. These values are in
semi-quantitative agreement with values reported previously (c.f.
@matulionis_hot-electron_1999 Table I). The inset of
@fig:TNvsEfield_LMTB shows that for both LM and TB samples,
at zero field and room temperature, the fitted and measured noise data
are approximately 300 K, as expected.

The RST temperature ($T_(R S T)$) and the total noise temperature along
the direction of the applied field ($T_(N \| \|)$) are calculated by the
model described in #link(<eq:TRST>)[\[eq:TRST\]] and
#link(<eq:TN>)[\[eq:TN\]], respectively. In the model, the carrier
density $n$ is obtained from Hall measurements, the drift velocity of
the electrons $v$ is obtained from the I-V curves shown in
@fig:Spar\(a), and the resistance of the channel
$Re \( Z \( omega \, E \) \)$ is taken from the TLM calibration of the
fabricated devices. The RST relaxation time constant
$overline(tau)_(R S T)$ is fitted to the measured data to yield
$overline(tau)_(R S T) = 40$~ps (6 ps) for the LM (TB) sample. This is
on the order of published literature results on similar structures which
estimated RST relaxation times on the order of $tilde.op 50 - 100$~ps
(c.f. Ref. @hartnagel_microwave_2001 Ch. 17.1).

#figure([#box(image("source/Figures/Fig6_TvsE_allRecess.png", width: 100.0%))],
  caption: [
    #strong[\(a)] Noise temperature parallel to the channel
    ($T_N \| \|$) of LM sample (black data) and TB sample (orange data)
    vs electric field. The data are taken on $L_(upright("re"))$ = 1 μm
    devices at 5 GHz at room temperature. The black line is the
    calculated noise from the model of the LM sample. The orange line is
    the calculated noise from the model of the TB sample.#strong[\(b)]
    Respective data taken and calculated on $L_(upright("re"))$ = 3 μm
    devices. #strong[\(c)] Respective data taken and calculated on
    $L_(upright("re"))$ = 8 μm devices. #strong[\(d)] Respective data
    taken and calculated on $L_(upright("re"))$ = 18 μm devices.
  ]
)
<fig:TN_All>

The noise model predicts a quasi-exponential dependence of $T_(R S T)$
on electric field, since $T_(R S T)$ depends exponentially on $T_e$
through $eta \( E \)$, and $T_e$ depends in turn on $E^2$. As shown in
@fig:TNvsEfield_LMTB, the contribution of $T_(R S T)$ is
almost zero until the electric field reaches approximately 1.9 kV/cm. At
about 2.8 kV/cm, the contribution of $T_(R S T)$ surpasses the
contribution of $T_e$, and dominates the overall noise contributions.
The combined solid curve calculated from #link(<eq:TN>)[\[eq:TN\]]
qualitatively captures this exponential dependence on noise temperature
and matches the measured data.

@fig:TN_All plots the measured noise data and the calculated
noise temperature of $L_(upright("re"))$ = 1 μm, $L_(upright("re"))$ = 3
μm, $L_(upright("re"))$ = 8 μm, and $L_(upright("re"))$ = 18 μm for LM
and TB samples. For $L_(upright("re"))$ = 1 μm and $L_(upright("re"))$ =
3 μm devices, at the largest electric field we measured, the TB devices
exhibit higher noise temperature. For $L_(upright("re"))$ = 8 μm and
$L_(upright("re"))$ = 18 μm, the relationship is similar to that of the
$L_(upright("re"))$ = 13 μm devices presented in
@fig:TNvsEfield_LMTB. These measurements show that the
influence of RST is less pronounced for the shorter recess lengths,
consistent with the results in @fig:TNvsLre and those
reported previously @hartnagel_microwave_2001. Additionally, at low
field, the TB samples exhibit higher noise than the LM samples,
indicated also by a larger extracted energy relaxation time.

This dependence of energy relaxation time on strain has been observed in
the InGaAs quantum well literature @matulionis_hot-electron_1999. A
possible explanation is as follows: the strain near the channel/barrier
interface tends to increase the energy of optical phonons, which are
responsible for the majority of electron-phonon interactions at room
temperature. Since the electron-phonon interaction occurs primarily with
the hottest electrons (those in the high-energy tail of the hot-electron
distribution), the increase in phonon energy leads to an increase in the
steady-state electron temperature at which the energy input from the
bias is balanced by energy loss to the lattice. This effect has also
been attributed to the higher mobility observed in strained-channel
devices @malmkvist_epitaxial_2008.

While this contribution runs opposite to the reduction in RST noise for
the TB sample, we emphasize that the noise in the LM sample increases
above the noise in the TB sample at sufficiently high electric field,
indicating that the RST mechanism ultimately dominates at high fields.
This is particularly evident in $L_(upright("re"))$ = 8 μm,
$L_(upright("re"))$ = 13 μm, and $L_(upright("re"))$ = 18 μm devices.
For devices $L_(upright("re"))$ = 1 μm and $L_(upright("re"))$ = 3 μm,
in our measurement range, which is limited by the error of the Y factor
measurement, the TB samples still exhibit a higher noise temperature,
but trends indicate that at a higher electric field, the noise
temperature of the LM samples will eventually surpass the TB samples as
in devices of longer recess lengths.

We attribute the model overestimation, for example between 2~kV/cm and
3~kV/cm for the $L_(upright("re"))$ = 13 μm devices in
@fig:TNvsEfield_LMTB, to two factors. First, the noise model
does not consider the effects of convective noise which arise from
fluctuations in the carrier mobility, and which can partially suppress
current fluctuations in cases where the mobility decreases with
increasing energy @skullerud_longitudinal_1969@gantsevich_theory_1979 as
is the case in semiconductors. Second, in the region where $T_(N \| \|)$
changes most rapidly with $E$, the model is sensitive to changes in
several parameters including the electric field value, the impedance
correction, and the extracted $mu \( E \)$ and $v \( E \)$. It is
possible that that small errors in these calibrations will influence the
quantitative trend from the model. However, it is clear that the model
qualitatively captures the key trends in the noise data, providing
support for the physical origin of the microwave noise as a combination
of thermal and RST noise.

= Discussion
<discussion>
This study has shown that a noise model consisting of thermal and RST
noise can account for the experimental trends of TLM devices. In
particular, the observations of a rapid increase in noise above a
certain electric field, the dependence of that electric field value on
recess length, and the varying contribution of RST noise for different
recess lengths, are all compatible with the predictions of RST theory.
The predicted dependence of the noise on the barrier composition is also
observed. This finding agrees with prior studies of microwave noise in
quantum wells, for instance by Aninkevičius et al. for AlGaAs/GaAs
quantum wells. @aninkevicius_comparative_1993 Our study shows these
effects, previously observed in other quantum wells, remain relevant for
state-of-the-art InP HEMT epitaxial materials. The good qualitative
agreement with the RST model proposed by Esho et al. provides further
evidence that RST contributes to microwave noise.

A relevant question is whether the noise mechanisms identified in this
study occur in the operational conditions of HEMTs. In actual InP HEMTs,
the electric field under the gate is inhomogeneous and can be more than
20 kV/cm locally @chen_effect_2021. In this study, the highest electric
field reached is only around 8 kV/cm. Further, the highest electric
fields in HEMTs occur over tens of nanometers, while the minimum recess
length in this study is 1 $mu$m, and for these shorter recess lengths,
RST was found to be less pronounced.

The RST mechanism will play a role in HEMT noise if electrons are heated
to high enough temperatures that they can thermionically emit into the
barrier. It is well-known that electric fields in HEMTs occurring at the
low-noise bias point can heat electrons significantly out of equilibrium
with the lattice to temperatures exceeding 1000 K, even though the
highest fields exist only over tens of nanometers. @schwierz_modern_2003
If this were not the case, impact ionization and other high-bias effects
would not occur. This temperature is hot enough to enable a fraction of
a percent of channel electrons to thermionically emit into the barrier,
producing a few hundred K of noise. @esho_theory_2022 Therefore, this
analysis and the findings of this study support the hypothesis that
drain noise in HEMTs can be attributed to a combination of thermal and
RST noise.

= Summary
<summary>
We have performed an experimental study of the microwave noise
characteristics of InP TLM structures. The measured trends of noise for
the two sample types are compatible with noise as arising from a
combination of thermal and real-space transfer noise. This finding is
expected to translate to the operational conditions of InP HEMTs. The
contribution of RST to drain noise could potentially be mitigated by
improving the quantum confinement of channel electrons, for instance by
altering the alloy composition of the barrier.

#block[
The authors thank Akim Babenko, Bekari Gabritchidze, Jan Grahn, Pekka
Kangaslahti, Jacob Kooi, and Junjie Li for useful discussions. This work
was sponsored by the Keck Institute for Space Studies and the National
Science Foundation under Grant No.~2511983. We gratefully acknowledge
the critical support and infrastructure provided for this work by The
Kavli Nanoscience Institute at the California Institute of Technology.

]

#let references = ```bib
@misc{ardizzi_variable_2025,
      title={Variable-temperature attenuator calibration method for on-wafer microwave noise characterization of low-noise amplifiers},
      author={Anthony J. Ardizzi and Jiayin Zhang and Akim A. Babenko and Kieran A. Cleary and Austin J. Minnich},
      year={2025},
      eprint={2511.13619},
      archivePrefix={arXiv},
      primaryClass={physics.ins-det},
      url={https://arxiv.org/abs/2511.13619},
}

@inproceedings{yuce_large-signal_2024,
	address = {Fort Lauderdale, FL, USA},
	title = {Large-{Signal} {Modeling} of a 50 nm {mHEMT} {Incorporating} a {Physical} {Impact}-{Ionization} {Model}},
	copyright = {https://doi.org/10.15223/policy-029},
	isbn = {979-8-3315-4124-8},
	url = {https://ieeexplore.ieee.org/document/10745715/},
	doi = {10.1109/BCICTS59662.2024.10745715},
	urldate = {2025-10-27},
	booktitle = {2024 {IEEE} {BiCMOS} and {Compound} {Semiconductor} {Integrated} {Circuits} and {Technology} {Symposium} ({BCICTS})},
	publisher = {IEEE},
	author = {Yüce, Yasin and Albahrani, Sayed Ali and Schwantuschke, Dirk and Moulin, Maxime and Leuther, Arnulf},
	month = oct,
	year = {2024},
	pages = {42--45},
}

@inproceedings{ruiz_impact_2019,
	address = {San Francisco, CA, USA},
	title = {Impact {Ionization} {Control} in 50 nm {Low}-{Noise} {High}-{Speed} {InP} {HEMTs} with {InAs} {Channel} {Insets}},
	copyright = {https://doi.org/10.15223/policy-029},
	isbn = {978-1-7281-4032-2},
	url = {https://ieeexplore.ieee.org/document/8993654/},
	doi = {10.1109/IEDM19573.2019.8993654},
	urldate = {2025-10-27},
	booktitle = {2019 {IEEE} {International} {Electron} {Devices} {Meeting} ({IEDM})},
	publisher = {IEEE},
	author = {Ruiz, Diego C. and Saranovac, Tamara and Han, Daxin and Ostinelli, Olivier and Bolognesi, C.R.},
	month = dec,
	year = {2019},
	pages = {9.3.1--9.3.4},
}

@article{cuadrado-calle_broadband_2017,
	title = {Broadband {MMIC} {LNAs} for {ALMA} {Band} 2+3 {With} {Noise} {Temperature} {Below} 28 {K}},
	volume = {65},
	copyright = {https://creativecommons.org/licenses/by/3.0/legalcode},
	issn = {0018-9480, 1557-9670},
	url = {https://ieeexplore.ieee.org/document/7836302/},
	doi = {10.1109/TMTT.2016.2639018},
	number = {5},
	urldate = {2025-09-06},
	journal = {IEEE Transactions on Microwave Theory and Techniques},
	author = {Cuadrado-Calle, David and George, Danielle and Fuller, Gary A. and Cleary, Kieran and Samoska, Lorene and Kangaslahti, Pekka and Kooi, Jacob W. and Soria, Mary and Varonen, Mikko and Lai, Richard and Mei, Xiaobing},
	month = may,
	year = {2017},
	pages = {1589--1597},
}

@article{heinz_50-nm_2021,
	title = {A 50-nm {Gate}-{Length} {Metamorphic} {HEMT} {Technology} {Optimized} for {Cryogenic} {Ultra}-{Low}-{Noise} {Operation}},
	volume = {69},
	copyright = {https://creativecommons.org/licenses/by/4.0/legalcode},
	issn = {0018-9480, 1557-9670},
	url = {https://ieeexplore.ieee.org/document/9459460/},
	doi = {10.1109/TMTT.2021.3081710},
	number = {8},
	urldate = {2025-09-06},
	journal = {IEEE Transactions on Microwave Theory and Techniques},
	author = {Heinz, Felix and Thome, Fabian and Leuther, Arnulf and Ambacher, Oliver},
	month = aug,
	year = {2021},
	pages = {3896--3907},
}

@article{aninkevicius_comparative_1993,
	title = {Comparative analysis of microwave noise in {GaAs} and {AlGaAs}/{GaAs} channels},
	volume = {36},
	copyright = {https://www.elsevier.com/tdm/userlicense/1.0/},
	issn = {00381101},
	url = {https://linkinghub.elsevier.com/retrieve/pii/003811019390174O},
	doi = {10.1016/0038-1101(93)90174-O},
	language = {en},
	number = {9},
	urldate = {2025-08-20},
	journal = {Solid-State Electronics},
	author = {Aninkevičius, V. and Bareikis, V. and Liberis, J. and Matulionis, A. and Sakalas, P.},
	month = sep,
	year = {1993},
	pages = {1339--1343},
}

@article{hess_negative_1979,
	title = {Negative differential resistance through real-space electron transfer},
	volume = {35},
	issn = {0003-6951, 1077-3118},
	url = {https://pubs.aip.org/apl/article/35/6/469/46110/Negative-differential-resistance-through-real},
	doi = {10.1063/1.91172},
	abstract = {A new mechanism is proposed to obtain negative differential resistance in layered heterostructures for conduction parallel to the interface. The mechanism is based on hot-electron thermionic emission from high-mobility GaAs into low-mobility AlxGa1−xAs. Preliminary calculations indicate that high peak-to-valley ratios can be achieved. The transfer speed is estimated to be of the order of 10−11 s. We further show that the concept of hot-electron thermionic emission can be applicable to a variety of devices.},
	language = {en},
	number = {6},
	urldate = {2025-08-20},
	journal = {Applied Physics Letters},
	author = {Hess, K. and Morkoç, H. and Shichijo, H. and Streetman, B. G.},
	month = sep,
	year = {1979},
	pages = {469--471},
}

@article{gonzalez_noise_1997,
	title = {Noise suppression due to long-range {Coulomb} interaction: crossover between diffusive and ballistic transport regimes},
	volume = {12},
	issn = {0268-1242, 1361-6641},
	shorttitle = {Noise suppression due to long-range {Coulomb} interaction},
	url = {https://iopscience.iop.org/article/10.1088/0268-1242/12/8/001},
	doi = {10.1088/0268-1242/12/8/001},
	number = {8},
	urldate = {2025-08-20},
	journal = {Semiconductor Science and Technology},
	author = {González, T and Bulashenko, O M and Mateos, J and Pardo, D and Reggiani, L and Rubí, J M},
	month = aug,
	year = {1997},
	pages = {1053--1056},
}

@incollection{pucel_signal_1975,
	title = {Signal and {Noise} {Properties} of {Gallium} {Arsenide} {Microwave} {Field}-{Effect} {Transistors}},
	volume = {38},
	isbn = {978-0-12-014538-6},
	url = {https://linkinghub.elsevier.com/retrieve/pii/S0065253908612056},
	language = {en},
	urldate = {2025-08-20},
	booktitle = {Advances in {Electronics} and {Electron} {Physics}},
	publisher = {Elsevier},
	author = {Pucel, Robert A. and Haus, Hermann A. and Statz, Hermann},
	year = {1975},
	doi = {10.1016/S0065-2539(08)61205-6},
	pages = {195--265},
}

@article{pospieszalski_extremely_2005,
	title = {Extremely low-noise amplification with cryogenic {FETs} and {HFETs}: 1970-2004},
	volume = {6},
	copyright = {https://ieeexplore.ieee.org/Xplorehelp/downloads/license-information/IEEE.html},
	issn = {1527-3342},
	shorttitle = {Extremely low-noise amplification with cryogenic {FETs} and {HFETs}},
	url = {http://ieeexplore.ieee.org/document/1511915/},
	doi = {10.1109/MMW.2005.1511915},
	number = {3},
	urldate = {2025-08-07},
	journal = {IEEE Microwave Magazine},
	author = {Pospieszalski, M.W.},
	month = sep,
	year = {2005},
	pages = {62--75},
}

@article{bardin_microwaves_2021,
	title = {Microwaves in {Quantum} {Computing}},
	volume = {1},
	copyright = {https://creativecommons.org/licenses/by/4.0/legalcode},
	issn = {2692-8388},
	url = {https://ieeexplore.ieee.org/document/9318753/},
	doi = {10.1109/JMW.2020.3034071},
	number = {1},
	urldate = {2025-08-07},
	journal = {IEEE Journal of Microwaves},
	author = {Bardin, Joseph C. and Slichter, Daniel H. and Reilly, David J.},
	month = jan,
	year = {2021},
	pages = {403--427},
}

@article{chen_effect_2021,
	title = {Effect of {Fixed} {Charges} at {Interface} {Between} {InP} and {Bonding} {Layer} on {Heterogeneous} {Integration} of {InP} {HEMTs}},
	volume = {68},
	copyright = {https://ieeexplore.ieee.org/Xplorehelp/downloads/license-information/IEEE.html},
	issn = {0018-9383, 1557-9646},
	url = {https://ieeexplore.ieee.org/document/9385930/},
	doi = {10.1109/TED.2021.3066139},
	number = {5},
	urldate = {2025-07-28},
	journal = {IEEE Transactions on Electron Devices},
	author = {Chen, Yao and Yang, Lin-An and Jin, Zhi and Su, Yong-Bo and Hao, Yue},
	month = may,
	year = {2021},
	pages = {2226--2232},
}

@article{lee_theoretical_2021,
	title = {Theoretical and experimental analysis of the source resistance components in {In0}.{7Ga0}.{3As} quantum-well high-electron-mobility transistors},
	volume = {78},
	copyright = {http://www.springer.com/tdm},
	issn = {0374-4884, 1976-8524},
	url = {http://link.springer.com/10.1007/s40042-021-00096-0},
	doi = {10.1007/s40042-021-00096-0},
	language = {en},
	number = {6},
	urldate = {2025-07-11},
	journal = {Journal of the Korean Physical Society},
	author = {Lee, In-Geun and Ko, Dae-Hong and Yun, Seung-Won and Kim, Jun-Gyu and Jo, Hyeon-Bhin and Kim, Dae-Hyun and Tsutsumi, Takuya and Sugiyama, Hiroki and Matsuzaki, Hideaki},
	month = mar,
	year = {2021},
	note = {Publisher: Springer Science and Business Media LLC},
	pages = {516--522},
}

@inproceedings{pospieszalski_dependence_2017,
	address = {Phoenix, AZ, USA},
	title = {On the dependence of {FET} noise model parameters on ambient temperature},
	isbn = {978-1-5090-3446-8},
	url = {http://ieeexplore.ieee.org/document/7885975/},
	doi = {10.1109/RWS.2017.7885975},
	urldate = {2025-06-12},
	booktitle = {2017 {IEEE} {Radio} and {Wireless} {Symposium} ({RWS})},
	publisher = {IEEE},
	author = {Pospieszalski, Marian W.},
	month = jan,
	year = {2017},
	pages = {159--161},
}

@article{shigekawa_impact-ionization-induced_1999,
	title = {Impact-ionization-induced noise in {InGaAs}-based 0.1-μm-gate {HEMTs}},
	volume = {272},
	copyright = {https://www.elsevier.com/tdm/userlicense/1.0/},
	issn = {09214526},
	url = {https://linkinghub.elsevier.com/retrieve/pii/S0921452699003397},
	doi = {10.1016/S0921-4526(99)00339-7},
	number = {1-4},
	urldate = {2025-06-11},
	journal = {Physica B: Condensed Matter},
	author = {Shigekawa, N},
	month = dec,
	year = {1999},
	pages = {562--564},
}

@article{shah_investigation_1981,
	title = {{INVESTIGATION} {OF} {HOT} {CARRIER} {RELAXATION} {WITH} {PICOSECOND} {LASER} {PULSES}},
	volume = {42},
	issn = {0449-1947},
	url = {http://www.edpsciences.org/10.1051/jphyscol:1981755},
	doi = {10.1051/jphyscol:1981755},
	number = {C7},
	urldate = {2025-06-11},
	journal = {Le Journal de Physique Colloques},
	author = {Shah, J.},
	month = oct,
	year = {1981},
	pages = {C7--445--C7--462},
}

@article{matulionis_hot-electron_1999,
	title = {Hot-electron energy relaxation, noise, and lattice strain in {InGaAs} quantum well channels},
	volume = {74},
	issn = {0003-6951, 1077-3118},
	url = {https://pubs.aip.org/apl/article/74/13/1895/70002/Hot-electron-energy-relaxation-noise-and-lattice},
	doi = {10.1063/1.123705},
	abstract = {Energy loss by hot electrons in lattice-matched and strained InGaAs layers is estimated from experimental data on microwave noise obtained for InP-based quantum well channels containing two-dimensional electron gas. A strong correlation of the energy relaxation time and the lattice strain is observed.},
	language = {en},
	number = {13},
	urldate = {2025-06-11},
	journal = {Applied Physics Letters},
	author = {Matulionis, A. and Aninkevičius, V. and Liberis, J. and Matulionienė, I. and Berntgen, J. and Heime, K. and Hartnagel, H. L.},
	month = mar,
	year = {1999},
	pages = {1895--1897},
}

@article{matulionis_qw-shape-dependent_1997,
	title = {{QW}-{Shape}-{Dependent} {Hot}-{Electron} {Velocity} {Fluctuations} in {InGaAs}-{Based} {Heterostructures}},
	volume = {204},
	copyright = {http://doi.wiley.com/10.1002/tdm\_license\_1.1},
	issn = {03701972, 15213951},
	url = {https://onlinelibrary.wiley.com/doi/10.1002/1521-3951(199711)204:1<453::AID-PSSB453>3.0.CO;2-V},
	doi = {10.1002/1521-3951(199711)204:1<453::AID-PSSB453>3.0.CO;2-V},
	language = {en},
	number = {1},
	urldate = {2025-06-11},
	journal = {physica status solidi (b)},
	author = {Matulionis, A. and Aninkevičius, V. and Berntgen, J. and Gasquet, D. and Liberis, J. and Matulionienė, I.},
	month = nov,
	year = {1997},
	pages = {453--455},
}

@article{cha_optimization_2023,
	title = {Optimization of {Channel} {Structures} in {InP} {HEMT} {Technology} for {Cryogenic} {Low}-{Noise} and {Low}-{Power} {Operation}},
	volume = {70},
	copyright = {https://ieeexplore.ieee.org/Xplorehelp/downloads/license-information/IEEE.html},
	issn = {0018-9383, 1557-9646},
	url = {https://ieeexplore.ieee.org/document/10070577/},
	doi = {10.1109/TED.2023.3255160},
	number = {5},
	urldate = {2025-06-11},
	journal = {IEEE Transactions on Electron Devices},
	author = {Cha, Eunjung and Wadefalk, Niklas and Moschetti, Giuseppe and Pourkabirian, Arsalan and Stenarson, Jörgen and Li, Junjie and Kim, Dae-Hyun and Grahn, Jan},
	month = may,
	year = {2023},
	pages = {2431--2436},
}

@article{li_investigation_2024,
	title = {Investigation of {Noise} {Properties} in the {InP} {HEMT} for {LNAs} in {Qubit} {Amplification}: {Effects} {From} {Channel} {Indium} {Content}},
	volume = {12},
	copyright = {https://creativecommons.org/licenses/by-nc-nd/4.0/},
	issn = {2168-6734},
	shorttitle = {Investigation of {Noise} {Properties} in the {InP} {HEMT} for {LNAs} in {Qubit} {Amplification}},
	url = {https://ieeexplore.ieee.org/document/10454583/},
	doi = {10.1109/JEDS.2024.3371905},
	urldate = {2025-06-11},
	journal = {IEEE Journal of the Electron Devices Society},
	author = {Li, Junjie and Bergsten, Johan and Pourkabirian, Arsalan and Grahn, Jan},
	year = {2024},
	pages = {243--248},
}

@article{esho_theory_2022,
	title = {Theory of drain noise in high electron mobility transistors based on real-space transfer},
	volume = {131},
	issn = {0021-8979, 1089-7550},
	url = {https://pubs.aip.org/jap/article/131/8/085111/2836567/Theory-of-drain-noise-in-high-electron-mobility},
	doi = {10.1063/5.0069352},
	abstract = {High electron mobility transistors are widely used as microwave amplifiers owing to their low microwave noise figure. Electronic noise in these devices is typically modeled by noise sources at the gate and drain. While consensus exists regarding the origin of the gate noise, that of drain noise is a topic of debate. Here, we report a theory of drain noise as a type of partition noise arising from real-space transfer of hot electrons from the channel to the barrier. The theory accounts for the magnitude and dependencies of the drain temperature and suggests strategies to realize devices with lower noise figure.},
	language = {en},
	number = {8},
	urldate = {2025-06-11},
	journal = {Journal of Applied Physics},
	author = {Esho, Iretomiwa and Choi, Alexander Y. and Minnich, Austin J.},
	month = feb,
	year = {2022},
	pages = {085111},
}

@inproceedings{gabritchidze_experimental_2022,
	address = {Denver, CO, USA},
	title = {Experimental {Characterization} of {Temperature}-{Dependent} {Microwave} {Noise} of {Discrete} {HEMTs}: {Drain} {Noise} and {Real}-{Space} {Transfer}},
	copyright = {https://doi.org/10.15223/policy-029},
	isbn = {978-1-66549-613-1},
	shorttitle = {Experimental {Characterization} of {Temperature}-{Dependent} {Microwave} {Noise} of {Discrete} {HEMTs}},
	url = {https://ieeexplore.ieee.org/document/9865505/},
	doi = {10.1109/IMS37962.2022.9865505},
	urldate = {2025-06-11},
	booktitle = {2022 {IEEE}/{MTT}-{S} {International} {Microwave} {Symposium} - {IMS} 2022},
	publisher = {IEEE},
	author = {Gabritchidze, Bekari and Cleary, Kieran and Kooi, Jacob and Esho, Iretomiwa and Readhead, Anthony C. and Minnich, Austin J.},
	month = jun,
	year = {2022},
	pages = {615--618},
}

@article{luryi_charge_1984,
	title = {Charge injection transistor based on real-space hot-electron transfer},
	volume = {31},
	issn = {1557-9646},
	url = {https://ieeexplore.ieee.org/document/1483901/},
	doi = {10.1109/T-ED.1984.21616},
	abstract = {We describe a new transistor based on hot-electron transfer between two conducting layers separated by a potential barrier. The mechanism of its operation consists of controlling charge injection over the barrier by modulating the electron temperature in one of the layers. This physical principle is different from those employed in all previous three-terminal amplifying devices-which are based either on the modulation of a potential barrier (vacuum triode, bipolar transistor, various analog transistors) or on the modulation of charge in a resistive channel (field effect transistors). In contrast to this, the present device can be compared to a hypothetical vacuum diode whose cathode has an effective electron temperature which is controlled without inertia by an input electrode ("cathode heater"). The device has been implemented in an AlGaAs/GaAs heterojunction structure. One of the conducting layers is realized as an FET channel, the other as a heavily doped GaAs substrate. The layers are separated by an AlxGa1 - xAs graded barrier. Application of a source-to-drain field leads to a heating of channel electrons and charge injection into the substrate. The substrate thus serves as an anode and the FET channel represents a hot-electron cathode, whose effective temperature is controlled by the source-to-drain field. Operation of the charge injection transistor is studied at 300, 77, and 4.2 K. At 77 K the existence of power gain is demonstrated experimentally with the measured value of the mutual conductance gmreaching 280 mS/mm (at 300 K, gm≈ 88 mS/mm). The fundamental limit on the device speed of operation is analyzed and shown to be determined by the time of flight of electrons across a high-field region of spatial extent ∼ 10-5cm. Practical ways of approaching this limit are discussed. The process of hot-electron injection from the channel is studied experimentally at 77 and 4.2 K with the purpose of measuring the electron temperature in the channel at different bias conditions. For not too high substrate bias the electron temperature in the channel is found to be proportional to the square of the heating voltage.},
	number = {6},
	urldate = {2025-11-05},
	journal = {IEEE Transactions on Electron Devices},
	author = {Luryi, S. and Kastalsky, A. and Gossard, A.C. and Hendel, R.H.},
	month = jun,
	year = {1984},
	keywords = {Anodes, Bipolar transistors, Cathodes, Electric potential, Electrons, Field effect transistors, Heating systems, Molecular beam epitaxial growth, Silicon, Substrates},
	pages = {832--839},
}

@article{kastalsky_novel_1983,
	title = {Novel real-space hot-electron transfer devices},
	volume = {4},
	issn = {1558-0563},
	url = {https://ieeexplore.ieee.org/document/1483497/},
	doi = {10.1109/EDL.1983.25753},
	abstract = {A new class of devices based on hot-electron transfer between two conducting layers is proposed. The essential feature of these devices is a pronounced negative differential resistance (NDR) in the drain circuit, controlled by gate and substrate voltages. This allows a novel type of bistable logic element, which, although being unipolar, is comparable to the CMOS inverter in that a significant current is drawn only during switching. Another possible application is a gate-controlled microwave generator and amplifier. In the present work, the above device concepts are analyzed in the instance of GaAs/ GaAlAs heterojunction realizations.},
	number = {9},
	urldate = {2025-11-05},
	journal = {IEEE Electron Device Letters},
	author = {Kastalsky, A. and Luryi, S.},
	month = sep,
	year = {1983},
	keywords = {CMOS logic circuits, Electrons, FETs, Gallium arsenide, Heterojunctions, Logic devices, Pulse inverters, Substrates, Temperature, Voltage control},
	pages = {334--336},
}

@article{price_intervalley_1960,
	title = {Intervalley {Noise}},
	volume = {31},
	issn = {0021-8979, 1089-7550},
	url = {https://pubs.aip.org/jap/article/31/6/949/163184/Intervalley-Noise},
	doi = {10.1063/1.1735782},
	abstract = {A theory is developed for the spectrum of electrical noise due to electron transitions between several quasi-isolated groups of states, in the general case where each group may carry part of an electric current. It is applied to the noise due to transitions between valleys of the conduction band of germanium, and the possibility of observing this noise is discussed using the data of Weinreich, Sanders, and White on the frequency of intervalley transitions.},
	language = {en},
	number = {6},
	urldate = {2025-11-05},
	journal = {Journal of Applied Physics},
	author = {Price, P. J.},
	month = jun,
	year = {1960},
	pages = {949--953},
}

@techreport{arthur_measurement_1974,
	address = {Gaithersburg, MD},
	title = {The {Measurement} of noise performance factors : a metrology guide},
	shorttitle = {The {Measurement} of noise performance factors},
	url = {https://nvlpubs.nist.gov/nistpubs/Legacy/MONO/nbsmonograph142.pdf},
	language = {en},
	number = {NBS MONO 142},
	urldate = {2025-10-28},
	institution = {National Bureau of Standards},
	author = {Arthur, M G and Anson, W J},
	year = {1974},
	doi = {10.6028/NBS.MONO.142},
	note = {Edition: 0},
	pages = {NBS MONO 142},
}

@article{skullerud_longitudinal_1969,
	title = {Longitudinal diffusion of electrons in electrostatic fields in gases},
	volume = {2},
	issn = {00223700},
	url = {https://iopscience.iop.org/article/10.1088/0022-3700/2/6/309},
	doi = {10.1088/0022-3700/2/6/309},
	number = {6},
	urldate = {2025-08-27},
	journal = {Journal of Physics B: Atomic and Molecular Physics},
	author = {Skullerud, H R},
	month = jun,
	year = {1969},
	pages = {696--705},
}

@article{gantsevich_theory_1979,
	title = {Theory of fluctuations in nonequilibrium electron gas},
	volume = {2},
	copyright = {http://www.springer.com/tdm},
	issn = {1826-9850},
	url = {http://link.springer.com/10.1007/BF02724353},
	doi = {10.1007/BF02724353},
	language = {en},
	number = {5},
	urldate = {2025-08-27},
	journal = {La Rivista del Nuovo Cimento},
	author = {Gantsevich, S. V. and Gurevich, V. L. and Katilius, R.},
	month = may,
	year = {1979},
	pages = {1--88},
}

@book{hartnagel_microwave_2001,
	address = {New York},
	title = {Microwave noise in semiconductor devices},
	isbn = {978-0-471-38432-8},
	publisher = {Wiley},
	author = {Hartnagel, Hans and Katilius, Ramunas and Matulionis, A.},
	year = {2001},
	keywords = {Electronic circuits, Hot carriers, Microwave circuits, Noise, Semiconductors, Solid state electronics},
}

@phdthesis{li_epitaxial_2024,
	address = {Terahetz and Millimetre Wave Laboratory, Department of Microtechnology and Nanoscience, Chalmers University of Technology, Gothenburg, Sweden},
	title = {Epitaxial {Optimization} of {InP} {High} {Electron} {Mobility} {Transistors} in {Low}-{Noise} {Amplifiers} for {Qubit} {Readout}},
	abstract = {The indium phosphide high electron mobility transistor (InP HEMT) is used in cryogenic low-noise amplifiers (LNAs) at C-band (4-8 GHz) for qubit readout in superconducting quantum computing. Improving the LNA performance with respect to noise, gain and dc power consumption is essential to meet future demands when upscaling quantum processors to handle thousands of qubits. Still, the noise temperature of today’s best C-band LNAs remains nearly an order of magnitude higher than that of a quantum-noise-limited amplifier. This motivates further studies into the noise reduction mechanisms of the InP HEMT. This thesis provides evidence of the importance of epitaxial optimization in reducing noise in cryogenic InP HEMTs for LNAs in quantum computing. A 100-nm gate-length InP HEMT process was refined to a recess-first approach to mitigate electrochemical etching deterioration. The correlation between the subthreshold swing and noise temperature of the LNA observed at 4 K implied that the subthreshold swing served as an indicator of the amount of carrier fluctuations in the InP HEMT channel giving rise to noise. The noise of a C-band three-stage hybrid LNA was investigated by varying the spacer thickness (1 to 7 nm) and channel indium content (53\% to 70\%) in the InAlAs/InGaAs heterostructure of the 100-nm InP HEMT at 4 K. At the optimum noise bias, the 5 nm spacer InP HEMT LNA exhibited a 1.4 K average noise temperature with 6.1 mW dc power consumption. The best performance achieved with 60\% indium content, yielding an average noise temperature and an average gain of 3.3 K and 21 dB, respectively, at 108 µW dc power, represents a new state of the art. Channel noise, expressed as a sum of thermal and excess noise measured from 4 K to 300 K, showed excess noise dominance at 4 K, independent of temperature. Excess noise was observed to vary with the channel indium content even with the same drain current and gate length, suggesting that channel noise cannot be described solely by suppressed shot noise. Additional channel noise contributions were proposed to originate from real-space transfer and impact ionization.},
	language = {en},
	school = {Chalmers University of Technology},
	author = {Li, Junjie},
	year = {2024},
}

@inproceedings{jo_l_2020,
	address = {San Francisco, CA, USA},
	title = {L $_{\textrm{g}}$ = 19 nm {In} $_{\textrm{0.8}}$ {Ga} $_{\textrm{0.2}}$ {As} composite-channel {HEMTs} with f $_{\textrm{{T}}}$ = 738 {GHz} and f $_{\textrm{max}}$ = 492 {GHz}},
	copyright = {https://ieeexplore.ieee.org/Xplorehelp/downloads/license-information/IEEE.html},
	isbn = {978-1-72818-888-1},
	url = {https://ieeexplore.ieee.org/document/9372070/},
	doi = {10.1109/IEDM13553.2020.9372070},
	abstract = {We present Lg = 19 nm In0.8Ga0.2As composite-channel high-electron mobility transistors (HEMTs) with outstanding DC and high-frequency characteristics. We adopted a compositechannel design with an In0.8Ga0.2As core layer that led to superior carrier transport properties. The device with Lg = 19 nm displayed an excellent combination of RON = 271 Ω-μm, gm\_max = 2.5 mS/μm and fT/fmax = 738/492 GHz. To understand the physical origin of such an excellent combination of DC and RF responses, we analyzed the effective mobility (μn\_eff) and delay time for both long- and short-Lg devices, revealing a very high μn\_eff value of 13,200 cm2/V·s and an average velocity under the gate ( ) of 6.2 × 107 cm/s. We also studied the impact of the gate-to-source spacing (LGS) and the electrostatic integrity of the device, finding that a reduction of LGS less than 0.6 μm was of little use in improving gm\_max and fT. Additionally, the intrinsic output conductance (go\_int) had an important impact on fT in short-Lg HEMTs.},
	language = {en},
	urldate = {2024-03-27},
	booktitle = {2020 {IEEE} {International} {Electron} {Devices} {Meeting} ({IEDM})},
	publisher = {IEEE},
	author = {Jo, Hyeon-Bhin and Yun, Seung-Won and Kim, Jun-Gyu and Yun, Do-Young and Lee, In-Geun and Kim, Dae-Hyun and Kim, Tae-Woo and Kim, Sang-Kuk and Yun, Jacob and Kim, Ted and Tsutsumi, Takuya and Sugiyama, Hiroki and Matsuzaki, Hideaki},
	month = dec,
	year = {2020},
	pages = {8.4.1--8.4.4},
}

@book{ambrozy_electronic_1982,
	address = {New York ; London},
	title = {Electronic noise},
	isbn = {978-0-07-001124-3},
	language = {enghun},
	publisher = {McGraw-Hill International Book Co},
	author = {Ambrózy, András},
	year = {1982},
	keywords = {Electronic noise},
}

@article{vurgaftman_band_2001,
	title = {Band parameters for {III}-{V} compound semiconductors and their alloys},
	volume = {89},
	issn = {0021-8979, 1089-7550},
	url = {http://aip.scitation.org/doi/10.1063/1.1368156},
	doi = {10.1063/1.1368156},
	language = {en},
	number = {11},
	urldate = {2022-12-07},
	journal = {Journal of Applied Physics},
	author = {Vurgaftman, I. and Meyer, J. R. and Ram-Mohan, L. R.},
	month = jun,
	year = {2001},
	pages = {5815--5875},
}

@book{schwierz_modern_2003,
	address = {New York},
	title = {Modern microwave transistors: theory, design, and performance},
	isbn = {978-0-471-41778-1},
	shorttitle = {Modern microwave transistors},
	publisher = {Wiley-Interscience},
	author = {Schwierz, Frank and Liou, Juin J.},
	year = {2003},
	keywords = {Microwave transistors},
}

@phdthesis{ardizzi_anthony_j_self-heating_2022,
	title = {Self-{Heating} of {HEMT} {Low}-{Noise} {Amplifiers} in {Liquid} {Cryogenic} {Environments} and the {Limits} of {Microwave} {Noise} {Performance}},
	copyright = {No commercial reproduction, distribution, display or performance rights in this work are provided.},
	url = {https://resolver.caltech.edu/CaltechTHESIS:05272022-180844058},
	abstract = {Detection and processing of microwave signals is of substantial scientific importance in fields ranging from radio astronomy to quantum computing. An essential component of the signal processing chain is the microwave amplifier, which adds gain to the signal so that it may be processed by subsequent microwave components. However, the amplifier itself adds its own internally generated noise into the measurement chain. As a result, amplifiers which add a minimal amount of noise are crucial to any high precision measurement scheme. A device which is commonly employed for this task is the high-electron-mobility transistor (HEMT) amplifier. Understanding the fundamental limits of the microwave noise performance of HEMT amplifiers is highly desirable. Noise temperatures in these devices as low as 3 times the quantum limit have been observed in the last decade, but the lack of understanding of the origin of the excess noise has hindered further improvements. Noise in HEMTs is attributed to a generator at the output, known as drain noise; and a generator at the input, which is attributed to thermal noise of the gate. At cryogenic temperatures of {\textasciitilde}4 K, thermal noise is predicted to be negligible. However, a plateau in noise temperature has been observed at physical temperatures below {\textasciitilde}20 K, with a negligible improvement in noise performance upon further cooling.

The primary noise mechanism responsible for this plateau is believed to be ohmic heating of the HEMT structure induced by current in the active device channel, a process known as self-heating. At room temperature the ambient thermal noise dominates the amplifier’s overall noise performance, but at the cryogenic temperatures required to achieve low-noise performance the self-heating effect produces thermal noise at the input of the HEMT gate which contributes significantly to the total noise. A potential mechanism to mitigate self-heating is to provide an additional thermal dissipation path for the Joule heating in the channel. However, given the sub-micron length scales and buried gate structure of HEMTs, thermal management is challenging. The primary heat conduction pathway, that of phonons travelling through the bulk HEMT substrate, decreases rapidly in magnitude at cryogenic temperatures. An alternative option is to submerge the HEMT in a cryogenic fluid, thereby presenting an alternate thermal conduction route through the HEMT surface into the fluid. This technique, while commonly employed in cryogenic thermal management of superconducting magnets, has not been investigated for HEMTs.

In this work we explore the use of liquid cryogenic cooling to directly mitigate the effect of HEMT self-heating. We test in particular the effectiveness of cooling using superfluid helium-4, which has the highest known thermal conductivity of any known substance. We report a systematic experimental investigation of the noise performance of a cryogenic packaged two-stage HEMT low-noise amplifier over a wide range of biases in a 4.0 - 5.5 GHz frequency band, with the device immersed in a variety of cryogenic baths including helium-4 vapor, liquid helium-4, superfluid helium-4, and vacuum. We present the details of the experimental apparatus which was constructed to perform microwave noise measurements of the low-noise amplifier when submerged in a liquid cryogen environment. We interpret our results using a small-signal model of the amplifier and compare our findings with the predictions of a phonon radiation model of heat dissipation. We find that liquid cryogenic cooling is unable to mitigate the thermal noise associated with self-heating. Considering this finding, we examine the implications for the lower bounds of cryogenic noise performance in HEMTs by incorporating the effects of self-heating into the existing noise modelling of HEMT amplifiers. Our analysis supports the general design principle for cryogenic HEMTs of maximizing gain at the lowest possible power.},
	language = {en},
	urldate = {2023-02-27},
	school = {California Institute of Technology},
	author = {Ardizzi, Anthony J.},
	month = jun,
	year = {2022},
	doi = {10.7907/9VA8-TC64},
	note = {Medium: PDF
Version Number: Final},
	keywords = {Applied Physics, HEMTs, electronic noise, low-noise amplifiers, self-heating, superfluid helium},
}

@article{russell_cryogenic_2012,
	title = {Cryogenic {Self}-{Calibrating} {Noise} {Parameter} {Measurement} {System}},
	volume = {60},
	issn = {1557-9670},
	doi = {10.1109/TMTT.2012.2188813},
	abstract = {A system for measuring the noise parameters of a device at cryogenic temperatures is described. The method includes the thermal calibration of a module consisting of a noise diode, a dispersive coupling network, a temperature sensor, heater, and a bias-tee. The magnitude and phase of the reflection coefficient presented by the module vary rapidly with frequency and the noise output of the module can be thermally calibrated by changing the temperature of the module with an internal heater. The resulting variable impedance-calibrated noise source can be used to measure noise parameters of transistors or amplifiers over a frequency range of 0.4 to 12 GHz via the wideband frequency-variation method. The calibration scheme is not unique to the module and may be applied in general to any noise source. Calibration and noise parameter measurements are made at cryogenic temperatures on a discrete transistor and two different low-noise amplifiers. The results are compared against theoretical values and those obtained using independent measurements. To the best of the authors' knowledge, this is the first measurement of a transistor's noise parameters at cryogenic temperatures using such techniques.},
	number = {5},
	journal = {IEEE Transactions on Microwave Theory and Techniques},
	author = {Russell, Damon and Weinreb, Sander},
	month = may,
	year = {2012},
	note = {Conference Name: IEEE Transactions on Microwave Theory and Techniques},
	keywords = {Calibration, Cryogenics, Heating, Low-noise amplifiers (LNAs), Noise, Noise measurement, Transmission line measurements, noise, noise measurement},
	pages = {1456--1467},
}

@phdthesis{cha_inp_2020,
	address = {Göteborg},
	title = {{InP} high electron mobility transistors for cryogenic low noise and low power amplifiers},
	language = {English},
	school = {Chalmers Univ. of Technology},
	author = {Cha, Eunjung},
	year = {2020},
}

@inproceedings{lamarre_ohmic_1993,
	title = {Ohmic contacts with different metal structures for lattice matched {InP} based heterostructures},
	doi = {10.1109/ICIPRM.1993.380642},
	abstract = {AuGeNiAu and PdGeAu contacts to InP based high electron mobility transistor (HEMT) structures are examined. Standard, non-recessed, transmission line model (TLM) structures do not accurately represent contact resistance when there is high interfacial resistance between InGaAs and InAlAs. A mathematical model using distributed resistance is reviewed. Three new TLM structures derived from the model are shown and new methods for measuring contact resistance are given. Different metal schemes were evaluated and different layer thicknesses within a given metal scheme were also compared using statistically designed experiments. PdGeAu was found to be consistently better for ohmic contacts than AuGeNiAu. The optimum thicknesses found in the PdGeAu system were 150/spl Aring/ of Pd and 500/spl Aring/ of Ge.{\textless}{\textgreater}},
	booktitle = {1993 (5th) {International} {Conference} on {Indium} {Phosphide} and {Related} {Materials}},
	author = {Lamarre, P. and McTaggart, R. and Pulley, M. and Huang, J. and Jackson, G.},
	month = apr,
	year = {1993},
	keywords = {Contact resistance, Electrical resistance measurement, HEMTs, Indium compounds, Indium gallium arsenide, Indium phosphide, Lattices, MODFETs, Mathematical model, Ohmic contacts},
	pages = {333--336},
}

@article{malmkvist_epitaxial_2008,
	title = {Epitaxial {Optimization} of 130-nm {Gate}-{Length} {InGaAs}/{InAlAs}/{InP} {HEMTs} for {High}-{Frequency} {Applications}},
	volume = {55},
	issn = {1557-9646},
	doi = {10.1109/TED.2007.910613},
	abstract = {In this paper, the influence of epitaxial-layer design on high-frequency properties of 130-nm gate-length InGaAs/ InAlAs/InP high-electron-mobility transistors (InP HEMTs) has been investigated. The In channel content ([In]: 53\%, 70\%, and 80\%), the J-doping concentration (delta: 3, 5, and 7times1012 cm-2), and the Schottky-layer thickness (dSL: 9,11, and 13 nm) have been varied. The maximum frequency of oscillation fmax, the cutoff frequency fT, the drain-to-source current JDS, and the transconductance gm have been analyzed for InP HEMTs. All devices exhibited an increase in IDS with increasing [In], delta, and dSL. An increase in fmax, fT, and gm were observed with increasing [In]. When changing [In] from 53\% to 80\%, fT and fmax improved by 14\% and 21\%, respectively. For the delta parameter, an increase in fT and gm. was found. However, fmax was drastically reduced for the highest delta. This is suggested to be due to the formation of a parasitic conduction channel located at the doping plane in the HEMT structure for delta {\textgreater} 6.3 times 1012 cm-2. For the dSL parameter, an optimum with respect to fmax, fT, and gm. was observed. The optimized HEMT exhibited an extrinsic fT and fmax of 250 and 300 GHz, respectively.},
	number = {1},
	journal = {IEEE Transactions on Electron Devices},
	author = {Malmkvist, Mikael and Wang, Shumin and Grahn, Jan V.},
	month = jan,
	year = {2008},
	note = {Conference Name: IEEE Transactions on Electron Devices},
	keywords = {Epitaxial growth, HEMTs, High-electron-mobility transistor (HEMT), In channel content, InGaAs/InAlAs/InP, Indium gallium arsenide, Indium phosphide, Logic gates, MODFETs, Optimization, Schottky layer, optimization, δ doping},
	pages = {268--275},
}

@article{ardizzi_self-heating_2022,
	title = {Self-heating of cryogenic high electron-mobility transistor amplifiers and the limits of microwave noise performance},
	volume = {132},
	copyright = {All rights reserved},
	issn = {0021-8979, 1089-7550},
	url = {https://aip.scitation.org/doi/10.1063/5.0103156},
	doi = {10.1063/5.0103156},
	abstract = {The fundamental limits of the microwave noise performance of high electron-mobility transistors (HEMTs) are of scientific and practical interest for applications in radio astronomy and quantum computing. Self-heating at cryogenic temperatures has been reported to be a limiting mechanism for the noise, but cryogenic cooling strategies to mitigate it, for instance, using liquid cryogens, have not been evaluated. Here, we report microwave noise measurements of a packaged two-stage amplifier with GaAs metamorphic HEMTs immersed in normal and superfluid 4He baths and in vacuum from 1.6 to 80 K. We find that these liquid cryogens are unable to mitigate the thermal noise associated with self-heating. Considering this finding, we examine the implications for the lower bounds of cryogenic noise performance in HEMTs. Our analysis supports the general design principle for cryogenic HEMTs of maximizing gain at the lowest possible power.},
	language = {en},
	number = {8},
	urldate = {2022-08-30},
	journal = {Journal of Applied Physics},
	author = {Ardizzi, Anthony J. and Choi, Alexander Y. and Gabritchidze, Bekari and Kooi, Jacob and Cleary, Kieran A. and Readhead, Anthony C. and Minnich, Austin J.},
	month = aug,
	year = {2022},
	pages = {084501},
}

@inproceedings{pospieszalski_limits_2017,
	title = {On the limits of noise performance of field effect transistors},
	doi = {10.1109/MWSYM.2017.8059045},
	abstract = {A reduction in gate length Lg of FETs below 100 nm and corresponding improvements in transconductance gm, cutoff frequency ft and maximum frequency of oscillation fmax has not resulted in expected improvements in measured minimum noise temperatures Tmin (or noise figures Fmin). This observation applies to all FET technologies currently in use: FETs, HEMTs and MOSFETs. An explanation of this observation is offered by treating drain noise as a suppressed shot noise with current spectral density given by F2qIdΔf, where F is a suppression factor. The re-analysis of the available experimental data for GaAs FETs, HEMTs, InP HEMTS and MOSFETs demonstrates that the suppression factor F can be as small as 0.1 for long gates but increases rapidly for gate lengths shorter than 100 nm. It is consistent with the expectation that for Lg→0 the drain noise should approach pure shot noise and F→1.},
	booktitle = {2017 {IEEE} {MTT}-{S} {International} {Microwave} {Symposium} ({IMS})},
	publisher = {IEEE},
	author = {Pospieszalski, Marian W.},
	month = jun,
	year = {2017},
	keywords = {CMOS, Cryogenics, FET, HEMT, HEMTs, Logic gates, MODFETs, MOSFET, low noise amplifiers, noise, noise measurement},
	pages = {1953--1956},
}

@book{sze_physics_2007,
	address = {Hoboken, N.J},
	edition = {3rd ed},
	title = {Physics of semiconductor devices},
	isbn = {978-0-471-14323-9},
	publisher = {Wiley-Interscience},
	author = {Sze, S. M. and Ng, Kwok Kwok},
	year = {2007},
	keywords = {Semiconductors},
}

@article{krantz_quantum_2019,
	title = {A quantum engineer's guide to superconducting qubits},
	volume = {6},
	issn = {1931-9401},
	url = {http://aip.scitation.org/doi/10.1063/1.5089550},
	doi = {10.1063/1.5089550},
	abstract = {The aim of this review is to provide quantum engineers with an introductory guide to the central concepts and challenges in the rapidly accelerating ﬁeld of superconducting quantum circuits. Over the past twenty years, the ﬁeld has matured from a predominantly basic research endeavor to a one that increasingly explores the engineering of larger-scale superconducting quantum systems. Here, we review several foundational elements—qubit design, noise properties, qubit control, and readout techniques—developed during this period, bridging fundamental concepts in circuit quantum electrodynamics and contemporary, state-of-the-art applications in gate-model quantum computation.},
	language = {en},
	number = {2},
	urldate = {2022-03-30},
	journal = {Applied Physics Reviews},
	author = {Krantz, P. and Kjaergaard, M. and Yan, F. and Orlando, T. P. and Gustavsson, S. and Oliver, W. D.},
	month = jun,
	year = {2019},
	pages = {021318},
}

@article{schleeh_characterization_2013,
	title = {Characterization and {Modeling} of {Cryogenic} {Ultralow}-{Noise} {InP} {HEMTs}},
	volume = {60},
	issn = {1557-9646},
	doi = {10.1109/TED.2012.2227485},
	abstract = {Detailed S-parameter and noise characterization and modeling of ultralow-noise InP/InAlAs/InGaAs high-electron mobility transistors (InP HEMTs) optimized for operation at 10 K are presented. At the optimum low-noise bias at 10 K, the InP HEMT exhibited a 60\% improvement in cutoff frequency fT and a 100\% improvement in dc transconductance gm compared with 300 K. A small-signal noise model was evaluated at different bias conditions at 10 and 300 K. The bias dependence of the minimum noise temperature at low-noise operation was modeled at 10 K. The temperature dependence of the threshold voltage VT, gm, and gate-source and gate-drain capacitances Cgs and Cgd indicated that the excellent cryogenic noise performance of optimized InP HEMTs is due to a higher degree of confinement in the carrier concentration closest to the gate at 10 K compared with 300 K. As a result, a fast depletion of the HEMT channel with respect to drain current Id occurs under cryogenic operation.},
	number = {1},
	journal = {IEEE Transactions on Electron Devices},
	author = {Schleeh, Joel and Rodilla, Helena and Wadefalk, Niklas and Nilsson, Per-Ake and Grahn, Jan},
	month = jan,
	year = {2013},
	note = {Conference Name: IEEE Transactions on Electron Devices},
	keywords = {Cryogenic, Cryogenics, HEMTs, InGaAs/InAlAs/InP high-electron mobility transistor (InP HEMT), Indium phosphide, Logic gates, MODFETs, Noise, low noise},
	pages = {206--212},
}

@article{pospieszalski_modeling_1989,
	title = {Modeling of noise parameters of {MESFETs} and {MODFETs} and their frequency and temperature dependence},
	volume = {37},
	issn = {1557-9670},
	doi = {10.1109/22.32217},
	abstract = {A simple noise model of a microwave MESFET (MODFET, HEMT, etc.) is described and verified at room and cryogenic temperatures. Closed-form expressions for the minimum noise temperature, the optimum generator impedance, the noise conductance, and the generator-impedance-minimizing noise measure are given in terms of the frequency, the elements of a FET equivalent circuit, and the equivalent temperatures of intrinsic gate resistance and drain conductance to be determined from noise measurements. These equivalent temperatures are demonstrated in the case of a Fujitsu FHR01FH MODFET to be independent of frequency in the frequency range in which 1/f noise is negligible. Thus, the model allows prediction of noise parameters for a broad frequency range from a single frequency noise parameter measurement. The relationships between this approach and other relevant studies are established.{\textless}{\textgreater}},
	number = {9},
	journal = {IEEE Transactions on Microwave Theory and Techniques},
	author = {Pospieszalski, M. W.},
	month = sep,
	year = {1989},
	note = {Conference Name: IEEE Transactions on Microwave Theory and Techniques},
	keywords = {Circuit noise, Closed-form solution, Cryogenics, Frequency measurement, HEMTs, MESFETs, MODFET circuits, Noise generators, Noise measurement, Temperature},
	pages = {1340--1350},
}

@article{schleeh_phonon_2015,
	title = {Phonon black-body radiation limit for heat dissipation in electronics},
	volume = {14},
	issn = {1476-1122, 1476-4660},
	url = {http://www.nature.com/articles/nmat4126},
	doi = {10.1038/nmat4126},
	language = {en},
	number = {2},
	urldate = {2021-03-22},
	journal = {Nature Materials},
	author = {Schleeh, J. and Mateos, J. and Íñiguez-de-la-Torre, I. and Wadefalk, N. and Nilsson, P. A. and Grahn, J. and Minnich, A. J.},
	month = feb,
	year = {2015},
	pages = {187--192},
}
```
#bibliography(bytes(references.text),style:"ieee")
