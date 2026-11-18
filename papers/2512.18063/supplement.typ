#set page(paper:"a4", margin:22mm, numbering:"1")
#set text(font:"Libertinus Serif", size:10.5pt)
#set par(justify:true, leading:.55em)
#set math.equation(numbering:"(1)")
#show figure.caption: set text(size:9pt)
#set figure(numbering: n => "S" + str(n))
#align(center)[
  #text(size:17pt, weight:"bold")[Supporting Information ? Fast-Recovery Epitaxial NbN Superconducting Nanowire Single-Photon Detectors with Saturated Efficiency at 1550 nm in Liquid Helium]
  #v(.5em)
  Francesca Incalza, Matteo Castellani, Dip Joti Paul, Alejandro Simon, Emma Batson, Davide Mondin, Owen Medeiros, Karl K. Berggren
  #v(.35em)
  Department of Electrical Engineering and Computer Science, Massachusetts Institute of Technology, Cambridge, MA, USA
  #linebreak()
  #link("mailto:incal723@mit.edu")
]

= Epitaxial relation of NbN on c-cut Al$""_2$O$""_3$
<epitaxial-relation-of-nbn-on-c-cut-al_2o_3>
The epitaxial growth of NbN on c-cut Al$""_2$O$""_3$ naturally leads to
the formation of twin domains. This occurs because the cubic structure
of NbN on the hexagonal sapphire lattice allows for two symmetrically
equivalent orientation variants, related by a 180° rotation around the
\[111\] zone axis. These twins typically have lateral dimensions on the
order of a few nanometers, as observed in the TEM image shown in
Fig.~@fig:S5. In this TEM, the changes in contrast of the grey regions
allow us to identify the different twin domains.

#figure(image("source/supple/TEM.pdf"),
  caption: [
    Transmission electron microscopy image of epitaxial NbN on c-cut
    Al$""_2$O$""_3$. Twin domains are visible as regions with
    alternating contrast (grey variations). The lateral size of the
    twins is on the order of a few nanometers.
  ]
)
<fig:S5>

The epitaxial relation can be rationalized using the coincidence site
lattice rule~@shibalov_ultrathin_2023, which describes the alignment of
two lattices when a subset of lattice points from each crystal coincide.
In this framework, epitaxial growth is favored along directions where
the lattices share a periodic coincidence, even if the overall lattice
constants are different. For NbN on sapphire, the rule predicts:

$ 4 dot.op sqrt(3) dot.op sqrt(2) thin a_(upright(N b N)) = 24.856 med upright("Å") \, quad 3 dot.op sqrt(3) thin a_(upright(A l)_2 O_3) = 24.728 med upright("Å") \, $

which corresponds to a lattice mismatch of less than 0.52%. This low
mismatch explains the observed epitaxial alignment and why twin domains
form: the crystal accommodates the small residual strain by forming two
equivalent orientations.

Additionally, from X-ray diffraction (XRD) measurements, the (111) peak
of NbN was used to extract the interplanar spacing $d_111$. Using the
cubic lattice geometry, the in-plane lattice parameter $a$ is related to
$d_111$ by

$ a = d_111 dot.op sqrt(3) = 2.537 med upright("Å") dot.op sqrt(3) approx 4.39 med upright("Å") . $

This value is in good agreement with the expected bulk lattice
parameter.

