#import "layout.typ": paper, snapshots, procedure, unnumbered
#import "scaling.typ": scaling-diagram

#paper("Material-Agnostic Zero-Shot Thermal Inference for Metal Additive Manufacturing via a Parametric PINN Framework", [
Accurate thermal modeling in metal additive manufacturing (AM) is essential for understanding the process--structure--performance relationship. While prior studies have explored generalization across unseen process conditions, they often require extensive datasets, costly retraining, or pre-training. Generalization across different materials also remains relatively unexplored due to the challenges posed by distinct material-dependent thermal behaviors. This paper introduces a parametric physics-informed neural network (PINN) framework for zero-shot generalization across arbitrary materials without labeled data, retraining, or pre-training. The framework adopts a decoupled parametric PINN architecture that separately encodes material properties and spatiotemporal coordinates, fusing them through conditional modulation to better align with the multiplicative role of material parameters in the governing equation and boundary conditions. Physics-guided output scaling derived from Rosenthal's analytical solution and a hybrid optimization strategy are further incorporated to enhance physical consistency, training stability, and convergence. Experiments on bare plate laser powder bed fusion (LPBF) across diverse metal alloys, including both in-distribution and out-of-distribution cases, demonstrate effective zero-shot generalizability along with superior training efficiency. Specifically, the proposed framework achieved up to a 64.2% reduction in relative $L_2$ error compared to the non-parametric baseline while surpassing its performance within only 4.4% of the baseline training epochs. Ablation studies confirm that the proposed framework's components are broadly applicable to other PINN-based approaches. Overall, the proposed framework provides an efficient and scalable material-agnostic solution for zero-shot thermal modeling, contributing to more flexible and practical deployment in metal AM.
])[
= Introduction
<introduction>
In recent years, metal additive manufacturing (AM) has gained significant attention due to its potential across diverse applications ranging from aerospace, automotive, and agricultural components to construction and infrastructure @frazier2014metal. The primary advantage of metal AM lies in its flexibility to realize not only complex geometric variations, but also material compositions tailored to the unique characteristics of each application @tofail2018additive. Notwithstanding this considerable potential, the prevalence of process-induced defects and the difficulty in ensuring consistent material performance remain critical bottlenecks to widespread industrial adoption @svetlizky2021directed.

To overcome these obstacles, understanding thermal history plays a critical role. Accurate thermal field information is indispensable for understanding defect formation and the process-structure-property chain @smith2016linking@debroy2018additive. To this end, traditional analytical methods @steuben2019enriched_anal1@stockman20193d_anal2 and numerical methods such as the Finite Element Method (FEM) @knapp2023calibrating_num1@liao2023efficient_num2 have been employed for thermal modeling in metal AM. However, analytical methods often struggle to account for the multi-scale physics and complex boundary conditions inherent in AM, while numerical approaches are often constrained by high computational cost and limited flexibility for rapid design iterations @gawade2022leveraging_num3@michopoulos2018multiphysics_num4.

Data-driven methods using machine learning (ML) have been proposed as surrogate models to complement the numerical methods @mozaffar2018data. These approaches have succeeded in rapid temperature prediction for diverse scenarios @roy2020data@zhang2021prediction. Subsequent efforts have focused on generalizing these models to unseen process conditions , such as different part geometries @mozaffar2021geometry@kozjek2023data, laser paths or process parameter settings @kozjek2024data@chung2025multimodal. Nevertheless, these purely data-driven models often face two critical shortcomings. As black-box models, they often lack physical interpretability and reliability, which may hinder their applicability in practice @ra2026physics. Furthermore, they rely heavily on large volumes of high-fidelity ground-truth data for supervision. However, since experimental data are inherently limited, training these models in practice still relies on the very numerical simulations they originally aimed to replace @liao2023hybrid.

Physics-Informed Neural Networks (PINNs) have emerged as a promising solution to address the aforementioned limitations by embedding governing physical laws, such as partial differential equations (PDEs), initial conditions, and boundary conditions, directly into the loss function of ML models @raissi2019physics. Even though PINNs often encounter severe training instabilities and optimization complexities compared to purely data-driven models @wang2022and, they offer the distinct advantages of mesh-free architectures and data-efficient, or even #emph[data-free] training. These characteristics position PINNs as a compelling framework for thermal modeling with #emph[generalization to unseen process conditions].

However, a substantial body of existing PINN frameworks remains largely non-parametric; they are optimized for a fixed set of PDE parameters including process parameters. Consequently, any change in these parameters requires retraining the model from scratch to re-satisfy the governing PDEs. To attenuate the computational burden, several studies have explored transfer learning--based pre-training strategies to accelerate adaptation to new process conditions @liao2023hybrid@faegh2025physics. Nevertheless, these approaches still require additional adaptation to the target condition, resulting in repeated computational overhead that limits the scalability of PINN frameworks and may undermine the flexibility that metal AM promises.

In this regard, a few recent works have explored parametric PINNs that enable zero-shot inference across variations in PDE parameters @peng2025prediction. However, cross-material generalization remains largely underexplored, as different materials exhibit substantially different thermal behaviors @gu2012laser. Large variations in thermophysical properties across materials can lead to significant differences in peak temperatures and thermal patterns. To the best of the authors' knowledge, only one prior study has investigated cross-material generalization within a limited range of material properties (e.g., thermal conductivity within $\[ 2 \, 30 \]$) and a narrow temperature regime @hosseini2023single.

To address this gap, this paper introduces a parametric PINN-based framework for zero-shot, material-agnostic temperature prediction in metal AM. The proposed approach enables accurate cross-material thermal modeling for any arbitrary materials without requiring ground-truth data, retraining, or pre-training. Considering the influence of thermophysical material properties on thermal modeling in metal AM, we adopt a decoupled parametric PINN architecture that is more efficient and effective than conventional monolithic parametric PINN designs. Furthermore, we introduce a physics-guided output scaling to address severe training instabilities in parametric PINN formulations caused by large variations in thermal field magnitudes across materials. Finally, we develop a hybrid optimization strategy to stabilize parametric PINN training and accelerate convergence, thereby overcoming the extremely long training horizons typical of conventional PINNs.

Extensive numerical experiments demonstrate that the proposed framework accurately predicts thermal fields across diverse materials, including challenging OOD cases, enabling zero-shot and fully material-agnostic thermal modeling while achieving superior training efficiency. We further show that parametric PINNs outperform conventional non-parametric PINNs by avoiding material-specific overfitting and capturing diverse material-dependent thermal behaviors. Beyond quantitative evaluations, we provide qualitative analyses that offer insights into how thermophysical material properties influence parametric PINN-based thermal modeling in metal AM. Finally, ablation studies clarify the contribution of each component of the proposed framework to overall predictive performance and reveal why parametric PINNs can become vulnerable to severe training instability without appropriate scaling. These results also demonstrate that the components in the proposed framework are broadly applicable to other PINN formulations in metal AM beyond the present framework.

The remainder of this paper is organized as follows. Section #ref(<sec:literature_review>, supplement: none) reviews related work in thermal modeling in metal AM. Section #ref(<sec:methodology>, supplement: none) details the proposed framework. Section #ref(<sec:experiment>, supplement: none) describes the experimental setup. Section #ref(<sec:Results_and_discussion>, supplement: none) presents the results and discussion. Section #ref(<sec:ablation_study>, supplement: none) provides the ablation study and sensitivity analysis. Finally, Section #ref(<sec:conclusion>, supplement: none) concludes the paper.

= Literature Review
<sec:literature_review>
==== Data-driven methods for thermal modeling
<data-driven-methods-for-thermal-modeling>
Data-driven methods for thermal modeling in metal AM have received significant attention due to their rapid prediction capability and modeling flexibility. Recent advances have focused not only on improving prediction accuracy @kozjek2022data@perumal2023temporal@liu2025novel, but also on enhancing generalization to unseen process conditions @chen2024data@zhu2024thermal@choi2025transfer.

@mozaffar2021geometry employed graph neural networks to predict thermal histories for complex geometries not included in the training dataset. @kozjek2023data proposed a feature-engineering approach that incorporates part geometry and tool paths to model intra-layer process condition variations. Building upon this work, @kozjek2024data further improved inter-layer temperature prediction by integrating process parameters, laser paths, and geometric features. More recently, @chung2025multimodal transformed laser paths into image representations and employed multimodal deep learning, thereby reducing reliance on manually crafted process-condition features. Within the data-driven literature, to the best of the authors' knowledge, only @choi2025transfer considers material variations via transfer learning by pre-training on extensive source-domain data and fine-tuning on target-domain data, in order to account for variations in process conditions, including substrate materials.

Despite these notable advances, several limitations remain not fully addressed. First, such approaches require extensive data generation for both pre-training and fine-tuning, which may hinder their practical applicability due to excessive computation overhead. Second, adaptation through fine-tuning requires prior exposure to the target scenario before inference, thereby limiting zero-shot generalization capability.

==== PINN-based thermal field prediction
<pinn-based-thermal-field-prediction>
While continued efforts have been made to mitigate the limitations of data-driven models @chen2024data@zhu2024thermal, PINNs have been increasingly adopted for thermal modeling due to their data-efficient training and physical consistency. Existing PINN-based studies can be broadly categorized into two directions: improving performance by mitigating optimization challenges and enhancing generalization to unseen process conditions.

From an optimization perspective, PINNs are known to suffer from significant training instability due to multi-objective formulations and higher-order derivatives @wang2022and. To attenuate the instability during training PINNs, various approaches have been proposed to mitigate these optimization challenges in metal AM, including adaptive loss weighting and non-dimensionalization @peng2024multi, domain decomposition @peng2025multi, ensemble-based error homogenization @cooper2023error, and advanced feature encoding methods @yang2026physics.

From a generalization perspective, a large body of work has explored pre-training strategies based on transfer learning on non-parametric PINNs. Given that most existing PINN-based thermal models adopt a non-parametric formulation, such models are not well suited to changes in these parameters. Pre-training strategies have therefore been introduced to improve the adaptability of non-parametric PINNs. For example, @liao2023hybrid demonstrated that pre-training followed by fine-tuning enables faster adaptation of non-parametric PINNs to new process-parameter settings. Subsequent studies extended this idea to various scenarios, including changes in deposition patterns, laser paths, and beam profiles @faegh2025physics@peng2025prediction@sajadi2025two.

Beyond non-parametric formulations, parametric PINNs have been introduced to explicitly incorporate process parameters along with the spatiotemporal coordinate inputs. @hosseini2023single proposed a parametric PINN formulation that jointly inputs spatiotemporal coordinates along with some ranges of process parameters and material properties, and evaluates performance under randomly sampled configurations within the range. @yuan2025physics adopted parametric PINNs and incorporated process parameters, such as laser power and scanning speed, and leveraged transfer learning.

Despite notable progress from both optimization and generalization perspectives, several limitations remain. First, many existing PINN approaches suffer from long training horizons due to stiff loss landscapes and sensitivity to parameter perturbations, often requiring tens of thousands of training epochs to achieve stable convergence. Second, as in the aforementioned limitations in data-driven models, transfer learning formulation require prior exposure to the target scenario before inference, thereby limiting zero-shot generalization capability. Third, the generalization capability of parametric PINN-based approaches is often insufficiently evaluated. Prior work typically assesses performance only within predefined training ranges, leaving generalization to OOD scenarios largely unexplored. Moreover, benchmarking against non-parametric PINN baselines is frequently omitted, leaving the actual gains from parametric formulation in accuracy and scalability unclear.

To the best of the authors' knowledge, only one prior study has explored cross-material generalization in PINN-based thermal modeling for metal AM @hosseini2023single. This work adopts a monolithic parametric PINN in which material properties are concatenated with spatiotemporal inputs. While notable, evaluation is conducted within a limited training range of material properties and temperature regimes, leaving generalization to materials with substantially different thermophysical characteristics largely unexplored.

= Methodology
<sec:methodology>
== Nomenclature
<notations>
We leave the nomenclature in Appendix #ref(<app:nomenclature>, supplement: none).

== Problem Description
<Problem_Description>
We begin by defining material-agnostic temperature prediction as a generalization problem over material-dependent thermal fields governed by the same underlying physical laws. Let the spatiotemporal domain be denoted by $cal(D) := Omega times \[ 0 \, t_(upright(e n d)) \]$, where $Omega subset bb(R)^d$ is the spatial domain and $\( upright(bold(x)) \, t \) in cal(D)$. Each material is characterized by an $M$-dimensional vector of material properties (e.g., density, heat capacity, and thermal conductivity), denoted by $bold(lambda) in cal(M) subset bb(R)^M$, where $cal(M)$ represents the admissible material property space and each component $lambda_m$ lies within known bounds. The corresponding temperature field is defined as 

#unnumbered[
$ bb(T) := {T \( upright(bold(x)) \, t \, bold(lambda) \) in bb(R) divides \( upright(bold(x)) \, t \) in cal(D) \, med bold(lambda) in cal(M)} $
]



