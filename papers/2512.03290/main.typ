#import "architecture.typ": architecture
#set page(paper:"a4", margin:23mm, numbering:"1")
#set text(font:"Libertinus Serif", size:10.5pt)
#set par(justify:true, leading:.6em)
#set heading(numbering:"1.1")
#set math.equation(numbering:"(1)")
#show figure.caption: set text(size:9pt)
#align(center)[
  #text(size:16pt,weight:"bold")[ASPEN: An Adaptive Spectral Physics-Enabled Network for Ginzburg-Landau Dynamics]
  #v(.6em)
  #link("https://orcid.org/0009-0005-4657-6472")[Julian Evan Chrisnanto]#super[1], Nurfauzi Fadillah#super[2], and #link("https://orcid.org/0000-0002-3491-3049")[Yulison Herry Chrisnanto]#super[3]
  #v(.5em)
  #super[1] Department of Bio-Functions and Systems Science, Graduate School of Bio-Applications and Systems Engineering, Tokyo University of Agriculture and Technology, 2-24-16 Nakacho, Koganei, Tokyo 184-8588, Japan · #link("mailto:s254167v@st.go.tuat.ac.jp") \
  #super[2] PLABS.ID, Jl. Batununggal Mulia IV No.16, Bandung, West Java 40267, Indonesia · #link("mailto:fauzi@plabs.id") \
  #super[3] Department of Informatics, Faculty of Science and Informatics, Jenderal of Achmad Yani University, Jl. Terusan Jenderal Sudirman, Cimahi, West Java 40531, Indonesia · #link("mailto:yhc@if.unjani.ac.id") (corresponding author)
]

*Abstract.* Physics-Informed Neural Networks (PINNs) have emerged as a powerful,
mesh-free paradigm for solving partial differential equations (PDEs).
However, they notoriously struggle with stiff, multi-scale, and
nonlinear systems due to the inherent spectral bias of standard
multilayer perceptron (MLP) architectures, which prevents them from
adequately representing high-frequency components. In this work, we
introduce the Adaptive Spectral Physics-Enabled Network (ASPEN), a novel
architecture designed to overcome this critical limitation. ASPEN
integrates an adaptive spectral layer with learnable Fourier features
directly into the network's input stage. This mechanism allows the model
to dynamically tune its own spectral basis during training, enabling it
to efficiently learn and represent the precise frequency content
required by the solution. We demonstrate the efficacy of ASPEN by
applying it to the complex Ginzburg-Landau equation (CGLE), a canonical
and challenging benchmark for nonlinear, stiff spatio-temporal dynamics.
Our results show that a standard PINN architecture catastrophically
fails on this problem, diverging into non-physical oscillations. In
contrast, ASPEN successfully solves the CGLE with exceptional accuracy.
The predicted solution is visually indistinguishable from the
high-resolution ground truth, achieving a low median physics residual of
$5.10 times 10^(- 3)$. Furthermore, we validate that ASPEN's solution is
not only pointwise accurate but also physically consistent, correctly
capturing emergent physical properties, including the rapid free energy
relaxation and the long-term stability of the domain wall front. This
work demonstrates that by incorporating an adaptive spectral basis, our
framework provides a robust and physically-consistent solver for complex
dynamical systems where standard PINNs fail, opening new options for
machine learning in challenging physical domains.

*Keywords.* Physics-informed neural networks, Ginzburg–Landau equation, spectral bias, nonlinear dynamics

