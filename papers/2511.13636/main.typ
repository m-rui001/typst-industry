#import "excitation-chain.typ": setup-figure

#set document(title: "Ultrafast propagation of magnon-polaritons")
#set page(paper: "a4", margin: (x: 24.7mm, top: 76pt, bottom: 126pt), columns: 2, numbering: "1")
#set text(font: "Libertinus Serif", size: 10pt, lang: "en")
#set par(justify: true, leading: .57em)
#set figure(supplement: [Fig.], placement: top, scope: "parent")
#set columns(gutter: 22pt)
#show figure.caption: set text(size: 9.5pt)

#place(top, scope: "parent", float: true, clearance: 1em, block(width: 100%)[
#v(42pt)
#align(center)[
  #text(size: 18pt, weight: "bold")[Ultrafast propagation of magnon-polaritons]
  #v(1.4em)
  Ondřej Wojewoda#super[1,2], Miela J. Gross#super[2], Jan Klíma#super[1], Jaganandha Panda#super[1], Jakub Krčma#super[1], Jakub Holobrádek#super[1], Kristýna Davídková#super[3], Andrii V. Chumak#super[3], Philipp Pirro#super[4], Roman Verba#super[5], Sebastian Wintz#super[6], Qi Wang#super[7], Caroline A. Ross#super[2], Michal Urbánek#super[1]
  #v(1.2em)
  #text(size: 11pt)[
  #super[1]CEITEC BUT, Brno University of Technology, Brno, Czech Republic
  #linebreak()
  #super[2]Department of Materials Science and Engineering, Massachusetts Institute of Technology, Cambridge, MA, USA
  #linebreak()
  #super[3]Faculty of Physics, University of Vienna, Vienna, Austria
  #linebreak()
  #super[4]Fachbereich Physik and Landesforschungszentrum OPTIMAS, Technische Universität Kaiserslautern, Kaiserslautern, Germany
  #linebreak()
  #super[5]Institute of Magnetism, Kyiv, Ukraine
  #linebreak()
  #super[6]Helmholtz-Zentrum-Berlin für Materialien und Energie, Berlin, Germany
  #linebreak()
  #super[7]School of Physics, Huazhong University of Science and Technology, Wuhan, China
  #linebreak()
    #link("mailto:ondrej.wojewoda@vutbr.cz")
  ]
]

#block(inset: (x: 1em))[
  #text(weight: "semibold")[Abstract]
  #par[The manipulation of magnetization lies at the heart of spintronic and magnonic technologies, with the ultimate performance of such systems limited by the velocity at which magnetic excitations can propagate. Here, we demonstrate ultrafast propagation of magnon-polaritons—hybrid quasiparticles arising from the coupling between spin waves and electromagnetic fields in thin pure, bismuth-, and gallium substituted yttrium iron garnet (YIG, Bi:YIG and Ga:YIG) films. Using time- and phase-resolved Brillouin light scattering microscopy and time-resolved scanning transmission microscopy, we show that magnon-polaritons can propagate faster than  100~km/s, nearly three orders of magnitude more than conventional spin waves, and can be observed at distances exceeding 40 µm in 20~nm thick films. Analytical modeling based on retarded Maxwell equations and Polder tensor formalism confirms the hybridized nature of the excitations and captures the nontrivial dispersion and attenuation profiles. Notably, the magnon-polaritons maintain high initial magnetization amplitudes and long decay lengths, enabling ultrafast manipulation of the magnetization far away from the excitation source. We show, that they can move domain walls or stabilize nonlinear magnetization processes. The unprecedentedly high propagation velocities make magnon-polaritons promising candidates for high-speed information transfer in future spin-based computing architectures, potentially overcoming long-standing group delay bottlenecks in magnonic logic circuits.]
  *Keywords:* Ultrafast, magnon, spin-wave, magnon-polariton
]
])

Magnetization can be used to store information as well as perform computations which make magnetic systems appealing candidates for novel beyond-von-Neumann computational schemes @baumgaertl2023reversal.

#pagebreak()
#figure(supplement: [Fig.], numbering: _ => "1", setup-figure,
  caption: [
    #strong[Schematic picture of the magnon-polariton excitation and detection]. Sketch of the experiment geometry. Excitation stripline is connected to the RF-generator and single frequency signal is put through. The magnon-polaritons are subsequently measured by µ-BLS with intensity, time, and phase resolution or time-resolved STXM. #strong[b, c] shows dispersion relation and group velocities of the magnetostatic spin waves, magnon-polaritons, and electromagnetic waves. The experimental estimation of the magnon-polariton group velocity, and wavevector range is marked as a violet rectangle.
  ]
) <fig1>

For efficient data storage, transfer and processing, the magnetization must be manipulated at the shortest possible timescale. Recent advances in ultrafast magnetization switching by femtosecond laser pulses show that information could be stored in a magnetic memory element within hundreds of femtoseconds @koopmans2005unifying @kimel2005ultrafast @kimel2019writing @bigot2009coherent. However, for data transfer and processing propagation of a magnetic excitation over a large distance is necessary. The magnetic excitation can propagate by spin currents @bader2010spintronics @hirohata2020review, spin torques @shibata2011brief @parkin2008magnetic @velez2019high @uchida2013chapter, or by coherently excited spin waves @pirro2021advances @chumak2015magnon. In all these cases the speed of the information transfer and processing time are limited by the maximum propagation speed of the magnetization dynamics - which is limited by the (relatively slow) magnon group velocity @caretta2020relativistic.

