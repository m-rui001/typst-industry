#import "photon-work.typ": photon-work

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

  set math.equation(numbering: "(1)")
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
  title: [Thermomechanical model of solar cells],
  authors: (
    ( name: [Tom Markvart],
      affiliation: [Centre for Advanced Photovoltaics, Faculty of Electrical Engineering, Czech Technical University in Prague \ Also at the School of Engineering Sciences, University of Southampton, UK],
      email: [tm3\@soton.ac.uk] ),
    ),
  abstract-title: none,
  abstract: [#strong[Abstract] The paper considers a model for the solar
cell as a mechanical open-cycle thermodynamic engine where chemical
potential is produced in an isochoric process corresponding to the
thermalization of electron-hole pairs. Expansion of the beam under
one-sun illumination and current generation are described as isothermal
lost work. More generally, voltage produced in an open cycle process
corresponds to availability, leading to a correction to the
Shockley-Queisser detailed balance limit.

],
  pagenumbering: "1",
  paper: "us-letter",
  margin: (x: 17mm, y: 19mm),
  font: "Libertinus Serif",
  fontsize: 10pt,
  sectionnumbering: "I.",
  cols: 2,
  doc,
)


= Introduction
<introduction>
Thermodynamics provides an alternative view of photovoltaic conversion,
adding fundamental aspects to the traditional electronic
model.#super[#link(<note-1>)[1]]$""^(\,)$#super[#link(<note-2>)[2]]$""^(\,)$#super[#link(<note-3>)[3]] Perceiving, in the Shockley Queisser detailed
balance,#super[#link(<note-4>)[4]] photon fluxes as heat, thermodynamics allows the energy -- in
other words, voltage - to be determined in terms of photon entropy.

In this paper, a thermodynamic model of the solar cell is developed by a
direct analogy with the classical thermodynamics of mechanical heat
engines. This theoretical angle becomes possible by employing a
relationship between the number of photons $N$ in a volume $V$
representing the solar cell which emits photons in a beam with étendue
$cal(E)$ and photon flux $Psi$:#super[#link(<note-5>)[5]]
#math.equation(block: true, numbering: _ => [(1)], $ Psi = frac(c, 4 pi) cal(E) N / V $) <correspondce>

Equation (1) establishes a correspondence, between the photon number $N$
and photon flux density $Psi$ on the one hand, and between the volume
$V$ and the étendue on the other. In particular, it permits the
definition of a volume $v$ of a "thermodynamic photon" in terms of the
beam parameters $cal(E)$ and $Psi$:
#math.equation(block: true, numbering: _ => [(2)], $ v = V / N = frac(c, 4 pi) cal(E) / Psi $) <volume>

The thermodynamic photons that mean here are thermal photons, similar to
a photons of blackbody radiation but restricted to the spectral interval
which can be absorbed by the solar cell -- in other words, radiation
with photon energy in excess of the semiconductor bandgap $E_g$ . We
shall call this radiation quasi-blackbody radiation. The volume per
photon in a solar cell at temperature $T$ emitting with unit emissivity
\/ absorptivity into a full hemisphere (étendue $pi A$, where $A$ is the
cell area) is then #math.equation(block: true, numbering: _ => [(3)], $ v = frac(c, 4 Phi_(E_g) \( T \)) $) <v-Phi> where
#math.equation(block: true, numbering: _ => [(4)], $ Phi_(E_g) \( T \) = Psi / A = frac(2 pi, h^3 c^2) integral_(E_g)^oo frac(E^2, e^(E \/ k_B T) - 1) d E $) <SQ-density>
is the photon flux density.

= Chemical work from photons
<chemical-work-from-photons>
We start by writing down the equivalent of the first law of
thermodynamics for a photon in the form #math.equation(block: true, numbering: _ => [(5)], $ d u = T d s - p d v $) <first-law> where $T$ and $p$ are the temperature and pressure,
and $u$ and $s$ are the energy and entropy per photon.
Equation~#link(<first-law>)[(5)] will be supplemented by an equation for the free
energy per photon -- the chemical potential $mu$ : #math.equation(block: true, numbering: _ => [(6)], $ mu = u - T s $) <chempot>

