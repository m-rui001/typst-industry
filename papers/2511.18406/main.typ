#set page(paper: "us-letter", margin: (x: 17mm, top: 17mm, bottom: 19mm), numbering: "1")
#set text(font: "Libertinus Serif", size: 9.5pt, lang: "en")
#set par(justify: true, leading: 0.48em, first-line-indent: (amount: 1em, all: true))
#set math.equation(numbering: "(1)")
#set figure.caption(separator: [. ])
#show figure.caption: set text(size: 8.5pt)

#align(center)[
  #text(size: 13pt, weight: "bold")[Atomistic Framework for Glassy Polymer Viscoelasticity Across 20 Frequency Decades]
  #v(8pt)
  Ankit Singh#super[1,\*], Vinay Vaibhav#super[1,2,†], Caterina Czibula#super[3,‡],
  Astrid Macher#super[4], Petra Christöfl#super[4], Karin Bartl#super[5],
  Gregor Trimmel#super[5], Timothy W. Sirk#super[6], and Alessio Zaccone#super[1,§]
  #v(5pt)
  #text(size: 8.5pt)[
    #super[1] Department of Physics “A. Pontremoli”, University of Milan, Via Celoria 16, 20133 Milan, Italy \
    #super[2] Institut für Theoretische Physik, University of Göttingen, Friedrich-Hund-Platz 1, 37077 Göttingen, Germany \
    #super[3] Institute of Bioproducts and Paper Technology, Graz University of Technology, Inffeldgasse 23, 8010 Graz, Austria \
    #super[4] Polymer Competence Center Leoben GmbH, Sauraugasse 1, 8700 Leoben, Austria \
    #super[5] Institute for Chemistry and Technology of Materials, Graz University of Technology, Stremayrgasse 9, 8010 Graz, Austria \
    #super[6] US Army DEVCOM Army Research Laboratory, Aberdeen Proving Ground, Maryland 21005, United States
  ]
]

#pad(x: 12mm)[
  #set par(first-line-indent: 0pt)
  Glassy polymers are central to engineering applications, yet their viscoelastic response over broad frequency and temperature ranges remains difficult to characterize. We extend non-affine deformation theory by incorporating a time-dependent memory kernel within the Generalized Langevin Equation for atomistic non-affine motions, yielding frequency-dependent mechanical response. Applied to poly(methyl methacrylate) (PMMA), the method captures the shear modulus and relaxation spectrum across more than twenty decades in frequency, from hundreds of terahertz down to the millihertz regime, thus bridging polymer mechanics from ordinary to extreme scales. Our predictions show quantitative consistency with independent estimates from oscillatory-shear molecular dynamics, Brillouin scattering, ultrasonic spectroscopy, Split-Hopkinson testing, and dynamic mechanical analysis (DMA), demonstrating a unified theoretical--computational route for multiscale characterization of polymer glasses.
]
#v(6pt)

#columns(2, gutter: 5mm)[
#text(size: 8pt)[
  \* #link("mailto:ankit.singh@unimi.it") · † #link("mailto:vinay.vaibhav@uni-goettingen.de") \
  ‡ #link("mailto:caterina.czibula@tugraz.at") · § #link("mailto:alessio.zaccone@unimi.it")
]
#v(4pt)

Glassy polymers are widely used in structural and protective components, where their mechanical response governs performance and durability @colmenero_2015polymers@wang_2024glassy, yet their viscoelastic behavior over a broad frequency range, covering molecular processes as well as engineering applications, remains poorly characterized. This shortcoming reflects the challenge of describing glassy polymer viscoelasticity consistently across the wide range of relevant timescales, both theoretically and experimentally. At high frequency level (GHz to THz), molecular simulations of glassy polymers have yielded detailed insight into relaxation dynamics near the glass transition, but at low frequency regimes ($tilde.op$ Hz) relevant to static load-bearing applications @astm_2013standard@lakes2009viscoelastic@lakes_2017viscoelastic, viscoelasticity is often described by phenomenological models, in which the polymer's broad spectrum of relaxation processes is compressed into adjustable parameter sets that represent effective modes rather than distinct molecular mechanisms @tschoegl2012phenomenological. As a consequence, establishing a direct molecular-to-macroscopic link in the mechanical response of polymeric glasses remains challenging.



