= Device Fabrication
#label("sec:device fab")
The bolometer pixel is assembled from three separately fabricated components: (i) a silicon photonic-crystal (PhC) cavity patterned in a 220 nm device layer of an SOI wafer, (ii) an array of pyrolytic-carbon nanopillars that provide broadband LWIR absorption, and (iii) hollow zirconia supports that thermally isolate the suspended pixel from the substrate. A schematic and sequence of the process are shown in @fig:SI_fab.

#figure(image("source/figures/si_fig1.pdf", width: 100.0%),
  caption: [
    #strong[Fabrication and heterogeneous integration of the photonic crystal bolometer.] #strong[\(a-e)] Fabrication of the suspended device \"stamp\". #strong[\(a)] The process begins with a SOI wafer, which consists of a silicon device layer on top of a buried oxide layer. #strong[\(b)] A PhC cavity is patterned into the silicon device layer. #strong[\(c)] Photoresist pillars are defined on the PhC die, and #strong[\(d)] are subsequently converted into pyrolytic carbon absorbers through a high-temperature pyrolysis process. #strong[\(e)] The underlying buried oxide layer is selectively removed with a vapor HF etch to release the suspended stamp. #strong[\(f-h)] Concurrent fabrication of the hollow supports. #strong[\(f)] On a separate substrate, sacrificial polymer molds are patterned. #strong[\(g)] A conformal layer of zirconia is deposited via ALD. #strong[\(h)] The polymer core is removed using an $upright(O_2)$ plasma ash, leaving hollow supports. #strong[\(i)] In the final step, the released PhC stamp is transferred via a pick-and-place technique onto the zirconia supports to form the final device.
  ]
)
<fig:SI_fab>

== Silicon PhC cavity
#label("subsec:device fab - phc")
PhC cavities were fabricated by a commercial foundry (Applied Nanotools Inc.) in the 220 nm silicon device layer of an SOI wafer with a 2 µm buried oxide (BOX). The design is an L4/3 line-defect cavity with a weak periodic grating perturbation that enhances out-of-plane coupling @minkov_photonic_2017. Pattern transfer used positive-tone e-beam lithography and reactive-ion etching (RIE).

== Pyrolytic-carbon absorbers
#label("subsec:device fab - absorbers")
The PhC die was coated with a diluted mr-DWL 40 negative resist, exposed to define polymer pillars of $4 - 6 med mu upright(m)$ diameter, and pyrolyzed at $800 thin^compose upright(C)$ in : @mizuno_black_2009. After pyrolysis, the pillars shrink to $3 - 4 med mu upright(m)$ diameter and retain high optical absorption with minimal mass; a brief $upright(O_2)$ plasma removes surface residue.

FTIR of the fabricated pyrolytic-carbon pillars (See @fig:FTIR.) shows broad absorptance across the LWIR ($8 - 14 med mu upright(m)$) range, peaking around 0.8 near $10 med mu upright(m)$, along with dependence on pillar diameter.

#pagebreak()

#figure(image("source/figures/si_fig2.pdf", width: 40.0%),
  caption: [
    #strong[FTIR absorptance of pyrolytic-carbon pillars.] Absorptance vs wavelength for pillar arrays of different final diameters. The data confirm broadband, high absorptance in the LWIR range.
  ]
)
<fig:FTIR>

== Hollow zirconia supports
#label("subsec:device fab - eggshells")
On a separate transparent substrate, sacrificial polymer nubbins (mr-DWL 5) were defined and conformally coated by atomic-layer deposition (ALD) of $upright(Z r O_2)$ ($20 - 40 med upright(n m)$) to form closed shells @levi_emerging_2004.

A small $approx 100 med upright(n m)$ focused-ion-beam (FIB) vent was opened in the shell, and the internal polymer was removed by $upright(O_2)$ plasma ashing. Energy-dispersive X-ray spectroscopy (EDS) line-scans acquired in the SEM highlight the role of the FIB vent in the hollowing process (see @fig:eggshell_FIB.). Without the vent, the polymer core remains largely trapped beneath the $upright(Z r O_2)$ coating after $upright(O_2)$ plasma ashing, as indicated by a strong internal carbon signal. After introducing the FIB hole and performing the same plasma ashing, the carbon signal drops to background while zirconium and oxygen remain, confirming that the vent enables complete removal of the organic core and yields a hollow ceramic shell.

