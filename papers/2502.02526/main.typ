// Adapted to Typst from arXiv:2502.02526v1 by Gavazzoni et al.
// https://arxiv.org/abs/2502.02526v1
// Original text and figures licensed CC BY 4.0: https://creativecommons.org/licenses/by/4.0/
#set page(paper: "a4", margin: 21mm)
#set text(size: 10pt, lang: "en")
#set par(justify: true)
#set heading(numbering: "1.1")
#set math.equation(numbering: "(1)")
#set table(inset: 4pt)
#title[Optimizing oil-water separation using fractal surfaces]
#align(center)[Cristina Gavazzoni, Davi Lazzari, Iara Patrícia da Silva Ramos, and Carolina Brito]
#align(center)[Instituto de Física, Universidade Federal do Rio Grande do Sul, Caixa Postal 15051, CEP 91501-970, Porto Alegre, Rio Grande do Sul, Brazil]
#align(center)[#link("mailto:carolina.brito@ufrgs.br")[#raw("carolina.brito@ufrgs.br")] · #link("mailto:iarapaty24@gmail.com")[#raw("iarapaty24@gmail.com")]]

#strong[Abstract.] Oil has become a prevalent global pollutant, stimulating the research to improve the techniques to separate oil from water. Materials with special wetting properties---primarily those that repel water while attracting oil---have been proposed as suitable candidates for this task. However, one limitation in developing efficient substrates is the limited available volume for oil absorption. In this study we investigate the efficacy of disordered fractal materials in addressing this challenge, leveraging their unique wetting properties. Using a combination of a continuous model and Monte Carlo simulations, we characterize the hydrophobicity and oleophilicity of substrates created through ballistic deposition (BD). Our results demonstrate that these materials exhibit high contact angles for water, confirming their hydrophobic nature, while allowing significant oil penetration, indicative of oleophilic behavior. The available free volume within the substrates vary from 60% to 90% of the total volume of the substrate depending on some parameters of the BD. By combining their water and oil wetting properties with a high availability of volume, the fractal substrates analyzed in this work achieve an efficiency in separating oil from water of nearly 98%, which is significantly higher compared to a micro-pillared surfaces made from the same material but lacking a fractal design.

= Introduction
<introduction>
Oil has become the a common pollutant in the world mostly due to oil spill accidents and industry oily wastewater\[1\], \[2\] which has lead to an increase concern in studying effective water-oil separation techniques \[3\].

The ideal approach for the separation depends on the diameter of the oil droplets contained in water. For stratified oil ($d > 20 mu$m) gravity separation followed by skimming is considered an efficient, low cost, primary step in water treatment \[4\], \[5\]. For emulsion ($d < 20 mu$m), on the other hand, these approaches are not effective and follow up steps in treatment, such as chemical emulsification \[6\], centrifugation \[7\], \[8\], heat treatment\[9\] and membrane filtration \[10\], \[11\] are often required. These approaches often have high energy and operating costs, limited efficiency and can cause secondary pollution\[2\], \[12\], complicating the cleanup efforts.

In recent years, several materials with specific water and oil wetabilities have been developed for the separation, specially fibrous materials due their connectivity, mechanical flexibility, large specific surface area, and ease of shape manipulation \[13\]. These materials fall into two categories: oil-removing materials \[14\], \[15\], \[16\], \[17\], which exhibit superhydrophobic/superoleophilic behavior, and water-removing materials \[10\], \[18\], which display superhydrophilic/superoleophobic behavior. Developing water-removing materials is more challenging because most oleophobic materials are also hydrophobic \[19\], \[20\]. As a result, oil-removing materials are more commonly used.

Despite the considerable progress in fabricating such materials, there is still a lack of studies focused on the underlying mechanisms of water-oil separation \[21\]. Thus, more fundamental research is needed to drive further advancements in this field.

In a recent study \[22\], we explored two distinct types of substrates to assess how they influence the effectiveness of separating water from oil. Regarding water, it was shown that if a surface repels a droplet of pure water, it will behave similarly when a mixture of oil and water is placed on the same material. In other words, the water's behavior is entirely determined by the surface's hydrophobicity. For oil, however, two factors hinder absorption: the formation of an oil film around the water to minimize the water-gas interface, and the limited available volume for oil absorption, a characteristic of the material from which the substrate is made.

With that in mind, fractal materials present a promising alternative for optimizing water-oil separation. They have been shown to be superhydrophobic \[23\], \[24\], \[25\], \[26\] and offer increased available volume compared to non-fractal materials.

In this study, we explore two types of disordered fractal materials created through ballistic deposition and discuss their application in water-oil separation. Ballistic deposition involves the random arrival of particles onto a substrate, resulting in a structure that typically features interconnected voids, akin to a porous medium, which provides a high volume availability for oil absorption. Additionally, this generation method yields a very rough substrate, which affects its wetting properties. To characterize these materials, we first examine their wetting characteristics using an energy continuous model, which predicts distinct wetting behavior for both liquids: the substrates exhibit hydrophobic and oleophilic properties. This prediction is validated by Monte Carlo simulations. We also show that these substrates possess a significant amount of available volume for oil absorption due to their porosity. Subsequently, we employ Monte Carlo simulations to evaluate the separation efficiency and the underlying mechanisms influencing this process.

