#set page(paper:"a4", margin:23mm, numbering:"1")
#set text(font:"Libertinus Serif", size:10.5pt)
#set par(justify:true, leading:.6em)
#set heading(numbering:"1.1")
#set math.equation(numbering:"(1)")
#show figure.caption: set text(size:9pt)
#align(center)[
  #text(size:16pt,weight:"bold")[Reconstructing Multi-Scale Physical Fields from Extremely Sparse Measurements with an Autoencoder-Diffusion Cascade]
  #v(.6em)
  Letian Yi#super[1], Tingpeng Zhang#super[2], Mingyuan Zhou#super[1], Guannan Wang#super[3], Quanke Su#super[2,3,4], and Zhilu Lai#super[1,2,4]
  #v(.5em)
  #super[1] Internet of Things Thrust, #super[2] Intelligent Transportation Thrust, and #super[3] Marine Hydrodynamic Research Facility, The Hong Kong University of Science and Technology (Guangzhou), Guangzhou, China \
  #super[4] Department of Civil and Environmental Engineering, The Hong Kong University of Science and Technology, Hong Kong SAR, China \
  Corresponding author #link("mailto:zhilulai@ust.hk")
]

*Abstract.* Reconstructing full fields from extremely sparse and random measurements is a longstanding ill-posed inverse problem. A powerful framework for addressing such challenges is hierarchical probabilistic modeling, where uncertainty is represented by intermediate variables and resolved through marginalization during inference. Inspired by this principle, we propose Cascaded Sensing (Cas-Sensing), a hierarchical reconstruction framework that integrates an autoencoder–diffusion cascade. First, a neural operator-based functional autoencoder reconstructs the dominant structures of the original field—including large-scale components and geometric boundaries—from arbitrary sparse inputs, serving as an intermediate variable. Then, a conditional diffusion model, trained with a mask-cascade strategy, generates fine-scale details conditioned on these large-scale structures. To further enhance fidelity, measurement consistency is enforced via the manifold constrained gradient based on Bayesian posterior sampling during the generation process. This cascaded pipeline substantially alleviates ill-posedness, delivering accurate and robust reconstructions. Experiments on both simulation and real-world datasets demonstrate that Cas-Sensing generalizes well across varying sensor configurations and geometric boundaries, making it a promising tool for practical deployment in scientific and engineering applications.

*Keywords.* Field reconstruction, probabilistic modeling, cascade pipeline, functional autoencoder, diffusion model.

= Introduction
<sec:introduction>
Despite advances in sensor technology enabling large-scale deployments
in physical systems, the number of monitoring sites is often constrained
by high setup and maintenance costs. Therefore, spatial field
reconstruction from limited local sensor information is a major
challenge of complex physical systems, such as astrophysics
@akiyama2019first, geophysics
@kondrashov2006spatio@carrassi2018data@manohar2018data, atmospheric
science @alonso2010novel@mishra2014compressed, and fluid dynamics
@vinuesa2023transformative@buzzicotti2023data. Due to the limited
sensors, the reconstruction of multi-scale full-field data from
extremely sparse and random observations is inherently an ill-posed
problem, where the results often suffers from issues related to
existence, uniqueness, and stability
@hadamard2014lectures@breiding2023algebraic.

Compressed sensing has been widely applied to address this challenge. It
relies on the assumption that signals are sparse in a specific transform
domain, and reconstructs full-field data from undersampled observations
by solving optimization problems @candes2006robust. To enhance
reconstruction performance, compressed sensing variants combined with
deep learning have been proposed, aiming to automatically learn
effective sparse representations and reconstruction mappings in a
data-driven manner
@sun2017intelligent@shi2019image@ni2020deep@xu2022sparse. While these
methods have achieved certain theoretical and experimental progress,
several limitations remain. Classic compressed sensing heavily depends
on the sparsity prior, leading to performance degradation when dealing
with non-sparse structures. Deep learning-based variants, although more
flexible, are still often restricted to single-scale, fixed-domain
reconstruction and struggle to capture multi-scale information.

Besides the compressed sensing-based methods, many existing methods
attempt to directly establish an end-to-end mapping between sparse
measurements and the corresponding full-field data
@fukami2021global@fan2025vitae@li2025novel@ghazijahani2025spatial.
However, such mappings are typically trained with a specific
reorganization form of sparse data (for example, patch or voronoi
tessellation) and geometric boundary. When encountering unseen sparse
measurements---such as data acquired from a different sensor
configuration---or when facing new geometric boundaries, these models
often fail to produce accurate reconstructions and require retraining to
adapt to the new scenarios. As a result, the applicability of these
methods is generally limited to controlled or narrowly defined settings.
They often struggle with generalization when applied to complex,
real-world environments. Moreover, when the available observations
become extremely sparse, the inherent ill-posed nature of the
reconstruction problem severely impedes the ability to establish a
stable and reliable mapping from sparse inputs to the full-field data
@bell1978solutions@candes2011tight@arridge2019solving.

Generative models, such as generative adversarial networks
@goodfellow2020generative and diffusion models
@ho2020denoising@song2020score, have shown remarkable capabilities in
producing high-quality, diverse data, with broad applications in vision
@wang2023dr2@miao2024waveface@zhao2023towards, biomedicine
@cao2024high@yu2020medical@nguyen2024sequence, and scientific computing
@lienen2306zero@ruhling2023dyffusion@li2024synthetic. By learning data
distributions rather than explicit input--output mappings, these models
can generate unseen but statistically consistent samples. Early studies
applying generative models to field reconstruction primarily follow two
approaches. One line of work learns supervised conditional distributions
between full-field low-resolution and high-resolution data pairs
@deng2019super@shu2023physics. However, due to the immense variability
of sparse measurement patterns, directly modeling the distribution of
full-field data conditioned on sparse observations is practically
infeasible, as it is impossible to cover all sparse-to-full field
mappings during training. Another approach adopts a reverse diffusion
step followed by a projection-based measurement consistency step
@choi2021ilvr@chung2022come@kadkhodaie2021stochastic or a Bayesian
sampling step @du2024conditional@li2024learning after pretraining an
unconditional diffusion model to ensure the generated samples match
sparse observations. However, this enforced measurement consistency
often throws the sample path off the data manifold, leading to incorrect
reconstructions @chung2022improving. Although the manifold constrained
gradient @chung2022improving is proposed to mitigate this problem, under
extremely sparse observations, the model still tends to produce random
samples due to the overly loose constraints, resulting in non-unique and
unreliable reconstructions. Similarly, FunDiff @wang2025fundiff also
relies on incorporating measurement consistency during the sampling
stage to enforce conditional generation, and therefore suffers from
degraded reconstruction quality under extremely sparse observations.
Moreover, it extends diffusion models to function spaces by coupling a
function autoencoder with latent diffusion, enabling physics-informed
generative modeling across different discretizations. While powerful for
capturing global structures, this latent-space generation strategy
introduces an information bottleneck: fine-scale details may be lost
during encoding and cannot be fully recovered during decoding, which can
limit its effectiveness in detail reconstruction from sparse
observations.

Cascading pipeline of generative model is an effective way to improve
the generation quality in case without strong conditioning information
@nichol2021improved@saharia2022image@ho2022cascaded. In computer vision,
this approach involves training a sequence of models at progressively
higher resolutions: a base model generates low-resolution samples, which
are then refined by super-resolution models @ho2022cascaded. Compared to
training a single high-resolution model, cascading allocates most model
capacity to low resolutions, which are critical for overall sample
quality, while significantly improving training and inference
efficiency. Moreover, individual models can be optimized independently,
with architecture choices tailored to each resolution for optimal
pipeline performance.

