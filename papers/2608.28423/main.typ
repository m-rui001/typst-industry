#import "layout.typ": article

#show: article

#title[High-performance silicon–metal laser welding resisting extreme conditions]

#align(center)[Jiawei Yin#super[1], Markus Blothe#super[1], Hagen P. Kohl#super[1], Christina Schütze#super[2], Stefan Nolte#super[1,3], and Maxime Chambonneau#super("1,*")]

#text(size: 8pt)[
  #super[1] Friedrich Schiller University Jena, Institute of Applied Physics, Abbe Center of Photonics, Jena, Germany \
  #super[2] IL Metronic Sensortechnik GmbH, Ilmenau-Unterpörlitz, Germany \
  #super[3] Fraunhofer Institute for Applied Optics and Precision Engineering IOF, Center of Excellence in Photonics, Jena, Germany \
  #super("*") #link("mailto:maxime.chambonneau@uni-jena.de")
]

#pad(x: 1.4em)[*Abstract.* Reliable material joining is essential for countless industrial
applications. While femtosecond laser welding provides a route beyond
conventional bonding methods, demonstrations of silicon--metal joints
are rare due to nonlinear propagation effects and have so far been
limited to shear joining strengths of a few MPa. Here, we demonstrate
high-strength silicon--Kovar laser welding using sub-nanosecond pulses.
By optimizing the focal position, the welding pattern, the laser
polarization, and the metal roughness, remarkable shear joining
strengths up to $15.8$~MPa are achieved. The silicon--metal joints
withstand temperatures of up to 500 °C and are hermetically sealed.
Together with the remarkable strength values, the resistance to harsh
environments underpins the applicability of silicon--metal welding in
various fields including aerospace, nuclear science, and metallurgy.]

#columns(2, gutter: 18pt)[
#heading(level: 1, numbering: none)[Introduction]
<sec:intro>
Since its inception in the 2000s, ultrafast laser welding has attracted
considerable attention because it can join a wide variety of similar
@Tamaki2005 and dissimilar @Ozeki2008 materials. The clean, fast, and
contactless aspects of this emerging technique make it a robust
alternative to traditional bonding methods such as adhesive bonding,
eutectic bonding, and soldering. Ultrafast laser welding relies on
propagation in a first workpiece, energy deposition at the interface
with a second workpiece, in turn leading to a temperature rise until
both materials melt, mix, and eventually create strong bonds when
resolidifying. It was shown to perform well with ultrashort laser pulses
when the first workpiece consists of a wide-bandgap material such as
glass, polymer, ceramic, or sapphire
@Mingareev2012@Carter2014@Zhang2015@Richter2015@Richter2016@Carter2017@Gstalter2017@Zhang2018@Penilla2019@Gstalter2019@Cvecek2019@Hecker2020a@Sahoo2020@Hecker2020b@Capodacqua2023@Dzipalski2024@Morawska2024@Huo2025@Jia2025@Jiang2025@Su2025@Li2025a@Li2025b@Wang2025b@Li2025@Ji2025@Yu2026.
However, until recently, this technique was not applicable in the
silicon--metal configuration @Chambonneau2021a. This is due to
delocalized and decreased interfacial energy deposition as a consequence
of nonlinear propagation in silicon for excessively short laser pulses
@Zavedeev2016@Chanal2017@Mareev2020@Chambonneau2021b@Ganguly2024@Wang2025@Chambonneau2026@Xie2026.
Solutions that have led to through-silicon welding include
precompensating for the nonlinear focal shift @Chambonneau2021a,
enhancing the interfacial absorption with a metallic nanolayer
@Chambonneau2023, and employing continuous irradiation @Sari2008 or
nanosecond pulses @Sopena2022@vanAbeelen2026. Despite all these efforts,
in the silicon--metal laser-welding configuration, single-digit MPa
shear joining strengths have been demonstrated @Chambonneau2021a, and
their stability under extreme temperature conditions and vacuum
environment has not been investigated so far. \
In this article, we demonstrate silicon--metal laser welding with
sub-nanosecond pulses, which exhibits shear joining strengths up to
$15.8$~MPa, i.e., more than $7 times$ the preceding record of 2.2~MPa
@Chambonneau2021a. This achievement relies on an optimization of the
focal position, the welding pattern, the laser polarization, and the
metal roughness. The applicability of our technique to harsh-environment
conditions is then studied. The silicon--metal joints combine high
mechanical strength with thermal resistance up to 500 °C and hermetic
sealing. The high strength values together with the temperature
resistance and hermeticity indicate that the proposed silicon--metal
laser welding technique could be implemented in industrial sectors such
as aerospace, where joints are exposed to extreme conditions and other
joining techniques may underperform.

