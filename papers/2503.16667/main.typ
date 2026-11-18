// Adapted from arXiv:2503.16667v1 by Vendrell-Gallart et al.
// https://arxiv.org/abs/2503.16667v1
// Original work: CC BY 4.0, https://creativecommons.org/licenses/by/4.0/
#set page(paper: "a4", margin: 19mm)
#set text(size: 10pt, lang: "en")
#set par(justify: true)
#set heading(numbering: "1.1")
#set math.equation(numbering: "(1)")
#set table(inset: 3pt)
#title[A preliminary data fusion study to assess the feasibility of Foundation Process-Property Models in Laser Powder Bed Fusion]
#align(center)[Oriol Vendrell-Gallart (1), Nima Negarandeh (1), Zahra Zanjani Foumani (1), Mahsa Amiri (2), Lorenzo Valdevit (2, 3), and Ramin Bostanabad (1, 4)]
#align(center)[University of California, Irvine, CA 92697, USA]
#align(center)[#text(size: 8pt)[(1) Department of Mechanical and Aerospace Engineering · (2) Materials and Manufacturing Technology Program · (3) Department of Materials Science and Engineering · (4) Department of Civil and Environmental Engineering]]
#align(center)[Correspondence: #raw("valdevit@uci.edu"), #raw("raminb@uci.edu")]

#strong[Abstract]

Foundation models are at the forefront of an increasing number of critical applications. In regards to technologies such as additive manufacturing (AM), these models have the potential to dramatically accelerate process optimization and, in turn, design of next generation materials. A major challenge that impedes the construction of foundation process-property models is data scarcity. To understand the impact of this challenge, and since foundation models rely on data fusion, in this work we conduct controlled experiments where we focus on the transferability of information across different material systems and properties. More specifically, we generate experimental datasets from 17-4 PH and 316L stainless steels (SSs) in Laser Powder Bed Fusion (LPBF) where we measure the effect of five process parameters on porosity and hardness. We then leverage Gaussian processes (GPs) for process-property modeling in various configurations to test if knowledge about one material system or property can be leveraged to build more accurate machine learning models for other material systems or properties. Through extensive cross-validation studies and probing the GPs' interpretable hyperparameters, we study the intricate relation among data size and dimensionality, complexity of the process-property relations, noise, and characteristics of machine learning models. Our findings highlight the need for structured learning approaches that incorporate domain knowledge in building foundation process-property models rather than relying on uninformed data fusion in data-limited applications.

#strong[Keywords:] Foundation Models; Transfer Learning; Data Fusion; Additive manufacturing; Gaussian process.

= Introduction
<sec:intro>
The increasing need for lightweight, high-performance materials with complex geometries has driven the advancement of additive manufacturing (AM) technologies \[1\]. Among the different AM processes, laser powder bed fusion (LPBF) is a leading technique for producing metallic components that offer outstanding mechanical properties and design versatility \[2\].

The properties of LPBF-built parts are heavily influenced by various process parameters such as laser power and speed, scan direction, and deposition layer thickness. Fully understanding the complex relationships between process parameters, microstructural evolution, and mechanical properties in LPBF, with sufficient accuracy for effective optimization, remains a significant challenge \[3\]. The vast parameter space inherent in LPBF makes brute-force experimentation impractical. As a result, predictive modeling of process-property relations in LPBF has traditionally relied on domain knowledge and trial-and-error methods \[4\]. Therefore, the development of robust, generalizable models capable of accurately predicting material properties from process parameters is crucial for optimizing AM processes and accelerating material design. This motivates the exploration of foundation process-property models to accelerate the optimization and design of materials with desired properties.

In recent years, foundation models \[5\] ---large-scale machine learning (ML) models capable of generalizing across diverse datasets--- have shown remarkable success in domains such as natural language processing and computer vision where vast amounts of data are readily available. However, in materials science and manufacturing processes such as LPBF, the availability of large, high-quality datasets is a significant challenge. This raises the issue of whether foundation models can be effectively leveraged for material property prediction despite limited data availability.

To address this question, in this work we focus on a controlled environment where we evaluate the transferability of knowledge between two distinct stainless steel (SS) material systems, namely, 17-4 PH SS~and 316L SS. Our underlying hypothesis is that these materials contain transferable process-property information, i.e., knowledge from one system can be leveraged to build more accurate process-property ML models for the other material system. However, this assumption remains largely untested in the literature, particularly with respect to LPBF.

To test our hypothesis, we model process-property relations via Gaussian processes (GPs) whose training data is based on either one or both steel types.

Our studies involve data fusion which we formulate via GPs because they not only are extremely effective in learning from small data, but also have explainable parameters which supports decision making. Our findings have significant implications for materials design and process optimization and they highlight the need for #emph[principled] transfer learning for building foundation process-property models where domain knowledge, such as physics-informed priors or hierarchical modeling \[6\], is leveraged for data fusion.

The rest of the paper is organized as follows. We introduce our material characterization and ML approaches in Section @sec:method and then assess the feasibility of developing foundation process-property models in Section @sec:results. We conclude the paper in Section @sec:conclusion by summarizing our contributions and providing future research directions.

= Methods
<sec:method>
We first elaborate on the experimental data generation process in Section @sec:AM_design and then in Sections @sec:GPs_intro and @sec:MTGPs_intro provide some background on GPs which serve as the workhorse of our studies. Finally, our approach is explained in Section @sec:ML_method where we assess the potential advantages of learning two mechanical properties (namely, porosity and hardness) of 17-4 PH SS~and 316L SS~under various settings.

