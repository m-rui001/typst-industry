// Adapted from arXiv:2502.07251v1 by Shi et al.
// https://arxiv.org/abs/2502.07251v1
// Original work: CC BY 4.0, https://creativecommons.org/licenses/by/4.0/
#set page(paper: "a4", margin: 21mm)
#set text(size: 10pt, lang: "en")
#set par(justify: true)
#set heading(numbering: "1.1")
#set math.equation(numbering: "(1)")
#title[CO₂ Adsorption Mechanisms in Hydrated Silica Nanopores: Insights From Grand Canonical Monte Carlo to Classical and Ab Initio Molecular Dynamics]
#align(center)[Jihong Shi (a), Tao Zhang (b), Shuyu Sun (c), and Liang Gong (b)]
#align(center)[#text(size: 8pt)[(a) Department of Physics, King's College London, Strand, London WC2R 2LS, UK. (b) College of New Energy, China University of Petroleum (East China), Qingdao 266580, China. (c) Computational Mathematics, School of Mathematical Sciences, Tongji University, Shanghai 200092, China.]]
#align(center)[Correspondence: #raw("tao.zhang@upc.edu.cn"), #raw("lgong@upc.edu.cn")]

#strong[Abstract.] Understanding interfacial phenomena in confined systems is important for optimizing CO₂ capture technologies. Here, we present a comprehensive investigation of CO₂ adsorption in hydrated amorphous silica nanopores through an integrated computational approach combining grand canonical Monte Carlo (GCMC), classical molecular dynamics (MD), and ab initio molecular dynamics (AIMD) simulations. The excess adsorption isotherms reveal a marked hydration dependence, with CO₂ uptake decreasing from 7.6 to 2.6 mmol/g as water content increases from 1 to 15 wt%. Analysis of adsorption kinetics demonstrates a distinctive bimodal process, characterized by rapid initial uptake followed by slower diffusion-limited adsorption, with the latter becoming increasingly dominant at higher hydration levels. Classical MD simulations reveal an inverse correlation between hydration and CO₂ mobility, with self-diffusion coefficients decreasing

across the studied hydration range. Density profile analysis indicates a hydration-induced transition in CO₂ distribution from central pore regions to surface-proximate domains, accompanied by restructuring of interfacial water networks. Notably, AIMD simulations capture previously unrecognized chemical processes, including proton transfer mechanisms leading to surface silanol formation with characteristic O-O distances of 2.4-2.5 Å, and spontaneous CO₂ hydration yielding carbonate species through water-mediated reaction pathways. These findings demonstrate the dual role of confined water as both a spatial competitor and reaction medium for CO₂ capture, providing molecular-level insights with quantum mechanical accuracy for design of carbon capture materials.

= Introduction
<introduction>
The accelerating accumulation of atmospheric CO₂ has emerged as a critical driver of global climate change\[1\], \[2\], \[3\]. Carbon capture, utilization, and storage (CCUS) technologies have emerged as key strategies for reducing atmospheric CO₂ levels and meeting carbon neutrality goals.\[4\]. Among various CCUS approaches, CO₂ geological sequestration\[5\], which involves the injection of captured CO₂ into underground formations such as depleted oil and gas reservoirs\[6\], deep saline aquifers\[7\], \[8\], and unmineable coal seams\[9\], is considered a promising long-term solution for reducing atmospheric CO₂ levels\[10\]. Simultaneously, the development of advanced materials for surface-based CO₂ capture is being actively pursued, focusing on porous structures like silica aerogels\[11\], metal-organic frameworks\[12\], and hybrid composites\[13\], \[14\] that can selectively adsorb CO₂ from industrial flue gases.

Amorphous silica, a major component of various geological formations and a versatile synthetic material\[15\], is of particular interest for both sub-surface and surface-based CO₂ capture applications due to its high surface area and chemical reactivity \[16\]. Understanding the underlying mechanisms of CO₂ adsorption and diffusion in amorphous silica is crucial to optimizing its use as a sequestration medium and enhancing its efficiency for long-term CO₂ storage. Despite extensive research in this domain, significant gaps remain in correlating the microscopic adsorption capacity of CO₂ with the electronic-level interactions that drive adsorption, particularly under realistic geological conditions. This study aims to address these gaps by utilizing an integrated methodology that combines grand canonical Monte Carlo (GCMC)\[17\], classical molecular dynamics (MD), and ab initio molecular dynamics (AIMD) to systematically examine the adsorption dynamics, diffusion capacity, and molecular interactions of CO₂ in an amorphous silica slit model under hydrated condition.

Experimental studies have played an important role in validating simulation results and providing macroscopic data on CO₂ adsorption capacity and selectivity. \[18\]\[18\] studied the adsorption properties of CO₂ on silica gel and evaluated its potential as a low-cost adsorbent for CO₂ capture. This study analyzed the CO₂ adsorption capacity at different pressures (2 to 8 bar) and temperatures ($25^compose upright(C)$ to $85^compose upright(C)$) through experiments and characterized the silica gel using techniques such as XRD, BET and FTIR. They found that CO₂ adsorption increased with increasing pressure and decreased with increasing temperature, indicating that the adsorption process is exothermic\[18\]. The adsorption characteristics of CO₂ on mesoporous silica and titania surfaces functionalized with aminopropylsilane (APS) were investigated by \[19\] combining microcalorimetry and in situ FTIR spectroscopy \[19\]. The APS functionalization introduces amino groups on silica and titania surfaces, intended to improve CO₂ adsorption efficiency. The detailed differentiation between carbamate formation on silica and bidentate carbonate formation on titania highlights the importance of material selection for CO₂ capture applications. \[20\]\[20\] used a Rubotherm magnetic suspension balance with in situ density measurement to quantify carbon dioxide isotherms on silica at various temperatures (311 - 466 K) and pressures (0 - 450 bar). This approach measures the excess adsorbed quantity and estimates adsorption heat without making assumptions about the adsorbed phase. They found that CO₂ adsorption increased with density, reaching a maximum before declining, indicating that density is a more effective variable than pressure for describing high-pressure adsorption. Adsorption enthalpies also increased with surface potential, especially at lower temperatures, highlighting enhanced adsorption near the critical temperature of CO₂. While the study achieved high precision, limitations include challenges in measuring near the critical point.

Theoretical studies employing molecular simulations \[21\], \[22\], \[23\], \[24\], \[25\], \[26\] have significantly advanced our understanding of CO₂ adsorption behaviour at the atomic scale in various porous media. \[27\]\[27\] investigated the adsorption behaviour of shale gas (the main component of which is methane, $upright(C H)_4$) in kerogen matrix, under water-bearing and CO₂-containing conditions using MD simulations. They found that the adsorption behaviour of each component showed significant inhomogeneity within the organic matrix. Moisture favours adsorption at oxygen-rich sites due to strong polarity and hydrogen bonding interactions, whereas CO₂ tends to adsorb at carbon-rich sites, which is mainly influenced by van der Waals forces and molecular polarity. The interactions between CO₂, $upright(H)_2 upright(O)$, and kerogen are heavily influenced by induced polarization effects.

However, the pcff+ force field\[28\] employed in their work\[27\] relies on fixed atomic charges, limiting its ability to capture the polarization effects that arise from molecular adsorption. To investigate the effects of surface disorder and defects, \[29\]\[29\] investigated CO₂ adsorption in amorphous nanopores versus crystalline surfaces using the ClayFF force field\[30\]. While their study revealed the impact of surface heterogeneity and coordination defects, the classical force field approach limits accurate description of defect-related charge distributions. More sophisticated methods such as AIMD or machine learning potentials\[31\] would be necessary to properly capture these electronic effects. \[32\]\[32\] investigated the competitive adsorption behaviour of CO₂ and $upright(C H)_4$ on functionalized silica surfaces using GCMC and MD simulations, specifically focusing on the impact of different functional groups (e.g., $upright(C O O H)$, $upright(N H)_2$) on adsorption selectivity.

