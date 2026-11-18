#import "contact-geometry.typ": contact-geometry

#set document(title: "Vibrational Transportation of Deformable Axisymmetric Particles")
#set page(paper: "us-letter", margin: (x: 0.7in, y: 0.75in), numbering: "1", columns: 2)
#set text(font: "Libertinus Serif", size: 10pt)
#set par(justify: true, leading: .48em, first-line-indent: 1em)
#set heading(numbering: "I.A.1")
#set math.equation(numbering: "(1)")
#set figure(supplement: [Fig.])
#set figure.caption(separator: [. ])
#show figure.caption: set text(size: 9pt)
#set columns(gutter: 0.24in)
#figure(kind: "frontmatter", numbering: none, placement: top, scope: "parent")[
#align(center)[
  #text(size: 16pt, weight: "bold")[Vibrational Transportation of Deformable Axisymmetric Particles]
  #v(0.6em)
  Marina E. Terzi#super[1], Vladislav V. Aleshin#super[2], Jules Ghesqui?re#super[2], and Vincent Tournat#super[1]
  #v(0.4em)
  #text(size: 9pt, style: "italic")[
    #super[1] Laboratoire d?Acoustique de l?Universit? du Mans, Le Mans, France \
    #super[2] Institut d?Electronique, de Micro?lectronique et de Nanotechnologie, UMR CNRS 8520, Universit? de Lille, Villeneuve d?Ascq, France
  ]
  #v(0.25em)
  #text(size: 8pt)[#link("mailto:marina.e.terzi@gmail.com")[marina.e.terzi\@gmail.com] · #link("https://orcid.org/0000-0001-9399-4806")[ORCID 0000-0001-9399-4806]]
]
#pad(x: 0.55in)[#set text(size: 9pt)
A particle on a substrate supporting a surface acoustic wave can
experience horizontal drift excited by the dry friction force. The
effect is referred to as vibrational transportation, or as a surface
acoustic wave motor, and is used in a number of industrial applications.
A traditional theory of vibrational transportation considers a particle
as a material point moving on a rigid substrate. A more realistic
representation is a contact model based on Cattaneo-Mindlin (also called
Hertz-Mindlin) mechanics applicable to an axisymmetric deformable
particle. The contact zone in this case is not a point, but rather a
circle that generally contains a smaller circle of stick and a
surrounding annulus of slip. A recent semi-analytical extension of the
Cattaneo-Mindlin solution called the Method of Memory Diagrams (MMD)
allows one to compute the hysteretic friction force for an arbitrary
loading history in terms of contact displacements, and, subsequently, to
numerically solve the equations of motion. Depending on the materials'
and excitation parameters, the particle can stay in permanent contact
with the substrate or experience multiple jumps. In the former case, the
particle can drift in a horizontal direction due to asymmetric sliding
condition created by oscillating normal and tangential contact forces.
In other words, during each wave period, the particle advances and
recedes with different efficiencies, which finally results in a drift.
The drift can occur in the wave propagation direction and against it,
and require a specific choice of system's parameters. In the regime of
multiple jumps, directed horizontal motion is also possible. However, it
is governed by a completely different mechanism based on synchronization
between the wave period and rebounding events. There exist cases where
the rebound occurs once per period and consistently at the same phase.
During each rebound, the particle gets horizontal momentum of the same
sign (against the wave propagation direction). The value of this
momentum depends on the horizontal velocity mismatch between the
particle and the substrate; therefore, at the beginning of the process,
the particle moves with an acceleration that decreases and finally
disappears. Exactly the same type of motion against the wave has been
observed in our preliminary experiments. In other cases, the time of
flight of the particle and the wave period are uncorrelated, thus
resulting in a chaotic motion. We also demonstrate that a point mass in
the same situation behaves differently. In particular, in a regime of
permanent contact, negative and positive sliding are equilibrated, which
produces no drift. In addition, multiple rebounds of a point mass are
always chaotic, at least for fully conservative collisions. In
conclusion, the deformable particle model can be a better guide for
various applications, such as particle micropositioning or acoustic dust
cleaning.
]
]

= Introduction<sec:intro>
It is well known that small objects (particles) posed on vibrating
surfaces can experience directed tangential motion~~a phenomenon often
referred to as #emph[vibrational transportation]. This effect is of
interest for a variety of applications, such as shaking chutes,
conveyors, and vibratory feeders. These devices are used in the food and
pharmaceutical industries for delivering powders and grains, as well as
for packaging, sorting, and precise medical
dosing~@erdesz_experimental_1988@mracek_system_2005. Potential
applications of the principle include mobile mechanisms for
surgery~@kim_forward_2020, devices for sensor cleaning and sample
sorting, e.g. in exploratory space
missions~@hui_vibrational_2024@bao_transport_2009, vibration-based dust
cleaning systems for plate-like structures such as solar
panels~@abd-elhady_new_2024, size-based particle
sorting~@dunst_vibration-assisted_2018, programmable
patterning~@kopitca_programmable_2021. The requirements for vibrational
systems can range from precise, selective manipulation or
micropositioning to rapid, large-scale particle displacement (e.g. for
cleaning applications). Since the 1980s, attempts have been made to
estimate the transport rate in such devices~@hongler_periodic_1989.

The effect of horizontal particle motion on vibrating surfaces has been
known for centuries. In particular, standing waves excited in vibrating
plates were observed to move sand grains towards the nodes of these
waves (Chladni plates~@chladni_discoveries_1787@zhou_controlling_2016).
Recently, a reverse Chladni effect has been observed, where particles
move toward the anti-nodes. This behavior is attributed to the currents
generated by the vibrating plate in the surrounding
fluid~@latifi_motion_2019 or air~@van_gerner_air-induced_2011. By
adjusting the parameters of the standing waves, one can shift the nodes
and anti-nodes, causing the particles to follow them. A striking example
of this phenomenon is a particle escaping a maze~@latifi_motion_2019.
Particles subjected to standing waves can also form complex patterns
such as letters or other symbols~@zhou_controlling_2016.

Generally, a particle drift in a specific direction requires the
asymmetry in the excited particle-substrate contact system. An
exhaustive list of possible asymmetries, along with an extensive set of
analytical solutions, is given in a fundamental book on vibrational
mechanics~@blekhman_basic_1994. The considered asymmetry cases include
anisotropic friction coefficient, internal particle motion, inclined
surfaces, traveling surface acoustic waves (SAWs), etc.

The situation in which particles are moved by the friction force induced
by traveling acoustic waves localized at interfaces~such as the Rayleigh
or Lamb modes~deserves additional attention. In such waves, vertical and
horizontal displacements are phase-shifted, creating the asymmetry
required for directed motion. Horizontal particle motion is driven by a
friction force arising from acoustic displacements. Examples of
practical applications of the effect include Rayleigh ultrasonic
motors~@kurosawa_friction_1996, SAW devices that manipulate
powders~@bao_transport_2009@sherrit_mechanism_2010@takizawa_manipulation_2021@saiki_transporting_2021
and
droplets~@bao_transport_2009@brunet_droplet_2010@bar-cohen_high-speed_2012.

To describe particle motion under the action of acoustically generated
friction force, it is necessary to define a contact model. Three
approaches are possible: a point mass on a deformable substrate, a point
mass on a rigid substrate that, however, supports an acoustic wave, and
a deformable particle of finite size on a deformable substrate. The
first case assumes the use of the Boussinesq
solution~@boussinesq_application_1885@landau_theory_1986 for a
concentrated force applied to an elastic half-space. The solution for
the normal displacement field exhibits a singularity at the contact
point and is therefore unusable for solving the particle dynamics
problem. To the best of our knowledge, in a fully deformable contact
system, only vertical motion has been considered so
far~@ranganath_nayak_contact_1972@perret-liaudet_resonance_1998@perret-liaudet_response_2006.
Thus, most existing theoretical approaches to vibrational transport
focus on the material point model.

Depending on the problem parameters, the particle can either stay in
permanent contact with the substrate or undergo multiple jumps (hopping
motion). Material point dynamics has been extensively explored
in~@blekhman_vibrational_1964 for both permanent contact and hopping
cases, considering a specific kind of vibrations and for various
vertical and horizontal restitution coefficients. Motion induced by a
traveling Rayleigh wave has been studied by~@verma_particle_2013 using a
similar approach.

As for the hopping material point, its normal motion has been analyzed
by several researchers in terms of stability. In particular, the
derivation in~@luck_bouncing_1993 showed that, depending on the
situation, the vertical motion of a point mass jumping on the vibrating
surface can be stable or chaotic. A typical example of stable motion is
periodic hopping, where rebounds occur every $n$ wave periods at the
same phase. In contrast, in the case of dynamic chaos, rebounds are not
synchronized with the wave period and therefore can occur at any phase.
Introducing tangential motion leads to particle drift in the stable
case, as tangential contact interactions produce horizontal velocity
increments of the same sign, resulting in coherent velocity
accumulation. However, when the normal motion is chaotic, the tangential
motion is also chaotic, since the velocity increments are uncorrelated.

Another peculiar type of point mass' vertical motion is chattering,
i.e.~multiple rebounds with rapidly decaying amplitude. When the
rebounds are not perfectly elastic, it is possible to observe even
complete chattering or locking, where an infinite number of impacts with
decreasing amplitude occur within a finite time. Sometimes chattering
alternating with flights of $n$ wave periods duration leads to a stable
trajectory~@luck_bouncing_1993. Some periodic trajectories with $n = 1$
may transition to chaos~@luo_dynamics_1996.

