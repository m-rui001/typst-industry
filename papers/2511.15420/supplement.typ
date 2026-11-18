#import "led-circuit.typ": led-circuit

#set document(title: "Supporting Information: 3D printed waveguides for optogenetics applications: design optimization and optical characterization")
#set page(
  paper: "us-letter", margin: 0.5in, numbering: "1",
  header: align(right, image("source/VCH-logo.png", width: 2.5cm)),
)
#set text(font: "New Computer Modern", size: 12pt)
#set par(justify: true, leading: .58em)
#set heading(numbering: "S1.1")
#set figure(numbering: "S1")
#set math.equation(numbering: "(S1)")
#show figure.caption: set text(size: 10pt)

#align(center)[
  #text(size: 16pt, weight: "bold")[Supporting Information: 3D printed waveguides for optogenetics applications: design optimization and optical characterization]

  Giorgio Scordo, Kostas Kanellopulos, Surangrat Thongkorn, Samuel Tavares da Silva Maraschin,
  Kambiz Ghaseminasab, Evgeniy Shkondin, Deepshika Arasu, Stephan Sylvest Keller,
  Arto Rainer Heiskanen, Marta Perez Pereira, and Jenny Emnéus
]

#block[
Dr. G. Scordo \
Electronic Engineering Department, University of Rome Tor Vergata, Via del Politecnico 1, 00133 Rome, Italy \
Email Address: giorgio.scordo\@uniroma2.it

Dr. K. Kanellopulos \
TU Wien, Institute of Sensor and Actuator Systems, Gusshausstrasse 27-29, 1040 Vienna, Austria

Dr. S. Thongkorn \
Department of Biotechnology and Biomedicine, Technical University of Denmark, Kgs. Lyngby, 2800, Denmark

S. T. D. S. Maraschin \
Department of Biotechnology and Biomedicine, Technical University of Denmark, Kgs. Lyngby, 2800, Denmark

K. Ghaseminasab \
Department of Biotechnology and Biomedicine, Technical University of Denmark, Kgs. Lyngby, 2800, Denmark

Dr. E. Shkondin \
Department of Biotechnology and Biomedicine, Technical University of Denmark, Kgs. Lyngby, 2800, Denmark

D. Arasu \
Hospital Clínic de Barcelona - Fundació de Recerca Cliníc Barcelona - IDIBAPS - University of Barcelona, Barcelona, Catalonia, Spain

Prof. S.S. Keller \
National Centre for Nano Fabrication and Characterization (DTU Nanolab), Technical University of Denmark, Ørsteds Plads Building 347, Kgs. Lyngby, 2800 Denmark

Dr. A. R. Heiskanen \
Department of Biotechnology and Biomedicine, Technical University of Denmark, Kgs. Lyngby, 2800, Denmark

Prof. M. P. Pereira \
The Institute for Molecular Biology of the Autonomous University of Madrid, Madrid, 20049, Spain

Prof. J. Emnéus \
Department of Biotechnology and Biomedicine, Technical University of Denmark, Kgs. Lyngby, 2800, Denmark Email Address: jemn\@dtu.dk

]
#pagebreak(weak: true)
#outline(title: [Contents], depth: 2)
#pagebreak()
= FEM Ray Tracing
<fem-ray-tracing>
The FEM simulations presented in the main text were based on a #emph[Ray Tracing] (RT) study, conducted using the #emph[Geometrical Optics] (GO) module available in COMSOL Multiphysics. The physical parameters used in the simulations---such as geometry and material parameters---are described in the main text. Here, we provide additional computational details and illustrate the typical ray trajectories obtained from the simulations.

In the GO module, the light source was defined through the #emph[Release from Boundary] condition at the bottom surface of the probe (see main text), with a input power $P_0$. Each simulation released $N = 2000$ rays per event, with conical emission with angle $theta = 7$° to match the characteristics of the experimental LED$""_470$. For each wave vector emitted, $N_w = 10$ rays were launched, resulting in a total of $N dot.op N_w = 2 dot.op 10^4$ rays per simulation. Each ray carried an input power of $P_(r \, 0) = P_0 \/ \( N dot.op N_w \)$.

