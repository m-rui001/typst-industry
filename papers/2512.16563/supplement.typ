#set document(title: "Supplemental Material: Current-Induced Modulation of Spin-Wave Propagation in a Y-Junction via Transverse Spin-Transfer Torque")
#set page(paper: "us-letter", margin: (x: 19mm, y: 18mm), columns: 2, numbering: "1")
#set text(font: "Libertinus Serif", size: 10pt)
#set par(justify: true, leading: .55em)
#set figure(placement: auto)
#show figure.caption: set text(size: 9pt)
#set figure(numbering: n => "S" + str(n))
#set heading(numbering: "I.")
#place(top, float: true, scope: "parent", clearance: 1em)[
  #align(center)[
    #text(size: 16pt, weight: "bold")[Supplemental Material: Current-Induced Modulation of Spin-Wave Propagation in a Y-Junction via Transverse Spin-Transfer Torque]
    #v(.55em)
    Lorenzo Gnoatto#super[1], Rai M. Menezes#super[2,3], Artim L. Bassant#super[4], Rembert A. Duine#super[1,4], Milorad V. Milo?evi?#super[2], and Reinoud Lavrijsen#super[1]
    #v(.45em)
    #text(size: 8.5pt)[#super[1]Department of Applied Physics and Science Education, Eindhoven University of Technology, Eindhoven, The Netherlands \
      #super[2]COMMIT, Department of Physics, University of Antwerp, Antwerp, Belgium \
      #super[3]Departamento de F?sica, Universidade Federal de Pernambuco, Recife, Brazil \
      #super[4]Institute for Theoretical Physics, Utrecht University, Utrecht, The Netherlands \
      #link("mailto:milorad.milosevic@uantwerpen.be") #h(1em) #link("mailto:r.lavrijsen@tue.nl")]
  ]
]

= Area variation during measurements
<app:area_var>
#figure(image("source/Fig_S1.pdf", width: 100%), scope: "parent",
  caption: [
    Measurements at 0 mA after a full set of measurements
    ($plus.minus 10 upright("mA") \, med plus.minus 15 upright("mA") \, med plus.minus 20 upright("mA") \)$
    was performed for $O_1$ of the device measured in Figure 3 (c-e) in
    the main text.
  ]
)
<SWD_sup_2>

To verify device integrity and assess reproducibility throughout the
experiment, we monitored the rerouted spin-wave signal at zero DC
current following each set of measurements performed under increasing
current amplitudes. The measurement sequence followed the order: 0~mA,
$plus.minus$5~mA, 0~mA, $plus.minus$10~mA, 0~mA, and so on. This allowed
us to track any potential degradation or irreversible changes in the
signal due to current stress. As shown in @SWD_sup_2, the extracted
signal areas at zero current remain largely consistent over the
measurement sequence. While a slight downward trend in the mean values
is observed, the overlap of the standard error of the mean (SEM)
intervals suggests that this variation is not statistically significant
within the current dataset.

= Additional measurements on different devices
<app:add_meas>
@SWD_sup_1\(a--c) and~@SWD_sup_1\(d--f) present measurements from two
additional devices, used to assess the reproducibility of the spin-wave
rerouting behavior. While both datasets qualitatively show the expected
superposition of a symmetric quadratic background (attributed to Joule
heating) and a polarity-dependent linear contribution (linked to
spin-transfer torque), the strength of the linear response varies
between devices. In particular, the device shown in
@SWD_sup_1\(a--c) exhibits significantly larger uncertainties in the
extracted linear term, making it difficult to confidently resolve the
directionality of the STT-induced rerouting. In contrast, the device in
@SWD_sup_1\(d--f) shows a clearer and more consistent trend, similar
to that reported in the main text. The origin of the larger uncertainty
in device a--c is difficult to pinpoint, as all devices were measured
using identical protocols and equipment. Nevertheless, the overall
behavior supports the conclusion that transverse STT enables rerouting
of spin-waves.

#figure(image("source/Sup_1_Ink.pdf", width: 100%), scope: "parent",
  caption: [
    a--b) Transmitted signal amplitude for $O_1$ and $O_2$,
    respectively, for a second measured device; c) corresponding linear
    component comparison. d--f) Same analysis for a third device.
  ]
)
<SWD_sup_1>
