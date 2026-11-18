#set page(paper:"a4",margin:23mm,numbering:"1")
#set text(font:"Libertinus Serif",size:10.5pt)
#set par(justify:true,leading:.6em)
#set heading(numbering:"1.1")
#set math.equation(numbering:"(1)")
#show figure.caption: set text(size:9pt)
#align(center)[
  #text(size:16pt,weight:"bold")[Thin-film magnomechanics in the low gigahertz regime]
  #v(.6em)
  Yu Jiang#super[1], Zixin Yan#super[1], Yizhong Huang#super[1], and Xufeng Zhang#super[1,2]
  #v(.5em)
  #super[1] Department of Electrical and Computer Engineering, Northeastern University, Boston, MA 02115, USA \
  #super[2] Department of Physics, Northeastern University, Boston, MA 02115, USA \
  Corresponding author #link("mailto:xu.zhang@northeastern.edu")
]

*Abstract.* The coherent interaction between magnons and phonons in the low-GHz regime represents an unexplored frontier in hybrid magnonics, critical for quantum information processing and microwave-to-acoustic transduction. While previous studies have focused on higher frequencies ($>$5~GHz), we demonstrate magnon--phonon coupling near 2~GHz using spoof surface plasmon polariton (SSPP) waveguides integrated with yttrium iron garnet (YIG) thin films of varying thicknesses. SSPP waveguides provide strong slow-wave enhancement, enabling efficient magnon readout in this challenging regime. Systematic measurements reveal the dependence of coupling strength on YIG thickness and phonon wavelength matching, achieving cooperativity $C = 1$ for a 3~$mu$m film at 2~GHz. Angle-dependent studies uncover coupling to both transverse and longitudinal phonon modes. Further investigation shows that thicker films exhibit rich multimode dynamics between high-order magnons and HBAR phonons. These results establish a robust low-GHz magnomechanical platform, opening pathways for multimode quantum transduction and hardware-efficient quantum technologies.

= Introduction
<introduction>
Hybrid magnonics has emerged as a versatile platform for exploring
coherent interactions between spin excitations and other information
carriers, offering a rich landscape for both theoretical and
experimental advancements
@Rameshti_PhysRep_2022@Harder_SSC_2018@Lachance_APE_2019@Bhoi_SSP_2020@YiLi_JAP_2020@Awschalom_IEEETransQuantEng_2021@Zhang2023Sep_MTE.
In these systems, magnons---quantized spin waves in magnetic
materials---can couple strongly with photons, phonons, and other
excitations, forming hybrid states such as magnon polaritons
@Huebl_PRL_2013@XufengZhang_PRL_2014@Tabuchi_PRL_2014@Goryachev_PRAppl_2014@LihuiBai_PRL_2015@JustinHou_PRL_2019@YiLi_PRL_2022@2024_PRL_Xu_slowwave
and magnon polarons
@XufengZhang_SciAdv_2016@Potts_PRX_2021@2021_PRAppl_Xu_pulseEcho@An_PRB_2020@Hwang_PRL_2024@Shen_PRL_2022@Li2021Jun_APLM@Hatanaka_PRAppl_2022@An_PRX_2022.
These hybrid modes inherit and combine the distinct properties of their
constituents, enabling novel functionalities such as nonreciprocal
signal transmission @XufengZhang_PRAppl_2020@YipuWang_PRL_2019 and
topological energy transport
@Lee2023TopologicalMagnonPhoton@HanFast2024PRApplied@Zhang2025TopologicalModeSwitch.
The use of low-damping magnetic materials such as yttrium iron garnet
(YIG) facilitates the realization of strong coupling conditions, where
coherent energy exchange surpasses dissipation, paving the way for
applications in quantum information processing
@Tabuchi_science_2015Jul@Lachance-Quirion_Science_2020Jan@Lachance-Quirion2017Jul_SciAdv@Bolski_PRL_2020@Xu_PRL_2023May,
transduction @Hisatomi_PRB_2016@NaZhu_Optica_2020@XufengZhang_PRL_2016,
and fundamental physics explorations such as dark matter detection
@Flower_PhysDarkUniv_2019@Crescini_PRL_2020.

Within hybrid magnonic systems, magnomechanics---where magnonic and
phononic modes are coherently coupled---stands out for its potential in
precision measurement and quantum thermodynamics
@XufengZhang_SciAdv_2016@Potts_PRAppl_2020@Potts_PRX_2021. Recent
studies have shown that YIG thin-film structures are particularly
advantageous for hybrid magnomechanical devices, as magnons in the YIG
film can interact with the high-overtone bulk acoustic resonator (HBAR)
formed by the YIG/GGG substrate
@2021_PRAppl_Xu_pulseEcho@An_PRB_2020@An2023Jul@An_PRX_2022. These
systems have demonstrated novel functionalities such as coherent pulse
echo @2021_PRAppl_Xu_pulseEcho, long-range transfer @An_PRB_2020, and
dark states @An_PRX_2022. However, most prior demonstrations focus on
frequencies above 5 GHz, where the electromagnetic (EM) wavelength is
relatively short, resulting in strong microwave photon--magnon coupling
and robust excitation and readout signals. In contrast, exploration of
magnon--phonon interactions in the low-GHz range---around 2--3 GHz, an
important band for quantum systems such as solid-state spin qubits
(e.g., nitrogen-vacancy centers in diamonds)---remains limited. At these
frequencies, the EM wavelength is much longer, creating a significant
volume mismatch between the magnonic and microwave photonic modes.
Consequently, the magnon--microwave photon coupling becomes much weaker
unless the YIG device footprint is substantially increased, which is
undesirable for integrated device development.

