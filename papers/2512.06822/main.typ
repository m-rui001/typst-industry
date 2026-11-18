// Typst format conversion of arXiv:2512.06822v1 under CC BY 4.0.
#set page(paper: "a4", margin: 21mm, numbering: "1")
#set text(font: "Libertinus Serif", size: 11pt)
#set par(justify: true)
#set heading(numbering: "1.1")
#set math.equation(numbering: "(1)")
#align(center)[
  #text(size: 16pt, weight: "bold")[Inertial rotation of a small oblate spheroid in a simple shear flow]
  #v(4pt)
  Z. Wang#super[1], X. M. de Wit#super[1], D. Di Giusto#super[2,3], L. Bergougnoux#super[3],
  É. Guazzelli#super[4], C. Marchioli#super[2], B. Mehlig#super[5], and F. Toschi#super[1,6]

  #super[1] Department of Applied Physics and Science Education, Eindhoven University of Technology, 5600 MB Eindhoven, Netherlands \
  #super[2] Dipartimento Politecnico di Ingegneria e Architettura, University of Udine, 33100 Udine, Italy \
  #super[3] Aix-Marseille Université, CNRS, IUSTI, 13453 Marseille, France \
  #super[4] Université Paris Cité, CNRS, Matière et Systèmes Complexes, UMR 7057, 75013 Paris, France \
  #super[5] Department of Physics, University of Gothenburg, 41296 Gothenburg, Sweden \
  #super[6] CNR-IAC, Via dei Taurini 19, 00185 Rome, Italy

  Correspondence: #link("mailto:z.wang5@tue.nl")
]
#heading(numbering: none)[Abstract]
We compare experiments and fully-resolved particle simulations designed
to match the experimental conditions of a weakly inertial, neutrally
buoyant, moderately oblate spheroid in shear flow under confinement.
Experimental and numerical results are benchmarked against theory valid
for asymptotically small particle Reynolds numbers and for unconfined
systems. By considering the combined effects of confinement and inertia,
sensitivity to initial conditions, and the time span of observation, we
reconcile the findings of theory, experiments, and numerical
simulations. Furthermore, we demonstrate that confinement significantly
influences the orientational stability of log-rolling spheroids compared
to weak inertia, with the primary consequence being a reduced drift rate
towards the stable log-rolling orbit.

= Introduction
<sec:intro>
The rotation of non-spherical particles in inhomogeneous flows is a
central problem in fluid mechanics, with profound implications for both
natural and industrial processes
@voth2017anisotropic@butler2018@MRV2026. The angular dynamics of such
particles govern the bulk rheology of complex fluids and are critical in
phenomena such as the settling of ice crystals in clouds, the dispersion
of fibers in turbulence, and the behaviour of particulate suspensions in
industrial applications. Understanding these dynamics is essential for
predicting the macroscopic properties of particle-laden flows and for
optimizing processes in fields ranging from atmospheric science to
materials engineering.

The foundational work on this problem was conducted by
#cite(<jeffery1922>, form: "prose"), who analysed the angular dynamics
of a spheroid in simple shear flow under the Stokes approximation and in
the absence of Brownian motion. #cite(<jeffery1922>, form: "prose")
demonstrated that the axis of revolution of a spheroid follows one of an
infinite one-parameter family of closed periodic orbits, now known as
Jeffery orbits. These orbits are characterized by their dependence on
initial conditions, rendering the inertialess limit indeterminate.
#cite(<bretherton1962>, form: "prose") later extended these results to
bodies of revolution by introducing an effective aspect ratio, thereby
generalizing the findings of #cite(<jeffery1922>, form: "prose") to a
broader class of particle shapes.

A key issue raised by #cite(<jeffery1922>, form: "prose")'s analysis is
the indeterminacy of the particle final state in the inertialess limit.
In the absence of hydrodynamic interactions, Brownian motion, or other
perturbations, the specific orbit adopted by the particle depends solely
on its initial orientation. This indeterminacy has two significant
consequences. First, it implies an unphysical dependence of the final
state on initial conditions. Second, it suggests that even small
perturbations, such as orientational diffusion or minor shape
asymmetries, can dramatically alter particle dynamics. For very small
colloidal particles, orientational diffusion regularizes the problem by
breaking the degeneracy of the Jeffery orbits, enabling the calculation
of effective viscosities @hinch1972. For larger particles, inertial
effects eliminate the degeneracy. The question is whether this results
in a unique distribution of particle orientations and steady-state
rheology in simple shear flow, thereby eliminating rheological
degeneracy.

#cite(<jeffery1922>, form: "prose") hypothesized that weak inertial
effects would drive particles toward orbits of minimum dissipation,
corresponding to log-rolling (also referred to as spinning) for prolate
spheroids and tumbling for oblate spheroids. Early experimental
investigations by #cite(<taylor1923>, form: "prose") and
#cite(<trevelyan1951>, form: "prose") were inconclusive. The first
analytical study of weak fluid inertia effects on nearly spherical
particles in simple shear flow was conducted by
#cite(<saffman1956>, form: "prose"), which appeared to support
#cite(<jeffery1922>, form: "prose")'s hypothesis. However, subsequent
experiments by #cite(<karnis1966>, form: "prose") with rods and disks
observed particles migrating toward orbits of maximum energy
dissipation, contradicting #cite(<saffman1956>, form: "prose")'s
findings.

The role of weak inertial effects has since been addressed in
theoretical works, including those by @subramanian2005 for slender rods
and by #cite(<einarsson2015b>, form: "prose")@einarsson2015a for
spheroids of arbitrary aspect ratio, derived later also by
#cite(<dabade2016effect>, form: "prose")@marath2017@marath2018. These
studies conclude that fluid and particle inertia lift the degeneracy of
Jeffery orbits. Specifically, slender-body theory predicts that tumbling
is stable for slender fibres @subramanian2005, a finding that has also
been evidenced and extended to prolate spheroids in numerical
simulations @qi2003@you2007@huang2012@rosen2014@mao2014motion.
#cite(<einarsson2015b>, form: "prose")@einarsson2015a computed the
stability of Jeffery orbits under inertial perturbations for spheroids
of arbitrary aspect ratio to the order of the particle Reynolds numbers
using the reciprocal theorem and symmetry arguments, coming to the
opposite conclusion compared with Saffman. Their findings indicate that
tumbling is stable and log-rolling is unstable for prolate spheroids,
while the opposite is true for oblate spheroids, provided they are not
too thin. Additionally, a new bifurcation was identified, whereby an
unstable limit cycle appears for very thin oblate spheroids with an
aspect ratio smaller than 0.14, leading to the stability of both
tumbling and log-rolling orbits.
#cite(<dabade2016effect>, form: "prose") came to the same conclusion
using a slightly different method based on a spheroidal harmonics
formalism. These findings were confirmed by direct numerical simulations
@rosen2015numerical, which further explored the impact of flow
confinement on the stability of tumbling and spinning orbits. In
summary, inertial corrections drive prolate spheroids toward the
tumbling orbit, whereas the situation is more complex for oblate
spheroids. Oblate spheroids are attracted to either the sole log-rolling
orbit or both the vorticity-aligned and tumbling orbits, depending on
whether their aspect ratio is larger or smaller than a critical value of
approximately 0.14.