This work is organized as follows: in section @sec_disordered it is described the disordered fractal surfaces that will be used throughout the work and the procedure to generate them, in @sec_model the theoretical continuous model and in @sec_potts the computational details of the Monte Carlo cellular Potts model. Section @sec_results presents and discuss the results in terms of efficiency to separate oil and water in those surfaces. In supplementary material (SM), section I we briefly discuss the wetting properties of one example of ordered fractals. Finally, in section @sec_conclusion we present our conclusions.

= Methodology
<sec_method>
Because fractal materials maximize interfacial areas while maintaining a finite volume, they offer a promising alternative for water-oil separation. This property often results in high hydrophobicity and an increased capacity for storing substances, such as oil, compared to non-fractal materials.

Fractal materials can be ordered or disordered. Ordered fractal materials have the advantage of been more easily reproduced and easier to treat analytically. A particular case of ordered material, consisting in a hierarchical pillared surface, was recently studied by Ramos #emph[et. al.]\[26\], and it was shown that they present an enhancement of the contact angle when compared to the non fractal version. Despite of that, two issues arise when considering this substrate for water-oil separation: the gain in volume is minimal when the hierarquical level is increased and, depending on the geometric parameters, it may destroy the hydrophobicity of the surface (see Section SM for details). From here, we will focus on the case of disordered fractals, as explained in the following section.

== Disordered fractal materials: Ballistic Deposition surfaces
<sec_disordered>
A simple model to build disordered fractal materials is the Ballistic Deposition (BD), originally introduced to study colloidal aggregates in the context of available percentage volume~\[27\], \[28\].

#figure(image("graphics/BD_ex.png"),
  caption: [
    Scheme of first and second neighbors ballistic deposition. a) illustrates the first neighbor sticking rule. Above is shown schematically the sticking rule and below is shown the result after some deposition time. b) illustrates the second neighbor sticking rule. Above is shown schematically how this deposition occurs and below is shown the result after some deposition time.
  ]
)
<fig_frac_BD>

In this model, a particle is release from a random position in the x-y plane above the surface. The particle falls in a straight line until it reaches the surface where it sticks, and different sticking rules leads to different materials. Here we use the following two rules: the particles sticks to the first site along its trajectory that have an occupied first neighbor site (refereed as 1Nb) or second neighbor site (refereed as 2Nb). The resulting materials consist of a series of irregularly interconnected vacant spaces that can be regarded as a single irregular continuous porous structure.

Figure @fig_frac_BD shows two examples of sticking rules where the substrate has only one horizontal dimension $L$ and the vertical axis where the particles are deposited. However, in this work we study the three-dimensional surfaces with a base of size $L times L$ and the vertical dimension for particle deposition. The mean height of the surface $macron(h)$ increases linearly as we increase the deposition time $h_0$\[29\], defined as $h_0 = N \/ L^2$, where $N$ is the total number of blocks deposed. For the materials considered in this work, the porosity of the substrate is defined as the available free volume per unit volume of material \[30\], as illustrated in Figure~@vol_BD. Clearly, different sticking rules change surface's porosity (and $macron(h)$), leading to different amount of vacant volume inside the surface.

== Continuous model
<sec_model>
The wetting properties of a surface depend not only on its geometry and porosity, but also on its chemistry and the type of liquid interacting with it. To characterize the wetting behavior of the surface, we use a theoretical continuous model to determine the energies involved in creating interfaces when a droplet is placed on top of it. This model treats the droplet as comprising two components: a spherical cap above the surface and a cylindrical volume that penetrates the surface to a defined depth.

It is assumed a droplet with fixed volume $v_0 = 4 / 3 pi R_0^3$, with base radius $B$, cap height $H$ (identified in Figure @fig_schema), and radius $R$. The droplet can lie in several wetting states, depending on the contact angle $theta_c$ and the penetrating depth $d$, where $d$ defines how much volume leaves the spherical cap and homogeneously wets the surface. The penetrating depth will depend on a surface height's percentile relation $d = d \( P e r c \)$, detailed in SM.

The global energy associated with these states is given by $E_(t o t) \( d \) = Delta E \( d \) + E_g$, where $E_g$ is the gravitational energy and is small in comparison to $Delta E \( d \)$ \[31\]. The $Delta E \( d \)$ represents the difference in interfacial energies between pairs of interaction (solid-liquid, solid-gas and liquid-gas) phases before and after placing the droplet on the surface and is given by:

$ Delta E \( d \) = A_(S L) \( d \) \( sigma_(S L) - sigma_(S G) \) + \( S_(c a p) + A_(L G)^(upright(u n d e r)) \) sigma_(L G) \, . $ <eq_energia>

where $sigma_(S L)$, $sigma_(S G)$ and $sigma_(L G)$ are the corresponding surface tensions for solid-liquid, solid-gas and liquid-gas interactions, $A_(S L)$ is the contact area between solid and liquid phases, $A_(L G)^(upright(u n d e r))$ is the liquid-gas area underneath the cylinder and $S_(c a p)$ is the area of the spherical cap. All the contact areas in Eq.~@eq_energia depend on the topology of the surface and the penetrating depth $d \( P e r c \)$. Figure @fig_schema\(b) shows a representation of these areas for the disordered fractal material considered in this work.