Critically, the study provides valuable insights into how specific functional groups enhance CO₂ selectivity through strong electrostatic interactions, particularly the $upright(C O O H)$ group. While these findings provide valuable insights, the use of polarizable force fields or AIMD would better capture charge redistribution effects, particularly for systems containing both polar and nonpolar species. \[33\]\[33\] employed a multi-scale approach combining GCMC, MD, and density functional theory (DFT) to investigate CO₂ adsorption and mineralization mechanisms in feldspar composites, focusing on carbonate formation in K⁺-rich regions. Their DFT calculations, however, did not incorporate dispersion corrections, potentially underestimating the long-range van der Waals interactions between gas molecules and the substrate.

Despite the significant advancements made in both simulation and experimental research, several critical limitations hinder a comprehensive understanding of CO₂ behaviour in amorphous silica. One major challenge is the discrepancy between idealized simulation models and the heterogeneous nature of real geological materials. Most simulations assume uniform pore structures and surface chemistries, which may not accurately capture the defect-rich and chemically diverse surfaces of natural amorphous silica\[34\]. Experimentally, replicating the complex dynamic nature of real reservoirs and accurately characterizing the temporal evolution of CO₂ adsorption and desorption processes remain formidable. Moreover, although there are currently some studies on CO₂ adsorption under hydrated conditions\[23\], \[25\], \[35\], \[36\], \[37\], most of these investigations qualitatively describe how the presence of water inhibits CO₂ adsorption capacity. However, due to the limitations of classical MD simulations using the empirical force fields, providing a detailed description of the interactions between water molecules and the substrate at the electronic level is challenging. These limitations make it difficult to fully understand the molecular mechanisms governing the effect of water content on CO₂ adsorption. These fundamental challenges motivate the development of more sophisticated approaches to describe CO₂-silica interactions under realistic conditions.

To tackle these research challenges, this study utilizes an integrated simulation approach combining GCMC, MD, and AIMD techniques, each offering unique insights into different aspects of CO₂ behaviour. GCMC is employed to predict equilibrium adsorption isotherms and evaluate the selectivity and capacity of CO₂ under varying thermodynamic and water content conditions. Classical MD simulations are used to explore the dynamics of CO₂ diffusion and adsorption at the atomic level, capturing the influence of moisture on CO₂ mobility and interaction with local surface sites. AIMD simulations, leveraging quantum mechanical accuracy, are applied to investigate the electronic structure and reaction dynamics at defect sites, elucidating potential pathways for $upright(H)_2 upright(O)$ and CO₂ chemisorption and mineralization.

= Methodology
<methodology>
== Amorphous Silica Slit Pore Model
<amorphous-silica-slit-pore-model>
Molecular dynamics simulations were performed for silica ($upright(S i O)_2$) using the Vashishta potential\[38\] that derives the bonds based on the relative locations of the atoms. Given this bond-angle energy-based potential, we do not have to provide bond and angle information in the configuration file as we do with the AMBER force field\[39\]. The amorphous $upright(S i O)_2$ block containing 864 atoms was built with the dimension of $19.593 times 19.749 times 29.570$ Å$""^3$ by replicating the ordered silica unit cell containing 3 Si and 6 O atoms and annealing the system. The entire annealing process is a finely tuned temperature and pressure process using the NPT system. These simulations using the Vashishta force field\[38\] need a smaller time step of 0.001 ps in #emph[metal] unit, which enables the modelling of bond formation and breaking. This is necessary to generate amorphous silica. The time step was 0.001 ps for these simulations. Firstly, the whole system runs 60,000 steps to ensure the melting of the $upright(S i O)_2$ structure at 2000 K and keeps the pressure of the system equal to 100 atm in all three directions. Then in the second step, the system is run for another 60,000 steps and the temperature is lowered from 2000 K to 1000 K, but the isotropic barostat is changed to an anisotropic one and maintained at 100 atm. The third step is to continue to reduce the temperature of the system from 1000 K to our target temperature of 300 K, the anisotropic pressure barostat from the initial 100 atm down to the last 1 atm, run 300,000 steps, the fourth step, is to keep the temperature of the system unchanged at 300 K, to keep the initial and end of the pressure barostat are at 1 atm, run 60,000 steps. The initial model of the constructed amorphous silica block is shown in Fig.~#link(<fgr:model>)[1(a)]. The simulations are carried out using the large-scale atomic/molecular massively parallel simulator (LAMMPS, Nov 21, 2023 version) package.\[40\]

Temperature and pressure are controlled with a Nosé-Hoover thermostat and barostat with relaxation times of 0.1 ps and 1 ps, respectively.

Once the amorphous silica block is obtained, it is then a matter of deforming the block and automatically cracking it into the natural slit model we need. The specific steps are as follows. In this step of MD simulation, we will use the ReaxFF\[41\] force field, as the previous Vashishta force field\[38\] is commonly used to describe more stable $upright(S i O)_2$-bonded structures. This force field is suitable for describing the conventional $upright(S i O)_2$ network structure, especially in the absence of chemical reactions. However, the reactive force field ReaxFF\[41\] is able to dynamically adjust the strength and shape of the bonds to more accurately model bond breaking and chemical reactions and is ideal for studying systems with reactivity such as split amorphous $upright(S i O)_2$\[42\]. Firstly, charge equilibrium of the amorphous silica block was carried out under the NPT ensemble, which differs from the previous one in that a reactive force field was used and the time step was 0.5 fs in #emph[real] unit. The next step is to apply deformation in the z-direction of the system so that the amorphous silica block gradually cracks, applying an engineering strain rate of 5 $times 10^(- 5)$/fs. After running for 22,000 steps in the NVT system at 300 K, we obtained a natural-cracked amorphous silica slit model, as shown in Fig.~#link(<fgr:model>)[1(b)], with the cell dimension of $19.968 times 20.128 times 46.663$ Å$""^3$. Temperature and pressure are controlled with a Nosé-Hoover thermostat and barostat with relaxation times of 100 fs and 1000 fs, respectively.

#figure(image("graphics/model_strain.png", height: 7.3cm),
  caption: [
    \(a) Amorphous silica block strained in the z-direction. (b) The eventual amorphous silica natural slit model, corresponding to the average slit width approximately at 15 Å. $upright(S i)$ atoms are coloured in yellow, and oxygen atoms are red.
  ]
)
<fgr:model>

== GCMC-MD simulations
<gcmc-md-simulations>
To investigate the adsorption characteristics of CO₂ in amorphous silica under aqueous conditions, we set up a series of slit models with different hydrated conditions such as 1 wt%, 2 wt%, 5 wt%, 10 wt%, 15 wt%. To create different water contents, we first performed the GCMC MD simulation on the obtained slit model to absorb different amounts of the water molecules. The empirical force filed of rigid four-site TIP4P/2005\[43\] was assigned to water. The Transferable Potential for Phase Equilibria (TraPPE)\[44\] force field was taken for modelling the CO₂ molecules. The interactions between small molecules (H₂O and CO₂) and $upright(S i O)_2$ was represented by combining the Vashishta and TIP4P/2005 and TraPPE force fields. The LJ parameters were obtained by using Lorentz-Berthelot mixing rule\[45\] based on $ epsilon_(i j) = sqrt(epsilon_(i i) times epsilon_(i j)) \, $ and $ sigma_(i j) = 1 / 2 (sigma_(i i) + sigma_(i j)) . $ t The parameters of the LJ potentials for SiO₂, H₂O, and CO₂ are shown in Table~@tbl:lj-potentials. The cutoff for the long-range Coulomb and Van der Waals interactions was set as 10 Å.

#figure(
  align(center)[#table(
    columns: 3,
    align: (left,left,left,),
    table.header([Atom Pair], [$epsilon.alt \( e V \)$], [$sigma \($Å$\)$],),
    table.hline(),
    [Si-Si], [0.0040], [3.690],
    [$O_(S i) - O_(S i)$], [0.0023], [3.091],
    [$O_H - O_H$], [0.0080], [3.159],
    [$O_C - O_C$], [0.0179], [2.626],
    [C-C], [0.0106], [2.811],
  )]
  , caption: [~Lennard-Jones potential parameters between $upright(S i O)_2$, H₂O, and CO₂ atoms in #emph[metal] unit. The $O_(S i)$, $O_H$, and $O_C$ are representing for the oxygen atoms belong to the $upright(S i O)_2$, H₂O, and CO₂ molecules, respectively.]
  , kind: table
  ) <tbl:lj-potentials>