A curious case of tangential drift of a point mass is observed on a
vertically oscillating wavy platform having a sinusoidal
profile~@halev_bouncing_2018. In this regime called "walking motion",
the horizontal speed of the point mass equals the profile wavelength
divided by the platform oscillation period. Partially inelastic
collisions with the platform are required for the effect to emerge.

The authors of ~@ragulskis_transport_2008 consider a situation where a
point mass falls on a platform in which a Rayleigh wave is excited.
Depending on systems' parameters such as restitution coefficients
characterizing rebounds, viscosity of air, particle's mass, wave
frequency and amplitude, as well as the initial coordinate and velocity
of the particle, a variety of dynamic regimes are observed. These
regimes include chaotic and regular jumps, as well as chattering finally
transforming into permanent contact. It is also shown that chaos can
appear by the transition from periodic jumping through period doubling.

Accounting for the deformability of the contact system introduces new
effects. Analytical results for a vertical motion of a Hertzian
particle~@hertz_uber_1881@landau_theory_1986 on an oscillating platform
revealed the existence of a contact
resonance~@ranganath_nayak_contact_1972. At frequencies much lower than
the resonance one, the rigid particle approximation remains valid.
However, near resonance and at higher frequencies, the dynamics of a
deformable sphere differ significantly. In addition, a second-order
subharmonic resonance exists for the Hertzian
particle~@perret-liaudet_response_2006. In this case, excitation at
twice the resonant frequency is converted to the fundamental frequency
through a specific nonlinear process. A second-order superharmonic
resonance, typical of nonlinear systems, has also been
reported~@perret-liaudet_resonance_1998.

A numerical model~@morita_simulation_1999 for the horizontal motion of a
normally deformable sphere on a substrate supported by a Rayleigh wave
suggested that motion against the wave is possible for a specific system
configuration (geometry, materials, wave frequency and amplitude). The
model also explained the observed accelerated motion with eventual
velocity saturation~#footnote[However, this model disregards transitions
to the stick state and contains a sign error in the expression for
sliding friction force, which calls its results into question.].

In this paper, we intend to take a step forward by considering the
normal and tangential motion of a deformable particle. The tangential
behavior of the contact system is described using the Method of Memory
Diagrams (MMD, see~@aleshin_method_2015@delrue_two_2018) a recent
generalization of the Cattaneo-Mindlin (also called the Hertz-Mindlin)
solution~@cattaneo_sul_1938@mindlin_elastic_1953. This solution links
contact forces and displacements for the contact of two spheres under
constant normal compression followed by tangential loading. The presence
of friction in the form of the Coulomb friction law results in a partial
slip~an annular region of slip propagating inward from the contact
boundary, while a circular interior remains stuck (see
also~@jager_axi-symmetric_1995). The MMD~@aleshin_method_2015 extends
this solution to construct a semi-analytical formalism applicable to
excitation by an oblique shift with an arbitrary time dependence. In
addition to partial slip, the MMD extension~@delrue_two_2018 also
describes total sliding, as well as contact loss (particle detachment).
The model is quasi-statical, neglecting the inertia of the strained
material near the contact and related impact effects.

Other representatives of a semi-analytical family of methods in contact
mechanics include the method of dimensionality reduction
~@popov_method_2015@popov_handbook_2019. The approach is based on a
mathematical mapping of the contact problem onto contact between a rigid
body and a set of equally spaced springs. Applied to a variety of cases,
the approach has also been used for an approximate description of the
impact of an elastic sphere with an elastic
half-space~@willert_impact_2016.

For both the deformable particle and material point models, the normal
component of the particle-substrate collision is assumed to be
conservative to limit the number of system parameters. The tangential
component of contact interaction is lossy and hysteretic due to
friction.

Similarly to the point-mass model, the deformable contact system
exhibits both continuous contact and bouncing modes. However, the
account for deformability significantly alters the particle's behavior.
In the continuous contact mode, the deformable particle can drift in the
direction of the wave and against it. The mechanism in this case can be
called asymmetric sliding and consists in the alternation of advancing
and receding stages having different sliding paths during each wave
period. At the same time, we found for the point mass that these paths
in the opposite directions equilibrate, therefore no drift occurs. In
the bouncing (hopping) mode, the point mass experiences a chaotic
behavior when all subsequent flight times and, consequently, wave phases
during collisions are different. As a result, the tangential momentums
received by the particle due to the frictional interaction at the
moments of collisions are not correlated. For the deformable particle,
this chaotic situation also occurs; however, an autostabilizing regime
may emerge when the times of flight match the wave period. Phased
tangential momentums produce drift that is demonstrated to be against
the wave. Experimental observations of drift against the wave
direction~@morita_simulation_1999@bao_transport_2009@takizawa_manipulation_2021@behera_design_2019
indicate that the incorporation of deformability is essential to
accurately describe vibrational transport.

This paper is organized as follows. The problem of a particle on a
substrate excited by a traveling Rayleigh wave is formulated in
Section~@sec:equations, followed by the description of the contact model
in Section~@sec:MMD. In Section~@sec:results, possible motion modes are
presented via phase diagrams, similar
to~@blekhman_vibrational_1964@verma_particle_2013, together with typical
trajectory examples. Section~@sec:conclusions deals with various drift
mechanisms and comparison of the deformable particle and material point
models. Some practical recommendations for vibrational transport and
dust-cleaning systems are also given. Our earlier results were reported
in~@aleshin_contact_2025@terzi_hopping_2025.

= Governing equations for a deformable axisymmetric particle on a substrate excited by the Rayleigh wave<sec:equations>
Here we consider a deformable particle posed on a deformable substrate
in which a traveling harmonic Rayleigh wave is excited. Unlike a
material point, this particle has a finite size and can undergo various
types of motion. However, the Cattaneo-Mindlin model on which our
approach is based accounts only for translational degrees of freedom,
excluding rolling, tilting, and torsion. Following these restrictions,
we write equations of motion for the coordinates $x \( t \)$ and
$y \( t \)$ assuming that the other degrees of freedom are either not
excited or constrained by the chosen experimental geometry (e.g., using
three agglomerated particles or a truncated sphere). Denoting the normal
and tangential components of the contact force as $N$ and $T$,
respectively, the equations of motion take the form (see
@fig:problem_formulation)

#figure(layout(size => contact-geometry(size.width * .95)),
  caption: [
    Geometry of a deformable particle moving on a substrate in which a
    Rayleigh wave is excited. $x$ and $y$ are the coordinates of the
    particle in the laboratory reference frame, $b$ and $a$ are its
    displacements relative to the moving
    substrate.
  ]
)
<fig:problem_formulation>

$ m dot.double(x) & = - T upright(" ,")\
m dot.double(y) & = M g - N upright(" .") $<eq:motion>

Here the term $M g$ accounts for gravity and a possible external
pre-compression force $P$ which may, for instance, be of electrostatic
nature: $ M g = m g + P upright(" ,") $

where $m$ is the actual mass of the particle and $M$ is a parameter with
the dimension of the mass. The contact force $T$ is equal in magnitude
and opposite in direction to the friction force, following the classical
convention used by~@mindlin_elastic_1953.

The contact force components ($N$, $T$) induce contact displacements
($a$, $b$) defined relative to an initial unstrained state. In the
presence of an acoustic wave with displacement components ($u_x$,
$u_y$), the particle's coordinates ($x$, $y$) in the laboratory frame of
reference are given by

$ x & = u_x + b upright(" ,")\
y & = u_y + a upright(" .") $<eq:xbya>

Here, $a$ and $b$ can be interpreted as coordinates of the particle in
the reference frame attached to the substrate which itself moves
according to the prescribed wave displacements ($u_x$, $u_y$) relative
to the laboratory reference frame. The displacements in a Rayleigh
wave~@viktorov_rayleigh_1966 are determined as

#block[
$ u_x \( t \) & = - A_y r \( nu \) sin \( 2 pi f t - k_R x \) approx - A_y r \( nu \) sin \( 2 pi f t \) upright(" ,")\
u_y \( t \) & = A_y cos \( 2 pi f t - k_R x \) approx A_y cos \( 2 pi f t \) upright(" .") $<eq:rayleigh>

]
where the ratio of horizontal to vertical ($A_y$) amplitudes is given by
$ r \( nu \) = frac(k_R (1 - frac(2 q_R s_R, k_R^2 + s_R^2)), q_R (1 - frac(2 k_R^2, k_R^2 + s_R^2))) $

