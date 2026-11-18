// Typst format conversion of arXiv:2512.06651v1 under CC BY 4.0.
#set page(paper: "a4", margin: 19mm, numbering: "1")
#set text(font: "Libertinus Serif", size: 10pt)
#set par(justify: true)
#set heading(numbering: "1.1")
#set math.equation(numbering: "(1)")
#align(center)[
  #text(size: 16pt, weight: "bold")[A Capacitor Model of the Helical Deflector: Revisiting Shamaev’s Proposal and the Model in the Book]
  #v(4pt)
  Hayk L. Gevorgyan

  Experimental Physics Division and Quantum Technologies Division, Alikhanyan National Laboratory
  (Yerevan Physics Institute), 2 Alikhanyan Brothers St., 0036 Yerevan, Armenia

  #link("mailto:hayk.gevorgyan@aanl.am")
]
#heading(numbering: none)[Abstract]
A RF helical deflector#footnote[Note that this is not a final version,
and the manuscript should be carefully reviewed before submission to any
journal.] is a type of electron and ion optics device that applies a
time-dependent rotating transverse electric or magnetic field by means
of time-dependent RF voltage applied on two opposite conducting helical
structures (wires, ribbons or other) to deflect charged particles (a
single, bunch or beam) in a circular or spiral path. It is a perspective
direct timing system being concurrent for reaching picosecond time
resolution, and have promise being excellent candidate for high
precision time-of-flight detection. As a timing system, it converts the
temporal structure of an electron beam into a spatial pattern ---
particularly, an ellipse in the case of a single-frequency RF voltage
and continuous electron beam.

I propose a #emph[capacitor model] of a RF helical deflector and compare
it with the existing #emph[model in the Book], interpret it and provide
understanding of it. Furthermore, I analyze the latter finding
analytical formulas for the applied electric field, for ellipse sizes
(semi-axes) and rotation angle, lengths of the ellipse line
corresponding to the duration of electron bunches or beams. The present
article touches the topic of getting circle on resonance limit and the
deflection sensitivity.

= Introduction
<Sec:intro>
Atomic clocks #link(<ref:MajorBook>)[\[1\]], despite being the most stable long-term time
references, don't directly operate at picosecond resolution, when RF
helical deflectors are. Furthermore, there is a huge difference --- RF
helical deflectors don't "tell time" in the same way as a clock --- they
don't have absolute sub-picosecond timing like a clock, but they can
resolve relative timing on the picosecond scale, measuring the relative
arrival time of a charged particle within a picosecond time window
#link(<ref:Gevorgian2015>)[\[2\]].

From the other hand the most renowned direct timing systems are streak
cameras, Time-to-Digital Converters (TDCs), RF deflectors, and frequency
combs. Streak cameras measure ultrafast photon arrival times from
optical, UV, X-ray, or sometimes visible light regions, by means of
photocathode, electrostatic deflection plates with a time-varying fast
ramp voltage and photoelectron detector. TDCs measure electronic pulse
arrival times by digitizing time intervals: combining the coarse
timestamp from the fast digital counter driven by a high-frequency
electronic clock and the fine timing offset from the delay
line/interpolator. In frequency combs, being "rulers in time", the event
arrival time is measured with respect to known time markers, e.g.,
phase-coherent comb pulses, phase-locked to a stable RF or microwave
clock, which itself can be referenced to an atomic clock.

From the perspective of time-of-flight (TOF) detection in electron
optics, both streak cameras, RF deflectors, and electrostatic or
magnetic TOF systems have important role. All these systems have one in
common --- they use deflection mechanisms and can stand as mass
spectrometers (limited to electrons in streak cameras), since the TOF of
a charged particle depend on it's velocity and mass-to-charge ratio.
Deflection mechanisms are electrostatic field in electrostatic TOFs,
static magnetic field in magnetic TOFs, electrostatic deflection plates
in streak cameras, and RF oscillating electric field in RF deflectors.
Two common types of RF deflectors are linear RF deflectors and RF
helical deflectors. In the former, two parallel or cylindrical
#link(<ref:Ibach1991>)[\[3\]] electrodes are used to generate an oscillating transverse
electric field which is standing in space and linearly polarized,
producing a linear deflection in a fixed transverse direction. In the
latter, a helically wound electrode (wire or ribbon) creates a traveling
and rotating transverse RF field along the beam axis, resulting in a
non-uniform helical deflection of the charged particles. In the present
article, I show that the helical/circular polarization attributed to
this rotating field in #emph[the model in the Book] #link(<ref:ZhigarevBook>)[\[4\]] is
only a rough approximation and has a limited validity range.

Metallic helical structure systems are multifunctional being used both
as helical undulators #link(<ref:Varfolomeev1980>)[\[5\]], helical waveguides
#link(<ref:Unger1958>)[\[6\]]#link(<ref:Chu1958>)[\[7\]]#link(<ref:Menachem2011>)[\[8\]], helical resonators
#link(<ref:Nandi2022>)[\[9\]]#link(<ref:Deng2014>)[\[10\]]#link(<ref:Dyussembayev2022>)[\[11\]], helical antennas
#link(<ref:DalarssonThesis2015>)[\[12\]], helical deflectors #link(<ref:Gevorgian2015>)[\[2\]]#link(<ref:Chernousov2000>)[\[13\]],
etc. Helical slow-wave structures are widely used as effective broadband
transmission lines #link(<ref:Basu1996>)[\[14\]]#link(<ref:Basu1979>)[\[15\]]#link(<ref:Rowe1965>)[\[16\]]#link(<ref:Carter2018>)[\[17\]], helical
resonators #link(<ref:Corum2001>)[\[18\]]#link(<ref:Martines2021>)[\[19\]], helical conductors #link(<ref:Sensiper1951>)[\[20\]].

The present article is devoted to the theoretical framework and
applications of an RF helical deflector as a timing system, a
time-of-flight detector for charged particles, and a mass spectrometer.

The paper is organized as follows. In Sec.~@sec:theorymodel, I provide a
#emph[capacitor model] of the helical deflector and explain #emph[the
model in the Book]. Sec.~@sec:ellipse provides theoretical framework and
method for measuring deflection transverse velocities and coordinates,
ellipse sizes, it's rotation angle. Sec.~@Sec:Limit analyzes the limit
$omega arrow.r omega_c$, the deflection characteristics, and their
comparison in three cases: 1) TOF measured at a screen immediately after
the deflector, 2) TOF between the deflector and a screen, assuming that
the charged particle leaves the deflector exactly from the axis, 3)
total TOF, valid under the paraxial approximation inside the deflector.
Here, #emph[screen] refers to any target intercepted by the charged
particles, representing a detector --- for example, a multichannel
plate. Secs.~@Sec:getcircle,~@Sec:pencilbeam,~@Sec:DS provide
information on the problem of getting circle, the case of #emph[on and
off] pencil beam, the deflection sensitivity measures. Finally,
Sec.~@Sec:concl represents comments and conclusions.

= A Capacitor Model
<sec:theorymodel>
In 1961, Yu. M. Shamaev proposed a self-unfolding deflection system for
the oscillographic observation of UHF (ultrahigh frequency) processes,
representing a section of two-wire line wound into a spiral
#link(<ref:ZhigarevBook>)[\[4\]] (see Fig.~@fig:deflectorpic).

#figure([#figure(
    align(center)[#table(
      columns: 1,
      align: (right,),
      [#box(image("source/deflectorpic.png"))],
    )]
    , kind: table
    )

  ],
  caption: [
    Self-unfolding deflection system (helical deflector of charged
    particles).
  ]
)
<fig:deflectorpic>

== Deflector field
<deflector-field>
Equation of helix is
$ x = R cos phi \, quad y = R sin phi \, quad z = R kappa phi = frac(lambda, 2 pi) phi \, $<helicalline>
where $lambda = l \/ n$ is a winding pitch of an helix (a solenoidal
electrode) --- the axial distance between the two ends of a single turn
in a helical winding, where $l$ is the axial distance between the ends
of helix, $n$ is the number of turns and can be fractional,
$kappa = cot psi = lambda \/ \( 2 pi R \)$, $psi$ is a winding pitch
angle. When $phi$ increases by $2 pi$, $z$ increases by $lambda$ or
$2 pi R cot psi$, where $R$ is the radius of helix and $psi$ is the
angle of unfolded helix between directions of it's axis and linear
progression. Note that the length of the helix is
$L = l \/ cos psi = n sqrt(lambda^2 + \( 2 pi R \)^2)$.

The components of the radius vector $bold(r)$ and of the infinitesimal
element of length $d bold(s)$ are
$ r_x & = x_0 - x = x_0 - R cos phi \, quad d s_x = d x = - R sin phi d phi \,\
r_y & = y_0 - y = y_0 - R sin phi \, quad thin thin d s_y = d y = R cos phi d phi \,\
r_z & = z_0 - z = z_0 - R kappa phi \, quad quad thin thin thin d s_z = d z = R kappa d phi \, $<radvec>

Using Coulomb's law and assuming that the charge density, arising from a
capacitor's negative charge distribution, is uniform
$d q \( t \) = - rho \( t \) d s$, the electric field $bold(E) \( t \)$
at a point can be expressed as:
$ bold(E) \( t \) = - integral frac(rho \( t \) bold(r), 4 pi epsilon.alt_0 r^3) thin d s \, $<Ethelicalline>
where $rho \( t \)$ is the time-dependent linear charge density,
$bold(r)$ is the position vector from the charge element to the
observation point, $r = \| bold(r) \|$ is its magnitude, $d s$
represents an infinitesimal element of length, and $epsilon.alt_0$ is
the permittivity of free space.
Eqs.~#link(<helicalline>)[\[helicalline\]],~#link(<radvec>)[\[radvec\]],~#link(<Ethelicalline>)[\[Ethelicalline\]]
can be viewed as a #emph[helical line approximation],.

