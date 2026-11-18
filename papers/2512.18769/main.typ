// Typst format conversion of arXiv:2512.18769v1 under CC BY 4.0.
#set page(paper: "a4", margin: 20mm, numbering: "1")
#set text(font: "Libertinus Serif", size: 10.5pt)
#set par(justify: true)
#set heading(numbering: "1.1")
#set math.equation(numbering: "(1)")
#align(center)[
  #text(size: 16pt, weight: "bold")[Source quantification by mobile gamma-ray spectrometry systems: A Bayesian approach]
  #v(5pt)
  David Breitenmoser#super[1,2], Alberto Stabilini#super[1], Malgorzata Magdalena Kasprzak#super[1], and Sabine Mayer#super[1]

  #super[1] Department of Radiation Safety and Security, Paul Scherrer Institute (PSI), Forschungsstrasse 111, Villigen PSI, AG 5232, Switzerland

  #super[2] Department of Nuclear Engineering & Radiological Sciences, University of Michigan, 2355 Bonisteel Blvd., Ann Arbor, MI 48109-2104, United States of America

  #link("mailto:david.breitenmoser@psi.ch")

  #link("https://arxiv.org/abs/2512.18769v1")[arXiv:2512.18769v1] · #link("https://creativecommons.org/licenses/by/4.0/")[CC BY 4.0]
]

*Abstract.* Accurately quantifying gamma-ray sources from mobile gamma-ray
spectrometry surveys has remained a fundamentally elusive, long-standing
inverse problem at the interface of nuclear and computational physics.
Here, we present a full‑spectrum Bayesian inference framework that
resolves this inverse problem by combining high‑fidelity,
platform‑dynamic Monte Carlo template generation with Bayesian
inversion. Applying this methodology to airborne measurements
benchmarked against laboratory and #emph[in‑situ] ground truths, we
demonstrate accurate and robust quantification of both natural and
anthropogenic radionuclides under field conditions. By improving
activity estimates by an order of magnitude, providing principled
uncertainty quantification, and rigorously accounting for
overdispersion, this framework opens the way to a more statistically
rigorous and physics-informed era of mobile gamma-ray spectrometry,
unlocking enhanced inference capabilities in emergency response,
environmental monitoring, nuclear security, and planetary exploration.

*Keywords.* Bayesian inference, Monte Carlo simulation, gamma-ray spectroscopy, radiological emergency response, Markov Chain Monte Carlo.

= Introduction
<sec:Introduction>
Mobile gamma-ray spectrometry (MGRS) has emerged as a powerful technique
for detecting and characterizing gamma-ray sources in diverse
environments. By deploying spectrometers on ground-based, airborne,
marine, and spaceborne platforms, MGRS enables rapid source
localization, identification, and quantification in a wide range of
fields, including environmental monitoring of marine ecosystems
#link(<ref-1>)[\[1\]]#link(<ref-2>)[\[2\]], mapping radioactive contamination after nuclear
accidents
#link(<ref-3>)[\[3\]]#link(<ref-4>)[\[4\]]#link(<ref-5>)[\[5\]]#link(<ref-6>)[\[6\]]#link(<ref-7>)[\[7\]], nuclear
security and nonproliferation
#link(<ref-8>)[\[8\]]#link(<ref-9>)[\[9\]]#link(<ref-10>)[\[10\]]#link(<ref-11>)[\[11\]]#link(<ref-12>)[\[12\]]#link(<ref-13>)[\[13\]],
geophysics
#link(<ref-14>)[\[14\]]#link(<ref-15>)[\[15\]]#link(<ref-16>)[\[16\]]#link(<ref-17>)[\[17\]]#link(<ref-18>)[\[18\]]#link(<ref-19>)[\[19\]]#link(<ref-20>)[\[20\]]#link(<ref-21>)[\[21\]]#link(<ref-22>)[\[22\]],
and planetary science
#link(<ref-23>)[\[23\]]#link(<ref-24>)[\[24\]]#link(<ref-25>)[\[25\]]#link(<ref-26>)[\[26\]]#link(<ref-27>)[\[27\]]#link(<ref-28>)[\[28\]]#link(<ref-29>)[\[29\]]#link(<ref-30>)[\[30\]].
More recently, the advent of unmanned mobile platforms has opened new
opportunities to deploy MGRS systems in previously inaccessible or
hazardous environments, further broadening its scope of application
#link(<ref-31>)[\[31\]]#link(<ref-32>)[\[32\]]#link(<ref-33>)[\[33\]]#link(<ref-34>)[\[34\]]#link(<ref-35>)[\[35\]].

While MGRS has shown promising source localization and identification
capabilities, quantifying gamma-ray sources has proven a much more
challenging task. In contrast to #emph[in-situ] or laboratory settings,
MGRS systems operate in a near real-time data acquisition mode with
typical sampling frequencies on the order of and source--detector
distances ranging from in terrestrial surveys to at least for spaceborne
platforms. Consequently, inferring source strengths from MGRS data
constitutes a severely ill-posed inverse problem. The combination of
low-count statistics, dynamically varying source--detector geometries,
and strong spectral correlations between different radionuclides leads
to non-uniqueness and instability in the solution space. To address this
ill-posed inverse problem, the sparse and low-count spectra
characteristic of most MGRS systems preclude the use of conventional
peak-fitting methods, which are effective only in stationary or
otherwise well-controlled source--detector settings, such as prolonged
planetary surveys
#link(<ref-24>)[\[24\]]#link(<ref-25>)[\[25\]]#link(<ref-29>)[\[29\]]#link(<ref-30>)[\[30\]]. Instead,
template-matching approaches, commonly referred to as full-spectrum
analysis (FSA), have emerged as the most viable alternative, and have
demonstrated promising results in both terrestrial
#link(<ref-36>)[\[36\]]#link(<ref-37>)[\[37\]]#link(<ref-38>)[\[38\]]#link(<ref-39>)[\[39\]]#link(<ref-40>)[\[40\]] and
spaceborne applications #link(<ref-23>)[\[23\]]#link(<ref-26>)[\[26\]]#link(<ref-28>)[\[28\]].
However, current FSA implementations remain limited by systematic biases
in the inferred source strengths and reduced sensitivity under the
low-count conditions characteristic for single-pass MGRS surveys
#link(<ref-28>)[\[28\]]#link(<ref-41>)[\[41\]]#link(<ref-42>)[\[42\]]#link(<ref-43>)[\[43\]].

We attribute these limitations of current FSA implementations to two
primary factors: inaccuracies in spectral-template generation and
limitations of the statistical models employed in the inversion. On the
template side, empirical calibration libraries are necessarily sparse,
restricted to a limited range of radionuclide sources and
source--detector configurations, and their extension to broader survey
conditions is prohibitively costly and time-consuming, often requiring
days of dedicated measurements and expensive source handling
#link(<ref-44>)[\[44\]]#link(<ref-45>)[\[45\]]#link(<ref-46>)[\[46\]]. Moreover, empirical templates are
unavoidably affected by variable background contributions, introducing
additional systematic uncertainties. Numerically generated templates, by
contrast, offer much broader flexibility but historically have relied on
oversimplified Monte Carlo models in which the mobile platforms were
either neglected entirely or represented by primitive geometries to
reduce the model complexity and computational costs
#link(<ref-47>)[\[47\]]#link(<ref-48>)[\[48\]]#link(<ref-21>)[\[21\]]#link(<ref-6>)[\[6\]]#link(<ref-42>)[\[42\]]#link(<ref-49>)[\[49\]]#link(<ref-50>)[\[50\]]#link(<ref-12>)[\[12\]]#link(<ref-13>)[\[13\]].
These approximations fail to reproduce key platform-dependent effects
such as scattering and attenuation within the platform structure,
resulting in persistent, energy-dependent template biases that can
exceed $200 thin upright(%)$ at photon energies below
$tilde.op 100 thin upright(k e V)$
#link(<ref-47>)[\[47\]]#link(<ref-50>)[\[50\]]#link(<ref-12>)[\[12\]]. Recent advances in high-fidelity
Monte Carlo modeling have demonstrated that incorporating detailed
dynamic mass models into the simulations can substantially reduce
template-related discrepancies #link(<ref-51>)[\[51\]]#link(<ref-52>)[\[52\]].

The second source of systematic error arises from the inversion
framework itself. Most existing FSA pipelines adopt frequentist
formulations based on maximum likelihood estimation (MLE) algorithms
combined with Gaussian likelihoods
#link(<ref-53>)[\[53\]]#link(<ref-36>)[\[36\]]#link(<ref-54>)[\[54\]]#link(<ref-37>)[\[37\]]#link(<ref-38>)[\[38\]]#link(<ref-55>)[\[55\]]#link(<ref-21>)[\[21\]]#link(<ref-23>)[\[23\]].
While computationally efficient, these approaches are formally
inconsistent with the sparse statistics of MGRS data and tend to produce
biased estimates and unreliable uncertainty quantification under
low-count conditions #link(<ref-56>)[\[56\]]#link(<ref-57>)[\[57\]]#link(<ref-58>)[\[58\]]. To address this
mismatch, Poisson-based MLE formulations have been proposed
#link(<ref-13>)[\[13\]]#link(<ref-10>)[\[10\]]#link(<ref-11>)[\[11\]]. These models better reflect
the discrete nature of count data, yet they remain limited in several
respects: they generally do not account for overdispersion effects that
arise from fluctuating experimental conditions inherent in MGRS surveys,
they provide no rigorous framework for uncertainty quantification, and
they are typically restricted to inferring only a small number of
sources, often requiring ad hoc regularization to stabilize solutions.
These limitations motivate the development of alternative inference
strategies that rigorously capture the underlying count statistics,
support robust inversion for an arbitrary number of sources, and provide
a principled and transparent framework for uncertainty quantification.

In this work, we introduce an alternative methodology for MGRS source
quantification that addresses the limitations of current FSA
implementations by combining high-fidelity numerical template generation
with a Bayesian inversion framework. The numerical templates leverage
detailed, dynamically updated Monte Carlo models of the measurement
platform to accurately predict spectral responses across a wide range of
source--detector configurations. Simultaneously, the Bayesian inversion
rigorously accounts for the underlying statistics of sparse MGRS data,
enabling estimation of source strengths for an arbitrary number of
radionuclides while providing a robust framework for uncertainty
quantification. We evaluate the proposed methodology on a series of
dedicated MGRS measurements benchmarked against laboratory and
#emph[in-situ] reference data, achieving accurate and reliable
quantification of both natural and anthropogenic radionuclides for
short, sparse acquisitions as well as for prolonged measurements
affected by significant overdispersion due to environmental and platform
variability. By resolving systematic template biases, properly
accounting for sparse and overdispersed count statistics, and supporting
robust inversion for multiple sources, this framework overcomes key
limitations of current FSA implementations and establishes a
generalizable approach for next-generation MGRS applications in
radiological emergency response, planetary exploration, nuclear
security, and geophysics.