with
$ {q_R^2 = k_R^2 - k_l^2 upright(", ") s_R^2 = k_R^2 - k_t^2 upright(", ")\
k_l = frac(2 pi, c_l) upright(", ") k_t = frac(2 pi, c_t) upright(" .") $

Here, $c_l$ and $c_t$ are longitudinal and transverse wave velocities in
the substrate material, respectively.

In Eq.~@eq:rayleigh, $k_R x$ is neglected
since, as we shall see in Section~@sec:horizontal, the typical distance
traveled by the particle during one wave period is much smaller than the
Rayleigh wavelength.

Equations of motion~@eq:motion must be
supplemented with initial conditions. A natural choice for these would
be to start from the rest state, given by:

$  & x = dot(x) = 0 upright(" ,")\
 & y = a_0 upright(", ") dot(y) = 0 upright(" .") $<eq:initial>

where $a_0$ is the normal displacement created by the static force $M g$
in the absence of the wave.

However, this definition contradicts the stationary form of
Eq.~@eq:rayleigh for the Rayleigh wave that
assumes no rest state. To mitigate this controversy, we use a ramp
function:

$ Gamma \( t \) = 1 - e^(- t^2 / tau^2) $

to turn the wave on progressively from $0$ to a certain amplitude. The
ramp function appears as a factor in Eq.~@eq:xbya,
so that the final form of the Rayleigh wave displacement becomes

$ u_x \( t \) & = Gamma \( t \) A_y r \( nu \) sin \( 2 pi f t \) upright(",")\
u_y \( t \) & = Gamma \( t \) A_y cos \( 2 pi f t \) upright(".") $

The activation time of the ramp function $tau$ should be much longer
than the wave period ($tau gt.double 2 pi \/ f$) to minimize the
non-physical distortion $e^(- t^2 / tau^2)$ in the Rayleigh wave
expression.

To solve the equations of motion, one has to specify the contact forces
as functions of the contact displacements according to the selected
model.

= Force-displacement relationships for an axisymmetric particle<sec:MMD>
The force-displacement relationship consists of normal and tangential
components. The normal one is supposed to be fully reversible and
independent of the tangential one: $ N = N \( a \) . $ For a sphere
compressed against a half-space $N \( a \)$ is given by the classical
Hertz solution. For non-spherical but axisymmetric profiles, the
solution is provided in~@jager_axi-symmetric_1995.

The tangential motion of an axisymmetric particle is governed by the
Cattaneo-Mindlin (also known as Hertz-Mindlin) dynamics. The classical
solution~@cattaneo_sul_1938@mindlin_elastic_1953 applies when the
contact system is first loaded in the normal direction with a force $N$
and then subjected to a tangential force $T$. Normal loading creates a
circular contact zone of radius $c$. After applying $T$, a slip annulus
forms in the region $s < rho < c$, while the central region $rho < s$
remains stuck. If $T$ increases from 0 to $mu N$ (where $mu$ is the
friction coefficient), the slip zone appears and expands inward from the
periphery until it reaches the center ($rho = 0$), resulting in total
sliding.

An elegant form of the Cattaneo-Mindlin
solution~@jager_axi-symmetric_1995 can be written using the notation
$N_c$ and $a_c$ which stands for the normal force and displacement
required to form a contact zone of radius $c$:

$ T & = T_c^s = mu \( N_c - N_s \) upright(" ,")\
b & = b_c^s = theta mu \( a_c - a_s \) upright(".") $<eq:Tb_nc_ac>

Here $N_s$ and $a_s$ are the force and displacement required to create
contact with the radius $s$, and $theta$ is the ratio of tangential to
normal contact stiffness~@popov_method_2015:

$ theta = frac(frac(\( 2 - nu \) \( 1 + nu \), 2 E) + frac(\( 2 - nu_p \) \( 1 + nu_p \), 2 E_p), frac(1 - nu^2, E) + frac(1 - nu_p^2, E_p)) thin . $<eq:theta>

In the above expression, $E$ and $nu$ are the Young modulus and the
Poisson ratio of the substrate material, respectively, while $E_p$ and
$nu_p$ refer to those of the particle material.

The Method of Memory Diagrams (MMD) is a recent generalization of the
above approach, applicable when the loading history is more complex
(e.g., corresponds to an acoustic excitation). The drive parameters of
the model are the displacements $a$ and $b$, which can evolve
arbitrarily over time. The algorithm operates with complex combinations
of $T_c^s$ and $b_c^s$, incorporating various coefficients $s$ and $c$,
which are stored in memory or erased according to the prescribed rules.
Depending on the loading history and the current displacement values $b$
and $a$, four cases can occur:

+ Partial slip when $s < c$, with $T$ determined by the MMD
  algorithm~@aleshin_method_2015\;

+ Full stick when $s = c$ , with $T$ determined by the MMD
  algorithm~@aleshin_method_2015\;

+ Total sliding when $s = 0$, with $T = "sgn" \( dot(b) \) mu N$\;

+ Contact loss when $c = 0$, with $T = 0$.

The tangential force $T$, calculated according to the above rules, is
denoted here as

$ T = T_(upright("MMD")) \( b \, a \) thin . $

The above expression includes two material constants: the friction
coefficient $mu$ and the stiffness ratio $theta$ (see
Eq.~@eq:theta).

It is convenient to rewrite the equations of motion
Eq.~@eq:motion in the normalized form:

$ m^(*) dot.double(x^(*)) & = - mu T^(*) upright(" ,")\
m^(*) dot.double(y^(*)) & = 1 - N^(*) \( a^(*) \) upright(" ,") $<eq:motion_norm>

and Eq.~@eq:xbya as:

$ theta mu b^(*) & = x^(*) - R^(*) \( t^(*) \) A_y^(*) r \( nu \) sin 2 pi t^(*) upright(" ,")\
a^(*) & = y^(*) - R^(*) \( t^(*) \) A_y^(*) cos 2 pi t^(*) upright(" ,") $<eq:xbya_norm>

in which

$ {N^(*) = N / N_0 upright(" , ") T^(*) = frac(T, mu N_0) upright(" , ") m^(*) = frac(a_0 m f^2, M g) upright(" , ") t^(*) = f t\
\( a^(*) \, x^(*) \, y^(*) \, A_y^(*) \) = frac(\( a \, x \, y \, A_y \), a_0) upright(" , ") b^(*) = frac(b, a_0 theta mu) upright(" , ") med $<eq:normalization>

and $N_0 = N \( a_0 \)$. Here, the normalized ramp function
$Gamma^(*) \( t^(*) \) equiv Gamma \( t \)$.

The initial conditions Eq.~@eq:initial transform
into

$ x^(*) = dot(x)^(*) = 0 upright(" ,")\
y^(*) = 1 upright(" , ") dot(y)^(*) = 0 upright(".") $<eq:initial_norm>

An important advantage of the normalized
equations~@eq:motion_norm,~@eq:xbya_norm,~@eq:initial_norm
is that they contain only two principal parameters: $m^(*)$,
representing the effective mass, and $A_y^(*)$, representing the wave
amplitude. The other parameters, $theta$, $mu$, and $nu$, can be
considered as material constants. In this work, we do not distinguish
between static and dynamic friction coefficients.

In practice, typical Poisson's ratios range from
$nu_(upright("min")) = 0.1$ to $nu_(upright("max")) = 0.4$, which
corresponds to a relatively narrow band of $theta$-values between 1.0555
and 1.3333. The numerical results of this paper are obtained for a
realistic value of $theta$ = 1.2; slight variations in $theta$ do not
considerably affect the results. At the same time, the friction
coefficient $mu$ varies over a broader range, from 0.01 to 1, in a wide
variety of practical cases~@serway_physics_1996.

Eqs.~@eq:motion_norm
and~@eq:xbya_norm with initial conditions
Eq.~@eq:initial_norm have been numerically
solved using the $4^(t h)$-order Adams-Bashforth
method~@hairer_solving_2000. This method performs explicit time stepping
from known values defined on four previous time steps, in contrast to
common algorithms of Runge-Kutta type, which use only one previous time
step but require knowledge of intermediate values defined between time
grid nodes. Examples of various motion regimes for specific values of
the essential parameters $m^(*)$ and $A_y^(*)$ are given below. However,
before presenting these results, the normal contact problem should first
be solved.

= Results<sec:results>
== Vertical motion of a Hertzian particle
<vertical-motion-of-a-hertzian-particle>
The normal problem for two elastic axisymmetric bodies is solved
in~@galin_contact_1961@jager_axi-symmetric_1995. The Hertz solution for
the normal force-displacement relationship between two spheres in
contact is a particular case and is given by~@popov_method_2015
$ N \( a \) = cases(delim: "{", 4 / 3 E^(*) R^(* 1 \/ 2) (a / 2)^(3 \/ 2) \, & upright("if ") a > 0, 0 \, & upright("if ") a lt.eq 0 upright(" .")) $
with the effective modulus $E^(*)$ and radius $R^(*)$ defined as

$ {2 / E^(*) = frac(1 - nu^2, E) + frac(1 - nu_p^2, E_p) upright(" ,")\
2 / R^(*) = 1 / R + 1 / R_p upright(" .") $<eq:ERstar>

Here, $E_p$ and $nu_p$ are Young's modulus and Poisson's ratio of the
particle material, and $R_p$ denotes the radius of the particle. The
second body is a half-space with radius $R = oo$, and the Hertz solution
becomes

$ N \( a \) = cases(delim: "{", 2 / 3 E^(*) R^(* 1 \/ 2) (a / 2)^(3 \/ 2) \, & upright("if ") a > 0 ., 0 \, & upright("if ") a lt.eq 0 .) $<eq:Na_sphere_plane>

The normalized version of
Eq.~@eq:motion_norm
$ a^(*) = y^(*) - Gamma^(*) \( t^(*) \) A_y^(*) cos \( 2 pi t^(*) \) $<eq:astar>
describes vertical motion excited by the normalized normal force

$ N^(*) \( a^(*) \) = cases(delim: "{", a^(* 3 \/ 2) \, & upright("if ") a^(*) > 0 ., 0 \, & upright("if ") a^(*) lt.eq 0) $<eq:Na_norm>

with the initial conditions
Eq.~@eq:initial_norm. Note that the
contact system determined by
Eqs.~@eq:motion_norm,~@eq:astar,~@eq:Na_norm,~@eq:initial_norm
is perfectly elastic (lossless).

#figure(placement: auto, scope: "parent", image("source/Figures/fig2_vertical_motion_final.pdf"),
  caption: [
    Phase diagrams for (a) deformable particle (Hertzian sphere) and (b)
    material point with domains corresponding to two modes of vertical
    motion: jumping and permanent contact. The boundary between the
    domains (black curve) is obtained numerically in (a) and
    analytically in (b), following~@verma_particle_2013. Fundamental,
    subharmonic and superharmonic resonances are indicated by horizontal
    dashed lines in (a); in (b) there are no resonances. The inclined
    dashed line in (a) corresponds to the black line in (b) and is
    included for comparison. 
  ]
)
<fig:vertical>

Equations~@eq:motion_norm,~@eq:astar,~@eq:Na_norm,~@eq:initial_norm
can easily be solved numerically. There are two possibilities for a
particle governed by these equations: to remain in contact with the
substrate throughout the observation time or to detach from it when
$a^(*)$ becomes negative. Obviously, if a detachment occurs at some
amplitude $A_y^(*)$, it will also occur for any higher amplitude.
Therefore, for any normalized mass $m^(*)$, there exists a unique
threshold amplitude $A_y^(* \( J \))$ that separates the jumping and
permanent contact regimes in the $\( A_y^(*) \, m^(*) \)$ functional
space. The delimiting curve $A_y^(*) = A_y^(* \( J \)) \( m^(*) \)$ has
been obtained numerically using the 4$""^(t h)$ order Runge-Kutta method
for a deformable sphere (see @fig:vertical\(a)).

The curve $A_y^(*) = A_y^(* \( J \)) \( m^(*) \)$ exhibits several
minima corresponding to the resonances of the Hertzian sphere: the
fundamental contact resonance~@ranganath_nayak_contact_1972, the
2$""^(n d)$ order subharmonic resonance~@perret-liaudet_resonance_1998,
the 2$""^(n d)$ order superharmonic
resonance~@perret-liaudet_response_2006, and higher-order superharmonic
resonances. The fundamental resonance occurs at $m^(*) = m_c^(*)$ that
approximately equals~3.69 × 10⁻², where $A_y^(* \( J \)) \( m^(*) \)$
reaches a minimum of approximately~5.4 × 10⁻³. This implies that even at a
very low wave amplitude, the particle starts jumping. This resonance
phenomenon can be explained as follows. In a steady state
$\( Gamma^(*) \( t^(*) \) equiv 1 \)$, the equation of motion
Eq.~@eq:motion_norm can be linearized
by assuming that $N^(*) \( a^(*) \)$ oscillates around its mean value of
1 which is determined by gravity and pre-compression. Introducing

$ xi = y^(*) - 1 upright(", ") \| xi \| lt.double 1 $ yields the basis
for this linearization.

The equation of motion then takes the form 
$ m^(*) dot.double(xi) = 1 - (1 + xi - A_y^(*) cos(2 pi t^(*)))^(3/2) . $ <eq:motion_xi>


Further, by assuming that the wave amplitude is also small,
$\| A_y^(*) lt.double 1 \|$,
Eq.~@eq:motion_xi can be linearized by
keeping only first-order terms: 
$ dot.double(xi) + (omega_0^(*))^2 xi = frac(3 A_y^(*), 2 m^(*)) cos(2 pi t^(*)) , $ <eq:motion_xi_lin>
 where the natural frequency of free oscillations
equals
$ omega_0^(*) = sqrt(frac(3, 2 m^(*))) thin . $<eq:Hertz_frequency>

The harmonic oscillator
Eq.~@eq:motion_xi_lin is in resonance
when the natural frequency is tuned to the external source frequency
$2 pi$, which finally leads to
$m_c^(*) = frac(3, 8 pi^2) approx$~3.8 × 10⁻², a value close to the
numerically obtained result, $m_c^(*) approx$~3.69 × 10⁻².

A remarkable feature of Hetzian particle motion is the subharmonic
resonance. Using the method of multiple scales
(see~@perret-liaudet_response_2006), it was shown that exciting the
Hertzian contact at twice the fundamental frequency $omega_0$ (given in
Eq.~@eq:Hertz_frequency) leads to
steady-state oscillations at $omega_0$.

Other peaks of the delimiting curve in @fig:vertical\(a) correspond
to higher-order superharmonic resonances at frequencies $n omega_0$.
This multiple resonance behavior arises from the elastic force being a
nonlinear function of displacement (with a power $3 \/ 2$ for the
Hertzian contact; other cases are considered in~@nayfeh_response_1983).
More analytical results on the normal motion of harmonically excited
Hertzian contacts can be found
in~@ranganath_nayak_contact_1972@hess_normal_1991@perret-liaudet_resonance_1998@perret-liaudet_response_2006.

For a material point on an undeformable substrate, the analogous
delimiting curve can be found analytically~@verma_particle_2013. The
zones of permanent contact and of jumping/hopping are depicted in
@fig:vertical\(b), separated by a straight line on a double
logarithmic scale that exhibits no resonances. A notable property of the
rigid contact system is that even at an infinitely small amplitude,
there exists a frequency range in which the particle detaches. In other
words, in the presence of high-frequency noise, the point mass cannot
remain at rest and jumps all the time. In contrast, a deformable
particle cannot jump at an infinitely small amplitude
(see~@fig:vertical\(a)).

Nayak showed that for a Hertzian sphere, when $m^(*) > m_c^(*)$, the
deformability of the contact system significantly affects its behavior,
whereas for $m^(*) lt.double m_c^(*)$, the deformability is
negligible~@ranganath_nayak_contact_1972. This conclusion is confirmed
by the delimiting curves in @fig:vertical\(a) and (b), which nearly
coincide at low $m^(*)$ but differ considerably at high $m^(*)$.

In the next section, we explore possible horizontal motion types for a
deformable particle both in the permanent contact
(Section~@sec:contact_def, cases 1-3) and in hopping modes
(Section~@sec:jump_def, cases 4-8), and compare them to the behaviors of
a material point (Section~@sec:mp, cases 9-10).

== Horizontal motion modes<sec:horizontal>
A synthetic result of our entire study is presented in
@fig:velocity_MMD. Without detailing the trajectories and
mechanisms of horizontal motion (discussed in depth below), this figure
illustrates its efficiency, defined as the total distance covered
divided by the observation time. In other words, @fig:velocity_MMD
shows the average dimensionless horizontal velocity,
$chevron.l v_x^(*) chevron.r$ with
$v_x^(*) = frac(upright("d") x^(*), upright("d") t)$, plotted over the
functional space $\( A_y^(*) \, m^(*) \)$ for the deformable contact
system (a) and the rigid one (b).

#figure(placement: auto, scope: "parent", image("source/Figures/figure3MarinaV2.pdf"),
  caption: [
    Dimensionless tangential velocity (see
    Eq.~@eq:colormap) of a deformable
    Hertz-Mindlin sphere (a) and a material point (b) in the functional
    space $\( A_y^(*) \, m^(*) \)$, averaged over 2000 wave periods. Red
    and blue colors represent motion in the direction of wave
    propagation and against it, respectively. Points with
    $\| v_x^(*) \| < v_0^(*)$
    (Eq.~@eq:colormap) are shown in white. The
    solid line separates permanent contact motion from hopping. Here,
    $mu = 0.3$. Numbers 1 indicate different motion types discussed
    below. 
  ]
)
<fig:velocity_MMD>

Across different values of $A_y^(*)$ and $m^(*)$, the average horizontal
velocity varies in a wide range. To efficiently represent this range,
the logarithmic scale is used. Specifically, the color-coded quantity
$C$ shown in @fig:velocity_MMD is defined as follows:

$ C = cases(delim: "{", frac(log_10 \( v_x^(*) \/ v_0^(*) \), max_(v_x^(*) > 0) #scale(x: 300%, y: 300%)[\[] log_10 \( v_x^(*) \/ v_0^(*) \) #scale(x: 300%, y: 300%)[\]]) upright(",") & upright("if ") v_x^(*) > v_0^(*) upright(" ,"), 0 upright(",") & upright("if ") - v_0^(*) lt.eq v_x^(*) lt.eq v_0^(*) upright(" ,"), frac(- log_10 \( - v_x^(*) \/ v_0^(*) \), max_(v_x^(*) < 0) #scale(x: 300%, y: 300%)[\[] log_10 \( - v_x^(*) \/ v_0^(*) \) #scale(x: 300%, y: 300%)[\]]) upright(",") & upright("if ") v_x^(*) < - v_0^(*) upright(" .")) $<eq:colormap>
Positive and negative velocities are plotted in red and blue,
respectively. The parameter $v_0^(*)$ determines the contrast in
@fig:velocity_MMD. A higher value of $v_0^(*)$ highlights only the
most efficient drifts, filtering out slower motions. In contrast, a
lower $v_0^(*)$ reveals a broader range of velocities, including
moderate and weak drift. Here, we use a relatively low value
$v_0^(*) = 0.1$, to capture nearly all drift cases, even those with low
efficiency.

It is now appropriate to justify the omission of the term $k_R x$ in
Eq.@eq:rayleigh introduced in
Section~@sec:equations. This can be done by comparing the highest drift
velocity $\| v_x^(*) \| tilde.op med$~×~10#super[3] at point 4
($m^(*) = 1$, $A_y^(*) = 10^2.5$) in @fig:velocity_MMD with the
Rayleigh wave speed. Using
Eqs.~@eq:normalization, the dimensional
drift velocity for a deformable particle is given by:

$ v_x = a_0 f v_x^(*) upright(" .") $

Assuming no pre-compression ($m = M$) and substituting typical values
for a spherical steel particle (density
$rho_p = 8000$~$upright("kg") \/ upright("m")^3$, $E_p = 200$~GPa,
$nu_p = 0.3$, $R_p = 10^(- 3)$~m) on a glass substrate (density
$rho = 2500$~$upright("kg") \/ upright("m")^3$, $E = 70$~GPa,
$nu = 0.3$), we obtain $a_0 approx med$9 × 10⁻¹⁰~m and $f approx 10^5$~Hz
that corresponds to a physical drift velocity
$v_x approx 9$~$upright("cm") \/ upright("s")$. This is about 5 × 10⁴ times
lower than the Rayleigh wave speed in glass with the above parameters,
$c_R approx$~4600~m/s. This example shows that even a rapidly drifting
particle does not experience a significant wave phase shift during its
motion.

The functional diagrams in @fig:velocity_MMD\(a) and (b) reveal a
number of remarkable features. First, in the permanent contact regime,
the deformable particle can drift in both directions (points 1 and 2),
while the point mass experiences no drift (point 9). Second, in the
jumping mode, a deformable particle can drift against the direction of
wave propagation (points 4, 5, and 6), or fall into a "motley" zone
(point 8) of chaotic motion, where small variations in $A_y^(*)$ or
$m^(*)$ lead to changes in drift direction. These motley regions
indicate sensitivity to initial conditions and are directly related to
the stability of motion. In contrast, for a point mass, no consistent
drift is observed in the jumping regime; the entire jumping motion zone
appears motley. Finally, large portions of the permanent contact zone
for the deformable particle are white, indicating negligible or absent
horizontal motion.

In the following, various motion modalities are examined in greater
detail using examples labeled 1-10 in the diagrams in
@fig:velocity_MMD.

=== Deformable particle in permanent contact<sec:contact_def>
#heading(level: 4, numbering: none)[#strong[1) Drift against the wave.]]
<drift-against-the-wave.>
#figure(placement: auto, scope: "parent", image("source/Figures/Fig4_against_lgAy-0.3_lgm1_draft_Sunday-1.pdf"),
  caption: [
    Drift against the direction of wave propagation for a deformable
    particle in permanent contact (example for $A_y^(*) = 10^(- 0.3)$,
    $m^(*) = 10^1$\; point 1 in @fig:velocity_MMD). (a) Normal
    displacements $a^(*) \( t^(*) \)$ and $y^(*) \( t^(*) \)$. (b)
    Tangential displacements $b^(*) \( t^(*) \)$ and
    $x^(*) \( t^(*) \)$. (c) Fragments of the above curves. The
    advancing stage corresponds to total sliding at low compression,
    while during the receding stage the particle remains stuck at least
    partially. (d) Normal and tangential forces $N^(*) \( t^(*) \)$,
    $T^(*) \( t^(*) \)$, and horizontal velocity
    $dot(b^(*)) \( t^(*) \)$ relative to the substrate. During total
    sliding, both $T^(*)$ and $dot(b^(*))$ are negative, resulting in
    negative drift direction. 
  ]
)
<fig:against>

Motion of this type corresponds to a vertical blue band in the
functional diagram @fig:velocity_MMD\(a), located to the left of
the black delimiting curve (point 1), where $m^(*) > m_c^(*)$. The
corresponding particle dynamics is illustrated in
@fig:against\(a)(d).

Panel (a) in @fig:against illustrates the vertical motion. When the
particle mass exceeds the resonance value $m_c^(*)$, the particle
deformability effect becomes important, as demonstrated
in~@ranganath_nayak_contact_1972. For such a "heavy" particle, the
oscillation amplitude of the vertical contact displacement
$a^(*) \( t^(*) \)$ substantially exceeds the oscillation amplitude of
the coordinate $y^(*) \( t^(*) \)$. This means that, because of its
greater inertia, the heavy particle tends to deform rather than move.

Panel (c) in @fig:against shows a fragment of these two curves,
highlighting a significant contrast between the maximum and minimum
normal loads. The tangential contact displacement $b^(*) \( t^(*) \)$,
also shown in the same plot, exhibits advancing and receding stages
occurring at low and high compression, respectively. At low compression,
the particle fully slides on the substrate with no stick ($s = 0$),
whereas at high compression slip is only partial ($0 < s < c$) or absent
($s = c$). The alternating advancing and receding stages~referred here
to as #emph[asymmetric sliding]~result in a global drift of the particle
along the substrate (see the fragment of $x^(*) \( t^(*) \)$ in panel
(c) or the entire curve in panel (b)). This phenomenon resembles snake
locomotion, as it is based on alternating stick and slip phases
occurring at high and low compression, respectively.

After completing a set of numerical experiments, we established two
conditions necessary for the existence of drift in the permanent contact
case. First, there must be a strong contrast between low and high normal
compression (as in the $N^(*) \( t^(*) \)$ or $a^(*) \( t^(*) \)$
curves) that allows full sliding during the advancing stage and
suppresses it during the receding stage. Second, the tangential force
$T^(*)$ must maintain a consistent sign during the low compression
phase. Under these conditions, total sliding occurs, with its direction
determined by the sign of $T^(*)$.

Indeed, in the full sliding state, the Coulomb friction law reads
$T = "sgn" \( dot(b) \) mu N$. The efficiency of the relative motion is
determined by $dot(b)$. During the low compression phase, $dot(b)$
should be highly positive or highly negative (see
@fig:against\(d)); otherwise, drift will not occur. This implies
that drift requires a specific phase relationship between forces $N$ and
$T$, which can be seen as the system's response to external excitation
in terms of wave displacements $u_x \( t \)$, $u_y \( t \)$.

#figure(placement: auto, scope: "parent", image("source/Figures/Fig5_with_lgAy-2.7_lgm1_draft_Sunday-1.pdf"),
  caption: [
    Drift in the wave propagation direction for a deformable particle in
    permanent contact with a substrate (example for $A_y^(*) = 10^1$,
    $m^(*) = 10^(- 2.7)$ \; point 2 in @fig:velocity_MMD)). (a)
    Normal displacements $a^(*) \( t^(*) \)$ and $y^(*) \( t^(*) \)$.
    (b) Tangential displacements $b^(*) \( t^(*) \)$ and
    $x^(*) \( t^(*) \)$. (c) Fragments of the above curves. Advancing in
    the positive direction occurs during the low compression phase
    (local minimum of $a^(*) \( t^(*) \)$) under total sliding. (d)
    Normal and tangential forces $N^(*) \( t^(*) \)$,
    $T^(*) \( t^(*) \)$, and horizontal velocity
    $dot(b^(*)) \( t^(*) \)$ relative to the substrate. During total
    sliding, both $T^(*)$ and $dot(b^(*))$ are positive, resulting in
    positive drift direction.
  ]
)
<fig:with>

