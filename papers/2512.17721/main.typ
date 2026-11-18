#import "contact-resistance.typ": contact-resistance

#set page(paper: "a4", margin: (x: 15mm, y: 19mm), numbering: "1")
#set text(font: "Libertinus Serif", size: 10pt, lang: "en")
#set par(justify: true, leading: .54em, spacing: .67em)
#set heading(numbering: "1.1.")
#set math.equation(numbering: "(1)")
#show figure.caption: set text(size: 8.5pt)
#show figure.caption: set par(justify: true)
#let title-text = [Corrosion-resistant and conductive Ti–Nb–O coatings tailored for ultra-low Pt-loaded BPPs and PTLs in PEM electrolyzers]
#let authors = [David Kolenatý, Jiří Čapek, Stanislav Haviar, Jiří Rezek, Radomír Čerstvý, Akash Kumar, Kalyani Shaji, Mariia Zhadko, and Petr Zeman]

*Highlights*

#text(size: 15pt, weight: "bold", title-text)

#authors

#v(.7em)
- 200~nm Ti--Nb--O bilayer coatings for BPPs and PTLs made by HiPIMS.
- Tailored composition and structure yield compact, conductive coatings.
- DOE ICR target met after accelerated corrosion test with 5~nm Pt overlayer.
- Pt loading reduced by up to two orders of magnitude versus conventional coatings.
- Coatings enable durable PEM electrolyzers with less reliance on precious metals.

#pagebreak()
#counter(page).update(1)
#text(size: 18pt, title-text)

#authors

#text(size: 8.5pt, style: "italic")[Department of Physics and NTIS – European Centre of Excellence, Univerzitní 8, Pilsen, 301 00, Czech Republic]

#line(length: 100%, stroke: .35pt)
#grid(columns: (30%, 1fr), gutter: 13pt,
  [
    *ARTICLE INFO*

    _Keywords_ #linebreak()
    Ti–Nb–O coatings #linebreak()
    HiPIMS #linebreak()
    Bipolar plates (BPPs) #linebreak()
    Porous transport layers (PTLs) #linebreak()
    PEM electrolyzers #linebreak()
    Corrosion resistance
  ],
  [
    *ABSTRACT*

    We develop highly corrosion-resistant and conductive Ti--Nb--O coatings for metallic components---bipolar plates (BPPs) and porous transport layers (PTLs)---in PEM water electrolyzers. Using reactive high-power impulse magnetron sputtering (HiPIMS), we deposit compact 200~nm bilayer coatings onto SS316L substrates, systematically tailoring their composition. By precisely controlling oxygen partial pressure and Nb/Ti ratio, we adjust stoichiometry and structure, directly affecting electrical resistivity and corrosion resistance. We examine interfacial contact resistance (ICR) and electrochemical parameters before and after accelerated corrosion testing. Optimized coatings exhibit resistivity on the order of $10^(- 4) med Omega upright("·") upright(c m)$ and extremely low corrosion current densities ($J_(upright(c o r r)) = 0.01$--$0.08 med mu upright(A) \/ upright(c m)^2$), well below the U.S. DOE 2026 target. Most importantly, these coatings enable the ICR target after accelerated corrosion testing with a Pt overlayer as thin as 5~nm, reducing Pt loading by up to two orders of magnitude compared to conventional approaches.
  ])
#line(length: 100%, stroke: .35pt)