Our goal is to learn a predictive model $cal(F)_Theta : cal(D) times cal(M) arrow.r bb(T)$, parameterized by the set of all learnable parameters $Theta$, that minimizes the expected generalization error across both the spatiotemporal domain and the material property space. Formally, the objective can be expressed as $ upright(m i n)_Theta med bb(E)_(bold(lambda) tilde.op p_(cal(M))) [bb(E)_(\( upright(bold(x)) \, t \) tilde.op p_(cal(D))) [∥T \( upright(bold(x)) \, t \, bold(lambda) \) - hat(T)_Theta \( upright(bold(x)) \, t \, bold(lambda) \)∥_2^2]] $<eq:init_objective_loss>

In practice, however, obtaining ground-truth temperature fields $T \( upright(bold(x)) \, t \, bold(lambda) \)$ over the entire $cal(D) times cal(M)$ input domain is infeasible due to the extensive computational cost of performing numerical simulations for every material. As a result, purely data-driven supervision may not be effective. In this sense, we adopt PINNs which incorporate governing physical laws as constraints during training. By embedding physics-based inductive bias directly into the learning objective, PINNs not only promote physically consistent and interpretable predictions but also enable training even in the absence of ground-truth temperature data.

Therefore, the objective in Eq.~#ref(<eq:init_objective_loss>, supplement: none) can be reformulated as the minimization of physics-based residuals: $ upright(m i n)_Theta med & bb(E)_(bold(lambda) tilde.op p_(cal(M))) [bb(E)_(\( upright(bold(x)) \, t \) tilde.op p_(cal(D))) [cal(L)_Theta \( upright(bold(x)) \, t \, bold(lambda) \)]]\
upright("subject to ") med & cal(L)_Theta \( upright(bold(x)) \, t \, bold(lambda) \) = w_(upright(p d e)) cal(L)_(upright(p d e)) + w_(upright(b c)) cal(L)_(upright(b c)) + w_(upright(i c)) cal(L)_(upright(i c)) $<eq:pinn_objective_loss> The individual loss components are defined as $ cal(L)_(upright(p d e)) = 1 / N_(upright(p d e)) sum_(n = 1)^(N_(upright(p d e))) ∥cal(N) #h(-1em) (hat(T)_(upright("phys")) \( upright(bold(x))^(\( n \)) \, t^(\( n \)) \, bold(lambda)^(\( n \)) \; Theta \))∥_2^2 \, quad \( upright(bold(x))^(\( n \)) \, t^(\( n \)) \) in Omega times \( 0 \, t_(upright(e n d)) \] \, med bold(lambda)^(\( n \)) in cal(M) $<eq:loss_pde> $ cal(L)_(upright(b c)) = 1 / N_(upright(b c)) sum_(n = 1)^(N_(upright(b c))) ∥cal(B) #h(-1em) (hat(T)_(upright("phys")) \( upright(bold(x))^(\( n \)) \, t^(\( n \)) \, bold(lambda)^(\( n \)) \; Theta \))∥_2^2 \, quad \( upright(bold(x))^(\( n \)) \, t^(\( n \)) \) in partial Omega times \( 0 \, t_(upright(e n d)) \] \, med bold(lambda)^(\( n \)) in cal(M) $<eq:loss_bc> $ cal(L)_(upright(i c)) = 1 / N_(upright(i c)) sum_(n = 1)^(N_(upright(i c))) ∥cal(I) #h(-1em) (hat(T)_(upright("phys")) \( upright(bold(x))^(\( n \)) \, 0 \, bold(lambda)^(\( n \)) \; Theta \))∥_2^2 \, quad upright(bold(x))^(\( n \)) in Omega \, med bold(lambda)^(\( n \)) in cal(M) $<eq:loss_ic>

It is notable that there is no data-driven loss term, as preparing ground-truth temperature data for arbitrary materials is infeasible. This, in turn, makes our problem more challenging compared to hybrid settings, where auxiliary data-consistency losses (e.g., Eq. #ref(<eq:init_objective_loss>, supplement: none)) often guide the minimization of physics-based residuals @liao2023hybrid. Consequently, the optimization landscape is more prone to instability and convergence to suboptimal solutions.

In addition, we assume fixed process parameters, fixed part geometry, and a material-independent collocation sampling strategy throughout this study. Under this assumption, the process parameters as well as the spatiotemporal collocation domain and its distribution remain invariant across different materials, and only the material property vector $bold(lambda)$ varies. While several studies have explored process parameter-aware temperature prediction models @yuan2025physics@faegh2025physics, we leave relaxing these assumptions to future work, as the aim and scope of this paper are to build an effective temperature prediction model for unseen materials.

== Methodology Overview
<methodology-overview>
Figure #ref(<fig:overall_framework>, supplement: none) illustrates the overall proposed framework. Specifically, we first predict the raw temperature field using a parametric PINN with a decoupled architecture. We then incorporate physics-guided output scaling derived from Rosenthal's analytical solution, along with a hybrid training strategy, to enhance physical consistency, training stability, and convergence of parametric PINNs for material-agnostic temperature prediction.

#figure(image("source/Fig1.Overall_Framework/overall_framework.png", width: 100.0%),
  caption: [
    Proposed parametric PINN framework for material-agnostic temperature prediction in metal AM.
  ]
)
<fig:overall_framework>

== Revisiting the architecture in parametric PINNs: Decoupled Architecture
<revisiting-the-architecture-in-parametric-pinns-decoupled-architecture>
Existing parametric PINNs in metal AM typically adopt their model $cal(F)_Theta$ with a monolithic architecture that treats spatiotemporal points and parametric inputs as a single input vector @yuan2025physics@hosseini2023single. However, we suggest that such formulations may not adequately capture the relationship between the spatiotemporal point $\( upright(bold(x)) \, t \)$ and the material property vector $bold(lambda)$ when predicting the temperature field $T \( upright(bold(x)) \, t \, bold(lambda) \)$, especially in the cross-material thermal modeling scenario.

Let us denote such a monolithic prediction network as $g_Theta : \( upright(bold(x)) \, t \, bold(lambda) \) mapsto hat(T)_Theta$. Typically, $g_Theta$ is implemented as a fully connected neural network consisting of $L$ hidden layers ${ upright(bold(h))_l }_(l = 1)^L$, which are defined recursively as follows: 

#unnumbered[
$ g_Theta \( bold("x") \, t \, bold(lambda) \) = upright(h)_L \( upright(h)_(L - 1) \( dots.h.c \( upright(h)_1 \( bold("x") \, t \, bold(lambda) \) \) \) \) $
]

 Here, the operation within the first hidden layer $upright(h)_1$ is expressed as: $ upright(h)_1 = psi \( upright(W)_(bold("1,x")) bold("x") + upright(W)_(1 \, t) t + upright(W)_(1 \, bold(lambda)) bold(lambda) + upright(b)_1 \) $<eq:standard_layer> where $psi \( dot.op \)$ is an activation function, $upright(W)_(bold("1,x")) \, upright(W)_(1 \, t) \, upright(W)_(1 \, bold(lambda))$ represent the weight matrices for the spatial, temporal, and parameter inputs respectively, and $upright(b)_1$ is the bias term.

While this formulation is straightforward, it may be suboptimal for capturing the underlying physics of the problem from two perspectives. From a physical perspective, material properties typically do not vary across the spatiotemporal domain; rather, they act as #emph[conditional parameters] that govern thermal behavior over the entire domain. From a training perspective, material parameters in most governing PDEs and boundary conditions in metal AM appear as multiplicative coefficients of field derivatives.

However, as shown in Eq.~#ref(<eq:standard_layer>, supplement: none), a monolithic architecture initializes interactions between the spatiotemporal inputs $\( upright(bold(x)) \, t \)$ and the material properties $bold(lambda)$ through a linear additive combination. Consequently, the network must implicitly approximate these multiplicative physical relationships using summation-based representations, leading to inefficient representation learning. This, in turn, forces the network to approximate inherently multiplicative interactions through deeper nonlinear compositions, increasing sample complexity and hindering generalization across materials. This observation motivates the design of a more effective parametric PINN architecture tailored for material-agnostic temperature prediction.

To overcome this limitation, we develop a decoupled architecture that processes spatiotemporal features and material parameters separately prior to fusion. The architecture consists of two independent feature extraction networks followed by a fusion network. Figure #ref(<fig:proposed_network>, supplement: none) illustrates the structural difference between the conventional parametric PINN $g_Theta$ and the proposed decoupled architecture. The network is defined as: $ cal(F)_Theta \( bold("x") \, t \, bold(lambda) \) = g_(theta_c) [g_(theta_(bold("x") \, t)) \( bold("x") \, t \) \, g_(theta_(bold(lambda))) \( bold(lambda) \)] $<eq:proposednetwork> where $g_(theta_(upright(bold(x)) \, t))$ and $g_(theta_(bold(lambda)))$ denote the sub-networks for spatiotemporal coordinates and material properties, respectively, and $g_(theta_c)$ represents the fusion network. The complete set of learnable parameters is given by $Theta = { theta_c \, theta_(upright(bold(x)) \, t) \, theta_(bold(lambda)) }$.

This decoupled design enables a more structured modeling of the interaction between spatiotemporal coordinates and material properties. While the original study @cho2024parameterized provided limited justification for this parametric PINN architecture, we present a deeper rationale for its effectiveness compared to a monolithic design, particularly in cross-material thermal modeling scenarios.

#figure(image("source/Fig2.Proposed_Architecture/P_PINN_vs_Ours.png", width: 100.0%),
  caption: [
    Architectural comparison between a conventional monolithic parametric PINN and the proposed decoupled parametric PINN. The monolithic architecture jointly processes spatiotemporal coordinates and material properties through early fusion, which may limit its ability to represent physical interactions between spatiotemporal variables and material properties. In contrast, grounded in the FiLM mechanism @perez2018film, the proposed framework decouples material and spatiotemporal feature learning and fuses them through conditional modulation, allowing material properties to scale and shift spatiotemporal features in a manner consistent with physical interpretation.
  ]
)
<fig:proposed_network>

Specifically, the fusion mechanism in the proposed architecture operates analogously to Feature-wise Linear Modulation (FiLM) @perez2018film. Under this interpretation, the material property branch $g_(theta_(bold(lambda)))$ generates conditional modulation parameters rather than merely serving as an additional input. Accordingly, the operation in Eq.~#ref(<eq:proposednetwork>, supplement: none) can be interpreted as approximating 

#unnumbered[
$ hat(T)_Theta \( upright(bold(x)) \, t \, bold(lambda) \) approx gamma \( bold(lambda) \) op("⊙") g_(theta_(upright(bold(x)) \, t)) \( upright(bold(x)) \, t \) xor zeta \( bold(lambda) \) $
]

 where $gamma \( bold(lambda) \)$ and $zeta \( bold(lambda) \)$ denote learned scaling and shifting functions, respectively. In this formulation, $bold(lambda)$ acts as a conditional variable that implicitly modulates spatiotemporal features in a multiplicative manner. This mechanism is more consistent with the role of material parameters in governing PDEs and boundary conditions, where they typically appear as multiplicative coefficients of field derivatives.

In this way, $bold(lambda)$ functions as a conditional variable that dynamically adjusts the temperature profile at a given spatiotemporal point $\( bold("x") \, t \)$. This multiplicative interaction aligns more closely with the physical nature of the problem, enabling improved generalization across materials. As demonstrated in the experimental results, the proposed decoupled architecture consistently outperforms conventional parametric PINNs, despite employing fewer trainable parameters and lower overall network complexity.

== Overcoming Training Instability and Accelerating Convergence
<overcoming-training-instability-and-accelerating-convergence>
We present our two strategies designed for parametric PINNs in the material-agnostic temperature prediction scenario.