= Results
<sec:Results>
== Full-spectrum Bayesian inference framework
<subsec:fsbi>
#figure(image("figures/Figure1.svg", width: 90.0%),
  caption: [
    #strong[Overview of the full-spectrum Bayesian inference framework.]
    #strong[a,]~Characteristic source--detector distances for various
    mobile platforms utilized in MGRS. #strong[b,]~Gamma-ray-matter
    interaction mechanisms and associated secondary processes.
    #strong[c,]~Characteristic spectral features in the full-spectrum
    pulse-height response to monoenergetic gamma-ray events.
    #strong[d,]~Hierarchical sequence of physical processes involved in
    MGRS. #strong[e,]~Instrument response function (IRF) and double
    differential gamma-ray flux database generation utilizing
    high-fidelity radiation transport codes
    #link(<ref-59>)[\[59\]]#link(<ref-60>)[\[60\]]#link(<ref-61>)[\[61\]]#link(<ref-62>)[\[62\]]#link(<ref-63>)[\[63\]] run on
    high-performance computing (HPC) infrastructure.
    #strong[f,]~High-fidelity spectral template generation and Bayesian
    inference on a local workstation utilizing general-purpose
    programming languages and dedicated Bayesian numerical codes
    #link(<ref-64>)[\[64\]]#link(<ref-65>)[\[65\]]#link(<ref-66>)[\[66\]]#link(<ref-67>)[\[67\]].
  ]
)
<fig:FrameworkOverview>

As illustrated in #link(<fig:FrameworkOverview>)[1], our proposed FSA
methodology combines MGRS pulse-height spectral data with
high-performance computing (HPC) based template generation in a unified
Bayesian framework. Bayesian inference offers a natural, consistent, and
transparent way of combining existing information with empirical data to
solve complex inverse problems using a solid probabilistic decision
theory framework
#link(<ref-68>)[\[68\]]#link(<ref-69>)[\[69\]]#link(<ref-70>)[\[70\]]#link(<ref-71>)[\[71\]]#link(<ref-72>)[\[72\]].
It has been successfully applied in a wide variety of fields, including
physics #link(<ref-71>)[\[71\]]#link(<ref-69>)[\[69\]]#link(<ref-73>)[\[73\]], engineering
#link(<ref-74>)[\[74\]]#link(<ref-75>)[\[75\]], earth sciences #link(<ref-76>)[\[76\]]#link(<ref-77>)[\[77\]], biology
and medicine #link(<ref-78>)[\[78\]]#link(<ref-79>)[\[79\]], machine learning
#link(<ref-80>)[\[80\]]#link(<ref-81>)[\[81\]]#link(<ref-82>)[\[82\]], and social sciences
#link(<ref-83>)[\[83\]]#link(<ref-84>)[\[84\]].

In contrast to traditional frequentist MLE approaches, Bayesian
inversion does not infer a single point solution, but rather a
probability density function over the -dimensional parameter space .
This posterior distribution is conditional on three components: the set
of observed pulse-height spectra with channels and realizations, the
known experimental conditions under which the spectra were recorded, and
the probabilistic forward model . The forward model defines the
pulse-height spectra as realizations of a random vector following a
conditional probability density . Its expectation corresponds to the
deterministic forward mapping from any admissible parameter vector to
the expected spectral response under the specified experimental
conditions .

Following the FSA approach #link(<ref-85>)[\[85\]]#link(<ref-86>)[\[86\]], we define as the
linear superposition of spectral templates , each representing the
characteristic full-spectrum response of the MGRS system to a specific
gamma-ray source---normalized by the source strength ---under given
(time-dependent) experimental conditions during the survey with
measurement live time :

$ cal(M)(bold(xi), bold(frak(d))) = integral_0^(Delta t_("live")) (bold(M)(bold(frak(d))) bold(xi) + bold(c)_"b"(bold(frak(d)))) dif t $ <eq:ForwardModelTheory>

where denotes the spectral template matrix , together with specifying
the source strength of the gamma-ray sources, and encoding the spectral
response to nuisance gamma-ray backgrounds.

Using this Bayesian FSA formalism, we compute the posterior distribution
by applying Bayes' theorem, which combines the likelihood function ,
with the prior distribution encoding all prior knowledge and physical
constraints about the solution space:

$ pi (bold(upright(theta)) divides cal(Y) \, frak(D) \, cal(F)) = frac(cal(L) (bold(upright(theta)) \; cal(Y) \, frak(D)) pi (bold(upright(theta))), integral_(cal(D)_(bold(Theta)))^() cal(L) (bold(upright(theta)) \; cal(Y) \, frak(D)) pi (bold(upright(theta))) upright(d) bold(upright(theta))) $<eq:BayesTheorem>

with the resulting posterior distribution providing a complete
probabilistic description of the solution space .

While @eq:BayesTheorem is analytically
intractable for general likelihood and prior distributions #link(<ref-70>)[\[70\]],
advances in Bayesian computation over the past decades have made
accurate numerical approximations feasible. State-of-the-art algorithms
such as Markov chain Monte Carlo (MCMC)
#link(<ref-87>)[\[87\]]#link(<ref-88>)[\[88\]]#link(<ref-89>)[\[89\]]#link(<ref-90>)[\[90\]]#link(<ref-91>)[\[91\]]
and nested sampling (NS)
#link(<ref-92>)[\[92\]]#link(<ref-93>)[\[93\]]#link(<ref-94>)[\[94\]]#link(<ref-95>)[\[95\]]#link(<ref-66>)[\[66\]]#link(<ref-96>)[\[96\]]
can now be readily employed to explore the posterior distribution even
in highly complex inverse problems. However, these methods remain
computationally demanding, often requiring forward model evaluations for
a single inference task. Consequently, the development of forward models
that can be evaluated rapidly is a key prerequisite for the practical
implementation of the proposed Bayesian FSA methodology.

