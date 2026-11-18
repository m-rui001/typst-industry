// Typst adaptation of Ait Ziane et al., arXiv:2604.11433v1 (CC BY 4.0).
// https://arxiv.org/abs/2604.11433v1 | https://creativecommons.org/licenses/by/4.0/
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
  title: [`European Control Conference (ECC) — July 7-10, 2026, Reykjavík, Iceland`
\
#strong[Air Supply Control for Proton Exchange Membrane Fuel Cells \
without Explicit Modeling]],
  authors: (
    ( name: [Meziane Ait Ziane$""^1$, Michel Zasadzinski$""^2$, Cédric
Join$""^2$ and Michel Fliess$""^3$ #footnote[\*This work was not
supported by any organization]#footnote[$""^1$M. Ait Ziane is with
Université de Lorraine, GREEN, F-54000 Nancy, France.
`meziane.ait-ziane@univ-lorraine.fr`]#footnote[$""^2$M. Zasadzinski and
C. Join are with Research Center for Automatic Control of Nancy (CRAN),
UMR CNRS 7039, Université de Lorraine, F-54000 Nancy, France
`{michel.zasadzinski,cedric.join}@univ-lorraine.fr`] #footnote[$""^3$M.
Fliess is with Laboratoire Jacques-Louis Lions (LJLL), UMR CNRS 7598,
Sorbonne Université, 75005 Paris, France
`michel.fliess@sorbonne-universite.fr, michel.fliess@swissknife.tech `]],
      affiliation: "",
      email: "" ),
    ),
  abstract-title: [Abstract],
  abstract: [Our objective is to study the performance and robustness of
the model-free strategy for controlling the oxygen stoichiometry of a
fuel cell air supply system with a proton exchange membrane. After
reviewing the literature on modeling and control of this process, the
model-free approach appears to be a good candidate because, on the one
hand, it allows straightforward real-time adaptation to track operating
points and, on the other hand, it requires a low computational burden,
which is attractive for industrial applications. Numerical simulations
for two scenarios (constant and variable oxygen stoichiometry) with two
current profiles reveal satisfactory performance of the model-free
control law. The robustness is addressed by considering significant
variations in the parameters of the proton exchange membrane air supply
system.

],
  pagenumbering: "1",
  cols: 1,
  doc,
)


= INTRODUCTION
<sec_intro>
One potential technological solution for decarbonizing the
transportation sector is to replace combustion engines with electrical
motors supplied by fuel cells. Among the various existing technologies,
the #emph[Proton Exchange Membrane Fuel Cell] (#emph[PEMFC]) is
particularly well suited to automotive applications, as it operates at
low temperatures (60 to 80°C) and is resilient to load variations
@YLPRJH:21@AYMZD:22.

A PEMFC is viewed as a complex system due to the interactions of several
physical phenomena (electrical, thermal, chemical, …). It is mandatory
to feed the PEMFC with a sufficient amount of hydrogen and oxygen to
ensure the desired electrical power and to avoid performance
degradation. Thus, air supply control is one of the key points in the
proper operation of a PEMFC. Since air is supplied by a compressor, both
the fuel cell and the compressor (referred to as the PEMFC air-feed
system in the literature) must be taken into account @CGFTKLCW:24.

The behavior of the PEMFC system is highly nonlinear. A PEMFC model
including the compressor and oriented control has been initially
proposed in @PSP:04. From this model, an air-feed one with 5 states is
presented in @LGSWW:19, with 4 states in @Suh:05b, and with 3 states in
@ZZLP:22. These models have been used widely in the literature for
control purposes. The design of all control laws cited in this paragraph
is explicitly based on the aforementioned PEMFC air-feed models.

