#import "resonator-geometries.typ": geometries
#set page(paper: "us-letter", margin: (x: 17mm, y: 18mm), numbering: "1")
#set text(font: "Libertinus Serif", size: 9.5pt, lang: "en")
#set par(justify: true, leading: .49em, first-line-indent: (amount: 1em, all: true))
#set heading(numbering: "I.A.1")
#set math.equation(numbering: "(1)")
#set figure.caption(separator: [. ])
#show figure.caption: set text(size: 8pt)
#show table: set text(size: 8pt)
#set table(inset: (x: 3pt, y: 2pt), stroke: (x: none, y: .3pt + luma(180)))

#align(center)[
  #text(size: 15pt, weight: "bold")[From Cantilevers to Membranes: Advanced Scanning Protocols for Magnetic Resonance Force Microscopy]
  #v(6pt)
  Nils Prumbaum, Christian L. Degen, and Alexander Eichler
  #v(3pt)
  #text(size: 8.5pt)[Laboratory for Solid State Physics and Quantum Center, ETH Zürich, CH-8093 Zürich, Switzerland]
]

#pad(x: 10mm)[
  #set par(first-line-indent: 0pt)
  Magnetic Resonance Force Microscopy (MRFM) enables three-dimensional imaging of nuclear spin densities in nanoscale objects. Based on numerical simulations, we evaluate the performance of strained SiN resonators as force sensors and show that their out-of-plane oscillation direction improves the quality of the reconstructed sample. We further introduce a multislice, compressed-sensing scan protocol that maximizes the information obtained for a given measurement time. Our simulations predict that these new scanning protocols and optimized algorithms can shorten the total acquisition time by up to two orders of magnitude while maintaining the reconstruction fidelity. Our results demonstrate that combining advanced scanning protocols with state-of-the-art resonators is a promising path toward high-resolution MRFM for volumetric imaging of biological nanostructures.
]

#columns(2, gutter: 5mm)[
#text(size: 8pt)[Corresponding author #link("mailto:eichlera@ethz.ch")]

= Introduction

<introduction>

Magnetic Resonance Force Microscopy (MRFM) is a method for detecting electron or nuclear spins within three-dimensional nanoscale objects~@budakian_roadmap_2024. Invented in the early 1990s~@sidles_noninductive_1991@sidles_folded_1992, MRFM achieved many experimental milestones, including the measurement of single electron spins~@rugar_single_2004, imaging of nuclear spin densities inside a single tobacco mosaic virus~@degen_nanoscale_2009, Fourier-encoded spin detection~@nichol_nanoscale_2013, one-dimensional imaging with sub-nanometer resolution~@grob_magnetic_2019@rose_high-resolution_2018, and dynamic nuclear polarization in nanoscale samples~@tabatabaei_large-enhancement_2024. To reach these milestones, the sensitivity of MRFM was improved by operating experiments at millikelvin temperatures~@haas_nuclear_2022, engineering high-gradient magnetic field sources~@longenecker_high-gradient_2012@pachlatko_nanoscale_2024, and replacing pendulum-style cantilevers~@mamin_silicon_2012 with silicon nanowires~@nichol_nanoscale_2013@sahafi_ultralow_2020. In spite of all these efforts, MRFM imaging has not reached a level where the structure of biological, chemical, or solid-state samples is revealed at near-atomic scales.

Over the past decade, resonators made from strained silicon nitride opened up many new possibilities in nanomechanical sensing~@engelsen_ultrahigh-quality-factor_2024. These resonators come in the shape of trampolines~@reinhardt_ultralow-noise_2016@norte_mechanical_2016, membranes~@tsaturyan_ultracoherent_2017@rossi_measurement-based_2018@reetz_analysis_2019, strings~@ghadimi_elastic_2018@beccari_strained_2022@gisler_soft-clamped_2022, polygons~@bereyhi_perimeter_2022, hierarchical structures~@fedorov_fractal-like_2020@bereyhi_hierarchical_2022, and spider webs~@shin_spiderweb_2022. Due to their ultralow dissipation, they have the potential to vastly improve the speed and spatial resolution of MRFM measurements~@eichler_ultra-high-q_2022. Their high resonance frequencies also avoid issues arising with ultrasoft cantilevers, such as non-contact friction~@heritier_spatial_2021@engelsen_ultrahigh-quality-factor_2024 and static bending~@krass_force-detected_2022. Recent proof-of-principle experiments demonstrated scanning force microscopy~@halg_membrane-based_2021@gisler_enhancing_2024 and electron spin detection~@scozzaro_magnetic_2016@fischer_spin_2019 with membrane and trampoline resonators.

In spite of these advances, several issues need to be overcome to exploit silicon nitride resonators for nuclear spin detection. The high resonance frequencies of silicon nitride resonators, which typically lie in the range of 100~kHz to 5~MHz, present a challenge to nuclear spin manipulation. Several solutions have been proposed, including frequency-modulation MRFM~@kuehn_advances_2008, time-dependent gradients~@nichol_nanomechanical_2012, spin-induced parametric coupling between nearby modes~@kosata_spin_2020, and resonant coupling between spins and resonator~@visani_near-resonant_2025. Moreover, the arrangement of a membrane- or string-based setup is different from that of a pendulum-style cantilever or nanowire-based setup, leading to different point spread function (PSF). This is potentially important, as the PSF determines the spatial convolution of the sample object into measurement data, and consequently impacts the quality of the image reconstruction.

In this work, we present advanced techniques for three-dimensional image reconstruction in MRFM, applicable to setups employing strained silicon nitride-based resonators. Using numerical simulations, we show that a two-dimensional spatial scan combined with a frequency dimension improves the reconstruction fidelity by 2-5x compared to the traditional three-dimensional spatial scan. The improvement is more pronounced for membrane-type sensors, oscillating vertically, compared to cantilever-type sensors oscillating laterally. We also show that compressed sensing allows for a sub-sampling by at least 50%, permitting a speed-up by the same factor without degradation of the image. Our work indicates avenues for improved three-dimensional MRFM that take advantage of new generations of ultrasensitive nanomechanical resonators.

The manuscript is structured as follows: in Section~@sec:stud_geo, we compare the different geometries of setups utilizing a cantilever or a membrane resonator as a sensor. In Section~@sec:image_protocols, we discuss various signal generation and imaging protocols. In Section~@sec:reconstruction, we explain how the simulated data is reconstructed into a spin distribution image. Finally, in Section~@sec:res, we show the reconstructed spin density images and analyze the performance of different geometries as well as different imaging protocols.

= Setup Geometries

<sec:stud_geo>

#figure(geometries, placement: auto, scope: "parent",

  caption: [Analyzed geometries. (a)~Illustration of MRFM setup utilizing cantilever-style force sensors. The spin ensemble (pink) is attached to the tip of the resonator and positioned above the magnetic field gradient source (gray). The resonator's oscillation direction is along $x$ and parallel to the gradient source's top surface. When spin inversion pulses are applied via an external antenna, all spins inside the resonance slice (purple) are inverted periodically. (b)~Illustration of a setup utilizing tensioned resonators as force sensors. The sample is still attached to the resonator, but the oscillation direction is along $z$, perpendicular to the gradient source's top surface, changing the direction of the detected force. (c)~PSF of a cylindrical nanomagnet when the cantilever geometry is used. Its magnitude is proportional to $\| partial B_z \/ partial x \|^2$. The nanomagnet's radius is $50 med upright("n") upright("m")$ and it has a rounded edge with radius $r_(upright(e d g e)) = 10 med upright("n") upright("m")$. (d)~PSF of the identical magnet for a membrane resonator geometry. The strength of the PSF is determined by the derivative $\| partial B_z \/ partial z \|^2$. (e)~Timing diagram of spin inversions. Twice per resonator oscillation, a spin inversion pulse (blue) is applied. This results in a force generated by the ensemble (pink) that is resonant with the resonator's movement (orange) leading to a detectable driving force.],
) <Fig:1>

#emph[Cantilever-based setup.] Typical MRFM setups utilize a pendulum-style cantilever as a sensor~@degen_nanoscale_2009, see @Fig:1\(a). The cantilever oscillates along the $x$-axis, parallel to the surface of a nanoscale ferromagnet that acts as a magnetic field gradient source. Spins in a sample attached to the cantilever tip experience a force $upright(bold(F))_(upright(s p i n)) \( t \) = nabla \( upright(bold(m)) \( t \) dot.op upright(bold(B)) \)$, where $upright(bold(B))$ is the local magnetic field and $upright(bold(m)) \( t \)$ the time-dependent magnetic moment of the spin ensemble. The spin quantization axis is set by a strong external magnetic field $B_0$ in the $z$-direction. The $z$-component of the magnetic moment, $m_z \( t \)$, is periodically inverted using radio-frequency (rf) pulses resonant with the Larmor frequency of the spins. The rf magnetic field, of magnitude $B_1$, points along the $x$-direction and is generated by a microstrip antenna~@poggio_nuclear_2007. Since the resonator is only susceptible to forces along its oscillation direction, here the $x$-direction, the effective driving force is $ F \( t \) = frac(partial B_z, partial x) m_z \( t \) . $<eq:ForceCant> Note that interchanging the positions of the sample and the magnetic field gradient source~@kuehn_advances_2008@vinante_magnetic_2011@issac_dynamic_2016 does not change Eq.~@eq:ForceCant.

#emph[Membrane-based setup.] Strained silicon nitride mechanical resonators have been fabricated in many different geometries, such as membranes, strings or trampolines~@reinhardt_ultralow-noise_2016@norte_mechanical_2016@tsaturyan_ultracoherent_2017@rossi_measurement-based_2018@reetz_analysis_2019@ghadimi_elastic_2018@beccari_strained_2022@gisler_soft-clamped_2022@bereyhi_perimeter_2022@fedorov_fractal-like_2020@bereyhi_hierarchical_2022@shin_spiderweb_2022. In this work, we use membranes as a generic example of all these resonator types. In @Fig:1\(b), we show a sketch of a setup with a membrane sensor~@halg_membrane-based_2021. Here, the sample containing spin ensembles is placed on the membrane surface. Importantly, in contrast to pendulum-style cantilevers, the membrane's oscillation is along the $z$ direction. This geometry leads to a driving force in the $z$-direction and given by $ F \( t \) = frac(partial B_z, partial z) m_z \( t \) . $<eq:ForceMem>

= Imaging Protocols

<sec:image_protocols>

== Single Point

<sec:single_point>

First, we examine how a resonant force signal is generated for a single magnetic moment located at a fixed position with respect to the magnetic field gradient. We start with the simple case of a point-like magnetic moment $mu_z$. This produces a static force $F_(upright(r e s)) = frac(partial B_z, partial p) mu_z$, where $p in [x \, z]$ is the oscillation direction of the resonator. To generate a resonant force, rf inversion pulses are applied, cf. blue trace in @Fig:1\(e)~@degen_nanoscale_2009@grob_magnetic_2019. These pulses flip the $z$-component of the spin's magnetic moment and thereby periodically reverse the sign of the force \[Eq.~@eq:ForceCant\]. By setting the inversion pulse repetition rate to twice the natural frequency of the resonator, $1 \/ T_(upright(r)) = 2 f_(upright(r e s))$, the induced force is brought into resonance with the mechanical resonator, see pink and orange traces in @Fig:1\(e).

In the next step, we consider an extended spin ensemble, characterized by a local spin density $rho_(upright(s p i n)) \( upright(bold(r)) \)$. Spins located at different positions relative to the gradient source possess different Larmor frequencies $f_(upright(L)) \( upright(bold(r)) \) = gamma \/ 2 pi med \| upright(bold(B)) \( upright(bold(r)) \) \|$ depending on the local magnetic field strength $\| upright(bold(B)) \( upright(bold(r)) \) \|$ and the gyromagnetic ratio $gamma$ of the detected spin species. An inversion pulse is characterized by a center frequency $f_0$ and an inversion bandwidth $f_(upright(B W))$, and only those spins whose Larmor frequencies lie within the inversion range $f_0 plus.minus f_(upright(B W))$ of the applied pulse are inverted. For a given pulse, this creates a 'resonant inversion slice', shown in purple in @Fig:1\(a-b)~@degen_nanoscale_2009.

