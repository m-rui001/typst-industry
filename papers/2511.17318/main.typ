#set document(title: "FORWARD: Dataset of a forwarder operating in rough terrain")
#set page(paper: "a4", margin: 1in, numbering: "1")
#set text(font: "New Computer Modern", size: 11pt)
#set par(justify: true, leading: .48em)
#set heading(numbering: "1.1")
#set math.equation(numbering: "(1)")
#set figure(supplement: [Figure])
#set table(inset: 4pt)
#show figure.caption: set text(size: 9.5pt)

#align(center)[
  #text(size: 17pt)[FORWARD: Dataset of a forwarder operating in rough terrain]

  Mikael Lundbäck#super[1,\*], Erik Wallin#super[1], Carola Häggström#super[2],
  Mattias Nyström#super[3], Andreas Grönlund#super[3], Mats Richardson#super[4],
  Petrus Jönsson#super[4], William Arnvik#super[2], Lucas Hedström#super[1],
  Arvid Fälldin#super[1], and Martin Servin#super[1]

  #text(size: 9.5pt)[
    #super[1] Department of Physics, Umeå University \
    #super[2] Department of Forest Biomaterials and Technology, Swedish University of Agricultural Sciences \
    #super[3] Komatsu Forest AB \
    #super[4] Skogforsk, Swedish Forest Research Institute
  ]
]

#block(inset: (x: 1cm))[#align(center)[*Abstract*]

We present FORWARD, a high-resolution multimodal dataset of a cut-to-length forwarder operating in rough terrain on two harvest sites in the middle part of Sweden.
    The forwarder is a large Komatsu model equipped with a variety of sensors, including RTK-GNSS, 360-camera, operator vibration sensors, internal CAN-bus signal recording, and multiple IMUs.
    The data includes event time logs recorded in 5 Hz with e.g., driving speed, fuel consumption, vehicle position with centimeter accuracy, and crane use while the vehicle operates in forest areas laser-scanned with very high-resolution, about 1,500 points per square meter.
    Production log files (StanForD standard) with time-stamped machine events, extensive video material, and terrain data in various formats are included as well.
    About 18 hours of regular wood extraction work during three days is annotated from 360-video material into individual work elements and included in the dataset.
    We also include scenario specifications of conducted experiments on forest roads and in terrain.
    Scenarios include repeatedly driving the same routes with and without steel tracks, different load weight, and different target driving speeds.
    The dataset is intended for developing models and algorithms for trafficability, perception, and autonomous control of forest machines using artificial intelligence, simulation, and experiments on physical testbeds.
    In part we focus on forwarders traversing terrain, avoiding obstacles, and loading or unloading logs, with consideration for efficiency, fuel consumption, safety, and environmental impact.
    Other benefits of the open dataset include the ability to explore auto-generation and calibration of forestry machine simulators and automation scenario descriptions using the data recorded in the field.
    The data, scripts for data exploration and analysis, and some example analyses are long-term publicly available through the Swedish National Data Service.]

= Introduction
<introduction>
The availability of well-annotated data is essential for the development and evaluation of both data-driven and physics-based models essential for automation and high-precision planning. The big advancements in computer vision and deep learning including image recognition, object detection, and semantic segmentation is largely a result of the efforts in creating and openly sharing annotated datasets. In autonomous driving, there are several open datasets~@Geiger2012CVPR@maddern20171 that support the development of algorithms for localization and mapping, and decision-making~@wang2024survey. The same data may also be used to create realistic simulators and synthetic generation of data that complements real data and physical testing~@dosovitskiy2017carla. In off-road field robotics, terrain traversability is a key functionality for both planning and navigation. Models for predicting the traversability of offroad vehicles and robots from local terrain features is an active field of research and there are several papers with accompanying public datasets~@wigness_rugd_2019@jiang_rellis-3d_2021@triest_tartandrive_2022@sharma_cat_2022@mortimer_goose_2024@malladi2025a. Traversability depends highly on the size, kinematic structure, and driveline of the vehicle or robot~@sharma_cat_2022. To the best of our knowledge there are no publicly available datasets for articulated heavy off-road vehicles such as a forest machine. This shortage hinders the effective application of artificial intelligence and simulation in research and development towards higher levels of automation and precision forestry, which is needed to achieve sustainability goals. It is the aim of this work to fill this gap in open data.

Creating good datasets is not just a matter of recording large volumes of data, e.g., logging the available data from forest machines in production. With accurate, contextual and consistent annotation, more precise and advanced models can be created from the data, compare~@hook_data_2025@puliti_for-instance_2023. The data needs to have high variability. This may include capturing data from situations that are unusual but safety-critical. Furthermore, a useful dataset needs a well-documented structure as well as instructions and examples for the tools essential for processing the data when it is not in a standardized format.

