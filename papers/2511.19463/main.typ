#import "average-energy.typ": average-energy

#set document(title: "Urban Buildings Energy Consumption Estimation Using HPC: A Case Study of Bologna")
#set page(paper: "us-letter", margin: 1in, numbering: "1")
#set text(font: "New Computer Modern", size: 11pt)
#set par(justify: true, leading: .53em, first-line-indent: 1em)
#set heading(numbering: "1.1")
#set math.equation(numbering: "(1)")
#set figure(supplement: [Figure])

#align(center)[
  #text(size: 17pt)[Urban Buildings Energy Consumption Estimation Using HPC: \
  A Case Study of Bologna]

  #link("mailto:aldo.canfora2@unibo.it")[Aldo Canfora]#super[1,2],
  Eleonora Bergamaschi#super[2], Riccardo Mioli#super[2],
  Federico Battini#super[3], Mirko Degli Esposti#super[1],
  Giorgio Pedrazzi#super[2], and Chiara Dellacasa#super[2]

  #text(size: 10pt)[
    #super[1] Department of Physics and Astronomy, University of Bologna, Via Irnerio 46, 40126 Bologna, Italy \
    #super[2] HPC Department, Cineca, Via Magnanelli 6/3, 40033 Casalecchio di Reno, Italy \
    #super[3] IFAB Foundation, Via Galliera 32, 40121 Bologna, Italy
  ]

  November 2025
]

#block(inset: (x: 1cm))[#align(center)[*Abstract*]

Urban Building Energy Modeling (UBEM) plays a central role in understanding and forecasting energy consumption at the city scale. In this work, we present a UBEM pipeline that integrates EnergyPlus simulations, high-performance computing (HPC), and open geospatial datasets to estimate the energy demand of buildings in Bologna, Italy. Geometric information---including building footprints and heights---was obtained from the Bologna Open Data portal and enhanced with aerial LiDAR measurements. Non-geometric attributes such as construction materials, insulation characteristics, and window performance were derived from regional building regulations and the European TABULA database. The computation was carried out on Leonardo, the Cineca-hosted supercomputer, enabling the simulation of approximately 25,000 buildings in under 30 minutes.]

#strong[Keywords:] HPC simulations; UBEM; Urban Digital Twin; EnergyPlus; Ray

= Introduction
<introduction>
One of the most pressing issues in the fight against climate change is the energy demand and carbon footprint of buildings. Globally, buildings are responsible for nearly 30% of greenhouse gas emissions, making them a critical sector for targeted interventions @buildings_IEA. Similar findings were also reported by Chen #emph[et al.] (2017) who noted that buildings in cities consume 30--70% of total primary energy, making the retrofit of existing building stock a key strategy for mitigating global warming @CHEN2017323. In densely populated urban areas, understanding how much energy each building consumes, where consumption is highest, and how emissions are distributed across the city is fundamental to optimize both public and private efforts towards decarbonization. Such knowledge is not only essential for managing resources and planning strategic interventions (e.g., renovations, retrofitting, energy system upgrades), but also for allocating public funding more effectively.

Urban Building Energy Modeling (UBEM) is an emerging field that aims to simulate and understand the energy performance of buildings at the neighborhood or city scale. Unlike traditional single-building energy models, UBEMs leverage geospatial datasets and building typologies to produce bottom-up simulations of energy demand, $C O_2$ emissions, and retrofit scenarios across thousands of buildings @Ferrando_2020@JOHARI2020109902.

In their work, Hong #emph[et al.] (2020) emphasized that collective modeling of building stocks can improve energy efficiency, resilience, and sustainability. Moreover, the authors pointed out that UBEM tools integrated with high-performance computing and rich datasets are crucial for planning large-scale retrofits and achieving climate goals @HONG2020106508.

Numerous studies have explored the development of a urban energy model in the context of real cities, highlighting its important role in adaptation planning. Many of these works focus on the potential benefits achievable through retrofitting scenarios, while others analyse the most influential drivers of buildings energy consumption.

One of the most influential contributions in the field has come from the MIT Sustainable Design Lab, led by Prof. Christoph Reinhart. Their seminal work published in 2016, demonstrated a replicable workflow for constructing UBEMs using publicly available GIS data and archetype libraries. By simulating the energy profiles of over 83,000 buildings in Boston, the team showed how UBEM could be employed to evaluate citywide interventions, such as PV installations or district energy networks, and assess their technical and economic viability. Their research highlights the importance of accurate archetype definition, model calibration, and integration with real-world data such as energy audits or metered consumption @CEREZODAVILA2016237.

A similar work by Mutani #emph[et al.] (2020) applied a GIS-based model in Turin, revealing that older, poorly insulated buildings in the city center had the highest energy demand and that low-income areas faced greater energy poverty risks, highlighting the importance of linking energy modeling with social equity @su12145678.

Buckley #emph[et al.] (2021) applied UBEM to 9,000 residential buildings in Dublin, identifying retrofit strategies capable of reducing GHG emissions by up to 60% by 2030, with insulation and airtightness improvements offering the highest cost-effectiveness @BUCKLEY_2021.

Ji #emph[et al.] (2022) developed a bottom-up UBEM for Wuhan and found that commercial and transport buildings exhibited the highest energy use intensity, dominated by cooling loads. Accounting for shading and topography helped improving accuracy in complex urban settings @Ji_2022.

Deng #emph[et al.] (2023) applied a calibrated UBEM to 483 residential buildings in Geneva, projecting that by 2050 heating demand will decrease by 22-31% while cooling demand could rise by 95-173%. They further showed that envelope retrofits could reduce total heating and cooling use by 41.7% and 18.6%, respectively, demonstrating UBEM's value in climate adaptation planning @DENG_2023.