A sliding mode control approach is designed in @MLJW:13 with state
feedback and in @ZZLP:22@LHAC:15 by using an observer. A controller
based on state feedback linearization is proposed in @CLWOS:18 and in
@LYDZGC:22 by adding an extended state observer. A LQR tracking
controller based on an observer is synthesized in @LLHG:18. A control
law strategy constituted by three parts, called a triple-step
controller, is developed in @MZGCS:20 and @ZGKLH:24: $1^(upright("st"))$
part is a PID controller, $2^(upright("nd"))$ part is a steady-state
feedforward controller, and $3^(upright("rd"))$ is a steady-state
feedback. It is challenging to obtain a model that accurately describes
the actual behavior of the PEMFC air-feed system, as the PEMFC stack is
difficult to model and to obtain the exact values of the physical
parameters. The control laws mentioned in this paragraph are promising
strategies, but they have a limitation on their efficiency due to the
quality of the model used.

PID are widely proposed in the literature to control PEMFC air-feed
system. PID controllers without gain adaptation are proposed:
feedforward PID in @BCLTYS:25, robust PID in @WaK:10 and PID based on
$1^(upright("st"))$ order approximation in @DSD:19. The gains of PID
controllers are adapted by using a fuzzy logic approach in @Ali:18 and
@OWLSX:15, while this adaptation is made using neural techniques in
@LiY:21b, @YGOK:24, and @DBLDG:14. Both fuzzy logic and neuronal
approaches are used to adapt PID gains in @GBK:19, @ZLLXX:21 and
@YCH:23. Considering the high nonlinearity of the model, PID parameter
tuning seems required to control the PEMFC air-feed system over a wide
operating range.

An artificial intelligence approach is also applied to design a
controller for PEMFC air-feed systems without including PID in @WaW:23.
An adaptive B-spline neural network is applied in @SBAR:14, an adaptive
observer is added to the neural network in @WWZX:21, and distributed
deep reinforcement learning is employed in @LiY:21. For real-time
implementation considerations, the use of fuzzy logic and/or neural
network techniques to perform either gains adaptation of PID controllers
or the design of artificial intelligence controllers is computationally
expensive.

The #emph[Model-Free Control] (#emph[MFC]) developed in @FlJ:13@FlJ:22
can be considered an interesting alternative to the approaches mentioned
above: the mathematical model is not necessary to design the control
law, which is adapted using an ultra-local model in a straightforward
manner. Furthermore, its implementation is simpler than those mentioned
above and requires very few parameters. The aim of this paper is to
investigate the performance and robustness of the MFC strategy on a
PEMFC air-feed system model under several scenarios.

The outline of this paper is as follows. MFC design is briefly recalled
in Sect. @sec_MFC. The PEMFC air-feed system model used to test the
designed controller in this paper and the control objective are given in
Section @sec_PEMFC. The simulation results are presented in Sect.
@sec_Sim: the two scenarios considered in this paper are described in
Sect. @ssec_scenarii\; the simulations for both constant and variable
desired oxygen stoichiometry, along with robustness analysis, are
conducted in Sect. @ssec_sim_constant and @ssec_sim_variable,
respectively. A conclusion with discussion is given in Sect.~@sec_Conc.

= SHORT RECALL ON MODEL-FREE CONTROL
<sec_MFC>
We only deal here with SISO systems. Elementary functional analysis and
differential algebra show @FlJ:13, as well as concrete experiments, that
most, or at least many, systems encountered in practice can be
approximated by the #emph[ultra-local] model

$ dot(y) = cal(F) + alpha u $ <ul>

 where the control and output variables are
respectively $u$ and $y$, $cal(F)$ is a quantity that subsumes the
poorly known system structure and the disturbances. The constant
$alpha in bb(R)$ is chosen by the practitioner such that the three terms
in #ref(<ul>) are of the same magnitude: $alpha$ does not need
to be precisely estimated. The following data-driven real-time estimate
$cal(F)_(upright("est")) \( t \)$ of $cal(F) \( t \)$ is given by
$ cal(F)_(upright("est")) \( t \) = - 6 / tau^3 integral_(t - tau)^t [\( tau - 2 sigma \) y \( sigma \) + alpha sigma \( tau - sigma \) u \( sigma \)] d sigma $<integral>