The FORWARD dataset comprises detailed sensor and log data from a Komatsu cut-to-length forwarder, collected during operations in challenging terrain as well as on gravel roads at two Swedish harvest sites. Sensor instrumentation includes RTK-GNSS for precise positioning, a 360-degree camera for visual documentation, operator seat vibration sensors, CAN-bus signal logging, and multiple IMUs mounted on the machine. The dataset provides time-stamped vehicle positions with centimeter-level accuracy, and machine event logs sampled at 5 Hz, covering variables such as driving speed, fuel consumption, and crane activity. Additionally, high-resolution terrain data from helicopter-borne pre-harvest laser scanning (1500 points/m²), and drone footage of the harvested site is included, along with StanForD production log files containing detailed event records for each work session.

About 18 hours of regular wood extraction work during three days is annotated from 360-video material into individual work elements. We also include controlled experiments, both on forest roads and in terrain. Experiments are structured and presented in a number of scenarios. Scenarios include tests with and without steel tracks, different load weight, and different target driving speeds. The dataset is intended for developing models and algorithms for trafficability, perception, and autonomous control of forest machines using artificial intelligence, simulation, and experiments on physical testbeds. In part we focus on forwarders traversing terrain, avoiding obstacles, and loading or unloading logs, with consideration for efficiency, fuel consumption, safety, and environmental impact. The data, scripts for data exploration and analysis, and some example analyses are publicly available through the Swedish National Data Service~@Lundback2025FORWARD.

= Overview of the dataset
<overview-of-the-dataset>
An overview of the collected data is provided in Table~@tab:overview. Details of the data sources, formats, and collection procedure is described in the following sections.

#figure(
  align(center)[#table(
    columns: 4,
    align: (left,center,center,left,),
    table.header([Type of data], [Resolution], [Size/duration], [Comment],),
    table.hline(),
    [Airborne laser scan], [1500 pt/m$""^2$], [15 ha], [Point cloud & elevation map],
    [Drone photogrammetry], [4000 pt/m$""^2$], [15 ha], [Point cloud & orthomosaic],
    [Video], [3840$times$2160 pixels at 60 fps], [373 GB], [Fix and mounted on machine],
    [360 video], [5376$times$2688 pixels at 30 fps], [20 h/560 GB], [Mounted on machine],
    [Manual object scanning], [n.a.], [9 objects], [3D reconstruction],
    [GNSS position and speed], [0.1 m at 5 Hz], [110 h], [By manufacturer],
    [Pose], [0.1 deg at 5 Hz], [110 h], [By manufacturer],
    [Acceleration], [5 Hz], [110 h], [By manufacturer],
    [Fuel consumption], [5 Hz], [110 h], [By manufacturer],
    [Set speed (inch)], [n.a.], [110 h], [By operator],
    [Crane motion], [5 Hz], [110 h], [Slew angle],
    [Ext. IMU], [5 Hz], [17 h], [Mounted on machine],
    [Ext. vibration], [6000 Hz], [27 h], [Mounted in operator seat],
    [Production log file], [n.a.], [40 h], [fpr],
    [Production log file], [n.a.], [110 h], [hpr],
  )]
  , caption: [Data overview.]
  , kind: table
  ) <tab:overview>

= Data collection - instrumentation and procedures
<data-collection---instrumentation-and-procedures>
Data origins from two field campaigns at two separate sites (Fig~@fig:overview). Märrviken is the first site with data gathered in October 2023 and very rough terrain with large rocks and boulders. Björsjö is the second site with data gathered in September 2024 and terrain that is less rough but still includes instances of challenging boulders. Terrain data is collected before and during the experiments, using helicopter-borne laser scanning and drone footage-based photogrammetry respectively. The target height of the laser scan with helicopter is 150 meters, resulting in point densities of approximately 1500 points per square meter. A Riegl Vux 120 sensor is used for the laser scanning and the time of scan is July 25-29 2022 and August 19 2023, for Märrviken and Björsjö sites respectively.

#figure(image("source/Figs/Testsites_overview.png", width: 90.0%),
  caption: [
    Overview of the testsites with terrain elevation maps obtained from the airborne laser scanning overlayed by orthomosaic photos from drone images and machine paths from the GNSS positioning data.
  ]
)
<fig:overview>

During experiments and regular forwarding work at the Björsjö site, we mount a 360camera on top of the forwarder cabin. The 360camera records video and audio of the forwarder's surroundings (Fig~@fig:360_cam_imu, left). At the Märrviken site, a few key features were also recorded with a standard mobile phone camera, and converted into 3D models using the online service from Polycam (https:\/\/poly.cam).

#figure([#box(image("source/Figs/photos/360_cam.jpg", height: 35.0%)) #box(image("source/Figs/photos/imu.jpg", height: 35.0%))

  ],
  caption: [
    360camera mounted on the forwarder cabin (left) and IMU mounted on the wheels (right).
  ]
)
<fig:360_cam_imu>

