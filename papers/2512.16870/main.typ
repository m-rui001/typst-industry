#set document(title: "Photonics of topological magnetic textures")
#set page(paper: "a4", margin: (x: 23mm, y: 22mm), numbering: "1")
#set text(font: "Libertinus Serif", size: 10.5pt)
#set par(justify: true, leading: .55em)
#set math.equation(numbering: "(1)")
#show figure.caption: set text(size: 9pt)
#align(center)[
  #text(size: 17pt, weight: "bold")[Photonics of topological magnetic textures]
  #v(.6em)
  Vakhtang Jandieri#super[1,2], Ramaz Khomeriki#super[3], Daniel Erni#super[2], Nicolas Tsagareli#super[4], Qian Li#super[5], Douglas H. Werner#super[6], and Jamal Berakdar#super[1]
  #v(.5em)
  #text(size: 9pt)[#super[1] Martin Luther University Halle-Wittenberg, Germany \
  #super[2] University of Duisburg-Essen and CENIDE, Germany \
  #super[3] Tbilisi State University, Georgia \
  #super[4] Binghamton University, State University of New York, USA \
  #super[5] Tsinghua University, China \
  #super[6] The Pennsylvania State University, USA \
  #link("mailto:Jamal.Berakdar@Physik.Uni-Halle.de")]
]
*Abstract.* Topological textures in magnetically ordered materials are important case studies for fundamental research with promising applications in data science. They can also serve as photonic elements to mold electromagnetic fields endowing them with features inherent to the spin order, as demonstrated analytically and numerically in this work. A self-consistent theory is developed for the interaction of spatially structured electromagnetic fields with non-collinear, topologically non-trivial spin textures. A tractable numerical method is designed and implemented for the calculation of the formed magnetic/photonic textures in the entire simulation space. Numerical illustrations are presented for scattering from point-like singularities, i.e. Bloch points, in the magnetization vector fields, evidencing that the geometry and topology of the magnetic order results in photonic fields that embody orbital angular momentum, chirality as well as magnetoelectric densities. Features of the scattered fields can serve as a fingerprint for the underlying magnetic texture and its dynamics. The findings point to the potential of topological magnetic textures as a route to molding photonic fields.

*Keywords.* Non-collinear magnets, topological photonics, Bloch points, magneto-optics, magnetic metamaterials, electromagnetic scattering, chirality density, orbital angular momentum.

= Introduction
<introduction>
Emergence and characteristics of stable topological textures and
quasiparticles such as vortices, skyrmions or hopfions (Hopf solitons)
are well studied and documented in the context of field theories, for
example in
#cite(label("doi:10.1098/rspa.1961.0018"))@Faddeev1976@KUZNETSOV198037@PhysRevB.65.100512@PhysRevLett.51.2040@refId0@KOSEVICH1990117@BOGOLUBSKY1988511@Ranada1989@BOGDANOV1994255@Rajaraman1982solitons.
With experimental realizations of these textures in static magnetic and
ferroelectric materials as well as in electromagnetic waves
@Roeßler2006#cite(label("doi:10.1126/science.1166767"))@Yu2010#cite(label("doi:10.1126/science.1214143"))#cite(label("doi:10.1126/science.1240573"))@Yadav2016@Kent2021@Wiesendanger2016@Shen2024,
much research has been devoted to their possible utilization in
information storage, communication, and processing @Dieny2020. In this
respect, means are necessary to controllably exploit, identify, and
manipulate their geometric-topological features. The focus of this work
is on the magneto-optical response as well as on the scattering, and
formation of spatially structured electromagnetic fields due to
non-collinear topological textures formed in a magnetization vector
field. In particular, we present explicit results and simulations for
point-like magnetic singularities with vanishing magnetic moments
@feldtkeller1965mikromagnetisch#cite(label("10.1063/1.1656144")). This
so-called Bloch-point (BP) singularity can be viewed as a magnetic
monopole and can be surrounded by a hedgehog-type structure or other
types of non-collinearities
@feldtkeller1965mikromagnetisch#cite(label("10.1063/1.1656144"))@kabanov1989bloch@Hertel_2016@PhysRevLett.97.177202@PhysRevB.99.024433\;
some examples are detailed below. On the microscopic level the formation
of BP is dominated by the exchange interaction and hence the magnetic
response should be much faster than the typical GHz magnonic response in
homogeneous magnets. \
BPs have been studied in a wide range of materials and on different
length scales, notably BPs in domains of multilayers and skyrmion
lattices or as engineered materials with structuring
@kabanov1989bloch@PhysRevB.67.094410@PhysRevLett.97.177202@Blanco-Roldán2015@Hertel_2016@Kanazawa2016@Im2019@PhysRevB.99.024433@PhysRevB.99.024433@Birch2022@PhysRevResearch.2.033006@Rana2023@PhysRevB.108.024414@Zambrano-Rabanal2023#cite(label("doi:10.1021/acsami.4c01963")).
BP singularities are of relevance also for fundamental science, for
instance as emulators of electron motion in a magnetic monopole field
@PhysRevB.90.224414. For applied science, their distinctive topological
#footnote[#underline[Topology and geometry of BP:] Considering
a closed surface enclosing the BP at its center, the direction of unit
magnetization vector field ($upright(bold(m))_0$ in Eq.@eq::BP) covers
an integer number of times, a whole solid angle. Expressed in spherical
coordinates #cite(label("10.1063/1.1656144")), this vector field is
parameterized by a polar component expressible as $p theta$, and an
azimuthal component written as $q phi.alt + gamma$. Since
$upright(bold(m))_0$ is single valued, $q$ and $p$ are integer number
and the topological nature of the BP is then set by the quantity
$Q = p q$, called the topological charge @Rajaraman1982solitons. $gamma$
determines the geometry: It is an azimuthal tilt with regard to the
radial direction, causing the BP to twist around $z$, as discussed in
the text and shown in Fig.(@fig::3). Such as behavior and how the system
goes from one $q \, p$ state to another is illustrated for example in
@Jia_2019 for vortices and skyrmions using micromagnetic simulations.
The discussions and numerical calculations presented in this work
assumes a specific $gamma$. The actual value of $gamma$ for a given
material depends on terms in the magneto-static energy, such as the
dipolar energy #cite(label("10.1063/1.1656144")), that are not in the
focus of this work.] nanometer scale, as well as energy scale
#footnote[#underline[ Energy scale]: In the region around the BP
the dominant energy contribution stems from exchange energy
$integral d^3 upright(bold(r)) frac(J, 2 a) \( nabla upright(bold(S)) \)$,
where $J$ is the exchange interaction, $a$ is the lattice constant and
$ℏ S$ is the molecular spin which is proportional to the magnetization
$upright(bold(M))$ appearing in (@eq:2). The energy scale is typically
an order of magnitude higher than that due to dipolar interactions which
govern magneto-static excitations (spin waves) in uniform magnetic
media.] features make them a compelling option for data storage and
processing
@kabanov1989bloch@PhysRevB.67.094410@PhysRevLett.97.177202@Blanco-Roldán2015@Hertel_2016@Kanazawa2016@Im2019@PhysRevB.99.024433@PhysRevB.99.024433@Birch2022@PhysRevResearch.2.033006@Rana2023@PhysRevB.108.024414@Zambrano-Rabanal2023#cite(label("doi:10.1021/acsami.4c01963")).
To characterize and drive controllably Bloch points is however a
challenge, mainly due to their vanishing magnetization. Clearly,
footprints of their topological characteristics are left in their
surrounding long-range magnetic order. Hence, a probe which couples
directly to their intrinsic non-collinear structure would be highly
desirable. Also the question of a possible use of BPs or similar
textures as functional photonic elements needs to be clarified.

