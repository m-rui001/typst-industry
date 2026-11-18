// Adapted from arXiv:2505.02689v1 by Miele et al.
// Original work: CC BY 4.0, https://creativecommons.org/licenses/by/4.0/
// https://arxiv.org/abs/2505.02689v1
#set page(paper: "a4", margin: 20mm)
#set text(size: 10pt, lang: "en")
#set par(justify: true)
#set math.equation(numbering: "(1)")
#title[Flow induced intermittent transport shapes colloid filtration in complex media]
#align(center)[Filippo Miele (1), Ankur Deep Bordoloi (1), Marco Dentz (2), Herve Tabuteau (3), Verónica L. Morales (4), and Pietro de Anna (1)]
#align(center)[#text(size: 8pt)[(1) Institute of Earth Sciences, University of Lausanne, Lausanne 1015, Switzerland. (2) Spanish National Research Council (IDAEA-CSIC), Barcelona 08034, Spain. (3) University of Rennes, CNRS, IPR (Institut de Physique de Rennes)-UMR 6251, F-35000 Rennes, France. (4) Department of Civil and Environmental Engineering, University of California, Davis, USA.]]
#align(center)[#raw("pietro.deanna@unil.ch") · #raw("filippo.miele@epfl.ch") · #raw("aerials00@gmail.com") · #raw("marco.dentz@csic.es") · #raw("vermorales@ucdavis.edu") · #raw("herve.tabuteau@univ-rennes.fr")]

#heading(level: 1, numbering: none)[Abstract]
<abstract>
The macroscopic phenomenon of filtration is the separation between suspended and liquid phases and it takes place in natural environments (e.g. groundwater, soil and hyporheic zone) and industrial systems (e.g. filtration plants, pharmaceutical industry and hospital care). Porous materials represent excellent filters since they are characterized by a large amount of solid surface to which flowing particles can attach and be retained. Colloidal filtration by porous media is governed by a complex interplay between transport dynamics through intricate pore structure and surface-mediated retention. Yet, classical approaches fail to capture key properties (such as the filter spatial heterogeneity) and experimental observations - e.g. non-exponential deposition profiles. A key limitation of such approaches lies in the assumption that the particle attachment to solid surfaces occurs at a constant rate over a given length scale, neglecting the intrinsic heterogeneity of the medium, i.e. pore size variability. Here, we develop a multiscale microfluidic model system to directly observe colloidal transport and deposition over more than three orders of magnitude in length - from tens of microns to a meter - within a porous architecture with controlled structural/physical heterogeneity. By tracking individual colloidal particles within the pores, we reveal an intermittent dynamics along each trajectory: particles alternate between long-range \"flights\" through pore channels and short-range localized \"dives\" near the grain surfaces. Within the dives attachment can occur at a constant rate, but the widely distributed flights size, during which attachment cannot occur, produces anomalous filtration, quantified by deposition profiles and breakthrough curves. The broad distribution of flights and dives spatial extension reflects the heterogeneity of the medium. We capture these properties of particle dynamics with a novel stochastic model based on a continuous time random walk (CTRW), constrained entirely by experimentally measured parameters. This model links the microscopic structure of the medium with macroscopic filtration, coupling complex fluid flow with colloidal surface interactions to more accurately describe non-exponential deposition profiles.

