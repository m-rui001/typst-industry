// Adapted from arXiv:2506.10824v1 by Rojas-Innocenti et al.
// https://arxiv.org/abs/2506.10824v1
// Original work: CC BY 4.0, https://creativecommons.org/licenses/by/4.0/
#set page(paper: "a4", margin: 19mm)
#set text(size: 10pt, lang: "en")
#set par(justify: true)
#set heading(numbering: "1.1")
#set math.equation(numbering: "(1)")
#set table(inset: 3pt)
#title[A Robust Optimization Framework for Flexible Industrial Energy Scheduling: Application to a Cement Plant with Market Participation]
#align(center)[Sebastián Rojas-Innocenti (1), Enrique Baeyens (2), Alejandro Martín-Crespo (1), Sergio Saludes-Rodil (1), and Fernando Frechoso Escudero (3)]
#align(center)[#text(size: 8pt)[(1) CARTIF Technology Centre, Valladolid, Spain · (2) Universidad de Valladolid, Instituto de las Tecnologías Avanzadas de la Producción, Spain · (3) Universidad de Valladolid, Departamento de Ingeniería Eléctrica, Spain]]

#heading(level: 1, numbering: none)[Abstract]
<abstract>
This paper presents a scenario based robust optimization framework for short term energy scheduling in electricity intensive industrial plants, explicitly addressing uncertainty in planning decisions. The model is formulated as a two-stage Mixed Integer Linear Program (MILP) and integrates a hybrid scenario generation method capable of representing uncertain inputs such as electricity prices, renewable generation, and internal demand. A convex objective function combining expected and worst case operational costs allows for tunable risk aversion, enabling planners to balance economic performance and robustness. The resulting schedule ensures feasibility across all scenarios and supports coordinated use of industrial flexibility assets, including battery energy storage and shiftable production. To isolate the effects of market volatility, the framework is applied to a real world cement manufacturing case study considering only day-ahead electricity price uncertainty, with all other inputs treated deterministically. Results show improved resilience to forecast deviations, reduced cost variability, and more consistent operations. The proposed method offers a scalable and risk-aware approach for industrial flexibility planning under uncertainty.

#strong[Keywords:] Robust Optimization, Industrial Energy Scheduling, Flexibility Planning, Uncertainty Modeling, Scenario Generation, Two-Stage MILP, Electricity Markets.

= Introduction
<introduction>
The increasing penetration of variable renewable energy sources has introduced significant volatility into electricity markets, posing new challenges for electricity-intensive industrial consumers. These facilities are now expected to deliver demand-side flexibility---not only to reduce energy costs but also to support grid stability. However, effective participation in electricity markets requires decisions to be made under uncertainty, particularly in short-term operations, where both prices and internal demand may deviate from forecasts.

Prior studies have explored industrial demand-side flexibility primarily through deterministic optimization models~\[1\], \[2\], which assume perfect foresight of electricity prices and production needs. While valuable for baseline assessments, these models may underperform in practice due to their inability to cope with the high uncertainty present in volatile markets or variable-load processes.

To address this limitation, we propose a robust optimization framework formulated as a two-stage Mixed Integer Linear Program (MILP). The model explicitly accounts for multiple sources of uncertainty---including day-ahead electricity prices, renewable generation, and internal demand---via a hybrid, data-driven scenario generation approach. The objective function is defined as a convex combination of expected and worst-case operational costs, enabling decision-makers to tune the risk aversion level through a continuous parameter. The resulting solution is guaranteed to be feasible under all considered scenarios and coordinates the operation of industrial flexibility assets such as battery energy storage systems (BESS) and shiftable production processes.

The framework is applied to a real-world cement manufacturing plant in Spain. Although the model can handle multiple uncertainty sources, the case study focuses specifically on price uncertainty to isolate its effect on scheduling and flexibility activation.

#strong[Structure of the paper:] Section~@sec:literature reviews relevant literature on industrial flexibility and robust optimization. Section~@sec:Methodology presents the proposed methodology, including the scenario generation and MILP formulation. Section~@sec:case_study describes the industrial use case. Section~@sec:results provides simulation results, and Section~@sec:conclusions concludes with key findings and future research directions.

= Literature Review
<sec:literature>
This section reviews two complementary strands of literature that form the foundation for the proposed robust scheduling framework: Deterministic optimization approaches for industrial demand response, and robust optimization methods for energy systems under uncertainty.

#heading(level: 2, numbering: none)[Deterministic Demand Response in Industry]
<deterministic-demand-response-in-industry>
Industrial demand-side response (DSR) is increasingly seen as a key enabler of power system flexibility~\[3\], \[4\]. Deterministic optimization techniques---such as MILP, heuristics, and Model Predictive Control (MPC)---are commonly used to align electricity consumption with price signals while maintaining process feasibility~\[5\], \[6\].

In the cement industry, flexibility is primarily concentrated in stages like raw milling and grinding, which are decoupled from the kiln through intermediate storage~\[7\], \[8\], \[9\]. For instance, Rombouts et al.~\[10\] estimate that around 24% of electricity usage in a Belgian cement plant is shiftable. Other examples include the use of genetic algorithms to reduce energy costs under time-of-use tariffs~\[11\], and MILP-based scheduling to participate in ancillary service markets~\[12\], \[13\].

Similar flexibility is observed in the steel industry, where electric arc furnaces (EAFs) operate in batches and tolerate scheduling shifts~\[14\]. Boldrini et al.~\[5\] propose a MILP model for joint participation in day-ahead and reserve markets, achieving both cost savings and revenue improvements.

Other sectors---such as pulp and paper~\[15\], water treatment~\[16\], and food processing~\[17\]---also exploit flexibility through storage or interruptible loads. Recent meta-analyses show that industrial sites with BESS outperform residential systems in up-regulation services~\[18\].

Overall, these works confirm the technical and economic potential of industrial DSR. However, their reliance on perfect foresight restricts their effectiveness in real-world settings marked by uncertainty.

#heading(level: 2, numbering: none)[Robust Optimization under Uncertainty]
<robust-optimization-under-uncertainty>
Robust optimization provides a viable alternative to deterministic models for planning under uncertainty. By ensuring feasibility across a range of possible realizations, these models enhance resilience against forecast deviations~\[19\], \[20\], \[21\], \[22\].

For example, Fang et al.~\[23\] develop robust schedules for industrial loads under price uncertainty, outperforming both deterministic and stochastic models. Other applications include building control~\[24\], microgrids~\[25\].

More recent studies have extended robust optimization to complex industrial systems. Yang et al.~\[26\] introduce a two-stage framework for wind uncertainty and demand response in large consumers. Xu et al.~\[27\] propose a distributionally robust model for spatiotemporal renewable uncertainty with embedded demand response.

These contributions reflect a growing shift toward risk-aware, uncertainty-resilient industrial energy management.

#heading(level: 2, numbering: none)[Research Gaps and Contributions of This Study]
<research-gaps-and-contributions-of-this-study>
Despite the progress outlined above, several important research gaps remain---particularly in the cement sector. First, few studies jointly optimize production scheduling and flexibility activation under realistic, scenario based uncertainty. Most existing models rely on deterministic formulations or limited uncertainty representations, which fail to capture the variability inherent in real industrial environments. Second, there is a lack of models that incorporate a tunable risk aversion mechanism, limiting the ability to balance expected cost and robustness in a systematic way. Finally, only a handful of works consider the integration of market based flexibility mechanisms such as the SIDC, or the simultaneous use of BESS alongside process level flexibility.

This study addresses these gaps by proposing a scenario based robust MILP framework that enables explicit risk tuning through a convex combination of worst case and expected costs. The model embeds key industrial constraints---including binary scheduling decisions, inventory management, and detailed BESS operation---within a unified and computationally tractable formulation. To demonstrate practical relevance, the framework is validated through a real world case study in cement manufacturing, using empirical market data and representative operational parameters.

In doing so, the paper contributes a practical, modular, and industry ready tool for robust energy scheduling in uncertainty prone industrial environments.

= Methodology
<sec:Methodology>
This section presents the integrated methodological framework for flexible industrial production scheduling under uncertainty. The approach combines a hybrid scenario generation technique with a two-stage robust Mixed Integer Linear Programming model, extending previously validated two-stage formulations with explicit uncertainty modeling.

== Methodological Overview
<methodological-overview>
The methodology integrates two main components:

- #strong[Hybrid Scenario Generation]: A data driven procedure combining time series forecasting, residual based stochastic simulation, and clustering, to produce representative scenarios of uncertain parameters.

- #strong[Two-Stage Robust Optimization]: A MILP framework for production scheduling and flexibility activation under uncertainty, formulated over the generated scenario set.

The two-stage structure is preserved across deterministic and robust models, with uncertainty treatment being the primary differentiator.

== Hybrid Scenario Generation for Robust Optimization
<sec:scenario_generation>
To explicitly incorporate uncertainty into the optimization model, a hybrid scenario generation technique is adopted. The process consists of three sequential phases designed to generate a compact yet expressive set of scenarios that represent the variability of key inputs:

+ #strong[Forecasting Phase:] Historical time series of uncertain variables---including day-ahead electricity prices, photovoltaic (PV) generation, and internal production demand---are modeled using seasonal ARIMA techniques~\[28\]. These models capture key features such as autocorrelation, trend, and seasonality. The resulting deterministic forecasts serve as a reference trajectory anchoring the scenario generation process.