Constructing a forward model that can be evaluated rapidly while
retaining predictive accuracy for the full-spectrum MGRS response under
varying experimental conditions is a computationally challenging task.
As illustrated in #link(<fig:FrameworkOverview>)[1], the spectral
response of an MGRS system arises from a hierarchical sequence of
physical processes: the emission characteristics of multiple gamma-ray
sources within the field of view, spanning distances from to \; the
interactions and propagation of the emitted gamma rays through the
environment and the mobile platform, including the generation of
secondary X-rays and annihilation photons; and the multiscale energy
conversion chain in the detector medium, transducers, and subsequent
signal wave processing. As discussed in #link(<sec:Introduction>)[1],
Monte Carlo simulations
#link(<ref-47>)[\[47\]]#link(<ref-48>)[\[48\]]#link(<ref-21>)[\[21\]]#link(<ref-6>)[\[6\]]#link(<ref-42>)[\[42\]]#link(<ref-49>)[\[49\]]#link(<ref-50>)[\[50\]]#link(<ref-12>)[\[12\]]#link(<ref-13>)[\[13\]]
utilizing high-fidelity radiation transport codes
#link(<ref-59>)[\[59\]]#link(<ref-60>)[\[60\]]#link(<ref-61>)[\[61\]]#link(<ref-62>)[\[62\]]#link(<ref-63>)[\[63\]] represent the
most established and reliable method for numerically approximating the
spectral template matrices in
@eq:ForwardModelTheory as a function
of the experimental conditions . Their main drawback, however, is
computational cost: high-fidelity simulations typically require \_= per
spectral template #link(<ref-51>)[\[51\]]. Since template generation scales
with both the number of sources and the number of unique experimental
states , brute-force Monte Carlo approaches are prohibitive even for
moderate survey sizes (, ), despite access to current HPC
infrastructure. To overcome this limitation, we propose a two-stage
template generation strategy: (i) precomputing instrument response
functions (IRFs) and double-differential gamma-ray flux banks for a set
of a priori defined experimental conditions utilizing HPC
infrastructure, and (ii) assembling spectral templates from these
precomputed components on a local workstation (see
#link(<subsec:templatemethod>)[4.1]). As demonstrated in our previous
work #link(<ref-52>)[\[52\]], this approach reduces the evaluation cost to
per template, enabling the generation of high-fidelity spectral template
matrices at practical computational expense and, in turn, providing a
viable pathway to perform full-spectrum Bayesian inference in MGRS.

== Data selection
<subsec:dataresult>
We evaluated the proposed Bayesian methodology on the Swiss Airborne
Gamma-Ray Spectrometry (SAGRS) system, a state-of-the-art airborne MGRS
platform equipped with a $tilde.op 1.7 times 10^4 thin upright(c m^3)$
NaI(Tl) spectrometer mounted in an Aérospatiale AS332M1 Super Puma
helicopter (see~#link(<subsec:sagrs>)[4.4]). The system offers both a
validated high-fidelity Monte Carlo mass model and a curated archive of
systematically collected datasets spanning more than five years in
Switzerland and abroad #link(<ref-97>)[\[97\]]#link(<ref-51>)[\[51\]], providing a
robust basis for benchmarking and validation.

Here, we focus on two specific benchmark measurements that were
performed during the exercise at the Thun military training ground
($46.753 thin upright(degree)$N, $7.596 thin upright(degree)$E) in
Switzerland on June 16, 2022 #link(<ref-98>)[\[98\]]. In these experiments, the
SAGRS system was operated in a hover flight mode for
$tilde.op 5 thin upright(m i n)$ with the helicopter positioned at a
ground clearance of $tilde.op 90 thin upright(m)$ above two separately
deployed sealed radionuclide point sources ( and ), which were
positioned on the ground and aligned with the aircraft yaw axis. The
campaign was specifically designed for reproducibility and validation.
Reference activities for the two anthropogenic sources were provided by
laboratory gamma-ray assays performed by the source manufacturer.
Natural background activity concentrations of terrestrial , , and were
constrained by #emph[in-situ] gamma-ray spectroscopy at $23$ reference
positions across the training ground #link(<ref-99>)[\[99\]].

Data reduction was performed independently for each acquisition using
the post-processing pipeline #link(<ref-51>)[\[51\]]. To investigate the
effect of data sparsity on the Bayesian inversion results, we aggregated
pulse-height spectra for three live times: $1 thin upright(s)$,
$5 thin upright(s)$, and the full acquisition
($tilde.op 5 thin upright(m i n)$). The data reduction was carried out
separately for the and measurements, yielding six independent datasets:
, , and , , , corresponding to the three live times, respectively. Each
dataset comprises the gross-count spectrum , the measurement live time ,
and the experimental condition vector that encodes platform and
environmental states relevant to forward modeling: helicopter position
and orientation (pose), fuel level, and ambient conditions (air
temperature, pressure, humidity). Given the steady-state
source--detector configuration, we assume constant mean experimental
conditions within each acquisition, while intrinsic variability in these
conditions is captured through the overdispersion parameterization
described in the following section. Helicopter states were retrieved
from onboard auxiliary sensors. Meteorological parameters were taken
from the MeteoSwiss automatic weather station on the Thun training
ground (WIGOS-ID: 0-20000-0-06731). A complete listing of live times and
retrieved experimental-condition values is provided in Supplementary
Table~S1. Further details on the measurement setup, acquisition, and
data processing are available in .

== Forward modeling
<subsec:forwardresult>
Following the outlined Bayesian inference framework in
#link(<subsec:fsbi>)[2.1], we model the expected events in the
pulse-height response of the SAGRS spectrometer as the linear
superposition of spectral templates corresponding to the gamma-ray
emitters present: the anthropogenic and sources, and the naturally
occurring terrestrial radionuclides , , and with their progeny.

To reduce template bias in our inference, we generated the spectral
templates from high-fidelity IRFs and double-differential flux banks,
conditioned on the full experimental context, i.e., platform pose,
environmental parameters, etc. (see
#link(<subsec:templatemethod>)[4.1]). We generated the IRFs and flux
banks through large-scale coupled photon--electron--positron Monte Carlo
simulations using the validated SAGRS mass model #link(<ref-51>)[\[51\]] and
the code (v4-2.2) #link(<ref-100>)[\[100\]]#link(<ref-101>)[\[101\]]#link(<ref-62>)[\[62\]] combined with
the graphical interface #link(<ref-102>)[\[102\]] on HPC infrastructure (see
@subsec:irfmethod, @subsec:fluxmethod).
A complete listing of all considered experimental-condition values in
these simulations are provided in Supplementary Table~S1.

Residual intrinsic, cosmic-ray, and atmospheric radon progeny
backgrounds were treated as nuisance sources. We estimated their
combined spectral contribution in
@eq:ForwardModelTheory empirically
from independent background flights over Lake Thun at orthometric
heights matched to the hover measurements (see Supplementary Fig.~S1).
Because these flights were conducted within and less than
$1 thin upright(h)$ of the experiments, we considered them
representative of the intrinsic and cosmic background at the training
site. To account for spatiotemporal variability in radon progeny
concentrations, we included an additional variable radon source term and
inferred it jointly with the other source strengths in the Bayesian
analysis (see #link(<subsec:fluxmethod>)[4.3]).

We embed our deterministic forward model into a probabilistic negative
binomial model , which generalizes Poisson statistics by relaxing the
variance constraint to with being the dispersion parameter associated
with the probabilistic model (see #link(<subsec:bayesmethod>)[4.5]).
Overdispersion arises because experimental conditions typically
fluctuate during the measurement, introducing additional variability in
the data and resulting in significant biases if unaccounted for
#link(<ref-103>)[\[103\]]#link(<ref-104>)[\[104\]]#link(<ref-105>)[\[105\]]. Similar to the radon source
term, we infer the dispersion parameter jointly with the other source
strengths to avoid biased estimates. The resulting inverse problems are
six-dimensional, with parameter vectors for the related datasets and for
the related datasets.

== Bayesian inversion
<subsec:bayesresult>
#figure(image("figures/Figure2.svg", width: 98.0%),
  caption: [
    #strong[Posterior predictive distribution results.] Prior and
    posterior predictive distributions are shown alongside the measured
    pulse-height spectra for two measurement configurations:
    #strong[a,]~Hover flight above an anthropogenic source.
    #strong[b,]~Hover flight above an anthropogenic source. Results are
    displayed for all six datasets acquired from these measurements with
    variable live times of $1 thin upright(s)$ (#strong[c,]~,
    #strong[d,]~), $5 thin upright(s)$ (#strong[e,]~, #strong[f,]~), and
    the full acquisition $tilde.op 5 thin upright(m i n)$ (#strong[g,]~,
    #strong[h,]~). Uncertainties in the measured pulse-height spectra
    are shown as 1 standard error (SE) error bars. Posterior predictive
    distributions are accompanied by point predictions based on the
    posterior median estimates. Spectral signatures scaled by the
    posterior median source strengths and measurement live time are also
    indicated for all sources included in the forward model, namely the
    anthropogenic and sources; the three natural terrestrial
    radionuclides , , and \; and the absolute radon source term
    (partially visible in #strong[c] and #strong[e]). For better
    interpretability, all spectral quantities were corrected for
    nuisance backgrounds described in
    #link(<subsec:forwardresult>)[2.3].
  ]
)
<fig:PostPred>

#figure(image("figures/Figure3.svg", width: 100.0%),
  caption: [
    #strong[Posterior distribution results.] Posterior distributions are
    shown for two measurement configurations: #strong[a,]~Hover flight
    above an anthropogenic source. #strong[b,]~Hover flight above an
    anthropogenic source. Results are displayed for all six datasets
    acquired from these measurements with live times of
    $1 thin upright(s)$ (, ), $5 thin upright(s)$ (, ), and
    $tilde.op 5 thin upright(m i n)$ (, ). Each subfigure shows
    posterior distributions for the related model parameters: source
    activities of the anthropogenic and point sources (, ); activity
    mass concentrations of the three natural terrestrial radionuclides ,
    , and (, , ); activity volume concentration of the radon source term
    (), as well as the dispersion parameter of the negative binomial
    distribution (). Off-diagonal panels depict bivariate posterior
    marginals with $68 thin upright(%)$ and $99 thin upright(%)$
    probability contours, while diagonal panels show the corresponding
    univariate marginals. Gray-shaded regions indicate #emph[in-situ]
    gamma-ray spectroscopy constraints on terrestrial radionuclide
    activity concentrations, and black dashed lines mark best-estimate
    laboratory gamma-ray assay activities for the two anthropogenic
    sources.
  ]
)
<fig:CornerPlot>

We solve the inverse problems for each of the six datasets retrieved in
#link(<subsec:dataresult>)[2.2] independently, using the Bayesian
inversion framework outlined in #link(<subsec:fsbi>)[2.1]. Specifically,
we sample the posterior distribution via Bayes' theorem in
@eq:BayesTheorem using an affine-invariant
ensemble MCMC algorithm #link(<ref-91>)[\[91\]] (see
#link(<subsec:bayesmethod>)[4.5]). We present the results from these
Bayesian computations as posterior predictive distributions in
#link(<fig:PostPred>)[2] alongside univariate and bivariate marginal
posterior distributions shown in #link(<fig:CornerPlot>)[3]. In
addition, a comprehensive summary of posterior point and dispersion
estimates for all six datasets is provided in Supplementary Tables~S3
and S4 in the Supplementary Information File for this study.

In #link(<fig:PostPred>)[2], we find that the posterior predictive
distributions align closely with the measured pulse-height spectra
across all datasets. As expected for an identifiable probabilistic
model, the dispersion of the posterior predictive distributions
decreases substantially relative to the prior predictive ones,
reflecting the information gained from the acquired data. This effect is
most pronounced for the high-count datasets and . For the shorter
acquisitions (, , , ), increased data sparsity results in a weaker
reduction in dispersion, particularly at higher spectral energies. These
trends are corroborated by the posterior distributions in
#link(<fig:CornerPlot>)[3], which show a corresponding narrowing of
credible regions with increasing measurement live time.

While the absolute dispersion in the measured pulse-height spectra shown
in #link(<fig:PostPred>)[2] decreases with increasing measurement time,
the event-by-event statistical variance relative to the mean in the
posterior predictive distributions exhibits an opposite trend.
Quantitatively, we observe statistically significant elevations in the
dispersion parameter in #link(<fig:CornerPlot>)[3] for the
$5 thin upright(m i n)$ datasets compared to the shorter
$1 thin upright(s)$ and $5 thin upright(s)$ datasets. Specifically, we
retrieve posterior median dispersion parameters for and for
($95 thin upright(%)$ central credible interval bounds). By contrast,
the shorter-duration datasets show substantially lower overdispersion,
for \[,\] and for \[,\], consistent with near-Poisson statistics. These
results highlight a clear temporal dependence of overdispersion in our
measurements. We interpret the elevated overdispersion at longer
sampling times as a manifestation of systematic variability in the
experimental conditions that accumulate over time. Potential
contributors include slow drifts in the detector pose due to
wind-induced motion of the aircraft platform, temporal changes in
environmental variables, and other subtle experimental dynamics that are
negligible on shorter timescales but become significant over several
minutes.

In #link(<fig:PostPred>)[2], we also display the spectral templates of
all sources considered in the forward model, scaled by the posterior
median source strengths and the measurement live times. These scaled
templates represent the absolute contributions of the individual sources
to the predicted pulse-height spectra. Consistent with the photon
emission yields, we observe that the anthropogenic sources and dominate
the low-energy range, while the natural terrestrial radionuclides , ,
and dominate at higher energies. The radon source term does not
significantly contribute to the predicted spectra across all datasets.
This observation is corroborated by the posterior results in
#link(<fig:CornerPlot>)[3], which indicate statistically insignificant
activity volume concentrations for the radon term. Together, these
results confirm that no significant spatiotemporal variations in the
radon background occurred between the background and hover flights,
supporting the robustness and reliability of the nuisance background
correction.

== Inferring natural and anthropogenic radionuclide activities
<subsec:activityresult>
We next evaluate the performance of the Bayesian inversion framework in
terms of both precision and accuracy of the inferred radionuclide
activities, based on the posterior distributions shown in
#link(<fig:CornerPlot>)[3]. Precision is assessed directly from the
dispersion of the posterior distributions, whereas accuracy is
quantified by comparison with independent reference activities derived
from laboratory and #emph[in-situ] gamma-ray assays (see
#link(<subsec:dataresult>)[2.2]).

As expected for measurements governed by negative binomial counting
statistics, the precision of the posterior estimates for both
anthropogenic and natural radionuclide activities generally improves
with increasing measurement time. This trend is reflected in the
systematic narrowing of the univariate and bivariate posterior marginals
shown in #link(<fig:CornerPlot>)[3], as well as in the overall reduction
of credible interval widths reported in Supplementary Tables~S3--S4. The
observed gain in precision reflects the increased information content of
longer acquisitions, even in the presence of overdispersion. Notably,
this improvement is not strictly monotonic for all parameters, as
elevated overdispersion at longer sampling times can partially offset
statistical gains for high-count components. In contrast, the two
nuisance parameters, and , exhibit posterior dispersions that are
largely invariant with respect to measurement time. This behavior
indicates intrinsic limits on the information gain for these parameters
under the given measurement configurations, consistent with their weak
identifiability from the available spectral features.

We assess the accuracy of the inferred activities of the anthropogenic
sources and by comparing the posterior median activities with
independently measured reference activities obtained from laboratory
gamma-ray assays. As shown in #link(<fig:CornerPlot>)[3], the posterior
predictions for the low-count datasets (, , , and ) exhibit excellent
agreement with the reference values, with relative deviations below .
For the high-count datasets (, ), the relative deviations increase
modestly to $tilde.op 5 thin upright(%)$. This trend is consistent with
the elevated overdispersion observed for longer measurement times, as
discussed above, which introduces additional variability beyond the
Poisson variance limit. Importantly, all deviations remain statistically
insignificant within the corresponding credible intervals, demonstrating
that the proposed Bayesian framework remains accurate even in the
presence of increased overdispersion.

Assessing the accuracy of the inferred activities for the terrestrial
primordial radionuclides , , and is inherently more challenging, owing
to the substantially larger statistical and systematic uncertainties
associated with both the posterior estimates and the reference
activities obtained from #emph[in-situ] gamma-ray spectroscopy. These
uncertainties arise primarily from spatial heterogeneity in the natural
radionuclide distribution and limited counting statistics at higher
spectral energies. Nevertheless, for all six datasets, the posterior
activity estimates are statistically consistent with the corresponding
reference values as well as with each other within their combined
uncertainty ranges. This consistency confirms the robustness of the
proposed Bayesian framework for quantifying natural background
radionuclides under realistic field conditions, despite the reduced
accuracy that is fundamentally imposed by the available reference
information.

= Discussion
<sec:discussion>
In this work, we have established a full-spectrum Bayesian inference
framework that fundamentally advances the quantification of gamma-ray
sources in MGRS. By unifying high-fidelity, physics-based numerical
template generation with a probabilistically consistent inversion
protocol, the proposed methodology directly addresses the two dominant
sources of systematic bias identified in current FSA pipelines:
inaccurate spectral templates and statistically inconsistent inference
under sparse and heterogeneous counting conditions. The resulting
framework enables accurate and precise radionuclide quantification from
limited acquisition times, while providing robust uncertainty
quantification that remains valid across regimes ranging from
near-Poisson to pronounced overdispersed statistics.

A central outcome of this study is the demonstrated improvement in
quantification accuracy under realistic MGRS conditions. For short
acquisitions on the order of seconds---representative of single-pass
surveys---the Bayesian inversion achieves agreement with independent
laboratory reference activities at the percent level, representing an
order-of-magnitude improvement over previously reported FSA-based
approaches operating under comparable conditions
#link(<ref-41>)[\[41\]]#link(<ref-42>)[\[42\]]#link(<ref-43>)[\[43\]]. This gain is not achieved
through aggressive regularization or ad hoc constraints, but instead
emerges naturally from the combination of physically accurate forward
modeling and a likelihood formulation that faithfully reflects the
discrete and overdispersed nature of the data. Equally important, the
framework delivers robust posterior uncertainties, enabling principled
interpretation of inferred activities even in the low-count regime,
where conventional methods tend to underestimate uncertainty or yield
unstable solutions.

Beyond improved accuracy, the explicit treatment of overdispersion
constitutes a key conceptual and practical advance for MGRS. While
Poisson-based models implicitly assume static experimental conditions
#link(<ref-13>)[\[13\]]#link(<ref-10>)[\[10\]]#link(<ref-11>)[\[11\]], real-world mobile surveys are
unavoidably affected by time-dependent variability in platform pose,
environmental conditions, and background contributions. The
statistically significant increase in inferred overdispersion for longer
acquisitions observed in this work provides direct empirical evidence
that these effects accumulate over time and significantly influence the
count statistics. Importantly, the Bayesian framework allows this
variability to be inferred jointly as a nuisance parameter, rather than
being neglected through an implicit Poisson assumption and consequently
leading to biased source-strength estimates. Because these results were
obtained under controlled hover-flight conditions with a fixed
source--detector geometry, chosen specifically for reproducibility and
validation, the inferred overdispersion levels represent a conservative
lower bound. In operational surveys involving dynamic flight paths,
heterogeneous terrain, and continuously evolving source--detector
configurations, substantially stronger deviations from Poisson
statistics are therefore expected. These findings have direct
implications for radiological emergency response, environmental
monitoring, and nuclear security applications, where biased activity
estimates or underestimated uncertainties can lead to incorrect
situational assessments. The ability to infer and propagate
overdispersion in a principled way is thus a defining advantage of the
Bayesian approach in this context.

Building on the results presented here, a number of natural extensions
and future directions emerge. First, this work focused on source
quantification under a fixed source-identification hypothesis. While
this reflects the current operational use of FSA in many MGRS
applications, the Bayesian formulation adopted here is fully compatible
with model comparison and hypothesis testing. In particular, integrating
MCMC-based evidence estimators #link(<ref-106>)[\[106\]]#link(<ref-107>)[\[107\]]#link(<ref-108>)[\[108\]]
or nested sampling algorithms
#link(<ref-92>)[\[92\]]#link(<ref-93>)[\[93\]]#link(<ref-94>)[\[94\]]#link(<ref-95>)[\[95\]]#link(<ref-66>)[\[66\]]#link(<ref-96>)[\[96\]]
in the inference pipeline would enable the Bayesian evidence of
competing source-composition models to be evaluated and ranked
probabilistically. This extension would allow rigorous source
identification and discrimination to be performed within the same
computational framework used for quantification, eliminating the need
for ad hoc decision criteria. Similar evidence-based Bayesian approaches
have proven transformative in other inference-driven domains, ranging
from cosmology #link(<ref-109>)[\[109\]]#link(<ref-110>)[\[110\]]#link(<ref-111>)[\[111\]] to exoplanet research
#link(<ref-112>)[\[112\]]#link(<ref-113>)[\[113\]], and offer a clear pathway toward unified
identification and quantification in MGRS.

Second, our validation focused on terrestrial anthropogenic point
sources and natural terrestrial primordial radionuclides distributed in
the soil. However, the numerical template-generation strategy introduced
here is inherently general. By leveraging high-fidelity Monte Carlo mass
models, the framework can accommodate arbitrary gamma-ray source classes
and geometries. This includes extended terrestrial anthropogenic
sources, atmospheric radon progeny, secondary cosmic-ray--induced
emissions, and trace anthropogenic radionuclides in gaseous or aerosol
form, among others. As a result, the methodology is directly applicable
to a broad spectrum of MGRS scenarios, ranging from airborne
environmental surveys and maritime monitoring to planetary surface and
orbital missions, without conceptual modification of the inference
protocol.

Taken together, these results demonstrate that full-spectrum Bayesian
inference, when coupled with physically faithful forward models,
overcomes long-standing limitations of MGRS quantification under sparse,
heterogeneous, and dynamically evolving measurement conditions. By
delivering accurate activity estimates, robust uncertainty
quantification, and a principled treatment of overdispersion, this
approach provides the methodological and computational foundation for a
new generation of MGRS analysis pipelines. Building on this foundation,
the framework opens the way to a more statistically rigorous and
physics-informed era of mobile gamma-ray spectrometry, enabling reliable
decision-making in radiological emergency response, environmental
monitoring, nuclear security, and planetary exploration.

= Methods
<sec:methods>
== Spectral template computation
<subsec:templatemethod>
To overcome the prohibitive computational cost of a single-stage
brute-force Monte Carlo approach discussed in #link(<subsec:fsbi>)[2.1],
we adopt a two-stage template generation strategy. As demonstrated in
our previous work #link(<ref-52>)[\[52\]], this method reduces the evaluation
cost to per template, enabling the rapid generation of high-fidelity
spectral template matrices . For completeness, we summarize the main
elements of this strategy across this and the following two subsections,
with additional details available in .

The spectral response of an MGRS system is determined by the convolution
of the differential instrument response function with the incident
source-strength-normalized double-differential gamma-ray field

$ frac(upright(d) psi, upright(d) E') (E' \, t) = & integral_0^oo integral_0^(4 pi) frac(upright(d) R, upright(d) E') (E' \, E_gamma \, bold(upright(Omega))' \, frak(d))\
 & times frac(partial^2 phi.alt_gamma, partial E_gamma partial 𝛺') (E_gamma \, bold(upright(Omega))' \, frak(d)) upright(d) 𝛺' thin upright(d) E_gamma $<eq:IRF>

with , , , and denoting the spectral energy related to the pulse-height
in the gamma-ray spectrometer, the energy of the incident gamma ray, the
solid angle as well as direction unit vector in the local non-inertial
platform-fixed coordinate system, respectively. For computational
evaluation, the integral in @eq:IRF is discretized
over spectral energy and direction, allowing us to recast
@eq:IRF in matrix notation as

$ bold(upright(psi)) (frak(d)) approx sum_(k = 1)^(N_(bold(upright(Omega))')) bold(upright(R)) (bold(upright(Omega))'_k \, frak(d)) bold(upright(phi.alt))_gamma (bold(upright(Omega))'_k \, frak(d)) $<eq:IRFm>

where denotes the spectral template vector introduced in
#link(<subsec:fsbi>)[2.1], the instrument response matrix, and the
gamma-ray flux vector. The individual elements of the instrument
response matrix are estimated by scaling the differential instrument
response components with the corresponding spectral energy bin width,
i.e., . Similarly, we compute the individual elements of the gamma-ray
flux vector by scaling the double-differential gamma-ray flux components
with the corresponding energy and solid angle bin widths, i.e., .

To compute the spectral templates as defined in
@eq:IRFm, we implemented the convolution using the
routine in (Version ), which enables efficient multithreaded evaluation
of the directional matrix--vector products. Prior to convolution, the
IRF and flux banks must be interpolated onto a common discretization
scheme. Spectral alignment is achieved by interpolating the IRF onto the
regular energy grid of the gamma-ray flux simulation #link(<ref-114>)[\[114\]], while
angular alignment is handled by azimuthal expansion in
$30 thin upright(degree)$ steps followed by mapping to the local
platform-fixed frame using Tait--Bryan rotations, that define the
platform's instantaneous attitude relative to the global frame. The
aligned quantities are then convolved to produce the spectral templates,
with statistical and systematic uncertainties propagated through the
pipeline. On a standard workstation (8 cores,
$2.1 thin upright(G H z)$), the total runtime for template generation
including uncertainty estimation is per template. In the next
subsections, we detail the generation of both the instrument response
matrix as well as the gamma-ray flux vector banks for the benchmark
study discussed in
@subsec:forwardresult, @subsec:dataresult, @subsec:bayesresult, @subsec:activityresult.

== Instrument response function
<subsec:irfmethod>
The instrument response matrices were estimated using high-fidelity
Monte Carlo radiation transport simulations of the well validated SAGRS
mass model #link(<ref-51>)[\[51\]]. Following established practices for
spaceborne gamma-ray spectrometers
#link(<ref-23>)[\[23\]]#link(<ref-25>)[\[25\]]#link(<ref-27>)[\[27\]]#link(<ref-26>)[\[26\]], we
illuminated the system with circular monoenergetic plane waves over a
grid of gamma-ray energies and incident directions in the platform-fixed
coordinate system. The IRF elements were derived as the normalized
spectral counts in each pulse-height channel, with source radii chosen
to ensure invariance of the response (see ). The simulation grid spanned
$30$ energies between $50 thin upright(k e V)$ and
$3 thin upright(M e V)$ combined with $134$ incident directions,
yielding $4020$ runs. To account for temporal variability of the
platform, we generated IRFs for eight distinct mass-model states defined
by fuel load, crew occupancy, and landing gear position, including those
states encountered during the survey described in
#link(<subsec:dataresult>)[2.2]. Each simulation tracked $1 times 10^7$
primary histories using (v4-2.2)
#link(<ref-100>)[\[100\]]#link(<ref-101>)[\[101\]]#link(<ref-62>)[\[62\]] with the physics settings,
providing coupled photon-electron-positron transport, secondary particle
production, and X-ray fluorescence. To reproduce the nonproportional
scintillation response of the SAGRS system, a dedicated scintillation
model calibrated in prior work #link(<ref-115>)[\[115\]]#link(<ref-51>)[\[51\]] was
implemented through and . Motivated by the range of the transported
particles, transport thresholds were set to $1 thin upright(k e V)$ in
the detector volume and $10 thin upright(k e V)$ elsewhere. Energy
deposition events were recorded per crystal using custom routines and
reduced to expected pulse-height spectra with the pipeline
#link(<ref-51>)[\[51\]]. Due to the substantial computational cost of these
Monte Carlo simulations, we employed high-performance computing
infrastructure available at the Paul Scherrer Institute
($2.6 thin upright(G H z)$ nominal clock speed). Generating the complete
set of IRFs required
$tilde.op 5.5 times 10^4 thin upright(c o r e - h)$.

== Gamma-ray flux bank
<subsec:fluxmethod>
We generated double-differential gamma-ray flux banks for all sources
included in the forward models (see #link(<subsec:forwardresult>)[2.3])
using the code (v4-2.2) #link(<ref-100>)[\[100\]]#link(<ref-101>)[\[101\]]#link(<ref-62>)[\[62\]] on HPC
infrastructure. Specifically, we adopted the built-in method to score
the double-differential flux with a bin width of
$0.5 thin upright(k e V)$ for the gamma-ray energy and
$5 thin upright(degree)$ for the polar angle in a global inertial
coordinate system (exploiting azimuthal invariance). Similar to the IRF
generation, we adopted the physics settings with a
$10 thin upright(k e V)$ transport threshold. The accumulated
computation time was $tilde.op 1 times 10^2 thin upright(c o r e - h)$
per source, with $2 times 10^9$ primaries distributed across
$1 times 10^2$ independent runs.

For all flux simulations, we adopted a dynamic environmental mass model
with three main mass elements, i.e., the atmosphere, the terrestrial
soil, as well as paved surfaces present at the training ground. These
components were modeled as homogeneous media with compositional data
sourced from . The atmosphere was modeled for each measurement
separately as homogeneous humid air as a function of the recorded air
temperature, pressure, and humidity (see Supplementary Table~S1).
Motivated by the mean free path of the primary photons in air,
atmospheric boundaries were confined to a $3 thin upright(k m)$ radius
sphere, centered at the SAGRS location. The ground was limited to a
vertical extension of $10 thin upright(m)$. In addition to the
environmental media, we included also detailed mass models of the
deployed radionuclide sources and custom source holders (see ).

Radionuclide emissions were simulated with the module in semi-analogue
mode, according to related decay schemes. Anthropogenic source volumes
were explicitly modeled, with source strengths and parameterized by the
absolute source activity in . For the natural terrestrial radionuclides
(, , ), we assumed secular equilibrium with progeny and a spatially
uniform distribution within the soil. Corresponding source strengths (,
, ) were parameterized by the activity mass concentration in .
Similarly, the atmospheric radon source term discussed in
#link(<subsec:forwardresult>)[2.3] was implemented as a homogeneous
atmospheric volume source in secular equilibrium with its progeny up to
but excluding , and with the source strength expressed as activity
volume concentration in .

== Swiss Airborne Gamma-Ray Spectrometry System
<subsec:sagrs>
The Swiss Airborne Gamma-Ray Spectrometry (SAGRS) system is a
helicopter-borne MGRS platform jointly operated by the National
Emergency Operations Centre (NEOC), the Nuclear Biological Chemical
defence and Explosive Ordnance Disposal Centre of Excellence (NBC-EOD),
and the Swiss Air Force for environmental surveys and emergency
response. The system is fully deployable and airborne within four hours,
enabling rapid and flexible operations under a wide range of survey and
emergency scenarios. A brief technical summary is provided below.
Comprehensive specifications and validation studies are reported in .

The detector assembly consists of four prismatic NaI(Tl) scintillation
crystals (Saint-Gobain 4×4H16/3.5-X), each measuring . The crystals are
individually enclosed in aluminum housings, optically coupled to
Hamamatsu R10755 photomultiplier tubes, and equipped with dedicated
readout electronics. They are embedded in thermally insulating,
vibration-damping polyethylene foam and mounted in a rugged aluminum box
(outer dimensions ). The unit is installed in the cargo bay of an
Aérospatiale AS332M1 Super Puma helicopter, aligned with the fuselage
underside to maximize sensitivity to terrestrial radiation. System
integration includes avionics via an ARINC 429 bus. Recorded parameters
comprise global navigation satellite system position, radar altitude,
helicopter orientation, and fuel state. These auxiliary measurements are
synchronized with the spectrometer data and serve as input to the
forward model.

Spectral acquisition is performed in bin mode at $1 thin upright(H z)$,
with individual spectra recorded for each of the four scintillator
assemblies, alongside a combined sum spectrum representing the
aggregated detector response. Each spectrum comprises $1024$ channels
spanning $tilde.op 30 thin upright(k e V)$ to
$tilde.op 3.072 thin upright(M e V)$. The readout electronics provide
automatic gain stabilization, linearization with offset correction, and
live-time tracking. Survey operations are controlled via two onboard
operator stations interfaced to a central data server, with the full
system, including support hardware, having a total mass of
$tilde.op 290 thin upright(k g)$.

== Bayesian computation
<subsec:bayesmethod>
Following the Bayesian framework outlined in #link(<subsec:fsbi>)[2.1],
we adopt a negative binomial probabilistic forward model to describe the
observed counts in the set of recorded pulse-height spectra , accounting
for both measurement uncertainty and overdispersion arising from the
experimental process (see #link(<subsec:forwardresult>)[2.3]). The
associated likelihood in @eq:BayesTheorem
is formulated using a parameterization established in prior studies
#link(<ref-103>)[\[103\]]#link(<ref-104>)[\[104\]]#link(<ref-117>)[\[117\]], with the dispersion
parameter governing overdispersion in the observed counts:

$ cal(L) (bold(upright(theta)) \; cal(Y) \, frak(D)) = product_(k = 1)^(N_(cal(Y))) product_(j = 1)^(N_y) frac(Gamma \( C_(k \, j) + 1 / alpha_(upright(N B)) \), Gamma \( 1 / alpha_(upright(N B)) \) Gamma \( C_(k \, j) + 1 \)) (frac(1, 1 + alpha_(upright(N B)) cal(M) \( bold(upright(xi)) \, bold(upright(frak(d)))_k \)))^(1 / alpha_(upright(N B))) (frac(1, 1 + \[ alpha_(upright(N B)) cal(M) \( bold(upright(xi)) \, bold(upright(frak(d)))_k \) \]^(- 1)))^(C_(k \, j)) . $<eq:likeli>

Here, denotes the gamma function and the deterministic forward operator
introduced in @eq:ForwardModelTheory,
mapping source strengths and experimental conditions to expected counts.
The observed counts correspond to pulse-height channel in spectrum . In
this work, each inverse problem outlined in
#link(<subsec:forwardresult>)[2.3] is solved independently. Thus, the
spectral dataset and associated condition set reduce to mutually
exclusive singletons (). This formulation enables rigorous Bayesian
inference over , capturing both measurement uncertainty and
overdispersion in the observed data. It is worth adding that, because
the gamma function terms in @eq:likeli grow
rapidly for moderately large arguments, special care is required when
numerically evaluating the likelihood. To avoid under- or overflow, it
is advisable to operate with the logarithm of the likelihood function,
known as the log-likelihood, instead of directly evaluating
@eq:likeli:

$ log cal(L) (bold(upright(theta)) \; cal(Y) \, frak(D)) & = sum_(k = 1)^(N_(cal(Y))) sum_(j = 1)^(N_y) log Gamma \( C_(k \, j) + 1 / alpha_(upright(N B)) \) - log Gamma \( 1 / alpha_(upright(N B)) \)\
 & - log Gamma \( C_(k \, j) + 1 \) - 1 / alpha_(upright(N B)) log (1 + alpha_(upright(N B)) cal(M) \( bold(upright(xi)) \, bold(upright(frak(d)))_k \))\
 & - C_(k \, j) log (1 + frac(1, alpha_(upright(N B)) cal(M) \( bold(upright(xi)) \, bold(upright(frak(d)))_k \))) $<eq:loglikeli>

with numerically stable implementations of the log-gamma function being
readily available in all major scientific computing environments,
including , , and .

The likelihood specification in @eq:likeli forms
the first element of the Bayesian framework. Completing the posterior
model in @eq:BayesTheorem requires
assigning suitable priors to the model parameters . To avoid overly
restrictive assumptions on these prior distributions, we adopted weakly
informative, statistically independent marginal priors
$pi(bold(theta)) colon.eq product_(i=1)^(N_xi+1) pi(theta_i)$
for all model parameters , with the marginal priors defined based on the
principle of maximum entropy #link(<ref-118>)[\[118\]]. A full list of all marginal
prior distributions is provided in Supplementary Table~S2.

All Bayesian computations were performed with the code #link(<ref-64>)[\[64\]]
using an affine invariant ensemble MCMC algorithm #link(<ref-91>)[\[91\]] to sample
the posterior distribution in
@eq:BayesTheorem via Bayes' theorem. The
MCMC algorithm was executed with $24$ parallel chains, each running
$5 times 10^3$ iterations. The burn-in phase was set to
$20 thin upright(%)$ resulting in a total of $9.6 times 10^4$ posterior
samples. The convergence and precision of the MCMC simulations were
carefully assessed using standard diagnostics tools
#link(<ref-119>)[\[119\]]#link(<ref-70>)[\[70\]], showing a potential scale reduction factor and
effective sample size across all MCMC runs. Additional trace and
convergence plots for the individual parameters and point estimators
(Supplementary Figs.~S2--S6) alongside a full list of the Bayesian
inversion results (Supplementary Tables~S3 and S4) can be found in the
Supplementary Information File for this study.

All experimental data presented herein have been deposited in the Zenodo
repository under accession code
#link("https://doi.org/10.5281/zenodo.18004441") #link(<ref-120>)[\[120\]].

The code #link(<ref-62>)[\[62\]] used for Monte Carlo radiation transport and
detector response simulations is available at
#link("https://fluka.cern/"). We adopted the graphical user interphase
#link(<ref-102>)[\[102\]], available at
#link("https://flair.web.cern.ch/flair/"), to setup the input files and
create the mass model figures. The custom user routines adopted in the
Monte Carlo simulations have been deposited on the ETH Research
Collection repository under accession code
#link("https://doi.org/10.3929/ethz-b-000595727") #link(<ref-121>)[\[121\]].
Data processing, Bayesian inference computation and figure creation was
performed by the #raw("MATLAB")
code in combination with the open-source toolbox #link(<ref-64>)[\[64\]] available
at #link("https://www.uqlab.com/").

= References

#block[\[1\] Jones, D.~G. Development and application of marine gamma-ray
measurements: A review. #emph[J. Environ. Radioact.] #strong[53],
313--333 (2001).] <ref-1>

#block[\[2\] Lee, M.~S. #emph[et~al.] Real-time wireless marine radioactivity
monitoring system using a SiPM-based mobile gamma spectroscopy mounted
on an unmanned marine vehicle. #emph[Nucl. Eng. Technol.] #strong[55],
2158--2165 (2023).] <ref-2>

#block[\[3\] Rosenthal, J.~J., de Almeidat, C.~E. & Mendonca, A.~H. The Radiological
Accident in Goiania. #emph[Health Phys.] #strong[60], 7--15 (1991).] <ref-3>

#block[\[4\] Drovnikov, V.~V., Egorov, N.~Y., Kovalenko, V.~V., Serboulov, Y.~A. &
Zadorozhny, Y.~A. Some results of the airborne high energy resolution
gamma-spectrometry application for the research of the USSR European
territory radioactive contamination in 1986 caused by the Chernobyl
accident. #emph[J. Environ. Radioact.] #strong[37], 223--234 (1997).] <ref-4>

#block[\[5\] Lyons, C. & Colton, D. Aerial Measuring System in Japan. #emph[Health
Phys.] #strong[102], 509 (2012).] <ref-5>

#block[\[6\] Torii, T., Sugita, T., Okada, C.~E., Reed, M.~S. & Blumenthal, D.~J.
Enhanced Analysis Methods to Derive the Spatial Distribution of 131I
Deposition on the Ground by Airborne Surveys at an Early Stage after the
Fukushima Daiichi Nuclear Power Plant Accident. #emph[Health Phys.]
#strong[105], 192--200 (2013).] <ref-6>

#block[\[7\] Sanada, Y., Sugita, T., Nishizawa, Y., Kondo, A. & Torii, T. The aerial
radiation monitoring in Japan after the Fukushima Daiichi nuclear power
plant accident. #emph[Nucl. Sci. Technol.] #strong[4], 76--80 (2014).] <ref-7>

#block[\[8\] Deal, L.~J., Doyle, J.~F., Burson, Z.~G. & Boyns, P.~K. Locating the
lost athena missile in mexico by the aerial radiological measuring
system (ARMS). #emph[Health Phys.] #strong[23], 95--98 (1972).] <ref-8>

#block[\[9\] Prieto, E., Jabaloyas, E., Casanovas, R., Rovira, C. & Salvadó, M. Set
up of a gamma spectrometry mobile unit equipped with LaBr3\(Ce)
detectors for radioactivity monitoring. #emph[Radiat. Phys. Chem.]
#strong[168], 108600 (2020).] <ref-9>

#block[\[10\] Hellfeld, D. #emph[et~al.] Free-moving Quantitative Gamma-ray Imaging.
#emph[Sci. Rep.] #strong[11], 20515 (2021).] <ref-10>

#block[\[11\] Bandstra, M.~S. #emph[et~al.] Improved Gamma-Ray Point Source
Quantification in Three Dimensions by Modeling Attenuation in the Scene.
#emph[IEEE Trans. Nucl. Sci.] #strong[68], 2637--2646 (2021).] <ref-11>

#block[\[12\] Curtis, J.~C. #emph[et~al.] Simulation and validation of the Mobile
Urban Radiation Search (MURS) gamma-ray detector response. #emph[Nucl.
Instrum. Methods Phys. Res. Sect. Accel. Spectrometers Detect. Assoc.
Equip.] #strong[954], 161128 (2020).] <ref-12>

#block[\[13\] Salathe, M. #emph[et~al.] Determining urban material activities with a
vehicle-based multi-sensor system. #emph[Phys. Rev. Res.] #strong[3],
023070 (2021).] <ref-13>

#block[\[14\] Fishman, G.~J. #emph[et~al.] Discovery of Intense Gamma-Ray Flashes of
Atmospheric Origin. #emph[Science] #strong[264], 1313--1316 (1994).] <ref-14>

#block[\[15\] Briggs, M.~S. #emph[et~al.] First results on terrestrial gamma ray
flashes from the Fermi Gamma-ray Burst Monitor. #emph[J. Geophys. Res.
Space Phys.] #strong[115] (2010).] <ref-15>

#block[\[16\] Tavani, M. #emph[et~al.] Terrestrial Gamma-Ray Flashes as Powerful
Particle Accelerators. #emph[Phys. Rev. Lett.] #strong[106], 018501
(2011).] <ref-16>

#block[\[17\] Smith, D.~M. #emph[et~al.] A terrestrial gamma ray flash observed from
an aircraft. #emph[J. Geophys. Res. Atmospheres] #strong[116], 20124
(2011).] <ref-17>

#block[\[18\] Gjesteland, T. #emph[et~al.] Observation of intrinsically bright
terrestrial gamma ray flashes from the Mediterranean basin. #emph[J.
Geophys. Res. Atmospheres] #strong[120], 12,143--12,156 (2015).] <ref-18>

#block[\[19\] Neubert, T. #emph[et~al.] A terrestrial gamma-ray flash and ionospheric
ultraviolet emissions powered by lightning. #emph[Science] #strong[367],
183--186 (2020).] <ref-19>