Under the paraxial approximation $x_0 approx y_0 approx 0$, the
expressions for radius vector
$bold(r) = r_x bold(e)_x + r_y bold(e)_y + r_z bold(e)_z$, radius
$r = sqrt(r_x^2 + r_y^2 + r_z^2) = sqrt(R^2 + \( z_0 - R phi kappa \)^2)$
and length element
$d s = sqrt(d s_x^2 + d s_y^2 + d s_z^2) = R sqrt(1 + kappa^2) d phi$
from Forms.~#link(<radvec>)[\[radvec\]], the electric field vector can
be written
$ bold(E) \( t \) = integral_(phi_1)^(phi_2) Q \( t \) \/ R mat(delim: "{", cos phi; sin phi; kappa phi - z_0 \/ R) frac(d phi, #scale(x: 120%, y: 120%)[\(] 1 + #scale(x: 120%, y: 120%)[\(] z_0 \/ R - kappa phi #scale(x: 120%, y: 120%)[\)]^2 #scale(x: 120%, y: 120%)[\)]^(3 \/ 2)) $<electricfield>

Note that in the non-paraxial theory, the
expression~#link(<electricfield>)[\[electricfield\]] for the electric
field vector changes to
$ bold(E) \( t \) = integral_(phi_1)^(phi_2) Q \( t \) \/ R mat(delim: "{", cos phi - x_0 \/ R; sin phi - y_0 \/ R; kappa phi - z_0 \/ R) frac(d phi, S \( x_0 \, y_0 \, z_0 \, phi \)) \,\
S \( x_0 \, y_0 \, z_0 \, phi \) = #scale(x: 120%, y: 120%)[\(] #scale(x: 120%, y: 120%)[\(] x_0 / R - cos phi #scale(x: 120%, y: 120%)[\)]^2 + #scale(x: 120%, y: 120%)[\(] y_0 / R - sin phi #scale(x: 120%, y: 120%)[\)]^2 +\
+ #scale(x: 120%, y: 120%)[\(] z_0 / R - kappa phi #scale(x: 120%, y: 120%)[\)]^2 #scale(x: 120%, y: 120%)[\)]^(3 \/ 2) . $<electricfieldnonparax>

Since the applied voltage $U \( t \) = U_0 sin \( omega t + phi.alt \)$
is periodic with a frequency $omega$ and a phase $phi.alt$, the linear
charge density is also time-tependent given by the same law
$rho \( t \) = rho_0 sin \( omega t + phi.alt \)$, hence,
$Q \( t \) = Q_0 sin \( omega t + phi.alt \)$, where
$Q_0 = 2 rho_0 sqrt(1 + kappa^2) \/ \( 4 pi epsilon.alt_0 \)$, where
factor of $2$ is taken into account since two helical electrodes create
electric field which is twice the electric field generated in a single
electrode with capacitance equivalent to linear charge density
$rho \( t \)$, and
$bold(E) \( t \) = tilde(bold(E)) \( z_0 \) sin \( omega t + phi.alt \)$,
where the formula #link(<electricfield>)[\[electricfield\]] is the same
for $accent(bold(E) \( z_0 \), ̃)$ but $Q_0$ is taken instead of
$Q \( t \)$, and we named $tilde(bold(E)) \( z_0 \)$ as phasor electric
field or phasor with analogy to electromagnetism and optics.

The linear charge density $rho_0$ and capacitance density (per unit
length) $C$ of a two-wire line are given by
$ rho_0 = C U_0 \, quad C = frac(pi epsilon.alt_0 epsilon.alt_d, ln frac(d - b, b)) \, $<rho0helicalline>
where $d = 2 R$ is the center-to-center distance between the wires, $b$
is the radius of a single wire, $epsilon.alt_0$ is the permittivity of
free space (vacuum), $epsilon.alt_d$ is the relative permittivity of the
dielectric between wires.
Eqs.~#link(<electricfield>)[\[electricfield\]],~#link(<electricfieldnonparax>)[\[electricfieldnonparax\]],~#link(<rho0helicalline>)[\[rho0helicalline\]]
are valid in a #emph[helical line approximation], i.e., when
$b lt.double d$.

== Equations of motion
<equations-of-motion>
The equations of motion, using relativistic Lorentz force formula,
follows
$ frac(d bold(v), d t) = - frac(e, m gamma) #scale(x: 120%, y: 120%)[\(] bold(E) \( t \) + bold(v) times bold(B) \( t \) #scale(x: 120%, y: 120%)[\)] \, $<eqmotiongen>
where $m$ is mass, $e$ is absolute charge,
$gamma = 1 \/ sqrt(1 + v^2 \/ c^2)$ is Lorentz factor,
$v = sqrt(v_x^2 + v_y^2 + v_z^2)$ is velocity of an electron;
$bold(E) \( t \)$ and $bold(B) \( t \)$ are applied electric and
magnetic fields.

The paraxial approximation, which describes the motion of an electron
near its beam axis, assumes that the longitudinal velocity, aligned with
the beam axis, is relativistic (approaching the speed of light), while
the transverse velocities remain significantly smaller in comparison.
Assuming the zero initial transverse velocities
$v_x \( 0 \) approx v_y \( 0 \) approx 0$ and the paraxial approximation
$Delta v_x approx Delta v_y approx Delta v_z lt.double v_z$, one gets
$ dot(v)_x & approx - frac(e, m gamma) #scale(x: 120%, y: 120%)[\(] E_x \( t \) - v_z B_y \( t \) #scale(x: 120%, y: 120%)[\)] \,\
dot(v)_y & approx - frac(e, m gamma) #scale(x: 120%, y: 120%)[\(] E_y \( t \) + v_z B_x \( t \) #scale(x: 120%, y: 120%)[\)] \,\
dot(v)_z & approx 0 \, $<eqmotion> where
$gamma approx 1 \/ sqrt(1 + v_z^2 \/ c^2)$. In more detail, in
Eq.~#link(<eqmotion>)[\[eqmotion\]] used the fact that, since, the field
components are of the same order
$E_x \( t \) approx E_y \( t \) approx E_z \( t \)$ (and
$B_x \( t \) approx B_y \( t \) approx B_z \( t \)$), the velocity
changes also will be of the same order and much smaller than the
longitudinal velocity $v_z approx v_z \( 0 \) = upright("const")$. Since
a change of the longitudinal component is much smaller compared too it's
initial value, the main cause of a change in the case of electric field
$E_z \( t \)$ can be neglected (a #emph[low longitudinal field] or, more
precisely, #emph[negligibly small fractional longitudinal velocity
change assumption]: $Delta v_z \/ v_z \( 0 \) approx 0$).

== #emph[The model in the Book] understanding
<the-model-in-the-book-understanding>
Since $z_0 = v_z t$, where $v_z = c o n s t$, the phasor's transverse
components in the paraxial approximation
#link(<electricfield>)[\[electricfield\]] can be presented as
$ tilde(E)_x \( z_0 \) = tilde(E)_perp \( z_0 \) cos #scale(x: 120%, y: 120%)[\(] tilde(omega)_c \( t \) t #scale(x: 120%, y: 120%)[\)] \,\
tilde(E)_y \( z_0 \) = tilde(E)_perp \( z_0 \) sin #scale(x: 120%, y: 120%)[\(] tilde(omega)_c \( t \) t #scale(x: 120%, y: 120%)[\)] \, $<theorytomodel>
where
$tilde(E)_perp \( z_0 \) = sqrt(tilde(E)_x^2 \( z_0 \) + tilde(E)_y^2 \( z_0 \))$
is the magnitude of transverse phasor or just transverse phasor field,
which depends on the electron's $z$ coordinate in axis of helix and is
rotating,
$tilde(omega)_c \( t \) = arctan \( tilde(E)_y \( t \) \/ tilde(E)_x \( t \) \) \/ t$
is time-dependent natural frequency of the system or the frequency of
rotation of the field. Thus, the field is frequency- and
amplitude-modulated circularly polarized#footnote[Also can be called
#emph[helically polarized] due to the field's trajectory when electron
is passing through the helical deflector.], since the frequency is
time-dependent (frequency-modulated): $omega_c \( t \)$ and the
magnitude is space-dependent (amplitude-modulated):
$tilde(E)_perp \( z_0 \)$.

Shamaev claimed that the equations of motion inside the helical
deflector can be effectively described as
$ dot(v)_x & approx - frac(e, m gamma) tilde(E)_perp cos #scale(x: 120%, y: 120%)[\(] omega_c t #scale(x: 120%, y: 120%)[\)] sin \( omega t + phi.alt \) theta \( tau - t \) theta \( t \) \,\
dot(v)_y & approx - frac(e, m gamma) tilde(E)_perp sin #scale(x: 120%, y: 120%)[\(] omega_c t #scale(x: 120%, y: 120%)[\)] sin \( omega t + phi.alt \) theta \( tau - t \) theta \( t \) \,\
dot(v)_z & approx 0 \, $<eqmotionShamaev>

Due to our theory and description of the electric field as
#link(<theorytomodel>)[\[theorytomodel\]], we understand the Shamaev's
model as following. The transverse phasor field is considered with
constant magnitude $tilde(E)_perp$ and constant frequency
$omega_c = frac(2 pi v_z, lambda_c)$ (natural frequency of a system),
hence is simply circularly polarized. In that case, the equations of
motion #link(<eqmotion>)[\[eqmotion\]] can be solved analytically. In
the next section sine $sin x$ and cosine $cos x$ functions are denoted
as $s_x$ and $c_x$, where $x$ is an argument.