#heading(level: 4, numbering: none)[#strong[2) Drift with the wave.]]
<drift-with-the-wave.>
In this situation, the particle globally drifts in the direction of the
wave propagation via the same mechanism as in the previous case. To
observe this regime, parameters $m^(*)$ and $A_y^(*)$ must be located in
the red zone just below the delimiting line in
@fig:velocity_MMD\(a) (point 2). The external action ($A_y^(*)$)
must be strong enough to create a pronounced contrast between high and
low compression. Here, however, the particle is "light"
($m^(*) < m_c^(*)$) ), which means it tends to move rather than deform.

This is evident in @fig:with\(a), where the oscillation amplitude
of $a^(*)$ is considerably lower than that of $y^(*)$. Thus, to achieve
the required contrast between the loaded and unloaded phases, the wave
amplitude $A_y^(*)$ must be higher than in the previous case (heavy
particle).

As previously, horizontal motion relies on the existence of advancing
and receding stages (panel~(c)). However, its direction is opposite, as
the tangential force $T$ is positive during the low-compression phase
(see @fig:with\(d)).

Cases 1 and 2 may be suitable for applications that require fine
particle positioning, as the typical horizontal velocity is low,
$\| v^(*) \| tilde.op 10^0$.

#figure(placement: auto, scope: "parent", image("source/Figures/Fig6_weak_lgAy-0.3_lgm-3_draft_Sunday-1.pdf"),
  caption: [
    No drift for a deformable particle in permanent contact with a
    substrate ($A_y^(*) = 10^(- 0.3)$, $m^(*) = 10^(- 3)$\; point 3 in
    @fig:velocity_MMD). (a) Normal displacements
    $a^(*) \( t^(*) \)$ and $y^(*) \( t^(*) \)$. (b) Tangential
    displacements $b^(*) \( t^(*) \)$ and $x^(*) \( t^(*) \)$. (c)
    Fragments of the above curves. (d) Normal and tangential forces
    $N^(*) \( t^(*) \)$, $T^(*) \( t^(*) \)$, and horizontal velocity
    $dot(b^(*)) \( t \)$ relative to the substrate. The contrast between
    high and low load is weak, preventing total sliding. The particle
    oscillates around its initial position without exhibiting horizontal
    drift. 
  ]
)
<fig:weak>