== Experimental Data Collection
<sec:AM_design>
The 17-4 PH SS~data used in this study is derived from \[6\] which consists of $270$ process parameter combinations generated using a Sobol sequence. These combinations include variations in laser power ($p$) ranging from $80$ to $400$ W, laser scan speed ($v$) from $150$ to $1500$ mm/s, powder layer thickness ($l$) from $20$ to $75$ $mu$m, hatch spacing ($h$) from $70$ to $120$ $mu$m, and two scan rotation angles ($s r$) of $67$ or $90$ degrees. These parameters were used to fabricate $270$ cube-shaped samples ($2 times 2 times 2$ mm), numbered $1$ to $270$, using the HT setting outlined in \[6\]. Detailed information on the HT setting and the $270$ combinations can be found in \[6\].

To study the feasibility of information transfer from 17-4 PH SS~to 316L SS~and vice versa, an additional $270$ cube-shaped 316L SS~samples are fabricated for this study. These samples are built using the same process conditions and manufacturing approach as 17-4 PH SS, detailed in \[6\].

We analyze the microstructural images of the $270$ cuboids from each material to extract porosity features. In our studies we consider two cases: extracting the average porosity ($phi.alt$) using simple thresholding or conducting image analysis to extract a set of features that describe the spatial distribution and geometry of pores (e.g. statistics of pore radius, perimeter, location, etc.). For the latter case, the images are first cropped to eliminate the borders and then binarized via Otsu's thresholding method \[7\]. Morphological dilation \[8\] is applied to ensure distinct separation of pores, followed by the watershed algorithm \[9\] to segment individual pores, see Figure @fig:pores. Connected component analysis \[10\] labels each pore region, and the area of each pore is calculated by counting its pixels. The total porosity ($phi.alt$) is determined as the ratio of the combined pore area to the total image area, expressed as a percentage. For brevity, in Section @sec:results we present the results for the former case and suffice to only discussing the outcomes of our studies for the latter case.

#figure([#figure(image("graphics/original.png"),
    caption: [
      Microstructural image
    ]
  )
  <fig:image1>

  #figure(image("graphics/contours-blue.png"),
    caption: [
      Pore contours
    ]
  )
  <fig:image2>

  ],
  caption: [
    Pores extracted from the microstructural image of a cuboid sample made out of 17-4 PH SS.
  ]
)
<fig:pores>

#figure([#figure(image("graphics/Hardness_174.png"),
    caption: [
      17-4 PH SS
    ]
  )
  <fig:hardness_174>

  #figure(image("graphics/Hardness-136.png"),
    caption: [
      316L SS
    ]
  )
  <fig:hardness_316>

  ],
  caption: [
    Hardness maps and optical microscopy images of representative samples for (a) 17-4 PH SS~and (b) 316L SS. We use distinct colors for the hardness maps to aid with visualization and comparison of the hardness range across the two material systems.
  ]
)
<fig:hardness_maps>

In addition to the microstructural analysis, we conducted Vickers microindentation hardness measurements on a $6 times 6$ grid on each cuboid to obtain its hardness map, see Figure @fig:hardness_maps. We take the median hardness value ($H V$) in each hardness map to reduce not only the dimensionality, but also the sensitivity to outliers since pores significantly affect the indentation results.

== Gaussian Processes
<sec:GPs_intro>
GPs \[11\] are probabilistic models that assume the training data follows a multivariate normal distribution, where the mean vector and covariance matrix are functions of the inputs. Consider a training dataset $ {bold(x)^(\( i \)) \, y^(\( i \))} zws_(i = 1)^n$, where $bold(x) = \[ x_1 \, . . . \, x_(d x) \] in bb(X) subset bb(R)^(d x)$ represents the input variables, and $y^(\( i \)) = y \( bold(x)^(\( i \)) \) in bb(R)$ denotes the corresponding response#footnote[Superscripts enclosed in parentheses enumerate samples. For example, $x^(\( i \))$ refers to the $i^(t h)$ sample in the dataset, whereas $x_i$ represents the $i^(t h)$ component of the vector $bold(x) = \[ x_1 \, dots.h.c \, x_(d x) \]$.]. Given $bold(y) = \[ y^(\( 1 \)) \, dots.h.c \, y^(\( n \)) \]^T$ and $bold(X)$, where the $i^(t h)$ row corresponds to $bold(x)^(\( i \))$, our objective is to predict $y \( bold(x)^(*) \)$ at an arbitrary point $bold(x)^(*) in bb(X)$.

Under this framework, we assume that $bold(y)$ is a realization of a GP with the following parametric mean and covariance functions:

$ bb(E) \[ y \( bold(x) \) \] = m \( bold(x) \; bold(beta) \) \, $ <eq:gp-mean>

