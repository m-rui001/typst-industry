#import "measurement-setup.typ": measurement-setup

#set document(title: "Tungsten Germanide Single-Photon Detectors with Saturated Internal Detection Efficiency at Wavelengths up to 29 µm")
#set page(paper: "us-letter", margin: (x: 116pt, top: 92pt, bottom: 63pt), numbering: "1")
#set text(font: "New Computer Modern", size: 10pt)
#set par(justify: true, leading: .48em, first-line-indent: 1em)
#set heading(numbering: "1.1")
#set math.equation(numbering: "(1)")
#set figure(supplement: [Fig.])
#set figure.caption(separator: [. ])
#show figure.caption: set text(size: 9pt)

#text(font: "Arial", size: 15pt, weight: "bold")[Tungsten Germanide Single-Photon Detectors with Saturated Internal Detection Efficiency at Wavelengths up to 29 µm]

*Benedikt Hampel#super[1,2,†,\*], Daniel Kuznesof#super[3,†], Andrew S. Mueller#super[4], Sahil R. Patel#super[4], Robert H. Hadfield#super[3], Emma E. Wollman#super[4], Matthew D. Shaw#super[4], Dirk Schwarzer#super[5], Alec M. Wodtke#super[5], Khalid Hossain#super[6], Allison V. Mis#super[1], Alexana Roshko#super[1], Richard P. Mirin#super[1], Sae Woo Nam#super[1], and Varun B. Verma#super[1,†]*

#text(size: 9pt, style: "italic")[#super[1] National Institute of Standards and Technology, Boulder, Colorado 80305, USA\
#super[2] Department of Physics, University of Colorado Boulder, Boulder, Colorado 80309,USA\
#super[3] James Watt School of Engineering, University of Glasgow, Glasgow G12 8QQ, United Kingdom\
#super[4] Jet Propulsion Laboratory, California Institute of Technology, Pasadena, California 91109, USA\
#super[5] Max Planck Institute for Multidisciplinary Sciences, Department of Dynamics at Surfaces, 37077 Göttingen, Germany\
#super[6] JP Analytical, Richardson, TX 75081, USA\
#super[†]  These authors contributed equally]

#link("mailto:benedikt.hampel@nist.gov")[*Correspondence:* benedikt.hampel\@nist.gov]

#block[
Superconducting nanowire single-photon detectors (SNSPDs) are among the most sensitive single-photon detectors available and have the potential to transform fields ranging from infrared astrophysics to molecular spectroscopy. However, extending their performance into the mid-infrared spectral region - crucial for applications such as exoplanet transit spectroscopy and vibrational fingerprinting of molecules - has remained a major challenge, primarily due to material limitations and scalability constraints. Here, we report on the development of SNSPDs based on tungsten germanide, a novel material system that combines high infrared sensitivity with compatibility for large-scale fabrication. Our detectors exhibit saturated internal detection efficiency at wavelengths up to 29~μm. This advance enables scalable, high-performance single-photon detection in a spectral region that was previously inaccessible, opening new frontiers in remote sensing, thermal imaging, environmental monitoring, molecular physics, and astronomy.

]
= Introduction
<introduction>
Mid-infrared (mid-IR) single photon detection is an enabling technology for applications in areas like physical chemistry @Lau.2023, astronomy @Wollman.2024@Glauser.2024, and commercial sensing @taylor_photon_2019. Such applications include observations of infrared chemiluminescence @Polanyi.1963, mid-IR laser induced fluorescence @Stewart.1983 and atmospheric emissions @Mlynczak.1997, spectroscopic techniques in the single photon limit @wollman_recent_2021@Lau.2023, optical coherence tomography for non-destructive penetrative imaging @israelsen_real-time_2019@fang_mid-infrared_2023, as well as photonic quantum computing with spin qubits and quantum communications @yan_silicon_2021@li_quantum_2024@temporao_feasibility_2008. Mid-IR detectors are also prized in the fields of medicine and biology, where single photon sensitivity would enable faster acquisition times, greater dynamic range @yeh_infrared_2023, and can exploit the specificity of a biological molecule's unique spectrum @adams_midinfrared_2001 accessible only in the mid-IR.

