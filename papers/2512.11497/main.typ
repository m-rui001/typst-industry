#set page(paper:"a4",margin:23mm,numbering:"1")
#set text(font:"Libertinus Serif",size:10.5pt)
#set par(justify:true,leading:.6em)
#set heading(numbering:"1.1")
#set math.equation(numbering:"(1)")
#show figure.caption: set text(size:9pt)
#align(center)[
  #text(size:16pt,weight:"bold")[Response times of two-dimensional photodetectors limited by intrinsic resistance and capacitance]
  #v(.6em)
  Ilya Safonov#super[1,2] and Dmitry Svintsov#super[1]
  #v(.5em)
  #super[1] Laboratory of 2d Materials for Optoelectronics, Center for Photonics and 2D Materials, Moscow Institute of Physics and Technology, Dolgoprudny, 141700, Russia \
  #super[2] Programmable Functional Materials Lab, Center for Neurophysics and Neuromorphic Technologies, Moscow 127495, Russia
]

*Abstract.* Most contemporary architectures of photodetectors based on two-dimensional materials include global gates for carrier density control and local p-n junctions in the channel. We study the dependence of photocurrent in such detectors on the light modulation frequency, fully taking into account the effects of distributed resistance and gate-channel capacitance. The decay of photocurrent with modulation frequency governs the response time. We find that the maximum modulation frequency is largely determined by the position of light-sensitive junction with respect to the middle of the channel. Largest modulation frequency is achieved for junctions in immediate vicinity of either source or drain contacts, while fast roll-off of the modulation characteristic is observed for junction in the middle of the channel.

