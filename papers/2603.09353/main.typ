// Erkan, Surer, and Yaman, arXiv:2603.09353v1. Converted from LaTeX under CC BY 4.0.
// https://arxiv.org/abs/2603.09353v1 | https://creativecommons.org/licenses/by/4.0/
#let horizontalrule = line(start: (25%,0%), end: (75%,0%))

#show terms: it => {
  it.children
    .map(child => [
      #strong[#child.term]
      #block(inset: (left: 1.5em, top: -0.4em))[#child.description]
      ])
    .join()
}

#set table(
  inset: 6pt,
  stroke: none
)

#show figure.where(
  kind: table
): set figure.caption(position: top)

#show figure.where(
  kind: image
): set figure.caption(position: bottom)

#let content-to-string(content) = {
  if content.has("text") {
    content.text
  } else if content.has("children") {
    content.children.map(content-to-string).join("")
  } else if content.has("body") {
    content-to-string(content.body)
  } else if content == [ ] {
    " "
  }
}
#let conf(
  title: none,
  subtitle: none,
  authors: (),
  keywords: (),
  date: none,
  abstract-title: none,
  abstract: none,
  thanks: none,
  cols: 1,
  margin: (x: 1.25in, y: 1.25in),
  paper: "us-letter",
  lang: "en",
  region: "US",
  font: none,
  fontsize: 11pt,
  mathfont: none,
  codefont: none,
  linestretch: 1,
  sectionnumbering: none,
  linkcolor: none,
  citecolor: none,
  filecolor: none,
  pagenumbering: "1",
  doc,
) = {
  set document(
    title: title,
    keywords: keywords,
  )
  set document(
      author: authors.map(author => content-to-string(author.name)).join(", ", last: " & "),
  ) if authors != none and authors != ()
  set page(
    paper: paper,
    margin: margin,
    numbering: pagenumbering,
    columns: cols
  )

  set par(
    justify: true,
    leading: linestretch * 0.65em
  )
  set text(lang: lang,
           region: region,
           size: fontsize)

  set text(font: font) if font != none
  show math.equation: set text(font: mathfont) if mathfont != none
  show raw: set text(font: codefont) if codefont != none

  set heading(numbering: sectionnumbering)

  show link: set text(fill: rgb(content-to-string(linkcolor))) if linkcolor != none
  show ref: set text(fill: rgb(content-to-string(citecolor))) if citecolor != none
  show link: this => {
    if filecolor != none and type(this.dest) == label {
      text(this, fill: rgb(content-to-string(filecolor)))
    } else {
      text(this)
    }
  }

  block(below: 1em, width: 100%)[
    #if title != none {
      align(center, block[
          #text(weight: "bold", size: 1.5em)[#title #if thanks != none {
              footnote(thanks, numbering: "*")
              counter(footnote).update(n => n - 1)
            }]
          #(
            if subtitle != none {
              parbreak()
              text(weight: "bold", size: 1.25em)[#subtitle]
            }
           )])
    }

    #if authors != none and authors != [] {
      let count = authors.len()
      let ncols = calc.min(count, 3)
      grid(
        columns: (1fr,) * ncols,
        row-gutter: 1.5em,
        ..authors.map(author => align(center)[
          #author.name \
          #author.affiliation \
          #author.email
        ])
      )
    }

    #if date != none {
      align(center)[#block(inset: 1em)[
          #date
        ]]
    }

    #if abstract != none {
      block(inset: 2em)[
        #text(weight: "semibold")[#abstract-title] #h(1em) #abstract
      ]
    }
  ]

  doc
}
#show: doc => conf(
  title: [Interactive 3D visualization of surface roughness predictions
in additive manufacturing: A data-driven framework],
  authors: (
    ( name: [Engin Deniz Erkan],
      affiliation: "",
      email: "" ),
    ( name: [Elif Surer],
      affiliation: "",
      email: "" ),
    ( name: [Ulas Yaman],
      affiliation: "",
      email: "" ),
    ),
  abstract-title: [Abstract],
  abstract: [Surface roughness in Material Extrusion Additive
Manufacturing varies across a part and is difficult to anticipate during
process planning because it depends on both printing parameters and
local surface inclination, which governs the staircase effect. A
data-driven framework is presented to predict the arithmetic mean
roughness ($R a$) prior to fabrication using process parameters and
surface angle. A structured experimental dataset was created using a
three-level Box--Behnken design: 87 specimens were printed, each with
multiple planar faces spanning different inclination angles, yielding
1566 $R a$ measurements acquired with a contact profilometer. A
multilayer perceptron regressor was trained to capture nonlinear
relationships between manufacturing conditions, inclination, and $R a$.
To mitigate limited experimental data, a conditional generative
adversarial network was used to generate additional condition-specific
tabular samples, thereby improving predictive performance. Model
performance was assessed on a hold-out test set. A web-based
decision-support interface was also developed to enable interactive
process planning by loading a 3D model, specifying printing parameters,
and adjusting the part's orientation. The system computes face-wise
inclination from the model geometry and visualizes predicted $R a$ as an
interactive colormap over the surface, enabling rapid identification of
regions prone to high roughness and immediate comparison of parameter
and orientation choices.

],
  pagenumbering: "1",
  cols: 1,
  doc,
)


\[orcid=0009-0001-1641-1942\]

\[orcid=0000-0002-0738-6669\]

\[orcid=0000-0001-8598-9281\]

#block[
Additive manufacturing ,Surface roughness ,Box--Behnken design ,Machine
learning ,Data augmentation

]
#set heading(numbering: "1.1")
#set math.equation(numbering: "(1)")

= Introduction
<sec1>
Additive manufacturing (AM), commonly referred to as three-dimensional
(3D) printing, enables the fabrication of complex geometries through
layer-wise material consolidation and has evolved from rapid prototyping
toward broader functional and industrial deployment. Nevertheless,
surface quality remains a persistent barrier to wider adoption, because
layer-based deposition inherently produces surface artifacts such as
stair-stepping, waviness, and visible layer lines. These artifacts
directly influence functional performance, dimensional fidelity,
aesthetics, and the extent of post-processing required to meet
application-specific tolerances \[1--3\]. In Material Extrusion AM
(MEAM), surface roughness is particularly sensitive to geometric
features and orientation, which makes it a critical quality attribute
for process planning and design for AM workflows \[4--6\].

In Fused Filament Fabrication (FFF), a type of MEAM, surface roughness
results from complex, nonlinear interactions among controllable process
parameters (such as layer height, extrusion temperature, and deposition
speeds), material behavior during deposition and cooling, and geometric
factors including surface inclination and build orientation. The effect
of inclination angle on roughness, primarily due to the stair-stepping
mechanism, has been explicitly modeled by representing surface quality
as a function of surface angle \[4\]. Empirical studies confirm that
multiple printer and slicing settings collectively influence surface
quality, demonstrating that roughness is rarely determined by a single
dominant factor but instead reflects the combined effects of various
parameter groups \[5\]. Since process planning often requires balancing
quality and efficiency, roughness is typically treated as one objective
within broader quality-productivity trade-offs \[6\]. Furthermore,
post-processing can significantly modify as-printed surfaces; thus,
roughness control depends not only on in-process parameter selection but
also on available finishing strategies in desktop FFF environments
\[7\].

Despite the practical importance of surface roughness, parameter
selection in standard slicing workflows remains largely dependent on
experience-based adjustments. Numerous parameters must be defined prior
to printing, and the relationships among these settings, orientation,
and resulting surface roughness are challenging to predict due to
interaction effects and process variability. Most slicer and printer
interfaces offer limited predictive feedback regarding surface quality
before manufacturing, which promotes trial-and-error experimentation.
This approach increases material usage, prolongs iteration cycles, and
may result in inconsistent surface quality, especially when technical
expertise is limited or when parts feature multiple surfaces with
varying inclinations.

A significant practical challenge is that real components seldom exhibit
a single representative surface. Instead, they comprise multiple faces
with varying local inclinations and orientations, leading to diverse
roughness-forming mechanisms and trade-offs within the same part.
Therefore, roughness prediction is most effective when interpreted in a
geometry-aware context and applied to compare alternative parameter and
orientation selections at the part level, rather than as a single scalar
outcome.

While previous studies have introduced statistical, learning-based, and
optimization-driven methods for roughness modeling, two significant gaps
persist in pre-print decision-making for FFF. First, experimental
datasets are typically insufficient to span the joint space defined by
process parameters and inclination-related geometric descriptors,
limiting the generalizability of data-driven predictors. Second, model
outputs are often presented in formats that are not readily translatable
into practitioner-oriented, geometry-aware tools capable of delivering
interpretable, pre-print feedback across complete 3D models.

To address these gaps, this study presents an end-to-end, data-driven
methodology for surface roughness prediction and process planning in
FFF. The methodology begins with the construction of a systematic
experimental dataset using a design-of-experiments approach, which
ensures broad coverage of the parameter space and enables robust
learning of interaction effects relevant to surface roughness
\[6,8--10\]. Utilizing this dataset, a multilayer perceptron (MLP)
predictor is developed, and conditional synthetic augmentation is
investigated through generative modeling techniques informed by research
on manufacturing data augmentation and conditional generative
adversarial networks (CGANs) \[11--13\]. In addition to predictive
modeling, a web-based decision-support tool is introduced to facilitate
practical adoption. The graphical user interface allows users to upload
3D objects and provides real-time visualization of predicted surface
roughness on the geometry. By enabling interactive control of printing
parameters and build orientation, the interface supports rapid
exploration of alternative process plans and immediate assessment of
their expected surface-quality outcomes. This interactive workflow
facilitates quality-aware parameter selection, enhances interpretability
by linking predictions to 3D geometry, and reduces costly
trial-and-error cycles by providing pre-print feedback without repeated
physical experimentation. Consistent with previous AM decision-support
initiatives \[14,15\] and the growing demand for accessible AM workflows
across diverse user groups \[3\], the proposed system implements
data-driven surface-quality prediction as an interactive and
geometry-aware process planning tool.