#figure(image("graphics/schema.png"),
  caption: [
    Schema of a droplet deposited in a surface: a) defines the height of the droplet $H$, its base radius $B$, the contact angle $theta_c$, the penetration depth $d$, the area of the cap $S_(c a p)$ and the liquid-gas contact area underneath the penetrated cylinder $A_(L G)^(u n d e r)$\; b) highlights the liquid-gas and solid-gas contact area, resp. $A_(L G)^(u n d e r)$ and $A_(S L)$, in a cross-section of the disordered fractal surfaces.
  ]
)
<fig_schema>

For disordered surfaces, the contact areas between the surface and the deposited liquid ($A_(S L)$) are challenging to calculate analytically. We address this issue numerically by dividing the surface into pixels and summing the areas where the liquid makes contact with the substrate's pixels. The model considers the energies for a droplet that homogeneously penetrate the surface until some specific depth $d$, accounting all the contact area inside the cylinder volume, plus the cap area that is approximated by a semi-sphere $S_(c a p) \( theta_c \) = 2 pi R^2 \( 1 - cos \( theta_c \) \)$ for some contact angle $theta_c$ and the energy is calculated by Eq. @eq_energia. Details about this model are discussed in the SM.

== 4-spins Cellular Potts model
<sec_potts>
Several numerical approaches are used to study hydrophobic surfaces, including molecular dynamics (MD)\[32\], \[33\], lattice Boltzmann methods~\[34\], \[35\], and the surface evolver~\[36\], \[37\], \[38\]. However, these methods are computationally expensive when applied to mesoscopic systems, which are more suitable for comparison with experimental results. In this context, Monte Carlo (MC) simulations using the cellular Potts model allow for the simulation of larger droplet sizes and are commonly employed to investigate wetting phenomena on textured surfaces~\[22\], \[31\], \[39\], \[40\], \[41\].\"

Here we consider a simple cubic lattice in which each state represents one of the components: gas, water, oil, or solid. The Hamiltonian is given by:

$ H = 1 / 2 sum_(chevron.l upright(i) \, upright(j) chevron.r) E_(s_(upright(i)) \, s_(upright(j))) \( 1 - delta_(s_(upright(i)) \, s_(upright(j))) \) + alpha_w (sum_(upright(i)) delta_(s_(upright(i)) \, 1) - V_T^w)^2 + alpha_o (sum_(upright(i)) delta_(s_(upright(i)) \, 2) - V_T^o)^2 + g sum_(upright(i)) \( m_(upright(i)) h_(upright(i)) delta_(s_i \, 1) + m_(upright(i)) h_(upright(i)) delta_(s_(upright(i)) \, 2) \) . $ <hamil>

where the spin $s_i in { 0 \, 1 \, 2 \, 3 }$ represent gas, water, oil and solid states, respectively. The first term in Eq. @hamil represents the energy related to the presence of interfaces between sites of different types. The summation ranges over pairs of neighbors which comprise the 3D Moore neighborhood in the simple cubic lattice (26 sites, excluding the central one), $E_(s_i \, s_j)$ is the interaction energies of sites $s_i$ and $s_j$ of different states at interfaces and $delta_(s_i \, s_j)$ is the Kronecker delta.

In the second and third terms in Eq. @hamil, $V_T^w$ and $V_T^o$ are the target water and oil volumes, respectively, the summations are the water and oil volume and the parameters $alpha_w$ and $alpha_o$ mimics the liquids compressibility. Thus, these terms maintain the liquids volumes and the desired composition of the droplet constant during the simulation. The last term is the gravitational energy, where $g = 10 m \/ s^2$ is the acceleration of gravity and $m_i$ is the mass of the site. In both the volumetric and gravitational terms, only sites with liquid, $s_i = 1$ or $s_i = 2$, contribute.

#figure(image("graphics/ex_CI_simu.jpg"),
  caption: [
    Example of an initial configuration used in simulations of the Monte Carlo Potts Model.
  ]
)
<ex_CI_simu>

In our simulations the length scale is such that one lattice spacing corresponds to 1 $mu$m and the surface tensions values (shown in Table @surface_tention) are divided by 26, which is the number of neighbors that contributes to the first summation of our Hamiltonian. Therefore, the interfacial interaction energies $E_(s_i \, s_j) = A sigma_(s_i s_j)$, with $A = 1 mu$m$""^2$ are given by $E_(0 \, 1) = 2.70 times 10^(- 9) mu$J, $E_(0 \, 2) = 1.04 times 10^(- 9) mu$J, $E_(0 \, 3) = 0.96 times 10^(- 9) mu$J, $E_(1 \, 2) = 2.06 times 10^(- 9) mu$J, $E_(1 \, 3) = 1.93 times 10^(- 9) mu$J and $E_(2 \, 3) = 0.33 times 10^(- 9) mu$J. The mass existent in a unit cube is $m^w = 10^(- 15)$kg for water and $m^o = 0.77 times 10^(- 15)$kg for oil. We fix $alpha_w = alpha_o = 0.01 times 10^(- 9) mu$J/($mu$m$\)^6$ (these values were chosen to minimize the volume fluctuation while keeping an a suitable acceptation ratio~\[22\]).