In this work we study the scattering and formation of structured
electromagnetic (EM) waves from BPs, and illustrate the polarization
distribution and the spatial structure of the fields, as reflected for
example by the chirality density and/or the orbital angular momentum
density. While propagating EM waves are bound in their spatial
resolution to the diffraction limit, there is no such limit on the
polarization texturing
@Zhan:09@Rosales-Guzman_2018@Grunwald01012020#cite(label("10.3389/fphy.2021.688284"))@Werner@Kozawa2025250202@Vogliardi2025.
In fact, the EM fields used here can also be singular beams with the
singularity occurring on the optical axis. In this way a spatial
resolution on the nanometer scale of the magnetic singularity can be
achieved. In recent years clear experimental and theoretical evidence
has been accumulated on how to use singular of spatially structured
fields to access new information on matter
@PhysRevLett.134.156701@PhysRevLett.128.157205@Rouxel2022#cite(label("doi:10.1021/acs.chemrev.2c00115"))@Bose_2014@DeNinno2020#cite(label("LinNieYanLiangLinZhaoJia+2019+2177+2188"))@PhysRevA.103.013501@PhysRevLett.128.077401@PhysRevLett.132.026902@Waetzel2018#cite(label("https://doi.org/10.1002/qute.201800096"))@RevModPhys.94.035003,
but so far a closed theory describing light-matter action-back-action,
particularity in the context of magnetically ordered systems remains
elusive. Such a theory would bridge the gap between topological
photonics @RevModPhys.91.015006 and magneto photonics @Wang2009 to
topological magnetic textures. \
An important issue to clarify is how the singular magnetic texture
responds to external EM fields and how the fields are modified by the
magnetic texture, when the frequencies of these EM fields are in the
range of magnetic excitations. Therefore, we will set up a coupled,
self-consistent magnetic-photonic modeling scheme for the case involving
a large photon number (classical EM fields) and where the length
(energy) scales of relevance are much larger (smaller) than the
atomistic ones. Under these conditions it is reasonable to work within
classical field theories and incorporate the atomistic electronic
information, as is customary with dielectric/permeability tensors.

To be explicit we focus here on BPs as a paradigm for highly
non-collinear systems. Our theoretical formulation is however applicable
to other types of nonlinearities such as vortices
@fanciulli2025magnetic@luttmann2025optical, skyrmions, spin ice
#cite(label("10.1063/5.0274799"))#cite(label("10.1063/5.0229120")),
gyroids #cite(label("doi:10.1021/acsami.4c02366")), or external magnetic
fields imparted by other structured waves
@Geerits2023@PhysRevB.107.134403@Henderson2023@Sarenac2024. The specific
system is manifested in the appropriate magnetic free energy density and
the corresponding boundary conditions. Generally, the magnetic free
energy density contains both the external magnetic field
$bold(H)_(upright("ext")) \( bold(r) \, t \)$ of the incoming EM waves
and contributions from intrinsic magnetic interactions
$bold(H) \( bold(r) \, t \)$ such as exchange coupling. The dynamics of
the local magnetization $upright(bold(M)) \( bold(r) \, t \)$, described
by the Landau-Lifshits-Gilbert equation implicitly updates for the
magnetic field at time $t'$ and space $bold(r)'$ to be used as an input
value for Maxwell's equations to infer the electric flux density
$upright(bold(D)) \( bold(r)' \, t' \)$. The successive applications of
this procedure accounts for multiple magnetic/electromagnetic scattering
events. In the linear response regime, we analytically derive the
frequency and wave-vector-dependent permeability tensor that can be used
for the low-energy dynamics of the magnetic textures. A time-harmonic
dependence of $e^(j omega t)$ is assumed and omitted throughout the
manuscript.

= Formal considerations
<formal-considerations>
For non-collinear magnets, we seek a self-consistent spherical
rigorous-coupled wave analysis for EM wave scattering in
three-dimensions (3D). For instance, the theory should account for the
inhomogeneities and dynamical response of the magnetic order spherically
surrounding the BP (see the inset in Fig. @fig::1). In the linear
response regime, we wish to analytically obtain a magnetic permeability
matrix and uncover the variation of it components along the radial
direction and along the polar angle. Hereby, we assume azimuthally
homogeneous BPs. This is accomplished below where, technically, the
method reduces the problem to the solution of a set of first-order
coupled differential equations. Moreover, the field representations are
then found using the eigenvectors and eigenvalues of the matrix
generated by the Fourier components of the constant coefficients of the
differential equations. Numerically, the approach uses the recursive
algorithm based on matrix multiplication, which allows us to calculate
the scattering characteristics for the BP efficiently. The method can
deal numerically with various types of impinging electromagnetic waves
and BPs such as hedgehog and twisted. For brevity only selected results
are presented showing that the distinct magnetic order around the BP
leads to an involved structure of the formed EM fields and the
generation of optical chirality density and orbital angular momentum in
a close vicinity to the BP. Also, we find a dominant azimuthal component
of the Poynting vector close to the surface of the BP. Only the
components of the reflected electric and magnetic fields that appear
solely by an interaction of the incident waves with the BP show a
sensitive behavior while transforming from the hedgehog to the twisted
model.

The formulation below is developed for a magnetic insulator, meaning
that no free currents/charges are present, and assumes that the
dielectric response (and hence the relative dielectric permittivity
$epsilon.alt_r$) is nearly constant and homogeneous in the frequency
regime of interest here. These restrictions are not fundamental but
allow the magnetic/photonic effects to be singled out. The coupled field
equations of motion for magneto-static/electromagnetic dynamics are
given by
$ frac(partial bold(M) \( upright(bold(r)) \, t \), partial t) = - g mu_0 [bold(M) \( upright(bold(r)) \, t \) times bold(H)_(upright("eff")) \( upright(bold(r)) \, t \)] \,\
nabla times [bold(H) \( upright(bold(r)) \, t \) + bold(H)_(upright("ext")) \( upright(bold(r)) \, t \)] = epsilon.alt_0 epsilon.alt_r frac(partial bold(E) \( upright(bold(r)) \, t \), partial t) \,\
nabla times bold(E) \( upright(bold(r)) \, t \) = - mu_0 frac(partial, partial t) [bold(H) \( upright(bold(r)) \, t \) + bold(H)_(upright("ext")) \( upright(bold(r)) \, t \) + bold(M) \( upright(bold(r)) \, t \)] $<eq:full>
where $g$ is the gyromagnetic ratio, $bold(H)$ and
$bold(H)_(upright("ext"))$ are the demagnetization and external magnetic
fields, respectively, $bold(M)$ is the magnetization vector field,
$epsilon.alt_0$ and $mu_0$ are dielectric permittivity and magnetic
permeability of free space. The electric polarization induced by BP
spin-noncollinearities (e.g., as in @PhysRevLett.127.127601) is
negligible. The external magnetic field $bold(H)_(upright("ext"))$ is
related to the incident field and is defined by the boundary condition
on a surface of the sphere enclosing the the magnetic singularity (see
the inset of Fig. @fig::1).

The effective magnetic field $bold(H)_(upright("eff"))$ derives from the
functional derivative of the free energy $F \( bold(M) \)$ with respect
to $bold(M)$. For BP an appropriate model $F \( bold(M) \)$ may be
represented in the form @elias2011magnetization, #footnote[Directly at
the BP where the magnetization vanishes (cf. Fig.@fig::1) atomistic
models are needed. The theory presented here does not include this
particular point. A reasonable length beyond which our model is expected
to hold is set by the exchange length $sqrt(J \/ \( M_s^2 a \))$, the
value of this length is $approx 6$ nm for Permalloy. Since our focus is
not on describing BPs as such but on the behavior of the EM fields
scattering from BPs, and the fields do not scatter when $M_s = 0$, this
issue is less critical for this study.]
$ F \( bold(M) \) & = integral_V d^3 upright(bold(r)) \[A_s / 2 \( nabla bold(M) \)^2 + gamma_1 M^2 + gamma_2 M^4\
 & - mu_0 / 2 bold(M) dot.op \( bold(H) + bold(H)_(upright("ext")) \)\] . $<eq:2>
The effective field is
$ bold(H)_(upright("eff")) & = - frac(delta F, delta bold(M)) = bold(H)_(upright("ext")) + bold(H) + (frac(partial^2, partial r^2) + 2 / r frac(partial, partial r) - 2 / r^2) bold(M)\
 & + 2 nu (bold(M) - beta bold(M)^3) $<eq:3> where $A_s$ is related to
the exchange interaction and $gamma_1 \, gamma_2$ are the Landau
parameters. We introduce the definitions $nu = \| gamma_1 \| \/ mu_0$,
$beta = - 2 gamma_2 \/ gamma_1$, and use $r$ as the distance from the
global origin, i.e. the center of the BP, to the observation point.

We seek a material-independent formulation but as a typical example we
consider here, the helimagnet FeGe for which the exchange stiffness
$A = A_s \/ 2$ is $6.1 #h(0em) 10^(- 13)$ cm$""^2$\; the saturation
magnetization is $M_s = 383$ emu/cm$""^3$, and the Curie temperature is
$278.7$ K @Lang2023. These parameters vary strongly if we consider a
different setting such as spin ice
#cite(label("10.1063/5.0274799"))#cite(label("10.1063/5.0229120")).

