// Typst format conversion of arXiv:2601.18382v1 under CC BY 4.0.
#set page(paper: "a4", margin: (x: 18mm, y: 20mm), numbering: "1")
#set text(font: "Libertinus Serif", size: 10pt)
#set par(justify: true)
#set heading(numbering: "1.1")
#set math.equation(numbering: "(1)")
#align(center)[
  #text(size: 16pt, weight: "bold")[On the relation between time-reversed acoustics and Green's function retrieval in space-variant and in time-variant materials]
  #v(4pt)
  Kees Wapenaar#super[a], Johannes Aichele#super[b], and Dirk-Jan van Manen#super[b]

  #super[a] Delft University of Technology, Department of Geoscience and Engineering, Stevinweg 1, 2628 CN Delft, The Netherlands \
  #super[b] ETH Zürich, Institute of Geophysics, Sonneggstrasse 5, 8092 Zürich, Switzerland
]
#heading(numbering: none)[Abstract]

The methods of time-reversed acoustics and Green's function retrieval
are traditionally deployed for classical inhomogeneous, time-invariant
materials. The mutual relation between these methods is
well-established. Recently, similar methods have been proposed for
homogeneous, time-variant materials. Here we investigate their mutual
relation and their relation with the corresponding methods in classical
materials. For this analysis we make use of the fact that the wave
equations for both types of material are similar, with the roles of time
and space interchanged. However, the principle of causality holds for
both types of material, hence, here the roles of time and space are not
interchanged. We find that

- whereas classical time-reversed acoustics involves emission of a
  time-reversed single-component wave field from a (ideally closed)
  boundary into the inhomogeneous material, its idealized counterpart
  involves emission of a sign-reversed two-component wave field,
  recorded in a time-reversed material, from a single time instant into
  the actual time-variant material;

- whereas classical Green's function retrieval involves temporal
  crosscorrelation of wave fields at two space locations in response to
  single-component sources on a (ideally closed) boundary, its
  counterpart involves spatial crosscorrelation of wave fields at two
  time instants in response to two-component sources at a single time
  instant.

= Introduction
<introduction>
Waves propagating through time-variant materials are scattered by time
boundaries, just as waves propagating through space-variant materials
are scattered by spatial boundaries. For electromagnetic waves,
scattering by time boundaries has been studied for decades
#link(<ref:Morgenthaler58IRE>)[\[1\]]#link(<ref:Jiang75IEEE>)[\[2\]]#link(<ref:Mendonca2002PS>)[\[3\]]. The research in this area
expanded significantly since the introduction of dynamic metamaterials
#link(<ref:Koutserimpas2018IEEE>)[\[4\]]#link(<ref:Caloz2020IEEE1>)[\[5\]]#link(<ref:Ramaccia2020OL>)[\[6\]]#link(<ref:Apffel2022PRL>)[\[7\]]#link(<ref:Moussa2023NP>)[\[8\]]#link(<ref:Pacheco2025PRB>)[\[9\]]#link(<ref:Stefanini2025PRL>)[\[10\]].
For acoustic waves, the phenomenon of time scattering has been
introduced by Fink and coworkers
#link(<ref:Bacot2016NP>)[\[11\]]#link(<ref:Fink2017EPJ>)[\[12\]]#link(<ref:Bal2019SIAM>)[\[13\]]#link(<ref:Hidalgo2023PRL>)[\[14\]]#link(<ref:Delory2025PRL>)[\[15\]]. In
particular, they demonstrated theoretically and experimentally that a
time boundary sends waves back in space to focus at their origin,
similar to time-reversed waves that are sent back from a spatial
boundary #link(<ref:Fink92IEEE>)[\[16\]].

Whether we consider acoustic or electromagnetic waves, there exists much
analogy between wave phenomena in homogeneous, time-variant materials,
and those in "classical" inhomogeneous, time-invariant materials
#link(<ref:Mendonca2002PS>)[\[3\]]#link(<ref:Xiao2014OL>)[\[17\]]#link(<ref:Hoop2014WM>)[\[18\]]#link(<ref:Salem2015arXiv>)[\[19\]]#link(<ref:Torrent2018PRB>)[\[20\]]#link(<ref:Caloz2020IEEE2>)[\[21\]]#link(<ref:Manen2024arXiv>)[\[22\]]#link(<ref:Wapenaar2024WM>)[\[23\]].
In particular, the roles of time and space are interchanged between the
wave equations for both types of material. However, the analogy also has
its limitations. For example, waves reflected by a time boundary
propagate forward in time and backward in space, similar as waves
reflected by a spatial boundary
#link(<ref:Xiao2014OL>)[\[17\]]#link(<ref:Salem2015arXiv>)[\[19\]]#link(<ref:Caloz2020IEEE2>)[\[21\]]. Hence, here the roles of time
and space are not interchanged. More generally, the principle of
causality is a time-related property, whether we consider time-variant
or space-variant materials #link(<ref:Wapenaar2024WM>)[\[23\]]. In other words, whereas the
roles of time and space are interchanged between the wave equations for
both types of material, they are in general not interchanged in the
initial and boundary conditions, and hence the relation between the
solutions of the wave equations (i.e., the wave fields in both types of
material) is in general not straightforward. Another aspect that
complicates the analogy is the fact that the number of time dimensions
(one) is different from the number of space dimensions (two or three),
except of course for 1D situations.

Despite the aforementioned limitations, we investigate the relation
between time-reversed acoustics and Green's function retrieval in
space-variant and in time-variant materials. For classical
inhomogeneous, time-invariant materials, the research fields of
time-reversed acoustics #link(<ref:Fink92IEEE>)[\[16\]]#link(<ref:Draeger99JASA>)[\[24\]]#link(<ref:DeRosny2002PRL>)[\[25\]] and
Green's function retrieval by temporal crosscorrelation
#link(<ref:Weaver2001PRL>)[\[26\]]#link(<ref:Campillo2003Science>)[\[27\]]#link(<ref:Wapenaar2003GEO>)[\[28\]]#link(<ref:Snieder2004PRE>)[\[29\]]#link(<ref:Schuster2004GJI>)[\[30\]]#link(<ref:VanManen2005PRL>)[\[31\]]
originated independently. However, it was soon discovered that these
fields are closely related #link(<ref:Derode2003JASA>)[\[32\]]#link(<ref:Wapenaar2005JASA>)[\[33\]]. It is
reasonable to assume that a similar close relationship exists between
time-reversed acoustics #link(<ref:Bacot2016NP>)[\[11\]]#link(<ref:Fink2017EPJ>)[\[12\]] and Green's function
retrieval by spatial crosscorrelation #link(<ref:Wapenaar2024WM>)[\[23\]]#link(<ref:Wapenaar2025RS>)[\[35\]] in
homogeneous, time-variant materials. In a companion paper
#link(<ref:Aichele2025arXiv>)[\[36\]] we investigate the relations between temporal and
spatial crosscorrelation, underlying time-reversed acoustics and Green's
function retrieval. In that analysis we keep the material space- and
time-invariant, except for an impulsive temporal disruption,
representing a time boundary. In this paper we extend the analysis for
materials that are either arbitrarily space-variant or arbitrarily
time-variant.

After a brief discussion of the general equations for waves in space-
and time-variant materials (section @sec2), in section @sec3 we review
classical time-reversed acoustics, Green's function retrieval and their
mutual relation for arbitrarily inhomogeneous, time-invariant materials.
This serves as an introduction to section @sec4, where we discuss
time-reversed acoustics, Green's function retrieval and their mutual
relation for homogeneous, arbitrarily time-variant materials. In that
section we also discuss the relation with the classical methods reviewed
in section @sec3. We present conclusions in section @sec5.

= General equations for waves in space- and time-variant materials
<sec2>
Although in this paper we deal primarily with 2D and 3D acoustic waves,
we use a unified notation that also covers 2D horizontally-polarized
shear (SH) waves, 2D transverse electric (TE) and 2D transverse magnetic
(TM) waves (the latter two are relevant because much of the theory for
waves in time-variant materials was initially developed for
electromagnetic waves). We denote position in space by the Cartesian
coordinate vector $upright(bold(x)) = \( x \, y \, z \)$ (for the 3D
situation) or $upright(bold(x)) = \( x \, z \)$ (for the 2D situation),
and time by $t$. With reference to Table @table1, we consider space- and
time-variant wave field quantities $U \( upright(bold(x)) \, t \)$,
$upright(bold(V)) \( upright(bold(x)) \, t \)$,
$P \( upright(bold(x)) \, t \)$ and
$upright(bold(Q)) \( upright(bold(x)) \, t \)$, space- and time-variant
material parameters $alpha \( upright(bold(x)) \, t \)$ and
$beta \( upright(bold(x)) \, t \)$, and space- and time-variant source
quantities $a \( upright(bold(x)) \, t \)$,
$upright(bold(b)) \( upright(bold(x)) \, t \)$. The boldface quantities
$upright(bold(V))$, $upright(bold(Q))$ and $upright(bold(b))$ denote
vectors with three components, i.e.
$upright(bold(V)) = \( V_x \, V_y \, V_z \)$ etc. (for the 3D
situation), or with two components, i.e.
$upright(bold(V)) = \( V_x \, V_z \)$ etc. (for the 2D situation). The
wave field quantities obey the following unified equations
$ partial_t U + upright(bold(nabla)) dot.op upright(bold(Q)) & = & a \, $<eq1>
$ partial_t upright(bold(V)) + upright(bold(nabla)) P & = & upright(bold(b)) \, $<eq2>
where $partial_t$ stands for the partial differential operator
$frac(partial, partial t)$ and $upright(bold(nabla))$ is the nabla
operator, defined as
$upright(bold(nabla)) = \( partial_x \, partial_y \, partial_z \)$ (for
the 3D situation) or
$upright(bold(nabla)) = \( partial_x \, partial_z \)$ (for the 2D
situation). For acoustic waves, using the quantities defined in row 1 of
Table @table1, equation (@eq1) is the acoustic deformation equation,
$- partial_t Theta + upright(bold(nabla)) dot.op upright(bold(v)) = q$,
and equation (@eq2) stands for equilibrium of mechanical momentum,
$partial_t upright(bold(m)) + upright(bold(nabla)) p = upright(bold(f))$
#link(<ref:Hoop95Book>)[\[37\]]#link(<ref:Torrent2018PRB>)[\[20\]].

Assuming the material is isotropic and instantaneously and locally
reacting, the unified wave field quantities in equations (@eq1) and
(@eq2) are related via the constitutive relations
$ U & = & alpha P \, $<eq3>
$ upright(bold(V)) & = & beta upright(bold(Q)) . $<eq4> For acoustic
waves these relations are $- Theta = kappa p$ and
$upright(bold(m)) = rho upright(bold(v))$, respectively.

Equations (@eq1) -- (@eq4) hold in materials of which the parameters
$alpha \( upright(bold(x)) \, t \)$ and
$beta \( upright(bold(x)) \, t \)$ vary continuously with space and
time. They need to be supplemented with boundary conditions at those
positions and times where these parameters are discontinuous. At a
spatial boundary with normal $upright(bold(n)) \( upright(bold(x)) \)$,
where the parameters are discontinuous in space but continuous in time,
the boundary conditions demand that $P$ and
$upright(bold(Q)) dot.op upright(bold(n))$ are continuous (for acoustic
waves these are the well-known boundary conditions for the acoustic
pressure $p$ and the normal component of the particle velocity
$upright(bold(v)) dot.op upright(bold(n))$). At a time boundary, where
the parameters are discontinuous in time but continuous in space, the
boundary conditions demand that $U$ and $upright(bold(V))$ are
continuous
#link(<ref:Xiao2014OL>)[\[17\]]#link(<ref:Morgenthaler58IRE>)[\[1\]]#link(<ref:Mendonca2002PS>)[\[3\]]#link(<ref:Caloz2020IEEE2>)[\[21\]]#link(<ref:Hoop2014WM>)[\[18\]].
Note that at the intersection of a spatial boundary with a time
boundary, the boundary conditions for the spatial boundary are
inconsistent with those for the time boundary. This can be solved by the
introduction of a field-dependent point-source at the intersection
#link(<ref:Stefanini2025PRL>)[\[10\]].

A further discussion of waves in materials in which the parameters vary
with space and time is beyond the scope of this paper. In the following
we consider either arbitrarily inhomogeneous, time-invariant materials,
with parameters $alpha \( upright(bold(x)) \)$ and
$beta \( upright(bold(x)) \)$ (section @sec3), or homogeneous,
arbitrarily time-variant materials, with parameters $alpha \( t \)$ and
$beta \( t \)$ (section @sec4).

#figure(
  align(center)[#table(
    columns: 15,
    align: (left,center,center,center,center,center,center,center,center,center,center,center,center,center,center,),
    table.header([], [$U$], [$V_x$], [$V_y$], [$V_z$], [$P$], [$Q_x$], [$Q_y$], [$Q_z$], [$alpha$], [$beta$], [$a$], [$b_x$], [$b_y$], [$b_z$],),
    table.hline(),
    [1. 2/3D
    Acoustic], [$- Theta$], [$m_x$], [$m_y$], [$m_z$], [$p$], [$v_x$], [$v_y$], [$v_z$], [$kappa$], [$rho$], [$q$], [$f_x$], [$f_y$], [$f_z$],
    [2. 2D
    SH], [$m_y$], [$- 2 e_(y x)$], [-], [$- 2 e_(y z)$], [$v_y$], [$- tau_(y x)$], [-], [$- tau_(y z)$], [$rho$], [$1 / mu$], [$f_y$], [$2 h_(y x)$], [-], [$2 h_(y z)$],
    [3. 2D
    TE], [$D_y$], [$B_z$], [-], [$- B_x$], [$E_y$], [$H_z$], [-], [$- H_x$], [$epsilon$], [$mu$], [$- J_y^(upright(e))$], [$- J_z^(upright(m))$], [-], [$J_x^(upright(m))$],
    [4. 2D
    TM], [$B_y$], [$- D_z$], [-], [$D_x$], [$H_y$], [$- E_z$], [-], [$E_x$], [$mu$], [$epsilon$], [$- J_y^(upright(m))$], [$J_z^(upright(e))$], [-], [$- J_x^(upright(e))$],
  )]
  , caption: [ Specification of the quantities in equations (@eq1) --
  (@eq4). For 2D and 3D acoustic waves, the quantities are cubic
  dilatation $Theta$, mechanical momentum density $m$, acoustic pressure
  $p$, particle velocity $v$, compressibility $kappa$, mass density
  $rho$, volume-injection rate density $q$ and external force density
  $f$. For 2D SH (horizontally polarized shear) waves in the
  $\( x \, z \)$-plane, $m$, $v$, $rho$ and $f$ are defined the same as
  for acoustic waves, and the additional quantities are strain $e$,
  stress $tau$, shear modulus $mu$ and external deformation rate density
  $h$. For 2D TE (transverse electric) and TM (transverse magnetic)
  waves in the $\( x \, z \)$-plane, the quantities are electric and
  magnetic flux densities $D$ and $B$, electric and magnetic field
  strengths $E$ and $H$, permittivity $epsilon$, permeability $mu$, and
  external electric and magnetic current densities $J^(upright(e))$ and
  $J^(upright(m))$. ]
  , kind: table
  )

<table1>
= Time-reversed acoustics and Green's function retrieval in inhomogeneous, time-invariant materials
<sec3>
In this section we review classical time-reversed acoustics and Green's
function retrieval in inhomogeneous, time-invariant materials, and their
mutual relation. In section @sec3A we discuss the wave equation for an
inhomogeneous, time-invariant material, as a special case of the
equations in section @sec2. In section @sec3B we discuss the Green's
function of an inhomogeneous, time-invariant material. In section @sec3H
we review a classical representation of the homogeneous Green's function
of an inhomogeneous, time-invariant material. In sections @sec3C and
@sec3D we show how this homogeneous Green's function representation
leads to time-reversed acoustics and Green's function retrieval,
respectively, in inhomogeneous, time-invariant materials. The review in
this section serves as an introduction to section @sec4, where, in an
analogous way, we discuss time-reversed acoustics and Green's function
retrieval in homogeneous, time-variant materials.

