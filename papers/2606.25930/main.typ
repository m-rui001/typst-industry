// Djemmah et al., arXiv:2606.25930v1. Adapted from the authors’ LaTeX under CC BY 4.0.
// https://arxiv.org/abs/2606.25930v1 | https://creativecommons.org/licenses/by/4.0/
#set math.equation(numbering: "(1)")
#set heading(numbering: "1.1")

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
  title: [Impact of sintering conditions on the dielectric properties of
TiO$""_2$ ceramics for metamaterials applications at terahertz
frequencies.],
  authors: (
    ( name: [Djihad Amina Djemmah],
      affiliation: "",
      email: "" ),
    ( name: [Delphine Gourdonnaud],
      affiliation: "",
      email: "" ),
    ( name: [Fayçal Bouamrane],
      affiliation: "",
      email: "" ),
    ( name: [Jean-François Roux],
      affiliation: "",
      email: "" ),
    ( name: [Pierre-Marie Geffroy],
      affiliation: "",
      email: "" ),
    ( name: [Éric Akmansoy],
      affiliation: "",
      email: "" ),
    ),
  abstract-title: [Abstract],
  abstract: [Titanium dioxyde (TiO$""_2$) is a promising dielectric
material for the realization of metamaterials operating in the terahertz
(THz) range. Indeed, these necessitate a high permittivity and low loss
material. In this paper, we compare the processes of fabrication and the
results of characterisation of bulk TiO$""_2$ pellets. From the results
of this characterization, we have numerically designed 2D all dielectric
metamaterials (ADM) showing that they may exhibit negative or near-zero
effective index. Our previous simulations show that the relative
permittivity $epsilon'$ has to be around 100, while the loss tangent
$tan delta$ has to be lower than $0.02$. We have thus compared
conventional sintering (CS) #emph[vs] spark plasma sintering (SPS), and
investigated the effect of post-sintering annealing on the loss to
satisfy these two criteria. The samples were characterized by THz Time
Domain Spectroscopy (THz-TDS). One of the samples exhibits a loss
tangent as low as $tan delta = 6 dot.op 10^(- 3)$, with a permittivity
$epsilon' = 103$. These results highlight the importance of the
fabrication process on the EM properties of bulk TiO$""_2$, and
demonstrate that it is a promising material for the development of
metamaterial in theTHz band.

],
  pagenumbering: "1",
  cols: 1,
  doc,
)


#block[
#block[
Ceramics processes, TiO$""_2$, THz-Time Domain Spectroscopy,
All-Dielectric Metamaterials.

]
]
#align(center)[
Centre de Nanosciences et Nanotechnologies, CNRS UMR 9001, Université Paris-Saclay, Palaiseau, France Centre Européen de la Céramique, CNRS UMR 7315, Université de Limoges, Limoges, France Laboratoire Albert Fert, CNRS UMR 137, Thales, Université Paris-Saclay, Palaiseau, France Centre de Radiofréquences, Optique et Micro-nanoélectronique des Alpes, CNRS UMR 5130, Université Savoie Mont Blanc, Le Bourget du Lac, France
]

= Introduction
<introduction>
Ceramics are of great interest as the realization of metamaterials (MM)
operating in the THz range is aimed. All-Dielectric Metamaterial (ADM)
are perfectly suited to this frequency range\[1,2\], unlike traditional
MMs whose unit cell is metallic and suffer from increasing ohmic loss
with the frequency. Moreover, the unit cell of ADMs, which consists of
two High Permittivity Resonators (HPR), is of simple geometry. As the
incident EM field illuminates the ADM, the first two Mie resonances are
excited, which may lead to negative or near-zero effective index\[3,4\].
To sustain these resonances, the material of the HPR must have a high
permittivity and low loss, their dimensions being sub-wavelength.
TiO$""_2$ and SrTiO$""_3$ are good candidates to satisfy these two
conditions. TiO$""_2$ provides a good compromise between high
permittivity and low loss, notably because if its permittivity is lower
than that of SrTiO$""_3$, its first optical phonon $omega_(T_(O_1))$ is
at 5.7THz, whereas that of SrTiO$""_3$ is at 2.7THz\[5--7\]. This means
that the loss of TiO$""_2$ are lower in the considered frequency range.
About TiO$""_2$, our previous simulations show that to get the first two
Mie resonances, two criteria --- high permittivity
($epsilon_r tilde.eq 100$) and low loss ($tan delta lt.eq 0.02$) ---
have to be satisfied\[8,9\].

We therefore fabricated bulk TiO$""_2$ pellets by two different
processes: conventional sintering (CS) and spark plasma sintering (SPS),
and compared their dielectric properties. We also investigated the
effect of post-sintering annealing, showing its influence on the EM
properties of the material. We characterized the pellets by the means of
THz Time Domain Spectroscopy (THz-TDS), and then numerically designed 2D
ADMs from these experimental results: negative or near-zero effective
index is achievable.

= Methods
<methods>
== Fabrication of the ceramics
<fabrication-of-the-ceramics>
=== Starting TiO$""_2$ powders
<starting-tio_2-powders>
Fifty five different samples have been fabricated to address the
dependance of the EM properties (permittivity and loss) on several
parameters: density, type of sintering, sintering and annealing
temperatures. These sintering studies of TiO$""_2$ were conducted using
commercial powders, whose particle size $D_(B E T)$ was determined from
the specific surface $S_(B E T)$ with the relative density
$rho = 4.23 #h(0em) g dot.op c m^(- 3)$ of TiO$""_2$#emph[via] the
Brunauer-Emmett-Teller' method (BET)\[10\]. Before sintering, the
commercial powders need to be compacted into green parts by uniaxial
pressing.

