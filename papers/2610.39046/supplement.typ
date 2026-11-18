// Adapted from Gungor et al., arXiv:2610.39046v1 (CC BY 4.0).
// https://arxiv.org/abs/2610.39046v1 | https://creativecommons.org/licenses/by/4.0/
#set math.equation(numbering: "(1)")
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
  sectionnumbering: "1.1",
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
  abstract-title: [Abstract],
  pagenumbering: "1",
  cols: 1,
  doc,
)


#block[
#strong[Supplementary material] \
#strong[A 3D measurement workflow for assessing replication quality and
tool degradation in moulded microfluidic channels] \
Mehmet Oğulcan Güngör, Jérôme Charmet, Ender Yıldırım

]
This supplement gives the algorithm reference of the analysis software
(Section~@sec:s1), the complete synthetic characterisation of
$upright(R Q)_d$ (Section~@sec:s2), and the per-channel numbers behind
the figures and tables of the main text (Sections~@sec:s3 to @sec:s9).
All values were computed with the production code of the software at the
fixed settings of the main text: analysis grid cell size
$Delta = 5 med upright("μ") upright("m")$, the $sigma = Delta$
pre-gradient filter (the software's floor, its "no smoothing" setting),
channel-interior mask at $0.20$ of the depth on both surfaces. Only the
bare (uncoated) inserts are reported. Section and table numbers of the
form "Section~3.2" refer to the main text. HT and R10K denote the High
Temp and Rigid 10K resins.

= Algorithm reference of the analysis software
<sec:s1>
The Microchannel and Replication Quality Analyzer (MaRQ, version 1.0) is
implemented in Python and runs client-side in the browser through
Pyodide, a WebAssembly build of the scientific Python stack. It uses
NumPy for array and gradient operations, SciPy (`scipy.ndimage`,
`scipy.stats`) for Gaussian filtering, nearest-valid gap filling and the
Pearson correlation, Plotly for the interactive plots and three.js for
the 3D views. It accepts delimited text point clouds (`.txt`, `.xyz`,
`.csv`) with automatic delimiter detection and ISO~25178-72 X3P binary
files, whose invalid points, flagged in a validity mask or stored as
missing values, are left out. The same functions drive a batch runner,
so interactive and large-scale runs execute identical code.
Figure~@fig:s1_ui shows the interface.

#figure(image("figures/supp_ui.svg"),
  caption: [
    The software in a web browser, on the sample channel of the data
    package. (a)~Single-surface analysis of a High Temp 600~μm insert:
    the commands (top), the inputs and views of each result (left), the
    extracted dimensions and roughness parameters (right), and the mean
    cross-section and the local depth along the channel. (b)~Paired
    comparison of the insert (A) with its first moulded part (B): the
    height maps of both surfaces and the height error $E_Z$ on the
    common grid, with $upright(R Q)_d$, $upright(R Q)$,
    $upright(R Q)_(d x)$ and $upright(R Q)_(d y)$.
  ]
)
<fig:s1_ui>

#heading(level: 2, numbering: none)[Single-surface module]
<single-surface-module>
The single-surface module characterises the geometry and areal roughness
of one surface through the following pipeline.

+ #strong[Load] the point cloud and normalise the coordinates to
  micrometres.

+ #strong[Edge crop] a fixed margin to discard unreliable edge points.

+ #strong[Despike.] A field plane is fitted to an 8~μm voxel copy of the
  cloud. A raised feature, such as an insert ridge, reaches further
  above this plane than below it (by the 99th and 1st percentiles of the
  copy) and is first turned into the equivalent depression by a
  $180^compose$ rotation about an in-plane axis. Because rims rising
  higher than a channel is deep would make it read as a ridge, MaRQ lets
  the user set the feature to channel or ridge instead, and every scan
  here was left on the automatic decision. The points more than 40~μm
  above the plane (focus-variation spikes) are then removed, and so are
  the points far below the channel floor (optical dropouts): more than
  380~μm below the plane, or $1.15$ times the floor depth when that is
  deeper. The floor depth here is that of the deepest 5~μm level, among
  those more than 40~μm below the plane, that holds at least a fifth of
  the points of the fullest of them.

+ #strong[Voxel downsample] to a uniform point density at 5~μm, which
  regularises the sampling and sets the sampling interval of every later
  quantity.

+ #strong[Field levelling and orientation.] The field is fitted by a
  robust least-squares plane: the inliers are seeded on the outer border
  of the scan, which is field, and re-selected in six passes as the
  points within $2.5$ median absolute deviations of the plane. The plane
  is subtracted, which places the field at $z = 0$. The orientation is
  checked again on the levelled heights, by their 2nd and 98th
  percentiles, and the field is re-zeroed.

+ #strong[Channel-axis alignment.] Principal component analysis of the
  points below half the estimated depth gives the channel axis, which is
  rotated onto $x$ with the channel centred at the origin; the field
  plane is then fitted again in this frame and subtracted, leaving a
  residual tilt below $0.001^compose$.

+ #strong[Depth from the aggregate cross-section.] The channel extent is
  the along-axis span over which the channel is deeper than half the
  estimated depth. All points over this extent are pooled into one
  transverse profile of $400$ equally spaced bins, each holding the
  median height of its points (bins with fewer than three points
  omitted). The floor level $z_f$ is the median of the bins at or below
  the fifth percentile, and the channel depth is $d = - z_f$. When the
  channel is narrow against the scan, spanning at half depth less than
  $6 thin %$ of the profile, the floor level is read within twice that
  width around it, here and in every slice.

+ #strong[Widths, wall angle and corner rounding on grid lines.] The
  points are averaged on a grid of 5~μm cells across the channel, in
  lines 10~μm apart along it, over the central $80 thin %$ of the
  channel extent, so that the rounded channel ends are excluded. On
  every line the wall position at the level $z = - f thin d$ is the
  first place where the height profile rises above the level, moving
  outwards from the channel centre line on each side, located by linear
  interpolation between the two grid points that bracket it; no crossing
  is interpolated across more than three empty cells. The floor,
  mid-depth and opening widths $w_(upright(f l o o r))$,
  $w_(upright(m i d))$ and $w_(upright(o p e n))$ are the distances
  between the two walls at $f = 0.90$, $0.50$ and $0.10$, each reported
  as the median over the lines. On each line and wall a straight line is
  fitted by least squares to the wall positions at $f = 0.25$, $0.375$,
  $0.50$, $0.625$ and $0.75$\; its inclination from the vertical,
  positive when the channel widens towards the opening, is the wall
  angle of that wall. The reported wall angle is the median over the
  lines and both walls; the angles of the two walls are also given.
  Walls of $1^compose$ and $2^compose$ read $1.6^compose$ and
  $2.4^compose$, so a wall within $3^compose$ of the vertical is
  reported as $< 3^compose$. The floor-corner rounding is the distance
  by which the wall at $f = 0.90$ lies inside the extended fitted line,
  and the rim-corner rounding the distance by which the wall at
  $f = 0.10$ lies outside it, both medians over the lines and walls.

+ #strong[Channel length and crop.] The length is read at $f = 0.90$ in
  the same way on lines along the channel, within a tenth of the floor
  width of its centre line. Each end is found from the outside in, as
  the outermost run of at least three cells below the level and the
  interpolated crossing just outside it, so that a floor that undulates
  across the level does not end the length early. The crop passed to the
  paired-surface module spans the two measured ends plus 180~μm along
  the channel and the opening width plus 100~μm on each side across it.
  On a broken channel the crop therefore covers the part that still
  reaches the floor level, and the missing part lies outside the
  comparison.

+ #strong[Longitudinal variation.] The standard deviations of the widths
  over the grid lines describe their variation along the channel. For
  the depth, the channel extent is divided into 80 non-overlapping
  slices. In each slice the transverse points are assigned to 120
  equally spaced bins and the median height in each bin forms the slice
  profile; bins with fewer than two points are omitted rather than
  interpolated, and slices with fewer than twenty points are discarded.
  Each accepted slice gives a local depth by the floor-level rule above,
  and the standard deviation over the central $80 thin %$ of the valid
  slices, the first and last tenth in order along the axis being
  excluded, is reported. These spreads describe variation within one
  scan, not measurement repeatability, and are not an uncertainty of the
  reported values.

+ #strong[Roughness.] ISO~25178-2 areal parameters are computed on three
  regions. The floor strip is $0.5$ times the nominal channel width wide
  and 4000~μm long and takes the points deeper than $0.7 thin d$. The
  two field strips are $400 times 4000 med upright("μ") upright("m")$,
  take the points above $- 0.3 thin d$, and are placed automatically
  beyond the channel rim detected from the transverse profile, symmetric
  about the channel axis; the left and right strips are reported
  separately. Each region is levelled by subtracting its own
  least-squares plane, and the parameters are evaluated on the residual
  points at the 5~μm sampling, with no further short- or long-wavelength
  filtering.

+ #strong[Wall dominance.] The cropped points are averaged on a grid of
  the voxel size, each cell centred on its point, smoothed by the
  one-cell NaN-aware Gaussian filter of the paired-surface module and
  differentiated by central differences. Over the cells deeper than
  $0.20$ of the depth, taken here as the 1st percentile of the smoothed
  heights, within the central $60 thin %$ of the crop length, the
  wall-dominance ratio
  $f_y = sum_k \( partial Z \/ partial y \)_k^2 \/ sum_k \| nabla Z \|_k^2$
  is the share of the squared slope magnitude carried by the slope
  across the channel. The rounded channel ends, where the slope runs
  along the channel, are left out.

On the height residuals $z_i$ ($i = 1 \, dots.h \, N$) of a region after
plane removal, the reported parameters are
$ S_a = 1 / N sum_(i = 1)^N \| z_i \| \, #h(2em) S_q = sqrt(1 / N sum_(i = 1)^N z_i^2) \, #h(2em) S_z = max_i z_i - min_i z_i \,\
S_(s k) = frac(1, N S_q^3) sum_(i = 1)^N z_i^3 \, #h(2em) S_(k u) = frac(1, N S_q^4) sum_(i = 1)^N z_i^4 . $
Every step is deterministic with the fixed parameters of
Table~@tab:s1_params\; there is no random subsampling, randomised
threshold or Monte Carlo iteration, so repeated analyses of the same
scan return identical numbers. The batch runner used for this study,
which calls the same functions, additionally flags implausible results
for inspection: a residual tilt above $0.1^compose$, a depth above
340~μm, an opening narrower than the floor, an inclination between the
floor and opening wall positions outside $- 2^compose$ to $35^compose$,
or a floor width outside $0.5$ to $2.5$ times the nominal.

