// Kozlowski and Pugnaloni, arXiv:2502.02306v1. Converted from LaTeX under CC BY 4.0.
// https://arxiv.org/abs/2502.02306v1 | https://creativecommons.org/licenses/by/4.0/
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

  block(below: 1em, width: 100%)[
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
  ]

  doc
}
#show: doc => conf(
  title: [Flow rate from a vertical silo with a tilted orifice],
  authors: (
    ( name: [Ryan Kozlowski],
      affiliation: "",
      email: "" ),
    ( name: [Luis A. Pugnaloni],
      affiliation: "",
      email: "" ),
    ),
  abstract-title: [Abstract],
  abstract: [The flow of dry granular materials from silos is of great
practical interest in industry and of theoretical import for
understanding multiphase dynamics. Recent studies have demonstrated that
one way to control the rate of flow from a silo is to tilt it. However,
this may not be practical in many industrial applications. Here, we
demonstrate in experiments of quasi-2D silo discharge of monodisperse
grains that the flow rate can be modulated by rotating the orifice --
through elevating and shifting one side of the base -- instead of
tilting the entire silo. We use high-speed image analysis to track the
average motion of grains in the silo. We first show that the flow rate
decreases with orifice angle, but that this decrease is not as strong as
when a silo is tilted or when a lateral orifice is used. However, with
the addition of a grain-sized ridge on each side of the orifice, the
flow rate collapses with prior tilted-silo results. We then characterize
the flow velocity of grains exiting the orifice and highlight key
features of the stagnant zones and slip zones on each orifice side.
Finally, we model our results based on these measurements, demonstrating
the importance of horizontal creep along slip zones next to the orifice
and the narrowest opening cross-section through which the material
flows. These findings reveal a simple method for controlling both flow
rate and direction, and highlight the importance of both dynamics within
and geometry of the stagnant zones near the orifice.

],
  pagenumbering: "1",
  cols: 1,
  doc,
)


#block[
#block[
#box(image("graphics/Figure_GraphicalAbstract.svg", width: 200.0%))

]
#block[
Vary orifice angle of quasi-2D silo by elevating one orifice edge.

Flow rate, average packing fraction, and average flow fields with
high-speed imaging.

Effect of fixed grain placed on each orifice edge to minimize boundary
slipping.

Horizontal creep at each orifice edge plays vital role in flow rate.

Stagnant zone constrains flow upstream from orifice for steep enough
angles.

]
#block[
granular materials ,silo discharge ,tilted orifice ,flow field ,stagnant
zone

]
]
#set heading(numbering: "1.1")
#set math.equation(numbering: "(1)")

= Introduction
<sec:introduction>
In many natural and industrial systems, particulate matter is driven
through constricted openings, such as fine particles flowing through
porous media~\[1\], gas hydrates flowing in pipelines~\[2\], pedestrians
exiting a room~\[3, 4, 5\], logs moving down a river~\[6\], or
suspension particles navigating microfluidic channels~\[7, 8, 9, 10\].
Gravity-driven flows of granular materials~\[11\] through a confined
orifice in a silo are especially prevalent in industrial and geophysical
systems, for example in the processing and transport of
pharmaceuticals~\[12\] and food products~\[13, 14\] and debris flows
through harm-mitigating slit dams~\[15\]. Characterizing the flow rate
and clogging behaviors of granular materials in silos is therefore
important both for developing efficient practices~\[12, 16\] and robust
models of the rheology of intermittent dense granular flows.

A large body of research confirms that the flow rate of dry,
gravity-driven granular materials is described by the Beverloo
Rule~\[17, 18\], an empirical relationship for the flow rate of the
material $Q$ based on dimensional analysis relating the relative size of
grains $d$ to the orifice size $D$:
$ Q = C rho_(upright(B)) sqrt(g) \( D - k d \)^(f \/ 2) \, $<eqn:beverloo>
where $f = 3$ in two-dimensional (2D) silos and $f = 5$ in
three-dimensional (3D) silos, $C$ is a dimensionless parameter that is
largely independent of details of the granular material~\[19\], $k$ is a
parameter characterizing the so-called "empty annulus" accounting for
steric limitations of grain flow near the orifice edges~\[20, 21, 22\],
$rho_(upright(B))$ is the bulk density of the granular material in the
silo, and $g$ is the free-fall acceleration. For a flat-bottomed,
upright silo, Beverloo's rule has successfully been modeled from first
principles by considering energy balance in the silo~\[23, 19\].

Experiments have shown that the flow rate of grains depends on a variety
of factors related to the geometry of the container, including container
dimensions~\[24\], hopper angle~\[25, 26, 27, 28\], orifice
shape~\[29\], the presence of multiple orifices~\[30\], and whether the
orifice is on the bottom of the silo or on a side-wall~\[31, 32, 33, 34,
35\]. Ref.~\[33\] even found, surprisingly, that the Beverloo's rule
power law exponent $5 \/ 2$ for a lateral orifice in a 3D silo becomes
linear ---not the expected $3 \/ 2$--- when the silo width is narrowed
to approach a quasi-2D silo as the spacing confining the grains to a
monolayer becomes a relevant lengthscale.

The use of lateral orifices, or more generally orifices tilted away from
the horizontal, is important in a variety of industrial settings. For
example, one may need to modulate the direction of flow by tilting the
opening or silo and then adjusting the flow rate with the orifice
opening size. And in some cases, the spatial constraints of an existing
industrial setup may actually prevent effective discharge from a bottom
opening.

The first relationship between $Q$ and the inclination angle $theta$ of
the orifice above the horizontal was posed by Franklin and Johanson
based on measurements for a few orientations:
$ Q \( theta \) = Q_0 frac(cos theta_(upright(S)) + cos theta, cos theta_(upright(S)) + 1) \, $
where the angle of the stagnant zone of the granular material is denoted
by $theta_(upright(S))$ and $Q_0$ is the flow rate at
$theta = 0^compose$~\[36\]. A dependence on $cos theta$ would suggest
that the horizontal projection of the orifice determines the flow rate
of the material, but since flows are observed to occur even for
$theta > 90^compose$, this is at best an incomplete, empirical model.
Recent studies examining a more robust range of silo angles~\[37, 38\]
find that more elaborate models are necessary to capture
$Q \( theta \)$~\[39\]. In particular, Ref.~\[40\] examined a 2D tilted
silo and modeled $Q \( theta \)$ by considering the flow of side streams
of the material along stagnant zone surfaces or, when tilted steeply
enough, along one of the confining orifice walls. Despite their success
in describing tilted silo discharge rates, the recently proposed models
of Refs.~\[39\] and~\[40\] are not fully physically motivated:
Ref.~\[39\] can only treat the regime $theta > 90^compose$
semi-empirically, while Ref.~\[40\] proposes an empirical relationship
for average outpouring flow speed with $theta$. Moreover, the validity
of existing model predictions has not been tested in other geometric
configurations where the orifice is tilted without utilizing a side-wall
or tilting an entire silo (where preparation protocol ---whether grains
are poured prior to tilting, or if they are poured after tilting--- may
be an important factor).

In this work, we present experiments studying the discharge of grains
from a quasi-2D silo with varying orifice orientation by elevating one
side of the bottom boundary vertically above the other while holding
constant the edge-to-edge distance. This is a novel approach to tilting
the orifice that may be more practically implemented than drilling new
holes or tilting entire hoppers in industrial settings by using, for
example, orifice inserts to change out the bottom boundary alone~\[41\].
Since we find that in these configurations the typical stagnant zones
are mobilized during discharge, we also run experiments adding a fixed
grains to each edge of the orifice to prevent this flow contribution to
some extent and help understand the dynamics. These scenarios allow for
testing of prior models and, as we will motivate and show in this work,
the development of a more robust, general, and physically motivated
model.

We first present the experimental methods. We next show results for the
flow rate as a function of angle $Q \( theta \)$ and, through particle
tracking, the corresponding average velocity and packing fraction of the
material in the vicinity of the orifice. In the process, we compare flow
properties between our current results and those of past tilted silo
studies, shedding insight into how orifice inserts may be used
effectively to modulate flow. Finally, we develop a novel, fully
physically motivated model that captures $Q \( theta \)$.

= Experimental Methods
<sec:expmethods>
In our experiments, we use a quasi-2D silo with a monolayer of chrome
steel ball-bearing grains (Gosensball 1.5mm G10 Hardened) between the
front and back plates, as shown in Fig.~#ref(<fig:schematic>, supplement: none);(a),b. We measured
the diameter of 100 random grains in the sample with a manual micrometer
of 0.001” graduation (Miyutoyo 103-177) and obtained an average diameter
$d = 1.4965 plus.minus 0.0019$~mm. The error corresponds to standard
deviation of the measurements; the material is highly monodisperse with
a size dispersity of 0.1%. We measured the mass per grain
$m = 0.0137 plus.minus 0.0001$~g with a scale of resolution 0.1~g (Ohaus
YA501) by counting and measuring the total mass of several hundred
beads, repeating this protocol three times with randomly sampled grains
to obtain an average. The error in mass corresponds to the range across
the three trials.

#figure(image("graphics/Figure1_Schematic.svg", width: 90.0%),
  caption: [
    \(a) Side view of silo. (b) Front view of silo. (c) Bottom boundary
    orifice inserts for all values of $theta$ investigated. (d) Camera
    view of silo for $theta = 66^compose$ and $D = 17.7 d$. (e) Mass vs.
    time and line of best-fit for a fixed grain trial with
    $theta = 38^compose$.
  ]
)
<fig:schematic>

The silo is $170 d$ wide and $365 d$ high, and the orifice is centered
at the bottom, characterized in this work by opening size $D$ and angle
$theta$ with respect to the horizontal. The silo is composed of two
parallel, $0.5$-inch-thick static-dissipative acrylic plates
(McMaster-Carr 8774K54) pressed together with aluminum spacers of
thickness $1.59$~mm sandwiched in between the plates on the left and
right sides. These spacers were chosen such that the average spacing
between the plates is approximately $6 %$ larger than the grain diameter
(with variations across the silo due to plate thickness variations) to
prevent wedging of grains while also maintaining a monolayer. The top of
the silo is open, and a custom 3D printed hopper is used to pour grains
into the silo.