Group velocity of the magnetic excitation can be dramatically increased by hybridizing it with an electromagnetic wave, or in other words forming a magnon polariton @mills1974polaritons. This quasiparticle appears when an electromagnetic wave propagates inside a magnetic material with gyrotropic susceptibility @gurevich2010magnetization, where the magnetic excitation is driven by the magnetic field component of the electromagnetic wave. At the resonant frequency (ferromagnetic resonance frequency in case of a ferromagnet), the amplitude of the magnetic excitation increases, and its phase is locked to the $B$-component of the electromagnetic wave. Consequently, the imaginary part of the complex wavevector (i.e. absorption) increases and the group velocity of the wave decreases, to a point where propagation length becomes smaller than the wavelength and magnon-polaritons enter diffusive regime, see @fig1#h(0pt);(b),c.

Magnon polaritons have been studied in electromagnetic cavities, typically in yttrium-iron-garnet (YIG) spheres, which have low damping and are transparent to electromagnetic waves @leo2020identification @zarerameshti2022cavity @lambert2025Coherent @zhang2017Observation @lee2023nonlinear. The strong interactions between magnons and microwave photons can be exploited to design single magnon readouts and possible complex hybrid quantum-magnonic systems @lachancequirion2020entaglement @yuan2022quantum @li2020hybrid. Some studies have also been done in thin films and bulk materials @grishunin2018terahertz @kato2023functionalized. However, due to the nature of the microwave absorption experiments in the cavity, none of these studies could investigate propagating magnon polaritons.

Here, we present for the first time measurements of propagating magnon-polaritons in near-field using time-resolved Brillouin light scattering (BLS) microscopy and show that they propagate with velocity at least 3 orders of magnitude higher than the conventional magnons and can interact with them on ultra-short timescales and even manipulate spin textures. First, we theoretically study magnon-polaritons in bismuth-doped yttrium iron garnet (Bi:YIG) and then we use microfocused BLS to observe magnon-polaritons over distances of tens of micrometers with propagation velocities exceeding 100 km s$""^(- 1)$. The observed magnon-polaritons decay exponentially and can be detected as far as 40 µm away from the excitation source. The observation of magnon polaritons is not specific to a certain experimental technique or material. We confirmed their presence and high speeds also in Gallium doped Yttrium iron garnet (Ga:YIG) thin film, in time-resolved scanning transmission X-ray microscopy (STXM) experiment and indirectly in out-of-plane magnetized yttrium iron garnet (YIG) thin film. We have also observed them in metallic magnetic layers, but they decay very fast due to the high metallic conductivity (see Supplementary Note 1: Magnon-polaritons in metallic layers and @SI-NiFe).

Our first sample consists of Bi:YIG thin film with a high magneto-optical coupling @fan2023coherent @fakhrul2019magneto epitaxially grown on gadolinium scandium gallium garnet (GSGG), for more details see Methods section and @SI-Char. The magnetization is aligned in-plane perpendicularly to the direction of magnon-polariton propagation by applying an in-plane external magnetic field of 550 mT along the long axis of the 2-µm-wide microstrip excitation antenna (@fig1). To excite magnon-polaritons, we pump the antenna with 22 dBm radio-frequency (RF) signal. In the vicinity of the antenna, the amplitude of the driving magnetic field reaches approx. 15 mT. Such a high magnetic field drives the magnetization dynamics with tens of degrees precession and it thus enters the non-linear regime within distances up to 5 µm from the antenna @wang2023deeply. Beyond this distance, the spin waves enter the linear regime and decay within approx. 1 µm due to their low group velocity ($v_(upright(g)) approx 0.05$ km/s). Spin wave characteristics of our Bi:YIG film are presented in @S-Dispersion. However, when we probe the magnetization dynamics by micro-focused BLS @Sebastian2015 @wojewoda2024modeling at varying distance up to 40 µm away from the antenna, we observed not only the initial nonlinear spin wave dynamics, but also ultrafast propagation of magnetic excitations at the distances where the magneto-static spin waves already decayed. We attribute this observation to propagating magnon-polaritons.

#heading(level: 1, numbering: none)[Modeling magnon-polariton propagation and dispersion relation]
<sec1>
#figure(supplement: [Fig.], numbering: _ => "2", image("source/Fig2.pdf", width: 100.0%),
  caption: [
    #strong[Propagation, dispersion relation and group velocity of magnon-polaritons in Bi:YIG]. #strong[a, b] Spatial dependency of the magnetization amplitude #strong[\(a)] (see the increased amplitude at f=11.02 GHz = FMR frequency) and magnetization phase #strong[\(b)]. #strong[c], Real (black line) and imaginary (red line) part of the magnon-polariton dispersion relation compared with the dispersion of microwave photon (blue line). #strong[d], Group velocity of magnon-polaritons (black line) compared with the group velocity of microwave photons (blue line).
  ]
) <fig2>