= Experimental methods
<sec:expmethods>
Laser welding experiments have been performed with the setup illustrated
in Fig.~#ref(<fig:Fig1>, supplement: none), which relies on a Tm:doped fiber laser delivering
620-ps pulses at a center wavelength of 1960~nm and a repetition rate of
$Omega = 6.25$~kHz to avoid cumulative effects on a pulse-to-pulse
basis. The laser pulses exhibiting Gaussian temporal and spatial
intensity profiles are focused with an objective lens of numerical
aperture $upright(N A) = 0.26$ (Mitutoyo, M Plan Apo NIR $10 times$),
leading to a focal spot diameter at $1 \/ e^2$ of $2 w_0 = 6.8$~$mu$m,
and a confocal parameter of $2 z_0 = 170.9$~$mu$m, as calculated in
silicon with our vectorial model #emph[InFocus] @Li2021@Li2021a. The
input pulse energy $E_(upright(i n))$, measured after the objective
lens, is adjusted using a half-wave plate combined with a linear
polarizer. \
The beam is focused near the interface between a microelectronic-grade
crystalline silicon sample \[undoped, $5 times 5 times 1$~mm$""^3$,
(100)-oriented, double-side polished, total thickness variation
$< 10$~$mu$m, bow $< 30$~$mu$m, and wrap $< 30$~$mu$m\], and a Kovar
plate (12.5-mm thick cylinder with a diameter of 30~mm). Kovar, i.e., an
iron--nickel--cobalt alloy originally developed to exhibit a coefficient
of thermal expansion similar to that of borosilicate glass, has been
selected as a metal of interest because of its high melting point and
low thermal expansivity, as discussed in Section~@ssec:temperature. The
optical contact between the two polished workpieces is guaranteed by
cleaning the surface with isopropyl alcohol before laser processing, and
maintaining a constant force by means of a clamping system throughout
welding. The clamping system described in Refs.~@Li2025a@Li2025b
consists of a metal plate and a 6.5-mm thick optical glass plate
(measured transmission of $90 %$ including linear absorption and Fresnel
losses at both air--glass interfaces), whose separation can be adjusted
to clamp the silicon--metal stack tightly between them. \
Different welding patterns have been investigated. To compare these
patterns, a constant scanning speed of $v = 2$~mm/s was selected, which
corresponds to $N = 2 w_0 Omega \/ v = 21$ applied pulses per point of
the pattern. The samples and clamping system are positioned in the $x y$
plane perpendicular to the optical axis $z$ with a nanopositioning
system (Aerotech, ANT130-160-XY). The focusing objective lens is
positioned along the $z$ axis with another nanopositioning stage
(Aerotech, ANT130-060-L). A customized dark-field infrared (IR)
microscope working in reflection is employed for #emph[in-situ]
monitoring of the welding. This relies on broadband illumination emitted
by a quartz tungsten-halogen lamp (Thorlabs, QTH10/M) at a grazing angle
with respect to the samples. The light scattered at the silicon--metal
interface is collected by the same objective lens as the one used for
focusing the laser pulses, then transmitted by a dichroic mirror, and
finally directed to the IR detection unit consisting of a tube lens
(Thorlabs, TTL200-S8) and an InGaAs camera (Xenics, Bobcat 320). The
latter represents a major improvement compared to our previous work
where a silicon-based camera was used to position the geometrical focus
with respect to the entrance surface of silicon
@Chambonneau2021a@Chambonneau2023. Indeed, the InGaAs-based sensor
allows for direct through-silicon #emph[in-situ] observation of
modifications at the interface (defined as $z = 0$). \

#figure(image("source/Figs/Fig1.png"),
  caption: [
    Schematic of the laser welding setup.
  ]
)
<fig:Fig1>

After welding, the samples are bonded together, as shown in
Fig.~#ref(<fig:Fig2>, supplement: none)\(a). The welding performance is evaluated #emph[ex-situ]
in terms of shear joining strength. Breaking tests are performed by
applying a force onto the edge of the silicon sample with an indenter
until it is separated from the metal. The corresponding peak breaking
force is recorded by a force gauge (RS PRO, 111-3690). The shear joining
strength is obtained by calculating the ratio between the measured peak
breaking force and the apparent welded area, corresponding to the
laser-written tracks and determined with #emph[ex-situ] optical
microscopy characterization, which are consistent with #emph[in-situ]
observations \[Fig.~#ref(<fig:Fig2>, supplement: none)\(b) and (c)\]. For each experimental
condition involving shear-strength measurements, at least five
independent silicon--metal joints were produced and mechanically tested.
The corresponding data points reported throughout the manuscript
represent the average shear joining strength, while the error bars
indicate the standard deviation over these independent measurements. \
Prior to laser welding, the Kovar samples were polished to obtain
different surface finishes using a polishing machine (Struers,
LaboForce-100) with abrasives of different grain sizes. A
three-dimensional optical surface profiler (Zygo, NewView 9000) is
employed after polishing to determine the root mean square (RMS) surface
roughness $R_q$ over an $862 times 862$-$mu$m$""^2$ area. The typical
metal roughness $R_q$ lies in the 2.8--466~nm range. \
To evaluate the thermal resistance of the welds, high-temperature
exposure is performed in a furnace \[Linn Elektro Therm,
FK-270/270/420/1300 (SO 1419)\] for one hour at a set temperature $T$ in
the 20--700 °C range. After high-temperature exposure, the samples cool
down to room temperature for an additional hour before measuring the
shear joining strength. \
Finally, to determine the hermeticity of the joints, a 1-mm diameter
hole was drilled through five metal samples. One surface was then
polished prior to the welding, so that the silicon sample fully covers
one end of the hole. The hermeticity of the welds was then evaluated
with helium leak tests using a vacuum-box configuration with helium
spraying on the opposite side of the joint, corresponding to principle
B.2.2 of prEN 1779:2024 / DIN EN 1779:2024 draft @standardleakrate. The
leak rate was quantified using a helium mass-spectrometer leak detector
(Leybold GmbH, PHOENIX 4.0 Quadro Wet). \

#figure(image("source/Figs/Fig2.png"),
  caption: [
    Typical silicon--metal welds. (a) Photograph of four
    $5 times 5$~mm$""^2$ silicon samples joined to Kovar. (b)
    #emph[In-situ] infrared (IR) microscopy, and (c) #emph[ex-situ]
    optical microscopy images of the interface. The observations in (b)
    and (c) are performed through silicon, and on the silicon sample
    after sample separation, respectively. Pulse energy:
    $E_(upright(i n)) = 6$~$mu$J, focal position: $z = 380$~$mu$m,
    welding pattern: grid, laser polarization: linear, metal roughness:
    $R_q = 2.8$~nm.
  ]
)
<fig:Fig2>

