// Typst format conversion of arXiv:2601.12418v1, licensed CC BY 4.0.
#set page(paper: "a4", margin: 21mm, numbering: "1")
#set text(font: "Libertinus Serif", size: 11pt)
#set par(justify: true)
#set math.equation(numbering: "(1)")
#align(center)[
  #text(size: 17pt, weight: "bold")[Cryogenic enhancement of phononic four-wave mixing in AlScN/SiC]
  #v(4pt)
  A. K. Behera#super[1,†], B. Smith#super[2,†], X. Du#super[3], Y. Deng#super[4],
  M. Miller#super[2], N. Sagartz#super[2], M. Koppa#super[2], C. T. Harris#super[1],
  M. Lilly#super[1], R. H. Olsson III#super[3], M. Eichenfield#super[1,2,4],
  and L. Hackett#super[2,\*]

  #super[1] Center for Integrated Nanotechnologies, Sandia National Laboratories, Albuquerque, New Mexico 87185, USA \
  #super[2] Microsystems Engineering, Science, and Applications, Sandia National Laboratories, Albuquerque, New Mexico 87123, USA \
  #super[3] Department of Electrical and Systems Engineering, University of Pennsylvania, Philadelphia, Pennsylvania 19104, USA \
  #super[4] Electrical, Computer and Energy Engineering, University of Colorado, Boulder, Colorado 80309, USA

  † These authors contributed equally. \
  \* Correspondence: #link("mailto:lahacke@sandia.gov")
]
#heading(numbering: none)[Abstract]
Surface acoustic wave platforms based on piezoelectric thin-film
heterostructures provide sub-wavelength acoustic confinement, making
them attractive for compact nonlinear phononic systems with applications
including frequency conversion, parametric interactions, and nonlinear
signal processing. Here, we investigate guided surface acoustic wave
phononic four-wave mixing at gigahertz frequencies in an aluminum
scandium nitride (Al$""_0.58$Sc$""_0.42$N)/4H--silicon carbide
heterostructure operated at both room temperature (295 K) and cryogenic
temperature (4 K). The 500 nm thick aluminum scandium nitride film
supports guided Rayleigh and Sezawa modes with distinct displacement and
strain energy density distributions, allowing a direct comparison of
mode-dependent nonlinear behavior within the same device.
Continuous-wave four-wave mixing measurements reveal an enhancement in
the extracted modal nonlinear coefficient at 4 K relative to 295 K for
both modes. In addition, the Rayleigh mode exhibits a modal nonlinearity
approximately two orders of magnitude larger than that of the Sezawa
mode across both temperature regimes. These results demonstrate that
phononic four-wave mixing is strongly influenced by temperature, mode
confinement, and strain localization while establishing aluminum
scandium nitride on silicon carbide heterostructures as a promising
platform for engineering enhanced nonlinear phononic interactions for
future classical and quantum acoustic on-chip signal processing systems.

= Introduction
<introduction>
The optical Kerr effect, arising from a material's third-order nonlinear
susceptibility, $chi^(\( 3 \))$, has an acoustic analogue in which
strain-dependent nonlinearities produce four-wave mixing between
phonons.@kurosu_mechanical_2020@mayor_gigahertz_2021@hackett_giant_2024
In photonics, Kerr nonlinearities underpin a wide range of classical and
quantum technologies, including wavelength conversion, frequency-comb
generation, parametric amplification, and nonlinear quantum light
generation.@lin_kerr_2022@stone_wavelength-accurate_2024@miller_-chip_2014@wu_visible--ultraviolet_2024@kuznetsov_ultra-broadband_2025@moody_chip-scale_2020@yesharim_bulk_2025@tziperman_nonlinear_2025
Establishing mechanisms to harness and optimize on-chip phononic
third-order nonlinear processes could bring similar functionality into
the acoustic domain for classical radio frequency (RF) signal
processing,@campbell_surface_2012 quantum
phononics,@dumur_quantum_2021@chou_deterministic_2025 and hybrid quantum
acoustic platforms that interface phonons with superconducting or
solid-state quantum
systems.@clerk_hybrid_2020@gustafsson_propagating_2014

Surface acoustic waves (SAWs) confine acoustic energy within
approximately one wavelength of the surface, resulting in large local
strain in a small effective mode
volume.@campbell_surface_1998@royer_elastic_1999 In layered
piezoelectric heterostructures, such as aluminum scandium nitride
(AlScN) on silicon carbide (SiC), acoustic velocity mismatch between the
thin film and substrate gives rise to guided slab-mode SAW phononic
waveguides that exhibit enhanced vertical confinement over conventional
SAWs. SAW-based technologies are becoming increasingly diverse including
acousto-optic beam steering,@li_frequencyangular_2023
biosensing,@lange_surface_2008 microfluidics,@ding_surface_2013 acoustic
tweezers,@ozcelik_acoustic_2018 long-range exciton transport in
two-dimensional materials,@peng_long-range_2022 and magnetoelastic
modulation of magnetic domain walls@froes_magnetoelastic_2022 in
addition to chip-scale components for the RF front end such as high
performance filters,@lu_recent_2025
amplifiers,@mansoorzare_micromachined_2022@hackett_non-reciprocal_2023@ghosh_acoustoelectric_2019
and
oscillators.@chang_voltage-controlled_2024@zhang_surface_2020@tanaka_lithium-niobate-based_2012@xi_low-phase-noise_2025@wendt_electrically_2025
Quantum SAW applications include manipulating superconducting qubit
states,@pirkkalainen_hybrid_2013@maity_coherent_2020 performing
spectroscopy and coherent operations on quantized phononic modes in
nanomechanical resonators,@arrangoiz-arriola_resolving_2019 and enabling
strain-mediated spin control.@maity_mechanical_2022 Further
understanding the mechanisms for harnessing nonlinearities in guided SAW
modes provides a route to enhancing the functionality of existing
SAW-based platforms, enabling integrated nonlinear phononic signal
processors and new capabilities in hybrid quantum--acoustic interfaces,
such as SAW-mediated coupling between phonons and co-integrated quantum
systems. At the same time, a detailed understanding of phononic
nonlinearities is essential for applications that demand highly linear
operation, where suppressing unwanted nonlinear mixing is critical for
preserving signal fidelity and quantum coherence.