=== Elaboration and sintering of the TiO$""_2$ samples
<elaboration-and-sintering-of-the-tio_2-samples>
Bulk TiO$""_2$ ceramic was shaped by two different sintering processes
from the green parts: conventional sintering (CS) and Spark Plasma
Sintering (SPS). Eighteen samples were conventionally sintered, while
thirty seven were sintered by SPS. During the former process, the
TiO$""_2$ powder is first compacted in a 10mm diameter die under a 50
MPa uniaxial pressure to produce green compacts. These have been then
sintered at various high temperatures: T$""_(C S)$=1300 , 1350 , 1400 ,
1450 , 1500  and 1550  for about two hours, under argon atmosphere
corresponding to the oxygen partial pressure
$p \( upright(O)_2 \) = 2.1 dot.op 10^(- 4)$Pa. During the latter
process, the sintering of the TiO$""_2$ powder, placed in 8mm graphite
die, is rapidly performed by a high intensity pulsed electric current
(about 10kA). A 10MPa pressure is applied along the vertical axis of the
sample by two pistons during 5 min in a vacuum chamber. The atmosphere
is neutral, namely argon at a pression of a few Pascal. The temperature
is controlled #emph[via] an IR pyrometer. SPS allows to sinter the
powder at lower temperatures than conventional sintering and is a
shorter process. It has been carried out at various temperatures:
T$""_(S P S)$=1100 , 1150 , 1200  and 1300 . A Dr. Sinter 825 SPS
machine (by Fuji Electronics Industrial Co. Ltd) was used.

After the sintering, some of the samples have been annealed, at various
temperatures (T$""_(a n n)$=950 , 1000 , 1100 , 1200 , 1300  and 1550 ),
under air atmosphere also corresponding to the oxygen partial pressure
$p \( upright(O)_2 \) = 2.1 dot.op 10^(- 4)$Pa. Next, the TiO$""_2$
pellets were thinned by polishing up to thicknesses from 300 to
500$mu$m. Photographs of the pellets are reported in the supplementary
material (see~Fig. S-fig:photo in the supplementary material)

== Characterization
<characterization>
The structural properties of the fabricated samples were investigated by
Scanning Electron Microscope (SEM) and X-ray diffraction (XRD). Next,
the samples were characterized at THz frequencies by the means of Time
Domain Spectroscopy (THz-TDS).

=== XRD
<xrd>
Titanium dioxide (TiO$""_2$) crystallizes in three main forms, two of
which may have EM applications: rutile and anatase. These have different
crystalline structures, which results in different electronic and
optical properties. Because of its higher permittivity and lower loss,
the rutile structure is better suited for metamaterials applications. To
determine which structure has resulted from our fabrication processes,
we have characterized the samples by X-ray diffraction (XRD). The
2Theta/Theta (2$Theta$/$Theta$) scans were collected in a Bragg-Brentano
geometry using a Rigaku Smartlab diffractometer.

=== Density
<density>
The density of the sintered samples was measured using Archimede's
method\[11\].

=== THz characterisations
<thz-characterisations>
Once the pellets fabricated and polished, they were characterized in the
\[0.2, 1.8\] THz range by the means of THz Time Domain Spectroscopy
(THz-TDS). Actually, this broadband technique allows to determine the
dielectric permittivity (including both real and imaginary parts) of the
material if this latter is sufficiently transparent. Moreover, in the
case of inhomogeneous media or compounds one can also have an insight
about structural parameters such as porosity using an effective medium
analysis (see ref. \[12\]) In our case we performed transmission
experiment using a commercial Terapulse Lx spectrometer (from Teraview).
In this system, the sample is placed at the focal point of two parabolic
mirrors where the frequency dependent waist of the THz beam decreases
from 2mm at 0.2 THz to 0.2mm at 2 THz. The spectrometer delivers THz
pulses whose spectrum covers the \[0.2, 5\]THz band
(see~Fig. S-fig:tds_td & S-fig:spectre in the supplementary material).
The dynamic range of measurement tops around 0.6THz and is gradually
attenuated at high frequencies; the signal reaches the noise level
around 5THz. Towards the lower end of the spectrum, the amplitude of the
detected signal is mainly limited by diffraction effects as the
low-frequency components of theTHz beam are poorly focused towards the
detector and may even be blocked by the sample holder if the size of
sample is too small. Considering these system parameters, we have
fabricated pellets with diameter ranging from 8 to 13mm. As mentioned
above, before being characterized, each sample is thinned into a
parallel-sided plate with a thickness between 300 and 500$mu$m. Given
the expected absorption losses of the samples, which generally range
between $tan delta = 0.1$ and $tan delta$= 0.2 to at 1.8THz, such
thicknesses would induce propagation losses of approximately 40 to 65
dB. As a consequence, the upper limit of the frequency range of
characterization of the ceramic pellets varies from 1 to 1.8THz
depending on the exact parameters of the sample. Generally, the lower
limit of reliable characterization is in between 0.2 and 0.25THz. In
order to reduce the impact ofTHz water absorption onto the experiment,
the samples are placed in a chamber purged by nitrogen gas with a
residual humidity rate below 10% at ambient temperature. Each
measurement consists of recording time traces with a time equivalent
length of 30 ps. For further numerical analysis of the signal in the
frequency domain, this window width will lead to a frequency resolution
of 33 GHz which is good enough to characterize material, such as
TiO$""_2$ pellets, that does not present sharp resonances in this
frequency range. We note that the characterization of resonant devices
such as metamaterial with narrow resonances would require longer
acquisition window or the use of a frequency resolvedTHz apparatus.

In practical terms, to characterize the pellets, we follow a classical
method based on the comparison of signals recorded with or without the
sample\[13\]. Firstly, a reference temporal signal without the sample is
recorded; secondly, the signal transmitted by the sample is recorded.
The two measured temporal signals are then processed by a Fast Fourrier
Transform (FFT), which yields the transmission spectrum. The time domain
signals and the spectra are reported in the supplementary material
(see~Fig. S-fig:tds_td & S-fig:spectre in the supplementary material).
The calculation leads to the knowledge of the complex transmission
coefficient of the sample. From this and the sample thickness, the
complex refractive index $n + dotless.i kappa$ is extracted assuming
that the signal does not suffer from any scattering or diffraction
effects. From the refractive index $n$ and the extinction coefficient
$kappa$, the absorption coefficient $alpha$ is deduced, from which, in
turn, the complex dielectric function
$epsilon^(*) = epsilon' + dotless.i epsilon''$ is found. All this
analysis is done using a dedicated numerical tool developed using Matlab
and based on the method originally described by Duvillaret #emph[et
al.]\[14\].