The simulation protocol of the sequential adsorption of H₂O and CO₂ onto the amorphous $upright(S i O)_2$ slit pores using a combination of Grand Canonical Monte Carlo (GCMC) methods and MD for temperature control. The process begins with the adsorption of water, followed by CO₂ adsorption, with each stage carefully parameterized and executed. The simulation defines a specific region, slightly smaller than the initial simulation box (reduced by 0.1 Å~in all dimensions), to ensure that the interactions are confined within the area of interest, avoiding boundary effects. GCMC operations are performed every 100 steps, attempting 100 insertion or deletion operations per cycle, governed by a chemical potential of -0.5 eV with a fluctuation range of $plus.minus$0.1 eV. A temperature of 310 K is maintained during the GCMC operations, and the insertion attempts are scaled by a factor of $5 / 3$, effectively modifying the acceptance criteria for the insertion process. Additionally, molecular geometry corrections are applied to ensure structural consistency using the #emph[shake] command. Simultaneously, the dynamics of the water molecules are controlled using the NVT ensemble, maintaining the temperature at 310 K with a Nosé-Hoover thermostat at a coupling time of 0.1 ps in the #emph[metal] unit. The temperature computation for the H₂O group is dynamically updated to account for the changes in molecule numbers caused by GCMC operations. The $upright(S i O)_2$ matrix is fixed and does not move, ensuring a stable background for the water molecules interactions. The time step is set to 1 fs for the NVT runs to achieve high accuracy in the dynamics calculations, and thermodynamic properties are recorded every 100 steps. The NVT simulation runs for 5000 steps, corresponding to 5 ps, to capture the short-term equilibrium behavior of the water molecules under the influence of chemical potential adjustments and dynamic temperature regulation.

In the subsequent stage, CO₂ adsorption is conducted using a similar GCMC framework, with CO₂ molecules being introduced iteratively over 300 cycles. Each cycle consists of 500 simulation steps, allowing the system to equilibrate with the CO₂ reservoir. Once the GCMC adsorption process is completed, the whole system is subjected to classical MD simulations of up to 1 ns under the NVT ensemble to obtain the diffusion characteristics of small molecules in the slit. The GCMC MD simulations were performed using the LAMMPS (Nov 21, 2023 version) package\[40\].

== AIMD simulations
<aimd-simulations>
Ab initio MD simulations were performed to study the interactions between small molecules H₂O and CO₂ and amorphous $upright(S i O)_2$ matrix. All calculations were conducted using the electronic structure module Quickstep in the CP2K version 9.1 software package \[46\]. The propagation of the classical nuclei was performed using #emph[ab initio] Born-Oppenheimer MD with a 0.5~fs timestep. At each step of the MD, the electronic orbitals were fine-tuned to the Born-Oppenheimer surface using an orbital transformation (OT) method \[47\] with a convergence criterion of $1 times 10^(- 7)$ a.u. The conjugate gradient minimizer was employed within the OT method to perform the optimization. The Gaussian and plane waves method\[48\] expanded the wave function in the Gaussian double-zeta valence polarized (DZVP) basis set \[49\]. Auxiliary plane waves were employed to expand the electron density up to a cutoff of 400 Ry. One of the density functional approximations, Perdew-Burke-Ernzerhof (PBE) \[50\], was used with Grimme dispersion corrections \[51\] denoted as D3 here. Adopting empirical dispersion correction to density functionals has shown superiority in optimizing water properties at ambient conditions\[52\]. Goedecker-Teter-Hutter pseudopotentials were utilized to effectively handle the core electrons \[53\]. The AIMD simulations were performed up to 15 ps in the NVT ensemble by using Nose'-Hoover (3 chains) thermostat at the time constant of 100 fs.

== Analysis details
<analysis-details>
The excess adsorption of CO$""_2$ ($n_(upright(e x))$) was calculated from MD trajectories by considering the difference between the absolute amount adsorbed and the amount that would be present in the same volume of bulk. For our system at supercritical conditions ($T = 310$ K, $P = 10$ MPa), the excess adsorption was determined using:

$ n_(upright(e x)) = n_(upright(a b s)) - frac(rho_(upright(b u l k)) times V_(upright(a d s)), m) $ where $n_(upright(a b s))$ is the absolute adsorption (mmol/g), $rho_(upright(b u l k))$ is the bulk fluid density ($upright(g) \/ upright(c m)^3$), $V_(upright(a d s))$ is the accessible pore volume ($upright(c m)^3$), and $m$ is the mass of the adsorbent (g). The accessible pore volume was determined from the difference between the split and original simulation box volumes. The absolute adsorption was calculated from the number of CO$""_2$ molecules $(upright(N)_(upright(C O)_2))$ in the simulation box: $ n_(upright(a b s)) = frac(N_(upright(C O_2)) times 1000, m_(upright(a d s)) times N_(upright(A))) $ where $N_(upright(A))$ is Avogadro number.

The bulk fluid density ($rho_(upright(b u l k))$) was calculated using the Peng-Robinson equation of state (PR-EOS)\[54\]:

$ p = frac(R T, V_(upright(m)) - b) - frac(a alpha, V_(upright(m))^2 + 2 b V_(upright(m)) - b^2) $ where $p$ is the system pressure, $R$ is the universal gas constant (8.314 J mol$""^(- 1)$ K$""^(- 1)$), $T$ is the absolute temperature, and $V_(upright(m))$ represents the molar volume. The parameters $a$ and $b$ were determined from the critical properties of CO$""_2$ ($T_(upright(c))$ = 304.13 K, $P_(upright(c))$ = 7.38 MPa).

The physical significance of these parameters lies in their representation of molecular interactions: the parameter $b$ accounts for the molecular volume exclusion effect, while the product $a alpha$ characterizes the temperature-dependent attractive forces between molecules. This equation of state has been shown to provide reliable predictions for both vapor-liquid equilibria and volumetric properties of non-polar and slightly polar fluids, particularly in the critical and supercritical regions.

The self-diffusion coefficient ($D^s$) of CO$""_2$ molecules was evaluated through MD simulations in the canonical ($N V T$) ensemble at 310 K and 100 bar. The mean square displacement (MSD) was calculated using Einstein relation:

$ D^s = frac(1, 2 d N) lim_(t arrow.r oo) frac(d, d t) ⟨sum_(i = 1)^N \( r_i^(upright(C O_2)) \( t \) - r_i^(upright(C O_2)) \( 0 \) \)^2⟩ $ where $d$ is the system spacial dimension, $N$ is the number of CO$""_2$ molecules, and $r_i^(upright(C O_2)) \( t \)$ represents the position of the $i$th CO$""_2$ molecule at time $t$. The self-diffusion coefficient was obtained from the slope of the MSD versus time in the linear regime, where the system exhibited normal diffusive behaviour.

= Results and discussion
<results-and-discussion>
== CO$""_2$ adsorption kinetics
<co_2-adsorption-kinetics>
The excess adsorption curves of CO$""_2$ in hydrated amorphous silica slit pores exhibit several distinctive features that provide valuable insights into the adsorption mechanism. Most notably, a clear water content-dependent behaviour is observed, where the equilibrium excess adsorption capacity systematically decreases with increasing water content, from approximately 7.6 mmol/g at 1 wt% to 2.6 mmol/g at 15 wt%. This significant reduction (approximately 66 %) in CO$""_2$ uptake capacity suggests a strong competitive effect between H₂O and CO₂ for available adsorption sites. The adsorption of CO₂ in the amorphous silica slit model at low water content is consistent with the data on CO₂ adsorption in an activated carbon slit model measured experimentally and by GCMC in the work of Ref.~\[55\], which is roughly on the order of 8 mmol/g. The slight decrease in our adsorption amount is the effect of pre-adsorbed water molecules.