== Wave equation for an inhomogeneous, time-invariant material
<sec3A>
We consider an arbitrarily inhomogeneous, time-invariant material, with
parameters $alpha \( upright(bold(x)) \)$ and
$beta \( upright(bold(x)) \)$. Substituting constitutive relations
(@eq3) and (@eq4) into equations (@eq1) and (@eq2), using the fact that
$alpha \( upright(bold(x)) \)$ and $beta \( upright(bold(x)) \)$ are
time-invariant, we obtain
$ alpha partial_t P + upright(bold(nabla)) dot.op upright(bold(Q)) & = & a \, $<eq6>
$ beta partial_t upright(bold(Q)) + upright(bold(nabla)) P & = & upright(bold(b)) . $<eq7>
For acoustic waves these expressions become
$kappa partial_t p + upright(bold(nabla)) dot.op upright(bold(v)) = q$
and
$rho partial_t upright(bold(v)) + upright(bold(nabla)) p = upright(bold(f))$.
We continue with the general notation of equations (@eq6) and (@eq7), so
that all that follows also holds for 2D SH, TE and TM waves.

The parameters $alpha \( upright(bold(x)) \)$ and
$beta \( upright(bold(x)) \)$ in equations (@eq6) and (@eq7) may vary
continuously with position. For a material with piecewise continuous
parameters, these equations are supplemented with boundary conditions.
At a spatial boundary with normal
$upright(bold(n)) \( upright(bold(x)) \)$, where the parameters undergo
a finite jump, the boundary conditions state that $P$ and
$upright(bold(Q)) dot.op upright(bold(n))$ are continuous over that
boundary.

By eliminating $upright(bold(Q))$ from equations (@eq6) and (@eq7) we
obtain the well-known second order wave equation
$ #scale(x: 240%, y: 240%)[\(] frac(1, beta c^2) partial_t^2 - upright(bold(nabla)) dot.op 1 / beta upright(bold(nabla)) #scale(x: 240%, y: 240%)[\)] P \( upright(bold(x)) \, t \) = s \( upright(bold(x)) \, t \) \, $<eq31x>
with $c \( upright(bold(x)) \)$ being the space-variant propagation
velocity, defined as $ c = 1 / sqrt(alpha beta) $<eq8ah> and
$s \( upright(bold(x)) \, t \)$ the source distribution, defined as
$ s = partial_t a - upright(bold(nabla)) dot.op #scale(x: 240%, y: 240%)[\(] 1 / beta upright(bold(b)) #scale(x: 240%, y: 240%)[\)] . $<eqsourcex>

== Green's function of an inhomogeneous, time-invariant material
<sec3B>
We introduce the Green's function
$cal(G)_x \( upright(bold(x)) \, upright(bold(x))_A \, t \, t_A \)$ of
an inhomogeneous, time-invariant material as the response to an
impulsive point source at $upright(bold(x)) = upright(bold(x))_A$ at
time instant $t = t_A$, observed at position $upright(bold(x))$ and time
$t$. Hence, it obeys wave equation (@eq31x), with the source term
$s \( upright(bold(x)) \, t \)$ on the right-hand side replaced by an
impulsive point source, according to
$ #scale(x: 240%, y: 240%)[\(] frac(1, beta c^2) partial_t^2 - upright(bold(nabla)) dot.op 1 / beta upright(bold(nabla)) #scale(x: 240%, y: 240%)[\)] cal(G)_x \( upright(bold(x)) \, upright(bold(x))_A \, t \, t_A \) = delta \( upright(bold(x)) - upright(bold(x))_A \) delta \( t - t_A \) \, $<eq31xg>
where $delta \( dot.op \)$ is the Dirac delta function. The subscript
$x$ in $cal(G)_x$ denotes that this is the Green's function of a
space-variant material. The Green's function obeys the causality
condition
$ cal(G)_x \( upright(bold(x)) \, upright(bold(x))_A \, t \, t_A \) = 0 quad upright("for") quad t < t_A . $<eq31cond>
Assuming that the material is homogeneous outside a sphere with
arbitrarily large but finite radius, this causality condition implies
that $cal(G)_x \( upright(bold(x)) \, upright(bold(x))_A \, t \, t_A \)$
is outward propagating for
$\| upright(bold(x)) - upright(bold(x))_A \| arrow.r oo$.

Since the material is time-invariant, the Green's function is time-shift
invariant, hence
$ cal(G)_x \( upright(bold(x)) \, upright(bold(x))_A \, t \, t_A \) = cal(G)_x \( upright(bold(x)) \, upright(bold(x))_A \, t - t_A \, 0 \) . $<eq31shfd>
In the remainder of section @sec3 we take $t_A = 0$.

The Green's function obeys the following reciprocity relation
#link(<ref:Morse53Book>)[\[38\]]#link(<ref:Hoop95Book>)[\[37\]]
$ cal(G)_x \( upright(bold(x))_A \, upright(bold(x))_B \, t \, 0 \) = cal(G)_x \( upright(bold(x))_B \, upright(bold(x))_A \, t \, 0 \) . $<eq31shfrec>
Hence, in an inhomogeneous, time-invariant material, the response to a
source at $upright(bold(x))_B$, observed at $upright(bold(x))_A$, is
equal to the response to a source at $upright(bold(x))_A$, observed at
$upright(bold(x))_B$.

Since wave equation (@eq31xg) contains only even-order time derivatives,
the time-reversed Green's function
$cal(G)_x \( upright(bold(x)) \, upright(bold(x))_A \, - t \, 0 \)$ is
also a solution of this equation (with $t_A = 0$). This acausal Green's
function is inward propagating for
$\| upright(bold(x)) - upright(bold(x))_A \| arrow.r oo$. It propagates
backward through the inhomogeneous material, converges to a sink at
$upright(bold(x)) = upright(bold(x))_A$ and $t = 0$, after which it
disappears.

We define the homogeneous Green's function of an inhomogeneous,
time-invariant material as the difference of the Green's function and
its time-reversed version, according to
$ cal(G)_x^h \( upright(bold(x)) \, upright(bold(x))_A \, t \, 0 \) = cal(G)_x \( upright(bold(x)) \, upright(bold(x))_A \, t \, 0 \) - cal(G)_x \( upright(bold(x)) \, upright(bold(x))_A \, - t \, 0 \) . $<eqghom>
Both terms on the right-hand side obey the same wave equation, with the
same singularity
$delta \( upright(bold(x)) - upright(bold(x))_A \) delta \( t \)$. This
singularity cancels when we subtract the equations for the Green's
function and its time-reversed version. Hence, the homogeneous Green's
function obeys the following equation
$ #scale(x: 240%, y: 240%)[\(] frac(1, beta c^2) partial_t^2 - upright(bold(nabla)) dot.op 1 / beta upright(bold(nabla)) #scale(x: 240%, y: 240%)[\)] cal(G)_x^h \( upright(bold(x)) \, upright(bold(x))_A \, t \, 0 \) = 0 . $<eq31xghom>
Note that
$cal(G)_x^h \( upright(bold(x)) \, upright(bold(x))_A \, t \, 0 \)$ is
called the homogeneous Green's function because it is a solution of this
homogeneous differential equation (hence, here "homogeneous" does not
refer to the material parameters, which may still be arbitrarily
inhomogeneous, but to the absence of the singularity in the wave
equation). Unlike the Green's function
$cal(G)_x \( upright(bold(x)) \, upright(bold(x))_A \, t \, 0 \)$ and
its time-reversed version
$cal(G)_x \( upright(bold(x)) \, upright(bold(x))_A \, - t \, 0 \)$, the
homogeneous Green's function
$cal(G)_x^h \( upright(bold(x)) \, upright(bold(x))_A \, t \, 0 \)$ is
not singular for $upright(bold(x)) arrow.r upright(bold(x))_A$ and
$t arrow.r 0$.

From equations (@eq31shfrec) and (@eqghom) it follows that the
homogeneous Green's function obeys the following reciprocity relation
$ cal(G)_x^h \( upright(bold(x))_A \, upright(bold(x))_B \, t \, 0 \) = cal(G)_x^h \( upright(bold(x))_B \, upright(bold(x))_A \, t \, 0 \) . $<eq31shfreckkk>