= Prior work
<sec2>
Structured experimentation is commonly employed to investigate and model
surface roughness dependencies on process parameters and geometry.
Design of experiments (DoE) and response surface methodology (RSM)
reduce experimental effort while enabling estimation of main effects,
interactions, and curvature. Box--Behnken designs have been utilized for
surface roughness modeling in FFF, often in conjunction with analysis of
variance (ANOVA) to assess factor significance \[8,9\]. DoE and RSM
approaches have also been applied to broader print-quality objectives,
such as dimensional accuracy, demonstrating the effectiveness of
structured experimentation for AM process improvement \[16\]. Recent
studies have extended these methods to multi-objective contexts that
simultaneously consider quality, time, and resource usage, framing
parameter selection as a Pareto optimization problem rather than a
single-response minimization \[10\].

Another research direction integrates predictive models with
metaheuristic optimization to explore high-dimensional parameter spaces
beyond traditional quadratic response surfaces. Hybrid frameworks that
combine artificial neural networks (ANNs) with particle swarm
optimization (PSO) have been introduced to minimize roughness by
optimizing printing parameters using a learned surrogate \[17\].
Comparable approaches have incorporated symbiotic organism search (SOS),
again leveraging ANN surrogates to facilitate roughness minimization
under practical constraints \[18\]. Related hybrid techniques have also
been applied to improve dimensional accuracy by merging modeling and
optimization strategies \[19\]. Recent studies continue to integrate RSM
and ANN for surface-quality modeling, including multiple surface
descriptors, and employ desirability-based optimization once predictive
accuracy is achieved \[20\]. Additionally, genetic algorithm
(GA)-optimized hybrid learning has been reported for surface roughness
prediction, highlighting sustained interest in evolutionary search
methods combined with learning-based predictors for AM quality tasks
\[21\]. Recent AM studies have also introduced hybrid formulations that
explicitly integrate data-driven learning with geometric roughness
mechanisms, such as stair-stepping, to enhance interpretability while
preserving predictive performance \[22\].

In addition to DoE-based methods, machine learning (ML) has become a
prominent approach for surface roughness prediction, as it can capture
nonlinearities and interactions among continuous and discrete variables.
Comparative studies of various ML algorithms for FFF-printed parts have
shown that geometric descriptors such as wall angle and process
variables like layer height are significant determinants of roughness,
and that ensemble and MLP models can deliver strong predictive
performance \[23\]. Other studies focused on ANNs indicate that compact
neural models can achieve useful predictive accuracy in limited
experimental scenarios \[24\]. Process-specific ML models for
extrusion-based AM have also been developed to predict roughness under
realistic parameter variability \[25\]. Furthermore, evidence from
large-scale AM prediction tasks demonstrates that ML can inform
manufacturing decisions when exhaustive experimentation is impractical
\[26\]. Recent reviews confirm the growing importance of roughness
prediction, while also highlighting persistent challenges in data
availability, generalization, and reproducible measurement protocols
\[2\]. In addition to FFF, process-specific ML methods have been
developed for in-situ roughness estimation in laser powder bed fusion,
reflecting broader interest in sensor-informed, data-driven surface
quality prediction across various AM process families \[27\].

A major challenge in data-driven AM quality modeling is the limited size
and scope of experimental datasets. Surface metrology is
labor-intensive, and the input space expands rapidly when accounting for
surface inclination, orientation, and multiple process variables. As a
result, numerical data augmentation has gained attention as a means to
enrich training datasets without increasing the number of physical
experiments. Reviews of augmentation methods for numerical manufacturing
data highlight that augmentation effectiveness is context-dependent, and
inappropriate synthetic sampling can negatively impact predictive
performance \[11\]. CGANs have been proposed as a systematic approach
for generating condition-specific synthetic samples; empirical studies
indicate that CGAN-based generation can enhance learning outcomes
compared to traditional oversampling when evaluated appropriately
\[12\]. For tabular data, conditional GAN variants have been developed
to better capture mixed discrete and continuous variables and complex
distributions, enabling more realistic synthetic data generation \[13\].
Subsequent research has advanced this field by proposing staged or
two-stage generation schemes for tabular forecasting tasks, which aim to
better preserve dependencies between generated features and the target
variable \[28\]. Additionally, related engineering applications have
assessed GAN-based tabular synthesis as a method to enhance predictive
performance when experimental data are limited, such as in machine
learning-based multiaxial fatigue life prediction \[29\]. In related AM
quality monitoring tasks, augmentation is also used to improve
robustness in data-limited inspection scenarios \[30\], and quality
control strategies for augmentation have been introduced to mitigate the
risks of harmful or noisy synthetic samples in small-scale industrial
defect detection \[31\].

Conditional generative modeling is particularly suitable for AM quality
prediction, as the response variable can be explicitly conditioned on
controllable printing parameters and pre-print descriptors, such as
surface inclination and build orientation. In this framework, CGANs
enable the generation of tabular synthetic samples that maintain the
joint distribution among process parameters, inclination-related
descriptors, and surface roughness, thus enriching sparsely sampled
regions of the experimental design without additional physical trials
\[11--13\]. Given that surface inclination is a primary factor in
stair-stepping and roughness formation, conditioning the generator on
inclination and orientation descriptors ensures that synthetic samples
align with process planning decisions and observed roughness patterns
\[4,23\].

The translation of predictive models into practitioner-oriented tools is
increasingly recognized as essential for achieving real-world impact,
particularly within Industry 4.0 contexts. Decision-support systems have
been developed to facilitate the selection of appropriate additive
manufacturing (AM) technologies based on specific requirements and
constraints \[14\]. Data-driven process selection frameworks that
utilize optimization heuristics, such as genetic algorithms, have also
been introduced to recommend AM process options and reduce dependence on
expert knowledge \[15\]. These efforts support the broader adoption of
AM across diverse user groups and application areas, where accessible
and interactive decision support can accelerate iteration cycles and
enhance first-time-right outcomes \[3\]. In related AM domains,
practitioner-oriented interfaces have been created to organize and
operationalize AM performance knowledge; for example, curated data
reviews and database-style design interfaces have been developed for
additively manufactured lattice structures to support engineering
decision-making \[32\]. Nevertheless, for surface-roughness-focused
workflows in FFF, a significant challenge persists in integrating
predictive modeling with geometry-aware visualization, enabling users to
interpret roughness outcomes across entire parts and efficiently explore
orientation and parameter alternatives prior to fabrication.

Collectively, these observations motivate an integrated pipeline that
incorporates structured experimentation, data-efficient learning, and
geometry-aware visualization for pre-print process planning.

= Methodology
<sec3>
This study introduces a data-driven framework for predicting surface
roughness and optimizing process planning in FFF. The approach
integrates systematic experimental data collection, standardized surface
metrology, and rigorous data preparation to support learning-based
modeling. Surface roughness is estimated using an MLP regressor, which
captures nonlinear relationships among printing conditions, surface
inclination, and roughness outcomes. To address constraints related to
dataset size and representativeness, CGANs generate condition-consistent
tabular samples, thereby enriching the training set. The selected
predictor is then deployed within a web-based graphical user interface
(GUI) that supports interactive inference on user-uploaded 3D geometries
by extracting mesh-based inclination descriptors and visualizing
predicted roughness as a color-mapped overlay, facilitating real-time
exploration of parameter and orientation choices.

== Design of experiments
<subsec3.1>
A structured experimental design was implemented to quantify the
combined effects of key FFF process parameters and surface inclination
on arithmetic mean roughness ($R a$). DoE and RSM are commonly applied
in AM surface-quality studies to minimize experimental effort while
enabling estimation of main effects, interaction effects, and curvature
\[8--10\]. Inclination-related descriptors are consistently identified
as primary contributors to stair-stepping and roughness variation in
FFF, which justifies the explicit inclusion of surface angle in the
experimental dataset \[4,23\].

To enhance geometric diversity while maintaining consistency within the
part family, a dedicated test specimen with multiple planar faces at
distinct inclination angles was used. This specimen comprises 18
measurement surfaces with inclination angles ranging from $0^compose$ to
$170^compose$ in $10^compose$ increments, enabling systematic
characterization of roughness across a broad spectrum of orientations
relevant to practical printing applications.

A three-level Box--Behnken design (BBD) was selected to efficiently
explore the process-parameter space. BBD, an RSM-oriented experimental
design, enables estimation of second-order response behavior (quadratic
terms) and interaction effects while requiring significantly fewer
experimental runs than a full factorial design \[8,9\]. Parameter
combinations were executed under controlled conditions to isolate the
effects of intentional factor variations.

=== Selection of process parameters
<subsubsec3.1.1>
Seven process parameters were selected due to established relevance to
surface quality and frequent use in prior FFF roughness studies and
process-quality investigations \[1,2,5,6\]. Table~@tbl1 summarizes the
factors and discrete levels used in the BBD.

