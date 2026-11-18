// Adapted from arXiv:2509.19243v1 by Alahmed et al.
// https://arxiv.org/abs/2509.19243v1
// Original work: CC BY 4.0, https://creativecommons.org/licenses/by/4.0/
#set page(paper: "a4", margin: 19mm)
#set text(size: 10pt, lang: "en")
#set par(justify: true)
#set heading(numbering: "I.A")
#set math.equation(numbering: "(1)")
#title[Watts and Drops: Co-Scheduling Power and Water in Desalination Plants]
#align(center)[Ahmed S. Alahmed (1), Audun Botterud (2), Saurabh Amin (2), and Ali T. Al-Awami (1)]
#align(center)[#text(size: 8pt)[(1) Electrical Engineering Department and Interdisciplinary Research Center for Smart Mobility and Logistics, King Fahd University of Petroleum and Minerals, Dhahran, Saudi Arabia. (2) Laboratory for Information and Decision Systems, Massachusetts Institute of Technology, Cambridge, MA, USA.]]
#align(center)[Correspondence: #raw("alahmad@kfupm.edu.sa")]
#align(center)[Supported in part by the Interdisciplinary Research Center for Smart Mobility and Logistics under project INML2411.]

#strong[Abstract.] We develop a mathematical framework to jointly schedule water and electricity in a profit-maximizing, renewable-colocated water desalination plant that integrates both thermal- and membrane-based technologies. The price-taking desalination plant sells desalinated water to a water utility at a given price and engages in bi-directional electricity transactions with the grid, purchasing or selling power based on its net electricity demand. We show that the optimal scheduling policy depends on the plant's internal renewable generation and follows a simple threshold structure. Under the optimal policy, thermal-based water output decreases monotonically with renewable ouput, while membrane-based water output increases monotonically. We characterize the structure and intuition behind the threshold policy and examine key special properties.

#strong[Keywords.] reverse-osmosis, thermal desalination, renewable energy, water-energy nexus.

= Introduction
<sec:intro>
The water-energy nexus has garnered growing research attention. The interdependence is bidirectional: electricity powers water extraction, treatment, and desalination, while water is essential for power generation, especially in thermal plants. This mutual reliance has prompted the development of integrated models to optimize resource use and support cross-sectoral planning. Thermal desalination plants (TDPs), commonly used in energy-rich regions, produce freshwater as a primary product while producing electric power as a byproduct. These cogeneration plants benefit from shared heat and power flows and result in tightly coupled operational dynamics. Notably, \[1\], \[2\] developed dynamic physics-based models for integrated thermal power and thermal water desalination systems, highlighting the importance of coordinated management of thermal power plants and thermal desalination plants.

In contrast, reverse osmosis (RO) has recently become the leading desalination technology due to its modularity and improved energy efficiency. In fact, according to some reports, RO now accounts for approximately 69% of the installed desalination capacity globally, with most new projects deploying RO desalination units \[3\]. RO desalination plants (RODPs) primarily draw electricity from the grid, positioning them as large, flexible loads within the power system. Recent studies in \[4\], \[5\], \[6\] have explored coupling RODPs with renewable energy sources using hybrid optimization frameworks to minimize costs and emissions. However, these studies treat the power system as an external input and overlook the bidirectional interactions between water and energy. This gap is addressed in \[7\], \[8\], \[9\] by modeling co-optimized water-energy microgrids and coordinated RO-power scheduling platforms, considering dynamic demand, grid constraints, and renewable variability. Their research also explores the use of RODPs for demand-side grid support, including demand response and frequency regulation.

However, the existing literature has not addressed the interaction between thermal and RO desalination units when they co-exist within the same territory in the water-energy nexus context.

This paper develops a mathematical framework for the joint scheduling of water and power in a #emph[profit-maximizing] water desalination plant (WDP) equipped with thermal and membrane-based technologies, and local renewable generation. The WDP is modeled as a price-taking agent that engages in water and electricity transactions with a water utility and an electric utility. A key challenge lies in utilizing the complementarities between the two different desalination technologies, especially when coupled with the variability of the renewable energy supply.