To model propagating magnon-polaritons, we assume infinitely thin and long wire, where a microwave current is flowing with defined frequency. This current creates electric field pointing along the direction of the wire (#emph[y]-axis) and magnetic field pointing perpendicular to it (#emph[z]-axis), see sketch in Fig.~1. The electric and magnetic field components of the electromagnetic wave at distance $x$ from the wire and at time $t$ can be written as: 

#math.equation(block: true, numbering: _ => [(1)], $E_y \( x \, t \)  = i thin 4 thin omega mu_0 I H_0^(\( 2 \)) k_(upright(e f f)) thin x thin e^(- i omega t) \,$)
#math.equation(block: true, numbering: _ => [(2)], $H_z \( x \, t \)  = frac(I k_(upright(e f f)), 4 H_1^(\( 2 \))) thin k_(upright(e f f)) thin x thin e^(- i omega t) \,$)

 where $omega$ is the frequency of the excitation, $H_0^(\( 2 \))$ ($H_1^(\( 2 \))$) is the zeroth (first) order of the second-kind Hankel function, $I$ is a current flowing through the wire, and $k_(upright(e f f))$ is an effective wavenumber. However, such equations consider only propagation in vacuum, whereas in our case, a magnetic medium is present. To include the magnetic medium into the equation, we use Polder susceptibility tensor $hat(chi)$. This allows us to calculate the magnetization and effective wavevector inside the magnetic medium.



#math.equation(block: true, numbering: _ => [(3)], $vec(M_x, M_z)  = bold(hat(chi)) mat(delim: "[", 0; h_z) \,$)
#math.equation(block: true, numbering: _ => [(4)], $k_(upright(e f f))  = sqrt(thin upright(bold(k)) dot.op (hat(bold(1)) + hat(bold(chi))) thin epsilon.alt_0) \,$)

 where $bold(k)$ is a wavevector, see @fig1.

This model can be used to calculate dispersion relations including absorption, group velocity, or field intensities and magnetization at any distance from the excitation antenna. For more detailed discussion see Methods section.

We applied the model to the BiYIG thin film (for parameters see Methods section) at the frequencies below, at, and above ferromagnetic resonance (FMR), see @fig2#h(0pt);(a),b. Until the distance of approx. 7 mm from the excitation antenna magnetization does not acquire any phase (because the wavelength is much larger than the distance, $lambda > > x$) which means that the investigated magnon-polaritons are in the near-field regime. At the FMR frequency, we can observe strong enhancement of the magnetization precession (see @fig2#h(0pt);(a)). The situation is reversed once the propagation switches to the far-field regime (beyond 7 mm). At these distances at the FMR frequency the magnetization precession is strongly attenuated. For the frequencies further away from FMR the magnetization exhibits standard attenuation.

These properties are also visible in the dispersion relations, see @fig2#h(0pt);(c). In the vicinity of the FMR frequency the electromagnetic wave hybridizes with the magneto-static resonance. This causes a rapid increase in the imaginary part of the wavevector, which becomes higher than the real part and thus the propagation of magnon-polaritons has diffusive character. In contrast, in the region well above or below FMR, the real part of wavenumber is higher than the imaginary part and magnon-polaritons propagation can be characterized as ballistic. Outside of the FMR region, the interaction is weaker which results in the smaller magnetization amplitudes. Similarly, in the vicinity of the FMR frequency the group velocity $v_(upright(g)) = frac(upright(d) omega, upright(d) k)$ (@fig2#h(0pt);(d)) decreases from the speed of light in the material $c_(upright(m a t))$ to approx. $0.001 thin c_(upright(m a t))$. At this frequency range, magnon-polaritons propagate in diffusive regime and the concept of the group velocity is not well defined. However, group velocity can still give us an idea how fast can magnetization be controlled in this regime.

The increased amplitude of magnon-polaritons in the near field regime at the FMR frequency is relevant to many magnonics and spintronics phenomena. Even when they are propagating only as an evanescent wave, they can still transfer energy and drive excitations with coherent phase at large distances (when compared to other types of magnetic excitations). We show, in the @S-YIG-SwitchOff, that this can be leveraged for ultrafast switching-off of propagating spin waves in yttrium iron garnet (YIG) grown on gadolinium gallium garnet (GGG) or in @S-DWmotion we show in micromagnetic simulations, that magnon-polaritons can move domain walls almost immediately after the excitation @Breitbach2024nonlinear @fan2023coherent. Magnon-polaritons can also offer explanations for many observed phenomena such as a change in the sign of the inverse spin Hall effect by magnon-polaritons tens of micrometers away from the excitation antenna @sheng2025control, long-distance paramagnon propagation @knauer2025longrange, or aforementioned domain wall motion @fan2023coherent.

#figure(supplement: [Fig.], numbering: _ => "3", image("source/Fig3.pdf", width: 100.0%),
  caption: [
    #strong[Measurement of the magnon polaritons 40 µm away from antenna.] #strong[a], Sweep of the excitation frequency measured by micro-focused BLS 40 µm away from antenna. The detected frequency is calculated from the positions of the mirrors in tandem Fabry-Perot interferometer. The color scale is logarithmic. #strong[b] White circles represent BLS intensity after subtraction of the thermally excited spin waves. The red solid line shows results of the modeling with Polder susceptibility tensor and Hankel functions. Blue solid line with square points represents results from micromagnetic simulations in MuMax3. #strong[c], White circles represent extracted phase from phase-resolved µ-BLS in dependence to the external magnetic field. The red solid line shows a calculated phase from Polder susceptibility tensor and Hankel functions model. Blue solid line with square points represents extracted phase from micromagnetic simulations in MuMax3. #strong[d,] The magnetization excitation phase in dependence to the distance from the stripline. In all panels the experimental uncertainty is smaller than symbol size.
  ]
) <fig3>