#block[
#figure(
  align(center)[#table(
    columns: 4,
    align: (left,left,left,left,),
    table.header([Parameter], [Level 1], [Level 2], [Level 3],),
    table.hline(),
    [Layer Height (mm)], [0.12], [0.20], [0.28],
    [Extrusion Temperature ($""^compose$C)], [190], [200], [210],
    [Outer Wall Speed (mm/s)], [150], [200], [250],
    [Infill Density (%)], [5], [15], [25],
    [Wall Thickness (mm)], [0.36], [0.42], [0.48],
    [Bed Temperature ($""^compose$C)], [55], [60], [65],
    [Fan Speed (%)], [60], [80], [100],
  )]
  , caption: [Process parameters and discrete levels used in the
  Box--Behnken design.]
  , kind: table
  ) <tbl1>

]
=== Purpose and effectiveness of the Box--Behnken design
<subsubsec3.1.2>
BBD was adopted to obtain broad coverage of the factor space while
maintaining experimental feasibility. For $k$ factors at three levels, a
full factorial design requires $N = 3^k$, which becomes impractical for
physical printing as $k$ increases. With $k = 7$, a full factorial
design would require $3^7 = 2187$ experimental conditions.

In contrast, the standard Box--Behnken construction uses combinations of
mid-level settings to estimate curvature and interaction effects without
requiring all corner points. A commonly used run count for BBD is
$ N = 2 k \( k - 1 \) + C_0 \, $<eq:bbd_runs> where $C_0$ is the number
of replicated center points. In the present design, $k = 7$ yields
$2 k \( k - 1 \) = 84$ edge-point combinations.

Three replicated center points ($C_0 = 3$) were included for two primary
methodological reasons. First, center-point replications provide an
estimate of pure experimental error, defined as the variability observed
when the same factor settings are repeated under nominally identical
conditions. This estimate enables statistical assessment of model
adequacy and facilitates the distinction between systematic factor
effects and measurement or process noise \[8,9\]. Second, center points
enhance the stability of curvature estimation because the BBD targets
second-order response behavior. Repeated observations near the design
center strengthen the model fit in the mid-range region of the factor
space and enable a basic lack-of-fit check relative to replicated noise.

In this study, the replicated center-point runs produced nearly
identical roughness responses, indicating minimal process variability
under fixed hardware and material conditions. Since these runs share
identical input settings, including all replicated center-point rows in
supervised learning would introduce duplicated feature vectors and
potentially bias model fitting. Consequently, for the surface roughness
prediction dataset, a single representative center-point observation was
retained to avoid duplicated rows, while the remaining measurements were
used to confirm repeatability and to verify that measurement noise was
limited.

The complete Box--Behnken run matrix and the process settings assigned
to each printed specimen are reported in Table~@tbl4 (Appendix). Each
object identifier denotes a unique specimen fabricated under the
corresponding parameter combination.

=== Specimen design for multi-angle surface characterisation
<subsubsec3.1.3>
A dedicated specimen geometry was developed to isolate the effect of
surface inclination on roughness, while maintaining all other geometric
attributes constant. The specimen comprises 18 planar regions, each
offering a sufficiently long measurement track to ensure consistent
profilometer acquisition across various angles. The inclination range
($0^compose$ to $170^compose$) achieves near-continuous coverage, in
contrast to previous studies that typically assess only a limited set of
orientations, often confined to near-horizontal and near-vertical
surfaces \[4,23\].

To control for geometric confounders, each inclined region incorporates
a flat measurement area, allowing profilometer measurements to be
conducted under consistent contact and traverse conditions. This
configuration facilitates systematic analysis of the interaction between
process parameters and surface inclination in determining roughness
outcomes.

Figures~@FIG:1 and~@FIG:2 present the frontal and rear views of the
specimen. The stepped arrangement ensures clear, repeatable measurement
regions while minimizing variations caused by uncontrolled part
geometry.

#figure(image("figs/Fig1.jpg"),
  caption: [
    Frontal view of the designed multi-angle specimen.
  ]
)
<FIG:1>

#figure(image("figs/Fig2.jpg"),
  caption: [
    Rear view of the designed multi-angle specimen.
  ]
)
<FIG:2>

=== 3D printer and material
<subsubsec3.1.4>
All specimens were fabricated using a Bambu Lab A1 Combo system equipped
with a 0.4~mm nozzle. A single filament type was used across all
experimental runs to avoid confounding material-to-material variation.
The material was polylactic acid (PLA) with a nominal filament diameter
of 1.75~mm and a marble color variant. Only the parameters specified by
the experimental design were varied; all other machine settings and
environmental conditions were held constant across runs to support
comparability and isolate factor effects. Crucially, all specimens were
printed without support structures to ensure that surface roughness
measurements reflected only the interaction between process parameters
and surface inclination. This approach prevented surface artifacts or
localized damage typically associated with support contact, thereby
preserving the integrity of the as-printed surface texture for
metrological evaluation.

=== Printed objects
<subsubsec3.1.5>
A total of 87 specimens were produced corresponding to the 87
Box--Behnken experimental conditions. A representative view of the
specimen is shown in Figure~@FIG:3. The full experimental set is shown
in Figure~@FIG:4.

#figure(image("figs/Fig3.jpg"),
  caption: [
    Fabricated specimen.
  ]
)
<FIG:3>

#figure(image("figs/Fig4.jpeg"),
  caption: [
    Full set of fabricated specimens corresponding to the Box--Behnken
    runs.
  ]
)
<FIG:4>

=== Measurement equipment and setup
<subsubsec3.1.6>
Surface roughness was measured using a contact stylus profilometer. This
technique enables standardized surface texture evaluation and supports
consistent filtering and parameter extraction in accordance with
international standards. The measurement configuration was kept constant
across all specimens and surfaces to ensure that observed roughness
variations resulted from process parameters and surface inclination,
rather than from changes in metrology settings. In total, 1566
measurements were taken from different surfaces. To ensure high
measurement accuracy and minimize vibration-induced noise, each specimen
was securely stabilized on a leveled surface plate during acquisition.
This setup maintained stable contact between the stylus and the
measurement area, prevented slipping or lateral displacement, especially
on steeply inclined surfaces, and supported consistent traverse
conditions.

A phase-correct Gaussian filter was applied to separate roughness from
the primary profile, in accordance with DIN EN ISO 16610-21 and ASME
B46.1. A cut-off wavelength of $lambda_c = 0.8 med upright(m m)$ was
used for all measurements. The use of a phase-correct filter prevents
phase distortion and minimizes the risk of shifting peaks and valleys,
particularly on FFF surfaces that display periodic ridge structures.

Measurements were conducted under controlled laboratory conditions to
minimize environmental variability. Figure~@FIG:5 presents a
representative surface profile acquired by the contact stylus
profilometer and replotted in MATLAB. The profile is shown as profile
height $z$ ($mu$m) versus scan position (mm), providing a direct
visualization of the measured surface texture along the measurement
trace.

#figure(image("figs/Fig5.png"),
  caption: [
    Representative surface profile measured by the stylus profilometer
    and visualized in MATLAB.
  ]
)
<FIG:5>

== Surface roughness prediction using an MLP regressor
<subsec3.2>
Surface roughness in FFF results from nonlinear interactions among
process parameters, such as layer height, thermal conditions, and
deposition speed, as well as geometry-related factors, such as surface
inclination. These coupled effects are challenging to capture using
low-order parametric models, particularly when multiple variables and
interaction pathways are involved. As a result, data-driven regression
models have become prevalent for predicting roughness in
material-extrusion AM, with artificial neural networks often cited as
effective nonlinear surrogates for mapping process inputs to roughness
outcomes \[2,9,17,18,20,23,24\]. In alignment with this approach, an MLP
regressor was chosen as the predictive model based on its capacity to
approximate complex nonlinear functions from tabular data, its
compatibility with standardized feature scaling and mixed process
descriptors, and its suitability for the relatively small-to-moderate
experimental datasets typical in AM surface metrology studies \[2,23\].

The MLP receives as input a tabular feature vector comprising the
printing process parameters (Table~@tbl1) and the surface inclination
descriptor, and outputs a scalar estimate of the arithmetic mean
roughness $R a$ (in $mu$m). The network architecture consists of
multiple fully connected layers, each followed by batch normalization
and a nonlinear activation function. Dropout is used to address
overfitting, a significant concern in experimental AM datasets with
limited unique printing conditions. The output layer employs a linear
activation function to enable continuous-valued regression. Model
training utilizes the Adam optimizer with gradient clipping to stabilize
optimization in the presence of noisy gradients and heterogeneous
feature scales.

=== Data splitting and evaluation protocol
<subsubsec3.2.1>
A rigorous evaluation protocol was implemented to ensure an unbiased
assessment of generalization performance and to mitigate optimistic
results due to information leakage. Initially, a hold-out test set
comprising 15% of the available samples was set aside and excluded from
model selection. This test set remained constant throughout development
and was used solely for final performance evaluation. The remaining 85%
of the data constituted the training and validation pool.

Model selection and hyperparameter optimization were conducted using
five-fold cross-validation (CV) on the training and validation pool. In
each fold, the training subset was used to fit the feature scaler and
learn network parameters, while the corresponding validation subset was
used for early stopping and calculating validation metrics. To prevent
information leakage, min-max normalization was applied within each fold
by fitting the scaler to the fold's training subset and subsequently
transforming the fold's validation subset with the same scaler.
Following hyperparameter selection, the final MLP model was retrained on
the entire training and validation pool with the selected configuration
and evaluated once on the hold-out test set.