== Local magnetic susceptibility
<local-magnetic-susceptibility>
The non-linear coupled equations (@eq:full) account for a multitude of
phenomena such as large-angle magnetic procession/reversal (magnetic
moment quenching is not included in these equations), trapping of
electromagnetic waves, and frequency up- and down-conversion. In the
linear regime, information on the sample in its field-free state can be
obtained. The task here is to derive explicitly an expression for the
magnetic permeability matrix of the BP, which as we expect from the
above discussion should be frequency dependent and non-local. To this
end, we linearize $bold(M)$ with respect to small deviations caused by
the external field. We consider a time-independent ground state as the
free energy #link(<eq:2>)[\[eq:2\]] minimum
$bold(H)_(upright("eff")) = 0$ @elias2011magnetization and examine small
deviations of these ground state solutions under a
Landau--Lifshitz--Gilbert formulation. We substitute the expression for
the effective magnetic field $bold(H)_(upright("eff"))$ into the
Landau--Lifshitz--Gilbert equation and write #footnote[Our formulation
based on Eqs.(@eq:full, @eq:2) captures the physics of BPs. It does not
include the magnetic material well beyond BP. This part enters our
theory/simulations through a finite but constant relative permeability.
Field matching is performed between the BP region and the surrounding
rendering the EM fields well-defined in the whole space. Note, typically
the response of the exchange-dominated BP is at a different (higher)
frequency than the magneto-statically-coupled region with a response in
the GHz. Mathematically this means that within our formulation and
boundary conditions, we cannot realize BP as localized solutions in a
vector field which is spatially homogeneous, meaning collinear at
infinity.]
$ bold(M) \( bold(r) \, t \) = bold(M)_0 + delta bold(M) = bold(m)_0 \( bold(r) \, t \) M_0 \( r \) + bold(m)_1 \( bold(r) \, t \) M_0 \( r \) . $<eq::BP>
Here, $bold(M)_0 \( bold(r) \, t \)$ is the ground state spin
configuration which is described by local magnetization magnitude
$M_0 \( r \)$ and a unit vector field $bold(m)_0 \( bold(r) \, t \)$.
Small deviations from the initial configuration are captured by the
vector field
$delta bold(M) \( bold(r) \, t \) = bold(m)_1 \( bold(r) \, t \) M_0 \( r \)$.
To first-order in $bold(m)_1$ we find
$ frac(partial bold(m_1), partial t) = - g mu_0 M_s \[ bold(m_0) times bold(H)_(upright("eff")) \] . $<eq:4>
In spherical coordinates with the center being at the BP singularity we
write $ m_r^0 & = sin^2 theta cos gamma + cos^2 theta \,\
m_theta^0 & = cos theta sin theta \( cos gamma - 1 \) \,\
m_phi^0 & = sin gamma sin theta . $<eq:5> Here $gamma$ is a pseudo
azimuthal angle which determines the geometry of the spin configuration
without changing the topology. For example, for one magnetic singularity
at the origin, one transforms from the hedgehog configuration for
$gamma = 0$ to a twisted one for $gamma = 60^degree$, where $theta$
is the polar angle between the radial line and the polar $z$-axis. $M_0$
is space dependent but still we can normalize to the maximum value of
the saturation magnetization $M_s$, as done in (@eq:4), implying
$beta M_s^2 = 1$. We note that no $phi$-dependence is present and
$bold(r) = \( theta \, r \)$.

For a time-harmonic, polarization structured (vector) EM incident beam
we start from (@eq:4) and seek the elements of the magnetic permeability
matrix
$mu_(i j) \( theta \, r \) = delta_(i j) + M_0 \( r \) chi_(i j) \( theta \, r \)$
(where $chi_(i \, j) \( theta \, r \)$ is a magnetic susceptibility
$bold(m_1) = chi_(i \, j) \( bold(H) + bold(H)_(upright("eff")) \)$). It
is possible to derive the local element $chi_(i j) \( theta \, r \)$
explicitly. The details involve relatively lengthy expressions which are
given in Appendix A. Note that the magnetic permeability tensor is
Hermitian. As detailed in Appendix A, a key signature of the spin
non-collinearity is the appearance of multiple local resonances
$omega_(r e s)$ determined by the condition
$ omega_(r e s) & = & plus.minus upright(g) mu_0 M_s [hat(O) M_0 \( r \)] \,\
hat(O) & = & (frac(partial^2, partial r^2) + 2 / r frac(partial, partial r) - 2 / r^2) + 2 nu (1 - M_0^2) . $<eq::reson>
Importantly, this fact can be exploited to sense for BPs in the
frequency space without being hindered by the limited spatial resolution
of optical probes.

== Scattering of electromagnetic fields: Spherical coupled-wave analysis
<scattering-of-electromagnetic-fields-spherical-coupled-wave-analysis>
To calculate the scattered fields from localized magnetic
non-collinearities, we formulate a spherical rigorous coupled-wave
analysis by dividing the sphere around the magnetic singularity into
onion-type, thin shell layers, where the $l$-th thin layer
$\( l = 1 dot.op dot.op dot.op L \)$ is characterized by a magnetic
permeability matrix $mu_(i j) \( theta \, r_l \)$ (c.f. an inset in Fig.
@fig::1). Here, $r_l$ is the radial distance of the $l$-th thin shell
layer and all material parameters are assumed to be constant within each
layer. It is important to mention that each shell layer resonates at a
different frequency defined by (@eq::reson). Hence, the magneto-optical
behavior under irradiation with a broadband vector beam, such as
suggested in #cite(label("doi:10.1021/acsphotonics.1c01693")), will be
qualitatively different from a homogeneous beam. For the numerical
demonstration we choose the excitation frequency $omega$ close to the
resonance frequency of the outermost shell layer, i.e.
$omega_(r e s) \( r = a \)$. This means that the elements of the
magnetic permeability matrix attain maximum values in the outermost
layer and then decrease within the BP when approaching its global origin
(detailed derivation is given in Appendix A).