#block[
#figure(
  align(center)[#table(
    columns: 3,
    align: (left,left,left,),
    table.header([Parameter], [Value], [Role],),
    table.hline(),
    [Edge margin], [100~μm], [Scan border discarded before processing],
    [Orientation], [99th against 1st percentile before the despike; 98th
    against 2nd after levelling], [A raised feature turned over
    ($180^compose$ about an in-plane axis)],
    [Despiking], [above $+ 40$\; below $- 380$, or $- 1.15 thin d_f$
    when deeper (μm)], [Field-plane residual limits; $d_f$ the floor
    depth found on the 8~μm copy],
    [Voxel size], [5~μm], [Downsampling cell size and sampling
    interval],
    [Field plane inliers], [within 2.5 median absolute deviations, 6
    passes], [Robust least-squares datum, seeded on the scan border],
    [Residual field tilt], [$< 0.001^compose$], [After re-levelling in
    the aligned frame],
    [Display grids], [square cells, automatic size, not finer than the
    voxel], [Visualisation only],
    [Aggregate profile], [400 bins, median per bin, $gt.eq 3$
    points], [All points over the channel extent pooled; depth],
    [Floor level], [median of bins $lt.eq$ 5th percentile], [Floor level
    $z_f$ of a profile; within twice the half-depth width of a channel
    narrower than 6 % of the profile],
    [Channel depth], [$d = - z_f$], [Field at $z = 0$ after levelling],
    [Grid lines], [5~μm cells across, lines 10~μm apart, central 80 % of
    the extent], [Widths, wall angle and corner rounding; medians over
    the lines],
    [Wall crossing], [linear between the bracketing grid points,
    $lt.eq 3$ empty cells between them], [Wall position at a level],
    [Width levels], [0.90 / 0.50 / 0.10 of the
    depth], [$w_(upright(f l o o r))$, $w_(upright(m i d))$,
    $w_(upright(o p e n))$],
    [Wall angle], [least-squares line through the wall at 0.25 to 0.75
    of the depth], [From the vertical, per wall; $< 3^compose$ not
    resolved],
    [Corner rounding], [offset of the wall from that line at 0.90 and
    0.10 of the depth], [Floor and rim corners],
    [Length], [lines within $0.1 thin w_(upright(f l o o r))$ of the
    centre line; ends from the outside in, $gt.eq 3$ cells], [At 0.90 of
    the depth],
    [Crop], [measured ends $+$ 180~μm; opening width $+ 2 times$
    100~μm], [Input of the paired-surface module],
    [Longitudinal slices], [80], [Non-overlapping, linearly spaced along
    the channel axis; depth],
    [Transverse profile bins], [120], [Bins across the scan width per
    slice],
    [Bin height statistic], [median], [Height assigned to each
    transverse bin],
    [Minimum points per bin], [2], [Bins with fewer points are omitted,
    not interpolated],
    [Minimum points per slice], [20], [Slices with fewer points are
    omitted],
    [Longitudinal spread], [SD over the grid lines; depth: over the
    central 80 % of the slices], [First and last tenth of the valid
    slices excluded],
    [Floor roughness strip], [$0.5 times$ nominal width $times$
    4000~μm], [Centred on the floor, points deeper than $0.7 thin d$],
    [Field roughness
    strips], [$400 times 4000 med upright("μ") upright("m")$], [Symmetric
    about the axis, beyond the detected rim, points above
    $- 0.3 thin d$],
    [Roughness form removal], [least-squares plane], [Per region; no
    further filtering],
    [Wall dominance $f_y$], [central 60 % of the crop, cells below
    $0.2 thin d$], [Share of the squared slope across the channel],
  )]
  , caption: [Parameters of the single-surface module, fixed for every
  result in the paper.]
  , kind: table
  ) <tab:s1_params>
]

#block[
P0.23 P0.31 X Parameter & Value & Role \
Edge margin & 100~μm & Scan border discarded before processing \
Orientation & 99th against 1st percentile before the despike; 98th
against 2nd after levelling & A raised feature turned over
($180^compose$ about an in-plane axis) \
Despiking & above $+ 40$\; below $- 380$, or $- 1.15 thin d_f$ when
deeper (μm) & Field-plane residual limits; $d_f$ the floor depth found
on the 8~μm copy \
Voxel size & 5~μm & Downsampling cell size and sampling interval \
Field plane inliers & within 2.5 median absolute deviations, 6 passes &
Robust least-squares datum, seeded on the scan border \
Residual field tilt & $< 0.001^compose$ & After re-levelling in the
aligned frame \
Display grids & square cells, automatic size, not finer than the voxel &
Visualisation only \
Aggregate profile & 400 bins, median per bin, $gt.eq 3$ points & All
points over the channel extent pooled; depth \
Floor level & median of bins $lt.eq$ 5th percentile & Floor level $z_f$
of a profile; within twice the half-depth width of a channel narrower
than 6 % of the profile \
Channel depth & $d = - z_f$ & Field at $z = 0$ after levelling \
Grid lines & 5~μm cells across, lines 10~μm apart, central 80 % of the
extent & Widths, wall angle and corner rounding; medians over the lines
\
Wall crossing & linear between the bracketing grid points, $lt.eq 3$
empty cells between them & Wall position at a level \
Width levels & 0.90 / 0.50 / 0.10 of the depth &
$w_(upright(f l o o r))$, $w_(upright(m i d))$, $w_(upright(o p e n))$ \
Wall angle & least-squares line through the wall at 0.25 to 0.75 of the
depth & From the vertical, per wall; $< 3^compose$ not resolved \
Corner rounding & offset of the wall from that line at 0.90 and 0.10 of
the depth & Floor and rim corners \
Length & lines within $0.1 thin w_(upright(f l o o r))$ of the centre
line; ends from the outside in, $gt.eq 3$ cells & At 0.90 of the depth \
Crop & measured ends $+$ 180~μm; opening width $+ 2 times$ 100~μm &
Input of the paired-surface module \
Longitudinal slices & 80 & Non-overlapping, linearly spaced along the
channel axis; depth \
Transverse profile bins & 120 & Bins across the scan width per slice \
Bin height statistic & median & Height assigned to each transverse bin \
Minimum points per bin & 2 & Bins with fewer points are omitted, not
interpolated \
Minimum points per slice & 20 & Slices with fewer points are omitted \
Longitudinal spread & SD over the grid lines; depth: over the central
80 % of the slices & First and last tenth of the valid slices excluded \
Floor roughness strip & $0.5 times$ nominal width $times$ 4000~μm &
Centred on the floor, points deeper than $0.7 thin d$ \
Field roughness strips & $400 times 4000 med upright("μ") upright("m")$
& Symmetric about the axis, beyond the detected rim, points above
$- 0.3 thin d$ \
Roughness form removal & least-squares plane & Per region; no further
filtering \
Wall dominance $f_y$ & central 60 % of the crop, cells below
$0.2 thin d$ & Share of the squared slope across the channel \

]
#heading(level: 2, numbering: none)[Paired-surface module]
<paired-surface-module>
The paired-surface module quantifies the similarity of two surfaces,
each already aligned to the canonical channel frame by the
single-surface module. The two clouds are resampled onto a common grid
spanning their overlapping extent by bin averaging, at the correlation
grid cell size $Delta = 5 med upright("μ") upright("m")$, cells without
a point being empty; a NaN-aware Gaussian filter of
$sigma = max \( sigma_(upright(u s e r)) \, Delta \)$ is applied, that
is $sigma = Delta$ for the paper's setting
$sigma_(upright(u s e r)) = 0$, which regularises the field and fills an
empty cell from measured cells up to four cells away; a common
valid-cell mask excludes any cell still missing on either surface; and
the height gradients are computed by second-order central differences
over $2 Delta$. Because the clouds were thinned to 5~μm voxels by the
single-surface module, about $7 thin %$ of the cells are empty before
the filter (below $0.2 thin %$ with native-density clouds); this raises
$upright(R Q)_d$ by less than $0.01$ on average and by at most $0.02$
(main text, Section~2.7). Because a straight channel is nearly symmetric
about its axis, the relative in-plane orientation of a pair is ambiguous
by $180^compose$\; the module evaluates both orientations and keeps the
one with the higher $upright(R Q)_d$ ($upright(R Q)$ against an
idealised CAD surface), a correction required for 12 of the 15
insert-to-part comparisons of the paper. The correlations are then
evaluated over the channel interior, the cells lying below $0.20$ of the
depth on both surfaces, with the depth taken as the mean of the 1st
percentiles of the two height maps on the common grid. With $Z_A$ and
$Z_B$ the co-registered height maps and $partial Z \/ partial x$,
$partial Z \/ partial y$ the gradients along and across the channel,
$ upright(R Q) = upright(P e a r s o n) \( Z_A \, Z_B \) \,\
upright(R Q)_(d x) = upright(P e a r s o n) #h(-1em) (frac(partial Z_A, partial x) \, frac(partial Z_B, partial x)) \, #h(2em) upright(R Q)_(d y) = upright(P e a r s o n) #h(-1em) (frac(partial Z_A, partial y) \, frac(partial Z_B, partial y)) \,\
upright(R Q)_d = upright(P e a r s o n) #h(-1em) (\| nabla Z_A \| \, \| nabla Z_B \|) \, #h(2em) \| nabla Z \| = sqrt((frac(partial Z, partial x))^2 + (frac(partial Z, partial y))^2) \, $
where for two fields $a$ and $b$ sampled over the $N$ retained cells
$ upright(P e a r s o n) \( a \, b \) = frac(sum_(i = 1)^N \( a_i - macron(a) \) \( b_i - macron(b) \), sqrt(sum_(i = 1)^N \( a_i - macron(a) \)^2) thin sqrt(sum_(i = 1)^N \( b_i - macron(b) \)^2)) \, #h(2em) macron(a) = 1 / N sum_(i = 1)^N a_i . $
Each metric is reported with its root-mean-square difference, and two
spatially resolved error maps retain the absolute information the
correlations discard: the signed height difference $E_Z = Z_A - Z_B$ and
the unsigned gradient-magnitude difference
$E_d = #scale(x: 120%, y: 120%)[\|] thin \| nabla Z_B \| - \| nabla Z_A \| thin #scale(x: 120%, y: 120%)[\|]$.
When one surface is the idealised CAD reference, recognised by a floor
carrying less than 1.5~μm of texture, the height correlation does not
saturate and the difference is dominated by systematic wall offsets,
which the extracted dimensions measure directly. The software then gives
the height correlation as the key result, with the gradient correlations
alongside, and the paper reports the height correlation and the
dimensions for these pairs.

