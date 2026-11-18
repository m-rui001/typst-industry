#import "layout.typ": manuscript, panels, panel
#import "flow.typ": fit-flow

#manuscript("A Novel Iterative-Fitting Approach for the Thermal Characterization of Thin Fibers", ("William Spirnock", "Alison Hake", "Dihui Wang", "Timothy Sullivan", "Dana He", "Heng Ban"), [
The transient electrothermal technique (TET) is widely valued for its simple implementation and versatility in measuring the thermal properties of thin fibers and films. Its accuracy, however, degrades sharply when environmental radiation losses are non-negligible and the surface emissivity is unknown. These conditions are difficult to avoid at the micro-scale, and conventional TET analyses either neglect them or address them through separate measurements that are prone to sequential errors. In this work, a novel implementation of the TET has been developed that determines multiple thermal properties together with the effective surface emissivity from only two transient measurements. An analytical model incorporating thermal radiation and variable heat generation drives a sensitivity-guided, multi-parameter fitting routine, which extracts thermal conductivity and thermal diffusivity from one form of the temperature solution and thermal conductivity and volumetric heat capacity from another. An iterative curve-fitting procedure then recovers the intrinsic properties free of environmental error while requiring a reduced sampling size, significantly minimizing the time to obtain accurate thermal property information. As a verification, an amorphous silicon dioxide (SiO2) optical fiber and a Hi-Nicalon Type S silicon carbide (SiC) fiber were measured, with results agreeing with literature values to within an average error on the order of 10% across all tested samples. An extensive uncertainty analysis and a numerical uncertainty study were performed to quantify measurement variability and link it to sample geometry selection. This work establishes a TET scheme that, for the first time, simultaneously resolves multiple intrinsic thermal properties, efficiently corrects for environmental radiation errors, and provides quantitative guidance for sample geometry selection.
], [
Thermal Conductivity, Thermal diffusivity, Volumetric Heat Capacity, Sensitivity Analysis, Microscale, Electrothermal Technique
])[
= Introduction
<introduction>
The improved mechanical and thermal performance of advanced micro- to nanoscale fibers such as carbon fibers/nanotubes @moon_note_2012, polyacrylonitrile wires @guo_transient_2007, ultra high molecular weight polyethylene fibers (UHMWPE) @liu_thermal_2015@zhu_novel_2017, etc play crucial roles in existing and future applications regarding strength and thermal management. However, various difficulties arise when measuring the thermal properties due to difficult sample preparation and environmental sources of error. Additionally, in the case of thin fibers, certain parameters such as volumetric heat capacity can be difficult to determine accurately. This requires the use of conventional methods like differential scanning calorimetry (DSC) which can be time consuming and is very sensitive to sample preparation for complex fiber specimens. To address these limitations, many thermal property measurement methods have been developed specifically for thin fiber geometries. Zhang et al. attached a carbon fiber between a heat sink and hot wire and determined the thermal conductivity by comparing the experimental data to a thermal model @zhang_measurements_nodate. Xing et al. extended the 3$omega$ method to a thin fiber @xing_thermal_2014@xing_thermal_2017. Moon et al. suspended metallic films and microfibers between two electrodes where the steady state electrical resistance is related to the thermal conductivity @moon_note_2012@volklein_method_1984@lee_ultrahigh_2022. Similarly, Guo @guo_thermal_2007 and Xing @xing_thermal_2014_3omega developed multiple versions of TET to measure the thermal conductivity and diffusivity of various materials. While some of the shortcomings surrounding thin fiber characterization have been addressed through these advancements, most of these methods are still limited in the properties that can be determined. The methods that do have more thermal property information information available tend to be time consuming and prone to experimental failures.

TET is a powerful method with many advantages over other such techniques, having been demonstrated to accurately determine the axial thermal conductivity and diffusivity of both electrically conductive and non conductive thin fibers @guo_thermal_2007@xing_thermophysical_2014. Compared to other methods like $3 omega$, the measurement time is very short with a maximum of several minutes for a single test depending on the sample thermal properties and geometry @munro_thermal_2016. This method operates on the principle of Joule heating, in which a sample (with a metallic coating in the case of an electrically non conductive material) is supplied with an electrical current sufficiently large to heat the thin fiber suspended between two electrodes. The average temperature change is measured as a voltage drop across the sample and through nonlinear least squares curve fitting, a thermal model can be used to extract the thermal properties.

In previous work regarding TET, two formulations are applied, which have been termed the reduced model @guo_thermal_2007 and the full model @xing_analysis_2013. The reduced model utilizes the one-dimensional transient heat conduction equation with volumetric heat generation and assumes the effects of thermal radiation and convection are negligible. This resulted in high accuracy when measuring samples with either a low surface emissivity such as platinum @xing_thermophysical_2014, or samples with a small length. However, testing a very short fiber leads to several complications. Experimental difficulties arise from the sample prep process when affixing the sample to the electrodes using silver paste. Encroachment of paste over the fiber reduces fitting accuracy with a more noticeable effect as fiber length decreases @xing_thermal_2014. Additionally, a smaller fiber length also reduces electrical and thermal resistance. A sufficiently small resistance allows thermal and electrical contact resistance and the paste's inherent resistance to dominate. Follow-up work detailed a revision to the reduced model which incorporated radial convective and radiation heat losses @xing_analysis_2013. This demonstrated that the error in the measured thermal properties due to thermal radiation is proportional to the square of the length divided by the diameter @munro_thermal_2016. This error correction had three different implementations, one of which involved a simple additive term representing the thermal radiation effect @xing_thermophysical_2014@xing_analysis_2013. However, this can only be used in the case of a known surface emissivity. An alternative is the measurement and fitting of multiple samples having different lengths and employment of a linear regression to determine the intrinsic thermal diffusivity and conductivity @liu_characterization_2014@liu_thermally_2014@xu_energy_2014. A third uses a temperature solution derived from the governing equation which incorporates radiation. In this version, various samples of different lengths (i.e. different thermal radiation magnitudes) are tested and used to fit for either the thermal diffusivity and emissivity or conductivity and emissivity simultaneously. Although this version more effectively accounts for radiation and nonconstant heating outside of an approximated linear regime, the uncertainty is larger than that of the reduced model @munro_thermal_2016 and the thermal diffusivity is reliant on the fit value of conductivity @xing_thermal_2017. This results in sequential fitting inaccuracies which further propagates error and uncertainty. Additionally, each of the full model implementations requires a large sampling size to confidently determine the intrinsic thermal properties. For non-conductive fibers, a large sample size is compounded with the weeks-long annealing process, which often results in further coating and annealing trials.

Multi-parameter fitting has been widely incorporated into various thermal characterization methods for both bulk and thin fiber geometries. These include frequency domain thermoreflectance (FDTR) @feser_pump-probe_2014@jiang_new_2022@tang_anisotropic_2021@rodin_simultaneous_2017@schmidt_frequency-domain_2009, infrared (IR) thermometry @wang_three-dimensional_2025@wang_spatially_2024@sheikh_comparison_2024@hamaoui_spatially_2020@corona_recent_2023@sheikh_photothermal_2025, and the 3$omega$ method @xing_thermal_2014@xing_thermal_2017. Fitting several parameters at once is advantageous in that it avoids propagation of uncertainties by analyzing how the sensitivities of each parameter relate and determine the range of data points best suited for low uncertainty thermal property evaluation. This procedure is more common in the case of bulk materials and has been successfully implemented by Xing et al. in the case of a thin fiber using the same setup as in TET @xing_thermal_2014. Although Feng et al. demonstrated the potential for multi-parameter fitting with TET @feng_simultaneous_2009 for measuring specific heat and conductivity, this work preceded development of the full model and so had various limitations. Rather than using an exact temperature solution, Feng et al. relied on a numerical model which is largely dependent on the differencing method used and is more susceptible to roundoff errors. Lastly, the authors also did not consider the effects of radiation in the model and did not firmly establish parameter identifiability.

In this work, a novel temperature solution of the TET full model is derived which relates the change in voltage with respect to time for two different sets of thermal properties. A sensitivity analysis was employed to explore the potential for two multi-parameter fitting schemes that can eliminate the propagation of error present in former work. This analysis uncovered a tradeoff between two properties which led to the implementation of a novel methodology for extracting the thermal radiation effect when the surface emissivity is unknown. The new methodology is demonstrated on two electrically non-conductive standard samples. All obtained results are in good agreement with existing literature values. Additionally, an uncertainty analysis is performed which reports an improvement from previous full model implementations. An uncertainty numerical study is also performed to guide future work regarding proper geometry selection for minimizing uncertainty of the fit thermal properties.

= Experimental Section
<experimental-section>
== Sample materials and preparation
<sample-materials-and-preparation>
The working principle of TET with regard to sample prep and data collection is well established @liu_characterization_2014@guo_thermal_2007@xing_thermal_2014@xing_thermophysical_2014 and will be briefly described in this and the following section. Two materials are measured in this work to provide validation for the improved methodology: pure silica optical fiber with a diameter ranging from 122-130$mu$m and HI Nicalon Type S SiC fiber with a diameter range of 10-15$mu$m. These were selected because they demonstrate the range of TET as spanning two orders of magnitude. As both materials are electrically insulating, several experimental steps were required prior to testing. The pure silica core single-mode optical fibers were obtained from Thorlabs and had an external coating of acrylate which was burned off. The fibers where then cleaned using isopropyl alcohol. The SiC fiber did not undergo the same cleaning to avoid potential surface alteration which could change the measured thermal properties. The fibers were cut to length and suspended between two copper electrodes and fixed at each end with an electrically conductive silver epoxy. A thin layer of gold (10-40 nm) is deposited via sputter coating on the various samples to induce an electrical resistance across the suspended fibers. The post-deposition surface quality and fiber diameter is determined via a Zeiss Sigma500 VP scanning electron microscope (SEM) and the fiber length is measured using a Keyence VHX 7000N microscope. Since the thermal model is sensitive to electrical resistance, the coated samples were placed inside of a furnace and annealed at 100$""^compose$C for seven days to ensure resistance stabilization prior to testing @xing_thermophysical_2014.

== Experimental setup
<experimental-setup>
A multi-component system was assembled to perform TET measurements and is shown in Figure #ref(<fig:TET_exp_setup>, supplement: none). A Janis ST-100 cryostat is used to house the fiber sample in a vacuum controlled environment. An Agilent Varian TPS-Compact Dry 74FS Turbomolecular Pump is responsible for evacuating the chamber. A LakeShore 335 Temperature Controller is used to moderate the temperature within the chamber. The current across the sample is set by a Keithley DC and AC Current Source and the voltage is measured using a Keithely 3706 Multimeter and Data Acquisition System. Communication of these components is through an instrument control code written in MATLAB. This code performs measurements for the resistance-temperature calibration and for the transient voltage measurements.

#figure(image("source/Images/TET_Exp_Setup.png", width: 100.0%),
  caption: [
    Schematic diagram of the TET configuration.
  ]
)
<fig:TET_exp_setup>

