#import "junction-geometry.typ": sensor-figure

#set document(title: "Planar Josephson junctions for sensors and electronics: Different geometry, new functionality", author: "Vladimir M. Krasnov")
#set page(paper: "us-letter", margin: (x: 17mm, y: 18mm), columns: 2, numbering: "1")
#set text(font: "Libertinus Serif", size: 10pt, lang: "en")
#set par(justify: true, leading: .56em)
#set figure(supplement: [Fig.])
#show figure.caption: set text(size: 9pt)
#let refs(..numbers) = {
  [\[]
  numbers.pos().map(n => link(label("bib-" + str(n)), str(n))).join([, ])
  [\]]
}
#place(top, scope: "parent", float: true, clearance: 1em, block(width: 100%)[
  #align(center)[
    #text(size: 17pt, weight: "bold")[Planar Josephson junctions for sensors and electronics: Different geometry, new functionality.]
    #v(.55em)
    Vladimir M. Krasnov
    #linebreak()
    #text(size: 9pt, style: "italic")[Department of Physics, Stockholm University, AlbaNova University Center, 10691 Stockholm, Sweden]
    #linebreak()
    #text(size: 9pt)[#link("mailto:vladimir.krasnov@fysik.su.se")]
  ]
  #v(.55em)
  Josephson junctions are key elements in superconducting electronics. The most common type is the overlap (sandwich-type) junction, formed by vertically stacking two superconducting layers. In contrast, planar junctions are fabricated without overlap, at the edge of two superconducting films within a single plane. This geometric distinction has a significant impact on their physical properties.
The planar geometry greatly enhances sensitivity to magnetic fields and improves impedance matching for terahertz (THz) devices. Its two-dimensional structure allows for simple and flexible electronic component design, enabling drastic miniaturization. Here I highlight recent advances in the application of planar junctions for novel technologies, including junction-on-cantilever sensors for super-resolution magnetic imaging, vortex-based memory cells, and programmable superconducting diodes. I will also discuss the general requirements, future perspectives, and key challenges in the evolving field of superconducting electronics.
  #v(.4em)
  #text(size: 9pt)[Keywords: Josephson junctions, superconducting electronics, sensors and detectors]
])

#heading(level: 1, numbering: none)[Introduction]
<intro>
We live in the time of a third industrial (digital) revolution. It is characterized by an exponential growth of the data volume, which is expected to reach 200 ZB this year. The explosive digitalization sets several challenges for the sustainable development of our society. According to IEA executive summary 2024 #refs(1): “Electricity consumption from data centres, artificial intelligence and the cryptocurrency sector could double by 2026. Data centres are significant drivers of growth in electricity demand in many regions... Updated regulations and technological improvements, including on efficiency, will be crucial to moderate the surge in energy consumption from data centres.\"

At the same time, modern semiconducting electronics is reaching its physical limits on many fronts (memory-, heat-, power-walls, interconnect bottleneck, etc.) #refs(2). The “golden age\" of semiconducting electronics, when it was possible to improve performance by just miniaturization has ended approximately three decades ago. For the last two decades the development of semiconducting computation has been propelled by the expansion into the third dimension (e g. 3D FinFET) and changes in computer architecture #refs(3). However, even this approach shows a tendency for saturation. Therefore, radical innovative solutions are needed to maintain the present digitalization trends.

The growing demands for digital data capacity have led to renewed interest in the development of a classical superconducting computer #refs(4, 5, 6). It could enable drastic gains in both speed and power efficiency compared with semiconducting analogs. However, the existing rapid single flux quantum (RSFQ) concept of a digital superconducting computer #refs(5, 7, 8, 9, 10, 11, 12) has met a “scalability\" wall due to the limits of miniaturization of its key component, the superconducting quantum interference device (SQUID) #refs(6, 8). The problem is associated with the need of large enough inductance and critical current to store the flux quantum (the SQUID parameter $beta_L gt.eq 3$). Therefore, innovative solutions, aiming at replacement of SQUIDs by scalable to submicron sizes superconducting components, are needed for the development of future generation of computers. Numerous new ideas on how to replace SQUIDs have been generated in the past decade #refs(6, 13, 14, 15) and await for experimental scrutiny.

Geometry plays a crucial role in defining the physical properties and operational performance of superconducting and spintronic components. Contemporary superconducting electronics is dominated by overlap-type Josephson junctions (JJs). These junctions are fabricated through the sequential deposition of superconducting and interlayer films, with subsequent interface modifications (e.g., oxidation). This approach enables precise control over interlayer thickness, composition, and interface transparency, which is particularly important for tunnel JJs.

Highly reproducible fabrication processes have been developed for various types of overlap JJs, such as Nb/AlAlO$""_x$/Nb tunnel junctions~#refs(11, 12) and Nb/Nb$""_x$Si$""_(1 - x)$/Nb proximity-coupled junctions~#refs(16), with the total number of junctions on a single chip approaching one million~#refs(11). The relative simplicity of the fabrication method---compatible with standard microfabrication tools---along with the robustness and wide tunability of these junctions, makes overlap JJs the preferred choice for practical applications today.

Planar~#refs(17) junctions are formed without overlapping superconducting electrodes, as sketched in @fig:1\(a). Various types of planar JJs have been studied over the years, including proximity-coupled planar JJs and variable-thickness-bridge JJs #refs(18), grain-boundary JJs in high-$T_c$ cuprates~#refs(19, 20), junctions based on two-dimensional electronic systems in semiconducting heterostructures~#refs(21, 22), van der Waals materials~#refs(23, 24, 25), topological insulators~#refs(26), and more.

Different geometries are associated with different physical properties and new functionalities. As Likharev noted in 1979~#refs(18), "As regards applications, it is generally felt that variable-thickness bridges, given a proper choice of materials for the span and the banks, may meet almost all the practical requirements." However, planar JJs have not yet seen widespread use in superconducting electronics, largely due to the lack of simple and reliable fabrication procedures.

The development of focused ion beam (FIB) techniques has opened new possibilities for the direct writing of planar JJs~#refs(27, 28, 29, 30). @fig:1\(b) shows a schematic of the fabrication process using Ga$""^(+)$ FIB. A planar junction can be made from either a double-layer structure or a single superconducting film. In the double-layer case, milling through the top superconducting layer yields proximity-coupled JJs---of the SNS type~#refs(27, 31, 32) if the bottom layer is a normal metal (N), or of the SFS type~#refs(6, 28, 29, 31, 33, 34, 35, 36) if it is a ferromagnet (F). Making a trench in a single superconducting film results in a variable-thickness-bridge type JJ~#refs(36, 37). He$""^(+)$ FIB has also been successfully employed to fabricate damage-induced planar JJs in YBa$""_2$Cu$""_3$O$""_(7 - delta)$ high-$T_c$ films~#refs(38, 39). The high reproducibility of FIB-fabricated planar JJs has enabled advanced prototyping of novel devices, revealing numerous advantages and promising prospects for the use of planar JJs in superconducting electronics.

This work provides an overview of the advantages associated with planar geometry, as well as recent developments and perspectives on superconducting components based on planar JJs.

#heading(level: 1, numbering: none)[Planar geometry: differences and advantages]
<sec:1>
Planar JJs have a geometry that is orthogonal to that of overlap JJs, see the orientations of ($x y$) junction planes in @fig:1 (a). While this may seem like a purely technical distinction, it leads to profound qualitative and quantitative differences between planar and overlap JJs. These differences offer new functionalities and open up possibilities for novel applications.

The list of differences and advances of planar JJs include:

#heading(level: 3, numbering: none)[I. Openness]
<i.-openness>
\(difference).