In this work, we investigate magnon--phonon interactions in the low-GHz
regime. By employing a corrugated microstrip waveguide that supports
spoof surface plasmon polaritons (SSPPs), we achieve efficient broadband
readout of magnon signals in YIG thin films at around 2 GHz through the
slow-wave enhancement @2024_PRL_Xu_slowwave. This enables systematic
exploration of magnomechanical coupling in this previously underexplored
frequency band. Strong magnon--phonon coupling is demonstrated using a
3~$mu$m YIG thin film, and the dependence of the coupling strength on
the bias magnetic field orientation is characterized. In addition to
transverse phonon modes, longitudinal phonons also emerge when the bias
field is tilted at specific angles. Furthermore, multimode strong
coupling between multiple phonon and magnon modes is observed, offering
opportunities for complex functionalities such as magnon frequency comb
generation and multimode magnomechanics based quantum machine learning.
Our results provide new insights into magnomechanics in the low-GHz
regime and highlight its potential for hybrid magnonic applications.

= Hybrid SSPP-magnon-phononic device
<hybrid-sspp-magnon-phononic-device>
The device used to investigate magnon--phonon interactions in the
low-GHz regime is illustrated in @fig1\(a). The magnonic resonator
consists of an YIG thin film grown on a 500 $mu$m gadolinium gallium
garnet (GGG) substrate. Three YIG film thicknesses ($d$) are used:
Device 1 (200 nm), Device 2 (3 $mu$m) and Device 3 (20 $mu$m). The YIG
thin film is biased using an external magnetic field from an
electromagnet. The magnonic chip is flip bonded on a spoof surface
plasmon polariton (SSPP) waveguide, with the YIG side attached to the
waveguide. The SSPP waveguide is a periodically corrugated microstrip,
which can drastically enhance the excitation and readout of the magnon
signals without sacrificing the bandwidth due to the slow wave nature of
the SSPPs. It is fabricated on a Rogers TMM10i printed circuit board
(PCB) with a dielectric constant of 9.8, a substrate thickness of 760
$mu$m, and a copper thickness of 35 $mu$m thickness. To minimize
reflection and interference, the SSPP waveguide is adiabatically tapered
on the two ends for better impedance matching with the input microstrip,
which is soldered with SMA connectors for transmission measurements.

#figure(image("source/figure_1.png"),
  caption: [
    \(a) Schematic of the magnon--phonon coupling platform, where a
    YIG/GGG chip is flip-bonded onto an SSPP waveguide. (b) Simulated
    dispersion relation of the SSPP waveguide. (c) Measured spatial
    distribution of the $z$-component of the SSPP mode magnetic field.
    (d) Measured transmission magnitude and phase of the low-GHz SSPP
    waveguide with a 3~$mu$m YIG thin-film device (thin black curves);
    thick black curves show the background signals without the YIG film.
    (e) Transmission spectrum of a reference microstrip waveguide with a
    3~$mu$m YIG thin film, exhibiting significantly weaker magnon
    resonances.
  ]
)
<fig1>

The theoretical dispersion curve of the fundamental SSPP mode for this
waveguide is plotted in @fig1\(b), which is simulated using finite
element method (FEM). The corrugation fingers were designed with a
length of 3 mm, leading to an asymptotic frequency of around 2.6 GHz.
@fig1\(c) plots the spatial distribution of the SSPP mode profile
near 2.6 GHz, which is measured by scanning an inductive antenna at the
waveguide surface in the region shown in the dashed box in
@fig1\(a). Strong mode confinement is observed near the bottom of
the fingers where the YIG chip is located, further enhancing the
SSPP--magnon coupling.

@fig1\(d) shows the measured transmission spectrum of our SSPP
waveguide with YIG Device~2, obtained using a vector network analyzer
(VNA) at a power of $- 20 med upright(d B m)$ to avoid nonlinear
effects. When the magnon mode is far detuned, the transmission spectrum
(dark blue and red curves) exhibits a clear cutoff near
$2.6 med upright(G H z)$, with a $30 med upright(d B)$ drop in
transmission and significant phase accumulation, in good agreement with
the simulated dispersion relation. When the magnon modes are tuned close
to the cutoff frequency, absorption dips with extinction ratios
exceeding $40 med upright(d B)$ are observed, enabled by the strong
enhancement due to the slow-wave nature of the SSPP mode. For
comparison, the same YIG device measured using a conventional microstrip
waveguide exhibits much weaker magnon resonances, with extinction ratios
of only $0.6 med upright(d B)$ \[@fig1\(e)\]. The enhanced coupling
between magnons and microwave photons (in the form of the SSPP mode)
enables further investigation of magnon--phonon coupling in the low-GHz
frequency range. As shown in the close-up view of @fig1\(d),
periodic oscillations with a period of $3.3 med upright(M H z)$ can be
clearly resolved on the magnon absorption dip, corresponding to
transverse HBAR phonon modes.

#figure(image("source/figure_2.png"),
  caption: [
    \(a), (d) Illustrations of the magnon--phonon coupling regimes in
    YIG/GGG devices with YIG thicknesses of 200~nm and 3~$mu$m,
    respectively. (b), (c) Measured transmission spectra for the 200~nm
    device using SSPP waveguides operating at 8~GHz and 2~GHz. (e), (f)
    Measured transmission spectra for the 3~$mu$m device under the same
    frequency conditions. The comparison highlights the strong
    dependence of magnon--phonon coupling on YIG thickness and operating
    frequency.
  ]
)
<fig2>

= YIG thickness comparison
<yig-thickness-comparison>
We systematically studied the magnon--phonon coupling across different
YIG film thicknesses ($d$) and frequency regimes, with the results
summarized in @fig2. We first measured the coupling on a 200-nm YIG
thin film (Device~1)---commonly used in previous high-frequency
magnomechanical studies---using our low-GHz SSPP waveguide. Our
calculation shows that the wavelength of transverse phonons in the
YIG/GGG device is approximately 438~nm at 8~GHz, which is comparable to
twice the YIG film thickness, as indicated in @fig2\(a). This
condition corresponds to near-optimal spatial overlap between phonon
modes and low-order magnon modes, favoring strong coupling. In contrast,
at 2~GHz the phonon wavelength is about 1750~nm which is much larger
than $2 d$, resulting in a significant mode-volume mismatch and
consequently much weaker magnon--phonon coupling.