#figure(placement: auto, scope: "parent", image("source/Figures/Fig7_levitation_lgAy0_lgm2.5_draft_Sunday-1.pdf"),
  caption: [
    Synchronous jumping (example for $A_y^(*) = 10^2.5$,
    $m^(*) = 10^0$\; point 4 in @fig:velocity_MMD). (a) Vertical
    displacements in the laboratory frame $y^(*) \( t^(*) \)$ and
    substrate frame $a^(*) \( t^(*) \)$\; note that $y^(*) \( t^(*) \)$
    remains nearly constant (hovering effect). (b) Horizontal
    displacements in the laboratory frame $x^(*) \( t^(*) \)$ and
    substrate frame $b^(*) \( t^(*) \)$. (c) Fragments of the above
    curves showing two rebound events (negative $a^(*)$). (d) Normal and
    tangential forces $N^(*) \( t^(*) \)$, $T^(*) \( t^(*) \)$ exhibit
    strong peaks during rebounds, while $dot(b^(*))$ is positive.
    
  ]
)
<fig:hovering>

#heading(level: 4, numbering: none)[#strong[3) No drift.]]
<no-drift.>
As shown earlier, certain conditions must be met for drift to occur. For
completeness, a no-drift case is presented in @fig:weak (point 3 in
@fig:velocity_MMD). In @fig:weak\(b), the absence of global
drift is evident: both $x^(*) \( t^(*) \)$ and $b^(*) \( t^(*) \)$
oscillate around 0.