On-chip phononic four-wave mixing has been previously demonstrated
across several material platforms. A mechanical analogue of Kerr fiber
optics was realized in a flexural-mode GaAs/AlGaAs nanoelectromechanical
waveguide, where self-phase modulation, cross-phase modulation, and
four-wave mixing were observed at megahertz
frequencies.@kurosu_mechanical_2020 Gigahertz-frequency four-wave mixing
and cascaded sideband generation were shown in thin-film lithium niobate
phononic integrated circuits.@mayor_gigahertz_2021 In addition,
electron-mediated phononic nonlinearities in semiconductor-piezoelectric
heterostructures have been shown to significantly enhance the phononic
third-order nonlinearity and thus the four-wave mixing power conversion
efficiency compared to the case where the nonlinearity arises solely
from the piezoelectric
material.@hackett_giant_2024@mansoorzare_acoustoelectric-driven_2023

In this work, we study phononic four-wave mixing in a 500 nm thick
aluminum scandium nitride/4H-silicon carbide
(Al$""_0.58$Sc$""_0.42$N/SiC) thin film heterostructure at gigahertz
frequencies. We carry out four-wave-mixing measurements at room (295 K)
and cryogenic (4 K) temperatures to characterize the intrinsic
piezoelectric acoustic nonlinearity of the Rayleigh and Sezawa guided
SAW modes supported in this material stack. The Rayleigh mode exhibits
strongly surface-localized strain with coupled longitudinal (in-plane)
and vertical (out-of-plane) displacements, whereas the Sezawa mode has a
strain-energy profile that extends more deeply into the SiC substrate.
Our results show a significant enhancement in four-wave mixing power
conversion efficiency for the Rayleigh mode compared to the Sezawa mode,
as well as a temperature-dependent enhancement for both modes at 4 K
relative to 295 K.

To interpret these results, we apply the standard undepleted four-wave
mixing model from Kerr nonlinear optics, which assumes linear loss and a
power-independent modal nonlinear coefficient. Within this framework,
the measured enhancement in conversion efficiency is consistent with an
intrinsic increase in the modal nonlinearity. However, at the same time,
our experimental results exhibit clear departures from the model's
assumptions, revealing nonlinear behavior beyond that captured by a
Kerr-type approximation. Overall, the results presented in this work
offer additional insight into the nonlinear mechanisms governing guided
SAW systems and establish new methods to engineer phononic devices that
leverage controlled nonlinear interactions.

#figure(image("source/Fig_1.jpg"),
  caption: [
    (a) The modeled normalized mechanical displacement field for
    the Rayleigh mode (left) and Sezawa mode (right) in the 500 nm thick
    Al$""_0.58$Sc$""_0.42$N/SiC material platform. The acoustic
    wavelength, $lambda$, was set to 1.5 μm. (b) Modeled acoustic
    frequency with electrically open and shorted boundary conditions on
    the Al$""_0.58$Sc$""_0.42$N surface as a function of the acoustic
    propagation constant. The modeled $k^2$ values for Rayleigh and
    Sezawa modes were 1.1% and 4.8%, respectively. (c) An image of the
    fabricated Al$""_0.58$Sc$""_0.42$N/SiC chip wirebonded onto a QBoard
    used for characterization. (d) A microscope image of a guided SAW
    delay line, which consists of an input IDT, a propagation region,
    and an output IDT. The inset shows a schematic of the split finger
    IDT design. (e) A scanning electron microscope image of the
    fabricated IDT electrodes.
  ]
)
<fig:1>

= Experimental Procedures
<experimental-procedures>
The c-axis-oriented Al$""_0.58$Sc$""_0.42$N thin film was prepared on a
4H-SiC substrate by reactive pulsed-DC magnetron co-sputtering. The
deposition was performed with a heater temperature of 500 $""^compose$C
and a N$""_2$ flow of 20 sccm. Magnetron powers of 875 W and 770 W were
applied to the Al and the Sc targets, respectively. To suppress
abnormally oriented grains, the AlScN stack was initiated with a 15 nm
AlN seed layer followed by a 35 nm compositional gradient layer in which
the Sc concentration was linearly increased from 0% to
42%.@hackett_s-band_2024@du_near_2024 A 450 nm thick layer of
Al$""_0.58$Sc$""_0.42$N was then grown, such that the total
piezoelectric film thickness was 500 nm.