These effects are evident in the measured transmission spectra at both
frequencies, shown as heatmaps in Figs.~@fig2\(b) and (c). When the bias
magnetic field is scanned around 4402~G, the magnon mode sweeps across a
10~MHz range near 8~GHz. Periodic features with a spacing of 3.3~MHz are
observed, indicating coupling to transverse phonon modes. This period
matches the calculated free spectral range (FSR) of HBAR phonons for the
given GGG substrate thickness (500~$mu$m). From these spectra, the
magnon--phonon coupling strength is extracted as 0.7~MHz. Although not
in the strong-coupling regime, this value corresponds to a cooperativity
of $C = 0.6$ when considering the dissipation rates of the magnon mode
($kappa_m = 2.0$~MHz) and phonon mode ($kappa_b = 0.4$~MHz), placing the
device in the coherent-coupling regime. By contrast, when the same
device is measured near 2~GHz, no clear magnon--phonon coupling features
are observed, consistent with the prediction above.

The situation changes dramatically for Device~2, which uses a
3~$mu$m-thick YIG film on the same SSPP waveguide \[@fig2\(d)\].
The increased thickness improves spatial overlap with phonon wavelengths
near 2~GHz, enhancing magnon--phonon coupling in the low-GHz regime.
Conversely, at 8~GHz the phonon wavelength becomes much smaller than the
YIG thickness, leading to reduced coupling due to cancellation effects
within a phonon period. This behavior is confirmed by the measured
spectra: clear magnon--phonon coupling features appear near 2~GHz but
not at 8~GHz. The extracted coupling strength at 2~GHz is approximately
0.9~MHz, corresponding to a cooperativity of $C = 1.0$, both exceeding
the values obtained for Device~1 at 8~GHz. This improvement can be
attributed to the increased fill factor of the magnon mode (across the
YIG thickness) relative to the phonon mode (extending through the entire
YIG/GGG substrate) in the thicker YIG film.

#figure(image("source/figure_3.png"),
  caption: [
    \(a) Schematic of the angle-dependent characterization for the
    3~$mu$m YIG thin-film device, where the bias magnetic field $H$ is
    applied at an angle $theta$ relative to the $x$-axis. (b) Measured
    magnon--phonon coupling strength as a function of $theta$, showing a
    clear increasing trend with angle. (c) Two-dimensional transmission
    spectrum at $theta = 70^compose$, revealing multiple phonon modes.
    (d) Spectra corresponding to the two line cuts in (c), exhibiting
    longitudinal phonon modes (top panel: line cut I, with a uniform
    spacing of 6.2~MHz) and transverse phonon modes (bottom panel: line
    cut II, with a uniform spacing of 3.3~MHz), respectively.
  ]
)
<fig3>

= Angle dependence
<angle-dependence>
Depending on the direction of the bias magnetic field $H$, different
types of magnon modes are supported in the YIG thin film
\[@fig3\(a)\]. When the bias field is applied out of plane
($theta = 90^compose$), the magnons form forward volume magnetostatic
wave (FVMSW) modes. In contrast, for an in-plane bias field
($theta = 0^compose$) perpendicular to the SSPP waveguide propagation
direction, the magnon modes correspond to magnetostatic surface waves
(MSSWs). In our experiment, an automated rotational stage continuously
rotates the bias magnetic field in the $y$--$z$ plane, enabling
measurements of phonon--magnon interactions under different bias
conditions.

As shown in #cite(<2021_PRAppl_Xu_pulseEcho>, form: "prose"), transverse
phonons dominate the hybridization dynamics with FVMSW magnons, a result
attributed to the specific orientations and spatial distributions of the
magnonic and phononic modes. As the bias field direction changes, the
device deviates from the optimal coupling condition, reducing the
coupling strength. This trend is confirmed by the measured coupling
strength as a function of bias angle \[@fig3\(b)\], obtained from a
3~$mu$m YIG thin film coupled to an SSPP waveguide operating near
2.52~GHz. For example, the extracted magnon--phonon coupling strengths
at $theta = 0^compose \, 30^compose \, 60^compose \,$ and $90^compose$
are approximately 0.4, 0.6, 0.68, and 0.95~MHz, respectively, clearly
revealing the angle dependence.

Our measurements at different bias angles also reveal distinct phonon
modes. In the YIG/GGG device, both transverse and longitudinal HBAR
phonons exist. When the YIG film is magnetized normal to the plane,
longitudinal phonons are absent in the magnon spectrum because their
interaction with FVMSW magnons is nearly suppressed. However, as the
bias field is tilted, the magnon modes are no longer purely FVMSWs, and
coupling to longitudinal phonons becomes evident. This effect is
illustrated in @fig3\(c), measured at $theta = 70^compose$, where
two sets of phonon modes appear as evenly spaced resonances. The spectra
at the two line cuts (I and II) indicated by dashed lines are shown in
@fig3\(d), clearly displaying the periodic distribution of the two
phonon families. These two sets exhibit different free spectral ranges
(FSRs): one with a period of 6.2~MHz and the other 3.3~MHz, consistent
with the calculated FSRs for longitudinal and transverse modes,
respectively.

= Multimodes Strong Coupling
<multimodes-strong-coupling>
One prominent feature observed in the low-GHz magnomechanical device is
the multimode magnon--phonon coupling. As discussed above, achieving
reasonable magnon--phonon coupling in this frequency range requires
thicker YIG films, which naturally host numerous high-order magnon modes
in the form of standing waves along both the thickness and lateral
directions. Consequently, the low-GHz magnomechanical device exhibits
rich multimode dynamics between these high-order magnon modes and the
HBAR phonons.

The measured transmission spectrum for a 20~$mu$m YIG film (Device~3) is
shown in @fig4\(a), revealing a series of magnon modes forming a
mesh-like pattern with clear anticrossings at each mode intersection.
The dotted lines in the close-up view \[@fig4\(b)\] represent
theoretically calculated hybrid-mode frequencies, which agree well with
the experimental results. From these calculations, the magnon--phonon
coupling strength in Device~3 is extracted to be approximately 0.6~MHz.
Notably, unlike the nearly evenly spaced HBAR phonon modes, the magnon
modes exhibit nonuniform frequency spacing due to their strong
dispersion.

