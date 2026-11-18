// Format conversion of arXiv:2512.05384v1 by Waqas Ahmed, Ahsan Illahi, and Asma.
// Original and this adaptation: CC BY-NC-SA 4.0 (https://creativecommons.org/licenses/by-nc-sa/4.0/).
#set page(paper: "a4", margin: 22mm, numbering: "1")
#set text(font: "Libertinus Serif", size: 11pt)
#set par(justify: true)
#set heading(numbering: "1.1")
#set math.equation(numbering: "(1)")
#align(center)[
  #text(size: 17pt, weight: "bold")[Response of Elliptical Scatterer Due to Perfect Magnetic Material]
  #v(4pt)
  Waqas Ahmed#super[1], Ahsan Illahi#super[2], and Asma#super[3]

  #super[1] Center for Fundamental Physics, School of Artificial Intelligence, Hubei Polytechnic University, Huangshi 435003, China \
  #super[2,3] Research in Modeling & Simulation (RIMS) Group, Department of Physics, COMSATS University Islamabad, Islamabad Pakistan.
]
*Keywords:* Bistatic, elliptic, Mathieu, radial, unidirectional

#heading(numbering: none)[Abstract]
The effects on the bistatic echo width of an elliptical cylinder due to
a perfect magnetic material are reported in this article. The
configuration is analyzed using the separation of variables method and
Mathieu functions. In this approach, the structural geometry is
illuminated by an electromagnetic field. Radial and angular Mathieu
functions have been used in the formulation. Notably, the maxima of the
scattered elliptic transfer electric mode ($theta = 180^compose$) are
much higher than those of the scattered transfer magnetic mode,
comparable to terms $theta = 120^compose$ and $theta = 240^compose$,
respectively. It can be observed that an increase in the in-plane radial
component leads to the linearity principle for the transfer electric
mode, while non-linear behavior is investigated for the elliptic
transfer magnetic mode. Therefore, the unidirectional bistatic echo
width is subject to non-directional behavior. These analogous results
may have applications in the fields of optics, meteorology, acoustics,
radio astronomy, collision physics, and other disciplines where wave
scattering phenomena play a crucial role. Furthermore, the findings of
this study contribute to the fundamental understanding of
electromagnetic interactions with complex geometries and materials.

= Introduction
<introduction>
Scattering problems involving homogeneous and inhomogeneous elliptical
cylinders hold significant importance due to their wide applications in
electromagnetics \[1-25\], including radar sensing, computer-generated
imagery, medical ultrasound, meteorology, acoustics, and radio
astronomy, among others. The utilization of Mathieu functions aids in
deriving scattered field expressions as functions of elliptical cylinder
coordinates through expansion coefficients of closed-form expressions
\[1\]. Scattering occurs when radiation is deviated from its original
path due to non-uniformities in the propagation medium. The field
pattern from a dielectric-coated elliptic cylinder has been studied
\[6\] and a spatially uniform coated impedance elliptical cylinder
scattering is investigated \[7\]. Exact solutions for multilayered
dielectric elliptical cylinders are found using recursive relation
formulations \[8\], and scattering theory regarding exact solutions for
planar waves on iso-refractive cylinders is explored \[10\].

An intriguing observation is that when dielectric permittivity and
magnetic permeability values of an elliptical cylinder are mismatched,
the incident electromagnetic mode is represented by a single mode of
Mathieu functions whereas the scattered field is represented by modes of
different orders Mathieu functions \[11, 12\]. This effect is
demonstrated when an electric current source representing the
single-mode Mathieu function is excited by an electromagnetic field
\[1-14\]. This is crucial fpr understanding the behaviour of the system
when plane wave excitation is commonly used. Modes in plane waves are
infinite in circular and elliptical coordinates, making calculations for
elliptically shaped objects complex due to coupled elliptical modes for
scattered fields.

There's growing interest in electromagnetic wave scattering by realistic
geometries such as spheres, circular cylinders, and elliptical
cylinders, leading to considerable attention in the literature \[5\].
Elliptic cylinders offer generalized geometry, capable of producing
various cross-sectional cylindrical objects by altering the axial ratio.
The wave equation is separable in an elliptical coordinate system,
allowing closed-form solutions for problems involving ellipses.

