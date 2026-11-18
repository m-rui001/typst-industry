// Adapted from Das et al., arXiv:2603.08689v1 (CC BY 4.0).
#set math.equation(numbering: "(S1)")
#set figure(numbering: "S1")
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
  title: [#strong[Supplementary Information for] \
Nonlinear Mode Coupling in Silicon Nitride Membrane Resonators],
  authors: (
    ( name: [Soumya Kanti Das,$""^(1 \, *)$ Nishta Arora,$""^(2 \, *)$
Hridhay A S,$""^1$ Akshay Naik,$""^2$ Chandan Samanta$""^1$ \
$""^1$Department of Physics, \
Indian Institute of Science Education and Research Bhopal,
Bhopal-462066, Madhya Pradesh, India \
$""^2$Centre for Nano Science and Engineering, \
Indian Institute of Science, Bengaluru-560012, Karnataka, India],
      affiliation: "",
      email: "" ),
    ),
  abstract-title: [Abstract],
  pagenumbering: "1",
  cols: 1,
  doc,
)


= Theoretical description
<theoretical-description>
We model nonlinear mode coupling behavior of a square silicon nitride
($S i_3 N_4$) membrane resonator using Kirchhoff--Love plate theory. We
first analyze the intramode coupling (intrinsic Duffing nonlinearity) of
the resonator and then introduce intermodal mode-coupling terms to
develop a general coupling framework. The Duffing constants and a
general expression for the coupling constant between probing mode
$\( n \, m \)$ and driving mode $\( p \, q \)$ are derived. The
theoretical results show good agreement with experimental observations.

== Duffing nonlinearity
<duffing-nonlinearity>
With the use of Kirchhoff-Love plate theory@leissa1969vibration, the
general equation characterizing the transverse displacement
$w \( x \, y \, t \)$ of a thin plate can be written as
$ D nabla^4 w \( x \, y \, t \) & - (N_(x x) frac(partial^2 w, partial x^2) + 2 N_(x y) frac(partial^2 w, partial x partial y) + N_(y y) frac(partial^2 w, partial y^2)) + rho h frac(partial^2 w, partial t^2) = 0 $<S1>
where
$w \( x \, y \, t \) = phi.alt \( x \, y \) thin z \( t \) = thin s i n \( frac(n pi x, L) \) thin s i n \( frac(m pi y, L) \) thin z \( t \)$,
D is the flextural rigidity, $N_(x x)$, $N_(y y)$, and $N_(x y)$ are the
in-plane stress resultants, which can be defined as

$ N_(x x) & = integral_(- h \/ 2)^(h \/ 2) sigma_(x x) thin d z \,\
N_(y y) & = integral_(- h \/ 2)^(h \/ 2) sigma_(y y) thin d z \,\
N_(x y) & = integral_(- h \/ 2)^(h \/ 2) sigma_(x y) thin d z \, $<S2>
here, $sigma_(x x)$, $sigma_(y y)$ and $sigma_(x y)$ is defined as
$ sigma_(x x) & = frac(E, 1 - nu^2) \( epsilon.alt_(x x) + nu epsilon.alt_(y y) \) \,\
sigma_(y y) & = frac(E, 1 - nu^2) \( epsilon.alt_(y y) + nu epsilon.alt_(x x) \) \,\
sigma_(x y) & = frac(E, 1 + nu) epsilon.alt_(x y) . $<S5> Due to the
thinness of our membrane, we assume that the Poisson's ratio ($nu$) is
zero. In the presence of nonlinear displacement, particularly due to
geometrical nonlinearity, the strain components are defined as
@ventsel2002thin
$ epsilon.alt_(x x) & = epsilon.alt_0 + frac(partial u_0, partial x) + 1 / 2 (frac(partial w, partial x))^2 - z \( t \) frac(partial^2 w, partial x^2) \,\
epsilon.alt_(y y) & = epsilon.alt_0 + frac(partial v_0, partial y) + 1 / 2 (frac(partial w, partial y))^2 - z \( t \) frac(partial^2 w, partial y^2) \,\
epsilon.alt_(x y) & = 1 / 2 (frac(partial u_0, partial y) + frac(partial v_0, partial x)) + 1 / 2 frac(partial w, partial x) frac(partial w, partial y) - z \( t \) frac(partial^2 w, partial x partial y) . $<S8>
For a thin membrane, we assume that in-plane mid-surface displacements
are minimal, namely $u_0 \, v_0 = 0$, and that in-plane displacements
resulting from transverse deformation are insignificant. With these
assumptions, the stress resultants are simplified to
$ N_(x x) & = E h (epsilon.alt_0 + 1 / 2 (frac(partial w, partial x))^2) \,\
N_(y y) & = E h (epsilon.alt_0 + 1 / 2 (frac(partial w, partial y))^2) \,\
N_(x y) & = 1 / 2 E h (frac(partial w, partial x) frac(partial w, partial y)) . $<S11>
Substituting into the governing equation #ref(<S1>) and
employing the Galerkin method with
$w \( x \, y \, t \) = thin s i n \( frac(n pi x, L) \) thin s i n \( frac(m pi y, L) \) thin z \( t \)$,
also neglecting $D$ for the high-stress scenario
@cattiaux2020geometrical, we obtain
$  & - integral_0^L integral_0^L (N_(x x) frac(partial^2 w, partial x^2) + 2 N_(x y) frac(partial^2 w, partial x partial y) + N_(y y) frac(partial^2 w, partial y^2)) phi.alt \( x \, y \) thin d x thin d y\
 & quad + rho h integral_0^L integral_0^L frac(partial^2 w, partial t^2) phi.alt \( x \, y \) thin d x thin d y = 0 $<S14>
