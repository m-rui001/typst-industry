#set page(paper:"a4", margin:23mm, numbering:"1")
#set text(font:"Libertinus Serif", size:10.5pt)
#set par(justify:true, leading:.6em)
#set heading(numbering:"1.")
#set math.equation(numbering:"(1)")
#show figure.caption: set text(size:9pt)
#align(center)[
  #text(size:17pt,weight:"bold")[To the theory of helical waveguides]
  #v(.6em)
  A.S. Yurkov
  #v(.5em)
  Omsk scientific center SB RAS, 644024, K.Marksa 15, Omsk, Russia. \
  #link("mailto:fitec@mail.ru")
]

*Abstract.* It makes sense to consider a helical waveguide with a fine pitch approximately, replacing the turns with anisotropic conductivity: infinite along the turns and zero across them. This approach has been known for a long time, but calculation formulas within it have only been obtained for the case where the winding does not contain a dielectric core. This paper addresses this gap in the theory: calculation formulas are obtained for the case where the waveguide contains a dielectric with a certain permittivity and magnetic permeability. An equation determining the slowing factor is found, and a method for its numerical solution is proposed. Explicit formulas are obtained for the wave impedance.

= Introduction
<introduction>
Helical waveguides are structures important for practical applications.
In particular, such waveguides are used as structural components of
antennas (see, for example, @5069229@aslan2023study) and resonators (for
example, @826851@spencer1987review). Furthermore, a single-layer
inductor can be considered as a section of such a waveguide, which
automatically accounts for possible parasitic resonances.

The general theory of spiral structures is quite complex due to the fact
that in this case, the variables involved in Maxwell's equations are not
separable @pierce1947theory. From a fundamental standpoint, separability
of variables is not a necessary condition; Maxwell's equations can
always be solved numerically on a grid, especially since many
appropriate software packages are currently available. However, this
approach requires extremely large computational resources, especially in
situations where the spiral pitch is small and there are many turns.

At the same time, for the limiting case of a small helix pitch, when a
direct numerical solution is problematic, an approximate approach
@corum2001rf is known. This approach is based on replacing the helix
turns with a surface with anisotropic conductivity: along the turns the
conductivity is infinite, and across them it is zero. This approximation
is valid if the wavelength (taking into account its slowing down in the
waveguide) is much greater than the helix pitch. This approach, despite
being known for a long time, is still actively cited in more modern
works @oh2013extremely@wang2022capacitively@martines2021helical.

In the work cited above @corum2001rf assumed that the coil was
surrounded by a medium with unit permittivity and permeability
(essentially air). However, in reality, a dense coil of thin conductor
is most often wound on a frame with a permittivity different from unity.
It can also be filled with ferrite or another magnetic material. Under
these conditions, theory @corum2001rf requires modification. The
development of such a modified theory is the goal of this paper, and
here we restrict ourselves to the case where the coil frame is solid.

= Representation of a spiral waveguide wave as a superposition of $H$- and $E$-waves
<representation-of-a-spiral-waveguide-wave-as-a-superposition-of-h--and-e-waves>
We consider a circular dielectric rod made of a material with relative
permittivity $epsilon$ and magnetic permeability $mu$. The radius of the
rod is denoted by $R$. The rod is wound with a single-layer winding with
a pitch $h$, the thickness of which we neglect (accounting for the
thickness is in any case impossible within the framework of our
approximation). Outside the rod there is a medium with properties close
to a vacuum (for example, air), so outside the rod $epsilon = mu = 1$.
Cartesian coordinate axis $z$ goes along the rod axis, $x$ and $y$ axes
directed arbitrary. We will also use a cylindrical coordinate system
$z \, alpha \, rho$, where $rho$ is the radial coordinate, $alpha$ is
the polar angle.

It is well known that if an electromagnetic wave is proportional to
$e^(- j k z)$ along one of the spatial coordinates, in our case $z$ (the
waveguide case), then the transverse components of the field are
reflected through the longitudinal ones. The only exception to this rule
are purely transverse $T$-waves, for which the longitudinal components
are zero. Obviously, the case of a $T$-wave does not apply to a helical
waveguide, since the turns along which the electric field is zero are
inclined with respect to the waveguide axis. From this, we can conclude
that in the case considered here, the waves are either $E$-waves, or
$H$-waves, or a superposition of these two types of waves. It will
become clear below that it is precisely the third, and only the third
case is realized.

