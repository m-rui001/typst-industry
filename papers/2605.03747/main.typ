#set page(width: 192mm, height: 262mm, margin: (x: 39pt, y: 51pt), numbering: "1")
#set text(font: "New Computer Modern", size: 10pt)
#set par(justify: true, leading: 0.62em)
#set heading(numbering: "1.1")
#set math.equation(numbering: "(1)")
#set figure(placement: auto)
#show figure.where(kind: table): set figure.caption(position: top)
#let ref-list(..keys) = {
  let links = keys.pos().map(key => link(key, str(key).trim("ref", at: start)))
  [\[#links.join(", ")\]]
}

#block[#set text(size: 18pt); #set par(justify: false); Generalized Virtual-Wave Theory for Photothermal Coherence Tomography under Arbitrary Excitation Toward Non-Contact Industrial Inspection of Composite Materials]

Pengfei Zhu#footnote[Corresponding author. #link("mailto:pengfei.zhu@bam.de")[pengfei.zhu\@bam.de]. ORCID 0000-0003-0431-1538.], Julien Lecompagnon, Philipp Daniel Hirsch, and Mathias Ziegler

#text(size: 8.5pt)[_Bundesanstalt für Materialforschung und -prüfung (BAM), 12205 Berlin, Germany_]

#block(stroke: (top: 0.55pt, bottom: 0.55pt), inset: (y: 6pt), width: 100%)[
#set text(size: 9pt)
#grid(columns: (30%, 1fr), gutter: 10pt,
  [*A R T I C L E  I N F O* #line(length: 100%, stroke: 0.4pt) \
  _Keywords_ \
  Infrared thermography \
  Signal processing \
  Virtual wave \
  Photothermal tomography \
  Non-destructive testing],
  [*A B S T R A C T* #line(length: 100%, stroke: 0.4pt)

  Photothermal imaging is a powerful noncontact and nondestructive
technique for subsurface inspection of composite materials, yet its
performance is fundamentally limited by the diffusive and irreversible
nature of heat transport, leading to severe image blurring and ambiguous
depth interpretation. The concept of virtual waves provides a route to
overcome this limitation by linking diffusion fields to propagating wave
fields, but existing approaches are largely restricted to idealized
impulsive excitation. Here, we propose a generalized virtual-wave
photothermal tomography framework that extends the diffusion-to-wave
transformation to arbitrary boundary excitations, including pulsed,
harmonic, and chirped waveforms. Starting from the heat equation with a
general source term, we derive a Fredholm integral mapping between the
measured diffusion field and a virtual wave field governed by a wave
equation, explicitly enforcing causality and thermodynamic
irreversibility. The resulting ill-posed inverse problem is solved using
ADMM or truncated SVD, depending on the excitation characteristics.
Numerical and experimental results demonstrate that the proposed method
converts blurred thermal responses into wave-like fields with clear
wavefronts and reflections, enabling improved depth localization and
tomographic reconstruction. Experiments on carbon fiber reinforced
polymer samples with embedded defects show enhanced contrast, sharper
boundaries, and more reliable depth interpretation compared with
conventional thermographic techniques. This work establishes a unified
and physically grounded framework for wave-based photothermal tomography
under realistic excitation conditions.],
)
]

= Introduction
<1>
Composite materials have been widely used in aerospace, energy, and
advanced manufacturing due to their superior mechanical properties,
lightweight characteristics, and corrosion resistance. However, their
heterogeneous and multilayered structures make them particularly
susceptible to hidden defects such as delamination, voids, and
micro-cracks, which may severely compromise structural integrity and
reliability. Therefore, developing effective non-destructive testing
(NDT) techniques for composite materials is of critical importance for
ensuring safety and performance in industrial applications. Photothermal
imaging techniques were considered as a contactless and non-invasive
method based on the thermal effect generated when materials absorb light
radiation. It acquires information by measuring changes in thermal
distribution on the surface or within materials caused by light
excitation. Photothermal imaging techniques have been widely employed in
chemical~#ref-list(<ref1>), industrial~#ref-list(<ref2>), biomedical~#ref-list(<ref3>), and cultural
heritage~#ref-list(<ref4>) fields. However, different from acoustic or
electromagnetic methods, photothermal techniques are governed by the
heat diffusion equation, which is a parabolic-type partial differential
equation (PDE). This leads to the irreversible nature of photothermal
techniques. Furthermore, the absence of wavefront and mathematically
smoothing effect in thermal waves cause the image blurring and lack
important high-frequency information.

Quantitative inversion based on thermal diffusion-wave field has been
studied from the last century. Maldague et al.~#ref-list(<ref5>, <ref6>, <ref7>) proposed
the phase-based method for evaluating the defect depth. The core idea is
to solve the one-dimensional heat conduction equation with lock-in
excitations. That will offer a quantitative relationship between depth
and amplitude. Subsequently, they discovered that the depth information
provided by the phase was 1̃.78 times that of the
amplitude~#ref-list(<ref8>, <ref9>, <ref10>). Parker et al.~#ref-list(<ref11>) first derived the
analytical solution for one-dimensional heat conduction equation with
flash Dirac pulse excitation. Based on this analytical solution, one can
define a thermal diffusion time $t_(upright(d i f f)) = L^2 \/ alpha$
and a thermal diffusion length $L_(upright(d i f f)) = sqrt(alpha t)$,
which describe the typical scales over which heat spreads in time t,
where $alpha$ denotes the thermal diffusivity. Furthermore, Mandelis et
al.~#ref-list(<ref12>) defines a quantitative relationship between time and depth
based on the heat mass location. To this end, they proposed a match
filtering-based photothermal coherence tomography technique~#ref-list(<ref13>). This
photothermal coherence tomography requires chirp-pulsed excitation and
high framerate infrared camera. Subsequently, Zhu et al.~#ref-list(<ref14>)
developed a frequency multiplexed photothermal correlation tomography
technique for extending the chirp-pulsed excitation to arbitrary
excitation. From the development of quantitative analysis, one can find
that the one-dimensional quantitative detection is not sufficient for
the increasing demands. Three-dimensional tomography has been obtaining
more attention.

Image deblurring and denoising are also a hot issue in photothermal
imaging fields. Pilla et al.~#ref-list(<ref15>, <ref16>) proposed a difference absolute
contrast method, which is a simple but effective method for removing the
background noise. The pulsed phase thermography (PPT) was then proposed
by Maldague~#ref-list(<ref17>) based on the Fourier transform, which has been widely
in real industrial inspection. Shepard et al.~#ref-list(<ref18>) proposed the
thermal signal reconstruction (TSR) method, which is based on the
mathematical relation between thermal signal and time in the logarithmic
field. In addition, Rajic~#ref-list(<ref19>) proposed a principal component
analysis-based method for three-dimensional thermal sequence data. The
above signal processing techniques are famous in the infrared
thermography fields such that every new developed method would like to
compare with them. However, there is no obvious proof shown that which
method is better than the conventional method with robustness and
applicability. In particular, the artificial intelligence fails in this
problem neither in supervised~#ref-list(<ref20>) nor unsupervised learning~#ref-list(<ref21>).
Recently, researchers tried to use structural illumination
techniques~#ref-list(<ref22>, <ref23>, <ref24>) for achieving super-resolution imaging in
photothermal fields. However, since photothermal imaging requires to
acquire time-series data and the structural illumination techniques rely
on multiple capturing with different patterns, the entire processing is
extremely time-consuming compared with existed photothermal imaging
techniques.

The above quantitative analysis and image denoising do not address the
root cause of the problem. For instance, since the absence of wavefront,
artificial definition of thermal diffusion length provides an ambiguous
boundary resulting in inevitable errors when material or equipment
changes. As for the image processing methods, they mostly repair the
signal after diffusion degradation, rather than altering or constraining
the physical processes themselves that cause the degradation. Recently,
Burgholzer et al.~#ref-list(<ref25>, <ref26>, <ref27>) proposed the concept of virtual
waves, which links the diffusion equation to the wave equation under
Dirac pulse excitation. In this case, the photothermal imaging results
will be altered to the ultrasound results. This provides a new mind for
photothermal signal reconstruction~#ref-list(<ref28>, <ref29>, <ref30>).

In this work, we use a more reasonable theoretical derivation in
mathematics -- considering a general boundary-injected forms of heat
excitation rather than considering the Dirac pulse as the initial
condition. Under this formalism, we can extend the virtual wave method
from the Dirac pulse excitation to arbitrary excitation, which allows us
to use more advanced signal processing techniques in radar, lock-in, or
coded signal analysis. The theory of the generalized virtual wave
photothermal tomography technique was derived. And numerical simulation
and photothermal experiments are employed to validate the feasibility
and accuracy of this proposed method.