There are different experimental techniques available to probe the mechanical response of glassy polymers in various accessible frequency ranges. In the low-frequency regime (mHz-Hz), dynamic mechanical analysis (DMA) @menard2020dynamic is a popularly used approach, where a sinusoidal deformation is applied and the corresponding response is measured. The internal friction of the material causes a phase lag between stress and strain, from which the storage modulus $G'$ and loss modulus $G''$ are obtained @Zaccone_book. DMA is an established technique to probe application-relevant conditions, construct long-term material behavior via time--temperature superposition, and assess how factors such as strain rate influence relaxation processes @Wyss_PhysRevLett.98.238303@Sun_PhysRevB.111.184107@MULLIKEN20061331. As the probed frequency increases, available experimental methods transition from contact-based to non-contact and non-destructive. Dynamic contact-based mechanical testing, such as Split-Hopkinson pressure bars ($10^3$ - $10^4$ Hz) or ballistic testing (about $10^6$ Hz), determine material properties under high strain-rates, comparable to impacts and explosions. From MHz frequencies upward, only non-contact techniques are available, for example, ultrasonic methods, where sound waves are sent through the material, to determine their elastic properties @afifi2003ultrasonic. In the GHz regime, Brillouin light scattering spectroscopy has been widely exploited @Merklein_2022. As an inelastic light-scattering process, Brillouin scattering originates from interactions with high-frequency acoustic phonons, whose dynamics govern the magnitude of the so-called frequency shift that depends directly on the elastic properties of the medium. Brillouin spectroscopy provides access to microscopic mechanical response @Merklein_2022@prevot_2025_softmatter, which has also recently been proven to agree well with atomistic modeling approaches for polymeric materials @delasoudas2025elasticity@lakes2009viscoelastic.



Numerical investigations have long addressed the determination of elastic moduli in disordered solids @Barrat_1988@Leonforte_PhysRevB.72.224206@Procaccia_PhysRevE.93.063003@kriuchevskyi_2017numerical@Krief_PhysRevE.103.063307, with many employing the stress-fluctuation formalism to evaluate the static shear modulus @wittmer_2013shear@Wittmer_PhysRevE.91.022107@Kriuchevskyi_PhysRevLett.119.147802. Most of these studies rely on coarse-grained models, where the shear modulus is computed from equilibrium stress fluctuations. In such systems, stress correlations decay extremely slow as the glass transition approaches, reflecting the growing structural relaxation time. However, molecular dynamics (MD) simulations involving oscillatory shear remain limited to only a few orders of frequency range (above THz), due to computational constraints, thus making it difficult to access experimentally relevant timescales. Several advanced methods have been proposed to bridge this gap, including activation--relaxation theory @Dyre_PhysRevB.53.2171@Olsen_PhysRevLett.81.1031, parallel replica dynamics @perez_2015parallel, and non-affine deformation theory @Leonforte_silica@Zaccone_book@Scossa@vaibhav2024time@singh2025viscosity. In spite of this, current computational approaches are only able to describe the dynamic mechanical response only at extremely short time scales @mukherji.



A promising microscopic framework to address these limitations is the non-affine lattice dynamics (NALD) approach, which connects atomic-scale motion to macroscopic elastic response @elder@vaibhav2024time. In NALD, the motion of each atom is described through its non-affine displacement relative to the affine deformation imposed by external strain. These non-affine displacements arise from structural disorder---due to thermal fluctuations or local topological asymmetries---that break local centrosymmetry. Under deformation, each atom experiences a net unbalanced force, the affine force field, which drives additional non-affine motion @Zaccone_book. The internal work associated with these relaxations contributes negatively to the total deformation free energy, thereby reducing the macroscopic shear modulus @Scossa. This framework provides a microscopic basis for understanding the elastic response of amorphous materials over a wide frequency range, thus establishing a theoretical route to link the atomistic dynamics with the experimental mechanical response @elder@vaibhav2024time.