Close the loop with the following #emph[intelligent proportional
controller], or #emph[iP],
$ u = - frac(cal(F)_(upright("est")) - dot(y)^(*) + K_p e, alpha) $<ip>
where $y^(*)$ is the reference trajectory, $e = y - y^(*)$ is the
tracking error, $K_p$ is a tuning gain. Equations #ref(<ul>)
and #ref(<ip>) yield
$ dot(e) + K_p e = cal(F) - cal(F)_(upright("est")) . $

If the estimate $cal(F)_(upright("est"))$ is "good", #emph[i.e.],
$cal(F) - cal(F)_(upright("est")) approx 0$, then
$lim_(t arrow.r + oo) e \( t \) approx 0$ if and only if, $K_p > 0$.
This local stability property proves that the tuning of $K_p$ is
straightforward. This is a major difference with the classic gain tuning
for PIs and PIDs (see, #emph[e.g.], @FlJ:22).

=  PEMFC AIR FEED SYSTEM MODELING AND CONTROL OBJECTIVE
<sec_PEMFC>
== PEMFC air-feed system model
<ssec_PEMFC_mod>
A PEMFC model oriented control has been initially proposed in @PSP:04.
From this model, Suh @Suh:05b has proposed an air-feed model, with 4
states, has been used widely in the literature: in @MLJW:13 and @LHAC:15
for sliding mode control, in @NZO:25 for fault detection with observer
and in @WWZX:21 for both control and state estimation using neural
networks.

This model has been validated on test bench in @SuS:07 and @LLAHW:15 and
is described by $ dot(x)_1 & = c_1 \( x_4 - x_1 - x_2 - c_2 \) - c_7 xi\
 & #h(2em) - frac(c_3 x_1, c_4 x_1 + c_5 x_2 + c_6) c_17 sqrt(x_1 + x_2 + c_2 - c_11) \,\
dot(x)_2 & = c_8 \( x_4 - x_1 - x_2 - c_2 \)\
 & #h(2em) - frac(c_3 x_2, c_4 x_1 + c_5 x_2 + c_6) c_17 sqrt(x_1 + x_2 + c_2 - c_11) \,\
dot(x)_3 & = - c_9 x_3 - c_10 [(x_4 / c_11)^(c_12) - 1] + c_13 u \,\
dot(x)_4 & = c_14 [1 + c_15 [(x_4 / c_11)^(c_12) - 1]]\
 & #h(2em) #h(2em) quad times \[ c_21 x_3 - c_16 \( x_4 - x_1 - x_2 - c_2 \) \] \, $<eq_model>
where

- $x_1 = P_(O_2)$ is the oxygen partial pressure, $x_2 = P_(N_2)$ is the
  nitrogen partial pressure, $x_3 = omega_(c p)$ is the compressor
  angular speed and $x_4 = P_(s m)$ is the supplied manifold pressure,

- $xi$ is the fuel stack current which is considered as measured
  disturbance in the sequel,

- $u$ is the motor current and is the control input,

- $c_i$ with $i = 1 \, dots.h \, 21$ are PEMFC and air-feed compressor
  parameters given in Tab. @tab_c, where physical parameters values are
  given in Table 2 in @MLJW:13.

#block[
#figure(
  align(center)[#table(
    columns: 2,
    align: (center,center,),
    table.header([$c_1 = frac(R T_(f c) k_(c a \, i n) x_(O_2), V_(c a) M_(O_2) \( 1 + omega_(a t m) \))$], [$c_2 = p_(s a t)$],),
    table.hline(),
    [$c_3 = frac(R T_(f c), V_(c a))$], [$c_4 = M_(O_2)$],
    [$c_5 = M_(N_2)$], [$c_6 = M_v p_(s a t)$],
    [$c_7 = frac(R T_(f c) k_(c a \, i n), V_(c a) 4 F)$], [$c_8 = frac(R T_(f c) k_(c a \, i n) \( 1 - x_(O_2) \), V_(c a) M_(N_2) \( 1 + omega_(a t m) \))$],
    [$c_9 = f / J_(c p)$], [$c_10 = frac(eta_(v - c) V_(c p r \/ t r) rho_a C_p T_(a t m), 2 pi J_(c p) eta_(c p))$],
    [$c_11 = p_(a t m)$], [$c_12 = frac(gamma - 1, gamma)$],
    [$c_13 = frac(eta_(c m) k_t, J_(c p))$], [$c_14 = frac(R T_(a t m), M_a V_(s m))$],
    [$c_15 = 1 / eta_(c p)$], [$c_16 = k_(c a \, i n)$],
    [$c_17 = k_(c a \, o u t)$], [$c_18 = eta_(c m) k_t$],
    [$c_19 = frac(k_(c a \, i n) x_(O_2), \( 1 + omega_(a t m) \))$], [$c_20 = frac(n M_(O_2), 4 F)$],
    [$c_21 = frac(eta_(v - c) V_(c p r \/ t r) rho_a, 2 pi)$], [$times$],
  )]
  , caption: [Constants $c_1$ to $c_21$]
  , kind: table
  ) <tab_c>
]
#block[
#strong[Remark 1]. #emph[In this paper, the model described by
#link(<eq_model>)[\[eq\_model\]] is not used to design the control law,
but to emulate the behavior of the PEMFC air-feed system.
$square.stroked.tiny$]

]
== Control objective
<ssec_PEMFC_Control>
Using measurements $y_1$ and $y_2$ given by
$ y_1 & = x_1 + x_2 + c_2 + w_1 \,\
y_2 & = x_4 + w_2 \, $ where $w_1$ and $w_2$ are independent zero mean
Gaussian white noises.