Garcia-Nevado #emph[et al.] (2025) showed that adding open balconies to retrofitted housing in Barcelona slightly increased heating demand by $0.1 - 1.6 k W h \/ m^2 y r$, but significantly reduced cooling demand by $0.1 - 3.8 k W h \/ m^2 y r$, with combined insulation-and-balcony retrofits lowering block-level energy demand by up to 16% @urbansci9110439.

Espino-Reyes #emph[et al.] (2025) developed a national reference model to assess multi-family housing in eight Mexican cities, revealing that domestic water heating is the dominant driver of variable energy consumption, while heating and cooling demands depend strongly on local climate. Their results showed close agreement between simulated and measured electricity use, highlighting the potential of reference buildings as tools for guiding low and nearly zero energy housing design in Mexico @urbansci9040113.

Various approaches exist for building energy modeling. Early models were based purely on physical principles, whereas more advanced approaches integrate statistical methods to incorporate phenomena that cannot be fully explained by physics alone. Foucquier #emph[et al.] (2013) demonstrated that coupling detailed physical models (e.g., CFD) with simplified nodal methods improves accuracy while reducing computation time. Their analysis also found that hybrid grey-box models offer an optimal trade-off between efficiency and precision, making them ideal for large-scale urban energy modeling @FOUCQUIER_2013.

There is also a foundational review of the UBEM domain @REINHART2016196, distinguishing it from earlier top-down approaches and advocating for physical, bottom-up simulations that incorporate heat transfer dynamics, occupancy patterns, and microclimatic effects.

Ali #emph[et al.] (2021) analyzed over two decades of UBEM research and reported that bottom-up physics-based models dominate (2368 studies---nearly four times more than data-driven approaches), with about 70% of applications focusing on energy analysis and optimization. The study emphasized the need for hybrid models that integrate technical precision with urban-scale planning @ALI2021111073.

Cerezo #emph[et al.] (2017) demonstrated that Bayesian-calibrated probabilistic models reduced Energy Use Intensity (EUI) prediction errors by up to 70% compared to deterministic approaches, enhancing the reliability of UBEM predictions at district scale @CEREZO2017321.

Oraiopoulos and Howard (2022) reviewed validated UBEM studies and found that model accuracy varies widely with spatial and temporal resolution---ranging from aggregate annual errors below 1% to individual building errors exceeding 1000%. They showed that Bayesian calibration consistently improved hourly accuracy, underscoring the importance of transparent calibration practices @ORAIOPOULOS_2022.

More recent and advanced approaches incorporate machine learning techniques and data driven methods, demonstrating the potential to enhance model accuracy. However, the reliability of these models strongly depends on the availability of high quality datasets. This approach was applied by Kontokosta and Tull (2017) who developed a predictive model for New York City using machine learning to estimate electricity and natural gas consumption for over 1.1 million buildings, demonstrating that statistical models can generalize well beyond benchmarked properties. Their study highlights that reliable city-scale predictions of building energy consumption can support evidence-based energy policies, helping planners identify inefficiencies and target interventions to reduce carbon emissions @KONTOKOSTA2017303.

Todeschi #emph[et al.] (2021) compared a machine learning model and a GIS-based engineering model for space heating in Fribourg, achieving mean absolute percentage errors of 12.8% and 19.3%, respectively. Model performance varied with building age and geometry, supporting the use of hybrid UBEM approaches @su13041595.

Another representative study is that of Wei #emph[et al.] (2018), showing that data-driven methods, such as NNs and SVMs, achieve high accuracy in predicting and classifying building energy use. Hybrid models significantly improve precision and efficiency compared to traditional simulations @WEI20181027.

In their work, Blanco #emph[et al.] (2024) introduced a data-driven framework to classify urban areas into standardized Urban Energy Units (UEUs) using open data and machine learning. Their method achieved up to 84% accuracy in predicting building age and type, demonstrating its value in improving spatial energy demand mapping and municipal heat planning @BLANCO2024105075.

Many tools were developed to assist with the construction of an UBEM. Depending on the scope and the kind of data available, different choiches can be made.

Ferrando #emph[et al.] (2020) compared major bottom-up UBEM tools and found that while these models provide detailed spatiotemporal simulations, they differ in accuracy, usability, and computational demand. The lack of standardized formats and validation benchmarks remains a key barrier to widespread adoption @FERRANDO2020102408.

Malhotra #emph[et al.] (2022) examined 72 UBEM studies, finding that EnergyPlus is the most widely used simulation engine (38%) and CityGML the most common data model (27%), though direct compatibility between the two remains limited. They observed that only 44% of studies validated against measured data and that roughly 95% lacked reproducibility due to insufficient data transparency @MALHOTRA2022108552.

Hong #emph[et al.] (2016) developed the City Building Energy Saver (CityBES), an open web-based platform that automatically generates and simulates urban building energy models based on GIS data, integrating EnergyPlus simulations for city-scale retrofit analysis. Their approach significantly reduced technical barriers for municipalities by providing an accessible tool for evaluating energy conservation measures across entire building stocks @hong_2016.

Similarly, the City Energy Analyst (CEA) provides a computational framework for the analysis and optimization of energy systems in neighborhoods and city districts, integrating time-dependent simulations of demand, local resources, and distributed generation within a single spatial interface. This holistic approach underscores the importance of coupling urban design with energy system optimization to achieve sustainable development goals @FONSECA_2016.

Kasmeridis #emph[et al.] (2025) validated the BIPV-city platform, showing strong agreement with TRNSYS simulations (irradiance errors within $plus.minus 2 %$, PV output deviations $< plus.minus 10 %$), confirming that open digital twin tools can accelerate carbon-neutral urban transitions @urbansci_kasmeridis_2025.

