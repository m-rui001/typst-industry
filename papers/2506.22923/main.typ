// Adapted from arXiv:2506.22923v1 by Li, Pangborn, and Kovalenko.
// https://arxiv.org/abs/2506.22923v1
// Original work: CC BY 4.0, https://creativecommons.org/licenses/by/4.0/
#set page(paper: "a4", margin: 19mm)
#set text(size: 10pt, lang: "en")
#set par(justify: true)
#set heading(numbering: "I.A")
#set math.equation(numbering: "(1)")
#set table(inset: 3pt)
#title[Energy-Aware Model Predictive Control for Batch Manufacturing System Scheduling Under Different Electricity Pricing Strategies]
#align(center)[Hongliang Li (1), Herschel C. Pangborn (2), and Ilya Kovalenko (1, 2)]
#align(center)[The Pennsylvania State University, University Park, PA, USA]
#align(center)[(1) Department of Industrial and Manufacturing Engineering · (2) Department of Mechanical Engineering]
#align(center)[#raw("hjl5377@psu.edu") · #raw("hcpangborn@psu.edu") · #raw("iqk5135@psu.edu")]

#strong[Abstract.] Manufacturing industries are among the highest energy-consuming sectors, facing increasing pressure to reduce energy costs. This paper presents an energy-aware Model Predictive Control (MPC) framework to dynamically schedule manufacturing processes in response to time-varying electricity prices without compromising production goals or violating production constraints. A network-based manufacturing system model is developed to capture complex material flows, batch processing, and capacities of buffers and machines. The scheduling problem is formulated as a Mixed-Integer Quadratic Program (MIQP) that balances energy costs, buffer levels, and production requirements. A case study evaluates the proposed MPC framework under four industrial electricity pricing schemes. Numerical results demonstrate that the approach reduces energy usage expenses while satisfying production goals and adhering to production constraints. The findings highlight the importance of considering the detailed electricity cost structure in manufacturing scheduling decisions and provide practical insights for manufacturers when selecting among different electricity pricing strategies.

= Introduction
<sec:intro>
Modern manufacturing systems face increasing pressure to optimize schedules while balancing economic and environmental objectives. The complex manufacturing configuration with batch processes and networked machines and buffers creates unique scheduling challenges~\[1\].

Energy consumption is another critical factor, accounting for a significant share of total operational costs and contributing substantially to environmental impact~\[2\]. In the U.S., the manufacturing sector is responsible for approximately 77% of industrial electricity use, consuming around 27% of the nation's total electricity~\[3\]. Recent advancements in smart grids and demand-side management offer manufacturers opportunities to reduce energy costs by controlling their production schedules in response to time-varying electricity prices~\[4\], \[5\]. However, manufacturers must ensure that these production shifts do not compromise the timely fulfillment of production goals to remain competitive.

Manufacturing scheduling has been extensively studied in operational research and control engineering.

Existing research formulates the scheduling problem as optimization programs~\[5\], \[6\], \[7\], \[8\], \[9\], \[10\].

Some approaches focus on objectives such as minimizing makespan, reducing tardiness, and optimizing resource utilization, typically assuming static operating conditions and fixed resource costs~\[6\], \[11\]. Energy-aware manufacturing has emerged as an important research direction in response to rising energy costs. Scheduling methods with energy considerations have been studied for machine shop systems~\[12\]. Previous research demonstrated the potential for significant energy cost reduction through production scheduling that responds to variable electricity prices~\[13\]. Recent work has expanded these approaches to multi-machine manufacturing environments, considering both energy and production efficiency~\[7\], \[8\]. Existing methods are typically executed offline, limiting their ability to incorporate dynamic information and adapt to changing operational conditions. Advancements in automation and the increasing integration of information technology in manufacturing present new opportunities for manufacturers to leverage highly dynamic information to enhance system responsiveness and efficiency~\[5\], \[10\]. Therefore, there is a need for a scheduling framework that considers the complex manufacturing configurations as well as the dynamic nature of both production requirements and energy costs.

Model Predictive Control (MPC) has emerged as a powerful tool for systematically managing competing objectives and adapting to dynamic conditions while respecting constraints~\[14\]. MPC operates by solving a finite-horizon optimization problem at each decision step using a predictive model to determine optimal control actions while continuously updating decisions based on new information~\[15\].

MPC has been applied for manufacturing scheduling~\[16\], \[17\]. For single-machine scheduling, prior work incorporated energy considerations into an MPC framework under a non-preemptive scheduling scenario~\[17\]. To address more complex manufacturing environments with flexible processing sequences, MPC has also been integrated into multi-agent systems~\[18\]. Additionally, adapting manufacturing schedules to time-varying electricity prices has been an active area of research. For instance,~\[19\] demonstrated significant energy cost savings through MPC-based load shifting under Time-of-Use (TOU) pricing structures.

One important aspect of designing MPC for manufacturing systems is deriving an appropriate prediction model that considers the batch processing and complex manufacturing configurations.