Recent years have seen significant research on scattering by perfect
magnetic objects, due to applications in engineering and theoretical
studies. Perfect Magnetic Conductors (PMC) attract researchers in
electromagnetic tunneling, absorbers, and antennas. Unlike Perfect
Electric Conductors (PEC), PMC doesn't alter the electric field's phase
upon reflection but reverses the magnetic field's phase \[1\].

This paper is invaluable for scholars exploring scattering from small
objects. Adjusting the elliptical geometry's eccentricity enables
constructing ellipses and objects with thin or flattened scattering
profiles, such as radars, planks of wood, absorbing-coated aircraft
wings, fingers \[17\], or wrists. The analysis here focuses on the
scattering problem of plane waves involving an infinitely long perfectly
magnetic elliptic cylinders, considering both TE and TM polarizations
and arbitrary angles of incidence and axial ratios. The boundary
condition $hat(upright(bold(n))) times upright(bold(H)) = 0$, on the PMC
surface is met at low frequencies using high-$mu$ materials. For
magnetostatics, at the interface of air and a high-permeability
material, the magnetic flux is normal to the surface as required for PMC
material. At high frequencies, finding materials with high permeability
is challenging, making it feasible to mimic the PMC condition on a
surface where no surface current can flow.

= Analytical Model
<analytical-model>
A Perfect Magnetic Conductor (PMC) is an idealized medium with infinite
magnetic conductivity. While perfect magnetic conductors do not occur
naturally, the concept is useful when magnetic resistances are
negligible compared to other effects. At the surface of a PMC object,
the required boundary conditions are as follows:

$ hat(upright(bold(n))) times upright(bold(H)) = 0 \, quad quad hat(upright(bold(n))) dot.op upright(bold(B)) = 0 $

Here, $upright(bold(H))$, $upright(bold(B))$ and $upright(bold(n))$
represent the magnetic fields, magnetic flux densities, and the unit
normal to the surface boundary, respectively.

Consider a uniform plane electromagnetic (EM) wave incident on an
infinitely long PMC elliptic cylinder with semi-major axis '$a$' and
semi-minor axis '$b$', where the $z$-axis is the cylinder axis.
Illustrated in Figure 1, the plane wave approaches at an angle
$phi.alt_i$ relative to the positive $x$-axis of the Cartesian
coordinate system. For analysis, it's advantageous to present the
problem in elliptic coordinates $u$ and $v$, defined as
$x = F cosh u cos v$, $y = F sinh u sin v$, with the semi-focal length
of the ellipse as $F$. Throughout this study, the time-dependent factor
$exp \( j omega t \)$ is considered, where $omega$ is the angular
frequency.

== TM Polarization
<tm-polarization>
#figure(image("source/Elliptic/ellipticimage1.png", width: 50.0%),
  caption: [
    Configuration for TM polarization
  ]
)

The longitudinal component of the incident TM-polarized field may be
represented as
$ E_z^(\( i \)) = exp #h(-1em) [- j k #scale(x: 120%, y: 120%)[\(] cos phi_i + sin phi_i #scale(x: 120%, y: 120%)[\)]] \, $
where $k$ denotes the wavenumber corresponding to the wavelength
$lambda$, and $phi_i$ specifies the angle at which the plane wave
arrives.

For an elliptic cylindrical coordinate system, the associated vector
wave functions are built from the scalar Mathieu functions. The
electric-type function $arrow(N)$, and the magnetic-type function
$arrow(M) = k^(- 1) nabla times arrow(N)$, can be written in the form

$ arrow(N)_(q m)^(\( i \)) \( c \, xi \, eta \) = R_(q m)^(\( i \)) \( c \, xi \) thin S_(q m) \( c \, eta \) thin hat(upright(bold(z))) \, $

$ k h thin arrow(M)_(q m)^(\( i \)) = R_(q m)^(\( i \)) \( c \, xi \) thin S'_(q m) \( c \, eta \) thin hat(upright(bold(u))) - R_(q m)^(\( i \) thin') \( c \, xi \) thin S_(q m) \( c \, eta \) thin hat(upright(bold(v))) \, $