The objective is to regulate the excess ratio between the oxygen flow
rate entering the PEMFC and the oxygen flow rate consumed by the fuel
cell due/from to the electrochemical reaction at a desired value. This
excess ratio between flow rates is known as “oxygen stoichiometry
($lambda_(O_2)$)” and is defined by:
$ lambda_(O_2) = frac(c_19 \( y_2 - y_1 \), c_20 xi) $<eq_lambda> where
$c_19$ and $c_20$ are known constants.

The desired oxygen stoichiometry ($lambda_(O_2)^star.op$), i.e. the
setpoint, can be set as follows $2 lt.eq lambda_(O_2)^star.op lt.eq 2.5$
to ensure sufficient oxygen flow for the electrochemical reaction. It is
important to note that a value $lambda_(O_2) lt.eq 1$ can lead to a
starvation fault which can generate some irreversible damages to the
PEMFC stack. Furthermore, a value of $lambda_(O_2) > 2.5$ may lead to an
evacuation of water generated by the PEMFC, which causes the membrane
drying and increases the compressor's energy consumption. In the
literature, there exist two main ways to define the desired oxygen
stoichiometry $lambda_(O_2)^star.op$

+ $lambda_(O_2)^star.op$ is chosen as a constant
  $2 lt.eq lambda_(O_2)^star.op lt.eq 2.5$ despite variations of $xi$
  (see @WWZX:21 and @APJBCYD:22 ),

+ $lambda_(O_2)^star.op$ is defined as a polynomial function of the
  stack current and given by (see @MLJW:13 and @MZGCS:20)
  $ lambda_(O_2)^star.op = 5 times 10^(- 8) xi^3 - 2.87 times 10^(- 5) xi^2\
  + 2.23 times 10^(- 3) xi + 2.5 . $<eq_stoech_desir>

= SIMULATIONS RESULTS
<sec_Sim>
== Scenarios
<ssec_scenarii>
Two scenarios are considered for the simulations:

+ the $1^(upright("st"))$ is devoted to regulating the oxygen
  stoichiometry $lambda_(O_2)$ at a fixed value
  $lambda_(O_2)^star.op = 2.2$,