To change geometric features of the bottom boundary, we 3D print
different bottom boundary inserts using PLA with a Creality K1 Max 3D
filament printer and sand the grain-contacting surface with 1000 grit
sandpaper. As shown in Fig.~#ref(<fig:schematic>, supplement: none);(c), the pieces are designed
with one edge of the bottom boundary elevated above the other at fixed
edge-to-edge distance $D = 17.7 d$ to effectively rotate the orifice to
angles $theta in \[ 0^compose \, 140^compose \]$ without tilting the
entire silo nor changing the orifice size. A connecting bar that extends
out of the plane of the silo holds the two sides together without
interfering with grains as they exit the silo. Each orifice side has an
angled bottom side to prevent exiting grains from interacting with the
boundaries below the orifice. The lower (leftmost in our images) orifice
edge always has a $45^compose$ angle on the bottom side, while the upper
orifice edge (rightmost in our images) has a wedge angle that decreases
from $45^compose$ to a minimum $20^compose$ at steeper tilt angles to
avoid collisions of grains with the bottom side as they flow out. A
wedge shape is necessary even for the upper boundary in order to have a
stiff structure that does not deform under the weight of grains.

A custom-made mass scale below the orifice consists of a 3D-printed box
on top of a wooden platform with two $780$~g load cells (CZL616) whose
signals are amplified (HX711) and transferred to the operating computer
via an Arduino serial port connection. The scale records a mass time
series with a sampling rate of 80 Hz and resolution of
$plus.minus 0.5$~g, the mass of roughly 40 grains. Simultaneously, once
mass data acquisition begins, a relay switch turns on an LED panel that
back-lights the silo. After at least 1 second of flow, a button is
pressed to trigger acquisition of images by a high frame rate camera
(Photron Fastcam Nova-S6) with a macro lens (Sigma 105mm F2.8 EX DG OS
HSM). The camera records the granular material in a $40 d times 40 d$
region in the vicinity of the orifice that is horizontally centered on
the orifice, as shown in Fig.~#ref(<fig:schematic>, supplement: none);(d). The recording rate is
either 750, 1000, or 2000 frames per second as necessary for different
trials in order to capture individual grain dynamics frame-by-frame
(i.e., in order for the fastest grains to move less than a single grain
radius frame-to-frame) while also maximizing the duration of recorded
flow. Sample videos for each experimental condition are shown in the
Supplemental Materials~\[42\].

In a single trial, the appropriate orifice piece is fixed in the bottom
of the silo and a cardboard plug is set in place. Grains are then poured
into the silo with the hopper at the top, which is approximately 1/3 of
the system width and held over the middle of the silo throughout the
pouring process. The plug is then removed rapidly, grains flow from the
orifice into the mass scale, the switch turns the LED on, and the camera
is triggered.

Five trials were conducted for each condition in this work; mass-time
data was recorded in all cases, but high-speed video data was acquired
for two out of five trials to reduce data volume.

== Two conditions: flat edge and fixed grain
<two-conditions-flat-edge-and-fixed-grain>
The orifice inserts we show in Fig.~#ref(<fig:schematic>, supplement: none);(c) have flat edges. We
refer to this as the "flat edge" case. In order to evaluate the effect
of the sliding of particles along the base, we implement a variation in
the set-up that constrains this motion to some extent. We perform
identical experiments using the same orifice inserts modified only by
gluing a bead on each orifice edge, with the center of the grain
positioned at a distance $d \/ 2$ inward from the edge. We refer to this
as the "fixed grain" case. The difference between these two conditions
will be highlighted throughout this work.

== Mass-time data
<mass-time-data>
The mass as a function of time $M \( t \)$ acquired with the mass scale
is used to obtain the average steady-state flow rate $Q$, as
demonstrated by a sample time series in Fig.~#ref(<fig:schematic>, supplement: none);(e). For each
time series, we first determine the total range of mass data
($M_(upright(r a n g e)) = M_(upright(f i n a l)) - M_(upright(i n i t i a l))$)
registered by the scale. We then select a region of data to fit to a
straight line for the time interval when $M \( t \)$ is between 10% and
85% of the total range. We have confirmed that our results are
insensitive to the exact choice of the fitting range cutoffs as long as
initial and final transients are avoided. Moreover, we have tested that
the flow rate is in the steady-state regime for the entirety of the
selected range by computing the slope in regular intervals within the
range. Changes in the interval duration do not influence the results we
present: any fluctuations in measured $Q$ due to parameter changes are
within trial-to-trial fluctuations.

== Particle-tracking data
<particle-tracking-data>
With high-speed image data, we directly compute the frame-to-frame
velocity of each grain in the vicinity of the orifice. In a single frame
(frame 1), we identify particles to subpixel precision using standard
morphological image operations such as erosion and grouping~\[43\]. We
do the same for the next frame (frame 2). We then construct a matrix
where the $i$-th row and $j$-th column entry is the distance $d_(i j)$
between the particle $i$ in frame 1 and the particle $j$ in frame 2. We
lastly solve the linear assignment problem with this distance matrix
using Matlab's `matchpairs` function, in which the "cost" of distance is
minimized via a matching algorithm~\[44\]. We designate the cost of a
particle #emph[not] being matched as $d \/ 2$ to prevent particles from
being matched if they are greater than one radius away from each other
frame-to-frame.

With all particle position and velocity data in hand, we determine the
average velocity and packing fraction profiles along the orifice. For a
given trial, we first hand-select the orifice edges in one image. (We
have confirmed, by randomly generating orifice edge-points in the
vicinity of the selected point, that the results we present in this work
are not influenced by the exact selection of the orifice edges.) We then
construct 35 identical-sized sampling bins of width
$0.506 d approx d \/ 2$ spanning the length of the orifice and height
$1 d$ perpendicular to the orifice, as demonstrated in
Fig.~@fig:orificeprofile. We sample every 10th frame from the original
video, a time interval in which the fastest grains will move several
grain diameters, in order to avoid any correlations between separate
analyzed frames. For each analyzed frame, the local packing fraction
$phi.alt$ in a bin is determined as the area of grains within the bin
area divided by the bin area. The velocity $arrow(v)$ in a bin is
determined as the weighted average of the velocities of any grains that
intersect with the bin, where the weighting is the relative intersection
area of each grain. The average packing fraction and velocity in each
bin is lastly calculated by an average over all analyzed frames.

#figure(image("graphics/Figure2_Orifice.svg", width: 100.0%),
  caption: [
    Example frame with velocity vectors $arrow(v)_i$ (red arrows) and
    packing fractions $phi.alt_i$ (color scale) for each bin $i$ along
    the orifice line. Inset: $hat(n)$ is the orifice normal, $theta$ is
    the magnitude of the angle between orifice line and $hat(x)$, the
    outpouring velocity component is $arrow(v)_perp$, the component of
    velocity along the orifice line is $arrow(v)_(\| \|)$, and $alpha$
    is the angle between $arrow(v)$ and $hat(n)$. In this example
    $alpha$ is positive.
  ]
)
<fig:orificeprofile>

Using this profile information, we calculate the flow rate
$ Q_(upright(v i d e o)) = sum_i rho phi.alt_i v_(perp \, i) Delta x = sum_i rho phi.alt_i v_i cos alpha_i Delta x $<eqn:qvideo>
where $rho = m \/ A_(upright(g r a i n)) = 7.79$~kg/m$""^2$ is the area
density of a steel grain, $phi.alt_i$ and $v_(perp \, i)$ are the
packing fraction and velocity component normal to the orifice of bin
$i$, and $Delta x approx d \/ 2$ is the bin width. We also extract the
angle $alpha_i$ at each bin, defined as the angle of $arrow(v)_i$ with
respect to the orifice normal $hat(n)$, as shown in
Fig.~@fig:orificeprofile. Note that we will define $arrow(v)_perp > 0$
when along the same direction as $hat(n)$, $arrow(v)_(\| \|) > 0$ when
directed from the upper edge to the lower edge, and $alpha > 0$ when
clockwise from $hat(n)$.

= Results
<sec:results>
Figure~@fig:Q displays the mass flow rate $Q$ for each experimental
condition ---flat edge, and fixed grain--- as a function of orifice
angle $theta$. The data include the calculation of $Q$ by mass time
series (e.g., Fig.~#ref(<fig:schematic>, supplement: none);(e)) (circles) from the scale and via
particle tracking (diamonds) with Eqn.~@eqn:qvideo, which are in
excellent agreement. (The other two cases, narrowest opening and
truncated results, will be discussed in Sec.~@sec:modelnarrowest.) For
the flat edge case, the flow rate decreases with angle until
$theta approx 140^compose$. Above this angle, the system becomes
susceptible to clogging due to arches formed between the upper orifice
edge and the stagnant zone~\[45, 38, 46\], which has an angle of
approximately $60^compose$ (see Sec.~@sec:spatialflow); we only examine
cases that are free from clogging. With a fixed edge grain, the decrease
with angle is more rapid. However, notably, at low angles
($theta < 40^compose$) the flow rate is enhanced significantly in
comparison to flat edges. A recent work has also noted an increase in
flow rate when using fixed grains at the orifice edges in a horizontal
conveyor belt driven flow~\[47\]. These authors attribute the increase
to a reduction in the horizontal flow of the grains at the edges that
typically impedes the vertical flow of the particles above the orifice.

The normalized flow rates, defined as
$Q \/ Q \( theta = 0^compose \) = Q \/ Q_0$, are shown in Fig.~@fig:QQ0
as a function of $cos theta$. Prior data from tilted silo experiments of
Refs.~\[37\] and~\[40\] are included for reference. The normalized flow
rates agree among the data sets for small angles but more clearly
differentiate at steeper angles. The flat edge case has consistently
faster flows than in the tilted silo experiments, whereas the fixed
grain condition has consistently slower flows; each case forms upper and
lower bounds, respectively, on flows when the entire silo is tilted. We
will comment on this finding in Sec.~@sec:conclusions.

#figure(image("graphics/Figure3_Massdata.svg", width: 100.0%),
  caption: [
    Average flow rate measured by mass scale data (filled circles) and
    image particle tracking analysis (open symbols) vs. orifice angle
    for flat edge and fixed grain cases. The tracking results were
    obtained with three different flow cross-sections: (diamonds) along
    the orifice line, (squares) along the narrowest opening
    cross-section extending across the image (see Sec.
    @sec:modelnarrowest), and (stars) along the narrowest opening but
    truncated at the stagnant zone boundary. Error bars represent the
    range across trials and are smaller than the data points.
  ]
)
<fig:Q>