+ #strong[Residual Simulation:] To reflect forecast uncertainty, residuals from the fitted ARIMA models are resampled and superimposed on the deterministic forecast. This procedure generates a large ensemble of stochastic trajectories that retain temporal coherence while incorporating variability consistent with historical forecast errors.

+ #strong[Clustering and Scenario Reduction:] The ensemble is normalized to remove magnitude biases and clustered using the K-Means algorithm~\[29\]. The centroids of each cluster define the representative scenarios. Probabilities are assigned based on the relative size of each cluster, enabling the construction of a weighted scenario set for expected value calculations.

This three-phase structure encapsulates the key strengths of the hybrid scenario generation method. Table~@tab:features_scenario_generation summarizes its main design features and advantages, highlighting how each step contributes to building a compact, representative, and risk-aware scenario set suitable for robust optimization.

#figure(
  align(center)[#table(
    columns: 2,
    align: (left,left,),
    table.header([#strong[Feature]], [#strong[Advantage]],),
    table.hline(),
    [Forecast anchoring], [Captures underlying temporal structure],
    [Stochastic perturbation], [Reflects realistic short-term forecast uncertainty],
    [Clustering], [Compresses the scenario space while preserving variability],
    [Probability assignment], [Enables risk-weighted cost evaluation],
  )]
  , caption: [Key Features of the Hybrid Scenario Generation Approach]
  , kind: table
  ) <tab:features_scenario_generation>
==== Theoretical Justification.
<theoretical-justification.>
This scenario generation methodology builds upon well-established principles in scenario-based robust optimization~\[21\], \[30\], \[31\] and portfolio-based risk-return trade-offs~\[32\]. It has been successfully applied in various energy systems contexts, including microgrids and distributed energy resources~\[33\]. By clustering representative trajectories, the approach strikes a balance between statistical richness and computational tractability---two key requirements for efficient robust MILP formulation.

== Deterministic Two-Stage MILP Framework (Reference Model)
<deterministic-two-stage-milp-framework-reference-model>
The deterministic two-stage MILP framework developed and validated in previous studies~\[1\], \[2\] optimizes production scheduling and flexibility activation assuming perfect foresight.

=== Stage 1: Baseline Production Scheduling
<stage-1-baseline-production-scheduling>
==== Problem Structure
<problem-structure>
The system includes:

- Flexible production units $k in cal(K)$,

- Product storage silos $i in cal(S)$,

- On-site photovoltaic generation,

- Battery Energy Storage System (BESS),

- Connection to the public electricity grid.

==== Decision Variables
<decision-variables>
- $Y_(k \, t) in { 0 \, 1 }$: Production unit on/off status,

- $I_(i \, t) gt.eq 0$: Silo inventory level,

- $P_(b \, t) \, P_(s \, t) gt.eq 0$: Grid import/export,

- $P_(C \, t) \, P_(D \, t) gt.eq 0$: BESS charging/discharging powers,

- $upright(S O C)_t gt.eq 0$: BESS state of charge.

==== Objective Function
<objective-function>
$ min #h(0em) Phi = sum_(t in cal(T)) (pi_(b \, t) P_(b \, t) + pi_U \( P_(C \, t) + P_(D \, t) \) + sum_(i in cal(S)) pi_(S \, i \, t) I_(i \, t)) Delta t $

==== Constraints
<constraints>
- #strong[Mass Balance]: $ sum_(k in cal(K)) Pi_k Y_(k \, t) + sum_(i in cal(S)) I_(i \, t - 1) = sum_(i in cal(S)) I_(i \, t) \, quad forall t in cal(T) $

- #strong[Power Balance]: $ P_(b \, t) + P_(D \, t) + P_(upright(P V) \, t) = P_(s \, t) + P_(C \, t) + sum_(k in cal(K)) P_k Y_(k \, t) \, quad forall t in cal(T) $

- #strong[Inventory Limits]: $ I_(i \, min) lt.eq I_(i \, t) lt.eq I_(i \, max) \, quad forall i in cal(S) \, #h(0em) t in cal(T) $

- #strong[Demand Coverage]: $ sum_(i in cal(S)) I_(i \, t) gt.eq D_t \, quad forall t in cal(T) $

- #strong[BESS Dynamics]: $ upright(S O C)_t = upright(S O C)_(t - 1) + \( P_(C \, t) - P_(D \, t) \) Delta t \, quad forall t in cal(T) $

- #strong[BESS Limits]: $ C_max \( 1 - upright(D o D) \) lt.eq upright(S O C)_t lt.eq C_max \, quad forall t in cal(T) $

- #strong[Charging/Discharging Power Limits]: $ 0 lt.eq P_(C \, t) lt.eq P_C^max \, quad 0 lt.eq P_(D \, t) lt.eq P_D^max \, quad forall t in cal(T) $

- #strong[Grid Import Limit]: $ 0 lt.eq P_(b \, t) lt.eq P_b^max \, quad forall t in cal(T) $

- #strong[Minimum Uptime and Downtime Constraints]: $ \( Y_(k \, t + 1) - Y_(k \, t) \) M_k^(upright(O N)) & lt.eq sum_(j = 1)^(M_k^(upright(O N))) Y_(k \, t + j) \, quad forall k in cal(K) \, #h(0em) t lt.eq N_T - M_k^(upright(O N))\
  sum_(j = 1)^(M_k^(upright(O F F))) Y_(k \, t + j) & lt.eq \( 1 + Y_(k \, t + 1) - Y_(k \, t) \) M_k^(upright(O F F)) \, quad forall k in cal(K) \, #h(0em) t lt.eq N_T - M_k^(upright(O F F)) $

=== Stage 2: Flexibility Activation via SIDC Participation
<stage-2-flexibility-activation-via-sidc-participation>
==== Conceptual Overview
<conceptual-overview>
Flexibility is activated by adjusting the baseline plan through continuous intraday market participation, subject to operational feasibility.

==== New Decision Variable
<new-decision-variable>
- $P_(m \, t)$: Power traded in the SIDC at time $t$ (positive for purchases, negative for sales).

==== Flexible Objective Function
<flexible-objective-function>
$ Phi^dagger = sum_(t in cal(T)) (pi_(b \, t) P_(b \, t) + pi_(m \, t) P_(m \, t) + pi_U \( P_(C \, t) + P_(D \, t) \) + sum_(i in cal(S)) pi_(S \, i \, t) I_(i \, t)) Delta t $

==== Additional Constraints
<additional-constraints>
- #strong[SIDC Trading Period]: $ P_(m \, t) & = 0 \, quad forall t < tau_1 #h(0em) upright("or") #h(0em) t > tau_2\
  \| P_(m \, t) \| & lt.eq L C 1 \, quad forall t in \[ tau_1 \, tau_2 \] $

- #strong[Grid Import Outside Trading Window]: $ P_(b \, t) = P_(b \, t)^(*) \, quad forall t lt.eq tau_2 $

- #strong[Updated Power Balance]: $ P_(b \, t) + P_(m \, t) + P_(D \, t) + P_(upright(P V) \, t) = P_(s \, t) + P_(C \, t) + sum_(k in cal(K)) P_k Y_(k \, t) \, quad forall t in cal(T) $

==== Flexibility Revenue
<flexibility-revenue>
The flexibility benefit is quantified as:

$ Delta Phi = Phi^(*) - Phi^dagger $

where a positive $Delta Phi$ indicates profitable market participation.

== Scenario-Based Robust Two-Stage MILP Framework (New Contribution)
<scenario-based-robust-two-stage-milp-framework-new-contribution>
Building on the deterministic structure, a scenario-based robust MILP model is developed to account for uncertainty in day-ahead electricity prices, PV generation, and production demand.

==== Decision Structure
<decision-structure>
- #strong[Non-adaptive decisions]: Binary production schedules $Y_(k \, t)$ shared across all scenarios.

- #strong[Adaptive decisions]: Operational variables ($P_(b \, t)^s$, $P_(C \, t)^s$, $P_(D \, t)^s$, $I_(i \, t)^s$) adapted to each scenario $s in S$.

=== First-Stage Robust Baseline Scheduling
<first-stage-robust-baseline-scheduling>
==== Robust Objective Function
<robust-objective-function>
$ min [\( 1 - alpha \) max_(s in S) Phi^(upright(B L) \, s) + alpha sum_(s in S) rho_s Phi^(upright(B L) \, s)] $

where $Phi^(upright(B L) \, s)$ is the baseline cost in scenario $s$, $rho_s$ is the probability weight of scenario $s$, and $alpha in \[ 0 \, 1 \]$ controls the risk aversion.

=== Second-Stage Robust Flexibility Activation
<sec:2nd_stage_robust>
==== Robust Flexible Objective Function
<robust-flexible-objective-function>
$ min [\( 1 - alpha \) max_(s in S) Phi^(upright(F L X) \, s) + alpha sum_(s in S) rho_s Phi^(upright(F L X) \, s)] $

where $Phi^(upright(F L X) \, s)$ denotes the total flexible production cost under scenario $s$.

==== Constraints
<constraints-1>
All system constraints (mass balance, power balance, BESS dynamics, demand satisfaction, trading limits) are enforced independently for each $\( t \, s \)$ pair, summarized in table~@tab:constraint_comparison.