Planar geometry opens up the junction cross-section for detailed inspection. As noted by Likharev, \"Naturally, variable-thickness bridges and similar structures are quite convenient in physical research into the processes occurring in weak links\" #refs(18). For example, this allows direct imaging of Josephson vortices by means of scanning probe microscopy #refs(40, 41, 42).

The openness, however, does not deteriorate the stability of the junctions. They remain remarkably stable over time, with no significant variations observed over a period of 10 years in air, without encapsulation or any special protection. Furthermore, we tested annealing of the JJs for a few hours in air at $T = 300^compose$~C, which likewise did not lead to any noticeable parameter drift. Most likely, the chemical stability is due to the formation of a robust, protective Nb-oxide layer.

#heading(level: 3, numbering: none)[II. Non-local electrodynamics]
<ii.-non-local-electrodynamics>
\(difference).

Overlap JJs have local electrodynamics, described by the sine-Gordon equation #refs(43). It is local in the sense that the Josephson current density at a given point, $J \( x \)$, is determined by the local Josephson phase difference, $phi \( x \)$, via the dc-Josephson (current-phase) relation. For tunnel JJs, $J \( x \) = J_c \( x \) sin \[ phi \( x \) \]$. Electrodynamics of planar JJs is non-local because the Josephson current is determined by the integral of phases over the whole junction length #refs(18, 44, 45). This has a profound effect on JJ characteristics #refs(20). For example, it leads to unusual temperature dependencies with non-vanishing lower critical field, $H_(c 1)$, for Josephson vortices, and non-diverging Josephson penetration depth, $lambda_J$, at $T arrow.r T_c$.

#heading(level: 3, numbering: none)[III. Large demagnetization factor]
<iii.-large-demagnetization-factor>
\(difference).

Planar junctions are sensitive to out-of-plane magnetic field, for which superconducting electrodes have a large demagnetization factor, $n_y$. For long and thin electrodes, $L_z gt.double L_x gt.double d$, $n_y tilde.eq 1 - d \/ L_x$ #refs(46). The effective magnetic field at the edge of the electrode is, 

#math.equation(block: true, numbering: _ => [(1)], $H_(e f f) = frac(H_y, 1 - n_y) tilde.eq L_x / d H_y gt.double H_y .$) <Heff>

 For JJs with $L_x = 5 med mu$m and $d = 70$ nm, $H_(e f f) tilde.eq 71 med H_y$.

#heading(level: 3, numbering: none)[IV. High sensitivity to magnetic field]
<iv.-high-sensitivity-to-magnetic-field>
\(advantage).

#figure(placement: top, scope: "parent", sensor-figure,
  caption: [
    \(a) A sketch of geometry difference between overlap and planar Josephson junctions. (b) A sketch of planar junction fabrication by focused ion beam. (c) SEM image of a scanning probe sensor with a Nb/CuNi/Nb planar junction on a cantilever. (d) SEM image of a planar Nb/CuNi/Nb junction with a vortex trap in one electrode. (e) measured $I_c \( H \)$ characteristics of the junction from (d) in the Meissner state (blue) and with a trapped antivortex (red). (f) Holographic reconstruction of vortex stray field in the junction using the distorted (red) $I_c \( H \)$ pattern from (e) as a hologram. The inset shows the difference between the actual and reconstructed field profiles. The accuracy of reconstruction $tilde.op 20$ nm is much smaller than the junction length $L_x med tilde.op 5 med mu$m, which indicates super-resolution imaging. Panels (a), (b) and (c-f) were adopted from Refs. #refs(20), #refs(28) and #refs(47), respectively.
  ]
)
<fig:1>

Flux quantization in JJ leads to Fraunhofer-like modulation of critical current, $I_c \( H \)$, in external magnetic field, $H$. Magnetic field sensitivity, $d I_c \/ d H tilde.op I_(c 0) \/ Delta H$, is determined by the flux-quantization field, $Delta H = Phi_0 \/ L_x Lambda_z$, where $L_x$ is the JJ length and $Lambda_z$ is the effective magnetic thickness of the JJ. For overlap JJs, $Lambda_z = t + lambda_(L 1) tanh \( d_1 \/ 2 lambda_(L 1) \) + lambda_(L 2) tanh \( d_2 \/ 2 lambda_(L 2) \)$, where $t$ is the junction interlayer thickness, $d_(1 \, 2)$ are thicknesses, and $lambda_(L 1 \, 2)$ are London penetration depths of the two superconducting electrodes #refs(43). The maximum value of $Lambda_z$ for large $d_(1 \, 2)$ is $tilde.eq 2 lambda_L$. Thus, an overlap JJ with $L_x = 5 med mu$m and $lambda_L = 100$ nm (typical for sputtered Nb) would have $Delta H tilde.eq 10$ Oe.

For planar JJs, the perpendicular magnetic field cannot pinch through the electrodes and is guided along the electrodes towards the edges, leading to the large demagnetization factor. For short electrodes, $L_z < L_x$, approximately half of the total incoming flux, $Phi = H_y L_x L_z$, goes through the JJ and the rest closes on the opposite side of the electrode. For long electrodes, $L_z > L_x$, the length scale for flux penetrating into the junction is determined by $L_x$. This leads to quantization fields #refs(35, 45),

#math.equation(block: true, numbering: _ => [(2)], $Delta H tilde.eq 1.8 Phi_0 / L_x^2 \, med med med med L_(z 1 \, 2) gt.double L_x $)
#math.equation(block: true, numbering: _ => [(3)], $Delta H tilde.eq 2 frac(Phi_0, L_x \( L_(z 1) + L_(z 2) \)) \, med med med med L_(z 1 \, 2) lt.double L_x $)
#math.equation(block: true, numbering: _ => [(4)], $Delta H tilde.eq 2 frac(Phi_0, L_x \( L_x \/ 1.8 + L_(z 2) \)) \, med med med med L_(z 1) > L_x > L_(z 2) .$)

 Thus, the effective magnetic thickness of planar JJs is determined by the size of electrodes, rather than London penetration depth. For a planar JJ with $L_x = 5 med mu$m, $Delta H tilde.op 1$ Oe, is almost an order of magnitude smaller than for similar-size overlap JJs. Note that the enhancement of flux sensitivity is smaller than the edge field enhancement, $\( 1 - n_y \)^(- 1)$. This happens because demagnetization fields are non-uniform with maxima at the edges and zero in the middle of electrodes.

The described above flux-focusing phenomenon in planar JJs leads to a drastic enhancement of magnetic field sensitivity. As noted in Ref. #refs(35), SFS-type planar JJs have sensitivities comparable to similar-size superconducting quantum interference devices (SQUIDs). Furthermore, planar JJs could enable super-resolution magnetic imaging with spatial resolution not limited by the size of the sensor #refs(35, 47).

@fig:1 (c) shows a scanning electron microscope (SEM) image of a scanning probe sensor with a Nb/CuNi/Nb planar junction on a cantilever #refs(47). @fig:1 (f) demonstrates an example of super-resolution reconstruction of stray magnetic fields from an Abrikosov vortex (AV). The inset indicates that the spatial accuracy of reconstruction is $tilde.op 20$ nm, much smaller than the junction size $tilde.op 5 med mu$m. Thus, planar JJ sensors allow obviation of a tradeoff problem between spatial resolution and magnetic field sensitivity in scanning probe sensors #refs(35, 47).

#heading(level: 3, numbering: none)[V. Abrikosov vortices: manipulation, phase-shift and readout]
<v.-abrikosov-vortices-manipulation-phase-shift-and-readout>
\(advantages).