In nanoscale spin ensembles, the thermal (Boltzmann) spin polarization is typically negligible. Instead, stochastic fluctuations of the spin ensemble polarization dominate~@degen_role_2007@herzog_boundary_2014. Therefore, it becomes advantageous to analyze the force variance, rather than its mean, for spin imaging. The net resonant force variance is generated by the sum of all spins inside this resonance slice, weighted by their respective local gradients. This spatial distribution is represented in a 'point-spread function' (PSF), which we refer to as $H \( upright(bold(r)) \)$, where $upright(bold(r)) = \( x \, y \, z \)$ is the spatial position with respect to the magnetic gradient source. Neglecting pulse imperfections, the PSF for a given inversion pulse and magnetic field gradient source is expressed as $ H \( upright(bold(r)) \) = cases(delim: "{", sigma_(upright(s p i n))^2 & frac(gamma, 2 pi) B \( upright(bold(r)) \) in \( f_0 plus.minus f_(upright(B W)) \), 0 & upright("otherwise") .) $ where $sigma_(upright(s p i n))^2 = (frac(partial B_z \( upright(bold(r)) \), partial_x))^2 mu^2$ (for cantilevers) or $sigma_(upright(s p i n))^2 = (frac(partial B_z \( upright(bold(r)) \), partial_z))^2 mu^2$ (for membranes) is the force variance generated by a single moment $mu = \| m_z \| = 1 / 2 ℏ gamma$ at position $upright(bold(r))$, see Eq.~@eq:ForceCant and @eq:ForceMem. We compute the nanomagnet's magnetic field $B \( upright(bold(r)) \)$ using the FEMM finite-element solver~@meeker_finite_2023.

Figures~@Fig:1\(c-d) show examples of PSFs for the two geometries discussed in Section~@sec:stud_geo, both employing the same cylindrical nanomagnet with rounded edges. For the cantilever, where forces are strongest at the magnet's tangential point to the $y$ direction, the PSF has its maximum contribution in this region near the magnet's surface and decays rapidly with increasing distance \[@Fig:1\(c)\]. In contrast, the membrane is susceptible to forces $prop partial B_z \/ partial z$, and the strongest gradients inside the resonance slice are located over the center of the magnet \[@Fig:1\(d)\]. Although the maximum gradient of the membrane-based setup is smaller compared to the cantilever-based setup, it decreases more slowly with distance from the surface, thereby enhancing the signal contribution of distant parts of the sample.

The total force variance detected by the sensor at a fixed position of the resonator $upright(bold(r))_i = \( x_i \, y_i \, z_i \)$ with respect to the magnetic field gradient source is given by the three-dimensional sum over all magnetic moments $ sigma_(upright(t o t))^2 \( upright(bold(r))_i \) = sum_(upright(bold(r))) H \( upright(bold(r)) \) rho_(upright(s p i n)) \( upright(bold(r)) - upright(bold(r))_i \) + sigma_(upright(n o i s e))^2 \, $<eq:spin_reponse> where $sigma_(upright(n o i s e))^2$ represents additive measurement noise consisting of two primary sources. The first source arises from the thermomechanical force noise of the mechanical resonator, which can be modeled as a stochastic force with variance $sigma_(upright(t h))^2 = 4 k_(upright(B)) T m Gamma Delta f$. Here, $k_(upright(B))$ is the Boltzmann constant, $T$ is the resonator mode temperature, $m$ the mode mass, and $Delta f$ the measurement bandwidth. The dissipation coefficient $Gamma = omega_0 \/ Q$ (with $Q$ the quality factor and $omega_(upright(0))$ the angular resonance frequency) is a key figure of merit for mechanical resonators, describing the ratio of the resonator's total energy to the energy lost per oscillation. Together with the mass, it is a primary optimization parameter in the development of improved resonator geometries to minimize thermomechanical force noise.

The second source of uncertainty stems from the fact that the detected quantity is an estimated force variance. Within a finite measurement time $T_(upright(m))$, this estimator has an intrinsic uncertainty, governed by the spin noise correlation time $tau_(upright(m))$~@degen_role_2007@slichter_principles_1996. The resulting total measurement uncertainty is~@degen_role_2007 $ sigma_(upright(n o i s e))^2 approx (frac(2, T_(upright(m)) / tau_(upright(m)) - 1))^(1 \/ 2) (sigma_(upright(s p i n))^4 + 2 sigma_(upright(t h))^2 sigma_(upright(s p i n))^2 + 2 sigma_(upright(t h))^4)^(1 \/ 2) \, $<eqn:noise> where $T_(upright(m)) \/ tau_(upright(m))$ is the number of independent spin configurations sampled per measurement. \

To account for the discrete sampling inherent to MRFM scanning experiments and to simplify the subsequent description of algorithms, we adopt a matrix notation. We describe the measurement volume using a regular grid of points $upright(bold(r))_(i \, j \, k) = \( x_i \, y_j \, z_k \)$, where $i in \[ 1 \, n_x \] \, j in \[ 1 \, n_y \] \, k in \[ 1 \, n_z \]$. Here, $n_x \, n_y \, n_z$ are the number of grid points along the $x$, $y$, and $z$ direction, respectively. Evaluating $H \( upright(bold(r)) \)$ at every grid point results in the three-dimensional matrix $upright(bold(H))$ of size $\( n_x \, n_y \, n_z \)$ with entries $H_(i \, j \, k) = H \( upright(bold(r))_(i \, j \, k) \)$. In the same way, matrices are defined for the sample's local spin density $upright(bold(O))$ with entries $O_(i \, j \, k) = rho_(upright(s p i n)) \( upright(bold(r))_(i \, j \, k) \)$ and the measured force variance $upright(bold(I))$ with $I_(i \, j \, k) = sigma_(upright(t o t))^2 \( upright(bold(r))_(i \, j \, k) \) .$

== XYZ Scan

<xyz-scan>

In a conventional MRFM experiment, the magnetic field gradient source is scanned relative to the sample on a regularly spaced three-dimensional grid~@degen_nanoscale_2009@krass_force-detected_2022, which we refer to as an 'XYZ scan'. At each point on this grid, a single measurement of duration $T_(upright(m))$ is performed, during which the same rf inversion pulse (fixed $f_0$ and $f_(upright(B W))$), that defines a single resonant slice, is applied, cf. Sec.~@sec:single_point. The resulting scan is described by $ upright(bold(I))_(upright(X Y Z)) = upright(bold(H)) star.op_(\( x \, y \, z \)) upright(bold(O)) + bold(eta) \, $<eq:xyz> where $upright(bold(I))_(upright(X Y Z))$ denotes the recorded measurement data, $star.op_(\( x \, y \, z \))$ is the three-dimensional convolution operator and $bold(eta)$ with $eta_(i \, j \, k) = sigma_(upright(n o i s e))^2 \( r_(i \, j \, k) \)$, is voxel-wise additive noise as described in Eq.~#link(<eqn:noise>)[\[eqn:noise\]]. \

A key design consideration for such an MRFM experiment is the selection of the spin inversion pulse parameters. The inversion bandwidth $f_(upright(B W))$ determines the width of the resonant slice, while the center frequency $f_0$ influences the maximum distance from the nanomagnet's surface at which spin inversions occur. On the one hand, $f_0$ must be chosen such that the PSF extends at least beyond the sum of the sample diameter and the minimum standoff distance. On the other hand, if the PSF extends too far, the magnetic field gradients become very small, reducing the signal contribution from individual spins. This imposes a trade-off between scan depth and sensitivity.

== Multislice Scan

<multislice-scan>

In the following, we propose an alternative scanning protocol, termed the 'multislice scan', that better addresses the trade-off between the scan depth and sensitivity. In this protocol, we scan the gradient source only in a single $\( x \, y \)$ plane, rather than a series of planes at different $z$-heights. At each grid position within this plane, $n_(upright(f))$ subsequent measurements are made, each utilizing a spin inversion pulse with a unique combination of center frequency $f_(0 \, upright(l))$ and inversion bandwidth $f_(upright(B W \, l))$. This produces $n_(upright(f))$ different data points according to Eq.~@eq:spin_reponse for each position $\( x_i \, y_j \)$ on the $\( x \, y \)$ plane, corresponding to the response of the sample to the $n_(upright(f))$ PSFs of the spin inversion pulses. Previously, MRFM scanning protocols utilized multiple inversion pulses~@zuger_threedimensional_1996@wago_paramagnetic_1998@tsuji_three_2006 in a geometry where different pulse frequencies can be approximated as a shift of the resonance slice in the $z$-direction. In contrast, our geometry leads to different PSF shapes for different pulse frequencies. This makes it necessary that we recompute the PSF for the parameters of each applied inversion pulse.

The multislice scan is described in matrix notation by

$ upright(bold(I))_(upright(M S) \, l) = sum_(z = 1)^(n_z) upright(bold(H))^l star.op_(\( x \, y \)) upright(bold(O)) + bold(eta) \, $<eq:multislice> where $upright(bold(I))_(upright(M S))$ is the measurement matrix of size $\( n_x \, n_y \, n_f \)$ with $upright(bold(I))_(upright(M S) \, l)$ being the $l$-th $\( x \, y \)$ plane of this matrix, $upright(bold(H))^l$ is the matrix corresponding to the PSF of the $l$-th inversion pulse parameter set, and $star.op_(\( x \, y \))$ denotes the slice-wise two-dimensional convolution along the $\( x \, y \)$-plane. The individual entries of the measurement matrix $upright(bold(I))_(upright(M S))$ are given by $ I_(upright(M S) \, i \, j \, l) = sum_(i' = 1)^(n_x) sum_(j' = 1)^(n_y) sum_(k = 1)^(n_z) H_(i - i' \, j - j' \, k)^l O_(i' \, j' \, k) + sigma_(upright(n o i s e))^2 $

Compared to the XYZ scan using a fixed resonance slice, the multislice scanning protocol offers significant advantages. Most notably, it overcomes the trade-off between extending the PSF far into the $z$ direction and achieving high signal contributions from individual spins. In the multislice method, for each height $z$, we can use the rf pulse parameters that generate the optimal resonant slice, which is the one containing the highest gradient for measuring spins at that particular height. In addition, the measurement efficiency is improved by reducing the number of different scanning positions, thereby reducing the need for resonator recalibration steps due to interactions with the nanomagnet surface~@krass_force-detected_2022@pachlatko_nanoscale_2024@heritier_spatial_2021. Finally, keeping the resonator stationary during the $n_(upright(f))$ measurements allows for a prolonged estimation of the resonator's thermomechanical force noise. The resulting total measurement uncertainty, as derived in Appendix~@app:nosie_est, is given by $ sigma_(upright(n o i s e))^2 approx & (frac(2, T_(upright(m)) / tau_(upright(m)) - 1))^(1 \/ 2)\

 & (sigma_(upright(s p i n))^4 + 2 sigma_(upright(t h))^2 sigma_(upright(s p i n))^2 + (1 + 1 / n_f) sigma_(upright(t h))^4)^(1 \/ 2) . $<eq:noisepoint> Compared with Eq.~#link(<eqn:noise>)[\[eqn:noise\]], the coefficient of the last term $prop sigma_(upright(t h))^4$ decreases from $2$ to $(1 + 1 / n_(upright(f)))$, leading to a noise reduction of up to a factor two in the case $n_(upright(f)) gt.double 1$.

== Compressed Sensing

<sec:compressed>

Both the XYZ and multislice scanning protocols measure a convolution of the sample with smooth and spatially extended PSFs. In Fourier space, this filter-like behavior results in the integrated signal power of the PSF being concentrated in a limited number of Fourier coefficients. As the convolution is a point-wise multiplication in the Fourier domain, the fully sampled measurement data $upright(bold(I))$ is sparse in the Fourier domain as well. Compressed sensing is a signal processing technique~@donoho_compressed_2006@candes_robust_2006 exploiting this sparsity to shorten the acquisition times by recovering the full measurement from a sub-sampled measurement. It is used in various scanning probe and imaging techniques~@andersson_non-raster_2012@oppliger_sparse_2020@ye_compressed_2019.

We realize an incoherent sampling pattern by sampling each voxel with probability $p < 1$, which produces a binary sampling mask $upright(bold(W))$. Applying this mask to the measurement matrix we obtain the acquired subset $upright(bold(I))_(upright(p)) = upright(bold(W)) ⊙ upright(bold(I))$, where $⊙$ is the point-wise multiplication operator. \

