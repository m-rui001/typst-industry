#import "layout.typ": manuscript
#import "positions.typ": lens-positions

#manuscript("Non-contact lens metrology from optical flow and differentiable ray tracing")[
#strong[Abstract:] Accurate lens surface metrology is essential to determine the manufactured geometry of refractive optical elements and their deviation from the specified design. We demonstrate a transmission metrology method that reconstructs refractive lens surfaces from the displacement of a wavelet-noise-patterned mask. Lens-induced distortion is represented by a dense displacement field. A differentiable ray tracer fits the lens geometry using a calibrated near-telecentric camera model with an effective finite ray origin. We validate the method on commercial lenses. The recovered geometries agree with nominal specifications, and the plano-aspheric reconstruction is compared with chromatic confocal profilometry.

= Introduction
<introduction>
Surface-form errors have an impact on the optical power, the amount of aberration, and the rate at which spherical, aspheric, and freeform components can be manufactured @elhayek2014@ye2021@hao2023@mishra2024@Rolland:21. Although tactile coordinate measuring machines are capable of taking accurate surface measurements, the process is relatively slow and physical contact might cause damage to the optical element @Petz2009-yd@elhayek2014@beutler2016@ramirez2021@mishra2024@miao2026. Non-contact interferometric techniques offer high spatial resolution, but their dynamic range can be limited when dealing with surfaces that have large departures, in which case special null optics or computer-generated holograms may be necessary @beutler2016@miao2026@mishra2024@wyant1974. Deflectometric methods determine the surface shape by measuring the deviations of rays and are able to handle larger surface slopes @diaz2000@Petz2009-yd@knauer2004@huerta2021. With respect to refractive optics, transmission measurements continue to be difficult since the displacement of the observed rays depends on the geometry of the refracting surfaces, the refractive index, and the imaging setup @huerta2021@ye2021@wang2021@burke2023.

Pattern-based transmission measurements offer a direct means of observing these ray deviations. Both background-oriented Schlieren (BOS) and synthetic Schlieren methods estimate refraction by means of the apparent displacement of a known background and have been widely applied in the measurement of transparent media and liquid interfaces @Raffel2015@Moisy2009. The use of optical-flow processing with random-dot and wavelet-noise backgrounds allows for dense estimates of displacement over a wide range of displacements @Cakir2022, and telecentric imaging has been employed to enhance the spatial fidelity of such measurements @Ota2015. Early pattern-transmission techniques for optical surfaces also determined the geometry by fitting surface models to the measured ray deflections @Petz2009-yd@Fischer2014. The methods mentioned above demonstrate the sensing principle employed here: refraction is observed via the displacement of a known pattern, and the displacement field that is measured serves as the data for surface reconstruction.

Recent computational techniques have made it more practical to carry out inverse reconstruction based on measurements of ray deflection. Differentiable refractive deflectometry simultaneously determines the shape and position of the lens by means of a differentiable forward model @wang2021. The refractive null-screen methods have managed to recover plano-convex aspheres by iteratively optimizing the distortions of the measured pattern @huerta2024. Vision Ray Metrology is able to reconstruct surface topography directly from the measured ray deflections and has been used for form and mid-spatial-frequency characterization @ramirez2021@ramirez2024. These methods also highlight the importance of calibration, telecentricity, axial positioning, and multi-surface conditioning in transmission metrology @ramirez2021@ramirez2024@Xu:2019.

We reconstruct refractive lens surfaces from the displacement of a fixed wavelet-noise mask as seen through the test optic. An image of the mask taken as a reference and a second image obtained with the lens together give a dense displacement field. This field is first set up using a physical radial model which has been fitted to a few image correspondences and is then improved by means of direct image-consistency optimization. A differentiable ray tracer is then used to estimate the lens shape, employing a calibrated near-telecentric camera model that has an effective finite ray origin. For spherical lenses and exploratory residual analyses, reconstruction proceeds from a conic surface to a dense heightmap and final parametric fitting. The quantitative AL2550 benchmark directly optimizes a shared rotational asphere with a separate pose for each acquisition. The method is tested on commercial plano-convex, biconvex, and plano-aspheric lenses, and the reconstructed aspheric surface is compared with that obtained by chromatic confocal profilometry. The residual heightmaps are analyzed in a Zernike basis in order to characterize the low-order surface structure beyond the fitted nominal geometry.