+ the $2^(upright("nd"))$ scenario is dedicated to regulating the oxygen
  stoichiometry $lambda_(O_2)$ at a variable value of
  $lambda_(O_2)^star.op$ which is given by
  #link(<eq_stoech_desir>)[\[eq\_stoech\_desir\]].

For these two scenarios, two different current profiles of $xi$ are
considered. In the $1^(upright("st"))$ current profile, the variations
of $xi$ can be regarded as small (see Fig. @fig_current_not_hard), while
the $2^(upright("nd"))$ current profile, which has significant
variations of $xi$, is taken into account (see Fig. @fig_current_hard).

#figure(image("Figures/current_not_hard.svg"),
  caption: [
    $1^(upright("st"))$ current profile
  ]
)
<fig_current_not_hard>

#figure(image("Figures/current_hard.svg"),
  caption: [
    $2^(upright("nd"))$ current profile
  ]
)
<fig_current_hard>

In order to analyze the robustness of the #emph[iP] controller, two
cases are considered:

- the physical parameters of PEMFC system in
  #link(<eq_model>)[\[eq\_model\]] given in table 2 in @MLJW:13 are
  considered for nominal case,

- some physical parameters of PEMFC system in
  #link(<eq_model>)[\[eq\_model\]] given in table 2 in @MLJW:13 are
  modified and given in Table @tab_uncer for uncertain case.

#block[
#figure(
  align(center)[#table(
    columns: 3,
    align: (center,center,center,),
    table.header([Symbol], [Parameter], [Value],),
    table.hline(),
    [$f$], [Motor friction], [$+ 20$%],
    [$k_t$], [Motor constant], [$-$5%],
    [$eta_(c p)$], [Compressor efficiency], [$-$10%],
    [$eta_(c m)$], [Motor mechanical efficiency], [$-$20%],
    [$k_(c a \, o u t)$], [Cathode outlet constant], [$+$10%],
    [$T_(a t m)$], [Atmospheric temperature], [$+$10%],
    [$V_(c a)$], [Cathode volume], [$+$10%],
    [$V_(s m)$], [Supply manifold volume], [$-$10%],
    [$T_(f c)$], [Stack temperature, °C], [$+$12%],
  )]
  , caption: [Parameters uncertainties]
  , kind: table
  ) <tab_uncer>
]
The following notations are retained: superscript $n$ for the nominal
case and superscript $u$ for the uncertain one.

== Constant desired oxygen stoichiometry
<ssec_sim_constant>
=== $1^(upright("st"))$ current profile
<sssec_sim_constant_first>
Fig. @fig_not_hard_fixe shows the control of oxygen stoichiometry when
$1^(upright("st"))$ profile shown in Fig. @fig_current_not_hard is
applied. $lambda_(O_2)$ is restored to $lambda_(O_2)^star.op$ in 5 s for
all six current changes for the nominal case, see Fig.
@fig_not_hard_fixe_lambda. For the uncertain case, the #emph[iP]
controller performs very well with regard to these uncertainties in the
PEMFC system parameters, ensuring a restoration time of $lambda_(O_2)$
to $lambda_(O_2)^star.op$ in 6.5 s.

The differences between the control inputs $u^n$ and $u^u$ shown in Fig.
@fig_not_hard_fixe_u are due to all the uncertainties in the PEMFC
parameters and confirms that the controller is capable of tolerating
these uncertainties. However, the differences between $y_1^n$, $y_1^u$
and $y_2^n$, $y_2^u$, see Fig. @fig_not_hard_fixe_y, are only due to
uncertainties associated with the stack parameters ($k_(c a \, i n)$,
$k_(c a \, o u t)$, $T_(a t m)$, $V_(c a)$, $V_(s m)$ and $T_(f c)$),
but not to uncertainties related to the compressor parameters ($f$,
$k_t$, $eta_(c p)$ and $eta_(c m)$).