The interdigital transducers (IDTs) of the piezoelectric acoustic wave
delay line were fabricated on the Al$""_0.58$Sc$""_0.42$N/SiC platform
using a two-step patterning process of electron beam (e-beam)
lithography and photolithography. First, e-beam lithography defined the
split finger IDT electrodes with an acoustic wavelength, $lambda$, of
1.5 μm followed by metal evaporation and liftoff of 5 nm titanium (Ti)
and 70 nm aluminum (Al). A subsequent photolithography step patterned
the bus lines connecting fingers of identical polarity to their contact
pads for wirebonding. The sample was then loaded into an e-beam
deposition chamber equipped with in-situ ion milling. A brief ion mill
step removed any insulating AlO$""_x$ layer formed on the Al surface
during ambient exposure, ensuring low-resistance electrical contact to a
subsequent metal stack of 20 nm Ti and 200 nm gold (Au), which was
evaporated onto the samples followed by liftoff to complete the
fabrication.

The guided SAW delay line device used for four-wave mixing measurements
was wirebonded to a Quantum Machines QBoard, which provides a low-loss,
impedance-controlled RF interface compatible with cryogenic operation,
and was measured in a custom Janis liquid-helium flow cryostat.
Scattering parameters (S-parameters) of the guided SAW delay line
devices were characterized using a calibrated Agilent Technologies
E5071C vector network analyzer (VNA). For four-wave mixing experiments,
two Keysight N5171B RF signal generators provided the pump tones, which
were combined and applied to the input IDT. The output spectrum was
characterized using an Agilent Technologies MXA N9020A signal analyzer
with a 1 kHz resolution bandwidth and a 100 Hz video bandwidth.
Propagation loss and acoustic reflectivity measurements were performed
on separate test structures fabricated on a dedicated chip. Those
measurements were carried out in a Montana Instruments cryostat using
ground--signal--ground (GSG) RF probes.

= Results and Discussion
<results-and-discussion>
#figure(image("source/Fig_2.jpg"),
  caption: [
    (a) S$""_21$ as a function of frequency in the guided SAW
    delay line measured at 295 K and at 4 K. The local maxima across the
    transmission shows the Rayleigh and Sezawa modes at 3.5 GHz and at
    4.7 GHz, respectively. (b,c) The measured transmission and the
    respective time gated transmission extracted for the delay line at
    295 K for Rayleigh and Sezawa modes. (d,e) The measured transmission
    and the respective time gated transmission extracted for the delay
    line at 4 K for Rayleigh and Sezawa modes.
  ]
)
<fig:2>

Figure @fig:1\(a) shows the computed normalized displacement fields in
the Al$""_0.58$Sc$""_0.42$N/SiC heterostructure for the Rayleigh and
Sezawa modes at an acoustic wavelength of 1.5 μm from a finite element
method (FEM) model. The Rayleigh mode has a displacement amplitude that
peaks at the free surface and then decreases with increasing depth into
the SiC substrate. The majority of the strain energy density is confined
within the Al$""_0.58$Sc$""_0.42$N layer. The associated particle motion
is elliptical with mixed in-plane (longitudinal) and out-of-plane
(vertical) displacement components, which leads to large in-plane and
out-of-plane displacement gradients near the surface and a mixture of
normal and shear strain components in the piezoelectric film. In
contrast, the Sezawa mode exhibits mixed in-plane and out-of-plane
particle motion that is distributed across the film thickness, with
stronger participation near the Al$""_0.58$Sc$""_0.42$N/SiC interface.
The displacement amplitude peaks within the Al$""_0.58$Sc$""_0.42$N
layer, with a significantly larger fraction extending into the SiC
substrate compared to the Rayleigh mode. The strain energy density is
therefore more broadly distributed between the Al$""_0.58$Sc$""_0.42$N
and the SiC.

We used FEM simulations to compute the acoustic eigenfrequencies of the
Rayleigh and Sezawa modes with electrically open or shorted boundary
conditions for a wavelength range of 1.3 μm to 1.7 μm. The resulting
mode frequencies as a function of the acoustic propagation constant are
shown in @fig:1\(b). As expected, we find that the Sezawa mode has
a higher modeled electromechanical coupling coefficient, $k^2$, of
$approx$4.8% when compared to the Rayleigh mode, which has a modeled
$k^2$ value of $approx$1.1%.

Figure @fig:1\(c) shows an optical image of a fabricated
Al$""_0.58$Sc$""_0.42$N/SiC chip patterned with SAW delay lines
wirebonded to a QBoard. Figure @fig:1\(d) shows a microscope image of a
single delay line device that consists of input and output IDTs on the
Al$""_0.58$Sc$""_0.42$N surface. The IDTs have a wavelength of 1.5 μm,
an aperture, $A$, of 10 μm, and are separated by a propagation distance,
$L$, of 50 μm. The input IDT launches bi-directional SAWs by converting
an applied RF electrical signal into a RF acoustic signal through the
inverse piezoelectric effect. To suppress spurious reflections, we use a
split finger IDT design in which each electrode with a width of
$lambda \/ 4$ is split into two electrodes with widths of $lambda \/ 8$
spaced by $lambda \/ 8$ (see inset @fig:1\(d)).@royer_elastic_1999
A scanning electron microscope image of the fabricated IDT electrodes
with the split finger configuration is shown in @fig:1\(e).