= Introduction
<introduction>
Photodetectors based on two-dimensional (2d) materials feature ultrafast
response and possibility of tuning via electrical gating~\[#link(<bib:Rogalski2019a>)[1]\].
Response times can be divided into intrinsic times governing the
formation of local photocurrent, and extrinsic times governing the
formation of voltage and current in an electronic circuit. The intrinsic
times in most 2d photodetectors are very short. In graphene, where
photovoltage is generated via thermoelectric effect, the intrinsic time
is that of carrier thermalization \[#link(<bib:Tielrooij2015>)[2]\]. The latter is
estimated as hundreds of femtoseconds. In 2d electron systems based on
quantum wells, photocurrent generation via plasmon drag is often
dominant \[#link(<bib:Kurita2014>)[3]\]. The intrinsic time of such effect is that of
momentum relaxation, order of 1…10 picoseconds in high-quality
heterostructures~\[#link(<bib:Muravev2016>)[4]\].

Short intrinsic photoresponse implies that it can be easily masked by
circuit effects, i.e. by resistive and capacitive delays. The truly
external delays are minimized by matching the photodetectors with
coplanar lines. However, many photodetectors have their own channel
resistance and internal capacitances: the capacitance between source and
drain contacts, and capacitance of the channel with respect to the gate,
as shown in Fig. 1A. The distributed character of resistance and
capacitance in 2d detectors makes the question about RC-limited response
time complex. Despite the existence of several circuit models of gated
photodetectors~\[#link(<bib:Rudin2015>)[5], #link(<bib:coquillat2016high>)[6]\], it is not yet understood
which resistance and capacitance govern the response time and maximum
modulation frequency.

Currently, there exist two main approaches for radiation detection with
2d materials. The first one lies in the electrical induction of n- and
p-type regions within the channel via application of opposite voltages
to the split gates~\[#link(<bib:Castilla2020>)[7], #link(<bib:Titova2023a>)[8], #link(<bib:Soundarapandian2024>)[9]\]. The
gate-induced p-n junction is generally located in the middle of the
channel, and the photocurrent $j_(p h) \( x \)$ is generated locally at
the junction, Fig. 1B. The second approach lies in deposition of metal
contacts with dissimilar work function~\[#link(<bib:Koepfli2023>)[10], #link(<bib:Wei2021>)[11]\], Fig. 1C.
Carrier diffusion between metals and 2d channel leads to the formation
of p-i-n doping profile. The photocurrent $j_(p h) \( x \)$ in such
architecture is generated in the immediate vicinity of metal leads. In
some rare situations, like bulk photovoltaic~\[#link(<bib:Otteneder2020>)[12]\] or photon
drag effects~\[#link(<bib:Karch2010>)[13]\], the photocurrent is generated in 2d channel
uniformly, Fig. 1D.

We study the response time of gated 2d photodetectors vs. their
structural parameters: channel resistance, channel length, gate-channel
capacitance and position of the light-sensitive junction. We
theoretically consider the photocurrent response Iph to the radiation
with modulation frequency $f_(m o d)$ and show that
$I_(p h) \( f_(m o d) \)$ drops with frequency. We show that the maximum
frequency depends strongly on the position of light-sensitive junction
with respect to source and drain contacts, and find that structures with
photocurrent generation in immediate vicinity of metal leads are
superior to those with junction in the mid-channel.

#figure(image("source/F1.pdf", width: 100.0%),
  caption: [
    \(A) Schematic of the gated photodetector with 2d channel and its
    equivalent distributed RC circuit with localized photocurrent source
    (B-D) Possible physical realizations of 2d photodetectors fitting
    the scheme of panel (A): detector with p-n junction induced by split
    gate (B), detector with p-i-n junction due to dissimilar metal
    contacts (C), detector based on photon drag effect (D)
  ]
)
<Fig-strcuture>

= Methods
<methods>
We consider the photoresponse of 2d detector with channel of length $L$,
source and drain contacts located at $x = 0$ and $x = L$, respectively.
The detector is globally gated, and the gate-channel separation is
$d lt.double L$. The emerging photocurrent $I_(p h)$ is measured between
source and drain contacts. We model $I_(p h)$ at the circuit level
without specifying the microscopic origin of the photoresponse. More
precisely, we present the overall current density $j (x)$ as a sum of
photocurrent $j_(p h) (x)$ and drift current $- sigma d V \/ d x$, where
$sigma$ is the conductivity of 2d material and $V$ is the local voltage
in the channel:
$ j (x) = j_(p h) (x) - sigma frac(d V, d x) . $

The role of drift current is especially clear for localized distribution
of photocurrent density, i.e. for characteristic width of the function
$j_(p h) (x)$ well below the source-drain separation $L$. The local
electric field $d V \/ d x$ in this case builds up in the regions where
is $j_(p h) (x)$ zero, such that the total current becomes spatially
uniform. For time-independent illumination, requiring the spatial
uniformity of the current, we find
$ I_(p h \, d c) = 1 / L integral_0^L j_(p h) (x) d x \, $
i.e. the
global photocurrent is the spatial average of local photocurrents. The
photoresponse to the modulated radiation is far less trivial. We
consider the harmonic variations of local photocurrent
$j_(p h) (x \, t) = j_(p h) (x) e^(- i omega t)$, where
$omega = 2 pi f_(upright(m o d))$ is the modulation frequency. The
buildup of local electric potential is now not instantaneous and
governed by the continuity equation:
$ - i omega rho (x) + frac(d, d x) (j_(p h) (x) - sigma frac(d V, d x)) = 0 \, $
where $rho (x)$ is the local charge density in the channel. We link the
charge density $rho (x)$ and electric potential $V (x)$ via the
Poisson's equation. For 2d channels with proximate gates, the Poisson's
equation can is solved in the local capacitance approximation:
$ rho (x) = C_A [V (x) - V_G] \, $
where
$C_A = epsilon epsilon_0 \/ d$is the gate-to-channel capacitance per
unit area, and $V_G$ is the gate voltage. Considering the smallness of
photo induced voltage and potential as compared to their dc values, we
write $rho (x) = C_A V (x) .$ The final equation for distribution of
photoinduced potential becomes
$ V (x) + 1 / q_p^2 frac(d^2 V (x), d x^2) = frac(1, i omega C_A) frac(d j_(p h) (x), d x) \; $

In the regime of photocurrent measurement its boundary conditions are
$V (0) = V (L) = 0$. Above, $q_p = sqrt(i omega C_A \/ sigma)$ is the
complex parameter governing the spatial propagation of electric
potential. In the low-frequency regime, the conductivity
$sigma equiv sigma_(d c)$ is real, and the parameter $q_p$ is complex,
$q_p = e^(i pi \/ 4) sqrt(omega C_A \/ sigma_(d c))$. In such situations
the spreading of potential is diffusive. Similar equation has been
adopted in earlier papers~\[#link(<bib:Dyakonov1996>)[14], #link(<bib:Ryzhii2006>)[15]\] for the analysis of
plasmon-assisted resonant photoresponse of detectors.

Determination of photocurrent $I_(p h)$ in external circuit for
time-dependent response is based on Shockley-Ramo theorem. It states
that $I_(p h)$ is the weighted average of local currents
$ I_(p h) = integral_0^L g (x) j (x) d x $
where the weight function
$g (x)$is the electric field in the channel created by unity voltage
between source and drain. In the case of proximate gates considered
here, the source-drain electric field is strongly screened by the gate,
and persists only in the immediate vicinity of lateral contacts,
$g (x) approx [delta (x) + delta (x - L)] \/ 2$~\[#link(<bib:Svintsov2018b>)[16]\]. The
current measured Iph in such case is the average of local currents at
the source and drain:
$ I_(p h) = - sigma (frac(d V, d x)\|_(x = 0) + frac(d V, d x)\|_(x = L)) . $
Equation (5) is readily solved for arbitrary spatial dependence of
$j_(p h) (x)$, and current in external circuit is symbolically presented
as
$ I_(p h) = 1 / 2 integral_0^L frac(sin [q_p x] - sin [q_p (L - x)], sin [q_p L]) frac(d j_(p h), d x) d x . $
The frequency dependence of photocurrent is fully encoded in parameter
$q_p (omega) = e^(i pi \/ 4) sqrt(omega C_A \/ sigma_(d c))$. The wave
vector $q_p (omega)$ can be presented as
$q_p (omega) = e^(i pi \/ 4) sqrt(omega R C) \/ L$, where R is the total
channel resistance and C is the total gate-channel capacitance. Thus,
Eq. (8) generalizes the concept of RC-delay to the detectors with
distributed resistance and capacitance.

= Results and Discussion
<results-and-discussion>
To highlight the dependence of response time and maximum modulation
frequency on localization of light-sensitive junction, we adopt the
box-shaped model of photocurrent
$j_(p h) (x) = j_(p h)^((0)) theta [x - (x_(p h) - w \/ 2)] theta [(x_(p h) + w \/ 2) - x]$.
Physically, the light-sensitive junction has length $w$, centered at
$x_(p h)$, and generates constant photocurrent $j_(p h)^((0))$. The
model describes all three setups of Fig. 1 B-D via appropriate choice of
$x_(p h)$ and $w$. Plugging the model photocurrent distribution into
expression (8), we find the current in external circuit:
$ I_(p h) (omega) =\
j_(p h)^((0)) sin (frac(q_p w, 2)) [cos (q_p x_(p h)) cot (frac(q_p L, 2)) + sin (q_p x_(p h))] . $
Equation (9) is our central result. Figure 2 shows the computed
dependences of $I_(p h)$ on modulation frequency at various junction
positions $x_(p h)$ and small junction width $w = L \/ 20$. The model
parameters are adequate to contemporary graphene detectors, $L = 10$
$mu$m, $d = 100$ nm, $sigma^(- 1) = 100$ Ohm, $epsilon$=4. We observe
that the frequency roll-off of the photocurrent is fastest when the
junction is positioned in the middle of the channel, and becomes slower
as the junction gets closer to the source. The dependence
$I_(p h) (omega)$ is symmetric with respect to the mid-channel, i.e. the
frequency roll-off is identical for $x_(p h) = x_0$ and
$x_(p h) = L - x_0$. The computed dependence supports our intuition
about the propagation of photovoltage signals in distributed
photodetectors. If the photocurrent is generated away from the source
and drain, it takes a long time for the signal propagation to the
contacts, therefore the maximum modulation frequency is low. On the
contrary, for signal generated in immediate vicnity of either contact,
the RC-limited response time is very short. Only a small fraction of
channel resistance and gate-channel capacitance contributes to the
apparent $R$ and $C$. For very small separations between junction and
the contact (case $x_(p h) = L \/ 5$ in Fig. 2), the photocurrent can
even initially grow with frequency.

#figure(image("source/F2.pdf", width: 100.0%),
  caption: [
    Dependence of photocurrent on modulation frequency
    $f_(upright(m o d)) = omega \/ 2 pi$ computed with Eq. (9) for
    different positions of the light-sensitive junction $x_(p h)$.
    Detector parameters are channel length L=10 µm, gate-channel
    separation $d = 100$ nm, gate dielectric constant $epsilon = 4$,
    channel resistivity $sigma^(-1) = 100$ Ohm
  ]
)
<Fig-result>

At very high frequencies the photocurrent eventually decays according to
the asymptotic law
$ I_(p h) (omega) = j_(p h)^((0)) frac(q_p w, 2) exp (- lr(|q_p|) / sqrt(2) min {x_(p h) \, L - x_(p h)}) . $
The maximum modulation frequency $f_(upright(m o d))^max$, i.e. the
frequency at which the photodetector response drops by e times, is given
by
$ f_(m o d)^max = frac(1, pi R C) frac(L, min {x_(p h) \, L - x_(p h)}) . $
An intuitive interpretation of (11) is the following: only a fraction of
total resistance and capacitance located between the light-sensitive
junction metal contact is relevant to the RC-delay of the distributed
photodetector.

Finally, we discuss the limitations of our model. First of all, it is
based on local capacitance approximation which is valid for proximate
gates $lr(|q_p|) d < < 1$. This assumption is best fulfilled at low
frequencies, particularly, for the parameters of Fig. 2 and
$f_(upright(m o d)) = 10$ GHz we estimate $lr(|q_p|)^(- 1) approx 700$
nm, which is well above the distance to the gate. Attempting to go
beyond the local capacitance approximation, one can replace Eq. (4) with
the full Poisson's equation taking into account realistic geometry of
the source, drain and gate contacts. For certain simple arrangements of
contacts, it can be solved with conformal mapping
techniques~\[#link(<bib:Ryzhii1995>)[17]\].

Another approximation of our model is the harmonic approximation to the
modulated local photocurrent
$j_(p h) (x \, t) = j_(p h) (x) e^(- i omega t)$. Such approximation can
be valid if only the modulation frequency is well below the radiation
frequency, $f_(m o d) lt.double f_(r a d)$. The assumption can be
restrictive for sub-terahertz detectors considered for future wireless
communications, where $f_(upright("rad")) = 100 . . .300$ GHz. The
applicability of our model is limited to tens of gigahertz in that case.
For optical fiber detectors ($lambda = 1.55$ $mu$m,
$f_(upright("rad")) approx 200$ THz), the applicability of the model is
very broad and definitely covers the contemporary achievable modulation
frequencies.

= Conclusion
<conclusion>
We have generalized the concept of RC delay to the photodetectors based
on 2d materials with global gates and local light-sensitive p-n
junctions. We have shown that 'proper' resistance and capacitance
governing the maximum modulation frequency and the response time are
those of the part of the channel between light-sensitive p-n junction
and most proximate contact (either source or drain). We have derived a
general expression for the frequency roll-off of the photoresponse valid
at arbitrary light modulation frequencies and arbitrary distribution of
the photocurrent within the channel.

= Acknowledgments
<acknowledgments>
The work was supported by the grant 21-79-20225-P of the Russian Science
Foundation. The author acknowledge helpful discussions with Viacheslav
Muravev on the technology of high-frequency measurements of
photodetectors.

#heading(numbering:none)[References]

#block[\[1\] A.~Rogalski, M.~Kopytko,~and~P.~Martyniuk,~Two-dimensional infrared and
terahertz detectors: Outlook and
status,~#link("https://doi.org/10.1063/1.5088578")[Applied Physics Reviews~#strong[6],~021316 (2019)].] <bib:Rogalski2019a>

#block[\[2\] K.~J.~Tielrooij, L.~Piatkowski, M.~Massicotte, A.~Woessner, Q.~Ma,
Y.~Lee, K.~S.~Myhro, C.~N.~Lau, P.~Jarillo-Herrero, N.~F.~van
Hulst,~and~F.~H.~L.~Koppens,~Generation of photovoltage in graphene on a
femtosecond timescale through efficient carrier
heating,~#link("https://doi.org/10.1038/nnano.2015.54")[Nature Nanotechnology~#strong[10],~437 (2015)],~
arXiv:1504.06487 .] <bib:Tielrooij2015>

#block[\[3\] Y.~Kurita, G.~Ducournau, D.~Coquillat, A.~Satou, K.~Kobayashi,
S.~Boubanga Tombet, Y.~M.~Meziani, V.~V.~Popov, W.~Knap,
T.~Suemitsu,~and~T.~Otsuji,~Ultrahigh sensitive sub-terahertz detection
by InP-based asymmetric dual-grating-gate high-electron-mobility
transistors and their broadband
characteristics,~#link("https://doi.org/10.1063/1.4885499")[Applied Physics Letters~#strong[104],~251114 (2014)].] <bib:Kurita2014>

#block[\[4\] V.~M.~Muravev, V.~V.~Solov'ev, A.~A.~Fortunatov,
G.~E.~Tsydynzhapov,~and~I.~V.~Kukushkin,~On the response time of
plasmonic terahertz
detectors,~#link("https://doi.org/10.1134/S0021364016120080")[JETP Letters~#strong[103],~792 (2016)].] <bib:Muravev2016>

#block[\[5\] S.~Rudin, G.~Rupper,~and~M.~Shur,~Ultimate response time of high
electron mobility
transistors,~#link("https://doi.org/10.1063/1.4919706")[Journal of Applied Physics~#strong[117],~174502 (2015)].] <bib:Rudin2015>

#block[\[6\] D.~Coquillat, V.~Nodjiadjim, S.~Blin, A.~Konczykowska, N.~Dyakonova,
C.~Consejo, P.~Nouvel, A.~Pènarier, J.~Torres, D.~But,
#emph[et~al.],~High-speed room temperature terahertz detectors based on
inp double heterojunction bipolar transistors,~ International Journal of
High Speed Electronics and Systems~#strong[25],~1640011 (2016).] <bib:coquillat2016high>

#block[\[7\] S.~Castilla, I.~Vangelidis, V.-V.~Pusapati, J.~Goldstein, M.~Autore,
T.~Slipchenko, K.~Rajendran, S.~Kim, K.~Watanabe, T.~Taniguchi,
L.~Martín-Moreno, D.~Englund, K.-J.~Tielrooij, R.~Hillenbrand,
E.~Lidorikis,~and~F.~H.~L.~Koppens,~Plasmonic antenna coupling to
hyperbolic phonon-polaritons for sensitive and fast mid-infrared
photodetection with
graphene,~#link("https://doi.org/10.1038/s41467-020-18544-z")[Nature Communications~#strong[11],~4872 (2020)],~
arXiv:2006.00358 .] <bib:Castilla2020>

#block[\[8\] E.~Titova, D.~Mylnikov, M.~Kashchenko, I.~Safonov, S.~Zhukov,
K.~Dzhikirba, K.~S.~Novoselov, D.~A.~Bandurin,
G.~Alymov,~and~D.~Svintsov,~Ultralow-noise Terahertz Detection by p-n
Junctions in Gapped Bilayer
Graphene,~#link("https://doi.org/10.1021/acsnano.2c12285")[ACS Nano~#strong[17],~8223 (2023)],~
arXiv:2212.05352 .] <bib:Titova2023a>

#block[\[9\] K.~P.~Soundarapandian, S.~Castilla, S.~M.~Koepfli, S.~Marconi,
L.~Kulmer, I.~Vangelidis, R.~de~la Bastida, E.~Rongione, S.~Tongay,
K.~Watanabe, T.~Taniguchi, E.~Lidorikis, K.-J.~Tielrooij,
J.~Leuthold,~and~F.~H.~L.~Koppens,~High-Speed Graphene-based
Sub-Terahertz Receivers enabling Wireless Communications for 6G and
Beyond,~#link("http://arxiv.org/abs/2411.02269")[~,~1 (2024)],~
arXiv:2411.02269 .] <bib:Soundarapandian2024>

#block[\[10\] S.~M.~Koepfli, M.~Baumann, Y.~Koyaz, R.~Gadola, A.~Güngör, K.~Keller,
Y.~Horst, S.~Nashashibi, R.~Schwanninger, M.~Doderer, E.~Passerini,
Y.~Fedoryshyn,~and~J.~Leuthold,~Metamaterial graphene photodetector with
bandwidth exceeding 500
gigahertz,~#link("https://doi.org/10.1126/science.adg8017")[Science~#strong[380],~1169 (2023)].] <bib:Koepfli2023>

#block[\[11\] J.~Wei, C.~Xu, B.~Dong, C.~W.~Qiu,~and~C.~Lee,~Mid-infrared semimetal
polarization detectors with configurable polarity
transition,~#link("https://doi.org/10.1038/s41566-021-00819-6")[Nature Photonics~#strong[15],~614 (2021)].] <bib:Wei2021>

#block[\[12\] M.~Otteneder, S.~Hubmann, X.~Lu, D.~A.~Kozlov, L.~E.~Golub, K.~Watanabe,
T.~Taniguchi, D.~K.~Efetov,~and~S.~D.~Ganichev,~Terahertz Photogalvanics
in Twisted Bilayer Graphene Close to the Second Magic
Angle,~#link("https://doi.org/10.1021/acs.nanolett.0c02474")[Nano Letters~#strong[20],~7152 (2020)],~
arXiv:2006.08324 .] <bib:Otteneder2020>

#block[\[13\] J.~Karch, P.~Olbrich, M.~Schmalzbauer, C.~Zoth, C.~Brinsteiner,
M.~Fehrenbacher, U.~Wurstbauer, M.~M.~Glazov, S.~A.~Tarasenko,
E.~L.~Ivchenko, D.~Weiss, J.~Eroms, R.~Yakimova, S.~Lara-Avila,
S.~Kubatkin,~and~S.~D.~Ganichev,~Dynamic Hall Effect Driven by
Circularly Polarized Light in a Graphene
Layer,~#link("https://doi.org/10.1103/PhysRevLett.105.227402")[Physical Review Letters~#strong[105],~227402 (2010)].] <bib:Karch2010>

#block[\[14\] M.~Dyakonov~and~M.~Shur,~Detection, mixing, and frequency multiplication
of terahertz radiation by two-dimensional electronic
fluid,~#link("https://doi.org/10.1109/16.485650")[IEEE Transactions on Electron Devices~#strong[43],~380 (1996)].] <bib:Dyakonov1996>

#block[\[15\] V.~Ryzhii~and~M.~S.~Shur,~Resonant terahertz detector utilizing plasma
oscillations in two-dimensional electron system with lateral Schottky
junction,~#link("https://doi.org/10.1143/JJAP.45.L1118")[Japanese Journal of Applied Physics, Part 2: Letters~#strong[45],~8 (2006)].] <bib:Ryzhii2006>

#block[\[16\] D.~Svintsov,~Exact Solution for Driven Oscillations in Plasmonic
Field-Effect
Transistors,~#link("https://doi.org/10.1103/PhysRevApplied.10.024037")[Physical Review Applied~#strong[10],~024037 (2018)].] <bib:Svintsov2018b>

#block[\[17\] V.~Ryzhii~and~G.~Khrenov,~High-Frequency Operation of Lateral
Hot-Electron
Transistors,~#link("https://doi.org/10.1109/16.370021")[IEEE Transactions on Electron Devices~#strong[42],~166 (1995)].] <bib:Ryzhii1995>