= Thickness-dependent structural and superconducting properties
<thickness-dependent-structural-and-superconducting-properties>
The superconducting and structural properties of the epitaxial NbN films
exhibit a clear dependence on film thickness, consistent with strain
relaxation in thin films. X-ray diffraction measurements reveal that
thicker films (Fig.~@fig:XRD_PEAK) have narrower rocking curves (FWHM
$<$ 1$""^compose$ for 21 nm), indicating low mosaic spread and
out-of-plane alignment. The crystallite size $D$ was estimated using the
Scherrer formula~@uvarov_metrological_2007,
$ D = frac(K lambda, beta cos theta) \, $ where $K approx 0.9$ is the
shape factor, $lambda$ is the X-ray wavelength, $beta$ is the FWHM of
the peak in radians, and $theta$ is the Bragg angle. The analysis
indicates that the crystallite size increases with film thickness and is
approximately equal to the nominal film thickness, consistent with the
trend observed in the rocking curve widths. Thicker films also display
higher residual resistance ratios (RRR), with
$upright(R R R) approx 2.31$, 2.97, and 13.50 for the 5 nm, 12 nm, and
21 nm films, respectively, reflecting enhanced metallic behavior and
improved structural uniformity~@roach_nbn_2012. This trend correlates
with higher superconducting transition temperatures ($T_c$) and sharper
transitions, with transition widths $Delta T$ (defined as the
temperature difference between 90% and 10% of the normalized resistance)
ranging from 0.33 K to 1.66 K for the three thicknesses, supporting the
above observation~@baeva_natural_2024. Higher RRR values further
indicate improved crystallinity, consistent with complementary
structural and transport characterization.

#figure(image("source/supple/peaks_xrd_2.pdf", width: 50.0%),
  caption: [
    Normalized X-ray diffraction (XRD) peak for NbN (111)
    plane for films of different thicknesses. The overlapping curves
    highlight differences in peak broadening associated with film
    thickness, indicating variations in crystallinity and strain.
  ]
)
<fig:XRD_PEAK>

= Universal scaling analysis of epitaxial NbN films
<universal-scaling-analysis-of-epitaxial-nbn-films>
We analyzed the material properties of epitaxial NbN thin films by
testing their consistency with the universal scaling relation proposed
by Ivry #emph[et al.]~@ivry_universal_2014. Figure~@fig:millman\(a) shows
the fit of the measured critical temperature $T_c$, film thickness $d$,
and sheet resistance $R_s$ data to the universal scaling law:
$ d T_c = A R_s^(- B) . $<eq:ivry>

This formulation, using the product $d T_c$ rather than $T_c$ alone,
captures the coupled influence of dimensionality and disorder on
superconductivity. It is well established that $T_c$ decreases as the
film becomes thinner and as disorder increases (quantified by the
normal-state sheet resistance $R_s$). Thus, plotting $d T_c$ versus
$R_s$ provides a more comprehensive description of superconducting
trends in ultrathin films than plotting $T_c$ alone.

In our case, the scaling relation fits the experimental data well,
yielding $A = 6142.3$ and $B = 0.693$, with a coefficient of
determination $R^2 = 0.95$. These parameters are consistent with those
reported for epitaxial NbN films grown under comparable
conditions~@ivry_universal_2014, confirming that our samples fall within
the same disorder regime and exhibit high structural and superconducting
quality. The exponent $B approx 0.7$ indicates a moderate suppression of
superconductivity with increasing disorder, while the prefactor $A$
reflects intrinsic material characteristics such as the clean-limit
$T_c$, coherence length, and effective superconducting thickness.

#figure(image("source/supple/millman.pdf", width: 95.0%),
  caption: [
    (a) Thickness vs.~resistance product $d dot.op T_c$
    plotted against sheet resistance $R_s$, showing an inverse
    correlation indicative of disorder induced suppression of
    superconductivity. b) Linear dependence of $R_s$ on the inverse film
    thickness $1 \/ d$.
  ]
)
<fig:millman>

This empirical scaling also provides a practical benefit: $T_c$ can be
inferred from normal-state measurements (e.g., $R_s$ at room
temperature), offering a convenient metric for assessing film quality
and optimizing growth conditions for high-yield SNSPD fabrication.

From a microscopic standpoint, the high $T_c$ of our epitaxial NbN films
arises from the close lattice matching between NbN and the sapphire
substrate, which minimizes interfacial strain and defect formation in
the initial growth layers. This structural coherence promotes robust
superconductivity compared with polycrystalline or poorly matched films,
where dislocations and strain tend to suppress $T_c$. The Ivry scaling
law~@ivry_universal_2014 effectively captures this macroscopic
manifestation of disorder: $R_s$ quantifies the degree of scattering,
while $d T_c$ reflects the resulting superconducting response. The
fitted parameters $A$ and $B$ thus provide a quantitative framework to
evaluate how disorder impacts superconductivity in epitaxial NbN.