Simulation results have also demonstrated the substantial impact of green infrastructure strategies on building energy performance. For instance, Turhan #emph[et al.] (2025) illustrated that applying #emph[Hedera canariensis gomera] on walls and #emph[Phyllanthus bourgeoisii] on roofs reduced total energy use by 9.21% and improved comfort by 23.21%, underscoring the potential of nature-based retrofitting strategies @urbansci7030096. Another illustrative example can be found in the work of Romeo #emph[et al.] (2025), which showed that combining envelope upgrades with photovoltaic systems could reduce annual energy consumption by up to 82% and achieve near net-zero performance in Perth's residential sector, demonstrating the power of integrated passive and active measures @urbansci9100421.

In their analysis Rodrigues #emph[et al.] (2024) found that UBEMs effectively evaluate PV system performance and microclimatic impacts, finding that urban heat island effects can reduce PV efficiency and that BIPV configuration strongly affects cooling loads and outdoor comfort @urbansci8040215.

Several studies have investigated the importance of integrating UBEM with other urban systems, such as mobility or climate models, to address the complexity of urban processes and improve the robustness of models @JOHARI2020109902@ABBASABADI2019106270. Khan #emph[et al.] (2025) demonstrated that integrating smart grids and renewable energy systems can cut urban energy use by up to 15% and per capita emissions by 12%, reinforcing that machine-learning-based prediction and digital infrastructure are vital for decarbonization @urbansci_khan_2025.

Despite the rapid progress that has been made and the important outcomes obtained, challenges remain, such as the need for computational efficiency when working with large urban datasets, the limited availability of high-resolution input, and uncertainty in occupant behavior modeling. On this topic, Goy #emph[et al.] (2020) conducted a large-scale sensitivity analysis emphasizing that data quality and accessibility directly impact model accuracy and replicability @en13164244.

Johari #emph[et al.] (2020) observed that current UBEMs struggle to capture variations in building physics and occupant behavior, producing uncertainty in energy predictions. They found that hybrid approaches (i.e., combining physics-based and data-driven models) show the greatest potential, though validation against measured data remains limited @JOHARI_2020.

Chen #emph[et al.] (2020) addressed a similar issue by introducing a rapid automatic calibration method that learns from pre-simulated energy performance databases, showing that UBEMs can be effectively calibrated with limited annual energy data. Their approach reduced the average calibration effort to fewer than four simulation runs per building while substantially improving alignment with measured data @CHEN2020115584.

Building on the insights reported in the literature, this paper outlines the workflow implemented to conduct large-scale energy consumption simulations for individual buildings in the Municipality of Bologna, leveraging high-performance computing (HPC) resources. In the following sections, we first provide a comprehensive overview of the datasets used as the foundation for running the energy simulations. We then describe in detail the methodology and computational tools employed to scale and orchestrate the simulation workflow, enabling the efficient execution of energy models for up to 25,000 distinct buildings. Finally, we present the results obtained from the large-scale simulations and discuss possible improvements and future directions for enhancing the scalability, accuracy, and applicability of the simulation framework.

This work is part of the project “Bologna Digital Twin“, a collaborative initiative promoted by the Municipality of Bologna and coordinated by the Fondazione Bruno Kessler (FBK) in partnership with Cineca, the University of Bologna, and the Fondazione IU Rusconi Ghigi.

= Building Data and Input Parameters
<building-data-and-input-parameters>
The accuracy of a UBEM primarily depends on the quality and quantity of available data that are synthesized in the input file of the simulations, such as building geometries, construction materials, installed HVAC systems, occupancy types, and historical energy consumption data. When implementing a city-scale model, it becomes necessary to find a balance between the number of buildings modeled and the level of detail of the available data. Our prototype energy model has limited detail on individual buildings because there is no consistent, in-depth data available on the entire urban building stock. We only used available open data and constructed a system of building archetypes based on year of construction. This approach allowed us to simulate a very large number of buildings and provide a complete representation of urban consumption and its distribution across the territory.

There are several tools for energy building simulations; among the various alternatives, the choice is to use EnergyPlus @EnergyPlus940, one of the most widely used simulation engines in major energy simulation tools such as CityBES @hong_2016 and UMI @UMI. EnergyPlus requires input files (`.idf` files) that specify the characteristics of each building. At the end of the simulation, output files describing the "energy behavior" of the building are produced. Geometric information is extracted from open data provided by the Municipality of Bologna, and Digital Terrain Model (DTM) and Digital Surface Model (DSM) extracted from LiDAR data. Information on construction materials is obtained from the TABULA project and legal regulations. The following paragraphs present the data used to prepare the input files for the simulations.

== Open Data Comune di Bologna
<open-data-comune-di-bologna>
The #emph[Open Data Comune di Bologna] portal #footnote[Available at #link("https://opendata.comune.bologna.it/pages/home/").], managed by the Municipality of Bologna, provides a comprehensive repository of datasets related to different aspects of the city. Among the available datasets, we utilize the following key resources:

- #emph[Edifici Particellari]: This dataset offers detailed information on individual building parcels within Bologna, including attributes such as plan area and Geo Shape of buildings. Figure ~@fig1 shows a visualization of the buildings' geometries extracted from this dataset.

- #emph[Edifici Volumetrici]: This dataset provides three-dimensional representations of buildings, capturing volumetric data such as height, plan area and Geo Shapes of buildings.

- #emph[Numeri Civici]: This dataset contains the geolocated addresses (house numbers) throughout the city, facilitating accurate mapping and navigation tasks, and a variable that has been used as proxy for construction year.

#figure(image("source/img/edifici_particellari.png"),
  caption: [
    A set of shapefile polygons representing building footprints in Bologna from Edifici Particellari dataset.
  ]
)
<fig1>

