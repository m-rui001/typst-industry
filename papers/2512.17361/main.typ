#set document(title: "Accelerating field decay along nonlocal metasurfaces by suppressing the Norton wave")
#set page(paper: "a4", margin: (x: 24mm, y: 21mm), numbering: "1")
#set text(font: "Libertinus Serif", size: 10.5pt)
#set par(justify: true, leading: .55em)
#set math.equation(numbering: "(1)")
#show figure.caption: set text(size: 9pt)
#align(center)[
  #text(size: 17pt, weight: "bold")[Accelerating field decay along nonlocal metasurfaces by suppressing the Norton wave]
  #v(.6em)
  Alexander Zhuravlev, Dmitry Tatarnikov, Yury Kurenkov, and Stanislav Glybovski
  #v(.4em)
  #text(size: 9pt)[School of Physics and Engineering, ITMO University, St. Petersburg, Russia]
  #linebreak()
  #link("mailto:a.zhuravlev@metalab.ifmo.ru")
]
#v(.5em)
*Abstract.* Studying the nature of electromagnetic fields of dipole sources over a
homogeneous flat ground or impedance surfaces has a long history. In
general, at a long distance $r$ from the source, the near-surface field
is mostly contributed by the geometrical optics term (describing the
radiation pattern), a guided wave, and the higher-order reactive
contribution referred to as the Norton wave. In the special case of a
perfect magnetic conductor interface, the first two terms vanish, so the
residual Norton wave determines the steepest achievable field decay
profile of $med r^(- 3 \/ 2)$ (for a two-dimensional horizontal magnetic
dipole). In this letter, we reveal that in the presence of a nonlocal
metasurface described by the second-order impedance boundary condition,
the field decay can be further accelerated by suppressing the Norton
wave (approaching the profiles $r^(- 5 \/ 2)$ and $r^(- 7 \/ 2)$ for
electric and magnetic fields, respectively). In a proposed practical
realization of a nonlocal metasurface, the effect is numerically
verified and shown to reduce the edge diffraction effects by 10 dB for
the shield diameter of only one wavelength, paving the way toward
compact antenna systems.

#link("supplement.typ")[Supplementary figures]

The electromagnetic field solution for a dipole source above a lossy
dielectric boundary (Sommerfeld's problem) is a classical model of an
antenna operating over the Earth at radio frequencies
#[#link(<bib:zenneck1907fortpflanzung>)[1]]#[#link(<bib:sommerfeld1909ausbreitung>)[2]]#[#link(<bib:norton1936propagation>)[3]]
or a nano-antenna over a plasmonic metal-air interface in the optical
regime #[#link(<bib:lalanne2005theory>)[4]]#[#link(<bib:Nikitin2009>)[5]]. The asymptotics of the exact
solution (in the form of Sommerfeld-like integrals) commonly used in the
literature to analyze the near-surface field behavior at a long distance
$r$ from the source, in general, contains the following contributions:
(i) the geometrical optics (GO) term (related to the radiation pattern)
with a decay profile of $r^(- 1)$ (in a 3D problem) or $r^(- 1 \/ 2)$
(in a 2D problem); (ii) higher-order terms in a power series of
$r^(- 1)$, including the so-called Norton wave decaying as $r^(- 2)$ (in
a 3D problem)~#[#link(<bib:norton1936propagation>)[3]] or $r^(- 3 \/ 2)$ (in a 2D
problem)~#[#link(<bib:Nikitin2009>)[5]], which describe reactive fields; and (iii) the
guided wave typically having the form of a trapped (surface) wave. The
interplay between the above terms substantially defines the near-surface
field profile far from the source.

Metasurfaces (MSs; two-dimensional periodic structures with
subwavelength periodicity) serve as a platform for synthesizing desired
scattered field distributions under the given
excitation~#[#link(<bib:glybovski2016metasurfaces>)[6]]. The local response of
impenetrable (impedance) MSs can be described on the macroscopic level
with a frequency-dependent surface impedance $Z_(upright("s"))$, which
connects the averaged tangential electric $E_(upright("t"))$ and
magnetic $H_(upright("t"))$ fields at the same point on the MS through
the Leontovich boundary condition:
$E_(upright("t")) = Z_(upright("s")) H_(upright("t"))$. The most popular
realizations of such local MSs are the corrugated
#[#link(<bib:kildal1990artificially>)[7]] and mushroom-type~#[#link(<bib:798001>)[8]] surfaces, for which
$\| Z_(upright("s")) \| gt.double eta$ near the resonance, where $eta$
is the characteristic impedance of free space. Such so-called
high-impedance surfaces (HISs) serve as artificial magnetic conductor
(AMC) reflectors for propagating plane waves and simultaneously suppress
any propagating surface waves (the electromagnetic band gap (EBG)
property) #[#link(<bib:798001>)[8]]. For a dipole source above a local MS with arbitrary
$Z_(upright("s"))$, an asymptotic representation of the near-surface
field with the same types of waves as for the lossy dielectric is
valid~#[#link(<bib:wait1957excitation>)[9]].