= Results and Discussion
<sec:resultsdiscussion>
== Optimizing the mechanical performance
<ssec:optimization>
In this section, various laser and material parameters are optimized to
obtain silicon--metal joints with the best performance in terms of shear
joining strength. These parameters include the focal position, the
welding pattern, the laser polarization as well as the metal roughness.
All the experiments have been carried out for an input pulse energy of
$E_(upright(i n)) = 6$~$mu$J, which corresponds to the maximum value our
setup can deliver. Two aspects motivated the choice of the highest
possible pulse energy. First, as shown in our previous study
@Chambonneau2021a, the energy reaching the silicon--metal interface
increases with $E_(upright(i n))$, whereas the maximum fluence saturates
due to nonlinear propagation effects. Second, to ensure a homogeneous
welding seam, the applied pulse energy has to be much higher than the
interfacial modification threshold. This aspect has been verified with
modification tests (see Appendix~A). The interfacial modification
threshold is $675 plus.minus 25$~nJ, and a modification probability of
$100 %$ is reached for $850 plus.minus 50$~nJ---both values being
significantly below $E_(upright(i n)) = 6$~$mu$J.

=== Focal position
<sssec:energy_z>
In our previous work, we have shown that a precompensation for the
nonlinear focal shift was required to optimize energy deposition at the
silicon--metal interface with 10-ps pulses @Chambonneau2021a. This is
due to nonlinear propagation effects---in particular, the Kerr effect.
By employing much longer pulses (620~ps) in the present study, the laser
intensity is decreased, and one could thus expect the propagation
nonlinearities to be less severe. \
To examine this, we have carried out silicon--metal welding experiments
for various focal positions $z$ in silicon. The silicon--metal interface
is defined as $z = 0$, and $z > 0$ corresponds to a focus theoretically
positioned after the silicon sample, i.e., in the metal. The welding
results are displayed in terms of shear joining strength in
Fig.~#ref(<fig:Fig3>, supplement: none). When the geometrical focus is positioned at the
interface ($z = 0$), a shear joining strength of 9.4~MPa is already
measured. The strength value is further increased when the focus is
moved downstream along the beam path ($0 < z lt.eq 380$~$mu$m), reaching
a peak value of 15.8~MPa for $z = 380$~$mu$m, before decreasing when the
focus is too far from the interface ($z > 380$~$mu$m). The optimal value
of $z = 380$~$mu$m is consistent with previous studies which have shown
that focal repositioning by several hundred micrometers can be required
to achieve laser welding in different material configurations
@Carter2017@Morawska2024@Huo2025. However, it must be emphasized that
the optimal $z$ value strongly depends on the laser parameters, such as
beam size, pulse energy and pulse duration, the materials employed, and
the mechanisms responsible for the focal shift. From an engineering
perspective, the need for a focal repositioning shown in Fig.~#ref(<fig:Fig3>, supplement: none)
is an important result as it shows that the performance of
silicon--metal welding can be improved by $68 %$ when the focal position
is $z = 380$~$mu$m compared to the non-optimal configuration $z = 0$. \
Two mechanisms that can both lead to a focal shift may explain the
existence of an optimal focusing depth. First, accounting for Fresnel
losses at the air--glass and glass--silicon interfaces, the peak power
after the front surface of the silicon sample is
$P_(upright(p e a k)) approx 7.4$~kW. Based on nonlinear refractive
index measurements
($n_2^(upright(S i)) approx 1.05 times 10^(- 17)$~m$""^2$/W
@Bristow2007), this power value is lower than the critical power for
self-focusing in silicon $P_(upright(c r)) approx 15.9$~kW. However,
this estimate only accounts for the instantaneous Kerr response, and
neglects the delayed medium response, which was shown to be
non-negligible for picosecond pulses @Chambonneau2026. Therefore, the
critical power for self-focusing could be lower than the
above-calculated value, and the Kerr effect may cause the nonlinear
focal shift analogously to Refs.~@Chambonneau2021a@Chambonneau2023. A
second mechanism that can cause the nonlinear focal shift is thermal
lensing. Indeed, in contrast to studies using 10-ps laser pulses
@Chambonneau2021a@Chambonneau2023, the pulse duration of 620~ps in this
work implies that heat is substantially generated during the pulse
@Sundaram2002@Gattass2008. The resulting heating raises the refractive
index, turning the heated zone into a time-dependent convex lens. \