Our main contribution is the characterization of WDP's optimal production plan when colocated with renewables. We show that the optimal policy adopts a simple two-threshold structure: when renewable generation is low, the WDP prioritizes thermal-based desalination, and as renewable availability increases, it shifts progressively toward membrane-based production. This structural result provides not only a computationally tractable policy but also valuable operational insights. Specifically, we prove that the thermal-based water output decreases monotonically with renewable availability, while membrane-based output increases accordingly.

In addition to the general solution structure, we analyze several special cases to illustrate the practical implications of the proposed policy and to highlight conditions under which either technology is preferred. Our findings have broader relevance for the optimal dispatch of hybrid energy-water systems, particularly in smart grid environments where flexibility and responsiveness are increasingly rewarded.

= WDP Framework and Decision Problem
<sec:form>
We consider a hybrid WDP that jointly optimizes water and electricity schedules to maximize profit, defined as the revenue from selling water and electricity minus operational costs, including electricity procurement from the grid (Fig.~@fig:WDP). The WDP utilizes thermal and membrane-based technologies, in addition to renewable energy sources.#footnote[Although membrane-based technologies are improving rapidly, thermal desalination remains more robust under high-salinity and harsh climatic conditions, while also offering better grid support capabilities.] On one hand, the WDP unidirectionally interacts with the water utility by selling water at a price that is known #emph[apriori] and may be temporally varying. On the other hand, the WDP bidirectionally transacts with the electricity utility by buying and selling electricity at possibly asymmetric prices of buying and selling based on its net consumption. In both markets, water and electricity, the WDP operates as a #emph[price-taker].

The WDP electric grid net metering arrangement here is similar to that of energy communities and distributed energy resources aggregation schemes under regulated utilities \[10\], \[11\].

#figure(image("graphics/WDPframeworkv3.png"),
  caption: [
    Hybrid WDP framework with TDP, RODP, and renewables. The water outputs of the thermal and membrane units are denoted by $w_h \, w_r in bb(R)_(+)$, respectively. The electricity output of the TDP, RODP, and renewables are denoted by $q_h \, q_r \, g in bb(R)_(+)$, respectively. The net electricity consumption of the WDP is denoted by $z in bb(R)$. The amount of fuel feeding the TDP is denoted by $p_h in bb(R)_(+)$.
  ]
)
<fig:WDP>

For the remainder of this section, we present the modeling of the TDP, RODP, payment functions of the water and electricity utilities, and the WDP co-optimization problem.

== TDP and RODP Models
<tdp-and-rodp-models>
=== TDP
<tdp>
The TDP uses a boiler to heat seawater using a fuel source, producing steam that is then condensed to obtain fresh water. The waste heat is used to power a turbine to produce electricity. The TDP, therefore, produces both water and electricity, which we denote by $w_h in bb(R)_(+)$ and $q_h in bb(R)_(+)$, respectively. The water generated by the TDP is a function of burned fuel $w_h = f_h \( p_h \) = alpha_h p_h$, where $alpha_h gt.eq 0$ is a thermal conversion factor. Let $f'_h \( p_h \)$ be the derivative of $f_h \( p_h \)$ with respect to $p_h$.

The TDP produces electricity as a by-product of water desalination, governed by the relation $w_h = eta_h q_h$, where $eta_h > 0$ denotes the water-to-electricity production ratio. We further define the thermal conversion factor as $beta_h := alpha_h \/ eta_h gt.eq 0$, representing the ratio of fuel energy to electricity output.

The TDP water flowrate is bounded by the maximum $overline(w)_h in bb(R)_(+)$ and minimum $underline(w)_h in bb(R)_(+)$ operational limits that ensure stable operation, #emph[i.e.,~]$w_h in \[ underline(w)_h \, overline(w)_h \]$.

The TDP's operating cost function is denoted by $C_h \( p_h \) in bb(R)$. We assume the cost function $C_h \( dot.op \)$ to be strictly convex, continuously differentiable, and non-decreasing.

=== RODP
<rodp>
The RODP consumes electricity to force pressure seawater through a semi-permeable membrane under high pressure, effectively filtering out salt and impurities.