#heading(level: 2, numbering: none)[Coordinate conventions]
<coordinate-conventions>
After alignment the $x$ axis runs along the channel, the $y$ axis across
it, and $z$ is the surface height; the channel is centred at the origin
with the field at $z = 0$. Because the channel is aligned with the axes,
the $x$ component of the gradient describes variation along the channel
and the $y$ component cuts through the sidewalls.

#heading(level: 2, numbering: none)[Validation of the geometry
extraction]
<validation-of-the-geometry-extraction>
The geometry readings were checked against surfaces of known shape at
the settings of the paper. Table~@tab:s1_cad compares the five CAD
references with their STL design files, read on the same levels and
lines as the software reads them: the widths agree within 0.1~μm at all
three levels, the wall angle within $0.02^compose$ of the designed
$10^compose$, and the floor-level length within 5~μm.
Table~@tab:s1_synthetic takes synthetic channels of known geometry
through the complete single-surface module. Walls of $5^compose$ to
$30^compose$ are recovered within $0.3^compose$ and the widths within a
few micrometres, also under correlated texture, random wall dropout of
up to $75 thin %$ of the points, and misalignment. Wall dropout in
patches costs up to $0.4^compose$. Two limits follow from the
definitions. Walls of $1^compose$ and $2^compose$ read $1.6^compose$ and
$2.4^compose$, so a wall within $3^compose$ of the vertical is reported
as $< 3^compose$. A floor fillet that reaches into the $25$ to
$75 thin %$ band leaves less straight wall to fit, and the wall angle
then includes part of the fillet. For circular fillets on $5^compose$ to
$15^compose$ walls the bias stays below $0.5^compose$ while the measured
floor-corner rounding is below 20~μm, and grows to about $1^compose$ at
25~μm and $2^compose$ to $3^compose$ at $30$ to 33~μm ($+ 3^compose$ and
$+ 8.5^compose$ for 150 and 200~μm fillets on a 600~μm channel). The
measured floor-corner rounding reaches $28$ to 33~μm on a few as-printed
inserts (Table~@tab:s4_dimensions), whose wall angles may therefore read
up to about $2^compose$ high if their corners are circular. In both
wall-angle trends of the main text, the first-shot change of the High
Temp inserts and the drift of the Rigid 10K inserts, the floor-corner
rounding falls while the wall angle grows, so this bias reduces the
reported increases rather than producing them. Table~@tab:s1_settings
changes one grid-line setting at a time on the measured scans, and
Table~@tab:s1_precision reads every scan on two disjoint halves of its
grid lines; both effects are far below the differences discussed in the
main text. The two walls of a channel differ consistently: the left wall
of the Rigid 10K inserts leans about $3^compose$ further from the
vertical than the right, mirrored in their parts, while the two CAD
walls agree within $0.04^compose$.

#block[
#figure(
  align(center)[#table(
    columns: 10,
    align: (right,center,center,center,center,center,center,center,center,center,),
    table.header([Nominal], table.cell(align: center, colspan: 2)[Floor
      width], table.cell(align: center, colspan: 2)[Mid-depth
      width], table.cell(align: center, colspan: 2)[Opening
      width], table.cell(align: center, colspan: 2)[Length], [Wall
      angle],),
    table.hline(),
    [2-3\(lr)4-5\(lr)6-7\(lr)8-9\(lr)10-10
    (μm)], [design], [error], [design], [error], [design], [error], [design], [error], [error
    ($""^compose$)],
    [100], [110.6], [$-$0.03], [152.9], [0.10], [195.2], [$-$0.02], [6107], [0.7], [$-$0.02],
    [200], [210.6], [$-$0.05], [252.9], [0.06], [295.2], [$-$0.02], [6209], [$-$4.3], [$-$0.01],
    [300], [310.6], [$-$0.06], [352.9], [0.07], [395.2], [$-$0.06], [6304], [$-$0.1], [$-$0.02],
    [600], [610.6], [$-$0.08], [652.9], [0.08], [695.2], [0.07], [6601], [$-$0.4], [0.00],
    [1000], [1010.6], [$-$0.07], [1052.9], [0.10], [1095.2], [$-$0.01], [7001], [$-$0.6], [$-$0.01],
  )]
  , caption: [The five CAD channels against their design: dimensions
  read from the STL files on the same levels and lines as the software
  reads them (widths at 90, 50 and 10 % of the 300~μm depth across the
  middle of the channel, length at the floor level on the centre line,
  $10^compose$ walls), and the error of the extracted value (extracted
  $-$ design), in μm unless stated.]
  , kind: table
  ) <tab:s1_cad>
]
#block[
#figure(
  align(center)[#table(
    columns: 8,
    align: (left,right,center,center,center,center,center,center,),
    [Synthetic
    channels], [Cases], [Floor], [Mid-depth], [Opening], [Wall], [Floor], [Length],
    [], [], [width], [width], [width], [angle
    ($""^compose$)], [corner], [],
    [Sharp corners, walls $5$--$30^compose$], [90], [$-$0.5 (3.2)], [0.2
    (1.2)], [0.0 (1.6)], [$-$0.02 (0.26)], [0.3 (2.2)], [$-$2.5 (6.8)],
    [Sharp corners, walls $1$--$3^compose$], [45], [$-$2.5 (4.5)], [0.0
    (2.2)], [2.8 (5.8)], [0.37 (0.91)], [0.5 (1.3)], [$-$5.1 (9.3)],
    [Fillets $lt.eq$ 200~μm, clear of the 25--75 % band], [44], [$-$0.4
    (2.1)], [$-$0.2 (1.0)], [0.4 (2.0)], [$-$0.04 (0.25)], [0.4
    (1.3)], [$-$2.7 (5.1)],
    [Fillets reaching into the 25--75 % band], [16], [$-$0.4
    (2.7)], [$-$0.2 (1.1)], [0.2 (1.3)], [4.35 (11.74)], [$-$13.0
    (35.3)], [$-$3.2 (4.6)],
    [Texture, SD $1$--5~μm], [60], [$-$0.9 (2.2)], [0.2 (1.0)], [0.1
    (0.3)], [$-$0.14 (0.25)], [0.9 (1.6)], [$-$2.2 (10.0)],
    [Random wall dropout $10$--$75 thin %$], [24], [$-$1.1 (1.9)], [0.1
    (0.9)], [0.2 (0.5)], [$-$0.09 (0.23)], [0.8 (1.3)], [$-$2.8 (6.2)],
    [Random wall dropout $90 thin %$], [6], [$-$2.8 (3.4)], [0.3
    (0.8)], [1.3 (1.5)], [$-$0.06 (0.14)], [1.4 (1.7)], [$-$6.0 (9.9)],
    [Wall dropout in patches, $10$--$50 thin %$], [18], [$-$0.6
    (1.3)], [0.0 (1.0)], [0.1 (0.2)], [0.03 (0.41)], [0.1
    (1.5)], [$-$2.1 (8.8)],
    [Rotation $0.5$--$15^compose$, tilt $0$--$3^compose$], [28], [$-$0.5
    (1.4)], [0.2 (0.7)], [0.1 (0.2)], [0.07 (0.25)], [0.0
    (1.2)], [$-$2.2 (4.4)],
  )]
  , caption: [Synthetic channels of known geometry (widths $100$ to
  1000~μm, 300~μm deep, rounded ends, sampled at the instrument's
  3.51~μm pitch at random sub-pitch offsets) taken through the complete
  single-surface module at the paper's settings: mean error and, in
  brackets, largest absolute error (extracted $-$ true), in μm unless
  stated. Fillets are circular floor and rim fillets on 100 and 600~μm
  channels with $5$ to $15^compose$ walls; channels whose floor fillet
  is wider than the floor are excluded (no flat floor). Texture is
  Gaussian-correlated over 12~μm.]
  , kind: table
  ) <tab:s1_synthetic>
]
#block[
#figure(
  align(center)[#table(
    columns: 7,
    align: (left,center,center,center,center,center,center,),
    table.header([Setting changed], [Floor width], [Opening
      width], [Wall angle ($""^compose$)], [Rim
      corner], [Length], [$upright(R Q)_d$],),
    table.hline(),
    [Line spacing 5~μm], [0.4], [0.5], [0.14], [0.3], [1.9], [0.0010],
    [Line spacing 20~μm], [0.5], [0.6], [0.15], [0.5], [2.3], [0.0022],
    [Gap limit 1 cell], [0.0], [0.1], [0.00], [0.0], [1.4], [0.0000],
    [Gap limit 6 cells], [0.0], [0.0], [0.00], [0.0], [0.1], [0.0000],
    [Central 60 % of the
    length], [3.8], [3.5], [0.44], [2.0], [1.0], [0.0016],
    [Central 90 % of the
    length], [1.7], [4.9], [0.25], [0.8], [0.0], [0.0027],
  )]
  , caption: [Measured scans with one grid-line setting changed from its
  default (lines 10~μm apart, gap limit 3 cells, central 80 %): largest
  absolute change over the CAD, as-printed insert and first-part scans
  of High Temp and Rigid 10K (35 surfaces), in μm unless stated, and of
  $upright(R Q)_d$ over their ten insert-to-part pairs, recomputed on
  the crops of each setting.]
  , kind: table
  ) <tab:s1_settings>
]
#block[
#figure(
  align(center)[#table(
    columns: 9,
    align: (left,right,center,center,center,center,center,center,center,),
    [Scans], [$n$], [Floor], [Mid-depth], [Opening], [Wall], [Floor], [Rim], [Length],
    [], [], [width], [width], [width], [angle
    ($""^compose$)], [corner], [corner], [],
    [CAD
    references], [5], [0.04], [0.06], [0.05], [0.01], [0.05], [0.04], [0.6],
    [HT and
    R10K], [30], [0.61], [0.22], [0.66], [0.06], [0.38], [0.25], [2.2],
    [White], [15], [1.49], [0.61], [0.81], [0.06], [0.22], [0.06], [6.5],
  )]
  , caption: [Dependence of the reported medians on the grid lines used:
  each scan read on its even and on its odd grid lines only, two
  disjoint halves; largest half-difference over the scans of the group
  (CAD, as-printed and first-shot inserts and first parts), in μm unless
  stated. This is the sampling component of the extraction, not a
  repeatability of the measurement.]
  , kind: table
  ) <tab:s1_precision>
]
= Synthetic characterisation of $upright(R Q)_d$ in full
<sec:s2>
The synthetic surfaces are those of Section~2.4 of the main text: a
trapezoidal channel 300~μm deep with a 600~μm floor and a $10^compose$
draft on a $4 times 2$~mm field sampled at 5~μm, with a band-limited
random microtexture of 3~μm standard deviation and about 12~μm
correlation length. A degraded copy is compared with the undegraded
reference through the production pipeline. The degradation operators
are: wall smoothing (Gaussian rounding of the cross-section profile of
scale $sigma$, texture intact); global smoothing (isotropic Gaussian
blur of the whole textured field); depth fill (depth reduced at fixed
opening width); positive amplitude scaling of the whole height field;
additive Gaussian noise; a single localised Gaussian feature on the
channel rim; and a textured field with the channel removed. Rigid
translations and rotations are imposed on the point coordinates and
passed through the production registration.