== TABULA
<tabula-section>
In our study, we also integrate information from TABULA (Typology Approach for Building Stock Energy Assessment) @tabula, an European research project aimed at creating a standardized typology of residential buildings across EU countries. The project provides reference data for building components, including typical wall constructions, insulation levels, and thermal transmittance values (U-values) based on building age, typology, and country-specific construction practices.

We use the Italian TABULA dataset #footnote[Available at #link("https://webtool.building-typology.eu/").] to estimate parameters such as wall thickness, thermal conductivity, and overall heat transfer coefficients for the building stock in Bologna. This information is essential for urban energy simulations, particularly when detailed architectural or construction data are not available for each individual building. By leveraging TABULA, we ensure a consistent and replicable approach to modeling the thermal performance of buildings at scale across the urban fabric.

== Legal Regulations
<legal-regulations>
In addition to TABULA, we also refer to Italian national building codes and energy efficiency regulations to verify thermal parameters. These normative references are crucial for aligning our assumptions with the current legal framework, especially for newly built or renovated structures where regulation-based requirements may differ from historical averages provided by TABULA.

By combining empirical typologies with regulatory standards, we aim to ensure both accuracy and legal consistency in our energy modeling approach. This is a list of used regulations:

- UNI 10351 - Valori di trasmittanza, conducibilità termica e vapore di materiali OMOGENEI;

- UNI EN ISO 6946 ITA - Resistenza e trasmittanza termica di elementi dell'edilizia.

== Energy Plus and Climate File
<energy-plus-and-climate-file>
EnergyPlus is an open-source building energy simulation software that has been produced by the U.S. Department of Energy since 1997. It models heat transfer through the building envelope, the operation of HVAC systems, and natural or mechanical ventilation, while also accounting for solar gains, infiltration, and occupant behavior. To perform these simulations, EnergyPlus requires two essential inputs: (1) a building description file (i.e., the `.idf` file) containing information such as geometry, materials, internal loads, and system configurations, and (2) a climate file (`.epw`) that provides meteorological data representative of the study area.

The `.epw` file (EnergyPlus Weather file) is a standardized format that contains hourly data on temperature, humidity, solar radiation, and other climatic variables. By using Typical Meteorological Year (TMY) datasets EnergyPlus is able to simulate energy performance under realistic local conditions. Our prototype incorporates the TMY 2009-2023 for Bologna #footnote[Available at #link("https://climate.onebuilding.org/WMO_Region_6_Europe/ITA_Italy/index.html").]. This allows the model not only to estimate annual consumption and emissions but also to test "what-if" scenarios, compare retrofit strategies, and evaluate building performance under different climate assumptions. In this way, the climate file plays a crucial role in ensuring that simulations are both location-specific and reproducible.

= Methodology
<methodology>
Our strategy involves collecting and integrating geospatial and typological data from multiple sources to characterize the geometrical and thermal properties of buildings in the urban context. Some properties, such as height and plan area, are assigned directly to individual buildings, while others, like building material and window characteristics, are specified after partitioning buildings into archetypes based on TABULA values. Following this step, we implemented a pipeline to automatically generate a specific `.idf` file containing all the information for each building. The `.idf` files are then used as input for simulations carried out with EnergyPlus. @fig2 shows the visualization of an input file that was used for the simulation.

Leveraging the Leonardo high-performance computing (HPC) infrastructure it was possible to perform the simulation of approximately 25,000 buildings in less than 30 minutes using 1,120 CPU cores. After the simulation of the current buildings state, we analyzed possible retrofitting scenarios using optimization techniques such as Pareto analysis, and identified the archetypes with the higher benefits concerning energy consumption.

The following sections describe in depth how the homogeneous dataset for the building stock was created.

== Data Integration
<data-integration>
Geometrical data was primarily sourced from #emph[Open Data Comune di Bologna] portal, which provides detailed footprints and approximate building heights. LiDAR data were used to fill gaps in the Open Data, providing accurate height information.

The dataset #emph[Edifici Particellari] and the dataset #emph[Edifici Volumetrici] have different identification codes (as they refer to different objects: within the same parcel there may be one or more volumetric units); for this reason, it was necessary to perform a spatial join in order to integrate them. The #emph[Numeri Civici] dataset, on the other hand, shares the same identification code as the #emph[Edifici particellari], although it has significantly fewer unique codes than the latter. The integration of these different sources made it possible to build a comprehensive dataset of approximately 25,000 building constructions, using the parcel building code as the identifier. The information contained in this dataset for each unit includes geometry, surface area, height, and year of construction.

#figure(image("source/img/edificio_idf_files.png"),
  caption: [
    Example of $2.5 D$, or LoD1, geometry of a building in Bologna using building plan vertices taken from its Geo Shape and the height found by LiDAR. The windows were added respecting the legal regulation between $frac(w i n d o w e d_(a r e a), p l a n_(a r e a)) = 1 / 8$.
  ]
)
<fig2>

== Building Height Extraction
<building-height-extraction>
When data from the #emph[Edifici Volumetrici] dataset was not available, building heights were extracted by using polygon shapefiles representing building footprints obtained from #emph[Open Data Comune di Bologna] portal. To accurately determine building heights, we calculated the difference between Digital Surface Model (DSM) and Digital Terrain Model (DTM), thus excluding ground elevation. Given that EnergyPlus considers buildings as 2.5D structures (box-shaped without roofs, so LoD1 buildings), only the perimeter of each building polygon was considered. Polygons were buffered to ensure the exclusion of roof heights, and the maximum DSM-DTM difference along each buffered perimeter was selected to represent the building's height. @fig3 shows an example of buildings height extraction.

