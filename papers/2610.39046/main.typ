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
  title: [A 3D measurement workflow for assessing replication quality
and tool degradation in moulded microfluidic channels],
  authors: (
    ( name: [Mehmet Oğulcan Güngör],
      affiliation: [Micro and Nanotechnology and METU MEMS Center, Middle East Technical University, Ankara, T?rkiye],
      email: "" ),
    ( name: [Jérôme Charmet],
      affiliation: [HE-Arc Ing?nierie, HES-SO, Neuch?tel, and University of Bern, Switzerland],
      email: "" ),
    ( name: [Ender Yıldırım],
      affiliation: [Micro and Nanotechnology, METU MEMS Center, and Department of Mechanical Engineering, Middle East Technical University, Ankara, T?rkiye],
      email: "" ),
    ),
  abstract-title: [Abstract],
  abstract: [Mould-based replication, such as injection moulding with
3D-printed inserts, needs a check of how faithfully microchannels are
transferred from master to polymer replica. It is usually limited to a
width or depth ratio from one cross-section, which misses the sidewall
shape and depends on where the section is taken. We present a workflow
that assesses the whole channel from 3D scans of master and replica,
without sectioning. The scans are registered on a common grid, and each
height map is converted into a map of local slope. The correlation of
the two slope maps over the channel interior, $upright(R Q)_d$, is
reported with the channel dimensions and height- and slope-error maps.
These outputs separate a change of shape from a change of size and
locate it. A user can thereby compare mould materials, detect tool wear,
and tell whether a deviation arose before or during moulding. On
synthetic channels with known degradation, $upright(R Q)_d$ fell
steadily as the sidewalls were rounded, whereas the height correlation
levelled off. For injection moulding with stereolithography-printed
inserts in three resins, $upright(R Q)_d$ ranged from $0.17$ to $0.91$
over fifteen insert-to-part pairs. The height correlation placed the ten
well-formed channels within $0.03$. Over a twenty-shot run, one insert's
$upright(R Q)_d$ fell from $0.90$ to $0.72$ as its sidewalls wore, while
its height correlation stayed above $0.93$. We developed open-source
software that implements the workflow. Because the workflow needs only
registered 3D scans of a master and its replica, it can in principle be
applied to other mould-based processes.

],
  pagenumbering: "1",
  cols: 1,
  doc,
)


\[orcid=0009-0007-8864-5012\]

\[orcid=0000-0001-6992-4090\]

\[orcid=0000-0002-7969-2243\]

#block[
Replication quality ,Gradient correlation ,Surface metrology , Optical
profilometry ,Microchannel ,Injection moulding , Rapid tooling

]
= Introduction
<sec:intro>
Microfluidic devices are increasingly replicated from moulds made by
digital fabrication, such as 3D-printed or micromilled masters
\[1\]\[2\]. Mould-based processes need a metrological check
of fidelity to confirm that the microfeatures of the master are
transferred to the polymer replica. This need is independent of how the
master is produced. It has, however, grown more pressing as rapid
tooling expands the range of masters available for thermoplastic
replication. Photopolymer inserts printed by stereolithography (SLA),
for example, can be fabricated rapidly and used directly for injection
moulding \[3\]\[4\]\[5\]\[6\]. They
also serve as templates for thermoplastic embossing \[7\] and as
masters for replica moulding in poly(dimethylsiloxane) (PDMS)
\[8\]\[9\]. In each case a quantitative assessment is
needed, not merely to establish whether the feature has formed, but to
determine how faithfully its spatial geometry has been reproduced.

Replication quality in mould-based microfabrication is conventionally
reduced to a single dimension, the transcription ratio: the height or
width of a feature on the part over that on the mould
\[10\]\[11\]. A channel depth or width is measured on the
insert and on the moulded part, from a section or a top-down image, and
the two are compared with each other or with the nominal
\[12\]\[13\]\[14\]. The practice runs through the
microfluidic moulding literature, from steel tools to printed ones.
Demonstrations typically report the replicated width and depth,
sometimes with an average roughness, and little else
\[15\]\[5\]\[6\]\[16\]\[17\]\[9\]. Such a
ratio is easy to obtain but insensitive to several characteristics of
the channel. Two channels with identical mean width can differ
completely in sidewall steepness, in the sharpness of the floor-to-wall
transition, and in surface texture. All of these can influence flow,
sealing, and optical access. The measurement is also operator-dependent:
the result depends on where along the channel the section is taken,
where the measurement cursors are placed and how the edge of a rounded,
drafted wall is defined, so two users measuring the same part can report
different values. The reference review of the field lists the definition
of edges, alignment, and the location of measuring points among the
practical challenges of this comparison \[10\]. A recent
metrological treatment of the ratio reports a pillar replication
fidelity of $80.6 thin %$ or $96.2 thin %$, depending on which histogram
peak is taken as the replicated height \[11\]. Finally, a single
value from one section cannot reliably distinguish a faithfully
reproduced channel from one that has slumped, rounded, or only partly
filled. The problem is therefore one of measurement rather than of
process characterisation alone. What is needed is a defined measurement
procedure that assigns a comparable quantitative grade to the spatial
fidelity of a replicated feature. The methods reviewed next are judged
against that requirement.

Several richer comparison methods exist, each with limitations for
microchannel assessment. Areal surface-texture parameters and
roughness-transfer studies quantify how texture statistics carry from
tool to part \[18\]\[19\]\[20\]. The slope parameter
$S_(d q)$ has been used beside $S_q$ because it responds to the
morphology of a replicated texture, a height parameter only to its
amplitude \[21\]. But statistics carry no spatial correspondence:
they cannot say whether the steep and flat regions of two surfaces
coincide. Two surfaces can differ entirely in geometry yet share the
same parameter values \[22\]\[23\]. A group that computed
both found that roughness parameters showed no clear tendency where a
point-for-point correlation did \[24\]. Process-side practice adds
the degree of replication, the replicated feature height as a fraction
of the master's \[10\]\[12\], which grades filling but not
shape. Areal part scans have also quantified warpage \[25\], a
device-level form error, but not wall fidelity.

Correlation-based approaches do compare surfaces point for point.
Cross-correlation of registered topographies was developed at the
National Institute of Standards and Technology (NIST) for forensic
toolmark comparison. Vorburger et al.~\[22\]\[26\]
defined the maximum cross-correlation $upright(C C F)_max$ together with
a normalised difference $D_s$, and named the accuracy of surface
replication among its applications. Kumar et al.~\[24\] applied both
to moulded replicas of natural surfaces, and correlation has since
entered manufacturing quality assurance \[27\]. Perris et
al.~\[28\] graded the replication of numerically generated rough
surfaces with a normalised cross-correlation ratio computed from line
profiles of the printed master and the moulded part. Zheng et
al.~\[23\] and Wang et al.~\[29\] correlated registered height
maps to decide whether two areal measurements portray the same surface.
Jiang et al.~\[30\] replaced the height maps with their Fourier
amplitude spectra for the same purpose. These approaches correlate
heights rather than gradients, and none targets the microchannel
problem. A height correlation is dominated by the gross channel form and
saturates once a channel has merely formed. The similarity frameworks
decide whether two measurements represent the same surface rather than
grade how faithfully one replicates another. Loaldi et~al.~\[11\]
came closest to a gradient comparison. They subtracted the slope maps of
a diamond-machined insert and its replica along one axis, and found a
slope fidelity of $67 thin %$ where the height residual gave
$79 thin %$. The measure, however, is one-directional, its value depends
on a chosen uncertainty threshold, and it was applied once, to a steel
tool.

For microchannels, an important step came from derivative correlation.
Working on ultrasonically embossed microchannels, Yildirim et
al.~\[31\] cross-correlated the cross-sectional profiles of mould
and replica. They showed that correlating the derivatives of the
profiles, rather than the profiles themselves, is considerably more
sensitive to sidewall fidelity. In their data the profile (height)
correlation stayed above $0.97$ in every case, shifting only in the
third decimal even for a replica with a pronounced swallowtail defect.
The derivative correlation, by contrast, spread from $0.50$ to $1.00$
and separated good from poor replication clearly. They adopted $0.8$ as
a practical pass threshold. The gain comes from differentiation, which
amplifies the deviations at the sidewall, where the profile turns most
steeply. The method, however, inherits the limitations of its input. It
is tied to a single cross-section that must be obtained destructively,
and one section cannot represent along-channel variation. The choice of
where to section reintroduces the operator dependence of the dimensional
ratio, and a two-dimensional profile carries the derivative in only one
direction.

To our knowledge, no metric used in replication metrology combines the
four properties required here: full-length areal coverage of the channel
interior, sensitivity to local slope rather than height alone,
non-destructive acquisition, and evaluation without operator-chosen
steps after acquisition. Even existing areal correlation methods retain
manual choices, such as the waviness cut-offs of Kumar et al.~\[24\]
and the lateral magnification adjustment of the NIST comparisons
\[22\]. We therefore propose $upright(R Q)_d$ together with a
complete analysis workflow. The workflow registers 3D surface
measurements of a master and its replica on a common grid. It converts
each height map into a map of local slope magnitude, $\| nabla Z \|$,
and correlates the two slope maps over the shared channel interior.
$upright(R Q)_d$ thus grades the spatial correspondence of steep and
flat regions over the full channel length, including both sidewalls and
the floor. It needs no destructive sectioning or manual choice of a
cross-section. Unlike a height correlation, it did not saturate at high
fidelity in the tests reported here. We further show that, for the
channels studied, $upright(R Q)_d$ is governed by the sidewalls. An
open-source, in-browser tool implements the workflow and reports the
conventional width, depth and wall angle, with spatial height- and
slope-error maps, so the dimensional changes that a correlation
intentionally discards remain available for interpretation.
Table~@tab:rq_metrics places the metric family in this landscape.

#block[
#figure(
  align(center)[#table(
    columns: 4,
    align: (left,left,left,left,),
    table.header([Reported measure], [Basis], [What it
      captures], [Limitations],),
    table.hline(),
    [#strong[Channel width and depth; ratio to nominal or master]
    \[15\]\[5\]\[6\]\[16\]\[17\]\[9\]], [Few
    profiles, sections or top-down images; sometimes destructive], [Mean
    feature size; tolerance checks], [Single location;
    operator-dependent sectioning and edge definition; blind to wall
    shape and texture],
    [\(e.g.~trapezoidal versus hemispherical) \[13\]], [Sectioned
    or scanned profiles], [Wall form, angle and corner radius; link to
    demoulding stress and tool life], [Few locations; profile-bound;
    operator-chosen section],
    [\[6\]], [Optical inspection of the insert], [Tool-side
    degradation indicators], [Describes the tool, not master-to-replica
    correspondence],
    [\[25\]], [Full-field 3D scan of the part], [Device-level
    deformation, e.g.~for bonding], [Feature-level wall fidelity
    invisible],
    [\[10\]\[12\]\[14\]], [Replicated over master feature
    height; process monitoring], [Filling completeness across process
    conditions], [Scalar filling measure; a filled channel scores well
    regardless of its shape],
    [\($S_a$, $S_q$, $S_(d q)$\; texture spectra)
    \[18\]\[19\]\[21\]\[20\]\[32\]\[33\]], [Areal
    or AFM texture statistics, part-to-tool ratios and spectra], [Which
    texture scales transfer from tool to part; with $S_(d q)$, whether
    slopes are reproduced on average], [No spatial correspondence;
    cannot localise or grade shape],
    [\[22\]\[24\]], [Pearson correlation of registered
    height maps at the in-phase shift; $D_s$ the mean-square residual
    over the master's mean square], [Replication fidelity, termed
    replication accuracy by its authors (0.76--0.98 for moulded replicas
    of natural surfaces); $D_s$ restores amplitude
    sensitivity], [Height-based, dominated by gross form;
    $upright(C C F)_max$ blind to vertical scale; manual filter
    cut-offs],
    [\[28\]], [Line profiles of master and replica (stochastic
    rough surfaces)], [Replication grading of transferred texture (up to
    $tilde.op$0.74 for injection-moulded polystyrene); flat over a
    30-shot run], [Height-based; not wall-sensitive],
    [\[31\]], [Pearson correlation of one sectioned profile
    pair], [Gross profile correspondence], [Saturates: above 0.97
    throughout, third-decimal shifts even at a gross defect],
    [\[31\]], [Pearson correlation of the differentiated
    profiles], [Sidewall fidelity along one section (0.50--1.00 spread;
    0.8 threshold)], [Destructive single section; one derivative
    direction; operator-chosen location],
    [\[11\]], [Registered insert-minus-replica maps], [Where and by
    how much the replica departs; fidelity (share of pixels within
    measurement uncertainty) stricter for slope than height (67 versus
    79 %)], [One derivative direction; value set by the uncertainty
    threshold; a residual, not a bounded similarity],
    [\[23\]\[29\]\[30\]], [Pearson correlation of
    registered height maps, or of their 2D Fourier amplitude
    spectra], [Whether two measurements represent the same
    surface], [Built for identification, not grading; the spectral
    variant discards spatial phase; cannot localise],
    [: structural similarity (SSIM) and gradient-magnitude similarity
    deviation (GMSD) \[34\]\[35\]], [Windowed height
    statistics (SSIM); pointwise gradient-magnitude similarity pooled by
    its deviation (GMSD)], [Perceptual structural similarity of
    intensity images (SSIM); spatial non-uniformity of the gradient
    distortion (GMSD)], [Built for perceived image quality, not metric
    height fields; SSIM inherits height saturation; GMSD pooling misses
    uniform degradation],
    [], [], [], [],
    [], [Areal correlation of the height fields $Z$], [Gross height
    correspondence over the full surface], [Floor and field dominate;
    saturates once the channel forms],
    [], [Areal correlation of $partial Z \/ partial x$], [Along-channel
    slopes, longitudinal features, transferred floor texture], [Absolute
    value low when fine texture is not shared; relative trend more
    informative],
    [], [Areal correlation of $partial Z \/ partial y$], [Across-channel
    slopes and sidewall form], [Direction-specific; depends on
    consistent channel alignment],
    [], [Areal correlation of $\| nabla Z \|$], [Full-surface spatial
    correspondence of local steepness; sidewall-dominated; remains
    discriminating where the height correlation saturates], [Discards
    gradient sign and direction; invariant to positive amplitude
    scaling; may dilute very localised defects ($E_Z$, $E_d$
    complement)],
  )]
  , caption: [Measures of microchannel replication quality reported in
  the literature, and the $upright(R Q)$ metric family introduced in
  this work.]
  , kind: table
  ) <tab:rq_metrics>
]