#figure(image("source/Fig1.pdf"),
  caption: [
    Fields excited by a HMD placed at height $h lt.double lambda$ above
    a (a) PEC; (b) PMC and (c) nonlocal impedance boundary with an
    impedance pole at a grazing angle. The geometry of the 2D problem
    considered is depicted in the inset of (c).
  ]
)
<Fig1:fields>

One limiting case $Z_(upright("s")) = 0$ corresponds to a perfect
electric conductor (PEC) ground plane, for which the GO term dominates
in the asymptotic behavior of a field excited by an in-plane (located at
small height $h$ compared to wavelength $lambda$) horizontal magnetic
dipole (HMD), while no guided wave is supported (see
@Fig1:fields\(a)). In another limit when
$Z_(upright("s")) arrow.r oo$, mimicking the perfect magnetic conductor
(PMC) boundary, the GO term is zero because of the destructive
interference between the HMD and its mirror image, while still no
propagating guided wave is supported. As a result, the main contribution
to the near-surface field is the Norton wave (@Fig1:fields\(b)).
Due to a faster field decay compared to the PEC ground plane
($r^(- 3 \/ 2)$ vs. $r^(- 1 \/ 2)$ for a 2D problem #[#link(<bib:Tatarnikov2005>)[10]]),
HISs near the resonance serve as compact antenna shields with improved
suppression in the shadow domain
#[#link(<bib:Baggen2008>)[11]]#[#link(<bib:Scire-Scappuzzo2009>)[12]]#[#link(<bib:Tatarnikov2011>)[13]] and decoupling structures
#[#link(<bib:Fan2003>)[14]].

For a more general nonlocal MS response, $E_(upright("t"))$ and
$H_(upright("t"))$ at different points are related to each
other~#[#link(<bib:Simovski2018>)[15]]. The nonlocality manifests itself in the spatial
dispersion (SD) of $Z_(upright("s"))$, i.e. its variation with the
incident wave vector #[#link(<bib:Luukkonen2008>)[16]]. Adjusting the law of SD has been
shown to control the angular properties of MS absorbers #[#link(<bib:Zhirihin2017>)[17]],
antenna reflectors #[#link(<bib:Zhuravlev2025>)[18]], and the transmittance of the
anti-reflection coating #[#link(<bib:zhuravlev2025WAR>)[19]]. Although the problem of
dipole excitation of spatially dispersive wire grids #[#link(<bib:Lindell1986>)[20]] and
plasmonic metal boundaries #[#link(<bib:Nikitin2009>)[5]] was solved analytically, to our
knowledge, the possibility of systematically controlling and
accelerating the field decay along the MS has not been studied.

To investigate the near-surface field decay in the presence of
nonlocality, let us consider a 2D problem with an infinite magnetic line
current of complex amplitude $I_0^(upright("m"))$ (a 2D dipole oriented
along the $y$ axis) at height $h lt.double lambda$ above a uniform and
isotropic MS. The latter is located in the $X Y$ plane and is modeled by
a spatially dispersive surface impedance $Z_(upright("s"))$, as shown in
the inset of @Fig1:fields\(c). The source creates a
TM$""_y$-polarized field with only $H_y$, $E_x$, and $E_z$ components
nonzero. The tangential components of the total field $E_t = E_x$,
$H_t = H_y$ (the sums of the incident and reflected fields), observed at
angle $0 lt.eq theta lt.eq 90^degree$ and distance $r$ from the source,
have the following rigorous spectral representations
#[#link(<bib:Felsen1994>)[21]] (Sec.~5):
$ mat(delim: "{", E_x \( theta \); H_y \( theta \)) = C / sqrt(2 pi) integral_P f_({ E_x \, H_y }) \( tau \) e^(- j Omega cos \( tau - theta \)) d tau \, $<eq:ift>
where $tau$ is related to the normalized tangential wave vector
component $gamma = k_x \/ k$ of a spatial spectrum harmonic as
$sin tau = gamma$ (harmonics with $0 lt.eq gamma lt.eq 1$ and
$0^degree lt.eq tau = theta lt.eq 90^degree$ are propagating plane
waves, while harmonics with $gamma > 1$ are evanescent plane waves);
$C = I_0^(upright("m")) k \/ sqrt(2 pi) eta$\; $k$ is the wavenumber of
free space; $Omega = k r$\; $r = sqrt(x^2 + \( z - h \)^2)$\; $P$ is the
contour of integration (depicted in #[#link(<bib:suppmat>)[22]] (Fig.~S.1)); and the
integrated functions are determined by the SD law
$Z_(upright("s")) \( gamma \)$ as:
$ f_(H_y) = frac(- cos tau, Z_(upright("s")) \( sin tau \) \/ eta + cos tau) \; med f_(E_x) = - Z_(upright("s")) \( sin tau \) f_(H_y) . $<eq:ift_func>

A far-field approximation ($Omega gt.double 2 pi$) of (@eq:ift) for a
specific observation angle $tau = theta lt.eq 90^degree$ can be derived
using the steepest descent method #[#link(<bib:Felsen1994>)[21]] (Ch. 4):

#block[
$ mat(delim: "{", E_x \( theta \); H_y \( theta \)) &approx C e^(- j (Omega - pi / 4)) med ( underbrace(mat(delim: "{", f_(E_x) \( theta \); f_(H_y) \( theta \)) 1 / Omega^(1 / 2), upright("GO term")) \ &+ sum_(n = 1)^oo underbrace(j^n f_({ E_x \, H_y })^(\( 2 n \)) \( theta \) frac(\( 2 n - 1 \) ! !, \( 2 n \) !), F_(n \, { E_x \, H_y })) 1 / Omega^(frac(2 n + 1, 2)) ) \ &- underbrace(sum_i mat(delim: "{", E_(x \, i)^(upright("GW")); H_(y \, i)^(upright("GW"))) e^(- j Omega sin tau_i), upright("Guided waves")) \, $<eq:total_ff>

]
where $f^(\( 2 n \)) \( theta \)$ denotes the derivative of $2 n$-th
order with respect to $theta$, while "GW" stands for guided waves.

In (@eq:total_ff) the first term is the GO term, for which functions
(@eq:ift_func) for $0^degree lt.eq tau = theta lt.eq 90^degree$
determine the radiation pattern. The next term ($n = 1$) is the Norton
wave, which together with other higher-order terms ($n gt.eq 2$)
exhibits algebraic dependence on the distance $Omega$. The last sum in
(@eq:total_ff) of terms exponentially dependent on the distance,
resulting from the poles of (@eq:ift_func) with respect to $tau$,
accounts for the contribution of guided waves with excitation amplitudes
$E_(x \, i)^(upright("GW"))$, $H_(y \, i)^(upright("GW"))$. Depending on
the roots $tau_i$ of the characteristic equation, that is, the
denominator of (@eq:ift_func) equals zero, guided waves may be surface
waves (SWs for $sin tau_i in bb(R)$) or leaky waves (LWs for
$sin tau_i in bb(C)$).

Consider the fields near the MS plane. Both $f_(E_x)$ and $f_(H_y)$
vanish at $theta arrow.r 90^degree$ for all SD laws except those that
satisfy condition $Z_(upright("s")) \( 90^degree \) = 0$, so that the
GO term in (@eq:total_ff) becomes zero. However, the contribution of
other asymptotic terms strongly depends on the SD of $Z_(upright("s"))$.
Let us find the specific conditions under which the fields
$E_x \( 90^degree \) \, med H_y \( 90^degree \)$ decay the fastest
with $Omega$. Obviously, no SWs should be supported by the MS, while the
Norton wave and LWs should be minimized or canceled.

#figure(image("source/Fig2.pdf", width: 100.0%),
  caption: [
    Analytical study of fields excited by a 2D HMD on a nonlocal MS with
    a surface impedance of (@eq:aprox) with $B = 1$ (Norton wave
    suppressed) depending on $A$ and $X \/ eta$: (a) normalized
    excitation coefficient level $\| F_(2 \, E_x) \| eta \/ C$ of the
    term decaying as $E_x tilde.op Omega^(- 5 \/ 2)$\; (b) normalized
    excitation coefficient level
    $\| E_(x \, 0)^(upright("GW")) \| eta \/ C$ of a SW/LW; (c)
    exponential decay factor $Im \( tau_0 \)$ of the LW (SW propagation
    regions are uniformly yellow); normalized levels of the tangential
    electric (d) and magnetic (e) field (solid lines) calculated with
    (@eq:ift) vs. distance from the source $x \/ lambda$ compared with
    their dominating asymptotic expansion terms from (@eq:total_ff); (f)
    radiation pattern shape. The case with the set of parameters
    $B = 1$, $A = - 3.5$, $X \/ eta = 3.5$, chosen for the practical
    implementation, is indicated with cross markers in (a--c) and with
    red lines in (d--f). The local high-impedance case is shown in
    (d--f) with blue curves. Markers in (d) show the results of
    full-wave numerical confirmation for the practical MS
    implementation.
  ]
)
<Fig2:all_theory>

