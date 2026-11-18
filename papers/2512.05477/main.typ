// Adapted from Motohiko Ezawa, arXiv:2512.05477v1 (CC BY 4.0).
// https://arxiv.org/abs/2512.05477v1 | https://creativecommons.org/licenses/by/4.0/
#set heading(numbering: "1.1")
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
  title: [Quantum geometry and $X$-wave magnets with
$X = p, d, f, g, i$],
  authors: (
    ( name: [Motohiko Ezawa],
      affiliation: [Department of Applied Physics, The University of Tokyo, 7-3-1 Hongo, Tokyo 113-8656, Japan],
      email: "" ),
    ),
  date: [arXiv v1 · 2025-12-05],
  abstract-title: [Abstract],
  abstract: [Quantum geometry is a differential geometry based on
quantum mechanics. It is related to various transport and optical
properties in condensed matter physics. The Zeeman quantum geometry is a
generalization of quantum geometry including the spin degrees of
freedom. It is related to electromagnetic cross responses. Quantum
geometry is generalized to non-Hermitian systems and density matrices.
Especially, the latter is quantum information geometry, where the
quantum Fisher information naturally arises as quantum metric. We apply
these results to the $X$-wave magnets, which include $d$-wave, $g$-wave
and $i$-wave altermagnets as well as $p$-wave and $f$-wave magnets. They
have universal physics for anomalous Hall conductivity, tunneling
magneto-resistance and planar Hall effect. We obtain various analytic
formulas based on the two-band Hamiltonian.

],
  pagenumbering: "1",
  cols: 1,
  doc,
)


= Introduction
<introduction>
Quantum geometry is a differential geometry based on wave functions of
quantum mechanics \[1, 2, 3\]. The key component is the quantum
geometric tensor derived from quantum distance under infinitesimal
momentum translation. Its real part gives the quantum metric, while its
imaginary part gives the Berry curvature. It is well established that
the Hall conductivity is related to the integral of the Berry curvature,
whose relation is known as the Thouless-Kohmoto-Nightingale-Nijs (TKNN)
formula \[4, 5\]. On the other hand, quantum metric is related to
various observables such as optical absorption \[6, 7, 8, 9, 10, 11, 12,
13, 14, 15, 16, 17, 18, 19\], nonlinear conductivity \[20, 21, 22, 23,
24, 25, 26, 27, 28, 29, 30, 31, 32\] and bulk photovoltaic effects \[6,
9, 33, 34\]. Quantum geometric tensor is observed experimentally \[35,
36\]. Recently, quantum geometry is generalized to the Zeeman quantum
geometry by introducing spin translation in quantum distance. It is
related to electromagnetic responses.

Ferromagnets are useful for magnetic memory and spintronics devices.
However, there is a limitation of integration and fast dynamics due to
the stray field. On the other hand, there is no such limitation in
antiferromagnets. However, it is hard to readout the spin direction of
antiferromagnet due to net zero magnetization. $d$-wave magnets are
antiferromagnets whose electronic band structure has the $d$-wave
splitting \[37, 38, 39, 40, 41\]. It is prominent that spin current can
be generated by applying electric field or thermal gradient without
using the spin-orbit interaction \[37, 38, 39, 40, 41\]. The notion of
the $d$-wave magnets is generalized to altermagnets \[42, 43\] including
$g$-wave and $i$-wave altermagnets in two and three dimensions. They
break time-reversal symmetry. In addition, $p$-wave \[44, 45\] and
$f$-wave magnets are also recognized, where time-reversal symmetry is
preserved. They are summarized in the $X$-wave magnets \[46\] with
$X = p, d, f, g, i

$ because they share universal features \[47\]
irrespective of the presence or the absence of time-reversal symmetry.

In this paper, we review recent progress of quantum geometry and the
$X$-wave magnets. We derive compact analytical formulas of the Zeeman
quantum geometry based only on the two-band Hamiltonian without using
eigenfunctions. We also generalize the Zeeman quantum geometry to
multiband systems. Electromagnetic cross responses of the $

X$-wave
magnet with the Rashba interaction is also studied. We also review
quantum geometry defined for non-Hermitian systems and density matrices.
We note that there are some recent review articles on quantum geometry
\[48, 49, 51, 50\] and altermagnets \[43, 52, 53, 54, 55, 56, 57, 58\].

This paper is composed as follows. In Sec.@SecQG, we construct quantum
geometry starting from the fidelity of the wave function, which measures
the similarity of the two wave functions. The quantum distance is
defined based on the fidelity. By expanding the quantum distance with an
infinitesimal momentum translation, we obtain the quantum geometric
tensor. Its real part gives the quantum metric, while its imaginary part
gives the Berry curvature. The integration of the Berry curvature leads
to the Chern number, which is an integer characterizing a topological
insulator. By making a Fourier transformation of the wave function from
the momentum space to the real space, we obtain the Wannier function. It
is shown that the quantum metric is related to the fluctuation of the
position. We show an equality for the quantum geometry, which gives a
lower bound determined by the Chern number. We summarize simple formulas
to obtain the quantum metric and the Berry curvature directly from the
two-band Hamiltonian without using information about the eigenfunctions.
The quantum geometry is generalized to $N$-fold degenerate multiband
systems.

In Sec.@SecQGAp, the TKNN formula is derived, which relates the Hall
conductivity to the Chern number. It explains the quantization of the
Hall conductivity for a topological insulator. We apply these results to
the simplest Dirac system in two dimensions. Especially, optical
dichroism is shown, where the optical absorption is selectively occurred
depending on the chirality of the Dirac system. The sum rule which
relates the optical conductivity and the quantum metric is derived. Bulk
photovoltaic effects including the injection current and the shift
current are related to the quantum metric. In addition, the second-order
nonlinear conductivity is shown to be related to the quantum metric.

In Sec.@SecZeeman, quantum geometry is generalized to include the spin
degrees of freedom, which is called Zeemann quantum geometry. The
relation between the Zeemann quantum geometry and electromagnetic cross
responses are clarified. Simple formulas obtaining the Zeeman quantum
geometric tensor for the two-band systems are derived based only on the
Hamiltonian without using knowledge of the eigenfunctions. Their results
are applied to the Rashba system. The Zeeman quantum geometry is
generalized to $N$-fold degenerate systems.

In Sec.@SecNH, quantum geometry is generalized to non-Hermitian systems.
Especially, the quantum metric and the Berry curvature are obtained for
the two-band system. They are studied in the Dirac system with a complex
mass term.

In Sec.@SecQIG, quantum geometry is generalized to density matrices,
which is known as the quantum information geometry. Especially, quantum
distance is related to quantum Fisher information. The Clamer-Rao
inequality is explained, which gives the lower bound of the covariance
of the physical observable by the inverse of the quantum Fisher
information. It is shown that the quantum Fisher information is reduced
to the classical Fisher information for a pure state. Quantum geometry
at thermal equilibrium is derived, and it is shown that the Uhlmann
curvature is reduced to the Berry curvature at low temperature.

In Sec.@SecX, the notion of the $X$-wave magnets is introduced, which
includes the $d$-wave, $g$-wave and $i$-wave altermagnets as well as the
$p$-wave and $f$-wave magnets. Their symmetry properties are
summarized.~The quantum geometric properties are also calculated.

In Sec.@SecXTra, transport properties of the $X$-wave magnets are
summarized. The spin current generation by electric field and
temperature gradient is analytically studied. It is shown that only the
$d$-wave altermagnet has a linear response for the spin current. The
analytic formula for tunneling magnetoresistance is also studied.
Finally, we study a coupled system to the $X$-wave magnet and the Rashba
system. It is shown that it is impossible to detect the Neel vector of
the $X$-wave magnet by anomalous Hall conductivity based on the two-band
model. Universal formula for the planar Hall conductivity for the
$X$-wave magnets is presented. Electromagnetic responses of the $X$-wave
magnets are also studied.

= Quantum geometry
<SecQG>
== Quantum distance and quantum geometric tensor
<quantum-distance-and-quantum-geometric-tensor>
The fidelity of the wave function $\|psi_n (upright(bold(k))) chevron.r

$ is
defined
by$ F_n (upright(bold(k)) \, upright(bold(k))') equiv lr(| chevron.l psi_n (upright(bold(k))) \|psi_n (upright(bold(k))') chevron.r |) \, $ <Fidelity>


where
the wave function is orthonormalized,


$ chevron.l psi_n (upright(bold(k))) \|psi_n (upright(bold(k))') chevron.r  = delta \( upright(bold(k)) \, upright(bold(k))' \)$.
It satisfies
$0 lt.eq F_n (upright(bold(k)) \, upright(bold(k))') lt.eq 1$.

The Hilbert-Schmidt distance is defined
by$ s_(upright("HS")) (upright(bold(k)) \, upright(bold(k))') equiv sqrt(1 - F_n (upright(bold(k)) \, upright(bold(k))')^2) \, $