The cylindrical detector was modeled as a #emph[Boundary Wall] set to fully absorb the impinging scattered light rays. For each RT study, light propagation was simulated for a sufficiently long time $t$ to reach steady-state conditions, meaning all rays were either absorbed by the detector or had scattered into free space. An example of this transient behavior is shown in #ref(<fig:FEM_Idet_t>)a, where the total detected intensity $I_(d e t)$ increases over time, eventually reaching a plateau. The observed staircase profile corresponds to discrete rays arrival at the detector, each contributing to the total signal at different times.

#figure(image("source/Figures/Idet_vs_t.png"),
  caption: [
    #strong[a.] Temporal evolution of $I_(d e t) \( t \)$. #strong[b.] 3D distribution of the scattered rays impinging onto the detector. The scalebar on the right indicates the corresponding power density $Q_(a b s) \( bold("r") \, t = t_0 \)$, in units \[W/m$""^2$\], at time $t = t_0$.
  ]
)
<fig:FEM_Idet_t>

The total detected intensity shown in #ref(<fig:FEM_Idet_t>)a, and discussed in the main text, is obtained upon integration of the absorbed power density $Q_(a b s)$ over the detector area $A_(d e t)$, and normalized by the same quantity, $ I_(d e t) \( t \) = 1 / A_(d e t) integral.double_(A_(d e t)) Q_(a b s) \( bold("r") \, t \) d A_(d e t) = frac(P_(d e t) \( t \), A_(d e t)) . $

All values reported in the main text refer to the steady-state value $I_(d e t) \( t gt.double 0 \)$. #ref(<fig:FEM_Idet_t>)b shows the 3D power density distribution $Q_(a b s) \( bold("r") \, t = t_0$) across the detector area at a representative time $t_0$.

@fig:FEM_ray_power_yz provides a snapshot of the ray trajectories throughout the simulation domain at the same time $t = t_0$, with the ray color indicating the delivered optical power. In this example, the source power was set to $P_0 = 1$ W, leading to a maximum power per ray of $P_(r \, m a x) tilde.eq P_0 \/ \( N dot.op N_w \) = 50$ µW (red rays). The black lines denote the geometry of the probe.

As shown, the scattered rays form a complex pattern. Rays in the lower region ($z < 0$) that propagate downward ($k_z < 0$) result primarily from backscattering by the first row of holes, and do not contribute to $I_(d e t)$. Among the forward-propagating rays ($k_z > 0$), some pass directly through the structure (for this specific case, the majority) and are lost into free space, while others interact with the wall of the probe. The outward-propagating rays do not contribute to $I_(d e t)$ and are similarly lost into free space, whereas only inward-scattered rays---those directed toward the detector---contribute to the final $I_(d e t)$.

#figure(image("source/Figures/cyl_star_nrow4_ncol4_ray_power_xz.png"),
  caption: [
    Ray trajectories and corresponding carried optical power $P_(r \, s c a)$ for $n_(r o w) = n_(c o l) = 4$, input wavelength $lambda = 470$ nm, input power $P_0 = 1$ W, and incident angle $theta = 7$°.
  ]
)
<fig:FEM_ray_power_yz>

In particular, the outward-propagating rays are scattered with zenith angles $theta_z lt.eq 90$°, with the first row of holes being the stronger scatterer region. Rays scattered by this first row typically carry power $P_(r \, s c a) > 45$ µW each, while those scattered from higher rows deliver reduced power ($P_(r \, s c a) tilde.op 20$ µW) at smaller zenith angles ($theta_z < 90$°).