Such coherent coupling between multiple high-order magnon modes and HBAR
phonons enables information exchange in a high-dimensional state space,
significantly enriching the functionality of hybrid magnonic systems.
Multimode interactions provide access to complex interference effects,
mode-selective dynamics, and enhanced control over energy flow, which
are not achievable in single-mode systems. This opens opportunities for
implementing advanced protocols such as parallel information processing,
frequency-multiplexed transduction, and entanglement generation across
multiple modes.

In particular, when combined with dynamic control techniques such as
Floquet driving
@Xu2020FloquetCavityElectromagnonics@Pishehvar2025OnDemandDarkMode@Pishehvar2025ResonanceEnhancedFloquet,
selective and on-demand coupling between individual modes becomes
feasible. Floquet engineering can modulate the effective interaction
landscape, enabling programmable connectivity among magnon and phonon
modes. Such capabilities are highly desirable for hardware-efficient
quantum information processing, where multimode architectures can reduce
resource overhead and support scalable implementations of quantum
networks and quantum memories. Beyond quantum applications, these
multimode hybrid systems also offer a promising platform for studying
collective phenomena, non-Hermitian physics, and topological effects in
strongly coupled bosonic systems.

#figure(image("source/figure_4.png"),
  caption: [
    \(a) Two-dimensional heatmap of the measured transmission spectrum
    from a 2.6~GHz SSPP waveguide with a 20~$mu$m YIG film. (b) Close-up
    view of the dashed region in (a), with dotted lines indicating
    theoretically calculated hybrid-mode frequencies.
  ]
)
<fig4>

= Conclusion
<conclusion>
In this work, we experimentally investigate strong magnon--phonon
coupling in YIG thin films within the low-GHz regime---a frequency range
of significant practical interest but has only received limited prior
attention in the study of magnomechanics. By employing slow-wave
waveguides SSPPs, we achieve substantial enhancement of
magnon--microwave photon coupling near 2~GHz, enabling systematic
exploration of thin-film magnomechanical interactions in this domain.
Our measurements reveal the dependence of coupling strength on YIG
thickness and magnetization orientation, uncovering interactions between
magnons and both transverse and longitudinal phonon modes. Furthermore,
we observe multimode coupling between higher-order magnon modes and HBAR
phonons in thicker films, opening avenues for complex mode-selective
dynamics. Collectively, these results establish a versatile platform for
low-GHz magnomechanical devices and underscore their potential for
coherent microwave-to-acoustic transduction, multimode quantum
processing, and hardware-efficient hybrid quantum systems.

#block[
Y.J., Z.Y. and X.Z. acknowledge support from NSF (2337713).

]
#heading(level: 1, numbering: none)[AUTHOR DECLARATIONS]
<author-declarations>
#strong[Conflict of Interest]

The authors have no conflicts to disclose. \
#strong[DATA AVAILABILITY]

The data that support the findings of this study are available from the
corresponding author upon reasonable request.

