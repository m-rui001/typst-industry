#set page(paper:"a4",margin:23mm,numbering:"1")
#set text(font:"Libertinus Serif",size:10.5pt)
#set par(justify:true,leading:.6em)
#set heading(numbering:"1.1")
#show figure.caption: set text(size:9pt)
#align(center)[
  #text(size:16pt,weight:"bold")[Recent Developments of the VOXES Von Hamos X-ray Spectrometer for Laboratory XES and XAS Studies]
  #v(.6em)
  #link("https://orcid.org/0000-0003-3770-0863")[Simone Manti]#super[1], #link("https://orcid.org/0000-0003-2133-1725")[Alberto Clozza]#super[1], #link("https://orcid.org/0000-0002-9628-3564")[Gabriel Moskal]#super[2,3], #link("https://orcid.org/0000-0001-6879-452X")[Kristian Piscicchia]#super[4,1], #link("https://orcid.org/0009-0002-7486-025X")[Diana Sirghi]#super[4,1,5], #link("https://orcid.org/0000-0002-6143-3200")[Florin Sirghi]#super[1], #link("https://orcid.org/0000-0002-1990-0127")[Catalina Curceanu]#super[1,5], #link("https://orcid.org/0000-0002-7703-7050")[Alessandro Scordo]#super[1]
  #v(.5em)
  #super[1] Laboratori Nazionali di Frascati INFN, Frascati, Italy \
  #super[2] Faculty of Physics, Astronomy, and Applied Computer Science, Jagiellonian University, Kraków, Poland \
  #super[3] Center for Theranostics, Jagiellonian University, Krakow, Poland \
  #super[4] Centro Ricerche Enrico Fermi, Museo Storico della Fisica e Centro Studi e Ricerche "Enrico Fermi", Roma, Italy \
  #super[5] IFIN-HH, Institutul National pentru Fizica si Inginerie Nucleara Horia Hulubei, 30 Reactorului, 077125, Magurele, Romania \
  Corresponding author #link("mailto:Simone.Manti@lnf.infn.it")
]

*Abstract.* VOXES is a Von Hamos X-ray spectrometer developed at the INFN National Laboratories of Frascati for high-resolution laboratory X-ray spectroscopy in the 5--20~keV range. It uses curved mosaic crystals and motorized positioning stages to perform wavelength-dispersive X-ray fluorescence (WD-XRF) with sub-10~eV tunable resolution for extended and dilute samples. Recent developments include the integration of an energy-dispersive X-ray fluorescence (ED-XRF) line based on a silicon pin-diode detector, which enables flux monitoring and simultaneous ED and WD measurements. In addition, a dedicated liquid-sample holder has been introduced, and a Y-shaped support geometry, crucial for switching to a transmission layout, provides mechanical compatibility with laboratory XAS, now under implementation. These upgrades expand the versatility and automation of VOXES, strengthening its role as a table-top platform for laboratory X-ray spectroscopy.

*Keywords.* VOXES, XES, XAS, Von Hamos