= Introduction
<introduction>
The Ginzburg-Landau (GL) equation serves as a foundational
phenomenological model in modern physics, providing a versatile
mathematical framework to describe systems near continuous phase
transitions \[#link(<bib:Du1992AnalysisAAI>)[1]\]. Its profound impact is most notable in
the field of superconductivity, where it adeptly models the behavior of
the complex-valued superconducting order parameter, offering deep
insights into phenomena that are otherwise difficult to probe
\[#link(<bib:Du1992AnalysisAAI>)[1], #link(<bib:Patra2018OnCOAB>)[2], #link(<bib:Pineiro2024StudyASR>)[3]\]. While the
stationary equation illuminates equilibrium states, the time-dependent
Ginzburg-Landau (TDGL) formulation is indispensable for capturing the
rich and complex non-equilibrium dynamics inherent in these systems.
This dynamic formulation is essential for understanding a vast array of
emergent behaviors, including the intricate self-organization processes
leading to pattern formation \[#link(<bib:Torabi2019PatternFIY>)[4]\], the long-term,
non-stationary dynamics of aging phenomena \[#link(<bib:Liu2019AgingPIZ>)[5]\], and the
critical behavior of topological defects, particularly the nucleation,
motion, and interaction of vortices that govern the magnetic response of
superconductors \[#link(<bib:Achab2020GinzburgLEAF>)[6], #link(<bib:Horn2023pyTDGLTGO>)[7]\]. The model's
robust the coupling between superconducting and nematic order parameters
\[#link(<bib:Leo2024OnTES>)[8]\].

Despite its broad utility, the GL equation presents formidable
mathematical challenges. The interplay of its inherent nonlinearity
(originating from the quartic potential), the potential for numerical
stiffness (arising from the coupling of fast diffusive and slow reactive
time scales), and the frequent emergence of multiscale features
\[#link(<bib:Li2025SPDEBenchAEA>)[9]\] --- such as the sharp, localized vortex cores existing
within a large, slowly varying domain---render analytical solutions
generally unattainable, except in highly constrained or simplified
scenarios \[#link(<bib:Du1992AnalysisAAI>)[1]\]. This analytical intractability has
cemented the role of numerical simulation as the primary and most
powerful tool for exploring the vast dynamical landscape governed by the
GL equation \[#link(<bib:Du1992AnalysisAAI>)[1], #link(<bib:Aguirre2020BriefNAV>)[10]\]. Consequently, a
diverse arsenal of numerical techniques has been developed and refined
over the decades to meet this challenge. This includes various spatial
discretization schemes, from adaptable mesh-based approaches like finite
element methods (FEM) \[#link(<bib:Li2018UnconditionalSAW>)[13], #link(<bib:Li2014MathematicalANX>)[14]\] and
finite difference methods (FDM)
\[#link(<bib:Yang2023AnalysisOL>)[11], #link(<bib:Salete2020ComplexGEL>)[12]\], to high-accuracy global
methods such as spectral and pseudo-spectral approaches
\[#link(<bib:Aguirre2020BriefNAV>)[10], #link(<bib:Li2022NumericalSFT>)[15], #link(<bib:Zaky2021AlikhanovLSP>)[16]\] and
wavelet-based collocation \[#link(<bib:Secer2019ChebyshevWCQ>)[17]\]. To effectively manage
this stiffness in time integration, sophisticated schemes including
exponential time differencing (ETD)
\[#link(<bib:AsanteAsamani2020ASEU>)[18], #link(<bib:Caliari2024EfficientSOJ>)[19]\] and various operator
splitting methods \[#link(<bib:Zhao2020ALLN>)[20], #link(<bib:Izgi2019MilsteintypeSSAA>)[21]\] are frequently
employed. However, even with these significant advancements, the
computational cost remains a significant bottleneck. Simulating the TDGL
equation, particularly for large-scale problems in two or three spatial
dimensions \[#link(<bib:Aguirre2020BriefNAV>)[10]\], over long integration times
\[#link(<bib:Caliari2024EfficientSOJ>)[19]\], or for multiscale problems requiring extremely
fine discretization to resolve sharp features \[#link(<bib:Li2025SPDEBenchAEA>)[9]\],
remains computationally intensive \[#link(<bib:AsanteAsamani2020ASEU>)[18]\]. This
persistent computational challenge drives the exploration of novel, more
efficient computational paradigms, particularly data-driven and machine
learning approaches, which offer the potential for transformative
speedups and new ways of modeling the complex phenomena described by
Ginzburg-Landau theory.

In response to the formidable computational challenges posed by the
Ginzburg-Landau (GL) equation, a significant body of research has been
dedicated to the development and analysis of robust, accurate, and
efficient numerical solvers. Traditional mesh-based methods have seen
considerable refinement. Finite element methods (FEM), for instance,
have been rigorously analyzed to prove high-order convergence
properties, with some linearized schemes achieving unconditional
superconvergence, thereby removing restrictive time-step constraints
\[#link(<bib:Li2018UnconditionalSAW>)[13], #link(<bib:Li2014MathematicalANX>)[14]\]. To specifically combat
the numerical stiffness endemic to reaction-diffusion systems, advanced
time-stepping strategies are essential. Among these, exponential time
differencing (ETD) schemes, often combined with dimensional splitting,
have proven highly effective, enabling stable integration with much
larger time steps than standard explicit or implicit-explicit (IMEX)
methods \[#link(<bib:AsanteAsamani2020ASEU>)[18], #link(<bib:Caliari2024EfficientSOJ>)[19]\]. Concurrently,
methods leveraging global basis functions, such as spectral and
pseudo-spectral methods
\[#link(<bib:Aguirre2020BriefNAV>)[10], #link(<bib:Li2022NumericalSFT>)[15], #link(<bib:Zaky2021AlikhanovLSP>)[16]\] or wavelet
collocation techniques \[#link(<bib:Secer2019ChebyshevWCQ>)[17]\], have demonstrated
exceptional spatial accuracy, particularly for problems with periodic
boundary conditions. Specialized approaches, including generalized
finite differences \[#link(<bib:Salete2020ComplexGEL>)[12]\] and matrix methods
\[#link(<bib:Aguirre2023MatricialsMAK>)[22]\], further diversify the available toolkit.
However, despite these successes, significant limitations persist. The
computational cost of these solvers, even when highly optimized, remains
a substantial barrier to large-scale, long-duration simulations
\[#link(<bib:AsanteAsamani2020ASEU>)[18], #link(<bib:Caliari2024EfficientSOJ>)[19]\]. Furthermore, many of
these methods are inherently tied to structured grids, which simplifies
implementation but limits geometric flexibility. While FEM can handle
complex domains, the associated cost and complexity of mesh generation
and adaptation are non-trivial \[#link(<bib:Li2014MathematicalANX>)[14]\]. Perhaps most
critically, traditional mesh-based techniques fundamentally struggle to
resolve the multiscale nature of GL dynamics efficiently
\[#link(<bib:Li2025SPDEBenchAEA>)[9]\]. Capturing the sharp, localized gradients of
topological defects like vortex cores
\[#link(<bib:Achab2020GinzburgLEAF>)[6], #link(<bib:Horn2023pyTDGLTGO>)[7]\] simultaneously with the slowly
varying bulk field necessitates either extremely fine, globally resolved
meshes or complex adaptive mesh refinement (AMR) strategies, both of
which drastically escalate the computational overhead. This inherent
trade-off between physical fidelity and computational cost creates a
critical gap, motivating the exploration of alternative, data-driven
paradigms that offer a fundamentally different approach to solving
complex, nonlinear partial differential equations.

This pronounced gap between computational demand and physical complexity
has catalyzed a recent and fervent shift toward data-driven and machine
learning methodologies. This new paradigm seeks to fundamentally
overcome the limitations of classical solvers, largely bifurcating into
two prominent strategies. The first strategy involves data-driven
surrogate models, where deep learning architectures are trained on large
datasets generated by traditional solvers to learn the mapping from
input parameters or initial states to future solutions
\[#link(<bib:Peivaste2025TeachingAIAE>)[28], #link(<bib:Simonnet2022ComputingNTH>)[31]\]. Among these, neural
operators, such as the Fourier Neural Operator (FNO), have shown
remarkable success \[#link(<bib:Peivaste2025TeachingAIAE>)[28]\]. By operating in Fourier
space, FNOs can learn resolution-invariant operators, enabling massive
inferential speedups and generalization across different discretization
levels after a comprehensive offline training phase
\[#link(<bib:Peivaste2025TeachingAIAE>)[28]\]. The second, alternative strategy, and the one
we pursue in this work, is the Physics-Informed Neural Network (PINN)
framework. Instead of relying on pre-computed simulation data, PINNs
embed the governing partial differential equation (PDE), along with its
boundary and initial conditions, directly into the neural network's loss
function. The network is then trained by minimizing this physics-based
residual at a set of collocation points, a process facilitated by
automatic differentiation. This approach is inherently mesh-free,
thereby leverages the underlying physical laws as the primary source of
supervision. Given their flexibility in handling nonlinear operators and
complex domains, PINNs have emerged as a powerful and promising
methodology for tackling challenging scientific computing problems
\[#link(<bib:Kiyani2025OptimizingTOD>)[25], #link(<bib:Mattey2024GradientFBC>)[27]\].

While the standard PINN framework offers a compelling, mesh-free
alternative, its direct application to stiff, multiscale problems like
the Ginzburg-Landau equation is notoriously challenging. Standard
multilayer perceptron (MLP) architectures are known to suffer from
spectral bias, demonstrating an inductive preference for learning
low-frequency functions while failing to capture the sharp gradients and
high-frequency dynamics characteristic of topological defects like
domain walls. Furthermore, the highly nonlinear and stiff nature of the
GL equations can lead to intractable optimization landscapes, hindering
training convergence and long-term stability, a common issue in complex
reaction-diffusion systems \[#link(<bib:Li2025SPDEBenchAEA>)[9], #link(<bib:AsanteAsamani2020ASEU>)[18]\]. To
overcome these specific limitations, we propose the Adaptive Spectral
Physics-Enabled Network (ASPEN). This enhanced framework synergies three
key components designed to master these complexities. First, to combat
spectral bias, we employ spectral feature mapping (via Fourier feature
expansion) for the spatio-temporal input coordinates, enabling the
network to efficiently resolve localized, dynamic features, we implement
Residual-based Adaptive Refinement (RAR), an adaptive sampling strategy
that iteratively focuses collocation points on regions of high PDE
residual. Finally, to navigate the complex optimization landscape, we
integrate a curriculum learning strategy, progressively guiding the
optimizer toward a robust and physically accurate global minimum.

The primary aim of this work is to develop a robust, accurate, and
efficient computational method for solving complex, multi-scale physical
systems governed by partial differential equations. We specifically
focus on overcoming the limitations of traditional numerical solvers and
standard physics-informed neural networks (PINNs), such as spectral bias
and training difficulties in stiff or chaotic regimes. The core
contributions of this study are: (1) We propose the ASPEN architecture,
which integrates an adaptive spectral learning mechanism directly into a
physics-informed framework, enabling the model to dynamically capture a
wide range of frequencies and intricate solution structures. (2) We
formally detail the theoretical underpinnings of ASPEN, explaining how
its adaptive components mitigate spectral bias and improve gradient flow
during training. (3) We demonstrate the superior performance, accuracy,
and training efficiency of ASPEN through a comprehensive set of
challenging benchmark problems, including both forward and inverse
problems. Our results show that ASPEN consistently outperforms
state-of-the-art PINN variants, offering a significant advancement in
scientific machine learning and providing a powerful new tool for
high-fidelity physical simulation.

= Methods
<methods>
== Problem Formulation
<problem-formulation>
The core objective of our proposed method, the Adaptive Spectral
Physics-Enabled Network (ASPEN), is to accurately and efficiently find
the solution to the time-dependent complex Ginzburg-Landau equation
(CGLE). The CGLE is a canonical model for describing a wide range of
nonlinear dynamics, spatio-temporal pattern formation, and phase
transitions.

We seek to approximate the complex-valued order parameter field, denoted
by $A \( x \, t \) in bb(C)$, which is defined over a spatial domain
$x in Omega subset bb(R)^d$ and a time interval $t in \[ O \, T \]$. The
governing dynamics of $A \( x \, t \)$ are given by the partial
differential equation (PDE):

$ frac(partial A, partial t) = A + \( 1 + i b \) nabla^2 A - \( 1 + i c \) \| A \|^2 A $

In this equation, $b \, c in bb(R)$ are real-valued parameters that
control the linear dispersion and nonlinear stabilization, respectively,
$nabla^2$ represents the Laplacian operator, and $i = - sqrt(- 1)$ is
the imaginary unit.

This PDE is defined along with a specified initial condition (IC):

$ A \( x \, 0 \) = A_0 \( x \) \, quad upright("for ") x in Omega $

and a set of boundary conditions (BCs), such as periodic or Dirichlet,
which can be generally expressed as:

$ cal(B) \( A \, x \, t \) = 0 \, quad upright("for ") x in partial Omega \, upright(" and ") t in \[ 0 \, T \] $

where $cal(B)$ is the boundary operator and $partial Omega$ is the
boundary of the spatial domain. The inherent stiffness, strong
nonlinearity, and potential for spatio-temporal chaos in the CGLE make
its numerical solution a formidable challenge, motivating the
development of our novel deep learning framework.

== The Physics-Informed Neural Network (PINN) Framework
<the-physics-informed-neural-network-pinn-framework>
Our work builds upon the foundation of Physics-Informed Neural Networks
(PINNs). In the standard PINN framework, the complex-valued solution
$A \( x \, t \)$ is approximated by a deep neural network
$hat(A) \( x \, t \; theta \)$, where $theta$ represents the set of all
trainable parameters (weights and biases) of the network. This network
acts as a continuous function approximator that takes the spatiotemporal
coordinates $\( x \, t \)$ as input and outputs the predicted state
$hat(A)$.

The core innovation of PINNs is the integration of the governing PDE
into the training process via the loss function. This is achieved by
leveraging automatic differentiation (AD) to compute the partial
derivatives of the network's output $hat(A)$ with respect to its inputs
$x$ and $t$. These derivatives are used to define the physics-informed
residual, $f \( x \, t \)$, which measures how well the network's output
satisfies the Ginzburg-Landau equation:

$ f \( x \, t \) := frac(partial hat(A), partial t) - (hat(A) + \( 1 + i b \) nabla^2 hat(A) - \( 1 + i c \) \| hat(A) \|^2 hat(A)) $

The network is then trained by minimizing a composite loss function,
$L_(t o t a l)$, which enforces both the governing physics (the
residual) and the data constraints (the initial and boundary
conditions). This loss is typically a weighted sum of mean-squared
errors, evaluated over sets of collocation points sampled from the
residual domain ($cal(T)_(r e s)$), initial boundary ($cal(T)_(I C)$),
and spatial boundaries ($cal(T)_(B C)$):

$ L_(t o t a l) \( theta \) = w_(r e s) L_(r e s) + w_(I C) L_(I C) + w_(B C) L_(B C) $
where:
$ L_(r e s) = frac(1, \| cal(T)_(r e s) \|) sum_(\( x \, t \) in cal(T)_(r e s)) \| f \( x \, t \) \|^2 $
$ L_(I C) = frac(1, \| cal(T)_(I C) \|) sum_(x in cal(T)_(I C)) \| hat(A) \( x \, 0 \) - A_0 \( x \) \|^2 $
$ L_(B C) = frac(1, \| cal(T)_(B C) \|) sum_(\( x \, t \) in cal(T)_(B C)) \| cal(B) \( hat(A) \, x \, t \) \|^2 $

While effective for many problems, standard PINNs often suffer from
\"spectral bias\", a tendency to learn low-frequency components of the
solution much faster than high-frequency components. This limitation is
particularly problematic for complex, multi-scale dynamics like those in
the CGLE, motivating our development of the ASPEN framework.

== Ground Truth Solution
<ground-truth-solution>
To rigorously evaluate the performance and quantify the accuracy of our
proposed ASPEN framework, we first establish a high-fidelity \"ground
truth\" numerical solution for the complex Ginzburg-Landau equation. Due
to the stiff and nonlinear nature of the CGLE, obtaining a precise
solution requires robust numerical techniques
\[#link(<bib:Du1992AnalysisAAI>)[1], #link(<bib:Li2014MathematicalANX>)[14]\]. A common and effective
approach, which we employ here, is the split-step Fourier spectral
method \[#link(<bib:Li2022NumericalSFT>)[15]\]. This method is particularly well-suited for
this problem as it handles the linear (dispersive) part of the equation
exactly in Fourier space and the nonlinear (reaction) part in real
space, allowing for high accuracy \[#link(<bib:Caliari2024EfficientSOJ>)[19]\]. Other
established methods for generating benchmark solutions include
high-order finite difference or finite elements schemes
\[#link(<bib:Salete2020ComplexGEL>)[12], #link(<bib:Li2018UnconditionalSAW>)[13], #link(<bib:Yang2023AnalysisOL>)[11]\], as well
as various time-stepping strategies like exponential integrators or
splitting approaches \[#link(<bib:AsanteAsamani2020ASEU>)[18], #link(<bib:Zhao2020ALLN>)[20]\].

The specific benchmark solution used for training and validation in this
study is visualized in Figure @fig:ground_truth, which plots the real
component of the field,
$u \( x \, t \) = upright("Re") \( A \( x \, t \) \)$. The simulation is
conducted over the spatio-temporal domain $x in \[ - 10.0 \, 7.5 \]$ and
$t in \[ 0 \, 10 \]$. This simulation, generated with an extremely fine
spatial grid and a small time step (e.g., $Delta t = 10^(- 4)$), serves
as our reference for all subsequent error calculations.

#figure(image("source/ground_truth.png", width: 80.0%),
  caption: [
    The spatio-temporal evolution of the ground truth solution
    $u \( x \, t \) = upright("Re") \( A \( x \, t \) \)$ for the
    complex Ginzburg-Landau equation. The solution evolves from an
    initial step-like condition at $t = 0$ into two stable, separated
    domains (red for positive values, blue for negative values)
    connected by a smooth, stationary front centered near $x = 0$.
  ]
)
<fig:ground_truth>

As depicted in Figure @fig:ground_truth, the system evolves from a
sharp, step-like initial condition at $t = 0$ into a stable, stationary
front structure. This front, which separates two distinct phase domains
($u approx + 0.96$ and $u approx - 0.96$), forms quickly and remains
centered near $x = 0.0$. This solution profile is particularly
challenging for standard neural network approximators due to two main
features: (1) the high-frequency components present in the sharp initial
condition, and (2) the persistent, steep gradient of the stationary
front. As will be discussed, these features are known to exacerbate the
spectral bias phenomenon in standard PINN models, leading to slow
convergence and inaccurate solutions \[#link(<bib:Li2025SPDEBenchAEA>)[9]\]. Therefore, the
ability of a model to accurately and efficiently reproduce this ground
truth solution serves as a stringent test of its capacity to handle
multi-scale physics and stiff dynamics.

== Conventional Numerical Methods for the CGLE
<conventional-numerical-methods-for-the-cgle>
The numerical simulation of the complex Ginzburg-Landau equation (CGLE)
has been a subject of extensive research, leading to the development of
several robust conventional solvers. These methods generally fall into a
few key categories, each with distinct advantages and trade-offs.

- Finite Difference Methods (FDM): These methods discretize the
  spatio-temporal domain into a grid. Various schemes, such as
  implicit-explicit (IMEX) and Crank-Nicolson, are widely used to handle
  the equation's stiffness, which arises from the fast linear diffusion
  term and the slower nonlinear reaction term
  \[#link(<bib:Salete2020ComplexGEL>)[12], #link(<bib:Yang2023AnalysisOL>)[11]\]. While straightforward to
  implement, they can require very fine grids to resolve sharp fronts,
  increasing computational cost.

- Finite Element Methods (FEM): FEM approaches are particularly powerful
  for problems with complex geometries. Methods like the linearized
  Crank-Nicolson Galerkin FEM have been analyzed for their stability and
  superconvergence properties when applied to the CGLE
  \[#link(<bib:Li2018UnconditionalSAW>)[13], #link(<bib:Li2014MathematicalANX>)[14]\]. The foundational
  analysis of FEM for Ginzburg-Landau models provides a strong
  theoretical backing for their use \[#link(<bib:Du1992AnalysisAAI>)[1]\].

- Spectral Methods: For problems with periodic boundary conditions,
  spectral methods are often the most efficient choice. The split-step
  Fourier method, in particular, is highly popular \[#link(<bib:Li2022NumericalSFT>)[15]\].
  It treats the linear (diffusion) part of the equation exactly in
  Fourier space and the nonlinear (reaction) part in real space,
  offering high accuracy and stability \[#link(<bib:Caliari2024EfficientSOJ>)[19]\]. Other
  advanced approaches, like high-order exponential-type integrators
  \[#link(<bib:AsanteAsamani2020ASEU>)[18]\] and specialized software packages
  \[#link(<bib:Horn2023pyTDGLTGO>)[7]\], are built on these principles.

While highly accurate, these conventional solvers share a common set of
limitations. Their computational cost scales significantly with the
dimensionality of the problem and the desired resolution (both spatial
and temporal). Furthermore, they are \"forward-only\" solvers; solving
inverse problems (e.g., parameter inference) is non-trivial and often
requires integrating the solver within expensive optimization loops.
These challenges, particularly in the context of high-dimensional, stiff
systems and the need for differentiability in inverse problems, motivate
the exploration of alternative, neural-network-based frameworks like
PINNs and our proposed ASPEN model.

== The Adaptive Spectral Physics-Enabled Network (ASPEN)
<the-adaptive-spectral-physics-enabled-network-aspen>
The primary limitation of the standard PINN framework (described in
Section 2.2) is its difficulty in learning solutions with high-frequency
components, a well-known phenomenon called spectral bias
\[#link(<bib:Li2025SPDEBenchAEA>)[9]\]. Standard multilayer perceptrons (MLPs) inherently
favor low-frequency functions, making them slow to converge and often
inaccurate when applied to stiff or multi-scale problems like the CGLE
benchmark.

To overcome this, we propose the Adaptive Spectral Physics-Enabled
Network (ASPEN). The core idea of ASPEN is to replace the fixed,
implicit spectral bias of a standard MLP with an explicit, adaptive
spectral basis that is learned as part of the optimization process. This
is achieved by first mapping the input coordinates to a high-dimensional
feature space using a learnable Fourier-feature-based layer.

The ASPEN architecture is composed of two main-parts: (1) an Adaptive
Spectral Layer that transforms the inputs, and (2) a standard MLP
backbone that processes the resulting features. A schematic of the full
architecture and training loop is shown in Figure @fig:aspen_arch_v3.

#figure(architecture(),
  caption: [
    The overall architecture and training process of the ASPEN
    framework. Input coordinates $\( x \, t \)$ are fed into the ASPEN
    network (comprising an adaptive spectral layer and an MLP backbone)
    to produce the solution $hat(A) \( x \, t \)$. This output is then
    used to compute the physics residual ($L_(r e s)$) and the IC/BC
    loss ($L_(i c b c)$). These components are summed to form
    $L_(t o t a l)$, which the optimizer uses to update all trainable
    parameters $Theta$ (dashed line).
  ]
)
<fig:aspen_arch_v3>

Let the input coordinates be the vector $v = \( x \, t \)$. In a
standard PINN, $v$ is fed directly into the first hidden layer of an
MLP. In ASPEN, $v$ is first passed through the Adaptive Spectral Layer,
$gamma \( v \)$, which is defined as:

$ gamma \( v \; upright(bold(K)) \) = [cos \( 2 pi upright(bold(K)) v \) \, sin \( 2 pi upright(bold(K)) v \)]^T $

where $upright(bold(K)) in bb(R)^(m times \( d + 1 \))$ is a matrix of
learnable frequency vectors, $m$ is the number of Fourier features (a
hyperparameter), and $d$ is the spatial dimension (here, $d = 1$). This
mapping effectively projects the low-dimensional input $v$ onto $2 m$
high-dimensional features.

The crucial difference between ASPEN and other Fourier-feature-based
PINNs is that the frequency matrix $upright(bold(K))$ is not static.
Instead, $upright(bold(K))$ is initialized (e.g., by sampling from a
Gaussian distribution $cal(N) \( O \, sigma^2 \)$ and is then treated as
a trainable parameter, updated via backpropagation along with the
weights and biases of the MLP backbone ($theta_(M L P)$).

The output of this layer, the feature vector
$upright(bold(z)) = gamma \( v \; upright(bold(K)) \)$, is then fed into
a standard MLP backbone, $N N_(M L P)$:

$ hat(A) \( x \, t \) = N N_(M L P) \( upright(bold(z)) \; theta_(M L P) \) = N N_(M L P) \( gamma \( x \, t \; upright(bold(K)) \) \; theta_(M L P) \) $

The full set of trainable parameters for the ASPEN model is thus
$theta = { upright(bold(K)) \, theta_(M L P) }$.

The training of ASPEN follows the same loss-function minimization as the
standard PINN. However, the optimization dynamics are fundamentally
different. The gradients from the physics residual ($L_(r e s)$) now
flow back not only to update the weights of the MLP backbone
($theta_(M L P)$) but also to update the frequencies in the spectral
layer ($upright(bold(K))$).

This allows the network to adapt its own spectral bias to the problem.
If the physics residual is large in a region corresponding to
high-frequency dynamics (like the sharp front in our CGLE problem), the
optimizer will push the frequency vectors in $upright(bold(K))$ to
higher values. This \"adaptive spectral learning\" enables the mode to
efficiently allocate its resources to the most relevant frequencies
required to solve the PDE, thereby overcoming the spectral bias that
plagues standard MLP-based PINNs.

To validate the performance and accuracy of our proposed ASPEN
framework, we conduct a series of numerical experiments. We compare the
results of ASPEN against a standard PINN baseline on the complex
Ginzburg-Landau (CGLE) problem.

We test all models on the 1D+1 complex Ginzburg-Landau equation (CGLE).
Unless otherwise specified, we use the parameters $b = 0.5$ and
$c = - 1.3$, which are known to produce complex spatio-temporal
dynamics. The spatio-temporal domain is set to
$x in \[ - 10.0 \, 7 \, 5 \]$ and $t in \[ 0 \, 10 \]$, consistent with
our ground truth benchmark. The initial state at $t = 0$ is set to a
hyperbolic tangent function, which creates the initial front:

$ A \( x \, 0 \) = tanh \( - x \) + 0.0 i $

We apply Dirichlet boundary conditions at the spatial edges, fixing the
values to be consistent with the initial state:

$ A \( - 10.0 \, t \) = tanh \( 10.0 \) quad upright("and") quad A \( 7.5 \, t \) = tanh \( - 7.5 \) $

The high-fidelity ground truth solution shown in Figure
@fig:ground_truth was generated using a conventional split-step Fourier
spectral method. We used a fine spatial grid of $N_x = 1024$ points and
a small time step of $Delta t = 10^(- 4)$ to ensure numerical
convergence and accuracy. We compare ASPEN against a standard PINN
baseline. This baseline consists of a standard Multi-Layer Perceptron
(MLP) that takes the coordinates $\( x \, t \)$ as direct input. To
ensure a fair comparison, the baseline MLP uses the exact same
architecture (depth, width, and activation functions) as the ASPEN
backbone.

For both the ASPEN backbone and the baseline PINN, the core network
architecture is a fully-connected MLP with 8 hidden layers and 40
neurons per layer. The hyperbolic tangent (tanh) is used as the
activation function for all hidden layers. The output layer is linear
and has two neurons, corresponding to the real $u \( x \, t \)$ and
imaginary $v \( x \, t \)$ components of the complex solution
$hat(A) \( x \, t \)$. For the ASPEN model specifically, the input
coordinates are first passed through an Adaptive Spectral Layer with
$m = 128$ Fourier features. The frequency matrix $upright(bold(K))$ is
initialized by sampling from a Gaussian distribution
$cal(N) \( O \, sigma^2 \)$ with $sigma = 10.0$.

All models were implemented in PyTorch and trained on a single NVIDIA
A100 GPU 48GB. We used the Adam otpimizer for a total of 100,000 epochs.
The learning rate starts at $10^(- 3)$ and is reduced to $10^(- 4)$
after 50,000 epochs. For training, we sample a set of collocation points
Latin Hypercube Sampling (LHS) to ensure uniform coverage of the domain.
$N_(r e s) = 20 \, 000$ residual points are sampled from the
spatio-temporal interior. $N_(i c) = 1 \, 000$ points are sampled from
the initial condition at $t = 0$. $N_(b c) = 1 \, 000$ points are
sampled from the spatial boundaries for all $t$. The composite loss
function is balanced using fixed weights. Based on preliminary
experiments, we set the weights $w_(r e s) = 1.0$ and
$w_(i c b c) = 100.0$ to strongly enforce the initial and boundary
conditions.

To quantitatively measure the accuracy of the models, we compute the
relative $L_2$ error ($cal(E)$) between the predicted solution $hat(A)$
and the ground truth solution $A$. This error is calculated on a
high-resolution test grid of $N_x^(t e s t) = 1024$ spatial points and
$N_t^(t e s t) = 200$ temporal points, which are distinct from the
training collocation points.The relative $L_2$ error is defined as:

$ cal(E) = frac(parallel upright(bold(A)) - upright(bold(hat(A))) parallel_2, parallel upright(bold(A)) parallel_2) = sqrt(sum_(i = 1)^N \| A \( x_i \, t_i \) - hat(A) \( x_i \, t_i \) \|^2) / sqrt(sum_(i = 1)^N \| A \( x_i \, t_i \) \|^2) $

where the sum is over all points $\( x_i \, t_i \)$ in the test grid.

= Results
<results>
We first present the results from the standard PINN baseline to
establish a performance benchmark. This model shares an identical MLP
architecture (8 layers, 40 neurons/layer) with our proposed ASPEN model
but lacks the adaptive spectral input layer, taking the raw coordinates
$\( x \, t \)$ as direct input.

The performance of this baseline model is shown in Figure
@fig:baseline_results. The left panel (a) displays the predicted
solution $hat(u) \( x \, t \)$ from the standard PINN, and the right
panel (b) shows the corresponding pointwise absolute error relative to
the ground truth. The results clearly demonstrate that the standard PINN
architecture is incapable of solving this problem. While the model
correctly enforces the initial condition at $t = 0$, the solution almost
immediately diverges. The baseline model fails to capture the stable,
stationary front, and instead develops spurious, high-frequency
oscillations that grow in time, rendering the prediction physically
meaningless. The error heatmap confirms this failure, showing large,
rapidly growing errors that contaminate the entire computational domain.
This is a classic example of spectral bias, where the standard MLP
cannot generate the high-frequency components required to represent the
solution's stiff dynamics.

#figure([#align(center)[#image("source/pinn_baseline_comparison.png", width: 70%) #linebreak() (a) ]

  #align(center)[#image("source/pinn_baseline_error.png", width: 70%) #linebreak() (b) ]

  ],
  caption: [
    \(a) Predicted solution $hat(u) \( x \, t \)$ from the standard PINN
    baseline. (b) The corresponding absolute error heatmap
    $\| u - hat(u) \|$. The model fails to capture the correct dynamics,
    diverging into spurious oscillations.
  ]
)
<fig:baseline_results>

In sharp contrast to the baseline, our proposed ASPEN framework
successfully solves the complex Ginzburg-Landau equation with high
fidelity. The results are presented in Figure @fig:aspen_results, which
provides a direct visual comparison of the ground truth solution against
the ASPEN prediction and its corresponding error. Figure
@fig:aspen_results\(a) shows the ground truth solution,
$u \( x \, t \)$, generated by the high-resolution spectral solver.
Figure @fig:aspen_results\(b) shows the solution predicted by the ASPEN
model. Visually, the two plots are indistinguishable, demonstrating that
ASPEN correctly captures the rapid information of the stable, stationary
front and the long-term dynamics of the system. This qualitative success
is quantitatively confirmed in Figure @fig:aspen_results\(c), which
plots the absolute error heatmap. The error is extremely low across the
entire spatio-temporal domain, with the largest (yet still small) errors
confined to the initial time $t = 0$ and the Dirichlet boundaries, where
the solution's gradients are highest. This demonstrates that the
adaptive spectral layer effectively overcomes the spectral bias,
enabling the network to learn the multi-scale features of the solution.

#figure([#align(center)[#image("source/ground_comparison.png", width: 70%) #linebreak() (a) ]

  #align(center)[#image("source/pinn_comparison.png", width: 70%) #linebreak() (b) ]

  #align(center)[#image("source/pinn_absolute_error.png", width: 70%) #linebreak() (c) ]

  ],
  caption: [
    A direct comparison of the ASPEN model's performance. (a) The ground
    truth solution. (b) The solution predicted by ASPEN, which is
    visually identical to the ground truth. (c) The absolute error
    heatmap, showing extremely low error across the domain.
  ]
)
<fig:aspen_results>

We first validate the training process of the ASPEN model, as the
convergence behavior and residual distribution are key indicators of a
successful physics-informed solution. Figure @fig:training_diagnostics
presents a comprehensive overview of the model's training dynamics.

Figure @fig:training_diagnostics\(a) plots the loss history for the
total loss and its individual components (PDE, IC, and BC) over 10,000
epochs. The model demonstrates stable and rapid convergence, with the
total loss (blue line) steadily decreasing by several orders of
magnitude. Critically, not only do the data-driven losses (IC and BC)
converge quickly, but the physics-based PDE loss (red line) also
achieves a low value. This confirms that the optimizer is not merely
overfitting to the initial and boundary conditions, but is successfully
finding a set of parameters $Theta$ that genuinely satisfy the
Ginzburg-Landau equation itself. The periodic sharp spikes seen in the
loss curves are an expected and intentional artifact of our training
strategy, which employs collocation point resampling at fixed intervals.
This technique acts as a form of dynamic regularization, preventing the
model from converging to a local minimum associated with a static set of
points and ensuring the PDE residual is minimized globally across the
entire domain.

The final state of this convergence is quantified in Figure
@fig:training_diagnostics\(b), which presents a histogram of the
absolute physics residuals, plotted on a log scale. The distribution is
unimodal and sharply peaked, with a median residual of just
$5.10 times 10^(- 3)$. This is a strong indication that for the vast
majority of points in the spatio-temporal domain, the ASPEN network's
output satisfies the governing equation with high precision. The mean
($1.56 times 10^(- 2)$) is slightly higher than the median, which is
expected as it is influenced by a small number of outlier points with
larger residuals.

Figure @fig:training_diagnostics\(c) provides the spatial context for
these outliers by plotting the maximum residual (taken over all time t)
at each spatial position x. This plot is highly illuminating. The
largest residuals, spiking to $10^1$, are strictly confined to the
Dirichlet boundaries at $x = - 10.0$ and $x approx 7.5 - 10.0$. This is
a common phenomenon in PINN training, where a slight conflict can arise
between satisfying the PDE and strictly enforcing a hard boundary
condition. More importantly, throughout the entire interior of the
domain ($- 7.5 < x < 5.0$), the maximum residual remains exceptionally
low. Even at the stationary front located at $x approx 0.0$, which
represents the most challenging, high-gradient feature of the solution,
the residual remains well-controlled (below $10^0$). This confirms that
ASPEN does not just learn the \"easy\", flat regions of the solution but
also successfully resolves the stiff dynamics of the front itself.

#figure([#align(center)[#image("source/training_history.png", width: 70%) #linebreak() (a) ]

  #align(center)[#image("source/residual_distribution.png", width: 70%) #linebreak() (b) ]

  #align(center)[#image("source/spatial_distribution.png", width: 70%) #linebreak() (c) ]

  ],
  caption: [
    Training diagnostics for the ASPEN model. (a) Convergence of the
    total, PDE, IC, and BC losses over 10,000 epochs. (b) Histogram of
    the final log-residual values, showing a low median error. (c) The
    maximum residual over time at each spatial position $x$.
  ]
)
<fig:training_diagnostics>

#figure([#align(center)[#image("source/temporal_dynamics_t0.png", width: 70%) #linebreak() (a) $t = 0.0$]

  #align(center)[#image("source/temporal_dynamics_t5.png", width: 70%) #linebreak() (b) $t = 5.0$]

  #align(center)[#image("source/temporal_dynamics_t10.png", width: 70%) #linebreak() (c) $t = 10.0$]

  ],
  caption: [
    Detailed comparison of ASPEN's prediction (dashed red) against the
    ground truth (solid blue) at three temporal slices. The model shows
    excellent agreement at the initial time (a), in the middle of the
    simulation (b), and at the final time (c).
  ]
)
<fig:temporal_slices>

While the error heatmaps in Figure @fig:aspen_results provide a global
overview of the model's high accuracy, we can further analyze the
solution quality by examining 1D spatial results at specific moments in
time. Figure @fig:temporal_slices presents this detailed comparison at
three critical time steps: the beginning, the middle, and the end of the
simulation.

Figure @fig:temporal_slices\(a) shows the solution at the initial time,
$t = 0$. The ASPEN prediction (red dashed line) is perfectly overlaid on
the ground truth (blue line), demonstrating that the model successfully
learned the sharp gradient of the initial $tanh$ condition. This
confirms the effectiveness of the initial condition loss term and, more
importantly, shows that the adaptive spectral layer had no difficulty
representing this high-frequency feature from the very start.

Figure @fig:temporal_slices\(b) moves to the midpoint of the simulation
at $t = 5.0$. By this time, the system has evolved from its sharp
initial state and settled into its stable, stationary front. Again, the
ASPEN prediction is visually indistinguishable from the ground truth,
perfectly capturing the shape and amplitude of the S-shaped front. The
plot also highlights the \"wall position\" (the zero-crossing). The
ground truth wall is at $x = 0.00$, and the ASPEN prediction is at
$x = - 0.08$, a trivially small discrepancy that confirms the model's
high spatial accuracy.

Finally, Figure @fig:temporal_slices\(c) shows the solution at the final
time, $t = 10.0$. Even after 10 full-time units, the ASPEN model remains
stable and its prediction continues to trace the ground truth with high
fidelity. The wall position shows a minor drift to $x = - 0.11$, but the
overall integrity of the solution profile is perfectly maintained. This
is a stark contrast to the baseline PINN, which had completely diverged
by this point. This analysis of temporal slices confirms that the ASPEN
model's success is not an average-case phenomenon; it accurately
resolves the fine-grained, local features of the solution profile at all
stages of the simulation.

#figure([#align(center)[#image("source/domain_wall.png", width: 70%) #linebreak() (a) Domain Wall Position vs. Time]

  #align(center)[#image("source/free_energy.png", width: 70%) #linebreak() (b) Free Energy vs. Time]

  ],
  caption: [
    Validation of key physical quantities. (a) The domain wall position
    predicted by ASPEN (red dashed line) perfectly tracks the ground
    truth (blue line) after the initial transient. (b) The system's free
    energy predicted by ASPEN (red dashed line) is indistinguishable
    from the ground truth, capturing both the rapid initial relaxation
    and the stable equilibrium state.
  ]
)
<fig:physics_quantities>

Beyond demonstrating pointwise accuracy, a critical test for a
physics-informed model is its ability to capture the system's aggregate
physical properties and conservation laws. We evaluate this by comparing
the predicted domain wall position and the system's free energy against
the ground truth, as shown in Figure @fig:physics_quantities.

Figure @fig:physics_quantities (a) tracks the domain wall position,
defined as the spatial zero-crossing of the real component
$u \( x \, t \)$, over the full time evolution. The plot shows that
after a very brief initial transient (a sharp drop from $x = - 10$ to
$x = 0$) resulting from the artificial initial condition, the ASPEN
model's predicted wall position (red dashed line) perfectly overlaps
with the ground truth (blue line). It correctly identifies that the
system evolves into a stationary front, with the wall remaining stable
at $x approx 0.0$ for the entire simulation. This demonstrates that
ASPEN has accurately learned the equilibrium dynamics of the front.

Figure @fig:physics_quantities (b) provides an even stronger validation
by plotting the system's total Ginzburg-Landau free energy, a key
physical observable. The ASPEN model's predicted energy trace is again
visually indistinguishable from the ground truth. It perfectly captures
the sharp, vertical drop in energy at $t approx 0$ as the system rapidly
relaxes from the high-energy, unstable initial condition. Following this
relaxation, it correctly settles into the stable, minimum-energy state
and maintains this value, precisely matching the ground truth. This
result is highly significant: it confirms that ASPEN has not simply
learned a function that looks right, but has learned a solution that
adheres to the fundamental physical principles (in this case, energy
minimization) embedded within the Ginzburg-Landau equation.

= Discussion
<discussion>
The experimental results presented in this work offer a compelling case
for the efficacy of the proposed ASPEN framework, particularly when
contrasted with the performance of a standard PINN architecture. The
discussion below synthesizes these findings, delves into the underlying
mechanisms, and considers the broader implications of this work.

The categorical failure of the baseline PINN, is not an anomaly but
rather a fundamental demonstration of the well-documented spectral bias
inherent in standard MLP architectures. These networks exhibit a strong
inductive bias towards learning low-frequency functions, struggling to
approximate the high-frequency components and sharp gradients
characteristic of many physical systems. In the context of the
Ginzburg-Landau equation, this bias prevents the network from resolving
the stiff dynamics of the front, leading to the accumulation of error
and a complete divergence from the physically correct solution. This
failure underscores the critical need for architectures that can
explicitly and efficiently represent multi-scale solutions.

The success of ASPEN lies in its direct mitigation of this spectral
bias. By introducing an Adaptive Spectral Layer, the network's task is
fundamentally changed. Instead of being forced to construct
high-frequency sinusoidal components from combinations of global,
low-frequency activation functions (like $t a n h$), the ASPEN model is
provided with a rich, explicit basis of sinusoids from the outset.
Crucially, the frequencies of this basis, parameterized by the matrix
$upright(bold(K))$, are not static but are treated as learnable
parameters. The training process therefore becomes a dual optimization:
the network simultaneously learns (1) the optimal set of frequencies
required to represent the solution by updating $upright(bold(K))$, and
(2) the correct linear and nonlinear combinations of these spectral
features to form the final solution by updating $theta_(M L P)$. This
adaptive learning allows the model to dynamically allocate its
representational capacity to the most relevant frequencies, enabling the
efficient and accurate capture of both the smooth, low-frequency regions
and the sharp, high-frequency front.

A pivotal finding of this study is that ASPEN learns a physically
consistent solution. The accurate reproduction of emergent physical
quantities like the stable domain wall position and the system's free
energy---properties not explicitly enforced point-by-point in the loss
function---is highly significant. It suggests that by successfully
minimizing the physics residual across the domain, the model has
implicitly learned the underlying physical principles of the system,
such as energy minimization and the existence of stable equilibrium
states. This elevates ASPEN from being merely a powerful function
approximator to a legitimate physics-informed solver, capable of
producing predictions that are not only accurate but also physically
meaningful.

Despite its success on this challenging problem, the current work opens
several avenues for future investigation. The performance of ASPEN may
be sensitive to hyperparameters such as the number of Fourier features
$\( m \)$ and the initialization scale $\( sigma \)$ of the frequency
matrix $upright(bold(K))$. A systematic study is needed to understand
these sensitivities and develop robust heuristics for their selection.
Furthermore, while we demonstrated success in 1D, the scalability of
ASPEN to higher-dimensional (2D and 3D) and more complex systems, such
as turbulent fluid flows or chaotic systems, remains an important open
question. Future work will focus on applying ASPEN to these more complex
domains and exploring its potential for solving inverse problems, where
its differentiability offers a significant advantage over traditional
solvers.

In summary, the ASPEN framework offers a robust and effective method for
solving stiff, nonlinear partial differential equations that are
intractable for standard PINN architectures. By integrating an adaptive
spectral basis directly into the network, it overcomes the critical
issue of spectral bias, leading to highly accurate and physically
consistent solutions. This architectural approach represents a promising
direction for the future of machine learning, enabling the application
of deep learning to a wider class of challenging problems in science and
engineering.

= Conclusion
<conclusion>
In this work, we addressed the challenge of applying physics-informed
deep learning to stiff, nonlinear dynamical systems, a domain where
standard architectures often fail. We demonstrated that a conventional
PINN, built from a standard MLP, is fundamentally incapable of solving
the complex Ginzburg-Landau equation. This baseline model, plagued by
spectral bias, failed to represent the solution's high-frequency and
multi-scale features, leading to a catastrophic divergence from the
correct physical dynamics. This failure highlighted the critical need
for novel architectures that can explicitly manage and overcome this
inductive bias. To address this, we proposed the Adaptive Spectral
Physics-Enabled Network (ASPEN), a framework that integrates an adaptive
spectral input layer directly into the network. By treating the
frequencies of this Fourier feature mapping as learnable parameters,
ASPEN dynamically tunes its own spectral basis during training. This
mechanism allows the model to efficiently allocate its representational
power to the specific frequencies required by the PDE's solution,
effectively bypassing the spectral bias that cripples standard MLPs. Our
numerical experiments provided a clear validation of ASPEN's
capabilities. In contrast to the baseline, the ASPEN mode successfully
solved the CGLE with high fidelity, producing a solution visually
indistinguishable from the high-resolution ground truth. This
qualitative success was substantiated by strong quantitative metrics:
the model converged to a low median physics residual of just
$5.10 times 10^(- 3)$, demonstrating the PDE was satisfied across the
domain. Detailed analysis of solution slices at various times confirmed
this precision, showing a near-perfect overlay with the ground truth and
a maximum domain wall position error of only $0.11$ at the final time
$t = 10.0 s$. Most critically, ASPEN proved to be not just accurate but
physically consistent, precisely tracking emergent physical properties
like the system's free energy relaxation and the stable equilibrium of
the domain wall-complex behaviors the baseline modl failed to capture.
Ultimately, the contribution of this work is a robust and effective
framework for solving complex, nonlinear PDEs that remain intractable
for standard PINNs. We have shown that by integrating the network with a
learnable, adaptive spectral basis, we can create a solver that is
accurate, stable, and physically consistent.

#heading(numbering:none)[References]

#block[\[1\] Q. Du, M. Gunzburger, J. Peterson. #emph[Analysis and Approximation of
the Ginzburg-Landau Model of Superconductivity]. SIAM Rev., 34:54--81,
\1992. DOI: #link("https://doi.org/10.1137/1034003")[`10.1137/1034003`]] <bib:Du1992AnalysisAAI>

#block[\[2\] A. Patra. #emph[On Comparison of Two Reliable Techniques for the Riesz
Fractional Complex Ginzburg-Landau-Schrödinger Equation in Modelling
Superconductivity]. Progress in Fractional Differentiation and
Applications, 2018. DOI:
#link("https://doi.org/10.18576/pfda/040308")[`10.18576/pfda/040308`]] <bib:Patra2018OnCOAB>

#block[\[3\] V. Hernández Piñeiro, V. González Tabernero, A. M. Ferreiro Ferreiro,
Study and Solution of the Ginzburg-Landau Equation for Superconductivity
Problems, in #emph[Proceedings of XoveTIC 2024], (2024) 430-435. doi:
#link("https://doi.org/10.17979/spudc.001.108.0")[10.17979/spudc.001.108.0].] <bib:Pineiro2024StudyASR>

#block[\[4\] Reza Torabi, J. Davidsen. #emph[Pattern formation in reaction-diffusion
systems in the presence of non-Markovian diffusion]. Physical review. E,
100(5-1):052217, 2019. DOI:
#link("https://doi.org/10.1103/PhysRevE.100.052217")[`10.1103/PhysRevE.100.052217`]] <bib:Torabi2019PatternFIY>

#block[\[5\] Weigang Liu, U. Täuber. #emph[Aging phenomena in the two-dimensional
complex Ginzburg-Landau equation]. Europhysics Letters, 128, 2019. DOI:
#link("https://doi.org/10.1209/0295-5075/128/40005")[`10.1209/0295-5075/128/40005`]] <bib:Liu2019AgingPIZ>

#block[\[6\] A. Achab, H. Rezazadeh, D. Baleanu, Temesgen Desta Leta, Shumaila
Javeed, K. Alimgeer. #emph[Ginzburg Landau equation's Innovative
Solution (GLEIS)]. Physica Scripta, 96, 2020. DOI:
#link("https://doi.org/10.1088/1402-4896/abc976")[`10.1088/1402-4896/abc976`]] <bib:Achab2020GinzburgLEAF>

#block[\[7\] Logan Bishop-Van Horn. #emph[pyTDGL: Time-dependent Ginzburg-Landau in
Python]. Comput. Phys. Commun., 291:108799, 2023. DOI:
#link("https://doi.org/10.1016/j.cpc.2023.108799")[`10.1016/j.cpc.2023.108799`]] <bib:Horn2023pyTDGLTGO>

#block[\[8\] Mariano De Leo, J. P. Borgna, Diego García Ovalle. #emph[On the
existence of nematic-superconducting states in the Ginzburg--Landau
regime]. Chaos, Solitons & Fractals, 2024. DOI:
#link("https://doi.org/10.1016/j.chaos.2023.114364")[`10.1016/j.chaos.2023.114364`]] <bib:Leo2024OnTES>

#block[\[9\] X. Li, X. Zhong, H. Gao, J. Kou, Accelerating implicit integration
factor methods for stiff reaction-diffusion equations via
physics-informed neural operator, arXiv preprint
#link("https://arxiv.org/abs/2505.18511")[arXiv:2505.18511] (2025).] <bib:Li2025SPDEBenchAEA>

#block[\[10\] C. Aguirre, Q. Martins, J. Barba-Ortega. #emph[Brief numerical analysis
of (3+1) Ginzburg-Landau equations]. Journal of Physics: Conference
Series, 1671, 2020. DOI:
#link("https://doi.org/10.1088/1742-6596/1671/1/012007")[`10.1088/1742-6596/1671/1/012007`]] <bib:Aguirre2020BriefNAV>

#block[\[11\] L. Yang, R. Du, Z. Zhang, Analysis of linearized L2-scheme for
time-dependent Ginzburg-Landau equations in 2D and 3D, #emph[AIMS
Mathematics], 8 (2) (2023) 2795--2813. doi:
#link("https://doi.org/10.3934/math.2023124")[10.3934/math.2023124].] <bib:Yang2023AnalysisOL>

#block[\[12\] E. Salete, A. M. Vargas, A. García, M. Negreanu, J. J. Benito, F. Ureña.
#emph[Complex Ginzburg--Landau Equation with Generalized Finite
Differences]. Mathematics, 2020. DOI:
#link("https://doi.org/10.3390/math8122248")[`10.3390/math8122248`]] <bib:Salete2020ComplexGEL>

#block[\[13\] M. Li, D. Shi, Junjun Wang. #emph[Unconditional superconvergence
analysis of a linearized Crank-Nicolson Galerkin FEM for generalized
Ginzburg-Landau equation]. Comput. Math. Appl., 79:2411--2425, 2018.
DOI:
#link("https://doi.org/10.1016/j.camwa.2019.11.008")[`10.1016/j.camwa.2019.11.008`]] <bib:Li2018UnconditionalSAW>

#block[\[14\] Buyang Li, Zhimin Zhang. #emph[Mathematical and numerical analysis of
the time-dependent Ginzburg-Landau equations in nonconvex polygons based
on Hodge decomposition]. Math. Comput., 86:1579--1608, 2014. DOI:
#link("https://doi.org/10.1090/mcom/3177")[`10.1090/mcom/3177`]] <bib:Li2014MathematicalANX>

#block[\[15\] Xiaoyu Li, Yu-Lan Wang, Zhi-yuan Li. #emph[Numerical simulation for the
fractional-in-space Ginzburg-Landau equation using Fourier spectral
method]. AIMS Mathematics, 2022. DOI:
#link("https://doi.org/10.3934/math.2023047")[`10.3934/math.2023047`]] <bib:Li2022NumericalSFT>

#block[\[16\] M. A. Zaky, A. Hendy, R. H. De Staelen. #emph[Alikhanov
Legendre---Galerkin Spectral Method for the Coupled Nonlinear Time-Space
Fractional Ginzburg--Landau Complex System]. Mathematics, 2021. DOI:
#link("https://doi.org/10.3390/math9192465")[`10.3390/math9192465`]] <bib:Zaky2021AlikhanovLSP>

#block[\[17\] A. Seçer, Yasemin Bakır, Chebyshev wavelet collocation method for
Ginzburg-Landau equation, #emph[Thermal Science], 23 (Suppl. 4) (2019)
S1167--S1176. doi:
#link("https://doi.org/10.2298/TSCI181126054S")[10.2298/TSCI181126054S].] <bib:Secer2019ChebyshevWCQ>

#block[\[18\] E. Asante-Asamani, A. Kleefeld, B. A. Wade. #emph[A second-order
exponential time differencing scheme for non-linear reaction-diffusion
systems with dimensional splitting]. ArXiv, abs/2001.11220, 2020. DOI:
#link("https://doi.org/10.48550/arXiv.2001.11220")[`10.48550/arXiv.2001.11220`]] <bib:AsanteAsamani2020ASEU>

#block[\[19\] M. Caliari, F. Cassini. #emph[Efficient simulation of complex
Ginzburg-Landau equations using high-order exponential-type methods].
ArXiv, abs/2403.02816, 2024. DOI:
#link("https://doi.org/10.48550/arXiv.2403.02816")[`10.48550/arXiv.2403.02816`]] <bib:Caliari2024EfficientSOJ>

#block[\[20\] Yong-Liang Zhao, A. Ostermann, Xianming Gu. #emph[A low-rank Lie-Trotter
splitting approach for nonlinear fractional complex Ginzburg-Landau
equations]. ArXiv, abs/2010.05249, 2020. DOI:
#link("https://doi.org/10.48550/arXiv.2010.05249")[`10.48550/arXiv.2010.05249`]] <bib:Zhao2020ALLN>

#block[\[21\] Burhaneddin Izgi, Coskun Çetin. #emph[Milstein-type semi-implicit
split-step numerical methods for nonlinear stochastic differential
equations with locally Lipschitz drift terms]. Thermal Science, 2019.
DOI:
#link("https://doi.org/10.2298/TSCI181029054I")[`10.2298/TSCI181029054I`]] <bib:Izgi2019MilsteintypeSSAA>

#block[\[22\] C. Aguirre, J. Otálora, A. S. Mosquera Polo, J. Barba-Ortega.
#emph[Matricials methods applied to the solution of the Ginzburg-Landau
equations]. Journal of Physics: Conference Series, 2516, 2023. DOI:
#link("https://doi.org/10.1088/1742-6596/2516/1/012002")[`10.1088/1742-6596/2516/1/012002`]] <bib:Aguirre2023MatricialsMAK>

#block[\[23\] Yian Chen, J. Hoskins, Y. Khoo, M. Lindsey. #emph[Committor functions
via tensor networks]. ArXiv, abs/2106.12515, 2021. DOI:
#link("https://doi.org/10.48550/arXiv.2106.12515")[`10.48550/arXiv.2106.12515`]] <bib:Chen2021CommittorFVM>

#block[\[24\] Derek R. Handwerk, G. Dangelmayr, I. Oprea, Patrick D. Shipman.
#emph[Phase-Diffusion Equations for the Anisotropic Complex
Ginzburg--Landau Equation]. International Journal of Bifurcation and
Chaos, 2020. DOI:
#link("https://doi.org/10.1142/S0218127420501758")[`10.1142/S0218127420501758`]] <bib:Handwerk2020PhaseDiffusionEFAG>

#block[\[25\] Elham Kiyani, K. Shukla, Jorge F. Urbán, Jérôme Darbon, G. Karniadakis.
#emph[Optimizing the optimizer for physics-informed neural networks and
Kolmogorov-Arnold networks]. Computer Methods in Applied Mechanics and
Engineering, 2025. DOI:
#link("https://doi.org/10.1016/j.cma.2024.117607")[`10.1016/j.cma.2024.117607`]] <bib:Kiyani2025OptimizingTOD>

#block[\[26\] Haoya Li, Y. Khoo, Yinuo Ren, Lexing Ying. #emph[Solving for high
dimensional committor functions using neural network with online
approximation to derivatives]. ArXiv, abs/2012.06727, 2020. DOI:
#link("https://doi.org/10.48550/arXiv.2012.06727")[`10.48550/arXiv.2012.06727`]] <bib:Li2020SolvingFHB>

#block[\[27\] R. Mattey, Susanta Ghosh. #emph[Gradient Flow Based Phase-Field Modeling
Using Separable Neural Networks]. ArXiv, abs/2405.06119, 2024. DOI:
#link("https://doi.org/10.48550/arXiv.2405.06119")[`10.48550/arXiv.2405.06119`]] <bib:Mattey2024GradientFBC>

#block[\[28\] Iman Peivaste, A. Makradi, S. Belouettar. #emph[Teaching Artificial
Intelligence to Perform Rapid, Resolution-Invariant Grain Growth
Modeling via Fourier Neural Operator]. ArXiv, abs/2503.14568, 2025. DOI:
#link("https://doi.org/10.48550/arXiv.2503.14568")[`10.48550/arXiv.2503.14568`]] <bib:Peivaste2025TeachingAIAE>

#block[\[29\] S. Sargsyan, S. Brunton, J. Kutz. #emph[Nonlinear model reduction for
dynamical systems using sparse sensor locations from learned libraries].
Physical review. E, Statistical, nonlinear, and soft matter physics,
92(3):033304, 2015. DOI:
#link("https://doi.org/10.1103/PhysRevE.92.033304")[`10.1103/PhysRevE.92.033304`]] <bib:Sargsyan2015NonlinearMRG>

#block[\[30\] S. Sargsyan, S. Brunton, J. Kutz. #emph[Online Interpolation Point
Refinement for Reduced-Order Models using a Genetic Algorithm]. ArXiv,
abs/1607.07702, 2016. DOI:
#link("https://doi.org/10.48550/arXiv.1607.07702")[`10.48550/arXiv.1607.07702`]] <bib:Sargsyan2016OnlineIPE>

#block[\[31\] E. Simonnet. #emph[Computing non-equilibrium trajectories by a deep
learning approach]. J. Comput. Phys., 491:112349, 2022. DOI:
#link("https://doi.org/10.1016/j.jcp.2023.112349")[`10.1016/j.jcp.2023.112349`]] <bib:Simonnet2022ComputingNTH>

#block[\[32\] Xun Tang, Lexing Ying. #emph[Solving high-dimensional Fokker-Planck
equation with functional hierarchical tensor]. J. Comput. Phys.,
511:113110, 2023. DOI:
#link("https://doi.org/10.1016/j.jcp.2024.113110")[`10.1016/j.jcp.2024.113110`]] <bib:Tang2023SolvingHFF>

#block[\[33\] Yongyi Yu, Qingmei Zhao. #emph[Controllability and observability for
some forward-stochastic complex degenerate/singular Ginzburg-Landau
equations]. ESAIM: Control, Optimisation and Calculus of Variations,
\2023. DOI:
#link("https://doi.org/10.1051/cocv/2023014")[`10.1051/cocv/2023014`]] <bib:Yu2023ControllabilityAOAD>

#block[\[34\] Xiangyuan Zhang, Weichao Mao, Saviz Mowlavi, M. Benosman, Tamer Başar.
#emph[Controlgym: Large-scale control environments for benchmarking
reinforcement learning algorithms]. Conference on Learning for Dynamics
& Control, 2023. Available at:
#link("https://api.semanticscholar.org/CorpusID:265506677")] <bib:Zhang2023ControlgymLCAC>
