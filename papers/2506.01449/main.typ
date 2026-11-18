// Adapted from arXiv:2506.01449v1 LaTeX by López et al. (CC BY 4.0).
// https://arxiv.org/abs/2506.01449v1
// https://creativecommons.org/licenses/by/4.0/
#set page(paper: "a4", margin: 20mm)
#set text(size: 10pt, lang: "en")
#set par(justify: true)
#set heading(numbering: "I.A")
#set math.equation(numbering: "(1)")
#set table(inset: 3pt, stroke: (y: 0.25pt + luma(215)))
#title[Machine Learning-Guided Discovery of Temperature-Induced Solid-Solid Phase Transitions in Inorganic Materials]
#align(center)[Cibrán López, Joshua Ojih, Ming Hu, Josep-Lluís Tamarit, Edgardo Saucedo, Claudio Cazorla]
#align(center)[#text(size: 8pt)[Group of Characterization of Materials, Departament de Física, Universitat Politècnica de Catalunya, Campus Diagonal Besòs, Av. Eduard Maristany 10--14, 08019 Barcelona, Spain \
Research Center in Multiscale Science and Engineering, Universitat Politècnica de Catalunya, Campus Diagonal-Besòs, Av. Eduard Maristany 10--14, 08019 Barcelona, Spain \
Department of Mechanical Engineering, University of South Carolina, Columbia, SC 29208, USA \
Micro and Nanotechnologies Group, Emerging Thin Film Photovoltaics Lab, Departament d'Enginyeria Electrònica, Universitat Politècnica de Catalunya, Campus Diagonal Besòs, Av. Eduard Maristany 10-14, 08019 Barcelona, Spain]]

*Abstract.* Predicting solid-solid phase transitions remains a long-standing challenge in materials science. Solid-solid transformations underpin a wide range of functional properties critical to energy conversion, information storage, and thermal management technologies. However, their prediction is computationally intensive due to the need to account for finite-temperature effects. Here, we present an uncertainty-aware machine-learning-guided framework for high-throughput prediction of temperature-induced polymorphic phase transitions in inorganic crystals. By combining density functional theory calculations with graph-based neural networks trained to estimate vibrational free energies, we screened a curated dataset of $tilde.op 50 \, 000$ inorganic compounds and identified over $2 \, 000$ potential solid-solid transitions within the technologically relevant temperature interval $300$--$600$~K. Among our key findings, we uncover numerous phase transitions exhibiting large entropy changes ($> 300$~J~K$""^(- 1)$~kg$""^(- 1)$), many of which occur near room temperature hence offering strong potential for solid-state cooling applications. We also identify $21$ compounds that exhibit substantial relative changes in lattice thermal conductivity ($20$--$70$%) across a phase transition, highlighting them as promising thermal switching materials. Validation against experimental observations and first-principles calculations supports the robustness and predictive power of our approach. Overall, this work establishes a scalable route to discover functional phase-change materials under realistic thermal conditions, and lays the foundation for future high-throughput studies leveraging generative models and expanding open-access materials databases. \
#strong[Keywords:] solid-solid phase transitions, machine learning, first-principles calculations, high-throughput screening, solid-state cooling, thermal switching, inorganic crystals

= Introduction
<sec:intro>
Solid-solid phase transitions play a crucial role in governing a wide range of physical phenomena and underpin numerous technological applications. For example, polymorphic transitions in crystalline materials influence mechanical properties in metallurgy, as seen in the martensitic transformation of steel, which enhances its strength and toughness. In functional materials, phase transitions enable key applications, such as the ferroelectric-paraelectric transition in BaTiO$""_3$, which is essential for capacitors, or the shape-memory effect in NiTi alloys used in medical devices. The ability to control and predict these phase transitions is fundamental for optimizing material performance in areas ranging from structural engineering to electronic and energy technologies.

During a phase transition a material undergoes a transformation between different states of matter (e.g., solid to liquid) or structural phases (e.g., martensitic transformation) due to changes in external conditions such as temperature, pressure, or composition [#link(<ref-1>)[1], #link(<ref-2>)[2], #link(<ref-3>)[3], #link(<ref-4>)[4]]. These phase transitions are broadly classified into first-order and second-order types: first-order transitions involve latent heat and discontinuous changes in order parameters, as seen in melting, while second-order transitions occur continuously without latent heat, as in ferromagnetic to paramagnetic transitions. The nature of a phase transition is governed by underlying thermodynamic and atomistic mechanisms, which can be described using concepts from quantum physics, statistical mechanics and symmetry breaking. Understanding phase transitions is essential for predicting crystal properties and designing advanced functional materials.

#figure(image("graphics/figure1.png", width: 80.0%),
  caption: [
    #strong[Machine learning-guided high-throughput approach for prediction of solid-solid phase transitions in inorganic crystals.] #strong[a.]~Sketch of the employed computational workflow relying on DFT and vibrational free-energy calculations. #strong[b.]~Diagram of a graph encoding a crystal structure. The graph is characterized by nodes (dots), edges (lines), and a cutoff distance ($R$, dashed line). #strong[c.]~Determination of temperature-induced phase transitions, both stable and metastable, based on free-energy curve calculations.
  ]
)
<fig1>

Phase transitions can occur under a broad range of thermodynamic conditions, including variations in temperature, pressure, and external fields, making their precise characterization inherently complex. Crucially, the occurrence and nature of these transitions cannot always be predicted solely from a material's chemical composition or atomic structure, as they often arise from intricate many-body interactions and thermal effects. This lack of predictability poses a significant challenge for the rational design of materials as, for example, unexpected phase transitions may hinder or alter their intended functionality. Thus, the difficulty in foreseeing phase behavior limits the discovery of novel physical phenomena and constrains the development of advanced technological applications.