Another important aspect is tuning the MPC optimization program to balance the trade-off between production requirements and energy costs.

While some studies have investigated MPC under specific time-varying pricing schemes, such as TOU pricing~\[5\], \[19\], a comprehensive assessment that considers a broader range of pricing structures remains unexplored in the literature. This gap is particularly significant as industrial consumers face diverse electricity pricing options with complex cost structures, including both energy usage charge and additional demand charge based on peak power demand~\[20\], \[21\].

To address these limitations, we propose an MPC framework based on a network model of manufacturing systems. This model captures parallel and serial production flows and batch processing. A Mixed-Integer Quadratic Programming (MIQP) formulation balances time-varying energy costs, buffer levels, and production requirements while considering production constraints. We provide a comprehensive evaluation of scheduling performance under four distinct electricity pricing programs commonly offered to industrial customers: General pricing, critical peak pricing, TOU pricing, and real-time pricing. By incorporating the cost structure of each pricing program, the evaluation provides practical insights into how each can be accounted for by manufacturing systems.

Through this work, we demonstrate how MPC-based scheduling can dynamically respond to electricity price signals while meeting production requirements in complex batch manufacturing environments.

The remainder of this paper is organized as follows. #link(<sec:problem>)[2] presents the assumptions and problem statement. #link(<sec:model>)[3] provides the manufacturing system model. #link(<sec:controller>)[4] formulates the energy-aware MPC. #link(<sec:case>)[5] presents case study results and discussions, while #link(<sec:conclusion>)[6] provides conclusions and directions for future work.

= Problem Statement
<sec:problem>
We consider a manufacturing system that simultaneously produces multiple distinct products through a network of interconnected processes and buffers. To capture the networked configuration of the manufacturing systems as well as the batch processing, we propose a network-based model with continuous processing flows as shown in Fig.~@fig:network_topology. Nodes represent buffers and edges represent manufacturing processes. The nodes are categorized as intermediate buffers (storing the unfinished parts) and final buffers (storing the completed products). The edges are categorized as intermediate edges (manufacturing processing) and terminal edges (product delivery). Each product has a production sequence with different processing steps. The manufacturing system has batch processing that processes multiple parts simultaneously. As shown in Fig.~@fig:network_topology, some of the processes are performed on the same machine, which need to be started and completed at the same time step, creating coupling constraints.

We make the following assumptions about the manufacturing systems: (1) Each product has a daily production goal. These targets are specified by the higher-level planning team and assumed to be known a day ahead. (2) The system has unlimited raw materials for production. (3) Electricity is the main energy source for the systems. Machine power is linearly related to the processing rate. (4) The process yield rate is not considered.

Given this manufacturing environment, the central problem is to determine daily optimal production schedules considering time-varying electricity pricing that: (1) meet the specified daily production goals, (2) minimize the total energy cost incurred throughout the production process, (3) maintain balanced material flows to avoid bottlenecks, buffer overflows, or production disruptions, and (4) adhere to all production constraints.

= Manufacturing System Model
<sec:model>
#figure(image("graphics/mfg_network.png", width: 100.0%),
  caption: [
    Network topology of an example manufacturing system showing buffers (nodes), manufacturing processes (intermediate edges), and product delivery (terminal edge).
  ]
)
<fig:network_topology>

== Manufacturing Network Model
<manufacturing-network-model>
The discrete-time state-space representation of the system dynamics is: $ x \( k + 1 \) = A x \( k \) + B u \( k \) + E d \( k \) $<eq:sys-model> At each time step $k$, $x \( k \) in bb(R)^(n_x)$ denotes the vector of buffer levels, $u \( k \) in bb(R)^(n_u)$ denotes the vector of processing flow rates, and $d \( k \) in bb(R)^(n_d)$ denotes the vector of final product outflows. Each element $u_j \( k \)$ represents the processing rate along the edge, describing the rate at which material is transferred from its origin buffer to its destination buffer during time step $k$. Similarly, $x_i \( k \)$ denotes the inventory level in buffer $i$ at time $k$, and $d_p \( k \)$ captures the delivery quantity of final product $p$ at time $k$.

Matrix $A$ is the identity matrix, as the process yield rate is not considered. Matrix $B$ captures the network topology: $ B_(i j) = cases(delim: "{", 1 \, & upright("if ") u_j upright(" flows into buffer ") x_i, - 1 \, & upright("if ") u_j upright(" flows out of buffer ") x_i, 0 \, & upright("otherwise")) $ Matrix $E$ maps the final product outflows to their respective buffer states: $ E_(i p) = cases(delim: "{", - 1 \, & upright("if ") d_p upright(" flows out of buffer ") x_i, 0 \, & upright("otherwise")) $ For numerical analysis, we define the outflow incidence matrix $B_o$ as:

$ B_(o \, i j) = cases(delim: "{", - 1 \, & upright("if ") B_(i j) < 0, 0 \, & upright("otherwise")) $