#figure(image("graphics/co2_adsorption_fitting.png", height: 6cm),
  caption: [
    The CO₂ adsorption in amorphous silica slit model at different water contents at 310 K and 10 MPa. double exponential model was used to fit the adsorption curves.
  ]
)
<fgr:adsorption>

The adsorption kinetics can be characterized by two distinct regimes across all water contents. The initial stage (0-25 ps) shows a steep uptake rate, indicating rapid CO₂ adsorption on readily accessible surface sites. This is followed by a gradual approach to equilibrium (25-150 ps), where the adsorption rate significantly decreases. Interestingly, the time required to reach equilibrium (approximately 100 ps) remains relatively consistent across different water contents, despite the substantial differences in equilibrium capacity. A particularly noteworthy feature is the evolution of the curve shapes with increasing water content. At low water contents (1-2 wt%), the curves exhibit a sharp initial rise followed by a smooth transition to equilibrium. However, as water content increases, the initial uptake becomes less steep, and the transition to equilibrium becomes more gradual, especially evident in the 10 wt% and 15 wt% cases. This behaviour suggests that higher water content not only reduces the available adsorption sites but also modifies the adsorption kinetics by creating additional diffusion barriers for CO₂ molecules.

The data points show some fluctuations around the fitted curves, particularly noticeable at higher water contents, which can be attributed to the dynamic nature of water-CO₂ interactions and the continuous reorganization of water molecules within the confined space. These fluctuations provide evidence of the complex interplay between water, CO₂, and the silica surface in the nanoporous environment. These mechanisms were revealed later in the simulation results of AIMD.

The selection of an appropriate kinetic model is crucial for understanding the CO$""_2$ adsorption mechanism in hydrated amorphous silica slit model. Initially, several conventional adsorption kinetic models were considered and evaluated: 1. Pseudo-first-order model (PFO)\[56\]: $ q_t = q_e (1 - exp^(- k_1 \, t)) $ where $q_t$ and $q_e$ represent the amount of CO$""_2$ adsorbed at time $t$ and at equilibrium, respectively, and $k_1$ is the first-order rate constant. 2. Pseudo-second-order model (PSO)\[57\]: $ q_t = frac((q_e^2 dot.op k_2 dot.op t), 1 + q_e dot.op k_2 dot.op t) $ where $k_2$ is the second-order rate constant. 3. Avrami kinetic model\[58\]: $ q_t = q_e (1 - exp^(- k_(a v) dot.op t^(n_(a v)))) $ where $k_(a v)$ is the kinetic rate constant and $n_(a v)$ is the Avrami exponent representing the dimensionality of growt%h.

However, careful examination of the adsorption curves revealed that these conventional models were inadequate to capture the complex nature of CO$""_2$ adsorption in our hydrated system. The presence of water molecules introduces additional complexity to the adsorption process, as evidenced by the distinct fast and slow uptake regions observed in our data. This observation led us to adopt the double exponential (DE) model\[59\]: $ q_t = q_e [A_1 (1 - exp^(- k_1 dot.op t)) + A_2 (1 - exp^(- k_2 dot.op t))] $ where $k_1$ and $k_2$ are the rate constants for fast and slow adsorption processes, $A_1$ and $A_2$ are the relative contributions of each process (A1 + A2 = 1). The DE model was selected based on several key considerations. The model accounts for two distinct adsorption processes: a rapid initial uptake ($k_1$) representing direct surface adsorption and a slower secondary process ($k_2$) reflecting diffusion-limited adsorption, as shown in Fig.~@fgr:adsorption.

The model demonstrated excellent agreement with the GCMC simulation results across all water contents, yielding high $R^2$ values approximately above 0.98 and demonstrating its robustness in describing the adsorption process across different hydration conditions. The quality of the fitting increased slightly with increasing water content.

#figure(image("graphics/co2_msd.png", height: 13cm),
  caption: [
    Bulk summation of the mean square displacement of H₂O (Top panel) and CO₂ (Bottom panel) molecules in amorphous silica slit model at different water contents at 310 K and 10 MPa.
  ]
)
<fgr:diffusion>

== Diffusion properties of H₂O and CO₂
#label("diffusion-properties-of-h₂o-and-co₂")
The mean square displacement (MSD) analysis reveals distinct diffusion behaviours of H₂O and CO₂ molecules under varying water contents in the amorphous silica slit model. These classical MD results provide initial insights into the complex molecular transport mechanisms, while setting the stage for more detailed quantum mechanical investigations below through AIMD simulations.

For H₂O molecules, a pronounced enhancement in mobility is observed with increasing water content from 1 wt% to 15 wt%, as evidenced by the significant increase in MSD values from approximately 150 Å² to 700 Å² at 1000 ps. At low water contents (1-2 wt%), the MSD curves tend to plateau after 400-600 ps, suggesting restricted molecular motion. This behaviour can be attributed to the strong interactions between water molecules and the Si-O-Si network of the amorphous silica framework, where water molecules form hydrogen bonds with the oxygen atoms in the silica structure, effectively constraining their diffusion. Although classical MD captures this general diffusion trend, AIMD simulations would be particularly valuable in revealing the precise nature of these hydrogen bonds and their impact on electron density distributions at the water-silica interface.

In contrast, at higher water contents (10-15 wt%), the continuously rising MSD curves with steeper slopes indicate enhanced molecular mobility. This enhancement likely results from the formation of continuous water networks due to the large amount of water molecules, where water-water interactions become dominant over water-silica interactions, facilitating water transport through the porous structure. The transition from surface-dominated to network-dominated transport suggests complex changes in the electronic structure of the system, which can be further elucidated through AIMD simulations to understand the quantum mechanical aspects of hydrogen bond network dynamics.

Intriguingly, CO₂ molecules exhibit an inverse relationship with water content. The diffusion of CO₂ is progressively hindered as water content increases, demonstrated by the decrease in MSD values from 380 Å² at 1 wt% to 230 Å² at 15 wt% after 1000 ps. Notably, the MSD values of CO₂ are consistently lower than those of H₂O under all conditions, indicating more restricted diffusion of CO₂ molecules. At higher water contents (10-15 wt%), the CO₂ MSD curves show a tendency to plateau beyond 600 ps, suggesting that the formed water networks may create additional barriers for CO₂ transport.

These findings reveal a dual-regulation mechanism of water content on molecular transport in amorphous silica. While increased water content promotes water diffusion by transitioning from surface-dominated to network-dominated transport, it simultaneously suppresses CO₂ mobility through spatial competition and pathway obstruction. This inverse regulation effect demonstrates the critical role of water content in controlling selective molecular transport through silica-based materials. Furthermore, this classical MD study provides a foundation for subsequent AIMD investigations, which can offer deeper insights into the quantum mechanical nature of molecular interactions, charge transfer processes, and the formation/breaking of chemical bonds that may occur during molecular transport.

#figure(image("graphics/adsorption_sites.png", height: 13cm),
  caption: [
    Number density profiles of H₂O and CO₂ molecules in slit pores at 2 wt% and 15 wt% water contents. Silicon atoms are coloured in yellow, oxygen atoms different molecules are red, hydrogen atoms are white, and carbon atoms are cyan. The screenshots show the adsorption occurrences of H₂O and CO₂ molecules of the final frames from the 1~ns classical MD simulations.
  ]
)
<fgr:sites>

== Adsorption sites of H₂O and CO₂
#label("adsorption-sites-of-h₂o-and-co₂")
The density profiles reveal distinct distribution patterns of H₂O and CO₂ molecules within the nanopore under different water contents. Representative results for one low (2 wt%) and one high (15 wt%) moisture content are selected for analysis here. At 2~wt% water content, CO₂ molecules predominantly occupy the central region of the pore ($z approx$ 15-25 Å) with a high density peak ($approx$ 0.08~Å$""^(- 3)$), while water molecules are mainly localized near the pore surface ($z approx$ 25-30~Å) with relatively lower density ($approx$ 0.04~Å$""^(- 3)$). This initial distribution reflects the strong hydrophilic interactions between water molecules and silicon-oxygen groups through hydrogen bonding, while CO₂ molecules occupy the central region to maximize their configurational entropy. At this pore scale, the distribution of CO₂ molecules also exhibits a bimodal structure similar to that exhibited by CH₄ in our previous work\[60\], as shown in Fig.~@fgr:sites.