== Homogeneous Green's function representation for an inhomogeneous, time-invariant material
<sec3H>
In the research fields holographic imaging and inverse scattering, the
homogeneous Green's function is often expressed in terms of an integral
representation #link(<ref:Porter70JOSA>)[\[39\]]#link(<ref:Oristaglio89IP>)[\[40\]]. The original representation
is in the space-frequency domain. In the space-time domain, the
homogeneous Green's function representation reads
$ cal(G)_x^h \( upright(bold(x)) \, upright(bold(x))_A \, t \, 0 \) & = & integral.cont_(cal(S)) frac(1, beta \( upright(bold(x))' \)) #scale(x: 180%, y: 180%)[\[] { upright(bold(nabla))' cal(G)_x \( upright(bold(x)) \, upright(bold(x))' \, t \, 0 \) } *_t cal(G)_x \( upright(bold(x))' \, upright(bold(x))_A \, - t \, 0 \)\
 &  & - cal(G)_x \( upright(bold(x)) \, upright(bold(x))' \, t \, 0 \) *_t upright(bold(nabla))' cal(G)_x \( upright(bold(x))' \, upright(bold(x))_A \, - t \, 0 \) #scale(x: 180%, y: 180%)[\]] dot.op upright(bold(n)) upright(d) upright(bold(x))' . $<eq1616>
Here $cal(S)$ is an arbitrarily-shaped closed boundary with outward
pointing normal vector $upright(bold(n))$ (for the 3D situation,
$cal(S)$ is a closed 2D boundary and hence the integral is a 2D surface
integral; for the 2D situation $cal(S)$ is a closed 1D curve in the
$\( x \, z \)$-plane and the integral is a 1D line integral). The points
indicated by $upright(bold(x))_A$ and $upright(bold(x))$ are both
located inside $cal(S)$. The prime in $upright(bold(nabla))'$ denotes
that this nabla operator acts on $upright(bold(x))'$, hence
$upright(bold(nabla))' = \( partial_(x') \, partial_(y') \, partial_(z') \)$
(in 3D) or $upright(bold(nabla))' = \( partial_(x') \, partial_(z') \)$
(in 2D). The symbol $*_t$ stands for a temporal convolution, according
to
$f \( t \) *_t g \( t \) = integral_(- oo)^oo f \( t - t' \) g \( t' \) upright(d) t'$.
When one of the functions is reversed in time, we obtain
$f \( t \) *_t g \( - t \) = integral_(- oo)^oo f \( t - t' \) g \( - t' \) upright(d) t'$.
Hence, $f \( t \) *_t g \( - t \)$ stands for a temporal
crosscorrelation of the functions $f \( t \)$ and $g \( t \)$. In the
following we show how the homogeneous Green's function representation of
equation (@eq1616) forms a theoretical basis for time-reversed acoustics
and for Green's function retrieval.

== Time-reversed acoustics in an inhomogeneous, time-invariant material
<sec3C>
We start by reviewing the principle of time-reversed acoustics in an
inhomogeneous, time-invariant material, in an intuitive way. Consider an
impulsive point source at $upright(bold(x))_A$ and $t = 0$ in an
arbitrarily inhomogeneous, time-invariant material. The response to this
source, $P \( upright(bold(x))' \, t \)$, is recorded by receivers at
$upright(bold(x))'$ on a closed boundary, see @Figure1\(a). In
the acoustic situation, $P$ stands for the acoustic pressure. Next, the
responses are reversed in time, yielding
$P \( upright(bold(x))' \, - t \)$, and these time-reversed signals are
fed to sources at the positions of the receivers, see @Figure1\(b). The time-reversed wave field obeys the same wave equation
as the original wave field. Hence, the time-reversed field emitted by
the sources at the boundary propagates back through the inhomogeneous
material and at $t = 0$ it focuses at the original source position
$upright(bold(x))_A$ (@Figure1\(b)).

In geophysics, this time-reversal principle is used to determine the
parameters of earthquake sources
#link(<ref:McMechan82GJR>)[\[41\]]#link(<ref:Gajewski2005GJI>)[\[42\]]#link(<ref:Larmat2010PhysicsToday>)[\[43\]] and to perform
seismic imaging #link(<ref:Hemon78GP>)[\[44\]]#link(<ref:Whitmore83SEG>)[\[45\]]#link(<ref:McMechan83GP>)[\[46\]]#link(<ref:Zhou2018ESR>)[\[47\]]. Note
that in geophysics the time-reversed field is not physically emitted
into the earth, but instead the back-propagation is carried out
numerically.

Fink and coworkers #link(<ref:Fink92IEEE>)[\[16\]]#link(<ref:Draeger99JASA>)[\[24\]]#link(<ref:DeRosny2002PRL>)[\[25\]] developed
the field of time-reversed acoustics for ultrasonic measurements, in
which piezoelectric transducers are initially used as receivers (as in
@Figure1\(a)) and subsequently as sources (as in @Figure1\(b)), emitting the time-reversed responses physically into the
material.

Note that once the field has focused at $upright(bold(x))_A$ and
$t = 0$, there is no sink to absorb the focused field, hence, the wave
field continues its propagation #link(<ref:Derode2003JASA>)[\[32\]]. Hence, the focused
field acts as a source which emits waves into the inhomogeneous
material, see @Figure1\(c). In other words, the focused field at
$t = 0$ is a virtual source for the field for $t > 0$.

#figure(grid(columns: (3 * (1fr,)), gutter: 2mm, image("source/Figure1a.svg", width: 100%), image("source/Figure1b.svg", width: 100%), image("source/Figure1c.svg", width: 100%)),
  caption: [
    Principle of time-reversed acoustics in an inhomogeneous,
    time-invariant material. (a) The response to a source at
    $upright(bold(x))_A$ and $t = 0$ (indicated by the red dot),
    recorded by receivers at $upright(bold(x))'$. (b) Time-reversed
    response, fed to sources at $upright(bold(x))'$. The wave field
    emitted by these sources focuses at $t = 0$ at the original source
    position $upright(bold(x))_A$. (c) After having focused, the wave
    field continues its propagation. The focused field at $t = 0$ is a
    virtual source (indicated by the pink dot) for the field for
    $t > 0$.
  ]
)
<Figure1>

Let us now review the mathematics behind time-reversed acoustics, using
the representation of equation (@eq1616) as the starting point
#link(<ref:Fink2001IP>)[\[48\]]. We start by assuming that the boundary $cal(S)$ is
sufficiently smooth and that the material at and outside $cal(S)$ is
homogeneous, with parameters $alpha_0$, $beta_0$ and $c_0$. Then the
contribution of the two terms under the integral in equation (@eq1616)
are nearly identical (but with opposite signs) #link(<ref:Wapenaar2005JASA>)[\[33\]]. Hence,
we obtain
$ cal(G)_x^h \( upright(bold(x)) \, upright(bold(x))_A \, t \, 0 \) & = & 2 / beta_0 integral.cont_(cal(S)) { upright(bold(nabla))' cal(G)_x \( upright(bold(x)) \, upright(bold(x))' \, t \, 0 \) dot.op upright(bold(n)) } *_t cal(G)_x \( upright(bold(x))' \, upright(bold(x))_A \, - t \, 0 \) upright(d) upright(bold(x))' . $<eq1515>
Inside $cal(S)$, we define a source function
$s \( upright(bold(x)) \, t \) = delta \( upright(bold(x)) - upright(bold(x))_A \) s_0 \( t \)$,
which is a point source at $upright(bold(x)) = upright(bold(x))_A$ with
source wavelet $s_0 \( t \)$. From equations (@eq31x) and (@eq31xg)
(with $t_A = 0$) it follows that the response to this source, observed
at $upright(bold(x))'$ on $cal(S)$, is given by
$P \( upright(bold(x))' \, t \) = cal(G)_x \( upright(bold(x))' \, upright(bold(x))_A \, t \, 0 \) *_t s_0 \( t \)$
(@Figure1\(a)). Convolving both sides of equation (@eq1515) with
the time-reversal of the source wavelet and substituting equation
(@eqghom) into the left-hand side yields
$  &  & { cal(G)_x \( upright(bold(x)) \, upright(bold(x))_A \, t \, 0 \) - cal(G)_x \( upright(bold(x)) \, upright(bold(x))_A \, - t \, 0 \) } *_t s_0 \( - t \) =\
 &  & #h(9em) 2 / beta_0 integral.cont_(cal(S)) underbrace({ upright(bold(nabla))' cal(G)_x \( upright(bold(x)) \, upright(bold(x))' \, t \, 0 \) dot.op upright(bold(n)) }, upright("“propagator”")) *_t underbrace(P \( upright(bold(x))' \, - t \), upright(" “source field”")) upright(d) upright(bold(x))' . $<eq1717>
The right-hand side quantifies the propagation of the time-reversed
field $P \( upright(bold(x))' \, - t \)$ from sources on $cal(S)$ to any
point $upright(bold(x))$ inside $cal(S)$. The second term on the
left-hand side,
$cal(G)_x \( upright(bold(x)) \, upright(bold(x))_A \, - t \, 0 \) *_t s_0 \( - t \)$,
is the field converging to $upright(bold(x))_A$ (@Figure1\(b)).
The first term on the left-hand side,
$cal(G)_x \( upright(bold(x)) \, upright(bold(x))_A \, t \, 0 \) *_t s_0 \( - t \)$,
is the field diverging from $upright(bold(x))_A$ (@Figure1\(c)).

In most practical situations, the object of investigation cannot be
accessed from a closed boundary. Replacing the closed boundary integral
in equation (@eq1717) by an open boundary integral necessarily leads to
approximations, which can be partly remedied by iterative methods. A
further discussion is beyond the scope of this paper; we refer to the
extensive literature on iterative time-reversed acoustics (for example
references #link(<ref:Prada95JASA>)[\[49\]]#link(<ref:Montaldo2005IEEE>)[\[50\]]#link(<ref:Borcea2007IP>)[\[51\]]) and on the
Marchenko method (for example references
#link(<ref:Rose2002IP>)[\[52\]]#link(<ref:Broggini2012EJP>)[\[53\]]#link(<ref:Wapenaar2013PRL>)[\[54\]]).

== Green's function retrieval in an inhomogeneous, time-invariant material
<sec3D>
Under specific circumstances, the temporal crosscorrelation of passive
noise measurements at two receivers in an inhomogeneous, time-invariant
material converges to the response at one of these receivers as if there
were a source at the position of the other (i.e., the Green's function
between the two receivers)
#link(<ref:Weaver2001PRL>)[\[26\]]#link(<ref:Campillo2003Science>)[\[27\]]#link(<ref:Wapenaar2003GEO>)[\[28\]]#link(<ref:Snieder2004PRE>)[\[29\]]#link(<ref:Malcolm2004PRE>)[\[55\]]#link(<ref:Roux2004JASA2>)[\[56\]]#link(<ref:Haney2009GRL>)[\[57\]]#link(<ref:Sabra2007APL>)[\[58\]].
We review the mathematics behind this principle of Green's function
retrieval, using equation (@eq1515) as the starting point
#link(<ref:Wapenaar2003GEO>)[\[28\]]#link(<ref:Wapenaar2005JASA>)[\[33\]]. Using reciprocity relation
(@eq31shfrec) and substituting equation (@eqghom) into the left-hand
side yields
$  &  & cal(G)_x \( upright(bold(x)) \, upright(bold(x))_A \, t \, 0 \) - cal(G)_x \( upright(bold(x)) \, upright(bold(x))_A \, - t \, 0 \) =\
 &  & #h(7em) 2 / beta_0 integral.cont_(cal(S)) { upright(bold(nabla))' cal(G)_x \( upright(bold(x)) \, upright(bold(x))' \, t \, 0 \) dot.op upright(bold(n)) } *_t cal(G)_x \( upright(bold(x))_A \, upright(bold(x))' \, - t \, 0 \) upright(d) upright(bold(x))' . $<eq1919>
The Green's function
$cal(G)_x \( upright(bold(x))_A \, upright(bold(x))' \, t \, 0 \)$ on
the right-hand side represents the response to an impulsive monopole
source at $upright(bold(x))'$ on $cal(S)$ and $t = 0$, recorded by a
receiver at $upright(bold(x))_A$. Similarly,
$upright(bold(nabla))' cal(G)_x \( upright(bold(x)) \, upright(bold(x))' \, t \, 0 \) dot.op upright(bold(n))$
represents the response to an impulsive dipole source at
$upright(bold(x))'$ on $cal(S)$ and $t = 0$, recorded by a receiver at
$upright(bold(x))$. Both responses are illustrated in @Figure2\(a). The entire right-hand side quantifies the temporal
crosscorrelation of these responses at $upright(bold(x))_A$ and
$upright(bold(x))$, integrated over all sources at $upright(bold(x))'$
on $cal(S)$. The left-hand side consists of the Green's function
$cal(G)_x \( upright(bold(x)) \, upright(bold(x))_A \, t \, 0 \)$ (minus
its time-reversed version). This is the response to an impulsive virtual
source at $upright(bold(x))_A$ and $t = 0$, recorded by a physical
receiver at $upright(bold(x))$, see @Figure2\(b).

#figure(grid(columns: (2 * (1fr,)), gutter: 2mm, image("source/Figure2a.svg", width: 100%), image("source/Figure2b.svg", width: 100%)),
  caption: [
    Principle of Green's function retrieval in an inhomogeneous,
    time-invariant material. (a) Responses to impulsive sources at
    $upright(bold(x))'$ and $t = 0$, recorded by receivers at
    $upright(bold(x))_A$ and $upright(bold(x))$. (b) Response to a
    virtual source at $upright(bold(x))_A$ (indicated by the pink dot),
    recorded by a receiver at $upright(bold(x))$, obtained from the
    temporal crosscorrelation of the responses in (a), integrated over
    all sources at $upright(bold(x))'$ on $cal(S)$.
  ]
)
<Figure2>

When only monopole sources are available on $cal(S)$, we need to
approximate the dipole responses on the right-hand side of equation
(@eq1919) by monopole responses. We already assumed that the material at
and outside $cal(S)$ is homogeneous, with parameters $alpha_0$, $beta_0$
and $c_0$. If we assume in addition that $cal(S)$ is a sphere with very
large radius, we may use the following approximation on $cal(S)$
$ upright(bold(nabla))' cal(G)_x \( upright(bold(x)) \, upright(bold(x))' \, t \, 0 \) dot.op upright(bold(n)) & approx & - 1 / c_0 partial_t cal(G)_x \( upright(bold(x)) \, upright(bold(x))' \, t \, 0 \) . $
Substituting this into equation (@eq1919), using
${ partial_t f \( t \) } *_t g \( t \) = partial_t { f \( t \) *_t g \( t \) }$,
yields
$  &  & cal(G)_x \( upright(bold(x)) \, upright(bold(x))_A \, t \, 0 \) - cal(G)_x \( upright(bold(x)) \, upright(bold(x))_A \, - t \, 0 \) approx\
 &  & #h(7em) - frac(2, beta_0 c_0) partial_t integral.cont_(cal(S)) cal(G)_x \( upright(bold(x)) \, upright(bold(x))' \, t \, 0 \) *_t cal(G)_x \( upright(bold(x))_A \, upright(bold(x))' \, - t \, 0 \) upright(d) upright(bold(x))' . $<eq22>
Now the right-hand side quantifies the time-derivative of the
crosscorrelation of monopole responses, integrated over the sources. An
alternative form, without the time-derivative, reads #link(<ref:Wapenaar2006GEO>)[\[59\]]
$  &  & G_x \( upright(bold(x)) \, upright(bold(x))_A \, t \, 0 \) + G_x \( upright(bold(x)) \, upright(bold(x))_A \, - t \, 0 \) approx\
 &  & #h(7em) frac(2, beta_0 c_0) integral.cont_(cal(S)) G_x \( upright(bold(x)) \, upright(bold(x))' \, t \, 0 \) *_t G_x \( upright(bold(x))_A \, upright(bold(x))' \, - t \, 0 \) upright(d) upright(bold(x))' \, $<eq22alt>
where the Green's function
$G_x \( upright(bold(x)) \, upright(bold(x))_A \, t \, 0 \)$ is the
response to a source
$a \( upright(bold(x)) \, t \) = delta \( upright(bold(x)) - upright(bold(x))_A \) delta \( t \)$,
$upright(bold(b)) \( upright(bold(x)) \, t \) = upright(bold(0))$. Since
$s \( upright(bold(x)) \, t \) = partial_t a \( upright(bold(x)) \, t \)$
(equation @eqsourcex) and the material is time-invariant, we have
$G_x \( upright(bold(x)) \, upright(bold(x))_A \, t \, 0 \) = partial_t cal(G)_x \( upright(bold(x)) \, upright(bold(x))_A \, t \, 0 \)$.
Expressions (@eq22) and (@eq22alt) are useful when the responses to all
sources on $cal(S)$ are individually available, such as in
controlled-source seismic interferometry
#link(<ref:Bakulin2006GEO>)[\[60\]]#link(<ref:Schuster2009Book>)[\[61\]]#link(<ref:Neut2011GEO>)[\[62\]]. Of course approximations
are introduced when the sources are not available on a closed boundary,
similar as in time-reversed acoustics, as noted in section @sec3C.

For the derivation of Green's function retrieval from ambient noise,
consider the situation in which the sources at all $upright(bold(x))'$
on $cal(S)$ are simultaneously acting noise sources
$N \( upright(bold(x))' \, t \)$. In that case, the fields at
$upright(bold(x))_A$ and $upright(bold(x))$ are given by
$p \( upright(bold(x))_A \, t \) = integral.cont_(cal(S)) cal(G)_x \( upright(bold(x))_A \, upright(bold(x))' \, t \, 0 \) *_t N \( upright(bold(x))' \, t \) upright(d) upright(bold(x))'$
and
$p \( upright(bold(x)) \, t \) = integral.cont_(cal(S)) cal(G)_x \( upright(bold(x)) \, upright(bold(x))'' \, t \, 0 \) *_t N \( upright(bold(x))'' \, t \) upright(d) upright(bold(x))''$,
respectively. We assume that the noise sources are mutually
uncorrelated, according to
$chevron.l N \( upright(bold(x))'' \, t \) *_t N \( upright(bold(x))' \, - t \) chevron.r = delta \( upright(bold(x))' - upright(bold(x))'' \) C \( t \)$.
Here $C \( t \)$ is the temporal autocorrelation of the noise (which is
assumed to be the same for all sources) and $chevron.l dot.op chevron.r$
stands for ensemble averaging, which in practice is replaced by
averaging over very long time. Further,
$delta \( upright(bold(x))' - upright(bold(x))'' \)$ is a delta function
defined in $cal(S)$. The crosscorrelation of the fields at
$upright(bold(x))_A$ and $upright(bold(x))$ thus gives #link(<ref:Wapenaar2006GEO>)[\[59\]]
$ zws chevron.l p \( upright(bold(x)) \, t \) *_t p \( upright(bold(x))_A \, - t \) chevron.r & = & integral.cont_(cal(S)) cal(G)_x \( upright(bold(x)) \, upright(bold(x))' \, t \, 0 \) *_t cal(G)_x \( upright(bold(x))_A \, upright(bold(x))' \, - t \, 0 \) *_t C \( t \) upright(d) upright(bold(x))' . $<eq35>
Convolving both sides of equation (@eq22) with the autocorrelation
$C \( t \)$, using
${ partial_t f \( t \) } *_t g \( t \) = partial_t { f \( t \) *_t g \( t \) }$
and equation (@eq35) to simplify the right-hand side, we obtain
$ { cal(G)_x \( upright(bold(x)) \, upright(bold(x))_A \, t \, 0 \) - cal(G)_x \( upright(bold(x)) \, upright(bold(x))_A \, - t \, 0 \) } *_t C \( t \) approx - frac(2, beta_0 c_0) partial_t chevron.l p \( upright(bold(x)) \, t \) *_t p \( upright(bold(x))_A \, - t \) chevron.r . $<eq3SSIb>
This is the basic expression for Green's function retrieval from noise,
also known as ambient-noise interferometry
#link(<ref:Weaver2001PRL>)[\[26\]]#link(<ref:Derode2003JASA>)[\[32\]]#link(<ref:Wapenaar2003GEO>)[\[28\]]#link(<ref:Campillo2003Science>)[\[27\]]#link(<ref:Snieder2004PRE>)[\[29\]]#link(<ref:Wapenaar2006GEO>)[\[59\]].
It states that the time-derivative of the crosscorrelation of two noise
recordings at receiver positions $upright(bold(x))_A$ and
$upright(bold(x))$, averaged over long enough time, converges to the
Green's function between $upright(bold(x))_A$ and $upright(bold(x))$
(minus its time-reversed version), convolved with the temporal
autocorrelation of the noise. Hence, the receiver at
$upright(bold(x))_A$ is turned into a virtual source.

An alternative form of equation (@eq3SSIb), in terms of the Green's
function
$G_x \( upright(bold(x)) \, upright(bold(x))_A \, t \, 0 \) = partial_t cal(G)_x \( upright(bold(x)) \, upright(bold(x))_A \, t \, 0 \)$,
reads
$ { G_x \( upright(bold(x)) \, upright(bold(x))_A \, t \, 0 \) + G_x \( upright(bold(x)) \, upright(bold(x))_A \, - t \, 0 \) } *_t C \( t \) approx frac(2, beta_0 c_0) chevron.l p \( upright(bold(x)) \, t \) *_t p \( upright(bold(x))_A \, - t \) chevron.r . $<eq3SSIbalt>

In most practical situations the sources are not distributed along a
closed boundary, the noise sources may be mutually correlated, the noise
spectra may not be the same for all sources, the wave fields may not
obey a simple scalar wave equation, etc. Hence, the expressions derived
in this section are at best approximations for real situations. Much
research has been done to overcome these limitations, of which we
mention iterative correlation #link(<ref:Stehly2008JGR>)[\[63\]], multidimensional
deconvolution #link(<ref:Wapenaar2010JASA>)[\[64\]]#link(<ref:Neut2011GEO>)[\[62\]], directional balancing
#link(<ref:Curtis2010GEO>)[\[65\]] and generalized interferometry #link(<ref:Fichtner2017GJI>)[\[66\]]. A
further discussion is beyond the scope of this paper.

= Time-reversed acoustics and Green's function retrieval in homogeneous, time-variant materials
<sec4>
We discuss time-reversed acoustics and Green's function retrieval in
homogeneous, time-variant materials, and their mutual relation. The
setup is analogous to that in section @sec3 for inhomogeneous,
time-invariant materials, which facilitates the comparison of the
methodologies for both types of material. In section @sec4A we discuss
the wave equation for a homogeneous, time-variant material, as a special
case of the equations in section @sec2. In section @sec4B we discuss the
Green's function of a homogeneous, time-variant material. In section
@sec4C we discuss the propagator matrix for a homogeneous, time-variant
material. In section @sec4H we use this propagator matrix as the basis
for deriving a representation of the homogeneous Green's function of a
homogeneous, time-variant material. In sections @sec4D and @sec4E we
show how this homogeneous Green's function representation leads to
time-reversed acoustics and Green's function retrieval, respectively, in
homogeneous, time-variant materials.

== Wave equation for a homogeneous, time-variant material
<sec4A>
We consider a homogeneous, arbitrarily time-variant material, with
parameters $alpha \( t \)$ and $beta \( t \)$. Substituting constitutive
relations (@eq3) and (@eq4) into equations (@eq1) and (@eq2), using the
fact that $alpha \( t \)$ and $beta \( t \)$ are space-invariant, we
obtain
$ partial_t U + 1 / beta upright(bold(nabla)) dot.op upright(bold(V)) & = & a \, $<eq49>
$ partial_t upright(bold(V)) + 1 / alpha upright(bold(nabla)) U & = & upright(bold(b)) . $<eq50>
For acoustic waves these expressions become
$- partial_t Theta + 1 / rho upright(bold(nabla)) dot.op upright(bold(m)) = q$
and
$partial_t upright(bold(m)) - 1 / kappa upright(bold(nabla)) Theta = upright(bold(f))$.
We continue with the general notation of equations (@eq49) and (@eq50),
so that all that follows also holds for 2D SH, TE and TM waves.

The parameters $alpha \( t \)$ and $beta \( t \)$ in equations (@eq49)
and (@eq50) may vary continuously with time. For a material with
piecewise continuous parameters, these equations are supplemented with
boundary conditions. At a time boundary, where the parameters undergo a
finite jump, the boundary conditions state that $U$ and
$upright(bold(V))$ are continuous over that boundary.

By eliminating $upright(bold(V))$ from equations (@eq49) and (@eq50) we
obtain the second order wave equation
$ #scale(x: 120%, y: 120%)[\(] partial_t beta partial_t - beta c^2 upright(bold(nabla))^2 #scale(x: 120%, y: 120%)[\)] U \( upright(bold(x)) \, t \) = s \( upright(bold(x)) \, t \) \, $<eq31a>
with $c \( t \)$ being the time-variant propagation velocity, defined
again as $c = 1 / sqrt(alpha beta)$, and $s \( upright(bold(x)) \, t \)$
the source distribution, defined as
$ s = partial_t \( beta a \) - upright(bold(nabla)) dot.op upright(bold(b)) . $<eqsource>

== Green's function of a homogeneous, time-variant material
<sec4B>
We introduce the Green's function
$cal(G)_t \( upright(bold(x)) \, upright(bold(x))_A \, t \, t_A \)$ of a
homogeneous, time-variant material as the response to an impulsive point
source at $upright(bold(x)) = upright(bold(x))_A$ at time instant
$t = t_A$, observed at position $upright(bold(x))$ and time $t$. Hence,
it obeys wave equation (@eq31a), with the source term
$s \( upright(bold(x)) \, t \)$ on the right-hand side replaced by an
impulsive point source, according to
$ #scale(x: 120%, y: 120%)[\(] partial_t beta partial_t - beta c^2 upright(bold(nabla))^2 #scale(x: 120%, y: 120%)[\)] cal(G)_t \( upright(bold(x)) \, upright(bold(x))_A \, t \, t_A \) = delta \( upright(bold(x)) - upright(bold(x))_A \) delta \( t - t_A \) . $<eq31agbl>
The subscript $t$ in $cal(G)_t$ denotes that this is the Green's
function of a time-variant material. The Green's function obeys the
causality condition
$ cal(G)_t \( upright(bold(x)) \, upright(bold(x))_A \, t \, t_A \) = 0 quad upright("for") quad t < t_A . $<eq31con>
Assuming that the material is time-invariant after an arbitrarily large
but finite time, this causality condition implies that
$cal(G)_t \( upright(bold(x)) \, upright(bold(x))_A \, t \, t_A \)$ is
outward propagating for
$\| upright(bold(x)) - upright(bold(x))_A \| arrow.r oo$. Analytical
expressions of
$cal(G)_t \( upright(bold(x)) \, upright(bold(x))_A \, t \, t_A \)$ for
the special case of a homogeneous, time-invariant material, are given in
Appendix @AppA1. Here we continue with expressions for a time-variant
material.

Since the material is homogeneous, the Green's function is space-shift
invariant, hence
$ cal(G)_t \( upright(bold(x)) \, upright(bold(x))_A \, t \, t_A \) = cal(G)_t \( upright(bold(x)) - upright(bold(x))_A \, upright(bold(0)) \, t \, t_A \) . $<eq31shf>
In the remainder of section @sec4 we take
$upright(bold(x))_A = upright(bold(0))$.

We introduce an acausal Green's function
$cal(G)_t^a \( upright(bold(x)) \, upright(bold(0)) \, t \, t_A \)$,
obeying the same wave equation as the causal Green's function (equation
(@eq31agbl), with $upright(bold(x))_A = upright(bold(0))$), but with the
acausality condition
$ cal(G)_t^a \( upright(bold(x)) \, upright(bold(0)) \, t \, t_A \) = 0 quad upright("for") quad t > t_A . $<eq31conac>
Assuming that the material is time-invariant before an arbitrarily large
but finite negative time, this acausality condition implies that
$cal(G)_t^a \( upright(bold(x)) \, upright(bold(0)) \, t \, t_A \)$ is
inward propagating for $\| upright(bold(x)) \| arrow.r oo$. It
propagates backward through the time-variant material, converges to a
sink at $upright(bold(x)) = upright(bold(0))$ and $t = t_A$, after which
it disappears. Note, however, that since the material is time-variant,
this acausal Green's function is not the time-reversal of the causal
Green's function, i.e.,
$cal(G)_t^a \( upright(bold(x)) \, upright(bold(0)) \, t \, 0 \) eq.not cal(G)_t \( upright(bold(x)) \, upright(bold(0)) \, - t \, 0 \)$.

The causal and acausal Green's functions are mutually related via the
reciprocity relation #link(<ref:Wapenaar2025RS>)[\[35\]]
$ cal(G)_t \( upright(bold(x)) \, upright(bold(0)) \, t_A \, t_B \) = cal(G)_t^a \( upright(bold(x)) \, upright(bold(0)) \, t_B \, t_A \) . $<eq1022sqshbl>
Hence, in a homogeneous, time-variant material, the causal response to a
source at $t_B$, observed at $t_A$, is equal to the acausal response
observed at $t_B$, absorbed by a sink at $t_A$. This is a useful
relation for $t_A > t_B$. For $t_A < t_B$, equation (@eq1022sqshbl)
reduces to the trivial relation $0 = 0$, on account of equations
(@eq31con) and (@eq31conac).

We define the homogeneous Green's function of a homogeneous,
time-variant material, as the difference of the causal and acausal
Green's functions, according to
$ cal(G)_t^h \( upright(bold(x)) \, upright(bold(0)) \, t \, t_A \) = cal(G)_t \( upright(bold(x)) \, upright(bold(0)) \, t \, t_A \) - cal(G)_t^a \( upright(bold(x)) \, upright(bold(0)) \, t \, t_A \) . $<eq1022sqshblhom>
Both terms on the right-hand side obey the same wave equation, with the
same singularity $delta \( upright(bold(x)) \) delta \( t - t_A \)$.
This singularity cancels when we subtract the equations for the causal
and acausal Green's functions. Hence, the homogeneous Green's function
obeys the following equation
$ #scale(x: 120%, y: 120%)[\(] partial_t beta partial_t - beta c^2 upright(bold(nabla))^2 #scale(x: 120%, y: 120%)[\)] cal(G)_t^h \( upright(bold(x)) \, upright(bold(0)) \, t \, t_A \) = 0 . $<eq31agblhom>
Unlike the Green's function
$cal(G)_t \( upright(bold(x)) \, upright(bold(0)) \, t \, t_A \)$ and
its acausal counterpart
$cal(G)_t^a \( upright(bold(x)) \, upright(bold(0)) \, t \, t_A \)$, the
homogeneous Green's function
$cal(G)_t^h \( upright(bold(x)) \, upright(bold(0)) \, t \, t_A \)$ is
not singular for $upright(bold(x)) arrow.r upright(bold(0))$ and
$t arrow.r t_A$.

From equations (@eq1022sqshbl) and (@eq1022sqshblhom) it follows that
the homogeneous Green's function obeys the following reciprocity
relation
$ cal(G)_t^h \( upright(bold(x)) \, upright(bold(0)) \, t_A \, t_B \) = - cal(G)_t^h \( upright(bold(x)) \, upright(bold(0)) \, t_B \, t_A \) . $<eq1022sqshblkkk>

In the next section we discuss the propagator matrix for a homogeneous,
time-variant material. The elements of this matrix can be expressed in
terms of the homogeneous Green's function
$cal(G)_t^h \( upright(bold(x)) \, upright(bold(0)) \, t \, t_A \)$. The
propagator matrix formalism will be used in section @sec4H as a basis
for deriving a representation of the homogeneous Green's function for a
homogeneous, time-variant material (as the counterpart of the
representation of equation (@eq1616) for an inhomogeneous,
time-invariant material).

== Propagator matrix of a homogeneous, time-variant material
<sec4C>
We reorganize equations (@eq49) and (@eq50) into a matrix-vector wave
equation for a homogeneous, time-variant material, as the counterpart of
a matrix-vector wave equation for an inhomogeneous, time-invariant
material
#link(<ref:Corones75JMAA>)[\[67\]]#link(<ref:Kosloff83GEO>)[\[68\]]#link(<ref:Fishman84JMP>)[\[69\]]#link(<ref:Ursin83GEO>)[\[70\]]#link(<ref:Wapenaar86GP2>)[\[71\]]#link(<ref:Loseth2007GJI>)[\[72\]].
This equation will form the basis for discussing the propagator matrix
of a homogeneous, time-variant material.

We reduce the number of field quantities in equations (@eq49) and
(@eq50) by defining a scalar wave field
$V_(upright(d)) \( upright(bold(x)) \, t \)$ as
$ V_(upright(d)) & = & upright(bold(nabla)) dot.op upright(bold(V)) \, $<eq457b>
where subscript $upright(d)$ refers to "divergence". Using this in
equations (@eq49) and (@eq50), we obtain
$ partial_t U + 1 / beta V_(upright(d)) & = & a \, $<eq49b>
$ partial_t V_(upright(d)) + 1 / alpha upright(bold(nabla))^2 U & = & b_(upright(d)) \, $<eq50b>
with
$ b_(upright(d)) & = & upright(bold(nabla)) dot.op upright(bold(b)) . $<eq458b>
Equations (@eq49b) and (@eq50b) can be reorganized into a matrix-vector
wave equation, according to
$ partial_t upright(bold(q)) = upright(bold(A)) upright(bold(q)) + upright(bold(d)) \, $<eq67blue>
with
$ upright(bold(q)) = vec(U, V_(upright(d))) \, quad upright(bold(A)) = mat(delim: "(", 0, - 1 / beta; - 1 / alpha upright(bold(nabla))^2, 0) \, quad upright(bold(d)) = vec(a, b_(upright(d))) \, $<eq68blue>
where $upright(bold(q)) \( upright(bold(x)) \, t \)$ is a wave field
vector, $upright(bold(A)) \( t \)$ an operator matrix and
$upright(bold(d)) \( upright(bold(x)) \, t \)$ a source vector. The
parameters $alpha \( t \)$ and $beta \( t \)$ in operator matrix
$upright(bold(A)) \( t \)$ may vary continuously with time. For a
material with piecewise continuous parameters, equation (@eq67blue) is
supplemented with boundary conditions: at each time boundary, the wave
field vector $upright(bold(q)) \( upright(bold(x)) \, t \)$ is
continuous over that boundary.

We introduce the $2 times 2$ propagator matrix
$upright(bold(W)) \( upright(bold(x)) \, t \, t_A \)$ as the solution of
equation (@eq67blue) for the source-free situation
#link(<ref:Salem2015arXiv>)[\[19\]]#link(<ref:Torrent2018PRB>)[\[20\]]#link(<ref:Wapenaar2025RS>)[\[35\]], hence
$ partial_t upright(bold(W)) = upright(bold(A)) upright(bold(W)) . $<eq31>
For $t = t_A$ it obeys the initial condition
$ upright(bold(W)) \( upright(bold(x)) \, t_A \, t_A \) = upright(bold(I)) delta \( upright(bold(x)) \) \, $<eq33>
where $upright(bold(I))$ is the identity matrix. The propagator matrix
$upright(bold(W)) \( upright(bold(x)) \, t \, t_A \)$ forms the
counterpart of the propagator matrix for an inhomogeneous,
time-invariant material
#link(<ref:Thomson50JAP>)[\[73\]]#link(<ref:Haskell53BSSA>)[\[74\]]#link(<ref:Gilbert66GEO>)[\[75\]]#link(<ref:Woodhouse74GJR>)[\[76\]]#link(<ref:Kennett79GJRAS>)[\[77\]].
From equations (@eq67blue), (@eq31) and (@eq33), assuming
$alpha \( t \)$ and $beta \( t \)$ vary continuously and there are no
sources between $t_A$ and $t$, it follows that
$upright(bold(q)) \( upright(bold(x)) \, t \)$ can be expressed as
$ upright(bold(q)) \( upright(bold(x)) \, t \) = upright(bold(W)) \( upright(bold(x)) \, t \, t_A \) *_x upright(bold(q)) \( upright(bold(x)) \, t_A \) . $<eqprop>
Here $t$ may be larger or smaller than, or equal to $t_A$. The symbol
$*_x$ stands for a 3D or 2D spatial convolution, according to
$f \( upright(bold(x)) \) *_x g \( upright(bold(x)) \) = integral f \( upright(bold(x)) - upright(bold(x))' \) g \( upright(bold(x))' \) upright(d) upright(bold(x))'$.

Let $t_1 dots.h t_n dots.h t_(N - 1)$ be time instants where the
parameters $alpha \( t \)$ and $beta \( t \)$ may be discontinuous.
Then, by applying equation (@eqprop) recursively (starting with
$t_A = t_0$), we obtain
$ upright(bold(W)) \( upright(bold(x)) \, t_N \, t_0 \) = upright(bold(W)) \( upright(bold(x)) \, t_N \, t_(N - 1) \) *_x dots.h.c *_x upright(bold(W)) \( upright(bold(x)) \, t_n \, t_(n - 1) \) *_x dots.h.c *_x upright(bold(W)) \( upright(bold(x)) \, t_1 \, t_0 \) . $<eqrecur>
This expression is useful for numerical modeling, in which case the
$t_n$ are ordered from small to large (an example is given at the end of
this section). However, this expression remains valid for arbitrarily
ordered $t_n$.

We partition the $2 times 2$ matrix
$upright(bold(W)) \( upright(bold(x)) \, t \, t_A \)$ as follows
$ upright(bold(W)) \( upright(bold(x)) \, t \, t_A \) = mat(delim: "(", W^(U \, U), W^(U \, V); #none, ; W^(V \, U), W^(V \, V)) \( upright(bold(x)) \, t \, t_A \) . $<eq34>
According to equation (11.27) in #link(<ref:Wapenaar2025RS>)[\[35\]],
$W^(U \, V) \( upright(bold(x)) \, t \, t_A \)$ is related to the causal
and acausal Green's functions via
$ W^(U \, V) \( upright(bold(x)) \, t \, t_A \) & = & cal(G)_t^a \( upright(bold(x)) \, upright(bold(0)) \, t \, t_A \) - cal(G)_t \( upright(bold(x)) \, upright(bold(0)) \, t \, t_A \)\
 & = & - cal(G)_t^h \( upright(bold(x)) \, upright(bold(0)) \, t \, t_A \) . $<eq35aa>
According to equations (11.18), (11.20) and (11.21) in #link(<ref:Wapenaar2025RS>)[\[35\]],
the other components of the propagator matrix can be expressed in terms
of $W^(U \, V) \( upright(bold(x)) \, t \, t_A \)$. Combining those
relations with equation (@eq35aa) we obtain
$ W^(V \, V) \( upright(bold(x)) \, t \, t_A \) & = & beta \( t \) partial_t cal(G)_t^h \( upright(bold(x)) \, upright(bold(0)) \, t \, t_A \) \, $<eq39>
$ W^(U \, U) \( upright(bold(x)) \, t \, t_A \) & = & - beta \( t_A \) partial_(t_A) cal(G)_t^h \( upright(bold(x)) \, upright(bold(0)) \, t \, t_A \) \, $<eq40>
$ W^(V \, U) \( upright(bold(x)) \, t \, t_A \) & = & beta \( t \) beta \( t_A \) partial_t partial_(t_A) cal(G)_t^h \( upright(bold(x)) \, upright(bold(0)) \, t \, t_A \) . $<eq41>
Equations (@eq34) -- (@eq41) show that the propagator matrix is
expressed in terms of the Green's function and its derivatives. This
property is restricted to homogeneous, time-variant materials (i.e., it
does not hold for the analogous case of inhomogeneous, time-invariant
materials). This is explained as follows. For inhomogeneous,
time-invariant materials, the initial condition of the propagator matrix
(equation (@eq33)) is replaced by a boundary condition, but the
causality condition of the Green's function (equation (@eq31con))
remains valid (i.e., it is not replaced by a boundary condition).
Therefore, since time and space are interchangeable for the propagator
matrix but not for the Green's function, the relations between the
propagator matrix and the Green's function, as expressed by equations
(@eq35aa) -- (@eq41), have no counterpart for inhomogeneous,
time-invariant materials. In section @sec4H we make use of the simple
relations between the propagator matrix and the Green's function to
derive a representation of the homogeneous Green's function from a
representation of the propagator matrix.

#figure(image("source/Figure3.svg", width: 92%),
  caption: [
    2D Green's function
    $cal(G)_t \( upright(bold(x)) \, upright(bold(0)) \, t \, t' = 0 \)$
    (convolved with a spatial wavelet) in a piecewise constant,
    time-variant material. The red dot indicates the source at
    $upright(bold(x)) = upright(bold(0))$ and $t' = 0$. The dashed blue
    planes indicate the time boundaries.
  ]
)
<Figure3>

#figure(image("source/Figure4.svg", width: 92%),
  caption: [
    Snapshots of the Green's function of @Figure3 for constant
    $t$ as a function of $upright(bold(x)) = \( x \, z \)$. Movie
    available at https:\/\/www.keeswapenaar.nl/TimeMaterial/Green5.mp4
  ]
)
<Figure4>

#figure(image("source/Figure5.svg", width: 92%),
  caption: [
    Cross-section of the Green's function of @Figure3 for $z = 0$
    as a function of $\( x \, t \)$. The red dot indicates the source at
    $upright(bold(x)) = upright(bold(0))$ and $t' = 0$. The dashed blue
    lines indicate the time boundaries.
  ]
)
<Figure5>

We conclude this section with a 2D numerical example of a Green's
function in a homogeneous, time-variant material. We consider a
piecewise constant material consisting of five time-invariant slabs,
with propagation velocities of 1500, 2500, 2000, 1400 and 1400 m
s$""^(- 1)$. The parameter $beta$ is taken constant throughout. The
duration of each time-invariant slab is 20 $mu$s. We use equation
(@eqrecur), starting with $t_0 = 0$ $mu$s, stepping through the material
with steps of 2.5 $mu$s. For
$upright(bold(W)) \( upright(bold(x)) \, t_n \, t_(n - 1) \)$ we use the
analytical expression given in Appendix @AppA2. After each time step, we
extract minus the upper-right element, i.e.,
$- W^(U \, V) \( upright(bold(x)) \, t_n \, t_0 \) = cal(G)_t \( upright(bold(x)) \, upright(bold(0)) \, t_n \, t_0 \)$
(the acausal Green's function is zero since $t_n > t_0$ for all $n$).
The result (convolved with a spatial wavelet with a central wavenumber
$k_0 \/ 2 pi = 100$ m$""^(- 1)$) is shown in @Figure3 as a
function of $upright(bold(x)) = \( x \, z \)$ and $t$ (for later
convenience we have replaced $t_0$ by $t' = 0$). Snapshots for constant
$t$ are shown in @Figure4 and a cross-section as a function of
$\( x \, t \)$ for $z = 0$ in Figure~@Figure5. These figures clearly
show that when a wave encounters a time boundary (indicated by the blue
dashed lines in @Figure5), it is partly transmitted and partly
reflected.

== Homogeneous Green's function representation for a homogeneous, time-variant material
<sec4H>
As a counterpart of equation (@eq1616), which is a representation of the
homogeneous Green's function
$cal(G)_x^h \( upright(bold(x)) \, upright(bold(x))_A \, t \, 0 \)$ in
an inhomogeneous, time-invariant material, here we seek for a
representation of the homogeneous Green's function
$cal(G)_t^h \( upright(bold(x)) \, upright(bold(0)) \, t \, t_A \)$ in a
homogeneous, time-variant material. To this end, we first formulate a
representation of the propagator matrix
$upright(bold(W)) \( upright(bold(x)) \, t \, t_A \)$. As a special case
of equation (@eqrecur) we write
$ upright(bold(W)) \( upright(bold(x)) \, t \, t_A \) = upright(bold(W)) \( upright(bold(x)) \, t \, t' \) *_x upright(bold(W)) \( upright(bold(x)) \, t' \, t_A \) . $<eqbasis>
In general, the order of $t$, $t'$ and $t_A$ is arbitrary, but in the
following we assume that $t'$ is smaller than both $t_A$ and $t$. Hence,
on the right-hand side, the elements of matrix
$upright(bold(W)) \( upright(bold(x)) \, t' \, t_A \)$ (with $t' < t_A$)
consist only of (derivatives of) the acausal part of the homogeneous
Green's functions. On the other hand, the elements of matrix
$upright(bold(W)) \( upright(bold(x)) \, t \, t' \)$ (with $t' < t$)
consist only of (derivatives of) the causal part of the homogeneous
Green's functions. Using the partitioning defined in equation (@eq34),
we thus obtain for the upper-right element of
$upright(bold(W)) \( upright(bold(x)) \, t \, t_A \)$
$ W^(U \, V) \( upright(bold(x)) \, t \, t_A \) = W^(U \, U) \( upright(bold(x)) \, t \, t' \) *_x W^(U \, V) \( upright(bold(x)) \, t' \, t_A \) + W^(U \, V) \( upright(bold(x)) \, t \, t' \) *_x W^(V \, V) \( upright(bold(x)) \, t' \, t_A \) \, $<eqWUV>
with $t' < t_A$ and $t' < t$, or, substituting equations (@eq35aa) --
(@eq40),
$ cal(G)_t^h \( upright(bold(x)) \, upright(bold(0)) \, t \, t_A \) & = & beta \( t' \) #scale(x: 180%, y: 180%)[\[] partial_(t') cal(G)_t \( upright(bold(x)) \, upright(bold(0)) \, t \, t' \) *_x cal(G)_t^a \( upright(bold(x)) \, upright(bold(0)) \, t' \, t_A \)\
 &  & - cal(G)_t \( upright(bold(x)) \, upright(bold(0)) \, t \, t' \) *_x partial_(t') cal(G)_t^a \( upright(bold(x)) \, upright(bold(0)) \, t' \, t_A \) #scale(x: 180%, y: 180%)[\]] . $<eq58kk>
This is the homogeneous Green's function representation for a
homogeneous, time-variant material. It is the counterpart of equation
(@eq1616), with coordinates $upright(bold(x))$, $upright(bold(x))'$,
$upright(bold(x))_A$ and $t$ replaced by $t$, $t'$, $t_A$ and
$upright(bold(x))$, respectively. Furthermore, $upright(bold(nabla))'$
is replaced by $partial_(t')$ and $1 \/ beta \( upright(bold(x))' \)$ by
$beta \( t' \)$. Whereas the temporal convolution in equation (@eq1616)
is a 1D integral, and the integral over $upright(bold(x))'$ is a 2D
surface integral (for the 3D situation) or a 1D line integral (for the
2D situation), the spatial convolution in equation (@eq58kk) is a 3D or
2D integral, respectively, and there is no integral over $t'$ ($t'$ has
only a single value in equation (@eq58kk)). Hence, the total number of
dimensions of the integrals is the same in both representations. Last,
but not least, the time-reversed Green's function
$cal(G)_x \( upright(bold(x))' \, upright(bold(x))_A \, - t \, 0 \)$ and
its derivative in equation (@eq1616) are replaced by the acausal Green's
function
$cal(G)_t^a \( upright(bold(x)) \, upright(bold(0)) \, t' \, t_A \)$ and
its derivative in equation (@eq58kk).

Whereas time-reversal can be applied to recordings of physical
measurements, acausal responses cannot be obtained from physical
measurements. Therefore we need to modify equation (@eq58kk), or more
generally, equation (@eqbasis), before we can use it in practical
situations. In particular, we need to use symmetry properties of the
Green's functions to transform equation (@eqbasis) into a form that
complies with physics. In section @sec4D we transform the acausal matrix
$upright(bold(W)) \( upright(bold(x)) \, t' \, t_A \)$, propagating from
$t_A$ to $t'$ (with $t' < t_A$), into a causal matrix, propagating from
$- t_A$ to $- t'$ (with $- t' > - t_A$) in a time-reversed material. In
this case, equation (@eqbasis) will form the theoretical basis for
time-reversed acoustics. In section @sec4E we transform the acausal
matrix $upright(bold(W)) \( upright(bold(x)) \, t' \, t_A \)$ into a
causal matrix, propagating from $t'$ to $t_A$ (with $t_A > t'$). In that
case, equation (@eqbasis) will form the theoretical basis for Green's
function retrieval by spatial correlation.

== Time-reversed acoustics in a homogeneous, time-variant material
<sec4D>
#figure(image("source/Figure6.svg", width: 92%),
  caption: [
    Illustration of the principle of time-reversed acoustics in a
    homogeneous, time-variant material. The dashed blue lines indicate
    the time boundaries. Lower frame: the response
    $U_(upright(T R)) \( upright(bold(x)) \, - t' \)$ (and its
    time-derivative
    $partial_(t') U_(upright(T R)) \( upright(bold(x)) \, - t' \)$) to a
    source at $- t_A = - 40 thin mu$s and
    $upright(bold(x)) = upright(bold(0))$ (indicated by the red dot) in
    the time-reversed version of the actual material, is recorded by
    receivers at $- t' = 0 thin mu$s (only the response
    $U_(upright(T R))$ is shown). Upper frame: after changing the sign
    of the time-derivative
    $partial_(t') U_(upright(T R)) \( upright(bold(x)) \, - t' \)$, the
    recorded fields are fed to sources at $t' = 0 thin mu$s. The wave
    field emitted by these sources into the actual time-variant material
    focuses at $t_A = 40 thin mu$s and
    $upright(bold(x)) = upright(bold(0))$. After having focused, the
    wave field continues its propagation. The focused field at
    $t_A = 40 thin mu$s and $upright(bold(x)) = upright(bold(0))$ is a
    virtual source (indicated by the pink dot) for the field for
    $t > t_A$. In section @sec4E we show that the upper frame can
    alternatively be obtained by the principle of Green's function
    retrieval in a homogeneous, time-variant material. Movie available
    at https:\/\/www.keeswapenaar.nl/TimeMaterial/TimeMirror.mp4
  ]
)
<Figure6>

#figure(image("source/Figure7.svg", width: 92%),
  caption: [
    Wave field of @Figure6, shown here as a function of
    $upright(bold(x)) = \( x \, z \)$ and $t$. The dashed blue planes
    indicate the time boundaries. The green plane indicates the
    interface between the actual material and its time-reversed version.
    The pink dot at $t_A = 40 thin mu$s and
    $upright(bold(x)) = upright(bold(0))$ indicates the virtual source.
  ]
)
<Figure7>

We start by introducing the principle of idealized time-reversed
acoustics in a homogeneous, time-variant material in an intuitive way.
We seek for a counterpart of time-reversed acoustics in an
inhomogeneous, time-invariant material, as discussed in section @sec3C.
Consider again @Figure1\(b) and @Figure1\(c), which illustrates
a wave field, emitted by sources at $upright(bold(x))'$ on a closed
boundary, propagating through the inhomogeneous material, and focusing
at $upright(bold(x))_A$ and $t = 0$ (@Figure1\(b)). The focus at
$upright(bold(x))_A$ is a virtual source, radiating waves into the
inhomogeneous material (@Figure1\(c)). The counterpart of these
figures is shown in the upper frame of @Figure6. Here we have
sources at a single time-instant $t' = 0$ $mu$s, emitting waves into a
homogeneous, time-variant material (the same material as used in the
numerical example in section @sec4C). The field focuses at $t_A = 40$
$mu$s and $upright(bold(x)) = upright(bold(0))$. The focus at $t_A$ is a
virtual source, radiating waves into the time-variant material beyond
$t_A$. Note that the wave field emitted by the sources at $t'$ can be
interpreted as an acausal field related to a sink at $t_A$. The question
is, how do we obtain this acausal wave field at $t'$? Unlike in section
@sec3C, where the acausal field emitted into the inhomogeneous material
was simply the time-reversal of the causal field, radiated by a source
at $upright(bold(x))_A$ and $t = 0$, and observed at $upright(bold(x))'$
(@Figure1\(a)), in the present situation we cannot measure a
field at $t'$, radiated by a source at $t_A > t'$. Instead, we consider
waves in a time-reversed version of the material between $t'$ and $t_A$.
The lower frame of @Figure6 shows a wave field in the
time-reversed material between $- t_A$ and $- t'$. A source at $- t_A$
and $upright(bold(x)) = upright(bold(0))$ emits a wave field into this
time-reversed material. Note that the wave paths are opposite to those
in the lower part of the upper frame. The wave field is observed by
receivers at $- t' > - t_A$. These receivers measure the wave field
$U_(upright(T R)) \( upright(bold(x)) \, - t' \)$ and its
time-derivative
$partial_(t') U_(upright(T R)) \( upright(bold(x)) \, - t' \)$ (with
subscript $upright(T R)$ denoting that these fields are measured in the
time-reversed material; for simplicity @Figure6 only shows the
response $U_(upright(T R))$). To let the waves change their propagation
direction, we need to change the sign of
$partial_(t') U_(upright(T R)) \( upright(bold(x)) \, - t' \)$
#link(<ref:Bacot2016NP>)[\[11\]]#link(<ref:Fink2017EPJ>)[\[12\]]. Hence,
$U_(upright(T R)) \( upright(bold(x)) \, - t' \)$ and
$- partial_(t') U_(upright(T R)) \( upright(bold(x)) \, - t' \)$ form
the acausal field that needs to be emitted by the sources at $t'$ into
the actual time-variant material, to focus at $t_A$ and
$upright(bold(x)) = upright(bold(0))$. Note that @Figure6 can be
seen as a cross-section for $z = 0$ of the wave field in @Figure7.

Next, we formalize this principle of idealized time-reversed acoustics
in a homogeneous, time-variant material, using the representation of
equation (@eqbasis) as starting point. The acausal Green's functions in
matrix $upright(bold(W)) \( upright(bold(x)) \, t' \, t_A \)$, with
$t' < t_A$, are not associated to a physical situation. We use symmetry
properties of the Green's functions to transform
$upright(bold(W)) \( upright(bold(x)) \, t' \, t_A \)$ in equation
(@eqbasis) into a form that complies with physics.

Consider the Green's function
$cal(G)_t \( upright(bold(x)) \, upright(bold(0)) \, t \, t_A \)$,
obeying wave equation (@eq31agbl), with the causality condition of
equation (@eq31con) (for $upright(bold(x))_A = upright(bold(0))$). We
introduce
$cal(G)_(t \, upright(T R)) \( upright(bold(x)) \, upright(bold(0)) \, t \, - t_A \)$
as the response to a source at $- t_A$ in the time-reversed version of
the actual material. Hence, it obeys the following equation
$ #scale(x: 120%, y: 120%)[\(] partial_t beta \( - t \) partial_t - beta \( - t \) c^2 \( - t \) upright(bold(nabla))^2 #scale(x: 120%, y: 120%)[\)] cal(G)_(t \, upright(T R)) \( upright(bold(x)) \, upright(bold(0)) \, t \, - t_A \) = delta \( upright(bold(x)) \) delta \( t + t_A \) \, $<eq31agbltr>
with causality condition
$ cal(G)_(t \, upright(T R)) \( upright(bold(x)) \, upright(bold(0)) \, t \, - t_A \) = 0 quad upright("for") quad t < - t_A . $<eq31contr>
Note that the subscript TR denotes that the material is time-reversed
(hence, TR does not refer to time-reversal of the wave field). Replacing
$t$ by $- t$ in equation (@eq31agbltr) gives
$ #scale(x: 120%, y: 120%)[\(] partial_t beta \( t \) partial_t - beta \( t \) c^2 \( t \) upright(bold(nabla))^2 #scale(x: 120%, y: 120%)[\)] cal(G)_(t \, upright(T R)) \( upright(bold(x)) \, upright(bold(0)) \, - t \, - t_A \) = delta \( upright(bold(x)) \) delta \( - t + t_A \) \, $<eq31agbltrm>
with causality condition
$ cal(G)_(t \, upright(T R)) \( upright(bold(x)) \, upright(bold(0)) \, - t \, - t_A \) = 0 quad upright("for") quad - t < - t_A . $<eq31contrm>
Note that $delta \( - t + t_A \)$ in equation (@eq31agbltrm) is equal to
$delta \( t - t_A \)$, and the condition $- t < - t_A$ in equation
(@eq31contrm) is equivalent with the condition $t > t_A$. Hence,
$cal(G)_(t \, upright(T R)) \( upright(bold(x)) \, upright(bold(0)) \, - t \, - t_A \)$
obeys the same wave equation (equation (@eq31agbl), with
$upright(bold(x))_A = upright(bold(0))$) and the same causality
condition (equation (@eq31conac)) as
$cal(G)_t^a \( upright(bold(x)) \, upright(bold(0)) \, t \, t_A \)$.
Hence,
$ cal(G)_t^a \( upright(bold(x)) \, upright(bold(0)) \, t \, t_A \) = cal(G)_(t \, upright(T R)) \( upright(bold(x)) \, upright(bold(0)) \, - t \, - t_A \) . $<eq5656>
Similarly,
$ cal(G)_t \( upright(bold(x)) \, upright(bold(0)) \, t \, t_A \) & = & cal(G)_(t \, upright(T R))^a \( upright(bold(x)) \, upright(bold(0)) \, - t \, - t_A \) \,\
cal(G)_t^h \( upright(bold(x)) \, upright(bold(0)) \, t \, t_A \) & = & - cal(G)_(t \, upright(T R))^h \( upright(bold(x)) \, upright(bold(0)) \, - t \, - t_A \) \, $<eqGhTR>
where $cal(G)_(t \, upright(T R))^a$ and $cal(G)_(t \, upright(T R))^h$
are the acausal and homogeneous Green's functions, respectively, in the
time-reversed material. Using equation (@eqGhTR) in equations
(@eq35aa)--(@eq41) we find
$ W^(U \, V) \( upright(bold(x)) \, t \, t_A \) & = & - W_(upright(T R))^(U \, V) \( upright(bold(x)) \, - t \, - t_A \) \,\
W^(V \, V) \( upright(bold(x)) \, t \, t_A \) & = & W_(upright(T R))^(V \, V) \( upright(bold(x)) \, - t \, - t_A \) \,\
W^(U \, U) \( upright(bold(x)) \, t \, t_A \) & = & W_(upright(T R))^(U \, U) \( upright(bold(x)) \, - t \, - t_A \) \,\
W^(V \, U) \( upright(bold(x)) \, t \, t_A \) & = & - W_(upright(T R))^(V \, U) \( upright(bold(x)) \, - t \, - t_A \) . $
Hence,
$ upright(bold(W)) \( upright(bold(x)) \, t \, t_A \) = upright(bold(J)) upright(bold(W))_(upright(T R)) \( upright(bold(x)) \, - t \, - t_A \) upright(bold(J))^(- 1) \, $<eq47>
where
$upright(bold(W))_(upright(T R)) \( upright(bold(x)) \, - t \, - t_A \)$
is the propagator matrix for the time-reversed material, and
$ upright(bold(J)) = mat(delim: "(", 1, 0; 0, - 1) . $<eq48>
Substituting equation (@eq47) into equation (@eqbasis) and
post-multiplying both sides by $upright(bold(J))$ yields
$ upright(bold(W)) \( upright(bold(x)) \, t \, t_A \) upright(bold(J)) = upright(bold(W)) \( upright(bold(x)) \, t \, t' \) *_x upright(bold(J)) upright(bold(W))_(upright(T R)) \( upright(bold(x)) \, - t' \, - t_A \) . $<eqbasistr>
In equation (@eqbasistr),
$upright(bold(W))_(upright(T R)) \( upright(bold(x)) \, - t' \, - t_A \)$
propagates from $- t_A$ to $- t'$ through the time-reversed version of
the actual material between $t'$ and $t_A$. Hence, the elements of both
propagator matrices on the right-hand side of equation (@eqbasistr)
consist only of (derivatives of) the causal part of the homogeneous
Green's functions. Let us compare equation (@eqbasistr) with its
counterpart of equation (@eq1515). To this end, for the upper-right
element of
$upright(bold(W)) \( upright(bold(x)) \, t \, t_A \) upright(bold(J))$
we write
$ - W^(U \, V) \( upright(bold(x)) \, t \, t_A \) & = & W^(U \, U) \( upright(bold(x)) \, t \, t' \) *_x W_(upright(T R))^(U \, V) \( upright(bold(x)) \, - t' \, - t_A \)\
 &  & - W^(U \, V) \( upright(bold(x)) \, t \, t' \) *_x W_(upright(T R))^(V \, V) \( upright(bold(x)) \, - t' \, - t_A \) . $
Substituting equations (@eq35aa) -- (@eq40), using
$beta_(upright(T R)) \( - t' \) = beta \( t' \)$, yields
$ cal(G)_t^h \( upright(bold(x)) \, upright(bold(0)) \, t \, t_A \) & = & beta \( t' \) #scale(x: 180%, y: 180%)[\[] partial_(t') cal(G)_t \( upright(bold(x)) \, upright(bold(0)) \, t \, t' \) *_x cal(G)_(t \, upright(T R)) \( upright(bold(x)) \, upright(bold(0)) \, - t' \, - t_A \)\
 &  & - cal(G)_t \( upright(bold(x)) \, upright(bold(0)) \, t \, t' \) *_x partial_(t') cal(G)_(t \, upright(T R)) \( upright(bold(x)) \, upright(bold(0)) \, - t' \, - t_A \) #scale(x: 180%, y: 180%)[\]] . $<eq58gg>
This expression is the counterpart of equation (@eq1515). Unlike in
equation (@eq1515), where we captured the two terms under the integral
in equation (@eq1616) by a single term, no such simplification is
possible for equation (@eq58gg).

We continue with the matrix equation (@eqbasistr) and use this as the
basis for time-reversed acoustics in a homogeneous, time-variant
material. To this end, we define a source vector
$upright(bold(d)) \( upright(bold(x)) \, t \)$ at $t = - t_A$ in the
time-reversed material, according to
$upright(bold(d)) \( upright(bold(x)) \, t \) = upright(bold(d))_0 \( upright(bold(x)) \) delta \( t + t_A \)$.
Then the causal response to this source in the time-reversed material is
given by
$ upright(bold(q))_(upright(T R)) \( upright(bold(x)) \, t \) & = & upright(bold(W))_(upright(T R)) \( upright(bold(x)) \, t \, - t_A \) *_x upright(bold(d))_0 \( upright(bold(x)) \) . $<eqA22ag>
Convolving both sides of equation (@eqbasistr) with the source
distribution $upright(bold(d))_0 \( upright(bold(x)) \)$, using equation
(@eqA22ag) for $t = - t'$, yields
$ upright(bold(W)) \( upright(bold(x)) \, t \, t_A \) *_x upright(bold(J)) upright(bold(d))_0 \( upright(bold(x)) \) = upright(bold(W)) \( upright(bold(x)) \, t \, t' \) *_x upright(bold(J)) upright(bold(q))_(upright(T R)) \( upright(bold(x)) \, - t' \) . $<eqbasistrsrc>
We discuss this expression from right to left. For this discussion,
recall that $t_A$ and $t'$ are fixed, whereas $t$ is a variable;
moreover, the order of $t_A$ and $t$ is arbitrary and $t'$ is smaller
than both $t_A$ and $t$. The term
$ upright(bold(q))_(upright(T R)) \( upright(bold(x)) \, - t' \) = vec(U_(upright(T R)) \( upright(bold(x)) \, - t' \), V_(upright(d \, T R)) \( upright(bold(x)) \, - t' \)) $<eq52a>
is the causal response to the source at $- t_A$ in the time-reversed
material, observed at $- t'$, see the lower frame of @Figure6 for
the special case that the source at $- t_A$ is located at
$upright(bold(x)) = upright(bold(0))$ (recall that for simplicity @Figure6 only shows the component $U_(upright(T R))$). According to
equation (@eq49b) (with $a = 0$) we have
$V_(upright(d \, T R)) \( upright(bold(x)) \, - t' \) = beta \( t' \) partial_(t') U_(upright(T R)) \( upright(bold(x)) \, - t' \)$.
The matrix $upright(bold(J))$ in the right-hand side of equation
(@eqbasistrsrc) changes the sign of the lower component of
$upright(bold(q))_(upright(T R)) \( upright(bold(x)) \, - t' \)$,
according to
$ upright(bold(J)) upright(bold(q))_(upright(T R)) \( upright(bold(x)) \, - t' \) = vec(U_(upright(T R)) \( upright(bold(x)) \, - t' \), - beta \( t' \) partial_(t') U_(upright(T R)) \( upright(bold(x)) \, - t' \)) . $<eq53a>
This sign change is indicated between the two frames in @Figure6.
Next, matrix $upright(bold(W)) \( upright(bold(x)) \, t \, t' \)$ in
equation (@eqbasistrsrc) propagates this field from $t'$ through the
actual time-variant material to $t$, see the upper frame of @Figure6. For $t < t_A$, the left-hand side of equation (@eqbasistrsrc)
is interpreted as an acausal field observed at $t$, propagating to a
sink at $t_A$. For $t > t_A$, it is interpreted as a causal field
observed at $t$, radiated by a source at $t_A$ of strength
$upright(bold(J)) upright(bold(d))_0 \( upright(bold(x)) \)$. Since
there is no real sink nor a real source at $t_A$, the sink and the
source at $t_A$ in the interpretation of the left-hand side of equation
(@eqbasistrsrc) are both virtual. In the numerical example in @Figure6 and @Figure7, the virtual source at $t_A = 40 mu$s coincides
with a time boundary, but note that the theory described here holds for
any choice of $t_A$.

Summarizing, equation (@eqbasistrsrc) formalizes the principle of
idealized time-reversed acoustics in a homogeneous, time-variant
material. To compare this expression with equation (@eq1717), we choose
for convenience
$ upright(bold(d))_0 \( upright(bold(x)) \) = vec(0, b_(upright(d) \, 0) \( upright(bold(x)) \)) . $<eq67>
For the upper element of equation (@eqbasistrsrc) we thus obtain
$ - W^(U \, V) \( upright(bold(x)) \, t \, t_A \) *_x b_(upright(d) \, 0) \( upright(bold(x)) \) & = & W^(U \, U) \( upright(bold(x)) \, t \, t' \) *_x U_(upright(T R)) \( upright(bold(x)) \, - t' \)\
 & + & W^(U \, V) \( upright(bold(x)) \, t \, t' \) *_x \( - beta \( t' \) partial_(t') U_(upright(T R)) \( upright(bold(x)) \, - t' \) \) \, $
or, using equations (@eq35aa) and (@eq40) and (a)causality conditions
(@eq31con) and (@eq31conac),
$ { cal(G)_t \( upright(bold(x)) \, upright(bold(0)) \, t \, t_A \) - cal(G)_t^a \( upright(bold(x)) \, upright(bold(0)) \, t \, t_A \) } *_x b_(upright(d) \, 0) \( upright(bold(x)) \) & = & - beta \( t' \) #scale(x: 180%, y: 180%)[\[] underbrace(partial_(t') cal(G)_t \( upright(bold(x)) \, upright(bold(0)) \, t \, t' \), upright("“propagator”")) *_x underbrace(U_(upright(T R)) \( upright(bold(x)) \, - t' \), upright("“source field”"))\
 &  & + underbrace(cal(G)_t \( upright(bold(x)) \, upright(bold(0)) \, t \, t' \), upright("“propagator”")) *_x underbrace(\( - partial_(t') U_(upright(T R)) \( upright(bold(x)) \, - t' \) \), upright("“source field”")) #scale(x: 180%, y: 180%)[\]] . $<eq58gghh>
This expression is the counterpart of equation (@eq1717), with
coordinates $upright(bold(x))$, $upright(bold(x))'$,
$upright(bold(x))_A$ and $t$ replaced by $t$, $t'$, $t_A$ and
$upright(bold(x))$, respectively, etc. Moreover, the time-reversed field
$P \( upright(bold(x))' \, - t \)$ in equation (@eq1717) is replaced by
the fields $U_(upright(T R)) \( upright(bold(x)) \, - t' \)$ and
$- partial_(t') U_(upright(T R)) \( upright(bold(x)) \, - t' \)$ in a
time-reversed version of the actual material. The right-hand side
quantifies the propagation of
$U_(upright(T R)) \( upright(bold(x)) \, - t' \)$ and
$- partial_(t') U_(upright(T R)) \( upright(bold(x)) \, - t' \)$ from
sources at a single time instant $t'$ to any $t$ larger than $t'$.
Unlike in equation (@eq1717), the two terms on the right-hand side of
equation (@eq58gghh) cannot be recast into a single term. The second
term on the left-hand side,
$cal(G)_t^a \( upright(bold(x)) \, upright(bold(0)) \, t \, t_A \) *_x b_(upright(d) \, 0) \( upright(bold(x)) \)$,
is the field that focuses at $t_A$, and the first term on the left-hand
side,
$cal(G)_t \( upright(bold(x)) \, upright(bold(0)) \, t \, t_A \) *_x b_(upright(d) \, 0) \( upright(bold(x)) \)$,
is the field emitted by the virtual source distribution
$b_(upright(d) \, 0) \( upright(bold(x)) \)$ at $t_A$, see the upper
frame of @Figure6.

What we have discussed in this section is the ideal version of
time-reversed acoustics in a homogeneous, time-variant material. It
requires a wave field in a time-reversed version of the actual material,
measurements of the field and its time derivative at all
$upright(bold(x))$ at a single time-instant $- t'$, and emission of the
field and its time derivative (the latter with reversed sign) into the
actual material by sources at all $upright(bold(x))$ at time-instant
$t'$. Experiments described by references
#link(<ref:Bacot2016NP>)[\[11\]]#link(<ref:Fink2017EPJ>)[\[12\]]#link(<ref:Hidalgo2023PRL>)[\[14\]]#link(<ref:Peng2020JPC>)[\[78\]] make use of several
shortcuts. These experiments are carried out in a material that is
time-invariant, except for an impulsive temporal disruption at $t' = 0$.
Hence, the time-reversed material is the same as the actual material.
Furthermore, instead of measuring the field and its time derivative and
re-emitting this (with a sign change) into the material, the impulsive
temporal disruption of the material at $t' = 0$ acts as a time boundary,
which partly reflects and partly transmits the field into the material.
The reflected field approximates the re-emitted field and focuses at the
position of the original source(s), whereas the transmitted field, which
continues propagating forward, is ignored. Despite the approximations,
these experiments are fascinating and triggered the research described
in this paper.

== Green's function retrieval in a homogeneous, time-variant material
<sec4E>
We start by introducing the principle of Green's function retrieval in a
homogeneous, time-variant material in an intuitive way. We seek for a
counterpart of Green's function retrieval in an inhomogeneous,
time-invariant material, as discussed in section @sec3D. Consider again
@Figure2\(a), which illustrates Green's functions in an
inhomogeneous material, with impulsive sources at $t = 0$ and
$upright(bold(x))'$ on a closed boundary, and receivers at
$upright(bold(x))_A$ and $upright(bold(x))$ inside the closed boundary.
The temporal crosscorrelation of the Green's functions, observed at
$upright(bold(x))_A$ and $upright(bold(x))$, integrated over all sources
at $upright(bold(x))'$, yields the Green's function (minus its
time-reversed version) between $upright(bold(x))_A$ and
$upright(bold(x))$. Hence, the receiver at $upright(bold(x))_A$ has
turned into a virtual source, and the response to this source is
observed at $upright(bold(x))$, see @Figure2\(b). The counterpart
of @Figure2\(a) is shown in @Figure5. It shows the Green's
function (convolved with a spatial wavelet) in a time-variant material,
with its source at $upright(bold(x)) = upright(bold(0))$ and $t' = 0$,
and receivers at $t_A = 40 thin mu$s and variable $t$, both beyond
$t' = 0$. We expect that the spatial crosscorrelation of the Green's
functions, observed at $t_A = 40 thin mu$s and $t$ (both in response to
a source at a single time instant $t' = 0$), yields the Green's function
(minus its acausal version) between $t_A$ and $t$. The upper frame of
@Figure6 can be interpreted as the counterpart of @Figure2\(b). It shows the response to a virtual source at
$upright(bold(x)) = upright(bold(0))$ and $t_A = 40 thin mu$s, observed
by receivers at variable $upright(bold(x))$ and $t$. In the following we
show mathematically that this Green's function (minus its acausal
version) indeed follows from spatial crosscorrelations of Green's
functions, albeit in a somewhat more complex way than described above.

Our starting point is again the representation of equation (@eqbasis).
The acausal Green's functions in matrix
$upright(bold(W)) \( upright(bold(x)) \, t' \, t_A \)$, with $t' < t_A$,
are not associated to a physical situation. We use symmetry properties
of the Green's functions to transform this matrix into a form that
complies with physics. Using reciprocity relation (@eq1022sqshblkkk) in
equations (@eq35aa)--(@eq41) we find
$ W^(U \, V) \( upright(bold(x)) \, t \, t_A \) & = & - W^(U \, V) \( upright(bold(x)) \, t_A \, t \) \,\
W^(V \, V) \( upright(bold(x)) \, t \, t_A \) & = & W^(U \, U) \( upright(bold(x)) \, t_A \, t \) \,\
W^(U \, U) \( upright(bold(x)) \, t \, t_A \) & = & W^(V \, V) \( upright(bold(x)) \, t_A \, t \) \,\
W^(V \, U) \( upright(bold(x)) \, t \, t_A \) & = & - W^(V \, U) \( upright(bold(x)) \, t_A \, t \) . $
Hence
$ upright(bold(W)) \( upright(bold(x)) \, t \, t_A \) = upright(bold(N)) upright(bold(W))^t \( upright(bold(x)) \, t_A \, t \) upright(bold(N))^(- 1) \, $<eq253c>
where superscript $t$ denotes transposition and
$ upright(bold(N)) = mat(delim: "(", 0, 1; - 1, 0) . $<eq48N>
Substituting equation (@eq253c) into equation (@eqbasis) and
post-multiplying both sides by $upright(bold(N))$, we obtain
$ upright(bold(W)) \( upright(bold(x)) \, t \, t_A \) upright(bold(N)) = upright(bold(W)) \( upright(bold(x)) \, t \, t' \) *_x upright(bold(N)) upright(bold(W))^t \( upright(bold(x)) \, t_A \, t' \) . $<eqbasisbb>
The right-hand side represents a spatial convolution. From equations
(@eq68blue)--(@eq33) it follows that the propagator matrices are
symmetric in $upright(bold(x))$. Hence, when we may replace
$upright(bold(x))$ in the rightmost matrix in equation (@eqbasisbb) by
$- upright(bold(x))$, so that the right-hand side becomes a spatial
crosscorrelation. We assume again that the order of $t_A$ and $t$ is
arbitrary and that $t'$ is smaller than both $t_A$ and $t$. Then, for
the upper-left element we obtain
$ - W^(U \, V) \( upright(bold(x)) \, t \, t_A \) & = & W^(U \, U) \( upright(bold(x)) \, t \, t' \) *_x W^(U \, V) \( - upright(bold(x)) \, t_A \, t' \)\
 & - & W^(U \, V) \( upright(bold(x)) \, t \, t' \) *_x W^(U \, U) \( - upright(bold(x)) \, t_A \, t' \) \, $
or, using equations (@eq35aa) and (@eq40) and (a)causality conditions
(@eq31con) and (@eq31conac),
$ cal(G)_t \( upright(bold(x)) \, upright(bold(0)) \, t \, t_A \) - cal(G)_t^a \( upright(bold(x)) \, upright(bold(0)) \, t \, t_A \) & = & beta \( t' \) #scale(x: 180%, y: 180%)[\[] { partial_(t') cal(G)_t \( upright(bold(x)) \, upright(bold(0)) \, t \, t' \) } *_x cal(G)_t \( - upright(bold(x)) \, upright(bold(0)) \, t_A \, t' \)\
 &  & - cal(G)_t \( upright(bold(x)) \, upright(bold(0)) \, t \, t' \) *_x partial_(t') cal(G)_t \( - upright(bold(x)) \, upright(bold(0)) \, t_A \, t' \) #scale(x: 180%, y: 180%)[\]] . $<eq58>
This expression is the counterpart of equation (@eq1919), with
coordinates $upright(bold(x))$, $upright(bold(x))'$,
$upright(bold(x))_A$ and $t$ replaced by $t$, $t'$, $t_A$ and
$upright(bold(x))$, respectively, etc. #link(<ref:Wapenaar2025RS>)[\[35\]]. The right-hand
side quantifies the spatial crosscorrelation of specific combinations of
Green's functions observed at $t_A$ and $t$, in response to sources at a
single time instant $t'$. Unlike in equation (@eq22), the two terms on
the right-hand side of equation (@eq58) cannot be recast into a single
term with a single source type, meaning that we require responses to two
types of sources at $t'$. The left-hand side is the retrieved Green's
function between $t_A$ and $t$ minus its acausal version, see the upper
frame of @Figure6. Whereas in section @sec4D this figure was
obtained by emitting the response of a time-reversed material into the
actual time-variant material (equation(@eq58gghh)), here it is explained
as the result of crosscorrelating responses at two time instances in
one-and-the-same material (equation (@eq58)). Both methods were derived
from equation (@eqbasis) and a specific reorganization of the matrix
$upright(bold(W)) \( upright(bold(x)) \, t' \, t_A \)$. This confirms
the link between time-reversal acoustics and Green's function retrieval
by spatial crosscorrelation in a homogeneous, time-variant material.

The modification of equation (@eq58) for Green's function retrieval by
spatial crosscorrelation of ambient noise observations at $t_A$ and $t$
is more complicated than in section @sec3D, because the two terms on the
right-hand side of equation (@eq58) cannot be recast into a single term
with a single source type. In a companion paper #link(<ref:Aichele2025arXiv>)[\[36\]] we
propose a compromise for the special case of a time-invariant material.
Extending this approach to time-variant materials leads to artifacts in
the retrieved Green's function that increase with increasing complexity
of the time-variant material. A further discussion of Green's function
retrieval by spatial crosscorrelation of ambient noise is beyond the
scope of this paper.

= Conclusions
<sec5>
We started this paper with a review of the principles of classical
time-reversed acoustics and Green's function retrieval for
inhomogeneous, time-invariant materials. Along the same lines, we
discussed the counterparts of these principles for homogeneous,
time-variant materials, and compared those with the classical
principles. One observation from this comparison is that the space and
time coordinates are interchanged between the methods for the two
classes of material. As a consequence, temporal convolutions and
correlations in the classical approaches for inhomogeneous,
time-invariant materials, are replaced by spatial convolutions and
correlations in their counterparts for homogeneous, time-variant
materials. However, the interchangement of space and time does not apply
to causality conditions, which are always related to the time
coordinate. This complicates the translation of methods from one class
of material to the other and vice versa. Another complicating factor is
that the number of time dimensions (one) is not the same as the number
of space dimensions (two or three).

For time-reversed acoustics and for Green's function retrieval, we
separately discuss the relations between applications in the two classes
of material.

- The principle of classical time-reversed acoustics in an
  inhomogeneous, time-invariant material involves in essence:

  + Emission of a wave field by a source at $upright(bold(x))_A$ into
    the inhomogeneous material

  + Recording of this wave field by receivers at a closed boundary.

  + Emission of the time-reversal of the recorded field into the
    inhomogeneous material by sources at the positions of the receivers.

  + The emitted wave field focuses at $upright(bold(x))_A$ and the
    focused field is a virtual source, emitting waves into the
    inhomogeneous material.

  The counterpart of the principle classical time-reversed acoustics for
  a homogeneous, time-variant material involves:

  + Emission of a wave field by a source at $- t_A$ into a time-reversed
    version of the actual material.

  + Recording of this wave field and its time-derivative by receivers at
    a single time instant.

  + Emission of the recorded field and its time-derivative (the latter
    with reversed sign) into the actual time-variant material by sources
    at the positions of the receivers.

  + The emitted wave field focuses at $t_A$ and the focused field is a
    virtual source, emitting waves into the time-variant material.

  This summarizes ideal time-reversed acoustics in a homogeneous,
  time-variant material. In actual experiments
  #link(<ref:Bacot2016NP>)[\[11\]]#link(<ref:Fink2017EPJ>)[\[12\]]#link(<ref:Hidalgo2023PRL>)[\[14\]]#link(<ref:Peng2020JPC>)[\[78\]], the material is
  time-invariant except for an impulsive temporal disruption. This
  disruption acts as a time boundary, which partly reflects the field
  into the material and as such avoids recording and re-emission of the
  wave field.

- The principle of classical Green's function retrieval in an
  inhomogeneous, time-invariant material involves in essence:

  + Recording of passive wave fields at $upright(bold(x))_A$ and
    $upright(bold(x))$ in response to sources at $upright(bold(x))'$ at
    a closed boundary.

  + Temporal crosscorrelating the recorded fields at
    $upright(bold(x))_A$ and $upright(bold(x))$ per source, followed by
    a summation over all sources at the closed boundary.

  + The time derivative of the result is the Green's function (minus its
    time-reversed version) between a virtual source (sink) at
    $upright(bold(x))_A$ and a physical receiver at $upright(bold(x))$.

  + In the case that the sources are simultaneously acting uncorrelated
    noise sources, step 2 is replaced by a single crosscorrelation of
    the ambient noise recordings at $upright(bold(x))_A$ and
    $upright(bold(x))$.

  The principle of classical Green's function retrieval in an
  inhomogeneous, time-invariant material, is closely related to the
  principle of classical time-reversed acoustics in the same class of
  material. Both principles are variations of the homogeneous Green's
  function representation of equation (@eq1616) for this class of
  material.

  The counterpart of the principle of classical Green's function
  retrieval for a homogeneous, time-variant material involves:

  + Recording of passive wave fields at $t_A$ and $t$ in response to two
    types of sources at a single time instant $t'$.

  + Spatial crosscorrelating two specific combinations of the recorded
    fields at $t_A$ and $t$ per source type, followed by a summation of
    the two terms.

  + The result is the Green's function (minus its acausal version)
    between a virtual source (sink) at $t_A$ and a physical receiver at
    $t$.

  + A modification of Green's function retrieval by spatial
    crosscorrelation in the case of simultaneously acting uncorrelated
    noise sources has thus far only been derived for a time-invariant
    material #link(<ref:Aichele2025arXiv>)[\[36\]].

  The principle of Green's function retrieval in a homogeneous,
  time-variant material, is closely related to the principle of
  time-reversed acoustics in the same class of material. Both principles
  are variations of the homogeneous Green's function representation of
  equation (@eq58kk) (or, more generally, of its matrix form of equation
  (@eqbasis)) for this class of material.

#heading(level: 1, numbering: none)[Acknowledgements]
<acknowledgements>
Johannes Aichele and Dirk-Jan van Manen acknowledge funding from the
Swiss National Science Foundation (SNF, grant 197182).

= Analytical expressions for a homogeneous, time-invariant material
<AppA>
== Green's function of a homogeneous, time-invariant material
<AppA1>
For the special case of a homogeneous, time-invariant material, the
analytical solution of equation (@eq31agbl), with causality condition
(@eq31con), reads
$ cal(G)_t \( upright(bold(x)) \, upright(bold(x))_A \, t \, t_A \) = cases(delim: "{", frac(1, 4 pi beta c^2) frac(delta \( t - t_A - \| upright(bold(x)) - upright(bold(x))_A \| \/ c \), \| upright(bold(x)) - upright(bold(x))_A \|) \, quad & upright("3D") \,,  & , frac(1, 2 pi beta c^2) frac(H \( t - t_A - \| upright(bold(x)) - upright(bold(x))_A \| \/ c \), sqrt(\( t - t_A \)^2 - \| upright(bold(x)) - upright(bold(x))_A \|^2 \/ c^2)) \, quad & upright("2D") \,) $<eq71bl>
where $H \( t \)$ is the Heaviside step function. We define the spatial
Fourier transformation as
$ caron(U) \( upright(bold(k)) \) = integral_(bb(R)^m) U \( upright(bold(x)) \) exp \( - i upright(bold(k)) dot.op upright(bold(x)) \) upright(d) upright(bold(x)) \, $<eq51>
with $m = 3$, $upright(bold(x)) = \( x \, y \, z \)$,
$upright(bold(k)) = \( k_x \, k_y \, k_z \)$ for the 3D situation, and
$m = 2$, $upright(bold(x)) = \( x \, z \)$,
$upright(bold(k)) = \( k_x \, k_z \)$ for the 2D situation. The inverse
spatial Fourier transformation is defined as
$ U \( upright(bold(x)) \) = frac(1, \( 2 pi \)^m) integral_(bb(R)^m) caron(U) \( upright(bold(k)) \) exp \( i upright(bold(k)) dot.op upright(bold(x)) \) upright(d) upright(bold(k)) . $<eq52>

In the spatial Fourier domain, the Green's function reads
$ caron(cal(G))_t \( upright(bold(k)) \, upright(bold(x))_A \, t \, t_A \) = exp \( - i upright(bold(k)) dot.op upright(bold(x))_A \) H \( t - t_A \) frac(sin \( \| upright(bold(k)) \| c \( t - t_A \) \), beta c \| upright(bold(k)) \|) . $<eq93bebl>
This expression holds for the 3D as well as for the 2D situation.
Analogous to equation (@eq1022sqshbl) we have for the acausal Green's
function in the spatial Fourier domain
$ caron(cal(G))_t^a \( upright(bold(k)) \, upright(bold(x))_A \, t \, t_A \) = caron(cal(G))_t \( upright(bold(k)) \, upright(bold(x))_A \, t_A \, t \) . $<eqA9>

== Propagator matrix for a homogeneous, time-invariant slab
<AppA2>
We consider the propagator matrix
$upright(bold(W)) \( upright(bold(x)) \, t_n \, t_(n - 1) \)$ for a
homogeneous, time-invariant slab $t_(n - 1) < t < t_n$, with parameters
$alpha_n$, $beta_n$ and $c_n$. According to equations (@eq1022sqshbl),
(@eq35aa) and (@eq71bl), the upper-right element of this matrix is given
by
$ W^(U \, V) \( upright(bold(x)) \, t_n \, t_(n - 1) \) & = & cal(G)_t^a \( upright(bold(x)) \, upright(bold(0)) \, t_n \, t_(n - 1) \) - cal(G)_t \( upright(bold(x)) \, upright(bold(0)) \, t_n \, t_(n - 1) \)\
 & = & cases(delim: "{", frac(1, 4 pi beta_n c_n^2) frac(delta \( Delta t_n + \| upright(bold(x)) \| \/ c \) - delta \( Delta t_n - \| upright(bold(x)) \| \/ c \), \| upright(bold(x)) \|) \, quad & upright("3D") \,,  & , frac(1, 2 pi beta_n c_n^2) frac(H \( - Delta t_n - \| upright(bold(x)) \| \/ c_n \) - H \( Delta t_n - \| upright(bold(x)) \| \/ c \), sqrt(Delta t_n^2 - \| upright(bold(x)) \|^2 \/ c_n^2)) \, quad & upright("2D") .) $<eqA5>
with $Delta t_n = t_n - t_(n - 1)$. The other elements of
$upright(bold(W)) \( upright(bold(x)) \, t_n \, t_(n - 1) \)$ follow
from equations (@eq39)--(@eq41) and (@eqA5).

Using equations (@eq93bebl) and (@eqA9), we obtain for the upper-right
element of the propagator matrix
$caron(upright(bold(W))) \( upright(bold(k)) \, t_n \, t_(n - 1) \)$ in
the spatial Fourier domain
$ caron(W)^(U \, V) \( upright(bold(k)) \, t_n \, t_(n - 1) \) & = & caron(cal(G))_t^a \( upright(bold(k)) \, upright(bold(0)) \, t_n \, t_(n - 1) \) - caron(cal(G))_t \( upright(bold(k)) \, upright(bold(0)) \, t_n \, t_(n - 1) \) \,\
 & = & - frac(1, beta_n c_n \| upright(bold(k)) \|) sin \( \| upright(bold(k)) \| c_n Delta t_n \) . $<eqA11>
This expression holds for the 3D as well as for the 2D situation. The
other elements of
$caron(upright(bold(W))) \( upright(bold(k)) \, t_n \, t_(n - 1) \)$
follow from the Fourier transforms of equations (@eq39)--(@eq41) and
equation (@eqA11). Hence,
$ caron(upright(bold(W))) \( upright(bold(k)) \, t_n \, t_(n - 1) \) = mat(delim: "(", cos \( \| upright(bold(k)) \| c_n Delta t_n \), - frac(1, beta_n c_n \| upright(bold(k)) \|) sin \( \| upright(bold(k)) \| c_n Delta t_n \); beta_n c_n \| upright(bold(k)) \| sin \( \| upright(bold(k)) \| c_n Delta t_n \), cos \( \| upright(bold(k)) \| c_n Delta t_n \)) . $

\

#heading(numbering: none)[References]

#block[\[1\] F.~R. Morgenthaler, "Velocity modulation of electromagnetic waves", IRE
Trans. Microw. Theory Tech. #strong[6], 167--172 (1958).] <ref:Morgenthaler58IRE>

#block[\[2\] C.~L. Jiang, "Wave propagation and dipole radiation in a suddenly
created plasma", IEEE Trans.~Antennas~Propag. #strong[23], 83--90
(1975).] <ref:Jiang75IEEE>

#block[\[3\] J.~T. Mendonça and P.~K. Shukla, "Time refraction and time reflection:
Two basic concepts", Phys. Scr. #strong[65], 160--163 (2002).] <ref:Mendonca2002PS>

#block[\[4\] T.~T. Koutserimpas and R.~Fleury, "Electromagnetic waves in a time
periodic medium with step-varying refractive index", IEEE
Trans.~Antennas~Propag. #strong[66], 5300--5307 (2018).] <ref:Koutserimpas2018IEEE>

#block[\[5\] C.~Caloz and Z.~L. Deck-Léger, "Spacetime metamaterials---Part I:
General concepts", IEEE Trans.~Antennas~Propag. #strong[68], 1569--1582
(2020).] <ref:Caloz2020IEEE1>

#block[\[6\] D.~Ramaccia, A.~Toscano, and F.~Bilotti, "Light propagation through
metamaterial temporal slabs: reflection, refraction, and special cases",
Opt. Lett. #strong[45], 5836--5839 (2020).] <ref:Ramaccia2020OL>

#block[\[7\] B.~Apffel and E.~Fort, "Frequency conversion cascade by crossing
multiple space and time interfaces", Phys. Rev. Lett. #strong[128],
064501 (2022).] <ref:Apffel2022PRL>

#block[\[8\] H.~Moussa, G.~Xu, S.~Yin, E.~Galiffi, Y.~Ra'di, and A.~Alù, "Observation
of temporal reflection and broadband frequency translation at photonic
time interfaces", Nat. Phys. #strong[19], 863--868 (2023).] <ref:Moussa2023NP>

#block[\[9\] V.~Pacheco-Peña, M.~Fink, and N.~Engheta, "Temporal chirp, temporal
lensing, and temporal routing via space-time interfaces", Phys. Rev. B
#strong[111], L100306 (2025).] <ref:Pacheco2025PRB>

#block[\[10\] L.~Stefanini, E.~Galiffi, S.~Yin, S.~Singh, D.~M. Solís, N.~Engheta,
A.~Toscano, D.~Ramaccia, F.~Bilotti, and A.~Alù, "Theory and
experimental observation of scattering by a space-time corner", Phys.
Rev. Lett. #strong[135], 113802 (2025).] <ref:Stefanini2025PRL>

#block[\[11\] V.~Bacot, M.~Labousse, A.~Eddi, M.~Fink, and E.~Fort, "Time reversal and
holography with spacetime transformations", Nat. Phys. #strong[12],
972--977 (2016).] <ref:Bacot2016NP>

#block[\[12\] M.~Fink and E.~Fort, "From the time-reversal mirror to the instantaneous
time mirror", Eur. Phys. J. Spec. Top. #strong[226], 1477--1486 (2017).] <ref:Fink2017EPJ>

#block[\[13\] G.~Bal, M.~Fink, and O.~Pinaud, "Time-reversal by time-dependent
perturbations", SIAM J.~Appl.~Math. #strong[79], 754--780 (2019).] <ref:Bal2019SIAM>

#block[\[14\] S.~Hidalgo-Caballero, S.~K. Sreenivas, V.~Bacot, S.~Wildeman, M.~Harazi,
X.~Jia, A.~Tourin, M.~Fink, A.~Cassinelli, M.~Labousse, and E.~Fort,
"Damping-driven time reversal for waves", Phys. Rev. Lett. #strong[130],
087201 (2023).] <ref:Hidalgo2023PRL>

#block[\[15\] A.~Delory, C.~Prada, M.~Lanoy, A.~Eddi, M.~Fink, and F.~Lemoult,
"Elastic wave packets crossing a space-time interface", Phys. Rev. Lett.
#strong[133], 267201 (2025).] <ref:Delory2025PRL>

#block[\[16\] M.~Fink, "Time-reversal of ultrasonic fields -- Part I: Basic
principles", IEEE Trans. Ultras. Ferroel. Freq. Contr. #strong[39],
555--566 (1992).] <ref:Fink92IEEE>

#block[\[17\] Y.~Xiao, D.~N. Maywar, and G.~P. Agrawal, "Reflection and transmission
of electromagnetic waves at a temporal boundary", Opt. Lett.
#strong[39], 574--577 (2014).] <ref:Xiao2014OL>

#block[\[18\] A.~T. de~Hoop and I.~E. Lager, "Closed-form analytic expressions for the
pulsed-source radiated electromagnetic field in a class of media with
time-varying wave speed", Wave Motion #strong[51], 418--424 (2014).] <ref:Hoop2014WM>

#block[\[19\] M.~A. Salem and C.~Caloz, "Space-time cross-mapping and application to
wave scattering", doi.org/10.48550/arXiv.1504.02012 (2015).] <ref:Salem2015arXiv>

#block[\[20\] D.~Torrent, W.~J. Parnell, and A.~N. Norris, "Loss compensation in
time-dependent elastic metamaterials", Phys. Rev. B #strong[97], 014105
(2018).] <ref:Torrent2018PRB>

#block[\[21\] C.~Caloz and Z.~L. Deck-Léger, "Spacetime metamaterials---Part II:
Theory and applications", IEEE Trans.~Antennas~Propag. #strong[68],
1583--1598 (2020).] <ref:Caloz2020IEEE2>

#block[\[22\] D.-J. Van~Manen, J.~Aichele, J.~Müller, M.~Serra-Garcia, and
K.~Wapenaar, "On acoustic space-time media that compute their own
inverse", doi.org/10.48550/arXiv.2406.15203 (2024).] <ref:Manen2024arXiv>

#block[\[23\] K.~Wapenaar, J.~Aichele, and D.-J. van Manen, "Waves in space-dependent
and time-dependent materials: A systematic comparison", Wave Motion
#strong[130], 103374 (2024).] <ref:Wapenaar2024WM>

#block[\[24\] C.~Draeger and M.~Fink, "One-channel time-reversal in chaotic cavities:
Theoretical limits", J. Acoust. Soc. Am. #strong[105], 611--617 (1999).] <ref:Draeger99JASA>

#block[\[25\] J.~de~Rosny and M.~Fink, "Overcoming the diffraction limit in wave
physics using a time-reversal mirror and a novel acoustic sink", Phys.
Rev. Lett. #strong[89], 124301 (2002).] <ref:DeRosny2002PRL>

#block[\[26\] R.~L. Weaver and O.~I. Lobkis, "Ultrasonics without a source: Thermal
fluctuation correlations at MHz frequencies", Phys. Rev. Lett.
#strong[87], 134301 (2001).] <ref:Weaver2001PRL>

#block[\[27\] M.~Campillo and A.~Paul, "Long-range correlations in the diffuse seismic
coda", Science #strong[299], 547--549 (2003).] <ref:Campillo2003Science>

#block[\[28\] K.~Wapenaar, "Synthesis of an inhomogeneous medium from its acoustic
transmission response", Geophysics #strong[68], 1756--1759 (2003).] <ref:Wapenaar2003GEO>

#block[\[29\] R.~Snieder, "Extracting the Green's function from the correlation of
coda waves: A derivation based on stationary phase", Phys. Rev. E
#strong[69], 046610 (2004).] <ref:Snieder2004PRE>

#block[\[30\] G.~T. Schuster, J.~Yu, J.~Sheng, and J.~Rickett,
"Interferometric/daylight seismic imaging", Geophys. J. Int.
#strong[157], 838--852 (2004).] <ref:Schuster2004GJI>

#block[\[31\] D.-J. Van~Manen, J.~O.~A. Robertsson, and A.~Curtis, "Modeling of wave
propagation in inhomogeneous media", Phys. Rev. Lett. #strong[94],
164301 (2005).] <ref:VanManen2005PRL>

#block[\[32\] A.~Derode, E.~Larose, M.~Tanter, J.~de~Rosny, A.~Tourin, M.~Campillo,
and M.~Fink, "Recovering the Green's function from field-field
correlations in an open scattering medium (L)", J. Acoust. Soc. Am.
#strong[113], 2973--2976 (2003).] <ref:Derode2003JASA>

#block[\[33\] K.~Wapenaar, J.~Fokkema, and R.~Snieder, "Retrieving the Green's
function in an open system by cross-correlation: a comparison of
approaches (L)", J. Acoust. Soc. Am. #strong[118], 2783--2786 (2005).] <ref:Wapenaar2005JASA>

#block[\[34\] One could argue that, in the light of the aforementioned notion that
waves reflected by a time boundary propagate forward in time and
backward in space, we should speak here of space-reversed acoustics.
However, we follow the terminology used by Fink and coworkers.] <ref:Note1>

#block[\[35\] K.~Wapenaar, "Green's functions, propagation invariants, reciprocity
theorems, wave-field representations and propagator matrices in
two-dimensional time-dependent materials", Proc. R. Soc. A #strong[481],
20240479 (2025).] <ref:Wapenaar2025RS>

#block[\[36\] J.~Aichele, J.~Müller, D.-J. van Manen, and K.~Wapenaar, "Diffuse
wave-field correlation in space: An instantaneous time-reversal mirror
for Green's function retrieval", in preparation (2026).] <ref:Aichele2025arXiv>

#block[\[37\] A.~T. de~Hoop, #emph[Handbook of Radiation and Scattering of Waves]
(Academic Press, London) (1995), Chaps. 2, 7, 15 and 28.] <ref:Hoop95Book>

#block[\[38\] P.~M. Morse and H.~Feshbach, #emph[Methods of Theoretical Physics, Vol.
I] (McGraw-Hill Book Company Inc., New York) (1953), Chap. 7.] <ref:Morse53Book>

#block[\[39\] R.~P. Porter, "Diffraction-limited, scalar image formation with
holograms of arbitrary shape", J. Opt. Soc. Am. #strong[60], 1051--1059
(1970).] <ref:Porter70JOSA>

#block[\[40\] M.~L. Oristaglio, "An inverse scattering formula that uses all the
data", Inverse Probl. #strong[5], 1097--1105 (1989).] <ref:Oristaglio89IP>

#block[\[41\] G.~A. McMechan, "Determination of source parameters by wavefield
extrapolation", Geophys. J. R. Astr. Soc. #strong[71], 613--628 (1982).] <ref:McMechan82GJR>

#block[\[42\] D.~Gajewski and E.~Tessmer, "Reverse modelling for seismic event
characterization", Geophys. J. Int. #strong[163], 276--284 (2005).] <ref:Gajewski2005GJI>

#block[\[43\] C.~Larmat, R.~A. Guyer, and P.~A. Johnson, "Time-reversal methods in
geophysics", Phys. Today #strong[63], 31--35 (2010).] <ref:Larmat2010PhysicsToday>

#block[\[44\] C.~Hemon, "Equations d'onde et modeles", Geophys. Prospect. #strong[26],
790--821 (1978).] <ref:Hemon78GP>

#block[\[45\] N.~D. Whitmore, "Iterative depth migration by backward time
propagation", in #emph[SEG, Expanded Abstracts], 382--385 (1983).] <ref:Whitmore83SEG>

#block[\[46\] G.~A. McMechan, "Migration by extrapolation of time-dependent boundary
values", Geophys. Prospect. #strong[31], 413--420 (1983).] <ref:McMechan83GP>

#block[\[47\] H.-W. Zhou, H.~Hu, Z.~Zou, Y.~Wo, and O.~Youn, "Reverse time migration:
A prospect of seismic imaging methodology", Earth-Sc. Rev. #strong[179],
207--227 (2018).] <ref:Zhou2018ESR>

#block[\[48\] M.~Fink and C.~Prada, "Acoustic time-reversal mirrors", Inverse Probl.
#strong[17], R1--R38 (2001).] <ref:Fink2001IP>

#block[\[49\] C.~Prada, J.-L. Thomas, and M.~Fink, "The iterative time reversal
process: Analysis of the convergence", J. Acoust. Soc. Am. #strong[97],
62--71 (1995).] <ref:Prada95JASA>

#block[\[50\] G.~Montaldo, J.~F. Aubry, M.~Tanter, and M.~Fink, "Spatio-temporal
coding in complex media for optimum beamforming: The iterative
time-reversal approach", IEEE Trans. Ultras. Ferroel. Freq. Contr.
#strong[52], 220--230 (2005).] <ref:Montaldo2005IEEE>

#block[\[51\] L.~Borcea, G.~Papanicolaou, and C.~Tsogka, "Optimal waveform design for
array imaging", Inverse Probl. #strong[23], 1973--2020 (2007).] <ref:Borcea2007IP>

#block[\[52\] J.~H. Rose, "'Single-sided' autofocusing of sound in layered materials",
Inverse Probl. #strong[18], 1923--1934 (2002).] <ref:Rose2002IP>

#block[\[53\] F.~Broggini and R.~Snieder, "Connection of scattering principles: a
visual and mathematical tour", Eur. J. Phys. #strong[33], 593--613
(2012).] <ref:Broggini2012EJP>

#block[\[54\] K.~Wapenaar, F.~Broggini, E.~Slob, and R.~Snieder, "Three-dimensional
single-sided Marchenko inverse scattering, data-driven focusing, Green's
function retrieval and their mutual relations", Phys. Rev. Lett.
#strong[110], 084301 (2013).] <ref:Wapenaar2013PRL>

#block[\[55\] A.~E. Malcolm, J.~A. Scales, and B.~A. van Tiggelen, "Extracting the
Green function from diffuse, equipartitioned waves", Phys. Rev. E
#strong[70], 015601(R) (2004).] <ref:Malcolm2004PRE>

#block[\[56\] P.~Roux, W.~A. Kuperman, and the NPAL~Group, "Extracting coherent wave
fronts from acoustic ambient noise in the ocean", J. Acoust. Soc. Am.
#strong[116], 1995--2003 (2004).] <ref:Roux2004JASA2>

#block[\[57\] M.~M. Haney, "Infrasonic ambient noise interferometry from correlations
of microbaroms", Geophys. Res. Lett. #strong[36], L19808 (2009).] <ref:Haney2009GRL>

#block[\[58\] K.~G. Sabra, S.~Conti, P.~Roux, and W.~A. Kuperman, "Passive #emph[in
vivo] elastography from skeletal muscle noise", Appl. Phys. Lett.
#strong[90], 194101 (2007).] <ref:Sabra2007APL>

#block[\[59\] K.~Wapenaar and J.~Fokkema, "Green's function representations for
seismic interferometry", Geophysics #strong[71], SI33--SI46 (2006).] <ref:Wapenaar2006GEO>

#block[\[60\] A.~Bakulin and R.~Calvert, "The virtual source method: Theory and case
study", Geophysics #strong[71], SI139--SI150 (2006).] <ref:Bakulin2006GEO>

#block[\[61\] G.~T. Schuster, #emph[Seismic Interferometry] (Cambridge University
Press) (2009), Chap. 2.] <ref:Schuster2009Book>