=== Physics-Guided Output Scaling
<physics-guided-output-scaling>
In practical PINN formulations in metal AM, the raw network output $hat(T)_Theta$ is not often directly enforced to satisfy the governing PDE, boundary and initial conditions. Instead, it is typically transformed into a physically admissible temperature field through an output scaling mechanism @liao2023hybrid@peng2025prediction. A commonly adopted construction in prior studies is given by $ hat(T)_(upright(p h y s)) \( upright(bold(x)) \, t \; Theta \) & eq.delta T_oo + T_max dot.op underbrace(upright(S o f t p l u s) med #h(-1em) \( hat(T)_Theta \), in \[ 0 \, oo \))\
upright("where") quad hat(T)_Theta & = cal(F)_Theta \( upright(bold(x))_(upright(n o r m)) \, t_(upright(n o r m)) \) $<eq:conventional_output_scaling>

Here, $T_oo$ denotes the ambient temperature, and the activation function $upright(S o f t p l u s) \( u \) = log \( 1 + e^u \)$ enforces non-negativity while remaining smooth and differentiable. $\( upright(bold(x))_(upright(n o r m)) \, t_(upright(n o r m)) \)$ are normalized spatiotemporal inputs to stabilize gradient-based optimization, which is particularly important in PINNs @wang2023expert.

This output scaling serves two fundamental purposes. First, under the standard assumption in metal AM that the initial temperature equals the ambient temperature @faegh2025physics@peng2025multi (i.e., $T_0 = T_oo$), the lower bound of the Softplus function guarantees that the final predicted temperature $hat(T)_(upright(p h y s)) \( Theta \)$ does not fall below the ambient temperature $T_oo$ and initial temperature $T_0$ anywhere in the spatiotemporal domain, thereby enforcing the physically admissible temperature range. Second, and more importantly from an optimization perspective, the scaling factor $T_max$ directly constrains the magnitude of the predicted raw temperature field $hat(T)_Theta$ and consequently controls the scale of gradients propagated through the governing PDE residuals, as well as the boundary and initial condition residuals.

From a training standpoint, introducing $T_max$ can be interpreted as an explicit mechanism for gradient scale regulation. PINNs are known to be particularly sensitive to gradient imbalance due to the simultaneous optimization of multiple physics-based loss terms involving higher-order derivatives @wang2022and. Without such output scaling in thermal modeling for metal AM, besides ensuring physical consistency, large disparities in gradient magnitudes can arise, leading to gradient explosion or vanishing and, consequently, severely hindering convergence. By narrowing the effective output range of the network prior to enforcing physical constraints on the loss function, Eq.~#ref(<eq:conventional_output_scaling>, supplement: none) alleviates this burden and stabilizes the optimization landscape.

Empirical evidence from prior literature @peng2023predicting indicates that removing this scaling factor $T_(upright(m a x))$ altogether, i.e.,: $ hat(T)_(upright(p h y s)) \( upright(bold(x)) \, t \; Theta \) = T_oo + upright(S o f t p l u s) \( hat(T)_Theta \) $#label("eq:conventional_output_scaling_w/o_Tmax") leads to significant training instability and poor convergence. This suggests that the primary role of $T_max$ lies not merely in ensuring physical consistency with the governing equations, but more critically in stabilizing the gradient magnitudes encountered during optimization.

However, stabilizing the gradient scale becomes more fundamentally challenging in material-agnostic temperature prediction, where $T_max$ must be specified for any unseen material properties $bold(lambda)$. Prior studies have typically determined $T_max$ through manual trial-and-error, which is neither scalable nor principled. Despite its critical role in stable PINN training, particularly in cross-material generalization settings, the selection of $T_max$ remains largely underexplored in the literature. This motivates the need for a physics-informed, material-dependent approximation of the temperature upper bound.

To address this challenge, we employ Rosenthal's analytical solution to approximate the upper bound of the material temperature. In metal AM, the peak temperature $T_max$ can be estimated using this solution; while originally developed for fusion welding, it is often adopted in metal AM due to the fundamental process similarities @promoppatum2017comprehensive@shi2024intelligent.

#figure(scaling-diagram(),
  caption: [
    Comparison of output scaling strategies for temperature prediction. (a) Manual output scaling @liao2023hybrid uses a manually determined, fixed peak temperature $T_max$, failing to generalize across unseen materials $bold(lambda)$. (b) Our physics-guided output scaling derives $T_max \( bold(lambda) \)$ from Rosenthal's analytical solution, enabling generalization to any unseen material while ensuring physical consistency and stabilizing the optimization landscape by regulating gradient scales.
  ]
)

According to Rosenthal's analytical solution, the thermal history at a given point is expressed as: $ T = T_0 + frac(eta P, 2 pi k r_(upright(l a s e r))) exp \( - frac(v \( r_(upright(l a s e r)) + xi \), 2 alpha) \) $ where the process parameters $eta \, P \, r_(upright(l a s e r)) \, v$, and $xi \( = x - v t \)$ denote the laser absorptivity, power, beam radius, scanning speed, and relative position, respectively. The material properties are defined by thermal conductivity $k$ and thermal diffusivity $alpha \( = frac(k, rho C_p) \)$. Since the exponential term is bounded by unity, the theoretical maximum temperature rise is simplified as: $ T_max = T_0 + frac(eta P, 2 pi k r_(upright(l a s e r))) $

Although this approximation is physics-based, the actual maximum temperature may vary in metal AM. The analytical solution assumes a quasi-steady state and a point/line heat source, whereas actual metal AM processes involve highly transient thermal gradients and complex melt-pool dynamics that often lead to higher peak temperatures. To compensate for the inherent underestimation of the Rosenthal's model when applied to metal AM scenarios, we introduce a correction factor $kappa gt.eq 1$ and improve Eq.~#ref(<eq:conventional_output_scaling>, supplement: none) by defining the #emph[physics-guided output scaling] law as follows: $ hat(T)_(upright(p h y s)) \( upright(bold(x)) \, t \, bold(lambda) \; Theta \) & eq.delta T_oo + kappa dot.op T_max \( bold(lambda) \) dot.op upright(S o f t p l u s) #h(-1em) (hat(T)_Theta)\
upright("where") quad hat(T)_Theta & = cal(F)_Theta \( upright(bold(x))_(upright(n o r m)) \, t_(upright(n o r m)) \; bold(lambda)_(upright(n o r m)) \)\
T_max \( bold(lambda) \) & eq.delta frac(eta P, 2 pi k r_(upright(l a s e r))) $<eq:physics_guided_scaling> This formulation offers two key advantages. First, it significantly reduces inter-material variance in gradient scales by constraining the temperature magnitude with respect to material-dependent thermal properties. Without such constraint, the optimization process tends to be dominated by materials with excessively large $T_max$ values, as their loss terms induce disproportionately large gradients that bias the training dynamics. Second, the proposed scaling stabilizes the optimization of the PDE, boundary condition, and initial condition losses, all of which are implicitly scaled by $T_max \( bold(lambda) \)$. While this effect may not be very significant in non-parametric PINNs, it becomes critical in material-agnostic settings, where manual scaling is infeasible or improper scaling can lead to severe gradient imbalance across different materials.

An alternative approach would be to introduce a small, auxiliary fully connected neural network to learn $T_max$ directly (i.e., $g_theta : bold(lambda) mapsto hat(T)_max \( theta \)$). However, this strategy would impose additional stochasticity during training and complicate the model architecture. The introduction of the extra learnable components can further exacerbate optimization difficulty and training instability. In contrast, leveraging a physics-based formulation to approximate $T_max$ for each material provides a deterministic, yet effective and principled means of stabilizing the training process of parametric PINNs without increasing architectural complexity.

Altogether, by embedding physics-informed temperature bounds directly into the output transformation, the proposed approach enables stable and efficient training without introducing additional learnable modules or increasing training complexity. This design choice is therefore essential for achieving effective and scalable material-agnostic temperature prediction within the parametric PINN framework. Note that the proposed strategy is further validated through an ablation study comparing diverse output scaling mechanisms.

=== Hybrid Optimization
<hybrid-optimization>
Training deep learning models, including PINNs, is inherently a non-convex optimization problem, where gradient-based methods remain the gold standard in the literature @ruder2016overview. In practical deep learning, local minima are often acceptable and comparable to a global optimum, but the presence of numerous saddle points in high-dimensional parameter spaces hinders convergence and induce suboptimal performance @goodfellow2016deep. Adaptive gradient-based optimizers such as Adam @kingma2014adam are widely used to mitigate these challenges by enabling rapid escape from saddle regions @rathore2024challenges. Consequently, many PINN-based studies in metal AM adopt Adam for training @liao2023hybrid@yuan2025physics. The update rule is given by: $ Theta_(j + 1) arrow.l Theta_j - l r_(upright(A d a m)) dot.op thin upright(A d a m) #h(-1em) (nabla_Theta cal(L)_B \( Theta_j \)) \, $<eq:adam_update> where $l r_(upright(A d a m))$ is a learning rate and $nabla_Theta cal(L) \( Theta_j \)$ is the gradient of the loss function with respect to the model parameter $Theta$ evaluated on a mini-batch $B subset cal(D) times cal(M)$.

Despite its effectiveness, optimization in PINNs is often significantly more challenging than in conventional deep learning due to multi-objective loss formulations and the need to compute higher-order derivatives @wang2025gradient. Therefore, the loss becomes highly sensitive to minute fluctuations in the network weights $Theta$. To attenuate the fluctuations, previous studies often employ small learning rates with Adam, which leads to slow convergence and extremely long training horizons, sometimes exceeding 50,000--100,000 epochs @liao2023hybrid@yuan2025physics@faegh2025physics.

To accelerate convergence, second-order optimizers such as L-BFGS are often used because they exploit curvature information to improve convergence near minima. However, conventional L-BFGS requires full-batch gradients to compute stable curvature estimates. This becomes computationally expensive due to the large number of collocation points. Moreover, the deterministic nature of full-batch updates may lead to optimization stagnation when the training dynamics become trapped in flat regions of the loss landscape.

To address these challenges, we adopt a hybrid optimization strategy that combines Adam for global exploration with L-BFGS for local refinement. The training procedure consists of two phases. First, the model is trained using Adam for $J_(upright("Adam"))$ epochs to efficiently explore the parameter space and obtain a coarse solution. Subsequently, training switches to L-BFGS to achieve precise convergence.

To improve the scalability of L-BFGS, we introduce stochasticity into the collocation sampling. Instead of using all collocation points, fixed subsets of boundary, initial, and PDE residual points are used during each iteration and periodically resampled. This strategy reduces memory consumption while preventing the optimizer from overfitting to specific collocation configurations. The resulting stochastic curvature updates help avoid optimization stagnation and improve training stability. The transition from Adam to L-BFGS can be summarized as $ Theta_(j + 1) arrow.l Theta_j - l r_(upright(L - B F G S)) dot.op upright(bold(H))_j^(- 1) nabla_Theta cal(L)_B \( Theta_J \) $<eq:lbfgs_update> where $upright(bold(H))_j^(- 1)$ denotes the inverse Hessian approximation updated using gradients from a mini-batch $B$ and $l r_(upright(L - B F G S))$ represents the learning rate.

To sum up, we summarize the overall training procedure of the proposed framework in Appendix #ref(<app:training_algorithm>, supplement: none).

= Experiment
<sec:experiment>
==== System Description
<system-description>
#figure(
  align(center)[#table(
    columns: 2,
    align: (left,center,),
    table.header([#strong[Process Parameter]], [#strong[Value]],),
    table.hline(),
    [Spatial domain $Omega$], [$40 times 10 times 6 med upright(m m)^3$],
    [Laser power $P$], [$500 med upright(W)$],
    [Laser absorptivity $eta$], [$0.4$],
    [Laser beam radius $r_(upright(l a s e r))$], [$1.5 med upright(m m)$],
    [Laser scanning speed $v$], [$10 med upright(m m \/ s)$],
    [Total scanning time $t_(upright(e n d))$], [$3 med upright(s)$],
    [Initial laser position $upright(bold(x))_0$], [$\( 5 \, 5 \, 6 \) med upright(m m)$],
    [Initial temperature $T_0$], [$300 med upright(K)$],
    [Ambient temperature $T_oo$], [$300 med upright(K)$],
    [Convection coefficient $h$], [$50 med upright(W \/ \( m^2 dot.op K \))$],
    [Surface emissivity $e$], [$0.3$],
  )]
  , caption: [Summary of the experimental setup]
  , kind: table
  ) <tab:experiment_setup_LPBF>
To validate the proposed framework, we adopt a widely used numerical benchmark @liao2023hybrid@peng2023predicting based on bare-plate laser scanning representative of the Laser Powder Bed Fusion (LPBF) AM process. LPBF selectively melts a metal substrate using a high-energy laser, producing highly localized melting and rapid thermal transients.

In this benchmark, a moving laser heat source scans the surface of a solid metal plate, generating highly localized and transient thermal gradients governed by laser heating, heat conduction within the substrate, and convective and radiative losses at the free surfaces.

The process parameters are summarized in Table #ref(<tab:experiment_setup_LPBF>, supplement: none). Ground-truth temperature fields are obtained using `JAX-AM`#footnote[#link("https://github.com/CMSL-HKUST/jax-am")] @xue2023jax, an open-source library for high-fidelity FEM simulations in metal AM. Representative snapshots of the resulting temperature field are shown in Figure #ref(<fig:ti64_snapshots>, supplement: none).

#figure([#snapshots(
  [#image("source/Fig4.FEM_snapshots/0.5s.PNG", width: 100%) <fig:ti64_t05> #align(center)[(a) $t = 0.5 thin upright(s)$]],
  [#image("source/Fig4.FEM_snapshots/1.5s.PNG", width: 100%) <fig:ti64_t15> #align(center)[(b) $t = 1.5 thin upright(s)$]],
  [#image("source/Fig4.FEM_snapshots/2.5s.PNG", width: 100%) <fig:ti64_t25> #align(center)[(c) $t = 2.5 thin upright(s)$]],
)

  ],
  caption: [
    Ground-truth temperature field snapshots at $t = 0.5$, $1.5$, and $2.5 thin upright(s)$ for the bare-plate scanning benchmark. Here, we used Ti--6Al--4V for visualization only. The thermal evolution reflects a moving laser heat source and subsequent heat diffusion within the substrate material.
  ]
)
<fig:ti64_snapshots>