== Design of the All Dielectric Metamaterials and numerical simulations
<dadm>
#figure([#block[
  #box(image("graphics/unit_cell_jecs.svg"))
  ]],
  caption: [
    Sketch of a 2D All Dielectric Metamaterial (ADM). It is a periodical
    structure, whose unit cell consists of two High Permittivity
    Resonators sustaining the first two modes of Mie resonances, as the
    incident field is Transverse Electric (the field $arrow(E)$ is
    perpendicular to the axis of the resonators). Their cross-sections
    are $a times a$ and $a times b$, while the half-period $p$ is the
    distance between the axes of two resonators. Both the resonators are
    infinite along the $z$ direction. The two modes are shown. The
    $T E_11$ mode exhibits one antinode while the $T E_12$ has
    two\[15\].
  ]
)
<fig:unit_cell>

Given that we intend to develop ADMs operating in theTHz from the
ceramics we fabricated, we used the results of theTHz caracterization of
our pellets to design and numerically simulate ADMs. These are periodic
structures whose unit cell consists of two High Permittivity Resonators,
sustaining the first two modes of the Mie resonances. The small
resonator sustains the first mode of the Mie resonances, while the other
sustains the second mode. The former is called the "magnetic resonator"
and the latter the "electric resonator". The first one gives rise to
resonant effective permeability $mu_(e f f)$, while the second one gives
rise to resonant effective permittivity $epsilon_(e f f)$, both of which
may take negative values. Their superposition may then result in a
negative effective index or near zero-index\[15,16\]. Fig.@fig:unit_cell
reports the sketch of a 2D ADM.

We designed 2D ADMs operating at 0.3THz and 0.6THz, because this
corresponds to transmission windows of the atmosphere. The dimensions of
the sides of the two rectangular resonators set their frequency of
resonance, according to the Cohn's model\[15,16\], which provides the
frequency of the modes by the relation\[17\]:
$ f_(m n) = frac(c, 2 sqrt(epsilon')) sqrt((m / a)^2 + (n / b)^2) \, $<eq:cohn>
where $m$ and $n$ are integers, and $a$ and $b$ are the dimensions of
the sides of the 2D rectangular resonators. It consequently depends on
the relative permittivity $epsilon'$ of the bulk material. Since we
consider the first two modes of Mie resonances, $m = n = 1$ and $m = 1$,
$n = 2$ in the elementary cell, the first mode (denoted $T E_11$) being
the magnetic one and the second (denoted $T E_12$), the electric one.
Notice that the Cohn's model provides the frequencies of resonances of
an isolated resonator.

The dimensions of the resonators are therefore adjusted so that the two
modes overlap, resulting in the superposition of effective permeability
$mu_(e f f)$ and effective permittivity $epsilon_(e f f)$. Operating at
0.3THz, the magnetic resonator has a rectangular cross section
(a=110$mu$m$times$ b=58$mu$m), while the electric one has a square cross
section(a=110$mu$m$times$ a=110$mu$m). To excite the two modes, the
polarization of the incident EM field is Transverse Electric (TE), that
is, the electric field $upright(bold(E))$ is perpendicular to the axis
of the dielectric resonators, while the magnetic one $upright(bold(H))$
is parallel to the axis. From Cohn's model, the respective resonance
frequencies are 0.287THz ($T E_11$ mode) and 0.300THz ($T E_12$ mode).
The two modes undergo coupling, which notably moves the frequencies of
resonances that are given by the Cohn's model, and can lead to the
degenerescence of the modes, that is, their frequencies become equal as
$p$ decreases\[18\]. The period of the lattice $2 p$ plays thus an
important role in the EM characteristics; it is set as $p = 200$$mu$m.
Operating at 0.6THz, the sides of the resonators are respectively
b=28$mu$m$times$ a=55$mu$m and a=55$mu$m$times$ a=55$mu$m, while the
lattice period is set as $p = 120$$mu$m. Their respective resonance
frequencies are 0.586THz ($T E_11$ mode) and 0.594THz ($T E_12$ mode).
Therefore, the cross-sections of the resonators forming an ADM are
sub-wavelength. Varying the lattice period $2 p$ changes the effective
index $n_(e f f)$, so that near-zero index ($0 lt.eq n_(e f f) lt.eq 1$)
is achievable\[9,18\]. Our previous simulations show that the relative
permittivity has to be around $epsilon' tilde.eq 100$, while the loss
tangent $tan delta = epsilon.alt' \/ epsilon.alt''$ has to be lower than
0.02, so as to obtain the two resonances\[8,9\]. The simulations have
been carried out by the means of the Lumericalcommercial software, which
involves the Finite-difference time-domain (FDTD) method and yields the
S-parameters (reflexion and transmission coefficients)
(see~Fig. S-fig:param_s in the supplementary material), from which we
extracted the effective parameters: permeability $mu_(e f f)$,
permittivity $epsilon_(e f f)$ and index $n_(e f f)$\[15,16\], using
Szabo #emph[et al.] method\[19\].

= Results and discussion
<results-and-discussion>
== Chemical properties of the TiO$""_2$ ceramics.
<chemical-properties-of-the-tio_2-ceramics.>
=== SEM images
<sem-images>
Scanning Electron Microscope (SEM) images of the polycristaline pellets
were taken, from which the grain size and the morphology of the sintered
ceramic can be observed(see~Fig. @fig:sem): the SPS TiO$""_2$ samples
have a smaller grain size (4-6$mu$m) with very low residual porosity
(close to 1.2%), than that of the CS samples that have a larger grain
size (10-30$mu$m), with intragranular and intergranular porosity, that
is close to 3.8%. That said, the grain size has no significant effect on
the permittivity and the dielectric loss, specially when the ceramic
powders are very pure\[20\]. The determination of the porosity ratio and
the mean grain size have been performed from the SEM images by ImageJ
software.

#figure([#figure(image("graphics/sem_sps.svg"),
    caption: [
    ]
  )
  <fig:sem_sps>

  \

  #figure(image("graphics/sem_cs.svg"),
    caption: [
    ]
  )
  <fig:sem_cs>

  ],
  caption: [
    SEM microphotographies of TiO$""_2$ samples sintered (a) by spark
    plasma sintering (SPS) at 1100  and (b) by conventional sintering at
    1550 .
  ]
)
<fig:sem>