#heading(level: 2, numbering: none)[Smoothing sweeps]
<smoothing-sweeps>
Table~@tab:s2_smoothing gives the full sweeps of Fig.~5(e,f) of the main
text with the across-channel component added. $upright(R Q)_(d y)$ falls
with $upright(R Q)_d$ throughout, which is the synthetic form of the
wall dominance measured on the real channels. Wall and global smoothing
agree within $0.015$ up to 100~μm; above it the global blur, which also
removes the microtexture, decays more slowly, because the intact texture
of the wall-smoothed surface competes with its weakened walls in the
gradient map.

#block[
#figure(
  align(center)[#table(
    columns: 6,
    align: (right,center,center,center,center,center,),
    table.header([$sigma$
      (μm)], table.cell(align: center, colspan: 3)[Wall
      smoothing], table.cell(align: center, colspan: 2)[Global
      smoothing],),
    table.hline(),
    [2-4\(lr)5-6], [$upright(R Q)$], [$upright(R Q)_d$], [$upright(R Q)_(d y)$], [$upright(R Q)_d$], [$upright(R Q)$],
    [0], [1.000], [1.000], [1.000], [1.000], [1.000],
    [10], [0.998], [0.993], [0.994], [0.992], [0.998],
    [20], [0.983], [0.970], [0.971], [0.965], [0.982],
    [30], [0.951], [0.926], [0.929], [0.917], [0.950],
    [40], [0.911], [0.872], [0.878], [0.860], [0.909],
    [50], [0.870], [0.818], [0.829], [0.805], [0.868],
    [60], [0.831], [0.768], [0.784], [0.754], [0.830],
    [80], [0.764], [0.683], [0.710], [0.671], [0.763],
    [100], [0.712], [0.612], [0.651], [0.609], [0.711],
    [120], [0.672], [0.551], [0.605], [0.560], [0.671],
    [140], [0.643], [0.497], [0.568], [0.521], [0.642],
    [160], [0.623], [0.451], [0.541], [0.490], [0.622],
    [180], [0.611], [0.413], [0.523], [0.466], [0.610],
    [200], [0.604], [0.384], [0.511], [0.452], [0.603],
  )]
  , caption: [Smoothing sweeps on the synthetic channel: Gaussian
  rounding of the cross-section profile (wall smoothing) and isotropic
  Gaussian blur of the whole textured field (global smoothing), both of
  scale $sigma$.]
  , kind: table
  ) <tab:s2_smoothing>
]
#heading(level: 2, numbering: none)[Depth fill, noise and amplitude
scaling]
<depth-fill-noise-and-amplitude-scaling>
Table~@tab:s2_other gives the depth-fill and noise sweeps of Fig.~5(g)
with the height correlation alongside, and the amplitude-scaling check.
Both correlations are blind to a uniform loss of depth, because both are
amplitude-invariant, and the depth must be read from the extracted
dimensions. Their fall at the largest losses comes from the
channel-interior mask, which shrinks once the filled channel is barely
deeper than the mask level (to about $6 thin %$ of its cells at
$90 thin %$). Under positive amplitude scaling both correlations stay
exactly at $1$ while the mean gradient error grows with the scale
factor, which confirms that absolute-amplitude information resides in
the error maps and dimensions, not in the correlations.

#block[
#figure(
  align(center)[#table(
    columns: 4,
    align: (left,right,center,center,),
    table.header([Degradation], [Amount], [$upright(R Q)_d$], [$upright(R Q)$],),
    table.hline(),
    [Depth lost (%)], [0], [1.000], [1.000],
    [Depth lost (%)], [10], [1.000], [1.000],
    [Depth lost (%)], [20], [1.000], [1.000],
    [Depth lost (%)], [30], [1.000], [1.000],
    [Depth lost (%)], [40], [0.999], [0.999],
    [Depth lost (%)], [50], [0.998], [0.998],
    [Depth lost (%)], [60], [0.994], [0.993],
    [Depth lost (%)], [65], [0.991], [0.987],
    [Depth lost (%)], [70], [0.984], [0.975],
    [Depth lost (%)], [75], [0.970], [0.946],
    [Depth lost (%)], [80], [0.932], [0.853],
    [Depth lost (%)], [85], [0.786], [0.619],
    [Depth lost (%)], [90], [0.425], [0.495],
    [Noise SD (μm)], [0], [1.000], [1.000],
    [Noise SD (μm)], [5], [0.997], [1.000],
    [Noise SD (μm)], [10], [0.989], [0.998],
    [Noise SD (μm)], [20], [0.957], [0.993],
    [Noise SD (μm)], [30], [0.900], [0.984],
    [Noise SD (μm)], [40], [0.822], [0.971],
    [Noise SD (μm)], [50], [0.731], [0.955],
    [Noise SD (μm)], [60], [0.637], [0.935],
    [Noise SD (μm)], [70], [0.548], [0.913],
    [Noise SD (μm)], [80], [0.470], [0.888],
    [Amplitude factor], [0.5], [1.000], [1.000],
    [Amplitude factor], [0.8], [1.000], [1.000],
    [Amplitude factor], [1.25], [1.000], [1.000],
    [Amplitude factor], [2], [1.000], [1.000],
    [Amplitude factor], [5], [1.000], [1.000],
  )]
  , caption: [Depth fill at fixed opening width, added Gaussian noise,
  and positive amplitude scaling of the whole height field.]
  , kind: table
  ) <tab:s2_other>
]
#heading(level: 2, numbering: none)[Gradient-energy decomposition]
<gradient-energy-decomposition>
On the reference surface the sidewalls occupy about $5 thin %$ of the
analysed cells but carry about $94 thin %$ of the squared gradient
magnitude over the whole field and about $97 thin %$ within the
channel-interior mask; the floor contributes $2$ to $3 thin %$ and the
field the remainder. The geometry-only wall energy exceeds the
textured-floor energy by a factor of about 39. This is the origin of the
wall dominance that makes $upright(R Q)_d$ track $upright(R Q)_(d y)$
for these channels.

#heading(level: 2, numbering: none)[Seed robustness]
<seed-robustness>
Table~@tab:s2_seeds repeats selected severities over 25 microtexture
seeds, the reference and the degraded surface sharing the seed. The
spread is far below the differences between adjacent severity levels, so
the monotonic trends are not single-seed artefacts. These intervals
describe the sensitivity to the artificial texture realisation, not
experimental uncertainty. The flat-field anchor of the main text, two
fields with the channel removed and independent textures, is a separate
test over 30 seeds and returns $- 0.001 plus.minus 0.009$.

#block[
#figure(
  align(center)[#table(
    columns: 6,
    align: (left,right,center,center,center,center,),
    table.header([Degradation], [Amount], [Mean], [SD], [Min], [Max],),
    table.hline(),
    [Noise SD (μm)], [20], [0.956], [0.000], [0.955], [0.958],
    [Noise SD (μm)], [40], [0.819], [0.002], [0.816], [0.823],
    [Wall smoothing $sigma$
    (μm)], [40], [0.871], [0.002], [0.868], [0.875],
    [Wall smoothing $sigma$
    (μm)], [80], [0.682], [0.004], [0.677], [0.691],
    [Wall smoothing $sigma$
    (μm)], [200], [0.385], [0.010], [0.370], [0.404],
  )]
  , caption: [Seed robustness: $upright(R Q)_d$ over 25 microtexture
  seeds (reference and degraded surface share the seed).]
  , kind: table
  ) <tab:s2_seeds>
]
#heading(level: 2, numbering: none)[Registration bias]
<registration-bias>
Uncorrected rigid misalignment strongly reduces $upright(R Q)_d$: an
across-channel shift of 20~μm gives $0.72$ and one of 50~μm a slightly
negative value; a $1^compose$ rotation gives $0.77$ and $2^compose$
gives $0.45$. When both surfaces are passed through the production
registration the imposed transformations are removed almost completely:
translations and rotations both recover to $upright(R Q)_d = 1.000$.
Table~@tab:s2_registration summarises the residual bias over 19 imposed
transforms (translations up to 100~μm along and across the channel,
rotations of $0.1^compose$ to $2^compose$) for five degradation states.
The bias is at most $0.002$, with no registration failure; a small
rotation residual of the severe case, largest at $2^compose$, is the
largest term. The severe-case baseline here ($0.385$) differs slightly
from the $0.384$ of the canonical sweep because the registration test
routes each surface through the full point-cloud path (voxel
downsampling, cropping and re-gridding) whereas the canonical sweep
evaluates the metric directly on the generated grid.