As the water content increases to 15 wt%, a significant redistribution occurs through complex molecular interactions, as shown in Fig.~@fgr:sites. The water density in the central region increases substantially ($approx$ 0.09~Å$""^(- 3)$), forming a dominant water phase through extensive hydrogen bonding networks. Notably, CO₂ molecules exhibit a unique dual-peak distribution: one near the one side of the surface ($z approx$ 10-15 Å) and another near the other side of the reigon ($z approx$ 25-30 Å). This redistribution mechanism can be attributed to several factors: First, the large number of the formation of ordered water structures in the central region creates energetically favourable interfacial sites near the surface for CO₂ molecules, where they can interact with both partially exposed silicon atoms and the ordered water layer through their quadrupole moment. Second, the ordered water structure near the surface may create local hydrophobic pockets that can accommodate CO₂ molecules while minimizing disruption to the water hydrogen bonding network. Furthermore, the nanoscale confinement enhances these surface-mediated interactions, making the surface region an energetically competitive location for CO₂ molecules.

These observations demonstrate the competition between different molecular interactions - namely H₂O-surface hydrogen bonding, H₂O-H₂O hydrogen bonding networks, and CO₂-surface/CO₂-water interactions - governs the spatial organization of molecules within the nanopore. The observed behaviour suggests that at higher water contents, while the formation of structured water networks dominates the central pore region, it simultaneously creates unique interfacial environments that influence CO₂ distribution. This understanding of competitive adsorption and molecular reorganization is crucial for optimizing CO₂ capture and storage in nanoporous materials under realistic conditions where water is inevitably present.

#figure(image("graphics/proton_transfer.png", height: 10cm),
  caption: [
    The formation of surface silanol groups and the frequently proton transfer of the representative 2 wt% system during AIMD simulation. Silicon atoms are coloured in yellow, oxygen atoms different molecules are red, hydrogen atoms are white, and carbon atoms are cyan. The transit structure of OH⁻-H₃O⁺ complex (b) and the formation of the H₃O⁺ ion. The screenshots were captured from the upto 15 ps AIMD simulations.
  ]
)
<fgr:proton>

== Insights into the intermolecular interactions at the DFT scale
<insights-into-the-intermolecular-interactions-at-the-dft-scale>
Our AIMD simulations revealed a proton transfer mechanism mediated by water molecules in the hydrated silica nanopores during CO₂ adsorption. The trajectory analysis showed the formation of a transient OH⁻-H₃O⁺ complex through the coordination of two water molecules, as shown in Fig.~@fgr:proton (b). This complex exhibited notable structural features with an O-O distance of 2.51 Å, characteristic of a strong hydrogen bonding interaction. This structural feature aligns well with previous theoretical studies \[61\] reporting O-O distances of 2.4-2.5 Å~for proton-sharing water complexes, confirming the formation of a stable OH⁻-H₃O⁺ species instead of the tranditional Zundel cation\[62\]. The subsequent proton transfer process proceeded via a Grotthuss-like mechanism\[63\], where one water molecule donated a proton to form H₃O⁺, as shown in Fig.~@fgr:proton c. While the remaining OH⁻ simultaneously coordinated with a surface silicon atom of the amorphous silica framework.

#figure(image("graphics/co2-hydrated.png", height: 10cm),
  caption: [
    Hydrogen bonding networks and CO₂ hydration processes of the 2 wt% system during AIMD simulations. The sketches of the process of silicon silanol group on the surface linking a water molecule via hydrogen bonding (b), as well as the eventual formation of CO₃²⁻ ion (c). Silicon atoms are coloured in yellow, oxygen atoms different molecules are red, hydrogen atoms are white, and carbon atoms are cyan. The transit structure of OH⁻-H₃O⁺ complex (b) and the formation of the H₃O⁺ ion. The screenshots were captured from the upto 15 ps AIMD simulations.
  ]
)
<fgr:co2-hydrated>

The driving force for later proton transfer event can be attributed to the strong Lewis acidity of framework Si atoms in the silica structure. When two water molecules come into close proximity (O-O distance of 2.4-2.5 Å), the electron-deficient Si atom from an existing Si-O framework bond exhibits a strong attraction towards the hydroxyl group of one water molecule. This Si···OH⁻ interaction creates an electronic driving force that facilitates the separation of OH⁻ and H⁺ from the water molecule. The stabilization of the hydroxyl group by the framework Si atom effectively lowers the energy barrier for proton transfer, enabling the formation of the transit OH⁻-H₃O⁺ complex and subsequent proton hopping to the neighboring water molecule. From an electronic structure perspective, the undercoordinated Si centers (dangling sites) on the amorphous silica surface act as strong electron density acceptors. The interaction between such an electron-deficient dangling Si site and the electron-rich oxygen of the OH⁻ creates a stabilizing effect through orbital interactions. This surface Si···OH⁻ interaction effectively anchors the hydroxyl group, providing a thermodynamically favorable pathway for water dissociation and subsequent proton transfer

The formation of surface silanol groups through water dissociation fundamentally alters the local chemical environment of the amorphous silica surface. These newly formed Si-OH⁻ groups modify the surface electronic structure and local charge distribution, potentially enhancing the binding strength with CO₂ molecules; second, they act as hydrogen bond donors/acceptors, creating an extended hydrogen bonding network that can stabilize adsorbed CO₂ molecules. The proton transfer dynamics we observed suggest that these surface OH⁻ are not static entities but rather participate in dynamic proton exchange, which could facilitate CO₂ capture through cooperative binding mechanisms. This surface hydroxylation effect transforms the originally less reactive silica surface into a more chemically active interface for CO₂ adsorption, where both electrostatic interactions and hydrogen bonding contribute to the enhanced adsorption capacity, which is consistent with the experimental results by \[64\]\[64\].

After the formation of silanol groups on the surface, we observed the formation of hydrogen bonds with the surrounding water molecules as shown in Fig.~@fgr:co2-hydrated b. The formation of hydrogen bonds between surface silanol groups and water molecules significantly influences the spatial organization of confined species. Our simulations reveal that these silanol-water hydrogen bonds induce the formation of a structured water layer adjacent to the silica surface, as evidenced by the density distribution analysis from Fig.~@fgr:sites. This ordered hydration layer modifies the local chemical environment near the surface, affecting the spatial distribution and accessibility of CO₂ molecules within the confined space. In addition, the spontaneous hydration of CO₂ was also captured by AIMD simulations. The trajectory analysis revealed that the CO₂ hydration process proceeds via a concerted mechanism involving multiple water molecules. Specifically, we observed the formation of carbonic acid (H₂CO₃) through nucleophilic attack of a water molecule on the carbon center of CO₂, followed by proton transfer events that ultimately led to stable carbonate (CO₃²⁻) species, as shown in Fig.~@fgr:co2-hydrated c. The AIMD simulations capture the step-by-step mechanism of carbonic acid formation, starting with the hydration of CO₂ to form carbonic acid, followed by its dissociation into bicarbonate (HCO₃⁻) and carbonate (CO₃²⁻) ions. The O-H bond breaking and formation during this process was facilitated by the hydrogen bonding network in the confined water layer, which effectively lowered the activation barrier for CO₂ hydration.

This CO₂ hydration process represents an additional pathway in the overall adsorption mechanism. The formation of carbonate species provides an alternative state for CO₂ in the confined space, where these hydrated species can interact with both the surrounding water molecules and surface silanol groups through hydrogen bonding networks. This finding suggests that the presence of confined water in silica nanopores enables CO₂ hydration, potentially diversifying the CO₂ capture mechanisms in the system.