Following #[#link(<bib:rahmeier2022zero>)[23]]#[#link(<bib:dugan2024surface>)[24]]#[#link(<bib:Zhuravlev2025>)[18]], we assume
the MS to be lossless and represent its purely imaginary impedance
$Z_(upright("s")) \( gamma \)$ as a rational function, for which a
second-order Padé approximation with one zero and one pole is
#[#link(<bib:Zhuravlev2025>)[]]:
$ Z_(upright("s")) \( gamma \) = j X frac(1 - sum_(n = 1)^oo A_n gamma^(2 n), 1 - sum_(m = 1)^oo B_m gamma^(2 m)) approx j X frac(1 - A gamma^2, 1 - B gamma^2) \, $<eq:aprox>
where $A eq.not 1$, $X eq.not 0$ (to keep the GO term zero) and
$B eq.not A$ (to keep the nontrivial SD law) are real coefficients of
the second-order impedance boundary condition. Note that with
$A = B = 0$ the value of $Z_(upright("s"))$ becomes constant with
$gamma$ (hereafter referred to as a #emph[local] case). As seen from
(@eq:total_ff), the electric and magnetic field amplitudes of the Norton
wave $F_(1 \, { E_x \, H_y })$ (the term with $n = 1$) are proportional
to the second-order derivatives of $f_(E_x)$ and $f_(H_y)$,
respectively, at $theta = 90^degree$. Taking into account (@eq:aprox)
the derivatives can be expressed as:
$ f''_(H_y) = - frac(2 eta^2, X^2) frac(\( B - 1 \)^2, \( A - 1 \)^2) \; med f''_(E_x) = frac(2 j eta^2, X) frac(\( B - 1 \), \( A - 1 \)) . $<eq:2derivative>
Both expressions (@eq:2derivative) show that the Norton wave cancels
with the choice $B = 1$ (a pole of the impedance is set at the grazing
angle $theta = 90^degree$). In this case, the next nonzero
contributions in (@eq:total_ff) are $E_x tilde.op Omega^(- 5 \/ 2)$ and
$H_y tilde.op Omega^(- 7 \/ 2)$, as well as of a single guided wave
(with a complex propagation factor of $tau_0$ satisfying the
characteristic equation). As noted in #[#link(<bib:Zhuravlev2025>)[18]], $F_(0 \, H_y)$
determines the radiation pattern, which for $B = 1$ is proportional to
$cos^3 theta$, as follows from #link(<eq:ift_func>)[\[eq:ift\_func\]]
and #link(<eq:aprox>)[\[eq:aprox\]]. For comparison, the radiation
pattern for the PMC is proportional only to $cos theta$. This means that
the Norton wave suppression is expected to be accompanied by the
radiation pattern narrowing. The corresponding excitation coefficients
$F_(2 \, E_x)$, $F_(3 \, H_y)$, $E_(x \, 0)^(upright("GW"))$, and
$H_(y \, 0)^(upright("GW"))$ as well as propagation factor $tau_0$ can
be analytically calculated using the formulas from the Supplemental
Material #[#link(<bib:suppmat>)[22]] (Eq. (S.1)-(S.5)).

The analytically calculated levels of $F_(2 \, E_x)$ (for the
contribution $E_x tilde.op Omega^(- 5 \/ 2)$), as well as the excitation
coefficient $E_(x \, 0)^(upright("GW"))$ and the decay factor
$Im \( tau_0 \)$ of the GW, are shown in @Fig2:all_theory\(a--c) in
the case $B = 1$ (Norton wave suppressed) for different $A$ and
$X \/ eta$. As follows from @Fig2:all_theory\(a), by simultaneously
increasing both $\| A \|$ and $\| X \|$, one can decrease the
contribution $E_x tilde.op Omega^(- 5 \/ 2)$ to the overall tangential
electric field profile. On the other hand, for some combinations of $A$
and $X$, a propagating surface wave may appear (see the yellow regions
in @Fig2:all_theory\(c) that must be avoided). For other
combinations of $A$ and $X$, the guided wave becomes an LW with
$Im \( tau_0 \)$ strongly dependent on both $A$ and $X$. Although for
$X < 0$ and $A > 0$ the LW has a relatively small amplitude, it has the
slowest decay. Therefore, to accelerate the overall decay along the MS,
it is preferable to select larger positive $X$ together with negative
$A$.

The contributions of the asymptotic term with
$E_x tilde.op Omega^(- 5 \/ 2)$ (solid gray curves) and LW (dashed gray
curves) for different negative values of $A$ are plotted versus distance
$x \/ lambda$ along the MS in @Fig2:all_theory\(d). For the
particular case $A = - 3.5$, the asymptotic profiles are shown with
black curves, while the total tangential electric field profile
calculated using (@eq:ift) is shown with the solid red curve. It is
clearly seen that at small distances ($x \/ lambda < 1.5$) the field
decay is mainly determined by the LW, while at large distances
($x \/ lambda > 3$) it strictly follows the
$E_x tilde.op Omega^(- 5 \/ 2)$ profile. In the middle range of
distances, an interference of different wave contributions can be
observed. A similar conclusion on the dominance of the term
$H_y tilde.op Omega^(- 7 \/ 2)$ or LW depending on the distance can be
drawn for the magnetic field profile shown in @Fig2:all_theory\(e).
For comparison, the profiles of electric and magnetic fields excited by
the same source calculated using (@eq:ift) are presented on the same
plots for the local high-impedance MS with $X \/ eta = - 3.5$ along with
asymptotic terms #[#link(<bib:suppmat>)[22]] (Eq. (S.6)-(S.7)). Note that in this case,
guided waves cannot be excited by the TM-polarized source due to
capacitive impedance #[#link(<bib:TretyakovAMAE>)[25]] (Par. 6.4.5), hence the field
profiles precisely follow the contribution of the Norton wave
($E_x tilde.op Omega^(- 3 \/ 2)$). This comparison shows that for
$x \/ lambda > 2$, despite some LW excitation, the field levels on the
nonlocal MS with $B = 1$ remain drastically lower than for the local MS,
which can be explained by the Norton wave suppression. Furthermore,
@Fig2:all_theory\(f) confirms that the Norton wave suppression on
nonlocal MSs is associated with a significantly narrower beam
(especially for larger $\| A \|$) pointed in the normal direction.

To confirm the analytical predictions of the field decay acceleration,
we numerically compare the excitation of two practical periodic
structures implementing local and nonlocal MSs with the same period
$d = lambda \/ 10 = 3$~mm at a frequency of $f = 10$~GHz and the same
thickness $h = 6.2$~mm. The local MS is implemented as a corrugated
surface #[#link(<bib:kildal1990artificially>)[7]]#[#link(<bib:Scire-Scappuzzo2009>)[12]] with
dielectric-filled ($epsilon_(upright("r")) = 1.6$) PEC grooves (see
@Fig3:CST_results\(a)). The nonlocal MS is implemented as a
modification of the HIS formed by vertical metal pins of height $h$
#[#link(<bib:Silveirinha2008>)[26]]#[#link(<bib:Maslovski2010>)[27]]#[#link(<bib:Kaipa2011>)[28]], where the pins with a diameter
of $2 r = 0.1$~mm are connected to the ground plane through lumped loads
$Z = j omega L$ with inductance $L$, and vertical PEC walls with a
height of $v lt.eq h$ and a thickness of 18~$mu$m are placed between the
adjacent pins.

$Z_(upright("s"))$ as a function of $gamma$ is parametrically calculated
in CST Studio Suite for both types of meta-atoms using periodic boundary
conditions. The numerical results are shown in
@Fig3:CST_results\(b) with markers being in good agreement with the
analytical results obtained with (@eq:aprox). At 10~GHz (above the
quarter-wave resonance), the local MS (see the blue curve and markers)
exhibits a high and $gamma$-independent capacitive impedance
$X \/ eta approx - 3.5$ #[#link(<bib:Collin1990>)[29]] (Par. 11.4). In contrast, for the
nonlocal MS, the family of gray curves corresponding to
$- 3.5 lt.eq A lt.eq - 0.5$ for fixed $B = 1$, $X \/ eta = 3.5$ exhibits
a common pole at $gamma = 1$. This individual variation of $A$ can be
achieved in the proposed structure by adjusting $v$ and $L$
simultaneously. Details of the impedance extraction method and the
correspondence obtained between $v \, L$ and $A$ are given in the
Supplemental Material #[#link(<bib:suppmat>)[22]] (Sec. 2). In particular, the case with
$A approx - 3.5$ corresponds to $v = h = 6.2$~mm and $L = 0.63$~nH (see
the red curve in @Fig3:CST_results\(b)).

#figure(image("source/Fig3.pdf", width: 100.0%),
  caption: [
    Comparison of practical implementations of the local and nonlocal
    MSs: (a) meta-atoms of the local corrugated HIS (left) and the
    proposed nonlocal MS (right); (b) numerically extracted (markers)
    and analytically calculated (solid lines)
    $Z_(upright("s")) \( gamma \)$\; (c) analytically estimated
    $upright("DU") \( 90^degree \)$ for $X \/ eta = 3.5$, $B = 1$, and
    different practically implementable negative values of $A$ (see
    #[#link(<bib:suppmat>)[22]] (Tab. S.1)); (d) full-wave numerically calculated
    $upright("DU") \( phi.alt \)$ for $D = lambda$.
  ]
)
<Fig3:CST_results>

To further verify the analytically predicted field decay acceleration,
we compared the numerically calculated electric field profiles of the
latter nonlocal MS (with $A = - 3.5$) with the local one. With this aim,
in CST Studio Suite (full-wave simulation with Frequency Domain Solver),
we introduced a 2D HMD implemented as an internally fed open-ended
parallel-plate waveguide with thickness $w = 0.18$~mm embedded in the
center of the structure with finite size $D$ (diameter along the $x$
axis). This finite 1D row containing $N$ meta-atoms is assumed to be
periodically repeated in the $y$ direction. For both MSs, the open end
is located in the top plane of the structure. To ensure the validity of
the averaged boundary conditions, several closest meta-atoms at
distances smaller than one period $d$ from the source are removed, as
schematically depicted in the inset of @Fig3:CST_results\(d). The
full-wave numerical results (markers) for $D = 12 lambda$ and $N = 118$
are compared with the analytical calculations (solid red and blue
curves) in @Fig2:all_theory\(a) showing good agreement. Note that
at distances from the source $x \/ lambda > 2$, the electric field
decays by more than 70~dB, so that the expected decay profile
$E_x tilde.op Omega^(- 5 \/ 2)$ cannot be confirmed for the practical
structure due to the insufficient accuracy of numerical calculations
(mainly caused by the effects of radiation boundaries). However, even at
smaller distances the advantage in field decay along the nonlocal MS of
more than 25~dB is clearly reached compared to the local case.

One possible application of the observed effect is mitigating edge
diffraction, which typically limits the shielding action of finite-sized
antenna reflectors. To evaluate the role of SD, let us compare the same
two structures as above, but for different diameters $D$. The shielding
action can be quantified based on the far-field pattern using the
so-called down-to-up ratio:
$upright("DU") \( phi.alt \) = H_y^(upright("ff")) \( - phi.alt \) \/ H_y^(upright("ff")) \( phi.alt \)$,
where $H_y^(upright("ff"))$ denotes the magnetic field in the far-field
region; $phi.alt = pi \/ 2 - theta$. As shown in the Supplemental
Material #[#link(<bib:suppmat>)[22]] (Sec. 3), $upright("DU") \( 90^degree \)$ can be
analytically estimated using the physical optics approach. While the
magnetic field in the zenith ($theta = 0^degree$) is determined by
$f_(H_y) \( 0^degree \)$, the field in the nadir
($theta = 180^degree$) can be approximated by the sum of two edge
diffraction waves. The amplitude of both waves is proportional to the
integral of the magnetic surface current density that would be induced
by the HMD at an infinite MS (over the range of distances
$D \/ 2 lt.eq \| x \| < oo$, where the finite structure of diameter $D$
is absent). For the nonlocal MS with $X \/ eta gt.double 1$ and $B = 1$
(the Norton wave suppressed), one can write:
$ upright("DU")^(upright("NL")) \( 90^degree \) med upright("[dB]") approx 16.61 - 20 lg \( 1 - A \) - 50 lg k D . $<eq:DU_nonlocal>
A similar expression for the local HIS (with negative
$Im \( Z_(upright("s")) \)$ and $\| X \| \/ eta gt.double 1$), for which
the Norton wave dominates at large distances, reads #[#link(<bib:Tatarnikov2005>)[]]:
$ upright("DU")^(upright("L")) \( 90^degree \) med upright("[dB]") approx 1.05 - 30 lg k D . $<eq:DU_local>

The analytical estimates for the local and nonlocal MSs (for different
negative $A$) are plotted in @Fig3:CST_results\(c) versus $D$. As
can be seen, the DU ratio in the nonlocal case with $A = - 3.5$ can be
reduced to -35~dB for a diameter of only one wavelength, which is by
$approx 14$~dB better than for the local HIS of the same size. Full-wave
numerical simulations of local and nonlocal practical structures with
$D = lambda$ ($N = 8$) result in the $upright("DU") \( phi.alt \)$
curves shown in @Fig3:CST_results\(d). An improvement of 10~dB can
be observed at $phi.alt = 90^degree$. A 4~dB deviation from the
analytical estimation is due to the accuracy of the physical optics
approximation and due to neglecting the contribution of the LW in the
analytical estimation of the DU. Compared with a cardioid-shaped
radiation pattern of a classical Huygens' source, both the local and
nonlocal compact reflectors provide a steeper radiation pattern's
roll-off near the horizon ($phi.alt = 0^degree$), which is a benefit in
another important metric of shielding action.

The results obtained clearly demonstrate the possibility of accelerating
field decay along nonlocal MSs with second-order SD. Once the surface
impedance has a pole at grazing angles, the contribution of the Norton
wave in the asymptotic near-surface field expansion is suppressed.
Although the contribution of the LW remains dominant near the HMD, the
next nonzero higher-order term with profiles of
$E_x tilde.op Omega^(- 5 \/ 2)$ and $H_y tilde.op Omega^(- 7 \/ 2)$
remains dominant at large distances from the source. This decay
acceleration in comparison to a local HIS (with the Norton wave
prescribing the decay profile of $E_x tilde.op Omega^(- 3 \/ 2)$) is
possible to achieve with the proposed practical periodic structure of
inductively-loaded pins separated with metal walls, which is found to
exhibit the required specific law of SD. Excitation of the proposed
nonlocal MS as a wavelength-size reflector is associated with edge
diffraction reduced by 10~dB compared to a state-of-the-art local MS
reflector of the same size. The investigated properties of nonlocal MSs,
therefore, pave the way for efficient miniaturized shields and isolating
structures that overcome the properties of conventional widely used
corrugated surfaces.

#emph[Acknowledgment] --- This work was supported by the Russian Science
Foundation (Project No. 25-19-00712,
https:\/\/rscf.ru/en/project/25-19-00712/).

= References

#block[\[1\] J.~Zenneck,~ Über die fortpflanzung ebener elektromagnetischer wellen
längs einer ebenen leiterfläche und ihre beziehung zur drahtlosen
telegraphie,~ Ann. Phys.~ #strong[328],~ 846 ( 1907).] <bib:zenneck1907fortpflanzung>

#block[\[2\] A.~Sommerfeld,~ Über die ausbreitung der wellen in der drahtlosen
telegraphie,~ Ann. Phys.~ #strong[333],~ 665 ( 1909).] <bib:sommerfeld1909ausbreitung>

#block[\[3\] K.~A.~Norton,~ The propagation of radio waves over the surface of the
earth and in the upper atmosphere,~ Proceedings of the institute of
Radio Engineers~ #strong[24],~ 1367 ( 1936).] <bib:norton1936propagation>

#block[\[4\] P.~Lalanne, J.~Hugonin,~and~ J.~Rodier,~ Theory of surface plasmon
generation at nanoslit apertures,~ Phys. Rev. Lett.~ #strong[95],~
263902 ( 2005).] <bib:lalanne2005theory>