where
$s_(upright("HS")) (upright(bold(k)) \, upright(bold(k))') = 0

$ when the
two wave functions are identical
$\|psi_n (upright(bold(k))) chevron.r  = \|psi_n (upright(bold(k))') chevron.r $

, while
$s_(upright("HS")) (upright(bold(k)) \, upright(bold(k))') = 1

$ when
they are orthogonal
$ chevron.l psi_n (upright(bold(k))) \|psi_n (upright(bold(k))') chevron.r  = 0$.

The quantum geometric tensor $

cal(F)_n^(mu nu)

$ is defined as follows.
We start with the quantum distance $

d s_(upright("HS"))

$ for the
infinitesimal translation $

d upright(bold(k))

$ of the momentum as \[1,
2,
59\]$ d s_(upright("HS")) (upright(bold(k))) equiv sqrt(1 - F_n (upright(bold(k)) \, upright(bold(k)) + d upright(bold(k)))^2) \, $

with

$ F_n (upright(bold(k)) \, upright(bold(k)) + d upright(bold(k))) = \| chevron.l psi_n (upright(bold(k))) \| U_(d upright(bold(k))) \| psi_n \( upright(bold(k)) \) chevron.r \| \, $

where

$ U_(d upright(bold(k))) equiv e^(- i d upright(bold(k)) dot.op upright(bold(r))) $ <Udk>


is
the generator of the infinitesimal momentum translation
$d upright(bold(k))

$ and
$r_mu upright(bold(equiv)) i partial \/ partial_(k_mu)$ is the position
operator. The quantum distance for the infinitesimal momentum is
expanded in terms of the quantum geometric tensor $

cal(F)_n^(mu nu)

$ as$ (d s_(upright("HS")))^2 = sum_(mu nu) cal(F)_n^(mu nu) d k_mu d k_nu \, $ <dsF>


where
$mu \, nu

$ stand for $

x \, y$, and


$ cal(F)_n^(mu nu) (upright(bold(k))) =  chevron.l partial_(k_mu) psi_n (upright(bold(k)))\| (1 - \|psi_n (upright(bold(k))) chevron.r   chevron.l psi_n (upright(bold(k)))\|) \|partial_(k_nu) psi_n (upright(bold(k))) chevron.r  \, $ <F12>


with
$partial_(k_mu) equiv frac(partial, partial k_mu)$. It is called the
Fubini-Study metric \[60, 61\]. It is rewritten
as

$ cal(F)_n^(mu nu) (upright(bold(k))) =  chevron.l partial_(k_mu) psi_n (upright(bold(k)))\| (1 - P_n (upright(bold(k)))) \|partial_(k_nu) psi_n (upright(bold(k))) chevron.r  \, $

where
we have defined the projection
operator,

$ P_n (upright(bold(k))) equiv \|psi_n (upright(bold(k))) chevron.r   chevron.l psi_n (upright(bold(k)))\| \, $

satisfying
the idenpotency condition
$P (upright(bold(k)))^2 = P (upright(bold(k)))$. The presence of the
projection operator is understood as follows.
$\|partial_(k_nu) psi_n (upright(bold(k))) chevron.r

$ is generally mapped out of
the band $

n$, where the projection operator restricts
$\|partial_(k_nu) psi_n (upright(bold(k))) chevron.r

$ to the band $

n$.
$cal(F)_n^(mu nu)

$ is Hermitian,
$(cal(F)_n^(mu nu))^(*) = cal(F)_n^(nu mu)$. The derivation of Eq.(@F12)
is shown in Appendix @ApQ.

The quantum metric is the real part of the quantum geometric
tensor,$ g_n^(mu nu) equiv upright("Re") cal(F)_n^(mu nu) = frac(cal(F)_n^(mu nu) (upright(bold(k))) + (cal(F)_n^(mu nu) (upright(bold(k))))^(*), 2) \, $ <g12>


while
the Berry curvature is the imaginary part of the quantum geometric
tensor,

$ Omega_n^(mu nu) equiv 2 upright("Im") cal(F)_n^(mu nu) = i (cal(F)_n^(mu nu) (upright(bold(k))) - (cal(F)_n^(mu nu) (upright(bold(k))))^(*)) . $ <BerryF>


There
are
relations

$ g_n^(mu nu) = g_n^(nu mu) \, #h(2em) Omega_n^(mu nu) = - Omega_n^(nu mu) . $ <gOmega>


With
the use of them, the quantum geometric tensor is decomposed into the
real and imaginary
parts,

$ cal(F)_n^(mu nu) = g_n^(mu nu) - i / 2 Omega_n^(mu nu) . $



The Berry curvature does not contribute to the quantum
distance

$ (d s_(upright("HS")))^2 = sum_(mu nu) g_n^(mu nu) d k_mu d k_nu \, $

because
of the symmetry $d k_mu d k_nu = d k_nu d k_mu$.

By introducing the Wilczek-Zee connection
\[62\],

$ a_(n m)^mu (upright(bold(k))) equiv i  chevron.l psi_n (upright(bold(k)))\| partial_(k_mu) \|psi_m (upright(bold(k))) chevron.r  \, $ <WZa>


the
quantum geometric tensor is rewritten
as

$ & cal(F)_n^(mu nu) (upright(bold(k)))\
= & sum_(m eq.not n)  chevron.l partial_(k_mu) psi_n (upright(bold(k))) \|psi_m (upright(bold(k))) chevron.r   chevron.l psi_m (upright(bold(k))) \|partial_(k_nu) psi_n (upright(bold(k))) chevron.r \
= & sum_(m eq.not n) (i  chevron.l psi_m (upright(bold(k))) \|partial_(k_mu) psi_n (upright(bold(k))) chevron.r )^(*) i  chevron.l psi_m (upright(bold(k))) \|partial_(k_nu) psi_n (upright(bold(k))) chevron.r \
= & sum_(m eq.not n) a_(m n)^(mu *) (upright(bold(k))) a_(m n)^nu (upright(bold(k))) . $

The
Wilczek-Zee connection is Hermitian,


$ a_(n m)^(mu *) (upright(bold(k))) = a_(m n)^mu (upright(bold(k))) \, $ <AHermitian>


because

$ & i frac(partial, partial k_mu)  chevron.l psi_m (upright(bold(k))) \|psi_n (upright(bold(k))) chevron.r \
= & i  chevron.l partial_(k_mu) psi_m (upright(bold(k))) \|psi_n (upright(bold(k))) chevron.r  + i  chevron.l psi_m (upright(bold(k))) \|partial_(k_mu) psi_n (upright(bold(k))) chevron.r \
= & (- i  chevron.l psi_n (upright(bold(k))) \|partial_(k_mu) psi_m (upright(bold(k))) chevron.r )^(*) + i  chevron.l psi_m (upright(bold(k))) \|partial_(k_mu) psi_n (upright(bold(k))) chevron.r \
= & - a_(n m)^(mu *) (upright(bold(k))) + a_(m n)^mu (upright(bold(k))) = 0 . $

Then,
the quantum geometric tensor is rewritten
as

$ cal(F)_n^(mu nu) (upright(bold(k))) = sum_(m eq.not n) a_(n m)^mu (upright(bold(k))) a_(m n)^nu (upright(bold(k))) $ <Faa>


in
terms of the Wilczek-Zee connection.

== Berry connection, Berry curvature and Chern number
<berry-connection-berry-curvature-and-chern-number>
It follows that
$Omega_n^(x x) (upright(bold(k))) = Omega_n^(y y) (upright(bold(k))) = 0

$ from the antisymmetric property Eq.(@gOmega). Then, the nontrivial
contributions are $

Omega_n^(x y) (upright(bold(k)))

$ and
$Omega_n^(y x) (upright(bold(k)))$. The Berry curvature (@BerryF)
reads$  & Omega_n^(x y) (upright(bold(k)))\
= & i  chevron.l partial_(k_x) psi_n (upright(bold(k)))\| 1 - P (upright(bold(k))) \|partial_(k_y) psi_n (upright(bold(k))) chevron.r \
 & - i  chevron.l partial_(k_y) psi_n (upright(bold(k)))\| 1 - P (upright(bold(k))) \|partial_(k_x) psi_n (upright(bold(k))) chevron.r \
= & i  chevron.l partial_(k_x) psi_n (upright(bold(k))) \|partial_(k_y) psi_n (upright(bold(k))) chevron.r  - i  chevron.l partial_(k_y) psi_n (upright(bold(k))) \|partial_(k_x) psi_n (upright(bold(k))) chevron.r \
 & - i  chevron.l partial_(k_x) psi_n (upright(bold(k))) \|psi_n (upright(bold(k))) chevron.r   chevron.l psi_n (upright(bold(k))) \|partial_(k_y) psi_n (upright(bold(k))) chevron.r \
 & + i  chevron.l partial_(k_y) psi_n (upright(bold(k))) \|psi_n (upright(bold(k))) chevron.r   chevron.l psi_n (upright(bold(k))) \|partial_(k_x) psi_n (upright(bold(k))) chevron.r \
= & i  chevron.l partial_(k_x) psi_n (upright(bold(k))) \|partial_(k_y) psi_n (upright(bold(k))) chevron.r  - i  chevron.l partial_(k_y) psi_n (upright(bold(k))) \|partial_(k_x) psi_n (upright(bold(k))) chevron.r \
 & + i a_n^(x *) (upright(bold(k))) a_n^y (upright(bold(k))) - i a_n^(y *) (upright(bold(k))) a_n^x (upright(bold(k))) \, $ <Berry1>


where
we have defined the Berry
connection

$ a_n^mu (upright(bold(k))) equiv a_(n n)^mu (upright(bold(k))) \, $

which
is real, $a_n^(mu *) (upright(bold(k))) = a_n^mu (upright(bold(k)))$.

Then, the Berry curvature (@Berry1) is rewritten as


$ & Omega_n^(x y) (upright(bold(k)))\
= & i  chevron.l partial_(k_x) psi_n (upright(bold(k))) \|partial_(k_y) psi_n (upright(bold(k))) chevron.r  - i  chevron.l partial_(k_y) psi_n (upright(bold(k))) \|partial_(k_x) psi_n (upright(bold(k))) chevron.r \
= & - 2 upright("Im")  chevron.l frac(partial psi_n (upright(bold(k))), partial k_x) \|frac(partial psi_n (upright(bold(k))), partial k_y) chevron.r \
= & frac(partial a_n^y (upright(bold(k))), partial k_x) - frac(partial a_n^x (upright(bold(k))), partial k_y) = [nabla times upright(bold(a))_n (upright(bold(k)))]_z . $

Its
integral over the whole Brillouin zone is
quantized

$ frac(1, 2 pi) integral d upright(bold(k)) Omega_n^(x y) (upright(bold(k))) = & frac(1, 2 pi) integral.cont d k_mu nabla times Omega_n^(x y) (upright(bold(k)))\
= & frac(1, 2 pi) integral.cont d k_mu a_n^mu (upright(bold(k))) = cal(C)_n \, $ <ChernTKNN2>


where
$cal(C)_n

$ is the Chern number taking an integer.

We go on to prove that $

cal(C)_n

$ is an integer \[63\]. The formula
(@ChernTKNN2) is interpreted as the integral of the Berry curvature
$Omega_n^(x y) (upright(bold(k)))$ over the first Brillouin zone, which
is the Chern number. Using the Stokes theorem, this can be rewritten as
a contour integration along the boundary of the Brillouin zone,
$ cal(C)_n = frac(1, 2 pi) integral d upright(bold(k)) thin Omega_n^(x y) (upright(bold(k))) = frac(1, 2 pi) integral.cont d k_mu a_n^mu (upright(bold(k))) . $

Since
it is a periodic system, it follows that $cal(C)_n = 0

$ if
$a_n^mu (upright(bold(k)))$ is a regular function. However, the gauge
potential $

a_n^mu (upright(bold(k)))

$ can be singular though the
magnetic field $

Omega_n^(x y) (upright(bold(k)))

$ is regular. In this
case it is necessary to choose the contour integration to avoid these
singular points.~Then, $

cal(C)_n

$ counts the number of singularities,
following the argument familiar in the theory of Dirac monopoles.

== Wannier function and polarization
<wannier-function-and-polarization>
The Wannier function is defined
by$ \|w_n (upright(bold(r))) chevron.r  equiv frac(1, 2 pi) integral_(upright("BZ")) d upright(bold(k)) e^(- i upright(bold(k)) dot.op upright(bold(r))) \|psi_n (upright(bold(k))) chevron.r  \, $

or

$ \|psi_n (upright(bold(k))) chevron.r  = sum_(upright(bold(r))) e^(i upright(bold(k)) dot.op upright(bold(r))) \|w_n (upright(bold(r))) chevron.r  . $

Then,
the Berry connection is rewritten
as

$ a_n^mu (upright(bold(k))) & equiv i  chevron.l psi_n (upright(bold(k)))\| frac(d, d k_mu) \|psi_n (upright(bold(k))) chevron.r \
= & sum_(upright(bold(r \, r))')  chevron.l w_n (upright(bold(r))')\| e^(- i upright(bold(k)) dot.op upright(bold(r))') frac(d, d k_mu) e^(i upright(bold(k)) dot.op upright(bold(r))) \|w_n (upright(bold(r))) chevron.r \
= & sum_(upright(bold(r \, r))')  chevron.l w_n (upright(bold(r))')\| e^(i upright(bold(k)) dot.op (upright(bold(r - r))')) r_mu \|w_n (upright(bold(r))) chevron.r  . $

We
integrate it over the Brillouin zone and
obtain

$ & frac(1, 2 pi) integral_(upright("BZ")) a_n^mu (upright(bold(k))) d upright(bold(k))\
= & sum_(upright(bold(r \, r))')  chevron.l w_n (upright(bold(r))')\| integral_(upright("BZ")) e^(i upright(bold(k)) dot.op (upright(bold(r - r))')) d upright(bold(k)) r_mu \|w_n (upright(bold(r))) chevron.r \
= & sum_(upright(bold(r \, r))')  chevron.l w_n (upright(bold(r))')\| delta (upright(bold(r - r))') r_mu \|w_n (upright(bold(r))) chevron.r \
= & sum_(upright(bold(r)))  chevron.l w_n (upright(bold(r)))\| r_mu \|w_n (upright(bold(r))) chevron.r  =  chevron.l r_mu chevron.r  . $

It
is the expectation value of the position $r_mu$, which represents the
polarization.

The quantum metric is related to the fluctuation of the polarization
\[64\],

$ & frac(1, 2 pi) integral_(upright("BZ")) g_n^(mu mu) (upright(bold(k))) d upright(bold(k))\
= & sum_(upright(bold(r)))  chevron.l w_n (upright(bold(r)))\| r_mu^2 \|w_n (upright(bold(r))) chevron.r  -  chevron.l w_n (upright(bold(r)))\| r_mu \|w_n (upright(bold(r))) chevron.r ^2\
= &  chevron.l r_mu^2 chevron.r  -  chevron.l r_mu chevron.r ^2 . $



== Inequality
<inequality>
There is an inequality for the quantum metric and the Berry curvature in
two dimensions \[65,
66\],

$ 1 / 2 upright("Tr") g_n^(mu nu) (upright(bold(k))) gt.eq sqrt(det g_n^(mu nu) (upright(bold(k)))) gt.eq lr(|Omega_n^(x y) (upright(bold(k)))|) / 2 \, $ <Ineq>


where
the trace and the determinant are taken over $mu

$ and $

nu$. The first
inequality is proved by using the arithmetic geometric
mean,

$ frac(g_(+) + g_(-), 2) gt.eq sqrt(g_(+) g_(-)) \, $

where
$g_plus.minus

$ is the diagonal component of the diagonalized
$g_n^(mu nu) (upright(bold(k)))$,$ g_n^(mu nu) (upright(bold(k))) = mat(delim: "(", g_(+), 0; 0, g_(-)) $

with

$ g_plus.minus equiv frac(g_n^(x x) + g_n^(y y) plus.minus sqrt((g_n^(x x) - g_n^(y y))^2 + 4 (g_n^(x y))^2), 2) . $

The
second inequality is proved by using the non-negativity of
$cal(F)_n^(mu nu) (upright(bold(k)))$,

$ det cal(F)_n^(mu nu) (upright(bold(k))) gt.eq 0 \, $

which
is derived from the non-negativity of the quadratic form in Eq.(@dsF).
It is equivalent
to

$ det g_n^(mu nu) (upright(bold(k))) gt.eq (Omega_n^(x y) / 2)^2 \, $

where
we have
used

$ cal(F)_n^(mu nu) = mat(delim: "(", g_n^(x x), g_n^(x y) - i Omega_n^(x y) \/ 2; g_n^(x y) + i Omega_n^(x y) \/ 2, g_n^(y y)) \, $

which
is derived from Eqs.(@g12), (@BerryF) and (@gOmega).

By integrating the inequality (@Ineq) over the whole Brillouin zone, we
obtain \[65, 66, 67,
68\]

$ & frac(1, 2 pi) integral d upright(bold(k)) upright("Tr") g_n^(mu nu) (upright(bold(k)))\
 & gt.eq 2 frac(1, 2 pi) integral d upright(bold(k)) sqrt(det g_n^(mu nu) (upright(bold(k))))\
 & gt.eq frac(1, 2 pi) integral d upright(bold(k)) lr(|Omega_n^(x y) (upright(bold(k)))|) gt.eq frac(1, 2 pi) integral d upright(bold(k)) Omega_n^(x y) (upright(bold(k))) = cal(C)_n . $

This
gives a lower bound for
$integral d upright(bold(k))$Tr$g_n^(mu nu) (upright(bold(k)))$, when
the system is topological, $cal(C)_n gt.eq 1$. There are some
applications to this inequality \[69, 12, 70\].

The quantum volume is defined by the Riemann volume as \[67\]



$ upright("vol")_g equiv frac(1, 2 pi) integral d upright(bold(k)) sqrt(det g_n^(mu nu) (upright(bold(k)))) . $

The
quantum weight is defined by
\[71\]

$ K^(mu nu) equiv frac(1, 2 pi) integral d upright(bold(k)) g_n^(mu nu) (upright(bold(k))) \, $

which
measures quantum fluctuation in the center of mass. It is experimentally
determined from X-ray scattering.

== Quantum Geometry for two-band systems
<quantum-geometry-for-two-band-systems>
We consider a two-band system with the index $n = plus.minus$. The
Hamiltonian is generally given by


$ H (upright(bold(k))) = h_0 (upright(bold(k))) + upright(bold(sigma)) dot.op upright(bold(h)) (upright(bold(k))) \, $ <Hamil2>


where
$upright(bold(h)) (upright(bold(k)))

$ is parametrized as the normalized
vector
$upright(bold(n)) (upright(bold(k)))$,$ upright(bold(n)) (upright(bold(k))) equiv upright(bold(h)) (upright(bold(k))) \/ \| upright(bold(h)) (upright(bold(k))) \| = (sin theta cos phi.alt \, sin theta sin phi.alt \, cos theta) \, $ <dVector>


and
$sigma_j

$ is the Pauli matrix with $

j = x \, y \, z$. In this case,
there are simple forms in terms of
$upright(bold(n)) (upright(bold(k)))$.

The energy is given
by

$ epsilon_plus.minus = h_0 (upright(bold(k))) plus.minus \| upright(bold(h)) (upright(bold(k))) \| upright(".") $



The eigenfunctions $psi_plus.minus (upright(bold(k)))

$ of the
Hamiltonian (@Hamil2) corresponding to the energy $

epsilon_plus.minus

$ are given
by$ psi_(+) (upright(bold(k))) = & e^(i alpha (upright(bold(k)))) vec(e^(- i phi.alt (upright(bold(k)))) cos frac(theta (upright(bold(k))), 2), sin frac(theta (upright(bold(k))), 2)) \,\
psi_(-) (upright(bold(k))) = & e^(i alpha (upright(bold(k)))) vec(- e^(- i phi.alt (upright(bold(k)))) sin frac(theta (upright(bold(k))), 2), cos frac(theta (upright(bold(k))), 2)) \, $

where
$alpha (upright(bold(k)))

$ is a real function representing a gauge
degrees of freedom. Then, the Wilczek-Zee connection (@WZa) is
calculated
as$ a_(+ -)^mu (upright(bold(k))) = & - i  chevron.l psi_(+) (upright(bold(k)))\| partial_(k_mu) psi_(-) (upright(bold(k))) chevron.r\
= & i frac(partial_(k_mu) theta, 2) + frac(partial_(k_mu) phi.alt, 2) sin theta \, $

and

$ a_(- +)^mu (upright(bold(k))) = & - i  chevron.l psi_(-) (upright(bold(k)))\| partial_(k_mu) psi_(+) (upright(bold(k))) chevron.r\
= & - i frac(partial_(k_mu) theta, 2) + frac(partial_(k_mu) phi.alt, 2) sin theta \, $

irrespective
of $alpha$.

The quantum metric is explicitly given by \[72, 73, 74, 75, 12, 15, 17,
18\]

$ g_plus.minus^(mu nu) (upright(bold(k))) = & plus.minus 1 / 2 (partial_(k_mu) upright(bold(n))) dot.op (partial_(k_nu) upright(bold(n)))\
= & plus.minus 1 / 4 (partial_(k_mu) theta partial_(k_nu) theta + sin^2 theta partial_(k_mu) phi.alt partial_(k_nu) phi.alt) $ <Gmn>


with
the normalized vector (@dVector). Two or three components of
$upright(bold(n))$~should be nonzero for nonzero $g^(mu nu)$. It is
understood as follows: If only one component $n_z (upright(bold(k)))

$ is
nonzero, it is given by
$n_z (upright(bold(k))) = h_z (upright(bold(k))) \/ lr(|h_z (upright(bold(k)))|)$,
whose derivative $

partial_(k_mu) upright(bold(n))

$ is singular.

The Berry curvature is explicitly given by \[77, 78, 79, 73,
75\]$ Omega_plus.minus^(x y) (upright(bold(k))) = & minus.plus 1 / 2 upright(bold(n)) dot.op (partial_(k_x) upright(bold(n)) times partial_(k_y) upright(bold(n)))\
= & plus.minus 1 / 2 sin theta (partial_(k_x) phi.alt partial_(k_y) theta - partial_(k_x) theta partial_(k_y) phi.alt) . $ <Omegaxy>


It
is a solid angle of the vector $upright(bold(n))$. Hence, three
components of $upright(bold(n))

$ should be nonzero for nonzero
$Omega_plus.minus^(x y)$.

== Non-Abelian quantum geometry
<SecQGMulti>
So far, we have studied the case where the target band is a single band.
If the target bands are $

N$-fold degenerate, we consider the $N$-fold
degenerate wave
function,

$ \|psi (upright(bold(k))) chevron.r  = sum_(n = 1)^N c_n \|psi_n (upright(bold(k))) chevron.r  \, $ <psi>


satisfying
the normalization condition, $sum_(n = 1)^N lr(|c_n|)^2 = 1$. It is
necessary to generalize quantum geometry to the non-Abelian quantum
geometry \[3\]. The fidelity of the wave functions
$\|psi (upright(bold(k))) chevron.r

$ and
$\|psi (upright(bold(k)) + d upright(bold(k))) chevron.r $

 is defined
by

$ F (upright(bold(k)) \, upright(bold(k)) + d upright(bold(k))) equiv lr(| chevron.l psi (upright(bold(k)))\| U_(d upright(bold(k))) \|psi (upright(bold(k))) chevron.r |) $

with
$U_(d upright(bold(k)))

$ given by Eq.(@Udk). The quantum distance is
$ d s_(upright("HS")) equiv sqrt(1 - F (upright(bold(k)) \, upright(bold(k)) + d upright(bold(k)))^2) $

The
non-Abelian quantum geometric tensor is given
by

$ (d s_(upright("HS")))^2 equiv sum_(mu nu) sum_(n m) cal(F)_(n m)^(mu nu) d k_mu d k_nu $

with

$ cal(F)_(n m)^(mu nu) =  chevron.l partial_(k_mu) psi_n (upright(bold(k)))\| (1 - P (upright(bold(k)))) \|partial_(k_mu) psi_m (upright(bold(k))) chevron.r $ <F12Mu>


where
$cal(P) (upright(bold(k)))

$ is the projection operator onto the target
bands,$ cal(P) (upright(bold(k))) equiv sum_(n = 1)^N \|psi_n (upright(bold(k))) chevron.r   chevron.l psi_n (upright(bold(k)))\| \, $

which
satisfies the idempotence relation
$cal(P) (upright(bold(k)))^2 = cal(P) (upright(bold(k)))$. The
derivation is shown in Appendix @ApQ2.

The quantum metric is the real part of the quantum geometric
tensor,

$ g_(n m)^(mu nu) equiv upright("Re") cal(F)_(n m)^(mu nu) = frac(cal(F)_(m n)^(mu nu) (upright(bold(k))) + (cal(F)_(m n)^(mu nu) (upright(bold(k))))^(*), 2) \, $

while
the Berry curvature is the imaginary part of the quantum geometric
tensor,

$ Omega_(n m)^(mu nu) equiv 2 upright("Im") cal(F)_(n m)^(mu nu) = i (cal(F)_(m n)^(mu nu) (upright(bold(k))) - (cal(F)_(m n)^(mu nu) (upright(bold(k))))^(*)) . $

It
is further calculated as

$ & Omega_(n m)^(mu nu)\
= & i  chevron.l partial_(k_mu) psi_n (upright(bold(k)))\| 1 - P (upright(bold(k))) \|partial_(k_nu) psi_m (upright(bold(k))) chevron.r \
 & - i  chevron.l partial_(k_nu) psi_m (upright(bold(k)))\| 1 - P (upright(bold(k))) \|partial_(k_mu) psi_n (upright(bold(k))) chevron.r \
= & i  chevron.l partial_(k_mu) psi_n (upright(bold(k))) \|partial_(k_nu) psi_m (upright(bold(k))) chevron.r  - i  chevron.l partial_(k_nu) psi_m (upright(bold(k))) \|partial_(k_mu) psi_n (upright(bold(k))) chevron.r \
 & - i sum_(n' eq.not n \, m)  chevron.l partial_(k_mu) psi_n (upright(bold(k))) \|psi_(n') (upright(bold(k))) chevron.r   chevron.l psi_(n') (upright(bold(k))) \|partial_(k_nu) psi_m (upright(bold(k))) chevron.r \
 & + i sum_(n' eq.not n \, m)  chevron.l partial_(k_nu) psi_m (upright(bold(k))) \|psi_(n') (upright(bold(k))) chevron.r   chevron.l psi_(n') (upright(bold(k))) \|partial_(k_mu) psi_n (upright(bold(k))) chevron.r \
= & i  chevron.l partial_(k_mu) psi_n (upright(bold(k))) \|partial_(k_nu) psi_m (upright(bold(k))) chevron.r  - i  chevron.l partial_(k_nu) psi_m (upright(bold(k))) \|partial_(k_mu) psi_n (upright(bold(k))) chevron.r \
 & + sum_(n' eq.not n \, m) i a_(n' n)^(mu *) a_(n' m)^nu - i a_(n' m)^(nu *) a_(n' n)^mu . $

With
the use of the Hermiticity condition of the Berry connection
(@AHermitian), we
have

$ Omega_(n m)^(mu nu) = & i  chevron.l partial_(k_mu) psi_n (upright(bold(k))) \|partial_(k_nu) psi_m (upright(bold(k))) chevron.r \
 & - i  chevron.l partial_(k_nu) psi_m (upright(bold(k))) \|partial_(k_mu) psi_n (upright(bold(k))) chevron.r \
 & - sum_(n' eq.not n \, m) i a_(n n')^mu a_(n' m)^nu + sum_(n' eq.not n \, m) i a_(m n')^nu a_(n' n)^mu\
= & nabla times a_(n m)^mu - sum_(n' eq.not n \, m) i [a_(n n')^mu \, a_(n' m)^nu] . $

There
is an additional term $- i [a_(n n')^mu \, a_(n' m)^nu]

$ in the
Wilczek-Zee connection comparing with the Berry connection.

= Quantum geometry in condensed matter physics
<SecQGAp>
== Thouless-Kohmoto-Nightingale-Nijs formula
<thouless-kohmoto-nightingale-nijs-formula>
The Berry curvature is related to the Hall conductivity. Especially, the
Hall conductivity is quantized in an insulator and is proportional to
the Chern number, which is known as the TKNN formula \[4\].

According to the Kubo formula, the Hall conductance is given
by$ sigma_(x y) = - i ℏ e^2 & integral d upright(bold(k)) sum_(n eq.not m) frac(f (epsilon_n (upright(bold(k)))), (epsilon_n (upright(bold(k))) - epsilon_m (upright(bold(k))))^2)\
 & times \[  chevron.l psi_n (upright(bold(k)))\| v_x \|psi_m (upright(bold(k))) chevron.r   chevron.l psi_m (upright(bold(k)))\| v_y \|psi_n (upright(bold(k))) chevron.r \
 & -  chevron.l psi_n (upright(bold(k)))\| v_y \|psi_m (upright(bold(k))) chevron.r   chevron.l psi_m (upright(bold(k)))\| v_x \|psi_n (upright(bold(k))) chevron.r  \] \, $ <KTKubo>


where
$f (epsilon_n (upright(bold(k)))) = 1 \/ (exp [(epsilon_n \( upright(bold(k)) \) - mu) \/ (k_(upright("B")) T) + 1])

$ is the Fermi distribution function and $

mu

$ is the chemical potential.
By using the Hellmann-Feynman
theorem$  &  chevron.l psi_m (upright(bold(k)))\| v_mu \|psi_n (upright(bold(k))) chevron.r \
= & 1 / ℏ partial_(k_mu) epsilon_n (upright(bold(k))) chevron.l psi_m (upright(bold(k))) \| psi_n (upright(bold(k))) chevron.r\
 & + 1 / ℏ (epsilon_n (upright(bold(k))) - epsilon_m (upright(bold(k))))  chevron.l psi_m (upright(bold(k)))\| partial_(k_mu) \|psi_n (upright(bold(k))) chevron.r $ <HF>


for the states subject to the orthonormalization condition,
$chevron.l psi_m (upright(bold(k))) \| psi_n (upright(bold(k))) chevron.r = delta_(m n)$,
the Hall conductance is rewritten
as

$ sigma_(x y) = & - frac(i e^2, ℏ) integral d upright(bold(k)) sum_(n \, m) f (epsilon_n (upright(bold(k))))\
 & times \[ chevron.l psi_n (upright(bold(k))) \| partial_(k_x) psi_m (upright(bold(k))) chevron.r  chevron.l psi_m (upright(bold(k)))\| partial_(k_y) psi_n (upright(bold(k))) chevron.r\
 & -  chevron.l psi_n (upright(bold(k)))\| partial_(k_y) psi_m (upright(bold(k))) chevron.r  chevron.l psi_m (upright(bold(k)))\| partial_(k_x) psi_n (upright(bold(k))) chevron.r \] . $

It
should be noticed that the sum can be extended to include the states
with $n = m

$ in this formula, since
$  & chevron.l psi_n (upright(bold(k))) \| partial_(k_x) psi_n (upright(bold(k))) chevron.r  chevron.l psi_n (upright(bold(k)))\| partial_(k_y) psi_n (upright(bold(k))) chevron.r\
= &  chevron.l psi_n (upright(bold(k)))\| partial_(k_y) psi_n (upright(bold(k))) chevron.r  chevron.l psi_n (upright(bold(k)))\| partial_(k_x) psi_n (upright(bold(k))) chevron.r . $

The
proof of the Hellmann-Feynman theorem is shown in Appendix @ApHF.

Making the use of the relation


$ & chevron.l psi_n (upright(bold(k))) \| partial_(k_x) psi_m (upright(bold(k))) chevron.r + chevron.l partial_(k_x) psi_n (upright(bold(k))) \| psi_m (upright(bold(k))) chevron.r\
= & partial_(k_x) chevron.l psi_m (upright(bold(k))) \| psi_n (upright(bold(k))) chevron.r = 0 \, $

the
Hall conductance is rewritten
as

$ sigma_(x y) = & - frac(i e^2, ℏ) integral d upright(bold(k)) sum_(n \, m) f (epsilon (upright(bold(k))))\
 & times \[ chevron.l partial_(k_x) psi_n (upright(bold(k))) \| psi_m (upright(bold(k))) chevron.r  chevron.l psi_m (upright(bold(k)))\| partial_(k_y) psi_n (upright(bold(k))) chevron.r\
 & -  chevron.l partial_(k_y) psi_n (upright(bold(k)))\| psi_m (upright(bold(k))) chevron.r  chevron.l psi_m (upright(bold(k)))\| partial_(k_x) psi_n (upright(bold(k))) chevron.r \] . $

Using
the completeness condition
$sum_m \| psi_m (upright(bold(k))) chevron.r  chevron.l psi_m (upright(bold(k)))\| = 1$,
we
obtain

$ sigma_(x y) = & frac(i e^2, ℏ) integral d upright(bold(k)) sum_n f (epsilon_n (upright(bold(k)))) \[ chevron.l partial_(k_x) psi_n (upright(bold(k))) \| partial_(k_y) psi_n (upright(bold(k))) chevron.r\
 & -  chevron.l partial_(k_y) psi_n (upright(bold(k)))\| partial_(k_x) psi_n (upright(bold(k))) chevron.r \] . $

It
is rewritten
as

$ sigma_(x y) = frac(e^2, 2 pi h) sum_n integral d upright(bold(k)) thin f (epsilon_n (upright(bold(k)))) Omega_n^(x y) (upright(bold(k))) \, $ <TKNNf>


where

$ Omega_n^(x y) (upright(bold(k))) = i [chevron.l partial_(k_x) psi_n (upright(bold(k))) \| partial_(k_y) psi_n (upright(bold(k))) chevron.r - chevron.l partial_(k_y) psi_n (upright(bold(k))) \| partial_(k_x) psi_n (upright(bold(k))) chevron.r] . $ <BerryC>


The
conductance is the sum of the contributions from various bands indexed
by $n$. It is convenient to define a \"gauge potential\" in the momentum
space for each band index $n

$ by$ a_n^mu (upright(bold(k))) = - i  chevron.l psi_n (upright(bold(k)))\| partial_(k_mu) psi_n (upright(bold(k))) chevron.r \, $ <BerryConne>


which
is the Berry connection. We may rewrite (@BerryC) as


$ Omega_n^(x y) (upright(bold(k))) = partial_(k_x) a_n^y (upright(bold(k))) - partial_(k_y) a_n^x (upright(bold(k))) . $ <BerryCurva>


This
is the \"magnetic field\", which is the Berry curvature.

We consider the zero-temperature limit, where the Fermi distribution
function becomes a step function,
$f (epsilon_n (upright(bold(k)))) = theta (mu - epsilon_n)$. The
conductance (@TKNNf) is simplified as


$ sigma_(x y) = e^2 / h sum_(n = 1)^N cal(C)_n \, $ <TKNN>


becuase the
integration is taken below the Fermi energy.

== Dirac system
<dirac-system>
We apply the above formula to the Dirac Hamiltonian
\[76\],

$ H^xi = ℏ v_(upright(F)) (xi k_x sigma_x + k_y sigma_y) + m sigma_z \, $ <DiracFree>


where
$xi = plus.minus 1

$ is the valley degrees of freedom. It describes the
low-energy theory of grephene. It is expressed as
$H^xi = upright(bold(h)) dot.op upright(bold(sigma))$ with
$ upright(bold(n)) (upright(bold(k))) = 1 / sqrt((ℏ v_(upright("F")) k)^2 + m^2) (xi ℏ v_(upright(F)) k_x \, ℏ v_(upright(F)) k_y \, m) $

in
the polar coordinate $upright(bold(k)) = \( k \, phi.alt \)$.

The quantum metrices are calculated
as

$ g_plus.minus^(x x) (upright(bold(k))) = minus.plus & frac((ℏ v_(upright("F")))^2 ((ℏ v_(upright("F")) k_y)^2 + m^2), ((ℏ v_(upright("F")) k)^2 + m^2)^2) \,\
g_plus.minus^(y y) (upright(bold(k))) = minus.plus & frac((ℏ v_(upright("F")))^2 ((ℏ v_(upright("F")) k_x)^2 + m^2), ((ℏ v_(upright("F")) k)^2 + m^2)^2) \,\
g_plus.minus^(x y) (upright(bold(k))) = & plus.minus frac((ℏ v_(upright("F")))^2 (ℏ v_(upright("F")) k_x) (ℏ v_(upright("F")) k_y), ((ℏ v_(upright("F")) k)^2 + m^2)^2) \, $

while
the Berry curvature is calculated
as

$ Omega_plus.minus^(x y) (upright(bold(k))) = plus.minus xi frac(m (ℏ v_(upright("F")))^2, ((ℏ v_(upright("F")) k)^2 + m^2)^(3 \/ 2)) . $



When the chemical potential is within the gap $mu < lr(|m|)$, we may
calculate the Chern number explicitly
as

$ cal(C)^xi = & frac(1, 2 pi) integral_0^oo 2 pi k d k Omega_plus.minus^(x y) (upright(bold(k)))\
= & - xi / 2 frac(m, \| m \|^3) integral_0^oo d upright(bold(k)) frac(\( ℏ v_(upright("F")) \)^2, 2 ((ℏ v_(upright("F")) \/ m)^2 k^2 + 1)^(3 \/ 2))\
= & - xi / 4 frac(m, \| m \|) integral_0^oo d x 1 / (x + 1)^(3 \/ 2)\
= & - xi / 4 frac(m, \| m \|) integral_1^oo d y thin y^(- 3 / 2)\
= & xi / 2 frac(m, \| m \|) y^(- 1 / 2)\|_1^oo = - xi / 2 upright("sgn") \( m \) . $ <ChernValley>



#figure([#box(image("DiracConduc.svg", width: 48.0%))

  ],
  caption: [
    \(a) The energy spectrum of the massive Dirac fermion with the mass
    $m$. (b) Hall conductance as a function of the chemical potential
    for the massive Dirac Hamiltonian. (c) The temperature dependence of
    the Hall conductance at the Fermi energy $mu = 0$.
  ]
)
<FigHall>

When the chemical potential is among the gap, $lr(|mu|) < lr(|m|)$, the
Chern number is already calculated as in (@ChernValley). When the
chemical potential is below or above the gap, $lr(|mu|) > lr(|m|)$, the
integration is taken in the region for $k > k_(upright("F"))

$ with
$ k_(upright("F")) = frac(1, ℏ v_(upright("F"))) sqrt(mu^2 - m^2) \, $

which
is the solution of $epsilon (upright(bold(k))) = mu$. The Hall
conductivity is calculated
as

$ frac(cal(sigma)_(x y)^xi, e^2 \/ h) = & frac(1, 2 pi) integral_(k_(upright("F")))^oo 2 pi k d k Omega^xi (upright(bold(k)))\
= & - xi / 2 frac(m, \| m \|^3) integral_(k_(upright("F"))^2)^oo d^2 k frac(\( ℏ v_(upright("F")) \)^2, 2 ((ℏ v_(upright("F")) \/ m)^2 k^2 + 1)^(3 \/ 2))\
= & - xi / 2 frac(m, \| m \|) integral_(mu^2 \/ m^2 - 1)^oo d x frac(1, 2 (x + 1)^(3 \/ 2))\
= & - xi / 4 frac(m, \| m \|) integral_(mu^2 \/ m^2)^oo d y thin y^(- 3 / 2)\
= & xi / 2 frac(m, \| m \|) y^(- 1 / 2)\|_(mu^2 \/ m^2)^oo = - xi / 2 frac(\| m \|, lr(|mu|)) upright("sgn") \( m \) . $

The
TKNN formula dictates that the Hall conductance is proportional to the
Chern number. The Hall conductance is given by
$sigma_(x y) = sum_xi sigma_(x y)^xi

$ with$ sigma_(x y)^xi = {- xi / 2 e^2 / h upright("sgn") \( m \) & upright("for") & lr(|mu|) < lr(|m|)\
 &  & \
- xi / 2 frac(\| m \|, lr(|mu|)) e^2 / h upright("sgn") \( m \) & upright("for") & lr(|mu|) > lr(|m|) $ <HallCon>


as
a function of the chemical potential. It is quantized between the bulk
band gap, $\| mu \| < \| m \|$, which is known as the quantum anomalous
Hall effect. On the other hand, the Hall conductance is
anti-proportional to the chemical potential outside the band gap,
$\| mu \| > \| m \|$. Eq.(@HallCon) is shown in Fig.@FigHall.

We
have

$ upright("Tr") g_n^(mu nu) (upright(bold(k))) = (ℏ v_(upright("F")))^2 frac(2 m^2 + (ℏ v_(upright("F")) k)^2, 2 ((ℏ v_(upright("F")) k)^2 + m^2)^2) \, $

and

$ sqrt(det g_n^(mu nu) (upright(bold(k)))) = frac(lr(|m|) (ℏ v_(upright("F")))^2, 2 ((ℏ v_(upright("F")) k)^2 + m^2)^(3 \/ 2)) . $

Especially,
there is a
relation

$ 2 sqrt(det g_n^(mu nu) (upright(bold(k)))) = lr(|Omega_plus.minus^(x y) (upright(bold(k)))|) . $

We
can check the inequality (@Ineq) is satisfied. The quantum volume is
calcualated
as

$ integral d upright(bold(k)) sqrt(det g_n^(mu nu) (upright(bold(k)))) = 1 / 8 (frac(ℏ v_(upright("F")), m))^2 . $



A comment is in order. The Dirac system gives a half-integer of the
Chern number, which may contraditct the fact that the Chern number is an
integer. This problem is solved by the Nielsen-Ninomiya theorem, which
shows that the number of Dirac cones must be even for the system defined
for the Brillouin zone. Then, the total Chern number is always an
integer, which is relevant in realistic materials.

== Optical absorption and elliptic dichroism
<optical-absorption-and-elliptic-dichroism>
We study optical inter-band transitions from the state
$\| psi_(-) \( upright(bold(k)) \) chevron.r

$ in the valence band to the
state $

\| psi_(+) \( upright(bold(k)) \) chevron.r

$ in the conduction
band. We apply a beam of elliptical polarized light perpendicular onto
the sample, where the corresponding electromagnetic potential is given
by
$upright(bold(A)) \( t \) = \( A_x sin omega t \, A_y cos omega t \)$.
The electromagnetic potential is introduced into the Hamiltonian by way
of the minimal substitution, that is, by replacing the momentum $

k_j

$ with the covariant momentum $

P_j equiv ℏ k_j + e A_j$.

Optical absorption is given by the optical
conductivity

$ sigma (omega \; theta.alt) = & sigma_0 integral d upright(bold(k)) frac(f_(-) \( upright(bold(k)) \) - f_(+) \( upright(bold(k)) \), epsilon_(-) - epsilon_(+)) lr(|P_theta.alt \( upright(bold(k)) \)|)^2\
 & times delta [epsilon_(+) \( upright(bold(k)) \) - epsilon_(-) \( upright(bold(k)) \) - ℏ omega] \, $ <absorp>


where
we have set

$ sigma_0 equiv frac(pi e^2, (2 pi)^2) . $



We start with the optical matrix element between the initial and final
states in the photo-emission process given by \[80, 81, 82, 84, 83, 19\]


$ P_i \( upright(bold(k)) \) equiv ℏ  chevron.l psi_(+) \( upright(bold(k)) \)\| v_mu \|psi_(-) \( upright(bold(k)) \) chevron.r  \, $ <EqP>


with
the
velocity

$ v_mu = 1 / ℏ frac(partial H (upright(bold(k))), partial k_mu) . $

The
optical matrix element of the elliptic polarization is given
by

$ P_theta.alt \( upright(bold(k)) \) = P_x \( upright(bold(k)) \) cos theta.alt + i P_y \( upright(bold(k)) \) sin theta.alt \, $

where
$theta.alt

$ is the ellipticity of the injected beam, with
$0 < theta.alt < pi$ for the right polarization and
$- pi < theta.alt < 0$ for the left polarization.
$P_(pi \/ 4) \( upright(bold(k)) \)$ corresponds to the right circularly
polarized light, and $

P_(- pi \/ 4) \( upright(bold(k)) \)

$ corresponds
to the left circularly polarized light.

In the following, we assume that the temperature is absolutely zero. The
optical matrix element for the elliptic polarized light is expanded
as$  & lr(|P_theta.alt \( upright(bold(k)) \)|)^2\
= & lr(|P_x \( upright(bold(k)) \)|)^2 cos^2 theta.alt + lr(|P_y \( upright(bold(k)) \)|)^2 sin^2 theta.alt\
 & + i [P_x^(*) \( upright(bold(k)) \) P_y \( upright(bold(k)) \) - P_y^(*) \( upright(bold(k)) \) P_x \( upright(bold(k)) \)] sin theta.alt cos theta.alt . $

By
using the Hellmann-Feynman
theorem

$ &  chevron.l psi_m (upright(bold(k)))\| v_mu \|psi_n (upright(bold(k))) chevron.r \
 & = 1 / ℏ (epsilon_n (upright(bold(k))) - epsilon_m (upright(bold(k))))  chevron.l psi_m (upright(bold(k)))\| partial_(k_mu) \|psi_n (upright(bold(k))) chevron.r  quad $

for
$m eq.not n$, we
have

$ & lr(|P_mu \( upright(bold(k)) \)|)^2 / (epsilon_n (upright(bold(k))) - epsilon_m (upright(bold(k))))^2\
= & ℏ^2  chevron.l psi_(-) \( upright(bold(k)) \)\| v_mu \|psi_(+) \( upright(bold(k)) \) chevron.r   chevron.l psi_(+) \( upright(bold(k)) \)\| v_mu \|psi_(-) \( upright(bold(k)) \) chevron.r \
= & - Delta^2 (upright(bold(k)))  chevron.l partial_(k_mu) psi_(-) \( upright(bold(k)) \) \|psi_(+) \( upright(bold(k)) \) chevron.r   chevron.l psi_(+) \( upright(bold(k)) \)\| partial_(k_mu) psi_(-) \( upright(bold(k)) \) chevron.r \
= & - Delta^2 (upright(bold(k))) g_(-)^(mu mu) (upright(bold(k))) \, $

with
$mu = x \, y$,
and

$ & frac(i [P_y^(*) \( upright(bold(k)) \) P_x \( upright(bold(k)) \) - P_x^(*) \( upright(bold(k)) \) P_y \( upright(bold(k)) \)], (epsilon_n (upright(bold(k))) - epsilon_m (upright(bold(k))))^2)\
 & = i Delta^2 (upright(bold(k))) \[  chevron.l psi_(-) \( upright(bold(k)) \)\| v_y \|psi_(+) \( upright(bold(k)) \) chevron.r   chevron.l psi_(+) \( upright(bold(k)) \)\| v_x \|psi_(-) \( upright(bold(k)) \) chevron.r \
 & #h(2em) #h(2em) -  chevron.l psi_(-) \( upright(bold(k)) \)\| v_x \|psi_(+) \( upright(bold(k)) \) chevron.r   chevron.l psi_(+) \( upright(bold(k)) \)\| v_y \|psi_(-) \( upright(bold(k)) \) chevron.r  \]\
 & = i Delta^2 (upright(bold(k))) [cal(F)_(- +)^(x y) (upright(bold(k))) - cal(F)_(+ -)^(y x) (upright(bold(k)))] = Delta^2 (upright(bold(k))) Omega_(-)^(x y) (upright(bold(k))) . $

Then,
the optical conductivity is rewritten by using the components of the
quantum geometric tensor \[19\]
as

$ sigma (omega \; theta.alt) = ℏ omega sigma_0 integral d upright(bold(k)) f \( upright(bold(k)) \) G \( upright(bold(k)) \; theta.alt \) delta [epsilon_(+) \( upright(bold(k)) \) - epsilon_(-) \( upright(bold(k)) \) - ℏ omega] \, $ <OptG>


with

$ G \( upright(bold(k)) \; theta.alt \) equiv g_(-)^(x x) \( upright(bold(k)) \) cos^2 theta.alt + g_(-)^(y y) \( upright(bold(k)) \) sin^2 theta.alt + Omega_(-)^(x y) \( upright(bold(k)) \) sin theta.alt cos theta.alt . $



We study the optical absorption of the Dirac Hamiltonian (@DiracFree) at
the band edge
$ℏ omega = epsilon_(+) \( upright(bold(0)) \) - epsilon_(-) \( upright(bold(0)) \)$.
It is simply given
by

$ frac(sigma (omega \; theta.alt), ℏ omega sigma_0) = & G \( upright(bold(0)) \; theta.alt \)\
= & g_(-)^(x x) \( upright(bold(0)) \) cos^2 theta.alt + g_(-)^(y y) \( upright(bold(0)) \) sin^2 theta.alt + Omega_(-)^(x y) \( upright(bold(0)) \) sin theta.alt cos theta.alt\
= & (ℏ v_(upright("F")))^2 / m^2 (1 - xi / 2 sin 2 theta.alt) \, $

where
we have used quantum metrices


$ g_(-)^(x x) (upright(bold(0))) = g_(-)^(y y) (upright(bold(0))) = (ℏ v_(upright("F")))^2 / m^2 \, $

and
the Berry
curvature

$ Omega_(-)^(x y) (upright(bold(0))) = - xi (ℏ v_(upright("F")))^2 / m^2 . $

It
shows elliptic dichroism, where there is no absorption


$ sigma (omega \; theta.alt) = 0 $

for $theta.alt = xi pi \/ 4$. Namely,
the right or left circularly polarized right is selectively absorbed
depending on $xi$.

== Sum rule
<sum-rule>
The optical conductivity is given
by

$ sigma_(upright("D"))^(mu nu) (omega \; theta.alt) = & sigma_0 integral d upright(bold(k)) frac(f_(-) \( upright(bold(k)) \) - f_(+) \( upright(bold(k)) \), epsilon_(-) - epsilon_(+))\
 & times  chevron.l psi_(-) \( upright(bold(k)) \)\| v_mu \|psi_(+) \( upright(bold(k)) \) chevron.r   chevron.l psi_(+) \( upright(bold(k)) \)\| v_nu \|psi_(-) \( upright(bold(k)) \) chevron.r \
 & times delta [epsilon_(+) \( upright(bold(k)) \) - epsilon_(-) \( upright(bold(k)) \) - ℏ omega] . $

By
using the Hellmann-Feynman theorem, it is rewritten
as

$ sigma_(upright("D"))^(mu nu) (omega \; theta.alt) = & omega sigma_0 integral d upright(bold(k)) f_(- +) \( upright(bold(k)) \) a_(- +)^mu (upright(bold(k))) a_(+ -)^nu (upright(bold(k)))\
 & times delta [epsilon_(+) \( upright(bold(k)) \) - epsilon_(-) \( upright(bold(k)) \) - ℏ omega] \, $

where
$f_(- +) \( upright(bold(k)) \) equiv f_(-) \( upright(bold(k)) \) - f_(+) \( upright(bold(k)) \)$.
With the use of Eq.(@Faa), the optical conductivity is related to the
quantum geometric
tensor,

$ sigma_(upright("D"))^(mu nu) (omega \; theta.alt) = & omega / ℏ sigma_0 integral d upright(bold(k)) f_(- +) \( upright(bold(k)) \) cal(F)_(-)^(mu nu)\
 & times delta [epsilon_(+) \( upright(bold(k)) \) - epsilon_(-) \( upright(bold(k)) \) - ℏ omega] . $

Then,
we arrive at a relation between the quantum geometric tensor and the
conductivity \[10,
12\]

$ integral_0^oo frac(d omega, omega) sigma_(upright("D"))^(mu nu) (omega) = frac(pi e^2, ℏ (2 pi)^2) integral cal(F)_(-)^(mu nu) d upright(bold(k)) \, $ <FlucD>


where
$sigma_(upright("D"))^(mu nu) (omega)

$ denotes the dissipative
(absorptive) component of the optical conductivity.

The real part reads
\[10\]$ integral_0^oo frac(d omega, omega) upright("Re") sigma_(upright("D"))^(mu nu) (omega) = frac(pi e^2, ℏ (2 pi)^2) integral g_(-)^(mu nu) d upright(bold(k)) . $

The
imaginary part is related to the Chern
number,

$ integral_0^oo frac(d omega, omega) upright("Im") sigma_(upright("D"))^(mu nu) (omega) = frac(pi e^2, ℏ (2 pi)^2) integral Omega_(-)^(x y) / 2 d upright(bold(k)) = frac(e^2, 2 ℏ) cal(C)_(-) \, $

where
we have used the TKNN
formula

$ sigma_(upright("D"))^(x y) (0) equiv sigma_(x y) = e^2 / h cal(C)_(-) \, $

and
the Kramers-Kronig relation. This relates the real and imaginary parts
of the optical Hall
conductivity

$ integral_0^oo frac(d omega, omega) upright("Im") sigma_(upright("D"))^(mu nu) (omega) = pi / 2 sigma_(x y) (0) . $



== Bulk photovoltaic effects
<bulk-photovoltaic-effects>
Photovoltaic currents are generated under photo-irradiation, which will
be useful for solar cell technologies. A $p$-$n

$ junction presents a
conventional way to generate photocurrent. On the other hand, the bulk
photovoltaic photocurrent generation~presents another way without using
a junction \[85, 86, 87, 88, 89\]. The injection current \[88, 93, 90,
87, 6, 9, 33, 91, 92\] and the shift current \[94, 95, 87, 86, 88, 90,
6, 96, 97, 98, 9, 33, 91, 99, 92\] are prominent, which are second order
bulk photovoltaic currents.

The current density $

J^mu

$ along the $

mu

$ direction induced by the
applied electric field $

E_x

$ along the $

x

$ direction is expanded in a
power series of $

E_x

$ as$ J^mu = sum_(ell = 1)^oo sigma^(mu \; x^ell) E_x^ell equiv sum_(ell = 1)^oo J^(mu \; x^ell) \, $

where
$mu = x \, y \, z$. We refer to
$J^(mu \; x^ell) equiv sigma^(mu \; x^ell) E_x^ell

$ as the $

ell$-th
order current, where $sigma^(mu \; x^ell)

$ is the $

ell$-th order
conductivity. If there is inversion symmetry in the system, the even
order conductivities with even $ell

$ are prohibited,
because$ J^mu mapsto - J^mu \, #h(2em) E_x mapsto - E_x $ <Inversion>


under
inversion symmetry.

The second order response has a
form

$ J^(mu \; x^2) (omega_1 + omega_2) = sigma^(mu \; x^2) (omega_1 + omega_2 \; omega_1 \, omega_2) E_x (omega_1) E_x (omega_2) . $

We
investigate the direct current generation,


$ J^(mu \; x^2) (0) = sigma^(mu \; x^2) (0 \; omega \, - omega) E_x (omega) E_x (- omega) . $

In
the following, we use the abbreviation
$J^(mu \; x^2) equiv J^(mu \; x^2) (0)

$ and
$sigma^(mu \; x^2) (omega) equiv sigma^(mu \; x^2) (0 \; omega \, - omega)$.

The conductivity of the injection current is in general given by the
formula \[88, 93, 90, 87, 6, 9, 33, 91,
92\]$ sigma_(upright("inject"))^(mu \; x^2) = - tau frac(2 pi e^3, ℏ^2) sum_(n \, m) integral d upright(bold(k)) f_(n m) Delta_(m n)^mu a_(n m)^x a_(m n)^x delta (omega_(m n) - omega) \, $ <Inject>


where
$tau

$ is the relaxation time, $

f_(n m) = f_n - f_m

$ with the Fermi
distribution function $

f_n

$ for the band $

n$, $a_(n m)^x

$ is the
Wilczek-Zee connection,
$omega_(n m) equiv (epsilon_n - epsilon_m) \/ ℏ$,
and$ Delta_(m n)^mu = v_m^mu - v_n^mu $

is the difference of the
velocities defined by

$ v_m^mu = 1 / ℏ  chevron.l m\| partial_(k_mu) H \|m chevron.r $

with
the Hamiltonian $H$. The injection current is induced when the
velocities are different ($Delta_(m n)^mu eq.not 0$) between the
conduction band $n

$ and the valence band#emph[~]$m$ along the $

mu

$ direction. The derivation is shown in Appendix @ApInject.

The shift current is in general given by the formula \[94, 95, 87, 88,
90, 6, 96, 97, 98, 9, 33, 91, 99,
92\]$ sigma_(upright("shift"))^(mu \; x^2) = - frac(pi e^3, ℏ^2) sum_(n \, m) integral d upright(bold(k)) f_(n m) R_(m n)^(mu \, x) a_(n m)^x a_(m n)^x delta (omega_(m n) - omega) \, $ <Shift>


where


$ R_(m n)^(mu \, x) = a_(m m)^x - a_(n n)^x + i partial_(k_mu) log a_(m n)^x $ <shift>


is
the shift vector \[88\]. The shift vector is gauge invariant although
the Wilczek-Zee connection is not gauge invariant. The shift vector
describes the difference of the mean position of the Wannier function
between two bands $m

$ and $

n$. The integrand in Eq.(@shift) is rewritten
as

$ R_(m n)^(mu \, x) a_(n m)^x a_(m n)^x = i a_(m n)^x a_(n m \, mu)^x \, $

where
we have defined the covariant
derivative,

$ nabla_(k_mu) a_(n m)^x equiv a_(n m \, mu)^x equiv frac(partial a_(n m)^x, partial k_mu) - i a_(n m)^x (a_(n n)^x - a_(m m)^x) . $

The
shift current is induced when the mean positions are different
($R_(m n)^(mu \, x) eq.not 0$) between the conduction band $n

$ and the
valence band $

m$. The derivation is shown in Appendix @ApShift.

In the following, we concentrate on the longitudinal conductivities by
setting $mu = x$.

The injection current is rewritten in terms of the quantum metric \[6,
9, 34\]
as

$ sigma_(upright("inject"))^(x \; x^2) = - tau frac(2 pi e^3, ℏ^2) integral d upright(bold(k)) f_(- +) Delta_(+ -)^x g_(-)^(x x) delta (omega_(+ -) - omega) . $

while
the shift current is rewritten in terms of the quantum metric \[33, 34\]
as

$ sigma_(upright("shift"))^(x \; x^2) = - frac(pi e^3, ℏ^2 V) integral d upright(bold(k)) f_(- +) R_(+ -)^(x \, x) g_(-)^(x x) delta (omega_(+ -) - omega) . $ <Rgxx>



== Nonlinear conductivity
<nonlinear-conductivity>
The second-order nonlinear conductivity $sigma^(mu nu \; rho)

$ is
expanded in terms of the electron relaxation time $

tau

$ as \[27\]

$ sigma^(mu nu \; rho) = sigma_(upright("NLDrude"))^(mu nu \; rho) + sigma_(upright("Dipole"))^(mu nu \; rho) + sigma_(upright("Metric"))^(mu nu \; rho) \, $

where

$ sigma_(upright("Metric"))^(mu nu \; rho) prop tau^0 \, quad sigma_(upright("Dipole"))^(mu nu \; rho) prop tau \, quad sigma_(upright("NLDrude"))^(mu nu \; rho) prop tau^2 . $



First, $sigma_(upright("NLDrude"))^(mu nu \; rho)

$ is the nonlinear
Drude conductivity \[100,
101\],$ sigma_(upright("NLDrude"))^(mu nu \; rho) = - frac(e^3 tau^2, ℏ^3) sum_n integral d upright(bold(k)) f_n frac(partial^3 epsilon_n, partial k_mu partial k_nu partial k_rho) . $ <NLDrude>


It
is also an extrinsic nonlinear conductivity.

Second, $sigma_(upright("Dipole"))^(mu nu \; rho)

$ is the nonlinear
transverse conductivity induced by the Berry curvature dipole (BCD)
\[20\],$ sigma_(upright("Dipole"))^(mu nu \; rho) = - frac(e^3 tau, ℏ^2) sum_n integral d upright(bold(k)) f_n (frac(partial Omega_n^(nu rho), partial k_mu) + frac(partial Omega_n^(mu rho), partial k_nu)) . $

It
is an extrinsic nonlinear conductivity, since it vanishes as
$tau arrow.r 0$.

Third, only the term $sigma_(upright("Metric"))^(mu nu \; rho)

$ survives
in the dirty limit $

tau arrow.r 0$, which is the intrinsic nonlinear
conductivity. It is the quantum-metric induced nonlinear conductivity.
There are still debates \[102, 103\] on the coefficients of the
quantum-metric induced nonlinear conductivity.

\(i) The Luttinger-Kohn approach \[27\] gives


$ & sigma_(upright("Metric"))^(mu nu \; rho)\
 & = - e^3 / ℏ sum_n integral d upright(bold(k)) f_n (2 frac(partial G_n^(mu nu), partial k_rho) - 1 / 2 (frac(partial G_n^(nu rho), partial k_mu) + frac(partial G_n^(mu rho), partial k_nu))) \, $ <Metric>


where
$G_n^(a b)

$ is the band--energy normalized quantum metric or the Berry
connection polarizability. It is given as \[105, 104, 22, 24, 27,
106\]$ G_n^(mu nu) = 2 upright("Re") sum_(m eq.not n) frac(a_(n m)^mu (upright(bold(k))) a_(m n)^nu (upright(bold(k))), epsilon_n (upright(bold(k))) - epsilon_m (upright(bold(k)))) . $ <BMetric>



\(ii) The wave packet dynamics approach \[105\]
gives

$ & sigma_(upright("Metric"))^(mu nu \; rho)\
 & = - e^3 / ℏ sum_n integral d upright(bold(k)) f_n (frac(partial G_n^(mu nu), partial k_rho) - 1 / 2 (frac(partial G_n^(nu rho), partial k_mu) + frac(partial G_n^(mu rho), partial k_nu))) . $



\(iii) The quantum kinetics approach \[24\] gives


$ & sigma_(upright("Metric"))^(mu nu \; rho)\
 & = - e^3 / ℏ sum_n integral d upright(bold(k)) f_n (1 / 2 frac(partial G_n^(mu nu), partial k_rho) - (frac(partial G_n^(nu rho), partial k_mu) + frac(partial G_n^(mu rho), partial k_nu))) . $



\(iv) The intrinsic Ohmic conductivity \[107\]
gives

$ & sigma_(upright("Metric"))^(mu nu \; rho)\
 & = e^3 / ℏ sum_n integral d upright(bold(k)) f_n (frac(partial G_n^(mu nu), partial k_rho) + frac(partial G_n^(nu rho), partial k_mu) + frac(partial G_n^(mu rho), partial k_nu)) . $



= Zeeman Quantum geometry for momentum and spin
<SecZeeman>
The Zeeman quantum geometric tensor $g_(n m)^(mu nu)

$ is defined by the
quantum distance $

d s_(upright("HS"))

$ for the infinitesimal translation
$d upright(bold(k))$ of the momentum as \[108, 109, 110, 111\]
$ d s_(upright("HS")) (upright(bold(k))) equiv sqrt(1 - lr(| chevron.l psi_n (upright(bold(k)))\| U_(d upright(bold(theta))) U_(d upright(bold(k))) \|psi_n (upright(bold(k))) chevron.r |)^2) \, $

where


$ U_(d upright(bold(theta))) equiv e^(- i / 2 d upright(bold(theta)) dot.op upright(bold(sigma))) \, quad U_(d upright(bold(k))) equiv e^(- i d upright(bold(k)) dot.op upright(bold(r))) $ <Udt>


are
the generators of the spin angular momentum $d upright(bold(theta))

$ and
the momentum $

d upright(bold(k))$. The Zeeman quantum geometric tensor
$z_(n m)^(mu nu)

$ and the spin quantum geometric tensor
$s_(n m)^(mu nu)$ are given
by$ (d s_(upright("HS")))^2 = & sum_(mu nu) sum_(n eq.not m) \( cal(F)_(n m)^(mu nu) d k_mu d k_nu + s_(n m)^(mu nu) / 4 d theta_mu d theta_nu\
 & + frac(z_(n m)^(mu nu) + z_(m n)^(mu nu), 2) d k_mu d theta_nu \) \, $ <dsZ>


where


$ cal(F)_(n m)^(mu nu) equiv a_(n m)^mu a_(m n)^nu $

is the quantum
geometric tensor,

$ s_(n m)^(mu nu) equiv s_(n m)^mu s_(m n)^nu $ <SGT>


is
the spin quantum geometric tensor,
and

$ z_(n m)^(mu nu) equiv a_(n m)^mu s_(m n)^nu $ <Zz12>


is the Zeeman
quantum geometric tensor, where we have defined the expectation value of
the spin
operator,

$ s_(n m)^mu equiv  chevron.l psi_n (upright(bold(k)))\| sigma_mu \|psi_n (upright(bold(k))) chevron.r  . $

The
derivation from Eq.(@dsZ)Eq.(@Zz12) is shown in Appendix @ApZQ.

As in the case of the quantum metric and the Berry curvature, the Zeeman
quantum metric $cal(Q)_(n m)^(mu nu)

$ is defined by the real part of the
Zeeman quantum geometric
tensor,$ cal(Q)_(n m)^(mu nu) equiv upright("Re") z_(n m)^(mu nu) = (a_(n m)^mu s_(m n)^nu + a_(m n)^mu s_(n m)^nu) \/ 2 \, $ <Qab>


and
the Zeeman Berry curvature $cal(Z)_(n m)^(mu nu)

$ by the imaginary part
of the Zeeman quantum geometric tensor,
$ cal(Z)_(n m)^(mu nu) equiv 2 upright("Im") z_(n m)^(mu nu) = i (a_(n m)^mu s_(m n)^nu - a_(m n)^mu s_(n m)^nu) . $ <Zab>


We
also define the spin quantum metric $cal(S)_(n m)^(mu nu)

$ by the real
part of the spin quantum geometric
tensor,$ cal(S)_(n m)^(mu nu) equiv upright("Re") s_(n m)^(mu nu) equiv (s_(n m)^mu s_(m n)^nu + s_(m n)^mu s_(n m)^nu) \/ 2 \, $ <SQGT>


and
the spin Berry curvature $cal(A)_(n m)^(mu nu)

$ by$ cal(A)_(n m)^(mu nu) equiv 2 upright("Im") s_(n m)^(mu nu) equiv i (s_(n m)^mu s_(m n)^nu - s_(m n)^mu s_(n m)^nu) . $ <SBerry>



== Responses originated from the Zeeman geometry
<responses-originated-from-the-zeeman-geometry>
In the linear response theory, we obtain the response of the current
$J^(mu \; nu)

$ or the spin polarization $

S^(mu \; nu)

$ by applying
electric field $

E^nu

$ or magnetic field $

B^nu$.

We apply alternating electric field $E^nu (t)$~and alternating magnetic
field $B^nu (t)$,


$ E^nu (t) = & 1 / 2 E^nu sum_(omega_1 = plus.minus omega) e^(- i omega_1 t) \,\
B^nu (t) = & 1 / 2 B^nu sum_(omega_1 = plus.minus omega) e^(- i omega_1 t) . $

The
Hamiltonian for the external fields is given
by

$ H_1 = E^nu (t) a^nu - g mu_(upright("B")) B^nu (t) sigma^nu . $

We
solve the quantum Liouville
equation

$ i frac(partial rho, partial t) = [H' \, rho] $

with
$H' = H + H_1$, where $H

$ is the non-perturbated Hamiltonian.

The first-order solution of the density matrix is given by
\[109\]$ rho_(m n)^(mu nu) = & 1 / 2 sum_(omega_1 = plus.minus omega) [i delta_(m n) partial_(k_mu) f_m + f_(n m) a_(m n)^mu] frac(E^nu e^(- i omega_1 t), ℏ omega_1 - epsilon_(m n) + i eta)\
 & - frac(g mu_(upright("B")), 2) sum_(omega_1 = plus.minus omega) frac(f_(n m) s_(m n)^mu B^nu e^(- i omega_1 t), ℏ omega_1 - epsilon_(m n) + i eta) \, $ <Rho1>


where
$f_(n m) equiv f_n - f_m

$ and
$epsilon_(m n) equiv epsilon_m - epsilon_n$.

In the linear response theory, the current $

J^(mu \; nu)

$ is given
by$ J^(mu \; nu) = sum_(n m) integral d upright(bold(k)) v_(n m)^mu rho_(m n)^(mu nu) \, $ <Jab>


where
$v_(n m)^mu$~is the velocity operator. By using the Hellmann--Feynman
theorem, it is rewritten
as

$ v_(n m)^mu = i epsilon_(n m) a_(n m)^mu . $

On the other hand, the
spin $S^(mu \; nu)

$ polarization is given by
$ S^(mu \; nu) = sum_(n m) integral d upright(bold(k)) s_(n m)^mu rho_(m n)^(mu nu) . $ <Sab>



There are four types of responses, $J^(mu \; nu) \/ E^nu$,
$J^(mu \; nu) \/ B^nu$, $S^(mu \; nu) \/ E^nu

$ and
$S^(mu \; nu) \/ B^nu$, where $

J^(mu \; nu) \/ E^nu

$ and
$S^(mu \; nu) \/ B^nu$ are direct responses, while
$J^(mu \; nu) \/ B^nu$ and $

S^(mu \; nu) \/ E^nu

$ are cross responses.

\(i) The current $

J^(mu \; nu)

$ is induced by electric field $

E^nu

$ as
\[108\]$  & J^(mu \; nu) / E^nu\
= & integral d upright(bold(k)) sum_(n > m) f_(n m) [Omega_(n m)^(mu nu) cos omega t + 2 g_(n m)^(mu nu) frac(omega sin omega t, epsilon_(m n))] . $ <JE>


The
first term represents the Hall current gerated by the Berry curvature
$Omega_(n m)^(mu nu)$. The quantum metric $g_(n m)^(mu nu)

$ in the
second term~appears as an oscillating response \[112\].

\(ii) The current $

J^(mu \; nu)

$ is induced by magnetic field $

B^nu

$ as
\[109\]

$  & J^(mu \; nu) / B^nu\
= & g mu_(upright("B")) integral d upright(bold(k)) sum_(n > m) f_(n m) [cal(Z)_(n m)^(mu nu) cos omega t + 2 cal(Q)_(n m)^(mu nu) frac(omega sin omega t, epsilon_(m n))] . $ <JB>


The
Zeeman quantum geometric tensor $cal(Z)_(n m)^(mu nu)$~contributes to
the cross response between the magnetic field $B^nu

$ and the current
$J^(mu \; nu)$, where $

J^(mu \; nu)

$ is called the intrinsic gyrotropic
magnetic current $

J^(mu \; nu)$. The Zeeman quantum metric
$cal(Q)_(n m)^(mu nu)

$ in the second term~appears as an oscillating
response.

\(iii) Spin polarization $

S^(mu \; nu)

$ is induced by electric field
$E^nu$ as \[108\]

$  & S^(mu \; nu) / E^nu\
= & - integral d upright(bold(k)) sum_(n > m) f_(n m) [frac(2 cal(Q)_(n m)^(mu nu), epsilon_(m n)) cos omega t + cal(Z)_(n m)^(mu nu) frac(omega sin omega t, epsilon_(m n)^2)] . $ <SE>


The
Zeeman quantum metric $cal(Q)_(n m)^(mu nu)$~contributes to the cross
response between the electric field $E^nu

$ and the spin polarization
$S^(mu \; nu)$. The Zeeman quantumgeometric tensor
$cal(Z)_(n m)^(mu nu)$ in the second term~appears as an oscillating
response.

\(iv) Spin polarization $

S^(mu \; nu)

$ is also induced by magnetic field
$B^nu$ as

$  & S^(mu \; nu) / B^nu\
= & g mu_(upright("B")) integral d upright(bold(k)) sum_(n > m) f_(n m) [cal(S)_(n m)^(mu nu) / epsilon_(m n) cos omega t + 2 cal(A)_(n m)^(mu nu) frac(omega sin omega t, epsilon_(m n)^2)] . $ <SB>


It
is interesting that there may be off-diagonal response if
$cal(S)_(n m)^(mu nu)

$ or $

cal(A)_(n m)^(mu nu)

$ has off-diagonal
components. Detailed derivations of Eqs.(@JE), (@JB), (@SE) and (@SB)
are given in Appendix @ApCrossRes.

We may call the first terms in Eqs.(@JE), (@JB), (@SE) and (@SB) the
static terms and the second terms the dynamic terms, because the second
terms vanish for $

omega = 0$.

== Zeeman Quantum Geometry for two-band systems
<zeeman-quantum-geometry-for-two-band-systems>
We consider the two-band system (@Hamil2) with the index
$n = plus.minus$. The simple relations for the Zeeman quantum metric are
derived
as

$ cal(Z)_(+ -)^(mu nu) = - cal(Z)_(- +)^(mu nu) = frac(partial n_nu, partial k_mu) . $ <Z>


Two
or three components of $upright(bold(n))$~should be nonzero for nonzero
$cal(Z)_(+ -)^(mu nu)$. In general, we have
$cal(Z)_(+ -)^(mu nu) eq.not cal(Z)_(+ -)^(nu mu)$.

The Zeeman Berry curvature is derived
as

$ cal(Q)_(+ -)^(mu nu) = 1 / 2 sum_(rho sigma) epsilon_(nu rho sigma) n_rho frac(partial n_sigma, partial k_mu) \, $ <Q>


Two
or three components of $upright(bold(n))$~should be nonzero for nonzero
$cal(Q)_(+ -)^(mu nu)$.

The spin quantum metric
is

$ cal(S)_(+ -)^(mu nu) = delta_(mu nu) - n_mu n_nu \, $ <S>


while the
spin Berry curvature
is

$ cal(A)_(+ -)^(mu nu) = - 2 sum_rho epsilon_(mu nu rho) n_rho . $ <A>


They
are defined even when only a single component of $upright(bold(n))

$ is
nonzero.

== Rashba system
<rashba-system>
As an exmple of the two-band system, we consider the Rashba system
described
by$ H (upright(bold(k))) = frac(ℏ^2 upright(bold(k))^2, 2 m) + lambda (upright(bold(k)) times upright(bold(sigma)))_z + B sigma_z \, $

where
$lambda

$ is the strength of the Rashba interaction and $

B

$ is static
magnetic field applied perpendicularly to the plane.

The energy is given
by$ E_chi = frac(ℏ^2 k^2, 2 m) + chi sqrt(lambda^2 k^2 + B^2) $

for the
lower band with $chi = - 1

$ and for the upper band with $

chi = 1$. The
Fermi surface is given
by

$ k_eta^chi = sqrt(m) sqrt(mu + m lambda^2 + eta sqrt(m^2 lambda^4 + 2 mu m lambda^2 + B^2)) \, $

where
$eta = - 1

$ describes the inner Fermi surface and $

eta = 1

$ describes
the outer Fermi surface.

The Berry curvature is given
by$ Omega^(x y) = - frac(B lambda^2, 2 (lambda^2 k^2 + B^2)^(3 \/ 2)) \, $

while
the quantum metrices are given
by

$ g_(+ -)^(x x) = & frac(lambda^2 (lambda^2 k_y^2 + B^2), 2 (lambda^2 k^2 + B^2)^2) \,\
g_(+ -)^(x y) = & g_(+ -)^(y x) = frac(- lambda^4 k_x k_y, 2 (lambda^2 k^2 + B^2)^2) \,\
g_(+ -)^(y y) = & frac(lambda^2 (lambda^2 k_x^2 + B^2), 2 (lambda^2 k^2 + B^2)^2) . $

There
is no contribution from the quantum metric $g_(+ -)^(x y)

$ in the Hall
current (@JE) because $

g_(+ -)^(x y) prop sin 2 phi.alt

$ leads to
$integral g_(+ -)^(x y) d phi.alt = 0$.

The Zeeman Berry curvatures are calculated
as$ cal(Z)_(+ -)^(x x) = & frac(partial n_x, partial k_x) = frac(lambda^3 k_x k_y, (lambda^2 k^2 + B^2)^(3 \/ 2)) \,\
cal(Z)_(+ -)^(x y) = & frac(partial n_y, partial k_x) = frac(lambda (lambda^2 k_y^2 + B^2), (lambda^2 k^2 + B^2)^(3 \/ 2)) \,\
cal(Z)_(+ -)^(y x) = & frac(partial n_x, partial k_y) = - frac(lambda (lambda^2 k_x^2 + B^2), (lambda^2 k^2 + B^2)^(3 \/ 2)) \,\
cal(Z)_(+ -)^(x z) = & frac(partial n_z, partial k_x) = - frac(lambda^2 B k_x, (lambda^2 k^2 + B^2)^(3 \/ 2)) \,\
cal(Z)_(+ -)^(y z) = & frac(partial n_z, partial k_y) = - frac(lambda^2 B k_y, (lambda^2 k^2 + B^2)^(3 \/ 2)) . $

Only
the Zeeman Berry curvature $cal(Z)_(+ -)^(x y)

$ contributes to a nonzero
response because we
have$ integral cal(Z)_(+ -)^(x x) d phi.alt = integral cal(Z)_(+ -)^(x z) d phi.alt = integral cal(Z)_(+ -)^(y z) d phi.alt = 0 . $

We
note that $cal(Z)_(+ -)^(x x)

$ and $

cal(Z)_(+ -)^(x y)

$ are singular at
$k = 0$, while $

cal(Z)_(+ -)^(x z)

$ and $

cal(Z)_(+ -)^(y z)

$ are zero
for $

B = 0$.

The static intrinsic gyrotropic magnetic current at zero temperature is
calculated
as

$ J^(x \; y) / B^y = & g mu_(upright("B")) integral d upright(bold(k)) sum_(n > m) f_(n m) cal(Z)_(n m)^(x y)\
= & g mu_(upright("B")) integral_(k_(-)^chi)^(k_(+)^chi) k d k d phi.alt frac(lambda (lambda^2 k_y^2 + B^2), (lambda^2 k^2 + B^2)^(3 \/ 2))\
= & g mu_(upright("B")) sum_(eta = plus.minus 1) pi lambda (k_eta^chi)^2 / sqrt(lambda^2 (k_eta^chi)^2 + B^2) . $

The
electric-filed induced spin polarization at zero temperature is
calculated
as

$ S^(mu \; nu) / E^nu = & - integral d upright(bold(k)) f_(+ -) cal(Z)_(+ -)^(nu mu) omega / epsilon_(+ -)^2 sin (omega t)\
= & sum_(eta = plus.minus 1) eta pi frac(lambda (k_eta^chi)^2 + 4 B^2, (lambda^2 (k_eta^chi)^2 + B^2)^(3 \/ 2)) omega sin (omega t) . $



The Zeeman quantum metrices are calculated
as

$ cal(Q)_(+ -)^(x x) = & cal(Q)_(+ -)^(y y) - frac(B lambda, 2 (lambda^2 k^2 + B^2)) \,\
cal(Q)_(+ -)^(x y) = & cal(Q)_(+ -)^(y x) = 0 \,\
cal(Q)_(+ -)^(x z) = & - frac(lambda^2 k_y, 2 (lambda^2 k^2 + B^2)) . $

Only
the Zeeman quantum metric $cal(Q)_(+ -)^(x x)

$ contributes to a nonzero
response because$ integral cal(Q)_(+ -)^(x z) d phi.alt = 0 . $

The
static spin polarization is induced by electric field as



$ S^(x \; x) / E^x = & - integral d upright(bold(k)) f_(+ -) frac(2 cal(Q)_(+ -)^(x x), epsilon_(+ -))\
= & - sum_(eta = plus.minus 1) frac(eta pi B, lambda sqrt(lambda^2 (k_eta^chi)^2 + B^2)) . $

The
dynamic intrinsic gyrotropic magnetic current is obtained as



$ J^(x \; x) / B^x = & g mu_(upright("B")) integral d upright(bold(k)) sum_(n > m) f_(n m) 2 cal(Q)_(n m)^(x x) omega / epsilon_(m n) sin omega t\
= & g mu_(upright("B")) sum_(eta = plus.minus 1) frac(eta 2 pi B, lambda sqrt(lambda^2 (k_eta^chi)^2 + B^2)) omega sin omega t . $



The spin Berry curvatures are calculated
as

$ cal(A)_(+ -)^(x y) = & - 2 n_z = - frac(2 B, sqrt(lambda^2 k^2 + B^2)) \,\
cal(A)_(+ -)^(y z) = & - 2 n_x = frac(2 lambda k_y, sqrt(lambda^2 k^2 + B^2)) \,\
cal(A)_(+ -)^(z x) = & - 2 n_y = - frac(2 lambda k_x, sqrt(lambda^2 k^2 + B^2)) \, $

among
which there is only nonzero contribution from $cal(A)_(+ -)^(x y)

$ because$ integral d phi.alt cal(A)_(+ -)^(y z) = integral d phi.alt cal(A)_(+ -)^(z x) = 0 . $



Spin polarization is also induced by magnetic field as



$ S^(x \; y) / B^y = & g mu_(upright("B")) integral d upright(bold(k)) f_(+ -) 2 cal(A)_(+ -)^(x y) omega / epsilon_(+ -)^2 sin omega t\
= & g mu_(upright("B")) sum_(eta = plus.minus 1) frac(eta 4 pi B, lambda^2 sqrt(lambda^2 (k_eta^chi)^2 + B^2)) . $



The diagonal spin quantum metrices are calculated
as

$ cal(S)_(+ -)^(x x) = & frac(lambda^2 k_x^2 + B^2, lambda^2 k^2 + B^2) \,\
cal(S)_(+ -)^(y y) = & frac(lambda^2 k_y^2 + B^2, lambda^2 k^2 + B^2) \,\
cal(S)_(+ -)^(z z) = & frac(lambda^2 k^2, lambda^2 k^2 + B^2) \, $ <RSxx>


all
of which contribute to nonzero responses.

The off-diagonal spin quantum metrices are calculates
as

$ cal(S)_(+ -)^(x y) = & frac(2 lambda^2 k_x k_y, lambda^2 k^2 + B^2) \,\
cal(S)_(+ -)^(y z) = & - frac(2 B lambda k_x, lambda^2 k^2 + B^2) \,\
cal(S)_(+ -)^(z x) = & frac(2 B lambda k_y, lambda^2 k^2 + B^2) \, $

all
of which do not contribute to the off-diagonal responses
because

$ integral cal(S)_(+ -)^(x y) d phi.alt = integral cal(S)_(+ -)^(y z) d phi.alt = integral cal(S)_(+ -)^(z x) d phi.alt = 0 . $



== Non-Abelian Zeeman quantum geometry
<SecZeemanMulti>
We generalize the Zeeman quantum geometry to the multiband systems. The
Zeeman quantum geometric tensor $g_(n m)^(mu nu)

$ is defined by the
quantum distance $

d s_(upright("HS"))

$ for the infinitesimal translation
$d upright(bold(k))$ of the momentum as
$ (d s_(upright("HS")))^2 equiv sqrt(1 - lr(| chevron.l psi (upright(bold(k)))\| U_(d upright(bold(theta))) U_(d upright(bold(k))) \|psi (upright(bold(k))) chevron.r |)^2) \, $

where
$\|psi (upright(bold(k))) chevron.r

$ is given by Eq.(@psi),
$U_(d upright(bold(theta)))$ and $

U_(d upright(bold(k)))

$ are given by
Eq.(@Udt). The Zeeman quantum geometric tensor is given
by$ (d s_(upright("HS")))^2 = & sum_(mu nu) sum_(n eq.not m) g_(n m)^(mu nu) d k_mu d k_nu + s_(n m)^(mu nu) / 4 d theta_mu d theta_nu\
 & + frac(z_(n m)^(mu nu) + z_(m n)^(mu nu), 2) d k_mu d theta_nu \, $

where


$ g_(n m)^(mu nu) equiv  chevron.l partial_(k_mu) psi_n (upright(bold(k)))\| (1 - P (upright(bold(k)))) \|partial_(k_mu) psi_m (upright(bold(k))) chevron.r $

is
the quantum
metric,

$ s_(n m)^(mu nu) equiv  chevron.l psi_n (upright(bold(k)))\| sigma_mu (1 - P (upright(bold(k)))) sigma_nu \|psi_m (upright(bold(k))) chevron.r $

is
the spin geometric tensor, and


$ z_(n m)^(mu nu) equiv  chevron.l partial_(k_mu) psi_n (upright(bold(k)))\| (1 - P (upright(bold(k)))) sigma_nu \|psi_m (upright(bold(k))) chevron.r $

is
the Zeeman geometric tensor. The derivations are shown in Appendix
@ApZQ2.

= Quantum geometry for non-Hermitian systems
<SecNH>
Quantum geometry is generalized to non-Hermitian systems \[113, 75, 115,
114, 116\], where $H^dagger eq.not H$. There are right and left
eigenfunctions and
eigenvalues,

$ H = epsilon_n^(upright("R")) \|psi_n^(upright("R")) (upright(bold(k))) chevron.r  \, quad  chevron.l psi_n^(upright("L")) (upright(bold(k)))\| H =  chevron.l psi_n^(upright("L")) (upright(bold(k)))\| epsilon_n^(upright("L")) \, $

where

$ (\|psi_n^(upright("R")) (upright(bold(k))) chevron.r )^(*) eq.not  chevron.l psi_n^(upright("L")) (upright(bold(k)))\| $

in
general. However, it is straightforward to generalize quantum geometry
to non-Hermitian case. The eigen functions are
orthonormalized,

$ chevron.l psi_n^(upright("L")) (upright(bold(k))) \|psi_n^(upright("R")) (upright(bold(k))') chevron.r  = delta (upright(bold(k)) \, upright(bold(k))') . $



If the target bands are $N$-fold degenerate, the right and left
eigenfunctions are given by



$ \|psi^(upright("R")) (upright(bold(k))) chevron.r  = & sum_(n = 1)^N c_n^(upright("R")) \|psi_n^(upright("R")) (upright(bold(k))) chevron.r  \,\
 chevron.l psi^(upright("L")) (upright(bold(k)))\| = & sum_(n = 1)^N c_n^(upright("L"))  chevron.l psi_n^(upright("L")) (upright(bold(k)))\| . $



The fidelity is defined
by

$ F (upright(bold(k)) \, upright(bold(k))') equiv sqrt( chevron.l psi^(upright("L")) (upright(bold(k))) \|psi^(upright("R")) (upright(bold(k))') chevron.r   chevron.l psi^(upright("L")) (upright(bold(k))') \|psi^(upright("R")) (upright(bold(k))) chevron.r ) . $



The Hilbert-Schmidt distance is defined
by

$ s_(upright("HS")) (upright(bold(k)) \, upright(bold(k))') equiv sqrt(1 - F (upright(bold(k)) \, upright(bold(k))')^2) . $

The
quantum distance with the infinitesimal momentum translation
$d upright(bold(k))

$ is given
by$ d s_(upright("HS")) (upright(bold(k))) equiv sqrt(1 - F (upright(bold(k \, k)) + d upright(bold(k)))^2) $

with

$ F (upright(bold(k))) = sqrt( chevron.l psi^(upright("L")) (upright(bold(k)))\| U_(d upright(bold(k))) \|psi^(upright("R")) (upright(bold(k))) chevron.r   chevron.l psi^(upright("L")) (upright(bold(k)))\| U_(d upright(bold(k)))^(- 1) \|psi^(upright("R")) (upright(bold(k))) chevron.r ) \, $


\
where $U_(d upright(bold(k)))

$ is given by Eq.(@Udk). The quantum
distance for the infinitesimal momentum is expanded in terms of the
quantum geometric tensor $

cal(F)_n^(mu nu)

$ as$ (d s_(upright("HS")))^2 = sum_(mu nu) sum_(n m) cal(F)_(n m)^(mu nu) d k_mu d k_nu \, $

The
quantum geometric tensor is


$ cal(F)_(n m)^(mu nu) (upright(bold(k))) =  chevron.l partial_(k_mu) psi_n^(upright("L")) (upright(bold(k)))\| (1 - P (upright(bold(k)))) \|partial_(k_nu) psi_m^(upright("R")) (upright(bold(k))) chevron.r $

with
the projection
operator

$ P (upright(bold(k))) equiv sum_(n = 1)^N \|psi_n^(upright("R")) (upright(bold(k))) chevron.r   chevron.l psi_n^(upright("L")) (upright(bold(k)))\| . $



The quantum metric is the real part of the quantum geometric
tensor,

$ g_(n m)^(mu nu) equiv upright("Re") cal(F)_(n m)^(mu nu) = frac(cal(F)_(m n)^(mu nu) (upright(bold(k))) + (cal(F)_(m n)^(mu nu) (upright(bold(k))))^(*), 2) \, $

while
the Berry curvature is the imaginary part of the quantum geometric
tensor,

$ Omega_(n m)^(mu nu) equiv 2 upright("Im") cal(F)_(n m)^(mu nu) = i (cal(F)_(m n)^(mu nu) (upright(bold(k))) - (cal(F)_(m n)^(mu nu) (upright(bold(k))))^(*)) . $

The
Wilczek-Zee connection is given
by

$ a_(n m)^mu (upright(bold(k))) equiv - i  chevron.l psi_n^(upright("L"))\| partial_(k_mu) \|psi_(n m)^(upright("R")) chevron.r  \, $

while
the Berry curvature is given by \[119, 120, 121, 123,
117\]

$ Omega_n^(mu nu) (upright(bold(k))) = nabla times upright(bold(a))_n (upright(bold(k))) - i sum_(n') [a_(n n')^mu \, a_(n' m)^nu] . $

We
note that there are some other generalizations to non-Hermitian systems
\[113, 75, 115, 114, 116\].

== Two-band systems
<two-band-systems>
We consider a two-band system with the index $n = plus.minus$. The
Hamiltonian is generally given by


$ H (upright(bold(k))) = h_0 (upright(bold(k))) + upright(bold(sigma)) dot.op upright(bold(h)) (upright(bold(k))) \, $

where


$ h_0 (upright(bold(k))) = & h_(0 upright("Re")) (upright(bold(k))) + i h_(0 upright("Im")) (upright(bold(k))) \,\
upright(bold(h)) (upright(bold(k))) = & upright(bold(h))_(upright("Re")) (upright(bold(k))) + i upright(bold(h))_(upright("Im")) (upright(bold(k))) \, $

where
$h_0 (upright(bold(k)))

$ and $

upright(bold(h)) (upright(bold(k)))

$ are
complex functions with $

h_(0 upright("Re"))$, $h_(0 upright("Im"))$,
$upright(bold(h))_(upright("Re")) (upright(bold(k)))

$ and
$upright(bold(h))_(upright("Im")) (upright(bold(k)))$ being real
functions. The energy is given
by$ epsilon_plus.minus = h_0 (upright(bold(k))) plus.minus sqrt(upright(bold(h)) (upright(bold(k)))^2) \, $

where

$ upright(bold(h)) (upright(bold(k)))^2 equiv h_x^2 (upright(bold(k))) + h_y^2 (upright(bold(k))) + h_z^2 (upright(bold(k))) . $

Its
right and left eigenvalues are given by
\[118\]

$ \|psi_plus.minus^(upright("R")) chevron.r  = & 1 / sqrt(2 epsilon_plus.minus (epsilon_plus.minus - h_z)) (h_x - i h_y \, epsilon_plus.minus - h_z)^T \,\
 chevron.l psi_plus.minus^(upright("L"))\| = & 1 / sqrt(2 epsilon_plus.minus (epsilon_plus.minus - h_z)) (h_x + i h_y \, epsilon_plus.minus - h_z) \, $

which
satisfy the biorthogal condition,


$ chevron.l psi_plus.minus^(upright("L")) \|psi_plus.minus^(upright("R")) chevron.r  = 1$.
The non-Hermitian Berry connection is calculated as
\[118\]$ a_plus.minus^mu = frac(h_x partial_(k_mu) h_y - h_y partial_(k_mu) h_x, epsilon_plus.minus (epsilon_plus.minus - h_z)) . $

The
non-Hermitian Berry curvature reads
\[124\]

$ Omega_plus.minus (upright(bold(k))) = nabla times a_plus.minus (upright(bold(k))) = frac(1, 2 epsilon_plus.minus^(3 \/ 2)) epsilon_(mu upsilon rho) h_mu partial_(k_x) h_nu partial_(k_y) h_rho . $ <BerryNH>


It
is further simplified
as

$ Omega_plus.minus (upright(bold(k))) = minus.plus 1 / 2 upright(bold(n)) dot.op (partial_(k_x) upright(bold(n)) times partial_(k_y) upright(bold(n))) $

with

$ upright(bold(n equiv)) frac(upright(bold(h)) (upright(bold(k))), sqrt(upright(bold(h)) (upright(bold(k)))^2)) . $

It
is identical to Eq.(@Omegaxy) for the Hermitian system. Note that


$ sqrt(upright(bold(h)) (upright(bold(k)))^2) eq.not lr(|upright(bold(h)) (upright(bold(k)))|) $

for
non-Hermitian systems. The non-Hermitian Chern number is defined by
\[119, 122\]


$ C_plus.minus = frac(1, 2 pi) integral Omega_plus.minus (upright(bold(k))) d^2 k \, $

where
the integration is over the Brillouin zone.

We can
check

$ g_plus.minus^(mu nu) (upright(bold(k))) = plus.minus 1 / 2 (partial_(k_mu) upright(bold(n))) dot.op (partial_(k_nu) upright(bold(n))) $

even
for the non-Hermitian systems. It is idential to Eq.(@Gmn).

== Dirac system with a complex mass
<dirac-system-with-a-complex-mass>
We consider a Dirac Hamiltonian with a complex mass $m = B + i gamma$,
whose Hamiltonia is given
by

$ H (upright(bold(k))) = lambda (upright(bold(k)) times upright(bold(sigma)))_z + (B + i gamma) sigma_z \, $

where
$gamma

$ is real. The Berry curvature (@BerryNH) is calculated
as$ Omega_plus.minus (upright(bold(k))) = plus.minus frac((m + i gamma) lambda^2, 2 (lambda^2 k^2 + (m + i gamma)^2)^(3 \/ 2)) \, $

which
leads to the Chern number
\[125\]

$ C_plus.minus = plus.minus frac(m + i gamma, 2 lr(|m + i gamma|)) \, $

where
$lr(|C_plus.minus|) = 1 \/ 2$.

The quantum metrices are calculated
as

$ g_plus.minus^(x x) (upright(bold(k))) = minus.plus & frac(lambda^2 ((lambda k_y)^2 + (m + i gamma)^2), ((lambda k)^2 + (m + i gamma)^2)^2) \,\
g_plus.minus^(y y) (upright(bold(k))) = minus.plus & frac(lambda^2 ((lambda k_x)^2 + (m + i gamma)^2), ((lambda k)^2 + (m + i gamma)^2)^2) \,\
g_plus.minus^(x y) (upright(bold(k))) = & plus.minus frac((lambda)^2 (lambda k_x) (lambda k_y), ((lambda k)^2 + (m + i gamma)^2)^2) \, $

The
quantum volume is calcualated
as

$ integral d upright(bold(k)) sqrt(det g_n^(mu nu) (upright(bold(k)))) = 1 / 8 (frac(lambda, m + i gamma))^2 . $

It
is negative for pure imaginary mass $m = 0

$ and $

gamma eq.not 0$.

= Quantum information geometry
<SecQIG>
== Uhlmann quantum geometry for density matrix
<uhlmann-quantum-geometry-for-density-matrix>
So far, quantum geometry is constructed for the wave function. It means
that it is constructed for pure states. On the other hand, mixed states
are important for quantum information and open quantum systems. They are
described by the density
matrix

$ rho (upright(bold(k))) = sum_(n = 1)^N p_n \|psi_n (upright(bold(k))) chevron.r   chevron.l psi_n (upright(bold(k)))\| \, $ <rhopphi>


where
$p_n = exp (- epsilon_n \/ k_(upright("B")) T)$. Quantum geometry for it
is constructed by Uhlmann \[126, 127, 128, 129, 130, 138, 140\].

We start with the Uhlmann fidelity \[134, 135\] for the density matrix
defined
by

$ F (upright(bold(k)) \, upright(bold(k))') = upright("Tr") sqrt(sqrt(rho (upright(bold(k)))) rho \( upright(bold(k))' \) sqrt(rho (upright(bold(k))))) . $ <UhlFidelity>


It
is symmetric


$ F (upright(bold(k)) \, upright(bold(k))') = F (upright(bold(k))' \, upright(bold(k))) \, $

because
$sqrt(rho (upright(bold(k)))) rho \( upright(bold(k))' \) sqrt(rho (upright(bold(k))))

$ and
$sqrt(rho \( upright(bold(k))' \)) rho (upright(bold(k))) sqrt(rho \( upright(bold(k))' \))$
have the same eigenvalues. It is bounded
as$ 0 lt.eq F (upright(bold(k)) \, upright(bold(k))') lt.eq 1 \, $

where

$ F (upright(bold(k)) \, upright(bold(k))) = 1 \, $

becuase

$ upright("Tr") rho (upright(bold(k))) = 1 . $

It
reduces to the fidelity (@Fidelity) for the pure
states,

$ F (upright(bold(k)) \, upright(bold(k))') & = upright("Tr") rho (upright(bold(k))) rho \( upright(bold(k))' \)\
 & = upright("Tr") \|psi (upright(bold(k))) chevron.r   chevron.l psi (upright(bold(k)))\| psi \( upright(bold(k))' \) chevron.r chevron.l psi \( upright(bold(k))' \|\
 & = chevron.l psi (upright(bold(k))) \| psi \( upright(bold(k))' \) chevron.r chevron.l psi \( upright(bold(k))' \) \| psi (upright(bold(k))) chevron.r\
 & = lr(|chevron.l psi (upright(bold(k))) \| psi \( upright(bold(k))' \) chevron.r|)^2 . $

With
the use of the Uhalmann fidelity (@UhlFidelity), the Bures distance
\[136\] is defined
by

$ s_(upright("B")) = sqrt(1 - F (upright(bold(k)) \, upright(bold(k))')^2) . $ <Bures>



We make a purification of the density matrix with the use of the
amplitude $W

$ satisfying $

 rho = W W^dagger \,

$ <rhoWW>
where the
amplitude $

W

$ is given
by$ W = & (sqrt(p_1) \|psi_1 (upright(bold(k))) chevron.r  \, sqrt(p_2) \|psi_2 (upright(bold(k))) chevron.r  \, dots.h.c \, sqrt(p_N) \|psi_N (upright(bold(k))) chevron.r ) \,\
W^dagger = & vec(sqrt(p_1)  chevron.l psi_1 (upright(bold(k)))\|, sqrt(p_2)  chevron.l psi_2 (upright(bold(k)))\|, dots.v, sqrt(p_N)  chevron.l psi_N (upright(bold(k)))\|) . $

Hence,
purification is always possible using the spectral decomposition. It is
identical to
represent

$ rho = upright("Tr")_(upright("E")) \|Psi chevron.r   chevron.l Psi\| $ <rhoPsi>


for
the extended Hamiltonian


$ H_(upright("ext")) equiv H times.o H_(upright("E")) \, $

by
attaching an environment Hamiltonian $H_(upright("E"))$, where the trace
is taken over the environment. It means that the mixed states are
represented by a pure state $\|Psi chevron.r

$ if we prepare a large system
described by $

H_(upright("ext"))$. Comparing Eq.(@rhoWW) and
Eq.(@rhoPsi), $W

$ and $

W^dagger

$ correspond to $

\|Psi chevron.r

$ and $

 chevron.l Psi\|$,
respectively.

There is a gauge degrees of freedom $U'

$ in $

W

$ as$ W = sqrt(rho) U' \, $

where $U

$ is a unitary matrix. By using the
purification, the Uhlmann fidelity is rewritten
as$ F (upright(bold(k)) \, upright(bold(k))') = & upright("Tr") sqrt(W^dagger (upright(bold(k))) W (upright(bold(k))') W^dagger (upright(bold(k))') W (upright(bold(k))))\
= & upright("Tr") lr(|W^dagger (upright(bold(k))) W (upright(bold(k))')|) . $

The
Bures distance (@Bures) is rewritten
as

$ s_(upright("B"))^2 = & 2 (1 - upright("Tr") lr(|W^dagger (upright(bold(k))) W (upright(bold(k))')|))\
= & 2 upright("Tr") (W (upright(bold(k))') - W (upright(bold(k)))) (W (upright(bold(k))') - W (upright(bold(k))))^dagger \, $

where
we have used the normalization condition for the density
matrix,

$ upright("Tr") rho (upright(bold(k))) = upright("Tr") W (upright(bold(k))) W^dagger (upright(bold(k))) = 1 \, $

and
the Uhlmann parallel transport condition
\[126\]

$ W^dagger (upright(bold(k))) W (upright(bold(k))') = W^dagger (upright(bold(k))') W (upright(bold(k))) > 0 . $ <Paral>


The
Bures distance for the infinitesimal distance $d upright(bold(k))

$ is
given by setting
$upright(bold(k))' = upright(bold(k)) + d upright(bold(k))$
as$ (d s_(upright("B")))^2 = 2 upright("Tr") d W d W^dagger = 2 upright("Tr") lr(|d W|)^2 . $ <dBures>



The differential form of the Uhlmann parallel transport condition
(@Paral) is given by

$ W^dagger d W = (d W^dagger) W . $ <WdW>


It is
fulfilled by the
ansatz

$ d W = 1 / 2 cal(L) W \, #h(2em) cal(L)^dagger = cal(L) . $ <dWLW>


Indeed,
the left and right hand sides of Eq.(@WdW) are given by


$ W^dagger d W = & 1 / 2 W^dagger cal(L) W \,\
(d W^dagger) W = & 1 / 2 (cal(L) W)^dagger W = 1 / 2 W^dagger cal(L)^dagger W = 1 / 2 W^dagger cal(L) W \, $

and
identical with the use of Eq.(@dWLW). $cal(L)

$ is called the symmetric
logarithmic derivative (SLD) \[141, 142, 137\].

Then, the Bures distance (@dBures)
reads$ (d s_(upright("B")))^2 = & 2 upright("Tr") lr(|d W|)^2 = 2 upright("Tr") lr(|1 / 2 cal(L) W|)^2\
= & 1 / 2 upright("Tr") cal(L) W W^dagger cal(L) = 1 / 2 upright("Tr") cal(L) rho cal(L)\
= & 1 / 2 upright("Tr") rho cal(L)^2 = 1 / 2  chevron.l cal(L)^2 chevron.r  . $

By using one
form of the SLD,

$ cal(L) = cal(L)^mu d k_mu \, $ <L1form>


we obtain the
Uhlmann quantum geometric tensor $cal(F)_(upright("U"))^(mu nu)

$ as$ (d s_(upright("B")))^2 = upright("Tr") [rho sum_(mu nu) cal(L)^mu cal(L)^nu d k_mu d k_nu] equiv sum_(mu nu)^(mu nu) cal(F)_(upright("U"))^(mu nu) d k_mu d k_nu $

with

$ cal(F)_(upright("U"))^(mu nu) equiv upright("Tr") [rho cal(L)^mu cal(L)^nu] =  chevron.l cal(L)^mu cal(L)^nu chevron.r  . $

The
Uhlmann quantum geometric tensor $cal(F)_(upright("U"))^(mu nu)

$ is
decomposed
as$ cal(F)_(upright("U"))^(mu nu) = cal(F)_(upright("QFisher"))^(mu nu) + i cal(macron(U))^(mu nu) $

with
the SLD quantum Fisher information \[139, 137,
140\]

$ cal(F)_(upright("QFisher"))^(mu nu) equiv 1 / 2 upright("Tr") [rho {cal(L)^mu \, cal(L)^nu}] = 1 / 2  chevron.l {cal(L)^mu \, cal(L)^nu} chevron.r  \, $

and
the mean Uhlmann curvature \[130,
140\]

$ cal(macron(U))^(mu nu) equiv - i / 2 upright("Tr") [rho [cal(L)^mu \, cal(L)^nu]] = - i / 2  chevron.l [cal(L)^mu \, cal(L)^nu] chevron.r  . $

We
note that

$ cal(U)^(mu nu) equiv - i / 2 [cal(L)^mu \, cal(L)^nu] $

 is
the Uhlmann curvature, which
satisfies

$ cal(macron(U))^(mu nu) = upright("Tr") [rho cal(U)^(mu nu)] =  chevron.l cal(U)^(mu nu) chevron.r  . $



It follows from Eq.(@rhoWW) that


$ d rho = & d (W W^dagger) = (d W) W^dagger + W d W^dagger\
= & 1 / 2 cal(L) W W^dagger + W 1 / 2 (cal(L) W)^dagger\
= & 1 / 2 (cal(L) rho + rho cal(L)) = 1 / 2 {cal(L) \, rho} . $ <drhoSLD>


By
using Eq.(@rhopphi) and Eq.(@drhoSLD), the SLD $cal(L)^mu

$ is explicitly
given by \[131, 132, 133, 137,
140\]$ cal(L)^mu = sum_n frac(partial ln p_n, partial k_mu) \|psi_n chevron.r   chevron.l psi_n\| + 2 i sum_(n eq.not m) frac(p_m - p_n, p_m + p_n) a_(n m)^mu \|psi_n chevron.r   chevron.l psi_m\| . $ <SLD>


The
derivation is shown in Appendix.@ApU.

== Classical Fisher information
<classical-fisher-information>
The symmetric logarithmic derivative is decomposed into the classical
part $cal(L)_(upright("C"))^mu

$ and the quantum part
$cal(L)_(upright("Q"))^mu$~as
\[140\]$ cal(L)^mu = & cal(L)_(upright("C"))^mu + cal(L)_(upright("Q"))^mu \,\
cal(L)_(upright("C"))^mu equiv & sum_n frac(partial ln p_n, partial k_mu) \|psi_n chevron.r   chevron.l psi_n\| \,\
cal(L)_(upright("Q"))^mu equiv & 2 i sum_(n eq.not m) frac(p_m - p_n, p_m + p_n) a_(n m)^mu \|psi_n chevron.r   chevron.l psi_m\| . $

When
the SLD $cal(L)^mu

$ commutes with the density matrix
$rho$,$ [cal(L)^mu \, rho] = 0 \, $

we have
$cal(L)_(upright("Q"))^mu = 0

$ and
$cal(L)^mu = cal(L)_(upright("C"))^mu$. Then, we obtain the classical
Fisher information based on the classical part of the SLD as
$  & 1 / 2 upright("Tr") [rho {cal(L)_(upright("C"))^mu \, cal(L)_(upright("C"))^nu}]\
= & 1 / 2 sum_(n = 1)^N p_n \|psi_n (upright(bold(k))) chevron.r   chevron.l psi_n (upright(bold(k)))\|\
 & times \( sum_(n') frac(partial ln p_(n'), partial k_mu) \|psi_(n') chevron.r   chevron.l psi_(n')\| sum_(n^('')) frac(partial ln p_(n^('')), partial k_nu) \|psi_(n^('')) chevron.r   chevron.l psi_(n^(''))\|\
 & + sum_(n^('')) frac(partial ln p_(n^('')), partial k_nu) \|psi_(n^('')) chevron.r   chevron.l psi_(n^(''))\| sum_(n') frac(partial ln p_(n'), partial k_mu) \|psi_(n') chevron.r   chevron.l psi_(n')\| \)\
= & sum_(n \, n' \, n^('') = 1)^N p_n frac(partial ln p_(n'), partial k_mu) frac(partial ln p_(n^('')), partial k_nu) delta_(n n') delta_(n' n^(''))\
= & sum_(n = 1)^N p_n frac(partial ln p_n, partial k_mu) frac(partial ln p_n, partial k_nu) equiv cal(F)_(upright("CFisher"))^(mu nu) . $ <CFisher>



On the other hand, the classical part of the mean Uhlmann curvature is
zero,

$ cal(macron(U))^(mu nu) equiv - i / 2 upright("Tr") [rho [cal(L)_(upright("C"))^mu \, cal(L)_(upright("C"))^nu]] = 0 . $



== Quantum Cramér-Rao inequality
<quantum-cramér-rao-inequality>
There is an inequality known as the Quantum Cramér-Rao inequality \[139,
141,
142\],

$ cal(F)_(upright("CFisher")) lt.eq cal(F)_(upright("QFisher")) \, $ <CR>


where
we have
defined

$ cal(F)_(upright("CFisher")) = & sum_(mu nu) a_mu cal(F)_(upright("CFisher"))^(mu nu) a_nu \,\
cal(F)_(upright("QFisher")) = & sum_(mu nu) a_mu cal(F)_(upright("QFisher"))^(mu nu) a_nu $

for
an arbitrary set of parameters $a_mu$. The proof is shown in
Appendix.@ApQCR.

On the other hand, the classical Cramér-Rao inequality states that the
covariance is bounded by the inverse of the classical Fisher information
matrix,

$ & sum_(mu nu) a_mu p_n (k_mu -  chevron.l k_mu chevron.r ) (k_nu -  chevron.l k_nu chevron.r ) a_nu\
gt.eq & 1 / N sum_(mu nu) a_mu (cal(F)_(upright("CFisher"))^(- 1))^(mu nu) a_nu . $

Combining
the quantum and classical Cramér-Rao inequalities, the lower bound of
the covariance is determined by the inverse of the quantum Fisher
information.

== Quantum Fisher information for a pure state and quantum metric
<quantum-fisher-information-for-a-pure-state-and-quantum-metric>
By inserting Eq.(@L1form) to Eq.(@drhoSLD), we
obtain

$ d rho = 1 / 2 {cal(L) \, rho} = 1 / 2 {cal(L)^mu d k_mu \, rho} \, $

which
leads
to

$ frac(partial rho, partial k_mu) = 1 / 2 {cal(L)^mu \, rho} . $ <SLDrho>



We show that the quantum Fisher information reproduces the quantum
metric when the density matrix $rho

$ describes a pure state $

\|psi_n chevron.r $.
By using the relation $rho^2 = rho$, we
have

$ frac(partial rho, partial k_mu) = frac(partial rho^2, partial k_mu) = rho frac(partial rho, partial k_mu) + frac(partial rho, partial k_mu) rho = {frac(partial rho, partial k_mu) \, rho} . $

Comparing
it with Eq.(@SLDrho), we
have

$ cal(L)^mu = 2 frac(partial rho, partial k_mu) . $

Then, the quantum
Fisher information is rewritten
as

$ cal(F)_(upright("QFisher"))^(mu nu) = 2 upright("Tr") [rho {frac(partial rho, partial k_mu) \, frac(partial rho, partial k_nu)}] = 2  chevron.l {frac(partial rho, partial k_mu) \, frac(partial rho, partial k_nu)} chevron.r  . $ <FisherRho>


By
inserting

$ rho = \|psi_n chevron.r   chevron.l psi_n\| \, $

the quantum Fisher information
is reduced to the quantum
metric

$ cal(F)_(upright("QFisher"))^(mu nu) = & 2 upright("Tr") frac(partial  chevron.l psi_n\|, partial k_mu) frac(partial \|psi_n chevron.r , partial k_nu) - frac(partial  chevron.l psi_n\|, partial k_mu) \|psi_n chevron.r   chevron.l psi_n\| frac(partial \|psi_n chevron.r , partial k_nu)\
 & + frac(partial  chevron.l psi_n\|, partial k_nu) frac(partial \|psi_n chevron.r , partial k_mu) - frac(partial  chevron.l psi_n\|, partial k_nu) \|psi_n chevron.r   chevron.l psi_n\| frac(partial \|psi_n chevron.r , partial k_mu)\
= & 2 (cal(F)_n^(mu nu) + cal(F)_n^(nu mu)) = 4 g_n^(mu nu) . $ <FIpure>


while
the mean Uhlmann curvature is reduced to the Berry
curvature

$ cal(macron(U))^(mu nu) = & - 2 i upright("Tr") frac(partial  chevron.l psi_n\|, partial k_mu) frac(partial \|psi_n chevron.r , partial k_nu) - frac(partial  chevron.l psi_n\|, partial k_mu) \|psi_n chevron.r   chevron.l psi_n\| frac(partial \|psi_n chevron.r , partial k_nu)\
 & - frac(partial  chevron.l psi_n\|, partial k_nu) frac(partial \|psi_n chevron.r , partial k_mu) + frac(partial  chevron.l psi_n\|, partial k_nu) \|psi_n chevron.r   chevron.l psi_n\| frac(partial \|psi_n chevron.r , partial k_mu)\
= & - 2 i (cal(F)_n^(mu nu) + cal(F)_n^(nu mu)) = i 4 Omega_n^(mu nu) . $ <UhlPure>


Then,
the quantum Fisher information is reduced to the quantum metric, while
the mean Uhlmann curvature is reduced to the Berry curvature. Thus, the
Uhlmann quantum geometry is a generalization of quantum geometry. The
derivation of Eq.(@FIpure) is shown in Appendix.@ApQFpure.

== Fluctuation-dissipation theorem
<fluctuation-dissipation-theorem>
There is a fluctuation-dissipation theorem
\[140\],

$ - frac(1, 2 ℏ) g_(upright("Bures"))^(mu nu) = frac(tanh^2 frac(ℏ omega, 2 k_(upright("B")) T), 1 - e^(- ℏ omega \/ k_(upright("B")) T)) chi^(mu nu) / (ℏ omega)^2 \, $

where
$chi^(mu nu)

$ is the susceptibility. It is reduced to Eq.(@FlucD) for
the pure state.

== Quantum geometry at thermal equilibrium
<quantum-geometry-at-thermal-equilibrium>
At a thermal equilibrium, the probability is given
by$ p_n = exp [- beta epsilon_n] \, $

where
$beta equiv 1 \/ k_(upright("B")) T

$ is the inverse temperature. We
consider a two-band system with $

n = plus.minus$. The SLD operator
(@SLD) is given by



$ cal(L)^mu = & - beta sum_(n = plus.minus) frac(partial epsilon_n, partial k_mu) \|psi_n chevron.r   chevron.l psi_n\|\
 & #h(-3em) - 2 i tanh frac(Delta epsilon, 2) \( a_(- +)^mu \|psi_(-) chevron.r   chevron.l psi_(+)\| - a_(+ -)^mu \|psi_(+) chevron.r   chevron.l psi_(-)\| \) $

with

$ Delta epsilon = epsilon_(+) - epsilon_(-) \, $

where
we have
used

$ frac(e^(- beta epsilon_(+)) - e^(- beta epsilon_(-)), e^(- beta epsilon_(+)) + e^(- beta epsilon_(-))) = tanh frac(Delta epsilon, 2) . $

It
is rewritten
as

$ cal(L)^mu = Psi^dagger mat(delim: "(", - beta frac(partial epsilon_(+), partial k_mu), 2 i tanh frac(beta Delta epsilon, 2) a_(+ -)^mu; - 2 i tanh frac(beta Delta epsilon, 2) a_(- +)^mu, - beta frac(partial epsilon_(-), partial k_mu)) Psi $

with

$ Psi equiv vec( chevron.l psi_(+)\|,  chevron.l psi_(-)\|) . $

The
Uhlmann curvature is calculated
as

$ cal(U)^(mu nu) = - i / 2 [cal(L)^mu \, cal(L)^nu] = 2 tanh frac(beta Delta epsilon, 2) mat(delim: "(", cal(U)^(+ +), cal(U)^(+ -); cal(U)^(+ -), - cal(U)^(+ +)) $

with

$ cal(U)^(+ +) = & Omega^(mu nu) tanh frac(beta Delta epsilon, 2) \,\
cal(U)^(+ -) = & frac(partial epsilon_(+), partial k_mu) a_(+ -)^nu - frac(partial epsilon_(+), partial k_nu) a_(+ -)^mu . $

$cal(U)^(+ +)

$ recovers the Berry curvature at the low temperature limit,
$beta arrow.r 0$,$ cal(U)^(+ +) = - lim_(beta arrow.r 0) 2 Omega^(mu nu) tanh^2 frac(beta Delta epsilon, 2) = - 2 Omega^(mu nu) . $



We define the quantum Fisher information density
by

$ F_(upright("QFisher"))^(mu nu) equiv 1 / 2 {cal(L)^mu \, cal(L)^nu} \, $

which
satisfies

$ cal(F)_(upright("QFisher"))^(mu nu) equiv upright("Tr") [rho F_(upright("QFisher"))^(mu nu)] =  chevron.l F_(upright("QFisher"))^(mu nu) chevron.r  . $

It
is explicitly given
by

$ F_(upright("QFisher"))^(mu nu) = (frac(partial epsilon_(+), partial k_mu) frac(partial epsilon_(+), partial k_nu) + 4 g^(mu nu) tanh^2 frac(beta Delta epsilon, 2)) I_2 \, $

where
$I_2

$ is the 2 by 2 identity matrix.

= $

X$-wave magnets
<SecX>
== Fermi surface symmetry
<fermi-surface-symmetry>
The Fermi surface of electrons coupled with a ferromagnet is known to
have the $s$-wave symmetry as shown in Fig.@FigSurface\(a). Recently
proposed altermagnets generalize it to Fermi surfaces possessing
higher-wave symmetries \[42, 43\]. The Fermi surface has
$0 \, 1 \, 2 \, 3 \, 4

$ and $

6$~nodes for the $s$-wave, $p$-wave,
$d$-wave, $f$-wave, $g$-wave and $i$-wave symmetry, respectively. The
$d$-wave altermagnet has the Fermi surface with the $d$-wave symmetry as
shown in Fig.@FigSurface\(c1). In the similar way, the Fermi surface of
the $g$-wave altermagnet is shown in Fig.@FigSurface\(e1) and that of
the $i$-wave alatermagnet is shown in Fig.@FigSurface\(f1). Altermagnets
break time-reversal symmetry. On the other hand, the $p$-wave magnet
preserves time-reversal symmetry. Its Fermi surface has the $p$-wave
symmetry as shown in Fig.@FigSurface\(b1). In a similar way, the
$f$-wave magnet has the Fermi surface with the $f$-wave symmetry as
shown in Fig.@FigSurface\(d1). We call them the $X$-wave magnets with
$X = p, d, f, g, i$. We note that there are no $h$-wave magnets
because of the incompatibility between the five-fold rotational symmetry
and the lattice symmetry.

#figure([#box(image("Alter.svg", width: 98.0%))

  ],
  caption: [
    Fermi surfaces in two and three dimensions. (a1), (a3) $s$-wave
    magnet; (b1), (b3) $p$-wave magnet; (c1), (c3) $d$-wave altermagnet;
    (c2) $d'$-wave altermagnet; (d1), (d3) $f$-wave magnet; (d2)
    $f'$-wave magnet; (e1), (e3) $g$-wave altermagnet; (e2)
    $g'$-wave$med$altermagnet; ((f1) and (f3) $i$-wave altermagnet. Red
    (blue) curves indicate up (down)-spin Fermi surfaces.
  ]
)
<FigSurface>

The simplest expressions on magnetic terms with higher symmetries in two
dimensions are summarized as follows. The $X$-wave magnet is
characterized by a function $f_X^(2 upright("D")) (upright(bold(k)))$,
which reads \[42, 43, 143, 46,
47\],

$ f_s^(2 upright("D")) (upright(bold(k))) & = 1 \,\
f_p^(2 upright("D")) (upright(bold(k))) & = a k_x = a k cos phi.alt \,\
f_d^(2 upright("D")) (upright(bold(k))) & = 2 a^2 k_x k_y = a^2 k^2 sin 2 phi.alt \,\
f_f^(2 upright("D")) (upright(bold(k))) & = a^3 k_x (k_x^2 - 3 k_y^2) = a^3 k^3 cos 3 phi.alt \,\
f_g^(2 upright("D")) (upright(bold(k))) & = 4 a^4 k_x k_y (k_x^2 - k_y^2) = a^4 k^4 sin 4 phi.alt \,\
f_i^(2 upright("D")) (upright(bold(k))) & = 2 a^6 k_x k_y (3 k_x^2 - k_y^2) (k_x^2 - 3 k_y^2) = a^6 k^6 sin 6 phi.alt \, $

where
$k_x = k cos phi.alt$, $k_y = k sin phi.alt$. We note that the $d$-wave
altermanget described by the function
$f_d^(2 upright("D")) (upright(bold(k)))

$ is commonly called the
$d_(x y)$-wave altermagnet. The $

X$-wave magnet has $N_X

$ nodes in the
band structure, where $

N_X = 1 \, 2 \, 3 \, 4 \, 6

$ for
$X = p, d, f, g, i$, respectively.

There is another type of the $

X'$-wave magnet in two dimensions
characterized by a function $f_(X')^(2 upright("D")) (upright(bold(k)))

$ such that
$ f_(p')^(2 upright("D")) (upright(bold(k))) = & a k_y = a k sin phi.alt \,\
f_(d')^(2 upright("D")) (upright(bold(k))) = & a^2 (k_x^2 - k_y^2) = a^2 k^2 cos 2 phi.alt \,\
f_(f')^(2 upright("D")) (upright(bold(k))) = & a^3 k_y (3 k_x^2 - k_y^2) = a^3 k^3 sin 3 phi.alt \,\
f_(g')^(2 upright("D")) (upright(bold(k))) = & a^4 (k_x^2 - k_y^2 - 2 k_x k_y) (k_x^2 - k_y^2 + 2 k_x k_y)\
= & a^4 k^4 cos 4 phi.alt \,\
f_(i')^(2 upright("D")) (upright(bold(k))) = & 2 a^6 (k_x^2 - k_y^2) (k_x^4 + k_y^4 - 14 k_x^2 k_y^2)\
= & a^6 k^6 cos 6 phi.alt \, $

where $X' = p' \, d' \, f' \, g' \, i'$.
We note that the $d'$-wave altermanget described by the function
$f_(d')^(2 upright("D")) (upright(bold(k)))

$ is commonly called the
$d_(x^2 - y^2)$-wave altermagnet, which is obtained by rotating the
$d_(x y)$ altermagnet by 45 degrees.

The $

X$-wave magnet and the $X'$-wave magnet are summarized by the
function in the form
of

$ f_(X \, X')^(2 upright("D")) (upright(bold(k))) = (a k)^(N_X) sin N_X phi.alt \, $

or

$ f_(X \, X')^(upright("2D")) (upright(bold(k))) = (a k)^(N_X) cos N_X phi.alt . $



The magnetic terms of the $X$-wave magnet in three dimensions are given
by

$ f_d^(3 upright("D")) (upright(bold(k))) & = a^2 k_z (k_x + k_y) \,\
f_f^(3 upright("D")) (upright(bold(k))) & = 2 a^3 k_x k_y k_z = a^2 k^2 cos theta sin 2 phi.alt \,\
f_g^(3 upright("D")) (upright(bold(k))) & = a^4 k_z k_x (k_x^2 - 3 k_y^2) = a^3 k^3 cos theta cos 3 phi.alt \,\
f_i^(3 upright("D")) (upright(bold(k))) & = a^6 (k_x^2 - k_y^2) (k_y^2 - k_z^2) (k_z^2 - k_x^2) . $ <EqY>



There are relations between the $X$-wave magnet between two and three
dimensions,

$ f_f^(3 upright("D")) (upright(bold(k))) = a & k_z f_d^(2 upright("D")) (upright(bold(k))) \,\
f_g^(3 upright("D")) (upright(bold(k))) = a & k_z f_f^(2 upright("D")) (upright(bold(k))) . $

There
are also $X'$-wave magnets in three dimensions
\[144\],

$ f_(d')^(3 upright("D")) (upright(bold(k))) = & a^2 k_y (k_x + k_z) \,\
f_(f')^(3 upright("D")) (upright(bold(k))) = & a^3 k_z (k_x^2 - k_y^2) = a^2 k^2 cos theta cos 2 phi.alt \,\
f_(g')^(3 upright("D")) (upright(bold(k))) = & a^4 k_z k_y (3 k_x^2 - k_y^2) = a^3 k^3 cos theta sin 3 phi.alt . $



We set $a = 1

$ in the following.

== Model Hamiltonian
<model-hamiltonian>
We consider the two-band Hamiltonian described \[46\]
by$ H (upright(bold(k))) = frac(ℏ^2 k^2, 2 m) + J f_X (upright(bold(k))) upright(bold(n)) dot.op upright(bold(sigma)) + lambda (k_x sigma_y - k_y sigma_x) + upright(bold(B)) dot.op upright(bold(sigma)) . $ <ModelHamil>


The
first term represents the kinetic energy, making the system metallic.
The second term represents the $X$-wave term with the $X$-wave function
$f_X (upright(bold(k)))$, where $upright(bold(n))

$ is the direction of
the spin-splitting of the band structure, and $

J

$ is the coupling
constant induced by the $

X$-wave magnet. The third term represents the
Rashba interaction introduced by making an interface between the
$X$-wave magnet and the substrate, where $lambda

$ is the magnitude of
the Rashba interaction. The fourth term is the magnetic field term. The
Rashba interaction is introduced by placing an altermagnet on the
substrate \[145, 42, 43, 146, 147, 148, 149, 31\].

== Symmtery
<symmtery>
We summarize symmetry properties of the $

X$-wave magnets \[58\].

=== Spin diagonal case
<spin-diagonal-case>
We consider the Hamiltonian (@ModelHamil) by setting $lambda = 0$,
$upright(bold(n)) = (0 \, 0 \, 1)

$ and $

upright(bold(B)) = 0$, where the
spin is a good quantum number, $sigma_z = s = plus.minus 1$. The
Hamiltonian is diagonal with respect to the spin $upright(bold(sigma))$,
where $s = plus.minus 1$. Let us use $s = arrow.t arrow.b$~within
indices and $s = plus.minus 1$~in equations.

The energy is given
by

$ epsilon_s = frac(ℏ^2 k^2, 2 m) + s f_X . $

Time-reversal symmetry is
defined
by

$ T epsilon_s (upright(bold(k))) T^(- 1) = epsilon_(- s) (- upright(bold(k))) . $

Inversion
symmetry is defined
by

$ P epsilon_s (upright(bold(k))) P^(- 1) = epsilon_s (- upright(bold(k))) . $

When
there are both symmetries, we
have

$ P T epsilon_s (upright(bold(k))) (P T)^(- 1) = epsilon_(- s) (upright(bold(k))) . $

Hence,
the band with up and down spins are degenerate perfectly. In this sense,
the breaking of time-reversal symmetry or inversion symmetry is
necessary for spin-splitting band structure. In the $d$-wave, the
$g$-wave and the $i$-wave altermagnets, time-reversal symmetry is broken
but inversion symmetry is preserved. On the other hand, in the $p$-wave
and the $f$-wave magnets, inversion symmetry is broken but time-reversal
symmetry is preserved. Hence, the spin splitting occurs in all $X$-wave
magnets.

=== Spin nondiagonal case
<spin-nondiagonal-case>
In the presence of the Rashba interaction, the system is not diagonal
with respect to spin $sigma_z$. In this case, time-reversal symmetry is
defined
by

$ T H (upright(bold(k))) T^(- 1) = H (- upright(bold(k))) $

with the
time-reversal symmetry operator $T = i sigma_y K$, where $K

$ is the
complex conjugation operator. Thus, $

T

$ is an anti-unitary operator.
Time-reversal symmetry is
broken$ T H (upright(bold(k))) T^(- 1) = - H (- upright(bold(k))) $

for
the $d$-wave, the $g$-wave and the $i$-wave altermagnets. On the other
hand, time-reversal symmetry is preserved for the $p$-wave and the
$f$-wave magnets.

Inversion symmetry is defined
by

$ P H (upright(bold(k))) P^(- 1) = H (- upright(bold(k))) $

with the
inversion symmetry operator $P = sigma_z$, which is a unitary operator.
Inversion symmetry is preserved for $s$-wave, $d$-wave and $g$-wave
magnets. On the other hand, it is
broken

$ P H (upright(bold(k))) P^(- 1) = - H (- upright(bold(k))) $

for
$p$-wave, $f$-wave and $i$-wave magnets.

PT symmetry is a combination operator of inversion symmetry and
time-reversal symmetry. If there is PT
symmetry

$ P T H (upright(bold(k))) (P T)^(- 1) = H (upright(bold(k))) \, $

the
bands are two-fold degenerate. All $X$-wave magnets break PT symmetry,
and hence, the band structure is spin split.

The $X$-wave symmetric magnets with $N_X

$ are characterized by the spin
group, which a combination group of spatial group and spin. The
$frac(2 pi, N_X)$-rotation along the $

z

$ axis of the momentum is given
by$ R_z (pi / N_X) : vec(k_x, k_y) mapsto mat(delim: "(", cos pi / N_X, sin pi / N_X; - sin pi / N_X, cos pi / N_X) vec(k_x, k_y) \, $

where
$N_X = 1 \, 2 \, 3 \, 4 \, 6

$ for $

X = p, d, f, g, i$,
respectively. The $X$-wave symmetric magnets with $N_X

$ in two
dimensions have a combinational symmetry of $

frac(2 pi, N_X)$-rotation
and time-reversal
symmetry

$ [R_z (pi / N_X) T] H (upright(bold(k))) [R_z (pi / N_X) T]^(- 1) = H (upright(bold(k))) . $

The
$X$-wave symmetric magnets in three dimensions also have a combinational
symmetry of spatial group and time-reversal symmetry.

== Quantum geometry of $X$-wave magnets
<quantum-geometry-of-x-wave-magnets>
We take $upright(bold(n)) = (0 \, 0 \, 1)

$ and
$upright(bold(B)) = (0 \, 0 \, B)$ in the Hamiltonian (@ModelHamil). The
Berry curvature is given
by$ Omega_plus.minus^(x y) = minus.plus frac(lambda^2 (B + J f_X - J k partial_k f_X), 2 (lambda^2 k^2 + (B + J f_X))^(3 \/ 2)) \, $

while
the quantum metrices are given
by

$ g_plus.minus^(x x) = & minus.plus frac(lambda^2 (lambda^2 k_y^2 + (B + J f_X)^2), 2 (lambda^2 k^2 + (B + J f_X)^2)^2) \,\
g_plus.minus^(x y) = & g_plus.minus^(y x) = minus.plus frac(- lambda^4 k_x k_y, 2 (lambda^2 k^2 + (B + J f_X)^2)^2) \,\
g_plus.minus^(y y) = & minus.plus frac(lambda^2 (lambda^2 k_x^2 + (B + J f_X)^2), 2 (lambda^2 k^2 + (B + J f_X)^2)^2) . $



== Zeeman quantum geometry of $X$-wave magnets
<zeeman-quantum-geometry-of-x-wave-magnets>
By inserting Eq.(@ModelHamil) to Eq.(@Z), the Zeeman Berry curvatures
are calculated
as

$ cal(Z)_(+ -)^(x x) = & frac(partial n_x, partial k_x) = lambda k_y frac(lambda^2 k_x + (B + J f_X) J partial_(k_x) f_X, (lambda^2 k^2 + (B + J f_X)^2)^(3 \/ 2)) \,\
cal(Z)_(+ -)^(y y) = & frac(partial n_y, partial k_y) = - lambda k_x frac(lambda^2 k_y + (B + J f_X) J partial_(k_y) f_X, (lambda^2 k^2 + (B + J f_X)^2)^(3 \/ 2)) \,\
cal(Z)_(+ -)^(x y) = & frac(partial n_y, partial k_x) = lambda / sqrt(lambda^2 k^2 + (B + J f_X)^2)\
 & - lambda k_x frac(2 lambda^2 k_x + 2 (B + f_X) J partial_(k_x) f_X, 2 (lambda^2 k^2 + (B + J f_X)^2)^(3 \/ 2)) \,\
cal(Z)_(+ -)^(y x) = & frac(partial n_x, partial k_y) = - lambda / sqrt(lambda^2 k^2 + (B + J f_X)^2)\
 & + lambda k_y frac(2 lambda^2 k_y + 2 (B + f_X) J partial_(k_y) f_X, 2 (lambda^2 k^2 + (B + J f_X)^2)^(3 \/ 2)) \,\
cal(Z)_(+ -)^(x z) = & frac(partial n_z, partial k_x) = lambda^2 frac(- k_x (B + J f_X) + J k^2 J partial_(k_x) f_X, 2 (lambda^2 k^2 + (B + J f_X)^2)^(3 \/ 2)) \,\
cal(Z)_(+ -)^(y z) = & frac(partial n_z, partial k_y) = lambda^2 frac(- k_y (B + J f_X) + J k^2 J partial_(k_y) f_X, 2 (lambda^2 k^2 + (B + J f_X)^2)^(3 \/ 2)) . $



By inserting Eq.(@ModelHamil) to Eq.(@Q), the Zeeman quantum metrices
are calculated
as

$ cal(Q)_(+ -)^(x x) = & frac(n_y frac(partial n_z, partial k_x) - n_z frac(partial n_y, partial k_x), 2) = - frac(lambda (B + J f_X - J k_x partial_(k_x) f_X), 2 (lambda^2 k^2 + (B + J f_X)^2)) \,\
cal(Q)_(+ -)^(y y) = & frac(n_z frac(partial n_x, partial k_y) - n_x frac(partial n_z, partial k_y), 2) = - frac(lambda (B + J f_X - J k_y partial_(k_y) f_X), 2 (lambda^2 k^2 + (B + J f_X)^2)) \,\
cal(Q)_(+ -)^(x y) = & frac(n_z frac(partial n_x, partial k_x) - n_x frac(partial n_z, partial k_x), 2) = frac(lambda k_y J partial_(k_x) f_X, 2 (lambda^2 k^2 + (B + J f_X)^2)) \,\
cal(Q)_(+ -)^(y x) = & frac(n_y frac(partial n_z, partial k_y) - n_z frac(partial n_y, partial k_y), 2) = frac(lambda k_x J partial_(k_y) f_X, 2 (lambda^2 k^2 + (B + J f_X)^2)) \,\
cal(Q)_(+ -)^(x z) = & frac(n_x frac(partial n_y, partial k_x) - n_y frac(partial n_x, partial k_x), 2) = - frac(lambda^2 k_y, 2 (lambda^2 k^2 + (B + J f_X)^2)) \,\
cal(Q)_(+ -)^(y z) = & frac(n_x frac(partial n_y, partial k_y) - n_y frac(partial n_x, partial k_y), 2) = frac(lambda^2 k_x, 2 (lambda^2 k^2 + (B + J f_X)^2)) . $



The diagonal spin quantum metrices are calculates
as

$ cal(S)_(+ -)^(x x) = & frac(lambda^2 k_x^2 + (B + J f_X)^2, lambda^2 k^2 + (B + J f_X)^2) \,\
cal(S)_(+ -)^(y y) = & frac(lambda^2 k_y^2 + (B + J f_X)^2, lambda^2 k^2 + (B + J f_X)^2) \,\
cal(S)_(+ -)^(z z) = & frac(lambda^2 k^2, lambda^2 k^2 + (B + J f_X)^2) . $



The off-diagonal spin quantum metrices are calculates
as

$ cal(S)_(+ -)^(x y) = & frac(lambda^2 k_x k_y, sqrt(lambda^2 k^2 + (B + J f_X)^2)) \,\
cal(S)_(+ -)^(y z) = & - frac((B + J f_X) k_x, sqrt(lambda^2 k^2 + (B + J f_X)^2)) \,\
cal(S)_(+ -)^(z x) = & frac((B + f_X) k_y, sqrt(lambda^2 k^2 + (B + J f_X)^2)) . $

The
spin Berry curvatures are calculated
as

$ cal(A)_(+ -)^(x y) = & - 2 frac(B + J f_X, sqrt(lambda^2 k^2 + (B + J f_X)^2)) \,\
cal(A)_(+ -)^(y z) = & frac(2 lambda k_y, sqrt(lambda^2 k^2 + (B + J f_X)^2)) \,\
cal(A)_(+ -)^(z x) = & - frac(2 lambda k_x, sqrt(lambda^2 k^2 + (B + J f_X)^2)) . $



== Zeeman quantum geometry induced cross response
<zeeman-quantum-geometry-induced-cross-response>
We study the X-wave magnet coupled with the Rashba interaction without
applying magnetic field \[110\], where we set $J eq.not 0

$ and $

B = 0$.
It is possible to determine whether there is a response by integrating
the quantum geometric tensors $cal(Z)_(+ -)^(mu nu)

$ and
$cal(Q)_(+ -)^(mu nu)$ over the angle $

phi.alt$. Most of them vanishes
by integration over the angle $phi.alt$.

First, we study the spin polarization $S^(mu \; nu)

$ induced by electric
field $

E^nu$. It is determined by $cal(Q)_(+ -)^(mu nu)

$ as in Eq.(@SE).

1) $

S^(x \; x) \/ E^x

$ In the absence of the $

X$-wave magnet, there is no response in the
absence of magnetic field, while there is nonzero response in the
presence of magnetic field. Only in the $d_(x^2 - y^2)

$ altermagnet,
there emerges the diagonal spin polarization $

S^(mu \; mu)

$ by applying
electric field $

E^mu

$ with $

mu = x \, y

$ in the absence of magnetic
field. Once magnetic field is turned on, there is nonzero response for
all $

X$-wave magnets.

2) $S^(x \; y) \/ E^y

$ In addition, only in the $

d_(x y)

$ altermagnet, there emerges the
off-diagonal spin polarization $

S^x

$ ($S^y$) by applying electric field
$E^y$ ($E^x$) due to the contribution from the Zeeman quantum metric
$cal(Z)_(+ -)^(x y)$ ($cal(Z)_(+ -)^(y x)$). Diagonal spin polarization
$S^mu$ is induced by electric field $

E^mu

$ for all $

X$-wave and
$X'$-wave magnets, which originate from the contribution of the Rashba
interaction.

Next, we study current $J^(mu \; nu)

$ induced by magnetic field $

B^nu$.
It is determined by $cal(Z)_(+ -)^(mu nu)

$ as in Eq.(@JB).

3) $

J^(x \; x) \/ B^x

$ The diagonal current $

J^(mu \; mu)

$ is not induced by magnetic field
$B^mu$.

4) $

J^(x \; y) \/ B^y

$ On the other hand, the off-diagonal current $

J^(x \; y)

$ ($J^(y \; x)$)
is induced by magnetic field $

B^y

$ ($B^x$) when there is nonzero Rashba
interaction irrespective of the presence of the $

X$-wave magnet.

They are summarized in the following table. Detailed derivations are
shown in Appendix.@ApCross.

#figure(
  align(center)[#table(
    columns: 5,
    align: (left,left,left,left,left,),
    table.header([], [$S^(x \; x) \/ E^x$], [$S^(x \; y) \/ E^y$], [$J^(x \; x) \/ B^x$], [$J^(x \; y) \/ B^y$],),
    table.hline(),
    [Quantum
    geometry], [$cal(Q)_(+ -)^(x x)$], [$cal(Q)_(+ -)^(x y)$], [$cal(Z)_(+ -)^(x x)$], [$cal(Z)_(+ -)^(x y)$],
    [Rashba ($B = 0$)], [Zero], [Zero], [Zero], [Nonzero],
    [Rashba ($B eq.not 0$)], [Nonzero], [Zero], [Zero], [Nonzero],
    [X-wave
    ($B = 0$)], [$d_(x^2 - y^2)$], [$d_(x y)$], [Zero], [Nonzero],
    [X-wave ($B eq.not 0$)], [Nonzero], [$d_(x y)$], [Zero], [Nonzero],
  )]
  , kind: table
  )

== Materials
<materials>
We summarize materials realizing $X$-wave magnets \[52, 58\].
Altermagnets have a collinear spin texture \[42, 43\], while $p$-wave
magnets have a spiral spin texture \[44, 150\].

=== $p$-wave magnet
<p-wave-magnet>
It was theoretically proposed that CeNiAsO is a $p$-wave magnet \[45\]
and experimentally realized \[151\]. They were recently realized
experimentally in \[152\] Gd$""_3$Ru$""_4$Al$""_12

$ and in \[153\]
NiI$""_2$. It was also theoretically proposed that a $

p$-wave magnet is
realized in graphene by introducing spin nematic order \[154\].

=== $d$-wave altermagnet
<d-wave-altermagnet>
The $d$-wave magnet in two dimensions was theoretically proposed in
organic materials \[37\], perovskite materials \[39\], and twisted
magnetic Van der Waals bilayers \[155\]. The $d$-wave altermagnet in
three dimensions is experimentally realized in RuO$""_2

$ \[156, 157,
158, 159, 160\], Mn$""_5$Si$""_3$ \[161\], FeSb$""_2$ \[162\],
KV$""_2$Se$""_2$ \[163\].

=== $

f$-wave magnet
<f-wave-magnet>
It was theoretically proposed that an $f$-wave magnet is theoretically
proposed in Ba$""_3$MnNb$""_2$O$""_9

$ \[164\], FePO$""_4$ \[44\] and in
graphene by introducing spin nematic order \[154\].

=== $

g$-wave altermagnet
<g-wave-altermagnet>
A $g$-wave altermagnet in two-dimensions was theoretically proposed in
twisted magnetic Van der Waals bilayers \[155\]. The Fermi surface
splitting of the $g$-wave altermagnet in three dimensions is
experimentally observed in MnTe \[165, 166, 167, 168, 169, 170\], CrSb
\[171, 172, 173, 174, 175\], V$""_(1 \/ 3)$NbS$""_2

$ \[176\] and FeS
\[177\].

=== $

i$-wave altermagnet
<i-wave-altermagnet>
An $i$-wave altermagnet in two dimensions was theoretically proposed in
twisted magnetic Van der Waals bilayers \[155\] and in MnP(S,Se)$""_3

$ \[178\].

= Transport properties of $

X$-wave magnets
<SecXTra>
== Without Rashba interaction
<without-rashba-interaction>
=== Spin current generation
<spin-current-generation>
One of the key feature of the $d$-wave altermagnet is that spin current
is generated without using the~Rashba interaction \[37\]. We
analytically show it.

The current is given
by

$ upright(bold(j)) = - e integral d k f upright(bold(v)) \, $ <currentJ>


where
$f

$ is the Fermi distribution function in the presence of
$upright(bold(E))$\; $

upright(bold(v))

$ is the
velocity,$ upright(bold(v)) = 1 / ℏ frac(partial epsilon, partial upright(bold(k))) \, $ <Velocity>


where
$epsilon

$ is the energy of the Hamiltonian, and we have dropped the
anomalous velocity term proportional to
$- e upright(bold(E)) times upright(bold(Omega)) \/ ℏ$ because the Berry
curvature $

upright(bold(Omega))

$ is zero due to the single band
condition.

We expand the current in terms of electric field $

E

$ as$ j_b = sum_(ell_1 \, ell_2 = 0) sigma^(x^(ell_1) y^(ell_2) \; b) \( E_x \)^(ell_1) \( E_y \)^(ell_2) . $ <Expansion>


Then,
the $\( ell_1 + ell_2 \)$-th order conductivity is defined by



$ sigma^(x^(ell_1) y^(ell_2) \; b) = frac(1, ell_1 ! ell_2 !) frac(partial^(ell_1 + ell_2) j_b, partial E_x^(ell_1) partial E_y^(ell_2)) . $

The
semi-classical Boltzmann equation in the presence of electric field
$upright(bold(E))

$ is given
by$ partial_t f - frac(e upright(bold(E)), ℏ) dot.op nabla_(upright(bold(k))) f = - frac(f - f^((0)), tau) \, $

where
$tau$~is the relaxation time, and $f^((0))

$ is the Fermi distribution
function at the equilibrium with the chemical potential
$mu$,$ f^((0)) = 1 \/ (exp (epsilon - mu) + 1) . $

Corresponding to
Eq.(@Expansion), we expand the Fermi distribution in powers of
$upright(bold(E))$,

$ f = f^((0)) + f^((1)) + dots.h.c . $ <f>


The
recursive solution gives
\[29\]

$ f^((ell_1 + ell_2)) = (frac(e \/ ℏ, i omega + 1 \/ tau))^(ell_1 + ell_2) frac(partial^(ell_1 + ell_2) f^((0)), partial k_x^(ell_1) partial k_y^(ell_2)) \( E_x \)^(ell_1) \( E_x \)^(ell_2) \, $

where
$omega

$ is the frequency of the applied electric field
$upright(bold(E))$. The current (@currentJ) is expanded as in Eq.(@f)
with
$ j_b^((ell_1 + ell_2)) & = - e integral d upright(bold(k)) f^((ell_1 + ell_2)) v_b\
 & = - e / ℏ (frac(e \/ ℏ, i omega + 1 \/ tau))^(ell_1 + ell_2)\
 & #h(2em) quad times integral d upright(bold(k)) thin frac(partial epsilon, partial k_b) frac(partial^(ell_1 + ell_2) f^((0)), partial k_x^(ell_1) partial k_y^(ell_2)) \( E_x \)^(ell_1) \( E_x \)^(ell_2) . $

The
$\( ell_1 + ell_2 \)$-th nonlinear Drude conductivity is defined
by

$ sigma^(x^(ell_1) y^(ell_2) \; b) = (- e \/ ℏ)^(ell_1 + ell_2 + 1) / (i omega + 1 \/ tau)^(ell_1 + ell_2) integral d upright(bold(k)) f^((0)) frac(partial^(ell_1 + ell_2 + 1) epsilon, partial k_x^(ell_1) partial k_y^(ell_2) partial k_b) . $

The
static limit is obtained simply by setting $omega = 0

$ in this equation.

We define the $

ell$-th order spin-dependent Drude conductivity for each
spin $s

$ by the
formula$ sigma_s^(x^(ell_1) y^(ell_2) \; b) = (- e \/ ℏ)^(ell_1 + ell_2 + 1) / (i omega + 1 \/ tau)^(ell_1 + ell_2) integral d upright(bold(k)) thin f_s^((0)) frac(partial^(ell_1 + ell_2 + 1) epsilon_s, partial k_x^(ell_1) partial k_y^(ell_2) partial k_b) . $ <Drude>


This
formula is nontrivial only
when

$ frac(partial^(ell_1 + ell_2 + 1) epsilon_s, partial k_x^(ell_1) partial k_y^(ell_2) partial k_b) eq.not 0 \, $ <BasicCond>


which
leads ~to a conclusion that there is no $ell$-th order nonlinear
spin-Drude conductivity for $ell gt.eq ell_1 + ell_2$. It is necessary
to calculate explicitly the $ell$-th order nonlinear spin-Drude
conductivity for $ell = 0 \, 1 \, dots.h.c \, ell_1 + ell_2 - 1$. In
particular, the choice of $ell = 0$~and $1$~yield the persistent spin
current without electric field and the linear spin conductivity,
respectively.

We define the $\( ell_1 + ell_2 \)$-th order nonlinear spin-Drude
conductivity by


$ sigma_(upright("spin"))^(x^(ell_1) y^(ell_2) \; b) = frac(sigma_arrow.t^(x^(ell_1) y^(ell_2) \; b) - sigma_arrow.b^(x^(ell_1) y^(ell_2) \; b), 2) . $ <spinDr>


On
the other hand, the charge conductivity is given
by

$ sigma_(upright("charge"))^(x^(ell_1) y^(ell_2) \; b) = sigma_arrow.t^(x^(ell_1) y^(ell_2) \; b) + sigma_arrow.b^(x^(ell_1) y^(ell_2) \; b) . $ <ChargeCurre>



The results are summarized in the following Table. Spin current is
generated in linear response only for the $d$-wave altermagnet. The
second-order nonlinear spin current is generated in the $f$-wave magnet,
the third-order nonlinear spin current is generated in the $g$-wave
altermagnet and the fifth-order nonlinear spin current is generated in
the $i$-wave altermagnet \[143\].

#figure(
  align(center)[#table(
    columns: 7,
    align: (center,center,center,center,center,center,center,),
    table.header([], [$s$], [$p$], [$d$], [$f$], [$g$], [$i$],),
    table.hline(),
    [nodes], [0], [1], [2], [3], [4], [6],
    [$ell$], [], [], [linear], [2nd NL], [3rd NL], [5th NL],
    [2D], [None], [None], [$sigma_(upright("spin"))^(y \; x)$], [$sigma_(upright("spin"))^(x x \; y)$], [$sigma_(upright("spin"))^(y y y \; x)$], [$sigma_(upright("spin"))^(y y y y y \; x)$],
    [3D], [None], [None], [$sigma_(upright("spin"))^(y \; x)$], [$sigma_(upright("spin"))^(z y \; x)$], [$sigma_(upright("spin"))^(x x x \; z)$], [$sigma_(upright("spin"))^(y y y y x \; x)$],
  )]
  , kind: table
  )

=== Spin Nernst effects
<spin-nernst-effects>
The spin Nernst effect is an effect that spin current is generated
perpendicularly to the thermal gradient. It is discussed in the $d$-wave
altermagnet \[37\]. So far, there is no analytic result on it, which we
derive.

Tts momentum derivative
reads

$ frac(partial f, partial upright(bold(k))) = frac(partial epsilon (upright(bold(k))), partial upright(bold(k))) frac(partial f, partial epsilon) \, $

while
its spatial derivative
reads

$ frac(partial f, partial upright(bold(r))) = frac(partial T (upright(bold(r))), partial upright(bold(r))) frac(partial f, partial T) . $

We
rewrite the Boltzmann equation
as

$ frac(d f, d t) = & frac(partial f, partial t) + frac(partial upright(bold(k)), partial t) dot.op frac(partial f, partial upright(bold(k))) + frac(partial upright(bold(r)), partial t) dot.op frac(partial f, partial upright(bold(r)))\
= & frac(partial upright(bold(k)), partial t) dot.op (frac(partial epsilon (upright(bold(k))), partial upright(bold(k))) frac(partial f, partial epsilon)) + frac(partial upright(bold(r)), partial t) dot.op (frac(partial T (upright(bold(r))), partial upright(bold(r))) frac(partial f, partial T))\
= & - frac(f - f^((0)), tau) . $

We use the kinetic
equation

$ frac(partial upright(bold(r)), partial t) = & 1 / ℏ frac(partial epsilon (upright(bold(k))), partial upright(bold(k))) \,\
frac(partial upright(bold(k)), partial t) = & 0 \, $

and
obtain

$ 1 / ℏ (frac(partial epsilon (upright(bold(k))), partial upright(bold(k))) dot.op frac(partial T (upright(bold(r))), partial upright(bold(r)))) frac(partial f, partial T) = - frac(f - f^((0)), tau) . $

The
first order expansion
reads

$ 1 / ℏ (frac(partial epsilon (upright(bold(k))), partial upright(bold(k))) dot.op frac(partial T (upright(bold(r))), partial upright(bold(r)))) frac(partial f^((0)), partial T) = - f^((1)) / tau \, $

whose
solution is given
by

$ f^((1)) = - tau / ℏ (frac(partial epsilon (upright(bold(k))), partial upright(bold(k))) dot.op frac(partial T (upright(bold(r))), partial upright(bold(r)))) frac(partial f^((0)), partial T) . $

The
current driven by temperature gradient is given
by

$ j_b = & - e integral d upright(bold(k)) f^((1)) v_b\
= & frac(e tau, ℏ^2) integral d upright(bold(k)) (frac(partial epsilon (upright(bold(k))), partial upright(bold(k))) dot.op frac(partial T (upright(bold(r))), partial upright(bold(r)))) frac(partial epsilon, partial k_b) frac(partial f^((0)), partial T) . $

Especially,
current $j_x

$ and $

j_y

$ flow when the temperature gradient is along the
$x$
axis,$ j_x = e tau integral d upright(bold(k)) (1 / ℏ frac(partial epsilon, partial k_x))^2 frac(partial T (upright(bold(r))), partial x) frac(partial f^((0)), partial T) \, $

which
is known as the Seebeck effect, and


$ j_y = & - e integral d upright(bold(k)) f^((1)) v_y\
= & frac(e tau, ℏ^2) integral d upright(bold(k)) frac(partial epsilon, partial k_x) dot.op frac(partial T (upright(bold(r))), partial x) frac(partial epsilon, partial k_y) frac(partial f^((0)), partial T) \, $

which
is known as the Nernst effect. We assume that the temperature gradient
is linear,

$ T (upright(bold(r))) = a x . $

When
$epsilon (upright(bold(k))) - mu gt.double k_(upright("B")) T (upright(bold(r)))$,
we approximate the Fermi distribution by the Boltzmann
distribution,

$ f = frac(1, exp (frac(epsilon (upright(bold(k))) - mu, k_(upright("B")) T (upright(bold(r))))) + 1) tilde.eq exp (- frac(epsilon (upright(bold(k))) - mu, k_(upright("B")) T (upright(bold(r))))) . $

Then,
the spin Hall conductivity is obtained
as

$ j_s = frac(e tau, ℏ^2) frac(8 e^(mu \/ k_(upright("B")) T) J m pi (2 T - mu), sqrt(1 - 4 J^2 m^2)) $

for
the $d$-wave altermagnet. It is proportional to the coupling constant
$J

$ of the $

X$-wave magnet in the Hamiltonian (@ModelHamil). Hence, it
is possible to detect the sign of $J

$ by the spin Nernst effect. On the
other hand, there is no spin current generation for the other $

X$-wave
magnets.

#figure([#box(image("MTJIllust.svg", width: 48.0%))

  ],
  caption: [
    Illustration of a bilayer magnetic tunneling junction made of
    magnets. (a) Parallel configuration, where the spin directions are
    identical at each lattice site between the two layers. (b)
    Antiparallel configuration, where the spin directions are opposite
    at each lattice site between the two layers. The green arrow
    indicates the tunneling current, which is larger in the parallel
    configuration.
  ]
)
<FigIllustMTJ>

=== Tunneling magnetoresistance
<tunneling-magnetoresistance>
Magnetic tunneling junction is a most successful spintronic device
\[179, 180\]. It consists of the bilayer ferromagnets spaced by an
insulator as shown in Fig.@FigIllustMTJ, where the resistance is low
(large) if the directions of spins are identical (opposite). It is
called the tunneling magnetoresistance (TMR). The spin direction of the
memory can be readout by using the TMR. Tunneling magnetoresistance is
discussed in the $d$-wave altermagnet \[43, 181, 183, 182, 184, 186,
185, 187\] and the $p$-wave magnet \[188\].

The differential conductance $G = d I \/ d V

$ is calculated based on the
Green function
\[188\],$ frac(G, 4 e pi^3) = sum_(s = plus.minus 1) sum_(upright(bold(k))_1 \, upright(bold(k))_2) lr(|T_(upright(bold(k))_1 \, upright(bold(k))_2)|)^2 upright("Tr") [upright("Im") cal(G)_s^(upright("T")) (0 \; upright(bold(k))_1) upright("Im") cal(G)_s^(upright("B")) (0 \; upright(bold(k))_2)] \, $ <G>


where
$cal(G)_s^(upright("T"))

$ ($cal(G)_s^(upright("B"))$) is the retarded
Green function of the top (bottom) layer defined
by$ cal(G)_s^(upright("T")) (omega \; upright(bold(k))) equiv cal(G)_s^(upright("B")) (omega \; upright(bold(k))) equiv cal(G)_s (omega \; upright(bold(k))) $

for
the parallel configuration,
and

$ cal(G)_s^(upright("T")) (omega \; upright(bold(k))) equiv cal(G)_s (omega \; upright(bold(k))) \, quad cal(G)_s^(upright("B")) (omega \; upright(bold(k))) equiv cal(G)_(- s) (omega \; upright(bold(k))) $ <GreenAnti>


for
the antiparallel configuration, where we have
defined

$ cal(G)_s (omega \; upright(bold(k))) equiv frac(1, ℏ omega - epsilon_s + i Gamma) $

with
the self-energy $Gamma

$ and the energy $

epsilon_s$.
Im$cal(G)_s (0 \; upright(bold(k))_1)

$ represents the density of states
depending on the spin $

s$, which is shown in Fig.@FigMTJX\(a) and (b).

The differential conductivity is determined by the overlap of the
density of states Im$cal(G)_s (0 \; upright(bold(k))_1)$, which is shown
in Fig.@FigMTJX\(c) and (d).

The differential conductivity for the parallel configuration is
analytically given by
\[47\]

$ lim_(Gamma arrow.r 0) frac(G_(upright("P")), 4 e pi^3) = frac(2 m pi^2, ℏ^2 Gamma) \, $

while
that for the antiparallel configuration is analytically given
by

$ lim_(Gamma arrow.r 0) frac(G_(upright("AP")), 4 e pi^3) = sqrt(frac(m, 2 mu)) frac(N_X pi^2, ℏ a lr(|J|)) \, $

where
$J

$ is the strength of the $

X$-wave magnet, $Gamma

$ is the self-energy,
$mu$ is the chemical potential, $

a

$ is the lattice constant and $

m

$ is
the mass of electrons. Hence, the TMR ratio is given
by$ lim_(Gamma arrow.r 0) upright("TMR")_(upright("ratio")) equiv lim_(Gamma arrow.r 0) frac(G_(upright("P")) - G_(upright("AP")), G_(upright("AP"))) = frac(2 a lr(|J|) sqrt(2 m mu), N_X ℏ Gamma) . $



It is to be contrasted with the TMR ratio based on ferromagnets, where
it is given
by

$ lim_(Gamma arrow.r 0) upright("TMR")_(upright("ratio")) = frac(2 J^2, Gamma^2) . $

Therefore,
the TMR ratio is larger in ferromagnets for $lr(|J|) > Gamma$. However,
the $X$-wave magnets are expected to achieve high-speed and ultra-dense
memory owing to the zero net magnetization.

#figure([#box(image("MTJX.svg", width: 88.0%))

  ],
  caption: [
    \(a) Spin density

$ chevron.l S_z chevron.r $

 when $J > 0$, and (b) that when $J < 0

$ in
    one layer. Red (blue) color indicates up (down) spin. (c) Overlap
 $

cal(O)_(upright("P"))

$ for the parallel configuration, and (d)
    overlap $

cal(O)_(upright("AP"))

$ for the antiparallel configuration.
    Red color indicates a large overlap.
  ]
)
<FigMTJX>

== With Rashba interaction
<with-rashba-interaction>
=== Anomalous Hall effects
<anomalous-hall-effects>
One of the motivation of studying altermangnets is that the Néel vector
can be readout by measuring anomalous Hall conductivity because
time-reversal symmetry is broken \[189, 158, 190, 161\]. Actually, it is
verified by the density-functional theory and experiments.

The Berry curvature is obtained
as$ Omega_X = - frac(lambda^2 (B + J f_X - J k partial_k f_X), 2 ((B + J f_X)^2 + lambda^2 k^2)^(3 \/ 2)) . $

The
Hall conductivity is calculated
as

$ frac(1, 2 pi) integral Omega_X d upright(bold(k)) = - 1 / 2 upright("sgn") B . $

It
does not depend on $J$. Hence, it is impossible to detect the sign of
$J

$ by measuring the anomalous Hall conductivity based on the two-band
model. It is necessary to introduce the orbital degrees of freedom to
the two-band model.

#figure([#box(image("PlanarIllust.svg", width: 48.0%))

  ],
  caption: [
    Illustration for (a) Hall effect and (b) planar Hall effect. In the
    planar Hall effect, when the electric field is applied along the $

x

$ axis and the magnetic field $

\( B cos Phi \, B sin Phi \, 0 \)

$ is
    applied parallel to the system, the Hall current flows along the $

y

$ axis. The Hall conductivity is predicted to be given by the formula
    (@pHall).
  ]
)
<FigIllust>

=== Planar Hall effects
<planar-hall-effects>
The Hall effect is a prominent phenomenon in two-dimensional materials.
A current flows into a direction perpendicular to the applied electric
field, when the magnetic field is applied perpendicular to the plane, as
illustrated in Fig.@FigIllust\(a). Similarly, a current flows into a
direction perpendicular to the applied electric field, when the magnetic
field is applied parallel to the plane, as illustrated in
Fig.@FigIllust\(b). It is the planar Hall effect \[191, 192, 193, 194,
195, 196, 197\]. The planar Hall effect is discussed in $

d$-wave
altermagnets \[198, 199\].

The planar Hall effect is discussed in the $X$-wage magnet \[46\]. The
Dirac point shifts in the presence of the in-plane magnetic field. The
shifted Dirac point is given by $\( k'_x \, k'_y \) = 0$,
where

$ k'_x = k_x + B_y / lambda \, #h(2em) k'_y = k_y - B_x / lambda \, $

by
solving the
equation

$ lambda (k_x sigma_y - k_y sigma_x) + B_x sigma_x + B_y sigma_y = 0 . $



The Dirac gap is explicitly determined
as

$ Delta = (- 1)^(s_X) B^(N_X) / lambda^(N_X) sin N_X Phi \, $ <sDirac2>


which
leads to the Hall
conductance

$ sigma_(x y) = e^2 / h (- 1)^(s_X) / 2 upright("sgn") (J B^(N_X) / lambda^(N_X) sin N_X Phi) \, $ <pHall>


where
$s_X = 1 \, 1 \, - 1 \, - 1 \, 1

$ for $

X = p, d, f, g, i$,
respectively.

= Acknowledgements
<acknowledgements>
The author is grateful to N. Nagaosa, M. Hirschberger, S. Okumura, Y.
Motome,T. Morimoto, H. Seo, J. Wang and B. J. Yang for helpful
discussions on the subject. This work is supported by CREST, JST (Grants
No. JPMJCR20T2) and Grants-in-Aid for Scientific Research from MEXT
KAKENHI (Grant No. 23H00171).

#heading(level: 1, numbering: none)[Appendices]
<appendices>
= Quantum distance and Abelian quantum geometric tensor
<ApQ>
The Hilbert-Schmidt distance is defined
by

$ (d s_(upright("HS")))^2 equiv 1 - lr(| chevron.l psi_n (upright(bold(k))) \|psi_n (upright(bold(k))) + d upright(bold(k)) chevron.r |)^2 . $

The
wave function is expanded
as

$ & \|psi_n (upright(bold(k)) + d upright(bold(k))) chevron.r \
= & \|psi_n (upright(bold(k))) chevron.r  + \|partial_(k_mu) psi_n (upright(bold(k))) chevron.r  d k_mu\
 & + 1 / 2 \|partial_(k_mu) partial_(k_nu) psi_n (upright(bold(k))) chevron.r  d k_mu d k_nu + dots.h.c . $



The inner product
reads

$ & lr(| chevron.l psi_n (upright(bold(k))) \|psi_n (upright(bold(k))') chevron.r |)^2\
= &  chevron.l psi_n (upright(bold(k))') \|psi_n (upright(bold(k))) chevron.r   chevron.l psi_n (upright(bold(k))) \|psi_n (upright(bold(k))') chevron.r \
= &  chevron.l psi_n (upright(bold(k))) \|psi_n (upright(bold(k))) chevron.r \
 & + ( chevron.l partial_(k_mu) psi_n (upright(bold(k))) \|psi_n (upright(bold(k))) chevron.r  +  chevron.l psi_n (upright(bold(k))) \|partial_(k_mu) psi_n (upright(bold(k))) chevron.r ) d k_mu\
 & + \( 1 / 2  chevron.l partial_(k_mu) partial_(k_nu) psi_n (upright(bold(k))) \|psi_n (upright(bold(k))) chevron.r  + 1 / 2  chevron.l psi_n (upright(bold(k))) \|partial_(k_mu) partial_(k_nu) psi_n (upright(bold(k))) chevron.r \
 & +  chevron.l partial_(k_mu) psi_n (upright(bold(k))) \|psi_n (upright(bold(k))) chevron.r   chevron.l psi_n (upright(bold(k))) \|partial_(k_mu) psi_n (upright(bold(k))) chevron.r  \) d k_mu d k_nu . $


\
The term proportional to $d k_mu

$ is zero
because$  & ( chevron.l partial_(k_mu) psi_n (upright(bold(k))) \|psi_n (upright(bold(k))) chevron.r  +  chevron.l psi_n (upright(bold(k))) \|partial_(k_mu) psi_n (upright(bold(k))) chevron.r )\
= & partial_(k_mu) ( chevron.l psi_n (upright(bold(k))) \|psi_n (upright(bold(k))) chevron.r ) = 0 \, $

where
we have used the normalization condition


$ chevron.l psi_n (upright(bold(k))) \|psi_n (upright(bold(k))) chevron.r  = 1$. By using
the
relation$  & partial_(k_mu) partial_(k_nu) ( chevron.l psi_n (upright(bold(k))) \|psi_n (upright(bold(k))) chevron.r )\
= &  chevron.l partial_(k_mu) partial_(k_nu) psi_n (upright(bold(k))) \|psi_n (upright(bold(k))) chevron.r  +  chevron.l psi_n (upright(bold(k))) \|partial_(k_mu) partial_(k_nu) psi_n (upright(bold(k))) chevron.r \
 & +  chevron.l partial_(k_mu) psi_n (upright(bold(k))) \|partial_(k_nu) psi_n (upright(bold(k))) chevron.r  +  chevron.l partial_(k_nu) psi_n (upright(bold(k))) \|partial_(k_mu) psi_n (upright(bold(k))) chevron.r  \, $

we
have

$ & 1 / 2  chevron.l partial_(k_mu) partial_(k_nu) psi_n (upright(bold(k))) \|psi_n (upright(bold(k))) chevron.r  + 1 / 2  chevron.l psi_n (upright(bold(k))) \|partial_(k_mu) partial_(k_nu) psi_n (upright(bold(k))) chevron.r \
= & - 1 / 2 \(  chevron.l partial_(k_mu) psi_n (upright(bold(k))) \|partial_(k_nu) psi_n (upright(bold(k))) chevron.r \
 & +  chevron.l partial_(k_nu) psi_n (upright(bold(k))) \|partial_(k_mu) psi_n (upright(bold(k))) chevron.r  \) d k_mu d k_nu\
= & -  chevron.l partial_(k_mu) psi_n (upright(bold(k))) \|partial_(k_nu) psi_n (upright(bold(k))) chevron.r  d k_mu d k_nu . $

Then,
the inner product is written
as

$ & lr(| chevron.l psi_n (upright(bold(k))) \|psi_n (upright(bold(k))') chevron.r |)^2\
= & 1 + \(  chevron.l partial_(k_mu) psi_n (upright(bold(k))) \|psi_n (upright(bold(k))) chevron.r   chevron.l psi_n (upright(bold(k))) \|partial_(k_mu) psi_n (upright(bold(k))) chevron.r \
 & -  chevron.l partial_(k_mu) psi_n (upright(bold(k))) \|partial_(k_nu) psi_n (upright(bold(k))) chevron.r  \) d k_mu d k_nu\
= & 1 +  chevron.l partial_(k_mu) psi_n (upright(bold(k)))\| (\|psi_n (upright(bold(k))) chevron.r   chevron.l psi_n (upright(bold(k)))\| - 1) \|partial_(k_mu) psi_n (upright(bold(k))) chevron.r  d k_mu d k_nu \, $

and
the quantum distance reads

$ & (d s_(upright("HS")))^2\
equiv &  chevron.l partial_(k_mu) psi_n (upright(bold(k)))\| (1 - \|psi_n (upright(bold(k))) chevron.r   chevron.l psi_n (upright(bold(k)))\|^2) \|partial_(k_mu) psi_n (upright(bold(k))) chevron.r  d k_mu d k_nu\
= & cal(F)_n^(mu nu) d k_mu d k_nu . $

This is Eq.(@F12) in the main
text.

= Quantum distance and non-Abelian quantum geometric tensor
<ApQ2>
We summarize non-Abelian quantum geometry for the $N$-fold degenerate
wave functions \[3\].

The Hilbert-Schmidt distance is defined
by

$ (d s_(upright("HS")))^2 equiv 1 - lr(| chevron.l u (upright(bold(k))) \|u (upright(bold(k)) + d upright(bold(k))) chevron.r |)^2 . $

where
$\|u (upright(bold(k))) chevron.r

$ is the wave function of $

N$-fold degenerate
bands

$ \|u (upright(bold(k))) chevron.r  = sum_(n = 1)^N c_n \|psi_n (upright(bold(k))) chevron.r  \, $

where


$ sum_(n = 1)^N lr(|c_n|)^2 = 1 . $

The inner product is calculated
as

$ & lr(| chevron.l u (upright(bold(k))) \|u (upright(bold(k)) + d upright(bold(k))) chevron.r |)^2\
= &  chevron.l u (upright(bold(k))) \|u (upright(bold(k))) chevron.r \
 & + ( chevron.l partial_(k_mu) u (upright(bold(k))) \|u (upright(bold(k))) chevron.r  +  chevron.l u (upright(bold(k))) \|partial_(k_mu) u (upright(bold(k))) chevron.r ) d k_mu\
 & + \( 1 / 2  chevron.l partial_(k_mu) partial_(k_nu) u (upright(bold(k))) \|u (upright(bold(k))) chevron.r  + 1 / 2  chevron.l u (upright(bold(k))) \|partial_(k_mu) partial_(k_nu) u (upright(bold(k))) chevron.r \
 & +  chevron.l partial_(k_mu) u (upright(bold(k))) \|u (upright(bold(k))) chevron.r   chevron.l u (upright(bold(k))) \|partial_(k_mu) u (upright(bold(k))) chevron.r  \) d k_mu d k_nu\
= & 1 + \( - 1 / 2  chevron.l partial_(k_mu) u (upright(bold(k))) \|partial_(k_nu) u (upright(bold(k))) chevron.r  - 1 / 2  chevron.l partial_(k_nu) u (upright(bold(k))) \|partial_(k_mu) u (upright(bold(k))) chevron.r \
 & +  chevron.l partial_(k_mu) u (upright(bold(k))) \|u (upright(bold(k))) chevron.r   chevron.l u (upright(bold(k))) \|partial_(k_mu) u (upright(bold(k))) chevron.r  \) d k_mu d k_nu\
= & 1 +  chevron.l partial_(k_mu) u (upright(bold(k)))\| (\|u (upright(bold(k))) chevron.r   chevron.l u (upright(bold(k)))\| - 1) \|partial_(k_mu) u (upright(bold(k))) chevron.r  d k_mu d k_nu . $

Then,
we
have

$ (d s_(upright("HS")))^2 =  chevron.l partial_(k_mu) u (upright(bold(k)))\| (1 - P (upright(bold(k)))) \|partial_(k_mu) u (upright(bold(k))) chevron.r  d k_mu d k_nu \, $

where
$P (upright(bold(k))) equiv \|u (upright(bold(k))) chevron.r   chevron.l u (upright(bold(k)))\|

$ is the projection operator to the $

N$-fold degenerate bands satisyfing
$P (upright(bold(k)))^2 = P (upright(bold(k)))$. By diagonalizing it, we
obtain

$ P (upright(bold(k))) equiv sum_(n = 1)^N \|psi_n (upright(bold(k))) chevron.r   chevron.l psi_n (upright(bold(k)))\| . $

This
is Eq.(@F12Mu) in the main text.

= Hellmann-Feynman theorem
<ApHF>
By differentiating the eigenvalue
equation

$ H \|psi_n (upright(bold(k))) chevron.r  = epsilon_n (upright(bold(k))) \|psi_n (upright(bold(k))) chevron.r $ <EG>


with
respect to $k_mu$, we
obtain

$ & partial_(k_mu) H (upright(bold(k))) \|psi_n (upright(bold(k))) chevron.r  + H (upright(bold(k))) partial_(k_mu) \|psi_n (upright(bold(k))) chevron.r \
= & partial_(k_mu) epsilon_n (upright(bold(k))) \|psi_n (upright(bold(k))) chevron.r  + epsilon_n (upright(bold(k))) partial_(k_mu) \|psi_n (upright(bold(k))) chevron.r  . $

Applying


$ chevron.l psi_m (upright(bold(k)))\|$ to the above equation, we
obtain$  &  chevron.l psi_m (upright(bold(k)))\| partial_(k_mu) H (upright(bold(k))) \|psi_n (upright(bold(k))) chevron.r \
 & +  chevron.l psi_m (upright(bold(k)))\| H (upright(bold(k))) partial_(k_mu) \|psi_n (upright(bold(k))) chevron.r \
= &  chevron.l psi_m (upright(bold(k)))\| partial_(k_mu) epsilon_n (upright(bold(k))) \|psi_n (upright(bold(k))) chevron.r \
 & +  chevron.l psi_m (upright(bold(k)))\| epsilon_n (upright(bold(k))) partial_(k_mu) \|psi_n (upright(bold(k))) chevron.r  . $

Using
(@EG) and defining the velocity


$ v_mu = frac(partial H (upright(bold(k))), ℏ partial k_mu) \, $

we
obtain

$ & ℏ  chevron.l psi_m (upright(bold(k)))\| v_mu \|psi_n (upright(bold(k))) chevron.r \
 & +  chevron.l psi_m (upright(bold(k)))\| epsilon_m (upright(bold(k))) partial_(k_mu) \|psi_n (upright(bold(k))) chevron.r \
= &  chevron.l psi_m (upright(bold(k)))\| partial_(k_mu) epsilon_n (upright(bold(k))) \|psi_n (upright(bold(k))) chevron.r \
 & + epsilon_n (upright(bold(k)))  chevron.l psi_m (upright(bold(k)))\| partial_(k_mu) \|psi_n (upright(bold(k))) chevron.r  \, $

where
we have used the
eigenequation

$ chevron.l psi_m (upright(bold(k)))\| H (upright(bold(k))) =  chevron.l psi_m (upright(bold(k)))\| epsilon_m (upright(bold(k))) . $

This
equation is rewritten
as

$ &  chevron.l psi_m (upright(bold(k)))\| v_mu \|psi_n (upright(bold(k))) chevron.r \
= & 1 / ℏ partial_(k_mu) epsilon_n (upright(bold(k))) chevron.l psi_m (upright(bold(k))) \| psi_n (upright(bold(k))) chevron.r\
 & + 1 / ℏ (epsilon_n (upright(bold(k))) - epsilon_m (upright(bold(k))))  chevron.l psi_m (upright(bold(k)))\| partial_(k_mu) \|psi_n (upright(bold(k))) chevron.r  . $ <Helmann>


It
is Eq.(@HF) in the main text. Assuming that the states satisfy the
orthonormalization condition
$chevron.l psi_m (upright(bold(k))) \| psi_n (upright(bold(k))) chevron.r = delta_(m n)

$ we
find$  &  chevron.l psi_m (upright(bold(k)))\| v_mu \|psi_n (upright(bold(k))) chevron.r \
= & 1 / ℏ (epsilon_n (upright(bold(k))) - epsilon_m (upright(bold(k))))  chevron.l psi_m (upright(bold(k)))\| partial_(k_mu) \|psi_n (upright(bold(k))) chevron.r  \, quad upright("for") quad m eq.not n . $

Indeed,
when $n

$ is the band index, it is obvious that
$chevron.l psi_m (upright(bold(k))) \| psi_n (upright(bold(k))) chevron.r = 0$
for $

m eq.not n$. Furthermore, it is always possible to normalized as
$chevron.l psi_n (upright(bold(k))) \| psi_n (upright(bold(k))) chevron.r = 1

$ at each $

upright(bold(k))$.

By applying $\|psi_m (upright(bold(k))) chevron.r

$ to Eq.(@Helmann) and taking a
sum of $

m$, we
have

$ & sum_m \|psi_m (upright(bold(k))) chevron.r   chevron.l psi_m (upright(bold(k)))\| v_mu \|psi_n (upright(bold(k))) chevron.r \
= & 1 / ℏ partial_(k_mu) epsilon_n (upright(bold(k))) sum_m \|psi_m (upright(bold(k))) chevron.r  chevron.l psi_m (upright(bold(k))) \| psi_n (upright(bold(k))) chevron.r\
 & + 1 / ℏ (epsilon_n (upright(bold(k))) - epsilon_m (upright(bold(k))))\
 & times sum_m \|psi_m (upright(bold(k))) chevron.r   chevron.l psi_m (upright(bold(k)))\| partial_(k_mu) \|psi_n (upright(bold(k))) chevron.r \
= & 1 / ℏ partial_(k_mu) epsilon_n (upright(bold(k))) sum_m \|psi_m (upright(bold(k))) chevron.r  delta_(m n)\
 & + 1 / ℏ (epsilon_n (upright(bold(k))) - epsilon_m (upright(bold(k)))) sum_m \|psi_m (upright(bold(k))) chevron.r   chevron.l psi_m (upright(bold(k)))\| . $

We
have

$ & sum_m \|psi_m (upright(bold(k))) chevron.r   chevron.l psi_m (upright(bold(k)))\| partial_(k_mu) \|psi_n (upright(bold(k))) chevron.r \
= & sum_(m eq.not n) \|psi_m (upright(bold(k))) chevron.r  frac( chevron.l psi_m (upright(bold(k)))\| ℏ v_mu \|psi_n (upright(bold(k))) chevron.r , epsilon_n (upright(bold(k))) - epsilon_m (upright(bold(k)))) . $

for
$m eq.not n$. By using the complete condition
$sum_m \|psi_m (upright(bold(k))) chevron.r   chevron.l psi_m (upright(bold(k)))\| = 1$, we
have

$ partial_(k_mu) \|psi_n (upright(bold(k))) chevron.r  = sum_(m eq.not n) \|psi_m (upright(bold(k))) chevron.r  frac( chevron.l psi_m (upright(bold(k)))\| ℏ v_mu \|psi_n (upright(bold(k))) chevron.r , epsilon_n (upright(bold(k))) - epsilon_m (upright(bold(k)))) . $ <dPsi>


We
use Eq.(@dPsi) to analyze the diagonal component of the quantum
metric

$ cal(F)_(n n)^(mu nu) (upright(bold(k))) = &  chevron.l partial_(k_mu) psi_n (upright(bold(k)))\| cal(Q) (upright(bold(k))) \|partial_(k_nu) psi_n (upright(bold(k))) chevron.r \
= & sum_(m' eq.not n) frac( chevron.l psi_n (upright(bold(k)))\| ℏ v_mu \|psi_(m') (upright(bold(k))) chevron.r , epsilon_n (upright(bold(k))) - epsilon_(m') (upright(bold(k))))  chevron.l psi_(m') (upright(bold(k)))\|\
 & times (1 - sum_(m^('') = 1)^N \|psi_(m^('')) (upright(bold(k))) chevron.r   chevron.l psi_(m^('')) (upright(bold(k)))\|)\
 & times sum_(n' eq.not n) \|psi_(n') (upright(bold(k))) chevron.r  frac( chevron.l psi_(n') (upright(bold(k)))\| ℏ v_nu \|psi_n (upright(bold(k))) chevron.r , epsilon_n (upright(bold(k))) - epsilon_(n') (upright(bold(k)))) . $

We
have

$ &  chevron.l psi_(m') (upright(bold(k)))\| (1 - sum_(m^('') = 1)^N \|psi_(m^('')) (upright(bold(k))) chevron.r   chevron.l psi_(m^('')) (upright(bold(k)))\|) \|psi_(n') (upright(bold(k))) chevron.r \
= & delta_(m' n') - sum_(m^('') = 1)^N delta_(m' m^('')) delta_(m^('') n') = 0 \, $

when
$m^('')

$ is the occupied band,
while$  &  chevron.l psi_(m') (upright(bold(k)))\| (1 - sum_(m^('') = 1)^N \|psi_(m^('')) (upright(bold(k))) chevron.r   chevron.l psi_(m^('')) (upright(bold(k)))\|) \|psi_(n') (upright(bold(k))) chevron.r \
= & delta_(m' n') \, $

when $m^('')

$ is the unoccupied
band.$  & cal(F)_(n n)^(mu nu) (upright(bold(k)))\
= & sum_(m in upright("Unoccupied")) frac( chevron.l psi_n (upright(bold(k)))\| ℏ v_x \|psi_m (upright(bold(k))) chevron.r   chevron.l psi_m (upright(bold(k)))\| ℏ v_y \|psi_n (upright(bold(k))) chevron.r , [epsilon_n (upright(bold(k))) - epsilon_m (upright(bold(k)))]^2) . $

The
quantum metric
reads

$ g_n^(mu nu) = upright("Re") sum_(m in upright("Unoccupied")) frac( chevron.l psi_n (upright(bold(k)))\| ℏ v_x \|psi_m (upright(bold(k))) chevron.r   chevron.l psi_m (upright(bold(k)))\| ℏ v_y \|psi_n (upright(bold(k))) chevron.r , [epsilon_n (upright(bold(k))) - epsilon_m (upright(bold(k)))]^2) \, $

while
the Berry curvature
reads

$ Omega_n^(mu nu) = 2 upright("Im") sum_(m in upright("Unoccupied")) frac( chevron.l psi_n (upright(bold(k)))\| ℏ v_x \|psi_m (upright(bold(k))) chevron.r   chevron.l psi_m (upright(bold(k)))\| ℏ v_y \|psi_n (upright(bold(k))) chevron.r , [epsilon_n (upright(bold(k))) - epsilon_m (upright(bold(k)))]^2) . $



= Bulk photovoltaic effects
<bulk-photovoltaic-effects-1>
We apply alternating~and monochromatic electric
fields,

$ E_x (t) = E_x (omega) e^(- i omega t) + E_x (- omega) e^(i omega t) $ <monochro>


with
$omega > 0$. We assume that the electric field is
real,

$ E_x (t) = E_x^(*) (t) \, $

or

$ E_x (omega) = E_x^(*) (- omega) . $ <Exw>


Excited
electrons from the valence band and the conduction band contribute to
the bulk photovoltaic current.

== Injection currents
<ApInject>
We derive the injection current. We consider an acceleration due to the
static electric field and an optical excitation from the valence band to
the conduction band due to the oscillatory electric field, separately
\[200, 201, 202, 203\]. The equation of motion of electrons
is

$ ℏ frac(d upright(bold(k)), d t) = - e frac(partial upright(bold(A))_0, partial t) \, $

where
$upright(bold(A))_0 = (A_0 \, 0 \, 0)

$ is the vector potential. The
static electric field is obtained from the vector potential
as$ E_x (0) equiv - frac(partial A_0, partial t) \, $

or
$A_0 = - E_x (0) t +$constant. The Bloch velocity under electric field
is given by the minimal
substitution,

$ v_n (k_x) arrow.r v_n (k_x - e A_0 \/ ℏ) . $ <vk>


A comment
is in order. We have only considered the contribution from the static
electric field in the vector potential. Even if we take into account the
contribution from the oscillatory electric field in the vector
potential, the time evolution of the mean momentum does not change. It
is understood as follows. The equation of motion under the oscillatory
electric field
reads

$ ℏ frac(d k, d t) = e E_x (0) + e E_x (omega) cos omega t \, $

whose
solution is given
by

$ k = e / ℏ (t E_x (0) + frac(E_x (omega), omega) sin omega t) + k_0 . $

Its
mean for one period with respect to the time $t$~is zero.~Hence, it is
enough only to consider the static electric field in the vector
potential.

We expand Eq.(@vk) in powers of $E_x (0)$, and
obtain

$ frac(d^2 v_n^x, d t^2) = (e / ℏ)^2 frac(partial^3 omega_n, partial k_x^3) [E_x (0)]^2 \, $

where
we have
used

$ frac(d v_n^x, d t) = frac(d k_x, d t) frac(d v_n^x, d k_x) = - (e / ℏ) frac(partial A_0, partial t) frac(d^2 omega_n, d k_x^2) = e / ℏ frac(d^2 omega_n, d k_x^2) E_x (0) . $

The
current is given
by

$ J = e / V sum_(n \, upright(bold(k))) f_n v_n^x \, $

with the
velocity along the $x

$ direction$ v_n^x equiv frac(partial omega_n, partial k_x) . $

The
injection current originates in $d J^(x \; x^2) \/ d t$. The injection
current is obtained
as

$ frac(d J_(upright("inject"))^(x \; x^2), d t) = e / V sum_n sum_(s = 0)^1 vec(ell - 1, s) frac(d^s f_n, d t^s) frac(d^(1 - s) v_n^x, d t^(1 - s)) . $ <JEll>


The
term proportional to $E_x (omega) E_x (- omega)

$ is given by taking the
terms with $

s = 1

$ from Eq.(@JEll)
as$ frac(d J_(upright("inject"))^(x \; x^2), d t) = e / V sum_n frac(d f_n, d t) v_n^x . $ <JElll>


The
Fermi golden rule
reads

$ frac(d f_plus.minus, d t) = plus.minus frac(2 pi e^2, ℏ^2) lr(|upright(bold(E)) (omega) dot.op upright(bold(a))_(+ -)|)^2 delta (omega_(+ -) - omega) \, $

where


$ upright(bold(E)) (omega) dot.op upright(bold(r))_(+ -)^2 = & lr(|E_x (omega) a_(+ -)^x|)^2 = E_x (omega) a_(+ -)^x E_x^(*) (omega) a_(+ -)^(x *)\
= & - E_x (omega) E_x (- omega) a_(+ -)^x a_(- +)^x \, $

with the use of
the Hermitian condition Eq.(@AHermitian).

Inserting it into Eq.(@JElll), we
have

$ & J_(upright("inject"))^(x \; x^2)\
 & = frac(2 pi e^2, ℏ^2) e / V a_(- +)^x a_(+ -)^x delta (omega_(+ -) - omega)\
 & times frac(partial^3 omega_(+ -), partial k_x^3) E_x (omega) E_x (- omega) . $

By
assuming a monochromic oscillation
$J^(x \; x^2) prop e^(- i omega_0 t)$, we obtain the $ell$-th order
current
$J^(x \; x^ell)$,

$ J_(upright("inject"))^(x \; x^ell) = & frac(1, i omega_0 + 1 \/ tau) frac(2 pi e^3, ℏ^2 V) a_(- +)^x a_(+ -)^x delta (omega_(+ -) - omega)\
 & times frac(partial omega_(+ -), partial k_x) E_x (omega) E_x (- omega) [E_x (0)]^(ell - 2) \, $

where
we have introduced a cutoff by the relaxation time $tau$. When we
concentrate on the direct current component $omega_0 = 0$, it is
proportional to $tau$. The longitudinal component is


$ sigma_(upright("inject"))^(x \; x^2) / sigma_(upright("inject")) = sum_(upright(bold(k))) f_(- +) frac(partial omega_(+ -), partial k_x) a_(- +)^x a_(+ -)^x delta (omega_(+ -) - omega) \, $

with


$ sigma_(upright("inject")) equiv 2 pi V e^3 / ℏ^2 tau . $ <SlInject>


This
is Eq.(@Inject) in the main text.

== Shift currents
<ApShift>
The shift current is induced by the difference of the position between
the valence band and the conduction band when electrons are excited from
the valence band to the conduction band. It induces the electric dipole
$E_x (t) a_(+ - \; x)^x$. Hence, the shift current originates in a
quantum interference \[203\] between the oscillation of $rho_(m n)$~and
the oscillation of the dipole velocity
$E_x a_(n m \; x)^x$,

$ J_(upright("shift"))^(x \; x^2) = - frac(e^2, ℏ V) sum_(upright(bold(k))) E_x a_(+ - \; x)^x rho_(+ -)^((1)) \, $

which
is defined by the interband contributions a$""_(+ - \; x)^x

$ and
$rho_(+ -)^((1)) (t)$.

The density matrix is obtained by solving the von-Neumann equation \[88,
87, 203\],
~$  & frac(partial rho_(m n), partial t) + i omega_(m n) rho_(m n)\
= & frac(e, i ℏ) sum_s E_x (rho_(m l) a_(s n)^x - a_(m s)^x rho_(s n)) - e / ℏ E_x rho_(m n \; x) . $

For
the two-band system, it is rewritten
as

$ i (omega_(+ -) - omega_0) rho_(+ -) = frac(e, i ℏ) E_x a_(+ -)^x (rho_(+ +) - rho_(- -)) - e / ℏ E_x rho_(+ - \; x) \, $

where
we have used a$""_(n n)^x = 0

$ and assumed a monochromatic solution
$rho_(m n) prop e^(- i omega_0 t)$. This definition recovers properly
the definition of the shift current for $

ell = 2$.

The zeroth order solution is given
by

$ rho_plus.minus^((0)) = f_plus.minus \, $

because electric field is
not applied. The first order solution is given
by

$ rho_(+ -)^((1)) & = frac(i e, ℏ (omega_(+ -) - omega_0)) E_x a_(+ -)^x (rho_(+ +)^((0)) - rho_(- -)^((0))) e^(- i omega_0 t)\
 & = frac(i e, ℏ (omega_(+ -) - omega_0)) E_x a_(+ -)^x f_(- +) e^(- i omega_0 t) . $

Especially,
we have $rho_(+ +)^((1)) = 0

$ because $

f_(+ +) equiv f_(+) - f_(+) = 0$.

Hence, the shift current is obtained
as

$ J_(upright("shift"))^(x \; x^2) = & - frac(e^2, ℏ V) sum_(upright(bold(k))) E_x a_(+ - \; x)^x rho_(+ -)^((1))\
= & - frac(e^2, ℏ V) e^(- i omega_0 t) sum_(upright(bold(k))) a_(+ - \; x)^x f_(- +) a_(+ -)^x E_x^l . $

We
use the monochromatic condition (@monochro) and study the direct current
component,

$ J_(upright("shift"))^(x \; x^2) = & sigma_(upright("shift"))^(x \; x^2) (0 \; omega \, - omega \, 0 \, 0 \, dots.h.c \, 0)\
 & times E_x (omega) E_x (- omega) . $

Then, the shift current is
obtained as


$ J_(upright("shift"))^(x \; x^2) = & - frac(e^2, ℏ V) sum_(upright(bold(k))) a_(+ - \; x)^x a_(+ -)^x\
 & times f_(- +) E_x (omega) E_x (- omega) delta (omega_(+ -) - omega) . $

It
is independent of $tau$. The shift conductivity is given by


$ sigma_(upright("shift"))^(x \; x^2) / sigma_(upright("shift")) = 1 / V sum_(upright(bold(k))) f_(- +) a_(+ - \; x)^x a_(+ -)^x delta (omega_(+ -) - omega) \, $

with


$ sigma_(upright("shift")) equiv - e^3 / ℏ^2 . $ <SlShift>


This is
Eq.(@Shift) in the main text.

= Quantum distance and Zeeman quantum geometric tensor
<ApZQ>
The Zeeman quantum geometric tensor $g_(n m)^(mu nu)

$ is defined by the
quantum distance $

d s_(upright("HS"))

$ for the infinitesimal translation
$d upright(bold(k))$ of the momentum as \[108, 109, 110, 111\]
$ d s_(upright("HS")) (upright(bold(k))) equiv sqrt(1 - lr(| chevron.l psi_n (upright(bold(k)))\| U_(d upright(bold(theta))) U_(d upright(bold(k))) \|psi_n (upright(bold(k))) chevron.r |)^2) \, $

where


$ U_(d upright(bold(theta))) equiv e^(- i / 2 d upright(bold(theta)) dot.op upright(bold(sigma))) \, quad U_(d upright(bold(k))) equiv e^(- i d upright(bold(k)) dot.op upright(bold(r))) $

are
the generators of the spin angular momentum $d upright(bold(theta))

$ and
the momentum $

d upright(bold(k))$. By using the
relation

$ & U_(d upright(bold(theta))) U_(d upright(bold(k))) \|psi_n chevron.r \
= & (1 - frac(i sigma_mu, 2) d theta_nu - frac(sigma_mu sigma_nu, 8) d theta_mu d theta_mu dots.h.c)\
 & times (1 + partial_(k_mu) d k_mu + 1 / 2 \|partial_(k_mu) partial_(k_nu) psi_n (upright(bold(k))) chevron.r  d k_mu d k_nu dots.h.c) \|psi_n chevron.r \
= & 1 + 1 / 2 \|partial_(k_mu) partial_(k_nu) psi_n (upright(bold(k))) chevron.r  d k_mu d k_nu\
 & - frac(i sigma_mu, 2) \|psi_n chevron.r  d theta^mu - 1 / 8 \|psi_n chevron.r  d theta^mu d theta^mu - frac(i sigma_nu, 2) partial_(k_mu) \|psi_n chevron.r  d k_mu d theta^nu + dots.h.c \, $

the
quantum distance is given
by

$ (d s_(upright("HS")))^2 = & sum_(n eq.not m) g_(n m)^(mu nu) d k_mu d k_nu + sum_(n eq.not m) s_(n m)^(mu nu) frac(d theta_mu d theta_nu, 4)\
 & + sum_(n eq.not m) (z_(n m)^(mu nu) + z_(m n)^(mu nu)) d k_mu frac(d theta_nu, 2) \, $ <dsZeeman>


where
$g_(n m)^(mu nu)

$ is the quantum metric, $

s_(n m)^(mu nu)

$ is the spin
quantum geometric tensor and $

z_(n m)^(mu nu)

$ is the Zeeman quantum
geometric tensor.

We determine $

z_(n m)^(mu nu)

$ by calculating the coefficient of
$d k_mu frac(d theta_nu, 2)$. The fidelity is calculated
as$  & lr(| chevron.l psi_n (upright(bold(k))) \|psi_n (upright(bold(k)) + d upright(bold(k))) chevron.r |)^2\
= &  chevron.l psi_n (upright(bold(k)) + d) \|psi_n (upright(bold(k))) chevron.r   chevron.l psi_n (upright(bold(k))) \|psi_n (upright(bold(k)) + d) chevron.r \
= &  chevron.l psi_n (upright(bold(k))) \|psi_n (upright(bold(k))) chevron.r  + \(  chevron.l partial_(k_mu) psi_n (upright(bold(k))) \|psi_n (upright(bold(k))) chevron.r \
 & +  chevron.l psi_n (upright(bold(k))) \|partial_(k_mu) psi_n (upright(bold(k))) chevron.r  \) d k_mu\
 & + \( - i / 2  chevron.l partial_(k_mu) psi_n (upright(bold(k))) \|psi_n (upright(bold(k))) chevron.r   chevron.l psi_n (upright(bold(k)))\| sigma_nu \|psi_n (upright(bold(k))) chevron.r \
 & + i / 2  chevron.l psi_n (upright(bold(k)))\| sigma_nu \|psi_n (upright(bold(k))) chevron.r   chevron.l psi_n (upright(bold(k))) \|partial_(k_mu) psi_n (upright(bold(k))) chevron.r \
 & + i / 2  chevron.l partial_(k_mu) psi_n (upright(bold(k)))\| sigma_nu \|psi_n (upright(bold(k))) chevron.r \
 & - i / 2  chevron.l psi_n (upright(bold(k)))\| sigma_nu \|partial_(k_mu) psi_n (upright(bold(k))) chevron.r  \) d k_mu d theta_nu\
= & 1 + i / 2 \(  chevron.l partial_(k_mu) psi_n (upright(bold(k)))\| (1 - P (upright(bold(k)))) sigma_nu \|psi_n (upright(bold(k))) chevron.r \
 & - i / 2  chevron.l psi_n (upright(bold(k)))\| (1 - P (upright(bold(k)))) sigma_nu \|partial_(k_mu) psi_n (upright(bold(k))) chevron.r  \) d k_mu frac(d theta_nu, 2)\
= & 1 + i / 2 \( sum_(m eq.not n)  chevron.l partial_(k_mu) psi_n (upright(bold(k))) \|psi_m (upright(bold(k))) chevron.r   chevron.l psi_m (upright(bold(k)))\| sigma_nu \|psi_n (upright(bold(k))) chevron.r \
 & -  chevron.l psi_n (upright(bold(k)))\| sigma_nu \|psi_m (upright(bold(k))) chevron.r   chevron.l psi_m (upright(bold(k))) \|partial_(k_mu) psi_n (upright(bold(k))) chevron.r  \) d k_mu frac(d theta_nu, 2)\
= & 1 - 1 / 2 sum_(m eq.not n)  chevron.l psi_n (upright(bold(k))) \|partial_(k_mu) psi_m (upright(bold(k))) chevron.r   chevron.l psi_m (upright(bold(k)))\| sigma_nu \|psi_n (upright(bold(k))) chevron.r \
 & +  chevron.l psi_n (upright(bold(k)))\| sigma_nu \|psi_m (upright(bold(k))) chevron.r   chevron.l psi_m (upright(bold(k))) \|partial_(k_mu) psi_n (upright(bold(k))) chevron.r  d k_mu frac(d theta_nu, 2)\
= & 1 - 1 / 2 sum_(m eq.not n) (a_(n m)^mu s_(m n)^nu + s_(n m)^nu a_(m n)^mu) d k_mu frac(d theta_nu, 2) \, $

where
we have used Eq.(@WZa). By comparing it to Eq.(@dsZeeman), we
obtain

$ z_(n m)^(mu nu) = a_(n m)^mu s_(m n)^nu \, $

 which is the Zeeman
geometric tensor. This is Eq.(@Zz12) in the main text.

We calculate $s_(n m)^(mu nu)

$ as$  & lr(| chevron.l psi_n (upright(bold(k))) \|psi_n (upright(bold(k))') chevron.r |)^2\
= &  chevron.l psi_n (upright(bold(k))') \|psi_n (upright(bold(k))) chevron.r   chevron.l psi_n (upright(bold(k))) \|psi_n (upright(bold(k))') chevron.r \
= & ( chevron.l psi_n (upright(bold(k)))\| +  chevron.l psi_n (upright(bold(k)))\| frac(i sigma_mu, 2) d theta^mu + dots.h.c) \|psi_n (upright(bold(k))) chevron.r \
 &  chevron.l psi_n (upright(bold(k))) \|(\|psi_n (upright(bold(k))) chevron.r  + frac(i sigma_mu, 2) \|psi_n (upright(bold(k))) chevron.r  d theta^(mu nu) + dots.h.c) chevron.r \
= &  chevron.l psi_n (upright(bold(k))) \|psi_n (upright(bold(k))) chevron.r \
 & + (i / 2  chevron.l psi_n (upright(bold(k)))\| sigma_mu \|psi_n (upright(bold(k))) chevron.r  - frac(i sigma_mu, 2)  chevron.l psi_n (upright(bold(k)))\| sigma_mu \|psi_n (upright(bold(k))) chevron.r ) d theta^mu\
 & + \( - 1 / 4  chevron.l psi_n (upright(bold(k)))\| sigma_mu \|psi_n (upright(bold(k))) chevron.r   chevron.l psi_n (upright(bold(k)))\| sigma_nu \|psi_n (upright(bold(k))) chevron.r  \) d theta^mu d theta^nu\
= & 1 + 1 / 4  chevron.l psi_n (upright(bold(k)))\| sigma_mu \|psi_n (upright(bold(k))) chevron.r   chevron.l psi_n (upright(bold(k)))\| sigma_nu \|psi_n (upright(bold(k))) chevron.r  \) d theta^mu d theta^nu $

Then,
we
have

$ s_(n m)^(mu nu) equiv s_(n m)^mu s_(m n)^nu $

with

$ s_(n m)^mu equiv  chevron.l psi_n (upright(bold(k)))\| sigma_mu \|psi_n (upright(bold(k))) chevron.r  . $

is
the spin geometric tensor. This is Eq.(@SGT) in the main text.

= Zeeman quantum geometry induced intrinsic cross responses
<ApCrossRes>
== Hall current and AC Hall current
<hall-current-and-ac-hall-current>
Inserting the density matrix (@Rho1) to Eq.(@Jab) and assuming
$omega lt.double epsilon_(m n)$, the current is calculated
as

$ J^(mu \; nu) = & 1 / 2 sum_(n m) sum_(omega_1 = plus.minus omega) integral d upright(bold(k)) v_(n m)^mu f_(n m) a_(m n)^nu frac(E^nu e^(- i omega_1 t), ℏ omega_1 - epsilon_(m n) + i eta)\
= & 1 / 2 sum_(n m) sum_(omega_1 = plus.minus omega) integral d upright(bold(k)) f_(n m) i epsilon_(n m) a_(n m)^mu a_(m n)^nu frac(E^nu e^(- i omega_1 t), ℏ omega_1 - epsilon_(m n) + i eta) . $ <JabA>


We
assume the off-resonant condition


$ ℏ omega_1 - epsilon_(m n) eq.not 0 . $

Then, we can expand the
denominator in Eq.(@JabA)


$ frac(1, ℏ omega_1 - epsilon_(m n) + i eta) = - sum_(j = 1)^oo omega^(j - 1) / epsilon_(m n)^j . $

By
using it, we
obtain

$ J^(mu \; nu) = & - 1 / 2 sum_(n m) sum_(omega_1 = plus.minus omega) integral d upright(bold(k)) f_(n m) i epsilon_(n m) a_(n m)^mu a_(m n)^nu\
 & times E^nu e^(- i omega_1 t) sum_(j = 1)^oo omega_1^(j - 1) / epsilon_(m n)^j\
= & 1 / 2 sum_(n m) sum_(omega_1 = plus.minus omega) integral d upright(bold(k)) f_(n m) i a_(n m)^mu a_(m n)^nu E^nu e^(- i omega_1 t) sum_(j = 0)^oo omega_1^j / epsilon_(m n)^j\
= & 1 / 2 integral d upright(bold(k)) sum_(n > m) sum_(omega_1 = plus.minus omega) sum_(j = 0)^oo f_(n m)\
 & times i [a_(n m)^mu a_(m n)^nu - a_(m n)^mu a_(n m)^nu] omega_1^(2 j) / epsilon_(m n)^(2 j) E^nu e^(- i omega_1 t)\
 & + i [a_(n m)^mu a_(m n)^nu + a_(m n)^mu a_(n m)^nu] omega_1^(2 j + 1) / epsilon_(m n)^(2 j + 1) E^nu e^(- i omega_1 t) \, $

where
we have used the relations


$ f_(n m) equiv f_n - f_m = - f_(m n) \, $

and

$ epsilon_(n m) equiv epsilon_n - epsilon_m = - epsilon_(m n) . $

By
taking the sum of $omega_1 = plus.minus omega$, we
obtain

$ J^(mu \; nu) = & integral d upright(bold(k)) sum_(n > m) sum_(j = 0)^oo f_(n m) \[Omega_(n m)^(mu nu) omega^(2 j) / epsilon_(m n)^(2 j) E^nu cos omega t\
 & + 2 g_(n m)^(mu nu) omega^(2 j + 1) / epsilon_(m n)^(2 j + 1) E^nu sin omega t\]\
= & integral d upright(bold(k)) sum_(n > m) f_(n m) \[Omega_(n m)^(mu nu) frac(1, 1 - (omega \/ epsilon_(m n))^2) E^nu cos omega t\
 & + 2 g_(n m)^(mu nu) frac(omega \/ epsilon_(m n), 1 - (omega \/ epsilon_(m n))^2) E^nu sin omega t\] . $

Only
the order of $Omega^0

$ and $

Omega

$ are valid in the linear response
theory. Then, we obtain the
current$ J^(mu \; nu) / E^nu = integral d upright(bold(k)) sum_(n > m) f_(n m) [Omega_(n m)^(mu nu) + 2 g_(n m)^(mu nu) omega / epsilon_(m n) sin omega t] \, $

which
is Eq.(@JE) in the main text.

In the static limit $Omega = 0$, it recovers the TKNN
formula

$ J^(mu nu) = integral d upright(bold(k)) sum_(n > m) f_(n m) Omega_(n m)^(mu nu) E^nu . $



== Intrinsic gyrotropic magnetic current
<intrinsic-gyrotropic-magnetic-current>
The current under external magnetic field is calculated
as

$ J^(mu \; nu) = & - frac(g mu_(upright("B")), 2) sum_(n m) sum_(omega_1 = plus.minus omega) integral d upright(bold(k)) v_(n m)^mu frac(f_(n m) s_(m n)^nu B^nu e^(- i omega_1 t), ℏ omega_1 - epsilon_(m n) + i eta)\
= & g mu_(upright("B")) integral d upright(bold(k)) sum_(n > m) f_(n m) \[cal(Z)_(n m)^(mu nu) frac(1, 1 - (omega \/ epsilon_(m n))^2)\
 & + 2 cal(Q)_(n m)^(mu nu) frac(omega \/ epsilon_(m n), 1 - (omega \/ epsilon_(m n))^2) sin omega t\] B^nu . $

It
is

$ J^(mu \; nu) = g mu_(upright("B")) integral d upright(bold(k)) sum_(n > m) f_(n m) [cal(Z)_(n m)^(mu nu) cos omega t + 2 cal(Q)_(n m)^(mu nu) omega / epsilon_(m n) sin omega t] B^nu . $

up
to the linear order in $omega$, which is Eq.(@JB) in the main text.

== Intrinsic electric field induced spin density
<intrinsic-electric-field-induced-spin-density>
The spin polarization under external electric field is calculated
as

$ S^mu = & 1 / 2 sum_(n m) sum_(omega_1 = plus.minus omega) integral d upright(bold(k)) s_(n m)^mu f_(n m) r_(m n)^nu frac(E^nu e^(- i omega_1 t), ℏ omega_1 - epsilon_(m n) + i eta)\
= & - integral d upright(bold(k)) sum_(n > m) f_(n m) \[frac(2 cal(Q)_(n m)^(nu mu), epsilon_(m n)) frac(1, 1 - (omega \/ epsilon_(m n))^2)\
 & + cal(Z)_(n m)^(nu mu) frac(omega \/ epsilon_(m n)^2, 1 - (omega \/ epsilon_(m n))^2) sin omega t\] E^nu . $

It
is

$ & S^mu\
= & - integral d upright(bold(k)) sum_(n > m) f_(n m) [frac(2 cal(Q)_(n m)^(nu mu), epsilon_(m n)) cos omega t + cal(Z)_(n m)^(nu mu) omega / epsilon_(m n)^2 sin omega t] E^nu . $

up
to the linear order in $omega$, which is Eq.(@SE) in the main text.

== Intrinsic magnetic field induced spin density
<intrinsic-magnetic-field-induced-spin-density>
The spin polarization under external magnetic field is calculated
as

$ S^(mu \; nu) = & - frac(g mu_(upright("B")), 2) sum_(omega_1 = plus.minus omega) integral d upright(bold(k)) s_(n m)^mu frac(f_(n m) s_(m n)^nu B^nu e^(- i omega_1 t), ℏ omega_1 - epsilon_(m n) + i eta)\
= & g mu_(upright("B")) integral d upright(bold(k)) sum_(n > m) f_(n m) \[cal(S)_(n m)^(mu nu) / epsilon_(m n) frac(1, 1 - (omega \/ epsilon_(m n))^2) B^nu\
 & + 2 cal(A)_(n m)^(mu nu) frac(omega \/ epsilon_(m n)^2, 1 - (omega \/ epsilon_(m n))^2) B^nu sin omega t\] . $

It
is

$ & S^(mu \; nu)\
= & g mu_(upright("B")) integral d upright(bold(k)) sum_(n > m) f_(n m) [cal(S)_(n m)^(mu nu) / epsilon_(m n) cos omega t + 2 cal(A)_(n m)^(mu nu) omega / epsilon_(m n)^2 sin omega t] B^nu $

up
to the linear order in $omega$, which is Eq.(@SB) in the main text.

= Zeeman quantum geometry for two-band systems
<ApZQ2>
== Zeeman Berry curvature
<zeeman-berry-curvature>
By inserting $n = +

$ and $

m = -

$ in Eq.(@Zab), we
obtain$ cal(Z)_(+ -)^(x x) = & i (r_(+ -)^x s_(- +)^x - r_(- +)^x s_(+ -)^x)\
= & frac(partial theta, partial k_x) cos theta cos phi.alt - frac(partial phi.alt, partial k_x) sin theta sin phi.alt = frac(partial n_x, partial k_x) \,\
cal(Z)_(+ -)^(y y) = & i (r_(+ -)^y s_(- +)^y - r_(- +)^y s_(+ -)^y)\
= & frac(partial theta, partial k_y) cos theta sin phi.alt + frac(partial phi.alt, partial k_y) cos theta sin phi.alt = frac(partial n_y, partial k_y) \,\
cal(Z)_(+ -)^(x y) = & i (r_(+ -)^x s_(- +)^y - r_(- +)^x s_(+ -)^y)\
= & frac(partial theta, partial k_x) cos theta sin phi.alt + frac(partial phi.alt, partial k_x) sin theta cos phi.alt = frac(partial n_y, partial k_x) \,\
cal(Z)_(+ -)^(y x) = & i (r_(+ -)^y s_(- +)^x - r_(- +)^y s_(+ -)^x)\
= & frac(partial theta, partial k_y) cos theta cos phi.alt - frac(partial phi.alt, partial k_y) sin theta sin phi.alt = frac(partial n_x, partial k_y) \,\
cal(Z)_(+ -)^(x z) = & i (r_(+ -)^x s_(- +)^z - r_(- +)^x s_(+ -)^z)\
= & - frac(partial theta, partial k_x) sin theta = frac(partial n_z, partial k_x) \,\
cal(Z)_(+ -)^(y z) = & i (r_(+ -)^y s_(- +)^z - r_(- +)^y s_(+ -)^z)\
= & - frac(partial theta, partial k_y) sin theta = frac(partial n_z, partial k_y) . $

They
are summarized
as

$ cal(Z)_(+ -)^(mu nu) = - cal(Z)_(- +)^(mu nu) = frac(partial n_nu, partial k_mu) . $

This
is Eq.(@Z) in the main text.

== Zeeman quantum metric
<zeeman-quantum-metric>
The expectation value of the
spin

$ s_(n m)^mu equiv  chevron.l psi_n (upright(bold(k)))\| sigma_mu \|psi_m (upright(bold(k))) chevron.r $

is
calculated as

$ s_(- +)^x = & - i sin phi.alt + cos theta cos phi.alt \,\
s_(- +)^y = & i cos phi.alt + cos theta sin phi.alt \,\
s_(- +)^z = & - sin theta . $

By inserting $n = +

$ and $

m = -

$ in
Eq.(@Qab), we
obtain$ cal(Q)_(+ -)^(x x) = & frac(r_(+ -)^x s_(- +)^x + r_(- +)^x s_(+ -)^x, 2)\
= & - frac(sin phi.alt, 2) frac(partial theta, partial k_x) - frac(cos phi.alt, 2) sin theta cos theta frac(partial phi.alt, partial k_x)\
= & 1 / 2 (n_y frac(partial n_z, partial k_x) - n_z frac(partial n_y, partial k_x) -) \,\
cal(Q)_(+ -)^(y y) = & frac(r_(+ -)^y s_(- +)^y + r_(- +)^y s_(+ -)^y, 2)\
= & frac(cos phi.alt, 2) frac(partial theta, partial k_y) - frac(sin phi.alt, 2) sin theta cos theta frac(partial phi.alt, partial k_y)\
= & 1 / 2 (n_z frac(partial n_x, partial k_y) - n_x frac(partial n_z, partial k_y)) \,\
cal(Q)_(+ -)^(x y) = & frac(r_(+ -)^x s_(- +)^y + r_(- +)^x s_(+ -)^y, 2)\
= & frac(cos phi.alt, 2) frac(partial theta, partial k_x) - frac(sin phi.alt, 2) sin theta cos theta frac(partial phi.alt, partial k_x)\
= & 1 / 2 (n_z frac(partial n_x, partial k_x) - n_x frac(partial n_z, partial k_x)) \,\
cal(Q)_(+ -)^(y x) = & frac(r_(+ -)^y s_(- +)^x + r_(- +)^y s_(+ -)^x, 2)\
= & frac(cos phi.alt, 2) frac(partial theta, partial k_y) - frac(sin phi.alt, 2) sin theta cos theta frac(partial phi.alt, partial k_y)\
= & 1 / 2 (n_y frac(partial n_z, partial k_y) - n_z frac(partial n_y, partial k_y)) \,\
cal(Q)_(+ -)^(x z) = & frac(sin^2 theta, 2) frac(partial phi.alt, partial k_x) = 1 / 2 (n_x frac(partial n_y, partial k_x) - n_y frac(partial n_x, partial k_x)) \,\
cal(Q)_(+ -)^(y z) = & frac(sin^2 theta, 2) frac(partial phi.alt, partial k_y) = 1 / 2 (n_x frac(partial n_y, partial k_y) - n_y frac(partial n_x, partial k_y)) \, $

where
we have used the
relations

$ frac(partial n_x, partial k_mu) = & cos theta cos phi.alt frac(partial theta, partial k_mu) - sin theta sin phi.alt frac(partial phi.alt, partial k_mu) \,\
frac(partial n_y, partial k_mu) = & cos theta sin phi.alt frac(partial theta, partial k_mu) + sin theta cos phi.alt frac(partial phi.alt, partial k_mu) \,\
frac(partial n_z, partial k_mu) = & - sin theta frac(partial theta, partial k_mu) . $

They
are summarized
as

$ cal(Q)_(+ -)^(mu nu) = 1 / 2 epsilon_(nu rho sigma) n_rho frac(partial n_sigma, partial k_mu) . $

This
is Eq.(@Q) in the main text.

== Spin quantum geometry
<spin-quantum-geometry>
By inserting $n = +

$ and $

m = -

$ in Eq.(@SGT), we obtain the diagonal
components,$ s_(+ -)^(x x) = & s_(+ -)^x s_(- +)^x = 1 / 4 (3 + cos 2 theta - 2 cos 2 phi.alt sin^2 theta)\
= & n_y^2 + n_z^2 = 1 - n_x^2 \,\
s_(+ -)^(y y) = & s_(+ -)^y s_(- +)^y = 1 / 4 (3 + cos 2 theta + 2 cos 2 phi.alt sin^2 theta)\
= & n_x^2 + n_z^2 = 1 - n_y^2 \,\
s_(+ -)^(z z) = & s_(+ -)^z s_(- +)^z = sin^2 theta = 1 - n_z^2 . $

They
are summarized as

$ s_(+ -)^(mu mu) = 1 - n_mu^2 . $ <Sigma1>


We also
obtain the off-diagonal components,


$ s_(+ -)^(x y) = & i cos theta - sin^2 theta sin phi.alt cos phi.alt\
= & i n_z - n_x n_y \,\
s_(+ -)^(y x) = & - i cos theta - sin^2 theta sin phi.alt cos phi.alt\
= & - i n_z - n_x n_y = (s_(+ -)^(x y))^(*) \,\
s_(+ -)^(x z) = & - sin theta (i sin phi.alt cos theta + cos phi.alt)\
= & - i n_y - n_z n_x \,\
s_(+ -)^(y z) = & sin theta (+ i cos phi.alt - cos theta sin phi.alt)\
= & i n_x - n_z n_y . $

They are summarized
as

$ s_(+ -)^(mu nu) = i epsilon_(mu nu rho) n_rho - n_mu n_nu $ <Sigma2>


for
$mu eq.not nu$. Eqs.(@Sigma1) and (@Sigma2) are summarized
as

$ s_(+ -)^(mu nu) = delta_(mu nu) + i epsilon_(mu nu rho) n_rho - n_mu n_nu . $



The spin quantum metric (@SQGT) is given
by

$ cal(S)_(+ -)^(mu nu) = delta_(mu nu) - n_mu n_nu . $

This is Eq.(@S)
in the main text.

The spin Berry curvature (@SBerry) is given
by

$ cal(A)_(+ -)^(mu nu) = - 2 epsilon_(mu nu rho) n_rho . $

This is
Eq.(@A) in the main text.

= Zeeman geometry induced cross reponses in X-wave magnets
<ApCross>
We evaluate whether there is a response by integrating the Zeeman
quantum geometric quantities $cal(Z)_(+ -)^(mu nu)

$ and
$cal(Q)_(+ -)^(mu nu)$. It is determined by the integration over
$phi.alt$.

1) $

J^(x \; x) \/ E^x$

$cal(Z)_(+ -)^(x x)

$ is expanded as$  & cal(Z)_(+ -)^(x x)\
= & frac(lambda^3 k_x k_y, (lambda^2 k^2 + B^2)^(3 \/ 2))\
 & + J lambda k_y (- frac(3 B lambda^2 k_x f_X, (lambda^2 k^2 + B^2)^(5 \/ 2)) + frac(B partial_(k_x) f_X, (lambda^2 k^2 + B^2)^(3 \/ 2))) $

up
to the first order in $J$. The integration is


$ integral cal(Z)_(+ -)^(x x) d phi.alt = 0 $

for
$f_X = k^(N_X) cos N_X phi.alt$, and $f_X = k^(N_X) sin N_X phi.alt

$ with all $

N_X$. Hence there is no response $J^(x \; x) \/ E^x$.

2) $J^(y \; y) \/ E^y$

$cal(Z)_(+ -)^(y y)

$ is expanded as$  & cal(Z)_(+ -)^(y y)\
= & - frac(lambda^3 k_x k_y, (lambda^2 k^2 + B^2)^(3 \/ 2))\
 & + J lambda k_x (frac(3 B lambda^2 k_y f_X, (lambda^2 k^2 + B^2)^(5 \/ 2)) - frac(B partial_(k_y) f_X, (lambda^2 k^2 + B^2)^(3 \/ 2))) $

up
to the first order in $J$. The integration is


$ integral cal(Z)_(+ -)^(y y) d phi.alt = 0 $

for
$f_X = k^(N_X) cos N_X phi.alt$, and $f_X = k^(N_X) sin N_X phi.alt

$ with all $

N_X$. Hence there is no response $J^(y \; y) \/ E^y$.

3) $J^(x \; y) \/ E^y$

$cal(Z)_(+ -)^(x y)

$ is expanded
as$ cal(Z)_(+ -)^(x y) & = frac(lambda (lambda^2 k_y^2 + B^2), (lambda^2 k^2 + (B + J f_X)^2)^(3 \/ 2))\
 & + J lambda (- frac(3 B (lambda^2 k_y^2 + B^2) f_X, (lambda^2 k^2 + B^2)^(5 \/ 2)) + B frac(2 f_X - k_x partial_(k_y) f_X, (lambda^2 k^2 + B^2)^(3 \/ 2))) $

up
to the first order in $J$. It is nonzero for all $N_X

$ due to the first
term.

4) $

cal(S)^(x \; x) \/ E^x

$ We show that $

cal(S)^(x \; x) \/ E^x

$ is nonzero only for the
$d_(x^2 - y^2)$-wave altermagnet. We have
$cal(S)^(x \; x) \/ E^x eq.not 0$ only for $

d' = d_(x^2 - y^2)

$ as in
shown as follows. $

cal(Q)_(+ -)^(x x) \/ epsilon_(m n)

$ is expanded
as$ cal(Q)_(+ -)^(x x) / epsilon_(m n) = & - frac(lambda B, 2 (lambda^2 k^2 + B^2)^(3 \/ 2)) - frac(J lambda^2 k^2 (f_X - k_x partial_(k_x) f_X), 2 (lambda^2 k^2 + B^2)^(5 \/ 2))\
 & + frac(J B^2 (2 f_X + k_x partial_(k_x) f_X), 2 (lambda^2 k^2 + B^2)^(5 \/ 2)) $

up
to the first order in $J$.

First, we consider the case with $J = 0$,
where

$ cal(Q)_(+ -)^(x x) / epsilon_(m n) = - frac(lambda B, 2 (lambda^2 k^2 + B^2)^(3 \/ 2)) . $


We
have

$ integral_0^oo k d k integral cal(Q)_(+ -)^(x x) / epsilon_(m n) d phi.alt = - frac(B, 2 lr(|B|) lambda) . $

Hence,
there is nonzero response in the presence of nonzero $B$.

Next, we consider the case with $B = 0$,
where

$ cal(Q)_(+ -)^(x x) / epsilon_(m n) = - frac(J lambda^2 k^2 (f_X - k_x partial_(k_x) f_X), 2 (lambda^2 k^2 + B^2)^(5 \/ 2)) . $

By
using


$ partial_(k_x) = & cos phi.alt partial_k - frac(sin phi.alt, k) partial_phi.alt \,\
partial_(k_y) = & sin phi.alt partial_k + frac(cos phi.alt, k) partial_phi.alt \, $

we
have

$ & f_X - k_x partial_(k_x) f_X\
= & f_X - k cos phi.alt (cos phi.alt partial_k f_X - frac(sin phi.alt, k) partial_phi.alt f_X) . $

For
$f_X = k^(N_X) cos N_X phi.alt$, we
have

$ & f_X - k_x partial_(k_x) f_X = & - k^(N_X) / 2 \( N_X cos (N_X - 2) phi.alt\
 & + (N_X - 2) cos N_X phi.alt \) . & $

It is nonzero only for
$N_X = 2$. It is nonzero contribution only for the $d_(x^2 - y^2)$-wave
altermagnet. For $f_X = k^(N_X) sin N_X phi.alt$, we also
have

$ & f_X - k_x partial_(k_x) f_X = & - k^(N_X) / 2 \( N_X sin (N_X - 2) phi.alt\
 & + (N_X - 2) sin N_X phi.alt \) \, & $

which is zero for all $N_X$. It
leads
to

$ S^(x \; x) / E^x = & - integral d^2 k f_(+ -) frac(2 cal(Q)_(+ -)^(x x), epsilon_(+ -))\
= & - 2 pi J m sqrt(m (m lambda^2 + 2 mu)) upright("sgn") (lambda)\
 & - frac(pi B, 2 lambda^3) (B J + lambda^2)\
 & + B ln frac(B^2 + 2 m lambda^2 {m lambda^2 + mu - M}, B^2 + 2 m lambda^2 {m lambda^2 + mu + M}) $

with

$ M equiv sqrt((m lambda^2)^2 + 2 mu m lambda^2 + B^2) $

up
to the first order in $J$. For $B = 0$, we
obtain

$ S^x / E^x = - frac(2 m J pi, lambda) . $

It is nonzero even for
$B = 0$.

5) $cal(S)^(y \; y) \/ E^y

$ We show that $

cal(S)^(y \; y) \/ E^y

$ is nonzero only for the
$d_(x y)$-wave altermagnet. We have $

cal(S)^(y \; y) \/ E^y eq.not 0

$ only for $

d' = d_(x y)

$ as in shown as follows.
$cal(Q)_(+ -)^(y y) \/ epsilon_(m n)$ is expanded
as$ cal(Q)_(+ -)^(y y) / epsilon_(m n) = & - frac(lambda B, 2 (lambda^2 k^2 + B^2)^(3 \/ 2)) + frac(J lambda^2 k^2 (f_X - k_y partial_(k_y) f_X), 2 (lambda^2 k^2 + B^2)^(5 \/ 2))\
 & + frac(J B^2 (2 f_X + k_y partial_(k_y) f_X), 2 (lambda^2 k^2 + B^2)^(5 \/ 2)) $

up
to the first order in $J$. As in the case of $cal(Q)_(+ -)^(x x)$, there
is nonzero response for $B eq.not 0$.

We consider the case with $B = 0$,
where

$ cal(Q)_(+ -)^(y y) / epsilon_(m n) = frac(J lambda^2 k^2 (f_X - k_y partial_(k_y) f_X), 2 (lambda^2 k^2 + B^2)^(5 \/ 2)) . $

For
$f_X = k^(N_X) cos N_X phi.alt$, we
have

$ f_X - k_x partial_(k_x) f_X = & k^(N_X) / 2 \( N_X sin (N_X - 2) phi.alt\
 & + N_X sin N_X phi.alt + 2 cos N_X phi.alt \) . $

On the other hand,
for $f_X = k^(N_X) sin N_X phi.alt$, we have


$ f_X - k_x partial_(k_x) f_X = & - k^(N_X) / 2 \( N_X cos (N_X - 2) phi.alt\
 & + N_X cos N_X phi.alt - 2 sin N_X phi.alt \) \, $

which is nonzero
only for $N_X = 2

$ because
$ integral (f_X - k_x partial_(k_x) f_X) d phi.alt = - 2 k^2 pi delta_(N_X \, 2) . $

It
leads
to

$ S^(y \; y) / E^x = & - integral d^2 k f_(+ -) frac(2 cal(Q)_(+ -)^(y y), epsilon_(+ -))\
= & - 2 pi J m sqrt(m (m lambda^2 + 2 mu)) upright("sgn") (lambda)\
 & - frac(pi B, 2 lambda^3) (B J + lambda^2)\
 & + B ln frac(B^2 + 2 m lambda^2 {m lambda^2 + mu - M}, B^2 + 2 m lambda^2 {m lambda^2 + mu + M}) $

Hence,
we have nonzero contribution only for the $d_(x y)$-wave altermagnet.

6) $cal(S)^(x \; y) \/ E^y

$ We show that $

cal(S)^(x \; y) \/ E^y

$ is nonzero only for the
$d_(x y)$-wave altermagnet. $

cal(Q)_(+ -)^(x y)

$ is expanded as
$ cal(Q)_(+ -)^(x y) = frac(lambda k_y J partial_(k_x) f_X, 2 (lambda^2 k^2 + B^2)^(3 \/ 2)) $

up
to the first order in $J$. It is evaluated as follows. The numerator of
$cal(Q)_(+ -)^(x y)

$ reads

$ k_y partial_(k_x) f_X = N k^(N_X) cos (N_X - 1) phi.alt sin phi.alt $

for
$f_X = k^(N_X) cos N_X phi.alt$, whose integration over $phi.alt

$ is
zero,$ integral k_y partial_(k_x) f_X d phi.alt = 0 . $

We also
have

$ k_y partial_(k_x) f_X = N k^(N_X) sin (N_X - 1) phi.alt sin phi.alt \, $

for
$f_X = k^(N_X) sin N_X phi.alt$, whose integration over $phi.alt

$ is
obtained
as$ integral k_y partial_(k_x) f_X d phi.alt = - 2 k^2 pi delta_(N_X \, 2) . $

Then,
we have the static electric-field induced spin
polarization

$ S^(x \; y) / E^y = & - integral d^2 k f_(+ -) frac(2 cal(Q)_(+ -)^(x y), epsilon_(+ -))\
= & - frac(J pi, lambda^3) sum_(eta = plus.minus) eta frac(2 (B^2 + m lambda^2 (m lambda^2 + mu + eta M)), sqrt(B^2 + 2 m lambda^2 (m lambda^2 + mu + eta M))) $

up
to the first order in $J$. For $B = 0$, it is simplified
as

$ S^x / E^y = - frac(2 m J pi, lambda) $

for $mu > 0$. Hence,
$cal(S)^(x \; y) \/ E^y

$ is nonzero only for the $

d_(x y)$-wave
altermagnet.

7) $cal(S)^(y \; x) \/ E^x

$ We show that $

cal(S)^(y \; x) \/ E^x

$ is nonzero only for the
$d_(x y)$-wave altermagnet. $

cal(Q)_(+ -)^(y x)

$ is expanded as
$ cal(Q)_(+ -)^(y x) = frac(lambda k_x J partial_(k_y) f_X, 2 (lambda^2 k^2 + B^2)^(3 \/ 2)) $

up
to the first order in $J$. It is evaluated as follows. We study
$cal(Q)_(+ -)^(y x)$, whose numerator is $k_x partial_(k_y) f_X$.



$ k_x partial_(k_y) f_X = N k^(N_X) sin (N_X - 1) phi.alt cos phi.alt $

for
$f_X = k^(N_X) cos N_X phi.alt$, whose integration over $phi.alt

$ is
$ integral k_y partial_(k_x) f_X d phi.alt = 0 . $

We also
have

$ k_x partial_(k_y) f_X = N k^(N_X) cos (N_X - 1) phi.alt cos phi.alt $

for
$f_X = k^(N_X) sin N_X phi.alt$, whose integration is obtained
as

$ integral k_x partial_(k_y) f_X d phi.alt = 2 k^2 pi delta_(N_X \, 2) . $

Then,
we have the static electric-field induced spin
polarization

$ S^(y \; x) / E^y = & - integral d^2 k f_(+ -) frac(2 cal(Q)_(+ -)^(y x), epsilon_(+ -))\
= & frac(J pi, lambda^3) sum_(eta = plus.minus) eta frac(2 (B^2 + m lambda^2 (m lambda^2 + mu + eta M)), sqrt(B^2 + 2 m lambda^2 (m lambda^2 + mu + eta M))) $

up
to the first order in $J$. For $B = 0$, it is simplified
as

$ S^x / E^y = frac(2 m J pi, lambda) $

for $mu > 0$. Hence,
$cal(S)^(y \; x) \/ E^x

$ is nonzero only for the $

d_(x y)$-wave
altermagnet.

= Uhlmann geometry
<ApU>
We prove Eq.(@SLD) in the main text. We first calculate


$ &  chevron.l psi_n (upright(bold(k)))\| d rho \|psi_m (upright(bold(k))) chevron.r \
= & sum_(n') partial_(k_mu) p_(n') delta_(n n') delta_(n' m)\
 & - i p_(n') a_(n n')^mu (upright(bold(k))) delta_(n' m) - i p_(n') delta_(n n') a_(m n')^(mu *) (upright(bold(k)))\
= & delta_(n m) partial_(k_mu) p_n - i p_n a_(n m)^mu (upright(bold(k))) + i p_m a_(n m)^mu (upright(bold(k))) \, $ <SLD1>


where
we have
used

$ d rho = & sum_(n') partial_(k_mu) p_(n') \|psi_(n') (upright(bold(k))) chevron.r   chevron.l psi_(n') (upright(bold(k)))\|\
 & + p_(n') (partial_(k_mu) \|psi_(n') (upright(bold(k))) chevron.r )  chevron.l psi_(n') (upright(bold(k)))\|\
 & + p_(n') \|psi_(n') (upright(bold(k))) chevron.r  (partial_(k_mu)  chevron.l psi_(n') (upright(bold(k)))\|) . $