$B_o$ is defined to track material flows leaving each buffer in the manufacturing network.

The machine assignment matrix $M$ characterizes the mapping between manufacturing processing and available machines. Specifically: $ M_(m j) = cases(delim: "{", 1 \, & upright("if machine ") m upright(" executes process ") u_j, 0 \, & upright("otherwise")) $ This binary mapping defines which machine is responsible for each process flow in the system. Notably, certain machines may be assigned to multiple sequential or coupled processes, reflecting common manufacturing configurations. For example, in Fig.~@fig:network_topology, processes $u_2$ and $u_3$ are performed on the same machine.

To capture process coupling behavior, we define the process coupling matrix $C in { 0 \, 1 }^(n_u times n_u)$ as: $ C_(𝜚 rho) = cases(delim: "{", 1 \, & upright("if ") u_𝜚 upright(" and ") u_rho upright(" are on the same machine"), 0 \, & upright("otherwise")) $ The process coupling matrix $C$ identifies all pairs of processes that are physically coupled on a single machine. These processes must be activated and deactivated simultaneously at each time step.

#figure(image("graphics/rtp_tou_cp.png", width: 100.0%),
  caption: [
    Chicago-area industrial electricity pricing programs in 2024: (a) General pricing, (b) Critical peak pricing, (c) TOU Pricing, and (d) Real-time pricing~\[20\], \[21\].
  ]
)
<fig:pricings>

== Energy Consumption Model
<energy-consumption-model>
We characterize electricity pricing programs by considering three types of charges termed basic charge, demand charge, and energy usage charge~\[20\], \[22\]. The basic charge (USD/month) covers the fixed expenses of the utility company, such as transmission network investment and maintenance. The demand charge (USD/kW) is based on the manufacturer's peak power load within a specified period, such as monthly. The energy usage charge (USD/kWh) is based on electricity consumption. For each unit of time, the energy usage of the system is calculated as: $ E \( k \) = sum_(j = 1)^(n_u) epsilon.alt_j dot.op u_j \( k \) $<eq:energy_cal> where $u_j$ is the process rate (unit/hour), and $epsilon.alt_j$ (kWh/unit) is the power of the process.

Consider the discrete time step $k = 1 \, dots.h \, N$, the total energy cost over the time horizon $N$ is calculated as: $ C_(t o t a l) & = C_(b a s i c) + C_(d e m a n d) + C_(e n e r g y)\
 & = rho_b dot.op N + rho_d dot.op m a x \[ E \( k \) \] + sum_(k = 0)^(N - 1) rho_e \( k \) E \( k \)\
 & #h(0em) forall k = 0 \, 2 \, . . . \, N - 1 $ where $C_(b a s i c)$ is the basic charge calculated as the base charge rate $rho_b$ multiplied by the horizon length, $C_(d e m a n d)$ is the demand charge calculated as the demand charge rate $rho_d$ multiplied by the peak power, and $C_(e n e r g y)$ is the energy usage charge calculated as the time-varying energy cost $rho_e \( k \)$ multiplied by the energy usage and summed over the horizon. The demand charge calculation here is based on peak power within the time horizon of $N$, which may not be the true demand charges paid to the utility company. In industry-standard practice, demand charges are calculated based on the peak power over 15 or 30-minute intervals throughout the billing period~\[20\].

= Model Predictive Control Formulation
<sec:controller>
This section presents the MPC formulation for runtime control of the manufacturing system, explicitly accounting for energy costs under different pricing policies. The corresponding MIQP, along with its objective function and constraints, is detailed below.

== System Dynamics and State Input Constraints
<system-dynamics-and-state-input-constraints>
Equation~#link(<eq:sys-model>)[\[eq:sys-model\]] serves as the dynamic prediction model.

The manufacturing system is subject to physical capacity limitations on all buffers and processes: $ x_min lt.eq x \( k \) lt.eq x_max \, #h(0em) u_min lt.eq u \( k \) lt.eq u_max $<eq:state-input-constraints> where $x_min$, $x_max$, $u_min$, and $u_max$ are the minimum and maximum buffer and processing capacities, respectively. Additionally, to ensure material conservation, outflows from any buffer must not exceed available material: $ A x \( k \) + B_o u \( k \) gt.eq 0 $<eq:outbuffer> Equation~#link(<eq:outbuffer>)[\[eq:outbuffer\]] ensures that buffer $x \( k \)$ has enough materials/parts for the next processing of $u \( k \)$. Final product outflows are constrained by available material in the final product buffers:

$ d \( k \) gt.eq 0 $ <eq:finalbuffer1>

$ A x \( k \) + E d \( k \) gt.eq 0 $ <eq:finalbuffer2>

Equation~#link(<eq:finalbuffer1>)[\[eq:finalbuffer1\]] ensures that at each time step the production outflow is nonnegative, while #link(<eq:finalbuffer2>)[\[eq:finalbuffer2\]] ensures that the final buffer has enough products for the delivery.

