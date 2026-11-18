#set document(title: "Scaling law for the slow flow of an unstable mechanical system coupled to a nonlinear energy sink")
#set page(paper: "a4", margin: (x: 25mm, y: 28mm), numbering: "1")
#set text(font: "Libertinus Serif", size: 11pt)
#set par(justify: true)
#set heading(numbering: "1.1")
#set math.equation(numbering: "(1)")
#set figure(placement: auto)
#show figure.caption: set text(size: 9.5pt)
#align(center)[
  #text(size: 17pt, weight: "bold")[Scaling law for the slow flow of an unstable mechanical system coupled to a nonlinear energy sink]
  #v(.6em)
  Baptiste Bergeot
  #v(.4em)
  #text(size: 10pt)[INSA CVL, Univ. Orl?ans, Univ. Tours, LaM? EA 7494, F-41034, 3 Rue de la Chocolaterie, CS 23410, 41034 Blois Cedex, France \
  #link("mailto:baptiste.bergeot@insa-cvl.fr")[baptiste.bergeot\@insa-cvl.fr]]
]
#v(.6em)
*Abstract.* In this paper one first shows that the slow flow of a mechanical system with one unstable mode coupled to a Nonlinear Energy Sink (NES) can be reduced, in the neighborhood of a fold point of its critical manifold, to a normal form of the dynamic saddle-node bifurcation. This allows us to then obtain a scaling law for the slow flow dynamics and to improve the accuracy of the theoretical prediction of the mitigation limit of the NES previously obtained as part of a zeroth-order approximation. For that purpose, the governing equations of the coupled system are first simplified using a reduced-order model for the primary structure by keeping only its unstable modal coordinates. The slow flow is then derived by means of the complexification-averaging method and, by the presence of a small perturbation parameter related to the mass ratio between the NES and the primary structure, it appears as a fast-slow system. The center manifold theorem is finally used to obtain the reduced form of the slow flow which is solved analytically leading to the scaling law. The latter reveals a nontrivial dependence with respect to the small perturbation parameter of the slow flow dynamics near the fold point, involving the fractional exponents 1/3 and 2/3. Finally, a new theoretical prediction of the mitigation limit is deduced from the scaling law. In the end, the proposed methodology is exemplified and validated numerically using an aeroelastic aircraft wing model coupled to one NES.

= Introduction
<sec:intro>
The nonlinear energy sinks (NESs) are nowadays well-known devices used
for passive shock and vibration mitigation of undesired oscillations
caused by either external, parametric or self-excitations of a primary
structure. An NES is classically defined as a nonlinear dynamical
attachment consisting of a light mass (compared to the total mass of the
primary structure), an essentially nonlinear spring (most of the time
purely cubic) and a viscous linear damper. The operating of the NES is
based on the phenomenon of targeted energy transfer (TET) through which
a properly designed strongly nonlinear oscillator can be tuned to any
frequency in order to perform an irreversible energy transfer from the
primary structure towards itself. In their seminal
papers~@Gendelman2001@vakakis2001 Gendelman, Vakakis and co-workers
explain the TET phenomenon by the interaction between two nonlinear
modes of vibrations of the system producing a $1$:$1$ resonance capture.
Reviews of these concepts can be found in~@VakatisBook2009 and more
recently in a part of @lu2018.

The use of NES to mitigate limit cycle oscillations (LCOs) stemming from
dynamic instabilities has been widely studied in the past. The first
work reported in this framework concerns the mitigation of LCOs of the
Van der Pol oscillator~@LeeSCHM2006. By means of a perturbation
analysis, Gendelman and Bar @Gendelman2010Phys predicted the response
regimes of the same system. This work has been extended to a Van der
Pol-Duffing oscillator coupled to one NES by Domany and
Gendelman~@domany2013. Numerous papers have been dedicated to the
problem of mitigation, by means of one or several NESs, of LCOs due to
aeroelastic instabilities. The seminal papers are those of Lee et
al.~@LeeAIAApI2007@LeeAIAApI2007b@lee2008 and concerned aeroelastic
instabilities in aircraft wing. In these works, the problem has been
investigated both numerically and experimentally. The same aircraft wing
model coupled to one NES has been studied theoretically using the
so-called complexification-averaging method~@Manevitch1999 together with
a singular perturbation approach~@Gendelman2010SIAM or a perturbation
algorithm based on a mixed multiple scale-harmonic balance method
(MSHBM)~@luongo2014. Vaurigaud et al.~@vaurigaud2011b investigated a
problem of passive nonlinear TET between a two degrees of freedom long
span bridge model prone to coupled flutter and an NES. The mitigation,
using an NES, of vortex-induced vibrations resulting from the nonlinear
interaction of a laminar flow and a rigid circular cylinder has been
first studied by Tumkur et al. ~@Tumkur2013 constructing a two-DOF
reduced-order model of the system and validating it by means of a
comparison with a full order finite-element model. On the same issue, an
improved and experimentally validated reduced model has been proposed by
Dai et al.~@Dai2017. The passive control of helicopter ground resonance
instabilities by a means of NESs has been theoretically and numerically
studied by Bergeot et al. considering an NES attached to the helicopter
fuselage~@Bergeot201672 and to the blades~@Bergeot2017JSV. Chatter
control in machine tool vibrations has been studied by Gourc et
al.~@Gourc2013 considering a vibro-impact NES and by~Nankali et
al.~@nankali2017 considering a purely cubic NES. In @Bergeot2017a,
mitigation of friction-induced vibrations due to mode coupling
instabilities in a friction system has been investigated. The use of
several NESs to mitigate LCOs has been analytically investigated by
Bergeot et Bellizzi. First, a network of parallel NESs coupled to a Van
der Pol oscillator has been analyzed in~@Bergeot2018 and then the
prediction of the steady-state regimes of a multi-DOF dynamical system
having one unstable mode and coupled to a set of NESs has been performed
in~@bergeot2019. Finally, in a recent paper, the possibility of
mitigating simultaneously two unstable modes of a linear multi-DOF
primary system using a single NES has been investigated by Bergeot et
al.~@BERCNSNS2020. The asymptotic analysis proposed in the latter
reference reveals that the NES attachment can produce several and
complex mitigated responses which results from the presence of several
stable solutions and from the competition between them.

In general, when an NES is attached to a primary structure, the
resulting coupled model is analyzed by introducing a small perturbation
parameter related to the mass ratio between the NES and the primary
structure. Under the assumption of a $1$:$1$ resonance capture, the
system is first averaged over one period corresponding to a natural
frequency of the primary structure. The resulting averaged system,
called #emph[slow flow], is then analyzed by means of singular
perturbation techniques (multiple scales method~@nayfeh2008perturbation
or geometric singular perturbation theory~@Jones1995). The first key
point of these analytical treatments is the partition of the slow flow
into two time scales (one slow and one fast#footnote[Sometimes the terms
“slow\" and “super-slow\"~@Gendelman2010Phys@domany2013 are used to
leave the term “fast\" for the oscillations on which the average was
carried out and therefore to be coherent with term slow flow. In the
present work the terms “slow\" and “fast\" are preferred to be in
agreement with the vocabulary usually used in the literature on
dynamical systems.]). In this representation the time evolution of the
slow flow is thus described as a succession of slow and fast epochs
which are described independently. The second key point is the
definition of the #emph[critical manifold] whose system trajectories
approaches during slow epochs. In general, the analysis is carried out
within the zeroth-order approximation, i.e. within the limit case in
which the perturbation parameter is equal to zero. Consequently, the
obtained analytical results depreciate for the largest values of the
perturbation parameter by thus limiting their predictive power. Luongo
and Zulli~@luongo2014 used a perturbation technique to express the
#emph[invariant manifold] as a power series with respect to the
perturbation parameter in which the first term is the critical
manifold#footnote[The difference between critical and invariant
manifolds will be calrified in the manuscript in
#link(<sec:scallaw>)[4].]. As stated by the Fenichel
theory~@Fenichel1979, this representation is relevant for normally
hyperbolic branch of the critical manifold but fails, at fold points
(the junction between slow and fast epochs takes place in the vicinity
of these points), to approach the actual trajectory of the system.
Indeed, the literature on dynamical systems shows that the trajectory
passes through the region near these fold points with a nontrivial
scaling behavior with respect to the perturbation parameter that it is
not possible to obtain with the classical perturbation methods (see
e.g.~@bk:khuehn2015 Sect. 5.4).

By means of a sophisticated analysis, the originality of the present
work is to provide an analytical description of the system dynamic
behavior which reports on this nontrivial dependence on the small
perturbation parameter. This analytical result is hereafter referred as
the scaling law of the slow flow, this notion is clarified below within
the main body of the present manuscript. The main objective is to obtain
an analytical description of the system with a high predictive power
compared to what has been proposed in the past in the literature and
then to hope in the future of including them in a NES design procedure.

The equations of motion of the system under study are presented in
#link(<sec:eom>)[2]. The full order model equations of a mechanical
system coupled to one NES are derived in~#link(<sec:IniMod>)[2.1].
Assuming a primary structure with only one unstable mode, the modal
reduction technique, leading to the reduced-order dimensionless model,
is presented in~#link(<sec:red1>)[2.2]. #link(<sec:resultlit>)[3]
summarizes and extends some previous analytical results of the
literature obtained within the zeroth-order approximation.
#link(<sec:scallaw>)[4] expounds the main results of the paper. In
#link(<sec:CMR>)[4.1], the center manifold theorem is used to reduce the
dynamics of the slow flow of the system. This reduced form is solved
analytically in #link(<sec:ThSol>)[4.2] leading to the scaling law from
which a new analytical prediction of the mitigation limit is derived in
#link(<sec:NewAnPred>)[4.3]. In #link(<sec:appl>)[5], the proposed
methodology is exemplified and validated numerically using an
aeroelastic aircraft wing model coupled to one NES. Finally, concluding
remarks are formulated in #link(<sec:ccl>)[6].

= Equations of the model
<sec:eom>
The dynamical system under study in this paper is presented in the
present section. The following developments are similar to those
presented in~@bergeot2019.

== The initial model
<sec:IniMod>
The primary structure under consideration in this work is described by
the following general set of nonlinear differential equations
$ upright(bold(tilde(M))) upright(bold(dot.double(tilde(x)))) + upright(bold(tilde(C))) upright(bold(dot(tilde(x)))) + upright(bold(tilde(K))) upright(bold(tilde(x))) + upright(bold(tilde(g)^(N L) (tilde(x)))) = upright(bold(0)) \, $<eq:systini>
where $upright(bold(tilde(x))) = (tilde(x)_1 \, dots.h \, tilde(x)_N)^T$
with $\( \)^T$ the transpose operator, the dot represents
time-differentiation and $upright(bold(tilde(M)))$,
$upright(bold(tilde(C)))$ and $upright(bold(tilde(K)))$ are the mass
matrix, the damping matrix and the stiffness matrix respectively. The
nonlinear vector-valued function $upright(bold(tilde(g)^(N L)))$
represents the nonlinearity of the primary system. Moreover, cubic
nonlinearities are assumed, i.e. each component of
$upright(bold(tilde(g)^(N L)))$ is a linear combination of monomial
terms of order $3$. In these first equations, the tilde symbol is used
before the rescaling which will be carried out below (to obtain
variables without tilde after rescaling).

System #ref(<eq:systini>) can undergo a dynamic
instability of the trivial solution through a Hopf bifurcation, i.e. it
has a pair of complex conjugate eigenvalues which cross the complex
plane imaginary axis. The loss of stability of the trivial solution
comes with the production of a periodic solution and the nonlinear
function $upright(bold(tilde(g)^(N L)))$ allows the existence of Limit
Cycle Oscillations (LCOs) on which the system can saturate. For the
purpose of mitigating the LCOs, one purely cubic ungrounded NES with
mass $tilde(m)_h$, damping coefficient $tilde(c)_h$ and cubic stiffness
$tilde(k)_h^(upright("NL"))$ is used. Taking into account the NES
displacement $tilde(h) \( t \)$, the equations of the coupled system are
$ upright(bold(tilde(M))) upright(bold(dot.double(tilde(x)))) + upright(bold(tilde(C))) upright(bold(dot(tilde(x)))) + upright(bold(tilde(K))) upright(bold(tilde(x))) + upright(bold(tilde(g)^(N L) (tilde(x)))) + upright(bold(tilde(B))) #scale(x: 180%, y: 180%)[\(] tilde(c)_h (upright(bold(A dot(tilde(x)))) - dot(tilde(h))) + tilde(k)_h^(upright("NL")) (upright(bold(A tilde(x))) - tilde(h))^3 #scale(x: 180%, y: 180%)[\)] & = upright(bold(0))\
tilde(m)_h dot.double(tilde(h)) - tilde(c)_h (upright(bold(A dot(tilde(x)))) - dot(tilde(h))) - tilde(k)_h^(upright("NL")) (upright(bold(A tilde(x))) - tilde(h))^3 & = 0 \, $<eq:systprotec0>
where $upright(bold(A)) = (a_1 \, dots.h \, a_N)$ and
$upright(bold(tilde(B))) = (tilde(b)_1 \, dots.h \, tilde(b)_N)^T$ are
the influence coefficient vectors which depend on the position of the
NES.