Inspired by the cascading pipeline, the Cascaded Sensing (Cas-Sensing)
based on an autoencoder-diffusion cascade is proposed to achieve
accurate and robust multi-scale fields reconstruction from extremely
sparse measurements. In Cas-Sensing, by viewing the full-field data as
functional data, an neural operator-based functional autoencoder is
first trained @bunker2024autoencoders to extract the latent features of
data, thus having the ability of robustly recovering the principal
structures (large-scale components with geometric boundaries) from
arbitrary sparse measurements. Then a conditional diffusion model is
trained with the conditions---the reconstructed principal
structures---to only focus on generating the small-scale details which
are the difference between ground truth and conditions. To enhance the
robustness of diffusion model, we introduce a Mask-Cascade Training
(MCT) approach, which applies different random masks during training to
generate diverse conditions from a fixed ground-truth field. After
training the conditional diffusion model, we employ the Manifold
Constrained Gradient (MCG) @chung2022improving during sampling to ensure
that the generated full-field data not only matches the sparse
observations at measurement locations, but also remains consistent with
the underlying data manifold. The proposed cascade pipeline effectively
alleviates the ill-posedness of the original reconstruction problem by
progressively recovering multi-scale components in a staged manner,
thereby enabling Cas-Sensing to achieve high accuracy, strong
generalizability, and enhanced robustness in reconstruction tasks.

The remainder of the paper is organized as follows. In Section 2, we
present the problem formulation and describe the proposed methodology in
detail, including the functional autoencoder, the conditional diffusion
model, and the proposed mask-cascade training approach. Section 3
demonstrates the effectiveness of Cas-Sensing through a series of
experiments with simulated data of circular cylinder flow, real-world
data of ocean wave height, and real-world data of global ocean
temperature. In Section 4, we discuss the advantages and limitations of
Cas-Sensing. Finally, Section 5 concludes the paper and outlines
directions for future work.

= Methods
<sec:methods>
== Problem formulation
#label("sec:problem formulation")
The problem of recovering the multi-scale full field
$bold(u) in bb(R)^m$ from a vector of sparse sensor measurements
$bold(y) in bb(R)^n$ can be formulated as modeling the conditional
distribution $p \( bold(u) \| bold(y) \)$. However, when the
observations are excessively sparse, directly modeling
$p \( bold(u) \| bold(y) \)$ is ill-posed, as the solution becomes
highly non-unique. To address this challenge, we propose Cas-Sensing, a
cascaded framework that mitigates the ill-posedness by leveraging the
following marginalization rule:
$ p \( bold(u) \| bold(y) \) = integral p \( bold(u) \, bold(m) \| bold(y) \) thin d bold(m) = integral p \( bold(u) \| bold(m) \, bold(y) \) thin p \( bold(m) \| bold(y) \) thin d bold(m) = bb(E)_(bold(m) tilde.op p \( bold(m) \| bold(y) \)) \[ thin p \( bold(u) \| bold(m) \, bold(y) \) thin \] \, $
where $bold(m)$ represents the principal structure (the large-scale
component) of $bold(u)$. This formulation naturally decomposes the task
into two subtasks: modeling $p \( bold(m) \| bold(y) \)$ to infer the
principal structure from sparse observations, and modeling
$p \( bold(u) \| bold(m) \, bold(y) \)$ to reconstrut the full field
$bold(u)$ by adding high-frequency details to $bold(m)$ based on both
$bold(m)$ and $bold(y)$. Since the principal structures of the signal
are often sparse, reconstructing $bold(m)$ from sparse
observations---i.e., modeling $p \( bold(m) \| bold(y) \)$---is
generally well-posed. Furthermore, compared to directly modeling
$p \( bold(u) \| bold(y) \)$, modeling
$p \( bold(u) \| bold(m) \, bold(y) \)$ incorporates an additional
condition, constraining the reconstruction of $bold(u)$ to remain
consistent with the principal structures $bold(m)$. Consequently, the
degree of ill-posedness is substantially alleviated through this
cascaded pipeline.

In the proposed Cas-Sensing framework based on an autoencoder-diffusion
cascade, a functional autoencoder is first trained to approximately
model $p \( bold(m) \| bold(y) \)$. Then, a conditional diffusion model
trained with the proposed mask-cascade training strategy to approximate
$bb(E)_(bold(m) tilde.op p \( bold(m) \| bold(y) \)) \[ thin p \( bold(u) \| bold(m) \, bold(y) \) thin \]$.
Specifically, once the autoencoder is trained and fixed, random sparse
measurements $bold(y)$ are generated from $bold(u)$ and mapped through
the autoencoder to produce corresponding $bold(m)$. The conditional
diffusion model is then trained to generate $bold(u)$ conditioned on
both $bold(m)$ and $bold(y)$, effectively learning to reconstruct the
full field from varying sparse observations.

== Functional autoencoder for principal structure reconstruction
<sec:FAE>
In practical engineering, sensors are often randomly placed, and many
physical fields involve complex geometric boundaries, making field
reconstruction from unstructured data challenging @chai2020deep. To
address this, we adopt a neural operator-based functional autoencoder
@bunker2024autoencoders, which enables coordinate-based input for neural
networks@regazzoni2024learning@krishnapriyan2023learning. The functional
autoencoder extracts latent features from unstructured data and robustly
reconstruct the principal structure from random and sparse inputs.

We model the inverse mapping from sparse observations $bold(y)$ to the
principal structure $bold(m)$ using a deterministic autoencoder rather
than a probabilistic model (e.g., a variational autoencoder). This
choice is justified by the low uncertainty inherent in reconstructing
$bold(m)$ from $bold(y)$ due to: (1) the strong sparse prior of
$bold(m)$ constraining the solution space since large-scale patterns
vary smoothly and can be represented with few basis functions; (2)
average pooling operation in the autoencoder promoting invariant and
robust feature learning; and (3) our masked training strategy explicitly
enhancing model's robustness to noise and varying sensing patterns in
$bold(y)$. As a result, the posterior $p \( bold(m) \| bold(y) \)$ is
highly concentrated, allowing us to approximate it as
$p \( bold(m) \| bold(y) \) approx delta \( bold(m) - hat(bold(m)) \( bold(y) \) \)$,
where $delta \( dot.op \)$ is a Dirac delta function and
$hat(bold(m)) \( bold(y) \)$ is the autoencoder output. This avoids
instability from learning a full posterior variance, and still achieves
accurate and robust reconstruction, as confirmed in our experiments.

=== The architecture of functional autoencoder
#label("sec: OAE architecture")
The encoder $cal(E)$ maps a function $u : Omega arrow.r bb(R)^m$ to a
latent vector $z in bb(R)^(d_z)$. In developing the encoder--decoder
architectures, we assume that $cal(U)$ is a Banach space of functions
that can be evaluated pointwise almost everywhere, with domain
$Omega subset bb(R)^d$ and codomain $bb(R)^m$. In practice, we only have
access to discretized representations $u \( x \) in cal(U)$, obtained by
evaluating $u$ at a finite set of mesh points. Following the formulation
in @li2020neural@li2020fourier, we parametrise the encoder as a kernel
integral operator:
$ cal(E) \( u \; zeta \) = rho (integral_Omega kappa (x \, u \( x \) \; zeta_1) upright(d) x \; zeta_2) in cal(Z) = bb(R)^(d_z) \, $#label("sec: pooling encoder")
with $kappa : Omega times bb(R)^m times zeta_1 arrow.r bb(R)^l$
parameterised as a neural network with hidden layers of width $l = 64$,
using GELU activation, and with
$rho : bb(R)^l times zeta_2 arrow.r bb(R)^(d_z)$ parametreised as the
linear layer $rho \( v \; zeta_2 \) = W^(zeta_2) v + b^(zeta_2)$, where
$d_z$ denotes the dimension of latent vector $z$ and
$zeta = \[ zeta_1 \, zeta_2 \]$ denotes the parameters of encoder. We
augment $x in Omega$ with 16 random Fourier features to aid learning of
high-frequency features @tancik2020fourier@li2020fourier. After
discretisation on data
$bold(u) = { \( x_i \, u \( x_i \) \) }_(i = 1)^I$, in which we
approximate the integral over $Omega$ by a normalised sum:
$ { \( x_i \, u \( x_i \) \) \| i = 1 \, 2 \, . . . I } arrow.r rho \( upright("pool") \( { kappa \( x_i \, u \( x_i \) \; zeta_1 \) \| i = 1 \, 2 \, . . . I } \; zeta_2 \) \) $
where pool is a pooling operation invariant to the order of its
inputs---in our case, the average pooling. The average pooling operation
reduces the discrepancy between latent representations derived from
sparse and dense inputs, thereby endowing the functional autoencoder
with the capability for accurate sparse-data reconstruction.