The inward-scattered rays contributing to $I_(d e t)$, shown in @fig:FEM_ray_power_xy, are mostly scattered at zenith angles $theta_z lt.double 90$°. This directional bias explains the observed reduction in $I_(d e t)$ as the probe cylinder radius $r_(c y l)$ increases (Fig.~6e in the main text): rays scattered at lower $theta_z$ intesect the central axis at greater heights ($z = r_(c y l) tan \( theta_z \)$, increasing the likehood of escaping the probe before reaching the detector. This effect is discussed in further details in the main text.

#figure(image("source/Figures/cyl_star_nrow4_ncol4_ray_power_xy.png"),
  caption: [
    Ray trajectories and corresponding carried optical power $P_(r \, s c a)$ for $n_(r o w) = n_(c o l) = 4$, input wavelength $lambda = 470$ nm, input power $P_0 = 1$ W, and incident angle $theta = 7$°.
  ]
)
<fig:FEM_ray_power_xy>

= BMF optical characterization
<bmf-optical-characterization>
== Ellipsometry measurements
<ellipsometry-measurements>
Ellipsometry provides a non-destructive means of extracting the complex dielectric permittivity $chevron.l epsilon.alt chevron.r$ of a material by analyzing the change in polarization of reflected light. Assuming a single interface (air/material) and a known angle of incidence $phi.alt$, the permittivity can be calculated as follows~@fujiwara2007spectroscopic: $ chevron.l epsilon.alt chevron.r = sin^2 \( phi.alt \) [1 + tan^2 \( phi.alt \) (frac(1 - rho, 1 + rho))^2] \, $ where $rho$ is the ratio of the Fresnel reflection coefficients for p- and s-polarized light: $ rho equiv r_p / r_s = tan \( Psi \) e^(i Delta) \, $ with $Psi$ and $Delta$ representing the amplitude ratio and phase difference, respectively, obtained from the ellipsometric measurement.

The complex permittivity is expressed as $chevron.l epsilon.alt chevron.r = epsilon.alt_1 - i epsilon.alt_2$, from which the refractive index $n$ and the extinction coefficient $kappa$ can be extracted using: $ n = [frac(epsilon.alt_1 + sqrt(epsilon.alt_1^2 + epsilon.alt_2^2), 2)]^(1 \/ 2) \, $ $ kappa = [frac(- epsilon.alt_1 + sqrt(epsilon.alt_1^2 + epsilon.alt_2^2), 2)]^(1 \/ 2) . $

#figure(image("source/Figures/cuvette.png", width: 50.0%),
  caption: [
    Spectrophotometer samples. Left: 3D printed BMF cuvette 1x1x5 cm. Right: a standard transparent cuvette.
  ]
)
<fig:cuvette>

== Data compilation
<data-compilation>
The values of refractive index and extinction coefficients used in Fig.~4 in the main text for various commonly used material for optogenetics applications are listed in Table~@tab:mat.

