#import "heater-plot.typ": calibration-figure

#set document(title: "Calibration of Microscope-coupled Fourier Transform Infrared Spectrometers for CW and Modulated Light Emission Measurements", author: ("Maxime Brazeau", "Mathieu Giroux", "Nada Boubrik", "Raphael St-Gelais"))
#set page(paper: "us-letter", margin: (x: 15mm, y: 17mm), columns: 2, numbering: "1")
#set text(font: "Libertinus Serif", size: 10pt, lang: "en")
#set par(justify: true, leading: .56em)
#set heading(numbering: "I.")
#set math.equation(supplement: [Eq.])
#set figure(supplement: [Fig.], placement: top)
#show figure.caption: set text(size: 8.75pt)

#place(top, scope: "parent", float: true, clearance: 1em, block(width: 100%)[
  #align(center)[
    #text(size: 16pt, weight: "bold")[Calibration of Microscope-coupled Fourier Transform Infrared Spectrometers for CW and Modulated Light Emission Measurements]
    #v(.5em)
    Maxime Brazeau#super[1], Mathieu Giroux#super[1], Nada Boubrik#super[1], and Raphael St-Gelais#super[1,2]
    #linebreak()
    #text(size: 9pt, style: "italic")[#super[1]Department of Mechanical Engineering, University of Ottawa]
    #linebreak()
    #text(size: 9pt, style: "italic")[#super[2]Department of Physics, University of Ottawa]
    #linebreak()
    #text(size: 9pt)[#link("mailto:raphael.stgelais@uottawa.ca")]
  ]
  #v(.6em)
  #text(size: 9.5pt)[Measurement of low power infrared light emission spectra from microstructures can be challenging, but is of key importance in several research fields. Fourier transform infrared spectrometers (FTIR) can be used for characterizing such weak light emitters, but this requires additional custom user calibration compared to traditional FTIR measurements of, e.g., transmission or reflection. These calibration techniques are well documented for standalone FTIR instruments but not for microscope coupled-FTIRs, even though such an architecture greatly simplifies collection of light from micro and nano scale structures. We propose and demonstrate a calibration method for microsope-FTIRs based on the well-known emissivity of doped silicon at high temperature. With this method, we measure responsivity and noise floor of a recently installed microscope-FTIR instrument (Bruker#super[©] Invenio#super[®] R coupled with a Hyperion II microscope), which is found to be within theoretically predicted values. The method is demonstrated for two different detectors (Mercury Cadmium Telluride and Indium Antimonide), in both continuous wave (CW) and modulated (step-scan) emission measurements mode.]
])

= Introduction <sec:intro>
Measuring thermal emission spectra from micro and nano scale systems is particularly challenging due to their small size and inherently low levels of emitted radiation. Nevertheless accurate thermal emission measurements are critical for the development of micro-electro-mechanical systems (MEMS) in different fields such as gas detections @Popa_2021 @Lochbaum_2017, chemical and biological sensors @Pruessner_2025, or for near field thermophotovoltaic (NFTPV) experiments @kim_2015.

With some instrument customization, it is possible to measure light emission from samples using a Fourier transform infrared (FTIR) spectrometer, but this feature is typically not calibrated by equipment manufacturers. FTIR spectrometers are instead more commonly used to measure the absorption, reflection and/or transmission of samples @Griffiths_2007. Calibration techniques for emission measurements have been developed and used in several previous work @Xiao_2020 @Xiao_2019 @Dyachenko_2016 @Wang_1997, but they were not adapted to a microscope-FTIR system. Likewise, these calibration methods were not applied to modulated emission collected with a microscope-coupled-FTIR, commonly known as step-scan measurements. Such step-scan measurements allow measurement of a modulated emission signal only, thus removing the continuous wave (CW) thermal background @Manning_2006 @Andrews_2001.

Microscope-coupled FTIR assemblies are advantageous for collecting thermal light emission from on chip microstructures, but the microscope geometry complicates calibration. It requires a reference radiation source fitting under the objective, on the microscope platen, preventing the use of several calibrated light sources such laboratory blackbody radiators.

Here we propose and demonstrate the calibration of a microscope-coupled FTIR using a heated piece of doped silicon, for which thermal emissivity models at high temperature are readily available. We rely on the model developed in @Giroux_2024, which accounts for optical absorption from dopants and thermally excited charge carriers in Silicon.