#figure(
  align(center)[#table(
    columns: 4,
    align: (center,center,center,center,),
    table.header([], [Water], [Solid], [Gas],),
    table.hline(),
    [Oil], [$sigma_(upright(W O)) =$ 53.5], [$sigma_(upright(S O)) =$ 8.6], [$sigma_(upright(G O)) =$27],
    [Water], [---], [$sigma_(upright(S W)) =$50.2], [$sigma_(upright(G W)) =$70],
    [Solid], [---], [---], [$sigma_(upright(S G)) =$ 25],
  )]
  , caption: [Surface tensions used in this work in units of mN/m. These values were obtained for $T = 25^o$C.]
  , kind: table
  ) <surface_tention>
The total run of a simulation is $5 times 10^5$ Monte Carlo steps (MCS), from which the last $2.5 times 10^5$ MCS are used to measure observables of interest. Each MCS is composed by $V^T = V^w + V^o$ number of trial spin flips, where $V^T$ is the volume of the liquid droplet which is composed by a volume of oil $V^o$ and of water $V^w$. A spin flip is accepted with probability $upright("min") { 1 \, upright("exp") \( - beta Delta H \) }$, where $beta = 1 \/ T$. In the cellular Potts model $T$ acts as noise to allow the phase space to be explored. In our simulations, a value of $T = 9$ was used, which allows an acceptance rate of approximately $15 %$ while keeping both water and oil in a liquid state.

The initial wetting state is created using a hemisphere with initial volume $V^T approx V_0 = 4 \/ 3 thin pi R_0^3$, due to the discreteness of the lattice. The droplet has $R_0 = 50 mu$m in a cubic box with $L = 240 mu m$ or $L = 300 mu m$ depending on the surface height. A mixture of oil and water was used. The composition of the droplet is defined by the oil fraction $f_o$, thus, $V^o = f_o V^T$ is the oil volume, by reciprocity, one can also define the water volume $V^w = f_w V^T$, where $f_w = 1 - f_o$ is the water fraction. Oil and water sites are randomly distributed in the droplet. In this work 10 distinct surfaces were used for each case studied and all the observable presented here are averages over this surfaces. Figure @ex_CI_simu shows an example of the initial configurations used.

= Results and Discussion
<sec_results>
In this section we present the geometric and wetting properties of the fractal substrates and then explore its efficiency in separating oil and water.

#emph[Available volume for oil absorption.]~ An important factor in oil-water separation is the available free volume within the surface, as it provides capacity for storing the oil mixed with the water~\[22\]. The available volume, defined as the free volume per unit volume of material, was measured as a function of deposition time $h_0$ for both sticking rules, as shown in Figure @vol_BD. The results indicate that in both cases, the available volume increases with $h_0$ until it reaches a plateau. Surfaces created using the second neighbors rule (2Nb) achieve nearly 90% available volume, while surfaces obtained by the first neighbors rule (1Nb) reach 60%.

#figure(image("graphics/volumes.png"),
  caption: [
    #strong[Fraction of available volume for Ballistic Depositions] for 1st neighbors (1Nb) and 2nd neighbors (2Nb) sticking rule.
  ]
)
<vol_BD>

#emph[Wetting properties of the substrates.~] Figure~@fig_water_BD summarizes the wetting properties of the substrates for different deposition times $h_0$ based on the continuous model and Potts simulations. When a droplet of pure water is placed on the substrates, both methods yield very high contact angles $theta_C$ ---shown as crosses with purple shading for the continuous model and circles with green shading for the Potts model--- indicating that the substrates are hydrophobic.

In contrast, pure oil deposition in the continuous model occurs at the minimum allowed angle (approximately $5^compose$), with oil penetrating the substrates. This oleophilic behavior is corroborated by Potts simulations, which, although unable to define an angle due to extreme wetting, demonstrate nearly 100% oil penetration within the surface.

Overall, both methods consistently indicate that the two types of substrates are hydrophobic and oleophilic, which, combined with the high available volume, is crucial for effective oil-water separation. Their efficiency in promoting this separation are now tested.

#figure(image("graphics/final_angles.png"),
  caption: [
    #strong[Contact angles for water and oil deposed on surfaces of 1st and 2nd neighbors:] Simulated and continuous contact angles as a function of deposition time $h_0$ for the pure water droplet for 1NB (left) and 2Nb (right) sticking rules. The insets show a cross section of the simulated final wetting state for oil (in orange) and water (in blue), and the theoretical continuous final state (in a red line) for water.
  ]
)
<fig_water_BD>

#emph[Efficiency of substrates in separating oil from water.~] To test their efficiency we performed MC simulations for the mix droplet varying the oil concentration for different deposition times. For this purpose we evaluate the composition of the repelled and absorbed phases and the separation efficiency. The first two quantities were analyzed by measuring the percentage of oil and water that remains above, $upsilon_(a b)^l$, and bellow $upsilon_b^l$, the surface