#figure(
  align(center)[#table(
    columns: 5,
    align: (left,left,left,left,left,),
    table.header([Material], [$lambda$ (nm)], [$n$], [$kappa$], [Ref.],),
    table.hline(),
    [SiN], [470], [2.05], [$2.5 dot.op 10^(- 6)$], [@corato2024absorption],
    [], [590], [2.023], [$3.57 dot.op 10^(- 7)$], [@corato2024absorption],
    [Si], [470], [4.485], [$7.02 dot.op 10^(- 2)$], [@Schinke2015],
    [], [590], [3.954], [$2 dot.op 10^(- 2)$], [@Schinke2015],
    [SiO$""_2$], [470], [1.477], [$1.5 dot.op 10^(- 5)$], [@Franta2016],
    [], [590], [1.471], [$3.73 dot.op 10^(- 6)$], [@Franta2016],
    [SiC], [470], [3.47], [0.51], [@Larruquert2011],
    [], [590], [3.41], [0.32], [@Larruquert2011],
    [SU8], [470], [1.6], [$3.74 dot.op 10^(- 6)$], [@chen2024implantation],
    [], [590], [1.59], [$3.03 dot.op 10^(- 6)$], [@chen2024implantation],
    [PAG], [470], [1.5], [$1.72 dot.op 10^(- 6)$], [@monney2021photolithographic],
    [], [590], [1.5], [$1.08 dot.op 10^(- 6)$], [@monney2021photolithographic],
    [PEGDA], [470], [1.45], [$4.49 dot.op 10^(- 8)$], [@feng2020printed],
    [], [590], [1.45], [$5.63 dot.op 10^(- 9)$], [@feng2020printed],
    [PDMS], [470], [1.41], [$1.43 dot.op 10^(- 6)$], [@Zhang2020],
    [], [590], [1.40], [$1.54 dot.op 10 - 6$], [@Zhang2020],
    [FormLabs Clear], [470], [1.518], [$0.2 dot.op 10^(- 6)$], [$n$ @reynoso2021refractive, $kappa$ @bartels2024geometrical],
    [], [590], [1.509], [$0.14 dot.op 10^(- 6)$], [$n$ @reynoso2021refractive, $kappa$ @bartels2024geometrical],
    [OrmoComp], [470], [1.53], [$0.19 dot.op 10^(- 6)$], [$n$ @gissibl2017refractive, $kappa$ @jost2024fabrication],
    [], [590], [1.52], [$9.4 dot.op 10^(- 8)$], [$n$ @gissibl2017refractive, $kappa$ @jost2024fabrication],
  )]
  , caption: [List of the refractive index $n$ and extinction coefficient $kappa$ for $lambda = 470 \, 590$ nm.]
  , kind: table
  ) <tab:mat>
= Optical motherboard
<optical-motherboard>
== Schematic circuit
<schematic-circuit>
The designed Optical Motherboard comprises electrical transmission lines embedded in a matrix board (RS Components, UK), as shown in #ref(<fig:OpM>)b, where LED$""_470$ or LED$""_590$ are mounted---a schematics of the LED circuit is shown in @fig:LED_circuit. A microcontroller board, Arduino Uno (Italy) regulates the current and controls pulse stimulation via a dedicated script (section @Sec:script). The OpM is enclosed within a 3D-printed shell fabricated from black tough resin using a Form 3 printer (Formlabs, USA). Neodymium magnets from RS Components, UK, are embedded along the edges to facilitate the attachment of interchangeable lids, enabling a modular configuration.

#figure(layout(size => led-circuit(size.width * .4)),
  caption: [
    The schematic diagram of the equivalent circuit used for driving the LED
  ]
)
<fig:LED_circuit>

#figure(image("source/Figures/motherboard.png", width: 60.0%),
  caption: [
    #strong[a] Full assembled opto-motherboard device (OpM). #strong[b] Top view of the OpM LED side.
  ]
)
<fig:OpM>

== Arduino script
<Sec:script>
The script used to activate the LED implements a loop in which the LED is turned on for six cycles of 500 ms, followed by an off period of 50 s.

```
/*
  Blinking LED

  model, check the Technical Specs of your board at:
  https://www.arduino.cc/en/Main/Products
  https://www.arduino.cc/en/Tutorial/BuiltInExamples/Blink
*/

// the setup function runs once when you press reset or power the board
void setup() {
  // initialize digital pin 9 as an output.
  pinMode(9, OUTPUT);
  digitalWrite(9, LOW);
  delay(60000);
}

// the loop function runs over and over again forever
void loop() {
  digitalWrite(9, HIGH);  // turn the LED on (HIGH is the voltage level)
  delay(500);
  digitalWrite(9, LOW);   // turn the LED off
  delay(50000);

  digitalWrite(9, HIGH);  // on
  delay(500);
  digitalWrite(9, LOW);   // off
  delay(50000);

  digitalWrite(9, HIGH);
  delay(500);
  digitalWrite(9, LOW);
  delay(50000);

  digitalWrite(9, HIGH);
  delay(500);
  digitalWrite(9, LOW);
  delay(50000);
}
```