#block[
#block[
\@P0.21P0.215P0.25\>

X\@

Reported measure & Basis & What it captures & Limitations \
#strong[Channel width and depth; ratio to nominal or master]
\[15\]\[5\]\[6\]\[16\]\[17\]\[9\] & Few
profiles, sections or top-down images; sometimes destructive & Mean
feature size; tolerance checks & Single location; operator-dependent
sectioning and edge definition; blind to wall shape and texture \
(e.g.~trapezoidal versus hemispherical) \[13\] & Sectioned or
scanned profiles & Wall form, angle and corner radius; link to
demoulding stress and tool life & Few locations; profile-bound;
operator-chosen section \
\[6\] & Optical inspection of the insert & Tool-side degradation
indicators & Describes the tool, not master-to-replica correspondence \
\[25\] & Full-field 3D scan of the part & Device-level deformation,
e.g.~for bonding & Feature-level wall fidelity invisible \
\[10\]\[12\]\[14\] & Replicated over master feature
height; process monitoring & Filling completeness across process
conditions & Scalar filling measure; a filled channel scores well
regardless of its shape \
($S_a$, $S_q$, $S_(d q)$\; texture spectra)
\[18\]\[19\]\[21\]\[20\]\[32\]\[33\] &
Areal or AFM texture statistics, part-to-tool ratios and spectra & Which
texture scales transfer from tool to part; with $S_(d q)$, whether
slopes are reproduced on average & No spatial correspondence; cannot
localise or grade shape \
\[22\]\[24\] & Pearson correlation of registered height maps
at the in-phase shift; $D_s$ the mean-square residual over the master's
mean square & Replication fidelity, termed replication accuracy by its
authors (0.76--0.98 for moulded replicas of natural surfaces); $D_s$
restores amplitude sensitivity & Height-based, dominated by gross form;
$upright(C C F)_max$ blind to vertical scale; manual filter cut-offs \
\[28\] & Line profiles of master and replica (stochastic rough
surfaces) & Replication grading of transferred texture (up to
$tilde.op$0.74 for injection-moulded polystyrene); flat over a 30-shot
run & Height-based; not wall-sensitive \
\[31\] & Pearson correlation of one sectioned profile pair &
Gross profile correspondence & Saturates: above 0.97 throughout,
third-decimal shifts even at a gross defect \
\[31\] & Pearson correlation of the differentiated profiles &
Sidewall fidelity along one section (0.50--1.00 spread; 0.8 threshold) &
Destructive single section; one derivative direction; operator-chosen
location \
\[11\] & Registered insert-minus-replica maps & Where and by how
much the replica departs; fidelity (share of pixels within measurement
uncertainty) stricter for slope than height (67 versus 79 %) & One
derivative direction; value set by the uncertainty threshold; a
residual, not a bounded similarity \
\[23\]\[29\]\[30\] & Pearson correlation of registered
height maps, or of their 2D Fourier amplitude spectra & Whether two
measurements represent the same surface & Built for identification, not
grading; the spectral variant discards spatial phase; cannot localise \
: structural similarity (SSIM) and gradient-magnitude similarity
deviation (GMSD) \[34\]\[35\] & Windowed height statistics
(SSIM); pointwise gradient-magnitude similarity pooled by its deviation
(GMSD) & Perceptual structural similarity of intensity images (SSIM);
spatial non-uniformity of the gradient distortion (GMSD) & Built for
perceived image quality, not metric height fields; SSIM inherits height
saturation; GMSD pooling misses uniform degradation \
\
& Areal correlation of the height fields $Z$ & Gross height
correspondence over the full surface & Floor and field dominate;
saturates once the channel forms \
& Areal correlation of $partial Z \/ partial x$ & Along-channel slopes,
longitudinal features, transferred floor texture & Absolute value low
when fine texture is not shared; relative trend more informative \
& Areal correlation of $partial Z \/ partial y$ & Across-channel slopes
and sidewall form & Direction-specific; depends on consistent channel
alignment \
& Areal correlation of $\| nabla Z \|$ & Full-surface spatial
correspondence of local steepness; sidewall-dominated; remains
discriminating where the height correlation saturates & Discards
gradient sign and direction; invariant to positive amplitude scaling;
may dilute very localised defects ($E_Z$, $E_d$ complement) \

]
]
The metric is first characterised on controlled synthetic surfaces with
known ground truth, where its response to wall degradation, depth loss,
noise, local defects and registration can be separated systematically.
It is then demonstrated on SLA rapid tooling for injection-moulded
microfluidics. Three commercial insert resins and five channel widths
provide fifteen master-to-replica comparisons spanning good to failed
replication. Repeated scans over a twenty-shot moulding run test whether
the workflow tracks progressive tool degradation. The same measurements
locate fidelity loss along the CAD-to-insert-to-part chain and quantify
the dimensional and surface changes. $upright(R Q)_d$ requires only
registered height maps of a master and its replica, and can in principle
be applied to other mould-based processes.

In practice the workflow supports five recurring tasks: characterising a
single channel, assessing an insert against its design, assessing a
moulded part against its insert, following an insert over a moulding
run, and assessing the whole chain from design to part. Within a
replication comparison, it separates deviations of shape from deviations
of size and locates them on the channel. On the injection-moulded
channels studied here, the slope correlation separated well-formed
replicas that a height correlation rated alike. It also followed the
progressive wear of an insert that the height correlation barely
registered.

= Materials and methods
<sec:methods>
== Replication-quality metrics
<sec:methods-metric>
The purpose of $upright(R Q)_d$ is to answer a spatial question: after
two channel surfaces have been aligned, do their steep and flat regions
occur at corresponding locations? In a faithfully replicated channel,
high-gradient regions occur at matching sidewalls and floor-to-wall
transitions, while the channel floor and the surrounding field remain
comparatively flat. Sidewall rounding, lateral displacement, surface
collapse, and spatially distributed defects all alter the position and
distribution of these gradients. $upright(R Q)_d$ captures such changes
by converting each measured surface into a gradient-magnitude map and
correlating the two maps cell by cell.

Each compared surface is represented as a single-valued height field
$Z \( x \, y \)$, with $x$ the along-channel and $y$ the across-channel
coordinate (Fig.~@fig:local_gradient). Let $Z_A$ and $Z_B$ denote the
two co-registered height fields of the reference surface~A (the design,
the insert, or the insert in an earlier state) and the surface~B
compared with it, sampled on a common regular grid of cell size $Delta$
spanning their overlapping extent. A common valid-cell mask excludes any
cell missing on either surface, for example through optical dropout, so
every correlation is evaluated only over cells valid on both. Both
conventions follow the NIST topography comparisons. Their
$upright(C C F)_max$ is defined at the in-phase shift, since a
correlation between misaligned topographies is meaningless
\[26\]\[24\]. Their cell-wise correlation was introduced so
that invalid regions could be kept out of the score \[26\]. The
valid cells are further restricted to the channel interior, the cells
that lie deeper than a fixed fraction of the channel depth on both
surfaces, so that the flat field around the channel does not dominate
the score. Height gradients are computed by second-order central
differences,
$ frac(partial Z, partial x) #scale(x: 240%, y: 240%)[\|]_(i \, j) approx frac(Z_(i + 1 \, j) - Z_(i - 1 \, j), 2 thin Delta) \, $<eq:centdiff>
and analogously in $y$, on an isotropic grid of cell size $Delta$.
Figure~@fig:local_gradient illustrates the geometric meaning of one
directional component. The local height difference between neighbouring
cells is the surface slope in that direction. For a locally planar wall,
it relates to the local wall angle through
$\| partial Z \/ partial y \| approx tan theta$. Because the channel is
aligned with the analysis axes, the $x$ component describes variation
along the channel while the $y$ component cuts through the sidewalls.

#figure(image("figures/ch3_rqd_local_gradient_schematic.png"),
  caption: [
    Coordinate convention (left) and estimation of one local
    directional-gradient component from neighbouring height values on
    the analysis grid (right).
  ]
)
<fig:local_gradient>

The two directional components are combined into the scalar gradient
magnitude
$ G \( x \, y \) = \| nabla Z \( x \, y \) \| = sqrt((frac(partial Z, partial x))^2 + (frac(partial Z, partial y))^2) \, $<eq:grad>
a direction-independent measure of local steepness. The magnitude
prevents cancellation between positive and negative wall slopes. It lets
sidewalls, floor-to-wall transitions, and longitudinal defects all
contribute to one full-surface map. Each height map is thereby reduced
to a gradient-magnitude map, and $upright(R Q)_d$ is the Pearson
correlation \[36\] of the two magnitude maps. The gradient vectors
themselves are never correlated directly. Writing $G_(A \, k)$ and
$G_(B \, k)$ for the magnitudes at the $k$-th of the $N$ cells in the
mask,
$ upright(R Q)_d = frac(sum_k #scale(x: 120%, y: 120%)[\(] G_(A \, k) - overline(G)_A #scale(x: 120%, y: 120%)[\)] #scale(x: 120%, y: 120%)[\(] G_(B \, k) - overline(G)_B #scale(x: 120%, y: 120%)[\)], sqrt(sum_k #scale(x: 120%, y: 120%)[\(] G_(A \, k) - overline(G)_A #scale(x: 120%, y: 120%)[\)]^2) thin sqrt(sum_k #scale(x: 120%, y: 120%)[\(] G_(B \, k) - overline(G)_B #scale(x: 120%, y: 120%)[\)]^2)) \, $<eq:rqd>
where $overline(G)_A$ and $overline(G)_B$ are the mean magnitudes over
the mask.

Because the gradient is a finite difference on the analysis grid, the
metric is defined at a stated cell size. Three operations scale with the
same $Delta$. The measured points are bin-averaged onto cells of side
$Delta$. A NaN-aware Gaussian filter of $sigma = Delta$ then regularises
the field before differentiation and fills an empty cell from measured
cells up to four cells away. Finally, the central difference spans
$2 Delta$. We therefore write $upright(R Q)_d \( Delta \)$ where the
dependence matters, in the way a slope parameter is reported together
with its nesting index \[37\]. Values at different cell sizes are
not comparable. The cell size follows from the instrument, not from the
data. A square cell of side $Delta gt.eq sqrt(2) thin s$ contains at
least one point of a lattice of pitch $s$, whatever the in-plane
rotation of the alignment. $Delta$ is therefore taken as the smallest
round value satisfying $Delta gt.eq sqrt(2) thin s$, with $s$ the finest
lateral resolution of the instrument. Every cell is then a measured
average rather than an interpolation.

The related metrics are defined on the same grid and mask. The
directional correlations
$ upright(R Q)_(d x) & = "corr" #scale(x: 120%, y: 120%)[\(] partial Z_A \/ partial x \, #h(0em) partial Z_B \/ partial x #scale(x: 120%, y: 120%)[\)] \,\
upright(R Q)_(d y) & = "corr" #scale(x: 120%, y: 120%)[\(] partial Z_A \/ partial y \, #h(0em) partial Z_B \/ partial y #scale(x: 120%, y: 120%)[\)] $<eq:rqdxy>
correlate the signed directional derivatives. The height correlation
$upright(R Q) = "corr" \( Z_A \, thin Z_B \)$ correlates the height
fields. Each is evaluated with the Pearson coefficient of
Eq.~#link(<eq:rqd>)[\[eq:rqd\]] applied to the indicated quantity. Two
spatially resolved error maps accompany the scalars. Error here means
the replication deviation of one surface from the other, not a
measurement error. The maps retain the absolute-deviation information
that the correlations discard. They are the signed height difference and
the unsigned gradient-magnitude difference,
$ E_Z = Z_A - Z_B \, #h(2em) E_d = #scale(x: 120%, y: 120%)[\|] thin \| nabla Z_B \| - \| nabla Z_A \| thin #scale(x: 120%, y: 120%)[\|] \, $<eq:errmaps>
where $E_Z$ shows where one surface is higher or lower than the other
and $E_d$ highlights poor shape fidelity such as rounded or displaced
sidewalls.

This scheme generalises the two-dimensional derivative cross-correlation
of Yildirim et al.~\[31\]. $upright(R Q)$ is the areal
counterpart of their profile correlation. $upright(R Q)_(d x)$,
$upright(R Q)_(d y)$ and $upright(R Q)_d$ are the areal counterparts of
their derivative correlation, resolved into both directions and
evaluated over the whole surface instead of one destructively obtained
section.

== Analysis software
<sec:software>
#figure(image("figures/fig_workflow.svg"),
  caption: [
    Inputs and outputs of the analysis software, all panels rendered by
    it. Top: single-surface analysis of one channel scan (Rigid 10K
    600~μm insert). Bottom: paired comparison of a reference surface A
    (High Temp 600~μm insert) with a comparison surface B (its first
    moulded part); the registered surfaces are coloured by $E_d$.
  ]
)
<fig:workflow>

