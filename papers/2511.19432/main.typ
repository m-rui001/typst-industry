#let horizontalrule = line(start: (25%,0%), end: (75%,0%))

#show terms: it => {
  it.children
    .map(child => [
      #strong[#child.term]
      #block(inset: (left: 1.5em, top: -0.4em))[#child.description]
      ])
    .join()
}

#set table(
  inset: 6pt,
  stroke: none
)

#show figure.where(
  kind: table
): set figure.caption(position: top)

#show figure.where(
  kind: image
): set figure.caption(position: bottom)

#let content-to-string(content) = {
  if content.has("text") {
    content.text
  } else if content.has("children") {
    content.children.map(content-to-string).join("")
  } else if content.has("body") {
    content-to-string(content.body)
  } else if content == [ ] {
    " "
  }
}
#let conf(
  title: none,
  subtitle: none,
  authors: (),
  keywords: (),
  date: none,
  abstract-title: none,
  abstract: none,
  thanks: none,
  cols: 1,
  margin: (x: 1.25in, y: 1.25in),
  paper: "us-letter",
  lang: "en",
  region: "US",
  font: none,
  fontsize: 11pt,
  mathfont: none,
  codefont: none,
  linestretch: 1,
  sectionnumbering: none,
  linkcolor: none,
  citecolor: none,
  filecolor: none,
  pagenumbering: "1",
  doc,
) = {
  set document(
    title: title,
    keywords: keywords,
  )
  set document(
      author: authors.map(author => content-to-string(author.name)).join(", ", last: " & "),
  ) if authors != none and authors != ()
  set page(
    paper: paper,
    margin: margin,
    numbering: pagenumbering,
    columns: cols
  )

  set par(
    justify: true,
    leading: linestretch * 0.65em
  )
  set text(lang: lang,
           region: region,
           size: fontsize)

  set text(font: font) if font != none
  show math.equation: set text(font: mathfont) if mathfont != none
  show raw: set text(font: codefont) if codefont != none

  show figure.caption: set text(size: 8.5pt)
  set heading(numbering: sectionnumbering)

  show link: set text(fill: rgb(content-to-string(linkcolor))) if linkcolor != none
  show ref: set text(fill: rgb(content-to-string(citecolor))) if citecolor != none
  show link: this => {
    if filecolor != none and type(this.dest) == label {
      text(this, fill: rgb(content-to-string(filecolor)))
    } else {
      text(this)
    }
  }

  place(top + center, float: true, scope: "parent", block(below: 1em, width: 100%)[
    #if title != none {
      align(center, block[
          #text(weight: "bold", size: 1.5em)[#title #if thanks != none {
              footnote(thanks, numbering: "*")
              counter(footnote).update(n => n - 1)
            }]
          #(
            if subtitle != none {
              parbreak()
              text(weight: "bold", size: 1.25em)[#subtitle]
            }
           )])
    }

    #if authors != none and authors != [] {
      let count = authors.len()
      let ncols = calc.min(count, 3)
      grid(
        columns: (1fr,) * ncols,
        row-gutter: 1.5em,
        ..authors.map(author => align(center)[
          #author.name \
          #author.affiliation \
          #author.email
        ])
      )
    }

    #if date != none {
      align(center)[#block(inset: 1em)[
          #date
        ]]
    }

    #if abstract != none {
      block(inset: 2em)[
        #text(weight: "semibold")[#abstract-title] #h(1em) #abstract
      ]
    }
  ])

  doc
}
#show: doc => conf(
  title: [Robotic chip-scale nanofabrication for superior consistency],
  authors: ((name: [#link("https://orcid.org/0000-0001-9849-3517")[Felix M. Mayor], #link("https://orcid.org/0009-0006-9284-7920")[Wenyan Guan], #link("https://orcid.org/0009-0000-2318-1180")[Erik Szakiel], #link("https://orcid.org/0000-0001-6176-1274")[Amir H. Safavi-Naeini], #link("https://orcid.org/0000-0003-2080-9897")[Samuel Gyger]],
    affiliation: [Department of Applied Physics and Ginzton Laboratory, Stanford University, 348 Via Pueblo Mall, Stanford, California 94305, USA],
    email: [fmayor\@stanford.edu ? gyger\@stanford.edu]),),
  paper: "us-letter",
  font: "Libertinus Serif",
  fontsize: 10pt,
  margin: (x: 17mm, y: 18mm),
  sectionnumbering: "1.1",
  abstract-title: [Abstract],
  abstract: [Unlike the rigid, high-volume automation found in industry,
academic research requires process flexibility that has historically
relied on variable manual operations. This hinders the fabrication of
advanced, complex devices. We propose to address this gap by automating
these low-volume, high-stakes tasks using a robotic arm to improve
process control and consistency. As a proof of concept, we deploy this
system for the resist development of Josephson junction devices. A
statistical comparison of the process repeatability shows the robotic
process achieves a resistance spread across chips close to 2~%, a
significant improvement over the $tilde.op 7 med upright("%")$ spread
observed from human operators, validating robotics as a solution to
eliminate operator-dependent variability and a path towards
industrial-level consistency in a research setting.

],
  pagenumbering: "1",
  cols: 2,
  doc,
)