Recent experiments by #cite(<digiusto2024influence>, form: "prose") have
provided quantitative insights into the influence of inertia on the
stability of Jeffery orbits. These experiments confirmed an irreversible
drift across Jeffery orbits toward attracting limit cycles, in
qualitative agreement with the theory discussed above. For prolate
particles, a unique tumbling motion in the flow-gradient plane was
observed, regardless of initial orientation and aspect ratio. Oblate
particles, however, exhibited a more complex behaviour, drifting toward
either the log-rolling or tumbling orbit depending on their initial
orientation. The only notable difference between the experiments of
#cite(<digiusto2024influence>, form: "prose") and the theoretical
prediction, as well as the simulations of
#cite(<rosen2015numerical>, form: "prose"), is the apparent stability of
tumbling orbits for all oblate particles. This observation has also been
found for other oblate particles, such as rings, by
#cite(<digiusto2025>, form: "prose"). Although theories predict a
bifurcation towards a single stable log-rolling orbit above a critical
aspect ratio of approximately 0.14, this transition has not been clearly
observed in experiments. This discrepancy may be attributed to the need
for longer observation periods to detect the drift towards log-rolling
in the experiments, as noted by #cite(<digiusto2025>, form: "prose").
Also, the theory is valid for asymptotically small particle Reynolds
numbers and for unconfined systems which are conditions not easily met
in experiments.

There remains a need for a more thorough explanation of the
discrepancies between experiments and theoretical predictions. This is
precisely the objective of the present paper, where we propose a
combination of new experimental observations and direct numerical
simulations based upon the immersed boundary method (IBM). The results
are then compared with existing theoretical models in order to resolve
the aforementioned discrepancies, focusing on the effects of inertia and
confinement on the angular dynamics and stability of oblate spheroids in
shear flows. The experimental and numerical methods are detailed in
§ @sec:methods, while § @sec:results presents a comparison of
experimental, numerical, and theoretical results. Conclusions are drawn
in § @sec:conclusion.

#figure(image("source/MAIN_FIG/FIG1.svg", width: 99.0%),
  caption: [
    Oblate spheroid in a simple shear. (a) log-rolling
    (LR) orbit, (b) tumbling (T) in the flow-shear plane. The
    particle-symmetry axis is denoted by $bold(n)$, and the flow
    vorticity by $bold(Omega)$. The basis vectors of the lab coordinate
    system are denoted by $hat(upright(bold(e)))_1$,
    $hat(upright(bold(e)))_2$, and $hat(upright(bold(e)))_3$. (c)
    Definitions of the azimuthal and polar angles, $phi.alt$ and
    $theta$.
  ]
)
<fig:schematic>

= Methods
<sec:methods>
== Problem description
<problem-description>
We consider a neutrally buoyant oblate spheroid at the centre of a
simple shear flow as depicted in figure~@fig:schematic showing (a)
log-rolling (LR) where the particle-symmetry vector, $bold(n)$, is
aligned with vorticity and (b) tumbling (T) where $bold(n)$ lies in the
flow-shear plane. The components of the flow velocity $upright(bold(u))$
in the laboratory coordinate system are
$u_1 = dot(gamma) x_2 \, u_2 = u_3 = 0$, where $dot(gamma) > 0$ is the
shear rate. The matrix $bb(A)$ of fluid-velocity gradients is thus
$bb(A) = \[ \[ 0 \, dot(gamma) \, 0 \] \, \[ 0 \, 0 \, 0 \] \, \[ 0 \, 0 \, 0 \] \]$.
Its symmetric and antisymmetric parts are denoted by $bb(S)$ and
$bb(O)$. The elements of $bb(O)$ are related to the components of the
vorticity vector $bold(Omega) = nabla times upright(bold(u))$ as
$O_(i j) = - 1 / 2 epsilon.alt_(i j k) Omega_k$, where
$epsilon.alt_(i j k)$ is the completely asymmetric rank-3 tensor. For
the given simple shear flow,
$upright(bold(u)) = \( dot(gamma) x_2 \, 0 \, 0 \)$, the only non-zero
component of vorticity is $Omega_3 = - dot(gamma)$. In short,
$bold(Omega)$ aligns with the $hat(upright(bold(e)))_3$-axis. We define
the particle aspect ratio $lambda$ as the ratio of its half-length along
the symmetry axis, $b$, to its half-length perpendicular to that axis,
$a$. Thus, $lambda > 1$ corresponds to prolate particles, whereas
$lambda < 1$ corresponds to oblate particles. Experiments and
simulations are performed in a slab of finite width $L$, and this
confinement is characterised by the non-dimensional parameter,
$kappa = 2 a \/ L$. The fluid and particle inertia are characterized by
the particle Reynolds number Re$""_p = rho_f a^2 dot(gamma) \/ mu$ and
the Stokes number
St$= rho_p a^2 dot(gamma) \/ mu = upright("Re")_p rho_p \/ rho_f$, where
$rho_p$ and $rho_f$ are the particle and fluid densities, respectively,
and $mu$ is the fluid dynamic viscosity. In this study, the particle is
neutrally buoyant (i.e., $rho_p = rho_f$), so that
$upright("Re")_p = upright("St")$.