#block[
#figure(
  align(center)[#table(
    columns: 5,
    align: (left,center,center,center,center,),
    table.header([Degradation state], [Aligned baseline], [Mean
      bias], [Max $\|$bias$\|$], [$\|$bias$\| < 0.02$],),
    table.hline(),
    [identical], [1.000], [$0.000$], [0.000], [19/19],
    [moderate ($sigma = 80$)], [0.683], [$0.000$], [0.000], [19/19],
    [severe ($sigma = 200$)], [0.385], [$0.000$], [0.002], [19/19],
    [global smoothing], [0.754], [$0.000$], [0.000], [19/19],
    [independent texture], [0.996], [$0.000$], [0.000], [19/19],
  )]
  , caption: [Post-registration bias of $upright(R Q)_d$ over 19 imposed
  rigid transforms.]
  , kind: table
  ) <tab:s2_registration>
]
#heading(level: 2, numbering: none)[Localised-defect detection limit]
<localised-defect-detection-limit>
A single Gaussian feature was swept in amplitude and width. Even the
largest tested, 250~μm in amplitude and 400~μm wide, changed
$upright(R Q)_d$ by less than $0.003$, and none moved it by $0.01$,
whereas the maximum of $E_d$ scaled with the amplitude. Localised damage
occupying a small fraction of the area is diluted in the global scalar
and must be read from the error maps, which is the division of labour
used in Section~3.3 of the main text.

#heading(level: 2, numbering: none)[Channel width and normalisation]
<channel-width-and-normalisation>
For channels of $100$, $200$, $300$, $600$ and 1000~μm floor width at
fixed depth and draft, the wall-smoothing curves nearly collapse against
the absolute smoothing scale but not against the scale normalised by
floor width: the mean standard deviation across widths is $0.008$ for
the absolute scale and $0.192$ for the width-normalised scale. Because
the walls are geometrically identical across widths, a given absolute
smoothing costs a similar $upright(R Q)_d$ regardless of floor width,
even though it removes a larger fraction of a narrow channel;
proportional severity must be read from the dimensional measurements.

#heading(level: 2, numbering: none)[Directional components]
<directional-components>
In synthetic cases with a shared texture, across-channel defects load
onto $upright(R Q)_(d y)$ while $upright(R Q)_(d x)$ stays near unity,
and along-channel or floor perturbations load onto $upright(R Q)_(d x)$.
In the experimental comparisons the same wall dominance appears:
$upright(R Q)_(d y)$ tracks $upright(R Q)_d$ with a correlation of
$0.97$, while $upright(R Q)_(d x)$ is systematically low and remains low
even for the same insert measured before and after a shot, because fine
floor texture does not reproduce between independent measurements.
$upright(R Q)_(d x)$ therefore carries a relative trend but its absolute
value is not a floor-fidelity score.

#heading(level: 2, numbering: none)[Equivalent smoothing scales]
<equivalent-smoothing-scales>
Because the wall-smoothing response is monotonic, a measured
$upright(R Q)_d$ can be read back as an equivalent Gaussian smoothing
scale of the synthetic channel. For the first-shot resin means of the
main text this gives about 40~μm for High Temp ($upright(R Q)_d = 0.87$)
and about 52~μm for Rigid~10K ($0.81$); the White value ($0.28$) lies
below the range of the pure wall-smoothing sweep, indicating a more
severe loss of correspondence or additional deformation modes. These are
metric-equivalent severities under the chosen synthetic geometry and
settings, not physical rounding radii.

= The fifteen insert-to-part comparisons
<sec:s3>
Table~@tab:s3_pairs lists every pair behind Fig.~6 and Table~3 of the
main text.

#block[
#figure(
  align(center)[#table(
    columns: 9,
    align: (left,right,center,center,center,center,center,center,center,),
    [Resin], [Width], [$upright(R Q)$], [$upright(R Q)_(d x)$], [$upright(R Q)_(d y)$], [$upright(R Q)_d$], [$f_y$], [Valid], [$overline(\| E_Z \|)$],
    [], [\(μm)], [], [], [], [], [], [\(%)], [\(μm)],
    [High
    Temp], [100], [0.957], [0.560], [0.867], [0.815], [0.982], [100], [7.5],
    [High
    Temp], [200], [0.966], [0.614], [0.906], [0.880], [0.984], [100], [5.7],
    [High
    Temp], [300], [0.975], [0.587], [0.919], [0.895], [0.983], [100], [4.7],
    [High
    Temp], [600], [0.977], [0.764], [0.921], [0.911], [0.983], [100], [4.5],
    [High
    Temp], [1000], [0.970], [0.747], [0.881], [0.870], [0.982], [100], [5.9],
    [Rigid
    10K], [100], [0.980], [0.577], [0.903], [0.825], [0.990], [100], [11.0],
    [Rigid
    10K], [200], [0.990], [0.679], [0.926], [0.883], [0.989], [100], [9.5],
    [Rigid
    10K], [300], [0.982], [0.594], [0.888], [0.843], [0.988], [100], [10.3],
    [Rigid
    10K], [600], [0.972], [0.592], [0.779], [0.723], [0.974], [100], [11.3],
    [Rigid
    10K], [1000], [0.983], [0.688], [0.821], [0.779], [0.962], [100], [10.7],
    [White], [100], [0.535], [0.133], [0.581], [0.390], [0.969], [71], [60.8],
    [White], [200], [0.453], [0.182], [0.328], [0.173], [0.922], [66], [66.1],
    [White], [300], [0.467], [-0.041], [0.458], [0.304], [0.931], [68], [64.8],
    [White], [600], [0.428], [0.244], [0.229], [0.258], [0.892], [82], [40.9],
    [White], [1000], [0.435], [0.284], [0.203], [0.266], [0.864], [88], [28.0],
  )]
  , caption: [The fifteen insert-to-part comparisons (first moulded part
  against its as-printed insert, channel-interior mask, 5~μm grid): the
  four correlations, the wall-dominance ratio $f_y$, the fraction of
  grid cells valid on both surfaces and the mean absolute height error.]
  , kind: table
  ) <tab:s3_pairs>
]
= Channel geometry through the chain
<sec:s4>
Table~@tab:s4_dimensions extends the floor widths and depths plotted in
Fig.~9 of the main text to the opening width, the wall angle and the
corner rounding of every CAD reference, as-printed insert and first
moulded part.

#block[
#figure(
  align(center)[#table(
    columns: 9,
    align: (right,left,center,center,center,center,center,center,center,),
    table.header([Nom.], [Quantity], [CAD], table.cell(align: center, colspan: 2)[High
      Temp], table.cell(align: center, colspan: 2)[Rigid
      10K], table.cell(align: center, colspan: 2)[White],),
    table.hline(),
    [4-5\(lr)6-7\(lr)8-9
    (μm)], [], [], [Insert], [Part], [Insert], [Part], [Insert], [Part],
    [100], [floor
    width], [111], [195], [200], [171], [166], [213], [192],
    [], [opening
    width], [195], [312], [307], [315], [338], [273], [211],
    [], [depth], [300], [293], [294], [274], [269], [311], [309],
    [], [wall angle
    ($""^compose$)], [10.0], [6.3], [5.7], [14.3], [12.8], [$< 3$], [$< 3$],
    [], [floor corner], [0], [17], [22], [14], [14], [14], [1],
    [], [rim corner], [0], [14], [4], [5], [26], [0], [0],
    [], [floor width], [211], [263], [266], [241], [236], [269], [212],
    [], [opening
    width], [295], [391], [390], [396], [426], [319], [228],
    [], [depth], [300], [302], [303], [291], [287], [310], [307],
    [], [wall angle
    ($""^compose$)], [10.0], [6.3], [5.8], [12.8], [12.6], [$< 3$], [$< 3$],
    [], [floor corner], [0], [23], [27], [22], [19], [13], [0],
    [], [rim corner], [0], [11], [7], [4], [24], [0], [0],
    [], [floor width], [311], [337], [341], [317], [311], [354], [276],
    [], [opening
    width], [395], [475], [477], [478], [515], [397], [289],
    [], [depth], [300], [302], [303], [295], [290], [308], [301],
    [], [wall angle
    ($""^compose$)], [10.0], [6.6], [6.7], [10.8], [11.5], [$< 3$], [$< 3$],
    [], [floor corner], [0], [27], [28], [30], [26], [10], [0],
    [], [rim corner], [0], [10], [7], [6], [31], [0], [0],
    [], [floor width], [610], [641], [646], [612], [606], [656], [585],
    [], [opening
    width], [695], [773], [772], [757], [814], [689], [601],
    [], [depth], [300], [299], [300], [297], [291], [301], [298],
    [], [wall angle
    ($""^compose$)], [10.0], [6.8], [6.4], [10.3], [11.8], [$< 3$], [$< 3$],
    [], [floor corner], [0], [23], [24], [26], [20], [4], [0],
    [], [rim corner], [0], [12], [9], [4], [35], [0], [0],
    [], [floor
    width], [1011], [1047], [1050], [985], [981], [1056], [981],
    [], [opening
    width], [1095], [1175], [1177], [1156], [1223], [1088], [1002],
    [], [depth], [300], [298], [302], [303], [296], [297], [300],
    [], [wall angle
    ($""^compose$)], [10.0], [9.9], [8.4], [11.4], [13.4], [$< 3$], [$< 3$],
    [], [floor corner], [0], [19], [23], [32], [25], [4], [0],
    [], [rim corner], [0], [2], [3], [3], [34], [0], [0],
  )]
  , caption: [Extracted channel geometry through the fabrication chain
  for the CAD reference, the as-printed insert and its first moulded
  part: floor and opening widths, depth, and floor- and rim-corner
  rounding in μm, wall angle in degrees from the vertical ($< 3$: within
  $3^compose$ of the vertical, below the resolution of the grid lines).]
  , kind: table
  ) <tab:s4_dimensions>
]
= Areal roughness by channel
<sec:s5>
Table~@tab:s5_roughness gives the per-channel roughness behind Table~4
of the main text.