Nanofabrication, the ability to engineer materials down to the nanometer
scale, is a cornerstone of modern technology.@Gatzen.Saile.ea:2015 Its
biggest impact is semiconductor electronics, but it is now an integral
component in almost every field of advanced science. The technology is
defined by two disparate worlds. On one hand, industrial foundries run
billion-dollar factory floors, with highly optimized, almost completely
automated processes inside cleanroom facilities on 300~mm wafers to
produce silicon electronics at massive scale. On the other hand, in
universities and research centers, cleanrooms operate as high-mix,
low-volume environments. Here, flexibility, small-area source materials,
and reconfigurable operations are the norm to explore new materials,
techniques and physical properties to provide the foundation for future
technology cycles.

Crucial for exploring new ideas, this artisanal research environment
spans not only silicon-adjacent fields like integrated
nanophotonics@Yang.Jeon.ea:2025, brain-inspired
computing@Mehonic.Ielmini.ea:2024, and quantum-enhanced
technology@Laucht.Hohls.ea:2021, but also biomedical
applications@Luttge:2016, neuroscience@hong2019novel, and
next-generation sensors@Kar.Guerra.ea:2024. Such explorations are
characterized by highly manual operations, small sample sizes,
significant process flexibility, and a wide variety of material stacks.
While this flexibility drives scientific discovery, it also represents a
critical bottleneck. The reliance on humans for complex, multi-step
processes introduces significant variability, limiting reproducibility
and hindering the fabrication of highly complex integrated devices.

#figure(image("source/Figures/fig1.pdf", width: 100%),
  caption: [
    #strong[Robotic Assisted Nanofabrication.] Robotic arms
    equipped with tweezers are the missing link for explorative
    nanofabrication at sample scale. We foresee four tasks enabled by
    picking up and handling samples that promise improvement in
    reliability and safety. #strong[\(a)] Cleaning samples in ultrasonic
    solvent baths or chemical cleans. #strong[\(b)] Spinning resist
    using electronic pipettes for volume control, followed by standard
    spinners and hotplates. #strong[\(c)] Loading prepared substrates on
    carrier wafers for processing and using resist or oil for bonding.
    Accurate placement on tool carriers for lithography reduces loading
    time and increases tool utilization. #strong[\(d)] Developing
    samples by controlled liquid chemical exposure and final drying
    step. Explored in this work.
  ]
)
<fig:concept>

Nanofabrication tools for lithography, deposition, and etching already
offer high degrees of automation. The remaining gaps are in sample
transfer, metrology, and most critically, in wet-chemical processing.
These steps are often realized entirely by human action and are a major
source of process uncertainty.