$ upsilon_(a b)^l = V_(a b)^l \/ V^l . $ <eq_v_ab>

$ upsilon_b^l = V_b^l \/ V^l . $ <eq_v_b>

where the superscription $l$ refers to water, $w$, or oil, $o$, and $V^l$ is the total volume of each liquid in the system, such that $upsilon_b^l + upsilon_(a b)^l = 1$. The efficiency is defined by

$ epsilon.alt = frac(upsilon_b^o + \( 1 - upsilon_b^w \), 2) . $ <eq_efficiency>

The above definition captures both key elements in oil-water separation: the ability to absorb oil and repel water. These quantities (Eqs. @eq_v_ab, @eq_v_b and @eq_efficiency) were obtained as functions of oil fraction $f_O$ for two distinct deposition times, $h_0 = 5$ and $h_0 = 10$, for both sticking rules.

Fig. @mix_BD summarizes our findings on oil-water separation. In all cases the majority of water remains above the surface ($upsilon_(a b)^w arrow.r 1$ and $upsilon_b^w arrow.r 0$) while the majority of oil is absorbed ($upsilon_(a b)^o arrow.r 0$ and $upsilon_b^o arrow.r 1$). However, as the oil fraction $f_o$ is increased, we observe an increase of oil remaining above the surface due to saturation of the surface (Fig. @mix_BD (a,b)). Since 1Nb surfaces have lower available volume, this effect is more pronounced for these surfaces and lower deposition times.

#figure(image("graphics/dados_simu_alterado.png"),
  caption: [
    #strong[Fractions of volume above and below the surface, and oil-water separation efficiency:] percentage of water and oil above the surface for (a) Nb1 and (b) Nb2, percentage of water and oil absorbed by the surface for (c) Nb1 and (d) Nb2 and efficiency for (e) Nb1 and (f) Nb2 as functions of the oil fraction. Insets show the final oil-water separation state obtained by the 4-spin Potts simulation.
  ]
)
<mix_BD>

The percentage of oil that penetrates the surface also increases with the oil fraction (Fig @mix_BD (c,d)). A previous study showed that a film of oil is formed around the water droplet in order to minimize the water-gas interface that is energetic more expensive \[22\]. The lower the oil fraction, more relevant this oil film is to the percentage of absorbed oil. Interestingly, this effect is more pronounced for 2Nb sticking rule and can be explained by the oleophilicity of these surfaces. The energy associated to a column of oil penetrating the surface is $Delta E approx \( sigma_(upright(S O)) - sigma_(upright(S G)) \) f_s$, where $f_s$ is the solid fraction of the surface. Since the solid fraction is bigger for 1Nb surfaces and $sigma_(upright(S G)) > sigma_(upright(S O))$, the energy involved in this process is smaller for 1Nb then for 2Nb surfaces, what make 1Nb surfaces more oleophilic than the 2Nb ones.

These behaviors result in efficiencies $epsilon.alt$ shown in Fig. @mix_BD (e,f). For both sticking rules the efficiency increases as $f_o$ grows, until it reaches a maximum of approximately 98$%$ and decreases again for higher oil fraction values. This decrease can be explained partially due to the saturation of the surface and partially by the MC that allows for some water sites to appear under the surface. This later effect being more relevant as the amount of water in the droplet is decreased.

For 1Nb surfaces the maximum value of efficiency is reached for very low values of $f_o$ and it remains approximately as a plateau until it decreases for $f_o = 0.90$. For 2Nb surfaces the maximum efficiency occurs only for $f_o = 0.50 - 0.60$ due to the lower oleophilicity discussed above.

Therefore, the gain in available volume obtained trough the 2Nb sticking rule is achieved by losing some solid contact areas resulting in a less oleophilic surface. This loss facilitates other phenomenon, less advantageous for water-oil separation, such as the oil film around the water droplet above the surface.

Fig. @mix_BD (e,f) also compares the efficiency $epsilon.alt$ of a pillared substrate (shown in purple), as studied in \[22\]. While the pillared substrate shares the same chemical properties as the fractal surfaces analyzed in this work and has been shown to be hydrophobic and oleophilic, its non-fractal nature results in lower efficiency for oil-water separation across all values of $f_o$.

Some experimental works also show very high efficiency in the oil-water separation, as for example in Refs\[42\], \[43\], \[44\], \[45\]. The comparison with the experimental works is however tricky because of the difference in the definitions of the efficiencies, which usually only takes into account the purity of the retained water or the oil that passes. Moreover, most of the experimental studies are made with oil droplets that are big enough to react the gravity.

= Conclusions
<sec_conclusion>
This work shows that fractal surfaces with a high level of porosity, more specifically fractal surfaces grown through Ballistic Deposition (BD) process , are good candidates to serve as oil-water separation surfaces. We employed a continuous theoretical model designed for disordered surfaces and a 4-spin Potts model simulation to show that these BD-produced surfaces exhibit distinct wetting properties for each liquid, being hydrophobic and oleophilic. Additionally, their substantial free space addresses the oil saturation issue discussed in \[22\].