#let references = ```bib
@article{An_PRX_2022,
  title = {Bright and Dark States of Two Distant Macrospins Strongly Coupled by Phonons},
  author = {An, K. and Kohno, R. and Litvinenko, A. N. and Seeger, R. L. and Naletov, V. V. and Vila, L. and de Loubens, G. and Ben Youssef, J. and Vukadinovic, N. and Bauer, G. E. W. and Slavin, A. N. and Tiberkevich, V. S. and Klein, O.},
  journal = {Phys. Rev. X},
  volume = {12},
  issue = {1},
  pages = {011060},
  numpages = {11},
  year = {2022},
  month = {Mar},
  publisher = {American Physical Society},
  doi = {10.1103/PhysRevX.12.011060},
  url = {https://link.aps.org/doi/10.1103/PhysRevX.12.011060}
}

@article{An_PRB_2020,
  title = {Coherent long-range transfer of angular momentum between magnon Kittel modes by phonons},
  author = {An, K. and Litvinenko, A. N. and Kohno, R. and Fuad, A. A. and Naletov, V. V. and Vila, L. and Ebels, U. and de Loubens, G. and Hurdequint, H. and Beaulieu, N. and Ben Youssef, J. and Vukadinovic, N. and Bauer, G. E. W. and Slavin, A. N. and Tiberkevich, V. S. and Klein, O.},
  journal = {Phys. Rev. B},
  volume = {101},
  issue = {6},
  pages = {060407},
  numpages = {6},
  year = {2020},
  month = {Feb},
  publisher = {American Physical Society},
  doi = {10.1103/PhysRevB.101.060407},
  url = {https://link.aps.org/doi/10.1103/PhysRevB.101.060407}
}

@article{2021_PRAppl_Xu_pulseEcho,
  title = {Coherent Pulse Echo in Hybrid Magnonics with Multimode Phonons},
  author = {Xu, Jing and Zhong, Changchun and Zhou, Xianjing and Han, Xu and Jin, Dafei and Gray, Stephen K. and Jiang, Liang and Zhang, Xufeng},
  journal = {Phys. Rev. Appl.},
  volume = {16},
  issue = {2},
  pages = {024009},
  numpages = {8},
  year = {2021},
  month = {Aug},
  publisher = {American Physical Society},
  doi = {10.1103/PhysRevApplied.16.024009},
  url = {https://link.aps.org/doi/10.1103/PhysRevApplied.16.024009}
}

@article{2024_PRL_Xu_slowwave,
  title = {Slow-Wave Hybrid Magnonics},
  author = {Xu, Jing and Zhong, Changchun and Zhuang, Shihao and Qian, Chen and Jiang, Yu and Pishehvar, Amin and Han, Xu and Jin, Dafei and Jornet, Josep M. and Zhen, Bo and Hu, Jiamian and Jiang, Liang and Zhang, Xufeng},
  journal = {Phys. Rev. Lett.},
  volume = {132},
  issue = {11},
  pages = {116701},
  numpages = {7},
  year = {2024},
  month = {Mar},
  publisher = {American Physical Society},
  doi = {10.1103/PhysRevLett.132.116701},
  url = {https://link.aps.org/doi/10.1103/PhysRevLett.132.116701}
}

@article{An2023Jul,
	author = {An, K. and Kim, C. and Moon, K.-W. and Kohno, R. and Olivetti, G. and de Loubens, G. and Vukadinovic, N. and Ben Youssef, J. and Hwang, C. and Klein, O.},
	title = {{Optimizing the Magnon-Phonon Cooperativity in Planar Geometries}},
	journal = {Phys. Rev. Appl.},
	volume = {20},
	number = {1},
	pages = {014046},
	year = {2023},
	month = jul,
	issn = {2331-7019},
	publisher = {American Physical Society},
	doi = {10.1103/PhysRevApplied.20.014046}
}

@article{Harder_SSC_2018,
  title={Cavity Spintronics: an early review of recent progress in the study of magnon--photon level repulsion},
  author={Harder, Michael and Hu, Can-Ming},
  journal={Solid State Physics},
  volume={69},
  pages={47--121},
  year={2018},
  publisher={Elsevier}
}

@article{YiLi_JAP_2020,
  title={Hybrid magnonics: Physics, circuits, and applications for coherent information processing},
  author={Li, Yi and Zhang, Wei and Tyberkevych, Vasyl and Kwok, Wai-Kwong and Hoffmann, Axel and Novosad, Valentine},
  journal={Journal of Applied Physics},
  volume={128},
  number={13},
  pages={130902},
  year={2020},
  publisher={AIP Publishing LLC}
}

@article{Lachance_APE_2019,
  title={Hybrid quantum systems based on magnonics},
  author={Lachance-Quirion, Dany and Tabuchi, Yutaka and Gloppe, Arnaud and Usami, Koji and Nakamura, Yasunobu},
  journal={Applied Physics Express},
  volume={12},
  number={7},
  pages={070101},
  year={2019},
  publisher={IOP Publishing}
}

@article{Awschalom_IEEETransQuantEng_2021,
  title={Quantum Engineering With Hybrid Magnonic Systems and Materials},
  author={Awschalom, David D and Du, Chunhui Rita and He, Rui and Heremans, F Joseph and Hoffmann, Axel and Hou, Justin and Kurebayashi, Hidekazu and Li, Yi and Liu, Luqiao and Novosad, Valentine and others},
  journal={IEEE Transactions on Quantum Engineering},
  volume={2},
  pages={1--36},
  year={2021},
  publisher={IEEE}
}

@article{Rameshti_PhysRep_2022,
  title={Cavity magnonics},
  author={Rameshti, Babak Zare and Kusminskiy, Silvia Viola and Haigh, James A and Usami, Koji and Lachance-Quirion, Dany and Nakamura, Yasunobu and Hu, Can-Ming and Tang, Hong X and Bauer, Gerrit EW and Blanter, Yaroslav M},
  journal={Physics Reports},
  volume={979},
  pages={1--61},
  year={2022},
  publisher={Elsevier}
}

@incollection{Bhoi_SSP_2020,
  title={Roadmap for photon-magnon coupling and its applications},
  author={Bhoi, Biswanath and Kim, Sang-Koog},
  booktitle={Solid State Physics},
  volume={71},
  pages={39--71},
  year={2020},
  publisher={Elsevier}
}

@article{Huebl_PRL_2013,
  title = {High Cooperativity in Coupled Microwave Resonator Ferrimagnetic Insulator Hybrids},
  author = {Huebl, Hans and Zollitsch, Christoph W. and Lotze, Johannes and Hocke, Fredrik and Greifenstein, Moritz and Marx, Achim and Gross, Rudolf and Goennenwein, Sebastian T. B.},
  journal = {Phys. Rev. Lett.},
  volume = {111},
  issue = {12},
  pages = {127003},
  numpages = {5},
  year = {2013},
  month = {Sep},
  publisher = {American Physical Society},
  doi = {10.1103/PhysRevLett.111.127003},
  url = {https://link.aps.org/doi/10.1103/PhysRevLett.111.127003}
}

@article{XufengZhang_PRL_2014,
  title = {Strongly Coupled Magnons and Cavity Microwave Photons},
  author = {Zhang, Xufeng and Zou, Chang-Ling and Jiang, Liang and Tang, Hong X.},
  journal = {Phys. Rev. Lett.},
  volume = {113},
  issue = {15},
  pages = {156401},
  numpages = {5},
  year = {2014},
  month = {Oct},
  publisher = {American Physical Society},
  doi = {10.1103/PhysRevLett.113.156401},
  url = {https://link.aps.org/doi/10.1103/PhysRevLett.113.156401}
}

@article{Tabuchi_PRL_2014,
  title = {Hybridizing Ferromagnetic Magnons and Microwave Photons in the Quantum Limit},
  author = {Tabuchi, Yutaka and Ishino, Seiichiro and Ishikawa, Toyofumi and Yamazaki, Rekishu and Usami, Koji and Nakamura, Yasunobu},
  journal = {Phys. Rev. Lett.},
  volume = {113},
  issue = {8},
  pages = {083603},
  numpages = {5},
  year = {2014},
  month = {Aug},
  publisher = {American Physical Society},
  doi = {10.1103/PhysRevLett.113.083603},
  url = {https://link.aps.org/doi/10.1103/PhysRevLett.113.083603}
}

@article{Goryachev_PRAppl_2014,
  title = {High-Cooperativity Cavity QED with Magnons at Microwave Frequencies},
  author = {Goryachev, Maxim and Farr, Warrick G. and Creedon, Daniel L. and Fan, Yaohui and Kostylev, Mikhail and Tobar, Michael E.},
  journal = {Phys. Rev. Appl.},
  volume = {2},
  issue = {5},
  pages = {054002},
  numpages = {11},
  year = {2014},
  month = {Nov},
  publisher = {American Physical Society},
  doi = {10.1103/PhysRevApplied.2.054002},
  url = {https://link.aps.org/doi/10.1103/PhysRevApplied.2.054002}
}

@article{LihuiBai_PRL_2015,
  title = {Spin Pumping in Electrodynamically Coupled Magnon-Photon Systems},
  author = {Bai, Lihui and Harder, M. and Chen, Y. P. and Fan, X. and Xiao, J. Q. and Hu, C.-M.},
  journal = {Phys. Rev. Lett.},
  volume = {114},
  issue = {22},
  pages = {227201},
  numpages = {5},
  year = {2015},
  month = {Jun},
  publisher = {American Physical Society},
  doi = {10.1103/PhysRevLett.114.227201},
  url = {https://link.aps.org/doi/10.1103/PhysRevLett.114.227201}
}

@article{XufengZhang_PRAppl_2020,
  title = {Broadband Nonreciprocity Enabled by Strong Coupling of Magnons and Microwave Photons},
  author = {Zhang, Xufeng and Galda, Alexey and Han, Xu and Jin, Dafei and Vinokur, V. M.},
  journal = {Phys. Rev. Appl.},
  volume = {13},
  issue = {4},
  pages = {044039},
  numpages = {12},
  year = {2020},
  month = {Apr},
  publisher = {American Physical Society},
  doi = {10.1103/PhysRevApplied.13.044039},
  url = {https://link.aps.org/doi/10.1103/PhysRevApplied.13.044039}
}

@article{YipuWang_PRL_2019,
	author = {Wang, Yi-Pu and Rao, J. W. and Yang, Y. and Xu, Peng-Chao and Gui, Y. S. and Yao, B. M. and You, J. Q. and Hu, C.-M.},
	title = {{Nonreciprocity and Unidirectional Invisibility in Cavity Magnonics}},
	journal = {Phys. Rev. Lett.},
	volume = {123},
	number = {12},
	pages = {127202},
	year = {2019},
	month = sep,
	issn = {1079-7114},
	publisher = {American Physical Society},
	doi = {10.1103/PhysRevLett.123.127202}
}

@article{Hisatomi_PRB_2016,
  title={Bidirectional conversion between microwave and light via ferromagnetic magnons},
  author={Hisatomi, Ryusuke and Osada, Alto and Tabuchi, Yutaka and Ishikawa, Toyofumi and Noguchi, Atsushi and Yamazaki, Rekishu and Usami, Koji and Nakamura, Yasunobu},
  journal={Physical Review B},
  volume={93},
  number={17},
  pages={174427},
  year={2016},
  publisher={APS}
}

@article{NaZhu_Optica_2020,
  title={Waveguide cavity optomagnonics for microwave-to-optics conversion},
  author={Zhu, Na and Zhang, Xufeng and Han, Xu and Zou, Chang-Ling and Zhong, Changchun and Wang, Chiao-Hsuan and Jiang, Liang and Tang, Hong X},
  journal={Optica},
  volume={7},
  number={10},
  pages={1291--1297},
  year={2020},
  publisher={Optical Society of America}
}

@article{Crescini_PRL_2020,
  title = {Axion Search with a Quantum-Limited Ferromagnetic Haloscope},
  author = {Crescini, N. and Alesini, D. and Braggio, C. and Carugno, G. and D'Agostino, D. and Di Gioacchino, D. and Falferi, P. and Gambardella, U. and Gatti, C. and Iannone, G. and Ligi, C. and Lombardi, A. and Ortolan, A. and Pengo, R. and Ruoso, G. and Taffarello, L.},
  collaboration = {QUAX Collaboration},
  journal = {Phys. Rev. Lett.},
  volume = {124},
  issue = {17},
  pages = {171801},
  numpages = {7},
  year = {2020},
  month = {May},
  publisher = {American Physical Society},
  doi = {10.1103/PhysRevLett.124.171801},
  url = {https://link.aps.org/doi/10.1103/PhysRevLett.124.171801}
}

@article{Flower_PhysDarkUniv_2019,
  title={Broadening frequency range of a ferromagnetic axion haloscope with strongly coupled cavity--magnon polaritons},
  author={Flower, Graeme and Bourhill, Jeremy and Goryachev, Maxim and Tobar, Michael E},
  journal={Physics of the Dark Universe},
  volume={25},
  pages={100306},
  year={2019},
  publisher={Elsevier}
}

@article{YiLi_PRL_2022,
  title = {Coherent Coupling of Two Remote Magnonic Resonators Mediated by Superconducting Circuits},
  author = {Li, Yi and Yefremenko, Volodymyr G. and Lisovenko, Marharyta and Trevillian, Cody and Polakovic, Tomas and Cecil, Thomas W. and Barry, Peter S. and Pearson, John and Divan, Ralu and Tyberkevych, Vasyl and Chang, Clarence L. and Welp, Ulrich and Kwok, Wai-Kwong and Novosad, Valentine},
  journal = {Phys. Rev. Lett.},
  volume = {128},
  issue = {4},
  pages = {047701},
  numpages = {6},
  year = {2022},
  month = {Jan},
  publisher = {American Physical Society},
  doi = {10.1103/PhysRevLett.128.047701},
  url = {https://link.aps.org/doi/10.1103/PhysRevLett.128.047701}
}

@article{XufengZhang_SciAdv_2016,
author = {Xufeng Zhang  and Chang-Ling Zou  and Liang Jiang  and Hong X. Tang },
title = {Cavity magnomechanics},
journal = {Science Advances},
volume = {2},
number = {3},
pages = {e1501286},
year = {2016},
doi = {10.1126/sciadv.1501286},
URL = {https://www.science.org/doi/abs/10.1126/sciadv.1501286},
}

@article{XufengZhang_PRL_2016,
  title = {Optomagnonic Whispering Gallery Microresonators},
  author = {Zhang, Xufeng and Zhu, Na and Zou, Chang-Ling and Tang, Hong X.},
  journal = {Phys. Rev. Lett.},
  volume = {117},
  issue = {12},
  pages = {123605},
  numpages = {5},
  year = {2016},
  month = {Sep},
  publisher = {American Physical Society},
  doi = {10.1103/PhysRevLett.117.123605},
  url = {https://link.aps.org/doi/10.1103/PhysRevLett.117.123605}
}

@article{Lachance-Quirion_Science_2020Jan,
	author = {Lachance-Quirion, Dany and Wolski, Samuel Piotr and Tabuchi, Yutaka and Kono, Shingo and Usami, Koji and Nakamura, Yasunobu},
	title = {{Entanglement-based single-shot detection of a single magnon with a superconducting qubit}},
	journal = {Science},
	volume = {367},
	number = {6476},
	pages = {425--428},
	year = {2020},
	month = jan,
	issn = {0036-8075},
	publisher = {American Association for the Advancement of Science},
	doi = {10.1126/science.aaz9236}
}

@article{Tabuchi_science_2015Jul,
	author = {Tabuchi, Yutaka and Ishino, Seiichiro and Noguchi, Atsushi and Ishikawa, Toyofumi and Yamazaki, Rekishu and Usami, Koji and Nakamura, Yasunobu},
	title = {{Coherent coupling between a ferromagnetic magnon and a superconducting qubit}},
	journal = {Science},
	volume = {349},
	number = {6246},
	pages = {405--408},
	year = {2015},
	month = jul,
	issn = {0036-8075},
	publisher = {American Association for the Advancement of Science},
	doi = {10.1126/science.aaa3693}
}

@article{Xu_PRL_2023May,
	author = {Xu, Da and Gu, Xu-Ke and Li, He-Kang and Weng, Yuan-Chao and Wang, Yi-Pu and Li, Jie and Wang, H. and Zhu, Shi-Yao and You, J. Q.},
	title = {{Quantum Control of a Single Magnon in a Macroscopic Spin System}},
	journal = {Phys. Rev. Lett.},
	volume = {130},
	number = {19},
	pages = {193603},
	year = {2023},
	month = may,
	issn = {1079-7114},
	publisher = {American Physical Society},
	doi = {10.1103/PhysRevLett.130.193603}
}

@article{Lachance-Quirion2017Jul_SciAdv,
	author = {Lachance-Quirion, Dany and Tabuchi, Yutaka and Ishino, Seiichiro and Noguchi, Atsushi and Ishikawa, Toyofumi and Yamazaki, Rekishu and Nakamura, Yasunobu},
	title = {{Resolving quanta of collective spin excitations in a millimeter-sized ferromagnet}},
	journal = {Sci. Adv.},
	volume = {3},
	number = {7},
	year = {2017},
	month = jul,
	issn = {2375-2548},
	publisher = {American Association for the Advancement of Science},
	doi = {10.1126/sciadv.1603150}
}

@article{Bolski_PRL_2020,
  title = {Dissipation-Based Quantum Sensing of Magnons with a Superconducting Qubit},
  author = {Wolski, S. P. and Lachance-Quirion, D. and Tabuchi, Y. and Kono, S. and Noguchi, A. and Usami, K. and Nakamura, Y.},
  journal = {Phys. Rev. Lett.},
  volume = {125},
  issue = {11},
  pages = {117701},
  numpages = {6},
  year = {2020},
  month = {Sep},
  publisher = {American Physical Society},
  doi = {10.1103/PhysRevLett.125.117701},
  url = {https://link.aps.org/doi/10.1103/PhysRevLett.125.117701}
}

@article{Potts_PRX_2021,
  title = {Dynamical Backaction Magnomechanics},
  author = {Potts, C. A. and Varga, E. and Bittencourt, V. A. S. V. and Kusminskiy, S. Viola and Davis, J. P.},
  journal = {Phys. Rev. X},
  volume = {11},
  issue = {3},
  pages = {031053},
  numpages = {15},
  year = {2021},
  month = {Sep},
  publisher = {American Physical Society},
  doi = {10.1103/PhysRevX.11.031053},
  url = {https://link.aps.org/doi/10.1103/PhysRevX.11.031053}
}

@article{Hwang_PRL_2024,
  title = {Strongly Coupled Spin Waves and Surface Acoustic Waves at Room Temperature},
  author = {Hwang, Yunyoung and Puebla, Jorge and Kondou, Kouta and Gonzalez-Ballestero, Carlos and Isshiki, Hironari and Mu\~noz, Carlos S\'anchez and Liao, Liyang and Chen, Fa and Luo, Wei and Maekawa, Sadamichi and Otani, Yoshichika},
  journal = {Phys. Rev. Lett.},
  volume = {132},
  issue = {5},
  pages = {056704},
  numpages = {7},
  year = {2024},
  month = {Jan},
  publisher = {American Physical Society},
  doi = {10.1103/PhysRevLett.132.056704},
  url = {https://link.aps.org/doi/10.1103/PhysRevLett.132.056704}
}

@article{Shen_PRL_2022,
  title = {Coherent Coupling between Phonons, Magnons, and Photons},
  author = {Shen, Zhen and Xu, Guan-Ting and Zhang, Mai and Zhang, Yan-Lei and Wang, Yu and Chai, Cheng-Zhe and Zou, Chang-Ling and Guo, Guang-Can and Dong, Chun-Hua},
  journal = {Phys. Rev. Lett.},
  volume = {129},
  issue = {24},
  pages = {243601},
  numpages = {7},
  year = {2022},
  month = {Dec},
  publisher = {American Physical Society},
  doi = {10.1103/PhysRevLett.129.243601},
  url = {https://link.aps.org/doi/10.1103/PhysRevLett.129.243601}
}

@article{Li2021Jun_APLM,
	author = {Li, Yi and Zhao, Chenbo and Zhang, Wei and Hoffmann, Axel and Novosad, Valentyn},
	title = {{Advances in coherent coupling between magnons and acoustic phonons}},
	journal = {APL Mater.},
	volume = {9},
	number = {6},
	year = {2021},
	month = jun,
	publisher = {AIP Publishing},
	doi = {10.1063/5.0047054}
}

@article{Hatanaka_PRAppl_2022,
  title = {On-Chip Coherent Transduction between Magnons and Acoustic Phonons in Cavity Magnomechanics},
  author = {Hatanaka, D. and Asano, M. and Okamoto, H. and Kunihashi, Y. and Sanada, H. and Yamaguchi, H.},
  journal = {Phys. Rev. Appl.},
  volume = {17},
  issue = {3},
  pages = {034024},
  numpages = {12},
  year = {2022},
  month = {Mar},
  publisher = {American Physical Society},
  doi = {10.1103/PhysRevApplied.17.034024},
  url = {https://link.aps.org/doi/10.1103/PhysRevApplied.17.034024}
}

@article{Potts_PRAppl_2020,
  title = {Magnon-Phonon Quantum Correlation Thermometry},
  author = {Potts, C.A. and Bittencourt, V.A.S.V. and Kusminskiy, S. Viola and Davis, J.P.},
  journal = {Phys. Rev. Appl.},
  volume = {13},
  issue = {6},
  pages = {064001},
  numpages = {13},
  year = {2020},
  month = {Jun},
  publisher = {American Physical Society},
  doi = {10.1103/PhysRevApplied.13.064001},
  url = {https://link.aps.org/doi/10.1103/PhysRevApplied.13.064001}
}

@article{Zhang2023Sep_MTE,
	author = {Zhang, Xufeng},
	title = {{A review of common materials for hybrid quantum magnonics}},
	journal = {Materials Today Electronics},
	volume = {5},
	pages = {100044},
	year = {2023},
	month = sep,
	issn = {2772-9494},
	publisher = {Elsevier},
	doi = {10.1016/j.mtelec.2023.100044}
}

@article{Xu2020FloquetCavityElectromagnonics,
  title   = {Floquet Cavity Electromagnonics},
  author  = {Xu, Jing and Zhong, Changchun and Han, Xu and Jin, Dafei and Jiang, Liang and Zhang, Xufeng},
  journal = {Phys. Rev. Lett.},
  volume  = {125},
  number  = {23},
  pages   = {237201},
  year    = {2020},
  month   = {Dec},
  publisher = {American Physical Society},
  doi     = {10.1103/PhysRevLett.125.237201},
  url     = {https://doi.org/10.1103/PhysRevLett.125.237201}
}

@article{Pishehvar2025OnDemandDarkMode,
  title   = {On-demand magnon resonance isolation in cavity magnonics},
  author  = {Pishehvar, Amin and Wang, Zhaoyou and Zhu, Yujie and Jiang, Yu and Yan, Zixin and Li, Fangxin and Jornet, Josep M. and Hu, Jia-Mian and Jiang, Liang and Zhang, Xufeng},
  journal = {Phys. Rev. Applied},
  volume  = {23},
  number  = {2},
  pages   = {024053},
  year    = {2025},
  month   = {Feb},
  publisher = {American Physical Society},
  doi     = {10.1103/PhysRevApplied.23.024053},
  url     = {https://doi.org/10.1103/PhysRevApplied.23.024053}
}

@article{Pishehvar2025ResonanceEnhancedFloquet,
  title   = {Resonance-Enhanced Floquet Cavity Electromagnonics},
  author  = {Pishehvar, Amin and Jiang, Yu and Yan, Zixin and Zhang, Xufeng},
  journal = {Phys. Rev. Applied},
  volume  = {24},
  number  = {1},
  pages   = {014026},
  year    = {2025},
  month   = {Jul},
  publisher = {American Physical Society},
  doi     = {10.1103/PhysRevApplied.24.014026},
  url     = {https://doi.org/10.1103/PhysRevApplied.24.014026}
}

@article{Zhang2025TopologicalModeSwitch,
  author    = {Haoran Zhang and Chao Wang and Qiwen Bao and Zhenzhen Liu and Haoliang Liu and Jun-Jun Xiao},
  title     = {Topological mode switch by exceptional point encircling in a cavity magnonic system},
  journal   = {Optics Letters},
  year      = {2025},
  volume    = {50},
  pages     = {4154--4157},
  doi       = {10.1364/OL.50.004154}
}

@article{Lee2023TopologicalMagnonPhoton,
  author    = {J. M. Lee and M. J. Hwang and H. W. Lee},
  title     = {Topological magnon-photon interaction for cavity magnonics},
  journal   = {Communications Physics},
  year      = {2023},
  volume    = {6},
  pages     = {194},
  doi       = {10.1038/s42005-023-01316-8},
  url       = {https://doi.org/10.1038/s42005-023-01316-8}
}

@article{HanFast2024PRApplied,
  title = {Fast and controllable topological excitation transfers in hybrid magnon-photon systems},
  author = {Han, Jin-Xuan and Wu, Jin-Lei and Yuan, Zhong-Hui and Chen, Yong-Jian and Xia, Yan and Jiang, Yong-Yuan and Song, Jie},
  journal = {Phys. Rev. Appl.},
  volume = {21},
  issue = {1},
  pages = {014057},
  numpages = {21},
  year = {2024},
  month = {Jan},
  publisher = {American Physical Society},
  doi = {10.1103/PhysRevApplied.21.014057},
  url = {https://link.aps.org/doi/10.1103/PhysRevApplied.21.014057}
}

@article{JustinHou_PRL_2019,
  title = {Strong Coupling between Microwave Photons and Nanomagnet Magnons},
  author = {Hou, Justin T. and Liu, Luqiao},
  journal = {Phys. Rev. Lett.},
  volume = {123},
  issue = {10},
  pages = {107702},
  numpages = {5},
  year = {2019},
  month = {Sep},
  publisher = {American Physical Society},
  doi = {10.1103/PhysRevLett.123.107702},
  url = {https://link.aps.org/doi/10.1103/PhysRevLett.123.107702}
}
```
#bibliography(bytes(references.text),style:"ieee")
