// Proia, Sbragaglia, and Falcucci, arXiv:2605.08120v1. Adapted from LaTeX under CC BY 4.0.
// https://arxiv.org/abs/2605.08120v1 | https://creativecommons.org/licenses/by/4.0/
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
  title: [Heat Transfer in Phase Change Materials with Multiple Fin
Insertion],
  authors: (
    ( name: [Paolo Proia],
      affiliation: "",
      email: "" ),
    ( name: [Mauro Sbragaglia],
      affiliation: "",
      email: "" ),
    ( name: [Giacomo Falcucci],
      affiliation: "",
      email: "" ),
    ),
  abstract-title: [Abstract],
  pagenumbering: "1",
  cols: 1,
  doc,
)


= Introduction
<introduction>
Due to their large latent heat, Phase Change Materials (PCMs) prove
exceptionally useful in storing heat in many fields, including cold
energy storage~\[1,2\], building insulation~\[3\], thermal management in
electronics~\[4\] and hydride thermal management for hydrogen
adsorption/release~\[5,6\], to cite but few examples. The dynamics of
phase change in a PCM system involves a complex coupling between
buoyancy forces, melting and thermal convection~\[7--11\]: a solid
substance melts due to the heating from a source boundary; the liquid,
then, develops buoyancy-driven thermal convection, eventually leading to
the complete liquefaction of the solid phase (see~#link(<fig:1>)[1]). \
Since PCM heat transfer properties are usually suboptimal, many research
efforts have been devoted to relieve this flaw. Among the many design
solutions in the literature~\[12,13\], the insertion of fins delivers a
simple, both conceptually and manufacturing-wise, yet effective way of
transferring heat to a PCM. Paramount to fin effectiveness is their
strategic placement, to promote diffusion in the early stages of
melting, as well as convection in the late dynamics~\[4,14--17\]. Recent
examples in the literature include~\[4\], in which the authors study and
optimize branching fin structures to boost the performance of a battery
pack thermal management system based on PCMs; in~\[15\], a parametric
study was conducted focusing on fin orientation and porosity, while
in~\[16\], the effect of fin shape was investigated. In \[18\],
honeycomb fins were investigated: the trade-off between the increase in
system mass and volume associated with the fins is discussed, as well as
the resulting improvement in hydrogen absorption/desorption rates; in
\[19\], a metal hydride--PCM reactor is optimized by introducing a "fin
factor" index to balance heat transfer surface enhancement against
geometric penalties, with the aim of improving thermally limited
charging and discharging times. Further applications and optimizations
can be found in~\[20--22\]. \
Even without buoyancy, melting is a complex simulation task, due to the
presence of the moving boundary between the solid and liquid phases;
including gravitational effects adds the non-linearity of convection to
the evolution of the interphase boundary. Thus, an accurate
characterization of the temporal evolution of the melting front requires
detailed local information. While such insight can be (partially)
obtained through carefully designed experiments~\[11,23\], numerical
simulations grant deeper insight, allowing higher spatial and temporal
resolution for the evaluation of PCM performance~\[10,24--26\]. On the
top of this quite intricate scenario, the addition of fins modifies the
boundary shape adding another layer of complexity. \
In this letter, we conduct numerical simulations to provide a
quantitative insight on the impact of different geometrical
configurations of fins in the enclosure, extending to three dimensions
previous analyses conducted with the same numerical approach~\[17\]. In
particular, we address key issues on the importance of the number of
adopted fins, as well as their spatial layout. Our systematic analysis
hinges on the study of equivalent configurations, i.e. layouts with the
same heating areas but with different numbers of heating elements and
different geometrical designs. The parametric tests are based on
non-dimensional numbers characterizing the flow, providing a useful,
technical operational tool. Thus, in order to dissect the effective role
of fluid properties and heating element layouts, we also test the same
configurations in different convection regimes (i.e. higher or lower
relative convection strength), regulated by different values of the
Rayleigh Number $"Ra"$. Later, we provide an analysis in the conductive
regime for different values of the Stefan Number (i.e. the ratio of
sensible heat to latent heat) $"St"$.

#figure([#figure([#block[
    $ t^star.op = 0.00 $ #box(image("figures/star00.png"))

    ]
    #block[
    $ t^star.op = 0.05 $ #box(image("figures/star1.png"))

    ]
    \

    #block[
    $ t^star.op = 0.15 $ #box(image("figures/star2.png"))

    ]
    #block[
    $ t^star.op = 0.25 $ #box(image("figures/star3.png"))

    ]
    \

    #block[
    #box(image("figures/cbar.png")) \
    $T$

    ]
    #block[
    #block[
    \(c) \
    #box(image("figures/line_sketch_1.png"))

    ]
    #block[
    \(d) \
    #box(image("figures/plate_sketch_1.png"))

    ]
    ]],
    caption: [
    ]
  )

  #figure([#block[
    #box(image("figures/line0.png")) i) line

    ]
    #block[
    #box(image("figures/rect0.png")) ii) rect

    ]
    \

    #block[
    #box(image("figures/stagger0.png")) iii) stagger

    ]
    #block[
    #box(image("figures/star0.png")) iv) star

    ]
    \

    #block[
    #box(image("figures/square0.png")) v) square

    ]
    #block[
    #box(image("figures/midplate0.png")) vi) midplate

    ]
    \

    #block[
    #box(image("figures/lowplate0.png")) vii) lowplate

    ]
    #block[
    #box(image("figures/finless0.png")) viii) finless

    ]],
    caption: [
    ]
  )

  ],
  caption: [
    Panel (a): typical snapshots of temperature field in the melting
    dynamics of a PCM cell consisting of a cubic enclosure with side $L$
    under the effect of gravity $arrow(g) = - g hat(z)$. The solid
    substance is rendered as transparent. A side boundary of the
    enclosure consists of a hot wall at temperature
    $T_(upright("H")) = 1$ featuring hot fins/plates protruding into the
    enclosure. Different dimensionless times $t^star.op$ are reported
    (see text for details). Panel (b): different geometrical
    configurations used in the simulation. Panels (c)-(d): close up on
    the geometrical structure of the fins/plates used.
  ]
)
<fig:1>