In summary, our AIMD simulations reveal that CO₂ molecules confined in hydrated silica nanopores can undergo spontaneous hydration, leading to the formation of carbonate species. This finding extends beyond the conventional understanding of purely physical adsorption mechanisms, demonstrating the dynamic interplay between CO₂, confined water, and the silica surface at the molecular level. The observation of formation of the silanol groups, proton tranfer, the CO₂ hydration in nanoporous environments provides atomic-scale insights into the complex chemical processes occurring in practical carbon capture systems, highlighting the dual role of water as both a reaction medium and an active participant in CO₂ capture.

#heading(level: 1, numbering: none)[Conclusions]
<conclusions>
This study provides molecular insights into the complex interplay between CO₂, H₂O, and amorphous silica surfaces in slit nanopores. Our multi-scale computational approach reveals several key findings. The confined H₂O molecules significantly impacts CO₂ uptake capacity, with adsorption kinetics following a double exponential model that reflects distinct fast and slow uptake processes. Besides, molecular diffusion analysis demonstrates an inverse relationship between H₂O and CO₂ mobility, where increased water content enhances water diffusion while hindering CO₂ transport. Furthermore, density distribution analysis reveals a water-content-dependent reorganization of adsorption sites, with CO₂ transitioning from central pore regions to surface-proximate locations at higher water contents.

Crucially, our AIMD simulations uncover previously unrecognized chemical processes in the confined space. We observe proton transfer mechanisms leading to surface silanol formation, with characteristic O-O distances of 2.4-2.5 Å~in the transient two water bonding complex. The simulations also capture spontaneous CO₂ hydration events, resulting in CO₃²⁻ species formation through water-mediated reaction pathways. These findings demonstrate that confined water plays dual roles: as a spatial competitor for adsorption sites and as a reaction medium enabling chemical transformations of CO₂.

These insights extend beyond conventional physisorption models and provide a quantum mechanical level foundation for understanding CO₂ capture in hydrated nanoporous materials. The identified mechanisms of surface modification and CO₂ transformation suggest new strategies for optimizing carbon capture technologies, particularly in realistic conditions where water is invariably present.

#heading(level: 1, numbering: none)[Acknowledgements]
<acknowledgements>
We are grateful for the computational resources funded by the National Natural Science Foundation of China (No. 52006243and No. 51936001), the Shandong Excellent Young Scientist (Overseas) Program (No. 2024HWYQ-050), the Qingdao Postdoc Research Program (No. QDBSH20240201031), the Natural Science Foundation of Shandong Province (No. ZR2020QE197), and the Fundamental Research Funds for the Central Universities (No. 22CX06027A).

#heading(level: 1, numbering: none)[Author contributions]
<author-contributions>
JS, TZ, CZ, SS and LG participated in the research design. JS performed the molecular simulations, analyzed the data and wrote the original manuscript. TZ, CZ, SS, and LG revised the manuscript. TZ, LG provided computational resources. SS and LG conceived the project, supervised the research. All authors contributed to the discussion of the results and the revision of the manuscript and approved the submitted version.

#heading(level: 1, numbering: none)[Conflicts of interest]
<conflicts-of-interest>
There are no conflicts of interest to declare.

#heading(level: 1, numbering: none)[Data availability]
<data-availability>
The data supporting this article is openly available from the research data repository, Harvard Dataverse, at xxx. (The dataset will be deposited later.)