The decoder $cal(D)$ maps a latent vector $z in cal(Z)$ back to a
function $cal(D) \( z \; psi \) : Omega arrow.r bb(R)^m$. To realize
this mapping, we parameterize $cal(D)$ with a coordinate-based neural
network $gamma : cal(Z) times Omega times Psi arrow.r bb(R)^m$, whose
hidden layers employ GELU activations. Accordingly, we have
$ cal(D) \( z \; psi \) \( x \) = gamma \( z \, x \; psi \) in bb(R)^m . $#label("sec: nonlinear decoder")
In this construction, each spatial coordinate $x in Omega$ is enriched
with 16 random Fourier features. Inspired by DeepONet @lu2021learning,
the proposed architecture enables the decoded function
$cal(D) \( z \; psi \)$ to be evaluated on arbitrary meshes, with the
computational cost scaling linearly in the number of discretization
points.

=== Training objective and masked training
#label("sec: OAE loss and masked training")
The central aim of training a functional autoencoder is to compress
functional data $u$ into a low-dimensional latent code while retaining
sufficient information to accurately reconstruct the original signal.
Formally, the optimization problem is expressed as
$ cal(L) \( zeta \, psi \) = 1 / 2 \| \| cal(D) \( cal(E) \( u \; zeta \) \; psi \) - u \| \|_2^2 + beta \| \| cal(E) \( u \; zeta \) \| \|_2^2 \, $#label("eq:FAE loss")
where the second term, $beta \| \| cal(E) \( u \; zeta \) \| \|_2^2$,
plays the role of regularisation, ensuring that the latent
representation is smooth and structured.

A widely adopted strategy to further enhance autoencoder performance is
self-supervised masked training, in which the model learns to recover
missing portions of data from partially observed inputs @he2022masked.
This training paradigm not only accelerates convergence but also
improves generalisation. More importantly, it equips the network with
the ability to reason about incomplete data, which is particularly
advantageous when dealing with sparse or irregular samples
@devlin2019bert@liu2021robustly@raffel2020exploring. In our framework,
we employ the complement mask training approach proposed in
@bunker2024autoencoders, which exploits the flexibility of discretising
both encoder and decoder on arbitrary computational meshes.
Specifically, consider a discretised function sample
$bold(u) = { \( x_i \, u \( x_i \) \) }_(i = 1)^m$. At each training
iteration, two index subsets $cal(I)_(upright("enc"))$ and
$cal(I)_(upright("dec"))$ of $cal(I) = { 1 \, dots.h \, m }$ are
randomly drawn to form
$bold(u)_(upright("e")) = { \( x_i \, u \( x_i \) \) \| i in cal(I)_(upright("enc")) }$
and
$bold(u)_(upright("d")) = { \( x_i \, u \( x_i \) \) \| i in cal(I)_(upright("dec")) }$.
In practice, $cal(I)_(upright("enc"))$ is chosen as a random subset of
$cal(I)$, while $cal(I)_(upright("dec"))$ is set to its complement,
i.e.,
$cal(I)_(upright("dec")) = cal(I) without cal(I)_(upright("enc"))$. The
ratio
$r_(upright("enc")) = \| cal(I)_(upright("enc")) \| \/ \| cal(I) \|$ is
treated as a tunable hyperparameter. As depicted in #ref(label("fig:overview of Cas-Sensing"))\(a), the encoder processes
$bold(u)_(upright("e"))$, while the decoder is evaluated on the
complementary mesh ${ x_i }_(i in cal(I)_(upright("dec")))$\; the
resulting output is then compared against $bold(u)_(upright("d"))$.

== Conditional diffusion model for detail generation
#label("sec: CDM")
After reconstructing the principal structures with the functional
autoencoder, a conditional diffusion model is trained to generate the
small-scale components, defined as the difference between the ground
truth and the reconstructed principal structures, conditioned on the
principal structures. By defining the detail or residual
$bold(d) = bold(u) - bold(m)$, learning
$p \( bold(u) \| bold(m) \, bold(y) \)$ is equivalent to learning
$p \( bold(d) \| bold(m) \, bold(y) \)$ as it is a deterministic
relationship. Modeling the residual $bold(d)$ simplifies the learning
task, reduces complexity of modeling, and improves training stability
and convergence. It also introduces an inductive bias, constraining the
reconstructed $bold(u)$ to remain close to $bold(m)$, thereby
restricting the solution space and mitigating ill-posedness. As
discussed above, the functional autoencoder approximates
$p \( bold(m) \| bold(y) \)$ with a Dirac delta function
$delta \( bold(m) - hat(bold(m)) \( bold(y) \) \)$. Consequently, the
conditional diffusion model should be trained to model:
$ p \( bold(u) \| bold(y) \) = integral p \( bold(u) \| bold(m) \, bold(y) \) thin p \( bold(m) \| bold(y) \) thin d bold(m) & = integral p \( bold(d) \| bold(m) \, bold(y) \) thin p \( bold(m) \| bold(y) \) thin d bold(m) approx integral p \( bold(d) \| bold(m) \, bold(y) \) thin delta \( bold(m) - hat(bold(m)) \( bold(y) \) \) thin d bold(m) = p \( bold(d) \| hat(bold(m)) \( bold(y) \) \, bold(y) \) . $

=== Conditional denoising diffusion probabilistic model
#label("sec: DDPM")
Training of denoising diffusion probabilistic models (DDPMs) consists of
a diffusion process and a denoising process. Diffusion process
transforms $bold(d)_0$ from the real data distribution
$bold(d)_0 tilde.op p \( bold(d)_0 \)$ into a pure Gaussian noise
$bold(d)_t tilde.op cal(N) \( 0 \, bold(I) \)$ by successively applying
the following Markov diffusion kernel:
$ p \( bold(d)_t \| bold(d)_(t - 1) \) = cal(N) (bold(d)_t \; sqrt(1 - beta_t) thin bold(d)_(t - 1) \, thin beta_t upright(bold(I))) \, $
where ${ beta_t }_(t = 1)^T$ is a pre-defined or learned noise variance
schedule. We adopt a linear noise schedule where the variance $beta_t$
increases linearly from $1 times 10^(- 4)$ to $0.02$ over $T = 1000$
diffusion steps. The marginal distribution at arbitrary timestep $t$ can
be denoted as:
$ p \( bold(d)_t \| bold(d)_0 \) = cal(N) (bold(d)_t \; sqrt(macron(alpha)_t) thin bold(d)_0 \, thin \( 1 - macron(alpha)_t \) thin upright(bold(I))) \, $
where
$macron(alpha)_t = product_(s = 1)^t alpha_s \, alpha_t = \( 1 - beta_t \)$.
When
$T arrow.r oo \, med p \( bold(d)_t \| bold(d)_0 \) approx cal(N) \( upright(bold(0)) \, upright(bold(I)) \)$.
For sampling,
$bold(d)_t = sqrt(macron(alpha)_t) bold(d)_0 + \( 1 - macron(alpha)_t \) bold(epsilon.alt) \, med bold(epsilon.alt) tilde.op cal(N) \( upright(bold(0)) \, upright(bold(I)) \)$.