$ upright("cov") (y \( bold(x) \) \, y \( bold(x)' \)) = c \( bold(x) \, bold(x)' \; sigma^2 \, bold(theta) \) = sigma^2 r \( bold(x) \, bold(x)' \; bold(theta) \) $ <eq:gp-cov>

where $bold(beta)$, $sigma^2$, and $bold(theta)$ are the parameters of the mean and covariance functions. The mean function in GPs can take various forms, from simple polynomials to intricate structures like feed-forward neural networks (FFNN). However, many GP applications often use a constant mean function $m \( upright(bold(x)) \; bold(beta) \) = beta$ which suggests that the predictive power of the GP mainly depends on its kernel function.

In the covariance function, $sigma^2$ stands for the process variance, and $r \( dot.op \, dot.op \)$ is the correlation function parametrized by $bold(theta)$. Popular choices for $r \( dot.op \, dot.op \)$ include the Gaussian, power exponential, and Matérn correlation functions. In our approach, we utilize the Gaussian kernel:

$ r (bold(x) \, bold(x)' \; bold(omega)) = exp {- sum_(i = 1)^(d x) 10^(omega_i) \( x_i - x'_i \)^2} $ <eq:rbf-kernel>

where $omega = bold(theta)$. The inductive bias that the kernels encode into the learning process is that close-by input vectors $bold(x)$~and $bold(x)'$ have similar (i.e., correlated) output values. The degree of this correlation is quantified by the interpretable length-scale (aka roughness) parameters, where the magnitude of $10^(omega_i)$ is directly related to the response fluctuations along $x_i$.

To estimate the parameters of a GP, we leverage maximum likelihood estimation (MLE) which is equivalent to minimizing the negative of the marginal likelihood:

$ \[ hat(bold(beta)) \, hat(sigma)^2 \, hat(bold(theta)) \] & = "argmin"_(bold(beta) \, sigma^2 \, bold(theta)) quad 1 / 2 log \( \| bold(C) \| \) + 1 / 2 \( bold(y) - bold(m) \)^T bold(C)^(- 1) \( bold(y) - bold(m) \) $ <eq:map-gp>

where $bold(C)$ is the covariance matrix with entries $C_(i j) = c \( bold(x)^(\( i \)) \, bold(x)^(\( j \)) \; sigma^2 \, bold(theta) \)$ and $bold(m)$ is an $n times 1$ vector whose $i^(t h)$ element is $m_i = m \( bold(x)^(\( i \)) \; bold(beta) \)$. Once the parameters are estimated, predictions at a new point $bold(x)^(*)$ are obtained using:

$ bb(E) \[ y \( bold(x)^(*) \) \] = m \( bold(x)^(*) \; hat(bold(beta)) \) + c \( bold(x)^(*) \, bold(X) \; hat(bold(theta)) \, hat(sigma)^2 \) bold(C)^(- 1) \( bold(y) - bold(m) \) $ <eq:gp-mean-scalar>

$ upright("cov") \( y \( bold(x)^(*) \) \, y \( bold(x)^(*) \) \) & = c \( bold(x)^(*) \, bold(x)^(*) \; hat(bold(theta)) \, hat(sigma)^2 \) - c \( bold(x)^(*) \, bold(X) \; hat(bold(theta)) \, hat(sigma)^2 \) bold(C)^(- 1) c \( bold(X) \, bold(x)^(*) \; hat(bold(theta)) \, hat(sigma)^2 \) $ <eq:gp-var-scalar>

where $c \( bold(x)^(*) \, bold(X) \; hat(bold(theta)) \, hat(sigma)^2 \)$ represents the covariance between $bold(x)^(*)$ and the training points.

== Multi-Task Gaussian Processes (MTGPs)
<sec:MTGPs_intro>
MTGPs' \[12\] goal is to model multiple correlated tasks (outputs) simultaneously. Let $bold(y) \( bold(x) \) = \[ y_1 \( bold(x) \) \, dots.h \, y_G \( bold(x) \) \]$ represent $G$ tasks where each task $y_g \( bold(x) \)$ is a GP. Then, the joint covariance function of a MTGP can be defined as:

$ upright("cov")_(upright("MT")) \( y_g \( bold(x) \) \, y_(g') \( bold(x)' \) \) = c \( bold(x) \, bold(x)' \; sigma^2 \, bold(theta) \) c_(g g') $

where $c \( bold(x) \, bold(x)' \; sigma^2 \, bold(theta) \)$ is the base kernel (e.g., RBF) and $c_(g g')$ is a look-up table encoding correlations between $g$ and $g'$. Thus, the covariance matrix of the training data is $bold(C)_(M T) = upright(bold(C)) ⊗ bold(C)_T$, where $⊗$ denotes Kronecker product \[13\] and $bold(C)_T in bb(R)^(G times G)$ is a positive semi-definite matrix learned during training.

Given observations ${ bold(x)^(\( i \)) \, bold(y)_g^(\( i \)) }_(i = 1)^n$ with $g = 1 \, dots.h \, G$, the posterior predictive distribution for a new input $bold(x)^(*)$ is defined by the following mean vector and covariance matrix:

$ bb(E) \[ bold(y) \( bold(x)^(*) \) \] = m \( bold(x)^(*) \; hat(bold(beta)) \) + \( c \( bold(x)^(*) \, bold(X) \; hat(bold(theta)) \, hat(sigma)^2 \) ⊗ bold(C)_T \) bold(C)_(M T)^(- 1) \( bold(y) - bold(m) \) $ <eq:gp-mean-multi>

$  & upright("cov") \( bold(y) \( bold(x)^(*) \) \, bold(y) \( bold(x)^(*) \) \) = c \( bold(x)^(*) \, bold(x)^(*) \; hat(bold(theta)) \, hat(sigma)^2 \) ⊗ bold(C)_T\
 & quad - #scale(x: 120%, y: 120%)[\(] c \( bold(x)^(*) \, bold(X) \; hat(bold(theta)) \, hat(sigma)^2 \) ⊗ bold(C)_T #scale(x: 120%, y: 120%)[\)] bold(C)_(M T)^(- 1) #scale(x: 120%, y: 120%)[\(] c \( bold(X) \, bold(x)^(*) \; hat(bold(theta)) \, hat(sigma)^2 \) ⊗ bold(C)_T #scale(x: 120%, y: 120%)[\)] $<eq:gp-var-multi>

where $bold(y)^(\( i \)) = { y_1^(\( i \)) \, dots.h \, y_g^(\( i \)) } \, forall g = 1 \, dots.h \, G$, and $bold(m)$ is an $\( n times G \) times 1$ vector of mean values.

== Data Fusion for Process-Property Modeling
<sec:ML_method>
Central to the development of foundation process-property models are two key questions: (1) whether information can be transferred from one material to another, and (2) whether information can be transferred between material properties by leveraging their correlations, given a shared input feature space. Addressing these questions is critical for enabling generalization across diverse material systems and properties, ultimately accelerating materials design and process optimization.

To analyze these aspects via small datasets, we argue that an explainable framework is essential --- one that not only provides accurate predictions but also offers insights into the underlying structure of the data. GPs are particularly well-suited for this purpose due to their inherent explainability, which allows for the interpretation of relationships between inputs and outputs, as well as the quantification of uncertainties. In this study, we employ GPs in two configurations, namely, single-output GPs (SOGPs) and MTGPs, both with and without data fusion to systematically explore these questions and uncover the mechanisms governing transferability and correlations in material systems.

In our studies, we build SOGPs independently for each property---$H V$~and $phi.alt$---under two scenarios: $\( 1 \)$ using data from a single material (17-4 PH SS~ or 316L SS) and $\( 2 \)$ using fused data from both materials. These models serve as baselines to evaluate the impact of data fusion on predicting a single material property. The assumption we aim to test via these studies is that fusing materials data increases the generalizability of ML models. The physical justification behind this assumption is that 17-4 PH SS~and 316L SS~alloys share some correlations in terms of how their mechanical properties are affected by LPBF process parameters.

In addition to SOGPs, we use MTGPs to investigate the potential benefits of property correlation. Specifically, we use MTGPs to jointly learn $phi.alt$~and $H V$~using either data from one material or fused data from two alloys.

For combining the two materials data, we follow \[14\] where data fusion is converted to a latent space learning problem. This conversion is achieved by augmenting each input with an additional categorical variable, $s$, which represents the source of the input---in our case, the material type, specifically $s in {' upright("17-4 PH SS")' \,' upright("316L SS")' }$. Subsequently, we concatenate the training data from all sources to build a fused model. Once trained, predicting the objective function value at $bold(x)^(*)$ for material $j$ involves concatenating the query point with the corresponding categorical variable $s$ and feeding the combined input into the fused model.

To effectively handle the added categorical feature with GPs, we modify the method proposed in \[15\] where high-dimensional quantitative priors are first assigned to categorical variables and then these priors are passed through a parametric embedding function to generate a low-dimensional latent representation. Since we only have two types of material in this paper, our assigned priors are only one-dimensional (e.g., one-hot encoding) which reduces the parameter number of the embedding function to one. While maintaining explainability, this choice dramatically reduces the number of hyperparameters and, in turn, reduces potential overfitting issues.

To ensure robust evaluation, we use $5$-fold cross-validation (CV) to calculate root mean squared error (RMSE): $ upright("RMSE") = sqrt(1 / n_(t e s t) sum_(i = 1)^(n_(t e s t)) \( y^(\( i \)) - hat(y)^(\( i \)) \)^2) $ where $y^(\( i \)) = y \( bold(x)^(*)^(\( i \)) \)$ and $hat(y)^(\( i \)) = bb(E) \[ y \( bold(x)^(*)^(\( i \)) \) \]$ represents the output and predicted value for test sample $bold(x)^(*)$, respectively, and $n_(t e s t)$ is the number of test samples.

By comparing the performance of SOGPs and MTGPs, with and without data fusion, we aim to test two hypotheses: (1) combining data from 17-4 PH SS~and 316L SS~improves predictive accuracy by leveraging some underlying shared relation in the process-property links, and (2) jointly modeling $phi.alt$~and $H V$~enhances predictive accuracy of both properties by capturing correlations between them. This systematic evaluation provides insights into the feasibility of transfer learning and data fusion in additive manufacturing, particularly in data-limited scenarios, and highlights the role that explainable models play in building robust foundation process-property models.

= Results and Discussions
<sec:results>
We begin by exploring the relationships between process parameters and material properties in Section @sec:data-correlation, highlighting the stochasticity of the data and the potential for process-property modeling. Next, we compare the performance of different model configurations in Section @sec:models-comp, focusing on their ability to generalize across the two material systems and two mechanical properties. We then analyze the explainable parameters of GPs to gain insights into the underlying structure-property relationships in Section @sec:gp-interpret. Finally, we discuss the implications of our findings for data fusion and transfer learning in Section @sec:results-discussion, emphasizing the need for principled approaches that incorporate domain knowledge.

== Correlation Analyses
<sec:data-correlation>
To understand the relationships between process parameters and material properties, we first analyze the correlation between the two mechanical properties and volumetric energy density (VED) which is an engineered feature designed to study the compound effect of multiple process parameters on the LPBF-built part. VED is defined as: $ V E D = frac(p, v dot.op h dot.op l) $

Figure @fig:material-property-correlations shows scatter plots of VED against $phi.alt$~and $H V$, with data points color-coded based on the material type (17-4 PH SS~and 316L SS). These plots reveal the stochasticity of the data, as well as the presence of underlying trends that suggest a correlation between VED and the properties. As demonstrated in prior works \[16\], \[17\], this indicates that process-property models can be developed to predict material behavior.

#figure(image("graphics/input-correlations.png"),
  caption: [
    Left: correlations between VED (Log scale) and porosity ($phi.alt$) and hardness ($H V$) properties. Center: cross-material correlations (log scale) for 17-4 PH SS~and 316L SS~properties. Right: cross-property correlations (log scale) within 17-4 PH SS~and 316L SS.
  ]
)
<fig:material-property-correlations>