The forwarder is operated by a professional forwarder operator, who's seat is equipped with a vibration sensor for parts of the experiments. The vibration sensor, used at the Björsjö site, is a 3D accelerometer with a sampling frequency of 6000 Hz and the vibration dataset is included in this paper. For parts of the experiments at Björsjö, we also mount a number of inertial measurement units (IMU:s) on the forwarder wheels, which record angular velocity at 5 Hz (Fig~@fig:360_cam_imu, right). The IMUs are synchronized with the machine data and the 360video, allowing for detailed analysis of the forwarder's movement and behavior during the experiments, with specific regard to wheel slip.

The camera data is time-synced using the timestamps provided in the metadata. The IMUs are synchronized by inducing and subsequently identifying characteristic events (rotation about a single axis, brief free-fall) at known time instants at the start and end of measurements. Both synchronization methods achieve a temporal accuracy on the order of one second. To enable post-processing and analysis such as synchronization of data streams and isolation of specific scenarios, start- and endtimes of all experiments and other relevant episodes are manually logged in a field notebook.

= Data description
<data-description>
== Formats and file structures - time series data
<formats-and-file-structures---time-series-data>
Raw data is provided in different formats depending on the data source. Machine signals logged from the CAN bus and GNSS receivers are provided in CSV format, with one file for each test site. Each file contains one row per timestamp and one column per signal. Production log files (StanForD) are provided as HPR, FPR, and MOM files, which are standard formats for forestry machine production data. Each test site has its own set of production log files, separated in folders named after the test site and filetype. The 360video is provided in MP4 format as well as the original GoPro 360 format. The MP4-files have a resolution of 1024$times$592 pixels, a frame rate of 30 frames per second, and are easily played back with pan and zoom functionality in standard video players, such as VLC. Vibration data from the operator seat is provided in WAW format, with a sampling frequency of 6000 Hz. There are four large files containing vibration data, spanning over the three test days at the Björsjö test site. No high-frequency vibration data is available from the Märrviken test site. IMU data is provided as a number of CSV files, with one file per IMU and data recording episode.

After loading and synchronization of the time series data, an interactive plot can be generated to visualize and navigate the data (Fig~@fig:interactive_plot). The practical steps to load data, synchronize time series, and generate the interactive plot are provided in the analysis scripts repository.

#figure(image("source/Figs/TimelineGraphical_edited.png", width: 100.0%),
  caption: [
    Interactive plot for visualizing and navigating the time series data. The user can zoom in and out, and select preferred time intervals to show experiments, video files, and exact time interval in the terminal (purple box in the figure) for further analysis. Blue lines, orange areas, and green areas indicate experiments, raw 360 video filenames, and lightweight stitched video filenames, respectively.
  ]
)
<fig:interactive_plot>

== Formats and file structures - terrain data
<formats-and-file-structures---terrain-data>
The laser scanning data is provided in LAS format, which is a standard format for storing point cloud data. GeoTIFF files, based on ground classification of the laser scanning data, are provided for each site, with a resolution of between 0.04 and 0.1 m² per pixel. Classified las-files containing only ground points are also provided in LAS format. All three steps from unclassified point cloud, via classified point cloud, to interpolated terrain model are visualized for part of the Björsjö site (Fig~@fig:terrain_model). Drone images with 60 m flight height are provided as orthomosaic in GeoTIFF format, with a resolution of 2.89 and 1.44 cm² per pixel for Märrviken and Björsjö respectively. The photogrammetric point clouds based on drone footage are provided in LAS format, split into one hectare tiles to reduce individual file size. Each experimental site has its own set of photogrammetric point cloud files accompanied by a metadata CSV-file describing the extent of each tile, easily visualized in geographic information software such as QGIS. Point density for the photogrammetric point clouds are about 5000 and 3000 points/m² for Märrviken and Björsjö respectively. The small 3-D models created from mobile phone footage are provided in OBJ as well as LAZ format, which are standard formats for 3D models.

#figure(image("source/Figs/Terrain_illustration.jpg", width: 90.0%),
  caption: [
    Visualization of the three steps from unclassified point cloud (a), via classified point cloud (b), to interpolated terrain model (c) for part of the Björsjö site, including our test circuit marked in red. Colors from blue to red reflect low to high elevation.
  ]
)
<fig:terrain_model>

== Driving scenario naming convention
<driving-scenario-naming-convention>
Parts of the dataset is based on episodes of recorded machine data during controlled experiments with the forwarder at both the Märrviken and Björsjö sites.

The following naming convention is used to organize the data: \

`LOCATION_SURFACE_CONFIGURATION-_DESCRIPTION`

with

- positional arguments for location and surface material

  - 3 letter location code per site

  - one-word surface-material description

- keyword arguments for systematically varied parameters

- pairs of one-words, separated by underscore: `parameter_value`

- principle for ordering: parameters which are more seldom varied are placed first

- free text descriptions for characterising the test

  - separated by dash

  - multiple words combined with underscore

An example is: \

`BRJ_terrain_tracks_on_load_full_inch_020-test_circuit-part_1` \