where $R_(q m)^(\( i \))$ and $S_(q m)$ denote the radial and angular
Mathieu functions, respectively, primes indicate differentiation with
respect to the argument, and $h$ is the scale factor in elliptic
coordinates.

$ E^i = sum_(m = 0)^oo A_(e m) N_(e m)^(\( 1 \)) + sum_(m = 1)^oo A_(o m) N_(o m)^(\( 1 \)) $

$A_(e m)$ and $A_(o m)$ are the coefficient of expansion \[9\]. The
scattered field can be assumed of the form as follows.

$ E^s = sum_(m = 0)^oo {B_(e m) N_(e m)^(\( 4 \))} + sum_(m = 1)^oo { B_(o m) N_(o m)^(\( 4 \)) } $

In eq 5 $B_(e m) \, B_(o m)$ are unknown coefficients of expansion.
Similarly, the incident and scattered magnetic field can be evaluated
using eq (4), eq (5), and the Maxwell Eq as:
$ H^i = j / Z [sum_(m = 0)^oo A_(e m) M_(e m)^(\( 1 \)) + sum_(m = 1)^oo A_(o m) M_(o m)^(\( 1 \))] $

$ H^s = j / Z [sum_(m = 0)^oo { C_(e m) N_(e m)^(\( 4 \)) } + sum_(m = 1)^oo { C_(o m) N_(o m)^(\( 4 \)) }] $

In eq 7 $C_(e m) \, C_(o m)$ are the unknown coefficients of expansion
and $Z$ is the impedance of wave in free space. By using Tangential
condition at the interface of cylinder to obtain unknown coefficients of
expansion as:

$ [H_z^i + H_z^s] = 0 $

$ [H_v^i + H_v^s] = 0 $

Applying the orthogonal property of Mathieu functions and substituting
value of electric and magnetic field in above equations yield:

$ B_(q m) = - frac(R_(q m)^(\( 1 \)') \( c \, xi_s \) R_(q m)^(\( 4 \)) \( c \, xi_s \), R_(q m)^(\( 4 \)) (c \, xi_s) R_(q m)^(\( 4 \)') \( c \, xi_s \)) A_(q m) $

The normal boundary condition (1) is satisfied by the incident fields
and scattered fields obtained using (10).

== TE Polarization
<te-polarization>
#figure(image("source/Elliptic/ellipticimage2.png", width: 40.0%),
  caption: [
    Configuration for TE polarization
  ]
)

Using duality, eq. 4 to eq (7) are used to obtain the expressions for
the incident and scattered EM fields for TE case. The coefficient of
expansion in eq (10) is obtained by satisfying boundary conditions on
the interface of cylinder.