Finally, Figure~@fig:millman\(b) shows a linear dependence of the sheet
resistance $R_s$ on the inverse film thickness $1 \/ d$, consistent with
$R_s = rho \/ d$ for films of uniform resistivity $rho$. This confirms
the consistency of resistivity across different thicknesses and supports
the validity of applying the Ivry scaling relation to our system.
Altogether, the agreement with the Ivry model demonstrates that our
deposition conditions yield epitaxial NbN films whose superconducting
properties follow universal de-suppression trends and can be predictably
tuned via thickness and sheet resistance.

= Atomic Force Microscopy
<atomic-force-microscopy>
Atomic force microscopy (AFM) characterization was performed on an 8~nm
thick NbN film deposited on sapphire at 800$""^compose$C, with a
superconducting critical temperature $T_(upright(c)) = 11.78$~K and a
sheet resistance of 207.41~/sq. AFM, a surface-sensitive technique, was
used to evaluate the surface roughness of the deposited thin film. Over
a scanning area of $1 med mu upright(m) times 1 med mu upright(m)$, the
AFM measurement shown in Fig.~@fig:S1 reveals a very low surface
roughness of approximately 0.4~nm, which is within the noise level of
the instrument. This high degree of surface uniformity is essential for
the fabrication of high-performance superconducting devices.

The height map (y vs.~x) shows a smooth, uniform morphology with no
significant particulates or defects, while the line profile ($rho$
vs.~z) further confirms minimal surface variation across the scanned
area, supporting the structural quality of the epitaxial NbN film.

#figure(image("source/supple/afm.pdf"),
  caption: [
    AFM characterization of epitaxial NbN thin film. (a) Height map (x
    vs.~y) showing smooth morphology. (b) Line profile ($rho$ vs.~z)
    indicating minimal surface variation. (c) 3D representation of
    surface roughness. All data confirm low roughness (~0.4~nm) over a
    $1 med mu upright(m) times 1 med mu upright(m)$ scan.
  ]
)
<fig:S1>

= Electron Backscatter Diffraction
<electron-backscatter-diffraction>
Electron backscatter diffraction (EBSD) was performed to confirm the
crystallographic orientation and quality of the epitaxial NbN thin
films. EBSD provides spatially resolved information on crystal
orientation and the presence of grain boundaries, allowing assessment of
epitaxial growth and in-plane and out-of-plane alignment. Fig.~@fig:S2\(a)
and~@fig:S2\(b) show two different zoom levels of the out-of-plane scan. As
expected for films grown on sapphire substrates, the NbN layers exhibit
a highly oriented growth in the (111) direction, indicating strong
epitaxial alignment. The high degree of crystallographic uniformity
confirms the quality of the deposition and suggests minimal formation of
misoriented grains or defects within the scanned areas.

#figure(image("source/supple/ebsd_3.pdf"),
  caption: [
    EBSD out-of-plane scans of epitaxial NbN films. Both panels show a
    strong (111) preferential orientation, confirming high-quality
    epitaxial growth. (a) Larger area zoom; (b) smaller area zoom.
  ]
)
<fig:S2>

= X-ray Photoelectron Spectroscopy
<x-ray-photoelectron-spectroscopy>
To investigate the surface chemistry of the NbN films, we performed
X-ray photoelectron spectroscopy (XPS) on representative samples. The
N~1s peak in Fig.~@fig:S3\(a), centered at approximately 397.5~eV,
corresponds to nitrogen bound in the NbN lattice. The Nb~3d core-level
spectrum in Fig.~@fig:S3\(b) shows a dominant doublet centered at
204.2~eV, consistent with Nb--N bonds at the surface. Additional
components at 207~eV--209.7~eV are assigned to Nb--O bonds, reflecting
the formation of a native oxide layer upon air exposure.

Quantitative surface analysis yields the following atomic concentrations
(corrected by RSF):