== Machine Activation Constraints
<machine-activation-constraints>
Manufacturing schedules involve two key aspects: Determining when machines should be activated or deactivated and, once activated, specifying the processing rate. We introduce binary variables $delta_j \( k \) in { 0 \, 1 }$ to model the on/off status of each process to consider the discrete nature:

$ u_j \( k \) lt.eq Lambda dot.op delta_j \( k \) $ <eq:off_condition>

$ u_j \( k \) gt.eq epsilon.alt dot.op delta_j \( k \) $ <eq:on_condition>

where $Lambda$ is a sufficiently large constant and $epsilon.alt$ is a small positive number representing the minimum flow rate when a process is active.

We identify all coupled process groups by the process coupling matrix $C$. Each coupled group $g_i subset.eq { u_1 \, u_2 \, dots.h \, u_(n_u) }$ contains processes that are physically executed on the same machine. For example, the system shown in Fig.~@fig:network_topology contains one coupled group: $g_1 = { u_2 \, u_3 }$. To ensure that coupled processes are activated and deactivated simultaneously, we impose the following synchronization constraint on their binary activation variables: $ delta_(g_i \[ 1 \]) \( k \) = delta_(g_i \[ 2 \]) \( k \) = dots.h.c = delta_(g_i \[ \| g_i \| \]) \( k \) $ where $delta_(g_i \[ j \]) \( k \) in { 0 \, 1 }$ denotes the activation status of the $j$-th process in group $g_i$ at time step $k$. This constraint ensures coordinated on/off decisions for all processes sharing the same machine.

== Production Requirement Constraints
<production-requirement-constraints>
We formulate time-varying production requirement constraints that progressively tighten bounds as deadlines approach. This formulation provides the MPC with more flexibility to shift production during earlier stages, while gradually prioritizing deadline compliance as the production horizon progresses. Let $pi_p \( k \)$ denote the predicted cumulative production of product $p$ at time step $k$. This is calculated as: $ pi_p \( k \) = sum_(t = 0)^k d_p \( k \) $ Let $gamma_p$ denote the production goal of product $p$. Let $lambda_p$ denote the measured completed production at time $k = 0$.

We introduce slack variables $s_p \( k \)$ to permit temporary deviations from production targets:

$ pi_p \( k \) gt.eq gamma_p - lambda_p - s_p \( k \) $ <eq:slack_1>

$ s_p \( k \) gt.eq 0 $ <eq:slack_2>

Equation #link(<eq:slack_1>)[\[eq:slack\_1\]] ensures that the total production at time $k$ within the prediction horizon $N$ is near the remaining target by the deviation of $s_p \( k \)$. Equation #link(<eq:slack_2>)[\[eq:slack\_2\]] ensures the nonnegative slack variables. These soft constraints push the MPC controller to reach the production target diligently.

To avoid such deviation being far from the production target, we constrain the slack variable $s_p \( k \)$ with an upper bound defined by the production deviation allowance as: $ s_p \( k \) & lt.eq alpha \( k \) dot.op gamma_p $ where $alpha \( k \)$ is the allowable fraction of the production goals $gamma_p$. For example, if the production goal is $gamma = 100$ units with a production allowable fraction of $alpha = 0.05$, then the allowed deviation is $5$ units. Instead of having the fixed $alpha$, we progressively tighten $alpha$ through the production. We calculate the time-varying $alpha \( k \)$ through a heuristic metric:

$ alpha \( k \) = tau dot.op (1 - eta \( k \) dot.op \( 1 - xi \)) $ <eq:production-constraint-1>

$ eta \( k \) = h / H + frac(k, 2 N) $ <eq:production-constraint-2>

where $tau$ is the base production tolerance, $xi$ is the tightening factor, $eta \( k \)$ is a progress metric that combines overall production progress with relative position within the prediction horizon, $h$ is the time step of production, and $H$ is the length of the production horizon. Note that $h$ and $H$ are distinct from $k$ and $N$, where the latter denote the time step of the MPC prediction and the length of the prediction horizon, respectively.

== Objective Function
<objective-function>
The MPC objective function balances buffer levels, production variation, slack penalty, and energy usage charges as: $ min_(u \, d \, delta) quad & J = sum_(k = 0)^(N - 1) #scale(x: 180%, y: 180%)[\[] omega_x parallel x \( k \) parallel_2 + omega_u parallel u \( k \) - u \( k - 1 \) parallel_2\
 & + omega_s sum_(j = 1)^(n_d) s_j \( k \) + omega_e C_(e n e r g y) #scale(x: 180%, y: 180%)[\]] $<eq:objective-function> The first term penalizes the buffer level with weight $omega_x$ to incentivize maintaining low buffer holding costs during production. The second term penalizes production schedule variations with weight $omega_u$ to ensure smooth production. The third term penalizes the production slack with weight $omega_s$. The fourth term penalizes the energy usage charges during production with weight $omega_e$. Note that the demand and basic charges are not considered in the MPC formulation, as they relate to the long-term energy consumption profile.