= Methods
<methods>
The process begins with two images of the chrome mask and a lens-induced displacement field fitted by differentiable ray tracing. The spherical-lens workflow then reduces an optimized heightmap to optical shape parameters and residual maps; the AL2550 benchmark directly fits rotational-asphere parameters. Unless otherwise stated, the Methods figures refer to the Thorlabs LA1608-A plano-convex lens as the example under consideration. This measurement demonstrates distortion retrieval, differentiable surface reconstruction, and residual-based aberration analysis.

== Experimental setup
<experimental-setup>
#figure(image("source/figs/experimental_setup_V2.pdf"),
  caption: [
    Experimental setup and data capture for lens metrology. (a) The imaging system comprises a FLIR camera (C, GS3-U3-41C6M-C) and a telecentric lens (TL, Edmund Optics 3/4 in C-Mount TitanTL® series) having a working distance of $upright(W D) = 110 thin upright("mm")$ and a nominal magnification of $M = 0.184 times$. The lens sample (S) is positioned on the chrome mask, which has the pattern (P). The illumination is provided by a Thorlabs M565L3 LED, with a dominant wavelength of $lambda = 565 thin upright("nm")$, and is directed through a 50:50 beam splitter (BS) and two matte near-Lambertian diffusers (LD1, LD2). The inset shows the back-illumination coming out of the diffuser, the chrome binary mask, and the lens placed on top of the mask. On the right side, there are examples of the data obtained, illustrating (b) the reference pattern and (c) the pattern distorted by the lens, together with overlaid grids that track the distortion field.
  ]
)
<fig:experimental_setup>

Each measurement uses a reference image of the undistorted pattern and a second image with the lens resting on the mask. Figure #ref(<fig:experimental_setup>, supplement: none) shows the setup. The vertical configuration lets gravity hold the sample and mask in contact, avoiding the mechanical alignment fixtures required in horizontal arrangements and keeping the full aperture visible. Because the edged pattern is exposed directly to the lens back surface, no cover glass is introduced between the sample and target @MAESTRO-WATSON2017@burke2023@ramirez2024.