== Experiments
<experiments>
Experiments are performed in a linear shear cell (500 mm long, 40 mm
wide, and 90 mm deep) at a constant shear rate. The cell is filled with
a solution of pure water and citric acid to achieve isodensity
conditions, as well as Ucon oil to adjust the final viscosity and
control the effect of fluid inertia. We consider an oblate spheroidal
particle with an aspect ratio of $0.56 plus.minus 0.01$, which has been
manufactured using 3D-printing. For each experimental run, the particle
is suspended in the middle of the confined volume, and sheared through a
flexible, transparent plastic belt. Two cameras with perpendicular axes
record the particle dynamics, capturing both the
$hat(upright(bold(e)))_1 - hat(upright(bold(e)))_2$ (flow-gradient) and
$hat(upright(bold(e)))_1 - hat(upright(bold(e)))_3$ (flow-vorticity)
planes. Experiments terminate when the spheroid leaves the camera fields
of view. Further details regarding the experimental protocol can be
found in #cite(<digiusto2024influence>, form: "prose"). In addition to
the experiments reported in
#cite(<digiusto2024influence>, form: "prose"), the present study
considers much longer runs, up to 1.6 times. This is significant because
the stability exponents are minimal at small Re$""_p$ and therefore the
particle rotation experiences a slow initial evolution. Consequently,
the final stable state must be determined through the analysis of
extensive experimental time series.

The particle orientations ($n_1 \, n_2 \, n_3$) are estimated from the
experimental video recordings as presented in
#cite(<digiusto2024influence>, form: "prose"). First,
gradient-thresholding methods are applied to measure the particle
projected lengths in both camera planes and to reconstruct the
three-dimensional Axes-Aligned Bounding Boxes (AABBs). These are
assembled combining the projected $hat(upright(bold(e)))_1$ and
$hat(upright(bold(e)))_2$ lengths observed by the flow-gradient camera
with the $hat(upright(bold(e)))_3$ extension observed in the
flow-vorticity plane, opportunely rescaled to exactly match the
resolution on the suspended particle. Finally, the AABBs are normalized
by dividing by the particle diameter, measured in pixels. Projected
lengths are then stacked and processed by a dense neural network to
infer the particle orientation vector, one single pair of frames at a
time. The neural network is made of three layers with 32 neurons each,
and a final output layer returning the three components of the particle
orientation vector, determining 2,339 trainable parameters. The
Rectified linear unit is set as the activation function for all the
layers except the last one, where linear mapping is adopted. Differently
from #cite(<digiusto2024influence>, form: "prose"), we select the cosine
distance between the true and predicted particle orientation vectors as
the loss function to be minimized in the model training:
$bb(t) h s c r L = 1.0 - bold(n)_(p r e d) dot.op bold(n)_(t r u e)$. A
supplementary penalty on negative $n_3$ values is also added to the loss
function. The neural network is trained with a learning rate $10^(- 3)$
during 500 epochs in a supervised framework on 20,000 synthetic particle
orientations. Training data are generated by exploiting the known
geometrical relations that facilitate the calculation of the particle
projected lengths from a large set of imposed particle orientations, as
described in #cite(<digiusto2024influence>, form: "prose"). The
robustness of this approach is enhanced in this study by introducing
zero-mean random Gaussian noise in the training data.

A statistical approach is adopted to characterise the uncertainties in
the measurements. By repeatedly perturbing 1,000 randomly chosen
experimental recording frames with Gaussian noise, a sub-pixel standard
deviation uncertainty on the projected length measurements in both
camera fields is estimated. Consequently, random outliers in the
reconstructed orbits can be most plausibly attributed to spurious visual
artefacts, such as bubbles, dirt in the fluid, or imperfections in the
transparent plastic belt. Uncertainties associated with the neural
network are also evaluated. The assessment of epistemic uncertainty is
conducted through the analysis of 1,000 randomly selected AABB
measurements. This is achieved by implementing repeated inferences of
the particle orientation vector with activated neurons dropout, a
process which is found to be negligible. Aleatoric uncertainty is then
evaluated by modelling the previously estimated uncertainty
distributions of the AABBs measurements as normal distributions and
repeatedly propagating them through the Neural Network. Regardless of
the orientation of the particle, the uncertainty in the inference of
$n_3$ is found to correspond to a standard deviation
$sigma_(n_3) = 0.06$. It should be noted that this value is contingent
on the number of trainable parameters that constitute the Neural
Network.

== Simulations
<simulations>
The angular dynamics of the spheroid in a shear flow is numerically
investigated by the fully resolved IBM. The fluid domain is represented
by a fixed, Cartesian grid on which the incompressible Navier--Stokes
equations are solved. Immersed particles are represented by Lagrangian
markers on a separate mesh, with the no-slip boundary condition enforced
via a distributed forcing term added to the momentum equations. Fluid
and particle dynamics are fully coupled through the Newton--Euler
equations governing translational and rotational motion. Time
integration is performed using a three-step Runge--Kutta scheme for
advection and particle dynamics, while fluid diffusion is treated using
the Crank--Nicolson method. Incompressibility is maintained by solving a
pressure Poisson equation at each time step. Pressure and momentum are
coupled via a fractional-step method. This IBM framework has been
extensively described and validated
@rai1991direct@verzicco1996finite@de2016moving@piumini2024particle@witkamp2024low.
Here, we consider a neutrally buoyant spheroid in a shear flow generated
by imposing equal and opposite velocities on the top and bottom
boundaries. The gradient direction of the flow is confined in a slab of
width $L$ with no-slip boundary conditions. In the flow-
($hat(upright(bold(e)))_1$) and vorticity- ($hat(upright(bold(e)))_3$)
directions, periodic boundary conditions are applied. The corresponding
sizes in the transverse and stream directions of the simulation domain
are also set to be $L$. The centre of the spheroid remains fixed at the
origin.

== Theory
<theory>
The theory of #cite(<einarsson2015a>, form: "prose") relies upon
symmetry considerations to derive the form of the angular equation of
motion for a neutrally buoyant spheroid in an unbounded simple shear to
linear order in Re$""_p$,
$ dot(n)_i = epsilon.alt_(i j k) omega_j n_k & + beta_1 \( n_p S_(p q) n_q \) (delta_(i j) - n_i n_j) S_(j k) n_k + beta_2 \( n_p S_(p q) n_q \) O_(i j) n_j\
 & + beta_3 (delta_(i j) - n_i n_j) O_(j k) S_(k l) n_l + beta_4 (delta_(i j) - n_i n_j) S_(j k) S_(k l) n_l thin \, $<eq:einarsson>