== MPC Implementation Details
<mpc-implementation-details>
The MPC controller dynamically updates machine schedules in a closed-loop manner. At each control step, the MPC solves the MIQP that minimizes the cost objective defined in~#link(<eq:objective-function>)[\[eq:objective-function\]], subject to the manufacturing system dynamics in~#link(<eq:sys-model>)[\[eq:sys-model\]] and constraints in~#link(<eq:state-input-constraints>)[\[eq:state-input-constraints\]]-#link(<eq:production-constraint-2>)[\[eq:production-constraint-2\]]. A shrinking horizon implementation is used, where only the optimal decision variables at the first time step of each optimization are applied to the manufacturing system. This process repeats at every subsequent time step in a closed loop.

= Case Study
<sec:case>
#figure(image("graphics/case_sys.png", width: 90.0%),
  caption: [
    The manufacturing system considered in the case study includes 11 buffers and 12 processes, producing 3 products. Processes 1 and 2 share the same machine, as do processes 4, 5, and 10, 11, 12.
  ]
)
<fig:case_sys>

#figure(
  table(
    columns: 6,
    table.header([Electricity pricing program], [Basic charge (USD/month)], [Demand charge (USD/kW peak per month)], [Peak (USD/kWh)], [Mid-peak (USD/kWh)], [Off-peak (USD/kWh)]),
    [General Pricing], [221.77], [10.93], [—], [—], [0.03128],
    [Critical Peak Pricing#super[1]], [221.77], [10.93], [0.72500], [—], [0.03128],
    [TOU Pricing#super[2]], [221.77], [10.93], [0.05782], [0.02561], [0.01583],
    [Real-Time Pricing], [221.77], [5.46], table.cell(colspan: 3)[Hourly market rates],
  ),
  caption: [Industrial electricity pricing structures for the Chicago area in 2024.],
) <tab:pge_rates>
$""^1$ The critical peak period is from 1:00~pm to 5:00~pm on these 15 days. Avoiding critical peak events will generate 1 USD/day credit for the industrial customers. \
$""^2$ On-peak: 3:00~pm--8:00~pm weekdays; Mid-peak: 6:00~am--3:00~pm and 8:00~pm--10:00~pm weekdays; Off-peak: 10:00~pm--6:00~am all days, all hours weekends. \

#figure(
  align(center)[#table(
    columns: 4,
    align: (left,center,left,center,),
    table.header([Parameter], [Value], [Parameter], [Value],),
    table.hline(),
    [$N$], [24 h], [$tau$,], [0.05],
    [$xi$], [0.5], [$omega_s$], [1000],
    [$omega_x$], [1], [$omega_u$], [0.5],
    [$omega_e$], [500], [$\[ gamma_1 \, gamma_2 \, gamma_3 \]$], [\[75,30,45\] units],
  )]
  , caption: [Simulation and MPC parameters.]
  , kind: table
  ) <tab:MPC_params>
#figure(
  align(center)[#table(
    columns: 4,
    align: (left,center,left,center,),
    table.header([Parameter], [Value], [Parameter], [Value],),
    table.hline(),
    [$x_(m i n)^(1 \, dots.h \, 11)$], [0 units], [$x_(m a x)^(1 \, dots.h \, 8)$,], [15 units],
    [$x_(m a x)^(9 \, 10 \, 11)$], [20 units], [$u_(m i n)^(1 \, dots.h \, 12)$], [0 units/hour],
    [$u_(m i n)^(1 \, dots.h \, 12)$], [0 units/hour], [$u_(m a x)^(1 \, 2)$], [15 units/hour],
    [$u_(m a x)^(3 \, dots.h \, 12)$], [10 units/hour], [$epsilon.alt_(1 \, 2)$], [0.5 kWh/unit],
    [$epsilon.alt_(10 \, 11 \, 12)$], [0.5 kWh/unit], [$epsilon.alt_(3 \, dots.h \, 9)$], [0.25 kWh/unit],
  )]
  , caption: [Manufacturing system parameters.]
  , kind: table
  ) <tab:Mfg_params>
== Case Study Setup
<case-study-setup>
We demonstrate the effectiveness of the proposed MPC framework with a realistic manufacturing system case study. We evaluate the performance of the proposed method with one baseline general electricity pricing program and three time-varying electricity pricing programs, namely critical peak pricing, TOU pricing, and real-time pricing. These four electricity pricing programs are described in Table~@tab:pge_rates. These pricing structures are representative of those offered by major U.S. utility providers. We consider a manufacturing system with 11 buffers, 12 processes, 8 machines, and 3 final products. Fig.~@fig:case_sys shows the system network topology, where $g_1 = { u_1 \, u_2 }$ is assigned to machine 1, $g_2 = { u_4 \, u_5 }$ is assigned to machine 2, and $g_3 = { u_10 \, u_11 \, u_12 }$ is assigned to machine 3. The manufacturing scheduling problem is solved using the proposed MPC framework described in~#link(<sec:controller>)[4]. This is formulated in MATLAB~\[23\] using YALMIP~\[24\] and solved with the Gurobi optimization solver~\[25\]. The initial condition is set to 0 for all buffers. For each pricing program, we simulate the manufacturing system over a 24-hour horizon with a known daily production goal of 75, 30, and 45 units for each product. The simulation parameters are summarized in Tables~@tab:MPC_params --@tab:Mfg_params.