=== Hyperparameter optimization
<subsubsec3.2.2>
Hyperparameter optimization was performed using Optuna, which employs
efficient sequential model-based search strategies, such as
Tree-structured Parzen Estimator (TPE) sampling, for black-box
optimization of model configurations. The optimization objective was the
mean validation mean absolute error (MAE) across the five CV folds,
serving as the primary error metric for model selection. The search
space encompassed the number of hidden layers, layer widths, dropout
rate, activation function, learning rate, $ell_2$ regularization
strength, and batch size.

For each fold, training incorporated early stopping based on validation
MAE to mitigate overfitting and prevent unnecessary epochs after
validation error plateaued. A learning rate scheduler with
reduce-on-plateau functionality was implemented to improve convergence
when progress slowed. To increase computational efficiency, median-based
pruning was applied at the fold level, enabling early termination of
underperforming trials when intermediate results were unlikely to
surpass the current best configurations. Upon completion of
optimization, the optimal hyperparameters were selected to train the
final MLP regressor.

=== Performance metrics
<subsubsec3.2.3>
Model performance was quantified using MAE, mean squared error (MSE),
coefficient of determination ($R^2$), and mean absolute percentage error
(MAPE). These metrics evaluate the predictive accuracy of the models by
comparing the experimentally measured surface roughness values against
the values predicted by the learning algorithms across the held-out test
set. MAE was selected as the primary metric because it provides a direct
and interpretable error magnitude in the same units as the response
variable ($mu$m), which aligns with established surface metrology
practices and engineering tolerances. Unlike MSE, MAE does not
excessively penalize infrequent large errors due to squaring, making it
less sensitive to rare outliers resulting from measurement variability
or local surface artifacts. $R^2$ is reported to indicate the proportion
of variance explained by the model; however, it is not used as the sole
selection criterion because it is sensitive to the variance of the
target distribution and does not convey an absolute error scale. MAPE is
included to offer a relative error perspective, but its instability when
measured roughness values approach zero necessitates its use as a
supplementary metric rather than as the optimization objective.
Reporting MAE, MSE, $R^2$, and MAPE together is consistent with
established practices in learning-based AM surface-quality prediction
studies and facilitates robust comparison across modeling approaches
\[2,17,18,20,23\].

== Data augmentation via CGAN model
<subsec3.3>
Experimental datasets for AM surface-quality modeling are frequently
constrained in both size and coverage due to the time-intensive nature
of fabrication and profilometry. The input space expands rapidly with
the inclusion of multiple process variables and surface inclination,
resulting in sparsely sampled regions and diminished generalization of
data-driven predictors. Numerical augmentation has been investigated as
a means to enrich training distributions without a proportional increase
in physical experimentation. However, the effectiveness of augmentation
is highly context-dependent and requires rigorous evaluation to prevent
performance degradation \[11\]. Within this context, CGANs offer a
systematic approach to generate synthetic samples under specified
conditions by learning the conditional distribution of the target
variable given the input descriptors \[12,13\].

Within this framework, CGAN-based augmentation is employed to generate
tabular synthetic data that aligns with the experimental feature space.
The conditioning vector comprises scaled process parameters and the
surface inclination descriptor, while the generator produces a synthetic
roughness value ($R a$) conditioned on these inputs. The discriminator
receives pairs of $\( R a \, upright(bold(x)) \)$ and learns to
distinguish real from synthetic conditional samples, which encourages
the generator to produce outputs consistent with the specified
conditions. This approach is consistent with tabular CGAN methodologies
developed for mixed and multimodal numerical data, where conditional
generation is intended to preserve feature dependencies rather than
generate unconditional samples \[13\]. A schematic overview of the
conditional generation and discrimination workflow used in this study is
shown in Figure~@FIG:6.

#figure(image("figs/Fig6.png"),
  caption: [
    Schematic illustration of the CGAN-based tabular augmentation
    workflow.
  ]
)
<FIG:6>

To ensure a rigorous and unbiased comparison with the predictor, the
hold-out test set remained fixed and was excluded from all stages of
CGAN training, augmentation, and model selection. The CGAN was trained
solely on the real training subset to prevent information leakage from
validation or test data into the synthetic generation process. Following
training, synthetic samples were produced by sampling condition vectors
from the empirical training distribution and introducing a stochastic
perturbation in the normalized feature space. This approach facilitates
exploration of local neighborhoods around observed conditions and
enhances diversity while maintaining physical plausibility within the
scaled feature ranges. The synthetic samples were subsequently combined
with the real training data to create augmented training sets at various
augmentation ratios, enabling analysis of the impact of training-set
enlargement on MLP predictive performance.

The following evaluation investigates whether synthetic enrichment
improves the generalization capability of the MLP regressor described in
Section~@subsec3.2. A fixed hold-out test set, comprising 15% of the
full dataset, was reserved and excluded from all CGAN training,
augmentation, and model selection procedures. The remaining 85% of the
data was divided into a real training subset (70%) and a real validation
subset (15%) prior to augmentation. For each augmentation ratio, the MLP
was trained on the augmented training subset, while the validation
subset remained exclusively real and unchanged. Model selection relied
solely on validation MAE to prevent inadvertent optimization toward test
performance. The hold-out test set was accessed only once for final
reporting of MAE, MSE, $R^2$, and MAPE under the selected configuration.
This protocol ensures that observed performance differences can be
attributed to augmentation effects rather than changes in evaluation
data or selection criteria.

Since synthetic data may introduce bias if considered as reliable as
physical measurements, the training procedure applies reduced sample
weights to synthetic observations during MLP fitting. This weighting
approach aligns with recommendations that augmentation should not
overshadow empirical data, particularly when synthetic samples may
contain model-induced artifacts. It achieves a balance between expanding
data coverage and maintaining fidelity to measured data \[11\].
Additionally, distributional diagnostics were conducted to compare real
and synthetic $R a$ values within the training set, ensuring that
synthetic generation produced plausible roughness ranges. Related
research in industrial defect learning also emphasizes that augmentation
should be accompanied by quality control measures to mitigate the risk
of introducing harmful synthetic samples \[31\].

== Development of the visual decision-support model
<subsec3.4>
Although scalar roughness indicators such as arithmetic mean roughness
($R a$) provide objective quantification of surface quality, a single
numerical value is insufficient for process planning of complex parts.
In FFF, surface quality varies spatially because local inclination
changes across the geometry and interact with printing conditions,
resulting in region-specific roughness. To address this limitation, an
interactive visual decision-support model was developed to convert
pointwise predictions into a geometry-aware surface map. This model
connects tabular inference with intuitive interpretation, enabling users
to identify critical regions, evaluate orientation-driven changes, and
iteratively refine process parameters before fabrication.

After model selection, the best-performing predictor is implemented as
the inference engine within a web-based interface (Fig.~@FIG:7). The
workflow begins with the upload of a user-supplied model (e.g., STL,
OBJ, or 3DS), which is rendered interactively in the browser. The
interface parses the mesh and calculates local surface inclination using
facet normals relative to the build direction. For each surface element,
the inclination angle is determined and combined with user-defined
printing parameters to form the model input vector. The predictor
estimates $R a$ for each surface element, generating a dense roughness
field across the entire geometry. The interface offers both global and
local interpretability: users can select any surface region to access
the predicted roughness and its associated inclination angle
(Fig.~@FIG:8), enabling inspection at the level of individual facets
rather than relying solely on aggregate statistics.

To support rapid interpretation, predictions are visualized on the mesh
as a continuous colormap overlay, transforming numerical outputs into an
immediate spatial preview of expected surface quality (Fig.~@FIG:8).
This approach maintains the original mesh geometry and visualizes
predicted roughness as a colormap overlay, effectively highlighting
gradients and hotspots. Users can rotate, zoom, and pan the model to
examine all surfaces, and the consistent color scale allows direct
comparison of alternatives within a single session.

If the predicted surface roughness does not meet the desired target,
users can adjust printing parameters or modify build orientation by
rotating the model about the three principal axes (Fig.~@FIG:7). Changes
in orientation alter the build direction and, consequently, the
inclination distribution across the mesh; the interface recalculates
inclinations and updates the roughness map accordingly. Because
inference is interactive, users can immediately observe how parameter
adjustments and reorientation affect roughness distribution, making
trade-offs explicit, such as improving one region at the expense of
another. This immediate feedback loop enables efficient joint
exploration of orientation and process settings without repeated
fabrication, reducing reliance on costly trial-and-error and supporting
surface-quality-aware process planning.

#figure(image("figs/Fig7.jpg"),
  caption: [
    Web-based interface for model upload, parameter input, and
    three-axis orientation control
  ]
)
<FIG:7>

#figure(image("figs/Fig8.jpg"),
  caption: [
    Predicted $R a$ colormap rendered on the 3D model, with facet-level
    values via click selection.
  ]
)
<FIG:8>

= Experimental results
<sec4>
This section reports the experimental findings obtained from the
fabricated dataset and provides an exploratory analysis of the measured
surface roughness response. The aim is to characterize the roughness
distribution and to reveal dominant empirical trends with respect to key
variables such as layer height and surface inclination, thereby
motivating the subsequent predictive and interpretability results
presented in the following subsections.