The dominant commercially available mid-IR detector technology is based on mercury cadmium telluride (MCT or HgCdTe) @lei_progress_2015@hadfield_single-photon_2023. However, MCT detectors typically have poor single-photon sensitivity and significant noise from readout and dark current. Moreover, they are in the process of being replaced by alternative mid-IR semiconductor-based technologies due to health and environmental concerns. Alternative mid-infrared detectors include Type II superlattice InAs/GaSb which are operated at 77~K but have a shorter spectral range than HgCdTe-based detectors@rogalski_inasgasb_2017. Silicon-based blocked impurity band (BIB) @xiao_progress_2022 detectors also known as impurity band conduction (IBC) detectors possess sensitivity across a large spectral range (typically 2~μm--28~μm wavelength range) and high quantum efficiency, yet do not possess single-photon sensitivity and must be operated at temperatures of less than 10~K. Furthermore, low-noise IBC-based detectors have not been in production for a decade, and it is uncertain whether a path exists to restarting this capability@Roellig.

Alternatively, superconducting nanowire single-photon detectors (SNSPDs) have demonstrated single-photon detection up to a wavelength of 29~μm @taylor_low-noise_2023, near unity system detection efficiency at 1550~nm wavelength @Reddy.2020, and less than 3~ps of timing jitter@Korzh.2020. Recent developments in system architecture have led to growing maturity of multiplexing schemes such as the thermally-coupled imager @McCaughan.2022. This multiplexing scheme was used to create a 400000-pixel SNSPD array @Oripov.2023, and was utilized for the development of a 64-pixel mid-infrared imager array @hampel_64-pixel_2024.

The materials development of SNSPDs for the mid-IR has been focused on tungsten silicide (WSi). The WSi films are engineered for high resistivity and low critical temperature through co-sputtering silicon (Si) and tungsten (W) @Verma.2021 at a high silicon fraction in order to lower the characteristic energy #emph[E]#sub[0] (Eq.~(@characteristic_energy_eqn)) of the material which scales with the single photon detection energy threshold of SNSPDs. This is dependent on the electron density of states #emph[N(0)] (Eq.~(@density_of_states_eqn)), Boltzman's constant #emph[k]#sub[b], the critical temperature #emph[T]#sub[c], and the characteristic volume #emph[V]#sub[0] @Vodolazov.2017.

$ E_(upright("0")) = 4 N \( 0 \) \( k_(upright("B")) T_(upright("c")) \)^2 V_(upright("0")) $<characteristic_energy_eqn>

The density of states depends on the normal state resistivity $rho$, the electron charge $e$, and the diffusivity $D$ of the material @Vodolazov.2017.

$ N \( 0 \) = \( 2 rho e^2 D \)^(- 1) $<density_of_states_eqn>

Making high resistivity WSi films through increasing the Si content has been very successful at extending the cut-off wavelength of SNSPDs @Verma.2021@taylor_low-noise_2023@colangelo2022large. Furthermore, reducing the nanowire width and thickness decreases the volume and reduces the critical temperature of the film further decreasing the characteristic energy and increasing the cut-off wavelength. However, calibrated efficiency measurements at 10~μm on Si-rich WSi devices fabricated upon dielectric optical stacks with simulated system detection efficiencies in excess of 60~% have shown measured system detection efficiencies of less than 1~%. De-convolution of the possible causes of this is challenging. This unexpectedly poor performance could be due to the high silicon content of the WSi; silicon may strongly absorb mid-infrared photons leading to phonon excitation @Wollack.2020. The energy associated with these phonons may then leave the film through the substrate before interacting with the electron system, thus preventing the breaking of Cooper-pairs which would lead to a detection event. Additionally, the 2~nm protective amorphous silicon capping layer on top of these SNSPDs could be contributing to photon absorption outside of the detector region. These photons could therefore not contribute to detection events resulting in a significantly diminished system detection efficiency.