#figure(image("source/Figs/Fig3.png"),
  caption: [
    Evolution of the shear joining strength as a function of
    the focal position $z$ in silicon. The repeatability error bars
    indicate the standard deviation on the measured shear joining
    strength. The value $z = 0$ corresponds to the silicon--metal
    interface, and $z > 0$ corresponds to a geometrical focus positioned
    in the metal. Pulse energy: $E_(upright(i n)) = 6$~$mu$J, welding
    pattern: grid, laser polarization: linear, metal roughness:
    $R_q = 2.8$~nm.
  ]
)
<fig:Fig3>

=== Welding pattern and laser polarization
<sssec:pattern>
Generally speaking, the welding pattern affects how residual stress
builds up and is distributed spatially and temporally between the two
workpieces @Richter2016. Early works suggested that an Archimedean
spiral pattern reduces stress accumulation @Carter2014\; this pattern
was therefore applied to different material configurations
@Carter2017@Li2025a@Li2025b. Nevertheless, a recent study suggested that
the spiral pattern was not the most appropriate pattern for optimizing
the shear joining strength, and that stronger bonds were created in
glass-ceramics with a grid pattern @Yu2026. Therefore, in our study
which aims at optimizing silicon--metal welding, it is necessary to
examine which pattern leads to the strongest welds. \
To do so, we consider five different patterns: rectangular spiral,
Archimedean spiral, point array, parallel lines, and grid. For all these
patterns, the welded area is similar (on the order of 9~mm$""^2$, i.e.,
$approx 36 %$ of the 25~mm$""^2$ available area corresponding to the
silicon sample dimensions). The results in terms of shear joining
strength are summarized in Fig.~#ref(<fig:Fig4>, supplement: none). Both rectangular and
Archimedean spiral patterns lead to a similar shear joining strength in
the 7.0--8.0~MPa range. The strength value is significantly increased
for the point array pattern (9.2~MPa) and the line pattern (12.9~MPa).
Finally, the shear joining strength reaches 15.8~MPa for the grid
pattern, consistent with recent observations in the glass-ceramic
configuration @Yu2026. \

#figure(image("source/Figs/Fig4.png"),
  caption: [
    Evolution of the shear joining strength as a function of
    the welding pattern. The repeatability error bars indicate the
    standard deviation on the measured shear joining strength. The red
    and blue points correspond to linear polarization (LP) and circular
    polarization (CP), respectively. Pulse energy:
    $E_(upright(i n)) = 6$~$mu$J, focal position: $z = 380$~$mu$m, metal
    roughness: $R_q = 2.8$~nm.
  ]
)
<fig:Fig4>

An important parameter governing energy deposition in laser--matter
interaction is the polarization, i.e., the direction of the electric
field. For the two patterns exhibiting the best performance (parallel
lines and grid), we have tested linear and circular polarization, as
shown with the red and blue data points in Fig.~#ref(<fig:Fig4>, supplement: none). For both
patterns, circular polarization underperforms linear polarization, with
$approx 25 %$ decrease in the shear joining strength. This is consistent
with the improved energy deposition with linear polarization compared to
circular polarization @Shin2022. Notably, for the parallel line pattern,
linear polarizations along and perpendicular to the writing direction
were tested (not shown here). The results are very similar for both
configurations, with a shear joining strength difference $< 8 %$, i.e.,
smaller than the error bars.