where repeated indices are summed over. The first term on the r.h.s. is
Jeffery's equation of motion with Jeffery's angular velocity
$bold(omega)$ with components
$omega_j = Omega_j + Lambda epsilon.alt_(j k m) n_k n_l S_(m l)$. The
remaining terms are inertial corrections. The equation is
non-dimensional, where lengths were made dimensionless using the
particle size $a$, and time with the shear rate $dot(gamma)$. The
parameter $Lambda$ is defined as
$Lambda = \( lambda^2 - 1 \) \/ \( lambda^2 + 1 \)$. Note that
equation #link(<eq:einarsson>)[\[eq:einarsson\]] is more generally
valid. It assumes only symmetry and that corrections are of second order
in $bb(S)$ and $bb(O)$. Confinement is hidden in the coefficients
$beta_alpha$ which depend on the shape of the particle. Using the
reciprocal theorem, #cite(<einarsson2015a>, form: "prose") determined
the numerical values of the non-dimensional coefficients for spheroidal
particles. In the dimensional form of
equation #link(<eq:einarsson>)[\[eq:einarsson\]],
$dot(n)_i \, omega_j \, S_(p q)$, and $O_(i j)$ have units of inverse
time, whereas the coefficients $beta_alpha$ have units of time. Note
that, in the comparison with the theory of
#cite(<einarsson2015a>, form: "prose") made by
#cite(<digiusto2024influence>, form: "prose") in their appendix B.1,
dimensionless coefficients $beta_alpha$ were mistakenly used in the
dimensional form of equation #link(<eq:einarsson>)[\[eq:einarsson\]],
which partially affected the plotted theoretical curves without changing
the main conclusions, see @di_giusto_corrigendum_2025
@digiusto2024influence for details.

#cite(<dabade2016effect>, form: "prose") derived the same results as
#cite(<einarsson2015a>, form: "prose"), using different basis functions
to represent the spheroidal particle. In addition, they quoted an
explicit expression for the normalised change of the orbit constant due
to inertia \[their Eq. (5.19)\], see also Appendix B.2 of Di Giusto et
al. (2024). This change is examined in § @subsec:influence to
characterize the relative importance of confinement and inertia on the
drift of the spheroid from the Jeffery orbits.

= Results
<sec:results>
In this section, we present the key findings from our comparative study.
We first examine the angular dynamics of the spheroid by looking at the
time evolution of the components ($n_1$, $n_2$, $n_3$) of its
orientation vector $bold(n)$. Then, we discuss the dependence of the
resulting long-term rotational behaviour on the particle Reynolds number
and on the stability exponent of the LR orbit, $gamma_(upright("LR"))$,
which characterises the exponential decay rate of the orbit constant $C$
through the relation
$C tilde.op e x p \( - gamma_(upright("LR")) t dot(gamma) \)$. In
particular, we quantify this dependence by deriving a scaling law for
the orbit constant $C$. Finally, we discuss the effects of confinement
and inertia by looking at the change in the orbit constant in a single
Jeffery period, which can be conveniently introduced to characterize the
orbit drift. We remark here that both experiments and simulations have
been conducted considering a wall-bounded domain in which confinement
has an effect on particle rotation. Such an effect is not present in the
theoretical predictions, which, however, share exactly the same initial
conditions as the simulations.

#figure(image("source/MAIN_FIG/FIG2_NEW_IC.svg", width: 99.0%),
  caption: [
    Comparison of the experimental time series (blue
    symbols) with the results of numerical simulations (orange solid
    lines) and theoretical predictions of Eq.~(@eq:einarsson) (black
    solid lines) for the case of spheroids with Re$""_p =$ 0.43,
    $lambda = 0.56$ and $kappa = 0.2$. The only difference among the
    different runs is the initial orientations of the particle. The
    plots in panel (a) refer to an experimental run (labeled here as
    `Experiment 10` to follow the notation used in the Jupyter
    notebook). The plots in panel (b) refer to the experimental run
    labeled `Experiment 9` in the Jupyter notebook. The plots in panel
    (c) refer to the experimental run labeled `Experiment 4` in the
    Jupyter notebook. Left-hand panels show the full time evolution of
    particle orientation, while right-hand panels show a zoomed-in view
    to highlight the different behaviour of the curves. The grey shaded
    area indicates the theoretical predictions obtained with initial
    conditions perturbed by $n_3 plus.minus sigma_(n_3)$, and is shown
    here to highlight the sensitivity of the theory to the initial
    orientation of the particle. See supplementary materials for the
    directory of the figure including the data, animation movies, and
    the Jupyter notebook,
    #link("https://cocalc.com/share/public_paths/7775c0fbf82ac429d6a9a32ba46f99ed7b8ff788/figure_2").
  ]
)
<fig:comparison>

== Time evolution
<subsec:timeevolution>
Figure @fig:comparison shows a comparison between experimental time
series (blue symbols), ab-initio simulations (orange thick lines), and
theoretical predictions obtained by numerically integrating
equation #link(<eq:einarsson>)[\[eq:einarsson\]] (black solid lines).
The time series refer to different experimental runs conducted for the
case of a spheroid with Re$""_p$ = 0.43, $lambda = 0.56$ and
$kappa = 0.2$, which is chosen here as reference for the discussion. The
difference between each run is just the initial orientation of the
particle, namely the initial values of ($n_1$, $n_2$, $n_3$). Additional
time series for the same particle geometry and size are provided in the
Supplementary Material, where the directory of the figure including the
data and the Jupyter notebook is given. The grey shaded area around the
black lines indicates the theoretical predictions obtained when the
initial conditions are perturbed by $n_3 plus.minus sigma_(n_3)$, and is
shown to highlight the sensitivity of the dynamics to small changes in
the initial orientation imposed on the spheroid. The two boundaries of
the shaded region (gray solid lines) correspond to the fastest and
slowest convergence cases. The left-hand panels of
figure @fig:comparison refer to the entire time evolution of $n_1$,
$n_2$, and $n_3$, which covers $t dot(gamma) = 500$ dimensionless time
units, for the same particle geometry but three different initial
orientations. The right-hand panels provide a zoomed-in view of the
first 100 time units, to highlight the different behaviour of the
curves.