#block[
#figure(
  align(center)[#table(
    columns: 9,
    align: (left,right,center,center,center,center,center,center,center,),
    table.header([Resin], [Width], table.cell(align: center, colspan: 3)[Insert
      floor], table.cell(align: center, colspan: 3)[Part floor], [Insert
      field],),
    table.hline(),
    [3-5\(lr)6-8\(lr)9-9], [\(μm)], [$S_a$], [$S_q$], [$S_z$], [$S_a$], [$S_q$], [$S_z$], [$S_a$],
    [High
    Temp], [100], [3.08], [3.80], [23.0], [2.74], [3.42], [20.9], [2.51],
    [High
    Temp], [200], [2.85], [3.42], [19.6], [2.55], [3.11], [18.6], [2.33],
    [High
    Temp], [300], [2.61], [3.22], [19.2], [2.34], [2.92], [23.7], [2.29],
    [High
    Temp], [600], [2.63], [3.25], [24.6], [2.27], [2.82], [21.5], [2.40],
    [High
    Temp], [1000], [2.29], [2.81], [21.1], [1.85], [2.30], [18.1], [2.10],
    [Rigid
    10K], [100], [3.82], [4.66], [25.6], [3.47], [4.24], [23.8], [4.77],
    [Rigid
    10K], [200], [2.64], [3.29], [28.0], [2.91], [3.53], [19.7], [4.13],
    [Rigid
    10K], [300], [2.62], [3.27], [28.4], [2.73], [3.34], [23.0], [4.45],
    [Rigid
    10K], [600], [2.93], [3.70], [27.6], [3.22], [3.88], [21.1], [4.12],
    [Rigid
    10K], [1000], [4.59], [5.93], [41.0], [4.45], [5.58], [38.1], [4.44],
    [White], [100], [3.62], [4.40], [24.9], [3.36], [4.05], [21.8], [3.65],
    [White], [200], [3.69], [4.53], [26.4], [3.42], [4.23], [28.3], [3.36],
    [White], [300], [2.99], [3.67], [22.4], [3.12], [4.06], [29.3], [3.37],
    [White], [600], [2.81], [3.51], [25.4], [2.78], [3.51], [31.9], [3.15],
    [White], [1000], [3.01], [3.73], [29.3], [3.82], [5.51], [110.4], [3.23],
  )]
  , caption: [Areal roughness (μm, ISO 25178-2) of the channel floor of
  every as-printed insert and its first moulded part, and of the insert
  field (mean of the two field strips).]
  , kind: table
  ) <tab:s5_roughness>
]
= Insert degradation by channel width
<sec:s6>
Tables~@tab:s6_lifetime_HT and @tab:s6_lifetime_R10K give, for every
width and shot, the numbers averaged in Fig.~8 of the main text. The
White insert reached end of life within five shots and is omitted.

#block[
#figure(
  align(center)[#table(
    columns: 11,
    align: (right,right,center,center,center,center,center,center,center,center,center,),
    [Width], [Shot], [$upright(R Q)_d$], [$upright(R Q)_(d y)$], [$upright(R Q)$], [Wall], [Floor], [Depth], [$S_a$], [$S_z$], [],
    [\(μm)], [], table.cell(align: center, colspan: 3)[shot 0 $arrow.r$
    shot
    $N$], [\($""^compose$)], [\(μm)], [\(μm)], [\(μm)], [\(μm)], [],
    [100], [0], [--], [--], [--], [6.3], [195], [293], [3.08], [23], [],
    [], [1], [0.860], [0.903], [0.970], [11.7], [196], [294], [3.12], [21], [],
    [], [5], [0.870], [0.912], [0.972], [13.2], [192], [293], [3.15], [21], [],
    [], [10], [0.867], [0.909], [0.970], [13.6], [194], [292], [3.12], [22], [],
    [], [20], [0.856], [0.902], [0.960], [11.8], [197], [292], [3.14], [22], [],
    [200], [0], [--], [--], [--], [6.3], [263], [302], [2.85], [20], [],
    [], [1], [0.875], [0.906], [0.973], [12.5], [264], [303], [2.86], [18], [],
    [], [5], [0.862], [0.896], [0.966], [13.7], [261], [301], [2.98], [19], [],
    [], [10], [0.875], [0.905], [0.974], [12.8], [261], [300], [2.98], [19], [],
    [], [20], [0.874], [0.906], [0.968], [11.7], [259], [301], [2.93], [20], [],
    [300], [0], [--], [--], [--], [6.6], [337], [302], [2.61], [19], [],
    [], [1], [0.877], [0.903], [0.974], [13.0], [339], [303], [2.61], [20], [],
    [], [5], [0.862], [0.878], [0.949], [13.1], [339], [301], [2.70], [32], [],
    [], [10], [0.879], [0.905], [0.975], [12.7], [337], [295], [2.71], [20], [],
    [], [20], [0.885], [0.911], [0.974], [11.6], [337], [300], [2.63], [22], [],
    [600], [0], [--], [--], [--], [6.8], [641], [299], [2.63], [25], [],
    [], [1], [0.896], [0.911], [0.979], [13.3], [645], [299], [2.57], [23], [],
    [], [5], [0.883], [0.899], [0.977], [13.8], [644], [296], [2.61], [23], [],
    [], [10], [0.881], [0.897], [0.975], [14.2], [642], [289], [2.65], [24], [],
    [], [20], [0.896], [0.911], [0.977], [13.1], [641], [290], [2.82], [53], [],
    [1000], [0], [--], [--], [--], [9.9], [1047], [298], [2.29], [21], [],
    [], [1], [0.902], [0.917], [0.980], [12.8], [1049], [299], [2.21], [20], [],
    [], [5], [0.882], [0.898], [0.976], [14.7], [1048], [298], [2.30], [21], [],
    [], [10], [0.886], [0.898], [0.980], [12.8], [1046], [296], [2.26], [20], [],
    [], [20], [0.893], [0.905], [0.981], [12.1], [1045], [296], [2.31], [21], [],
  )]
  , caption: [High Temp insert over the moulding run, by channel width:
  correlations between the shot-0 scan and the scan at shot $N$, and the
  geometry and floor roughness of each scan.]
  , kind: table
  ) <tab:s6_lifetime_HT>
]
#block[
#figure(
  align(center)[#table(
    columns: 11,
    align: (right,right,center,center,center,center,center,center,center,center,center,),
    [Width], [Shot], [$upright(R Q)_d$], [$upright(R Q)_(d y)$], [$upright(R Q)$], [Wall], [Floor], [Depth], [$S_a$], [$S_z$], [],
    [\(μm)], [], table.cell(align: center, colspan: 3)[shot 0 $arrow.r$
    shot
    $N$], [\($""^compose$)], [\(μm)], [\(μm)], [\(μm)], [\(μm)], [],
    [100], [0], [--], [--], [--], [14.3], [171], [274], [3.82], [26], [],
    [], [1], [0.890], [0.937], [0.983], [12.2], [169], [275], [3.88], [27], [],
    [], [5], [0.809], [0.897], [0.903], [14.4], [156], [271], [4.97], [47], [],
    [], [10], [0.777], [0.881], [0.904], [16.6], [150], [264], [4.09], [36], [],
    [], [20], [0.724], [0.855], [0.885], [20.4], [140], [239], [9.00], [59], [],
    [200], [0], [--], [--], [--], [12.8], [241], [291], [2.64], [28], [],
    [], [1], [0.915], [0.946], [0.992], [11.7], [240], [292], [2.91], [22], [],
    [], [5], [0.890], [0.930], [0.987], [14.4], [226], [289], [3.80], [31], [],
    [], [10], [0.836], [0.897], [0.969], [16.7], [218], [281], [3.35], [42], [],
    [], [20], [0.732], [0.834], [0.940], [19.9], [178], [264], [7.06], [57], [],
    [300], [0], [--], [--], [--], [10.8], [317], [295], [2.62], [28], [],
    [], [1], [0.900], [0.928], [0.986], [9.7], [316], [296], [2.76], [24], [],
    [], [5], [0.859], [0.900], [0.980], [12.9], [309], [291], [3.12], [29], [],
    [], [10], [0.767], [0.834], [0.952], [14.7], [300], [286], [2.95], [27], [],
    [], [20], [0.644], [0.751], [0.928], [18.4], [262], [283], [7.29], [71], [],
    [600], [0], [--], [--], [--], [10.3], [612], [297], [2.93], [28], [],
    [], [1], [0.868], [0.891], [0.982], [10.4], [612], [295], [3.38], [23], [],
    [], [5], [0.869], [0.893], [0.971], [12.3], [603], [291], [3.10], [25], [],
    [], [10], [0.799], [0.838], [0.962], [14.3], [594], [287], [2.70], [24], [],
    [], [20], [0.679], [0.744], [0.945], [17.5], [571], [278], [2.21], [29], [],
    [1000], [0], [--], [--], [--], [11.4], [985], [303], [4.59], [41], [],
    [], [1], [0.919], [0.932], [0.990], [11.5], [987], [301], [4.63], [41], [],
    [], [5], [0.908], [0.924], [0.986], [12.3], [978], [297], [4.72], [39], [],
    [], [10], [0.885], [0.906], [0.981], [13.9], [977], [294], [4.42], [36], [],
    [], [20], [0.818], [0.854], [0.968], [16.8], [969], [284], [3.46], [31], [],
  )]
  , caption: [Rigid 10K insert over the moulding run, by channel width:
  correlations between the shot-0 scan and the scan at shot $N$, and the
  geometry and floor roughness of each scan.]
  , kind: table
  ) <tab:s6_lifetime_R10K>
]
Table~@tab:s6_first_shot follows the wall shape through the first shots.
In the first shot the High Temp walls straightened and tilted: the wall
angle rose by $3^compose$ to $6.5^compose$, the floor- and rim-corner
rounding fell by $2$ to 14~μm and the opening widened by $5$ to 12~μm,
while the floor width changed by less than 5~μm and the depth by at most
1~μm. The part moulded in that shot, scanned in the same session as the
changed insert, keeps the as-printed shape, and the later parts follow
the changed insert, so the change is a change of the insert and not of
the measurement. The Rigid 10K inserts show no such step; their wall
angle grows steadily with the drift, and the rim of their first parts is
rounded by about 30~μm, a rounding the later parts do not show.
Table~@tab:s6_same_state compares each insert with itself between any
two shots. For High Temp every comparison with shot $0$ reads $0.87$ to
$0.88$ and every comparison among the later states $0.92$ to $0.95$\;
for Rigid 10K the values fall with the number of shots between the
scans.