#heading(level: 1, numbering: none)[Experimental observation of magnon-polariton resonance]
<sec2>
In this section we show BLS measurements of the magnon-polariton intensity in dependence on the excitation frequency and complement them with phase-resolved measurement at fixed frequency with varying magnetic field an distance from the excitation antenna. To probe propagating magnon-polaritons we positioned the BLS spot 40~µm away from the excitation antenna, swept the excitation frequency in the range from 5 to 20 GHz, and acquired the BLS signal (see @fig3#h(0pt);(a)). The maximum at which we were able to measure magnon-polariton signal was approx. 45~µm because at larger distances a sample inhomogeneity (local change of the FMR frequency, see @S-2DThermal) prevented further magnon-polariton propagation.

We observed thermally excited spin waves around 11 GHz, see horizontal band independent of the excitation frequency in @fig3#h(0pt);(a). Coherent excitation of magnon-polariton states is visible as diagonal signal in the same figure. The measured coherently excited signal starts at 5 GHz and its amplitude is linearly decreasing with increasing frequency, except for the region where it crosses the magnon band. The linear decrease in the detected signal is expected as the attenuation of the microwave components (cables, connectors, waveguides) is increasing with increasing frequency.

Moreover, for excitation frequencies below the FMR we observe an increase in the frequency of thermally excited spin waves at low excitation frequencies, see @fig3#h(0pt);(a) and @S-Riples. This might be connected to the high enough magnon-polariton amplitudes which invalidate linear approximation for thermal spin-waves and influence the magnetic properties of the system even 40 µm away from excitation antenna.

To be able to compare the experimental results with our magnon-polariton model we subtracted the thermal signal visible in @fig3#h(0pt);(a) and summed the coherently excited signal across all detected frequencies, see @fig3#h(0pt);(b). The analytical magnon-polariton model reproduces the measured data very well. We have also modeled the same situation using magnetostatic approach implemented in MuMax3 @Vansteenkiste2014design and we can see that in this scenario the retarded Maxwell equations and magnetostatic approximation give the same result.

In order to prove the resonant nature of the magnon-polaritons in the vicinity of FMR, we performed phase-resolved BLS at a fixed frequency of 11 GHz and swept the external magnetic field, see @fig3#h(0pt);(c). Again, the experimental data can be reproduced by both, full retarded Maxwell equation model and by micromagnetic simulations. We can observe that in the low fields, there is a negative phase shift, i.e. the detected phase lags behind the phase of excitation, at the resonance there is no phase shift, and for the fields above FMR there is a positive phase shift, i.e the detected phase precedes the phase of excitation. We also studied phase at fixed external field of 550 mT in dependence on the distance from the antenna. Near the excitation antenna, we can observe phase accumulation, while further away from the antenna the slope of the phase dramatically flattens out, which marks the transition into the magnon-polariton regime see @fig3#h(0pt);(d).

#figure(scope: "column", supplement: [Fig.], numbering: _ => "4", image("source/Fig4.pdf", width: 100.0%),
  caption: [
    #strong[Experimental investigation of magnon-polariton propagation regime]. #strong[a], Extracted time-of-arrivals from time-resolved BLS data measured on Bi:YIG. The symbol size represents the amplitude of the BLS peak in logarithmic scale. From the slope of the time-of-arrivals the group velocity can be estimated. The legend shows group velocities to corresponding slopes. #strong[b], Time of arrival for fixed frequency of 11 GHz, 15 μm away from the excitation antenna for different external magnetic fields. The squares show experimental data acquired by time-resolved BLS and red solid line shows calculated group velocity.#strong[c,] Spatially resolved STXM data measured on Ga:YIG at the start of excitation (gray dashed line) and 200 ps after the excitation (red solid line). The blue dashed line shows average over the whole interval for 0 ps while blue solid lines show averages for positive and negative parts for 200 ps.
  ]
) <fig4>

#heading(level: 1, numbering: none)[Experimental observation of ultrafast propagation of magnon-polaritons]
<sec3>
In this section we experimentally demonstrate that magnon-polaritons can propagate faster than 100 km s$""^(- 1)$, which is the upper limit of our experimental resolution. We show that the magnetization dynamics can be manipulated faster than the (relatively slow) magnon group velocity - a limitation which was believed could not be overcome @caretta2020relativistic. In order to study magnon-polariton propagation, we performed time-resolved BLS microscopy and STXM experiments. First, we evaluate time-of-arrivals from time-resolved BLS data, see @fig4#h(0pt);(a). For frequencies below and above the FMR, at the distances larger than 10 µm we can observe magnon-polaritons propagating at very high group velocities exceeding 100 km/s$""^(- 1)$. Such high group velocities are not even resolvable with standard time-resolved micro-focused BLS and we can only detect the lowest speed limit. In the vicinity of the antenna (0 -- 10 µm) at frequencies between 10.86 and 11.18 GHz (around FMR), we can observe that the excitation is acquiring a group delay, which might be attributed to the nonlinear spin wave dynamics. Further away from the antenna as the amplitude of the magnetization oscillations decays and the nonlinear phenomena vanish, we observe a clear increase of the group velocity beyond the measurable range (i.e. above 100 km s$""^(- 1)$). At lower excitation powers, the nonlinear region is restricted closer and closer to the antenna until it completely vanishes and only unmeasurable group velocities are visible, see @S-PowerDepen.