#block[\[5\] A.~Y.~Nikitin, S.~G.~Rodrigo, F.~J.~García-Vidal,~and~
L.~Martín-Moreno,~ In the diffraction shadow: Norton waves versus
surface plasmon polaritons in the optical region,~‘ \
12‘\$12‘&12‘\#12‘1̂2‘\_12‘%12 New J. Phys.~ #strong[11],~ 123020 (
2009).] <bib:Nikitin2009>

#block[\[6\] S.~B.~Glybovski, S.~A.~Tretyakov, P.~A.~Belov, Y.~S.~Kivshar,~and~
C.~R.~Simovski,~ Metasurfaces: From microwaves to visible,~ Phys. Rep.~
#strong[634],~ 1 ( 2016).] <bib:glybovski2016metasurfaces>

#block[\[7\] P.-S.~Kildal #emph[et~al.],~ Artificially soft and hard surfaces in
electromagnetics,~ IEEE Trans. Antennas Propag.~ #strong[38],~ 1537 (
1990).] <bib:kildal1990artificially>

#block[\[8\] D.~Sievenpiper, L.~Zhang, R.~Broas, N.~Alexopolous,~and~
E.~Yablonovitch,~ High-impedance electromagnetic surfaces with a
forbidden frequency band,~‘ \
12‘\$12‘&12‘\#12‘1̂2‘\_12‘%12 IEEE Trans. Microw. Theory Tech.~
#strong[47],~ 2059 ( 1999).] <bib:798001>