Having the magnetic permeability matrix rigorously derived, we then
substitute it into the Maxwell's equations written in spherical
coordinates and redefine the components of the electric $E_r^alpha$ and
magnetic $H_r^alpha$ fields as
$ S_theta^alpha = r E_theta^alpha \, thin S_phi^alpha = r sin theta E_phi^alpha \, $
$ U_theta^alpha = sqrt(mu_0 \/ epsilon.alt_0) #h(0em) r H_theta^alpha \, U_phi^alpha = sqrt(mu_0 \/ epsilon.alt_0) #h(0em) r sin theta H_phi^alpha \, $
where $alpha = i n c \, r$ represents the incident or reflected fields.
By expanding the fields into a one-dimensional (1-D) Fourier series with
respect to a parameter $kappa = cos theta$ ($theta = \[ 0 : pi \]$)
@jarem1@jarem2:
$ Phi \( r \, theta \) = sum_(i = - N)^N phi.alt_i \( r \) e^(j i pi kappa) \, quad Phi = { S_theta \, S_phi \, U_theta \, U_phi } $<eq:7>
a set of first-order, coupled differential equations for the radially
varying field amplitudes
$phi.alt_i \( r \) = \[ s_theta^i \, s_phi^i \, u_theta^i \, u_phi^i \]$
is obtained:
$ frac(d, d eta) mat(delim: "[", s_theta^i; s_phi^i; u_theta^i; u_phi^i) = j mat(delim: "[", bold(Psi)) = j mat(delim: "[", Psi_11, Psi_12, Psi_13, Psi_14; Psi_21, Psi_22, Psi_23, Psi_24; Psi_31, Psi_32, Psi_33, Psi_34; Psi_41, Psi_42, Psi_43, Psi_44) mat(delim: "[", s_theta^i; s_phi^i; u_theta^i; u_phi^i) . $<eq:8>
Here $eta = k_0 r$, $k_0$ is the free-space wavenumber, $N$ is a
truncation number of the Fourier series that will be varied to check
convergence, $bold(Psi)$ is a square matrix generated by the Fourier
coefficients of $Psi_(q q')$ with the $\( n \, m \)$ entries equal to
$Psi_(q q')^(n - m)$. If a truncation number for each field component
associated with the Fourier series is $N$,
($- N dot.op dot.op dot.op 0 dot.op dot.op dot.op N$), then the size of
the matrix $bold(Psi)$ becomes
$4 \( 2 N + 1 \)$$times$$4 \( 2 N + 1 \)$. The implicit expressions of
block matrices $Psi_(q q')$ are given in Appendix B.

Using (@eq:8), the fields for each anisotropic layer are expressed
through the eigenvectors and eigenvalues of the matrix $bold(Psi)$.
Hence, the tangential components of the electric and magnetic fields in
the $l$-th shell layer characterized by a normalized radial distance
$eta_l = k_0 r_l$, namely
$\( bold(S)_theta^(\( l \)) \( kappa \, eta_l \) \, bold(S)_phi^(\( l \)) \( kappa \, eta_l \) \)$
and
$\( bold(U)_theta^(\( l \)) \( kappa \, eta_l \) \, bold(U)_phi^(\( l \)) \( kappa \, eta_l \) \)$,
can be written in the following form:

$ bold("S")^(\( l \)) \( kappa \, eta_l \) & = sum_(i = - N)^N #scale(x: 300%, y: 300%)[\(] sum_(p = 1)^(4 \( 2 N + 1 \)) P_(i p \, S)^(\( l \)) thin e^(j eta_l \| xi_p^l \|) thin C_p^(\( l \)) #scale(x: 300%, y: 300%)[\)] e^(j i pi kappa)\
 & quad = sum_(i = - N)^N #scale(x: 180%, y: 180%)[\(] overline(overline(bold(P)))_S^(\( l \)) dot.op bold(Upsilon) dot.op bold(C)^(\( l \)) #scale(x: 180%, y: 180%)[\)] e^(j i pi kappa) . $<eq::9>

$ bold("U")^(\( l \)) \( kappa \, eta_l \) & = sum_(i = - N)^N #scale(x: 300%, y: 300%)[\(] sum_(p = 1)^(4 \( 2 N + 1 \)) P_(i p \, U)^(\( l \)) thin e^(j eta_l \| xi_p^l \|) thin C_p^(\( l \)) #scale(x: 300%, y: 300%)[\)] e^(j i pi kappa)\
 & quad = sum_(i = - N)^N #scale(x: 180%, y: 180%)[\(] overline(overline(bold(P)))_U^(\( l \)) dot.op bold(Upsilon) dot.op bold(C)^(\( l \)) #scale(x: 180%, y: 180%)[\)] e^(j i pi kappa) . $<eq::10>

where we introduced the shorthand notation
$ bold(bold("S"))^(\( l \)) \( bold(kappa \, eta_l) \) & = \[ bold(bold(S)_theta)^(\( l \)) \( bold(kappa \, eta_l) \) \, bold(bold(S)_phi)^(\( l \)) bold(\( kappa \, eta_l) \) \]^T \,\
bold(bold("U"))^(\( l \)) \( bold(kappa \, eta_l) \) & = \[ bold(bold(U)_theta)^(\( l \)) \( bold(kappa \, eta_l) \) \, bold(bold(U)_phi)^(\( l \)) \( bold(kappa \, eta_l) \) \]^T . $
Here, the matrices $overline(overline(bold(bold(P))))_S^(\( l \))$ and
$overline(overline(bold(bold(P))))_U^(\( l \))$ having a size
$2 \( 2 N + 1 \)$$times$$4 \( 2 N + 1 \)$ are constructed from the
eigenvectors of the matrix $bold(Psi)^l$ in the $l$-th shell layer.
${ xi_p^l }$ determine the elements of the diagonal matrix
$bold(Upsilon)$ and are set by the respective eigenvalues of
$bold(Psi)^l$.

#figure(image("source/Fig1.pdf"),
  caption: [
    Curve showing the normalized magnetization $M_0$ as a function of
    $k_0 x$, where $k_0$ is the free-space wavenumber. Inset shows a
    schematic cross-sectional view of the BP, where the magnetic order
    is spherically surrounding the BP. The outer-radius of the sphere is
    $a$ and the inner-radius is denoted as $b$. The anisotropic region
    (see Appendix A) is marked by the gray color. It is divided into
    thin shell layers, each of which is characterized by the local
    magnetic permeability matrix $mu_(i j) \( theta \, r_l \)$. Outside
    the anisotropic structure the medium is assumed to be free space.
    The relative dielectric permittivity of the spherical BP is
    $epsilon.alt_r$. The wavefront of the incident field is also
    depicted by thick red arrows. The direction of the associated
    magnetic field $upright(bold(H))_(e x t)$ is indicated by dotted
    circles. Such a field can be realized by a radially directed
    elementary electric dipole which is marked by a blue arrow and is
    located on and parallel to the $z$-axis at a distance $h$ from the
    global origin (i.e., the center of the BP).
  ]
)
<fig::1>

A relation between the unknown coefficients $bold(C)^(\( l \))$ and
$bold(C)^(\( l - 1 \))$ in the $l$-th and $\( l - 1 \)$-th shell layers,
respectively, is determined by the boundary conditions for the incoming
and outgoing waves on the $l$-th layer's boundary @jarem2@jandieri2:
$ bold(C)^(\( l \)) = \[ bold(P)^(\( l \)) \]^(- 1) dot.op bold(P)^(\( l - 1 \)) dot.op bold(T)^(\( l - 1 \)) dot.op bold(C)^(\( l - 1 \)) equiv upright(bold(F))^l dot.op bold(C)^(\( l - 1 \)) $<eq::13>
Here
$bold(P)^(\( l \)) = \[ overline(overline(bold(bold(P))))_S^(\( l \)) \, overline(overline(bold(bold(P))))_U^(\( l \)) \]^T$
is a square matrix (its size is
$4 \( 2 N + 1 \)$$times$$4 \( 2 N + 1 \)$) whose columns are the
eigenvectors of the matrix $bold(Psi)^l$ in the $l$-th shell layer,
$bold(T)^(\( l - 1 \))$ is related to the thickness of the
$\( l - 1 \)$-th thin shell and represents the traveling wave behavior
of the space-harmonics along the radial direction. Since the
relationship between the coefficients for the adjacent layers inside the
sphere have been determined, the relation between
$bold(bold(C))^(\( 1 \))$ in the outermost $1$-st layer inside the
sphere (the nearest one to the region of an incident wave) and
$bold(bold(C))^(\( L \))$ in the innermost $L$-th layer (the closest one
to the global origin) can be calculated using a recursive algorithm
based on the matrix multiplication:
$bold(bold(C))^(\( L \)) = upright(bold(F)) dot.op bold(bold(C))^(\( 1 \))$.
The matrix $upright(bold(F))$, which is a product of matrices
$upright(bold(F))^l \( l = 1 dot.op dot.op dot.op L \)$, rigorously
accounts for multiple interaction of the space-harmonics between the
shell layers, as well as their material and geometrical parameters
through the eigenvectors and eigenvalues of the $bold(Psi)^l$ matrix.

The electromagnetic fields in the space $r > a$, i.e., Region I in the
inset of Fig. @fig::1, are expressed in terms of transverse to $r$
electric ($T E_r$) and transverse to $r$ magnetic ($T M_r$) waves and
may be written using Schelkunoff-Bessel and Hankel functions in the
following form:
$ S_theta^(\( upright("I") \)) \( r \, kappa \) = sum_(i = - N)^N \( upright(bold(K)) dot.op bold(c) \) thin e^(j i pi kappa) + sum_(i = - N)^N bold(S)_(theta \, i)^(upright("inc")) thin e^(j i pi kappa) $ <eq:S_theta>
$ S_phi^(\( upright("I") \)) \( r \, kappa \) = - sum_(i = - N)^N \( tilde(upright(bold(K))) dot.op bold(d) \) thin e^(j i pi kappa) + sum_(i = - N)^N bold(S)_(phi \, i)^(upright("inc")) thin e^(j i pi kappa) $ <eq:S_phi>
$ U_theta^(\( upright("I") \)) \( r \, kappa \) = sum_(i = - N)^N \( upright(bold(K)) dot.op bold(d) \) thin e^(j i pi kappa) + sum_(i = - N)^N U_(theta \, i)^(upright("inc")) thin e^(j i pi kappa) $ <eq:U_theta>
$ U_phi^(\( upright("I") \)) \( r \, kappa \) = sum_(i = - N)^N \( tilde(upright(bold(K))) dot.op bold(c) \) thin e^(j i pi kappa) + sum_(i = - N)^N U_(phi \, i)^(upright("inc")) thin e^(j i pi kappa) $ <eq:U_phi>
with
$  & upright(bold(K)) = { K_(i n) } = j upright(g)_(i n) hat(h)_n^(\( 2 \)') \( eta \) \,\
 & tilde(upright(bold(K))) = { tilde(upright(K))_(i n) } = tilde(upright(g))_(i n) hat(h)_n^(\( 2 \)) \( eta \) \,\
 & upright(g)_(i n) = 1 / 2 integral_(- 1)^1 d kappa sqrt(1 - kappa^2) frac(d P_n^0 \( kappa \), d kappa) e^(- j i pi kappa) \,\
 & tilde(upright(g))_(i n) = 1 / 2 integral_(- 1)^1 d kappa \( 1 - kappa^2 \) frac(d P_n^0 \( kappa \), d kappa) e^(- j i pi kappa) . $<eq:15>
Here $P_n^0 \( kappa \)$ are the associated Legendre polynomials,
$hat(h)_n^(\( 2 \)) \( eta \)$ are the Schelkunoff Hankel functions of
the second kind satisfying the radiation condition and the prime denotes
differentiation with respect to the argument. $bold(c)$ and $bold(d)$
are the scattering amplitudes that should be determined by matching the
boundary conditions at $r = a$. The first terms on the right side in
(@eq:S_theta)-(@eq:U_phi) represent the reflected waves, whereas the
second terms are the incident waves. The $i$-th Fourier component of the
radial electric and magnetic fields can be written as
$ e_r^i = - i pi \( k_0 \/ eta^2 \) u_phi^i \, quad h_r^i = i pi \( k_0 \/ eta^2 \) sqrt(epsilon.alt_0 \/ mu_0) s_phi^i . $
Equations (@eq:S_theta) - (@eq:U_phi) are written in a general form. The
formalism does not pose any restrictions on the position or nature of
the excitation sources, meaning structured light optical vortices,
vector beams @moreno2010decomposition and optical skyrmions can serve as
inputs @shen2025free@chen2025more@wang2024topological. What is needed
for a given input field is the expansion of the incident field and the
scattered fields in the surrounding space (i.e., Region I) as well as
inside the magnetically ordered materials in terms of the same basis
which allows the boundary conditions on the surfaces of the sphere to be
matched. More details are provided in Appendix C. Without loss of
generality in this work we analyze only the lowest-order spherical waves
generated by elementary sources as shown in (C1) and (C2) of Appendix C.
To emphasize the generality of the formalism, in Appendix C we briefly
describe also an implementation of radially and azimuthally polarized
beams. It is established that the sum of the radially and azimuthally
polarized beams produce a circularly polarized vortex beam which is used
to probe the magnetic vortex dynamics @luttmann2025optical.

In our previous works for periodic planar geometries
@jandieri1@jandieri2@jandieri3 we expanded the fields into a set of
space harmonics varying as $e^(j k_(x n) x)$, where $k_(x n)$ are the
wavenumbers along the periodicity (along the $x$-axis). Here, however,
we are dealing with the spherical symmetry and therefore, we need to use
the fields' expansion in terms of the polar $theta$ angle (meaning in
the basis of $e^(j i pi kappa)$).

At the singularity, the magnetic moment and hence the scattering from it
vanishes. To deal with this region numerically, we define the fields at
$r = 0$ that appear in the denominator of the block matrices in Appendix
B, and a small homogeneous spherical region surrounding the global
origin and having a radius $b$ is considered. It is denoted as Region II
(c.f. inset in Fig. @fig::1) and without loss of generality is assumed
to be the dielectric background space. The fields in Region II can be
written in a similar form as those in Region I. The main difference is
that instead of the Schelkunoff Hankel function
$hat(h)_n^(\( 2 \)) \( eta \)$ we will have a standing wave that is
expressed by the Schelkunoff Bessel function $hat(j)_n \( eta \)$. This
is because an incoming wave $hat(h)_n^(\( 1 \)) \( eta \)$ is completely
reflected at the global origin thus generating
$hat(h)_n^(\( 2 \)) \( eta \)$, which leads to the formation of the
total field - the standing wave
$hat(j)_n \( eta \) = 0.5 \[ hat(h)_n^(\( 1 \)) \( eta \) + hat(h)_n^(\( 2 \)) \( eta \) \]$
\- in Region II @jandyasu. This significantly differs from the analysis
for the planar geometry @jandieri1@jandieri2@khomeriki, where the
transmitted field in the innermost region is represented in terms of
incoming plane waves. Moreover, there are no incident fields in Region
II and hence, the last terms on the right side in
(@eq:S_theta)-(@eq:U_phi) should be set to zero.

Finally, by matching the boundary conditions at $r = a$ and $r = b$, we
obtain the following two equations from which the unknown
$bold(C)^(\( 1 \))$ can be determined
$  & [overline(overline(bold(P)))_U^(\( 1 \)) - mat(delim: "(", upright(bold(K)), 0; 0, tilde(upright(bold(K)))) mat(delim: "(", 0, upright(bold(K)); - tilde(upright(bold(K))), 0)^(- 1) overline(overline(bold(P)))_S^(\( 1 \))] bold(C)^(\( 1 \)) =\
 & = vec(bold(U)_theta^(upright("inc")), bold(U)_phi^(upright("inc"))) - mat(delim: "(", upright(bold(K)), 0; 0, tilde(upright(bold(K)))) mat(delim: "(", 0, upright(bold(K)); - tilde(upright(bold(K))), 0)^(- 1) vec(bold(S)_theta^(italic("inc")), bold(S)_phi^(italic("inc")))\
 & [overline(overline(bold(P)))_U^(\( L \)) - mat(delim: "(", upright(bold(G)), 0; 0, tilde(upright(bold(G)))) mat(delim: "(", 0, upright(bold(G)); - tilde(upright(bold(G))), 0)^(- 1) overline(overline(bold(P)))_S^(\( L \))] bold(C)^(\( L \)) = 0 $<eq:19>
with
$  & upright(bold(G)) = { G_(i n) } = j upright(g)_(i n) hat(j)'_n \( eta \) \, & tilde(upright(bold(G))) = { tilde(G)_(i n) } = hat(upright(g))_(i n) hat(j)_n \( eta \) . $
Once $bold(C)^(\( 1 \))$ is found, the fields inside (using (@eq::9) and
(@eq::10) together with (@eq::13)), as well as outside (using
(@eq:S_theta) - (@eq:15)) the BP are fully determined.

#figure(image("source/Fig2.pdf"),
  caption: [
    \(a) The hedgehog Bloch point ($gamma = 0^0$); (b) the incident
    electric fields $\| S_theta^(i n c) \|$\; (c), (d) the reflected
    electric fields $\| S_theta^r \|$ and $\| S_phi^r \|$, respectively;
    (e),(f) the reflected magnetic fields $\| U_theta^r \|$ and
    $\| U_phi^r \|$, respectively. Here $k_0 a = 0.06$, $k_0 b = 0.005$,
    $epsilon.alt_r = 12$ and $k_0 h = 4$.
  ]
)
<fig::2>

#figure(image("source/Fig3.pdf"),
  caption: [
    \(a) The twisted BP; (b) its projection on the equatorial cut
    ($theta = 90^0$); (c),(d) the spatial distributions of the reflected
    electric $\| S_phi^r \|$ and magnetic $\| U_theta^r \|$ fields,
    respectively. The other parameters are the same as those in Fig.
    @fig::2.
  ]
)
<fig::3>