Overall, experiments, simulations, and theory are able to qualitatively
capture the oscillating and decaying behaviour of $n_1$ and $n_2$. As
far as the time evolution of $n_3$ is concerned, the theoretical
predictions and numerical simulations show a consistent increase of
$n_3$ towards unity from very small values and thus exhibit a general
tendency to drift towards the LR orbit. This indicates that LR is stable
while T is unstable. The oscillation frequency predicted by the theory
is always slightly higher than that measured in experiments, and
simulation results generally fall in between. A more substantial
difference can be seen from the convergence rate, which appears to be
always faster for the theory compared to the simulations. This can be
attributed to the presence of confinement effects in the latter, as we
shall show hereafter. Likewise, confinement can also explain the
observed reduction in oscillation frequency when comparing the
simulation and the theory, which is found to decrease by approximately
8% as the confinement $kappa$ increases from 0.2 to 0.7 in the numerical
simulations.

The drift of the orbit is not always observed within the time window
available for the experiments (see figure @fig:comparison\(a) and
figure @fig:comparison\(b), for instance), which shows a much slower
drift towards LR when the initial condition is close to the T orbit. In
this case, the experimental measurements appear to be too short to
definitively confirm that T is unstable. The evolution of $n_3$ also
highlights a strong dependence on the initial orientation, which is not
observed for $n_1$ and $n_2$. For example, in
figure @fig:comparison\(b), the convergence rate is found to change by
as much as 30% when the initial value of $n_3$ is changed by an amount
equal to $sigma_(n_3)$. This shows that even small perturbations in the
initial orientation can significantly affect the predicted relaxation
dynamics, leading to experimental trajectories that may lie outside of
the grey shaded region associated with the theoretical predictions. It
should be noted that the experimental measurements of the three
components exhibit increased noise at values close to zero. This noise
is intrinsic to the measurement system and methodology. In contrast,
macroscopic disturbances such as bubbles, dirt, or imperfections of the
plastic belt primarily contribute to the more distant scattered points
observed in the data.

== Influence of confinement and inertia
<subsec:influence>
To verify the relative importance of confinement and inertia effects on
the stability of the LR and T orbits, we next examine the time evolution
of the orbit constant $C$ @hinch1979rotation@leal1971effect, defined
such that the Jeffery orbits are of the form:
$ tan phi.alt & = lambda tan [frac(t dot(gamma), lambda + \( 1 \/ lambda \))] thin \,\
tan theta & = frac(C lambda, \( lambda^2 cos^2 phi.alt + sin^2 phi.alt \)^(1 \/ 2)) thin \, $<Jefferey>
with $n_1 = sin theta sin phi.alt$, $n_2 = sin theta cos phi.alt$, and
$n_3 = cos theta$ (the definitions of the azimuthal and polar angles,
$phi.alt$ and $theta$, are demonstrated in Fig.~@fig:schematic\(c)).
Note that LR-orbits are characterized by $C = 0$, while T-orbits are
characterized by $C = oo$. Appendix @sec:Ccalc yields more details on
the procedure adopted in the present study to calculate $C$. To single
out the effect of confinement, the time evolution of $C$ as predicted by
theory (dashed line) is compared to the simulation results (shaded green
lines) in panel (a) of figure @fig:drift, for different values of
$kappa$ when Re$""_p = 0.43$. The inset in this panel shows the
behaviour of the stability exponent as a function of $kappa$ when
rescaled by Re$""_p$. To single out the effect of inertia, in panel (b)
of Figure @fig:drift, we show the time evolution of $C$ for different
values of Re$""_p$ when $kappa = 0.2$. In all cases, the initial
particle orientation is the same as in `Experiment 4`
(figure @fig:comparison\(c)), for which the agreement between
simulations and experiments is best.

Figure @fig:drift confirms that the orbit drift is influenced by both
confinement, which acts to decrease $gamma_(upright("LR"))$ at
increasing $kappa$ (see figure @fig:drift\(a) and its inset), and
inertia, which acts to increase $gamma_(upright("LR"))$ at increasing
Re$""_p$ (see figure @fig:drift\(b) and its inset). In other words,
confinement leads to a slower drift towards a stable LR-orbit whereas
inertia favours a faster drift. Due to the intrinsic limitations of
numerical simulations, a truly unconfined case ($kappa = 0$) cannot be
realised, as both the particle size and the domain height remain finite.
However, we can vary the confinement and assess the asymptotic behaviour
as the unconfined case $kappa = 0$ is approached. The inset of
figure @fig:drift\(a) shows that the stability exponent of the LR-orbit
$gamma_(bb(t)) h r m L R$, calculated as explained in
Appendix @sec:Ccalc, exhibits a clear scaling behaviour with respect to
Re$""_p$, such that $gamma_(bb(t)) h r m L R \/ upright("Re")_p$
collapses on a single value for a given confinement $kappa$. This trend
is consistent with that obtained by
#cite(<rosen2015numerical>, form: "prose") for much smaller particle
Reynolds number, Re$""_p = 2.5 times 10^(- 4)$. Furthermore, the inset
shows that, crucially, the stability exponent indeed approaches the
theoretical predictions (orange square) upon extrapolation of the curves
to $kappa = 0$. A linear fit yields the relation
$gamma_(upright("LR")) \/ upright("Re")_p = - 0.0389 kappa + 0.035$
(black dashed line). This implies that all the curves shown in
figure @fig:drift\(a) collapse onto a single curve when time is rescaled
by Re$""_p^(- 1)$, namely when $C$ is plotted against
$t dot(gamma) times upright("Re")_p$ (see the Jupyter Notebook). Note
that the linear fit is valid for weakly inertial particles. Indeed, at
the limiting value $R e_p = 0$, no orbit drift occurs and hence
$gamma_(L R) = 0$. An important finding is that the linear relation
between $gamma_(upright("LR")) \/ upright("Re")_p$ and $kappa$
incorporates both confinement and inertia effects on
$gamma_(upright("LR"))$ and can be used to make proper comparisons
between theory, which was derived for inertialess particles in unbounded
shear flow, and experiments, which are inevitably affected by flow
confinement and are typically performed with weakly inertial particles.