#figure(
  align(center)[#table(
    columns: 3,
    align: (left,left,left,),
    table.header([#strong[Constraint Type]], [#strong[Deterministic Model]], [#strong[Robust Model]],),
    table.hline(),
    [Power balance], [For each $t$], [For each $\( t \, s \)$ (Adaptive)],
    [BESS dynamics], [For each $t$], [For each $\( t \, s \)$ (Adaptive)],
    [Inventory dynamics], [For each $t$], [For each $\( t \, s \)$ (Adaptive)],
    [Demand satisfaction], [For each $t$], [For each $\( t \, s \)$ (Adaptive)],
    [SIDC trading], [Only in Stage 2], [In Stage 2 across $\( t \, s \)$ (Adaptive)],
    [Minimum uptime/downtime], [For each $t$], [Shared across scenarios (Non-Adaptive)],
  )]
  , caption: [Comparison of Constraint Application in Deterministic vs Robust Models]
  , kind: table
  ) <tab:constraint_comparison>
==== Rationale for the Weighted Robust Objective
<rationale-for-the-weighted-robust-objective>
Instead of pursuing a purely conservative (min-max) optimization, the proposed framework adopts a weighted robust objective that allows explicit tuning between worst-case protection and expected cost minimization~\[19\], \[20\], \[21\]. This is achieved through a convex combination governed by the parameter $alpha$:

- $alpha = 0$: Fully conservative optimization that minimizes the worst-case cost across all scenarios.

- $alpha = 1$: Risk-neutral optimization that minimizes the expected cost, assuming probabilistic weights.

- $0 < alpha < 1$: Risk-averse optimization balancing robustness and performance.

This formulation enables the decision-maker to flexibly tailor the optimization strategy based on the system's criticality, tolerance to risk, and operational context.

#heading(level: 2, numbering: none)[Summary of the Methodological Structure]
<summary-of-the-methodological-structure>
The framework distinguishes between decision adaptiveness and sequential scheduling stages:

- #strong[Non-adaptive decisions:] Shared across all scenarios (e.g., unit commitment $Y_(k \, t)$); determined before uncertainty is realized.

- #strong[Adaptive decisions:] Scenario-specific variables (e.g., grid imports, BESS dispatch, inventories) that respond to realized conditions.

- #strong[Stage~1 -- Robust Baseline Scheduling:] A full robust MILP, where SIDC trading is disabled, but all other decisions---including adaptive ones---are optimized under uncertainty.

- #strong[Stage~2 -- Flexibility Activation:] A second robust MILP is solved where early baseline decisions are fixed. SIDC trading is enabled within its window, while the remaining controls are re-optimized per scenario over the rest of the horizon.

This framework combines scenario-based uncertainty modeling with a layered optimization approach that distinguishes between non-adaptive and adaptive decisions. By integrating robust scheduling with tunable risk aversion, it ensures feasibility across all scenarios while enabling real-time use of flexibility assets. The two-stage structure delivers reliable non-adaptive planning and adaptive responsiveness---achieving resilience to forecast deviations and capturing value from arbitrage opportunities. This design is particularly suited to industrial systems, where rigid operational constraints coexist with strategically deployable flexibility.

== Implementation Workflow
<implementation-workflow>
The methodological pipeline consists of the following sequential steps:

+ #strong[Data Preparation:] Collect historical time series for day-ahead electricity prices, PV generation, and production demand.

+ #strong[Forecasting:] Fit seasonal ARIMA models to generate deterministic forecasts of each uncertain variable.

+ #strong[Stochastic Simulation:] Generate a large ensemble of trajectories by injecting resampled residuals into the ARIMA forecast.

+ #strong[Scenario Reduction:] Normalize, cluster, and rescale the trajectories; assign probabilities based on cluster membership to form a representative scenario set.

+ #strong[Robust Optimization:] Solve two sequential robust MILPs:

  - #strong[Stage~1 -- Baseline Scheduling:] Optimize the Robust Baseline Scheduling, that is without SIDC participation.

  - #strong[Stage~2 -- Flexibility Activation:] Re-optimize under the same scenario set, with SIDC trading enabled and early baseline decisions fixed from Stage~1.

#heading(level: 2, numbering: none)[Discussion]
<discussion>
The proposed framework offers a comprehensive and tractable approach for robust industrial energy scheduling under uncertainty. It presents several advantages:

- #strong[Explicit uncertainty modeling:] Incorporates price, generation, and demand uncertainty through scenario-based representation.

- #strong[Decoupled yet coherent stages:] Maintains consistency between baseline scheduling and flexibility activation through a two-stage formulation.

- #strong[Risk customization:] Allows fine-tuning of the robustness-performance trade-off via the parameter $alpha$.

However, some limitations must be noted. Computational burden increases with the number of scenarios, potentially affecting scalability. Moreover, solution quality is inherently linked to the statistical representativeness of the scenario set---a critical factor when applying the method in real-world settings.

= Case Study: Robust Scheduling in a Cement Manufacturing Plant
<sec:case_study>
This section applies the proposed robust optimization framework to a real-world industrial setting, demonstrating its practical relevance and effectiveness under uncertainty. A medium-scale Portland cement manufacturing plant located in Spain serves as the testbed. The focus is placed on the plant's raw milling subprocess and associated flexibility assets, with the objective of quantifying the operational and economic value of scenario-based robust scheduling in the presence of uncertain electricity prices.

== Industrial System and Operational Scope
<industrial-system-and-operational-scope>
The selected facility represents a typical energy-intensive cement production plant. Among its processes, the raw milling unit is identified as the most flexible and power-demanding component, making it well-suited for demand-side optimization~\[1\], \[2\].

The raw mill consumes approximately 6~MW during operation and produces raw meal at a rate of 360~t~h#super[−1]. The output is stored in a silo with a total capacity of 15000~t, with a minimum inventory requirement of 9000~t to ensure uninterrupted feeding of the kiln. The kiln's demand is a constant inflow 240~t~h#super[−1], reflecting a deterministic operational requirement of the plant.

To enhance flexibility, the plant is equipped with a lithium-ion Battery Energy Storage System of 1~MWh capacity, operating at a charge/discharge C-rate of 0.5~h$""^(- 1)$. While the modeling framework can accommodate uncertainty in on-site photovoltaic generation, PV is excluded in this study to isolate the roles of production and storage flexibility. Key system parameters are summarized in Table~@tab:plant_parameters.