This has provoked an investigation of germanium as a possible replacement for silicon. With good transmissive properties for wavelengths up to 14~μm, it is a promising candidate to investigate for high performance mid-IR SNSPDs. In the literature @ercolano_magnetoconductivity_2024, WGe has also been highlighted as being particularly suited for mid-IR single photon detection due to the electronic system efficiently retaining the energy of absorbed photons, enhancing WGe detectivity at low photon energies. This idea can be quantified by the ratio of the electron-phonon ($tau$#sub[e-ph]) interaction timescale and the electron-electron timescale ($tau$#sub[e-e]). Additionally, this metric has been reported to be marginally larger in WGe (2.6~±~0.5) than in WSi (2.5~±~0.5) @ercolano_magnetoconductivity_2024. SNSPDs based on germanides in the past have been demonstrated such as MoGe and WGe. However, single photon sensitivity has only been showcased for wavelengths of up to 2~μm @verma_superconducting_2014@Yang.2025.

Here, we enhance the mid-infrared sensitivity and extend the maximum cut-off wavelength through the further optimization of tungsten germanide SNSPDs for mid-infrared applications beyond 10~μm wavelength. This material platform enables greater compatibility with Ge-based dielectric optical cavities, wider nanowires (100~nm--360~nm), and thicker films (8~nm) allowing for the possibility of high efficiency single photon detectors in the mid-infrared and improved scalability for the fabrication of imaging arrays.

= Fabrication
<fabrication>
WGe SNSPDs were fabricated from germanium-rich WGe films for high resistivity and suppressed critical temperature. Multiple bulk films were co-sputtered from separate tungsten and germanium targets using dc sputtering at a pressure of 0.4~Pa and with the substrate at room temperature. The films were created by sputtering for 5~minutes, resulting in a thickness of approximately 50~nm. The germanium target sputtering power was fixed at 60~W, while the tungsten target sputtering power was varied from 10~W--200~W. The films were capped in-situ by a protective amorphous germanium layer with a thickness of approximately 5~nm.

Four-probe resistivity measurements were made at room temperature to determine the sheet resistance of samples as depicted in @Rsq_vs_Wpower. It can be seen that the sheet resistance is exponentially growing for lower tungsten sputtering powers. This is desired for the development of single-photon detectors with high detection efficiencies as this can be correlated with a lower density of charge carriers. The energy of an absorbed photon would therefore be distributed amongst fewer Cooper pairs in the superconductor, which lowers the energy threshold required to generate a detection event since the average temperature of the electron system post absorption is then higher.

#figure(image("source/Figures/250519_Rsq_vs_Wpower.png", width: 60.0%),
  caption: [
    Four-probe room temperature sheet resistance of co-sputtered bulk WGe films as a function of tungsten target sputtering power.
  ]
)
<Rsq_vs_Wpower>

The critical temperature of the films was determined by four-probe resistivity measurements in a cryostat with a base temperature of about 2~K. The resistance was measured during cooling and warmup at a rate of 1~K~min#super[−1] to avoid thermal hysteresis effects. The results for samples fabricated with different tungsten sputtering powers are depicted in @Tc_W_target_sputtering_power. The composition of four samples was analyzed by Rutherford backscattering spectrometry (RBS). The results can be seen in the insets of @Tc_W_target_sputtering_power.

#figure(image("source/Figures/250519_Tc_vs_Wpower.png", width: 60.0%),
  caption: [
    Superconducting transition temperature #emph[T]#sub[c] as a function of sputtering power of the tungsten target during co-sputtering of the WGe. The germanium sputtering power was fixed at 60~W. Measurements were performed on bulk films with thickness of approximately 50~nm. The insets show the tungsten (W) and germanium (Ge) film composition of some samples, which was determined by Rutherford backscattering spectrometry (RBS).
  ]
)
<Tc_W_target_sputtering_power>

A tungsten target sputtering power of 20~W was chosen for the growth of thin films suitable for the fabrication of mid-IR-optimized SNSPDs based on past experience with WSi, and the effects of suppressed #emph[T]#sub[c] and higher sheet resistivity. These material properties enable a much smaller characteristic energy #emph[E]#sub[0], which makes the thin film more suitable for mid-IR single photon detection as shown in Eq.~(@characteristic_energy_eqn) and Eq.~(@density_of_states_eqn). The #emph[T]#sub[c] of this film was below the base temperature of the previously used cryostat so that it was measured in an adiabatic demagnetization refrigerator with a base temperature of 180~mK using a two-probe resistivity measurement. The #emph[T]#sub[c] was determined to be 900~mK.

Fabrication of SNSPDs was performed on a 3-inch oxidized silicon wafer with 150~nm of thermally-grown SiO#sub[2]. The 8~nm-thick WGe thin film was then sputtered with a tungsten sputtering power of 20~W, and the film was capped in-situ with a 4 nm-thick layer of amorphous germanium. Gold bonding pads and alignment marks for electron beam and optical lithography were then deposited by electron beam evaporation and liftoff. Electron beam lithography was performed to define the SNSPD patterns using 200~nm-thick polymethyl methacrylate (PMMA) resist. Multiple SNSPDs were defined on each chip having wire widths between 100~nm--360~nm with a fill factor of 30~% to minimize current crowding @clem_geometry-dependent_2011. The active area of each SNSPD was designed to be . Reactive ion etching (RIE) in an SF#sub[6] plasma was used to transfer the pattern from PMMA into the underlying WGe film. The PMMA was then stripped in acetone, and a 20~μm-wide stripe was patterned by optical lithography connecting the bond pads to ground and overlapping with the SNSPD to remove the WGe film on the remainder of the wafer. The remaining WGe was again etched by RIE in an SF#sub[6] plasma, and the photoresist stripped in acetone. Finally, a 15~nm-thick layer of germanium was sputtered over the entire wafer to encapsulate the SNSPD and protect it from oxidation.