We evaluated the oil-water separation efficiency across different deposition times ($h_0$) and oil fractions. Our simulations indicate that efficiency ($epsilon.alt$) can reach 98% under certain parameter ranges, significantly surpassing that of non-fractal substrates made from similar materials.

We investigated two types of fractal substrates generated using different stick rules in the BD process, resulting in varying available volumes to absorb oil. Notably, the substrate with greater volume exhibited slightly lower efficiency in separating oil from water. This was attributed to its reduced oleophilicity, as it has fewer contact areas between the solid and liquid.

A key limitation of this work is that the substrates behave like sponges for oil, requiring removal for potential reuse. However, we hypothesize that these surfaces could function as membranes for separating oil from water, particularly in situations where the oil quantity is substantial enough to be influenced by gravity. The possibility and efficiency of the utilization of a substrate as a membrane and a sponge was previously studied in Ref. \[46\]. Similarly, passing the oil-water mixture through the membrane studied here multiple times could enhance separation efficiency .

= Supplementary material
<supplementary-material>
See supplementary material for a brief discussion on ordered fractals and a detailed description of the continuous model for disordered fractals.

#heading(level: 1, numbering: none)[Acknowledgments]
<acknowledgments>
We thank the Brazilian agency CAPES and CNPq for the financial support.

#heading(level: 1, numbering: none)[Data Availability Statement]
<data-availability-statement>
The data that supports the findings of this study are available within the article and its supplementary material.

#heading(level: 1, numbering: none)[Author Contributions]
<author-contributions>
C.G. and C.B. designed research. C.G., D.L., I.P.S.R. and C.B performed research, contributed new reagents/analytic tools, analyzed data, and wrote the paper.

#heading(level: 1, numbering: none)[Conflict of Interest Statement]
<conflict-of-interest-statement>
The authors have no conflicts to disclose.