#block[\[20\] Appleton, J.~D., Miles, J.~C., Green, B.~M. & Larmour, R. Pilot study of
the application of Tellus airborne radiometric and soil geochemical data
for radon mapping. #emph[J. Environ. Radioact.] #strong[99], 1687--1697
(2008).] <ref-20>

#block[\[21\] Sinclair, L.~E. #emph[et~al.] Aerial measurement of radioxenon
concentration off the west coast of vancouver island following the
fukushima reactor accident. #emph[J. Environ. Radioact.] #strong[102],
1018--1023 (2011).] <ref-21>

#block[\[22\] Baldoncini, M. #emph[et~al.] Exploring atmospheric radon with airborne
gamma-ray spectroscopy. #emph[Atmos. Environ.] #strong[170], 259--268
(2017).] <ref-22>

#block[\[23\] Prettyman, T.~H. #emph[et~al.] Elemental composition of the lunar
surface: Analysis of gamma ray spectroscopy data from Lunar Prospector.
#emph[J. Geophys. Res. Planets] #strong[111] (2006).] <ref-23>

#block[\[24\] Hahn, B.~C. #emph[et~al.] Mars Odyssey Gamma Ray Spectrometer elemental
abundances and apparent relative surface age: Implications for Martian
crustal evolution. #emph[J. Geophys. Res. Planets] #strong[112] (2007).] <ref-24>