= Introduction
<introduction>
Colloid transport and retention is a crucial process in porous media that significantly impacts diverse environmental, biological, and industrial domains, encompassing abiotic and living entities. In terrestrial environments, for example, natural colloids that carry pollutants migrate through fractured rocks and soils, where they interact with minerals and microbial communities, influencing soil composition and contaminant dispersion [#link(<ref-1>)[1], #link(<ref-2>)[2]]. In the human body, viruses, microorganisms, and drug-carrying nanoparticles are transported through complex porous structures comprising the gut [#link(<ref-3>)[3], #link(<ref-4>)[4]], extracellular matrices~[#link(<ref-5>)[5]], and the vascular system [#link(<ref-6>)[6], #link(<ref-7>)[7], #link(<ref-8>)[8]]. Furthermore, colloidal transport also plays a crucial role in filtration systems within many industrial and automotive contexts, where aerosol particles and pollutants dispersed in solvents are captured and retained inside or at the entrance of porous media [#link(<ref-9>)[9], #link(<ref-10>)[10]]. \
Colloid Filtration Theory (CFT) has traditionally provided a macroscopic description of colloidal transport within porous media using an advection-dispersion framework. CFT treats the underlying medium as homogeneous, and it considers a constant particle attachment rate over a fixed length scale characterizing the porous medium~[#link(<ref-11>)[11], #link(<ref-12>)[12]]. For more than fifty years, studies have relied on this model to predict macroscopic transport behaviors, with complementary experiments, often conducted by injecting particles into a packed bed of spherical beads [#link(<ref-13>)[13]]. While successful for relatively homogeneous media, CFT predictions have been challenged by observations in physically heterogeneous structures~[#link(<ref-14>)[14], #link(<ref-15>)[15], #link(<ref-16>)[16]] for which the structural medium properties cannot be described by a single length scale, but a wide distribution of values (e.g., variability in pore size, dead ends, fluid velocity distribution) that control enhanced colloid spreading and are not taken into account by CFT~[#link(<ref-17>)[17]]. Therefore, despite the ubiquity of this process, our understanding of the transport and retention mechanisms remains limited, highlighting the need of a new theoretical framework that incorporates the complex and heterogeneous features of porous media. \
Most of the relevant experimental studies have been conducted using columns packed with sand, soil, or rock samples to examine the effects of flow dynamics and realistic physical and chemical conditions on colloidal transport~[#link(<ref-18>)[18], #link(<ref-19>)[19], #link(<ref-20>)[20]]. However, these configurations typically provide access only to macroscopic transport features, such as breakthrough curves (BTCs), representing particle flux through the medium, and Deposition Profiles (DPs), which quantify the spatial distribution of attached particles. Deposition profiles are usually obtained a-posteriori by sectioning the medium into thin slices, adding further experimental complexity~[#link(<ref-21>)[21]]. Only a limited number of studies have captured pore scale processes of particle aggregation~[#link(<ref-22>)[22], #link(<ref-23>)[23]] and temporal evolution of deposition profiles using confocal microscopy [#link(<ref-24>)[24]], or X-ray Computed Tomography (CT)~[#link(<ref-25>)[25]]. However, to discern the mechanisms that lead to said concentration signals, it is imperative to know the dynamics of a particle as it percolates the porous medium. Tracking particles trajectory in real time remains challenging due to the time-intensive nature of the scanning process and the spatial limitation introduced by the trajectory size compared to the filter size. Consequently, we lack a direct link between macroscopic particle filtration and microscopic particle transport across disordered porous media. \
The development of microfluidic techniques has allowed for the fabrication of transparent porous systems with controlled structure, allowing direct access to processes taking place under flow conditions~[#link(<ref-26>)[26], #link(<ref-27>)[27], #link(<ref-28>)[28], #link(<ref-29>)[29]]. This enables detailed studies of trajectory dynamics at the pore scale by tracking of individual particles across successive pores~[#link(<ref-30>)[30], #link(<ref-31>)[31]]. Exploiting particle tracking, a few studies [#link(<ref-32>)[32], #link(<ref-33>)[33]] have attempted to connect macroscopic transport, such as BTCs, to the underlying pore-scale mechanisms, thereby elucidating the origins of anomalous particle transport (e.g., late time elution of the BTC and hyper-exponential or non-monotonic DP). While only a few studies to date have explored the impact of pore-scale hydrodynamics on Deposition Profiles across multiple scales~[#link(<ref-24>)[24], #link(<ref-34>)[34]], the link between the detailed microscopic structure and macroscopic transport and filtration remains elusive. \
Here, we develop a microfluidic setup, which allows to determine multi-scale transport and filtration of colloidal particles. On the one hand, the porous medium structure is heterogeneous with overall size $L = 1$~m and it is composed of cylindrical grains distributed in size ($L$ being about $15 \, 000$ average pores $overline(xi)$). On the other hand, we resolve the local hydrodynamics using particle tracking experiments, showing that particle transport along trajectories has intermittent behavior jumping between two states, that we call flights and dives. The first corresponds to the state of a particle transported at the local fluid velocity, remaining at a sufficient distance from any solid surface to abstain from surface interaction. The second corresponds to a particle traveling close enough to a grain surface so that the colloid can interact with the surface and potentially attach. We demonstrate how the heterogeneity of the medium induces a broad distribution in the spatial extent of each state. We further show that this pore-scale retention mechanism controls macroscopic features of particle transport that are not captured by CFT (in terms of BTC and DP). We rationalize this by proposing a novel stochastic model based on a continuous time random walk (CTRW) approach that captures the observed intermittent behavior incorporating pore-scale structural and flow properties to bridge the pore-scale dynamics with macroscopic transport phenomena.

#heading(level: 1, numbering: none)[Results]
<results>
#strong[Porous structure design and characterization]. We design a porous medium with a broad pore size distribution resembling the structure of natural soils or rocks. The medium structure (shown in Fig.~@fig1~$a$) consists of non-overlapping disks representing solid and impermeable grains (Fig.~@fig1~$b$) having random radius $r in \[ 0.06 med upright("mm") < r < 0.12 upright("mm") \]$ distributed as $P_r \( r \) tilde.op r^(- 3)$, also shown in Fig.~@fig1~$c$. The distance between neighboring grains $xi$ is power law distributed with an exponential cutoff,

$ p_xi \( xi \) tilde.op xi^(- beta) e^(- xi \/ xi_0) \, $ <xiPDF>

where $beta = 0.6$, $xi_0 = 0.063$~mm, shown in Fig.~@fig1~$d$. The set of nearest neighbor grains is defined via a Delaunay triangulation~[#link(<ref-35>)[35]]. These grains of random size and location are placed within a folded strip of width $w = 3$~mm, equivalent to 48 times the characteristic pore size $xi_0$ and length $L = 990$~mm, equivalent to $15 \, 720 thin xi_0$ (see Fig.~@fig1~$a$). We use soft lithography (see Methods) to print this geometry into a microfluidics chip (Fig.~@fig1~$a$).

#figure(image("graphics/figure1.png"),
  caption: [
    #strong[Multi-scale microfluidic experimental set-up for filtration]. $a$) The porous structure is comprised of more than 65,000 grains: the longitudinal distance between inlet (top left) and outlet (bottom right) is $L = 970$~mm. $b$) A close-up view of the designed structure where solid grains are shown as black disks and pore throats are the space among closest neighbors. $c$) Statistical distribution (PDF) of grain radii $r$ and $d$) of pore throat size, $xi$.
  ]
)
<fig1>

To avoid the Hele-Shaw approximation for the flow within pores (that would result in a flat velocity profile among grains), we fabricate the described microfluidics devices with thickness $h = 0.05$~mm that is similar to the average pore throat $xi_0$. The fluid moves from pore to pore passing through each individual throat of distributed size $xi$: the local flow is well approximated by the Hagen-Poiseuille law, characterized by a parabolic profile. The designed structure is, thus, expected to control the broad power law distribution of low Eulerian velocities, $p_v \( v \) tilde.op v^(- beta \/ 2)$~[#link(<ref-35>)[35]]. \

#figure(image("graphics/figure2.png"),
  caption: [
    #strong[Experimental colloidal transport and filtration by the porous structure.] Deposition Profile (DP) in panel $a .$) as the measured concentration of colloids attached to the medium solid surfaces along the distance from the inlet after $25 h$ of continuous injection, $b$) Hyper-exponential fit $H_2 \( p \, k_1 \, k_2 \)$ with $p = 0.6$ and rates $k_1 = 0.03$ and $k_2 = 0.0005$.c.) Measured suspended colloids concentration at the medium outlet, Breakthrough Curve (BTC). Time is rescaled by the time needed to flush 1 pore volume $t_(P V)$. After $1 t_(P V)$, a typical heavy tailing of the BTC signal with slope $t^(- 0.67)$ is a signature of the anomalous transport, not captured by continuum approaches as prescribed by CFT theory.
  ]
)
<fig2>

#strong[Macroscopic transport and filtration experiment]. We first saturate the microfluidic chip with a 1:1 milliQ water and D$""_2$O mixture. The flow is imposed and controlled with a Harvard Apparatus PHD-ULTRA syringe pump, which is set at a constant flow rate $Q = 0.72 thin mu$L/min. It results in an average (Darcy) velocity of $q^(*) = Q \/ A phi.alt = 0.16$~mm/s, where $A = h w = 0.15$~mm$""^2$ is the chip cross-sectional surface and $phi.alt = 0.46$ is the medium porosity. Once the chip is saturated, we continuously inject a colloidal suspension for about 30 hours (corresponding to the elution of 20~pore volumes). The colloidal suspension is composed of polystyrene micro-spheres (diameter 1.1~$mu$m and density $rho = 1.05$~g/mL Thermofischer Fluoromax B100) dispersed in a density-matched 1:1 milliQ water and D$""_2$O mixture, avoiding particle sedimentation. The relative importance of advection and diffusion processes is quantified by the corresponding Péclet number, $P e = overline(xi) q^(*) \/ \( phi.alt D \) tilde.op 10^5$ based on the mean fluid velocity $q^(*)$ and the colloidal diffusion coefficient $D = 1.4 times 10^(- 7)$~mm$""^2$/s~[#link(<ref-32>)[32]]. In such conditions, the flow is laminar since $R e = xi q^(*) \/ nu tilde.op 0.01$, where $nu = 1$~mm$""^2$/s is the water kinematic viscosity. In the following, time is normalized by the characteristic time necessary to elute a pore volume with the average Darcy velocity $q^(*)$, $t_(P V) = L \/ q^(*) = 103$~minutes. \
By comparing consecutive pictures collected with time-lapse video-microscopy of the fluorescent colloids within the pore space, we count the number of deposited and suspended colloids across the microfluidic reactor (as described in the Methods section). The deposition profile of colloids retained by the porous medium along the longitudinal position $x$, $a \( x \)$ after eluting 20 pore volumes is shown in Fig.~@fig2~$a$. It exhibits a non-exponential behavior, as shown in Fig.~@fig2~$b$ as blue dots. An hyper-exponential fit of the form of $H_2 \( x \) = p e^(- k_1 x) + \( 1 - p \) e^(- k_2 x) \/ A$ (red solid line), where $A$ is a normalization factor, characterized by two characteristic scales fits relatively well the data that, thus, deviate from the CFT prediction. Fig.~@fig2~$c$ shows the complementary BTC, $1 - c \( t \) \/ c_0$: as expected, after $t \/ t_(P V) = 1$ it quickly decays when colloids reach the outlet. However, it deviates from the exponential decay predicted by the classical models based on dispersion~[#link(<ref-36>)[36]] since at times larger than $t \/ t_(P V) = 1$, a power-law like heavy tail emerges, as characteristic of anomalous transport~[#link(<ref-37>)[37]]. \
Similar results are reported for column experiments~[#link(<ref-38>)[38], #link(<ref-39>)[39]] performed under unfavorable conditions, as we do here, that hinders colloids to surface retention (due to low ionic strength (IS) and high zeta potential). These previous observations have been interpreted invoking secondary energy minimum~[#link(<ref-40>)[40]] and multiple attachment rates due to colloidal suspension instability or grain roughness~[#link(<ref-41>)[41]]. It is important to note that all these aspects have no ground for the experimental conditions adopted here. The stability of the colloidal suspension is ensured by the very low IS value (0.5 mM): the suspension stays mono-dispersed during the entire experiment. Moreover, the grains are smooth cylindrical pillars with no contact points (no physical straining possible) and surface roughness much below the colloidal size~[#link(<ref-42>)[42]]. \
Our observations suggest that new mechanisms, other than colloidal-surface interactions, have to be considered to understand transport in a heterogeneous medium. To move a step forward, we challenge the concept of a single collector [#link(<ref-43>)[43]] as the representative elementary unit for particles transport and filtration. In that context, the frequency of collisions is derived by considering the average flow velocity and the ratio between the radius of colloids and the radius of the average grain. \

#figure(image("graphics/figure3.png"),
  caption: [
    #strong[Pore scale trajectories display flights-dives dynamics]. $a$) Reconstructed colloid trajectories among the grains through experimental particle tracking (PT). Each trajectory is decomposed into consecutive segments (highlighted in panel $b$) where particles are far (blue dots, flights) or close (red dots, dives) from a grain wall (zoomed view in yellow panel). $c$) Two-dimensional numerical simulation shows the hydrodynamic effect on purely advective streamline thickening: grain occlusion impacts the local velocity field ($v_e$) and leads to streamline compression with peaks in the pore throat, at the shortest grain-to-grain distance. The hydrodynamic pressure is responsible for deviations from pure parallel-to-grain surface direction, for a streamline falling into a dive (black dots). $d$) Time-lapse image stack of fluorescent colloids from PT experiment: blurry white stripes correspond to suspended particles while localized white spots are deposited particles that randomly surround each grain (black circles). $e$) Angular distribution of deposited particles computed around each grain for 10 different positions along the whole DP measurement: we observe a relatively even distribution, according to the local flow direction (in gray arrow), with slightly more attachment occurring upstream. $f$) Measured flights distribution, $p \( Lambda \)$, from the PT experiments performed over 3~FoVs ($approx 6$~mm). The dashed line shows the excellent fit of our model derived in SI~eq. (17): the cutoff is the FoV size.
  ]
)
<fig3>

#strong[Hydrodynamic- and structure- induced filtration]. To understand the drivers of macroscopic filtration by a heterogeneous porous system, we focus on the individual colloid trajectories reconstructed within 3 consecutive FoVs (about $6$~mm). Fig.~@fig3~$a$ shows a set of trajectories measured with Particle Tracking (PT) experiments in the same microfluidic device (see Methods). Remarkably, each trajectory is composed of a sequence of alternating segments along which the suspended colloids are near (red segments in Fig.~@fig3~$a \, b$) or far (blue segments in Fig.~@fig3~$a \, b$) from the solid grain walls, named dive and flight, respectively. Within a flight, trajectory segment farther than $d_c$, there are no physical conditions for the colloid to attach to a solid surface, as it travels too far from a grain to experience any surface interaction. It is, thus, simply transported by the flowing fluid. \
When a colloid falls into a dive-trajectory segment, closer than $d_c$ from a grain wall, it experiences the presence of a solid surface as a result of the balance between Van der Waals and electrostatic interactions. When colloids are suspended in pure water (i.e., with very low ionic strength) a strong repulsive electrostatic force emerges around each grain, raising the energy needed to approach the grain and experience attractive Van der Waals force. Under these unfavorable conditions (devoid of favorable heterodomains due to the smoothness of PDMS surface), pure diffusion cannot lead to attachment since the energy associated to Brownian motion is of the order of $k_B T$, while the repulsive energy barrier computed from the measured zeta potentials is of the order of several hundreds of $k_B T$. In fact, for our experimental setting, we measured the suspension zeta potential to be about $66$~mV, corresponding to an energy barrier of about $300 thin k_B T$ (see Methods and SI Fig.~6). Thus, another process must support the colloids in overcoming these barriers making attachment possible within a dive. Hydrodynamic forces play that role. \
Attachment of a particle can occur under unfavorable conditions when the net contribution of hydrodynamics, electrostatic repulsion and DLVO forces is positive towards a grain surface. This is possible only when trajectories are not parallel to solid surfaces. The curved shape of grains together with the proximity of other ones induces local deformation, i.e., compression and divergence, of streamlines leading to a hydrodynamic force pushing a particle toward a grain surface. This mechanism, also known as physical interception has been investigated previously~[#link(<ref-44>)[44], #link(<ref-45>)[45]]. To assess the streamlines of particles very close to a grain wall we exploited numerical simulations that overcome experimental limitations. Fig.~@fig3~$c$ shows trajectories from a high-resolution PT simulation performed in similar flow conditions (i.e. high #emph[Pe] with negligible diffusion), within a similar porous structure (PT simulation computed over velocity field from~[#link(<ref-35>)[35]]). Trajectories are never parallel to a grain surface even when very close (see Fig.~@fig3~$b \, c$). Thus, hydrodynamic forces can push a colloid against the grain surface, making flow-induced physical interception possible. \
Previous works on physical interception around single collectors showed that colloid attachment happens at specific locations around each grain, where particle trajectories get compressed, like the closest point to the grain for the dotted trajectory in Fig.~@fig3~$c$. However, as shown in Fig.~@fig3~$d$, within a heterogeneous porous structure, physical interception takes place all around each grain. Single deposited fluorescent particles (white spots) surround grains without any preferential hot-spot for attachment. We extend this observation to the whole porous system by analyzing the statistical angular distribution of deposited particles around all grains at locations where the deposition profile was acquired (see Methods), as shown in Fig.~@fig3~$e$. We observe a relatively even distribution around grains (averaging across a few thousands), with slightly more attachment occurring upstream. Thus, we argue that it is reasonable to approximate the whole diving region (where attachment can take place) as the contouring area of each grain within a distance $d_c$ from its surface. \
Fig.~@fig3~$f$ shows the statistical distribution of the flight length $lambda$ measured (red dots) from the PT experiment for an arbitrary critical distance of $d_c = 2 thin mu$m. This distribution spans over more than 2 orders of magnitude. The analysis of Lagrangian flight length $lambda$ shows that a significant number of particles cross the entire experimental field of view (FoV) without getting attached. Thus, the suspended and flowing colloids cross broadly distributed distances undisturbed (with no chance to attach for several pores), rather than surviving a multitude of collisions with each grain, typically seen as a single collector~[#link(<ref-46>)[46], #link(<ref-41>)[41]], until they enter a dive where the chance for removal from the suspension by interception occurs. \
The three major results highlighted from the PT analysis are: i) each trajectory is composed of flights and dives with ii) a broad flight length distribution, and iii) a random attachment location around the grains. Based on these observations, we use a continuous time random walk (CTRW) framework to derive a stochastic model that reflects the intermittent nature of trajectories and predicts the observed macroscopic filtration. \
#strong[Bridging pore-scale transport and macroscopic filtration]. Due to the stability and dilution of the colloidal suspension, we neglect interactions between the colloids. During the experiment duration, we injected a total of $2.8 dot.op 10^7$ colloidal particle (see Methods). Thus, we model the whole suspension with a similar number, $7 dot.op 10^6$, of particles that are simulated independently. Each trajectory is considered a 1-D sequence of segments where flights and dives occur alternately. Starting in a flight, during the $i - t h$ step a colloid moves a random length $lambda_i$ with random velocity $q_i$, which are independently distributed as $p_lambda \( lambda \)$ and $p_q \( q \)$ and are controlled by the medium structure. Each flight ends at location $x_i = x_(i - 1) + lambda_(i - 1)$ and time $t_i = t_(i - 1) + lambda_(i - 1) / q_(i - 1)$, corresponding to the new dive starting position and time. Dives have been defined as the trajectory segments where a particle moves at a distance shorter than $d_c$ from the surface of a grain with random radius $r_i$. Diffusion and physical interception are modeled as stochastic processes. The particle crosses half the grain perimeter of random length $l_i = pi r_i$ with a random velocity $u_i$, which are independently distributed as $p_l \( l \)$ and $p_u \( u \)$. These distributions are obtained from the distributions of grain size and throat length. The combined action of physical interception and diffusion is lumped into an effective attachment rate $k$, whose inverse defines the survival time $t_S = 1 \/ k$. This rate reflects the macroscopic filtration efficiency that control the total amount of retained colloids (12%, see Fig.~@fig2~$c$). \
If the transport time $l_i \/ u_i$ around a grain is shorter than the survival time $t_S$, the particle will escape the dive at location $x_i = x_i + l_i$ and time $t_i = t_i + l_i / u_i$, thereby transitioning towards the next step $i + 1$ in a new flight. Otherwise, the particle attaches to the grain, its trajectory ends at location $x_i = x_i + u_i t_S$ at time $t_i = t_i + t_S$. This stochastic model constitutes a CTRW characterized by two alternating phases, termed alternated CTRW (A-CTRW) in the following. It is summarized as,

$ {x_i & = x_(i - 1) + lambda_(i - 1)\
t_i & = t_(i - 1) + lambda_(i - 1) / q_(i - 1) \;\
t_S & = oo\
 cases(delim: "{", x_i & = x_i + l_i, t_i & = t_i + l_i / u_i \;, t_S & = 1 \/ k_i) $<eq:CTRW>

We compute the macroscopic DP and BTC from the distribution of the attachment locations and the distribution of the arrival time at $x = L$ of the particles surviving until the end of the domain, respectively. The segmentation of the whole filtration process into a sequence of piecewise steps provides the bridge between the microscopic structural- and flow- properties and macroscopic colloid transport. \
The BTC is measured as the distribution of colloid arrival times at the outlet given by the sum of all travel times of flights and dives crossed ($B T C \( t \) = chevron.l sum_n t_(F_n) + t_(D_n) chevron.r$, $n$ being the stochastic number of steps needed to reach the outlet for a trajectory). The tailing observed in Fig.~@fig2 (from experiments) is a signature of the distribution of pore sizes combined with a Poiseuille flow profile within each pore. Thus, pore size variability controls the distribution of low velocities which enhances the dispersion of an injected plume of colloids, resulting in heavy tails in the arrival time distributions. The analytical description of the DP emerges from the interaction between transport and deposition~[#link(<ref-47>)[47]]. \
#strong[Physical parameters]. The proposed framework requires the definition of all physical quantities appearing in the A-CTRW model: the length and velocity distributions of flights ($lambda \, q$) and dives ($l \, u$), reflecting the spatial variability of pore size and fluid velocity, and the constant attachment rate ($k$). \
#strong[Distribution of dive jump sizes $l$]. As pointed out in the PT analysis, collision by physical interception is point-wise within each dive and occurs on specific streamlines. However, all particles that fall within a threshold distance $d_c$ from grain's surface can potentially diffuse and jump on such streamlines. Thus, it is natural to assume that the dive length is equal to the semi-perimeter of a grain, $l = pi r$. This implies that $p_l \( l \) prop p_r \( l \/ pi \)$. \

#figure(image("graphics/figure4.png"),
  caption: [
    #strong[Alternated-CTRW model for filtration]. a) Schematic representation of the one-dimensional Alternated-Continuous Time Random Walk model based on a sequence of flights (blue segments), where transport is dominated by random advection moving from pore to pore, and dives (red segments), where transport is dominated by motion along a grain wall surface where filtration can take place by physical interception. In a flight (blue inset), the motion within pores is represented as a sequence of squared pipe flow (yellow squares) where the parabolic profile is assumed to occur for the entire pore, neglecting thus edge's deformation due to grain's curvature~[#link(<ref-48>)[48]]. In a dive (red inset), the streamline gets deformed by local hydrodynamic pressure imposing a non zero component on the particle's velocity in the direction perpendicular to the grain wall. b) The Probability Density Function, PDF, of the flights' length, $lambda$. Short flights, characterized by a single pore, have a power-law decay. Larger flight are dominated by flow channeling resulting in a flat flights distribution due to the equiprobable nature of longer flights. Larger flight jumps are characterized by an exponential truncation with cutoff of $overline(xi)^2 \/ d_c$ (see S.I. for full derivation, eq.~(17)). Experimental results are shown in red for the arbitrary $d_c = 1 mu m$, direct numerical simulation for $d_c = 1 mu m$ in cyan and for $d_c = 0.5 mu m$ in blue, while prediction of flight distribution for $d_c = 0.01 mu$m, peak of the energy profile shown in Fig.~SI~6 derived from DLVO theory, in black. c) Excellent fit of our A-CTRW (red solid line) to the experimental data (blue line) for DEP and BTC (inset).
  ]
)
<fig4>

#strong[Distribution of dive velocity $u$]. The fluid velocity within each pore throat is characterized by a parabolic profile [#link(<ref-35>)[35], #link(<ref-49>)[49]], with the maximum velocity achieved at its center $u_M tilde.op xi^2$. Thus, the velocity of a suspended particle moving at a fixed distance $d_c$ from the grain surface is given by the parabolic profile evaluated at $y = xi \/ 2 - d_c$, as $u = u_M \[ 1 - \( 2 y \/ xi \)^2 \] tilde.op xi thin d_c$. In this way, the distribution of dive velocities $u$ is controlled by the pore size $xi$ distribution and can be derived by variable transformation. It results in $p_u \( u \) = u^(- beta \/ 2)$, that is given by the porous structure consistently with the porelet model~[#link(<ref-48>)[48]] for low velocities. \
#strong[Distribution of flight lengths $lambda$]. Flights depend only on the statistics of transport. For a particle $p$, each flight length $lambda$ is given by the sum of all pore sizes crossed during that phase, before entering a dive. Here, we assume that the length $xi$ of each pore is statistically proportional to the throat size, as shown for similar structures~[#link(<ref-35>)[35], #link(<ref-50>)[50]]: that is, long pores are also wide (see schematic in Fig.~@fig4~$a$). If within a flight a particle $p$ crosses $n$ pores and then approaches a grain at a distance $d < d_c$ from its surface, it transitions into a dive and the flight ends. Therefore, the flight length $lambda$ is estimated as:

$ lambda = sum_(i = 1)^n xi_i . $ <eq:ell>

We write the probability of a flight to have a jump length $lambda$ as (see Supp. Info. for full derivation):

$ p_lambda \( lambda \) = ⟨sum_(n = 0)^oo delta (lambda - sum_(i = 1)^n xi_i) product_(i = 1)^n alpha_i \( 1 - alpha_(n + 1) \)⟩ $ <lambdaeq>

where $alpha_i$ represents the probability that the particle does not dive within the $i$-th pore, and the average is intended over the pore size $xi$, due to the random arrangement of grains. We assume that every time a colloid moves from one pore to another, it has a uniform probability of being at a distance $d$ from a grain wall. Thus, viewing a pore as a pipe, the probability of entering into a dive is given by the ratio between the area of a dive, an annular ring of thickness $d_c$ and diameter equal to $xi \/ 2$, and the whole pore area, which is $pi xi^2 \/ 4$. This probability can be considered as an equivalent to the well known collector efficiency in CFT. While this parameter is classically assumed as a constant, it is here a stochastic variable that accounts for the randomness of each collector size. For the medium under consideration here, we obtain a closed expression for the distribution of flight length in the Laplace space, as discussed in the Supp. Info. \
Our analysis shows that the distribution of flight lengths is characterized by two main regimes, depending on whether the colloids experience $n = 1$ or $n gt.double 1$ transitions. Indeed, for $n = 1$, flights sample a single pore, so the $p_lambda \( lambda \)$ follows the pore size distribution. For a larger number of transitions, the flight length distribution collapses to a flat profile with a characteristic exponential decay of characteristic scale $xi_0^2 \/ 2 d_c$ (see Supp. Info.). \
Directly measuring the distribution of the flight lengths is particularly challenging for two reasons. First, flights span across several length scales. As pointed out previously, a significant number of colloids crossed undisturbed the entire distance domain of the FoVs ($6 m m$ in total, corresponding to about 100 average pore sizes) in the PT experiment. This means that to properly track and sample longer flights, a larger domain for PT is needed. Although we achieved this by performing multiple PT experiments on 3 consecutive FoVs, we experimentally noted that the number of reconstructed Lagrangian trajectories gets sensitively reduced proportionally to their total length. Second, performing particle tracking within a heterogeneous porous system requires a high acquisition rate (we used $60$ Hz), which limits the time duration of the observation collected. Moreover, to measure $p_lambda \( lambda \)$, we impose the arbitrary $d_c = 2 thin mu$m, which is larger than the actual critical distance below which attachment is possible ($d_c = 0.01 thin mu$m, see Supp. Info.) but allows us to collect enough statistics. The measured distribution is reported in Fig.~@fig4~$b$ as red circles together with the Monte-Carlo simulation of eq.~#link(<lambdaeq>)[\[lambdaeq\]] (red line in Fig.~@fig4~$b$), fed only with the designed pore size distribution $p_xi \( xi \)$. \
To further validate this result, we performed high-resolution 2D PT simulations, as in~[#link(<ref-35>)[35]], on a similar porous geometry (see Methods) but covering a much larger amount of space, about $10^3$ average pore sizes ($10^2$ for the experiment). Then, we analyze these simulated trajectories with two values of the critical distance: $d_(c 1) = 1 thin mu$m and $d_(c 2) = 0.5 thin mu$m. The measured flights length distribution for the simulated trajectory are shown in Fig.~@fig4~$b$ (cyan symbols for $d_(c 1)$ ad blue symbols for $d_(c 2)$). The model of eq.~#link(<lambdaeq>)[\[lambdaeq\]] fits very well the simulated data, just considering the pore size distribution and the critical distances $d_(c 1)$ ad $d_(c 2)$. \
To predict the macroscopic deposition profile, we use our model prediction with the designed pore size distribution and $d_c = 0.01 thin mu$m, which corresponds to the location of the energy barrier peak predicted by DLVO for the measured $zeta$-potential ($V_zeta = - 66$~mV)~[#link(<ref-51>)[51], #link(<ref-52>)[52]]. \
#strong[Distribution of flight velocities $q$]. The velocity $q$ of a flight is given by $q = lambda \/ tau_F$, where $tau_F$ is the flight duration. Thus, to estimate the $q$ distribution, we, first, estimate the number of pores composing the average flight as $n_p = lambda \/ xi$ which is controlled by the distributions of $lambda$ (that we measured) and $xi$ (imposed by the porous structure). Then, the flight velocity is $q = lambda \/ tau_F = lambda \/ \( sum_(i = 1)^(n_p) xi_i \/ v_i \)$, where the pore size $xi$ distribution is given by the medium structure and the individual pore velocity $v$ distribution can be estimated by employing the porelet model~[#link(<ref-35>)[35]]. \
#strong[Attachment rate $k$]. The value of the attachment rate $k$ is estimated by matching the ratio of recovered mass and injected mass from the BTC signal, estimated here by $k = 4.3 dot.op 10^(- 4)$~s$""^(- 1)$ corresponding to a survival time $t_S = 1 \/ k = 2325$~s or about 39 minutes. \
#strong[Model prediction]. Fig.~@fig4~$c$ shows the excellent agreement between the proposed model (red line) for deposition profile $a \( x \)$ and the complementary BTC $1 - c \( t \) \/ c_0$ (inset) measured with our microfluidic setup (blue dotted lines). The model we developed has two major outcomes. On the one hand, it properly predicts the dynamics of the transported colloids that turns out to be controlled by the pore throat size distribution, $p_xi \( xi \)$, that shapes the late arrival times of the BTC. On the other hand, the spatial organization of the retained colloids has a two regimes: power-law near the inlet and exponential decay at larger distances. This emphasizes the role of flights length statistical distribution which is controlled by the porous structure and its physico-chemical properties in terms of the pore size PDF $p_xi \( xi \)$ and the critical distance $d_c$.

#heading(level: 1, numbering: none)[Discussion]
<discussion>
#figure(image("graphics/figure5.png", width: 17cm),
  caption: [
    #strong[Parameters controlling the deposition profile]. The dependence of DP by the microscale parameters as predicted by the derivation of flights distributions and eq.~#link(<eq:cutoff>)[\[eq:cutoff\]] is exploited in the following scenarios. Starting from the same parameters of the experimental set-up, we systematically varied $a$) the critical distance $d_c$ that directly affects the exponential cut-off of the flights jump distribution $lambda$\; $b$) the pore size cut-off $xi_0$\; $c$) the average attachment rate; and $d$) the characteristic pore size distribution exponent $beta$: the solid lines represent $x^(- beta)$.
  ]
)
<fig5>

The proposed A-CTRW shows that the dynamics (BTC) and the spatial organization (DP) of macroscopic filtration are shaped by the microscopic pore structure through three key quantities: i) the critical distance $d_c$, that depends on the material properties of the colloidal suspension and porous system, ii) the medium structure, in terms of pore size distribution characterized by its cut-off scale $xi_0$ and scaling exponent $beta$, and iii) the attachment rate $k$. \
The designed experiment mimics the heterogeneity of a natural soil structure, controlling the grain and pore size distribution across almost 2 orders of magnitude, making this setup suitable for microfluidics replication at the expense of limited reproduction of even more heterogeneous structures. Finer particulates, aggregates, heterogeneity in soil texture, and the presence of macro-fractures should be reflected in broader distributions. Dissecting the dynamics of filtration through the mechanism of flight and dives we observe that the DP is primarily controlled by the flight distribution and, thus, by $xi_0$ and $xi_0^2 \/ \( 2 d_c \)$ for short and long distance, respectively. However, we note that the exponential cut-off for the deposited particles profile, $L_c$, is farther away compared to the cutoff of flight PDF, $xi_0^2 \/ \( 2 d_c \)$. This is not unexpected, as the stochastic nature of adhesion implies that falling into a dive does not necessarily correspond to being attached. In the following, we discuss how the DP is controlled by the medium structure and its physico-chemical properties, specifically with respect of the parameters $xi_0$, $beta$, $d_c$ and $k$. \
#strong[Pore size cut-off $xi_0$ and critical distance $d_c$]. Fig.~@fig5~$a$ shows the prediction of the A-CTRW model for the deposition profile varying the critical distance $d_c$. This parameter controls the location of the DP large distance cut-off $L_c$, which reasonably depends by two processes: the average flight size $overline(lambda)$ and the average number $n$ of flight-dive phases experienced by colloids before attaching, $L_c = n overline(lambda)$. Conceptually, this cut-off arises from the combination of advective transport and attachment. Flights are responsible for the advective component, and they are characterized by their own cutoff $xi_0^2 \/ \( 2 d_c \)$ which encodes the fact that eventually a particle will fall into a dive. However, falling into a dive does not necessarily mean that a particle gets attached. The average number $n$ of flight-dive phases experienced before attachment can be derived from the probability to survive $n$ phases, which is controlled by the ratio of the survival time near a grain, $t_S = 1 \/ k$, and the transport time, with average velocity $v$ along the average grain size $overline(r)$, $t_D = overline(r) \/ overline(u)$. Thus, $n = t_S \/ t_D = overline(v) \/ overline(r) thin k$. Finally, the cut-off for the deposition profile is given by

$ L_c = n overline(lambda) = frac(overline(v), overline(r) thin k) thin frac(xi_0^2, 2 d_c) . $ <eq:cutoff>

If $t_S \/ t_D = frac(overline(u), overline(r) thin k) > 1$ the deposition profile cut-off would exceed the flight size cut-off, otherwise, the attachment rate would be so strong to significantly shorten the colloids ability to travel through the medium: only a few colloids would be able to remain in the suspended phase. Fig.~@fig5~$a$ shows that increasing the critical distance $d_c$ does not change the deposition profile for short distances, but since the overall retention of colloids is more frequent, the cut-off distance $L_c$ decreases as predicted by eq.~#link(<eq:cutoff>)[\[eq:cutoff\]]. By increasing the cut-off pore size $xi_0$, which corresponds to considering pores varying across a wider range of values, it extends the first regime of the DP, the one controlled by the pore size distribution. This is supported by the model predictions shown in Fig.~@fig5~$b$, for which the short distances deposition scales as the pore size distribution until $xi_0$. \
We remark that eq.~#link(<eq:cutoff>)[\[eq:cutoff\]] provides a further analogy with the classical definition of attachment rate, $k_(C F T) prop eta alpha$, where $eta$ describes the probability of collision, while $alpha$ defines the probability of attachment, only if a collision occurred. Despite their empirical estimation in continuum theory, these quantities are here derived, in terms of process-based considerations. \
#strong[Attachment rate $k$]. Chemical and surface properties for both, colloidal suspension and porous material, are lumped into the attachment rate value $k$: higher values will represent more favorable conditions. As discussed, the deposition profile is primarily controlled by the flight length distribution that depends on transport and structural properties of the porous system. We expect that changing the value of the attachment rate $k$ will not affect the shape of the deposition profile, but only the overall overall fraction of the retained particles. Thus, increasing $k$ will result in a upwards shift of the DP and a decrease of its long-distance cut-off. Our model prediction, shown in Fig.~@fig5~$c$, confirm this hypothesis. The scaling of the deposition profile does not change, it is shifted vertically and its large distance cut-off varies as predicted by eq.~#link(<eq:cutoff>)[\[eq:cutoff\]]. \
#strong[Scaling exponent $beta$ of the pore size distribution]. The scaling exponent $beta$ describes the pore-size distribution for value smaller than the cut-off, $xi < xi_0$. In order to probe the impact of $beta$ on DP, we fix the value for $xi_0$ to be much larger than the spatial domain size, and we vary $beta$. Fig.~@fig5~$d$ shows, as expected, how changing $beta$ changes the deposition profile as $tilde.op x^(- beta)$. \
#strong[Outlook]. Due to the multi-scale structure of complex and heterogeneous porous systems, how colloids are transported through pores and deposited over grains has remained poorly understood. This lack of knowledge is due also to the lack of a theoretical frameworks able to bridge microscopic transport/retention and macroscopic filtration. Classical and current models rely on the assumption that particle removal is assumed to happen at a constant rate over defined spatial scales. However, such frameworks are constantly defied by experimental evidence, revealing the limits of such continuum approaches. The multiscale microfluidics model system we developed here allowed us to observe across spatial scales (from tens of microns to a meter) the transport and deposition of a mono-dispersed colloidal suspension constantly injected through a porous system of controlled heterogeneity. Colloids intermittently move along trajectories composed of alternating flights and dives, during which they cannot or can get attached, respectively. We rationalize this remarkable observation by proposing an alternated continuous time random walk (A-CTRW) that honors the observed intermittent behavior and bridges the microscopic medium structure and macroscopic spatial organization and dynamics of filtration. Due to the ubiquity of complex geometry and velocity disorder in natural and engineered porous media (such as soils, rocks and membranes) and the general nature of our model system, we anticipate that the fundamental mechanisms and their large scale manifestations uncovered here will apply to a broad range of transport problems within natural and engineered porous environments.

= Methods
<methods>
#heading(level: 2, numbering: none)[Microfluidics fabrication]
<microfluidics-fabrication>
The designed grain structure was printed onto glass at super high resolution (JD Photodata) in chrome. Micro-channels were fabricated by prototyping against a silicon master (#emph[Electro-Technic] products) with positive relief features using standard soft lithography techniques. Liquid Polydimethylsiloxane (PDMS, Sylgard 184 Silicone Elastomer kit, Dow Corning, Midland, MI) was mixed with the curing agent provided by the Sylgard 184 kit of ratio 1:10 and placed at 60 °C for 5 hours to harden. \
The PDMS layer was 50~mm wide and 75~mm wide in order to fit onto a glass slide of same size. The channel (engraved into the PDMS layer) has thickness $h = 0.05$~mm (as the relief of the silicon master). We plasma-bond it to a soda-lime glass slide (75~mm long, 50~mm wide, and 1~mm thick): this plasma treatment yields the PDMS surface temporarily hydrophilic facilitating their subsequent saturation with the saturation medium. Prior to plasma bonding, the glass slide was coated with a thin layer (about 50~$mu$m) of PDMS by spin-coating: thus, the total surface of the microfluidics channel to which colloids are exposed is composed of PDMS only (the suspension injected into the channel is never in contact with the glass). Thus the colloids-surfaces interaction is homogeneous, avoiding any bias in the attachment process between the PDMS walls and the glass. \

#heading(level: 2, numbering: none)[Colloidal suspensions]
<colloidal-suspensions>
We prepared a colloidal suspension composed by a 4~ml solution of $56 %$~UV treated MilliQ water and $46 %$~D2O (Sigma-Aldrich) to which we add $6 med mu$l of the mono-disperse fluorescent polystyrene particles FLUOROMAX B0100 at concentration 1% solid (Thermo Fisher Scientific) of $1.1 thin mu$m diameter, $R = 0.55 thin mu$m of radius. Heavy water is added to the suspension (1:1 mixture of MilliQ and heavy waters), so that we match the colloids density, which is 1.05 g/ml, to avoid their sedimentation. Before starting each flow experiment, the used suspension has been sonicated for 20 minutes in a bath with ultrasound, in order to breakdown eventual clusters into individual colloids. We measured the injected concentration $c_0$ analyzing pictures taken in the microfluidics region between the inlet hole and the first line of the grains. Finally, the BTC are measured as the number of colloids detected after a time $t$ of injection per unit volume $c \( t \)$, divided by the injected number of colloids per unit volume $c \/ c_0$. During the overall duration of the experiment ($T = 30$~hours), we injected at constant flow rate $Q = 0.72 thin mu$l/min a volume $Q T = 1.3$~ml of suspension. Since the volume of a single colloid is $4 \/ 3 pi R^3$ and the FLUOROMAX suspension has concentration 1% solid, this injected volume corresponds to a total number of about $2.8 dot.op 10^7$ particles. \
The ionic strength of the suspension was fixed to 0.5~mM by adding NaCl to the colloidal suspension. The Zeta Potential of the colloidal suspension ($zeta = - 65.6 plus.minus 0.6$ mV) has been measured with the Zetasizer Nano ZS (MALVERN). The interaction energy profile (see S.I., Fig.~S6) for the system PDMS-water-colloids is computed following the DLVO theory ([#link(<ref-53>)[53], #link(<ref-54>)[54], #link(<ref-55>)[55]], with $H_p$ ,$H_w$ and $H_(P D M S)$ as Hamaker constant for latex particles, water and PDMS, respectively ([#link(<ref-53>)[53], #link(<ref-54>)[54], #link(<ref-52>)[52]] and S.I. for details).

#heading(level: 2, numbering: none)[Time-lapse video-microscopy]
<time-lapse-video-microscopy>
Images were acquired with an automated inverted microscope (Eclipse Ti2, Nikon) equipped with a sCMOS camera (Hamamatsu ORCA flash 4.0). Each picture, of 2048 by 2048 pixels, was recorded at $10 X$~magnification (corresponding to 0.65~$mu m$/pixel) was focused on the middle height of the microfluidic channel. For the BTC, one image was sufficient to cover enough outlet area, while for DP measurement, a grid of $4 times 4$ images was acquired and stitched together by the software NIS Elements. For the BTC measurement, colloids were imaged with a fluorescence optical configuration, using a Nikon DAPI filter cube, with an exposure time of 50~ms. For the DP, the exposure time was three times longer to make deposited particles brighter than the suspended and help the subsequent detection process. \

#heading(level: 2, numbering: none)[Particle Tracking experiments]
<particle-tracking-experiments>
Our Particle Tracking (PT) is composed of two steps. First, microscopy time-lapse image acquisition at 100~Hz is performed at a given location, capturing a given FoV, with the same microscopy setting used for BTC measurements. Due to the high frequency in acquisition rate, the time window for continuous acquisition was limited at $40 s e c$ (thus, 4,000 pictures). After that, a new acquisition started. This process is repeated 6 times in each single FoV, before moving to the next FoV, an area of the microfluidics down-stream and adjacent to it. We collected data for 3 adjacent FoV in total. Trajectories are, then, reconstructed by pairing assignment using a combination of PT algorithms that has been developed in~[#link(<ref-56>)[56]] and further tested in~[#link(<ref-57>)[57]]. The first round of ID assignment between detected particles has been done using the Kalman algorithm of the Trackmate plugin available in FIJI~[#link(<ref-58>)[58]]. This resulted in truncated trajectories: we have glued those trajectories that match final and initial location and velocity. This is done using V-track code to obtain longer trajectories within the same FoV. The same algorithm is further used to glue trajectories between adjacent FoVs, also matching location and velocity. We refer to~[#link(<ref-57>)[57]] for all the details. To segment flights and dives, the exact location of the grains edge relative to the centroids of suspended particles, was assessed. This was achieved by reconstructing the grains mask where grains outlines were defined by imaging the microfluidics saturated with a fluorescent tracer. \

#heading(level: 2, numbering: none)[Measuring Deposition Profiles]
<measuring-deposition-profiles>
Every hour, we acquired a series of pictures sampled in pairs, separated by a time lag $Delta t_1 = 5$~minutes, along the longitudinal direction, at 40 locations (covering about 10~% of the whole system). By comparing two pictures sampled at the same location with the time delay $Delta t$, we assess which particles did not move and, thus, are attached to a solid surface. This results in the profile $a \( x \) = V_c \( x \) \/ V_p \( x \)$ defined as the ratio between the total volume of attached particles at a distance $x$ from the inlet ($V_c \( x \) = N_c \( x \) * 4 \/ 3 pi R^3$) and the pore space volume detected in the images collected at that same location ($V_p \( x \)$), where $N_c$ is the total number of detected colloids, computed by exploiting the #emph[pkfnd] routine of #emph[Matlab] in each image $I_c$. The images location is not equally spaced: we sample more frequently the zone close to the inlet and gradually decrease the number of sampling points towards the outlet: in this way, we can plot our spatial measure with a logarithmic scale honoring every decade of the axis. \
The used polystyrene colloids of diameter $1.1 thin mu$m that have a diffusion coefficient $D tilde.op 4 dot.op 10^(- 7)$mm$""^2$/s~[#link(<ref-32>)[32], #link(<ref-59>)[59]], thus over a time lag $t_a = 300$~s they will move randomly and explore an area of size $sqrt(2 D t_a) = 15 thin mu$m. We evaluate as very unlikely the event of a diffusing particle wondering about to come back at the exact same location after a time $t_a = 300$~s. Thus, we consider as not moving the particles that are found at the same location after 300 seconds, the time separating two acquired images. Attached particles correspond, thus, to the non zero elements of the matrix defined by the product $I_c = sqrt(I_t dot.op I_(t + Delta t))$, where $I_t$ is the intensity captured by the picture at time $t$. \
In the resulting matrix $I_c$ are present several clusters of bright pixels over a dark background. These clusters have individual area that has a size given by the number of colloids that compose them. In our case, most clusters have an area equivalent to that one of a single colloid, but some have an area equivalent to few colloids (2 to 4). Only in a few cases these clusters are large and composed by tens of colloids. These cases happen because the attachment of a single colloid represent an hot-spot for attachment of new coming colloids. This has been reported~[#link(<ref-44>)[44]] in microfluidics channels designed to have a single, or few, obstacle (single collector). We verified that we are, here, in the so-called #emph[clean bed assumption] corresponding to the case in which a flowing-suspended colloid will experience a solid grain wall which is mostly free of other attached colloids (multiple attachment events are very unlikely). We remark that removing clusters much larger than a few colloids do not impact the DP. Moreover, we confirm that considering only clusters attached to the surrounding area of each grains, instead of the whole chip, has no effect on the DP shape, but just induces a slight vertical shift. \

#heading(level: 2, numbering: none)[Measuring BTC]
<measuring-btc>
We periodically acquire pictures in pair separated by a short time lag $Delta t_2 = 2$~s every 5 minutes at the outlet $x = L$. The comparison of 2 consecutive pictures separated by $Delta t_2$ allows us to detect particles that are moving and, thus, to measure the breakthrough curve (BTC) which is the concentration of the suspended colloid, normalized by the injected one, $c \( t \) \/ c_0$. Contrary to the image process for DP, suspended particles at time $t$ are here obtained by the non-zero elements of the matrix given by $I_t - (sqrt(I_t dot.op I_(t + Delta t)))$. Also for the BTC the particle count has been done exploiting the #emph[pkfnd] routine of #emph[Matlab]: we took care of looking for clusters of pixels slightly larger than the one chosen for the deposited particles since moving particles leave a larger image, as previously discussed. Here, the flowing particles are detected as slightly elongated bright ellipsoids rather than circular objects due to the local velocity they are experiencing when the picture is collected. \

#heading(level: 2, numbering: none)[Particle Tracking simulation]
<particle-tracking-simulation>
We integrate $50 \, 000$ particles' trajectories by interpolating, with a higher order numerical Methods (see also~[#link(<ref-35>)[35]]), the velocity field $bold(v) \( bold(x) \)$ at each particle location $bold(x)_p$ to get the particle velocity $bold(v)_p$ and integrate $d bold(x)_p \/ d t = bold(v)_p \( bold(x)_p \)$. The simulated porous structure (different form the experimental one) is characterized by the pore throats size distribution $p_xi \( xi \) tilde.op xi^(- beta) thin e^(- xi \/ xi_0)$ with $beta = 0.16$. \
#strong[Additional information] \
A detailed description of the mathematical derivation for the characteristic scaling laws can be found in the Supplementary Information. \
#strong[Acknowledgments] \
F.M. acknowledges the Swiss National Science Foundation - Postdoc Mobility Fellowship (SNF, grant Nr. P2LAP2$\_$199473). V.L.M. acknowledges the support of the U.S. National Science Foundation (EAR-1847689, EAR-2345366). P.d.A. acknowledges the support of FET-Open project NARCISO (ID: 828890) and the Swiss National Science Foundation (grants ID~200021$\_$172587 and 200021$\_$219863).

#strong[F.M. and P.d.A. designed the research, F.M., H.T. and P.d.A. F.M. designed the experimental set-up and procedure, F.M., A.D.B. P.d.A and V.L.M. designed and did Particle Tracking experiment, and F.M., A.D.B. and P.d.A. analyzed the data, F.M., V.L.M., M.D. and P.d.A. derived the theoretical model, and all authors wrote the manuscript.] \
#strong[Competing financial interests] \
The authors declare no competing financial interests. \

#heading(level: 1, numbering: none)[Supplementary Information]
<supplementary-information>
= Derivation of Flight size PDF solution
<derivation-of-flight-size-pdf-solution>
We consider a colloid that is moving between pores of different length $lambda$. We assume that the length and the diameter are the same. That is, a long pore has also a large diameter. If the colloid enters the pore at a distance $R_c$ from the wall it dives. The probability that the colloid does not dive, that is, that is flies upon entering a pore is denoted by $alpha_i$. The latter can depend on the properties of the pore, like its length and diameter. The probability $p_n$ that a particle flies exactly along $n$ pores before it dives is given by

$ p_n = product_(i = 1)^n alpha_i \( 1 - alpha_(n + 1) \) \, $ <eq:pn>

that is, the probability to fly along $n$ pores times the probability to dive at the $n + 1$th pore. Thus, the distribution of flight lengths is given by

$ p \( x \) = ⟨sum_(n = 0)^oo rho_n \( x \) p_n⟩ \, $ <eq:p>

where $rho_n \( x \)$ is the distribution of flight distances after $n$ steps,

$ rho_n \( x \) = delta \( x - ell_n \) . $

The flight distance $ell_n$ after $n$ pores is

$ ell_n = sum_(i = 1)^n lambda_i . $ <eq:si-ell>

The angular brackets denote the average over all colloids. We can write $p \( x \)$ by using~#link(<eq:pn>)[\[eq:pn\]] and~#link(<eq:si-ell>)[\[eq:si-ell\]] as

$ p \( x \) = ⟨sum_(n = 0)^oo delta (x - sum_(i = 1)^n lambda_i) product_(i = 1)^n alpha_i \( 1 - alpha_(n + 1) \)⟩ $

== Constant diving rate and constant pore-length
<constant-diving-rate-and-constant-pore-length>
We consider the first the case of constant diving rate $alpha_0$ and pore length $lambda_0$. Thus, we obtain for $p \( x \)$

$ p \( x \) = sum_(n = 0)^oo delta (x - n lambda_0) alpha_0^n \( 1 - alpha_0 \) . $

That is, the probability $p_n$ of $x = n lambda_0$ is

$ p_n = alpha_0^n \( 1 - alpha_0 \) = exp \( n ln alpha_0 \) - exp \[ \( n + 1 \) ln alpha_0 \] = exp \( - x_n \/ lambda_c \) - exp \( - x_(n + 1) \/ lambda_c \) = H \( x_n > lambda_0 \) \, $

where we defined $lambda_c = - lambda_0 \/ ln alpha_0$ For $x gt.double lambda_c$, we can write

$ p_n = frac(Delta x exp \( - x \/ lambda_c \), lambda_c) \, $

that is

$ p \( x \) = frac(p_n, Delta x) = frac(exp \( - x \/ lambda_c \), lambda_c) . $

Thus, it decays exponentially fast on the length scale $lambda_c = - lambda_0 \/ ln alpha_0$.

#figure(image("graphics/S2_flightPDF_lambda_constant.png", width: 80.0%),
  caption: [
    Distribution of flight distances for constant pore length and diving rate.
  ]
)
<fig:si-constant>

== Constant diving rate and exponential pore-length distribution
<constant-diving-rate-and-exponential-pore-length-distribution>
We consider the case the $alpha_i = alpha_0 =$ constant and $lambda_i$ exponentially distributed with characteristic scale $ell_0$. In this case,

$ rho_n \( x \) = (x / ell_0)^(n - 1) frac(exp \( - x \/ ell_0 \), Gamma \( n \) ell_0) . $

for $n > 0$. Thus, we obtain for the flight distance distribution

$ p \( x \) = frac(exp \( - x \/ ell_0 \), ell_0) \( 1 - alpha_0 \) sum_(n = 1)^oo (x / ell_0)^(n - 1) frac(alpha_0^n, Gamma \( n \)) + \( 1 - alpha_0 \) delta \( x \) $

The sum can be written as

$  & sum_(n = 1)^oo (x / ell_0)^(n - 1) frac(alpha_0^n, Gamma \( n \)) = (x / ell_0)^(- 1) sum_(n = 1)^oo (x / ell_0)^n frac(alpha_0^n, Gamma \( n \))\
 & = (x / ell_0)^(- 1) [sum_(n = 0)^oo (x / ell_0)^n frac(alpha_0^n, Gamma \( n \)) - 1] = (x / ell_0)^(- 1) [exp \( x alpha_0 \/ ell_0 \) - 1] $

Thus, we obtain for $p \( x \)$

$ p \( x \) = frac(\( 1 - alpha_0 \) exp \( - x \( 1 - alpha_0 \) \/ ell_0 \), ell_0) (x / ell_0)^(- 1) [1 - exp \( - x alpha_0 \/ ell_0 \)] + \( 1 - alpha_0 \) delta \( x \) $

The characteristic decay distance here is $ell_0 \/ \( 1 - alpha \)$ after which $p \( x \)$ decays exponentially with distance. For $ell_0 lt.double x lt.double ell_0 \/ \( 1 - alpha_0 \)$ it decays as $x^(- 1)$.

== Variable diving rate and Gamma-distributed pore lengths
<variable-diving-rate-and-gamma-distributed-pore-lengths>
The probability for diving

$ beta \( lambda \) = frac(pi \( lambda \/ 2 \)^2 - pi \( lambda \/ 2 - R_c \)^2, pi \( lambda \/ 2 \)^2) H \( lambda \/ 2 - R_c \) + H \( R_c - lambda \/ 2 \) . $

The probability that the colloid does not dive is then accordingly

$ alpha \( lambda \) = 1 - beta = \( 1 - 2 R_c \/ lambda \)^2 H \( lambda \/ 2 - R_c \) - H \( R_c - lambda \/ 2 \) $

In this case, we obtain for the distribution of flight lengths

$ p \( x \) = ⟨sum_(n = 0)^oo delta (x - sum_(i = 1)^n lambda_i) product_(i = 1)^n \( 1 - 2 R_c \/ lambda_i \)^2 \[ 1 - \( 1 - 2 R_c \/ lambda_(n + 1) \)^2 \]⟩ $

where we assume that all pore radii are larger than the critical radius. We consider now the Laplace transform in $x$ to obtain

$ tilde(p) \( k \) & = ⟨sum_(n = 0)^oo exp (- k sum_(i = 1)^n lambda_i) product_(i = 1)^n alpha \( lambda_i \) \[ 1 - alpha \( lambda_(n + 1) \) \]⟩\
 & = ⟨sum_(n = 0)^oo product_(i = 1)^n exp (- k lambda_i) alpha \( lambda_i \) \[ 1 - alpha \( lambda_(n + 1) \) \]⟩\
 & = sum_(n = 0)^oo product_(i = 1)^n ⟨exp (- k lambda_i) alpha \( lambda_i \)⟩ ⟨\[ 1 - alpha \( lambda_(n + 1) \) \]⟩\
 & = sum_(n = 0)^oo ⟨exp (- k lambda) alpha \( lambda \)⟩^n ⟨\[ 1 - alpha \( lambda \) \]⟩\
 & = frac(⟨\[ 1 - alpha \( lambda \) \]⟩, 1 - ⟨exp (- k lambda) alpha \( lambda \)⟩) $

We need to determine

$ F \( k \) & equiv ⟨exp (- k lambda) alpha \( lambda \)⟩ = integral_0^oo d y p_lambda \( y \) exp (- k y) alpha \( y \) $

in order to understand the $k$-dependence of $tilde(p) \( k \)$. The pore length distribution $p_lambda \( y \)$ is given by the Gamma distribution,

$ p_lambda \( y \) = (y / ell_0)^(beta - 1) frac(exp \( - y \/ ell_0 \), Gamma \( beta \) ell_0) . $ <eq:gamma>

Thus, we obtain for $F \( k \)$

$ F \( k \) & = integral_0^oo d y (y / ell_0)^(beta - 1) frac(exp \( - y \/ ell_0 \), Gamma \( beta \) ell_0) exp (- k y) alpha \( y \) = integral_0^oo d y (y / ell_0)^(beta - 1) frac(exp \[ - y \( k + 1 \/ ell_0 \], Gamma \( beta \) ell_0) alpha \( y \) \, $

where $beta = 0.4$. This shows that $F \( k \) = G \( k + 1 \/ ell_0 \)$, that is, it is a function of $k + 1 \/ ell_0$. This implies that $p \( x \)$ decays exponentially fast for $x > ell_0$. Figure~@fig shows the distribution of flight distances for the Gamma distribution~@eq:gamma with $beta = 0.4$ and $ell_0 = 1$.

#figure(image("graphics/S1_flightPDF.png", width: 80.0%),
  caption: [
    Distribution of flight distances for a Gamma pore length distribution.
  ]
)
<fig>

#figure(image("graphics/lambda_PDF_normalized_right.png", width: 90.0%),
  caption: [
    Measured flight size $Lambda$ PDF. Data obtained from our particle tracking experiment are shown as red circles and from particle tracking numerical simulations (blue and cyan dots) over the velocity field in~reffig:simfield. For the simulations we also computed the flight size distribution for two values of the critical distance $d_c = 0.5 thin mu$m (blue circles) and $d_c = 1 thin mu$m (cyan circle). Each curve is normalized to unity. The black solid line represents our model prediction with $d_c = 0.01 thin mu$m for the pore throat size distribution of our experiment: this is distribution used for the macroscopic prediction for DP and BTC.
  ]
)
<fig:lambda_PDF>

#figure(image("graphics/SI_fig_simulation.png", width: 100.0%),
  caption: [
    Modulus of the velocity field in logarithmic scale, from~[#link(<ref-35>)[35]] used for particle tracking trajectories. Particle tracking simulations have been performed to obtain $50 \, 000$ trajectories: for each trajectory the distance from the closest grain wall have been computed and from that, the length of flights and dives, reported in figure~@fig:lambda_PDF
  ]
)
<fig:simfield>

== $Lambda$-PDF
<lambda-pdf>
#figure(image("graphics/figureSI5.png", width: 80.0%),
  caption: [
    Schematic representation of the flow-through-pores dynamics, underpinning the stochastic model derived here to predict flights size distribution. The schematic highlight the relevant spatial scales: i) the colloid size $1 thin mu$m, ii) microfluidics thickness, iii) pore throat size $\[ 10 - 300 \] med mu$m, iv) critical distance within the dive phase and v) the overall flight size (length of the dotted line).
  ]
)
<fig:enter-label>

#figure(image("graphics/figureSI6.png", width: 80.0%),
  caption: [
    The total interaction energy within the particle-PDMS surface system, $U_(t o t) \( x \)$, is the additive contribution from Van der Waals attraction [#link(<ref-54>)[54]], $U_(V d W) \( x \)$ and electric double layer interaction, $U_(e l) \( x \)$, [#link(<ref-53>)[53]], where for Z-Potential of PDMS we set -60mV as measured by [#link(<ref-51>)[51]], while for the Hamaker constants we set $H_c = 6.3 e - 20 J$ and $H_(P D M S) = 4.4 e - 20 J$, [#link(<ref-52>)[52]] and $H_w = 3.7 e - 20 J$ for latex particles, PDMS, and water respectively.
  ]
)
<fig:enter-label>

= References

#par[[1] S.~A.~Bradford, V.~L.~Morales, W.~Zhang, R.~W.~Harvey, A.~I.~Packman, A.~Mohanram, ~and~C.~Welty,~#link("https://doi.org/10.1080/10643389.2012.710449")[Critical Reviews in Environmental Science and Technology~#strong[43],~775 (2013)].] <ref-1>

#par[[2] D.~Grolimund, M.~Borkovec, K.~Barmettler, ~and~H.~Sticher,~#link("https://doi.org/10.1021/es960246x")[Environmental Science & Technology~#strong[30],~3118 (1996)].] <ref-2>

#par[[3] S.~A.~Ejazi, R.~Louisthelmy, ~and~K.~Maisel,~#link("https://doi.org/10.1021/acsnano.3c02403")[ACS Nano~#strong[17],~13044 (2023)].] <ref-3>

#par[[4] D.~Scheidweiler, A.~D.~Bordoloi, W.~Jiao, V.~Sentchilo, M.~Bollani, A.~Chhun, P.~Engel, ~and~P.~De~Anna,~#link("https://doi.org/10.1038/s41467-023-44267-y")[Nature Communications~#strong[15],~191 (2024)].] <ref-4>

#par[[5] A.~Malandrino, M.~Mak, R.~D.~Kamm, ~and~E.~Moeendarbary,~#link("https://doi.org/10.1016/j.eml.2018.02.003")[Extreme Mechanics Letters~#strong[21],~25 (2018)].] <ref-5>

#par[[6] E.~Blanco, H.~Shen, ~and~M.~Ferrari,~#link("https://doi.org/10.1038/nbt.3330")[Nature Biotechnology~#strong[33],~941 (2015)].] <ref-6>

#par[[7] B.~A.~Corliss, C.~Mathews, R.~Doty, G.~Rohde, ~and~S.~M.~Peirce,~#link("https://doi.org/10.1111/micc.12520")[Microcirculation~#strong[26],~e12520 (2019)].] <ref-7>

#par[[8] M.~Jafarnejad, A.~Z.~Ismail, D.~Duarte, C.~Vyas, A.~Ghahramani, D.~C.~Zawieja, C.~Lo~Celso, G.~Poologasundarampillai, ~and~J.~E.~Moore,~#link("https://doi.org/10.1038/s41598-019-49055-7")[Scientific Reports~#strong[9],~13380 (2019)].] <ref-8>

#par[[9] A.~Tcharkhtchi, N.~Abbasnezhad, M.~Zarbini~Seydani, N.~Zirak, S.~Farzaneh, ~and~M.~Shirinbayan,~#link("https://doi.org/10.1016/j.bioactmat.2020.08.002")[Bioactive Materials~#strong[6],~106 (2021)].] <ref-9>

#par[[10] S.~A.~Bradford~and~S.~Torkzaban,~ Langmuir~#strong[31],~12096 (2015).] <ref-10>

#par[[11] K.~E.~Nelson, A.~Massoudieh, ~and~T.~R.~Ginn,~ Adv. in Water Res.~#strong[30],~1492 (2007).] <ref-11>

#par[[12] M.~E.~Nelson~and~T.~R.~Ginn,~ Langmuir~#strong[21],~2173 (2005).] <ref-12>

#par[[13] J.~Happel,~ Environ. Sci. Technol.~#strong[37],~616 (2003).] <ref-13>

#par[[14] A.~Cortis, T.~Harter, L.~Hou, E.~R.~Atwill, ~and~A.~I.~Packman,~ Water Resour. Res.~#strong[42],~W12S13 (2006).] <ref-14>

#par[[15] N.~Tufenkji~and~M.~Elimelech,~ Langmuir~#strong[20],~10818 (2004).] <ref-15>

#par[[16] N.~Tufenkji~and~M.~Elimelech,~ Langmuir~#strong[21],~841 (2005a).] <ref-16>

#par[[17] J.~A.~Redman, S.~B.~Grant, T.~M.~Olson, ~and~M.~K.~Estes,~#link("https://doi.org/10.1021/es0010960")[Environmental Science & Technology~#strong[35],~1798 (2001)].] <ref-17>

#par[[18] P.~R.~Johnson, N.~Sun, ~and~M.~Elimelech,~ Environmental science & technology~#strong[30],~3284 (1996).] <ref-18>

#par[[19] J.~C.~Baygents, J.~R.~Glynn, O.~Albinger, B.~K.~Biesemeyer, K.~L.~Ogden, ~and~R.~G.~Arnold,~#link("https://doi.org/10.1021/es9707116")[Environmental Science & Technology~#strong[32],~1596 (1998)].] <ref-19>

#par[[20] I.~L.~Molnar, W.~P.~Johnson, J.~I.~Gerhard, C.~S.~Willson, ~and~D.~M.~O'carroll,~ Water Resources Research~#strong[51],~6804 (2015).] <ref-20>

#par[[21] X.~Li, P.~Zhang, C.~L.~Lin, ~and~W.~P.~Johnson,~#link("https://doi.org/10.1021/es048814t")[Environmental Science & Technology~#strong[39],~4012 (2005)].] <ref-21>

#par[[22] A.~J.~Perez, J.~E.~Patiño, M.~Soos, ~and~V.~L.~Morales,~#link("https://doi.org/10.1021/acs.est.9b05744")[~#strong[54],~5813].] <ref-22>

#par[[23] G.~Gerber, S.~Rodts, P.~Aimedieu, P.~Faure, ~and~P.~Coussot,~#link("https://doi.org/10.1103/PhysRevLett.120.148001")[Phys. Rev. Lett.~#strong[120],~148001 (2018)].] <ref-23>

#par[[24] N.~Bizmark, J.~Schneider, R.~D.~Priestley, ~and~S.~S.~Datta,~#link("https://doi.org/10.1126/sciadv.abc2530")[Science Advances~#strong[6],~eabc2530 (2020)].] <ref-24>

#par[[25] J.~E.~Patiño, W.~P.~Johnson, ~and~V.~L.~Morales,~#link("https://doi.org/10.1016/j.jcis.2023.03.005")[Journal of Colloid and Interface Science~#strong[641],~666 (2023)].] <ref-25>

#par[[26] C.~Jorge, A.~Chardac, A.~Poncet, ~and~D.~Bartolo,~#link("https://doi.org/10.1038/s41567-023-02301-2")[Nature Physics~#strong[20],~303 (2024)].] <ref-26>

#par[[27] A.~Dehkharghani, N.~Waisbord, J.~Dunkel, ~and~J.~S.~Guasto,~#link("https://doi.org/10.1073/pnas.1819613116")[Proceedings of the National Academy of Sciences~,~201819613 (2019)],~pMID: 31097583.] <ref-27>

#par[[28] d.~A.~Pietro, P.~Amir~A., Y.~Yutaka, S.~Roman, ~and~J.~Ruben,~ Nat. Phys.~#strong[17],~68 (2021).] <ref-28>

#par[[29] N.~Waisbord, A.~Dehkharghani, ~and~J.~S.~Guasto,~#link("https://doi.org/10.1038/s41467-021-26235-6")[Nature Communications~#strong[12],~5949 (2021)].] <ref-29>

#par[[30] D.~Scheidweiler, F.~Miele, H.~Peter, T.~J.~Battin, ~and~P.~de~Anna,~#link("https://doi.org/10.1098/rsif.2020.0046")[~#strong[17],~20200046].] <ref-30>

#par[[31] N.~Waisbord, N.~Stoop, D.~M.~Walkama, J.~Dunkel, ~and~J.~S.~Guasto,~#link("https://doi.org/10.1103/PhysRevFluids.4.063303")[Physical Review Fluids~#strong[4],~063303 (2019)].] <ref-31>

#par[[32] A.~D.~Bordoloi, D.~Scheidweiler, M.~Dentz, M.~Bouabdellaoui, M.~Abbarchi, ~and~P.~De~Anna,~#link("https://doi.org/10.1038/s41467-022-31552-5")[Nature Communications~#strong[13],~3820 (2022)].] <ref-32>

#par[[33] D.~Scheidweiler, F.~Miele, H.~Peter, T.~J.~Battin, ~and~P.~d.~Anna,~#link("https://doi.org/10.1098/rsif.2020.0046")[Journal of The Royal Society Interface~#strong[17],~20200046 (2020)],~publisher: The Royal Society.] <ref-33>

#par[[34] A.~Pradel, N.~Delouche, J.~Gigault, ~and~H.~Tabuteau,~ Environmental science & technology~#strong[58],~8878 (2024a).] <ref-34>

#par[[35] P.~de~Anna, B.~Quaife, G.~Biros, ~and~R.~Juanes,~ Phys. Rev. Fluids~#strong[2],~124103 (2017a).] <ref-35>

#par[[36] M.~Dentz, T.~Le Borgne, A.~Englert, ~and~B.~Bijeljic,~ J. Contaminant Hydrol.~#strong[120-121],~1 (2011).] <ref-36>

#par[[37] B.~Berkowitz, A.~Cortis, M.~Dentz, ~and~H.~Scher,~ Rev. Geophys.~#strong[44],~1 (2006).] <ref-37>

#par[[38] N.~Tufenkji~and~M.~Elimelech,~#link("https://doi.org/10.1021/la048102g")[Langmuir~#strong[21],~841 (2005b)].] <ref-38>

#par[[39] X.~Li, T.~D.~Scheibe, ~and~W.~P.~Johnson,~ Environ. Sci. Technol.~#strong[38],~5616 (2004).] <ref-39>

#par[[40] S.~A.~Bradford, J.~Simunek, M.~Bettahar, M.~T.~van Genuchten, ~and~S.~R.~Yates,~ Environ. Sci. Technol.~#strong[37(10)],~2242 (2003).] <ref-40>

#par[[41] W.~P.~Johnson,~ Environ. Sci. Technol.~#strong[10.1021/acs.est.8b00811] (2018).] <ref-41>

#par[[42] R.~Rusconi, M.~Garren, ~and~R.~Stocker,~#link("https://doi.org/10.1146/annurev-biophys-051013-022916")[~#strong[43],~65].] <ref-42>

#par[[43] J.~Happel,~ AIChE J.~#strong[4],~197 (1958).] <ref-43>

#par[[44] B.~Dersoir, M.~R.~de~Saint~Vincent, M.~Abkarian, ~and~T.~Herve,~#link("https://doi.org/10.1007/s10404-015-1624-y")[Microfluid Nanofluid~#strong[19],~953 (2015)].] <ref-44>

#par[[45] A.~Pradel, N.~Delouche, J.~Gigault, ~and~H.~Tabuteau,~#link("https://doi.org/10.1021/acs.est.3c07656")[Environmental Science & Technology~#strong[58],~8878 (2024b)].] <ref-45>

#par[[46] K.~M.~Yao, M.~T.~Habibian, ~and~C.~O.~O'Melia,~ Environ. Sci. Technol.~#strong[5],~1105 (1971).] <ref-46>

#par[[47] F.~Miele, P.~de~Anna, ~and~M.~Dentz,~#link("https://doi.org/10.1103/PhysRevFluids.4.094101")[~#strong[4],~094101].] <ref-47>

#par[[48] P.~de~Anna, B.~Quaife, G.~Biros, ~and~J.~Juanes,~ Phys. Rev. Fluids~#strong[124103],~2 (2017b).] <ref-48>

#par[[49] M.~Dentz, M.~Icardi, ~and~J.~J.~Hidalgo,~ J. Fluid Mech.~#strong[841],~851 (2018).] <ref-49>

#par[[50] W.~Jiao, D.~Scheidweiler, N.~Delouche, P.~De~Anna, ~and~A.~Guadagnini,~#link("https://doi.org/10.1103/PhysRevFluids.9.094102")[Physical Review Fluids~#strong[9],~094102 (2024)].] <ref-50>

#par[[51] B.~J.~Kirby~and~E.~F.~Hasselbrink,~#link("https://doi.org/10.1002/elps.200305754")[ELECTROPHORESIS~#strong[25],~187 (2004)].] <ref-51>

#par[[52] Y.-S.~Yu, M.-C.~Wang, ~and~X.~Huang,~#link("https://doi.org/10.1038/s41598-017-14593-5")[Scientific Reports~#strong[7],~14118 (2017)].] <ref-52>

#par[[53] E.~Ruckenstein~and~D.~C.~Prieve,~#link("https://doi.org/10.1002/aic.690220209")[AIChE Journal~#strong[22],~276 (1976)].] <ref-53>

#par[[54] R.~Hogg, T.~Healy, ~and~D.~W.~Fuerstenau,~ Transactions of the Faraday Society~#strong[62],~1638 (1966).] <ref-54>

#par[[55] M.~Elimelech, X.~Jia, J.~Gregory, ~and~R.~A.~Williams,~ #emph[Particle Deposition and Aggregation - Measurement, Modeling and Simulation]~(Butterworth Heinemann,~1995).] <ref-55>

#par[[56] V.~L.~Morales, M.~Dentz, M.~Willmann, ~and~M.~Holzner,~#link("https://doi.org/10.1002/2017GL074326")[Geophysical Research Letters~#strong[44],~9361 (2017)].] <ref-56>

#par[[57] M.~Berghouse, F.~Miele, L.~J.~Perez, A.~D.~Bordoloi, V.~L.~Morales, ~and~R.~Parashar,~#link("https://doi.org/10.1038/s41598-024-75581-0")[Scientific Reports~#strong[14],~24094 (2024)].] <ref-57>

#par[[58] C.~A.~Schneider, W.~S.~Rasband, ~and~K.~W.~Eliceiri,~#link("https://doi.org/10.1038/nmeth.2089")[Nature Methods~#strong[9],~671 (2012)].] <ref-58>

#par[[59] M.~Hamada~and~P.~De~Anna,~#link("https://doi.org/10.1007/s11242-021-01704-0")[Transport in Porous Media~#strong[146],~463].] <ref-59>