#block[\[62\] J.~Van~der Neut, J.~Thorbecke, K.~Mehta, E.~Slob, and K.~Wapenaar,
"Controlled-source interferometric redatuming by crosscorrelation and
multidimensional deconvolution in elastic media", Geophysics
#strong[76], SA63--SA76 (2011).] <ref:Neut2011GEO>

#block[\[63\] L.~Stehly, M.~Campillo, B.~Froment, and R.~L. Weaver, "Reconstructing
Green's function by correlation of the coda of the correlation (C$""^3$)
of ambient seismic noise", J. Geophys. Res. #strong[113], B11306 (2008).] <ref:Stehly2008JGR>

#block[\[64\] K.~Wapenaar and J.~van~der Neut, "A representation for Green's function
retrieval by multidimensional deconvolution", J. Acoust. Soc. Am.
#strong[128], EL366--EL371 (2010).] <ref:Wapenaar2010JASA>

#block[\[65\] A.~Curtis and D.~Halliday, "Directional balancing for seismic and
general wavefield interferometry", Geophysics #strong[75], SA1--SA14
(2010).] <ref:Curtis2010GEO>

#block[\[66\] A.~Fichtner, L.~Stehly, L.~Ermert, and C.~Boehm, "Generalized
interferometry $-$ I: Theory for interstation correlations", Geophys. J.
Int. #strong[208], 603--638 (2017).] <ref:Fichtner2017GJI>