For large values of $kappa$ (in our case, already for
$kappa gt.eq 6 \/ pi$ or $lambda \/ R gt.eq 12$, see
Figs.~#ref(label("FIG:n=1_kappa=6@pi"))
and~#ref(label("FIG:n=15_kappa=6@pi"))), the Shamaev model provides a
valid approximation. However, the final and approximated values of the
field parameters were not specified in his original formulation. We
claim that
$ tilde(E)_perp \( t \) approx tilde(E)_perp \( t = tau \/ 2 \) \,\
tilde(omega)_c \( t \) approx omega_c \, $<theoryapprox> where
$tau \/ 2$ represents the central value of the temporal range, which is
truncated ($\[ 0 \, tau \]$) using the Heaviside step functions
$theta \( x \)$. The endpoint
$tau = frac(R kappa \( phi_2 - phi_1 \), v_z)$ is derived from the
condition $Delta z = R kappa Delta phi$. The use of Heaviside truncation
in the Shamaev model is natural, as it defines the temporal bounds of
the field.

#figure([#figure([#box(image("source/Ep_n=1_kappa=6-pi.svg"))
    #label("fig:Ep_n=1_kappa=6@pi")

    ],
    caption: [
    ]
  )
  #label("fig:Ep_n=1_kappa=6@pi")

  #figure([#box(image("source/cos_n=1_kappa=6-pi.svg"))
    #label("fig:cos_n=1_kappa=6@pi")

    ],
    caption: [
    ]
  )
  #label("fig:cos_n=1_kappa=6@pi")

  #figure([#box(image("source/sin_n=1_kappa=6-pi.svg"))
    #label("fig:sin_n=1_kappa=6@pi")

    ],
    caption: [
    ]
  )
  #label("fig:sin_n=1_kappa=6@pi")

  #figure([#box(image("source/Ex_n=1_kappa=6-pi.svg"))
    #label("fig:Ex_n=1_kappa=6@pi")

    ],
    caption: [
    ]
  )
  #label("fig:Ex_n=1_kappa=6@pi")

  #figure([#box(image("source/Ey_n=1_kappa=6-pi.svg"))
    #label("fig:Ey_n=1_kappa=6@pi")

    ],
    caption: [
    ]
  )
  #label("fig:Ey_n=1_kappa=6@pi")

  ],
  caption: [
    Theory \[paraxial approximation\] (red) and Shamaev approximation
    (black) for the case $kappa = 6 \/ pi$ and $n = 1$ (see
    @Table:parameters).
  ]
)
#label("FIG:n=1_kappa=6@pi")

= Deflector's ellipse sizes on a screen
<sec:ellipse>
== Theory case
<subsec:theory>
Integration of equations of motion #link(<eqmotion>)[\[eqmotion\]] for
our theory gives velocities and coordinates in the transverse plane
$ v_x & = A'_1 c_phi.alt + B'_1 s_phi.alt \,\
v_y & = A'_2 c_phi.alt + B'_2 s_phi.alt \,\
x & = a_1 c_phi.alt + b_1 s_phi.alt \,\
y & = a_2 c_phi.alt + b_2 s_phi.alt \,\
A'_1 & = - frac(e, m gamma) integral_0^tau tilde(E)_x \( t \) s_(omega t) thin d t \,\
B'_1 & = - frac(e, m gamma) integral_0^tau tilde(E)_x \( t \) c_(omega t) thin d t \,\
A'_2 & = - frac(e, m gamma) integral_0^tau tilde(E)_y \( t \) s_(omega t) thin d t \,\
B'_2 & = - frac(e, m gamma) integral_0^tau tilde(E)_y \( t \) c_(omega t) thin d t \,\
a_1 & = - frac(e, m gamma) integral_0^tau integral_0^(tau') tilde(E)_x \( t \) s_(omega t) thin d t thin d tau' \,\
b_1 & = - frac(e, m gamma) integral_0^tau integral_0^(tau') tilde(E)_x \( t \) c_(omega t) thin d t thin d tau' \,\
a_2 & = - frac(e, m gamma) integral_0^tau integral_0^(tau') tilde(E)_y \( t \) s_(omega t) thin d t thin d tau' \,\
b_2 & = - frac(e, m gamma) integral_0^tau integral_0^(tau') tilde(E)_y \( t \) c_(omega t) thin d t thin d tau' . $<integration>
The coordinates
$X \( tau_D \, tau \) =^Delta x \( tau \) + X' \( tau_D \, tau \)$ and
$Y \( tau_D \, tau \) =^Delta y \( tau \) + Y' \( tau_D \, tau \)$ of an
electron on the screen, where
$X' \( tau_D \, tau \) = v_x \( tau \) tau_D$ and
$Y' \( tau_D \, tau \) = v_y \( tau \) tau_D$, will be
$ X = A_1 c_phi.alt + B_1 s_phi.alt \,\
Y = A_2 c_phi.alt + B_2 s_phi.alt \,\
A_1 = a_1 + A'_1 tau_D \,\
B_1 = b_1 + B'_1 tau_D \,\
A_2 = a_2 + A'_2 tau_D \,\
B_2 = b_2 + B'_2 tau_D \,\
 $

#figure([#figure([#box(image("source/Ep_n=15_kappa=6-pi.svg"))
    #label("fig:Ep_n=15_kappa=6@pi")

    ],
    caption: [
    ]
  )
  #label("fig:Ep_n=15_kappa=6@pi")

  #figure([#box(image("source/cos_n=15_kappa=6-pi.svg"))
    #label("fig:cos_n=15_kappa=6@pi")

    ],
    caption: [
    ]
  )
  #label("fig:cos_n=15_kappa=6@pi")

  #figure([#box(image("source/sin_n=15_kappa=6-pi.svg"))
    #label("fig:sin_n=15_kappa=6@pi")

    ],
    caption: [
    ]
  )
  #label("fig:sin_n=15_kappa=6@pi")

  #figure([#box(image("source/Ex_n=15_kappa=6-pi.svg"))
    #label("fig:Ex_n=15_kappa=6@pi")

    ],
    caption: [
    ]
  )
  #label("fig:Ex_n=15_kappa=6@pi")

  #figure([#box(image("source/Ey_n=15_kappa=6-pi.svg"))
    #label("fig:Ey_n=15_kappa=6@pi")

    ],
    caption: [
    ]
  )
  #label("fig:Ey_n=15_kappa=6@pi")

  ],
  caption: [
    Theory \[paraxial approximation\] (red) and Shamaev approximation
    (black) for the case $kappa = 6 \/ pi$ (see @Table:parameters)
    but $n = 15$ ($l = 15 times 60$ mm = $90$ cm).
  ]
)
#label("FIG:n=15_kappa=6@pi")