#block[
#figure(
  align(center)[#table(
    columns: 2,
    align: (left,center,),
    table.header([Element], [NbN (%)],),
    table.hline(),
    [C~1s], [30.49],
    [N~1s], [14.65],
    [O~1s], [32.57],
    [Nb~3d], [22.29],
  )]
  , caption: [Surface atomic concentrations of the NbN thin film
  determined from XPS measurements. Carbon is attributed to surface
  contamination, and oxygen arises from a native oxide layer.]
  , kind: table
  ) <tab:xps>

]
From these surface-sensitive measurements, the Nb:N ratio at the surface
is approximately $22.29 \/ 14.65 approx 1.52$. However, this ratio
should not be interpreted as the bulk stoichiometry, since XPS probes
only the top few nanometers of the film. The significant oxygen and
carbon content primarily reflects surface contributions rather than bulk
properties.

#figure(image("source/supple/xps.pdf"),
  caption: [
    XPS characterization of the NbN film. (a) N~1s spectrum. (b) Nb~3d
    core-level spectrum showing Nb-N and Nb-O components. Atomic
    concentrations are summarized in Table~@tab:xps
  ]
)
<fig:S3>

= Fabrication details
<fabrication-details>
Epitaxial NbN thin films were deposited on 10 mm × 10 mm c-cut sapphire
substrates by DC reactive ion sputtering. Prior to deposition, the chips
were cleaned by sonication sequentially in acetone and isopropyl alcohol
(IPA). The base pressure in the deposition chamber was maintained at
$8.6 times 10^(- 9)$ Torr.

The substrates were mounted on an Inconel sample holder coated with a
multilayer of niobium/niobium nitride/titanium. The holder was heated to
800 °C and allowed to stabilize at this temperature for approximately an
hour and a half before deposition. The holder was positioned above a Nb
target in an Ar and N$""_2$ ambient atmosphere.

During deposition, the sputtering pressure was held at 2.5 mTorr, with
argon and nitrogen flow rates set to 26.5 sccm and 6 sccm, respectively.
The sputtering power applied to the target was 400 W (peak power), while
a 7 W RF bias was simultaneously applied to the substrate holder to
assist in sputter cleaning during the initial target conditioning
step~@dane_bias_2017@dane_reactive_2015.

After deposition, the samples were cooled down to room temperature under
the same pressure conditions, with the heater turned off, and were
removed from the chamber once room temperature was reached.

We fabricated superconducting nanowire single-photon detectors (SNSPDs)
from 4.5~nm-thick epitaxial NbN films deposited on c-cut sapphire.
Nanowires with widths ranging from ultranarrow 20~nm and 30~nm to wider
100~nm devices were patterned using a high-resolution electron-beam
lithography process based on 25% hydrogen silsesquioxane
(HSQ)~@yang_fabrication_2005. The negative-tone resist was spin-coated
at 314 rad/s (3000 rpm) for 60~s, resulting in a thickness of
approximately 30~nm. Device patterns were defined by electron-beam
lithography and developed in 25% tetramethylammonium hydroxide (TMAH) at
room temperature for 2~minutes~@colangelo_superconducting_2023. The
resulting patterns were then transferred into the NbN films using
reactive ion etching with CF$""_4$. Nanowire widths were verified by
scanning electron microscopy (SEM) on the HSQ mask after deposition of a
2~nm gold layer, ensuring precise control of the nanowire dimensions.

#figure(image("source/supple/FAB2_1.pdf"),
  caption: [
    Schematic of the fabrication process for ultranarrow NbN nanowire
    devices on epitaxial thin films. This workflow enables precise
    pattern transfer and uniform nanowire widths below 2~nm variation.
  ]
)
<fig:S4>

= Measurements Methods
<measurements-methods>
X-ray diffraction (XRD) measurements were performed to assess the
crystallographic quality of the NbN films. High-resolution
$theta$--2$theta$ scans were acquired using a Rigaku SmartLab
diffractometer operated at 40 kV and 30 mA with Cu K$alpha$ radiation
($lambda = 1.5406$ Å). Azimuthal ($phi.alt$) scans were carried out
using a PANalytical X'Pert PRO system operated at 30 kV and 10 mA, using
a sealed tube with a copper target, producing Cu K$alpha$ radiation
($lambda = 1.5406$ Å), to evaluate the in-plane epitaxial relationships
and detect the presence of twin domains. The critical temperature
($T_c$) of the devices was determined by measuring the resistance as a
function of temperature during both warming and cooling cycles. The
temperature was controlled using a cryogenic temperature controller with
a standard PID feedback loop, based on readings from a calibrated
low-temperature thermometer positioned in close thermal contact with the
sample stages. Nanowire widths were estimated from SEM images by
analyzing the grey value intensity across each nanowire using ImageJ.
Line profiles were drawn perpendicular to the nanowire axis to extract
the grey value as a function of distance (Fig.~@fig:widths). The
nanowire edges were identified from the transitions in the intensity
profiles, and the width was taken as the distance between these edges.
Multiple line profiles were analyzed per device to obtain representative
widths. Using this method, the nominal nanowire widths of 100~nm, 30~nm,
and 20~nm were confirmed with high fidelity.