#figure(image("source/figures/si_fig3.pdf", width: 90.0%),
  caption: [
    #strong[Role of the FIB vent in hollowing zirconia "eggshells."] #strong[a,b], SEM and EDS line-scans of a $upright(Z r O_2)$-coated polymer nubbin before venting: a pronounced carbon peak indicates the retained polymer core. (c,d) After FIB milling a small vent at the shell apex, the internal carbon signal vanishes while zirconium and oxygen remain, confirming that the vent allows the polymer to be fully removed by the oxygen plasma ashing and leaves a hollow $upright(Z r O_2)$ shell.
  ]
)
<fig:eggshell_FIB>

== Integration
#label("subsec:device fab - integration")
For the final assembly, the PhC and absorber structure was first released from its handle wafer by a hydrofluoric (HF) acid etch that selectively removed the buried oxide (BOX) layer, leaving a suspended silicon "stamp" connected to the surrounding frame by narrow silicon tethers ($approx 100 - 200 med upright(n m)$ wide), as shown in @fig:stamp. These tethers mechanically support the membrane after release and allow it to be manipulated under a microscope without damage.

Using a micromanipulator-based tungsten probe, the suspended stamp was then broken free at the tether anchors and transferred onto the pre-fabricated hollow $upright(Z r O_2)$ supports on the target glass substrate, as illustrated in @fig:SI_fab\(i). This step completes the heterogeneous pixel.

#figure(image("source/figures/si_fig4.png", width: 50.0%),
  caption: [
    #strong[Released silicon "stamp" prior to transfer.”] SEM of the suspended silicon membrane carrying the L4/3 photonic-crystal cavity and six surrounding pyrolytic-carbon absorbers. Narrow silicon tethers ($approx 100 - 200 med upright(n m)$) retain the membrane on the frame after BOX removal and are gently fractured during pick-and-place.
  ]
)
<fig:stamp>

= Experimental Setup
<sec:setup>
All optical measurements were performed using a custom-built, cross-polarized free-space microscope shown in @fig:SI_setup, and detailed in Methods in the main text. The tunable C-band telecom laser provided the probe beam, which was focused onto the PhC bolometer through a polarizing beamsplitter and high-numerical-aperture (NA = 0.55) objective. A 405 nm diode laser, intensity-modulated by a function generator, served as the photothermal excitation source. The reflected probe was routed to either an IR camera for cavity spectra or a balanced homodyne detector for phase-sensitive measurements of noise and temporal response. The setup also included an auxiliary InGaAs APD for power monitoring and a white-light LED path for device alignment and focusing.

#figure(image("source/figures/si_fig5.pdf", width: 90.0%),
  caption: [
    #strong[Optical characterization setup.] Schematic of the custom-built, cross-polarized free-space microscope used for all optical characterization. A tunable C-band telecom laser (IR Source) provides the probe beam, which is directed to the PhC bolometer through a polarizing beamsplitter (PBS) and objective. A 405 nm diode laser, driven by a function generator for modulation, provides the photothermal stimulus. The reflected probe signal (dashed red arrow) is separated from the input path by the PBS. For photothermal responsivity measurements, the signal is directed by a beamsplitter (BS) to an IR Camera to record the cavity spectrum. For phase-sensitive noise and temporal response measurements, the signal is sent to the Balanced Homodyne Detection module. In this path, the signal is interfered with a path-length-matched local oscillator (LO) and detected by a balanced photodiode pair. For noise floor characterization, the 405 nm laser is off. The homodyne voltage is recorded on a digital Oscilloscope. An additional IR APD path is available for direct power measurements, and a white light LED path is used for alignment. BS: 90:10 Beamsplitter; PBS: Polarizing Beamsplitter; DM: Dichroic Mirror; LP: Linear Polarizer; $lambda \/ 2$: Half-wave plate; LO: Local Oscillator; DAQ: Data Acquisition system.
  ]
)
<fig:SI_setup>

= Balanced homodyne interferometry
<sec:BHI>
== Principle
#label("subsec:BHI - principle")
Homodyne detection measures a chosen quadrature of an optical field by interfering the field under test (our "signal") with a strong, phase-coherent local oscillator (LO) at the same optical frequency, and reading out the intensity difference between two complementary output ports of a $50 : 50$ beamsplitter. The difference signal is linear in the signal field and (because the two ports carry the same mean LO power) exhibits strong common-mode rejection of LO intensity noise @yuen_noise_1983.