We calibrated the VNA using a standard short-load-open-through (SLOT)
method. VNA calibration removes the frequency-dependent effects of the
measurement setup up to the calibration plane, allowing isolated
S-parameter measurements of the device under test. In our configuration,
the calibration plane ended at the external connectors of the QBoard,
such that the cryostat wiring and wirebonds were not calibrated out,
which contributed to a broadband electromagnetic background in the
measured S-parameter spectra.

The guided SAW delay line transmission, S$""_21$, as a function of
frequency is shown in @fig:2\(a) for 295 K and 4 K. Two
transmission peaks appear at $approx$ 3.5 GHz and $approx$ 4.7 GHz, that
we identify as the Rayleigh and Sezawa modes, respectively, from FEM
modeling. A significant broadband electromagnetic background is present,
which we attribute to the uncalibrated section of the measurement path.

From 295 K to 4 K, there is a transmission increase for both modes as
well as a resonance frequency shift from 3.46 GHz to 3.48 GHz for the
Rayleigh mode and 4.67 GHz to 4.7 GHz for the Sezawa mode. To isolate
the piezoelectric acoustic contribution from the electromagnetic
background, we performed a time-gating analysis. The measured complex
S$""_21$ data was converted to the time domain using an Inverse Fast
Fourier Transform (IFFT), a temporal window was applied around the
expected acoustic arrival time, and the gated signal was then converted
back to the frequency domain via a FFT to obtain the time-gated signal.

Figures @fig:2 (b) and (c) show the measured and time-gated transmission
for Rayleigh and Sezawa modes at 295K, respectively. Figures @fig:2\(d)
and (e) show the corresponding results at 4 K. At 295 K, the maximum
measured transmission was -31.26 dB for the Rayleigh mode and -22.55 dB
for the Sezawa mode, while at 4 K the transmission improved to -26.26 dB
and -18.47 dB for the Rayleigh and Sezawa modes, respectively. The
time-gated traces show similar trends, with increased transmission from
\-42.87 dB to -35.21 dB for the Rayleigh mode and -24.71 dB to -21.62 dB
for the Sezawa mode from 295 K to 4K. The increased transmission at 4 K
is consistent with a reduction in acoustic propagation loss in the
Al$""_0.58$Sc$""_0.42$N/SiC heterostructure, likely arising from
suppressed phonon-phonon scattering.

#figure(image("source/Fig_3.jpg"),
  caption: [
    (a) Energy-level diagrams illustrating degenerate four-wave
    mixing, where two phonons at one frequency and one phonon at a
    second frequency participate in a third-order acoustic nonlinear
    interaction via a $chi_(upright("acoustic"))^3$ to generate new
    sideband phonons. (b) A schematic of the the four-wave mixing
    experimental setup. Two RF sources were used to supply two pump
    tones to the input IDT driven at $f_1$ and $f_2$ frequencies. The
    output signal was collected by an IDT and characterized using a
    spectrum analyzer. (c,d) Comb lines observed due to four-wave mixing
    at 4 K for Rayleigh and Sezawa modes, respectively with the RF
    signal generator power set to -10 dBm. (e) Extracted power
    conversion efficiency, $eta_0$, as a function of input acoustic pump
    power, $P'_0 ""^2$, for the Rayleigh and Sezawa modes at 295 K and 4
    K. (f) Extracted modal nonlinear coefficient, $gamma_m$, as a
    function of input acoustic power, $P'_0 ""^2$, at 295 K and 4 K.
  ]
)
<fig:3>

SAW four-wave mixing arises due to an effective third-order acoustic
susceptibility, $chi_(upright("acoustic"))^(\( 3 \))$, that is expected
to depend on factors such as strain localization, strain tensor
symmetry, modal overlap with regions of large higher-order elastic and
piezoelectric coefficients, nonlinear dielectric response, and
interfacial effects. The differences in modal confinement and spatial
field distribution for the Rayleigh and Sezawa modes makes the
Al$""_0.58$Sc$""_0.42$N/SiC material platform compelling for
investigating variations in nonlinear phononic behavior within the same
device. When two phononic pump tones at angular frequencies $omega_1$
and $omega_2$ are launched into the delay line, degenerate four-wave
mixing generates sidebands at $omega_112 = 2 omega_1 - omega_2$ and
$omega_221 = 2 omega_2 - omega_1$, as shown in the energy level diagrams
in @fig:3\(a). The four-wave mixing measurement method utilized
here is shown in @fig:3\(b). Two RF signal generators supplied pump
tones at frequencies $f_1$ and $f_2 = f_1 + Delta f$ where $Delta f$ = 1
MHz such that both pump tones remained within the IDT passbands for the
Rayleigh and Sezawa modes, which were identified using the time-gated
data for the transmission as a function of frequency. The pump tones
were combined using a power combiner (PC) and then applied to the input
IDT. As the acoustic waves propagated through the
Al$""_0.58$Sc$""_0.42$N/SiC heterostructure, the third-order acoustic
nonlinearity generated cascaded four-wave mixing sidebands, which were
transduced back into electrical signals at the output IDT and recorded
using a spectrum analyzer. For the first-order sidebands considered
here, phase mismatch is negligible because the interaction region is
short with an effective length, $L_(upright("eff"))$, of approximately
50 μm and the acoustic dispersion over the relevant frequency span is
weak. Using FEM-computed acoustic phase velocities to evaluate the
wavevector mismatch, $Delta k$, we find
$\| Delta k \| L_(upright(e f f)) lt.double 1$.