=== XRD results
<xrd-results>
Two results of XRD characterizaiton are reported in Fig. @fig:xrd: that
of a CS sample and the other of a SPS one. The former has been sintered
at T$""_(C S)$=1350 , while the latter has been at T$""_(S P S)$=1100 .
These spectra are compared with that of rutile TiO$""_2$, which confirms
that the samples are of the rutile form\[21\].

#figure([#figure(image("graphics/xrd12.svg"),
    caption: [
    ]
  )
  <fig:xrd12>

  \

  #figure(image("graphics/xrd31.svg"),
    caption: [
    ]
  )
  <fig:xrd31>

  ],
  caption: [
    XRD spectra of two TiO$""_2$ ceramics samples: (a) Conventionally
    sintered at T$""_(C S)$=1350  (CS sample), (b) Sintered by SPS at
    T$""_(S P S)$=1100  (SPS sample) compared to the rutile spectrum:
    the Miller indexes of the TiO$""_2$ rutile form are the blue
    marks\[21\].
  ]
)
<fig:xrd>

== Dielectric Properties of the TiO$""_2$ Ceramics
<dielectric-properties-of-the-tio_2-ceramics>
We addressed the EM properties of the pellets in function of the
density, the type of sintering, the sintering and annealing
temperatures, and then the dielectric function of the TiO$""_2$
ceramics.

=== Permittivity #emph[vs] density
<permittivity-vs-density>
The permittivity of all the samples #emph[vs] their relative density is
reported in Fig. @fig:permittivity_density, and it can be seen that both
the processes allow to fabricate dense samples (density \> 0.9) with
high permittivity ($epsilon' tilde.eq 100$). And it can be noticed that
most of high density samples have a high permittivity, as might be
expected\[7\]. Nonetheless, most of the SPS samples have a density
greater than 0.9 and a permittivity around $epsilon_r tilde.eq$100 .

#figure([#block[
  #box(image("graphics/densite.svg", width: 80.0%))
  ]],
  caption: [
    Permittivity $epsilon'$ of all the samples in function of their
    density: SPS samples in violet and CS samples in green. The vertical
    dotted line indicates the density of 0.9.
  ]
)
<fig:permittivity_density>

=== Loss #emph[vs] permittivity
<loss-vs-permittivity>
The loss tangent #emph[vs] the permittivity from theTHz-TDS measurements
at 0.3THz is reported in Fig. @fig:permittivity, and it can be also
noticed that both the processes allow to fabricate samples with low loss
($tan delta < 0.02$) and high permittivity ($epsilon' tilde.eq 100$).
Nonetheless, most of SPS samples satisfy the two criteria:
$epsilon' tilde.eq 100$ and $tan delta lt.eq 0.02$, and, notably, the
SPS samples exhibit the lowest loss associated to the highest
permittivity. Two CS samples exhibit a lower loss tangent
($tan delta = 3 dot.op 10^(- 3)$ and $tan delta = 4 dot.op 10^(- 3)$,
however, their respective permittivity are $epsilon' = 91$ and
$epsilon' = 87$. The similar figures at 0.6THz and at 1THz are reported
in the supplementary material
(see~Fig. S-fig:tgdelta600 & S-fig:tgdelta1000 in the supplementary
material) and it shows that the criteria of the loss tangent threshold
is more difficult to satisfy at 0.6THz because the loss tangent induced
by the first optical phonon $omega_(T_(O_1))$ is higher. And that it is
not achieved at 1THz.

#figure([#block[
  #box(image("graphics/tgdelta.svg", width: 80.0%))
  ]],
  caption: [
    Loss tangent ($tan delta = epsilon.alt'' \/ epsilon.alt'$) in
    function of the permittivity $epsilon'$ of all the samples at
    0.3THz: SPS samples in violet and CS samples in green. The
    horizontal dotted line indicates the threshold of loss tangent
    $tan delta = 0.02$.
  ]
)
<fig:permittivity>

=== Dielectric Function
<dielectric-function>
The THz spectrum measurements were then compared with a theoretical
model, namely the pseudo-harmonic (PH) model, which is convenient since
our measurements were carried out in the lower end of theTHz band
(\<1.5THz). Actually, considering that we have characterised our samples
in the lower THz band, the influence of higher frequencies resonances
due to the LO$""_1$ phonon or higher order phonon modes have a very low
impact on the dielectric response of TiO$""_2$ below 1.5THz. So we only
consider the effect of the first transverse optical phonon TO$""_1$
mode. We built this model based on our measurements taken from two
single crystals rutile TiO$""_2$ samples (Surfacenet GmbH), oriented in
the $< 001 >$ and $< 100 >$ directions. The theoretical dielectric
function in each direction is given by
$ epsilon_(parallel \, perp)^(*) \( omega \) = epsilon' \( omega \) + dotless.i epsilon'' \( omega \) = epsilon_oo + frac(omega_(omega_(T_(O_1)))^2 #h(-1em) dot.op (epsilon_0 - epsilon_oo), omega_(omega_(T_(O_1)))^2 - omega^2 - dotless.i gamma_(T_(O_1)) omega) . $<eq:ph>
It involves four parameters. Along the rapid axis, we used the values of
$epsilon_0$ and $epsilon_oo$ from Matsumoto #emph[et al.]\[22\] and
Traylor #emph[et al.], \[23\], while for the slow axis, we adapted those
from Kanehara #emph[et al.]\[24\], to determine $epsilon_perp$ and
$epsilon_parallel$, respectively. These are reported in the
supplementary material (see~table. S-tab:ph_parameters in the
supplementary material). The figure of the two corresponding dielectric
functions is also reported in the supplementary material
(see~Fig. S-fig:func_diel_rutile in the supplementary material), and it
shows good agreement between the model and the measurements along both
directions \($parallel$, $perp$) of the single crystal.