One assumes now that the mass $tilde(m)_h$ and the damping coefficient
$tilde(c)_h$ of the NES are small compared to the mass of the primary
structure~#ref(<eq:systini>) and also that the latter
is weakly nonlinear. We therefore introduce a small perturbation
dimensionless parameter $epsilon.alt$ (with
$0 < epsilon.alt lt.double 1$) and the associated rescaled coefficients
$m_h$ and $c_h$ and vector function $upright(bold(g^(N L)))$ as
$tilde(m)_h = epsilon.alt m_h$, $tilde(c)_h = epsilon.alt c_h$ and
$upright(bold(tilde(g)^(N L))) = epsilon.alt upright(bold(g^(N L)))$.
Then, the variables $upright(bold(tilde(x)))$ and $tilde(h)$ are also
rescaled through $epsilon.alt$ as
$upright(bold(x)) = upright(bold(tilde(x))) / sqrt(epsilon.alt)$ and
$h = tilde(h) / sqrt(epsilon.alt)$. Due to the latter rescaling and
because cubic nonlinearities are assumed one has
$upright(bold(g^(N L) \( tilde(x) \))) = epsilon.alt^(3 \/ 2) upright(bold(g^(N L) \( x \)))$.
Inserting $m_h$, $c_h$, $upright(bold(g^(N L)))$, $upright(bold(x))$ and
$h$ into #ref(<eq:systprotec0>), multiplying
#ref(<eq:systprotec0>) by
$upright(bold(tilde(M)))^(- 1)$ and
#ref(<eq:systprotec0>) by
$1 \/ \( epsilon.alt m_h \)$ and finally neglecting terms of order
strictly higher than 1 in $epsilon.alt$ lead to
$ dot.double(upright(bold(x))) + upright(bold(C)) dot(upright(bold(x))) + upright(bold(K)) upright(bold(x)) + epsilon.alt upright(bold(B)) dot.double(h) & = upright(bold(0))\
dot.double(h) - eta_h upright(bold(\( A dot(x))) - dot(h) \) - k_h^(upright("NL")) (upright(bold(A)) upright(bold(x)) - h)^3 & = 0 . $<eq:systprotec4>
with $upright(bold(C)) = tilde(M)^(- 1) tilde(C)$,
$upright(bold(K)) = tilde(M)^(- 1) tilde(K)$,
$upright(bold(B)) = m_h upright(bold(tilde(M)^(- 1) tilde(B)))$,
$eta_h = c_h \/ m_h$ and
$k_h^(upright("NL")) = tilde(k)_h^(upright("NL")) \/ m_h$.

Note that because of the previous assumptions and rescaling, the
nonlinearities of the primary structure are neglected from now.
Therefore, nonlinear modal interactions in the primary structure such as
internal resonances are not taken into account in this work.

== Reduction of the dynamics
<sec:red1>
The system #ref(<eq:systprotec4>) is now reduced
taking into account that the primary system
#ref(<eq:systini>) undergoes a single instability of
the trivial solution. The objective is to obtain a system with two
degrees of freedom (one for the unstable mode of the primary structure
and one for the NES) on which one will be able to carry out an analysis
which would be impossible on a the original system.

To achieve that, it is first convenient to introduce new coordinates
$upright(bold(v)) = upright(bold(x)) + epsilon.alt upright(bold(B)) h$
and $w = h - upright(bold(A)) upright(bold(x))$ giving reciprocally
$ upright(bold(x)) & = \( upright(bold(I)) + epsilon.alt upright(bold(B A)) \)^(- 1) \( upright(bold(v)) - epsilon.alt upright(bold(B)) w \) approx \( upright(bold(I)) - epsilon.alt upright(bold(B A)) \) \( upright(bold(v)) - epsilon.alt upright(bold(B)) w \)\
h & = \( 1 + epsilon.alt upright(bold(A B)) \)^(- 1) \( w + epsilon.alt upright(bold(A v)) \) approx \( 1 - epsilon.alt upright(bold(A B)) \) \( w + epsilon.alt upright(bold(A v)) \) $#label("eq:u&vb")
where $upright(bold(I))$ is the identity matrix of size $N$.

Using #link(label("eq:u&vb"))[\[eq:u&vb\]],
#ref(<eq:systprotec4>) is transformed into the
following form
$ dot.double(upright(bold(v))) + upright(bold(C)) dot(upright(bold(v))) + upright(bold(K)) upright(bold(v)) - epsilon.alt #scale(x: 180%, y: 180%)[\[] upright(bold(C)) upright(bold(B)) (upright(bold(A)) dot(upright(bold(v))) + dot(w)) + upright(bold(K)) upright(bold(B)) (upright(bold(A)) upright(bold(v)) + w) #scale(x: 180%, y: 180%)[\]] & = upright(bold(0))\
dot.double(w) + eta_h dot(w) + k_h^(upright("NL")) w^3 - upright(bold(A C)) dot(upright(bold(v))) - upright(bold(A K)) upright(bold(v)) & +\
epsilon.alt #scale(x: 180%, y: 180%)[\[] upright(bold(A B)) eta_h dot(w) + upright(bold(A C B)) (upright(bold(A)) dot(upright(bold(v))) + dot(w)) + upright(bold(A K B)) (upright(bold(A)) upright(bold(v)) + w) + upright(bold(A B)) k_h^(upright("NL")) w^3 #scale(x: 180%, y: 180%)[\]] & = 0 . $<eq:systprotecuv>
where only terms of order lower or equal to 1 in $epsilon.alt$ were
kept.

To retain only the essential features of the single instability, the
reduction of the dynamics is performed on
#ref(<eq:systprotecuv>). To achieve this, the
latter, is written in state-space form as follows
$ upright(bold(dot(y) = D y)) + epsilon.alt [upright(bold(D_1)) upright(bold(y)) + upright(bold(D_1)) w + upright(bold(D_3)) dot(w)] $<eq:SystY>
where
$upright(bold(y)) = \( v_1 \, dots.h \, v_N \, dot(v)_1 \, dots.h \, dot(v)_N \)^T$,
$ upright(bold(D)) = mat(delim: "(", upright(bold(0)), upright(bold(I))_N; - upright(bold(K)), - upright(bold(C))) \, #h(0em) upright(bold(D_1)) = mat(delim: "(", upright(bold(0)), upright(bold(0)); upright(bold(K B A)), upright(bold(C B A))) \, #h(0em) upright(bold(D_2)) = vec(upright(bold(0)), upright(bold(K B))) #h(0em) upright("and") #h(0em) upright(bold(D_3)) = vec(upright(bold(0)), upright(bold(C B))) . $<eq:matA>

Because the matrix $upright(bold(D))$, which characterizes the linear
dynamics of the primary system, is not symmetric, its diagonalization
must be performed using biorthogonality property of the right
eigenvectors $upright(bold(r))_i$ ($i = 1 \, dots.h \, 2 N$) and the
left eigenvectors $upright(bold(l))_j$ ($j = 1 \, dots.h \, 2 N$) of
$upright(bold(D))$. When the eigenvectors are properly normalized, the
biorthogonality properties consist in
$upright(bold(L))^T upright(bold(D)) R = bold(Lambda)$ where
$upright(bold(R)) = [upright(bold(r))_1 med overline(upright(bold(r)))_1 med dots.h med upright(bold(r))_N med overline(upright(bold(r)))_N]$,
$upright(bold(L)) = [upright(bold(l))_1 med overline(upright(bold(l)))_1 med dots.h med upright(bold(l))_N med overline(upright(bold(l)))_N]$
and
$bold(Lambda) = "diag" \( lambda_1 \, overline(lambda)_1 \, dots.h \, lambda_N \, overline(lambda)_N \)$
are the right and left eigenvector matrices and the eigenvalue diagonal
matrix respectively.

The so-called biorthogonal coordinates are then introduced. They are
constituted of $N$ pairs of complex conjugates, $q_n$ and
$overline(q)_n$ ($n = 1 \, dots.h \, N$), and defined by the following
relations
$ upright(bold(y = R q)) quad upright("and") quad upright(bold(q = L))^T upright(bold(y)) \, $<eq:binormtrans>
where
$upright(bold(q)) = \( q_1 \, overline(q)_1 \, dots.h \, q_N \, overline(q)_n \)^T$.

Substituting #ref(<eq:binormtrans>) into
#ref(<eq:SystY>), the equations of motion take the form
of the following system
$ upright(bold(dot(q) = bold(Lambda) q)) + epsilon.alt upright(bold(L))^T [upright(bold(D_1)) upright(bold(R)) upright(bold(q)) + upright(bold(D_2)) w + upright(bold(D_3)) dot(w)] \, $<eq:SystQ>
and therefore #ref(<eq:systprotecuv>) is
equivalent to
$ upright(bold(dot(q) - bold(Lambda) q)) - epsilon.alt upright(bold(L))^T [upright(bold(D_1)) upright(bold(R)) upright(bold(q)) + upright(bold(D_2)) w + upright(bold(D_3)) dot(w)] & = 0\
dot.double(w) + eta_h dot(w) + k_h^(upright("NL")) w^3 & -\
upright(bold(A C)) \( upright(bold(R))^(upright("DL")) upright(bold(q))^(upright("U")) + upright(bold(R))^(upright("DR")) upright(bold(q))^(upright("D")) \) - upright(bold(A K)) \( upright(bold(R))^(upright("UL")) upright(bold(q))^(upright("U")) + upright(bold(R))^(upright("UR")) upright(bold(q))^(upright("D")) \) & +\
epsilon.alt #scale(x: 180%, y: 180%)[\[] upright(bold(A B)) eta_h dot(w) + upright(bold(A C B)) (upright(bold(A)) \( upright(bold(R))^(upright("DL")) upright(bold(q))^(upright("U")) + upright(bold(R))^(upright("DR")) upright(bold(q))^(upright("D")) \) + dot(w)) & +\
upright(bold(A K B)) (upright(bold(A)) \( upright(bold(R))^(upright("UL")) upright(bold(q))^(upright("U")) + upright(bold(R))^(upright("UR")) upright(bold(q))^(upright("D")) \) + w) + upright(bold(A B)) k_h^(upright("NL")) w^3 #scale(x: 180%, y: 180%)[\]] & = 0 \, $<eq:systprotecqv>
where the matrix $upright(bold(R))$ and the vector $upright(bold(q))$
have been split into a $N times N$-block matrix and a $N times 1$-block
respectively as \$$ bold(R) = mat(delim: "[", bold(R)^"UL", bold(R)^"UR"; bold(R)^"DL", bold(R)^"DR"), quad "and" quad bold(q) = ((bold(q)^"U")^T, (bold(q)^"D")^T)^T $ <eq:updown1>\$ where “U\", “D\", “L\" and “R\" in previous
superscripts must be understood as the initial letters of up, down, left
and right respectively.

As previously mentioned, one mode of the primary system can become
unstable through a Hopf bifurcation. Without loss of generality, the
first mode is chosen to be the potential unstable mode. That means that
when the chosen physical bifurcation parameter, denoted $sigma$, crosses
the particular parameter value $sigma_(upright("Hopf"))$, called
#emph[Hopf bifurcation point], a pair of complex conjugate eigenvalues
crosses the complex plane imaginary axis (without loss of generality
this is first pair $\( lambda_1 \, overline(lambda)_1 \)$) whereas all
the other eigenvalues $\( lambda_n \, overline(lambda)_n \)$ (with
$n = 2 \, dots.h \, N$) have strictly negative real parts.

Neglecting the coupling term
$epsilon.alt upright(bold(L))^T [upright(bold(D_1)) upright(bold(R)) upright(bold(q)) + upright(bold(D_2)) w + upright(bold(D_3)) dot(w)]$,
#ref(<eq:systprotecqv>) reduces to the
diagonalized system
$upright(bold(dot(q))) - bold(Lambda) upright(bold(q)) = 0$. Therefore,
in this case, the variables $q_n$ and $overline(q)_n$
($n = 2 \, dots.h \, N$), related to the stable modes, tend to zero.
When the coupling term (which is of the order of magnitude of
$epsilon.alt$) is taken into account, the variables $q_n$ and
$overline(q)_n$ do not vanish but their contributions are very small and
can be neglected~@Gendelman2010SIAM@bergeot2019@BERCNSNS2020.
Consequently, all terms related to $q_n$ and $overline(q)_n$ (with
$n = 2 \, dots.h \, N$) are omitted from further consideration and
#ref(<eq:SystQ>) is reduced to
$ dot(q)_1 = lambda_1 q_1 + epsilon.alt upright(bold(l))_1^T #scale(x: 180%, y: 180%)[\(] upright(bold(D_1)) \( upright(bold(r))_1 q_1 + overline(upright(bold(r)))_1 overline(q)_1 \) + upright(bold(D_2)) w + upright(bold(D_3)) dot(w) #scale(x: 180%, y: 180%)[\)] . $<eq:SystQ2>