The measurements are processed, and the metrics are computed, by the
Microchannel and Replication Quality Analyzer (MaRQ, version 1.0). This
open-source analysis pipeline, developed in this work, operates on
three-di­men­sion­al point clouds from optical profilometry
(Fig.~@fig:workflow). A single-surface workflow extracts the geometry
and roughness of one surface, and a paired-surface workflow compares two
registered surfaces.

#block[
\@P0.32\>

X\@

Parameter & Value \
Voxel size & 5~μm \
Aggregate cross-section & median per bin, 400 transverse bins over the
channel length \
Floor level; depth & median of profile bins $lt.eq$ 5th percentile;
depth $d$ from the field to the floor level \
Grid lines & 5~μm cells, 10~μm apart, central 80 % of the length; median
\
Width levels & floor 0.90, mid 0.50, opening 0.10 of the depth \
Wall angle & line fitted at 0.25 to 0.75 of the depth; $< 3^compose$ not
resolved \
Longitudinal spread & SD over the grid lines; depth: 80 slices, SD over
the central 80 % \
Floor roughness strip & $0.5 times$ nominal width $times$ 4000~μm,
points deeper than $0.7 thin d$ \
Field roughness strips & 400 $times$ 4000~μm, symmetric about the axis,
points above $- 0.3 thin d$ \
Roughness form removal & least-squares plane per region, no further
filtering \
Correlation grid cell size $Delta$ & 5~μm ($sqrt(2) times$ 3.51~μm
lateral resolution, rounded) \
Pre-gradient filter & NaN-aware Gaussian, $sigma = Delta$ \
Channel-interior mask & cells below 0.20 of the depth on both surfaces \

]
Each point cloud, in delimited text or ISO~25178-72 X3P format, is
cleared of optical outliers and thinned to 5~μm voxels. It is then
levelled on the flat field around the channel, which becomes the datum
$z = 0$. A raised feature, such as the channel-forming ridge of an
insert, is turned into the equivalent depression by a $180^compose$
rotation about an in-plane axis, so that it can be compared directly
with the channel it moulds. The channel axis is aligned with $x$ and the
channel centred at the origin, so that $x$ runs along the channel and
$y$ across it. The channel depth is read from an aggregate cross-section
of the whole channel length. The widths, the wall angle and the rounding
of the floor and rim corners are read on grid lines across the channel,
spread over the central $80 thin %$ of its length. On each line the wall
lies where the height profile crosses a fixed fraction of the depth,
located by interpolation between neighbouring grid points, and each
reported value is the median over the lines. The wall angle is the
inclination, from the vertical, of a straight line through the wall
positions between $25$ and $75 thin %$ of the depth; the corner rounding
is the distance by which the wall departs from that line at the floor
and opening levels. Walls within $3^compose$ of the vertical span too
few grid cells to be resolved and are reported as $< 3^compose$. The
variation along the channel is the spread over the lines, and over $80$
slices for the depth. Areal roughness (ISO~25178-2) is evaluated on a
floor strip and two field strips placed automatically from the detected
channel.

#figure(image("figures/fig_decision.svg"),
  caption: [
    Assessment tasks addressed by the workflow. CAD denotes the design
    geometry, and subscripts give the shot number: Insert$""_0$ is the
    as-printed insert, Insert$""_N$ the same insert after $N$ shots and
    Part$""_1$ the first moulded part.
  ]
)
<fig:decision>

For a paired comparison, both surfaces are thus already in the same
channel frame, so their registration needs no pairwise search. They are
brought onto a common grid with a shared valid-cell mask, and the
correlations and error maps are evaluated over the channel interior. The
software also resolves the $180^compose$ orientation ambiguity of a
straight channel, a correction required for $12$ of the $15$
insert-to-part comparisons.

Every step is deterministic with the fixed parameters of
Table~@tab:params, so repeated analyses of the same scan return
identical numbers. The extraction replaces manual cursor placement and
is operator-independent after acquisition. Sample placement, the scanned
region and the instrument settings remain acquisition decisions, held
fixed here. The software runs in a web browser without installation; its
interface is shown in Fig.~S1.1, and the complete algorithm and its
validation are given in Section~S1 of the supplementary material, with
all parameters in Table~S1.1.

#block[
#figure(
  align(center)[#table(
    columns: 2,
    align: (left,left,),
    table.header([Parameter], [Value],),
    table.hline(),
    [Voxel size], [5~μm],
    [Aggregate cross-section], [median per bin, 400 transverse bins over
    the channel length],
    [Floor level; depth], [median of profile bins $lt.eq$ 5th
    percentile; depth $d$ from the field to the floor level],
    [Grid lines], [5~μm cells, 10~μm apart, central 80 % of the length;
    median],
    [Width levels], [floor 0.90, mid 0.50, opening 0.10 of the depth],
    [Wall angle], [line fitted at 0.25 to 0.75 of the depth;
    $< 3^compose$ not resolved],
    [Longitudinal spread], [SD over the grid lines; depth: 80 slices, SD
    over the central 80 %],
    [Floor roughness strip], [$0.5 times$ nominal width $times$ 4000~μm,
    points deeper than $0.7 thin d$],
    [Field roughness strips], [400 $times$ 4000~μm, symmetric about the
    axis, points above $- 0.3 thin d$],
    [Roughness form removal], [least-squares plane per region, no
    further filtering],
    [Correlation grid cell size $Delta$], [5~μm ($sqrt(2) times$ 3.51~μm
    lateral resolution, rounded)],
    [Pre-gradient filter], [NaN-aware Gaussian, $sigma = Delta$],
    [Channel-interior mask], [cells below 0.20 of the depth on both
    surfaces],
  )]
  , caption: [Principal analysis parameters of the software, fixed for
  every result in this paper.]
  , kind: table
  ) <tab:params>
]

== Interpretation and assessment tasks
<sec:methods-interp>
$upright(R Q)_d$ is a dimensionless measure of spatial correspondence,
not a percentage: $upright(R Q)_d = 0.8$ does not mean that 80 % of the
geometry was replicated. The Pearson coefficient is bounded between
$- 1$ and $1$. In correctly registered, physically representative
channel comparisons it principally occupies the interval from about $0$
(no shared gradient structure) to $1$ (perfect linear correspondence of
the steepness pattern). Small negative values can arise from finite
texture realisations, substantial ones only under severe
misregistration. The Pearson coefficient is invariant to constant offset
and positive scaling. A high $upright(R Q)_d$ therefore does not by
itself establish identical dimensions: two surfaces can share the
spatial pattern of steep and flat regions while differing in width,
depth, or absolute wall angle. The metric is therefore read together
with the outputs that retain what it discards: the extracted dimensions
for size, $E_Z$ for height deviations, and $E_d$ for slope deviations.
Interpreted directionally, $upright(R Q)_(d y)$ reflects the
correspondence of the across-channel walls and is the principal
contributor to $upright(R Q)_d$ for channel geometries.
$upright(R Q)_(d x)$ reflects longitudinal slope and texture
correspondence. Its absolute value can stay low when fine floor texture
is not shared between independent scans, so its relative trend is more
informative than its level. We further quantify wall dominance with the
ratio
$f_y = sum_k \( partial Z \/ partial y \)_k^2 \/ sum_k \| nabla Z \|_k^2$,
the share of the squared slope magnitude carried by the across-channel
component. The software computes it for each analysed surface over the
channel interior (cells deeper than $0.20$ of the depth) along the
central $60 thin %$ of the crop, where the rounded channel ends do not
contribute. For the insert-to-part pairs it is that of the part. It
shows that, for the channels studied, $upright(R Q)_d$ behaves as a
measure of sidewall fidelity.

Which surfaces are compared, and which of these outputs are read,
depends on the question (Fig.~@fig:decision). A single channel is
characterised by its dimensions and roughness alone. The fabrication of
a mould insert is assessed against its CAD design, where the height
correlation and the dimensions are read. Against the idealised CAD
surface, $upright(R Q)$ does not saturate, and the difference is
dominated by systematic wall offsets that the extracted dimensions
measure directly. Replication is assessed by comparing the insert with
its moulded part. Here $upright(R Q)_d$ and $upright(R Q)_(d y)$ grade
the shape, the dimensions its size, and $E_Z$ and $E_d$ locate the
deviations. $upright(R Q)_d$ is read against the level that the same
surface reaches against its own rescan. Tool degradation is followed by
comparing an insert with its own initial state over a moulding run, and
the whole chain by comparing the moulded part with the design. Printing
deviations already appear in the insert against its design, whereas
moulding deviations appear only in the part against its insert. The
workflow sets no acceptance thresholds. Tolerances depend on the device
and its function, and a user sets them from the application, for example
from a reference pair of known quality.

#figure(image("figures/ch2_insert_specimen.svg"),
  caption: [
    Test geometry and measurement. (a)~Mould insert (mm); (b)~plan view
    of the five channel positives; (c)~cross-section of the insert.
    (d)~Moulded part; (e)~raw point cloud of the 1000~μm channel;
    (f)~its height field in the software (µm).
  ]
)
<fig:insert_design>

== Synthetic test surfaces
<sec:methods-synthetic>
The metric was characterised on synthetic height fields with known
ground truth, built with the design geometry of the 600~μm test channel.
The reference is a trapezoidal channel 300~μm deep with a 600~μm floor
and a $10^compose$ draft, on a $4 times 2$~mm field sampled at 5~μm. A
band-limited random microtexture of 3~μm standard deviation and about
12~μm correlation length is added to floor and field. A degraded copy is
compared with the undegraded reference through the production pipeline,
with the same fixed settings as the measured data. Four degradations are
applied in controlled amounts. Wall smoothing is a Gaussian rounding of
the cross-section profile of scale $sigma$ that leaves the microtexture
intact. Global smoothing is an isotropic Gaussian blur of the whole
field. Depth fill reduces the depth at fixed opening width, which lowers
the wall slope in proportion. The fourth is added Gaussian noise. A
localised defect is a Gaussian feature of 90~μm height and 140~μm width
placed on the channel rim. Two reference cases bracket the scale: the
reference compared with itself, and two fields with the channel removed
and independent textures, evaluated over $30$ texture seeds.
Registration bias is the residual systematic change in $upright(R Q)_d$
of a re-registered copy relative to the aligned copy. It was assessed by
imposing rigid in-plane translations and rotations and re-registering
with the production pipeline. It is not corrected for, and its maximum
over the transforms is quoted. The seed-to-seed standard deviation was
obtained by repeating the degradation series with different texture
seeds.

== Moulding experiment
<sec:methods-experiment>
The workflow was applied to microchannels injection moulded with
stereolithography-printed inserts.

=== Test geometry and insert fabrication
<sec:methods-materials>

The mould consists of two mating insert halves
(Fig.~@fig:insert_design). One half carries the microchannel positives,
the raised ridges that mould the channels, on its cavity floor. The
other half is identical but smooth, so the moulded part receives channel
features on one face only. The patterned half carries five straight
microchannel positives. All five are 300~μm tall and 6~mm long and span
five widths, $100$, $200$, $300$, $600$, and 1000~μm, giving
depth-to-width aspect ratios of $3.0$, $1.5$, $1.0$, $0.5$, and $0.3$.
This fixed-height, variable-width set exposes the replication process to
a broad range of feature aspect ratios within a single insert. A
$10^compose$ draft angle on the sidewalls eases release of the moulded
part. The halves were designed in Autodesk Inventor and exported as STL
files. The same CAD surface serves as the reference for the
CAD-to-insert comparison, so the printed geometry is graded against the
design it was sliced from. On these CAD references the software's
readings return the design widths within 0.1~μm and the $10^compose$
wall angle within $0.02^compose$, a check of the extraction on known
geometry (Section~S1 of the supplementary material). The inserts were
printed in three commercial Formlabs photopolymers, chosen to span a
wide range of moulding behaviour: White, Rigid~10K (R10K), and High~Temp
(HT).

Inserts were printed on a Form~3+ low-force stereolithography (SLA)
printer (Formlabs, Somerville, MA, USA), with orientation, support, and
slicing prepared in Formlabs PreForm. Every insert was built in the same
orientation, tilted $30^compose$ to the platform with the microchannel
cavity face upward. The layer thickness was set to the finest available
for each resin, 25~μm for HT and 50~μm for R10K and White. The remaining
low-level parameters are fixed for each validated resin. After printing,
the inserts were washed in isopropyl alcohol and UV post-cured to the
manufacturer's specification. The support structures were then removed
and the back face was sanded through a $320$, $600$ and $1500$~grit
sequence to clear the support witness marks and let the insert seat
squarely in the steel holder. The microchannel cavity face, never in
contact with supports, required no such treatment. A final
isopropyl-alcohol wash removed the sanding dust, and each insert was
inspected under an optical microscope for defects.

=== Injection moulding and the moulding run
<sec:methods-moulding>
Parts were injection moulded in polystyrene on a desktop injection
moulding machine (MSE Teknoloji, Gebze, Türkiye). The full study is a
matrix of three resins $times$ five channel widths. It yields the
fifteen insert-to-part comparisons analysed below, each between an
insert and its first moulded part. To follow the tool over the run, each
insert was scanned in its as-fabricated state (shot~0) and again after
shots $1$, $5$, $10$, and $20$ where it survived. Each rescan is
compared with the insert's own shot-0 state, a fixed reference that
isolates the degradation of the tool.