When we focus at the frequencies exactly at or very close to FMR, which in this experiment was between 11.02 and 11.18 GHz (see red, yellow and violet lines in @fig4#h(0pt);(a)), we can observe that the group velocity decreases (we can see nonzero slope at larger distances between 25 µm and 35 µm away from the antenna). Here, we are clearly in linear magnon-polariton regime. As predicted by our magnon-polariton model (@fig2#h(0pt);(d)) the group velocity at the FMR frequency is strongly reduced and it means that we were able to directly observe how the magnon-polaritons are slowing down.

To confirm the retardation effects, we measured time of arrival at fixed frequency of 11 GHz, at the distance 15 µm away from the antenna while sweeping the magnetic field, see @fig4#h(0pt);(b). We can clearly observe that the magnetic excitation acquire the highest time delay at the position of the FMR, as predicted by our magnon-polariton model. This type of experiment cannot be modeled by magnetostatic approximation implemented in Mumax3 solver as it does not include full Maxwell equations and it would predict instant times of arrival irrespectively of the excitation frequency.

The similar behavior was also observed with STXM on Ga:YIG sample. In this case, we can observe abrupt change in magnetization amplitude across the whole measured area within 200 ps after the excitation starts, see @fig4#h(0pt);(c) and @S-GaYIG-XMCD. In order to analyse the data, we calculated the average intensity across the interval \[-15, -5\] $union$ \[5, 15\] µm (blue dashed line) and individual intervals \[-15, -5\] µm and \[5, 15\] µm (blue solid lines). At this 200 ps it is visible, that both sides are offseted from equilibrium position by approx. 2 %. Considering distance of 15 µm and time of 200 ps we can estimate the lower bound for group velocity as 75 km s$""^(- 1)$.

#heading(level: 1, numbering: none)[Conclusion]
<sec4>
In conclusion we have demonstrated ultra-fast propagating magnon-polaritons in Bi:YIG thin film by time-resolved BLS and in Ga:YIG thin film by time-resolved STXM. Our experiments show that the limit imposed by the magnon group velocity can be surpassed in controlling magnetization dynamics. The magnon polaritons are observable over a distance more than 40 µm away from the excitation antenna and their velocities exceed 100 km s$""^(- 1)$ in the 20 nm thick layers. The experimental results are corroborated by analytical modeling based on retarded Maxwell equations. Due to the relatively high amplitude and long decay lengths of magnon-polaritons they can be utilized to manipulate magnetization at a very long distances as is evident from off-resonant manipulation of thermal spin-wave frequency. This can open a way to overcome low-group velocity bottleneck in the magnon-based computational concepts by i.e. enabled ultrafast switching-off of propagating spin waves or immediate manipulation of spin textures. Moreover, propagating magnon-polaritons can also explain recently observed effects and phenomena, such as spatially-dependent (and also frequency-dependent) change of the sign of the inverse spin Hall voltage in antiferromagnetic hematite or long-distance propagation of paramagnons.


= Supplementary information

The article is accompanied by supplementary information.

= Data availability

All data used to generate the presented figures are available in the Zenodo repository (DOI: #link("https://doi.org/10.5281/zenodo.17633095")[10.5281/zenodo.17633095]).

= Acknowledgments

This research was supported by the project No. CZ.02.01.01/00/22\_008/0004594 (TERAFIT) and under Horizon Europe – MSCA grant agreement No. 101211677, project FeriMag.

#heading(level: 1, numbering: none)[Methods]
<methods>
#heading(level: 2, numbering: none)[Characterization of the sample]
<characterization-of-the-sample>
The single crystal quality of the epitaxial film is confirmed with high resolution x-ray diffraction, see @SI-Char#h(0pt);(a), of the (444) substrate and film peak, labeled respectively. The sample thickness was measured by the x-ray reflectivity and fitted thickness is $21.7 plus.minus 0.5$ nm. The in-plane hysteresis loop was measured by vibrating sample magnetometry (VSM). The obtained moment was divided by sample volume which was estimated by measurement of the sample dimensions. The data was subsequently detrended in time and field and centered around the zero. Such treated data were fitted by three-line profile, where first and last line had fixed slope to zero. From this, the saturation magnetization was estimated as $M_s = 86 plus.minus 2 upright(k A m)^(- 1)$.

To estimate anisotropy and exchange constant we measured micro-focused BLS on thermally excited spin waves in varying in-plane external magnetic fields. The obtained data were fitted using semi-analytical macrospin model. The first step is to calculate the static magnetization angle by minimizing the total system energy, which is expressed as



#math.equation(block: true, numbering: _ => [(5)], $E_(upright("tot")) / V = E_(upright("ani")) / V + E_(upright("demag")) / V + E_(upright("Zeeman")) / V = - K_1 sin^2 \( Theta \)\
- mu_0 / 2 M_s^2 cos^2 \( Theta \) - B_(upright("ext")) M_s cos \( Theta \) .$)



The second step is to calculate the mode's frequency



#math.equation(block: true, numbering: _ => [(6)], $f^2 = (frac(gamma, 2 pi))^2 #scale(x: 300%, y: 300%)[\(] B_(upright("ext")) cos theta + (frac(2 K_1, M_s) - mu_0 M_s)\
cos^2 #h(-1em) (pi / 2 - theta) + frac(2 A_(upright("ex")), M_s) (n / d)^2 #scale(x: 300%, y: 300%)[\)]\
#scale(x: 300%, y: 300%)[\(] B_(upright("ext")) cos theta + (frac(2 K_1, M_s) - mu_0 M_s)\
cos #h(-1em) #scale(x: 120%, y: 120%)[\(] 2 \( pi / 2 - theta \) #scale(x: 120%, y: 120%)[\)] + frac(2 A_(upright("ex")), M_s) (n / d)^2 #scale(x: 300%, y: 300%)[\)] .$)



where $K_1$ is out-of-plane anisotropy, $M_s$ is saturation magnetization, $n$ stands for the number of nodes in out-of-plane direction (we fitted $n = 0$ and $n = 1$), $A_e x$ is exchange constant, $d$ is film thickness, $gamma$ is gyromagnetic ratio. The fit yields $K_1 = 16780 plus.minus 60 upright(J) thin upright(m)^(- 3)$ (caused by the lattice mismatch between Bi:YIG and GSGG) and $A_(e x) = 2.847 plus.minus 0.003 thin upright(p J) thin upright(m)^(- 1)$.

#heading(level: 2, numbering: none)[Modeling of propagation of magnon-polaritons]
<modeling-of-propagation-of-magnon-polaritons>
In our approach to model the propagation of mangon-polaritons in real space and with frequency dependency we will calculate propagation of electromagnetic wave from infinitely narrow and long conducting wire aligned in the #emph[y]-direction. This will lead to the Hankel functions. In order to take into the account magnetic medium, we will utilize Polder susceptibility tensor modified for the thin magnetic film magnetized with out-of-plane anisotropy magnetized in-plane by the external magnetic field. First, we will derive this tensor.

#heading(level: 3, numbering: none)[Polder susceptibility tensor]
<polder-susceptibility-tensor>
As stated in the main text in order to model magnon-polariton propagation we calculated dynamic susceptibility in our system with excitation RF field in out-of-plane direction (z-axis, see Fig.~1 in main text). This assumption holds for distances further from the antenna where there are no in-plane field components. We will start with the Landau-Lifschitz-Gilber equation



#math.equation(block: true, numbering: _ => [(7)], $frac(d upright(bold(M)), d t) = - gamma thin upright(bold(M)) times upright(bold(H))_(upright("eff")) + alpha thin upright(bold(M)) times frac(d upright(bold(M)), d t) .$)



where letters $upright(bold(i \, j \, k))$ denotes the unit vectors in the directions of x, y, z axes, respectively. The field $h_(upright(e x c))$ is produced by the excitation antenna and its amplitude is small which allows for the linearization of the equation and finding the relationship between magnetization and excitation field as follows



#math.equation(block: true, numbering: _ => [(8)], $vec(M_x, M_z) = hat(chi) thin mat(delim: "(", chi_(x x), - chi_(z x); chi_(z x), chi_(z z)) vec(0, h_z) .$)



where $chi$ is a dynamic susceptibility. The tensor components are given by



#math.equation(block: true, numbering: _ => [(9)], $chi_(x x)  = frac((i alpha omega + omega_(upright(e f f)) + omega_H) thin omega_M, (omega_(upright(F M R))^2 - omega^2) + i alpha omega (omega_(upright(e f f)) + 2 omega_H)) \,$)
#math.equation(block: true, numbering: _ => [(10)], $chi_(z x)  = frac(i omega thin omega_M, (omega_(upright(F M R))^2 - omega^2) + i alpha omega (omega_(upright(e f f)) + 2 omega_H)) \,$)
#math.equation(block: true, numbering: _ => [(11)], $chi_(z z)  = frac((i alpha omega + omega_H) thin omega_M, (omega_(upright(F M R))^2 - omega^2) + i alpha omega (omega_(upright(e f f)) + 2 omega_H)) .$)



where $omega$ is a excitation frequency, $omega_H = gamma mu_0 H_(upright(e x t))$, $omega_M = gamma mu_0 M_s$, $omega_(upright(e f f)) = gamma mu_0 \( M_s - K_1 \/ \( mu_0 M_s \) \)$, and $omega_(upright(F M R))^2 = omega_H \( omega_H + omega_(upright(e f f)) \)$. The permeability can be then calculated as $mu = mu_0 \( 1 + upright(bold(hat(chi))) \)$ and is shown for the studied system in Supplemental @SI-Perm.

#heading(level: 3, numbering: none)[Propagation of electro-magnetic wave in magnetic (gyrotropic) medium]
<propagation-of-electro-magnetic-wave-in-magnetic-gyrotropic-medium>
Now, in our geometry with the wire aligned with y axis we can start with the simplified Helmholtz equation @balanis1989[p.~575]



#math.equation(block: true, numbering: _ => [(12)], $(nabla^2 + k^2) A_y \( x \) = - mu_0 I thin delta \( x \) \,$)

 where where $A_y$ is a magnetic vector potential, $I$ is a current flowing through the wire. The solution inside the magnetic thin film is given by



#math.equation(block: true, numbering: _ => [(13)], $A_y \( x \) = frac(mu_0 I, 4) thin H_0^(\( 2 \)) #h(-1em) (k_(upright(e f f)) x) \,$)

 where $k_(upright(e f f)) = omega sqrt(mu_(upright(e f f)) epsilon.alt_0)$, $epsilon.alt_0$ is permittivity of the vacuum, and $mu_(upright(e f f)) = upright(bold(j)) dot.op upright(bold(hat(mu))) = mu_(z z)$ From this it follows



#math.equation(block: true, numbering: _ => [(14)], $E_y \( x \)  = - i thin omega A_y \( x \) \,$)
#math.equation(block: true, numbering: _ => [(15)], $H_z \( x \)  = 1 / mu_0 thin frac(partial A_y, partial x) = frac(I k_(upright(e f f)), 4) thin H_1^(\( 2 \)) #h(-1em) (k_(upright(e f f)) x) .$)



The individual magnetization components can than be calculated as



#math.equation(block: true, numbering: _ => [(16)], $M_x \( x \)  = - mu_(x z) / mu_0 thin H_z \( x \) \,$)
#math.equation(block: true, numbering: _ => [(17)], $M_z \( x \)  = (mu_(z z) / mu_0 - 1) H_z \( x \) .$)



The ellipticity of the magnetization precession can be then defined as



#math.equation(block: true, numbering: _ => [(18)], $epsilon.alt = frac(\| M_z \|, \| M_x \|) .$)



#heading(level: 2, numbering: none)[Micromagnetic simulations]
<micromagnetic-simulations>
All micromagnetic simulations were performed in MuMax3 @Vansteenkiste2014design. The simulation world was set to $2048 times 64 times 4$ cells with sizes $16 times 16 times 5.425$ nm$""^3$ resulting in size of $32.768 times 1.024 times 0.0217$ µm$""^3$. The periodic boundary conditions were set in the both in-plane directions with 4 and 128 repetitions to compensate for different sizes. The static external field was set in #emph[y]-direction. The excitation field for dispersion relation was in out-of-plane direction and was set as 2D sinc pulse $B_(\() upright(e x t) \, z \) \( x \, t \) = A s i n c \( k_c \( x - x_0 \) \) omega upright(s i n c) \( omega_c \( t - t_0 \) \)$, where $k_c = 150$ rad µm$""^(- 1 \))$ is cut-off wavenumber, $omega_c = 2 pi 60$ rad GHz is cut-off frequency,$x_0 \, y_0$ are centers of the simulation area, $t_0$=100 ps is time of start of the pulse, and $A = 1$ mT is excitation amplitude. For simulation with inclusion of the driving field from strip-line antenna we calculated the this field with finite-elements method implemented in FEMM @Meeker2018FEMM. The out-of-plane magnetization component was saved each 8 ps in the top-most layer. The simulation code is available here. The dispersion relation was then analyzed with use of Python code available from.

#heading(level: 2, numbering: none)[Time-resolved scanning transmission x-ray microscopy]
<time-resolved-scanning-transmission-x-ray-microscopy>
Synchrotron STXM was used to image the magnetic excitation amplitude (out-of-plane magnetization component) with time resolution in Ga:YIG layer. This method utilizes the specific time structure of the incident X-rays, which comprises pulses with a 2 ns repetition rate and approx. 100 ps effective pulse length. Here, a monochromatic X-ray beam was focused onto the sample by means of a diffractive zone plate. The locally transmitted X-ray intensity is measured by a single-pixel detector, so raster scanning the sample provides a 1D absorption image, where the dimension depict distance from the antenna, of the sample with lateral step of approx. 200 nm. Using circularly polarized X-rays allows XMCD to be exploited, thus obtaining a magnetic contrast.

#heading(level: 2, numbering: none)[Time-resolved Brillouin light scattering microscopy]
<time-resolved-brillouin-light-scattering-microscopy>
Brillouin light scattering is a process in which incident photons are inelastically scattered by quasiparticles such as magnons or phonons, resulting in the creation of new photons with different energy and momentum. The difference in energy (frequency) is measured by the interferometer and the time between the start of the excitation and detection of the photon event can be measured by time-tagging technique.

In this work, we used a custom-developed optical setup to measure Brillouin light scattering spectra @wojewoda2023observing @wojewoda2023phase @wojewoda2024modeling. A single-mode laser (COBOLT Samba) with a wavelength of 532 nm was used as the light source. The spectral purity of the laser light was improved by a Fabry-Perot filter (TCF-2, Table Stable). The incident power on the sample was 3 mW, which did not introduce any visible nonlinear phenomena or heating of the sample. An optical microscope with active stabilization was used to compensate the mechanical drifts of the sample (THATec Innovation). The light was focused and collected through the same objective (Zeiss LD EC Epiplan-Neofluar 100 × /0.75 BD). The inelastic frequency shift was measured with a tandem Fabry-Perot interferometer (TFP-2HC interferometer, table stable) @lindsay1981construction and the time delay was measured by the Swabian instruments Time Tagger 20. To generate the magnetic field, we used a water-cooled GMW 5403 electromagnet powered by two KEPCO BOP20-20DL power supplies and a predefined current field calibration at the sample position.

#show bibliography: set text(size: 10.5pt)
#show bibliography: set par(leading: .75em)
#bibliography("source/sn-bibliography.bib", style: "ieee")

#set page(columns: 1)
#heading(level: 1, numbering: none)[Extended Data]
<ExtData>
#pagebreak()
#figure(placement: none, scope: "column", supplement: [Extended Data Fig.], numbering: _ => "1", image("source/SI-NiFe.pdf", width: 100.0%),
  caption: [
    #strong[Propagation of magnon-polaritons in metallic layers.] All data are gathered or calculated for 30-nm-thick NiFe layer. #strong[a], Sweep of the excitation frequency measured by µ-BLS 1 µm away from antenna. #strong[b], Calculated magnetostatic dispersion relation #strong[c], Dispersion relation of magnon polaritons near the FMR calculated using presented model #strong[d], Calculated group velocities of the magnon polaritons. e, Measured time-of-arrivals at 4.5 GHz at different distances from the antenna.
  ]
) <SI-NiFe>