While VED is a very useful engineered featured that simplifies the visualization of the complex effects that process parameters have on a property of interest, it prevents designers to probe the impact of individual process parameters on the properties. To address this issue, prior work has leveraged data-driven techniques \[6\], \[18\], \[19\] where multiple samples are first built under various combinations of process parameters and then their properties (e.g., hardness and porosity) are obtained via appropriate characterization methods. Afterwards, the resulting dataset is used to build ML models that aim to learn the relation between process parameters and the characterized properties. We follow a similar approach in this paper.

#figure(
  align(center)[#table(
    columns: 6,
    align: (center,center,center,center,center,center,),
    table.header([3-6], table.cell(align: center, colspan: 2)[17-4 PH SS], table.cell(align: center, colspan: 2)[316L SS], [],),
    table.hline(),
    [3-6], [], [$phi.alt$], [$H V$], [$phi.alt$], [$H V$],
    table.cell(align: center, rowspan: 2)[17-4 PH SS], [$phi.alt$], [1.00], [-0.83], [0.66], [-0.31],
    [$H V$], [], [1.00], [-0.53], [0.02],
    table.cell(align: center, rowspan: 2)[316L SS], [$phi.alt$], [], [], [1.00], [-0.71],
    [$H V$], [], [], [], [1.00],
  )]
  , caption: [Pearson correlation coefficients for 17-4 PH SS~and 316L SS.]
  , kind: table
  ) <tab:pearson>