#block[\[25\] Kobayashi, S. #emph[et~al.] Determining the absolute abundances of
natural radioactive elements on the lunar surface by the kaguya
gamma-ray spectrometer. #emph[Space Sci. Rev.] #strong[154], 193--218
(2010).] <ref-25>

#block[\[26\] Prettyman, T.~H. #emph[et~al.] Dawn's gamma ray and neutron detector.
#emph[Space Sci. Rev.] #strong[163], 371--459 (2011).] <ref-26>

#block[\[27\] Peplowski, P.~N. #emph[et~al.] Radioactive elements on Mercury's surface
from MESSENGER: Implications for the planet's formation and evolution.
#emph[Science] #strong[333], 1850--1852 (2011).] <ref-27>

#block[\[28\] Peplowski, P.~N. The global elemental composition of 433 Eros: First
results from the NEAR gamma-ray spectrometer orbital dataset.
#emph[Planet. Space Sci.] #strong[134], 36--51 (2016).] <ref-28>

#block[\[29\] Prettyman, T.~H. #emph[et~al.] Extensive water ice within Ceres'
aqueously altered regolith: Evidence from nuclear spectroscopy.
#emph[Science] #strong[355], 55--59 (2017).] <ref-29>

#block[\[30\] Prettyman, T.~H. #emph[et~al.] Elemental composition and mineralogy of
Vesta and Ceres: Distribution and origins of hydrogen-bearing species.
#emph[Icarus] #strong[318], 42--55 (2019).] <ref-30>