#figure(
  grid(
    columns: (1fr, 1fr), gutter: 10pt, align: center,
    [#image("source/img/shape_buildings.png", height: 6cm) \ (a)],
    [#image("source/img/perimetro_edifici.png", height: 6cm) \ (b)],
  ),
  caption: [Example of buildings height extraction. (a) Building shapes from Open Data. (b) Building perimeter footprint used to extract the height.],
) <fig3>

== Building Archetypes
<building-archetypes>
In order to further differentiate buildings, we grouped buildings into archetypes according to a range of construction years referencing the TABULA classification. Eight types of archetypes were identified based on the year of construction (\<1900, 1901-1920, 1921-1945, 1946-1960, 1961-1975, 1976-1990, 1991-2005, \>2005) distributed across the areas of Bologna as illustrated in @fig4. For each category, we enrich the corresponding input files with information provided on building components, including wall construction, insulation levels, thermal transmittance values (U-values), window composition, etc.,

#figure(image("source/img/distribuzione_archetipi_new.png", height: 6cm),
  caption: [
    Age-based archetypes distribution in the city center of Bologna.
  ]
)
<fig4>

= Results
<results>
The simulation pipeline comprises two sequential stages: the generation of the EnergyPlus input file (`.idf`) and the execution of the EnergyPlus simulation itself. Managing the parallel execution of this pipeline across tens of thousands of buildings poses substantial orchestration challenges as simulations must be dynamically queued and dispatched as computational resources and “logical“#footnote[A simulation cannot be started before the corresponding `.idf` file is created.] dependencies become available, ensuring continuous utilization of CPU cores without manual intervention.

Each building simulation is largely independent from other construction simulations, with the only interdependence arising from shadow interactions between buildings. These interactions are handled by embedding the geometry of neighboring buildings directly within the input file of the target building. Beyond this preprocessing step, simulations operate in complete isolation, without requiring inter-process communication or synchronization. This independence classifies the task as an embarrassingly parallel problem---one that is particularly well suited for high-performance computing environments. Once the `.idf` files are generated, the workload can be readily distributed across multiple compute nodes, significantly reducing total simulation time.

To address these orchestration and scalability challenges, we adopted the Ray distributed computing framework, implementing each step as an independent Ray task. This architecture enables fault-tolerant and resource-efficient orchestration while providing excellent scalability: by simply adding compute nodes to the Ray cluster, the system can seamlessly execute a larger number of simulations in parallel, thereby reducing total computation time in proportion to the available resources.

For optimal resource utilization, we assigned one CPU core per task. This decision was guided by the current design of EnergyPlus, which does not support multithreading within a single simulation. As a result, allocating multiple cores to a single simulation yields no performance gains. Consequently, distributing the workload such that each simulation runs on a single core maximizes the resource usage.

The EnergyPlus simulations were executed on the Leonardo high-performance computing (HPC) cluster at Cineca. Each compute node provides 112 CPU cores and 512 GB of RAM, offering a solid foundation for single-node parallelization of the simulation workload. By leveraging 10 compute nodes---equivalent to 1,120 cores---the simulation of approximately 25,000 buildings was completed in roughly 30 minutes. For further discussion of scalability aspects, see Section @simul_performance.

@fig6 shows the result of the simulation step.

#figure(image("source/img/consumi_simulati_normalizzati_new.png", height: 6cm),
  caption: [
    Annual normalized simulated energy consumption for buildings in Bologna center. 
  ]
)
<fig6>

== Calibration
<calibration>
To evaluate the reliability of the archetypes and the predictive accuracy of the resulting simulations, a calibration phase must be conducted using real energy consumption data from the residential buildings. However, consumption data with daily or monthly resolution are generally difficult to access due to privacy constraints and regulatory restrictions, making their use challenging unless the data are properly anonymized and aggregated. Moreover, such datasets are often held by multiple private entities, further complicating efforts to collect the comprehensive information required for robust calibration.

To compensate the lack of direct observational data on energy consumption in Bologna, we verified the reliability of our simulations by comparing the results with the energy demand of archetypal buildings provided by the TABULA project for the city of Turin.

However, two important considerations must be noted regarding this comparison:

- The values provided by TABULA are based on the climate of Turin. Although both Bologna and Turin belong to the same Italian climate zone (Zone E), Bologna generally experiences milder temperatures, which should result in lower heating energy consumption. A potential approach to address this discrepancy is to run the simulations using a weather file representative of Turin, thereby estimating the average heating demand per square meter under the same climatic conditions, enabling a consistent comparison with the TABULA data;

- According to @tabula the heating needs reported in the TABULA web tool are computed based on the UNI/TS 11300 series of technical specifications, which adopt a #emph[quasi-steady-state] method. This method approximates energy flows as constant over time. In contrast, Energy Plus uses a dynamic method that simulates energy consumption by accounting for continuous changes that influence energy use. A few studies @CORRADO2016200@CORRADO2018 show that UNI/TS 11300 procedure yields higher estimated energy needs than those simulated with EnergyPlus. Consequently, it is reasonable to expect EnergyPlus to yield lower heating energy consumption estimates than those reported by TABULA.

The plot in @figB.1.1 compares the results obtained for Bologna and Turin using EnergyPlus and TABULA values.

#figure(image("source/img/AppendixB.1.1_new.png", width: 80.0%),
  caption: [
    Comparison between the heating consumption simulated by Energy Plus for Bologna, Torino and the energy needs reported by TABULA.
  ]
)
<figB.1.1>

To calculate the average energy consumption per square meter for the EnergyPlus simulation, we averaged the heating and cooling requirements of buildings with similar floor areas to those used to construct the archetypes by Tabula.

Consistent with the findings reported in previous studies, the heating consumption estimated using EnergyPlus is lower than the heating demand calculated according to UNI/TS 11300 in TABULA. Nevertheless, the overall trend remains comparable, indicating that the simulation results are reasonably reliable. For a detailed description of the simulation results, see Appendix @current_energy_consumption.