To further investigate the transferability of information across material systems and properties, we analyze the correlations between $phi.alt$~and $H V$~for each material. The corresponding scatter plots are provided in Figure @fig:material-property-correlations, which indicates that $H V$~and $phi.alt$~are inversely correlated in each material system: in both 17-4 PH SS~and 316L SS, $H V$~gradually decreases as $phi.alt$~increases up to a certain value after which the drop in the $H V$~is substantial. This is an expected behavior since highly porous samples have small hardness and strength.

Interesting trends are observed across the two materials: while there is a weak positive correlation between porosity values, the measured $H V$~values for 17-4 PH SS~and 316L SS~seem to be negatively correlated. That is, on average, a particular change in process parameters increases the $H V$~of 17-4 PH SS~while decreasing that of 316L SS.

#figure(
  align(center)[#table(
    columns: 6,
    align: (center,center,center,center,center,center,),
    table.header([3-6], table.cell(align: center, colspan: 2)[17-4 PH SS], table.cell(align: center, colspan: 2)[316L SS], [],),
    table.hline(),
    [3-6], [], [$phi.alt$], [$H V$], [$phi.alt$], [$H V$],
    table.cell(align: center, rowspan: 2)[17-4 PH SS], [$phi.alt$], [1.00], [-0.76], [0.21], [-0.35],
    [$H V$], [], [1.00], [0.05], [-0.58],
    table.cell(align: center, rowspan: 2)[316L SS], [$phi.alt$], [], [], [1.00], [-0.47],
    [$H V$], [], [], [], [1.00],
  )]
  , caption: [Spearman correlation coefficients for 17-4 PH SS~and 316L SS.]
  , kind: table
  ) <tab:sperman>

To quantify these trends, Table @tab:pearson and Table @tab:sperman report the Pearson and Spearman rank correlations, respectively. These results confirm a strong negative cross-property correlation within each material system---e.g., Pearson correlation between $phi.alt$~and $H V$~for 17-4 PH SS~is -0.83---, reinforcing that increased porosity leads to lower $H V$~in both alloys. However, cross-material correlations for individual properties are notably weaker than within-material trends---e.g., Spearman correlation between 17-4 PH SS~and 316L SS~for $phi.alt$~is 0.21.

== GP-based Process-Property Models
<sec:models-comp>
We train SOGPs---predicting $phi.alt$~or $H V$~separately---and MTGPs---jointly predicting $phi.alt$~and $H V$---with and without data fusion. As shown in Table @tab:rmse-table, the performance of these six models is quantified via RMSE averaged across 5-fold cross-validation.

#figure(
  align(center)[#table(
    columns: 5,
    align: (center,center,center,center,center,),
    table.header([Model], [Train], [Test], [#strong[$phi.alt$$\( % \)$]], [#strong[$H V$~$\( H V 0.5 \)$]],),
    table.hline(),
    table.cell(rowspan: 4)[SOGP], [17-4 PH SS], [17-4 PH SS], [2.18], [17.82],
    [316L SS], [316L SS], [2.15], [8.41],
    table.cell(rowspan: 2)[Fused Data], [17-4 PH SS], [2.38], [18.01],
    [316L SS], [1.84], [8.6],
    table.cell(rowspan: 4)[MTGP], [17-4 PH SS], [17-4 PH SS], [2.35], [17.89],
    [316L SS], [316L SS], [1.94], [8.21],
    table.cell(rowspan: 2)[Fused Data], [17-4 PH SS], [6.14], [18.35],
    [316L SS], [2.12], [8.92],
  )]
  , caption: [RMSE comparison for each GP configuration using 5-fold cross-validation.]
  , kind: table
  ) <tab:rmse-table>

First, we analyze the impact of data fusion by comparing models trained on either one or two materials data. Using fused data slightly increases RMSE of SOGPs for both properties in 17-4 PH SS: from $2.18 thin %$ to $2.38 thin %$ for $phi.alt$~and from $17.82 thin H V 0.5$ to $18.01 thin H V 0.5$ for hardness. In the case of 316L SS, SOGP with fused data slightly improves $phi.alt$~prediction but worsens $H V$~prediction. For MTGPs, data fusion's effects are more pronounced, particularly for 17-4 PH SS. The $phi.alt$~RMSE jumps from $2.35 thin %$ to $6.14 thin %$, and $H V$~RMSE also increases from $17.89 thin H V 0.5$ to $18.35 thin H V 0.5$. Similarly, data fusion is ineffective for 316L SS~as a single-material MTGP predicts both $phi.alt$~and $H V$~better than a bi-material MTGP. These results suggest that data fusion does not consistently enhance predictive performance in our application since the GPs struggle to generalize across materials when trained on the fused dataset.

Next, we compare MTGP to SOGP to assess the effect of incorporating cross-property modeling. In the case of 17-4 PH SS, SOGP achieves slightly lower RMSEs ($2.18 thin %$ and $17.82 thin H V 0.5$) compared to MTGP trained on 17-4 PH SS~($2.35 thin %$ and $17.89 thin H V 0.5$), while for 316L SS~we observe the opposite and MTGP obtains slightly lower RMSEs ($1.94 thin %$ and $8.21 thin H V 0.5$) than the ones obtained in SOGP ($2.15 thin %$ and $8.41 thin H V 0.5$). These results indicate that MTGP does not consistently outperform SOGP and vice versa; suggesting that the correlations between $phi.alt$~and $H V$~are either very small, or cannot be learned via our MTGPs. The latter case can be due to a number of factors such as simplicity of our covariance function or lack of data.