In this system, the fiber sample is placed inside of a cryostat and is pumped down to a pressure at which convection is negligible ($lt.eq thin 0.001 thin P a$) @xing_thermal_2014. To determine desired properties using the thermal model, a calibration must first be performed to relate resistance/voltage change to a change in temperature. For this calibration, a K-type thermocouple is fixed onto the surface of the copper block close to the fiber sample using the silver paste. The LakeShore 335 Temperature Controller holds the temperature at various set points (eight in total) at which the resistance and temperature are recorded simultaneously by the Keithley 3706 Multimeter. Note that this experiment requires a non-heating current to be used for the resistance measurement. The temperature coefficient of resistance ($eta$ in this work) was calculated from the slope of the resistance-temperature (R-T) curve @munro_thermal_2016. The R-T plots can be seen in the supplementary materials document. This process must be performed for each sample, regardless if the material type is unchanged, to account for defects and variations in coating thickness. Once the calibration is complete, a step current is applied across the sample which results in a temperature rise due to joule heating. This response is measured as a transient voltage drop across the sample. This current must be carefully selected to avoid significant contributions from nonconstant heating @xing_thermophysical_2014. Small heat losses are approximated by the thermal model but nonlinearities arise at high temperatures. It was found that $Delta T_(f i b e r) = 5 K$ resulted in an acceptable signal to noise ratio and did not have noticeable variable heating losses. The temperature was determined from the previously mentioned calibration process.