Finally, grouping
#ref(<eq:systprotecqv>), #ref(<eq:SystQ2>),
splitting $lambda_1$ into its real and imaginary parts as
$lambda_1 = lambda_(cal(R)) + j lambda_(cal(I))$ (with $j^2 = - 1$) and
switching the time scale as $t arrow.r lambda_(cal(I)) t$ yield
$ dot(q)_1 - (lambda_(cal(R)) / lambda_(cal(I)) + j) q_1 - epsilon.alt / lambda_(cal(I)) upright(bold(l))_1^T #scale(x: 180%, y: 180%)[\(] upright(bold(D_1)) \( upright(bold(r))_1 q_1 + overline(upright(bold(r)))_1 overline(q)_1 \) + upright(bold(D_2)) w + upright(bold(D_3)) dot(w) #scale(x: 180%, y: 180%)[\)] & = 0\
dot.double(w) + eta_h / lambda_(cal(I)) dot(w) + k_h^(N L) / lambda_(cal(I))^2 w^3 & -\
1 / lambda_(cal(I))^2 (upright(bold(A C)) \( upright(bold(r))_1^(upright("DL")) q_1 + overline(upright(bold(r)))_1^(upright("DL")) overline(q)_1 \) + upright(bold(A K)) \( upright(bold(r))_1^(upright("UL")) q_1 + overline(upright(bold(r)))_1^(upright("UL")) overline(q)_1 \)) & +\
epsilon.alt #scale(x: 180%, y: 180%)[\[] upright(bold(A B)) eta_h / lambda_(cal(I)) dot(w) + 1 / lambda_(cal(I))^2 upright(bold(A C B)) (upright(bold(A)) \( upright(bold(r))_1^(upright("DL")) q_1 + overline(upright(bold(r)))_1^(upright("DL")) overline(q)_1 \) + lambda_(cal(I)) dot(w)) & +\
1 / lambda_(cal(I))^2 upright(bold(A K B)) (upright(bold(A)) \( upright(bold(r))_1^(upright("UL")) q_1 + overline(upright(bold(r)))_1^(upright("UL")) overline(q)_1 \) + w) + upright(bold(A B)) k_h^(N L) / lambda_(cal(I))^2 w^3 #scale(x: 180%, y: 180%)[\]] & = 0 . $<eq:systprotecuvRedf>
where the vectors $upright(bold(r))_1^(upright("UL"))$ and
$upright(bold(r))_1^(upright("DL"))$ correspond to the first columns of
the matrices $upright(bold(R))^(upright("DL"))$ and
$upright(bold(R))^(upright("UL"))$ respectively (see
#ref(<eq:updown1>)).

The system of equations
#ref(<eq:systprotecuvRedf>) is the system
under study in the following mathematical developments.

= Asymptotic analysis: the zeroth-order approximation of the slow flow
<sec:resultlit>
The present section summarizes and extends previous results of the
literature~@Gendelman2010SIAM@Bergeot2018@bergeot2019. In particular, an
analytical expression of the mitigation limit (hereafter called the
zeroth-order approximation of the mitigation limit) is derived at the
end of the section under several assumptions. The first is given just
below.

In #ref(<eq:systprotecuvRedf>), the quantities
$lambda_(cal(R))$, $lambda_(cal(I))$, the vectors
$upright(bold(l))_1^T$, $upright(bold(r))_1$,
$upright(bold(r))_1^(upright("UL"))$ and
$upright(bold(r))_1^(upright("DL"))$ and the matrices
$upright(bold(C))$, $upright(bold(K))$ (and those which depend on them)
depend in general on the bifurcation parameter under
consideration~$sigma$. In this work one assumes that the NES effects are
not too far from the Hopf bifurcation point $sigma_(upright("Hopf"))$
and therefore the latter are evaluated at $sigma_(upright("Hopf"))$
(using the notation $\( \)_(upright("Hopf"))$) expect $lambda_(cal(R))$
which is by definition equal to zero at $sigma_(upright("Hopf"))$.
$lambda_(cal(R))$ is evaluated at the actual value of $sigma$ and the
dimensionless eigenvalue real part $lambda_(cal(R)) \/ omega$ (where
$omega = lambda_(cal(I) \, upright("Hopf"))$, the imaginary part of
$lambda_1$ evaluated at $sigma_(upright("Hopf"))$) is supposed to be
small (i.e. of the order of $cal(O) \( epsilon.alt \)$). The parameter
$rho$ is then finally introduced as
$ rho = frac(lambda_(cal(R)), epsilon.alt omega) $<eq:rhodef> where
$rho$ is of the order of $cal(O) \( 1 \)$.

The rescaled dimensionless eigenvalue real part $rho$ of the unstable
mode is considered as a generalized bifurcation parameter (that results
from the physical bifurcation parameter $sigma$ of the initial
mechanical system) from which one will follow the changes in the system
dynamic behavior.

== Governing equations of the slow flow
<sec:slowflow>
It is know~@Gendelman2001@vakakis2001 that TET appears in the vicinity
of the $1$:$1$ resonance between two nonlinear modes of the coupled
structure, the latter resulting from the interaction between a linear
mode of the primary structure (here this is the considered unstable
mode) and the nonlinear mode of the NES. This phenomenon is called
$1$:$1$ resonance capture and occurs at a frequency close to the natural
frequency of the linear primary structure. To investigate the solution
in the neighborhood of this $1$:$1$ resonance capture the
complexification-averaging method~@Manevitch1999@VakatisBook2009 is
used. The resulting complex averaged dynamics is called slow flow.

The first step consists in introducing the following complex variables
$ psi & = dot(w) + j w $<eq:CAX> or equivalently
$ w = frac(psi - overline(psi), 2 j) \, quad dot(w) = frac(psi + overline(psi), 2) quad upright("and") quad dot.double(w) = dot(psi) - j / 2 (psi + overline(psi)) $<eq:vTOpsi>
and expressing the complex variables $q_1$ and $psi$ as
$ q_1 = tilde(phi.alt)_1 e^(j t) quad upright("and") quad psi = phi.alt_2 e^(j t) . $<eq:SlowFastPart>

Substituting #ref(<eq:SlowFastPart>) into
#ref(<eq:systprotecuvRedf>) and averaging over
the period $T = 2 pi$ leads to the following system of complex slow
modulated amplitudes
$ dot(tilde(phi.alt))_1 & = epsilon.alt [(rho + upright(bold(l))_(1 \, upright("Hopf"))^T upright(bold(D_(1 \, upright("Hopf")))) upright(bold(r))_(1 \, upright("Hopf"))) tilde(phi.alt)_1 + 1 / 2 (- j upright(bold(l))_(1 \, upright("Hopf"))^T upright(bold(D_(2 \, upright("Hopf")))) + upright(bold(l))_(1 \, upright("Hopf"))^T upright(bold(D_(3 \, upright("Hopf"))))) phi.alt_2]\
dot(phi.alt)_2 & = frac(upright(bold(A K_(upright("Hopf")))) upright(bold(r))_(1 \, upright("Hopf"))^(upright("UL")) + upright(bold(A C_(upright("Hopf")))) upright(bold(r))_(1 \, upright("Hopf"))^(upright("DL")), omega^2) tilde(phi.alt)_1 - 1 / 2 (j + mu - j frac(3 alpha, 4) \| phi.alt_2 \|^2) phi.alt_2\
 & - epsilon.alt #scale(x: 300%, y: 300%)[\[] 1 / omega^2 (upright(bold(A K_(upright("Hopf")) B T)) upright(bold(r))_(1 \, upright("Hopf"))^(upright("UL")) + 1 / 2 upright(bold(A C_(upright("Hopf")) B T)) upright(bold(r))_(1 \, upright("Hopf"))^(upright("DL"))) tilde(phi.alt)_1\
 & quad + 1 / 2 (upright(bold(A C_(upright("Hopf")) B)) / omega - j upright(bold(A K_(upright("Hopf")) B)) / omega^2 + upright(bold(A B)) (mu - j frac(3 alpha, 4) \| phi.alt_2 \|^2)) phi.alt_2 #scale(x: 300%, y: 300%)[\]] $<eq:slowcomplex>
with
$ mu = eta_h / omega quad upright("and") quad alpha = k_h^(N L) / omega^2 $<eq:parammualp>
and recalling that the notation $\( \)_(upright("Hopf"))$ means that the
considered quantity is evaluated at the Hopf bifurcation point
$sigma_(upright("Hopf"))$.

Introducing the variable
$phi.alt_1 = 2 (upright(bold(A K_(upright("Hopf")))) upright(bold(r))_(1 \, upright("Hopf"))^(upright("UL")) + upright(bold(A C_(upright("Hopf")))) upright(bold(r))_(1 \, upright("Hopf"))^(upright("DL"))) tilde(phi.alt)_1 \/ omega^2$,
and ignoring the terms of the order of magnitude of $epsilon.alt$ in
#ref(<eq:slowcomplex>)#footnote[These terms do
not affect qualitatively the dynamic behavior of the slow flow.],
#ref(<eq:slowcomplex>) reduces to the following
synthetic form
$ dot(phi.alt)_1 + epsilon.alt [(a - rho) phi.alt_1 + b phi.alt_2] & = 0\
dot(phi.alt)_2 + 1 / 2 phi.alt_1 + 1 / 2 \( mu + j \) phi.alt_2 + j 3 / 8 alpha phi.alt_2 \| phi.alt_2 \|^2 & = 0 . $<eq:slowcomplex2>
with the complex coefficients $a$ and $b$ defined as
$ a & = - upright(bold(l))_(1 \, upright("Hopf"))^T upright(bold(D_(1 \, upright("Hopf")))) upright(bold(r))_(1 \, upright("Hopf"))\
b & = 1 / omega^2 (- j upright(bold(l))_(1 \, upright("Hopf"))^T upright(bold(D_(2 \, upright("Hopf")))) + upright(bold(l))_(1 \, upright("Hopf"))^T upright(bold(D_(3 \, upright("Hopf"))))) (upright(bold(A K_(upright("Hopf")))) upright(bold(r))_(1 \, upright("Hopf"))^(upright("UL")) + upright(bold(A C)) upright(bold(r))_(1 \, upright("Hopf"))^(upright("DL"))) . $

Then, substituting $phi.alt_1$ and $phi.alt_2$ in
#ref(<eq:slowcomplex>) by their polar coordinates
defined as $phi.alt_1 = r e^(j theta_1)$ and
$phi.alt_2 = s e^(j theta_2)$, new equations of motion for the real
amplitudes $r$ and $s$ and phase difference $Delta = theta_2 - theta_1$
can be obtained as $ dot(r) & = epsilon.alt f \( r \, s \, Delta \)\
dot(s) & = tilde(g)_1 \( r \, s \, Delta \, epsilon.alt \)\
dot(Delta) & = tilde(g)_2 \( r \, s \, Delta \, epsilon.alt \) $<eq:slowReal>
with
$ f \( r \, s \, Delta \) & = (rho - a_(cal(R))) r - (b_(cal(R)) cos Delta - b_(cal(I)) sin Delta) s \,\
tilde(g)_1 \( r \, s \, Delta \, epsilon.alt \) & = - 1 / 2 (mu s + r cos Delta) \,\
tilde(g)_2 \( r \, s \, Delta \, epsilon.alt \) & = 3 / 8 alpha s^2 - 1 / 2 + frac(r, 2 s) sin Delta med + epsilon.alt [a_(cal(I)) + b_(cal(I)) frac(cos Delta, r) + b_(cal(R)) frac(sin Delta, r)] $
where the complex parameters $a$ and $b$ were split into real and
imaginary parts as $a = a_(cal(R)) + j a_(cal(I))$ and
$b = b_(cal(R)) + j b_(cal(I))$.

Because of the presence of the small parameter $epsilon.alt$, the slow
flow is governed by different time scales. More precisely, within the
framework of the geometric singular perturbation theory~@Jones1995,
#ref(<eq:slowReal>) appears as a
$\( 2 \, 1 \)$-fast-slow system where $s$ and $Delta$ are the fast
variables and $r$ the slow variable. The latter is related to the modal
component $q_1$ whereas the fast variables are associated with the
relative displacement $w$ between the NES and the primary structure.

== Critical manifold and fold points of the slow flow
<sec:critman>
The real form of the slow flow, i.e.
#ref(<eq:slowReal>), is written with respect to the
dimensionless slow time $tau = epsilon.alt t$ as follows
$ r' & = f \( r \, s \, Delta \)\
epsilon.alt s' & = tilde(g)_1 \( r \, s \, Delta \, epsilon.alt \)\
epsilon.alt Delta' & = tilde(g)_2 \( r \, s \, Delta \, epsilon.alt \) $<eq:slowRealSlow>
where $\( . \)'$ denotes the derivative with respect to the slow time
$tau$. Considering $epsilon.alt = 0$ yields the #emph[slow subsystem]
$ r' & = f \( r \, s \, Delta \)\
0 & = tilde(g)_1 \( r \, s \, Delta \, 0 \)\
0 & = tilde(g)_2 \( r \, s \, Delta \, 0 \) $<eq:slowsubsys> which is a
differential-algebraic equation, and the #emph[fast subsystem]
$ dot(r) & = 0\
dot(s) & = tilde(g)_1 \( r \, s \, Delta \, 0 \)\
dot(Delta) & = tilde(g)_2 \( r \, s \, Delta \, 0 \) $<eq:fastsubsys>

The critical manifold of the slow flow is the solution of the algebraic
part of #ref(<eq:slowsubsys>) and it is expressed as
follows
$ cal(M)_0 = #scale(x: 180%, y: 180%)[{] (r \, s \, Delta) in bb(R)^(+^2) times \[ - pi \, pi \] #h(0em) #scale(x: 180%, y: 180%)[\|] #h(0em) tilde(g)_1 \( r \, s \, Delta \, 0 \) = 0 #h(0em) #h(0em) upright("and") #h(0em) #h(0em) tilde(g)_2 \( r \, s \, Delta \, 0 \) = 0 #scale(x: 180%, y: 180%)[}] . $<eq:CM00>

Combining
#ref(<eq:slowsubsys>)
leads to the following modulus and argument equations
$ r & = s sqrt(mu^2 + (1 - frac(3 alpha s^2, 4))^2) = H \( s \)\
tan Delta & = frac(3 alpha s^2 - 4, 4 mu) . $<eq:RealCM>

Stability analysis of the critical manifold is now carried out
considering the fast
subsystem~#ref(<eq:fastsubsys>). It can be shown
that a fixed point of~#ref(<eq:fastsubsys>) is
stable if $d_s H \( s \) > 0$ and unstable if $d_s H \( s \) < 0$.
Hence, the subset of $cal(M)_0$ satisfying $d_s H \( s \) < 0$ defines
the attracting zone for the fast dynamics whereas the subset of
$cal(M)_0$ satisfying $d_s H \( s \) > 0$ define the repelling zone.