Figure @fig:3\(c) shows the measured four-wave mixing spectrum for the
Rayleigh mode at 4 K. Two pump tones at $f_1$ and $f_2$ were centered at
$approx$3.488 GHz and the power on the RF signal generators was set to
\-10 dBm. Two distinct sidebands of lower amplitudes labeled as $f_112$
and $f_221$ appeared at a $Delta f$ frequency spacing away from $f_1$
and $f_2$, respectively, which is consistent with degenerate four-wave
mixing in the delay line. Figure @fig:3\(d) shows the corresponding
spectrum for the Sezawa mode with the pump tones centered around
$approx$4.702 GHz. For the Rayleigh mode spectrum (@fig:3 (c)),
weaker secondary sidebands at 2$Delta f$ were also present above the
noise floor. For clarity, we label the primary pump tones as $n = 0_(-)$
and $0_(+)$ and the successive sidebands as
$n = plus.minus 1 \, plus.minus 2 \, . . .$. The sideband power for a
fixed length depends on the acoustic pump power, the acoustic
propagation loss, $alpha$, and the four-wave mixing modal nonlinear
coefficient, $gamma_m$, which parameterizes the strength of the
underlying third-order acoustic nonlinearity.

The power conversion efficiency (PCE), $eta_(0 plus.minus)$, for
degenerate four-wave mixing is given by
$ eta_(0 plus.minus) = #scale(x: 240%, y: 240%)[\|] P_(1 minus.plus) / P_(0 plus.minus) #scale(x: 240%, y: 240%)[\|] = Gamma P'_(0 minus.plus) ""^2 $<eq:1>
where $P_(1 minus.plus)$ is the measured sideband power,
$P_(0 plus.minus)$ is the measured pump tone power, $P'_(0 minus.plus)$
is the input acoustic pump power at the beginning of the SAW waveguide,
and $Gamma$ is the four-wave mixing coefficient. $P'_(0 minus.plus)$ was
determined by first estimating the net loss across the measurement chain
by calculating $upright("Loss") = P_(o u t) - P_(i n) - P_(P C)$ where
$P_(o u t)$ is the measured pump tone power, $P_(i n)$ is the RF signal
generator power, and $P_(P C)$ is the transmission of the power
combiner, which was measured to be $approx.eq$-5.6 dB over the frequency
range of interest. Assuming symmetry of the experimental setup, the
total loss, after subtracting propagation loss, was evenly divided
between input and output losses which include contributions from
cryostat cabling, wirebonds, and IDT transduction. This enables us to
extract the acoustic pump power at the input IDT, which can be written
as $P'_0 = P_(i n) + P_(P C) + upright("Loss") / 2 - P_(p r o p) / 2$
where $P_(p r o p)$ is the propagation loss across the waveguide
channel. The propagation losses were independently measured as discussed
later in this section.

Figure @fig:3\(e) shows the extracted PCE for the Rayleigh and Sezawa
modes at 295 K and 4 K on a log-log scale as a function of the squared
input acoustic power. In the low power regime, we include only data for
which the sideband powers are at least 4 dB above the spectral noise
floor. At higher pump powers, we exclude data once the PCE clearly
departs from the expected $P'_0 ""^2$ scaling, which is consistent with
saturation or additional nonlinear processes.

Several trends emerge in the PCE depicted in @fig:3 (e) as a
function of $P'_0 ""^2$. First, the PCE for both the Rayleigh and Sezawa
modes increases with respect to $P'_0 ""^2$ at 295 K and 4 K, consistent
with degenerate four-wave mixing. Second, two distinct groups of data
emerge where the Rayleigh mode displays a significantly higher PCE
compared to the Sezawa mode. Third, both modes display an enhanced PCE
at 4 K compared to 295 K for a given input power. At 295 K, the maximum
PCE for the Sezawa mode was 1.5$times$10$""^(- 4)$% at an acoustic input
power of 78.2 μW whereas a significantly larger maximum PCE of
1.7$times$10$""^(- 2)$% was achieved for the Rayleigh mode at a lower
acoustic input power of 2.63 μW. We calculated the four-wave mixing
coefficient, $Gamma$, from Eq. (@eq:1) by fitting the slope of measured
PCE with respect to the input power. At 295 K,
$Gamma = \( 1.9 times 10^(- 4) plus.minus 1.3 times 10^(- 5) \)$
mW$""^(- 2)$ was obtained for the Sezawa mode, whereas a significantly
larger value of $Gamma = \( 50.4 plus.minus 3.2 \)$ mW$""^(- 2)$ was
extracted for the Rayleigh mode. Furthermore, we observed an enhancement
in the extracted four-wave mixing coefficient at 4 K as compared to 295
K where values of
$Gamma = \( 3.9 times 10^(- 3) plus.minus 1.6 times 10^(- 4) \)$
mW$""^(- 2)$ and $Gamma = \( 813 plus.minus 48$) mW$""^(- 2)$ were
obtained for Sezawa and Rayleigh modes at 4 K, respectively. The errors
in the listed $Gamma$ values were obtained from the accuracy of the
fits.