The realization is shown in Supplementary @fig:SI_setup. The probe reflected from the PhC cavity provides the signal; the LO is derived from the same laser and routed through a phase/delay line. The two fields are brought into a common spatial mode with orthogonal linear polarizations by a polarizing beamsplitter (PBS). A $lambda \/ 2$ plate sets the analysis basis to $plus.minus 45^compose$, and a second PBS projects the mixed field onto two outputs that are detected on a balanced photodiode pair. In this polarization-domain analyzer, the $lambda \/ 2 +$PBS block implements the $50 : 50$ mixing of signal and LO required for homodyne detection, and the subsequent electronic subtraction yields the balanced output.

== Field relations and balanced difference
#label("subsec:BHI - field relations")
Let the fields incident on the analysis PBS (after the $lambda \/ 2$ plate) be $ upright(bold(E))_(upright(s i g)) \( t \) = sqrt(P_(upright(s i g))) thin chi \( lambda \) thin e^(i omega t) thin hat(upright(bold(e)))_x \, #h(2em) upright(bold(E))_(upright(L O)) \( t \) = sqrt(P_(upright(L O))) thin e^(i \( omega t + phi.alt_(upright(L O)) \)) thin hat(upright(bold(e)))_y \, $ with $hat(upright(bold(e)))_(x \, y)$ orthogonal linear polarizations, $P_(upright(s i g))$ the collected signal power, and $chi \( lambda \)$ the complex field response of the cavity in reflection. Define $ phi.alt equiv phi.alt_(upright(L O)) + arg chi . $ Rotating to the $plus.minus 45^compose$ basis and splitting on the analysis PBS yields output fields $ upright(bold(E))_plus.minus = 1 / sqrt(2) (upright(bold(E))_(upright(L O)) plus.minus upright(bold(E))_(upright(s i g))) \, $ so that the detected powers are $ P_plus.minus = frac(P_(upright(L O)) + P_(upright(s i g)) \| chi \|^2, 2) plus.minus sqrt(P_(upright(L O)) P_(upright(s i g))) thin upright(R e) #h(-1em) [chi \( lambda \) e^(i phi.alt)] . $

With photodiode responsivity $cal(R)$ (A/W), the balanced photocurrent difference is $ i_Delta equiv cal(R) thin \( P_(+) - P_(-) \) = 2 cal(R) sqrt(P_(upright(L O)) P_(upright(s i g))) thin upright(R e) #h(-1em) [chi \( lambda \) e^(i phi.alt)] #h(0em) prop #h(0em) X_phi.alt \, $ where $X_phi.alt$ denotes the signal quadrature, and the quadrature angle $phi.alt$ is set by the LO phase. Locking the interferometer with the active PID controller such that $phi.alt = pi \/ 2$ selects the phase quadrature, which is the operating condition used for our measurements, as it provides the maximum linear slope of the cavity response and minimizes sensitivity to residual amplitude noise.

= Heat capacity calculation
#label("sec:heat capacity")
We adopt the single-node thermal model defined in the main text. Here we (i) compute the pixel's total heat capacity $C_(t h)$ from geometry and materials only, and (ii) use the independently measured thermal resistance $R_(t h)$ to predict $tau_(t h)^(p r e d) = R_(t h) c_(t h)$, which we then compare with the directly measured time constant $tau_(t h)^(m e a s)$.

== Model and parameters
#label("subsec:heat capacity - model")
For small temperature perturbations, the device is well described by a single thermal mode @incropera1990fundamentals@richards_bolometers_1994@blaikie_fast_2019 with total heat capacity $ C_(t h) = sum_j rho_j thin c_(p \, j) thin V_j \, #h(2em) j in { upright("Si membrane") \, med upright("pyrolytic-carbon pillars") } \, $ where $rho$ is mass density, $c_p$ is the (room-temperature) specific heat capacity, and $V$ is volume. The zirconia contribution is neglected (see #ref(label("subsec:heat capacity - assumptions"))).

The different numerical values used in following derivations are reported in Supplementary @tab:parameters. \

== Component-wise calculation
#label("subsec:heat capacity - calculation")
==== Silicon membrane.
<silicon-membrane.>
$ V_("Si") &= (23 times 10^(-6) "m")(16 times 10^(-6) "m")(220 times 10^(-9) "m") \
            &= 8.096 times 10^(-17) "m"^3, $