Exploiting the polynomial properties of $H$, it can be shown that the
local extrema of $H$ (i.e $d_s H \( s \) = 0$) occur at
$ s^(upright("LF")) = frac(2, 3 sqrt(alpha)) sqrt(2 - sqrt(1 - 3 mu^2)) quad upright("and") quad s^(upright("RF")) = frac(2, 3 sqrt(alpha)) sqrt(2 + sqrt(1 - 3 mu^2)) $<eq:rNrm>
if the following relation holds $ mu < 1 / sqrt(3) . $<eq:rocond> In
#ref(<eq:rNrm>), $s^(upright("LF"))$ and
$s^(upright("RF"))$ are the abscissa values in the $\( s \, r \)$-plane
of the a maximum and the minimum of the function $H$ respectively. The
superscripts $\( \)^(upright("LF"))$ and $\( \)^(upright("RF"))$ refer
to #emph[left fold point] and #emph[right fold point] respectively.
Indeed, in the $\( s \, r \, Delta \)$-space, the two points
$\( s^(upright("RF")) \, r^(upright("RF")) \, Delta^(upright("RF")) \)$
and
$\( s^(upright("LF")) \, r^(upright("LF")) \, Delta^(upright("LF")) \)$
(where $r^(upright("LF"))$, $r^(upright("RF"))$, $Delta^(upright("LF"))$
and $Delta^(upright("RF"))$ can be deduced from $s^(upright("LF"))$ and
$s^(upright("RF"))$ using #ref(<eq:RealCM>)) are
generally called #emph[fold points].

When the condition~#ref(<eq:rocond>) is not satisfied
the function $H$ no longer has local extrema. In the remaining of the
paper, one considers situations in which
#ref(<eq:rocond>) holds.

A typical critical manifold (more precisely its real part defined by
#ref(<eq:RealCM>)) is depicted in #link(<fig:CM0>)[1].
One can see that the fold points connect attracting parts to repelling
part of the critical manifold $cal(M)_0$. The two scalars
$s^(upright("D"))$ and $s^(upright("U"))$, which are the horizontal
projection of the fold points on the critical manifold, are defined by
$H (s^(upright("RF"))) = H (s^(upright("D")))$ and
$H (s^(upright("LF"))) = H (s^(upright("U")))$ giving
$ s^(upright("D")) = frac(2 sqrt(2), 3 sqrt(alpha)) sqrt(1 - sqrt(1 - 3 mu^2)) quad upright("and") quad s^(upright("U")) = frac(2 sqrt(2), 3 sqrt(alpha)) sqrt(1 + sqrt(1 - 3 mu^2)) . $<eq:N2>

#figure(image("source/ExCM.pdf"),
  caption: [
    Typical example of the critical manifold in the $\( s \, r \)$-plane
    given by #ref(<eq:RealCM>) for $mu = 0.25$ and
    $alpha = 5$.
  ]
)
<fig:CM0>

== Fixed points and fold singularities of the slow flow
<fixed-points-and-fold-singularities-of-the-slow-flow>
Because $0 < epsilon.alt lt.double 1$, the fixed points of the slow
flow~#ref(<eq:slowReal>), which characterize periodic
solutions of #ref(<eq:systprotecuvRedf>), can
be approximated by those of the slow
subsystem~#ref(<eq:slowsubsys>). From that
zeroth-order approximation an analytical expression of these fixed
points can be obtained. Note that within this approximation, the fixed
points are necessarily located on the critical manifold.

First, substituting #ref(<eq:RealCM>) into
#ref(<eq:slowsubsys>) results in
$(H \( s \))' = f (H \( s \) \, s \, Delta)$ which reduces to
$ d_s H \( s \) s' = f_s \( s \) \, $<eq:SysAsAno12> where the explicit
expression of the function $f_s$ is not given here.

Then, a (regular) fixed point of
#ref(<eq:SysAsAno12>) is defined as the roots of
$f_s (s) = 0$ with $d_s H \( s \) eq.not 0$. Solving $f_s \( s \) = 0$
gives two fixed points (in addition to the trivial solution) whose
analytical expressions are
$ s_1^e & = #scale(x: 300%, y: 300%)[\(] frac(2, 3 alpha (a_(cal(R)) - rho)) #scale(x: 180%, y: 180%)[\(] 2 a_(cal(R)) - b_(cal(I)) - 2 rho + sqrt(b_(cal(I))^2 - 4 mu (a_(cal(R)) - rho) (mu a_(cal(R)) - b_(cal(R)) - mu rho)) #scale(x: 180%, y: 180%)[\)] #scale(x: 300%, y: 300%)[\)]^(1 \/ 2) \,\
s_2^e & = #scale(x: 300%, y: 300%)[\(] frac(2, 3 alpha (a_(cal(R)) - rho)) #scale(x: 180%, y: 180%)[\(] 2 a_(cal(R)) - b_(cal(I)) - 2 rho - sqrt(b_(cal(I))^2 - 4 mu (a_(cal(R)) - rho) (mu a_(cal(R)) - b_(cal(R)) - mu rho)) #scale(x: 180%, y: 180%)[\)] #scale(x: 300%, y: 300%)[\)]^(1 \/ 2) \, $<eqPFSF>
with $s_1^e < s_2^e$. As usual, the stability of the fixed points are
found looking for the sign of $d_s (frac(f_s \( s \), H' \( s \)))$.

Both fixed points $s_1^e$ and $s_2^e$ no longer exist when they become
complex for
$ rho^(upright("S")) = frac(2 mu a_(cal(R)) + sqrt(b_(cal(I))^2 + b_(cal(R))^2) - b_(cal(R)), 2 mu) $<eq:exPF>
where the superscript $\( \)^(upright("S"))$ has no particular meaning
here, it is just there to give a name to this particular value of $rho$.

A singular fixed points of #ref(<eq:SysAsAno12>),
also called folded singularites, are defined as the roots of the
following nonlinear equations $f_s (s) = 0$ and $d_s H \( s \) = 0$.
Folded singularities are hints of particular solutions of such fast-slow
systems, called canard cycles~@ChasCanard. These solutions are not
investigated in this paper.

== The possible responses
<sec:respregimes>
Previous analysis provides a qualitative description of the slow flow
dynamics in the limit case where $epsilon.alt = 0$, i.e. within a
zeroth-order approximation. Within this approximation, the slow flow
evolves at two time scales: a slow time scale in which the slow flow is
on the critical manifold and described by the slow
subsystem~#ref(<eq:slowsubsys>) and a fast time
scale in which the slow flow is outside the critical manifold and
described by the fast
subsystem~#ref(<eq:fastsubsys>). The particular
$S$-shape of the critical manifold together with the stability analysis
of the fixed points of the slow flow allows us to explain and predict
its different responses and consequently those of the initial full order
system~#ref(<eq:systprotecuvRedf>). As has
been widely discussed in the literature (see
e.g.~@Gendelman2010Phys@Gendelman2010SIAM), four scenarios are possible.
In previous works by the authors~@Bergeot2018@bergeot2019 these
responses are classified into two categories. In the first category, the
NES acts, resulting in the three responses called #emph[harmless
situations]. First, the #emph[Complete suppression] in which the trivial
fixed point of the slow flow~#ref(<eq:slowReal>) is
stable and then reached. In this case, the system is stabilized because
of the additional part of the NES including mass and damping. In
general, because a light mass and a small damping are considered for the
NES, this stabilization effect is negligible, in term of bifurcation
parameter range, compared to the mitigation effects described
hereinafter. In other words, the Hopf bifurcation point of the primary
structure without NES is usually very slightly smaller than the Hopf
bifurcation point of the coupled system. Of course, in a context of
nonlinear vibrations absorption, the complete suppression is not the
desired effect. Then, one can observe #emph[mitigation through periodic
response]. In this case, a nontrivial stable fixed point of the slow
flow~#ref(<eq:slowReal>) is reached, that corresponds
to a periodic regime for the initial
system~#ref(<eq:systprotecuvRedf>). The last
harmless situations correspond to #emph[mitigation through Strongly
Modulated Responses (SMRs)]. SMRs correspond to relaxations oscillations
of the slow flow~#ref(<eq:slowReal>), that corresponds
to a quasi-periodic (amplitude and phase modulated) regime for the
initial system~#ref(<eq:systprotecuvRedf>). In
the second category, called #emph[harmful situation], the NES is not
able to produce small amplitude responses. For the initial nonlinear
system one observes in this case a limit cycle with an amplitude close
to that of the system without NES. Note that if the nonlinearity of the
primary structure is neglected in the governing equations of the slow
flow (this the case in the present work), the harmful situation
corresponds for it to an unbounded regime in which its trajectory
growths to infinity.

In this paper, we are particularly interested in the transition from SMR
to no mitigation which is also, in general, the transition from harmless
to harmful situations. Therefore one recalls here briefly what
relaxation oscillations of the slow flow are. Note that the following
description holds in the limit case for which $epsilon.alt = 0$. In the
$\( s \, r \)$-plane, from an initial condition near zero and outside
the critical manifold, the trajectory of the slow flow evolves rapidly
and horizontally to the left attracting branch of $cal(M)_0$ (this fast
epoch is described by the fast subsystem
#ref(<eq:fastsubsys>)). Then, the slow flow evolves
slowly on this branch (this slow epoch is described by the slow
subsystem #ref(<eq:slowsubsys>)) and, if there is no
stable fixed points on it, the trajectory reached the left fold point
$\( s^(upright("LF")) \, r^(upright("LF")) \)$ at which $cal(M)_0$
becomes repelling. From the fold point, the slow flow undergoes a fast
horizontal jump to $\( s^(upright("U")) \, r^(upright("LF")) \)$ on the
right attracting part of $cal(M)_0$ and then a second slow epoch to the
right fold point $\( s^(upright("RF")) \, r^(upright("RF")) \)$. A
second horizontal jump occurs from
$\( s^(upright("RF")) \, r^(upright("RF")) \)$ to
$\( s^(upright("D")) \, r^(upright("RF")) \)$ and the trajectory returns
to the left attracting part of the $cal(M)_0$. A third slow epoch occurs
on $cal(M)_0$ to $\( s^(upright("LF")) \, r^(upright("LF")) \)$ and so
on.

== Zeroth-order analytical prediction of the mitigation limit
<sec:predzero>
The mitigation limit is defined below.

#block[
#strong[Definition 1]. #emph[Considering a set of initial conditions
(for the slow flow) as a small perturbation of the trivial solution, the
#strong[mitigation limit] is defined as the value of the generalized
bifurcation parameter $rho$ which separates harmless situations from
harmful situation.]

]
As discussed in the literature
@Gendelman2010Phys@Gendelman2010SIAM@Bergeot2018, the mitigation limit
(denoted here $rho_0^(*)$) is defined, within the zeroth-order
approximation, as the value of $rho$ for which the fixed point $s_2^e$
becomes smaller than $s^(upright("U"))$ defined by
#ref(<eq:N2>) or for which $s_2^e$ no longer exists (see
#ref(<eq:exPF>)). Indeed, when the largest unstable fixed
exists (with, in addition, $s_2^e > s^(upright("U"))$), it prevents the
phase trajectory to grow to infinity on the right branch of the critical
manifold.

From #ref(<eq:N2>), #ref(<eqPFSF>) the solution of
$s_2^e = s^(upright("U"))$ is derived as
$ rho_0^(upright("U")) = a_(cal(R)) + frac(2 sqrt(1 - 3 mu^2) b_(cal(I)) + b_(cal(I)) - (2 sqrt(1 - 3 mu^2) + 7) mu^2 b_(cal(I)), (mu^2 + 1)^2) + frac((3 mu^2 - 4 sqrt(1 - 3 mu^2) - 5) mu b_(cal(R)), (mu^2 + 1)^2) . $<eq:rho10>