Let's rewrite the equations for coordinates from
#link(<integration>)[\[integration\]] in the form of a single equation
of conic sections $ a X^2 + b X Y + c Y^2 - 1 = 0 \,\
a = alpha / A_1^2 + beta / B_1^2 \, thin b = - 2 #scale(x: 120%, y: 120%)[\(] frac(alpha, A_1 A_2) + frac(beta, B_1 B_2) #scale(x: 120%, y: 120%)[\)] \, thin c = alpha / A_2^2 + beta / B_2^2 \,\
alpha = frac(1, #scale(x: 120%, y: 120%)[\(] B_1 / A_1 - B_2 / A_2 #scale(x: 120%, y: 120%)[\)]^2) \, quad beta = frac(1, #scale(x: 120%, y: 120%)[\(] A_1 / B_1 - A_2 / B_2 #scale(x: 120%, y: 120%)[\)]^2) . $

After doing rotation of the coordinate frame
$ mat(delim: "[", X; Y) = mat(delim: "[", c_theta, - s_theta; s_theta, c_theta) mat(delim: "[", x'; y') \, $
one can find equation $a' \( x' \)^2 + c' \( y' \)^2 = 1$ corresponding
to the equation of the ellipse in rotated coordinates. Modifying the
equation to the standard one
$frac(\( x' \)^2, chi^2) + frac(\( y' \)^2, 𝜘^2) = 1$, one can simply
find the rotation angle $theta$ and the sizes $chi$ and $𝜘$ for rotated
ellipse
$ chi & = sqrt(frac(2, \( a - c \) c_(2 theta) + b s_(2 theta) + a + c)) \,\
𝜘 & = sqrt(frac(2, \( c - a \) c_(2 theta) - b s_(2 theta) + a + c)) \,\
chi - 𝜘 & = 4 frac(\( a - c \) c_(2 theta) + b s_(2 theta), \( chi + 𝜘 \) \( a'_0 + b'_0 c_(4 theta) + c'_0 s_(4 theta) \)) \,\
s_(2 theta) & = b / sqrt(\( a - c \)^2 + b^2) \,\
c_(2 theta) & = frac(a - c, sqrt(\( a - c \)^2 + b^2)) \,\
a'_0 & = a^2 - b^2 + c^2 + 6 a c \,\
b'_0 & = b^2 - a^2 - c^2 + 2 a c \,\
c'_0 & = b c - a b \,\
theta & = 1 / 2 arctan #scale(x: 120%, y: 120%)[\(] frac(b, a - c) #scale(x: 120%, y: 120%)[\)] \, quad theta in #scale(x: 120%, y: 120%)[\(] - pi / 2 \, pi / 2 #scale(x: 120%, y: 120%)[\)] . $

Since $theta$ is an rotation angle, which is necessary to map rotated
plane to unrotated one, i.e., after the rotation of the rotated ellipse
by this angle we get unrotated ellipse, the rotation angle of the
rotated ellipse is actually $- theta$, because the computational
coordinate system is $\( x' \, y' \)$.

Length of the ellipse line from the initial phase $phi.alt_1$ to the
final $phi.alt_2$ is
$ s & = integral_(X \( phi.alt_1 \))^(X \( phi.alt_2 \)) sqrt(1 + #scale(x: 120%, y: 120%)[\(] frac(d Y, d X) #scale(x: 120%, y: 120%)[\)]^2) d x =\
 & = integral_(phi.alt_1)^(phi.alt_2) sqrt(#scale(x: 120%, y: 120%)[\(] frac(d r \( phi.alt \), d phi.alt) #scale(x: 120%, y: 120%)[\)]^2 + #scale(x: 120%, y: 120%)[\(] r \( phi.alt \) #scale(x: 120%, y: 120%)[\)]^2) d phi.alt =\
 & = integral_(phi.alt_1)^(phi.alt_2) sqrt(#scale(x: 120%, y: 120%)[\(] frac(d X, d phi.alt) #scale(x: 120%, y: 120%)[\)]^2 + #scale(x: 120%, y: 120%)[\(] frac(d Y, d phi.alt) #scale(x: 120%, y: 120%)[\)]^2) d phi.alt =\
 & = integral_(phi.alt_1)^(phi.alt_2) sqrt(A_0 + B_0 c_(2 phi.alt) - C_0 s_(2 phi.alt)) d phi.alt =\
 & = integral_(phi.alt_1)^(phi.alt_2) sqrt(A_0 - D_0 s_(2 phi.alt - alpha_0)) d phi.alt \,\
 $<lengthinellipse> where
$A_0 = #scale(x: 120%, y: 120%)[\(] A_1^2 + A_2^2 + B_1^2 + B_2^2 #scale(x: 120%, y: 120%)[\)] \/ 2$,
$B_0 = #scale(x: 120%, y: 120%)[\(] B_1^2 + B_2^2 - A_1^2 - A_2^2 #scale(x: 120%, y: 120%)[\)] \/ 2$,
$C_0 = A_1 B_1 + A_2 B_2$, $D_0 = sqrt(B_0^2 + C_0^2)$,
$alpha_0 = arctan \( B_0 \/ C_0 \)$.

== Shamaev model case
<shamaev-model-case>
Integration of equations of motion
#link(<eqmotionShamaev>)[\[eqmotionShamaev\]] for the Shamaev's model
gives velocities and coordinates in the transverse plane
$ v_x \( tau \) & = 1 / 2 A \( tilde(E)_perp \) #scale(x: 120%, y: 120%)[\(] frac(c_phi.alt, omega - omega_c) + frac(c_phi.alt, omega + omega_c) -\
 & - frac(c_(phi.alt + tau \( omega - omega_c \)), omega - omega_c) - frac(c_(phi.alt + tau \( omega + omega_c \)), omega + omega_c) #scale(x: 120%, y: 120%)[\)]\
v_y \( tau \) & = 1 / 2 A \( tilde(E)_perp \) #scale(x: 120%, y: 120%)[\(] - frac(s_phi.alt, omega - omega_c) + frac(s_phi.alt, omega + omega_c) +\
 & + frac(s_(phi.alt + tau \( omega - omega_c \)), omega - omega_c) - frac(s_(phi.alt + tau \( omega + omega_c \)), omega + omega_c) #scale(x: 120%, y: 120%)[\)]\
x \( tau \) & = 1 / 2 A \( tilde(E)_perp \) #scale(x: 120%, y: 120%)[\(] frac(tau c_phi.alt, omega - omega_c) + frac(tau c_phi.alt, omega + omega_c) +\
 & + frac(s_phi.alt, \( omega - omega_c \)^2) + frac(s_phi.alt, \( omega + omega_c \)^2) -\
 & - frac(s_(phi.alt + tau \( omega - omega_c \)), \( omega - omega_c \)^2) - frac(s_(phi.alt + tau \( omega + omega_c \)), \( omega + omega_c \)^2) #scale(x: 120%, y: 120%)[\)]\
y \( tau \) & = 1 / 2 A \( tilde(E)_perp \) #scale(x: 120%, y: 120%)[\(] - frac(tau s_phi.alt, omega - omega_c) + frac(tau s_phi.alt, omega + omega_c) +\
 & + frac(c_phi.alt, \( omega - omega_c \)^2) - frac(c_phi.alt, \( omega + omega_c \)^2) -\
 & - frac(c_(phi.alt + tau \( omega - omega_c \)), \( omega - omega_c \)^2) + frac(c_(phi.alt + tau \( omega + omega_c \)), \( omega + omega_c \)^2) #scale(x: 120%, y: 120%)[\)] \, $<2>
where $A \( tilde(E)_perp \) = - frac(e, m gamma) tilde(E)_perp$ and
$tau$ is TOF of an electron inside the deflector.

Transverse coordinates on the screen follow as

#block[
$ X \( phi.alt \) & = A_1 c_phi.alt + B_1 s_phi.alt \,\
Y \( phi.alt \) & = A_2 c_phi.alt + B_2 s_phi.alt \,\
A_1 = 1 / 2 frac(A \( tilde(E)_perp \), \( omega^2 - omega_c^2 \)^2) & #scale(x: 120%, y: 120%)[\(] C_0^(A_1) + C_(+)^(A_1) c_(tau \( omega + omega_c \)) + S_(+)^(A_1) s_(tau \( omega + omega_c \)) + C_(-)^(A_1) c_(tau \( omega - omega_c \)) + S_(-)^(A_1) s_(tau \( omega - omega_c \)) #scale(x: 120%, y: 120%)[\)] \,\
C_0^(A_1) & = 2 \( tau + tau_D \) omega \( omega^2 - omega_c^2 \) \,\
C_(+)^(A_1) & = - tau_D \( omega - omega_c \)^2 \( omega + omega_c \) \,\
S_(+)^(A_1) & = - \( omega - omega_c \)^2 \,\
C_(-)^(A_1) & = - tau_D \( omega - omega_c \) \( omega + omega_c \)^2 \,\
S_(-)^(A_1) & = - \( omega + omega_c \)^2 \,\
B_1 = 1 / 2 frac(A \( tilde(E)_perp \), \( omega^2 - omega_c^2 \)^2) & #scale(x: 120%, y: 120%)[\(] C_0^(B_1) + C_(+)^(B_1) c_(tau \( omega + omega_c \)) + S_(+)^(B_1) s_(tau \( omega + omega_c \)) + C_(-)^(B_1) c_(tau \( omega - omega_c \)) + S_(-)^(B_1) s_(tau \( omega - omega_c \)) #scale(x: 120%, y: 120%)[\)] \,\
C_0^(B_1) & = 2 \( omega^2 + omega_c^2 \) \,\
C_(+)^(B_1) & = - \( omega - omega_c \)^2 \,\
S_(+)^(B_1) & = tau_D \( omega - omega_c \)^2 \( omega + omega_c \) \,\
C_(-)^(B_1) & = - \( omega + omega_c \)^2 \,\
S_(-)^(B_1) & = tau_D \( omega - omega_c \) \( omega + omega_c \)^2 \,\
A_2 = 1 / 2 frac(A \( tilde(E)_perp \), \( omega^2 - omega_c^2 \)^2) & #scale(x: 120%, y: 120%)[\(] C_0^(A_2) + C_(+)^(A_2) c_(tau \( omega + omega_c \)) + S_(+)^(A_2) s_(tau \( omega + omega_c \)) + C_(-)^(A_2) c_(tau \( omega - omega_c \)) + S_(-)^(A_2) s_(tau \( omega - omega_c \)) #scale(x: 120%, y: 120%)[\)] \,\
C_0^(A_2) & = 4 omega omega_c \,\
C_(+)^(A_2) & = \( omega - omega_c \)^2 \,\
S_(+)^(A_2) & = - tau_D \( omega - omega_c \)^2 \( omega + omega_c \) \,\
C_(-)^(A_2) & = - \( omega + omega_c \)^2 \,\
S_(-)^(A_2) & = tau_D \( omega - omega_c \) \( omega + omega_c \)^2 \,\
B_2 = 1 / 2 frac(A \( tilde(E)_perp \), \( omega^2 - omega_c^2 \)^2) & #scale(x: 120%, y: 120%)[\(] C_0^(B_2) + C_(+)^(B_2) c_(tau \( omega + omega_c \)) + S_(+)^(B_2) s_(tau \( omega + omega_c \)) + C_(-)^(B_2) c_(tau \( omega - omega_c \)) + S_(-)^(B_2) s_(tau \( omega - omega_c \)) #scale(x: 120%, y: 120%)[\)] \,\
C_0^(B_2) & = - 2 \( tau + tau_D \) omega_c \( omega^2 - omega_c^2 \) \,\
C_(+)^(B_2) & = - tau_D \( omega - omega_c \)^2 \( omega + omega_c \) \,\
S_(+)^(B_2) & = - \( omega - omega_c \)^2 \,\
C_(-)^(B_2) & = tau_D \( omega - omega_c \) \( omega + omega_c \)^2 \,\
S_(-)^(B_2) & = \( omega + omega_c \)^2 \, $

]
where $tau_D$ is TOF of an electron outside the deflector, between the
deflector and the screen.

#block[
$ v_x \( phi.alt \) & = A'_1 c_phi.alt + B'_1 s_phi.alt \,\
v_y \( phi.alt \) & = A'_2 c_phi.alt + B'_2 s_phi.alt \,\
A'_1 = 1 / 2 frac(A \( tilde(E)_perp \), \( omega^2 - omega_c^2 \)) & #scale(x: 120%, y: 120%)[\(] F_0 - F_(-) c_(tau \( omega + omega_c \)) - F_(+) c_(tau \( omega - omega_c \)) #scale(x: 120%, y: 120%)[\)] \,\
B'_1 = 1 / 2 frac(A \( tilde(E)_perp \), \( omega^2 - omega_c^2 \)) & #scale(x: 120%, y: 120%)[\(] F_(-) s_(tau \( omega + omega_c \)) + F_(+) s_(tau \( omega - omega_c \)) #scale(x: 120%, y: 120%)[\)] \,\
A'_2 = 1 / 2 frac(A \( tilde(E)_perp \), \( omega^2 - omega_c^2 \)) & #scale(x: 120%, y: 120%)[\(] - F_(-) s_(tau \( omega + omega_c \)) + F_(+) s_(tau \( omega - omega_c \)) #scale(x: 120%, y: 120%)[\)] \,\
B'_2 = 1 / 2 frac(A \( tilde(E)_perp \), \( omega^2 - omega_c^2 \)) & #scale(x: 120%, y: 120%)[\(] - F_c - F_(-) c_(tau \( omega + omega_c \)) + F_(+) c_(tau \( omega - omega_c \)) #scale(x: 120%, y: 120%)[\)] \,\
F_0 & = 2 omega \,\
F_c & = 2 omega_c \,\
F_(-) & = omega - omega_c \,\
F_(+) & = omega + omega_c \, $

]
= Limit
<Sec:Limit>
For the calculation of the deflection amplitudes and the rotation angle
on the resonance $omega arrow.r omega_c$, the following notation will be
used $ a_c = 2 tau omega_c = 4 pi n \,\
a_D = 2 tau_D omega_c = 4 pi n_D \, $ where the deflector parameter
$n = l / lambda$ is the number of turns of a helix, $n_D = L / lambda$
is the number of #emph[phantom] turns of a helix imagined between the
end of the deflector and the screen.

== TOF in a deflector
<Subsec:TOFdef>
In the limit
$omega arrow.r omega_c arrow.r.double { x arrow.r x_c \, y arrow.r y_c }$
$ x_c = a_(1 c) c_phi.alt + b_(1 c) s_phi.alt \,\
y_c = a_(2 c) c_phi.alt + b_(2 c) s_phi.alt \,\
a_(1 c) = b_(2 c) = frac(A \( tilde(E)_perp \), 8 omega_c^2) #scale(x: 120%, y: 120%)[\(] a_c - sin a_c #scale(x: 120%, y: 120%)[\)] \,\
a_(2 c) = frac(A \( tilde(E)_perp \), 8 omega_c^2) #scale(x: 120%, y: 120%)[\(] a_c^2 / 2 + 1 - cos a_c #scale(x: 120%, y: 120%)[\)] \,\
b_(1 c) = frac(A \( tilde(E)_perp \), 8 omega_c^2) #scale(x: 120%, y: 120%)[\(] a_c^2 / 2 - \( 1 - cos a_c \) #scale(x: 120%, y: 120%)[\)] . $

The sizes of the small ellipse are the following
$ tilde(chi)_c = frac(lr(|A \( tilde(E)_perp \)|), 16 omega_c^2) #scale(x: 120%, y: 120%)[\(] a_c^2 - 2 sqrt(g \( a_c \)) #scale(x: 120%, y: 120%)[\)] = frac(l^2 lr(|A \( tilde(E)_perp \)|), v_z^2) tilde(G)_1 \( n \) \,\
tilde(𝜘)_c = frac(lr(|A \( tilde(E)_perp \)|), 16 omega_c^2) #scale(x: 120%, y: 120%)[\(] a_c^2 + 2 sqrt(g \( a_c \)) #scale(x: 120%, y: 120%)[\)] = frac(l^2 lr(|A \( tilde(E)_perp \)|), v_z^2) tilde(G)_2 \( n \) \,\
tilde(G)_1 \( n \) = 1 / 4 #scale(x: 120%, y: 120%)[\(] 1 - frac(sqrt(g \( n \)), 8 pi^2 n^2) #scale(x: 120%, y: 120%)[\)] \,\
tilde(G)_2 \( n \) = 1 / 4 #scale(x: 120%, y: 120%)[\(] 1 + frac(sqrt(g \( n \)), 8 pi^2 n^2) #scale(x: 120%, y: 120%)[\)] \,\
g \( a_c \) = 2 + a_c^2 - 2 cos a_c - 2 a_c sin a_c \,\
g \( n \) = 2 + 16 pi^2 n^2 - 2 cos \( 4 pi n \) - 8 pi n sin \( 4 pi n \) \, $
where $a_c^2 - 2 sqrt(g \( a_c \)) gt.eq 0$, since the function
$h \( a_c \) = a_c^4 - 4 g \( a_c \) gt.eq 0$, which can be proved by
the change of the variable $u = a_c \/ 2$ and the study of it's behavior
$h \( u \) = 16 #scale(x: 120%, y: 120%)[\(] u^4 - \( u - sin u cos u \)^2 - sin^4 u #scale(x: 120%, y: 120%)[\)] gt.eq 0$.

#figure([#figure(
    align(center)[#table(
      columns: 1,
      align: (right,),
      [#box(image("source/G1G2ntilde.svg"))],
    )]
    , kind: table
    )

  ],
  caption: [
    $tilde(G)_1 \( n \)$ and $tilde(G)_2 \( n \)$ profile dependences on
    the number of turns $n$ (the small ellipse).
  ]
)
<fig:G1G2ntilde>