#figure(placement: none, scope: "column", supplement: [Extended Data Fig.], numbering: _ => "2", image("source/SI-Char.pdf", width: 100.0%),
  caption: [
    #strong[Characterization of the Bi:YIG sample] .#strong[a], X-ray diffraction data. #strong[b], Vibrating sample magnetometry hysteresis loop (squares) and three line piece wise fit. The magnetic field was applied in-plane. #strong[c], The BLS spectra on thermally excited spin waves in varying in-plane magnetic fields.
  ]
) <SI-Char>

#pagebreak(weak: true)
#figure(placement: none, scope: "column", supplement: [Extended Data Fig.], numbering: _ => "3", image("source/S-Dispersion.pdf", width: 100.0%),
  caption: [
    #strong[Linear dispersion relation obtained from micromagnetic simulations and analytical modeling and group velocity]. #strong[a,b,] The 2D color code shows the distribution of the amplitude of out-of-plane magnetization components. This quantity represents Bloch function (density of the spin-wave states in respect to wavenumber and frequency). The magnetization dynamics was excited with 2D sinc pulse #strong[\(a)] and with magnetic field produced by the microstrip antenna #strong[\(b)]. The gray dashed line shows results of analytical calculation based on the linear spin wave theory. #strong[c], Group velocity calculated from the analytical model.
  ]
) <S-Dispersion>