== Far Field
<far-field>
Echo width is one of the most important parameters in scattering, it is
obtained by calculating scattered field in far zone. For incident
transverse magnetic incident wave, the scattered components in far zone
($xi arrow.r oo$) are obtained using asymptotic expressions of
$R_(q m)^(\( 4 \)) \( c \, xi \)$ and
$R_(q m)^(\( 4 \)') \( c \, xi \)$. Considering $tau = cos phi.alt$, the
electric and magnetic field components are,

$ E_z^s = sqrt(frac(j, k rho)) thin e^(- j k rho) [sum_(m = 0)^oo j^m B_(e m) S_(e m) \( c \, tau \) + sum_(m = 1)^oo j^m B_(o m) S_(o m) \( c \, tau \)] $

$ E_phi.alt^s = sqrt(frac(j, k rho)) thin e^(- j k rho) [sum_(m = 0)^oo j^m C_(e m) S_(e m) \( c \, tau \) + sum_(m = 1)^oo j^m C_(o m) S_(o m) \( c \, tau \)] $

$ H_phi.alt^s = - E_z^s / Z $

$ H_z^s = E_phi.alt^s / Z $

The bistatic echowith can be defined as follow:

$ sigma = lim_(rho arrow.r oo) 2 rho pi frac(Re [(E^s times H^(s *)) dot.op hat(rho)], Re [(E^i times H^(i *)) dot.op hat(rho)]) $

where $hat(rho)$ denotes the unit vector in the increasing direction of
$rho$ and asterisk represents the complex conjugate. After substituting
scattered and incident fields in (15), the (normalized) bistatic echo
width is obtained:

$ sigma / lambda & = sum_(m = 0)^oo sum_(n = 0)^oo j^m \( - j \)^n thin #scale(x: 120%, y: 120%)[\(] B_(e m) S_(e m) \( c \, tau \) + B_(o m) S_(o m) \( c \, tau \) #scale(x: 120%, y: 120%)[\)] #scale(x: 120%, y: 120%)[\(] B_(e n) S_(e n) \( c \, tau \) + B_(o n) S_(o n) \( c \, tau \) #scale(x: 120%, y: 120%)[\)]^(*)\
 & quad + sum_(m = 0)^oo sum_(n = 0)^oo j^m \( - j \)^n thin #scale(x: 120%, y: 120%)[\(] C_(e m) S_(e m) \( c \, tau \) + C_(o m) S_(o m) \( c \, tau \) #scale(x: 120%, y: 120%)[\)] #scale(x: 120%, y: 120%)[\(] C_(e n) S_(e n) \( c \, tau \) + C_(o n) S_(o n) \( c \, tau \) #scale(x: 120%, y: 120%)[\)]^(*) . $

By substituting $phi.alt = phi.alt_i$ in (16) the normalized
backscattering width can be obtained.

= Numerical Results and Discussion
<numerical-results-and-discussion>
The approach described above was used to investigate the normalized
scattering cross-section of elliptic PMC cylinder for both TE and TM
polarized incident waves. Results are presented for different axial
ratio and by varying the angle of incidence. To validate our formulation
for simulation, the normalized backscattering widths have been
calculated first for PMC elliptic cylinders excited by normally incident
plane wave when axial ratio is 2 and length of semi-major axis is
$lambda / 2$. Normalized scattering width $sigma / lambda$ in Fig. 3
compared with \[2\] verifies the accuracy of analysis.

#figure(image("source/Elliptic/ellipticimage4.png", width: 45.0%),
  caption: [
    Validation and comparison results
  ]
)

The magnitude of scattering of TE wave is large as compared to TM wave
and maximum scattering occurs at $180^o$ whereas, for TM maximum
scattering is observed at $120^o$ and $240^o$. The normalized
backscattering width ($sigma \/ lambda$) for an elliptic PMC cylinder of
axial ratio 2 is plotted against $k a$ in Fig. 4.

#figure(image("source/Elliptic/ellipticimage3.png", width: 45.0%),
  caption: [
    Validation and comparison results
  ]
)

Here we have observed an increase in the scattering width with
increasing length of semi major axis. For TE incident wave the relation
become linear at large $k a$ values whereas for TM the variation is
nonlinear.

#figure(image("source/Elliptic/ellipticimage5.png", width: 45.0%),
  caption: [
    Backscattering width variation
  ]
)

Plots of the bistatic $sigma_(2 - D) / lambda$ are computed in Fig. 5
for PMC elliptic cylinder with semi-major radii of
$a = 0.1 lambda \, 0.2 lambda \, 0.4 lambda \,$ and $0.6 lambda$ and
axial ratio 2. Plots of the bistatic $sigma_(2 - D) / lambda$ are
computed in Fig. 5 for PMC elliptic cylinder with semi-major radii of
$a = 0.1 lambda \, 0.2 lambda \, 0.4 lambda \,$ and $0.6 lambda$ and
axial ratio 2.

#figure([#box(image("source/Elliptic/ellipticimage6a.png", width: 45.0%))
  #box(image("source/Elliptic/ellipticimage6b.png", width: 45.0%))

  ],
  caption: [
    Backscattering width variation
  ]
)

For an axially incident TE wave as predicted there is an increase in
scattering width with the size of cylinder and echo width is maximum for
all cylinders at $phi.alt = 0^o$.

Also, for TM wave scattering increases with the size of cylinder but it
is not unidirectional and maximum scattering moves toward lower angles
at large sizes.