== Results and Analysis
<results-and-analysis>
Fig.~@fig:machine_on_off shows the machine activity patterns across all pricing programs over the 24-hour production horizon. Machine activation patterns are effectively adapted to the underlying pricing structures. Under general pricing, as shown in Fig.~@fig:machine_on_off\(a), machines operate more uniformly throughout the day. In contrast, dynamic pricing programs in Fig.~@fig:machine_on_off\(b)-(d) show more strategic scheduling, concentrating operations during lower-price periods. Under critical peak pricing, shown in Fig.~@fig:machine_on_off\(b), there is an evident reduction in machine activity during the peak pricing event (hours 14-17). This demonstrates the controller's ability to respond to time-varying pricing by shifting production to lower-cost periods.

Fig.~@fig:process_rates and Fig.~@fig:buffer_levels show how the MPC controller adjusts processing rates and manages inventory in response to different electricity pricing programs. Fig.~@fig:process_rates shows the processing rate of final processes $u_10$, $u_11$, and $u_12$ across 24 hours. Under general pricing with the uniform energy charge, the MPC algorithm generates consistent operations throughout most of the day. Fig.~@fig:process_rates\(a) exhibits minimal variation across the 24 hours, as the constant pricing structure incentivizes production scheduling based purely on meeting production requirements rather than the time-dependent energy cost. The critical peak scenario displays an evident processing avoidance during the critical peak event period of hours 1:00 pm to 5:00 pm. The processing rates show a significant reduction during these hours when electricity costs surge to $0.725$ USD/kWh, compared to the normal rate of $0.031$ USD/kWh. The system compensates by intensifying operations in periods immediately before and after the critical event. TOU pricing produces different scheduling behavior with clear temporal patterns. Manufacturing activities concentrate during off-peak hours, with notable reductions from 3:00 pm to 8:00 pm. The system effectively shifts operations to leverage lower electricity rates during off-peak periods. The real-time pricing scenario exhibits more dynamic and responsive scheduling.

This adaptive behavior is particularly evident in inputs $u_10$, $u_11$, and $u_12$, which display varying intensities throughout the day corresponding to hourly price fluctuations. Fig.~@fig:cumulative_production shows the cumulative production for all three products. The MPC controller drives the manufacturing system to successfully meet the daily production targets across different electricity pricing structures. General pricing follows a relatively linear production pattern, while dynamic pricing models exhibit stepped approaches, with production accelerating during low-price periods.

#figure(image("graphics/machine_on_off.png", width: 100.0%),
  caption: [
    Machine on/off signal under different electricity pricing programs.
  ]
)
<fig:machine_on_off>

#figure(image("graphics/process_levels.png", width: 100.0%),
  caption: [
    Processing rate of $u_10$, $u_11$, and $u_12$ under different electricity pricing programs.
  ]
)
<fig:process_rates>

#figure(image("graphics/buffer_levels.png", width: 100.0%),
  caption: [
    Buffer level of $x_9$, $x_10$, and $x_11$ under differenrt electricity pricing programs.
  ]
)
<fig:buffer_levels>

#figure(image("graphics/production_targets.png", width: 100.0%),
  caption: [
    Cumulative production for each product under different pricing programs.
  ]
)
<fig:cumulative_production>

Table~@tab:cost_comparison presents the cost breakdown across all pricing programs, detailing basic charges, demand charges, energy usage charges, and total utility costs alongside peak power.

Analysis of energy usage charges reveals significant cost advantages for time-varying electricity pricing models. Compared to general pricing, the critical peak, TOU, and real-time pricing programs achieved energy usage cost reductions of 14%, 11%, and 31%, respectively. However, these savings mechanisms involve strategic load shifting that concentrates operations during off-peak periods, consequently creating higher peak power under all dynamic pricing scenarios. Notably, the real-time pricing model incorporates a substantially lower demand charge rate (5.46 USD/kW versus 10.93 USD/kW for other programs), mitigating the financial impact of its higher peak demand. The real-time pricing rate structure represents a grid-level incentive for manufacturers to adopt more dynamic and responsive energy management strategies. Real-time pricing achieves the lowest total cost at 109.02 USD, representing a 23% reduction compared to general pricing.