= Theory <sec:theory>
The spectral measured density measured by a typical FTIR is accessible to the user in units of arbitrary signal counts per wavenumber \[counts/cm#super[\-1]\]. We denote these measured spectra as $S_(alpha \, upright(m e a s))$ ($tilde(nu)$) \[counts/cm#super[\-1]\], with $alpha$ denoting a given sample under test, and $tilde(nu)$ representing wavenumbers. Our first goal is to measure a responsivity function, denoted $m \( tilde(nu) \)$ in units of counts/W. This function is such that dividing a measured spectrum by the response function results in a quantitative spectrum ($S_alpha \( tilde(nu) \)$, in W/cm#super[\-1]), in the same fashion as a typical optical spectrum analyser: 

#math.equation(block: true, numbering: _ => [(1)], $S_alpha \( tilde(nu) \) = frac(S_(alpha \, upright(m e a s)) \( tilde(nu) \), m \( tilde(nu) \)) upright([frac(W, c m^(- 1))]) .$) <S_alpha>



Here $S_alpha \( tilde(nu) \)$ is the spectral power density emitted by the sample under test $alpha$ within the acceptance angle and area of the spectrometer, i.e., within its throughput @Xiao_2019 $theta$, in $upright(m^2 dot.op s r)$.

To obtain the responsivity function $m \( tilde(nu) \)$, we compare our measured signal $S_(S i \, upright(m e a s)) \( tilde(nu) \)$ to a predictable intensity of radiation coupled inside the spectrometer, from a controlled thermal radiation emitter ($S_(upright(S i \, t h))$). This known emitter consists of a large area thermal emitter of known temperature $T$, and of known spectral emissivity $epsilon.alt \( tilde(nu) \, T \)$. When such a source is placed under the microscope objective, the radiation coupled within the FTIR throughput $theta$ is theoretically (th) predicted by @Bergman_2020 

#math.equation(block: true, numbering: _ => [(2)], $S_(upright(S i \, t h)) \( tilde(nu) \, T \) = theta epsilon.alt \( tilde(nu) \, T \) B \( tilde(nu) \, T \) upright([frac(W, c m^(- 1))]) .$) <S_th>

 In this case, $B \( tilde(nu) \, T \)$ denotes Plank's spectral radiance @Griffiths_2007 

#math.equation(block: true, numbering: _ => [(3)], $B \( tilde(nu) \, T \) = frac(2 h c^2 tilde(nu)^3, e^(h c tilde(nu) \/ k_B T) - 1) upright([frac(W, m^2 c m^(- 1) s r)]) .$) <B_nu>

 where $h = 6.626 times 10^(- 34)$ Js is the Planck constant, $k_B = 1.381 times 10^(- 23)$ J/K is the Boltzmann constant and $c = 2.998 times 10^8$ m/s is the speed of light in vacuum.

From this reference source, we obtain the responsivity $m \( tilde(nu) \)$ by comparing the raw measured spectrum of the know surface $S_(upright(S i \, m e a s)) \( tilde(nu) \)$ to its predicted value: 

#math.equation(block: true, numbering: _ => [(4)], $m \( tilde(nu) \) = frac(S_(upright(S i \, m e a s)) \( tilde(nu) \), S_(upright(S i \, t h)) \( tilde(nu) \)) upright([frac(c o u n t s, W)]) .$) <m_nu>

 In the common case where background radiation is non negligible, the differential procedure given in @Xiao_2019 is used, allowing background cancellation by performing measurements at two radiator temperatures $T_1$ and $T_2$: 

#math.equation(block: true, numbering: _ => [(5)], $m \( tilde(nu) \) = frac(S_(upright(S i \, m e a s)) \( tilde(nu) \, T_2 \) - S_(upright(S i \, m e a s)) \( tilde(nu) \, T_1 \), S_(upright(S i \, t h)) \( tilde(nu) \, T_2 \) - S_(upright(S i \, t h)) \( tilde(nu) \, T_1 \)) upright([frac(c o u n t s, W)]) .$) <m_nu_T>



Noteworthy, the final measured responsivity $m \( tilde(nu) \)$ is an instrument parameter that should be independent of the chosen temperatures ($T_1$ and $T_2$), and of the throughput $theta$. This will be confirmed experimentally in the next section.

The throughput of the FTIR (used in @S_th is either limited by the diameter of the mirror and detectors, by the Jacquinot stop of the instrument, by the solid angle of the beam in the interferometer or, in a microscope-coupled FTIR, by the acceptance of the objective. In the present study, we reduce the aperture $D_(upright(a p))$ of the Jacquinot stop until we are aperture-limited, which yield a known throughput value: 

#math.equation(block: true, numbering: _ => [(6)], $theta = frac(pi D_(upright(a p))^2, 4) times Omega #h(0em) upright(\[ m^2 s r \]) \,$) <throughput>

 where $Omega$ is the solid angle (in sr) between the aperture and its collection mirror.

After having measured the responsivity $m \( tilde(nu) \)$, we can measure the instrument noise spectral density ($S_(upright(N))$, in W/cm#super[\-1]) from a raw noise spectrum $S_(upright(N \, m e a s)) \( tilde(nu) \)$: 

#math.equation(block: true, numbering: _ => [(7)], $S_(upright(N)) = frac(S_(upright(N \, m e a s)) \( tilde(nu) \), m \( tilde(nu) \)) upright([frac(W, c m^(- 1))]) .$) <S_N>



We can then compare measured noise ($S_(upright(N))$) to the predicted noise floor ($N$) obtained from the detector specific detectivity ($D^(*)$) and from the ambient thermal background. The noise floor obtained from the detector specific detectivity is given by @Griffiths_2007 

#math.equation(block: true, numbering: _ => [(8)], $N_(upright(d e t)) = frac(sqrt(A_(upright(D)) f_(upright(D))), D^(*) Delta tilde(nu)) upright([frac(W, c m^(- 1))]) .$) <N_det>

 In this case $f_(upright(D))$ is the detector electronic sampling bandwidth. We assume this value to be approximately equal to the scanner velocity (e.g., 20 kHz) when the FTIR is used in continuous scanning mode, and to the lock-in amplifier demodulation bandwidth when performing step-scan measurements. $D^(*)$ is the specific detectivity given by the manufacturer @Bruker_2019, and $A_(upright(D))$ is the detector area.

In continuous scanning mode, the inside of the FTIR acts like a blackbody source at room temperature, which contributes to the instrument background according to: 

#math.equation(block: true, numbering: _ => [(9)], $N_(upright(b g n d)) = theta_(upright(n)) B \( tilde(nu) \, T_(upright(r o o m)) \) upright([frac(W, c m^(- 1))]) \,$) <N_bgnd>

 where $theta_(upright(n))$ is the throughput of the background. As discussed in Appendix #link(<appendix_A>)[A] it can differ from the throughput of the FTIR and should be calculated separately. We can finally combine @N_det and @N_bgnd in a total noise floor using 

#math.equation(block: true, numbering: _ => [(10)], $N_(upright(t o t))^2 = N_(upright(d e t))^2 + N_(upright(b g n d))^2 .$) <N_tot>



In short, we can predict the instrument noise floor using @N_det – @N_tot and compare it with the measured noise floor of @S_N. To do so, we must however first measure the instrument responsivity $m \( tilde(nu) \)$, using the procedure described in the next section.

= Methods <sec:methods>
We characterize a Bruker#super[©] Invenio#super[®] R FTIR paired with a Hyperion II microscope, installed new in August 2023. The microscope is primarily designed for measuring the reflectivity and/or transmissivity of samples. A factory modification allows using the sample under the microscope as a light source, paired with the FTIR internal (interchangeable) detectors. @fig:schem#h(0pt);(a) illustrates this beam path in a simplified manner. Thermal emission from the sample is collected by a 15$times$ magnification Schwarzschild objective @bruker2020hyperion and then passed through the aperture stop, where its amplitude can be adjusted by varying the aperture size. To determine the limiting aperture $D_(upright(a p))$ used for calculating the throughput in @throughput, we reduce the aperture size until the signal amplitude reduces (i.e., until the throughput $theta$ is limited by the aperture), see Appendix #link(<appendix_A>)[A].

After passing the aperture, the beam enters the scanning Michelson interferometer equipped with either a KBr or a CaF#sub[2] beam splitter. A KBr beam splitter is used for mid-IR measurements (350 --- 8000 cm#super[\-1]) and CaF#sub[2] is used for near-IR measurements (1200 --- 15500 cm#super[\-1]) @bruker2015invenioR. Finally, the signal is directed to the detector. We use two different detectors, a mercury cadmium tellurium (MCT) in the range of $tilde(nu) = 600$ cm#super[\-1] to $tilde(nu) = 12 000$ cm#super[\-1] and a InSb detector for $tilde(nu) = 1850$ cm#super[\-1] to $tilde(nu) = 10 000$ cm#super[\-1] (part number D316/B and D413/B, respectively). Their peak nominal detectivities are respectively $D^(*) > 2 times 10^10$ cm Hz#super[1/2] W#super[\-1] at 800 cm#super[\-1] and $D^(*) > 1.5 times 10^11$ cm Hz#super[1/2] W#super[\-1] at 2200 cm#super[\-1]. @Bruker_2019

#figure(numbering: _ => "1", calibration-figure,
  caption: [
    a) Schematic of the microscope-coupled-FTIR, reproduced from @bruker2015invenioR, with a zoomed in view of the controlled thermal emitter. b) Temperature of the thermal emitter measured from the resistance change in the metal ceramic heater and from a resistance temperature detector. c) Calculated spectral emissivity of the emitter at various temperatures.
  ]
) <fig:schem>