#figure(image("source/Fig4.pdf"),
  caption: [
    The reflected electric field components $\| S_theta^r \|$ (left
    figure) and $\| S_phi^r \|$ (right figure) versus $k_0 x$ at a fixed
    polar angle $theta = 90^0$ for different azimuthal rotation angles
    $gamma$: $gamma = 0^0$ (solid line); $gamma = 20^0$ (circles);
    $gamma = 40^0$ (asterisk). The other parameters are the same as
    those in Fig. @fig::2.
  ]
)
<fig::4>

= Numerical Results and Discussions
<numerical-results-and-discussions>
To validate the correctness and accuracy of the proposed formalism we
begin by studying two relatively simple models of electromagnetic
scattering of the spherical transverse magnetic $T M_r$ and transverse
electric $T E_r$ incident waves on: a) a homogeneous dielectric sphere,
and b) a dielectric sphere with radially varying relative dielectric
permittivities. The results are then compared with analytical solutions
obtained based on the 3-D transition matrix (T-matrix) theory @jandyasu
which utilizes the expressions for the fields in terms of spherical
functions in all regions. The results are not shown here for brevity,
however, very good agreement is found for all cases. Note that for a
homogeneous scatterer the fields are decoupled and only a set of two
differential equations for ($E_r \, S_theta \, U_phi$) corresponding to
the $T M_r$ wave and ($H_r \, U_theta \, S_phi$) corresponding to the
$T E_r$ wave are solved separately. This is not the case for the
analysis of the BPs, which is characterized by the magnetic permeability
matrix. Therefore, a set of four coupled differential equations have to
be solved, as shown in Appendix B.