Given $bold(d)_t$, the denoising process aims to recover $bold(d)_0$ by
recursively learning the transition from $bold(d)_(t - 1)$ to
$bold(d)_t$, which is defined as the following Gaussian distribution:
$ q_theta \( bold(d)_(t - 1) \| bold(d)_t \) = cal(N) (bold(d)_(t - 1) \; bold(mu)_theta \( bold(d)_t \, t \) \, bold(Sigma)_theta \( bold(d)_t \, t \)) \, $
where parameters $theta$ are optimized by a denoising network
$bold(epsilon.alt)_theta$ that predicts
$bold(mu)_theta \( bold(d)_t \, t \) = 1 / sqrt(alpha_t) (upright(bold(bold(d)))_t - frac(1 - alpha_t, sqrt(1 - macron(alpha)_t)) thin bold(epsilon.alt)_theta \( upright(bold(bold(d)))_t \, t \))$.
As for $bold(Sigma)_theta \( bold(d)_t \, t \)$, we use the closed-form
posterior variance
$sigma_t^2 = beta_t frac(1 - macron(alpha)_(t - 1), 1 - macron(alpha)_t)$
as proposed in the original denoising diffusion probabilistic model
formulation @ho2020denoising, instead of predicting it via neural
network.

However, this unconditional scheme fails to preserve the uniqueness of
reconstruction due to the lack of guidance during generation. Therefore,
$hat(bold(m)) \( bold(y) \)$ is injected as the condition for the
denoising process:
$ q_theta \( bold(d)_(t - 1) \| bold(d)_t \, hat(bold(m)) \( bold(y) \) \) = cal(N) \( bold(d)_(t - 1) \; bold(mu)_theta \( bold(d)_t \, t \, hat(bold(m)) \( bold(y) \) \) \, sigma_t^2 upright(bold(I)) \) \, $
where $hat(bold(m)) \( bold(y) \)$ is injected by concatenating with the
input $bold(d)_t$ along the channel dimension.

To generate samples from the trained model, the reverse process is
iteratively performed starting from a Gaussian noise
$bold(d)_T tilde.op cal(N) \( 0 \, upright(bold(I)) \)$ as follows:
$ upright(bold(bold(d)))_(t - 1) = 1 / sqrt(alpha_t) (upright(bold(bold(d)))_t - frac(1 - alpha_t, sqrt(1 - macron(alpha)_t)) bold(epsilon.alt)_theta \( upright(bold(bold(d)))_t \, t \, hat(bold(m)) \( bold(y) \) \)) + sigma_t bold(epsilon.alt) \, quad bold(epsilon.alt) tilde.op cal(N) \( upright(bold(0)) \, upright(bold(I)) \) . $<eq:sampling>

This process is repeated until $t = 1$, at which point $bold(d)_0$ is
taken as the final reconstructed sample.

=== Manifold constrained gradient
#label("sec: MCG")
The conditional distribution
$p \( bold(d)_(t - 1) \| bold(d)_t \, hat(bold(m)) \( bold(y) \) \)$ has
been modeled by training the conditional diffusion model. The
$p \( bold(d)_(t - 1) \| bold(d)_t \, hat(bold(m)) \( bold(y) \) \, bold(y) \)$
should be modeled to further preserve the uniqueness of reconstruction
and impose measurement consistency. However, directly model the
condtional distribution
$p \( bold(d)_(t - 1) \| bold(d)_t \, hat(bold(m)) \( bold(y) \) \, bold(y) \)$
is impossible due to the immense variability of sparse measurement
patterns. We model it during inference instead of training of
conditional diffusion model. Specifically, the Manifold Constrained
Gradient (MCG) @chung2022improving is used to inject an additional
gradient term to guide the generation towards observed measurements
without retraining the model. This gradient refers to the score function
in score-based generative models (SGMs) @song2020score, defined as the
gradient of the log-density of the data distribution
$nabla_(bold(d)_t) log p_t \( bold(d)_t \| hat(bold(m)) \( bold(y) \) \)$.

Although DDPMs and SGMs were originally proposed under different
formulations---predicting added noise in DDPMs and estimating score
functions in SGMs---it has been shown that they are theoretically
equivalent under certain parameterizations @song2020score. Specifically,
when a DDPM is trained to predict the Gaussian noise
$bold(epsilon.alt)_theta$ added at each step, the network implicitly
learns the score function of the perturbed data distribution
$p_t \( bold(d)_t \| hat(bold(m)) \( bold(y) \) \)$ up to a scaling
factor:
$ nabla_(bold(d)_t) log p_t \( bold(d)_t \| hat(bold(m)) \( bold(y) \) \) approx - 1 / sqrt(1 - macron(alpha)_t) bold(epsilon.alt)_theta \( bold(d)_t \, t \, hat(bold(m)) \( bold(y) \) \) \, $

Therefore, the sampling equation in Eq. @eq:sampling can be reformulated
as:
$ upright(bold(bold(d)))_(t - 1) = 1 / sqrt(alpha_t) (upright(bold(bold(d)))_t + \( 1 - alpha_t \) nabla_(bold(d)_t) log p_t \( bold(d)_t \| hat(bold(m)) \( bold(y) \) \)) + sigma_t bold(epsilon.alt) \, quad bold(epsilon.alt) tilde.op cal(N) \( upright(bold(0)) \, upright(bold(I)) \) . $#label("eq:gradient sampling")

This connection enables MCG to be directly applied to DDPMs.
Specifically, the Bayes rule
$p \( bold(d)_t \| hat(bold(m)) \( bold(y) \) \, bold(y) \) = frac(p \( bold(d)_t \| hat(bold(m)) \( bold(y) \) \) p \( bold(y) \| bold(d)_t \, hat(bold(m)) \( bold(y) \) \), p \( bold(y) \| hat(bold(m)) \( bold(y) \) \))$
leads to:
$ nabla_(bold(d)_t) log p_t \( bold(d)_t \| hat(bold(m)) \( bold(y) \) \, bold(y) \) = nabla_(bold(d)_t) log p_t \( bold(d)_t \| hat(bold(m)) \( bold(y) \) \) + nabla_(bold(d)_t) log p_t \( bold(y) \| bold(d)_t \, hat(bold(m)) \( bold(y) \) \) \, $
where
$nabla_(bold(d)_t) log p_t \( bold(d)_t \| hat(bold(m)) \( bold(y) \) \)$
has been modeled by conditional diffusion model. To approximate the
likelihood term
$p_t \( bold(y) \| bold(d)_t \, hat(bold(m)) \( bold(y) \) \)$, we
assume that it follows a Gaussian form, i.e.,
$ p_t \( bold(y) \| bold(d)_t \, hat(bold(m)) \( bold(y) \) \) prop exp (- frac(1, 2 sigma_c^2) parallel bold(y) - cal(M) \( hat(bold(m)) \( bold(y) \) + bold(d)_t \) parallel_2^2) \, $
where $cal(M) \( dot.op \)$ denotes the mask operator and $sigma_c^2$
denotes the variance associated with measurement noise. $sigma_c^2$ is
set as 10000 in all experiments of this study. Under this assumption,
its gradient with respect to $bold(d)_t$ yields:
$ nabla_(bold(d)_t) log p_t \( bold(y) \| bold(d)_t \, hat(bold(m)) \( bold(y) \) \) = - 1 / sigma_c^2 frac(partial, partial bold(d)_t) \| \| bold(y) - cal(M) \( hat(bold(m)) \( bold(y) \) + bold(d)_t \) \| \|_2^2 $#label("eq:project method likelihood")