#block[
#figure(
  align(center)[#table(
    columns: 8,
    align: (left,left,center,center,center,center,center,center,),
    table.header([Resin], [Quantity], [Insert 0], [Insert 1], [Part
      1], [Insert 5], [Part 5], [Insert 20],),
    table.hline(),
    [High Temp], [wall angle
    ($""^compose$)], [7.2 $plus.minus$ 1.5], [12.7 $plus.minus$ 0.6], [6.6 $plus.minus$ 1.1], [13.7 $plus.minus$ 0.6], [11.3 $plus.minus$ 0.5], [12.1 $plus.minus$ 0.6],
    [], [floor
    corner], [22 $plus.minus$ 4], [13 $plus.minus$ 3], [25 $plus.minus$ 2], [10 $plus.minus$ 5], [17 $plus.minus$ 2], [16 $plus.minus$ 5],
    [], [rim
    corner], [10 $plus.minus$ 4], [0 $plus.minus$ 0], [6 $plus.minus$ 3], [0 $plus.minus$ 0], [1 $plus.minus$ 0], [0 $plus.minus$ 0],
    [], [floor width
    change], [0 $plus.minus$ 0], [2 $plus.minus$ 1], [4 $plus.minus$ 1], [1 $plus.minus$ 3], [3 $plus.minus$ 1], [0 $plus.minus$ 2],
    [], [opening width
    change], [0 $plus.minus$ 0], [8 $plus.minus$ 3], [$-$1 $plus.minus$ 3], [12 $plus.minus$ 2], [5 $plus.minus$ 3], [4 $plus.minus$ 2],
    [Rigid 10K], [wall angle
    ($""^compose$)], [11.9 $plus.minus$ 1.6], [11.1 $plus.minus$ 1.0], [12.4 $plus.minus$ 0.8], [13.3 $plus.minus$ 1.1], [14.3 $plus.minus$ 1.0], [18.6 $plus.minus$ 1.5],
    [], [floor
    corner], [25 $plus.minus$ 7], [25 $plus.minus$ 6], [21 $plus.minus$ 5], [23 $plus.minus$ 6], [19 $plus.minus$ 6], [17 $plus.minus$ 4],
    [], [rim
    corner], [4 $plus.minus$ 1], [7 $plus.minus$ 2], [30 $plus.minus$ 5], [5 $plus.minus$ 1], [7 $plus.minus$ 5], [6 $plus.minus$ 2],
    [], [floor width
    change], [0 $plus.minus$ 0], [0 $plus.minus$ 2], [$-$5 $plus.minus$ 1], [$-$11 $plus.minus$ 4], [$-$15 $plus.minus$ 4], [$-$41 $plus.minus$ 19],
    [], [opening width
    change], [0 $plus.minus$ 0], [1 $plus.minus$ 3], [43 $plus.minus$ 19], [0 $plus.minus$ 4], [$-$1 $plus.minus$ 10], [$-$1 $plus.minus$ 4],
  )]
  , caption: [Wall shape of the High Temp and Rigid 10K inserts and
  their parts through the first shots, mean $plus.minus$ standard
  deviation over the five channel widths; corner rounding and the width
  changes, taken per width against Insert 0, in μm. Part 1 was moulded
  in the first shot and scanned with Insert 1; Part 5 was moulded in the
  fifth shot.]
  , kind: table
  ) <tab:s6_first_shot>
]
#block[
#figure(
  align(center)[#table(
    columns: 6,
    align: (left,right,center,center,center,center,),
    table.header([Resin], [From
      shot], table.cell(align: center, colspan: 4)[To shot],),
    table.hline(),
    [3-6], [], [1], [5], [10], [20],
    [High Temp], [0], [0.882], [0.872], [0.877], [0.881],
    [], [1], [], [0.942], [0.938], [0.925],
    [], [5], [], [], [0.947], [0.924],
    [], [10], [], [], [], [0.930],
    [Rigid 10K], [0], [0.898], [0.867], [0.813], [0.720],
    [], [1], [], [0.907], [0.858], [0.749],
    [], [5], [], [], [0.914], [0.815],
    [], [10], [], [], [], [0.890],
  )]
  , caption: [Each insert compared with itself: $upright(R Q)_d$ between
  its scans after two different shots, mean over the five widths. The
  first row of each resin is the tool-degradation trajectory of Fig.~8
  of the main text.]
  , kind: table
  ) <tab:s6_same_state>
]
= Benchmark per pair
<sec:s7>
Tables~@tab:s7_bench_pairs to @tab:s7_bench_drift give the individual
values summarised in Table~5 of the main text. The White pairs show the
unbounded behaviour of the NIST difference: their part surfaces differ
from the insert by more than the insert's own relief inside the mask, so
$D_s$ exceeds one and $1 - D_s$ becomes strongly negative.

The pointwise gradient-magnitude similarity of Xue et al.~(reference 35
of the main text) is evaluated at every cell $k$ of the channel-interior
mask as
$ upright(G M S)_k = frac(2 thin G_(A \, k) thin G_(B \, k) + c, G_(A \, k)^2 + G_(B \, k)^2 + c) \, $
where $G_(A \, k)$ and $G_(B \, k)$ are the gradient magnitudes
$\| nabla Z \|$ of the two surfaces, from the same central differences
as $upright(R Q)_d$, and $c = 0.0026$ on heights scaled jointly to
$\[ 0 \, 1 \]$. GMSD is the standard deviation of $upright(G M S)_k$
over the mask and GMSM its mean.

#block[
#figure(
  align(center)[#table(
    columns: 8,
    align: (left,right,center,center,center,center,center,center,),
    table.header([Resin], [Width
      (μm)], [$upright(R Q)$], [$upright(R Q)_d$], [$1 - D_s$], [SSIM], [GMSD], [GMSM],),
    table.hline(),
    [High
    Temp], [100], [0.957], [0.815], [0.90], [0.949], [0.081], [0.969],
    [High
    Temp], [200], [0.966], [0.880], [0.93], [0.969], [0.061], [0.982],
    [High
    Temp], [300], [0.975], [0.895], [0.95], [0.978], [0.048], [0.988],
    [High
    Temp], [600], [0.977], [0.911], [0.95], [0.985], [0.035], [0.992],
    [High
    Temp], [1000], [0.970], [0.870], [0.94], [0.985], [0.039], [0.992],
    [Rigid
    10K], [100], [0.980], [0.825], [0.92], [0.946], [0.058], [0.975],
    [Rigid
    10K], [200], [0.990], [0.883], [0.96], [0.971], [0.041], [0.986],
    [Rigid
    10K], [300], [0.982], [0.843], [0.93], [0.967], [0.056], [0.983],
    [Rigid
    10K], [600], [0.972], [0.723], [0.89], [0.963], [0.074], [0.981],
    [Rigid
    10K], [1000], [0.983], [0.779], [0.94], [0.970], [0.053], [0.988],
    [White], [100], [0.535], [0.390], [$-$6.45], [0.745], [0.270], [0.880],
    [White], [200], [0.453], [0.173], [$-$7.94], [0.748], [0.276], [0.876],
    [White], [300], [0.467], [0.304], [$-$42.74], [0.775], [0.272], [0.892],
    [White], [600], [0.428], [0.258], [$-$9.63], [0.872], [0.193], [0.947],
    [White], [1000], [0.435], [0.266], [$-$7.05], [0.902], [0.154], [0.963],
  )]
  , caption: [The six similarity measures of the benchmark for each of
  the fifteen insert-to-part pairs, evaluated on the same registered
  grids and channel-interior masks.]
  , kind: table
  ) <tab:s7_bench_pairs>
]
#block[
#figure(
  align(center)[#table(
    columns: 7,
    align: (right,center,center,center,center,center,center,),
    table.header([$sigma$
      (μm)], [$upright(R Q)$], [$upright(R Q)_d$], [$1 - D_s$], [SSIM], [GMSD], [GMSM],),
    table.hline(),
    [0], [1.000], [1.000], [1.00], [1.000], [0.000], [1.000],
    [10], [0.998], [0.993], [1.00], [0.994], [0.009], [0.998],
    [20], [0.983], [0.970], [0.97], [0.973], [0.028], [0.989],
    [40], [0.911], [0.872], [0.82], [0.916], [0.063], [0.966],
    [60], [0.831], [0.768], [0.65], [0.872], [0.095], [0.950],
    [80], [0.764], [0.683], [0.50], [0.845], [0.120], [0.940],
    [120], [0.672], [0.551], [0.30], [0.816], [0.152], [0.930],
    [160], [0.623], [0.451], [0.26], [0.805], [0.171], [0.925],
    [200], [0.604], [0.384], [0.30], [0.803], [0.184], [0.923],
  )]
  , caption: [The six measures along the synthetic wall-smoothing
  series.]
  , kind: table
  ) <tab:s7_bench_synthetic>
]
#block[
#figure(
  align(center)[#table(
    columns: 8,
    align: (left,right,center,center,center,center,center,center,),
    table.header([Resin], [Shot], [$upright(R Q)$], [$upright(R Q)_d$], [$1 - D_s$], [SSIM], [GMSD], [GMSM],),
    table.hline(),
    [High
    Temp], [1], [0.975], [0.882], [0.945], [0.972], [0.047], [0.984],
    [], [5], [0.968], [0.872], [0.931], [0.968], [0.052], [0.982],
    [], [10], [0.975], [0.877], [0.945], [0.971], [0.049], [0.983],
    [], [20], [0.972], [0.881], [0.938], [0.969], [0.048], [0.984],
    [Rigid
    10K], [1], [0.987], [0.898], [0.969], [0.976], [0.039], [0.989],
    [], [5], [0.965], [0.867], [0.908], [0.954], [0.042], [0.984],
    [], [10], [0.953], [0.813], [0.856], [0.932], [0.051], [0.978],
    [], [20], [0.933], [0.720], [0.709], [0.895], [0.062], [0.969],
  )]
  , caption: [The six measures between the shot-0 insert and the insert
  at shot $N$, mean over the five widths.]
  , kind: table
  ) <tab:s7_bench_drift>
]
= Sensitivity sweeps in full
<sec:s8>
Table~@tab:s8_sensitivity gives all four one-at-a-time sweeps of
Section~3.9 of the main text, and Table~@tab:s8_sensitivity_lifetime the
grid-spacing sweep on the tool-degradation trajectories.
Tables~@tab:s8_masks to @tab:s8_masks_synthetic give the robustness
check of the channel-interior region-of-interest (ROI) definition
(Section~3.9): the fifteen pairs, the tool-degradation trajectories and
a synthetic wall displacement under the default intersection mask and
under masks defined by the reference surface alone, the replica alone,
and their union. The four masks share the production threshold, grids,
orientation and valid-data mask and differ only in the geometric
combination; the intersection values reproduce the production values
exactly. For the failed White channels the reference-only region is 8 to
22 % of the combined footprint and consists of insert walls and floor
where the part surface lies at field level, which is why the
reference-defined mask returns about zero there; for HT and R10K the
disagreement is a rim band one to three cells wide plus channel ends,
and its inclusion moves $upright(R Q)_d$ by at most $0.048$.