== Theory
<theory>
Figure #ref(<fig:TET_sample>, supplement: none) shows a close-up of the TET sample. The fiber is suspended between two electrodes and attached to each end by thermal paste to reduce thermal/electrical contact resistance between the sample and heat sink. The system can be modeled as a one-dimensional heat equation with volumetric heat generation assuming $L / D > > 10$, making any radial temperature gradients negligible @xing_analysis_2013.

#figure(image("source/Images/TET_sample_mine.png", width: 90.0%),
  caption: [
    Illustration of the TET sample placed inside of the vacuum chamber for testing.
  ]
)
<fig:TET_sample>

However, to reduce propagation of errors due to sequential parameter fitting and to expand upon the properties that can be determined using TET, the governing equation in @xing_analysis_2013 is used to derive an alternate temperature solution. The transient one-dimensional heat conduction equation for the TET method is written as:

$ 1 / alpha frac(partial T \( x \, t \), partial t) = frac(partial^2 T \( x \, t \), partial x^2) - H_e^2 thin \[ T \( x \, t \) - T_0 \] + q''' / k $<eq:TET_gov_eqn>

In Equation #ref(<eq:TET_gov_eqn>, supplement: none), $q''' = frac(I V_0, V_s)$ represents the volumetric heat generation term where $I$ is the current, $V_0$ is the initial voltage, and $V_s = frac(pi D^2 L, 4)$ is the volume of the fiber, where $L$ and $D$ are the fiber length and diameter, respectively. The thermal diffusivity is represented by $alpha$ and the thermal conductivity by $k$. The term $H_e^2 = frac(\( h_c + h_r \) A_l - eta V_0 I, k V_s)$ is the effective heat transfer coefficient which accounts for heat losses from the surface of the fiber and from temperature dependent resistance change of the sample and coating. Since the experiment takes place in vacuum, convection is negligible ($h_c = 0$). Assuming a gray body, and small change in fiber temperature during the experiment, the radiation heat transfer is linearized using a Taylor expansion to obtain $h_r approx 4 epsilon.alt sigma T_0^3$. The emissivity is represented by $epsilon.alt$, $T_0$ is the sample initial temperature, and $sigma = 5.67 * 10^(- 8) W thin m^(- 2) thin K^(- 4)$ is the Stefan-Boltzman constant.

Assuming constant temperature boundary conditions due to the heat sinks, the temperature solution is determined by applying Green's function general solution approach for a one-dimensional nonhomogeneous heat equation @book to arrive at the spatially dependent and transient full model TET solution which involves heat losses via radiation and nonconstant heating.