=== $2^(upright("nd"))$ current profile
<sssec_sim_constant_second>
Fig. @fig_hard_fixe shows the oxygen stoichiometry control when the
$2^(upright("nd"))$ profile is applied. This profile presents higher
current variations than the $1^(upright("st"))$ one. For the nominal
case, the #emph[iP] controller resets $lambda_(O_2)$ to
$lambda_(O_2)^star.op$ between 2 s and 10 s depending on the magnitude
of the variation in current $xi$. With regard to the uncertain case, it
should be noted that there is no significant difference; the restoration
time is 1.5 s longer than in the nominal case as shown in Fig.
@fig_hard_fixe_lamda. The same comments can be made for Fig.
@fig_hard_fixe_u and Fig. @fig_hard_fixe_y as for Fig.
@fig_not_hard_fixe_u and Fig. @fig_not_hard_fixe_y.

The simulation results show that the #emph[iP] controller is robust with
respect to parameter uncertainties and ensures satisfactory closed-loop
behaviors for the two scenarii with constant desired oxygen
stoichiometry.

== Variable desired oxygen stoichiometry
<ssec_sim_variable>
In this Section, the desired oxygen stoichiometry $lambda_(O_2)^star.op$
is variable, so the control objective is to regulate $lambda_(O_2)$ to
$lambda_(O_2)^star.op$ even with PEMFC parameter uncertainties under the
two above-mentioned current profiles.

=== $1^(upright("st"))$ current profile
<sssec_sim_variable_first>
For the $1^(upright("st"))$ profile
$2 lt.eq lambda_(O_2)^star.op lt.eq 2.2$. The #emph[iP] controller
ensures both disturbance rejection and $lambda_(O_2)^star.op$ tracking
in 5 s for the nominal case and in 6 s for the uncertain case, as shown
in Figure @fig_not_hard_var_lambda. The robustness of #emph[iP]
controller is achieved since the responses are close in nominal and
uncertain cases in Figure @fig_not_hard_var_lambda. The control input
and the measurements for both nominal and uncertain cases are shows in
Fig. @fig_not_hard_var_u and Fig. @fig_not_hard_var_y, respectively. For
both constant and variable desired oxygen stoichiometry, the transient
behavior is closed in the two cases (see the settling times and the
peaks in Fig. @fig_not_hard_fixe_lambda and Fig.
@fig_not_hard_var_lambda). However, the difference between the control
inputs and the measurements in both cases is mainly explained by the
difference in the setpoints (see Fig. @fig_not_hard_fixe_u, Fig.
@fig_not_hard_fixe_y, Fig. @fig_not_hard_var_u, and Fig.
@fig_not_hard_var_y).

=== $2^(upright("nd"))$ current profile
<sssec_sim_variable_second>
For the $2^(upright("nd"))$ profile
$1.9 lt.eq lambda_(O_2)^star.op lt.eq 2.5$. Fig. @fig_hard_var shows the
oxygen stoichiometry control when the $2^(upright("nd"))$ profile is
applied. Like in the $1^(upright("st"))$ scenario, the #emph[iP]
controller resets $lambda_(O_2)$ to $lambda_(O_2)^star.op$ between 2 s
and 10 s depending on the magnitude of the variation in current $xi$ for
the nominal case, and there is no significant difference for the
uncertain case (the tracking time is 1.5 s longer than in the nominal
case as shown in Fig. @fig_hard_var_lambda). The same comments can be
made for Fig. @fig_hard_var_u and Fig. @fig_hard_var_y as for Fig.
@fig_not_hard_var_u and Fig. @fig_not_hard_var_y.

The above simulations illustrate the fact that the #emph[iP] controller
ensures good reference tracking and robustness against parameter
uncertainties for both scenarios with a variable desired oxygen
stoichiometry.

= CONCLUSIONS
<sec_Conc>
The results obtained with the #emph[iP] controller are satisfactory in
simulation with a model widely used in the literature and allow us to
proceed to the next step: implementing the #emph[iP] controller in a
real test bench. This real-time implementation allows us to compare the
proposed approach with those mentioned in the Introduction. This
comparison will be carried out in terms of both the performance and
robustness of the control laws and the computational burden in order to
propose effective control strategies for this complex system.