#figure(image("graphics/Figure4_QvQ0.svg", width: 100.0%),
  caption: [
    Normalized flow rates $Q \/ Q_0$ as a function of $cos \( theta \)$.
    Gray line: our model of flow through the orifice cross-section with
    $theta_(upright(S)) = 60^compose \, theta_(upright(h)) = 120^compose$
    (Sec.~@sec:model). Black line: our model of flow through narrowest
    opening cross-section with
    $theta_(upright(S)) = 60^compose \, theta_(upright(h)) = 120^compose$
    (Sec.~@sec:modelnarrowest).
  ]
)
<fig:QQ0>

#figure(image("graphics/Figure5_Beverloo.svg", width: 100.0%),
  caption: [
    Rescaled flow rate as a function of rescaled orifice size for
    $theta = 0^compose$ (orange) and $theta = 88^compose$ (pink) in the
    flat edge case.
  ]
)
<fig:beverloo>

== Beverloo's rule with $theta approx 90^compose$
<beverloos-rule-with-thetaapprox-90circ>
To compare our system with prior studies of flat-bottomed silos and
lateral wall orifices, we next examine the flow rate as a function of
orifice diameter $D$ when the orifice is horizontal $theta = 0^compose$
---the typical configuration for which Eqn.~@eqn:beverloo applies--- and
when the orifice is close to vertical, $theta = 88^compose$. We present
results in Fig.~@fig:beverloo. The scaling for the flat-bottom,
conventional silo agrees with the Beverloo's Rule in Eqn.~@eqn:beverloo,
as the power law fit exponent (which Beverloo predicts to be 3/2) on the
rescaled axes of Fig.~@fig:beverloo is $1.48 plus.minus 0.02$ (error is
$95 %$ confidence interval). However, the exponent is roughly linear
when a lateral opening is employed: the fit exponent becomes
$1.11 plus.minus 0.03$ (error is $95 %$ confidence interval).

Though we use a different geometric arrangement in order to tilt our
orifice, our findings are consistent with prior research by Zhou et al.
on lateral wall orifices in thin, quasi-2D silos (where silo thickness
$W lt.double D$)~\[33\]. These authors showed, using dimensional
analysis and detailed experiments, that when the orifice of a quasi-2D
silo is lateral instead of horizontal, $Q$ is #emph[linear] with $D$ but
also scales as $W^(1 \/ 2)$. The underlying physical mechanism remains
unclear, but it is likely that wall friction with the front and back
plates plays an important role in modifying the flow pattern of grains
as they approach the orifice, slowing the redirection of flow towards
the horizontal~\[48\]. Further analysis in this direction is outside of
the scope of this work.

#figure(image("graphics/Figure6_Profiles.svg", width: 100.0%),
  caption: [
    Profiles along the orifice of (a,d) packing fraction, (b,e) speed,
    and (c,f) flow angle for (top row) the flat edge case and (bottom
    row) the fixed grain case, at varying elevation angles $theta$ (see
    color scale).
  ]
)
<fig:profiles>

== Velocity and packing fraction at the orifice
<sec:profiles>
Using particle tracking as described in Sec.~@sec:expmethods, we measure
the average flow velocity and packing fraction of grains along the
orifice profile for varying $theta$. Figure~#ref(<fig:profiles>, supplement: none);(a-c) displays
the orifice profiles of packing fraction $phi.alt$, outpouring speed
$v$, and flow angle $alpha$ for the flat edge case. (See Supplemental
Materials for profiles of components $v_perp$ and $v_(\| \|)$~\[42\].)
With increasing angle $theta$, the material orders in a crystalline
lattice more effectively at the lower edge of the orifice, and $phi.alt$
consequently increases. At the upper edge, in contrast, $phi.alt$
decreases as the material locally dilates as grains circulate around the
upper edge. The speed decreases in magnitude from the center of the
orifice towards the edges for $theta lt.tilde 110^compose$, and an
asymmetry develops with the grains that are on the upper half of the
orifice flowing faster. Nevertheless, the speed profile is notably more
symmetric at all $theta$ than those observed in tilted silos (see
Ref.~\[40\]). For $theta > 110^compose$, the shape of the speed profile
flattens. Importantly, the flow direction $alpha$ is, except very close
to the edges, linear with position along the orifice with a consistent
slope across all elevation angles. The only significant change of
$alpha$ with increasing $theta$ is a constant offset.

With a fixed grain on each orifice edge, the profiles correspondingly
change as shown in Fig.~#ref(<fig:profiles>, supplement: none);(d-f), especially near the upper and
lower edges. The magnitude of the velocity decreases in a manner similar
to that of the flat edge case, but the flow at the lower edge is never
as fast as the flow at the upper edge and the profile does not flatten
for any $theta$. The packing fraction shows the most stark differences
in our two experimental cases: with the fixed grain, packing fraction
across the orifice decreases on average with increasing elevation angle,
even at the lower edge of the orifice. We will argue shortly that, in
the flat edge case, ordered grains in the nominal stagnant zone creep
horizontally along the lower boundary. Thus, the hexagonal, highly
packed structure overflows into the orifice. In contrast, with a fixed
grain, this order is frustrated as grains flow around the obstructing
grain, collectively dilating in the process near the bottom edge. The
profile of the direction of flow $alpha$ is also linear as in the flat
edge case, perhaps with smaller deviations close to the edges due to the
presence of the fixed grains.

#figure(image("graphics/Figure7_AverageFlowProperties.svg", width: 100.0%),
  caption: [
    Averages along the orifice profile of (a) packing fraction, (b)
    normalized outpouring speed, and (c) angle for the flat edge and
    fixed grain cases. Solid gray lines: Models for each average
    quantity, discussed in Sec.~@sec:model. Green data are from the 2D
    tilted silo experiments of Ref.~\[40\].
  ]
)
<fig:profileaverages>

Figure~@fig:profileaverages displays averages taken along the orifice
profiles of Fig.~@fig:profiles of packing fraction, outpouring speed
$v \/ v_0$ normalized to the average speed at $theta = 0^compose$, and
angle $alpha$ as a function of $theta$. Packing fraction changes
nonmonotonically as elevation angle increases with a flat edge, but
decreases monotonically with a fixed grain. The speed linearly decreases
as $cos theta$ decreases from 1 in both cases until around
$theta approx 90^compose$, beyond which the speed declines more rapidly.
The decline is stronger for the fixed grain case. As noted above, the
outpour angle $alpha$ linearly increases with elevation angle in both
cases, albeit with a different slope, and in the flat edge case there is
an inflection point around $120^compose$.

On each of the plots shown, we also include corresponding results from
Ref.~\[40\], in which particle-scale flow was analyzed for a slightly
smaller orifice size of $16.9 d$ with a tilted silo. (This is the only
tilted-silo study, to our knowledge, which captured particle-scale
motion.) Unlike in the current configuration, the packing fraction for
the tilted silo is constant with angle. The normalized speed, however,
is comparable between the tilted silo and fixed grain case (and is
significantly lower for a given angle than in the flat edges case).
Moreover, the outpouring angle for the tilted silo, though greater in
magnitude at small angles, is approximately the same as for the fixed
grain case.

== Flow in the vicinity of the orifice
<sec:spatialflow>
Having characterized the flow across the orifice line, we lastly turn to
the flow of the material in the vicinity of the orifice. This
information will be vital to modeling the average exit flow
characteristics of Fig.~@fig:profileaverages, which we will describe in
Sec.~@sec:model.

To quantify average spatial flow velocity, we sample the average
velocity of grains passing through boxes of size $d times d$ across the
entire image. The averaging protocol is identical to that described in
Sec.~@sec:expmethods for the orifice profile, though in this case we
sample every 100 frames in a given trial for temporal averaging.
Representative speed heat maps obtained in this manner are shown in
Fig.~#ref(<fig:heatmaps>, supplement: none);(a) for a few $theta$ in both orifice edge geometries.
There are clear stagnant zones on or near each orifice edge, evidenced
by very low speeds. Moreover, as shown with representative packing
fraction heat maps in Fig.~#ref(<fig:heatmaps>, supplement: none);(b), the stagnant regions have
densely packed grains whereas the material dilates in the fast flow
regions; recall that we use monodisperse grains, which can pack in 2D
most efficiently to $phi.alt_(upright(m a x)) approx 0.91$. (See the
Supplemental Materials for heat maps of all of the experimental
conditions~\[42\].)

#figure(image("graphics/Figure8_Heatmaps.svg", width: 100.0%),
  caption: [
    \(a) Heat maps for three sample angles $theta$ showing average grain
    speed $v$ sampled across the entire image region for (top row) flat
    edge and (bottom row) fixed grain. Gray line: orifice. Stars: edge
    of lower (pink) and upper (cyan) stagnant zone, each a horizontal
    distance $X_(upright(S))$ from the orifice edge. Lines: Best-fit
    line to lower (pink) and upper (cyan) stagnant zone boundary, each
    giving stagnant zone angle $theta_(upright(S))$. (b) Heat maps of
    packing fraction at $theta = 57^compose$ for each experimental case.
  ]
)
<fig:heatmaps>

=== Stagnant zones
<sec:staggeometry>
Two important features of each stagnant zone are the stagnant zone angle
$theta_(upright(S))$ from the horizontal and the horizontal distance
$X_(upright(S))$ from the stagnant zone to the orifice edge. We define
the stagnant zone regions at the lower and upper orifices by
thresholding the speed heat map to $5 %$ of the maximum speed per heat
map. (The exact choice of a relative threshold or absolute speed
threshold does not influence our results.) $theta_(upright(S))$ is then
the angle of the best-fit line to the sloped edge of a detected stagnant
zone region; see pink and cyan lines in Fig.~#ref(<fig:heatmaps>, supplement: none);(a).
$X_(upright(S))$ is the minimum horizontal distance from the stagnant
zone region to the orifice edge. We determine $theta_(upright(S))$ and
$X_(upright(S))$ for the lower orifice and the upper orifice separately,
as shown in Fig.~#ref(<fig:stagangles>, supplement: none);(a),b.