#block[\[9\] J.~R.~Wait,~ Excitation of surface waves on conducting, stratified,
dielectric-clad, and corrugated surfaces,~ J. Res. Natl. Bur. Stand.~
#strong[59],~ 365 ( 1957).] <bib:wait1957excitation>

#block[\[10\] D.~Tatarnikov, V.~Filippov, I.~Soutiaguine, A.~Astahov,
A.~Stepanenko,~and~ P.~Shamatulsky,~ Multipath mitigation by
conventional antennas with ground planes and passive vertical
structures,~‘ \
12‘\$12‘&12‘\#12‘1̂2‘\_12‘%12 GPS Solut.~ #strong[9],~ 194--201 (
2005).] <bib:Tatarnikov2005>

#block[\[11\] R.~Baggen, M.~Martinez-Vazquez, J.~Leiss, S.~Holzwarth,
L.~S.~Drioli,~and~ P.~de~Maagt,~ Low profile GALILEO antenna using EBG
technology,~ IEEE Trans. Antennas Propag.~ #strong[56] (
2008).] <bib:Baggen2008>

#block[\[12\] F.~Scire-Scappuzzo~and~ S.~N.~Makarov,~ A low-multipath wideband GPS
antenna with cutoff or non-cutoff corrugated ground plane,~‘ \
12‘\$12‘&12‘\#12‘1̂2‘\_12‘%12 IEEE Trans. Antennas Propag.~ #strong[57],~
33 ( 2009).] <bib:Scire-Scappuzzo2009>