$ m_("Si") &= rho_("Si") V_("Si")
            = 2330 "kg" thin "m"^(-3) times 8.096 times 10^(-17) "m"^3
            = 1.89 times 10^(-13) "kg", $
$ C_("Si") &= rho_("Si") c_(p, "Si") V_("Si")
            = 1.631 times 10^6 "J" thin "m"^(-3) thin "K"^(-1) times 8.096 times 10^(-17) "m"^3
            = 1.32 times 10^(-10) "J" thin "K"^(-1). $

==== Pyrolytic-carbon pillars (per pillar).
<pyrolytic-carbon-pillars-per-pillar.>
$ V_(upright("pillar")) & = pi \( 1.5 times 10^(- 6) med upright(m) \)^2 \( 3 times 10^(- 6) med upright(m) \) = 2.12 times 10^(- 17) med upright(m^3) \,\
m_(upright("pillar")) & = rho_(upright(p c)) V_(upright("pillar")) = 1900 med upright(k g thin m^(- 3)) times 2.12 times 10^(- 17) med upright(m^3) = 4.03 times 10^(- 14) med upright(k g) \,\
C_(upright("pillar")) & = rho_(upright(p c)) c_(p \, upright(p c)) V_(upright("pillar")) = 1.349 times 10^6 med upright(J thin m^(- 3) thin K^(- 1)) times 2.12 times 10^(- 17) med upright(m^3) = 2.86 times 10^(- 11) med upright(J thin K^(- 1)) . $

==== Total for six pillars.
<total-for-six-pillars.>
$ C_(upright("pillars,tot")) = N thin C_(upright("pillar")) = 6 times 2.86 times 10^(- 11) med upright(J thin K^(- 1)) = 1.72 times 10^(- 10) med upright(J thin K^(- 1)) . $

== Total heat capacity and composition
<total-heat-capacity-and-composition>
$ C_(t h) = C_(upright(S i)) + C_(upright("pillars,tot")) = 1.32 times 10^(- 10) med upright(J thin K^(- 1)) + 1.72 times 10^(- 10) med upright(J thin K^(- 1)) = 3.04 times 10^(- 10) med upright(J thin K^(- 1)) . $

This yields a breakdown by component of $43.5 %$ for the silicon membrane and $56.5 %$ for the pillars.

== Assumptions
#label("subsec:heat capacity - assumptions")
- Zirconia is omitted by assumption as (i) zirconia is largely confined to the anchors/tethers or otherwise strongly thermalized to the bath so that its temperature participation (average $Delta T$ relative to the pixel) is small, and (ii) its suspended volume is negligible compared with the Si membrane and carbon pillars. In the single-mode RC picture, only the heat capacity co-localized with the pixel's temperature rise contributes appreciably to $C_(t h)$\; mass tightly coupled to the bath contributes little to the measured time constant.

- Thin surface layers or residues (e.g. resist) are not included, since these are typically orders of magnitude smaller in volume than the Si slab and pillars.

- Temperature-independent $c_p$ over the operating range. The calculation uses room-temperature $c_p$ values. For the small-signal temperature perturbations of the bolometer, the variation of $c_p$ is a higher-order correction and does not affect the leading-order estimate of $C_(t h)$.

#figure(image("source/figures/si_fig6.pdf", width: 72%), placement: top,
  caption: [
    #strong[Sequential noise characterization of the optical readout.] RMS wavelength-noise amplitude spectral density $delta lambda_(upright(R M S)) \( f \)$ derived from continuous time-domain records using Welch's method @welch1967use and the independently measured calibration slope $S$. Traces correspond to: (i) oscilloscope only (digitizer noise floor), (ii) oscilloscope~+~detector (electronics floor), (iii) oscilloscope~+~detector~+~LO with the signal blocked (adds LO shot and residual technical noise), and (iv) total system noise under full homodyne operation with the cavity aligned. At low frequencies, technical noise dominates before a white plateau is reached; the instrument-limited floor is $S_lambda = 1.2 med upright(f m thin H z^(- 1 \/ 2))$.
  ]
)
<fig:SI_noise_budget>