#figure(
  align(center)[#table(
    columns: 4,
    align: (left,left,left,left,),
    table.header([#strong[Parameter]], [#strong[Description]], [#strong[Value]], [#strong[Units]],),
    table.hline(),
    table.cell(align: center, colspan: 4)[#strong[Production System]],
    [$P_(upright("mill"))$], [Power consumption of raw mill], [6], [MW],
    [$Pi_(upright("mill"))$], [Raw meal production rate], [360], [t/h],
    [$D_t$], [Kiln demand (constant)], [240], [t/h],
    [$I_max$], [Silo storage capacity], [15,000], [t],
    [$I_min$], [Minimum inventory requirement], [9,000], [t],
    [$M^(upright(O N))$], [Minimum continuous operation time], [6], [h],
    [$M^(upright(O F F))$], [Minimum downtime before restart], [3], [h],
    table.cell(align: center, colspan: 4)[#strong[Energy Storage System]],
    [BESS Capacity], [Battery storage capacity], [1], [MWh],
    [BESS C-rate], [Charge/discharge rate], [0.5], [h$""^(- 1)$],
    [PV Capacity], [Installed PV capacity], [0], [MW],
  )]
  , caption: [Main operational parameters of the cement plant.]
  , kind: table
  ) <tab:plant_parameters>
== Model Inputs and Uncertainty Characterization
<model-inputs-and-uncertainty-characterization>
The simulation model integrates realistic inputs from both electricity markets and plant operations:

- #strong[Day-ahead electricity prices:] Hourly price data from the Iberian market operator (OMIE), covering January to April 2025, is used as the sole source of uncertainty. This reflects real-world volatility in short-term energy procurement.

- #strong[SIDC prices:] Prices from the intraday continuous market are treated as deterministic, reflecting their real time visibility up to gate closure in the Spanish bidding zone. We use the transaction level price data published by OMIE on April 28, 2025 to emulate the latest market signals available to plant operators.

- #strong[Technical and operational parameters:] All model parameters---including equipment specifications, demand profiles, inventory constraints, and on/off rules---are sourced from validated industrial datasets provided by project collaborators.

To explicitly model uncertainty in day-ahead prices, the hybrid scenario generation approach from Section~@sec:scenario_generation is implemented:

+ #strong[Forecasting via ARIMA:] Seasonal ARIMA models (`pmdarima` in Python) are used to capture hourly seasonality and trend dynamics in the historical series. We set $m = 24$ to represent the seasonal period (24 hours), and apply $D = 1$ for seasonal differencing. Model orders are selected automatically based on the Akaike Information Criterion (AIC), which balances model fit and complexity to prevent overfitting.

+ #strong[Stochastic Perturbation:] Forecast residuals are randomly sampled and injected into the ARIMA forecasts to produce 500 stochastic price trajectories. An inflation factor $beta = 1.5$ is used to emphasize extreme deviations, in line with robust optimization principles~\[30\], \[31\], \[33\], \[34\].

+ #strong[Clustering and Scenario Reduction:] The ensemble is normalized to remove scale bias and clustered using K-Means (`sklearn.cluster` in Python). The number of clusters is selected via the Elbow method and Silhouette score analysis. Each centroid forms a scenario, with its probability derived from cluster membership frequency.

This method produces a compact, representative scenario set that supports tractable optimization while preserving market variability.

== Simulation Framework and Execution
<simulation-framework-and-execution>
To reflect practical industrial workflows, a two-stage fixed-horizon simulation structure is adopted:

- #strong[Stage 1 (Baseline Scheduling):] At the beginning of each simulation cycle, a 7-day robust production schedule is computed, serving as the baseline commitment plan.

- #strong[Stage 2 (Flexibility Activation):] The plan is refined by activating flexibility, with SIDC trading restricted to a 24-hour window, while BESS and other assets operate over the full horizon.

This hierarchical structure reflects real-world planning workflows, in which strategic commitments are made in advance, while operational recourse is exploited in near real-time.

To investigate the effect of risk preference, simulations are conducted across a range of values for the robustness parameter $alpha in \[ 0 \, 1 \]$, enabling a detailed trade-off analysis.

All optimization problems are solved using the #smallcaps[SCIP] solver~\[35\], \[36\], accessed via `PySCIPOpt`. Simulations were executed on a workstation equipped with an Intel#super[®] Core i5-1135G7 CPU (2.4--4.2~GHz) and 16~GB of RAM, running Windows~11 Pro. This configuration provides context for the reported solution times and confirms the tractability of the model on standard computing hardware.

== Experimental Scope and Assumptions
<experimental-scope-and-assumptions>
The scope of the case study is defined by a set of focused assumptions that ensure analytical clarity while preserving practical relevance. The analysis centers on the cement industry and uses real operational data from a single facility. Although the modeling framework is generalizable, this industrial focus enables a high fidelity evaluation of robust scheduling in a realistic setting.

Only two flexible assets are activated in the simulations: the raw mill and the BESS. PV generation is deliberately excluded to isolate the specific contributions of storage and process level flexibility. Regarding uncertainty, only day-ahead electricity prices are modeled as stochastic variables. All other inputs---including internal demand, technical specifications, and operational constraints---are treated as deterministic.

SIDC prices are assumed to be known within the flexibility window, consistent with their real time visibility and the market design that allows operators to react up to gate closure. All scheduling and trading decisions strictly adhere to system level feasibility requirements, including ramp limits, energy balances, storage dynamics, and SIDC trading rules.

These assumptions narrow the analytical focus, allowing for precise evaluation of how robust optimization affects scheduling outcomes under market price uncertainty. Future work may relax some of these simplifications to capture broader system dynamics and interactions across assets and sites.

The next section presents and discusses the simulation results, highlighting the economic and operational implications of different robustness levels in the energy scheduling process.

= Results and Discussion
<sec:results>
This section presents the main findings from the simulation experiments. The analysis is structured in three parts. First, we examine the generated electricity price scenarios. Second, we evaluate the cost-performance trade-off across different risk aversion levels via an $alpha$-sweep. Finally, we assess the operational behavior of flexibility assets---including the BESS, the raw mill, and SIDC market participation---under selected risk preferences.

= Scenario Analysis
<subsec:scen_analys>
To model uncertainty in day-ahead electricity prices, we implement a hybrid scenario generation procedure that combines statistical forecasting with stochastic simulation and data-driven reduction. This enables the construction of a compact yet expressive set of price trajectories for robust optimization.

==== Synthetic Ensemble Generation.
<synthetic-ensemble-generation.>
The process begins with a seasonal ARIMA model trained on historical market prices, producing a deterministic forecast that captures autocorrelation, seasonality, and long-term trends. Forecast residuals are then sampled and injected into the predicted series, inflated by a factor $beta = 1.5$ to account for market volatility. This results in an ensemble of 500 stochastic price trajectories, each spanning a 7-day horizon (168 hourly points), reflecting realistic short-term price dynamics.

Figure~@fig:price_scenarios (left) illustrates this ensemble (light blue), alongside the main forecast (dashed black). The variability across trajectories captures potential market conditions, but their volume is computationally prohibitive for direct inclusion in the MILP formulation.

==== Scenario Reduction via Clustering.
<scenario-reduction-via-clustering.>
To address tractability, we reduce the ensemble to a representative subset using K-Means clustering. Each cluster centroid defines a scenario, and its probability is proportional to the number of trajectories in the cluster.

The number of clusters $k$ is determined using two complementary diagnostics: the Elbow method, which identifies the point at which adding more clusters yields diminishing returns in reducing intra-cluster variance (inertia), and the Silhouette score, which evaluates how well each point fits within its assigned cluster. As shown in Figure~@fig:clust_selec, both methods indicate a turning point at $k = 8$, suggesting a suitable trade-off between scenario diversity and computational efficiency.

#figure([#box(image("graphics/elbow_method.png", width: 49.0%)) #box(image("graphics/silhouette_score.png", width: 49.0%))

  ],
  caption: [
    Selection of the number of clusters. Left: Elbow method identifies diminishing returns beyond $k = 8$. Right: Silhouette scores indicate reduced clustering quality after $k = 8$.
  ]
)
<fig:clust_selec>

==== Final Scenario Set.
<final-scenario-set.>
Figure~@fig:price_scenarios (right) presents the reduced scenario set used in the robust MILP. Each trajectory corresponds to a cluster centroid and is assigned a weight based on its frequency. The expected price profile---obtained as the weighted average---is shown in dashed orange. Opacity encodes probability: darker trajectories are more likely.

This reduced set preserves key statistical features of the ensemble, including peak hours, daily fluctuations, and low-probability extremes, enabling reliable and efficient optimization.

#figure([#box(image("graphics/synthetic_500_main_forecast.png", width: 49.0%)) #box(image("graphics/reduced_scenarios_expected.png", width: 49.0%))

  ],
  caption: [
    Left: Full ensemble of 500 stochastic price trajectories and baseline ARIMA forecast. Right: Reduced set of 8 representative scenarios. The expected price profile is shown in dashed orange. Trajectory opacity reflects scenario probability.
  ]
)
<fig:price_scenarios>

==== Scenario Probabilities.
<scenario-probabilities.>
Table~@tab:representative_scenarios summarizes the scenario probabilities, ordered by frequency. Scenario~6 dominates the distribution (61.6%), followed by a few moderately likely trajectories. Scenario~4, highlighted in the table, represents the price profile with the highest cumulative cost, despite its low probability of occurrence (3.8%).

#figure(
  align(center)[#table(
    columns: 2,
    align: (center,center,),
    table.header([#strong[Scenario]], [#strong[Probability (%)]],),
    table.hline(),
    [s6], [61.6],
    [s2], [15.2],
    [s5], [8.2],
    [s1], [6.2],
    [s4], [3.8],
    [s7], [3.8],
    [s3], [0.8],
    [s0], [0.4],
  )]
  , caption: [Scenario probabilities after clustering.]
  , kind: table
  ) <tab:representative_scenarios>
==== Implications for Optimization.
<implications-for-optimization.>
By optimizing over this reduced and weighted scenario set, the robust MILP ensures feasibility under diverse price realizations. The worst-case scenario in terms of total electricity cost does not necessarily align with the highest-price trajectory; rather, it emerges from interactions between prices, asset constraints, and operational decisions.

This structured treatment of uncertainty enables the model to anticipate market risk while preserving computational tractability---an essential feature for deployment in industrial scheduling environments. The next section explores how this scenario structure translates into robust planning outcomes across varying levels of risk aversion.

== Robustness--Efficiency Trade-off Analysis
<subsec:alpha_sweep>
To evaluate how risk preferences influence scheduling decisions and cost performance, we conduct a sensitivity analysis over the robustness parameter $alpha in \[ 0 \, 1 \]$. As introduced in the methodology, $alpha$ governs the trade-off between minimizing the expected operational cost ($alpha = 1$) and protecting against the worst-case scenario cost ($alpha = 0$). Intermediate values yield risk-averse schedules.

The optimization problem is solved for five representative values of $alpha$ (0, 0.2, 0.5, 0.8, 1) using the reduced set of 8 representative price scenarios. The results are presented in Figure~@fig:alpha_tradeoff, showing the evolution of expected cost, worst-case cost, and the resulting robust objective for both scheduling stages.

#figure(image("graphics/tradeoff_stages_combined.png", width: 49.0%),
  caption: [
    Trade-off between expected cost and worst-case cost across values of $alpha$. Results shown for Stage~1 (baseline scheduling) and Stage~2 (flexibility activation).
  ]
)
<fig:alpha_tradeoff>

==== Key Observations.
<key-observations.>
- #strong[Monotonic behavior.] As $alpha$ increases, the robust objective decreases in both stages, reflecting the shift from conservative (worst-case-oriented) to risk-neutral optimization.

- #strong[Value of flexibility.] For every $alpha$, the flexible schedule (Stage~2) achieves lower costs than the baseline schedule (Stage~1), highlighting the economic value of SIDC participation and BESS operation.

- #strong[Risk sensitivity.] The slope of the cost curves is steeper in Stage~1, meaning baseline scheduling is more sensitive to changes in risk preference. Stage~2 exhibits flatter trends, indicating flexibility assets help buffer cost variability.

- #strong[Performance bounds.] At $alpha = 0$, Stage~1 yields a worst-case cost of 1020.15~€, while Stage~2 reduces this to 237.69~€. At $alpha = 1$, expected costs are as low as 191.84~€ and 17.52~€, respectively.