#block[\[13\] D.~Tatarnikov, A.~Astakhov,~and~ A.~Stepanenko,~ Broadband convex
impedance ground planes for multi-system GNSS reference station
antennas,~‘ \
12‘\$12‘&12‘\#12‘1̂2‘\_12‘%12 GPS Solut.~ #strong[15],~ 101 (
2011).] <bib:Tatarnikov2011>

#block[\[14\] F.~Yang~and~ Y.~Rahmat-Samii,~ Microstrip antennas integrated with
electromagnetic band-gap (EBG) structures: a low mutual coupling design
for array applications,~‘ \
12‘\$12‘&12‘\#12‘1̂2‘\_12‘%12 IEEE Trans. Antennas Propag.~ #strong[51],~
2936 ( 2003).] <bib:Fan2003>

#block[\[15\] K.~Simovski,~‘ \
12‘\$12‘&12‘\#12‘1̂2‘\_12‘%12 #emph[Composite Media with Weak Spatial
Dispersion]~( Jenny Stanford Publishing,~ 2018).] <bib:Simovski2018>

#block[\[16\] O.~Luukkonen, C.~Simovski, G.~Granet, G.~Goussetis, D.~Lioubtchenko,
A.~V.~Raisanen,~and~ S.~A.~Tretyakov,~ Simple and accurate analytical
model of planar grids and high-impedance surfaces comprising metal
strips or patches,~‘ \
12‘\$12‘&12‘\#12‘1̂2‘\_12‘%12 IEEE Trans. Antennas Propag.~ #strong[56],~
1624 ( 2008).] <bib:Luukkonen2008>