Equation~#link(<chempot>)[(6)] divides photon energy $u$ into a part - the chemical
potential - which can be extracted to carry out useful work or generate
voltage. The second term on the right hand side -- proportional to the
entropy -- is the heat that needs to be exchanged with a reservoir at
the same temperature as the source of photons when a photon is emitted
or absorbed.

The chemical potential replaces mechanical work of classical
thermodynamics as the key parameter in a thermodynamic treatment of
photovoltaics. To represent this different slant, we replace photon
energy $u$ in~#link(<first-law>)[(5)] by the chemical potential~#link(<chempot>)[(6)]:
#math.equation(block: true, numbering: _ => [(7)], $ d mu = -s d T - p d v $) <dmu-equation>

#figure(photon-work(), kind: image,
  caption: [
    Chemical work produced by photon cooling (thermalization) from
    temperature $T_S$ to temperature $T_o$, compared with mechanical
    work along the isotherm BC.
  ]
)
<work>

With the relevant formalism in place, we can now picture a thermodynamic
process to mimic photovoltaic conversion, as the conversion of a solar
photon at temperature $T_S$ into a photon at ambient temperature $T_o$
whilst producing work. The initial (solar) photon has a chemical
potential of zero, corresponding to blackbody radiation. The final
(ambient temperature) photon has a chemical potential equal to the
voltage in energy units at the contact of the solar cell.

As is customary, we will picture this process in a $p - v$ diagram for
one photon - one photon of quasi-blackbody radiation with an optical
bandgap $E_g$. #super[#link(<note-6>)[6]] The first part of the
conversion process is thermalization of the electron-hole pairs,
accompanied by cooling the photon gas to temperature $T_o$.

We consider here, for the moment, conversion at open circuit when the
emitted photon flux is equal to the incident (and fully absorbed) photon
flux. Let us also assume that the conversion takes place under maximum
concentration of sunlight. This means that the emitted and incident
beams cover the full hemisphere, and have the same étendue $pi A$.

Equation~#link(<volume>)[(2)] then tells us that the beam transformation takes
place at constant volume, and can be represented by line AB in
Fig.~#link(<work>)[1], where the volume $v_S$ is given by Eq.~#link(<v-Phi>)[(3)] with
$T = T_S$. In mechanical terminology, thermalization is therefore an
isochoric process. Constant volume means that no mechanical work is
carried out during thermalization. But the photon produces chemical work
by increasing its chemical potential from zero at point A to some finite
value $mu_(m a x)$ at point B. This chemical potential is equal to the
chemical potential of electron-hole pairs with which the photons are in
equilibrium.

Following thermalization at point B, the photon gas reaches the final
temperature $T_o$ but its density $n^(p h) = 1 \/ v_S$ is high. There
are now two options: photons can be removed by absorption to produce
current. Alternatively, the photon gas can perform mechanical work $w$
by isothermal expansion BC to reach complete equilibrium at density
$1 \/ v_o$, ambient temperature $T_o$, and chemical potential zero.

We can represent the two processes -- thermalization leading to chemical
potential $mu_(m a x)$, and the mechanical $w$ work done by expansion BC
-- quantitatively by integrating Eq.~#link(<dmu-equation>)[(7)]. We observe that
each of the two steps AB and BC corresponds integration over one
variable $T$ or $v$, giving
#math.equation(block: true, numbering: _ => [(8)], $ mu_o - mu_S = 0 = - integral_(T_S)^(T_o) s d T - integral_(v_S)^(v_o) p d v $) <mu-mu>
since the chemical potential of the equilibrium photons at the beginning
and end of the process is zero. The second term on the right hand side
of~#link(<mu-mu>)[(8)] is the mechanical work $w$. The first term gives the
chemical potential $mu_(m a x)$ produced by thermalization:
#math.equation(block: true, numbering: _ => [(9)], $ mu_(m a x) = integral_(T_o)^(T_S) s \( v_s \, T \) d T $) <mu-max-eqn>