= Hydrodynamic description of thermal convection with melting
<sec:methods>
The PCM cell is modeled as a cubic enclosure of side length $L$
initially filled with a solid material at temperature
$T_(upright("C"))$. The solid material is heated from a hot source on
the left wall at temperature $T_(upright("H"))$\; the a side wall also
presents different heating elements (multiple fins or a plate)
protruding into the bulk of the enclosure (see~#link(<fig:1>)[1]). Heat
transfer is triggered by the hot source, generating the melting of the
solid material and triggering the convective dynamics of the molten
phase~\[23,25,27\]. This complex scenario is studied at the
hydrodynamical level via the continuum fields of density
$rho = rho \( arrow(x) \, t \)$, velocity
$arrow(u) = arrow(u) \( arrow(x) \, t \)$ and temperature
$T = T \( arrow(x) \, t \)$\; melting is locally monitored via the
liquid fraction $phi.alt = phi.alt \( arrow(x) \, t \)$ that assumes
values between $0$ (solid) and $1$ (liquid). These fields obey the
Navier-Stokes equations with buoyancy forces plus an advection-diffusion
equation for the temperature featuring a melting term~\[8,23,28,29\]:
$ partial_t rho + arrow(nabla) dot.op (rho arrow(u)) = 0 $<eq:ns-mass>
$ \( partial_t + arrow(u) dot.op arrow(nabla) \) arrow(u) = nu nabla^2 arrow(u) - frac(arrow(nabla) p, rho) - alpha \( T - T_0 \) arrow(g) $<eq:ns-momentum>
$ partial_t T + arrow(nabla) dot.op \( T arrow(u) \) = kappa nabla^2 T - L_f / C_p partial_t phi.alt $<eq:temperature-equation>
where $p = p \( arrow(x) \, t \)$ represents the fluid pressure, $nu$
the fluid kinematic viscosity, $kappa$ the thermal diffusivity, $L_f$
the latent heat of fusion and $C_p$ the specific heat. The buoyancy term
in the r.h.s. of Eq.~#ref(<eq:ns-momentum>); is
written in the Boussinesq approximation~\[23,28,29\], being proportional
to the thermal expansion coefficient $alpha$, the temperature difference
w.r.t. a reference temperature $T_0$, and the gravity acceleration
$arrow(g)$ pointing in the negative $z$ direction (see Fig.~@fig:1). The
melting term in the r.h.s. of
Eq.~#ref(<eq:temperature-equation>); models
heat transfer due to the melting of the substance. The liquid fraction
$phi.alt$ depends on the local enthalpy $h = h \( arrow(x) \, t \)$ via
a a smoothed step function~\[23,26\]:
$ phi.alt \( arrow(x) \, t \) = cases(delim: "{", 0 & h < h_s, frac(h \( arrow(x) \, t \) - h_s, h_l - h_s) & h_s lt.eq h lt.eq h_l, 1 & h > h_l) $<eq:phi-of-h>
where $h_s = C_p T_(upright("C"))$ is the solid phase enthalpy and
$h_l = h_s + L_f$ the liquid phase enthalpy. The local enthalpy, in
turn, depends on both the temperature and the liquid fraction,
$h \( arrow(x) \, t \) = C_p T \( arrow(x) \, t \) + L_f phi.alt \( arrow(x) \, t \)$.
The bulk
equations~#ref(<eq:ns-mass>);-#ref(<eq:temperature-equation>);
are supplemented with boundary conditions for both $arrow(u)$ and $T$.
From the thermal point of view the fins and the wall from which the fins
protrude are sources with a prescribed fixed temperature
$T_(upright("H"))$\; all the other boundaries of the cubic enclosure are
set as insulating (i.e. #emph[adiabatic]) walls. All solid boundaries
are treated as no-slip boundaries for the velocity field. \
The numerical simulations
of~#ref(<eq:ns-mass>);-#ref(<eq:temperature-equation>);
are performed by means of the Lattice Boltzmann models (LBM), a
numerical tool that has proven to be reliable and accurate for the study
of complex flow dynamics~\[30--34\] . More specifically, we developed a
LB-based solver capable of simulating the convective flows coupled to
melting dynamics in presence of complex boundary conditions~\[5,23,24\].
Here, the code is a 3D extension of the code developed and validated in
earlier studies by the authors, focused on the study of melting dynamics
in 2D PCM cells~\[8,17\].

= Geometry and Setup
<sec:setup>
Different geometrical configurations of the PCM cell are analyzed. The
layouts are systematically selected in order to isolate the role of
geometry, while keeping constant the total heated area and source
temperature $T_(upright("H"))$. More specifically, the present analysis
is aimed at providing a consistent three-dimensional framework to
systematically assess widely used designs in the
literature~\[9,20,35--37\]. \
The very first group of configurations stems from the simple idea of
repeating a fin a number of times: four was chosen as it is not too high
nor too low. A variety of diverse geometrical configurations is then
obtained via translation operations, namely: i) #emph[Line], with the 4
fins horizontally aligned at the same height; ii) #emph[Rect], with two
fins at the same height, the other two higher at the same horizontal
position; iii) #emph[Stagger], similar to rect, but with a slight
horizontal offset for the higher fins; iv) #emph[Star], with two fins at
the same height, the other two at the same horizontal position, halfway
between the other two, one higher and one lower. To better understand
the role of the relative closeness of the fins, we also devised another
geometrical arrangement: v) #emph[square], a configuration in which the
fins are at a larger, equal distance between themselves. The above
configurations are shown in~#link(<fig:1>)[1]b. The length, height and
width (see~#link(<fig:1>)[1]c) for a single fin are
$\( l \, h \, w \) = \( 63 \, 4 \, 8 \) \/ L$. \
In order to address the effect of the number of fins, we also designed
configurations with a single plate. The plate is designed with a total
heating surface equal to that of the fins: given the heating surface of
the fin, $S_(upright("H,FIN")) = 2 \( l w + l h + w h \) - w h$, the
heating surface of the plate is taken as
$S_(upright("H,PLATE")) = 4 dot.op S_(upright("H,FIN"))$. Note that in
the computation of the heating surface, we have excluded the contact
surface between the fin and the wall. The dimensions of the plate
(see~#link(<fig:1>)[1]d) were then chosen as
$\( a \, b \, c \) = \( 56 \, 5 \, 48 \) \/ L$. Moreover, the inclusion
of the plate was studied in two configurations, namely: vi)
#emph[Midplate], with a single, slab-like ledge positioned at about half
the height of the enclosure; vii) #emph[Lowplate]: similar to
#emph[Midplate], but at a lower vertical position, in order to test the
importance of the latter~\[17\] in 3D environments. Finally, to
systematically assess the impact of the presence of the fins/plate,
compared to a finless wall we have considered two further layouts: vii)
#emph[Finless], a simple cubic enclosure, with no fins, and a bare, side
wall of area $L^2$ as the source at temperature $T_(upright("H"))$\;
viii) #emph[FinlessHotter], similar to #emph[Finless], but with a source
temperature $T_(upright("HFL"))$. $T_(upright("HFL"))$ is chosen in such
a way that its integral over the side boundary of area $L^2$ equals the
integral of the source temperature $T_(upright("H"))$ in a configuration
with fins, i.e.
$T_(upright("HFL")) dot.op L^2 = T_(upright("H")) dot.op \( L^2 + 4 dot.op S_(upright("H,FIN")) \)$.
\
The performance of the different geometrical configurations is analyzed
by changing also relevant non-dimensional numbers governing the
phenomena under investigation. To measure the intensity of buoyancy
forces w.r.t. diffusive/dissipative effects, we use as an input
parameter the Rayleigh Number $"Ra"$:
$ "Ra" = frac(g alpha L^3, nu kappa) \( T_(upright("H")) - T_(upright("C")) \) . $<eq:rayleigh-number>
The Stefan Number
$ "St" = C_p / L_f \( T_(upright("H")) - T_(upright("C")) \) $<eq:stefan-number>
accounts for the ratio of sensible to latent heat. The Prandtl Number
$Pr = nu \/ kappa = 1$ is kept fixed. To monitor the melting process
within the cell we take the space integral of the liquid fraction
normalized to the PCM volume $V_(upright("PCM")) = L^3 - 4 dot.op w h l$
$ chevron.l phi.alt chevron.r \( t \) = frac(sum_(arrow(x)) phi.alt \( arrow(x) \, t \), V_(upright("PCM"))) . $<eq:phi-star>
Finally, for the sake of simplicity, the results are reported using the
dimensionless time $t^star.op = t \/ t_(upright("max"))$, with
$t_(upright("max")) = 2 dot.op 10^4$ for all the simulations. The other
parameters are fixed, in lattice units, at
$g = 9.8067 \, thin nu = 0.1 \, thin kappa = 0.1 \, thin L = 128 \, thin T_H = 1 \, thin T_C = 0 \, thin T_0 = 0.5 \, thin T_(upright("HFL")) = 1.3890 \, thin L_f = 10^3$.