@fig:schem#h(0pt);(a) illustrates our calibrating radiator, which consists of a piece of Si bonded to a metal-ceramic heater (MCH). The MCH is connected to a power supply (Rigol DB831) to control the applied voltage, and hence the temperature. The Si is N-doped with arsenide and has a resistance ranging from 0.001 to 0.005 $upright(Omega dot.op c m)$. We use silver paste (PELCO#super[®] 16047) to bond the Si to the MCH, which enables low heat transfer resistance and high temperature stability.

During heating, we measure the temperature of the Si radiator using two methods. First, a resistance temperature detector (RTD) (Innovative Sensor Technology 2952-P1K0.520.6W.A.010-ND) @RTD is bonded to the surface of the Si and connected to a multimeter (Keithley DMM 6500). The second method consists of measuring the change of electrical resistance of the MCH itself during heating. In this case we calculate the change in temperature using @Giroux_thesis 

#math.equation(block: true, numbering: _ => [(11)], $Delta T = frac(1, alpha_"th") frac(Delta R, R_0)$)

 where $Delta R$ is the change of resistance, $R_0$ is the resistance at room temperature, $Delta T$ is the change in temperature and $alpha_(upright(t h)) = 0.0045$/$""^compose$C @Giroux_thesis is the temperature coefficient of resistance of the MCH. $alpha_(upright(t h))$ is measured in a separate experiment using a hot plate to set $Delta T$, and then measuring the change in resistance, as described in @Giroux_thesis. The temperature measured by the two techniques initially follows similar trends, but deviates at high temperatures, as shown in @fig:schem#h(0pt);(b). This difference is expected at high heating power, whereas radiative heat transfer becomes significant, increasing the temperature difference between the heater and the radiator surface. Since the radiative surface is what matters in @S_th – @m_nu_T, we primarily rely on $T_(upright(R T D))$ for our calculations.

The permittivity of Si is predicted from its dielectric function, calculated using the model proposed in @Giroux_2024. The model incorporates the lattice and interband contributions from @Lee_2005, where interband absorption is approximated using the semi-empirical discrete energy-level model described in @Timans_1993. The free carrier contribution is represented by the Drude model from @Fu_2006, with mobility, decay rates, and donor and acceptor contributions taken from @Basu_2009. Moreover, the model considers optical absorption from dopants as well as from thermally excited charge carriers by incorporating the temperature dependence of decay rates and carrier concentration.