==== Material Property Space
<material-property-space>
To evaluate the framework's ability to generalize in capturing material-dependent dynamics, we define a continuous material property space $cal(M)$ based on the characteristic ranges of alloys prevalent in metal AM: 

#unnumbered[
$ cal(M) := \[ rho_(upright("min")) \, rho_(upright("max")) \] times \[ C_(p \, upright("min")) \, C_(p \, upright("max")) \] times \[ k_(upright("min")) \, k_(upright("max")) \] $
]

 where the boundaries are set as $rho in \[ 3000 \, 10000 \] thin upright("kg/m")^3$, $C_p in \[ 300 \, 1000 \] thin upright("J/kg") dot.op upright("K")$, and $k in \[ 3 \, 50 \] thin upright("W/m") dot.op upright("K")$. Within this space, we validate the model on three representative alloys with material properties denoted as $\( rho \, C_p \, k \)$:

- #strong[Ti-6Al-4V] $\( 4430 \, 560 \, 6.7 \)$: High strength-to-weight ratio, standard in aerospace.

- #strong[Inconel 718] $\( 8220 \, 435 \, 11.4 \)$: Nickel-based superalloy with high-temperature stability.

- #strong[SS 316L] $\( 8000 \, 500 \, 16.0 \)$: Austenitic stainless steel with superior corrosion resistance.

Furthermore, to assess the framework's extrapolation capability in out-of-distribution scenarios, we evaluate it against an additional alloy whose properties significantly exceed the training bounds:

- #strong[AlSi10Mg] $\( 2670 \, 950 \, 150 \)$: Primarily used for lightweight structural parts, featuring a thermal conductivity $k$ that is nearly threefold the upper limit of the defined $cal(M)$.

- #strong[Copper] $\( 8960 \, 385 \, 401 \)$: Highly conductive material widely used in electrical and thermal management components, exhibiting an extreme thermal conductivity $k$ that exceeds the upper bound of $cal(M)$ by eightfold.

==== Governing Equations and Boundary Conditions
<governing-equations-and-boundary-conditions>
We leave the detailed mathematical formulation of the governing PDEs as well as the boundary conditions and initial conditions to Appendix #ref(<app:governing_eqs>, supplement: none).

==== Collocation Sampling Strategy
<collocation-sampling-strategy>
#figure(image("source/Fig5.Collocation_Points/Collocation_points.png", width: 33.0%),
  caption: [
    Visualization of the sampled collocation points used in this study. Sampling points at time $t$ (a) on the boundary (b) in the domain. Reproduced from ~@liao2023hybrid.
  ]
)
<fig:collocation_points>

To train PINN models using physics-based residuals, collocation points sampled from the spatiotemporal domain are employed. Although the choice of sampling strategy is critical and constitutes a broad research topic in itself, we follow the established setup from prior work @liao2023hybrid to ensure consistency and enable fair comparison. Under this configuration, the sampled collocation points used throughout this study are illustrated in Figure #ref(<fig:collocation_points>, supplement: none).

Specifically, the spatiotemporal domain is discretized with a uniform time step of 0.1 s. At each step, a multi-resolution sampling strategy is applied: a baseline 1 mm interval grid is used for the surfaces, while a refined 0.25 mm interval is concentrated within a $6 times 6 upright(" mm")^2$ area near the laser center. Additionally, a 0.5 mm grid is utilized for the top $40 times 10 times 1 upright(" mm")^3$ region---four times finer than the lower region---to ensure that high-frequency thermal behaviors and transient boundary conditions near the heat source are accurately captured.

==== Baselines and Evaluation Metric
<baselines-and-evaluation-metric>
We evaluate the proposed material-agnostic framework against two baseline models to assess the scalability and architectural advantages of our approach.

- #strong[Non-parametric PINN (N-PINN):] Material properties are treated as fixed constants within the governing equations. This baseline assesses whether the material-agnostic framework preserves predictive accuracy while providing improved scalability across different materials.

- #strong[Monolithic parametric PINN (P-PINN):] A conventional parametric PINN architecture that takes all physical and material inputs as a single vector (e.g., Figure #ref(<fig:proposed_network>, supplement: none)). This comparison evaluates the architectural benefits of the proposed decoupled design relative to the commonly used parametric PINN structure in metal AM studies @yuan2025physics@hosseini2023single.

For quantitative comparison, we adopt the relative $L_2$ error, a standard metric in the PINN literature. This metric measures the normalized discrepancy between the predicted temperature field and the ground-truth solution over the discretized spatiotemporal domain. For a given set of material properties $bold(lambda)$, the relative $L_2$ error is defined as: 

#unnumbered[
$ L_2 upright(" error") = sqrt(sum_(n = 1)^N lr(|T #h(-1em) (upright(bold(x))^(\( n \)) \, t^(\( n \)) \, bold(lambda)) - hat(T)_(upright(p h y s)) #h(-1em) (upright(bold(x))^(\( n \)) \, t^(\( n \)) \, bold(lambda) \; Theta)|)^2) / sqrt(sum_(n = 1)^N lr(|T #h(-1em) (upright(bold(x))^(\( n \)) \, t^(\( n \)) \, bold(lambda))|)^2) times 100 thin \( % \) $
]

 where $N$ denotes the total number of nodes in the FEM simulations. In this study, $N = 88 \, 939$.

==== Implementation Details
<implementation-details>
For the N-PINN baseline, we adopt the implementation provided in the corresponding study @liao2023hybrid. The network architectures, input variables, and training configurations for the proposed model and the baseline methods are summarized in Table #ref(<tab:network_hyperparameters>, supplement: none). It is worth noting that the proposed model has the fewest trainable parameters while achieving superior predictive performance, as demonstrated in the following section.

#figure(
  align(center)[#table(
    columns: 5,
    align: (left,center,center,center,center,),
    table.header([#strong[Model]], [#strong[Input]], [#strong[Architecture]], [#strong[Layers / Width]], [#strong[Optimizer / Learning rate / Epochs]],),
    table.hline(),
    [N-PINN @liao2023hybrid], [$\( x \, y \, z \, t \)$], [Monolithic], [4/60], [Adam / 2e-4 / 50,000],
    [P-PINN], [$\( x \, y \, z \, t \, rho \, C_p \, k \)$], [Monolithic], [4/60], [Hybrid / 2e-4, 1e-3 / 10,000],
    [Proposed], [$\( x \, y \, z \, t \, rho \, C_p \, k \)$], [Decoupled], [$\( 2 \/ 30 \) times 2 + \( 2 \/ 50 \)$], [Hybrid / 2e-4, 1e-3 / 10,000],
  )]
  , caption: [Summary of network architectures, inputs, and training configurations for the proposed model and the baselines]
  , kind: table
  ) <tab:network_hyperparameters>
Aside from these configurations, all experimental settings were identical and all experiments were conducted using five random seeds to ensure reproducibility and fair comparison. The loss-function weights were set to $\( w_(upright(p d e)) \, w_(upright(i c)) \, w_(upright(b c)) \) = \( 1 \, 10^(- 4) \, 1 \)$ following prior work @liao2023hybrid. A curriculum learning strategy was applied during the first 200 epochs to prevent convergence to trivial local optima by prioritizing the satisfaction of boundary conditions in the early stages of training. For the proposed hybrid optimization strategy, we transition from Adam to L-BFGS at 2,000 epochs. Additional implementation details are provided in Appendix #ref(<app:implementation>, supplement: none). All experiments were performed on a single NVIDIA RTX 5090 GPU using Python 3.10 and PyTorch. The complete implementation and data are available at #link("https://github.com/hsleecri/MaterialAgnosticTempPred").

= Results and Discussion
<sec:Results_and_discussion>
== Comparison with non-parametric PINN
<comparison-with-non-parametric-pinn>
Table #ref(<tab:performance_comparison_N_PINN>, supplement: none) summarizes the $L_2$ error for three alloys: Ti--6Al--4V, Inconel~718, and SS~316L. The proposed framework consistently outperforms the N-PINN baseline across all materials, achieving approximately $56$--$64 %$ lower $L_2$ error while using fewer trainable parameters. This result is particularly noteworthy given that the N-PINN baseline requires material-specific retraining, whereas the proposed framework enables simultaneous evaluation across all materials within a single trained model while maintaining strong cross-material generalization.

#figure(
  align(center)[#table(
    columns: 5,
    align: (left,center,center,center,center,),
    [Material], table.cell(rowspan: 2)[\# param.], [Ti--6Al--4V], [Inconel 718], [SS 316L],
    [$\( rho \, C_p \, k \)$], [$\( 4430 \, 560 \, 6.7 \)$], [$\( 8220 \, 435 \, 11.4 \)$], [$\( 8000 \, 500 \, 16 \)$],
    [N-PINN~@liao2023hybrid], [$11 \, 341$], [$6.19 plus.minus 1.00$], [$6.09 plus.minus 0.83$], [$5.94 plus.minus 0.63$],
    [#strong[Proposed]], [$upright(bold(9 \, 641))$], [$upright(bold(2.71)) plus.minus 0.34$], [$upright(bold(2.18)) plus.minus 0.45$], [$upright(bold(2.17)) plus.minus 0.53$],
    [Reduction \[%\]], [$- med upright(bold(14.99 %))$], [$- med upright(bold(56.22 %))$], [$- med upright(bold(64.20 %))$], [$- med upright(bold(63.43 %))$],
  )]
  , caption: [ Quantitative performance comparison with the N-PINN baseline @liao2023hybrid. We report the total number of learnable parameters and the $L_2$ error \[%\] over five random seeds as mean $plus.minus$ standard deviation. All experimental settings were identical except for the number of training epochs to ensure fair comparison. Lower values indicate better performance and parameter efficiency.]
  , kind: table
  ) <tab:performance_comparison_N_PINN>
#figure(image("source/Fig6_9.Quantitative_results/Loss_L2RE_NPINN.png", width: 100.0%),
  caption: [
    Comparison of training dynamics between the N-PINN @liao2023hybrid and the proposed framework. (a)--(c) Evolution of the $L_2$ error \[%\] during training for Ti--6Al--4V, Inconel~718, and SS~316L. (d)--(f) Evolution of the loss components in #ref(<eq:pinn_objective_loss>, supplement: none): boundary condition loss~#ref(<eq:loss_bc>, supplement: none), initial condition loss~#ref(<eq:loss_ic>, supplement: none), and PDE residual loss~#ref(<eq:loss_pde>, supplement: none). For loss visualization, Ti--6Al--4V is shown for the N-PINN. Solid lines represent the mean over five random seeds, and shaded regions indicate $plus.minus$ one standard deviation.
  ]
)
<fig:l2-error-convergence>

Beyond final accuracy, Figure #ref(<fig:l2-error-convergence>, supplement: none)\(a)--(c) highlights a substantial difference in training behavior. Notably, after switching from Adam to L-BFGS at 2,000 epochs, only an additional $100$-$200$ epochs are required for the proposed model to reach the performance level achieved by the N-PINN baseline after approximately $50 \, 000$ epochs of training. In other words, the proposed framework attains a comparable accuracy within $2 \, 200$ epochs, which is $4.4 %$ of the baseline training iterations proceeded in the corresponding previous study.

With continued training, the performance gap further widens. At $10 \, 000$ epochs, the proposed framework achieves an additional $56$--$64 %$ reduction in $L_2$ error relative to the N-PINN, indicating that the improvement extends beyond faster convergence to a superior final solution. This reduction in required training iterations is particularly significant for PINNs in metal AM, where prior studies often rely on extremely long training horizons to achieve satisfactory performance. In contrast, the proposed framework demonstrates that rapid convergence and improved final accuracy can be achieved simultaneously without excessive training.

To investigate the origin of this performance gap, Figure #ref(<fig:l2-error-convergence>, supplement: none)\(d)--(f) compares the evolution of individual PINN loss components. After transitioning to L-BFGS at $2 \, 000$ epochs, the proposed framework exhibits a rapid and stable decrease in all loss terms. While the initial condition loss converges to a similar lower bound for both methods, notable differences arise in the boundary condition and PDE residual losses. In particular, the proposed framework reduces the loss values by up to $1 \/ 100$ compared to the N-PINN while maintaining stable optimization. This substantial reduction in physics-based residuals directly explains the improved accuracy reported in Table #ref(<tab:performance_comparison_N_PINN>, supplement: none).

#figure(image("source/Fig6_9.Quantitative_results/Thermal_History_NPINN.png", width: 100.0%),
  caption: [
    Thermal history comparison at a probe location along the laser scan path on the top surface for Ti--6Al--4V, Inconel~718, and SS~316L. (a)--(c) Temperature evolution predicted by FEM, the N-PINN @liao2023hybrid, and the proposed framework. (d)--(f) Temperature deviation relative to the FEM reference, defined as $Delta T = hat(T)_(upright(p h y s)) \( Theta \) - T_(upright(F E M))$. Solid lines represent the mean over five random seeds, and shaded regions indicate $plus.minus$ one standard deviation.
  ]
)
<fig:thermal_history_N_PINN>