Another perspective of this work is to address PEM fuel cell energy
management @BTDYMB:25 and fault-tolerant control and diagnosis using
model-free approaches @AZJP:25@AJZ:25, particularly to deal with sensor
faults that affect $lambda_(O_2)$ in #link(<eq_lambda>)[\[eq\_lambda\]].

#figure([#figure(image("Figures/lambda_not_hard_fixe.svg"),
    caption: [
      Constant $lambda_(O_2)$ for $1^(upright("st"))$ current profile
    ]
  )
  <fig_not_hard_fixe_lambda>

  #figure(image("Figures/u_not_hard_fixe.svg"),
    caption: [
      $u$ for $1^(upright("st"))$ current profile
    ]
  )
  <fig_not_hard_fixe_u>

  #figure(image("Figures/P_not_hard_fixe.svg"),
    caption: [
      $y_1$ and $y_2$ for $1^(upright("st"))$ current profile
    ]
  )
  <fig_not_hard_fixe_y>

  ],
  caption: [
    Constant desired oxygen stoichiometry $lambda_(O_2)^star.op$ with
    and without uncertainties: $1^(upright("st"))$ current profile
  ]
)
<fig_not_hard_fixe>

#figure([#figure(image("Figures/Lambda_hard_fixe.svg"),
    caption: [
      Constant $lambda_(O_2)$ for $2^(upright("nd"))$ current profile
    ]
  )
  <fig_hard_fixe_lamda>

  #figure(image("Figures/u_hard_fixe.svg"),
    caption: [
      $u$ for $2^(upright("nd"))$ current profile
    ]
  )
  <fig_hard_fixe_u>

  #figure(image("Figures/P_hard_fixe.svg"),
    caption: [
      $y_1$ and $y_2$ for $2^(upright("nd"))$ current profile
    ]
  )
  <fig_hard_fixe_y>

  ],
  caption: [
    Constant desired oxygen stoichiometry $lambda_(O_2)^star.op$ with
    and without uncertainties: $2^(upright("nd"))$ current profile
  ]
)
<fig_hard_fixe>

#figure([#figure(image("Figures/lambda_not_hard_var.svg"),
    caption: [
      Variable $lambda_(O_2)$ for $1^(upright("st"))$ current profile
    ]
  )
  <fig_not_hard_var_lambda>

  #figure(image("Figures/u_not_hard_var.svg"),
    caption: [
      $u$ for $1^(upright("st"))$ current profile
    ]
  )
  <fig_not_hard_var_u>

  #figure(image("Figures/P_not_hard_var.svg"),
    caption: [
      $y_1$ and $y_2$ for $1^(upright("st"))$ current profile
    ]
  )
  <fig_not_hard_var_y>

  ],
  caption: [
    Variable desired oxygen stoichiometry $lambda_(O_2)^star.op$ with
    and without uncertainties: $1^(upright("st"))$ current profile
  ]
)
<fig_not_hard_var>

#figure([#figure(image("Figures/lambda_hard_var.svg"),
    caption: [
      Variable $lambda_(O_2)$ for $2^(upright("nd"))$ current profile
    ]
  )
  <fig_hard_var_lambda>

  #figure(image("Figures/u_hard_var.svg"),
    caption: [
      $u$ for $2^(upright("nd"))$ current profile
    ]
  )
  <fig_hard_var_u>

  #figure(image("Figures/P_hard_var.svg"),
    caption: [
      $y_1$ and $y_2$ for $2^(upright("nd"))$ current profile
    ]
  )
  <fig_hard_var_y>

  ],
  caption: [
    Variable desired oxygen stoichiometry $lambda_(O_2)^star.op$ with
    and without uncertainties: $2^(upright("nd"))$ current profile
  ]
)
<fig_hard_var>

#bibliography("MZ-1.bib", style: "ieee")