$tilde(G)_1 \( n \)$ and $tilde(G)_2 \( n \)$ profiles from the number
of turns are monotonically increasing and decreasing functions (see
Fig.~@fig:G1G2ntilde), respectively:

- for tiny number of turns, $tilde(G)_1 \( n \)$ profile has its minimum
  and $tilde(G)_2 \( n \)$ its maximum:
  $ tilde(G)_(1 \, upright("min")) \( n \) = lim_(n arrow.r 0) tilde(G)_1 \( n \) = 0 \,\
  tilde(G)_(2 \, upright("max")) \( n \) = lim_(n arrow.r 0) tilde(G)_2 \( n \) = 1 / 2 \, $

- when for large number of turns they get closer
  ($tilde(G)_(1 \, upright("max")) \( n \) = tilde(G)_(2 \, upright("max")) \( n \) = 1 \/ 4$):
  $ tilde(G)_(1 \, upright("max")) \( n \) = lim_(n arrow.r oo) tilde(G)_1 \( n \) = 1 / 4 \,\
  tilde(G)_(2 \, upright("min")) \( n \) = lim_(n arrow.r oo) tilde(G)_2 \( n \) = 1 / 4 \, $
  and that case corresponds to the case when the ellipse gets closer to
  the circle $tilde(chi)_c arrow.r tilde(𝜘)_c$ with a radius:
  $ tilde(r)_c = frac(l^2 lr(|A \( tilde(E)_perp \)|), 4 v_z^2) . $

The #emph[paraxial approximation] holds when $tilde(𝜘)_c lt.double R$
($sqrt(x^2 \( phi.alt \) + y^2 \( phi.alt \)) lt.double d \/ 2$):
$ frac(e tilde(E)_perp, m gamma) l^2 / v_z^2 tilde(G)_2 \( n \) lt.double R \,\
 $<paraxial> therefore, the Shamaev model and consequences (derived
formulas) are true only when #link(<paraxial>)[\[paraxial\]] holds. So,
to get a circle, experimentalists must simultaneously ensure that
approximations in Sec.~@sec:theorymodel, condition
#link(<paraxial>)[\[paraxial\]], largeness of $n$, and Shamaev
conditions.

From the validity of the Shamaev approximation ($lambda \/ R gt.eq 12$)
and the paraxial approximation #link(<paraxial>)[\[paraxial\]], one gets
the following two competitive conditions
$ 12 l n lt.eq l^2 / R lt.double frac(v_z^2, tilde(G)_2 \( n \)) frac(m gamma, e tilde(E)_perp) . $

#figure([#figure(
    align(center)[#table(
      columns: 1,
      align: (right,),
      [#box(image("source/thetan.svg"))],
    )]
    , kind: table
    )

  ],
  caption: [
    Angle $theta_1 \( n \)$ dependence on the number of turns $n$ (the
    small ellipse).
  ]
)
<fig:theta1n>

#figure([#figure(
    align(center)[#table(
      columns: 1,
      align: (right,),
      [#box(image("source/theta2n.svg"))],
    )]
    , kind: table
    )

  ],
  caption: [
    Angle $theta_2 \( n \)$ dependence on the number of turns $n$ (the
    large ellipse).
  ]
)
<fig:theta2n>

In the limit $omega arrow.r omega_c$, the angle of the first ellipse
(see Fig.~@fig:theta1n) is equal to
$ theta_1 = 1 / 2 arctan #scale(x: 120%, y: 120%)[\(] frac(a_c - sin a_c, cos a_c - 1) #scale(x: 120%, y: 120%)[\)] \, $
which has its extrema at $n arrow.r 0$
$ theta_(1 \, upright("max")) = lim_(n arrow.r 0) theta_1 \( n \) = 0 \, $
and at $n arrow.r k + 1 \/ 2 \, quad k in bb(N)_0$ and $n arrow.r oo$
$ theta_(1 \, upright("min")) = lim_(n arrow.r k + 1 \/ 2) theta_1 \( n \) = lim_(n arrow.r oo) theta_1 \( n \) = - pi / 2 . $

== TOF between a deflector and a screen
<Subsec:TOFdefscr>
In the limit
$omega arrow.r omega_c arrow.r.double { X' arrow.r X'_c \, Y' arrow.r Y'_c }$
$ X'_c = tau_D #scale(x: 120%, y: 120%)[\(] A'_(1 c) c_phi.alt + B'_(1 c) s_phi.alt #scale(x: 120%, y: 120%)[\)] = a'_(1 c) c_phi.alt + b'_(1 c) s_phi.alt =\
= A'_(x c) cos #scale(x: 120%, y: 120%)[\(] phi.alt + phi.alt'_(x c) #scale(x: 120%, y: 120%)[\)] \,\
Y'_c = tau_D #scale(x: 120%, y: 120%)[\(] A'_(2 c) c_phi.alt + B'_(2 c) s_phi.alt #scale(x: 120%, y: 120%)[\)] = a'_(2 c) c_phi.alt + b'_(2 c) s_phi.alt =\
= A'_(y c) sin #scale(x: 120%, y: 120%)[\(] phi.alt + phi.alt'_(y c) #scale(x: 120%, y: 120%)[\)] \,\
a'_(1 c) = b'_(2 c) = frac(A \( tilde(E)_perp \), 8 omega_c^2) #scale(x: 120%, y: 120%)[\(] 1 - cos a_c #scale(x: 120%, y: 120%)[\)] a_D \,\
b'_(1 c) = frac(A \( tilde(E)_perp \), 8 omega_c^2) #scale(x: 120%, y: 120%)[\(] a_c + sin a_c #scale(x: 120%, y: 120%)[\)] a_D \,\
a'_(2 c) = frac(A \( tilde(E)_perp \), 8 omega_c^2) #scale(x: 120%, y: 120%)[\(] a_c - sin a_c #scale(x: 120%, y: 120%)[\)] a_D . $