#figure(placement: top, scope: "parent", image("source/Figure1a_Arrays.pdf", width: 95.0%),
  caption: [
    \(a) SEM image (false color) of an array with nine variable-thickness bridge type planar Nb junctions, and with additional electrodes to intermediate electrodes 2 and 5. (b) Current - Voltage characteristics of the three array segments, normalized by the number of JJs in the segment. Coincidence of the curves indicates the reproducibility of the fabrication technique and perfect current-locking of all JJs. (c) Temperature dependence of $I_c R_n$ for two arrays with three and nine JJs. Adopted from Ref. #refs(37).
  ]
)
<fig:2>

Abrikosov vortices in thin superconducting films are oriented so that currents are circulating in-plane and the magnetic field is out-of-plane. A transport current with density $J$ exposes a Lorentz force on AV, 

#math.equation(block: true, numbering: _ => [(5)], $F_L = d \[ J times Phi_0 \] \,$) <F_L>

 where $d$ is the film thickness.

For overlap JJs, vortices create problems. The vortex pinches through the junction plane, and the current is co-aligned with the vortex flux (both in the $z$-direction in @fig:1 a), leading to a vanishing Lorentz force. Therefore, it is difficult to control and manipulate AVs in overlap JJs #refs(48, 49).

For planar JJs, AVs are also perpendicular to the film (in the $y$-axis). However, they are parallel to the JJ and cannot cross it #refs(29). The transport current is flowing along the electrode ($z$-axis), leading to a Lorentz force parallel to the JJ (in the $x$-direction) across the electrode. This enables simple control and manipulation of AVs. Therefore, AVs in planar junctions represent not a problem, but an opportunity.

Stray flux and circulating currents from AV induce a geometry-dependent Josephson phase shift in a planar JJ #refs(34). The exact position of the vortex can be defined with the help of artificial vortex traps #refs(6, 29, 34), as illustrated in @fig:1 (d). If AV is placed close to the JJ, approximately half of its flux, $Phi_0 \/ 2$, goes into the JJ, leading to formation of switchable $0 - pi$ junctions #refs(29, 50) with a $pi$ phase shift within the JJ. The phase shift is geometrically tunable #refs(34). By varying junction length and vortex trap position it is possible to create phase shifted $0 - phi$ JJs with arbitrary phase shift $phi in \[ - 2 pi \, 2 pi \]$ with the help of a single vortex or antivortex #refs(34). In a similar manner, AV could create a flux offset in a SQUID loop #refs(31).

The vortex-induced phase shift in planar JJs causes a distortion of $I_c \( H \)$ patterns #refs(29, 34), as illustrated in @fig:1 (e). In the absence of the vortex (blue lines) the pattern is Fraunhofer-like with a central maximum at $H = 0$ (although it is not completely periodic due to non-locality of planar JJs #refs(45)). For a $0 - pi$ junction, the central maximum is replaced by a minimum #refs(29, 50), as can be seen from the red lines in @fig:1 (e). This leads to a maximum distinction between Meissner (maximal $I_c$) and vortex (minimal $I_c$) states at zero magnetic field #refs(6).

The ease of vortex manipulation and the large distinction between vortex states make planar junctions suitable for storing digital information in the form of a single AV #refs(6, 14). Since vortex manipulation (write/erase operations) is performed at the AV depinning current, whereas state readout is performed at the Josephson critical current (which is typically much smaller) the readout of vortex states can be carried out non-destructively #refs(6, 29, 51).

#heading(level: 3, numbering: none)[VI. Flexibility of geometrical design]
<vi.-flexibility-of-geometrical-design>
\(advantage).

#figure(placement: top, scope: "parent", image("source/Figure3_Diode.pdf", width: 95.0%),
  caption: [
    A sketch (top) and a SEM image (bottom) of a four-terminal Josephson diode with a vortex trap. (b) Magnetic field modulation of critical current in the absence of vortex for three bias configurations sketched in (a). The asymmetric corner bias leads to a profound nonreciprocity at finite magnetic field. (c) $I_c \( H \)$ modulation for the right-corner bias with a trapped vortex. Note that the largest nonreciprocity is shifted to zero field. The diode polarity of such a diode is switchable by changing the sign of trapped vortex and the bias configuration. Adopted from Ref. #refs(36).
  ]
)
<fig:3>

The openness of the planar layout allows a great deal of design and fabrication flexibility #refs(30), enabling effective utilization of geometric advantages. For instance, it is not difficult to fabricate JJs of arbitrary shape with specifically designed nonuniform distributions of critical current density and electrode width along the junction, or to realize various geometrical constructions that are difficult or impossible to achieve with overlap geometry.

The flexibility of the planar geometry opens up a variety of new possibilities. For example, in JJ arrays, contacts to intermediate electrodes are very useful for studying the intricate dynamics of individual JJs during array synchronization, as well as for probing defects, nonuniformities, and the spread of junction characteristics. In overlap-type stacked JJs, it is technically challenging to make contacts to intermediate electrodes, as the need for insulating layers rapidly increases the structural height and unevenness. This issue does not arise in planar JJ arrays.

@fig:2 (a) shows a SEM image of an array of nine variable-thickness planar Nb JJs with contacts to intermediate electrodes $\# 2$ and $\# 5$ #refs(37). Thus, the characteristics of array segments comprising JJs 1+2, 3+4+5, and 6+7+8+9 could be measured simultaneously. @fig:2 (b) presents the corresponding current-voltage ($I$--$V$) characteristics, with voltage normalized by the number of JJs in each segment. The matching of normal resistances indicates the reproducibility of the fabrication process, resulting in nearly identical JJs. The coincidence of switching currents demonstrates perfect current locking of the array. Simultaneous switching of all JJs leads to a multiplication of the readout voltage, exceeding 6 mV at low temperatures, as shown by the red line in @fig:2 (c). Such cascade multiplication of the readout voltage in JJ arrays may be useful for microwave (MW) and THz detectors #refs(52).

@fig:3 (a) shows an example of a superconducting diode with switchable polarity and nonreciprocity. It is based on four-terminal Nb/CuNi/Nb planar JJs #refs(36). Nonreciprocity of the critical currents requires simultaneous breaking of both spatial and time-reversal symmetries. In this device, spatial symmetry can be broken controllably and tunably by selecting different bias configurations.

@fig:3 (b) presents measured $I_c \( H \)$ patterns for three bias configurations, as sketched in panel (a). The JJ behaves reciprocally in the symmetric bias configuration (olive), while for asymmetric bias a strong nonreciprocity, $A = lr(|I_c^(+) \/ I_c^(-)|) tilde.eq 10$, is achieved at a finite magnetic field, which breaks time-reversal symmetry. Time-reversal symmetry can also be broken by the introduction of AV. The device includes a vortex trap, marked in @fig:3 (a). @fig:3 (c) shows $I_c \( H \)$ modulation with a trapped AV in the right-corner bias configuration. In this case, nonreciprocity of $A tilde.eq 4$ is observed at zero magnetic field, as indicated by the vertical dashed line.

The diode is one of the fundamental components in electronics, with a wide range of applications in both analog and digital circuits. Diodes based on other types of planar JJs have also been demonstrated #refs(22, 25, 39). Developing a technologically simple and highly efficient superconducting diode will be indispensable for next-generation classical superconducting computers and high-frequency signal processing.

However, the demonstrated planar JJ diode is not merely an efficient diode---its most remarkable feature is reconfigurability. The diode polarity can be easily reversed by changing the bias configuration and the polarity of the trapped vortex #refs(36). This opens up new possibilities for creating novel components with advanced functionality, such as programmable logic gates.

#heading(level: 3, numbering: none)[VII. Terahertz applications: impedance matching and synchronization]
<vii.-terahertz-applications-impedance-matching-and-synchronization>
\(advantage).