=== Optical profilometry
<sec:methods-metrology>
Surfaces were measured on an InfiniteFocus~G5 optical 3D measurement
system (Bruker Alicona, Graz, Austria), which reconstructs topography by
focus variation \[38\]. The $5 times$ objective (numerical aperture
$0.15$) was used, with the instrument's vertical-resolution setting at
500~nm. The objective's finest lateral topographic resolution is 3.51~μm
\[39\], and the exported point clouds are sampled at that pitch.
With $s = 3.51 med upright("μ") upright("m")$, the rule
$Delta gt.eq sqrt(2) thin s$ gives
$sqrt(2) thin s = 4.96 med upright("μ") upright("m")$, rounded to
$Delta = 5 med upright("μ") upright("m")$. Every value in this paper is
$upright(R Q)_d \( 5 med upright("μ") upright("m") \)$, written as
$upright(R Q)_d$ for brevity. Each scan covered at least one full
channel feature, including its floor, both sidewalls, and the adjacent
field, producing dense three-dimensional point clouds.
Figure~@fig:insert_design\(d)--(f) shows a moulded part, the raw point
cloud of one of its channels and the height field the software builds
from it, with the coordinate convention used throughout. Areal
surface-texture parameters follow ISO~25178 \[37\]. Registration of
each surface pair to a common frame and grid is performed by the
analysis software. No destructive preparation is required.

== Reference similarity measures
<sec:methods-benchmark>
For comparison, three established similarity measures are evaluated on
the same registered grids and channel-interior mask. The NIST normalised
difference \[22\]\[40\],
$D_s = R_q^2 \( Z_A - Z_B \) \/ R_q^2 \( Z_A \)$, is the mean-square
roughness of the difference topography over that of the reference. It is
reported in the similarity form $1 - D_s$ used by Kumar
et~al.~\[24\] and is unbounded below. The structural similarity
index (SSIM) \[34\] is a windowed comparison of the local means,
variances and covariance of two images. It is computed on the height
maps with its standard $11 times 11$ Gaussian window ($sigma = 1.5$
cells), $K_1 = 0.01$ and $K_2 = 0.03$, and the dynamic range set to the
joint height range of the pair, and pooled by its mean. The
gradient-magnitude similarity of Xue et~al.~\[35\] compares the
two gradient magnitudes cell by cell, with a stabilising constant
$c = 0.0026$ on heights scaled jointly to $\[ 0 \, 1 \]$ (Section~S7 of
the supplementary material). It is pooled in two ways: by its standard
deviation, the gradient-magnitude similarity deviation (GMSD), a
distance that vanishes for identical maps, and by its mean, the
gradient-magnitude similarity mean (GMSM) of the same authors. Its
magnitudes come from the same central differences as $upright(R Q)_d$,
not from the Prewitt operator of the image implementation, so all
measures share one regularisation; no image down-sampling is applied.
The SSIM and gradient-similarity maps are computed over the whole valid
crop and pooled over the channel-interior mask. Differences between the
measures thus reflect their definitions rather than the cells they are
evaluated on. The six values of a pair ($upright(R Q)$,
$upright(R Q)_d$, $D_s$, SSIM, GMSD and GMSM) come from one registration
and one grid, and are listed per comparison in Tables~S7.1 to S7.3.

#figure(image("figures/ch5_synthetic.svg"),
  caption: [
    Synthetic characterisation of $upright(R Q)_d$. (a)--(d)~Reference
    cases, with the height field $Z$ above and $\| nabla Z \|$ below,
    scales on the left; in (d) the lower map is the gradient error $E_d$
    on its own scale. (e)~$upright(R Q)$ and $upright(R Q)_d$ against
    the wall-smoothing scale $sigma$. (f)~$upright(R Q)_d$ against wall
    and global smoothing. (g)~$upright(R Q)_d$ against depth fill and
    added noise; (f) and (g) share the y axis of (e).
  ]
)
<fig:synthetic>

== Analysis settings and sensitivity protocol
<sec:methods-settings>
Spatial sampling is the principal analysis parameter, because it sets
the scale at which every downstream quantity is evaluated. It enters
twice. Each cloud is first thinned to 5~μm voxels before gridding
(Table~@tab:params), a concession to in-browser processing. At this
voxel size the software recovers the widths of synthetic channels of
known geometry within a few micrometres and their wall angles within
$0.5^compose$ (Section~S1 of the supplementary material). The
correlations depend, in addition, on the grid cell size at which the
gradients are taken. The cell size
$Delta = 5 med upright("μ") upright("m")$ is fixed from the instrument's
lateral resolution and not from the results, and is stated with every
value in this paper. The thinning leaves about $7 thin %$ of these cells
to the filter, against almost none with native-density clouds. Relative
to gridding the native points, it raises $upright(R Q)_d$ by less than
$0.01$ on average and by at most $0.02$. The thinning is therefore part
of the stated definition.

The sensitivity of the correlations to the analysis settings is
quantified on the fifteen insert-to-part pairs, with crops and
registration unchanged. Four settings are varied in turn about their
defaults: the grid cell size, the channel-interior fraction ($0.20$ of
the depth), the pre-gradient filter and a rigid shift across the
channel. The grid cell size is also varied on the tool-degradation
trajectories. As a robustness check, with all other settings fixed, the
default channel-interior mask (both surfaces below the threshold) is
compared with masks defined by the reference surface alone, by the
replica alone, and by their union, on the same pairs and trajectories.

= Results and discussion
<sec:results>
The results follow the questions a user of the workflow asks. Synthetic
channels with known ground truth first fix the meaning of the numbers,
before any measured surface is graded. The insert-to-part pairs then
test whether $upright(R Q)_d$ grades real replicas where the height
correlation does not, and trace what it responds to. The moulding run
asks whether it follows the degradation of a mould insert. The
dimensions, the roughness and the print texture read from the same scans
give the complementary diagnosis that places a deviation along the
CAD-to-insert-to-part chain. Finally, the metric is tested against
established similarity measures and against its own analysis settings,
and its scope is stated.

== Synthetic characterisation of $upright(R Q)_d$
<sec:res-synthetic>
Before the experimental chain, the behaviour of $upright(R Q)_d$ was
characterised on the synthetic surfaces, analysed with the same
production code and fixed 5~μm settings used throughout. Two references
bracket the metric: identical surfaces return exactly $1$, and an
independently textured surface with the channel geometry removed returns
$- 0.001 plus.minus 0.009$ (mean $plus.minus$ standard deviation over
$30$ texture seeds). Figure~@fig:synthetic\(a)--(d) shows the reference
channel alongside progressively smoothed and locally defective variants.
On the reference geometry the sidewalls occupy about $5 thin %$ of the
analysed cells yet carry about $97 thin %$ of the gradient energy within
the channel-interior mask. This anticipates the wall dominance found on
the measured channels.

Under progressively stronger wall smoothing, $upright(R Q)_d$ falls
monotonically, from $1.000$ to $0.872$, $0.683$, $0.551$, and $0.384$ at
smoothing scales $sigma = 40$, $80$, $120$, and 200~μm
(Fig.~@fig:synthetic\(e)). $upright(R Q)$ falls under the same
degradation but flattens. Its slope peaks at about $0.04$ per 10~μm for
$sigma$ between $40$ and 50~μm and is below $0.01$ per 10~μm beyond
160~μm. It thus still reads $0.604$ at 200~μm for a channel whose walls
have visibly gone (Fig.~@fig:synthetic\(c)), whereas $upright(R Q)_d$ is
still losing $0.014$ per 10~μm there. Beyond
$sigma approx 120 med upright("μ") upright("m")$, $upright(R Q)$ moves
by $0.07$ in total and $upright(R Q)_d$ by $0.17$, consistent with the
saturation that the printed channels show. Because the curve in
Fig.~@fig:synthetic\(e) is monotonic, a value measured on a printed
channel can in principle be read back as an equivalent wall-smoothing
scale.

Smoothing confined to the wall corners and smoothing applied to the
whole field give nearly the same $upright(R Q)_d$ at the same $sigma$
(Fig.~@fig:synthetic\(f)). They agree within $0.015$ up to 100~μm and
within $0.07$ at 200~μm. In these tests the metric thus responds to the
loss of wall steepness whether it is confined to the walls or spread
over the field. The two modes produce the same geometry at equal $sigma$
and differ only in the microtexture, which wall smoothing leaves intact
and global blur removes. Below 100~μm the global blur scores marginally
lower, because blurring the texture slightly decorrelates it from the
reference. Above 100~μm it scores higher. Once the walls are weak, the
intact texture of the wall-smoothed surface competes with them in the
gradient map, whereas the blurred surface keeps a clean, if faint, wall
band. A heavily degraded but still rough surface therefore scores lower
than an equally degraded smooth one, consistent with the noise result
below.

The metric is exactly invariant to positive amplitude scaling, since
Pearson correlation is blind to a positive factor. For the same reason
it stays high under floor filling. With the opening width held fixed,
$upright(R Q)_d$ remains above $0.98$ up to $70 thin %$ depth loss,
reads $0.93$ at $80 thin %$ and $0.79$ at $85 thin %$, and falls to
$0.43$ at $90 thin %$ (Fig.~@fig:synthetic\(g)). This last drop comes
from the channel-interior mask rather than from the walls. The filled
channel is then barely deeper than the mask level, so the mask keeps
only about $6 thin %$ of its cells. $upright(R Q)$, also
amplitude-invariant, is almost equally insensitive to a uniform loss of
depth ($0.85$ at $80 thin %$, $0.50$ at $90 thin %$). Neither
correlation is therefore a depth check. $upright(R Q)_d$ grades the
spatial correspondence of steep and flat regions, not absolute height or
depth, for which the extracted dimensions and the $E_Z$ map remain
necessary.

Added Gaussian noise with a standard deviation of 20~μm costs
$upright(R Q)_d$ $0.04$, 40~μm costs $0.18$ and 80~μm costs $0.53$. All
these levels are far above the instrument's vertical-resolution setting
of 0.5~μm. The dispersion of repeated scans on the sidewalls was not
measured and is absorbed in the self-comparison of the rescanned
inserts. $upright(R Q)$ is less noise-sensitive ($0.89$ at 80~μm)
because differentiation amplifies noise. The largest isolated synthetic
defect changes $upright(R Q)_d$ by less than $0.01$ while remaining
conspicuous in the $E_d$ map, which is why the maps accompany the
scalar. Imposed rigid transformations strongly reduce the unregistered
correlation. The production registration, however, reduces this bias to
at most $0.002$\; the seed-to-seed standard deviation is at most
$0.010$. All synthetic values are
$upright(R Q)_d \( 5 med upright("μ") upright("m") \)$ on the
generator's 5~μm grid; the cell size is the strongest numerical setting.
The same fixed settings are used for every measured surface in the
sections that follow, so the synthetic and the experimental values are
directly comparable. Section~S2 of the supplementary material gives the
full characterisation.

== $upright(R Q)$ and $upright(R Q)_d$ on the insert-to-part pairs
<sec:res-saturation>

#figure(image("figures/ch5_rq_saturation.svg"),
  caption: [
    $upright(R Q)$ and $upright(R Q)_d$ for the fifteen insert-to-part
    comparisons, ordered by $upright(R Q)_d$ and coloured by resin; the
    shaded band marks $upright(R Q) >$ 0.9.
  ]
)
<fig:saturation>

Across all fifteen insert-to-part comparisons, $upright(R Q)_d$ resolves
replication quality over almost its entire range. It runs from $0.17$
for the worst-formed channels to $0.91$ for the best
(Fig.~@fig:saturation\; every pair in Table~S3.1). The height
correlation $upright(R Q)$ does the opposite. Once a channel has formed
at all, $upright(R Q)$ collapses into a narrow band against unity: the
ten channels with $upright(R Q) > 0.9$ span only $0.03$ in
$upright(R Q)$ yet $0.19$ in $upright(R Q)_d$. The two metrics rank the
channels only loosely alike (rank correlation $0.72$). The height
correlation can even reverse an ordering that the extracted
cross-section geometry independently supports. The rim of the R10K
600~μm part is rounded by 35~μm, against 4~μm on its insert, and its
opening widens by 57~μm, although its wall angle differs by only
$1.5^compose$ (Table~S4.1). It scores $upright(R Q) = 0.97$ but
$upright(R Q)_d = 0.72$. The HT 100~μm channel, reproduced to within
$0.6^compose$ in wall angle, 5~μm in width and 10~μm in corner rounding,
scores $upright(R Q) = 0.96$ and $upright(R Q)_d = 0.82$. On these data
the height correlation confirmed that a channel had formed but did not
resolve how faithfully a well-formed channel was reproduced. This is why
$upright(R Q)_d$ is taken as the primary metric. The insensitivity to
shape, which differentiation removes, also distinguishes
$upright(R Q)_d$ from earlier correlation metrics, which correlate
heights rather than slopes.

The three resins span the quality range that the metric is meant to
discriminate (Table~@tab:rq_summary). The first-shot $upright(R Q)_d$
averages $0.87$, $0.81$, and $0.28$ for HT, R10K, and White,
respectively. For the same comparisons the height correlation reads
$0.97$, $0.98$, and $0.46$, saturating near unity for the two resins
that moulded well. $upright(R Q)_d$ separates HT from R10K, which the
height correlation places together; both metrics separate them from the
failed White.