where `BRJ` stands for the Björsjö location, `terrain` indicates the surface material is heterogeneous forest terrain in contrast to sand or gravel materials, `tracks_on` means that steel tracks were mounted to the boogies, `load_full` means full load of logs on the bunk of the machine, `inch_020` means that the target speed during the experiment was 20% of max speed on low gear (about 2.1 m/s), `test_circuit` refers to the specific circuit that were used repeatedly at this specific location, and `part_1` refers to a subset of the complete test circuit.

The following scenarios are extracted from the dataset and combined end-to-end, enabling e.g., iterative simulations on the whole set of scenarios.

=== Märrviken - Driving on a flat smooth surface
<märrviken---driving-on-a-flat-smooth-surface>
We use an old quarry to facilitate a smooth and flat surface for repeated experiments, forming a baseline in the machine-dataset. Parameters adjusted in the experiments are target driving speed (10%, 30%, 50%, 70%, 90%, and 100%), load weight (0, 10, 20 tons) (Fig~@fig:quarry). A bundle of logs and a dug down stone represent obstacles that are relatively easy to recreate in simulation (Fig~@fig:obstacles). The obstacles are traversed at 30% target speed with all three load weights.

#figure([#box(image("source/Figs/photos/quarry_empty.jpg", width: 90.0%)) #box(image("source/Figs/photos/quarry_half.jpg", width: 45.0%)) #box(image("source/Figs/photos/quarry_full.jpg", width: 45.0%))

  ],
  caption: [
    Forwarder during experiments on flat, sandy surface in old quarry. Empty, 10 tons, and 20 tons load weight.
  ]
)
<fig:quarry>

#figure([#box(image("source/Figs/photos/obstacle_1.jpg", width: 45.0%)) #box(image("source/Figs/photos/stone.jpg", width: 45.0%))

  ],
  caption: [
    Log bundle and stone traversed by the forwarder in the quarry.
  ]
)
<fig:obstacles>

=== Märrviken - Driving uphill on gravel road
<märrviken---driving-uphill-on-gravel-road>
Target speed levels of 30%, 60%, and 100% as well as all three load weights are also tested on an inclined forestry road, consisting of hard-packed gravel. The uphill slope was about 5, see Fig~@fig:road_uphill.

#figure([#box(image("source/Figs/photos/road_uphill_close.jpg", height: 45.0%)) #box(image("source/Figs/photos/road_uphill_far.jpg", height: 45.0%))

  ],
  caption: [
    Forwarder driving uphill forestry road.
  ]
)
<fig:road_uphill>

=== Märrviken - Driving on flat terrain
<märrviken---driving-on-flat-terrain>
On a flat part of a strip road we do similar tests. Target speeds of 10%, 30%, and 50%, load weights of 0, 10, and 20 tons. Obstacles (stones) are present but not severe (Fig~@fig:striproad).

#figure(image("source/Figs/photos/terrain_flat_sideview.jpg", width: 90.0%),
  caption: [
    Forwarder on flat strip road with modest prevalence and size of obstacles.
  ]
)
<fig:striproad>

=== Märrviken - Driving in uphill terrain
<märrviken---driving-in-uphill-terrain>
On a moderately inclined (about 5) part of a strip road in the terrain we let the forwarder drive uphill with empty load at target speeds 10%, 30%, and 50%, as well as with 20 tons load weight at target speeds 20%, 30%, 40%, 60%, and 80%. Obstacles are present but not affecting possible driving speed (Fig~@fig:terrain_uphill).

#figure(image("source/Figs/photos/Terrain_uphill_sideview.jpg", width: 90.0%),
  caption: [
    Forwarder on uphill strip road with modest prevalence and size of obstacles.
  ]
)
<fig:terrain_uphill>

=== Märrviken - One minute cycles in terrain
<märrviken---one-minute-cycles-in-terrain>
On a partly very rough path with big boulders, the forwarder travels at target speed 30% and empty as well as 10 tons load weight. The sequences consists of downhill and uphill driving in very rocky and difficult terrain, example in Fig~@fig:cycle.

#figure(image("source/Figs/photos/Long_cycle_obstacle.jpg", width: 90.0%),
  caption: [
    Forwarder on difficult strip road with rich prevalence and size of obstacles.
  ]
)
<fig:cycle>

=== Märrviken - Driving steep uphill
<märrviken---driving-steep-uphill>
In search of the limitations of the forwarder, we try two very steep uphill parts of the harvested area. The first quite smooth and the second rough, with stones and stumps (Fig~@fig:steep). The slope was about 13.

#figure([#box(image("source/Figs/photos/uphill_difficult_smooth.jpg", width: 45.0%)) #box(image("source/Figs/photos/uphill_difficult_rough.jpg", width: 45.0%))

  ],
  caption: [
    Forwarder driving steep uphill, smooth ground (left) and rough (right).
  ]
)
<fig:steep>