#figure(image("source/MAIN_FIG/FIG3_NEW.svg", width: 100.0%),
  caption: [
    Quantification of the orbit drift. Panel (a): drift of
    the orbit constant $C$ as a function of time for different values of
    $kappa$ for Re$""_p = 0.43$ (simulation results with the
    experimental setting). The dashed orange line shows the theoretical
    prediction obtained by numerical integration of Eq.~(@eq:einarsson)
    for the same particle geometry and with the same initial particle
    orientation as in `Experiment 4` (see figure @fig:comparison). The
    orange square in the inset is the corresponding value of
    $gamma_(bb(t)) h r m L R \/ upright("Re")_p$. A systematic scanning
    of the dependence of $gamma_(bb(t)) h r m L R \/ upright("Re")_p$ on
    $kappa$ for Re$""_p = 0.30$ (squares), Re$""_p = 0.43$ (triangles,
    experimental setting), and Re$""_p = 0.60$ (stars), is shown in the
    inset. The black dashed line represents a linear fit with
    $gamma_(upright("LR")) \/ upright("Re")_p = - 0.0389 kappa + 0.035$.
    Panel (b): drift of the orbit constant $C$ as a function of time for
    different values of Re$""_p$ for $kappa = 0.2$ (simulation results
    with the experimental setting). A systematic scanning of the
    dependence of $gamma_(bb(t)) h r m L R \/ upright("Re")_p$ on
    Re$""_p$ for $kappa = 0.2$ (squares, experimental setting),
    $kappa = 0.4$ (triangles), and $kappa = 0.6$ (stars) is shown in the
    inset, where the dashed orange line represents the asymptotic value
    $gamma_(upright("LR")) \/ upright("Re")_p = 0.035$ that the linear
    fit yields as $kappa arrow.r 0$. See supplementary materials for the
    directory of the figure including the data and the Jupyter notebook,
    #link("https://cocalc.com/share/public_paths/7775c0fbf82ac429d6a9a32ba46f99ed7b8ff788/figure_3").
  ]
)
<fig:drift>

#figure(image("source/MAIN_FIG/FIG5.svg", width: 100.0%),
  caption: [
    Normalized change in the orbit constant in a single
    Jeffery period,
    $Delta C \/ \( C^2 + 1 \) times upright("Re")_p^(- 1) times xi_0^2$,
    plotted as a function of $C \/ \( C + 1 \)$ for an oblate spheroid.
    Note that $C \/ \( C + 1 \) = 0$ and $C \/ \( C + 1 \) = 1$
    correspond to the LR and T modes, respectively. Colored symbols
    refer to the simulation results at varying $kappa$, shaded green
    symbols in Panel (a), or at varying Re$""_p$, shaded blue symbols in
    Panel (b). The red dashed line shows the theoretical prediction in
    the slender limit @einarsson2015a@dabade2016effect. See
    supplementary materials for the directory of the figure including
    the data and the Jupyter notebook,
    #link("https://cocalc.com/share/public_paths/7775c0fbf82ac429d6a9a32ba46f99ed7b8ff788/figure_4").
  ]
)
<fig:DCmap>

The effects of confinement and inertia can be examined further by
avoiding the ambiguity of an arbitrary initial condition. This analysis
can be performed by considering the behaviour of the normalised change
in the orbit constant in a single Jeffery period, as done in
#cite(<dabade2016effect>, form: "prose"), see also details in
#cite(<digiusto2024influence>, form: "prose"). Changes in the orbit
constant can be calculated as discrete differences $Delta C$ over each
period of rotation, which we computed using the simulation results.
Positive increments of the orbit constant indicate that the particle is
drifting towards a T orbit ($C = oo$, i.e. $C \/ \( C + 1 \) = 1$)
whereas negative increments indicate that the particle is attracted to
the vorticity-aligned LR orbit ($C = 0$, i.e., $C \/ \( C + 1 \) = 0$).

Our results for the case of oblate particles with aspect ratio
$lambda = 0.56$, are shown in figure @fig:DCmap, where the normalised
change in the orbit constant in a single period,
$Delta C \/ \( C^2 + 1 \) upright("Re")_p^(- 1) xi_0^2$, is plotted
against the normalized orbit constant $C \/ \( C + 1 \)$ for all the
simulations. To keep the drift finite in the near-sphere limit,
$xi_0 arrow.r oo$, the normalisation for $Delta C$ also uses the factor
$xi_0$, defined as $xi_0 = sqrt(1 \/ \( 1 - lambda^2 \))$ for an oblate
particle. We compare the orbit drift measured in the simulations with
the theoretical prediction. Here we show Eq. (5.19) from
#cite(<dabade2016effect>, form: "prose"). The same curve (within
numerical precision) is obtained using
Eq.~#link(<eq:einarsson>)[\[eq:einarsson\]] and
#link(<Jefferey>)[\[Jefferey\]].

Figure @fig:DCmap clearly shows that inertia and confinement cause the
prolate spheroid to drift towards the LR mode starting from an arbitrary
initial orientation, given here by the first right-end point of each
colored curve. This is in agreement with previous theoretical studies,
which have shown that, while prolate spheroids are only pushed towards
the T orbit, oblate spheroids drift towards a steady LR orbit regardless
of their initial orientation provided that their aspect ratio is greater
than a critical value of approximately 0.14 @einarsson2015a. Only below
such critical value, a bifurcation in the orientation dynamics can be
observed and distinct basins of orientations that asymptote to the LR
and T modes appear, separated by a critical value
$C^(*) tilde.eq sqrt(35)$, i.e. $C^(*) \/ \( C^(*) + 1 \) tilde.eq 0.86$
as predicted by @dabade2016effect. The lack of points near or above this
critical value in figure @fig:DCmap indicates precisely that the
particles never drift toward a full T orbit, even when the initial
condition imposed in the simulations is close to that of a T orbit.

The influence of confinement is clearly visible in the plots of panel
(a), where the curves associated to different confinement ratios, from
$kappa = 0.2$ (weak confinement) to $kappa = 0.7$ (strong confinement),
are shown at fixed Re$""_p$. In all cases, as $kappa$ increases, the
normalized increments become smaller over the range of
$C \/ \( C + 1 \)$ covered by the simulations and the curves flatten
out, shifting progressively apart from the theoretical predictions. The
latter are always found to predict a stronger drift for an unconfined
viscous shear flow. Overall, confinement appears to weaken the intensity
of the orbit drift and stabilize the orbit executed by the particles.
The plots shown in panel (b) show the influence of inertia at a given
confinement ratio. While the curves are slightly spread at a low
confinement ratio ($kappa = 0.2$), they collapse (as expected) at a high
confinement ratio ($kappa = 0.7$). This suggests a saturation of the
inertial effect above a certain threshold, which can also be appreciated
in the inset of figure @fig:drift\(b).