Equation~#link(<mu-mu>)[(8)] therefore expresses the equivalence of the chemical
and mechanical work. Let us first interpret the meaning of $mu_(m a x)$
in the language of photovoltaics. To this end we assume that photon
density is sufficiently low and photons form an ideal gas law which, for
one photon, reads #math.equation(block: true, numbering: _ => [(10)], $ p v = k_B T $) <ideal-gas> Evaluating the second integral in Eq.~#link(<mu-mu>)[(8)] then
gives
#math.equation(block: true, numbering: _ => [(11)], $ mu_(m a x) = w = k_B T_o integral_(v_S)^(v_o) frac(d v, v) = k_B T_o ln (v_o / v_S) $) <mu-max-1>
where the volume $v_o$ is given by~#link(<v-Phi>)[(3)] with $T = T_o$. In terms of
photon flux densities,
#math.equation(block: true, numbering: _ => [(12)], $ mu_(m a x) = k_B T_o ln {frac(Phi_(E_g) (T_S), Phi_(E_g) (T_o))} = q V_(o c)^(m a x) $) <Vmax-SQ>
in other words, the Shockley-Queisser open circuit voltage in energy
units, under maximum concentration of sunlight.

Equation~#link(<Vmax-SQ>)[(12)] was obtained by direct means in #super[#link(<note-7>)[7]] discussing also its
relationship with the Trivich and Flinn#super[#link(<note-8>)[8]] approximation for the voltage, and the
voltage generated by hot carrier solar cells.

= Isothermal losses
<section-isothermal>
We can pursue the mechanical analogy further to model the conversion
process more generally, under one-sun illumination, away from open
circuit. At one sun intensity, the solar cell converts an incident beam
with étendue $cal(E)_(i n) = omega_S thin A$, where $omega_S$ is the
solid angle subtended by the Sun. As the solar cell emits a beam into
the full hemisphere (étendue $cal(E)_(o u t) = pi thin A$), the photon
gas expands from the volume $v_S$ under maximum concentration to a
volume $v_1 = v_S \( pi \/ omega_S \)$.

The chemical potential of the emitted light is again obtained by
integrating~#link(<dmu-equation>)[(7)], this time along the path ABD in the $p - v$
diagram (Fig.~#link(<isothermal-losses>)[2]). The temperature integration produces
again the chemical potential $mu_(m a x)$ but there is now a further
contribution, from the volume integral. This contribution is negative,
and represents a \"lost work\" of magnitude
#math.equation(block: true, numbering: _ => [(13)], $ w_(l o s s)^(\( 1 \)) = integral_(v_S)^(v_1) p d v $) <lost-work-1>
Using~#link(<ideal-gas>)[(10)], the integral~#link(<lost-work-1>)[(13)] is easily evaluated to
give #math.equation(block: true, numbering: _ => [(14)], $ w_(l o s s)^(\( 1 \)) = k_B T_o ln (pi / omega_S) $) <lost-work-12>
We observe that the conversion of one-sun radiation incurs a
loss~#link(<lost-work-12>)[(14)] due to the expansion of the light beam in the
conversion process. Using our mechanical analogy, this is similar to the
lost work in an expansion of gas into vacuum.

#figure(image("source/Fig2.jpg", width: 100.0%),
  caption: [
    Isothermal losses pictures in the $p - v$ plane.
  ]
)
<isothermal-losses>

We can now consider current generation. Generation of current (with
density $J$, say) reduces the emitted photon flux density by an amount
$J \/ q$. The emitted photon flux density at point D,
$\( omega_S \/ pi \) Phi_(E g) \( T_S \)$, will therefore be reduced to
$\( omega_S \/ pi \) Phi_(E g) \( T_S \) - J \/ q$, moving the emission
to point E where the volume per photon is increased by
#math.equation(block: true, numbering: _ => [(15)], $ v_2 / v_1 = frac(\( omega_S \/ pi \) Phi_(E g) \( T_S \), \( omega_S \/ pi \) Phi_(E g) \( T_S \) - J \/ q) $) <lost-work-2>
with respect to point D. The corresponding lost work is given by
#math.equation(block: true, numbering: _ => [(16)], $ w_(l o s s)^(\( 2 \)) = integral_(v_1)^(v_2) p d v = k_B T_o ln (v_2 / v_1) $) <lost-work-21>