The impact of these improvements is further scrutinized in Figure #ref(<fig:thermal_history_N_PINN>, supplement: none), which compares thermal histories evaluated at a probe location $\( 12 \, 5 \, 6 \)$ on the top surface along the laser scan path. As the laser approaches the probe location, the temperature signal enters a highly transient regime characterized by steep thermal gradients. This regime is particularly challenging for PINN models, since neural networks exhibit a spectral bias toward low-frequency functions and therefore struggle to accurately represent the sharp thermal variations induced by localized laser heating. During this phase, both the proposed framework and the N-PINN baseline capture the peak temperature induced by laser irradiation and reproduce the distinct thermal scales associated with different materials.

More pronounced differences emerge during the subsequent cooling phase after the laser passes the probe location. The N-PINN exhibits systematic bias and larger variability, consistent with residual boundary condition and PDE errors. In contrast, the proposed framework remains closer to the FEM reference solution, yielding smaller deviations and reduced variance, particularly in cooling-dominated regimes. These results indicate that the reduced boundary condition and PDE residuals translate directly into more stable and accurate material-agnostic thermal predictions.

An additional trend is observed across the three alloys. The largest prediction errors occur for Ti--6Al--4V, which has relatively low thermal conductivity and therefore exhibits sharp and highly localized thermal gradients near the melt pool region. Such high-gradient regimes are difficult for PINNs to approximate accurately and may also be insufficiently resolved by the adopted collocation sampling density. As thermal conductivity increases from Ti--6Al--4V to Inconel~718 and SS~316L, heat diffusion becomes more dominant, smoothing sharp temperature gradients and attenuating localized thermal fluctuations. Consequently, the prediction errors near the melt pool region decrease for both models.

Despite these improvements for higher-conductivity materials, the proposed framework consistently shows smaller deviations and lower variance than the N-PINN in the late-time far-field regime across all three alloys. This behavior suggests that the N-PINN tends to learn material-specific thermal responses due to its non-parametric formulation, which can lead to material-specific overfitting. In contrast, the proposed parametric architecture learns shared thermal dynamics across multiple materials, enabling more generalizable and stable temperature predictions.

== Comparison with monolithic parametric PINN
<subsubsec:comparison_monolithic>
Table #ref(<tab:performance_comparison_P_PINN>, supplement: none) summarizes the quantitative results in terms of the total number of learnable parameters and the relative $L_2$ error. Despite having $16.32 %$ fewer parameters, the proposed framework consistently improves predictive accuracy compared to the P-PINN baseline across all materials, achieving relative $L_2$ error reductions of $64.3 %$, $64.38 %$, and $62.84 %$ for Ti--6Al--4V, Inconel~718, and SS~316L, respectively, while also exhibiting substantially smaller standard deviations. Note that the only difference between the two models lies in the parametric PINN architecture, while all other experimental settings such as training horizons are identical.

#figure(
  align(center)[#table(
    columns: 5,
    align: (left,center,center,center,center,),
    [Material], table.cell(rowspan: 2)[\# param.], [Ti--6Al--4V], [Inconel 718], [SS 316L],
    [$\( rho \, C_p \, k \)$], [$\( 4430 \, 560 \, 6.7 \)$], [$\( 8220 \, 435 \, 11.4 \)$], [$\( 8000 \, 500 \, 16 \)$],
    [Parametric PINN (P-PINN)], [$11 \, 521$], [], [], [],
    [$\[ 4.10 \, 13.35 \]$], [], [], [], [],
    [$\[ 3.39 \, 11.14 \]$], [], [], [], [],
    [$\[ 3.63 \, 9.90 \]$], [], [], [], [],
    [#strong[Proposed]], [#strong[9,641]], [], [], [],
    [$\[ 2.35 \, 3.03 \]$], [], [], [], [],
    [$\[ 1.76 \, 2.69 \]$], [], [], [], [],
    [$\[ 1.67 \, 2.11 \]$], [], [], [], [],
    [Reduction \[%\]], [$- med upright(bold(16.32 %))$], [$- med upright(bold(64.30 %))$], [$- med upright(bold(64.38 %))$], [$- med upright(bold(62.84 %))$],
  )]
  , caption: [ Quantitative performance comparison between the monolithic parametric PINN (P-PINN) baseline and the proposed decoupled framework. We report the total number of learnable parameters and the relative $L_2$ error \[%\] over five random seeds as mean $plus.minus$ standard deviation, with the observed range \[min, max\] shown in each entry. All experimental settings were identical except for the number of training epochs to ensure fair comparison. Lower values indicate better parameter efficiency and performance. ]
  , kind: table
  ) <tab:performance_comparison_P_PINN>
#figure(image("source/Fig6_9.Quantitative_results/Loss_L2RE_PPINN.png", width: 100.0%),
  caption: [
    Comparison of training dynamics between the P-PINN and the proposed framework. (a)--(c) Evolution of the $L_2$ error \[%\] during training for Ti--6Al--4V, Inconel~718, and SS~316L. (d)--(f) Evolution of the loss components in #ref(<eq:pinn_objective_loss>, supplement: none): boundary condition loss~#ref(<eq:loss_bc>, supplement: none), initial condition loss~#ref(<eq:loss_ic>, supplement: none), and PDE residual loss~#ref(<eq:loss_pde>, supplement: none). Solid lines represent the mean over five random seeds, and shaded regions indicate $plus.minus$ one standard deviation.
  ]
)
<fig:ppinn_training>

A closer inspection of the minimum and maximum $L_2$ error values reveals a pronounced contrast in robustness. For all three materials, even the best-performing instances of the P-PINN (i.e., the minimum error across random seeds) remain worse than the worst-case performance of the proposed framework. Beyond this instance-level comparison, the proposed framework maintains a consistently narrow performance range across all materials, whereas the P-PINN exhibits large variance due to training instability. This behavior suggests that the decoupled architecture stabilizes the learning process by mitigating gradient interference and enabling more effective representation of the interactions between spatiotemporal features and material parameters, resulting in improved alignment with the underlying physics.

The training dynamics are further analyzed in Figure #ref(<fig:ppinn_training>, supplement: none). Both the P-PINN and the proposed framework exhibit smooth and stable convergence behavior, with all loss components consistently decreasing across random seeds. Unlike the pronounced discrepancies observed between the N-PINN and the proposed method, all physics-based residuals for P-PINN and the proposed framework converge to comparable magnitudes, indicating that both models are effectively optimized and guided toward similar regions of the loss landscape by the hybrid optimization strategy.

Despite this similarity in loss convergence, the P-PINN consistently yields higher $L_2$ errors than the proposed framework. This indicates that the remaining performance gap is not primarily driven by optimization failure, but rather by limitations in representation. In particular, the monolithic P-PINN must encode spatiotemporal coordinates and material properties within a shared latent representation via additive feature fusion, which constrains its ability to efficiently capture the inherently multiplicative role of material parameters in the governing equations.

In contrast, the proposed decoupled architecture enables material properties to act as conditional modulation variables that multiplicatively scale and shift spatiotemporal features, yielding representations that are better aligned with the physical structure of the PDEs and boundary conditions. This improved representational alignment allows comparable physics-based loss minimization to translate into superior predictive accuracy.

#figure(image("source/Fig6_9.Quantitative_results/Thermal_History_PPINN.png", width: 100.0%),
  caption: [
    Thermal history comparison at a probe location along the laser scan path on the top surface for Ti--6Al--4V, Inconel~718, and SS~316L. (a)--(c) Temperature evolution predicted by FEM, the P-PINN, and the proposed framework. (d)--(f) Temperature deviation relative to the FEM reference, defined as $Delta T = hat(T) \( Theta \) - T_(upright(F E M))$. Solid lines represent the mean over five random seeds, and shaded regions indicate $plus.minus$ one standard deviation.
  ]
)
<fig:thermal_history_vs_P_PINN>

Figure #ref(<fig:thermal_history_vs_P_PINN>, supplement: none) compares the thermal histories at a probe location $\( 9 \, 5 \, 6 \)$ on the top surface along the laser scan path. Across all materials, the proposed framework closely follows the FEM reference throughout both the heating and cooling phases. In contrast, the P-PINN exhibits noticeable deviations near the peak temperature and during the subsequent transient cooling regime, accompanied by substantially larger uncertainty bands. Notably, the largest deviations for the P-PINN occur around the peak temperature induced by laser irradiation. This behavior suggests that, while some P-PINN instances converge to adequate local optima that capture the rapid thermal response to laser heating, others converge to solutions that do not effectively represent the underlying thermal dynamics. Such sensitivity to initialization and optimization leads to significant variability.

Conversely, the proposed framework consistently captures the laser-induced heating and subsequent cooling behavior, indicating that its parameter-efficient and decoupled architecture provides representations that are better aligned with the governing equations and thermal physics of metal AM. This observation further supports the claim that architectural decoupling improves the expressiveness of the model in capturing the interaction between material properties and spatiotemporal thermal dynamics.

== Material-Agnostic Thermal Field Prediction
<subsec:results_discussion>
#figure(image("source/Fig10_12.Qualitative_results/Qualt_0.5.PNG"),
  caption: [
    Qualitative comparison of temperature fields at $t = 0.5 thin upright(s)$ predicted by the proposed framework and FEM simulations for three materials: Ti--6Al--4V, Inconel~718, and SS 316L. (a) Top-surface temperature fields predicted by the proposed framework, the corresponding FEM reference solutions, and the discrepancy $Delta T = hat(T)_(upright(p h y s)) \( Theta \) - T_(upright(F E M))$. (b) the corresponding $x$--$z$ cross-sections following the same ordering
  ]
)
<fig:qualitative_field_comparison_0.5>

Beyond the quantitative evaluation, we qualitatively examine the spatiotemporal temperature fields predicted by the proposed framework, focusing on their temporal evolution and material-dependent behavior. As in the quantitative experiments, the model is trained only once and evaluated across different materials.

At the early stage ($t = 0.5 thin upright(s)$\; Figure #ref(<fig:qualitative_field_comparison_0.5>, supplement: none)), the temperature field is dominated by highly localized peaks near the moving laser heat source. Both the top-surface distributions and the $x$--$z$ cross-sections predicted by the proposed framework closely match the FEM reference in terms of peak location, spatial extent, and symmetry. The residual error $Delta T$ remains strongly localized around the melt pool region, indicating that the dominant conductive heat-transfer mechanisms are accurately captured at early times.

As the thermal field evolves ($t = 1.5 \, upright(s)$\; Figure #ref(<fig:qualitative_field_comparison_1.5>, supplement: none)), heat accumulates along the scanning direction, producing an elongated temperature tail behind the moving heat source and deeper heat penetration below the surface. Although the magnitude of $Delta T$ increases slightly compared with the early-time case, the error remains localized near the heat source and along the trailing region, suggesting that the model preserves the correct heat-transport behavior without accumulating large errors over time.

At the later stage ($t = 2.5 \, upright(s)$\; Figure #ref(<fig:qualitative_field_comparison_2.5>, supplement: none)), heat accumulation becomes more pronounced, particularly in subsurface regions where conduction dominates. Despite a modest increase in the spatial extent of $Delta T$, the predicted temperature fields remain in strong qualitative agreement with the FEM solutions across all materials. No evidence of global drift or temporal instability is observed, indicating stable long-term behavior even when the temperature field is strongly influenced by prior heating.

#figure(image("source/Fig10_12.Qualitative_results/Qualt_1.5.PNG"),
  caption: [
    Qualitative comparison of temperature fields at $t = 1.5 thin upright(s)$ predicted by the proposed framework and FEM simulations for three materials: Ti--6Al--4V, Inconel~718, and SS 316L. (a) Top-surface temperature fields predicted by the proposed framework, the corresponding FEM reference solutions, and the discrepancy $Delta T = hat(T)_(upright(p h y s)) \( Theta \) - T_(upright(F E M))$. (b) the corresponding $x$--$z$ cross-sections following the same ordering.
  ]
)
<fig:qualitative_field_comparison_1.5>

#figure(image("source/Fig10_12.Qualitative_results/Qualt_2.5.PNG"),
  caption: [
    Qualitative comparison of temperature fields at $t = 2.5 thin upright(s)$ predicted by the proposed framework and FEM simulations for three materials: Ti--6Al--4V, Inconel~718, and SS 316L. (a) Top-surface temperature fields predicted by the proposed framework, the corresponding FEM reference solutions, and the discrepancy $Delta T = hat(T)_(upright(p h y s)) \( Theta \) - T_(upright(F E M))$. (b) the corresponding $x$--$z$ cross-sections following the same ordering.
  ]
)
<fig:qualitative_field_comparison_2.5>

Across all time instants, the residual error patterns exhibit consistent spatial structures among different materials despite significant differences in temperature levels and thermophysical properties. Residual discrepancies are primarily concentrated near the melt pool region, where steep temperature gradients and rapidly evolving thermal dynamics produce high-frequency spatiotemporal features that are inherently challenging for PINN models to capture. Among the materials considered, Ti--6Al--4V shows slightly larger discrepancies near the melt pool due to its lower thermal diffusivity and steeper temperature gradients, whereas Inconel~718 and SS~316L exhibit smoother thermal fields and correspondingly smaller residual magnitudes. These observations are consistent with the probe-based thermal history analysis discussed earlier.

Notably, the spatial distribution of errors varies systematically with the thermal conductivity $k$. For materials with lower thermal conductivity, the largest discrepancies appear near the melt pool region, where steep gradients generate high-frequency thermal features that are difficult to resolve. In contrast, materials with higher thermal conductivity exhibit smoother temperature fields due to stronger diffusion, which alleviates errors near the melt pool but introduces larger discrepancies in far-field and late-time regions where accumulated heat diffusion dominates the thermal response.

These behaviors may, in part, be attributed to the identical collocation sampling strategy adopted for all materials in this study. Because different materials exhibit distinct thermal diffusion rates and gradient magnitudes depending on their thermophysical properties, a uniform sampling strategy may be insufficient to resolve the material-dependent spatiotemporal scales present in the temperature field. This limitation suggests that adaptive or material-conditioned sampling strategies could further improve the accuracy of PINN-based thermal models by better resolving both high-frequency melt pool dynamics and diffusion-dominated far-field regimes.

== Temperature prediction on the materials beyond the defined material property space
<temperature-prediction-on-the-materials-beyond-the-defined-material-property-space>
We further evaluate the proposed framework's zero-shot generalizability for materials beyond the defined material property space $cal(M)$. In the ML literature, generalization is typically categorized into in-distribution (ID) and out-of-distribution (OOD) settings. In our case, the distribution is defined over material properties $bold(lambda) = \( rho \, C_p \, k \) in cal(M)$. It's notable that generalization to OOD scenarios is generally considered substantially more challenging than generalization within the training distribution. Accordingly, we select AlSi10Mg and Copper as OOD test cases, with material properties $\( rho \, C_p \, k \) = \( 2670 \, 950 \, 150 \)$ and $\( 8960 \, 385 \, 401 \)$, respectively. In both cases, the thermal conductivity $k$ significantly lies far outside the training range, which was $k in \[ 3 \, 50 \] med upright(W \/ \( m dot.op K \))$.

#figure(
  align(center)[#table(
    columns: 3,
    align: (left,center,center,),
    [Material], [AlSi10Mg], [Copper],
    [$\( rho \, C_p \, k \)$], [$\( 2670 \, 950 \, 150 \)$], [$\( 8960 \, 385 \, 401 \)$],
    [N-PINN~@liao2023hybrid], [$4.25 plus.minus 0.35$], [$1.63 plus.minus 0.13$],
    [P-PINN], [$3.25 plus.minus 0.39$], [$14.38 plus.minus 23.92$],
    [#strong[Proposed]], [$upright(bold(1.75)) plus.minus 0.28$], [$upright(bold(0.69)) plus.minus 0.14$],
  )]
  , caption: [ Quantitative performance comparison with baselines for OOD scenarios: AlSi10Mg and Copper. We report the relative $L_2$ error \[%\] over five random seeds as mean $plus.minus$ standard deviation. All experimental settings were identical except for the number of training epochs to ensure fair comparison. Lower values indicate better performance. ]
  , kind: table
  ) <tab:performance_comparison_OOD>