== Exploratory data analysis
<subsec4.1>
An exploratory data analysis (EDA) was conducted to summarize the
measured surface roughness values, verify data integrity, and examine
the empirical relationships between key parameters and the target
variable. The dataset comprises 1566 surface measurements collected from
87 printed specimens. Each observation contains eight numerical inputs
(seven process parameters and surface angle) and one response variable,
the arithmetic mean roughness $R a$.

All variables were inspected for completeness and consistency. The input
space is discrete by construction, since each process parameter is
evaluated at three preset levels and surface angle spans
$0^compose$--$170^compose$ in $10^compose$ increments. This
discretization yields clustered response behavior and motivates the use
of nonlinear predictive models in subsequent analyses.

=== Dataset structure and descriptive statistics
<subsubsec4.1.1>
Table~@tbl2 summarizes descriptive statistics of $R a$. The range and
dispersion indicate sufficient variability for supervised regression,
while the low skewness suggests limited asymmetry; deviations from
normality are instead consistent with the multimodal shape observed in
Fig.~@FIG:9.

#block[
#figure(
  align(center)[#table(
    columns: 4,
    align: (left,left,left,left,),
    table.header([#strong[Statistic]], [#strong[Value]], [], [],),
    table.hline(),
    [Mean], [20.62], [], [],
    [Standard deviation], [8.25], [], [],
    [Minimum], [2.69], [], [],
    [1st quartile (Q1)], [14.21], [], [],
    [Median], [20.11], [], [],
    [3rd quartile (Q3)], [26.76], [], [],
    [Maximum], [46.34], [], [],
    [Skewness], [0.31], [], [],
  )]
  , caption: [Descriptive statistics of the target variable $R a$ (in
  $mu$m).]
  , kind: table
  ) <tbl2>

]
=== Target variable distribution
<Section4.1.2>
The marginal distribution of $R a$ is illustrated in Fig.~@FIG:9 using a
histogram and kernel density estimate. The distribution exhibits
multiple modes, consistent with the presence of distinct roughness
regimes, likely reflecting combinations of discrete process settings and
geometric conditions.

#figure(image("figs/Fig9.png"),
  caption: [
    Distribution of surface roughness ($R a$) shown as a histogram with
    kernel density estimate.
  ]
)
<FIG:9>

=== Feature--target relationships
<Section4.1.3>
Two dominant empirical relationships are highlighted. First, $R a$
increases with layer height (Fig.~@FIG:10), reflecting the increased
prominence of layer-wise stair-stepping as the step size grows. Second,
$R a$ shows a pronounced orientation dependence across surface angle
levels (Fig.~@FIG:11), with a clearly non-monotonic pattern, suggesting
that angle-sensitive effects should be represented explicitly in
predictive modeling.

#figure(image("figs/Fig10.png"),
  caption: [
    Layer height versus $R a$.
  ]
)
<FIG:10>

#figure(image("figs/Fig11.png"),
  caption: [
    Surface angle versus $R a$.
  ]
)
<FIG:11>

=== Summary of EDA findings
<Section4.1.4>
Overall, the EDA indicates that $R a$ is governed by both direct process
effects (e.g., layer height) and geometry-driven effects (surface
angle). The multimodal structure of the target distribution, together
with the nonlinearity observed in feature--target relations, supports
the use of nonlinear learners and motivates evaluating tabular data
augmentation strategies in subsequent sections.

== MLP results with and without CGAN-based tabular augmentation
<subsec4.2>
This subsection reports the predictive performance of the MLP regressor
trained (i) on the experimental dataset only and (ii) on CGAN-augmented
tabular training sets. In all cases, the test set is a fixed hold-out
set and is used only for final reporting. The augmentation ratio was
selected using the validation set by comparing multiple candidate ratios
and choosing the configuration that minimized validation error. The
best-performing model was obtained when the training set was augmented
with a synthetic dataset three times the size of the original training
set.

Figure~@FIG:12 presents measured versus predicted $R a$ values on the
hold-out test set for the MLP trained with real data only. The model
shows a strong agreement with the ideal $y = x$ trend, indicating that
nonlinear relations between process parameters, surface inclination, and
roughness can be learned from the available measurements. However, a
wider dispersion is observed at higher roughness levels, suggesting
increased prediction uncertainty in rougher regimes.

#figure(image("figs/Fig12.png"),
  caption: [
    Measured versus predicted $R a$ on the hold-out test set for the MLP
    trained with real data only.
  ]
)
<FIG:12>

Figure~@FIG:13 shows the corresponding test-set scatter for the selected
CGAN-augmented model. Compared to the real-only model, the augmented
model exhibits a tighter concentration around the ideal line, reflecting
improved generalization on unseen real measurements.

#figure(image("figs/Fig13.png"),
  caption: [
    Measured versus predicted $R a$ on the hold-out test set for the MLP
    trained with CGAN-augmented tabular data.
  ]
)
<FIG:13>

Table~@tbl3 presents the test-set metrics for both experimental
settings. Compared to training exclusively on real data, CGAN-based
augmentation reduces the MAE and increases the explained variance
($R^2$). These findings suggest that conditional synthetic data
enrichment offers advantages in data-limited manufacturing regression,
assuming model selection is conducted on a validation set and the test
set is strictly reserved for final evaluation.

#block[
#figure(
  align(center)[#table(
    columns: 5,
    align: (left,center,center,center,center,),
    [#strong[Training
    data]], [#strong[MAE]], [#strong[MSE]], [#strong[$R^2$]], [#strong[MAPE]],
    [], [\($mu$m)], [\($mu$m$""^2$)], [], [\(%)],
    [Experimental only], [2.200], [10.737], [0.844], [14.19],
    [Experimental + synthetic], [1.752], [6.900], [0.900], [10.89],
  )]
  , caption: [Hold-out test performance of the MLP regressor trained
  with experimental data only and with combined experimental and
  CGAN-synthesized data.]
  , kind: table
  ) <tbl3>

]
Analysis of the validation-based ratio sweep indicates that increasing
the augmentation ratio beyond an optimal threshold degrades model
performance. This outcome is anticipated, as a CGAN approximates the
true conditional data distribution. At moderate augmentation ratios,
synthetic samples enhance coverage of sparsely sampled regions and
reduce model variance. However, at higher ratios, the training set may
become dominated by synthetic patterns, which can amplify minor
generator biases or artifacts. Consequently, the regressor may overfit
to synthetic-specific structures, resulting in increased error on real
test data. Overall, the results demonstrate that CGAN-based augmentation
improves MLP performance when used in a controlled manner and when the
augmentation ratio is selected using validation data.

To examine whether generated samples preserve the target distribution,
Figure~@FIG:14 and Figure~@FIG:15 compare real and synthetic $R a$
values used during training.

#figure(image("figs/Fig14.png"),
  caption: [
    Distribution comparison of $R a$ values between real training data
    and CGAN-generated synthetic samples.
  ]
)
<FIG:14>

#figure(image("figs/Fig15.png"),
  caption: [
    Box-plot comparison of $R a$ values between real training data and
    CGAN-generated synthetic samples.
  ]
)
<FIG:15>

== SHAP results
<subsec4.3>
To enhance the transparency of the selected MLP predictor, which was
trained on both real and synthetic data, Shapley Additive Explanations
(SHAP) were employed to quantify the contribution of each input feature
to the predicted $R a$ values. SHAP offers a consistent, model-agnostic
attribution framework grounded in cooperative game theory, assigning
each feature an additive value that reflects its influence on the
prediction relative to a baseline expectation. All SHAP analyses in this
study were conducted on the hold-out test set to facilitate
interpretation of model behavior on previously unseen experimental data.

Figure~@FIG:16 displays the SHAP summary (beeswarm) plot, which
illustrates the distribution of feature contributions across all test
samples. Each point represents a single test observation; the horizontal
axis indicates whether the feature increased or decreased the predicted
surface roughness, and the color denotes the magnitude of the feature
value from low to high. Figure~@FIG:17 presents the global feature
importance ranking, obtained by aggregating SHAP values across the test
set.

#figure(image("figs/Fig16.png"),
  caption: [
    SHAP summary plot on the hold-out test set for the selected MLP
    model.
  ]
)
<FIG:16>

#figure(image("figs/Fig17.png"),
  caption: [
    Global feature importance on the hold-out test set for the selected
    MLP model, computed as mean absolute SHAP values.
  ]
)
<FIG:17>

= Discussion
<sec5>
This section interprets the predictive performance of an MLP regressor
trained on experimental data and evaluates the effect of CGAN-based
tabular augmentation on generalization to an unchanged hold-out test
set. Model interpretability is further assessed using SHAP to determine
whether the learned relationships correspond with established physical
drivers of FFF surface roughness. The discussion then connects
predictive performance to practical pre-print decision-making using the
developed interactive visualization interface.

The MLP trained solely on experimentally measured samples achieved MAE =
2.20~$mu$m, MSE = 10.737~$mu$m$""^2$, $R^2 = 0.844$, and MAPE = 14.19%
on the hold-out test set (Figure~@FIG:12). The measured versus predicted
scatter is concentrated around the ideal $y = x$ line, which
demonstrates that the model can capture nonlinear relationships among
process parameters, surface angle, and $R a$ within the scope of the
available experimental data.

A systematic increase in dispersion is observed at higher $R a$ values,
indicating greater prediction uncertainty for rougher surfaces. This
trend aligns with the characteristics of FFF processes, where
high-roughness regimes often result from more pronounced coupled
effects, such as increased stair-stepping severity at specific
inclinations and resolution-related factors, such as layer height.
Additionally, these regimes are typically underrepresented in the
dataset, which increases variance in models that rely solely on
data-driven approaches.