The modal nonlinear coefficient, $gamma_m$, can then be calculated from
the extracted $Gamma$ according to
$ gamma_m = sqrt(Gamma) / L_(upright("eff")) $<eq:2> where
$L_(upright("eff"))$ is the effective nonlinear interaction length given
by
$ L_(upright("eff")) = #scale(x: 240%, y: 240%)[\(] frac(1 - e^(- alpha L), alpha) #scale(x: 240%, y: 240%)[\)] $<eq:3>
where $L$ is the physical length of the guided SAW waveguide and $alpha$
is the acoustic propagation loss. To estimate the acoustic propagation
loss in the Al$""_0.58$Sc$""_0.42$N/SiC heterostructure, we fabricated
multiple waveguides with identical split finger IDTs (@fig:1 (d))
and varying propagation lengths ranging from 50 μm to 500 μm with a 50
μm aperture. The 50 μm aperture was used to suppress diffraction losses
at longer propagation lengths. By measuring and fitting the peak
transmission as a function of the propagation distance, we estimated the
propagation loss for the Rayleigh and Sezawa modes at 295 K and 4 K. At
295 K, the extracted propagation losses were (106 $plus.minus$ 19) dB/cm
for the Rayleigh mode and (96 $plus.minus$ 8) dB/cm for the Sezawa mode.
After cooling to 4 K, the propagation losses were reduced to (8
$plus.minus$ 40) dB/cm and (24 $plus.minus$ 8) dB/cm for the Rayleigh
and Sezawa modes, respectively. The substantially larger relative
uncertainty for the Rayleigh mode at 4 K arises from the formation of a
weak acoustic cavity due to reflections in the device, despite the use
of a split finger IDT design, which is expected to significantly reduce
the acoustic reflectivity of the transducer. By using the values for
$alpha$ and $Gamma$ in Eq. (@eq:2) and Eq. (@eq:3), we determined the
modal nonlinear coefficients. For the Rayleigh mode, $gamma_m = \($151
$plus.minus$ 9) mW$""^(- 1)$mm$""^(- 1)$ at 295 K and (573 $plus.minus$
22) mW$""^(- 1)$mm$""^(- 1)$ at 4 K were obtained. For the Sezawa mode,
on the other hand, at 295 K, $gamma_m =$\(0.3 $plus.minus$ 0.04)
mW$""^(- 1)$mm$""^(- 1)$ was obtained with an enhancement to (1.3
$plus.minus$ 0.2) mW$""^(- 1)$mm$""^(- 1)$ at 4 K. The errors in the
reported $gamma_m$ originate from the relative errors in $Gamma$ and
$alpha$.

For the undepleted, Kerr-type model described by Eqs. (@eq:1) and
(@eq:2), one would expect the modal nonlinear coefficient, $gamma_m$, to
be independent of input power. However, by investigating the extracted
$gamma_m$ at each input power, we observe a clear power-dependent
behavior. Figure @fig:3\(f) shows $gamma_m$ as a function of $P'_0 ""^2$
for the Rayleigh and Sezawa modes at 295 K and 4 K extracted by using
Eqs. (@eq:2) and (@eq:3). Just like the PCE, the data separates into two
distinct groups corresponding to the Rayleigh and Sezawa modes, with the
Rayleigh mode having a significantly larger $gamma_m$ as expected. At
295 K, the maximum values for $gamma_m$ were 220
mW$""^(- 1)$mm$""^(- 1)$ for the Rayleigh mode and 0.96
mW$""^(- 1)$mm$""^(- 1)$. There is an enhancement to the $gamma_m$
values at 4 K when compared to 295 K. For the Rayleigh mode at 4 K, the
maximum $gamma_m$ is 1367 mW$""^(- 1)$mm$""^(- 1)$ while for the Sezawa
mode at 4 K the maximum $gamma_m$ is 22 mW$""^(- 1)$mm$""^(- 1) .$

The experimentally observed power dependence and apparent reduction in
$gamma_m$ with higher acoustic input power indicate that our results
deviate from the simple Kerr-type description of four-wave mixing. At
higher input power, additional nonlinear processes beyond degenerate
four-wave mixing can become significant, including third-harmonic
generation and higher-order mixing products that may divert acoustic
power away from the measured four-wave mixing sidebands. These
additional frequency components are strongly attenuated by the output
IDT and therefore are not able to be captured in measured spectra. In
addition, at large pump amplitudes, higher odd-order nonlinearities can
generate cross-Kerr like sidebands at the same offest frequencies as
those produced by the third-order process. Such contributions cannot be
distinguished from $chi_(upright("acoustic"))^(\( 3 \))$ driven
sidebands in our measurements, yet they can exhibit substantially
different pump-power scaling and relative sideband phases, which could
contribute to the observed deviation from the simple Kerr model. As a
result, extracting $gamma_m$ from only the four-wave mixing sideband
power may not accurately capture the underlying
$chi_(upright("acoustic"))^(\( 3 \))$ at higher acoustic input power. An
amplitude-dependent reduction of $chi_(upright("acoustic"))^(\( 3 \))$,
which could arise from anharmonic elastic saturation, nonlinear
dissipation, or mode-profile distortion at high strain, also cannot be
excluded with only the data presented here.