Therefore, the sampling formula without retraining the model is given
as:
$ bold(d)_(t - 1) = 1 / sqrt(alpha_t) (upright(bold(bold(d)))_t + \( 1 - alpha_t \) #scale(x: 120%, y: 120%)[\(] nabla_(bold(d)_t) log p_t \( bold(d)_t \| hat(bold(m)) \( bold(y) \) \) - 1 / sigma_c^2 frac(partial, partial bold(d)_t) \| \| bold(y) - cal(M) \( hat(bold(m)) \( bold(y) \) + bold(d)_t \) \| \|_2^2 #scale(x: 120%, y: 120%)[\)]) + sigma_t bold(epsilon.alt) \, quad bold(epsilon.alt) tilde.op cal(N) \( upright(bold(0)) \, upright(bold(I)) \) . $#label("eq:project method_sample")

However, it drives the intermediate states at each denoising step to
match the observations, which pulls the sample path away from the
learned data manifold. Chung et al. @chung2022improving reveal that the
Bayes optimal denoising step from the Tweedie's formula
@robbins1992empirical leads to a preferred condition for diffusion model
both empirically and theoretically. As a result, Tweedie's formula is
introduced here to impose the measurement consistency while improving
the generation accuracy. In the case of Gaussian noise, a classic result
of Tweedie's formula tells us that one can achieve the denoised result
by computing the posterior expectation:
$ bb(E) \[ bold(d) \| tilde(bold(d)) \] = tilde(bold(d)) + sigma^2 nabla_(tilde(bold(d))) l o g med p \( tilde(bold(d)) \) \, $
where the noise is modeled by
$tilde(bold(d)) tilde.op cal(N) \( bold(d) \, sigma^2 upright(bold(I)) \)$.
Considering the conditional diffusion model where the forward step is
modeled as
$bold(d)_t tilde.op cal(N) (sqrt(macron(alpha)_t) thin bold(d)_0 \, thin \( 1 - macron(alpha)_t \) thin upright(bold(I)))$,
the Tweedie's formula can be rewritten as:
$ bb(E) \[ bold(d)_0 \| bold(d)_t \, hat(bold(m)) \( bold(y) \) \] = 1 / sqrt(macron(alpha)_t) #scale(x: 120%, y: 120%)[\(] bold(d)_t + \( 1 - macron(alpha)_t \) nabla_(bold(d)_t) log p_t \( bold(d)_t \| hat(bold(m)) \( bold(y) \) \) #scale(x: 120%, y: 120%)[\)] $#label("eq:Tweedie's formula")

By replacing $bold(d)_t$ in
Eq.#link(label("eq:project method likelihood"))[\[eq:project method likelihood\]]
with the posterior expectation computed by Tweedie's formula
$hat(bold(d))_0 \( bold(d)_t \) = bb(E) \[ bold(d)_0 \| bold(d)_t \, hat(bold(m)) \( bold(y) \) \]$,
the sampling formula for the trained conditional diffusion model is
given as:
$ bold(d)_(t - 1) = 1 / sqrt(alpha_t) (upright(bold(bold(d)))_t + \( 1 - alpha_t \) #scale(x: 120%, y: 120%)[\(] nabla_(bold(d)_t) log p_t \( bold(d)_t \| hat(bold(m)) \( bold(y) \) \) - 1 / sigma_c^2 frac(partial, partial bold(d)_t) \| \| bold(y) - cal(M) \( hat(bold(m)) \( bold(y) \) + hat(bold(d))_0 \( bold(d)_t \) \) \| \|_2^2 #scale(x: 120%, y: 120%)[\)]) + sigma_t bold(epsilon.alt) \, quad bold(epsilon.alt) tilde.op cal(N) \( upright(bold(0)) \, upright(bold(I)) \) \, $#label("eq:mcg sample")
where
$- 1 / sigma_c^2 frac(partial, partial bold(d)_t) \| \| bold(y) - cal(M) \( hat(bold(m)) \( bold(y) \) + hat(bold(d))_0 \( bold(d)_t \) \) \| \|_2^2$
is the manifold constrained gradient that enforces consistency between
the predicted clean sample and the observations. It has been proven that
manifold constrained gradient is the projection of Eq.
#link(label("eq:project method likelihood"))[\[eq:project method likelihood\]]
onto the data manifold @chung2022improving, thereby keeping the
trajectory on the data manifold and alleviating sample degradation.

=== Mask-cascade training
#label("sec: MCT")
We propose a mask-cascade training strategy to improve the robustness of
the conditional diffusion model under varying sparsity patterns. A key
challenge is that the functional autoencoder, when provided with
different sparse samplings of the same field, reconstructs slightly
different principal structures. Since it is infeasible to enumerate all
possible reconstructions for training, directly using a fixed dataset
would restrict the generalization ability of the diffusion model.

To address this issue, our strategy explicitly integrates the
stochasticity of sparse sampling into training the conditional diffusion
model. As illustrated in #ref(label("fig:overview of Cas-Sensing"))\(b), once the functional
autoencoder is fully trained and its parameters are frozen, the training
of the conditional diffusion model proceeds as follows: in each training
step, we randomly generate a sparse mask and apply it to the
ground-truth field $bold(u)$ to obtain a partial observation $bold(y)$.
This observation is then passed through the functional autoencoder to
reconstruct an approximate principal structure
$hat(bold(m)) \( bold(y) \)$. The conditional diffusion model is then
conditioned on $hat(bold(m)) \( bold(y) \)$, and trained to generate the
fine-scale component $bold(d) = bold(u) - hat(bold(m)) \( bold(y) \)$.
By repeatedly sampling different masks across training steps, the
conditional diffusion model is continuously exposed to a diverse
ensemble of approximate principal structure reconstructions. This
effectively augments the training distribution of conditioning inputs
without the need for explicitly precomputing or storing all possible
variants. As a result, the conditional diffusion model learns to model
the conditional distribution
$p \( bold(d) \| hat(bold(m)) \( bold(y) \) \)$, thereby achieving
improved robustness and consistency across varying sparsity patterns.

As shown in #ref(label("fig:overview of Cas-Sensing"))\(c), the
inference process of autoencoder-diffusion cascade proceeds as follows.
Given arbitrary sparse observations $bold(y)$, the functional
autoencoder first reconstructs the principal structure
$hat(bold(m)) \( bold(y) \)$. This reconstructed structure is then
provided as a condition to the conditional diffusion model, which
generates the fine-scale details $hat(bold(d))$ through the manifold
constrained gradient-enhanced sampling scheme in Eq.
#link(label("eq:mcg sample"))[\[eq:mcg sample\]]. Finally, the
full-field reconstruction is obtained by combining the two components
$hat(bold(u)) = hat(bold(m)) \( bold(y) \) + hat(bold(d))$. It is worth
noting that, during inference, Cas-Sensing can still achieve reliable
reconstruction even when the sampling rate of sparse observations
differs significantly from the rates used in mask-cascade training.

#figure([#align(center)[#image("source/Figures/masked_training_of_FAE.png",width:83%) #linebreak() #text(size:9pt)[(a) The masked training scheme of functional autoencoder. The trained
functional autoencoder is to approximate $p \( bold(m) \| bold(y) \)$
with $delta \( bold(m) - hat(bold(m)) \( bold(y) \) \)$ as it learns the
deterministic mapping between $bold(y)$ and $bold(m)$. $x_e$ and $u_e$
denote the coordinates and field values fed into the encoder, while
$x_d$ and $u_d$ represent the coordinates and reconstructed values
produced by the decoder.]]

  #align(center)[#image("source/Figures/mask-cascade_training_of_CDM.png",width:83%) #linebreak() #text(size:9pt)[(b) The mask-cascade training scheme of conditional diffusion model, which