=== Björsjö - Driving on gravel road
<björsjö---driving-on-gravel-road>
On a nearly flat gravel road with fresh, quite soft gravel we drive with 30%, 60%, and 100% of max speed and with empty as well as full load (Fig~@fig:bj_road). The road section is 300 meters long with a very slight hill in the middle. The turnaround at the far end is deleted from the scenarios, leading to each combination of speed and load consisting of two time intervals. In the free text description part of our scenario-naming nomenclature we mark the two time intervals as `away` and `back`.

#figure([#box(image("source/Figs/photos/road_1_bjorsjo.JPG", width: 45.0%)) #box(image("source/Figs/photos/road_2_bjorsjo.JPG", width: 45.0%))

  ],
  caption: [
    Forwarder on forestry road in Björsjö.
  ]
)
<fig:bj_road>

=== Björsjö - Terrain test circuit
<björsjö---terrain-test-circuit>
Along a test circuit following strip roads and some areas between strip roads, the forwarder traveled at target speeds 20%, 30%, and 40% with empty and full load weight (Fig~@fig:bj_circuit). The test circuit is smooth in general with light incline on the way out and decline on the way back on a parallel strip road. At a few places along the circuit the forwarder traverses large rocks with the wheels, the largest 90 cm high (Fig~@fig:bj_circuit).

#figure([#box(image("source/Figs/photos/bj_map_photos.jpg", height: 60.0%)) #box(image("source/Figs/photos/bj_rocks_2.jpg", height: 61.0%))

  ],
  caption: [
    The terrain test circuit in red (left), 90 cm rock by the red arrow and 50 cm rock as inset in lower right corner (right).
  ]
)
<fig:bj_circuit>

== Annotation
<annotation>
During the three days of field trails at the Björsjö-site, the forwarder is also operated for 18 hours in regular wood extraction work with the 360camera mounted on the cabin (Fig~@fig:360_cam_imu). This work is annotated into 8 different work elements following established ontology~@bjorheden_international_2000, see Table~@tab:work_elements. The main objective of the annotation is not to investigate productivity on this specific harvesting site, but to complement the other data with information of work element, e.g., differing between driving with empty or fully loaded bunk (35 vs 55 metric tonnes total machine weight). By analysing annotated work elements together with machine-, position-, and terrain data we also see opportunities to advance automatic work element detection (AWED) in forwarding work. The work elements are defined as follows:

/ Driving empty\:: #block[
Driving without load from the landing to the place of the first log pick up.
]

/ Loading: #block[
Picking up logs from the ground and placing them on the bunk. This work element is prioritized over #emph[Driving while loading] if both occur simultaneously.
]

/ Driving while loading: #block[
Driving between log piles without simultaneously loading logs.
]

/ Driving loaded: #block[
Driving with a full bunk of logs from the place of the last log pick up to the landing.
]

/ Unloading: #block[
Picking up logs from the bunk and stacking them on the landing. This work element is prioritized over #emph[Driving while unloading] if both occur simultaneously.
]

/ Driving while unloading: #block[
Driving between or along log stacks without simultaneously unloading logs.
]

/ Short delays: #block[
Short stops for e.g., planning the work, adjusting the machine, or answering the phone. Typically a few seconds but up to five minutes.
]

/ Other time: #block[
Time not spent on any of the above work elements.
]

The work element annotations are synchronized to the 360video material and incorporated in the 5 Hz time series machine data. The active work element can be visualized on the map of the harvesting site using the annotation, exemplified in Fig~@fig:crane_all_work. By utilizing the crane signal data, we can also see when the crane is used, and for how long, during the different work elements. Furthermore, individual load cycles are extracted from the data and used for further visualization and analysis (Fig~@fig:crane_cycle). This is done similarly to the extraction of experiment scenarios, by picking appropriate time intervals from the dataset with the tools provided in the analysis scripts.

#figure(
  align(center)[#table(
    columns: 2,
    align: (left,center,),
    table.header([Work element], [Time \[h\]],),
    table.hline(),
    [Driving empty], [1.8],
    [Loading], [7.5],
    [Driving while loading], [2.3],
    [Driving loaded], [1.4],
    [Unloading], [3.3],
    [Driving while unloading], [0.05],
    [Short delays], [1.1],
    [Other time], [0.9],
    [Total time annotated], [18.3],
  )]
  , caption: [Time spent on different work elements during the video recorded part of the field trails at the Björsjö-site.]
  , kind: table
  ) <tab:work_elements>

#figure(image("source/Figs/crane_all_work.png", width: 90.0%),
  caption: [
    Map of the Björsjö-site with work elements during all regular work plotted on a height map based on the laser scanning. Crane signal data are shown while loading and unloading.
  ]
)
<fig:crane_all_work>

#figure(image("source/Figs/timestudy_cycle_combined.png", width: 90.0%),
  caption: [
    One load cycle during regular work at the Björsjö-site, without (left) and with (right) crane movement data.
  ]
)
<fig:crane_cycle>