We next examine factors that could influence the extracted modal
nonlinear coefficients and potentially contribute to the observed
differences between the Rayleigh and Sezawa modes. The undepleted,
phase-matched four-wave mixing model applied here (Eqs. (@eq:1[]–@eq:3)),
assumes single-pass acoustic propagation and neglects pump power
enhancement that could arise from multiple reflections at the IDTs.
Given the low propagation loss expected in a 50 μm delay length, even
small IDT reflections can lead to the formation of a weak acoustic
cavity. Although the split finger IDT design utilized here (see @fig:1\(d)) is meant to reduce IDT reflectivity, small reflections over
a short propagation distance combined with low propagation loss can
still result in resonator pump power build-up within the guided SAW
waveguide. In this case, the effective acoustic pump power participating
in the nonlinear interaction can be enhanced relative to the assumed
single-pass value.

We estimate the magnitude of the pump power enhancement using a resonant
build-up factor: $ B = frac(1, \( 1 - R e^(- alpha L) \)^2) $<eq:4>
where $R$ is the IDT reflectivity. The intracavity pump power is then
$P_(0 minus.plus)^(c a v i t y) = B P'_(0 minus.plus)$. Equation (4)
assumes excitation on resonance and therefore provides an upper bound on
the intracavity pump power enhancement and correspondingly on the
cavity-induced modification of the modal nonlinearity. Here, we have
treated the guided SAW waveguide as a phononic analogue of an optical
Fabry-Perot cavity with internal resonance power enhancement with
identical mirrors.@boyd_nonlinear_2008

We determined the reflectivity of our IDTs by characterizing the
transmission ripples across the passband for both Rayleigh and Sezawa
modes at 295 K and 4 K. The reflectivity was determined according to
$R = frac(1 - sqrt(1 - V^2), V) e^(alpha L)$, where
$V = frac(sum_(i = 1)^n \( frac(T_(m a x) - T_(m i n), T_(m a x) + T_(m i n)) \), n)$
is the fringe visibility calculated for $n$ ripples where each ripple
has a maximum and minimum transmission denoted by $T_(m a x)$ and
$T_(m i n)$, respectively.@pedrotti_introduction_2017 We obtained
reflectivities of 0.136 and 0.098 at 295 K for the Rayleigh and Sezawa
modes, respectively. At 4 K, the reflectivity values increased to 0.3
for the Rayleigh mode and 0.135 for the Sezawa mode. Even with a
substantial uncertainty in the propagation loss for Rayleigh mode at 4
K, the extracted reflectivity only changes by 10% because the
propagation distance is short and therefore $e^(alpha L)$ is close to
unity. The enhanced reflectivity that we extract at 4 K could be due to
reduced resistive losses in the Al IDTs at cryogenic temperatures
producing altered boundary conditions at the AlScN/Al interfaces.

To account for the pump power enhancement, the modal nonlinear
coefficient was calculated according to
$ gamma_m = frac(sqrt(Gamma), B L_(upright("eff"))) . $<eq:5> According
to Eq. @eq:5, the Rayleigh mode four-wave mixing modal nonlinearity is
($117 plus.minus 7$) mW$""^(- 1)$mm$""^(- 1)$ at 295 K and
($283 plus.minus 11$) mW$""^(- 1)$mm$""^(- 1)$ at 4 K. The values for
the Sezawa mode are ($0.24 plus.minus 0.03$) mW$""^(- 1)$mm$""^(- 1)$
and ($0.96 plus.minus 0.1$) mW$""^(- 1)$mm$""^(- 1)$ at 295 K and 4 K,
respectively, with uncertainties originating from the four wave mixing
coefficient, $Gamma$, and propagation loss, $alpha$, in $B$ and
$L_(upright("eff"))$. We therefore find that the cavity-enhanced pump
power cannot account for the enhanced $gamma_m$ observed for the
Rayleigh mode over the Sezawa mode and for 4 K compared to 295 K for
both modes.

In addition to cavity effects, our $gamma_m$ values could also be
impacted from undesirable nonlinear contributions in the measurement
signal chain itself, such as a four-wave mixing nonlinearity arising
from the power combiner or spectrum analyzer. To ensure that we only
recorded the nonlinear properties of the guided SAW waveguide, we
performed a control four-wave mixing measurement through the wirebonded
QBoard bypassing our fabricated phononic waveguide. Under the spectrum
analyzer settings used for this work, which were chosen specifically to
lower the noise floor and also suppress analyzer-induced nonlinearities,
we observed no sideband generation for the input powers reported in @fig:3. Comb-like sidebands were only detected when the RF signal
generator power exceeded the maximum values reported in this work by 25
dBm. This control experiment then confirmed that the measured four-wave
mixing response that we report here is from the guided SAW waveguide.