Augmenting the real training set with CGAN-generated tabular samples,
while maintaining an unchanged hold-out test set, resulted in improved
predictive accuracy: MAE = 1.752~$mu$m, MSE = 6.900~$mu$m$""^2$,
$R^2 = 0.900$, and MAPE = 10.89% (Figure~@FIG:13). The resulting scatter
plot is more compact around the ideal line, which indicates a reduction
in error magnitude and enhanced consistency on previously unseen real
measurements.

These results support the hypothesis that conditional augmentation
mitigates limited coverage in the joint space defined by process
parameters and surface inclination. Specifically, augmentation reduces
estimator variance by enriching sparsely sampled regions and smoothing
the learned mapping, which benefits neural regressors that are sensitive
to sample density in tabular data. Since model selection and reporting
are performed using an unchanged hold-out test split, the observed
improvement reflects enhanced generalization rather than an evaluation
artifact.

The plausibility of the synthetic data was assessed by comparing the
marginal distribution of generated $R a$ values with those of the real
training targets. The density comparison in Figure~@FIG:14 demonstrates
a close alignment between real and synthetic distributions across the
dominant modes. Additionally, the box plot in Figure~@FIG:15 reveals
similar central tendency and spread. These diagnostics indicate that the
CGAN generated plausible target ranges and largely preserved the global
variability of the measured roughness signal.

However, downstream predictive improvements require not only alignment
of the marginal distribution of $R a$, but also preservation of
conditional relationships between inputs, such as process parameters and
surface inclination, and the target variable. The observed improvement
in hold-out performance provides empirical evidence that the generated
samples maintained sufficient condition-consistency to enhance MLP
training for the evaluated test distribution.

To evaluate the physical credibility and decision-support suitability of
the learned relationships, SHAP analysis was conducted on the selected
MLP predictor (Figures~#ref(<FIG:16>);–@FIG:17). The global ranking, determined
by mean absolute SHAP values, identifies Surface Angle as the primary
contributor, followed by Layer Height. This ordering is consistent with
established FFF surface formation mechanisms: inclination determines the
severity and manifestation of stair-stepping and deposition geometry,
whereas layer height directly influences vertical discretization and the
prominence of layer steps.

The SHAP summary plot (Figure~@FIG:16) further demonstrates that the
influence of surface inclination is not strictly monotonic across the
test samples. Both positive and negative SHAP values are observed for
different angle levels, indicating a geometry-dependent response rather
than a single linear trend. In contrast, layer height displays a more
consistent effect, with higher values generally contributing to
increased predicted roughness. This observation is consistent with the
anticipated rise in staircase amplitude as layer thickness increases.

The SHAP results also offer a mechanistic explanation for the
effectiveness of conditional augmentation in improving generalization.
When surface inclination serves as the primary factor but is influenced
by process settings, underrepresented combinations of inclination and
parameter levels may increase uncertainty within an exclusively
experimental training set. Synthetic data enrichment can address these
gaps, allowing the MLP to learn smoother and more stable conditional
responses that generalize more effectively to unseen measurements.

The achieved accuracy levels demonstrate that surface roughness can be
estimated with high fidelity using a compact set of process parameters
and a geometry-derived inclination descriptor. The observed reduction in
MAE following augmentation indicates that predictive quality can be
improved without additional physical measurements, provided that
augmentation is validated through strict protocols and an unchanged
hold-out test set.

In addition to numerical performance, the developed web-based
visualization interface implements the predictor as a decision-support
tool. By integrating user-defined process settings with mesh-derived
surface inclinations, the system provides real-time previews of
predicted roughness as a color-mapped overlay on the uploaded geometry.
Interactive updates in response to parameter changes and orientation
adjustments facilitate rapid exploration of trade-offs, thereby reducing
reliance on costly trial-and-error cycles during process planning.

Several limitations must be considered when interpreting these results.
The dataset was collected using a fixed machine and material
configuration, which enhances internal consistency but may limit direct
applicability to other printers, nozzle diameters, slicer
implementations, or filament types without further calibration.
Furthermore, although CGAN augmentation improved generalization in the
evaluated setting, synthetic generators only approximate the underlying
data distribution. Therefore, augmentation should be regarded as a model
component requiring validation, rather than as an unlimited substitute
for experimental measurement.

= Conclusion
<sec6>
This study introduced a data-driven framework for predicting arithmetic
mean surface roughness in fused filament fabrication prior to printing.
The framework integrates a structured design of experiments,
standardized surface metrology, supervised learning, conditional data
augmentation, and interactive visualization. This approach enables
surface-quality-aware process planning using a concise set of
controllable parameters and a geometry-derived surface inclination
descriptor.

A primary contribution is the experimentally generated dataset, produced
through systematic variation of process settings and surface angles
combined with consistent profilometry measurements. This dataset
provides a reproducible foundation for benchmarking roughness prediction
in FFF and can serve as a reference for future modeling and comparative
studies.

The predictive results demonstrate that an MLP regressor can learn the
nonlinear mapping from printing parameters and surface inclination to
$R a$, achieving robust generalization on an unseen hold-out test set.
Model interpretation supports physical plausibility; both SHAP analysis
and performance trends confirm that Surface Angle and Layer Height are
the primary determinants of surface roughness within the studied ranges,
consistent with established effects of stair-stepping and resolution in
layered manufacturing.

To mitigate data scarcity associated with metrology-intensive
experimentation, CGAN augmentation was evaluated as a method to enrich
the training distribution in a condition-aware manner. The augmented
training strategy enhanced test-set accuracy relative to the
non-augmented MLP, suggesting that synthetic enrichment can reduce
generalization error under rigorous validation and hold-out evaluation.
Distribution diagnostics demonstrated that generated targets were
broadly consistent with the real roughness distribution, supporting the
plausibility of the synthetic samples used during training.

In addition to predictive accuracy, the study implemented the neural
model as a practical decision-support tool via a web-based GUI.
Designers are able to upload 3D models, specify printing parameters, and
visualize predicted roughness as a colormap mapped onto the mesh. The
interactive modification of build orientation and parameter settings
facilitates rapid exploration of trade-offs and reduces dependence on
costly trial-and-error during process planning.

= Future work
<sec7>
Several extensions could enhance the scope and industrial relevance of
the proposed framework. First, the current approach may be expanded
beyond planar facets to encompass more complex geometries by
incorporating curved surfaces and more detailed local descriptors, such
as curvature or neighborhood-based orientation statistics. This would
enable prediction for intricate, non-planar components.

Second, generalizability should be evaluated across a broader range of
materials and filament formulations. Testing additional polymers, such
as acrylonitrile butadiene styrene (ABS) and polyethylene terephthalate
glycol (PETG), as well as reinforced filaments (e.g., carbon-fiber
composites), would clarify material-dependent effects and support more
robust deployment in diverse application contexts.

Third, the feature space could be expanded by incorporating additional
system-specific variables, such as printer model, nozzle diameter, and
selected slicer settings. These extensions would help quantify
cross-platform variability and support transferring the predictor across
different printing setups with minimal recalibration.

Fourth, the methodology could be adapted to other additive manufacturing
processes, such as stereolithography or selective laser sintering, by
redefining process-appropriate input variables and metrology protocols
while maintaining consistent evaluation and deployment principles.

Finally, integrating in-situ sensing and real-time monitoring, such as
thermal, vibration, or optical signals, could enable online roughness
estimation and closed-loop control. This advancement would transition
the framework from pre-print decision support to adaptive process
control, thereby improving reliability under time-varying disturbances
and machine-specific dynamics.

#heading(level: 1, numbering: none)[Funding]
<funding>
This research did not receive any specific grant from funding agencies
in the public, commercial, or not-for-profit sectors.

#heading(level: 1, numbering: none)[Declaration of competing interest]
<declaration-of-competing-interest>
The authors declare that they have no known competing financial
interests or personal relationships that could have appeared to
influence the work reported in this paper.

#heading(level: 1, numbering: none)[Data availability]
<data-availability>
The dataset used in this study is publicly available on Zenodo:
https:\/\/doi.org/10.5281/zenodo.18827518.

#heading(level: 1, numbering: none)[CRediT authorship contribution
statement]
<credit-authorship-contribution-statement>
#strong[Engin Deniz Erkan:] Conceptualization, Methodology, Software,
Data curation, Investigation, Formal analysis, Validation, Writing --
original draft, Visualization. #strong[Elif Surer:] Conceptualization,
Methodology, Supervision, Project administration, Resources, Writing --
review & editing. #strong[Ulas Yaman:] Conceptualization, Methodology,
Supervision, Project administration, Resources, Writing -- review &
editing.

= Experimental parameter matrix
<experimental-parameter-matrix>
For completeness and reproducibility, this appendix reports the full set
of process-parameter combinations used to fabricate the experimental
specimens under the Box--Behnken design. Table~@tbl4 lists the printing
parameters associated with each specimen identifier.