= Analysis tools
<analysis-tools>
Scripts for processing raw data and analysing curated synchronized data are provided in a separate repository available at the Swedish National Data Service (SND)~@Lundback2025FORWARD. The scripts are written in Python and use mainly libraries such as NumPy and Matplotlib, along with some specialized libraries for reading and writing specific file formats. Requirements and installation instructions together with usage examples are provided in the repository. The scripts are structured in a modular way, allowing for easy extension and modification. The main functionality is organized in a processing pipeline, where different modules can be combined to perform specific tasks on the data. The pipeline can be constructed and run using a command line interface, optionally in combination with configuration files, with options to specify input and output directories, processing steps, and parameters. The main steps in the processing pipeline are:

- Loading raw data from different sources and formats, including appropriate synchronization of time series data.

- Conversion between different data types, for example turning text strings into integers to enable plotting.

- Extracting scenarios and episodes of interest from the synchronized data by selecting appropriate time intervals.

- Saving processed data in a separate npz file for easy loading in future analyses.

- Visualizing the data in different ways, including time series plots, histograms, and maps.

- Performing basic analyses, such as computing statistics and fitting models to the data.

Some of the most common data handling and analysis modules are listed in Table~@tab:analysis_modules, a complete list is provided in the repository. Detailed instructions on how to construct and run a number of useful commands are also provided in the repository.

#figure(
  align(center)[#table(
    columns: 2,
    align: (left,left,),
    table.header([Module], [Description],),
    table.hline(),
    [`LoadIMU`], [Load IMU data from a specified list of files and synchronize with machine time series data],
    [`LoadVibration`], [Load vibration data from a specified list of files and synchronize with machine time series data],
    [`LoadGeoTif`], [Load terrain data from a geotif file for subsequent plotting],
    [`TimelineGraphical`], [Show the interactive plot of loaded time series data and video files],
    [`TimesToPick`], [Specify start and end times for data extraction],
    [`Pick`], [Perform the data extraction based on specified times],
    [`Save`], [Save the extracted data in a npz file],
    [`PlotAll`], [Plot all loaded variables in the time series data with indexed time on x-axis],
    [`Histogram`], [Plot histograms of all loaded variables],
    [`ColorPath`], [Plot all loaded variables as colored paths on the terrain map],
    [`SweRef`], [Module to convert position data into the Swedish coordinate system Sweref99 TM],
    [`RemoveAcc`], [Remove all but certain acceleration data variables from the dataset to avoid excessive number of plots],
    [`RemoveImu`], [Remove all but certain IMU data variables from the dataset to avoid excessive number of plots],
    [`LinearRegression`], [Fit linear regression models to a subset of the data, e.g., fuel consumption and driving speed],
  )]
  , caption: [Some of the most common data handling and analysis modules provided in the analysis scripts repository.]
  , kind: table
  ) <tab:analysis_modules>

Some of the preprocessing of terrain data, such as classification of point clouds and interpolation of terrain models, is performed with a more manual approach using R-scripts and existing tools like PDAL and CloudCompare. Even though these steps are one-time processes, they are crucial for ensuring the quality and usability of the data in subsequent analyses, and for the sake of repeatability included and described in the repository. In the following section, we present some example analyses that can be performed using the provided scripts.

= Results from example analyses
<results-from-example-analyses>
To give more insight into the dataset and exemplify the analysis scripts, we present two example analyses from the high-resolution forwarder dataset and visualization of selected StanForD production data. The first example is an analysis of the fuel consumption during regular work, and the second example is an analysis of the vibration data from both machine and operator seat.

== Fuel consumption
<fuel-consumption>
As with the other machine variables, the fuel consumption is recorded at 5Hz and is measured in two ways: instantaneous fuel consumption in liters per hour and accumulated fuel consumption in half liter steps. The machine was not equipped with fuel flow sensors, so the instantaneous fuel consumption is not measured directly and is instead modeled using the fuel injector's opening time, the temperature, and the pressure. This fuel consumption model is provided by the manufacturer and the details behind it is not disclosed. In contrast, the accumulated fuel consumption #emph[is] measured directly, and is therefore the more reliable of the two. The reliability does however come at the cost of a much coarser resolution, as the accumulated fuel consumption is measured in steps of 0.5 liters.

#figure(image("source/Figs/Fuel_collage.jpg", width: 90.0%),
  caption: [
    Fuel consumption during driving at the Björsjö-site. Instantaneous (a) and accumulated (b) fuel consumption as a time series, and along the machine paths with high values in red and low values in white (c).
  ]
)
<fig:fuel_consumption>

Focusing on instantaneous fuel consumption, we can plot fuel consumption against the driving speed recorded by the GNSS receiver, and confirm that higher speeds correlate with higher fuel consumption and that the speed-dependent increase is slightly more pronounced with a fully loaded bunk (Fig~@fuel_speed_driving). There is a big overlap in fuel consumption between the two work elements 'Empty driving' and 'Driving with (full) load', indicating several confounding factors.