= Discussions and concluding remarks
<sec:conclusion>
In this study, we have compared experimental measurements of the angular
dynamics of a weakly-inertial
(Re$""_p tilde.eq bb(t) h c a l O \( 0.1 \)$), neutrally-buoyant, oblate
spheroid in simple shear flow with fully-resolved particle simulations,
under the same conditions of confinement (parametrised by the
confinement ratio $kappa$), and with theoretical prediction, which is
strictly valid in the limit $kappa arrow.r 0$ and Re$""_p arrow.r 0$. We
have focused on whether LR is the only stable orbit for a moderately
oblate spheroid at weak inertia and have demonstrated that confinement
and inertia greatly influence the angular stability of the spheroid.

In the present simulations, the moderately oblate spheroid is attracted
to the sole LR orbit as its aspect ratio exceeds 0.14. However,
confinement results in quantitative differences in the time evolution of
the particle orientation components ($n_1$, $n_2$, $n_3$). Drift towards
the LR orbit always occurs faster in the theories than in the
simulations that account for confinement. This drift may not always be
observed within the time window available for the experiments.
Additionally, even small but finite experimental uncertainties in the
measured values of the orientation components affect the orientational
dynamics, see figure @fig:comparison. Even small uncertainties in the
initial state have the potential to substantially alter the quantitative
prediction at later times. In summary, we have been able to reconcile
the findings of theory, experiments, and numerical simulations by
considering the combined effects of confinement and inertia, sensitivity
to initial conditions, and the time span of observation.

Importantly, our investigation reveals that the effects of confinement
($kappa$) and inertia (Re$""_p$) on particle drift dynamics can
sometimes counteract each other. More precisely, confinement leads to a
slower drift towards a stable LR orbit, whereas inertia favours a faster
drift. The impact of confinement is clearly significant, as evidenced by
the collapse of the stability exponent of the LR-orbit
$gamma_(upright("LR")) \/ upright("Re")_p$ as a function of $kappa$
across different Re$""_p$ values (see figure @fig:drift\(a) inset), in
contrast to the distinct levels observed in
$gamma_(upright("LR")) \/ upright("Re")_p$ versus Re$""_p$ at fixed
$kappa$ (see figure @fig:drift\(b) inset). The effect of confinement is
also clearly visible when analysing the change in the orbit constant
over a single Jeffery period, where even slight confinement produces a
significant deviation from the theories for which $kappa arrow.r 0$ (see
figure @fig:DCmap). Increasing confinement appears to weaken the
intensity of the orbit drift, whereas increasing inertia leads to
saturation. These findings were suggested in
#cite(<digiusto2024influence>, form: "prose"), but have now been
rationalised. These results indicate that finite-size effects due to
confinement play a dominant role in determining the particle
orientational dynamics in the weakly inertial regime. Furthermore, they
emphasise the sensitivity of particle dynamics to boundary conditions.
They suggest that hydrodynamic interactions with neighbouring particles,
which can be considered an effective form of confinement, albeit a more
complex one, would strongly alter particle angular dynamics in dense
suspensions. Such interactions can also break the symmetries assumed
when deriving equation #link(<eq:einarsson>)[\[eq:einarsson\]],
potentially limiting the applicability of dilute-limit theories.

It is also useful to remark that one factor that may influence the
stability of the angular dynamics is the slip-induced fluid inertial
torque, for example, due to sedimentation. In this case, the angular
motion of the particle depends on the direction of gravity relative to
the shear plane. When gravity acts along the flow or vorticity
directions, the behaviour remains similar to neutrally buoyant
particles. However, for gravity along the shear direction and
sufficiently large sedimentation Reynolds numbers, particles tend to
orient upstream, with an angular drift toward the vorticity axis
@subramanian2005. These subtleties do not affect our interpretation of
the experimental results, where the particles were placed in the centre
of the simple shear, ensuring that slip is negligible; the conditions
are given by #cite(<candelier2019time>, form: "prose"). We further note
that simple shear flow is a special case amongst all steady linear
flows, satisfying $O_(i j) O_(j k) = - S_(i j) S_(j k)$, and
$S_(i j) O_(j k) = - O_(i j) S_(j k)$. For other steady linear flows --
such as pure straining (extensional) and solid-body rotational flows --
there are additional terms in
equation #link(<eq:einarsson>)[\[eq:einarsson\]] @candelier2015,
yielding different conclusions concerning the effect of fluid (and
particle) inertia. In a solid-body rotation, only particle inertia
affects the angular velocity of the spheroid and T is stable for prolate
particles while LR is stable for oblate nearly spherical particles. In
extensional flow, prolate and oblate particles orient their axes of
symmetry in the flow plane and eventually reach fixed orientations. The
effects of fluid inertia in other linear flows, however, remain largely
unexplored.

The results discussed in this paper represent an advancement of
knowledge because they shed light on the stability of the angular
dynamics of non-spherical particles at moderate fluid inertia, which is
fundamental to understanding the behaviour of suspensions in practical
flows. Many applications -- from industrial processes including paper
and pulp production @lundell2011fluid and combustion soot emission
@moffet2009situ to dispersion systems related to foods, cosmetics, and
pharmaceuticals products and particle sorting
@erni2009continuous@martel2014inertial -- operate at Reynolds numbers
where fluid-inertia effects are non-negligible. Clarifying the angular
stability in this regime not only reconciles experimental observations
with theoretical predictions, but also provides a solid foundation for
future studies on particle interactions @leal1980particle, suspension
rheology @huang2012shear@mao2014motion@voth2017anisotropic@butler2018,
and microfluidics @sajeesh2014particle@martel2014inertial.

#heading(numbering: none)[Supplementary data]
Supplementary movies will be made available upon publication.

#heading(numbering: none)[Acknowledgements]
This work is supported by the Netherlands Organization for Scientific
Research (NWO) through the use of supercomputer facilities (Snellius)
under Grant No. 2023.026, 2025.008. This publication is part of the
project "Shaping turbulence with smart particles" with Project No.
OCENW.GROOT.2019.031 of the research program Open Competitie ENW XL
which is (partly) financed by the Dutch Research Council (NWO). BM
thanks F. Candelier for discussions. The work of BM was in part
supported by VR grant no. 2021-4452, and BM kindly acknowledges support
from the Eindhoven Artificial Intelligence Systems Institute (EAISI) of
TU/e for support with a visiting professorship at TU/e. D.D.G.
acknowledges the Universitá Italo-Francese, Bando Vinci 2021, cap. 2,
progetto C2-257555 "Fibre flessibili in flusso turbolento ad elevato
numero di Reynolds" for the generous funding during the execution of the
experiments discussed in this manuscript.