= Introduction
<introduction>
X-ray spectroscopy @stohr_nature_2023, in its various forms, offers a
well-established method for probing the state of matter under different
physical and chemical conditions. Different X-ray techniques offer
specific capabilities and applications across diverse fields such as
materials science @ishikawa_beamlines_2018, chemistry and catalysis
@singh_advanced_2010 with applications for battery research
@fehse_rise_2021@rajh_sulfur_2024, gemmology
@bendinelli_gemtelligence_2024, cultural heritage @mantler_x-ray_2000,
environmental analysis @stosnach_environmental_2005, and industrial
quality control @sun_overview_2012. \
Among the techniques that detect X-rays, core-hole spectroscopies
@de_groot_core_2008, such as X-ray Absorption Spectroscopy (XAS) and
X-ray Emission Spectroscopy (XES), play a central role in probing the
local electronic environment of atoms. The creation of a deep-core
vacancy and its subsequent relaxation encode detailed information about
oxidation state, spin configuration, ligand environment, and bonding
characteristics @rovezzi_hard_2014. \
Traditionally, these measurements mostly have been performed at
large-scale facilities, such as synchrotrons and X-ray free-electron
lasers, which provide highly brilliant and tunable X-ray beams
@zhao_synchrotron_2018. Despite their remarkable performance, access to
these infrastructures remains limited due to high demand, restricted
beamtime availability, and the logistical constraints associated with
conducting experiments in a facility. This has driven a growing interest
in developing laboratory-scale X-ray spectroscopy setups
@zimmermann_modern_2020@nemeth_laboratory_2016 capable of delivering
high-resolution measurements using compact and cost-effective X-ray
sources like X-ray tubes @ammann_x-ray_1997. For instance, several
table-top setups have been demonstrated for XAS and XES measurements
@seidler_modern_2016, including configurations capable of performing
both simultaneously
@blachucki_laboratory-based_2019@jahrman_improved_2019. \
In this scenario, the VOXES @scordo_voxes_2018@scordo_efficiency_2021
spectrometer at the INFN National Laboratories of Frascati represents an
example of how optimized optical design, advanced detectors, and precise
motorized positioning systems can significantly enhance the performance
of laboratory XES for large sources. Originally developed for
application of kaonic atom X-ray spectroscopy at DA$Phi$NE
@milardi_preparation_2018 within the SIDDHARTA-2 experiment
@sirghi_siddharta-2_2024, VOXES has evolved into a versatile platform
capable of measuring emission spectra from extended or dilute samples,
with a tunable sub-10 eV energy resolution in the 5--20 keV range
@manti_enhancing_2024. \
In this article, we present the recent developments of the VOXES
spectrometer. We first describe the main features of the setup and its
operation in emission geometry for extended sources. We then introduce
the design upgrades implemented to improve sensitivity and versatility.
Finally, we show how the system can be reconfigured between emission
mode (XES) and transmission mode (XAS), enabling both types of
measurements within the same compact platform. The paper is structured
as follows. Section 2 describes the operating principle of the VOXES
setup. Section 3 presents the updated configuration, which allows
switching between XES and XAS modes. Section 4 concludes the paper.

= VOXES Experimental Setup
<voxes-experimental-setup>
The VOXES experimental setup is shown in @fig:VOXES. It consists of
two complementary detection lines: a Wavelength-Dispersive (WD)-XRF line
based on a Von Hamos geometry with a mosaic crystal, and an
Energy-Dispersive (ED)-XRF line using a compact silicon detector. The
entire spectrometer is mounted on a motorized rail system to ensure
reproducible positioning and remote operation. \

#figure(image("source/1_VOXES.png"),
  caption: [
    The VOXES experimental setup. The X-ray tube on the left directs the
    beam onto the sample holder. After emission, the beam is conditioned
    by adjustable slits and motorized stages to ensure precise
    alignment. The resulting X-rays are diffracted by the mosaic crystal
    and subsequently detected by the position detector placed on the
    right.
  ]
)
<fig:VOXES>

The X-ray source is a MicroXray WindChill tube with a molybdenum anode.
The Mo K$alpha$ line at 17~keV results in a peak-free continuum in the
5--12~keV range, that is ideal for studying $3 d$ transition metals
without source-line contamination. The WD-XRF line consists of a slit
system, a curved mosaic crystal, and a position-sensitive detector. Two
motorized STANDA slits (S$""_1$ and S$""_2$) shape the beam emerging
from the source box and define the effective source size and angular
acceptance. Typical settings are an effective source width of
$S'_0 = 1$~mm and an angular acceptance $Delta theta' = 0.4^compose$
@scordo_efficiency_2021, allowing a controlled trade-off between
spectral resolution and photon flux. The mosaic crystals used in VOXES
are highly annealed pyrolytic graphite (HAPG) crystals, all oriented
along the (002) direction with a lattice spacing of $d = 3.354$~Å. They
share the typical properties of HAPG, namely high reflectivity, low
absorption in the 5--20~keV range, and a controlled mosaic spread that
enables efficient diffraction of divergent beams, with a declared
mosaicity of $0.10^compose plus.minus 0.01^compose$. The specific
crystals available for VOXES differ in their bending radius and
thickness, allowing the instrument to be optimized for different
applications. A set of cylindrical crystals is available with radii
$rho_c = 10.3$~mm, 77.5~mm, 103.4~mm, and 206.7~mm, as well as
thicknesses of 20~$mu$m, 40~$mu$m, and 100~$mu$m. The crystal mount is
actuated by a five-axis STANDA positioning system, enabling fine control
of its position and orientation with respect to the Bragg angle
$theta_B$. \
The diffracted spectrum is recorded with a position-sensitive detector.
Several detectors are available depending on the target energy range and
efficiency requirements. For one-dimensional detection, the setup can
employ a MYTHEN2 strip detector (DECTRIS) with a 50~$mu$m strip pitch
and an active area of 32~$times$~8~mm$""^2$. When two-dimensional
imaging is required, particularly for applications where the vertical
alignment of the dispersed spectrum is critical, an ANDOR iKon-M CCD
camera can be used, featuring a 1024~$times$~1024 pixel sensor with a
13~$times$~13~$mu$m pixel pitch and an active area of approximately
13.3~$times$~13.3~mm$""^2$. Alternatively, a Timepix detector with a
2~$times$~2 module configuration is available, providing a total active
area of 512~$times$~512 pixels with a 55~$mu$m pixel size. All
position-sensitive detectors are mounted on a motorized linear stage
combined with a fine rotation axis, enabling precise positioning and
optimal focusing of the Bragg-diffracted spectrum along the dispersion
direction. \