#block[\[17\] D.~Zhirihin, C.~Simovski, P.~Belov,~and~ S.~Glybovski,~ Mushroom
high-impedance metasurfaces for perfect absorption at two angles of
incidence,~ IEEE Antennas and Wireless Propagation Letters~
#strong[16],~ 2626 ( 2017).] <bib:Zhirihin2017>

#block[\[18\] A.~Zhuravlev, Y.~Kurenkov, X.~Wang, F.~Dushko, V.~Zalipaev,~and~
S.~Glybovski,~ Radiation-pattern synthesis with uniform nonlocal
metasurfaces,~‘ \
12‘\$12‘&12‘\#12‘1̂2‘\_12‘%12 Phys. Rev. Appl.~ #strong[23],~ 044052 (
2025a).] <bib:Zhuravlev2025>

#block[\[19\] A.~Zhuravlev, S.~Kuznetsov, D.~Kiselkina, A.~Shaham, A.~Epstein,~and~
S.~Glybovski,~‘ \
12‘\$12‘&12‘\#12‘1̂2‘\_12‘%12 Wide-angle reflection suppression of
dielectric slabs using nonlocal metasurface coatings ( 2025b),~‘ \
12‘\$12‘&12‘\#12‘1̂2‘\_12‘%12arXiv:2507.11989 \[physics.optics\]
.] <bib:zhuravlev2025WAR>