The water production and electricity consumption of the RODP are denoted by $w_r \, q_r in bb(R)_(+)$, respectively. The amount of water produced by the RODP $w_r$ is a linear function of the electricity consumed $q_r$ by that module, #emph[i.e.,~]$w_r = f_r \( q_r \) = alpha_r q_r$, where $alpha_r > 0$ is the RODP's conversion factor. We use $f'_r$ to denote the derivative of $f_r$ with respect to $q_r$.

The water production of the RODP is bounded from above by the maximum $overline(w)_r in bb(R)_(+)$ flowrate and from below by the minimum $underline(w)_r in bb(R)_(+)$ operational limits that ensure stable operation, #emph[i.e.,~]$w_r in \[ underline(w)_r \, overline(w)_r \]$.

== Water and Electricity Payments
<water-and-electricity-payments>
=== Water Payment
<water-payment>
The profit-maximizing WDP sells the total desalinated water from the TDP and RODP to the water utility; therefore, the WDP revenue function is given by $ P^w \( w_h \, w_r \) = pi^w \( w_h + w_r \) \, $<eq:WaterPayment> where $pi^w in bb(R)_(+)$ is the water selling price.

=== Electricity Payment
<electricity-payment>
The profit-maximizing WDP transacts with the electric utility, which charges the WDP based on its net electricity consumption $z : bb(R)_(+) times bb(R)_(+) arrow.r bb(R)$, given by $ z \( q_r \, q_h \; g \) = q_r - q_h - g \, $<eq:NetConsumption> where $g in bb(R)_(+)$ is the WDP aggregate renewables production.

Given the electric utility's prices, the electricity payment function is given as $ P_pi \( q_r \, q_h \; g \) = pi^(+) \[ z \( q_r \, q_h \; g \) \]^(+) - pi^(-) \[ z \( q_r \, q_h \; g \) \]^(-) \, $<eq:ElectricPayment> where $\[ x \]^(+) \, \[ x \]^(-)$ are the positive and negative parts of $x$, #emph[i.e.,~]$\[ x \]^(+) = max { 0 \, x }$, $\[ x \]^(-) = - min { 0 \, x }$, and $x = \[ x \]^(+) - \[ x \]^(-)$. The electricity tariff parameters $\( pi^(+) \, pi^(-) \) in bb(R)_(+)$ are the power import and export prices, respectively. To avoid utility death spirals and risk-free arbitrage by the WDP, we assume $pi^(+) gt.eq pi^(-)$ \[12\].

The WDP imports power if $z > 0$, and exports power if $z < 0$.

== WDP Profit
<wdp-profit>
The profit function of the profit-seeking WDP can be written as $ Pi \( w_h \, w_r \, q_h \, q_r \; g \) := & P^w \( w_h \, w_r \) - P_pi \( q_r \, q_h \; g \)\
 & - C_h \( p_h \) \, $<eq:WDPprofit> where the first term represents the revenue generated from water sales; the second represents the monetary transaction from net electricity consumption, constituting a cost when electricity is purchased ($z > 0$) and a revenue when it is sold ($z < 0$); and the third term reflects the operating costs of the TDP. The operating costs of the RODP, by contrast, are implicitly accounted for through the cost of procuring the energy $q_r$, which may be sourced from on-site renewables, the TDP, the grid, or any combination thereof.

== WDP Decision Problem
<wdp-decision-problem>
The WDP's objective is to maximize its profit subject to plant capacity and energy balance constraints by co-optimizing the thermal and RO units; hence, it solves the following program $ \( w_h^(*) \, w_r^(*) \, q_h^(*) \, q_r^(*) \) := #h(-1em) & "argmax"_(w_h \, q_h \, w_r \, q_r in bb(R)_(+)) zws Pi \( w_h \, w_r \, q_h \, q_r \; g \)\
 & med med med med med med upright("subject to") med med med z = q_r - q_h - g\
 & #h(5em) w_h + w_r gt.eq cal(W)\
 & #h(5em) underline(w)_h lt.eq w_h lt.eq overline(w)_h\
 & #h(5em) underline(w)_r lt.eq w_r lt.eq overline(w)_r \, $<eq:Optimization> where $cal(W)$ is the total desalinated water demanded by the water utility. Note that the objective of the profit-maximization problem above is non-differentiable due to the presence of indicator functions in the electricity payment expression in (@eq:ElectricPayment). We assume that the WDP is sized so that the minimum output of desalinated water is no less than that demanded by the water utility, #emph[i.e.,~]$underline(w)_h + underline(w)_r gt.eq cal(W)$.