Next, the dielectric function
$epsilon * = epsilon' + dotless.i epsilon''$ of our polycrystalline
pellets is found under the assumption that the samples consist of
randomly oriented rutile grains, which leads to the mean permittivity
given by\[22\]

$ epsilon_(m e a n) = 2 / 3 epsilon_perp^(*) + 1 / 3 epsilon_parallel^(*) . $<eq:mean>
This is reported in Fig. @fig:ph and compared with the measurements, and
it shows good agreement. At 0.3THz, the measured real part $epsilon'$ is
95% of that from the PH model, which is consistent with the relative
density (0.99) of the considered sample. The imaginary part $epsilon''$
of the measured dielectric function increases about twice faster as the
PH model, which we ascribe to the presence of ionized defects,
specifically to the concentration of oxygen vacancies (V$""_O$) and Ti
interstitials (Ti$""_i$) \[25,26\]. These are responsible for possible
additional backscattering losses that add to the losses due to the
excitation of the first transverse optical phonon TO$""_1$. Because of
their different structures, the dielectric properties of single crystals
differ from those of polycrystalline specimens due to the presence of
grain boundaries\[27\]. Moreover, the latter are porous.

#figure([#figure(image("graphics/ph_measure.svg", width: 100%),
    caption: [
    ]
  )
  <fig:fpsq1>

  \

  #figure(image("graphics/ph_measure2.svg", width: 100%),
    caption: [
    ]
  )
  <fig:fpsq2>

  ],
  caption: [
    Dielectric function $epsilon^(*) = epsilon' + dotless.i epsilon''$
    of TiO$""_2$ sample 1.3 (see Table @tab:tandelta) sintered by SPS.
    Experimental spectrum (dots) in the THz range compared with the
    dielectric permittivity $epsilon.alt_(m e a n)$ of a randomly
    oriented TiO$""_2$ rutile polycrystal simulated using a
    Pseudo-Harmonic model (PH lines) (see
    eq. @eq:ph & @eq:mean) (a)
    $\[ 0 \, 10 \]$THz range. The maximum of the imaginary part
    indicates the frequency of the first optical phonon
    $omega_(T_(O_1))$ at 5.7THz. (b) Zoomed view in the
    $\[ 0.2 \, 1.5 \]$THz range.
  ]
)
<fig:ph>

=== Effect of the sintering and annealing temperatures on the loss of SPS samples
<effect-of-the-sintering-and-annealing-temperatures-on-the-loss-of-sps-samples>
From the qualitative results of Fig. @fig:permittivity, we further
investigated the effect of the SPS sintering temperature and that of the
annealing on the loss tangent of the samples, the permittivity being a
less critical parameter\[26\]. We considered twenty-seven samples
realized from three different commercial powders, whose characteristics
are reported in Table @tab:powders. The samples were considered in three
sets from the SPS sintering temperature: T$""_(S P S)$=1100 , 1150  and
1200 . Each set comprises three subsets of samples made of the same
powders, i.e., nine samples in each set. In each subset, two samples
were annealed: one at T$""_(a n n)$=1000  and the other at 1100 . This
annealing was carried out during 60 hours under air, because the
re-oxidation kinetics of TiO$""_2$ remain very low in this range of
temperatures. All these SPS samples were next characterized at 0.3THz
and the results are reported in Table @tab:tandelta. Several points can
be noticed:

+ Without annealing, the powder whose specific surface area $S_(B E T)$
  is the lowest exhibits the lowest loss tangent $tan delta$. Indeed, it
  is less affected by the reduction phenomena during the sintering
  process. Its defect concentration Ti$""^(3 +)$ is lower.

+ The annealing of the samples leads to a significant reduction in
  losses, by a factor 2 up 16, which demonstrates the importance of this
  post-sintering process, because it reduces the defect concentration
  (Ti$""^(3 +)$) and the oxygen vacancies concentration (V$""_O$) by the
  re-oxidation of TiO$""_2$.

+ The lowest SPS temperature (T$""_(S P S)$= 1100 ) followed by an
  annealing leads to the loss tangent below the threshold
  $tan delta lt.eq 0.02$ (black and blue bold fonts in
  Table @tab:tandelta).

+ The process T$""_(S P S)$= 1100  & T$""_(a n n)$= 1000  leads to the
  lowest loss tangent ($tan delta lt.eq 0.016$) (blue bold font in
  Table @tab:tandelta). Notice that one sample exhibits a loss tangent
  as low as $tan delta = 6.10^(- 3)$ at 0.3THz and
  $tan delta = 18.10^(- 3)$ at 0.6THz\[26\]. Its particule size
  $D_(B E T)$ is the lowest. These SPS conditions, at lower temperature,
  limit the creation of Ti$""^(3 +)$ defects or low reduction of
  TiO$""_2$.

The Brouwer diagram, which represents the conductivity $sigma$ in
fonction of the oxygen partial pressure $p \( upright(O)_2 \)$ at
various temperatures, gives an insight of the role of the sintering and
annealing temperatures\[28--30\]. It shows that, at a given partial
oxygen pressure $p \( upright(O)_2 \)$, sintering and annealing at lower
temperatures lead to lower conductivity (lower defect concentration
Ti$""^(3 +)$). Consequently, sintering at 1100  followed by annealing at
1000  is the optimal process considering our three sets of samples. The
Brouwer diagram with corresponding partial oxygen pressures of SPS
sintering and annealing is shown in the supplementary material
(see~Fig. S-fig:brouwer in the supplementary material).