On
the other hand, we
have

$ &  chevron.l psi_n (upright(bold(k)))\| frac(cal(L) rho + rho cal(L), 2) \|psi_m (upright(bold(k))) chevron.r \
= &  chevron.l psi_n (upright(bold(k)))\| \( sum_(n') 1 / 2 frac(partial_(k_mu) p_(n'), p_(n')) \|psi_(n') chevron.r   chevron.l psi_(n')\|\
 & times sum_(m') p_(m') \|psi_(m') (upright(bold(k))) chevron.r   chevron.l psi_(m') (upright(bold(k)))\|\
 & + i sum_(n' eq.not m') frac(p_(m') - p_(n'), p_(m') + p_(n')) a_(n' m')^mu \|psi_(n') chevron.r   chevron.l psi_(m')\|\
 & times sum_(m^('')) p_(m^('')) \|psi_(m^('')) (upright(bold(k))) chevron.r   chevron.l psi_(m^('')) (upright(bold(k)))\|\
 & + sum_(m^('')) p_(m^('')) \|psi_(m^('')) (upright(bold(k))) chevron.r   chevron.l psi_(m^('')) (upright(bold(k)))\|\
 & times sum_(n') 1 / 2 frac(partial_(k_mu) p_(n'), p_(n')) \|psi_(n') chevron.r   chevron.l psi_(n')\|\
 & + sum_(m') p_(m^('')) \|psi_(m^('')) (upright(bold(k))) chevron.r   chevron.l psi_(m^('')) (upright(bold(k)))\|\
 & times i sum_(n' eq.not m') frac(p_(m') - p_(n'), p_(m') + p_(n')) a_(n' m')^mu \|psi_(n') chevron.r   chevron.l psi_(m')\| \) \|psi_m (upright(bold(k))) chevron.r  . $

It
is further calculated
as

$ & sum_(n') delta_(n n') 1 / 2 frac(partial_(k_mu) p_(n'), p_(n')) delta_(n' m') p_(m') delta_(m' m)\
 & + i sum_(n' eq.not m') frac(p_(m') - p_(n'), p_(m') + p_(n')) a_(n' m')^mu delta_(n n') delta_(m' m^('')) delta_(m^('') m)\
 & + sum_(m') p_(m') delta_(n m') sum_(n') 1 / 2 frac(partial_(k_mu) p_(n'), p_(n')) delta_(m' n') delta_(n' m)\
 & + sum_(n' eq.not m') delta_(n m^('')) p_(m^('')) frac(p_(m') - p_(n'), p_(m') + p_(n')) a_(n' m')^mu delta_(m^('') n') delta_(m' m)\
= & delta_(n m) 1 / 2 frac(partial_(k_mu) p_n, p_n) p_n + i frac(p_m - p_n, p_m + p_n) a_(n m)^mu p_m\
 & + delta_(n m) p_n 1 / 2 frac(partial_(k_mu) p_n, p_n) + i p_n frac(p_m - p_n, p_m + p_n) a_(n m)^mu\
= & delta_(n m) partial_(k_mu) p_n + i (p_m - p_n) a_(n m)^mu \, $

which
is identical to Eq.(@SLD1).

== Positive Operator-Valued Measure
<positive-operator-valued-measure>
Positive Operator-Valued Measure (POVM) $Pi_n

$ satisfies \[204\]

$ p_n = upright("Tr") rho Pi_n \, $

and

$ sum_(n = 1)^N Pi_n = 1 . $

It is
a generalization of the projective measurement. These two conditions
lead to the conservation of the
provability,

$ sum_(n = 1)^N p_n = sum_(n = 1)^N upright("Tr") rho Pi_n = upright("Tr") rho sum_(n = 1)^N Pi_n = upright("Tr") rho = 1 . $

By
using it, the classical Fisher information (@CFisher) is rewritten as


$ cal(F)_(upright("CFisher"))^(mu nu) = & sum_(n = 1)^N upright("Tr") rho Pi_n frac(upright("Tr") frac(partial rho, partial k_mu) Pi_n, upright("Tr") rho Pi_n) frac(upright("Tr") frac(partial rho, partial k_nu) Pi_n, upright("Tr") rho Pi_n)\
= & sum_(n = 1)^N frac(1, upright("Tr") rho Pi_n) upright("Tr") (frac(partial rho, partial k_mu) Pi_n) upright("Tr") (frac(partial rho, partial k_nu) Pi_n) . $



== Quantum Cramér-Rao inequality
<ApQCR>
We prove the quantum Cramér-Rao inequality (@CR). It is enough to show
\[137\]

$ sum_(mu nu) a_mu cal(F)_(upright("CFisher"))^(mu nu) a_nu < sum_(mu nu) a_mu cal(F)_(upright("QFisher"))^(mu nu) a_nu $

for
arbitrary set of $a_mu$. By
introducing

$ cal(tilde(L)) = sum_mu a_mu cal(L)^mu \, $

we define
$cal(F)_(upright("CFisher"))

$ as$ cal(F)_(upright("CFisher")) equiv & sum_(n = 1)^N frac(1, upright("Tr") rho Pi_n) (upright("Tr") (1 / 2 (cal(tilde(L)) rho + rho cal(tilde(L))) Pi_n))^2\
= & sum_(n = 1)^N frac(1, upright("Tr") rho Pi_n) sum_(mu nu) upright("Tr") (a_mu / 2 (cal(L)^mu rho + rho cal(L)^mu) Pi_n)\
 & times upright("Tr") (a_nu / 2 (cal(L)^nu rho + rho cal(L)^nu) Pi_n)\
= & sum_(mu nu) a_mu cal(F)_(upright("CFisher"))^(mu nu) a_nu . $



First, we show the
inequality

$ & sum_(mu nu) a_mu cal(F)_(upright("CFisher"))^(mu nu) a_nu\
= & sum_(n = 1)^N frac(1, upright("Tr") rho Pi_n) (upright("Tr") (1 / 2 (cal(tilde(L)) rho + rho cal(tilde(L))) Pi_n))^2\
= & sum_(n = 1)^N frac(1, upright("Tr") rho Pi_n) (upright("Tr") (upright("Re") cal(tilde(L)) rho Pi_n))^2\
lt.eq & sum_(n = 1)^N frac(1, upright("Tr") rho Pi_n) lr(|upright("Tr") (cal(tilde(L)) rho Pi_n)|)^2 . $



Next,
setting

$ A^dagger = frac(sqrt(rho) sqrt(Pi_n), sqrt(upright("Tr") rho Pi_n)) \, #h(2em) B = sqrt(Pi_n) cal(tilde(L)) sqrt(rho) \, $


we use the Schwartz
inequality

$ lr(|upright("Tr") A^dagger B|)^2 lt.eq upright("Tr") A^dagger A upright("Tr") B^dagger B . $

The
left-hand side
is

$ lr(|upright("Tr") A^dagger B|)^2 = & lr(|upright("Tr") frac(sqrt(rho) sqrt(Pi_n), sqrt(upright("Tr") rho Pi_n)) sqrt(Pi_n) cal(tilde(L)) sqrt(rho)|)^2\
= & lr(|upright("Tr") frac(sqrt(rho) Pi_n cal(tilde(L)) sqrt(rho), sqrt(upright("Tr") rho Pi_n))|)^2\
= & lr(|upright("Tr") frac(cal(tilde(L)) rho Pi_n, sqrt(upright("Tr") rho Pi_n))|)^2 \, $

while
the right-hand side
is

$ & sum_(n = 1)^N upright("Tr") A^dagger A upright("Tr") B^dagger B\
= & sum_(n = 1)^N upright("Tr") frac(sqrt(rho) sqrt(Pi_n), sqrt(upright("Tr") rho Pi_n)) frac(sqrt(Pi_n) sqrt(rho), sqrt(upright("Tr") rho Pi_n)) upright("Tr") sqrt(Pi_n) cal(tilde(L)) sqrt(rho) sqrt(rho) cal(tilde(L)) sqrt(Pi_n)\
= & sum_(n = 1)^N upright("Tr") frac(sqrt(rho) Pi_n sqrt(rho), upright("Tr") rho Pi_n) upright("Tr") sqrt(Pi_n) cal(tilde(L)) rho cal(tilde(L)) sqrt(Pi_n)\
= & sum_(n = 1)^N upright("Tr") frac(rho Pi_n, upright("Tr") rho Pi_n) upright("Tr") Pi_n cal(tilde(L)) rho cal(tilde(L)) = sum_(n = 1)^N upright("Tr") Pi_n cal(tilde(L)) rho cal(tilde(L))\
= & upright("Tr") cal(tilde(L)) rho cal(tilde(L)) = upright("Tr") rho cal(tilde(L))^2 = 1 / 2 cal(F)_(upright("QFisher")) \, $

where
we have
defined

$ & cal(F)_(upright("QFisher"))^(mu nu) equiv 1 / 2 upright("Tr") rho cal(tilde(L))^2 = 1 / 2 upright("Tr") rho (sum_mu a_mu cal(L)^mu)^2\
= & 1 / 2 sum_(mu nu) a_mu upright("Tr") [rho {cal(L)^mu \, cal(L)^nu}] a_nu\
= & sum_(mu nu) a_mu cal(F)_(upright("QFisher"))^(mu nu) a_nu . $

Hence,
the quantum Cramér-Rao inequality (@CR) is proved.

== Quantum Fisher information for a pure state
<ApQFpure>
By inserting

$ rho = \|psi_n chevron.r   chevron.l psi_n\| \, $

to Eq.(@FisherRho), we
have

$ & cal(F)_(upright("QFisher"))^(mu nu)\
= & 2 upright("Tr") \|psi_n chevron.r   chevron.l psi_n\| \( frac(partial \|psi_n chevron.r   chevron.l psi_n\|, partial k_mu) frac(partial \|psi_n chevron.r   chevron.l psi_n\|, partial k_nu)\
 & + frac(partial \|psi_n chevron.r   chevron.l psi_n\|, partial k_nu) frac(partial \|psi_n chevron.r   chevron.l psi_n\|, partial k_mu) \)\
= & 2 upright("Tr")  chevron.l psi_n\| frac(partial \|psi_n chevron.r , partial k_mu)  chevron.l psi_n\| frac(partial \|psi_n chevron.r , partial k_nu)\
 & +  chevron.l psi_n\| frac(partial \|psi_n chevron.r , partial k_mu) frac(partial  chevron.l psi_n\|, partial k_nu) \|psi_n chevron.r \
 & + frac(partial  chevron.l psi_n\|, partial k_mu) frac(partial \|psi_n chevron.r , partial k_nu) + frac(partial  chevron.l psi_n\|, partial k_mu) \|psi_n chevron.r  frac(partial  chevron.l psi_n\|, partial k_nu) \|psi_n chevron.r \
 & +  chevron.l psi_n\| frac(partial \|psi_n chevron.r , partial k_nu)  chevron.l psi_n\| frac(partial \|psi_n chevron.r , partial k_mu) +  chevron.l psi_n\| frac(partial \|psi_n chevron.r , partial k_nu) frac(partial  chevron.l psi_n\|, partial k_mu) \|psi_n chevron.r \
 & + frac(partial  chevron.l psi_n\|, partial k_nu) frac(partial \|psi_n chevron.r , partial k_mu) + frac(partial  chevron.l psi_n\|, partial k_nu) \|psi_n chevron.r  frac(partial  chevron.l psi_n\|, partial k_mu) \|psi_n chevron.r  . $

By
using the
relations

$ &  chevron.l psi_n\| frac(partial \|psi_n chevron.r , partial k_mu)  chevron.l psi_n\| frac(partial \|psi_n chevron.r , partial k_nu) +  chevron.l psi_n\| frac(partial \|psi_n chevron.r , partial k_mu) frac(partial  chevron.l psi_n\|, partial k_nu) \|psi_n chevron.r \
= &  chevron.l psi_n\| frac(partial \|psi_n chevron.r , partial k_mu) frac(partial  chevron.l psi_n\| psi_n chevron.r , partial k_nu) = 0 $ <FA1>




$ &  chevron.l psi_n\| frac(partial \|psi_n chevron.r , partial k_nu)  chevron.l psi_n\| frac(partial \|psi_n chevron.r , partial k_mu) +  chevron.l psi_n\| frac(partial \|psi_n chevron.r , partial k_nu) frac(partial  chevron.l psi_n\|, partial k_mu) \|psi_n chevron.r \
= &  chevron.l psi_n\| frac(partial \|psi_n chevron.r , partial k_nu) frac(partial  chevron.l psi_n\| psi_n chevron.r , partial k_mu) = 0 \, $ <FA2>


we
have

$ cal(F)_(upright("QFisher"))^(mu nu) = & 2 upright("Tr") frac(partial  chevron.l psi_n\|, partial k_mu) frac(partial \|psi_n chevron.r , partial k_nu) - frac(partial  chevron.l psi_n\|, partial k_mu) \|psi_n chevron.r   chevron.l psi_n\| frac(partial \|psi_n chevron.r , partial k_nu)\
 & + frac(partial  chevron.l psi_n\|, partial k_nu) frac(partial \|psi_n chevron.r , partial k_mu) - frac(partial  chevron.l psi_n\|, partial k_nu) \|psi_n chevron.r   chevron.l psi_n\| frac(partial \|psi_n chevron.r , partial k_mu)\
= & 2 (cal(F)^(mu nu) + cal(F)^(nu mu)) = 4 g^(mu nu) . $

This is
Eq.(@FIpure) in the main text.

$ & cal(U)^(mu nu)\
= & - 2 i upright("Tr") \|psi_n chevron.r   chevron.l psi_n\| \( frac(partial \|psi_n chevron.r   chevron.l psi_n\|, partial k_mu) frac(partial \|psi_n chevron.r   chevron.l psi_n\|, partial k_nu)\
 & - frac(partial \|psi_n chevron.r   chevron.l psi_n\|, partial k_nu) frac(partial \|psi_n chevron.r   chevron.l psi_n\|, partial k_mu) \)\
= & - 2 i upright("Tr")  chevron.l psi_n\| frac(partial \|psi_n chevron.r , partial k_mu)  chevron.l psi_n\| frac(partial \|psi_n chevron.r , partial k_nu)\
 & +  chevron.l psi_n\| frac(partial \|psi_n chevron.r , partial k_mu) frac(partial  chevron.l psi_n\|, partial k_nu) \|psi_n chevron.r \
 & + frac(partial  chevron.l psi_n\|, partial k_mu) frac(partial \|psi_n chevron.r , partial k_nu) + frac(partial  chevron.l psi_n\|, partial k_mu) \|psi_n chevron.r  frac(partial  chevron.l psi_n\|, partial k_nu) \|psi_n chevron.r \
 & -  chevron.l psi_n\| frac(partial \|psi_n chevron.r , partial k_nu)  chevron.l psi_n\| frac(partial \|psi_n chevron.r , partial k_mu) -  chevron.l psi_n\| frac(partial \|psi_n chevron.r , partial k_nu) frac(partial  chevron.l psi_n\|, partial k_mu) \|psi_n chevron.r \
 & - frac(partial  chevron.l psi_n\|, partial k_nu) frac(partial \|psi_n chevron.r , partial k_mu) - frac(partial  chevron.l psi_n\|, partial k_nu) \|psi_n chevron.r  frac(partial  chevron.l psi_n\|, partial k_mu) \|psi_n chevron.r  . $

Using
the relations Eqs.(@FA1) and (@FA2), we
have

$ cal(U)^(mu nu) = & - 2 i upright("Tr") frac(partial  chevron.l psi_n\|, partial k_mu) frac(partial \|psi_n chevron.r , partial k_nu) - frac(partial  chevron.l psi_n\|, partial k_mu) \|psi_n chevron.r   chevron.l psi_n\| frac(partial \|psi_n chevron.r , partial k_nu)\
 & - frac(partial  chevron.l psi_n\|, partial k_nu) frac(partial \|psi_n chevron.r , partial k_mu) + frac(partial  chevron.l psi_n\|, partial k_nu) \|psi_n chevron.r   chevron.l psi_n\| frac(partial \|psi_n chevron.r , partial k_mu)\
= & - 2 i (cal(F)^(mu nu) - cal(F)^(nu mu)) = - 4 Omega^(mu nu) . $

This
is Eq.(@UhlPure) in the main text.

#heading(numbering: none)[References]
\[1\] J. P. Provost and G. Vallee, Riemannian structure on manifolds of
quantum states, Comm. Math. Phys. 76, 289 (1980).

\[2\] M. V. Berry, Quantal phase factors accompanying adiabatic changes,
Proc. R. Soc. A 392, 45 (1984).

\[3\] Yu-Quan Ma, Shu Chen, Heng Fan, and Wu-Ming Liu, Abelian and
non-Abelian quantum geometric tensor, Phys. Rev. B 81, 245129 (2010).

\[4\] D. J. Thouless, M. Kohmoto, M. P. Nightingale, and M. den Nijs,
Quantized Hall Conductance in a Two-Dimensional Periodic Potential Phys.
Rev. Lett. 49, 405 (1982)

\[5\] Qian Niu, D. J. Thouless, and Yong-Shi Wu, Quantized Hall
conductance as a topological invariant, Phys. Rev. B 31, 3372 (1985)

\[6\] J. Ahn, G.-Y. Guo, N. Nagaosa, Low-Frequency Divergence and
Quantum Geometry of the Bulk Photovoltaic Effect in Topological
Semimetals, Phys. Rev. X 10, 041041 (2020).

\[7\] T. Holder, D. Kaplan, B. Yan, Consequences of
time-reversal-symmetry breaking in the light-matter interaction: Berry
curvature, quantum metric, and diabatic motion, Phys. Rev. Res. 2,
033100 (2020).

\[8\] P. Bhalla, K. Das, D. Culcer, A. Agarwal, Resonant Second-Harmonic
Generation as a Probe of Quantum Geometry, Phys. Rev. Lett. 129, 227401
(2022)

\[9\] J. Ahn, G.-Y. Guo, N. Nagaosa, A. Vishwanath, Riemannian geometry
of resonant optical responses, Nature Physics 18, 290 (2022)

\[10\] Ivo Souza, Tim Wilkens, and Richard M. Martin, Polarization and
localization in insulators: Generating function approach, Phys. Rev. B
62, 1666 (2000)

\[11\] W. Chen and G. von Gersdorff, Measurement of interaction-dressed
Berry curvature and quantum metric in solids by optical absorption,
SciPost Phys. Core 5, 040 (2022).

\[12\] Yugo Onishi and Liang Fu, Fundamental Bound on Topological Gap,
Phys. Rev. X 14, 011052 (2024)

\[13\] Matheus S. M. de Sousa, Antonio L. Cruz, and Wei Chen, Mapping
quantum geometry and quantum phase transitions to real space by a
fidelity marker, Phys. Rev. B 107, 205133 (2023)

\[14\] Barun Ghosh, Yugo Onishi, Su-Yang Xu, Hsin Lin, Liang Fu and Arun
Bansil, Probing quantum geometry through optical conductivity and
magnetic circular dichroism, Science Advances: sciadv.ado1761 (2024)

\[15\] Wei Chen, Quantum geometrical properties of topological
materials, J. Phys.: Condens. Matter 37 025605 (2025)

\[16\] Wei Chen, Dielectric and optical markers originating from quantum
geometry, Phys. Rev. B 111, 085202 (2025)

\[17\] M. Ezawa, Analytic approach to quantum metric and optical
conductivity in Dirac models with parabolic mass in arbitrary
dimensions, Phys. Rev. B 110, 195437 (2024)

\[18\] Chang-geun Oh, Sun-Woo Kim, Kun Woo Kim, Bartomeu Monserrat, and
Jun-Won Rhim, Universal Optical Conductivity from Quantum Geometry in
Quadratic Band-Touching Semimetals, arXiv:2503.18372

\[19\] M. Ezawa, Quantum geometry and elliptic optical dichroism in
p-wave magnets, Phys. Rev. B 112, 045302 (2025)

\[20\] I. Sodemann and L. Fu, Quantum nonlinear Hall effect induced by
Berry curvature dipole in time-reversal invariant materials, Phys. Rev.
Lett. 115, 216806 (2015).

\[21\] Q. Ma, et al., Observation of the nonlinear Hall effect under
time-reversal-symmetric conditions, Nature 565, 337 (2019)

\[22\] C. Wang, Y. Gao, and D. Xiao, Intrinsic nonlinear Hall effect in
antiferromagnetic tetragonal cumnas, Phys. Rev. Lett. 127, 277201
(2021).

\[23\] Y. Michishita and N. Nagaosa, Dissipation and geometry in
nonlinear quantum transports of multiband electronic systems, Phys. Rev.
B 106, 125114 (2022).

\[24\] Kamal Das, Shibalik Lahiri, Rhonald Burgos Atencia, Dimitrie
Culcer, and Amit Agarwal, Intrinsic nonlinear conductivities induced by
the quantum metric, Phys. Rev. B 108, L201405 (2023)

\[25\] A. Gao, Y.-F. Liu, J.-X. Qiu, B. Ghosh, T.V. Trevisan, Y. Onishi,
C. Hu, T. Qian, H.-J. Tien, S.-W. Chen et al., Quantum metric nonlinear
Hall effect in a topological antiferromagnetic heterostructure, Science
381, eadf1506 (2023).

\[26\] N. Wang, D. Kaplan, Z. Zhang, T. Holder, N. Cao, A. Wang, X.
Zhou, F. Zhou, Z. Jiang, C. Zhang et al., Quantum metric-induced
nonlinear transport in a topological antiferromagnet, Nature (London)
621, 487 (2023).

\[27\] Daniel Kaplan, Tobias Holder and Binghai Yan, Unification of
Nonlinear Anomalous Hall Effect and Nonreciprocal Magnetoresistance in
Metals by the Quantum Geometry, Phys. Rev. Lett. 132, 026301 (2024)

\[28\] Giacomo Sala, et.al., The quantum metric of electrons with
spin-momentum locking, Science 389, 822 (2025)

\[29\] Yuan Fang, Jennifer Cano, and Sayed Ali Akbar Ghorashi, Quantum
Geometry Induced Nonlinear Transport in Altermagnets, Phys. Rev. Lett.
133, 106701 (2024)

\[30\] Zhen-Hao Gong, Z. Z. Du, Hai-Peng Sun, Hai-Zhou Lu, X. C. Xie,
Nonlinear transport theory at the order of quantum metric,
arXiv:2410.04995v2

\[31\] M. Ezawa, Intrinsic nonlinear conductivity induced by quantum
geometry in altermagnets and measurement of the in-plane Neel vector,
Phys. Rev. B 110, L241405 (2024)

\[32\] M. Ezawa, Purely electrical detection of the Neel vector of
p-wave magnets based on linear and nonlinear conductivities, Phys. Rev.
B 112, 125412 (2025)-temperature d-wave altermagnet, Nature Physics 21,
754 (2025)

\[33\] Hikaru Watanabe and Youichi Yanase, Chiral Photocurrent in
Parity-Violating Magnet and Enhanced Response in Topological
Antiferromagnet, Phys. Rev. X, 11, 011001 (2021)

\[34\] M. Ezawa, Higher-order bulk photovoltaic effects, quantum
geometry and application to p-wave magnets, Phys. Rev. B 112, 155308
(2025)

\[35\] M. Kang et al., Measurements of the quantum geometric tensor in
solids, Nature Physics 21, 110 (2025)

\[36\] S. Kim et al., Direct measurement of the quantum metric tensor in
solids, Science. 388, 1050 (2025).

\[37\] Makoto Naka, Satoru Hayami, Hiroaki Kusunose, Yuki Yanagi,
Yukitoshi Motome and Hitoshi Seo, Spin current generation in organic
antiferromagnets, Nat. Com. 10, 4305 (2019).

\[38\] Rafael Gonzalez-Hernandez, Libor Šmejkal, Karel Vborn, Yuta
Yahagi, Jairo Sinova, Tomš Jungwirth, and Jakub Železn, Efficient
electrical spin splitter based on nonrelativistic collinear
antiferromagnetism, Phys. Rev. Lett., 126:127701, (2021).

\[39\] M Naka, Y Motome, and H Seo, Perovskite as a spin current
generator. Phys. Rev. B, 103, 125114, (2021).

\[40\] Arnab Bose, Nathaniel J. Schreiber, Rakshit Jain, Ding-Fu Shao,
Hari P. Nair, Jiaxin Sun, Xiyue S. Zhang, David A. Muller, Evgeny Y.
Tsymbal, Darrell G. Schlom & Daniel C. Ralph, Tilted spin current
generated by the collinear antiferromagnet ruthenium dioxide, Nature
Electronics 5, 267 (2022).

\[41\] S. Hayami, Y. Yanagi, and H. Kusunose, Momentum-Dependent Spin
Splitting by Collinear Antiferromagnetic Ordering, J. Phys. Soc. Jpn.
88, 123702 (2019).

\[42\] L. Smejkal, J. Sinova, and T. Jungwirth, Beyond Conventional
Ferromagnetism and Antiferromagnetism: A Phase with Nonrelativistic Spin
and Crystal Rotation Symmetry, Phys. Rev. X, 12, 031042 (2022).

\[43\] Libor Šmejkal, Jairo Sinova, and Tomas Jungwirth, Emerging
Research Landscape of Altermagnetism, Phys. Rev. X 12, 040501 (2022).

\[44\] S. Hayami, Y. Yanagi, and H. Kusunose, Bottom-up design of
spin-split and reshaped electronic band structures in antiferromagnets
without spin-orbit coupling: Procedure on the basis of augmented
multipoles, Phys. Rev. B 102, 144441 (2020)

\[45\] Anna Birk Hellenes, Tomas Jungwirth, Jairo Sinova, Libor Šmejkal,
Unconventional p-wave magnets, arXiv:2309.01607.

\[46\] M. Ezawa,Planar Hall effects in X-wave magnets with X=p,d,f,g,i
arXiv:2508.09472

\[47\] M. Ezawa, Tunneling magnetoresistance in a junction made of
X-wave magnets with X = p, d, f, g, i, arXiv:2509.16867

\[48\] Paivi Torma, Essay: Where Can Quantum Geometry Lead Us? Phys.
Rev. Lett. 131, 240001 (2023)

\[49\] Tianyu Liu, Xiao-Bin Qiang, Hai-Zhou Lu, X. C. Xie, Quantum
geometry in condensed matter, National Science Review, 12, nwae334
(2025)

\[50\] Jiabin Yu, B. Andrei Bernevig, Raquel Queiroz, Enrico Rossi,
Paivi Torma Bohm-Jung Yang, Quantum Geometry in Quantum Materials,
arXiv:2501.00098

\[51\] Yiyang Jiang, Tobias Holder, and Binghai Yan, Revealing Quantum
Geometry in Nonlinear Quantum Materials, arXiv:2503.04943.

\[52\] Ling Bai, Wanxiang Feng, Siyuan Liu, Libor Šmejkal, Yuriy
Mokrousov, Yugui Yao, Altermagnetism: Exploring New Frontiers in
Magnetism and Spintronics Adv. Funct. Mater., 2409327 (2024).

\[53\] T. Jungwirth, R. M. Fernandes, E. Fradkin, A. H. MacDonald, J.
Sinova, L. Smejkal, From supefluid He3 to altermagnets,
arXiv:2411.00717v1

\[54\] Makoto Naka, Yukitoshi Motome and Hitoshi Seo, Altermagnetic
Perovskites, npj Spintronics volume 3, 1 (2025)

\[55\] Yuri Fukaya, Bo Lu, Keiji Yada, Yukio Tanaka, Jorge Cayao,
Superconducting phenomena in systems with unconventional magnets,
arXiv:2502.15400

\[56\] Tomas Jungwirth, Jairo Sinova, Rafael M. Fernandes, Qihang Liu,
Hikaru Watanabe, Shuichi Murakami, Satoru Nakatsuji and Libor Smejkal,
Symmetry, microscopy and spectroscopy signatures of altermagnetism,
arXiv:2506.22860

\[57\] T. Jungwirth, J. Sinova, P. Wadley, D. Kriegner, H. Reichlova, F.
Krizek, H. Ohno, and L. Smejkal,~Altermagnetic spintronics,
arXiv:2508.09748

\[58\] Sayantika Bhowal, and Arnab Bose, Non-relativistic spin
splitting: Features and Functionalities, arXiv:2510.20306

\[59\] R. Resta, The insulating state of matter: a geometrical theory,
Eur. Phys. J. B 79, 121 (2011)

\[60\] G. Fubini, Sulle metriche definite da una forma Hermitiana, Atti
del Reale Istituto Veneto di Scienze, Lettere ed Arti, 63 501 (1904)

\[61\] E.Study, Kurzeste Wege im komplexen Gebiet\". Mathematische
Annalen (in German). 60 (3). Springer Science and Business Media LLC:
321 (1905)

\[62\] Frank Wilczek and A. Zee, Appearance of Gauge Structure in Simple
Dynamical Systems, Phys. Rev. Lett. 52, 2111 (1984)

\[63\] Mahito Kohmoto, Topological invariant and the quantization of the
Hall conductance, Anals of Physics, 160, 343 (1985)

\[64\] Nicola Marzari and David Vanderbilt, Maximally localized
generalized Wannier functions for composite energy bands, Phys. Rev. B
56, 12847 (1997)

\[65\] R. Roy, Band geometry of fractional topological insulators,
Physical Review B 90, 165139 (2014).

\[66\] S. Peotta and P. Torma, Superfluidity in topologically nontrivial
flat bands, Nat. Commun. 6, 8944 (2015).

\[67\] Tomoki Ozawam and Bruno Mera, Relations between topology and the
quantum metric for Chern insulators, Phys. Rev. B 104, 045103 (2021)

\[68\] Bruno Mera and Tomoki Ozawa, Kahler geometry and Chern
insulators: Relations between topology and the quantum metric, Phys.
Rev. B 104, 045104 (2021)

\[69\] J. Bellissard, A. van Elst, and H. Schulz-Baldes, The
noncommutative geometry of the quantum Hall effect, J. Math. Phys. 35,
5373--5451 (1994)

\[70\] F. Combes, M. Trescher, F. Pichon, and J.-N. Fuchs, Statistical
mechanics approach to the electric polarization and dielectric constant
of band insulators, Phys. Rev. B 94, 155109 (2016).

\[71\] Yugo Onishi, Liang Fu, Quantum weight: A fundamental property of
quantum many-body systems, Phys. Rev Res. 7, 023158 (2025)

\[72\] Shunji Matsuura and Shinsei Ryu, Momentum space metric, nonlocal
operator, and topological insulators, Phys. Rev. B 82, 245113 (2010).

\[73\] O. Bleu, D. D. Solnyshkov, and G. Malpuech, Measuring the quantum
geometric tensor in two-dimensional photonic and exciton-polariton
systems, Phys. Rev. B 97, 195422 (2018)

\[74\] G. von Gersdorff and W. Chen, Measurement of topological order
based on metric-curvature correspondence, Phys. Rev. B 104, 195133
(2021).

\[75\] Y.-M. Robin Hu, Elena A. Ostrovskaya, and Eliezer Estrecho,
Generalized quantum geometric tensor in a non-Hermitian
exciton-polariton system, Optical Materials Express 14, 664 (2024)

\[76\] M. Ezawa, Monolayer Topological Insulators: Silicene, Germanene
and Stanene, J. Phys. Soc. Jpn. 84, 121003 (2015)

\[77\] W.-Y. Hsiang and D.-H. Lee, Chern-Simons invariant in the Berry
phase of a 2$times$2 Hamiltonians, Phys. Rev. A 64, 052101 (2001).

\[78\] Doru Sticlet, Frederic Piechon, Jean-Noel Fuchs, Pavel Kalugin,
and Pascal Simon, Geometrical engineering of a two-band Chern insulator
in two dimensions with arbitrary topological index, Phys. Rev. B 85,
165456 (2012).

\[79\] Chao-Ming Jian, Zheng-Cheng Gu, and Xiao-Liang Qi, Momentum-space
instantons and maximally localized flat-band topological Hamiltonians,
Phys. Status Solidi RRL 7, 154 (2013).

\[80\] W. Yao, D. Xiao, and Q. Niu, Phys. Rev. B 77, 235406 (2008).

\[81\] D. Xiao, G.-B. Liu, W. Feng, X. Xu, and W. Yao, Coupled Spin and
Valley Physics in Monolayers of MoS2 and Other Group-VI Dichalcogenides,
Phys. Rev. Lett. #strong[108], 196802 (2012).

\[82\] M. Ezawa, Spin-valley optical selection rule and strong circular
dichroism in silicene, Phys. Rev. B 86, 161407(R) (2012)

\[83\] M. Ezawa, Elliptic Dichroism and Valley-Selective Optical Pumping
in the Surface of Topological Crystalline Insulator, Phys. Rev. B 89,
195413 (2014) 245306 (2024).

\[84\] X. Li, T. Cao, Q. Niu, J. Shi, and J Feng, Coupling the valley
degree of freedom to antiferromagnetic order, PNAS 110 (10) 3738 (2013)

\[85\] V. I. Belinicher and B. I. Sturman, The photogalvanic effect in
media lacking a center of symmetry, Sov. Phys. Usp. 23, 199 (1980).

\[86\] W. Kraut and R. von Baltz, Anomalous bulk photo-voltaic effect in
ferroelectrics: A quadratic response theory, Phys. Rev. B 19, 1548
(1979).

\[87\] C. Aversa and J. E. Sipe, Nonlinear Optical Susceptibilities of
Semiconductors: Results with a Length-Gauge Analysis, Phys. Rev. B 52,
14636 (1995)

\[88\] J. E. Sipe and A. I. Shkrebtii, Second-order optical response in
semiconductors, Phys. Rev. B 61, 5337 (2000).

\[89\] V. M. Fridkin, Bulk photovoltaic effect in noncentrosymmetric
crystals, Crystallogr. Rep. 46, 654 (2001).

\[90\] F. de Juan, Y. Zhang, T. Morimoto, Y. Sun, J. E. Moore, and A.G.
Grushin, Difference Frequency Generation in Topological Semimetals,
Phys. Rev. Research 2, 012017 (2020).

\[91\] Z. Dai and A. M. Rappe, Recent progress in the theory of bulk
photovoltaic effect, Chemical Physics Reviews 4, 011303 (2023).

\[92\] M. Ezawa, Bulk photovoltaic effects in altermagnets, Phys. Rev. B
111, L201405 (2025)

\[93\] Fernando de Juan, Adolfo G. Grushin, Takahiro Morimoto, Joel E.
Moore, Quantized circular photogalvanic effect in Weyl semimetals,
Nature Communications 8, 15995 (2017).

\[94\] S. M. Young and A. M. Rappe, First Principles Calculation of the
Shift Current Photovoltaic Effect in Ferroelectrics, Phys. Rev. Lett.
109, 116601 (2012).

\[95\] S. M. Young, F. Zheng, and A. M. Rappe, First-Principles
Calculation of the Bulk Photovoltaic Effect in Bismuth Ferrite, Phys.
Rev. Lett. 109, 236601 (2012).

\[96\] T. Morimoto and N. Nagaosa, Topological nature of nonlinear
optical effects in solids, Science Advances 2, e1501524 (2016)

\[97\] Kun Woo Kim, Takahiro Morimoto, and Naoto Nagaosa, Shift charge
and spin photocurrents in Dirac surface states of topological insulator,
Phys. Rev. B, 95, 035134 (2017)

\[98\] T. Barik and J. D. Sau, Nonequilibrium nature of nonlinear
optical response: Application to the bulk photovoltaic effect, Phys.
Rev. B 101, 045201 (2020).

\[99\] Hiroki Yoshida and Shuichi Murakami, Diverging shift current
responses in the gapless limit of two-dimensional systems, Phys. Rev. B
111, 155402 (2025)

\[100\] T. Ideue, K. Hamamoto, S. Koshikawa, M. Ezawa, S. Shimizu, Y.
Kaneko, Y. Tokura, N. Nagaosa, and Y. Iwasa, Bulk rectification effect
in a polar semiconductor, Nat. Phys. 13, 578 (2017).

\[101\] D. Kaplan, T. Holder, and B. Yan, Unifying semiclassics and
quantum perturbation theory at nonlinear order, SciPost Phys. 14, 082
(2023).

\[102\] Xiao-Bin Qiang, Tianyu Liu, Zi-Xuan Gao, Hai-Zhou Lu, and X. C.
Xie, A Clarification on Quantum-Metric-Induced Nonlinear Transport,
arXiv:2508.02088

\[103\] Zhichao Guo, Xing-Yuan Liu, Hua Wang, Li-kun Shi, and Kai Chang,
Dissipation-Shaped Quantum Geometry in Nonlinear Transport,
arXiv:2511.16422

\[104\] H. Liu, J. Zhao, Y.-X. Huang, W. Wu, X.-L. Sheng, C. Xiao, and
S. A. Yang, Intrinsic second-order anomalous Hall effect and its
application in compensated antiferromagnets, Phys. Rev. Lett. 127,
277202 (2021).

\[105\] Y. Gao, S. A. Yang, and Q. Niu, Field induced positional shift
of Bloch electrons and its dynamical implications, Phys. Rev. Lett. 112,
166601 (2014).

\[106\] Maria Teresa Mercaldo, Mario Cuoco, and Camine Ortix, Nonlinear
planar magnetotransport as a probe of the quantum geometry of
topological surface states, Phys. Rev. B 111, 155442 (2025)

\[107\] Yuan Dong Wang, Zhi Fan Zhang, Zhen-Gang Zhu, and Gang Su,
Intrinsic nonlinear Ohmic current, Phys. Rev. B 109, 085419 (2024).

\[108\] Longjun Xiang, Hao Jin, and Jian Wang, Spin Transport Revealed
by Spin Quantum Geometry, Phys. Rev. Let. 135, 146303 (2025).

\[109\] Longjun Xiang, Jinxiong Jia, Fuming Xu, Zhenhua Qiao, and Jian
Wang, Intrinsic Gyrotropic Magnetic Current from Zeeman Quantum
Geometry, Phys. Rev. Let.. 134, 116301 (2025)

\[110\] Neelanjan Chakraborti,Sudeep Kumar Ghosh and Snehasish Nandy,
Intrinsic Linear Response from Zeeman Quantum Geometry in 2D
Unconventional Magnets, arXiv:2508.14745

\[111\] Longjun Xiang, Jinxiong Jia, Fuming Xu, and Jian Wang,
Classification of electromagnetic responses by quantum geometry,
arXiv:2510.02661

\[112\] Longjun Xiang, Bin Wang, Yadong Wei, Zhenhua Qiao, and Jian
Wang, Linear displacement current solely driven by the quantum metric,
Phys. Rev. B 109, 115121 ~(2024).

\[113\] Navot Silberstein, Jan Behrends, Moshe Goldstein, and Roni Ilan,
Berry connection induced anomalous wave-packet dynamics in non-Hermitian
systems, Phys. Rev. B 102, 245147 (2020)

\[114\] Weicen Dong, Qing-Dong Jiang, and Matteo Baggioli, Non-Hermitian
wave-packet dynamics and its realization within a non-Hermitian chiral
cavity, arXiv:2501.12163

\[115\] Chao Chen Ye, W. L. Vleeshouwers, S. Heatley, V. Gritsev and C.
Morais Smith, Quantum metric of non-Hermitian Su-Schrieffer-Heeger
systems, Phys. Rev. Res. 6, 023202 (2024)

\[116\] Jan Behrends, Roni Ilan, and Moshe Goldstein, Quantum geometry
of non-Hermitian systems, arXiv:2503.13604

\[117\] Shi-Dong Liang, Guang-Yao Huang, Topological invariance and
global Berry phase in non-Hermitian systems Phys. Rev. A 87, 012118
(2013)

\[118\] H. Jiang, C. Yang and S. Chen, Topological invariants and phase
diagrams for one-dimensional two-band non-Hermitian systems without
chiral symmetry, Phys. Rev. A 98, 052116 (2018)

\[119\] K. Esaki, M. Sato, K. Hasebe, and M. Kohmoto, Edge states and
topological phases in non-Hermitian systems, Phys. Rev. B #strong[84],
205128 (2011).

\[120\] B. Zhu, R. Lu and S. Chen, PT symmetry in the non-Hermitian
Su-Schrieffer-Heeger model with complex boundary potentials, Phys. Rev.
A #strong[89], 062102 (2014).

\[121\] C. Yin, H. Jiang, L. Li, Rong Lu and S. Chen, Geometrical
meaning of winding number and its characterization of topological phases
in one-dimensional chiral non-Hermitian systems, Phys. Rev. A
#strong[97], 052115 (2018).

\[122\] H. Shen, B. Zhen and L. Fu, Topological Band Theory for
Non-Hermitian Hamiltonians, Phys. Rev. Lett. #strong[120], 146402
(2018).

\[123\] S. Lieu, Topological phases in the non-Hermitian
Su-Schrieffer-Heeger model, Phys. Rev. B #strong[97], 045106 (2018).

\[124\] M. Ezawa, Electric circuits for non-Hermitian Chern insulators,
Phys. Rev. B 100, 081401(R) (2019).

\[125\] M. Ezawa, Electric circuit simulations of nth-Chern-number
insulators in 2n-dimensional space and their non-Hermitian
generalizations for arbitrary n Phys. Rev. B 100, 075423 (201).

\[126\] A. Uhlmann, Parallel transport and “quantum holonomy”~along
density operators, Reports on Mathematical Physics 24, 229 (1986)

\[127\] A. Uhlmann, A gauge field governing parallel transport along
mixed states, Letters in Mathematical Physics 21, 229 (1991)

\[128\] M. Hubner, Explicit computation of the Bures distance for
density matrices, Phys. Lett. A 163, 239 (1992).

\[129\] A. Carollo, B. Spagnolo, and D. Valenti, Uhlmann curvature in
dissipative phase transitions, Scientific Reports 8, 9852 (2018)

\[130\] L. Leonforte, D. Valenti, B. Spagnolo, and A. Carollo, Uhlmann
number in translational invariant systems, Scientific Reports 9, 9106
(2019)

\[131\] Y. M. Zhang, X. W. Li, W. Yang and G. R. JinQuantum Fisher
information of entangled coherent states in the presence of photon loss,
Phys. Rev. A 88 043832 (2013)

\[132\] Jing Liu, Xiao-Xing Jing, Wei Zhong, Xiaoguang Wang, Quantum
Fisher information for density matrices with arbitrary ranks,
Communications in Theoretical Physics, 61(01), 45 (2014)

\[133\] Jing Liu, Heng-Na Xiong, Fei Song, Xiaoguang Wang, Fidelity
susceptibility and quantum Fisher information for density operators with
arbitrary ranks, Physica A 410, 167 (2014)

\[134\] M. Hubner, Computation of Uhlmann's parallel transport for
density matrices and the Bures metric on three-dimensional Hilbert
space, Phys. Lett. A 179, 226 (1993)

\[135\] A. Uhlmann, Geometric phases and related structures, Rep. Math.
Phys. 36, 461 (1995)

\[136\] Donald Bures, An extension of Kakutani's theorem on infinite
product measures to the tensor product of semifinite
$omega^(*)$-algebras, Transactions of the American Mathematical Society.
\135. American Mathematical Society (AMS): 199 (1969)

\[137\] Matteo G. A. Paris, Quantum estimation for quantum technology,
Int. J. Quant. Inf. 7, 125 (2009)

\[138\] Xu-Yang Hou, Zheng Zhou, Xin Wang, Hao Guo, and Chih-Chun Chien,
Local geometry and quantum geometric tensor of mixed states, Phys. Rev.
B 110, 035144 (2024)

\[139\] Carl W. Helstrom, Quantum Detection and Estimation Theory,
Journal of Statistical Physics, 1, 231 (1969)

\[140\] Guangyue Ji, David E. Palomino, Nathan Goldman, Tomoki Ozawa,
Peter Riseborough, Jie Wang, and Bruno Mera, Density Matrix Geometry and
Sum Rules, arXiv:2507.14028

\[141\] Samuel L. Braunstein and Carlton M. Caves, Statistical distance
and the geometry of quantum states, Phys. Rev. Lett. 72, 3439 (1994)

\[142\] Samuel L. Braunstein, Carlton M. Caves, G.J. Milburn,
Generalized Uncertainty Relations: Theory, Examples, and Lorentz
Invariance, Annals of Physics 247, 135 (1996)

\[143\] M. Ezawa, Third-order and fifth-order nonlinear spin-current
generation in g-wave and i-wave altermagnets and perfectly nonreciprocal
spin current in f-wave magnets, Phys. Rev. B 111, 125420 (2025).

\[144\] Merce Roig, Andreas Kreise, Yue Yu, Brian M. Andersen, and Danie
F. Agterberg, Minimal models for altermagnetism, Phys. Rev. B 110,
144412 (2024)

\[145\] L. Smejkal, A. H. MacDonald, J. Sinova, S. Nakatsuji and T.
Jungwirth, Anomalous Hall antiferromagnets, Nat. Rev. Mater. 7, 482
(2022).

\[146\] Di Zhu, Zheng-Yang Zhuang, Zhigang Wu, and Zhongbo Yan,
Topological superconductivity in two-dimensional altermagnetic metals,
Phys. Rev. B 108, 184505 (2023).

\[147\] Sayed Ali Akbar Ghorashi, Taylor L. Hughes, Jennifer Cano,
Altermagnetic Routes to Majorana Modes in Zero Net Magnetization, Phys.
Rev. Lett. 133, 106601 (2024).

\[148\] Yu-Xuan Li and Cheng-Cheng Liu, Majorana corner modes and
tunable patterns in an altermagnet heterostructure, Phys. Rev. B 108,
205410 (2023).

\[149\] M. Ezawa. Detecting the Neel vector of altermagnets in
heterostructures with a topological insulator and a crystalline
valley-edge insulator, Physical Review B 109 (24), 245306 (2024).

\[150\] Shun Okumura, Takahiro Morimoto, Yasuyuki Kato, and Yukitoshi
Motome, Quadratic optical responses in a chiral magnet, Phys. Rev. B
104, L180407 (2021)

\[151\] Honglin Zhou, Muyu Wang, Xiaoyan Ma, Gang Li, Ding-Fu Shao, Bo
Liu, Shiliang Li, Anisotropic resistivity of a p-wave magnet candidate
CeNiAsO, rXiv:2509.07351

\[152\] Rinsuke Yamada, Max T. Birch, Priya R. Baral, Shun Okumura,
Ryota Nakano, Shang Gao, Yuki Ishihara, Kamil K. Kolincio, Ilya
Belopolski, Hajime Sagayama, Hironori Nakao, Kazuki Ohishi, Taro
Nakajima, Yoshinori Tokura, Taka-hisa Arima, Yukitoshi Motome, Moritz M.
Hirschmann, and Max Hirschberger, Gapping the spin-nodal planes of an
anisotropic p-wave magnet to induce a large anomalous Hall effect,
arXiv:2502.10386

\[153\] Qian Song, Srdjan Stavric, Paolo Barone, Andrea Droghetti,
Daniil S. Antonenko, Jorn W. F. Venderbos, Connor A. Occhialini, Batyr
Ilyas, Emre Ergecen, Nuh Gedik, Sang-Wook Cheong, Rafael M. Fernandes,
Silvia Picozzi, and Riccardo Comin, Electrical switching of a p-wave
magnet, Nature 642, 64 (2025)

\[154\] Sanjib Kumar Das, Bitan Roy, From local spin nematicity to
altermagnets: Footprints of band topology, Phys. Rev. B 111, L201102
(2025).

\[155\] Yichen Liu, Junxi Yu, and Cheng-Cheng Liu, Twisted Magnetic Van
der Waals Bilayers: An Ideal Platform for Altermagnetism, Phys. Rev.
Lett. 133, 206702 (2024)

\[156\] K.-H. Ahn, A. Hariki, K.-W. Lee, and J. Kunes,
Antiferromagnetism in RuO$""_2

$ as d-wave Pomeranchuk instability, Phys.
Rev. B 99, 184432 (2019).

\[157\] L.Smejkal, R. Gonzalez-Hernandez, T.Jungwirth, and J. Sinova,
Crystal time-reversal symmetry breaking and spontaneous Hall effect in
collinear antiferromagnets. Science Advances 6, eaaz8809 (2020).

\[158\] Teresa Tschirner, Philipp Keler, Ruben Dario Gonzalez
Betancourt, Tommy Kotte, Dominik Kriegner, Bernd Buechner, Joseph
Dufouleur, Martin Kamp, Vedran Jovic, Libor Smejkal, Jairo Sinova, Ralph
Claessen, Tomas Jungwirth, Simon Moser, Helena Reichlova, Louis Veyrat,
Saturation of the anomalous Hall effect at high magnetic fields in
altermagnetic RuO$""_2$, APL Mater. 11, 101103 (2023)

\[159\] O. Fedchenko, J. Minar, A. Akashdeep, S.W. D'Souza, D. Vasilyev,
O. Tkach, L. Odenbreit, Q.L. Nguyen, D. Kutnyakhov, N. Wind, L.
Wenthaus, M. Scholz, K. Rossnagel, M. Hoesch, M. Aeschlimann, B.
Stadtmueller, M. Klaeui, G. Schoenhense, G. Jakob, T. Jungwirth, L.
Smejkal, J. Sinova, H. J. Elmers, Observation of time-reversal symmetry
breaking in the band structure of altermagnetic RuO$""_2$, Science
Advances 10,5 (2024) DOI: 10.1126/sciadv.adj4883.

\[160\] Zihan Lin, Dong Chen, Wenlong Lu, Xin Liang, Shiyu Feng, Kohei
Yamagami, Jacek Osiecki, Mats Leandersson, Balasubramanian Thiagarajan,
Junwei Liu, Claudia Felser, Junzhang Ma, Observation of Giant Spin
Splitting and d-wave Spin Texture in Room Temperature Altermagnet
RuO$""_2$, arXiv:2402.04995.

\[161\] Miina Leivisk Javier Rial, Anton Badura, Rafael Lopes Seeger,
Ismaa Kounta, Sebastian Beckert, Dominik Kriegner, Isabelle Joumard, Eva
Schmoranzerov Jairo Sinova, Olena Gomonay, Andy Thomas, Sebastian T. B.
Goennenwein, Helena Reichlov Libor Smejkal, Lisa Michez, Tom Jungwirth,
Vincent Baltz, Anisotropy of the anomalous Hall effect in the
altermagnet candidate Mn$""_5$Si$""_3$ films, Phys. Rev. B 109, 224430
(2024)

\[162\] I. I. Mazin, K. Koepernik, M.D. Johannes, Rafael
Gonzalez-Herndez, Libor Šmejkal, Prediction of unconventional magnetism
in doped FeSb$""_2$, Proceedings of the National Academy of Sciences
118, e2108924118 (2021)

\[163\] Bei Jiang, Mingzhe Hu, Jianli Bai, Ziyin Song, Chao Mu, Gexing
Qu, Wan Li, Wenliang Zhu, Hanqi Pi, Zhongxu Wei, Yu-Jie Sun, Yaobo
Huang, Xiquan Zheng, Yingying Peng, Lunhua He, Shiliang Li, Jianlin Luo,
Zheng Li, Genfu Chen, Hang Li, Hongming Weng and Tian Qian, A metallic
room-temperature d-wave altermagnet KV2Se2O, Nature Physics 21, 754
(2025)

\[164\] S. Hayami, Y. Yanagi, and H. Kusunose, Spontaneous antisymmetric
spin splitting in noncollinear antiferromagnets without spin-orbit
coupling, Phys. Rev. B 101, 220403 (2020)

\[165\] J. Krempask, L. Šmejkal, S. W. D'Souza, M. Hajlaoui, G.
Springholz, K. Uhlov F. Alarab, P. C. Constantinou, V. Strocov, D.
Usanov, W. R. Pudelko, R. Gonzez-Herndez, A. Birk Hellenes, Z. Jansa, H.
Reichlov Z. Šob, R. D. Gonzalez Betancourt, P. Wadley, J. Sinova, D.
Kriegner, J. Min, J. H. Dil and T. Jungwirth, Altermagnetic lifting of
Kramers spin degeneracy, Nature 626, 517 (2024).

\[166\] Suyoung Lee, Sangjae Lee, Saegyeol Jung, Jiwon Jung, Donghan
Kim, Yeonjae Lee, Byeongjun Seok, Jaeyoung Kim, Byeong Gyu Park, Libor
Šmejkal, Chang-Jong Kang, and Changyoung Kim, Broken Kramers Degeneracy
in Altermagnetic MnTe, Phys. Rev. Lett. 132, 036702 (2024)

\[167\] T. Osumi, S. Souma, T. Aoyama, K. Yamauchi, A. Honma, K.
Nakayama, T. Takahashi, K. Ohgushi, and T. Sato, Observation of a giant
band splitting in altermagnetic MnTe, Phys. Rev. B 109, 115102 (2024)

\[168\] M. Hajlaoui, S.W. D'Souza, L. Šmejkal, D. Kriegner, G. Krizman,
T. Zakusylo, N. Olszowska, O. Caha, J. Michalička, A. Marmodoro, K.
Vyborny, A. Ernst, M. Cinchetti, J. Minar, T. Jungwirth, G. Springholz,
Temperature Dependence of Relativistic Valence Band Splitting Induced by
an Altermagnetic Phase Transition, Advanced Material 36, 2314076 (2024)

\[169\] Suyoung Lee, Sangjae Lee, Saegyeol Jung, Jiwon Jung, Donghan
Kim, Yeonjae Lee, Byeongjun Seok, Jaeyoung Kim, Byeong Gyu Park, Libor
Šmejkal, Chang-Jong Kang, Changyoung Kim, Broken Kramers Degeneracy in
Altermagnetic MnTe, Phys. Rev. Lett. 132, 036702 (2024).

\[170\] Zheyuan Liu, Makoto Ozeki, Shinichiro Asai, Shinichi Itoh, and
Takatsugu Masuda, Chiral Split Magnon in Altermagnetic MnTe Phys. Rev.
Lett. 133, 156702 (2024).

\[171\] Sonka Reimers, Lukas Odenbreit, Libor Šmejkal, Vladimir N.
Strocov, Procopios Constantinou, Anna B. Hellenes, Rodrigo Jaeschke
Ubiergo, Warlley H. Campos, Venkata K. Bharadwaj, Atasi Chakraborty,
Thibaud Denneulin, Wen Shi, Rafal E. Dunin-Borkowski, Suvadip Das,
Mathias Kli, Jairo Sinova & Martin Jourdan, Direct observation of
altermagnetic band splitting in CrSb thin films, Nat. Com. 15, 2116
(2024)

\[172\] Guowei Yang, Zhanghuan Li, Sai Yang, Jiyuan Li, Hao Zheng,
Weifan Zhu, Ze Pan, Yifu Xu, Saizheng Cao, Wenxuan Zhao, Anupam Jana,
Jiawen Zhang, Mao Ye, Yu Song, Lun-Hui Hu, Lexian Yang, Jun Fujii, Ivana
Vobornik, Ming Shi, Huiqiu Yuan, Yongjun Zhang, Yuanfeng Xu, Yang Liu,
Three-dimensional mapping and electronic origin of large altermagnetic
splitting near Fermi level in CrSb, arXiv:2405.12575

\[173\] Jianyang Ding, Zhicheng Jiang, Xiuhua Chen, Zicheng Tao,
Zhengtai Liu, Jishan Liu, Tongrui Li, Jiayu Liu, Yichen Yang, Runfeng
Zhang, Liwei Deng, Wenchuan Jing, Yu Huang, Yuming Shi, Shan Qiao, Yilin
Wang, Yanfeng Guo, Donglai Feng, Dawei Shen, Large band-splitting in
g-wave type altermagnet CrSb, arXiv:2405.12687

\[174\] Cong Li, Mengli Hu, Zhilin Li, Yang Wang, Wanyu Chen,
Balasubramanian Thiagarajan, Mats Leandersson, Craig Polley, Timur Kim,
Hui Liu, Cosma Fulga, Maia G. Vergniory, Oleg Janson, Oscar Tjernberg,
Jeroen van den Brink, Topological Weyl Altermagnetism in CrSb,
arXiv:2405.14777

\[175\] Wenlong Lu, Shiyu Feng, Yuzhi Wang, Dong Chen, Zihan Lin, Xin
Liang, Siyuan Liu, Wanxiang Feng, Kohei Yamagami, Junwei Liu, Claudia
Felser, Quansheng Wu, Junzhang Ma, Observation of surface Fermi arcs in
altermagnetic Weyl semimetal CrSb, arXiv:2407.13497

\[176\] Mayukh Kumar Ray, Mingxuan Fu, Youzhe Chen, Taishi Chen, Takuya
Nomoto, Shiro Sakai, Motoharu Kitatani, Motoaki Hirayama, Shusaku Imajo,
Takahiro Tomita, Akito Sakai, Daisuke Nishio-Hamane, Gregory T.
McCandless, Michi-To Suzuki, Zhijun Xu, Yang Zhao, Tom Fennell,
Yoshimitsu Kohama, Julia Y. Chan, Ryotaro Arita, Collin Broholm and
Satoru Nakatsuji, Zero-field Hall effect emerging from a non-Fermi
liquid in a collinear antiferromagnet V$""_(1 \/ 3)$NbS$""_2$, Nature
Communications 16, 3532 (2025)

\[177\] Rina Takagi, Ryosuke Hirakida, Yuki Settai, Rikuto Oiwa,
Hirotaka Takagi, Aki Kitaori, Kensei Yamauchi , Hiroki Inoue, Jun-Ichi
Yamaura, Daisuke Nishio-Hamane, Shinichi Itoh, Seno Aji, Hiraku Saito,
Taro Nakajima, Takuya Nomoto, Ryotaro Arita, Shinichiro Seki,
Spontaneous Hall effect induced by collinear antiferromagnetic order at
room temperature, Nat Mater. 24, 63 (2025).

\[178\] I. Mazin, R. Gonzalez-Hernandez, and L. Smejkal, Induced
monolayer altermagnetism in mnp(s,se)3 and fese arXiv:2309.02355

\[179\] M. Julliere, Tunneling between ferromagnetic films, Phys. Lett.
A 54, 225 (1975).

\[180\] J. S. Moodera, L. R. Kinder, T. M. Wong, and R. Meservey, Large
magnetoresistance at room temperature in ferromagnetic thin film tunnel
junctions, Phys. Rev. Lett. 74, 3273 (1995).

\[181\] F. Liu, Z. Zhang, X. Yuan, Y. Liu, S. Zhu, Z. Lu, and R. Xiong,
Giant tunneling magnetoresistance in insulated altermagnet/ferromagnet
junctions induced by spin-dependent tunneling effect, Phys. Rev. B 110,
134437 (2024).

\[182\] Run-Wu Zhang, Chaoxi Cui, Runze Li, Jingyi Duan, Lei Li,
Zhi-Ming Yu and Yugui Yao, Predictable Gate-Field Control of Spin in
Altermagnets with Spin-Layer Coupling Phys. Rev. Let. 133, 056401 (2024)

\[183\] B. Chi, L. Jiang, Y. Zhu, G. Yu, C. Wan, J. Zhang, and X. Han,
Crystal-facet-oriented altermagnets for detecting ferromagnetic and
antiferromagnetic states by giant tunneling magnetoresistance, Phys.
Rev. Applied 21, 034038 (2024).

\[184\] Z. Yan, R. Yang, C. Fang, W. Lu, and X. Xu, Giant electrode
effect on tunneling magnetoresistance and electroresistance in van der
waals intrinsic multiferroic tunnel junctions using VS2, Phys. Rev. B
109, 205409 (2024).

\[185\] Dmitrii L. Vorobev and Vladimir A. Zyuzin, d-wave Hall effect
and linear magnetoconductivity in metallic collinear antiferromagnets,
Phys. Rev. B 109, L180411 (2024)

\[186\] Zongmeng Yang, Xingyue Yang, Jianhua Wang, Rui Peng, Lee Ching,
Hua, Lay Kee Ang, Jing Lu, Yee Sin Ang, and Shibo fang, Unconventional
tunnel magnetoresistance scaling with altermagnets, arXiv:2505.17192

\[187\] Yu-Fei Sun, Yue Mao, Yu-Chen Zhuang,and Qing-Feng Sun, Tunneling
Magnetoresistance Effect in Altermagnets, arXiv:2509.04015

\[188\] Bjonulf Brekke, Pavlo Sukhachov, Hans Glokner Giil, Arne
Brataas, Jacob Linder, Minimal models and transport properties of
unconventional p-wave magnets, Phys. Rev. Lett. 133, 236703 (2024)

\[189\] Amar Fakhredine, Raghottam M. Sattigeri, Giuseppe Cuono, and
Carmine Autieri, Interplay between altermagnetism and nonsymmorphic
symmetries generating large anomalous Hall conductivity by semi-Dirac
points induced anticrossings, Phys. Rev. B 108, 115138 (2023).

\[190\] Toshihiro Sato, Sonia Haddad, Ion Cosma Fulga, Fakher F. Assaad,
Jeroen van den Brink, Altermagnetic anomalous Hall effect emerging from
electronic correlations, Phys. Rev. Lett. 133, 086503 (2024)

\[191\] H. X. Tang, R.K. Kawakami, D. D. Awschalom, and M. L. Rouk,
Giant Planar Hall Effect in Epitaxial (Ga,Mn)As Devices, Phys. Rev.
Lett. 90, 107201 (2003).

\[192\] Xin Liu, Hsiu-Chuan Hsu, and Chao-Xing Liu, In-Plane
Magnetization-Induced Quantum Anomalous Hall Effect, Phys. Rev. Lett.
111, 086802 (2013).

\[193\] S. Nandy, Gargee Sharma, A. Taraphder, and Sumanta Tewari,
Chiral Anomaly as the Origin of the Planar Hall Effect in Weyl
Semimetals, Phys. Rev. Lett. 119, 176804 (2017).

\[194\] A. A. Taskin, Henry F. Legg, Fan Yang, Satoshi Sasaki, Yasushi
Kanai, Kazuhiko Matsumoto, Achim Rosch and Yoichi Ando, Planar Hall
effect from the surface of topological insulators, Nature Communications
8, 1340 (2017).

\[195\] A. A. Burkov, Giant planar Hall effect in topological metals,
Phys. Rev. B 96, 041110(R) (2017).

\[196\] Nitesh Kumar, Satya N. Guin, Claudia Felser, and Chandra
Shekhar, Planar Hall effect in the Weyl semimetal GdPtBi, Phys. Rev. B
98, 041103(R) (2018).

\[197\] Zhao Liu, Gan Zhao, Bing Liu, Z.F. Wang, Jinlong Yang, and Feng
Liu, Intrinsic Quantum Anomalous Hall Effect with In-Plane
Magnetization: Searching Rule and Material Prediction, Phys. Rev. Lett.
121, 246401 (2018).

\[198\] Srimayi Korrapati, Snehasish Nandy, and Sumanta Tewari,
Approximate half-integer quantization in anomalous planar transport in
d-wave altermagnets, arXiv:2506.24122.

\[199\] Bao-Feng Chen, Jie-Xiang Yu, and Gen Yin, Large anisotropic
magnetoresistance in $

alpha$-MnTe induced by strain, arXiv:2507.16738.

\[200\] B. M. Fregoso, R. A. Muniz and J.E. Sipe, Jerk Current: A Novel
Bulk Photovoltaic Effect, Phys. Rev. Lett. 121, 176604 (2018)

\[201\] G. B. Ventura, D.J. Passos, J. M. Viana Parente Lopes, and J. M.
B. Lopes dos Santos, Comment on \"Jerk Current: A Novel Bulk
Photovoltaic Effect\" Phys. Rev. Lett. 126, 259701 (2021)

\[202\] B. M. Fregoso, R. A. Muniz and J.E. Sipe, \"Fregoso, Muniz, and
Sipe Reply\" Phys. Rev. Lett. 126, 259702 (2021)

\[203\] Benjamin M. Fregoso, Bulk photovoltaic effects in the presence
of a static electric field, Phys. Rev. B 100, 064301 (2019): Erratum,
Phys. Rev. B ~102, 059901(E) (2020)

\[204\] A. S Holevo, Statistical decision theory for quantum systems,
Journal of Multivariate Analysis, 3, 337 (1973)