=== Metal roughness
<sssec:roughness>
In most experiments reported in this article, the silicon and metal
samples are in optical contact during the welding. The quality of the
optical contact depends essentially on the sample roughness. In this
section, microelectronics-grade polished silicon samples have been
joined to metal samples of various surface roughness values in the
$R_q = 2.8$--466~nm range. The performance of the corresponding welds in
terms of shear joining strength is displayed in Fig.~#ref(<fig:Fig5>, supplement: none). The
results unambiguously show that silicon--metal laser welding performs
better for smoother metal surfaces (best performance for
$R_q = 2.8$~nm), in good agreement with Refs.~@Richter2015@Li2025.
Interestingly, the shear joining strength scales logarithmically with
the roughness (see the dashed blue line in Fig.~#ref(<fig:Fig5>, supplement: none)). This implies
that a substantial effort to improve the surface roughness will result
in only a moderate improvement in welding performance. In addition, as
highlighted by the optical micrographs of the Kovar sample after sample
separation (insets in Fig.~#ref(<fig:Fig5>, supplement: none)), the welding seam is more
homogeneous for low $R_q$ values. The presence of randomly distributed
preexisting scratches strongly affects the generation of laser-induced
modifications. \

#figure(image("source/Figs/Fig5.png"),
  caption: [
    Evolution of the shear joining strength as a function of
    the root mean square (RMS) surface roughness $R_q$ of the metal
    sample. The repeatability error bars indicate the standard deviation
    on the measured shear joining strength. The blue dashed line is a
    logarithmic fit. The insets are optical micrographs of the welded
    area on the metal sample ($R_q = 2.8$~nm, 28.7~nm, and 133.4~nm)
    after sample separation. The spatial scale applies to all images.
    Pulse energy: $E_(upright(i n)) = 6$~$mu$J, focal position:
    $z = 380$~$mu$m, welding pattern: grid, laser polarization: linear.
  ]
)
<fig:Fig5>

The trends in Fig.~#ref(<fig:Fig5>, supplement: none) can be ascribed to loss of optical contact
for excessive $R_q$ values. Indeed, the presence of an interfacial air
gap has two major consequences. First, Fresnel reflection at the
silicon--air interface causes a loss of $approx 30 %$ of the pulse
energy before it reaches the metal. Second, air is a near-perfect
thermal insulator which may limit heat diffusion, and thus material
transfer between silicon and metal, in turn hindering the formation of
strong bonds between the two materials. Beyond these aspects, Li
#emph[et al.] recently proposed a qualitative scenario for laser joining
across different interfacial gaps, supported by scanning electron
microscopy, energy-dispersive X-ray spectroscopy, and strength
measurements @Li2025. This scenario describes a transition from smooth
bonding for small gaps, to spallation-assisted metal eruption and
mechanical interlocking for intermediate gaps, and finally to
crack-dense, defective joints for larger gaps. Although this scenario
was proposed for sapphire--Invar laser welding, similar processes may
also exist for silicon--Kovar laser welding.

=== Comparison with traditional bonding techniques
<sssec:othertechniques>
In industry, traditional techniques conventionally used to bond silicon
to metal include adhesive bonding, eutectic bonding, and soldering. In
the present study, the optimized laser-welded joints exhibit a shear
joining strength of 15.8~MPa, representing a substantial increase over
the previously reported maximum of 2.2~MPa for silicon--metal laser
welding @Chambonneau2021a. Table~#ref(<tab:othertechniques>, supplement: none) compares this
value with representative shear strengths reported for adhesive bonding,
eutectic bonding, and soldering involving silicon. The values were
obtained for different material configurations and test geometries and
are therefore intended as approximate technological benchmarks rather
than strictly equivalent measurements. The shear joining strength
achieved by laser welding falls within the representative ranges
reported for all three conventional bonding techniques. \

#figure(
  align(center)[#table(
    columns: 3,
    align: (left,left,center,),
    table.header([#strong[Bonding technique]], [#strong[Reported shear
      strength (MPa)]], [#strong[Reference]],),
    table.hline(),
    [Laser welding], [15.8], [Present study],
    [Adhesive
    bonding], [2.0--19.2], [@Reuter2005@Stankovic2011@Keyvaninia2013@Bleiker2017],
    [Eutectic bonding], [4.2--20.4], [@Jing2010@Abouie2012],
    [Soldering], [7.9--43.0], [@Kolenak2016@Kolenak2021@Ding2022@Li2023@Xue2024],
  )]
  , caption: [Representative shear joining strengths reported for
  selected bonding techniques involving silicon.]
  , kind: table
  ) <tab:othertechniques>
A common feature of adhesive bonding, soldering, and eutectic bonding is
that the joint is mediated by an intentionally introduced bonding
material, such as a polymer adhesive, a solder alloy, or a
eutectic-forming metallic layer. Although these approaches are well
established, the intermediate material may introduce limitations under
harsh-environment operation. Polymer adhesives may undergo thermal
degradation, aging, moisture uptake, or outgassing, whereas solders may
soften, creep, or remelt when the temperature approaches their melting
range. Eutectic and soldered interfaces may also undergo microstructural
evolution through diffusion and interfacial reactions during prolonged
thermal exposure. In addition, an intermediate layer introduces a third
coefficient of thermal expansion into the assembly, which may generate
additional thermomechanical stresses during temperature changes and
compromise the integrity of the joint. In contrast, a key advantage of
direct laser welding is that the silicon--metal joint is formed without
introducing an intermediate bonding layer. This simplifies the material
stack and avoids failure mechanisms directly associated with such added
layers. The thermal resistance and hermeticity of the silicon--metal
joints produced by laser welding are examined in the following sections.
\

== Thermal resistance
<ssec:temperature>
In Section~@ssec:optimization, the focal position, the welding pattern,
the laser polarization as well as the metal roughness have been
optimized. For the optimized parameters resulting in a shear joining
strength of 15.8~MPa (pulse energy: $E_(upright(i n)) = 6$~$mu$J, focal
position: $z = 380$~$mu$m, welding pattern: grid, laser polarization:
linear, metal roughness: $R_q = 2.8$~nm), the resilience to
high-temperature environments is evaluated. This step is critical for
assessing the suitability of the proposed technique for operation in
harsh environments. Assessing the high-temperature stability of the
fabricated silicon--metal bond is relevant for numerous
harsh-environment applications, including jet- and rocket-engine
diagnostics, nuclear instrumentation, and metallurgical sensors. \
To assess weld lifetime under thermal loading, analogous studies on the
thermal resistance of laser-joined materials have relied on thermal
cycling with relatively low maximum temperatures ($< 200$ °C)
@Carter2017@Morawska2024@Dzipalski2024@Huo2025. The weld survival
results strongly depend on the difference in the linear coefficient of
thermal expansion $alpha$ between the two joined materials. This
conclusion is reasonable as the laser-created bonds between two
materials expanding differently with a temperature change are likely to
be weakened. For instance, in the case of fused silica joined to
aluminum, the ratio between the coefficients of thermal expansion is
$alpha_(upright(A l)) \/ alpha_(upright(S i O_2)) = 47$ @Carter2017. In
contrast, as highlighted in Table~#ref(<tab:thermalproperties>, supplement: none) where the
thermal properties of silicon and Kovar are summarized, the ratio
between the coefficients of thermal expansion at room temperature
$alpha_(upright(K o v a r)) \/ alpha_(upright(S i)) = 1.9$ is
drastically lower. Moreover, when the temperature is increased in the
100--700 °C range, the ratio
$alpha_(upright(K o v a r)) \/ alpha_(upright(S i))$ lies in the
1.5--2.4 range @Watanabe2004@LamineriesMATTHEY, i.e., of the same order
of magnitude as at room temperature. This suggests that the
silicon--metal welds produced in our study should better withstand
high-temperature exposure than fused silica--aluminum welds. \