#figure(image("source/supple/widths_1.pdf"),
  caption: [
    Nanowire widths extracted from SEM images. Grey value line profiles
    perpendicular to each nanowire were analyzed in ImageJ to identify
    edge transitions. The width, defined as the distance between edges,
    was measured across multiple profiles per device, confirming nominal
    widths of 100~nm, 30~nm, and 20~nm
  ]
)
<fig:widths>

The electronic properties of the nanowires were measured using a
custom-built dip probe immersed in liquid helium~@butters_digital_2022,
operating at a temperature of 4.2 K inside a helium dewar. The readout
electronics setup consists of a voltage source in series with a bias
resistor: a 10 k$Omega$ resistor was used for the 100 nm wide nanowire,
while 100 k$Omega$ resistors were used for the 20 nm and 30 nm devices
to ensure stable biasing at lower switching currents
(Fig.~@fig:circuit). The output pulses generated by photon detection
events are AC-coupled via a capacitor to the amplification and
acquisition chain. The SNSPDs were optically tested at two key
wavelengths, 1550~nm and 780~nm through a fiber-optic cable. For reset
time measurements, a surface-mount resistor of 215~$Omega$ ($R_s$) was
added in series with the 50~$Omega$ amplifier input on the PCB to
increase the load resistance and reduce the $L \/ R_(upright(l o a d))$
time constant, where $R_(upright(l o a d)) = R_s + 50 med Omega$. The
device kinetic inductance was estimated as
$L = 1.38 thin \( R_(upright(s h e e t)) \/ T_c \) thin \( L \/ W \)$,
where $R_(upright(s h e e t))$ is the sheet resistance of the
superconducting film, $T_c$ its critical temperature, and $L \/ W$ is
the number of squares~@colangelo_superconducting_2023. This
configuration effectively shortens the detector recovery time.

#figure(image("source/supple/circuit_2_3.pdf", width: 70.0%),
  caption: [
    Schematic of the readout electronics setup for the nanowire detector
    metrics measurements.
  ]
)
<fig:circuit>

= Detector Performance
<detector-performance>
#figure(image("source/supple/pcr_linearity_2.pdf"),
  caption: [
    (a) Photon count rate (Light counts - Dark counts) as a function of
    bias current for NbN nanowires of different widths (20~nm, 30~nm,
    and 100~nm) measured at 4.2~K. (b) Linearity check of NbN nanowire
    devices. Count rate is plotted as a function of incident photon flux
    for nanowires of different widths (20~nm, 30~nm, and 100~nm). (c)
    Dark count rates as a function of bias current for NbN nanowires of
    different widths (20~nm, 30~nm, and 100~nm) measured at 4.2~K. (d)
    Superconducting transition temperature ($T_c$) for 20 nm wide NbN
    nanowires. The $T_c approx 10.75$~K. The transition curves were
    fitted using a sigmoidal function to accurately extract $T_c$.
  ]
)
<fig:S6>

We characterized the photon count rate (PCR) of NbN nanowire devices
with different widths (20~nm, 30~nm, and 100~nm) at an operating
temperature of 4.2~K (Fig.~@fig:S6\(a)). The PCR curves, obtained under
continuous-wave laser illumination at 1550~nm and 780~nm wavelengths
with a laser power of 0.5~mW, show the dependence of detection
efficiency on the bias current. For the 20~nm-wide nanowires, we observe
the highest saturation plateau, corresponding to the maximum count rate,
while wider wires (30~nm and 100~nm) display progressively lower
detection efficiencies. We also extracted the switching currents
($I_(upright("sw"))$) of the devices. As expected, $I_(upright("sw"))$
scales with the nanowire cross-sectional area, narrower nanowires
(20~nm) exhibit lower switching currents compared to wider ones
(100~nm).