Finally, we compare the SOGP model trained on fused data with the MTGP model trained on fused data to assess the impact of both cross-material and cross-property correlations. We observe that for both properties ($phi.alt$~ and $H V$) evaluated on each of the materials MTGP model exhibits worse RSMEs than the SOGPs, confirming that MTGPs fail to leverage the correlations hidden in the data.

#figure(
  align(center)[#table(
    columns: 8,
    align: (left,center,center,center,center,center,center,center,),
    table.header([Method], [Material], [$p$], [$v$], [$l$], [$h$], [$s r$], [$s$],),
    table.hline(),
    table.cell(rowspan: 3)[SOGP $phi.alt$], [17-4 PH SS], [-1.06], [-0.84], [-1.14], [-1.92], [-2.30], [-],
    [316L SS], [-0.42], [-0.24], [-0.66], [-0.44], [-2.17], [-],
    [Fused Data], [-0.83], [-0.71], [-1.10], [-1.55], [-2.31], [0.93],
    table.cell(rowspan: 3)[SOGP $H V$], [17-4 PH SS], [-0.90], [-1.05], [-1.95], [-2.32], [-2.32], [-],
    [316L SS], [-0.83], [-0.50], [-2.22], [-2.18], [-2.15], [-],
    [Fused Data], [-0.98], [-1.19], [-2.27], [-2.36], [-2.36], [1.30],
    table.cell(rowspan: 3)[MTGP], [17-4 PH SS], [-0.98], [-1.08], [-1.23], [-2.32], [-2.31], [-],
    [316L SS], [-0.76], [-0.56], [-1.57], [-1.65], [-2.15], [-],
    [Fused Data], [-1.20], [-1.14], [-1.97], [-2.34], [-2.36], [1.37],
  )]
  , caption: [Learned lengthscale parameters for input features across SOGP and MTGP models.]
  , kind: table
  ) <tab:lengthscale_params>

#figure([#figure(image("graphics/power-hardness-all.png"),
    caption: [
      Hardness ($H V$) predictive posterior distribution as a function of laser power ($p$). Left: SOGP. Right: MTGP.
    ]
  )
  <fig:power-hardness-all>

  #figure(image("graphics/speed-hardness-all.png"),
    caption: [
      Hardness ($H V$) predictive posterior distribution as a function of laser scan speed ($v$). Left: SOGP. Right: MTGP.
    ]
  )
  <fig:speed-hardness-all>

  ],
  caption: [
    Marginal feature analysis of Hardness ($H V$) predictive posterior distributions for SOGP and MTGP models.
  ]
)
<fig:marginal-hardness>

Overall, our results indicate that data fusion does not significantly improve predictive accuracy, and incorporating cross-property correlations in the MTGP through a shared kernel structure does not lead to better performance than the SOGP models. That is, the two datasets entail sufficiently distinct relationships between process parameters and properties that a bi-material model does not learn a robust shared pattern that outperforms material-specific models. The complex relationship between $phi.alt$~and $H V$~is influenced by microstructural differences between 17-4 PH SS~ and 316L SS---such as variations in grain size, thermal history, and phase composition---limiting the effectiveness of a generalized modeling approach.

The findings align with the observations from Section @sec:data-correlation, where Pearson and Spearman correlations indicate stronger relationships within single-material systems compared to cross-material systems and cross-property relationships. Simply combining datasets from different materials does not necessarily lead to improved predictions in LPBF, even when the materials share similar processing conditions.

To further confirm our results, we also explore the use of a richer set of features extracted from the porosity images (e.g., pore radius, pore location), as outlined in Section @sec:AM_design, to potentially improve predictive accuracy. However, the results obtained from this richer feature set are comparable to those achieved using the average porosity, indicating that considering additional responses (which increase complexity too) do not provide a significant performance boost. For brevity, we do not report these results as they would be very similar to the above descriptions.

#figure([#figure(image("graphics/power-porosity-all.png"),
    caption: [
      Porosity ($phi.alt$) predictive posterior distribution as a function of laser power ($p$). Left: SOGP. Right: MTGP.
    ]
  )
  <fig:power-porosity-all>

  #figure(image("graphics/speed-porosity-all.png"),
    caption: [
      Porosity ($phi.alt$) predictive posterior distribution as a function of laser scan speed ($v$). Left: SOGP. Right: MTGP.
    ]
  )
  <fig:speed-porosity-all>

  ],
  caption: [
    Marginal feature analysis of Porosity ($phi.alt$) predictive posterior distributions for SOGP and MTGP models.
  ]
)
<fig:marginal-porosity>

== Interpretation of Model Parameters
<sec:gp-interpret>
Results from Section @sec:models-comp do not show significant performance improvement from fusing the two material systems. In this Section, we investigate the hyperparameters of our GPs to assess whether they point to the same conclusion. Specifically, we analyze the lengthscale hyperparameters in Equation @eq:rbf-kernel, i.e., $bold(omega)$, to understand the underlying feature relative importance for process-property modeling. Table @tab:lengthscale_params shows the lengthscale values for the SOGPs and MTGPs.

We first analyze the impact of data fusion by comparing the lengthscale parameters for each bi-material model with its corresponding single-material version. The lengthscale parameter corresponding to the categorical source indicator variable (i.e., $s$) in the bi-material models is significantly larger than the largest lengthscales corresponding to the process parameters. For example, in the SOGP $H V$~model the lengthscale for $s$ is $1.30$ while for $p$ is $- 0.98$. Such a difference indicates that the two materials are effectively independent since for the covariance function in Equation @eq:rbf-kernel a large $omega_i$ indicates that the correlations die out very quickly as feature $i$ varies.