#block[\[31\] Sanada, Y. & Torii, T. Aerial radiation monitoring around the Fukushima
Dai-ichi nuclear power plant using an unmanned helicopter. #emph[J.
Environ. Radioact.] #strong[139], 294--299 (2015).] <ref-31>

#block[\[32\] Nishizawa, Y., Yoshida, M., Sanada, Y. & Torii, T. Distribution of the
#super[134] Cs/ #super[137] Cs ratio around the Fukushima Daiichi
nuclear power plant using an unmanned helicopter radiation monitoring
system. #emph[J. Nucl. Sci. Technol.] #strong[53], 468--474 (2016).] <ref-32>

#block[\[33\] Connor, D., Martin, P.~G. & Scott, T.~B. Airborne radiation mapping:
Overview and application of current and future aerial systems.
#emph[Int. J. Remote Sens.] #strong[37], 5953--5987 (2016).] <ref-33>

#block[\[34\] Naumenko, A. #emph[et~al.] Autonomous NaI\(Tl) gamma-ray spectrometer
for in situ underwater measurements. #emph[Nuclear Instruments and
Methods in Physics Research Section A: Accelerators, Spectrometers,
Detectors and Associated Equipment] #strong[908], 97--109 (2018).] <ref-34>

#block[\[35\] Pradeep~Kumar, K.~A., Shanmugha~Sundaram, G.~A., Sharma, B.~K.,
Venkatesh, S. & Thiruvengadathan, R. Advances in gamma radiation
detection systems for emergency radiation monitoring. #emph[Nucl. Eng.
Technol.] #strong[52], 2151--2161 (2020).] <ref-35>