Here, the contrast between highly and weakly loaded loaded stages is
insufficient to create the advancing and receding effects. As shown in
@fig:weak\(c) and (d), both $a^(*)$ and $N^(*)$ evolve around their
mean value of 1. The total sliding regime necessary for horizontal drift
does not appear (see @fig:weak\(c)). During the low compression
phase, $T^(*)$ oscillates around 0 with a low amplitude, resulting in no
clear drift direction.

To observe drift, the contrast between loading and unloading must be
greater than in point 3 of @fig:velocity_MMD. This can be achieved
either by increasing the amplitude $A_y^(*)$ or by increasing the
effective mass $m^(*)$ which effectively means softening the contact
system i.e. making it more deformable. In the latter case, the current
amplitude ($A_y^(*) = 10^(- 0.3)$) may be sufficient to induce drift.

=== Deformable particle in the jumping mode<sec:jump_def>
#heading(level: 4, numbering: none)[#strong[4) Synchronous jumping.]]
<synchronous-jumping.>
In this regime, the particle repeatedly jumps on the substrate with
exactly one rebound per wave period, every time occurring in the same
phase. In other words, the rebounds are synchronized with the wave
(@fig:hovering\(c)). At each collision, the upward motion of the
substrate imparts vertical momentum to the particle, compensating for
the gravitational descent during flight. As a result, there is no net
vertical motion; the particle "hovers" at a height approximately equal
to the vertical wave amplitude (see $\| y^(*) \| approx 300 = A_y^(*)$
in @fig:hovering\(a) and (c) in the steady regime).

This vertical regime of motion induces an efficient horizontal drift
(see $x^(*) \( t^(*) \)$ in @fig:hovering\(b),(c)). The underlying
mechanism is related to a velocity mismatch between the particle and the
substrate in the horizontal direction during collisions. This mismatch
produces a nonzero $dot(b^(*))$ during contact, generating a Coulomb
friction force (panel (d)).

Friction, in turn, accelerates the particle horizontally during the
total sliding mode (see @fig:hovering\(b)). As a result, the
particle's horizontal velocity during collisions increases and
eventually matches the substrate velocity. This means that finally the
acceleration disappears together with $dot(b)$, and the friction force
becomes negligible.

The direction of drift is determined by the sign of the substrate's
horizontal velocity during rebound events, which occur when the
substrate is near its top position (see $a^(*)$ in
@fig:hovering\(c)). For a Rayleigh wave traveling in the positive
direction, this velocity is negative, resulting in drift in the opposite
(negative) direction.

This motion modality is well suited for applications such as dust
cleaning, as the resulting horizontal velocity is high,
$v^(*) tilde.op 10^3$. However, it requires a relatively large wave
amplitude $A_y^(*)$.

#heading(level: 4, numbering: none)[#strong[5) Multi-synchronous
jumping.]]
<multi-synchronous-jumping.>
#figure(placement: auto, scope: "parent", image("source/Figures/Fig8_multisyn_lgAy2.5_lgm1.5-1.pdf"),
  caption: [
    Multi-synchronous jumping (example for $A_y^(*) = 10^2.5$,
    $m^(*) = 10^1.5$\; point 5 in @fig:velocity_MMD). (a) Vertical
    displacements in the laboratory frame $y^(*) \( t^(*) \)$ and
    substrate frame $a^(*) \( t^(*) \)$. (b) Horizontal displacements in
    the laboratory frame $x^(*) \( t^(*) \)$ and substrate frame
    $b^(*) \( t^(*) \)$. (c, d) Fragments of normal and tangential
    solutions, respectively, showing a series of synchronous (i.e.,
    occurring once per period) rebounds. (e) Rebounds correspond to
    peaks of the contact forces $N^(*) \( t^(*) \)$,
    $T^(*) \( t^(*) \)$. 
  ]
)
<fig:multisync>

#figure(placement: auto, scope: "parent", image("source/Figures/Fig9_mixed_uniform_lgAy0.25_lgm0.8_draft_Sunday-1.pdf"),
  caption: [
    Combined mechanisms of drift: synchronous jumping and asymmetric
    sliding (example for $A_y^(*) = 10^0.25$, $m^(*) = 10^0.8$\; point 6
    in @fig:velocity_MMD). (a) Vertical displacements in the
    laboratory frame $y^(*) \( t^(*) \)$ and substrate frame
    $a^(*) \( t^(*) \)$. (b) Horizontal displacements in the laboratory
    frame $x^(*) \( t^(*) \)$ and substrate frame $b^(*) \( t^(*) \)$.
    (c) A two-period segment of $x^(*) \( t^(*) \)$,
    $b^(*) \( t^(*) \)$, $a^(*) \( t^(*) \)$, $y^(*) \( t^(*) \)$,
    highlighting the contact phase with stick, partial slip, and total
    sliding regimes (the latter having negligible effect), followed by
    the flight phase. (d) Normal and tangential forces
    $N^(*) \( t^(*) \)$, $T^(*) \( t^(*) \)$, and horizontal velocity
    $dot(b^(*)) \( t^(*) \)$ relative to the substrate.
  ]
)
<fig:sync_jump>

#figure(placement: auto, scope: "parent", image("source/Figures/Fig10_mixed_highFreq_lgAy0_lgm5_draft_Sunday-1.pdf"),
  caption: [
    Combined mechanisms of drift: synchronous jumping and asymmetric
    sliding (example for $A_y^(*) = 10^0$, $m^(*) = 10^5$\; point 7 in
    @fig:velocity_MMD). (a) Vertical displacements in the
    laboratory frame $y^(*) \( t^(*) \)$ and substrate frame
    $a^(*) \( t^(*) \)$. (b) Horizontal displacements in the laboratory
    frame $x^(*) \( t^(*) \)$ and substrate frame $b^(*) \( t^(*) \)$.
    (c) A two-period segment of the above curves, highlighting the
    contact phase with stick, partial slip, and total sliding regimes,
    followed by the flight phase. (d) Normal and tangential forces
    $N^(*) \( t^(*) \)$, $T^(*) \( t^(*) \)$, and horizontal velocity
    $dot(b^(*)) \( t^(*) \)$ relative to the
    substrate.
  ]
)
<fig:mixed_high_freq>

#figure(placement: auto, scope: "parent", image("source/Figures/Fig11_chaotic_lgAy1.7_lgm_-2-1.pdf"),
  caption: [
    Chaotic jumping (example for $A_y^(*) = 10^1.7$,
    $m^(*) = 10^(- 2)$\; point 8 in @fig:velocity_MMD). (a, c)
    Vertical and (b, d) horizontal displacements under slightly
    different activation times $tau$. 
  ]
)
<fig:chaos>

In the synchronous jumping regime, the momentum gained from the
substrate at rebound is compensated by the momentum induced by gravity
during flight. This compensation is generally not perfect, except in
specially optimized cases where $m^(*)$ approaches the subharmonic
resonance at $m^(*) = 4 m_c^(*)$ dashed line in
@fig:velocity_MMD\(a)), which separates the chaotic and synchronous
zones. For $m^(*)$ considerably exceeding $4 m_c^(*)$, $y^(*)$ is not
constant on average but oscillates around $A_y^(*)$ with a low
frequency~much lower than the excitation frequency $f$.

At higher $m^(*)$, the difference between the two momenta increases,
progressively destroying the hovering effect. A further increase in
$m^(*)$ completely breaks the balance and triggers a curious motion type
that can be called multi-synchronous jumping (@fig:multisync). In
this regime, the particle bounces several times (23 in the example shown
in panels (c) and (d)) once per wave period and then detaches for a
longer flight lasting hundreds of periods (panel (a)). Upon landing, the
particle again undergoes a series of synchronous jumps once per period
and then leaves for another long flight of equal duration, making the
process periodic (see the inset in @fig:multisync\(b)).

In this regime, as in the case of synchronous jumping, the horizontal
motion is initially accelerated when the substrate has a higher
horizontal velocity during collisions, then becomes uniform as the
velocities equilibrate. However, since the particle spends hundreds of
periods in the flight, the contact interaction events are rare.
Therefore, the acceleration phase lasts longer, i.e. more time is
required to achieve the steady drift (e.g. 2 million wave periods in the
example shown in @fig:multisync\(b)). Generally, this type of
motion is promising for dust cleaning applications and is especially
suitable for heavy dust particles.