The scanning electron micrograph (SEM) in @SNSPD_SEM_TEM\(a) shows a patterned device after the entire process has been completed. The layer stack was analyzed with a scanning transmission electron microscope (STEM) which is equipped with a high-angle annular dark-field (HAADF) detector and an energy dispersive X-ray spectroscopy (EDS) detector. A very good uniformity of the layer stack of WGe and the Ge cap can be seen in @SNSPD_SEM_TEM\(b). A 150~nm-thick SiO#sub[2] protection layer was used instead of the 15~nm Ge protection layer to measure the thickness of the Ge capping layer accurately. The dark patterns in the top SiO#sub[2] layer stem from the TEM sample preparation with a focused ion beam (FIB). The thickness of the WGe layer was determined to be 7.7~nm with a 5.1~nm germanium cap of which 2.7~nm are oxidized. @SNSPD_SEM_TEM\(c) shows a detailed HAADF micrograph of the WGe, Ge and GeO#sub[x] layers. Its contrast aligns well with the separation in the EDS maps for tungsten in @SNSPD_SEM_TEM\(d), for germanium in @SNSPD_SEM_TEM\(e), and for oxygen in @SNSPD_SEM_TEM\(f). The increased oxygen content in the top 2.7~nm of the germanium cap demonstrates the extent of oxidation due to exposure to ambient air during processing.

#figure(image("source/Figures/250925_TEM_SEM.png", width: 100.0%),
  caption: [
    \(a) Scanning electron micrograph of an SNSPD meander with 200~nm wide nanowires on a 600~nm pitch. The size of the active area is . (b) High-angle annular dark-field scanning transmission electron micrograph (HAADF-STEM) of the layer stack. (c) HAADF-STEM micrograph of the WGe layer with the Ge capping layer in comparison to energy dispersive X-ray spectroscopy (EDS) analyses showing (d) the tungsten signals, (e) the germanium signals, and (f) the oxygen signals. The dashed orange lines serve as guides to the eye to illustrate the layer structure.
  ]
)
<SNSPD_SEM_TEM>

= Measurement Setup
<measurement-setup>
The SNSPDs were housed inside a cryostat that combined a Gifford-McMahon cryocooler with a #super[3]He sorption stage cooler with a base temperature of 240~mK. The setup is depicted in @setup. A broadband blackbody source with a temperature of 630~K is used as thermal light source. The light passes through a longpass filter and is free-space-coupled through a 5~mm-thick potassium bromide (KBr) optical window into the cryostat. A scanning grating monochromator at the 40~K stage uses a blazed diffraction grating @chen_mid-infrared_2017@Lau.2020@Lau.2023 that allows the precise selection of mid-IR wavelengths with a bandwidth of about 30~nm. The photons are coupled into a hollow-core fiber with a 200~μm core diameter with over 80~% transmission for wavelengths between 3~μm--10~μm. The fiber ends in the housing of the SNSPD at the 240~mK stage to flood illuminate the whole chip from a distance of 2~cm.

The wavelength-dependent photo response of each SNSPD at 4~μm, 6~μm, 8~μm, and 10~μm wavelength was investigated. A 3.6~μm long pass filter was used for the measurements at 4~μm, and a 4.5~μm long pass filter was used for measurements at 6~μm. Measurements at 8~μm and 10~μm were performed together with a 7.3~μm long pass filter. These long pass filters removed higher order diffraction components that the grating spectrometer would otherwise let pass from the external broadband blackbody source.

#figure(layout(size => measurement-setup(size.width * .83)),
  caption: [
    Scanning grating monochromator cryostat system based upon a blazed diffractive grating. The thermal shields at the 40~K stage and the 4~K stage together with the vacuum chamber are removed in the model to show the inside of the system.
  ]
)
<setup>