#heading(numbering: none)[Declaration of interests]
The authors report no conflict of interest.

#heading(numbering: none)[Data availability statement]
The experimental recordings that support the findings of this study are
openly available at
#link("https://huggingface.co/datasets/ddg93/LeRing_JFM_experiments/tree/main")[LeRing JFM experiments].

#heading(numbering: none)[Author ORCIDs]
Z. Wang, #link("https://orcid.org/0009-0003-4841-2952")\; \
X. M. de Wit, #link("https://orcid.org/0000-0002-7731-0598")\; \
D. Di Giusto, #link("https://orcid.org/0000-0003-4413-2454")\; \
L. Bergougnoux, #link("https://orcid.org/0000-0002-2988-4394")\; \
É. Guazzelli, #link("https://orcid.org/0000-0003-3019-462X")\; \
C. Marchioli, #link("https://orcid.org/0000-0003-0208-460X")\; \
B. Mehlig, #link("https://orcid.org/0000-0002-3672-6538")\; \
F. Toschi, #link("https://orcid.org/0000-0001-5935-2332").

#bibliography("references.bib", style: "chicago-author-date")

= Additional data
<sec:app_data>
In this Appendix, we present additional comparisons among experiments,
theory, and simulations, as shown in figure @fig:app_1[]?@fig:app_7. The
experiments shown here were carried out using the same particle geometry
and shear flow settings as those discussed in figure @fig:comparison of
the main text. The parameter settings in the simulations are the same as
those in figure @fig:comparison of the main text: Re$""_p$ = 0.43,
$lambda = 0.56$, $kappa = 0.2$, grid size $N^3 = 256^3$, domain size
$L = 6.1$. The only difference among these runs is the initial
orientation of the particle.

#figure(image("source/SI_FIG/Supp_mat_experiment_1.svg", width: 99.0%),
  caption: [
    Comparison of experimental time series (filled symbols) with results
    of numerical simulations (thick solid lines) and theoretical
    predictions (thin solid lines) for the case `Experiment 1`. Panels
    on the left illustrate the full time series, while panels on the
    right show the corresponding zoomed-in views.
  ]
)
<fig:app_1>

#figure(image("source/SI_FIG/Supp_mat_experiment_2.svg", width: 99.0%),
  caption: [
    Comparison of experimental time series
    (filled symbols) with results of numerical simulations (thick solid
    lines) and theoretical predictions (thin solid lines) for the case
    `Experiment 2`. Panels on the left illustrate the full time series,
    while panels on the right show the corresponding zoomed-in views.
  ]
)
<fig:Appendix_FIGURE_RUN2>

#figure(image("source/SI_FIG/Supp_mat_experiment_5.svg", width: 99.0%),
  caption: [
    Comparison of experimental time series
    (filled symbols) with results of numerical simulations (thick solid
    lines) and theoretical predictions (thin solid lines) for the case
    `Experiment 5`. Panels on the left illustrate the full time series,
    while panels on the right show the corresponding zoomed-in views.
  ]
)
<fig:Appendix_FIGURE_RUN5>

#figure(image("source/SI_FIG/Supp_mat_experiment_6.svg", width: 99.0%),
  caption: [
    Comparison of experimental time series
    (filled symbols) with results of numerical simulations (thick solid
    lines) and theoretical predictions (thin solid lines) for the case
    `Experiment 6`. Panels on the left illustrate the full time series,
    while panels on the right show the corresponding zoomed-in views.
  ]
)
<fig:Appendix_FIGURE_RUN6>

#figure(image("source/SI_FIG/Supp_mat_experiment_7.svg", width: 99.0%),
  caption: [
    Comparison of experimental time series
    (filled symbols) with results of numerical simulations (thick solid
    lines) and theoretical predictions (thin solid lines) for the case
    `Experiment 7`. Panels on the left illustrate the full time series,
    while panels on the right show the corresponding zoomed-in views.
  ]
)
<fig:Appendix_FIGURE_RUN7>

#figure(image("source/SI_FIG/Supp_mat_experiment_8.svg", width: 99.0%),
  caption: [
    Comparison of experimental time series
    (filled symbols) with results of numerical simulations (thick solid
    lines) and theoretical predictions (thin solid lines) for the case
    `Experiment 8`. Panels on the left illustrate the full time series,
    while panels on the right show the corresponding zoomed-in views.
  ]
)
<fig:Appendix_FIGURE_RUN8>

#figure(image("source/SI_FIG/Supp_mat_experiment_11.svg", width: 99.0%),
  caption: [
    Comparison of experimental time series (filled symbols) with results
    of numerical simulations (thick solid lines) and theoretical
    predictions (thin solid lines) for the case `Experiment 11`. Panels
    on the left illustrate the full time series, while panels on the
    right show the corresponding zoomed-in views.
  ]
)
<fig:app_7>

= Calculation of the orbit constant $C$
<sec:Ccalc>
The orbit constant associated to the time series, shown in
figure @fig:comparison, can be obtained by measuring the periods of the
oscillations of $n_3$ over time, as shown in figure @fig:drift_a for the
case labelled as `Experiment 4`. Note that the theoretical prediction
was used here to calculate $C$. It can be observed that $C$ tends to
zero with an exponential decay
$C tilde.op e x p \( - gamma_(upright("LR")) t dot(gamma) \)$ with
$gamma_(bb(t) h r m L R)$ the stability exponent of the LR-orbit
@einarsson2015a. This exponent can be extracted by fitting the
exponential decay rate of the orbit constant deviations from the stable
LR-orbit (i.e., $C = 0$).

#figure(image("source/MAIN_FIG/C_definition.svg", width: 100.0%),
  caption: [
    Calculation of the orbit constant $C$ (shown here for
    the case `Experiment 4`, chosen as reference): Each value
    corresponds to one oscillation period of the orientation vector
    $n_3$. When the particle trajectory drifts toward its LR orbit, $C$
    decays exponentially in time as a function of the stability exponent
    $gamma_(upright("LR"))$ ($gamma_(upright("LR")) > 0$).
  ]
)
<fig:drift_a>