The expressions for $N_(x x)$, $N_(y y)$, and $N_(x y)$ becomes
$ N_(x x) & = E h \[epsilon.alt_0 + 1 / 2 z^2 \( t \) (frac(n pi, L))^2 sin^2 (frac(m pi y, L))\
 & quad times cos^2 (frac(n pi x, L))\] \,\
N_(y y) & = E h \[epsilon.alt_0 + 1 / 2 z^2 \( t \) (frac(m pi, L))^2 sin^2 (frac(n pi x, L))\
 & quad times cos^2 (frac(m pi y, L))\] \,\
N_(x y) & = 1 / 2 E h z^2 \( t \) (frac(n pi, L)) (frac(m pi, L))\
 & quad times sin (frac(n pi x, L)) cos (frac(n pi x, L)) sin (frac(m pi y, L)) cos (frac(m pi y, L)) . $<S15>
Upon substituting into equation #ref(<S14>), we can find the
integrals
$ K_1 = integral_0^L integral_0^L N_(x x) thin frac(partial^2 w, partial x^2) thin thin phi.alt \( x \, y \) thin d x d y $<S18>
$ K_2 = integral_0^L integral_0^L N_(y y) thin frac(partial^2 w, partial y^2) thin thin phi.alt \( x \, y \) thin d x d y $<S19>
$ K_3 = integral_0^L integral_0^L 2 N_(x y) thin frac(partial^2 w, partial x partial y) thin thin phi.alt \( x \, y \) thin d x d y $<S20>
By solving the integral and substituting these values into Eq.
#ref(<S14>), we have derived the equation
$ rho h L^2 / 4 frac(d^2 z, d t^2) & + E h epsilon.alt_0 L^2 / 4 (pi / L)^2 \( n^2 + m^2 \) z \( t \) + 3 / 2 E h L^2 / 64 (pi / L)^4 [n^4 + m^4 - 2 / 3 n^2 m^2] z^3 \( t \) = 0 $<S21>
From there we can find,
$ omega_(n m)^2 = frac(E epsilon.alt_0 pi^2 \( n^2 + m^2 \), rho L^2) $<S22>
And,
$ alpha_(n m) = frac(3 E, 32 rho) (pi / L)^4 [n^4 + m^4 - 2 / 3 n^2 m^2] $<S23>
To determine the resonant frequency and the Duffing nonlinearity, we
employed Eq.#ref(<S21>)\; however, a damping component and a
driving force term will typically be present as well. To analyze the
nonlinear response, it is essential to include the driving force term,
as outlined in the paper. The equation of motion, incorporating both the
driving force and damping terms, can be expressed as
$ frac(d^2 z, d t^2) + nu frac(d z, d t) + omega_(n m)^2 z + alpha_(n m) z^3 = f_d cos \( omega t \) $<S24>
here, $nu$ represents the damping factor, while $f_d cos \( omega t \)$
denotes the driving force. The driving force is either high or low, as
indicated by the driving force amplitude $f_d$.