We can relate the loss~#link(<lost-work-21>)[(16)] to solar cell parameters since
#math.equation(block: true, numbering: _ => [(17)], $ J_ell & = \( omega_S \/ pi \) Phi_(E g) \( T_S \) - Phi_(E g) \( T_o \)\
J_o & = Phi_(E g) \( T_o \) $) <currents> where $J_ell$ and $J_o$ are the
photogenerated and dark saturation current densities. The lost work (or
loss in chemical potential)~#link(<lost-work-21>)[(16)] then becomes
#math.equation(block: true, numbering: _ => [(18)], $ w_(l o s s)^(\( 2 \)) = k_B T_o ln (frac(J_ell + J_o, J_ell + J_o - J)) $) <lost-work-22>

Collecting together~#link(<Vmax-SQ>)[(12)],~#link(<lost-work-12>)[(14)] and~#link(<lost-work-22>)[(18)] we
obtain
#math.equation(block: true, numbering: _ => [(19)], $ q V_(o c) = & thin q V_(o c)^(m a x) - k_B T_o ln (pi / omega_S)\
q V = & thin q V_(o c) - k_B T_o ln (frac(J_ell + J_o, J_ell + J_o - J)) $) <voltages>
which transforms, using~#link(<currents>)[(17)], into
#math.equation(block: true, numbering: _ => [(20)], $ J = J_ell - J_o (e^(q V \/ k_B T_o) - 1) $) <lost-work-23> in other
words, the usual solar cell equation with parameters~#link(<currents>)[(17)]. In
thermodynamic terms, the isothermal losses~#link(<lost-work-12>)[(14)]
and~#link(<lost-work-22>)[(18)] are due to irreversible entropy generation.#super[#link(<note-2>)[2]]

= Discussion
<discussion>
We have shown that the thermomechanical model of the solar cell is
equivalent to the Shockley-Queisser detailed balance model. This is not
surprising as what we have done is to replace the incident and emitted
light beams, modelled as quasi-blackbody radiation, by heat. As the
chemical potential of this radiation is zero, the equivalence with heat
is evident.

#figure(image("source/turbine.jpg", width: 90.0%),
  caption: [
    Open and closed cycle conversion, illustrated on the example of a
    steam turbine.
  ]
)
<turbine>

Notwithstanding, it is of interest to compare the present model with
heat engines of classical thermodynamics. These engines, in contrast
with the present model, operate in a cyclical manner. Let us consider
such a heat engine on the example of a steam turbine (Fig.~#link(<turbine>)[3]). A
steam turbine converts steam at high temperature and pressure into low
temperature steam at the exit from the turbine. The steam then has to be
returned to the high temperature inlet of the turbine by heating in a
boiler. This closes the cycle and permits a description of the steam
turbine as a standard heat engine.

If high-temperature steam were to be available free of charge, we can
dispense with the boiler and consider only the open cycle consisting of
work produced by cooling the high temperature steam to ambient
temperature. The steam -- or, in our case, photons -- acts as both fuel
and working medium.#super[#link(<note-9>)[9]]

A further difference with classical closed cycle engines appears if we
examine the medium which surround the engine. In a closed cycle
operation, the work carried out by the equilibrium pressure $p_o$ of
this medium does not appear by virtue of the fact that the elements of
work $p_o delta V$ cancel in the compression and expansion parts of the
cycle.

This is not the case for an open-cycle converter where the work carried
out by the external medium, equal to $p_o \( v_o - v_S \)$ in
Fig.~#link(<work>)[1], should be subtracted from the useful work. This is a well
known result of classical thermodynamics which gives the useful work as
availability#super[#link(<note-10>)[10]]\; it is also the reason why the limiting efficiency for the
conversion of full blackbody radiation is the Landsberg efficiency,
rather than the Carnot efficiency#super[#link(<note-11>)[11]]$""^(\,)$#super[#link(<note-12>)[12]] (see also #super[#link(<note-13>)[13]]).

The \"availability correction\" to the Shockley-Queisser voltage can
easily be estimated to be about $k_B T_o \/ q tilde.eq 26$ mV - not
large but noticeable, lowering the Shockley-Queisser efficiency limit by
about 1% absolute.

= Acknowledgement
<acknowledgement>
This work was supported by project \"Energy Conversion and Storage\",
grant no. CZ.02.01.01/00/22\_008/0004617, programme Johannes Amos
Commenius, Excellent Research.


#block(above: .4em, below: .4em)[#text(size: 8.5pt)[#super[1] H.A. Muser, Thermodynamische Behandlung von
Elektronenprozessen in Halbleiter-Randschichten, Zeitschrift fur Physik,
148, 380 (1957).]] <note-1>