In the case of time dependence of the form $tilde.op e^(j omega t)$, the
longitudinal components of the waves in the waveguide satisfy
two-dimensional homogeneous Helmholtz equations:

$ (frac(partial^2, partial x^2) + frac(partial^2, partial y^2)) E_z + \( epsilon mu k_0^2 - k^2 \) E_z = 0 thin \, $

$ (frac(partial^2, partial x^2) + frac(partial^2, partial y^2)) H_z + \( epsilon mu k_0^2 - k^2 \) H_z = 0 thin \, $

$ k_0^2 = epsilon_0 mu_0 omega^2 thin \, $

where $epsilon_0$ and $mu_0$ are the electric and magnetic constants,
respectively. In addition, outside the waveguide, we must substitute
$epsilon = mu = 1$. In the $E$-wave, $H_z = 0$ (the trivial solution of
any linear homogeneous equation), and in the $H$-wave, $E_z = 0$. In the
general case, which will be realized in a spiral waveguide,
$E_z eq.not 0 eq.not H_z$.

In cylindrical coordinates the equations written above have the
following form:

$ 1 / rho frac(partial, partial rho) (rho frac(partial E_z, partial rho)) + 1 / rho^2 frac(partial^2 E_z, partial alpha^2) + \( epsilon mu k_0^2 - k^2 \) E_z = 0 thin \, $

$ 1 / rho frac(partial, partial rho) (rho frac(partial H_z, partial rho)) + 1 / rho^2 frac(partial^2 H_z, partial alpha^2) + \( epsilon mu k_0^2 - k^2 \) H_z = 0 thin . $

In these equations the variables are separated, and the general solution
can be written immediately:

$ E_z = C_E e^(j n alpha) Z_n \( gamma rho \) thin \, $

$ H_z = C_H e^(j n alpha) Z_n \( gamma rho \) thin \, $

where $C_E$ and $C_H$ are constants to be determined later,
$gamma = sqrt(\| epsilon mu k_0^2 - k^2 \|)$, $Z_n$ is one or another
cylindrical function of the $n$-th order, either ordinary or modified
depending on the sign of $epsilon mu k_0^2 - k^2$ (modified if the sign
is negative). Here we restrict ourselves to the fundamental azimuthal
mode, which has a zero cutoff frequency, which is most interesting for
practice (and for sufficiently low frequencies, which is the only one
possible). Therefore, in what follows, $n = 0$.

Outside the waveguide, i.e., for $rho > R$, the wave should attenuate
with increasing radial coordinate. Only in this case is a channeled wave
obtained. Therefore, $k_0^2 - k^2 < 0$ (i.e., outside the waveguide, the
wave should be slow), and outside the waveguide the MacDonald function
$K_0 \( rho sqrt(k^2 - k_0^2) \)$ should be taken as the cylindrical
function. It cannot be ruled out a priori that, unlike the case of an
unfilled waveguide, inside, depending on the dielectric parameters, not
only a slow but also a fast wave may be produced (fast relative to free
waves in such a dielectric, but still slow relative to waves in free
space). Accordingly, as a cylindrical function we must take either the
modified Bessel function $I_0 \( rho sqrt(k^2 - epsilon mu k_0^2) \)$,
or the ordinary Bessel function
$J_0 \( rho sqrt(epsilon mu k_0^2 - k^2) \)$. In each of these cases,
the value under the square root must be positive.

To summarize, we can write the following representations for the
longitudinal components of the field in our case. For the case of a slow
wave inside a waveguide:

$ E_z \( rho > R \) = C_(E +) K_0 (rho sqrt(k^2 - k_0^2)) thin \, #h(2em) E_z \( rho < R \) = C_(E -) I_0 (rho sqrt(k^2 - epsilon mu k_0^2)) thin \, $

$ H_z \( rho > R \) = C_(H +) K_0 (rho sqrt(k^2 - k_0^2)) \) thin \, #h(2em) H_z \( rho < R \) = C_(H -) I_0 (rho sqrt(k^2 - epsilon mu k_0^2)) thin . $

For the case of a fast wave inside a waveguide:

$ E_z \( rho > R \) = C_(E +) K_0 (rho sqrt(k^2 - k_0^2)) thin \, #h(2em) E_z \( rho < R \) = C_(E -) J_0 (rho sqrt(epsilon mu k_0^2 - k^2)) thin \, $

$ H_z \( rho > R \) = C_(H +) K_0 (rho sqrt(k^2 - k_0^2)) \) thin \, #h(2em) H_z \( rho < R \) = C_(H -) J_0 (rho sqrt(epsilon mu k_0^2 - k^2)) \) thin . $