#block[
#figure(
  align(center)[#table(
    columns: 5,
    align: (left,left,left,left,left,),
    table.header([], [CAD$arrow.r$Ins.], [], [CAD$arrow.r$Part], [],),
    table.hline(),
    [3-4
    Resin], [$upright(R Q)$], [$upright(R Q)$], [$upright(R Q)_d$], [$upright(R Q)$],
    [HT], [ $plus.minus$ 0.06], [ $plus.minus$ 0.01], [ $plus.minus$ 0.04], [ $plus.minus$ 0.05],
    [R10K], [ $plus.minus$ 0.10], [ $plus.minus$ 0.01], [ $plus.minus$ 0.06], [ $plus.minus$ 0.10],
    [White], [ $plus.minus$ 0.18], [ $plus.minus$ 0.04], [ $plus.minus$ 0.08], [ $plus.minus$ 0.10],
  )]
  , caption: [First-shot fidelity by resin, given as mean $plus.minus$
  one standard deviation over the five channel widths.]
  , kind: table
  ) <tab:rq_summary>
]
#figure(image("figures/ch5_mech_maps.svg"),
  caption: [
    Wall dominance of the gradient magnitude and per-pixel error maps.
    (a)~Wall-dominance ratio $f_y$ against $upright(R Q)_d$ for the
    fifteen insert-to-part pairs, coloured by resin. (b)~Gradient
    magnitude $\| nabla Z \|$ over a central segment of a High Temp
    300~μm channel. (c,d)~Signed height error $E_Z$ and
    (e,f)~gradient-magnitude error $E_d$ of a High Temp (c,e) and a
    Rigid 10K (d,f) 600~μm channel at the first shot.
  ]
)
<fig:mech_maps>

Even without replication loss, $upright(R Q)_d$ for real surfaces stays
below unity. Comparing each insert with itself, scanned before and after
a single shot, returns $upright(R Q)_d = 0.88 plus.minus 0.02$ for HT
and $0.90 plus.minus 0.02$ for R10K over the five widths (mean
$plus.minus$ standard deviation). This is an intermediate precision
condition rather than a repeatability condition \[41\]: the same
procedure and instrument, but with demounting, one moulding shot and
remounting between the scans. The comparison therefore contains any
change of the insert in that shot as well as the measurement. For HT the
wall geometry records such a change. In the first shot its walls
straightened and tilted: the wall angle rose from $7.2^compose$ to
$12.7^compose$, the rounding of the floor and rim corners fell by $2$ to
14~μm and the opening widened by $5$ to 12~μm, while the floor width and
the depth stayed within 5~μm (Table~S6.3). The part moulded in that shot
still carries the as-printed shape. After the first shot the HT insert
held its shape, and its scans after $1$, $5$, $10$ and $20$ shots
compare with one another at $0.92$ to $0.95$ (Table~S6.4). These later
self-comparisons are effectively correlations between independent
measurements of the same surface. They are set by the decorrelation of
fine microtexture between scans and by residual registration error
rather than by any replication loss. Both contributions are expected:
height fluctuations in repeated optical measurements grow with the local
gradient \[42\], so the sidewalls that carry the $upright(R Q)_d$
signal are also where scan-to-scan noise is largest. In the
measurement-study model of Liu et al.~\[43\], an observed similarity
is the true similarity plus a measurement term, and an insert compared
with its own unchanged state estimates that term directly. First-shot HT
replication ($0.87$) therefore lies below the rescan level observed
under the present protocol ($0.92$ to $0.95$): even the best-replicating
resin loses some sidewall fidelity in moulding. On the synthetic
surfaces the analysis itself contributes little: the registration bias
is at most $0.002$ and the seed-to-seed standard deviation at most
$0.010$. The HT insert, unchanged after the first shot, nevertheless
moves by up to $0.02$ between shots at a single width (standard
deviation $0.013$ over shots and widths). Differences in
$upright(R Q)_d$ smaller than about $0.02$ are therefore not
interpreted. This bound rests on the analysis and on the same-tool
scatter of one insert; it is not a measurement uncertainty.

== Physical interpretation
<sec:res-sidewall>

The discriminating power of $upright(R Q)_d$ comes from the sidewalls.
The gradient correlation splits into two directional components,
$upright(R Q)_(d y)$ across the channel and $upright(R Q)_(d x)$ along
it, and $upright(R Q)_d$ closely follows $upright(R Q)_(d y)$: the two
agree to a correlation of $0.97$ (mean absolute difference $0.07$).
Geometrically, the across-channel gradient is concentrated at the walls
(Fig.~@fig:mech_maps\(a,b)). The wall-dominance ratio $f_y$ exceeds
$0.85$ for every channel. It reaches about $0.99$ for the
well-replicated ones and stays above $0.86$ even for the poorly
replicated White channels. For the channels studied, then,
$upright(R Q)_d$ behaves as a measure of sidewall fidelity, for all
three resins. Sidewall form is also what a single width or depth ratio
does not capture, and it is where independent studies locate replication
loss. Loss concentrates at the steepest features of the master, in the
moulding of rough surfaces \[28\] as in embossed microchannels
\[31\]. Across a set of eleven areal parameters, the slope
statistics $S_(d q)$ and $S_(d r)$ are the ones that transfer worst from
a steel tool to the moulded part \[33\]. The sidewall thus appears
to be both where replication loss tends to concentrate and where the
metric, by its construction, is most sensitive. This distinguishes it
from a general similarity index. It is also why the exact definition of
the channel-interior region matters little for well-formed channels: the
walls dominate the gradient energy under every mask tested.

Where the walls depart is shown by the error maps. $upright(R Q)_d$ is
deliberately a global grade of distributed fidelity; the synthetic study
showed that a severe but localised defect barely moves it. The per-pixel
maps computed by the software supply the complementary local view
(Fig.~@fig:mech_maps\(c)--(f)). For the best-replicated channel (HT,
600~μm, $upright(R Q)_d = 0.91$\; panels (c) and (e)), the signed height
error $E_Z$ is small-amplitude and spatially random. The
gradient-magnitude error $E_d$ is confined to two thin sidewall lines.
For the lowest-fidelity opaque channel (R10K, 600~μm,
$upright(R Q)_d = 0.72$\; panels (d) and (f)), the sidewall bands
thicken and turn asymmetric. The floor departs systematically, and the
surrounding field carries a periodic mismatch inherited from the print
texture. The scalar provides the global grade and the maps localise the
deviations; together they capture both distributed wall degradation and
localised damage. The maps and $upright(R Q)_d$ derive from the same
registered topographies, so the maps localise the grade rather than
validate it independently. The check that does not share this
construction is the extracted cross-section geometry of Table~S4.1. The
translucent White parts cannot be mapped because their steep sidewalls
drop out optically; their penalty is carried by the channel-interior
aggregate of Table~@tab:rq_summary.

== Tracking insert degradation
<sec:res-lifetime>
#figure(image("figures/ch5_lifetime.svg"),
  caption: [
    Insert degradation over the moulding run. (a,b)~$upright(R Q)_d$,
    its across-channel component $upright(R Q)_(d y)$ and $upright(R Q)$
    between each insert at shot 0 and at shot $N$ (left axis), with the
    wall angle (right axis), for (a)~High Temp and (b)~Rigid 10K.
    (c)~Floor-width and (d)~depth change from shot 0, taken per width.
    (e)~Channel-floor $S_a$. Values are means over the five widths;
    error bars are standard deviations.
  ]
)
<fig:lifetime>

A replication metric for rapid tooling should also track how long the
tool maintains its quality. Following a measure across a run is
established practice. Channel dimensions have been followed to 100 and
500 shots \[15\]\[5\]\[6\], and a profile correlation
ratio to 30 \[28\]. In several of these records the measure held
constant to the last part \[15\]\[5\]\[28\]. The
question is whether the measure responds to the degradation that does
occur, which Stampone et al.~\[13\] saw by eye as a gradual
change of channel shape at constant channel depth. Each insert is graded
against its own as-printed state; grading against the moulded part
instead would hide the drift, because each part faithfully copies the
current state of its insert. Figure~@fig:lifetime\(a,b) shows the two
resins that survived the run (per-width values in Tables~S6.1 and S6.2).
HT settled at the first shot and then held. Against its as-printed state
it stays within $0.01$ of $0.88$, the value it reached at the first
shot, through shot $20$, and its later states compare with one another
at $0.92$ to $0.95$. R10K drifts monotonically from $0.90$ to $0.72$\;
drift here denotes the progressive change of the tool itself, not of the
instrument. The height correlation is insensitive to the drift that
matters. It stays near $0.97$ for HT and falls only from $0.99$ to
$0.93$ for R10K, a change that would not by itself signal a degrading
tool. White is not shown: it reached end of life within the first five
shots, its slender channel-forming ridges shearing off. Only that
catastrophic feature loss registers in the height correlation ($0.78$ to
$0.65$), as it does in $upright(R Q)_d$ ($0.79$ to $0.75$ before the
record stops). This bears on the flat height-based records in the
literature. A profile correlation ratio of $0.74$, $0.75$ and $0.74$ at
shots 10, 20 and 30 \[28\] is consistent with a stable tool or with
an insensitive measure. A shape-sensitive metric is needed to tell a
stable tool from a degrading one.

#figure(image("figures/ch5_oversizing.svg"),
  caption: [
    Channel dimensions of the as-printed inserts (a,c,e) and their first
    moulded parts (b,d,f), by resin: (a,b)~floor width, (c,d)~its
    deviation from nominal and (e,f)~channel depth. Nominal values are
    dashed; error bars in (e,f) are the along-channel standard deviation
    of the per-slice depths.
  ]
)
<fig:oversizing>

The drift has the geometric form the sidewall-sensitivity argument
predicts, and the panels make the chain of evidence explicit. In R10K
(Fig.~@fig:lifetime\(b)) the across-channel component
$upright(R Q)_(d y)$ falls in step with $upright(R Q)_d$, from $0.93$ to
$0.81$, while the mean wall angle grows from $11.9^compose$ as printed
to $18.6^compose$ at shot $20$. In HT (Fig.~@fig:lifetime\(a))
$upright(R Q)_(d y)$ holds near $0.90$ and the wall angle, after its
step in the first shot, stays between $12.1^compose$ and $13.7^compose$.
The R10K walls wear to a shallower slope as a whole, their floor-corner
rounding even falling from $25$ to 17~μm, while the height correlation
holds above $0.93$. Here, tool wear appeared as a sidewall phenomenon
that the slope-sensitive metrics registered and the height correlation
did not. The drift is not uniform across the channel sizes. The 100 to
600~μm R10K channels fall to between $0.64$ and $0.73$ by shot $20$. The
1000~μm channel, the widest and shallowest, is the most durable at
$0.82$. HT is flat at every width, all five staying within $0.02$ of
their shot-1 values.

The dimensional and roughness measures then quantify the consequence
(Fig.~@fig:lifetime\(c)--(e)). By shot $20$ the R10K floors have
narrowed by $41 plus.minus 19$~µm (mean $plus.minus$ standard deviation
over the widths; $16$ to 63~μm, the 200 and 300~μm channels losing
most). Their depth has fallen by $22 plus.minus 9$~µm. The HT floor
widths, by contrast, stay within 5~μm and the HT depths within 10~μm of
their as-printed values throughout the run. The channel-floor roughness
follows the same split. HT holds $S_a$ near 2.7~μm throughout, while the
R10K mean rises from $3.3$ to 5.8~μm. The rise is carried by the three
narrowest channels ($7$ to 9~μm at shot $20$); the 600 and 1000~μm
floors do not roughen. The peak-to-valley height $S_z$ of those narrow
R10K floors grows from about $27$ to between $57$ and 71~μm. HT stays
near 21~μm, except for a single localised value of 53~μm at the 600~μm
channel at shot $20$. This value is consistent with local damage
preceding the eventual fracture of the insert body, but it is not by
itself an early-warning criterion.

Read together, the panels track the degradation at several levels of
detail. $upright(R Q)_d$ is the first indicator to move. It registers
the R10K drift at shot $5$ ($0.90$ to $0.87$, beyond the $0.02$
interpretation bound), when the floor has narrowed by 11~μm and the
roughness shows no sustained rise. It also grades how far the tool has
departed from its as-printed state. $upright(R Q)_(d y)$ and the wall
angle locate the change at the sidewalls, and the per-width values show
which features go first. The width, depth and roughness measures give
the dimensional and surface consequences that a specification can be
written against. No single one would have sufficed: the height
correlation stays above $0.93$ throughout, and a sustained roughness
rise appears only at shot $20$.

== Dimensional fidelity
<sec:res-print>
Because $upright(R Q)_d$ discards absolute size, the dimensions
extracted from the same scans are read alongside it as the complementary
diagnosis. The chain resolves into two steps, CAD to insert (printing)
and insert to part (moulding). The dominant dimensional deviation is
introduced at the print stage, not at moulding (Table~S4.1 in the
supplementary material). Channel width is systematically oversized in
printing, and the effect is strongest for the narrowest channels. The
nominal 100~μm channel prints to about $195$, $213$, and 171~μm in HT,
White, and R10K, respectively. Moulding, by contrast, is dimensionally
faithful for the resins that mould well. The HT and R10K parts track
their own inserts' floor width to within 6~μm (at most $2.9 thin %$),
with one sign per resin: the HT parts come out $3$ to 5~μm wider than
their inserts and the R10K parts $4$ to 6~μm narrower, at every width.
Channel depth stays close to the 300~μm nominal ($269$ to 311~μm across
all inserts and parts). The White parts, whose replication fails, depart
from their inserts in floor width by up to 78~μm (Table~S4.1). Two
practical implications are suggested (Fig.~@fig:oversizing). First,
small-feature fidelity points to compensating the width at the print
stage, where the deviation originates, rather than by tuning the
moulding cycle. Such compensation is an established practice in
precision additive manufacturing \[44\] and has been applied to SLA
mould inserts as fixed height and width offsets \[5\]. Second,
since moulding copied whatever the print produced for these resins,
optimisation effort appears best directed at the print step. Resolved by
resin (Fig.~@fig:oversizing\(a)--(d)), the oversizing is systematic
rather than material-specific. It decays with nominal width in the same
way for all three resins, from $71$ to $113 thin %$ at 100~μm to within
$plus.minus 6 thin %$ at 1000~μm. White prints the widest and the
glass-filled R10K the narrowest; R10K comes within $2 thin %$ of nominal
at 600~μm and prints $1.5 thin %$ narrow at 1000~μm. Each moulded part
follows its own insert rather than the nominal.