#heading(level: 1, numbering: none)[References]
<bibliography>
#block[
#block[
\[1\] Y. J. Chan, M. F. Chong, C. L. Law, and D. G. Hassell, “A review on anaerobic--aerobic treatment of industrial and municipal wastewater,” #emph[Chemical Engineering Journal], vol. 155, no. 1--2, pp. 1--18, 2009.

] <ref-chan09>
#block[
\[2\] M. Padaki #emph[et al.], “Membrane technology enhancement in oil--water separation. A review,” #emph[Desalination], vol. 357, pp. 197--207, 2015.

] <ref-pa15>
#block[
\[3\] Z. Xue, Y. Cao, N. Liu, L. Feng, and L. Jiang, “Special wettable materials for oil/water separation,” #emph[Journal of Materials Chemistry A], vol. 2, no. 8, pp. 2445--2460, 2014.

] <ref-xue14>
#block[
\[4\] M. Cheryan and N. Rajagopalan, “Membrane processing of oily streams. Wastewater treatment and waste reduction,” #emph[Journal of membrane science], vol. 151, no. 1, pp. 13--28, 1998.

] <ref-cher98>
#block[
\[5\] J. A. Zeevalkink and J. J. Brunsmann, “Oil removal from water in parallel plate gravity-type separators,” #emph[Water research], vol. 17, no. 4, pp. 365--373, 1983.

] <ref-zee83>
#block[
\[6\] D. Sun, X. Duan, W. Li, and D. Zhou, “Demulsification of water-in-oil emulsion by using porous glass membrane,” #emph[Journal of membrane science], vol. 146, no. 1, pp. 65--72, 1998.

] <ref-sun98>
#block[
\[7\] A. Cambiella, J. M. Benito, C. Pazos, and J. Coca, “Centrifugal separation efficiency in the treatment of waste emulsified oils,” #emph[Chemical Engineering Research and Design], vol. 84, no. 1, pp. 69--76, 2006.

] <ref-cam06>
#block[
\[8\] M. E. Comba and K. L. E. Kaiser, “Suspended particulate concentrations in the st. Lawrence river (1985--1987) determined by centrifugation and filtration,” #emph[Science of The Total Environment], vol. 97, pp. 191--206, 1990.

] <ref-com90>
#block[
\[9\] T. Strøm-Kristiansen, A. Lewis, P. S. Daling, and A. B. Nordvik, “Heat and chemical treatment of mechanically recovered w/o emulsions,” #emph[Spill Science & Technology Bulletin], vol. 2, no. 2--3, pp. 133--141, 1995.

] <ref-strom95>
#block[
\[10\] A. K. Kota, G. Kwon, W. Choi, J. M. Mabry, and A. Tuteja, “Hygro-responsive membranes for effective oil-water separation,” #emph[Nature communications], vol. 3, no. 1, pp. 1--8, 2012.

] <ref-kota12>
#block[
\[11\] Y. Yang #emph[et al.], “Large-area graphene-nanomesh/carbon-nanotube hybrid membranes for ionic and molecular nanofiltration,” #emph[Science], vol. 364, no. 6445, pp. 1057--1062, 2019.

] <ref-yang2019large>
#block[
\[12\] O. Duman, C. Cengiz, C. Ö. Diker, U. Cengiz, S. M. Güreşir, and S. Tunç, “Effect of alkoxysilane chain length on the surface, stability, sorption and oil--water separation properties of novel superhydrophobic porous sorbent materials produced using innovative drainage technique in scCO2 atmosphere,” #emph[Separation and Purification Technology], vol. 345, p. 127354, 2024.

] <ref-duman2024effect>
#block[
\[13\] Y. Guo, Z. Guo, and W. Liu, “Bionic multifunctional fibrous materials for efficient oil/water separation,” #emph[Droplet], vol. 2, no. 3, p. e75, 2023.

] <ref-guo2023bionic>
#block[
\[14\] L. Feng #emph[et al.], “A super-hydrophobic and super-oleophilic coating mesh film for the separation of oil and water,” #emph[Angewandte Chemie International Edition], vol. 43, no. 15, pp. 2012--2014, 2004.

] <ref-feng04>
#block[
\[15\] X. Gui #emph[et al.], “Carbon nanotube sponges,” #emph[Advanced materials], vol. 22, no. 5, pp. 617--621, 2010.

] <ref-gui10>
#block[
\[16\] B. Cortese, D. Caschera, F. Federici, G. M. Ingo, and G. Gigli, “Superhydrophobic fabrics for oil-water separation through a diamond like carbon (DLC) coating,” #emph[Journal of Materials Chemistry A], vol. 2, no. 19, pp. 6781--6789, 2014.

] <ref-cortese14>
#block[
\[17\] Y. Zhan #emph[et al.], “Robust super-hydrophobic/super-oleophilic sandwich-like UIO-66-F4\@ rGO composites for efficient and multitasking oil/water separation applications,” #emph[Journal of hazardous materials], vol. 388, p. 121752, 2020.

] <ref-zhan20>
#block[
\[18\] J. Yang, Z. Zhang, X. Xu, X. Zhu, X. Men, and X. Zhou, “Superhydrophilic--superoleophobic coatings,” #emph[Journal of Materials Chemistry], vol. 22, no. 7, pp. 2834--2837, 2012.

] <ref-yang12>
#block[
\[19\] A. Tuteja #emph[et al.], “Designing superoleophobic surfaces,” #emph[Science], vol. 318, no. 5856, pp. 1618--1622, 2007.

] <ref-tuteja07>
#block[
\[20\] A. Ahuja #emph[et al.], “Nanonails: A simple geometrical approach to electrically tunable superlyophobic surfaces,” #emph[Langmuir], vol. 24, no. 1, pp. 9--14, 2008.

] <ref-ahuja08>
#block[
\[21\] C. Chen, D. Weng, A. Mahmood, S. Chen, and J. Wang, “Separation mechanism and construction of surfaces with special wettability for oil/water separation,” #emph[ACS applied materials & interfaces], vol. 11, no. 11, pp. 11006--11027, 2019.

] <ref-chen19>
#block[
\[22\] C. Gavazzoni, M. Silvestrini, and C. Brito, “Modeling oil-water separation with controlled wetting properties,” #emph[The Journal of Chemical Physics], vol. 154, no. 10, p. 104704, 2021.

] <ref-gava2021>
#block[
\[23\] T. Onda, S. Shibuichi, N. Satoh, and K. Tsujii, “Super-water-repellent fractal surfaces,” #emph[Langmuir], vol. 12, no. 9, pp. 2125--2127, 1996.

] <ref-Onda1996>
#block[
\[24\] A. Synytska, L. Ionov, K. Grundke, and M. Stamm, “Wetting on fractal superhydrophobic surfaces from ‘core- shell' particles: A comparison of theory and experiment,” #emph[Langmuir], vol. 25, no. 5, pp. 3132--3136, 2009.

] <ref-synytska2009wetting>
#block[
\[25\] M. Gao, D. P. Wang, Y. F. Huang, S. Meng, and W. H. Wang, “Tunable hydrophobicity on fractal and micro-nanoscale hierarchical fracture surface of metallic glasses,” #emph[Materials & Design], vol. 95, pp. 612--617, 2016.

] <ref-gao2016tunable>
#block[
\[26\] I. Patrı́cia da Silva Ramos, C. Gavazzoni, D. Lazzari, and C. Brito, “Hierarchical structured surfaces enhance the contact angle of the hydrophobic (meta-stable) state,” #emph[The Journal of Chemical Physics], vol. 158, no. 15, 2023.

] <ref-iara2023>
#block[
\[27\] M. J. Vold, “A numerical approach to the problem of sediment volume,” #emph[Journal of colloid science], vol. 14, no. 2, pp. 168--174, 1959.

] <ref-vold1959numerical>
#block[
\[28\] M. J. Vold, “Sediment volume and structure in dispersions of anisometric particles,” #emph[The Journal of Physical Chemistry], vol. 63, no. 10, pp. 1608--1612, 1959.

] <ref-vold1959sediment>
#block[
\[29\] A.-L. Barabási and H. E. Stanley, #emph[Fractal concepts in surface growth]. Cambridge university press, 1995.

] <ref-fractalgrowthlivro1995>
#block[
\[30\] J. Bear, #emph[Dynamics of fluids in porous media]. Courier Corporation, 2013.

] <ref-bear2013dynamics>
#block[
\[31\] H. C. M. Fernandes, M. H. Vainstein, and C. Brito, “Modeling of droplet evaporation on superhydrophobic surfaces,” #emph[Langmuir], vol. 31, no. 27, pp. 7652--7659, 2015.

] <ref-fernandes2015>
#block[
\[32\] T. Koishi, K. Yasuoka, S. Fujikawa, and X. C. Zeng, “Measurement of contact-angle hysteresis for droplets on nanopillared surface and in the cassie and wenzel states: A molecular dynamics simulation study,” #emph[ACS Nano], vol. 5, no. 9, pp. 6834--6842, 2011.

] <ref-Koishi2011>
#block[
\[33\] H. Wu, A. Borhan, and K. A. Fichthorn, “Coarse-grained interaction of a fluid with a physically-patterned solid surface: Application to nanodroplet wetting,” #emph[J. Low Temp. Phys.], vol. 157, pp. 277--295, 2009.

] <ref-Wu2009>
#block[
\[34\] A. Dupuis and J. M. Yeomans, “#link("https://www.ncbi.nlm.nih.gov/pubmed/15752062")[Modeling droplets on superhydrophobic surfaces: equilibrium states and transitions],” #emph[Langmuir], vol. 21, no. 6, pp. 2624--2629, 2005.

] <ref-Dupuis2005>
#block[
\[35\] M. Sbragaglia #emph[et al.], “#link("https://www.ncbi.nlm.nih.gov/pubmed/17995188")[Spontaneous breakdown of superhydrophobicity],” #emph[Phys. Rev. Lett.], vol. 99, no. October, p. 156001, 2007.

] <ref-Sbragaglia2007>
#block[
\[36\] K. A. Brakke, “The surface evolver,” #emph[Experimental mathematics], vol. 1, no. 2, pp. 141--165, 1992.

] <ref-brakke1992surface>
#block[
\[37\] S. Peng, B.-E. Pinchasik, H. Hao, H. Möhwald, and X. Zhang, “Morphological transformation of surface femtodroplets upon dissolution,” #emph[The Journal of Physical Chemistry Letters], vol. 8, no. 3, pp. 584--590, 2017.

] <ref-peng2017morphological>
#block[
\[38\] C. Xu, Z. Lu, and L. Li, “Surface evolver simulation of droplet wetting morphologies on fiber without gravity,” #emph[Frontiers in Energy Research], vol. 9, p. 988, 2022.

] <ref-xu2022surface>
#block[
\[39\] D. M. Lopes, L. R. de Oliveira, S. M. M. Ramos, and J. C. M. Mombach, “Cassie-Baxter to Wenzel state wetting transition: a 2D numerical simulation,” #emph[RSC Adv.], vol. 3, pp. 24530--24534, 2013.

] <ref-Lopes2013>
#block[
\[40\] L. R. de Oliveira, D. M. Lopes, S. M. M. Ramos, and J. C. M. Mombach, “Two-dimensional modeling of the superhydrophobic behavior of a liquid droplet sliding down a ramp of pillars,” #emph[Soft Matter], vol. 7, pp. 3763--3765, 2011.

] <ref-Oliveira2011>
#block[
\[41\] V. Mortazavi, R. M. D'Souza, and M. Nosonovsky, “Study of contact angle hysteresis using the cellular Potts model,” #emph[Phys. Chem. Chem. Phys.], vol. 15, pp. 2749--2756, 2013.

] <ref-Mortazavi2013>
#block[
\[42\] J. Gu #emph[et al.], “Robust preparation of superhydrophobic polymer/carbon nanotube hybrid membranes for highly effective removal of oils and separation of water-in-oil emulsions,” #emph[Journal of Materials Chemistry A], vol. 2, no. 37, pp. 15268--15272, 2014.

] <ref-gu2014robust>
#block[
\[43\] A. K. Singh and J. k. Singh, “Fabrication of zirconia based durable superhydrophobic--superoleophilic fabrics using non fluorinated materials for oil--water separation and water purification,” #emph[RSC advances], vol. 6, no. 105, pp. 103632--103640, 2016.

] <ref-singh2016fabrication>
#block[
\[44\] Z. Wang #emph[et al.], “A novel 3D porous modified material with cage-like structure: Fabrication and its demulsification effect for efficient oil/water separation,” #emph[Journal of Materials Chemistry A], vol. 5, no. 12, pp. 5895--5904, 2017.

] <ref-wang2017novel>
#block[
\[45\] M. Su #emph[et al.], “A rubber-like, underwater superoleophobic hydrogel for efficient oil/water separation,” #emph[Chemical Engineering Journal], vol. 361, pp. 364--372, 2019.

] <ref-su2019rubber>
#block[
\[46\] J. Zhou, Z. Zhang, X. Li, and B. Yang, “Bio-inspired, biodegradable, and fluffy 3D PLA fibrous sponges with dynamic fractal nano-sweepers for on-demand oil/water separation,” #emph[Chemical Engineering Journal], vol. 477, p. 146953, 2023.

] <ref-zhou2023bio>
] <refs>