In this work, we develop and apply the microscopic non-affine computation scheme that exploits the atomic-scale description of particle displacements under deformation to overcome the intrinsic timescale limitations of conventional methods. This framework enables the computation of mechanical responses at experimentally accessible frequencies, thereby bridging the mechanical response from DMA to Brillouin scattering to atomistic MD. We study poly(methyl methacrylate) (PMMA) below its glass transition temperature, that has been extensively studied as a model system for exploring the viscoelastic response and relaxation spectra both experimentally and through molecular simulations @MULLIKEN20061331@richeton_2007_modeling@ionita_2015viscoelastic@hu_2016_experimental@Lu_1997_polymer@William_PhysRevApplied.18.064078. We use atomistic MD simulations to explore the characteristics of the underlying potential energy surface. Using the normal mode analysis, we obtain the vibrational density of states (vDOS) and the affine force field correlator, which, together, enable the evaluation of the complex shear modulus. A time-dependent memory kernel is introduced to capture the primary and secondary relaxation decays of the shear modulus in the frequency domain. Furthermore, the theoretical estimates are validated with DMA measurements consisting of temperature sweeps at four different frequency levels (0.1, 1, 10, and 100 Hz), as well as with other experimental data in the Brillouin regime from the literature. Overall, a unique and advantageous aspect of our study is a description of polymer viscoelasticity across timescales of conventional mechanical testing (DMA), high rate tests (Split-Hopkinson testing, ultrasonics, and Brillouin spectroscopy), and molecular dynamics, ultimately spanning twenty frequency decades across molecular processes to application-relevant timescales.



For the numerical study, we have considered 64 polymeric chains (each containing 10 monomers) of PMMA in a periodic simulation box, making a system of $N = 9920$ atoms. Check section S2 of Supplementary Information (SI) @supp for further details. The atomic interactions are modeled using the General AMBER Force Field (GAFF), where bond, angle, and dihedral terms are represented by harmonic potentials. Electrostatic interactions are treated using the particle-particle particle-mesh (PPPM) method, with a real-space cut-off of $9$ Å. Lennard-Jones interactions are truncated at $9$ Å. Large-scale molecular dynamics simulations are carried out using LAMMPS @LAMMPS to generate polymer configurations under fixed temperature and pressure conditions. The system temperature and pressure are controlled through the Nosé--Hoover thermostat and barostat, respectively, with the pressure maintained at zero throughout the simulation. The equations of motion are solved under periodic boundary conditions using the velocity-Verlet integrator with a timestep of 1~fs.



In NALD, potential energy surface (PES) @wales_2006potential is required to measure the mechanical response of atomistic systems. PES describes the total potential energy of the system as a function of the atomic positions, effectively defining the energy landscape in which the atoms reside. The first derivative of the PES with respect to atomic positions gives the forces acting on each atom, which govern the atomic motion and local stability of the system, including internal stresses. The second derivative, known as the Hessian or dynamical matrix, provides information about the curvature of the PES, which determines the vibrational modes and eigenfrequencies of the system. These vibrational properties are crucial for calculating the affine (infinite-frequency) elastic modulus as well as the non-affine corrections arising from local, disorder-induced atomic rearrangements. We diagonalize the Hessian matrix to obtain the eigenfrequencies and corresponding eigenmodes of the system that are used to calculate the normalized vibrational density of states $g \( omega \) = frac(1, 3 N - 3) sum_i delta \( omega - omega_i \)$ and the affine force field correlator $Gamma_(alpha beta kappa chi) \( omega \) = chevron.l hat(Xi)_(alpha beta) hat(Xi)_(kappa chi) chevron.r_(omega in \[ omega_k \, omega_k + delta omega_k \])$ (see section S1 of SI @supp for definition), where $hat(Xi)_(alpha beta) \( omega \)$ is the component of affine force field. The frequency-dependent elastic constants $C_(alpha beta kappa chi) \( Omega \)$ can be obtained in terms of these quantities via the relation @Zaccone_book@Scossa

$ C_(alpha beta kappa chi) \( Omega \) = C_(alpha beta kappa chi)^A - 3 rho integral frac(Gamma_(alpha beta kappa chi) \( omega \) g \( omega \), m \( omega^2 - Omega^2 \) + i Omega nu) d omega \, $<Cint>

where $Omega$ is the applied strain frequency, $C_(alpha beta kappa chi)^(upright(A))$ is the affine contribution to elasticity, $rho$ is number density, and $nu$ is the friction memory kernel. The integrand term accounts for non-affine effects that act as a negative correction to the quasi-static limit, arising from local asymmetries in the atomic potential energy landscape during macroscopically affine deformations, as typically observed in glasses as well as in noncentrosymmetric crystals @cui.



The various components of the elastic constants can be determined using Eq.~@Cint depend on different components of the affine force field with the corresponding component of the affine elastic constant. Here, we focus on the shear modulus $G$, for which Eq.~@Cint can be rewritten in the form