#figure(image("graphics/Figure9_StagnantZoneGeometry.svg", width: 100.0%),
  caption: [
    \(a) Stagnant zone angles $theta_(upright(S))$ and (b) edge
    distances $X_(upright(S))$ measured at the lower (pink) and upper
    (cyan) edges for the flat edge case (filled circles) and fixed grain
    case (open circles).
  ]
)
<fig:stagangles>

For both the flat edge and fixed grain cases, the stagnant zone angle is
close to the expected $60^compose$ for hexagonal ordering across angles
$theta$ with some deviation at the steepest angles. We will therefore
set $theta_(upright(S)) = 60^compose$ in the models we establish in
Secs.~@sec:model and~@sec:modelnarrowest. A more prominent difference
between the flat edge and fixed grain cases, though, is how far from the
orifice edges the stagnant zone edges are. For the fixed grain case, the
stagnant zone is directly at the orifice edge due to the constraint
imposed by the glued bead. However, for the flat edge case, the
development of $X_(upright(S))$ with $theta$ is not trivial. At the
lower edge, $X_(upright(S))$ increases approximately linearly with
$theta$, indicating an increasing size of a slip zone~\[48\]. At the
upper edge, beyond $theta approx 30^compose$, the slip zone vanishes.
These observations, along with visual confirmation from
Fig.~@fig:heatmaps, indicate that as $theta$ increases, a channel of
"horizontal flow" forms along the base next to the lower orifice
boundary, since grains can slide collectively along this base. Adding a
fixed grain prevents this channel from forming altogether, and therefore
the maximum achievable $theta$ is significantly smaller in that case.

=== Stagnant zone creep
<sec:stagcreep>
Motivated by our observations of channel formation in the flat edge
case, we next quantify the average horizontal speed of grains in the
(nominal) stagnant zone. Figure~#ref(<fig:stagcreep1>, supplement: none);(a) shows the two sampling
regions used to determine horizontal creep: $4 d times 4 d$ boxes at the
lower and upper orifices, each centered $9 d$ away from their respective
orifice edges. The qualitative results we show do not depend on exact
sampling size or box position.

#figure(image("graphics/Figure10_OrificeCreep.svg", width: 100.0%),
  caption: [
    \(a) Sample image showing the box region used to obtain the average
    velocity of the "stagnant" zone; the sampling boxes are
    $4 d times 4 d$ and centered $9 d$ from the orifice edges.
    Horizontal creep speed as a function of time for (a) the flat edge
    case and (b) the fixed grain case at $theta = 88^compose$.
  ]
)
<fig:stagcreep1>

Horizontal speeds $\| v_x \( t \) \|$ time series for each region with
$theta = 88^compose$ are shown in Fig.~#ref(<fig:stagcreep1>, supplement: none);(b),c. In some
cases, especially small angles and with a fixed grain, the material in
the stagnant zone flows intermittently. With flat edges at steep angles,
however, flow at the lower edge is continuous with fluctuations as
grains near the orifice edge compete with non-stagnant zone grains to
exit the orifice. Though we do not explore this further in the current
work, the competition of horizontally flowing grains is a plausible
explanation for the increase in flow rate at small angles with the
addition a fixed grain as proposed in \[47\].

We lastly highlight in Fig.~@fig:stagcreep2 the time average $\| v_x \|$
for both experimental cases. In the flat edge case, at the lower edge
the material flows more rapidly in the horizontal direction as $theta$
increases and the slip zone widens. In fact, horizontal creep becomes
the most prominent contribution of the flow near the lower orifice edge.
The average flow speed near the lower orifice edge in the profiles shown
in Fig.~#ref(<fig:profiles>, supplement: none);(b),e is $approx 100 d \/$s.

#figure(image("graphics/Figure11_StagnantZoneCreepSpeed.svg", width: 100.0%),
  caption: [
    Magnitude of average horizontal stagnant zone creep velocity at the
    lower (pink) and upper (cyan) edges for the flat edge case (filled
    circles) and fixed grain case (open circles).
  ]
)
<fig:stagcreep2>

= Model for $Q \( theta \)$
<sec:model>
Based on our observations of the nontrivial dependence of mass discharge
rate $Q$ with orifice angle $theta$, and using our findings for the
average flow properties at the orifice from particle tracking analysis,
we develop a physical model of $Q \( theta \)$. The flow rate through an
orifice of width $D$ at angle $theta$ with the horizontal is
$ Q = D rho_0 \( theta \) v \( theta \) cos \[ alpha \( theta \) \] $<eqn:qmodel>
where the material has an average exit speed $v$, average angle $alpha$
with respect to the orifice normal, and average density $rho_0$ at the
orifice. A model for $Q \/ Q_0$ therefore requires modeling of
$rho_0 \( theta \)$, $v \( theta \)$, and $alpha \( theta \)$.

== $alpha \( theta \)$
<alphatheta>
We showed in Sec.~@sec:profiles that $alpha$ is linear across the
orifice. This implies that the average flow direction can be calculated
from the flow direction at each edge of the orifice
$alpha_(upright(l o w e r))$ and $alpha_(upright(u p p e r))$:
$ alpha = ⟨alpha⟩ = \( alpha_(upright(l o w e r)) + alpha_(upright(u p p e r)) \) \/ 2 . $<eqn:averagealphamodel>
Modeling the direction of flow close to the orifice edges should be
simpler since the boundaries constraint the flow. In
Fig.~#ref(<fig:averagealpha>, supplement: none);(a) we display the flow angles
$alpha_(upright(l o w e r))$ and $alpha_(upright(u p p e r))$ from the
profiles shown in Fig.~#ref(<fig:profiles>, supplement: none);(c) a distance $2 d$ inward from the
lower and upper orifice edges to avoid boundary measurement issues in
the bins directly next to each edge. Recall that we define $alpha > 0$
for exit velocities that are below (clockwise from) the orifice normal.

#figure(image("graphics/Figure12_AlphaModeling.svg", width: 100.0%),
  caption: [
    \(a) $alpha_(upright(l o w e r))$ and $alpha_(upright(u p p e r))$
    from the profiles in Fig.~#ref(<fig:profiles>, supplement: none);(c) sampled $2 d$ inward from
    the orifice edges. Dashed lines: models for lower and upper angles.
    (b) Flow with respect to the horizontal
    $alpha_(x \, upright(l o w e r))$ and
    $alpha_(x \, upright(u p p e r))$ from the profiles in
    Fig.~#ref(<fig:profiles>, supplement: none);(c) sampled $2 d$ inward from the orifice edges.
  ]
)
<fig:averagealpha>

=== $alpha_(upright(l o w e r)) \( theta \)$
<alpha_mathrmlowertheta>
To model $alpha_(upright(l o w e r))$, we first assume that the net flow
velocity
$arrow(v)_(upright(f)) equiv arrow(v)_(upright(S)) + arrow(v)_(upright(c))$
at the lower edge is determined by a contribution of velocity along the
stagnant zone boundary $arrow(v)_(upright(S))$ and average horizontal
creep $arrow(v)_(upright(c))$, as shown in Fig.~#ref(<fig:modelschematics>, supplement: none);(a).
At small orifice angles $theta$, horizontal creep is a relatively small
contribution to the flow, so
$arrow(v)_(upright(f)) approx arrow(v)_(upright(S))$. However, we have
shown (Fig.~@fig:stagcreep2) that the average creep speed
$v_(upright(c))$ increases proportionally with $theta$, suggesting that
at large enough $theta$, the flow at the lower edge (in the flat edge
case) becomes more horizontal. We demonstrate this to be true in
Fig.~#ref(<fig:averagealpha>, supplement: none);(b), which shows the lower and upper edge flow
angles with respect to the horizontal,
$alpha_x = pi \/ 2 - theta + alpha$ (see Fig.~#ref(<fig:modelschematics>, supplement: none);(a)).
For the flat edge case, at the lower orifice edge the angle approaches
$0^compose$ around $theta = 120^compose$, indicating primarily
horizontal flow contributed by the stagnant zone creep. Given these
observations regarding stagnant zone creep, we thus model the creep
speed as

$ v_c = cases(delim: "{", theta v_(upright(f)) \/ theta_(upright(h)) \, & theta lt.eq theta_(upright(h)), v_(upright(f)) \, & theta > theta_(upright(h))) \, $
where $theta_(upright(h))$ is a threshold angle beyond which the flow at
the lower edge is purely horizontal. We will set
$theta_(upright(h)) = 120^compose$ based on the results shown in
Fig.~#ref(<fig:averagealpha>, supplement: none);(b).

We next focus on the geometry shown in Fig.~#ref(<fig:modelschematics>, supplement: none);(a) to
determine the angle $alpha$ between $arrow(v)_(upright(f))$ and
$hat(n)$. Define the angle $beta = pi - theta_(upright(S)) - theta$
between $arrow(v)_(upright(S))$ and the orifice line. Then the angle
between $arrow(v)_(upright(S))$ and the orifice normal is
$delta = pi \/ 2 - beta = theta + theta_(upright(S)) - pi \/ 2$. As
shown in the upper inset of Fig.~#ref(<fig:modelschematics>, supplement: none);(a),

$ frac(sin \( pi - theta_(upright(S)) \), v_(upright(f))) = frac(sin gamma, v_(upright(c))) = cases(delim: "{", frac(theta_(upright(h)), theta v_(upright(f))) sin gamma \, & theta lt.eq theta_(upright(h)), 1 / v_(upright(f)) sin gamma \, & theta > theta_(upright(h))) . $
Hence
$ gamma = cases(delim: "{", sin^(- 1) (theta / theta_(upright(h)) sin theta_(upright(S))) \, & theta lt.eq theta_(upright(h)), theta_(upright(S)) \, & theta > theta_(upright(h))) \, $
and given that $alpha_(upright(l o w e r)) \( theta \) = delta - gamma$,

$ alpha_(upright(l o w e r)) \( theta \)\
= cases(delim: "{", theta + theta_(upright(S)) - pi / 2 - sin^(- 1) (theta / theta_(upright(h)) sin theta_(upright(S))) \, & theta lt.eq theta_(upright(h)), theta - pi / 2 \, & theta > theta_(upright(h))) $<eqn:modelalphalower>

#figure(image("graphics/Figure13_ModelingSchematics.svg", width: 100.0%),
  caption: [
    \(a) Calculation of angle $alpha$ between flow direction
    $arrow(v)_(upright(f))$ and normal $hat(n)$ to the orifice at angle
    $theta$ at the lower orifice edge. $arrow(v)_(upright(c))$ is the
    average creep velocity at the bottom edge, $arrow(v)_(upright(S))$
    is the average flow of the material along the bottom edge stagnant
    zone ($theta_(upright(S)) approx 60^compose$), and
    $arrow(v)_(upright(f))$ is the net velocity at the bottom edge.
    $beta$ is the angle between the orifice line and
    $arrow(v)_(upright(S))$, and $delta$ is the angle
    $arrow(v)_(upright(S))$ makes with respect to $hat(n)$. (b)
    Calculation of angle $alpha$ between flow direction
    $arrow(v)_(upright(f))$ and normal $hat(n)$ to the orifice at angle
    $theta$ at the upper orifice edge. $eta$ is the angle
    $arrow(v)_(upright(S))$ makes with respect to $hat(n)$. (c)
    Schematic of orifice for determining the free-fall lengthscale of
    the material based on average flow of material at the orifice. $D$
    is the orifice size, $D_y$ is the vertical free-fall lengthscale,
    and $alpha_x$ is the angle of the flow direction with respect to the
    horizontal.
  ]
)
<fig:modelschematics>