== Scenario Analysis
<scenario-analysis>
In contexts where a proper calibration is missing, simulations can still be leveraged for qualitative “what-if“ scenario analyses. These analyses explore hypothetical interventions and their potential energy impact across the building stock.

Typical scenarios analyzed include:

- Neighborhoods benefit: which neighborhoods would benefit most from efficiency policies.

- No renovation vs. full retrofit: assessing the citywide performance improvement based on building's envelope improvement and window replacement;

While qualitative, these scenarios provide valuable foresight for long-term urban planning, particularly in districts under redevelopment pressure or policy-driven transformation goals.

=== Impact of Building Renovations on Neighbourhood Energy Performance
<impact-of-building-renovations-on-neighbourhood-energy-performance>
For each archetype, TABULA proposes two types of refurbishment. We choose the standard one and applied it to all the archetypes; then, for each neighborhood, we calculated the average total energy savings percentage in $k W h \/ m^2$ achievable across the buildings in that area. As it can be seen in Figure @energy_savings_by_neighborhood there isn't a restricted subset of neighborhoods that would benefit the most in terms of energy savings. This because old buildings are evenly spread across all the neighborhoods.

#figure(image("source/img/AppendixD.1.1_new.png", width: 80.0%),
  caption: [
    Total energy savings percentage (in $k W h \/ m^2$) grouped by neighborhoods.
  ]
)
<energy_savings_by_neighborhood>

=== City-Scale Effects of Building Retrofits
<city-scale-effects-of-building-retrofits>
@figD.1.3 shows the energy consumption of buildings before and after the refurbishment. Each point represents a building. The x-axis shows the energy consumption of the existing state, and the y-axis shows the energy consumption after standard refurbishment. The closer a building is to the red line, the less impact the refurbishment will have on it. As it can be seen, the most recent buildings are very close to the red line because the construction materials used are already efficient enough. On the opposite, archetypes from the middle of the past century offer the best advantages in terms of consumption improvement.

#figure(image("source/img/AppendixD.1.3_new.png", width: 80.0%),
  caption: [
    Assessment of the refurbishment impact grouped by archetype.
  ]
)
<figD.1.3>

Refurbishment planning often involves trade-offs between multiple conflicting objectives, such as: reducing energy consumption, minimizing investment costs, and limiting the number of buildings targeted for intervention.

In such multi-objective contexts, the Pareto front is a valuable decision-making tool. A Pareto front represents the set of non-dominated solutions (i.e., scenarios in which no objective can be improved without worsening another); in other words, rather than focusing on a single optimal solution, the front highlights a range of optimal trade-offs. In the context of refurbishment, this might mean identifying scenarios where maximum energy savings are achieved for a given cost, or where the highest return is obtained from refurbishing the fewest buildings.

For our purpose, the optimization problem consists of minimizing the following objectives:

- number of buildings refurbished;

- total energy consumption of the city.

The explored scenarios are based on combinations of refurbished buildings based on the construction periods. Specifically, in each scenario all buildings from certain periods are retrofitted (i.e., 0% or 100% of buildings made in 1950).

@figD.1.4 shows the results of the refurbishment scenario selection. Each point represents a specific scenario: the red points describe optimal scenarios in terms of minimal number of buildings retrofitted and the total energy per $m^2$ used; the light blue bue points represent non-optimal scenarios.

#figure(image("source/img/AppendixD.1.4_new.png", width: 80.0%),
  caption: [
    Pareto front for refurbishment scenario selection.
  ]
)
<figD.1.4>

In @figD.1.5, each column of the binary map represents a scenario on the Pareto front. A scenario is defined as a combination of archetypes that have been retrofitted and archetypes that have been left unchanged. There is therefore a one-to-one correspondence between the red dots in @figD.1.4 and the columns of the matrix in @figD.1.5. Each row refers to a specific archetype: a blue cell indicates that the archetype in the corresponding row has been completely retrofitted in the scenario in the corresponding column. A white cell indicates that the corresponding archetype has not been modified in that scenario. This helps visually detect patterns, for example: "Buildings from 1946 to 1960 are almost always retrofitted in solutions that turned out to be optimal" or "\>2005 buildings are never retrofitted in optimal scenarios".

#figure(image("source/img/AppendixD.1.5_new.png", height: 5cm),
  caption: [
    A binary visualization of the retrofit combinations for scenarios on the Pareto front.
  ]
)
<figD.1.5>

As evidenced from the binary map, the archetypes that are often included in the Pareto front are: 1946-1960 (27 times), 1901-1920 (20 times), \<1900 (19 times), 1961-1975 (18 times). Buildings corresponding to these archetypes thus constitute the key priority areas for decision-makers.

= Discussion
<discussion>
The use of geometric data, complemented with LiDAR data and TABULA archetypes, enabled the development of city-scale simulations starting from publicly available datasets. The HPC infrastructure proved effective in handling the computational load associated with large scale simulations, providing a robust and scalable scalable solution that can be replicated in other urban contexts.

However, several limitations must be acknowledged. To enable simulation at the urban scale, only a limited set of non-standard, building-specific parameters could be used, resulting in simplifications regarding construction characteristics and operational behavior (e.g., HVAC system configurations, occupancy patterns, etc.). These simplifications, while necessary for a simulation at a large scale, can introduce uncertainties in the results, particularly when assessing buildings with atypical characteristics or complex operational profiles. One of the most critical and uncertain aspects is the behavior of building occupants. Occupant schedules, internal gains, and system usage patterns have a significant impact on energy consumption, but are inherently variable and difficult to capture accurately in large-scale archetype-based models.

Although archetypes provide a structured and standardized foundation for assigning construction materials, they cannot fully reflect the diversity of real-world conditions at the individual building level. This limitation becomes especially evident when key information, such as the construction year or records of past refurbishments, is unavailable or only partially available, as in our case.