Then using #ref(<eq:exPF>), the following conditional
expression for $rho_0^(*)$ is obtained:
$ rho_0^(*) = {rho_0^(upright("U")) #h(0em) \, quad upright("if") #h(0em) mu < mu^(*)\
rho^(upright("S")) #h(0em) \, quad upright("if") #h(0em) mu > mu^(*) \, $<eq:laidNES>
with $mu^(*)$ the special value of $mu$ solution of
$rho_0^(upright("U")) = rho^(upright("S"))$ which is in general smaller
than $1 \/ sqrt(3)$.

We can notice that within the zeroth-order approximation, the mitigation
limit does not depend on the nonlinear parameter $alpha$ of the NES but
only its damping coefficient $mu$ (together with the parameters of the
primary system). Therefore, for given parameters of the primary
structure, it exists an optimal value of $mu$, denoted
$mu_0^(upright("opt"))$, which maximizes the mitigation limit.
Consequently, assuming that $mu_0^(upright("opt")) < mu^(*)$,
$mu_0^(upright("opt"))$ is the solution of
$partial_mu rho_0^(upright("U")) = 0$. Solving the latter equation
yields
$ mu_0^(upright("opt")) & = - 1 / cal(B) #scale(x: 300%, y: 300%)[\[] b_(cal(R)) b_(cal(I)) + sqrt(cal(B) (\| b \|^4 b_(cal(R))^2)^(1 \/ 3) - 3 b_(cal(R))^2 (b_(cal(I))^2 + b_(cal(R))^2))\
 & - #scale(x: 300%, y: 300%)[\(] - cal(B) (\| b \|^4 b_(cal(R))^2)^(1 \/ 3) - 2 cal(B) b_(cal(R))^2 + 2 b_(cal(I))^2 b_(cal(R))^2 - frac(2 b_(cal(I)) b_(cal(R)) (b_(cal(I))^2 + b_(cal(R))^2) (8 b_(cal(I))^2 + 9 b_(cal(R))^2), sqrt(cal(B) (\| b \|^4 b_(cal(R))^2)^(1 \/ 3) - 3 b_(cal(R))^2 (b_(cal(I))^2 + b_(cal(R))^2))) #scale(x: 300%, y: 300%)[\)]^(1 \/ 2) #scale(x: 300%, y: 300%)[\]] $<eq:muopt0>
with $cal(B) = 3 b_(cal(R))^2 + 4 b_(cal(I))^2$ and where the subscript
$0$ is used to highlight that the expression
#ref(<eq:muopt0>) is obtained within the zeroth-order
approximation.

= Scaling law for the slow flow near a fold point
<sec:scallaw>
The Fenichel theory~@Fenichel1979 guarantees the persistence of the
relaxation oscillations scenario, described at the end of
#link(<sec:respregimes>)[3.4], for $0 < epsilon.alt lt.double 1$ by
stating that #ref(<eq:slowRealSlow>) has an
invariant manifold $cal(M)_epsilon.alt$ in the
$O \( epsilon.alt \)$-vicinity of $cal(M)_0$ and with the same stability
properties with respect to the fast variables as $cal(M)_0$ (attracting
or repelling). In this case, concerning the first jump described
previously, the jump point at which the trajectory leaves the attracting
branch of $cal(M)_epsilon.alt$ to undergo the jump is no longer the fold
point $\( s^(upright("LF")) \, r^(upright("LF")) \)$. The same is true
for the arrival point at which the trajectory reaches the right
attracting part of $cal(M)_epsilon.alt$ after the jump which is no
longer $\( s^(upright("U")) \, r^(upright("LF")) \)$. The goal of this
section is to determine these jump and arrival points and consequently
to obtain an analytical prediction of the mitigation limit which, unlike
#ref(<eq:laidNES>), takes into account $epsilon.alt$.

To achieve that, one must determine beforehand the scaling law of the
slow flow dynamics in the neighborhood of the fold point
$\( s^(upright("LF")) \, r^(upright("LF")) \)$, i.e. a law which
describes the $epsilon.alt$-dependance of the distance between
$cal(M)_0$ and the actual trajectory of the slow flow for
$0 < epsilon.alt lt.double 1$. The jump and arrival points are then
deduced from this scaling law.

The Fenichel theorem is true for normally hyperbolic branch of
$cal(M)_0$ (i.e. outside the fold points) and fails to approach the
actual trajectory of the system at fold points. Indeed, the literature
on dynamical systems shows that the trajectory still passes through the
region near these fold points but with a nontrivial scaling behavior
involving the fractional exponents 1/3 and 2/3 for the perturbation
parameter $epsilon.alt$ (see e.g.~@bk:khuehn2015 Sect. 5.4).

== Center manifold reduction of the slow flow at the left fold point
<sec:CMR>
The center manifold reduction technique (as presented for example
in~@Guckenheimer_1983Chap3@BerlGen2006) is used in this section to
reduce the slow flow #ref(<eq:slowRealSlow>), in
the vicinity of the left fold point
$\( r^(upright("LF")) \, s^(upright("LF")) \, Delta^(upright("LF")) \)$,
to the normal form of the dynamic saddle-node bifurcation which is then
solve to deduce the nontrivial scaling law previously mentioned.

First, assuming $epsilon.alt = 0$ in the right-hand sides of
#ref(<eq:slowRealSlow>),
one considers the following simplification of the slow flow
$ r' & = f \( r \, s \, Delta \)\
epsilon.alt s' & = tilde(g)_1 \( r \, s \, Delta \, 0 \) = g_1 \( r \, s \, Delta \) \,\
epsilon.alt Delta' & = tilde(g)_1 \( r \, s \, Delta \, 0 \) = g_2 \( r \, s \, Delta \) . $<eq:slowRealSlow2>

The goal in using the center manifold theorem is to reduce the dynamics
with respect to the fast variables $s$ and $Delta$, i.e. obtain an
equivalent system which only depends on one variable. To achieve that,
the Jacobian matrix $upright(bold(J_g))$ of
(#ref(<eq:slowRealSlow2>)) evaluated at the fold point
$\( r^(upright("LF")) \, s^(upright("LF")) \, Delta^(upright("LF")) \)$
is computed as
$ upright(bold(J_g)) \( r^(upright("LF")) \, s^(upright("LF")) \, Delta^(upright("LF")) \) = mat(delim: "(", - mu / 2, 1 / 9 (sqrt(1 - 3 mu^2) + 1) sqrt(frac(2 - sqrt(1 - 3 mu^2), alpha)); - frac(3 (sqrt(1 - 3 mu^2) - 1), 4 sqrt(frac(2 - sqrt(1 - 3 mu^2), alpha))), - mu / 2) . $<eq:Jacf>
which has two real eigenvalues $lambda_a = 0$ and $lambda_b = - mu$.

Then to continue one must obtain polynomial nonlinearities. Indeed, the
center manifold reduction requires isolating the linear terms. The
functions $g_1$ and $g_2$ are therefore Taylor expanded around the fold
point
$\( r^(upright("LF")) \, s^(upright("LF")) \, Delta^(upright("LF")) \)$,
up to order 2 for the variables $s$ and $Delta$ and up to order 1 for
the variable $r$. Remembering that by definition
$g_1 \( r^(upright("LF")) \, s^(upright("LF")) \, Delta^(upright("LF")) \) = 0$
and
$g_2 \( r^(upright("LF")) \, s^(upright("LF")) \, Delta^(upright("LF")) \) = 0$
that yields
$ g_1 \( r \, s \, Delta \) & approx (s - s^(upright("LF"))) partial_s g_1 \( r^(upright("LF")) \, s^(upright("LF")) \, Delta^(upright("LF")) \) + (Delta - Delta^(upright("LF"))) partial_Delta g_1 \( r^(upright("LF")) \, s^(upright("LF")) \, Delta^(upright("LF")) \) + tilde(G)_1 \( r \, s \, Delta \)\
g_2 \( r \, s \, Delta \) & approx (s - s^(upright("LF"))) partial_s g_2 \( r^(upright("LF")) \, s^(upright("LF")) \, Delta^(upright("LF")) \) + (Delta - Delta^(upright("LF"))) partial_Delta g_2 \( r^(upright("LF")) \, s^(upright("LF")) \, Delta^(upright("LF")) \) + tilde(G)_2 \( r \, s \, Delta \) . $<eq:TaylorG>
The polynomial functions $tilde(G)_1$ and $tilde(G)_2$ contain nonlinear
terms with respect to the $\( s - s^(upright("LF")) \)$ and
$\( Delta - Delta^(upright("LF")) \)$ (only quadratics terms are taken)
and linear terms in $\( r - r^(upright("LF")) \)$.

Denoting $upright(bold(t)) = \( s \, Delta \)^T$ and
$upright(bold(t))^(upright("LF")) = \( s^(upright("LF")) \, Delta^(upright("LF")) \)^T$
and using #ref(<eq:TaylorG>),
#ref(<eq:slowRealSlow2>)
can be written in matrix form as
$ epsilon.alt upright(bold(t))' = (upright(bold(t)) - upright(bold(t))^(upright("LF"))) upright(bold(J_g)) \( r^(upright("LF")) \, upright(bold(t))^(upright("LF")) \) + upright(bold(tilde(G))) (r - r^(upright("LF")) \, upright(bold(t)) - upright(bold(t))^(upright("LF"))) $<eq:slowVar1>
where $upright(bold(tilde(G))) = \( tilde(G)_1 \, tilde(G)_2 \)^T$. Now,
to diagonalize the linear part of #ref(<eq:slowVar1>)
the biorthogonal transformation is used again#footnote[To avoid having
to introduce new notations, same symbols as in #link(<sec:red1>)[2.2]
are used in this section to describe the biorthogonal transformation
except for the subscripts which are now letters ($a$, $b$,...) instead
of numbers (1,2,...).]. For that, the right and left eigenvector
matrices
$upright(bold(R)) = [upright(bold(r))_a med upright(bold(r))_b]$ and
$upright(bold(L)) = [upright(bold(l))_a med upright(bold(l))_b]$ are
considered corresponding to the following right and left eigenvalue
problems with respect to
$upright(bold(J_g)) \( r^(upright("LF")) \, upright(bold(t))^(upright("LF")) \)$
$ upright(bold(J_g)) \( r^(upright("LF")) \, upright(bold(t))^(upright("LF")) \) upright(bold(R)) = upright(bold(R)) bold(Lambda) quad upright("and") quad upright(bold(J_g)) \( r^(upright("LF")) \, upright(bold(t))^(upright("LF")) \)^T upright(bold(L)) = upright(bold(L)) bold(Lambda) . $<eq:lEVp2>
where
$bold(Lambda) = upright("diag") \( lambda_a \, lambda_b \) = upright("diag") \( 0 \, - mu \)$
denotes the diagonal matrix of the eigenvalues. Again the biorthogonal
transformation consists of stating
$ upright(bold(t)) - upright(bold(t))^(upright("LF")) = upright(bold(R q)) quad upright("with") quad upright(bold(q = L))^T (upright(bold(t)) - upright(bold(t))^(upright("LF"))) $<eq:binormtrans2>
where $upright(bold(q)) = \( q_a \, q_b \)^T$. Note that here, on a
system undergoing a saddle-node bifurcation, the eigenvalues, the
eigenvectors and the modal coordinates are real.

The variable $q_a$ is associated to $lambda_a = 0$ and the variable
$q_b$ is associated to $lambda_b = - mu$. Moreover, the matrices
$upright(bold(R))$ and $upright(bold(L))$ have been chosen such that
$upright(bold(L))^T upright(bold(R)) = upright(bold(I))$ and
$upright(bold(L))^T upright(bold(J_g)) \( r^(upright("LF")) \, upright(bold(t))^(upright("LF")) \) upright(bold(R)) = bold(Lambda)$.
#ref(<eq:slowVar1>) is then expressed with respect to
the variables $q_a$ and $q_b$ as
$ epsilon.alt upright(bold(q))' = bold(Lambda) upright(bold(q)) + upright(bold(G)) (u \, upright(bold(q))) $<eq:MotionEq3bis2>
where
$upright(bold(G)) (u \, upright(bold(q))) = upright(bold(L))^T upright(bold(tilde(G))) (r - r^(upright("LF")) \, upright(bold(R q)))$
and $u = r - r^(upright("LF"))$. Because of the latter change of
variable the linear terms in $q_a$ and $q_b$ vanish in
$upright(bold(G))$.

The Jacobian matrix
$upright(bold(J_g)) \( r^(upright("LF")) \, upright(bold(t))^(upright("LF")) \)$
has a null eigenvalue and a negative one. Consequently, the center
manifold theorem states that, in the neighborhood of the fold point
$\( r^(upright("LF")) \, s^(upright("LF")) \, Delta^(upright("LF")) \)$,
studying the following reduced system
$ epsilon.alt q'_a = G_1 (q_a \, ell \( q_a \) \, u) $ is equivalent to
studying #ref(<eq:MotionEq3bis2>). The function
$ell$ cannot be obtained explicitly and it must therefore be
approximated. For sake of simplicity one chooses the #emph[tangent space
approximation] (see for example @book:207976, Chap. 18), i.e.
$q_b = ell \( q_a \) = 0$.

To obtain a normal form of the dynamic saddle-node bifurcation final
approximations are needed. First, because, we study the dynamics near
the fold point
$\( r^(upright("LF")) \, s^(upright("LF")) \, Delta^(upright("LF")) \)$
we assume that
$f \( r \, s \, Delta \) = f \( r^(upright("LF")) \, s^(upright("LF")) \, Delta^(upright("LF")) \) = f^(upright("LF")) .$
Then, only terms of order 2 in $q_a$ and of order 1 in $u$ are kept in
$G_1$ leading to $ G_1 approx a_1 q_a^2 + a_2 u $ with
$ a_1 = frac(3 (sqrt(1 - 3 mu^2) - 1) mu^2 + sqrt(1 - 3 mu^2) + 1, 18 mu^2) quad upright("and") quad a_2 = frac(3 alpha sqrt(frac(2 - sqrt(1 - 3 mu^2), alpha)), 4 sqrt(2) sqrt(3 mu^2 + sqrt(1 - 3 mu^2) + 1)) . $<eq:aa>

An approximated formulation of the slow
flow~#ref(<eq:slowRealSlow2>) as the normal form
of the dynamic saddle-node bifurcation is then finally obtained as
$ hat(epsilon.alt) q'_a & = h \( q_a \, v \) = q_a^2 + v \,\
v' & = 1 $<eq:slowRealSlow3> with
$ v = a_2 / a_1 u \, quad hat(epsilon.alt) = epsilon.alt f^(upright("LF")) a_2 / a_1^2 $<eq:vepsh>
and the following time switching
$tau arrow.r frac(a_2 f^(upright("LF")), a_1) tau$ and where
$h \( q_a \, v \)$ satisfies the bifurcation conditions
$h \( 0 \, 0 \) = 0$ and $partial_(q_a) h \( 0 \, 0 \) = 0$ and the
conditions of the saddle-node bifurcation
$partial_(q_a q_a) h \( 0 \, 0 \) eq.not 0$ and
$partial_v f \( 0 \, 0 \) eq.not 0$.