Here the constants $C$ are provided with an additional index + (field
outside the waveguide) or - (inside the waveguide).

= Dispersion law
<dispersion-law>
First, we need to determine the dispersion law, that is the dependence
of $k$ on $omega$. As stated above, the field along the turns must be
zero (both outside and inside the winding). From simple geometric
considerations it follows that the field along a turn has two
components: a contribution from $E_alpha$ and a contribution from $E_z$.
The first contribution is proportional to the cosine of the helix angle
$phi.alt$, the second to the sine. Thus,

$ cos phi.alt E_alpha + sin phi.alt E_z\|_(rho = R) = 0 thin . $<Eq:Et>

Or

$ E_alpha + tan phi.alt E_z\|_(rho = R) = 0 thin . $<Eq:Ettg>

Note that these are actually two expressions: it can be applied to both
the field outside the winding and the field inside the winding. The
slope tangent is easily determined from the same geometric
considerations:

$ tan phi.alt = frac(h, 2 pi R) thin . $<Eq:tg>

In total, we have four constants: two amplitudes (for the E- and
H-waves) outside and inside the helix. Two more equations are needed;
they are obtained from the continuity condition of the electric field
component perpendicular to the turns and the continuity condition of the
magnetic field component tangential to the turns (the perpendicular
component of the magnetic field experiences a jump caused by the current
flowing through the winding). Introducing the notation $R_(+)$ for the
limiting value $rho arrow.r R$ outside, and $R_(-)$ inside, we obtain
the following:

$ - sin phi.alt E_alpha + cos phi.alt E_z\|_(rho = R_(+)) = - sin phi.alt E_alpha + cos phi.alt E_z\|_(rho = R_(-)) thin . $<Eq:En>

Taking into account (@Eq:Ettg) this equation gives the continuity of the
component $E_z$ at $rho = R$:

$ E_z\|_(rho = R_(+)) = E_z\|_(rho = R_(-)) thin \, $<Eq:Ezcont>

This condition can replace (@Eq:En). The continuity equation for the
tangential component of the magnetic field has the following form:

$ cos phi.alt H_alpha + sin phi.alt H_z\|_(rho = R_(+)) = cos phi.alt H_alpha + sin phi.alt H_z\|_(rho = R_(-)) thin \, $<Eq:Ht>

It is also convenient to rewrite this equation in terms of the tangent
defined by the equation (@Eq:tg):

$ H_alpha + tan phi.alt H_z\|_(rho = R_(+)) = H_alpha + tan phi.alt H_z\|_(rho = R_(-)) thin . $<Eq:Htt>

The formulas (@Eq:Et), (@Eq:En) and (@Eq:Ht) are easy to understand if
we notice that the matrix

$ mat(delim: "(", cos phi.alt, sin phi.alt; - sin phi.alt, cos phi.alt) $

is nothing but the rotation matrix by an angle $phi.alt$ in
two-dimensional space tangent to the winding.

Now we need to express the components of the fields $E_alpha$,
$H_alpha$, $E_rho$ and $H_rho$ in terms of $E_z$ and $H_z$. Using
Maxwell's equations, we obtain

$ H_alpha = frac(j omega epsilon epsilon_0, k^2 - epsilon mu k_0^2) frac(partial E_z, partial rho) thin \, $<Eq:HalphaEz>

$ E_alpha = - frac(j omega mu mu_0, k^2 - epsilon mu k_0^2) frac(partial H_z, partial rho) thin \, $<eq:EalphaHz>

$ H_rho = - frac(k, omega mu mu_0) E_alpha thin \, $<eq:HrhoEalpha>

$ E_rho = frac(k, omega epsilon epsilon_0) H_alpha thin . $<eq:ErhoHalpha>

Using these equalities and substituting the above representation of the
field components through cylindrical functions, we can write the
boundary conditions as a system of linear algebraic equations (SLAE) for
the constants $C_(E +)$, $C_(E_(-))$, $C_(H +)$, and $C_(H -)$. For the
case of slow waves inside the waveguide, we obtain the following:

$ {frac(j omega mu_0, sqrt(k^2 - k_0^2)) C_(H +) K_1 (R sqrt(k^2 - k_0^2)) + tan phi.alt C_(E +) K_0 (R sqrt(k^2 - k_0^2)) = 0 thin \,\
\
- frac(j omega mu mu_0, sqrt(k^2 - epsilon mu k_0^2)) C_(H -) I_1 (R sqrt(k^2 - epsilon mu k_0^2)) + tan phi.alt C_(E -) I_0 (R sqrt(k^2 - epsilon mu k_0^2)) = 0 thin \,\
\
C_(E +) K_0 (R sqrt(k^2 - k_0^2)) - C_(E -) I_0 (R sqrt(k^2 - epsilon mu k_0^2)) = 0 thin \,\
\
frac(j omega epsilon_0, sqrt(k^2 - k_0^2)) C_(E +) K_1 (R sqrt(k^2 - k_0^2)) - tan phi.alt C_(H +) K_0 (R sqrt(k^2 - k_0^2)) +\
\
+ frac(j omega epsilon epsilon_0, sqrt(k^2 - epsilon mu k_0^2)) C_(E -) I_1 (R sqrt(k^2 - epsilon mu k_0^2)) + tan phi.alt C_(H -) I_0 (R sqrt(k^2 - epsilon mu k_0^2)) = 0 thin . $<EQ:SysI0>

This is a homogeneous SLAE. Its solvability condition is the equality to
zero of the corresponding determinant, which yields an equation defining
$k$ as a function of $k_0$. In fact, this is the dispersion equation,
defining the dependence of $k$ on $omega$ (an implicit dependence,
through the quantity $k_0$ proportional to $omega$). The dispersion
equation can also be obtained in a different equivalent way by
successively expressing some quantities of $C$ in terms of others. In
this particular case, the second method is more convenient due to the
special form of the SLAE (@EQ:SysI0).

Before writing the dispersion equation, it is convenient to introduce
new variables:

$ xi = k / k_0 thin \, $

$ W_0 = sqrt(mu_0 / epsilon_0) thin \, $

$ A = R k_0 = frac(2 pi R, lambda) thin \, $

where $lambda$ is the wavelength of a free electromagnetic wave with
angular frequency $omega$, propagating in free space. The quantity $W_0$
is the wave impedance of free space, the dimensionless quantity $xi$
indicates how many times the phase velocity of the wave in the waveguide
is less than the wave velocity in free space, and the meaning of $A$ is
obvious from the formula. In this notation, the SLAE (@EQ:SysI0) takes
the following form:

$ {frac(j W_0, sqrt(xi^2 - 1)) C_(H +) K_1 (A sqrt(xi^2 - 1)) + tan phi.alt C_(E +) K_0 (A sqrt(xi^2 - 1)) = 0 thin \,\
\
- frac(j W_0 mu, sqrt(xi^2 - epsilon mu)) C_(H -) I_1 (A sqrt(xi^2 - epsilon mu)) + tan phi.alt C_(E -) I_0 (A sqrt(xi^2 - epsilon mu)) = 0 thin \,\
\
C_(E +) K_0 (A sqrt(xi^2 - 1)) - C_(E -) I_0 (A sqrt(xi^2 - epsilon mu)) = 0 thin \,\
\
frac(j, W_0 sqrt(xi^2 - 1)) C_(E +) K_1 (A sqrt(xi^2 - 1)) - tan phi.alt C_(H +) K_0 (A sqrt(xi^2 - 1)) +\
\
+ frac(j epsilon, W_0 sqrt(xi^2 - epsilon mu)) C_(E -) I_1 (A sqrt(xi^2 - epsilon mu)) + tan phi.alt C_(H -) I_0 (A sqrt(xi^2 - epsilon mu)) = 0 thin . $<Eq:sys1>

By successively eliminating various $C$ in this SLAE, we obtain three
formulas that will be needed further,

$ C_(E -) = C_(E +) frac(K_0 (A sqrt(xi^2 - 1)), I_0 (A sqrt(xi^2 - epsilon mu))) thin \, $#label("Eq:CE-viaCE+")

$ C_(H -) = - C_(H +) frac(sqrt(xi^2 - epsilon mu), mu sqrt(xi^2 - 1)) dot.op frac(K_1 (A sqrt(xi^2 - 1)), I_1 (A sqrt(xi^2 - epsilon mu))) thin \, $#label("Eq:CH-viaCH+")

$ C_(E +) = - C_(H +) frac(j W_0, tan phi.alt sqrt(xi^2 - 1)) dot.op frac(K_1 (A sqrt(xi^2 - 1)), K_0 (A sqrt(xi^2 - 1))) thin \, $#label("Eq:CE+viaCH+")

and the solvability condition of the SLAE, which determines the
dispersion law,

$ mu sqrt(xi^2 - epsilon mu) K_1^2 (A sqrt(xi^2 - 1)) I_0 (A sqrt(xi^2 - epsilon mu)) I_1 (A sqrt(xi^2 - epsilon mu)) -\
\
- mu tan^2 phi.alt \( xi^2 - 1 \) sqrt(xi^2 - epsilon mu) K_0^2 (A sqrt(xi^2 - 1)) I_0 (A sqrt(xi^2 - epsilon mu)) I_1 (A sqrt(xi^2 - epsilon mu)) +\
\
+ epsilon mu sqrt(xi^2 - 1) I_1^2 (A sqrt(xi^2 - epsilon mu)) K_0 (A sqrt(xi^2 - 1)) K_1 (A sqrt(xi^2 - 1)) -\
\
- tan^2 phi.alt dot.op \( xi^2 - epsilon mu \) sqrt(xi^2 - 1) dot.op I_0^2 (A sqrt(xi^2 - epsilon mu)) K_0 (A sqrt(xi^2 - 1)) K_1 (A sqrt(xi^2 - 1)) = 0 thin . $<Eq:Sys1m5>

Note that in the particular case $epsilon = mu = 1$ this equation is
radically simplified and can be reduced to a form that completely
coincides with the corresponding equation from @corum2001rf. In the
general case, however, it is not possible to simplify this equation.

Equation (@Eq:Sys1m5) is a transcendental equation, and its analytical
solution is impossible. Apparently, the most suitable numerical method
for solving this equation is the bisection method. The result of such a
solution for certain parameter values is shown in @fig1. It should
be noted that all values in the graphs lie within the applicability
range of the approximate theory under consideration. Indeed, for the
theory to be applicable, the wavelength, taking into account the
deceleration, must be much greater than the winding pitch. The maximum
deceleration factor $xi$ is approximately 160, and the minimum
wavelength in free space is 2 meters. Moreover, the wavelength, taking
into account the deceleration, is approximately 12 mm, which is much
greater than the winding pitch of 1 mm.

#figure([#block[
  #box(image("source/xi.pdf", width: 14cm))
  ]],
  caption: [
    The slowdown coefficient $xi$ depending on the wavelength $lambda$
    for a waveguide with a diameter of 30 mm, with a winding pitch of 1
    mm. 1: $epsilon = mu = 1$\; 2: $epsilon = 5$, $mu = 1$\; 3:
    $epsilon = 1$, $mu = 5$.
  ]
)
<fig1>