The MPC approach demonstrates adaptability in scheduling operations according to time-varying pricing while maintaining production targets. The controller successfully balances multiple objectives, including buffer management and energy cost minimization, across all pricing scenarios. Critical peak, TOU, and real-time pricing programs effectively encourage shifting operations from high-cost periods to low-cost periods. However, the load shifting creates higher peak power, which leads to higher demand charges. For practical implementation, distributed energy resources, particularly on-site batteries or supercapacitors, could complement the MPC framework by mitigating peak power issues~\[26\]. This case study demonstrates that the relationship between electricity pricing programs and optimal manufacturing scheduling is complex. Intuitive approaches of shifting operations to lower-rate periods may not always yield the lowest total cost when demand charges constitute a significant portion of the electricity bill.

#figure(
  align(center)[#table(
    columns: 6,
    align: (left,center,center,center,center,center,),
    table.header([Pricing Programs], [Basic Charge], [Demand Charge], [Peak Power (kW)], [Usage Charge], [Total Cost],),
    table.hline(),
    [General Pricing], [7.39], [126.73], [11.59], [7.04], [141.16],
    [Critical Peak Pricing], [7.39], [168.27], [15.39], [6.04], [181.70],
    [TOU Pricing], [7.39], [181.72], [16.63], [6.27], [195.39],
    [Real-Time Pricing], [7.39], [96.79], [17.73], [4.84], [109.02],
  )]
  , caption: [Comparison of electricity cost under different pricing programs (all costs in USD).]
  , kind: table
  ) <tab:cost_comparison>
= Conclusion
<sec:conclusion>
This paper presents an energy-aware Model Predictive Control (MPC) framework for manufacturing systems that optimally balances production requirements and energy cost minimization under dynamic electricity pricing. The proposed approach models the manufacturing system as a network and leverages Mixed-Integer Quadratic Programming (MIQP) to make optimal scheduling decisions in response to time-varying electricity prices. Case studies demonstrate that the proposed framework effectively shifts manufacturing operations away from high-price periods, leading to substantial reductions in energy usage costs while maintaining production targets. However, the concentration of machine operations during lower-cost periods increases peak power demand, which may result in higher demand charges. Future work can extend the proposed framework in two key directions: First is incorporating sources of uncertainty, such as volatile electricity prices and dynamic production goals, and second is integrating more complex, non-linear power profiles to improve real-world applicability.