=== Hedgehog magnetic texture
<hedgehog-magnetic-texture>
As the simplest interesting example, consider an electric dipole
radiation source positioned on the $z$-axis and pointing along it (see
Fig.@fig::1). This source radiates the lowest-order spherical waves
expressed by a zero-th order spherical Hankel function @2823 (see
Appendix C). The only non-zero components of the incident field produced
by this elementary dipole are $U_phi^(i n c)$, $S_r^(i n c)$ and
$S_theta^(i n c)$ (these field components are derived from the
expression for the radially directed magnetic vector potential). Hence,
the second terms on the right-hand side in (@eq:S_phi) and (@eq:U_theta)
are set to zero. Although our formalism is general, in this paper we
consider a relatively simple model, when there is not a magnetic
material beyond the BP and the source is located in the free space
surrounding the BP. The goal of this paper is to capture the physics of
BP and present fundamental studies about its interaction with the
incoming spherical wave, i.e. to study how the fields are modified by
the singular magnetic texture. The present approach allows, in
principle, to study bulk and interfaces with regard to dielectric as
well as to background-magnetic properties.

Firstly, a hedgehog Bloch point ($gamma = 0^0$), when the unit vectors
of magnetization inside the BP have only radial components
($m_r^0 eq.not 0$, $m_theta = m_phi = 0$), is considered (c.f. Fig.
@fig::2\(a)). This structure can be viewed as an emergent magnetic
monopole. After several tests for convergence of the solutions, the
truncation number was chosen as $N = 5$. The BP is divided into 25 equal
thin shell layers and all material parameters are assumed to be constant
within each thin shell layer (see Sec. II). The absolute value of the
incident electric field $\| S_theta^(i n c) \|$ and the reflected
electric $\| S_theta^r \|$, $\| S_phi^r \|$ and magnetic
$\| U_theta^r \|$, $\| U_phi^r \|$ fields are demonstrated in Figs.
@fig::2\(b) - @fig::2\(f) at $k_0 a = 0.06$, $k_0 b = 0.005$,
$epsilon.alt_r = 12$ and $k_0 h = 4$. In this work we develop a general,
material-independent formulation, and do not specify a particular
material. However, we should note that the radius of the sphere $a$
should be taken to be much smaller than the wavelength, since the
electromagnetic waves are in the range of magnetic excitations. The
formalism analytically and numerically is not restricted to a particular
location of the source. Here, the dipole is chosen to be located at a
relatively large distance from the BP and hence, the incident wavefront
impinging on the BP has a symmetric profile with respect to the polar
$theta$ angle (for a dipole source closer to the BP, the field would
lose its symmetric profile and would be concentrated in the vicinity of
the upper half of the sphere). The reflected fields show typical
profiles with strong localization in the vicinity of the BP at around
$theta = 90^0$ and the $theta$-components of both fields decrease faster
than the $phi$-components with increasing a distance from the surface of
the BPs.

#figure(image("source/Fig5.pdf"),
  caption: [
    (a), (b): Time-averaged gauge-invariant optical chiral density and
    (c),(d): the magnetoelectric density for the hedgehog Bloch point
    (left figures) and the twisted Bloch point $gamma = 60^0$ (right
    figures). The other parameters are the same as in Fig. @fig::2.
  ]
)
<fig::5>

#figure(image("source/Fig6.pdf"),
  caption: [
    Time-averaged Poynting vector of the reflected fields as a function
    of (a): the polar angle $theta$ at the fixed radial distance
    $r = 1.3 a$, i.e. very close to the outer surface of the hedgehog
    BP; (b) the normalized radial distance $k_0 r$ at the spherical cut
    $theta = 120^0$. (c),(d): the same as above but for the twisted BP
    at $gamma = 60^0$.
  ]
)
<fig::6>

#figure(image("source/Fig7.pdf"),
  caption: [
    Total angular momentum (AM) density $\| J_perp \|$ (black line) and
    $J_z$ (blue line) as a function of the polar angle $theta$ at the
    fixed radial distance $r = 1.3 a$ for: (a) the hedgehog BP; (b) the
    twisted BP.
  ]
)
<fig::7>

=== Twisted Bloch point
<twisted-bloch-point>
Let us consider the effect of the azimuthal rotation angle $gamma$
generating twisted BP in Fig. @fig::3\(a) on the EM wave scattering.
Unlike the hedgehog BP, in the case of the twisted BP at
$gamma eq.not 0$, the unit vector of magnetization is radially oriented
only at the poles of $theta = 0^0$ and $theta = 180^0$. Its orientation
as a function of $theta$ is defined by (@eq:5). Let us inspect the field
distributions of $\| U_theta^r \|$ and $\| S_phi^r \|$ at
$gamma = 60^0$. These field components are excited solely by an
interaction of the incident field with the BP and contribute to a
formation of the scattered fields, in particular they are not present in
the incident field, i.e., $S_phi^(i n c) = U_theta^(i n c) = 0$. The
results of the field distributions are given in Figs. @fig::3\(b) and
3(c). From the figures it follows that the field distributions for
$\| S_phi^r \|$ and $\| U_theta^r \|$ exhibit quite different profiles
from those in Figs. @fig::2\(d) and @fig::2\(e). The fields are no
longer localized at around $theta = 90^0$, but are concentrated closer
to the $z$-axis of the twisted BP. The results are not shown, but
interestingly, $S_theta^r$ and $U_phi^r$ do not show any changes from
those in Figs. @fig::3\(c) and 3(f) at $gamma = 0^0$. To study this
phenomenon in more detail, $\| S_theta^r \|$ and $\| S_phi^r \|$ are
plotted as a function of $k_0 x$ at a fixed spherical angle
$theta = 90^0$ for different values of $gamma$: $gamma = 0^0$ (solid
line); $gamma = 20^0$ (circles); $gamma = 40^0$ (asterisk). The results
of the reflected electric fields are illustrated in Fig. 4. As expected,
$S_theta^r$ (black line) does not show any changes when increasing
$gamma$, whereas a maximum of $S_phi^r$ (red line) is decreasing
inversely proportional to $gamma$. The results for the magnetic field
show similar profiles. Namely, $U_phi^r$ is not changing by increasing
$gamma$.

=== Emergent features of formed EM fields and magnetoelectric coupling
<emergent-features-of-formed-em-fields-and-magnetoelectric-coupling>
Having shown how the noncollinear magnetic texture mold the incoming EM
waves, it is of interest to consider the specific features of these
fields. Here, several well-established quantities will be discussed. The
time-average of the important magnetoelectric pseudoscalar
$upright(bold(E)) dot.op upright(bold(H))$ may be expressed as
$Q_(M E) = upright(bold(E)) dot.op upright(bold(H)) = 1 / 2 [S_theta U_theta^(*) + frac(S_phi U_phi^(*), 1 - kappa^2) - 1 / eta^2 frac(partial U_phi, partial kappa) (frac(partial S_phi, partial kappa))^(*)]$
from which the time-averaged, normalized (propagating) optical chiral
density $chi$ follows as @jandieri2024chiral:
$ chi = 1 / eta^2 Im (Q_(M E)) \, $<eq:23> and the reactive
magnetoelectric density $A_(M E)$ is @bliokh2014magnetoelectric
$A_(M E) = 1 / eta^2 Re (Q_(M E)) .$ $Q_(M E)$ is derived directly from
the fields and hence $chi$ and $A_(M E)$ are gauge-invariant. These
values are normalized by $epsilon.alt_0 k_0^3 \/ 2$. Here, we recall the
importance of producing fields with time-averaged, finite and possibly
tunable $upright(bold(E)) dot.op upright(bold(H))$ for research
concerning chiral materials @PhysRevLett.104.163901, axion fields in
general, and axion electrodynamics of a 3-D topological insulator in
particular as well as to access spin-charge response in condensed matter
@Li2010#cite(label("doi:10.1126/science.aaf5541"))@Nenno2020@PhysRevB.99.075104.
Our results for $chi$ and $A_(M E)$ in Fig. @fig::5 for hedgehog and
twisted BPs are generated by fields determined using (@eq:7).
Irradiating with fields having no $chi$ and $A_(M E)$, meaning any
transverse fields with real-valued $upright(bold(E))$, upon interaction
with the magnetic texture, the phases and the directions of
$upright(bold(E))$ and $upright(bold(H))$ are mixed leading to a
formation of localized finite $chi$ and $A_(M E)$. The twist in a BP
allows for more channels for scattering and hence more mixing enhancing
the maximal magnitude of $chi$ and $A_(M E)$. The strong localization of
the produced magnetoelectric activity implies that if we have a
collection of BP-type textures, as they occur for example in artificial
spin ice or gyroid structures
#cite(label("doi:10.1021/acsami.4c02366")), then a lattice of $chi$ and
$A_(M E)$ will be formed. Notably,
$upright(bold(E)) dot.op upright(bold(H))$ has been observed
experimentally in the center of plasmonic vortices
@PhysRevResearch.6.013163. The method identified here generates finite,
time averaged $chi$ and $A_(M E)$ in a non-dissipative way and they are
localized well beyond the BPs, whereas in plasmonic-based methods $chi$
and $A_(M E)$ live at the metal-dielectric interface. Thus, our scheme
is qualitatively different and complementary to the plasmonic method.
This remark becomes relevant when using $chi$ and $A_(M E)$ to probe
unperturbed samples.