#block[
#figure(
  align(center)[#table(
    columns: 9,
    align: (left,right,center,center,center,center,center,center,center,),
    table.header([Setting], [Value], table.cell(align: center, colspan: 3)[$upright(R Q)_d$,
      mean over
      widths], table.cell(align: center, colspan: 3)[$upright(R Q)$,
      mean over widths], [Spread],),
    table.hline(),
    [3-5\(lr)6-8], [], [HT], [R10K], [White], [HT], [R10K], [White], [HT+R10K],
    [Grid cell size $Delta$
    (μm)], [3.5], [0.810], [0.730], [0.233], [0.961], [0.977], [0.413], [0.23],
    [], [5], [0.874], [0.811], [0.278], [0.969], [0.982], [0.464], [0.19],
    [], [10], [0.958], [0.917], [0.384], [0.983], [0.988], [0.580], [0.10],
    [], [20], [0.990], [0.974], [0.582], [0.994], [0.993], [0.690], [0.03],
    [Channel-interior
    fraction], [0], [0.851], [0.742], [0.021], [0.996], [0.992], [0.627], [0.24],
    [], [0.1], [0.850], [0.757], [0.242], [0.979], [0.982], [0.474], [0.22],
    [], [0.2], [0.874], [0.811], [0.278], [0.969], [0.982], [0.464], [0.19],
    [], [0.4], [0.882], [0.884], [0.304], [0.963], [0.978], [0.425], [0.08],
    [Pre-gradient smoothing $sigma$
    (μm)], [0], [0.874], [0.811], [0.278], [0.969], [0.982], [0.464], [0.19],
    [], [5], [0.874], [0.811], [0.278], [0.969], [0.982], [0.464], [0.19],
    [], [10], [0.949], [0.903], [0.380], [0.983], [0.988], [0.585], [0.11],
    [Across-channel shift
    (μm)], [0], [0.874], [0.811], [0.278], [0.969], [0.982], [0.464], [0.19],
    [], [5], [0.854], [0.820], [0.298], [0.944], [0.973], [0.477], [0.16],
    [], [10], [0.779], [0.802], [0.297], [0.874], [0.937], [0.493], [0.14],
    [], [20], [0.506], [0.665], [0.339], [0.658], [0.796], [0.514], [0.29],
  )]
  , caption: [One-at-a-time sensitivity of the fifteen insert-to-part
  correlations to the analysis settings (defaults: grid cell size 5~μm,
  fraction 0.20, smoothing setting 0, shift 0). Spread: range of
  $upright(R Q)_d$ over the ten HT and R10K channels. The 3.5~μm rows
  are evaluated on clouds thinned to 3~μm voxels, all others on 5~μm
  voxels; the smoothing settings 0 and 5 both give
  $sigma = 5 med upright("μ") upright("m")$, the software's floor of one
  cell.]
  , kind: table
  ) <tab:s8_sensitivity>
]
#block[
#figure(
  align(center)[#table(
    columns: 6,
    align: (left,right,center,center,center,center,),
    table.header([Resin], [$Delta$ (μm)], [shot 1], [shot 5], [shot
      10], [shot 20],),
    table.hline(),
    [High Temp], [3.5], [0.824], [0.814], [0.817], [0.820],
    [], [5], [0.882], [0.872], [0.877], [0.881],
    [], [10], [0.963], [0.958], [0.963], [0.963],
    [], [20], [0.992], [0.990], [0.992], [0.991],
    [Rigid 10K], [3.5], [0.832], [0.796], [0.739], [0.647],
    [], [5], [0.898], [0.867], [0.813], [0.720],
    [], [10], [0.973], [0.952], [0.915], [0.841],
    [], [20], [0.994], [0.982], [0.963], [0.923],
  )]
  , caption: [Tool-degradation $upright(R Q)_d$ (shot 0 to shot $N$,
  mean over widths) at each grid cell size $Delta$\; the 3.5~μm rows are
  evaluated on clouds thinned to 3~μm voxels, all others on 5~μm
  voxels.]
  , kind: table
  ) <tab:s8_sensitivity_lifetime>
]
#block[
#figure(
  align(center)[#table(
    columns: 6,
    align: (left,right,center,center,center,center,),
    table.header([Resin], [Width (μm)], [Intersection
      (default)], [Reference], [Replica], [Union],),
    table.hline(),
    [High Temp], [100], [0.815], [0.814], [0.781], [0.780],
    [], [200], [0.880], [0.876], [0.857], [0.852],
    [], [300], [0.895], [0.884], [0.888], [0.878],
    [], [600], [0.911], [0.908], [0.905], [0.901],
    [], [1000], [0.870], [0.863], [0.867], [0.860],
    [Rigid 10K], [100], [0.825], [0.781], [0.825], [0.781],
    [], [200], [0.883], [0.856], [0.882], [0.856],
    [], [300], [0.843], [0.813], [0.842], [0.812],
    [], [600], [0.723], [0.689], [0.704], [0.674],
    [], [1000], [0.779], [0.757], [0.752], [0.734],
    [White], [100], [0.390], [-0.006], [0.380], [-0.005],
    [], [200], [0.173], [0.000], [0.172], [0.001],
    [], [300], [0.304], [0.001], [0.255], [0.001],
    [], [600], [0.258], [0.043], [0.257], [0.044],
    [], [1000], [0.266], [0.096], [0.269], [0.099],
  )]
  , caption: [$upright(R Q)_d$ of the fifteen insert-to-part pairs under
  four definitions of the channel-interior ROI: the default intersection
  (both surfaces below the threshold), the reference (insert) mask
  alone, the replica (part) mask alone, and their union. Everything else
  is the production setting: the same registered grids and orientation,
  the $sigma = Delta$ filter, the threshold $- 0.20 thin d$ with $d$ the
  joint depth estimate, and the valid-data mask; a cell invalid on
  either surface is excluded under every definition.]
  , kind: table
  ) <tab:s8_masks>
]
Differences from the default: reference: mean $\| Delta \|$ 0.018, max
$\| Delta \|$ 0.045, $rho_s$ 0.927 over the ten well-formed channels
(0.096, 0.396, 0.932 over all fifteen); replica: mean $\| Delta \|$
0.012, max $\| Delta \|$ 0.034, $rho_s$ 0.988 over the ten well-formed
channels (0.012, 0.049, 0.986 over all fifteen); union: mean
$\| Delta \|$ 0.029, max $\| Delta \|$ 0.048, $rho_s$ 0.964 over the ten
well-formed channels (0.103, 0.395, 0.943 over all fifteen).

#block[
#figure(
  align(center)[#table(
    columns: 6,
    align: (left,right,center,center,center,center,),
    table.header([Resin], [Shot], [Intersection
      (default)], [Reference], [Replica], [Union],),
    table.hline(),
    [High Temp], [1], [0.882], [0.881], [0.845], [0.844],
    [], [5], [0.872], [0.872], [0.815], [0.815],
    [], [10], [0.877], [0.877], [0.839], [0.839],
    [], [20], [0.881], [0.880], [0.843], [0.842],
    [Rigid 10K], [1], [0.898], [0.886], [0.898], [0.886],
    [], [5], [0.867], [0.850], [0.866], [0.848],
    [], [10], [0.813], [0.789], [0.813], [0.790],
    [], [20], [0.720], [0.690], [0.720], [0.690],
  )]
  , caption: [Tool-degradation $upright(R Q)_d$ (shot 0 to shot $N$,
  mean over the widths) under the four ROI definitions of
  Table~@tab:s8_masks.]
  , kind: table
  ) <tab:s8_masks_lifetime>
]
#block[
#figure(
  align(center)[#table(
    columns: 7,
    align: (left,right,center,center,center,center,center,),
    table.header([Mode], [$delta$
      (μm)], [Intersection], [Reference], [Replica], [Union], [Union
      cells over intersection (%)],),
    table.hline(),
    [widening], [0], [1.000], [1.000], [1.000], [1.000], [0.0],
    [], [5], [0.982], [0.982], [0.983], [0.983], [1.5],
    [], [10], [0.934], [0.934], [0.932], [0.932], [2.9],
    [], [20], [0.788], [0.788], [0.720], [0.720], [5.8],
    [], [40], [0.427], [0.427], [0.184], [0.184], [11.7],
    [], [80], [0.039], [0.039], [-0.138], [-0.138], [23.4],
    [narrowing], [0], [1.000], [1.000], [1.000], [1.000], [0.0],
    [], [5], [0.982], [0.983], [0.982], [0.983], [1.5],
    [], [10], [0.933], [0.931], [0.933], [0.931], [3.0],
    [], [20], [0.785], [0.716], [0.785], [0.716], [6.2],
    [], [40], [0.426], [0.166], [0.426], [0.166], [13.2],
    [], [80], [0.042], [-0.175], [0.042], [-0.175], [30.5],
  )]
  , caption: [Synthetic symmetric wall displacement under the four ROI
  definitions: both walls of the compared channel moved outward
  (widening) or inward (narrowing) by $delta$, depth and draft fixed,
  same microtexture. The last column is the one-sided wall band that the
  union adds.]
  , kind: table
  ) <tab:s8_masks_synthetic>
]
= Layer-line peaks
<sec:s9>
Table~@tab:s9_layerlines gives the background-relative peak heights
quoted in Section~3.7 of the main text.

#block[
#figure(
  align(center)[#table(
    columns: 8,
    align: (left,right,center,center,center,center,center,center,),
    table.header([Resin], [$h$
      (μm)], table.cell(align: center, colspan: 6)[power / local
      background at period $Delta x$ (μm)],),
    table.hline(),
    [3-8], [], [27], [36], [50], [54], [100], [200],
    [Rigid 10K], [50], [1.0], [0.8], [1.1], [1.0], [16.1], [1.6],
    [White], [50], [1.3], [1.0], [1.2], [0.9], [7.4], [1.4],
    [High Temp], [25], [2.6], [2.0], [1.1], [2.8], [2.2], [1.0],
  )]
  , caption: [Along-channel power spectrum of the as-printed insert
  floor and field, averaged over rows and the five widths, relative to
  its running median over 25~μm of period. The layer line of a build at
  $30^compose$ is expected at $Delta x = h \/ sin 30^compose = 2 h$.]
  , kind: table
  ) <tab:s9_layerlines>
]