$ G^(*) \( Omega \) = G_A - 3 rho integral frac(Gamma \( omega \) g \( omega \), \( omega^2 - Omega^2 \) + i Omega nu) d omega . $<Gint>

Here, $G^(*) \( Omega \)$ represents the complex shear modulus and $G_A$ is the affine modulus. We separate the real and imaginary components of $G^(*) \( Omega \)$ (SI @supp, section S1) that correspond to the storage and loss moduli, respectively, which quantify the elastic and viscous responses of the system. Also, we absorb the mass term in the affine force correlator and friction memory kernel @kriuchevskyi2020scaling@vaibhav2024time to get corresponding mass-scaled quantity.



For simplicity, a fixed value of memory kernel $nu$ is generally used in Eq.~@Gint, which is the only parameter adjusted to perfectly match the MD results for the infinite-frequency plateau, as done also in @vaibhav2024time@elder and discussed in Section S1 of SI @supp. In a Markovian process, friction is treated as a constant, as is typically assumed in molecular simulations using e.g. the Langevin thermostat. However, in real glassy materials, friction is more accurately described within a non-Markovian framework, where the friction kernel depends on time or the history of deformation. To capture such experimental conditions, we allow the friction parameter $nu$ to vary and adopt a simple power-law decay @milster_2024tracer@li2017computing in the time domain, $nu \( t \) tilde.op nu_0 t^(delta - 1)$ with $delta < 1$. For our needs in the frequency domain, the corresponding Fourier transform gives $nu \( Omega \) = nu_0 Omega^(- delta)$, indicating that the effective friction decreases at high frequencies and recovers the constant Markovian limit as $tau arrow.r 0$. We use this friction kernel in the NALD equations to calculate the shear modulus in order to compare with the experimental results.



#figure(image("source/fig1.pdf", width: 97.0%), placement: top,

  caption: [

    \(a) Vibrational density of states $g \( omega \)$ and (b) affine force field correlator $Gamma \( omega \)$ as a function of normal mode frequency $\( omega \)$ at temperature $T = 300$~K, for our simulated PMMA glass.

  ]

)

<fig1>



We employ the NALD method to calculate the viscoelastic response and compare the results with experimental measurements. For the NALD calculations, we require microscopic information, namely the vibrational density of states $g \( omega \)$, the affine force correlation function $Gamma \( omega \)$, and the friction kernel $nu$. In @fig1\(a) and (b), we plot the vibrational density of states (vDOS) and the affine force field correlator $Gamma \( omega \)$, respectively, as functions of the normal mode frequency $\( omega \)$ at room temperature, $T = 300$K. Since our system is at a finite temperature, the vDOS contains a significant fraction of imaginary modes (instantaneous normal modes, INMs) (conventionally represented on the negative branch of $omega$) in addition to real modes @keyes1994unstable@Laird@stratt1995instantaneous@Jack@vaibhav2025experimental. The imaginary INMs originate from the presence of saddle points in the potential energy landscape, whereas the real modes correspond to stable vibrational motions (e.g. phonons).



We observe several peaks across the entire frequency spectrum. These features may arise from the characteristic bonding nature of PMMA, where certain bonding interactions contribute vibrational modes in the high-frequency range of the vDOS. Near zero frequency, on both the positive and negative branches, the vDOS increases linearly, as often observed in glasses and supercooled liquids @Petry@Laird@palyulin2018parameter. This low-frequency regime shows only little variation with temperature (as shown in Fig.~S1 of SI @supp).



In @fig1\(b), the affine-force field correlator $Gamma \( omega \)$ is shown for the same temperature. The overall profile of $Gamma \( omega \)$ exhibits several peaks, similar to the vDOS, with peak intensities increasing modestly as the temperature decreases (SI @supp, section S1). At high frequencies, around $550 thin upright(T H z)$, a pronounced peak is observed; however, its influence on the elastic modulus is minimal. In contrast, at low frequencies, $Gamma \( omega \)$ follows the expected analytical scaling ~@Scossa@Milkus_2017 $Gamma \( omega \) tilde.op omega^2$, which plays a dominant role in the determination of the modulus. This low-frequency behavior reflects the long-wavelength vibrational modes that couple strongly with the macroscopic deformation response.