#figure(image("source/2_XAS_XES.png"),
  caption: [
    VOXES spectrometer in transmission (left) and emission (right)
    modes. In transmission mode, the beam passes through the sample for
    XAS measurements. In emission mode, the emitted X-rays are detected
    for XES analysis. The setup allows switching between the two modes
    by rotating the source and detector assemblies.
  ]
)
<fig:XAS_XES>

FESTO electrical stage motor and STANDA stepper motors provide full
motorization of the slit system, crystal mount, and detector stage. This
ensures stable, repeatable alignment during scans and allows remote
operation during long measurements. Fine adjustments of the Bragg angle
and detector position are controlled through the motorized five-axis
stages, which also provide pitch and roll corrections to maintain
optimal focusing. \
The ED-XRF line can operate in parallel with the WD-XRF system and
employs an Amptek X-123 silicon pin-diode with integrated preamplifier
and digital pulse processing. The detector uses a 25 mm$""^2$ active
area with approximately 500 $mu$m silicon thickness and a thin Be window
(12.5 $mu$m) for optimal transmission of low-energy X-rays. It delivers
an energy resolution of 125--140 eV FWHM at 5.9 keV. The sample holder
is mounted on a motorized rotation stage, allowing the sample to be
oriented toward either the WD-XRF or ED-XRF line. It includes a Y-shaped
aperture, which is used for optical alignment in emission geometry and
also enables transmission of the X-ray beam when the setup is
reconfigured for XAS for future developments. The holder accepts custom
mounts for different sample types; dedicated Teflon cells with thin
Kapton windows were fabricated for liquid samples, enabling measurements
of aqueous or organic solutions without realigning the spectrometer.

= VOXES Operating Modes
<voxes-operating-modes>
The VOXES spectrometer can operate in multiple configurations depending
on the measurement requirements. Its fully motorized geometry allows
switching between WD-XRF and ED-XRF, with minimal manual intervention.
The modular design also enables a transmission configuration that
provides compatibility with XAS measurement, currently under
development. In emission mode, the sample is positioned on the
sample-holder at 45$""^compose$ so that it is directly irradiated by the
X-ray tube. The emitted X-rays then impinge on the mosaic crystal, where
their distance depends on the specific Bragg angle for the emission line
under study. The mosaic crystal diffracts the photons, and the dispersed
spectrum is recorded by the position-sensitive detector (CCD, MYTHEN2,
or Timepix). Motorized slits (S$""_1$ and S$""_2$) allow adjustment of
the effective source size and angular acceptance, allowing a balance of
energy resolution versus counting rate, depending on the target
requirements. This geometry is used for high-resolution studies of
emission lines and for laboratory WD-XRF measurements. \

#figure(image("source/3_Spectra.pdf"),
  caption: [
    WD-XRF Spectrum of a FeCoNi foil (left) used to align and calibrate
    with cobalt and iron reference line. Spectra (right) of high-spin
    K$""_4$FeCN$""_6$ (blue) and low-spin FeSO$""_4$ (orange). The Fe
    K$beta'$ suppression in low-spin compounds is clearly resolved,
    indicating sufficient sensitivity for chemical-state analysis.
  ]
)
<fig:WD-XRF>