== Light cavities on Si wafer and 3D printing parameters
<light-cavities-on-si-wafer-and-3d-printing-parameters>
To obtain two identical openings for positioning the 3D-printed probe on top of the light source, two symmetrical semicircular apertures were first designed using CAD software Layout Editor (#ref(<fig:cavity>)a). The silicon chips containing gold electrodes were then processed using a laser micromachining system (3D-Micromac AG, Germany) operated at a power density of 7 mW/mm, a scanning speed of 250 µm/s, and 5000 repetitions. This procedure produced precise apertures on both sides of the electrode (#ref(<fig:cavity>)b). Subsequently, the chips were cleaned with ethanol to remove residual dust and debris.

To fabricate the 3D optical waveguide on the Si cavity, the ChituBox software (Chitu Systems, China) was employed for print preparation, using a layer thickness of 5 µm and fabricated using a Boston Micro Fabrication (BMF) projection microstereolithography (PµSL) 3D printer. The printing procedure was divided into three sequential exposure stages to ensure proper adhesion, structural stability, and complete polymerization of the printed microstructure. In the first stage, a single base layer was exposed for 1 s at 40$%$ light intensity (corresponding to an effective optical power of 37.6 mW/cm2). This layer served to promote strong adhesion of the photocurable resin to the silicon chip surface and establish a uniform foundation for subsequent layers. In the second stage, the following 49 layers were cured under a 1 s exposure at 30$%$ light intensity ( 28.2 mW/cm2 ) with a 2 s interlayer delay. This step allowed gradual structure buildup while minimizing internal mechanical stress and avoiding over-curing, which can cause deformation in high-aspect-ratio geometries. In the final stage, the remaining 261 layers were polymerized under a 1 s exposure at 45$%$ ( 42.3 mW/cm2 )intensity with a 60 s interlayer delay. The resulting microstructure exhibited uniform layer stacking and smooth interfaces, confirming the precision and stability of the PµSL printing process under these optimized exposure conditions (#ref(<fig:cavity>)c).

#figure(image("source/Figures/cavity.png", width: 100.0%),
  caption: [
    Fabrication process of the optical cavity: #strong[a.] CAD design consisting of multiple semicircular lines used as the laser path. #strong[b.] Top view of the fabricated optical cavity obtained after 5000 repetitions. #strong[c.] Isometric view of the 3D-printed optical waveguide aligned on top of the cavity.
  ]
)
<fig:cavity>

= 2D electromechanical sensor fabrication
<d-electromechanical-sensor-fabrication>
Below is the detailed cleanroom step-by-step protocol used for device preparation.

#heading(level: 3, numbering: none)[1. Base Wafer Preparation]
<base-wafer-preparation>
- #strong[1.1 Stock-out] -- 150 mm Si \<100\>, 675 μm thick, single-side polished, n-type (P).

#heading(level: 3, numbering: none)[2. Nanograss Template on Si]
<nanograss-template-on-si>
- #strong[2.1 ICP Etch (Pegasus 2)] -- Run "CORE" recipe to generate nanograss texture (@Nguyen_2020).

- #strong[2.2 RCA Clean] -- Sequential RCA-I and RCA-II.

- #strong[2.3 Wet Oxidation] -- Anneal+Oxide furnace (C1), WET at 1100 °C for 80 min (full boat), targeting 600 nm SiO#sub[2] thickness.

#heading(level: 3, numbering: none)[3. Spin-Coating SU-8 2035 (\~15 μm)]
<spin-coating-su-8-2035-15-μm>
- #strong[3.1 Syringe Preparation] -- In fume hood, fill syringes with SU-8 2035$gt.eq$24 h before use; record bottle lot and expiry.

- #strong[3.2 Plasma Descum] -- Plasma Asher 2: 400 sccm O#sub[2], 70 sccm N#sub[2], 1 kW, 75 min.

- #strong[3.3 Spin-Coating] -- RC08, program "BioMic 2035 15 μm (6-inch)":

  - 1000 rpm for 10 s (200 rpm/s) $arrow.r$ 5000 rpm for 120 s (1000 rpm/s), #emph[manual dispense].

- #strong[3.4 Soft-Bake] -- Hot plate 1273: 50 °C for 15 min, with 2 °C/min ramps. Cool for 30 min.

- #strong[3.5 Backside Wipe] -- Clean SU-8 from wafer backside using acetone and cleanroom tissue. Also wipe the hot plate.

#heading(level: 3, numbering: none)[4. SU-8 Exposure and PEB]
<su-8-exposure-and-peb>
- #strong[4.1 UV Exposure] -- MA6-2, soft contact, 2 $times$ 250 mJ/cm#super[2].

- #strong[4.2 Post-Exposure Bake (PEB)] -- Hot plate 1273: 50 °C for 2 h with 2 °C/min ramps.

#heading(level: 3, numbering: none)[5. SU-8 Development, Hard-Bake, and Characterization]
<su-8-development-hard-bake-and-characterization>
- #strong[5.1 Development] -- PGMEA (NICOSTO), three 1-min puddles on Gamma spin-coater.

- #strong[5.2 Flood Dose Test] -- MA6-2, 2 $times$ 250 mJ/cm#super[2], 30 s wait.

- #strong[5.3 Hard-Bake] -- 90 °C for 15 h with 2 °C/min ramps.

- #strong[5.4 Optical Inspection] -- Microscope inspection of dose-test features.

- #strong[5.5 Thickness Measurement] -- Dektak/XTA; target: 15 μm. If deviation \>15%, check resist age; note edge bead thickening.

#heading(level: 3, numbering: none)[6. Pyrolysis of SU-8 to Glassy Carbon]
<pyrolysis-of-su-8-to-glassy-carbon>
- #strong[6.1 Furnace Preparation] -- Run `BioMic_Prep_N2` unless furnace was used $<$72 h ago.

  - Load: wafers face-up, major flat up, boat fully to rear; front side faces N#sub[2] flow.

- #strong[6.2 Pyrolysis] -- Use recipe `nicostot3-step_LowRamp_1050C_2h`.

- #strong[6.3 Post-Run Clean] -- Run `BioMic_CleanAfterUsed_ActiveCooling`.

- #strong[6.4 Carbon Thickness] -- Dektak/XTA; aim for 2.2--2.3 μm (same \>15% deviation rule as in 5.5).

- #strong[6.5 Optical Check] -- Microscope inspection of dose-test patterns.

- #strong[6.6 Sheet Resistance] -- 4-point probe on test structures.

- #strong[6.7 SEM Cleanliness Check] -- Supra 2 (InLens/SE2); verify no dust or metal.

#heading(level: 3, numbering: none)[7. Metal-Contact Photolithography (AZ 5214E, 4.2 μm)]
<metal-contact-photolithography-az-5214e-4.2-μm>
- #strong[7.1 Spin-Coating] -- Gamma coater, program `6141-DCH`, HMDS prime, 3 $times$ 11.4 s coating, 20 s wait $arrow.r$ 4.2 μm film.

- #strong[7.2 Pattern Exposure] -- MA6-2, contact mode, exposure time 20 s (design-dependent).

- #strong[7.3 Reversal Bake] -- 110 °C for 180 s.

- #strong[7.4 Flood Exposure] -- MA6-2, 20 $times$ 49.5 mJ/cm#super[2] ($approx$1 J/cm#super[2]), 4.5 s exposure, 20 s wait.

- #strong[7.5 Development] -- TMAH (1007 DCH), 5 $times$ 60 s steps; extend in 60 s increments until clear and uniform.

- #strong[7.6 Final Inspection] -- Dektak + microscope; verify exposure quality, alignment, resist thickness, and coverage.

#bibliography("source/biblio.bib", style: "ieee")