With this permittivity model, we calculate (@fig:schem#h(0pt);(c)) the silicon spectral directional emissivity $epsilon.alt \( tilde(nu) \, gamma \)$ function at an angle $gamma$. The spectral directional emissivity is a unitless number representing the ratio of emited energy by a surface compared to a perfect black body emitter. Using Kirchhoff's law of radiation it can be related to the absorptivity and reflectivity of a surface @Bergman_2020 

#math.equation(block: true, numbering: _ => [(12)], $epsilon.alt \( tilde(nu) \, gamma \) = alpha \( tilde(nu) \, gamma \) = 1 - R \( tilde(nu) \, gamma \) \,$)

 where $alpha \( tilde(nu) \, gamma \)$ is the absorption coefficient of the heated silicon piece, and $R \( tilde(nu) \, gamma \)$ is the reflection coefficient of the exposed silicon surface. This reflection coefficient $R \( tilde(nu) \, gamma \)$ is calculated using an optical multilayer calculation algorithm @Edalatpour_2013, considering air as the incident medium followed by a 280 μm thick silicon layer, and terminated by semi-infinite silver. The permittivity of silver is taken from @Yang_2015. This semi infinite last layer accounts for silver paste at the heater/silicon interface, which is not expected to allow any light transmission, hence the semi-infinite assumption. Once the directional emissivity $epsilon.alt \( tilde(nu) \, gamma \)$ is calculated, we can obtain the total spectral emissivity $epsilon.alt \( tilde(nu) \)$ (needed in @S_th by integrating $epsilon.alt \( tilde(nu) \, gamma \)$ over all the emission angles within the FTIR throughput. We note however (see Appendix #link(<appendix_B>)[B]) that this integral is very weakly dependent on the integration range of $gamma$, such that we could also simply use the diffuse surface approximation, i.e., $epsilon.alt \( tilde(nu) \) approx epsilon.alt \( tilde(nu) \, 0 \)$, where $epsilon.alt \( tilde(nu) \, 0 \)$ denotes the spectral directional emissivity at normal incidence.

For step-scan calibration measurements, we use an optical chopper, placed in the sample compartment, to modulate the CW light emitted by the silicon emitter (see @fig:schem#h(0pt);(a)). In this case, the AC output port of the detector is connected to a lock-in amplifier (Zurich Instrument MFLI 500 kHz/5 MHz, 60 MSa/s) which demodulates and amplify the signal at the chopper frequency, before returning it to the FTIR built-in digitizer. Returning only the demodulated signal to the FTIR allows suppression of unmodulated thermal background @Manning_2006, which is useful for measuring weak modulated light sources. We have tested modulation frequencies in the 0 Hz to 1 kHz range and found that a chopping frequency of 1 kHz allows for better suppression of background and low frequency noise. We also find that amplifying the signal by a factor of 100 at the output of the lock-in amplifier reduces noise by making the FTIR digitizer noise negligible. Other parameters of the step-scan measurements are the lock-in amplifier's time constant of 32 ms, a settling time of 150 ms after FTIR mirror displacement followed by, an acquisition time of 150 ms, and a resolution of $Delta tilde(nu) = 32$ cm#super[\-1].

It should be noted that locating the chopper in the sample compartment (as in @fig:schem#h(0pt);(a)) modulates part of the unwanted thermal background, in addition to light emitted by the heated silicon surface. It is therefore essential to use the background cancelling method (see @m_nu_T in this case.

To be throughput limited we need an aperture size $D_(upright(a p))$ of 4 mm in CW and 1.5 mm in step-scan for the MCT detector (see Appendix #link(<appendix_A>)[A]). There is a difference in throughput between the CW measurement and the step-scan due to the use of a perforated plate (4.5 mm diameter) in the sample compartment during the step-scan measurements. This plate is used to reduce the beam diameter such that it fits within the optical chopper blades placed in the sample compartment (see @fig:schem#h(0pt);(a)). These 4 mm and 1.5 mm aperture correspond to throughputs of $7.24 times 10^(- 7)$ $upright(m^2 dot.op s r)$ and $1.01 times 10^(- 7)$ $upright(m^2 dot.op s r)$, respectively, considering that the beam is collimated to a beam diameter $D_(b e a m) = 30$ mm by a mirror of a $f = 110$ mm focal length after the aperture.

Following a similar approach for the InSb detector, we need an aperture of 3 mm and 2.5 mm in CW and in step-scan respectively to be aperture limited (see Appendix #link(<appendix_A>)[A]). Leading to a throughput of $4.07 times 10^(- 7)$ $upright(m^2 dot.op s r)$ and $2.83 times 10^(- 7)$ $upright(m^2 dot.op s r)$ in CW and step-scan, respectively.

To summarize, the calibration procedure consist of six main steps:

+ Choose the proper detector/beam splitter combinaision for NIR or MIR measurements. (e.g., MCT and KBr for MIR or InSb and CaF#sub[2] for NIR)

+ Determine the limiting aperture by gradually reducing the aperture size until the measured signal amplitude of the heated control emitter becomes aperture-limited. Then, calculate the instrument throughput using @throughput.

+ Measure the raw thermal emission spectrum of the control radiation emitter ($S_(upright(S i \, m e a s)) \( tilde(nu) \)$) at two different temperatures ($T_1$ and $T_2$).

  + For step-scan calibration, use a lock-in amplifier and optical chopper wired as in @fig:schem#h(0pt);(a).

+ Calculate the response function $m \( tilde(nu) \)$ using @m_nu_T.

+ Measure the raw emission spectrum of a heated sample of interest ($S_(alpha \, upright(m e a s)) \( tilde(nu) \)$) placed under the microscope. For weak light emission measurement, the limiting aperture may be increased relative to the one used in step 2.

+ Using @S_alpha and the response function $m \( tilde(nu) \)$ obtained in step 4, calculate the calibrated sample emission spectrum ($S_alpha \( tilde(nu) \)$). The obtained spectrum (in W/cm#super[\-1]) quantifies light emitted by the sample within the instrument throughput $theta$ set in step 5.

= Results <sec:results>
#figure(numbering: _ => "2", image("source/Figures/figure_2.pdf", width: 100%),
  caption: [
    a) Measured raw emission signal $S_(upright(S i \, m e a s))$ collected with the MCT detector in CW mode. b) Response function $m \( tilde(nu) \)$ of the MCT detector in CW mode. c) Measured raw emission signal $S_(upright(S i \, m e a s))$ collected with the MCT detector in step-scan mode. d) Response function $m \( tilde(nu) \)$ of the MCT detector in step-scan mode. All measurements are taken at various emitter temperatures ($T_(upright(R T D))$).
  ]
) <fig:MCT>

In @fig:MCT and @fig:InSb, we measure the response function $m \( tilde(nu) \)$ of the instrument when equipped with two different detectors (MCT and InSb, respectively), in CW and in step-scan. To do so, we first measure the raw emission spectra ($S_(upright(S i \, m e a s))$) of the silicon radiator at four different temperatures. We then proceed to background cancellation according to @m_nu_T. In this case, $T_1$ is the lowest measured emission temperature (e.g., $T_(upright(R T D)) = 399$ K in @fig:MCT#h(0pt);(a)) and $T_2$ is successively set to the other three $T_(upright(R T D))$ emission temperatures.

For the MCT detector, @fig:MCT#h(0pt);(a) and @fig:MCT#h(0pt);(c) show the raw measured signal $S_(upright(S i \, m e a s)) \( tilde(nu) \)$ of the silicon emitter at various RTD temperatures ($T_(upright(R T D))$) for the CW and step-scan measurements respectively. Peaks around 1400 to 1800 cm#super[\-1] and 3500 to 4000 cm#super[\-1] are caused by water absorption while peaks around 2200 to 2400 cm#super[\-1] are caused by CO#sub[2] absorption @Smal_2014. As $T_(R T D)$ increases, the device emits more light at higher wavenumber. This is expected and predicted in the theoretical value $S_(upright(S i \, t h))$ (see Appendix #link(<appendix_B>)[B]). Using the curves from @fig:MCT#h(0pt);(a) and c, with @m_nu_T, we calculate the response function $m \( tilde(nu) \)$ at different temperatures. In this case, we use $T_1 = T_(upright(R T D)) = 440$ K in CW and $T_1 = T_(R T D) = 433$ K in step-scan. We then use $T_2 = 528$ K, 631K and 697 K in CW, and $T_2 = 558$ K, 663K and 741 K in step-scan.

Still for the MCT detector, @fig:MCT#h(0pt);(b) and @fig:MCT#h(0pt);(d) show the response function $m \( tilde(nu) \)$ with the various emitter temperatures in CW and step-scan, respectively. Importantly, the response functions are essentially temperature independant, as expected from eq 5. The lowest noise, highest temperature curve (e.g., at 697 K in @fig:MCT#h(0pt);(b)) can be used for calibrating the emission of any sample, regardless of its temperature. The lower temperature curves are included in the figures to validate the method: i.e., a dependence in temperature would indicate a problem with our calibration. We note a maximum around 800 cm#super[\-1] which is consistent with detectivity charts for the MCT detector @Bruker_2019. Importantly, both response functions are essentially temperature-independent, as expected in @m_nu_T. This is an important confirmation of the validity of our method since errors in, for example, the measurement of the radiator temperature would cause a mismatch of the different response functions. At higher $T_(upright(R T D))$, there is less noise at higher wavenumbers for the response function $m \( tilde(nu) \)$. This is expected from the higher emission in the NIR range as shown in @fig:MCT#h(0pt);(a) and c.

Following a similar process for the InSb detector, @fig:InSb#h(0pt);(a) and @fig:InSb#h(0pt);(c) show the measured signal of the calibrated emitter at various emitter temperatures in CW and step-scan measurements respectively. In CW we use $T_1 = T_(upright(R T D)) = 440$ K and $T_2 = 726$ K, 595 K and 836 K. In step-scan $T_2 = 589$ K, 717 K and 820 K.

#figure(numbering: _ => "3", image("source/Figures/figure_3.pdf", width: 100%),
  caption: [
    a) Measured raw emission signal $S_(upright(S i \, m e a s))$ collected with the InSb detector in CW mode. b) Response function $m \( tilde(nu) \)$ of the InSb detector in CW mode. c) Measured raw emission signal $S_(upright(S i \, m e a s))$ collected with the InSb detector in step-scan mode. d) Response function $m \( tilde(nu) \)$ of the InSb detector in step-scan mode. All measurements are taken at various emitter temperatures ($T_(upright(R T D))$).
  ]
) <fig:InSb>