To recover non-sampled data points, we search for the measurement $upright(bold(I))$ that is sparsest in the Fourier domain while remaining compatible with the acquired data $upright(bold(I))_(upright(p))$. Directly minimizing the $ell_0$ pseudo-norm $lr(bar.v.double cal(F) upright(bold(I)) bar.v.double)_0$ is an infeasible combinatorial task. Instead, the convex $ell_1$ norm is used, leading to the 'basis pursuit denoising' problem~@natarajan_sparse_1995 $  & upright(bold(I^(*))) = arg min_(upright(bold(I))) ∥cal(F) upright(bold(I))∥_1\

 & upright("subject to") quad med lr(bar.v.double upright(bold(W)) ⊙ upright(bold(I)) - upright(bold(I_p)) bar.v.double)_2^2 lt.eq zeta \, $<eq:spare_rec> where $cal(F)$ is the 3D discrete Fourier transform and $zeta$ is a tolerance that accounts for the measurement noise $bold(eta)$. \

We solve Eq.~@eq:spare_rec with the SPGL1 software package~@berg_spgl1_2019 which implements a spectral projected-gradient algorithm to solve large-scale $ell_1$-regularized problems~@van_den_berg_probing_2009. In addition to reducing the acquisition time by a factor $approx 1 \/ p$, compressed sensing recovery also denoises the data, due to the measurement uncertainty $sigma_(upright(n o i s e))^2$ mostly being independent between sampling points and therefore not sparse in the Fourier basis. It is consequently suppressed by the $ell_1$ regularization.

= Reconstruction Method

<sec:reconstruction>

To recover an image of the scanned sample from the measurement data, one must employ a suitable reconstruction algorithm. In particular, as the scan protocols described by Eqs~#link(<eq:xyz>)[\[eq:xyz\]] and #link(<eq:multislice>)[\[eq:multislice\]] rely on convolutions, a deconvolution step is required to recover the sample $upright(bold(O))_(upright(G T))$ from the measurement $upright(bold(I))$. This problem can be formulated as a least squares minimization task, $ tilde(upright(bold(O))) = arg min_(upright(bold(O)) gt.eq 0) ∥upright(bold(I)) - upright(bold(tilde(I)))∥_2^2 \, $<eq:optimization> where the solution is the non-negative sample $tilde(upright(bold(O))) gt.eq 0$ that minimizes the two-norm error $lr(bar.v.double upright(bold(I)) - upright(bold(tilde(I))) bar.v.double)_2^2 = sum_(i \, j \, k) \( upright(bold(I))_(i \, j \, k) - upright(bold(tilde(I)))_(i \, j \, k) \)^2$ with respect to the measurement. Iterative algorithms based on the Landweber iteration~@landweber_iteration_1951 have been applied for the reconstruction of large scale three-dimensional MRFM measurements~@degen_nanoscale_2009@zuger_first_1993. Although this approach yields acceptable results, large measurement uncertainties lead to slow convergence and large reconstruction errors, cf. Appendix~@app:Landweber.

An approach to improve the reconstruction is the use of an additional regularization term. Here, we choose the isotropic total variation $upright(T V) \( upright(bold(O)) \) = sum_(i \, j \, k) ∥Delta \[ O \] \( i \, j \, k \)∥_2$, where $Delta \[ O \] \( i \, j \, k \)$ is the difference vector along each direction, cf. Appendix~@app:admm. This term penalizes the sum of the Euclidean norm of the samples gradient vectors. It affects the reconstructed sample by smoothing out noise in regions of homogeneous spin density while preserving the sharp edges of the samples features. This is important to avoid overfitting of noisy data. The regularized problem for our multislice protocol is given by $ tilde(upright(bold(O))) = arg min_(upright(bold(O)) gt.eq 0) [∥upright(bold(I)) - upright(bold(tilde(I)))∥_2^2 + upright(T V) \( upright(bold(O)) \)] \, $<eq:optimization_ext>

#figure(image("source/Figures/Object2.pdf", width: 100%),

  caption: [Mid-plane of the spin density ground truth $upright(bold(O))_(upright(G T))$ of the spherical test. The object has a diameter of $40 med upright("n") upright("m")$ and a mean hydrogen spin density of $60 med upright("/") upright("n") upright("m")^3$. The spin density varies with a standard deviation of $sigma = 18.9 med upright("/") upright("n") upright("m")^3$ over a characteristic distance of $5 med upright("n") upright("m")$. The inset shows the three-dimensional position of the displayed slice in the sample.],
) <Fig:2>

To obtain $tilde(upright(bold(O)))$, we apply the alternating direction method of multipliers (ADMM)~@boyd_distributed_2010@eckstein_douglasrachford_1992@chen_direct_2016. This approach decomposes the problem in Eq.~#link(<eq:optimization_ext>)[\[eq:optimization\_ext\]] into smaller subproblems that individually optimize the different terms of Eq.~#link(<eq:optimization_ext>)[\[eq:optimization\_ext\]]. The subproblems are solved sequentially, while ensuring consistency between the subproblems after each step. A detailed description of this algorithm is presented in Appendix~@app:admm.

Finally, to quantify the reconstruction fidelity, we compute the root-mean square error (RMSE) between the reconstructed volume $upright(bold(tilde(O)))$ and the ground truth $upright(bold(O))_(upright(G T))$ $ upright(R M S E) \( upright(bold(O))_(upright(G T)) \, upright(bold(tilde(O))) \) = sqrt(1 / N sum_(upright(bold(r))) (upright(bold(O))_(upright(G T)) - upright(bold(tilde(O))))^2) \, $<eq:error> where $N = n_x n_y n_z$ for the XYZ protocol or $N = n_x \, n_y n_f$ for the multislice protocol is the total voxel count.

= Results

<sec:res>

We evaluate the impact of different setup geometries and scanning protocols by comparing the reconstructed spin distributions of simulated MRFM scans against the known 'ground truth', that is, the original spin density in the sample $upright(bold(O))_(upright(G T))$, see @Fig:2. Key simulation parameters used are summarized in @tab:1.