ensure the conditional diffusion model's accurate capturing
$p \( bold(d) \| hat(bold(m)) \( bold(y) \) \)$.]]

  #align(center)[#image("source/Figures/inference_of_cas-sensing.png",width:83%) #linebreak() #text(size:9pt)[(c) The inference scheme of Cas-Sensing based on an autoencoder-diffsusion
cascade, which is the process of sampling from
$p \( bold(u) \| bold(y) \) approx p \( bold(d) \| hat(bold(m)) \( bold(y) \) \, bold(y) \)$.
Manifold Constrained Gradient (MCG) is used to impose measurement
consistency and sample from
$p \( bold(d) \| hat(bold(m)) \( bold(y) \) \, bold(y) \)$ without
retraining the model.]]

  ],
  caption: [
    Overview of the proposed Cascaded Sensing (Cas-Sensing) based on an
    autoencoder-diffusion cascade.
  ]
)
#label("fig:overview of Cas-Sensing")

= Results
<sec:results>
== Reconstructing cylinder flow velocity fields with simulation data
<reconstructing-cylinder-flow-velocity-fields-with-simulation-data>
To evaluate the effectiveness of the proposed Cas-Sensing based on an
autoencoder-diffusion cascade in reconstructing full-field data from
randomly sparse observations under varying geometric boundary
conditions, we first constructed a 2D cylinder flow dataset. This
dataset captures incompressible fluid dynamics around a 2D circular
cylinder within a channel: $ nabla dot.op upright(bold(u)) & = 0 \,\
frac(partial upright(bold(u)), partial t) + \( upright(bold(u)) dot.op nabla \) upright(bold(u)) & = mu nabla^2 upright(bold(u)) - 1 / rho nabla p . $

Specifically, the computational domain is defined as a rectangular
region of size $1.6 times 0.6$, within which both the cylinder center
and radius are randomly sampled. This procedure yields a dataset
comprising 96 distinct boundary configurations, each associated with 100
temporal snapshots. All flow fields are interpolated onto a uniform grid
of size $256 times 96$. The visualization of a sample from the Cylinder
Flow is presented in #ref(label("fig:cylinder flow example")). For
the purpose of model training and evaluation, the dataset is partitioned
based on boundary configurations rather than temporal snapshots,
ensuring that the test set contains unseen geometrical variations.
Specifically, 76 boundary configurations, corresponding to a total of
7600 flow field snapshots, are employed as the training set, while the
remaining 20 configurations, consisting of 2000 snapshots, are reserved
exclusively for testing.

#figure(image("source/Figures/cylinder_flow_sample.png", width: 60.0%),
  caption: [
    An example of 2D cylinder flow velocity fields. The dataset contains
    96 different boundary configurations of circular cylinders, each
    associated with 100 temporal snapshots.
  ]
)
#label("fig:cylinder flow example")

We first employ a functional autoencoder to learn compact
representations of the circular cylinder flow fields. To encourage
robustness, the model is trained in a masked manner, where only $50 %$
of the grid points in each snapshot are provided to the encoder and the
task is to reconstruct the full field from this partial information. To
investigate the latent representation learned by the functional
autoencoder, we first visualize the extracted latent vectors of the
cylinder flow dataset. Specifically, the 32-dimensional latent vectors
are projected into a two-dimensional space using the t-distributed
Stochastic Neighbor Embedding (t-SNE) technique @maaten2008visualizing.
Each point in #ref(label("fig:cylinder flow latent space"))
corresponds to the latent variable of a single flow snapshot. It can be
observed that the training data associated with different internal
boundary configurations are well separated in the latent space, and the
latent vectors of snapshots from the same configuration form circular
patterns. This circular structure reflects the inherent periodicity of
the velocity fields in cylinder wake flows. Moreover, the latent vectors
corresponding to the test dataset exhibit the same characteristic
structures, indicating that the functional autoencoder has effectively
captured both the temporal and geometric features of the flow fields.

#figure(image("source/Figures/cylinder_flow_latent_space.png", width: 50.0%),
  caption: [
    t-SNE visualization of latent representations learned by the
    functional autoencoder for cylinder flow fileds.
  ]
)
#label("fig:cylinder flow latent space")

To further assess the model's reconstruction capability under varying
levels of data sparsity, we select a representative flow field from the
test set and apply 100 randomly generated masks with sampling ratios of
$50 % \, 10 % \, 3 % \, 1 %$, and $0.5 %$. The masked inputs are then
mapped through the trained functional autoencoder to recover the
complete field on the $256 times 96$ grid. The distributions of the
resulting reconstruction errors, quantified by the root mean square
error (RMSE), are illustrated in
Fig.~#ref(label("fig:cylinder flow FAE ratio comparision")).
Quantitative results confirm the strong robustness of the functional
autoencoder in reconstructing cylinder wake flows under varying levels
of input sparsity. Even when the available input points are reduced from
$50 %$ to $10 %$, the mean RMSE of the reconstructions remains nearly
constant (around 0.291), with only a negligible change in variance.
Noticeable degradation occurs only when the input ratio drops below
$3 %$, where the RMSE increases modestly (to about 0.31 at $0.5 %$
input). These results demonstrate that the autoencoder is capable of
faithfully recovering the dominant flow features even with extremely
sparse measurements, underscoring its resilience to data sparsity and
strong generalization ability.

#figure(image("source/Figures/cylinder_flow_FAE_ratio_comparision.png"),
  caption: [
    The reconstructed principal structures and kernel density estimates
    for RMSE on the reference sample across 100 randomly chosen meshes.
  ]
)
#label("fig:cylinder flow FAE ratio comparision")

After training the functional autoencoder, we freeze its parameters and
employ it to provide structural conditions for a conditional diffusion
model. In mask-cascade traing of the conditional diffusion model, only
$0.5 %$ of the grid points are supplied as input to the functional
autoencoder, which then reconstructs the principal flow structures
serving as guidance for the conditional diffusion model. During testing,
these reconstructed structures are combined with the sparse measurements
to enable the conditional diffusion model to recover the complete flow
fields. Representative results, shown in #ref(label("fig:Cas-Sensing cylinder flow results"))\(a), indicate that the generated
fields reproduce the ground truth with high accuracy, capturing both the
periodic vortex shedding and the influence of varying boundary
configurations.

To further probe reconstruction reliability, we select a test snapshot
and impose random masks with different sampling ratios
($0.1 % \, 0.5 % \, 1 % \, 3 %$, and $5 %$). For each ratio, 100
independent reconstructions are carried out, and the kernel density
distributions of RMSE are computed, as presented in #ref(label("fig:Cas-Sensing cylinder flow results"))\(b). The results
demonstrate a clear trend: at extremely sparse ratios such as $0.1 %$,
the reconstructions remain accurate but exhibit slightly higher
variance; as the ratio increases to $1 %$, both the mean error and
uncertainty decrease significantly, reflecting enhanced stability of the
generated fields. Beyond $3 %$, the performance saturates, with the
error approaching a lower bound and the variance remaining minimal.
Importantly, although the model is trained using only $0.5 %$
observations, it generalizes effectively to both sparser and denser
cases, consistently delivering faithful reconstructions. This robustness
is attributed to the randomization inherent in the mask-cascade
training, which exposes the model to diverse observation patterns, and
to the incorporation of manifold constraints, which enforce consistency
between generated flows and sparse inputs.