Conversely, @fig:InSb#h(0pt);(b) and @fig:InSb#h(0pt);(d) shows the response function $m \( tilde(nu) \)$ in CW and step-scan, respectively, for the InSb detector. Again, the peak around 2200 cm#super[\-1] matches detectivity charts for InSb detectors @Bruker_2019. In @fig:InSb#h(0pt);(d) the $T_(R T D) = 589$ K curve diverges from the other response at $tilde(nu) > 4000$ cm#super[\-1] due to insufficient optical signal for calibration. Otherwise, response function behaves similarly as for the MCT detector: amplitudes are constant at various temperatures, and noise at high wavenumber decreases as the temperature increases.

#figure(numbering: _ => "4", image("source/Figures/figure_4.pdf", width: 100%),
  caption: [
    a) Theoretical and measured noise of the FTIR equipped with the MCT detector, in CW mode, including the detector noise and the thermal background. The resolution is $Delta tilde(nu) = 4$ cm#super[\-1] b) Theoretical and measured noise of the MCT detector, in step-scan for multiple resolutions. In step-scan we only include the detector noise since there is no thermal background.
  ]
) <fig:noise_MCT>

#figure(numbering: _ => "5", image("source/Figures/figure_5.pdf", width: 100%),
  caption: [
    a) Theoretical and measured noise of the FTIR equipped with the InSb detector, in CW mode, including the detector noise and the thermal background. The resolution is $Delta tilde(nu) = 4$ cm#super[\-1] b) Theoretical and measured noise of the InSb detector, in step-scan for multiple resolutions. In step-scan we only include the detector noise since there is no thermal background.
  ]
) <fig:noise_InSb>

Importantly, it should be noted that the instrument response function shown in @fig:MCT - @fig:InSb are throughput-independent due to the normalization performed in @S_alpha - @m_nu. In other words, $m \( tilde(nu) \)$ is the response function to light coupled within the instrument throughput, whatever this throughput may be. In Appendix #link(<appendix_A>)[A], we confirm that the response function is independent of the throughput, provided that we know what is limiting throughput.