#figure(
  align(center)[#table(
    columns: 3,
    align: (left,center,center,),
    table.header([#strong[Material]], [#strong[silicon]], [#strong[Kovar]],),
    table.hline(),
    [Melting point (°C)], [1414 @Yamaguchi2002], [1450 @Chen2023],
    [Coefficient of thermal expansion ($10^(- 6) \/$°C)], [2.6
    @Watanabe2004], [5.0 @Zanchetta1995],
    [Thermal diffusivity (mm$""^2$/s)], [86 @Shanks1963], [4.2
    @LamineriesMATTHEY],
  )]
  , caption: [Thermal properties of silicon and Kovar at room
  temperature.]
  , kind: table
  ) <tab:thermalproperties>
To establish the thermal resistance, instead of thermal cycling, we rely
on a one-hour exposure to a set temperature in a furnace followed by a
one-hour cooling period to room temperature. The corresponding results
are shown in Fig.~#ref(<fig:Fig6>, supplement: none) in terms of shear joining strength for
various exposure temperatures. Taking measurements of the bonding
strength at room temperature ($T = 20$ °C) as a reference, the
temperature dependence can be divided into three regimes. First,
increasing the temperature up to $T = 300$ °C leads to a decrease in
shear joining strength by $approx 27 %$. This may be attributed to the
thermal expansion mismatch between silicon and Kovar, which can activate
precursor defects, microcracks, or weak interfacial regions formed
during laser welding, as suggested by optical microscopy observations of
the Kovar surface after thermal exposure at different temperatures (see
Appendix~B). In the second regime, for higher temperatures
($T = 300$--500 °C), the shear joining strength progressively returns to
values comparable to the reference case at room temperature. In this
intermediate temperature range, stress relief and annealing effects may
partially compensate for the aforementioned thermally induced damage.
The interfacial region may become mechanically more stable after heat
treatment, so the final room-temperature strength recovers. Finally, in
the third regime, for $T gt.eq 550$ °C, the shear joining strength
abruptly drops to sub-MPa values, which indicates that the silicon and
metal parts are no longer effectively joined after high-temperature
exposure. At these temperatures, accumulated thermomechanical stress,
interfacial cracking, metal oxidation, and oxide growth may contribute
to bond failure. To conclude, the silicon--metal laser joints survive a
one-hour exposure up to $T = 500$ °C with residual room-temperature
shear joining strength comparable to the as-welded reference, but they
lose practical joining strength after exposure to $T > 500$ °C. Thus,
these silicon--metal welds are compatible with high-temperature
applications. \

#figure(image("source/Figs/Fig6.png"),
  caption: [
    Evolution of the shear joining strength as a function of
    the exposure temperature. The repeatability error bars indicate the
    standard deviation on the measured shear joining strength. Pulse
    energy: $E_(upright(i n)) = 6$~$mu$J, focal position:
    $z = 380$~$mu$m, welding pattern: grid, laser polarization: linear,
    metal roughness: $R_q = 2.8$~nm, duration in furnace: one hour.
  ]
)
<fig:Fig6>

== Hermeticity
<ssec:hermeticity>
The second aspect considered concerns high-vacuum operation and
hermetic-sealing requirements. Assessing the leak rate of silicon--metal
welds is particularly relevant for applications in which long-term
isolation from gases, moisture, or aggressive environments is critical,
including space and aerospace electronics, implantable medical devices,
particle-physics detectors, vacuum-packaged micro-electromechanical
systems (MEMS), quantum photonic devices, and underwater packages. \
As illustrated in Fig.~#ref(<fig:Fig7>, supplement: none)\(a), the hermeticity of the
silicon--metal joints was evaluated using helium leak testing, with each
joint sealing a vacuum chamber connected to a mass spectrometer while
helium was sprayed onto its opposite side. Helium was selected as a
highly sensitive tracer gas because its low molar mass makes it
particularly effective for detecting small geometrical leak paths,
especially in the molecular-flow regime. For these tests, a 1-mm
diameter cylindrical hole is drilled in the metal plate, with the
silicon sample fully covering one end of the hole \[see
Fig.~#ref(<fig:Fig7>, supplement: none)\(b) and (c)\]. This implies that imperfect contact would
allow helium atoms to pass through the hole and eventually be detected
by the mass spectrometer. \
However, this is not the case here, and the silicon--metal joints are in
fact leak-proof. All five tested joints showed no helium leak above the
detection limit of $Q = 1.0 times 10^(- 12)$~mbar~L/s, defined as
$Q = P d V \/ d t$, where $P$ is the pressure and $d V \/ d t$ is the
equivalent volumetric flow rate of the leaked helium. The measured upper
bound thus corresponds to only $approx 30$~nanoliters of helium per year
at atmospheric pressure, making it completely negligible for most vacuum
applications. The leak rate $< 1.0 times 10^(- 12)$~mbar~L/s therefore
indicates ultra-high hermeticity within the detection limit of the
measurements. \

#figure(image("source/Figs/Fig7.png"),
  caption: [
    Hermetic silicon--metal welds. (a) Schematic of the
    experimental setup for hermeticity measurements. (b) Front and (c)
    back side of the tested silicon--metal welds. Pulse energy:
    $E_(upright(i n)) = 6$~$mu$J, focal position: $z = 380$~$mu$m,
    welding pattern: grid, laser polarization: linear, metal roughness:
    $R_q = 2.8$~nm.
  ]
)
<fig:Fig7>