The recent developments of affordable, high-accuracy and table-top
robotics present a solution to closing this gap for sample and
small-batch fabrication. While still a notable investment, their cost is
comparatively negligible against the expenditure connected to a
cleanroom operation. Automating these manual steps paves the way towards
a fully automated, flexible and high-fidelity nanofabrication pipeline
for research and automated discovery. We envision four core areas (see
Fig.~#link(<fig:concept>)[1]) where such a robot will be immediately useful: (a)
cleaning samples in solvents or aggressive chemicals, (b) preparing them
for lithography, (c) accurate placement and fixation on sample carriers
for etch, deposition or lithography, and (d) resist development.

The benefits range from improved chemical safety to higher and more
repeatable throughput. To justify the investment, such a robot must
offer more than just convenience: it must drive tangible improvements in
process outcomes. We select resist development as our case study because
it offers significant potential for improving chip consistency.

We compare the fabrication of a Dolan-bridge style Josephson Junction
(JJ)@Niemeyer.Kose:1976@Dolan:1977, a key building block for
superconducting quantum computing and
electronics@GoogleQuantumAI:2025@AWSQuantumComputing:2025@Krantz.Kjaergaard.ea:2019,
specifically examining the difference between manual and robotic resist
development. We show a clear reduction in sample-to-sample variability
in the robotic case by eliminating inter-operator variance, a common
source of inconsistency in research environments where multiple
researchers conduct the same process.

#figure(image("source/Figures/fig2.pdf", width: 100%), placement: top, scope: "parent",
  caption: [
    #strong[Robotic Resist Development.] #strong[\(a)] After
    chip detection and hand-eye transformation, the tool-height is
    calibrated using torque-based feedback. Each chip is then
    individually picked up, swirled inside a developer solution and a
    rinse solution for 40~s and 10~s respectively, before being
    blow-dried for 10~s in a nitrogen flow. Afterwards the chip is
    returned to the chip-carrier. #strong[\(b)] OpenCV-based chip-edge
    detection allows free placement of chip-carrier by a human operator.
    #strong[\(c)] Reliable height detection for chip pick up. Relative
    torque on joint $5$ of the arm versus vertical step height, starting
    from an overdriven position (verified by an initial drop in torque
    of 15~% upon lifting the tweezers, see dashed line). The arm raises
    the tweezers in 0.1~mm steps until the torque change between steps
    drops below 0.8~% (blue line), inferring that the tips have lifted
    off the chip box. This point establishes the reference height for
    grasping. #strong[\(d)] Mecademic M500 Robot on an optical
    breadboard with access to the required fabrication steps for sample
    based wet-bench tasks. #strong[\(e)] CAD of the chip showing the
    array of JJ test devices. In each row, there are $12$ identical
    devices, and we sweep the JJ width over the $9$ rows.
    #strong[\(f)] Microscope image of a fabricated JJ test device after
    probing. Scale bar: 100~μm.
  ]
)
<fig:fab>

The detailed robotic developing process is described in
Fig.~#link(<fig:fab>)[2]\(a). A sample box with a $3 times 3$ grid (Entegris
H44-999-1415) is placed on a breadboard within reach of a robotic arm
(Meca500-R4) with $6$ degrees of freedom and controlled via ROS2. The
arm is equipped with a gripper (MEGP-25 LS) toolhead to which we attach
a pair of tweezer tips (3D printed adapter to Techni-Pro 758TW0305
replacement tips). A camera (Realsense D405), mounted to the arm (link
5), points at the sample box. We run a chip detection algorithm based on
OpenCV to extract the position and angle of all the chips placed in the
sample box, see Fig.~#link(<fig:fab>)[2]\(b). Previously performed hand-eye
calibration allows us to transform coordinates from the camera to the
tweezer tip frame (see @SI:hand). We use the in-plane coordinates to
move the robotic arm to the first chip and hover the tweezers in the
open position over the chip. Since the chip is only
$0.5 med upright("m") upright("m")$ thick, we cannot rely on the camera
image for finding the correct height. Instead, we rely on a torque-based
method to measure the grasping height. The robotic arm lowers the
tweezer tips onto the sample box surface next to the chip, using the
resulting torque spike to detect contact. Subsequently, the tweezer tips
are raised in steps of $0.1 med upright("m") upright("m")$ until the
change in torque between steps decreases below 0.8~%. This signals that
the tips have lifted off the bottom surface of the sample box. From this
we obtain the height of the surface on which the chips rest and choose
to grasp the chip 0.2~mm above this surface. A typical torque change
versus step height is shown in Fig.~#link(<fig:fab>)[2]\(c). Note that the torque
does not change as much anymore once the step height goes above a
specific value which means that the tweezers are now released from the
surface.