==== Numerical Results.
<numerical-results.>
Tables~@tab:cost_stage1 and~@tab:cost_stage2 report the exact cost metrics used to compute the curves in Figure~@fig:alpha_tradeoff.

#figure(
  align(center)[#table(
    columns: 4,
    align: (center,center,center,center,),
    table.header([$alpha$], [Expected Cost (€)], [Worst-Case Cost (€)], [Robust Objective (€)],),
    table.hline(),
    [0.0], [628.20], [1020.15], [1020.15],
    [0.2], [244.78], [1020.15], [865.08],
    [0.5], [212.55], [1038.57], [625.56],
    [0.8], [191.84], [1096.86], [372.85],
    [1.0], [191.84], [1096.86], [191.84],
  )]
  , caption: [Cost metrics for Stage~1 (baseline scheduling) across $alpha$ values.]
  , kind: table
  ) <tab:cost_stage1>
#figure(
  align(center)[#table(
    columns: 4,
    align: (center,center,center,center,),
    table.header([$alpha$], [Expected Cost (€)], [Worst-Case Cost (€)], [Robust Objective (€)],),
    table.hline(),
    [0.0], [19.46], [237.69], [237.69],
    [0.2], [15.67], [226.15], [184.05],
    [0.5], [15.67], [226.15], [120.91],
    [0.8], [18.38], [247.83], [64.27],
    [1.0], [17.52], [284.78], [17.52],
  )]
  , caption: [Cost metrics for Stage~2 (flexibility activation) across $alpha$ values.]
  , kind: table
  ) <tab:cost_stage2>
==== Interpretation.
<interpretation.>
Moderate values of $alpha$ (e.g., 0.5--0.8) offer the best trade-offs: they achieve substantial reductions in worst-case cost relative to risk-neutral solutions while avoiding the overly conservative outcomes of min--max strategies. The inclusion of flexibility mechanisms in Stage~2 further enhances this trade-off, delivering both lower expected costs and greater robustness.

This analysis confirms that the convex risk-weighting scheme effectively balances cost-efficiency and protection, making it suitable for industrial settings where economic performance must be safeguarded against market volatility.

=== Robust vs. Deterministic Scheduling Strategies
<subsubsec:det_vs_robust>
To further assess the benefits of robust optimization, we compare its performance against a deterministic scheduling strategy across three representative risk-aversion levels: $alpha in { 0 \, #h(0em) 0.5 \, #h(0em) 1 }$. This comparison focuses exclusively on Stage~1 (baseline scheduling).

The #strong[deterministic strategy] is computed by optimizing the MILP over the expected price profile---that is, the weighted average of all scenario trajectories---thus assuming perfect foresight of average conditions. Once this single schedule is obtained, it is evaluated #emph[ex post] across all scenarios, without re-optimization, to analyze its performance under uncertainty. The comparison includes several performance metrics: expected cost, worst-case cost, cost variability (expressed as weighted standard deviation), battery usage, and solver time.

To ensure that the reported variability captures not only the dispersion of cost outcomes but also their likelihood, the standard deviation is computed using scenario probabilities as weights. This probabilistic formulation offers a more accurate and meaningful measure of uncertainty, in line with the scenario-based nature of the modeling framework.

Importantly, because the deterministic schedule is fixed and does not depend on $alpha$, its performance metrics remain constant across rows. In contrast, the robust strategy is re-optimized for each $alpha$ value, adapting decisions to the level of risk aversion. The results are presented in Table~@tab:deterministic_vs_robust.

#figure(
  align(center)[#table(
    columns: 7,
    align: (center,center,center,center,center,center,center,),
    [$alpha$], [Strategy], [], [], [], [], [],
    [Cost (€)], [], [], [], [], [], [],
    [Cost (€)], [], [], [], [], [], [],
    [Std. Dev. (€)], [], [], [], [], [], [],
    [Use (MWh)], [], [], [], [], [], [],
    [Time (s)], [], [], [], [], [], [],
    [0], [Deterministic], [1248.04], [171.62], [308.11], [12.8], [1.40],
    [], [Robust], [1221.62], [359.79], [253.13], [27.16], [38.41],
    [0.5], [Deterministic], [1248.04], [171.62], [308.11], [12.8], [1.78],
    [], [Robust], [1223.23], [266.76], [295.55], [32.40], [22.67],
    [1], [Deterministic], [1248.04], [171.62], [308.11], [12.8], [1.32],
    [], [Robust], [1285.30], [248.30], [296.85], [33.20], [18.35],
  )]
  , caption: [Performance comparison of deterministic and robust strategies in Stage~1 across selected $alpha$ values.]
  , kind: table
  ) <tab:deterministic_vs_robust>
==== Interpretation.
<interpretation.-1>
The comparative results highlight several meaningful trends:

- #strong[Robust strategies consistently reduce worst-case costs] when $alpha < 1$. For example, at $alpha = 0$, the worst-case cost drops from 1248.04~€ (deterministic) to 1221.62~€ (robust).

- #strong[Expected costs for robust strategies are higher], reflecting a deliberate trade-off between average performance and protection against extreme outcomes. At $alpha = 0.5$, the robust strategy incurs an expected cost of 266.76~€, compared to 171.62~€ in the deterministic case.

- #strong[Battery usage nearly triples] under robust optimization, increasing from 12.8~MWh to over 33~MWh at $alpha = 1$, suggesting a more aggressive use of storage to buffer uncertainty.

- #strong[Standard deviation behavior varies with risk preference.] At $alpha = 0$, robust scheduling leads to a lower cost variability than the deterministic case (253.13~€ vs.~308.11~€), but at $alpha = 1$, variability slightly increases (296.85~€), indicating that risk-neutral strategies may result in higher exposure to volatility.

- #strong[Computation times increase significantly] for robust strategies due to multi-scenario enumeration. Nevertheless, all cases remain computationally tractable for real-time industrial scheduling.

==== Clarification on Stage~2.
<clarification-on-stage-2.>
A direct deterministic comparison is not provided for Stage~2 because this stage builds upon the Stage~1 schedule and introduces SIDC market participation. The baseline in Stage~2 refers to a robust model without intraday trading (see Section~@sec:2nd_stage_robust), and thus no deterministic counterpart exists. Therefore, performance analysis in Stage~2 focuses exclusively on robust strategies under varying $alpha$ values.

This comparison reinforces the practical advantage of risk-aware planning: while deterministic models offer simplicity and lower computational effort, they perform poorly in extreme scenarios. Robust optimization, by contrast, delivers more resilient schedules at the cost of moderately higher average expense and solve time---a trade-off that is often acceptable in mission-critical industrial settings.

== Operational Impact of Risk Aversion Preferences
<subsec:operational_behavior>
This subsection analyzes how key flexible assets---the BESS, the raw mill, and intraday trading via the SIDC---respond to varying degrees of risk aversion, governed by the parameter $alpha$. For each configuration $alpha in { 0.0 \, #h(0em) 0.5 \, #h(0em) 1.0 }$, we examine the corresponding operational behavior under the worst-case scenario associated with each robust strategy. This approach reveals how non-adaptive scheduling decisions shape adaptive asset-level operations under adverse price conditions.

=== Battery Operation Patterns
<battery-operation-patterns>
Figure~@fig:bess_soc_stage1 (left) presents the BESS state-of-charge (SoC) trajectories in Stage~1 (baseline scheduling), under each strategy's respective worst-case scenario. The top panel displays both expected and worst-case day-ahead price profiles, while the lower panels illustrate the resulting SoC evolution across three risk aversion levels. Although actual BESS operation depends on scenario realization, evaluating all cases under worst-case conditions provides a meaningful comparison of how non-adaptive decisions condition adaptive system behavior when exposed to extreme volatility.

Clear patterns emerge as $alpha$ varies:

- #strong[Risk-neutral strategy ($alpha = 1.0$):] The battery performs frequent and deep cycles, aggressively pursuing arbitrage opportunities in response to price variations.

- #strong[Conservative strategy ($alpha = 0.0$):] Battery operation is more cautious, exhibiting shallower cycles and reduced throughput to ensure feasibility across all price realizations.

These trends are quantified in Figure~@fig:bess_soc_stage1 (right), which plots the #strong[cumulative energy throughput]---the total amount of energy charged and discharged over time. This metric acts as a proxy for battery utilization intensity. Throughput reaches approximately 33~MWh in the risk-neutral case, compared to about 27~MWh under the fully robust configuration, indicating that risk appetite directly shapes battery deployment.

Stage~2 results follow a similar pattern (Figure~@fig:bess_soc_stage2). With SIDC trading allowed in hours 24--48, the system gains additional degrees of freedom for arbitrage. The SoC profiles for $alpha = 0.5$ and $alpha = 1.0$ closely align, while the $alpha = 0.0$ case exhibits restrained engagement. These findings confirm that the BESS dynamically adapts its operation to the risk profile encoded in the scheduling stage, thereby acting as a key instrument for economic optimization under uncertainty.

#figure([#box(image("graphics/Ultimate_Prices_and_SoC.png", width: 49.0%)) #box(image("graphics/Ultimate_Cumulative_Battery_SoC.png", width: 49.0%))

  ],
  caption: [
    Left: Hourly BESS SoC profiles in Stage~1 under worst-case scenario. Right: Cumulative battery throughput across $alpha$ values.
  ]
)
<fig:bess_soc_stage1>