Next, we asses the effect of incorporating cross-property relationships into the model by comparing MTGPs to SOGPs. While there are some differences, most of the lengthscale parameters have similar values. For example, the lengthscale for $h$ is $- 0.44$ in the SOGP $phi.alt$~316L SS~model and $- 1.65$ in the MTGP 316L SS~model. Unlike $h$, the lengthscale for $v$ is $- 1.05$ in SOGP $H V$~17-4 PH SS~and $- 1.08$ in MTGP. We also observe that excluding $s$ in the bi-material models, $p$ and $v$ are the most important process parameters in terms of affecting the responses while $h$ and $s r$ are the least important ones. This is true across all SOGP and MTGP models, although the exact order is not always preserved---e.g., for 17-4 PH SS~in the SOGP $phi.alt$~model $v$ ($- 0.84$) has more effect on the properties than $p$ ($- 1.06$) while in the MTGP model $p$ ($- 0.98$) is slightly more important than $v$ ($- 1.08$).

In MGTP we also analyze the off-diagonal term of $bold(C)_T$, which captures the corelation between $phi.alt$~and $H V$. For each of the three MGTP models (17-4 PH SS, 316L SS~and Fused Data), the off-diagonal term is negative and it indicates a negative correlation between the two properties. This is aligned with the Pearson and Spearman coefficients analyzed in Section @sec:data-correlation. Nonetheless, this cross-property correlation does not improve the performance of the model.