#figure(placement: top, scope: "parent", image("source/Figure2_MemoryAll.pdf", width: 95.0%),
  caption: [
    \(a) SEM image (false color) of a $tilde.op 1 times 1 med mu$m$""^2$ vortex-based AVRAM memory cell. (b) Demonstration of write and erase operation by word-line (red) and bit-line (blue) current pulses. The top panel shows current pulse sequence. The bottom panel represents the resistance of readout JJ. (c) Demonstration of a long-time fault free operation for another device. (d-f) TDGL modeling of cell operation. (d) Cell geometry with spatial distribution of the order parameter (left) and current density (right). The width of the electrode is $1 med mu$m, as in (a). (e) Average vortex velocities along the path from the right to the left edge at three bias currents. (f) Demonstration of ultrafast write/erase operation by bipolar current pulses. Panels (a,b), (c) and (d-f) are adopted from Refs. #refs(14), #refs(6) and #refs(51), respectively.
  ]
)
<fig:4>

Superconducting electronics can operate in the THz frequency range #refs(53), which is crucial for future ultrafast electronics and telecommunication systems #refs(54). The upper frequency limit of a JJ is determined by its characteristic voltage, $V_c = I_c R_n$ #refs(43), where $R_n$ is the normal-state resistance of the JJ. Constriction-type JJs, such as variable-thickness bridge, are characterized by a large $V_c$, which can exceed that of tunnel JJs by up to a factor of two #refs(55). FIB-patterned Nb variable-thickness JJs, shown in @fig:2 (c), reach relatively high values of $V_c tilde.eq 0.8$~mV at low temperatures. The ultimate theoretical limit, $V_c = pi Delta \/ e$, where $Delta$ is the superconducting energy gap, is achieved in ballistic (clean-limit) constriction JJs #refs(55). For Nb, this corresponds to a maximum $V_c tilde.op 5$~mV, implying that such JJs could operate at frequencies up to $f tilde.op V_c \/ Phi_0 tilde.op 2.5$~THz.

Efficient transmission and absorption of THz signals require proper impedance matching of circuit components. The impedance of effective THz devices should be comparable to a fraction of the free-space impedance. A JJ by itself cannot absorb or emit THz radiation efficiently because its physical dimensions are much smaller than the radiation wavelength, $lambda_0 = 300 med mu$m at $f = 1$ THz, leading to a significant impedance mismatch with free space #refs(56). The planar geometry offers a straightforward solution to this problem. For example, a planar JJ, sketched in @fig:1 (a), can function as a standard dipole antenna if the electrode lengths are $L_z = lambda_0^(*) \/ 4$ (where $lambda_0^(*) < lambda_0$ accounts for the substrate's dielectric constant). In this configuration, the electrodes act as THz antennas, and their shapes and sizes can be readily tailored to specific application requirements, thanks to the design flexibility of the planar geometry.

JJ arrays offer further advantages for both emission #refs(53, 54) and detection #refs(52) of THz radiation. However, achieving this requires coherent operation of the junctions. Synchronization of many JJs in a large array depends on the presence of long-range mutual interactions between them. As shown in Ref.#refs(37), planar JJ arrays---such as the one in @fig:2 (a)---exhibit long-range coupling via stray magnetic fields, which cannot decay easily because they cannot penetrate the superconducting electrodes. Therefore, planar JJ arrays have good prospects for the development of coherent THz emitters and detectors.

#heading(level: 3, numbering: none)[VIII. Compactness and scalability]
<viii.-compactness-and-scalability>
\(advantages).

Due to the absence of overlap, planar JJs have a very small lateral area. This is conceptually similar to the three-dimensional FinFET design in semiconductor electronics, where vertical expansion reduces the on-wafer footprint of components. In the array shown in @fig:2 (a), the junction cut is approximately 30 nm wide, and the electrode width is around 500 nm---dimensions that can be readily reduced to 200 nm or even smaller (down to $lambda_L tilde.op$100~nm). This enables the fabrication of compact devices with a high junction density.

@fig:4 (a) shows a SEM image of the smallest vortex-based (AVRAM) memory cell demonstrated to date #refs(14). The device includes a $tilde.op 1 times 1 med mu$m$""^2$ Nb island, word-line and bit-line electrodes, a vortex trap, a guiding track for vortices, and two readout JJs (Nb variable-thickness bridges). @fig:4 (b) illustrates controllable write and erase operations performed using current pulses $I_(W L)$ and $I_(B L)$ applied to the word-line and bit-line, respectively. @fig:4 (c) demonstrates robust, fault-free operation over extended period #refs(6).

The lack of dense RAM is one of the main bottlenecks for the development of digital superconducting electronics #refs(5, 15). The state-of-the-art RSFQ cells reported in Ref. #refs(5) have a large size $60 times 60 med mu$m$""^2$. The AVRAM cell from @fig:4 (a) is much smaller, highlighting a major advantage of the planar geometry in terms of device miniaturization. In fact, the entire AVRAM cell occupies a much smaller area than a single overlap JJ in RSFQ cell from Ref.~#refs(5). Multiple factors contribute to this advantage #refs(6, 14), with the compactness of planar JJs being just one.

The maximum distinctiveness, the robust nondestructive readout of vortex states by planar JJs are another important advantages for memory applications. The RSFQ memory is based on storing of a flux quantum in a SQUID loop. In contrast to planar JJs, 0/1 states of a SQUID are non-distinguishable and the readout is destructive. Therefore, a second SQUID loop is needed for the nondestructive readout #refs(5). This significantly complicates the cell architecture and increases the RSFQ memory cell size. Furthermore, SQUIDs need large inductances to store magnetic flux, whereas the AVRAM cell does not. All these factors, together with the design flexibility inherent to the planar architecture lead to an extremely simple AVRAM cell structure compared to RSFQ, further contributing to its compactness. Combined with the nanometer-scale size of AV, this allows for sub-micron scalability of AVRAM technology.

#heading(level: 1, numbering: none)[Discussion]
<sec:2>
Although superconducting electronics could offer significant advantages, there are serious limitations and challenges. Very complex projects, such as the development of superconducting high-end computer, would require massive investments. This could happen only when the technology will reach high enough readiness level with demonstrated impressive characteristics.

#heading(level: 2, numbering: none)[Target characteristics for the next generation superconducting electronics]
<target-characteristics-for-the-next-generation-superconducting-electronics>
#heading(level: 3, numbering: none)[Compatibility with RSFQ technology.]
<compatibility-with-rsfq-technology.>
The RSFQ concept #refs(7) is based on generation and utilization of quantized voltage pulses upon exit or entrance of a flux quantum in a SQUID loop. The RSFQ pulses are transferred via superconducting transmission lines at a fraction of the speed of light, $c^(*) tilde.op 1 times 10^8$ m/s. Together with the sub-ps switching time of JJs in a SQUID, this enables an ultrafast operation.

A major problem for the development of any type of ultrahigh-frequency electronics is the sensitivity to delay times. The conventional synchronous operation fails when the time of propagation of signals along the chip becomes comparable to the clock period. Therefore, asynchronous or delay insensitive electronics is required at high frequencies. An important advantage of RSFQ is that it enables asynchronous operation due to an inbuilt non-volatile memory. After operation, a flux state is preserved in the SQUID loop so that the next operation could be performed at any time within the clock period #refs(7).

RSFQ is the only fully operational concept of superconducting digital electronics today. Fairly complex RSFQ prototypes have been demonstrated #refs(58, 59) and numerous smart innovative solutions were developed #refs(7). It doesn't make sense to start from scratch. Although SQUIDs have to be replaced in components requiring very large scale integration (VLSI), such as RAM and logic gates, SQUIDs may be preserved in the rest of components. The next generation of superconducting digital electronics should be compatible with RSFQ and should built upon the large accumulated knowledge.