#heading(level: 4, numbering: none)[#strong[6-7) Combined mechanisms of
drift.]]
<combined-mechanisms-of-drift.>
So far, we have identified two mechanisms of drift: one related to
advancing and receding in contact (asymmetric sliding or snake-like
locomotion; see Section~@sec:contact_def (1), (2)), and another driven
by synchronous rebounds that enable horizontal, friction-induced
acceleration. In some cases (points 6 and 7 in @fig:velocity_MMD),
both mechanisms work together. As previously, jumps occur once per
period, allowing consecutive interaction events to produce a coherent
net effect. However, these interaction events are more complex and last
significantly longer compared to those in hovering or multi-synchronous
regimes (approximately 70%% vs. 6%% of the period; see
Figs.~@fig:sync_jump,~@fig:mixed_high_freq vs. @fig:hovering).
During this extended contact phase, the substrate may move both left and
right producing various contact regimes.

In particular, in case 6, during the contact phase
(@fig:sync_jump\(c)), which lasts about 70% of the period, the
particle undergoes stick, partial slip, and total sliding. However,
total sliding is rare, so there is practically no relative motion while
in contact. Meanwhile, relatively short jumps (about 30% of the period)
contribute significantly to the particle's drift. As a result, the
horizontal motion appears uniform (@fig:sync_jump\(b)), since
acceleration can only occur during the contact phase.

In case 7, the mechanisms of asymmetric sliding and synchronous jumping
are again combined, but their overall effect differs. As in the previous
case, the contact phase lasts long (about 90% of the period), and the
particle transitions through all contact regimes. However, unlike
before, the influence of total sliding is no longer negligible. It
occurs in both directions (see @fig:mixed_high_freq\(c)), with
motion in the positive direction prevailing. At the same time, a small
negative increment in $v_x^(*)$ develops at the end of each contact
phase, and $v_x^(*)$ remains negative overall (see
@fig:mixed_high_freq\(b)). As a result, a subsequent jump outweighs
the contribution of the contact phase, producing a small net negative
displacement (@fig:mixed_high_freq\(c)). Moreover, the
$v_x^(*)$-increments generated by asymmetric sliding lead to a globally
accelerated motion. This effect did not appear in the previous case due
to the negligible contribution of total sliding.

Both cases 6 and 7 are suitable for practical vibrational
transportation. In case 6, a moderate uniform drift is observed, while
in case 7, a weak acceleration gradually produces a significant
velocity. These drift effects are observed at relatively low excitation
amplitudes $A_y^(*)$ and may be particularly useful in applications
where higher amplitudes are not experimentally feasible.

#heading(level: 4, numbering: none)[#strong[8) Chaotic jumps.]]
<chaotic-jumps.>
A large region in the functional diagram (@fig:velocity_MMD\(a),
see point 8 as an example) corresponds to a regime of "chaotic" jumps,
where the solution is unstable despite being governed by the
deterministic equations of motion
(Eq.~@eq:motion_norm). This behavior is
illustrated in @fig:chaos for two cases with slightly different
ramp function durations, $tau^(*) = 50$ (a,b) and $tau^(*) = 50.001$
(c,d), respectively. After a few initial rebounds, the trajectories
begin to diverge significantly. Each rebound occurs at a different phase
of the Rayleigh wave, therefore all the subsequent increments in the
horizontal velocity add incoherently, producing a chaotic effect.
Consequently, the specific color of a point in the "motley" region of
@fig:velocity_MMD is essentially meaningless and may vary depending
on the pixel size or time step. As a result, this regime is not suitable
for practical vibrational transportation.

=== Dynamics of a material point <sec:mp>
#figure(placement: auto, scope: "parent", image("source/Figures/mat_point_algo_2.pdf", width: 90.0%),
  caption: [
    Material point model: algorithm describing dynamics on a vibrating
    surface with events 1 outlined. The time moment of event 1 is
    calculated by the bisection method. The time moments of events 2 can
    be refined in the same way.
  ]
)
<fig:MP_algo>

#figure(placement: auto, scope: "parent", image("source/Figures/FIg13_mp_lgm_-4.4_lgAy_2.7.pdf"),
  caption: [
    Symmetric oscillatory sliding of a material point (example for
    $A_y^(*) = 10^2.7$, $m^(*) = 10^(- 4.4)$\; point 9 in
    @fig:velocity_MMD). (a) Normal solution. (b) Tangential
    solution. (c) 2-period fragment of $x^(*) \( t^(*) \)$,
    $b^(*) \( t^(*) \)$, $a^(*) \( t^(*) \)$, $y^(*) \( t^(*) \)$.
    Advancing in the positive and negative directions fully compensate
    each other. (d) Normal and tangential forces $N^(*) \( t^(*) \)$,
    $T^(*) \( t^(*) \)$, and horizontal velocity
    $dot(b^(*)) \( t^(*) \)$ relative to the substrate. The latter
    experiences sudden drops occurring when the transition to stick
    (event 4 in @fig:MP_algo) takes place.
  ]
)
<fig:with_MP>

#figure(placement: auto, scope: "parent", image("source/Figures/Fig14_mp_chaotic_lgAy1.2_lgm_-1-1.pdf"),
  caption: [
    Unstable jumping of a material point (example for
    $A_y^(*) = 10^1.2$, $m^(*) = 10^(- 1)$, point 10 in
    @fig:velocity_MMD). (a, c) Vertical and (b, d) horizontal
    displacements with slightly different activation time
    $tau$.
  ]
)
<fig:chaos_MP>

In contrast to the above results, this section is based on a more
traditional point-mass approach and does not strive for originality. Its
objective is to demonstrate the difference between the dynamics of
deformable and rigid particles, highlighting the importance of
accounting for deformability. @fig:MP_algo illustrates the
implementation details of the material point model.

For a point mass, partial slip regime does not make sense; only
sticking, sliding, and flight may occur. At each time step, the
dynamical variables are updated using known solutions for these regimes.
However, doing so, one can face an anomalous event that produces a
correction to the solution (see events 1 in @fig:MP_algo). Firstly,
if during a flight the particle "penetrates" under the substrate surface
($y > u_y$, event 1), the solution should be corrected by taking into
account a rebound event. Secondly, $N < 0$ during the contact phase
actually means particle's detachment (event 2). Thirdly, during the
stick regime the tangential force calculated using the appropriate
solution may exceed the Coulomb threshold, thus producing the transition
to the sliding regime (event 3). Finally, if during the slip regime the
value of $\| m dot.double(u)_x \|$ becomes lower than $mu N$, then the
external force in the substrate reference frame is not sufficient to
maintain sliding according to the Coulomb's friction law, and the
particle sticks (event 4). For better precision, the moments of the
anomalous events of type 1 are numerically calculated with the bisection
method.

Applying the algorithm in @fig:MP_algo to calculate the point mass'
coordinates, we found three distinct regimes illustrated in
@fig:velocity_MMD\(b): no motion, sliding in both directions with
no drift (point 9), and chaotic jumping (point 10). In diagram
@fig:velocity_MMD\(b), the three corresponding areas are separated
by two curves (straight lines in the double logarithmic space). The
numerical results for these curves are in accordance with their
analytical definitions obtained in~@verma_particle_2013:


$ m^(*) = sqrt(frac(mu^2, mu^2 + r^2 (nu))) frac(1, 4 pi^2 A_y^(*)) , $ <eq:sticking_sliding_condition>
 and 
$ m^(*) = frac(1, 4 pi^2 A_y^(*)) . $ <eq:sliding_jumping_condition>


The authors of~@verma_particle_2013 also provide solutions in the case
of continuous sliding in the band between the lines
Eq.~@eq:sticking_sliding_condition
and
Eq.~@eq:sliding_jumping_condition.
In other words, they neglect possible transitions to stick that may
occur if the external force in the Coulomb friction law becomes lower
than the threshold (event 4 in @fig:MP_algo). In that situation,
drift with the wave and against it is predicted. However, an accurate
account for this possibility considerably changes the particle's
dynamics.

#heading(level: 4, numbering: none)[#strong[9) Symmetric oscillatory
sliding.]]
<symmetric-oscillatory-sliding.>
Our numerical modeling results indicate that for $m^(*)$ in between the
lines
Eq.~@eq:sticking_sliding_condition
and
Eq.~@eq:sliding_jumping_condition
the particle is sliding continuously. Unlike in~@verma_particle_2013,
positive and negative displacements of a particle fully compensate for
each other during each wave period (@fig:with_MP\(c)). Thus,
asymmetric sliding occurring for a deformable particle becomes symmetric
and no drift appears.

Transitions to stick represented as sudden drops of $dot(b)$ in
@fig:with_MP\(d) deserve an additional comment. In order to
instantly stop a particle of mass $m$ moving with velocity $v_x$ at a
moment $t_0$, an infinite force $m v_x delta \( t - t_0 \)$ should be
applied (here $delta$ is the Dirac delta function). In the absence of
other interactions, it can only happen due to friction. However, the
Coulomb friction law does not provide such an opportunity because of its
quasi-static nature. This means that the Coulomb friction model applied
to a material point dynamics should be used with caution.