Building on the above analysis, we select the two most important process parameters---$p$ and $v$--- and visualize their effects on the properties while fixing all the other parameters at their median values. We provide the plots for three conditions: using only 17-4 PH SS, using only 316L SS, and combining both material systems through data fusion. The results are shown in Figures @fig:power-hardness-all, @fig:speed-hardness-all, @fig:power-porosity-all, @fig:speed-porosity-all where we also show the training samples (note that the training data involve simultaneous variations in all parameters and should not be directly compared to the illustrated models' predictions).

We see in Figure @fig:power-hardness-all that the two materials exhibit different trends: as $p$ increases 17-4 PH SS~becomes harder while that hardness of316L SS~slightly decreases. Looking at Figure @fig:speed-porosity-all we observe that the porosity of 17-4 PH SS~and 316L SS~depend on $v$ quite differently. Comparing the plots based on SOGPs and MTGPs, we can conclude that the models' predictions are quite similar, with the MTGPs sometimes providing slightly wider predictions intervals. Consistent with the previous analyses, we observe in these figures that combining the two materials data negligibly affect the predictions.

== Implications for Data Fusion and Transfer Learning
<sec:results-discussion>
The results of this work offer interesting insights for the development of predictive models in additive manufacturing. Specifically, they challenge the prevailing assumption that materials with similar processing conditions inherently benefit from data fusion. Instead, our findings suggest that material system compatibility, driven by shared underlying physical mechanisms, plays a far more crucial role in determining the success of data fusion. This implies that simply increasing dataset size by combining data from different materials does not necessarily lead to improved predictive accuracy, as our results demonstrate.

These observations are particularly relevant for applications in data-limited domains like LPBF, where the assumption of universal transferability across material systems may not hold. Instead of indiscriminate data fusion, our results advocate for more structured approaches to transfer learning---ones that carefully account for intrinsic differences between materials. By considering the unique characteristics of each material system, these methods could better capture the complex process-property relationships that govern material behavior.

= Conclusions
<sec:conclusion>
Our study examines the feasibility of data transferability in LPBF as a preliminary step toward developing foundation process-property models. Leveraging GPs, we assess the potential benefits of fusing data from 17-4 PH SS~and 316L SS~material systems. The results demonstrate that data fusion, in this context, does not improve predictive accuracy even with a shared input feature space, suggesting that material system compatibility is a critical factor beyond shared processing conditions. This finding implies that fusing data within related material systems does not guarantee enhanced model performance and it suggests that scaling data without careful consideration of feature representation may not yield to robust and generalizable foundation process-property models in LPBF.

While this study provides valuable insights, it has some limitations. First, the dataset size, though reasonable for additive manufacturing, is relatively small compared to other machine learning domains. Due to the small dataset size, we used GPs with parsimonious kernels that avoid overfitting. Leveraging more flexible kernels or ML models with larger datasets should be considered in the future studies. Second, the analysis is limited to two materials and the generalizability of our findings across a broader range of materials must be explored.

= Acknowledgments
<acknowledgments>
We appreciate the support from UC National Laboratory Fees Research Program of the University of California (Grant Number $L 22 C R 4520$). Oriol Vendrell-Gallart also acknowledges the Balsells Fellowship.

#heading(level: 1, numbering: none)[References]
<bibliography>
#block[
#block[
\[1\] T. DebRoy #emph[et al.], “Additive manufacturing of metallic components -- Process, structure and properties,” #emph[Progress in Materials Science], vol. 92, pp. 112--224, 2018, doi: #link("https://doi.org/10.1016/j.pmatsci.2017.10.001")[10.1016/j.pmatsci.2017.10.001].

] <ref-DebRoy2018AdditiveProperties>
#block[
\[2\] B. Fields #emph[et al.], “Investigation of an additively manufactured modified aluminum 7068 alloy: Processing, microstructure, and mechanical properties,” #emph[Materials Science and Engineering: A], vol. 891, no. September 2023, p. 145901, 2024, doi: #link("https://doi.org/10.1016/j.msea.2023.145901")[10.1016/j.msea.2023.145901].

] <ref-Fields2024InvestigationProperties>
#block[
\[3\] B. Fields #emph[et al.], “Microstructural Control of a Multi-Phase PH Steel Printed with Laser Powder Bed Fusion,” #emph[Advanced Materials Technologies], p. 2301037, 2024, doi: #link("https://doi.org/10.1002/admt.202301037")[10.1002/admt.202301037].

] <ref-Fields2024MicrostructuralFusion>
#block[
\[4\] A. K. Agrawal, “High-throughput experiments for process design of additively manufactured materials,” PhD thesis, UNIVERSITY OF WISCONSIN-MADISON, 2022. Available: #link("https://search.library.wisc.edu/digital/ABTSKQZN3367J28C")

] <ref-Agrawal2022High-throughputMaterials>
#block[
\[5\] et al. Rishi Bommasani, “On the opportunities and risks of foundation models.” 2022. Available: #link("https://arxiv.org/abs/2108.07258")

] <ref-bommasani2022opportunitiesrisksfoundationmodels>
#block[
\[6\] M. Amiri, Z. Z. Foumani, P. Cao, L. Valdevit, and R. Bostanabad, “Unveiling processing--property relationships in laser powder bed fusion: The synergy of machine learning and high-throughput experiments,” #emph[arXiv preprint arXiv:2409.00248], 2024.

] <ref-amiri2024unveiling>
#block[
\[7\] N. Otsu, “A threshold selection method from gray-level histograms,” #emph[IEEE Transactions on Systems, Man, and Cybernetics], vol. 9, no. 1, pp. 62--66, 1979, doi: #link("https://doi.org/10.1109/TSMC.1979.4310076")[10.1109/TSMC.1979.4310076].

] <ref-4310076>
#block[
\[8\] R. M. Haralick, S. R. Sternberg, and X. Zhuang, “Image analysis using mathematical morphology,” #emph[IEEE Transactions on Pattern Analysis and Machine Intelligence], vol. PAMI--9, no. 4, pp. 532--550, 1987, doi: #link("https://doi.org/10.1109/TPAMI.1987.4767941")[10.1109/TPAMI.1987.4767941].

] <ref-4767941>
#block[
\[9\] L. Vincent and P. Soille, “Watersheds in digital spaces: An efficient algorithm based on immersion simulations,” #emph[IEEE Transactions on Pattern Analysis and Machine Intelligence], vol. 13, no. 6, pp. 583--598, 1991, doi: #link("https://doi.org/10.1109/34.87344")[10.1109/34.87344].

] <ref-87344>
#block[
\[10\] A. Rosenfeld and J. L. Pfaltz, “Sequential operations in digital picture processing,” #emph[J. ACM], vol. 13, no. 4, pp. 471--494, Oct. 1966, doi: #link("https://doi.org/10.1145/321356.321357")[10.1145/321356.321357].

] #label("ref-10.1145/321356.321357")
#block[
\[11\] C. E. Rasmussen and C. K. I. Williams, #emph[Gaussian processes for machine learning (adaptive computation and machine learning)]. The MIT Press, 2005.

] #label("ref-10.5555/1162254")
#block[
\[12\] E. V. Bonilla, K. Chai, and C. Williams, “Multi-task gaussian process prediction,” in #emph[Advances in neural information processing systems], J. Platt, D. Koller, Y. Singer, and S. Roweis, Eds., Curran Associates, Inc., 2007. Available: #link("https://proceedings.neurips.cc/paper_files/paper/2007/file/66368270ffd51418ec58bd793f2d9b1b-Paper.pdf")

] <ref-NIPS2007_66368270>
#block[
\[13\] C. F. Van Loan, “The ubiquitous kronecker product,” #emph[Journal of computational and applied mathematics], vol. 123, no. 1--2, pp. 85--100, 2000.

] <ref-van2000ubiquitous>
#block[
\[14\] J. T. Eweis-Labolle, N. Oune, and R. Bostanabad, “Data fusion with latent map gaussian processes,” #emph[Journal of Mechanical Design], vol. 144, no. 9, p. 091703, 2022.

] <ref-eweis2022data>
#block[
\[15\] N. Oune and R. Bostanabad, “Latent map gaussian processes for mixed variable metamodeling,” #emph[Computer Methods in Applied Mechanics and Engineering], vol. 387, p. 114128, 2021.

] <ref-oune2021latent>
#block[
\[16\] J. C. Ion, H. R. Shercliff, and M. F. Ashby, “Diagrams for laser materials processing,” #emph[Acta Metallurgica et Materialia], vol. 40, no. 7, pp. 1539--1551, Jul. 1992, doi: #link("https://doi.org/10.1016/0956-7151(92)90097-X")[10.1016/0956-7151(92)90097-X].

] <ref-Ion1992DiagramsProcessing>
#block[
\[17\] M. Thomas, G. J. Baxter, and I. Todd, “Normalised model-based processing diagrams for additive layer manufacture of engineering alloys,” #emph[Acta Materialia], vol. 108, pp. 26--35, Apr. 2016, doi: #link("https://doi.org/10.1016/J.ACTAMAT.2016.02.025")[10.1016/J.ACTAMAT.2016.02.025].

] <ref-Thomas2016NormalisedAlloys>
#block[
\[18\] K. Huang, C. Kain, N. Diaz-Vallejo, Y. Sohn, and L. Zhou, “High throughput mechanical testing platform and application in metal additive manufacturing and process optimization,” #emph[Journal of Manufacturing Processes], vol. 66, pp. 494--505, 2021, doi: #link("https://doi.org/10.1016/j.jmapro.2021.04.027")[10.1016/j.jmapro.2021.04.027].

] <ref-Huang2021HighOptimization>
#block[
\[19\] A. K. Agrawal, G. Meric De Bellefon, and D. Thoma, “High-throughput experimentation for microstructural design in additively manufactured 316L stainless steel,” #emph[Materials Science & Engineering A], vol. 793, p. 139841, 2020, doi: #link("https://doi.org/10.1016/j.msea.2020.139841")[10.1016/j.msea.2020.139841].

] <ref-Agrawal2020High-throughputSteel>
] <refs>