#block[
#figure(
  align(center)[#table(
    columns: 4,
    align: (left,left,left,left,),
    table.header([Producer (reference)], [Purity
      (%)], [$S_(B E T)$\(m$""^2$/g)], [$D_(B E T)$\($mu$m)],),
    table.hline(),
    [Sigma Aldrich (10897)], [99.995], [0.16], [19],
    [Sigma Aldrich (42681)], [99.8], [4], [4.4],
    [HP2], [99], [6.3], [1],
  )]
  , caption: [Characteristics of the TiO$""_2$ powders used to fabricate
  the SPS samples. The values of the specific surface area ($S_(B E T)$)
  are those given by the producer. Using the Brunauer-Emmett-Teller'
  method (BET), the particle size $D_(B E T)$ was determined\[10\]. ]
  , kind: table
  ) <tab:powders>

]
#figure(
  table(
    columns: 5,
    table.header([SPS temperature], [Subset (powder)], [No annealing], [1000 °C], [1100 °C]),
    table.hline(),
    [1100 °C], [1.1 (10897)], [0.022], [*0.009*], [*0.019*],
    [1100 °C], [1.2 (42681)], [0.082], [*0.016*], [*0.019*],
    [1100 °C], [1.3 (HP2)], [0.096], [*0.006*], [*0.013*],
    [1150 °C], [2.1 (10897)], [0.016], [0.009], [0.015],
    [1150 °C], [2.2 (42681)], [0.072], [0.026], [0.050],
    [1150 °C], [2.3 (HP2)], [0.050], [0.013], [0.014],
    [1200 °C], [3.1 (10897)], [0.024], [0.034], [0.016],
    [1200 °C], [3.2 (42681)], [0.055], [0.013], [0.016],
    [1200 °C], [3.3 (HP2)], [0.064], [0.020], [0.027],
  ),
  caption: [Loss tangent at 0.3 THz for 27 samples. Columns give the post-sintering annealing temperature. Bold values identify treatments highlighted in the original table, where all three powders gave a loss tangent below 0.02.],
) <tab:tandelta>

== Effective parameters and negative index
<effective-parameters-and-negative-index>
To design the device, we used the experimental EM characteristics of the
sample of subset 1.3, that was sintered by SPS at 1100  and then
annealed at 1000  under air during 60 hours (blue column in
Table @tab:tandelta). These are $epsilon' = 103 \, tan delta = 0.006$ at
0.3THz and $epsilon' = 105 \, tan delta = 0.018$ at 0.6THz,
respectively(see~Fig. @fig:ph). The calculated effective parameters:
permeability $mu_(e f f)$, permittivity $epsilon_(e f f)$ and index
$n_(e f f)$ in function of the frequency are reported in
Fig. @fig:param_eff. The maximum of the imaginary part of the effective
permeability $mu_(e f f)$ indicates the frequency of resonance of the
magnetic resonator (magnetic mode $T E_11$), while the maximum of the
imaginary part of the effective permittivity $epsilon_(e f f)$ indicates
that of the electric resonator (electric mode $T E_12$). These are
$f_(11_s)$= 0.283THz and $f_(12_s)$= 0.294THz, respectively. The gap
($Delta f_s = 11$GHz#emph[vs]$Delta f_(C o h n) = 13$GHz) with that
calculated from Cohn's model (argon) is the evidence of the mode
coupling\[18\]. At 0.6THz, these frequencies are $f_(11_s)$= 0.586THz
and $f_(12_s)$= 0.594THz, respectively. The gap
($Delta f_s = 8$GHz#emph[vs]$Delta f_(C o h n) = 12$GHz) is greater,
since the periodicity $p = 120$$mu$m is lower in that case, reinforcing
the coupling between the two modes\[18\]. Besides, metamaterials exhibit
negative effective index of refraction as Depine and Lakhtakia's
Condition (DLC) is satisfied\[31\], that is, when
$ epsilon'_(e f f) thin mu''_(e f f) + epsilon''_(e f f) thin mu'_(e f f) < 0 \, $<eq:dlc>
where the prime and the double prime denote the real and imaginary
parts, respectively. It takes loss into account. The corresponding
frequency ranges are shown by the shaded areas of Fig. @fig:param_eff.
Its minimum values are $n_(e f f_(m i n)) = - 1.23$ at 0.295THz and
$n_(e f f_(m i n)) = - 0.16$ at 0.587THz. The corresponding bandwidths
are 6.8GHz at 0.3THz and 4.5GHz at 0.6THz, respectively. These
simulations thus demonstrate that negative index is achievable at THz
from the TiO$""_2$ pellets we realized by SPS followed by an annealing
at both frequencies. They next require to be micro-structured at the
tens of micrometers scale with a micrometer resolution\[9\]. We are
currently implementing micro-molding of ceramic, using polymer molds,
which is a microscale manufacturing process\[9\]. This process has the
advantage of facilitating the precise realization of components by
accurately reproducing the specific characteristics of a polymer mold.
In the supplementary material (see~figures`S-fig:param_eff_sample11` and
`S-fig:param_eff_sample12` in the supplementary material), we also
report the same simulations of the two other samples (samples 1.1 and
1.2) fabricated by the same processes (blue column in
Table @tab:tandelta): these show that if negative index can be achieved
at 0.3THz, it is not at 0.6THz, since the loss tangent $tan delta$ is
larger than the loss tangent threshold 0.02 at this latter frequency,
because of the first optical phonon $omega_(T_(O_1))$. Nevertheless, it
can be noticed that sample 1.1 exhibits a near-zero index at 0.6THz,
whereas sample 1.3, whose loss $tan delta$ is higher, does not
(see~Fig. S-fig:sample_at1_600 in the supplementary material).

#figure([#figure(image("graphics/fig1_at4.svg", width: 100%),
    caption: [
    ]
  )
  <fig:param_eff_300>

  #figure(image("graphics/fig2_at4.svg", width: 100%),
    caption: [
    ]
  )
  <fig:param_eff_600>

  ],
  caption: [
    Effective parameters (real and imaginary parts): permeability
    $mu_(e f f)$, permittivity $epsilon_(e f f)$ and index $n_(e f f)$
    from sample 1.3 (see Table @tab:tandelta), extracted from numerical
    simulations: (a) The two modes of Mie resonances are around 0.3THz,
    the minimum of the effective index is $n_(e f f_(m i n)) = - 1.23$
    at 0.295THz; (b) The two modes of Mie resonances are around at
    0.6THz, the minimum of the effective index is
    $n_(e f f_(m i n)) = - 0.16$ at 0.587THz. The shaded areas mark the
    frequency range in which the effective index $n_(e f f)$ is
    negative.
  ]
)
<fig:param_eff>