#heading(level: 1, numbering: none)[References]
<bibliography>
#block[
#block[
\[1\] L. M. Bouwer, “Projections of future extreme weather losses under changes in climate and exposure,” #emph[Risk Analysis], vol. 33, no. 5, pp. 915--930, 2013.

] <ref-bouwer2013projections>
#block[
\[2\] V. Masson-Delmotte #emph[et al.], “Climate change 2021: The physical science basis,” #emph[Contribution of working group I to the sixth assessment report of the intergovernmental panel on climate change], vol. 2, no. 1, p. 2391, 2021.

] <ref-masson2021climate>
#block[
\[3\] S. Boubaker, Z. Liu, Y. Mu, and Y. Zhan, “Carbon dioxide emissions and environmental risks: Long term and short term,” #emph[Risk Analysis], 2024.

] <ref-boubaker2024carbon>
#block[
\[4\] P. Gabrielli, M. Gazzani, and M. Mazzotti, “The role of carbon capture and utilization, carbon capture and storage, and biomass to enable a net-zero-CO2 emissions chemical industry,” #emph[Industrial & Engineering Chemistry Research], vol. 59, no. 15, pp. 7033--7045, 2020.

] <ref-gabrielli2020role>
#block[
\[5\] R. Lal, “Carbon sequestration,” #emph[Philosophical Transactions of the Royal Society B: Biological Sciences], vol. 363, no. 1492, pp. 815--830, 2008.

] <ref-lal2008carbon>
#block[
\[6\] A. O. Gbadamosi, R. Junin, M. A. Manan, A. Agi, and A. S. Yusuff, “An overview of chemical enhanced oil recovery: Recent advances and prospects,” #emph[International Nano Letters], vol. 9, pp. 171--202, 2019.

] <ref-gbadamosi2019overview>
#block[
\[7\] Z. Xie, L. Zhang, Y. Zhao, C. Cao, L. Li, and D. Zhang, “CO2 storage in deep saline aquifer injection types, well placement and well control co-optimization,” in #emph[Proceedings of the international field exploration and development conference 2023], J. Lin, Ed., Singapore: Springer Nature Singapore, 2024, pp. 434--446.

] #label("ref-10.1007/978-981-97-0268-8_34")
#block[
\[8\] F. Yang, B. Bai, D. Tang, D.-N. Shari, and W. David, “Characteristics of CO 2 sequestration in saline aquifers,” #emph[Petroleum Science], vol. 7, pp. 83--92, 2010.

] <ref-yang2010characteristics>
#block[
\[9\] A. Talapatra, “A study on the carbon dioxide injection into coal seam aiming at enhancing coal bed methane (ECBM) recovery,” #emph[Journal of Petroleum Exploration and Production Technology], vol. 10, no. 5, pp. 1965--1981, 2020.

] <ref-talapatra2020study>
#block[
\[10\] J. W. Fentaw, H. Emadi, A. Hussain, D. M. Fernandez, and S. R. Thiyagarajan, “Geochemistry in geological CO2 sequestration: A comprehensive review,” #emph[Energies], vol. 17, no. 19, p. 5000, 2024, doi: #link("https://doi.org/10.3390/en17195000")[10.3390/en17195000].

] <ref-en17195000>
#block[
\[11\] F. Akhter, S. A. Soomro, and V. J. Inglezakis, “Silica aerogels; a review of synthesis, applications and fabrication of hybrid composites,” #emph[Journal of Porous Materials], vol. 28, no. 5, pp. 1387--1400, 2021.

] <ref-akhter2021silica>
#block[
\[12\] C. Pettinari and A. Tombesi, “Metal--organic frameworks for carbon dioxide capture,” #emph[MRS Energy & Sustainability], vol. 7, p. E35, 2020.

] <ref-pettinari2020metal>
#block[
\[13\] R. Navik, E. Wang, X. Ding, K. Qiu, and J. Li, “Atmospheric carbon dioxide capture by adsorption on amine-functionalized silica composites: A review,” #emph[Environmental Chemistry Letters], pp. 1--40, 2024.

] <ref-navik2024atmospheric>
#block[
\[14\] N. Ramasamy, A. J. L. P. Raj, V. V. Akula, and K. Nagarasampatti Palani, “Leveraging experimental and computational tools for advancing carbon capture adsorbents research,” #emph[Environmental Science and Pollution Research], pp. 1--30, 2024.

] <ref-ramasamy2024leveraging>
#block[
\[15\] R. Chittick, J. Alexander, and H. Sterling, “The preparation and properties of amorphous silicon,” #emph[Journal of the Electrochemical Society], vol. 116, no. 1, p. 77, 1969.

] <ref-chittick1969preparation>
#block[
\[16\] L. S. Dias and A. K. Alves, “Silica nanoparticles: Morphology and applications,” #emph[Technological Applications of Nanomaterials], pp. 89--106, 2022.

] <ref-dias2022silica>
#block[
\[17\] D. J. Adams, “Grand canonical ensemble monte carlo for a lennard-jones fluid,” #emph[Molecular Physics], vol. 29, no. 1, pp. 307--311, 1975, doi: #link("https://doi.org/10.1080/00268977500100221")[10.1080/00268977500100221].

] #label("ref-doi:10.1080/00268977500100221")
#block[
\[18\] Z. Khoshraftar, A. Ghaemi, and H. Mashhadimoslem, “Evaluation of the silica gel adsorbent potential for carbon dioxide capture: Experimental and modeling,” #emph[Iranian Journal of Chemical Engineering (IJChE)], vol. 18, no. 4, pp. 64--80, 2021.

] <ref-khoshraftar2021evaluation>
#block[
\[19\] C. Knöfel, C. Martin, V. Hornebecq, and P. L. Llewellyn, “Study of carbon dioxide adsorption on mesoporous aminopropylsilane-functionalized silica and titania combining microcalorimetry and in situ infrared spectroscopy,” #emph[The Journal of Physical Chemistry C], vol. 113, no. 52, pp. 21726--21734, 2009, doi: #link("https://doi.org/10.1021/jp907054h")[10.1021/jp907054h].

] #label("ref-doi:10.1021/jp907054h")
#block[
\[20\] O. Di Giovanni, W. Dörfler, M. Mazzotti, and M. Morbidelli, “Adsorption of supercritical carbon dioxide on silica,” #emph[Langmuir], vol. 17, no. 14, pp. 4316--4321, 2001, doi: #link("https://doi.org/10.1021/la010061q")[10.1021/la010061q].

] #label("ref-doi:10.1021/la010061q")
#block[
\[21\] J. Shi, T. Zhang, X. Xie, W. Wei, L. Gong, and S. Sun, “Characterizing competitive adsorption and diffusion of methane and carbon dioxide in kerogen type-III slit model,” #emph[Computational Geosciences], pp. 1--11, 2024.

] <ref-shi2024characterizing>
#block[
\[22\] S. Mi, Y. Zhang, and W. Ge, “Molecular dynamics study on the storage of carbon dioxide in single-walled carbon nanotubes at low pressures,” #emph[Langmuir], vol. 40, no. 41, pp. 21855--21865, 2024, doi: #link("https://doi.org/10.1021/acs.langmuir.4c03177")[10.1021/acs.langmuir.4c03177].

] #label("ref-doi:10.1021/acs.langmuir.4c03177")
#block[
\[23\] J. Liu, T. Zhang, S. Pang, and S. Sun, “Thermal effects of organic porous media on absorption and desorption behaviors of carbon dioxide,” #emph[Applied Thermal Engineering], vol. 254, p. 123920, 2024.

] <ref-liu2024thermal>
#block[
\[24\] M. S. Khosrowshahi #emph[et al.], “The role of surface chemistry on CO2 adsorption in biomass-derived porous carbons by experimental results and molecular dynamics simulations,” #emph[Scientific Reports], vol. 12, no. 1, p. 8917, 2022.

] <ref-khosrowshahi2022role>
#block[
\[25\] L. Gong, J.-H. Shi, B. Ding, Z.-Q. Huang, S.-Y. Sun, and J. Yao, “Molecular insight on competitive adsorption and diffusion characteristics of shale gas in water-bearing channels,” #emph[Fuel], vol. 278, p. 118406, 2020, doi: #link("https://doi.org/10.1016/j.fuel.2020.118406").

] <ref-GONG2020118406>
#block[
\[26\] J. Shi, L. Gong, S. Sun, Z. Huang, B. Ding, and J. Yao, “Competitive adsorption phenomenon in shale gas displacement processes,” #emph[RSC Adv.], vol. 9, pp. 25326--25335, 2019, doi: #link("https://doi.org/10.1039/C9RA04963K")[10.1039/C9RA04963K].

] <ref-C9RA04963K>
#block[
\[27\] J. Liu, T. Zhang, and S. Sun, “Mechanism analysis of shale gas adsorption under carbon dioxide--moisture conditions: A molecular dynamic study,” #emph[Energy & Fuels], vol. 36, no. 24, pp. 14865--14873, 2022, doi: #link("https://doi.org/10.1021/acs.energyfuels.2c03244")[10.1021/acs.energyfuels.2c03244].

] #label("ref-doi:10.1021/acs.energyfuels.2c03244")
#block[
\[28\] M. Yiannourakou #emph[et al.], “Molecular simulation of adsorption in microporous materials,” #emph[Oil & Gas Science and Technology--Revue d'IFP Energies nouvelles], vol. 68, no. 6, pp. 977--994, 2013.

] <ref-yiannourakou2013molecular>
#block[
\[29\] M. Turchi, S. Galmarini, and I. Lunati, “Amorphous matters: Heterogeneity and defects of nanopore silica surfaces enhance CO2 adsorption,” #emph[Journal of Non-Crystalline Solids], vol. 624, p. 122709, 2024, doi: #link("https://doi.org/10.1016/j.jnoncrysol.2023.122709").

] <ref-TURCHI2024122709>
#block[
\[30\] R. T. Cygan, J.-J. Liang, and A. G. Kalinichev, “Molecular models of hydroxide, oxyhydroxide, and clay phases and the development of a general force field,” #emph[The Journal of Physical Chemistry B], vol. 108, no. 4, pp. 1255--1266, 2004, doi: #link("https://doi.org/10.1021/jp0363287")[10.1021/jp0363287].

] #label("ref-doi:10.1021/jp0363287")
#block[
\[31\] H. Wang, L. Zhang, J. Han, and E. Weinan, “DeePMD-kit: A deep learning package for many-body potential energy representation and molecular dynamics,” #emph[Computer Physics Communications], vol. 228, pp. 178--184, 2018.

] <ref-wang2018deepmd>
#block[
\[32\] H. Sui #emph[et al.], “Competitive sorption of CO2/CH4 and CO2 capture on modified silica surfaces: A molecular simulation,” #emph[Science of The Total Environment], vol. 908, p. 168356, 2024.

] <ref-sui2024competitive>
#block[
\[33\] X. Deng, N. Fang, X. Liu, M. Li, P. Xu, and Z. Chen, “Mineralization adsorption of CO2 in composite feldspar reservoirs with enhanced shale gas recovery by molecular simulations,” #emph[Energy & Fuels], vol. 38, no. 14, pp. 12777--12790, 2024.

] <ref-deng2024mineralization>
#block[
\[34\] J. M. Stallons and E. Iglesia, “Simulations of the structure and properties of amorphous silica surfaces,” #emph[Chemical Engineering Science], vol. 56, no. 14, pp. 4205--4216, 2001, doi: #link("https://doi.org/10.1016/S0009-2509(01)00021-5").

] <ref-STALLONS20014205>
#block[
\[35\] R. Manokaran, D. Farrusseng, and B. Coasne, “Molecular simulation of cyclohexane in nanoporous materials: Adsorption of conformers and coadsorption with water and carbon dioxide,” #emph[Langmuir], vol. 40, no. 42, pp. 22027--22036, 2024, doi: #link("https://doi.org/10.1021/acs.langmuir.4c02136")[10.1021/acs.langmuir.4c02136].

] #label("ref-doi:10.1021/acs.langmuir.4c02136")
#block[
\[36\] H. Long #emph[et al.], “Adsorption and diffusion characteristics of CH4, CO2, and N2 in micropores and mesopores of bituminous coal: Molecular dynamics,” #emph[Fuel], vol. 292, p. 120268, 2021.

] <ref-long2021adsorption>
#block[
\[37\] L. Liu and S. K. Bhatia, “Molecular simulation of CO2 adsorption in the presence of water in single-walled carbon nanotubes,” #emph[The Journal of Physical Chemistry C], vol. 117, no. 26, pp. 13479--13491, 2013.

] <ref-liu2013molecular>
#block[
\[38\] P. Vashishta, R. K. Kalia, J. P. Rino, and I. Ebbsjö, “Interaction potential for $upright(S i O)_2$: A molecular-dynamics study of structural correlations,” #emph[Phys. Rev. B], vol. 41, pp. 12197--12209, Jun. 1990, doi: #link("https://doi.org/10.1103/PhysRevB.41.12197")[10.1103/PhysRevB.41.12197].

] <ref-PhysRevB.41.12197>
#block[
\[39\] F. S. Emami #emph[et al.], “Force field and a surface model database for silica to simulate interfacial properties in atomic resolution,” #emph[Chemistry of Materials], vol. 26, no. 8, pp. 2647--2658, 2014, doi: #link("https://doi.org/10.1021/cm500365c")[10.1021/cm500365c].

] #label("ref-doi:10.1021/cm500365c")
#block[
\[40\] S. Plimpton, “Fast parallel algorithms for short-range molecular dynamics,” #emph[Journal of Computational Physics], vol. 117, no. 1, pp. 1--19, 1995.

] <ref-plimpton1995fast>
#block[
\[41\] A. C. Van Duin, S. Dasgupta, F. Lorant, and W. A. Goddard, “ReaxFF: A reactive force field for hydrocarbons,” #emph[The Journal of Physical Chemistry A], vol. 105, no. 41, pp. 9396--9409, 2001.

] <ref-van2001reaxff>
#block[
\[42\] C. Zou and A. Van Duin, “Investigation of complex iron surface catalytic chemistry using the ReaxFF reactive force field method,” #emph[Jom], vol. 64, pp. 1426--1437, 2012.

] <ref-zou2012investigation>
#block[
\[43\] J. L. F. Abascal and C. Vega, “A general purpose model for the condensed phases of water: TIP4P/2005,” #emph[The Journal of Chemical Physics], vol. 123, no. 23, p. 234505, Dec. 2005.

] <ref-abascal2005general>
#block[
\[44\] J. J. Potoff and J. I. Siepmann, “Vapor--liquid equilibria of mixtures containing alkanes, carbon dioxide, and nitrogen,” #emph[AIChE journal], vol. 47, no. 7, pp. 1676--1682, 2001.

] <ref-potoff2001vapor>
#block[
\[45\] J. Wisniak, “Daniel berthelot. Part i. Contribution to thermodynamics,” #emph[Educación quı́mica], vol. 21, no. 2, pp. 155--162, 2010.

] <ref-wisniak2010daniel>
#block[
\[46\] T. D. Kühne #emph[et al.], “CP2K: An electronic structure and molecular dynamics software package-quickstep: Efficient and accurate electronic structure calculations,” #emph[The Journal of Chemical Physics], vol. 152, no. 19, p. 194103, May 2020.

] <ref-kuhne2020cp2k>
#block[
\[47\] J. VandeVondele and J. Hutter, “An efficient orbital transformation method for electronic structure calculations,” #emph[The Journal of chemical physics], vol. 118, no. 10, pp. 4365--4369, 2003.

] <ref-vandevondele2003efficient>
#block[
\[48\] G. Lippert, J. Hutter, and M. Parrinello, “The gaussian and augmented-plane-wave density functional method for ab initio molecular dynamics simulations,” #emph[Theoretical Chemistry Accounts], vol. 103, pp. 124--140, 1999.

] <ref-lippert1999gaussian>
#block[
\[49\] J. VandeVondele and J. Hutter, “Gaussian basis sets for accurate calculations on molecular systems in gas and condensed phases,” #emph[The Journal of Chemical Physics], vol. 127, no. 11, p. 114105, Sep. 2007.

] <ref-vandevondele2007gaussian>
#block[
\[50\] J. P. Perdew, K. Burke, and M. Ernzerhof, “Generalized gradient approximation made simple,” #emph[Physical review letters], vol. 77, no. 18, p. 3865, 1996.

] <ref-perdew1996generalized>
#block[
\[51\] S. Grimme, “Semiempirical GGA-type density functional constructed with a long-range dispersion correction,” #emph[Journal of computational chemistry], vol. 27, no. 15, pp. 1787--1799, 2006.

] <ref-grimme2006semiempirical>
#block[
\[52\] C. Knight, G. E. Lindberg, and G. A. Voth, “Multiscale reactive molecular dynamics,” #emph[The Journal of Chemical Physics], vol. 137, no. 22, p. 22A525, Aug. 2012.

] <ref-knight2012multiscale>
#block[
\[53\] S. Goedecker, M. Teter, and J. Hutter, “Separable dual-space gaussian pseudopotentials,” #emph[Physical Review B], vol. 54, no. 3, p. 1703, 1996.

] <ref-goedecker1996separable>
#block[
\[54\] D.-Y. Peng and D. B. Robinson, “A new two-constant equation of state,” #emph[Industrial & Engineering Chemistry Fundamentals], vol. 15, no. 1, pp. 59--64, 1976.

] <ref-peng1976new>
#block[
\[55\] I. Gomaa, J. Guerrero, Z. Heidari, and D. N. Espinoza, “Experimental measurements and molecular simulation of carbon dioxide adsorption on carbon surface,” in #emph[SPE annual technical conference and exhibition?], SPE, 2022, p. D011S018R002.

] <ref-gomaa2022experimental>
#block[
\[56\] M. Şahin, Y. Arslan, and F. Tomul, “Adsorption, oxidation, kinetic and thermodynamic studies of methyl orange by magnetic Fe3O4 NPs and their chitosan/alginate nanocomposites,” #emph[International Journal of Environmental Analytical Chemistry], pp. 1--20, 2022.

] <ref-csahin2022adsorption>
#block[
\[57\] K. Narasimharao #emph[et al.], “Fe3O4\@ date seeds powder: A sustainable nanocomposite material for wastewater treatment,” #emph[Journal of Materials Research and Technology], vol. 18, pp. 3581--3597, 2022.

] <ref-narasimharao2022fe3o4>
#block[
\[58\] M. S. Shafeeyan, W. M. A. W. Daud, A. Shamiri, and N. Aghamohammadi, “Modeling of carbon dioxide adsorption onto ammonia-modified activated carbon: Kinetic analysis and breakthrough behavior,” #emph[Energy & Fuels], vol. 29, no. 10, pp. 6565--6577, 2015.

] <ref-shafeeyan2015modeling>
#block[
\[59\] A. Marczewski, “Application of mixed order rate equations to adsorption of methylene blue on mesoporous carbons,” #emph[Applied Surface Science], vol. 256, no. 17, pp. 5145--5152, 2010.

] <ref-marczewski2010application>
#block[
\[60\] J. Shi, L. Gong, S. Sun, Z. Huang, B. Ding, and J. Yao, “Competitive adsorption phenomenon in shale gas displacement processes,” #emph[Rsc Advances], vol. 9, no. 44, pp. 25326--25335, 2019.

] <ref-shi2019competitive>
#block[
\[61\] S. Izvekov and G. A. Voth, “Ab initio molecular-dynamics simulation of aqueous proton solvation and transport revisited,” #emph[The Journal of Chemical Physics], vol. 123, no. 4, p. 044505, Aug. 2005.

] <ref-izvekov2005ab>
#block[
\[62\] G. Zundel, “Hydration structure and intermolecular interaction in polyelectrolytes,” #emph[Angewandte Chemie International Edition in English], vol. 8, no. 7, pp. 499--509, 1969.

] <ref-zundel1969hydration>
#block[
\[63\] N. Agmon, “The grotthuss mechanism,” #emph[Chemical Physics Letters], vol. 244, no. 5--6, pp. 456--462, 1995.

] <ref-agmon1995grotthuss>
#block[
\[64\] I. Gomaa, J. Guerrero, Z. Heidari, and D. N. Espinoza, “Experimental measurements and molecular simulation of carbon dioxide adsorption on carbon surface,” #emph[SPE Reservoir Evaluation & Engineering], pp. 1--14, 2023.

] <ref-gomaa2023experimental>
] <refs>