#pagebreak(weak: true)
#figure(placement: none, scope: "column", supplement: [Extended Data Fig.], numbering: _ => "4", image("source/S-YIG-SwitchOff.pdf", width: 100.0%),
  caption: [
    #strong[Ultrafast switching-off of propagation of spin waves in YIG]. All measurements were done in out-of-plane external magnetic field of approx. 260 mT, which completelly saturated the film. Excitation power was 20 dBm. #strong[a,] Raw time-resolved BLS data for 5.4 GHz excitation frequency taken in different distances from source antenna, see geometry drawing. We can observe significant time delay at the leading edge, but at the trailing edge there is no easily visible delay. #strong[b,] Estimated velocity for different frequencies. Both edges were fitted with logistic function and subsequently the center of these logistic fits were fitted with linear function and its slope its plotted. Both edges exhibit linear behavior. The velocity of the trailing edge is the lowest near FMR, as expected from our model.
  ]
) <S-YIG-SwitchOff>

#figure(placement: none, scope: "column", supplement: [Extended Data Fig.], numbering: _ => "5", image("source/S-DWmotion.pdf", width: 100.0%),
  caption: [
    #strong[Movement of the domain wall by magnon polaritons]. Micromagnetic simulations of the 1-µm-wide and 8 µm-long BiYIG waveguide. The magnetization dynamics is excited by 2-µm wide stripline at frequency of 8.075 GHz ($k = 2.8$ rad µm$""^(- 1)$). #strong[a] Schematics of the simulation. The domain wall was stabilized 5.5 µm away from the excitation stripline. The cell size is 7.8125 nm and the excitation amplitude is 0.5 mT. #strong[b] Out-of-plane magnetization component in the middle of the waveguide in dependence to the #emph[x]-coordinate and time. The domain wall movement can be observed with velocity of $v_(upright(D W)) = 0.02$ km s$""^(- 1)$, see green dashed line. The calculated group velocity is shown as blue dashed line $v_(upright(g)) = 0.02$ km s$""^(- 1)$. #strong[c] Shows detail around domain wall and start of the excitation. After the begging of the excitation, magnon-polaritons start to interact with the domain wall and excite their eigenmodes. After one nanosecond the movement of the domain wall towards the excitation antenna is already apparent and after approx. 10 ns it reaches the magnetostatic magnon velocity on the given frequency. The amplitudes of magnetization dynamics in between the excitation antenna and domain wall are generally of very low amplitude and does not show coherent characteristics.
  ]
) <S-DWmotion>