= Conclusion
<conclusion>
To develop All-Dielectric Metamaterials operating at THz frequencies, we
have studied the EM properties of TiO$""_2$ pellets we fabricated from
commercial powders. From our previous results, these devices require a
high permittivity ($epsilon.alt' tilde.eq 100$) and low loss
($tan delta lt.eq 0.02$). We first compared two sintering processes:
Conventional Sintering (CS) and Spark Plasma Sintering (SPS), in
function of the temperature. Then, we investigated the effect of a
post-sintering annealing on the loss in function of the temperature. The
pellets were characterized in the THz frequency range by THz Time Domain
Spectroscopy (THz-TDS). We show that the two criteria are achievable by
SPS and annealing. The process T$""_(S P S)$= 1100  and T$""_(a n n)$=
1000  yields the best results. Notably, a sample exhibiting a loss
tangent $tan delta = 6.10^(- 3)$ at 0.3THz and $tan delta = 18.10^(- 3)$
at 0.6THz, with respective permittivities $epsilon' = 103$ and
$epsilon' = 105$ has been realized. By adjusting the coupling between
the modes, near-zero index should be allowed. From these measurements,
we designed All-Dielectric Metamaterials and show that they exhibit
negative index in the THz range. Realizing All-Dielectric Metamaterials
next necessitates to micro-structure the bulk material at the tens of
micrometers scale with a micrometer resolution.

= Acknowledgements
<acknowledgements>
D.A.D. thanks the Mission pour les Initiatives Transverses et
Interdisciplinaires (MITI) of the CNRS for the scholarship. The XRD
characterizations have been carried out thanks to the french RENATECH
network.

= Funding
<funding>
This work has been financed by the french Agence Innovation Défense (via
the ANR Dispont project) and the MITI (CNRS).

= Author contributions statement
<author-contributions-statement>
D.A.D. designed and simulated the devices, D.G. and P.-M. G. fabricated
the samples, F.-B. prepared the samples, D.A.D. and J.-F.R.
characterized the samples, E.A. supervised the study. All authors have
analysed the results, contributed to the manuscript and reviewed it.

= Additional information
<additional-information>
#strong[Competing interests]: The authors declare none.

The corresponding author is responsible for submitting a
#link("http://www.nature.com/srep/policies/index.html#competing")[competing interests statement]
on behalf of all authors of the paper. This statement must be included
in the submitted article file.

= Data availability
<data-availability>
Data underlying the results presented in this paper are not publicly
available at this time but may be obtained from the authors upon
reasonable request.

= Supplemental document
<supplemental-document>
See Supplemental document for supporting content.

#block[
#block[
\[1\] Luo W, Yan S, Zhou J. Ceramic-based dielectric metamaterials.
Interdisciplinary Materials 2022;1:11--27.

] <ref-im1_luo>
#block[
\[2\] Takano K, Yakiyama Y, Shibuya K, Izumi K, Miyazaki H, Jimba Y, et
al. Fabrication and performance of \$\\hbox{TiO}\_{2}\$-ceramic-based
metamaterials for terahertz frequency range. IEEE Transactions on
Terahertz Science and Technology 2013;3:812--9.
#link("https://doi.org/10.1109/TTHZ.2013.2285521").

] <ref-ttst3_takano>
#block[
\[3\] Veselago VG. Electrodynamics of materials with negative index of
refraction. Phys Usp 2003;46:764--8.
#link("https://doi.org/10.1070/PU2003v046n07ABEH001614").

] <ref-Veselago:2003>
#block[
\[4\] Liberal I, Engheta N. Zero-index platforms: Where light defies
geometry. Opt Photonics News 2016;27:26--33.

] <ref-opn27_engheta>
#block[
\[5\] Spitzer W, Miller RC, Kleinman D, Howarth L. Far infrared
dielectric dispersion in , , and. Physical Review 1962;126:1710.

] <ref-pr126_spitzer>
#block[
\[6\] Barker Jr A. Temperature dependence of the transverse and
longitudinal optic mode frequencies and charges in and. Physical Review
1966;145:391.

] <ref-pr145_barker>
#block[
\[7\] Dupas C, Guillemet-Fritsch S, Geffroy P-M, Chartier T, Baillergeau
M, Mangeney J, et al. High permittivity processed for metamaterials
applications at terahertz frequencies. Scientific Reports 2018;8:15275.

] <ref-sr8_dupas>
#block[
\[8\] Djemmah DA, Geffroy P-M, Chartier T, Roux J-F, Bouamrane F,
Akmansoy É. Processing high permittivity for all-dielectric
metamaterials applications at terahertz frequencies. Proceedings of the
sixth international symposium on dielectric materials and applications
(ISyDMA'6), Springer; 2022, p. 177--83.

] <ref-djemmah2022processing>
#block[
\[9\] Djemmah DA, Gourdonnaud D, Laourine F, Bouville D, Bouamrane F,
Roux J-F, et al. From bulk toward micro-structured ceramics for
all-dielectric metamaterials at terahertz frequencies: What process?
International Journal of Microwave and Wireless Technologies 2025:1--11.
#link("https://doi.org/10.1017/S1759078725101931").

] <ref-ijmwt_amina>
#block[
\[10\] Michel F, Courard L. Particle size distribution of limestone
fillers: Granulometry and specific surface area investigations.
Particulate Science and Technology 2014;32:334--40.

] <ref-pst32_courard>
#block[
\[11\] Sasaki H, Tokizaki E, Terashima KTK, Kimura SKS. Density
variation of molten silicon measured by an improved archimedian method.
Japanese Journal of Applied Physics 1994;33:3803.

] <ref-jjap33_sasaki>
#block[
\[12\] Hakobyan D, Hamdi M, Redon O, Ballestero A, Mayaudon A, Boyer L,
et al. Non-destructive evaluation of ceramic porosity using terahertz
time-domain spectroscopy. Journal of the European Ceramic Society
2022;42:525--33.
https:\/\/doi.org/#link("https://doi.org/10.1016/j.jeurceramsoc.2021.10.026").

] <ref-jecs42_hakobyan>
#block[
\[13\] Roux J-F, Garet F, Coutaz J-L. Principles and applications of THz
time domain spectroscopy. Physics and Applications of Terahertz
Radiation 2014:203--31.

] <ref-roux2014principles>
#block[
\[14\] Duvillaret L, Garet F, Coutaz J-L. A reliable method for
extraction of material parameters in terahertz time-domain spectroscopy.
IEEE Journal of Selected Topics in Quantum Electronics 1996;2:739--46.

] <ref-duvillaret1996reliable>
#block[
\[15\] Lepetit T, Akmansoy É, Ganne J-P. Experimental evidence of
resonant effective permittivity in a dielectric metamaterial. Journal of
Applied Physics 2011;109:023115.

] <ref-jap109_lepetit>
#block[
\[16\] Lepetit T, Akmansoy É, Ganne J-P. Experimental measurement of
negative index in an all-dielectric metamaterial. Applied Physics
Letters 2009;95:121101.

] <ref-apl95_lepetit>
#block[
\[17\] Cohn SB. Microwave bandpass filters containing high-Q dielectric
resonators. IEEE Transactions on Microwave Theory and Techniques
1968;16:218--27.

] <ref-mtt16_cohn>
#block[
\[18\] Akmansoy, Eric, Marcellin, Simon. Negative index and mode
coupling in all-dielectric metamaterials at terahertz frequencies. EPJ
Appl Metamat 2018;5:10. #link("https://doi.org/10.1051/epjam/2018006").

] <ref-epjam5_marcellin>
#block[
\[19\] Szabo Z, Park G-H, Hedge R, Li E-P. A unique extraction of
metamaterial parameters based on kramers--kronig relationship. IEEE
Transactions on Microwave Theory and Techniques 2010;58:2646--53.
#link("https://doi.org/10.1109/TMTT.2010.2065310").

] <ref-mtt58_szabo>
#block[
\[20\] Marco DD, Drissi K, Delhote N, Tantot O, Geffroy P-M, Verdeyme S,
et al. Dielectric properties of pure alumina from 8 to 73. Journal of
the European Ceramic Society 2016;36:3355--61.
https:\/\/doi.org/#link("https://doi.org/10.1016/j.jeurceramsoc.2016.05.047").

] <ref-jecs36_geffroy>
#block[
\[21\] Diffraction Data IC for.
#link("https://www.icdd.com/")[ICDD file 01-089-4202 & ICDD file 03-065-5714]
\2022.

] <ref-icdd>
#block[
\[22\] Matsumoto N, Hosokura T, Kageyama K, Takagi H, Sakabe Y, Hangyo
M. Analysis of dielectric response of in terahertz frequency region by
general harmonic oscillator model. Japanese Journal of Applied Physics
2008;47:7725. #link("https://doi.org/10.1143/JJAP.47.7725").

] <ref-jjap47_matsumoto>
#block[
\[23\] Traylor JG, Smith HG, Nicklow RM, Wilkinson MK. Lattice dynamics
of rutile. Phys Rev B 1971;3:3457--72.

] <ref-prb3_traylor>
#block[
\[24\] Kanehara K, Hoshina T, Takeda H, Tsurumi T. Terahertz
permittivity of rutile single crystal measured by anisotropic
far-infrared ellipsometry. Journal of the Ceramic Society of Japan
2015;123:303--6. #link("https://doi.org/10.2109/jcersj2.123.303").

] <ref-jcsj123_kanehara>
#block[
\[25\] Setvı́n M, Wagner M, Schmid M, Parkinson GS, Diebold U. Surface
point defects on bulk oxides: Atomically-resolved scanning probe
microscopy. Chem Soc Rev 2017;46:1772--84.
#link("https://doi.org/10.1039/C7CS00076F").

] <ref-rsc46_setvin>
#block[
\[26\] Yu C, Zeng Y, Yang B, Donnan R, Huang J, Xiong Z, et al. Titanium
dioxide engineered for near-dispersionless high terahertz permittivity
and ultra-low-loss. Scientific Reports 2017;7:6639.

] <ref-sr7_yu>
#block[
\[27\] Singh K, Nowotny J, Thangadurai V. Amphoteric oxide
semiconductors for energy conversion devices: A tutorial review.
Chemical Society Reviews 2013;42:1961--72.

] <ref-nowotny_csr42>
#block[
\[28\] Nowotny J, Bak T, Burg T. Electrical properties of
polycrystalline at elevated temperatures. Electrical conductivity.
Physica Status Solidi (b) 2007;244:2037--54.

] <ref-pssb244_nowotny>
#block[
\[29\] Nowotny M, Bak T, Nowotny J. Electrical properties and defect
chemistry of single crystal. I. Electrical conductivity. The Journal of
Physical Chemistry B 2006;110:16270--82.

] <ref-jpcb110_nowotny>
#block[
\[30\] Balachandran U, Eror N. Electrical conductivity in
non-stoichiometric titanium dioxide at elevated temperatures. Journal of
Materials Science 1988;23:2676--82.

] <ref-jms23_balachandran>
#block[
\[31\] Depine RA, Lakhtakia A. A new condition to identify isotropic
dielectric-magnetic materials displaying negative phase velocity.
Microwave and Optical Technology Letters 2004;41:315--6.

] <ref-motl41_depine>
] <refs>