== Nonlinear mode coupling
<nonlinear-mode-coupling>
We have not previously looked at the mode coupling term. The in-plane
tension can be adjusted for mode coupling. Considering non-linear mode
coupling, the values of
$epsilon.alt_(x x) \, thin epsilon.alt_(y y) \, thin epsilon.alt_(x y)$
will be
$ epsilon.alt_(x x) = frac(partial u_0, partial x) thin + thin 1 / 2 [(frac(partial w_1, partial x))^2 thin + thin (frac(partial w_2, partial x))^2] - z_1 \( t \) frac(partial^2 w_1, partial x^2) $<S25>
$ epsilon.alt_(y y) = frac(partial v_0, partial y) thin + thin 1 / 2 [(frac(partial w_1, partial y))^2 thin + thin (frac(partial w_2, partial y))^2] - z_1 \( t \) frac(partial^2 w_1, partial y^2) $<S26>
$ epsilon.alt_(x y) = 1 / 2 (frac(partial u_0, partial y) thin + thin frac(partial v_0, partial x)) thin + thin 1 / 2 [(frac(partial w_1, partial x) thin frac(partial w_1, partial y)) + (frac(partial w_2, partial x) thin frac(partial w_2, partial y))] - z_1 \( t \) frac(partial^2 omega_1, partial x partial y) $<S27>
Here,
$w_1 = phi.alt_1 \( x \, y \) z_1 \( t \) = sin (frac(n pi x, L)) sin (frac(m pi y, L)) z_1 \( t \)$,
where $\( n \, m \)$ denotes the mode number of the probe mode, and
$w_2 = phi.alt_2 \( x \, y \) z_2 \( t \) = sin (frac(p pi x, L)) sin (frac(q pi y, L)) z_2 \( t \)$,
where $\( p \, q \)$ signifies the mode number corresponding to the pump
mode. Once more, we can apply the aforementioned thin membrane
approximation. The in-plane stress resultants can now be expressed as
$ N_(x x) = E h [epsilon.alt_0 thin + 1 / 2 {(frac(partial w_1, partial x))^2 thin + thin (frac(partial w_2, partial x))^2}] $<S28>
$ N_(y y) = E h [epsilon.alt_0 thin + 1 / 2 {(frac(partial w_1, partial y))^2 thin + thin (frac(partial w_2, partial y))^2}] $<S29>
$ N_(x y) = 1 / 2 E h [(frac(partial w_1, partial x) frac(partial w_1, partial y)) thin + thin (frac(partial w_2, partial x) frac(partial w_2, partial y))] $<S30>
The contributions to the mode coupling factor from the terms
$N_(x x) \, thin N_(y y) \, thin N_(x y)$ are as follows
$ N_(x x \, lambda) = frac(E h, 2) (frac(partial w_2, partial x))^2 $<S31>
$ N_(y y \, lambda) = frac(E h, 2) (frac(partial w_2, partial y))^2 $<S32>
$ N_(x y \, lambda) = frac(E h, 2) (frac(partial w_2, partial x) frac(partial w_2, partial y)) $<S33>
Substituting the values of $w_2$ yields
$ N_(x x \, lambda) = frac(E h, 2) [thin (frac(p pi, L))^2 thin c o s^2 (frac(p pi x, L)) thin s i n^2 (frac(q pi y, L))] $<S34>
$ N_(y y \, lambda) = frac(E h, 2) [thin (frac(q pi, L))^2 thin s i n^2 (frac(p pi x, L)) thin c o s^2 (frac(q pi y, L))] $<S35>
$ N_(x y \, lambda) = 1 / 2 E h [(frac(p pi, L) thin) thin c o s (frac(p pi x, L)) thin s i n (frac(q pi y, L)) (frac(q pi, L) thin) thin s i n (frac(p pi x, L)) thin c o s (frac(q pi y, L))] $<S36>
To calculate the coupling constant, it is necessary to solve the
integrals
$ integral_0^L integral_0^L N_(x x . lambda) frac(partial^2 w_1, partial x^2) thin thin phi.alt_1 \( x \, y \) thin d x d y $<S37>
$ integral_0^L integral_0^L N_(y y . lambda) frac(partial^2 w_1, partial y^2) thin thin phi.alt_1 \( x \, y \) thin d x d y $<S38>
$ integral_0^L integral_0^L 2 N_(x y . lambda) frac(partial^2 w_1, partial x partial y) thin thin phi.alt_1 \( x \, y \) thin d x d y $<S39>
The expression for coupling constant is
$ lambda_(n m)^(p q) = frac(- integral_0^L integral_0^L (N_(x x \, lambda) frac(partial^2 w_1, partial x^2) thin thin phi.alt_1 \( x \, y \) thin + thin N_(y y \, lambda) frac(partial^2 w_1, partial y^2) thin thin phi.alt_1 \( x \, y \) thin + thin 2 N_(x y \, lambda) frac(partial^2 w_1, partial x partial y) thin thin phi.alt_1 \( x \, y \)) thin d x d y, rho h (L^2 / 4)) $<S40>
Where the denominator comes from Eq.#ref(<S21>). Considering
the mode number $\( p \, q \)$, where $p = q > 1$, when coupled with
mode (1,1), the expression for the coupling constant can be defined as
$ lambda_11^(p q) = frac(E, 8 rho) \( pi / L \)^4 \[ p^2 + q^2 \] $<S41>
We have derived an equation similar to #ref(<S24>) that
includes the mode coupling term. The equation may be expressed as
$ frac(d^2 z_1, d t^2) + nu_1 frac(d z_1, d t) + omega_(n m)^2 z_1 + alpha_(n m) z_1^3 + lambda_(n m)^(p q) z_1 z_2^2 = f_p cos \( omega t \) $<S42>
This equation represents the mode coupling of the probe mode, which
exhibits displacement along the $z$ axis $\( z_1 \)$, with the driving
mode, whose displacement is $z_2$. $nu_1$, $omega_(n m)$, $alpha_(n m)$,
and $lambda_(n m)^(p q)$ represent the damping constant, natural
frequency, Duffing constant of the probe mode, respectively and
$lambda_(n m)^(p q)$ is the coupling constant between probe mode
$\( n \, m \)$ and drive mode $\( p \, q \)$. We have numerically
determined the coupling constant using Equation #ref(<S40>).
When $p = n$ and $q = m$, the coupling constant $lambda_(p q)^(n m)$
reduces to $alpha_(n m)$, corresponding to the intramode coupling, which
is basically the Duffing constant. \