Finally, the absence of a proper calibration step limits the reliability of the results, potentially leading to discrepancies between simulated outcomes and actual energy performance. As a consequence, the findings should be interpreted primarily in qualitative terms rather than as precise quantitative estimates.

= Conclusions
<conclusions>
This study successfully demonstrates the feasibility of large-scale Urban Building Energy Modeling (UBEM) by combining publicly available datasets, regulatory data, real world archetypes from TABULA, and the computational power of a high-performance computing (HPC) environment. Through the integration of detailed geospatial datasets---including LiDAR-derived DSM/DTM, building footprints, and volumetric data---with archetypal characteristics, we have constructed a robust and scalable pipeline capable of simulating the energy behavior of over approximately 25,000 buildings in the city of Bologna in less than 30 minutes.

The use of EnergyPlus enabled detailed thermal and energy simulations under realistic climate conditions, while the adoption of a parallel architecture based on Ray facilitated the efficient orchestration and execution of thousands of independent simulations. The results provide an unprecedented, spatially understanding of energy consumption patterns in Bologna's urban fabric and offer a valuable tool for supporting energy planning and decarbonization strategies.

Looking ahead, future improvements should focus on the integration of real-world consumption data, which should be anonymized and aggregated appropriately, to calibrate the model and enhance reliability of the simulations. Introducing temporal dynamics, such as variable occupancy patterns and seasonal effects, would further improve the realism of the simulations. Moreover, integrating this modeling framework with other urban layers, including mobility data, socio-economic indicators, and urban microclimate models, would facilitate the development of more comprehensive urban energy strategies.

In conclusion, this research demonstrates how a scalable data-driven UBEM framework can support the digital transformation of urban energy systems, providing a replicable methodology for cities aiming to transition toward sustainable and climate-resilient futures.

#pagebreak(weak: true)
#heading(level: 1, numbering: none)[Appendix]
#set heading(numbering: "A.1")
#counter(heading).update(0)
<appendix>
= Simulation performance evaluation
<simul_performance>
== Exploring the impact of shading buffers and cluster size on total simulation time
<exploring-the-impact-of-shading-buffers-and-cluster-size-on-total-simulation-time>
In dynamic energy simulations, the representation of shading interactions between constructions is crucial for reliably estimating a building's energy consumption, particularly for heating and cooling loads. EnergyPlus allows for the detailed modeling of shading geometries. For our purposes, we used the `Shading:Building:Detailed` object, which describes shading elements that are external to the building#footnote[For more information about the shading module, you can refer to the official documentation #link("https://bigladdersoftware.com/epx/docs/8-6/input-output-reference/group-thermal-zone-description-geometry.html#shadingsitedetailed-shadingbuildingdetailed").]. Therefore, we modeled nearby buildings using their geoshapes and included them into the `.idf` file of the building to be simulated.

The choice of shading radius, which defines the spatial extent of nearby buildings included in the simulation, affects both the accuracy and complexity of energy simulation: a smaller radius may underestimate shading effects, while a larger one captures more accurate interactions, especially in dense urban areas. However, increasing the radius also raises the number of surfaces involved in ray-tracing and shadow projections computations, substantially increasing simulation times.

Our simulation pipeline therefore requires tuning of the shading radius parameter. @figA.1.1 presents the execution times associated with the simulation of the entire building stock while varying the number of nodes utilized for parallelization and adjusting the radius used to model surrounding buildings. As evidenced by the plot, an increase in the inclusion radius leads to an increase in total simulation time. This behavior manifests as a vertical translation along the time axis in curves corresponding to different radii.

#figure(image("source/img/total_execution_time.png", width: 90.0%),
  caption: [
    Total execution time variation reducing the radius and adding more nodes to the Ray cluster.
  ]
)
<figA.1.1>

The total execution time associated with a given radius configuration can be reduced by increasing the number of simulations executed in parallel. This is accomplished by augmenting the pool of Ray workers through the addition of computational nodes. The Ray scheduler will then autonomously allocate the available CPU cores within the cluster to execute multiple simulations concurrently, thereby reducing the number of buildings remaining in queue waiting for resources. However, it is important to note that even when utilizing a cluster with 24,537 CPU cores#footnote[The total number of buildings to be simulated is 24,537. Under this configuration, perfect parallelism is attained since a one-to-one correspondence exists between building simulations and available CPU cores.], the overall execution time remains constrained by the duration of the longest individual building simulation. Consequently, each radius configuration is associated with a baseline execution time that cannot be further reduced through parallelization.

We evaluated the potential benefits of increased parallelization across different combinations of nodes and radii by subtracting the mean simulation time of the ten slowest-running buildings from the total simulation time. This provides an estimate of the time savings achievable by executing a larger number of building simulations in parallel. The resulting speed-ups obtained by progressively increasing the number of worker nodes in the computing cluster are illustrated in @figA.1.2.

#figure(image("source/img/potential_speedup.png", width: 80.0%),
  caption: [
    Potential speed-up obtainable by increasing the number of concurrent building simulations.
  ]
)
<figA.1.2>

As shown in the @figA.1.2, increasing the number of nodes in the Ray cluster results in a downward shift along the vertical axis, as more buildings can be simulated concurrently, thereby reducing the overall execution time. The spread between the curves is also impacted by variations in buffer size: larger buffers require a greater number of shade projections to be computed, which increases the baseline execution time and consequently diminishes the relative gains achievable through additional parallelization.