#block[
The sizes of the big ellipse are the following
$ chi'_c = frac(lr(|A \( tilde(E)_perp \)|), 8 omega_c^2) frac(lr(|a_c^2 - 2 \( 1 - cos a_c \)|), #scale(x: 120%, y: 120%)[\(] #scale(x: 120%, y: 120%)[\(] a_c^2 + 2 \( 1 - cos a_c \) #scale(x: 120%, y: 120%)[\)] + 2 sqrt(2) a_c sqrt(1 - cos a_c) #scale(x: 120%, y: 120%)[\)]^(1 \/ 2)) a_D = frac(lr(|A \( tilde(E)_perp \)|), 8 omega_c^2) a_D a_c #scale(x: 120%, y: 120%)[\(] 1 - lr(|frac(sin \( a_c \/ 2 \), a_c \/ 2)|) #scale(x: 120%, y: 120%)[\)] \, $<Shamaevform1>
$ 𝜘'_c = frac(lr(|A \( tilde(E)_perp \)|), 8 omega_c^2) frac(lr(|a_c^2 - 2 \( 1 - cos a_c \)|), #scale(x: 120%, y: 120%)[\(] #scale(x: 120%, y: 120%)[\(] a_c^2 + 2 \( 1 - cos a_c \) #scale(x: 120%, y: 120%)[\)] - 2 sqrt(2) a_c sqrt(1 - cos a_c) #scale(x: 120%, y: 120%)[\)]^(1 \/ 2)) a_D = frac(lr(|A \( tilde(E)_perp \)|), 8 omega_c^2) a_D a_c #scale(x: 120%, y: 120%)[\(] 1 + lr(|frac(sin \( a_c \/ 2 \), a_c \/ 2)|) #scale(x: 120%, y: 120%)[\)] \, $<Shamaevform2>
where the final formulas in #link(<Shamaevform1>)[\[Shamaevform1\]] and
#link(<Shamaevform2>)[\[Shamaevform2\]] exactly correspond to the ones
in the book #link(<ref:ZhigarevBook>)[\[4\]] (note that in the book $n = 1$).

]
In the limit $omega arrow.r omega_c$, the angle of the second ellipse
(see Fig.~@fig:theta2n) is equal to
$ theta_2 = 1 / 2 arctan #scale(x: 120%, y: 120%)[\(] tan a_c / 2 #scale(x: 120%, y: 120%)[\)] = a_c / 4 - pi / 2 thin ⌈1 / 2 thin ⌊a_c / pi⌋⌉ =\
= pi n - pi / 2 thin ⌈1 / 2 thin ⌊4 n⌋⌉ \, $ where, to restrict
$theta_2$ to the first quadrant, the ceiling $ceil.l * ceil.r$ and the
floor $floor.l * floor.r$ rounding functions are used. This is a
mathematical convention and in physics it is usually more natural to use
rotation angle which is continuous function of $n$, i.e.,
$theta_2 = pi n$.

Hereby, the Shamaev conditions to get a circle simply can be seen: when
the following

+ Shamaev resonance $omega arrow.r omega_c$, i.e., the equality of the
  TOF ($tau_c = lambda / v_z = frac(2 pi, omega_c)$) of a charged
  particle through one turn of the helix to the period
  ($T = frac(2 pi, omega)$) of the high-frequency voltage: $tau_c = T$,

+ a half-integer number of turns
  $n = k \/ 2 quad \( a_c \/ 2 = 2 pi k \) \, quad k in bb(N)$, which is
  equivalent to $tau = frac(pi k, omega_c)$ written in the book,
  #link(<ref:ZhigarevBook>)[\[4\]]

hold, the big ellipse turns to a circle ($chi'_c = 𝜘'_c$) with a radius
$ r'_c = frac(lr(|A \( tilde(E)_perp \)|), 8 omega_c^2) a_c a_D = frac(e tilde(E)_perp, m gamma) frac(2 pi^2 n n_D, omega_c^2) = frac(e tilde(E)_perp, m gamma) frac(l L, 2 v_z^2) . $

== Total TOF
<Subsec:total-tof>
In the limit
$omega arrow.r omega_c arrow.r.double { X arrow.r X_c \, Y arrow.r Y_c }$
$ X_c = A_(1 c) c_phi.alt + B_(1 c) s_phi.alt \,\
Y_c = A_(2 c) c_phi.alt + B_(2 c) s_phi.alt \,\
A_(1 c) = B_(2 c) = frac(A \( tilde(E)_perp \), 8 omega_c^2) #scale(x: 120%, y: 120%)[\(] a_c - sin a_c + a_D \( 1 - cos a_c \) #scale(x: 120%, y: 120%)[\)] \,\
B_(1 c) = frac(A \( tilde(E)_perp \), 8 omega_c^2) #scale(x: 120%, y: 120%)[\(] a_c^2 / 2 + 1 - cos a_c + a_D \( a_c + sin a_c \) #scale(x: 120%, y: 120%)[\)] \,\
A_(2 c) = frac(A \( tilde(E)_perp \), 8 omega_c^2) #scale(x: 120%, y: 120%)[\(] a_c^2 / 2 + cos a_c - 1 + a_D \( a_c - sin a_c \) #scale(x: 120%, y: 120%)[\)] . $

#block[
The sizes of the resulting ellipse are the following
$ chi_c = frac(lr(|A \( tilde(E)_perp \)|), 16 omega_c^2) lr(|f_1 \( a_c \, a_D \) - k \( a_c \)|) / sqrt(k \( a_c \) + f_2 \( a_c \, a_D \) + l \( a_c \, a_D \)) = frac(e tilde(E)_perp, m gamma) frac(l^2, 4 v_z^2) frac(K_3 \( n \) lr(|K_1 \( n \, n_D \) - frac(1, \( 4 pi n \)^2)|), sqrt(K_(2 +) \( n \, n_D \) + frac(1, \( 4 pi n \)^2))) = frac(l^2 lr(|A \( tilde(E)_perp \)|), v_z^2) G_1 \( n \, n_D \) \,\
𝜘_c = frac(lr(|A \( tilde(E)_perp \)|), 16 omega_c^2) lr(|f_1 \( a_c \, a_D \) - k \( a_c \)|) / sqrt(k \( a_c \) + f_2 \( a_c \, a_D \) - l \( a_c \, a_D \)) = frac(e tilde(E)_perp, m gamma) frac(l^2, 4 v_z^2) frac(K_3 \( n \) lr(|K_1 \( n \, n_D \) - frac(1, \( 4 pi n \)^2)|), sqrt(K_(2 -) \( n \, n_D \) + frac(1, \( 4 pi n \)^2))) = frac(l^2 lr(|A \( tilde(E)_perp \)|), v_z^2) G_2 \( n \, n_D \) \,\
l \( a_c \, a_D \) = 4 a_c \( a_c + 2 a_D \) sqrt(2 a_D \( a_c + a_D \) \( 1 - cos a_c \) + 2 \( 1 - cos a_c \) - 2 a_c sin a_c + a_c^2) \,\
f_1 \( a_c \, a_D \) = a_c^4 + 4 a_D \( a_c + a_D \) \( 2 \( cos a_c - 1 \) + a_c^2 \) \,\
f_2 \( a_c \, a_D \) = a_c^4 + 4 a_D \( a_c + a_D \) \( 2 \( 1 - cos a_c \) + a_c^2 \) \,\
k \( a_c \) = 8 \( 1 - cos a_c \) - 4 a_c \( 2 sin a_c - a_c \) \,\
K_1 \( n \, n_D \) = frac(1 + 4 n_D / n #scale(x: 120%, y: 120%)[\(] 1 + n_D / n #scale(x: 120%, y: 120%)[\)] #scale(x: 120%, y: 120%)[\(] 2 frac(cos 4 pi n - 1, \( 4 pi n \)^2) + 1 #scale(x: 120%, y: 120%)[\)], 8 frac(1 - cos 4 pi n, \( 4 pi n \)^2) - 4 #scale(x: 120%, y: 120%)[\(] 2 frac(sin 4 pi n, 4 pi n) - 1 #scale(x: 120%, y: 120%)[\)]) \,\
K_(2 plus.minus) \( n \, n_D \) = frac(1 + 4 n_D / n #scale(x: 180%, y: 180%)[\(] 1 + n_D / n #scale(x: 180%, y: 180%)[\)] #scale(x: 180%, y: 180%)[\(] 1 + 2 frac(1 - cos \( 4 pi n \), \( 4 pi n \)^2) #scale(x: 180%, y: 180%)[\)] plus.minus tilde(l) \( n \, n_D \), 8 frac(1 - cos \( 4 pi n \), \( 4 pi n \)^2) - 4 #scale(x: 180%, y: 180%)[\(] 2 frac(sin \( 4 pi n \), 4 pi n) - 1 #scale(x: 180%, y: 180%)[\)]) \,\
K_3 \( n \) = sqrt(8 frac(1 - cos 4 pi n, \( 4 pi n \)^2) - 4 #scale(x: 120%, y: 120%)[\(] 2 frac(sin 4 pi n, 4 pi n) - 1 #scale(x: 120%, y: 120%)[\)]) \,\
tilde(l) \( n \, n_D \) = 4 #scale(x: 120%, y: 120%)[\(] 1 + 2 n_D / n #scale(x: 120%, y: 120%)[\)] sqrt(2 n_D / n #scale(x: 120%, y: 120%)[\(] 1 + n_D / n #scale(x: 120%, y: 120%)[\)] frac(1 - cos 4 pi n, \( 4 pi n \)^2) + 2 frac(1 - cos 4 pi n, \( 4 pi n \)^4) - 2 frac(sin 4 pi n, \( 4 pi n \)^3) + frac(1, \( 4 pi n \)^2)) \, $<finalellipse>

]
In the limit $omega arrow.r omega_c$, the angle of the final ellipse
(see Fig.~@fig:thetacnnD) is equal to
$ theta_c = 1 / 2 arctan #scale(x: 120%, y: 120%)[\(] frac(a_c - sin a_c + a_D \( 1 - cos a_c \), 1 - cos a_c + a_D sin a_c) #scale(x: 120%, y: 120%)[\)] . $

#figure([#figure([#box(image("source/G1nnDvsn.svg")) <fig:G1nnDvsn>

    ],
    caption: [
    ]
  )
  <fig:G1nnDvsn>

  #figure([#box(image("source/G2nnDvsn.svg")) <fig:G2nnDvsn>

    ],
    caption: [
    ]
  )
  <fig:G2nnDvsn>

  ],
  caption: [
    $G_1 \( n \, n_D \)$ and $G_2 \( n \, n_D \)$ profile dependences on
    the number of turns $n$ for the fixed values of the number of
    phantom turns $n_D$ (the resulting ellipse).
  ]
)
#label("FIG:n=15_kappa=6-pi")