We can then combine the response function for both detectors with the instrument self-noise to quantify the instrument noise floor $S_(upright(N))$ (see @S_N. We take a background measurement of the unheated sample at room temperature $S_(upright(N \, m e a s))$ ($T_(upright(r o o m)) approx 300$ K) and calibrate this signal using the response function $m \( tilde(nu) \)$ with @S_alpha. The noise floor are shown in @fig:noise_MCT -- @fig:noise_InSb#h(0pt);(a) in CW, for respectively the MCT and InSb detectors, with a resolution $Delta tilde(nu) = 4$ cm#super[\-1]. Likewise, noise floor measurements in step-scan are presented in @fig:noise_MCT -- @fig:noise_InSb b for the same two detectors with a resolution $Delta tilde(nu) = 32$ cm#super[\-1]. Note that noise floors for other resolutions can be inferred from the data in @fig:noise_MCT - @fig:noise_InSb using the relations given in @S_N - @N_tot. In particular, noise floors spectra limited by detector noise (e.g., step-scan) can be expected to scale as $Delta tilde(nu)^(- 1)$ (@N_det while noise floors are background limited (i.e., in CW) are resolution-independent (@N_bgnd.

The measured noise floor $S_(upright(N))$ are consistent with theoretical predictions. The theoretical noise $N_(upright(t o t))$ comprises the thermal room temperature background $N_(upright(b g n d))$ (in CW only) and the detector noise $N_(upright(d e t))$ (for both CW and step-scan). In CW, at lower wavenumbers ($600$ $upright(c m^(- 1)) < tilde(nu) < 4500$ $upright(c m^(- 1))$) noise is limited by the thermal background $N_(upright(b g n d))$, while at higher wavenumber $tilde(nu) > 4500$ $upright(c m^(- 1))$) it is limited by the detectors noise $N_(upright(d e t))$. In step-scan, we do not have $N_(upright(b g n d))$ due to the nature of the measurement, hence we are limited by $N_(upright(d e t))$ for the entire spectra. Note that detector noise $N_(upright(d e t))$, are nominal values taken from @Bruker_2019 (see section @sec:methods for the responsitivity of detectors) and may vary for one detector to another. Theoretical detectors noise in @fig:noise_MCT - @fig:noise_InSb should therefore be treated as an estimate and is not meant for precise quantitative comparisons.

For CW measurements @fig:noise_MCT -- @fig:noise_InSb a, the measured noise is approximately a factor $approx 20$ above the predicted noise $N_(upright(t o t))$ for the MCT detector and $approx 12$ for the InSb detector. This can likely be explained by optical losses in the instrument. As stated in @Griffiths_2007, a typical standalone FTIR has a light collection efficiency of 10%, while additional losses can reasonably be expected within the microscope attachment.

In step-scan (@fig:noise_MCT -- @fig:noise_InSb b), the theoretical noise is only composed of the detector noise $N_(upright(d e t))$ since the unmodulated background is rejected by lock-in detection. These measurement are 1-2 orders of magnitude above the nominal detector noises, which is consistent with the collection efficiency observed in CW.

We note that noise levels are significantly lower in step-scan than in CW. This difference is partly due to the absence of thermal background in the step-scan measurements at lower wavenumbers. However, at higher wavenumbers, the discrepancy arises from differences in averaging time and measurement frequency. The CW noise is measured with a resolution of 4 cm#super[--1], a mirror frequency of $f_D = 20$ kHz, and averaging over 32 scans for a total measurement time of 20 s. In step-scan mode, various resolutions are used, with a lock-in time constant of 32 ms or $f_D = 4.97$ Hz, a mirror stabilization time of 150 ms, and each interferogram data point is averaged for 150 ms. For the same resolution as in CW ($Delta tilde(nu) = 4$ cm#super[\-1]), our measurement time amounts to 1000 s in step-scan, i.e., 50 times longer than in CW. This longer sampling time explains the lower noise floor for step-scan measurements, as expected with noise scaling with $f_D^(1 \/ 2)$ in @N_det.

As a final sanity check of our calibration method, we measure light emission from light emitting diodes (LED) placed directly under the microscope. For CW measurements, we use an LED emitting at 6060 cm#super[\-1] (Marktech Optoelectronics MTE5116N5) with a nominal emission power of 5 mW @datasheet_LED. This near-infrared wavelength is chosen for CW measurement to ensure emission above the thermal background. Conversly, for step-scan measurements where the background is eliminated, we use an LED emitting at 2325 cm#super[\-1] (Hamamatsu L15895-0430MA) with a nominal emission power of 0.8 mW @LED_4_3. Since the emission power and cone angle of the LEDs are not calibrated separately, we cannot draw quantitative conclusions from these measurements and we therefore present then as supplementary material in Appendix #link(<appendix_C>)[C]. The data nevertheless indicates realistic emitted power values below the LED nominal emission value, as expected from not matching their emission cone with the FTIR throughput.

= Conclusion <sec:conclusion>
We demonstrated a simple practical method for calibrating a microscope-coupled FTIR for light emission measurements in both CW and step-scan modes. The response function $m \( tilde(nu) \)$ also enables us to determine the instrument noise floor in emission mode, for near and mid-infrared detectors. These noise floors are within theoretically predicted values considering typical FTIR collection efficiencies.

#heading(numbering: none)[Acknowledgments]
The authors would like to thank Sergey Shilov from Bruker#super[©] for his insightful feedback and support during the development of this calibration method.

#bibliography("source/Refs.bib", style: "american-physics-society")

#pagebreak(weak: true)
#heading(numbering: none)[Appendix A. Throughput Measurement] <appendix_A>
The throughput of the FTIR is limited by either the diameter of the mirrors/detector, by the Jacquinot stop (i.e., aperture), by the acceptance angle of the microscope objective for microscope-coupled FTIR, or by the solid angle of the beam in the interferometer. The throughput of the detector (or aperture) is calculated as @Griffiths_2007 

#math.equation(block: true, numbering: _ => [(A1)], $theta = Omega A = 2 pi (1 - cos alpha_(upright(M))) A \,$) <theta_D>

 where A is the area of the detector (or aperture), $Omega$ is the solid angle, and $alpha_(upright(M))$ is the maximum half angle of the focused beam.