#figure([#box(image("graphics/Ultimate_Prices_and_SoC_Flex.png", width: 49.0%)) #box(image("graphics/Ultimate_Cumulative_Battery_SoC_Flex.png", width: 49.0%))

  ],
  caption: [
    Left: Hourly BESS SoC profiles in Stage~2 (with SIDC) under worst-case scenario. Right: Cumulative battery throughput across $alpha$ values.
  ]
)
<fig:bess_soc_stage2>

=== SIDC Market Participation Behavior
<sidc-market-participation-behavior>
Figure~@fig:sidc_trading_profiles illustrates how the system engages with the SIDC market across different levels of risk aversion $alpha$, focusing on the authorized trading window between hours 24 and 48. The left panel shows the hourly SIDC energy transactions under each $alpha$ configuration, overlaid with the corresponding baseline grid purchases from Stage~1. The right panel plots the cumulative volume of SIDC energy traded over time (selling and buying), offering insight into the temporal dynamics of market participation.

A notable finding is the near-constancy of total traded volume: in all cases, the optimizer schedules approximately 55~MWh of SIDC transactions. This consistency highlights the strategic value of SIDC engagement as a reliable flexibility mechanism, largely invariant to the chosen robustness setting. However, the temporal structure of these trades slightly varies with $alpha$:

- #strong[Risk-neutral strategies] ($alpha = 1.0$) initiate trades earlier and with more concentrated bursts, exploiting arbitrage opportunities aggressively based on expected price differences.

- #strong[Risk-averse strategies] ($alpha = 0.0$) delay engagement or distribute transactions more evenly across the trading horizon, reflecting a cautious posture that avoids exposure to potential misalignment with baseline commitments.

#figure([#box(image("graphics/Ultimate_Prices_and_RedMIC_vs_RedMD_Flex.png", width: 49.0%)) #box(image("graphics/Ultimate_Cumulative_MIC_Transacted_Flex.png", width: 49.0%))

  ],
  caption: [
    Left: Hourly SIDC energy transacted compared to baseline day-ahead grid purchases across $alpha$ levels. Right: Cumulative SIDC energy traded over time.
  ]
)
<fig:sidc_trading_profiles>

These behaviors suggest that while the overall quantity of intraday market participation is robust to changes in risk preference, the optimizer's temporal strategy---that is, when and how energy is traded---is sensitive to perceived uncertainty. This sensitivity stems from the indirect influence of the first-stage baseline schedule, which constrains feasible adjustments in the SIDC window.

It is also important to note that SIDC prices are treated as deterministic in the model's second stage. Therefore, the optimizer's decisions are driven by known price spreads between day-ahead and intraday markets rather than by SIDC price uncertainty. As a result, robustness influences SIDC participation indirectly---by shaping the flexibility of the baseline schedule and modulating the system's willingness to deviate from it.

Finally, SIDC transactions operate in close coordination with BESS behavior. This co-activation strategy enables the system to buffer variability, optimize economic outcomes, and respond adaptively to evolving market conditions---reinforcing the value of integrated flexibility in risk-aware scheduling.

=== Raw Mill Scheduling Dynamics
<raw-mill-scheduling-dynamics>
Figures~@fig:mill_operation_stage1 and~@fig:mill_operation_stage2 illustrate the operation of the raw mill during Stage~1 (baseline scheduling) and Stage~2 (flexibility activation), respectively. As detailed in Section~@sec:Methodology, the binary scheduling decisions $Y_(k \, t)$ governing the raw mill are non-adaptive variables---i.e., they are made prior to scenario realization and are held fixed across all uncertainty outcomes for a given $alpha$ value. This structure mirrors the rigidity of industrial production commitments, which must often be determined in advance due to operational and safety constraints.

The left panels in each figure show the mill's on/off status over time, superimposed on representative day-ahead price trajectories. Although the underlying schedule is scenario-invariant, different risk preferences ($alpha$ values) lead to different pre-optimized patterns. Specifically, more conservative configurations (e.g., $alpha = 0.0$) tend to avoid operation during periods of high volatility or cost exposure, whereas risk-neutral settings (e.g., $alpha = 1.0$) are more opportunistic, scheduling production in line with expected arbitrage opportunities. Nonetheless, these differences are muted due to structural constraints---such as minimum uptime/downtime requirements and continuous kiln demand---that restrict the optimizer's flexibility.

To quantify these variations, the right panels display the #strong[cumulative number of switching events], defined as the total count of on/off transitions over the planning horizon. This metric serves as a proxy for the schedule's aggressiveness and mechanical stress on production assets.

#figure([#box(image("graphics/Ultimate_Prices_and_Molino.png", width: 49.0%)) #box(image("graphics/Ultimate_Cumulative_Molino_Switching.png", width: 49.0%))

  ],
  caption: [
    Raw mill operational status (left) and cumulative switching events (right) in Stage~1 across $alpha$ values.
  ]
)
<fig:mill_operation_stage1>

#figure([#box(image("graphics/Ultimate_Prices_and_Molino_Flex.png", width: 49.0%)) #box(image("graphics/Ultimate_Cumulative_Mill_Switching_Flex.png", width: 49.0%))

  ],
  caption: [
    Raw mill operational status (left) and cumulative switching events (right) in Stage~2 across $alpha$ values. Slight smoothing is observed.
  ]
)
<fig:mill_operation_stage2>

In Stage~1 (Figure~@fig:mill_operation_stage1), the switching patterns are almost indistinguishable across different $alpha$ values, reflecting the raw mill's inherent scheduling rigidity. However, in Stage~2 (Figure~@fig:mill_operation_stage2), the availability of recourse via SIDC trading and battery flexibility slightly relaxes this rigidity. These auxiliary mechanisms absorb part of the system's temporal imbalance, enabling the optimizer to meet energy needs with reduced reliance on mill switching. As a result, marginal reductions in switching frequency are observed for moderately conservative and risk-neutral configurations.

While the smoothing effect is modest, it underscores a key design insight: flexibility-enhancing assets can reduce operational wear and enable less aggressive production strategies. However, such benefits remain bounded by the physical and process limitations of industrial systems---particularly when core scheduling decisions must be scenario-agnostic.

This reinforces the necessity of distinguishing between #strong[non-adaptive] and #strong[adaptive] decision layers in robust industrial scheduling. While assets like BESS and SIDC trading offer dynamic response capabilities, large-scale production units such as the raw mill require conservative planning grounded in structural feasibility.

=== Integrated Insights
<integrated-insights>
The operational analysis reveals a clear stratification in the behavior of flexible assets under uncertainty, shaped by the hierarchical structure of the robust optimization framework. Each asset exhibits a distinct role and degree of responsiveness depending on its place in the decision hierarchy and the system's risk preferences:

- #strong[Battery Energy Storage System]: Battery dispatch intensifies with decreasing risk aversion. At higher $alpha$ values, the optimizer leverages expected price differentials more aggressively, leading to increased charge/discharge frequency and higher cumulative throughput. This confirms the BESS's role as a versatile recourse mechanism, dynamically adapting to anticipated price dynamics to reduce procurement costs.

- #strong[SIDC Market Participation]: SIDC trading emerges as a consistently activated strategy across all robustness levels. Although the total traded volume remains stable, the timing and temporal concentration of transactions vary with $alpha$. Risk-neutral configurations engage earlier and more opportunistically, while conservative strategies adopt more cautious, distributed trading profiles. This demonstrates that SIDC participation is a low-regret flexibility lever whose value is modulated, rather than dictated, by risk tolerance.

- #strong[Raw Mill Scheduling]: The raw mill's operation remains invariant across all scenarios and $alpha$ settings, reflecting its nature as a non-adaptive decision. Additionally, its scheduling is constrained by minimum uptime/downtime requirements and inventory dynamics. This rigid behavior highlights the necessity of pre-committing core production plans that are robust across potential future conditions.

Collectively, these observations underscore the importance of a modular and layered control architecture. The model distinguishes between:

- #strong[Committed decisions] (e.g., production schedules), which are scenario-agnostic and must ensure feasibility across all uncertainty realizations;

- #strong[Flexible decisions] (e.g., BESS dispatch and SIDC trades), which are scenario-responsive and optimized to exploit market variability and operational slack.

This design philosophy ensures robustness without sacrificing economic performance. It enables reliable non-adaptive planning while embedding adaptive layers that react to real-time conditions---a critical capability in volatile electricity markets. The result is a scheduling strategy that is not only resilient to forecast deviations but also capable of capturing value from emerging arbitrage opportunities.

Such hybrid decision frameworks are particularly well-suited to industrial settings, where operational inflexibility coexists with strategic flexibility assets. By aligning asset characteristics with decision levels, the proposed model provides a coherent and effective approach to short-term energy scheduling under uncertainty.

= Conclusions and Future Work
<sec:conclusions>
This study has introduced a scenario-based robust optimization framework for short-term energy scheduling in electricity-intensive industrial plants, with a specific focus on managing uncertainty. The proposed methodology integrates hybrid scenario generation, two-stage MILP modeling, and a tunable risk-averse objective via the parameter $alpha$, allowing planners to balance cost efficiency with operational robustness.