#figure([#figure([#box(image("source/G1nnDvsnD.svg")) <fig:G1nnDvsn>

    ],
    caption: [
    ]
  )
  <fig:G1nnDvsn>

  #figure([#box(image("source/G2nnDvsnD.svg")) <fig:G2nnDvsn>

    ],
    caption: [
    ]
  )
  <fig:G2nnDvsn>

  ],
  caption: [
    $G_1 \( n \, n_D \)$ and $G_2 \( n \, n_D \)$ profile dependences on
    the phantom number of turns $n_D$ for the fixed values of the number
    of turns $n$ (the resulting ellipse).
  ]
)
#label("FIG:n=15_kappa=6-pi")

#figure([#figure(image("source/thetacnnDvsn.svg"),
    caption: [
    ]
  )

  #figure(image("source/thetacnnDvsnD.svg"),
    caption: [
    ]
  )

  ],
  caption: [
    $theta_c \( n \, n_D \)$ angle dependences on the number of turns
    $n$ for the fixed values of the phantom number of turns $n_D$ (a),
    and on the phantom number of turns $n_D$ for the fixed values of the
    number of turns $n$ (b) (the resulting ellipse).
  ]
)
<fig:thetacnnD>

= To get closer to the circle
<Sec:getcircle>
Although it is written in the book that there is a way to get a circle
on the screen, I argue that claim. In the book, it is assumed that
electrons are deflected from the deflector's axis at the end of the
helical deflector (a full #emph[paraxial approximation]). In reality, if
one imagines that the screen is exactly after the deflector, the
electrons will be incident to the screen painting a small ellipse, which
opposes to the opinion in the book. This small ellipse; since at the end
of deflector the transverse radius and the transverse velocity have
different directions, i.e., $tan alpha eq.not tan beta$ in general
($tan alpha = y \( tau \) \/ x \( tau \)$,
$tan beta = v_y \( tau \) \/ v_x \( tau \)$); can drastically change the
final ellipse (TOF between screen and the start of deflector), which
will be a merging of a small ellipse (TOF at deflector) and a Shamaev
ellipse (TOF between screen and the end of deflector). Although the
Shamaev ellipse becomes a circle in the case of Shamaev condition
(Shamaev resonance $omega arrow.r omega_c$ and $tau = pi k \/ omega_c$
or $n = k \/ 2 \, quad k in bb(N)$), the small ellipse is not negligible
(compare Forms.~@Shamaevform1 and @Shamaevform2
and~#link(<finalellipse>)[\[finalellipse\]]).

= #emph[On and off] single-electron pencil beam
<Sec:pencilbeam>
It will be difficult or ineffective to handle all the mentioned
conditions. Therefore, it is important to create a framework to work
with the ellipse. The initial equations provide that framework.

Let's imagine that we have #emph[on and off] single-electron pencil
beam, which is an approximation of the bunched beam. Contrary to the
circle, for the this beam of charged particles, their track on the
ellipse will be partial ellipse arcs with unequal lengths. The question
appears --- #emph[How to measure TOF using these unequal lengths?]
Experimental answer will be to use RMS (root-mean-square) measure.
Probably, RMS of these lengths will provide a relevant measure of time
and the final article will touch also this topic.

= Deflection sensitivity
<Sec:DS>
Let's denote the semi-major and semi-minor axes of the ellipse as
$ r_(upright("max")) = upright("max") { chi \, 𝜘 } \,\
r_(upright("min")) = upright("min") { chi \, 𝜘 } . $

Dynamic deflection sensitivity, in the case of the ellipse, ranges in
$\[ S_(upright("min")) \( omega \) \, S_(upright("max")) \( omega \) \]$,
has

+ it's maximum as
  $ S_(upright("max")) \( omega \) = frac(r_(upright("max")) \( omega \), U_0 sin \( omega t \)) \, $

+ it's minimum as
  $ S_(upright("min")) \( omega \) = frac(r_(upright("min")) \( omega \), U_0 sin \( omega t \)) \, $

+ and it's mean as
  $ chevron.l S chevron.r = frac(sqrt(chi \( omega \) kappa \( omega \)), U_0 sin \( omega t \)) \, $
  the latter formula is taken according to the mapping of the ellipse to
  the phantom circle using the equivalence of their areas
  $f_e = pi chi 𝜘$ and $f = pi chevron.l r chevron.r^2$, where the
  radius of that averaged circle is actually a mean deflection
  $chevron.l r chevron.r = sqrt(chi 𝜘)$, representing a geometric mean.

= Comments and conclusions
<Sec:concl>
The present article demonstrates that #emph[the model in the Book]
#link(<ref:ZhigarevBook>)[\[4\]]#link(<ref:Gevorgian2015>)[\[2\]] (and the analogous magnetic-field model
#link(<ref:Varfolomeev1980>)[\[5\]]) for the helical deflector is actually an approximation
of the newly introduced #emph[capacitor model] (with a similar magnetic
analogue #link(<ref:Smythe1989>)[\[21\]]). In turn, this #emph[capacitor model] should
itself be regarded as an approximation #link(<ref:Jefimenko1992>)[\[22\]]#link(<ref:Ton1991>)[\[23\]] to the
full electromagnetic theory obtained directly from Maxwell's equations
#link(<ref:Buchholz1957>)[\[24\]]#link(<ref:Gevorgian2022>)[\[25\]]. Furthermore, the capacitor model may
deviate from the real electromagnetic behavior because the helical
system possesses both capacitance and inductance, whose effective values
are frequency dependent in a slow-wave structure. As a result, at a
characteristic resonant frequency #link(<ref:Gevorgianidea>)[\[26\]]
$ omega_(L C) = 1 / sqrt(L C) $ the interaction becomes strongest, and
the resulting electric field $tilde(E)_perp$ --- and hence the
deflection amplitude ($chi \, 𝜘$) --- achieves its maximum.

In helical slow-wave structures #link(<ref:Basu1996>)[\[14\]]#link(<ref:Basu1979>)[\[15\]]#link(<ref:Rowe1965>)[\[16\]]#link(<ref:Carter2018>)[\[17\]],
$bold(E)$ and $bold(B)$ fields are typically derived from the voltage
and current on the transmission line, with the primary goal of analyzing
wave propagation along the helix (e.g., phase velocity, dispersion, and
impedance). The classical helix slow-wave models used differ from the
present case.

In #link(<ref:Gevorgian2022>)[\[25\]], the important problem of deriving the magnetic field
of a two-wire helical line from the Poisson equation---and thus directly
from Maxwell's equations---was addressed, although only for the
constant-current case. A comparable derivation for ribbons or other
helical structures --- specifically, the determination of the electric
field and the full electromagnetic field generated under an applied
periodic voltage as a direct solution of Maxwell's equations in full 3D
geometry --- remains an open problem. Likewise, the resulting deflection
characteristics and the validity of #emph[the model in the Book] have
not yet been fully established. The present article introduces a
universal method for deriving the resulting deflection characteristics
and addresses questions regarding the validity of #emph[the model in the
Book] by proposing a new #emph[capacitor model] and their comparison. It
establishes a pathway from modeling to theory for high-precision
instruments, such as the Advanced Picosecond Precision Radio Frequency
Timer #link(<ref:Zhamkochyan2024>)[\[27\]].

HLG acknowledges support from the Higher Education and Science Committee
of Armenia in the frames of the research project 21AG-1C038 on
#emph[Methods of Information Theory in Statistical Physics and Data
Science].

= Parameters
<parameters>
Here we present

#figure(
  align(center)[#table(
    columns: 15,
    align: (center,center,center,center,center,center,center,center,center,center,center,center,center,center,center,),
    table.header([$U_a$], [$U_0$], [$v_z \/ c$], [$z_0$], [$R$], [$d$], [$b$], [$l$], [$epsilon.alt_d$], [$lambda = l \/ n$], [$kappa = lambda \/ \( pi d \)$], [$phi_1 \, phi_2$], [$n$], [$omega$], [$L_D$],),
    table.hline(),
    [2.5 keV], [10 V], [1/10], [\*], [$d \/ 2$], [10 mm], [1.5 mm], [60
    mm], [1], [\*], [\*], [$- n pi \, n pi$], [1], [500 MHz], [20 mm],
  )]
  , caption: [Parameters of the helical deflector]
  , kind: table
  ) <Table:parameters>