#block[
#block[
#figure(
  align(center)[#table(
    columns: 8,
    align: (center,center,center,center,center,center,center,center,),
    [#strong[ID]], [#strong[Layer]], [#strong[Extrusion]], [#strong[Outer
    Wall]], [#strong[Infill]], [#strong[Wall]], [#strong[Bed]], [#strong[Fan]],
    [], [#strong[Height]], [#strong[Temp.]], [#strong[Speed]], [#strong[Density]], [#strong[Thickness]], [#strong[Temp.]], [#strong[Speed]],
    [], [\(mm)], [\($""^compose$C)], [\(mm/s)], [\(%)], [\(mm)], [\($""^compose$C)], [\(%)],
    table.cell(align: center, colspan: 8)[Table~ -- continued from
    previous page],
    [#strong[ID]], [#strong[Layer]], [#strong[Extrusion]], [#strong[Outer
    Wall]], [#strong[Infill]], [#strong[Wall]], [#strong[Bed]], [#strong[Fan]],
    [], [#strong[Height]], [#strong[Temp.]], [#strong[Speed]], [#strong[Density]], [#strong[Thickness]], [#strong[Temp.]], [#strong[Speed]],
    [], [\(mm)], [\($""^compose$C)], [\(mm/s)], [\(%)], [\(mm)], [\($""^compose$C)], [\(%)],
    table.cell(align: right, colspan: 8)[Continued on next page...],
    [Object-1], [0.12], [190], [200], [15], [0.42], [60], [80],
    [Object-2], [0.12], [210], [200], [15], [0.42], [60], [80],
    [Object-3], [0.28], [190], [200], [15], [0.42], [60], [80],
    [Object-4], [0.28], [210], [200], [15], [0.42], [60], [80],
    [Object-5], [0.12], [200], [150], [15], [0.42], [60], [80],
    [Object-6], [0.12], [200], [250], [15], [0.42], [60], [80],
    [Object-7], [0.28], [200], [150], [15], [0.42], [60], [80],
    [Object-8], [0.28], [200], [250], [15], [0.42], [60], [80],
    [Object-9], [0.12], [200], [200], [5], [0.42], [60], [80],
    [Object-10], [0.12], [200], [200], [25], [0.42], [60], [80],
    [Object-11], [0.28], [200], [200], [5], [0.42], [60], [80],
    [Object-12], [0.28], [200], [200], [25], [0.42], [60], [80],
    [Object-13], [0.12], [200], [200], [15], [0.36], [60], [80],
    [Object-14], [0.12], [200], [200], [15], [0.48], [60], [80],
    [Object-15], [0.28], [200], [200], [15], [0.36], [60], [80],
    [Object-16], [0.28], [200], [200], [15], [0.48], [60], [80],
    [Object-17], [0.12], [200], [200], [15], [0.42], [55], [80],
    [Object-18], [0.12], [200], [200], [15], [0.42], [65], [80],
    [Object-19], [0.28], [200], [200], [15], [0.42], [55], [80],
    [Object-20], [0.28], [200], [200], [15], [0.42], [65], [80],
    [Object-21], [0.12], [200], [200], [15], [0.42], [60], [60],
    [Object-22], [0.12], [200], [200], [15], [0.42], [60], [100],
    [Object-23], [0.28], [200], [200], [15], [0.42], [60], [60],
    [Object-24], [0.28], [200], [200], [15], [0.42], [60], [100],
    [Object-25], [0.2], [190], [150], [15], [0.42], [60], [80],
    [Object-26], [0.2], [190], [250], [15], [0.42], [60], [80],
    [Object-27], [0.2], [210], [150], [15], [0.42], [60], [80],
    [Object-28], [0.2], [210], [250], [15], [0.42], [60], [80],
    [Object-29], [0.2], [190], [200], [5], [0.42], [60], [80],
    [Object-30], [0.2], [190], [200], [25], [0.42], [60], [80],
    [Object-31], [0.2], [210], [200], [5], [0.42], [60], [80],
    [Object-32], [0.2], [210], [200], [25], [0.42], [60], [80],
    [Object-33], [0.2], [190], [200], [15], [0.36], [60], [80],
    [Object-34], [0.2], [190], [200], [15], [0.48], [60], [80],
    [Object-35], [0.2], [210], [200], [15], [0.36], [60], [80],
    [Object-36], [0.2], [210], [200], [15], [0.48], [60], [80],
    [Object-37], [0.2], [190], [200], [15], [0.42], [55], [80],
    [Object-38], [0.2], [190], [200], [15], [0.42], [65], [80],
    [Object-39], [0.2], [210], [200], [15], [0.42], [55], [80],
    [Object-40], [0.2], [210], [200], [15], [0.42], [65], [80],
    [Object-41], [0.2], [190], [200], [15], [0.42], [60], [60],
    [Object-42], [0.2], [190], [200], [15], [0.42], [60], [100],
    [Object-43], [0.2], [210], [200], [15], [0.42], [60], [60],
    [Object-44], [0.2], [210], [200], [15], [0.42], [60], [100],
    [Object-45], [0.2], [200], [150], [5], [0.42], [60], [80],
    [Object-46], [0.2], [200], [150], [25], [0.42], [60], [80],
    [Object-47], [0.2], [200], [250], [5], [0.42], [60], [80],
    [Object-48], [0.2], [200], [250], [25], [0.42], [60], [80],
    [Object-49], [0.2], [200], [150], [15], [0.36], [60], [80],
    [Object-50], [0.2], [200], [150], [15], [0.48], [60], [80],
    [Object-51], [0.2], [200], [250], [15], [0.36], [60], [80],
    [Object-52], [0.2], [200], [250], [15], [0.48], [60], [80],
    [Object-53], [0.2], [200], [150], [15], [0.42], [55], [80],
    [Object-54], [0.2], [200], [150], [15], [0.42], [65], [80],
    [Object-55], [0.2], [200], [250], [15], [0.42], [55], [80],
    [Object-56], [0.2], [200], [250], [15], [0.42], [65], [80],
    [Object-57], [0.2], [200], [150], [15], [0.42], [60], [60],
    [Object-58], [0.2], [200], [150], [15], [0.42], [60], [100],
    [Object-59], [0.2], [200], [250], [15], [0.42], [60], [60],
    [Object-60], [0.2], [200], [250], [15], [0.42], [60], [100],
    [Object-61], [0.2], [200], [200], [5], [0.36], [60], [80],
    [Object-62], [0.2], [200], [200], [5], [0.48], [60], [80],
    [Object-63], [0.2], [200], [200], [25], [0.36], [60], [80],
    [Object-64], [0.2], [200], [200], [25], [0.48], [60], [80],
    [Object-65], [0.2], [200], [200], [5], [0.42], [55], [80],
    [Object-66], [0.2], [200], [200], [5], [0.42], [65], [80],
    [Object-67], [0.2], [200], [200], [25], [0.42], [55], [80],
    [Object-68], [0.2], [200], [200], [25], [0.42], [65], [80],
    [Object-69], [0.2], [200], [200], [5], [0.42], [60], [60],
    [Object-70], [0.2], [200], [200], [5], [0.42], [60], [100],
    [Object-71], [0.2], [200], [200], [25], [0.42], [60], [60],
    [Object-72], [0.2], [200], [200], [25], [0.42], [60], [100],
    [Object-73], [0.2], [200], [200], [15], [0.36], [55], [80],
    [Object-74], [0.2], [200], [200], [15], [0.36], [65], [80],
    [Object-75], [0.2], [200], [200], [15], [0.48], [55], [80],
    [Object-76], [0.2], [200], [200], [15], [0.48], [65], [80],
    [Object-77], [0.2], [200], [200], [15], [0.36], [60], [60],
    [Object-78], [0.2], [200], [200], [15], [0.36], [60], [100],
    [Object-79], [0.2], [200], [200], [15], [0.48], [60], [60],
    [Object-80], [0.2], [200], [200], [15], [0.48], [60], [100],
    [Object-81], [0.2], [200], [200], [15], [0.42], [55], [60],
    [Object-82], [0.2], [200], [200], [15], [0.42], [55], [100],
    [Object-83], [0.2], [200], [200], [15], [0.42], [65], [60],
    [Object-84], [0.2], [200], [200], [15], [0.42], [65], [100],
    [Object-85], [0.2], [200], [200], [15], [0.42], [60], [80],
    [Object-86], [0.2], [200], [200], [15], [0.42], [60], [80],
    [Object-87], [0.2], [200], [200], [15], [0.42], [60], [80],
  )]
  , caption: [Experimental 3D Printing Parameters]
  , kind: table
  ) <tbl4>

]
]
#block[
#block[
\[1\] Sheoran AJ, Kumar H. Fused deposition modeling process parameters
optimization and effect on mechanical properties and part quality:
Review and reflection on present research. Materials Today: Proceedings
2020;21:1659--72. #link("https://doi.org/10.1016/j.matpr.2019.11.296").

] <ref-SheoranKumar2020>
#block[
\[2\] Batu T, Lemu HG, Shimels H. Application of artificial intelligence
for surface roughness prediction of additively manufactured components.
Materials 2023;16:6266. #link("https://doi.org/10.3390/ma16186266").

] <ref-Batuetal2023>
#block[
\[3\] Rayna T, Striukova L. From rapid prototyping to home fabrication:
How 3D printing is changing business model innovation. Technological
Forecasting and Social Change 2016;102:214--24.
#link("https://doi.org/10.1016/j.techfore.2015.07.023").

] <ref-RaynaStriukova2016>
#block[
\[4\] Ahn D, Kweon J-H, Kwon S, Song J, Lee S. Representation of surface
roughness in fused deposition modeling. Journal of Materials Processing
Technology 2009;209:5593--600.
#link("https://doi.org/10.1016/j.jmatprotec.2009.05.016").

] <ref-Ahnetal2009>
#block[
\[5\] Arnold C, Monsees D, Hey J, Schweyen R. Surface quality of
3D-printed models as a function of various printing parameters.
Materials 2019;12:1970. #link("https://doi.org/10.3390/ma12121970").

] <ref-Arnoldetal2019>
#block[
\[6\] Galetto M, Verna E, Genta G. Effect of process parameters on parts
quality and process efficiency of fused deposition modeling. Computers &
Industrial Engineering 2021;156:107238.
#link("https://doi.org/10.1016/j.cie.2021.107238").

] <ref-Galettoetal2021>
#block[
\[7\] Alsoufi MS, Elsayed AE. How surface roughness performance of
printed parts manufactured by desktop FDM 3D printer with PLA+ is
influenced by measuring direction. American Journal of Mechanical
Engineering 2017;5:211--22.
#link("https://doi.org/10.12691/ajme-5-5-4").

] <ref-AlsoufiElsayed2017>
#block[
\[8\] Biglete ER, Manuel MCE, Dela Cruz JC, Verdadero MS, Diesta JMB,
Miralpez DNG, et al. Surface roughness analysis of 3D printed parts
using response surface modeling. 2020 11th IEEE control and system
graduate research colloquium (ICSGRC), 2020, p. 191--6.
#link("https://doi.org/10.1109/ICSGRC49013.2020.9232561").

] <ref-Bigleteetal2020>
#block[
\[9\] Kandananond K. Surface roughness prediction of FFF-fabricated
workpieces by artificial neural network and box--behnken method.
International Journal of Metrology and Quality Engineering 2021;12:17.
#link("https://doi.org/10.1051/ijmqe/2021014").

] <ref-Kandananond2021>
#block[
\[10\] Pereira RJR, Almeida FA de, Gomes GF. A multiobjective
optimization parameters applied to additive manufacturing: DOE-based
approach to 3D printing. Structures 2023;55:1710--31.
#link("https://doi.org/10.1016/j.istruc.2023.06.136").

] <ref-Pereiraetal2023>
#block[
\[11\] Ekwaro-Osire H, Ponugupati SL, Al Noman A, Bode D, Thoben K-D.
Data augmentation for numerical data from manufacturing processes: An
overview of techniques and assessment of when which techniques work.
Industrial Artificial Intelligence 2025;3:1.
#link("https://doi.org/10.1007/s44244-024-00021-x").

] <ref-Ekwaro-Osire2025>
#block[
\[12\] Douzas G, Bacao F. Effective data generation for imbalanced
learning using conditional generative adversarial networks. Expert
Systems with Applications 2018;91:464--71.
#link("https://doi.org/10.1016/j.eswa.2017.09.030").

] <ref-DouzasBacao2018>
#block[
\[13\] Xu L, Skoularidou M, Cuesta-Infante A, Veeramachaneni K. Modeling
tabular data using conditional GAN. Advances in neural information
processing systems, vol. 32, Curran Associates, Inc.; 2019, p. 7335--45.

] <ref-Xuetal2019>
#block[
\[14\] Park H-S, Tran N-H. A decision support system for selecting
additive manufacturing technologies. Proceedings of the 2017
international conference on information system and data mining, New
York, NY, USA: Association for Computing Machinery; 2017, p. 151--5.
#link("https://doi.org/10.1145/3077584.3077606").

] <ref-ParkTran2017>
#block[
\[15\] Aljabali BA, Shelton J, Desai S. Genetic algorithm-based
data-driven process selection system for additive manufacturing in
industry 4.0. Materials 2024;17:4544.
#link("https://doi.org/10.3390/ma17184544").

] <ref-Aljabalietal2024>
#block[
\[16\] Nazan MA, Ramli FR, Alkahari MR, Sudin MN, Abdullah MA. Process
parameter optimization of 3D printer using response surface method. ARPN
Journal of Engineering and Applied Sciences 2017;12:2291--6.

] <ref-Nazanetal2017>
#block[
\[17\] Shirmohammadi M, Goushchi SJ, Keshtiban PM. Optimization of 3D
printing process parameters to minimize surface roughness with hybrid
artificial neural network model and particle swarm algorithm. Progress
in Additive Manufacturing 2021;6:199--215.
#link("https://doi.org/10.1007/s40964-021-00166-6").

] <ref-Shirmohammadietal2021>
#block[
\[18\] Saad MS, Mohd Nor A, Abd Rahim I, Syahruddin MA, Mat Darus IZ.
Optimization of FDM process parameters to minimize surface roughness
with integrated artificial neural network model and symbiotic organism
search. Neural Computing and Applications 2022;34:17423--39.
#link("https://doi.org/10.1007/s00521-022-07370-7").

] <ref-Saadetal2022>
#block[
\[19\] Deswal S, Narang R, Chhabra D. Modeling and parametric
optimization of FDM 3D printing process using hybrid techniques for
enhancing dimensional preciseness. International Journal on Interactive
Design and Manufacturing (IJIDeM) 2019;13:1197--214.
#link("https://doi.org/10.1007/s12008-019-00536-z").

] <ref-Deswaletal2019>
#block[
\[20\] Faroze F, Srivastava V, Batish A. Integrating RSM and ANN for
surface quality modeling and prediction in fused filament fabrication.
Progress in Additive Manufacturing 2025;10:9371--96.
#link("https://doi.org/10.1007/s40964-025-01167-5").

] <ref-Farozeetal2025>
#block[
\[21\] Akgun G, Ulkir O. Prediction surface roughness of 3D printed
parts using genetic algorithm optimized hybrid learning model. Journal
of Thermoplastic Composite Materials 2024;37:2225--45.
#link("https://doi.org/10.1177/08927057241243364").

] <ref-AkgunUlkir2024>
#block[
\[22\] Kugunavar S, Viralka M, Sangwan KS. Development of a hybrid model
to estimate surface roughness of 3D printed parts. Additive
Manufacturing 2024;92:104368.
#link("https://doi.org/10.1016/j.addma.2024.104368").

] <ref-Kugunavaretal2024>
#block[
\[23\] Cerro A, Romero PE, Yigit O, Bustillo A. Use of machine learning
algorithms for surface roughness prediction of printed parts in
polyvinyl butyral via fused deposition modeling. The International
Journal of Advanced Manufacturing Technology 2021;115:2465--75.
#link("https://doi.org/10.1007/s00170-021-07300-2").

] <ref-Cerroetal2021>
#block[
\[24\] Wafa F, Abdulshahed AM. Prediction of surface roughness in
additive manufacturing using artificial neural networks. The
international journal of engineering & information technology (IJEIT):
Special issue for the international engineering conference (IECMU2021),
\2021. #link("https://doi.org/10.2139/ssrn.4585304").

] <ref-WafaAbdulshahed2021>
#block[
\[25\] Li Z, Zhang Z, Shi J, Wu D. Prediction of surface roughness in
extrusion-based additive manufacturing with machine learning. Robotics
and Computer-Integrated Manufacturing 2019;57:488--95.
#link("https://doi.org/10.1016/j.rcim.2019.01.004").

] <ref-Lietal2019>
#block[
\[26\] Muniz Castro B, Elbadawi M, Ong JJ, Pollard T, Song Z, Gaisford
S, et al. Machine learning predicts 3D printing performance of over 900
drug delivery systems. Journal of Controlled Release 2021;337:530--45.
#link("https://doi.org/10.1016/j.jconrel.2021.07.046").

] <ref-Castroetal2021>
#block[
\[27\] Toorandaz S, Taherkhani K, Liravi F, Toyserkani E. A novel
machine learning-based approach for in-situ surface roughness prediction
in laser powder-bed fusion. Additive Manufacturing 2024;91:104354.
#link("https://doi.org/10.1016/j.addma.2024.104354").

] <ref-Toorandazetal2024>
#block[
\[28\] Moon J, Jung S, Park S, Hwang E. Conditional tabular GAN-based
two-stage data generation scheme for short-term load forecasting. IEEE
Access 2020;8:205327--39.
#link("https://doi.org/10.1109/ACCESS.2020.3037063").

] <ref-Moonetal2020>
#block[
\[29\] He G, Zhao Y, Yan C. Application of tabular data synthesis using
generative adversarial networks on machine learning-based multiaxial
fatigue life prediction. International Journal of Pressure Vessels and
Piping 2022;199:104779.
#link("https://doi.org/10.1016/j.ijpvp.2022.104779").

] <ref-Heetal2022>
#block[
\[30\] Rachmawati SM, Paramartha Putra MA, Jun T, Kim D-S, Lee J-M.
Fine-tuned CNN with data augmentation for 3D printer fault detection.
2022 13th international conference on information and communication
technology convergence (ICTC), 2022, p. 902--5.
#link("https://doi.org/10.1109/ICTC55196.2022.9952484").

] <ref-Rachmawatietal2022>
#block[
\[31\] Farady I, Lin C-Y, Chang M-C. PreAugNet: Improve data
augmentation for industrial defect classification with small-scale
training data. Journal of Intelligent Manufacturing 2024;35:1233--46.
#link("https://doi.org/10.1007/s10845-023-02109-0").

] <ref-Faradyetal2024>
#block[
\[32\] Hanks B, Berthel J, Frecker M, Simpson TW. Mechanical properties
of additively manufactured metal lattice structures: Data review and
design interface. Additive Manufacturing 2020;35:101301.
#link("https://doi.org/10.1016/j.addma.2020.101301").

] <ref-Hanksetal2020>
] <refs>