To verify that the counts correspond to single-photon detection events,
we measured the linearity of the count rate as a function of the
incident photon flux (Fig.~@fig:S6\(b)). The linear dependence confirms the
single-photon detection regime for all device widths.

Moreover, Fig.~@fig:S6\(c) shows the dark count rate (DCR) as a function of
bias current for NbN nanowires of different widths measured at 4.2 K.
The 20~nm-wide nanowires exhibit a markedly higher dark count rate and a
steeper dependence on bias current compared to the 30~nm and 100~nm
devices. This behavior suggests enhanced edge sensitivity, likely
arising from increased current crowding and local nonuniformities at
reduced dimensions.

Finally, we measured the superconducting transition temperature ($T_c$)
of the nanowires (Fig.~@fig:S6\(d)) using a bias current of 1~µA. All
devices exhibit sharp transitions with $T_c approx 10.5$~K, consistent
across different wire widths. For the 20-nm-wide wire, we extracted
$T_c = 10.746$~K with a narrow transition width of $Delta T = 0.092$~K.
The data were fitted with a sigmoidal function to determine $T_c$ at 50%
of the transition.

= Temporal response and exponential fits of the detector
<temporal-response-and-exponential-fits-of-the-detector>
In a simple switch model for the SNSPD, after the wire returns
superconducting, the current recovers with a time constant $tau$ =
$L \/ R_(upright(l o a d))$, where L is the inductance of the SNSPD plus
any parasitic inductance and
$R_(upright(l o a d)) = R_s + 50 med Omega$. The voltage measured by the
scope decays accordingly with the same time constant. Fig.~@fig:pulse\(a)
shows the temporal response of one of the measured superconducting
nanowire detector without an additional load resistor. The pulse
exhibits a long decay tail that is well described by an exponential fit,
from which a decay time constant of 1.2~ns is extracted.

#figure(image("source/supple/exponential_fit2.pdf", width: 50.0%),
  caption: [
    Temporal response of a superconducting nanowire single-photon
    detector (SNSPD) with and without an additional load resistor. Pulse
    trace of the detector without the load resistor, showing a long
    exponential decay with a time constant of 1.2~ns.
  ]
)
<fig:pulse>