2d RCS is plotted for the PMC elliptic cylinder considered in Fig. 3,
when plane wave is incident at $0^o$, $45^o$ and $90^o$ shown in Fig. 6.
Fig. 6(a) is the variation for TE wave, when $phi.alt_i = 0^o$ maximum
scattering occurs at $180^o$, for $phi.alt_i = 45^o$ along with several
side lobes main lobe is present at $240^o$ whereas, maximum scattering
width is observed for $phi.alt_i = 90^o$, in this case two main lobes
are present at $255^o$ and $285^o$. Similarly, for TM wave maximum NBSW
with broader lobes are observed at $phi.alt_i = 90$.

#figure(image("source/Elliptic/ellipticimage7.png", width: 45.0%),
  caption: [
    Axial ratio variations
  ]
)

In Fig. 7 and 8, the variation of the NBSCW is shown with
$phi.alt_i = 0^o$ for PMC elliptic cylinders of semi-major axis length
$lambda \/ 2$, and four different axial ratios, are shown . Due to
symmetry the axis have been cut to $180^o$. For TE case, maximum
scattering occurs for lower axial ratios (AR), peak width of all
patterns is at $phi.alt = 0^o$, and they become broader with AR. When
incident wave is TM, the scattering become more directional with axial
ratio, maximum scattering is observed at $60^o$ when AR increase from 2
to 6 and peak reaches $0^o$ for AR = 1.

#figure(image("source/Elliptic/ellipticimage8.png", width: 45.0%),
  caption: [
    Axial ratio variations
  ]
)

= Conclusions
<conclusions>
This paper gives an insight into the scattering behavior of PMC elliptic
cylinder when illuminated with transverse electric and transverse
magnetic plane waves. The formulation is purely analytic and, in this
way, unique. In earlier work published by different scientists, the
problem is usually handled by the duality principle. The increasing
trend in the synthesis of magnetic materials requires this type of sole
formulation. Bistatic radar cross section is analyzed by varying
incident angle, size and axial ratio of cylinder. These results are
important for validation purpose as most of the real scatterers can be
presented by elliptic cylinders. Furthermore, PMC boundaries and their
interaction with EM field are very important in commercial software and
EM solvers for symmetry purpose. The results presented in the current
paper are therefore more important for comparison purposes by the end
users of the available commercial EM solvers.

#heading(numbering: none)[References]

\[1\] Bowman, J., T. Senior, and P. Uslenghi, Electromagnetic and Acoustic
Scattering by Simple Shapes, Chap. 3, \"The Elliptic
Cylinder,\"129--180, Hemisphere Publishing Corp., New York, NY, revised
printing, 1987.

\[2\] C. A. Balanis, \"Advance Engineering Electromagnetics,\" Wiley, New
York, 1989.

\[3\] Hamid, Abdul-Kadir, and Francis Cooray. \"Scattering by a perfect
electromagnetic conducting elliptic cylinder.\" Progress In
Electromagnetics Research Letters, vol.10, 59-67 2009.

\[4\] Alexopoulos, N. G., G. A. Tadler, and F. W. Schott, \"Scattering from an
elliptic cylinder loaded with an active or passive continuously variable
surface impedance,\" IEEE Trans. Antennas Propag., Vol. 22, No. 1,
132--134, 1974.

\[5\] Ruppin, R., \"Scattering of electromagnetic radiation by a perfect
electromagnetic conductor sphere,\" Journal of Electromagnetic Waves and
Applications, Vol. 20, No. 12, 1569--1576, 2006.

\[6\] Alexopoulos, N., P. L. Uslenghi, and G. Tadler, \"Antenna beam scanning
by active impedance loading,\" IEEE Trans. Antenna Propag., Vol. 22, No.
5, 722--723, 1974.

\[7\] Alexopoulos, N. G. and G. A. Tadler, \"Electromagnetic scattering from
an elliptic cylinder loaded by continuous and discontinuous surface
impedance,\" Journal of Appl. Phys., Vol. 46, 1128--1134, 1975.