= Optimal WDP Operation
<sec:Optimal>
We highlight here the optimal co-scheduling policy and its properties, leaving detailed theoretical development in \[13\].

The optimal threshold-based co-scheduling policy for TDP and RODP when $f'_r pi^w in \[ pi^(-) \, pi^(+) \]$ is depicted in Fig. @fig:Optimal. To schedule the plants, the WDP measures the aggregate renewable generation $g$ and compares it with two thresholds ($Gamma_(sans(I M)) \, Gamma_(sans(E X)) \, Gamma_(sans(E X)) gt.eq Gamma_(sans(I M))$). The WDP imports power ($z > 0$) for water desalination when $g < Gamma_(sans(I M))$, exports power ($z < 0$) and water when $g > Gamma_(sans(E X))$, and operates in an islanded-mode with respect to the electricity utility ($z = 0$) when $g in \[ Gamma_(sans(I M)) \, Gamma_(sans(E X)) \]$, while using all local generation to desalinate and sell water. Therefore, when $g < Gamma_(sans(I M))$, the WDP uses local renewables, the TDP-produced electricity, and the grid electricity to feed the RODP's consumption of electricity to produce water. When the renewables are at a higher level of $g gt.eq Gamma_(sans(I M))$, the WDP uses only local renewables and TDP-produced electricity for the RODP's consumption.

#figure(image("graphics/OptimalPolicyAllertonv3.png"),
  caption: [
    Optimal TDP and RODP water schedules, when $f'_r pi^w in \[ pi^(-) \, pi^(+) \]$ and $w_h^(sans(I M)) < w_r^(sans(I M))$.
  ]
)
<fig:Optimal>

The two thresholds that govern the optimal policy, $Gamma_(sans(I M))$ and $Gamma_(sans(E X))$, depend only on the parameters of water and electricity tariffs and the conversion coefficients of the TDP and RODP. Both $Gamma_(sans(I M))$ and $Gamma_(sans(E X))$ can be computed #emph[offline], independent of the renewable generation $g$.

As depicted in Fig.~@fig:Optimal, the optimal TDP water output decreases monotonically with $g$, dynamically transitioning from the three constant production levels $w_r^(sans(I M))$, $w_h^(sans(N Z))$, and $w_r^(sans(E X))$. The TDP outputs are all computed in closed form. On the other hand, the optimal RODP water output increases monotonically with $g$, dynamically transitioning from the minimum production level to the maximum production level. The RODP thresholds are also computed in closed-form, and independent of the electric tariff parameters \[13\].

It should be noted that the WDP's profit is linear in $w_r$, yielding boundary solutions when $f'_r pi^w > pi^(+)$, with $w_r^(*) \( g \) = overline(w)_r$ for all $g$, and when $f'_r pi^w < pi^(-)$ with $w_r^(*) \( g \) = underline(w)_r$ for all $g$. An implication of this linearity is that if $f'_r pi^w > pi^(-)$, the TDP's electricity output is never exported, unless RODP reaches its upper operational limit $overline(w)_r$. Also, under this case, the WDP prioritizes using renewable energy for water desalination rather than energy export. When $f'_r pi^w > pi^(+)$, energy exports only occur if RODP saturates. The intuition here is that using renewables to desalinate and sell water is always more lucrative to the WDP than selling the renewables directly to the electric utility.

We analyze in \[13\] some special cases, and comparative statics of the optimal decisions with changing tariff and desalination technology parameters.