To investigate the impact of the load on the detector dynamics, several
measurements were performed with different load resistances connected in
series with the device. Increasing the load resistance progressively
shortened the decay time, consistent with the expected reduction of the
effective $L \/ R$ constant. To support this interpretation, we also
performed LTspice simulations of the circuit shown in Fig.~@fig:circuit,
which confirm that adding the load resistor reduces the pulse width and
decay time. The simulation reproduces the experimental setup in which an
ideal voltage source in series with a resistance provides a current bias
for the SNSPD, modeled using a dynamic LTSpice
model~@berggren_superconducting_2018. The bias resistor $R_(upright(s))$
is connected to a bias tee, with the DC port shunted to ground through a
$50 med Omega$ termination. The AC port is connected to a chain of
low-noise amplifiers (LNAs), which in turn feed a $50 med Omega$ load
representing the oscilloscope input. To account for pulse distortion due
to frequency cutoff effects, the LNA and bias tee models include their
respective low- and high-frequency cutoffs. The bias tee is a model
ZFBT-4R2GW+ from Mini-Circuits, with a high cutoff frequency of
$f_(upright(H)) = 4.2 med upright(G H z)$. The first amplifier is a
LNA-2500 from RFBay Inc., with
$f_(upright(H)) = 2.5 med upright(G H z)$, while the second amplifier is
a LNA-2000 from RFBay Inc., with
$f_(upright(H)) = 2.0 med upright(G H z)$. The oscilloscope
high-frequency cutoff of $6 med upright(G H z)$ was not modeled, as it
exceeds the bandwidth of the preceding amplifiers. A
$1 med upright(p F)$ parasitic capacitance to ground was included
between the SNSPD source and the load resistor. This value was chosen as
a reasonable estimate based on the PCB-mounted load resistor and the
wire-bond connections from the device to the PCB pads. The parasitic
series inductance due to the wire bonds was modeled using inductors with
$L_(upright(s)) = 5 med upright(n H)$. The bias current is
$19 med mu upright(A)$, the measured sheet resistance is
$R_square.stroked.tiny = 491 med Omega$, the measured critical
temperature is $T_(upright(c)) = 10.5 med upright(K)$, the length of the
wire is $2 med mu upright(m)$ and its width is $100 med upright(n m)$,
the film thickness is $5.3 med upright(n m)$, and the total number of
squares in the superconducting layer is $n_(upright(s)) = 500$. The
calculated sheet inductance is
$L = 1.38 thin \( R_square.stroked.tiny \/ T_(upright(c)) \) thin n_(upright(s)) times 10^(- 12) med upright(H) tilde.eq 32.3 med upright(n H)$.
Voltage traces were rescaled to match the experimental amplitudes.
Device pulses were simulated while sweeping the load resistance value.
We reproduced the experimental observation that increasing the resistive
load decreases the pulse width, confirming the role of $L \/ R$
reduction in achieving faster detector electrical reset
(Fig.~@fig:spice). When including a $1 med upright(p F)$ parasitic
capacitor between the SNSPD drain and the load resistor, however,
increasing $R_s$ causes the simple $L \/ R$ recovery model to fail to
accurately describe the dynamics. Once the capacitive time constant
$R C$ becomes comparable to the inductive time constant $L \/ R$, the
early-time dynamics are no longer dominated purely by inductive decay.
When $R C > 4 L \/ R$, the parallel RLC response becomes underdamped,
leading to the slight post-pulse ringing observed in the measured
voltage traces for $R_s = 215 med Omega$. Load resistance values ranging
from 215 $Omega$ to 0~$Omega$ were simulated. Distributed effects,
including the non-linear transmission line behavior of the
superconducting nanowire and reflections from non-matched tapers, have
not been accounted for.

#figure(image("source/supple/spice_new3.pdf", width: 50.0%),
  caption: [
    SPICE simulation of the transient response of our circuit for five
    different series resistance values. Increasing the series resistance
    decreases the effective $L \/ R$ time constant, resulting in a
    faster decay of the output pulse.
  ]
)
<fig:spice>

= Nanowire-to-substrate thermal conductance
<nanowire-to-substrate-thermal-conductance>
We estimated the thermal conductance between the NbN nanowires and the
substrate using the retrapping and switching currents measured at 4.3~K.
The nanowire-to-substrate thermal conductance, $h_c$, can be expressed
as~@berggren_superconducting_2018:

$ h_c = frac(R_(s q) thin I_r^2, 2 thin w^2 thin \( T_c - T_s \)) \, $

where $R_(s q)$ is the sheet resistance of the NbN film, $I_r$ is the
retrapping current estarcted from a current-voltage characteristic
(Fig.~@fig:S8), $w$ is the nanowire width, $T_c$ is the superconducting
critical temperature of the wire, and $T_s$ is the substrate
temperature.

The resulting nanowire-to-substrate thermal conductance is:

$ h_c^(upright(e p i t a x i a l)) approx 9.3 times 10^4 med upright(W) thin m^(- 2) thin K^(- 1) . $

For comparison, thermal conductance on SiO$""_2$ (thermal oxide) is
significantly lower, on the order of
$10^2$--$10^3 med upright(W) thin m^(- 2) thin K^(- 1)$~@giri_effect_2016.
This shows that Al$""_2$O$""_3$ substrates provide much better thermal
coupling, allowing faster thermal relaxation and recovery of the
nanowire after photon detection.

#figure(image("source/supple/IV_1.pdf", width: 50.0%),
  caption: [
    Current-voltage characteristics of a 100~nm-wide NbN nanowire
    measured at 4.3~K. The retrapping current ($I_r$) is indicated,
    marking the transition from the resistive to the superconducting
    state during the decreasing current sweep.
  ]
)
<fig:S8>