#block[
#block[
#figure(
  align(center)[#table(
    columns: 6,
    align: (center,center,center,center,center,center,),
    table.header([], [$q = 1$], [$q = 2$], [$q = 3$], [$q = 4$], [$q = 5$],),
    table.hline(),
    [$p = 1$], [1.38], [2.41], [6.88], [11.70], [17.89],
    [$p = 2$], [2.41], [2.75], [10.67], [17.89], [27.19],
    [$p = 3$], [6.88], [10.67], [12.39], [17.21], [23.40],
    [$p = 4$], [11.70], [17.89], [17.21], [22.03], [28.22],
    [$p = 5$], [17.89], [27.19], [23.40], [28.22], [34.42],
      )]
  , caption: [Coupling constant for unit modal mass for mode
  $\( p \, q \)$, where $p \, q$ runs from 1 to 5, coupled with (3,3)
  mode. The values of the coupling constant are of the order $10^23$
  $m^(- 2) s^(- 2)$.The intramode coupling constant (Duffing constant)
  is highlighted in blue.]
  , kind: table
  ) #label("coupling-33")
]
]
#block[
#block[
#figure(
  align(center)[#table(
    columns: 6,
    align: (center,center,center,center,center,center,),
    table.header([], [$q = 1$], [$q = 2$], [$q = 3$], [$q = 4$], [$q = 5$],),
    table.hline(),
    [$p = 1$], [3.09], [7.74], [9.29], [26.33], [40.27],
    [$p = 2$], [7.74], [12.39], [16.26], [30.97], [44.91],
    [$p = 3$], [9.29], [16.26], [13.93], [44.14], [65.05],
    [$p = 4$], [26.33], [30.97], [44.14], [53.60], [63.50],
    [$p = 5$], [40.27], [44.91], [65.05], [63.60], [77.44],
    [], [], [], [], [], [],
  )]
  , caption: [Coupling constant for unit modal mass for mode
  $\( p \, q \)$, where $p \, q$ runs from 1 to 5, coupled with (3,3)
  mode. The values of the coupling constant are of the order $10^23$
  $m^(- 2) s^(- 2)$.The intramode coupling constant (Duffing constant)
  is highlighted in blue.]
  , kind: table
  ) #label("Table S2")
]
]
#figure(image("Figures/all_modes_v3.png", width: 70.0%),
  caption: [
    Theoretical estimation of the nonlinear mode coupling matrix. (a--f)
    Calculated coupling constants as a function of the driven mode
    indices $\( p \, q \)$ for $p \, q = 1$--$10$, coupled to the probe
    modes $\( 2 \, 1 \)$, $\( 3 \, 1 \)$, $\( 3 \, 2 \)$,
    $\( 4 \, 1 \)$, $\( 4 \, 2 \)$ and $\( 4 \, 3 \)$, respectively.
  ]
)
#label("Figure S1")