= Results and discussions
<sec:results>
#figure(image("figures/rayleigh-comparison.png"),
  caption: [
    We report the normalized liquid fraction
    (cfr.~#ref(<eq:phi-star>);) as a function of the
    dimensionless time $t^star.op$ for different Rayleigh numbers
    (cfr.~#ref(<eq:rayleigh-number>);) for a
    fixed Stefan number $"St" = 10$. The different geometrical
    configurations are illustrated in~#link(<fig:1>)[1] with the
    exception of finlesshotter whose details are given in the text.
  ]
)
<fig:ra-comparison>

#figure([#figure(image("figures/fine.png"),
    caption: [
    ]
  )

  #figure([#block[
    $ t^star.op = 1.5 dot.op 10^(- 2) $

    #block[
    #box(image("figures/perimeter_rect_0.015.png", width: 85.0%))
    #box(image("figures/front_perimeter_rect_0.015.png", width: 40.0%))

    ]
    \

    #block[
    #box(image("figures/perimeter_square_0.015.png", width: 85.0%))
    #box(image("figures/front_perimeter_square_0.015.png", width: 40.0%))

    ]
    \

    #block[
    #box(image("figures/perimeter_lowplate_0.015.png", width: 85.0%))
    #box(image("figures/front_perimeter_lowplate_0.015.png", width: 40.0%))

    ]
    ]
    #block[
    $ t^star.op = 1.0 dot.op 10^(- 1) $

    #block[
    #box(image("figures/perimeter_rect_0.1.png", width: 85.0%))
    #box(image("figures/front_perimeter_rect_0.1.png", width: 40.0%))

    ]
    \

    #block[
    #box(image("figures/perimeter_square_0.1.png", width: 85.0%))
    #box(image("figures/front_perimeter_square_0.1.png", width: 40.0%))

    ]
    \

    #block[
    #box(image("figures/perimeter_lowplate_0.1.png", width: 85.0%))
    #box(image("figures/front_perimeter_lowplate_0.1.png", width: 40.0%))

    ]
    ]
    \

    #block[
    #box(image("figures/cbar_phi.png")) \
    $phi.alt$

    ]],
    caption: [
    ]
  )

  ],
  caption: [
    Analysis of the early-stage melting dynamics in conductive case,
    corresponding to a zero Rayleigh number
    (cfr.~#ref(<eq:rayleigh-number>);). Panel
    (a): we report the normalized liquid fraction
    (cfr.~#ref(<eq:phi-star>);) as a function of the
    dimensionless time $t^star.op$ for different geometrical
    configurations and different Stefan numbers
    (cfr.~#ref(<eq:stefan-number>);). The
    geometrical configurations used are illustrated
    in~#link(<fig:1>)[1]. Panel (b): 3D snapshots of the liquid fraction
    $phi.alt \( arrow(x) \)$ at different times for the #emph[rect] and
    #emph[square] configurations, $"St" = 10$. Each plot includes a
    front facing perspective on the bottom right.
  ]
)
<fig:fine-comparison>

First, we focus on the characterization of the time evolution of the
normalized liquid fraction, according
to~#ref(<eq:phi-star>);, as a function of $"Ra"$, while
keeping $"St" = 10$, i.e. $C_p = 10^4$. Figure~@fig:ra-comparison
reports the trends of $chevron.l phi.alt chevron.r \( t^star.op \)$ for
the different geometrical configurations illustrated
in~#link(<fig:1>)[1]b, for
$"Ra" = 2.0 dot.op 10^2 \, med 2.0 dot.op 10^5$, $1.2 dot.op 10^6$,
corresponding to $alpha = 10^(- 7) \, 10^(- 4) \, 6 dot.op 10^(- 4)$.
Increasing $"Ra"$ results in better performance for all the
configurations in terms of reduced time to achieve the complete melting
($chevron.l phi.alt chevron.r = 1$) of the solid PCM. This observation
is in line with the literature, as it is known that higher values of
$"Ra"$ point to increased importance of convection, which is the main
driver of heat transfer in melting systems~\[38--41\]. Moreover, simply
raising the source temperature proves less effective than inserting
fins, as #emph[finlesshotter] is generally worse-performing than the
finned configurations, proving the fundamental role of the geometry.
Increasing $"Ra"$ can reduce the advantage of the finned configurations
with respect to other configurations, as the fins can impede convection
by breaking up macroscopical flows; in fact, a #emph[proper] positioning
of the fins in the lower parts of the enclosure can favor melting by
promoting the onset and development of convection~\[17\].

Regarding the performance of the plated configurations, we can see that
#emph[lowplate] performs generally better than #emph[midplate]. We also
notice that this is more evident at higher $"Ra"$, pointing to the same
advantage of lower positioning that favors the development of larger
convective structures~\[17\]

Results in Figure~@fig:ra-comparison exhibit a difference in performance
between the plated and the finned configurations: we argue that this is
due to the different spatial distribution of the heating surface (which
is always kept constant), that favors the performance of the finned
configurations. We can also provide a simple but efficient argument to
understand such a difference in the early stages of melting: one can
assume that the substance melts at a characteristic distance $d$ from
the heating surfaces. If we compute the difference between the substance
melted by fins $V_(m \, f i n)$ and by the plate $V_(m \, p l a t e)$ we
get#footnote[Choosing $t = 0$ for the sake of simplicity]:
$ Delta V_m = 4 V_(m \, f i n) - V_(m \, p l a t e)\
V_(m \, f i n) = \( d + l \) \( 2 d + h \) \( 2 d + w \) - l h w\
V_(m \, p l a t e) = \( d + a \) \( 2 d + b \) \( 2 d + c \) - a b c $
where $l h w$ and $a b c$ are the volumes of the heating elements (we
are excluding the wall-facing surface). Substituting $L$ and the chosen
fin and plate dimensions:
$ Delta V_m = 3 / 64 d^2 \( 256 d + 129 \) \, $ which is strictly
positive. This computation neglects the melting from the side boundary
which is reasonably assumed equal in both cases. The positivity of
$Delta V_m$ is an indication that the finned configuration uses the
#emph[same] heating surface more efficiently, melting more substance in
the same time. Of course, we must stress that this computation is
reasonable only in the early stages of melting, where conduction
dominates the dynamics. Nevertheless, the fact that the finned
configurations produce a larger molten region in the early stages,
increases the effective liquid--solid interfacial area. This, in turn,
promotes heat transfer and leads to a sustained advantage in the overall
melting dynamics. \
Regarding the relative differences between plated and finned
configurations, we note that by increasing $"Ra"$, the plated
configurations get closer to the finned ones, i.e. the latter
configurations gain more (in terms of melted PCM) compared to the
former; arguably, this is due to the presence of a larger surface
$perp arrow(g)$, since we have $a c > 4 l w$ for the chosen sizes.

Another important feature to remark in the analysis of
Figure~@fig:ra-comparison is that configurations i)-iv), despite being
quite geometrically different, deliver essentially the same performance.
Configuration v) (square) with further apart fins, performs better than
i)-iv). This suggests the presence of effects triggered by the closeness
of the fins that may lead to an energetic overlap in molten zones,
during the early stages, thus "wasting" thermal energy on already melted
substance. In order to provide some quantitative evidence of this
hypothesis, we focus on a purely conductive regime ($"Ra" = 0$) to be
able to stress the difference between v) and i)-iv). Moreover, since the
melting speed in the conductive dynamics is regulated by the Stefan
number $"St"$, we analyze data related to two different values of
$"St"$, namely $"St" = 1 \, 10$, obtained by choosing
$C_p = 10^3 \, 10^4$, aiming to prove the robustness of the trend.
In~#link(<fig:fine-comparison>)[3]a we analyze the dynamics of the
normalized liquid fraction in the conductive regime, for different
geometrical configurations. A lower value of $"St"$ delivers slower
melting, but the separation happens regardless, just delayed in time.
Again, the plated configurations perform worse.
In~#link(<fig:fine-comparison>)[3]b snapshots of
$phi.alt \( arrow(x) \)$ for $"St" = 10$ are shown for #emph[rect] and
#emph[square] at the time for which the latter visibly separates from
the other configurations ($t^star.op = 1.5 dot.op 10^(- 2)$) and at the
last time shown in~#link(<fig:fine-comparison>)[3]a
($t^star.op = 1.0 dot.op 10^(- 1)$). A comparison between the first and
second rows highlights that an interference in the molten zones can
already be seen for the #emph[rect] configuration at times for which it
is absent for the #emph[square] configuration
($t^star.op = 1.5 dot.op 10^(- 2)$). This overlap is clearly responsible
for the reduction of the total molten volume in the #emph[rect]
configuration. In the third row, the #emph[lowplate] configuration is
also shown, giving visual proof of the worse spatial efficiency of such
configurations. Overall, the better performance of #emph[square] proves
that the relative distance between fins matters: further apart fins gain
an advantage that cascades in overall better melting.