$ theta \( x \, t \) = frac(4 alpha q''', L k) sum_(m = 1)^oo frac(1 - e^(- alpha (lambda_m^2 + H_e^2) t), alpha (lambda_m^2 + H_e^2) lambda_m) sin \( lambda_m x \) $<eq:TET_temp_soln>

where $lambda_m^2 = frac(\( 2 m - 1 \)^2 pi^2, L^2)$ and $theta \( x \, t \) = T \( x \, t \) - T_0$. However, since the signal is read from the heat sinks, the system response is the spatially averaged temperature across the fiber. This temperature is measured as a voltage drop across the sample. The temperature can be converted to voltage through established resistance-temperature correlations to arrive at the alternate solution for the TET full model.

$ Delta V \( t \) = frac(8 eta I V_0^2 L^2, k V_s) sum_(m = 1)^oo frac(1 - exp #h(-1em) (- frac((\( 2 m - 1 \)^2 pi^2 - L^2 H_e^2) Gamma_(1 \, 2) t, L^2)), \( 2 m - 1 \)^4 pi^4 - L^2 H_e^2 \( 2 m - 1 \)^2 pi^2) $<eq:TET_volt>

Equation #ref(<eq:TET_volt>, supplement: none) differs from previous TET approaches @xing_analysis_2013, in which thermal conductivity is first estimated from the steady-state resistance and thermal diffusivity is subsequently obtained by fitting the normalized transient voltage. Because the diffusivity fit depends on the previously determined conductivity, uncertainty in the conductivity measurement may propagate into the resulting diffusivity. In the present formulation, thermal conductivity is instead fit simultaneously with either volumetric heat capacity or thermal diffusivity using the complete voltage response, allowing the covariance and uncertainty associated with the fitted parameters to be evaluated directly.

Two alternative formulations of the transient term are therefore considered. In the first, the transient decay parameter is written as $Gamma_1 = k \/ \( rho C_p \)$, such that thermal conductivity and volumetric heat capacity are treated as independent fitting parameters. In the second, it is written as $Gamma_2 = alpha$, and thermal conductivity and thermal diffusivity are fit directly. Although $alpha = k \/ \( rho C_p \)$, these two fitting schemes are not necessarily equivalent from a parameter-estimation perspective. Thermal conductivity does not appear only through the diffusivity relation; it also enters independently at multiple locations within both the transient and steady-state components of Equation #ref(<eq:TET_volt>, supplement: none). Consequently, substituting $k \/ \( rho C_p \)$ for $alpha$ changes the sensitivities, correlations, and uncertainty structure of the fitted parameters. This work compares the accuracy and uncertainty of both implementations to clarify these parameter relationships and determine whether fitting $\( k \, rho C_p \)$ or $\( k \, alpha \)$ is more suitable for the thermal characterization of thin fibers. Throughout this document, the two formulations for fitting $\( k \, rho C_p \)$ and $\( k \, alpha \)$ will be referred to as the $Gamma_1$ and $Gamma_2$ fitting schemes, respectively.

= Results and discussion
<results-and-discussion>
== Parameter identifiability
<parameter-identifiability>
A sensitivity analysis was performed to evaluate the influence of each fitting parameter on the transient voltage response and to assess the potential for multi-parameter fitting. The sensitivity is defined as @tang_anisotropic_2021

$ S_(x_u) = frac(partial ln \( Delta V \), partial ln \( x_u \)) $

where $Delta V$ is the measured transient voltage response and $x_u$ is the perturbed parameter. In this work, the parameters of interest are $k$, $rho C_p$, $alpha$, and $epsilon.alt$. The inclusion of $rho C_p$ follows from the $Gamma_1 = k \/ \( rho C_p \)$ fitting scheme, while $alpha$ is considered in the $Gamma_2 = alpha$ scheme. Other quantities, including $L$, $I$, $V_0$, $D$, $eta$, and $T_0$, also affect the voltage response; however, these are treated as measured inputs rather than fitted parameters.

Previous TET studies have shown that radiation losses can be represented by the dimensionless parameter $xi = frac(16 epsilon.alt sigma T_0^3 L^2, k D)$, which increases with sample length and affects the accuracy of reduced-model fitting @xing_analysis_2013@munro_thermal_2016. Therefore, the effect of sample length on parameter sensitivity was examined using our novel full-model formulation.

Sensitivity calculations were first performed for a standard $S i O_2$ fiber using two sample lengths, $5 thin upright(m m)$ and $25 thin upright(m m)$, representing the lower and upper practical limits of the experimental system. The manufacturer-reported diameter of $124.5 thin mu upright(m)$ was used, along with an effective emissivity of 0.5 and a calibrated temperature coefficient of resistance of $1.38 times 10^(- 3) thin upright(K)^(- 1)$. The current was selected to be near zero to eliminate variable heating effects to isolate the impact of thermal radiation while maintaining an adequate signal-to-noise ratio.

#figure([#panels(3,
  panel("source/Images/Sens_Gamma1_others_silica.jpg", "a"),
  panel("source/Images/Sens_Gamma1_silica.jpg", "b"),
  panel("source/Images/Sens_Gamma2_silica.jpg", "c"),
)

  ],
  caption: [
    Line plots for the $S i O_2$ (a) sensitivity to the measured inputs, (b) sensitivities for the $Gamma_1$ scheme, and (c) sensitivities for the $Gamma_2$ scheme.
  ]
)
<fig:2D-sens-plots-silica>

The sensitivity of the measured inputs were found to have no dependence on the radiation effect as shown in Figure #ref(<fig:2D-sens-plots-silica>, supplement: none)#text("a"). That is, the trends and magnitudes remain unchanged from the shorter and longer sample. We also see that other than length, these parameters are nearly constant over the measurement time, meaning they have a fixed impact at any given point in time. The sensitivities for the thermal properties are also plotted for both sample lengths with their trends showing that the fitted parameters have distinct effects on the transient response, indicating that simultaneous fitting is potentially feasible. Unlike the measured inputs, there is more variation in the parameter sensitivities at different radiation magnitudes for both fitting schemes. The sensitivities of $rho C_p$ and $alpha$ are merely shifted with increased $xi$, while the sensitivity to $k$ moves toward zero in both Figure #ref(<fig:2D-sens-plots-silica>, supplement: none)#text("b") and Figure #ref(<fig:2D-sens-plots-silica>, supplement: none)#text("c"). The sensitivities to $k$ and $epsilon.alt$ also exhibit a tradeoff between the low and high radiation samples with regard to their magnitudes. Furthermore, for small $xi$, the $Gamma_1$ scheme shows greater variation in sensitivity to $k$ for the change in time as opposed to $Gamma_2$ which is relatively fixed over time as in the case of the measured inputs. At early times the sensitivities vary in magnitude from $S_(rho C_p) approx - 1$ and $S_k approx 0$. In this range, the transient response is highly sensitive to $rho C p$ and less sensitive to $k$. However, at later times, their values approach $S_k approx - 0.84$ and $S_(rho C_p) approx 0$, meaning there is a reduced sensitivity to $rho C p$ and a dominant effect from $k$. The sensitivity overlap in the intermediate time range demonstrates the complex relationship of these two parameters which extends beyond the simple relationship defined by thermal diffusivity. For $Gamma_2$, we see a slightly different relationship between $alpha$ and $k$. At early times, the sensitivities vary from $S_alpha approx 1$ and $S_k approx - 1$. They share nearly the same sensitivity magnitudes for the initial transient until they begin to approach $S_alpha approx 0$ and $S_k approx - 0.84$. Unlike in $Gamma_1$, the sensitivity to conductivity does not reduce to zero and shows less variation in $S_k$ overall. However, for the majority of the transient region, there is a clear separation in the magnitude of $S_alpha$ and $S_k$, indicating $Gamma_2$ has high potential for multiparameter fitting as well. However, as $xi$ increases, $S_k$ and $S_alpha$ have a mirrored trend about the time axis. The sensitivity vectors become nearly collinear. This indicates that for the $Gamma_2$ scheme, the parameter identifiability is increasingly ill-conditioned as $xi$ becomes larger. Therefore, while $Gamma_2$ may be capable of multi-parameter fitting for low radiation samples, we would expect uncertainty to increase and accuracy to decrease beyond a certain level. This analysis demonstrates the unique behavior of each scheme and suggests that when the approximate magnitude of $xi$ is known, both fitting schemes have similar accuracy and uncertainty. Although across all possible $xi$ values, $rho C_p$ and $k$ may have less parameter coupling and thus could be the safer option.

The same analysis was performed for a $13 thin mu upright(m)$ HI-Nicalon Type-S SiC fiber, where the diameter was determined from SEM measurements.

#figure([#panels(2,
  panel("source/Images/Sens_Gamma1_SiC.jpg", "a"),
  panel("source/Images/Sens_Gamma2_SiC.jpg", "b"),
)

  ],
  caption: [
    Line plots for the $S i C$ (a) sensitivity to the measured inputs, (b) sensitivities for the $Gamma_1$ scheme, and (c) sensitivities for the $Gamma_2$ scheme.
  ]
)
<fig:2D-sens-plots-SiC>

The SiC trends and tradeoffs are nearly identical to silica with the single difference being their time-dependent magnitudes resulting from different thermal properties. Both samples and schemes suggest shorter samples provide greater sensitivity to the thermal properties of interest, while longer samples reduce sensitivity to $k$ and increase sensitivity to $epsilon.alt$ which would increase uncertainty for the $k$ measurement.

The sensitivity plots demonstrate the potential for multi-parameter fitting, however, both schemes show signs of interdependence which can affect fitting accuracy. More specifically, $Gamma_1$ shows a possible linear dependence of $S_k$ and $S_epsilon.alt$ while $Gamma_2$ shows similar trends for $S_alpha$ and $S_k$. As mentioned, this becomes more pronounced at longer lengths and thus larger $xi$ values. Similar concerns have been identified in previous work regarding multi-parameter fitting @tang_anisotropic_2021@jiang_new_2022. Tang et al. and Jiang et al. both demonstrated that upon applying a nonlinear least squares curve-fitting algorithm, the sum of squared errors (SSE) can be plotted with respect to the fitted parameters to visualize the cost landscape.

To identify the SSE trends, a non-linear least squares curve-fitting code was developed in MATLAB based on the Levenberg-Marquardt algorithm. The code was used to generate artificial data in the form of a transient voltage rise. The surface emissivity was assumed to be a known value. After fitting was completed, the SSE was plotted with respect to the property space.

#figure([#panels(3,
  panel("source/Images/pCp_5mm_silica_contour.jpg", "a"),
  panel("source/Images/pCp_25mm_silica_contour.jpg", "b"),
  panel("source/Images/pCp_50mm_silica_contour.jpg", "c"),
)

  ],
  caption: [
    $Gamma_1$ SSE contour plots of $S i O_2$ for (a) 5 mm (b) 25 mm (c) 50 mm
  ]
)
<fig:SSE-plots>

The generated data correspond to a silica sample (as used for the sensitivity analysis) for three different lengths: 5 mm, 25 mm, and 50 mm. The 50 mm length was included to demonstrate the noticeable change in the cost landscape at a significant thermal radiation effect. Figure #ref(<fig:SSE-plots>, supplement: none) demonstrates that a small $xi$ results in a convex shape and thus is well-conditioned for multi-parameter fitting. However, as $xi$ increases, the cost landscape becomes increasingly parabolic with an elongated valley, meaning the thermal properties cannot be untangled without significantly risking accuracy and uncertainty. These results demonstrate that the thermal properties will have higher accuracy and lower uncertainty by testing shorter length samples, corroborating the sensitivity analysis. The SSE results for $Gamma_2$ were similar, with slight variations; the corresponding plots can be found in the supplementary materials document.

These trends also demonstrate why simultaneous fitting is preferable to a sequential approach. In sequential fitting, one property is first determined and then treated as a fixed input when fitting the second property, which can obscure parameter coupling and transfer error directly from the first fit into the second. In contrast, simultaneous fitting allows the coupled influence of the parameters to appear directly in the SSE landscape and covariance matrix. Therefore, the interdependence is not eliminated, but it can be quantified and used to assess when the fitted parameters can be resolved reliably.

== Iterative approach for thermal radiation error correction
<iterative-approach-for-thermal-radiation-error-correction>
The ability to fit multiple parameters simultaneously has been established for shorter length fiber samples. However, in most cases, the emissivity is a parameter with non-negligible impact that must be determined. Recall from Figure #ref(<fig:2D-sens-plots-silica>, supplement: none) and Figure #ref(<fig:2D-sens-plots-SiC>, supplement: none) that a tradeoff exists between $S_k$ and $S_epsilon.alt$ for both $Gamma_1$ and $Gamma_2$. When $xi$ is small, the sensitivity to conductivity is much larger than that of emissivity, and this is reversed as $xi$ increases. This indicates that while a low $xi$ can be used to fit for the thermal properties with reduced error from an unknown emissivity, a large $xi$ can be used to determine emissivity with a reduced impact from unknown thermal properties. Similar methodologies have been employed in previous work. Jiang et al. @jiang_new_2022 capitalized on a sensitivity tradeoff using spatial domain thermoreflectance (SDTR) in which two data sets were used to fit for phase and laser spot size in an iterative curve fitting procedure. Our work adopted a similar approach which is used to determine the thermal properties and the emissivity from only two data sets. In this process, we took advantage of our control in $xi$ by using a short and a long fiber sample to obtain data sets with distinct sensitivities for the three parameters in question. To verify this methodology, a SiC sample was tested for a 4.84 mm and 24.6 mm sample.

#figure(image("source/Images/iter_flow.png", width: 100.0%),
  caption: [
    TET iterative curve fitting procedure
  ]
)
<fig:iter_flow>

Figure #ref(<fig:iter_flow>, supplement: none) describes the process used to determine the three parameters for both fitting schemes. A transient voltage curve is collected for a short and long sample of the same material. First, guessed values for the thermal properties in $Gamma_1$ and $Gamma_2$ are used to fit an initial value for emissivity. This value is then used as a known in the proceeding code which fits for the thermal properties. The initial fit for each of these parameters will be larger or smaller than the real values depending on the initial guess. The fit values for $rho C_p$ or $alpha$ and $k$ are then updated as the known values for the emissivity fitting. This process continues iteratively until a user prescribed convergence criteria is met. The converged values represent the thermal properties unaffected by thermal radiation, i.e. the intrinsic thermal properties. To ensure the iterative process is independent of the initial assumptions for $k$, $rho C_p$, and $alpha$, their magnitudes were varied using various multiples of the literature values. Each alteration resulted in the same magnitudes, with variations only in convergence time.

#figure([#panels(3,
  panel("source/Images/eps_conv.jpg", "a"),
  panel("source/Images/k_pCp_conv.jpg", "b"),
  panel("source/Images/iter_dem.jpg", "c"),
)

  ],
  caption: [
    Iterative TET convergence plots for (a) $epsilon.alt$ (b) $k$ and $rho C_p$ and (c) a plot with artificial data demonstrating how the final fit curve approaches the converged value for each iterative step.
  ]
)
<fig:iter_example>

Figure #ref(<fig:iter_example>, supplement: none) depicts the convergence of the three properties across four itetations for the $Gamma_1$ scheme. There is no significant difference in the convergence trend for $Gamma_2$. Note that the trend plateaus fairly quickly around the third or fourth iteration. Extensive numerical simulations have been performed to determine the accuracy and uncertainty of this approach for various combinations of thermal properties and sample to sample $xi$ ratios and will be discussed in a later section. Also, note the plot shows different initial fit values for the emissivity to again demonstrate the assumed $k$, $rho C p$, and $alpha$ do not impact the final fitting value, but only the time until convergence is achieved. Therefore, a global minimum is being found as opposed to a local minimum. This procedure was used to test various combinations of fit parameters, including those mentioned here. The improved methodology now only requires testing two samples as opposed to ten or more in previous approaches for the TET full model @xing_thermal_2014_3omega@munro_thermal_2016@xing_thermophysical_2014. This novel methodology, based on a multi-parameter fitting approach, can both reduce the time for characterization and provide more overall information compared to previous implementations.

== Experimental validation
<experimental-validation>
Experimental testing was performed to validate this improved methodology. Twelve short and three long samples of $S i O_2$ optical fiber were tested with diameters in the range 122-130 $mu$m. Approximately 20 nm of gold was deposited on each sample. Eight short and three long samples of HI Nicalon Type S SiC fiber were also tested. The SiC fibers had a much smaller diameter in the range of 10-15 $mu$m and so were coated with 40 nm of gold to ensure strong electrical connection. The gold effect of each sample was calculated and found to be negligible. One short sample from both the $S i O_2$ and SiC sets were removed based on Chauvenet's criteria for outliers. Prior to testing, sample annealing was performed to reduce resistance drift for determination of the temperature coefficient of resistance in which the samples were maintained at 100 $""^compose$C for one week. As discussed in previous sections, a resistance temperature calibration was performed to determine $eta$ and this value was then used to select a current for each sample corresponding to an approximate 5 K temperature rise. For each sample, 30 trials were run and the reported value is the average. This was done to better capture the variability of the improved method. These trials were also used to determine the standard deviation, which is required for the parameter uncertainty. Each short sample is fit using three different long samples to demonstrate the regressed values have little dependence on fiber to fiber variations of the longer sample.

#figure([#panels(2,
  panel("source/Images/k_pCp_kmeas_silica.jpg", "a"),
  panel("source/Images/k_pCp_pCpmeas_silica.jpg", "b"),
  panel("source/Images/k_alpha_alphameas_silica.jpg", "c"),
)

  ],
  caption: [
    $S i 0_2$ validation results for (a) $k$ from the $Gamma_1$ fitting scheme, (b) $rho C_p$ from the $Gamma_1$ fitting scheme, (c) $alpha$ from the $Gamma_2$ fitting scheme.
  ]
)
<fig:Si02-results>

Figure #ref(<fig:Si02-results>, supplement: none) shows the results for the $S i O_2$ samples. Note that two samples resulted in approximately 25% error for thermal conductivity, however, it was kept as it did not fall within the range of removal for outliers. Regardless, the majority of the samples tested fall within 15% of literature values for $rho C_p$ and $k$ for the $Gamma_1$ scheme with an average error of 7.66% and 10.52% for $rho C_p$ and $k$, respectively. The average thermal properties across all samples resulted in an error of 3.11% and 1.76% for $rho C_p$ and $k$, respectively. The literature values are reported as $rho C_(p_(l i t)) = 1.65 * 10^6 thin M J m^(- 3) K^(- 1)$, $k_(l i t) = 1.38 thin W m^(- 1) K^(- 1)$, and $alpha_(l i t) = 8.36 * 10^(- 7) thin m^2 s^(- 1)$. The average uncertainty across the tested samples was $U_(rho C_p) = 4.17 %$ and $U_k = 4.56 %$. Detailed information regarding uncertainty for each trial can be found in the supplementary materials document. The $Gamma_2$ scheme returned nearly identical results for thermal conductivity with a higher accuracy for $alpha$ compared to $rho C_p$. The majority of the samples fell within 15% of literature values with an average error of 4.94% for $alpha$ and 10.60% for $k$. The average thermal properties across all samples resulted in an error of 0.91% and 2.31% for $alpha$ and $k$, respectively. The diffusivity had an average uncertainty of $U_alpha = 3.19 %$ and the thermal conductivity had $U_k = 4.61 %$. Again, recall that the fit emissivity is an effective value of the fiber and transducer material and so it cannot be compared to the literature. Rather, it is only used to determine the other parameters in the case of electrically non-conductive materials.

#figure([#panels(2,
  panel("source/Images/k_pCp_kmeas.jpg", "a"),
  panel("source/Images/k_pCp_pCpmeas.jpg", "b"),
  panel("source/Images/k_alpha_alphameas.jpg", "c"),
)

  ],
  caption: [
    SiC validation results for (a) $k$ from the $Gamma_1$ fitting scheme, (b) $rho C_p$ from the $Gamma_1$ fitting scheme, (d) $alpha$ from the $Gamma_2$ fitting scheme.
  ]
)
<fig:SiC-results>

Figure #ref(<fig:SiC-results>, supplement: none) shows the results for the SiC fiber samples. The majority of the samples fall within 16% of the literature values, $rho C_(p_(l i t)) = 2.17 thin M J m^(- 3) K^(- 1)$, $k_(l i t) = 18.4 thin W m^(- 1) K^(- 1)$, $alpha = 8.48 * 10^(- 6) thin m^2 s^(- 1)$ @coi_ceramics_hi-nicalon_type_s. For the $Gamma_1$ scheme, the average error was found to be 12.84% for $rho C_p$ and 10.59% for $k$. The error for the average thermal properties across all samples was found to be 2.66% and 4.55% for $rho C_p$ and $k$, respectively. As was the case for the $S i 0_2$ samples, $alpha$ showed an improved accuracy with an average error of 6.93% for $alpha$ and 10.08% for $k$. The error for the average thermal properties of all samples was 6.93% for $alpha$ and 4.66% for $k$. The average uncertainty was for the $Gamma_1$ scheme found to be $U_(rho C_p) = 11.05 %$, $U_k = 12.77 %$. For the $Gamma_2$ scheme, these values are $U_alpha = 4.44 %$ and $U_k = 12.83 %$. Additional detailed data for each sample is tabulated in the supplementary materials document. Notice that there is a larger uncertainty associated with the SiC fiber when compared to the $S i O_2$ fibers. This is due to the overall higher $xi$ based on the material thermal properties and fiber diameter. The fiber diameter measurement also contributes to this larger uncertainty as the SiC fibers are approximately ten times smaller than the silica fibers. There is some indication a slight $xi$ dependency on error exists which will be investigated in future work. Regardless, these results demonstrate the accuracy of this novel implementation of TET using a reduced sample size. In this case, the results for $S i 0_2$ and $S i C$ demonstrate that for samples with sufficiently low $xi$, the $Gamma_2$ scheme produces more accurate values for the same data set with a lower uncertainty. However, great care must be taken when testing samples to ensure $xi$ is not so large such that the $alpha$ and $k$ parameter coupling affects the fitted results. It still may be the case that the $Gamma_1$ scheme is best used to avoid potential parameter coupling if the thermal radiation effect magnitude is unknown.

#figure([#panels(2,
  panel("source/Images/pCp_pm_plots.png", "a"),
  panel("source/Images/alpha_pm_plots.png", "b"),
)

  ],
  caption: [
    Best fit plots of a selected SiC sample that shows the variation in the temperature solution based on a 20% increase/decrease in the fitted thermal property for the (a) $Gamma_1$ fitting scheme and the (b) $Gamma_2$ fitting scheme)
  ]
)
<fig:SiC-pm-results>

Figure #ref(<fig:SiC-pm-results>, supplement: none) shows data for a selected SiC sample with the best fit line corresponding to the determined thermal properties. Both plots include temperature solutions based on a fit property 20% larger and smaller than the fit result. These curves provide additional insight to parameter sensitivity and the relationship between the two fitting schemes. The differences between Figure #ref(<fig:SiC-pm-results>, supplement: none)#text("a") and Figure #ref(<fig:SiC-pm-results>, supplement: none)#text("b") visually confirm that regardless of the diffusivity relationship, $Gamma_1$ and $Gamma_2$ are distinct in terms of parameter estimation. Although both schemes demonstrate overlap in the sensitivity of the two fitting parameters, Figure #ref(<fig:SiC-pm-results>, supplement: none)#text("b") shows a larger dependence on the thermal conductivity at earlier times compared to Figure #ref(<fig:SiC-pm-results>, supplement: none)#text("b"). This indicates that the thermal conductivity magnitude will have a larger effect on the fit diffusivity which will also present itself as increased parameter coupling. This effect becomes more pronounced at large $xi$ which results in differences in the parameter uncertainty relationships between the two schemes as detailed in the next section.

== Uncertainty numerical study
<uncertainty-numerical-study>
As mentioned in previous sections, the relationship between $xi$ and parameter identifiability has implications on the fitting uncertainty. And, with direct control of the length to alter $xi$, the experiment can be tuned to obtain a low uncertainty while mitigating other sources of error arising at small lengths. Since $xi$ and uncertainty are linked, we performed two uncertainty studies using the established formalism.

#figure([#panels(2,
  panel("source/Images/pCp_and_k_uncertainty.jpg", "a"),
  panel("source/Images/alpha_and_k_uncertainty.jpg", "b"),
)

  ],
  caption: [
    Multi-parameter uncertainty numerical study results for (a) $Gamma_1$ and (b) $Gamma_2$.
  ]
)
<fig:uncert-num-study>

The first study characterizes how uncertainty varies for the fit properties in both fitting schemes when emissivity is known or negligibly small. The variables governing the transient voltage rise in Equation #ref(<eq:TET_gov_eqn>, supplement: none) were randomized within a representative range of materials tested by TET. The only fixed variables were the temperature coefficient of resistance and the sample initial temperature. Artificial transient data was generated across 1000 trials and noise was added to better represent experimental data. The generated data for each trial was curve fit and plotted against $xi$. Each trial had their initial guesses randomly selected to ensure any parameter degeneracies were apparent in the data. Note that the control parameter uncertainties are the same as in the formalism, except for diameter. For this study we selected the diameter uncertainty to be 3.34%, an average of the $S i O_2$ and SiC uncertainties. Figure #ref(<fig:uncert-num-study>, supplement: none) illustrates the differences between the fitting schemes. $Gamma_1$ demonstrates a significant dependence of uncertainty for conductivity on $xi$ with negligible effect on volumetric heat capacity. This is consistent with the sensitivity analysis in Figure #ref(<fig:2D-sens-plots-silica>, supplement: none) and Figure #ref(<fig:2D-sens-plots-SiC>, supplement: none), in which the trend for $rho C_p$ remained constant, regardless of length. For the $Gamma_2$ scheme, we see a different trend in which at low $xi$, the uncertainties of diffusivity and conductivity are distinct but become equivalent as $xi$ increases. This is also consistent with the sensitivity analysis, where it was identified that the trends of $k$ and $alpha$ become indistinguishable at large $xi$ which results in poor parameter identifiability. These plots indicate that both schemes are viable options with a caveat. The $Gamma_2$ scheme has a lower uncertainty for small $xi$, but parameter coupling is likely to impact results for larger $xi$. Thus, when the $xi$ is unable to be approximated, the $Gamma_1$ scheme is the safer option.

However, as is often the case in TET, the emissivity is an unknown parameter. Therefore, a second numerical study was performed to analyze the impact $xi$ has on the uncertainty of the iterative fitting procedure. In this case, the thermal properties and emissivity are generated and applied to two distinct samples. Then, the length and diameter are varied for several combinations of low and high thermal radiation effect. The iterative fitting procedure was then applied to the artificial data and plotted for both fitting schemes.

#figure([#panels(2,
  panel("source/Images/k_iter.jpg", "a"),
  panel("source/Images/pCp_iter.jpg", "b"),
  panel("source/Images/emiss_iter.jpg", "c"),
)

  ],
  caption: [
    Multi-parameter iterative fitting uncertainty numerical study results for the $Gamma_1$ scheme for (a) $k$ (b) $rho C_p$ and (c) $epsilon.alt$
  ]
)
<fig:iter-uncert-num-study>

In Figure #ref(<fig:iter-uncert-num-study>, supplement: none), the results of the iterative fitting procedure are plotted so that optimal sample selection can be elucidated. The y-axis represents the thermal radiation effect of the shorter sample responsible for thermal property evaluation and the x-axis is the difference in the thermal radiation between the longer sample ($xi_2$) and the shorter sample ($xi_1$). This variable was chosen to demonstrate how the uncertainty changes with respect to proximity in length of the two samples used for iterative fitting. Figure #ref(<fig:iter-uncert-num-study>, supplement: none)#text("a") shows that with increased $xi_1$, uncertainty of thermal conductivity is far more sensitive to $xi_2 - xi_1$. Also, with lower $xi_1$ values, a smaller $xi_2 - xi_1$ is required to obtain a reasonable level of uncertainty. As expected from the sensitivity analysis, Figure #ref(<fig:iter-uncert-num-study>, supplement: none)#text("b") shows there is negligible change in uncertainty regardless of $xi_1$ and $xi_2 - xi_1$. For uncertainty variation in Figure #ref(<fig:iter-uncert-num-study>, supplement: none)#text("c"), a low uncertainty for emissivity is best achieved at large $xi_1$ due to the increase in sensitivity to $epsilon.alt$ with increased $xi_1$. The results for the $Gamma_2$ fitting scheme are shown in the supplementary materials document. These studies can be realized as a prescriptive tool for TET fitting when using a multi-parameter approach. By calculating $xi$ for the material of interest, the proper length can be selected based on approximations of the thermal properties and careful selection of the difference of sample lengths to ensure the fit is well-conditioned. In this way, the inevitable precision errors from the use of small sample lengths, chosen to negate thermal radiation effects, are avoided.

= Summary and outlook
<summary-and-outlook>
In this work, we presented a novel implementation of the TET to perform multi-parameter fitting for two different schemes. Through the use of an iterative curve fitting procedure, we have substantially reduced the required sample size to sufficiently account for environmentally induced errors. Two different materials were used to validate the novel approach and it was found that approximately 10% error or smaller was obtained for the average of each property. Adaptation of TET also led to the fitting capabilities of an additional parameter, volumetric heat capacity. This creates an alternative to conventionally used methods such as DSC, which can be complex and error prone when determining the specific heat of complex fiber morphologies. Finally, two uncertainty studies were performed which demonstrate the advantages of the fitting schemes and provide a tool to select proper sample lengths to effectively determine the intrinsic thermal properties without errors from thermal radiation.

<sec5>

= Acknowledgments
<sec6>
This material is based upon work supported under an University Nuclear Leadership Program Graduate Fellowship. The work performed in the University of Pittsburgh Nanofabrication and Characterization Core Facility ($R P I D : S C R \_ 05124$) and the services and instruments used in this project were graciously supported, in part, by the University of Pittsburgh.

= Declarations
<declarations>
The authors declare that they have no known competing financial interests or personal relationships that could have appeared to influence the work reported in this paper. Any opinions, findings, conclusions or recommendations expressed in this publication are those of the author(s) and do not necessarily reflect the views of the Department of Energy Office of Nuclear Energy. Data used for this work are avaible from the corresponding author upon reasonable request.

= Appendix
<appendix>
== Uncertainty formalism
<uncertainty-formalism>
$ R = sum_(i = 1)^M [v_i \( t_i \) - f #h(-1em) (t_i \, X_U \, C)]^2 $

where $v_i \( t_i \)$ is the measured voltage data point corresponding to a time point $t_i$, $C$ is a column vector which represents the control parameters, $X_U$ represents the column vector of unknown parameters to be fit, and $f$ is the corresponding value determined by the thermal model. The vector parameters vary depending on the fitting scheme and the data set used in the iterative fitting process. The process involves two steps, one in which the emissivity is fit, denoted by $X_(U_epsilon.alt)$ and $C_epsilon.alt$ and the second in which the thermal properties are fit, denoted by $X_(U_k)$ and $C_k$. For the shorter sample (small $xi$ data set), these are $X_(U_k) = \( rho C_p \, k \)^T$ or $X_(U_k) = \( alpha \, k \)^T$ and $C_k = \( L \, I \, V_0 \, D \, eta \, epsilon.alt \, T_0 \)^T$ depending on the fitting scheme, $Gamma_1$ or $Gamma_2$. For the longer sample (large $xi$), $X_(U_epsilon.alt) = \( epsilon.alt \)^T$ and $C_k = \( rho C_p \, k \, L \, I \, V_0 \, D \, eta \, T_0 \)^T$. The covariance matrix of $X_U$ is derived and is expressed by Var\[$hat(X)_U$\]

$ upright(V a r) \[ hat(X)_U \] = mat(delim: "[", sigma_(x_1)^2, upright(c o v) \[ x_1 \, x_2 \], upright(c o v) \[ x_1 \, x_3 \], dots.h.c; upright(c o v) \[ x_2 \, x_1 \], sigma_(x_2)^2, upright(c o v) \[ x_2 \, x_3 \], dots.h.c; upright(c o v) \[ x_3 \, x_1 \], upright(c o v) \[ x_3 \, x_2 \], sigma_(x_3)^2, dots.h.c; dots.v, dots.v, dots.v, dots.down) $

where the diagonal elements ($sigma_(x_1)^2$,$sigma_(x_2)^2$,...) are the variances of the unknown parameters. The square root of these elements are taken as the $plus.minus 2 sigma$ (95% confidence interval) unknown parameter uncertainty. Additional information regarding the uncertainty derivation and specific property uncertainties can be found in the supplementary materials document.

#bibliography("source/TET_bib.bib", style: "ieee")
]