The gripper then proceeds to close by a predefined amount to grasp the
chip. The slightly compliant tweezer arms create a solid grip as the
robot moves the chip to a beaker of developer solution (IPA:MIBK 3:1).
The robotic arm swirls the chip in the solution in a circular motion for
a user-specified amount of time (40~s). Afterwards, it moves to a second
beaker filled with a rinse solution (IPA) and does the same swirling
motion for $10 med upright("s")$. To dry the chip, the robotic arm holds
the chip in front of a USB-controlled $upright("N")_2$ gun on top of a
cleanroom wipe to absorb the solvent. We find that for our
configuration, drying for 10~s leaves the chip free of drying-induced
residue. Finally, the robot returns the chip to its original position.
It repeats the development for the remaining chips in the box and reuses
the chip grasping height found for the first chip to save time. The full
setup is shown in Fig.~#link(<fig:fab>)[2]\(d) where the ChArUco calibration board
is in the back right and the blow-drying on the left.

To investigate whether robotic development presents significant
advantages for process reliability, we choose to fabricate and
characterize Josephson Junctions (JJ) where the e-beam resist
development is done by either robotic or human operators. We will use JJ
resistance variation as our primary metric, as it is a common benchmark
for process
optimization@Kreikebaum.OBrien.ea:2020@Muthusubramanian.Finkel.ea:2024
and a direct indicator for the critical current of the JJ. The
fabrication flow is designed to minimize differences between the chips
developed by robotic and human operators, so that the most significant
difference comes from developing itself. We start by forming a shallow
grid with period $10 med upright("m") upright("m")$ and
$5 med upright("m") upright("m")$ on the backside of a $4$-inch high
resistivity
($> 10 med upright("k") upright("Ω") upright("c") upright("m")$) silicon
wafer by partially dicing it to a depth of 100~μm. After stripping the
protective resist with acetone and isopropyl alcohol, we proceed to
spinning the front side of the wafer with a bilayer of e-beam resist
(270~nm PMMA on 600~nm MMA) and doing e-beam lithography (Raith EBPG
5200+) on the wafer.