Equation~@eqn:modelalphalower is shown as a pink dashed line in
Fig.~#ref(<fig:averagealpha>, supplement: none);(a). We set $theta_(upright(S)) = 60^compose$ based
on the measurements of stagnant zone angle discussed in
Sec.~@sec:staggeometry and $theta_(upright(h)) = 120^compose$ based on
the increasing importance of horizontal creep for the flat edge case
shown in Figs.~@fig:stagcreep2 and~#ref(<fig:averagealpha>, supplement: none);(b). The model
captures the slope for the flat edge case even though it is shifted by
an additive constant with respect to the experimental data. Recall that
$alpha_(upright(l o w e r))$ was measured in practice two particles away
from the edge of the orifice.) This model does not apply to the fixed
grain case given that horizontal creep is strongly reduced in this case.

=== $alpha_(upright(u p p e r)) \( theta \)$
<alpha_mathrmuppertheta>
We now turn to $alpha_(upright(u p p e r))$. When $theta$ is close to
$0^compose$, the direction of flow next to the upper edge of the orifice
is essentially the direction imposed by the upper stagnant zone. In this
case,
$alpha approx eta \( theta \) = theta - theta_(upright(S)) + pi \/ 2$,
where the angle $eta$ is defined in Fig.~#ref(<fig:modelschematics>, supplement: none);(b). When
$theta$ is large, however, the direction of flow next to the upper edge
of the orifice is essentially the direction imposed by the lower
stagnant zone. Therefore,
$alpha approx delta \( theta \) = theta + theta_(upright(S)) - pi \/ 2$,
($delta$ is defined in Fig.~#ref(<fig:modelschematics>, supplement: none);(a)).

Having a clear physical picture for small and large $theta$ limits, we
propose a simple linear interpolation:

$ alpha_(upright(u p p e r)) \( theta \) = eta \( theta \) \( 1 - theta \/ theta_(upright(h)) \) + delta \( theta \) theta \/ theta_(upright(h)) . $<eqn:modelalphaupper>

The prediction of this model with $theta_(upright(S)) = 60^compose$ and
$theta_(upright(h)) = 120^compose$ is shown as a cyan dashed line in
Fig.~#ref(<fig:averagealpha>, supplement: none);(a). The agreement with the data in terms of slope
is fair with the exception of the very large angles
$theta > theta_(upright(h))$ where the contribution of the creep may be
important. Again, the model offsets the data by an additive constant as
we observed with $alpha_(upright(l o w e r))$, mainly because the
measurements were taken two particles away from the edge.

Lastly, we combine the models for $alpha_(upright(l o w e r))$ and
$alpha_(upright(u p p e r))$ with Eqn.~@eqn:averagealphamodel for
$alpha$ and ultimately obtain

$ alpha \( theta \)\
= cases(delim: "{", theta #scale(x: 120%, y: 120%)[\(] 1 + frac(theta_(upright(S)) - pi \/ 2, theta_(upright(h))) #scale(x: 120%, y: 120%)[\)] - 1 / 2 sin^(- 1) #scale(x: 120%, y: 120%)[\(] theta / theta_(upright(h)) sin \( theta_(upright(S)) \) #scale(x: 120%, y: 120%)[\)] \, & theta lt.eq theta_(upright(h)), theta #scale(x: 120%, y: 120%)[\(] 1 + frac(theta_(upright(S)) - pi \/ 2, theta_(upright(h))) #scale(x: 120%, y: 120%)[\)] - theta_(upright(S)) / 2 \, & theta > theta_(upright(h))) $<eqn:modelalphacomplete>

Figure~#ref(<fig:profileaverages>, supplement: none);(c) displays this model as a gray line using
$theta_(upright(S)) = 60^compose$ and
$theta_(upright(h)) = 120^compose$, both of which are physically
motivated values. The model agrees well with the flat edge data both
quantitatively and qualitatively, capturing the curvature of the data
just before $120^compose$ and the upward trend beyond this angle.

== $v \( theta \)$
<vtheta>
We next turn to the average discharge speed of the material. The
material accelerates in a limited region in the vicinity of the orifice
\[49, 22, 19\], which we model as a zone where the material dilates
enough for grains to fall under gravity without dissipation (a so-called
#emph[free-fall arch] with characteristic lengthscale $R$). For upright
silos with a horizontal orifice, this simplified model sets $R prop D$
based on a roughly semicircular free-fall region above the orifice, and
therefore $v prop sqrt(g D)$. For a vertical orifice on a side wall
where the average flow direction is not purely vertical, Zou, et. al.,
showed in Ref.~\[48\] that $R prop D sin alpha_x$ describes the flow
rate of the material. $alpha_x$ is the average direction of flow at the
orifice with respect to the horizontal. We adopt Zou's approach as a
first-order model for speed in our system as well. As shown in
Fig.~#ref(<fig:modelschematics>, supplement: none);(a),c, $alpha_x = pi \/ 2 - theta + alpha$\;
hence, we define the vertical free-fall lengthscale
$R = D_y = D sin alpha_x$ and $v prop sqrt(D_y)$. Upon normalizing by
the speed $v_0$ at $theta = 0$, we obtain

$ v \/ v_0 = sqrt(cos \( theta - alpha \)) . $<eqn:modelspeed>

Figure~#ref(<fig:profileaverages>, supplement: none);(b) shows the experimentally measured
normalized speeds $v \/ v_0$ as well as the prediction from
Eqn.~@eqn:modelspeed, using $alpha$ from Eqn.~@eqn:modelalphacomplete.
Although the model for $alpha \( theta \)$ is fair
(Fig.~#ref(<fig:profileaverages>, supplement: none);(c)), this approach is not adequate to describe
the dependence of speed on orifice angle, overestimating the speed for
all except small angles $theta$ where $alpha approx theta$ and
$cos \( theta - alpha \) approx 1$. Despite the poor agreement in speed,
we test in the following how this impacts the prediction of the flow
rate.

== $rho_0 \( theta \)$
<rho_0theta>
The average density of the granular material at the orifice is
proportional to average packing fraction $phi.alt$ by grain mass. Recall
from Fig.~#ref(<fig:profileaverages>, supplement: none);(a) that the average packing fraction
$phi.alt$ along the orifice is approximately constant for the tilted
silo experiment from Ref.~\[40\]. It is not constant in the current
experiments; however, the changes in $phi.alt$ are second-order in
comparison to those of $v$ and $cos \( alpha \)$, so we model a constant
$phi.alt \( theta \) = 0.63$, the average orifice packing fraction for
the flat edge case. Therefore
$rho_0 \( theta \) = phi.alt rho = 4.9 #h(0em) upright(k g) \/ m^2$.

== Complete model for the flow rate
<complete-model-for-the-flow-rate>
Combining the model equations for $alpha$
(Eqn.~@eqn:modelalphacomplete), $v \/ v_0$ (Eqn.~@eqn:modelspeed), and
$rho_0 = upright(c o n s t a n t)$ into Eqn.~@eqn:qmodel, and setting
$theta_(upright(S)) = 60^compose$ and
$theta_(upright(h)) = 120^compose$, we obtain the flow rate model result
shown as a gray solid line in Fig.~@fig:QQ0. We emphasize that the
selections of $theta_(upright(S))$ and $theta_(upright(h))$ are
physically motivated based on measurements from the experiments. The
model prediction captures the trend for the flat edge case in our
experiment, but it overestimates the flow rate. We remind readers that
the model for $alpha$ (Eqn.~@eqn:modelalphacomplete) is most appropriate
for modeling the flat edge, not the fixed edge case, since horizontal
creep is always insignificant for the fixed grain case
(Sec.~@sec:stagcreep); we therefore do not expect strong agreement with
the fixed grain data.

Modeling flow by analyzing flow properties on the putative orifice
cross-section, although the most common approach in horizontal
orifices~\[49\], may not be the most appropriate method for tilted
orifices. In fact, other works have focused on other cross-sections,
such as a semicircular arc around the orifice opening in Refs.~\[50,
51\]. Below, we consider an alternative flow cross-section, and find
that modeling flow in the modified cross-section is simpler and agrees
more robustly with the experimental data.

= Improved model for $Q \( theta \)$: narrowest opening cross-section
<sec:modelnarrowest>
We have shown in the previous section that flow properties along the
orifice cross-section are not trivial to model and do not lead to a
strong match with experimentally measured flow rates. We now consider an
alternative cross-section: the narrowest opening cross-section that the
material passes through within the silo. We model the material as having
fixed boundaries set by the stagnant zones at constant angle
$theta_(upright(S)) = 60^compose$ at each orifice edge. In practice this
corresponds to neglecting the creep $v_(upright(c))$ of the stagnant
zones. For $theta > pi \/ 2 - theta_(upright(S)) = 30^compose$, as
demonstrated in Fig.~#ref(<fig:neworificemodel>, supplement: none);(a), the narrowest opening that
grains pass through is not the actual orifice, but (upstream from the
orifice) the shortest line connecting the stagnant zone boundary to the
upper orifice edge. The length $D' \( theta \)$ of this cross-section is

$ D' \( theta \) = cases(delim: "{", D \, & theta lt.eq pi \/ 2 - theta_(upright(S)), D sin \( theta + theta_(upright(S)) \) \, & theta > pi \/ 2 - theta_(upright(S))) . $<eqn:Dprime>
We note that this approach assumes that the flow drops to zero if
$theta + theta_(upright(S)) = pi$, i.e., $theta = 120^compose$ in our
case. This assumption is most appropriate for the fixed grain case and
less applicable in the flat edge case.

#figure(image("graphics/Figure14_NarrowestOrificeSchematic.svg", width: 100.0%),
  caption: [
    \(a) Schematic showing the narrowest opening for
    $theta > pi \/ 2 - theta_(upright(S))$. (b) A sample image in which
    the narrowest opening cross-section profile has been sampled. Though
    the cross-section extends to the end of the image, we restrict our
    analysis to the narrowest opening, between the stagnant zone edge
    and upper edge.
  ]
)
<fig:neworificemodel>

We now analyze the experimental image data by capturing profiles of
packing fraction $phi.alt'$, speed $v'$, and flow angle $alpha'$ along
the narrowest opening cross-section, #emph[not] the orifice line. The
flow rate from this new cross-section is determined by

$ Q = D' \( theta \) rho'_0 \( theta \) v' \( theta \) cos \[ alpha' \( theta \) \] \, $<eqn:qmodelnarrow>

which will lead to the same result as Eqn.~@eqn:qmodel by mass
conservation, except for the fact that the profile we analyze below is
truncated to extend only along $D'$, from the stagnant zone boundary to
the upper orifice edge.

Despite the truncated cross-section, we have confirmed that the most
significant contributions to the outpouring flow that we measure are
indeed captured within the camera's field of view. In Fig.~@fig:Q, we
show the flow rate measured via particle tracking (see Eqn.~@eqn:qvideo)
using the traditional orifice cross-section $D$ (diamonds), using the
cross-section along the narrowest opening and extending across the
entire image field of view as shown by the dark green strip in
Fig.~#ref(<fig:neworificemodel>, supplement: none);(b) (squares), and using the "truncated"
narrowest opening profile of length $D'$ as shown by the yellow dashed
line in Fig.~#ref(<fig:neworificemodel>, supplement: none);(b) (stars). Even with truncation of the
profile, the flow rates in the fixed grain case are hardly changed. For
flat edges there is more significant reduction in the measured flow rate
in intermediate angles due to the significant slip zone discussed in
Sec.~@sec:spatialflow. We therefore continue our analysis using the
truncated narrowest opening profile specified by the model, extending
from the stagnant zone boundary to the upper edge and of length $D'$.

Before proceeding, we note that the flow cannot be analyzed for
$theta > 120^compose$ in this manner since $D'$ vanishes at
$120^compose$.

== Flow velocity and packing fraction along the narrowest opening
<flow-velocity-and-packing-fraction-along-the-narrowest-opening>
We now analyze the flow along the narrowest opening as demonstrated in
Fig.~#ref(<fig:neworificemodel>, supplement: none);(b). (For $theta < 30^compose$, we use the same
profiles as analyzed in Sec.~@sec:results since the orifice #emph[is]
the narrowest opening for these angles.) Figure~@fig:neworificeprofile
shows profiles along the narrowest opening of packing fraction
$phi.alt'$, speed $v'$, and flow direction $alpha'$ with respect to the
narrowest opening normal $hat(n)'$. (See Supplemental Materials for
profiles of components $v'_perp$ and $v'_(\| \|)$~\[42\].) Note that the
horizontal axis is normalized to $D'$ since the narrowest opening length
varies with $theta$ according to Eqn.~@eqn:Dprime.