= Generalized virtual wave photothermal tomography technique
<2>
== Principle
<principle>
The heat conduction in isotropic medium is governed by the heat
diffusion equation~#ref-list(<ref31>):
$ (nabla^2 - 1 / alpha frac(partial, partial t)) T \( upright(bold(r)) \, t \) = - 1 / kappa Q \( upright(bold(r)) \, t \) \, $<eq1>
where $T \( upright(bold(r)) \, t \)$ denotes the temperature field,
$alpha$ denotes the thermal diffusivity, $kappa$ denotes the thermal
conductivity, and $Q \( upright(bold(r)) \, t \)$ denotes an externally
applied heat source. Equation~#ref(<eq1>, supplement: none) is obtained by
rearranging the standard heat equation into a Helmholtz-like operator
form for later comparison.

A scalar wave field $p \( upright(bold(r)) \, t \)$ obeys the wave
equation:
$ (nabla^2 - 1 / c^2 frac(partial^2, partial t^2)) p \( upright(bold(r)) \, t \) = - 1 / c^2 Q \( upright(bold(r)) \, t \) \, $<eq2>
where $c$ is the wave speed. We assume the same temporal waveform of the
source term $Q \( upright(bold(r)) \, t \)$ in both equations, while
allowing different physical units.

To establish a formal connection between diffusion and wave phenomena,
we introduce a virtual wave field
$T_(upright(v i r t)) \( upright(bold(r)) \, t \)$ defined as:
$ (nabla^2 - 1 / c^2 frac(partial^2, partial t^2)) T_(upright(v i r t)) \( upright(bold(r)) \, t \) = - 1 / c^2 Q \( upright(bold(r)) \, t \) . $<eq3>

The Fourier transform pair is defined as:
$ tilde(T) \( upright(bold(r)) \, omega \) = integral_(- oo)^oo T \( upright(bold(r)) \, t \) e^(- i omega t) thin d t \, $<eq4>

$ T \( upright(bold(r)) \, t \) = frac(1, 2 pi) integral_(- oo)^oo tilde(T) \( upright(bold(r)) \, omega \) e^(i omega t) thin d omega \, $<eq5>
where $tilde(T) \( upright(bold(r)) \, omega \)$ is the temperature
field in frequency space.

Applying the Fourier transform to Eq.~#ref(<eq1>, supplement: none) yields:
$ (nabla^2 - sigma^2 \( omega \)) tilde(T) \( upright(bold(r)) \, omega \) = - 1 / kappa tilde(Q) \( upright(bold(r)) \, omega \) \, $<eq6>
where $sigma^2 \( omega \) equiv i omega \/ alpha$. The complex
wavenumber $sigma \( omega \)$ is chosen such that
$upright(R e) \[ sigma \( omega \) \] > 0$, ensuring spatially decaying
thermal diffusion waves.

Similarly, the frequency-domain form of Eq.~#ref(<eq3>, supplement: none) reads:
$ (nabla^2 + k^2 \( omega \)) tilde(T)_(upright(v i r t)) \( upright(bold(r)) \, omega \) = - 1 / c^2 tilde(Q) \( upright(bold(r)) \, omega \) \, $<eq7>
with the real wavenumber $k \( omega \) equiv omega \/ c$.
Eqs.~#ref(<eq6>, supplement: none) and #ref(<eq7>, supplement: none) are both
Helmholtz-type equations; however, Eq.~#ref(<eq6>, supplement: none) involves a
complex wavenumber characteristic of diffusion, while
Eq.~#ref(<eq7>, supplement: none) describes propagating waves.

Motivated by the formal similarity between Eqs.~#ref(<eq6>, supplement: none)
and #ref(<eq7>, supplement: none), we introduce a correspondence between the
thermal diffusion field and the virtual wave field via analytic
continuation in the complex frequency plane. Specifically, replacing
$omega$ in Eq.~#ref(<eq7>, supplement: none) by $- i c sigma \( omega \)$ leads
to
$ tilde(T) \( upright(bold(r)) \, omega \) = c^2 / kappa thin tilde(T)_(upright(v i r t)) \( upright(bold(r)) \, - i c sigma \( omega \) \) \, $<eq8>
which defines a mapping between the diffusion field and the virtual wave
field in the frequency domain.

Equation~#ref(<eq8>, supplement: none) should be regarded as a mathematically
constructed correspondence rather than a physical equivalence.
Transforming Eq.~#ref(<eq8>, supplement: none) back to the time domain yields
$ T \( upright(bold(r)) \, t \) = frac(1, 2 pi) integral_(- oo)^oo c^2 / kappa tilde(T)_(upright(v i r t)) \( upright(bold(r)) \, - i c sigma \( omega \) \) e^(i omega t) thin d omega \, $<eq9>

where
$ tilde(T)_(upright(v i r t)) \( upright(bold(r)) \, - i c sigma \( omega \) \) = integral_(- oo)^oo T_(upright(v i r t)) \( upright(bold(r)) \, t' \) e^(- c sigma \( omega \) t') thin d t' . $