The pattern consists of $52$ identical chips (see #link(<fig:wafer>)[Supplementary Figure 1]\(a)) and we
take care to align the exposure with the backside grid. The pattern on
each chip consists of $9$ rows of $12$ identical Josephson junction test
devices, see Fig.~#link(<fig:fab>)[2]\(e). The JJ electrode width is swept from
50~nm to 350~nm over the rows. The junction geometry is shown in
#link(<fig:resistance>)[Supplementary Figure 2]\(a). After the exposure, and before developing, we
cleave the wafer into individual chips which is made easier thanks to
the pre-diced grid. By cleaving the wafer into chips, we can develop
each of them separately. Among all the chips, we select $18$ of them
based on the quality of the cleaved edges and distribute the chips into
two groups: robot ($9$ chips) and human operator ($9$ chips) groups. The
human group is further subdivided into three groups with three chips
each, and where each group is assigned to a different experienced human
operator (Human A, B and C). The $9$ chips in the robot group are then
developed by the robotic arm while in parallel, the human operators
develop $3$ chips each. Because of the jagged edges from imperfect
cleaving, the robot lost grip on $3$ of the samples during development.
We replaced the dropped samples and they were subsequently successfully
developed by the robot.

The next step is deposition of the aluminum/aluminum oxide JJs in an
evaporator (Plassys MEB550S). To load all the developed samples
simultaneously into the chamber, we first glue them with PMMA on a
carrier wafer on which a grid has been pre-diced (see #link(<fig:wafer>)[Supplementary Figure 1]\(b)).
The grid is important because the aluminum evaporation for the JJ is
angled and therefore the orientation matters. After the aluminum
evaporation, the liftoff is done in a 80~°C solution of NMP, thereby
completing the fabrication.@Kelly:2015 A microscope image of a single
device is shown in Fig.~#link(<fig:fab>)[2]\(f).

#figure(image("source/Figures/Fig3.pdf", width: 100%),
  caption: [
    #strong[Robotic vs. human fabrication consistency.]
    #strong[\(a)] Intra-chip consistency of junction resistance. Box
    plot of the intra-row coefficient of variation (CV) for all device
    rows, grouped by operator. The red line is the median, the blue box
    spans the interquartile range (IQR, 25th to 75th percentile) and the
    whiskers extend to $1.5 times$ IQR. Individual data points are
    overlaid as black dots. The robot group exhibits a lower median CV
    compared to the 'All Humans' group. #strong[\(b)] Inter-chip
    consistency of junction resistance. Bar chart comparing the CV for
    the robot (orange) and 'All Humans' (blue) groups for different
    junction widths. The CV is computed from the set of 9 mean
    resistances (one from each chip) per operator group for a given
    junction width.
  ]
)
<fig:results>

We proceed to characterizing the resistance of the JJs at room
temperature. The resistance is related to JJ critical
current@Ambegaokar.Baratoff:1963 and therefore the superconducting qubit
frequency. Since the number of devices across $18$ chips totals $1944$,
we use an automatic probe station (Micromanipulator P200L) to measure
the IV curves, and extract the resistance of each JJ. The device yield
is not 100~% and before analyzing the results, we discard non-functional
devices (shorted and open) and statistical outliers. First, we discard
the entire row of 50~nm wide JJs due to low yield, and difficulty in
distinguishing a working JJ from an open device, which removes 216
devices. Next, to systematically remove the statistical outliers, we
apply a row-wise $1.5 times upright("IQR")$ filter. For each junction
geometry (row), we calculate the first and third quartiles (Q1, Q3)
across all chips and remove measurements falling outside the range
\[$upright("Q1") - 1.5 times upright("IQR")$,
$upright("Q3") + 1.5 times upright("IQR")$\]. This step leads to the
removal of 118 outliers. Finally, 9 devices were damaged by glue or a
scratch during the fabrication process, leaving a total of 1601
high-quality measurements for the final analysis.

Our objective is to quantify the difference between the robot and human
operator groups. We start by looking at the spread of resistances across
identical devices on the same chip. For each row on every chip, we
compute the intra-row coefficient of variation (CV) of the resistances,
defined as the ratio of the standard deviation $sigma$ to the mean
resistance $mu$ for that particular row, i.e.
$upright("CV") = sigma \/ mu$. Calculating the CV instead of just the
standard deviation allows us to normalize the spread, so that we can
compare results across chips and geometries, even for groups of devices
with different mean resistances. A larger intra-row CV indicates more
disorder across identical devices on the same chip. We plot the
intra-row CV for every row as black points in Figure~#link(<fig:results>)[3]\(a)
and separate the points into the different operators. The data points
are overlaid on a box plot that summarizes the distribution of the CVs.
For the robot, we obtain a median intra-row CV of 3.1~% compared to
3.6~% for the 'All Humans' group, in line with usual fabrication
uncertainties@Pop.Fournier.ea:2012@Kreikebaum.OBrien.ea:2020. This shows
that with the robot, identical devices on the same chip have an equal or
slightly lower spread in resistance compared to a chip developed by a
human operator.

While the previous metric looks at consistency within a chip, we can
also analyze how resistance values vary across chips for nominally
identical devices. The goal is to see if there are any variations
between operators for chip development. To do this, we compute the mean
resistance for each geometry on each chip and separate it into a robot
and human group. These values are displayed in #link(<fig:resistance>)[Supplementary Figure 2]\(b) and
(c). For each geometry, we take the standard deviation of the $9$ mean
resistances and divide by the mean of the means. This gives us the
inter-chip CV for each row which describes the spread in mean resistance
across different chips. A low inter-chip value means that the mean
resistance does not vary much from chip to chip. We plot the results as
a bar chart in Fig.~#link(<fig:results>)[3]\(b). For the wider JJs, we see that the
CV is about $2$-$3$ times lower for the robot than for the human
operator group. For example, for the 350~nm wide JJs, we measure a 2.1~%
spread in mean resistance between the robot chips, compared to 7.2~%
between the human chips. For narrower JJs, the difference becomes
smaller, possibly due to other process variations becoming more
dominant. This variability is accentuated by the involvement of three
different human operators, highlighting how individual stirring
techniques and timing introduce significant disorder. While a single
expert human might achieve high consistency, the robotic system ensures
this baseline performance is maintained regardless of the operator,
effectively removing the 'human factor' from the process equation.

In conclusion, we have deployed a robotic arm for automatic chip-scale
resist development that integrates camera-based chip detection,
torque-feedback height calibration and a tweezer toolhead. Initial tests
show that this system provides superior consistency over pooled human
operators, demonstrating that robotic automation effectively
standardizes the process across different users. This is particularly
valuable in academic settings with high personnel turnover, and our
results effectively highlight the process disorder generated by
different human operators.

We expect devices with small critical dimensions, such as
superconducting qubits or photonic crystals to benefit most from this
improved reliability. As highlighted in Fig.~#link(<fig:concept>)[1], other process
steps are also likely to see an improvement in reliability and
consistency by switching to robotic operation. For instance, the
automated and precise gluing of small chips onto carrier wafers would
ensure consistent location and orientation, improving consistency during
subsequent etching or deposition steps in tools designed for full
wafers. The increased reliability, which reduces inter-chip spread to
levels comparable with intra-chip spread, opens up explorations of
processes that rely on systematic variations between chips, such as
testing different development times, deposition conditions, or etching
conditions. Furthermore, automating such processes significantly reduces
human exposure to hazardous cleanroom chemicals, such as Piranha
(sulfuric acid and hydrogen peroxide), warm hydrofluoric
acid@Hartung.Kley.ea:2008 or the developer tetramethylammonium hydroxide
(TMAH)@Lee.Wang.ea:2011.

For this system to be truly compatible with the flexible nature of a
research environment, it must be adaptable. A cleanroom user testing a
minor process variation should not need to reprogram the robot's entire
linear sequence. Future work will therefore focus on integrating a large
language model (LLM) to dynamically generate or modify process scripts
based on simple user requests. Furthermore, adding a real-time
supervision model to detect and correct manipulation errors, such as a
misplaced chip, will be crucial for robust, long-term deployment.

Looking forward, as embodied artificial intelligence advances, more
complex and high-stakes tasks are becoming increasingly feasible. This
includes the precise, rotationally-aligned stacking of 2D materials for
van der Waals heterostructures, the hybrid micro-assembly of disparate
components, like photonic lasers and silicon chips, or the
high-precision alignment of optical fiber arrays. All of these can be
performed inside an inert atmosphere to reduce surface impurities.
Automating these delicate tasks, which are notoriously difficult for
humans, promises to vastly improve process control and unlock new
research avenues across physics and materials science.

#heading(level: 1, numbering: none)[Acknowledgments]
<acknowledgments>
The authors would like to thank Kaveh Pezeshki, Samuel Engel, Nelson
Ooi, Hubert Stokowski and Matthew~P. Maksymowych for fabrication
assistance and for useful discussions. This work was primarily funded by
Amazon Web Services Inc.~and US federal government via the US Department
of Energy through grant no.~DE-AC02-76SF00515 (Q-NEXT Center) and the
U.S. Army Research Office (ARO)/Laboratory for Physical Sciences (LPS)
Modular Quantum Gates (ModQ) program (Grant No. W911NF-23-1-0254). We
are grateful for support for this work from the Gordon and Betty Moore
Foundation, Grant 12214. S.G. acknowledges support by the Swiss National
Science Foundation (SNSF) \[225443\] and the Knut and Alice Wallenberg
foundation \[KAW 2021-0341\]. Part of this work was performed at
nano\@stanford RRID:SCR\_026695.

Fig.~#link(<fig:concept>)[1] was illustrated with the help of generative image
models. The text was edited for clarity, grammar, and style using
generative multi-modal models.

#heading(level: 1, numbering: none)[Competing interests]
<competing-interests>
A.H.S.-N. is an Amazon Scholar.

#heading(level: 1, numbering: none)[Data availability]
<data-availability>
An overview of the project can be found on
#link("https://www.youtube.com/watch?v=hRR8uEAh57A")[YouTube]
(#link("https://www.youtube.com/watch?v=hRR8uEAh57A")). A video of the
developing of the devices, including the robotic arm and the three human
operators, presented here can be found on
#link("https://youtu.be/mcq2ElSzgdM")[YouTube]
(#link("https://youtu.be/mcq2ElSzgdM")). The code is released on GitHub
#link("https://github.com/alps-ml/paper.robotic-resist-development")[alps-ml/paper.robotic-resist-development]
(#link("https://github.com/alps-ml/paper.robotic-resist-development")).
A version of the code, as well as the raw data used to generate the
figures is available at
#link("https://zenodo.org/doi/10.5281/zenodo.17636138")[Zenodo]
#link("https://zenodo.org/doi/10.5281/zenodo.17636138").

#bibliography("source/ref.bib", style: "american-physics-society")

#pagebreak()
#set page(columns: 1)
#set heading(numbering: n => [Supplementary Note #n])
#counter(figure.where(kind: image)).update(0)
#show figure.where(kind: image): set figure(supplement: [Supplementary Figure])
#heading(level: 1, numbering: none)[Supplementary information]
<supplementary-information>
= Other sources of process variation
<other-sources-of-process-variation>
Apart from developing, we can identify a few other reasons for process
uncertainty. The location of the chip during e-beam lithography and
during deposition can have an effect on process variation. In
#link(<fig:wafer>)[Supplementary Figure 1]\(a), we show the location of the chips in the robot and human
operator groups before cleaving. Since resist thickness is not perfectly
uniform, this can influence the effective overlap in the junction area,
and therefore could lead to some process variation. We report the resist
thicknesses for every chip in Supplementary Data
Table~#link(<tab:resist_thickness_data>)[I]. We find that the resist thickness
spread is similar for both the robot and human operator groups. We do
not expect this to be a large influence in our case, evident also by the
fact that our resistance spread is comparable to other work in the field
@Pop.Fournier.ea:2012. Another possible source of process variation
between chips could arise from the location of the chips in the
deposition chamber which would affect film thickness. We distribute the
chips on the carrier wafer by interleaving chips developed by humans and
the robot to cancel out this effect as much as possible.

#figure(image("source/Figures/SI_wafer.pdf", width: 100%),
  caption: [
    #strong[Chip location during fabrication.]
    #strong[\(a)] Location of the chips on the original $4$-in wafer
    during e-beam lithography, sorted by operator during developing. HA
    (B, C) stands for Human A (B, C) and R for Robot.
    #strong[\(b)] Chips glued to a carrier wafer for the aluminum
    deposition step. The carrier wafer has a pre-diced grid to
    facilitate alignment of the chips to the tilting axis during
    evaporation.
  ]
)
<fig:wafer>

#let resist-table(rows) = table(
  columns: (auto, auto, 1fr, 1fr),
  align: (left, left, right, right),
  inset: (x: 4pt, y: 3pt),
  table.hline(),
  table.header([*Operator*], [*Replicate*], [*PMMA (nm)*], [*MMA (nm)*]),
  table.hline(),
  ..rows,
  table.hline(),
)

#figure(
  grid(
    columns: (1fr, 1fr),
    gutter: 1em,
    align: top,
    text(size: 9pt, resist-table((
      [HA], [1], [261.0], [596.0],
      [], [2], [263.0], [600.0],
      [], [3], [261.0], [592.0],
      [], [_Mean_], [261.7], [596.0],
      [], [_Std. Dev._], [1.2], [4.0],
      table.hline(),
      [HB], [1], [262.0], [594.0],
      [], [2], [264.0], [597.0],
      [], [3], [261.0], [592.0],
      [], [_Mean_], [262.3], [594.3],
      [], [_Std. Dev._], [1.5], [2.5],
      table.hline(),
      [HC], [1], [262.0], [598.0],
      [], [2], [288.0], [614.0],
      [], [3], [261.0], [592.0],
      [], [_Mean_], [270.3], [601.3],
      [], [_Std. Dev._], [15.3], [11.4],
      table.hline(),
      table.cell(colspan: 2)[*Mean (Humans)*], [264.8], [597.2],
      table.cell(colspan: 2)[*Std. Dev. (Humans)*], [8.8], [6.9],
    ))),
    text(size: 9pt, resist-table((
      [Robot], [1], [263.0], [598.0],
      [], [2], [261.0], [592.0],
      [], [3], [266.0], [610.0],
      [], [4], [281.0], [608.0],
      [], [5], [290.0], [615.0],
      [], [6], [275.0], [612.0],
      [], [7], [261.0], [590.0],
      [], [8], [278.0], [613.0],
      [], [9], [286.0], [613.0],
      table.hline(),
      table.cell(colspan: 2)[*Mean (Robot)*], [273.4], [605.7],
      table.cell(colspan: 2)[*Std. Dev. (Robot)*], [11.1], [9.7],
    ))),
  ),
  kind: table,
  supplement: [Supplementary Data Table],
  numbering: "I",
  caption: [*Thickness measurements of PMMA and MMA layers* using reflectometry (Filmetrics F40).
    The thickness at the chip center is interpolated based on a $10 times 10$~mm grid.],
) <tab:resist_thickness_data>

= Mean Josephson junction resistance values
<SI:resistance>
In Fig.~#link(<fig:results>)[3]\(b), we showed the inter-chip CV for each JJ width
(the JJ geometry is shown in #link(<fig:resistance>)[Supplementary Figure 2]\(a)). This CV was
calculated based on the mean JJ resistance on each chip for a particular
JJ geometry. We plot these mean resistance values in
#link(<fig:resistance>)[Supplementary Figure 2]\(b). From the data points, we can see that the human
operator resistance values are more spread out compared to the robot
ones. The CV we compute in the main text quantifies this spread. To
better visualize this spread, we normalize these resistance values by
the respective median and plot them overlaid on a box plot in
#link(<fig:resistance>)[Supplementary Figure 2]\(c), showing that while an individual human operator
might be as consistent as a robotic arm, there is a larger spread among
human operators.

#figure(image("source/Figures/SI_resistance.pdf", width: 100%),
  caption: [
    #strong[Josephson junction resistance.]
    #strong[\(a)] Josephson junction design, showing what we refer to as
    JJ width. #strong[\(b)] Mean JJ resistance vs JJ width for the 18
    chips, separated into robot (orange) and human (blue) operators.
    Mean over all the robot (human) chips are marked with an orange
    (blue) diamond, and the overall mean with a black diamond marker.
    #strong[\(c)] Mean resistance on each chip normalized by the
    respective median, and grouped by junction width and operator (black
    data points). A box plot is overlaid on top of the points showing
    that the robot group has a smaller resistance spread across chips
    than the 'All humans' group. The horizontal black line in the box
    plot is the median.
  ]
)
<fig:resistance>

= Hand-eye calibration
<SI:hand>
The camera is mounted to link 5 of the Mecademic robot using a custom
mount, see #link(<fig:handeye>)[Supplementary Figure 3]\(a). A common challenge in robotics is to map
the position and orientation of objects from the camera frame to the
end-effector frame. When we detect chips using the camera, we need to
transform the chip position in the camera frame to the position in the
Tool Center Point (TCP) frame which is at the tweezer tips (i.e. the
end-effector). The tweezers themselves are mounted to link $6$ of the
robot. While the transformation from link $6$ to the tweezer tips is a
simple offset, the transformation from the camera frame to link $6$ is
more involved. We construct a Unified Robot Description Format (URDF) of
the Mecademic robot which allows us to do the transformation from link
$5$ to link $6$ using the tf2 library~@foote2013tf. For the camera frame
to link $5$, we use the MoveIt2 calibration
package~@orsula2024moveit2calibration to compute this transformation
based on the Park~1994 method~@park1994robot. To do this, we take $9$
sample pictures of a $5 times 7$ ChArUco board (see #link(<fig:handeye>)[Supplementary Figure 3]\(b))
with the camera mounted to the robot, making sure to include a diverse
set of joint states for the robot. We use a board with marker size of
14.2~mm and a total board length of 148.1~mm, and the DICT\_5X5\_250
ArUco dictionary from OpenCV. We don't perform any additional
calibration on the RealSense camera which is precalibrated by the
manufacturer.

One challenge is that the chips are very thin (0.5~mm), making it hard
to accurately measure the correct grasping height using the camera. When
applying the transformations, we therefore assume that the chip is
parallel to the table and only take the in-plane ($x$-$y$) coordinates
and the in-plane rotation into account. For finding the height ($z$), we
use the much more precise torque feedback as explained in the main text.

The resulting set of transformations corresponds to our hand-eye
calibration. We are able to accurately grab a
$10 times 5$~mm chip on its short edge thanks
to our calibration being accurate within
$tilde.op 3 med upright("m") upright("m")$. We did not observe any
deterioration in the calibration accuracy over a period of $4$ months,
showing that our camera mount is robust.

#figure(image("source/Figures/SI_handeye.pdf", width: 100%),
  caption: [
    #strong[Hand-eye calibration.] #strong[\(a)] Close-up
    of the robot end-effector and camera. #strong[\(b)] ChArUco board
    overlaid with marker detection boxes, found using OpenCV via the
    MoveIt2 calibration package.
  ]
)
<fig:handeye>