Applied to a real-world cement manufacturing facility, the framework demonstrates how coordinated use of industrial flexibility---through Battery Energy Storage System dispatch and intraday continuous market participation---can substantially reduce electricity costs while hedging against price volatility.

#heading(level: 2, numbering: none)[Key Contributions and Findings]
<key-contributions-and-findings>
- #strong[Hybrid scenario generation with preserved diversity:] A three-step method combining ARIMA-based forecasting, stochastic residual sampling, and K-Means clustering produced a compact yet expressive scenario set. This enabled tractable robust optimization while preserving the statistical features of price uncertainty.

- #strong[Quantification of the risk--cost trade-off:] A sweep over the risk aversion parameter $alpha$ highlighted the trade-off between worst-case protection and expected cost. Intermediate values (e.g., $alpha = 0.5$--$0.8$) emerged as practical compromises, delivering robust yet cost-effective schedules.

- #strong[Economic value of multi-asset flexibility:] The integration of SIDC trading and BESS operation in Stage~2 consistently improved performance across all $alpha$ levels. Flexibility reduced worst-case costs by up to 77%, confirming its critical role in buffering against volatility.

- #strong[Asset-specific behavioral insights:] The framework uncovered differentiated asset behaviors under risk: BESS operation scaled with $alpha$\; SIDC trading remained uniformly active; and raw mill scheduling was invariant due to model design reflecting commitment schedule.

- #strong[Superiority over deterministic scheduling:] Compared to a deterministic baseline, robust strategies consistently achieved lower worst-case costs, with only modest increases in expected cost. This underscores the practical benefit of robustness in volatile market environments.

- #strong[Validated feasibility under the horizon operation:] All optimization instances were executed within a realistic horizon context using empirical data. The model satisfied all operational constraints, supporting its deployment for short-term industrial energy planning.

- #strong[Scalability and tractability of the MILP formulation:] Despite its multi-scenario nature, the model remained computationally manageable across tested configurations. No critical bottlenecks were encountered, and solution times scaled reasonably with the number of scenarios.

While effective, the current implementation relies on several simplifying assumptions that limit its generalizability. Only day-ahead electricity prices were treated as uncertain; other sources of variability---such as internal demand or PV generation---were held fixed or excluded from the simulations. The model also omits degradation effects, both in terms of BESS cycling and process wear due to frequent switching of production equipment. Furthermore, the plant is modeled as a price-taker, which may not hold in illiquid markets or under strategic bidding behavior. Finally, the case study is limited to a single industrial site, without accounting for network-level interactions or multi-site coordination. These assumptions were adopted to ensure tractability and clarity in the initial implementation, but future work should aim to relax them in order to improve realism and broaden applicability.

#heading(level: 2, numbering: none)[Future Research Directions]
<future-research-directions>
The proposed framework opens multiple avenues for future extension:

- #strong[Multi-source uncertainty:] Incorporate variability in internal demand, PV generation, and other relevant market signals to enable a more comprehensive treatment of risk.

- #strong[Multi-market optimization:] Expand the scope to include coordinated participation in multiple electricity markets (e.g., day-ahead, SIDC, balancing reserves), capturing synergies and layered flexibility value.

- #strong[Degradation-aware dispatch:] Introduce lifetime models for storage and production equipment to reflect the long-term cost of frequent flexibility activation.

- #strong[Integration with real-time control:] Embed the robust MILP into rolling-horizon or Model Predictive Control architectures~\[24\], \[25\] to enable continual reoptimization with updated forecasts and prices.

- #strong[Multi-objective formulations:] Incorporate additional performance metrics---such as CO#sub[2] emissions, renewable energy penetration, or resilience indices---to support sustainability-aligned decision-making.

- #strong[Cross-site coordination:] Extend the model to support scheduling across multiple industrial sites or aggregators, enabling collaborative flexibility provision and virtual power plant architectures.

In conclusion, this work provides a practical and theoretically grounded approach for industrial energy consumers to manage uncertainty and leverage flexibility. The scenario-based robust optimization framework delivers resilient, economically efficient schedules while laying the groundwork for broader extensions in scale, complexity, and environmental scope.

#heading(level: 1, numbering: none)[Author contributions]
<author-contributions>
#strong[Sebastián Rojas-Innocenti:] Conceptualization, Data Curation, Formal analysis, Investigation, Methodology, Resources, Software, Visualization, Validation, Writing - Original Draft, Writing - Review & Editing. #strong[Enrique Baeyens:] Conceptualization, Formal analysis, Investigation, Methodology, Resources, Supervision, Validation, Visualization, Writing - Review & Editing. #strong[Alejandro Martín-Crespo:] Funding acquisition, Methodology, Resources, Validation, Writing - Review & Editing, Visualization. #strong[Sergio Saludes-Rodil:] Funding acquisition, Project administration, Validation, Resources, Writing - Review & Editing, Supervision. #strong[Fernando Frechoso-Escudero:] Resources, Supervision, Writing - Review & Editing, Visualization.

All authors have read and approved the final version of the manuscript.

#heading(level: 1, numbering: none)[Acknowledgments]
<acknowledgments>
We appreciate the assistance of Fortia Energía for providing the related information on the Industrial Case Study.

#heading(level: 1, numbering: none)[Financial disclosure]
<financial-disclosure>
This research has been supported by funding from the European Commission under a project related to industrial flexibility and energy transition.

#heading(level: 1, numbering: none)[Conflict of interest]
<conflict-of-interest>
The authors have no relevant financial or non-financial interests to disclose.

#heading(level: 1, numbering: none)[Data Availability]
<data-availability>
All electricity market data used in this study are publicly available from the Spanish System Operator Information System (e·sios) platform, operated by Red Eléctrica de España (REE). The data---including day-ahead and intraday electricity prices---can be accessed at: #link("https://www.esios.ree.es/en").