To obtain the dispersion equation for the case of fast waves inside a
waveguide, there is no need to repeat all the calculations. It is
sufficient to make the substitutions in (@Eq:Sys1m5)

$ I_0 (A sqrt(xi^2 - epsilon mu)) arrow.r J_0 (A sqrt(epsilon mu - xi^2)) thin \,\
\
sqrt(xi^2 - epsilon mu) thin I_1 (A sqrt(xi^2 - epsilon mu)) arrow.r - sqrt(epsilon mu - xi^2) thin J_1 (A sqrt(epsilon mu - xi^2)) thin . $

The result is the following:

$ mu sqrt(epsilon mu - xi^2) K_1^2 (A sqrt(xi^2 - 1)) J_0 (A sqrt(epsilon mu - xi^2)) J_1 (A sqrt(epsilon mu - xi^2)) -\
\
- mu tan^2 phi.alt \( xi^2 - 1 \) sqrt(epsilon mu - xi^2) K_0^2 (A sqrt(xi^2 - 1)) J_0 (A sqrt(epsilon mu - xi^2)) J_1 (A sqrt(epsilon mu - xi^2)) -\
\
- epsilon mu sqrt(xi^2 - 1) J_1^2 (A sqrt(epsilon mu - xi^2)) K_0 (A sqrt(xi^2 - 1)) K_1 (A sqrt(xi^2 - 1)) +\
\
+ tan^2 phi.alt dot.op \( epsilon mu - xi^2 \) sqrt(xi^2 - 1) dot.op J_0^2 (A sqrt(epsilon mu - xi^2)) K_0 (A sqrt(xi^2 - 1)) K_1 (A sqrt(xi^2 - 1)) = 0 thin . $<Eq:DispJ>

Attempts to solve (@Eq:DispJ) using the bisection method showed that,
for the parameters shown in @fig1, real solution to this equation
appears only for very large values of $mu$ and/or $epsilon$. Such
solutions are unlikely to be of significant practical interest.
Therefore, we will not further consider the possibility of fast waves
inside the waveguide, but if necessary, their dispersion law can easily
be found using the formulas written above.