#heading(level: 3, numbering: none)[Operation frequency.]
<operation-frequency.>
The future DDR6 generation of semiconducting electronics is expected to have the clock frequency of 6.4-8.5 GHz. In order to impress, superconducting electronics should offer at least an order of magnitude improvement. That implies the base clock frequency of 64-85 GHz. These values are well within the achievable range of Nb-based superconducting electronics, which is able to operate above 1 THz #refs(57). Thus, the near-future target value for the clock frequency of superconducting electronics is $tilde.op 100$ GHz, which is feasible for RSFQ #refs(59).

The actual advance of superconducting computer in terms of operation speed is determined not only by the clock frequency but by the intrinsically fast (ps) switching times #refs(7), as compared to 1-10 ns $R C$ times of semiconductor components. The long switching time leads to a long latency, strobe and charging times of semiconducting electronics. Therefore, the actual cycle time in the latest DDR5 DRAM (typical parameters 40-40-40-77) is well above hundred clock periods, bringing the actual operation speed back to 10 ns (100 MHz) range. Therefore, even at the same clock frequency, superconducting electronics would operate much faster than semiconducting electronics because it could have much shorter latency times.

#heading(level: 3, numbering: none)[Miniaturization.]
<miniaturization.>
Integration at least to the VLSI level is necessary for building fast and powerful computers. There are many well-known reasons and I will dwell on just one: shorter distances lead to smaller delay times and enable higher operation frequency and faster operation. The problem with delay times is rapidly escalating with increasing clock frequency. For 200 GHz the period is $tau = 5$ ps. For $c * = 10^8$ m/s the $0.1 med tau = 0.5$ ps delay is gained at a distance of $50 med mu$m, which is shorter than the RSFQ memory cell size from Ref. #refs(5). Therefore, scaling to sub-micron sizes is necessary for building (any type of) ultrafast computer.

#heading(level: 3, numbering: none)[Delay-insensitive electronics]
<delay-insensitive-electronics>
At high frequencies the delay problem becomes so acute that miniaturization alone can not solve it. Development of delay-insensitive components and architecture would be needed.

#heading(level: 3, numbering: none)[Energy efficiency]
<energy-efficiency>
Although superconductors dissipate little power, they have poor thermal conductivity and are prone to self-heating. Therefore, energy per operation should be below $1$ aJ #refs(8) and static energy consumption should be eliminated #refs(9, 10).

The list above is incomplete. There are numerous other challenges, not the least with the computer architecture #refs(7, 60), which would need to be addressed. But they are beyond this overview because they are not related to the junction geometry.

#heading(level: 2, numbering: none)[Characteristics of planar AVRAM cell]
<characteristics-of-planar-avram-cell>
Planar AVRAM cell, Fig @fig:4 (a), satisfy most of the criteria mentioned above.

#heading(level: 3, numbering: none)[Compatibility with RSFQ technology.]
<compatibility-with-rsfq-technology.-1>
The vortex-based electronics #refs(6, 14) is potentially fully compatible with RSFQ. Indeed it also operates with the flux quantum and has an inbuilt memory functionality, enabling asynchronous operation.

#heading(level: 3, numbering: none)[Operation frequency.]
<operation-frequency.-1>
There is a long-standing misconception that AVs are inherently slow, with typical propagation velocities on the order of $tilde.op 1$~km/s. In reality, AVs are (practically) massless electromagnetic entities that can propagate at a speed of light. However, their actual velocity is influenced by pinning effects and viscous damping due to quasiparticle losses in the vortex core. Near the depinning threshold, AV motion can indeed be slow. Yet, as the current---and thus the driving Lorentz force---increases, the AV velocity grows rapidly and in a super-linear fashion.

Figures~@fig:4 (d--f) show the results of time-dependent Ginzburg--Landau (TDGL) simulations of vortex dynamics in an AVRAM cell with a width $L_x = 1 med mu$m #refs(51). @fig:4 (e) presents the vortex velocity as it traverses from the right to the left edge of the superconducting island. The velocity is seen to increase sharply, reaching nearly 1000~km/s at the exit (left edge). Notably, this increase is not due to acceleration (since the Lorentz force is constant and the AV has no mass), but rather stems from the intrinsic nonlinearity of flux-flow viscosity. As velocity increases, the vortex viscosity decreases, enabling ultrafast propagation. Combined with the small physical size of the cell, this results in picosecond-scale operation times.

@fig:4\(f) shows simulated AV write/erase operations driven by short bipolar current pulses. The switching times---defined as the delay between the onset of the current pulse (top panel) and the change in magnetic flux in the trap (bottom panel)---are in the ps range. The switching time can be estimated as $Delta t = L_x \/ 2 chevron.l v chevron.r$. Taking $chevron.l v chevron.r = 200$ km/s and $L_x = 1 med mu$m yields $Delta t = 2.5$~ps, which agrees well with the simulation results in @fig:4 (f) #refs(51).

#heading(level: 3, numbering: none)[Miniaturization.]
<miniaturization.-1>
AV is the smallest magnetic object in type-II superconductors with the largest size determined by $lambda_L tilde.eq 100$ nm (Nb). Therefore, AVRAM cell should be miniaturizable to approximately $2 - 3 lambda_L tilde.eq 200 - 300$ nm. This is three-four order of magnitude smaller than state of the art RSFQ cells.

#heading(level: 3, numbering: none)[Energy efficiency]
<energy-efficiency-1>
Energy dissipation in AVRAM cell during write/erase operation is equal to the work done by the Lorentz force, @F_L #refs(6, 51), 

#math.equation(block: true, numbering: _ => [(6)], $E = frac(Phi_0 I, 2).$)

 For the cell from @fig:4 (a) with switching currents $I tilde.eq 200 med mu$A, Fig, @fig:4 (b), $E tilde.eq 0.2$ aJ.

As for the challenges facing planar devices, they are numerous.

First, while FIB patterning is well-suited for prototyping, it is not viable for large-scale production. Therefore, the development of a new, scalable, and straightforward fabrication technology for planar JJs with controllable and reproducible properties is essential.

To date, only relatively simple proof-of-concept planar devices have been demonstrated. In order to achieve a sufficient technology readiness level to attract investment and industrial interest, it is necessary to realize more complex circuits and functionalities. This includes demonstrations of RAM, logic gates, full adders, and other key digital components. Furthermore, high-frequency operation must be validated, and compatibility with established RSFQ technology, must be ensured.

#heading(level: 2, numbering: none)[Prospects and challenges of superconduction electronics.]
<prospects-and-challenges-of-superconduction-electronics.>
Even though superconducting electronics cannot compete with semiconductor technology in terms of miniaturization, it offers advanced functionalities that may enable competition in terms of functionality per unit area. For example, flux-based superconducting memory is both persistent and non-volatile, while also maintaining fast operation speeds. There is no semiconductor equivalent that combines these features; for instance, flash memory is persistent but slow with erase times in the millisecond range.

The switchable vortex-based superconducting diode demonstrated in @fig:3 opens new possibilities for implementing programmable logic, such as field-programmable gate arrays (FPGAs).

A perfect superconducting diode is indispensable for the future development of superconducting electronics. It addresses one of the major limitations in superconducting circuit design: the absence of effective switches for signal routing and isolation. In semiconductor electronics, a single field-effect transistor can open or close a line for signal transfer. In contrast, superconducting circuits lack such a switching element, resulting in substantial current leakage across interconnections. For DC bias currents, this crosstalk issue can only be mitigated by providing separate bias lines, which significantly increases architectural complexity in VLSI circuits---commonly referred to as the interconnect bottleneck. Even for high-frequency RSFQ pulses, signal leakage remains a significant concern due to finite mutual inductance and the absence of a defined signal propagation direction---pulses in a superconducting transmission line can travel equally well in both directions. This necessitates additional design measures, such as introducing current gain or creating a gradient in switching currents along the signal propagation path #refs(7). These challenges pose serious constraints for scaling up to VLSI levels. A perfect superconducting diode would serve as a crucial new passive element, enabling reliable signal and current routing in superconducting systems.