The packing fraction and velocity exhibit similar profiles to those with
the orifice profile in Fig.~@fig:profiles. Packing fraction is
approximately constant to lowest order with $theta$, and outpouring
speed decreases with $theta$. Unlike with the conventional orifice
analysis, however, $alpha'$ now collapses with respect to the angle
$theta$ and is close to $0^compose$ (see Fig.~#ref(<fig:profiles>, supplement: none);(c),f).

#figure(image("graphics/Figure15_ProfilesNarrowest.svg", width: 100.0%),
  caption: [
    Narrowest opening cross-section profiles of (a,d) packing fraction,
    (b,e) speed, and (c,f) flow angle for (top row) the flat edge case
    and (bottom row) the fixed grain case, at varying elevation angles
    $theta$ (see color scale).
  ]
)
<fig:neworificeprofile>

== Modeling $phi.alt'$, $v'$, and $alpha'$
<modeling-phi-v-and-alpha>
Figure~@fig:newmodelfits displays averages of the profiles in
Fig.~@fig:neworificeprofile of packing fraction $phi.alt'$, speed
$v' \/ v'_0$ normalized by the speed at $theta = 0^compose$, and angle
$alpha'$. Our model equations are shown as black solid lines. As in
Sec.~@sec:model, we approximate the packing fraction to lowest order as
a constant $phi.alt' \( theta \) = 0.66$
($rho'_0 = 5.1 #h(0em) upright(k g) \/ m^2$), calculated from the
average along the narrowest opening in the flat edge case. For $alpha'$,
we use the model Eqn.~@eqn:modelalphacomplete for
$theta lt.eq pi \/ 2 - theta_(upright(S))$. As a first order approach
for $theta > pi \/ 2 - theta_(upright(S))$, we take the average of
$alpha'$ for all $theta > pi \/ 2 - theta_(upright(S))$ data points in
the flat edge case and set
$alpha' = upright(c o n s t a n t) = 4.5^compose$. Note that our model
for $alpha'$ #emph[does] include the parameter $theta_(upright(h))$, but
only in range $theta lt.eq 30^compose$.

The speed is modeled as proportional to a free-fall lengthscale, as
proposed by Zou, et. al. \[48\], but here we use the vertical projection
of a segment of length $D'$ (rather than $D$) along the direction of
flow at the narrowest opening, which has angle $alpha'_x$ with the
horizontal (see Fig.~#ref(<fig:neworificemodel>, supplement: none);(a)). Hence,

$ v' \/ v'_0 = D' sin \( alpha'_x \) \, $<eqn:vvonarrow>

where

$ alpha'_x = cases(delim: "{", pi \/ 2 - theta + alpha' \, & theta lt.eq pi \/ 2 - theta_(upright(S)), theta_(upright(S)) + alpha' \, & theta > pi \/ 2 - theta_(upright(S))) . $<eqn:alphaprimex>

In comparison to the average packing fraction along the orifice in
Fig.~#ref(<fig:profileaverages>, supplement: none);(a), the packing fraction is higher upstream from
the orifice. Correspondingly, as the material is unable to dilate as
effectively until it reaches the orifice, the speed measured along the
narrowest orifice in Fig.~#ref(<fig:newmodelfits>, supplement: none);(b) decays more rapidly with
angle in comparison to the speed at the orifice in
Fig.~#ref(<fig:profileaverages>, supplement: none);(b). Nevertheless, the free-fall arch
consideration of Zou, et. al., is more effective at capturing the speed
for the narrowest cross-section instead of the orifice. Lastly, the flow
angle is approximately constant and close to $0^compose$ with respect to
the narrowest opening normal, implying that the average flow is aligned
with the stagnant zone boundary. Each model component, though not a
direct match with the data, is an excellent lowest-order fit for the
data.

The final result for the normalized flow rate from
Eqn.~@eqn:qmodelnarrow with $theta_(upright(S)) = 60^compose$ and
$theta_(upright(h)) = 120^compose$ is in Fig.~@fig:QQ0 as a thick black
line. The narrowest opening model is more successful at capturing the
normalized flow rate for the fixed grain and tilted silo available data
than the traditional orifice model (thin gray line). This model uses a
simple geometric consideration along with measurable properties of the
granular material, $theta_(upright(S))$ and $theta_(upright(h))$, to
describe an effective bottlenecking orifice that constrains the material
flow. Moreover, it involves a simpler approach for modeling the
outpouring angle and better fits the normalized outpouring speed. We
emphasize that prior attempts to model the flow velocity in tilted silo
entail empirical or semi-empirical fitting to the data~\[36, 37, 38, 39,
40\].

#figure(image("graphics/Figure16_AverageFlowPropertiesNarrowest.svg", width: 100.0%),
  caption: [
    Narrowest opening cross-section: (a) Average packing fraction, (b)
    average speed normalized to speed at $theta = 0$, and (c) flow angle
    with respect to cross-section normal for flat edge and fixed grain
    conditions. Black solid lines: model equations for each quantity
    using $theta_(upright(S)) = 60^compose$ and
    $theta_(upright(h)) = 120^compose$.
  ]
)
<fig:newmodelfits>

= Conclusions
<sec:conclusions>
In this work, we presented novel experiments in which the orifice of a
vertical silo is rotated by elevating one edge of the orifice. Using
high-speed imaging, we analyzed properties of the flow in the vicinity
of the orifice to describe the primary factors that contribute to the
decrease in flow rate. We demonstrated that the quasi-quiescent stagnant
zone near each orifice edge plays an important role for the direction
and exit speed of the flowing material. In particular, by constraining a
grain at each orifice end, we observe a more clearly defined stagnant
zone region and a faster decay of flow rate with orifice angle. Without
a fixed grain, the stagnant zones exhibit intermittent creep that
contributes grains with horizontal momentum to the flow near the orifice
edges. The flow also becomes increasingly horizontal along a slip zone
at the bottom edge as tilt angle increases.

We then developed a novel model based on physics of the flow and
measured properties of the granular material. We show that modeling the
flow rate based on the flow properties along the orifice cross-section,
as has been done with great success in horizontal orifice
configurations, is challenging for angled orifice openings. However, the
model outcome significantly improves if we consider a new cross-section:
the narrowest opening cross-section through which grains pass assuming
an idealized stagnant zone. The success of modeling the flow in the
fixed grain case and with prior tilted silo results at the narrowest
opening implies that the relevant lengthscale for a rotated orifice is
$D'$ (Eqn.~@eqn:Dprime). Correspondingly, one might test the range of
validity of this model by modifying properties of the material pertinent
for the stagnant zone angle $theta_(upright(S))$, such as grain-grain
friction, grain-boundary friction, size dispersity, shape, and
inter-grain cohesion. Moreover, higher-order components of the
narrowest-opening model may be applied to more appropriately model the
flat edge case by considering the development of the horizontal slip
zone at steep angles.