#heading(level: 1, numbering: none)[References]
<bibliography>
#block[
#block[
\[1\] S. Rojas-Innocenti, E. Baeyens, A. Martín-Crespo, S. Saludes-Rodil, and F. Frechoso-Escudero, “Enhancing industrial flexibility and market participation in cement manufacturing through optimized production scheduling.” arXiv:2403.06573. #link("https://doi.org/10.48550/arXiv.2403.06573"), 2024. Available: #link("https://arxiv.org/abs/2403.06573")

] <ref-rojasinnocenti2024electrical>
#block[
\[2\] S. Rojas-Innocenti, E. Baeyens, A. Martín-Crespo, S. Saludes-Rodil, and F. Frechoso, “A comparative analysis of electricity consumption flexibility in different industrial plant configurations.” 2024. Available: #link("https://arxiv.org/abs/2411.09279")

] <ref-rojas_comparative>
#block[
\[3\] K. E. Rollert, “Demand response aggregators as institutional entrepreneurs in the european electricity market,” #emph[Journal of Cleaner Production], vol. 353, p. 131501, Jun. 2022, doi: #link("https://doi.org/10.1016/j.jclepro.2022.131501")[10.1016/j.jclepro.2022.131501].

] <ref-rollert_demand_2022>
#block[
\[4\] E. Pierri, C. Schulze, C. Herrmann, and S. Thiede, “Integrated methodology to assess the energy flexibility potential in the process industry,” #emph[Procedia CIRP], vol. 90, pp. 677--682, Jan. 2020, doi: #link("https://doi.org/10.1016/j.procir.2020.01.124")[10.1016/j.procir.2020.01.124].

] <ref-pierri_integrated_2020>
#block[
\[5\] A. Boldrini, D. Koolen, W. Crijns-Graus, M. van den Broek, and E. Worrell, “The demand response potential in a decarbonising iron and steel industry: A review of flexible steelmaking.” SSRN. #link("https://papers.ssrn.com/abstract=4472250"), Rochester, NY, Jun. 17, 2023. doi: #link("https://doi.org/10.2139/ssrn.4472250")[10.2139/ssrn.4472250].

] <ref-boldrini_demand_2023>
#block[
\[6\] X. Zhao #emph[et al.], “A model of demand response scheduling for cement plant,” in #emph[2014 IEEE international conference on systems, man, and cybernetics (SMC)], 2014, pp. 3042--3047. doi: #link("https://doi.org/10.1109/SMC.2014.6974393")[10.1109/SMC.2014.6974393].

] <ref-Zhao_2014>
#block[
\[7\] E. Lee, K. Baek, and J. Kim, “Evaluation of demand response potential flexibility in the industry based on a data-driven approach,” #emph[Energies], vol. 13, no. 23, p. 6355, Jan. 2020, doi: #link("https://doi.org/10.3390/en13236355")[10.3390/en13236355].

] <ref-lee_evaluation_2020>
#block[
\[8\] D. Olsen, “Opportunities for energy efficiency and demand response in the california cement industry.” Lawrence Berkeley National Laboratory. #link("https://escholarship.org/uc/item/7856f8vn"), Jun. 20, 2011.

] <ref-olsen_opportunities_2011>
#block[
\[9\] M. Rombouts, “Flexible electricity use in the cement industry: Laying the foundation for a not so concrete future.” MSc. Thesis. Utrech University. #link("https://studenttheses.uu.nl/handle/20.500.12932/39926"), 2021.

] <ref-rombouts_flexible_2021>
#block[
\[10\] G. Rombouts and R. Laforce, “Flexible electricity use in cement raw‐milling: Empirical assessment at plant scale,” #emph[Energy], vol. 273, p. 126380, 2023, doi: #link("https://doi.org/10.1016/j.energy.2023.126380")[10.1016/j.energy.2023.126380].

] <ref-rombouts_flexible_2023>
#block[
\[11\] M. Parejo Guzmán, B. Navarrete Rubia, P. Mora Peris, and R. Alfalla-Luque, “Methodological development for the optimisation of electricity cost in cement factories: The use of artificial intelligence in process variables,” #emph[Electrical Engineering], vol. 104, no. 3, pp. 1681--1696, 2022, doi: #link("https://doi.org/10.1007/s00202-021-01409-z")[10.1007/s00202-021-01409-z].

] <ref-parejo_guzman_methodological_2022>
#block[
\[12\] X. Zhang and D. Wu, “MPC--MILP co‑optimization of cement grinding for automatic generation control markets,” #emph[IEEE Transactions on Industrial Informatics], vol. 19, no. 10, pp. 10758--10769, 2023, doi: #link("https://doi.org/10.1109/TII.2023.3281148")[10.1109/TII.2023.3281148].

] <ref-zhang_mpc_2023>
#block[
\[13\] A. Tong, F. El Mellouhi, and A. Mezrhab, “PV‑coupled battery storage for tertiary reserve provision in north‑african cement plants,” #emph[Journal of Cleaner Production], vol. 421, p. 139887, 2024, doi: #link("https://doi.org/10.1016/j.jclepro.2023.139887")[10.1016/j.jclepro.2023.139887].

] <ref-tong_pv_bess_2024>
#block[
\[14\] M. Paulus and F. Borggrefe, “The potential of demand-side management in energy-intensive industries for electricity markets in germany,” #emph[Applied Energy], vol. 88, no. 2, pp. 432--441, Feb. 2011, doi: #link("https://doi.org/10.1016/j.apenergy.2010.03.017")[10.1016/j.apenergy.2010.03.017].

] <ref-paulus_potential_2011>
#block[
\[15\] B. Arias, T. Gómez, J. Martín, and D. Fuentes, “Demand-side management potential in pulp and paper industry,” #emph[Applied Energy], vol. 310, p. 118586, 2022, doi: #link("https://doi.org/10.1016/j.apenergy.2021.118586")[10.1016/j.apenergy.2021.118586].

] <ref-arias2022demand>
#block[
\[16\] D. Torregrossa, K. Hansen, and A. G. Capodaglio, “Energy optimization of wastewater treatment plants through demand response participation: A real case study,” #emph[Journal of Environmental Management], vol. 182, pp. 643--652, 2016, doi: #link("https://doi.org/10.1016/j.jenvman.2016.08.004")[10.1016/j.jenvman.2016.08.004].

] <ref-torregrossa2016energy>
#block[
\[17\] M. Rahmani-Andebili, “Residential electricity demand flexibility: A review on appliance-level characterization, metrics, and control strategies,” #emph[Renewable and Sustainable Energy Reviews], vol. 178, p. 113244, 2023, doi: #link("https://doi.org/10.1016/j.rser.2023.113244")[10.1016/j.rser.2023.113244].

] <ref-rahmani_residential_2023>
#block[
\[18\] E. Adiguzel, “Global cement industry outlook: Trends and forecasts. World cement association: WCA.” #link("https://worldcementassociation.org/blog/news/global-cement-industry-outlook-trends-and-forecasts"), 2024.

] <ref-adiguzel_global_2024>
#block[
\[19\] A. Ben-Tal, L. El Ghaoui, and A. Nemirovski, #emph[Robust optimization]. Princeton University Press, 2009.

] <ref-ben2009robust>
#block[
\[20\] A. Shapiro, D. Dentcheva, and A. Ruszczyński, #emph[Lectures on stochastic programming: Modeling and theory]. SIAM, 2009.

] <ref-shapiro2009lectures>
#block[
\[21\] D. Bertsimas, D. B. Brown, and C. Caramanis, “Theory and applications of robust optimization,” #emph[SIAM Review], vol. 53, no. 3, pp. 464--501, 2011.

] <ref-bertsimas2011theory>
#block[
\[22\] A. J. Conejo, M. Carrión, and J. M. Morales, #emph[Decision making under uncertainty in electricity markets], vol. 153. in International series in operations research & management science, vol. 153. Springer, 2010. doi: #link("https://doi.org/10.1007/978-1-4419-7421-1")[10.1007/978-1-4419-7421-1].

] <ref-Conejo2010>
#block[
\[23\] J. Fang, C. Li, Q. Yang, and Y. Li, “Robust day-ahead scheduling of industrial flexible loads considering electricity price uncertainty,” #emph[Applied Energy], vol. 310, p. 118544, 2022.

] <ref-fang2022robust>
#block[
\[24\] A. Parisio and L. Glielmo, “Stochastic model predictive control for economic/environmental operation management of microgrids: An experimental case study,” #emph[Journal of Process Control], vol. 43, pp. 24--37, 2016.

] <ref-parisio2016stochastic>
#block[
\[25\] F. Oldewurtel #emph[et al.], “Use of model predictive control and weather forecasts for energy efficient building climate control,” #emph[Energy and Buildings], vol. 45, no. 1, pp. 15--27, 2010, doi: #link("https://doi.org/10.1016/j.enbuild.2011.09.022")[10.1016/j.enbuild.2011.09.022].

] <ref-oldewurtel2010use>
#block[
\[26\] Z. Yang, Y. He, J. Zhang, Y. Pan, H. Chen, and C. Li, “Two-stage distributed robust optimization scheduling considering demand response and direct purchase of electricity by large consumers,” #emph[Electronics], vol. 13, no. 18, p. 3685, 2024, doi: #link("https://doi.org/10.3390/electronics13183685")[10.3390/electronics13183685].

] <ref-yang2024two>
#block[
\[27\] L. Xu, Y. Zhang, and H. Wang, “An improved typical scenario-based distributionally robust co-dispatch model for renewable power systems with demand response,” #emph[Frontiers in Energy Research], vol. 12, p. 1401080, 2024, doi: #link("https://doi.org/10.3389/fenrg.2024.1401080")[10.3389/fenrg.2024.1401080].

] <ref-xu2024improved>
#block[
\[28\] R. J. Hyndman and G. Athanasopoulos, #emph[Forecasting: Principles and practice], 2nd ed. OTexts, 2018. Available: #link("https://otexts.com/fpp2/")

] <ref-hyndman2018forecasting>
#block[
\[29\] S. P. Lloyd, “Least squares quantization in PCM,” #emph[IEEE Transactions on Information Theory], vol. 28, no. 2, pp. 129--137, 1982, doi: #link("https://doi.org/10.1109/TIT.1982.1056489")[10.1109/TIT.1982.1056489].

] <ref-lloyd1982least>
#block[
\[30\] G. C. Calafiore and M. C. Campi, “The scenario approach to robust control design,” #emph[IEEE Transactions on Automatic Control], vol. 51, no. 5, pp. 742--753, 2006, doi: #link("https://doi.org/10.1109/TAC.2006.875041")[10.1109/TAC.2006.875041].

] <ref-calafiore2006scenario>
#block[
\[31\] M. C. Campi and S. Garatti, “The exact feasibility of randomized solutions of uncertain convex programs,” #emph[SIAM Journal on Optimization], vol. 19, no. 3, pp. 1211--1230, 2009, doi: #link("https://doi.org/10.1137/080724453")[10.1137/080724453].

] <ref-campi2011exact>
#block[
\[32\] B. Pagnoncelli, D. Reich, and M. C. Campi, “Risk-return trade-off with the scenario approach in practice,” #emph[Journal of Optimization Theory and Applications], vol. 142, no. 2, pp. 399--413, 2009, doi: #link("https://doi.org/10.1007/s10957-009-9527-3")[10.1007/s10957-009-9527-3].

] <ref-pagnoncelli2009risk>
#block[
\[33\] M. E. Khodayar and L. Wu, “Scenario-based stochastic program for energy management in microgrids with intermittent resources,” #emph[IEEE Transactions on Smart Grid], vol. 6, no. 4, pp. 1977--1985, 2015, doi: #link("https://doi.org/10.1109/TSG.2015.2395521")[10.1109/TSG.2015.2395521].

] <ref-khodayar2015scenario>
#block[
\[34\] J. Zhang, J. Wang, Y. Wang, Y. Liu, C. Chen, and Z. Huang, “A review on probabilistic forecasting of wind power generation,” #emph[Renewable and Sustainable Energy Reviews], vol. 32, pp. 255--270, 2014, doi: #link("https://doi.org/10.1016/j.rser.2014.01.033")[10.1016/j.rser.2014.01.033].

] <ref-zhang2013review>
#block[
\[35\] K. Bestuzheva #emph[et al.], “The SCIP Optimization Suite 8.0,” Zuse Institute Berlin, ZIB-Report 21-41, 2021.

] <ref-SCIP_solver>
#block[
\[36\] S. Maher, M. Miltenberger, J. P. Pedroso, D. Rehfeldt, R. Schwarz, and F. Serrano, “PySCIPOpt: Mathematical programming in python with the SCIP optimization suite,” in #emph[Mathematical software ICMS 2016], Springer International Publishing, 2016, pp. 301--307. doi: #link("https://doi.org/10.1007/978-3-319-42432-3_37")[10.1007/978-3-319-42432-3\_37].

] <ref-SCIP_solver_Python>
] <refs>