#block[\[67\] J.~Corones, "Bremmer series that correct parabolic approximations",
J.~Math.~Anal.~Appl. #strong[50], 361--372 (1975).] <ref:Corones75JMAA>

#block[\[68\] D.~D. Kosloff and E.~Baysal, "Migration with the full acoustic wave
equation", Geophysics #strong[48], 677--687 (1983).] <ref:Kosloff83GEO>

#block[\[69\] L.~Fishman and J.~J. McCoy, "Derivation and application of extended
parabolic wave theories. I. The factorized Helmholtz equation",
J.~Math.~Phys. #strong[25], 285--296 (1984).] <ref:Fishman84JMP>

#block[\[70\] B.~Ursin, "Review of elastic and electromagnetic wave propagation in
horizontally layered media", Geophysics #strong[48], 1063--1081 (1983).] <ref:Ursin83GEO>

#block[\[71\] C.~P.~A. Wapenaar and A.~J. Berkhout, "Wave-field extrapolation
techniques for inhomogeneous media which include critical angle events.
Part II: Methods using the two-way wave equation", Geophys. Prospect.
#strong[34], 147--179 (1986).] <ref:Wapenaar86GP2>

#block[\[72\] L.~O. Løseth and B.~Ursin, "Electromagnetic fields in planarly layered
anisotropic media", Geophys. J. Int. #strong[170], 44--80 (2007).] <ref:Loseth2007GJI>