We also showed that the "flat edge" and "fixed grain" cases are upper
and lower bounds, respectively, for the normalized flow rate
$Q \( theta \) \/ Q \( theta = 0 \)$ of tilted silos based on prior
experimental data. The fixed grain scenario more closely resembles the
tilted silo in terms of flow rate. We suggest that the primary
distinction between the tilted silo scenario and the flat edge case is
that, in the case of the tilted silo, at least one of the boundaries
that grains slide along is a stagnant pile of grains, effectively rough
and frictional. As we noted in Sec.~@sec:profiles, the average flow
properties of the tilted silo and fixed grain case are similar,
suggesting that having at least one effectively rough orifice edge
influences the flow similarly. Detailed analysis in this direction is
left for future studies.

Our work takes an important step toward understanding the physics of dry
granular flow from silos and hoppers with non-conventional opening
geometries and boundary conditions. The geometry studied may be of
practical use since it allows tilting of the orifice to control flow
without tilting the entire silo.

= Declaration of interests
<declaration-of-interests>
The authors have nothing to declare.

= CRediT (Contributions)
<credit-contributions>
L.A.P.: Conceptualization, funding acquisition, investigation,
validation, visualization, writing -- review and editing. R.K.:
Conceptualization, data curation, formal analysis, funding acquisition,
investigation, methodology, validation, visualization, writing --
original draft, writing -- review and editing.

= Funding sources
<funding-sources>
This work was supported by College of the Holy Cross; CONICET
(Argentina) \[grant PIP-717\]; and UNLPam (Argentina) \[grant F65\].

= Acknowledgments
<acknowledgments>
The authors thank C. Manuel Carlevaro for helpful conversations on this
work.

#heading(level: 1, numbering: none)[References]
<references>
+ Q.~Liu, B.~Zhao, J.~C. Santamarina,
  #link("https://agupubs.onlinelibrary.wiley.com/doi/abs/10.1029/2019JB017813")[Particle migration and clogging in porous media: A convergent flow microfluidics study],
  Journal of Geophysical Research: Solid Earth 124 (2019) 9495--9504.
  #link("https://doi.org/https://doi.org/10.1029/2019JB017813")[].

+ D.~Sloan, J.~Creek, A.~K. Sum,
  #link("https://www.sciencedirect.com/science/article/pii/B9781856179454000029")[Chapter Two - Where and How Are Hydrate Plugs Formed?],
  Gulf Professional Publishing, 2011, pp. 13--36.
  #link("https://doi.org/https://doi.org/10.1016/B978-1-85617-945-4.00002-9")[].

+ D.~Helbing, I.~Farkas, T.~Vicsek,
  #link("https://doi.org/10.1038/35035023")[Simulating dynamical features of escape panic],
  Nature 407 (2000) 487--490.
  #link("https://doi.org/10.1038/35035023")[].

+ D.~Helbing, L.~Buzna, A.~Johansson, T.~Werner,
  #link("https://www.jstor.org/stable/25769227")[Self-organized pedestrian crowd dynamics: Experiments, simulations, and design solutions],
  Transportation Science 39 (2005) 1--24.
  #link("https://doi.org/10.1287/trsc.1040.0108")[].

+ I.~Zuriguel, D.~R. Parisi, R.~C. Hidalgo, C.~Lozano, A.~Janda, P.~A.
  Gago, J.~P. Peralta, L.~M. Ferrer, L.~A. Pugnaloni, E.~Clément,
  D.~Maza, I.~Pagonabarraga, A.~Garcimartín,
  #link("http://www.nature.com/articles/srep07324")[Clogging transition of many-particle systems flowing through bottlenecks],
  Scientific Report 4 (2014) 7324.
  #link("https://doi.org/10.1038/srep07324")[].

+ A.~M. Gurnell, H.~Piégay, F.~J. Swanson, S.~V. Gregory,
  #link("https://doi.org/10.1046/j.1365-2427.2002.00916.x")[Large wood and fluvial processes],
  Freshwater Biology 47 (2002) 601--619.
  #link("https://doi.org/https://doi.org/10.1046/j.1365-2427.2002.00916.x")[].

+ M.~D. Haw,
  #link("https://journals.aps.org/prl/abstract/10.1103/PhysRevLett.92.185506")[Jamming, two-fluid behavior, and "self-filtration" in concentrated particulate suspensions],
  Physical Review Letters 92 (2004).
  #link("https://doi.org/10.1103/PhysRevLett.92.185506")[].

+ D.~Genovese, J.~Sprakel,
  #link("https://pubs.rsc.org/en/content/articlelanding/2011/sm/c0sm01338b")[Crystallization and intermittent dynamics in constricted microfluidic flows of dense suspensions],
  Soft Matter 7 (2011). #link("https://doi.org/10.1039/c0sm01338b")[].

+ E.~Dressaire, A.~Sauret,
  #link("https://pubs.rsc.org/en/content/articlelanding/2017/sm/c6sm01879c")[Clogging of microfluidic systems],
  Soft Matter 13 (2017) 37--48.
  #link("https://doi.org/10.1039/C6SM01879C")[].

+ M.~Souzy, I.~Zuriguel, A.~Marin,
  #link("https://link.aps.org/doi/10.1103/PhysRevE.101.060901")[Transition from clogging to continuous flow in constricted particle suspensions],
  Physical Review E 101 (2020) 060901.
  #link("https://doi.org/10.1103/PhysRevE.101.060901")[].

+ H.~M. Jaeger, S.~R. Nagel, R.~P. Behringer,
  #link("https://link.aps.org/doi/10.1103/RevModPhys.68.1259")[Granular solids, liquids, and gases],
  Reviews of Modern Physics 68 (1996) 1259--1273.
  #link("https://doi.org/10.1103/RevModPhys.68.1259")[].

+ F.~J. Muzzio, T.~Shinbrot, B.~J. Glasser,
  #link("https://www.sciencedirect.com/science/article/pii/S003259100100482X")[Powder technology in the pharmaceutical industry: the need to catch up fast],
  Powder Technology 124 (2002) 1--7.
  #link("https://doi.org/https://doi.org/10.1016/S0032-5910(01)00482-X")[].

+ J.~J. Fitzpatrick, T.~Iqbal, C.~Delaney, T.~Twomey, M.~K. Keogh,
  #link("https://www.sciencedirect.com/science/article/pii/S026087740300459X")[Effect of powder properties and storage conditions on the flowability of milk powders with different fat contents],
  Journal of Food Engineering 64 (2004) 435--444.
  #link("https://doi.org/https://doi.org/10.1016/j.jfoodeng.2003.11.011")[].

+ N.~Job, A.~Dardenne, J.-P. Pirard,
  #link("https://www.sciencedirect.com/science/article/pii/S0260877408004007")[Silo flow-pattern diagnosis using the tracer method],
  Journal of Food Engineering 91 (2009) 118--125.
  #link("https://doi.org/https://doi.org/10.1016/j.jfoodeng.2008.08.010")[].

+ N.~Li, G.~G.~D. Zhou, H.~Hu, K.~F.~E. Cui, Y.~Huang,
  #link("https://www.sciencedirect.com/science/article/pii/S0013795223003514")[Influence of trapping efficiency on the pile-up geometry of granular flows behind slit dams],
  Engineering Geology 326 (2023) 107333.
  #link("https://doi.org/https://doi.org/10.1016/j.enggeo.2023.107333")[].

+ K.~Saleh, S.~Golshan, R.~Zarghami,
  #link("https://www.sciencedirect.com/science/article/pii/S0009250918305979")[A review on gravity flow of free-flowing granular solids in silos -- basics and practical aspects],
  Chemical Engineering Science 192 (2018) 1011--1035.
  #link("https://doi.org/10.1016/j.ces.2018.08.028")[].

+ W.~A. Beverloo, H.~A. Leniger, J.~van~de Velde,
  #link("https://www.sciencedirect.com/science/article/abs/pii/0009250961850306")[The flow of granular solids through orifices],
  Chemical Engineering Science 15 (1961) 260--269.
  #link("https://doi.org/10.1016/0009-2509(61)85030-6")[].

+ C.~Mankoc, A.~Janda, R.~Arévalo, J.~M. Pastor, I.~Zuriguel,
  A.~Garcimartín, D.~Maza,
  #link("https://link.springer.com/article/10.1007/s10035-007-0062-2")[The flow rate of granular materials through an orifice],
  Granular Matter 2007 9:6 9 (2007) 407--414.
  #link("https://doi.org/10.1007/S10035-007-0062-2")[].

+ J.~R. Darias, M.~A. Madrid, L.~A. Pugnaloni,
  #link("https://journals.aps.org/pre/abstract/10.1103/PhysRevE.101.052905")[Differential equation for the flow rate of discharging silos based on energy balance],
  Physical Review E 101 (2020) 052905.
  #link("https://doi.org/10.1103/PhysRevE.101.052905")[].

+ R.~Brown, J.~Richards,
  #link("https://www.sciencedirect.com/science/article/pii/B9780080066059500103")[Chapter 6 - kinematics],
  in: R.~Brown, J.~Richards (Eds.), Principles of Powder Mechanics,
  Pergamon, 1970, pp. 135--202.
  #link("https://doi.org/https://doi.org/10.1016/B978-0-08-006605-9.50010-3")[].

+ B.~P. Tighe, M.~Sperl,
  #link("https://link.springer.com/article/10.1007/s10035-006-0027-x")[Pressure and motion of dry sand: Translation of hagen's paper from 1852],
  Granular Matter 9 (2007) 141--144.
  #link("https://doi.org/10.1007/s10035-006-0027-x")[].

+ S.~M. Rubio-Largo, A.~Janda, D.~Maza, I.~Zuriguel, R.~C. Hidalgo,
  #link("https://journals.aps.org/prl/abstract/10.1103/PhysRevLett.114.238002")[Disentangling the free-fall arch paradox in silo discharge],
  Physical Review Letters 114 (2015) 238002.
  #link("https://doi.org/10.1103/PhysRevLett.114.238002")[].

+ M.~A. Madrid, J.~R. Darias, L.~A. Pugnaloni,
  #link("https://iopscience.iop.org/article/10.1209/0295-5075/123/14004")[Forced flow of granular media: Breakdown of the beverloo scaling],
  Europhysics Letters 123 (2018) 14004.
  #link("https://doi.org/10.1209/0295-5075/123/14004")[].