#heading(level: 1, numbering: none)[References]
<bibliography>
#block[
#block[
\[1\] J. F. C. Oliveira and J. A. Ferreira, “Algorithms for nesting problems,” in #emph[Applied simulated annealing], R. V. Vidal, Ed., Berlin, Germany: Springer, 1993, pp. 255--273.

] <ref-oliveira1993algorithms>
#block[
\[2\] Z. Zhou, M. Shojafar, M. Alazab, and F. Li, “IECL: An intelligent energy consumption model for cloud manufacturing,” #emph[IEEE Transactions on Industrial Informatics], vol. 18, no. 12, pp. 8967--8976, 2022.

] <ref-zhou2022iecl>
#block[
\[3\] U.S. Energy Information Administration, “Use of Energy in the Industry Sector.” 2025. Available: #link("https://www.eia.gov")

] <ref-EIA2025>
#block[
\[4\] Z. M. Fadlullah, M. M. Fouda, N. Kato, A. Takeuchi, N. Iwasaki, and Y. Nozaki, “Toward intelligent machine-to-machine communications in smart grid,” #emph[IEEE Communications Magazine], vol. 49, no. 4, pp. 60--65, 2011.

] <ref-fadlullah2011toward>
#block[
\[5\] H. Li, H. C. Pangborn, and I. Kovalenko, “A system-level energy-efficient digital twin framework for runtime control of batch manufacturing processes,” in #emph[2023 IEEE 19th international conference on automation science and engineering (CASE)], 2023, pp. 1--6.

] <ref-li2023system>
#block[
\[6\] M. L. Pinedo, #emph[Scheduling: Theory, algorithms, and systems], 5th ed. New York, NY, USA: Springer, 2016.

] <ref-pinedo2016scheduling>
#block[
\[7\] L. Zhou, L. Zhang, L. Ren, and J. Wang, “Real-time scheduling of cloud manufacturing services based on dynamic data-driven simulation,” #emph[IEEE Transactions on Industrial Informatics], vol. 15, no. 9, pp. 5042--5051, 2019.

] <ref-zhou2019real>
#block[
\[8\] W. Shao, Z. Shao, and D. Pi, “An ant colony optimization behavior-based MOEA/d for distributed heterogeneous hybrid flow shop scheduling problem under nonidentical time-of-use electricity tariffs,” #emph[IEEE Transactions on Automation Science and Engineering], vol. 19, no. 4, pp. 3379--3394, 2021.

] <ref-shao2021ant>
#block[
\[9\] I. Kovalenko, E. C. Balta, D. M. Tilbury, and K. Barton, “Cooperative product agents to improve manufacturing system flexibility: A model-based decision framework,” #emph[IEEE Transactions on Automation Science and Engineering], vol. 20, no. 1, pp. 440--457, 2023, doi: #link("https://doi.org/10.1109/TASE.2022.3156384")[10.1109/TASE.2022.3156384].

] <ref-9737280>
#block[
\[10\] X. Xu, Y. Lu, B. Vogel-Heuser, and L. Wang, “Industry 4.0 and industry 5.0---inception, conception and perception,” #emph[Journal of Manufacturing Systems], vol. 61, pp. 530--535, 2021.

] <ref-xu2021industry>
#block[
\[11\] K. Fang, N. Uhan, F. Zhao, and J. W. Sutherland, “A new approach to scheduling in manufacturing for power consumption and carbon footprint reduction,” #emph[Journal of Manufacturing Systems], vol. 30, no. 4, pp. 234--240, Oct. 2011.

] <ref-fang2011new>
#block[
\[12\] G. Mouzon, M. B. Yildirim, and J. Twomey, “Operational methods for minimization of energy consumption of manufacturing equipment,” #emph[International Journal of Production Research], vol. 45, no. 18--19, pp. 4247--4271, Sep. 2007.

] <ref-mouzon2007operational>
#block[
\[13\] F. Shrouf, J. Ordieres-Meré, A. García-Sánchez, and M. Ortega-Mier, “Optimizing the production scheduling of a single machine to minimize total energy consumption costs,” #emph[Journal of Cleaner Production], vol. 67, pp. 197--207, Mar. 2014.

] <ref-shrouf2014optimizing>
#block[
\[14\] S. J. Qin and T. A. Badgwell, “An overview of industrial model predictive control technology,” in #emph[AIche symposium series], American Institute of Chemical Engineers, 1997, pp. 232--256.

] <ref-qin1997overview>
#block[
\[15\] D. Q. Mayne, J. B. Rawlings, C. V. Rao, and P. O. M. Scokaert, “Constrained model predictive control: Stability and optimality,” #emph[Automatica], vol. 36, no. 6, pp. 789--814, Jun. 2000.

] <ref-mayne2000constrained>
#block[
\[16\] M. Baldea and I. Harjunkoski, “Integrated production scheduling and process control: A systematic review,” #emph[Computers & Chemical Engineering], vol. 71, pp. 377--390, Dec. 2014.

] <ref-baldea2014integrated>
#block[
\[17\] S. Rubaiee, S. Cinar, and M. B. Yildirim, “An energy-aware multiobjective optimization framework to minimize total tardiness and energy cost on a single-machine nonpreemptive scheduling,” #emph[IEEE Transactions on Engineering Management], vol. 66, no. 4, pp. 699--714, 2018.

] <ref-rubaiee2018energy>
#block[
\[18\] E. C. Balta, I. Kovalenko, I. A. Spiegel, D. M. Tilbury, and K. Barton, “Model predictive control of priced timed automata encoded with first-order logic,” #emph[IEEE Transactions on Control Systems Technology], vol. 30, no. 1, pp. 352--359, 2022, doi: #link("https://doi.org/10.1109/TCST.2021.3054800")[10.1109/TCST.2021.3054800].

] <ref-9354443>
#block[
\[19\] M. Gaggero, M. Paolucci, and R. Ronco, “Exact and heuristic solution approaches for energy-efficient identical parallel machine scheduling with time-of-use costs,” #emph[European Journal of Operational Research], vol. 311, no. 3, pp. 845--866, 2023.

] <ref-GAGGERO2023845>
#block[
\[20\] Commonwealth Edison Company (ComEd), “ComEd.” \[Online\]. Available: #link("https://www.comed.com/")

] <ref-ComEd_website>
#block[
\[21\] PJM Interconnection, LLC, “PJM your power our grid.” \[Online\]. Available: #link("https://www.pjm.com/")

] <ref-PJM_website>
#block[
\[22\] National Renewable Energy Laboratory (NREL), “Open energy information.” \[Online\]. Available: #link("https://openei.org")

] <ref-OpenEI_website>
#block[
\[23\] The MathWorks Inc., “MATLAB version (R2023a).” The MathWorks Inc., Natick, Massachusetts, United States, 2023. Available: #link("https://www.mathworks.com")

] <ref-MATLAB>
#block[
\[24\] J. Löfberg, “YALMIP: A toolbox for modeling and optimization in MATLAB,” in #emph[In proceedings of the CACSD conference], Taipei, Taiwan, 2004.

] <ref-Lofberg2004>
#block[
\[25\] GUROBI Optimization, LLC, “GUROBI Optimizer Reference Manual.” 2024. Available: #link("https://www.gurobi.com")

] <ref-gurobi>
#block[
\[26\] F. Garcia-Torres, C. Bordons, and M. A. Ridao, “Optimal economic schedule for a network of microgrids with hybrid energy storage system using distributed model predictive control,” #emph[IEEE Transactions on Industrial Electronics], vol. 66, no. 3, pp. 1919--1929, 2018.

] <ref-garcia2018optimal>
] <refs>