= Numerical Results
<sec:num>
To showcase the optimal operation of the plant and the effect of tariff and plant parameters, we consider a WDP with TDP, RODP, and solar PV renewable generation. Semi-synthetic data are used in the simulation. The WDP faces a #emph[water utility] that purchases desalinated water at a price $pi^w$, which is varied throughout the simulation. The WDP also faces an #emph[electric utility] that adopts a net energy metering tariff with a retail rate of $pi^(+) = \$ 0.4$/kWh and a sell rate of $pi^(-) = \$ 0.1$/kWh, respectively.

The TDP operating cost function is assumed to be a convex quadratic function $C_h \( p_h \) = b p_h^2 + a p_h$, with $b = \$ 0.001 \/ upright("BTU")^2$ and $a = \$ 0.05 \/ upright("BTU")$. The TDP and RODP flowrate limits are set as follows $overline(w)_h = overline(w)_r = 8333 med m^3 h \, underline(w)_h = underline(w)_r = 0 med m^3 h$. The conversion factor of TDP is $alpha_h = eta_h = 1 \/ 10$, whereas the conversion for RODP is set to $alpha_r = 1 \/ 4$.

We used PecanStreet's 2018 rooftop solar data \[14\] by aggregating the generation output of 23 households and then scaling it up to meet WDP's energy needs. The distribution of the annual aggregate and scaled renewable generation profile is shown in Fig.@fig:Rawdata. To capture variability in renewable output, we performed 100,000 Monte Carlo simulations using hourly profiles generated as independent normal random variables with hour-specific means and variances derived from historical data.

On average, solar photovoltaic output peaked in the afternoon at 13, reaching approximately 36.2 MWh, with mean outputs of 34.4 and 35.2 at hours 12 and 14, respectively. PV output is negligible, recording zero from 1 to 6 and 21 to 23, and remained near zero at 7 and 20. During high production hours, the median (red line) was higher than the mean, indicating a negatively skewed distribution. This skewness is attributed to the relatively high production on most days, contrasted by notably low production during heavily overcast days, which created longer tails on the left side of the distribution.

#figure(image("graphics/WDP1.png", width: 70.0%),
  caption: [
    Daily Solar PV generation profile.
  ]
)
<fig:Rawdata>

== Optimal Water and Electricity Schedules
<optimal-water-and-electricity-schedules>
We examine, in Figures @fig:Num2 -@fig:Num1, the optimal water and energy scheduling decisions of the WDP under three water price scenarios, with the intermediate case being the most interesting. Across all three figures, blue and red curves denote the RODP and TDP outputs, respectively, while green and yellow curves denote net electricity consumption and renewable energy production, respectively.

=== High Water Price
<high-water-price>
When the price of water was set at $pi^w = \$ 5 \/ m^3 h$, the revenue from selling desalinated water to the water utility was higher than the cost of purchasing electricity from the electric utility, therefore higher than the revenue from selling electricity, the WDP scheduled RODP water at maximum capacity by buying from the grid, consuming the TDP generated power and consuming the local renewables (Fig.@fig:Num2). Therefore, as shown in Fig.@fig:Num2, the RODP output was always set at the maximum, #emph[i.e.,~]$w_r^(*) = overline(w)_r = 8 \, 333 med m^3 h$.

The TDP was scheduled at the marginal price of the WDP, which is the sum of the grid price and the effective price of selling water, #emph[i.e.,~], after accounting for the conversion factor, resulting in an output of around 1,000 $m^3 h$. A kink in the TDP output can be seen when the plant shifted from net-consuming to net-producing, causing the marginal price to change from $f'_h pi^w + pi^(+)$ to $f'_h pi^w + pi^(-)$. The intuition of the kink can be better explained using the electricity plot on the right. The increasing renewable output replaced the need for grid purchases, which caused the net electricity consumption to drop, as can be seen in hours 7 to 13. Having higher renewables reduced the need for TDP-based power generation to feed the RODP. The plant became a power exporter during hours 11 to 15, #emph[i.e.,~]negative net electricity consumption, when the renewable power together with the reduced TDP-based power were more than enough to supply the RODP, which led to excess electricity being sold to the grid.