An example of the VOXES WD-XRF operating modes is shown in
@fig:WD-XRF obtained with the MYTHEN2 detector. The left panel
displays a spectrum acquired from a FeCoNi metallic foil. This foil is
used during alignment and energy calibration, taking advantage of the
well-separated Co~K$alpha_(1 \, 2)$ and Fe~K$beta$ lines. Once the setup
is aligned and calibrated, the same geometry can be used to investigate
the electronic configuration of iron-containing samples. The right panel
shows two preliminary XES measurements on iron compounds in different
spin states: high-spin for FeSO$""_4$ and low-spin for
K$""_4$FeCN$""_6$. Due to the different spin configuration of iron, high
and low respectively, the K$beta'$ satellite is strongly suppressed in
the low-spin compound, while it is clearly visible in the high-spin case
@lafuerza_chemical_2020 and a few eV shift. This demonstrates the
ability of the VOXES spectrometer to resolve chemical and spin-state
dependent features in the Fe~K$beta_(1 \, 3)$ emission line. \
The ED-XRF line can operate independently and in parallel with the
WD-XRF system. The silicon pin-diode detector is mounted on a motorized
stage that allows it to be positioned closer to the sample to increase
the detected signal, or retracted to avoid excessive dead time when the
emitted flux is high. It collects energy-dispersive fluorescence spectra
in the 2--25 keV range. This mode is typically used to monitor the
emitted flux, particularly from dilute samples such as liquids, or as a
complementary detection channel for quantitative analysis. The sample
holder includes mounts for both solid and liquid samples (see
@fig:sampleholder). Liquid measurements are carried out using
dedicated Teflon pouches with external dimensions of
25~$times$~80~$times$~2.5~mm$""^3$ and an exposed active area of
15~$times$~60~mm$""^2$, encapsulated with 7 $mu$m thin Kapton windows.
The cells can be installed without modifying the optical alignment,
allowing the system to switch rapidly between solid and liquid samples
while preserving the same measurement geometry. The VOXES setup has been
mechanically upgraded to allow operation in a transmission geometry
suitable for laboratory XAS. This configuration is enabled by a Y-shaped
sample holder and a reversible X-ray tube mount, which allows the beam
to illuminate the sample from behind. Although XAS measurements are
still under development, the hardware required to perform absorption
studies is already in place and will be validated in future work.

#figure(image("source/4_Liquid_Sample_Holder.png", width: 90.0%),
  caption: [
    Teflon liquid-sample holder used for solution measurements. The
    liquid is contained in a flexible pouch fixed with Teflon screws to
    prevent metal contamination, and sealed with a Kapton window to
    ensure X-ray transmission.
  ]
)
<fig:sampleholder>

= Conclusion and Outlook
<conclusion-and-outlook>
In this work, we presented the recent developments of the VOXES
spectrometer at the INFN National Laboratories of Frascati. The setup
now features full motorization of all key components, including slits,
crystal and detector, ensuring stable, reproducible, and remotely
controlled operation for laboratory X-ray spectroscopy. The
implementation of a dedicated sample holder, with the possibility to
perform measurements on liquids, expands the range of measurable
materials to include solutions and non-solid samples. In addition, the
integration of a complementary ED-XRF line based on a silicon pin-diode
enables fast alignment, flux monitoring, and simultaneous WD+ED
acquisition, significantly improving workflow efficiency. The mechanical
layout has also been upgraded to allow operation in a transmission mode
geometry. Through the introduction of a Y-shaped sample holder and a
reversible tube mount, the system is now compatible with transmission
mode measurements for acquiring XAS spectra. These improvements increase
the flexibility and usability of the VOXES spectrometer, reinforcing its
role as a compact and versatile platform for laboratory-scale XRF
measurements. Future work will focus on completing the XAS
implementation and further optimizing the automation and
data-acquisition framework.

= Acknowledgments
<acknowledgments>
Project 963530 - RCLIB, "Recycling of the cathodes, based on carbon
nanotubes and conducting polymers, from spent rechargeable Li batteries"
\- call LEAP-RE 2022“

#bibliography("source/HPXM2025.bib",style:"ieee")