+ D.~López, D.~Hernández-Delfin, R.~C. Hidalgo, D.~Maza, I.~Zuriguel,
  #link("https://journals.aps.org/pre/abstract/10.1103/PhysRevE.102.010902")[Clogging-jamming connection in narrow vertical pipes],
  Physical Review E 102 (2020) 010902.
  #link("https://doi.org/10.1103/physreve.102.010902")[].

+ H.~Rose, T.~Tanaka, Rate of discharge of granular materials from bins
  and hoppers, The Engineer 208 (1959) 465--469.

+ J.~R. Darias, D.~Gella, M.~E. Fernández, I.~Zuriguel, D.~Maza,
  #link("https://www.sciencedirect.com/science/article/pii/S0032591020301698")[The hopper angle role on the velocity and solid-fraction profiles at the outlet of silos],
  Powder Technology 366 (2020) 488--496.
  #link("https://doi.org/https://doi.org/10.1016/j.powtec.2020.02.061")[].

+ D.~Méndez, R.~C. Hidalgo, D.~Maza,
  #link("https://doi.org/10.1007/s10035-021-01094-6")[The role of the hopper angle in silos: experimental and cfd analysis],
  Granular Matter 23 (2021) 34.
  #link("https://doi.org/10.1007/s10035-021-01094-6")[].

+ P.~A. Gago, M.~A. Madrid, S.~Boettcher, R.~Blumenfeld, P.~King,
  #link("https://www.sciencedirect.com/science/article/pii/S0032591023006265")[Effect of bevelled silo outlet in the flow rate during discharge],
  Powder Technology 428 (2023) 118842.
  #link("https://doi.org/https://doi.org/10.1016/j.powtec.2023.118842")[].

+ Z.~Zatloukal, Z.~Šklubalová,
  #link("https://www.tandfonline.com/doi/full/10.1080/02726351.2011.573839")[Effect of orifice geometry on particle discharge rate for a flat-bottomed, cylindrical hopper],
  Particulate Science and Technology 30~(4) (2012) 316--328.
  #link("https://doi.org/10.1080/02726351.2011.573839")[].

+ A.~Kunte, P.~Doshi, A.~V. Orpe,
  #link("https://link.aps.org/doi/10.1103/PhysRevE.90.020201")[Spontaneous jamming and unjamming in a hopper with multiple exit orifices],
  Physical Review E 90 (2014) 020201.
  #link("https://doi.org/10.1103/PhysRevE.90.020201")[].

+ C.~S. Chang, H.~H. Converse, J.~L. Steele,
  #link("https://elibrary.asabe.org/abstract.asp?aid=31802&t=3")[Flow rates of grain through various shapes of vertical and horizontal orifices],
  Transactions of the ASAE 34 (1991) 1789--1796.
  #link("https://doi.org/https://doi.org/10.13031/2013.31802")[].

+ A.~Medina, D.~Cabrera, A.~López-Villa, M.~Pliego,
  #link("https://www.sciencedirect.com/science/article/pii/S0032591013007109")[Discharge rates of dry granular material from bins with lateral exit holes],
  Powder Technology 253 (2014) 270--275.
  #link("https://doi.org/10.1016/J.POWTEC.2013.11.027")[].

+ Y.~Zhou, P.-Y. Lagrée, S.~Popinet, P.~Ruyer, P.~Aussillous,
  #link("https://www.cambridge.org/core/journals/journal-of-fluid-mechanics/article/experiments-on-and-discrete-and-continuum-simulations-of-the-discharge-of-granular-media-from-silos-with-a-lateral-orifice/0B924467BC7DF119B7E03B190EDDA999")[Experiments on, and discrete and continuum simulations of, the discharge of granular media from silos with a lateral orifice],
  Journal of Fluid Mechanics 829 (2017) 459--485.
  #link("https://doi.org/DOI: 10.1017/jfm.2017.543")[].

+ D.~A. Serrano, G.~Ruiz-Chavarría, M.~Pliego, C.~A. Vargas, A.~Medinas,
  #link("https://rmf.smf.mx/ojs/index.php/rmf/article/view/Vol.%2065%2C%20Issue%202%2C%20pp.%20139-147")[On the validity of the hagen and beverloo formulas for grains discharge through thin sidewalls of bins],
  Revista Mexicana de Física 65 (2019) 139--147.
  #link("https://doi.org/10.31349/REVMEXFIS.65.139")[].

+ V.~K.~R. Anyam, K.~A. Reddy,
  #link("https://aip.scitation.org/doi/abs/10.1063/5.0086936")[Granular mixtures discharging through a silo with lateral orifice],
  Physics of Fluids 34 (2022) 043319.
  #link("https://doi.org/10.1063/5.0086936")[].

+ F.~C. Franklin, L.~N. Johanson,
  #link("https://www.sciencedirect.com/science/article/pii/0009250955800036")[Flow of granular material through a circular orifice],
  Chemical Engineering Science 4 (1955) 119--129.
  #link("https://doi.org/https://doi.org/10.1016/0009-2509(55)80003-6")[].

+ H.~G. Sheldon, D.~J. Durian,
  #link("https://link.springer.com/article/10.1007/s10035-010-0198-3")[Granular discharge and clogging for tilted hoppers],
  Granular Matter 12 (2010) 579--585.
  #link("https://doi.org/10.1007/S10035-010-0198-3")[].

+ C.~C. Thomas, D.~J. Durian,
  #link("https://journals.aps.org/pre/abstract/10.1103/PhysRevE.87.052201")[Geometry dependence of the clogging transition in tilted hoppers],
  Physical Review E 87 (2013) 052201.
  #link("https://doi.org/10.1103/PhysRevE.87.052201")[].

+ Y.~Liu,
  #link("https://link.springer.com/article/10.1007/s10035-013-0473-1")[The theoretical calculation of the flow rate of granular matter from an inclined orifice],
  Granular Matter 16 (2014) 133--139.
  #link("https://doi.org/10.1007/s10035-013-0473-1")[].

+ R.~Kozlowski, J.~C. Luketich, E.~Oshatz, D.~J. Durian, L.~A.
  Pugnaloni,
  #link("https://link.springer.com/10.1007/s10035-023-01310-5")[Average outpouring velocity and flow rate of grains discharged from a tilted quasi-2d silo],
  Granular Matter 25 (2023) 19.
  #link("https://doi.org/10.1007/s10035-023-01310-5")[].

+ J.~Wiącek, J.~Horabik, M.~Molenda, P.~Parafiniuk, M.~Bańda,
  M.~Stasiak,
  #link("https://doi.org/10.1038/s41598-023-27431-8")[Converging orifice used to control the discharge rate of spherical particles from a flat floor silo],
  Scientific Reports 13 (2023) 669.
  #link("https://doi.org/10.1038/s41598-023-27431-8")[].

+ See Supplemental Materials for perpendicular and normal components of
  the velocity along different cross sections and for samples of the
  videos captured and analyzed in this study.

+ E.~R. Davies,
  #link("https://www.sciencedirect.com/science/article/pii/B9780128092842000034")[Chapter 3 - Image filtering and morphology],
  Academic Press, 2018, pp. 39--92.
  #link("https://doi.org/https://doi.org/10.1016/B978-0-12-809284-2.00003-4")[].

+ I.~S. Duff, J.~Koster,
  #link("https://epubs.siam.org/doi/10.1137/S0895479899358443")[On algorithms for permuting large entries to the diagonal of a sparse matrix],
  SIAM Journal on Matrix Analysis and Applications 22 (2001).
  #link("https://doi.org/10.1137/S0895479899358443")[].

+ A.~Garcimartín, I.~Zuriguel, L.~A. Pugnaloni, A.~Janda,
  #link("https://journals.aps.org/pre/abstract/10.1103/PhysRevE.82.031306")[Shape of jamming arches in two-dimensional deposits of granular materials],
  Physical Review E 82 (2010) 031306.
  #link("https://doi.org/10.1103/PhysRevE.82.031306")[].

+ I.~Zuriguel,
  #link("http://dx.doi.org/10.4279/PIP.060014")[Invited review: Clogging of granular materials in bottlenecks],
  Papers in Physics 6 (2014) 060014.
  #link("https://doi.org/10.4279/PIP.060014")[].

+ H.~W. Zhu, L.~P. Wang, Q.~F. Shi, L.~S. Li, N.~Zheng,
  #link("https://www.sciencedirect.com/science/article/pii/S0032591019300543")[Improvement in flow rate through an aperture on a conveyor belt: Effects of bottom wall and packing configurations],
  Powder Technology 345 (2019).
  #link("https://doi.org/10.1016/j.powtec.2019.01.053")[].

+ Z.~Zou, P.~Ruyer, P.~Y. Lagrée, P.~Aussillous,
  #link("https://journals.aps.org/pre/abstract/10.1103/PhysRevE.102.052902")[Discharge of a silo through a lateral orifice: Role of the bottom inclination versus friction],
  Physical Review E 102 (2020) 052902.
  #link("https://doi.org/10.1103/PhysRevE.102.052902")[].

+ A.~Janda, I.~Zuriguel, D.~Maza,
  #link("https://journals.aps.org/prl/abstract/10.1103/PhysRevLett.108.248001")[Flow rate of particles through apertures obtained from self-similar density and velocity profiles],
  Physical Review Letters 108 (2012) 248001.
  #link("https://doi.org/10.1103/PHYSREVLETT.108.248001/FIGURES/4/MEDIUM")[].

+ D.~Huang, G.~Sun, K.~Lu,
  #link("https://journals.aps.org/pre/abstract/10.1103/PhysRevE.74.061306")[Relationship between the flow rate and the packing fraction in the choke area of the two-dimensional granular flow],
  Physical Review E---Statistical, Nonlinear, and Soft Matter Physics
  74~(6) (2006) 061306.
  #link("https://doi.org/10.1103/PhysRevE.74.061306")[].

+ C.~Li, X.~Li, T.~Jiao, F.~Hu, M.~Sun, D.~Huang,
  #link("https://www.sciencedirect.com/science/article/pii/S0032591022001656")[Influence of grain bidispersity on dense granular flow in a two-dimensional hopper],
  Powder Technology 401 (2022) 117271.
  #link("https://doi.org/https://doi.org/10.1016/j.powtec.2022.117271")[].