#block[\[36\] Grasty, R.~L., Glynn, J.~E. & Grant, J.~A. The analysis of multichannel
airborne gamma-ray spectra. #emph[GEOPHYSICS] #strong[50], 2611--2620
(1985).] <ref-36>

#block[\[37\] Minty, B.~R., McFadden, P. & Kennett, B.~L. Multichannel processing for
airborne gamma-ray spectrometry. #emph[Geophysics] #strong[63],
1971--1985 (1998).] <ref-37>

#block[\[38\] Hendriks, P.~H., Limburg, J. & De~Meijer, R.~J. Full-spectrum analysis
of natural $gamma$-ray spectra. #emph[J. Environ. Radioact.]
#strong[53], 365--380 (2001).] <ref-38>

#block[\[39\] Baré, J. & Tondeur, F. Gamma spectrum unfolding for a NaI monitor of
radioactivity in aquatic systems: Experimental evaluations of the
minimal detectable activity. #emph[Appl. Radiat. Isot.] #strong[69],
1121--1124 (2011).] <ref-39>

#block[\[40\] Caciolli, A. #emph[et~al.] A new FSA approach for in situ $gamma$ ray
spectroscopy. #emph[Sci. Total Environ.] #strong[414], 639--645 (2012).] <ref-40>

#block[\[41\] Ohera, M., Gryc, L., Nováková, M., Češpírová, I. & Sas, D. Application
of unmanned aerial vehicles in emergency radiation monitoring.
#emph[Radiation Measurements] #strong[174], 107111 (2024).] <ref-41>

#block[\[42\] Sinclair, L.~E. #emph[et~al.] Aerial Mobile Radiation Survey Following
Detonation of a Radiological Dispersal Device. #emph[Health Phys.]
#strong[110], 458--470 (2016).] <ref-42>

#block[\[43\] Butterweck, G. #emph[et~al.] Aeroradiometric measurements in the
framework of the Swiss exercise ARM23. Tech. Rep., Paul Scherrer
Institut (PSI), Villigen PSI, Switzerland (2024).] <ref-43>

#block[\[44\] Dickson, B.~H., Bailey, R.~C. & Grasty, R.~L. Utilizing multi-channel
airborne gamma-ray spectra. #emph[Can. J. Earth Sci.] #strong[18],
1793--1801 (1981).] <ref-44>

#block[\[45\] Grasty, R.~L., Holman, P.~B. & Blanchard, Y.~B. Transportable
calibration pads for ground and airborne gamma-ray spectrometers.
#emph[Geol. Surv. Can.] #strong[90] (1991).] <ref-45>

#block[\[46\] Minty, B. R.~S., Morse, M.~P. & Richardson, L.~M. Portable Calibration
Sources For Airborne Gamma-ray Spectrometers. #emph[Explor. Geophys.]
#strong[21], 187--195 (1990).] <ref-46>

#block[\[47\] Allyson, J.~D. & Sanderson, D.~C. Monte Carlo simulation of
environmental airborne gamma-spectrometry. #emph[J. Environ. Radioact.]
#strong[38], 259--282 (1998).] <ref-47>

#block[\[48\] Billings, S. & Hovgaard, J. Modeling detector response in airborne
gamma-ray spectrometry. #emph[Geophysics] #strong[64], 1378--1392
(1999).] <ref-48>

#block[\[49\] Zhang, Q. #emph[et~al.] A hybrid method on sourceless sensitivity
calculation for airborne gamma-ray spectrometer. #emph[Appl. Radiat.
Isot.] #strong[137], 68--72 (2018).] <ref-49>

#block[\[50\] Kulisek, J.~A. #emph[et~al.] A 3D simulation look-up library for
real-time airborne gamma-ray spectroscopy. #emph[Nucl. Instrum. Methods
Phys. Res. Sect. Accel. Spectrometers Detect. Assoc. Equip.]
#strong[879], 84--91 (2018).] <ref-50>

#block[\[51\] Breitenmoser, D., Stabilini, A., Kasprzak, M.~M. & Mayer, S. Development
and validation of a high-fidelity full-spectrum Monte Carlo model for
the Swiss airborne gamma-ray spectrometry system. #emph[Nuclear
Instruments and Methods in Physics Research Section A: Accelerators,
Spectrometers, Detectors and Associated Equipment] #strong[1077], 170512
(2025).] <ref-51>

#block[\[52\] Breitenmoser, D., Stabilini, A. & Mayer, S. Full-spectrum modeling of
mobile gamma-ray spectrometry systems in scattering media (2025).
#link("https://arxiv.org/abs/2506.17820")[arXiv:2506.17820].] <ref-52>

#block[\[53\] Minty, B.~R. Airborne gamma-ray spectrometric background estimation
using full spectrum analysis. #emph[Geophysics] #strong[57], 279--287
(1992).] <ref-53>

#block[\[54\] Crossley, D.~J. & Reid, A.~B. Inversion of gamma-ray data for element
abundances. #emph[GEOPHYSICS] #strong[47], 117--126 (1982).] <ref-54>

#block[\[55\] Minty, B. R.~S. & Kennett, B. L.~N. Optimum Channel Combinations for
Multichannel Airborne Gamma-Ray Spectrometry. #emph[Explor. Geophys.]
#strong[26], 292--301 (1995).] <ref-55>

#block[\[56\] Humphrey, P.~J., Liu, W. & Buote, D.~A. $chi$2 AND POISSONIAN DATA:
BIASES EVEN IN THE HIGH-COUNT REGIME AND HOW TO AVOID THEM. #emph[ApJ]
#strong[693], 822 (2009).] <ref-56>

#block[\[57\] Yamada, S. #emph[et~al.] Poisson vs. Gaussian statistics for sparse
X-ray data: Application to the soft X-ray spectrometer. #emph[Publ
Astron Soc Jpn Nihon Tenmon Gakkai] #strong[71], 75 (2019).] <ref-57>

#block[\[58\] Tak, H. #emph[et~al.] Six Maxims of Statistical Acumen for Astronomical
Data Analysis. #emph[ApJS] #strong[275], 30 (2024).] <ref-58>

#block[\[59\] Romano, P.~K. #emph[et~al.] OpenMC: A state-of-the-art Monte Carlo code
for research and development. #emph[Annals of Nuclear Energy]
#strong[82], 90--97 (2015).] <ref-59>

#block[\[60\] Allison, J. #emph[et~al.] Recent developments in Geant4. #emph[Nucl.
Instrum. Methods Phys. Res. A] #strong[835], 186--225 (2016).] <ref-60>

#block[\[61\] Goorley, T. #emph[et~al.] Features of MCNP6. #emph[Annals of Nuclear
Energy] #strong[87], 772--783 (2016).] <ref-61>

#block[\[62\] Ahdida, C. #emph[et~al.] New Capabilities of the FLUKA Multi-Purpose
Code. #emph[Front. Phys.] #strong[9], 788253 (2022).] <ref-62>

#block[\[63\] Sato, T. #emph[et~al.] Recent improvements of the particle and heavy ion
transport code system -- PHITS version 3.33. #emph[J. Nucl. Sci.
Technol.] #strong[61], 127--135 (2024).] <ref-63>

#block[\[64\] Marelli, S. & Sudret, B. UQLab: A Framework for Uncertainty
Quantification in Matlab. #emph[ICVRAM] 2554--2563 (2014).] <ref-64>

#block[\[65\] Carpenter, B. #emph[et~al.] Stan: A Probabilistic Programming Language.
#emph[J. Stat. Softw.] #strong[76], 1--32 (2017).] <ref-65>

#block[\[66\] Buchner, J. UltraNest - a robust, general purpose Bayesian inference
engine. #emph[J. Open Source Softw.] #strong[6], 3001 (2021).] <ref-66>

#block[\[67\] Abril-Pla, O. #emph[et~al.] PyMC: A modern, and comprehensive
probabilistic programming framework in Python. #emph[PeerJ Comput. Sci.]
#strong[9], e1516 (2023).] <ref-67>

#block[\[68\] Kennedy, M.~C. & O'Hagan, A. Bayesian calibration of computer models.
#emph[J. R. Stat. Soc. Ser. B Stat. Methodol.] #strong[63], 425--464
(2001).] <ref-68>

#block[\[69\] Trotta, R. Bayes in the sky: Bayesian inference and model selection in
cosmology. #emph[Contemp. Phys.] #strong[49], 71--104 (2008).] <ref-69>

#block[\[70\] Gelman, A. #emph[et~al.] #emph[Bayesian Data Analysis] 3rd edn (Chapman
and Hall/CRC, New York, USA, 2013).] <ref-70>

#block[\[71\] von Toussaint, U. Bayesian inference in physics. #emph[Rev. Mod. Phys.]
#strong[83], 943--999 (2011).] <ref-71>

#block[\[72\] D'Agostini, G. Bayesian inference in processing experimental data:
Principles and basic applications. #emph[Rep. Prog. Phys.] #strong[66],
1383 (2003).] <ref-72>

#block[\[73\] Andreon, S. & Weaver, B. #emph[Bayesian Methods for the Physical
Sciences: Learning from Examples in Astronomy and Physics] Vol.~4 of
#emph[Springer Series in Astrostatistics] (Springer International
Publishing, Cham, 2015).] <ref-73>

#block[\[74\] Yuen, K.-V. #emph[Bayesian Methods for Structural Dynamics and Civil
Engineering] (John Wiley & Sons, 2010).] <ref-74>

#block[\[75\] Nichols, J.~M. & Murphy, K.~D. #emph[Modeling and Estimation of
Structural Damage] (John Wiley & Sons, 2016).] <ref-75>

#block[\[76\] Diggle, P.~J., Tawn, J.~A. & Moyeed, R.~A. Model-based geostatistics.
#emph[J. R. Stat. Soc. Ser. C Appl. Stat.] #strong[47], 299--350 (2002).] <ref-76>

#block[\[77\] Bennett, A.~F. #emph[Inverse Modeling of the Ocean and Atmosphere]
(Cambridge University Press, Cambridge, 2002).] <ref-77>