== Nonlinear frequency pulling
<nonlinear-frequency-pulling>
The frequency detuning equation for mode coupling is derived using the
method of multiple scales@kozinsky2007nonlinear. This approach alters
the time scale as follows $ T_n = epsilon.alt^n t \, $<S43> where
$T_0 = t$, and $epsilon.alt$ is the scaling parameter. For using method
of multiple scale the Eq #ref(<S42>) can be modified as
$ dot.double(z)_1 + 2 epsilon.alt mu_1 dot(z)_1 + omega_(n m)^2 z_1 + epsilon.alt alpha_(n m) z_1^3 + epsilon.alt lambda_(n m)^(p q) z_1 z_2^2 = epsilon.alt k_d thin c o s \( omega_(n m) T_0 + sigma T_1 \) . $<S44>
Using the method of multiple scale method we have reached a equation as
$ sigma = frac(3 alpha_(n m), 8 omega_(n m)) \( z_1^(p e a k) \)^2 plus.minus sqrt(frac(k_d^2, 4 omega_(n m)^2 \( z_1^(p e a k) \)^2) - mu_1^2) thin + frac(lambda_(n m)^(p q), 2 omega_(n m)) z_2^2 . $<S45>
For steady state the middle term in the RHS becomes zero. Then we can
get a equation like
$ sigma = frac(3 alpha_(n m), 8 omega_(n m)) \( z_1^(p e a k) \)^2 + frac(lambda_(n m)^(p q), 2 omega_(n m)) z_2^2 . $<S46>
Here, $sigma = omega - omega_(n m)$ denotes the frequency detuning. This
equation represents the frequency detuning generated by mode coupling,
enabling the determination of the coupling constant
($lambda_(n m)^(p q)$). In the absence of mode coupling, the equation
assumes the following form
$ sigma = frac(3 alpha_(n m), 8 omega_(n m)) \( z_1^(p e a k) \)^2 . $<S47>

#figure(image("Figures/FigureS2_v1.svg", width: 90.0%),
  caption: [
    Predicted frequency shift of the fundamental mode (a)(2,2), (b)(3,3)
    as a function of the coupled-mode amplitude.
  ]
)
#label("Figure S2")

Equation #ref(<S47>) helps us for the calculation of the
experimental Duffing constant ($alpha_(n m)$). When the applied force is
sufficiently small, the nonlinear terms in Eq. #ref(<S45>) can
be neglected. Using the coupling constant, the resulting shift in the
resonance frequency of the probe mode can then be plotted as a function
of the drive-mode amplitude. The resonance-frequency shifts of the (2,2)
and (3,3) modes as functions of the peak amplitudes of the other coupled
modes are shown in Fig. #ref(label("Figure S2")). The graph illustrates
the extent of the change in resonant frequency of the modes that can
occur when the coupled mode possesses the specified amplitude.

= Experimental Section
<experimental-section>
== Device parameters
<device-parameters>
The device parameters used in this work are summarized in
Table~#ref(label("Table S1")). The strain is calculated using the
resonance frequency relation given in Eq.#ref(<S22>). Using
the extracted strain and the Young's modulus, the corresponding tensile
stress is estimated to be approximately 1.05~GPa, consistent with
previously reported values~@shu2009fabrication.

#block[
#figure(
  align(center)[#table(
    columns: 2,
    align: (left,left,),
    table.header([#strong[Physical Parameter]], [#strong[Value]],),
    table.hline(),
    [Young's Modulus (E)], [$280 times 10^9 thin upright("Pa")$],
    [Density ($rho$)], [$3170 thin upright("kg/m")^3$
    @mestre2025network],
    [Inbuilt Strain ($epsilon.alt_0$)], [$3.751 times 10^(- 3)$],
    [Length (L)], [$500 times 10^(- 6) thin upright("m")$],
    [Thickness (h)], [$100 times 10^(- 9) thin upright("m")$],
  )]
  , caption: [Device Parameters]
  , kind: table
  ) #label("Table S1")
]
== Displacement calibration
<displacement-calibration>
The displacement of the membrane was calibrated using the laser Doppler
vibrometer (LDV), which provides an absolute measurement of the
out-of-plane displacement. To establish a conversion between the
electrical readout voltage and the physical displacement, the device was
driven with a low-frequency sinusoidal excitation of known amplitude
while simultaneously recording the displacement using the LDV and the
corresponding voltage signal using the lock-in amplifier. Figure
~#ref(label("Figure S3")) shows the measured displacement as a function
of the detected voltage. A linear fit to the data yields a calibration
factor of
$frac(partial z, partial V) = 0.2 med mu upright(m) \/ upright(V)$,
where $z$ is the mechanical displacement and $V$ is the measured voltage
at the lock-in amplifier.