#heading(level: 4, numbering: none)[#strong[10) Chaotic jumping.]]
<chaotic-jumping.>
First of all, it should be noted that dynamics of a point mass in the
jumping regime is not determined by the Coulomb friction law all the
time, but only before the first detachment. To describe subsequent
rebounds, one has to know a link between particle velocities before and
after collisions. Here we consider fully elastic vertical collisions,
and therefore the link for the normal velocities is known. However, for
the tangential velocity components it is not. This link would exist, for
instance, if during collisions full sliding was guaranteed. Indeed, in
that case one would be able to calculate the tangential momentum change
through the normal one by using the relation $\| T \| = mu N$. But, in a
general case, no physical link between contact forces exists during
instantaneous rebounds of a material point. Alternatively, tangential
interactions can also be considered conservative, but this means that
friction is absent. In this case, the horizontal particle velocity is
not affected by the Rayleigh wave and remains constant.

A usual way to overcome this difficulty is to introduce a horizontal
restitution coefficient $alpha_t$ defined as the ratio between the
tangential velocities after and before the rebound for a stationary
substrate. Note that for a deformable particle described by an MMD-type
model (see Section~@sec:MMD), such an artificial assumption is not
required; the system is entirely governed by the Coulomb friction law.
Here we suppose that $alpha_t < 1$ while the respective normal
restitution coefficient $alpha_n = 1$ for fully elastic vertical
collisions.

An important feature of a point mass in the jumping regime is that the
tangential motion is unstable (see @fig:velocity_MMD\(b)) for any
$alpha_t < 1$. This occurs since the vertical motion is also unstable,
at least for the conservative normal interaction. The chaotic character
of a vertical conservative motion of a material point on a vibrating
substrate has been analytically demonstrated by the authors
of~@luck_bouncing_1993. Indeed, it was shown that at $alpha_n = 1$ a
stable motion is possible only for


$ m^(*) < frac(1, 4 pi^2 A_y^(*)) , $ <eq:stability>


\(see Eq.~2.14 with $alpha = 1$ in there), for any initial conditions.
However, the analytical results~@verma_particle_2013 obtained in the
stationary excitation case similar to the one considered here, indicate
that in the situation Eq.~@eq:stability the
particle does not jump at all. This means that, in our case, stable
jumping solutions for a material point do not exist.

Our numerical computations confirm the above statement (see
@fig:chaos_MP). Indeed, a slight change in the ramp function
activation time produces a completely different solution, similarly to
the case of chaotic jumping of a deformable particle (see case 8 in
Section~@sec:jump_def).

= Discussion<sec:conclusions>
In this paper, we discuss possibilities of tangential drift of a
deformable particle posed on a substrate in which a traveling Rayleigh
wave is excited. Depending on values of two governing parameters
$A_y^(*)$ and $m^(*)$, two situations can be observed. The particle can
stay in permanent contact with the substrate or experience multiple
jumps. It is demonstrated that mechanisms of directed motion are
different in these cases.

In permanent contact, the drift mechanism resembles snake locomotion and
is called here asymmetric sliding. This means that sliding can occur in
both directions during one period, but one of the two sliding paths is
longer. An obvious condition for the asymmetry is a high contrast
between high and low vertical load; at weaker loads sliding is more
efficient. In addition, some phase relationship between the normal and
tangential forces is required. If the tangential force changes sign at
the lowest compression instead of being directed in one of the two
directions, the net horizontal motion is absent. Efficient drift occurs
if the difference in the advancing and receding sliding paths is
significant. Note that sliding may not occur during the receding stage,
whereas it plays a crucial role in generating drift during the advancing
stage.

In the jumping mode, the existence of horizontal drift is fully
determined by the character of normal motion, which can be synchronized
with the wave or chaotic. In the former case, the consecutive particle
rebounds occur in the same wave phase once per period, and particle's
horizontal momentum increments produced by the friction force are summed
up in a coherent way, thus resulting in a drift. In contrast, in the
latter situation, rebounds happen in different wave phases, and
therefore the friction-induced momentum increments are summed up
incoherently. Hence, the tangential particle motion is chaotic as well,
and no drift is observed. In addition, the particle trajectories are
poorly determined by initial conditions.

The original deformable particle model is implemented here with the use
of the Method of Memory Diagrams which originates from the Hertz-Mindlin
solution. We also implemented a traditional material point model moving
on a rigid substrate. The results are essentially different; the
material point in the jumping mode always moves chaotically and never
synchronizes with the wave, at least for fully conservative vertical
redounds. Besides, we have found that in the state of continuous
contact, during each wave period, the material point covers the same
path in the direction of the wave and against it. Generally, the
material point model should be used with caution when applied to dynamic
problems with Coulomb friction. Indeed, Coulomb friction produces
instantaneous transitions to stick when the external force falls below
the threshold $mu N$ but does not provide a proper force that can be
responsible for the instantaneous stops. In the jumping regime, the
Coulomb friction law alone can not explain tangential motion; other
models such as inelastic tangential restitution coefficient should be
used. It is worth noting that the deformable contact model based on the
MMD or other solutions of this class is free from these disadvantages.

Generally, the deformable particle exhibits a wider variety of
directional motion regimes. In addition to asymmetric sliding and
synchronous jumping against the wave, combined motion types can appear.
The contact phase can last for a considerable part of the period (e.g.
30%%) and can comprise all contact regimes (stick, partial slip, total
sliding), which is not possible for a material point always capable of
instantaneous rebound only.

In many cases, an accelerated hopping motion against the wave is
observed; the acceleration disappears when the drift velocity reaches
the horizontal substrate velocity at take-off moments. Accelerated
motion has been experimentally observed
in~@kurosawa_friction_1996@morita_simulation_1999@bao_transport_2009@dunst_vibration-assisted_2018.
Our first experimental results (paper in preparation) also indicate
initially accelerated drift in the direction against the wave, followed
by a uniform motion.

These experimental observations are not reproduced by the point-mass
model, at least in the case of conservative vertical collisions. The
rigid character of the particle-substrate interaction produces other
peculiar effects. For instance, @fig:vertical\(b) shows that a
point mass jumps on a substrate even for an infinitely small wave
amplitude, while a deformable particle does not show this feature
(jumping zone is bounded at small amplitudes in @fig:vertical\(a)).

However, the use of the deformable particle model is associated with
difficulties that do not arise for the material point. Deformability
means a finite size of the particle, which in turn activates rolling,
tilting, and torsion. Such degrees of freedom do not exist for a point.
This means that, in order to perform a detailed theory and experiment
comparison, these motion types should be either disabled experimentally,
or included into the model.

Nevertheless, the results of the deformable particle model (functional
diagram @fig:velocity_MMD\(a)) represent a useful guideline for
experiments on particle manipulation or vibrational transportation. A
point with coordinates ($A_y^(*)$, $m^(*)$) corresponds to a set of wave
and particle parameters for which drift with a certain velocity is
expected. Velocity in @fig:velocity_MMD\(a) varies in a broad range
between $10^0 - 10^1$ for the asymmetric sliding regime and is of order
of $10^3$ for synchronous jumping. In practice, the high-speed
synchronous jumping observable in a wide range of system parameters
(blue area in @fig:velocity_MMD\(a)) can be used for self-cleaning
of vibrating plate-like structures. Asymmetric sliding is considerably
slower but can occur in both directions. This can be of use for precise
particle manipulation. Note, however, that asymmetric sliding happens in
the narrow band of control parameters ($A_y^(*)$, $m^(*)$) making it
challenging to observe experimentally.

A value of the friction coefficient has moderate impact on horizontal
motion. We have observed that lower friction coefficient broadens the
band of asymmetric sliding in @fig:velocity_MMD\(a) and generally
increases its speed. At the same time, in the case of synchronous
jumping, lower $mu$ extends the accelerated motion duration in
@fig:hovering\(b), since the driving friction force becomes lower
in this situation. Conversely, at higher values of $mu$, the final
constant velocity is achieved faster. Note that the value of this
constant velocity is not affected by $mu$ and is approximately equal to
the horizontal substrate velocity during collision events (more
precisely, to the take-off velocity).

There is at least one important question that remains unanswered in the
framework of this paper. Our numerical results indicate zones of
synchronous and chaotic jumping, but do not explain their
configurations. For instance, in @fig:vertical\(a), these zones are
delimited by a value of $m^(*) approx 4 m_c^(*)$ that corresponds to the
subharmonic Hertzian resonance. To explain this fact, a stability
analysis similar to~@luck_bouncing_1993 can be of use. However, to do
that, one needs, for instance, a link between vertical landing and
take-off velocities and the collision time. For a point mass, this
problem does not appear, since the collisions are instantaneous, but
here some information coming from the specific interaction law must be
present. An analytical progress related to a jumping Hertzian particle
description is limited. As for the approximate methods for investigation
of nonlinear systems such as the harmonic balance~@nayfeh_response_1983
or the multiple scale method~@hess_normal_1991, they require a small
parameter which is not obvious to define far from the fundamental Hertz
resonance. Another prospective method of vibrational dynamics analysis
at frequencies higher than the system resonance is the method of direct
separation of motions~@blekhman_effects_2016 that does not require a
small parameter.

#block[
M.~Terzi would like to thank #emph[Institut d'Acoustique - Graduate
School] (IA-GS) of Le Mans University for funding her postdoctoral
research. J.~Ghesquière acknowledges #emph[Hauts-de-France] region,
#emph[Fonds Européen de Développement Régional] (FEDER) and the
University of Lille for funding his PhD studies.

]

#bibliography("source/VibTransport_PhysRevE.bib", style: "american-physics-society")