= Discussion
<discussion>
Previous experimental studies of on-chip phononic four-wave mixing at
gigahertz frequencies have primarily focused on shear-horizontal or
quasi-shear horizontal modes in lithium niobate thin film systems at
room temperature. @mayor_gigahertz_2021@hackett_giant_2024 To the best
of our knowledge, here we report the first-ever gigahertz frequencies
on-chip four-wave mixing for the Rayleigh and Sezawa modes and the
first-ever measurements at cryogenic temperatures. Our results suggest
that the Rayleigh mode in the Al$""_0.58$Sc$""_0.42$N/SiC
heterostructure supports an intrinsically large four-wave mixing modal
nonlinear coefficient while the Sezawa mode may be more well-suited for
applications where it is desirable to suppress the third-order
nonlinearity. Furthermore, the spatial distributions of displacement
fields and strain energy density play a critical role in determining
nonlinear response. Guided structures that concentrate a large fraction
of the strain energy density within the piezoelectric layer appear to be
more favorable for strong nonlinear interactions. Incorporating lateral
confinement into this material system via AlScN etching, which has
already been demonstrated,@deng_monolithic_2025 could provide a critical
tool for engineering nonlinear overlap.

More broadly, the dependence of the intrinsic modal nonlinearity on
waveguide width and effective mode area remains largely experimentally
unexplored. In nonlinear optics, the modal nonlinear coefficients
generally scale inversely with effective mode area, but the relationship
is often more complex due to effects such as field redistribution and
dispersion. A comparable, systematic understanding has not yet been
established for phononic systems. The observed enhancement of phononic
four-wave mixing at cryogenic temperatures does have direct analogues in
nonlinear photonics, where Kerr-type nonlinear processes often exhibit
increased efficiency at low temperatures due to reduced linear loss,
suppression of thermally activated dissipation channels, and reduced
nonlinear dissipation channels. Future work in phononic systems can
leverage temperature-dependent measurements to assess the relative roles
of intrinsic anharmonicity, nonlinear loss, and energy redistribution in
cryogenic nonlinear acoustic interactions. It is also possible that the
intrinsic phononic nonlinearity itself increases at cryogenic
temperatures due to temperature-dependent higher-order elastic,
piezoelectric, or dielectric coefficients, as well as modified defect
and interfacial dynamics, leading to an enhanced effective nonlinear
response.

Electron-mediated phononic nonlinearities also offer a route to enhance
four-wave mixing.@hackett_giant_2024 An Al$""_0.58$Sc$""_0.42$N/SiC
heterostructure has already been successfully integrated with a
semiconductor thin film, @hackett_s-band_2024 providing a clear path to
study this method for enhancing phononic nonlinearities for the Rayleigh
and Sezawa modes. Extending such approaches to cryogenically compatible
and quantum platforms would require alternate semiconductor films with
low carrier freeze-out, such as graphene.

Optimized and controllable phononic nonlinearities could open up new
paths for hybrid acoustic quantum systems, including frequency
conversion between disparate quantum modes, parametric amplification of
mechanical excitations, and nonlinear phononic networks for signal
routing and processing. In the classical domain, it is well-known that
nonlinear phononic devices could enable compact mixers, correlators, and
convolution engines with low power consumption. A more in-depth
understanding of phononic nonlinearities is equally important for
applications where nonlinear distortions can limit performance.
Identifying the mechanisms that give rise to strong nonlinear
interactions provides mechanisms for suppressing unwanted mixing, such
as through mode selection, material modifications, or
strain-distribution control.

= Conclusion
<conclusion>
In this work, we have demonstrated phononic four-wave mixing in an
Al$""_0.58$Sc$""_0.42$N/SiC heterostructure, investigating both Rayleigh
and Sezawa guided SAW modes at room temperature (295 K) and cryogenic
temperature (4 K). We found that the Rayleigh mode exhibits a
substantially larger modal nonlinear coefficient than the Sezawa mode,
with an enhancement of approximately 450X at 4 K and 500X at 295 K. In
addition, both modes show an increase in the four-wave mixing modal
nonlinearity at 4 K relative to 295 K with an enhancement of
approximately 4X for both Rayleigh and Sezawa modes.

These results highlight the strongly modal-dependent and
temperature-dependent nature of phononic nonlinear interactions in
guided SAW systems. The Rayleigh mode is highly surface-localized, with
displacement and elastic strain energy concentrated within the AlScN
thin film, whereas the Sezawa mode exhibits a more distributed field
profile with significant elastic strain energy extending into the SiC
substrate. The enhanced nonlinear response of the Rayleigh mode is
therefore consistent with a larger proportion of the strain energy
density within the film.

Overall, our findings demonstrate that displacement field distribution,
elastic strain energy confinement, and operating temperature are
critical parameters for enhancing or intentionally suppressing
third-order nonlinear interactions in guided SAW platforms. These
insights establish AlScN/SiC heterostructures as a promising and
versatile testbed for engineering temperature-tunable phononic
nonlinearities, with implications for both classical RF nonlinear signal
processing and emerging quantum acoustic technologies operating at
cryogenic temperatures.

= Acknowledgments
<acknowledgments>
This work is supported by the Laboratory Directed Research and
Development program at Sandia National Laboratories, a multimission
laboratory managed and operated by National Technology and Engineering
Solutions of Sandia LLC, a wholly owned subsidiary of Honeywell
International Inc. for the US Department of Energy's National Nuclear
Security Administration under contract DE-NA0003525. This work was
performed, in part, at the Center for Integrated Nanotechnologies, an
Office of Science User Facility, operated for the US Department of
Energy Office of Science. This paper describes objective technical
results and analysis. Any subjective views or opinions that might be
expressed in the paper do not necessarily represent the views of the US
Department of Energy or the US Government.

#bibliography("references.bib", style: "ieee")