#figure([#align(center)[#image("source/Figures/cylinder_flow_CDM_0.5.png",width:83%) #linebreak() #text(size:9pt)[(a) The generated full-field reconstructions with $0.5 %$ input point ratio.
Each reconstruction is a sample from
$p \( bold(u) \| bold(y) \) approx p \( bold(d) \| hat(bold(m)) \( bold(y) \) \, bold(y) \)$.]]

  #align(center)[#image("source/Figures/cylinder_flow_CDM_ratio_comparision.png",width:83%) #linebreak() #text(size:9pt)[(b) The mean full-field reconstructions of 100 generations with different
input point ratios and corresponding kernel density estimates. The mask
is fixed at each input point ratio.]]

  ],
  caption: [
    The full-field reconstruction results of cylinder flow fields.
  ]
)
#label("fig:Cas-Sensing cylinder flow results")

== Reconstructing sea surface wave height fields with stereo data
<reconstructing-sea-surface-wave-height-fields-with-stereo-data>
In this subsection, we demonstrate the Cas-Sensing on stereo image data
of sea surface wave height ﬁelds for reconstruction from sparse
measurements, highlighting its utility in complex real-world
engineering. Stereo imaging measurement of the sea surface height is
based on single snapshots or time records captured by a pair of
synchronized and calibrated cameras. The example of stereo-image pair
process by Wave Acquisition Stereo System (WASS) is presented in #ref(label("fig:WASS example")). The data set used in this study is
Acqua Alta stereo data set including 8000 image frames, recording a half
hour sea evaluation with an imaging system installed on the north-east
side of the Acqua Alta oceanographic research tower.

#figure(image("source/Figures/WASS_example.png", width: 60.0%),
  caption: [
    An example of stereo-image pair (from the Acqua Alta tower in the
    northern Adriatic Sea, Italy) and 3-D wave field on top of the right
    image (the colorscale is proportional to the sea surface
    height)@guimaraes2020data.
  ]
)
#label("fig:WASS example")

First, we train a functional autoencoder to reconstruct the principal
structures of sea surface wave fields using 7000 image frames, with the
remaining 1000 frames held out as a test set. During masked training,
$50 %$ of the data points in each image are provided to the encoder as
input for feature extraction, while the model is trained to reconstruct
the complementary $50 %$ of the points. To evaluate the reconstruction
performance, we investigate the sensitivity of the model to different
input point ratios. Specifically, we fix an arbitrary sample from the
held-out set and generate 100 distinct masks with point ratios of
$50 % \, 10 % \, 3 % \, 1 %$, and $0.5 %$. Each masked input is then
encoded and decoded on the full grid, and kernel density estimates of
the reconstruction root mean square error (RMSE) are computed, as
presented in #ref(label("fig:sea surface FAE ratio comparision")).

From #ref(label("fig:sea surface FAE ratio comparision")), it is
evident that when the input ratio is above approximately $3 %$, the
functional autoencoder achieves highly accurate and stable
reconstructions of the principal structures, with RMSE means remaining
close to 0.40 and variances below 0.015. As the input ratio decreases
further, the reconstruction quality gradually degrades. At $1 %$ input,
for example, the mean RMSE increases to about 0.43 and the variance
nearly doubles, and at $0.5 %$ input the mean RMSE reaches approximately
0.45 with the largest spread in the error distribution. Despite this
deterioration, the reconstructions still preserve the correct
large-scale patterns of the wave field, highlighting the strong
robustness of the functional autoencoder to severe data sparsity in
capturing the dominant structures.

#figure(image("source/Figures/sea_surface_FAE_ratio_comparision.png", width: 95.0%),
  caption: [
    The reconstructed principal structures and kernel density estimates
    for RMSE on the reference sample across 100 randomly chosen meshes.
  ]
)
#label("fig:sea surface FAE ratio comparision")

When the functional autoencoder is trained and fixed, it is used to
output principal structures according to sparse measurements as
conditions to train a conditional diffusion model with the proposed
mask-cascade training strategy. The input point ratio of the fixed
functional autoencoder is set as $0.5 %$ to enhance the robustness of
conditional diffusion model to sparsity. To test the generation results,
given $0.5 %$ randomly selected observation points from each test
sample, the functional autoencoder reconstructs the corresponding
principal structures. These structures are then used as conditions to
input the conditional diffusion model while manifold constrained
gradients are incorporated into the sampling process to ensure
consistency between the generated full-field data and the observed
$0.5 %$ points. As shown in #ref(label("fig:Cas-Sensing sea surface results"))\(a),
the generated fields exhibit high fidelity to the ground truth. It is
important to note that each generated realization corresponds to a
single sample from
$p \( bold(u) \| hat(bold(m)) \( bold(y) \) \, bold(y) \)$. To
quantitatively evaluate the uncertainty of the generative model, we
further fix a test sample and generate random masks at different
observation ratios ($0.2 % \, 0.5 % \, 1 % \, 3 %$, and $5 %$). After
fixing these masks, we perform 100 independent generations, and compute
the kernel density estimates of the resulting RMSE distributions. The
results, shown in #ref(label("fig:Cas-Sensing sea surface results")), where the mean field
of generations match the ground truth very well. As the percentage of
observed points increases from $0.2 %$ to $1 %$, the mean RMSE decreases
notably, indicating improved reconstruction quality with denser
observations. In particular, the drop in both mean error and variance
around the $1 %$ input level suggests that even a relatively small
increase in observations can significantly stabilize the generation.
When the ratio is further increased to $3 %$ and $5 %$, the mean RMSE
continues to decrease slightly, approaching a lower bound, while the
variance remains at a low level since the principal structures
reconstruction results are more stable under these ratios, reflecting
both accuracy and robustness. It is worth noting that although the
conditional diffusion model is trained with $0.5 %$ input points, it
generalizes well to different input ratios and consistently delivers
satisfactory reconstructions even with only $0.2 %$ points. This can be
attributed to two factors. First, during mask-cascade training, the
conditions are generated by random sampling, which enhances the
robustness of the conditional diffusion model to diverse and sparse
conditions. Second, the manifold-constrained gradient further enforces
consistency between the generated fields and the sparse observations
while keeping the sampling trajectory on the data manifold, which
ensures reliable reconstruction of the physical fields even under
varying levels of sparsity.

#figure([#align(center)[#image("source/Figures/sea_surface_CDM_0.5.png",width:83%) #linebreak() #text(size:9pt)[(a) The generated full-field reconstructions with $0.5 %$ input point ratio.
Each reconstruction is a sample from
$p \( bold(u) \| bold(y) \) approx p \( bold(d) \| hat(bold(m)) \( bold(y) \) \, bold(y) \)$.]]

  #align(center)[#image("source/Figures/sea_surface_CDM_ratio_comparision.png",width:83%) #linebreak() #text(size:9pt)[(b) The mean full-field reconstructions of 100 generations with different
input point ratios and corresponding kernel density estimates. The mask
is fixed at each input point ratio.]]

  ],
  caption: [
    The full-field reconstruction results of sea surface wave fields.
  ]
)
#label("fig:Cas-Sensing sea surface results")

== Reconstructing global sea surface temperature fields with reanalysis data
<reconstructing-global-sea-surface-temperature-fields-with-reanalysis-data>
We also employed the daily global Sea Surface Temperature (SST)
reanalysis dataset provided by the Copernicus Marine Service
@SST_dataset to evaluate the reconstruction performance of the proposed
Cascaded Sensing method with sparse observations. We selected data
spanning three years, from June 1, 2022, to May 30, 2025. Due to the
high spatial resolution of the original dataset (4320 × 2040), the data
were first downsampled to 1440 × 640. The downsampled fields were then
evenly partitioned into 15 subregions, each with a resolution of 480 ×
128, as illustrated in #ref(label("fig:global sea surface temp example")), forming SST dataset.
For model training and evaluation, the first $80 %$ of the data were
used as the training set, and the remaining $20 %$ were reserved for
testing.