#figure(
  table(

    columns: 3,

    align: (left, center, center),

    table.header([Parameter], [Symbol], [Value],),

    table.hline(),

    [Scan step size (nm)], [$Delta \( x \, y \, z \)$], [$1$],

    [Measurement bandwidth (Hz)], [$f_(upright(m e a s))$], [$40$],

    [Sample diameter (nm)], [$d_(upright(O))$], [$40$],

    [Mean sample spin density (nm#super[-3])], [$overline(rho)_(upright(s p i n))$], [$60$],

    [Sample density variation (nm#super[-3])], [$sigma_(upright(rho))$], [$18.9$],

    [Mechanical force noise density (aN~#super[−1]~Hz)], [$S_(upright(t h))$], [$10$],

    [Spin correlation time (ms)], [$tau_(upright(m))$], [20],

    [Nanomagnet diameter (nm)], [$d_(upright(m a g))$], [100],

    [Nanomagnet edge radius (nm)], [$r_(upright(e d g e))$], [10],

    [Nanomagnet magnetization (T)], [$M_(upright(s a t))$], [1.35],

    [Nanomagnet FEM grid size (nm)], [$d_(upright(F E M))$], [0.4],

    [Minimum standoff distance (nm)], [$z_(upright(m i n))$], [15],

    [External magnetic field (T)], [$B_0$], [3],

  ),
  caption: [Simulation Parameters],
) <tab:1>

For a direct comparison, both cantilever and membrane geometries are assigned the same thermomechanical force noise power spectral density (PSD), $S_(upright(t h)) = 10 thin upright(a N) \/ sqrt(upright(H z))$ (see @tab:1). While this is a typical value achieved in experiments utilizing ultrasensitive cantilevers, we note that advanced membrane and string resonators have demonstrated force noise PSDs that are several orders of magnitude lower~@eichler_ultra-high-q_2022. All simulations maintain a minimum standoff distance $z_(upright(m i n)) = 15 med upright("n") upright("m")$ to account for experimental constraints regarding non-contact interactions between the resonator and surface~@krass_force-detected_2022@heritier_spatial_2021. We note that membrane-based scanning probe setups have recently demonstrated stable operation at separations down to 1~nm~@halg_membrane-based_2021.

#figure(image("source/Figures/CombinedIntegrationTimeFullWidthNew.pdf", width: 100%), placement: auto, scope: "parent",

  caption: [Comparison of scanning protocols. (a-d) Mid-plane $\( x \, y \)$ slices of the reconstructed three-dimensional volumes for an effective integration time of $T_(upright(m)) = 30 med upright("s")$ per measurement point (at the reconstruction iteration that produces minimal RMSE error). (a-b) utilize cantilever resonators with the XYZ scanning protocol (a) and the proposed multislice protocol (b). (c-d) employs membrane resonators, again following the XYZ (c) and multislice (d) protocols. In (e) reconstruction results are compared between scanning protocols and measurement geometries for resonators with thermal force noise density of $S_(upright(F)) = 10 med upright("a") upright("N") upright("/") √ upright("Hz")$ over varying measurement times $T_(upright(m))$. (f) shows the reconstruction error using the membrane geometry and the multislice scanning protocol \[blue line in (e)\] for resonators with decreasing $S_(upright(t h))$ between $S_(upright(t h)) = 10 med upright("a") upright("N") upright("/") √ upright("Hz")$ and $S_(upright(t h)) = 0 med upright("a") upright("N") upright("/") √ upright("Hz")$, with decrements of $2 med upright("a") upright("N") upright("/") √ upright("Hz")$.],
) <Fig:ProtRes>

The test sample used in this study has a spherical shape, chosen to emulate biologically relevant specimens (e.g. viruses or proteins). The spherical volume is filled with a spatially varying density $rho_(upright(s p i n))$ of nuclear spins to showcase the performance of the proposed algorithms for non-homogeneous samples. @Fig:2 illustrates the sample geometry and spin-density distribution. For all simulated scans, the inversion pulse center frequencies $f_(0 \, l) \, med l = 1 \, dots.h \, n_f$, are tuned to contain at least one resonant slice extending beyond 70~nm from the magnet surface, ensuring complete coverage of the spherical sample.

== Resonator Geometries

<resonator-geometries>

Utilizing the pendulum-style cantilever geometry, we benchmark the reconstruction performance of the XYZ and multislice protocols for integration times $T_(upright(m))$ ranging from $1 med upright("s")$ to $300 med upright("s")$ per data point. For the XYZ protocol, we employ a single inversion pulse with center frequency $f_0 = 133.9 med upright("M") upright("Hz")$ and bandwidth $f_(upright(B W)) = 500 med upright("k") upright("Hz")$. The multislice protocol is comprised of $n_(upright(f)) = 46$ pulses with center frequencies $f_(0 \, k)$, corresponding to resonance slices extending between $24 med upright("n") upright("m")$ and $70 med upright("n") upright("m")$ from the nanomagnet's surface with $1 med upright("n") upright("m")$ steps and uniform pulse bandwidths of $f_(upright(B W)) = 500 med upright("k") upright("Hz")$. The used pulse parameters are listed in Appendix @app:IPP. This results in both protocols acquiring approximately the same number of signal-bearing points.

We apply the ADMM-based reconstruction algorithm with heuristically determined hyper-parameters to the simulated measurements. @Fig:ProtRes\(a) shows the $\( x \, y \)$ mid-plane of the reconstructed spin distribution from the scan utilizing the XYZ scanning protocol and an integration time of $T_(upright(m)) = 30 med s$ per data point. While the sample's spherical shape and average spin density are recovered, its radius is underestimated and nearly all internal density information is lost.

The fully sampled multislice scanning protocol produces the reconstructed spin density shown in @Fig:ProtRes\(b). Clearly, this method improves the estimation of the sample's radius and the internal structure of the object. However, compared to the ground truth, small, spatially localized features are still lacking in fidelity, as these are effectively averaged by the PSF. This makes their contributions very small and therefore highly susceptible to measurement noise.

Repeating the same analysis for data simulated with a membrane-style resonator yields the results shown in @Fig:ProtRes\(c-d). To match the spatial volume covered by the resonant slices of the cantilever scans, the same center frequencies $f_(0 \, k)$ as in the cantilever case are used. @Fig:ProtRes\(c) shows the mid-plane of the reconstructed spin distribution for the XYZ protocol. Compared to the cantilever geometry, the reconstruction recovers the radius of the spherical shape more accurately, but internal density variations remain largely unresolved. In the multislice reconstruction in @Fig:ProtRes\(d), the recovery of the sample's outer shape and average density are strongly improved. Here, the local spin density fluctuations are captured with slightly higher fidelity than in the cantilever case.

@Fig:ProtRes\(e) quantifies the differences in reconstruction fidelity between scanning protocols and resonator geometries, by plotting the RMSE between reconstruction and ground truth \[see @Fig:2\] for varying integration times $T_(upright(m))$. The XYZ protocol (dashed lines) produces the highest errors throughout for both resonators. Mostly, two factors contribute to this effect. First, the single resonance slice encompasses weaker magnetic field gradients than other protocols, as described in Sec.~@sec:image_protocols. Second, the single smooth and spatially extended PSF limits sensitivity to intra-volume spin variations. Once the voxel integration time exceeds $T_(upright(m)) > 60 med upright("s")$, improvements in the RMSE of the reconstruction plateau, as the regularization term in Eq.~#link(<eq:optimization_ext>)[\[eq:optimization\_ext\]] introduces a fixed bias in the solution. By contrast, the multislice scanning protocol (solid lines) consistently achieves a lower RMSE and follows as $upright("RMSE") prop T_(upright(m))^(- 0.145 plus.minus 0.001)$ for the cantilever and $upright("RMSE") prop T_(upright(m))^(- 0.163 plus.minus 0.006)$ for the membrane resonators respectively. However, although the RMSE of the multislice protocol decreases slightly faster than that of the XYZ protocol, both decrease slower as a function of $T_(upright(m))$ than the measurement uncertainty $sigma_(upright(n o i s e))^2 prop T_(upright(m))^(- 0.5)$ of an individual data point \[see Eq.~@eq:noisepoint\]. We speculate that the slow decrease in RMSE reflects the ill-conditioning of our measurement problem (see Appendix @app:ill-cond).

When comparing the reconstruction across scanning protocols in @Fig:ProtRes\(e), the membrane and cantilever geometries show similar reconstruction performance for all integration times under the multislice sampling scheme, and achieve comparable bias-limited accuracies in the XYZ protocol at long integration times. The minor gain in reconstruction fidelity of the scans utilizing the multislice technique and membrane resonators indicates a less ill-posed inverse problem than for the cantilever geometry.

A further potential advantage of modern membrane-style resonators is the reduced thermomechanical force-noise PSD $S_(upright(t h))$, translating into lower reconstruction errors. As $S_(upright(t h))$ decreases, the thermomechanical noise term $sigma_(upright(t h))^2$ in the point-wise noise model \[Eq.~#link(<eq:noisepoint>)[\[eq:noisepoint\]]\] becomes negligible and the total measurement uncertainty $sigma_(upright(n o i s e))^2$ becomes increasingly dominated by the standard error in the spin-force variance $sigma_(upright(s p i n))^2$. @Fig:ProtRes\(f) illustrates this trend for multislice membrane simulations, with parameters identical to those used in @Fig:ProtRes, except for sweeping $S_(upright(t h))$ from $S_(upright(t h)) = 10 med upright("a") upright("N") upright("/") √ upright("Hz")$ to $S_(upright(t h)) = 0 med upright("a") upright("N") upright("/") √ upright("Hz")$ in decrements of $2 med upright("a") upright("N") upright("/") √ upright("Hz")$. The RMSE continues to decrease up to $S_(upright(t h)) = 2 med upright("a") upright("N") upright("/") √ upright("Hz")$, below which the error plateaus, since the total uncertainty $sigma_(upright(n o i s e))$ is dominated by the standard error of the spin-force variance. For this reason, no significant further benefit is obtained even for a hypothetically noiseless resonator (c.f. blue trace) for this spin ensemble size. However, the value of $S_(upright(t h))$ at which the plateau occurs depends on the scan's voxel size and the spin density of the sample. Imaging smaller or less dense features requires the ability to discern smaller spin force differences $Delta sigma_(upright(s p i n))^2$, making smaller $S_(upright(t h))$ more beneficial. In practice, the uncertainty of a single measurement point in the XYZ scanning protocol $sigma_(upright(n o i s e))^2$ (see Eq.~#link(<eqn:noise>)[\[eqn:noise\]]) is dominated by the standard error of the spin force variance whenever $sigma_(upright(t h))^2 < 1 / 2 Delta sigma_(upright(s p i n))^2 \( sqrt(7) - 1 \)$, see Eq.#link(<eq:SExyz>)[\[eq:SExyz\]] in Appendix~@app:nosie_est.

#figure(image("source/Figures/CompressedSensingFullWidth.pdf", width: 100%), placement: auto, scope: "parent",

  caption: [Impact of compressed sensing on the multislice scanning protocol. (a) Mid-plane of the spin density ground truth. (b-f) Mid-plane $\( x \, y \)$ slices of reconstructed volume, obtained by applying compressed sensing to a simulated measurement employing membrane resonators, a data point integration time of $T_(upright(m)) = 60 med s$, and sampling ratios (b) $p = 1$, (c) $p = 1 \/ 2$, (d) $p = 1 \/ 3$, (e) $p = 1 \/ 6$, and (f) $p = 1 \/ 10$. (g) Relative reconstruction errors of the sub-sampled measurement compared to a scan with identical point integration times $T_(upright(m))$ and sampling ratio $p = 1$.],
) <Fig:CompRes>

== Compressed Sensing

<compressed-sensing>

Incorporating compressed sensing into the membrane multislice protocol (c.f. Sec.~@sec:compressed) results in the reconstructions summarized in @Fig:CompRes. We used simulation and reconstruction parameters identical to those in @Fig:ProtRes\(d), but adopted a fixed point-integration time $T_(upright(m)) = 60 med s$ and sub-sampled the scanning grid with a decreasing sampling ratio $p$. The resulting mid-planes of the reconstructions are presented in @Fig:CompRes\(a-d). No significant change is observed between the results recovered from the fully sampled simulation \[@Fig:CompRes\(b)\] and sub-sampling the identical dataset with $p = 1 \/ 2$ in @Fig:CompRes\(c). However, for lower sampling ratios \[$p = 1 \/ 3$ in (d) and $p = 1 \/ 6$ in (e)\], the fidelity of internal features is visibly degraded.

At a sampling ratio of $p = 1 \/ 2$ and $T_(upright(m)) = 60 med s$ the RMSE between the recovered sample and the ground truth is reduced by $approx 20 %$ relative to the fully sampled case of @Fig:ProtRes\(d) using a point integration time of $T_(upright(m)) = 30 med s$, despite both experiments sharing the same total acquisition time, $N T_(upright(m \, e f f)) = N p T_(upright(m)) = \( N \/ 2 \) 60 med upright("s")$. This improvement likely stems from the longer integration time and therefore higher SNR of individual measurements in the subsampled case and the denoising benefit of the compressed‐sensing technique, which together enhance the fidelity of fine internal features while suppressing noise.

@Fig:CompRes\(g) quantifies the RMSE as a function of the sampling ratio. For $T_(upright(m)) = 60 med s$, the RMSE remains at or below the value of the fully sampled case for $p gt.eq 0.5$ and increases for a further decrease in the number of sampled measurement points. The same trend holds for the integration times per point of $T_(upright(m)) = 15 med s$ and $T_(upright(m)) = 300 med s$. Because the compressed sensing algorithm used reconstructs a sparse Fourier representation $upright(bold(I))$ from the subsampled data $upright(bold(I))_(upright(p))$, consistent behavior across $T_(upright(m))$ indicates that performance is limited by the intrinsic sparsity of the measurement itself. This is determined by the interplay between the ground-truth sample used in these simulations and the point-spread functions employed in the multislice scheme.

= Outlook

<outlook>

Overall, membrane-style resonators that oscillate along the $z$-axis have emerged as a promising alternative to pendulum-style cantilever geometries. We have shown that even under identical operating conditions (force noise, standoff distances, and magnetic gradient), membranes deliver equal or better reconstruction fidelity than cantilevers. Further gains should be attainable by exploiting the smaller stand-off distance that membrane resonators can tolerate, which increases the available magnetic field gradients, and by optimizing the magnetic field gradient sources to define more well-conditioned reconstruction problems. In the future, membrane resonators are also expected to yield thermal force noises smaller than that of cantilevers, owing to their excellent quality factors and low optical absorption. Because the success of nuclear spin detected MRFM ultimately depends on reconstructing large-scale three-dimensional data sets with high fidelity, improvements in resonator design must be paired with improved scanning protocols. In this regard, the multislice protocol provides a promising approach. Its acquisition speed can be pushed further by combining it with MRFM phase-multiplexing techniques~@moores_accelerated_2015, allowing for parallel recording of the response to multiple inversion slices. The achievable speed-up is, however, limited by the rf power required to drive multiple slices in parallel, as increased power results in a tradeoff between the resonators mode temperature and higher parallelization. To improve on this problem, novel approaches to perform MRFM detection can be utilized~@visani_near-resonant_2025@halg_strong_2022. Taking conservative assumptions, we project a cumulative acceleration factor of 100 combining all these approaches compared to three-dimensional MRFM scanning experiments utilizing the XYZ scanning protocol~@degen_nanoscale_2009. This speed-up consists of a factors $5$ from using the multislice scanning protocol, a factor $2$ from compressed sensing, a factor $3$ from replacing cantilevers with membrane-type resonators (see @Fig:ProtRes), and a factor $4$ from phase multiplexing. The exact gain will scale with the sample geometry, resonator properties, and the implemented magnetic field gradient source.

Finally, by augmenting the proposed reconstruction algorithm with a sparsity-enforcing regularizer, we could unify reconstruction and compressed sensing into a single optimization problem. This approach is particularly well suited for imaging inherently sparse samples, such as electron-spin--labeled biological structures.

#heading(level: 1, numbering: none)[Acknowledgment]

<acknowledgment>

We gratefully acknowledge fruitful discussions with Raffi Budakian, Fabian Natterer, Ender Konukoglu, Raphael Pachlatko, Diego Visani, and Vincent Dumont. This work was supported by the Swiss National Science Foundation (CRSII5\_177198/1 and 200021\_200412/1) and an ETH Zurich Research Grant (ETH-51 19-2).

#bibliography("references.bib", title: none, style: "american-physics-society")
]

#pagebreak()
#align(center, text(size: 14pt, weight: "bold")[Supplementary information])
#set heading(numbering: "A.1.a")
#counter(heading).update(0)
#set math.equation(numbering: "(A1)")
#counter(math.equation).update(0)

= Combined Noise Estimates

<app:nosie_est>

To determine the number of spins undergoing inversion due to an applied rf-inversion pulse, we record both quadratures of the resonator motion using a lock-in amplifier. After an appropriate phase rotation, the two quadratures correspond to the in phase and out of phase components with respect to the periodic spin-inversions. Their variances are $ sigma_(upright(i n))^2 = sigma_(upright(s p i n))^2 + sigma_(upright(t h))^2 $$ sigma_(upright(o u t))^2 = sigma_(upright(t h))^2 $ Here, $sigma_(upright(s p i n))^2$ is the force variance caused by the fluctuations of the inverted spin populations, while $sigma_(upright(t h))^2$ is the resonators intrinsic thermomechanical force noise. For the multislice detection scheme described in this paper, $n_(upright(f))$ sequential measurements of duration $T_(upright(m))$ are performed at each position of the resonator along the $\( x \, y \)$ scanning grid. If $f_(upright(B W)) > 2 Delta f_0$ each measurement addresses a spatial distinct inversion slice resulting in $sigma_(upright(s p i n))^2$ being an independent quantity. Each measurement yields $T_(upright(m)) \/ tau_(upright(m))$ statistically independent samples, where $tau_(upright(m))$ is the correlation time of the spin ensemble. Therefore the standard error of the in phase quadrature is described by $ upright("SE") \( sigma_(upright(i n))^2 \) = sqrt(frac(2, T_(upright(m)) / tau_(upright(m)) - 1) (sigma_(upright(s p i n))^2 + sigma_(upright(t h))^2)^2) . $<eq:SEin> In contrast, the change in the thermomechanical force noise $sigma_(upright(t h))^2$ is dominated by non-contact interaction between the resonator and the surface of the magnetic field gradient source and therefore stays constant during the $n_(upright(f))$ measurements performed at the same position. Combining the $n_(upright(f))$ out of phase estimates thus reduces its standard error to $ upright("SE") \( sigma_(upright(o u t))^2 \) = sqrt(frac(2, n_(upright(f)) T_(upright(m)) / tau_(upright(m)) - 1)) sigma_(upright(t h))^2 . $<eq:SEout> Under the assumption of independence between $sigma_(upright(s p i n))^2$ and $sigma_(upright(t h))^2$ the unbiased estimator of the spin signal is given by $sigma_(upright(s p i n))^2 = sigma_(upright(i n))^2 - sigma_(upright(o u t))^2$. Propagating the uncertainties in Eqs.~#link(<eq:SEin>)[\[eq:SEin\]]-#link(<eq:SEout>)[\[eq:SEout\]] gives the standard error of the spin signal $ upright("SE")_(upright(M S)) \( sigma_(upright(s p i n))^2 \) & = sqrt((upright("SE") (sigma_(upright(i n))^2)^2 + upright("SE") (sigma_(upright(o u t))^2)^2))\

 & = sqrt(frac(2, T_(upright(m)) / tau_(upright(m)) - 1) \( sigma_(upright(s p i n))^4 + sigma_(upright(t h))^4 + 2 sigma_(upright(s p i n))^2 sigma_(upright(t h))^2 \) + frac(2, T_(upright(m)) / tau_(upright(m)) n_(upright(f)) - 1) sigma_(upright(t h))^4) $<eq:SEspin> and the resulting signal-to-noise ratio (SNR) of the multislice protocol $ upright("SNR")_(upright(M S)) = frac(sigma_(upright(s p i n))^2, upright("SE") \( sigma_(upright(s p i n))^2 \)) & = [frac(2, T_(upright(m)) / tau_(upright(m)) - 1) (1 + 2 sigma_(upright(t h))^2 / sigma_(upright(s p i n))^2 + sigma_(upright(t h))^4 / sigma_(upright(s p i n))^4) + frac(2, T_(upright(m)) / tau_(upright(m)) n_(upright(f)) - 1) (sigma_(upright(t h))^4 / sigma_(upright(s p i n))^4)]^(- 1 \/ 2)\

 & approx sqrt(frac(T_(upright(m)) / tau_(upright(m)) - 1, 2)) (1 + 2 sigma_(upright(t h))^2 / sigma_(upright(s p i n))^2 + (1 + 1 / n_(upright(f))) sigma_(upright(t h))^4 / sigma_(upright(s p i n))^4)^(- 1 \/ 2) $ For comparison, the standard error and SNR for each measurement point in the XYZ protocol is given by Degen #emph[et al.]~@degen_role_2007 $ upright("SE")_(upright(X Y Z)) \( sigma_(upright(s p i n))^2 \) = sqrt(frac(2, T_(upright(m)) / tau_(upright(m)) - 1) \( sigma_(upright(s p i n))^4 + 2 sigma_(upright(t h))^4 + 2 sigma_(upright(s p i n))^2 sigma_(upright(t h))^2 \)) \; $<eq:SExyz> $ upright("SNR")_(upright(X Y Z)) = sqrt(frac(T_(upright(m)) / tau_(upright(m)) - 1, 2)) (1 + 2 sigma_(upright(t h))^2 / sigma_(upright(s p i n))^2 + 2 sigma_(upright(t h))^4 / sigma_(upright(s p i n))^4)^(- 1 \/ 2) . $ @Fig:AppdxSNR, plots the ratio of $upright("SNR")_(upright(M S))$ to $upright("SNR")_(upright(X Y Z))$ as a function of $r_(upright(v a r)) = sigma_(upright(s p i n))^2 \/ sigma_(upright(t h))^2$ and the number of slices $n_(upright(f))$. When the spin fluctuations dominates ($r_(upright(v a r)) gt.tilde 3$) the improvement is negligible due to the signal uncertainty being limited by the finite sampling of the spin fluctuations. In the thermal noise limited regime, an improvement of up to $approx 30 %$ is obtained for realistic $n_(upright(f))$ values. Achieving the same gain by extending $T_(upright(m))$ instead would require a $approx 70 %$ longer acquisition time.

#figure(image("source/Figures/AppdxSNR.pdf", width: 52%),

  caption: [Computed multislice SNR enhancement as a function of the variance ratio $r_(upright(v a r)) = sigma_(upright(s p i n))^2 \/ sigma_(upright(t h))^2$ for several values of addressed inversion slice $n_(upright(f))$ per resonator position.],
) <Fig:AppdxSNR>

= Reconstruction <app:admm>

#set math.equation(numbering: "(B1)")
#counter(math.equation).update(0)

== Problem Definition

<problem-definition>

As described in Section @sec:reconstruction, MRFM scans $upright(bold(I))$ are related to the underlying three-dimensional spin distribution $upright(bold(O))$ via a linear model determined by the measurement protocols (see Eqs.~@eq:xyz through @eq:multislice). To recover the spin distribution $upright(bold(O))$ from the measurement requires thereby a reconstruction process. In principle, one could invert these linear operators to recover it, but in practice the problem is severely ill‑posed and highly sensitive to measurement noise. To obtain a stable estimate of the true spin density, we therefore cast the reconstruction as an optimization problem. Denote by $upright(bold(tilde(I))) \( upright(bold(O)) \)$ the predicted data for a spin distribution $upright(bold(O))$. We seek $tilde(upright(bold(O)))$ that minimizes the squared discrepancy between measured and predicted data. $ tilde(upright(bold(O))) = arg min_(upright(bold(O))) ∥upright(bold(I)) - upright(bold(tilde(I))) \( upright(bold(O)) \)∥_2^2 \, $<eq:optimization_apdx> Although this least-squares problem enforces a close match between measurement and predicted data, noise in the measurement will result in non-optimal solutions which may contain non-negative or oscillating components that contain no physical meaning. To remedy these problems we regularize the problem by adding two additional penalty terms.

First, the solution is constrained to be non-negative $upright(bold(O)) gt.eq 0$ as the solution corresponds to a density. We enforce this by introducing the indicator function on the non-negative half-space to the problem $ Pi_(+) \( upright(bold(A)) \) = cases(delim: "{", 0 & upright(bold(A)) gt.eq 0, oo & upright("else") .) $ Second, noise and modal mismatch tend to produce high frequency artifacts. To suppress these while preserving sharp edges in the sample, we penalize the sum of the Euclidean norm of the discrete gradient at each voxel $ upright("TV") \( upright(bold(A)) \)_(2 \, 1) = sum_(i \, j \, k) sqrt((A_(i + 1 \, j \, k) - A_(i \, j \, k))^2 + (A_(i \, j + 1 \, k) - A_(i \, j \, k))^2 + (A_(i \, j \, k + 1) - A_(i \, j \, k))^2) . $<eq:tv> This regularization term is called the isotropic total variation. Combining these terms yields the final optimization problem $ tilde(upright(bold(O))) = arg min_(upright(bold(O))) [∥upright(bold(I)) - upright(bold(tilde(I)))∥_2^2 + Pi_(+) \( upright(bold(O \))) + upright("TV") \( upright(bold(O \)))_(2 \, 1)] \, $<eq:optimization_ext_apdx> This formulation balances matching measurement and predicted data with physical and regularity constraints, making the inversion more robust to noise and model imperfections.

== Vectorization

<vectorization>

To simplify the derivation of reconstruction algorithms, it is convenient to transform the three dimensional arrays into tall vectors. Therefore, for both $upright(bold(I))$ and $upright(bold(O))$ the vectorized versions $upright(bold(i))$ and $upright(bold(o))$ are defined by stacking all entries in lexicographic order (fastest in $z$, then $y$ and $x$). In particular, for an arbitrary three dimensional array $upright(bold(X))$ of size $\( n_x \, n_y \, n_z \)$, we form $ upright(bold(x)) = mat(delim: "[", X \( 1 \, 1 \, 1 \), X \( 1 \, 1 \, 2 \) dots.h.c X \( 1 \, 1 \, n_z \), X \( 2 \, 1 \, 1 \) dots.h.c X \( n_x \, 1 \, n_z \), X \( 1 \, 2 \, 1 \) dots.h.c X \( n_x \, n_y \, n_z \))^(sans(T)) . $<eq:vect> This produces a column vector $upright(bold(x))$ of length $N = \( n_x n_y n_z \)$. In the multislice protocol, where the third dimension corresponds to the inversion pulse parameter set index, the same stacking results in a vector of length $N' = n_x n_y n_f$. Using this vectorization, the Equations~#link(<eq:xyz>)[\[eq:xyz\]]-#link(<eq:multislice>)[\[eq:multislice\]] corresponding to the scanning protocols can be written in vectorized form $ upright(bold(i)) = upright(bold(A)) upright(bold(o)) + bold(eta) \, $ where $bold(eta)$ is the vectorized noise term, and $upright(bold(A))$ is the measurement protocol matrix encoding the measurement protocol. For the XYZ scan we define $upright(bold(A)) = upright(bold(A))_(upright(X Y Z))$ a $N times N$ matrix, while for the multislice protocol it is given by $upright(bold(A)) = upright(bold(A))_(upright(M S))$ of size $N' times N$. In the following, we derive both these process matrices.

=== XYZ Scan

<xyz-scan-1>

The conventional XYZ scan corresponds to a three-dimensional convolution of the sample's spin distribution $upright(bold(O))$ and the PSF $upright(bold(H))$ of a single inversion slice. Therefore the problem can be written as $ upright(bold(I)) = upright(bold(H)) star.op_(\( x \, y \, z \)) upright(bold(O)) $ where $star.op_(x \, y \, z)$ is the three dimensional circular convolution operator under the assumption of sufficient padding to minimize wrapping errors.

Applying the convolution theorem, the equation can be transformed into a point-wise multiplication in the Fourier domain

$ upright(bold(I)) = cal(F)^(- 1) {upright(bold(hat(H))) ⊙ upright(bold(hat(O)))} $ Here, $cal(F)$ is the three dimensional Fourier transform, $upright(bold(hat(O))) = cal(F) upright(bold(O))$ is the Fourier domain representation, and $⊙$ the element-wise (Hadamard) product. \

As the point-wise multiplication of two matrices is equivalent to multiplication of the vectorized matrix with a diagonal matrix we can write the vectorized XYZ scan as $ upright(bold(i)) = upright(bold(F))^(- 1) upright("diag") hat((upright(bold(h)))) upright(bold(F)) upright(bold(o)) $ where $upright(bold(F))$ is the 3D DFT matrix, $upright(bold(F))^(- 1)$ its inverse, and $upright(bold(hat(h)))$ the vectorized form of $upright(bold(hat(H)))$. Hence, the measurement protocol matrix for the XYZ scan is $ upright(bold(A))_(upright(X Y Z)) = upright(bold(F))^(- 1) upright("diag") (upright(bold(hat(h)))) upright(bold(F)) . $

=== Multislice Scan

<sec:MS_prot_mat>

In the multislice protocol, instead of physically scanning in the $z$ direction, at every position $\( x \, y \)$ the response to different set of inversion pulse parameters is measured. For the $l$-th pulse the PSF is $upright(bold(H))^l$ and the signal at position $\( x \, y \)$ is the sum over all elements of the point-wise multiplication of the PSF and the sample's spin distribution. This results in the protocol being described by the sum of all 2D convolutions over every $\( x \, y \)$ plane $ upright(bold(I))_(upright(M S) \, l) = sum_z upright(bold(H))^l star.op_(\( x \, y \)) upright(bold(O)) \, $ where $star.op_(\( x \, y \))$ denotes the circular convolution in slice-wise order between the $\( x \, y \)$ planes.

Applying the Fourier transform $cal(F)_(\( x \, y \))$ and the convolution theorem in the $x$ and $y$ dimension rewrites the protocol into $ upright(bold(I))_(upright(M S) \, i) = cal(F)_(\( k_x \, k_y \))^(- 1) {sum_z (upright(bold(hat(H)))^l \( k_x \, k_y \, z \) ⊙ upright(bold(hat(O))) \( k_x \, k_y \, z \))} . $ Here, $upright(bold(hat(H)))^l \( k_x \, k_y \, z \) = cal(F)_(\( x \, y \)) upright(bold(H))_i \( x \, y \, z \)$ and $upright(bold(hat(O))) \( k_x \, k_y \, z \) = cal(F)_(\( x \, y \)) upright(bold(O)) \( x \, y \, z \)$ are the PSF and sample matrices where each $\( x \, y \)$-plane is Fourier transformed. \

To express this equation as a matrix vector equation $upright(bold(i)) = upright(bold(A_(upright(M S)) o))$, $upright(bold(hat(H)))^l \( k_x \, k_y \, z \) ⊙ upright(bold(hat(O))) \( k_x \, k_y \, z \)$ can be transformed to a multiplication with a diagonal matrix $upright("diag") (upright(bold(hat(H)))^l \( k_x \, k_y \, z \)) upright(bold(hat(o)))$ $ upright(bold(i)) & = upright(bold(F))_(\( x \, y \))^(sans(H)) sum_z upright("diag") (upright(bold(hat(H)))^l \( k_x \, k_y \, z \)) upright(bold(hat(o)))\

 & = upright(bold(F))_(\( x \, y \))^(sans(H)) sum_z upright("diag") (upright(bold(hat(H)))^l \( k_x \, k_y \, z \)) upright(bold(F))_(\( x \, y \)) upright(bold(o))\

 & = upright(bold(F))_(\( x \, y \))^(sans(H)) upright(bold(G)) upright(bold(F))_(\( x \, y \)) upright(bold(o)) .\

 $ Here, $upright(bold(F))_(\( x \, y \))$ is the 2D-DFT matrix applying the two-dimensional Fourier transform to each $\( x \, y \)$ plane of a vector representing a three-dimensional data set. The matrix $upright(bold(G)) = sum_z upright("diag") (upright(bold(hat(H)))^l \( k_x \, k_y \, z \))$ can be written as a block-diagonal operator $ upright(bold(G)) = mat(delim: "[", upright(bold(G))_(\( 1 \, 1 \)), 0, dots.h.c, 0; 0, upright(bold(G))_(\( 1 \, 2 \)), dots.h.c, 0; dots.v, dots.v, dots.down, dots.v; 0, 0, dots.h.c, upright(bold(G))_(\( n_x \, n_y \))) \, $ where each block $upright(bold(G_(\( i \, j \))))$ of size $\( n_f times n_z \)$ has entries $ upright(bold(G))_(\( i \, j \)) = mat(delim: "[", hat(H)^1 \( i \, j \, 1 \), hat(H)^1 \( i \, j \, 2 \), dots.h.c, hat(H)^1 \( i \, j \, n_z \); hat(H)^2 \( i \, j \, 1 \), hat(H)^2 \( i \, j \, 2 \), dots.h.c, hat(H)^2 \( i \, j \, n_z \); dots.v, dots.v, dots.down, dots.v; hat(H)^(n_f) \( i \, j \, 1 \), hat(H)^(n_f) \( i \, j \, 2 \), dots.h.c, hat(H)^(n_f) \( i \, j \, n_z \)) $ The resulting measurement process matrix of the multislice scanning protocol is given by $upright(bold(A))_(upright(M S)) = upright(bold(F))_(\( x \, y \))^(sans(H)) upright(bold(G)) upright(bold(F))_(\( x \, y \))$.

== Reconstruction

<reconstruction>

The optimization problem~@eq:optimization_ext_apdx consists of three distinct terms: a least-squares data-fidelity term, a non-negativity constraint, and an isotropic total-variation penalty. Solving the whole problem in a single step is infeasible. Instead, the alternating direction method of multipliers (ADMM) @boyd_distributed_2010@eckstein_douglasrachford_1992 is applied. ADMM splits the problem into simple sub-problems that are solved sequentially while enforcing convergence to a global optimum.

To recast Eq.~@eq:optimization_ext_apdx in ADMM form, we introduce two auxiliary variables. To ensure the non-negativity of the solution $upright(bold(o))_(+)$ is introduced, while $upright(bold(o))_(upright(T V))$ is added to describe the local gradients required to compute the total-variation penalty term. Furthermore, the two constraints $upright(bold(upright(bold(o))_(upright(T V)) = upright(bold(D o))))$ and $upright(bold(o))_(+) = upright(bold(o))$ are added to ensure the additional auxiliary variables coincide with the spin density estimate $upright(bold(o))$. With these definitions, the constrained optimization problem is given as $ arg min_(upright(bold(o))) & 1 / 2 ∥upright(bold(A))_(upright(M S)) upright(bold(o)) - upright(bold(tilde(i)))∥_2^2 + gamma_(upright(T V)) lr(bar.v.double upright(bold(upright(bold(o))_(upright(T V)))) bar.v.double)_(2 \, 1) + Pi_(+) \( upright(bold(o))_(+) \) \,\

s . t . quad & upright(bold(o))_(+) - upright(bold(o)) = upright(bold(0))\

 & upright(bold(upright(bold(o))_(upright(T V)))) - upright(bold(D o)) = upright(bold(0)) \,\

 $<eq:optimization_admm> Here, we replace the notation of the total variation operator $upright("TV") \( upright(bold(o)) \)_(2 \, 1)$ with the matrix vector product of the vector $upright(bold(o))$ with the difference matrix $upright(bold(D)) = \( upright(bold(D))_x \, upright(bold(D))_y \, upright(bold(D))_z \)^(sans(T))$. This matrix computes the finite difference along the $x$,$y$, and $z$ directions, respectively. The group norm of this term $lr(bar.v.double upright(bold(D o)) bar.v.double)_(2 \, 1) = sum_i lr(bar.v.double \( upright(bold(D o)) \)_i bar.v.double)_2 = sum_(i \, j \, k) sqrt((o_(i + 1 \, j \, k) - o_(i \, j \, k))^2 + (o_(i \, j + 1 \, k) - o_(i \, j \, k))^2 + (o_(i \, j \, k + 1) - o_(i \, j \, k))^2)$, first applies the two norm along the added difference dimension, before computing the sum for every point in the measurement.

To solve this problem while incorporating the constraints, Eq.~@eq:optimization_admm is transformed into the unconstrained augmented Lagrangian notation~@nocedal_numerical_2006. $ L_(bold(nu)) \( upright(bold(o)) \, upright(bold(o))_(+) \, upright(bold(o))_(upright(T V)) \, bold(lambda)_1 \, bold(lambda)_2 \) & = 1 / 2 ∥upright(bold(A))_(upright(M S)) upright(bold(o)) - upright(bold(i))∥_2^2 + gamma_(upright(T V)) lr(bar.v.double upright(bold(o))_(upright(T V)) bar.v.double)_(2 \, 1) + Pi_(+) \( upright(bold(o))_(+) \)\

 & + bold(lambda)_1^(sans(T)) \( upright(bold(o))_(+) - upright(bold(o)) \) + nu_1 / 2 ∥upright(bold(o))_(+) - upright(bold(o))∥_2^2\

 & + bold(lambda)_2^(sans(T)) \( upright(bold(o))_(upright(T V)) - upright(bold(D o)) \) + nu_2 / 2 ∥upright(bold(o))_(upright(T V)) - upright(bold(D o))∥_2^2 \,\

 $ where $bold(lambda)_1 \, bold(lambda)_2$ are the Lagrange multipliers and $bold(nu) = \( nu_1 \, nu_2 \)$ are positive penalty parameters. The optimal solution to~@eq:optimization_admm corresponds to solving the saddle point problem $\( upright(bold(o))^(*) \, upright(bold(o))_(+)^(*) \, upright(bold(o))_(upright(T V))^(*) \, bold(lambda)_1^(*) \, bold(lambda)_2^(*) \) = arg min_(upright(bold(o)) \, upright(bold(o))_(upright(T V)) \, upright(bold(o))_(+)) arg max_(bold(lambda)_1 \, bold(lambda)_2) L_(bold(nu)) \( upright(bold(o)) \, upright(bold(o))_(+) \, upright(bold(o))_(upright(T V)) \, bold(lambda)_1 \, bold(lambda)_2 \)$~@boyd_distributed_2010.

The ADMM algorithm solves this problem in an iterative manner. In each iteration $\( k \)$ we successively minimize $L_(bold(nu))$ with respect to $upright(bold(o)) \, upright(bold(o))_(+)$ and $upright(bold(o))_(upright(T V))$, before performing a standard gradient ascent step on the dual variables $bold(lambda)_1 \, bold(lambda)_2$. This procedure is summarized in @alg:ADMM.

#figure(block(inset: 6pt, stroke: .45pt)[
  #set text(size: 8pt)
  $upright(bold(o))^0 \, upright(bold(o))_(+)^0 \, upright(bold(o))_(upright(T V))^0 \, bold(lambda)_1^0 \, bold(lambda)_2^0 arrow.l upright(bold(0))$ \
  #strong[repeat] \
  $upright(bold(o))^(\( k + 1 \)) arrow.l arg min_(upright(bold(o))) thin L_(bold(nu)) \( upright(bold(o)) \, upright(bold(o))_(+)^(\( k \)) \, upright(bold(o))_(upright(T V))^(\( k \)) \, bold(lambda)_1^(\( k \)) \, bold(lambda)_2^(\( k \)) \)$ \
  $upright(bold(o))_(+)^(\( k + 1 \)) arrow.l arg min_(upright(bold(o))_(+)) thin L_(bold(nu)) \( upright(bold(o))^(\( k + 1 \)) \, upright(bold(o))_(+) \, upright(bold(o))_(upright(T V))^(\( k \)) \, bold(lambda)_1^(\( k \)) \, bold(lambda)_2^(\( k \)) \)$ \
  $upright(bold(o))_(upright(T V))^(\( k + 1 \)) arrow.l arg min_(upright(bold(o))_(upright(T V))) thin L_(bold(nu)) \( upright(bold(o))^(\( k + 1 \)) \, upright(bold(o))_(+)^(\( k + 1 \)) \, upright(bold(o))_(upright(T V)) \, bold(lambda)_1^(\( k \)) \, bold(lambda)_2^(\( k \)) \)$ \
  $bold(lambda)_1^(\( k + 1 \)) arrow.l bold(lambda)_1^(\( k \)) + nu_1 (upright(bold(o))_(+)^(\( k + 1 \)) - upright(bold(o))^(\( k + 1 \)))$ \
  $bold(lambda)_2^(\( k + 1 \)) arrow.l bold(lambda)_2^(\( k \)) + nu_2 (upright(bold(o))_(upright(T V))^(\( k + 1 \)) - upright(bold(D o))^(\( k + 1 \)))$
  \ #strong[until] $i_("err") lt.eq upright("err")_("max")$], kind: "algorithm", supplement: [Algorithm], caption: [ADMM reconstruction]) <alg:ADMM>

As this algorithm requires the solution of an optimization problem for each sub-problem update it is necessary to find an explicit update equation for all subproblems. While using the ADMM to solve problems of similar form to the XYZ problem is a known problem~@antipa_diffusercam_2018, the multislice problem requires the derivation of the individual update steps.

=== $upright(bold(o))$-update

<mathbfo-update>

The variable $upright(bold(o))$ is the main quantity of interest. It holds the current estimate of the three-dimensional spin-density distribution. In iteration $\( k \)$ we obtain the next iteration $upright(bold(o))^(\( k + 1 \))$ by minimization of the augmented Lagrangian. This optimization problem is given by $ arg min_(upright(bold(o))) thin & L_(bold(nu)) \( upright(bold(o)) \, upright(bold(o))_(+)^(\( k \)) \, upright(bold(o))_(upright(T V))^(\( k \)) \, bold(lambda)_1^(\( k \)) \, bold(lambda)_2^(\( k \)) \)\

= arg min_(upright(bold(o))) thin & 1 / 2 ∥upright(bold(A))_(upright(M S)) upright(bold(o)) - upright(bold(i))∥_2^2 - (bold(lambda)_1^(\( k \)))^(sans(T)) upright(bold(o)) + nu_1 / 2 ∥upright(bold(o))_(+)^(\( k \)) - upright(bold(o))∥_2^2 - (bold(lambda)_1^(\( k \)))^(sans(T)) upright(bold(D)) upright(bold(o)) + nu_2 / 2 ∥upright(bold(o))_(upright(T V))^(\( k \)) - upright(bold(D o))∥_2^2 . $ Because all terms are at most quadratic in $upright(bold(o))$, setting the derivative to zero yields the update equation $ upright(bold(o))^(\( k + 1 \)) = (upright(bold(A))_(upright(M S))^(sans(H)) upright(bold(A))_(upright(M S)) + nu_1 + nu_2 upright(bold(D))^(sans(H)) upright(bold(D)))^(- 1) (upright(bold(A))_(upright(M S))^(sans(H)) upright(bold(A))_(upright(M S)) upright(bold(i)) + nu_1 + bold(lambda)_1^(\( k \)) + upright(bold(D))^(sans(T)) (nu_2 + bold(lambda)_2^(\( k \)))) . $<eq:o-update>

Directly applying the measurement process matrix $upright(bold(A))_(upright(M S))$ is infeasible for a moderately sized problem due to its size of $\( N' times N \)$. As shown in Sect.~@sec:MS_prot_mat it can be factorized as $upright(bold(A))_(upright(M S)) = upright(bold(F))_(\( x \, y \))^(- 1) upright(bold(G)) upright(bold(F))_(\( x \, y \))$, using the block-diagonal matrix $upright(bold(G))$. To compute $upright(bold(A))_(upright(M S))^(sans(H)) upright(bold(A))_(upright(M S))$, this factorization can be exploited in connection with the anti-distributivity of the hermitian adjoint resulting in

$ upright(bold(A))_(upright(M S))^(sans(H)) upright(bold(A))_(upright(M S)) = \( upright(bold(F))_(\( x \, y \))^(sans(H)) upright(bold(G)) upright(bold(F))_(\( x \, y \)) \)^(sans(H)) upright(bold(F))_(\( x \, y \))^(sans(H)) upright(bold(G)) upright(bold(F))_(\( x \, y \)) = upright(bold(F))_(\( x \, y \))^(sans(H)) upright(bold(G))^(sans(H)) upright(bold(F))_(\( x \, y \)) upright(bold(F))_(\( x \, y \))^(sans(H)) upright(bold(G)) upright(bold(F))_(\( x \, y \)) = upright(bold(F))_(\( x \, y \))^(sans(H)) upright(bold(G))^(sans(H)) upright(bold(G)) upright(bold(F))_(\( x \, y \)) \, $ where the adjoint of $upright(bold(G))$ is given by $ upright(bold(G))^(sans(H)) = mat(delim: "[", upright(bold(G))_(\( 1 \, 1 \))^(sans(H)), 0, dots.h.c, 0; 0, upright(bold(G))_(\( 1 \, 2 \))^(sans(H)), dots.h.c, 0; dots.v, dots.v, dots.down, dots.v; 0, 0, dots.h.c, upright(bold(G))_(\( n_x \, n_y \))^(sans(H))) \, upright(bold(G))_(\( i \, j \))^(sans(H)) = mat(delim: "[", hat(H)^(1 *) \( i \, j \, 1 \), hat(H)^(2 *) \( i \, j \, 1 \), dots.h.c, hat(H)^(n_f *) \( i \, j \, 1 \); hat(H)^(1 *) \( i \, j \, 1 \), hat(H)^(2 *) \( i \, j \, 2 \), dots.h.c, hat(H)^(n_f *) \( i \, j \, 2 \); dots.v, dots.v, dots.down, dots.v; hat(H)^(1 *) \( i \, j \, n_z \), hat(H)^(2 *) \( i \, j \, n_z \), dots.h.c, hat(H)^(n_f *) \( i \, j \, n_z \)) in bb(C)^(n_z times n_f) $ Hence $upright(bold(A))_(upright(M S))^(sans(H)) upright(bold(A))_(upright(M S))$ is block-diagonalized by the same 2D-DFT matrix $upright(bold(F))_(\( x \, y \))$. This reduces the computational complexity of the forward model to the computation of $n_x n_y$ dense multiplications of vectors with matrices of size $n_f times n_f$.

Equation~@eq:o-update contains the inverse $(upright(bold(A))_(upright(M S))^(sans(H)) upright(bold(A))_(upright(M S)) + nu_1 bold(cal(I)) + nu_2 upright(bold(D))^(sans(H)) upright(bold(D)))^(- 1)$. The approach to finding a traceable method to compute this inverse is to show that all three terms are (block-) diagonalized by the 2D Fourier transform. We already showed this property for $\( upright(bold(A))_(upright(M S))^(sans(H)) upright(bold(A))_(upright(M S)) \)$.

For the second term $nu_1 = nu_1 bold(cal(I))$, where $bold(cal(I))$ is the identity matrix of size $n_x n_y n_f times n_x n_y n_f$, the diagonalization by $upright(bold(F))_(\( x \, y \))$ is given by the unitary property of the 2D-DFT matrix $nu_1 bold(cal(I)) = nu_1 upright(bold(F))_(\( x \, y \))^(- 1) bold(cal(I)) upright(bold(F))_(\( x \, y \))$. \

The third term $nu_2 upright(bold(D))^(sans(H)) upright(bold(D))$ computes the two dimensional difference for each $z$-level. We can use the fact that $upright(bold(D))$ and $upright(bold(D))^(sans(T))$ are block-circulant matrices and diagonalizable by the two-dimensional Fourier transform~@yang_fast_2009. Due to the vectorization pattern @eq:vect, the finite difference matrix used in the multislice algorithm is a block diagonal matrix where each block is the two-dimensional difference matrix. Hence $upright(bold(D))^(sans(T)) upright(bold(D)) = upright(bold(F))_(\( x \, y \))^(sans(H)) upright(bold(tilde(D))) upright(bold(F))_(\( x \, y \))$ and we can compute the inverse as

$ (upright(bold(A))_(upright(M S))^(sans(H)) upright(bold(A))_(upright(M S)) + nu_1 bold(cal(I)) + nu_2 upright(bold(D))^(sans(H)) upright(bold(D)))^(- 1) = (upright(bold(F))_(\( x \, y \))^(sans(H)) (upright(bold(G))^(sans(H)) upright(bold(G)) + nu_1 bold(cal(I)) + nu_2 upright(bold(tilde(D)))) upright(bold(F))_(\( x \, y \)))^(- 1) = upright(bold(F))_(\( x \, y \))^(sans(H)) (upright(bold(G))^(sans(H)) upright(bold(G)) + nu_1 bold(cal(I)) + nu_2 upright(bold(tilde(D))))^(- 1) upright(bold(F))_(\( x \, y \)) $ This reduces the problem to computing the inverse of a block diagonal matrix in the Fourier domain. $ (upright(bold(G))^(sans(H)) upright(bold(G)) + nu_1 bold(cal(I)) + nu_2 upright(bold(tilde(D))))^(- 1) & = mat(delim: "[", (upright(bold(G))_(\( 1 \, 1 \))^(sans(H)) upright(bold(G))_(\( 1 \, 1 \)) + nu_1 bold(cal(I)) + nu_2 upright(bold(tilde(D)))_(\( 1 \)))^(- 1), dots.h.c, 0; dots.v, dots.down, dots.v; 0, dots.h.c, (upright(bold(G))_(\( n_x \, n_y \))^(sans(H)) upright(bold(G))_(n_x \, n_y \)) + nu_1 bold(cal(I)) + nu_2 upright(bold(tilde(D)))_(\( n_x n_y \)))^(- 1)) \, $ where each block $(upright(bold(G))_(\( i \, j \))^(sans(H)) upright(bold(G))_(\( i \, j \)) + nu_1 bold(cal(I)) + nu_2 upright(bold(tilde(D)))_(\( i j \)))^(- 1)$ is a dense matrix of size $\( n_f times n_f \)$. Thus, the inverse computed in the Fourier domain consists of $n_x n_y$ inverses of size $n_f times n_f$ each. This makes its computation feasible for large-scale problems. In addition, this computation depends only on the $n_f$ PSFs of the applied inversion pulses. Since these remain constant during the duration of the scan, it is sufficient to compute the inverse once at the beginning of the reconstruction algorithm, instead of at each iteration $k$. In summary, the full update equation for the $upright(bold(o))$-update is given by $ upright(bold(o))_(\( k + 1 \)) & = (upright(bold(A))_(upright(M S))^(sans(H)) upright(bold(A))_(upright(M S)) + nu_1 + nu_2 upright(bold(D))^(sans(H)) upright(bold(D)))^(- 1) (upright(bold(A))_(upright(M S))^(sans(H)) upright(bold(A))_(upright(M S)) upright(bold(i)) + nu_1 + bold(lambda)_1^(\( k \)) + upright(bold(D))^(sans(T)) (nu_2 + bold(lambda)_2^(\( k \))))\

 & = upright(bold(F))_(\( x \, y \))^(- 1) \( upright(bold(G))^(sans(H)) upright(bold(G)) + nu_1 + nu_2 upright(bold(tilde(D))) \)^(- 1) upright(bold(F))_(\( x \, y \)) \( upright(bold(F))_(\( x \, y \))^(- 1) upright(bold(G))^(sans(H)) upright(bold(G)) upright(bold(F))_(\( x \, y \)) upright(bold(i)) + nu_1 + bold(lambda)_1^(\( k \)) + upright(bold(D))^(sans(T)) (nu_2 + bold(lambda)_2^(\( k \))) \) $

=== $upright(bold(o))_(+)$-Update

<mathbfo_-update>

To perform the $upright(bold(o))_(+)$-update step, the augmented Lagrangian is minimized with respect to $upright(bold(o))_(+)$, taking into account the already updated spin distribution $upright(bold(o))^(\( k + 1 \))$. $  & arg min_(upright(bold(o))_(+)) med L_(bold(nu)) \( upright(bold(o))^(\( k + 1 \)) \, upright(bold(o))_(+) \, upright(bold(o))_(upright(T V))^(\( k \)) \, bold(lambda)_1^(\( k \)) \, bold(lambda)_2^(\( k \)) \)\

 & = arg min_(upright(bold(o))_(+)) med Pi_(+) \( upright(bold(o))_(+) \) + (bold(lambda)_1^(\( k \)))^(sans(T)) \( upright(bold(o))_(+) \) + nu_1 / 2 ∥upright(bold(o))_(+) - upright(bold(o))^(\( k + 1 \))∥_2^2\

 & = arg min_(upright(bold(o))_(+)) med Pi_(+) \( upright(bold(o))_(+) \) + nu_1 / 2 ∥upright(bold(o))_(+) - (upright(bold(o))^(\( k + 1 \)) + bold(lambda)_1^(\( k \)) / nu_1)∥_2^2\

 $ The solution to this problem of form $arg min_x f \( x \) + 1 \/ 2 lr(bar.v.double x - y bar.v.double)_2^2$ is the proximal operator of $f$ evaluated at $y$. While in general this problem requires solving an additional optimization problem, for many functions $f \( x \)$ there exists a closed form solution~@parikh_proximal_2014. For the indicator function of the non-negative half-space $Pi_(+) \( upright(bold(o))_(+) \)$ the solution is given by $ upright(bold(o))_(+)^(*) = max (0 \, upright(bold(o))^(\( k + 1 \)) + bold(lambda)_1^(\( k \)) / nu_1) . $<eq:p_upd> As this is an element-wise operation, it bears no significant computational cost, reducing the impact of the $upright(bold(o))_(+)$-update on the algorithms runtime.

=== $upright(bold(o))_(upright(T V))$-update

<mathbfo_mathrmtv-update>

The auxiliary variable $upright(bold(o))_(upright(T V))$ stores the finite-difference vectors needed for the isotropic TV penalty. For every element in $upright(bold(o))$ it contains two entries, the gradient in $x$ and $y$. The update for $upright(bold(o))_(upright(T V))^(\( k + 1 \))$ is obtained by solving $  & arg min_(upright(bold(o))_(upright(T V))) med L_(bold(nu)) \( upright(bold(o))^(\( k + 1 \)) \, upright(bold(o))_(+)^(\( k + 1 \)) \, upright(bold(o))_(upright(T V)) \, bold(lambda)_1^(\( k \)) \, bold(lambda)_2^(\( k \)) \)\

 & = arg min_(upright(bold(o))_(upright(T V))) med gamma_(upright(T V)) lr(bar.v.double upright(bold(o))_(upright(T V)) bar.v.double)_(2 \, 1) + (bold(lambda)_2^(\( k \)))^(sans(T)) upright(bold(D o)) + nu_1 / 2 ∥upright(bold(o))_(upright(T V)) - upright(bold(D o))^(\( k + 1 \))∥_2^2\

 & = arg min_(upright(bold(o))_(upright(T V))) med gamma_(upright(T V)) lr(bar.v.double upright(bold(o))_(upright(T V)) bar.v.double)_(2 \, 1) + nu_1 / 2 ∥upright(bold(o))_(upright(T V)) - (upright(bold(D o))^(\( k + 1 \)) + (bold(lambda)_2^(\( k \)))^(sans(T)) / nu_2)∥_2^2\

 $ This again is a proximal step for the mixed $\( 2 \, 1 \)$-norm. The proximal operator for $f \( upright(bold(o))_(upright(T V)) \) = lr(bar.v.double upright(bold(o))_(upright(T V)) bar.v.double)_(2 \, 1)$ is~@parikh_proximal_2014 $ upright(bold(o))_(upright(T V))^(*) = max (0 \, 1 - frac(gamma_(upright(T V)), nu_2 lr(bar.v.double upright(bold(D o))^(\( k + 1 \)) + bold(lambda)_2^(\( k \)) \/ nu_2 bar.v.double)_2)) \( upright(bold(D o))^(\( k + 1 \)) + bold(lambda)_2^(\( k \)) \/ nu_2 \) $ Combining all update steps and inserting them into @alg:ADMM results in the final ADMM algorithm shown in @alg:ADMM_final used to solve the reconstruction problem of the multislice scanning protocol.

#figure(block(inset: 6pt, stroke: .45pt)[
  #set text(size: 8pt)
  $upright(bold(o))^(\( 0 \)) \, upright(bold(o))_(+)^(\( 0 \)) \, upright(bold(o))_(upright(T V))^(\( 0 \)) \, bold(lambda)_1^(\( 0 \)) \, bold(lambda)_2^(\( 0 \)) arrow.l 0$ \
  #strong[repeat] \
  $upright(bold(o))^(\( k + 1 \)) arrow.l (upright(bold(A))_(upright(M S))^(sans(H)) upright(bold(A))_(upright(M S)) + nu_1 + nu_2 upright(bold(D))^(sans(H)) upright(bold(D)))^(- 1) (upright(bold(A))_(upright(M S))^(sans(H)) upright(bold(A))_(upright(M S)) upright(bold(i)) + nu_1 + bold(lambda)_1^(\( k \)) + upright(bold(D))^(sans(T)) (nu_2 + bold(lambda)_2^(\( k \))))$ \
  $upright(bold(o))_(+)^(\( k + 1 \)) arrow.l max (0 \, upright(bold(o))^(\( k + 1 \)) + bold(lambda)_1^(\( k \)) / nu_1)$ \
  $upright(bold(o))_(upright(T V))^(\( k + 1 \)) arrow.l max (0 \, 1 - frac(lambda, nu_2 lr(bar.v.double upright(bold(D o))^(\( k + 1 \)) + bold(lambda)_2^(\( k \)) \/ nu_2 bar.v.double)_2)) \( upright(bold(D o))^(\( k + 1 \)) + bold(lambda)_2^(\( k \)) \/ nu_2 \)$ \
  $bold(lambda)_1^(\( k + 1 \)) arrow.l bold(lambda)_1^(\( k \)) + nu_1 \( upright(bold(o))_(+)^(\( k + 1 \)) - upright(bold(o))^(\( k + 1 \)) \)$ \
  $bold(lambda)_2^(\( k + 1 \)) arrow.l bold(lambda)_2^(\( k \)) + nu_2 \( upright(bold(o))_(upright(T V))^(\( k + 1 \)) - upright(bold(D o))^(\( k + 1 \)) \)$
  \ #strong[until] $i_("err") gt.eq upright("err")_("max")$], kind: "algorithm", supplement: [Algorithm], caption: [ADMM multislice reconstruction]) <alg:ADMM_final>

= Ill-Conditioned Problem

<app:ill-cond>

An inverse problem is ill-conditioned if its condition number $kappa = sigma_(upright(m a x)) \/ sigma_(upright(m i n)) gt.double 1$ is very large, where $sigma_(upright(m i n))$ and $sigma_(upright(m a x))$ are the extreme singular values of the problem. Applied to the MRFM reconstruction problem, a perturbation of the estimated sample, $Delta tilde(upright(bold(O)))$, alters the scan data $Delta upright(bold(I))$ within the bounds $sigma_(upright(m i n)) lr(bar.v.double Delta tilde(upright(bold(O))) bar.v.double)_2 lt.eq lr(bar.v.double Delta upright(bold(I)) bar.v.double)_2 lt.eq sigma_(upright(m a x)) lr(bar.v.double Delta tilde(upright(bold(O))) bar.v.double)_2$. Updates of the estimate $tilde(upright(bold(O)))$ corresponding to small singular values produce only minor changes in the predicted data and are therefore highly susceptible to measurement noise, whereas directions aligned with large singular values are more robust. In our measurement geometries, the PSFs are smooth and spatially extended. As a result, the overall sample's shape and its average spin density map to large singular values and strongly influence $upright(bold(I))$, while localized spin density variations are averaged and projected onto small singular values, resulting in small changes to the scan. Iterative reconstruction algorithms applied to this problem exhibit semi-convergent behavior: large-scale features in the sample $upright(bold(O))_(upright(G T))$ are recovered in few iterations, while localized variations emerge only after many iterations, during which measurement noise is progressively amplified. Beyond an optimal iteration, this noise growth outweighs further gains. This optimal stopping iteration minimizes the RMSE of the reconstruction. Although ADMM's regularization terms suppress parts of this noise amplification, it cannot overcome the ill-conditioning of the problem, and the empirical RMSE decay rate remains below the ideal SNR improvement factor.

= ADMM Performance

<app:Landweber>

To evaluate the performance of the ADMM algorithm used in this work, it is compared to the Landweber algorithm~@landweber_iteration_1951, a special case of gradient descent to solve ill-posed inverse problems. In previous works it was utilized to solve the MRFM reconstruction problem~@degen_nanoscale_2009@mamin_isotope-selective_2009. Additionally, to encompass the non-negativity of the solution it is extended to the projected Landweber iteration, projecting the solution after every iteration onto the positive half-space. One major downside of this algorithm is the low convergence speed with increasing problem size. To accelerate the convergence we use the Barzilai-Borwein method~@barzilai_two-point_1988, to dynamically update the step size at each iteration. The complete algorithm is described in @alg:Landweber

#figure(block(inset: 6pt, stroke: .45pt)[
  #set text(size: 8pt)
  $upright(bold(o))^(\( 0 \)) \, gamma_(upright(L W))^(\( 0 \)) \, i \, gamma_(upright(L W \, m a x)) \, gamma_(upright(L W \, m i n))$ \
  #strong[repeat] \
  $upright(bold(o))^(\( k + 1 \)) = max \( upright(bold(o))^(\( k \)) - gamma_(upright(L W))^(\( k \)) upright(bold(A))^(sans(H)) \( upright(bold(A)) upright(bold(o))^(\( k \)) - upright(bold(i)) \) \, 0 \)$ \
  $upright(bold(s))^(\( k + 1 \)) = upright(bold(o))^(\( k + 1 \)) - upright(bold(o))^(\( k \))$ \
  $upright(bold(y))^(\( k + 1 \)) = upright(bold(A))^(sans(H)) \( upright(bold(A)) upright(bold(o))^(\( k + 1 \)) - upright(bold(i)) \)$ \
  $gamma_(upright(L W))^(\( k + 1 \)) = frac(upright(bold(s))^(\( k + 1 \))^(sans(T)) upright(bold(s))^(\( k + 1 \)), upright(bold(s))^(\( k + 1 \))^(sans(T)) upright(bold(y))^(\( k + 1 \)))$ \
  $gamma_(upright(L W))^(\( k + 1 \)) = max \( min \( gamma_(upright(L W))^(\( k + 1 \)) \, gamma_(upright(L W \, m a x)) \) \, gamma_(upright(L W \, m i n)) \)$
  \ #strong[until] $i_("err") gt.eq upright("err")_("max")$], kind: "algorithm", supplement: [Algorithm], caption: [Adaptive Projected Landweber Iteration]) <alg:Landweber>

@Fig:ADMMvsLandweber compares the performance between the ADMM algorithm and the adapted Landweber iteration. In @Fig:ADMMvsLandweber\(a), the reconstruction error is compared for a simulated multislice scan using a membrane resonator and parameters identical to the results in~@Fig:ProtRes. Due to the finer control of the regularization in the ADMM algorithm, the RMSE can be more precisely adapted to the measurement environment, resulting in a reduced RMSE over the full range of integration times $T_(upright(m))$. Furthermore, comparing the convergence speed of the two algorithms for the exemplary case of $T_(upright(m)) = 30 med upright("s")$ in @Fig:ADMMvsLandweber\(b), the ADMM achieves its minimal RMSE after 10 iterations, while the Landweber algorithm reaches its minimum after 510 iterations. On a workstation running an Intel Core i9-14900k and 128 GB RAM, the ADMM algorithm achieves its minimal error after $67 med upright("s")$, while the Landweber algorithm takes $779 med upright("s")$. \

#figure(image("source/Figures/ADMMLandweber.pdf", width: 52%),

  caption: [ADMM performance evaluation. (a) reconstruction error for extended adaptive Landweber algorithm and ADMM using the identical simulated measurement. (b) RMSE convergence for both algorithms, when reconstructing scan with $T_m = 30 s$. (c)-(f) Reconstructed $\( x \, y \)$ mid-plane of same object used as in main text. (c)-(d) applies the Landweber algorithm, (e)-(f) the ADMM reconstruction framework.],
) <Fig:ADMMvsLandweber>

When comparing the recovered objects from both methods in @Fig:ADMMvsLandweber\(c)-(f), the missing regularization term is observed in the augmented Landweber algorithm. While the Landweber algorithm concentrates the highest spin density information in the center of the reconstructed object, the ADMM algorithm distributes the spin density over the full sample. Additionally, for short per-voxel integration times, the result obtained from the Landweber algorithm does not capture the clear boundary of the object, instead showing a decaying spin density towards the sample's edge (see @Fig:ADMMvsLandweber\(c)). In comparison, the ADMM based reconstruction captures the overall shape of the imaged object already for a short integration time of 5~s (see @Fig:ADMMvsLandweber\(d)).

= Inversion Pulse Parameters

<app:IPP>

The simulations in this work that utilize the multislice protocol use $n_f = 46$ different sets of parameters for the applied rf inversion pulses. The parameters of these pulses were chosen to ensure that the furthest point above the magnet surface that has a magnetic field that corresponds to a Larmor frequency equal to the pulse's center frequency $frac(gamma, 2 pi) \| B \( upright(bold(r)) \) \| = f_0$ is positioned between 24~nm and $70 med n m$ above the nanomagnet surface. In addition, the bandwidth of all inversion pulses is uniformly set to $f_(upright(B W)) = 500 med k H z$. \

@tab:PulseFreqs lists the center frequencies of all pulses used in the multislice protocol and the corresponding extension of the PSF from the magnet's surface.

#figure(
  table(

    columns: 10,

    align: (center,center,center,center,center,center,center,center,center,center,),

    table.header([PSF Ext.], [$f_0$], [PSF Ext.], [$f_0$], [PSF Ext.], [$f_0$], [PSF Ext.], [$f_0$], [PSF Ext.], [$f_0$],),

    table.hline(),

    [24~nm], [146.74~MHz], [34~nm], [142.39~MHz], [44~nm], [139.05~MHz], [54~nm], [136.05~MHz], [64~nm], [134.91~MHz],

    [25~nm], [146.25~MHz], [35~nm], [142.02~MHz], [45~nm], [138.78~MHz], [55~nm], [136.58~MHz], [65~nm], [134.74~MHz],

    [26~nm], [145.78~MHz], [36~nm], [141.66~MHz], [46~nm], [138.52~MHz], [56~nm], [136.36~MHz], [66~nm], [134.59~MHz],

    [27~nm], [145.32~MHz], [37~nm], [141.30~MHz], [47~nm], [138.25~MHz], [57~nm], [136.16~MHz], [67~nm], [134.44~MHz],

    [28~nm], [144.86~MHz], [38~nm], [140.95~MHz], [48~nm], [137.98~MHz], [58~nm], [135.98~MHz], [68~nm], [134.29~MHz],

    [29~nm], [144.43~MHz], [39~nm], [140.60~MHz], [49~nm], [137.73~MHz], [59~nm], [135.79~MHz], [69~nm], [134.15~MHz],

    [30~nm], [144.01~MHz], [40~nm], [140.27~MHz], [50~nm], [137.48~MHz], [60~nm], [135.60~MHz], [70~nm], [133.87~MHz],

    [31~nm], [143.59~MHz], [41~nm], [139.95~MHz], [51~nm], [137.25~MHz], [61~nm], [135.42~MHz], [], [],

    [32~nm], [143.18~MHz], [42~nm], [139.64~MHz], [52~nm], [137.02~MHz], [62~nm], [135.25~MHz], [], [],

    [33~nm], [142.77~MHz], [43~nm], [139.34~MHz], [53~nm], [136.79~MHz], [63~nm], [135.07~MHz], [], [],

  ),
  caption: [Center frequencies of inversion pulses used in the simulation of MRFM measurements utilizing the multislice protocol.],
) <tab:PulseFreqs>