= Magnetotransport characterization
<magnetotransport-characterization>
The upper critical field $H_(c 2) \( T \)$ as a function of temperature
was determined using a Quantum Design Magnetic Property Measurement
System (MPMS) system by applying magnetic fields up to 7 T perpendicular
to the film surface ($H perp S$). Fig.~@fig:mpms shows the critical
temperature $T_c$ under different perpendicular magnetic fields for a
12~nm. The superconducting transition shifts to lower temperatures and
broadens with increasing field. Each transition curve was fitted using a
sigmoidal function to extract $T_(c \, 0.5)$ at 50%. Fig.~@fig:mpms\(b)
displays $T_(c \, 0.5)$ as a function of magnetic field, showing the
clear linear dependence. For the 12~nm, the upper critical field at zero
temperature, $mu_0 H_(c 2) \( 0 \)$, is estimated using the
Werthamer--Helfand--Hohenberg (WHH)~@werthamer_temperature_1966
approximation in still in the dirty limit as
$mu_0 H_(c 2) \( 0 \) = 0.69 thin T_c lr(|frac(d H_(c 2), d T)|)_(T arrow.r T_c) = 15.7 med upright(T)$.
The superconducting coherence length is
$xi \( 0 \) = sqrt(frac(Phi_0, 2 pi B_(c 2) \( 0 \))) = 5.74 med upright(n m)$,
and the electron diffusivity is
$D = frac(4 k_B, pi e) dot.op lr(|frac(d B_(c 2), d T)|)^(- 1) = 0.73 med upright(c m^2 \/ s)$.
The higher values observed for the thicker 12~nm film are consistent
with stronger scattering in the thinner 5~nm films.

#figure(image("source/supple/MPMS_3.pdf"),
  caption: [
    (a) Normalized resistance as a function of temperature
    for an 12~nm NbN thin film measured under different perpendicular
    magnetic fields (0--7~T). Each dataset (circles) represents the
    resistance normalized to its maximum value below 18~K, obtained via
    four-probe measurements. A sigmoidal fit (solid lines) is applied to
    extract the superconducting critical temperature $T_c$. (b) Magnetic
    field dependence of the superconducting transition temperature
    $T_(c \, 0.5)$, defined as the temperature at which the resistance
    drops to 50% of its normal-state value. The data points (circles)
    are extracted from the fits in Figure~@fig:mpms\(a). A linear fit
    (solid line) is applied.
  ]
)
<fig:mpms>

= Ab-Initio Modeling
<ab-initio-modeling>
To model the photon count rate (PCR) behavior and predict the saturation
current of the epitaxial SNSPDs, we used a multiscale theoretical
framework combining #emph[ab initio] kinetic modeling with
time-dependent Ginzburg--Landau (TDGL) simulations~@simon_ab_2025. This
approach captures the sequence of nonequilibrium processes triggered by
photon absorption in the superconducting nanowire. The early stages of
detection are described using an #emph[ab initio] kinetic equation
formalism operating on sub-picosecond timescales, which models the
energy partitioning between quasiparticles and phonons and accounts for
phonon escape into the substrate. The resulting non-equilibrium
quasiparticle distributions are then used as input for TDGL simulations,
which evolve the superconducting order parameter on tens-of-picoseconds
timescales. This enables a direct prediction of whether the absorbed
photon drives the system into the resistive state, producing a
detectable voltage pulse. The combined framework provides a binary
prediction of photon detection under specific bias conditions. We employ
our previously developed #emph[ab initio] model~@simon_ab_2025, which
requires no adjustable parameters to obtain the saturation current, and
only a fit to the fluctuation rate during the down-conversion of photon
energy to reproduce the experimental PCR dependence. When fitting, we
assume that the normalized PCR distribution is well-represented by a
sigmoid centered at the saturation current and normalized to one. The
agreement between theory and experiment confirms that the multiscale
model reliably captures the detection dynamics of our epitaxial NbN
SNSPDs, giving a valuable feedback loop between modeling and experiment
for device optimization.

#bibliography("source/references_v3.bib", style:"american-chemical-society", title:[References])