The SNSPDs were biased through a bias-tee that was integrated into a cryogenic amplifier. The signal from the SNSPDs was amplified by this amplifier that is attached to the 4~K-stage. It has a gain of 45~db, a bandwidth of 1.5~GHz, and a noise temperature of less than 6~K. An additional room-temperature amplifier with a gain of 25~db and a bandwidth of 500~MHz was used. This provides a high signal-to-noise ratio and enabled pulses to be read out at bias currents of less than 250~nA. A cryogenic shunt comprised of a 20~Ω resistor and a 450~nH inductor in series was connected in parallel to the SNSPD at the 240~mK stage. This was designed and implemented to improve the operational stability of the devices and to prevent latching to the resistive normal state. The SNSPD pulses were recorded by a time tagger at a threshold level of 130~mV.

#figure(image("source/Figures/W2504281_E3_W20_Ge60_360nm_pulses.png", width: 100.0%),
  caption: [
    Oscilloscope traces of SNSPD pulses for a bias current of (a) 0.6~μA and (b) 2.2~μA of a 360~nm wide and about 8~nm thick nanowire. The orange trace was averaged 1000~times. The trigger level for the photon count rate measurements is shown as a red dashed line.
  ]
)
<Osci_360nm_130mV>

Voltage pulses originating from detection events of a 360~nm-wide SNSPD recorded by a fast oscilloscope at two different bias currents are depicted in @Osci_360nm_130mV. The trigger level for the time tagger is shown as a red dashed line. The decay time of the pulses is very long due to the high kinetic inductance of the WGe film and the shunt. At larger bias currents, the very sensitive time tagger will count multiple detection events due to noise on the decaying signal. The reason for this can be seen in @Osci_360nm_130mV\(b) where the threshold is crossed multiple times. To avoid these multiple false counts, an artificial hold-off time of 500~ns was introduced in the time tagger software. Any detection events in this time slot after a detection will not be counted as a photon detection event. This will reduce the maximum count rate of the device, but will not impair the characterization of these detectors at relatively low count rates.

A second cryogenic setup was used to characterize WGe SNSPDs at longer wavelengths of 10~μm, 15~μm, 18~μm, and 29~μm. The setup is described in detail in Ref.~@taylor_low-noise_2023. It employs a thermal light source with a bandpass filter stack inside of the vacuum chamber to flood illuminate the SNSPDs with mid-infrared photons directly. The electrical part of the setup is similar to the previously described setup. The base temperature of this cryostat is 250~mK.

= Results
<results>
#figure(image("source/Figures/250916_W2504281_E3_W20_Ge60_200nm_360nm.png", width: 70.0%),
  caption: [
    Normalized photon count rate and background count rate (BCR) in counts per second (cps) as a function of bias current of (a) a nanowire with a width of 360~nm for wavelengths between 4~μm--10~μm and of (b) a nanowire with a width of 200~nm for wavelengths between 10~μm--29~μm. The WGe was sputtered at 20~W and 60~W for the tungsten and germanium, respectively. The measured BCR is subtracted from the photon count rate measurement and the photon count rate is normalized to the photon count rate value for the highest plotted bias current.
  ]
)
<PCR_360nm_130mV>

@PCR_360nm_130mV\(a) shows the normalized photon count rate as a function of the bias current for wavelengths between 4~μm--10~μm for a 360~nm-wide nanowire meander measured in the cryostat that is equipped with a grating monochromator. The saturated count rate indicates unity internal detection efficiency and suitability of the nanowire for efficient operation at that wavelength @kozorezov_fano_2017. The slight slope in the plateau regime is likely due to photon absorption and detection in the bends of the meander which are 2~μm wide. This effect could be mitigated by shielding these regions from photon flux.

The background count rate (BCR) is depicted for the different wavelengths in the bottom part of @PCR_360nm_130mV\(a). While the measurement setup allows fine tuning of the input wavelength thanks to the monochromator, both the fiber and grating itself are sources of blackbody radiation at mid-IR wavelengths, although this is minimized by cooling the grating to 40~K. The free-space coupling of the broadband blackbody source allows additional background radiation to enter the cryostat. Higher energy photons, which are not filtered by the longpass filter between source and window, can enter the monochromator and eventually the hollow-core fiber through higher order reflections and scattering inside of the monochromator. Additional filtering either at 4~K or at 240~mK in the SNSPD housing could greatly reduce these background counts. The intrinsic dark count rates of the SNSPDs cannot be characterized as they are dominated by the blackbody radiation effects and relaxation oscillations at higher bias currents, which are shown in @PCR_360nm_130mV.