#block(above: .4em, below: .4em)[#text(size: 8.5pt)[#super[2] T. Markvart, Thermodynamics of
losses in photovoltaic conversion, Appl. Phys Lett 91, 064102
(2007).]] <note-2>

#block(above: .4em, below: .4em)[#text(size: 8.5pt)[#super[3] T. Markvart, Solar cell as a heat engine:
Energy-entropy analysis of photovoltaic conversion. Phys Status Solidi
(a) 205, 2752 (2008).]] <note-3>

#block(above: .4em, below: .4em)[#text(size: 8.5pt)[#super[4] W. Shockley and H.J Queisser, Detailed balance limit
of efficiency of p-n junction solar cells. J. Appl. Phys. 32, 510
(1961).]] <note-4>

#block(above: .4em, below: .4em)[#text(size: 8.5pt)[#super[5] T. Markvart, The thermodynamics
of optical étendue, J Opt A: Pure Appl. Opt. 10, 015008 (2008).]] <note-5>

#block(above: .4em, below: .4em)[#text(size: 8.5pt)[#super[6] We should emphasize that the $p - v$ diagrams
considered in this paper are not to scale as the actual volume and
pressure change by many orders of magnitude.]] <note-6>

#block(above: .4em, below: .4em)[#text(size: 8.5pt)[#super[7] T.
Markvart, Thermodynamic limit on the open-circuit voltage of solar
cells, Prog. Photovolt. Res. Appl. 33, 664 (2025).]] <note-7>

#block(above: .4em, below: .4em)[#text(size: 8.5pt)[#super[8] D. Trivich and P.
Flinn, Maximum efficiency of solar energy conversion by quantum
processes. In: Daniels F, Duffie J, eds. Solar Energy Research. London,
Thames and Hudson; 1955, 143.]] <note-8>

#block(above: .4em, below: .4em)[#text(size: 8.5pt)[#super[9] Interestingly, such open cycle operation is
characteristic also for other renewable energy applications such as
wind, tidal or geothermal energy.]] <note-9>

#block(above: .4em, below: .4em)[#text(size: 8.5pt)[#super[10] See, for example, A.B. Pippard, The Elements of
Classical Thermodynamics. Cambridge, Cambridge University Press,
\1964.]] <note-10>

#block(above: .4em, below: .4em)[#text(size: 8.5pt)[#super[11] R. Petela, Exergy of heat
radiation. Trans. ASME Heat Transfer, 36,187
(1964)]] <note-11>

#block(above: .4em, below: .4em)[#text(size: 8.5pt)[#super[12] P.T. Landsberg and J.R. Mallinson,
Thermodynamic constraints, effective temperatures and solar cells. In:
Colloque International sur l'Electricitè Solaire, CNES, Toulouse, 1976,
\16.]] <note-12>

#block(above: .4em, below: .4em)[#text(size: 8.5pt)[#super[13] T. Markvart and G. Bauer, What is the useful
energy of a photon? Appl. Phys. Lett. 101, 193901 (2012)]] <note-13>