#figure(image("source/Figs/Fuel_vs_speed_driving.jpg", width: 90.0%),
  caption: [
    Instantaneous fuel consumption plotted against driving speed during regular work at the Björsjö-site. The data is filtered so that only work elements #emph[Empty driving] (blue) and #emph[Driving with (full) load] (red) are represented. The total number of observations is 57 802, corresponding to about 3 hours of driving.
  ]
)
<fuel_speed_driving>

We test to model the fuel consumption using linear regression with the input variables driving speed, pitch angle, and booleans for full load and tracks on. The resulting model has an $R^2$ of 0.62 and a root mean square error (RMSE) of 4.87 l/h. This indicate the possibilities to model fuel consumption, but also that more factors needs to be included when driving in rough terrain (Fig~@fig:fuel_regression). Acknowledging the limitations of this simple model, an interesting observation is that the use of steel tracks seems to affect the fuel consumption more than the load weight, at least in this dataset.

#figure(image("source/Figs/Regression_driving.jpg", width: 90.0%),
  caption: [
    Linear regression model of instantaneous fuel consumption during #emph['Empty driving'] and #emph['Driving with load] at the Björsjö-site. The model is fitted to 57 802 observations, corresponding to about 3 hours of driving. The $R^2$ is 0.62 and the RMSE is 4.87 l/h and the plot show the model predictions against the actual fuel consumption. The red line is the ideal case where the model predicts the actual fuel consumption perfectly.
  ]
)
<fig:fuel_regression>

== Vibration data
<sec:vibration>
For a subset of the data, we have vibration data recorded from the operator seat. The vibration data is recorded at 6 000 Hz and the vibration dose value (VDV), whole-body vibration exposure A(8), and daily equivalent static compression dose S$""_(e d)$ is computed for a number of test scenarios and regular forwarding work (Table~@tab:vibration_measures). Vibration dose value (VDV) and whole body vibration exposure A(8) is computed from the raw data using the ISO 2631-1 (@ISO_2631-1_1997) standard, while a daily equivalent static compression dose (S$""_(e d)$) value is computed according to ISO 2631-5 (@ISO_2631-5_2018). For a stitched scenario containing 11 hours and 20 minutes of regular forwarding work, the VDV is 20.0 m/s$""^1.75$ and A(8) is 0.66 m/s$""^2$. We also synchronize the data from the vibration sensor with the machine-data by downsampling it to 5 Hz, using metrics such as maximum, minimum, average, and standard deviation. The downsampled vibration data lack sufficient resolution to be used for computation of human vibration exposure measures, but it is useful for exploring similarities between the vibration data and the machine data.

#figure(
  align(center)[#table(
    columns: 5,
    align: (left,center,center,center,center,),
    table.header([Scenario], [Time duration], [S$""_(e d)$], [VDV], [A(8)],),
    table.hline(),
    [`BRJ_terrain_tracks_on_load_empty_inch_030-test_circuit`], [00:06:20], [1.1445], [34.44], [0.85],
    [`BRJ_terrain_tracks_on_load_empty_inch_040-test_circuit`], [00:04:30], [1.2116], [59.19], [1.35],
    [`BRJ_terrain_tracks_on_load_empty_inch_020-test_circuit`], [00:10:59], [1.0442], [17.46], [0.32],
    [`BRJ_gravel_tracks_on_load_full_inch_030-away`], [00:07:45], [1.1066], [11.16], [0.26],
    [`BRJ_gravel_tracks_on_load_full_inch_030-back`], [00:08:43], [1.0852], [11.06], [0.26],
    [`BRJ_gravel_tracks_on_load_full_inch_060-away`], [00:03:50], [1.2444], [21.61], [0.39],
    [`BRJ_gravel_tracks_on_load_full_inch_060-back`], [00:04:16], [1.2224], [20.50], [0.39],
    [`BRJ_terrain_tracks_on_load_full_inch_030-test_circuit`], [00:07:54], [1.1031], [42.38], [0.66],
    [`BRJ_terrain_tracks_on_load_full_inch_040-test_circuit`], [00:05:43], [1.1642], [59.22], [1.04],
    [`BRJ_terrain_tracks_on_load_full_inch_020-test_circuit`], [00:11:18], [1.0392], [19.67], [0.31],
    [`BRJ_gravel_tracks_off_load_empty_inch_030-away`], [00:06:29], [1.0938], [6.36], [0.18],
    [`BRJ_gravel_tracks_off_load_empty_inch_030-back`], [00:06:15], [1.1005], [6.91], [0.19],
    [`BRJ_gravel_tracks_off_load_empty_inch_060-away`], [00:03:04], [1.2392], [15.73], [0.35],
    [`BRJ_gravel_tracks_off_load_empty_inch_060-back`], [00:03:17], [1.2252], [16.49], [0.37],
    [`BRJ_gravel_tracks_off_load_empty_inch_100-away`], [00:02:21], [1.2954], [21.07], [0.37],
    [`BRJ_gravel_tracks_off_load_empty_inch_100-back`], [00:02:20], [1.297], [23.73], [0.42],
    [Stitched sequences of regular work (without pauses)], [11:20:00], [0.43671], [19.99], [0.66],
  )]
  , caption: [Vibration dose value (VDV), whole-body vibration exposure A(8), and S$""_(e d)$ for different scenarios at the Björsjö-site.]
  , kind: table
  ) <tab:vibration_measures>