Table #ref(<tab:performance_comparison_OOD>, supplement: none) demonstrates that the proposed framework outperforms all baseline methods across both OOD test cases, AlSi10Mg and Copper. For AlSi10Mg, all baseline methods achieve reasonably accurate predictions with stable performance. For Copper, however, P-PINN exhibits substantially higher error and variance, indicating a clear performance breakdown.

A plausible explanation lies in the significant difference in thermal diffusivity $alpha$ between Copper and the training material property space. For AlSi10Mg, the thermal diffusivity is $alpha_(upright(A l)) = 59.14 med upright(m m^2 \/ s)$, while the training material property space $cal(M)$ spans $alpha in \[ 0.3 \, thin 55.56 \] med upright(m m^2 \/ s)$. Although AlSi10Mg lies slightly outside the training range, its diffusivity is close to the upper bound of the training domain, which may explain why P-PINN retains reasonable performance in this case. In contrast, Copper exhibits a substantially larger thermal diffusivity of $alpha_(upright(C u)) = 116.24 med upright(m m^2 \/ s)$, far exceeding the range of all training materials. This represents a considerably more challenging OOD scenario and likely accounts for the observed performance degradation of P-PINN. The proposed framework, by comparison, maintains accurate thermal predictions even under this extreme condition, achieving an $L_2$ relative error below $1 %$.

#figure(image("source/Fig13.OOD_Copper/Qualt_Copper.PNG", width: 100.0%),
  caption: [
    Qualitative comparison of temperature fields at $t = 0.5 thin \, 1.5 \, 2.5 upright(s)$ predicted by the proposed framework and FEM simulations for Copper. (a) Top-surface temperature fields predicted by the proposed framework, the corresponding FEM reference solutions, and the discrepancy $Delta T = hat(T)_(upright(p h y s)) \( Theta \) - T_(upright(F E M))$. (b) the corresponding $x$--$z$ cross-sections following the same ordering
  ]
)
<fig:qualitative_field_comparison_Copper>

Figure #ref(<fig:qualitative_field_comparison_Copper>, supplement: none) presents qualitative comparisons with the FEM reference solution at $t in { 0.5 \, 1.5 \, 2.5 } med upright(s)$ for Copper. The proposed framework closely matches the FEM results across all time snapshots, achieving an $L_2$ error below $1 %$ while maintaining a maximum absolute temperature deviation of less than $10 med upright(K)$. Also, this qualitative results suggest a promising direction for future work: Collocation point sampling strategies could be adapted based on material thermophysical properties. For instance, concentrating collocation points near high-gradient regions around the laser footprint may improve resolution of rapid boundary transients for low-conductivity materials. For high-conductivity materials, the dominant thermal evolution tends to occur in late-time and far-field regions with smoother temperature gradients; allocating more collocation points in these regions could therefore enhance modeling accuracy through material-aware sampling.

= Ablation Study
<sec:ablation_study>
In this section, we carry out ablation studies to validate the effectiveness of each component in the proposed framework.