= Electromagnetic field expressed in terms of the current flowing through the winding
<electromagnetic-field-expressed-in-terms-of-the-current-flowing-through-the-winding>
Proceeding in the same way as in the elementary theory of the solenoid,
we can write an equation that relates the jump in the z-component of the
magnetic field and the current I flowing through the winding:

$ H_z\|_(rho = R_(+)) - H_z\|_(rho = R_(-)) = C_(H_(+)) K_0 (A sqrt(xi^2 - 1)) - C_(H_(-)) I_0 (A sqrt(xi^2 - epsilon mu)) = I / h thin . $

Combining this equality with the formulas (#ref(label("Eq:CE-viaCE+"))),
(#ref(label("Eq:CH-viaCH+"))), (#ref(label("Eq:CE+viaCH+"))), we obtain
a SLAE from which all four constants of $C$ can be expressed through
$I$. As a result, we obtain the following representations for the
longitudinal components of the field:

$ H_z \( x > 1 \) = I / h dot.op frac(mu sqrt(xi^2 - 1) I_1 (A sqrt(xi^2 - epsilon mu)), B) dot.op K_0 (x A sqrt(xi^2 - 1)) thin \, $

$ H_z \( x < 1 \) = - I / h dot.op frac(sqrt(xi^2 - epsilon mu) K_1 (A sqrt(xi^2 - 1)), B) dot.op I_0 (x A sqrt(xi^2 - epsilon mu)) thin \, $

$ E_z \( x > 1 \) = - I / h dot.op frac(j mu W_0 K_1 (A sqrt(xi^2 - 1)) I_1 (A sqrt(xi^2 - epsilon mu)), tan phi.alt K_0 (A sqrt(xi^2 - 1)) B) dot.op K_0 (x A sqrt(xi^2 - 1)) thin \, $

$ E_z \( x < 1 \) = - I / h dot.op frac(j mu W_0 K_1 (A sqrt(xi^2 - 1)) I_1 (A sqrt(xi^2 - epsilon mu)), tan phi.alt I_0 (A sqrt(xi^2 - epsilon mu)) B) dot.op I_0 (x A sqrt(xi^2 - epsilon mu)) thin \, $

where

$ B = mu sqrt(xi^2 - 1) I_1 (A sqrt(xi^2 - epsilon mu)) K_0 (A sqrt(xi^2 - 1)) + sqrt(xi^2 - epsilon mu) I_0 (A sqrt(xi^2 - epsilon mu)) K_1 (A sqrt(xi^2 - 1)) thin \, $<eq:B>

and the normalized radial coordinate was introduced:

$ x = rho / R thin . $

Then it only remains to use the formulas (@Eq:HalphaEz), (@eq:EalphaHz),
(@eq:HrhoEalpha), (@eq:ErhoHalpha) and, taking into account that
$partial \/ partial rho = R^(- 1) partial \/ partial x$, after some
algebraic transformations, obtain a representation for the transverse
components of the field:

$ H_alpha \( x > 1 \) = - I / h dot.op frac(mu I_1 (A sqrt(xi^2 - epsilon mu)) K_1 (A sqrt(xi^2 - 1)), sqrt(xi^2 - 1) tan phi.alt K_0 (A sqrt(xi^2 - 1)) B) K_1 (x A sqrt(xi^2 - 1)) thin \, $<eq:Halph-outer>

$ H_alpha \( x < 1 \) = I / h dot.op frac(epsilon mu I_1 (A sqrt(xi^2 - epsilon mu)) K_1 (A sqrt(xi^2 - 1)), sqrt(xi^2 - epsilon mu) tan phi.alt I_0 (A sqrt(xi^2 - epsilon mu)) B) I_1 (x A sqrt(xi^2 - epsilon mu)) thin \, $<eq:Halph-inner>

$ E_alpha \( x > 1 \) = I / h dot.op frac(j W_0 mu I_1 (A sqrt(xi^2 - epsilon mu)), B) K_1 (x A sqrt(xi^2 - 1)) thin \, $<eq:Ealph-outer>

$ E_alpha \( x < 1 \) = I / h dot.op frac(j W_0 mu K_1 (A sqrt(xi^2 - 1)), B) I_1 (x A sqrt(xi^2 - epsilon mu)) thin \, $<eq:Ealph-inner>

$ H_rho \( x > 1 \) = - I / h dot.op frac(j mu xi I_1 (A sqrt(xi^2 - epsilon mu)), B) K_1 (x A sqrt(xi^2 - 1)) thin \, $<eq:Hrho-outer>

$ H_rho \( x < 1 \) = - I / h dot.op frac(j xi K_1 (A sqrt(xi^2 - 1)), B) I_1 (x A sqrt(xi^2 - epsilon mu)) thin \, $<eq:Hrho-inner>

$ E_rho \( x > 1 \) = - I / h dot.op frac(mu xi W_0 I_1 (A sqrt(xi^2 - epsilon mu)) K_1 (A sqrt(xi^2 - 1)), sqrt(xi^2 - 1) tan phi.alt K_0 (A sqrt(xi^2 - 1)) B) K_1 (x A sqrt(xi^2 - 1)) thin \, $<eq:Erho-outer>

$ E_rho \( x < 1 \) = I / h dot.op frac(mu xi W_0 I_1 (A sqrt(xi^2 - epsilon mu)) K_1 (A sqrt(xi^2 - 1)), sqrt(xi^2 - epsilon mu) tan phi.alt I_0 (A sqrt(xi^2 - epsilon mu)) B) I_1 (x A sqrt(xi^2 - 1)) thin . $<eq:Erho-inner>

Note that, according to the given formulas, the components $E_z$,
$E_alpha$, and $B_rho = mu mu_0 H_rho$ on the winding (at $x = 1$) are
continuous, while $E_rho$, $H_z$, and $H_alpha$ experience a jump. This
is as it should be, since the tangential components of the magnetic
field experience a jump due to the presence of the tangential current,
and the normal component of the electric field experiences a jump due to
the presence of charges, the existence of which at a current
$tilde.op e^(j k z)$ is inevitable due to charge conservation. From the
given formulas, the continuity of $E_z$, $E_alpha$, and $B_rho$ is
immediately obvious. It is also immediately obvious that the jump in
$H_z$ has the correct value. In order to ensure the correct value of the
jumps $H_alpha$ and $D_rho = epsilon epsilon_0 E_rho$, it is necessary
to perform some algebraic transformations taking into account the
formulas (@Eq:Sys1m5) and (@eq:B).

= Wave power, wave impedance and equivalent long line
<wave-power-wave-impedance-and-equivalent-long-line>
Using the formulas (@eq:Halph-outer), (@eq:Halph-inner),
(@eq:Hrho-outer), (@eq:Hrho-inner), (@eq:Ealph-outer),
(@eq:Ealph-inner), (@eq:Erho-outer), (@eq:Erho-inner), we can write the
following expressions for the $z$-component $Pi_z$ of the Poynting
vector:

$ Pi_z = "Re" thin 1 / 2 (H_alpha^(*) E_rho - H_rho^(*) E_alpha) thin \, $

$ Pi_z \( x > 1 \) = frac(I^2 mu^2 xi W_0, 2 h^2 B^2) I_1^2 (A sqrt(xi^2 - epsilon mu)) times\
\
times (frac(K_1^2 (A sqrt(xi^2 - 1)), \( xi^2 - 1 \) tan^2 phi.alt K_0^2 (A sqrt(xi^2 - 1))) + 1) K_1^2 (x A sqrt(xi^2 - 1)) thin \, $<eq:Piext>

$ Pi_z \( x < 1 \) = frac(I^2 mu xi med W_0, 2 h^2 B^2) dot.op K_1^2 (A sqrt(xi^2 - 1)) times\
\
times (frac(epsilon mu I_1^2 (A sqrt(xi^2 - epsilon mu)), \( xi^2 - epsilon mu \) tan^2 phi.alt I_0^2 (A sqrt(xi^2 - epsilon mu))) + 1) I_1^2 (x A sqrt(xi^2 - epsilon mu)) thin . $<eq:Pint>

The power $P$ carried by the wave is the integral of $Pi_z$ over
$2 pi rho d rho = 2 pi R^2 x d x$. This power is obviously split into
two terms:

$ P = P_(e x t) + P_(i n t) thin \, $

where $P_(e x t)$ is the power transferred outside the waveguide, and
$P_(i n t)$ is the power transferred inside.

The integrals mentioned above can be found in the literature. For
convenience, we'll write out the corresponding formulas in a slightly
modified form:

$ integral_1^oo K_1^2 \( a t \) t d t = 1 / 2 K_0^2 \( a \) + 1 / a K_0 \( a \) K_1 \( a \) - 1 / 2 K_1^2 \( a \) thin \, $

$ integral_0^1 I_1^2 \( a t \) t d t = 1 / 2 I_1^2 \( a \) + 1 / a I_0 \( a \) I_1 \( a \) - 1 / 2 I_0^2 \( a \) thin . $

In accordance with this, the following is obtained:

$ P_(e x t) = 1 / 2 I^2 W_(e x t) thin \, $

$ P_(i n t) = 1 / 2 I^2 W_(i n t) thin \, $

where

$ W_(e x t) = frac(2 pi R^2 mu^2 xi W_0, h^2 B^2) I_1^2 (A sqrt(xi^2 - epsilon mu)) (frac(K_1^2 (A sqrt(xi^2 - 1)), \( xi^2 - 1 \) tan^2 phi.alt K_0^2 (A sqrt(xi^2 - 1))) + 1) times\
\
times (1 / 2 K_0^2 \( A sqrt(xi^2 - 1) \) + frac(1, A sqrt(xi^2 - 1)) K_0 \( A sqrt(xi^2 - 1) \) K_1 \( A sqrt(xi^2 - 1) \) - 1 / 2 K_1^2 \( A sqrt(xi^2 - 1) \)) thin \, $

$ W_(i n t) = frac(2 pi R^2 mu xi med W_0, h^2 B^2) dot.op K_1^2 (A sqrt(xi^2 - 1)) (frac(epsilon mu I_1^2 (A sqrt(xi^2 - epsilon mu)), \( xi^2 - epsilon mu \) tan^2 phi.alt I_0^2 (A sqrt(xi^2 - epsilon mu))) + 1) times\
\
times (1 / 2 I_1^2 (A sqrt(xi^2 - epsilon mu)) + frac(1, A sqrt(xi^2 - epsilon mu)) I_0 (A sqrt(xi^2 - epsilon mu)) I_1 (A sqrt(xi^2 - epsilon mu)) - 1 / 2 I_0^2 (A sqrt(xi^2 - epsilon mu))) thin . $

Both $P_(e x t)$ and $P_(i n t)$ are proportional to the same square of
the current amplitude. Therefore, the total power is also proportional
to this square. The resulting formula is completely identical to the
formula for the power transferred along a line with characteristic
impedance.

$ W = W_(e x t) + W_(i n t) thin . $

So this sum is the wave impedance of the waveguide.

When considering radio engineering problems, a waveguide can be replaced
by a line with such a characteristic impedance. It's important to
remember that, unlike a conventional line, the characteristic impedance
of such an equivalent line varies for different frequencies. The voltage
$U$ in the wave traveling along such a line can also be introduced using
the obvious formula

$ U = plus.minus W I thin \, $

where the plus sign should be taken for the incident wave, and the minus
sign for the reflected wave. Naturally, the deceleration factor must be
taken into account.

Figure 2 shows graphs of wave resistance as a function of wavelength in
free space, for the same parameters as in Figure 1. For other
parameters, this resistance can be calculated using the formulas given
above.

#figure([#block[
  #box(image("source/w.pdf", width: 14cm))
  ]],
  caption: [
    Wave impedance $W$ depending on wavelength $lambda$ for a waveguide
    with a diameter of 30 mm, with a winding pitch of 1 mm. 1:
    $epsilon = mu = 1$\; 2: $epsilon = 5$, $mu = 1$\; 3: $epsilon = 1$,
    $mu = 5$.
  ]
)
<fig2>

= Conclusion
<conclusion>
This paper examines the approximate theory of a helical waveguide for
the case where the waveguide contains a dielectric with a certain
permittivity and magnetic permeability. A dispersion equation is derived
that determines the wave slowing coefficient. This equation is
transcendental, so its analytical solution is not possible. However, its
numerical solution by dividing a segment into halves presents no
significant problem, as demonstrated in several specific examples.
Closed analytical expressions are obtained for all components of the
electromagnetic field. All these components are proportional to the
current flowing through the winding. The power channeled by such a
waveguide is considered. In this section, closed analytical formulas are
also obtained; although rather cumbersome, they are quite suitable for
practical calculations. In practical radio engineering problems, such a
waveguide can be replaced by an equivalent long line with parameters
that can be determined from the results of this paper. It is important
to remember that these parameters, unlike those of a real line, depend
on frequency.

The work was financed in accordance with the state assignment of the
Omsk Scientific Center of the Siberian Branch of the Russian Academy of
Sciences (state registration number of the project 125013101211-4).

#bibliography("source/The-utf8.bib",style:"ieee")