For optical forces and torques as well as for an insight into the energy
flow and the orbital angular momentum distribution, the components of
the time-averaged Poynting vector $upright(bold(P))$ are important. They
are calculated according to the following expressions:
$ P_r & = frac(1, 2 eta^2 sqrt(1 - kappa^2)) Re \( S_theta U_phi^(*) - S_phi U_theta^(*) \) \,\
P_theta & = frac(1, 2 eta^3 sqrt(1 - kappa^2)) Re (U_phi^(*) / j frac(partial U_phi, partial kappa) + S_phi (1 / j frac(partial S_phi, partial kappa))^(*)) \,\
P_phi & = frac(1, 2 eta^3 sqrt(1 - kappa^2)) Re (- U_theta^(*) / j frac(partial U_phi, partial kappa) - S_theta (1 / j frac(partial S_phi, partial kappa))^(*)) . $<eq:24>
These components are shown in Figs. @fig::6\(a) and @fig::6\(c) for the
hedgehog BP and the twisted BP as a function of $theta$ at a fixed
radial distance $r = 1.3 a$ close to the outer surface. The Poynting
vector components are normalized by $k_0^2 sqrt(epsilon.alt_0 \/ mu_0)$.
The main contribution is carried by $P_phi$ (blue line) which is
antisymmetric with respect to the equatorial cut $theta = 90^0$. We
recall that $P_phi$ is the only component of the Poynting vector which
is predominantly influenced by an interaction of the electromagnetic
wave with the BP (as inferred from the third expression in (@eq:24)
which indicates that $P_phi = 0$ if the magneto-optical activity of the
BP disappears). Further numerical results and analysis evidence that the
shape of $P_phi$, as expected, does not show any substantial variations
with respect to the radial distance $r$ (in particular its antisymmetric
profile is not changing). Another point worth noticing is that unlike
the hedgehog BP, the $theta$ component of the Poynting vector is more
pronounced for the twisted BP (red dashed line). As for the radial
component of the Poynting vector $P_r$, similar profiles (red line) are
exhibited for both types of BPs. Note that the radial component of the
Poynting vector is mainly affected by the homogeneous dielectric
permittivity of the scatterer and is not sensitive to the elements of
the magnetic permeability matrix that characterize the BP. Assuming
$g mu_0 M_s = 0$ one readily concludes that all non-diagonal components
of the permeability matrix in Appendix A become zero and the diagonal
components are equal to unity. Dependence of the Poynting vector
components versus the normalized radial distance $k_0 r$ in some
particular spherical cuts is shown in Figs. @fig::6\(b) and @fig::6\(d).
The $P_phi$ and $P_theta$ components are rapidly decreasing in
magnitudes as the radial distance grows but are localized clearly
outside the BPs. In the far-field region (with respect to the BP size)
only the radial component of the Poynting vector survives, as expected
for EM wave scattering by homogeneous objects.

Generally, the total angular momentum density follows from
$upright(bold(J)) = upright(bold(r)) times upright(bold(P)) \/ c^2$. For
strongly non-paraxial beams, it is not unique how the orbital angular
momentum density $upright(bold(L))$ can be disentangled from the spin
angular momentum density $upright(bold(S))$ as is done in
@PhysRevA.82.063825 for paraxial beams
($upright(bold(L)) = upright(bold(J)) - upright(bold(S))$). Hence, we
will discuss here $upright(bold(J))$, keeping in mind that it
encompasses both $upright(bold(L))$ and $upright(bold(S))$. The
transversal $\| bold(J)_perp \| = sqrt(J_x^2 + J_y^2)$ and the
longitudinal $J_z$ components of the total angular momentum (AM) density
are given by
$ \| bold(J)_perp \| = sqrt(kappa^2 J_theta^2 + J_phi^2) \, quad J_z = - sqrt(1 - kappa^2) J_theta $<eq:25>
with $J_theta = - r P_phi$ and $J_phi = r P_theta$, where $r$ is taken
with respect to the global origin. The total AM density
$\| bold(J)_perp \|$ (black line) and $J_z$ (blue line) as a function of
the polar angle $theta$ at the fixed radial distance $r = 1.3 a$ for the
hedgehog BP and for the twisted BP are shown in Figs. @fig::7\(a) and
7(b), respectively. Obviously, in the absence of the magneto-optical
effects characterizing the BP, $P_phi = 0$, i.e. $J_theta = 0$ and
hence, no total AM density along the $z$-axis is observed. As for the
total AM, i.e. an integration with respect to $r$ and $theta$, under our
prescribed geometrical parameters and the incident field, it will be
equal to zero. For a source closer to the BP, the reflected field is
substantially stronger, concentrated in the vicinity of the upper half
of a sphere enclosing the BP, and a finite total AM results. Finally, we
note that some experimental studies for the chiral fields and orbital
angular momentum-dependent responses are described in
@mun2020electromagnetic. They can be useful for the analysis of the
reflected fields by the BP discussed in this paper, which possess
orbital angular momentum, chirality as well as magnetoelectric
densities.

= Conclusions
<conclusions>
The work presents an efficient and self-consistent approach for the
analysis of EM wave scattering by hedgehog and twisted BPs. The goal was
to investigate how non-collinear magnetic textures respond to EM fields
in the frequency range of magnetic excitations and how to use BPs as
photonic elements that modify the scattered (reflected) fields. The
formalism is general and can be applied to various excitation sources
and spin configurations apart from BPs. Special attention is paid to
field components generated solely by an interaction of EM waves and BPs
and to their modifications when transforming from a hedgehog to a
twisted configuration. The field's spatial distributions, chirality
density, magnetoelectric density, Poynting vector, and total angular
momentum density are numerically evaluated and analyzed.

The generalization of the formalism to the problem with both $theta$ and
$phi$-dependent spherical objects is straightforward and requires
developing explicit expressions for the field components (including the
$partial \/ partial phi$ terms) in a spherical coordinate system
satisfying the vector Helmholtz equation. As a result, the size of the
matrix to be solved becomes larger than in the problem considered here,
but the analytical procedure remains the same. Finally, it is important
to mention that our EM simulations are carried out for a particular size
of the BP, the extent to which depends on the temperature $T$
@YASTREMSKY2025172834. For a fixed temperature, for example, near the
Curie temperature $T_c$ the BP radius scales as
$prop \( T - T_c \)^(- 1 \/ 2)$.

#heading(level: 1, numbering: none)[Author contributions]
<author-contributions>
All authors equally contributed to this work.

#heading(level: 1, numbering: none)[Acknowledgments]
<acknowledgments>
The work has been supported by the Shota Rustaveli National Science
Foundation of Georgia (SRNSFG) \[FR-23-249\] and the DFG under project
Nr. 429194455, and DOE (USA) Nr.~DE-FOA-0002514. D.E. and V.J. also
acknowledge the partial support by the Deutsche Forschungsgemeinschaft
(DFG) in the Framework of the CRC/TRR 196 MARIE (Project-ID 287022738)
within project M03.

V. Jandieri would like to express his sincere gratitude to Professor
Kiyotoshi Yasumoto from Kyushu University, Japan for discussions about
the theory of periodic and bandgap structures.

#heading(level: 1, numbering: none)[Conflict of interest]
<conflict-of-interest>
The authors declare no potential conflicts of interest.

#heading(level: 1, numbering: none)[Data Availability Statement]
<data-availability-statement>
The data beyond those in the text are available from the authors upon
reasonable request.