In conclusion, planar Josephson junctions differ from conventional overlap JJs in both geometry and physical properties. This distinction enables drastic miniaturization, flexible circuit design, and novel device functionalities, opening the door to a broad range of emerging applications. In this work, I highlighted examples including super-resolution magnetic field sensors, efficient THz oscillators and detectors, programmable superconducting diodes, and scalable vortex-based memory and logic. This list is by no means exhaustive but is intended to inspire further creative exploration into the unique advantages offered by planar geometries.


= Acknowledgments

The work was supported by the Knut and Alice Wallenbergs Foundation, PoC grant Nr. 2024.0319.

I am grateful to my colleagues T. Golod, R. Hovhannisyan, A. Skog, R. Cattaneo, S. Grebenchuk and L. Morlet-Decarnin, who participated in experimental works included in the adopted Figures.

= Conflict of interest

The author declares that he has no conflict of interest.

= References

#set text(size: 9pt)
#set par(leading: .48em)

#block(inset: (left: 1.7em))[#h(-1.7em)\[1\] #h(.25em)https:\/\/www.iea.org/reports/electricity-2024/executive-summary] <bib-1>
#block(inset: (left: 1.7em))[#h(-1.7em)\[2\] #h(.25em)Weisheng, L. et al. Approaching the quantum limit in two-dimensional semiconductor contacts. #emph[Nature] #strong[613], 274-279 (2023).] <bib-2>
#block(inset: (left: 1.7em))[#h(-1.7em)\[3\] #h(.25em)Cardoso, J. M. P., Coutinho, J. G. F., Diniz, P. C., Embedded Computing for High Performance: Efficient Mapping of Computations Using Customization, Code Transformations and Compilation (Morgan Kaufmann Publishers, 2017 Elsevier Inc.).] <bib-3>
#block(inset: (left: 1.7em))[#h(-1.7em)\[4\] #h(.25em)Holmes, D. S., Ripple, A. L., & Manheimer, M. A. Energy-efficient superconducting computing---Power budgets and requirements. #emph[IEEE Trans. Appl. Supercond.] #strong[23], 1701610 (2013).] <bib-4>
#block(inset: (left: 1.7em))[#h(-1.7em)\[5\] #h(.25em)Ortlepp, T., and Van Duzer, T., Access time and power dissipation of a model 256-bit single flux quantum RAM. #emph[IEEE Trans. Appl. Supercond.] #strong[24], 1300307 (2014).] <bib-5>
#block(inset: (left: 1.7em))[#h(-1.7em)\[6\] #h(.25em)Golod, T., Iovan, A., and Krasnov, V. M., Single Abrikosov vortices as quantized information bits, #emph[Nat. Commun.] #strong[6], 8628 (2015).] <bib-6>
#block(inset: (left: 1.7em))[#h(-1.7em)\[7\] #h(.25em)Likharev, K. K., and V. K. Semenov, RSFQ logic/memory family: A new Josephson-junction technology for sub-terahertz-clock-frequency digital systems. #emph[IEEE Transactions on Applied Superconductivity], #strong[1(1)], 3-28 (1991).] <bib-7>
#block(inset: (left: 1.7em))[#h(-1.7em)\[8\] #h(.25em)Tolpygo, S. K., Superconductor digital electronics: Scalability and energy efficiency issues.#emph[Low Temperature Physics], #strong[42(5)], 361-379 (2016).] <bib-8>
#block(inset: (left: 1.7em))[#h(-1.7em)\[9\] #h(.25em)Takeuchi, N., Yamanashi, Y., and Yoshikawa, N. Energy efficiency of adiabatic superconductor logic, #emph[Supercond. Sci. Technol.] #strong[28], 015003 (2015).] <bib-9>
#block(inset: (left: 1.7em))[#h(-1.7em)\[10\] #h(.25em)Kirichenko, A. F., Vernik, I. V., Kamkar, M. Y., Walter, J. Miller, M., Albu, L. R., and Mukhanov, O. A., ERSFQ 8-Bit Parallel Arithmetic Logic Unit. #emph[IEEE Trans. Appl. Supercond.], #strong[29], 1302407 (2019).] <bib-10>
#block(inset: (left: 1.7em))[#h(-1.7em)\[11\] #h(.25em)V. K. Semenov, Y. A. Polyakov, and S. K. Tolpygo, AC-Biased Shift Registers as Fabrication Process Benchmark Circuits and Flux Trapping Diagnostic Tool, #emph[IEEE Trans. Appl. Supercond.] #strong[27] 1301409, (2017).] <bib-11>
#block(inset: (left: 1.7em))[#h(-1.7em)\[12\] #h(.25em)S. K. Tolpygo, V. Bolkhovsky, R. Rastogi, S. Zarr, A. L. Day, E. Golden, T. J. Weir, A. Wynn, and L. M. Johnson, Advanced Fabrication Processes for Superconductor Electronics: Current Status and New Developments, #emph[IEEE Trans. Appl. Supercond.] #strong[29] 1102513, (2019).] <bib-12>
#block(inset: (left: 1.7em))[#h(-1.7em)\[13\] #h(.25em)Soloviev, I. I., et al., Beyond Moore's technologies: operation principles of a superconductor alternative. #emph[Beilstein J. Nanotechnol.] #strong[8], 2689 (2017).] <bib-13>
#block(inset: (left: 1.7em))[#h(-1.7em)\[14\] #h(.25em)Golod, T., Morlet-Decarnin, L., and Krasnov, V. M., Word and bit line operation of a $1 times 1 med mu$m$""^2$ superconducting vortex-based memory. #emph[Nat. Commun.] #strong[14], 4926 (2023).] <bib-14>
#block(inset: (left: 1.7em))[#h(-1.7em)\[15\] #h(.25em)Alam, S., Hossain, M. S., Srinivasa, S. R., and Aziz, A., Cryogenic memory technologies. #emph[Nat. Electr.] #strong[6], 185--198 (2023).] <bib-15>
#block(inset: (left: 1.7em))[#h(-1.7em)\[16\] #h(.25em)Dresselhaus, P. D., Elsbury, M. M., Olaya, D., Burroughs, C. J., and Benz, S. P., 10 Volt Programmable Josephson Voltage Standard Circuits Using NbSi-Barrier Junctions, #emph[IEEE Trans. Appl. Supercond.] #strong[21], 693-696 (2011).] <bib-16>
#block(inset: (left: 1.7em))[#h(-1.7em)\[17\] #h(.25em)The term “planar\" may sound confusing for people familiar with semiconducting electronics since there “planar\" junctions are formed along the substrate (as in overlap JJs), while non-planar junctions are expanding in the third (vertical) dimension, as in 3D FinFET. Using similar logics, the term “planar junction\" has been sometimes applied to overlap JJ. Also other names like “lateral\" or “in-line\" JJs could be found in literature, further adding to the confusion. It is not much we can do about it, but emphasizing that here the term “planar\" refers to JJs with two electrodes placed in one (substrate) plane $\( x z \)$. The junction cross-section is orthogonal to the current flow direction ($z$-axis). Therefore, the effective junction plane ($x z$) is perpendicular to the substrate plane, see Fig. @fig:1 (a). Such definition is valid even when junction channel is two-dimensional (e.g. a graphene sheet).] <bib-17>
#block(inset: (left: 1.7em))[#h(-1.7em)\[18\] #h(.25em)Likharev, K. K., Superconducting weak links, #emph[Rev. Mod. Phys.] #strong[51] 101-159 (1979).] <bib-18>
#block(inset: (left: 1.7em))[#h(-1.7em)\[19\] #h(.25em)Kirtley, J. R., Tsuei, C. C., Rupp, M., Sun, J. Z., Yu-Jahnes, L. S., Gupta, A., Ketchen, M. B., Moler, K. A., and Bhushan, M., Direct Imaging of Integer and Half-Integer Josephson Vortices in High-$T_c$ Grain Boundaries, #emph[Phys. Rev. Lett.] #strong[76], 1336 (1996).] <bib-19>
#block(inset: (left: 1.7em))[#h(-1.7em)\[20\] #h(.25em)Boris, A. A., Rydh, A., Golod, T., Motzkau, H., Klushin, A. M., and Krasnov, V. M., Evidence for Nonlocal Electrodynamics in Planar Josephson Junctions. #emph[Phys. Rev. Lett.] #strong[111], 117002 (2013).] <bib-20>
#block(inset: (left: 1.7em))[#h(-1.7em)\[21\] #h(.25em)Krasnov, V. M., Bauch, T., Intiso, S., Hürfeld, E., Akazaki, T., Takayanagi, H., and Delsing, P., Collapse of Thermal Activation in Moderately Damped Josephson Junctions. #emph[Phys. Rev. Lett.] #strong[95], 157002 (2005).] <bib-21>
#block(inset: (left: 1.7em))[#h(-1.7em)\[22\] #h(.25em)Baumgartner, C., Fuchs, L., Costa, A., Reinhardt, S., Gronin, S., Gardner, G.C., Lindemann, T., Manfra, M.J., Faria Junior, P.E., Kochan, D. Fabian, J. Paradiso N. & Strunk C. Supercurrent rectification and magnetochiral effects in symmetric Josephson junctions. #emph[Nat. Nanotechn.] #strong[17], 39 (2022).] <bib-22>
#block(inset: (left: 1.7em))[#h(-1.7em)\[23\] #h(.25em)Walsh, E. D., Jung, W., Lee, G.-H., Efetov, D. K., Wu, B.-I., Huang, K.-F., Ohki, T. A., Taniguchi, T., Watanabe, K., Kim, P., Englund, D., and Fong, K. C., Josephson junction infrared single-photon detector. #emph[Science] #strong[372], 409--412 (2021).] <bib-23>
#block(inset: (left: 1.7em))[#h(-1.7em)\[24\] #h(.25em)Rodan-Legrain, D., Cao, Y., Park, J. M., de la Barrera, S. C., Randeria, M. T., Watanabe, K., Taniguchi, T., and Jarillo-Herrero, P., Highly tunable junctions and non-local Josephson effect in magic-angle graphene tunnelling devices, #emph[Nat. Nanotechn.] #strong[16], 769 (2021).] <bib-24>
#block(inset: (left: 1.7em))[#h(-1.7em)\[25\] #h(.25em)Zhang, E., Xu, X., Zou, Y.C., Ai, L., Dong, X., Huang, C., Leng, P., Liu, S., Zhang, Y., Jia, Z. & Peng, X., Nonreciprocal superconducting NbSe$""_2$ antenna. #emph[Nat. Comm.], #strong[11], 5634 (2020).] <bib-25>
#block(inset: (left: 1.7em))[#h(-1.7em)\[26\] #h(.25em)Kudriashov, A., t al., Non-Majorana origin of anomalous current-phase relation and Josephson diode effect in Bi$""_2$Se$""_3$/NbSe$""_2$ Josephson junctions, #emph[Sc. Adv.], #strong[11], eadw6925 (2025).] <bib-26>
#block(inset: (left: 1.7em))[#h(-1.7em)\[27\] #h(.25em)Moseley, R. W., Booij, W. E., Tarte, E. J., and Blamire, M. G., Direct writing of low superconductor-normal metal-superconductor junctions using a focused ion beam, #emph[Appl. Phys. Lett.] #strong[75], 262 (1999).] <bib-27>
#block(inset: (left: 1.7em))[#h(-1.7em)\[28\] #h(.25em)Krasnov, V. M., Ericsson, O., Intiso, S., Delsing, P., Oboznov, V. A., Prokofiev, A. S., and Ryazanov, V. V., Planar S--F--S Josephson junctions made by focused ion beam etching. #emph[Physica C] #strong[418], 16-22 (2005).] <bib-28>
#block(inset: (left: 1.7em))[#h(-1.7em)\[29\] #h(.25em)Golod, T., Rydh, A., and Krasnov, V. M., Detection of the phase shift from a single Abrikosov vortex. #emph[Phys. Rev. Lett.] #strong[104], 227003 (2010).] <bib-29>
#block(inset: (left: 1.7em))[#h(-1.7em)\[30\] #h(.25em)Cox, D. C., Gallop, J. C., Hao, L., Focused Ion Beam Processing of Superconducting Junctions and SQUID Based Devices, #emph[Nanofabrication] #strong[1], 53--64 (2014).] <bib-30>
#block(inset: (left: 1.7em))[#h(-1.7em)\[31\] #h(.25em)Golod, T., et al. Reconfigurable Josephson phase shifter. #emph[Nano Lett.] #strong[21], 5240--5246 (2021).] <bib-31>
#block(inset: (left: 1.7em))[#h(-1.7em)\[32\] #h(.25em)Fermin, R., de Wit, B., and Aarts, J., Beyond the effective length: How to analyze magnetic interference patterns of thin-film planar Josephson junctions with finite lateral dimensions, #emph[Phys. Rev. B] #strong[107], 064502 (2023).] <bib-32>
#block(inset: (left: 1.7em))[#h(-1.7em)\[33\] #h(.25em)Lahabi, K., Amundsen, M., Ouassou, J. A., Beukers, E., Pleijster, M., Linder, J., Alkemade, P., and Aarts, J., Controlling supercurrents and their spatial distribution in ferromagnets, #emph[Nat. Commun.] #strong[8], 2056 (2017).] <bib-33>
#block(inset: (left: 1.7em))[#h(-1.7em)\[34\] #h(.25em)Golod, T., Pagliero, A., and Krasnov, V. M., Two mechanisms of Josephson phase shift generation by an Abrikosov vortex. #emph[Phys. Rev. B] #strong[100], 174511 (2019).] <bib-34>
#block(inset: (left: 1.7em))[#h(-1.7em)\[35\] #h(.25em)Golod, T., Kapran, O. M., and Krasnov, V. M., Planar superconductor-ferromagnet-superconductor Josephson junctions as scanning-probe sensors, #emph[Phys. Rev. Appl.] #strong[11], 014062 (2019).] <bib-35>
#block(inset: (left: 1.7em))[#h(-1.7em)\[36\] #h(.25em)Golod, T. and Krasnov, V.M. Demonstration of a superconducting diode-with-memory, operational at zero magnetic field with switchable nonreciprocity. #emph[Nat. Commun.] #strong[13], 3658 (2022).] <bib-36>
#block(inset: (left: 1.7em))[#h(-1.7em)\[37\] #h(.25em)Grebenchuk, S. Y., Cattaneo, R., Golod, T., and Krasnov, V. M., Nonlocal long-range synchronization of planar Josephson-junction arrays, #emph[Phys. Rev. Appl.] #strong[17], 064032 (2022).] <bib-37>
#block(inset: (left: 1.7em))[#h(-1.7em)\[38\] #h(.25em)LeFebvre, J. C., Cho, E., Li, H., Cai, H., and Cybart, S. A., Flux focused series arrays of long Josephson junctions for high-dynamic range magnetic field sensing, #emph[J. Appl. Phys.] #strong[131], 163902 (2022).] <bib-38>
#block(inset: (left: 1.7em))[#h(-1.7em)\[39\] #h(.25em)Schmid, C., Jozani, A., Kleiner, R., Koelle, D., and Goldobin, E., YBa$""_2$Cu$""_3$O$""_7$ Josephson diode fabricated by focused-helium-ion-beam irradiation, #emph[Phys. Rev. Applied] #strong[24], 014041 (2025).] <bib-39>
#block(inset: (left: 1.7em))[#h(-1.7em)\[40\] #h(.25em)Roditchev, D., et al. Direct observation of Josephson vortex cores. #emph[Nat. Phys.] #strong[11], 332 (2015).] <bib-40>
#block(inset: (left: 1.7em))[#h(-1.7em)\[41\] #h(.25em)Grebenchuk, S. Y., et al., Observation of interacting Josephson vortex chains by magnetic force microscopy, #emph[Phys. Rev. Res.] #strong[2], 023105 (2020).] <bib-41>
#block(inset: (left: 1.7em))[#h(-1.7em)\[42\] #h(.25em)Chen, S., Park, S., Vool, U., Maksimovic, N., Broadway, D. A., Flaks, M., Zhou, T. X., Maletinsky, P., Stern, A., Halperin, B. I., and Yacoby, A., Current induced hidden states in Josephson junctions, #emph[Nature Commun.] #strong[15], 8059 (2024).] <bib-42>
#block(inset: (left: 1.7em))[#h(-1.7em)\[43\] #h(.25em)Barone A., and Paterno, G., Physics and Applications of the Josephson Effect (John Wiley & Sons, New York 1982).] <bib-43>
#block(inset: (left: 1.7em))[#h(-1.7em)\[44\] #h(.25em)Kogan, V. G., Dobrovitski, V. V., Clem, J. R., Mawatari, Y., and Mints, R. G., Josephson junction in a thin film, #emph[Phys. Rev. B] #strong[63], 144501 (2001).] <bib-44>
#block(inset: (left: 1.7em))[#h(-1.7em)\[45\] #h(.25em)Clem, J. R., Josephson junctions in thin and narrow rectangular superconducting strips. #emph[Phys. Rev. B] #strong[81], 144515 (2010).] <bib-45>
#block(inset: (left: 1.7em))[#h(-1.7em)\[46\] #h(.25em)Osborn, J. A., Demagnetizing Factors of the General Ellipsoid, #emph[Phys. Rev.] #strong[67], 351-357 (1945).] <bib-46>
#block(inset: (left: 1.7em))[#h(-1.7em)\[47\] #h(.25em)Hovhannisyan, R., Golod, T., and Krasnov, V. M., Superresolution magnetic imaging by a Josephson junction via holographic reconstruction of $I_c \( H \)$ modulation, #emph[Phys. Rev. Appl.] #strong[20], 064012 (2023).] <bib-47>
#block(inset: (left: 1.7em))[#h(-1.7em)\[48\] #h(.25em)Gubankov, V. N., Lisitskii, M. P., Serpuchenko, I. L., Sklokin, F. N. and Fistul', M. V., Influence of trapped Abrikosov vortices on the critical current of the Josephson tunnel junction, #emph[Supercond. Sci. Technol.] #strong[5], 168 (1992);] <bib-48>
#block(inset: (left: 1.7em))[#h(-1.7em)\[49\] #h(.25em)Sok, J., and Finnemore, D. K., Thermal depinning of a single superconducting vortex in Nb, #emph[Phys. Rev. B] #strong[50], 12770 (1994).] <bib-49>
#block(inset: (left: 1.7em))[#h(-1.7em)\[50\] #h(.25em)Weides, M., Kohlstedt, H., Waser, R., Kemmler, M., Pfeiffer, J., Koelle, D., Kleiner, R., and Goldobin, E., Ferromagnetic $0 dash.en pi$ Josephson junctions, #emph[Appl. Phys. A] #strong[89], 613 (2007).] <bib-50>
#block(inset: (left: 1.7em))[#h(-1.7em)\[51\] #h(.25em)Skog, A., Hovhannisyan, R., and Krasnov, V. M., Numerical Modeling of Vortex-Based Superconducting Memory Cells: Dynamics and Geometrical Optimization. #emph[Nanotechnology] #strong[14], 1634 (2024).] <bib-51>
#block(inset: (left: 1.7em))[#h(-1.7em)\[52\] #h(.25em)Cattaneo, R., Efimov, A. E., Shiianov, K. I., Kieler, O., and Krasnov, V. M., Cascade switching current detectors based on arrays of Josephson junctions, #emph[Nat. Commun.] #strong[16], 7927 (2025).] <bib-52>
#block(inset: (left: 1.7em))[#h(-1.7em)\[53\] #h(.25em)Borodianskyi E. A., and Krasnov, V. M., Josephson emission with frequency span 1-11 THz from small Bi$""_2$Sr$""_2$CaCu$""_2$O$""_(8 + delta)$ mesa structures, #emph[Nat. Commun.] #strong[8], 1742 (2017).] <bib-53>
#block(inset: (left: 1.7em))[#h(-1.7em)\[54\] #h(.25em)Miyamoto, M., Kobayashi, R., Kuwano, G., Tsujimoto, M., and Kakeya, I., Wide-band frequency modulation of a terahertz intrinsic Josephson junction emitter of a cuprate superconductor. #emph[Nat. Photon.] #strong[18], 267-275 (2024).] <bib-54>
#block(inset: (left: 1.7em))[#h(-1.7em)\[55\] #h(.25em)Kulik I. O., and Omel'yanchuk, A. N., Properties of superconducting microbridges in the pure limit, #emph[Sov. J. Low Temp. Phys.] #strong[3], 459 (1977). \[Zh. Eksp. Teor. Fiz. 73, 1434 (1977)\].] <bib-55>
#block(inset: (left: 1.7em))[#h(-1.7em)\[56\] #h(.25em)Krasnov, V. M., A distributed active patch antenna model of a Josephson oscillator. #emph[Beilstein J. Nanotechnol.] #strong[14], 151 (2023).] <bib-56>
#block(inset: (left: 1.7em))[#h(-1.7em)\[57\] #h(.25em)Karpov, A. Miller, D., Rice, F., Stern, J. A., Bumble, B., Le Duc, H. D., and Zmuidzinas, J., Low Noise 1 THz--1.4 THz Mixers Using Nb/Al-AlN/NbTiN SIS Junctions. #emph[IEEE Trans. Appl. Supercond.] #strong[17], 343 (2007).] <bib-57>
#block(inset: (left: 1.7em))[#h(-1.7em)\[58\] #h(.25em)Ando, Y., Sato, R., Tanaka, M., Takagi, K., Takagi N., and Fujimaki, A., Design and Demonstration of an 8-bit Bit-Serial RSFQ Microprocessor: CORE e4, #emph[IEEE Trans. Appl. Supercond.] #strong[26], 1301205, (2016).] <bib-58>
#block(inset: (left: 1.7em))[#h(-1.7em)\[59\] #h(.25em)Yamanashi, Y., Kainuma, T., Yoshikawa, N., Kataeva, I., Akaike, H., Fujimaki, A., Tanaka, M., Takagi, N., Nagasawa, S., and Hidaka, M., 100GHz demonstrations based on the single-flux-quantum cell library for the 10kA/cm2 Nb multi-layer process, #emph[IEICE Trans. Electron.] #strong[E93-C], 440-444 (2010).] <bib-59>
#block(inset: (left: 1.7em))[#h(-1.7em)\[60\] #h(.25em)Fourie, C. J., et al., ColdFlux Superconducting EDA and TCAD Tools Project: Overview and Progress, #emph[IEEE Trans. Appl. Supercond.] #strong[29], 1300407 (2019).] <bib-60>