Equation~#ref(<eq9>, supplement: none) can be rewritten as a Fredholm integral
equation of the first kind,
$ T \( upright(bold(r)) \, t \) = integral_(- oo)^oo T_(upright(v i r t)) \( upright(bold(r)) \, t' \) thin K \( t \, t' \) thin d t' \, $<eq10>
where the kernel $K \( t \, t' \)$ enforces causality.

The kernel can be evaluated analytically as
$ K \( t \, t' \) = c^2 / kappa frac(t', 2 sqrt(pi) \( alpha t \)^(3 \/ 2)) exp #h(-1em) (- frac(c^2 t' ""^2, 4 alpha t)) H \( t \) thin H \( t' \) \, $<eq11>
where $H \( dot.op \)$ denotes the Heaviside step function.

The kernel explicitly enforces causality and reflects the irreversible
nature of thermal diffusion, whereby the temperature field at time $t$
depends on contributions from all prior virtual-wave times $t' > 0$.
Eqs.~#ref(<eq10>, supplement: none) and #ref(<eq11>, supplement: none) connect the
temperature signal to the virtual wave signal at the same spatial
location $upright(bold(r))$ via a Fredholm integral equation of the
first kind (Fig.~1a).

Due to the fact that the photothermal signal is discrete in time and
space, Eq.~#ref(<eq10>, supplement: none) can be discretized as
$ upright(bold(T)) = upright(bold(K)) upright(bold(T))_(upright(v i r t)) \, $<eq12>
where $upright(bold(T))$ and $upright(bold(T))_(upright(v i r t))$
denote the measured photothermal signal and the virtual wave signal at
discrete time steps, respectively.

The inversion of Eq.~#ref(<eq12>, supplement: none) is ill-conditioned because
the matrix $upright(bold(K))$ is rank-deficient: (1) thermal diffusion
spreads heat in time, similar to how wave scattering smooths acoustic
pressure signals, leading to nearly linearly dependent columns of
$upright(bold(K))$\; (2) short-time features of the virtual wave are
exponentially attenuated in the thermal response, analogous to
high-frequency ultrasound attenuation in tissue; (3) direct inversion
amplifies measurement noise, producing unphysical oscillations in the
reconstructed virtual wave.

The numerical methods for harmonic and multi-pulse excitations are
presented in the following section.

== Numerical calculation for pulse excitation
<numerical-calculation-for-pulse-excitation>
An iterative non-linear regularization technique, the alternating
direction method of multipliers (ADMM), is used to reconstruct
$upright(bold(T))_(upright(v i r t))$. ADMM enables the incorporation of
sparsity as prior information, reducing artificial oscillations in the
solution.

We assume sparsity in the virtual wave field due to a limited number of
material interfaces. The inverse problem can be formulated as
$ min_(upright(bold(T))_(upright(v i r t))) 1 / 2 parallel upright(bold(K)) upright(bold(T))_(upright(v i r t)) - upright(bold(T)) parallel_2^2 + lambda_(upright(A D M M)) parallel upright(bold(T))_(upright(v i r t)) parallel_1 \, $<eq13>
where the $ell_1$-norm promotes sparsity in
$upright(bold(T))_(upright(v i r t))$. The regularization parameter
$lambda_(upright(A D M M))$ is determined using the L-curve criterion.
The discretized version for two spatial dimensions $x$ and $y$ is given
in Eq.~#ref(<eq12>, supplement: none), where
$upright(bold(T)) in bb(R)^(N_t times N_x times N_y)$,
$upright(bold(K)) in bb(R)^(N_t times N_(t'))$, and
$upright(bold(T))_(upright(v i r t)) in bb(R)^(N_(t') times N_x times N_y)$.

The entries of the discrete kernel
$upright(bold(K)) = \[ K_(i \, j) \] in bb(R)^(N_t times N_(t'))$ are
computed as
$ K \( i \, j \) = tilde(c)^(thin 2) / kappa frac(\( j - 1 \), 2 sqrt(pi) \( tilde(alpha) i \)^(3 \/ 2)) exp #h(-1em) (- frac(tilde(c)^(thin 2) \( j - 1 \)^2, 4 tilde(alpha) i)) \, $<eq14>
where $tilde(c) = c Delta t \/ Delta z$ and
$tilde(alpha) = alpha Delta t' \/ Delta z^2$ are dimensionless
parameters representing normalized wave speed and thermal diffusivity,
respectively. Here $Delta t$, $Delta t'$, and $Delta z$ denote the time,
virtual time, and spatial step sizes.

== Numerical calculation for harmonic wave excitation
<numerical-calculation-for-harmonic-wave-excitation>
We perform the singular value decomposition (SVD) of the kernel matrix:
$ upright(bold(K)) = upright(bold(U)) upright(bold(Sigma)) upright(bold(V))^T \, $<eq15>
where $upright(bold(U)) = \( u_1 \, dots.h \, u_N \)$ and
$upright(bold(V)) = \( v_1 \, dots.h \, v_N \)$ are orthonormal
matrices, and
$upright(bold(Sigma)) = upright(d i a g) \( sigma_1 \, dots.h \, sigma_N \)$
with $sigma_1 gt.eq sigma_2 gt.eq dots.h.c gt.eq sigma_N gt.eq 0$. The
formal solution of the inverse problem is given by
$ upright(bold(T))_(upright(v i r t)) = sum_(n = 1)^N frac(u_n^T upright(bold(T)), sigma_n) thin v_n . $<eq16>

Because thermal diffusion suppresses high temporal frequencies
exponentially, the singular values decay approximately as
$sigma_n tilde.op exp \( - beta n \)$, where
$beta prop sqrt(alpha) \/ Delta t$. As a result, small singular values
dominate the inversion and amplify noise.

To stabilize the inversion, we introduce a truncation index $r$ and
define the truncated inverse operator as
$ upright(bold(K))_r^(- 1) = sum_(n = 1)^r 1 / sigma_n v_n u_n^T \, $<eq17>
and the reconstructed virtual wave field becomes
$ upright(bold(T))_(upright(v i r t))^(\( r \)) = sum_(n = 1)^r frac(u_n^T upright(bold(T)), sigma_n) thin v_n . $<eq18>
which removes components associated with $sigma_n lt.double sigma_r$.
The diffusion kernel in Eq.~#ref(<eq11>, supplement: none) acts as a temporal
Gaussian filter with characteristic width
$ delta t tilde.op frac(4 alpha t, c^2) . $

Thus, the effective temporal bandwidth of recoverable virtual-wave
components satisfies $ omega_max tilde.op frac(c^2, 4 alpha t) . $

The truncation index $r$ therefore corresponds to a diffusion-limited
temporal resolution, analogous to the diffraction limit in wave imaging.
Equivalently, the Picard condition can be written as
$ \| u_n^T upright(bold(T)) \| lt.double sigma_n quad upright("for large ") n . $

Stable inversion requires truncation before the noise floor intersects
the singular spectrum. From Eq.~#ref(<eq11>, supplement: none), short-time
virtual-wave components are attenuated as
$ exp #h(-1em) (- frac(c^2 t' ""^2, 4 alpha t)) . $

The smallest resolvable virtual time satisfies
$ t'_min tilde.op sqrt(frac(4 alpha t, c^2) ln #h(-1em) (1 / upright(S N R))) . $

Hence, truncated SVD (T-SVD) does not merely regularize numerically; it
enforces the thermodynamic irreversibility constraint inherent in
diffusion. The T-SVD inversion operator reads
$ upright(bold(T))_(upright(v i r t))^(\( r \)) = upright(bold(V))_r upright(bold(Sigma))_r^(- 1) upright(bold(U))_r^T upright(bold(T)) \, $<eq19>
where the subscript $r$ denotes restriction to the dominant singular
subspace.

== Relationship between excitation waveform and inversion strategy
<relationship-between-excitation-waveform-and-inversion-strategy>
From a signal representation perspective, the suitability of ADMM or
T-SVD is closely related to the temporal structure of the thermal
excitation. A pulse-type excitation generates a thermal response that is
localized in virtual time, i.e.,
$ T_(upright(v i r t)) \( t' \) = sum_(k = 1)^K a_k delta \( t' - t'_k \) \, $<eq20>
or, more generally, a piecewise-smooth signal with a small number of
dominant events associated with defect activation. When discretized,
such signals admit a sparse representation in the time domain, meaning
that most entries of $T_(upright(v i r t))$ are close to zero. For this
class of signals, the reconstruction naturally leads to an
$ell_1$-regularized formulation, since the solution satisfies
$ parallel T_(upright(v i r t)) parallel_0 lt.double N_(t') \, $<eq21>
where $parallel dot.op parallel_0$ denotes the number of non-zero
components. ADMM explicitly promotes this sparsity by minimizing the
convex surrogate $parallel T_(upright(v i r t)) parallel_1$, allowing
sharp temporal transitions to be preserved even under strong
diffusion-induced blurring. Consequently, burst-induced non-harmonic
responses are reconstructed more faithfully using ADMM, with reduced
ringing artifacts and improved localization of defect-related events. In
contrast, under harmonic modulated excitation, the thermal response can
be approximated as
$ T \( t \) = upright(R e) { A \( omega \) e^(i omega t) } \, $<eq22>
which, after inversion, yields a virtual-wave field dominated by a small
number of narrowband frequency components. In the SVD framework, such
signals exhibit a strong projection onto the leading singular vectors
$u_n$ ($n = 1 \, dots.h \, r$), i.e.,
$ \| u_n^T upright(bold(T)) \| gt.double 0 quad upright("for ") n lt.eq r \, #h(2em) \| u_n^T upright(bold(T)) \| approx 0 quad upright("for ") n > r . $<eq23>
thereby satisfying the Picard condition. The energy of harmonic
excitation is thus concentrated in the dominant singular subspace,
making T-SVD an efficient and physically consistent inversion method.
The truncation index r effectively removes diffusion-dominated
high-order modes, while retaining the coherent harmonic response with
minimal bias. Therefore, ADMM and T-SVD are not interchangeable
numerical tools, but rather correspond to different assumptions on the
temporal sparsity or spectral compactness of the virtual thermal wave
field. Pulse-type, non-harmonic excitations favor sparse, time-localized
reconstructions and are best handled by ADMM, whereas harmonic
excitations generate spectrally compact responses that align naturally
with the low-rank structure exploited by T-SVD.

= Numerical simulation results
<3>
The first example considers the most commonly used Dirac pulse
excitation. In practice, pulsed excitation always has a finite temporal
width. Therefore, to better approximate real experiments, the heat
excitation is modeled as a square pulse with a duration of 2 ms. The
tested material is stainless steel
($40 med upright(m m) times 4 med upright(m m)$, where the depth and
size of defects are $1 med upright(m m)$ and $10 med upright(m m)$),
with thermal conductivity
$kappa = 16.2 med upright(W thin m^(- 1) K^(- 1))$, density
$rho = 7900 med upright(k g thin m^(- 3))$, and heat capacity
$c_p = 477 med upright(J thin k g^(- 1) K^(- 1))$.

The temperature variations between defect and sound (non-defect) regions
are shown in Fig.~1b. According to the artificially defined tomographic
relationship, time is often related to depth via the diffusion length
$ L_(upright(d i f f)) = sqrt(alpha t) . $

However, the defect appears in the first frame and gradually diffuses
with time/depth (Fig.~#ref(<fig1>, supplement: none)e), which is attributed to the Markovian
nature of heat diffusion. This demonstrates that time-domain signals
cannot be directly interpreted as depth-resolved tomographic
information, since heat propagation is not bounded by a finite
propagation velocity.

Following Zhu et al.~#ref-list(<ref14>), the frequency in the one-dimensional
analytical solution under sinusoidal excitation can be treated as a
continuous variable. Thus, the frequency-domain response of pulsed
thermography can be interpreted as a superposition of harmonic
components with different frequencies, where the thermal diffusion
length is given by $ mu = sqrt(frac(alpha, pi f)) . $

The amplitude tomograms exhibit depth-dependent variations
(Fig.~#ref(<fig1>, supplement: none)f). However, since heat transport is governed by
gradient-driven diffusion, the amplitude tomograms do not exhibit sharp
boundaries. Moreover, the reconstructed depths deviate from the true
physical depth when using an automatically calibrated colormap.

Similar behavior is observed in phase tomograms (Fig.~#ref(<fig1>, supplement: none)g). Although
the main defect distribution in the phase image is closer to the true
depth compared to the amplitude image, photothermal tomography remains
limited by blurred boundaries and an artificially defined
depth--frequency relationship~#ref-list(<ref32>, <ref33>, <ref34>).

#figure(image("source/Picture1.png", width: 100.0%),
  caption: [
    The transformation from diffusion-wave field to virtual-wave field
    for Dirac pulse excitation. a Schematic image of virtual wave
    method. b Temperature variation between defect area and sound area.
    c Virtual-wave variation between defect area and sound area. d
    Virtual-wave tomography results. e Time-domain photothermal
    tomography results. f Amplitude-based tomography results. g
    Phase-based tomography results.
  ]
)
<fig1>

Virtual-wave transformation in this work thoroughly changes this
situation. Based on the derived relation (Eqs.~#ref(<eq10>, supplement: none)
and~#ref(<eq11>, supplement: none)) between thermal diffusion-wave equation and
wave equation, the photothermal signal can be transformed into the
wave-like signal using ADMM algorithm. The transformed results are shown
in Fig.~#ref(<fig1>, supplement: none)c. It is possible to find that the defect area has a
clearly reflected echo. Furthermore, the sound area presents a reflected
echo caused by the back side. The thickness of the sample is impossible
to achieve in any photothermal signal because the direction in
diffusion-wave field is one-way~#ref-list(<ref35>). The clear and gradient-unrelated
tomogram is obtained by reconstructing the entire virtual-wave field
(Fig.~#ref(<fig1>, supplement: none)d). Different from the previous work in photothermal
reconstruction~#ref-list(<ref36>, <ref37>), we construct a real wavefront in
photothermal signals.

Then, we try to use virtual wave methods to reconstruct the photothermal
signal under modulated excitations, including harmonic wave~#ref-list(<ref38>) and
chirp-pulsed signals~#ref-list(<ref39>). For the harmonic wave, the modulation
frequency is set to 1 Hz. The temperature variation between defect area
and sound area is shown in Fig.~#ref(<fig2>, supplement: none)a. The first-order linear fitting
was used to remove the DC component. According to the amplitude signals
(Fig.~#ref(<fig2>, supplement: none)a), it is clear to find that the peak is located at 1 Hz.
Different from pulsed excitation, truncated singular value decomposition
(T-SVD) was employed to numerically calculate the inverse problem for
harmonic wave excitations. The reconstructed virtual wave signals are
shown in Fig.~#ref(<fig2>, supplement: none)b. Then, the virtual-wave signals were transformed
into the frequency domain. It is also obvious that the peak located
around 0.5 Hz since the T-SVD cannot provide a perfect inversion
(Fig.~#ref(<fig2>, supplement: none)b). The entire virtual wave field map in the time domain is
shown in Fig.~#ref(<fig2>, supplement: none)c. By transforming the virtual wave field into the
frequency domain, it is clear to find two subsurface defects
(Fig.~#ref(<fig2>, supplement: none)c). These results demonstrate the accuracy of the derived
virtual wave equations. Compared to harmonic signals, the clear
advantage of shirt pulse capable of maintaining a flat power spectrum
over a very broad bandwidth, even under diffusive attenuation losses.
The chirped-pulse thermal-diffusion-wave radar technique has the
advantages of a highly compressed output with negligible side-lobe power
distribution led to a much improved signal-to-noise ratio (SNR) and
depth profiling capability. In this work, a fixed-width excitation pulse
in the frequency range between 0.2 and 0.6 Hz, a chirp duration of 12 s,
and pulse duration of the excitation chirp of 2 ms was used
(Fig.~#ref(<fig2>, supplement: none)e). The ADMM was employed to numerically calculate virtual
wave signals. Of note, since heat diffusion is a linear superposition
system, we separated the chirp-pulsed excitation based on the beginning
position of each peak before using ADMM algorithm (Fig.~#ref(<fig2>, supplement: none)f). The
reconstructed virtual wave signals in the time and frequency domain are
shown in Fig.~#ref(<fig2>, supplement: none)g. It is clear to find the decreasing magnitude
echoes in the defect area. Compared with the single-frequency harmonic
wave excitation, chirp-pulsed excitation exhibits a broad bandwidth
(Fig.~#ref(<fig2>, supplement: none)g). The reconstructed virtual wave field in the time and
frequency domain is shown in Fig.~#ref(<fig2>, supplement: none)d. It is possible to find that
the chirp-pulsed signals exhibit highly compressed output with
negligible side-lobe power distribution.

#figure(image("source/Picture2.png", width: 100.0%),
  caption: [
    The transformation from diffusion-wave field to virtual-wave field
    for modulated excitation. a Temperature signals under lock-in
    excitations in the time and frequency domain. b Reconstructed
    virtual wave signals under lock-in excitations in the time and
    frequency domain. c Reconstructed virtual wave field under lock-in
    excitations in the time and frequency domain. d Reconstructed
    virtual wave field under chirp-pulsed excitations in the time and
    frequency domain. e The excitation signal. f The temperature
    response signal under chirp-pulsed excitations. g Reconstructed
    virtual wave signals under chirp-pulsed excitations in the time and
    frequency domain.
  ]
)
<fig2>

= Photothermal experiment results
<4>
== Experimental setup
<experimental-setup>
The resulting temperature rise was recorded with a spatial resolution of
$Delta x \, Delta y = 52 med mu upright(m)$ at a frame rate of
$f_(upright(c a m)) = 100 med upright(H z)$ using a cooled mid-wave
infrared (MWIR) camera (ImageIR 9300, Infratec). To achieve coaxial
alignment of the laser illumination and IR detection, a dichroic mirror
was used, which reflects the $lambda = 940 med upright(n m)$ laser while
transmitting in the MWIR spectral range. The region of interest (ROI)
was sampled over $n_m = 403$ measurement points arranged on a grid with
spacing $r_d = 0.743 med upright(m m)$.

#figure(image("source/Picture3.png", width: 100.0%),
  caption: [
    The photothermal experimental setup and results. a Experimental
    setup. b The excitation signal waveform. c The photograph of tested
    sample. d Original results from pulse excitation. e Original results
    from lock-in excitation. f Original results from chirp-pulsed
    excitation.
  ]
)
<fig3>

== Experimental results
<experimental-results>
#figure(image("source/Picture4.png", width: 100.0%),
  caption: [
    The signal analysis for photothermal experiments. a Temporal and
    frequency-domain signal under pulse excitation. b Temporal and
    frequency-domain signal under lock-in excitation. c Temporal and
    frequency-domain signal under chirp-pulsed excitation. d
    Frequency-domain results from pulse excitation. e Frequency-domain
    results from lock-in excitation. f Frequency-domain results from
    chirp-pulsed excitation.
  ]
)
<fig4>

To validate the proposed generalized virtual wave theory, photothermal
experiments were conducted. The laser beam generated by a laser source
was reflected by a mirror and projected onto the sample surface, forming
a spatially modulated rectangular heating region. The temporal profile
of the excitation was controlled by a signal generator, enabling
arbitrary waveform modulation. The resulting surface temperature
evolution and spatial distribution were recorded using an infrared
camera. A dichroic mirror was used to establish a $90^compose$ optical
path while preventing the reflected laser beam from directly entering
the infrared camera (Fig.~#ref(<fig3>, supplement: none)a). The excitation waveforms can be
classified into three types: pulse excitation~#ref-list(<ref40>), lock-in
excitation~#ref-list(<ref41>), and chirp-pulsed excitation~#ref-list(<ref42>) (Fig.~3b). The
pulse duration of the pulse excitation is 120 ms. The modulation
frequency of the lock-in excitation is 0.2 Hz. For the chirp-pulsed
excitation, a frequency-swept excitation in the range of 0.2--0.6 Hz is
used, with a chirp duration of 16 s and a pulse width of 100 ms. The
tested sample consists of two carbon fiber-reinforced polymer (CFRP)
laminates with a Teflon insert sandwiched between them (Fig.~#ref(<fig3>, supplement: none)c).
The thermal properties of the CFRP laminate are: thermal conductivity
$k = 0.8 med upright(W thin m^(- 1) K^(- 1))$, heat capacity
$c_p = 1200 med upright(J thin k g^(- 1) K^(- 1))$, and density
$rho = 1600 med upright(k g thin m^(- 3))$. For Teflon, the thermal
conductivity, heat capacity, and density are
$0.25 med upright(W thin m^(- 1) K^(- 1))$,
$1050 med upright(J thin k g^(- 1) K^(- 1))$, and
$2170 med upright(k g thin m^(- 3))$, respectively.

The original results under pulse excitation are shown in Fig.~#ref(<fig3>, supplement: none)d. It
is possible to observe the obscured delamination at 0.66 s and 1.32 s.
The defect contrast becomes lower at 3.33 s. However, it is still not
clear to find the exact boundary or shape of this delamination defect.
The original results under lock-in excitation are shown in Fig.~#ref(<fig3>, supplement: none)e.
Unfortunately, it is difficult to detect the delamination defect in the
time domain. The original results under chirp-pulsed excitation are
shown in Fig.~#ref(<fig3>, supplement: none)f. It is obvious to observe the delamination with
time increasing. In addition, the defect contrast under chirp-pulsed
excitation is higher than that under pulse excitation.

To further analyze the defect feature, the temporal and frequency-domain
signals were extracted, as shown in Fig.~@fig4. According to the
time-domain signals of defect and sound area (Fig.~#ref(<fig4>, supplement: none)a), the
temperature exhibits difference in two regions before 2.7 s and after 4
s. The frequency-domain signals show that the signal energy
significantly decreases after 5 Hz. As for the lock-in excitation, it is
no obvious difference between defect and sound area in the time domain
(Fig.~#ref(<fig4>, supplement: none)b). Therefore, the defect cannot be detected in the previous
temporal results (Fig.~#ref(<fig3>, supplement: none)e). The frequency-domain signal demonstrates
a sharp peak at 0.2 Hz, which is also the modulated frequency of the
lock-in heat source. The chirp-pulsed signals between defect and sound
area present obvious difference after the last pulse excitation
(Fig.~#ref(<fig4>, supplement: none)c). It is noted that the frequency-domain signals under
chirp-pulsed excitation demonstrate wider spectrum than that under pulse
excitation. This is because the chirp excitation sweeps through a range
of frequencies during the excitation period, it injects energy over a
broader frequency band than a single short pulse, resulting in a wider
spectrum in the frequency domain.

The frequency-domain results under pulse excitation are shown in
Fig.~#ref(<fig4>, supplement: none)d. The delamination area in the frequency domain becomes more
obvious than that in the time domain (Fig.~#ref(<fig3>, supplement: none)d). The rectangular
shape of the inserted Teflon can be detected at 0.1, 0.2, and 0.3 Hz.
For results under lock-in excitation, only 0.2 Hz frequency component
provides effective information for the tested sample and delamination
defect (Fig.~#ref(<fig4>, supplement: none)e). As for results under chirp-pulsed excitation, the
delamination can be detected before 0.71 Hz (Fig.~#ref(<fig4>, supplement: none)f). However, it
disappears at 0.76 Hz. Combining the knowledge of frequency-domain
signal feature analysis (Fig.~#ref(<fig4>, supplement: none)c), chirp-pulsed excitation has
sufficient energy within 10 Hz. Therefore, the thermogram at 0.76 Hz
provides accurate information that the delamination interface is related
to this frequency component.

#figure(image("source/Picture5.png", width: 100.0%),
  caption: [
    The virtual wave reconstruction of photothermal experiments. a
    Temporal and frequency-domain signal under pulse excitation. b
    Time-domain virtual wave images under pulse excitation. c
    Frequency-domain virtual wave images under pulse excitation. d
    Temporal and frequency-domain signal under lock-in excitation. e
    Time-domain virtual wave images under lock-in excitation. f
    Frequency-domain virtual wave images under lock-in excitation. g
    Temporal and frequency-domain signal under chirp-pulsed excitation.
    h Time-domain virtual wave images under chirp-pulsed excitation. i
    Frequency-domain virtual wave images under chirp-pulsed excitation.
  ]
)
<fig5>

Figure~@fig5 presents the virtual‑wave reconstruction results obtained
from photothermal experiments under pulse, lock‑in, and chirp‑pulsed
excitations, providing a direct experimental validation of the
generalized virtual‑wave framework. In all three cases, the
reconstructed virtual‑wave signals and images exhibit wave‑like
characteristics that are absent in the original thermal diffusion data,
demonstrating the successful transformation from a diffusive field to a
propagative representation. For pulse excitation (Fig.~#ref(<fig5>, supplement: none)a-c), the
reconstructed virtual‑wave signals show distinct, temporally localized
peaks in the defect region that are clearly separated from those in the
sound region. These sharp echoes are characteristic of wave reflections
from material interfaces and stand in strong contrast to the broadened,
monotonically decaying temperature responses typically observed in
time‑domain thermography. The corresponding time‑domain virtual‑wave
images (Fig.~#ref(<fig5>, supplement: none)b) reveal a well‑defined subsurface feature with clear
spatial boundaries appearing at specific virtual times, while the
frequency‑domain virtual‑wave images (Fig.~#ref(<fig5>, supplement: none)c) exhibit consistent
defect contrast over a limited frequency range. This behavior indicates
that the pulse excitation generates a sparse virtual‑wave response
dominated by a small number of reflection events, which is well suited
to ADMM‑based inversion and enables accurate localization of the
delamination interface. Under lock‑in excitation (Fig.~#ref(<fig5>, supplement: none)d-f), the
temporal virtual‑wave signals exhibit a quasi‑periodic structure
inherited from the harmonic heating, with a pronounced difference
between defect and sound areas becoming evident only after virtual‑wave
reconstruction. While the original thermal signals in the time domain
show little contrast, the virtual‑wave representation converts
phase‑shifted diffusive responses into wave‑like oscillations whose
amplitudes and phases vary spatially. The time‑domain virtual‑wave
images (Fig.~#ref(<fig5>, supplement: none)e) display defect‑related patterns that are difficult
to identify in conventional lock‑in thermography, and the
frequency‑domain virtual‑wave images (Fig.~#ref(<fig5>, supplement: none)f) highlight the
delamination most clearly at specific frequencies corresponding to the
effective penetration depth of the harmonic excitation. These results
confirm that, although lock‑in excitation is intrinsically narrowband,
the virtual‑wave transformation enables wave‑based interpretation and
depth‑selective imaging through frequency discrimination. The
chirp‑pulsed excitation results (Fig.~#ref(<fig5>, supplement: none)g-i) further illustrate the
advantages of combining broadband thermal excitation with the
generalized virtual‑wave framework. The reconstructed virtual‑wave
signals show a sequence of decaying echoes with a substantially broader
frequency content than those obtained under pulse or lock‑in excitation.
In the time‑domain virtual‑wave images (Fig.~#ref(<fig5>, supplement: none)h), the defect region
emerges with high contrast at well‑defined virtual times, while the
frequency‑domain images (Fig.~#ref(<fig5>, supplement: none)i) reveal consistent defect
visibility over a wide frequency range. This broadband response not only
improves signal‑to‑noise ratio through spectral averaging, but also
provides richer depth‑related information, as different frequency
components correspond to different effective propagation lengths in the
virtual‑wave domain. As a result, chirp‑pulsed excitation offers
superior robustness and depth interpretability compared with
single‑frequency lock‑in or single‑pulse heating.

For comparing the image quality (defect contrast) between different
results and methods, the quantitative metrics, the contrast-to-noise
ratio (CNR), was employed, which is a commonly used index in NDE fields.
The mathematical expression of CNR can be written as~#ref-list(<ref43>, <ref44>): The
contrast-to-noise ratio (CNR) is defined as
$ upright(C N R) = lr(|frac(mu_d - mu_s, sigma_s)|) \, $<eq24> where
$mu_d$ and $mu_s$ denote the mean values of the defect and sound
regions, respectively, and $sigma_s$ is the standard deviation of the
sound region.

Table~I provides a quantitative comparison of defect detectability for
different excitation waveforms by reporting the maximum CNR in both the
time and frequency domains, before and after virtual wave
reconstruction. For all three excitation schemes, the virtual wave
transformation leads to a significant improvement in CNR compared with
the raw thermographic data, confirming the effectiveness of the proposed
generalized virtual wave framework in mitigating diffusion-induced
blurring and background noise. The improvement is particularly
pronounced in the time domain for pulse and chirp-pulsed excitations,
where the CNR increases by several orders of magnitude after virtual
wave reconstruction. This indicates that diffusive thermal responses are
successfully transformed into wave-like signals with temporally
localized reflection events, enabling a substantially improved
separation between defect and sound regions. In contrast, lock-in
excitation exhibits relatively low CNR values in both raw and
virtual-wave-reconstructed results. This behavior can be attributed to
its inherently narrowband nature and limited depth sensitivity;
nevertheless, a consistent increase in CNR is still observed after
virtual wave processing, demonstrating the robustness of the proposed
method even under harmonic excitation. In the frequency domain, the CNR
enhancement is more moderate, reflecting the fact that frequency-domain
representations are dominated by specific effective frequency components
rather than temporally resolved reflection events.

#figure(
  align(center)[#table(
    columns: 7,
    align: (left,left,left,left,left,left,left,),
    [], table.cell(align: center, colspan: 3)[Raw], table.cell(align: center, colspan: 3)[Virtual
    wave],
    [Waveform], [Pulse], [Lock-in], [Chirp-pulsed], [Pulse], [Lock-in], [Chirp-pulsed],
    [Time-domain], [1.17], [0.03], [4.20], [34.87], [2.50], [10651.57],
    [Frequency-domain], [4.30], [3.29], [16.85], [12.88], [2.70], [2.96],
  )]
  , caption: [Quantitative comparison of CNR performance for different
  excitation waveforms in time and frequency domains before and after
  virtual wave reconstruction.]
  , kind: table
  ) <tab1>
== Comparison between existing photothermal coherence tomography techniques
<comparison-between-existing-photothermal-coherence-tomography-techniques>
Frequency-multiplexed photothermal coherence tomography (FM-PCT)~#ref-list(<ref14>)
is an emerging technique in infrared thermography for retrieving 3D
subsurface structures of tested samples. Compared with the enhanced
truncated-correlation photothermal coherence tomography (eTC-PCT)
technique~#ref-list(<ref13>), FM-PCT does not require a modulated chirp-pulsed
excitation or a high-frame-rate infrared camera. It shows excellent
performance for pulse excitation or reconstructed pulse-like signals,
such as linear scanning thermography. The photothermal tomography
results processed by FM-PCT and generalized virtual wave reconstruction
(GVWR) are shown in Fig.~@fig6. The tomograms at different depth layers
are presented in Fig.~6a. The delamination appears at approximately 2 mm
under pulse excitation. However, the chirp-pulsed results exhibit
spectral aliasing, although they provide a higher signal-to-noise ratio
(or defect contrast) compared with pulse excitation. The cross-sectional
tomograms are shown in Fig.~#ref(<fig6>, supplement: none)b. According to slices 1--4, the
delamination mainly exists in a thin region near the bottom of the
sample. The GVWR results for pulse excitation are shown in Fig.~#ref(<fig6>, supplement: none)c,
where the delamination is clearly visible and exhibits a continuous
profile. The GVWR results for chirp-pulsed excitation are shown in
Fig.~#ref(<fig6>, supplement: none)d, where the delamination exhibits extremely high contrast,
appearing as a well-defined structure. To further quantitatively compare
FM-PCT and GVWR, depth slices along the delamination and its surrounding
region were extracted, as shown in Fig.~#ref(<fig6>, supplement: none)e. Consistent with previous
analysis, the delamination exists only in a thin depth region. The
chirp-pulsed results exhibit spectral aliasing, as the delamination
appears at multiple depth locations and becomes discontinuous. In
contrast, GVWR results for both pulse and chirp-pulsed excitation
exhibit high accuracy and strong defect contrast. It is further noted
that the depth mapping in infrared thermography is inherently nonlinear
due to diffusive transport, regardless of whether time-domain or
frequency-domain representations are used. For example, the empirical
time-domain depth relation $z = 2 sqrt(alpha t) \/ sqrt(pi)$ was
reported by Mandelis et al.~#ref-list(<ref3>), while the frequency-domain thermal
diffusion length $mu = sqrt(alpha \/ pi f)$ was provided by Zhu et
al.~#ref-list(<ref14>). This explains why the delamination appears only within a
thin effective depth region. However, in GVWR, the depth relationship
follows a linear mapping $z = c t \/ 2$, analogous to ultrasonic wave
propagation, where $c$ is the virtual wave speed. Therefore, GVWR can be
regarded as a true tomographic reconstruction framework compared with
conventional photothermal coherence tomography techniques.

#figure(image("source/Picture6.png", width: 100.0%),
  caption: [
    The comparison between generalized virtual wave reconstruction
    (GVWR) and frequency multiplexed photothermal coherence tomography
    (FM-PCT) technique. a Photothermal tomography results from FM-PCT
    along various depth layers for pulse and chirp-pulsed excitations. b
    Cross-sectional results from FM-PCT for pulse and chirp-pulsed
    excitations. c Photothermal tomography results from GVWR for pulse
    excitation. d Photothermal tomography results from GVWR for
    chirp-pulsed excitation. e Depth Slices for FM-PCT and GVWR under
    pulse and chirp-pulsed excitations.
  ]
)
<fig6>

= Conclusion
<6>
In this work, we have developed a generalized virtual-wave photothermal
tomography framework that establishes a rigorous and unified
transformation from thermal diffusion-wave fields to wave-like
representations under arbitrary excitation conditions. By introducing a
Fredholm integral formulation derived from the heat diffusion equation,
the proposed method extends the virtual-wave concept beyond the
conventional Dirac pulse assumption to encompass pulse, harmonic, and
chirp-pulsed excitations. This generalization enables the use of
flexible excitation schemes and bridges the gap between
diffusion-dominated thermography and wave-based imaging methodologies.
Theoretical analysis demonstrates that the transformation intrinsically
preserves causality and thermodynamic irreversibility while enabling the
reconstruction of propagative features from inherently diffusive
signals. The ill-posed inverse problem is addressed through tailored
regularization strategies, where ADMM is employed for sparse,
time-localized responses induced by pulsed excitations, and TSVD is
adopted for spectrally compact harmonic responses. This establishes a
clear relationship between excitation design and inversion methodology,
providing both physical insight and computational robustness. Numerical
simulations confirm that the proposed approach successfully reconstructs
virtual wave fields with clear wavefronts and reflection features,
overcoming the fundamental limitations of conventional time- and
frequency-domain thermography, such as blurring, lack of spatial
resolution, and ambiguous depth interpretation. Experimental validation
on CFRP samples with embedded delamination defects further demonstrates
significant improvements in defect detectability, boundary sharpness,
and depth localization. In particular, the transformation enables the
recovery of reflection-like echoes and a linear depth interpretation,
which are not accessible in classical diffusion-based frameworks.
Compared with existing photothermal coherence tomography techniques, the
proposed generalized virtual-wave reconstruction exhibits superior
robustness and accuracy, especially under broadband excitations such as
chirp-pulsed signals. The method not only enhances contrast-to-noise
ratio but also eliminates spectral aliasing and nonlinear depth
ambiguities, thereby enabling true tomographic reconstruction analogous
to ultrasonic imaging. Overall, this work provides a physically grounded
and mathematically consistent framework for converting diffusive thermal
responses into wave-like signals, opening new possibilities for advanced
signal processing, excitation design, and three-dimensional
reconstruction in photothermal nondestructive evaluation. Future work
may focus on extending the framework to heterogeneous and anisotropic
materials, optimizing excitation waveforms, and integrating data-driven
approaches to further improve reconstruction efficiency and robustness.

#heading(level: 1, numbering: none)[Appendix A. Derivation of virtual
wave kernel]
<appendix-a.-derivation-of-virtual-wave-kernel>
By interchanging the order of integration, Eq.~#ref(<eq9>, supplement: none) can
be written as
$ T \( upright(bold(r)) \, t \) = c^2 / kappa integral_0^oo T_(upright(v i r t)) \( upright(bold(r)) \, t' \) [frac(1, 2 pi) integral_(- oo)^oo e^(- c sigma \( omega \) t') e^(i omega t) thin d omega] d t' \, $<eq33>
which naturally defines the kernel function
$ K \( t \, t' \) = c^2 / kappa frac(1, 2 pi) integral_(- oo)^oo e^(- c sigma \( omega \) t') e^(i omega t) thin d omega . $<eq34>

Using $sigma \( omega \) = sqrt(i omega \/ alpha)$,
Eq.~#ref(<eq34>, supplement: none) becomes
$ K \( t \, t' \) = c^2 / kappa frac(1, 2 pi) integral_(- oo)^oo exp #h(-1em) [- c t' sqrt(frac(i omega, alpha)) + i omega t] d omega . $<eq35>

To evaluate the integral, we introduce the change of variable
$s = sqrt(i omega)$, such that $omega = - i s^2$ and
$d omega = - 2 i s thin d s$. Under this transformation, the exponent
can be rearranged by completing the square as
$ - c t' sqrt(frac(i omega, alpha)) + i omega t = - t (s - frac(c t', 2 sqrt(alpha t)))^2 - frac(c^2 t' ""^2, 4 alpha t) . $<eq36-kernel>

The integral over $s$ then reduces to a standard Gaussian integral,
yielding the factor $t' \/ \( 2 sqrt(pi) \( alpha t \)^(3 \/ 2) \)$.
Including prefactors and enforcing causality ($t > 0$, $t' > 0$), the
kernel function is obtained as
$ K \( t \, t' \) = c^2 / kappa frac(t', 2 sqrt(pi) \( alpha t \)^(3 \/ 2)) exp #h(-1em) (- frac(c^2 t' ""^2, 4 alpha t)) H \( t \) H \( t' \) . $<eq37>

#figure(image("source/Picture7.png", width: 100.0%),
  caption: [
    The special virtual wave transform results for simulation and
    photothermal experiments. a Virtual wave transform results of pulse
    excitation in simulation. b Virtual wave transform results of
    lock-in excitation in simulation. c Virtual wave transform results
    of chirp-pulsed excitation in simulation. d Virtual wave profiles
    vary with time of defect and sound areas in simulation under pulse
    excitation. e Virtual wave profiles vary with time and frequency of
    defect and sound areas in simulation under lock-in excitation. f
    Virtual wave profiles vary with time of defect and sound areas in
    simulation under chirp-pulsed excitation. g Virtual wave transform
    results of pulse excitation in experiments. h Virtual wave transform
    results of lock-in excitation in experiments. i Virtual wave
    transform results of chirp-pulsed excitation in experiments. j
    Virtual wave profiles vary with time of defect and sound areas in
    experiments under pulse excitation. k Virtual wave profiles vary
    with time and frequency of defect and sound areas in experiments
    under lock-in excitation. l Virtual wave profiles vary with time of
    defect and sound areas in experiments under chirp-pulsed excitation.
  ]
)
<fig7>

#heading(level: 1, numbering: none)[Appendix B. Theory of special
virtual wave transform]
<appendix-b.-theory-of-special-virtual-wave-transform>
Conventional virtual wave concept is based on the Dirac pulse
excitation~#ref-list(<ref32>). The thermal diffusion equation can be written as:
$ (nabla^2 - 1 / alpha frac(partial, partial t)) T \( upright(bold(r)) \, t \) = - 1 / alpha T_0 \( upright(bold(r)) \) delta \( t \) $<eq36>

where $alpha = frac(k, rho C)$ is the thermal diffusivity. The external
incident heat is modeled as an initial condition instead of a boundary
condition. The equivalence between these two boundary-value problems was
validated by Zhu #emph[et al.]~#ref-list(<ref33>). However, in practice, the
external heat source cannot be a Dirac pulse. In general, the heating
duration is on the order of milliseconds. Therefore,
Eq.~#ref(<eq36>, supplement: none) describes an idealized point heating source.

The wave equation describes the acoustic pressure
$p \( upright(bold(r)) \, t \)$ as a function of space
$upright(bold(r))$ and time $t$:
$ (nabla^2 - 1 / c^2 frac(partial^2, partial t^2)) p \( upright(bold(r)) \, t \) = - 1 / c^2 frac(partial, partial t) [p_0 \( upright(bold(r)) \) delta \( t \)] $<eq37>

where $c$ is the speed of sound, and $p_0 \( upright(bold(r)) \)$ is the
initial pressure distribution immediately after a short excitation
pulse. A virtual wave field $T_(upright(v i r t))$ is defined using the
same wave equation with initial temperature distribution
$T_0 \( upright(bold(r)) \)$ and an arbitrarily chosen $c$:
$ (nabla^2 - 1 / c^2 frac(partial^2, partial t^2)) T_(upright(v i r t)) \( upright(bold(r)) \, t \) = - 1 / c^2 frac(partial, partial t) [T_0 \( upright(bold(r)) \) delta \( t \)] $<eq38>

Both Eq.~#ref(<eq36>, supplement: none) and Eq.~#ref(<eq38>, supplement: none) can be
transformed into the frequency domain:
$ (nabla^2 - sigma^2 \( omega \)) theta \( upright(bold(r)) \, omega \) = - 1 / alpha T_0 \( upright(bold(r)) \) $<eq39>

$ (nabla^2 - psi^2 \( omega \)) theta_(upright(v i r t)) \( upright(bold(r)) \, omega \) = - frac(i omega, c^2) T_0 \( upright(bold(r)) \) $<eq40>
where
$ sigma^2 \( omega \) equiv frac(i omega, alpha) \, #h(2em) psi \( omega \) = omega / c $<eq41>
are the wavenumbers for the thermal diffusion-wave field and the virtual
wave field, respectively. By substituting
$omega arrow.r - i c sigma \( omega \)$ into
Eq.~#ref(<eq40>, supplement: none), the relationship between the thermal
diffusion-wave field and the virtual wave field in the frequency domain
becomes:
$ theta \( upright(bold(r)) \, omega \) = frac(c, alpha sigma \( omega \)) thin theta_(upright(v i r t)) \( upright(bold(r)) \, - i c sigma \( omega \) \) $<eq42>

Therefore, the temperature in the time domain can be expressed as:
$ T \( upright(bold(r)) \, t \) = frac(1, 2 pi) integral_(- oo)^oo T_(upright(v i r t)) \( upright(bold(r)) \, t' \) thin K \( t \, t' \) thin d t' $<eq43>
where the kernel function is given by:
$ K \( t \, t' \) equiv c / sqrt(pi alpha t) exp (- frac(c^2 t' ""^2, 4 alpha t)) \, quad t > 0 $<eq44>

Equation~#ref(<eq43>, supplement: none) establishes the relationship between
the thermal diffusion-wave field and the virtual wave field in the time
domain. This is a Fredholm integral equation of the first kind. By
solving Eq.~#ref(<eq43>, supplement: none) for $T_(upright(v i r t))$, the
virtual wave field can be reconstructed.

The special virtual wave transform (SVWT) results are shown in
Fig.~@fig7. SVWT exhibits excellent performance in the simulation under
Dirac pulse excitation (Fig.~#ref(<fig7>, supplement: none)a). However, it completely failed in
modulated excitations including lock-in and chirp-pulsed excitations
(see Fig.~#ref(<fig7>, supplement: none)b-c and Fig.~#ref(<fig7>, supplement: none)e-f). Comparing with GVWR and SVWT
results, it is obvious that GVWR results have higher defect contrast
(see Fig.~#ref(<fig7>, supplement: none)d and Fig.~#ref(<fig5>, supplement: none)a). The same conclusion was demonstrated
in experiments (see Fig.~#ref(<fig7>, supplement: none)g-l).

The failure of the special virtual wave transform (SVWT) can be traced
back to its overly restrictive physical assumptions. In its original
formulation, the SVWT is derived under the idealized Dirac pulse
excitation, where the thermal field is treated as the Green's response
of the diffusion equation to an impulsive source. This assumption
enables an elegant mapping between diffusion and wave equations, but it
also fundamentally limits the applicability of the method. In practice,
thermal excitation always has a finite temporal width and often involves
complex boundary-driven heat flux rather than an initial-value
formulation. As a consequence, the measured temperature field is not a
simple convolution with a Dirac Green's function, but rather a
superposition of temporally distributed responses. The SVWT, which
implicitly inverts a delta-driven kernel, becomes mismatched to the
actual physics, leading to systematic reconstruction errors and loss of
resolution. Moreover, the SVWT assumes a homogeneous and isotropic
medium with constant thermal diffusivity. Any deviation from this
assumption---such as layered structures, anisotropy, or spatially
varying parameters---breaks the separability required for the transform.
This results in model inconsistency, where the transformed field no
longer corresponds to a physically meaningful wave analogue. The
artifacts and instability observed in reconstructions are direct
consequences of this mismatch. Another critical limitation lies in the
ill-posed nature of diffusion inversion. The SVWT effectively attempts
to reverse the diffusion operator by amplifying high-frequency
components to mimic wave propagation. However, diffusion intrinsically
suppresses high-frequency information, making such inversion
exponentially unstable. As a result, the SVWT is highly sensitive to
noise and measurement errors, particularly for deeper structures. In
contrast, the generalized virtual wave transform (GVWT) succeeds because
it relaxes these restrictive assumptions and reformulates the problem in
a more physically consistent framework. Instead of relying on a Dirac
excitation, the GVWT accommodates arbitrary temporal excitation by
explicitly incorporating the source term or boundary conditions into the
inversion process. This allows the transform to remain valid under
realistic experimental conditions. Furthermore, the GVWT can be
interpreted as an operator-based mapping that preserves the full
structure of the diffusion process, rather than enforcing a simplified
analytical correspondence. By working with generalized Green's functions
or integral representations, it naturally extends to heterogeneous and
anisotropic media, thereby reducing model mismatch. Importantly, the
GVWT does not attempt to fully invert the diffusion operator in a naive
sense. Instead, it implicitly introduces regularization through its
formulation, balancing resolution enhancement with stability. This leads
to improved robustness against noise and better reconstruction fidelity,
especially for deeper or low-contrast features. In summary, the contrast
between SVWT and GVWT reflects a broader principle: methods based on
idealized analytical transforms tend to fail when confronted with
realistic physical complexity, whereas operator-consistent and
model-aware formulations provide a more reliable pathway for inverse
diffusion problems.

#heading(level: 1, numbering: none)[Declaration of Competing Interest]
<declaration-of-competing-interest>
The authors declare that they have no known competing financial
interests or personal relationships that could have appeared to
influence the work reported in this paper.

#heading(level: 1, numbering: none)[Acknowledgments]
<acknowledgments>
This work was supported by the Adolf Marten Fellowship (Grant n.
BAM-AMF-2025-1).

#heading(level: 1, numbering: none)[Data availability]
<data-availability>
Data will be made available on request.
#heading(numbering: none)[References]

#par[\[1\] Li, M., et al. Ultrasensitive in vivo infrared spectroscopic imaging via
oblique photothermal microscopy. #emph[Nat. Commun.] #strong[16], 6065
(2025).] <ref1>

#par[\[2\] Zhu, P., et al. Enhancing resistance to low-velocity impact of
electrospun-manufactured interlayer-strengthened CFRP by using infrared
thermography. #emph[NDT & E Int.] #strong[144], 103083 (2024).] <ref2>

#par[\[3\] Thapa, D., et al. Three-dimensional thermophotonic super-resolution
imaging by spatiotemporal diffusion reversal method. #emph[Sci. Adv.]
#strong[9], eadi1899 (2023).] <ref3>

#par[\[4\] Fang, J., et al. Mid-infrared single-photon 3D imaging. #emph[Light:
Sci. Appl.] #strong[12], 144 (2023).] <ref4>

#par[\[5\] Maldague, X., et al. Advances in pulsed phase thermography.
#emph[Infrared Phys. Technol.] #strong[43], 175--181 (2002).] <ref5>

#par[\[6\] Ibarra-Castanedo, C., et al. Comparative study of active thermography
techniques for the nondestructive evaluation of honeycomb structures.
#emph[Res. Nondestruct. Eval.] #strong[20], 1--31 (2009).] <ref6>

#par[\[7\] Zhu, P., et al. Contactless and nondestructive evaluation of residual
stress distribution in modified and pure HDPE materials using a novel
terahertz method and line-scan thermographic technique. #emph[Compos.
Part A Appl. Sci. Manuf.] #strong[183], 108220 (2024).] <ref7>

#par[\[8\] Zhu, P., et al. A comprehensive evaluation of the low-velocity impact
behaviour of intraply hybrid flax/basalt composites using infrared
thermography and terahertz time-domain spectroscopy techniques.
#emph[NDT & E Int.] #strong[154], 103361 (2025).] <ref8>

#par[\[9\] Busse, G. & Rosencwaig, A. Subsurface imaging with photoacoustics.
#emph[Appl. Phys. Lett.] #strong[36], 815--816 (1980).] <ref9>

#par[\[10\] Busse, G., et al. Thermal wave imaging with phase sensitive modulated
thermography. #emph[J. Appl. Phys.] #strong[71], 3962--3965 (1992).] <ref10>

#par[\[11\] Parker, W. J., et al. Flash method of determining thermal diffusivity,
heat capacity, and thermal conductivity. #emph[J. Appl. Phys.]
#strong[32], 1679--1684 (1961).] <ref11>

#par[\[12\] Kaiplavil, S., et al. Photothermal tomography for the functional and
structural evaluation, and early mineral loss monitoring in bones.
#emph[Biomed. Opt. Express] #strong[5], 2488 (2014).] <ref12>

#par[\[13\] Kaiplavil, S. & Mandelis, A. Truncated-correlation photothermal
coherence tomography for deep subsurface analysis. #emph[Nat. Photonics]
#strong[8], 635--641 (2014).] <ref13>

#par[\[14\] Zhu, P., et al. Frequency multiplexed photothermal correlation
tomography for non-destructive evaluation of manufactured materials.
#emph[Int. J. Extrem. Manuf.] #strong[7], 035601 (2025).] <ref14>

#par[\[15\] Pilla, M., et al. New absolute contrast for pulsed thermography.
#emph[QIRT 2002], 5, 53--58 (2002).] <ref15>

#par[\[16\] Maldague, X. P. V. Nondestructive evaluation of materials by infrared
thermography. #emph[NDT & E Int.] #strong[6], 396 (1996).] <ref16>

#par[\[17\] Maldague, X. & Marinetti, S. Pulse phase infrared thermography. #emph[J.
Appl. Phys.] #strong[79], 2694--2698 (1996).] <ref17>

#par[\[18\] Shepard, S. M., et al. Reconstruction and enhancement of active
thermographic image sequences. #emph[Opt. Eng.] #strong[42], 1337--1342
(2003).] <ref18>

#par[\[19\] Rajic, N. Principal component thermography for flaw contrast enhancement
and flaw depth characterisation in composite structures. #emph[Compos.
Struct.] #strong[58], 521--528 (2002).] <ref19>

#par[\[20\] Zhu, P., et al. THz-Super-Resolution Generative Adversarial Network:
Deep-Learning-Based Super-Resolution Imaging Using Terahertz Time-Domain
Spectroscopy. #emph[IEEE Trans. Ind. Inform.] #strong[21], 6660--6669
(2025).] <ref20>

#par[\[21\] Zhu, P., et al. Real-Time Super-Resolution Imaging System Based on
Zero-Shot Learning for Infrared Nondestructive Testing. #emph[IEEE
Trans. Instrum. Meas.] #strong[75], 4500409 (2026).] <ref21>

#par[\[22\] Ahmadi, S., et al. Multidimensional reconstruction of internal defects
in additively manufactured steel using photothermal super resolution
combined with virtual wave-based image processing. #emph[IEEE Trans.
Ind. Inform.] #strong[17], 7368--7378 (2021).] <ref22>

#par[\[23\] Lecompagnon, J., et al. Thermographic detection of internal defects
using 2D photothermal super resolution reconstruction with sequential
laser heating. #emph[J. Appl. Phys.] #strong[131], 185107 (2022).] <ref23>

#par[\[24\] Burgholzer, P., et al. Super-resolution thermographic imaging using
blind structured illumination. #emph[Appl. Phys. Lett.] #strong[111],
031908 (2017).] <ref24>

#par[\[25\] Burgholzer, P., et al. Linking diffusive fields to virtual waves as
their propagative duals. #emph[Phys. Rev. Appl.] #strong[24], 044094
(2025).] <ref25>

#par[\[26\] Gahleitner, L., et al. Three-dimensional defect reconstruction in carbon
fiber-reinforced composites with temporally non-uniform pulsed
thermography data. #emph[NDT & E Int.] #strong[154], 103363 (2025).] <ref26>

#par[\[27\] Burgholzer, P., et al. Three-dimensional thermographic imaging using a
virtual wave concept. #emph[J. Appl. Phys.] #strong[121], 105102 (2017).] <ref27>

#par[\[28\] Zhu, P., et al. A novel force-temperature model for evaluating internal
forces in CFRP by means of infrared thermography. #emph[NDT & E Int.]
#strong[143], 103066 (2024).] <ref28>

#par[\[29\] Zhu, P., et al. A novel IR-SRGAN assisted super-resolution evaluation of
photothermal coherence tomography for impact damage in toughened
thermoplastic CFRP laminates under room and low temperature.
#emph[Compos. Part B Eng.] #strong[316], 113575 (2026).] <ref29>

#par[\[30\] Zhu, P., et al. Thermal diffusivity characterization of impacted
composites using evaporative cryocooling excitation and inverse
physics-informed neural networks. #emph[IEEE Trans. Instrum. Meas.]
(2025). https:\/\/doi.org/10.1109/TIM.2026.3684670] <ref30>

#par[\[31\] Zhu, P., et al. Thermal diffusivity measurement based on evaporative
cryocooling excitation: Theory and experiments. arXiv preprint
arXiv:2509.04263. https:\/\/doi.org/10.48550/arXiv.2509.04263] <ref31>

#par[\[32\] Wang, R., et al. Air-coupled ultrasonic detection of microholes in
flexible envelope materials. #emph[Ultrasonics] #strong[158], 107826
(2025).] <ref32>

#par[\[33\] Wang, R., et al. Unipolar square wave excitation delayed sampling
thermal signal reconstruction detection based on beam homogenization.
#emph[IEEE Trans. Ind. Inform.] #strong[21], 8144--8153 (2025).] <ref33>

#par[\[34\] Wang, R., et al. Variable pulse with pulsed thermography: theoretical
model and experimental validation. #emph[Appl. Therm. Eng.]
#strong[280], 128557 (2025).] <ref34>

#par[\[35\] Zhu, P., et al. Making neural networks understand internal heat transfer
using Fourier-transformed thermal diffusion wave fields. arXiv preprint
arXiv:2509.04223. https:\/\/doi.org/10.48550/arXiv.2509.04223] <ref35>

#par[\[36\] Jiang, G., et al. Faster R-CNN-CA and thermophysical properties of
materials: An ancient marquetry inspection based on infrared and
terahertz techniques. #emph[Infrared Phys. Technol.] #strong[142],
105563 (2024).] <ref36>

#par[\[37\] Jiang, G., et al. Non-invasive inspection for a hand-bound book of the
19th century: Numerical simulations and experimental analysis of
infrared, terahertz, and ultrasonic methods. #emph[Infrared Phys.
Technol.] #strong[140], 105353 (2024).] <ref37>

#par[\[38\] Zhu, P., et al. Quantitative detection of defect size based on infrared
thermography: temperature integral method. #emph[Opt. Express]
#strong[30], 9119--9136 (2022).] <ref38>

#par[\[39\] Wang, F., et al. The feature recognition of CFRP subsurface defects
using low-energy chirp-pulsed radar thermography. #emph[IEEE Trans. Ind.
Inform.] #strong[16], 5160--5168 (2019).] <ref39>

#par[\[40\] Zhu, P., et al. Detection of defects in metallic materials using an
improved post-processing method of pulsed thermography. #emph[Opt. Laser
Eng.] #strong[151], 106927 (2022).] <ref40>

#par[\[41\] Salazar, A., et al. Measurement of thermal diffusivity and conductivity
of thin films using laser-line lock-in thermography. #emph[Measurement]
#strong[214], 109928 (2025).] <ref41>

#par[\[42\] Li, R., et al. Investigation on the detection of crack defects in metals
using chirp ultrasonic-induced infrared thermography. #emph[IEEE Trans.
Instrum. Meas.] #strong[74], 1012410 (2025).] <ref42>

#par[\[43\] Ibarra-Castanedo, C., et al. Detection and characterization of
artificial porosity and impact damage in aerospace carbon fiber
composites by pulsed and line scan thermography. #emph[Appl. Sci.]
#strong[13], 6135 (2023).] <ref43>

#par[\[44\] Zhu, P., et al. Defect detectability based on square wave lock-in
thermography. #emph[Appl. Opt.] #strong[61], 6134--6143 (2022).] <ref44>