#columns(2, gutter: 6mm)[
= Introduction
<sec:level1>
With the growing global energy consumption, the human influence on the
greenhouse effect and resulting climate change becomes increasingly
evident. This stresses the urgent need for the "decarbonization" of the
global energy system [#link(<ref-Ritchie2023>)[1]]. Green hydrogen appears to play an
essential role in the transition from limited fossil fuels to unlimited
renewable energy sources [#link(<ref-Dunn2002>)[2], #link(<ref-Chu2012>)[3]].

The need for flexible energy storage solutions has significantly driven
the development of Proton Exchange Membrane (PEM) electrolysis in recent
years [#link(<ref-Gotz2016>)[4], #link(<ref-Buttler2018>)[5]]. The main advantages of PEM electrolysis
compared to conventional alkaline electrolysis at similar efficiency
include high current density allowing compact design and high-pressure
operation, shorter start-up time, no need for stand-by protective
current (full load range) [#link(<ref-Buttler2018>)[5], #link(<ref-Ayers2010>)[6]], and very high purity
of produced hydrogen [#link(<ref-Buttler2018>)[5], #link(<ref-Carmo2013>)[7]] providing better coupling
with dynamic and intermittent systems. However, investment in this
technology is currently more expensive than in alkaline systems owing to
the costs for the membrane and the high loading of precious metals.
Therefore, technological innovations such as an increase in current
density and a reduction of expensive materials are necessary to achieve
competitive capital costs [#link(<ref-Buttler2018>)[5], #link(<ref-Carmo2013>)[7]].

The porous transport layers (PTLs) and bipolar plates (BPPs) are
multifunctional metallic components of PEM electrolyzer stacks,
accounting for the main fraction of the system's total weight and cost.
These components facilitate the transport of water, electrons, gases,
and heat within the electrolysis cells. BPPs also separate individual
cells, transport electrons between cells, maintain the structural
integrity of the stack, and manage heat
[#link(<ref-Ayers2010>)[6], #link(<ref-Carmo2013>)[7], #link(<ref-Bessarabov2016>)[8], #link(<ref-Feng2017>)[9], #link(<ref-Irena2020>)[10], #link(<ref-Parra-Restrepo2020>)[11], #link(<ref-Doan2021>)[12], #link(<ref-Teuku2021>)[13], #link(<ref-Prestat2023>)[14], #link(<ref-Yasin2024>)[15]].
These functions must be sustained in the electrolyzer environment, which
involves both oxidizing (anode side) and reducing (cathode side)
conditions, throughout the electrolyzer's operational lifespan of 80,000
hours (the U.S. Department of Energy (DOE) ultimate target for 2026).

Titanium is the most commonly used base metal for manufacturing PTLs and
BPPs due to its excellent corrosion resistance. However, it is
expensive, difficult to machine into complex flow-field designs, and
susceptible to hydrogen embrittlement, which can cause mechanical
failure. Over time, titanium also develops a thick oxide layer, which
increases interfacial contact resistance (ICR) at cell interfaces and
thereby reduces electrolysis efficiency. To address these challenges,
precious metal coatings such as Pt or Au are often applied. This
significantly increases the cost of already expensive Ti PTLs and BPPs,
[#link(<ref-Carmo2013>)[7], #link(<ref-Bessarabov2016>)[8], #link(<ref-Feng2017>)[9], #link(<ref-Irena2020>)[10], #link(<ref-Parra-Restrepo2020>)[11], #link(<ref-Doan2021>)[12], #link(<ref-Teuku2021>)[13], #link(<ref-Prestat2023>)[14], #link(<ref-Yasin2024>)[15], #link(<ref-Langemann2015>)[16]]
making up roughly 50--70% of the total stack costs [#link(<ref-Irena2020>)[10], #link(<ref-Babic2017>)[17]].

Stainless steel presents a much more affordable and easily machinable
alternative to titanium, and it offers substantially higher resistance
to hydrogen embrittlement
[#link(<ref-Carmo2013>)[7], #link(<ref-Doan2021>)[12], #link(<ref-Teuku2021>)[13], #link(<ref-Prestat2023>)[14], #link(<ref-Yasin2024>)[15], #link(<ref-Babic2017>)[17], #link(<ref-Gago2016>)[18]].
However, in addition to oxide layer formation, dissolved metal cations,
primarily $upright(F e)^(3 +)$, can leach into the system and poison the
catalyst and electrolyte membrane, leading to increased electrode
overpotential and reduced stack lifespan
[#link(<ref-Babic2017>)[17], #link(<ref-Sun2014>)[19], #link(<ref-Papadias2015>)[20], #link(<ref-Wang2015>)[21]].

To address oxide formation, metal ion dissolution, and hydrogen
embrittlement, a variety of protective coatings have been developed for
both Ti and stainless steel components. Thick precious metal coatings
are commonly deposited to maintain low ICR, though at high cost;
examples include 1~$mu upright(m)$ Au by sputtering [#link(<ref-Jung2009>)[22]] and
1.7~$mu upright(m)$ Ag-based coatings by pulsed ion plating [#link(<ref-Zhang2011>)[23]]
on Ti BPPs; 1~$mu upright(m)$ Au by electroplating [#link(<ref-Yang2018>)[24]], 200~nm Au
via PVD [#link(<ref-Langemann2015>)[16]], or VPS Ti (50--120~$mu upright(m)$) plus
approximately 1~$mu upright(m)$ Pt by sputtering
[#link(<ref-Gago2016>)[18], #link(<ref-Lettenmeier2016>)[25]] on stainless steel BPPs; and 60--180~nm Au
[#link(<ref-Singh2025>)[26], #link(<ref-Kang2017a>)[27], #link(<ref-Kang2017b>)[28]], 20--150~nm Ir [#link(<ref-Liu2018>)[29], #link(<ref-Liu2021>)[30]], or
200~nm Pt [#link(<ref-Rakousky2016>)[31], #link(<ref-Rakousky2018>)[32]] by electroplating or sputtering on
Ti PTLs.

To reduce costs, non-precious metal coatings have been applied,
especially for stainless steel components: 50~$mu upright(m)$ Ti by VPS
plus 1~$mu upright(m)$ Nb deposited by sputtering [#link(<ref-Lettenmeier2017>)[33]] on
BPPs, 20--50~$mu upright(m)$ Nb/Ti by VPS followed by either
1.4~$mu upright(m)$ Nb by PVD for BPPs [#link(<ref-Stiber2022a>)[34]] or
several~$mu upright(m)$ Nb for PTLs [#link(<ref-Stiber2022b>)[35]]\; and
30--130~$mu upright(m)$ Nb by VPS on Cu BPPs [#link(<ref-Kellenberger2022>)[36]]. As the
next step, metal nitride coatings have been tested: TiN/CrN multilayers
(9~$mu upright(m)$, CPED) [#link(<ref-Cheng2023>)[37]], TiCr/TiCrN
(1.6--3.6~$mu upright(m)$, arc ion plating) [#link(<ref-Yan2024>)[38]], Ta/TaN
(0.6--1.2~$mu upright(m)$, sputtering) [#link(<ref-Ye2024>)[39]], and 400~nm NbN by
sputtering [#link(<ref-Sun2024>)[40]] on Ti sheets; as well as TiN (0.5~$mu upright(m)$,
PVD) [#link(<ref-Langemann2015>)[16]] and multilayered Ti/TiN or CrN/TiN
($tilde.op$2~$mu upright(m)$, sputtering) [#link(<ref-Rojas2021>)[41]] on stainless steel
sheets. Finally, metal oxide coatings have also been explored, such as
ITO/Ta bilayers (1.5~$mu upright(m)$ Ta deposited by HiPIMS and 190~nm
ITO by PDCMS) on Ti substrates [#link(<ref-Laedre2022>)[42]], and 50~nm
$upright(T i) 4 upright(O) 7$ sputtered onto Ti BPPs [#link(<ref-Wakayama2021>)[43]] or
the BPP side of Ti PTLs [#link(<ref-Wakayama2024>)[44]]. Another approach enabled
ultra-low Pt loadings (\<20~nm) by depositing dense, defect-free Nb- and
Ti-based coatings via HiPIMS on stainless steel substrates [#link(<ref-Varela2024>)[45]].

While the performance of any coating depends on specific electrolyzer
designs and operating conditions, both research and industrial practice
indicate that relatively thick Pt overlayers, typically hundreds of
nanometers, remain the most reliable approach for metallic BPPs and PTLs
to ensure long-term electrolyzer operation. Hence, reducing Pt loading
while meeting the DOE target of
ICR~\<10~$upright(m) Omega upright("·") upright(c m)^2$ after
accelerated corrosion test presents a significant challenge in terms of
cost and material efficiency.

In this study, we directly address this challenge by developing
200~nm-thick, highly corrosion-resistant, conductive and compact bilayer
Ti--Nb--O coatings deposited by HiPIMS on stainless steel sheets,
systematically tailoring their composition over a broad range. The
optimized coatings enabled DOE-compliant performance while reducing Pt
loading by up to two orders of magnitude compared to conventional
approaches. This combination of ultra-low Pt loading and high corrosion
resistance underscores the potential of these coatings as a durable,
cost-effective solution for PEM electrolyzers.

= Experimental
<sec:level2>
== Coating preparation
<sec:level2a>
Coatings were deposited using high-power impulse magnetron sputtering
(HiPIMS) technique on substrates consisted of AISI 316L stainless steel
sheet (25×50×0.1~$upright(m m)^3$), p-type Si (100) wafer
(20×20×0.6~$upright(m m)^3$), and soda-lime glass
(75×25×1~$upright(m m)^3$). The substrates were ultrasonically cleaned
in isopropyl alcohol for 5 minutes, blow-dried with $upright(N)_2$, and
placed into a cylindrical vacuum chamber (498~mm in diameter, 403~mm
height). A turbomolecular pump (820 l/s for $upright(N)_2$, HiPace 800
M, Pfeiffer Vacuum) backed up by a scroll pump
($30 med upright(m)^3 \/ upright(h)$, ISP-500C, Anest Iwata) ensured a
base pressure of $10^(- 4) med upright(P a)$. Subsequently, the
substrates were heated to 250 °C and held at this temperature during
depositions.

The depositions were carried out using an unbalanced magnetron with a
circular, water-cooled Ti target (100~mm in diameter, 6~mm thick) and a
Nb strip (22×15×3~mm) placed in the target racetrack. The Nb content was
determined by the sample position relative to the Nb strip fixed on the
target; positions 1, 2, 3, and 4 correspond to progressively closer
distances to the Nb strip, resulting in increasing Nb content (see Fig.
1). For Ti--O coatings, the Nb strip was omitted. For coatings without
Nb, the Nb strip was removed. The substrate-target distance was 100~mm.

Prior to deposition, Ar was introduced at a flow rate of 20 sccm, and
the pumping speed of the turbomolecular pump was adjusted using a
throttle valve to attain an Ar pressure of 1 Pa. Then, 20 min etching
pre-treatment with Ar and metal ions generated by HiPIMS was performed
to clean the substrate surface and remove native oxides. This process
reduces interface defects, enhances adhesion [#link(<ref-Chabanon2022>)[46]], and improves
both the corrosion resistance and through-plane electrical conductivity
of the coated BPP. Both the magnetron and the substrate holder were
powered by synchronized pulses from a dual-channel pulse power supply
(SIPP2000 USB, MELEC GmbH) equipped with two ADL DC units. The magnetron
pulses were 10 µs long and repeated with a frequency of 4000 Hz
(corresponding to 4% duty cycle), delivering an average power of 300 W.
The substrate holder received 100 µs pulses at a constant voltage of
700~V, initiated 10 µs prior to each magnetron pulse.

For the coating deposition, 50 µs pulses with a repetition frequency of
200 Hz (1% duty cycle) were applied to the magnetron, delivering an
average power of 400 W. The substrates remained at a floating potential.
The coatings on the steel and Si substrates comprised two layers, each
approximately 100~nm thick. The bottom layer was deposited exclusively
in an Ar atmosphere at 1 Pa for each sample to ensure strong adhesion
and good electrical contact with the substrate. For the upper layer
depositions, oxygen was additionally introduced into the chamber and its
flow was precisely regulated using a PID unit (647C, MKS Instruments) to
maintain constant oxygen partial pressures, $p_(upright(o x))$, of 0, 3,
5, or 8~mPa. For X-ray diffraction (XRD), wavelength dispersive
spectroscopy (WDS), and electrical resistivity measurements, only the
upper layers with a thickness of approximately 500~nm were deposited on
the Si and glass substrates for each $p_(upright(o x))$.


Each coated stainless steel sheet was cut in half, with one half
subsequently coated with a 5~nm metallic Pt overlayer via RF sputtering.
A Pt target with 99.99% purity was used for the deposition, and a bare
Si substrate was included in each run to verify the Pt overlayer
thickness. The depositions were performed in a Leybold-Heraeus LH Z400
multitarget system, featuring a stainless steel chamber evacuated using
a turbomolecular pump supported by a scroll pump. The
target-to-substrate distance was maintained at 70~mm, with a base
pressure below 5~mPa. The target was operated at 15 W, achieving the
desired 5~nm thickness after 15 minutes of sputter deposition.

== Elemental composition and structure
<sec:level2b>
The elemental composition was determined by wavelength dispersive
spectroscopy (WDS, MagnaRay, Thermo Fisher Scientific) performed in a
scanning electron microscope (SEM, SU-70, Hitachi) using a primary
electron energy of 10 keV. For quantitative analysis, a metallic
standard of Nb and a rutile standard for Ti and O were used (both
Astimex Standards). SEM micrographs were acquired using a secondary
electron detector at the same primary energy of electrons. The
cross-sectional views were performed on simply broken specimens
deposited on pre-scratched Si wafers.

The structure of the as-deposited coatings was characterized by XRD with
a PANalytical X'Pert PRO MPD diffractometer operating in the
Bragg-Brentano geometry. The measurements were conducted with CuK$alpha$
radiation (40 kV, 40 mA), using a 0.25° divergence slit, a 0.5°
anti-scatter slit, 0.04 rad Soller slits, a Ni filter to eliminate
CuK$beta$ radiation, and an ultrafast X'Celerator semiconductor
detector. To minimize strong diffraction signals from the Si(100)
substrate, a slightly asymmetrical diffraction geometry with an
$omega$-offset of 1.5° was employed. Scans were performed over a
2$theta$ range of 8°--108° at a scanning speed of 0.04°/s. The acquired
data were processed with the PANalytical HighScore Plus software
package.

== Interfacial contact resistance (ICR) measurement
<sec:level2c>
ICR measurements were systematically performed both before and after the
the electrochemical testing procedure of each sample, adopting an
experimental configuration similar to Ref. [#link(<ref-Papadias2015>)[20]], modified for
use with a single side-coated sample. A coated stainless steel sheet
sample was stacked with a carbon gas diffusion layer (GDL) and placed
between two gold-coated cylindrical copper electrodes with a
$1 med upright(c m)^2$ contact area. Although carbon GDL is unsuitable
for the anode side of an operating electrolyzer due to its
susceptibility to corrosion, in this study, it was employed for ex-situ
testing to ensure comparable ICR values. The GDL used was Toray carbon
paper (TGP-H-60) with a thickness of 0.19~mm. A constant direct current
of 1 A was applied between the two electrodes using a Keithley 2635B
Source Measure Unit, simultaneously measuring the resulting voltage. The
described measurement setup, including electrical connections, is
schematically represented in @fig2 (a). The applied compaction
force was progressively increased from 30 to 200 N, corresponding to a
compaction pressure range of 0.3 to 2~MPa.

The ICR is defined as follows:
$ quad upright(I C R) [upright(m) Omega times upright(c m)^2] = R_(upright(G D L) \/ upright(B P P)) \[ upright(m) Omega \] times upright(A r e a) [upright(c m)^2] $
where $R_(upright(G D L) \/ upright(B P P))$ denotes the contact
resistance between the GDL and BPP. This value cannot be measured
directly, since the measured resistance contains additional
contributions from the measurement setup. All contributions, listed from
top to bottom, as depicted in @fig2\(a), are given by the following
equation:
$ quad R_(upright(A u) \/ upright(G D L) \/ upright(B P P) \/ upright(A u)) = R_(upright(A u) \/ upright(G D L)) + R_(upright(G D L)) + R_(upright(G D L) \/ upright(B P P)) + R_(upright(B P P)) $
where $R_(upright(A u) \/ upright(G D L))$ is the contact resistance
between the gold-coated electrode and the GDL, which must be determined;
$R_(upright(G D L))$ is the through-plane resistance of the GDL,
provided by the manufacturer; $R_(upright(G D L) \/ upright(B P P))$ is
the aforementioned contact resistance required for the ICR calculation;
and $R_(upright(B P P))$ is the through-plane resistance of the
stainless steel sheet substrate (BPP base material), which can be
neglected as it is significantly smaller than the other components. To
determine $R_(upright(A u) \/ upright(G D L))$, an additional
measurement was performed with only the GDL placed between the
electrodes (see @fig2\(b)), comprising the following resistances:
$ quad R_(upright(A u) \/ upright(G D L) \/ upright(A u)) = 2 times R_(upright(A u) \/ upright(G D L)) + R_(upright(G D L)) $
The ICR was then calculated using the two measured resistances according
to the following equation:
$ quad upright(I C R) = (R_(upright(A u) \/ upright(G D L) \/ upright(B P P) \/ upright(A u)) - frac(R_(upright(A u) \/ upright(G D L) \/ upright(A u)) + R_(upright(G D L)), 2)) times upright(" Area ") $


== Electrochemical measurement
<sec:level2d>
All electrochemical measurements were conducted in a water-jacketed,
three-electrode glass corrosion cell filled with 120 mL of
$upright(H)_2 upright(S O)_4$ electrolyte solution (pH~5.0) containing
5~ppm NaF, maintained at 60~°C to replicate the operating conditions of
a PEM electrolyzer. The samples, serving as the working electrode, were
mounted on the PTFE cell wall and sealed with a Viton gasket, exposing a
circular area of $1 med upright(c m)^2$ to the electrolyte. An Ag/AgCl
(3M KCl) reference electrode was positioned near the working electrode
via a Luggin capillary to minimize potential drop, while a Pt wire
functioned as the counter electrode. All electrodes were connected to a
potentiostat (Squidstat Plus, Admiral Instruments). Accelerated
corrosion test consisted of potentiostatic polarization at 2~V vs.~SHE
(equivalent to 2.3~V vs.~RHE) for 1 hour. Potentiodynamic polarization
measurements (0--2~V vs.~SHE) were performed at a scan rate of 1~mV/s,
both before and after the potentiostatic polarization.

= Results
<sec:level3>
== Elemental composition and structure
<sec:level3a>
Figure 3 presents a ternary plot illustrating the elemental compositions
of the upper layers of all prepared coatings. The upper layers of the
coatings were synthesized under $p_(upright(o x))$ = 0, 3, 5, and 8~mPa,
denoted by black triangles, red diamonds, green circles, and purple
squares, respectively. The Nb content in the coatings ranged from 0 to
10.5~at.%, corresponding to
$upright(N b) \/ \( upright(T i) + upright(N b) \)$ ratios of 0 to
approximately 0.14. This variation indicates a controlled incorporation
of Nb into the Ti or Ti--O matrix, enabling precise tuning of the
coating composition to achieve the desired properties.


The O content in the coatings exhibited a pronounced dependence on
$p_(upright(o x))$ during the deposition. At
$p_(upright(o x)) = 0 med upright(m P a)$, the coatings contained
approximately 9~at.% O, resulting in an
$upright(O) \/ \( upright(T i) + upright(N b) \)$ ratio of about 0.1.
This minimal O incorporation was primarily attributed to the desorption
of residual O from the chamber's inner surfaces. Upon introducing oxygen
at $p_(upright(o x)) = 3 med upright(m P a)$, the O content increased to
20--37~at.%, with an $upright(O) \/ \( upright(T i) + upright(N b) \)$
ratio ranging from 0.26 to 0.6. At
$p_(upright(o x)) = 5 med upright(m P a)$, the O content further rose to
56--60~at.%, corresponding to
$upright(O) \/ \( upright(T i) + upright(N b) \)$ ratios of 1.3--1.5. At
the maximum $p_(upright(o x))$ of 8~mPa, the coatings exhibited an O
content of 60--64~at.%, with
$upright(O) \/ \( upright(T i) + upright(N b) \)$ ratios between 1.5 and
1.8. For $p_(upright(o x))$ = 3, 5, and 8~mPa, the highest O contents
were observed for coatings without Nb, while lower values were found at
low or intermediate Nb contents. Overall, these results demonstrate that
the O incorporation increases markedly with $p_(upright(o x))$,
indicating the formation of substantial Ti--O and Nb--O bonds in the
coatings. Furthermore, the Nb content notably influences the amount of O
incorporation, particularly at
$p_(upright(o x)) = 3 med upright(m P a)$.


XRD analysis of the upper layers of the coatings deposited at
$p_(upright(o x)) = 0 med upright(m P a)$ revealed that the hexagonal
$alpha$-Ti phase (PDF card no. 00-044-1294) was dominant across all
investigated Nb contents, exhibiting a pronounced (0002) preferential
orientation. No distinct reflections attributable to the cubic $beta$-Ti
phase (PDF no. card 00-044-1288) were observed in the diffraction
patterns. However, the main $beta$-Ti peak overlapped with the most
intense $alpha$-Ti peak, which could potentially mask its presence. As
the Nb content increases, the likelihood of the $beta$-Ti phase
formation rises, since Nb forms a solid solution with $beta$-Ti due to
their common BCC lattice structure. On the other hand, the solubility
limit of Nb in $alpha$-Ti, which is 2~at.% according to the equilibrium
phase diagram, could be increased in our case due to the non-equilibrium
conditions of our deposition process. This fact is supported by a
gradual shift of the $alpha$-Ti $\( 1 med 0 med overline(1) med 0 \)$
peak to higher diffraction angles (from 35.2$""^compose$ to
36.2$""^compose$) in Fig. 4 for
$p_(upright(o x)) = 0 med upright(m P a)$. Since other different peaks
remained at the same positions with Nb incorporation, the shift of the
$\( 10 overline(1) med 0 \)$ peak indicates that Nb incorporation
induces anisotropic lattice distortion, resulting in a contraction of
the $a$-axis in the hexagonal $alpha$-Ti lattice.

The O introduction at $p_(upright(o x))$ values between 3 and 8~mPa
significantly influenced the phase composition of the upper layers of
the coatings. While the $alpha$-Ti phase can dissolve up to approx.
33~at.% of O~[#link(<ref-Okamoto2011>)[47]], the addition of
$p_(upright(o x)) = 3 med upright(m P a)$ led to the formation of a
substoichiometric cubic TiO$""_x$ phase, although peaks corresponding to
the $alpha$-Ti phase remained still detectable, especially for the
Ti--Nb--O coatings. As $p_(upright(o x))$ increased to 5 and 8~mPa, the
phase composition changed further, and only the cubic TiO$""_x$ phase
was observed. The $upright(O) \/ \( upright(T i) + upright(N b) \)$
ratio in this phase varied from 0.6 to 1.3 (e.g., PDF cards no.
04-005-4341 and 04-005-4348), reflecting its substoichiometric existence
over a broad range. Additionally, the presence of an amorphous
background around 30$""^compose$ became more pronounced with increasing
O incorporation. The results further indicate that Nb was most likely
substitutionally dissolved within the crystal lattices of both the
$alpha$-Ti and TiO$""_x$ phases, rather than forming separate Nb-rich
phases. Collectively, these findings underscore the crucial role of
$p_(upright(o x))$ in determining both the phase composition and
structural properties of the prepared coatings.

Figure~5 shows that the electrical resistivity of the upper layers of
the coatings is strongly influenced by the O content. This dependence is
much more pronounced than that on the Nb content in the metallic
fraction, expressed as
$upright(N b) \/ \( upright(T i) + upright(N b) \)$. The observed trend
closely parallels the changes in the crystalline structure revealed by
XRD, where phase formation was primarily governed by $p_(upright(o x))$
during the deposition. These findings indicate that O availability
played a dominant role in determining both the electrical and structural
properties of the coatings.


The lowest electrical resistivity was measured for the Ti--O and
Ti--Nb--O upper layers deposited at
$p_(upright(o x)) = 0 med upright(m P a)$, ranging from
$0.9 times 10^(- 4)$ to
$1.3 times 10^(- 4)$~$Omega upright("·") upright(c m)$, with the lowest
value observed for the Ti--O layer. For the upper layers prepared at
$p_(upright(o x)) = 3 med upright(m P a)$, the resistivity remained
relatively low, ranging from $2.7 times 10^(- 4)$ to
$6.1 times 10^(- 4)$~$Omega upright("·") upright(c m)$\; the lowest
values corresponded to layers with lower Nb doping
($upright(N b) \/ \( upright(T i) + upright(N b) \)$ of 6.8 and
8.3~at.%). Further increases in $p_(upright(o x))$ to 5 and 8~mPa caused
the resistivity to rise by approximately one order of magnitude,
reaching $1.3 times 10^(- 3)$ to
$1.0 times 10^(- 2) med Omega upright("·") upright(c m)$. An exception
was observed for the layer prepared at 8~mPa without Nb, where the
resistivity was substantially higher
($1.4 times 10^(- 1)$~$Omega upright("·") upright(c m)$).

The bilayer structure of the coating is clearly visible in the
cross-sectional SEM image (Fig. 6). The bottom layer deposited at
$p_(upright(o x)) = 0 med upright(m P a)$ appears to be more compact,
while the upper layer deposited at
$p_(upright(o x)) = 5 med upright(m P a)$ most likely exhibits larger
columnar grains due to the O addition during the deposition. Analysis of
the top-view SEM image (inset of Fig. 6) indicates that the grains in
the upper layer have an average lateral diameter of approximately 20~nm.
Overall, the coating structure observed in the cross section appears
relatively dense, which is advantageous for enhancing corrosion
resistance.


== Electrochemical and ICR measurements
<sec:level3b>
To assess the intrinsic properties of the coatings, potentiodynamic
polarization and ICR measurements were performed for all studied
compositions prior to Pt overlayer deposition, both before and after
accelerated corrosion test, which consisted of potentiostatic
polarization at 2~V vs. SHE (equivalent to 2.3~V vs. RHE) for 1~hour.
Key properties such as corrosion current densities,
$J_(upright(c o r r))$, and corrosion potentials,
$E_(upright(c o r r))$, were determined from the Tafel plots constructed
using the potentiodynamic polarization data (representative examples are
shown in Fig.~8b). The polarization resistance, $R_(upright(p))$, for
each sample was also calculated from the anodic and cathodic slopes
according to the Stern--Geary equation. The complete set of
$J_(upright(c o r r))$, $E_(upright(c o r r))$, $R_(upright(p))$, and
ICR data for all coatings, both before and after the potentiostatic
polarization, is provided in Supplementary Table~1a. It should be noted
that, although the US Department of Energy (DOE) specifies target values
for $J_(upright(c o r r))$ below 1~$mu upright(A) \/ upright(c m)^2$ and
ICR below 10~$upright(m) Omega upright("·") upright(c m)^2$ for bipolar
plates in PEM fuel cells, these benchmarks are widely used as a
reference to evaluate the performance of coatings for PEM electrolyzers
as well.

All coatings demonstrated exceptional corrosion resistance, with
$J_(upright(c o r r))$ values in the range of
$0.01$--$0.06$~$mu upright(A) \/ upright(c m)^2$ before and
$0.01$--$0.08$~$mu upright(A) \/ upright(c m)^2$ after the
potentiostatic polarization (Fig.~7a and~b). Ti--Nb--O coatings with the
upper layer prepared at $p_(upright(o x)) = 3 med upright(m P a)$
exhibited moderately higher $J_(upright(c o r r))$ compared to the rest.
Interestingly, after the potentiostatic polarization, the
$J_(upright(c o r r))$ of these coatings decreased by 50--80%. This
decrease can be attributed to surface passivation during the
potentiostatic polarization, which enhances the protective properties of
the coatings. In contrast, coatings with upper layers deposited at
$p_(upright(o x))$ of 5 or 8~mPa showed an increase in
$J_(upright(c o r r))$ (up to 350%) most likely caused by the
development of voids or other defects during the potentiostatic
polarization. This may be attributed to a higher amorphous fraction and
disorder in the structure of the oxidized upper layer, as suggested by
the XRD results shown in Fig.~4, which can result in less effective
barrier formation. Nonetheless, even the highest $J_(upright(c o r r))$
values measured are more than one order of magnitude lower than the
U.S.~DOE criterion.

While $J_(upright(c o r r))$ remains the key metric for evaluating
corrosion performance, the corrosion potential, $E_(upright(c o r r))$,
and polarization resistance, $R_(upright(p))$, also provide valuable
insights. High $E_(upright(c o r r))$ values indicate effective
passivation with increased resistance to oxidative reactions, while high
$R_(upright(p))$ values reflect not only effective passivation but also
a compact, low-porosity, defect-free surface---both crucial for
minimizing metal ion dissolution and ensuring long-term stability in PEM
electrolyzer stacks.

Before the potentiostatic polarization, $E_(upright(c o r r))$ ranged
from $- 0.2$ to $- 0.03$~V vs.~SHE and tended to increase for higher
$p_(upright(o x))$, suggesting that higher O content leads to a more
passivated, albeit less conductive surface. This trend is consistent
with the $J_(upright(c o r r))$ results (see Fig.~7a), where higher
$p_(upright(o x))$ corresponds to lower $J_(upright(c o r r))$.
Regarding $R_(upright(p))$, the values ranged from $0.5$ to
$2.6 med times 10^6$~$Omega upright("·") upright(c m)^2$, closely
mirroring the trend observed for $J_(upright(c o r r))$. Notably, these
$R_(upright(p))$ values are substantially higher than those typically
reported in the literature, such as
$4.4 times 10^5$~$Omega upright("·") upright(c m)^2$ for
Nb~[#link(<ref-Kellenberger2020>)[48]], $8 times 10^4$~$Omega upright("·") upright(c m)^2$
for TiN~[#link(<ref-Li2021>)[49]], and $5 times 10^4$~$Omega upright("·") upright(c m)^2$
for Ta/TaN~[#link(<ref-Ye2024>)[39]]. This improvement may be attributed to the smooth and
compact morphology of the coatings deposited by HiPIMS, as well as
differences in the parameters of the accelerated corrosion test, such as
electrolyte composition, temperature, and other experimental conditions.

Following the potentiostatic polarization, $E_(upright(c o r r))$ for
all coatings converged to a narrow range between $- 0.06$ and $0$~V
vs.~SHE, with the highest values observed for Ti--Nb--O coatings with a
high Nb content and upper layers deposited at
$p_(upright(o x)) = 3 med upright(m P a)$. This convergence indicates a
comparable degree of surface passivation across the compositional range.
In contrast, $R_(upright(p))$ continued to correlate with
$J_(upright(c o r r))$ after the potentiostatic polarization (see
Fig.~7b). This is likely because both parameters are sensitive to
variations in surface porosity and defect formation, whereas
$E_(upright(c o r r))$ does not directly reflect changes in surface
area. All Ti--O coatings exhibited only a slight increase in
$R_(upright(p))$, while Ti--Nb--O coatings with upper layers deposited
at $p_(upright(o x)) = 3 med upright(m P a)$ showed a substantially
greater increase following the potentiostatic polarization, reaching up
to $4.3 times 10^6$~$Omega upright("·") upright(c m)^2$ for
$p_(upright(o x)) = 3 med upright(m P a)$ and the second-highest Nb
content (where the Nb content and the
$upright(N b) \/ \( upright(T i) + upright(N b) \)$ ratio in the
Ti--Nb--O upper layer is 8.2~at.% and 0.11, respectively). Notably, this
coating also exhibited the lowest ICR prior to the potentiostatic
polarization. This improvement in $R_(upright(p))$ suggests enhanced
passivation due to the formation of a compact, defect-free passive oxide
layer. Conversely, Ti--Nb--O coatings with upper layers deposited at
higher $p_(upright(o x))$ values (5 and 8~mPa) exhibited a slight
decrease in $R_(upright(p))$ after polarization, with values ranging
from $5 times 10^5$ to
$1 times 10^6$~$Omega upright("·") upright(c m)^2$. This reduction was
likely caused by an increase in surface defects and the development of
voids, consistent with the observed increase in $J_(upright(c o r r))$
for these coatings.


For the ICR before the potentiostatic polarization, most coatings with
upper layers deposited at $p_(upright(o x))$ of 0 and 3~mPa exhibited
ICR values below 100~$upright(m) Omega upright("·") upright(c m)^2$.
Notably, coatings with intermediate Nb content and an upper layer
deposited at $p_(upright(o x)) = 3 med upright(m P a)$ demonstrated the
lowest initial ICR, falling below
7~$upright(m) Omega upright("·") upright(c m)^2$. These results
correlate with the higher $J_(upright(c o r r))$ values before the
potentiostatic polarization for these coatings, indicating higher
surface conductivity. This can be attributed to a substoichiometric
cubic TiO$""_x$ phase with higher conductivity in the upper layer
deposited at $p_(upright(o x)) = 3 med upright(m P a)$ (see Fig.~4),
which is, however, capable of limiting surface passivation upon exposure
to air. In contrast, coatings with upper layers deposited at
$p_(upright(o x))$ of 5 and 8~mPa generally showed ICR values above
200~$upright(m) Omega upright("·") upright(c m)^2$ (Fig.~7c). After the
potentiostatic polarization, ICR values for all coatings increased
substantially, exceeding
$500 med upright(m) Omega upright("·") upright(c m)^2$ (Fig.~7d), due to
increased surface oxidation that impeded effective contact with the GDL.
This is consistent with the observed increase in $E_(upright(c o r r))$
for all coatings, which converged to a narrow range. Notably, ICR values
tended to increase with both higher O and Nb content in the upper
layers, reaching a maximum of
900~$upright(m) Omega upright("·") upright(c m)^2$, which again
correlates with the $J_(upright(c o r r))$ trend observed after the
potentiostatic polarization.

In summary, fine-tuning the composition revealed the optimal parameters
for coating performance: a lower oxygen partial pressure,
$p_(upright(o x)) = 3$~mPa, where the O content and the
$upright(O) \/ \( upright(T i) + upright(N b) \)$ ratio in the Ti--Nb--O
upper layer range from 21 to 26~at.% and 0.26 to 0.34, respectively, and
an intermediate Nb content, where the Nb content and the
$upright(N b) \/ \( upright(T i) + upright(N b) \)$ ratio in the upper
layer range from 5.4 to 8.2~at.% and 0.07 to 0.11, respectively. These
coatings exhibited the lowest initial ICR and, after the potentiostatic
polarization, showed reduced $J_(upright(c o r r))$ as well as elevated
$E_(upright(c o r r))$ and $R_(upright(p))$ values, indicating effective
surface passivation while maintaining a compact and defect-free surface.

== Electrochemical and ICR measurements after Pt overlayer application
<sec:level3c>
Since none of the coatings met the DOE requirement of maintaining ICR
after the potentiostatic polarization below
$10 med upright(m) Omega upright("·") upright(c m)^2$, we first
investigated the dependence of ICR on Pt layer thickness before and
after the potentiostatic polarization (Fig.~8a). We selected a Ti--O
coating with the upper layer deposited at
$p_(upright(o x)) = 3 med upright(m P a)$. This coating exhibited low
and stable $J_(upright(c o r r))$ values both prior to and after the
potentiostatic polarization, with a relatively low initial ICR of
$37.5 med upright(m) Omega upright("·") upright(c m)^2$. The addition of
only $2 med upright(n m)$ of Pt reduced the initial ICR to
$25.2 med upright(m) Omega upright("·") upright(c m)^2$ and led to a
substantial decrease in post-corrosion ICR, from $496$ to
$86.5 med upright(m) Omega upright("·") upright(c m)^2$. Moreover, a
$5 med upright(n m)$ Pt overlayer was already sufficient to meet the DOE
target, achieving ICR values of
$7.6 med upright(m) Omega upright("·") upright(c m)^2$ before and
$5.6 med upright(m) Omega upright("·") upright(c m)^2$ after the
potentiostatic polarization. Increasing the Pt thickness to
$20 med upright(n m)$ did not yield any further improvement in ICR.

Based on these findings, all coatings were subsequently coated with a
$5 med upright(n m)$ Pt overlayer. Both ICR and potentiodynamic
measurements were performed before and after the potentiostatic
polarization, and the resulting $J_(upright(c o r r))$ and ICR values
are presented in Fig.~9. The complete set of $J_(upright(c o r r))$,
$E_(upright(c o r r))$, $R_(upright(p))$, and ICR data for all coatings
with a 5~nm Pt overlayer before and after the potentiostatic
polarization is provided in Supplementary Table~1b.



Tafel plot in Fig.~8b shows that both Ti--O coatings, with and without a
Pt overlayer, exhibited enhanced passivation behavior after the
potentiostatic polarization. For the Ti--O coating without Pt, the onset
of passivation was already evident before polarization; however, after
polarization, the passivation region began at a lower potential and the
current density was significantly reduced across the entire anodic
potential range. The Pt-coated sample showed no clear passivation before
polarization, but developed a passive region afterward, likely due to
discontinuities in the thin (5~nm) Pt layer that exposed the underlying
Ti--O to passivation.

The $J_(upright(c o r r))$ values for all coatings with a 5~nm Pt
overlayer were in the range of
$0.3$--$1.3$~$mu upright(A) \/ upright(c m)^2$ before the potentiostatic
polarization (Fig.~9a), with the highest value observed for the Ti--O
coating deposited at $p_(upright(o x)) = 0 med upright(m P a)$. After
the potentiostatic polarization, $J_(upright(c o r r))$ values decreased
slightly to a range of $0.2$--$1.0$~$mu upright(A) \/ upright(c m)^2$
(Fig.~9b), satisfying the DOE requirement. A slight decreasing trend in
$J_(upright(c o r r))$ with increasing Nb content was observed. It
should be noted that these $J_(upright(c o r r))$ values are
approximately one order of magnitude higher than those measured for
coatings without a Pt overlayer (see, e.g., Fig.~8b), which can be
attributed to the high surface conductivity imparted by the Pt,
maintained even after the potentiostatic polarization.

The $E_(upright(c o r r))$ values ranged from $0.29$ to $0.38$~V vs.~SHE
before the potentiostatic polarization, and decreased to $0.20$ to
$0.31$~V vs.~SHE after the potentiostatic polarization (see, e.g.,
Fig.~8b). These values are significantly higher than those of coatings
without a Pt overlayer, indicating enhanced resistance to oxidative
reactions, including metal dissolution.

The $R_(upright(p))$ values prior to the potentiostatic polarization
were fairly consistent across all studied compositions in the range from
$9 times 10^4$ to $2.8 times 10^5$~$Omega upright("·") upright(c m)^2$,
with the lowest value observed for the Ti--O coating deposited at
$p_(upright(o x)) = 0 med upright(m P a)$. After the potentiostatic
polarization, $R_(upright(p))$ values for all coatings slightly
increased to a range of
$1.2$--$4.0 times 10^5$~$Omega upright("·") upright(c m)^2$. These
$R_(upright(p))$ values measured for the coatings with Pt overlayer are
approximately an order of magnitude lower than the values observed for
coatings without Pt overlayer both before and after the potentiostatic
polarization, reflecting the ability of the Pt overlayer to effectively
preserve its high conductivity throughout the potentiostatic
polarization.

The ICR values of all coatings measured before the potentiostatic
polarization dropped below
$50 med upright(m) Omega upright("·") upright(c m)^2$ after being coated
with a 5~nm Pt overlayer (Fig.~9c). This large drop is not caused by
decreased resistivity of the coatings, but by the increased effective
contact area between the GDL wires and the upper layer provided by the
thin, but highly conductive Pt layer. The lowest pre-corrosion ICR
values were observed for Ti--O and Ti--Nb--O coatings deposited at
$p_(upright(o x)) = 0 med upright(m P a)$, with values below
$5 med upright(m) Omega upright("·") upright(c m)^2$, except for the
coating with the highest Nb content. Unexpectedly, Ti--Nb--O coatings
with the highest and second-highest Nb contents deposited at
$p_(upright(o x)) = 8 med upright(m P a)$ also exhibited ICR values
below $5 med upright(m) Omega upright("·") upright(c m)^2$, deviating
from the general trend.

Following the potentiostatic polarization, ICR values remained largely
stable, with only minor variations (see Fig.~9d). For several
compositions, a slight decrease in ICR was observed after polarization,
particularly for Ti--Nb--O coating deposited at
$p_(upright(o x)) = 0 med upright(m P a)$ with the lowest Nb content
(from 4.9 to $4 med upright(m) Omega upright("·") upright(c m)^2$), for
the Ti--O coating with upper layer deposited at
$p_(upright(o x)) = 3 med upright(m P a)$ (from 7.6 to
$5.6 med upright(m) Omega upright("·") upright(c m)^2$), and for
Ti--Nb--O coating deposited at $p_(upright(o x)) = 0 med upright(m P a)$
with the lowest Nb content and upper layer deposited at
$p_(upright(o x)) = 3 med upright(m P a)$ (from 7.3 to
$5.3 med upright(m) Omega upright("·") upright(c m)^2$). Notably, these
coatings also exhibited some of the lowest ICR values after the
potentiostatic polarization without the Pt overlayer (see Fig.~7d). For
all remaining coatings, the ICR either remained similar or increased
after the potentiostatic polarization. It should be noted that
deposition of the Pt overlayer within a single uninterrupted
process---i.e., without exposing the upper layer to air---would likely
result in even lower ICR values due to minimization of interfacial
oxidation or contamination.

Overall, these findings demonstrate that the developed coatings enable
the DOE ICR target to be met after accelerated corrosion test with a Pt
overlayer as thin as 5~nm, resulting in a significant reduction in Pt
loading.

= Conclusions <sec:level4>
In this study, we demonstrate that precise tailoring of both composition
and structure in 200~nm-thick bilayer Ti--Nb--O coatings deposited by
HiPIMS enables the simultaneous achievement of outstanding corrosion
resistance and high electrical conductivity. By optimizing the O and Nb
content, the coatings maintain the compact structure after
electrochemical tests and allow a significant reduction in Pt loading,
which is, however, still needed to meet U.S.~DOE requirements.

The incorporation of Nb into the coatings contributed to reducing
resistivity, with optimized compositions reaching values on the order of
$10^(- 4) med Omega upright("·") upright(c m)$. The Ti--Nb--O coatings
exhibited excellent corrosion resistance, with extremely low corrosion
current densities
$J_(upright(c o r r)) = 0.01$--$0.08$~$mu upright(A) \/ upright(c m)^2$
measured after accelerated corrosion test, consisting of potentiostatic
polarization at 2~V vs. SHE (equivalent to 2.3~V vs. RHE) for 1~hour,
yielding values more than an order of magnitude below the U.S. DOE
criterion. Polarization resistance, $R_(upright(p))$, reached up to
$4.3 times 10^6 med Omega upright("·") upright(c m)^2$, confirming the
preservation of compact and smooth surfaces even after the
potentiostatic polarization for certain compositions.

Fine-tuning the Ti--Nb--O upper layer composition revealed that a lower
oxygen partial pressure, $p_(upright(o x)) = 3$~mPa, resulting in an O
content of 21 to 26~at.%, combined with intermediate Nb doping, with an
Nb content of 5.4 to 8.2~at.%, led to optimal coating performance. These
coatings exhibited the lowest initial ICR, and after the potentiostatic
polarization, showed reduced $J_(upright(c o r r))$, along with elevated
$E_(upright(c o r r))$ and $R_(upright(p))$ values, indicating effective
surface passivation while maintaining a compact and defect-free surface.

Although as-deposited coatings with optimized composition achieved ICR
values below $10 med upright(m) Omega upright("·") upright(c m)^2$,
satisfying the U.S.~DOE criterion, the potentiostatic polarization at
elevated potentials resulted in a significant increase in ICR to several
hundred $upright(m) Omega upright("·") upright(c m)^2$. However,
applying just a 5~nm Pt overlayer to the Ti--Nb--O coatings achieved ICR
values of approximately
$5 med upright(m) Omega upright("·") upright(c m)^2$ after the
potentiostatic polarization~--- a reduction in Pt thickness by one to
two orders of magnitude compared to conventional approaches.

This substantial reduction in Pt loading, combined with the high
corrosion resistance of the Ti--Nb--O coatings, highlights their
potential as a durable, cost-effective, and sustainable solution for PEM
electrolyzers with significantly reduced reliance on precious metals.

#heading(level: 1, numbering: none)[Acknowledgments]
<acknowledgments>
This work was supported by the project Quantum materials for
applications in sustainable technologies (QM4ST), funded as project No.
CZ.02.01.01/00/22\_008/0004572 by Programme Johannes Amos Comenius, call
Excellent Research.


#heading(numbering: none)[References]

#set text(size: 8.5pt)
#enum(
 [H.~Ritchie, P.~Rosado, M.~Roser, Co2 and greenhouse gas emissions, Our World in Data (2023). Https:\/\/ourworldindata.org/co2-and-greenhouse-gas-emissions. <ref-Ritchie2023>],
 [S.~Dunn, , International Journal of Hydrogen Energy 27 (2002) 235--264. #link("https://doi.org/10.1016/s0360-3199(01)00131-8"). #link("https://doi.org/10.1016/s0360-3199(01)00131-8")[doi:10.1016/s0360-3199(01)00131-8]. <ref-Dunn2002>],
 [S.~Chu, A.~Majumdar, , Nature 488 (2012) 294--303. #link("https://doi.org/10.1038/nature11475"). #link("https://doi.org/10.1038/nature11475")[doi:10.1038/nature11475]. <ref-Chu2012>],
 [M.~Götz, J.~Lefebvre, F.~Mörs, A.~M. Koch, F.~Graf, S.~Bajohr, R.~Reimert, T.~Kolb, , Renewable Energy 85 (2016) 1371--1390. #link("https://doi.org/10.1016/j.renene.2015.07.066"). #link("https://doi.org/10.1016/j.renene.2015.07.066")[doi:10.1016/j.renene.2015.07.066]. <ref-Gotz2016>],
 [A.~Buttler, H.~Spliethoff, , Renewable and Sustainable Energy Reviews 82 (2018) 2440--2454. #link("https://doi.org/10.1016/j.rser.2017.09.003"). #link("https://doi.org/10.1016/j.rser.2017.09.003")[doi:10.1016/j.rser.2017.09.003]. <ref-Buttler2018>],
 [K.~E. Ayers, E.~B. Anderson, C.~Capuano, B.~Carter, L.~Dalton, G.~Hanlon, J.~Manco, M.~Niedzwiecki, , ECS Transactions 33 (2010) 3--15. #link("https://doi.org/10.1149/1.3484496"). #link("https://doi.org/10.1149/1.3484496")[doi:10.1149/1.3484496]. <ref-Ayers2010>],
 [M.~Carmo, D.~L. Fritz, J.~Mergel, D.~Stolten, , International Journal of Hydrogen Energy 38 (2013) 4901--4934. #link("https://doi.org/10.1016/j.ijhydene.2013.01.151"). #link("https://doi.org/10.1016/j.ijhydene.2013.01.151")[doi:10.1016/j.ijhydene.2013.01.151]. <ref-Carmo2013>],
 [D.~Bessarabov, H.~Wang, H.~Li, N.~Zhao, PEM electrolysis for hydrogen production, CRC Press, 2016. #link("https://books.google.cz/books/about/PEM_Electrolysis_for_Hydrogen_Production.html?id=BNuYCgAAQBAJ&redir_esc=y"). <ref-Bessarabov2016>],
 [Q.~Feng, X.~Yuan, G.~Liu, B.~Wei, Z.~Zhang, H.~Li, H.~Wang, , Journal of Power Sources 366 (2017) 33--55. #link("https://doi.org/10.1016/j.jpowsour.2017.09.006"). #link("https://doi.org/10.1016/j.jpowsour.2017.09.006")[doi:10.1016/j.jpowsour.2017.09.006]. <ref-Feng2017>],
 [G.~H. C.~R. IRENA, Scaling up electrolysers to meet the 1.5 c climate goal, International Renewable Energy Agency, Abu Dhabi (2020). #link("https://www.irena.org/publications/2020/Dec/Green-hydrogen-cost-reduction"). <ref-Irena2020>],
 [J.~Parra-Restrepo, R.~Bligny, J.~Dillet, S.~Didierjean, D.~Stemmelen, C.~Moyne, A.~Degiovanni, G.~Maranzana, , International Journal of Hydrogen Energy 45 (2020) 8094--8106. #link("https://doi.org/10.1016/j.ijhydene.2020.01.100"). #link("https://doi.org/10.1016/j.ijhydene.2020.01.100")[doi:10.1016/j.ijhydene.2020.01.100]. <ref-Parra-Restrepo2020>],
 [T.~L. Doan, H.~E. Lee, S.~S.~H. Shah, M.~Kim, C.~Kim, H.~Cho, T.~Kim, , International Journal of Energy Research 45 (2021) 14207--14220. #link("https://doi.org/10.1002/er.6739"). #link("https://doi.org/10.1002/er.6739")[doi:10.1002/er.6739]. <ref-Doan2021>],
 [H.~Teuku, I.~Alshami, J.~Goh, M.~S. Masdar, K.~S. Loh, , International Journal of Energy Research 45 (2021) 20583--20600. #link("https://doi.org/10.1002/er.7182"). #link("https://doi.org/10.1002/er.7182")[doi:10.1002/er.7182]. <ref-Teuku2021>],
 [M.~Prestat, , Journal of Power Sources 556 (2023) 232469. #link("https://doi.org/10.1016/j.jpowsour.2022.232469"). #link("https://doi.org/10.1016/j.jpowsour.2022.232469")[doi:10.1016/j.jpowsour.2022.232469]. <ref-Prestat2023>],
 [M.~C. Yasin, M.~Johar, A.~Gupta, S.~Shahgaldi, , International Journal of Hydrogen Energy 88 (2024) 726--747. #link("https://doi.org/10.1016/j.ijhydene.2024.09.208"). #link("https://doi.org/10.1016/j.ijhydene.2024.09.208")[doi:10.1016/j.ijhydene.2024.09.208]. <ref-Yasin2024>],
 [M.~Langemann, D.~L. Fritz, M.~Müller, D.~Stolten, , International Journal of Hydrogen Energy 40 (2015) 11385--11391. #link("https://doi.org/10.1016/j.ijhydene.2015.04.155"). #link("https://doi.org/10.1016/j.ijhydene.2015.04.155")[doi:10.1016/j.ijhydene.2015.04.155]. <ref-Langemann2015>],
 [U.~Babic, M.~Suermann, F.~N. Büchi, L.~Gubler, T.~J. Schmidt, , Journal of The Electrochemical Society 164 (2017) F387--F399. #link("https://doi.org/10.1149/2.1441704jes"). #link("https://doi.org/10.1149/2.1441704jes")[doi:10.1149/2.1441704jes]. <ref-Babic2017>],
 [A.~Gago, S.~Ansar, B.~Saruhan, U.~Schulz, P.~Lettenmeier, N.~Cañas, P.~Gazdzicki, T.~Morawietz, R.~Hiesgen, J.~Arnold, K.~Friedrich, , Journal of Power Sources 307 (2016) 815--825. #link("https://doi.org/10.1016/j.jpowsour.2015.12.071"). #link("https://doi.org/10.1016/j.jpowsour.2015.12.071")[doi:10.1016/j.jpowsour.2015.12.071]. <ref-Gago2016>],
 [S.~Sun, Z.~Shao, H.~Yu, G.~Li, B.~Yi, , Journal of Power Sources 267 (2014) 515--520. #link("https://doi.org/10.1016/j.jpowsour.2014.05.117"). #link("https://doi.org/10.1016/j.jpowsour.2014.05.117")[doi:10.1016/j.jpowsour.2014.05.117]. <ref-Sun2014>],
 [D.~D. Papadias, R.~K. Ahluwalia, J.~K. Thomson, H.~M. Meyer, M.~P. Brady, H.~Wang, J.~A. Turner, R.~Mukundan, R.~Borup, , Journal of Power Sources 273 (2015) 1237--1249. #link("https://doi.org/10.1016/j.jpowsour.2014.02.053"). #link("https://doi.org/10.1016/j.jpowsour.2014.02.053")[doi:10.1016/j.jpowsour.2014.02.053]. <ref-Papadias2015>],
 [X.~Wang, L.~Zhang, G.~Li, G.~Zhang, Z.-G. Shao, B.~Yi, , Electrochimica Acta 158 (2015) 253--257. #link("https://doi.org/10.1016/j.electacta.2015.01.140"). #link("https://doi.org/10.1016/j.electacta.2015.01.140")[doi:10.1016/j.electacta.2015.01.140]. <ref-Wang2015>],
 [H.-Y. Jung, S.-Y. Huang, P.~Ganesan, B.~N. Popov, , Journal of Power Sources 194 (2009) 972--975. #link("https://doi.org/10.1016/j.jpowsour.2009.06.030"). #link("https://doi.org/10.1016/j.jpowsour.2009.06.030")[doi:10.1016/j.jpowsour.2009.06.030]. <ref-Jung2009>],
 [H.~Zhang, M.~Hou, G.~Lin, Z.~Han, Y.~Fu, S.~Sun, Z.~Shao, B.~Yi, , International Journal of Hydrogen Energy 36 (2011) 5695--5701. #link("https://doi.org/10.1016/j.ijhydene.2011.01.154"). #link("https://doi.org/10.1016/j.ijhydene.2011.01.154")[doi:10.1016/j.ijhydene.2011.01.154]. <ref-Zhang2011>],
 [G.~Yang, S.~Yu, J.~Mo, Z.~Kang, Y.~Dohrmann, F.~A. List, J.~B. Green, S.~S. Babu, F.-Y. Zhang, , Journal of Power Sources 396 (2018) 590--598. #link("https://doi.org/10.1016/j.jpowsour.2018.06.078"). #link("https://doi.org/10.1016/j.jpowsour.2018.06.078")[doi:10.1016/j.jpowsour.2018.06.078]. <ref-Yang2018>],
 [P.~Lettenmeier, R.~Wang, R.~Abouatallah, F.~Burggraf, A.~S. Gago, K.~A. Friedrich, , Journal of The Electrochemical Society 163 (2016) F3119--F3124. #link("https://doi.org/10.1149/2.0141611jes"). #link("https://doi.org/10.1149/2.0141611jes")[doi:10.1149/2.0141611jes]. <ref-Lettenmeier2016>],
 [A.~Singh, B.~S. De, S.~Singh, S.~P. Thota, M.~Khalid, S.~Shahgaldi, , International Journal of Hydrogen Energy 106 (2025) 1029--1040. #link("https://doi.org/10.1016/j.ijhydene.2025.02.047"). #link("https://doi.org/10.1016/j.ijhydene.2025.02.047")[doi:10.1016/j.ijhydene.2025.02.047]. <ref-Singh2025>],
 [Z.~Kang, J.~Mo, G.~Yang, Y.~Li, D.~A. Talley, S.~T. Retterer, D.~A. Cullen, T.~J. Toops, M.~P. Brady, G.~Bender, B.~S. Pivovar, J.~B. Green, F.-Y. Zhang, , Applied Energy 206 (2017) 983--990. #link("https://doi.org/10.1016/j.apenergy.2017.09.004"). #link("https://doi.org/10.1016/j.apenergy.2017.09.004")[doi:10.1016/j.apenergy.2017.09.004]. <ref-Kang2017a>],
 [Z.~Kang, J.~Mo, G.~Yang, S.~T. Retterer, D.~A. Cullen, T.~J. Toops, J.~B. Green, Jr, M.~M. Mench, F.-Y. Zhang, , Energy & Environmental Science 10 (2017) 166--175. #link("https://doi.org/10.1039/c6ee02368a"). #link("https://doi.org/10.1039/c6ee02368a")[doi:10.1039/c6ee02368a]. <ref-Kang2017b>],
 [C.~Liu, M.~Carmo, G.~Bender, A.~Everwand, T.~Lickert, J.~L. Young, T.~Smolinka, D.~Stolten, W.~Lehnert, , Electrochemistry Communications 97 (2018) 96--99. #link("https://doi.org/10.1016/j.elecom.2018.10.021"). #link("https://doi.org/10.1016/j.elecom.2018.10.021")[doi:10.1016/j.elecom.2018.10.021]. <ref-Liu2018>],
 [C.~Liu, K.~Wippermann, M.~Rasinski, Y.~Suo, M.~Shviro, M.~Carmo, W.~Lehnert, , ACS Applied Materials & Interfaces 13 (2021) 16182--16196. #link("https://doi.org/10.1021/acsami.0c20690"). #link("https://doi.org/10.1021/acsami.0c20690")[doi:10.1021/acsami.0c20690]. <ref-Liu2021>],
 [C.~Rakousky, U.~Reimer, K.~Wippermann, M.~Carmo, W.~Lueke, D.~Stolten, , Journal of Power Sources 326 (2016) 120--128. #link("https://doi.org/10.1016/j.jpowsour.2016.06.082"). #link("https://doi.org/10.1016/j.jpowsour.2016.06.082")[doi:10.1016/j.jpowsour.2016.06.082]. <ref-Rakousky2016>],
 [C.~Rakousky, G.~P. Keeley, K.~Wippermann, M.~Carmo, D.~Stolten, , Electrochimica Acta 278 (2018) 324--331. #link("https://doi.org/10.1016/j.electacta.2018.04.154"). #link("https://doi.org/10.1016/j.electacta.2018.04.154")[doi:10.1016/j.electacta.2018.04.154]. <ref-Rakousky2018>],
 [P.~Lettenmeier, R.~Wang, R.~Abouatallah, B.~Saruhan, O.~Freitag, P.~Gazdzicki, T.~Morawietz, R.~Hiesgen, A.~S. Gago, K.~A. Friedrich, , Scientific Reports 7 (2017) 44035. #link("https://doi.org/10.1038/srep44035"). #link("https://doi.org/10.1038/srep44035")[doi:10.1038/srep44035]. <ref-Lettenmeier2017>],
 [S.~Stiber, M.~Hehemann, M.~Carmo, M.~Müller, K.~E. Ayers, C.~Capuano, N.~Danilovic, T.~Morawietz, I.~Biswas, P.~Gazdzicki, J.~Heger, A.~S. Gago, K.~A. Friedrich, , Advanced Energy and Sustainability Research 3 (2022). #link("https://doi.org/10.1002/aesr.202200024"). #link("https://doi.org/10.1002/aesr.202200024")[doi:10.1002/aesr.202200024]. <ref-Stiber2022a>],
 [S.~Stiber, N.~Sata, T.~Morawietz, S.~A. Ansar, T.~Jahnke, J.~K. Lee, A.~Bazylak, A.~Fallisch, A.~S. Gago, K.~A. Friedrich, , Energy & Environmental Science 15 (2022) 109--122. #link("https://doi.org/10.1039/d1ee02112e"). #link("https://doi.org/10.1039/d1ee02112e")[doi:10.1039/d1ee02112e]. <ref-Stiber2022b>],
 [A.~Kellenberger, N.~Vaszilcsin, D.~Duca, M.~L. Dan, N.~Duteanu, S.~Stiber, T.~Morawietz, I.~Biswas, S.~A. Ansar, P.~Gazdzicki, F.~J. Wirkert, J.~Roth, U.~Rost, M.~Brodmann, A.~S. Gago, K.~A. Friedrich, , Materials 15 (2022) 1628. #link("https://doi.org/10.3390/ma15051628"). #link("https://doi.org/10.3390/ma15051628")[doi:10.3390/ma15051628]. <ref-Kellenberger2022>],
 [H.~Cheng, H.~Luo, X.~Wang, Z.~Pan, Q.~Zhao, C.~Dong, X.~Li, , International Journal of Hydrogen Energy 48 (2023) 38557--38568. #link("https://doi.org/10.1016/j.ijhydene.2023.06.177"). #link("https://doi.org/10.1016/j.ijhydene.2023.06.177")[doi:10.1016/j.ijhydene.2023.06.177]. <ref-Cheng2023>],
 [Y.~Yan, T.~Li, H.~Zhang, Y.~Chen, T.~Zhang, , Journal of Power Sources 614 (2024) 235051. #link("https://doi.org/10.1016/j.jpowsour.2024.235051"). #link("https://doi.org/10.1016/j.jpowsour.2024.235051")[doi:10.1016/j.jpowsour.2024.235051]. <ref-Yan2024>],
 [H.~Ye, Z.~Tu, S.~Li, , Journal of Power Sources 595 (2024) 234052. #link("https://doi.org/10.1016/j.jpowsour.2024.234052"). #link("https://doi.org/10.1016/j.jpowsour.2024.234052")[doi:10.1016/j.jpowsour.2024.234052]. <ref-Ye2024>],
 [W.~Sun, Y.~Lv, J.~Gao, Q.~Feng, B.~Jia, F.~Ma, , Journal of Material Science and Technology 210 (2025) 86--96. #link("https://doi.org/10.1016/j.jmst.2024.05.038"). #link("https://doi.org/10.1016/j.jmst.2024.05.038")[doi:10.1016/j.jmst.2024.05.038]. <ref-Sun2024>],
 [N.~Rojas, M.~Sánchez-Molina, G.~Sevilla, E.~Amores, E.~Almandoz, J.~Esparza, M.~R.~C. Vivas, C.~Colominas, , International Journal of Hydrogen Energy 46 (2021) 25929--25943. #link("https://doi.org/10.1016/j.ijhydene.2021.03.100"). #link("https://doi.org/10.1016/j.ijhydene.2021.03.100")[doi:10.1016/j.ijhydene.2021.03.100]. <ref-Rojas2021>],
 [S.~Lædre, L.~Mendizabal, O.~E. Kongstein, A.~Oedegaard, H.~Karoliussen, F.~Seland, , Journal of The Electrochemical Society 169 (2022) 034504. #link("https://doi.org/10.1149/1945-7111/ac56a3"). #link("https://doi.org/10.1149/1945-7111/ac56a3")[doi:10.1149/1945-7111/ac56a3]. <ref-Laedre2022>],
 [H.~Wakayama, K.~Yamazaki, , ACS Omega 6 (2021) 4161--4166. #link("https://doi.org/10.1021/acsomega.0c04786"). #link("https://doi.org/10.1021/acsomega.0c04786")[doi:10.1021/acsomega.0c04786]. <ref-Wakayama2021>],
 [H.~Wakayama, , Materials Research Express 11 (2024) 085501. #link("https://doi.org/10.1088/2053-1591/ad666e"). #link("https://doi.org/10.1088/2053-1591/ad666e")[doi:10.1088/2053-1591/ad666e]. <ref-Wakayama2024>],
 [J.~A. A.~S. Varela, I.~Fernandez, P.~D. Rodriguez, A.~Wennberg, M.~Panizo, , ECS Meeting Abstracts MA2024-01 (2024) 1814. #link("https://doi.org/10.1149/ma2024-01341814mtgabs"). #link("https://doi.org/10.1149/ma2024-01341814mtgabs")[doi:10.1149/ma2024-01341814mtgabs]. <ref-Varela2024>],
 [A.~Chabanon, A.~Michau, M.~L. Schlegel, D.~C. Gündüz, B.~Puga, F.~Miserque, F.~Schuster, H.~Maskrot, C.~Pareige, E.~Cadel, G.~Beainy, V.~Cloute-Cazalaa, S.~Narasimalu, B.~Yao, Z.~Dong, F.~Balbaud-Célérier, , Coatings 12 (2022) 727. #link("https://doi.org/10.3390/coatings12060727"). #link("https://doi.org/10.3390/coatings12060727")[doi:10.3390/coatings12060727]. <ref-Chabanon2022>],
 [H.~Okamoto, , Journal of Phase Equilibria and Diffusion 32 (2011) 473--474. #link("https://doi.org/10.1007/s11669-011-9935-5"). #link("https://doi.org/10.1007/s11669-011-9935-5")[doi:10.1007/s11669-011-9935-5]. <ref-Okamoto2011>],
 [A.~Kellenberger, D.~Duca, N.~Vaszilcsin, C.~M. Craciunescu, , International Journal of Electrochemical Science 15 (2020) 10664--10673. #link("https://doi.org/10.20964/2020.11.47"). #link("https://doi.org/10.20964/2020.11.47")[doi:10.20964/2020.11.47]. <ref-Kellenberger2020>],
 [T.~Li, Z.~Yan, Z.~Liu, Y.~Yan, Y.~Chen, , International Journal of Hydrogen Energy 46 (2021) 31382--31390. #link("https://doi.org/10.1016/j.ijhydene.2021.07.021"). #link("https://doi.org/10.1016/j.ijhydene.2021.07.021")[doi:10.1016/j.ijhydene.2021.07.021]. <ref-Li2021>],
)

]

#pagebreak()
#set text(size: 10pt)
#grid(columns: (1fr, 1fr), gutter: 6mm, [#figure(image("figures/Fig_1.svg", width: 100%),
  caption: [
    Schematic representation of the experimental setup for
    coating preparation. Sample positions 1, 2, 3, and 4 correspond to
    progressively closer distances to the Nb strip. For Ti--O coatings,
    the Nb strip was omitted.
  ]
)
<fig1>

#figure(contact-resistance(),
  caption: [
    Schematic diagrams of the experimental setups for (a) the ICR
    measurement and (b) the auxiliary measurement of
    $R_(upright(A u) \/ upright(G D L))$, representing the contact
    resistance between the gold-coated electrode and the GDL.
  ]
)
<fig2>], [#figure(image("figures/Fig_3.svg", width: 100%),
  caption: [
    The ternary plot depicts the elemental compositions of the
    upper layers for all prepared coatings. Black triangles, red
    diamonds, green circles, and purple squares represent layers
    prepared at oxygen partial pressures, $p_(upright(o x))$, of 0, 3,
    5, and 8~mPa, respectively.
  ]
)
<fig3>])

#pagebreak()

#grid(columns: (1fr, 1fr), gutter: 6mm, [#figure(image("figures/Fig_4.svg", width: 100%),
  caption: [
    X-ray diffraction (XRD) patterns of the upper layers within
    the examined compositional space. The patterns are grouped according
    to the oxygen partial pressure, $p_(upright(o x))$, applied during
    deposition (0, 3, 5, and 8~mPa) and are arranged vertically based on
    the Nb content in the metal fraction, expressed as
    $upright(N b) \/ \( upright(T i) + upright(N b) \)$. Reflections of
    the hexagonal $alpha$-Ti phase are denoted by black squares, while
    those of the substoichiometric cubic TiO$""_x$ phase are marked by
    green circles. The Si substrate peak is denoted by "s".
  ]
)
<fig4>], [#figure(image("figures/Fig_5.svg", width: 100%),
  caption: [
    Electrical resistivity of coating upper layers visualized
    through a continuous color mapping within the examined compositional
    space. Data smoothing is applied to highlight overall trends within
    each panel. Triangle, diamond, circle, and square symbols indicate
    the elemental compositions of coatings with upper layers deposited
    at $p_(upright(o x))$ values of 0, 3, 5, and 8~mPa, respectively.
  ]
)
<fig5>

#figure(image("figures/Fig_6.svg", width: 100%),
  caption: [
    Cross-sectional SEM image of Ti--O coating deposited on a
    silicon substrate. The bottom layer was deposited at
    $p_(upright(o x)) = 0 med upright(m P a)$, while the upper layer was
    deposited at $p_(upright(o x)) = 5 med upright(m P a)$. The inset
    shows a top-view SEM image of the coating.
  ]
)
<fig6>])

#pagebreak()

#figure(image("figures/Fig_7.svg", width: 94.0%),
  caption: [
    Potentiodynamic polarization corrosion current density
    ($J_(upright(c o r r))$) and interfacial contact resistance (ICR) of
    coatings deposited on stainless steel substrates under various
    conditions. The indicated Nb content in the metal fraction,
    $upright(N b) \/ \( upright(T i) + upright(N b) \)$, and O content
    apply only to the upper layer, which is in direct contact with the
    electrolyte. Panels (a) and (c) show $J_(upright(c o r r))$ and ICR
    measured before the potentiostatic polarization, while panels (b)
    and (d) present the values after the potentiostatic polarization.
    The values are visualized using continuous color mapping across the
    compositional space of the upper layer. Data smoothing is applied to
    highlight overall trends within each panel. Triangle, diamond,
    circle, and square symbols indicate the elemental compositions of
    coatings with upper layers deposited at $p_(upright(o x))$ values of
    0, 3, 5, and 8~mPa, respectively. The complete set of data is
    provided in Supplementary Table~1a. The complete set of data is
    provided in Supplementary Table~1a.
  ]
)
<fig7>

#pagebreak()

#block(width: 49%)[
#figure(image("figures/Fig_8.svg", width: 100%),
  caption: [
    (a) Interfacial contact resistance (ICR) of Ti--O coating
    deposited on stainless steel substrate, with the upper layer
    deposited at $p_(upright(o x)) = 3 med upright(m P a)$, as a
    function of Pt overlayer thickness, measured before and after the
    potentiostatic polarization. (b) Tafel plot from potentiodynamic
    measurements before and after the potentiostatic polarization for
    the coating shown in panel (a), with and without a 5~nm Pt
    overlayer.
  ]
)
<fig8>
]

#pagebreak()

#figure(image("figures/Fig_9.svg", width: 94.0%),
  caption: [
    Potentiodynamic polarization corrosion current density
    ($J_(upright(c o r r))$) and interfacial contact resistance (ICR) of
    coatings deposited on stainless steel substrates under various
    conditions with a 5~nm Pt overlayer. The indicated Nb content in the
    metal fraction, $upright(N b) \/ \( upright(T i) + upright(N b) \)$,
    and O content apply only to the upper layer, which is in direct
    contact with the electrolyte. Panels (a) and (c) show
    $J_(upright(c o r r))$ and ICR measured before the potentiostatic
    polarization, while panels (b) and (d) present the values after the
    potentiostatic polarization. The values are visualized using
    continuous color mapping across the compositional space of the upper
    layer. Data smoothing is applied to highlight overall trends within
    each panel. Triangle, diamond, circle, and square symbols indicate
    the elemental compositions of coatings with upper layers deposited
    at $p_(upright(o x))$ values of 0, 3, 5, and 8~mPa, respectively.
    The complete set of data is provided in Supplementary Table~1b.
  ]
)
<fig9>