To benchmark this performance, leak-rate values reported in the
literature for selected laser-joined material configurations are
compared with the present silicon--metal welds in Table~#ref(<tab:leakrate>, supplement: none).
Because these studies involve different material systems, geometries,
test gases, and measurement protocols, the comparison should be
interpreted as an order-of-magnitude benchmark rather than as a strict
ranking. Within this limitation, the upper bound
$Q = 1.0 times 10^(- 12)$~mbar~L/s reported here compares favorably with
previous laser-joined ceramic--ceramic, glass--glass, glass--silicon,
and glass-ceramic--glass-ceramic systems
@Penilla2019@Su2025@Wang2025b@Yu2026. It is at least one order of
magnitude lower than the best literature value listed in
Table~#ref(<tab:leakrate>, supplement: none), and up to six orders of magnitude lower than the
value reported for glass-ceramic laser sealing.

#figure(
  align(center)[#table(
    columns: 3,
    align: (left,left,center,),
    table.header([#strong[Reference]], [#strong[Laser-joined
      materials]], [#strong[Leak rate (mbar~L/s)]],),
    table.hline(),
    [Present study], [silicon--Kovar], [$< 1.0 times 10^(- 12)$],
    [Penilla #emph[et al.]
    @Penilla2019], [ceramic--ceramic], [$1.3 times 10^(- 10)$],
    [Su #emph[et al.] @Su2025], [glass--glass], [$1.0 times 10^(- 11)$],
    [Wang #emph[et al.]
    @Wang2025b], [glass--silicon], [$7.4 times 10^(- 9)$],
    [Yu #emph[et al.]
    @Yu2026], [glass-ceramic--glass-ceramic], [$1.2 times 10^(- 6)$],
  )]
  , caption: [Leak rates reported for selected laser-joined material
  systems.]
  , kind: table
  ) <tab:leakrate>
#heading(level: 1, numbering: none)[Conclusion]
<sec:conclusion>
To summarize, successful silicon--metal laser welding exhibiting shear
joining strengths up to $15.8$~MPa has been demonstrated. To reach such
high strengths, we optimized multiple laser and material parameters. At
the selected input pulse energy of $E_(upright(i n)) = 6$~$mu$J, for
which a $100 %$ modification probability is reached, the focus is
positioned at $z = 380$~$mu$m below the silicon--metal interface,
ensuring optimal energy deposition at the interface. The highest
strength values are obtained for a grid pattern under linear laser
polarization. We have shown that minimizing the metal roughness $R_q$
down to 2.8~nm ensures an excellent contact between the two workpieces
throughout welding, and thus the best welding performance. After this
optimization step, high-temperature exposure tests revealed that the
silicon--metal welds are still operational for temperatures up to
500 °C. Finally, hermeticity measurements showed a leak rate
$< 1.0 times 10^(- 12)$~mbar~L/s, highlighting that the silicon--metal
welds are hermetically sealed. \
These results in terms of shear joining strength offer an alternative to
traditional joining methods (e.g., adhesive bonding, eutectic bonding,
soldering). As silicon and metals are the cornerstones of
microelectronics, the proposed welding technique should find multiple
applications in this field. Beyond standard microelectronics,
high-temperature-resistant and hermetic silicon--metal joints may be of
utmost importance in harsh-environment applications such as aerospace.

#heading(level: 1, numbering: none)[Data availability]
<data-availability>
The data that support the results of this article are available within
the manuscript.

#heading(level: 1, numbering: none)[Funding]
<funding>
This research has received financial support from:

- the German Federal Ministry of Research, Technology and Space
  \[Bundesministerium für Forschung, Technologie und Raumfahrt (BMFTR)\]
  through the RUBIN-UKPiño project (Grants no.~03RU2U033H, and
  03RU2U032F).

- the German Research Foundation \[Deutsche Forschungsgemeinschaft
  (DFG)\], through the Silabus (Grant no.~530105422), and the Inseption
  (Grant no.~545531713) projects.

#heading(level: 1, numbering: none)[Acknowledgments]
<acknowledgments>
The authors gratefully acknowledge the technical support of
Markus~Walther (Institute of Applied Physics, Jena, Germany) for cutting
samples, Eric~Schadow (Fraunhofer IOF, Jena, Germany) for roughness
measurements, and Qingfeng~Li (Thorlabs GmbH, Bergkirchen, Germany) for
designing the clamping system.