This calibration factor was subsequently used to convert all voltage
signals measured using the lock-in amplifier into absolute displacement
units. Specifically, the displacement amplitude was obtained as
$z \( t \) = alpha V \( t \)$, where
$alpha = 0.2 med mu upright(m) \/ upright(V)$ is the experimentally
determined conversion factor. Since the LDV provides an absolute
displacement reference traceable to optical wavelength standards, this
procedure enables quantitative displacement measurements without
reliance on device parameters.

#figure(image("Figures/FigureS3.png", width: 50.0%),
  caption: [
    Measured mechanical displacement $z$ as a function of the detected
    lock-in amplifier voltage $V$. A linear fit to the data yields a
    displacement calibration factor of
    $partial z \/ partial V = 0.2 med mu upright(m) thin upright(V)^(- 1)$.
  ]
)
#label("Figure S3")

== Frequency responses of modes $\( 2 \, 1 \)$ and $\( 2 \, 2 \)$
<frequency-responses-of-modes-21-and-22>
Figures #ref(label("Figure S4"))\(b,e) show the linear frequency
responses of the $\( 2 \, 1 \)$ and $\( 2 \, 2 \)$ modes respectively.
The solid lines represent Lorentzian fits to the data, yielding quality
factors of $12.5 times 10^4$ for the $\( 2 \, 1 \)$ mode and
$11.5 times 10^4$ for the mode $\( 2 \, 2 \)$. As the driving force is
increased, the frequency response becomes progressively nonlinear, as
illustrated in Figs.~#ref(label("Figure S4"))\(a,d).
Figures~#ref(label("Figure S4"))\(c,f) show the extracted frequency
shift as a function of the peak amplitudes. The solid line correspond to
fits using Eq.~#ref(<S47>), from which the experimental
Duffing coefficients are obtained to be
$2.5 times 10^23 thin upright(m^(- 2) s^(- 2))$ and
$4.7 times 10^23 thin upright(m^(- 2) s^(- 2))$ for mode $\( 2 \, 1 \)$
and $\( 2 \, 2 \)$ respectively.

Throughout the measurements, the LDV laser spot was fixed at the center
of the membrane. This position corresponds to the anti-node of the (1,1)
mode but lies close to the nodal regions of the higher-order (2,1) and
(2,2) modes. As a result, the measured displacement amplitudes for these
modes are small, leading to increased amplitude fluctuations, as
observed in Fig.~#ref(label("Figure S4"))\(a,d). To account for this
effect, scaling factors were estimated from the extrema of the spatial
mode shapes shown in Fig. 1 in the main text. The scaling factor is
$10.2 plus.minus 4.0$ for the (2,1) mode and $25.2 plus.minus 11.0$ for
the (2,2) mode. The uncertainty arises from the mismatch between the LDV
laser spot size ($tilde.op 1 med mu upright(m)$) and the step size used
in the mode-shape measurements ($tilde.op 50 med mu upright(m)$). In
addition, the localized peak near $tilde.op 1628 med upright(k H z)$ is
attributed to higher-harmonic contributions from the parametrically
driven fundamental mode.

#figure(image("Figures/FigureS4_v2.svg"),
  caption: [
    \(a,d) Nonlinear frequency responses of mode $\( 2 \, 1 \)$ and
    $\( 2 \, 2 \)$ at increasing driving force. (b,e) Linear responses
    of the $\( 2 \, 1 \)$ and $\( 2 \, 2 \)$ modes at the lowest drive
    amplitudes; solid lines indicate Lorentzian fits used to extract the
    resonance frequencies and quality factors. (c,f) Amplitude-dependent
    frequency shifts corresponding to the maximum displacement
    amplitudes extracted from (a,d). Solid lines show fits to extract
    the Duffing coefficients.
  ]
)
#label("Figure S4")

#bibliography("References.bib", style: "ieee")