Despite the challenges in predicting phase transitions, several well-established theoretical and computational approaches have been developed to accurately model and anticipate solid-solid phase transformations [#link(<ref-5>)[5], #link(<ref-6>)[6], #link(<ref-7>)[7], #link(<ref-8>)[8]]. Methods such as free-energy calculations, Monte Carlo and molecular dynamics simulations enable the quantitative evaluation of phase stability by capturing the interplay between enthalpic and entropic contributions. However, achieving reliable predictions requires extremely high numerical accuracy, as small errors in energy estimations can lead to significant deviations in transition temperatures and stability trends. Consequently, these techniques demand rigorous computational protocols to ensure the precise determination of phase behavior in materials.

Furthermore, the computational cost associated with free-energy calculations and molecular dynamics simulations is substantial, as these methods require extensive sampling and highly accurate energy and forces evaluations. Consequently, their application is often limited to specific case studies rather than large-scale, high-throughput screenings of extensive material datasets. This technical constraint significantly hinders the systematic exploration of phase behavior across diverse material families, limiting the discovery of novel physical phenomena and emergent functionalities. As a result, promising materials with transformative technological potential may remain unexplored due to the prohibitive computational demands of current predictive approaches.

In this study, we have developed a computational framework that combines first-principles calculations with machine-learning techniques to overcome the limitations of conventional phase transition predictions. Specifically, we integrate density functional theory (DFT) energy calculations with uncertainty-aware machine-learning-assisted quasi-harmonic free-energy evaluations, enabling the systematic and high-throughput prediction of temperature-induced solid-solid phase transitions. By applying this approach to a dataset of approximately $50 \, 000$ inorganic materials, we have identified around $2 \, 000$ polymorphic phase transitions, some of which present potential technological relevance. Using these predictions, we propose novel materials for two distinct thermal management applications: solid-state cooling and thermal conductivity switching. Our findings not only identify promising phase transitions for energy-related technologies but also establish a scalable and efficient computational strategy for materials discovery under realistic finite-temperature conditions.

= Computational Approach
<sec:approach>
We present a novel high-throughput methodology for predicting temperature-induced solid-solid phase transitions in crystals. By integrating first-principles DFT calculations with uncertainty-aware, machine-learning-assisted quasi-harmonic free-energy evaluations, this approach enables a robust and reliable prediction of vibrational free energies.

== Quasi-harmonic free-energy formalism
<subsec:free-energy>
In the quasi-harmonic (QH) approximation [#link(<ref-9>)[9], #link(<ref-10>)[10], #link(<ref-11>)[11]], the Helmholtz free energy of a nonmetallic and nonmagnetic crystal, $F$, is expressed as a function of volume ($V$) and temperature ($T$) like:

$ F \( V \, T \) = E_0 \( V \) + F_(upright(v)) \( V \, T \) med \, $ <eq:fener>

where $E_0$ is the static lattice energy at zero temperature, and $F_(upright(v))$ is the vibrational free energy (#link(<fig1>)[Figure 1a]). The static lattice energy can be directly computed using first-principles methods such as density functional theory (DFT), $E_0 = E_(upright(D F T))$. Similarly, the vibrational free energy can be obtained from the crystal's phonon frequencies, $omega_(bold(q) s) \( V \)$, as:

$ F_(upright(v)) \( V \, T \) = k_B T sum_(bold(q) s) ln [2 sinh (frac(ℏ omega_(bold(q) s), 2 k_(upright(B)) T))] med \, $ <eq:fharm>

where the summation extends over the reciprocal-space vectors in the Brillouin zone, $bold(q)$, and phonon branches, $s$. It is important to note that the QH approach is applicable only to vibrationally stable systems with strictly positive phonon frequencies, as imaginary (or negative) frequencies render $F_(upright(v))$ ill-defined.

Once $F$ is known, any thermodynamic quantity can be derived from it. For example, the pressure is given by $P = - (partial F \/ partial V)_T$, and the entropy by $S = - (partial F \/ partial T)_V$. At zero pressure, a phase transition between two polymorphs, $A$ and $B$, occurs at the transition temperature $T_t$ when their Helmholtz free energies are equal:

$ F_A \( V_A \, T_t \) = F_B \( V_B \, T_t \) med \, $ <eq:trans>

and the volume of the two polymorphs fulfill the condition $P_A \( V_A \) = P_B \( V_B \) = 0$. When $F_A$ and $F_B$ are known, these conditions enable the numerical determination of $T_t$ (#link(<fig1>)[Figure 1c]).

In this study, we apply the free-energy criterion in Eq.(@eq:trans) to estimate phase transition temperatures, assuming that the equilibrium volume of the crystals remains constant with temperature (i.e., neglecting thermal expansion effects). A phase transition can occur between the most stable phase and the lowest free-energy metastable polymorph, in which case we refer to it as a "stable" phase transition. Conversely, when a transition occurs between two metastable polymorphs, we refer to it as a "metastable" phase transition (#link(<fig1>)[Figure 1c]).

#figure(image("graphics/figure2.png", width: 90.0%),
  caption: [
    #strong[Element count on the 6,674 compounds comprising the employed DFT phonons dataset.] The dataset spans over $79$ chemical elements of the periodic table. Most abundant atomic species in the DFT phonons dataset are oxygen, sulfur, selenium, lithium, sodium and potassium.
  ]
)
<fig2>

== Phase-transition screening strategy
<subsec:strategy>
Our high-throughput search for solid-solid phase transitions was conducted using the Materials Project database [#link(<ref-12>)[12]], which contains over $170 \, 000$ inorganic crystal structures along with their static lattice energies computed with DFT methods, $E_(upright(D F T))^(upright(M P))$. By restricting our selection to nonmetallic and nonmagnetic materials (since electronic and spin entropy contributions have been systematically disregarded throughout this work) composed exclusively of earth-abundant elements, we reduced the pool of surveyed compounds to approximately $50 \, 000$.

Predicting temperature-induced phase transitions between different polymorphs of the same material requires knowledge of their vibrational free energies, which, in turn, depend on their full phonon spectra. However, performing phonon calculations for such a large number of structures is computationally prohibitive. To overcome this challenge, we developed an advanced and accurate machine-learning (ML) model to estimate vibrational free energies, $F_(upright(v))^(upright(M L))$, directly from atomic structure and composition (Sec.@subsec:ml-fv). This approach allowed us to approximate the Helmholtz free energy of each crystal structure in our dataset as (#link(<fig1>)[Figure 1a]):

$ F \( V \, T \) approx E_(upright(D F T))^(M P) \( V \) + F_(upright(v))^(upright(M L)) \( V \, T \) med . $ <eq:fenerapprox>

#figure(image("graphics/figure3.png", width: 100.0%),
  caption: [
    #strong[Performance and validation of the developed ML vibrational free-energy model.] #strong[a.]~Parity plot showing computed versus predicted vibrational free energies for the train, validation, and test datasets, demonstrating excellent agreement across all datasets. Temperature-dependent vibrational free-energy predictions (dots) for #strong[b.]~three polymorphs of MgS and #strong[c.]~two polymorphs of NaH, compared with DFT-derived $F_(upright(v))$ values (solid lines). Error bars denote uncertainty estimates based on latent-space graph distances.
  ]
)
<fig3>

== ML vibrational free-energy model
<subsec:ml-fv>
Graph convolutional neural networks (GCNN) were selected to develop our ML-based vibrational free-energy model (Methods). Graphs, consisting of nodes (describing atoms) and edges (describing interatomic forces), are well-suited for representing materials due to their invariance under rotation, reflection, and translation operations (Fig.~#link(<fig1>)[Figure 1b]). In GCNN, convolutional layers facilitate message passing between nodes, aggregating information from neighboring atoms and updating node embeddings based on the graph structure. Stacking multiple convolutional layers enables the model to capture increasingly complex interactions and atomic dependencies in crystals [#link(<ref-13>)[13]].

Our ML model, $F_(upright(v))^(upright(M L))$, is designed to predict the vibrational free energy of a given crystal structure across the temperature interval $200 lt.eq T lt.eq 700$~K. To achieve high accuracy, we employed a DFT-calculated dataset comprising $6 \, 674$ well-behaved full phonon spectra (i.e., without imaginary frequencies) spanning a diverse range of materials (@fig2) [#link(<ref-14>)[14], #link(<ref-15>)[15]]. The training, validation, and testing of $F_(upright(v))^(upright(M L))$ were conducted using the $F_(upright(v))$ curves (Eq.~@eq:fharm) extracted from this extensive and reliable phonon dataset.

Overall, the performance of our $F_(upright(v))^(upright(M L))$ model is very good within the whole range of considered vibrational free energies, which approximately extends from $- 400$ to $200$~meV/atom (#link(<fig3>)[Figure 3a]). For training, validating and testing purposes, we used a $80$%, $10$% and $10$% of the DFT phonon dataset, respectively. Our final ML model achieves a root mean square error of $8.23$, $11.34$, $12.31$~meV/atom for training, validation and testing, respectively. These values are comparable in size to the typical numerical uncertainties encountered in QH free-energy DFT calculations [#link(<ref-11>)[11]].

For a given crystal structure, our $F_(upright(v))^(upright(M L))$ model predicts its vibrational free energy at a set of discrete temperature points. To obtain a continuous and differentiable vibrational free-energy function, which is crucial for accurately determining phase transition temperatures and deriving thermodynamic quantities such as the entropy, we fitted the predicted free-energy values to a simple polynomial function of the form:

$ F_(upright(v))^(upright(M L)) \( T \) approx alpha + beta T^2 + gamma T^4 med \, $ <eq:smoothing>

where $alpha$, $beta$ and $gamma$ are real-value parameters. This polynomial smoothing function is physically motivated, as it ensures the correct behavior of key thermodynamic quantities, such as the vibrational entropy ($S_(upright(v)) = - partial F_(upright(v)) \/ partial T$) and heat capacity ($C_(upright(v)) \/ T = - partial^2 F_(upright(v)) \/ partial T^2$), particularly in the zero-temperature limit.

#link(<fig3>)[Figure 3b],c present validation tests for our $F_(upright(v))^(upright(M L))$ model using materials not included in the DFT phonon dataset considered for training. Specifically, we compare the model predictions with DFT-calculated vibrational free energies for three polymorphs of MgS (Fig.~#link(<fig3>)[Figure 3b]) and two polymorphs of NaH (Fig.~#link(<fig3>)[Figure 3c]). These materials were selected from the Materials Project database [#link(<ref-12>)[12]] based on their chemical simplicity and consistency with the presence of atomic species in the training dataset. As shown in the figures, the predictions of the $F_(upright(v))^(upright(M L))$ model (dots) exhibit excellent agreement with the DFT-calculated vibrational free energies (solid lines). Notably, the model accurately captures vibrational free-energy differences between polymorphs of the same compound, an essential feature for predicting reliable phase transitions.

To evaluate the reliability of our $F_(upright(v))^(upright(M L))$ model in predicting vibrational free energies for materials not included in the original DFT phonon dataset, we incorporated uncertainty quantification (UQ) in our analysis (e.g., error bars in Figs.#link(<fig3>)[Figure 3b],c). Our UQ approach assesses the similarity between a given material and those in the DFT phonon dataset using hyper-representation metrics, as we elaborate further below.

== Uncertainty quantification
<subsec:uncertainty>
State-of-the-art uncertainty quantification (UQ) techniques primarily address the epistemic component of predictive uncertainty [#link(<ref-16>)[16]]. Broadly, these approaches fall into two categories: (i)~methods that directly probe model architecture limitations, often paired with calibration techniques [#link(<ref-17>)[17]], and (ii)~methods that assess the similarity between new inputs and the training data.

Bayesian frameworks remain among the most established UQ strategies [#link(<ref-18>)[18]], incorporating probabilistic distributions into model parameters to estimate uncertainty. Similarly, ensemble learning methods, based on aggregating predictions from independently trained models or leveraging stochastic training procedures (e.g., dropout), offer robust uncertainty estimates. However, these approaches are often computationally prohibitive for large-scale applications.

More recently, latent space-based UQ methods have emerged as a promising alternative [#link(<ref-19>)[19]]. These approaches assess uncertainty by quantifying the similarity between latent embeddings of target and training data. GCNN, in particular, are well-suited to this task [#link(<ref-20>)[20], #link(<ref-21>)[21]], owing to their ability to capture complex structural and chemical relationships. Despite this potential, the field still lacks standardized, systematic metrics for evaluating distances in latent space, limiting broader adoption.

In this work, we adopt a latent distance-based UQ strategy. Specifically, we extract the hyper-representation vector generated by the GCNN after the pooling layer and quantify uncertainty as the square root of the Euclidean distance between this vector and the latent embeddings of materials in the dataset. This comparison spans the training, validation, and test sets, provided the model performs reliably on the latter. Our streamlined UQ approach enables efficient estimation of the accuracy of predicted vibrational free energies, accounting for both the chemical composition and temperature conditions of each prediction (Figs.#link(<fig3>)[Figure 3b],c).

*Table 1.* #strong[Stable polar-nonpolar phase transitions predicted to occur in the temperature interval $300 lt.eq T_t lt.eq 350$~K.] The low-$T$ polymorph corresponds to "Phase 1" and the high-$T$ polymorph to "Phase 2". "P" and "NP" stand for polar and nonpolar structures, respectively. $T_t$ and $Delta S_t$ stand for phase-transition temperature and entropy change, respectively.

#figure(
  align(center)[#table(
    columns: 5,
    align: (center,center,center,center,center,),
    [], [], [], [], [],
    [Compound], [Phase~1], [Phase~2], [$T_t$~(K)], [$Delta S_t$~(J~K$""^(- 1)$~kg$""^(- 1)$)],
    [], [], [], [], [],
    [], [], [], [], [],
    [CsGaP$""_3$HO$""_10$], [C2~(P)], [P2/c~(NP)], [306.9], [93.6],
    [Ta$""_3$Bi$""_7$O$""_18$], [P1~(P)], [C2/m~(NP)], [307.3], [15.5],
    [CaZn$""_2$\(PO$""_5$)$""_2$], [Pca2$""_1$~(P)], [Pbcn~(NP)], [309.2], [135.8],
    [ZrSeO], [P2$""_1$3~(P)], [P4/nmm~(NP)], [311.7], [70.1],
    [WSe$""_2$], [P6$""_3$/mmc~(NP)], [P$overline(6)$m2~(P)], [312.5], [34.2],
    [Li$""_3$TiFe$""_3$O$""_8$], [P6$""_3$mc~(P)], [R$overline(3)$m~(NP)], [313.0], [152.9],
    [K$""_2$Ti(Si$""_2$O$""_5$)$""_3$], [P$overline(1)$~(NP)], [Cc~(P)], [313.1], [26.5],
    [Ba$""_2$MgCrMoO$""_6$], [Immm~(NP)], [Cm~(P)], [313.5], [40.7],
    [BaZn$""_2$Si$""_2$O$""_7$], [Cmc2$""_1$~(P)], [Cmcm~(NP)], [314.5], [53.2],
    [Li$""_5$Mn$""_5$\(SeO$""_3$)$""_8$], [P1~(P)], [P$overline(1)$~(NP)], [314.7], [34.5],
    [CaAl$""_2$SiO$""_6$], [P2/c~(NP)], [C2~(P)], [318.9], [53.6],
    [Ba$""_2$SrI$""_6$], [P2$""_1$/c~(NP)], [P$overline(4)$b2~(P)], [321.1], [18.0],
    [BaYNbSnO$""_6$], [P$overline(1)$~(NP)], [P222~(P)], [321.4], [14.9],
    [LiAgF$""_2$], [R$overline(3)$m~(NP)], [C2~(P)], [322.2], [69.0],
    [Li$""_3$CoPCO$""_7$], [P2$""_1$~(P)], [P2$""_1$/m~(NP)], [322.5], [59.5],
    [Si(PbO$""_2$)$""_2$], [C2/c~(NP)], [C2~(P)], [322.8], [9.8],
    [Y$""_2$Zr$""_2$O$""_7$], [Fd$overline(3)$m~(NP)], [P2$""_1$~(P)], [323.6], [18.8],
    [LiGa(H$""_2$N)$""_4$], [P2$""_1$~(P)], [P2$""_1$/c~(NP)], [324.0], [50.9],
    [LiBi$""_3$\(IO$""_2$)$""_2$], [Cmcm~(NP)], [Amm2~(P)], [324.2], [17.4],
    [LiBiB$""_2$O$""_5$], [C2/c~(NP)], [C2~(P)], [325.1], [50.4],
    [Mn$""_3$Zn$""_2$O$""_8$], [P6$""_3$mc~(P)], [C2/m~(NP)], [326.0], [85.9],
    [Li$""_3$Cr(CoO$""_3$)$""_2$], [P$overline(1)$~(NP)], [P1~(P)], [328.5], [57.5],
    [LiAl(Si$""_2$O$""_5$)$""_2$], [Pc~(P)], [P2/c~(NP)], [332.6], [51.9],
    [Cs$""_3$Sb$""_2$Cl$""_9$], [P$overline(3)$m1~(NP)], [P321~(P)], [333.0], [7.5],
    [MoWSe$""_4$], [P$overline(3)$m1~(NP)], [P3m1~(P)], [333.3], [5.0],
    [VBi(PbO$""_3$)$""_2$], [P2$""_1$/c~(NP)], [Pc~(P)], [334.4], [9.1],
    [Ba$""_5$P$""_3$O$""_12$F], [P6$""_3$/m~(NP)], [P6$""_3$~(P)], [335.8], [17.4],
    [ErCu(WO$""_4$)$""_2$], [P$overline(1)$~(NP)], [P1~(P)], [337.3], [22.8],
    [LiCr$""_3$O$""_8$], [Pmn2$""_1$~(P)], [C2/m~(NP)], [337.5], [58.0],
    [MgFe$""_4$\(PO$""_4$)$""_4$], [Pm~(P)], [P$overline(1)$~(NP)], [337.9], [33.3],
    [Li$""_2$V$""_2$O$""_5$F$""_2$], [P$overline(1)$~(NP)], [Cc~(P)], [338.2], [117.0],
    [Hg$""_3$\(SCl)$""_2$], [I2$""_1$3~(P)], [Pm$overline(3)$n~(NP)], [339.1], [30.6],
    [TbCuTe$""_2$], [P3m1~(P)], [P$overline(3)$m1~(NP)], [339.1], [25.3],
    [P$""_2$SN$""_3$Cl$""_5$O], [P$overline(1)$~(NP)], [P2$""_1$2$""_1$2$""_1$~(P)], [339.8], [139.2],
    [NaVP$""_2$O$""_7$], [P2$""_1$~(P)], [P2$""_1$/c~(NP)], [340.0], [8.1],
    [K$""_5$HfIn(MoO$""_4$)$""_6$], [R3~(P)], [R$overline(3)$c~(NP)], [340.6], [12.6],
    [KSb$""_2$PO$""_8$], [Cc~(P)], [C2/c~(NP)], [342.3], [18.1],
    [Mn$""_3$\(OF$""_3$)$""_2$], [Pc~(P)], [P$overline(1)$~(NP)], [344.8], [72.4],
    [Li$""_8$\(CoO$""_2$)$""_5$], [P1~(P)], [P$overline(1)$~(NP)], [346.0], [40.5],
    [Li$""_2$MnF$""_6$], [P4$""_2$/mnm~(NP)], [P321~(P)], [346.2], [145.4],
    [NaLi$""_2$FePCO$""_7$], [P$overline(1)$~(NP)], [P1~(P)], [346.4], [84.2],
    [Bi$""_2$W$""_2$O$""_9$], [Pna2$""_1$~(P)], [Pbcn~(NP)], [346.5], [9.3],
    [PNCl$""_2$], [P2$""_1$2$""_1$2$""_1$~(P)], [Pnma~(NP)], [348.5], [338.3],
    [K$""_2$ZnBr$""_4$], [P2$""_1$/m~(NP)], [P2$""_1$~(P)], [349.8], [6.8],
    [], [], [], [], [],
  )]
  , kind: table
  )

*Table 2.* #strong[Stable polar-polar phase transitions predicted to occur in the temperature interval $300 lt.eq T_t lt.eq 350$~K.] The low-$T$ polymorph corresponds to "Phase 1" and the high-$T$ polymorph to "Phase 2". $T_t$ and $Delta S_t$ stand for phase-transition temperature and entropy change, respectively.

#figure(
  align(center)[#table(
    columns: 5,
    align: (center,center,center,center,center,),
    [], [], [], [], [],
    [Compound], [Phase~1], [Phase~2], [$T_t$~(K)], [$Delta S_t$~(J~K$""^(- 1)$~kg$""^(- 1)$)],
    [], [], [], [], [],
    [], [], [], [], [],
    [Fe$""_4$OF$""_7$], [P1], [Cmc2$""_1$], [300.4], [252.1],
    [Mo(WS$""_3$)$""_2$], [P3m1], [P$overline(6)$m2], [302.2], [8.9],
    [DyCuS$""_2$], [P2$""_1$2$""_1$2$""_1$], [P2$""_1$2$""_1$2$""_1$], [302.2], [5.2],
    [Li$""_3$Fe(PO$""_4$)$""_2$], [P2$""_1$], [C2], [305.7], [53.1],
    [SbCl$""_3$F$""_2$], [I4], [I$overline(4)$], [307.4], [8.9],
    [WN$""_2$], [P3$""_1$21], [Pna2$""_1$], [309.3], [15.0],
    [MgTe], [P6$""_3$mc], [F$overline(4)$3m], [309.9], [25.6],
    [VOF$""_3$], [P2$""_1$2$""_1$2$""_1$], [Pc], [310.6], [241.7],
    [MnTeMoO$""_6$], [P2$""_1$2$""_1$2], [P$overline(4)$2$""_1$m], [312.5], [64.5],
    [Nb$""_4$Ag$""_2$O$""_11$], [R3], [R3c], [315.1], [58.4],
    [Li$""_3$V(H$""_4$O$""_3$)$""_4$], [P1], [Pc], [316.1], [122.8],
    [Al$""_3$CrO$""_6$], [R3], [Pc], [318.3], [154.2],
    [LiMoP$""_4$O$""_13$], [P1], [P2$""_1$2$""_1$2$""_1$], [319.8], [56.0],
    [KNb(BO$""_3$)$""_2$], [Pna2$""_1$], [Pmn2$""_1$], [321.6], [195.5],
    [Fe$""_2$P$""_2$O$""_7$], [P1], [P1], [322.3], [12.5],
    [Li$""_2$TiFeO$""_4$], [P1], [P1], [324.3], [16.9],
    [CO], [P2$""_1$2$""_1$2$""_1$], [R3c], [324.9], [161.9],
    [K$""_4$BaTi$""_6$S$""_20$O], [P6$""_3$22], [Fdd2], [325.3], [34.9],
    [MnInF$""_3$], [P1], [R3m], [325.7], [12.9],
    [LiMn$""_3$OF$""_5$], [P1], [Cc], [326.3], [31.3],
    [Li$""_2$V$""_3$WO$""_8$], [P6$""_3$mc], [P1], [329.5], [82.2],
    [La$""_4$FeSe$""_6$O], [P1], [P1], [329.8], [5.0],
    [Ta$""_7$BiO$""_19$], [P$overline(6)$c2], [P6$""_3$22], [330.4], [54.7],
    [K$""_2$Al$""_2$B$""_2$O$""_7$], [C2], [C2], [332.1], [41.8],
    [K$""_2$Zn$""_6$O$""_7$], [P4$""_2$nm], [P4$""_2$nm], [332.3], [34.2],
    [Li$""_6$Mn$""_5$Fe(BO$""_3$)$""_6$], [P1], [Cm], [332.8], [56.8],
    [Na$""_5$Zr$""_4$Si$""_3$\(PO$""_8$)$""_3$], [P1], [R32], [333.2], [35.4],
    [CsGeI$""_3$], [Cm], [Cm], [337.8], [55.4],
    [Sr$""_2$MgZrCrO$""_6$], [P1], [P1], [339.1], [5.1],
    [Li$""_4$MnV$""_3$\(P$""_2$O$""_7$)$""_4$], [P1], [P2$""_1$], [339.6], [83.5],
    [Li$""_5$Cu(PO$""_4$)$""_2$], [P1], [Pm], [341.1], [103.1],
    [ZnTe], [F$overline(4)$3m], [P6$""_3$mc], [342.1], [5.4],
    [Ge$""_3$Pb$""_5$O$""_11$], [P3], [P$overline(6)$], [343.2], [7.4],
    [Mg$""_2$TiO$""_4$], [P4$""_1$22], [P1], [344.4], [209.5],
    [HoFe$""_3$\(BO$""_3$)$""_4$], [P3$""_1$21], [R32], [344.8], [68.9],
    [Li$""_3$MnF$""_7$], [R3m], [P1], [346.6], [342.3],
    [MgFeF$""_4$], [P1], [P1], [347.1], [10.9],
    [MgFe$""_3$Ni$""_2$Sb(PO$""_4$)$""_6$], [P1], [P1], [348.4], [36.8],
    [], [], [], [], [],
  )]
  , kind: table
  )

*Table 3.* #strong[Stable nonpolar-nonpolar phase transitions predicted to occur in the temperature interval $300 lt.eq T_t lt.eq 350$~K.] The low-$T$ polymorph corresponds to "Phase 1" and the high-$T$ polymorph to "Phase 2". $T_t$ and $Delta S_t$ stand for phase-transition temperature and entropy change, respectively.

#figure(
  align(center)[#table(
    columns: 5,
    align: (center,center,center,center,center,),
    [], [], [], [], [],
    [Compound], [Phase~1], [Phase~2], [$T_t$~(K)], [$Delta S_t$~(J~K$""^(- 1)$~kg$""^(- 1)$)],
    [], [], [], [], [],
    [], [], [], [], [],
    [CdSeO$""_3$], [Pnma], [P2$""_1$/c], [301.6], [58.6],
    [NaMnO$""_4$], [Cmcm], [P2$""_1$/c], [302.5], [41.1],
    [Sr$""_2$SnO$""_4$], [Pccn], [Cmce], [304.2], [1.5],
    [CaPbI$""_4$], [C2/m], [P2/m], [304.8], [1.7],
    [K$""_2$FeF$""_5$], [C2/m], [Pbam], [305.0], [31.3],
    [Na$""_4$TiP$""_2$O$""_9$], [Cmme], [P2/c], [305.8], [25.0],
    [Ba(CuS)$""_2$], [Pnma], [I4/mmm], [306.8], [77.6],
    [KLaTiO$""_4$], [Pbcm], [P4/nmm], [306.9], [23.8],
    [Na$""_2$Ti$""_2$O$""_5$], [Pbcn], [C2/m], [309.3], [36.5],
    [Sr$""_2$ZnWO$""_6$], [P$overline(1)$], [P2$""_1$/c], [309.4], [30.6],
    [LiLa$""_4$MnO$""_8$], [I4$""_1$/amd], [Cmmm], [311.4], [2.3],
    [Na$""_2$FePCO$""_7$], [P2$""_1$/m], [P$overline(1)$], [312.0], [137.1],
    [ZnCoO$""_2$], [R$overline(3)$m], [C2/m], [314.0], [127.9],
    [CdPS$""_3$], [C2/m], [R$overline(3)$], [314.2], [28.7],
    [BaYBr$""_5$], [P2$""_1$/c], [C2/c], [314.5], [20.2],
    [Zn$""_2$Ga$""_2$S$""_5$], [R$overline(3)$m], [P6$""_3$/mmc], [315.0], [80.5],
    [NdBO$""_3$], [Pnma], [P$overline(1)$], [316.6], [132.5],
    [Li$""_6$SbS$""_2$], [C2/c], [P2$""_1$/c], [316.7], [41.6],
    [Nd(BO$""_2$)$""_3$], [Pnma], [C2/c], [317.1], [62.1],
    [Li$""_2$Cr$""_2$\(SO$""_4$)$""_3$], [Pbcn], [C2/c], [318.3], [142.6],
    [Li$""_5$AlO$""_4$], [Pbca], [Pmmn], [319.0], [75.6],
    [K$""_2$Mg(CO$""_3$)$""_2$], [R$overline(3)$m], [C2/m], [319.7], [129.0],
    [Li$""_2$Sn$""_2$\(SO$""_4$)$""_3$], [Pbca], [Pbcn], [322.1], [24.5],
    [SrC$""_2$], [C2/c], [I4/mmm], [322.4], [123.4],
    [WCl$""_6$], [P$overline(3)$m1], [R$overline(3)$], [322.8], [8.9],
    [SrCN$""_2$], [R$overline(3)$m], [Pnma], [323.4], [110.0],
    [LiFe$""_3$O$""_4$], [P$overline(1)$], [C2/c], [324.8], [139.7],
    [VBiO$""_4$], [I4$""_1$/a], [I4$""_1$/amd], [327.0], [33.9],
    [W$""_5$\(O$""_2$F$""_11$)$""_2$], [P$overline(1)$], [I4$""_1$/a], [327.2], [12.9],
    [Cs$""_2$Se], [Pnma], [R$overline(3)$m], [327.3], [113.5],
    [Sn$""_2$N$""_2$O], [I4$""_1$/amd], [P$overline(3)$m1], [331.6], [12.3],
    [SeN], [P2$""_1$/c], [C2/c], [331.8], [73.0],
    [MgP$""_2$\(H$""_8$O$""_5$)$""_2$], [I4$""_1$/acd], [P4$""_2$/nmc], [332.7], [44.7],
    [Ba$""_2$SmNbO$""_6$], [Fm$overline(3)$m], [Pn$overline(3)$], [333.2], [5.7],
    [Na$""_2$Al$""_2$B$""_2$O$""_7$], [P2$""_1$/m], [P$overline(3)$1c], [333.3], [52.3],
    [Mg$""_2$PHO$""_5$], [Pnma], [P2$""_1$/c], [334.1], [86.8],
    [V$""_2$FeO$""_6$], [P$overline(1)$], [C2/c], [334.3], [42.9],
    [ZnCl$""_2$], [P4$""_2$/nmc], [P2$""_1$/c], [334.3], [4.2],
    [Li$""_3$Sn$""_2$\(PO$""_4$)$""_3$], [P2$""_1$/c], [R$overline(3)$], [334.7], [149.3],
    [SF$""_6$], [C2/m], [Im$overline(3)$m], [340.4], [130.8],
    [KAlF$""_4$], [P4/mbm], [P4/mmm], [342.4], [55.0],
    [CaSeO$""_4$], [I4$""_1$/a], [Cmce], [344.4], [21.6],
    [P$""_3$\(WO$""_6$)$""_2$], [R$overline(3)$], [P2$""_1$/c], [344.8], [57.0],
    [ErBiW$""_2$O$""_9$], [Pnma], [Pmmn], [345.6], [13.8],
    [Ca(CoS$""_2$)$""_2$], [Fd$overline(3)$m], [I4$""_1$/amd], [345.8], [27.8],
    [LiMn$""_2$F$""_5$], [Cmcm], [Pnnm], [349.8], [31.0],
    [Ba$""_2$SmVO$""_6$], [Fm$overline(3)$m], [Pn$overline(3)$], [349.9], [38.5],
    [Sr$""_2$Bi$""_2$Se$""_3$O$""_2$], [P2$""_1$/c], [C2/m], [350.0], [10.8],
    [], [], [], [], [],
  )]
  , kind: table
  )

#figure(image("graphics/figure4.png", width: 100.0%),
  caption: [
    #strong[Number of predicted solid-solid phase transformations, $N_(P T)$, in the temperature interval $300 lt.eq T_t lt.eq 600$~K expressed as a function of thermodynamic stability, transition temperature and crystal symmetry properties.] #strong[a.]~Number of predicted stable and #strong[b.]~metastable phase transitions. #strong[c.]~Number of predicted phase transitions as a function of stability and symmetry. #strong[d.]~Number of predicted phase transitions as a function of stability and temperature.
  ]
)
<fig4>

#figure(image("graphics/figure5.png", width: 100.0%),
  caption: [
    #strong[Sketch of two thermal management applications in which our solid-solid phase transition predictions may be impactful.] #strong[a.]~Solid-state cooling, an energy efficient and sustainable technology that employs crystals instead of enviromentally harmful gases to refrigerate. #strong[b.]~Thermal switching, where large thermal conductivity changes are engineered for developing novel approaches to energy harvesting and neuromorphic and phononic computing.
  ]
)
<fig5>

= Results
<sec:results>
We begin this section by presenting the general results of our ML-guided high-throughput screening for $T$-induced solid-solid phase transitions in inorganic crystals. Our study confidently predicts a total of $2 \, 079$ polymorphic transformations in the temperature interval $300 lt.eq T lt.eq 600$~K, which are detailed in the Supplementary Material. To ensure reliability, we discarded phase transitions where vibrational free-energy uncertainties exceeded $50$% of the difference $\| Delta F_(upright(v))^(upright(M L)) \| equiv \| F_(upright(v))^(upright(M L)) \( 600 med upright(K) \) - F_(upright(v))^(upright(M L)) \( 300 med upright(K) \) \|$ (Sec.@subsec:uncertainty), as their transition temperatures could not be assessed with confidence. We then highlight two key thermal management applications where our findings could have a significant impact: solid-state cooling and thermal conductivity switching.

== $T$-induced solid-solid phase transitions
<subsec:general>
We predicted $615$ stable phase transitions (#link(<fig1>)[Figure 1c] and Supplementary Material), with $130$ occurring within the technologically relevant temperature interval $300 lt.eq T_t lt.eq 350$~K (#link(<fig4>)[Figure 4a]). Metastable phase transitions (#link(<fig1>)[Figure 1c]) are also of interest, as they can be induced not only by temperature but also by external fields such as pressure or electric bias. Our study identified $1 \, 464$ metastable phase transitions (Supplementary Material), including $218$ within the $300$--$350$~K temperature range (#link(<fig4>)[Figure 4b]).

In this study, we classify the predicted $T$-induced phase transitions according to their thermodynamic stability, transition temperature, and crystal symmetry properties (Figs.#link(<fig4>)[Figure 4c],d). Regarding crystal symmetry, we classify phases as "nonpolar" if they are centrosymmetric and "polar" if they are noncentrosymmetric (e.g., enantiomorphic). Accordingly, phase transitions fall into three main types: "polar-polar", "polar-nonpolar", and "nonpolar-nonpolar". From a functional perspective, polar-nonpolar and polar-polar transitions are particularly interesting (Tables~1 and 2), as they can be induced by external electric fields, similar to ferroelectrics [#link(<ref-22>)[22], #link(<ref-23>)[23], #link(<ref-24>)[24]].

Knowing the latent heat, $L$, of a phase transition is important both from a fundamental perspective and for practical applications. $L$ measures the energy required to induce a phase change in a material without altering its temperature and is directly related to the entropy change of the phase transition via $Delta S_t equiv L \/ T_t$. In materials science, $L$ is crucial for assessing thermal storage capacity, heat management strategies, and the suitability of materials for energy-related phase change applications. For example, materials with large $L$ can be employed in thermal energy storage systems, where energy is absorbed or released during phase transitions. Furthermore, knowledge of $L$ enables classification of the phase transition into first-order (discontinuous, $L eq.not 0$) or second-order (continuous, $L approx 0$). For these reasons, we report the entropy change $Delta S_t$ for most phase transitions predicted in this study (Tables~1--5 and Supplementary Material).

For stable phase transitions, we predict $228$ nonpolar-nonpolar, $214$ polar-nonpolar, and $173$ polar-polar transitions occurring within the $300 lt.eq T_t lt.eq 600$~K range (Figs.#link(<fig4>)[Figure 4a],c). For metastable phase transitions, we identify $440$ nonpolar-nonpolar, $688$ polar-nonpolar, and $336$ polar-polar transitions in the same temperature range (Figs.#link(<fig4>)[Figure 4b],c). In all three categories, metastable transitions outnumber the stable ones. This trend can be attributed to the fact that considering multiple metastable polymorphs increases the number of possible free-energy curve crossings, in contrast to cases where only the most stable phase and a single low-energy metastable structure are included.

Interestingly, phase transitions involving polar phases are significantly more numerous than purely nonpolar-nonpolar ones, in both the stable and metastable sets (#link(<fig4>)[Figure 4c]). For example, within the temperature interval $300 lt.eq T_t lt.eq 350$~K, we predict a total of $92$ stable and $158$ metastable transitions involving polar phases, compared to only $38$ stable and $60$ metastable transitions that are purely nonpolar-nonpolar. Furthermore, we observe a slight decrease in the number of predicted stable transitions with increasing temperature, whereas metastable transitions exhibit the opposite trend, becoming more frequent as temperature rises (Fig.~#link(<fig4>)[Figure 4d]). All $2 \, 079$ polymorphic transformations predicted within the $300 lt.eq T lt.eq 600$~K range, both stable and metastable, are detailed in the Supplementary Material.

Tables~1 and 2 list the stable polar-nonpolar and polar-polar phase transitions occurring in the temperature interval $300 lt.eq T_t lt.eq 350$~K, which could in practice be triggered by an external electric bias. Several key observations emerge from these datasets. First, complex oxide compounds dominate, accounting for approximately $74$% of these transitions. This result aligns with the fact that most known room-temperature polar materials are oxides (e.g., BaTiO$""_3$ and BiFeO$""_3$). And second, many materials in Tables~1 and 2 would typically be overlooked in routine first-principles QHA studies due to their complex compositions (e.g., Na$""_5$Zr$""_4$Si$""_3$\(PO$""_8$)$""_3$ and Ba$""_2$MgCrMoO$""_6$) and low-symmetry crystal structures (e.g., $P 1$ and $P overline(1)$), which significantly increase computational costs.

Nevertheless, the materials and phase transitions listed in Tables~1 and 2 are experimentally worth exploring for several reasons. Notably, many of the transitions reported in Table~1 involve low-$T$ nonpolar phases transforming into high-$T$ polar phases, a reversal of the typical behavior observed in archetypal ferroelectrics, where the high-$T$ phase is usually nonpolar. Moreover, some of the entropy changes associated with polar-nonpolar and polar-polar phase transitions are remarkably large (e.g., $Delta S_t = 342.3$~J~K$""^(- 1)$~kg$""^(- 1)$ for Li$""_3$MnF$""_7$, $Delta S_t = 338.3$~J~K$""^(- 1)$~kg$""^(- 1)$ for PnCl$""_2$ and $Delta S_t = 252.1$~J~K$""^(- 1)$~kg$""^(- 1)$ for Fe$""_4$OF$""_7$), indicating a pronounced first-order character and suggesting potential for electrically controlled thermal management applications.

Table~3 summarizes the stable nonpolar-nonpolar phase transitions predicted to occur within the temperature range $300$--$350$~K. As in previous cases, the reported transitions predominantly involve chemically complex compounds with low crystalline symmetries (e.g., Sr$""_2$ZnWO$""_6$ and Na$""_2$FePCO$""_7$). Interestingly, the entropy changes associated with these near room-temperature phase transitions tend to be smaller than those involving polar phases. For instance, the maximum $Delta S_t$ reported in Table~3 is $149.3$~J~K$""^(- 1)$~kg$""^(- 1)$, compared to $338.3$~J~K$""^(- 1)$~kg$""^(- 1)$ for polar-nonpolar phase transitions (Table~1) and $342.3$~J~K$""^(- 1)$~kg$""^(- 1)$ for polar-polar transformations (Table~2). We tentatively attribute this general trend to the typically higher symmetry of centrosymmetric (nonpolar) phases, which may limit the magnitude of the structural and entropic changes involved in such phase transitions.

The large number of phase transitions predicted in this study spans a broad range of chemical compositions and crystal structures. Validation tests supporting these predictions will be presented in the Discussion section. To maintain focus and offer illustrative insights, we next highlight two key thermal management applications where the outcomes of our ML-guided high-throughput screening could have a significant impact (Fig.~@fig5).

*Table 4.* #strong[Stable phase transformations predicted to occur in the temperature interval $300 lt.eq T_t lt.eq 350$~K with a phase transition entropy change higher than $100$~J~K$""^(- 1)$~kg$""^(- 1)$.] The low-$T$ polymorph corresponds to "Phase 1" and the high-$T$ polymorph to "Phase 2". $T_t$ and $Delta S_t$ stand for phase-transition temperature and entropy change, respectively.

#figure(
  align(center)[#table(
    columns: 5,
    align: (center,center,center,center,center,),
    [], [], [], [], [],
    [Compound], [Phase~1], [Phase~2], [$T_t$~(K)], [$Delta S_t$~(J~K$""^(- 1)$~kg$""^(- 1)$)],
    [], [], [], [], [],
    [], [], [], [], [],
    [Li$""_3$MnF$""_7$], [R3m], [P1], [346.6], [342.3],
    [PNCl$""_2$], [P2$""_1$2$""_1$2$""_1$], [Pnma], [348.5], [338.3],
    [Fe$""_4$OF$""_7$], [P1], [Cmc2$""_1$], [300.4], [252.1],
    [VOF$""_3$], [P2$""_1$2$""_1$2$""_1$], [Pc], [310.6], [241.7],
    [Mg$""_2$TiO$""_4$], [P4$""_1$22], [P1], [344.4], [209.5],
    [KNb(BO$""_3$)$""_2$], [Pna2$""_1$], [Pmn2$""_1$], [321.5], [195.5],
    [CO], [P2$""_1$2$""_1$2$""_1$], [R3c], [324.9], [161.9],
    [Al$""_3$CrO$""_6$], [R3], [Pc], [318.3], [154.2],
    [Li$""_3$TiFe$""_3$O$""_8$], [P6$""_3$mc], [R$overline(3)$m], [313.0], [152.9],
    [Li$""_3$Sn$""_2$\(PO$""_4$)$""_3$], [P2$""_1$/c], [R$overline(3)$], [334.8], [149.3],
    [Li$""_2$MnF$""_6$], [P4$""_2$/mnm], [P321], [346.2], [145.4],
    [Li$""_2$Cr$""_2$\(SO$""_4$)$""_3$], [Pbcn], [C2/c], [318.3], [142.6],
    [LiFe$""_3$O$""_4$], [P$overline(1)$], [C2/c], [324.8], [139.7],
    [P$""_2$SN$""_3$Cl$""_5$O], [P$overline(1)$], [P2$""_1$2$""_1$2$""_1$], [339.8], [139.2],
    [Na$""_2$FePCO$""_7$], [P2$""_1$/m], [P$overline(1)$], [312.0], [137.1],
    [CaZn$""_2$\(PO$""_5$)$""_2$], [Pca2$""_1$], [Pbcn], [309.2], [135.8],
    [NdBO$""_3$], [Pnma], [P$overline(1)$], [316.6], [132.5],
    [SF$""_6$], [C2/m], [Im$overline(3)$m], [340.4], [130.8],
    [K$""_2$Mg(CO$""_3$)$""_2$], [R$overline(3)$m], [C2/m], [319.7], [129.0],
    [ZnCoO$""_2$], [R$overline(3)$m], [C2/m], [314.0], [127.9],
    [SrC$""_2$], [C2/c], [I4/mmm], [322.4], [123.4],
    [Li$""_3$V(H$""_4$O$""_3$)$""_4$], [P1], [Pc], [316.1], [122.8],
    [Li$""_2$V$""_2$O$""_5$F$""_2$], [P$overline(1)$], [Cc], [338.2], [117.0],
    [Cs$""_2$Se], [Pnma], [R$overline(3)$m], [327.3], [113.5],
    [SrCN$""_2$], [R$overline(3)$m], [Pnma], [323.4], [110.0],
    [Li$""_5$Cu(PO$""_4$)$""_2$], [P1], [Pm], [341.1], [103.1],
    [], [], [], [], [],
  )]
  , kind: table
  )

*Table 5.* #strong[Stable polar-nonpolar phase transformations predicted to exhibit a phase transition entropy change higher than $150$~J~K$""^(- 1)$~kg$""^(- 1)$.] The low-$T$ polymorph corresponds to "Phase 1" and the high-$T$ polymorph to "Phase 2". "P" and "NP" stand for polar and nonpolar structures, respectively. $T_t$ and $Delta S_t$ stand for phase-transition temperature and entropy change, respectively.

#figure(
  align(center)[#table(
    columns: 5,
    align: (center,center,center,center,center,),
    [], [], [], [], [],
    [Compound], [Phase~1], [Phase~2], [$T_t$~(K)], [$Delta S_t$~(J~K$""^(- 1)$~kg$""^(- 1)$)],
    [], [], [], [], [],
    [], [], [], [], [],
    [PNF$""_2$], [Pnma~(NP)], [Pna2$""_1$~(P)], [410.8], [360.7],
    [KNO$""_3$], [R3m~(P)], [P2$""_1$/c~(NP)], [539.3], [346.4],
    [PNCl$""_2$], [P2$""_1$2$""_1$2$""_1$~(P)], [Pnma~(NP)], [348.5], [338.3],
    [Li$""_2$FeF$""_5$], [C2/c~(NP)], [P1~(P)], [399.6], [304.4],
    [NaClO$""_4$], [Pnma~(NP)], [I$overline(4)$2m~(P)], [538.3], [294.8],
    [LiP$""_2$WO$""_7$], [P2$""_1$~(P)], [P2$""_1$/c~(NP)], [593.1], [262.8],
    [Cd(C$""_4$N$""_3$)$""_2$], [P31m~(P)], [Pmna~(NP)], [369.9], [259.0],
    [Li$""_2$NiSnO$""_4$], [I$overline(4)$m2~(P)], [C2/c~(NP)], [442.9], [257.6],
    [Li$""_2$VH$""_2$OF$""_5$], [C2/c~(NP)], [P1~(P)], [568.3], [251.4],
    [H$""_2$CBrCl], [P2$""_1$2$""_1$2~(P)], [C2/c~(NP)], [558.1], [247.8],
    [KCSN], [Pbcm~(NP)], [Ima2~(P)], [567.0], [247.5],
    [CsClO$""_4$], [Pnma~(NP)], [F$overline(4)$3m~(P)], [596.6], [235.0],
    [VF$""_4$], [Pc~(P)], [C2/c~(NP)], [486.5], [233.8],
    [LiCu(PO$""_3$)$""_3$], [P2$""_1$2$""_1$2$""_1$~(P)], [P$overline(1)$~(NP)], [576.9], [232.4],
    [LiCuS], [Cc~(P)], [Fddd~(NP)], [467.4], [231.3],
    [V$""_2$FeO$""_4$], [C2/c~(NP)], [P1~(P)], [527.2], [230.6],
    [Li$""_2$VO$""_3$], [C2/m~(NP)], [P1~(P)], [396.6], [218.8],
    [KNO$""_2$], [Imm2~(P)], [P2$""_1$/c~(NP)], [528.8], [196.6],
    [MgFe$""_2$\(CoO$""_2$)$""_4$], [C2/m~(NP)], [P1~(P)], [591.8], [187.9],
    [LiCoSbO$""_4$], [Imma~(NP)], [P4$""_3$22~(P)], [580.8], [179.0],
    [Li$""_2$Ni$""_3$SnO$""_8$], [P4$""_3$2$""_1$2~(P)], [P$overline(1)$~(NP)], [567.8], [177.0],
    [Fe$""_3$OF$""_5$], [C2/m~(NP)], [Pm~(P)], [362.8], [175.5],
    [BeCl$""_2$], [I4$""_1$/acd~(NP)], [I$overline(4)$3m~(P)], [406.3], [171.1],
    [NaNO$""_3$], [R$overline(3)$c~(NP)], [P1~(P)], [429.1], [166.7],
    [LiMnBO$""_3$], [P$overline(6)$~(P)], [P$overline(1)$~(NP)], [510.4], [159.2],
    [Li$""_2$GeF$""_6$], [P4$""_2$/mnm~(NP)], [P321~(P)], [481.5], [159.0],
    [CaCO$""_3$], [P2$""_1$/c~(NP)], [P6$""_5$22~(P)], [370.4], [157.7],
    [Bi(BO$""_2$)$""_3$], [P2$""_1$/c~(NP)], [Pca2$""_1$~(P)], [411.3], [154.6],
    [Li$""_3$TiFe$""_3$O$""_8$], [P6$""_3$mc~(P)], [R$overline(3)$m~(NP)], [313.0], [152.9],
    [Li$""_5$CoO$""_4$], [Aea2~(P)], [Pbca~(NP)], [550.8], [152.3],
    [Li$""_2$MnSiO$""_4$], [P$overline(1)$~(NP)], [Pc~(P)], [595.9], [152.0],
    [], [], [], [], [],
  )]
  , kind: table
  )

#figure(image("graphics/figure6.png", width: 100.0%),
  caption: [
    #strong[Predicted phase-transition entropy change, $Delta S_t$, expressed as a function of transition temperature and crystal symmetry properties.] #strong[a.]~Phase-transition entropy change for stable phase transitions as a function of temperature. #strong[b.]~Phase-transition entropy change for metastable phase transitions as a function of temperature. #strong[c.]~Number of phase transitions as a function of $Delta S_t$. #strong[d.]~Phase-transition entropy change for stable phase transitions as a function of symmetry. Numbers in white colour correspond to $N_(P T)$.
  ]
)
<fig6>

== Application~1: Solid-state cooling
<subsec:app1>
Solid-state cooling methods represent energy-efficient and environmentally friendly alternatives to conventional refrigeration technologies, which typically rely on compression cycles involving greenhouse gases [#link(<ref-25>)[25], #link(<ref-26>)[26], #link(<ref-27>)[27], #link(<ref-28>)[28]]. Under moderate variations of magnetic, electric, or mechanical fields, promising caloric materials can undergo field-induced phase transitions that produce large adiabatic temperature changes ($\| Delta T \| tilde.op 1$--$10$~K) and substantial isothermal entropy variations ($\| Delta S \| tilde.op 10$--$100$~J~K$""^(- 1)$~kg$""^(- 1)$). These caloric effects form the basis of solid-state refrigeration technologies, offering a pathway toward sustainable and high-performance cooling applications [#link(<ref-29>)[29]].

A schematic of a possible four-step refrigeration cycle based on the caloric effect is presented in #link(<fig5>)[Figure 5a]. The refrigeration cycle begins with the caloric material in a disordered (high-entropy) phase at room temperature, $T_0$. (This choice is arbitrary and serves illustrative purposes; other initialization conditions would also be valid.) An external field (e.g., hydrostatic pressure) is then adiabatically applied, inducing a transition to an ordered (low-entropy) phase, which raises the sample temperature to $T_(+) = T_0 + \| Delta T \|$. While the external field is maintained, the sample is brought into contact with a heat sink, enabling the release of heat ($+ Q = \| Delta S \| \/ T_0$) to the environment and returning the material to its initial temperature, $T_0$. The external field is then adiabatically removed, reverting the material to the disordered phase and lowering its temperature to $T_(-) = T_0 - \| Delta T \|$. In the final step, the sample is placed in thermal contact with the body to be cooled, absorbing heat and returning once more to $T_0$, thereby completing the cooling cycle.

From a practical perspective, achieving both large $\| Delta T \|$ and $\| Delta S \|$ is essential for the development of rapid and efficient solid-state cooling devices operating under repeated application and removal of external driving fields. The maximum amount of heat that can be extracted from a heat source per cycle is determined by $\| Delta S \|$, while the rate at which this heat can be transferred to a heat sink is governed by $\| Delta T \|$. To a first approximation, the adiabatic temperature change can be estimated as $Delta T approx - T_0 \/ C dot.op Delta S$, where $C$ is the heat capacity of the caloric material, and $Delta S approx Delta S_t$ [#link(<ref-30>)[30]]. Therefore, the entropy change associated with a phase transition serves as a useful descriptor for assessing the caloric potential of a phase-change material.

#link(<fig6>)[Figure 6a] displays the total number of predicted stable phase transformations, $N_(P T)$, classified according to their transition temperature and entropy change. Regardless of temperature, higher values of $N_(P T)$ are generally correlated with smaller phase-transition entropy changes. For example, within the interval $300 lt.eq T_t lt.eq 350$~K, a total of $121$ stable phase transitions exhibit entropy changes equal to or below $150$~J~K$""^(- 1)$~kg$""^(- 1)$, whereas only $9$ transitions exceed this threshold. Conversely, the largest $Delta S_t$ values are predominantly observed at higher temperatures. Notably, three phase transitions present exceptionally large entropy changes above $450$~J~K$""^(- 1)$~kg$""^(- 1)$\; however, these transformations occur at temperatures exceeding $450$~K, which may limit their technological relevance for applications near room temperature.

#link(<fig6>)[Figure 6b] presents analogous information to that shown in #link(<fig6>)[Figure 6a], but for metastable phase transitions. The general trends remain consistent with those observed for stable transformations: larger values of $N_(P T)$ are typically associated with smaller $Delta S_t$, and larger entropy changes tend to occur at higher transition temperatures. For both stable and metastable cases, $N_(P T)$ decreases monotonically with increasing $Delta S_t$, as illustrated in #link(<fig6>)[Figure 6c]. However, for any given $Delta S_t$, the number of metastable phase transitions consistently exceeds the number of stable ones (#link(<fig6>)[Figure 6c]). As noted in Sec.@subsec:general, this trend can be attributed to the fact that considering multiple metastable polymorphs per each compound naturally increases the number of possible phase transitions.

Table~4 lists the stable phase transitions predicted to occur within the technologically relevant temperature range of $300 lt.eq T_t lt.eq 350$~K and that exhibit entropy changes equal to or greater than $100$~J~K$""^(- 1)$~kg$""^(- 1)$. These transformations are particularly promising for solid-state cooling applications, as they take place near room temperature and could potentially give rise to so-called "giant" and "colossal" caloric effects [#link(<ref-31>)[31], #link(<ref-32>)[32], #link(<ref-33>)[33], #link(<ref-34>)[34]]. Notably, the first five compounds in Table~4 display exceptionally large transition entropy changes: Li$""_3$MnF$""_7$ ($342.3$~J~K$""^(- 1)$~kg$""^(- 1)$ at $347$~K), PNCl$""_2$ ($338.3$~J~K$""^(- 1)$~kg$""^(- 1)$ at $349$~K), Fe$""_4$OF$""_7$ ($252.1$~J~K$""^(- 1)$~kg$""^(- 1)$ at $300$~K), VOF$""_3$ ($241.7$~J~K$""^(- 1)$~kg$""^(- 1)$ at $311$~K), and Mg$""_2$TiO$""_4$ ($209.5$~J~K$""^(- 1)$~kg$""^(- 1)$ at $344$~K). To the best of our knowledge, the caloric properties of these compounds have not yet been experimentally explored.

#link(<fig6>)[Figure 6d] shows the total number of predicted stable phase transformations, categorized by their entropy change and crystal symmetry type. When considering the entire temperature range of $300 lt.eq T_t lt.eq 600$~K, the number of phase transitions for a given $Delta S_t$ is generally smallest for polar-polar transformations and largest for nonpolar-nonpolar phase transitions (in constrast to what we found near room temperature conditions, Sec.@subsec:general). Notably, only nonpolar-nonpolar transitions are predicted to exhibit entropy changes exceeding $400$~J~K$""^(- 1)$~kg$""^(- 1)$\; however, the associated transition temperatures occur well above room temperature (#link(<fig6>)[Figure 6a]).

*Table 6.* #strong[Stable polar-nonpolar phase transformations predicted to exhibit a relative heat conductivity change higher than $0.2$ (in absolute value).] The low-$T$ polymorph corresponds to "Phase 1" and the high-$T$ polymorph to "Phase 2". "P" and "NP" stand for polar and nonpolar structures, respectively. $T_t$, $Delta S_t$ and $Delta lambda_t$ stand for phase-transition temperature, entropy change and heat conductivity change, respectively. $epsilon.alt$ is defined as the ratio of the high LTC ("on") state by the low LTC ("off") state.

#figure(
  align(center)[#table(
    columns: 8,
    align: (center,center,center,center,center,center,center,center,),
    [], [], [], [], [], [], [], [],
    [Compound], [Phase~1], [Phase~2], [$T_t$~(K)], [$lambda_1$~(W~m$""^(- 1)$~K$""^(- 1)$)], [$lambda_2$~(W~m$""^(- 1)$~K$""^(- 1)$)], [$Delta lambda_t \/ lambda_1$], [$epsilon.alt$],
    [], [], [], [], [], [], [], [],
    [], [], [], [], [], [], [], [],
    [ZrSeO], [P2$""_1$3~(P)], [P4/nmm~(NP)], [311.7], [8.1], [14.0], [+0.73], [1.73],
    [VF$""_4$], [Pc~(P)], [C2/c~(NP)], [486.5], [2.5], [3.6], [+0.44], [1.44],
    [V$""_2$FeO$""_4$], [C2/c~(NP)], [P1~(P)], [527.2], [8.7], [12.4], [+0.43], [1.43],
    [Li$""_4$TiS$""_4$], [Pnma~(NP)], [I$overline(4)$2m~(P)], [362.8], [4.6], [6.6], [+0.43], [1.43],
    [LiNd(MoO$""_4$)$""_2$], [I$overline(4)$~(P)], [P2/c~(NP)], [566.0], [2.8], [3.8], [+0.36], [1.36],
    [Y$""_2$Zr$""_2$O$""_7$], [P2$""_1$~(P)], [C2/m~(NP)], [592.0], [6.2], [8.3], [+0.34], [1.34],
    [Li$""_3$Mn$""_2$F$""_7$], [Cc~(P)], [P2$""_1$/c~(NP)], [556.1], [4.2], [5.6], [+0.33], [1.33],
    [LiFeSbO$""_4$], [Imma~(NP)], [P4$""_3$22~(P)], [478.3], [4.9], [6.4], [+0.31], [1.31],
    [MgVFeP$""_2$\(O$""_4$F)$""_2$], [P$overline(1)$~(NP)], [P1~(P)], [478.1], [4.7], [5.9], [+0.26], [1.26],
    [LiMnBO$""_3$], [P$overline(6)$~(P)], [P$overline(1)$~(NP)], [510.4], [6.6], [8.2], [+0.24], [1.24],
    [MgFe$""_4$\(PO$""_4$)$""_4$], [Pm~(P)], [P$overline(1)$~(NP)], [337.9], [6.0], [7.4], [+0.23], [1.23],
    [NaClO$""_4$], [Pnma~(NP)], [I$overline(4)$2m~(P)], [538.3], [3.2], [3.9], [+0.22], [1.22],
    [Li$""_3$V(Si$""_2$O$""_5$)$""_3$], [P1~(P)], [Cmce~(NP)], [358.3], [11.7], [9.3], [-0.20], [1.26],
    [Li$""_3$CoPCO$""_7$], [P2$""_1$~(P)], [P2$""_1$/m~(NP)], [322.5], [5.3], [4.2], [-0.20], [1.26],
    [Na$""_3$SrPCO$""_7$], [P2$""_1$/m~(NP)], [P2$""_1$~(P)], [396.1], [3.0], [2.4], [-0.20], [1.25],
    [Ba$""_2$MgCrMoO$""_6$], [Immm~(NP)], [Cm~(P)], [313.5], [3.5], [2.8], [-0.21], [1.25],
    [Li$""_2$MnSiO$""_4$], [P$overline(1)$~(NP)], [Pc~(P)], [595.9], [9.4], [7.4], [-0.22], [1.27],
    [Y$""_2$Zr$""_2$O$""_7$], [Fd$overline(3)$m~(NP)], [P2$""_1$~(P)], [323.6], [8.0], [6.2], [-0.23], [1.29],
    [NaNO$""_3$], [R$overline(3)$c~(NP)], [P1~(P)], [429.1], [5.3], [3.6], [-0.31], [1.47],
    [Bi$""_2$W$""_2$O$""_9$], [Pna2$""_1$~(P)], [Pbcn~(NP)], [346.5], [4.0], [2.3], [-0.41], [1.74],
    [CoO$""_2$], [P1~(P)], [C2/m~(NP)], [592.3], [11.7], [6.2], [-0.47], [1.89],
    [], [], [], [], [], [], [], [],
  )]
  , kind: table
  )

Finally, Table~5 lists all stable polar-nonpolar phase transitions predicted to exhibit entropy changes equal to or greater than $150$~J~K$""^(- 1)$~kg$""^(- 1)$, regardless of the transition temperature. This classification is particularly useful for identifying materials with the potential to exhibit large electrocaloric effects, which are induced by variations in electric fields [#link(<ref-23>)[23], #link(<ref-31>)[31], #link(<ref-34>)[34]]. At the top of the list is the polymeric compound PNF$""_2$, which displays a highly promising $Delta S_t$ of $360.7$~J~K$""^(- 1)$~kg$""^(- 1)$ and a moderately high transition temperature of $411$~K. It is followed by the neutral salt KNO$""_3$, which exhibits an impressive entropy change of $346.4$~J~K$""^(- 1)$~kg$""^(- 1)$, although its high transition temperature of $539$~K may limit its suitability for conventional refrigeration applications. Among the entries in Table~5, we highlight several materials with transition temperatures near ambient conditions: PNCl$""_2$ ($338.3$~J~K$""^(- 1)$~kg$""^(- 1)$), Cd(C$""_4$N$""_3$)$""_2$ ($259.0$~J~K$""^(- 1)$~kg$""^(- 1)$), Li$""_2$VO$""_3$ ($218.8$~J~K$""^(- 1)$~kg$""^(- 1)$), Fe$""_3$OF$""_5$ ($175.5$~J~K$""^(- 1)$~kg$""^(- 1)$), CaCO$""_3$ ($157.7$~J~K$""^(- 1)$~kg$""^(- 1)$), and Li$""_3$TiFe$""_3$O$""_8$ ($152.9$~J~K$""^(- 1)$~kg$""^(- 1)$).

Overall, in this section we have provided valuable insights into materials that, to the best of our knowledge, have not yet been explored from the perspective of solid-state refrigeration. Owing to their large predicted entropy changes and favorable transition temperatures, these compounds emerge as promising candidates for advancing the development of next-generation solid-state cooling technologies.

#figure(image("graphics/figure7.png", width: 100.0%),
  caption: [
    #strong[Results obtained for the proposed thermal switch application.] #strong[a.]~Number of polar-nonpolar phase transitions, $N_(P T)$, expressed as a function of relative thermal conductivity change (in absolute value) and transition temperature. #strong[b.]~Ball-stick representation of the "on" and "off" thermal states of ZrSeO which, according to our ML-guided high-throughput screening, exhibits a relative LTC change of approximately 73% (Table~6). Zr, Se and O ions are represented with green, yellow-green and red spheres, respectively. #strong[c.]~Ball-stick representation of the "on" and "off" thermal states of CoO$""_2$ which, according to our ML-guided high-throughput screening, exhibits a relative LTC change of approximately 47% (Table~6). Co and O ions are represented with blue and red spheres, respectively.
  ]
)
<fig7>

== Application~2: Thermal switching
<subsec:app2>
A thermal switch is a device or material system that exhibits a controllable and reversible change in thermal conductivity in response to external stimuli such as temperature, electric fields, magnetic fields, light, or mechanical stress [#link(<ref-35>)[35], #link(<ref-36>)[36], #link(<ref-37>)[37], #link(<ref-38>)[38], #link(<ref-39>)[39], #link(<ref-40>)[40]]. The fundamental objective of a thermal switch is to regulate heat flow in a precise and dynamic manner, analogous to how an electrical switch controls current (#link(<fig5>)[Figure 5b]). Technically, a thermal switch can be characterized by its thermal conductance ratio, defined as the ratio of thermal conductivity in the "on" (high-conductance) state to that in the "off" (low-conductance) state, $epsilon.alt = lambda_(upright(o n)) \/ lambda_(upright(o f f))$. Thermal switches are important in numerous advanced technological fields, including thermal management in electronics, energy conversion systems (e.g., thermoelectric generators) and neuromorphic and phononic devices [#link(<ref-41>)[41]].

Thermal switches achieve modulation of heat flow by altering the way phonons (quantized lattice vibrations) or electrons (in conductive materials) transport energy. Key mechanisms on which thermal switches may rely include anharmonic phonon scattering (e.g., activation of low-frequency rattling modes) [#link(<ref-35>)[35]], interfacial thermal resistance modulation (e.g., phase-change layers that alternately enhance or block interfacial heat transfer) [#link(<ref-36>)[36]], external field control of lattice properties leading to changes in thermal transport [#link(<ref-37>)[37]], and phase transitions (e.g., order-disorder, metal-insulator and structural transformations) [#link(<ref-38>)[38], #link(<ref-39>)[39], #link(<ref-40>)[40]].

In this study, we select phase transitions as the underlying mechanism for proposing auspicious thermal switches. Specifically, by employing a surrogate ML model capable of predicting a material's lattice thermal conductivity (LTC) based solely on its composition and atomic structure [#link(<ref-42>)[42], #link(<ref-43>)[43], #link(<ref-44>)[44], #link(<ref-45>)[45]] (Methods), we systematically investigated the relative LTC changes across all the stable polar-nonpolar phase transitions predicted in this work, totaling $214$ transformations (#link(<fig4>)[Figure 4a]). This class of transitions was selected because they offer the possibility to be externally controlled via an applied electric field.

#link(<fig7>)[Figure 7a] summarizes the outcomes of our ML-guided high-throughput screening of LTC, showing the number of phase transitions, $N_(P T)$, as a function of transition temperature and relative LTC change (in absolute value), $\| Delta lambda_t \| \/ lambda_1$ (with $lambda_1$ and $lambda_2$ denoting the LTC of the low- and high-$T$ phases, respectively). We find that approximately 75% of the predicted stable polar-nonpolar phase transitions exhibit relative LTC changes equal to or smaller than $0.1$. Only $31$ transformations display variations in the $0.1$--$0.2$ range, and just $21$ exceed $0.2$. For any given $\| Delta lambda_t \| \/ lambda_1$, the distribution of $N_(P T)$ across the $300 lt.eq T_t lt.eq 600$~K temperature range remains approximately uniform.

Table~6 lists the $21$ stable polar-nonpolar phase transitions predicted to exhibit relative LTC changes equal to or greater than $0.20$ in absolute value. At the top of the list is the Janus compound ZrSeO [#link(<ref-46>)[46]] (#link(<fig7>)[Figure 7b]), which displays a remarkable $Delta lambda_t \/ lambda_1$ value of $+ 0.73$ and a transition temperature of $312$~K, ideal for near-room-temperature applications. The corresponding LTC ratio, $epsilon.alt$, is also notably large, with a value of $1.73$. At the bottom of the list is the binary oxide CoO$""_2$ (#link(<fig7>)[Figure 7c]), a typical cathode material in lithium-based electrochemical batteries [#link(<ref-47>)[47]], which features a significant $Delta lambda_t \/ lambda_1$ value of $- 0.47$ and the highest $epsilon.alt$ value in the table, $1.89$. However, its high transition temperature in principle suggests limited applicability in conventional thermal management technologies.

Other notable cases in Table~6 correspond to phase transitions occurring near room temperature, which are particularly relevant for practical thermal switching applications. These include Li$""_4$TiS$""_4$ with $Delta lambda_t \/ lambda_1 = + 0.43$ and $epsilon.alt = 1.43$, MgFe$""_4$\(PO$""_4$)$""_4$ with $+ 0.23$ and $1.23$, Li$""_3$V(Si$""_2$O$""_5$)$""_3$ and Li$""_3$CoPCO$""_7$ with $- 0.20$ and $epsilon.alt = 1.26$ both, Ba$""_2$MgCrMoO$""_6$ with $- 0.21$ and $1.25$, Y$""_2$Zr$""_2$O$""_7$ with $- 0.23$ and $1.29$, and Bi$""_2$W$""_2$O$""_9$ with $- 0.41$ and an impressive $epsilon.alt = 1.74$. These materials, along with ZrSeO and CoO$""_2$, stand out as promising candidates for the development of efficient thermal switches, which, to the best of our knowledge, have not yet been experimentally investigated.

= Discussion
<sec:discussion>
Given the generally complex compositions and low crystal symmetries of the compounds listed in Tables~1--6, validating our temperature-induced phase transition predictions directly with first-principles QHA calculations turns out to be very challenging. Nevertheless, for a reduced subset of these materials, we are able to compare our ML-aided predictions with available experimental data. This is the case for the ternary oxides KNO$""_3$, KNO$""_2$, and CaCO$""_3$ (Table~5), which have been previously analyzed and reported in the literature.

For bulk KNO$""_3$, a ferroelectric phase transition has been experimentally observed within the temperature range $350 lt.eq T_t lt.eq 400$~K, depending on the cooling rate and sample preparation conditions [#link(<ref-48>)[48], #link(<ref-49>)[49]]. Our high-throughput screening predicts a transition temperature of $539$~K for this compound, which is reasonably close to the experimental range. Likewise, for KNO$""_2$, a polar phase transition has been reported at $313$~K [#link(<ref-50>)[50]], which also compares reasonably with our predicted value of $529$~K. In the case of slightly compressed CaCO$""_3$, a phase transition has been observed at $336$~K [#link(<ref-51>)[51]], which is in very good agreement with our estimate of $370$~K. This overall consistency between predicted and experimental transition temperatures supports the reliability of our computational approach and strengthens confidence in the broader set of predictions presented in this work.

For a reduced subset of $10$ predicted stable phase transitions, which neither involve chemically complex nor low-symmetry structures, we have been able to perform theoretical validation at the first-principles level using DFT (Methods). The results of these DFT validation tests are presented and discussed in the Supplementary Information and Supplementary Discussion. Overall, for materials that do not exhibit imaginary phonon frequencies at zero temperature, we find good agreement among the ML-predicted and DFT-calculated free-energy differences between the two polymorphs involved in the phase transition, with discrepancies well within the expected numerical uncertainties.

Additionally, we have computed the thermal conductance ratio using first-principles DFT methods, $epsilon.alt^(upright(D F T))$, for two representative compounds exhibiting polar-nonpolar phase transformations, Li$""_4$TiS$""_4$ and NaNO$""_3$, both of which are vibrationally stable at zero temperature (Methods). For Li$""_4$TiS$""_4$, we obtained $epsilon.alt^(upright(D F T)) = 2.23$, and for NaNO$""_3$, $epsilon.alt^(upright(D F T)) = 1.40$. These results compare notably well with the ML-predicted values of $1.43$ and $1.47$, respectively (Table~6). This level of consistency supports the overall reliability of our ML-guided phase-transition and lattice thermal conductivity predictions.

Despite the encouraging results presented in this work, our high-throughput screening strategy is subject to a number of inherent limitations. First, thermal expansion effects have been systematically neglected throughout our analysis. Since our transition temperature estimates rely on the quasi-harmonic approximation applied to zero-temperature relaxed structures, discrepancies with respect to available experimental data may arise, especially in cases where thermal expansion plays a significant role in the relative phase stability. Incorporating anharmonic effects or performing fully temperature-dependent structural relaxations could improve the accuracy of transition temperature predictions, albeit at a significantly higher computational cost [#link(<ref-52>)[52], #link(<ref-53>)[53], #link(<ref-54>)[54]]. The development of subsidiary ML models and/or the use of ML interatomic potentials could enormously facilitate such a materials modeling endeavour [#link(<ref-55>)[55]].

Second, our approach is fundamentally limited to solid-solid phase transitions between structurally well-defined atomic crystals. If a material undergoes a different kind of temperature-induced transformation in practice (e.g., melting, sublimation, or a transition to a dynamically disordered superionic state) our methodology, which is based on quasi-harmonic phonon calculations, will not be able to identify it. Consequently, some compounds predicted to exhibit stable solid-solid transitions may instead experience a different transformation pathway upon heating, which should be taken into account when considering experimental validation.

Finally, the limited scope of the employed materials dataset [#link(<ref-12>)[12]] also constrains our findings. Promising compounds not included in this repository could not be captured by our screening, highlighting the importance of continually expanding open-access materials databases to support future discoveries. In this context, generative crystal structure models based on machine learning and data-driven approaches offer a powerful route to explore chemically and structurally diverse materials spaces beyond what has been experimentally and/or theoretically investigated. Integrating such generative tools with high-throughput workflows could significantly enhance the discovery potential of future computational screenings [#link(<ref-56>)[56]].

= Conclusions
<sec:conclusions>
We have developed and implemented a ML-guided high-throughput framework for predicting temperature-induced solid-solid phase transitions in inorganic materials. By integrating DFT calculations with a graph-based neural network trained to estimate vibrational free energies, we have successfully screened a large dataset of materials from the Materials Project and identified over $2 \, 000$ potential polymorphic transformations within the temperature range of $300$--$600$~K. Our method enables a significant computational speed-up compared to traditional first-principles approaches, while maintaining predictive accuracy in line with available experimental data and fully #emph[ab initio] calculations.

The systematic analysis of these phase transitions revealed a rich variety of functional phenomena with potential for technological applications. We identified hundreds of polar-nonpolar and polar-polar transitions near room temperature, many of which exhibit large entropy changes ($> 300$~J~K$""^(- 1)$~kg$""^(- 1)$) and are therefore promising candidates for caloric and solid-state refrigeration applications. Additionally, we reported $21$ materials with sharp relative changes in lattice thermal conductivity ($20$--$70$%) across a phase transition, offering a new class of thermally switchable materials. Notably, several of the highlighted compounds --such as ZrSeO, Bi$""_4$W$""_2$O$""_9$, and Li$""_4$TiS$""_4$-- have not previously been investigated for these applications, and thus represent new opportunities for experimental exploration.

Our ML-guided high-throughput screening approach for investigating solid-solid phase transitions in inorganic materials represents a transformative methodological advancement with profound implications for thermal management technologies. Future research will strategically expand our methodology to organic materials and energy applications. The proposed methodology establishes a robust, scalable, and extensible computational framework for phase-transition-driven materials exploration, particularly when integrated with cutting-edge generative AI models and expansive materials databases.

#heading(level: 1, numbering: none)[Methods]
<sec:methods>
#strong[First-principles DFT calculations.]~#emph[Ab initio] calculations based on density functional theory (DFT) [#link(<ref-57>)[57]] were performed to analyse the structural and vibrational properties of selected materials. We performed these calculations with the VASP code [#link(<ref-58>)[58]] using the semi-local PBEsol [#link(<ref-59>)[59]] approximation to the exchange-correlation energy functional. The projector augmented-wave (PAW) method was used to effectively model the ionic cores [#link(<ref-60>)[60]]. Wave functions were represented in a plane-wave basis typically truncated at $650$~eV. By using these parameters and dense #strong[k]-point grids for reciprocal-space integration the resulting zero-temperature energies were converged to within $1$~meV per formula unit. In the geometry relaxations, a force tolerance of $0.005$~eV$dot.op$Å$""^(- 1)$ was imposed in all the atoms. The second-order interatomic force constant (IFC) matrix of selected materials were calculated with the finite-differences method as is implemented in the `PhonoPy` software [#link(<ref-61>)[61]]. Large supercells ($4 times 4 times 4$) and dense #strong[k]-point grids were employed for the phonon and vibrational free-energy calculations of targeted structures. \
#strong[Vibrational free-energy ML model.]~To train our GCNN for predicition of vibrational free energies, we used a supervised learning approach in which a task-specific loss function was defined (i.e., mean squared error for regression) and optimized using backpropagation and gradient descent. Specifically, the GCNN was implemented with three convolutions of node features, batch normalization and average pooling, and two further layers of convolution, with ReLU as activation functions and Adam optimizer. We included a batch normalization layer in between the graph convolutional layers for improving model stability.

To evaluate the role of hyperparameters in our GCNN, we performed random hyperparameter search [#link(<ref-62>)[62]] on small training sets of $80$ epochs with the following grid values: graph convolutional layers with $\[ 64 \, 128 \, 256 \, 512 \]$ number of neurons, linear convolutional layers with $\[ 16 \, 32 \, 64 \, 128 \, 256 \]$ number of neurons, dropouts of $\[ 0.1 \, 0.2 \, 0.3 \, 0.4 \, 0.5 \]$ and learning rates of $\[ 0.00005 \, 0.0001 \, 0.0005 \, 0.001 \]$. Upon selection of the best hyperparameters, longer trainings were performed to improve subsequent screenings and postprocessings.

Finally, an optimal GCNN vibrational free-energy model was obtained consisting of two graph convolutional layers of $512$ neurons each, two linear convolutional layers with $64$ and $16$ neurons each, and a linear output. The learning rate was set to $0.001$, dropout to $0.1$ and batch size to $64$. \
#strong[First-principles LTC calculations.]~The DFT calculations were performed with the VASP code [#link(<ref-58>)[58]] using the semi-local PBEsol [#link(<ref-59>)[59]] approximation to the exchange-correlation energy functional and PAW method [#link(<ref-60>)[60]]. The kinetic energy cutoff of the plane wave basis set is set to be $520$~eV. Convergence thresholds of the total energy and Hellmann-Feynman force were set to $10^(- 8)$~eV and $10^(- 4)$~eV/Å, respectively. The second-order IFC matrix of selected materials were calculated with the finite-differences method as is implemented in the `PhonoPy` software [#link(<ref-61>)[61]]. Large supercells containing between $100$ and $300$ atoms were employed in these calculations. For the third-order IFC matrix calculations, the interatomic interactions were truncated to the third nearest neighbor. Finally, using the 2nd and 3rd IFCs as inputs, the phonon Boltzmann transport equation was iteratively solved using the `ShengBTE` package [#link(<ref-63>)[63]]. The NGRIDS parameter in the `ShengBTE` calculations was large enough to ensure the total number of phonon scattering channels to be of the order of $10^8$. \
#strong[LTC subsidiary ML model.]~Atomistic Line Graph Neural Network (ALIGNN) [#link(<ref-64>)[64]] was introduced as a direct ML model, whereby the inputs are automatically calculated based on the structural and chemical composition of crystals, where the former includes both bond distances and angles. In total, $approx 4 \, 700$ LTC data calculated by full DFT calculations were used as end property for ALIGNN model training, which were accumulated in our recent works [#link(<ref-42>)[42], #link(<ref-43>)[43], #link(<ref-44>)[44], #link(<ref-45>)[45]]. The logscale LTC values are used in the ALIGNN model training, as our separate tests have proved significant performance improvement as compared to the models that were trained on the raw LTC values. Also, for anisotropic structures whose LTC values were different in the three crystallographic directions, a single LTC value averaged over all three directions was used for training. The ALIGNN model was trained on 80% of the dataset and the rest 20% was used for testing. The model was trained for $2 \, 000$ epochs with a batch size of $100$. \

#heading(level: 1, numbering: none)[Data availability]
<data-availability>
The data that support the findings of this study are freely available at [#link(<ref-65>)[65]]. \

#heading(level: 1, numbering: none)[Acknowledgements]
<acknowledgements>
C.L. acknowledges support from the Spanish Ministry of Science, Innovation and Universities under a FPU grant. C.C. acknowledges support by MICIN/AEI/10.13039/501100011033 and ERDF/EU under the grants TED2021-130265B-C22, TED2021-130265B-C21, PID2023-146623NB-I00, PID2023-147469NB-C21 and RYC2018-024947-I and by the Generalitat de Catalunya under the grants 2021SGR-00343, 2021SGR-01519 and 2021SGR-01411. Computational support was provided by the Red Española de Supercomputación under the grants FI-2024-1-0005, FI-2024-2-0003, FI-2024-3-0004, FI-2024-1-0025, FI-2024-2-0006, and FI-2025-1-0015. This work is part of the Maria de Maeztu Units of Excellence Programme CEX2023-001300-M funded by MCIN/AEI (10.13039/501100011033). E.S. acknowledges the European Union H2020 Framework Program SENSATE project: Low dimensional semiconductors for optically tuneable solar harvesters (grant agreement Number 866018), Renew-PV European COST action (CA21148) and the Spanish Ministry of Science and Innovation ACT-FAST (PCI2023-145971-2). E.S. and J.-Ll.T. are grateful to the ICREA Academia program. M.H. acknowledges support from NSF (Award no. 2030128). \

#set heading(numbering: none)
= References

#par[[1] Landau, L. The theory of phase transitions. #emph[Nature] #strong[138], 860 (1936).] <ref-1>

#par[[2] Mao, H.-K. and Hemley, R. J. Ultrahigh-pressure transitions in solid hydrogen. #emph[Rev. Mod. Phys.] #strong[66], 671 (1994).] <ref-2>

#par[[3] Yin J., Zhao C., Zhang Y., Wu J. Composition-induced phase transitions and enhanced electrical properties in bismuth sodium titanate ceramics. #emph[J. Am. Ceram. Soc.] #strong[100], 5601 (2017).] <ref-3>

#par[[4] Rurali, R, Escorihuela-Sayalero, C., Tamarit, J.-Ll., Íñiguez-González, J. and Cazorla, C. Giant photocaloric effects across a vast temperature range in ferroelectric perovskites. #emph[Phys. Rev. Lett.] #strong[113], 116401 (2024).] <ref-4>

#par[[5] Wijs, G. A., Kresse, G. and Gillan, M. J. First-order phase transitions by first-principles free-energy calculations: The melting of Al. #emph[Phys. Rev. B] #strong[57], 8223 (1998).] <ref-5>

#par[[6] Binder, K. The Monte Carlo method for the study of phase transitions: A review of some recent progress. #emph[J. Comput. Phys.] #strong[59], 1 (1985).] <ref-6>

#par[[7] Cazorla, C., Alfé, D. and Gillan, M. J. Constraints on the phase diagram of molybdenum from first-principles free-energy calculations. #emph[Phys. Rev. B] #strong[85], 064113 (2012).] <ref-7>

#par[[8] Belonoshko, A. B., LeBacq, O., Ahuja, R. and Johansson, B. Molecular dynamics study of phase transitions in Xe. #emph[J. Chem. Phys.] #strong[117], 7233 (2002).] <ref-8>

#par[[9] Cazorla, C. and Boronat, J., Simulation and understanding of atomic and molecular quantum crystals, #emph[Rev. Mod. Phys.] #strong[89], 035003 (2017).] <ref-9>

#par[[10] Baroni, S., Giannozzi, P. and Isaev, E., Density-functional perturbation theory for quasi-harmonic calculations, #emph[Rev. Mineral. Geochem.] #strong[71], 39 (2010).] <ref-10>

#par[[11] Tuli, V., Burr, P., Claisse, A. and Cazorla, C. Thermodynamic stability of $beta$-phases in Zr-Nb alloys. #emph[Phys. Rev. Mater.] #strong[7], 113607 (2023).] <ref-11>

#par[[12] Jain, A., Ong, S. P., Hautier, G. #emph[et al.] Commentary: The materials project: A materials genome approach to accelerating materials innovation. #emph[Apl. Mater.] #strong[1], 011002 (2013).] <ref-12>

#par[[13] Reiser, P., Neubert, M., Eberhard, A. #emph[et al.] Graph neural networks for materials science and chemistry. #emph[Commun. Mater.] #strong[3], 93 (2022).] <ref-13>

#par[[14] Togo, A., Chaput, L., Tadano, T. and Tanaka, I. Implementation strategies in phonopy and phono3py. #emph[J. Phys. Condens. Matter] #strong[35], 353001 (2023).] <ref-14>

#par[[15] Al-Fahdi, M., Lin, C., Shen, C., Zhang, H. and Hu, M. Rapid prediction of phonon density of states by crystal attention graph neural network and high-throughput screening of candidate substrates for wide bandgap electronic cooling. #emph[Mater. Today Phys.] #strong[50], 101632 (2025).] <ref-15>

#par[[16] Hüllermeier, E. and Waegeman, W. Aleatoric and epistemic uncertainty in machine learning: an introduction to concepts and methods. #emph[Mach. Learn.] #strong[110], 457 (2021).] <ref-16>

#par[[17] Palmer, G., Du, S., Politowicz, A., Emory, J. P., Yang, X., Gautam, A., Gupta, G., Li, Z., Jacobs, R., and Morgan, D. Calibration after bootstrap for accurate uncertainty quantification in regression models. #emph[npj Comput. Mater.] #strong[8], 115 (2022).] <ref-17>

#par[[18] Tan, A. R., Urata, S., Goldman, S., Dietschreit, J. C. B. and Gómez-Bombarelli, R. Single-model uncertainty quantification in neural network potentials does not consistently outperform model ensembles. #emph[npj Comput. Mater.] #strong[9], 225 (2023).] <ref-18>

#par[[19] Musielewicz, J., Lan, J., Uyttendaele, M. and Kitchin, J. R. Improved uncertainty estimation of graph neural network potentials using engineered latent space distances. #emph[J. Phys. Chem. C] #strong[128], 20799 (2024).] <ref-19>

#par[[20] Varivoda, D., Dong, R., Omee, S. S. and Hu, J. Materials property prediction with uncertainty quantification: A benchmark study. #emph[Appl. Phys. Rev.] #strong[10], 021409 (2023).] <ref-20>

#par[[21] Chen, L. Y. and Li, Y. P. Uncertainty quantification with graph neural networks for efficient molecular design. #emph[Nat. Commun.] #strong[16], 3262 (2025).] <ref-21>

#par[[22] Davis, M., Damjanovic, D. and Setter, N. Electric-field-, temperature-, and stress-induced phase transitions in relaxor ferroelectric single crystals. #emph[Phys. Rev. B] #strong[73], 014115 (2006).] <ref-22>

#par[[23] Cazorla, C. and Íñiguez, J. Giant direct and inverse electrocaloric effects in multiferroic thin films. #emph[Phys. Rev. B] #strong[98], 174105 (2018).] <ref-23>

#par[[24] Moriwake, H., Konishi, A., Ogawa, T., Fisher, C.A.J., Kuwabara, A. and Fu, D. The electric field induced ferroelectric phase transition of AgNbO$""_3$. #emph[J. Appl. Phys.] #strong[119], 064102 (2016).] <ref-24>

#par[[25] Mañosa, Ll. and Planes, A. Solid-state cooling by stress: A perspective. #emph[Appl. Phys. Lett.] #strong[116], 050501 (2020).] <ref-25>

#par[[26] Lloveras, P. and Tamarit, J.-Ll. Advances and obstacles in pressure-driven solid-state cooling: A review of barocaloric materials. #emph[MRS Energy Sustain.] #strong[8], 3 (2021).] <ref-26>

#par[[27] Cazorla, C. Novel mechanocaloric materials for solid-state cooling applications. #emph[Appl. Phys. Rev.] #strong[6], 041316 (2019).] <ref-27>

#par[[28] Torelló, A. and Defay, E. Electrocaloric Coolers: A Review. #emph[Adv. Electron. Mater.] #strong[8], 2101031 (2022).] <ref-28>

#par[[29] Takeuchi, I. and Sandeman, K. Solid-state cooling with caloric materials. #emph[Phys. Today] #strong[68], 48 (2015).] <ref-29>

#par[[30] Escorihuela-Sayalero, C., Pardo, L. C., Romanini, M., Obrecht, N., Loehlé, S., Lloveras, P., Tamarit, J.-Ll. and Cazorla, C. #emph[npj Comput. Mater.] #strong[10], 13 (2024).] <ref-30>

#par[[31] Shirsath, S. E., Cazorla, C., Lu, T., Zhang, L., Tay, Y. Y., Lou, X., Liu, Y., Li, S. and Wang, D. Interface-charge induced giant electrocaloric effect in lead free ferroelectric thin-film bilayers. #emph[Nano Lett.] #strong[20], 1262 (2020).] <ref-31>

#par[[32] Aznar, A., Lloveras, P., Romanini, M., Barrio, M., Tamarit, J.-Ll., Cazorla, C., Errandonea, D., Mathur, N.D., Planes, A., Moya, X. and Mañosa, Ll. Giant barocaloric effects over a wide temperature range in superionic conductor AgI. #emph[Nat. Commun.] #strong[8], 1851 (2017).] <ref-32>

#par[[33] Zeng, M., Escorihuela-Sayalero, C., Ikeshoji, T., Takagi, S., Kim, S., Orimo, S.-I., Barrio, M., Tamarit, J.-Ll., Lloveras, P., Cazorla, C. and Sau, K. Colossal reversible barocaloric effects in a plastic crystal mediated by lattice vibrations and ion diffusion. #emph[Adv. Sci.] #strong[11], 2306488 (2024).] <ref-33>

#par[[34] Menéndez, C., Rurali, R. and Cazorla, C. Colossal room-temperature electrocaloric strength aided by hydrostatic pressure in lead-free multiferroic solid solutions. #emph[Phys. Chem. Chem. Phys.] #strong[25], 17450 (2023).] <ref-34>

#par[[35] Tadano, T. and Tsuneyuki, S. Quartic anharmonicity of rattlers and its effect on lattice thermal conductivity of clathrates from first principles. #emph[Phys. Rev. Lett.] #strong[120], 105901 (2018).] <ref-35>

#par[[36] Zang, Y. P., Di, C., Yan, X.J. #emph[et al.] Giant thermal transport tuning at a metal/ferroelectric interface. #emph[Adv. Mater.] #strong[33], 2105778 (2021).] <ref-36>

#par[[37] Féger, L., Escorihuela-Sayalero, C., Rampnoux, J.-M. #emph[et al.] Lead-free room-temperature ferroelectric thermal conductivity switch using anisotropies in thermal conductivities. #emph[Phys. Rev. Mater.] #strong[8], 094403 (2024).] <ref-37>

#par[[38] Cazorla, C., Bichelmaier, S., Escorihuela-Sayalero, C., Íñiguez, J., Carrete, J. and Rurali, R. Light-driven dynamical tuning of the thermal conductivity in ferroelectrics. #emph[Nanoscale] #strong[16], 8335 (2024).] <ref-38>

#par[[39] Cazorla, C. and Rurali, R. Dynamical tuning of the thermal conductivity via magnetophononic effects. #emph[Phys. Rev. B] #strong[105], 104401 (2022).] <ref-39>

#par[[40] Cazorla, C., Stengel, M., Íñiguez, J. and Rurali, R. Giant multiphononic effects in a perovskite oxide. #emph[npj Comput. Mater.] #strong[9], 97 (2023).] <ref-40>

#par[[41] Wang, L. and Li, B. Thermal logic gates: Computation with phonons. #emph[Phys. Rev. Lett.] #strong[99], 177208 (2007).] <ref-41>

#par[[42] Guangzhao, Q., Yi, W., Linfeng, Y. #emph[et al.] Predicting lattice thermal conductivity from fundamental material properties using machine learning techniques. #emph[J. Mater. Chem. A] #strong[11], 5801 (2023).] <ref-42>

#par[[43] Ojih, J., Al-Fahdi, M., Yao, Y., Hu, J. and Hu, M. Graph theory and graph neural network assisted high-throughput crystal structure prediction and screening for energy conversion and storage. #emph[J. Mater. Chem. A] #strong[12], 8502 (2024).] <ref-43>

#par[[44] Ojih, J., Shen, C., Rodriguez, A., Zhang, H., Choudhary, K. and Hu, M. High-throughput computational discovery of $3218$ ultralow thermal conductivity and dynamically stable materials by dual machine learning models. #emph[J. Mater. Chem. A] #strong[11], 24169 (2023).] <ref-44>

#par[[45] Rodriguez, A., Lin, C., Shen, C., Yuan, K., Al-Fahdi, M., Zhang, X., Zhang, H. and Hu, M. Unlocking phonon properties of a Large and diverse set of cubic crystals by indirect bottom-up machine learning approach. #emph[Commun. Mater.] #strong[4], 61 (2023).] <ref-45>

#par[[46] Pham, T.H., Ullah, H., Shafique, A., Kim, H.J., and Shin, Y.-H. Enhanced out-of-plane electromechanical response of Janus ZrSeO. #emph[Phys. Chem. Chem. Phys.] #strong[23], 16289 (2021).] <ref-46>

#par[[47] Zhou, Z., Cazorla, C., Gao, B., Luong, H.D., Momma, T. and Tateyama, Y. First-principles study on the interplay of strain and state-of-charge with Li-ion diffusion in the battery cathode material LiCoO$""_2$. #emph[ACS Appl. Mater. Interfaces] #strong[15], 53614 (2023).] <ref-47>

#par[[48] Christensen, A., Norby, P., Hanson, J. C. and Shimada, S. Phase transition of KNO$""_3$ monitored by synchrotron x-ray powder diffraction. #emph[J. Appl. Cryst.] #strong[29], 265 (1996).] <ref-48>

#par[[49] Markova, Y. F., Egorova, V. M., Roginskiia, E. M. and Stukova, E. V. Phase transition in potassium nitrate ferroelectric in a nanoporous matrix. #emph[Tech. Phys. Lett.] #strong[46], 905 (2020).] <ref-49>

#par[[50] Rao, K. J. and Rao, C. N. R. Ferroelectric phase transformation in KNO$""_2$. #emph[Br. J. Appl. Phys.] #strong[17], 1653 (1966).] <ref-50>

#par[[51] Merrill, L. and Bassett, W. A. The crystal structure of CaCO$""_3$\(II), a high-pressure metastable phase of calcium carbonate. #emph[Acta Cryst.] #strong[B31], 343 (1975).] <ref-51>

#par[[52] López, C., Emperador, A., Saucedo, E., Rurali, R., and Cazorla, C. Universal ion-transport descriptors and classes of inorganic solid-state electrolytes. #emph[Mater. Horiz.] #strong[10], 1757 (2023).] <ref-52>

#par[[53] López, C., Rurali, R., and Cazorla, C. How concerted are ionic hops in inorganic solid-state electrolytes? #emph[J. Am. Chem. Soc.] #strong[146], 8269 (2024).] <ref-53>

#par[[54] Benítez, P., López, C., Liu, C., Caño, I., Tamarit, J.-Ll., Saucedo, E. and Cazorla, C. Crystal structure prediction and phase stability in highly anharmonic silver-based chalcohalide anti-perovskites. #emph[PRX Energy] #strong[4], 023002 (2025).] <ref-54>

#par[[55] Mosquera-Lois, I., Kavanagh, S. R., and Klarbring, J., Tolborg, K. and Walsh, A. Imperfections are not $0$~K: free energy of point defects in crystals. #emph[Chem. Soc. Rev.] #strong[52], 5812 (2023).] <ref-55>

#par[[56] Zeni, C., Pinsler, R., Zügner, D. #emph[et al.] A generative model for inorganic materials design. #emph[Nature] #strong[639], 624 (2025).] <ref-56>

#par[[57] Cazorla, C. and Boronat, J. Simulation and understanding of atomic and molecular quantum crystals. #emph[Rev. Mod. Phys.] #strong[89], 035003 (2017).] <ref-57>

#par[[58] Kresse, G. and Furthmüller, J. Efficient iterative schemes for #emph[ab initio] total-energy calculations using a plane-wave basis set. #emph[Phys. Rev. B] #strong[54], 11169 (1996).] <ref-58>

#par[[59] Perdew, J. P., Ruzsinszky, A., Csonka, G. I., Vydrov, O. A., Scuseria, G. E., Constantin, L. A., Zhou, X. and Burke, K. Restoring the density-gradient expansion for exchange in solids and surfaces. #emph[Phys. Rev. Lett.] #strong[100], 136406 (2008).] <ref-59>

#par[[60] Blöchl, P. E. Projector augmented-wave method. #emph[Phys. Rev. B] #strong[50], 17953 (1994).] <ref-60>

#par[[61] Togo, A. and Tanaka, I. First principles phonon calculations in materials science. #emph[Scr. Mater] #strong[108], 1 (2015).] <ref-61>

#par[[62] Bergstra, J. and Bengio, Y. Random search for hyper-parameter optimization. #emph[J. Mach. Learn. Res.] #strong[13], 281 (2012).] <ref-62>

#par[[63] Li, W., Carrete, J., Katcho, N. A. and Mingo, N. ShengBTE: A solver of the Boltzmann transport equation for phonons. #emph[Comput. Phys. Commun.] #strong[185], 1747 (2014).] <ref-63>

#par[[64] Choudhary, K. and DeCost, B. Atomistic line graph neural network for improved materials property predictions. #emph[npj Comput. Mater.] #strong[7], 185 (2021).] <ref-64>

#par[[65] https:\/\/github.com/IonRepo/ml-phasetransitions] <ref-65>