= Magnetic Permeability Matrix
<magnetic-permeability-matrix>
The elements of the magnetic permeability matrix:
$mu_(i j) \( theta \, r \) = mat(delim: "[", mu_11, mu_12, mu_13; mu_12^(*), mu_22, mu_23; mu_13^(*), mu_23^(*), mu_33)$
are implicitly written in the following form:

#block[
$ mu_11 = 1 + alpha frac(upright(g)^2 mu_0^2 M_s^2, omega^2) (\( m_theta^0 \)^2 + \( m_phi.alt^0 \)^2) [hat(O) M_0 \( r \)] \, #h(0em) mu_12 = alpha (- frac(upright(g)^2 mu_0^2 M_s^2, omega^2) m_r^0 m_theta^0 [hat(O) M_0 \( r \)] - j frac(g mu_0 M_s, omega) m_phi.alt^0) \, $
$ mu_13 = alpha (- frac(upright(g)^2 mu_0^2 M_s^2, omega^2) m_r^0 m_phi.alt^0 [hat(O) M_0 \( r \)] + j frac(g mu_0 M_s, omega) m_theta^0) \, #h(0em) mu_22 = 1 + alpha frac(upright(g)^2 mu_0^2 M_s^2, omega^2) (\( m_r^0 \)^2 + \( m_phi.alt^0 \)^2) [hat(O) M_0 \( r \)] \, #h(0em) $
$ mu_23 = alpha (- frac(upright(g)^2 mu_0^2 M_s^2, omega^2) m_theta^0 m_phi.alt^0 [hat(O) M_0 \( r \)] - j frac(g mu_0 M_s, omega) m_r^0) \, #h(0em) mu_33 = 1 + alpha frac(upright(g)^2 mu_0^2 M_s^2, omega^2) (\( m_r^0 \)^2 + \( m_theta^0 \)^2) [hat(O) M_0 \( r \)] \, #h(0em) $
$ mu_21 = mu_12^(*) \, #h(2em) mu_31 = mu_13^(*) \, #h(2em) mu_32 = mu_23^(*) $

where
$ alpha = frac(1, 1 - frac(upright(g)^2 mu_0^2 M_s^2, omega^2) [hat(O) M_0 \( r \)]^2) \, #h(0em) hat(O) = (frac(partial^2, partial r^2) + 2 / r frac(partial, partial r) - 2 / r^2) + 2 nu (1 - M_0^2) $
Here $delta_(i j)$ is the Kronecker delta function, the asterisk denotes
a complex conjugate and $omega$ is an excitation angular frequency.

= Block Matrices in Spherical Coupled-Wave Analysis
<block-matrices-in-spherical-coupled-wave-analysis>
Expressions of the block matrices $Psi_(q q')$ in (@eq:8) are explicitly
written as:
$ Psi_11 = 0 \, #h(0em) Psi_12 = - frac(1, j eta) ［ mu_13^(*) ］ ［ mu_11 ］^(- 1) ［ j pi p ］ \, Psi_13 = - (［ mu_23^(*) ］ - ［ mu_13^(*) ］ ［ mu_11 ］^(- 1) ［ mu_12 ］) \, $
$ Psi_14 = - 1 / eta^2 ［ sqrt(1 - kappa^2) ］ ［ j pi p ］ ⟦1 / epsilon.alt_r⟧ ［ j pi p ］ - ⟦mu_33 / sqrt(1 - kappa^2)⟧ + ［ mu_13^(*) ］ ［ mu_11 ］^(- 1) ⟦mu_13 / sqrt(1 - kappa^2)⟧ \, #h(0em) Psi_21 = 0 \, $
$ Psi_22 = frac(1, j eta) ⟦1 / sqrt(1 - kappa^2)⟧^(- 1) ［ mu_12^(*) ］ ［ mu_11 ］^(- 1) ［ j pi p ］ \, #h(0em) Psi_23 = ⟦1 / sqrt(1 - kappa^2)⟧^(- 1) (⟦mu_22⟧ - ⟦mu_12^(*)⟧ ⟦mu_11⟧^(- 1) ⟦mu_12⟧) \, $
$ Psi_24 = ⟦1 / sqrt(1 - kappa^2)⟧^(- 1) dot.op (⟦mu_23 / sqrt(1 - kappa^2)⟧ - ⟦mu_12^(*)⟧ ⟦mu_11⟧^(- 1) ⟦mu_13 / sqrt(1 - kappa^2)⟧) \, #h(0em) Psi_31 = 0 \, #h(0em) $
$ Psi_32 = ⟦epsilon.alt_r / sqrt(1 - kappa^2)⟧ + 1 / eta^2 ⟦sqrt(1 - kappa^2)⟧ ［ j pi p ］ ［ mu_11 ］^(- 1) ［ j pi p ］ \, #h(0em) $
$ Psi_33 = frac(1, j eta) ⟦sqrt(1 - kappa^2)⟧ ［ j pi p ］ ［ mu_11 ］^(- 1) ［ mu_12 ］ \, #h(0em) Psi_34 = frac(1, j eta) ⟦sqrt(1 - kappa^2)⟧ ［ j pi p ］ ［ mu_11 ］^(- 1) ⟦mu_13 / sqrt(1 - kappa^2)⟧ \, $
$ Psi_41 = - ［ epsilon.alt_r ］ ⟦1 / sqrt(1 - kappa^2)⟧^(- 1) \, #h(0em) Psi_42 = 0 \, #h(0em) Psi_43 = 0 \, #h(0em) Psi_44 = 0 \, $

]
with

$ (⟦Upsilon⟧)_(n \, m) = 1 / 2 integral_(- 1)^1 Upsilon \( kappa \) e^(- j \( n - m \) pi kappa) thin d kappa $
Here, $⟦Upsilon⟧$ is a square matrix generated by the Fourier
coefficients of $Upsilon$, with $\( n \, m \)$ entries equal to
$Upsilon_(n - m)$\; $eta = k_0 r$.

= Expansion of the Incident Field
<expansion-of-the-incident-field>
The sources of the lowest-order spherical waves are current elements. As
it is well-known a single electric-current (an elementary Hertz dipole)
with current $I$ and length $l$ parallel to the $z$-axis radiates a
$T M_z$ field that can be derived from a magnetic vector potential. When
the dipole is displaced off the origin, a radial wavefunction of the
zero-th order is employed and for the radial component of the magnetic
vector potential we have
$ A_r = r frac(k_0 I l, j 4 pi h) h_0^(\( 2 \)) \( k_0 \| bold(r) - bold(h) \| \) \, $
where $bold(h) = bold(z) h$ and $h_0^(\( 2 \))$ is the spherical Hankel
function. Here $h$ is a distance from the global origin to the source
location along the $z$-axis. Since (C1) is written in the coordinate
system viewed from the source, we need to expand (C1) in spherical
wavefunctions referred to the global origin. This can be accomplished
using the addition theorem for the spherical functions, and finally we
get
$ A_r = r frac(k_0 I l, j 4 pi h) sum_(n = 0)^oo \( 2 n + 1 \) h_n^(\( 2 \)) \( k_0 r_(>) \) j_n \( k_0 r_(<) \) P_n^0 \( c o s theta \) $
with $r_(>) = m a x \[ r \, h \]$, $r_(<) = m i n \[ r \, h \]$ and
$j_n$ is the spherical Bessel function of the $n$-th order. The electric
and magnetic field components can be expressed through the radial
component of the magnetic vector potential @2823 and then can be
directly implemented into our formalism (see Sec. III).

The analysis is straightforward for radially and azimuthally polarized
beams. Assuming that the incident beam is propagating along the
$z$-axis, we can expand the cylindrical wave functions in terms of
spherical ones @stratton2007electromagnetic
$ J_m \( k_perp rho \) e^(j k_(\| \|) z) = sum_(n = 0)^oo j^n \( 2 n + 2 m + 1 \) frac(n !, \( n + 2 m \) !) dot.op\
P_(n + m)^m \( c o s theta \) P_(n + m)^m \( c o s alpha \) j_(n + m) \( k_0 r \) . $
Here $k_perp$ and $k_(\| \|)$ are the wavenumbers along the transversal
and longitudinal directions with respect to propagation axis, i.e.
$z$-axis, $J_m$ is the Bessel function of the first kind with order $n$
and $alpha$ is an angle between the wavevectors $bold(k_0)$ and
$bold(k_perp)$. Finally, it is required to expand the $theta$-dependent
terms in (C3) into a 1-D Fourier series as was done in (@eq:7) and
impose the boundary conditions on the spherical shell surfaces to
determine the unknown scattering coefficients. No modification of the
formalism is needed.

#bibliography("references.bib", style: "ieee", title: [References])