= Conclusions
<sec:conclusions>
Phase Change Materials (PCMs) are playing an increasingly important role
in energy-related applications, ranging from thermal energy storage and
building technologies to thermal management in electronics and hydrogen
systems~\[5,42--44\]. Improving PCM heat transfer capabilities without
introducing active components is a key technological challenge, making
passive optimization strategies particularly attractive for engineering
applications. The insertion of fins inside a PCM is known to be a simple
and effective way of enhancing the overall thermal performance~\[35\].
This letter systematically addressed the impact of fin layout and
geometrical configurations on melting. First, two aspects already known
from the literature~\[17,35\] were confirmed: 1) fin insertion provides
more efficient melting with lower relative temperature due to the onset
of convection and 2) fins positioned in the lower parts of the chamber
give rise to larger convective motions (and, thus, enhanced thermal
transfer) than equivalent fins positioned in the upper part of the
domain. We further observed that distributing the same heating surface
over multiple slender fins is more effective than concentrating it into
a single plate-like element, as multiple sources melt more PCM in the
early stages, leading to larger melting rates. From the analysis of the
fin layouts, we found that the relative positioning of fins can lead to
overlapping molten zones, due to excessive closeness: too-close
configurations lead to early overlap of molten regions, resulting in
inefficient use of thermal energy. In contrast, configurations with more
distant fins are characterized by a smoother distribution of the heat,
leading to efficient melting. \
The findings in this letter pave the way for further investigations in
order to assess whether they remain valid in a wider range of values of
$"Ra"$. Furthermore, testing different sizes/shapes for the designed
fins, as well as studying more in detail the role of interstitial spaces
in relation to the fin height could reveal more interesting
peculiarities on melting dynamics. Finally, exploring more complex fin
geometries and resorting to hybrid technical solutions (metal foams,
nanoparticle insertion and different chemical compositions among the
others), to improve thermal transfer~\[12,13,21,45,46\] could help
extend the present analysis towards broader design principles. The
authors acknowledge the support of the National Center for HPC, Big Data
and Quantum Computing, Project CN\_00000013 - CUP E83C22003230001,
Mission 4 Component 2 Investment 1.4, funded by the European Union -
NextGenerationEU. Support from INFN/FIELDTURB project is also
acknowledged. The authors wish to acknowledge the support of Project
PRIN 2022 F422R2- CUP E53D23003210006, financed by the European
Union-NextGenerationEU; the support of Project PRIN PNRR P202298P25 -
CUPE53D23016990001, financed by the European Union-NextGenerationEU; and
the support of Project ECS 0000024 Rome Technopole-CUP B83C22002820006,
NRP Mission 4 Component 2 Investment 1.5, funded by the European Union-
NextGenerationEU. This work was partially supported by the Office of
Naval Research of the United States of America, with Drs. J. Dibelka and
S. Shroeder as program managers (Grant N62909-24-1-2072).