Using the information from the vibrational density of states $g \( omega \)$ and the affine force field correlator $Gamma \( omega \)$, we calculate the viscoelastic modulus as a function of the external frequency $Omega$ at different temperatures below the glass transition. An important additional quantity in this calculation is the friction memory kernel, which enters the equations in the power-law form @milster_2024tracer@li2017computing $nu \( Omega \) = nu_0 Omega^(- delta)$ with parameters $nu_0 = 5.2 times 10^18 thin upright(k g thin s^(- 1))$ and $delta = 0.35$. In the time domain, this form corresponds to the memory kernel given by $nu \( t \) tilde.op nu_0 t^(\( delta - 1 \))$. We plot and discuss $nu$ in the SI @supp as Figure~S4 shows $nu \( Omega \)$ as a function of the external frequency.



In the determination of the modulus $G$, we perform the integration over both the real and imaginary branches of $omega$, as shown in Eqs.~(S.4, S.5) of SI @supp. Since the system is relatively small, finite-size effects arise, leading to the presence of non-physical low-frequency modes. To address this, a fraction of the small-frequency modes below a cut-off frequency $omega_(upright(m i n))$ is discarded during the integration, as the system cannot support propagating modes with frequencies lower than the speed of sound in the medium. The minimum frequency can be estimated as $omega_(upright(m i n)) = frac(2 pi, L) sqrt(G / rho)$, where $L$ is the size of the simulation box, $rho$ is the mass density, and $G$ is the shear modulus @vaibhav2024time. Hence, when performing the finite analytical integration for the modulus calculations, we incorporate all modes with $\| omega \| < omega_min$ to account for the low-frequency contributions below the cut-off.



We observed a secondary $beta$ relaxation @Ngai in the shear modulus in the frequency domain around 1~Hz. This is reflected in the time domain, where $G \( t \)$ decays at $tau tilde.op 1$ s. Capturing such small frequencies in simulations is very challenging due to system size limitations and the computational cost of Hessian diagonalization. To overcome this, we use an analytical-theory extension in the very low-frequency regime, exploiting the known behavior of $Gamma \( omega \)$ and $g \( omega \)$ @Zaccone_book. Specifically, we fit $Gamma \( omega \) = a_0 thin omega^2 \, quad g \( omega \) = a_1 thin omega \,$ with $a_0 = 3.1 times 10^(- 18)$ and $a_1 = 4.5 times 10^(- 16)$ Figs.~S2, S3 corresponding plot in the SI @supp. We then evaluate the additional analytical contribution, obtaining the exact integral solution at finite integration limits for both the real and imaginary parts of the eigenfrequencies. In this regime, the friction kernel is found to be on the order of $nu = 5 times 10^22 thin upright(k g \/ s)$ across the entire deformation frequency range.



#figure(image("source/fig2.pdf", width: 99.8%),

  caption: [

    Temperature dependence of shear storage modulus $G'$ for PMMA calculated using NALD (close triangle) is compared with DMA experimental data (closed diamonds, at external frequency $Omega = 1$ Hz). The solid line represents the theoretical fit based on the equation described in SI @supp, with a glass transition temperature of $T_g approx 390 med upright(K)$. We also plot the affine modulus $G_A$ (open squares) as a function of temperature.

  ]

)

<fig2>



In @fig2, we show the shear modulus $G'$ serving as an order parameter that distinguishes the glassy and liquid phases. Here, $G'$ is plotted as a function of temperature at a very low deformation frequency of 1~Hz. We compare the experimental DMA results (closed diamonds) with atomistic NALD calculations (close triangles), which show a reasonable agreement. We also fit the experimental data using the theoretical Zaccone-Terentjev expression for $G'$ vs $T$ (details in SI @supp) @ZET, which captures the sharp decay near the glass transition temperature $T_g = 390 med upright(K)$. We observed a slight decrease in the affine modulus $G_A$ near and above $T_g$ due to enhanced molecular mobility and reduced topological constraints.



#figure(image("source/fig3.pdf", width: 99.8%), placement: top,

  caption: [

    Low-frequency shear storage modulus $G'$ as a function of external deformation frequency $Omega$ at temperature $T = 300$~K. The Solid line represents NALD calculations and symbols represent MD and experimental results that include DMA study in this work and other experiments from previous studies @weishaupt1995pressure@Mikio_1995@afifi2003ultrasonic@afifi2003annealing@MOTT2008572@Sahraoui_1994@davies1963dynamic@moy_paul_2003@MULLIKEN20061331@christofl2021comprehensive.

  ]

)

<fig3>