#figure(image("source/Figures/global_sea_temp_division.png", width: 80.0%),
  caption: [
    The partition of global sea surface temperature field data set.
  ]
)
#label("fig:global sea surface temp example")

We begin by training a functional autoencoder on the dataset to learn a
compact representation of the global sea surface temperature field.
During the masked training, $50 %$ of the data points in each frame are
randomly selected as inputs to the encoder, while the remaining $50 %$
are used as targets for the decoder. As illustrated in #ref(label("fig:Cas-Sensing global sea temp results"))\(a) (#emph[Condition]), the
trained functional autoencoder is capable of accurately reconstructing
the large-scale background patterns from only partial observations,
capturing the essential spatial variability of the ocean surface
temperature fields. Once the autoencoder is fully trained, it is frozen
and integrated into the Cascaded Sensing framework to provide real-time
background field reconstructions that serve as conditioning information
for the conditional diffusion model during mask-cascade training.
Specifically, a sparse subset of points ($0.5 %$) is randomly sampled at
each step during training, from which the functional autoencoder
reconstructs a smooth background field. The conditional diffusion model
then learns to refine this background and recover the full field. After
800 epochs of training, the conditional diffusion model is well-trained
to reconstruct fine-scale details based on conditions and extremely
sparse measurements.

To evaluate the model's generalization ability under more challenging
observation conditions, we randomly sample only $0.1 %$ of the data
points from the 15 predefined global subregions, a sampling ratio that
is five times lower than that used during training. A representative
reconstruction (RMSE = 0.0144) is shown in #ref(label("fig:Cas-Sensing global sea temp results"))\(a). Remarkably, as evident in
the zoomed-in views, the Cascaded Sensing framework not only
reconstructs the global background temperature field with high accuracy
but also successfully captures fine-scale turbulent structures, which
are typically difficult to recover from such sparse observations.

To systematically assess the robustness of the proposed approach, we
further conduct experiments under a range of observation ratios
($5 % \, 3 % \, 1 % \, 0.5 % \, 0.1 %$). For each ratio, sparse points
are randomly selected and fixed, and the model generates 100 samples to
characterize the reconstruction variability. The resulting mean and
standard deviation of RMSE are summarized in #ref(label("fig:Cas-Sensing global sea temp results"))\(b). As expected,
both the mean and standard deviation of RMSE increase as the observation
ratio decreases. Nevertheless, the errors remain consistently low across
all tested ratios, underscoring the robustness, stability, and
generalization capability of the cascaded sensing framework in extremely
sparse sensing scenarios.

#figure([#align(center)[#image("source/Figures/global_sea_temp_CDM_0.1.png",width:83%) #linebreak() #text(size:9pt)[(a) The generated full-field reconstructions with $0.1 %$ input point ratio.
Each reconstruction is a sample from
$p \( bold(u) \| bold(y) \) approx p \( bold(d) \| hat(bold(m)) \( bold(y) \) \, bold(y) \)$.]]

  #align(center)[#image("source/Figures/global_sea_temp_CDM_ratio_comparision.png",width:83%) #linebreak() #text(size:9pt)[(b) The mean full-field reconstructions of 100 generations with different
input point ratios and corresponding RMSE. The mask is fixed at each
input point ratio.]]

  ],
  caption: [
    The full-field reconstruction results of global sea temperature
    fields.
  ]
)
#label("fig:Cas-Sensing global sea temp results")

= Discussion
<sec:discussion>
In this study, we conduct a comprehensive evaluation of the proposed
Cascaded Sensing (Cas-Sensing) framework under a broad range of
scenarios characterized by different sensor configurations, sampling
sparsities, and geometric boundaries. Our results clearly show that the
hierarchical structure of Cas-Sensing can substantially mitigate the
ill-posedness of reconstructing multi-scale physical fields from
extremely sparse measurements. By decomposing the reconstruction process
into two stages---large-scale structure recovery via a functional
autoencoder and fine-scale detail generation through a conditional
diffusion model---the proposed method achieves accurate and stable
reconstructions with high data fidelity.

A central strength of this cascaded design lies in its ability to reduce
the reconstruction ambiguity caused by sparse and irregular inputs. By
first establishing reliable coarse-scale conditioning, the diffusion
model no longer needs to infer the entire field from incomplete
observations, but focuses on capturing the missing small-scale
structures. This hierarchical formulation enhances reconstruction
stability and reduces the variability across different sampling
patterns. Moreover, the mask-cascade training strategy significantly
improves the model's robustness and generalization, enabling it to adapt
to diverse sensor layouts without the need for retraining.

These advantages make Cas-Sensing particularly effective for scientific
applications. For example, in fluid dynamics, accurate flow field
reconstruction from sparse sensors is crucial for monitoring and
control; in climate and ocean science, reconstructing global or regional
temperature fields from sparse measurements enables more reliable
environmental assessment; and in geophysical applications, the ability
to generalize across sampling configurations supports practical
deployment in complex field settings.

Overall, Cas-Sensing provides a flexible and efficient framework for
reconstructing multi-scale fields. By leveraging hierarchical
representation learning and generative modeling, it delivers both
accuracy and robustness across a variety of reconstruction scenarios,
offering a promising pathway for advancing data-driven scientific
sensing and prediction.

= Conclusion and future work
#label("sec:conclusion and future work")
In this study, we have presented Cascade Sensing (Cas-Sensing) as an
effective framework for reconstructing full-field data from highly
sparse observations. By leveraging an autoencoder-diffusion cascade
framework, Cas-Sensing is capable of producing accurate and coherent
reconstructions even when the input measurements are extremely limited.
The mask-cascade training strategy, combined with manifold constrained
gradient, enhances the robustness of the model to diverse sparse
conditions and ensures the consistency of the reconstructed physical
fields. These results demonstrate the potential of Cas-Sensing as a
powerful tool for efficient, data-driven sensing and predictive modeling
in complex physical systems.

Nevertheless, several limitations remain in the current implementation.
Firstly, the present study focuses exclusively on two-dimensional
spatial domains, leaving the extension to higher-dimensional settings
unexplored. Scaling Cas-Sensing to three-dimensional or
higher-dimensional problems may introduce additional computational and
modeling challenges that warrant careful investigation. Secondly, the
current framework addresses only spatial reconstruction, without
explicitly modeling temporal dynamics. Consequently, the method cannot
fully capture spatiotemporal evolution in dynamic systems, which may
limit its applicability in real-time monitoring or predictive scenarios.
Thirdly, the generative component currently relies on a vanilla DDPM,
which, while effective, may impose constraints on sampling speed and
computational efficiency. Alternative generative models, such as flow
matching, could potentially accelerate sampling and further improve
reconstruction fidelity.

Future research should aim to overcome these limitations. Extending
Cas-Sensing to higher-dimensional domains would broaden its
applicability to more complex physical systems, including 3D flow fields
or volumetric sensor networks. Integrating temporal modeling within the
cascade framework could enable spatiotemporal reconstruction, capturing
dynamic evolution in addition to spatial correlations, and allowing the
framework to support real-time prediction tasks. Moreover, the adoption
of more advanced generative models could enhance sampling efficiency
without sacrificing accuracy, making Cas-Sensing more practical for
large-scale deployments. Collectively, these developments would not only
enhance the versatility and scalability of Cas-Sensing but also
reinforce its potential as a robust and reliable tool for data-driven
sensing, reconstruction, and prediction in complex physical
environments.

#bibliography("source/sn-bibliography.bib",style:"ieee")