#block[\[73\] W.~T. Thomson, "Transmission of elastic waves through a stratified solid
medium", J. Appl. Phys. #strong[21], 89--93 (1950).] <ref:Thomson50JAP>

#block[\[74\] N.~A. Haskell, "The dispersion of surface waves on multilayered media",
Bull. Seism. Soc. Am. #strong[43], 17--34 (1953).] <ref:Haskell53BSSA>

#block[\[75\] F.~Gilbert and G.~E. Backus, "Propagator matrices in elastic wave and
vibration problems", Geophysics #strong[31], 326--332 (1966).] <ref:Gilbert66GEO>

#block[\[76\] J.~H. Woodhouse, "Surface waves in a laterally varying layered
structure", Geophys. J. R. Astr. Soc. #strong[37], 461--490 (1974).] <ref:Woodhouse74GJR>

#block[\[77\] B.~L.~N. Kennett and N.~J. Kerry, "Seismic waves in a stratified
half-space", Geophys. J. R. Astr. Soc. #strong[57], 557--584 (1979).] <ref:Kennett79GJRAS>

#block[\[78\] D.~Peng, Y.~Fan, R.~Liu, X.~Guo, and S.~Wang, "Time-reversed water waves
generated from an instantaneous time mirror", J. Phys. Commun.
#strong[4], 105013 (2020).] <ref:Peng2020JPC>