\[8\] Naqvi, Q. and S. Ahmed, \"Electromagnetic scattering from a perfect
electromagnetic conductor circular cylinder coated with a metamaterial
having negative permittivity and/or permeability,\" Optics Comm., Vol.
281, No. 23, 5664--5670, 2008.

\[9\] Alexopoulos, N. G., G. A. Tadler, and P. L. E. Uslenghi, \"Scattering
from spheroidal composite objects,\" Journal of Frank. Inst., Vol. 309,
No. 3, 147--162, 1980.

\[10\] Sebak, A. R., \"Scattering from dielectric-coated impedance elliptic
cylinder,\" IEEE Trans. Antennas Propag., Vol. 48, No. 10, 1574--1580,
\2000.

\[11\] Lindell, I. V. and A. H. Sihvola, \"Perfect electromagnetic conductor
(PEMC) in electromagnetics,\" PIERS Proceedings, 119, Hangzhou, China,
Aug. 2005.

\[12\] Andreasen, M. G., \"Scattering from cylinders with arbitrary surface
impedance,\" IEEE Trans. Antennas Propag., Vol. 53, No. 8, 812--817,
\1965.

\[13\] Lindell, I. V. and A. H. Sihvola, \"Perfect electromagnetic conductor,\"
Journal of Electromagnetic Waves and Applications, Vol. 19, No. 7,
861--869, 2005.

\[14\] Sihvola, A., I. V. Lindell, and P. Yl¨a-Oijala, \"Scattering properties
of PEMC (Perfect Electromagnetic Conducting) materials,\" PIERS
Proceedings, 120, Hangzhou, China, Aug. 2005.

\[15\] Y. Du, Y. Luo, W. Z. Yan, and J. A. Kong, , \"An electromagnetic
scattering model For soybean canopy,\" Progress in Electromagnetics
Research, vol. 79, pp. 209-223, 2008.

\[16\] F. T. Ulaby, K. Sarabandi, K. McDonald, M. Whitt, and M. C. Dobson, ,
\"Michigan microwave canopy scattering model,\" International Journal of
Remote Sensing\", vol. 11, pp. 1223-1253, 1990.

\[17\] S. H. Yueh, J. Kong, J. K. Jao, R. T. Shin, and T. Le Toan, ,
\"Branching model for Vegetation,\" Geoscience and Remote Sensing, IEEE
Transactions on, vol. 30, pp. 390- 402, 1992.

\[18\] G. Zhang, L. Tsang, and Z. Chen,, \"Collective scattering effects of
trees generated by stochastic Linden Mayer systems,\" Microwave and
Optical Technology Letters, vol. 11, pp. 107-111, 1996.

\[19\] T. Chiu and K. Sarabandi,, \"Electromagnetic scattering from short
branching Vegetation,\" Geoscience and Remote Sensing, IEEE Transactions
on, vol. 38, pp. 911- 925, 2000.

\[20\] J. Richmond, \"TE-wave scattering by dielectric cylinder of an arbitrary
cross section shape,\" IEEE Trans. Antennas Propagat., vol. 14,
pp.460-464,1966.

\[21\] Lindell, I. V., and A. H. Sihvola, \"Transformation method for problems
involving perfect electromagnetic conductor (PEMC) structures,\" IEEE
Trans. Antennas Propag., Vol. 53, No. 9, 3005--3011, 2005.

\[22\] Ruppin, R., \"Scattering of electromagnetic radiation by a perfect
electromagnetic conductor cylinder,\" Journal of Electromagnetic Waves
and Applications, Vol. 20, No. 13, 1853--1860, 2006.

\[23\] Sihvola, A., P. Yl¨a-Oijala, and I. V. Lindell, \"Bistatic scattering
from a PEMC (perfect electromagnetic conducting) sphere: Surface
integral equation approach,\" Symp. Digest IEEE/ACES Int. Conf. Wireless
Comm. Appl. Comp. Electromagnetics, 317--320, Apr. 2005.

\[24\] Hamid, A.-K. and F. R. Cooray, \"Scattering of electromagnetic waves by
a perfect electromagnetic conducting spheroid,\" IET Proc. Microwaves
Antennas Propag., Vol. 2, No. 7, 686--695, 2008.