Depth behaves differently from width (Fig.~@fig:oversizing\(e,f)). It
varies much less with nominal width, because the feature height is set
by the build direction rather than by the in-plane resolution that
governs the printed width. It carries no systematic oversizing. The
printed inserts span $274$ to 311~μm about the 300~μm nominal, with
resin means of $299$ (HT), $306$ (White), and 292~μm (R10K). The
clearest departure is the R10K 100~μm channel, whose insert and part
read $274$ and 269~μm. The narrowest, highest-aspect feature of the
glass-filled resin is the one that fills least completely. Moulding
again copies whatever the print produced: the part depth tracks its own
insert to within 7~μm for every condition. Depth thus supports the
conclusion drawn from width, that the print stage sets the dimensional
envelope. The longitudinal variability of depth is small, at most 4~μm
across the conditions that satisfy the depth quality check. The single
excluded condition is a White part whose sidewall dropout leaves too few
valid slices for a meaningful spread. Because depth and width respond to
different aspects of the process, neither alone characterises the
feature. This is the practical case for a metric that grades the whole
cross-section at once, from the same scan that yields the dimensions.

== Areal roughness transfer
<sec:res-roughness>
The three resins present distinct as-printed channel-floor finishes
(Table~@tab:roughness\; per channel in Table~S5.1). Among the inserts,
HT prints the smoothest floor ($S_a = 2.69$, range $2.29$--3.08~μm over
the five widths). White and R10K are similar but rougher ($3.22$ and
3.32~μm). R10K also shows the largest width-to-width variation (range
$2.62$--4.59~μm). Its highly glass-filled formulation may contribute,
since dispersed filler particles can modify resin rheology, light
scattering, and local surface formation during printing. This
interpretation remains tentative, because filler content was not varied
independently. The flat field follows the same resin ordering as the
floor ($S_a$ of $2.33$, $4.38$, and 3.35~μm for HT, R10K, and White,
each with a standard deviation below 0.3~μm over the five widths). The
smooth HT surface is consistent with its vanishing layer-line signature.

#block[
#figure(
  align(center)[#table(
    columns: 4,
    align: (left,left,left,left,),
    table.header([], [], [Field], [],),
    table.hline(),
    [2-3 Resin], [Insert], [Part], [Insert],
    [HT], [ $plus.minus$ 0.29], [ $plus.minus$ 0.34], [ $plus.minus$ 0.15],
    [R10K], [ $plus.minus$ 0.86], [ $plus.minus$ 0.67], [ $plus.minus$ 0.27],
    [White], [ $plus.minus$ 0.40], [ $plus.minus$ 0.38], [ $plus.minus$ 0.19],
  )]
  , caption: [Areal roughness $S_a$ (μm) of the channel floor of the
  as-printed inserts and their first moulded parts, and of the insert
  field; mean $plus.minus$ one standard deviation over the five channel
  widths.]
  , kind: table
  ) <tab:roughness>
]
Moulding transfers this texture nearly one to one
(Table~@tab:roughness). The part channel-floor $S_a$ tracks its insert
for every resin: $2.35$ against 2.69~μm (HT), $3.36$ against 3.32~μm
(R10K), and $3.31$ against 3.22~μm (White). The per-channel transfer
ratio is $0.98$ on average ($0.87$, $1.02$, and $1.03$ by resin, the
part marginally smoother only for HT). The root-mean-square height $S_q$
transfers in the same proportion ($0.88$, $1.00$ and $1.09$ by resin).
The maximum height $S_z$ does so for HT and R10K ($0.96$ and $0.83$) but
doubles for the failed White parts. Surface finish therefore appears to
be inherited from the printed insert rather than generated in moulding,
consistent with height-based texture-transfer studies
\[18\]\[19\]. $upright(R Q)_d$ adds the shape information that
roughness statistics do not provide. A floor-finish specification is
therefore best placed on the insert.

== Layer-line periodicity and build orientation
<sec:res-layerlines>
The SLA layering leaves a deterministic texture that encodes the build,
and spectral analysis of areal topography \[45\] recovers it. The
along-channel spectrum of the insert floor and field shows a sharp peak
at $Delta x = 100 med upright("μ") upright("m")$ for the 50~μm-layer
resins, $16$ and $7$ times above the local background (the running
median over 25~μm of period) for R10K and White
(Fig.~@fig:layerlines\(b)). A layer of thickness $h$ built at an angle
$theta$ to the platform intersects the surface every
$Delta x = h \/ sin theta$ along the channel (Fig.~@fig:layerlines\(a)),
so the peak returns the build orientation as
$theta = arcsin \( h \/ Delta x \)$: $30.1^compose$ for both resins
against the $30^compose$ set in the slicer. A weaker subharmonic at
$2 Delta x = 200 med upright("μ") upright("m")$ is consistent with a
two-layer period: the hatch direction alternates between layers, so the
surface repeats every second layer as well. The 25~μm-layer HT print
shows no dominant line. Its strongest features, at $27$, $36$, $54$ and
100~μm, stand only two to three times above the background. The one at
54~μm lies where a 25~μm layer at $27.6^compose$ would place it but
cannot be singled out: the smoother print reduces the layer-line
signature to the level of the background, and the orientation is not
recoverable. The layer-line spectrum thus serves as a print-quality
fingerprint that records the build orientation and gauges print
smoothness, from the same scan used for $upright(R Q)_d$ and at no extra
measurement cost. It complements studies that relate the stair-step
texture of printed tooling to the build orientation through roughness
\[32\] or cusp-height geometry \[9\]. The peak ratios are
tabulated in Table~S9.1.

#figure(image("figures/ch5_layerlines.svg"),
  caption: [
    Layer lines and build orientation. (a)~Layer thickness $h$, build
    angle $theta$ and period $Delta x$. (b)~Along-channel power spectra
    of the printed inserts, normalised by the median of each full
    spectrum.
  ]
)
<fig:layerlines>

== Benchmark against other similarity measures
<sec:res-benchmark>
A natural question is whether an existing similarity measure would have
graded these data equally well. Table~@tab:benchmark (per pair in
Table~S7.1) answers it with the height correlation $upright(R Q)$ and
the reference measures $1 - D_s$, SSIM, GMSD and GMSM. The test sets are
the fifteen insert-to-part pairs, the synthetic wall-smoothing series
and the tool-degradation trajectories. Over the fifteen pairs every
measure ranks the channels broadly as $upright(R Q)_d$ does (Spearman
$\| rho_s \|$ from $0.72$ to $0.90$), because the failed White channels
dominate any ranking. The measures separate on the ten well-formed
channels. $upright(R Q)_d$ spreads them over $0.19$, whereas the height
correlation ($0.03$), SSIM ($0.04$), $1 - D_s$ ($0.07$) and the two
gradient-similarity poolings ($0.05$ and $0.02$) compress them into a
few hundredths. Every measure except $upright(R Q)_d$ and $1 - D_s$
places the R10K 600~μm channel above the HT 100~μm channel, although its
rim has rounded by about 30~μm relative to its insert. The extracted
sidewall geometry (Table~S4.1) and the error maps of Fig.~@fig:mech_maps
contradict this reversal. On the synthetic series all respond
monotonically to wall smoothing except $D_s$. $upright(R Q)_d$, however,
falls to $0.38$ at the largest scale, where SSIM stays at $0.80$ and
GMSM at $0.92$. Over the moulding run, the same-tool spread
$s_(upright(H T))$ is the standard deviation of each measure on the HT
insert, which held its shape after the first shot, across shots 1 to 20
and the five widths. The drift of the R10K insert is resolved at
fourteen times $s_(upright(H T))$ by $upright(R Q)_d$ and at fifteen
times by $D_s$. The height correlation and SSIM resolve it at six to
seven times, and GMSD and GMSM at two to three.

#block[
#figure(
  align(center)[#table(
    columns: 9,
    align: (left,left,center,center,center,center,center,center,center,),
    table.header([], [], table.cell(align: center, colspan: 4)[Fifteen
      insert-to-part
      pairs], [Synthetic], table.cell(align: center, colspan: 2)[R10K
      drift, shots 1 to 20],),
    table.hline(),
    [3-6 (lr)7-7 (lr)8-9
    Measure], [Bounded], [Range], [Spread], [$rho_s$], [Order], [$sigma = 200 med upright("μ") upright("m")$], [Change], [Change$\/ s_(upright(H T))$],
    [$upright(R Q)$, height correlation], [yes], [0.43 to
    0.99], [0.03], [0.72], [no], [0.60], [−0.05], [7],
    [$upright(R Q)_d$, this work], [yes], [0.17 to
    0.91], [0.19], [1], [yes], [0.38], [−0.18], [14],
    [$1 - D_s$, NIST difference], [no], [−43 to
    0.96], [0.07], [0.90], [yes], [0.30], [−0.26], [15],
    [SSIM, structural similarity], [yes], [0.75 to
    0.99], [0.04], [0.87], [no], [0.80], [−0.08], [6],
    [GMSD, gradient-similarity deviation], [yes], [0.04 to
    0.28], [0.05], [−0.88], [no], [0.18], [0.02], [2],
    [GMSM, gradient-similarity mean], [yes], [0.88 to
    0.99], [0.02], [0.82], [no], [0.92], [−0.02], [3],
  )]
  , kind: table
  )

]
Two conclusions follow. First, the two image-quality indices behave as
their design objectives predict. Both rate the perceived quality of an
image against a pristine reference. SSIM compares local means, variances
and covariance, so on height maps it inherits the saturation of the
height correlation. GMSD pools the pointwise gradient similarity by its
standard deviation because, for perceived quality, the spatial
non-uniformity of a distortion matters more than its mean. A tool that
degrades uniformly along its walls, as R10K does, therefore changes it
little, which is the case a wear metric should register. Neither
behaviour is a defect of the index; it follows from an objective
different from replication grading. Second, $D_s$ is the strongest
alternative for the moulding run, but for a different reason. It is
sensitive to amplitude by construction \[26\], and the R10K
drift is accompanied by a loss of depth and width. It is unbounded (the
White pairs reach $D_s = 44$) and does not separate the well-formed
channels. Its amplitude sensitivity would also register a uniform
shrinkage of the part, which the correlations by construction ignore.
$upright(R Q)_d$ is the only measure in the set that is bounded, grades
among good channels, agrees with the sidewall geometry on the example
pair and resolves the drift.

#figure(image("figures/ch5_sensitivity.svg"),
  caption: [
    Sensitivity to the analysis settings on the fifteen insert-to-part
    pairs, each setting varied alone; dotted lines mark the defaults.
    (a)~$upright(R Q)_d$ (filled) and $upright(R Q)$ (hollow) against
    the grid cell size $Delta$, mean per resin over the five widths.
    (b)~$upright(R Q)_d$ against the channel-interior fraction, mean
    $plus.minus$ standard deviation over the five widths.
  ]
)
<fig:sensitivity>

$upright(R Q)_d$ extends the one-axis slope residual of Loaldi et
al.~\[11\] to an isotropic, bounded correlation. It differs from
the height-based correlation metrics of replication accuracy
\[22\]\[24\]\[28\] and topography matching
\[23\]\[29\]\[30\] in the shape sensitivity that lets it
grade quality where a height correlation saturates. Gradient-based
similarity is also established outside surface metrology. Image-quality
assessment uses SSIM \[34\] and GMSD \[35\]. Image
registration uses the mean of the two directional gradient correlations
as a similarity measure \[46\], the construction of
$upright(R Q)_(d x)$ and $upright(R Q)_(d y)$. $upright(R Q)_d$ is
closest to these, but differs in what is pooled as well as in what is
compared. GMSD forms a pointwise similarity of two gradient-magnitude
maps and pools it by its standard deviation. It therefore measures how
uniformly an image is degraded rather than by how much.
$upright(R Q)_d$, by contrast, is the Pearson correlation of the two
magnitude maps, invariant to a positive affine rescaling of either. It
is evaluated over a channel-interior mask on registered height fields
and interpreted against the geometry of a microchannel. The contribution
claimed here is the definition, characterisation, and interpretation of
such a correlation as a replication-quality grade, together with the
tool that computes it, rather than the gradient operator. The benchmark
of Table~@tab:benchmark isolates that combination. None of its
ingredients reproduces it alone, and each alternative falls short in at
least one respect. The benchmark also marks the one case that
$upright(R Q)_d$ does not cover. A uniform loss of depth at constant
opening leaves it unchanged (Fig.~@fig:synthetic\(g)); there, the
amplitude-sensitive $D_s$, or the extracted depth itself, is the measure
to read.

#block[
#figure(
  align(center)[#table(
    columns: 9,
    align: (left,left,center,center,center,center,center,center,center,),
    [], [], table.cell(align: center, colspan: 4)[Fifteen insert-to-part
    pairs], [Synthetic], table.cell(align: center, colspan: 2)[R10K
    drift, shots 1 to 20],
    [Measure], [Bounded], [Range], [Spread], [$rho_s$], [Order], [$sigma = 200 med upright("μ") upright("m")$], [Change], [Change$\/ s_(upright(H T))$],
    [$upright(R Q)$, height correlation], [yes], [0.43 to
    0.99], [0.03], [0.72], [no], [0.60], [−0.05], [7],
    [$upright(R Q)_d$, this work], [yes], [0.17 to
    0.91], [0.19], [1], [yes], [0.38], [−0.18], [14],
    [$1 - D_s$, NIST difference], [no], [−43 to
    0.96], [0.07], [0.90], [yes], [0.30], [−0.26], [15],
    [SSIM, structural similarity], [yes], [0.75 to
    0.99], [0.04], [0.87], [no], [0.80], [−0.08], [6],
    [GMSD, gradient-similarity deviation], [yes], [0.04 to
    0.28], [0.05], [−0.88], [no], [0.18], [0.02], [2],
    [GMSM, gradient-similarity mean], [yes], [0.88 to
    0.99], [0.02], [0.82], [no], [0.92], [−0.02], [3],
  )]
  , caption: [Benchmark of similarity measures against
  $upright(R Q)_d$.]
  , kind: table
  ) <tab:benchmark>
]