With a cluster configuration of 10 computing nodes, the performance improvement over the previous node configuration is maximized. Although a further increase in the number of nodes could theoretically shorten the gap between the baseline and total execution times, the resulting gains are marginal when considering the additional resource consumption and the increase in scheduling and communication overhead. Specifically, only negligible reductions in execution time are observed, especially for radii configurations smaller than 60m. Consequently, the configuration with 10 nodes and 60m buffer represents a balanced and robust option, achieving efficient utilization of computational resources while preserving sufficiently low total execution times.

== Sensitivity of energy demand to shading buffers
<sensitivity-of-energy-demand-to-shading-buffers>
The shadow buffer radius not only affects the simulation time, but also the total simulated energy consumption. In this section, we investigate how varying the shading buffer radius affects simulated energy consumption.

The plot in @figA.2.1 displays the percentage change in average energy intensity ($k W h \/ m^2$) across all buildings as a function of the shading buffer radius. On the x-axis are the various shading buffers considered in the simulations. For each radius, the corresponding value on the y-axis represents the relative change in mean energy intensity compared to the simulation with the minimum shading radius of 10m. This valued is calculated using the following formula: $ (E_r / E_(m i n) - 1) times 100 $ Where:

- $E_r$ is the mean energy intensity (kWh/m²) at a given radius $r$.

- $E_(m i n)$ is the mean energy intensity (kWh/m²) at the smallest radius of $10 m$.

This normalization allows us to evaluate how sensitive the energy demand is to changes in shading radius, independent of absolute values.

#figure(image("source/img/AppendixA.2.1_new.png", width: 80.0%),
  caption: [
    Relative change in mean energy intensity ($k W h \/ m^2$) across different shading radii.
  ]
)
<figA.2.1>

The results show that as the shading radius increases:

- Heating demand increases by up to +3%, due to reduced solar heat gains caused by the additional shading from surrounding buildings. This indicates that larger buffers limit passive solar heating, especially in winter.

- Cooling demand decreases by up to - 6%, as increased shading helps mitigate solar overheating during warmer months.

- The overall energy intensity change is positive, reflecting the net effect of increased heating demand outweighing the cooling energy savings in the simulated climate.

However, the percentage differences across radii are relatively small (e.g., within ±5–6%). Therefore, in addition to the considerations in the previous section, a mid-range radius provides a good balance between simulation accuracy and computational cost. Moreover, if we specifically analyze the average total energy as a function of the shading radius, as shown in @figA.2.2, we can observe an “elbow“ around a radius of 60m. Overall, the total energy demand exhibits only moderate variation across different radii.

#figure(layout(size => average-energy(size.width * .8)),
  caption: [
    Average total energy as a function of the shading radius.
  ]
)
<figA.2.2>

= Urban energy profile assessment: analysis of simulated energy consumption for the current building stock
<current_energy_consumption>
This section presents the results obtained by simulating the energy consumption of the existing building stock. To better understand the diversity in building energy consumption, we first explore the distribution of total energy use per square meter ($k W h \/ m^2$) grouped by the archetypes. This allows us to assess how energy needs vary with building characteristics.

As shown in @figC.1.1, the histograms reveal differences in energy intensity ($k W h \/ m^2$) across buildings from different construction periods. Older buildings tend to show broader and right-skewed distributions, indicating a higher variability and, generally, greater energy demands. This is likely due to poorer thermal performance, limited insulation, and outdated envelope standards typical of early 20th-century construction. In contrast, more recent buildings, particularly those built after 1975, show narrower and left-shifted distributions, reflecting improved energy performance likely due to stricter building codes and more efficient construction techniques. The progressive shift toward lower energy intensity over time highlights the impact of energy regulations and retrofitting practices on reducing energy demand per square meter.

#figure(image("source/img/AppendixC.1.1_new.png", width: 80.0%),
  caption: [
    Energy intensity distribution by period of construction.
  ]
)
<figC.1.1>

Pareto analysis helps to identify the most significant factors contributing to an outcome, allowing for prioritized actions where they matter most. In the context of building energy consumption, Pareto analysis is often used to identify which buildings or zones consume the most energy, allowing retrofits and policy interventions to be focused on high-impact areas. Typically, about 80% of the effects stem from 20% of the causes. While our situation yields different results, they can still be useful for targeted action.

The Pareto plot in @figC.1.2 reveals that almost 70% of buildings account for 80% of the total energy consumption in terms of total energy consumption. This demonstrates a distribution flatter than expected in typical urban energy datasets and suggests that high energy consumption is not highly concentrated in a small subset of buildings, but rather widely distributed across much of the stock. As a result, energy efficiency policies must be broadly targeted, instead of focusing only on a few outliers.

#figure(image("source/img/AppendixC.1.2_new.png", width: 80.0%),
  caption: [
    Pareto cumulative energy intensity consumption.
  ]
)
<figC.1.2>

@figC.1.3 shows that most of the buildings with the highest energy consumption obtained with the Pareto analysis are the oldest ones or were built in the middle of the past century, when construction laws were less restrictive in terms of efficiency.

#figure(image("source/img/AppendixC.1.3_new.png", width: 80.0%),
  caption: [
    Year distribution of most consuming buildings.
  ]
)
<figC.1.3>

After simulating the building's energy consumption, it is possible to estimate its $C O_2$ emissions. To do so, we can compute an approximation using the emission factor, which is a conversion factor that depends on the fuel used to generate energy. This $C O_2$ estimate doesn't consider other greenhouse gases; therefore, we cannot talk about the equivalent $C O_2$, but it's a good approximation. We used the emission factor provided by ISPRA in document @ISPRA2025NID for the year 2023, which is $59.182 t C O_2 \/ T J$ and obtained an average $C O_2$ emission of 12.2 $k g \/ m^2$. This value likely underestimates the actual value because it only considers $C O_2$ emissions from gas consumption, not from electricity or other greenhouse gases.

#block[
\-0cm

]
#block[
\-0cm

]

#bibliography("source/refs.bib", style: "ieee")