@PCR_360nm_130mV\(b) shows measurement results of a 200~nm-wide SNSPD measured in the cryostat with direct flood illumination with a thermal light source through bandpass filter stacks for longer wavelengths between 10~μm and 29~μm. The SNSPD shows saturated internal detection efficiency for all measured wavelengths. The slope in the plateau regime and the BCR are more prominent in these measurements. The reason might be the heating of the filter stack and other components in the cryostat due to the thermal light source. These components at elevated temperatures act as blackbody sources. Also, the bias current for this narrower SNSPD is much smaller, which requires a much lower trigger level. This increases the false counts due to electric noise, which can be seen as a constantly high BCR in @PCR_360nm_130mV\(b).

Both measurements are limited by the cut-off bias current below which the amplitudes of the output pulses are below the trigger level and are therefore not counted. This impairs the shape of the photon count rate curve for the 4~μm measurement in @PCR_360nm_130mV\(a) and the 10~μm measurement in @PCR_360nm_130mV\(b). This could be improved by lower noise amplification and electronics that allow for lower trigger levels.

= Conclusion
<conclusion>
In this work, we have developed WGe SNSPDs capable of single-photon detection at mid-IR wavelengths of up to 29~μm. We have performed a comprehensive study of the WGe film composition and thickness, and its effects on the material properties and the performance of WGe SNSPDs. The fact that relatively wide nanowires on the order of 400~nm can be used to obtain saturated internal efficiency at a wavelength of 29~μm implies that WGe could be used to fabricate mid-infrared detectors over large areas with excellent yield. By comparison, nanowires fabricated from WSi must be on the order of 100~nm or less to obtain saturated internal efficiency at 10~μm@Verma.2021@taylor_low-noise_2023. Such narrow wires are difficult to yield over large areas. Furthermore, the WGe films used here were 8~nm thick compared to previous work with WSi films which were less than 3~nm thick@Verma.2021. The use of thicker films that is possible with WGe should dramatically enhance yield over large areas. This shows that WGe may be a promising new SNSPD material for the fabrication of large-scale mid-infrared cameras that could be competitive with existing technologies such as MCT and BIB cameras. Such cameras would have the advantages of single-photon sensitivity and significantly lower noise in comparison to these technologies and could enable new applications in remote sensing, biological spectroscopy, chemistry, and astrophysics.

#block[
*Funding.* National Institute of Standards and Technology; National Aeronautics and Space Administration; UK Engineering and Physical Sciences Research Council.

*Acknowledgment.* This research was funded by NIST (https:\/\/ror.org/05xpvk416). Parts of this research were performed at the Jet Propulsion Laboratory, California Institute of Technology, under contract with the National Aeronautics and Space Administration (NASA---80NM0018D0004). Support for this work was provided in part by the DARPA DSO Invisible Headlights program and by the ERC IRASTRO program. DK thanks the EPSRC and SFI Centre for Doctoral Training in Photonic Integration for Advanced Data Storage (CDT-PIADS EP/S023321/1) and RHH thanks the UK Engineering and Physical Sciences Research Council (EP/S026428/1. EP/T00097X/1) for support. We thank Leaf Swordy and Katie David for thoughtful comments on the manuscript. We thank Chris Yung and Nathan Tomlin for assistance with the sputtering system used in this work. We thank the mechanical workshop and scientific staff at the Max Planck Institute for Multidisciplinary Sciences for help in the development of a cryogenically cooled infrared monochromator.

*Data availability.* The data that support the findings of this study are openly available in the NIST Science Data Portal at https:\/\/doi.org/10.18434/mds2-4009, Ref.~@Hampel.2025.

*Author contributions.* B.H., V.B.V. and D.K. conceptualized these experiments. V.B.V. fabricated the devices. B.H., D.K., V.B.V, A.S.M, and S.R.P. performed the measurements of the devices. A.R. and A.V.M. took and analyzed the STEM images. K.H. took and analyzed the Rutherford backscattering spectrometry data. B.H., D.K., V.B.V., A.S.M., and S.R.P. analyzed and interpreted all data. D.S. and A.M.W. designed and built the cryogenic monochromator setup. V.B.V., R.P.M., S.W.N., R.H.H., E.E.W. and M.D.S. directed and supervised this work. B.H., D.K. and V.B.V. prepared the manuscript, with input from all co-authors. B.H. made the figures.

*Competing interests.* The authors declare no competing interests.

*Correspondence and requests for materials.* Address correspondence to Benedikt Hampel.

]

#show bibliography: set text(size: 9pt)
#show bibliography: set par(spacing: .5em)
#bibliography("source/WGe_SNSPDs.bib", style: "ieee")