#block[
#block[
\[1\] Chavan S, Rudrapati R, Manickam S. A comprehensive review on
current advances of thermal energy storage and its applications.
Alexandria Engineering Journal 2022;61:5455--63.
#link("https://doi.org/10.1016/j.aej.2021.11.003").

] <ref-chavan-comprehensive-2022>
#block[
\[2\] Altuntas M, Erdemir D, Unalan S. A comprehensive performance
evaluation of phase change materials for cold energy storage systems.
Energy and Buildings 2025;330:115349.
#link("https://doi.org/10.1016/j.enbuild.2025.115349").

] <ref-altuntas-comprehensive-2025>
#block[
\[3\] Wang X, Li W, Luo Z, Wang K, Shah SP. A critical review on phase
change materials (PCM) for sustainable and energy efficient building:
Design, characteristic, performance and application. Energy and
Buildings 2022;260:111923.
#link("https://doi.org/10.1016/j.enbuild.2022.111923").

] <ref-wang-critical-2022>
#block[
\[4\] Xie Y, Zhang F, Hu S, Luo X, Xuan W, Tian Z, et al. Investigation
of novel Y-shaped bifurcated fins to enhance thermal performance in
phase change material-based battery thermal management systems. Thermal
Science and Engineering Progress 2025;66.
#link("https://doi.org/10.1016/j.tsep.2025.103989").

] <ref-xie-investigation-2025>
#block[
\[5\] Facci AL, Lauricella M, Succi S, Villani V, Falcucci G. Optimized
Modeling and Design of a PCM-Enhanced H2 Storage. Energies 2021;14:1554.
#link("https://doi.org/10.3390/en14061554").

] <ref-facci-optimized-2021>
#block[
\[6\] Maggini M, Facci AL, Falcucci G, Ubertini S. Increasing the Metal
Hydride Power Density using Phase Change Materials, Advanced Thermal
Supports, and Expanded Graphite Nano-Particles. SSRN (Preprint) 2025.

] <ref-maggini-increasing->
#block[
\[7\] Du Y, Calzavarini E, Sun C. The physics of freezing and melting in
the presence of flows. Nature Reviews Physics 2024;6:676--90.
#link("https://doi.org/10.1038/s42254-024-00766-5").

] <ref-du-physics-2024>
#block[
\[8\] Proia P, Sbragaglia M, Falcucci G. Melting with natural convection
with heterogeneous heating sources. Applied Thermal Engineering
2024;257:124089.
#link("https://doi.org/10.1016/j.applthermaleng.2024.124089").

] <ref-proia-melting-2024>
#block[
\[9\] Oskouei SB, Li Z-R, Bayer Ö, Fan L-W. Close-contact melting and
natural convection in unconstrained melting: A parametric study.
International Journal of Heat and Mass Transfer 2024;218:124795.
#link("https://doi.org/10.1016/j.ijheatmasstransfer.2023.124795").

] <ref-oskouei-closecontact-2024>
#block[
\[10\] Yan G, Alizadeh A, Rahmani A, Zarringhalam M, Shamsborhan M,
Nasajpour-Esfahani N, et al. Natural convection of rectangular cavity
enhanced by obstacle and fin to simulate phase change material melting
process using Lattice Boltzmann method. Alexandria Engineering Journal
2023;81:319--36. #link("https://doi.org/10.1016/j.aej.2023.09.035").

] <ref-yan-natural-2023>
#block[
\[11\] Wang Z, Calzavarini E, Sun C. Equilibrium states of the ice-water
front in a differentially heated rectangular cell#super[\(a)]. EPL
(Europhysics Letters) 2021;135:54001.
#link("https://doi.org/10.1209/0295-5075/ac30e7").

] <ref-wang-equilibrium-2021>
#block[
\[12\] Togun H, Sultan HS, Mohammed HI, Sadeq AM, Biswas N, Hasan HA, et
al. A critical review on phase change materials (PCM) based heat
exchanger: Different hybrid techniques for the enhancement. Journal of
Energy Storage 2024;79:109840.
#link("https://doi.org/10.1016/j.est.2023.109840").

] <ref-togun-critical-2024>
#block[
\[13\] Michał Rogowski, Rafał Andrzejczyk. Recent advances of selected
passive heat transfer intensification methods for phase change
material-based latent heat energy storage units: A review. International
Communications in Heat and Mass Transfer 2023;144:106795--5.
#link("https://doi.org/10.1016/j.icheatmasstransfer.2023.106795").

] <ref-michalrogowski-recent-2023>
#block[
\[14\] Wu J, Chen Q, Zhang Y, Sun K. Phase change material heat transfer
enhancement in latent heat thermal energy storage unit with single fin:
Comprehensive effect of position and length. Journal of Energy Storage
2021;42:103101. #link("https://doi.org/10.1016/j.est.2021.103101").

] <ref-wu-phase-2021>
#block[
\[15\] Jaberi A, Hossainpour S. Optimizing melting performance in latent
heat thermal energy storage systems: Numerical analysis of porous fins
vs. Solid fins performance. Thermal Science and Engineering Progress
2025;63. #link("https://doi.org/10.1016/j.tsep.2025.103729").

] <ref-jaberi-optimizing-2025>
#block[
\[16\] Bhowmik JR, Mia MdS, Zisan HTA. Embedding lower fin to enhance
the thermal performance of phase-change material. Thermal Science and
Engineering Progress 2025;66.
#link("https://doi.org/10.1016/j.tsep.2025.104009").

] <ref-bhowmik-embedding-2025>
#block[
\[17\] Proia P, Sbragaglia M, Falcucci G. Heat transfer modulation in
Phase Change Materials via fin insertion. arXiv Preprint arXiv:250704851
\2025. #link("https://doi.org/10.48550/ARXIV.2507.04851").

] <ref-proia-heat-2025>
#block[
\[18\] Dong X, Zhao H, Li H, Fucucci G, Zheng Q, Zhao H, et al. A novel
design of a metal hydride reactor integrated with phase change material
for H2 storage. Applied Energy 2024;367:123321.
#link("https://doi.org/10.1016/j.apenergy.2024.123321").

] <ref-dong-novel-2024>
#block[
\[19\] Shrivastav AP, Kanti PK, Mohan G, Maiya M. Design and
optimization of metal hydride reactor with phase change material using
fin factor for hydrogen storage. Journal of Energy Storage
2024;77:109975.

] <ref-shrivastav2024design>
#block[
\[20\] Zhu X, Li Y, Zhu Q. Heat transfer enhancement technology for fins
in phase change energy storage. Journal of Energy Storage
2022;55:105833. #link("https://doi.org/10.1016/j.est.2022.105833").

] <ref-zhu-heat-2022>
#block[
\[21\] Zhao C, Opolot M, Liu M, Wang J, Bruno F, Mancin S, et al. Review
of analytical studies of melting rate enhancement with fin and/or foam
inserts. Applied Thermal Engineering 2022;207:118154.
#link("https://doi.org/10.1016/j.applthermaleng.2022.118154").

] <ref-zhao-review-2022>
#block[
\[22\] Amati G, Succi S, Falcucci G. Enhancing the power performance of
latent heat thermal energy storage systems: The adoption of passive,
fractal supports. Energies 2023;16:6764.

] <ref-amati2023enhancing>
#block[
\[23\] Huber C, Parmigiani A, Chopard B, Manga M, Bachmann O. Lattice
Boltzmann model for melting with natural convection. International
Journal of Heat and Fluid Flow 2008;29:1469--80.
#link("https://doi.org/10.1016/j.ijheatfluidflow.2008.05.002").

] <ref-huber-lattice-2008>
#block[
\[24\] Wang Z, Jiang L, Du Y, Sun C, Calzavarini E. Ice front shaping by
upward convective current. Physical Review Fluids 2021;6:L091501.
#link("https://doi.org/10.1103/PhysRevFluids.6.L091501").

] <ref-wang-ice-2021>
#block[
\[25\] Favier B, Purseed J, Duchemin L. Rayleigh--Bénard convection with
a melting boundary. Journal of Fluid Mechanics 2019;858:437--73.
#link("https://doi.org/10.1017/jfm.2018.773").

] <ref-favier-rayleigh-2019>
#block[
\[26\] Shyy W. Computational fluid dynamics with moving boundaries.
Mineola, N.Y.: Dover Publications; 2007.

] <ref-shyy-computational-2007>
#block[
\[27\] Rabbanipour Esfahani B, Hirata SC, Berti S, Calzavarini E. Basal
melting driven by turbulent thermal convection. Physical Review Fluids
2018;3:053501. #link("https://doi.org/10.1103/PhysRevFluids.3.053501").

] <ref-rabbanipouresfahani-basal-2018>
#block[
\[28\] Guo Z, Shi B, Zheng C. A coupled lattice BGK model for the
Boussinesq equations. International Journal for Numerical Methods in
Fluids 2002;39:325--42. #link("https://doi.org/10.1002/fld.337").

] <ref-guo-coupled-2002>
#block[
\[29\] Chandrasekhar S. Hydrodynamic and Hydromagnetic Stability. Dover
Publications; 2013.

] <ref-chandrasekhar-hydrodynamic-2013>
#block[
\[30\] Succi S. The lattice Boltzmann equation for fluid dynamics and
beyond. Oxford : New York: Clarendon Press \; Oxford University Press;
\2001.

] <ref-succi-lattice-2001>
#block[
\[31\] Krüger T, Kusumaatmaja H, Kuzmin A, Shardt O, Silva G, Viggen EM.
The Lattice Boltzmann Method: Principles and Practice. Cham: Springer
International Publishing; 2017.
#link("https://doi.org/10.1007/978-3-319-44649-3").

] <ref-kruger-lattice-2017>
#block[
\[32\] Falcucci G, Amati G, Fanelli P, Krastev VK, Polverino G, Porfiri
M, et al. Extreme flow simulations reveal skeletal adaptations of
deep-sea sponges. Nature 2021;595:537--41.
#link("https://doi.org/10.1038/s41586-021-03658-1").

] <ref-falcucci-extreme-2021>
#block[
\[33\] Falcucci G, Amati G, Bella G, Facci AL, Krastev VK, Polverino G,
et al. Adapting to the Abyss: Passive Ventilation in the Deep-Sea Glass
Sponge #emph[Euplectella] #emph[Aspergillum]. Physical Review Letters
2024;132:208402.
#link("https://doi.org/10.1103/PhysRevLett.132.208402").

] <ref-falcucci-adapting-2024>
#block[
\[34\] Falcucci G, Giannopoulou O, Proia P, Amati G, Porfiri M.
Hydrodynamic entanglement in the abyss: Morphological adaptations of
groups of e. aspergillum. Submitted to PNAS Nexus 2026.

] <ref-falcucci-hydrodinamic-2026>
#block[
\[35\] Sharifi N, Bergman TL, Faghri A. Enhancement of PCM melting in
enclosures with horizontally-finned internal surfaces. International
Journal of Heat and Mass Transfer 2011;54:4182--92.
#link("https://doi.org/10.1016/j.ijheatmasstransfer.2011.05.027").

] <ref-sharifi-enhancement-2011>
#block[
\[36\] Chunrong Zhao, Chunrong Zhao, Jianyong Wang, Jianyong Wang,
Yubiao Sun, Yubiao Sun, et al. Fin design optimization to enhance PCM
melting rate inside a rectangular enclosure. Applied Energy
2022;321:119368--8.
#link("https://doi.org/10.1016/j.apenergy.2022.119368").

] <ref-chunrongzhao-fin-2022>
#block[
\[37\] Huo Y, Rao Z. Lattice Boltzmann investigation of the solid-liquid
phase change process in a cavity with protruding heater. International
Journal of Thermal Sciences 2017;122:292--301.
#link("https://doi.org/10.1016/j.ijthermalsci.2017.09.004").

] <ref-huo-lattice-2017>
#block[
\[38\] Yang R, Howland CJ, Liu H-R, Verzicco R, Lohse D. Morphology
evolution of a melting solid layer above its melt heated from below.
Journal of Fluid Mechanics 2023;956:A23.
#link("https://doi.org/10.1017/jfm.2023.15").

] <ref-yang-morphology-2023>
#block[
\[39\] Jany P, Bejan A. Scaling theory of melting with natural
convection in an enclosure. International Journal of Heat and Mass
Transfer 1988;31:1221--35.
#link("https://doi.org/10.1016/0017-9310(88)90065-8").

] <ref-jany-scaling-1988>
#block[
\[40\] Du Y, Wang Z, Jiang L, Calzavarini E, Sun C. Sea water freezing
modes in a natural convection system. Journal of Fluid Mechanics
2023;960:A35. #link("https://doi.org/10.1017/jfm.2023.215").

] <ref-du-sea-2023>
#block[
\[41\] Wang P, Zhang Y, Guo Z. Numerical study of three-dimensional
natural convection in a cubical cavity at high Rayleigh numbers.
International Journal of Heat and Mass Transfer 2017;113:217--28.
#link("https://doi.org/10.1016/j.ijheatmasstransfer.2017.05.057").

] <ref-wang-numerical-2017>
#block[
\[42\] Nivedhitha KS, Beena T, Banapurmath NR, Umarfarooq MA, Ramasamy
V, Soudagar MEM, et al. Advances in hydrogen storage with metal
hydrides: Mechanisms, materials, and challenges. International Journal
of Hydrogen Energy 2024;61:1259--73.
#link("https://doi.org/10.1016/j.ijhydene.2024.02.335").

] <ref-nivedhitha-advances-2024>
#block[
\[43\] Maggini M, Facci AL, Falcucci G, Ubertini S. Numerical Modeling
of Metal Hydride-Phase Change Material Hydrogen Storage Systems with
Increased Heat Exchange surface area. Applied Energy 2025;378:124725.
#link("https://doi.org/10.1016/j.apenergy.2024.124725").

] <ref-maggini-numerical-2025>
#block[
\[44\] Maggini M, Falcucci G, Rosati A, Ubertini S, Facci AL.
Non-dimensional numerical analysis of coupled Metal Hydride-Phase Change
Material hydrogen storage system. Journal of Energy Storage
2024;93:112230. #link("https://doi.org/10.1016/j.est.2024.112230").

] <ref-maggini-nondimensional-2024>
#block[
\[45\] Gao D, Chen Z, Zhang D, Chen L. Lattice Boltzmann modeling of
melting of phase change materials in porous media with conducting fins.
Applied Thermal Engineering 2017;118:315--27.
#link("https://doi.org/10.1016/j.applthermaleng.2017.03.002").

] <ref-gao-lattice-2017>
#block[
\[46\] Bianco N, Busiello S, Iasiello M, Mauro GM. Finned heat sinks
with phase change materials and metal foams: Pareto optimization to
address cost and operation time. Applied Thermal Engineering
2021;197:117436.
#link("https://doi.org/10.1016/j.applthermaleng.2021.117436").

] <ref-bianco-finned-2021>
] <refs>