The optical system consists of three components: background illumination at the bottom, a binary-pattern measurement plate in the middle, and a telecentric imaging system above it. In an ideal object-space telecentric system, chief rays are parallel to the optical axis, reducing perspective distortion and supporting an orthographic camera approximation. Each image point still receives a finite cone of rays set by the numerical aperture. In practice, telecentric lenses differ slightly from this ideal; the calibration method employed to estimate this deviation and incorporate it into the ray model is given in the Supplementary Material (Section~#emph[Imaging-System Calibration]).

=== Measuring pattern
<measuring-pattern>
A number of targets are capable of detecting transmission distortion in a refractive optic, such as ground-glass diffusers, printed transparencies, laser-printed random-dot targets employed in synthetic Schlieren, and etched binary masks @Moisy2009@Berto2017@Wang2017@Wang2019. We have chosen a chrome-etched binary wavelet-noise mask for two reasons. First, the binary chrome pattern provides high contrast and can be manufactured on a scale smaller than that of the camera's sampling; the feature size of the $1.975 thin mu upright("m")$ mask, when imaged through the 0.184X telecentric lens, corresponds to about 15 mask pixels being mapped onto each camera pixel. Secondly, wavelet noise is well suited to optical flow since its scale-invariant histogram distribution is compatible with the coarse-to-fine pyramids employed by classic flow algorithms, and previous studies related to BOS have directly evaluated wavelet-noise backgrounds using optical-flow processing @Cook2005@RN592@Farneback2003@WANG2024102029@Cakir2022.

Details regarding pattern fabrication and image-domain validation can be found in the Supplementary Material (Section~#emph[Pattern Design and Capture Fidelity]).

== Distortion field retrieval
<sec:distortion_retrieval>
The measurement of the distortion field is connected with wavefront-sensing techniques that use random patterns @Berto2017@Wang2017@Wang2019. These methods compare a reference image with an image of a shifted pattern and, in the paraxial regime, recover phase by optimizing a potential field. When carrying out measurements with a clear-aperture lens, large ray deviations near the aperture edge can challenge the paraxial approximation. We begin by using a simple geometrical model to initialize the displacement field and then improve it through direct image-consistency optimization in such a way that the warped image stays in agreement with the measured data. The physical radial model employed for this initial step is explained in the Supplementary Material (Section~#emph[Initial State Estimation of the Displacement Field]). The definition of the loss function, the regularization terms, and the details of the optimization used in the dense refinement are provided in the same section, in #emph[Differentiable optimization refinement].

Instead of using physical radial initialization, the initial field can be calculated using a general optical-flow method. We used OpenCV's Farnebäck implementation @FarnebackOpenCV@Farneback2003. It produces a dense displacement map, but its accuracy decreases as surface slope and displacement increase.

A representative measurement is illustrated in Figure #ref(<fig:flow_field>, supplement: none) in terms of the physical initialization and the following dense refinement; an example of the pattern validation can be found in the Supplementary Material (Section~#emph[Pattern Design and Capture Fidelity]).

#figure(image("source/figs/Displacement_retrieval_V5.1.pdf", width: 75.0%),
  caption: [
    Dense displacement-field retrieval and refinement. (a) The physical radial initialization is obtained by fitting the sparse feature correspondences; the matches that are accepted and those that are discarded are displayed together with the fitted radial model and its threshold band. (b) The initial displacement field is shown as a three-dimensional magnitude map and a top-view vector field. (c) The loss evolves during the process of dense image-consistency refinement, with the optimizer change occurring at iteration 100. (d) The refined displacement field is shown using the same representations as in (b). (e) Displacement corrections introduced by refinement, $upright(bold(D))_(upright(r e f)) - upright(bold(D))_(upright(i n i t))$, shown for $Delta X$, $Delta Y$, and $Delta \| upright(bold(D)) \|$. RMS values are reported for each map, with the shared correction scale given in micrometers.
  ]
)
<fig:flow_field>

== Differentiable surface solver
<differentiable-surface-solver>
Figure #ref(<fig:displacement_comparison>, supplement: none) gives an overview of the reconstruction loop. In each iteration, the present lens and camera parameters produce a predicted displacement field using differentiable ray tracing. This predicted field is then compared with the observed field obtained in Section #ref(<sec:distortion_retrieval>, supplement: none), and the displacement residual from this comparison is used in the data-consistency term. The reconstruction is subject to physical and geometric penalties, and a weak smoothness regularization is applied when refining the heightmap. The gradients are backpropagated through the differentiable forward model in order to update the reconstruction parameters. The complete definition of the loss function is provided in the Supplementary Material (Section~#emph[Reconstruction Objective and Optimization Stages]).

During reconstruction, we optimize lens parameters together with auxiliary alignment parameters that primarily affect observability, including lens decenter in the pattern plane $\( x \, y \)$ and a small angular pose correction for the imaging axis. The finite ray-origin parameter (virtual pinhole origin) is obtained during camera calibration (see Supplementary Material, Section~#emph[Imaging-System Calibration]) and then fixed for subsequent reconstructions. To reduce ambiguity, center thickness (CT) is constrained to the measured value with a narrow search window of $plus.minus 10 thin mu upright("m")$. Radius, edge thickness, and surface-shape terms are instead controlled through soft penalties. Measurement diversity and the resulting parameter conditioning are discussed in the Supplementary Section~#emph[Measurement Diversity and Conditioning].

The forward ray-tracing model is based on the calibrated camera geometry as described in the Supplementary Material (Section~#emph[Imaging-System Calibration]). Since the measured quantity is pixel displacement at the sensor, the predicted displacement is obtained from the inverse correspondence of the forward ray map between the reference and lensed states. The derivations of the ray model and of the inverse mapping are given in the Supplementary Material (Sections~#emph[Forward Ray Model] and~#emph[Predicted Displacement Calculation]).

#figure(image("source/figs/Differentiable_lens_recs_V5.2.pdf"),
  caption: [
    Differentiable optimization pipeline for the spherical-lens heightmap workflow, illustrated with LA1608-A. Observed and predicted sensor-displacement magnitudes share a color scale; the residual is the magnitude of their vector difference. All maps show the same valid measurement region in a $20 times 20 thin upright(m m)$ field. The objective combines data consistency, physical constraints, and heightmap smoothness. Gradients update the reconstruction parameters through the forward model. The sampled loss history marks the conic-to-heightmap transition (dashed line). The dot marks the exported heightmap at its original search iteration: the lowest-objective evaluated state passing physical-ray and stable-inversion checks. The AL2550 rotational benchmark uses the separate direct parametric protocol described in the text.
  ]
)
<fig:displacement_comparison>

=== Surface optimization
<surface-optimization>
The initial step in the reconstruction is to estimate the surface which best accounts for the measured distortion field. This optimization process is kept apart from the final presentation of the design parameters. The estimation of the surface is guided by the requirement of displacement consistency; it is in a subsequent fitting stage that the optimized surface is transformed into conventional optical parameters.

#strong[Stage 1: conic parametric optimization.] The first stage uses a conic model without aspheric coefficients: $ z \( r \) = frac(r^2, R [1 + sqrt(1 - \( 1 + k \) r^2 / R^2)]) $<eq:conic> where $R$ is the radius of curvature and $k$ is the conic constant. This stage captures the dominant geometry and corrects for position and angular misalignments of the imaging system.

#strong[Stage 2: heightmap refinement.] After stage 1 converges, heightmaps replace the conic representation when carrying out local refinement under weak smoothness regularization and with data-dominant weighting. The single-sided spherical measurements reported here refine the front-surface heightmap and keep the preceding parametric back-surface estimate fixed. Paired front/back measurements can refine two heightmaps. In this stage, the spatial deviations from the ideal conic surface are recovered, and the dense surface estimate obtained is the one used for residual and aberration analysis.

=== Surface fitting for final shape parameters
<methods:surface_fitting>
The optical shape parameters are obtained by fitting a parametric surface to the optimized heightmap. In this registration step, surface form is separated from any remaining translation and orientation, which is necessary for performing dense 3D measurements without having to use an independent datum @MCBRIDE1996597@HILL2002457@elhayek2014@El-Hayek2015-qe. Further information regarding the pose registration, the fitted parameter vector, and the optimization process is given in the Supplementary Material (Section~#emph[Reconstruction Objective and Optimization Stages]).

After this registration, the local sag follows the ISO 10110-12 asphere convention @ISO10110-12-2019: $ z \( r \) = frac(r^2, R [1 + sqrt(1 - \( 1 + k \) r^2 / R^2)]) + sum_(i = 1)^N A_(2 i) r^(2 i) $<eq:asphere> In the case of spherical analysis, both $k$ and $A_(2 i)$ are set to zero; for aspheric analysis, they are determined after the heightmap stage, up to $A_10$ in the current implementation. The spherical radii from this fitting process are compared with catalog specifications. For the quantitative AL2550 benchmark, staged optimization directly fits the shared parameters $R \, k \, A_4 \, A_6 \, A_8$ with capture-specific lateral translation and tilt; $A_10$ is fixed to zero. Its CCP rotational fitting model includes $A_10$. The fitting model remains the same for dual-surface lenses. The larger errors, especially those occurring on the flatter back surfaces, are in agreement with the fact that the two-surface inverse problem is less well conditioned.

Residual definitions, filtering, wavefront conversion, and Zernike decomposition are described in the Supplementary Material (Section~#emph[Residual and Aberration Analysis]).

= Results
<results>
We measured off-the-shelf Thorlabs lenses commonly used in optics laboratories. The set includes plano-convex and biconvex spherical lenses, and plano-aspheric lenses. Other geometries, including plano-concave, biconcave, and meniscus lenses, are compatible with the same measurement principle. The analyzed repeat counts are listed with the results.

The use of the optimized height enables the study of residual surface departures described in the Supplementary Material (Section~#emph[Residual and Aberration Analysis]). In the current arrangement, however, the analysis is limited to the low-spatial-frequency components since the imaging system, with its $0.185 times$ telecentric magnification and $5.5 thin mu upright("m")$ monochrome sensor, is not very sensitive to higher-spatial-frequency terms.

== Calibration results
<calibration-results>
Four separate calibration measurements yielded an effective telecentricity error of about $0.144^compose$, a projective ray-origin distance of about $4.38 thin upright(m)$ from the pattern plane, and an RMS displacement residual of $0.60 plus.minus 0.05 thin mu upright(m)$. Although these values describe the effective projective camera model, they should not be understood as a direct restatement of the manufacturer's telecentric-lens specification. Further details regarding the calibration procedure, the refractive-index measurement, the displacement maps, the repeatability statistics, and the convergence results are given in the Supplementary Material (Sections~#emph[Imaging-System Calibration] and~#emph[Experimental Refractive-Index Measurements]).

== Plano-convex lenses
<plano-convex-lenses>
Plano-convex lenses provide the simplest example when dealing with front-surface recovery since most of the optical power is produced at a single refractive surface. For each lens model, we report the mean signed deviation from catalog radius and a two-sided 95% confidence interval of the repeated-fit mean, computed as $macron(x) plus.minus t_(0.975 \, n - 1) s \/ sqrt(n)$ with sample standard deviation $s$ and $n$ included fits. These intervals describe repeatability; they exclude calibration uncertainty and catalog tolerance. For groups with at least four fits, radius deviations outside the 1.5-interquartile-range fences are rejected before computing the mean and interval. The figure tables give included/total counts: one fit is rejected for each of LA1027-A, LA1131-A, and LA1229-A, and for the LBF254-050 front surface. Other groups include all fits. Radius fitting uses an aperture diameter of 20 mm for all models.

#figure(image("source/figs/lens_radius_deviations_PCX_meas_A_ok_corrected.pdf", width: 90.0%),
  caption: [
    Mean signed front-surface radius error ($Delta R$ in %) for plano-convex lenses, with 95% confidence intervals from repeated measurements (aperture diameter: 20 mm). The shaded band marks the $plus.minus 1 %$ region around nominal ROC. The accompanying table reports, for each lens, nominal catalog ROC, signed radius deviation in mm, percentage error, estimated axis tilt ($beta$), and included/total sample count.
  ]
)
<fig:r1_comparison>

Figure #ref(<fig:r1_comparison>, supplement: none) reports front-surface ROC estimates for eight plano-convex lenses. Six of the eight mean radius errors fall within the $plus.minus 1 %$ band, and the mean errors span approximately $- 1.5 %$ to $+ 0.07 %$. Most mean errors are negative, indicating a mild underestimation of front-surface radius. The lens with the largest nominal radius has the widest repeatability interval.

== Biconvex lenses
<biconvex-lenses>
For the biconvex lenses, we give the signed ROC errors for both the front and back surfaces of the LBF254-050 and LBF254-200, using the same 20 mm aperture criterion and the same repeated-measurement statistics.

A clear asymmetry is observed between the recoverability of the front and back surfaces in Figure #ref(<fig:comprehensive_comparison_biconvex>, supplement: none). The front-surface mean errors are --0.80% and --1.5%. The back surfaces exhibit larger systematic deviations (+8.6% for LBF254-050 and --6.9% for LBF254-200). The confidence intervals are narrower than the mean bias, showing that the back-surface estimates are stable but biased.

The pattern is compatible with restricted conditioning regarding back-surface recovery in two-surface lenses. The displacement data have a strong effect on the front curvature, whereas the back curvature is more affected by model mismatch and by coupling via lens thickness and refractive path. The sign reversal observed in the two back-surface cases cannot be explained by a single global offset and is compatible with a curvature-dependent bias.

#figure(image("source/figs/lens_radius_deviations_BCX_meas_A_ok_corrected.pdf", width: 90.0%),
  caption: [
    Mean signed radius error ($Delta R$ in %) for front and back surfaces of two biconvex lenses (LBF254-050 and LBF254-200), with 95% confidence intervals (aperture diameter: 20 mm). The shaded region marks the $plus.minus 1 %$ interval. The axis break separates low/medium ROC values from the large-ROC back surface of LBF254-200. The table reports signed radius deviations in millimeters and percent, fitted axis tilt $beta$, and included/total sample count for each surface. Angular confidence halfwidths below $0.001^compose$ are shown as upper bounds.
  ]
)
<fig:comprehensive_comparison_biconvex>

== Plano aspheric lenses
<plano-aspheric-lenses>
Plano-aspheric lenses require a fuller surface prescription than spherical samples: radius of curvature, conic constant, and higher-order aspheric coefficients as defined in Eq.~#ref(<eq:asphere>, supplement: none). We focus on the Thorlabs AL2550 lens. Because different combinations of the higher-order coefficients can produce very similar sag profiles over a finite aperture, we use physical surface agreement as the primary accuracy measure and treat individual coefficient recovery as a secondary identifiability diagnostic. The corresponding conditioning analysis is provided in the Supplementary Material.

=== Measurement results for AL2550 aspheric lens
<measurement-results-for-al2550-aspheric-lens>
For the AL2550 benchmark, direct staged optimization of a shared rotational asphere uses a fixed $20 thin upright(m m)$-diameter reconstruction aperture centered on paired fiducial-derived carrier center estimates. Lateral decenter and two-axis tilt are fitted independently for each acquisition, while in-plane rotations retain their nominal values. Center thickness is fixed to the measured value of $6.029 thin upright(m m)$, and the refractive index is set to 1.5178 at 565 nm @Polyanskiy2024. The independent CCP measurement has a smaller usable field, so quantitative DRT--CCP surface comparisons are restricted to their common central $14 thin upright(m m)$-diameter region. Reconstruction stages, aperture construction, and identifiability controls are described in the Supplementary Material.

=== Benchmark comparison with confocal chromatic profilometry
<benchmark-comparison-with-confocal-chromatic-profilometry>
Chromatic confocal profilometry (CCP) is used as an independent benchmark for the AL2550 rotational surface. Acquisition details, the fixed CCP validation window, and the surface-fitting procedure are described in the Supplementary Material (Section~#emph[CCP Benchmark Processing]).

Table #ref(<tab:al2550_surface_comparison>, supplement: none) reports circular-area RMS sag differences over the common $14 thin upright(m m)$-diameter region. The rotational surface fitted to the independently acquired CCP data differs from the manufacturer prescription by $0.09 thin mu upright(m)$ RMS. The selected DRT reconstruction differs from the manufacturer surface by $0.50 thin mu upright(m)$ RMS and from the CCP rotational surface by $0.44 thin mu upright(m)$ RMS. These compare rotational surfaces, not the raw CCP point cloud, and do not constitute measurement-uncertainty bounds. Sag comparisons are used because the individual high-order coefficients are strongly correlated and poorly conditioned over the finite measurement aperture.

#figure(
  align(center)[#table(
    columns: 2,
    align: (left,center,),
    table.header([Surface comparison], [RMS sag difference ($mu upright(m)$)],),
    table.hline(),
    [CCP vs. manufacturer prescription], [0.09],
    [DRT vs. manufacturer prescription], [0.50],
    [DRT vs. CCP rotational fit], [0.44],
  )]
  , caption: [AL2550 rotational-surface comparison over the common central $14 thin upright(m m)$-diameter region. Values are circular-area RMS sag differences.]
  , kind: table
  ) <tab:al2550_surface_comparison>
Additional optimization tests show that a small multiplicative mismatch in the measured displacement scale can be absorbed into the low-order aspheric shape. Fitting this displacement-scale factor before further shape optimization suppresses most of the resulting sag error; the conditioning and displacement-scale tests are reported in the Supplementary Material.

Controlled synthetic perturbations were also used to characterize recoverability independently of the catalog coefficient parameterization. Directional sinusoidal sag perturbations spanning 2--12 cycles per aperture were tested first with the ray-tracing inverse model and then with the complete simulated image and optical-flow pipeline. With the realistic image model, the lowest RMS sag amplitudes satisfying the recovery criteria were 5, 2, 1, and $1 thin mu upright(m)$ at 2, 4, 8, and 12 cycles per aperture, respectively. These values describe synthetic recovery of the known sinusoidal basis and are not experimental surface-resolution limits; additional basis-transfer tests are summarized in the Supplementary Material.

The residual structure obtained from the DRT and CCP reconstructions is discussed separately in the Supplementary Material (Section~#emph[Residual and Aberration Analysis]); this exploratory residual comparison is not used as the quantitative surface-accuracy metric.

= Conclusions
<conclusions>
The study deals with the measurement of the transmission properties of refractive lenses using dense mask-displacement fields. The apparatus involves a chrome wavelet-noise mask, a near-telecentric imaging system, the calibration of the non-ideal telecentricity using a finite-origin projective camera model, and differentiable ray tracing; the spherical-lens workflow proceeds from a conic surface to a heightmap and final optical parameters, and the AL2550 benchmark directly optimizes a shared rotational asphere with acquisition-specific poses.

With plano-convex spherical lenses, six of the eight mean radius errors lie within $plus.minus 1 %$ of the nominal catalog value. In the case of two-surface biconvex lenses, higher demands are placed on the measurements. The front surfaces are recovered with only a slight bias, but the flatter or less strongly constrained back surfaces exhibit larger systematic deviations. This result is in agreement with the nature of a transmission measurement, since multiple refracting interfaces can give rise to coupled displacement signatures.

With respect to the AL2550 plano-aspheric lens, the rotational reconstruction differs from the CCP rotational fit by $0.44 thin mu upright(m)$ RMS over the common validation aperture. Individual high-order polynomial coefficients remain poorly conditioned and are therefore not interpreted independently as accuracy measures. Supplementary optimization and displacement-scale tests show that a small multiplicative displacement error can be absorbed by the low-order aspheric shape, which supports direct validation of the recovered sag against an independent surface measurement. There are still some limitations. The calibration model currently does not take field-dependent imaging distortion into account. The conditioning of dual-surface lenses needs to be improved, particularly when the back surfaces are flatter. The aberration terms at high spatial frequencies are limited by the existing imaging chain. Overcoming these limitations will demand field-dependent camera calibration, higher-resolution imaging, and independent verification of the recovered residual surface. Since the method makes use of non-coherent illumination and a reusable reference image, each lens measurement only necessitates the acquisition of the distorted pattern image. The working distance is determined by the telecentric imaging system and does not involve the need for a near-contact probe.

#heading(level: 1, numbering: none)[Funding]
<funding>
King Abdullah University of Science and Technology (KAUST) (Individual Baseline Funding).

#heading(level: 1, numbering: none)[Acknowledgments]
<acknowledgments>
The authors thank Qiang Fu and Hadi Amata for their help with the binary mask fabrication.

#heading(level: 1, numbering: none)[Disclosures]
<disclosures>
The authors declare no conflicts of interest.

#heading(level: 1, numbering: none)[Data availability]
<data-availability>
Data underlying the results presented in this paper are not publicly available at this time but may be obtained from the authors upon reasonable request.

#heading(level: 1, numbering: none)[Supplemental document]
<supplemental-document>
The supplementary material follows the main manuscript in this arXiv submission.

#bibliography("source/references.bib", style: "ieee")
]