== Sensitivity to the analysis parameters
<sec:res-sensitivity>
Slope quantities depend on the sampling interval at which the slope is
taken \[42\]. The numerical values reported above are therefore
those of $upright(R Q)_d \( Delta \)$ at
$Delta = 5 med upright("μ") upright("m")$ and the fixed analysis
settings. Of the settings varied (Fig.~@fig:sensitivity\; all sweeps in
Tables~S8.1 and S8.2), the grid cell size is the dominant parameter.
Coarsening it from 5 to 20~μm raises the mean $upright(R Q)_d$ of the
fifteen pairs from $0.65$ to $0.85$, and that of the HT channels from
$0.87$ to $0.99$. The fine texture that decorrelates between two scans
is then averaged away. Refining the cell to 3.5~μm, the resolution
limit, lowers the mean to $0.59$. This point is evaluated on clouds
thinned to 3~μm rather than 5~μm voxels, which would leave two fifths of
the 3.5~μm cells empty. The ranking is stable throughout: Spearman
$rho_s gt.eq 0.94$ against the default, and the HT 100~μm channel stays
above the R10K 600~μm channel at every cell size. The grading power,
however, grows monotonically as the cell shrinks. The spread of
$upright(R Q)_d$ among the ten well-formed channels is $0.23$ at 3.5~μm,
$0.19$ at 5~μm and $0.03$ at 20~μm, where a coarse gradient correlation
saturates. Nothing is gained by coarsening the grid. At 5~μm, the finest
cell the instrument's resolution fills without interpolation, the grid
sits at the fine end of the usable range. The R10K drift is resolved at
every cell size, at $9.9$ to $24$ times the HT spread.

The channel-interior fraction matters at its extremes. With no mask the
flat field dominates and the failed White channels fall to $0.02$. At
$0.4$ the walls are largely excluded and the R10K channels catch up with
HT ($0.884$ against $0.882$). Between $0.1$ and $0.2$ the resin means
move by less than $0.06$. A Gaussian filter of 5~μm changes nothing,
because it is the $sigma = Delta$ filter of the definition itself. A
10~μm filter lifts every value by about $0.09$ without changing the
order. Finally, a one-cell (5~μm) misregistration across the channel
changes the mean of the fifteen pairs by less than $0.005$ and the resin
means by at most $0.02$. Two cells cost $0.03$. Four cells (20~μm)
decorrelate the ranking from the default ($rho_s = 0.51$) and reverse
the example pair, the steep-walled HT channels suffering most. Two
conclusions follow. $upright(R Q)_d$ is comparable only at equal cell
size, so $Delta$, fixed here at 5~μm by the instrument's lateral
resolution, belongs to the definition. Registration to within about one
grid cell is a precondition, met here by the pipeline. Both conditions
are stated alongside every value reported in this paper.

Among the ten well-formed channels, the alternative channel-interior
masks (Table~S8.3) changed $upright(R Q)_d$ by at most $0.048$ and
preserved the ranking (Spearman $rho_s gt.eq 0.93$ against the default).
The HT 100~μm channel remained above the R10K 600~μm channel under every
mask, and the R10K moulding-run trajectory remained monotonic
(Table~S8.4). Differences became substantial only for the failed White
channels. For these, reference-only regions accounted for $8$ to
$22 thin %$ of the union of the two channel masks. Including these
regions reduced $upright(R Q)_d$ from $0.17$ to $0.39$ under the default
mask to $- 0.006$ to $0.096$ under the reference-defined mask. The
intersection mask therefore grades gradient correspondence within the
shared channel-interior footprint and under-weights geometry present on
only one surface. Such failures remain evident in the dimensions: the
White parts depart from their inserts in floor width by up to 78~μm.

== Scope and limitations
<sec:res-scope>
Although demonstrated here on injection moulding, the metric is not tied
to it. It operates on any pair of registered profilometry point clouds.
It can therefore in principle be applied to soft lithography, embossing,
nanoimprint and thermoforming, wherever a master is copied into a
polymer and the fidelity of microscale shape is to be graded. The height
maps may come from any instrument that returns an areal topography;
these applications remain to be demonstrated. Its open-source,
in-browser implementation may lower the barrier to adoption for
laboratories without dedicated metrology software or a licence for it.

Several limitations bound the present study. $upright(R Q)_d$ requires
the insert and part scans to be registered to a common frame to within
about one grid cell. It is defined at a stated cell size, here
$Delta = 5 med upright("μ") upright("m")$, across which values are not
comparable. The test artefact has straight channels only; curved,
branched and free-form microstructures remain to be tested. The resin
set is small ($n = 3$), chosen to span a quality range rather than to
sample the material space. With one insert per condition and discrete
measurement checkpoints, the degradation observations are trends within
the tested set rather than population estimates. No repeated scans
without an intervening moulding cycle were acquired. Measurement
repeatability is therefore bounded only from above, by the
intermediate-precision self-comparison of the rescanned inserts.
Replicate inserts and repeated scans would be needed to separate genuine
condition effects from fabrication and measurement scatter. The
$plus.minus$ values are standard deviations over widths or seeds, and
the longitudinal spreads are within-scan variation along a channel. The
agreements between insert, part and design dimensions are differences of
measured values. Measurement uncertainty was not evaluated, and the
$0.02$ interpretation bound comes from the analysis and the same-tool
scatter of one insert. The CAD values are design values without
tolerance limits, and no conformity assessment is made. Optical
profilometry drops out on the steepest sidewalls of the translucent
White parts: the valid fraction averages $92 thin %$ over the
comparisons but falls to $66 thin %$ there. Counting only the cells
measured on both surfaces changes $upright(R Q)_d$ by at most $0.016$.
The per-pixel error maps therefore use the opaque resins, and White is
graded through the channel-interior aggregate; an opaque part material
would remove this restriction.

= Conclusions
<sec:conclusions>
Replication quality in mould-based microfabrication is usually judged
from a width or depth ratio at one cross-section. Such a ratio misses
the sidewall shape and depends on where and how the section is measured.
This work presented a workflow that assesses the whole channel from 3D
scans of a master and its replica, without sectioning. We developed
open-source software that implements it.

The workflow characterises a single channel and compares surface pairs
along the fabrication chain: an insert against its design, a part
against its insert, and an insert against its initial state over a
moulding run. In a comparison, $upright(R Q)_d$, the correlation of the
two slope maps, tells whether the shape of the channel was reproduced.
The extracted width, depth and wall angle tell whether its size was, and
the height and slope error maps show where a deviation lies.

These outputs can support practical decisions. Ranking insert resins by
$upright(R Q)_d$, read against the level that an insert reaches against
its own rescan, identifies the resin that replicates the channel best.
Following $upright(R Q)_d$ over a moulding run shows when an insert
starts to wear; here it was the first indicator to move, at shot $5$.
Comparing the insert with its design, and the part with its insert,
shows whether a deviation should be corrected at the printing or at the
moulding step; for the smallest channels it arose in printing.

The evidence supports these uses. On synthetic channels with known
ground truth, $upright(R Q)_d$ fell monotonically as the sidewalls were
rounded, more steeply than the height correlation. It was invariant to
uniform amplitude scaling and carried a registration bias below $0.02$.
Across fifteen insert-to-part pairs in three SLA resins, it ranged from
$0.17$ to $0.91$. The height correlation placed the ten well-formed
channels within $0.03$ of each other and ordered one pair against the
independently extracted sidewall geometry. Established image-similarity
indices behaved like the height correlation. For these channels
$upright(R Q)_d$ was governed by the sidewalls. Over a twenty-shot run
it separated an insert that settled in the first shot and then held,
flat at $0.88$ against its as-printed state, from a degrading one
($0.90$ to $0.72$) whose height correlation stayed above $0.93$\; the
wall angle tied the drift to wear of the sidewalls and recorded the
settling, which width and depth did not.

The workflow requires only registered areal topographies of a master and
its replica, and it can in principle be applied to other mould-based
processes. Its values are defined at a stated grid cell size, here 5~μm,
and are comparable only at equal cell size. It also requires
registration to within about one grid cell. The results were obtained on
straight channels, with one insert per condition and without a formal
evaluation of measurement uncertainty. Curved and free-form features,
replicate inserts and repeated scans are the next steps.

#heading(level: 1, numbering: none)[Data and code availability]
<data-and-code-availability>
The point clouds analysed in this work and the Microchannel and
Replication Quality Analyzer (MaRQ, version 1.0), open-source software,
are archived at \
#link("https://doi.org/10.5281/zenodo.22813916"). Additional data are
available from the corresponding authors on reasonable request.

#heading(level: 1, numbering: none)[Funding]
<funding>
This work was funded by TÜBİTAK under grant number 22AG008 within the
scope of the MAESTRO project. This work was also funded by the European
Union's Horizon Europe Programme under grant agreement N°~101079473
within the scope of the OrChESTRA project.

#heading(level: 1, numbering: none)[Declaration of competing interest]
<declaration-of-competing-interest>
The authors declare that they have no known competing financial
interests or personal relationships that could have appeared to
influence the work reported in this paper.

#heading(level: 1, numbering: none)[Declaration of generative AI and
AI-assisted technologies in the manuscript preparation process]
<declaration-of-generative-ai-and-ai-assisted-technologies-in-the-manuscript-preparation-process>
The authors used AI-assisted technologies in order to assist with
editing the manuscript text. After using this tool, the authors reviewed
and edited the content as needed and take full responsibility for the
content of the published article.

#heading(numbering: none)[References]

\[1\] A.~Naderi, N.~Bhattacharjee, A.~Folch, Digital manufacturing for
microfluidics, Annual Review of Biomedical Engineering 21 (2019)
325--364.
#link("https://doi.org/10.1146/annurev-bioeng-092618-020341")[doi:10.1146/annurev-bioeng-092618-020341].

\[2\] J.~Charmet, R.~Rodrigues, E.~Yildirim, P.~K. Challa, B.~Roberts,
R.~Dallmann, Y.~Whulanza, Low-cost microfabrication tool box,
Micromachines 11~(2) (2020) 135.
#link("https://doi.org/10.3390/mi11020135")[doi:10.3390/mi11020135].

\[3\] S.~Rahmati, P.~Dickens, Rapid tooling analysis of
stereolithography injection mould tooling, International Journal of
Machine Tools and Manufacture 47~(5) (2007) 740--747.
#link("https://doi.org/10.1016/j.ijmachtools.2006.09.022")[doi:10.1016/j.ijmachtools.2006.09.022].

\[4\] C.~A. Griffiths, S.~S. Dimov, H.~Hirshy, S.~Scholz, S.~Fischer,
M.~Spitzbart, Prototype tooling for producing small series of polymer
microparts, Proceedings of the Institution of Mechanical Engineers, Part
B: Journal of Engineering Manufacture 225~(12) (2011) 2189--2205.
#link("https://doi.org/10.1177/2041297510393799")[doi:10.1177/2041297510393799].

\[5\] N.~Convery, I.~Samardzhieva, J.~M. Stormonth-Darling, S.~Harrison,
G.~J. Sullivan, N.~Gadegaard, 3D printed tooling for injection molded
microfluidics, Macromolecular Materials and Engineering 306~(11) (2021)
\2100464.
#link("https://doi.org/10.1002/mame.202100464")[doi:10.1002/mame.202100464].

\[6\] P.~D. Menezes, A.~Hunter, T.~Dickson, S.~Hecht, C.~Kumar,
M.~Busek, S.~Krauss, N.~Gadegaard, Scalable, transparent, and micro:
3D-printed rapid tooling for injection molded microfluidics, Advanced
Engineering Materials 26 (2024) 2400276.
#link("https://doi.org/10.1002/adem.202400276")[doi:10.1002/adem.202400276].

\[7\] H.~Khoo, W.~S. Allen, N.~Arroyo-Currás, S.~C. Hur, Rapid
prototyping of thermoplastic microfluidic devices via SLA 3D printing,
Scientific Reports 14 (2024) 17646.
#link("https://doi.org/10.1038/s41598-024-68761-5")[doi:10.1038/s41598-024-68761-5].

\[8\] B.~Venzac, S.~Deng, Z.~Mahmoud, A.~Lenferink, A.~Costa, F.~Bray,
C.~Otto, C.~Rolando, S.~Le~Gac, PDMS curing inhibition on 3D-printed
molds: Why? Also, how to avoid it?, Analytical Chemistry 93~(19) (2021)
7180--7187.
#link("https://doi.org/10.1021/acs.analchem.0c04944")[doi:10.1021/acs.analchem.0c04944].

\[9\] M.~D. Poskus, T.~Wang, Y.~Deng, S.~Borcherding, J.~Atkinson, I.~K.
Zervantonakis, Fabrication of 3D-printed molds for
polydimethylsiloxane-based microfluidic devices using a liquid crystal
display-based vat photopolymerization process: Printing quality, drug
response and 3D invasion cell culture assays, Microsystems &
Nanoengineering 9 (2023) 140.
#link("https://doi.org/10.1038/s41378-023-00607-y")[doi:10.1038/s41378-023-00607-y].