== Physics-Guided Output Scaling
<physics-guided-output-scaling-1>
#figure(
  align(center)[#table(
    columns: 5,
    align: (left,left,center,center,center,),
    table.cell(rowspan: 2)[$hat(T)_(upright(p h y s)) \( Theta \)$], table.cell(rowspan: 2)[$T_(upright(m a x))$], [Ti--6Al--4V], [Inconel 718], [SS 316L],
    [$\( 4430 \, 560 \, 6.7 \)$], [$\( 8220 \, 435 \, 11.4 \)$], [$\( 8000 \, 500 \, 16 \)$],
    [$hat(T)_Theta$], [-], [$77.81 plus.minus 31.91$], [$74.03 plus.minus 37.29$], [$72.39 plus.minus 39.62$],
    [$T_oo + upright(S o f t p l u s) \( hat(T)_Theta \)$ \[Eq.~#link(label("eq:conventional_output_scaling_w/o_Tmax"))[\[eq:conventional\_output\_scaling\_w/o\_Tmax\]]\]], [-], [$38.59 plus.minus 0.00$], [$27.90 plus.minus 0.00$], [$23.05 plus.minus 0.00$],
    table.cell(rowspan: 3)[$T_oo + T_max dot.op upright(S o f t p l u s) \( hat(T)_Theta \)$ \[Eq~#ref(<eq:conventional_output_scaling>, supplement: none)\]], [600], [$13.56 plus.minus 10.64$], [$10.53 plus.minus 7.86$], [$9.30 plus.minus 6.52$],
    [3000], [$5.66 plus.minus 1.45$], [$4.43 plus.minus 1.35$], [$4.10 plus.minus 1.23$],
    [15000], [$6.67 plus.minus 2.29$], [$5.51 plus.minus 1.36$], [$5.09 plus.minus 1.02$],
    [$T_oo + T_max \( bold(lambda) \; Theta \) dot.op upright(S o f t p l u s) \( hat(T)_Theta \)$], [$g_theta \( bold(lambda)_(upright(n o r m)) \)$], [$38.50 plus.minus 0.09$], [$27.85 plus.minus 0.05$], [$23.01 plus.minus 0.04$],
    [$T_oo + kappa dot.op T_max \( bold(lambda) \) dot.op upright(S o f t p l u s) \( hat(T)_Theta \)$ \[Eq.~#ref(<eq:physics_guided_scaling>, supplement: none)\]], [#strong[Proposed]], [$upright(bold(2.71)) plus.minus 0.34$], [$upright(bold(2.18)) plus.minus 0.45$], [$upright(bold(2.17)) plus.minus 0.53$],
  )]
  , caption: [ Ablation study on physics-guided output scaling strategies for material-agnostic temperature prediction. We report $L_2$ error \[%\] averaged over five random seeds as mean$plus.minus$standard deviation. Lower values indicate better performance. ]
  , kind: table
  ) <tab:ablation_scaling>
Table #ref(<tab:ablation_scaling>, supplement: none) presents an ablation study on different output-scaling strategies for material-agnostic temperature prediction. Specifically, directly using the raw network output $hat(T)_Theta$ leads to severely degraded performance with extremely large variance, indicating unstable training and physically implausible predictions. This failure arises because the network is not constrained to satisfy the fundamental thermal condition in metal AM that temperatures remain greater than or equal to the ambient temperature $T_oo$.

Introducing a simple positivity constraint using $T_oo$ and a softplus offset, $T_oo + upright(S o f t p l u s) \( hat(T)_Theta \)$, improves numerical stability but consistently converges to trivial solutions. Although this formulation enforces the admissible thermal constraint $T gt.eq T_oo$, it fails to capture the complex thermal behavior induced by laser heating at the top boundary condition. As a result, the network collapses to a non-physical solution that satisfies the constraint but ignores the governing thermal dynamics. This behavior arises because the network must solely represent temperature fields spanning a very wide physical range---from the ambient temperature ($= 300 thin upright(K)$) to peak temperatures of several thousand Kelvin degree---without any explicit scaling. Learning such a large dynamic range poses a severe optimization challenge, leading to unstable gradient magnitudes and significant training instability.

Extending this approach as in prior works @liao2023hybrid@peng2025prediction by adopting a manually specified constant upper bound $T_max$ provides only limited improvements and remains highly sensitive to hyperparameter selection. Moderate values (e.g., $T_max = 3000$) yield the best performance, whereas underestimation (e.g., $T_max = 600$) leads to significant instability because the imposed scale fails to cover the high peak temperatures generated by laser heating. In this case, similar to the #ref(label("eq:conventional_output_scaling_w/o_Tmax")), the network must compensate by producing extremely large values of $upright(S o f t p l u s) \( hat(T)_Theta \)$ to match the true temperature scale, which results in poorly conditioned gradients and unstable optimization. Conversely, large overestimations (e.g., $T_max = 15000$) restrict the effective range of $upright(S o f t p l u s) \( hat(T)_Theta \)$ to a relatively narrow interval. Although this limits the expressiveness of the scaling and leads to slightly degraded accuracy, it produces better numerical stability than underestimation because the network operates within a more moderate activation range during optimization.

Although previous study reported that overestimating $T_max$ does not significantly degrade performance in non-parametric PINNs trained for a single material @peng2023predicting, this assumption does not hold in cross-material generalization scenarios. In material-agnostic inference, where the model must generalize across unseen material properties, manually selecting a universal temperature scale becomes unreliable and leads to significant performance degradation. Moreover, determining an appropriate $T_max$ for all material configurations is impractical without, for instance, prior access to ground-truth simulations.

We further investigate an alternative by introducing a small auxiliary network $g_theta \( bold(lambda)_(upright(n o r m)) \)$ to predict $T_max$ directly from material properties. However, this scaling strategy introduces additional optimization burden to the network, where multi-objectives already exist, and task interference due to its stochastic nature. As a result, the model frequently converges to trivial solutions similar to those observed in the unconstrained scaling case of Eq.~#ref(label("eq:conventional_output_scaling_w/o_Tmax")).

In contrast, the proposed physics-guided output scaling deterministically constructs a material-conditioned temperature scale grounded in Rosenthal's analytical solution without introducing additional learnable components. This deterministic, physics-informed scaling stabilizes optimization, reduces network complexity, and allows the model to focus on learning a material-agnostic representation of thermal behavior. Consequently, the proposed approach achieves the best performance with consistently minute variance across all materials.

Finally, we conduct a sensitivity analysis on the scaling factor $kappa gt.eq 1$ used in the proposed physics-guided output scaling. Recall that $kappa$ is introduced to compensate for the inherent underestimation of the peak temperature obtained from Rosenthal's analytical solution when applied to metal AM processes due to the simplifying assumptions underlying the analytical model. Throughout this study, the scaling factor is set to $kappa = 1.5$. Table #ref(<tab:sensitivity_analysis>, supplement: none) summarizes the sensitivity results.

#figure(
  align(center)[#table(
    columns: 4,
    align: (left,center,center,center,),
    [#strong[Material]], [#strong[Ti--6Al--4V]], [#strong[Inconel 718]], [#strong[SS 316L]],
    [$\( rho \, C_p \, k \)$], [$\( 4430 \, 560 \, 6.7 \)$], [$\( 8220 \, 435 \, 11.4 \)$], [$\( 8000 \, 500 \, 16 \)$],
    table.cell(align: left, colspan: 4)[#emph[Baselines]],
    [N-PINN], [6.19 $plus.minus$ 1.00], [6.09 $plus.minus$ 0.83], [5.94 $plus.minus$ 0.63],
    [P-PINN], [7.59 $plus.minus$ 3.86], [6.12 $plus.minus$ 3.22], [5.84 $plus.minus$ 2.59],
    table.cell(align: left, colspan: 4)[#emph[Proposed Method]],
    [$kappa = 1.0$], [9.67 $plus.minus$ 13.18], [7.39 $plus.minus$ 9.61], [6.62 $plus.minus$ 7.89],
    [$kappa = 1.25$], [6.56 $plus.minus$ 3.28], [5.38 $plus.minus$ 2.51], [5.23 $plus.minus$ 2.13],
    [$kappa = 1.5$], [$2.71 plus.minus 0.34$], [$2.18 plus.minus 0.45$], [$2.17 plus.minus 0.53$],
    [$kappa = 1.75$], [4.51 $plus.minus$ 1.53], [3.75 $plus.minus$ 1.28], [3.71 $plus.minus$ 1.39],
    [$kappa = 2.0$], [3.83 $plus.minus$ 1.42], [3.21 $plus.minus$ 1.27], [3.16 $plus.minus$ 1.31],
  )]
  , caption: [Sensitivity analysis of the proposed physics-guided output scaling strategy w.r.t. the scaling factor $kappa$. We report $L_2$ error \[%\] averaged over five random seeds as mean$plus.minus$standard deviation. Lower values indicate better performance.]
  , kind: table
  ) <tab:sensitivity_analysis>
#figure(image("source/Fig14_15.Ablation_Studies/Sensitivity.png", width: 100.0%),
  caption: [
    Sensitivity analysis of the proposed physics-guided output scaling strategy w.r.t. the scaling factor $kappa$. Solid lines represent the mean value averaged over five random seeds and the shaded regions indicate ± one standard deviation
  ]
)
<fig:sensitivity>

When $kappa$ is set to smaller values (e.g., $kappa = 1.0$ or $1.25$), the resulting upper bound $T_max$ underestimates the true peak temperature. As a consequence, the network must compensate by producing excessively large values of the normalized output to match the actual temperature scale, which increases the optimization burden and leads to training instability. This behavior is reflected in Table #ref(<tab:sensitivity_analysis>, supplement: none), where $kappa = 1.0$ results in both large prediction errors and extremely high variance. Although the performance improves somewhat at $kappa = 1.25$, the model still exhibits noticeable instability.

In contrast, setting $kappa = 1.5$ provides the closest upper bound that better covers the true temperature range. This reduces the burden on the network to represent extreme temperature magnitudes, resulting in the most stable training behavior and the best predictive accuracy with minimal variance across all materials. As $kappa$ increases further (e.g., $kappa = 1.75$ or $2.0$), the upper bound becomes increasingly overestimated. Although this introduces a mismatch between the scaling and the true temperature range, the resulting degradation in accuracy remains relatively mild compared with the severe instability observed under underestimation. As shown in both Table #ref(<tab:sensitivity_analysis>, supplement: none) and Figure #ref(<fig:sensitivity>, supplement: none), the proposed method consistently outperforms the baseline models even for these larger values of $kappa$.

To sum up, these results highlight the importance of approximating the peak temperature when performing material-agnostic thermal modeling. Requiring the network to directly represent the full temperature range---from $T_oo$ to extreme peak temperatures $T_(upright(m a x))$---introduces a significant optimization burden and often leads to training instability. In contrast, incorporating a physics-guided approximation of the peak temperature through output scaling substantially resolves this burden, enabling stable training and convergence to accurate, non-trivial solutions across any unseen materials.

== Hybrid Optimization
<hybrid-optimization-1>
Table #ref(<tab:ablation_hybrid_LBFGS>, supplement: none) evaluates the impact of the proposed loss optimization strategy against the conventional Adam+L-BFGS approach. In both settings, Adam is applied for the first 2000 epochs, after which different L-BFGS variants are used. While conventional L-BFGS relies on full-batch curvature estimation, our method adopts stochastic mini-batch sampling of collocation points with resampling triggered by changes in curvature information. The results show that the proposed strategy consistently achieves lower error and variance across all three materials.

#figure(
  align(center)[#table(
    columns: 5,
    align: (left,left,center,center,center,),
    table.cell(rowspan: 2)[Method], table.cell(rowspan: 2)[Loss optimization], [Ti--6Al--4V], [Inconel 718], [SS 316L],
    [$\( 4430 \, 560 \, 6.7 \)$], [$\( 8220 \, 435 \, 11.4 \)$], [$\( 8000 \, 500 \, 16 \)$],
    table.cell(rowspan: 2)[#strong[Proposed]], [Adam + L-BFGS], [$18.21 plus.minus 18.26$], [$13.49 plus.minus 12.93$], [$11.54 plus.minus 10.33$],
    [#strong[Proposed]], [$upright(bold(2.71)) plus.minus 0.34$], [$upright(bold(2.18)) plus.minus 0.45$], [$upright(bold(2.17)) plus.minus 0.53$],
  )]
  , caption: [ Ablation study on the synergistic effect of the proposed loss optimization strategy for the kinds of PINNs in metal AM. We report $L_2$ error \[%\] averaged over five random seeds as mean$plus.minus$standard deviation. Lower values indicate better performance. ]
  , kind: table
  ) <tab:ablation_hybrid_LBFGS>
#figure(image("source/Fig14_15.Ablation_Studies/Loss_L2RE_hybrid.png", width: 100.0%),
  caption: [
    Comparison of training dynamics between the Adam+L-BFGS and the proposed hybrid training strategy. (a)--(c) Evolution of the $L_2$ error \[%\] during training for Ti--6Al--4V, Inconel~718, and SS~316L. (d)--(f) Evolution of the loss components in #ref(<eq:pinn_objective_loss>, supplement: none): boundary condition loss~#ref(<eq:loss_bc>, supplement: none), initial condition loss~#ref(<eq:loss_ic>, supplement: none), and PDE residual loss~#ref(<eq:loss_pde>, supplement: none). Solid lines represent the mean over five random seeds, and shaded regions indicate $plus.minus$ one standard deviation.
  ]
)
<fig:ablation_hybrid>

Figure #ref(<fig:ablation_hybrid>, supplement: none) illustrates the performance difference. After the Adam phase until 2000 epochs, the conventional method shows little improvement in both loss and $L_2$ error, likely due to the static curvature information obtained from full-batch updates. In contrast, the proposed method employs stochastic mini-batch sampling of collocation points, introducing mild stochasticity that facilitates optimization. Moreover, collocation points are resampled when curvature information remains unchanged across epochs, enabling continued curvature updates and more effective loss minimization, which leads to a substantial reduction in $L_2$ error.

#figure(
  align(center)[#table(
    columns: 5,
    align: (left,left,center,center,center,),
    table.cell(rowspan: 2)[Method], table.cell(rowspan: 2)[Loss optimization], [Ti--6Al--4V], [Inconel 718], [SS 316L],
    [$\( 4430 \, 560 \, 6.7 \)$], [$\( 8220 \, 435 \, 11.4 \)$], [$\( 8000 \, 500 \, 16 \)$],
    table.cell(rowspan: 2)[N-PINN], [Adam], [$6.19 plus.minus 1.00$], [$bold("6.09") plus.minus 0.83$], [$5.94 plus.minus 0.63$],
    [#strong[Proposed]], [$bold("5.60") plus.minus 2.47$], [$6.56 plus.minus 2.14$], [$bold("4.58") plus.minus 2.00$],
    table.cell(rowspan: 2)[P-PINN], [Adam], [$16.66 plus.minus 2.01$], [$13.14 plus.minus 1.17$], [$11.95 plus.minus 0.92$],
    [#strong[Proposed]], [$bold("7.59") plus.minus 3.86$], [$bold("6.12") plus.minus 3.22$], [$bold("5.84") plus.minus 2.59$],
    table.cell(rowspan: 2)[#strong[Proposed]], [Adam], [$26.49 plus.minus 8.05$], [$19.01 plus.minus 5.78$], [$15.73 plus.minus 4.64$],
    [#strong[Proposed]], [$upright(bold(2.71)) plus.minus 0.34$], [$upright(bold(2.18)) plus.minus 0.45$], [$upright(bold(2.17)) plus.minus 0.53$],
  )]
  , caption: [ Ablation study on the synergistic effect of the proposed loss optimization strategy for the kinds of PINNs in metal AM. We report $L_2$ error \[%\] averaged over five random seeds as mean$plus.minus$standard deviation. Lower values indicate better performance. ]
  , kind: table
  ) <tab:ablation_hybrid>
Table #ref(<tab:ablation_hybrid>, supplement: none) evaluates the impact of the proposed loss optimization strategy across several PINN variants commonly used in metal AM. Notably, the proposed strategy is trained for only $10 \, 000$ epochs, whereas the Adam baseline uses $50 \, 000$ epochs. While the proposed framework along with this strategy achieves the best performance, the results on the baselines also indicate that the benefits of the optimization scheme extend beyond the proposed framework to other PINN formulations.

Specifically, when applied to N-PINN and P-PINN baselines, the proposed strategy consistently yields lower $L_2$ errors than solely using Adam optimizer in most cases. This improvement across different backbones demonstrates broad applicability of the method, especially for parametric formulations where the loss landscape is often stiff and prone to instability. These findings suggest that the proposed strategy mitigates common training challenges in PINN-based thermal modeling for metal AM by significantly reducing extremely long training horizons, benefiting future PINN research regardless of the underlying network architecture.

= Conclusion
<sec:conclusion>
This study addresses the challenge of zero-shot, material-agnostic thermal modeling for metal AM without requiring labeled data, retraining, or pre-training. The proposed framework builds on a parametric PINN formulation that incorporates three key components: (i) a decoupled parametric PINN architecture with FiLM-based conditioning for improved representation learning and physics-inductive bias, (ii) physics-guided output scaling derived from Rosenthal's analytical solution, and (iii) a hybrid optimization strategy designed to alleviate the training instability and long training horizons typical of conventional PINNs.

Extensive experiments demonstrate that the proposed framework achieves high accuracy and efficiency across diverse materials, including challenging OOD cases, enabling fully material-agnostic temperature prediction in a zero-shot inference setting. We further show that parametric PINNs outperform non-parametric PINNs by avoiding material-specific overfitting and providing more accurate thermal modeling. Qualitative analyses additionally reveal how thermophysical material properties influence PINN behavior and generalization.

Finally, rigorous ablation studies and sensitivity analyses identify training instability in parametric PINNs as arising from the increased representational burden of the network, which is addressed by the proposed physics-guided output scaling. We additionally demonstrate that the proposed hybrid optimization strategy effectively mitigates the extremely long training horizons typically observed in PINNs. Last but not least, the modular design of the framework---including the network architecture, output scaling, and optimization strategy---provides a scalable foundation that can be adapted to various scenarios, contributing the advancement of PINN-based thermal modeling in metal AM.

Future work may explore more advanced adaptive sampling strategies, including material-aware sampling as discussed earlier, to better account for the influence of thermophysical material properties in parametric PINNs. Furthermore, extending the proposed framework to incorporate additional process parameters, such as laser power, scanning speed or laser paths, within the proposed decoupled architecture combined with physics-guided output scaling could further improve generalization to unseen process conditions.

Nonetheless, several limitations should be acknowledged. The current framework assumes temperature-independent material properties, which may require calibration when applied to real-world scenarios. In addition, the present study focuses solely on thermal modeling; incorporating more complex physics such as thermo-fluid dynamics and phase transitions could provide deeper insights, particularly in melt pool regions where extreme thermal gradients are induced by laser irradiation. Lastly, this work considers only single-material AM. Our future research will investigate the applicability of the proposed framework to multi-material AM systems.

#heading(level: 1, numbering: none)[Acknowledgment]
<acknowledgment>
This work was supported by the National Research Foundation of Korea (NRF) grant funded by the Korea government (MSIT) (RS-2025-02216260).

#heading(level: 1, numbering: none)[Disclosure statement]
<disclosure-statement>
The authors report there are no competing interests to declare.

#heading(level: 1, numbering: none)[Data availability statement]
<data-availability-statement>
The data and code are available at #link("https://github.com/hsleecri/MaterialAgnosticTempPred").

#bibliography("source/ref.bib", style: "ieee")

#counter(heading).update(0)
#set heading(numbering: "A.1")

= Appendix
<appendix>
== Nomenclature
<app:nomenclature>
#figure(
  align(center)[#table(
    columns: 3,
    align: (left,left,left,),
    table.header([#strong[Symbol]], [#strong[Description]], [#strong[Unit]],),
    table.hline(),
    [$Omega$], [Spatial domain], [mm$""^3$],
    [$partial Omega$], [Boundary of spatial domain], [--],
    [$cal(D)$], [Spatiotemporal domain $Omega times \[ 0 \, t_(upright(e n d)) \]$], [--],
    [$cal(M)$], [Material property space], [--],
    [$bold(lambda)$], [Material property vector], [--],
    [$lambda_m$], [$m$-th material property component], [--],
    [$T \( upright(bold(x)) \, t \, bold(lambda) \)$], [Temperature field], [K],
    [$hat(T)_Theta$], [Predicted raw temperature field], [K],
    [$hat(T)_(upright(p h y s))$], [Predicted physically admissible temperature field], [K],
    [$Theta$], [Set of learnable network parameters], [--],
    [$cal(F)_Theta$], [Parametric PINN mapping function], [--],
    [$g_(theta_(upright(bold(x)) \, t))$], [Spatiotemporal feature extraction network], [--],
    [$g_(theta_(bold(lambda)))$], [Material property encoder], [--],
    [$g_(theta_c)$], [Fusion network], [--],
    [$cal(N) \( dot.op \)$], [PDE residual operator], [--],
    [$cal(B) \( dot.op \)$], [Boundary condition operator], [--],
    [$cal(I) \( dot.op \)$], [Initial condition operator], [--],
    [$cal(L)$], [Total PINN loss function], [--],
    [$cal(L)_(upright(p d e))$], [PDE residual loss], [--],
    [$cal(L)_(upright(b c))$], [Boundary condition loss], [--],
    [$cal(L)_(upright(i c))$], [Initial condition loss], [--],
    [$w_(upright(p d e)) \, w_(upright(b c)) \, w_(upright(i c))$], [Loss weights], [--],
    [$N_(upright(p d e))$], [Number of PDE collocation points], [--],
    [$N_(upright(b c))$], [Number of boundary collocation points], [--],
    [$N_(upright(i c))$], [Number of initial condition collocation points], [--],
    [$rho$], [Density], [kg m$""^(- 3)$],
    [$C_p$], [Specific heat capacity], [J kg$""^(- 1)$ K$""^(- 1)$],
    [$k$], [Thermal conductivity], [W m$""^(- 1)$ K$""^(- 1)$],
    [$alpha$], [Thermal diffusivity ($alpha = k \/ \( rho C_p \)$)], [m$""^2$ s$""^(- 1)$],
    [$T_0$], [Initial temperature], [K],
    [$T_oo$], [Ambient temperature], [K],
    [$T_max$], [Estimated maximum temperature], [K],
    [$kappa$], [Scaling factor for $T_max$], [--],
    [$eta$], [Laser absorptivity], [--],
    [$P$], [Laser power], [W],
    [$r_(upright(l a s e r))$], [Laser beam radius], [m],
    [$v$], [Laser scanning speed], [m s$""^(- 1)$],
    [$upright(bold(x))_(upright(l a s e r)) \( t \)$], [Laser center position], [m],
    [$q_(upright(l a s e r))$], [Laser heat flux], [W m$""^(- 2)$],
    [$q_(upright(c o n v))$], [Convective heat flux], [W m$""^(- 2)$],
    [$q_(upright(r a d))$], [Radiative heat flux], [W m$""^(- 2)$],
    [$h$], [Convection heat transfer coefficient], [W m$""^(- 2)$ K$""^(- 1)$],
    [$e$], [Surface emissivity], [--],
    [$sigma$], [Stefan--Boltzmann constant], [W m$""^(- 2)$ K$""^(- 4)$],
    [$upright(bold(n))$], [Outward unit normal vector], [--],
  )]
  , caption: [List of symbols used in this paper]
  , kind: table
  ) <tab:nomenclature_final>
== Training Algorithm
<app:training_algorithm>
#procedure([Training the Proposed Framework for Material-Agnostic Temperature Prediction],
  (0, true, [#strong[Input:] Spatiotemporal domain $cal(D)$, material property space $cal(M)$]),
  (0, true, [#strong[Parameters:] Scale factor $kappa$\; collocations $N_(upright(b c)) \, N_(upright(p d e)) \, N_(upright(i c))$\; loss weights $w_(upright(b c)) \, w_(upright(p d e)) \, w_(upright(i c))$\; learning rates $l r_(upright(A d a m)) \, l r_(upright(L - B F G S))$\; epochs $J_(upright(A d a m)) \, J_(upright(L - B F G S))$\; batch size $\| B \|$\; process parameters $P \, eta \, r_(upright("laser")) \, v \, upright(bold(x))_0 \, T_0 \, T_oo \, h \, e$]),
  (0, true, [#strong[Output:] Trained model $cal(F)_Theta$ for zero-shot thermal inference over any material $bold(lambda)$]),
  (0, true, [Initialize $Theta^(\( 0 \)) = { theta_(upright(bold(x)) \, t)^(\( 0 \)) \, theta_(bold(lambda))^(\( 0 \)) \, theta_c^(\( 0 \)) }$\; sample collocation points from $cal(D) times cal(M)$]),
  (0, false, [#strong[\\/\/ Phase 1: Adam]]),
  (0, true, [#strong[for] $j = 1$ to $J_(upright(A d a m))$]),
  (1, true, [Sample $B subset cal(D) times cal(M)$]),
  (1, true, [Compute $hat(T)_(upright(p h y s)) \( Theta \)$ via Eq.~#ref(<eq:physics_guided_scaling>, supplement: none) and $cal(L)_Theta$ via Eq.~#ref(<eq:pinn_objective_loss>, supplement: none)]),
  (1, true, [Update $Theta^(\( j \))$ via Eq.~#ref(<eq:adam_update>, supplement: none)]),
  (0, true, [#strong[end for]]),
  (0, false, [#strong[\\/\/ Phase 2: Mini-batch L-BFGS]]),
  (0, true, [#strong[for] $j = 1$ to $J_(upright(L upright("-") B F G S))$]),
  (1, true, [Sample $B subset cal(D) times cal(M)$]),
  (1, true, [Compute $hat(T)_(upright(p h y s)) \( Theta \)$ via Eq.~#ref(<eq:physics_guided_scaling>, supplement: none) and $cal(L)_Theta$ via Eq.~#ref(<eq:pinn_objective_loss>, supplement: none)]),
  (1, true, [Update $Theta^(\( j \))$ via Eq.~#ref(<eq:lbfgs_update>, supplement: none)]),
  (1, true, [#strong[if] $upright(bold(H))_j^(- 1) approx upright(bold(H))_(j - 1)^(- 1)$]),
  (2, true, [Resample $cal(B)$ from $cal(D) times cal(M)$]),
  (1, true, [#strong[end if]]),
  (0, true, [#strong[end for]]),
  (0, true, [#strong[return] $Theta^(\( J_(upright(A d a m)) + J_(upright(L upright("-") B F G S)) \))$]),
) <alg:overall_training>

== Governing Equations and Boundary Conditions
<app:governing_eqs>
The transient heat transfer in the bare plate metal AM process is governed by the conservation of energy coupled with Fourier's law of heat conduction. The temperature field $T \( upright(bold(x)) \, t \; bold(lambda) \)$ satisfies 

#unnumbered[
$ upright("Governing PDE:") quad & rho C_p frac(partial T, partial t) - nabla dot.op #scale(x: 120%, y: 120%)[\(] k nabla T #scale(x: 120%, y: 120%)[\)] = 0 &  & upright(bold(x)) in Omega \, #h(0em) t > 0\
upright("Initial condition:") quad & T \( upright(bold(x)) \, 0 \; bold(lambda) \) = T_0 &  & upright(bold(x)) in Omega $
]

 The boundary $partial Omega$ is decomposed into the top surface $Gamma_(upright(t o p))$, the side surfaces $Gamma_(upright(s i d e))$, and the bottom surface $Gamma_(upright(b o t t o m))$. The corresponding boundary conditions are specified as follows. 

#unnumbered[
$ upright("Top surface:") quad & - k nabla T dot.op upright(bold(n)) = q_(upright(l a s e r)) + q_(upright(c o n v)) + q_(upright(r a d)) &  & upright(bold(x)) in Gamma_(upright(t o p)) \, #h(0em) t > 0\
upright("Side surfaces:") quad & - k nabla T dot.op upright(bold(n)) = q_(upright(c o n v)) + q_(upright(r a d)) &  & upright(bold(x)) in Gamma_(upright(s i d e)) \, #h(0em) t > 0\
upright("Bottom surface:") quad & T \( upright(bold(x)) \, t \; bold(lambda) \) = T_0 &  & upright(bold(x)) in Gamma_(upright(b o t t o m)) \, #h(0em) t > 0 $
]

 Here, the laser heat flux is imposed on the top surface. The applied laser heat flux is modeled using a Gaussian surface heat source, 

#unnumbered[
$ q_(upright(l a s e r)) \( upright(bold(x)) \, t \) = frac(2 eta P, pi r_(upright(l a s e r))^2) exp #h(-1em) (- frac(2 lr(bar.v.double upright(bold(x)) - upright(bold(x))_(upright(l a s e r)) \( t \) bar.v.double)^2, r_(upright(l a s e r))^2)) $
]

 where $eta$ denotes the laser absorptivity, $P$ is the laser power, $r_(upright(l a s e r))$ is the laser beam radius, and $upright(bold(x))_(upright(l a s e r)) \( t \)$ is the time-dependent laser center position. The laser center follows a prescribed scanning path given by $upright(bold(x))_(upright(l a s e r)) \( t \) = upright(bold(x))_0 + upright(bold(v)) thin t$. In this study, a one-dimensional scan along the $x$-axis on the top surface is considered, i.e., $upright(bold(v)) = \( v \, 0 \, 0 \)$.

Convective and radiative heat fluxes are applied to all remaining surfaces except the substrate bottom, where a fixed-temperature Dirichlet boundary condition is specified. The convective and radiative heat fluxes are given by 

#unnumbered[
$ q_(upright(c o n v)) \( upright(bold(x)) \, t \) & = h #scale(x: 120%, y: 120%)[\(] T \( upright(bold(x)) \, t \) - T_0 #scale(x: 120%, y: 120%)[\)]\
q_(upright(r a d)) \( upright(bold(x)) \, t \) & = sigma e #scale(x: 120%, y: 120%)[\(] T \( upright(bold(x)) \, t \)^4 - T_0^4 #scale(x: 120%, y: 120%)[\)] $
]

 where $h$ is the convection heat transfer coefficient, $sigma$ is the Stefan--Boltzmann constant, and $e$ is the surface emissivity.

== Implementation Details
<app:implementation>
The total number of collocation points sampled from the entire input domain during training is 555,338, consisting of $N_(upright(B C)) = 137 \, 555$, $N_(upright(I C)) = 909$, and $N_(upright(P D E)) = 416 \, 874$. The boundary points are distributed as follows: $N_(+ x) = 4 \, 697$, $N_(+ y) = 17 \, 507$, $N_(- x) = 4 \, 697$, $N_(- y) = 17 \, 507$, $N_(Gamma_(upright(t o p))) = 65 \, 636$, and $N_(Gamma_(upright(b o t t o m))) = 27 \, 511$.

During training, the mini-batch sizes $\| B \|$ for the Adam phase are $\| B \|_(upright(B C)) = 12 \, 000$, $\| B \|_(upright(I C)) = 6 \, 000$, and $\| B \|_(upright(P D E)) = 20 \, 000$. For the L-BFGS phase, the mini-batch sizes are $\| B \|_(upright(B C)) = 8 \, 000$, $\| B \|_(upright(I C)) = 4 \, 000$, and $\| B \|_(upright(P D E)) = 12 \, 000$.

As aforementioned, the material property vector $bold(lambda)$ is sampled uniformly at random from the admissible space $cal(M)$ for each mini-batch during training, independently of the spatiotemporal collocation points.

All networks use the hyperbolic tangent ($tanh$) activation function. To prevent convergence to degenerate solutions where the boundary condition loss is minimized by collapsing the temperature field to the ambient value (i.e., trivial local optima), a small positive offset $epsilon.alt$ is added to the $upright(S o f t p l u s)$ activation in Eq.~#ref(<eq:physics_guided_scaling>, supplement: none): 

#unnumbered[
$ upright(S o f t p l u s) \( hat(T)_Theta \) + epsilon.alt \, quad epsilon.alt = 10^(- 3) $
]



To prevent numerical overflow caused by the fourth-power radiation term, we implement a clipping mechanism to clip $hat(T)_(upright(p h y s)) \( Theta \)$ at implausibly high values (e.g., $10^6$ K), which ensures that the high-order derivatives do not destabilize the optimization, allowing for robust convergence.

Similarly to the spatiotemporal coordinates, material properties are normalized to the range $\[ - 1 \, 1 \]$ using the known bounds $\[ bold(lambda)_min \, bold(lambda)_max \]$ before being fed into the material branch network to ensure stable training.

For the L-BFGS phase, the optimizer is configured with a learning rate of $1.0$, a maximum of $50$ quasi-Newton iterations per step, a history size of $50$, and the strong Wolfe line-search condition.
]