#heading(level: 1, numbering: none)[Competing interests]
<competing-interests>
The authors declare no competing interests.

#heading(level: 1, numbering: none)[Author contributions]
<author-contributions>
J.Y. performed the welding experiments conceived by M.C. and carried out
the strength measurements. M.B. and M.C. designed and implemented the
experimental setup. H.P.K. provided technical assistance with polishing
and with the clamping system. C.S. performed the hermeticity
measurements. S.N. and M.C. supervised the research and acquired
funding. M.C. prepared the manuscript with contributions from all
authors.

#counter(figure.where(kind: image)).update(0)
#set figure(numbering: "S1")
#counter(math.equation).update(0)
#set math.equation(numbering: "(S1)")

#heading(level: 1, numbering: none)[Appendix~A. Modification
probability]
<appendix-a.-modification-probability>
A prerequisite for a continuous and homogeneous welding pattern is that
irradiation under the selected processing conditions reliably produces
interfacial material modification. In other words, the modification
probability has to be close to $100 %$. This probability is defined as
the ratio between the number of modified sites and the total number of
tested sites for a given pulse energy. Modification probabilities
significantly lower than $100 %$ may lead to decreased mechanical
performance of the welds---or no welding at all. \
For constant pulse duration and focal spot size, modification occurrence
mainly depends on the pulse energy. To investigate how the interfacial
modification probability evolves with the pulse energy, we exploit our
customized infrared microscope for #emph[in-situ] modification detection
at the silicon--metal interface; the resulting observations are
consistent with #emph[ex-situ] optical microscopy observations
\[Fig.~#ref(<fig:Fig2>, supplement: none)\(b) and (c)\]. The results obtained at $z = 380$~$mu$m,
the focal position yielding the best welding performance (see
Fig.~#ref(<fig:Fig3>, supplement: none)), are displayed in Fig.~#ref(<fig:FigS1>, supplement: none). The interfacial
modification probability typically follows a sigmoid-like dependence on
the input pulse energy, from $0 %$ to $100 %$. This is consistent with
the relatively long pulse duration (620~ps), in contrast with
single-digit picosecond pulse durations where extreme propagation
nonlinearities lead to a non-monotonic behavior
@Chambonneau2019@Das2020@Blothe2025. The modification threshold is
estimated to be $E_(upright(t h)) approx 675 plus.minus 25$~nJ. The
interfacial modification probability increases with the pulse energy,
until it reaches $100 %$ for an input pulse energy of
$E_(upright(i n)) approx 850 plus.minus 50$~nJ. This implies that for
$E_(upright(i n)) > 900$~nJ, the welding pattern should be homogeneous.
In all experiments shown in this study, we have chosen
$E_(upright(i n)) = 6$~$mu$J, as this is well above this threshold and
maximizes the energy reaching the interface @Chambonneau2021a. \

#figure(image("source/Figs/FigS1.png"),
  caption: [
    Evolution of the interfacial modification probability as
    a function of the input pulse energy $E_(upright(i n))$. The focus
    is positioned at $z = 380$~$mu$m. The error bars correspond to
    $95 %$ Clopper--Pearson binomial confidence bounds, calculated from
    the number of modifications among 20 fresh sites tested at each
    pulse energy and spatially separated by 150~$mu$m. To ease
    modification detection, 6250 pulses were applied per site (S-on-1
    procedure governed by ISO 21254-2 @standarddamage).
  ]
)
<fig:FigS1>

#heading(level: 1, numbering: none)[Appendix~B. Temperature-dependent
Kovar morphology]
<appendix-b.-temperature-dependent-kovar-morphology>
After thermal exposure (see Section~@ssec:temperature), the Kovar
samples were inspected under optical microscopy. The corresponding
unirradiated areas are displayed in Fig.~#ref(<fig:FigS2>, supplement: none). For temperatures
$T lt.eq 200$ °C, the surface appearance is the same as at room
temperature. However, a noticeable color change is observed on the
surface for samples heated to $300 lt.eq T < 500$ °C, which can be
explained by metal oxidation. The oxide layer thickness increases with
temperature. The striking feature in Fig.~#ref(<fig:FigS2>, supplement: none) is the appearance
of a crack network on the oxide layer for $T gt.eq 500$ °C. The cracks
are barely noticeable at $T = 500$ °C, which is consistent with the high
performance of the silicon--Kovar joints after exposure to this
temperature (see Fig.~#ref(<fig:Fig6>, supplement: none)). However, when the temperature is
increased ($550 lt.eq T lt.eq 700$ °C), the crack width increases
substantially. At these temperatures, the shear joining strength of the
silicon--Kovar joints decreases dramatically to $< 1$~MPa. We therefore
conclude that crack formation is among the main factors responsible for
the decreased mechanical performance at temperatures $T gt.eq 550$ °C. \

#figure(image("source/Figs/FigS2.png"),
  caption: [
    Optical micrographs of unirradiated Kovar samples after
    thermal exposure at the indicated temperatures $T$. The scale
    applies to all images.
  ]
)
<fig:FigS2>

#bibliography("source/refs.bib", style: "ieee")
]