#figure(image("graphics/Num2.png", width: 100.0%),
  caption: [
    WDP's optimal water and electricity profiles under $pi^w = \$ 5 \/ m^3 h$.
  ]
)
<fig:Num2>

=== Low Water Price
<low-water-price>
As shown in (Fig.@fig:Num3), here, we set the price at $pi^w = \$ 0.2 \/ m^3 h$, which resulted in scheduling the RODP at the minimum $w_r^(*) = underline(w)_r = 0 med m^3 h$. The reason is that under such $pi^w$, the revenue from desalinating and selling water is less than the cost of buying the energy needed from the grid, and less than the revenue from selling electricity to the electric utility; therefore, the plant only sells water when it comes as a by-product of generating electricity, #emph[i.e.,~]from the TDP, which generated 1,093 $m^3 h$ of water and 1.093 MWh of electricity. The TDP's water and electricity generation were constant, because the marginal price of the plant was constant throughout the day as the WDP was always in the net-production zone, #emph[i.e.,~]negative net electricity consumption. All generated renewables were sold back to the grid, as such action generates more revenue for the plant than using the electricity to desalinate and sell water.

#figure(image("graphics/Num3.png", width: 100.0%),
  caption: [
    WDP's optimal water and electricity profiles under $pi^w = \$ 0.2 \/ m^3 h$.
  ]
)
<fig:Num3>

=== Intermediate Water Price
<intermediate-water-price>
When the price of water was set at $pi^w = \$ 1.5 \/ m^3 h$, the revenue from selling desalinated water became higher than the revenue from selling the electricity that can be used to desalinate water, but less than the cost of buying electricity from the grid to desalinate water. As shown by the green curve in (Fig.@fig:Num1), the WDP was either a net zero or a net electricity producer. As shown in the right panel of Fig.@fig:Num1, when the renewable output was zero, the RODP only consumed the TDP-based generated power of 5.2 MWh, #emph[i.e.,~]without consuming from the grid. In hours 7-9 and 18-19, the renewable output was fully consumed by the RODP, in addition to TDP's power output, keeping the WDP in the net-zero zone, #emph[i.e.,~]off the electric grid. When the renewable generation was higher than what the RODP can consume, e.g., hours 10-17, the excess renewable was sold as electricity to the electric grid at $pi^(-)$, causing the marginal price of the plant to shift, which subsequently resulted in scaling down the production of the TDP, due to the abundance of renewables. The WDP co-optimization in this scenario is highly dependent on the renewable generation output, with the RODP consumption becoming a follower of the TDP and renewable power generation.

#figure(image("graphics/WDP2.png", width: 100.0%),
  caption: [
    WDP's optimal water and electricity profiles under $pi^w = \$ 1.5 \/ m^3 h$.
  ]
)
<fig:Num1>

= Conclusion
<sec:conclusion>
We analyzed the optimal scheduling decisions of a profit-maximizing WDP with thermal and RO-based desalination technologies that face water and electric utilities. We showed that the WDP is optimally scheduled based on a two-threshold policy based on the renewable generation output. As the output of renewable generation increases, the WDP monotonically decreases the water flow of the TDP and increases that of the RODP. This structural result provides not only a computationally tractable solution but also valuable operational insights. Specifically, we show that when the revenue from selling desalinated water is higher than the price of selling electricity, the TDP and renewables electricity outputs are fully consumed locally by the RODP to produce and sell more water. The RODP output is always set to maximum if the revenue from selling water is higher than the cost of buying electricity. It is set to a minimum if the revenue from selling water is less than the revenue from selling electricity.