\[10\] H.~N. Hansen, R.~J. Hocken, G.~Tosello, Replication of micro and
nano surface geometries, CIRP Annals 60~(2) (2011) 695--714.
#link("https://doi.org/10.1016/j.cirp.2011.05.008")[doi:10.1016/j.cirp.2011.05.008].

\[11\] D.~Loaldi, F.~Regi, D.~Li, N.~Giannekas, M.~Calaon, Y.~Zhang,
G.~Tosello, Product fingerprints for the evaluation of tool/polymer
replication quality in injection molding at the micro/nano scale,
Nanomanufacturing and Metrology 4~(4) (2021) 278--288.
#link("https://doi.org/10.1007/s41871-021-00105-7")[doi:10.1007/s41871-021-00105-7].

\[12\] M.~Gülçür, J.-M. Romano, P.~Penchev, T.~Gough, E.~Brown,
S.~Dimov, B.~Whiteside, A cost-effective process chain for thermoplastic
microneedle manufacture combining laser micro-machining and
micro-injection moulding, CIRP Journal of Manufacturing Science and
Technology 32 (2021) 311--321.
#link("https://doi.org/10.1016/j.cirpj.2021.01.015")[doi:10.1016/j.cirpj.2021.01.015].

\[13\] B.~Stampone, E.~Deniz, A.~Foscarini, S.~Turco, M.~S. Chiriacò,
F.~Ferrara, L.~Giorleo, G.~Trotta, Rapid tooling for microinjection
moulding of proof-of-concept microfluidic device: Resin insert
capability and preliminary validation, Applied Sciences 14~(8) (2024)
\3157.
#link("https://doi.org/10.3390/app14083157")[doi:10.3390/app14083157].

\[14\] T.~Evens, S.~Castagne, D.~Seveno, A.~Van~Bael, Comparing the
replication fidelity of solid microneedles using injection compression
moulding and conventional injection moulding, Micromachines 13~(8)
(2022) 1280.
#link("https://doi.org/10.3390/mi13081280")[doi:10.3390/mi13081280].

\[15\] Y.~Zhang, D.~B. Pedersen, A.~S. Gøtje, M.~Mischkot, G.~Tosello, A
soft tooling process chain employing additive manufacturing for
injection molding of a 3D component with micro pillars, Journal of
Manufacturing Processes 27 (2017) 138--144.
#link("https://doi.org/10.1016/j.jmapro.2017.04.027")[doi:10.1016/j.jmapro.2017.04.027].

\[16\] D.~Dempsey, S.~McDonald, D.~Masato, C.~Barry, Characterization of
stereolithography printed soft tooling for micro injection molding,
Micromachines 11~(9) (2020) 819.
#link("https://doi.org/10.3390/mi11090819")[doi:10.3390/mi11090819].

\[17\] X.~Ma, R.~Li, Z.~Jin, Y.~Fan, X.~Zhou, Y.~Zhang, Injection
molding and characterization of PMMA-based microfluidic devices,
Microsystem Technologies 26 (2020) 1317--1324.
#link("https://doi.org/10.1007/s00542-019-04662-2")[doi:10.1007/s00542-019-04662-2].

\[18\] L.~Piccolo, K.~Puleo, M.~Sorgato, G.~Lucchetta, D.~Masato,
Modeling the replication of submicron-structured surfaces by micro
injection molding, Materials and Design 198 (2021) 109272.
#link("https://doi.org/10.1016/j.matdes.2020.109272")[doi:10.1016/j.matdes.2020.109272].

\[19\] J.~Vera, A.~C. Brulez, E.~Contraires, M.~Larochette,
N.~Trannoy-Orban, M.~Pignon, C.~Mauclair, S.~Valette, S.~Benayoun,
Factors influencing microinjection molding replication quality, Journal
of Micromechanics and Microengineering 28 (2018) 015004.
#link("https://doi.org/10.1088/1361-6439/aa9a4e")[doi:10.1088/1361-6439/aa9a4e].

\[20\] D.~G.~K. Aboud, N.~R. Demarquette, D.~Rodrigue, A.-M. Kietzig,
Considering microtexture geometry to improve micro-injection molding
fidelity, Journal of Micromechanics and Microengineering 35~(6) (2025)
\065009.
#link("https://doi.org/10.1088/1361-6439/ade160")[doi:10.1088/1361-6439/ade160].

\[21\] F.~Baruffi, M.~Gülçür, M.~Calaon, J.-M. Romano, P.~Penchev,
S.~Dimov, B.~Whiteside, G.~Tosello, Correlating nano-scale surface
replication accuracy and cavity temperature in micro-injection moulding
using in-line process control and high-speed thermal imaging, Journal of
Manufacturing Processes 47 (2019) 367--381.
#link("https://doi.org/10.1016/j.jmapro.2019.08.017")[doi:10.1016/j.jmapro.2019.08.017].

\[22\] T.~V. Vorburger, J.-F. Song, W.~Chu, L.~Ma, S.~H. Bui, A.~Zheng,
T.~B. Renegar, Applications of cross-correlation functions, Wear
271~(3--4) (2011) 529--533.
#link("https://doi.org/10.1016/j.wear.2010.03.030")[doi:10.1016/j.wear.2010.03.030].

\[23\] Y.~Zheng, X.~Zhang, S.~Wang, Q.~Li, H.~Qin, B.~Li, Similarity
evaluation of topography measurement results by different optical
metrology technologies for additive manufactured parts, Optics and
Lasers in Engineering 126 (2020) 105920.
#link("https://doi.org/10.1016/j.optlaseng.2019.105920")[doi:10.1016/j.optlaseng.2019.105920].

\[24\] C.~Kumar, A.~Palacios, V.~A. Surapaneni, G.~Bold, M.~Thielen,
E.~Licht, T.~E. Higham, T.~Speck, V.~Le~Houérou, Replicating the
complexity of natural surfaces: technique validation and applications
for biomimetics, ecology and evolution, Philosophical Transactions of
the Royal Society A: Mathematical, Physical and Engineering Sciences
377~(2138) (2019) 20180265.
#link("https://doi.org/10.1098/rsta.2018.0265")[doi:10.1098/rsta.2018.0265].

\[25\] B.~Çetin, A.~K. Koska, M.~Erdal, Warpage characterization of
microchannels fabricated by injection molding, Journal of Micro- and
Nano-Manufacturing 3~(2) (2015) 021005.
#link("https://doi.org/10.1115/1.4029841")[doi:10.1115/1.4029841].

\[26\] T.~V. Vorburger, J.~Song, N.~Petraco, Topography measurements and
applications in ballistics and tool mark identifications, Surface
Topography: Metrology and Properties 4~(1) (2015) 013002.
#link("https://doi.org/10.1088/2051-672X/4/1/013002")[doi:10.1088/2051-672X/4/1/013002].

\[27\] X.~Zhang, Y.~Zheng, V.~Suresh, S.~Wang, Q.~Li, B.~Li, H.~Qin,
Correlation approach for quality assurance of additive manufactured
parts based on optical metrology, Journal of Manufacturing Processes 53
(2020) 310--317.
#link("https://doi.org/10.1016/j.jmapro.2020.02.037")[doi:10.1016/j.jmapro.2020.02.037].

\[28\] J.~Perris, C.~Kumar, Y.~Xu, M.~Tassieri, M.~E. Kartal,
N.~Gadegaard, D.~M. Mulvihill, 3D printing and rapid replication of
advanced numerically generated rough surface topographies in numerous
polymers, Advanced Engineering Materials 25~(1) (2023) 2200832.
#link("https://doi.org/10.1002/adem.202200832")[doi:10.1002/adem.202200832].

\[29\] S.~Wang, X.~Zhang, Y.~Zheng, B.~Li, H.~Qin, Q.~Li, Similarity
evaluation of 3D surface topography measurements, Measurement Science
and Technology 32~(12) (2021) 125003.
#link("https://doi.org/10.1088/1361-6501/ac1b41")[doi:10.1088/1361-6501/ac1b41].

\[30\] Y.~Jiang, S.~Wang, H.~Qin, B.~Li, Q.~Li, Similarity
quantification of 3D surface topography measurements, Measurement 186
(2021) 110207.
#link("https://doi.org/10.1016/j.measurement.2021.110207")[doi:10.1016/j.measurement.2021.110207].

\[31\] E.~Yildirim, M.~K. Ulku, M.~A.~S. Arikan, Utilization of
cross-correlation function for assessment of replication quality in
ultrasonic embossing of microchannels on polymethyl methacrylate,
Polymer Engineering and Science 64~(7) (2024) 3227--3242.
#link("https://doi.org/10.1002/pen.26764")[doi:10.1002/pen.26764].

\[32\] G.~Keane, G.~Yan, B.~S.~H. Tie, A.~Mannion, A.~V. Healy, D.~M.
Devine, Assessing surface topographies of 3D-printed polymer tooling:
Implications for enhanced injection moulding performance, Advances in
Polymer Technology 2025 (2025) 7205547.
#link("https://doi.org/10.1155/adv/7205547")[doi:10.1155/adv/7205547].

\[33\] G.~Tosello, X.~Ardangelou, C.~T. Komninos, V.~K. Nadimpalli,
M.~Calaon, K.~Liltorp, M.~M. Bjørnskov, S.~Gasparin, Areal surface
texture analysis of porosity replication from tool steel inserts into
injection moulded acrylonitrile butadiene styrene parts, Proceedings of
the euspen Special Interest Group Meeting: Metrology and Properties of
Surfaces / Structured & Freeform Surfaces, London, UK, conference paper
(unpaginated); oral papers of this meeting are to appear in Surface
Topography: Metrology and Properties (Jul. 2026).

\[34\] Z.~Wang, A.~C. Bovik, H.~R. Sheikh, E.~P. Simoncelli, Image
quality assessment: From error visibility to structural similarity, IEEE
Transactions on Image Processing 13~(4) (2004) 600--612.
#link("https://doi.org/10.1109/TIP.2003.819861")[doi:10.1109/TIP.2003.819861].

\[35\] W.~Xue, L.~Zhang, X.~Mou, A.~C. Bovik, Gradient magnitude
similarity deviation: A highly efficient perceptual image quality index,
IEEE Transactions on Image Processing 23~(2) (2014) 684--695.
#link("https://doi.org/10.1109/TIP.2013.2293423")[doi:10.1109/TIP.2013.2293423].

\[36\] K.~Pearson, Note on regression and inheritance in the case of two
parents, Proceedings of the Royal Society of London 58 (1895) 240--242.
#link("https://doi.org/10.1098/rspl.1895.0041")[doi:10.1098/rspl.1895.0041].

\[37\] R.~Leach (Ed.), Characterisation of Areal Surface Texture,
Springer, Berlin, Heidelberg, 2013.
#link("https://doi.org/10.1007/978-3-642-36458-7")[doi:10.1007/978-3-642-36458-7].

\[38\] R.~Danzl, F.~Helmli, S.~Scherer, Focus variation -- a robust
technology for high resolution optical 3D surface metrology, Strojniški
vestnik -- Journal of Mechanical Engineering 57~(3) (2011) 245--256.
#link("https://doi.org/10.5545/sv-jme.2010.175")[doi:10.5545/sv-jme.2010.175].

\[39\] Bruker Alicona, InfiniteFocus G5: Optical 3D measurement and
surface finish system (product specification),
#link("https://www.alicona.com/en/products/infinitefocus/"), accessed
June 2026 (2023).

\[40\] K.~Walton, L.~Fleming, M.~Goodhand, R.~Racasan, W.~Zeng, High
fidelity replication of surface texture and geometric form of a high
aspect ratio aerodynamic test component, Surface Topography: Metrology
and Properties 4~(2) (2016) 025003.
#link("https://doi.org/10.1088/2051-672X/4/2/025003")[doi:10.1088/2051-672X/4/2/025003].

\[41\] JCGM, International vocabulary of metrology -- basic and general
concepts and associated terms (VIM), 3rd edition, JCGM 200:2012, Joint
Committee for Guides in Metrology, BIPM, Sèvres (2012).

\[42\] J.~Lemesle, C.~Moreau, R.~Deltombe, J.~Martin, F.~Blateyron,
M.~Bigerelle, C.~A. Brown, Height fluctuations and surface gradients in
topographic measurements, Materials 16~(15) (2023) 5408.
#link("https://doi.org/10.3390/ma16155408")[doi:10.3390/ma16155408].

\[43\] L.~Liu, B.~Li, H.~Qin, Q.~Li, Measurement studies utilizing
similarity evaluation between 3D surface topography measurements,
Mathematics 12~(5) (2024) 669.
#link("https://doi.org/10.3390/math12050669")[doi:10.3390/math12050669].

\[44\] S.~Afazov, A.~Okioga, A.~Holloway, W.~Denmark, A.~Triantaphyllou,
S.-A. Smith, L.~Bradley-Smith, A methodology for precision additive
manufacturing through compensation, Precision Engineering 50 (2017)
269--274.
#link("https://doi.org/10.1016/j.precisioneng.2017.05.014")[doi:10.1016/j.precisioneng.2017.05.014].

\[45\] T.~D.~B. Jacobs, T.~Junge, L.~Pastewka, Quantitative
characterization of surface topography using spectral analysis, Surface
Topography: Metrology and Properties 5~(1) (2017) 013001.
#link("https://doi.org/10.1088/2051-672X/aa51f8")[doi:10.1088/2051-672X/aa51f8].

\[46\] G.~P. Penney, J.~Weese, J.~A. Little, P.~Desmedt, D.~L.~G. Hill,
D.~J. Hawkes, A comparison of similarity measures for use in 2-D-3-D
medical image registration, IEEE Transactions on Medical Imaging 17~(4)
(1998) 586--595.
#link("https://doi.org/10.1109/42.730403")[doi:10.1109/42.730403].