#pagebreak(weak: true)
#figure(placement: none, scope: "column", supplement: [Extended Data Fig.], numbering: _ => "6", image("source/S-2DThermal.pdf", width: 100.0%),
  caption: [
    #strong[2D map of the thermal BLS spectra centers]. The thermal BLS spectra were measured in 2D space around the excitation antenna. The frequency of the BLS signal maxima is plotted. Around 40 µm the increase in the inhomogeneity of the sample is visible.
  ]
) <S-2DThermal>

#figure(placement: none, scope: "column", supplement: [Extended Data Fig.], numbering: _ => "7", image("source/S-Riples.pdf", width: 100.0%),
  caption: [
    #strong[Analysis of the thermal peak position in @fig2.]. The position of the thermal peak was analyzed from Gaussian fits for each excitation frequency from data presented in @fig2#h(0pt);(a). The offset between the detected and excited frequency is caused by the calibration error in the interferometer software.
  ]
) <S-Riples>

#pagebreak(weak: true)
#figure(placement: none, scope: "column", supplement: [Extended Data Fig.], numbering: _ => "8", image("source/S-PowerDepen.pdf", width: 100.0%),
  caption: [
    #strong[Time-resolved data for frequency 11.02 GHz with different excitation powers.] #strong[a,] Time of arrival of magnetic excitations for different excitation powers. #strong[b,] The estimated length of the non-linear region, where the excitation is acquiring time delay.
  ]
) <S-PowerDepen>

#pagebreak(weak: true)
#figure(placement: none, scope: "column", supplement: [Extended Data Fig.], numbering: _ => "9", image("source/S-GaYIG-XMCD.pdf"),
  caption: [
    #strong[Time-resolved data from time-resolved STXM on GaYIG.] The black solid lines represent the experimental data measured by STXM with excitation frequency of 3.75 GHz. The red lines shows their average on the interval from $- 15 thin$μm to $- 7.5 thin$μm and from $7.5 thin$μm to $15 thin$μ. The clear offset in intensity in the negative and positive distances becomes clear after 200 ps throughout the whole measured space. From this, one can estimate that the group velocity exceeds 75 μ$upright(m) upright(s)^(- 1)$. At 300 ps, this offset changes signs, which indicates oscillation in time. After 400 ps, the onset of the spin-wave propagation is visible.
  ]
) <S-GaYIG-XMCD>

#pagebreak(weak: true)
#figure(placement: none, scope: "column", supplement: [Extended Data Fig.], numbering: _ => "10", image("source/SI-Perm.pdf", width: 100.0%),
  caption: [
    #strong[Permeability]. #strong[a, b, c,] show components of the relative permeability calculated for the studied system. The rest is zero.
  ]
) <SI-Perm>

#pagebreak()
#set page(margin: 0pt, numbering: none, columns: 1)
#image("supplement-page-1.pdf", width: 100%, height: 100%, fit: "contain")

#pagebreak()
#image("supplement-page-2.pdf", width: 100%, height: 100%, fit: "contain")