#heading(level: 1, numbering: none)[References]
<bibliography>
#block[
#block[
\[1\] A. Santhosh, A. M. Farid, and K. Youcef-Toumi, “Real-time economic dispatch for the supply side of the energy-water nexus,” #emph[Applied Energy], vol. 122, pp. 42--52, 2014.

] #label("ref-Santhosh&Farid&Toumi:14AE")
#block[
\[2\] A. Santhosh, A. M. Farid, and K. Youcef-Toumi, “The impact of storage facility capacity and ramping capabilities on the supply side economic dispatch of the energy--water nexus,” #emph[Energy], vol. 66, pp. 363--377, 2014.

] <ref-ToumiEnergy2014>
#block[
\[3\] J. Eke, A. Yusuf, A. Giwa, and A. Sodiq, “The global status of desalination: An assessment of current desalination technologies, plants and capacity,” #emph[Desalination], vol. 495, 2020.

] <ref-Eke2020>
#block[
\[4\] A. M. Ghaithan, A. Mohammed, A. Al-Hanbali, A. M. Attia, and H. Saleh, “Multi-objective optimization of a photovoltaic-wind-grid connected system to power reverse osmosis desalination plant,” #emph[Energy], vol. 251, p. 123888, 2022.

] <ref-Ghaithan2022>
#block[
\[5\] S. Schär, A. Bischi, A. Baccioli, U. Desideri, and J. Geldermann, “Optimization of sustainable seawater desalination: Modeling renewable energy integration and energy storage concepts,” #emph[Energy Conversion and Management], vol. 293, p. 117447, 2023.

] <ref-Schar2023>
#block[
\[6\] A. Qudah, A. Almerbati, and E. M. Mokheimer, “Novel approach for optimizing wind-pv hybrid system for ro desalination using differential evolution algorithm,” #emph[Energy Conversion and Management], vol. 300, p. 117949, 2024.

] <ref-Qudah2024>
#block[
\[7\] F. Moazeni, J. Khazaei, and J. P. P. Mendes, “Maximizing energy efficiency of islanded micro water-energy nexus using co-optimization of water demand and energy consumption,” #emph[Applied Energy], vol. 266, p. 114863, 2020.

] <ref-MoazeniAPEN2020>
#block[
\[8\] F. Moazeni and J. Khazaei, “Optimal operation of water-energy microgrids; a mixed integer linear programming formulation,” #emph[Journal of Cleaner Production], vol. 275, p. 122776, 2020.

] <ref-MoazeniJCP2020>
#block[
\[9\] M. Elsir, A. T. Al-Awami, M. A. Antar, K. Oikonomou, and M. Parvania, “Risk-based operation coordination of water desalination and renewable-rich power systems,” #emph[IEEE Transactions on Power Systems], vol. 38, no. 2, pp. 1162--1175, 2022.

] <ref-AlAwamiTPS2022>
#block[
\[10\] A. S. Alahmed and L. Tong, “Dynamic net metering for energy communities,” #emph[IEEE Transactions on Energy Markets, Policy and Regulation], vol. 2, no. 3, pp. 289--300, 2024, doi: #link("https://doi.org/10.1109/TEMPR.2024.3354162")[10.1109/TEMPR.2024.3354162].

] #label("ref-Alahmed&Tong:24TEMPR")
#block[
\[11\] P. Chakraborty, E. Baeyens, P. P. Khargonekar, K. Poolla, and P. Varaiya, “Analysis of solar energy aggregation under various billing mechanisms,” #emph[IEEE Transactions on Smart Grid], vol. 10, no. 4, 2019.

] #label("ref-Chakraborty&Poolla&Varaiya:19TSG")
#block[
\[12\] A. S. Alahmed, L. Tong, and Q. Zhao, “Co-optimizing distributed energy resources in linear complexity under net energy metering,” #emph[IEEE Transactions on Sustainable Energy], vol. 15, no. 4, pp. 2336--2348, 2024, doi: #link("https://doi.org/10.1109/TSTE.2024.3417249")[10.1109/TSTE.2024.3417249].

] #label("ref-Alahmed&Tong&Zhao:24TSE")
#block[
\[13\] A. S. Alahmed, A. Botterud, S. Amin, and A. T. Al-awami, “Joint scheduling of water and power in renewable-colocated desalination plants,” 2025.

] #label("ref-Alahmed&Botterud&Amin&Alawami:25WorkingPaper")
#block[
\[14\] Pecan Street Inc., “Pecan street dataset.” #link("https://www.pecanstreet.org/dataport/").

] <ref-PecanStreet>
] <refs>