#block[\[20\] I.~V.~Lindell, V.~P.~Akimov,~and~ E.~Alanen,~ Image theory for dipole
excitation of fields above and below a wire grid with square cells,~‘ \
12‘\$12‘&12‘\#12‘1̂2‘\_12‘%12 IEEE Trans. Electromagn. Compat.~
#strong[28],~ 107 ( 1986).] <bib:Lindell1986>

#block[\[21\] L.~B.~Felsen~and~ N.~Marcuvitz,~‘ \
12‘\$12‘&12‘\#12‘1̂2‘\_12‘%12 #emph[Radiation and Scattering of Waves]~(
Wiley,~ Hoboken, NJ, USA,~ 1994).] <bib:Felsen1994>

#block[\[22\] See supplemental material at \[url will be inserted by publisher\] for
terms from the far-field approximation of the field, characteristic
equation, parametric study of spatial dispersion in the periodic
structure of inductively-loaded pins separated with metal walls, and
down-to-up ratio estimation with the physical optics approach (see also
references \[16\], \[21\], and \[25\] therein).] <bib:suppmat>

#block[\[23\] J.~G.~N.~Rahmeier, T.~J.~Smy, J.~Dugan,~and~ S.~Gupta,~ Zero thickness
surface susceptibilities and extended GSTCs---Part I: Spatially
dispersive metasurfaces,~ IEEE Trans. Antennas Propag.~ #strong[71],~
5909 ( 2022).] <bib:rahmeier2022zero>

#block[\[24\] J.~Dugan, T.~J.~Smy, F.~Monticone,~and~ S.~Gupta,~ Surface
susceptibility synthesis of spatially dispersive metasurfaces for space
compression and spatial signal processing,~ IEEE Trans. Antennas
Propag.~ #strong[72],~ 6572 ( 2024).] <bib:dugan2024surface>

#block[\[25\] S.~Tretyakov,~ #emph[Analytical Modeling in Applied Electromagnetics]~(
Artech,~ 2003).] <bib:TretyakovAMAE>

#block[\[26\] M.~G.~Silveirinha, C.~A.~Fernandes,~and~ J.~R.~Costa,~ Electromagnetic
characterization of textured surfaces formed by metallic pins,~‘ \
12‘\$12‘&12‘\#12‘1̂2‘\_12‘%12 IEEE Trans. Antennas Propag.~ #strong[56],~
405 ( 2008).] <bib:Silveirinha2008>

#block[\[27\] S.~Maslovski, T.~Morgado, M.~Silveirinha, C.~S.~R.~Kaipa,~and~
A.~Yakovlev,~ Generalized additional boundary conditions for wire
media,~‘ \
12‘\$12‘&12‘\#12‘1̂2‘\_12‘%12 New J. Phys.~ #strong[12],~ 113047 (
2010).] <bib:Maslovski2010>

#block[\[28\] C.~S.~R.~Kaipa, A.~B.~Yakovlev, S.~I.~Maslovski,~and~
M.~G.~Silveirinha,~ Mushroom-type high-impedance surface with loaded
vias: Homogenization model and ultra-thin design,~ IEEE Antennas Wirel.
Propag. Lett.~ #strong[10],~ 1503 ( 2011).] <bib:Kaipa2011>

#block[\[29\] R.~E.~Collin,~ #emph[Field Theory of Guided Waves],~IEEE/OUP series on
electromagnetic wave theory~( IEEE Press,~ 1990).] <bib:Collin1990>