The bifurcation is said to be #emph[dynamic] because unlike the
#emph[static] saddle-node bifurcation the bifurcation parameter $v$ is a
slowly varying parameter (because of
#ref(<eq:slowRealSlow3>)).

The critical manifold $cal(M)_0$ of
#ref(<eq:slowRealSlow3>) consists of an
attracting branch
$cal(M)_(0 \, upright("a")) = { \( x \, y \) in bb(R)^(-) times bb(R)^(-) med #h(0em) \| #h(0em) x = - sqrt(- y) }$
and a repelling branch
$cal(M)_(0 \, upright("r")) = { \( x \, y \) in bb(R)^(+) times bb(R)^(-) med #h(0em) \| #h(0em) x = sqrt(- y) }$.
This critical manifold is hyperbolic except in $\( 0 \, 0 \)$. Finally,
it may be noted that the center manifold reduction amounts to stating
that locally the critical manifold is approximated by a parabolic
function.

== Analytical solution for the normal form of the dynamic saddle-node bifurcation
<sec:ThSol>
The method to solve analytically
#ref(<eq:slowRealSlow3>) is presented for exemple
in @BerlGen2006. It begins by dividing
#ref(<eq:slowRealSlow3>) by
#ref(<eq:slowRealSlow3>), that leads to
$ hat(epsilon.alt) frac(d q_a, d v) = q_a^2 + v . $

The subsequent scaling $q_a = hat(epsilon.alt)^(1 \/ 3) z$ and
$v = - hat(epsilon.alt)^(2 \/ 3) s$ is then introduced to obtain the
following equation $ frac(d z, d s) = - z^2 + s . $<eq:eqZ1>

Setting $z \( s \) = phi' \( s \) \/ phi \( s \)$ in
#ref(<eq:eqZ1>) yields the linear second order equation
$phi^('') \( s \) = s phi \( s \)$, whose solution can be expressed in
terms of Airy functions as
$phi \( s \) = C_1 upright(A i) \( s \) + C_2 upright(B i) \( s \)$
where $C_1$ and $C_2$ are constants. Assuming that
$x \( - oo \) = - sqrt(- y)$, only the contribution of
$upright(A i) \( s \)$ is kept (this is not proved here). Therefore the
solution with respect to the original variable $q_a$, denoted
$q_a^star.op \( v \)$, is then given by
$ q_a^star.op \( v \) = hat(epsilon.alt)^(1 \/ 3) frac(upright(A i)' (- hat(epsilon.alt)^(- 2 \/ 3) v), upright(A i) (- hat(epsilon.alt)^(- 2 \/ 3) v)) . $<eq:q1vAi1>
Note that from #ref(<eq:slowRealSlow3>) to
#ref(<eq:q1vAi1>) no asymptotic approach has been used.

The first zero of $q_a^star.op \( v \)$ is given by the first zero of
the Airy function derivative $upright(A i)'$ and the first singularity
by the first zero of $upright(A i)$ which are tabulated values (see
e.g.~@abramowitz1972handbook). Therefore, one has
$ q_a^star.op \( v \) = 0 quad upright("for") quad v = 1.01879 times hat(epsilon.alt)^(2 \/ 3) $<eq:0Aip>
and
$ q_a^star.op \( v \) arrow.r oo quad upright("for") quad v = 2.33810 times hat(epsilon.alt)^(2 \/ 3) . $<eq:0Ai>

An illustration of the normal form of the dynamic saddle-node
bifurcation is shown in #link(<fig:NormSNBifEx>)[2]. The direct
numerical integration of #ref(<eq:slowRealSlow3>)
with initial condition $\( q_a \( 0 \) = - 1 \, v \( 0 \) - 0.5 \)$ is
compared to the analytical solution $q_a^star.op \( y \)$ given by
#ref(<eq:q1vAi1>) for $epsilon.alt = 0.01$. The first
zero, the first singularity of $q_a^star.op \( v \)$ and the
corresponding critical manifold $cal(M)_0$ (which consists of an
attracting part $cal(M)_(0 \, upright("a"))$ and a repelling part
$cal(M)_(0 \, upright("r"))$) are also shown.

#figure(image("source/NormSNBifEx.pdf"),
  caption: [
    Illustration of the normal form of the dynamic saddle-node
    bifurcation. Result of the numerical integration of
    #ref(<eq:slowRealSlow3>) with initial
    condition $\( q_a \( 0 \) = - 1 \, v \( 0 \) = - 0.5 \)$ (red dashed
    line) compared to the analytical scaling law $q_a^star.op \( y \)$
    given by #ref(<eq:q1vAi1>) (blue line, the dashed
    parts are the horizontal asymptotes of $q_a^star.op \( y \)$
    corresponding to the zeros Airy function) for $epsilon.alt = 0.01$.
    The first zero and the first singularity of $q_a^star.op \( v \)$
    (orange and green lines respectively) and the corresponding critical
    manifold $cal(M)_0$ (attracting part $cal(M)_(0 \, upright("a"))$ in
    black and repelling part $cal(M)_(0 \, upright("r"))$ in gray) are
    also shown.
  ]
)
<fig:NormSNBifEx>

From
#ref(<eq:binormtrans2>), #ref(<eq:vepsh>),
an approximated analytical solution of the slow
flow~#ref(<eq:slowRealSlow2>) in the neighborhood
of the fold point
$\( r^(upright("LF")) \, s^(upright("LF")) \, Delta^(upright("LF")) \)$
is obtained as
$ s^star.op \( r \) = s^(upright("LF")) + upright(bold(r))_(a \, 1) hat(epsilon.alt)^(1 \/ 3) frac(upright(A i)' (- hat(epsilon.alt)^(- 2 \/ 3) a_2 / a_1 (r - r^(upright("LF")))), upright(A i) (- hat(epsilon.alt)^(- 2 \/ 3) a_2 / a_1 (r - r^(upright("LF"))))) $<eq:srAi1>
where $a_1$, $a_2$ and $hat(epsilon.alt)$ are given by
#ref(<eq:aa>) and #ref(<eq:vepsh>)
respectively and $upright(bold(r))_(a \, 1)$ is the first coordinate of
the vector~$upright(bold(r))_a$.

The previous analysis reveals the nontrivial $epsilon.alt$-dependence of
the slow flow near the fold point, involving the fractional exponents
1/3 and 2/3. Consequently, near the fold point, the trajectory no longer
tracks the attracting branch of $cal(M)_(0 \, upright("a"))$ of the
critical manifold at a distance of order $epsilon.alt$ as it is the case
when the trajectory evolves slowly far from the fold point (as predicted
by the Fenichel theory in the normally hyperbolic branches of
$cal(M)_0$).

Two particular values of $r$ can be deduced from
#ref(<eq:srAi1>): the value at which
$s^star.op \( r \) = s^(upright("LF"))$, denoted $r^0$, and the value
for which $s^star.op \( r \)$ tends toward infinity, denoted $r^oo$.
These values of $r$ correspond to the first zeros of $upright(A i)'$ and
$upright(A i)$ respectively (see
#ref(<eq:0Aip>), #ref(<eq:0Ai>)). Therefore, one has
$ s^star.op \( r \) = s^(upright("LF")) quad upright("for") quad r = r^0 = r^(upright("LF")) + K^0 epsilon.alt^(2 \/ 3) $
where
$K^0 = 1.01879 times a_1 / a_2 (f^(upright("LF")) a_2 / a_1^2)^(2 \/ 3)$
and
$ s^star.op \( r \) arrow.r oo quad upright("for") quad r = r^oo = r^(upright("LF")) + K^oo epsilon.alt^(2 \/ 3) $<eq:rinfty>
where
$K^oo = 2.33810 times a_1 / a_2 (f^(upright("LF")) a_2 / a_1^2)^(2 \/ 3)$.

== New theoretical prediction of the mitigation limit
<sec:NewAnPred>
From the results obtained in the previous section, especially
#ref(<eq:rinfty>), it is possible to obtain a more
accurate prediction of the mitigation limit than
#ref(<eq:laidNES>) which takes into account the value
of the small parameter $epsilon.alt$.

As seen previously (see #link(<sec:predzero>)[3.5]), the mitigation
limit is the value of $rho$ for which the fixed point $s_2^e$ becomes
smaller than $s^(upright("A"))$ (the abscissa of the arrival point of
the trajectory on the critical manifold) or for which $s_2^e$ no longer
exists (see #ref(<eq:exPF>)). Within the zeroth-order
approximation the arrival point is $s^(upright("A")) = s^(upright("U"))$
defined by #ref(<eq:N2>).

It is not easy to derive a new expression of $s^(upright("A"))$ from the
scaling law~#ref(<eq:srAi1>). However, one can assume
that when the trajectory reaches the right attracting par of $cal(M)_0$,
the limit value $r^oo$ has already been reached. Therefore, the solution
of $s_2^e = s^(upright("A"))$, denoted $rho_epsilon.alt^(upright("U"))$,
is also the solution of
$ H (s_2^e \( rho_epsilon.alt^(upright("U")) \)) & = r^oo \,\
 & = r^(upright("LF")) + K^oo \( rho_epsilon.alt^(upright("U")) \) epsilon.alt^(2 \/ 3) \,\
 & = H \( s^(upright("LF")) \) + K^oo \( rho_epsilon.alt^(upright("U")) \) epsilon.alt^(2 \/ 3) . $<defNewrhoml>

Except for very small values of $epsilon.alt$ for which
$rho_epsilon.alt^(upright("U")) approx rho_0^(upright("U"))$ and the
zeroth-order approximation is sufficient, the special value of $mu$
solution of $rho_epsilon.alt^(upright("U")) = rho^(upright("S"))$ is in
general larger than $1 \/ sqrt(3)$, the upper limit of the study
interval (see #ref(<eq:rocond>)). Therefore, we consider
here that the mitigation limit is directly
$rho_epsilon.alt^(upright("U"))$.

From #ref(<defNewrhoml>) a new and more accurate value
of the optimal value of the NES damping coefficient can be derived.
Indeed, denoting $H (s_2^e \( rho \)) = f_1 \( rho \, mu \)$,
$H \( s^(upright("LF")) \) = f_2 \( mu \)$ and
$K^oo \( rho \) epsilon.alt^(2 \/ 3) = f_3 \( rho \, mu \)$ one has
$ d rho_mu = frac(d_mu f_2 + partial_mu f_3 - partial_mu f_1, partial_mu f_1 - partial_mu f_3) . $<eq:drho1>
Therefore solving $d_mu rho = 0$ together with
#ref(<defNewrhoml>) gives the coordinates of the
maxima of $rho_epsilon.alt^(upright("U")) \( mu \)$ and then optimal
value of the NES damping coefficient, denoted
$mu_epsilon.alt^(upright("opt"))$.

Introducing a new perturbation parameter $nu = epsilon.alt^(2 \/ 3)$,
#ref(<defNewrhoml>) takes the following form
$ H (s_2^e \( rho_epsilon.alt^(upright("U")) \)) = H \( s^(upright("LF")) \) + nu K^oo \( rho_epsilon.alt^(upright("U")) \) . $<defNewrhomlNu>
Because $0 < epsilon.alt lt.double 1$ one has also $0 < nu lt.double 1$,
the latter equation is a perturbation of
$H (s_2^e) = H \( s^(upright("LF")) \)$ which is equivalent to
$H (s_2^e) = H \( s^(upright("U")) \)$ and consequently to
$s_2^e = s^(upright("U"))$ whose solution is $rho_0^(upright("U"))$
given by~#ref(<eq:rho10>).

Therefore, to find an explicit formulae for the solution of
#ref(<defNewrhoml>), a regular perturbation approach
is used by expressing $rho_epsilon.alt^(upright("U"))$ as a power series
of $nu$
$ rho_epsilon.alt^(upright("U")) = rho_(epsilon.alt \, 0)^(upright("U")) + nu rho_(epsilon.alt \, 1)^(upright("U")) + dots.h $<eq:powerser>

Then, substituting #ref(<eq:powerser>) into
#ref(<defNewrhomlNu>) and equating the coefficients
of identical power of $nu$ on both sides of the equation lead to the
following set of equations (up to the first order)
$ bold(nu^0 :) &  & H (s_2^e \( rho_(epsilon.alt \, 0)^(upright("U")) \)) & = H \( s^(upright("LF")) \)\
bold(nu^1 :) &  & rho_1^(*) d_s H (s_2^e \( rho_(epsilon.alt \, 0)^(upright("U")) \)) d_rho s_2^e \( rho_(epsilon.alt \, 0)^(upright("U")) \) & = K^oo \( rho_(epsilon.alt \, 0)^(upright("U")) \) $<eq:MethNaive1>
As expected, from #ref(<eq:MethNaive1>) one has
$rho_(epsilon.alt \, 0)^(upright("U")) = rho_0^(upright("U"))$ (see
#ref(<eq:rho10>)) and therefore
#ref(<eq:MethNaive1>) yields
$ rho_(epsilon.alt \, 1)^(upright("U")) = frac(K^oo \( rho_0^(upright("U")) \), d_s H (s_2^e \( rho_0^(upright("U")) \)) d_rho s_2^e \( rho_0^(upright("U")) \)) . $

Finally, to a first approximation, one has the following asymptotic
expression for $rho_epsilon.alt^(upright("U"))$
$ rho_epsilon.alt^(upright("U")) = rho_0^(upright("U")) + epsilon.alt^(2 \/ 3) frac(K^oo \( rho_0^(upright("U")) \), d_s H (s_2^e \( rho_0^(upright("U")) \)) d_rho s_2^e \( rho_0^(upright("U")) \)) . $<eq:mitlimEps>

The asymptotic series #ref(<eq:powerser>) converges if
the functions of $rho$ in #ref(<defNewrhomlNu>)
(i.e. $s_2^e \( rho \)$ and $K^oo \( rho \)$) can be expanded as a
convergent Taylor series at $rho = rho_0^(upright("U"))$. Unfortunately
$s_2^e \( rho \)$ has an infinite derivative at
$rho = rho^(upright("S"))$ (see #ref(<eq:exPF>)). Because
of that, at $mu = mu^(*)$ where
$rho_0^(upright("U")) = rho^(upright("S"))$ the term
$rho_(epsilon.alt \, 1)^(upright("U"))$ in the
series~#ref(<eq:powerser>) is equal to zero but the
following terms grow to infinity making the series divergent. However,
except at $mu = mu^(*)$ and for sufficiently small values of
$epsilon.alt$, the expression #ref(<eq:mitlimEps>)
shows again a nontrivial $epsilon.alt$-dependence stating that
$rho_epsilon.alt^(upright("U"))$ is a
$O \( epsilon.alt^(2 \/ 3) \)$-perturbation of $rho_0^(upright("U"))$.

Equating to zero the derivative, with respect to $mu$, of the right-hand
side of #ref(<eq:mitlimEps>) and performing again a
perturbative technique with respect to $nu = epsilon.alt^(2 \/ 3)$, an
approximative expression of $mu_epsilon.alt^(upright("opt"))$ is
obtained as
$ mu_epsilon.alt^(upright("opt")) = mu_0^(upright("opt")) + epsilon.alt^(2 \/ 3) frac(d_mu (frac(K^oo \( rho_0^(upright("U")) \), d_s H (s_2^e \( rho_0^(upright("U")) \)) d_rho s_2^e \( rho_0^(upright("U")) \)))_(mu = mu_0^(upright("opt"))), d_(mu mu) (rho_0^(upright("U")))_(mu = mu_0^(upright("opt")))) $<eq:muoptEpsAs>
where $mu_0^(upright("opt"))$ is given by
#ref(<eq:muopt0>). Obviously, the nontrivial
$epsilon.alt$-dependence is found again as, if $epsilon.alt$ is
sufficiently small, $mu_epsilon.alt^(upright("opt"))$ is a
$O \( epsilon.alt^(2 \/ 3) \)$-perturbation of $mu_0^(upright("opt"))$.
Of course the limitations previously mentioned for
#ref(<eq:mitlimEps>) are also valuable for
#ref(<eq:muoptEpsAs>).

= Application to an aeroelastic aircraft wing system coupled to an NES
<sec:appl>
The methodology presented in previous sections is illustrated here on an
aeroelastic aircraft wing system coupled to an NES (see
#link(<fig:Airfoil>)[3]) which has already been used in the past in
several works about LCO mitigation by means of one or several
NESs~@LeeAIAApI2007@LeeAIAApI2007b@Gendelman2010SIAM@bergeot2019. First,
equations of motion the wing-NES system are presented in
#link(<sec:AirfoilNESmod>)[5.1]. Then, the comparison between
theoretical results and numerical simulations is performed in
#link(<sec:compsec>)[5.2].

== Equations of the aircraft wing model coupled to one NES
<sec:AirfoilNESmod>
The equations of motion of the model presented in
#link(<fig:Airfoil>)[3] can be derived for example by means of the
Lagrange equations. Assuming a small angle between the wing and the
horizontal, the Lagrange equations yield the following equations of
motion with respect to the heave $z$ and the angle of attack (pitch)
$tilde(phi)$ of the wing and to the NES displacement $y$ (see
#link(<fig:Airfoil>)[3])
$ m dot.double(z) + S_phi dot.double(tilde(phi)) + K_z z + C_z dot(z) + q P_a Gamma (tilde(phi) + dot(z) \/ U) + K_z^(upright("NL")) z^3 & +\
C_y #scale(x: 120%, y: 120%)[\(] dot(z) - d dot(tilde(phi)) - dot(y) #scale(x: 120%, y: 120%)[\)] + K_y^(upright("NL")) (z - d tilde(phi) - y)^3 & = 0\
I_phi dot.double(tilde(phi)) + S_phi dot.double(z) + K_phi tilde(phi) + C_phi dot(tilde(phi)) - q e P_a Gamma (tilde(phi) + dot(z) \/ U) + K_phi^(upright("NL")) tilde(phi)^3 & +\
d C_y #scale(x: 120%, y: 120%)[\(] dot(z) - d dot(tilde(phi)) - dot(y) #scale(x: 120%, y: 120%)[\)] + d K_y^(upright("NL")) (z - d tilde(phi) - y)^3 & = 0\
m_y dot.double(y) + C_y #scale(x: 120%, y: 120%)[\(] d dot(tilde(phi)) + dot(y) - dot(z) #scale(x: 120%, y: 120%)[\)] + K_y^(upright("NL")) (d tilde(phi) + y - z)^3 & = 0 $<eq:airfioldim>
where again the time derivative is denoted by an overdot.
$b = L \/ 2$ is the semichord length. $A$ is the aerodynamic center, $B$
the elastic axis, $G$ the center of gravity of the aircraft wing. $e$ is
the location aerodynamic center $A$ measured from $B$ (positive ahead of
$B$). The quantities $m$ and $I_phi$ are respectively the mass of the
wing and its moment of inertia with respect to $B$. $S_phi = m B G$ is
the mass unbalance in the wing. $K_z$ and $K_phi$ are the linear heave
and pitch stiffnesses respectively whereas $K_z^(upright("NL"))$ and
$K_phi^(upright("NL"))$ are the cubic heave and pitch stiffnesses. $C_z$
and $C_phi$ are the heave and pitch damping coefficients. $U$ is the
constant and uniform flow speed around the wing and
$q = 1 / 2 rho_oo U^2$ is the dynamic pressure where $rho_oo$ is the
density of the flow. $P_a$ is the planform of the wing, $Gamma$ is the
lift curve slope and $d$ is the offset attachment of the NES to the
wing. Finally, $m_y$, $C_y$ and $K_y^(upright("NL"))$
($m = 1 \, dots.h \, M$) are the mass, the damping coefficient and the
cubic stiffness of the NES respectively.

#figure(image("source/Airfoil.pdf"),
  caption: [
    Sketch of the two DOFs aircraft wing coupled to one NES. $z$ and
    $tilde(phi)$ are respectively the heave and the angle of attack
    (pitch) of the wing and $y$ is the displacement of the NES. $A$ is
    the aerodynamic center, $B$ the elastic axis, $G$ the center of
    gravity of the aircraft wing. $e$ is the location aerodynamic center
    $A$ measured from $B$ (positive ahead of $B$). $K_z$ and $K_phi$ are
    the linear heave and pitch stiffnesses respectively whereas
    $K_z^(upright("NL"))$ and $K_phi^(upright("NL"))$ are the cubic
    heave and pitch stiffnesses. $C_z$ and $C_phi$ are the heave and
    pitch damping coefficients. $U$ is the constant and uniform flow
    speed around the wing and $d$ is the offset attachment of the NES to
    the wing, also measured from $B$.
  ]
)
<fig:Airfoil>

For convenience, #ref(<eq:airfioldim>) is written in
a dimensionless form as follows
$ tilde(x)'' + s_phi tilde(phi)'' + Omega^2 tilde(x) + zeta_x tilde(x)' + gamma Theta (Theta tilde(phi) + tilde(x)') + tilde(xi)_x tilde(x)^3 + tilde(m)_h tilde(h)'' & = 0\
r_phi^2 tilde(phi)'' + s_phi tilde(x)'' + r_phi^2 tilde(phi) + zeta_phi tilde(phi)' - eta gamma Theta (Theta phi + tilde(x)') + tilde(xi)_phi tilde(phi)^3 + delta tilde(m)_h tilde(h)'' & = 0\
tilde(m)_h tilde(h)'' + tilde(zeta)_h #scale(x: 120%, y: 120%)[\(] delta tilde(phi)' + tilde(h)' - tilde(x)' #scale(x: 120%, y: 120%)[\)] + tilde(xi)_h \( delta tilde(phi) + tilde(h) - tilde(x) \)^3 & = 0 $<eq:airfiolnodim>
where the time $t$ has been replaced by the dimensionless time
$t' = omega_phi t$ (with $omega_phi = sqrt(K_phi \/ I_phi)$) and time
derivative $d_(t')$ is denoted by a prime. The dimensionless
displacements are defined by $tilde(x) = z \/ b$, $tilde(h) = y \/ b$.
Moreover, $delta = d \/ b$, $s_phi = S_phi \/ \( m b \)$,
$Omega = omega_z \/ omega_phi$ (with $omega_z = sqrt(K_z \/ m)$) and
$eta = e \/ b$. $r_phi = sqrt(I_phi \/ \( m b^2 \))$ is the radius of
gyration of the cross section of the wing. The dimensionless nonlinear
stiffnesses and damping coefficients are
$tilde(xi)_x = K_z^(upright("NL")) b^2 \/ \( m omega_phi^2 \)$,
$zeta_x = C_z \/ \( m omega_phi \)$,
$tilde(xi)_phi = K_phi^(upright("NL")) \/ \( m b^2 omega_phi^2 \)$,
$zeta_phi = C_phi \/ \( m b^2 omega_phi \)$,
$tilde(xi)_h = K_y^(upright("NL")) b^2 \/ \( m omega_phi^2 \)$,
$tilde(zeta)_h = C_y \/ \( m omega_phi \)$. The mass and density ratios
are defined by $tilde(m)_h = m_y \/ \( m omega_phi^2 \)$ and
$gamma = b P_a rho_oo Gamma \/ \( 2 m \)$ respectively. Finally, the
bifurcation parameter under consideration is the reduced speed of the
flow $Theta = U \/ \( b omega_phi \)$.

#ref(<eq:airfiolnodim>) has the general form given
by #ref(<eq:systprotec0>) with
$tilde(upright(bold(x))) = \( tilde(x) \, tilde(phi) \)^T$ and
$ upright(bold(tilde(M))) = mat(delim: "(", 1, s_phi; s_phi, r_phi^2) \, & upright(bold(tilde(C))) = mat(delim: "(", zeta_x + gamma Theta, 0; - eta gamma Theta, zeta_phi) \, & upright(bold(tilde(K))) = mat(delim: "(", Omega^2, gamma Theta^2; 0, r_phi^2 - eta gamma Theta^2) \,\
upright(bold(tilde(A))) = \( 1 \, - delta \) \, & upright(bold(tilde(B))) = \( 1 \, - delta \)^T \, & upright(bold(tilde(G)^(N L))) = \( tilde(xi)_x tilde(x)^3 \, tilde(xi)_phi tilde(phi)^3 \)^T . $<eq:matex>

The expression of the nonlinear vector function is
$upright(bold(tilde(g)^(N L))) = (tilde(xi)_x tilde(x)^3 \, tilde(xi)_phi tilde(phi)^3)^T$.
Moreover, one defines rescaled parameters and variables as
$tilde(xi)_x = epsilon.alt xi_x$, $tilde(xi)_phi = epsilon.alt xi_phi$,
$tilde(m)_h = epsilon.alt m_h$, $tilde(zeta)_h = epsilon.alt zeta_h$,
$x = tilde(x) / sqrt(epsilon.alt)$,
$phi = tilde(phi) / sqrt(epsilon.alt)$ and
$h = tilde(h) / sqrt(epsilon.alt)$ to obtain the final form of the
equations of motion
$ x'' + s_phi phi'' + Omega^2 x + zeta_x x' + gamma Theta (Theta phi + x') + epsilon.alt m_h h'' & = 0\
r_phi^2 phi'' + s_phi x'' + r_phi^2 phi + zeta_phi phi' - eta gamma Theta (Theta phi + x') + epsilon.alt delta m_h h'' & = 0\
h'' + zeta_h #scale(x: 120%, y: 120%)[\(] delta phi' + h' - x' #scale(x: 120%, y: 120%)[\)] + xi_h (delta phi + h - x)^3 & = 0 $<eq:airfiolnodim2a>
with $zeta_h = tilde(zeta)_h \/ m_h$ and $xi_h = tilde(xi)_h \/ m_h$.

The physical bifurcation parameter under consideration is the reduced
speed of the air flow $Theta$ and the following parameters for the
primary system are used
$ zeta_x & = 0.01 \, quad zeta_phi = 0.01 \, quad s_phi = 0.2 \, quad r_phi = 0.5 \,\
Omega & = 0.5 \, quad eta = 0.4 \, quad upright("and") quad gamma = 0.2 . $<eq:airfoilpar>

With the parameters #ref(<eq:airfoilpar>), the
aircraft wing model undergoes an Hopf bifurcation at
$Theta_(upright("Hopf"))^(upright("wo")) = 0.933$ at which the real part
of the first eigenvalue of
#ref(<eq:airfiolnodim2a>) vanishes, i.e.
$upright("Re") \( lambda_1 \) = 0$, and then becomes positive. It is
recalled here that the pulsation $omega$ and the generalized bifurcation
parameter $rho$ are defined from the eigenvalue $lambda_1$ of the
unstable mode by #ref(<eq:rhodef>).

The NES setup is defined by
$ m_h = 1 \, quad delta = - 0.8 \, quad xi_h = 5 $<eq:NESpar> and
$zeta_h$ and $epsilon.alt$ which are specified below depending of the
considered example.

#figure(grid(columns: (1fr, 1fr), gutter: 7pt, [(a) #v(2pt) #image("source/pFlutterExSimu_CompSup.pdf", width: 95%)], [(b) #v(2pt) #image("source/pFlutterExSimu_PR.pdf", width: 95%)], [(c) #v(2pt) #image("source/pFlutterExSimu_SMR.pdf", width: 95%)], [(d) #v(2pt) #image("source/pFlutterExSimu_NoSup.pdf", width: 95%)]),
  caption: [
    Direct numerical integration of the wing-NES system
    #ref(<eq:airfiolnodim>) (in blue) depicting
    the several response regimes described in
    #link(<sec:respregimes>)[3.4] with, in addition to
    #ref(<eq:airfoilpar>) and
    #ref(<eq:NESpar>), $epsilon.alt = 0.01$,
    $zeta_h = 0.3$, $xi_h = 4$, $xi_x = 4$ and $xi_phi = 8$. Four values
    of the reduced speed are used, namely: (a) $Theta = 0.94$, (b)
    $Theta = 0.945$, (c) $Theta = 0.97$ and (d) $Theta = 0.98$
    corresponding respectively to complete suppression, mitigation
    through a periodic regime, mitigation through a SMR and finally no
    mitigation of the harmful limit cycle oscillations of the primary
    structure. For comparison purposes, for each situation, a direct
    numerical integration of the wing system without NES is also shown
    (in green).
  ]
)
<fig:pFlutterExSimu>

The several response regimes described in #link(<sec:respregimes>)[3.4]
are illustrated here by means of numerical simulations of the wing-NES
system #ref(<eq:airfiolnodim>) (see
#link(<fig:pFlutterExSimu>)[4]) with, in addition to
#ref(<eq:airfoilpar>) and
#ref(<eq:NESpar>), $epsilon.alt = 0.01$, $zeta_h = 0.3$,
$xi_x = 4$ and $xi_phi = 8$. Four values of the reduced speed are used,
namely: $Theta = 0.94$ (see
@fig:pFlutterExSimu\(a)), $Theta = 0.945$
(see @fig:pFlutterExSimu\(b)),
$Theta = 0.97$ (see
@fig:pFlutterExSimu\(c)) and
$Theta = 0.98$ (see
@fig:pFlutterExSimu\(d)) corresponding
respectively to complete suppression, mitigation through a periodic
regime, mitigation through a SMR and finally no mitigation of the
harmful LCOs of the primary structure. For comparison purposes, for each
situation, a direct numerical integration of the aircraft wing system
without NES is also shown.

== Comparison between theoretical results and numerical simulations
<sec:compsec>
The slow flow dynamics of
#ref(<eq:airfiolnodim2a>), its critical manifold
$cal(M)_0$ #ref(<eq:CM00>), the zeroth-order analytical
expressions of the mitigation limit #ref(<eq:laidNES>)
and of the optimal value of NES damping
coefficient~#ref(<eq:muopt0>) are derived following the
method described in
#ref(<sec:slowflow>), #ref(<sec:critman>), #ref(<sec:predzero>)
respectively. Note that through
#ref(<eq:parammualp>), the parameters $mu$ and
$alpha$ are here defined as $mu = zeta_h \/ omega$ and
$alpha = xi_h \/ omega^2$. Simultaneously, the scaling law of the
trajectory in the neighborhood of the left fold point of $cal(M)_0$,
i.e. #ref(<eq:srAi1>), is computed. Afterwards, solving
#ref(<defNewrhoml>) and finding the root of
#ref(<eq:drho1>),
$rho_epsilon.alt^(upright("U")) \( mu \)$ and
$mu_epsilon.alt^(upright("opt"))$ are obtained. Finally, the asymptotic
analytical expressions of the latter, given by
#ref(<eq:mitlimEps>), #ref(<eq:muoptEpsAs>)
respectively, are computed.

To illustrate the proposed analytical procedure,
@fig:pExAirfoil\(a) shows the critical
manifold $cal(M)_0$ #ref(<eq:CM00>), superimposed to the
direct numerical integration of the slow flow
#ref(<eq:slowRealSlow2>) (see also
@fig:pExAirfoil\(b) for the times series of
$s \( tau \)$ and $r \( tau \)$ focused on the first relaxation cycle)
and its scaling law given by #ref(<eq:srAi1>). The values
of $r^(upright("LF")) = H \( s^(upright("LF")) \)$ (see
#ref(<eq:rNrm>)) and
$r^oo = r^(upright("LF")) + K^oo epsilon.alt^(2 \/ 3)$ (see
#ref(<eq:rinfty>)) are depicted by horizontal lines. The
numerical integration of the slow flow (see red dashed line in
@fig:pExAirfoil\(a)) shows a relaxation
oscillations scenario in $\( s \, r \)$-plane. Indeed, the trajectory of
undergoes a succession of almost horizontal fast parts and slow parts
evolving in the $O \( epsilon.alt \)$-vicinity of the critical manifold
$cal(M)_0$ (here, at the scale of the figure and apart from the fold
points, the trajectory and $cal(M)_0$ seem superimposed). The first
horizontal fast part is from the initial condition
$\( s \( 0 \) = 0.15 \, r \( 0 \) = 0.04 \)$ to the left attracting part
of $cal(M)_0$ and the other are fast jumps between the left and right
attracting parts of $cal(M)_0$ as described in
#link(<sec:respregimes>)[3.4] and in the introduction of
#link(<sec:scallaw>)[4].

The figure reveals a good agreement between the numerical simulation of
the slow flow and its analytical scaling law in the neighborhood of the
left fold point. One can see also that choosing $r^oo$ as the ordinate
of the point of intersection between the trajectory of the slow flow and
the right attracting branch of $cal(M)_0$ is a more accurate
approximation than choosing $r^(upright("LF"))$ as this is the case
within the zeroth-order approximation.

#figure(grid(columns: (1fr, 1fr), gutter: 7pt, [(a) #v(2pt) #image("source/pExAirfoil.pdf", width: 95%)], [(b) #v(2pt) #image("source/pExAirfoil2.pdf", width: 95%)]),
  caption: [
    Illustration of the proposed analytical procedure. (a) The critical
    manifold $cal(M)_0$ #ref(<eq:CM00>) (black line)
    superimposed to the direct numerical integration of the slow flow
    #ref(<eq:slowRealSlow2>) (red line) and its
    scaling law near the left fold point given by
    #ref(<eq:srAi1>) (blue line, the dashed parts are the
    horizontal asymptotes of $s^star.op \( r \)$ due to the zeros of the
    Airy function). The values of
    $r^(upright("LF")) = H \( s^(upright("LF")) \)$ (see
    #ref(<eq:rNrm>)) and
    $r^oo = r^(upright("LF")) + K^oo epsilon.alt^(2 \/ 3)$ (see
    #ref(<eq:rinfty>)) are depicted by magenta and green
    horizontal lines respectively. (b) Times series of $s \( tau \)$
    (blue line) and $r \( tau \)$ (green line) obtained from the
    numerical integration of the slow flow
    #ref(<eq:slowRealSlow2>). The times series
    are focused on the first relaxation cycle. Parameters
    #ref(<eq:airfoilpar>) and
    #ref(<eq:NESpar>) are used with $zeta_h = 0.25$,
    $epsilon.alt = 0.005$ and $Theta = 0.95$.
  ]
)
<fig:pExAirfoil>

In #link(<fig:MitigLim>)[6], the comparison in now performed in terms of
mitigation limit. The theoretical predictions, the one obtained within
the zeroth-order approximation #ref(<eq:laidNES>) and
those derived from the scaling law (solving numerically
#ref(<defNewrhoml>) and the one given by
#ref(<eq:mitlimEps>)) are compared with mitigation
limits measured on direct numerical integration of the approximated slow
flow #ref(<eq:slowRealSlow2>) and on the full
order system~#ref(<eq:airfiolnodim>). In these
last two cases, direct numerical integrations are performed for
increasing values of $rho$ (by increasing $Theta$) and the mitigation
limit corresponds to the last value of $rho$ allowing a harmless
situation. In general one observes at this value the transition from a
SMR to a “no mitigation regime\" as shown for example in
#link(<fig:pFlutterExSimu>)[4]. All the mitigations limits are plotted
with respect to the NES damping coefficient $mu$ (with
$mu in \[ 0 \, 1 \/ sqrt(3) \]$#footnote[Remembering that in this work
only situations in which #ref(<eq:rocond>) holds are
considered.]) and for four values of the perturbation parameter
$epsilon.alt$. One takes first a very little value
($epsilon.alt = 0.001$) to be sure to respect the assumptions of the
asymptotic analysis (i.e. $0 < epsilon.alt lt.double 1$) and thus
validate the method under these conditions. Then, three larger values
are taken ($epsilon.alt = 0.005$, 0.02 and 0.1) to evaluate the
robustness of the method when one deviates from the assumption of a
small $epsilon.alt$. To relate these results to the physical bifurcation
parameter $Theta$, the latter is plotted with respect to the generalized
bifurcation parameter $rho$ in #link(<fig:prho>)[7] for the same values
of $epsilon.alt$ as in #link(<fig:MitigLim>)[6].

First, in #link(<fig:MitigLim>)[6], one can see that the zeroth-order
approximation gives an inaccurate prediction, even for the smallest
value of $epsilon.alt = 0.001$. Moreover, one observes that, on the
contrary, solving #ref(<defNewrhoml>) provides a very
good prediction of the mitigation limits measured on numerical
simulations. For the two following values of $epsilon.alt$ (0.005 and
0.02), these theoretical prediction is closer to the mitigation limits
obtained from numerical simulations of the full order
system~#ref(<eq:airfiolnodim>) than to those
measured on numerical integrations of the approximated slow flow
#ref(<eq:slowRealSlow2>). This is surprising
because #ref(<defNewrhoml>) is derived from
#ref(<eq:slowRealSlow2>) but, in general, in
these kind of unstable systems coupled to NES, the mitigation limits
measured on the full order system are slightly smaller than those
measured on the slow flow. Here, when $epsilon.alt$ increases the
prediction depreciates becoming smaller than mitigation limits obtained
from numerical simulations of
#ref(<eq:slowRealSlow2>) and getting closer to
those measured on full order
system~#ref(<eq:airfiolnodim>). For the largest
value $epsilon.alt = 0.1$, the theoretical mitigation limit obtained
solving #ref(<defNewrhoml>) (in green on the figure)
depreciates again but it is still satisfactory in a qualitative point of
view. Moreover one can see that the theoretical prediction (in green) no
longer has a local maximum and the optimal value of $mu$ is equal to
$1 \/ sqrt(3)$, its limit value for the existence of the SMR regimes
(see #ref(<eq:rocond>)).

Finally, the prediction provided by
#ref(<eq:mitlimEps>) deteriorates enormously for
large values of $epsilon.alt$. This may be due to the non-convergent
nature of the series~#ref(<eq:powerser>), as already
mentioned above (see comments after
#ref(<eq:mitlimEps>)).

#figure(image("source/pMitigLimit.pdf"),
  caption: [
    Theoretical mitigation limits: the one obtained within the
    zeroth-order approximation #ref(<eq:laidNES>) (blue
    line) and those derived from the scaling law (solving numerically
    #ref(<defNewrhoml>) (green line) and the one given
    by #ref(<eq:mitlimEps>) (orange line)) compared
    with mitigation limits measured on direct numerical integration of
    the approximated slow flow
    #ref(<eq:slowRealSlow2>) (gray dots) and on
    the full order system~#ref(<eq:airfiolnodim>)
    (black dots). Parameters #ref(<eq:airfoilpar>)
    and #ref(<eq:NESpar>) are used and ((a)
    $epsilon.alt = 0.001$, (b), $epsilon.alt = 0.005$,
    $epsilon.alt = 0.02$ and (d) $epsilon.alt = 0.1$.
  ]
)
<fig:MitigLim>

#figure(image("source/prho.pdf"),
  caption: [
    The physical bifurcation parameter $Theta$ with respect to the
    generalized bifurcation parameter $rho$. As in
    #link(<fig:MitigLim>)[6], parameters
    #ref(<eq:airfoilpar>) are used and (a)
    $epsilon.alt = 0.001$, (b), $epsilon.alt = 0.005$,
    $epsilon.alt = 0.02$ and (d) $epsilon.alt = 0.1$.
  ]
)
<fig:prho>

Finally, in #link(<fig:pmuOpt>)[8], the theoretical optimal value of the
NES damping coefficient obtained from the zeroth-order approximation
$mu_0^(upright("opt"))$ (see #ref(<eq:muopt0>)) is
compared to those derived from the scaling law
#ref(<eq:srAi1>): the one obtained solving numerically
$d_mu rho = 0$ (with $d_mu rho$ given by
#ref(<eq:drho1>)) together with
#ref(<defNewrhoml>) and the asymptotic expression
given by #ref(<eq:muoptEpsAs>). All this is plotted
with respect to the perturbation parameter~$epsilon.alt$. Assuming a
good agreement between the theoretical prediction of the mitigation
limit obtained solving #ref(<defNewrhoml>) and the
actual value (as shown by #link(<fig:MitigLim>)[6]), only theoretical
values are presented in #link(<fig:pmuOpt>)[8]. The figure highlights
the relevance of the proposed results especially for large values of the
parameter $epsilon.alt$. We can also see that the asymptotic expression
is here able to describe qualitatively the evolution of
$mu^(upright("opt"))$ with respect to the perturbation parameter
$epsilon.alt$ for $epsilon.alt lt.tilde 0.04$. For
$epsilon.alt gt.tilde 0.04$, the prediction obtained from
#ref(<eq:drho1>), #ref(<defNewrhoml>) tends
to $1 \/ sqrt(3)$ whereas the prediction given by
#ref(<eq:muoptEpsAs>) continues to grow.

#figure(image("source/pmuopt.pdf"),
  caption: [
    The theoretical optimal value of the NES damping coefficient with
    respect to the small perturbation parameter $epsilon.alt$. The one
    obtained from the zeroth-order approximation $mu_0^(upright("opt"))$
    given by #ref(<eq:muopt0>) (blue line) is compared
    to those derived from the scaling law
    #ref(<eq:srAi1>): the one obtained solving
    numerically $d_mu rho = 0$ (with $d_mu rho$ given by
    #ref(<eq:drho1>)) together with
    #ref(<defNewrhoml>) (green line) and the
    asymptotic expression given by
    #ref(<eq:muoptEpsAs>) (orange line). As
    previously, parameters #ref(<eq:airfoilpar>) and
    #ref(<eq:NESpar>) are used.
  ]
)
<fig:pmuOpt>

= Conclusion
<sec:ccl>
In this work a mechanical system with one unstable mode coupled to a
Nonlinear Energy Sink (NES) has been studied. The equations of motion of
the system have been first simplified using a reduced-order model for
the primary structure by keeping only its unstable modal coordinates.
Introducing a small perturbation parameter related to the mass ratio
between the NES and the primary structure, the slow flow has been then
derived by means of the complexification-averaging method. Because of
the presence of the small perturbation parameter, the slow flow is
governed by two different time scales. More precisely, within the
framework of the geometric singular perturbation, in its real form it
appears as a $\( 2 \, 1 \)$-fast-slow system. The critical manifold of
this slow flow has been computed. Within the zeroth-order approximation,
i.e. the analysis within the limit case in which the perturbation
parameter is equal to zero, the solution of the slow flow is
approximated by a discontinuous phase trajectory in which the fast and
slow epochs are described independently of each other. In particular,
the slow epoch are supposed to occur on attracting parts of the critical
manifold. Moreover, in this context a theoretical prediction of the
mitigation has been obtained. The mitigation limit being defined as the
value of the generalized bifurcation parameter, which is obtained
rescaling the eigenvalue real part of the primary structure
corresponding to the unstable mode, which separates harmless situations
(in which the NES acts) from the harmful situation (in which the NES
does not act). The results obtained within the zeroth-order
approximation (both phase trajectory and mitigation limit) depreciate
for the largest values of the perturbation parameter (the latter
remaining small in the context of this work).

The novelty of the present work is to use the center manifold theorem to
reduce the slow flow, in the neighborhood of a fold point of its
critical manifold, to a normal form of the dynamic saddle-node
bifurcation. This allowed us to obtain a scaling law for the slow flow
in this neighborhood, i.e. a law which describes the dependance, with
respect to the small perturbation parameter, of the distance between the
critical manifold and the actual trajectory of the slow flow. The law
reveals that the slow flow scales in a nontrivial way with respect to
the perturbation parameter, involving the fractional exponents 1/3 and
2/3. Finally, a theoretical prediction of the mitigation limit has been
deduced from the scaling law. With certain assumptions, it was shown
that this prediction is a correction with respect to the prediction
obtained within the zeroth-order approximations, involving also a
fractional order dependence with respect to the perturbation parameter.

The last section of the paper has been devoted to illustrate and
validate the proposed methodology on a an aeroelastic aircraft wing
model coupled to one NES. The accuracy of the present theoretical
results compared to those obtained on numerical simulations of the full
order system together with the general nature of the method suggest that
the latter may constitute a tool for the practical design of NES.

#heading(level: 1, numbering: none)[Acknowledgments]
<acknowledgments>
We thank the anonymous reviewers for their careful reading of our
manuscript and their many relevant comments and suggestions.

#bibliography("source/Biblio_NES_BBergeot.bib", style: "elsevier-vancouver", title: [References])