In @fig3, we plot the shear modulus of PMMA as a function of the external frequency $Omega$ at $T = 300$~K, representing room temperature conditions. The results of the NALD atomistic calculation is compared with MD results, our experimental DMA data as well as literature reported from different mechanical testing techniques, across a broad frequency range. Four distinct frequency regimes, which correspond to structural processes within PMMA, are observed and reliably captured by NALD. First, at the high-frequency end (Petahertz region), a plateau emerges corresponding to the affine modulus which is a purely elastic contribution determined by the instantaneous bonding polymer chain or network; the second regime is the resonance frequency region (THz), where two sharp peaks appear: the first is at $300$~ THz, and the second one is close to $600$~THz, due to the vibrational resonances of PMMA chemical bonds @ali_2015review\; the atomistic MD simulations accurately reproduce the resonance behavior. The third regime is the GHz regime, which coincides with experimental Brillouin spectroscopy results @weishaupt1995pressure. Here, non-affine deformations become apparent in the shear modulus i.e. the first decay after the resonance peak indicates that the molecules begin to relax @MULLERPABEL_2022_107701@joaquin_2025aging.



At kHz frequencies, we include Split-Hopkinson test data @MULLIKEN20061331@Sahraoui_1994@moy_paul_2003, noting that the strain rate used to define the testing speed is not directly equivalent to a frequency; however, the stress wave generated during testing typically lies in the kHz range. Some experimental data agree well with NALD predictions, whereas others overestimate/underestimate the modulus. Since Split-Hopkinson pressure bars are custom-built and testing conditions vary, such deviations are not unexpected. At lower frequencies, available techniques are limited to contact-based methods, each with its own limitations, leading to additional scatter. Literature shows that, even for a well-studied glassy polymer such as PMMA, an exact modulus is not possible to obtain from classical tests alone @christofl2021comprehensive. Measurements spanning nano- to macroscales demonstrate that local material variations and experimental constraints (e.g., deformation mode, sample preparation) only allow one to define a range of values, with nanoscale AFM experiments typically yielding lower moduli @christofl2021comprehensive@ganser2018combining. In our experimental study, we use PMMA from the same manufacturer for DMA experiments in the low-frequency regime (0.1--100 Hz). The DMA results match the NALD estimates and reveal a secondary decay in the shear modulus associated with the $beta$-relaxation process @MULLIKEN20061331@moy_paul_2003@Sahraoui_1994.



To summarize, we provided the atomic-scale computation of the frequency-dependent shear modulus of a glassy polymer (PMMA) across a broad frequency spectrum, from several hundreds of terahertz down to millihertz. The computation scheme allows for multiscale bridging in time, thanks to the calculation of non-affine atomic displacements, which contribute substantial negative corrections to the modulus, as the deformation frequency is lowered. The calculations are successfully compared with MD simulations of the deformation process (limited to the terahertz regime), as well as with several sets of experimental data comprising both Brillouin light scattering (at GHz) and mechanical testing (from $10^5$ Hz down to millihertz). While a parameter-free quantitative match is possible, in order to capture the secondary $beta$ relaxation in the modulus that occurs at hundreds of Hertz, a power-law memory function for the atomic-scale friction kernel is required, in agreement with previous results in the literature @milster_2024tracer@li2017computing. Overall, the proposed NALD framework allows us to bridge the timescale gap between non-destructive light scattering techniques and conventional mechanical testing of real soft materials, and provides a theoretical, experimentally validated description of the mechanics of glassy polymers across 20 orders of magnitude in deformation frequency, with profound implications for both fundamental science and engineering applications. A future challenge will be to extend this atomistic framework to the vicinity of the glass transition @glova.



#emph[Acknowledgments-] AS, VV, and AZ gratefully acknowledge funding from the European Union through Horizon Europe ERC Grant number: 101043968 "Multimech". VV acknowledges the computational resource provided via the project "TPLAMECH" on INDACO platform at the HPC facility of Università degli Studi di Milano. AZ gratefully acknowledges funding from the US Army DEVCOM Army Research Office through contract nr. W911NF-22-2-0256. CC acknowledges the Hertha Firnberg program (project no. T 1314-N) of the Austrian Science Fund (FWF), Grant DOI: 10.55776/T1314 for funding. Discussions with Simone Napolitano and Federico Caporaletti are gratefully acknowledged.

#{
  set text(size: 8pt)
  set par(leading: 0.39em, spacing: 0.45em)
  bibliography("source/article.bib", title: none, style: "american-physics-society")
}
]