Using the maximum value for each data point as downsampling statistic, we plot the downsampled vibration data together with the machine accelerometer data for a subset of the test circuit covering the passage of a 90 cm high rock (Fig~@fig:vibration). In the Z-direction, peaks in acceleration are observed when the forwarder drives over obstacles, such as rocks and stumps. In this specific case, the vibration data shows a clear peak in the Z-direction when the forwarder drives down from the 90 cm high rock (Fig~@fig:vibration).

#figure(image("source/Figs/Figur_vibrations.jpg", width: 90.0%),
  caption: [
    Downsampled machine vibration data (left) and operator seat vibration data (right) during the passage of a 90 cm high rock on the test circuit. Plotted along the machine path with high values in red and low values in blue and as a time series. Both datasets are accelerations in the Z direction.
  ]
)
<fig:vibration>

== StanForD production data
<stanford-production-data>
The StanForD production data from the forwarder is available for the Björsjö-site and can be visualized and used in a variety of ways, for example machine positions in time series or on a map of the test site. Since the machine positions are recorded at a coarser time-resolution in StanForD than the 5Hz used in the other data, the positions are upsampled to match the 5Hz time resolution by repeating identical positions until the next position is detected. When plotting machine positions on a map, the difference in time resolution is noticeable (Fig~@fig:stanford_map).

#figure(image("source/Figs/Positions_comparison.jpg", width: 90.0%),
  caption: [
    Machine positions from StanForD production data (red) and the main dataset (green) plotted on a map of part of the Björsjö-site. The StanForD positions are upsampled to match the 5Hz time resolution of the other data. The background is the orthomosaic from the drone-footage made before forwarding.
  ]
)
<fig:stanford_map>

Production data from the harvester that was used to cut the trees before forwarding is available for both sites, Märrviken and Björsjö. The harvester data is available in the same StanForD format as the forwarder data, and can be visualized in the same way, however, the harvester data is of course not synchronized with the forwarder data. Apart from machine positions, harvester data include other interesting information such as positions for harvested trees and processed logs, as well as tree species and dimensions. The spatial distribution of logs is important for understanding the operative conditions for the forwarder. The distribution of trees and logs can be visualized on a map of the test site (Fig~@fig:harvested_trees and~@fig:harvested_logs).

#figure(image("source/Figs/Bjorsjo_Harvested_trees.png", height: 40.0%),
  caption: [
    Positions of harvested trees in the forest at the Björsjö-site. The diameter of each tree in the plot corresponds to its diameter at breast height (DBH).
  ]
)
<fig:harvested_trees>

#figure(image("source/Figs/Bjorsjo_Harvested_logs.png", height: 40.0%),
  caption: [
    Positions of harvested logs in the forest at the Björsjö-site. Other information about each log could be added, such as if it is a sawlog or a pulplog. Due to the lack of a harvester head rotation-sensor on this specific machine, the orientation of the logs is partly incorrect in the plot.
  ]
)
<fig:harvested_logs>

= Conclusions
<conclusions>
The FORWARD dataset is unique in the forestry sector with its high temporal and spatial resolution, and the combination of machine data, external sensor data, terrain data, and video data. Statistics about e.g., machine utilization and performance from long time-series are traditionally being collected in Sweden, but these datasets are not sufficient in resolution for the needs of modern forestry operations. To study and improve machine performance, energy use, machine design, terrain-machine interactions, and operator comfort in detail, high-resolution data from both terrain and machine is needed. The FORWARD dataset fills this gap and provides a valuable resource for researchers and practitioners in the fields of forestry operations, physics-based simulations, machine learning, and robotics. The dataset is curated and synchronized, making it easy to use for a variety of analyses and algorithm training purposes.

Our philosophy when compiling the dataset has been to include as much data and code as possible, and let the users of the dataset decide what is relevant for their specific use case. We therefore encourage users to take advantage of the provided analysis scripts and extend them with their own code to fit scientific or practical research projects that focus beyond our initial motivation to gather the data.

= Acknowledgements
<acknowledgements>
This work was supported in part by Mistra Digital Forest (Grant DIA 2017/14 \#6) and Horizon Europe Project XSCAVE under Grant 101189836. The authors would like to thank the Swedish forest company SCA and machine manufacturer Komatsu Forest for providing the ALS- and machine data used in this study via collaborative field studies. We also thank Christian Höök, SLU, for his generous help with video data collection 2023. Hans Pettersson, Umeå University, is acknowledged for his help with the vibration data collection and processing.

#bibliography("references.bib", style: "ieee")