The throughput of the solid angle of the beam in the interferometer can be calculated as @Griffiths_2007 

#math.equation(block: true, numbering: _ => [(A2)], $theta_(upright(I)) = Omega_(upright(I)) A_(upright(M)) = frac(2 pi Delta tilde(nu) A_(upright(M)), tilde(nu)_(upright(m a x))) \,$) <theta_I>

 where $Omega_(upright(I))$ is the solid angle of the beam of the interferometer, $A_(upright(M))$ is the area of the mirror in the interferometer, $tilde(nu)_(upright(m a x))$ is the maximum wavenumber measured and $Delta tilde(nu)$ is the resolution.

It is difficult to predict exactly what is limiting the throughput. For example, we do not know the throughput of the microscope objective. Likewise, in step-scan, we use a perforated plate to limit the beam diameter to within the chopper wheels, which will also add another variable to the throughput. Therefore, we impose the limiting throughput by reducing the aperture size until the signal becomes aperture-limited. To calculate the throughput, we then use @theta_D with $A_D$ equal to the aperture area and the maximum half angle is given by: 

#math.equation(block: true, numbering: _ => [(A3)], $tan alpha_(upright(M)) = frac(D_(upright(b e a m)), 2 f) \,$) <alpha>

 where $D_(upright(b e a m)) approx 30$ mm is the diameter of the beam following the aperture and $f$ is the focal length of the collection mirror following the aperture.

To assess the limiting aperture, for both CW and step-scan measurements, we place the controlled emitter at a high temperature (i.e., 400 K) under the microscope. Then we measure the amplitude of the signal starting with the largest aperture, gradually reducing it to the smallest aperture available in our instrument (i.e., from $D_(upright(a p)) = 8$ mm to $D_(upright(a p)) = 0.25$ mm). @fig:apperture shows the normalized signal amplitude as function of the aperture size, where \"$x$\" symbol denotes the aperture used for $m \( tilde(nu) \)$ measurements.

#figure(numbering: _ => "A1", image("source/Figures/APPENDICE_Aperture_test.pdf", width: 100%),
  caption: [
    Normalized amplitude in function of aperture size for the MCT and InSb detectors in CW and in step-scan. The response function is calculated using an aperture of 4 mm for the MCT and 3 mm for the InSb detectors in CW. In step-scan we used an aperture of 1.5 mm and 2.5 mm for the MCT and InSb detectors respectively.
  ]
) <fig:apperture>

For the CW measurements, the limiting aperture for the MCT detector is \~5 mm, thus we use a 4 mm aperture for our measurements to ensure we are aperture limited. Similarly, for the InSb detector, the limiting aperture is also \~5 mm and we use a 3 mm aperture. In step-scan, the limiting aperture for the MCT detector is \~3 mm, and we use a 1.5 mm aperture. For the InSb detector, the limiting aperture is \~4 mm, and we use a 2.5 mm aperture. Note that, as discussed in the main text, the final chosen aperture is not critically important as long as the system is aperture-limited.

As expected, the limiting aperture in step-scan is different from the CW measurements. In step-scan, we use a chopper in the sample compartment to modulate the signal (see @fig:schem#h(0pt);(a)). At this location, the beam diameter is larger than the chopper blades and we are unable to properly modulate the signal. Hence, we place a perforated plate in front of the chopper to reduce the diameter of the beam, reducing the signal amplitude and changing the limiting aperture.

When we are aperture limited, we calculate the throughput using @theta_D with $A = pi D_(upright(a p))^2 \/ 4$. The maximum half angle is then calculated with @alpha using $D_(upright(b e a m)) = 30$ mm and a focal length of $f = 110$ mm, resulting in a maximum half angle of $alpha_(upright(M)) approx 7.86^compose$.

This results in a throughput of $7.24 times 10^(- 7)$ $upright(m^2 dot.op s r)$ with $D_(upright(a p)) = 4$ mm and $1.02 times 10^(- 7)$ $upright(m^2 dot.op s r)$ with $D_(upright(a p)) = 1.5$ mm for the MCT in CW and step-scan mode respectively. For the InSb detector we have a throughput of $4.07 times 10^(- 7)$ $upright(m^2 dot.op s r)$ with $D_(upright(a p)) = 3$ mm and $2.82 times 10^(- 7)$$upright(m^2 dot.op s r)$ with $D_(upright(a p)) = 2.5$ mm in CW and step-scan mode respectively.

@fig:apperture_test shows the response function $m \( tilde(nu) \)$ for various different aperture size (2, 3, 4 and 6 mm) for the MCT detector in CW mode. For apertures of 2, 3, and 4 mm, we are aperture limited, while for the 6 mm aperture, we are limited by something else in the instrument. @fig:apperture_test therefore confirms that the response function $m \( tilde(nu) \)$ is independent of throughput (2, 3, and 4 mm) as long as the throughput is known and accounted for in @S_th.

In @S_N, background noise has different throughput $theta_(upright(n))$ since this noise originates from modulation of the background light by the interferometer, which is independent of the aperture stop. In this case, we calculate $theta_n$ using beam size of $D_(upright(b e a m)) approx 30$ mm and the focusing mirror before the detector of focal length of $f = 33$ mm, leading to a throughput of $theta_n = 5.63 times 10^(- 7)$ $upright(m^2 dot.op s r)$.

#figure(numbering: _ => "A2", image("source/Figures/APPENDICE_tooling_apperture_dep.pdf", width: 100%),
  caption: [
    Response function $m \( tilde(nu) \)$ for various aperture size for the MCT detector in CW mode. When aperture-limited (i.e., for 2, 3 and 4 mm), the response functions are superimposed, as expected.
  ]
) <fig:apperture_test>