== Thermal time constant prediction
#label("subsec:heat capacity - time constant pred")
Using the experimentally determined $R_(t h) approx 1.08 times 10^5 med upright(K thin W^(- 1))$ and the calculated $C_(t h) approx 3.04 times 10^(- 10) med upright(J thin K^(- 1))$, we predict $ tau_(t h)^(p r e d) approx R_(t h) C_(t h) approx 33 med mu upright(s) . $ The close agreement between the measured ($tau_(t h)^(m e a s) approx 34 med mu upright(s)$) and estimated values confirms the internal consistency of the thermal model and the extracted parameters.

= Noise-budget analysis
<sec:noise>
== Sequential noise characterization
#label("subsec:noise - charact")
To quantify the different contributions to the readout noise, four spectra were recorded under identical conditions (@fig:SI_noise_budget). The first trace, obtained with the oscilloscope input terminated, defines the digitizer noise floor. Adding the balanced detector in darkness raises this baseline to the electronics floor of the detector--TIA chain. Introducing the local oscillator (LO) while blocking the signal adds the LO shot noise and any residual technical noise that escapes common-mode rejection. The final trace, acquired with the cavity aligned and the lock set to the quadrature point used for responsivity calibration, represents the total system noise. At the moderate LO power used here, this spectrum coincides with the electronics-limited plateau, indicating that the current measurement is instrument-limited rather than shot-noise-limited. Operating at higher LO power would gradually lift the plateau toward the shot-noise regime, a condition intentionally avoided during calibration to prevent artefacts (see #ref(label("subsec:perf scaling - rationale"))).



== Voltage‑to‑wavelength calibration
#label("subsec:noise - calibration")
The open‑loop sweep of the probe laser provides a direct voltage‑to‑wavelength calibration for the balanced‑homodyne readout. With the LO phase set to quadrature, the detector measures the signal‑field quadrature of the cavity reflection (Supplementary @fig:SI_setup). For a single‑pole optical resonance the complex field response can be written $ chi \( lambda \) = frac(1, 1 + i epsilon) \, #h(2em) epsilon equiv frac(lambda - lambda_0, Gamma_lambda) \, $ where $lambda_0$ is the resonance wavelength and $Gamma_lambda$ is the half‑width at half‑maximum (HWHM) in wavelength units. The homodyne difference voltage then follows the familiar dispersive form $ v_h \( lambda \) = v_(upright(o f f)) - V_0 thin frac(epsilon, 1 + epsilon^2) \, $ with $V_0$ an overall gain constant and $v_(upright(o f f))$ a slowly varying background. Defining the normalized Lorentzian intensity $L \( lambda \) = 1 \/ \( 1 + epsilon^2 \)$, one finds $ frac(d L, d lambda) = - 2 / Gamma_lambda thin frac(epsilon, \( 1 + epsilon^2 \)^2) quad arrow.r.double quad v_h \( lambda \) = frac(Gamma_lambda V_0, 2) thin \( 1 + epsilon^2 \) thin frac(d L, d lambda) + v_(upright(o f f)) . $ Hence, in the vicinity of the lock point $lambda_(upright(o p)) tilde.eq lambda_0$ where $\| epsilon \| lt.double 1$, the measured lineshape is proportional to the #emph[derivative of a Lorentzian]. The local transduction slope used for calibration is $ S #h(0em) equiv #h(0em) frac(d v, d lambda)\|_(lambda = lambda_(upright(o p))) = frac(d v_h, d lambda)\|_(lambda_0) = - thin V_0 / Gamma_lambda \, #h(2em) upright("so that") #h(2em) \| S \| = V_0 / Gamma_lambda . $ This model is what we fit to the sweep in Fig.~3a (main text) to extract $S$ at the point of maximum slope. \
A long time-domain voltage record $v \( t \)$ is converted to the one-sided voltage power spectral density (PSD) $S_v \( f \)$ using Welch's method @welch1967use. Using the independently measured slope at the quadrature lock point, we obtain the calibrated wavelength-noise PSD $ S_lambda \( f \) = frac(S_v \( f \), S^2) \, #h(2em) sqrt(S_lambda \( f \)) = frac(sqrt(S_v \( f \)), \| S \|) . $ The spectrum shows low-frequency technical noise before reaching a white plateau; its level defines the electronics-limited floor reported in the main text, $ sqrt(S_lambda) = 1.2 med upright(f m thin H z^(- 1 \/ 2)) . $

== Thermo-refractive noise (TRN) limit
#label("subsec:noise - TRN limit")
For a single thermal mode characterized by $R_(t h)$ and $C_(t h)$ (Sec.~#ref(label("sec:heat capacity"))), the fluctuation--dissipation theorem @callen_irreversibility_1951 yields the one-sided temperature-noise PSD $ S_T \( f \) = frac(4 k_B T_0^2 R_(t h), 1 + \( 2 pi f tau_(t h) \)^2) \, #h(2em) tau_(t h) = R_(t h) C_(t h) . $

Temperature fluctuations shift the cavity resonance wavelength by $ delta lambda = Lambda_T thin delta T \, #h(2em) Lambda_T equiv lambda_0 #h(-1em) (alpha + 1 / n frac(d n, d T)) \, $ where $alpha$ is the linear thermal expansion coefficient and $d n \/ d T$ is silicon's thermo-optic coefficient (values in Supplementary Table~@tab:parameters). The TRN-limited wavelength-noise PSD @levin_fluctuationdissipation_2008@PhysRevX.10.041046 is therefore $ S_(lambda \, upright(T R N)) \( f \) = Lambda_T^2 S_T \( f \) = Lambda_T^2 frac(4 k_B T_0^2 R_(t h), 1 + \( 2 pi f tau_(t h) \)^2) . $

In the low-frequency limit this approaches a white floor $ sqrt(S_(lambda \, upright(T R N)) \( 0 \)) = Lambda_T sqrt(4 k_B T_0^2 R_(t h)) \, $<eq:TRN_floor> set by the thermodynamics of the pixel. Evaluating Eq.~@eq:TRN_floor with the device parameters (Supplementary Table~@tab:parameters and Sec.~#ref(label("sec:heat capacity"))) gives the TRN floor quoted in the main text, $ sqrt(S_(lambda \, upright(T R N))) approx 0.064 med upright(f m thin H z^(- 1 \/ 2)) . $ This is well below the measured electronics-limited plateau, confirming that the present readout masks the resonator's fundamental limit. Further improvements in device engineering could reduce this gap, additional discussion is provided in Section~#ref(label("sec:perf scaling")).

= Calibration robustness and performance scaling
#label("sec:perf scaling")
== Rationale and conventions
#label("subsec:perf scaling - rationale")
In the main text we calibrated and characterized the homodyne readout at moderate local-oscillator (LO) power to maintain a clean derivative-of-Lorentzian calibration curve; at higher LO powers, weak back-reflections made the lineshape determination less reliable. Here we analyze how improvements to the photonic-crystal cavity. Specifically, higher optical quality factor $Q$ and higher collection (zero-order) efficiency $eta$, the fraction of input power coherently collected into the detected mode affect (i) the transduction gain $S$, (ii) the input-referred readout noise (electronics- and shot-noise floors), and (iii) the feasibility of operating at the TRN limit.

We adopt the single-pole cavity model measured in reflection at the quadrature lock point, use one-sided PSDs, and report ASDs in $upright(f m) \/ sqrt(upright(H z))$. Throughout, $P_(upright(i n))$ denotes the optical power delivered to the device, and $P_(upright(s i g)) = eta P_(upright(i n))$ the collected signal power.

== Homodyne transduction: slope vs. device parameters
#label("subsec:perf scaling - device param")
Near the operating point the balanced-homodyne output is linear in wavelength, $ v approx v_0 + S thin delta lambda \, #h(2em) upright("(slope ") S upright(" in V/nm).") $

For a single-port cavity probed in reflection and read out at the quadrature point, the difference current is $ i_h approx 2 thin cal(R) thin sqrt(P_(upright(L O)) P_(upright(s i g))) thin sin phi \, $ where $cal(R)$ is the photodiode responsivity (A/W), $P_(upright(L O))$ is the LO power at the detector, $P_(upright(s i g)) = eta P_(upright(i n))$ is the collected signal power, and $phi$ is the signal-field phase relative to the LO at the detection port.

Linearizing at quadrature ($sin phi tilde.eq phi$) and converting current to voltage with the transimpedance $R_(upright(T I A))$ gives the calibration slope $ S #h(0em) = #h(0em) frac(d v, d lambda) = 2 thin cal(R) thin R_(upright(T I A)) thin sqrt(P_(upright(L O)) eta P_(upright(i n))) lr(|frac(d phi, d lambda)|) . $<eq:S_supp>

For a single-pole resonance the phase derivative at the optimum lock point is proportional to $Q \/ lambda_0$, up to an order-unity lineshape factor $zeta$ (accounting for exact coupling and lock point): $ lr(|frac(d phi, d lambda)|) = zeta thin frac(2 Q, lambda_0) \, #h(2em) 0 < zeta lt.eq 1 . $<eq:phase_slope_supp>

Collecting constants into $kappa_0 equiv 4 zeta thin cal(R) R_(upright(T I A))$, we obtain the following scaling $ S = kappa_0 Q/lambda_0 sqrt(eta P_("in") P_("LO"))
     quad arrow.r.double quad S prop Q eta^(1/2) . $ <eq:S_scaling_supp>
Here $P_("in")$, $P_("LO")$, and the electronics are held fixed.

This shows that a higher-$Q$ cavity produces a steeper phase response per nanometer, and better collection increases the interferometric signal: both raise the transduction gain $S$.

== Input-referred readout noise - closed forms
#label("subsec:perf scaling - readout noise")
Noise is reported in wavelength units by referring the measured voltage PSD $S_v$ through the local slope (see #ref(label("subsec:noise - calibration"))): $ S_lambda #h(0em) = #h(0em) S_v / S^2 \, #h(2em) upright("hence") #h(2em) sqrt(S_lambda) #h(0em) = #h(0em) frac(sqrt(S_v), \| S \|) . $<eq:refer_rule>

#emph[Electronics-limited floor.] Let $sqrt(S_(v \, upright(e l e c)))$ be the detector/TIA voltage ASD (intrinsic to the electronics). Referring to wavelength, $ sqrt(S_(lambda \, upright(e l e c))) = sqrt(S_(v \, upright(e l e c))) / S = frac(lambda_0, Q thin sqrt(eta P_(upright(i n)))) #h(0em) underbrace(frac(sqrt(S_(v \, upright(e l e c))), kappa_0 thin sqrt(P_(upright(L O)))), C_(upright(e l e c))) $<eq:elec_floor_s53> So increasing $Q$ and $eta$ lowers the equivalent input electronics floor via a larger slope $S$. \
#emph[Shot-noise-limited floor.] The ouput shot noise is $sqrt(S_(v \, upright(s h o t))) = R_(upright(T I A)) sqrt(2 q thin cal(R) thin P_(upright(L O)))$. Referring to wavelength and substituting $S$ cancels the LO-dependence: $ sqrt(S_(lambda \, upright(s h o t))) = frac(R_(upright(T I A)) sqrt(2 q thin cal(R) thin P_(upright(L O))), S) = frac(lambda_0, Q thin sqrt(eta P_(upright(i n)))) #h(0em) underbrace(frac(sqrt(2 q \/ cal(R)), 2 zeta), C_(upright(s h o t))) . $<eq:shot_floor_s53> Once shot-noise limited, only $Q$ and $eta$ (and $P_(upright(i n))$) lower the input-referred shot floor. \
#emph[Total readout floor.] It is convenient to collect contributions as $ sqrt(S_(lambda \, upright(r e a d o u t))) = frac(lambda_0, Q thin sqrt(eta P_(upright(i n)))) #h(0em) #scale(x: 180%, y: 180%)[\(] C_(upright(e l e c))^2 + C_(upright(s h o t))^2 + C_(upright(t e c h))^2 #scale(x: 180%, y: 180%)[\)]^(1 \/ 2) $<eq:readout_master_s53> where $C_(upright(t e c h))$ accounts for any residual LO technical noise that is not perfectly common-mode rejected. Equation #ref(label("eq:readout_master_s53")) explicitly identifies the governing design parameters. An increase in either the cavity quality factor $Q$ or the collection efficiency $eta$ reduces the equivalent input noise in proportion to $1 \/ \( Q sqrt(eta) \)$, thereby improving the overall readout sensitivity.

== Condition for operating at the TRN limit
#label("subsec:perf scaling - condition for TRN limit")
The TRN floor is determined by the device's thermodynamics and thermo-optic coupling (#ref(label("subsec:noise - TRN limit"))) and does not depend on $Q$ or $eta$. Operating at the TRN limit requires $ sqrt(S_(lambda \, upright(r e a d o u t))) #h(0em) lt.eq #h(0em) sqrt(S_(lambda \, upright(T R N))) . $<eq:TRN_inequality>

Substituting Eq.~#ref(label("eq:readout_master_s53")) into #ref(label("eq:TRN_inequality")) yields the following sufficiency condition: $ Q thin sqrt(eta) #h(0em) gt.eq #h(0em) lambda_0 / sqrt(P_(upright(i n))) thin frac(#scale(x: 120%, y: 120%)[\(] C_(upright(e l e c))^2 + C_(upright(s h o t))^2 + C_(upright(t e c h))^2 #scale(x: 120%, y: 120%)[\)]^(1 \/ 2), sqrt(S_(lambda \, upright(T R N)))) . $<eq:TRN_condition_formal>

With the present device, the measured white plateau is $1.2 med upright(f m) \/ sqrt(upright(H z))$, whereas the calculated TRN limit is $0.064 med upright(f m) \/ sqrt(upright(H z))$, corresponding to a gap of approximately $19 times$ in amplitude. Because $sqrt(S_(lambda \, upright(r e a d o u t))) prop 1 \/ \( Q sqrt(eta) \)$, any combination of design improvements that increases $Q sqrt(eta)$ by roughly a factor of~19 (or equivalently reduces $C_(upright(e l e c))$ by the same factor) is sufficient to reach the TRN floor. Beyond this point, further increases in $Q$ or $eta$ do not lower the measured noise, and the spectrum saturates at the TRN level unless the material or thermal parameters of the device are altered @PhysRevX.10.041046, showing one more interesting avenue to explore. \
Moreover, since we saw that $S prop Q eta^(1 \/ 2) sqrt(P_(L O))$, improving these device metrics also enables to reach the same calibration precision as the one used in the main text with much lower LO power. This would directly erase the back-reflection sensitivity that motivated moderate-LO operation.

#figure(
  table(
    columns: 4,
    align: (left,left,center,left,),
    table.header([#strong[Symbol]], [#strong[Quantity]], [#strong[Value]], [#strong[Reference / Source]],),
    table.hline(),
    [$T_0$], [Ambient temperature], [$295 med upright(K)$], [Experimental condition],
    [$rho_(upright(S i))$], [Silicon mass density], [$2330 med upright(k g thin m^(- 3))$], [@arblaster_selected_2018],
    [$c_(p \, upright(S i))$], [Silicon specific heat capacity], [$700 med upright(J thin k g^(- 1) thin K^(- 1))$], [@chase_nist-janaf_1998],
    [$alpha_(upright(S i))$], [Silicon linear thermal expansion coeff.], [$2.6 times 10^(- 6) med upright(K^(- 1))$], [@swenson_recommended_1983],
    [$n_(upright(S i))$], [Silicon refractive index], [$3.48$], [@komma_thermo-optic_2012],
    [$frac(d n, d T)\|_(upright(S i) \, thin 1550 thin upright(n m))$], [Silicon thermo-optic coefficient], [$1.86 times 10^(- 4) med upright(K^(- 1))$], [@komma_thermo-optic_2012],
    [$rho_(upright(p c))$], [Pyrolytic-carbon mass density], [$1.90 times 10^3 med upright(k g thin m^(- 3))$], [@pierson_handbook_1993],
    [$c_(p \, upright(p c))$], [Pyrolytic-carbon specific heat capacity], [$710 med upright(J thin k g^(- 1) thin K^(- 1))$], [@chase_nist-janaf_1998],
    [$A_(upright(S i))$], [Silicon membrane area], [$23 med mu upright(m) times 16 med mu upright(m)$], [Device design],
    [$t_(upright(S i))$], [Silicon membrane thickness], [$220 med upright(n m)$], [Process specification],
    [$r_(upright(p i l l a r))$], [Pillar radius], [$1.5 med mu upright(m)$], [SEM estimation],
    [$h_(upright(p i l l a r))$], [Pillar height], [$3 med mu upright(m)$], [SEM estimation],
    [$N_(upright(p i l l a r))$], [Number of pillars], [$6$], [Device layout],
    [$lambda_0$], [Cavity resonance wavelength], [$1568.83 med upright(n m)$], [Measured (this work)],
    [$Q$], [Cavity quality factor], [$3.9 times 10^4$], [Measured (this work)],
    [$R_(upright(t h))$], [Effective thermal resistance (device)], [$1.08 times 10^5 med upright(K thin W^(- 1))$], [Measured (this work)],
  ),
  caption: [Nomenclature and parameter summary]
  , kind: table
) <tab:parameters>