= Magnetic field
<magnetic-field>
An open circuit offers infinite resistance to the flow of current,
hence, the amount of current propagating through deflector is due to the
time-dependent charge. So, the current is equal
$ I \( t \) = 2 frac(d q \( t \), d t) = - 2 integral_0^L frac(d rho \( t \), d t) d s = - I_0 cos \( omega t + phi.alt \) \, $
where, for the parameters @Table:parameters,
$I_0 = 2 omega C U_0 L = 0.0108608$ A, and $L = 6.7$ cm for $l = 6 c m$
($lambda = 6$ cm and $n = 1$). The Biot-Savart law gives
$ bold(B) \( t \) = bold(B)_0 cos \( omega t + phi.alt \) \,\
bold(B)_0 = - frac(mu_0, 4 pi) integral frac(I_0 d bold(s) times bold(r), r^3) = { B_(0 x) \, B_(0 y) \, B_(0 z) } \, $
hence,
$ B_(0 x) = frac(mu_0, 4 pi) integral_(phi_1)^(phi_2) frac(I_0 \/ R [\( kappa y_0 - z_0 cos phi \) \/ R + kappa \( phi cos phi - sin phi \)] thin d phi, S \( x_0 \, y_0 \, z_0 \, phi \)) \,\
B_(0 y) = frac(mu_0, 4 pi) integral_(phi_1)^(phi_2) frac(I_0 \/ R [- \( kappa x_0 + z_0 sin phi \) \/ R + kappa \( cos phi + phi sin phi \)] thin d phi, S \( x_0 \, y_0 \, z_0 \, phi \)) \,\
B_(0 z) = frac(mu_0, 4 pi) integral_(phi_1)^(phi_2) frac(I_0 \/ R [\( x_0 cos phi + y_0 sin phi \) \/ R - 1] thin d phi, S \( x_0 \, y_0 \, z_0 \, phi \)) . $

Let's evaluate a magnetic field. It is approximately equal to
$\[ B \] = frac(mu_0, 4 pi) I_0 / R approx 2 times 10^(- 7)$ T. His
contribution to the Lorentz force will be $c / 10 \[ B \] approx 6$ V/m,
much smaller than contribution of an electric field
$\[ E \] = Q_0 \/ R = 1242.83$ V/m.

#heading(numbering: none)[References]

#block[\[1\] F.G.~Major, "The quantum beat: principles and applications of atomic
clocks," (Springer Science & Business Media, 2007).] <ref:MajorBook>

#block[\[2\] L.~Gevorgian, R.~Ajvazyan, V.~Kakoyan, A.~Margaryan, and
J.~R.~M.~Annand, "A radio frequency helical deflector for keV
electrons,"
#link("https://doi.org/10.1016/j.nima.2015.03.012")[Nucl. Instr. Meth. A #strong[785], 175--179 (2015)].] <ref:Gevorgian2015>

#block[\[3\] H.~Ibach,
"#link("https://doi.org/10.1007/978-3-540-47157-8_3")[The Electron Optics of the Cylindrical Deflector],"
In: #emph[Electron Energy Loss Spectrometers]. Springer Series in
Optical Sciences, vol 63. Springer, Berlin, Heidelberg (1991).] <ref:Ibach1991>

#block[\[4\] A.A.~Zhigarev, #emph[Ėlectronno-Luchevie Pribory (Electron Beam
Devices)], Moscow: Energiya, 1965, p. 199; #emph[Ėlektronnaya Optika i
Ėlektronno-Luchevie Pribory (Electron Optics and Electron Beam
Devices)], Moscow: Vysshaya Shkola, 1972, p. 338 (in Russian).] <ref:ZhigarevBook>

#block[\[5\] A.A.~Varfolomeev, #emph[Lazery na svobodnykh ėlektronakh i perspektivy
ikh razvitiya: Obzor] (Lasers on Free Electrons and Prospects for Their
Development: Review) (I. V. Kurchatov Institute of Atomic Energy,
Moscow, 1980), pp. 13--14.] <ref:Varfolomeev1980>

#block[\[6\] H.-G.~Unger, "Helix waveguide theory and application,"
#link("https://doi.org/10.1002/j.1538-7305.1958.tb01562.x")[Bell Syst. Tech. J. #strong[37]\(6), 1599--1647 (1958)].] <ref:Unger1958>

#block[\[7\] C.-M.~Chu, "Propagation of Waves in Helical Wave Guides,"
#link("https://doi.org/10.1063/1.1722952")[J. Appl. Phys. #strong[29]\(1), 88--99 (1958)].] <ref:Chu1958>

#block[\[8\] Z.~Menachem and S.~Tapuchi, "Wave propagation in a helical waveguide
with slab and rectanular dielectric profiles, and applications,"
#link("https://doi.org/10.2528/pierb11070414")[Prog. Electromagn. Res. B #strong[34], 77--102 (2011)].] <ref:Menachem2011>

#block[\[9\] J.~Nandi, A.K.~Sikdar, P.~Das, and A.~Ray, "Design of a helical
resonator with improved figure of merit,"
#link("https://doi.org/10.1063/5.0065422")[Rev. Sci. Instrum. #strong[93], 014706 (2022)].] <ref:Nandi2022>

#block[\[10\] K.~Deng, Y.L.~Sun, W.H.~Yuan, Z.T.~Xu, J.~Zhang, Z.H.~Lu, and J.~Luo, "A
modified model of helical resonator with predictable loaded resonant
frequency and Q-factor,"
#link("https://doi.org/10.1063/1.4897478")[Rev. Sci. Instrum. #strong[85], 104706 (2014)].] <ref:Deng2014>

#block[\[11\] A.~Dyussembayev and D.~Psychogiou, "Continuously tunable 3-D printed
helical resonators and bandpass filters using actuated liquid metals,"
#link("https://doi.org/10.1109/LMWC.2022.3152014")[IEEE Microw. Wirel. Compon. Lett. #strong[32]\(7), 855--858 (2022)].] <ref:Dyussembayev2022>

#block[\[12\] S.~Dalarsson, "Analytical and numerical study of helical antennas in
radio devices using integral equations,"
#link("https://www.diva-portal.org/smash/get/diva2:862045/FULLTEXT01.pdf")[B.Sc. thesis (2015)].] <ref:DalarssonThesis2015>

#block[\[13\] Y.D.~Chernousov, V.~Guidi, P.V.~Logachov, L.~Tecchio, "Proposal for a
detecting system for streak camera with sub-ps resolution and wide
dynamic range,"
#link("https://doi.org/10.1016/S0168-9002(00)00343-0")[Nucl. Instr. Meth. A #strong[451], 541 (2000)].] <ref:Chernousov2000>

#block[\[14\] B.N.~Basu, #emph[Electromagnetic theory and applications in beam-wave
electronics] (World Scientific, Singapore, 1996).] <ref:Basu1996>

#block[\[15\] B.N.~Basu, "Dielectric-supported helix in a metal shell,"
#link("https://doi.org/10.1080/00207217908938647")[Int. J. Electron. #strong[47], 311--314 (1979)].] <ref:Basu1979>

#block[\[16\] J.E.~Rowe, #emph[Nonlinear Electron-Wave Interaction Phenomena],
H.G.~Booker and N. DeClaris (Ed.), Electrical Science: A Series of
Monographs and Texts (Academic Press Inc., New York, 1965).] <ref:Rowe1965>

#block[\[17\] R.G.~Carter, #emph[Microwave and RF vacuum electronic power sources]
(Cambridge University Press, Cambridge, 2018).] <ref:Carter2018>

#block[\[18\] K.L.~Corum and J.F.~Corum, "RF coils, helical resonators and voltage
magnification by coherent spatial modes," In #emph[5th International
Conference on Telecommunications in Modern Satellite], Cable and
Broadcasting Service, TELSIKS 2001, Proceedings of Papers (Cat. No.
01EX517), vol. 1, pp. 339--348. IEEE, 2001.] <ref:Corum2001>

#block[\[19\] E.~Martines, R.~Cavazzana, L.~Cordaro, and M.~Zuin, "The helical
resonator: A scheme for radio frequency plasma generation,"
#link("https://
doi.org/10.3390/app11167444")[Appl. Sci. #strong[11], 7444 (2021)].] <ref:Martines2021>

#block[\[20\] S.~Sensiper, "Electromagnetic wave propagation on helical conductors,"
Tech. Rep. #strong[194] (MIT, Cambridge, 1951).] <ref:Sensiper1951>

#block[\[21\] W.~R.~Smythe, #emph[Static and Dynamic Electricity (3rd ed.)] (Taylor &
Francis, Philadelphia, PA, 1989).] <ref:Smythe1989>

#block[\[22\] O.D.~Jefimenko, "Solutions of Maxwell's equations for electric and
magnetic fields in arbitrary media,"
#link("https://doi.org/10.1119/1.17010")[Am. J. Phys. #strong[60], 899--902 (1992)].] <ref:Jefimenko1992>

#block[\[23\] T.~Ton, "On the time‐dependent, generalized Coulomb and Biot--Savart
laws,".
#link("https://doi.org/10.1119/1.16812")[Am. J. Phys. #strong[59], 520--528 (1991)].] <ref:Ton1991>

#block[\[24\] H.~Buchholz, #emph[Electrische und magnetische Potentialfelder]
(Springer-Verlag, Berlin--Göttingen--Heidelberg, 1957), #emph[Raschet
Ėlektricheskikh i magnitnykh polei] (Izdatel'stvo inostrannoi
literarury, Moscow, 1961).] <ref:Buchholz1957>

#block[\[25\] L.A.~Gevorgian, "Magnetic field inside a two-wire spiral line,"
#link("https://doi.org/10.3103/S1068337222010108")[J. Contemp. Phys. #strong[57], 30--35 (2022)].] <ref:Gevorgian2022>

#block[\[26\] L.A.~Gevorgian, #emph[private communication].] <ref:Gevorgianidea>

#block[\[27\] S.~Zhamkochyan #emph[et al], "Advanced picosecond precision Radio
Frequency Timer,"
#link("https://doi.org/10.1088/1748-0221/19/02/C02014")[JINST #strong[19], C02014 (2024)].] <ref:Zhamkochyan2024>

#block[\[28\] H.~Buchholz, #emph[Electrische und magnetische Potentialfelder]
(Springer-Verlag, Berlin--Göttingen--Heidelberg, 1957), #emph[Raschet
Ėlektricheskikh i magnitnykh polei] (Izdatel'stvo inostrannoi
literarury, Moscow, 1961).] <ref:Buchholz1957-repeat>