#block[\[78\] Drummond, A.~J. & Bouckaert, R.~R. #emph[Bayesian Evolutionary Analysis
with BEAST] (Cambridge University Press, Cambridge, 2015).] <ref-78>

#block[\[79\] Broemeling, L.~D. #emph[Bayesian Biostatistics and Diagnostic Medicine]
(Chapman and Hall/CRC, New York, 2007).] <ref-79>

#block[\[80\] Murphy, K.~P. #emph[Machine Learning: A Probabilistic Perspective] (MIT
press, 2012).] <ref-80>

#block[\[81\] Russell, S.~J. & Norvig, P. #emph[Artificial Intelligence: A Modern
Approach] 4 edn (Pearson, 2020).] <ref-81>

#block[\[82\] Bishop, C.~M. #emph[Pattern Recognition and Machine Learning] (Springer,
New York, 2006).] <ref-82>

#block[\[83\] Jackman, S. #emph[Bayesian Analysis for the Social Sciences] (John Wiley
& Sons, 2009).] <ref-83>

#block[\[84\] Gill, J. #emph[Bayesian Methods: A Social and Behavioral Sciences
Approach, Third Edition] 3 edn (Chapman and Hall/CRC, New York, 2015).] <ref-84>

#block[\[85\] Paradis, H. #emph[et~al.] Spectral unmixing applied to fast
identification of $gamma$-emitting radionuclides using NaI\(Tl)
detectors. #emph[Appl. Radiat. Isot.] #strong[158], 109068 (2020).] <ref-85>

#block[\[86\] André, R., Bobin, C., Bobin, J., Xu, J. & de Vismes Ott, A. Metrological
approach of $gamma$-emitting radionuclides identification at low
statistics: Application of sparse spectral unmixing to scintillation
detectors. #emph[Metrologia] #strong[58], 15011--15025 (2021).] <ref-86>

#block[\[87\] Metropolis, N., Rosenbluth, A.~W., Rosenbluth, M.~N., Teller, A.~H. &
Teller, E. Equation of State Calculations by Fast Computing Machines.
#emph[The Journal of Chemical Physics] #strong[21], 1087--1092 (1953).] <ref-87>

#block[\[88\] Hastings, W.~K. Monte Carlo sampling methods using Markov chains and
their applications. #emph[Biometrika] #strong[57], 97--109 (1970).] <ref-88>

#block[\[89\] Duane, S., Kennedy, A.~D., Pendleton, B.~J. & Roweth, D. Hybrid Monte
Carlo. #emph[Physics Letters B] #strong[195], 216--222 (1987).] <ref-89>

#block[\[90\] Foreman-Mackey, D., Hogg, D.~W., Lang, D. & Goodman, J. Emcee : The MCMC
Hammer. #emph[Publ. Astron. Soc. Pac.] #strong[125], 306--312 (2013).] <ref-90>

#block[\[91\] Goodman, J. & Weare, J. Ensemble samplers with affine invariance.
#emph[Commun. Appl. Math. Comput. Sci.] #strong[5], 65--80 (2010).] <ref-91>

#block[\[92\] Skilling, J. Nested Sampling. #emph[AIP Conf. Proc.] #strong[735], 405
(2004).] <ref-92>

#block[\[93\] Feroz, F., Hobson, M.~P. & Bridges, M. MultiNest: An efficient and
robust Bayesian inference tool for cosmology and particle physics.
#emph[Mon. Not. R. Astron. Soc.] #strong[398], 1601--1614 (2009).] <ref-93>

#block[\[94\] Handley, W.~J., Hobson, M.~P. & Lasenby, A.~N. Polychord:
Next-generation nested sampling. #emph[Mon. Not. R. Astron. Soc.]
#strong[453], 4384--4398 (2015).] <ref-94>

#block[\[95\] Speagle, J.~S. DYNESTY: A dynamic nested sampling package for estimating
Bayesian posteriors and evidences. #emph[Mon. Not. R. Astron. Soc.]
#strong[493], 3132--3158 (2020).] <ref-95>

#block[\[96\] Ashton, G. #emph[et~al.] Nested sampling for physical scientists.
#emph[Nat. Rev. Methods Primer 2022 21] #strong[2], 1--22 (2022).] <ref-96>

#block[\[97\] Breitenmoser, D., Butterweck, G., Kasprzak, M.~M., Yukihara, E.~G. &
Mayer, S. Experimental and Simulated Spectral Gamma-Ray Response of a
NaI\(Tl) Scintillation Detector used in Airborne Gamma-Ray Spectrometry.
#emph[Adv. Geosci.] #strong[57], 89--107 (2022).] <ref-97>

#block[\[98\] Butterweck, G. #emph[et~al.] Aeroradiometric measurements in the
framework of the Swiss Exercise ARM22. Tech. Rep., Paul Scherrer
Institut (PSI), Villigen PSI, Switzerland (2023).] <ref-98>

#block[\[99\] Butterweck, G. #emph[et~al.] Aeroradiometric measurements in the
framework of the Swiss exercise ARM20. Tech. Rep., Paul Scherrer
Institut (PSI), Villigen PSI, Switzerland (2021).] <ref-99>

#block[\[100\] Böhlen, T.~T. #emph[et~al.] The FLUKA Code: Developments and challenges
for high energy and medical applications. #emph[Nucl. Data Sheets]
#strong[120], 211--214 (2014).] <ref-100>

#block[\[101\] Battistoni, G. #emph[et~al.] Overview of the FLUKA code. #emph[Ann.
Nucl. Energy] #strong[82], 10--18 (2015).] <ref-101>

#block[\[102\] Vlachoudis, V. Flair: A powerful but user friendly graphical interface
for FLUKA. #emph[Int. Conf. Math. Comput. Methods React. Phys. MC 2009]
(2009).] <ref-102>

#block[\[103\] Hünnefeld, M. #emph[et~al.] Combining Maximum-Likelihood with Deep
Learning for Event Reconstruction in IceCube. #emph[Proc. Sci.]
#strong[395], 1065 (2022).] <ref-103>

#block[\[104\] Salinas, D., Flunkert, V., Gasthaus, J. & Januschowski, T. DeepAR:
Probabilistic forecasting with autoregressive recurrent networks.
#emph[Int. J. Forecast.] #strong[36], 1181--1191 (2020).] <ref-104>

#block[\[105\] Santarelli, M.~F., Positano, V. & Landini, L. Measured PET Data
Characterization with the Negative Binomial Distribution Model. #emph[J.
Med. Biol. Eng.] #strong[37], 299--312 (2017).] <ref-105>

#block[\[106\] Perrakis, K., Ntzoufras, I. & Tsionas, E.~G. On the use of marginal
posteriors in marginal likelihood estimation via importance sampling.
#emph[Computational Statistics & Data Analysis] #strong[77], 54--69
(2014).] <ref-106>

#block[\[107\] Metodiev, M. #emph[et~al.] Easily Computed Marginal Likelihoods from
Posterior Simulation Using the THAMES Estimator. #emph[Bayesian Anal.]
#strong[\-1], 1--28 (2024).] <ref-107>

#block[\[108\] Llorente, F., Martino, L., Delgado, D. & López-Santiago, J. Marginal
Likelihood Computation for Model Selection and Hypothesis Testing: An
Extensive Review. #emph[SIAM Rev.] #strong[65], 3--58 (2023).] <ref-108>

#block[\[109\] Veitch, J. Parameter estimation for compact binaries with ground-based
gravitational-wave observations using the LALInference software library.
#emph[Phys. Rev. D] #strong[91] (2015).] <ref-109>

#block[\[110\] Ashton, G. #emph[et~al.] Bilby: A User-friendly Bayesian Inference
Library for Gravitational-wave Astronomy. #emph[ApJS] #strong[241], 27
(2019).] <ref-110>

#block[\[111\] Smith, R. J.~E., Ashton, G., Vajpeyi, A. & Talbot, C. Massively parallel
Bayesian inference for transient gravitational-wave astronomy.
#emph[MNRAS] #strong[498], 4492--4502 (2020).] <ref-111>

#block[\[112\] MacDonald, R.~J. & Madhusudhan, N. HD 209458b in new light: Evidence of
nitrogen chemistry, patchy clouds and sub-solar water. #emph[MNRAS]
#strong[469], 1979--1996 (2017).] <ref-112>

#block[\[113\] Pinhas, A., Rackham, B.~V., Madhusudhan, N. & Apai, D. Retrieval of
planetary and stellar properties in transmission spectroscopy with Aura.
#emph[MNRAS] #strong[480], 5314--5331 (2018).] <ref-113>

#block[\[114\] Jandel, M. #emph[et~al.] Decomposition of continuum $gamma$-ray spectra
using synthesized response matrix. #emph[Nucl. Instrum. Methods Phys.
Res. Sect. Accel. Spectrometers Detect. Assoc. Equip.] #strong[516],
172--183 (2004).] <ref-114>

#block[\[115\] Breitenmoser, D., Cerutti, F., Butterweck, G., Kasprzak, M.~M. & Mayer,
S. Emulator-based Bayesian inference on non-proportional scintillation
models by compton-edge probing. #emph[Nat. Commun.] #strong[14], 7790
(2023).] <ref-115>

#block[\[116\] McConn, R.~J., Gesh, C.~J., Pagh, R.~T. & Rucker, R.~A. Compendium of
Material Composition Data for Radiation Transport Modeling. Tech. Rep.,
Pacific Northwest National Laboratory, Richland (2011).] <ref-116>

#block[\[117\] Lloyd-Smith, J.~O. Maximum Likelihood Estimation of the Negative
Binomial Dispersion Parameter for Highly Overdispersed Data, with
Applications to Infectious Diseases. #emph[PLOS ONE] #strong[2], e180
(2007).] <ref-117>

#block[\[118\] Jaynes, E.~T. Information theory and statistical mechanics. #emph[Phys.
Rev.] #strong[106], 620--630 (1957).] <ref-118>

#block[\[119\] Brooks, S.~P. & Gelman, A. General Methods for Monitoring Convergence of
Iterative Simulations. #emph[J. Comput. Graph. Stat.] #strong[7],
434--455 (1998).] <ref-119>

#block[\[120\] Breitenmoser, D., Stabilini, A., Kasprzak, M.~M. & Mayer, S. Source
quantification by mobile gamma-ray spectrometry systems: A Bayesian
approach (Dataset) (2025).] <ref-120>

#block[\[121\] Breitenmoser, D., Cerutti, F., Butterweck, G., Kasprzak, M.~M. & Mayer,
S. FLUKA user routines for non-proportional scintillation simulations
(2023).] <ref-121>

= Supplementary information

#link("https://arxiv.org/abs/2512.18769v1")[Original supplementary information listed under Ancillary files on arXiv]