#heading(numbering: none)[Appendix B. Theoretical Emission of the Radiator] <appendix_B>
In this section we derive the theoretical spectral emission $S_(upright(t h)) \( tilde(nu) \)$ (see @S_th of the controlled emitter used to calculate the response function $m \( tilde(nu) \)$.

Firstly, we show that the emissivity is weakly dependent on the angle $gamma$, allowing us to use the diffused surface approximation $epsilon.alt \( tilde(nu) \, gamma \) = epsilon.alt \( tilde(nu) \, 0 \)$. To do so, the spectral hemispherical emissivity of the multi-layer (i.e., Air/Si/Ag) is calculated as @Bergman_2020 

#math.equation(block: true, numbering: _ => [(B1)], $epsilon.alt \( tilde(nu) \, T \) = frac(integral_0^(phi.alt_(upright(m a x))) integral_0^(gamma_(upright(m a x))) epsilon.alt \( tilde(nu) \, gamma \, phi.alt \, T \) cos gamma sin gamma d gamma d phi.alt, integral_0^(phi.alt_(upright(m a x))) integral_0^(gamma_(upright(m a x))) cos gamma sin gamma d gamma d phi.alt) \,$) <eps_theta_phi>

 where $epsilon.alt_(tilde(nu) \, gamma) \( tilde(nu) \, gamma \, phi.alt \, T \)$ is the spectral directional emissivity. Assuming the emissivity is independent of azimuthal angle $phi.alt$, @eps_theta_phi simplifies to: 

#math.equation(block: true, numbering: _ => [(B2)], $epsilon.alt_(tilde(nu)) \( tilde(nu) \, T \) = frac(integral_0^(gamma_(upright(m a x))) epsilon.alt \( tilde(nu) \, gamma \, T \) cos gamma sin gamma d gamma, integral_0^(gamma_(upright(m a x))) cos gamma sin gamma d gamma) \,$) <eps_theta>

 where $epsilon.alt_(tilde(nu) \, gamma) \( tilde(nu) \, gamma \, T \)$ is the spectral directional emissivity of the multilayer stack, and $gamma_(upright(m a x))$ is the maximum angle considered in the integration.

@fig:Si_angle shows the integrated emissivity at room temperature for various $gamma_(upright(m a x))$. The weak dependence of @fig:Si_angle on $gamma_(upright(m a x))$ indicates that using the diffused surface emissivity approximation is appropriate.

#figure(numbering: _ => "B1", image("source/Figures/APPENDICE_Si.pdf", width: 100%),
  caption: [
    Emissivity of the silicon radiator integrated over various cone angles. 0$""^compose$ indicates normal incidence emissivity. Note that this calculation suffers from fast oscillation due to optical interference between the silicon interfaces. Those are smoothed out by a low pass filter.
  ]
) <fig:Si_angle>

With our known emissivity, we can apply @S_th to calculate the theoretical spectral emissivity $S_(upright(t h)) \( tilde(nu) \)$. @fig:Si_Th shows $S_(upright(S i \, t h))$ for the MCT detector in CW, at emiter temperature taken from @fig:MCT#h(0pt);(a), and with the throughput $theta = 7.24 times 10^(- 7)$ $upright(m^2 dot.op s r)$ for an aperture of $D_(upright(a p)) = 4$ mm that is used for the MCT detector in CW.

#figure(numbering: _ => "B2", image("source/Figures/APPENDICE_TH_VAL.pdf", width: 100%),
  caption: [
    Example theoretical emission of the thermal emitter $S_(upright(S i \, t h))$ with the throughput $theta = 7.24 times 10^(- 7)$ $upright(m^2 dot.op s r)$ for an aperture of $D_(upright(a p)) = 4$ mm and at the temperature used for the MCT detector in CW.
  ]
) <fig:Si_Th>

#heading(numbering: none)[Appendix C. LED Emission Test Measurements] <appendix_C>
@fig:LED_MCT - @fig:LED_InSb#h(0pt);(a) presents the emission of a 6060 cm#super[\-1] LED $S_(upright(L E D))$ in CW for the MCT and InSb detectors respectively. For the MCT, we measure an emission of 1.07 mW and for the InSb we measure 2.19 mW (from 5500 cm#super[\-1] to 7100 cm#super[\-1]), which are within the nominal range of 5 mW. @fig:LED_MCT - @fig:LED_InSb#h(0pt);(b) presents the emission of a 2325 cm#super[\-1] LED of 0.8 mW, in step-scan for the MCT and InSb detectors respectively. For step-scan measurement the LED current is modulated between 0 - 100 mA (0 - 0.8 mW) at 1 kHz. With the MCT, we measure an emission of 0.011 mW and for the InSb we measure 0.027 mW (from 1850 cm#super[\-1] to 3800 cm#super[\-1]). As expected, this is lower than the nominal value since this particular LED emits most of its radiation within a 30$""^compose$ cone that is wider than acceptance angle of the objective.

#figure(numbering: _ => "C1", image("source/Figures/figure_6.pdf", width: 100%),
  caption: [
    a) 6060 cm#super[\-1] LED measurement in CW with MCT detector, where the LED emits 1.07 mW from 5500 cm#super[\-1] to 7100 cm#super[\-1]. b) 2325 cm#super[\-1] LED measurement in step-scan with MCT detector, where the LED emits 0.011 mW from 1850 cm#super[\-1] to 3800 cm#super[\-1]. The aperture is fully open ($D_(upright(a p)) = 8$ mm) in both cases.
  ]
) <fig:LED_MCT>

#figure(numbering: _ => "C2", image("source/Figures/figure_7.pdf", width: 100%),
  caption: [
    a) 6060 cm#super[\-1] LED measurement in CW with InSb detector, where the LED emits 2.19 mW from 5500 cm#super[\-1] to 7100 cm#super[\-1]. b) 2325 cm#super[\-1] LED measurement in step-scan with InSb detector, where the LED emits 0.029 mW from 1850 cm#super[\-1] to 3800 cm#super[\-1]. The aperture is fully open ($D_(upright(a p)) = 8$ mm) in both cases.
  ]
) <fig:LED_InSb>

