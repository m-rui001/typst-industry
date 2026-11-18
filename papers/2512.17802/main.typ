#set document(title: "Systematic search of laser and phase modulation noise coupling in heterodyne interferometry")
#set page(paper: "a4", margin: 21mm, numbering: "1")
#set text(font: "Libertinus Serif", size: 10.5pt)
#set par(justify: true, leading: .55em)
#set heading(numbering: "1.1")
#set math.equation(numbering: "(1)")
#show figure.caption: set text(size: 9pt)
#align(center)[
  #text(size: 17pt, weight: "bold")[Systematic search of laser and phase modulation noise coupling in heterodyne interferometry]
  #v(.6em)
  Kohei Yamamoto, Olaf Hartwig, Lennart Wissel, Holly Leopardi, Kenji Numata, and Ryan Derosa
  #v(.4em)
  #text(size: 9pt)[University of Maryland, Baltimore County ? NASA Goddard Space Flight Center ? CRESST ? Albert Einstein Institute ? Leibniz University Hannover]
]
*Abstract.* Heterodyne interferometry for precision science often comes with an optical phase modulation, for example, for intersatellite clock noise transfer for gravitational wave (GW) detectors in space, exemplified by the Laser Interferometer Space Antenna (LISA). The phase modulation potentially causes various noise couplings to the final phase extraction of heterodyne beatnotes by a phasemeter. In this paper, in the format of space-based GW detectors, we establish an analytical framework to systematically search for the coupling of various noises from the heterodyne and modulation frequency bands, which are relatively unexplored so far. In addition to the noise caused by the phase modulation, the high-frequency laser phase noise is also discussed in the same framework. The analytical result is also compared with a numerical experiment to confirm that our framework successfully captures the major noise couplings. We also demonstrate a use case of this study by taking the LISA-like parameters as an example, which enables us to derive requirements on the level of the laser and phase modulation noises in the high frequency regimes.

= Introduction
<sec:intro>
Heterodyne interferometry is an optical technique widely used in
precision
science~@LPF2016@GRACEFO2019@Shaddock2007@Numata2008@DongNguyen2020.
Essential ingredients are two electromagnetic fields with a frequency
offset, the so-called heterodyne frequency, a beam combiner to generate
their optical beatnote at the heterodyne frequency, a photoreceiver (PR)
to convert the optical power to an electronic voltage signal, and a
phasemeter to measure the phase of the heterodyne beatnote. The
interferometer used as a transducer reports the observable of interest
in an experimental setup, often spatial displacement, via the phase
signal with very high precision and/or accuracy.

This technique is often combined with an optical modulation to transfer
or acquire additional information, for example, intersatellite clock
synchronization or absolute ranging for spaceborne gravitational-wave
detectors like the Laser Interferometer Space Antenna (LISA)~@LisaRed.
LISA aims to observe gravitational waves (GWs) in the millihertz regime
by configuring interspacecraft heterodyne interferometers with three
spacecraft separated by around 2.5 million kilometer. For the purpose of
differential clock noise reduction, LISA phase-modulates an outgoing
beam with an onboard system clock around 2.4~GHz and extracts the phase
of the heterodyne beatnotes not only between beam carriers that have the
information of GWs but also between the clock sidebands in which the
onboard clock difference is encoded~@Hartwig2021@Yamamoto2022. All
heterodyne frequencies in the constellation are adjusted within
5~MHz--30~MHz via laser offset lock, so-called frequency
planning~@Heinzel2024.

Since we modulate the phase of the primary laser carrier, this could
naturally cause additional noise couplings in the metrology chain. From
the perspective of the clock noise transfer, the coupling of the noise
in the observation band, namely 0.1~mHz to 1~Hz, has been studied in
great depth~@Barke2010@Numata2023@Zeng2023@Xu2024. However, the working
principle of the phasemeter is known to also cause the unavoidable
coupling of noises at the frequencies related to heterodyne beatnotes,
e.g., the integer multiple of the heterodyne
frequency~@Wissel2022@Wissel2023@BodePhD. The combination of the
multiple heterodyne beatnotes and the phasemeter architecture in LISA
could generate numerous noise couplings from the heterodyne band.

In this paper, we systematically search for the coupling of modulation
noises above the GW observation band to the final phase extraction of
individual heterodyne beatnotes by the phasemeter. In addition to the
noise caused by phase modulation, the coupling of the laser phase noise
is also discussed in the same analytical framework. The noise frequency
band of interest is not only the heterodyne band but also the modulation
band (the MHz and GHz regime for LISA, respectively). The noise
couplings found analytically are compared with those found by numerical
simulation to confirm that our analytical framework successfully
captures major noise contributions. Finally, we demonstrate a use case
of this study by applying it to the LISA-like set of requirements, which
enables us to derive new requirements on the high-frequency noise
sources in the system.

= Framework
<sec:framework>
This section sets up a basic framework, which will then be used for
systematic search for noise couplings in the following sections. In
#link(<sub:framework_modulation>)[2.1], we first formulate a modulation
signal with different noises (relative amplitude noise $a_i$, phase
noise $theta_i$, and additive noise $v_i$). In
#link(<sub:framework_beam>)[2.2], we then model the phase-modulated
electromagnetic field representing a laser beam to the first-order
modulation sidebands: an upper sideband (usb) and a lower sideband
(lsb). In #link(<sub:framework_beatnote>)[2.3], a PR signal with three
heterodyne beatnotes (carrier-carrier, usb-usb, and lsb-lsb beatnotes)
is described. A general expression of readout noise at beatnote phase
extraction by a phasemeter in #link(<sub:framework_readout>)[8] will be
applied to the PR signal throughout the paper. In
#link(<sub:framework_strategy>)[2.4], we wrap up this section by
clarifying our strategy of the search for the noise coupling based on
the framework.

== Modulation signal
<sub:framework_modulation>
We consider the case of modulating a beam phase with a sinusoidal
signal. Let us formulate the modulation signal $V_i$ in units of voltage
that drives an electro-optic modulator (EOM) as
$ V_i \( tau \) & = a_0 \( 1 + a_i \( tau \) \) cos \( omega_(upright(m) \, i) tau + phi.alt_(upright(t a r) \, i)^(upright(s b)) \( tau \) + theta_i \( tau \) \) + v_i \( tau \) \, $<eq:Vmi>
where $a_0$ is a nominal modulation amplitude; $omega_(upright(m) \, i)$
is an angular frequency of the sinusoidal modulation signal, related to
the frequency $f_(upright(m) \, i)$ by
$omega_(upright(m) \, i) = 2 pi f_(upright(m) \, i)$\;
$phi.alt_(upright(t a r) \, i)^(upright(s b))$ is the target phase to
encode onto modulation sidebands; $a_i$ is a modulation relative
amplitude noise; $theta_i$ is a modulation additive phase noise; $v_i$
is a modulation additive voltage noise. $i$ is an index to label a
modulation signal and an associated laser beam ($i in { i \, j }$).

== Laser beam
<sub:framework_beam>
A non-modulated electromagnetic field representing a laser beam can be
formulated as
$ E_i = A_i dot.op exp \( j omega_i tau + j phi.alt_(upright(t a r) \, i)^(upright(c a r)) \( tau \) + j p_i \( tau \) \) \, $<eq:Ei>
where $A_i$ is a nominal amplitude; $omega_i$ is a laser angular
frequency, related to the frequency $f_i$ by $omega_i = 2 pi f_i$\;
$phi.alt_(upright(t a r) \, i)^(upright(c a r))$ is the target phase
that we aim to measure with a phasemeter at the end; $p_i$ is a laser
phase noise in radian. In this paper, we assume that $A_i$ is constant.
The noise coupling of the beam amplitude, caused by the relative
intensity noise (RIN), can be found in~@Wissel2022@Wissel2023.

Next, we phase-modulate the beam in #ref(<eq:Ei>) using the
modulation signal in #ref(<eq:Vmi>). We consider the EOM as
a pure linear converter of an input voltage to a phase with a conversion
factor of $pi \/ V_(upright(pi))$ where $V_(upright(pi))$ is determined
by the EOM specification. Therefore, the actual modulation phase becomes
$ phi.alt_i \( tau \) & = pi / V_(upright(pi)) V_i \( tau \) . $<eq:phi_i>
As a result, the phase-modulated laser beam reads as follows:
$ E_i & = A_i dot.op exp \( j omega_i tau + j phi.alt_(upright(t a r) \, i)^(upright(c a r)) + j p_i + j phi.alt_i \)\
 & = A_i dot.op exp \( j omega_i tau + j phi.alt_(upright(t a r) \, i)^(upright(c a r)) + j \( p_i + n_i \)\
 & + j m_i cos \( omega_(upright(m) \, i) tau + phi.alt_(upright(t a r) \, i)^(upright(s b)) + theta_i \) \) \, $<eq:Ei_phim>
since we define $ m_i & = m_0 \( 1 + a_i \) \,\
m_0 & = pi / V_(upright(pi)) a_0 \,\
n_i & = pi / V_(upright(pi)) v_i . $<eq:m_i> where $m_0$ is a modulation
depth in radian. Here and throughout the rest of the paper, we omit the
time arguments for simplicity.

We apply the Jacobi-Anger expansion to
#ref(<eq:Ei_phim>), to first-order modulation
sidebands,
$ E_i & = A_i dot.op exp \( j omega_i tau + j phi.alt_(upright(t a r) \, i)^(upright(c a r)) + j \( p_i + n_i \) \)\
 & dot.op \( J_0 \( m_i \) + j J_1 \( m_i \) upright(e)^(j \( omega_(upright(m) \, i) tau + phi.alt_(upright(t a r) \, i)^(upright(s b)) + theta_i \)) + j J_1 \( m_i \) upright(e)^(- j \( omega_(upright(m) \, i) tau + phi.alt_(upright(t a r) \, i)^(upright(s b)) + theta_i \)) \) \, $<eq:Ei_phim_sb>
where $J_n \( x \)$ is the Bessel function of the first kind. Noise
couplings due to the higher-order modulation sidebands would not be
dominant; however, we particularly discuss the noise coupling caused by
the second-order modulation sidebands in #link(<sec:mod_band>)[4]
assuming that the nominal modulation depth $m_0$ is not so small.

It is obvious that the laser phase noise $p_i$ and the modulation
additive voltage noise $n_i$ are indistinguishable. Hence, for the rest
of this paper, we only consider the laser phase noise $p_i$. However, it
is important to note that any result of $p_i$ also applies to $n_i$.

== Beatnote signal
<sub:framework_beatnote>
We finally formulate the interference between two laser beams $E_i$ and
$E_j$. The PR output signal $s_(upright(p r))$ is expressed below in
units of W with some constant factors omitted, such as a responsivity
(A/W) and a transimpedance-amplifier gain (V/A):

#block[
$ s_(upright(p r)) & = \| E_i + E_j \|^2 \/ 2\
 & = \( \| E_i \|^2 + \| E_j \|^2 \) \/ 2 + Re \[ E_i E_j^(*) \]\
 & = \( P_i + P_j \) \/ 2 + A_i A_j\
 & dot.op Re \[ exp \( j omega_(upright(h e t)) tau + phi.alt_(upright(t a r))^(upright(c a r)) + j p_Delta \) dot.op \( J_0 \( m_i \) J_0 \( m_j \) + J_1 \( m_i \) J_1 \( m_j \) upright(e)^(j \( Delta omega_(upright(m)) tau + phi.alt_(upright(t a r))^(upright(s b)) + theta_Delta \)) + J_1 \( m_i \) J_1 \( m_j \) upright(e)^(- j \( Delta omega_(upright(m)) tau + phi.alt_(upright(t a r))^(upright(s b)) + theta_Delta \)) \) \]\
 & = \( P_i + P_j \) \/ 2\
 & + A_i A_j J_0 \( m_i \) J_0 \( m_j \) cos \( omega_(upright(h e t)) tau + phi.alt_(upright(t a r))^(upright(c a r)) + p_Delta \)\
 & + A_i A_j J_1 \( m_i \) J_1 \( m_j \) cos \( \( omega_(upright(h e t)) + Delta omega_(upright(m)) \) tau + phi.alt_(upright(t a r))^(upright(u s b)) + p_Delta + theta_Delta \)\
 & + A_i A_j J_1 \( m_i \) J_1 \( m_j \) cos \( \( omega_(upright(h e t)) - Delta omega_(upright(m)) \) tau - phi.alt_(upright(t a r))^(upright(l s b)) + p_Delta - theta_Delta \) \, $<eq:spr>

]
where the target phase differences to measure are defined as follows:
$ phi.alt_(upright(t a r))^x & = phi.alt_(upright(t a r) \, i)^x - phi.alt_(upright(t a r) \, j)^x x in { upright(c a r) \, upright(s b) } \,\
phi.alt_(upright(t a r))^(upright(u s b)) & = phi.alt_(upright(t a r))^(upright(s b)) + phi.alt_(upright(t a r))^(upright(c a r)) \,\
phi.alt_(upright(t a r))^(upright(l s b)) & = phi.alt_(upright(t a r))^(upright(s b)) - phi.alt_(upright(t a r))^(upright(c a r)) \, $<eq:phixtar>
#ref(<eq:spr>) plays a pivotal role throughout this paper.
For simplicity, the same physical quantities from individual beams are
bundled as its difference as follows: $P_i = A_i^2$: single beam power;
$omega_(upright(h e t)) = omega_i - omega_j$: heterodyne frequency;
$Delta omega_(upright(m)) = omega_(upright(m) \, i) - omega_(upright(m) \, j)$:
modulation frequency offset (e.g., nominally around 1~MHz in LISA);
$p_Delta = p_i - p_j$: laser phase noise difference;
$theta_Delta = theta_i - theta_j$: modulation phase noise difference.
Note that throughout the paper, we assume
$Delta omega_(upright(m)) > 0$:
$omega_(upright(m) \, i) > omega_(upright(m) \, j)$.

The PR signal in #ref(<eq:spr>) has four constituents:
non-interfering components, a carrier-carrier beatnote, a usb-usb
beatnote, and a lsb-lsb beatnote. As we model an EOM as a pure phase
modulator, neglecting residual amplitude modulation, any modulation
noise never changes the laser total power, and correspondingly also not
the power of any non-interfering components as well. Therefore, we
discuss only the interfering components for the rest of the paper.

== Strategy
<sub:framework_strategy>
Let us wrap up this section by providing a general description of our
strategy to analyze the noise coupling.

First, following~@Wissel2022, we model a given noise $x_i$ as a
monotonic tone at the angular frequency of $omega_(upright(n))$ as
$ x_i \( tau \; omega_(upright(n)) \) & = m_x cos \( omega_(upright(n)) tau + rho \) \, $<eq:x_i>
where $m_x$ is the noise (long-term average) amplitude and $rho$ is a
given random phase. We will only consider the first-order coupling of
$m_x$. As discussed later, some noises are expected to have coherence;
therefore, it is important to base different noises on the consistent
form. In contrast to the time-domain analysis, the noises have to be
evaluated in amplitude spectral density (ASD) at the end to project it
onto a setup sensitivity, which is usually expressed in the frequency
domain. As presented in #link(<app:conversion>)[9], we can easily
translate the time-domain coupling factor to that in ASD by multiplying
by a factor of $sqrt(2)$\; therefore, we will stick to the time-domain
analysis.

Second, #link(<sub:framework_readout>)[8] derives the phasemeter readout
noise for the input signal in #ref(<eq:s_add>), which we
cite here:
$ s = k cos \( omega tau + phi.alt_k \) + l cos \( \( omega + epsilon.alt \) tau + phi.alt_l \) \, $<eq:s_add_cite>
where $epsilon.alt lt.double omega$ and $l lt.double k$. According to
#ref(label("eq:IQdemod")), when the
phasemeter extracts the target phase $phi.alt_k$, the actual phasemeter
readout $phi.alt_(upright(r e a d))$ is affected by the second monotonic
noise term as:
$ phi.alt_(upright(r e a d)) & approx phi.alt_k + l \/ k dot.op sin \( epsilon.alt tau + phi.alt_l - phi.alt_k \) . $<eq:IQdemod_cite>
The noise appears as the tone at $epsilon.alt$ in the observation band.
Hence, to analyze individual noise sources and their coupling to the
phasemeter readout, we first transform equations to the same algebraic
structure as #ref(<eq:s_add_cite>), second derive
the condition on the noise frequency $omega_(upright(n))$ that gives the
noise term the frequency of $omega + epsilon.alt approx omega$ with
$epsilon.alt$ neglected for simplicity, and third apply
#ref(<eq:IQdemod_cite>) to determine the coupled
noise.

Third, the whole noise analysis will be categorized into two parts in
terms of frequency regime: heterodyne-band noise in
#link(<sec:het_band>)[3] and modulation-band noise in
#link(<sec:mod_band>)[4]. The former is a noise around the heterodyne
frequency $omega_(upright(h e t))$ (namely, the MHz regime for LISA),
while the latter is a noise around the modulation frequency
$omega_(upright(m) \, i)$ (namely, the GHz regime for LISA). We will
show, in #link(<sec:mod_band>)[4], that the modulation-band noise can be
virtually down-converted to the heterodyne frequency band, with which
the result of the heterodyne-band noise in #link(<sec:het_band>)[3] can
be combined. In #link(<fig:fbands>)[1], we illustrate the relation
between the frequency bands.

#figure(image("source/fbands.pdf", width: 8.6cm),
  caption: [
    Illustration of the frequency bands discussed in this paper. The
    respective frequency regimes in the LISA case are written in
    brackets. Throughout the paper, $epsilon.alt$ represents a (angular)
    frequency in the observation band, phase in which is to be extracted
    by a phasemeter. Note that noises are not shown here.
  ]
)
<fig:fbands>

Finally, a certain type of noise ($p_i$, $a_i$, $theta_i$, or $n_i$) has
incoherent contributions from individual laser beams in an
indistinguishable way, as shown in #ref(<eq:spr>). Hence,
we can consider only one of the laser contributions without the loss of
generality. To estimate the total coupling factor, we can simply
multiply the resulting noise coupling factor by $sqrt(2)$ representing
the incoherent sum between the two beams.

= Heterodyne-band noises
<sec:het_band>
As shown in #ref(<eq:spr>), we have the three heterodyne
beatnotes: the carrier-carrier beatnote at $omega_(upright(h e t))$ in
the middle, and the usb-usb and lsb-lsb beatnotes symmetrically located
around the carrier-carrier beatnote with the frequency offset of
$Delta omega_(upright(m))$. In this section, we systematically derive
noise couplings from the heterodyne band based on interactions among
those beatnotes, and we categorize the coupling mechanisms into two for
this purpose: #emph[self noise coupling] and #emph[mutual noise
coupling]. In the self noise coupling in
#link(<sub:het_band_self>)[3.1], we discuss the coupling of a noise in a
certain beatnote to the phase extraction of itself. On the other hand,
the mutual noise coupling in #link(<sub:het_band_mutual>)[3.2]
represents the coupling of a noise in a certain beatnote to the phase
extraction of another beatnote. In addition to the heterodyne-band
noise, noise in the observation band will also be incorporated in the
same framework. #link(<fig:het-band-noises-illustration>)[2] shows an
illustration for these two types of noise couplings.

#figure(image("source/het-band-noises-illustration.png", width: 8.6cm),
  caption: [
    Illustration of the heterodyne-band noises from
    #link(<sec:het_band>)[3]. It shows the different frequency bands and
    noise couplings into the various beatnotes. Note that the noises,
    labeled $N_(upright("lsb/car/usb"))$ (with their width defined by
    the phasemeter bandwith) and representing
    $a_i \, p_i \, theta_i thin & thin n_i$, are schematically shown as
    an additive noise floor, whilst those (except for $a_i$, as visible
    in #ref(<eq:spr>)) are actually direct phase noises
    that can be expanded in frequency by the Jacobi-Anger expressions as
    explained in the corresponding
    #ref(label("sub:het_band_self")), #ref(label("sub:het_band_mutual")).
  ]
)
<fig:het-band-noises-illustration>

All results are summarized in
#ref(<tab:noise_couplings>) at the end.

== Self noise coupling
<sub:het_band_self>
We first provide a general description and then apply it to the
individual beatnotes. \
\
#emph[General description:] The self noise coupling considers only a
single beatnote with amplitude and phase noise. Hence, the signal form
in the scope is
$ s & = A_(upright(n)) cos \( omega_(upright(A)) tau + phi.alt_(upright(t a r)) + phi.alt_(upright(n)) \) \, $<eq:self_general>
where $A_(upright(n)) = A_0 \( 1 + a_(upright(n)) \)$ contains a nominal
amplitude $A_0$ and a relative amplitude noise $a_(upright(n))$, while
$phi.alt_(upright(n))$ is a phase noise added to a target phase
$phi.alt_(upright(t a r))$. $omega_(upright(A))$ is the beatnote
frequency. By definition, $phi.alt_(upright(t a r))$ is assumed to have
a non-zero power only in the final observation band.

First, we derive a general coupling factor of $a_(upright(n))$ by
applying the monotonic noise representation in
#ref(<eq:x_i>) as
$ A_(upright(n)) & = A_0 \( 1 + a_(upright(n)) \)\
 & = A_0 \( 1 + m_(upright(n)) cos \( omega_(upright(n)) tau + rho \) \) . $<eq:A_n_self_general>
If we neglect $phi.alt_(upright(n))$ in
#ref(<eq:self_general>) to focus on
$A_(upright(n))$ and substitute
#ref(<eq:A_n_self_general>), we get

#block[
$ s & = A_0 \( 1 + m_(upright(n)) cos \( omega_(upright(n)) tau + rho \) \) cos \( omega_(upright(A)) tau + phi.alt_(upright(t a r)) \)\
 & = A_0 cos \( omega_(upright(A)) tau + phi.alt_(upright(t a r)) \) + frac(A_0 m_(upright(n)), 2) \( cos \( \( omega_(upright(n)) - omega_(upright(A)) \) tau - phi.alt_(upright(t a r)) + rho \) + cos \( \( omega_(upright(n)) + omega_(upright(A)) \) tau + phi.alt_(upright(t a r)) + rho \) \) . $<eq:ampnoise_self_general>

]
As discussed in #link(<sub:framework_readout>)[8], our interest is the
noise term around $omega_(upright(A))$. Therefore, only
$omega_(upright(n)) = 2 omega_(upright(A))$, which results in an
additional oscillating term at the beat frequency $omega_(upright(A))$,
is important, since we define all (angular) frequencies by a positive
value. Hence, the total signal bandpassed around $omega_(upright(A))$
reads
$ s_(omega_(upright(A))) & = A_0 cos \( omega_(upright(A)) tau + phi.alt_(upright(t a r)) \) + frac(A_0 m_(upright(n)), 2) cos \( omega_(upright(A)) tau - phi.alt_(upright(t a r)) + rho \) . $<eq:ampnoise_self_general_2wa>
Because
#ref(label("eq:ampnoise_self_general_2wa")), #ref(label("eq:s_add_cite"))
have the same algebraic structure, the measured phase error can be
derived by substituting $k = A_0$,
$phi.alt_k = phi.alt_(upright(t a r))$,
$l = frac(A_0 m_(upright(n)), 2)$, and
$phi.alt_l = rho - phi.alt_(upright(t a r))$ into
#ref(<eq:IQdemod_cite>),
$ phi.alt_(upright(r e a d)) = phi.alt_(upright(t a r)) + 1 / 2 m_(upright(n)) sin \( rho - 2 phi.alt_(upright(t a r)) \) . $<eq:phi_read_self_ampnoise>
This is the same coupling mechanism as so-called “2f-RIN\" in the
context of the laser RIN~@Wissel2022.

Second, we focus on the phase noise $phi.alt_(upright(n))$ in
#ref(<eq:self_general>) under
$A_(upright(n)) = A_0$. It is obvious from the simple addition of
$phi.alt_(upright(t a r)) + phi.alt_(upright(n))$ in
#ref(<eq:self_general>) that the noise power of
$phi.alt_(upright(n))$ in the observation band is indistinguishable from
$phi.alt_(upright(t a r))$\; hence, it appears the phase readout as is:
$cos rho$ following the noise form in #ref(<eq:x_i>). To
find other noise frequencies that have a coupling, let us transform
#ref(<eq:self_general>) via Jacobi-Anger
expansion as:
$ s & = A_0 cos \( omega_(upright(A)) tau + phi.alt_(upright(t a r)) + m_(upright(n)) cos \( omega_(upright(n)) tau + rho \) \)\
 & = A_0 cos \( omega_(upright(A)) tau + phi.alt_(upright(t a r)) \) cos \( m_(upright(n)) cos \( omega_(upright(n)) tau + rho \) \)\
 & - A_0 sin \( omega_(upright(A)) tau + phi.alt_(upright(t a r)) \) sin \( m_(upright(n)) cos \( omega_(upright(n)) tau + rho \) \)\
 & approx A_0 J_0 \( m_(upright(n)) \) cos \( omega_(upright(A)) tau + phi.alt_(upright(t a r)) \)\
 & - 2 A_0 J_1 \( m_(upright(n)) \) cos \( omega_(upright(n)) tau + rho \) sin \( omega_(upright(A)) tau + phi.alt_(upright(t a r)) \) \, $<eq:phasenoise_self_general0>
where in the last line, we consider only $J_0 \( m_(upright(n)) \)$ and
$J_1 \( m_(upright(n)) \)$, neglecting high-order Bessel functions
because $J_k \( m_(upright(n)) \) tilde.op O \( m_(upright(n))^k \)$
under $m_(upright(n)) lt.double 1$. Therefore, the bandpassed signal
around $omega_(upright(A))$ has a noise term when
$omega_(upright(n)) = 2 omega_(upright(A))$ as:
$ s_(omega_(upright(A))) & approx A_0 J_0 \( m_(upright(n)) \) cos \( omega_(upright(A)) tau + phi.alt_(upright(t a r)) \)\
 & + A_0 J_1 \( m_(upright(n)) \) cos \( omega_(upright(A)) tau + rho - phi.alt_(upright(t a r)) - pi / 2 \) . $<eq:phasenoise_self_general>
In
#ref(<eq:phasenoise_self_general>),
the sinusoidal noise term is converted to the cosine with the phase
shift by $pi \/ 2$ just to directly relate this equation to
#ref(<eq:s_add_cite>). Because
#ref(label("eq:phasenoise_self_general")), #ref(label("eq:s_add_cite"))
has the same algebraic structure, the resulting phase error can be
derived by substituting $k = A_0 J_0 \( m_(upright(n)) \) approx A_0$,
$phi.alt_k = phi.alt_(upright(t a r))$,
$l = A_0 J_1 \( m_(upright(n)) \) approx A_0 m_(upright(n)) \/ 2$, and
$phi.alt_l = rho - phi.alt_(upright(t a r)) - pi \/ 2$ into
#ref(<eq:IQdemod_cite>) under
$m_(upright(n)) lt.double 1$ as:
$ phi.alt_(upright(r e a d)) & = phi.alt_(upright(t a r)) + 1 / 2 m_(upright(n)) sin \( rho - 2 phi.alt_(upright(t a r)) - pi / 2 \)\
 & = phi.alt_(upright(t a r)) - 1 / 2 m_(upright(n)) cos \( rho - 2 phi.alt_(upright(t a r)) \) . $<eq:phi_read_self_phasenoise>
This can be considered as a general derivation of what is called “2f
noise down-conversion\" in @BodePhD.

#block[
#figure(
  align(center)[#table(
    columns: 3,
    align: (center,center,center,),
    table.header([Noise type], [Frequency], [Coupled noise],),
    table.hline(),
    [], [], [],
    [$a_(upright(n))$], [$2 omega_(upright(A))$], [$m_(upright(n)) / 2 sin \( rho - 2 phi.alt_(upright(t a r)) \)$],
    [$phi.alt_(upright(n))$], [$epsilon.alt$], [$cos rho$],
    [], [$2 omega_(upright(A))$], [$- m_(upright(n)) / 2 cos \( rho - 2 phi.alt_(upright(t a r)) \)$],
  )]
  , caption: [General expression of the self noise coupling based on the
  signal form of
  $A_(upright(n)) cos \( omega_(upright(A)) tau + phi.alt_(upright(t a r)) + phi.alt_(upright(n)) \)$
  where $A_(upright(n)) = A_0 \( 1 + a_(upright(n)) \)$, as shown in
  #ref(<eq:self_general>). $a_(upright(n))$:
  relative amplitude noise; $phi.alt_(upright(n))$: phase noise.
  $m_(upright(n))$ is the noise amplitude. ]
  , kind: table
  )

] <tab:self>
The general results are summarized in #link(<tab:self>)[1]. Throughout
the rest of this section, we apply these results to each beatnote in
#ref(<eq:spr>) for the noise contribution of a single beam:
beam $i$. \
\
#emph[Carrier-carrier beatnote:] Let us extract the carrier-carrier
beatnote from #ref(<eq:spr>):
$ s_(upright(p r))^(upright(c a r)) & = A_i A_j J_0 \( m_i \) J_0 \( m_0 \) cos \( omega_(upright(h e t)) tau + phi.alt_(upright(t a r))^(upright(c a r)) + p_i \)\
 & approx A_i A_j J_0^2 \( m_0 \) \( 1 - frac(m_0^2 a_i, 2 J_0 \( m_0 \)) \) cos \( omega_(upright(h e t)) tau + phi.alt_(upright(t a r))^(upright(c a r)) + p_i \) . $<eq:scar_prifo>
To consider the noise of one of the two beams, the modulation amplitude
noise $a_i$ and the laser phase noise $p_i$ remain, while
$a_j = p_j = 0$. The modulation phase noise $theta_i$ is obviously not
relevant, as the carrier-carrier beatnote does not include $theta_i$.
The second line uses the following general relation:
$ J_0 \( x \( 1 + delta \) \) & approx J_0 \( x \) - delta x J_1 \( x \)\
 & approx J_0 \( x \) \( 1 - frac(x^2 delta, 2 J_0 \( x \)) \) \, $<eq:J0_delta>
where the first line results from $delta lt.double 1$, and the second
line neglects $O \( delta x^3 \)$. According to the summary in
#link(<tab:self>)[1], we need to consider only the noise at
$2 omega_(upright(h e t))$.

First, regarding the modulation amplitude noise $a_i$ under
$a_i = m_(upright(a)) cos \( omega_(upright(n)) tau + rho \)$ following
#ref(<eq:x_i>), if
#ref(<eq:scar_prifo>) is compared with
#ref(<eq:self_general>), one finds that
$m_(upright(n))$ in this case is
$- frac(m_0^2 m_(upright(a)), 2 J_0 \( m_0 \))$. Therefore, we can
derive the phasemeter output from its general form in
#ref(<eq:phi_read_self_ampnoise>) as:
$ phi.alt_(upright(r e a d))^(upright(c a r)) & = phi.alt_(upright(t a r)) - frac(m_0^2, 4 J_0 \( m_0 \)) dot.op m_(upright(a)) sin \( rho - 2 phi.alt_(upright(t a r))^(upright(c a r)) \) . $<eq:phi_read_2f_car>

Second, regarding the laser phase noise $p_i$ under
$p_i = m_(upright(p)) cos \( omega_(upright(n)) tau + rho \)$ following
#ref(<eq:x_i>), the noise in the observation band appears
in the phase readout as is according to #link(<tab:self>)[1]. Concerning
the noise at $2 omega_(upright(h e t))$, if we apply
#ref(<eq:phi_read_self_phasenoise>),
we get
$ phi.alt_(upright(r e a d))^(upright(c a r)) & = phi.alt_(upright(t a r)) - 1 / 2 dot.op m_(upright(p)) cos \( rho - 2 phi.alt_(upright(t a r))^(upright(c a r)) \) . $<eq:phi_read_2f_car-continued>

#emph[Sideband-sideband beatnotes:] We now investigate the self noise
coupling of $a_i$, $p_i$, and $theta_i$ to the measured phase of the two
sideband-sideband beatnotes in #ref(<eq:spr>) individually.
Similarly to #ref(<eq:scar_prifo>), we only
consider the noises of beam $i$, neglecting those of beam $j$. Let us
extract the sideband-sideband beatnotes in #ref(<eq:spr>)
separately:
$ s_(upright(p r))^(upright(u s b)) & = A_i A_j J_1 \( m_i \) J_1 \( m_0 \) cos \( \( omega_(upright(h e t)) + Delta omega_(upright(m)) \) tau + phi.alt_(upright(t a r))^(upright(u s b)) + p_i + theta_i \)\
 & approx A_i A_j J_1^2 \( m_0 \) \( 1 + a_i \) cos \( \( omega_(upright(h e t)) + Delta omega_(upright(m)) \) tau + phi.alt_(upright(t a r))^(upright(u s b)) + p_i + theta_i \) \,\
s_(upright(p r))^(upright(l s b)) & = A_i A_j J_1 \( m_i \) J_1 \( m_0 \) cos \( \( omega_(upright(h e t)) - Delta omega_(upright(m)) \) tau - phi.alt_(upright(t a r))^(upright(l s b)) + p_i - theta_i \)\
 & approx A_i A_j J_1^2 \( m_0 \) \( 1 + a_i \) cos \( \( omega_(upright(h e t)) - Delta omega_(upright(m)) \) tau - phi.alt_(upright(t a r))^(upright(l s b)) + p_i - theta_i \) \, $<eq:ssb_prifo>
since in general
$ J_1 \( x \( 1 + delta \) \) & approx J_1 \( x \) \( 1 + delta \) - delta x J_2 \( x \)\
 & approx J_1 \( x \) \( 1 + delta \) \, $<eq:J1_delta> where the first
line results from $delta lt.double 1$, and the second line neglect
$O \( delta x^3 \)$. According to the general expression summarized in
#link(<tab:self>)[1], the relevant noise frequency in the heterodyne
band is the double of the target heterodyne frequency:
$2 \( omega_(upright(h e t)) + Delta omega_(upright(m)) \)$ for the
usb-usb beatnote and
$2 \( omega_(upright(h e t)) - Delta omega_(upright(m)) \)$ for the
lsb-lsb beatnote.

First, focusing on the modulation amplitude noise $a_i$ under
$p_i = theta_i = 0$, the comparison of
#ref(<eq:ssb_prifo>) with
#ref(label("eq:self_general")), #ref(label("eq:A_n_self_general"))
gives the phasemeter output via
#ref(<eq:phi_read_self_ampnoise>) by
$ phi.alt_(upright(r e a d))^(upright(u s b)) & = phi.alt_(upright(t a r))^(upright(u s b)) + 1 / 2 dot.op m_(upright(a)) sin \( rho - 2 phi.alt_(upright(t a r))^(upright(u s b)) \) #scale(x: 120%, y: 120%)[\|]_(2 \( omega_(upright(h e t)) + Delta omega_(upright(m)) \)) \,\
phi.alt_(upright(r e a d))^(upright(l s b)) & = - phi.alt_(upright(t a r))^(upright(l s b)) + 1 / 2 dot.op m_(upright(a)) sin \( rho + 2 phi.alt_(upright(t a r))^(upright(l s b)) \) #scale(x: 120%, y: 120%)[\|]_(2 \( omega_(upright(h e t)) - Delta omega_(upright(m)) \)) . $<eq:ampnoise_self_sb>
“$#scale(x: 120%, y: 120%)[\|]_omega$\" represents the original
frequency of the noise source resulting in the coupled noise term. In
general, it is possible to linearly combine
$phi.alt_(upright(r e a d))^(upright(u s b))$ and
$phi.alt_(upright(r e a d))^(upright(l s b))$ as:
$ frac(phi.alt_(upright(r e a d))^(upright(u s b)) - phi.alt_(upright(r e a d))^(upright(l s b)), 2) & = phi.alt_(upright(t a r))^(upright(s b)) + upright("(noises)") \, $<eq:sbcombi>
which may enhance a signal-to-noise ratio (SNR) depending on noise
coherence. In the particular case of
#ref(<eq:ampnoise_self_sb>), the combination
does not cancel the noise terms because they are incoherent due to the
different original noise frequencies.

Second, when it comes to the laser phase noise $p_i$, the noise in the
observation band directly couples to the phase readout as is: $cos rho$
following #ref(<eq:x_i>). However, it can be removed by
the combination in #ref(<eq:sbcombi>). Concerning the
heterodyne band, the noise components at
$2 \( omega_(upright(h e t)) + Delta omega_(upright(m)) \)$ for the
usb-usb beatnote and
$2 \( omega_(upright(h e t)) - Delta omega_(upright(m)) \)$ for the
lsb-lsb beatnote also couple separately, and, according to
#ref(<eq:phi_read_self_phasenoise>),
the measured phases read
$ phi.alt_(upright(r e a d))^(upright(u s b)) & = phi.alt_(upright(t a r))^(upright(u s b)) - 1 / 2 dot.op m_(upright(p)) cos \( rho - 2 phi.alt_(upright(t a r))^(upright(u s b)) \) #scale(x: 120%, y: 120%)[\|]_(2 \( omega_(upright(h e t)) + Delta omega_(upright(m)) \)) \,\
phi.alt_(upright(r e a d))^(upright(l s b)) & = - phi.alt_(upright(t a r))^(upright(l s b)) - 1 / 2 dot.op m_(upright(p)) cos \( rho + 2 phi.alt_(upright(t a r))^(upright(l s b)) \) #scale(x: 120%, y: 120%)[\|]_(2 \( omega_(upright(h e t)) - Delta omega_(upright(m)) \)) . $<eq:pnoise_self_sb>
Similarly to #ref(<eq:ampnoise_self_sb>),
these cannot be canceled by the combination in
#ref(<eq:sbcombi>), as the original laser phase noises
are in the different frequency regimes, therefore, incoherent.

Finally, concerning the modulation phase noise $theta_i$ under
$theta_i = m_(upright(theta)) cos \( omega_(upright(n)) tau + rho \)$
following #ref(<eq:x_i>), the noise component in the
observation band directly couples to the phase readout with a coupling
factor of $plus.minus cos rho$. Contrary to the laser phase noise $p_i$
discussed above, $theta_i$ has the opposite signs between the usb-usb
beatnote and the lsb-lsb beatnote in
#ref(<eq:ssb_prifo>), and cannot be suppressed by
the combination in #ref(<eq:sbcombi>). Regarding the
heterodyne band, the same logic as the laser phase noise above applies
but with the sign flip for the lsb-lsb beatnote. The phasemeter
measurements with the noise in the relevant heterodyne-band frequencies
are written by
$ phi.alt_(upright(r e a d))^(upright(u s b)) & = phi.alt_(upright(t a r))^(upright(u s b)) - 1 / 2 dot.op m_(upright(theta)) cos \( rho - 2 phi.alt_(upright(t a r))^(upright(u s b)) \) #scale(x: 120%, y: 120%)[\|]_(2 \( omega_(upright(h e t)) + Delta omega_(upright(m)) \)) \,\
phi.alt_(upright(r e a d))^(upright(l s b)) & = - phi.alt_(upright(t a r))^(upright(l s b)) + 1 / 2 dot.op m_(upright(theta)) cos \( rho + 2 phi.alt_(upright(t a r))^(upright(l s b)) \) #scale(x: 120%, y: 120%)[\|]_(2 \( omega_(upright(h e t)) - Delta omega_(upright(m)) \)) . $<eq:thetanoise_self_sb>
Since they are originally at the different frequencies, the noises will
be incoherently added, if we combine
$phi.alt_(upright(r e a d))^(upright(u s b))$ and
$phi.alt_(upright(r e a d))^(upright(l s b))$ as shown in
#ref(<eq:sbcombi>).

The results of the self noise coupling in this section are summarized in
#ref(<tab:noise_couplings>) as its diagonal
elements.

== Mutual noise coupling
<sub:het_band_mutual>
Similarly to #link(<sub:het_band_self>)[3.1], we first provide a general
description and then apply it to the individual beatnotes. \
\
#emph[General description:] If a signal of interest contains two
sinusoidal tones at different frequencies, we can generally formulate
the signal as $ s & = s_(upright(A)) + s_(upright(B))\
 & = A_0 cos \( omega_(upright(A)) tau + phi.alt_(upright(t a r)) \) + B_n cos \( omega_(upright(B)) tau + phi.alt_(upright(B)) + phi.alt_(upright(n)) \) \, $<eq:mutual_general>
where $omega_(upright(A)) eq.not omega_(upright(B))$, and a given phase
$phi.alt_(upright(B))$ of the noise sinusoid is considered. The first
term $s_(upright(A))$ is the primary, whose phase
$phi.alt_(upright(t a r))$ has to be measured, and the second term
$s_(upright(B))$ is the secondary considered as a noise source. $b_n$ in
$B_n \( = B_0 \( 1 + b_n \) \)$ and $phi.alt_(upright(n))$ are the
relative amplitude noise and the phase noise, respectively. In the
mutual noise coupling, the question to answer is how the noises in
$s_(upright(B))$ couples to the measurement of
$phi.alt_(upright(t a r))$ in $s_(upright(A))$.

First, regarding the relative amplitude noise $b_n$
($= m_(upright(n)) cos \( omega_(upright(n)) tau + rho \)$) in $B_n$,
the secondary noise tone can be written as
$ s_(upright(B)) & = B_0 \( 1 + m_(upright(n)) cos \( omega_(upright(n)) tau + rho \) \) cos \( omega_(upright(B)) tau + phi.alt_(upright(B)) \)\
 & = B_0 cos \( omega_(upright(B)) tau + phi.alt_(upright(B)) \)\
 & + frac(B_0 m_(upright(n)), 2) cos \( \( omega_(upright(n)) - omega_(upright(B)) \) tau + rho - phi.alt_(upright(B)) \)\
 & + frac(B_0 m_(upright(n)), 2) cos \( \( omega_(upright(n)) + omega_(upright(B)) \) tau + rho + phi.alt_(upright(B)) \) . $<eq:ampnoise_mutual_general>
Our interest is the noise term at $omega_(upright(A))$\; therefore,
there are multiple solutions to $omega_(upright(n))$,
$ omega_(upright(n)) - omega_(upright(B)) & = plus.minus omega_(upright(A)) arrow.r.double omega_(upright(n)) = plus.minus omega_(upright(A)) + omega_(upright(B)) \,\
omega_(upright(n)) + omega_(upright(B)) & = plus.minus omega_(upright(A)) arrow.r.double omega_(upright(n)) = omega_(upright(A)) - omega_(upright(B)) \, $<eq:mutual_omegan1>
where #ref(<eq:mutual_omegan1>) only considers
the positive sign of $omega_(upright(A))$ as we define all (angular)
frequencies with $omega > 0 med H z$. Therefore, for a certain pair of
$s_(upright(A))$ and $s_(upright(B))$, there are two possible noise
frequencies: $omega_(upright(A)) + omega_(upright(B))$ and the positive
one out of $- omega_(upright(A)) + omega_(upright(B))$ or
$omega_(upright(A)) - omega_(upright(B))$. The bandpassed signal around
$omega_(upright(A))$ can be written separately for each case as

#block[
$ s_(omega_(upright(A))) & = cases(delim: "{", A_0 cos \( omega_(upright(A)) tau + phi.alt_(upright(t a r)) \) + frac(B_0 m_(upright(n)), 2) cos \( omega_(upright(A)) tau + rho - phi.alt_(upright(B)) \) & upright(" if ") omega_(upright(n)) = omega_(upright(A)) + omega_(upright(B)) upright(","), A_0 cos \( omega_(upright(A)) tau + phi.alt_(upright(t a r)) \) + frac(B_0 m_(upright(n)), 2) cos \( omega_(upright(A)) tau + rho + phi.alt_(upright(B)) \) & upright(" if ") omega_(upright(n)) = omega_(upright(A)) - omega_(upright(B)) upright(","), A_0 cos \( omega_(upright(A)) tau + phi.alt_(upright(t a r)) \) + frac(B_0 m_(upright(n)), 2) cos \( omega_(upright(A)) tau - rho + phi.alt_(upright(B)) \) & upright(" if ") omega_(upright(n)) = - omega_(upright(A)) + omega_(upright(B)) upright(".")) $<eq:ampnoise_mutual_general-continued>
Because
#ref(label("eq:ampnoise_mutual_general")), #ref(label("eq:s_add_cite"))
have the same algebraic form, the resulting phase errors can be derived
by substituting $k = A_0$, $phi.alt_k = phi.alt_(upright(t a r))$,
$l = B_0 m_(upright(n)) \/ 2$, and
$phi.alt_l = plus.minus rho plus.minus phi.alt_(upright(B))$ into
#ref(<eq:IQdemod_cite>),
$ phi.alt_(upright(r e a d)) & = cases(delim: "{", phi.alt_(upright(t a r)) + frac(B_0, 2 A_0) m_(upright(n)) sin \( rho - phi.alt_(upright(B)) - phi.alt_(upright(t a r)) \) & upright(" if ") omega_(upright(n)) = omega_(upright(A)) + omega_(upright(B)) upright(","), phi.alt_(upright(t a r)) + frac(B_0, 2 A_0) m_(upright(n)) sin \( rho + phi.alt_(upright(B)) - phi.alt_(upright(t a r)) \) & upright(" if ") omega_(upright(n)) = omega_(upright(A)) - omega_(upright(B)) upright(","), phi.alt_(upright(t a r)) - frac(B_0, 2 A_0) m_(upright(n)) sin \( rho - phi.alt_(upright(B)) + phi.alt_(upright(t a r)) \) & upright(" if ") omega_(upright(n)) = - omega_(upright(A)) + omega_(upright(B)) upright(".")) $<eq:phi_read_mutual_ampnoise>

Second, regarding the phase noise $phi.alt_(upright(n))$, we can follow
the similar derivation in
#ref(<eq:phasenoise_self_general0>)
with the Jacobi-Anger expansion,
$ s_(upright(B)) & = B_0 cos \( omega_(upright(B)) tau + phi.alt_(upright(B)) + m_(upright(n)) cos \( omega_(upright(n)) tau + rho \) \)\
 & = B_0 cos \( omega_(upright(B)) tau + phi.alt_(upright(B)) \) cos \( m_(upright(n)) cos \( omega_(upright(n)) tau + rho \) \) - B_0 sin \( omega_(upright(B)) tau + phi.alt_(upright(B)) \) sin \( m_(upright(n)) cos \( omega_(upright(n)) tau + rho \) \)\
 & approx B_0 J_0 \( m_(upright(n)) \) cos \( omega_(upright(B)) tau + phi.alt_(upright(B)) \) - 2 B_0 J_1 \( m_(upright(n)) \) cos \( omega_(upright(n)) tau + rho \) sin \( omega_(upright(B)) tau + phi.alt_(upright(B)) \)\
 & = B_0 J_0 \( m_(upright(n)) \) cos \( omega_(upright(B)) tau + phi.alt_(upright(B)) \) - B_0 J_1 \( m_(upright(n)) \) \( cos \( \( omega_(upright(B)) + omega_(upright(n)) \) tau + phi.alt_(upright(B)) + rho - pi / 2 \) + cos \( \( omega_(upright(B)) - omega_(upright(n)) \) tau + phi.alt_(upright(B)) - rho - pi / 2 \) \) \, $<eq:phasenoise_mutual_sB>
where in the third line, we neglect second- and high-order Bessel
functions because $m_(upright(n)) lt.double 1$. In the last line,
similarly to
#ref(<eq:phasenoise_self_general>),
the noise terms are converted to the cosine with the phase shift by
$pi \/ 2$ to directly relate this equation to
#ref(<eq:s_add_cite>). This suggests that we need
to consider the same noise frequency bands as the modulation amplitude
noise above. Therefore, the total signal around $omega_(upright(A))$
becomes
$ s_(omega_(upright(A))) & = cases(delim: "{", A_0 cos \( omega_(upright(A)) tau + phi.alt_(upright(t a r)) \) - B_0 J_1 \( m_(upright(n)) \) cos \( omega_(upright(A)) tau + rho - phi.alt_(upright(B)) + pi / 2 \) & upright(" if ") omega_(upright(n)) = omega_(upright(A)) + omega_(upright(B)) upright(","), A_0 cos \( omega_(upright(A)) tau + phi.alt_(upright(t a r)) \) - B_0 J_1 \( m_(upright(n)) \) cos \( omega_(upright(A)) tau + rho + phi.alt_(upright(B)) - pi / 2 \) & upright(" if ") omega_(upright(n)) = omega_(upright(A)) - omega_(upright(B)) upright(","), A_0 cos \( omega_(upright(A)) tau + phi.alt_(upright(t a r)) \) - B_0 J_1 \( m_(upright(n)) \) cos \( omega_(upright(A)) tau - rho + phi.alt_(upright(B)) - pi / 2 \) & upright(" if ") omega_(upright(n)) = - omega_(upright(A)) + omega_(upright(B)) upright(".")) $<eq:phasenoise_mutual_general>

]
From
#ref(label("eq:s_add_cite")), #ref(label("eq:IQdemod_cite")),
the resulting phase error can be derived by substituting $k = A_0$,
$phi.alt_k = phi.alt_(upright(t a r))$,
$l = - B_0 J_1 \( m_(upright(n)) \) approx - B_0 m_(upright(n)) \/ 2$,
and
$phi.alt_l = plus.minus rho plus.minus phi.alt_(upright(B)) plus.minus pi \/ 2$
into #ref(<eq:IQdemod_cite>),
$ phi.alt_(upright(r e a d)) & = cases(delim: "{", phi.alt_(upright(t a r)) - frac(B_0, 2 A_0) m_(upright(n)) cos \( rho - phi.alt_(upright(B)) - phi.alt_(upright(t a r)) \) & upright(" if ") omega_(upright(n)) = omega_(upright(A)) + omega_(upright(B)) upright(","), phi.alt_(upright(t a r)) + frac(B_0, 2 A_0) m_(upright(n)) cos \( rho + phi.alt_(upright(B)) - phi.alt_(upright(t a r)) \) & upright(" if ") omega_(upright(n)) = omega_(upright(A)) - omega_(upright(B)) upright(","), phi.alt_(upright(t a r)) + frac(B_0, 2 A_0) m_(upright(n)) cos \( rho - phi.alt_(upright(B)) + phi.alt_(upright(t a r)) \) & upright(" if ") omega_(upright(n)) = - omega_(upright(A)) + omega_(upright(B)) upright(".")) $<eq:phi_read_mutual_phasenoise>

#block[
#figure(
  align(center)[#table(
    columns: 3,
    align: (center,center,center,),
    table.header([Noise type], [Frequency], [Coupled noise],),
    table.hline(),
    [], [], [],
    [$b_n$], [$omega_(upright(A)) + omega_(upright(B))$], [$frac(B_0 m_(upright(n)), 2 A_0) sin \( rho - phi.alt_(upright(B)) - phi.alt_(upright(t a r)) \)$],
    [], [$omega_(upright(A)) - omega_(upright(B))$], [$frac(B_0 m_(upright(n)), 2 A_0) sin \( rho + phi.alt_(upright(B)) - phi.alt_(upright(t a r)) \)$],
    [], [$- omega_(upright(A)) + omega_(upright(B))$], [$- frac(B_0 m_(upright(n)), 2 A_0) sin \( rho - phi.alt_(upright(B)) + phi.alt_(upright(t a r)) \)$],
    [$phi.alt_(upright(n))$], [$omega_(upright(A)) + omega_(upright(B))$], [$- frac(B_0 m_(upright(n)), 2 A_0) cos \( rho - phi.alt_(upright(B)) - phi.alt_(upright(t a r)) \)$],
    [], [$omega_(upright(A)) - omega_(upright(B))$], [$frac(B_0 m_(upright(n)), 2 A_0) cos \( rho + phi.alt_(upright(B)) - phi.alt_(upright(t a r)) \)$],
    [], [$- omega_(upright(A)) + omega_(upright(B))$], [$frac(B_0 m_(upright(n)), 2 A_0) cos \( rho - phi.alt_(upright(B)) + phi.alt_(upright(t a r)) \)$],
  )]
  , caption: [General expression of the mutual noise coupling based on
  the signal form of
  $A_0 cos \( omega_(upright(A)) tau + phi.alt_(upright(t a r)) \) + B_n cos \( omega_(upright(B)) tau + phi.alt_(upright(B)) + phi.alt_(upright(n)) \)$
  where $B_n = B_0 \( 1 + b_n \)$, as shown in
  #ref(<eq:mutual_general>). $b_n$: relative
  amplitude noise; $phi.alt_(upright(n))$: phase noise. $m_(upright(n))$
  is the noise amplitude. Only the positive solution of the noise
  frequency bands is valid out of
  $omega_(upright(A)) - omega_(upright(B))$ and
  $- omega_(upright(A)) + omega_(upright(B))$. ]
  , kind: table
  )

] <tab:mutual>
The general results of the mutual noise coupling above are summarized in
#link(<tab:mutual>)[2]. Note that the self noise coupling in
#link(<tab:self>)[1] can be understood as the special case of the mutual
noise coupling where $omega_(upright(B)) = omega_(upright(A))$ and
$B_0 = A_0$, except for the treatment of the noise in the observation
band. \
\
#emph[Carrier-carrier beatnote to sideband-sideband beatnotes:] We can
focus on the following part of the PR signal in
#ref(<eq:spr>),
$ s_(upright(p r))^(upright(c 2 s b)) & = A_i A_j J_0^2 \( m_0 \) \( 1 - frac(m_0^2 a_i, 2 J_0 \( m_0 \)) \) cos \( omega_(upright(h e t)) tau + phi.alt_(upright(t a r))^(upright(c a r)) + p_i \)\
 & + A_i A_j J_1^2 \( m_0 \) cos \( \( omega_(upright(h e t)) + Delta omega_(upright(m)) \) tau + phi.alt_(upright(t a r))^(upright(u s b)) \)\
 & + A_i A_j J_1^2 \( m_0 \) cos \( \( omega_(upright(h e t)) - Delta omega_(upright(m)) \) tau - phi.alt_(upright(t a r))^(upright(l s b)) \) \, $<eq:sc2sb_prifo>
where only the laser phase noise $p_i$ and the modulation amplitude
noise $a_i$ in the carrier-carrier beatnote are considered, as the
modulation phase noise $theta_i$ does not appear in the carrier. In this
case, the carrier is interpreted as the offending noise term for the
sideband terms:
$omega_(upright(A)) = omega_(upright(h e t)) plus.minus Delta omega_(upright(m))$
and $omega_(upright(B)) = omega_(upright(h e t))$ in
#ref(<eq:mutual_general>). Therefore, the
relevant noise frequencies are

+ The carrier-carrier to the usb-usb:
  $omega_(upright(n)) = omega_(upright(A)) + omega_(upright(B)) = 2 omega_(upright(h e t)) + Delta omega_(upright(m))$
  and
  $omega_(upright(n)) = omega_(upright(A)) - omega_(upright(B)) = Delta omega_(upright(m))$,

+ The carrier-carrier to the lsb-lsb:
  $omega_(upright(n)) = omega_(upright(A)) + omega_(upright(B)) = 2 omega_(upright(h e t)) - Delta omega_(upright(m))$
  and
  $omega_(upright(n)) = - omega_(upright(A)) + omega_(upright(B)) = Delta omega_(upright(m))$.

Therefore, we have three frequencies to investigate. Regarding the noise
at $Delta omega_(upright(m))$, this suggests that it couples to both
sideband phases, which becomes important when we combine the phases as
shown in #ref(<eq:sbcombi>).

First, regarding the modulation amplitude noise $a_i$, comparing
#ref(<eq:sc2sb_prifo>) under $p_i = 0$ with
#ref(<eq:ampnoise_mutual_general>),
we can simply substitute quantities as follows:
$A_0 = A_i A_j J_1^2 \( m_0 \)$, $B_0 = A_i A_j J_0^2 \( m_0 \)$,
$m_(upright(n)) = - frac(m_0^2 m_(upright(a)), 2 J_0 \( m_0 \))$,
$phi.alt_(upright(t a r)) = phi.alt_(upright(t a r))^(upright(u s b)) upright(" or ") - phi.alt_(upright(t a r))^(upright(l s b))$,
and $phi.alt_(upright(B)) = phi.alt_(upright(t a r))^(upright(c a r))$.
Therefore, the general expression of the phase readout in
#ref(<eq:phi_read_mutual_ampnoise>)
becomes
$ phi.alt_(upright(r e a d))^(upright(u s b)) & = phi.alt_(upright(t a r))^(upright(u s b)) - frac(J_0 \( m_0 \) m_0^2, 4 J_1^2 \( m_0 \)) dot.op m_(upright(a)) sin \( rho - phi.alt_(upright(t a r))^(upright(s b)) \) #scale(x: 120%, y: 120%)[\|]_(Delta omega_(upright(m)))\
 & - frac(J_0 \( m_0 \) m_0^2, 4 J_1^2 \( m_0 \)) dot.op m_(upright(a)) sin \( rho - phi.alt_(upright(t a r))^(upright(u s b)) - phi.alt_(upright(t a r))^(upright(c a r)) \) #scale(x: 120%, y: 120%)[\|]_(2 omega_(upright(h e t)) + Delta omega_(upright(m)))\
phi.alt_(upright(r e a d))^(upright(l s b)) & = - phi.alt_(upright(t a r))^(upright(l s b)) + frac(J_0 \( m_0 \) m_0^2, 4 J_1^2 \( m_0 \)) dot.op m_(upright(a)) sin \( rho - phi.alt_(upright(t a r))^(upright(s b)) \) #scale(x: 120%, y: 120%)[\|]_(Delta omega_(upright(m)))\
 & - frac(J_0 \( m_0 \) m_0^2, 4 J_1^2 \( m_0 \)) dot.op m_(upright(a)) sin \( rho + phi.alt_(upright(t a r))^(upright(l s b)) - phi.alt_(upright(t a r))^(upright(c a r)) \) #scale(x: 120%, y: 120%)[\|]_(2 omega_(upright(h e t)) - Delta omega_(upright(m))) $<eq:ampnoise_mutual_sb>
The equations suggest that the modulation amplitude noise at
$Delta omega_(upright(m))$ coherently sums up in the combination in
#ref(<eq:sbcombi>), therefore, cannot be suppressed.
Also, other noises are in the different frequency bands; hence, they
will be incoherently summed in the combination.

Second, to focus on the laser phase noise $p_i$, we compare
#ref(<eq:sc2sb_prifo>) under $a_i = 0$ with
#ref(<eq:phasenoise_mutual_general>).
It suggests substituting quantities as follows:
$A_0 = A_i A_j J_1^2 \( m_0 \)$, $B_0 = A_i A_j J_0^2 \( m_0 \)$,
$m_(upright(n)) = m_(upright(p))$,
$phi.alt_(upright(t a r)) = phi.alt_(upright(t a r))^(upright(u s b)) upright(" or ") - phi.alt_(upright(t a r))^(upright(l s b))$,
and $phi.alt_(upright(B)) = phi.alt_(upright(t a r))^(upright(c a r))$.
The measured sideband phases result in
$ phi.alt_(upright(r e a d))^(upright(u s b)) & = phi.alt_(upright(t a r))^(upright(u s b)) + frac(J_0^2 \( m_0 \), 2 J_1^2 \( m_0 \)) dot.op m_(upright(p)) cos \( rho - phi.alt_(upright(t a r))^(upright(s b)) \) #scale(x: 120%, y: 120%)[\|]_(Delta omega_(upright(m)))\
 & - frac(J_0^2 \( m_0 \), 2 J_1^2 \( m_0 \)) dot.op m_(upright(p)) cos \( rho - phi.alt_(upright(t a r))^(upright(u s b)) - phi.alt_(upright(t a r))^(upright(c a r)) \) #scale(x: 120%, y: 120%)[\|]_(2 omega_(upright(h e t)) + Delta omega_(upright(m))) \,\
phi.alt_(upright(r e a d))^(upright(l s b)) & = - phi.alt_(upright(t a r))^(upright(l s b)) + frac(J_0^2 \( m_0 \), 2 J_1^2 \( m_0 \)) dot.op m_(upright(p)) cos \( rho - phi.alt_(upright(t a r))^(upright(s b)) \) #scale(x: 120%, y: 120%)[\|]_(Delta omega_(upright(m)))\
 & - frac(J_0^2 \( m_0 \), 2 J_1^2 \( m_0 \)) dot.op m_(upright(p)) cos \( rho + phi.alt_(upright(t a r))^(upright(l s b)) - phi.alt_(upright(t a r))^(upright(c a r)) \) #scale(x: 120%, y: 120%)[\|]_(2 omega_(upright(h e t)) - Delta omega_(upright(m))) . $<eq:phasenoise_mutual_sb>
The equations suggest that the laser phase noise at
$Delta omega_(upright(m))$ could be subtracted completely in the
sideband combination in #ref(<eq:sbcombi>). \
\
#emph[Sideband-sideband beatnotes to carrier-carrier beatnote:] If we
consider the sideband-sideband beatnotes as noise sources and the
carrier-carrier as the target beatnote, the PR signal in
#ref(<eq:spr>) becomes
$ s_(upright(p r))^(upright(s b 2 c)) & = A_i A_j J_0^2 \( m_0 \) cos \( omega_(upright(h e t)) tau + phi.alt_(upright(t a r))^(upright(c a r)) \)\
 & + A_i A_j J_1^2 \( m_0 \) \( 1 + a_i \) cos \( \( omega_(upright(h e t)) + Delta omega_(upright(m)) \) tau + phi.alt_(upright(t a r))^(upright(u s b)) + p_i + theta_i \)\
 & + A_i A_j J_1^2 \( m_0 \) \( 1 + a_i \) cos \( \( omega_(upright(h e t)) - Delta omega_(upright(m)) \) tau - phi.alt_(upright(t a r))^(upright(l s b)) + p_i - theta_i \) . $<eq:ssb2c_prifo>
In this coupling from the sidebands to the carrier,
$omega_(upright(A)) = omega_(upright(h e t))$ and
$omega_(upright(B)) = omega_(upright(h e t)) plus.minus Delta omega_(upright(m))$
in #ref(<eq:mutual_general>). Therefore, the
relevant noise frequencies are

+ The usb-usb to the carrier-carrier:
  $omega_(upright(n)) = omega_(upright(A)) + omega_(upright(B)) = 2 omega_(upright(h e t)) + Delta omega_(upright(m))$
  and
  $omega_(upright(n)) = - omega_(upright(A)) + omega_(upright(B)) = Delta omega_(upright(m))$,

+ The lsb-lsb to the carrier-carrier:
  $omega_(upright(n)) = omega_(upright(A)) + omega_(upright(B)) = 2 omega_(upright(h e t)) - Delta omega_(upright(m))$
  and
  $omega_(upright(n)) = omega_(upright(A)) - omega_(upright(B)) = Delta omega_(upright(m))$.

Therefore, we have three frequencies to investigate and, for
$Delta omega_(upright(m))$, we also need to take into account the
coherence between the usb-usb and lsb-lsb beatnotes.

First, regarding the modulation amplitude noise $a_i$, the comparison of
#ref(<eq:ssb2c_prifo>) under $p_i = theta_i = 0$
with
#ref(<eq:ampnoise_mutual_general>)
suggests that we can substitute quantities as follows:
$A_0 = A_i A_j J_0^2 \( m_0 \)$, $B_0 = A_i A_j J_1^2 \( m_0 \)$,
$m_(upright(n)) = m_(upright(a))$,
$phi.alt_(upright(t a r)) = phi.alt_(upright(t a r))^(upright(c a r))$,
$phi.alt_(upright(B)) = phi.alt_(upright(t a r))^(upright(u s b))$ or
$- phi.alt_(upright(t a r))^(upright(l s b))$. Therefore, the general
expression of the phase readout in
#ref(<eq:phi_read_mutual_ampnoise>)
gives

#block[
$ phi.alt_(upright(r e a d))^(upright(c a r)) & = phi.alt_(upright(t a r))^(upright(c a r)) - frac(J_1^2 \( m_0 \), 2 J_0^2 \( m_0 \)) dot.op m_(upright(a)) \( sin \( rho - phi.alt_(upright(t a r))^(upright(s b)) \) #scale(x: 120%, y: 120%)[\|]_(Delta omega_(upright(m))) - sin \( rho - phi.alt_(upright(t a r))^(upright(u s b)) - phi.alt_(upright(t a r))^(upright(c a r)) \) #scale(x: 120%, y: 120%)[\|]_(2 omega_(upright(h e t)) + Delta omega_(upright(m))) \)\
 & + frac(J_1^2 \( m_0 \), 2 J_0^2 \( m_0 \)) dot.op m_(upright(a)) \( sin \( rho - phi.alt_(upright(t a r))^(upright(s b)) \) #scale(x: 120%, y: 120%)[\|]_(Delta omega_(upright(m))) + sin \( rho + phi.alt_(upright(t a r))^(upright(l s b)) - phi.alt_(upright(t a r))^(upright(c a r)) \) #scale(x: 120%, y: 120%)[\|]_(2 omega_(upright(h e t)) - Delta omega_(upright(m))) \)\
 & = phi.alt_(upright(t a r))^(upright(c a r)) + frac(J_1^2 \( m_0 \), 2 J_0^2 \( m_0 \)) dot.op m_(upright(a)) sin \( rho - phi.alt_(upright(t a r))^(upright(u s b)) - phi.alt_(upright(t a r))^(upright(c a r)) \) #scale(x: 120%, y: 120%)[\|]_(2 omega_(upright(h e t)) + Delta omega_(upright(m))) + frac(J_1^2 \( m_0 \), 2 J_0^2 \( m_0 \)) dot.op m_(upright(a)) sin \( rho + phi.alt_(upright(t a r))^(upright(l s b)) - phi.alt_(upright(t a r))^(upright(c a r)) \) #scale(x: 120%, y: 120%)[\|]_(2 omega_(upright(h e t)) - Delta omega_(upright(m))) \, $<eq:ampnoise_mutual_sb2c>
In the first line, the first and second parentheses are the noise
coupling from the usb-usb and lsb-lsb beatnotes, respectively. The
modulation amplitude noise at $Delta omega_(upright(m))$ completely
cancel between the usb-usb and lsb-lsb beatnotes in the second line.

Second, regarding the laser phase noise $p_i$, the comparison of
#ref(<eq:ssb2c_prifo>) under $a_i = theta_i = 0$
with
#ref(<eq:phasenoise_mutual_general>)
suggests substituting quantities as follows:
$A_0 = A_i A_j J_0^2 \( m_0 \)$, $B_0 = A_i A_j J_1^2 \( m_0 \)$,
$m_(upright(n)) = m_(upright(p))$,
$phi.alt_(upright(t a r)) = phi.alt_(upright(t a r))^(upright(c a r))$,
and $phi.alt_(upright(B)) = phi.alt_(upright(t a r))^(upright(u s b))$
or $- phi.alt_(upright(t a r))^(upright(l s b))$. Applying
#ref(<eq:phi_read_mutual_phasenoise>),
the measured carrier-carrier beatnote phase is given by
$ phi.alt_(upright(r e a d))^(upright(c a r)) & = phi.alt_(upright(t a r))^(upright(c a r)) + frac(J_1^2 \( m_0 \), 2 J_0^2 \( m_0 \)) dot.op m_(upright(p)) \( cos \( rho - phi.alt_(upright(t a r))^(upright(s b)) \) #scale(x: 120%, y: 120%)[\|]_(Delta omega_(upright(m))) - cos \( rho - phi.alt_(upright(t a r))^(upright(u s b)) - phi.alt_(upright(t a r))^(upright(c a r)) \) #scale(x: 120%, y: 120%)[\|]_(2 omega_(upright(h e t)) + Delta omega_(upright(m))) \)\
 & + frac(J_1^2 \( m_0 \), 2 J_0^2 \( m_0 \)) dot.op m_(upright(p)) \( cos \( rho - phi.alt_(upright(t a r))^(upright(s b)) \) #scale(x: 120%, y: 120%)[\|]_(Delta omega_(upright(m))) - cos \( rho + phi.alt_(upright(t a r))^(upright(l s b)) - phi.alt_(upright(t a r))^(upright(c a r)) \) #scale(x: 120%, y: 120%)[\|]_(2 omega_(upright(h e t)) - Delta omega_(upright(m))) \)\
 & = phi.alt_(upright(t a r))^(upright(c a r)) + frac(J_1^2 \( m_0 \), J_0^2 \( m_0 \)) dot.op m_(upright(p)) cos \( rho - phi.alt_(upright(t a r))^(upright(s b)) \) #scale(x: 120%, y: 120%)[\|]_(Delta omega_(upright(m)))\
 & - frac(J_1^2 \( m_0 \), 2 J_0^2 \( m_0 \)) dot.op m_(upright(p)) cos \( rho - phi.alt_(upright(t a r))^(upright(u s b)) - phi.alt_(upright(t a r))^(upright(c a r)) \) #scale(x: 120%, y: 120%)[\|]_(2 omega_(upright(h e t)) + Delta omega_(upright(m))) - frac(J_1^2 \( m_0 \), 2 J_0^2 \( m_0 \)) dot.op m_(upright(p)) cos \( rho + phi.alt_(upright(t a r))^(upright(l s b)) - phi.alt_(upright(t a r))^(upright(c a r)) \) #scale(x: 120%, y: 120%)[\|]_(2 omega_(upright(h e t)) - Delta omega_(upright(m))) \, $<eq:phasenoise_mutual_sb2c>
In the first line, the first and second parentheses are the noise
couplings from the usb-usb and lsb-lsb beatnotes, respectively. The
noise from $Delta omega_(upright(m))$ coherently sums up between the
usb-usb and lsb-lsb beatnotes.

Last but not least, regarding the modulation phase noise $theta_i$, we
can apply the almost same discussion as the laser phase noise in
#ref(<eq:phasenoise_mutual_sb2c>), but
with the opposite sign for the noise couplings from the lsb-lsb
beatnote. Therefore, we get the measured carrier-carrier beatnote phase
as,
$ phi.alt_(upright(r e a d))^(upright(c a r)) & = phi.alt_(upright(t a r))^(upright(c a r)) + frac(J_1^2 \( m_0 \), 2 J_0^2 \( m_0 \)) dot.op m_(upright(theta)) \( cos \( rho - phi.alt_(upright(t a r))^(upright(s b)) \) #scale(x: 120%, y: 120%)[\|]_(Delta omega_(upright(m))) - cos \( rho - phi.alt_(upright(t a r))^(upright(u s b)) - phi.alt_(upright(t a r))^(upright(c a r)) \) #scale(x: 120%, y: 120%)[\|]_(2 omega_(upright(h e t)) + Delta omega_(upright(m))) \)\
 & - frac(J_1^2 \( m_0 \), 2 J_0^2 \( m_0 \)) dot.op m_(upright(theta)) \( cos \( rho - phi.alt_(upright(t a r))^(upright(s b)) \) #scale(x: 120%, y: 120%)[\|]_(Delta omega_(upright(m))) - cos \( rho + phi.alt_(upright(t a r))^(upright(l s b)) - phi.alt_(upright(t a r))^(upright(c a r)) \) #scale(x: 120%, y: 120%)[\|]_(2 omega_(upright(h e t)) - Delta omega_(upright(m))) \)\
 & = phi.alt_(upright(t a r))^(upright(c a r)) - frac(J_1^2 \( m_0 \), 2 J_0^2 \( m_0 \)) dot.op m_(upright(theta)) cos \( rho - phi.alt_(upright(t a r))^(upright(u s b)) - phi.alt_(upright(t a r))^(upright(c a r)) \) #scale(x: 120%, y: 120%)[\|]_(2 omega_(upright(h e t)) + Delta omega_(upright(m))) + frac(J_1^2 \( m_0 \), 2 J_0^2 \( m_0 \)) dot.op m_(upright(theta)) cos \( rho + phi.alt_(upright(t a r))^(upright(l s b)) - phi.alt_(upright(t a r))^(upright(c a r)) \) #scale(x: 120%, y: 120%)[\|]_(2 omega_(upright(h e t)) - Delta omega_(upright(m))) \, $<eq:thetanoise_mutual_sb2c>

]
where the noise at $Delta omega_(upright(m))$ cancels between the
usb-usb and lsb-lsb beatnotes. \
\
#emph[Sideband-sideband beatnote to sideband-sideband beatnote:]
Finally, discussed is the coupling of the noise in one sideband-sideband
beatnote to phase extraction of the other sideband-sideband beatnote.
Therefore, we can focus on the following part of the PR signal in
#ref(<eq:spr>),
$ s_(upright(p r))^(upright(s b 2 s b)) & = A_i A_j J_1^2 \( m_0 \) \( 1 + a_i \) cos \( \( omega_(upright(h e t)) + Delta omega_(upright(m)) \) tau + phi.alt_(upright(t a r))^(upright(u s b)) + p_i + theta_i \)\
 & + A_i A_j J_1^2 \( m_0 \) \( 1 + a_i \) cos \( \( omega_(upright(h e t)) - Delta omega_(upright(m)) \) tau - phi.alt_(upright(t a r))^(upright(l s b)) + p_i - theta_i \) . $<eq:ssb2sb_prifo>
In this type of noise coupling,
$omega_(upright(A)) = omega_(upright(h e t)) plus.minus Delta omega_(upright(m))$
and
$omega_(upright(B)) = omega_(upright(h e t)) minus.plus Delta omega_(upright(m))$
in #ref(<eq:mutual_general>). The relevant
noise frequencies are

+ The usb-usb to the lsb-lsb:
  $omega_(upright(n)) = - omega_(upright(A)) + omega_(upright(B)) = 2 Delta omega_(upright(m))$
  and
  $omega_(upright(n)) = omega_(upright(A)) + omega_(upright(B)) = 2 omega_(upright(h e t))$,

+ The lsb-lsb to the usb-usb:
  $omega_(upright(n)) = omega_(upright(A)) - omega_(upright(B)) = 2 Delta omega_(upright(m))$
  and
  $omega_(upright(n)) = omega_(upright(A)) + omega_(upright(B)) = 2 omega_(upright(h e t))$.

Therefore, we have two frequencies to investigate, both of which need to
be carefully analyzed in terms of the coherence between the usb-usb and
lsb-lsb beatnotes. In addition, note that the noise at
$2 omega_(upright(h e t))$ also exists in the self noise coupling of the
carrier-carrier beatnote, see discussions around
#ref(<eq:phi_read_2f_car>), which becomes
important if we combine the sideband phases with the carrier.

First, with respect to the modulation amplitude noise $a_i$, we compare
#ref(<eq:ssb2sb_prifo>) under $p_i = 0$ and
$theta_i = 0$ with
#ref(<eq:ampnoise_mutual_general>).
It suggests that we can substitute quantities as follows:
$A_0 = A_i A_j J_1^2 \( m_0 \)$, $B_0 = A_i A_j J_1^2 \( m_0 \)$,
$m_(upright(n)) = m_(upright(a))$,
$phi.alt_(upright(t a r)) = phi.alt_(upright(t a r))^(upright(u s b)) upright(" or ") - phi.alt_(upright(t a r))^(upright(l s b))$,
and
$phi.alt_(upright(B)) = - phi.alt_(upright(t a r))^(upright(l s b)) upright(" or ") phi.alt_(upright(t a r))^(upright(u s b))$.
Therefore, the general expression of the phase readout in
#ref(<eq:phi_read_mutual_ampnoise>)
gives
$ phi.alt_(upright(r e a d))^(upright(u s b)) & = phi.alt_(upright(t a r))^(upright(u s b)) + 1 / 2 dot.op m_(upright(a)) sin \( rho - 2 phi.alt_(upright(t a r))^(upright(s b)) \) #scale(x: 120%, y: 120%)[\|]_(2 Delta omega_(upright(m)))\
 & + 1 / 2 dot.op m_(upright(a)) sin \( rho - 2 phi.alt_(upright(t a r))^(upright(c a r)) \) #scale(x: 120%, y: 120%)[\|]_(2 omega_(upright(h e t))) \,\
phi.alt_(upright(r e a d))^(upright(l s b)) & = - phi.alt_(upright(t a r))^(upright(l s b)) - 1 / 2 dot.op m_(upright(a)) sin \( rho - 2 phi.alt_(upright(t a r))^(upright(s b)) \) #scale(x: 120%, y: 120%)[\|]_(2 Delta omega_(upright(m)))\
 & + 1 / 2 dot.op m_(upright(a)) sin \( rho - 2 phi.alt_(upright(t a r))^(upright(c a r)) \) #scale(x: 120%, y: 120%)[\|]_(2 omega_(upright(h e t))) \, $<eq:ampnoise_mutual_sb2sb>
Once we combine the two phases as #ref(<eq:sbcombi>),
the noise at $2 omega_(upright(h e t))$ cancels, while the noise at
$2 Delta omega_(upright(m))$ coherently sums up.

Second, we analyze the laser phase noise $p_i$ by comparing
#ref(<eq:ssb2sb_prifo>) under $a_i = 0$ and
$theta_i = 0$ with
#ref(<eq:phasenoise_mutual_general>).
We can substitute quantities as follows:
$A_0 = A_i A_j J_1^2 \( m_0 \)$, $B_0 = A_i A_j J_1^2 \( m_0 \)$,
$m_(upright(n)) = m_(upright(p))$,
$phi.alt_(upright(t a r)) = phi.alt_(upright(t a r))^(upright(u s b)) upright(" or ") - phi.alt_(upright(t a r))^(upright(l s b))$,
and
$phi.alt_(upright(B)) = - phi.alt_(upright(t a r))^(upright(l s b)) upright(" or ") phi.alt_(upright(t a r))^(upright(u s b))$,
which result in
$ phi.alt_(upright(r e a d))^(upright(u s b)) & = phi.alt_(upright(t a r)) + 1 / 2 dot.op m_(upright(p)) cos \( rho - 2 phi.alt_(upright(t a r))^(upright(s b)) \) #scale(x: 120%, y: 120%)[\|]_(2 Delta omega_(upright(m)))\
 & - 1 / 2 dot.op m_(upright(p)) cos \( rho - 2 phi.alt_(upright(t a r))^(upright(c a r)) \) #scale(x: 120%, y: 120%)[\|]_(2 omega_(upright(h e t))) \,\
phi.alt_(upright(r e a d))^(upright(l s b)) & = - phi.alt_(upright(t a r)) + 1 / 2 dot.op m_(upright(p)) cos \( rho - 2 phi.alt_(upright(t a r))^(upright(s b)) \) #scale(x: 120%, y: 120%)[\|]_(2 Delta omega_(upright(m)))\
 & - 1 / 2 dot.op m_(upright(p)) cos \( rho - 2 phi.alt_(upright(t a r))^(upright(c a r)) \) #scale(x: 120%, y: 120%)[\|]_(2 omega_(upright(h e t))) . $<eq:phasenoise_mutual_sb2sb>
This suggests that the combination in
#ref(<eq:sbcombi>) is insensitive to laser phase noise
at those frequencies.

Last but not least, as for the modulation phase noise $theta_i$, we can
apply the almost same discussion as the laser phase noise above, but
with the sign flip for the coupling of the noises from the lsb-lsb
beatnote to the usb-usb beatnote. Therefore, we get the measured
sideband-sideband beatnote phases as,
$ phi.alt_(upright(r e a d))^(upright(u s b)) & = phi.alt_(upright(t a r)) - 1 / 2 dot.op m_(upright(theta)) cos \( rho - 2 phi.alt_(upright(t a r))^(upright(s b)) \) #scale(x: 120%, y: 120%)[\|]_(2 Delta omega_(upright(m)))\
 & + 1 / 2 dot.op m_(upright(theta)) cos \( rho - 2 phi.alt_(upright(t a r))^(upright(c a r)) \) #scale(x: 120%, y: 120%)[\|]_(2 omega_(upright(h e t))) \,\
phi.alt_(upright(r e a d))^(upright(l s b)) & = - phi.alt_(upright(t a r)) + 1 / 2 dot.op m_(upright(theta)) cos \( rho - 2 phi.alt_(upright(t a r))^(upright(s b)) \) #scale(x: 120%, y: 120%)[\|]_(2 Delta omega_(upright(m)))\
 & - 1 / 2 dot.op m_(upright(theta)) cos \( rho - 2 phi.alt_(upright(t a r))^(upright(c a r)) \) #scale(x: 120%, y: 120%)[\|]_(2 omega_(upright(h e t))) . $<eq:thetanoise_mutual_sb2sb>
Therefore, the noises at the same frequencies coherently sum up in the
combination in #ref(<eq:sbcombi>)\; hence, they cannot
be suppressed.

The results of the mutual noise coupling in this section are summarized
in #ref(<tab:noise_couplings>) as its
non-diagonal elements.

#block[
#figure(
  align(center)[#table(
    columns: 4,
    align: (center,center,center,center,),
    table.header([], [car-car phase:
      $phi.alt_(upright(r e a d))^(upright(c a r))$], [usb-usb phase:
      $phi.alt_(upright(r e a d))^(upright(u s b))$], [lsb-lsb phase:
      $phi.alt_(upright(r e a d))^(upright(l s b))$],),
    table.hline(),
    [*car-car*], [$p_i \( epsilon.alt \)$
    $\[ cos rho \]$], [$""^(∨ 1) p_i \( Delta omega_(upright(m)) \)$
    $\[ frac(J_0^2 \( m_0 \), 2 J_1^2 \( m_0 \)) cos \( rho - phi.alt_(upright(t a r))^(upright(s b)) \) \]$], [$""^(∨ 1) p_i \( Delta omega_(upright(m)) \)$
    $\[ frac(J_0^2 \( m_0 \), 2 J_1^2 \( m_0 \)) cos \( rho - phi.alt_(upright(t a r))^(upright(s b)) \) \]$],
    [], [$p_i \( 2 omega_(upright(h e t)) \)$
    $\[ - 1 / 2 cos \( rho - 2 phi.alt_(upright(t a r))^(upright(c a r)) \) \]$], [$p_i \( 2 omega_(upright(h e t)) + Delta omega_(upright(m)) \)$
    $\[ - frac(J_0^2 \( m_0 \), 2 J_1^2 \( m_0 \)) cos \( rho - tilde(phi.alt)_(upright(t a r))^(upright(u s b)) \) \]$], [$p_i \( 2 omega_(upright(h e t)) - Delta omega_(upright(m)) \)$
    $\[ - frac(J_0^2 \( m_0 \), 2 J_1^2 \( m_0 \)) cos \( rho + tilde(phi.alt)_(upright(t a r))^(upright(l s b)) \) \]$],
    [], [$a_i \( 2 omega_(upright(h e t)) \)$
    $\[ - frac(m_0^2, 4 J_0 \( m_0 \)) sin \( rho - 2 phi.alt_(upright(t a r))^(upright(c a r)) \) \]$], [$""^(∧ 1) a_i \( Delta omega_(upright(m)) \)$
    $\[ - frac(J_0 \( m_0 \) m_0^2, 4 J_1^2 \( m_0 \)) sin \( rho - phi.alt_(upright(t a r))^(upright(s b)) \) \]$], [$""^(∧ 1) a_i \( Delta omega_(upright(m)) \)$
    $\[ frac(J_0 \( m_0 \) m_0^2, 4 J_1^2 \( m_0 \)) sin \( rho - phi.alt_(upright(t a r))^(upright(s b)) \) \]$],
    [], [], [$a_i \( 2 omega_(upright(h e t)) + Delta omega_(upright(m)) \)$
    $\[ - frac(J_0 \( m_0 \) m_0^2, 4 J_1^2 \( m_0 \)) sin \( rho - tilde(phi.alt)_(upright(t a r))^(upright(u s b)) \) \]$], [$a_i \( 2 omega_(upright(h e t)) - Delta omega_(upright(m)) \)$
    $\[ - frac(J_0 \( m_0 \) m_0^2, 4 J_1^2 \( m_0 \)) sin \( rho + tilde(phi.alt)_(upright(t a r))^(upright(l s b)) \) \]$],
    [*usb-usb*], [$""^(∧ 2) p_i \( Delta omega_(upright(m)) \)$
    $\[ frac(J_1^2 \( m_0 \), 2 J_0^2 \( m_0 \)) cos \( rho - phi.alt_(upright(t a r))^(upright(s b)) \) \]$], [$""^(∨ 2) p_i \( epsilon.alt \)$
    $\[ cos rho \]$], [$""^(∨ 3) p_i \( 2 Delta omega_(upright(m)) \)$
    $\[ 1 / 2 cos \( rho - 2 phi.alt_(upright(t a r))^(upright(s b)) \) \]$],
    [], [$p_i \( 2 omega_(upright(h e t)) + Delta omega_(upright(m)) \)$
    $\[ - frac(J_1^2 \( m_0 \), 2 J_0^2 \( m_0 \)) cos \( rho - tilde(phi.alt)_(upright(t a r))^(upright(u s b)) \) \]$], [$p_i \( 2 \( omega_(upright(h e t)) + Delta omega_(upright(m)) \) \)$
    $\[ - 1 / 2 cos \( rho - 2 phi.alt_(upright(t a r))^(upright(u s b)) \) \]$], [$""^(∨ 4) p_i \( 2 omega_(upright(h e t)) \)$
    $\[ - 1 / 2 cos \( rho - 2 phi.alt_(upright(t a r))^(upright(c a r)) \) \]$],
    [], [$""^(∨ 5) a_i \( Delta omega_(upright(m)) \)$
    $\[ - frac(J_1^2 \( m_0 \), 2 J_0^2 \( m_0 \)) sin \( rho - phi.alt_(upright(t a r))^(upright(s b)) \) \]$], [$a_i \( 2 \( omega_(upright(h e t)) + Delta omega_(upright(m)) \) \)$
    $\[ 1 / 2 sin \( rho - 2 phi.alt_(upright(t a r))^(upright(u s b)) \) \]$], [$""^(∧ 3) a_i \( 2 Delta omega_(upright(m)) \)$
    $\[ - 1 / 2 sin \( rho - 2 phi.alt_(upright(t a r))^(upright(s b)) \) \]$],
    [], [$a_i \( 2 omega_(upright(h e t)) + Delta omega_(upright(m)) \)$
    $\[ frac(J_1^2 \( m_0 \), 2 J_0^2 \( m_0 \)) sin \( rho - tilde(phi.alt)_(upright(t a r))^(upright(u s b)) \) \]$], [$""^(∧ 4) theta_i \( epsilon.alt \)$
    $\[ cos rho \]$], [$""^(∨ 6) a_i \( 2 omega_(upright(h e t)) \)$
    $\[ 1 / 2 sin \( rho - 2 phi.alt_(upright(t a r))^(upright(c a r)) \) \]$],
    [], [$""^(∨ 7) theta_i \( Delta omega_(upright(m)) \)$
    $\[ frac(J_1^2 \( m_0 \), 2 J_0^2 \( m_0 \)) cos \( rho - phi.alt_(upright(t a r))^(upright(s b)) \) \]$], [$theta_i \( 2 \( omega_(upright(h e t)) + Delta omega_(upright(m)) \) \)$
    $\[ - 1 / 2 cos \( rho - 2 phi.alt_(upright(t a r))^(upright(u s b)) \) \]$], [$""^(∧ 5) theta_i \( 2 Delta omega_(upright(m)) \)$
    $\[ 1 / 2 cos \( rho - 2 phi.alt_(upright(t a r))^(upright(s b)) \) \]$],
    [], [$theta_i \( 2 omega_(upright(h e t)) + Delta omega_(upright(m)) \)$
    $\[ - frac(J_1^2 \( m_0 \), 2 J_0^2 \( m_0 \)) cos \( rho - tilde(phi.alt)_(upright(t a r))^(upright(u s b)) \) \]$], [], [$""^(∧ 6) theta_i \( 2 omega_(upright(h e t)) \)$
    $\[ - 1 / 2 cos \( rho - 2 phi.alt_(upright(t a r))^(upright(c a r)) \) \]$],
    [*lsb-lsb*], [$""^(∧ 2) p_i \( Delta omega_(upright(m)) \)$
    $\[ frac(J_1^2 \( m_0 \), 2 J_0^2 \( m_0 \)) cos \( rho - phi.alt_(upright(t a r))^(upright(s b)) \) \]$], [$""^(∨ 3) p_i \( 2 Delta omega_(upright(m)) \)$
    $\[ 1 / 2 cos \( rho - 2 phi.alt_(upright(t a r))^(upright(s b)) \) \]$], [$""^(∨ 2) p_i \( epsilon.alt \)$
    $\[ cos rho \]$],
    [], [$p_i \( 2 omega_(upright(h e t)) - Delta omega_(upright(m)) \)$
    $\[ - frac(J_1^2 \( m_0 \), 2 J_0^2 \( m_0 \)) cos \( rho + tilde(phi.alt)_(upright(t a r))^(upright(l s b)) \) \]$], [$""^(∨ 4) p_i \( 2 omega_(upright(h e t)) \)$
    $\[ - 1 / 2 cos \( rho - 2 phi.alt_(upright(t a r))^(upright(c a r)) \) \]$], [$p_i \( 2 \( omega_(upright(h e t)) - Delta omega_(upright(m)) \) \)$
    $\[ - 1 / 2 cos \( rho + 2 phi.alt_(upright(t a r))^(upright(l s b)) \) \]$],
    [], [$""^(∨ 5) a_i \( Delta omega_(upright(m)) \)$
    $\[ frac(J_1^2 \( m_0 \), 2 J_0^2 \( m_0 \)) sin \( rho - phi.alt_(upright(t a r))^(upright(s b)) \) \]$], [$""^(∧ 3) a_i \( 2 Delta omega_(upright(m)) \)$
    $\[ 1 / 2 sin \( rho - 2 phi.alt_(upright(t a r))^(upright(s b)) \) \]$], [$a_i \( 2 \( omega_(upright(h e t)) - Delta omega_(upright(m)) \) \)$
    $\[ 1 / 2 sin \( rho + 2 phi.alt_(upright(t a r))^(upright(l s b)) \) \]$],
    [], [$a_i \( 2 omega_(upright(h e t)) - Delta omega_(upright(m)) \)$
    $\[ frac(J_1^2 \( m_0 \), 2 J_0^2 \( m_0 \)) sin \( rho + tilde(phi.alt)_(upright(t a r))^(upright(l s b)) \) \]$], [$""^(∨ 6) a_i \( 2 omega_(upright(h e t)) \)$
    $\[ 1 / 2 sin \( rho - 2 phi.alt_(upright(t a r))^(upright(c a r)) \) \]$], [$""^(∧ 4) theta_i \( epsilon.alt \)$
    $\[ - cos rho \]$],
    [], [$""^(∨ 7) theta_i \( Delta omega_(upright(m)) \)$
    $\[ - frac(J_1^2 \( m_0 \), 2 J_0^2 \( m_0 \)) cos \( rho - phi.alt_(upright(t a r))^(upright(s b)) \) \]$], [$""^(∧ 5) theta_i \( 2 Delta omega_(upright(m)) \)$
    $\[ - 1 / 2 cos \( rho - 2 phi.alt_(upright(t a r))^(upright(s b)) \) \]$], [$theta_i \( 2 \( omega_(upright(h e t)) - Delta omega_(upright(m)) \) \)$
    $\[ 1 / 2 cos \( rho + 2 phi.alt_(upright(t a r))^(upright(l s b)) \) \]$],
    [], [$theta_i \( 2 omega_(upright(h e t)) - Delta omega_(upright(m)) \)$
    $\[ frac(J_1^2 \( m_0 \), 2 J_0^2 \( m_0 \)) cos \( rho + tilde(phi.alt)_(upright(t a r))^(upright(l s b)) \) \]$], [$""^(∧ 6) theta_i \( 2 omega_(upright(h e t)) \)$
    $\[ 1 / 2 cos \( rho - 2 phi.alt_(upright(t a r))^(upright(c a r)) \) \]$], [],
  )]
  , kind: table, caption: [Heterodyne-band noise couplings in the time domain. Rows indicate secondary beatnotes and columns identify the phase readout. Each entry gives the noise type, angular frequency and coupling factor in brackets. Matching $∨$ indices identify cancelling contributions. Matching $∧$ indices identify adding contributions. Conversion to amplitude spectral density introduces a factor of $sqrt(2)$.]
  ) <tab:noise_couplings>

]
= Modulation-band noises
<sec:mod_band>
Here we analyze the noise coupling from frequencies around integer
multiples of the modulation angular frequency $omega_(upright(m) \, i)$
$\( = 2 pi f_(upright(m) \, i) \)$ to phase extraction by a phasemeter.
Two types of analysis will be performed: #emph[trigonometric analysis]
and #emph[sideband analysis]. The trigonometric analysis in
#link(<sub:mod_band_trig>)[4.1] focuses on the phase part of a single
laser beam, even neglecting the fact that it is the phase of an
electromagnetic field. This approach is straightforward and can find
most of major noise couplings. On the other hand, the sideband analysis
in #link(<sub:mod_band_sideband>)[4.2] expands a single laser beam by
noise sidebands to capture noise coupling mechanisms, which the
trigonometric analysis cannot find, especially the mixing between the
modulation sidebands and the noise sidebands.

== Trigonometric analysis
<sub:mod_band_trig>
Let us extract only the laser phase noise $p_i$ and the phase modulation
signal in #ref(<eq:Ei_phim>) as
$ phi.alt_(m \, i) = p_i + m_i cos \( omega_(upright(m) \, i) tau + phi.alt_(upright(t a r) \, i)^(upright(s b)) + theta_i \) . $<eq:phi_m>
As noted at the end of #link(<sub:framework_beam>)[2.2], $p_i$ can
implicitly include the modulation voltage noise $n_i$. We will show that
noise in the modulation-frequency regime can be virtually downconverted
with an amplitude scaling factor and reinterpreted as noise in the
heterodyne-band regime, which then couples as illustrated in
#link(<fig:het-band-noises-illustration>)[2]. This enables us to derive
the total coupling factor as a product of the amplitude scaling factor
arising from the frequency downconversion and the coupling factor of the
heterodyne-band noise listed in
#ref(<tab:noise_couplings>). Following the
monotonic noise representation in #ref(<eq:x_i>), we
consider a given noise $x_i$ at the angular frequency of
$omega_(upright(n)) = n omega_(upright(m) \, i) + Delta omega_x$
($n in bb(N)$) where $Delta omega_x$ is a given offset frequency from
the integer multiple of the modulation frequency. By individually
substituting $p_i$, $a_i$, and $theta_i$ into $x_i$ in the monotonic
noise representation, we discuss the different noise sources below. \
\
#emph[Noise frequency conversion:] First, let us focus on $p_i$ under
$a_i = theta_i = 0$ in #ref(<eq:phi_m>). By the harmonic
addition theorem, #ref(<eq:phi_m>) under this condition
becomes
$ phi.alt_(m \, i) & = m_(upright(p)) cos \( \( n omega_(upright(m) \, i) + Delta omega_(upright(p)) \) tau + rho \) + m_0 cos \( omega_(upright(m) \, i) tau + phi.alt_(upright(t a r) \, i)^(upright(s b)) \)\
 & = m'_i cos \( omega_(upright(m) \, i) tau + phi.alt'_i \) \, $<eq:phi_m_mp>
where the new modulation index $m'_i$ and phase $phi.alt'_i$ are given
by
$ m'_i & approx m_0 sqrt(1 + 2 m_(upright(p)) / m_0 cos \( \( n omega_(upright(m) \, i) Delta omega_(upright(p)) \) tau + rho - phi.alt_(upright(t a r) \, i)^(upright(s b)) \))\
 & approx m_0 \( 1 + m_(upright(p)) / m_0 cos \( \( n omega_(upright(m) \, i) + Delta omega_(upright(p)) \) tau + rho - phi.alt_(upright(t a r) \, i)^(upright(s b)) \) \) \,\
tan phi.alt'_i & = frac(m_0 sin phi.alt_(upright(t a r) \, i)^(upright(s b)) + m_(upright(p)) sin \( \( n omega_(upright(m) \, i) + Delta omega_(upright(p)) \) tau + rho \), m_0 cos phi.alt_(upright(t a r) \, i)^(upright(s b)) + m_(upright(p)) cos \( \( n omega_(upright(m) \, i) + Delta omega_(upright(p)) \) tau + rho \))\
arrow.r.double phi.alt'_i & approx phi.alt_(upright(t a r) \, i)^(upright(s b)) + m_(upright(p)) / m_0 sin \( \( n omega_(upright(m) \, i) + Delta omega_(upright(p)) \) tau + rho - phi.alt_(upright(t a r) \, i)^(upright(s b)) \) . $<eq:mi_mp>
Only the linear term of $m_(upright(p))$ is considered, such as
$m_(upright(p)) lt.double 1$ and $m_(upright(p)) \/ m_0 lt.double 1$.
#ref(label("eq:mi_mp")) suggest
that the laser noise at
$n omega_(upright(m) \, i) + Delta omega_(upright(p))$ is virtually
downconverted by $omega_(upright(m) \, i)$ to the modulation amplitude
and phase noise at
$\( n - 1 \) omega_(upright(m) \, i) + Delta omega_(upright(p))$ with an
amplitude scaling factor of $1 \/ m_0$. The physical interpretation of
this result is as follows: the sinusoidal tone at
$n omega_(upright(m) \, i) + Delta omega_(upright(p))$ looks as a single
sideband at
$\( n - 1 \) omega_(upright(m) \, i) + Delta omega_(upright(p))$ from
the perspective of another tone at $omega_(upright(m) \, i)$ (=
modulation signal in this case). As discussed in #link(<app:ssb>)[10],
the single sideband is understood as a combination of the coherent
amplitude and phase modulation with the relative phase shift of
$pi \/ 2$, which is consistent with
#ref(label("eq:mi_mp")).

Second, regarding the modulation amplitude noise $a_i$,
#ref(<eq:phi_m>) under $p_i = theta_i = 0$ becomes

#block[
$ phi.alt_(m \, i) & = m_0 \( 1 + m_(upright(a)) cos \( \( n omega_(upright(m) \, i) + Delta omega_(upright(a)) \) tau + rho \) \) cos \( omega_(upright(m) \, i) tau + phi.alt_(upright(t a r) \, i)^(upright(s b)) \)\
 & = m_0 cos \( omega_(upright(m) \, i) tau + phi.alt_(upright(t a r) \, i)^(upright(s b)) \) + frac(m_0 m_(upright(a)), 2) \( cos \( \( \( n - 1 \) omega_(upright(m) \, i) + Delta omega_(upright(a)) \) tau + rho - phi.alt_(upright(t a r) \, i)^(upright(s b)) \) + cos \( \( \( n + 1 \) omega_(upright(m) \, i) + Delta omega_(upright(a)) \) tau + rho + phi.alt_(upright(t a r) \, i)^(upright(s b)) \) \) . $<eq:phii_ma>
Hence, the modulation amplitude noise $a_i$ at
$n omega_(upright(m) \, i) + Delta omega_(upright(a))$ turns into the
laser phase noise at
$\( n - 1 \) omega_(upright(m) \, i) + Delta omega_(upright(a))$
(down-conversion) and
$\( n + 1 \) omega_(upright(m) \, i) + Delta omega_(upright(a))$
(up-conversion) with an amplitude scaling factor of $m_0 \/ 2$.

Third, regarding the modulation phase noise $theta_i$,
#ref(<eq:phi_m>) under $p_i = a_i = 0$ becomes
$ phi.alt_(m \, i) & = m_0 cos \( omega_(upright(m) \, i) tau + phi.alt_(upright(t a r) \, i)^(upright(s b)) + m_(upright(theta)) cos \( \( n omega_(upright(m) \, i) + Delta omega_(upright(theta)) \) tau + rho \) \)\
 & approx m_0 cos \( omega_(upright(m) \, i) tau + phi.alt_(upright(t a r) \, i)^(upright(s b)) \) + frac(m_0 m_(upright(theta)), 2) \( sin \( \( \( n - 1 \) omega_(upright(m) \, i) + Delta omega_(upright(theta)) \) tau + rho - phi.alt_(upright(t a r) \, i)^(upright(s b)) \) - sin \( \( \( n + 1 \) omega_(upright(m) \, i) + Delta omega_(upright(theta)) \) tau + phi.alt_(upright(t a r) \, i)^(upright(s b)) + rho \) \) $<eq:phii_mtheta>
where we consider only the first-order Jacobi Anger and Taylor expansion
in terms of $m_(upright(theta))$. Hence, the modulation phase noise
$theta_i$ at $n omega_(upright(m) \, i) + Delta omega_(upright(theta))$
turns into the laser phase noise at
$\( n - 1 \) omega_(upright(m) \, i) + Delta omega_(upright(theta))$
(down-conversion) and
$\( n + 1 \) omega_(upright(m) \, i) + Delta omega_(upright(theta))$
(up-conversion) with an amplitude scaling factor of $m_0 \/ 2$. \
\
#emph[Cascaded analysis:] The analysis above suggests that the laser
phase noise $p_i$ is virtually down-converted by
$omega_(upright(m) \, i)$ to the modulation amplitude and phase noises
($a_i$ and $theta_i$), and vice versa. This implies that the
down-conversions occur in a cascaded manner. To describe this
functionally, let us write a given noise $x_i$ in
#ref(<eq:x_i>) as a function of the angular frequency
$omega_(upright(n))$, parameterized by the noise amplitude $m_x$ and the
random phase $rho$ as:
$ x_i \( omega_(upright(n)) \; m_x \, rho \) & = m_x cos \( omega_(upright(n)) tau + rho \) . $<eq:x_i_2>
Based on this, the process of the frequency downconversion of the laser
phase noise $p_i$ can be expressed as:
$ p_i \( n omega_(upright(m) \, i) + Delta omega_(upright(p)) \; m_(upright(p)) \, rho \) & arrow.r cases(delim: "{", a_i \( \( n - 1 \) omega_(upright(m) \, i) + Delta omega_(upright(p)) \; m_(upright(p)) / m_0 \, rho - phi.alt_(upright(t a r) \, i)^(upright(s b)) \) & , theta_i \( \( n - 1 \) omega_(upright(m) \, i) + Delta omega_(upright(p)) \; m_(upright(p)) / m_0 \, rho - phi.alt_(upright(t a r) \, i)^(upright(s b)) - pi / 2 \) . & ) $<eq:pi2ai_2thetai>
The right arrow represents the virtual frequency conversion process, and
the terms listed on the right-hand side are the resulting noises. On the
other hand, the modulation amplitude and phase noises at
$n omega_(upright(m) \, i) + Delta omega_(upright(a))$ and
$n omega_(upright(m) \, i) + Delta omega_(upright(theta))$ turn into the
laser noise as,
$ a_i \( n omega_(upright(m) \, i) + Delta omega_(upright(a)) \; m_(upright(a)) \, rho \) & arrow.r p_i \( \( n - 1 \) omega_(upright(m) \, i) + Delta omega_(upright(a)) \; frac(m_0 m_(upright(a)), 2) \, rho - phi.alt_(upright(t a r) \, i)^(upright(s b)) \)\
 & + p_i \( \( n + 1 \) omega_(upright(m) \, i) + Delta omega_(upright(a)) \; frac(m_0 m_(upright(a)), 2) \, rho + phi.alt_(upright(t a r) \, i)^(upright(s b)) \) \,\
theta_i \( n omega_(upright(m) \, i) + Delta omega_(upright(theta)) \; m_(upright(theta)) \, rho \) & arrow.r p_i \( \( n - 1 \) omega_(upright(m) \, i) + Delta omega_(upright(theta)) \; frac(m_0 m_(upright(theta)), 2) \, rho - phi.alt_(upright(t a r) \, i)^(upright(s b)) - pi / 2 \)\
 & + p_i \( \( n + 1 \) omega_(upright(m) \, i) + Delta omega_(upright(a)) \; frac(m_0 m_(upright(theta)), 2) \, rho + phi.alt_(upright(t a r) \, i)^(upright(s b)) + pi / 2 \) . $<eq:ai2pi>
If we combine
#ref(label("eq:pi2ai_2thetai")), #ref(label("eq:ai2pi"))
for the coupling path $p_i arrow.r a_i arrow.r p_i$ and
#ref(label("eq:pi2ai_2thetai")), #ref(label("eq:ai2pi"))
for the coupling path $p_i arrow.r theta_i arrow.r p_i$, we get
$ p_i \( n omega_(upright(m) \, i) + Delta omega_(upright(p)) \; m_(upright(p)) \, rho \) & arrow.r cases(delim: "{", a_i \( \( n - 1 \) omega_(upright(m) \, i) + Delta omega_(upright(p)) \; m_(upright(p)) / m_0 \, rho - phi.alt_(upright(t a r) \, i)^(upright(s b)) \) & , theta_i \( \( n - 1 \) omega_(upright(m) \, i) + Delta omega_(upright(p)) \; m_(upright(p)) / m_0 \, rho - phi.alt_(upright(t a r) \, i)^(upright(s b)) - pi / 2 \) \, & )\
 & arrow.r p_i \( \( n - 2 \) omega_(upright(m) \, i) + Delta omega_(upright(p)) \; m_(upright(p)) / 2 \, rho - 2 phi.alt_(upright(t a r) \, i)^(upright(s b)) \) + p_i \( n omega_(upright(m) \, i) + Delta omega_(upright(p)) \; m_(upright(p)) / 2 \, rho \)\
 & + p_i \( \( n - 2 \) omega_(upright(m) \, i) + Delta omega_(upright(p)) \; m_(upright(p)) / 2 \, rho - 2 phi.alt_(upright(t a r) \, i)^(upright(s b)) - pi \) + p_i \( n omega_(upright(m) \, i) + Delta omega_(upright(p)) \; m_(upright(p)) / 2 \, rho \)\
 & = 0 + p_i \( n omega_(upright(m) \, i) + Delta omega_(upright(p)) \; m_(upright(p)) \, rho \) $<eq:pi2aithetai2pi>

]
The resulting $p_i$ at
$\( n - 2 \) omega_(upright(m) \, i) + Delta omega_(upright(p))$ via
$a_i$ and $theta_i$ at
$\( n - 1 \) omega_(upright(m) \, i) + Delta omega_(upright(p))$ have a
relative $pi$ phase shift; therefore, they cancel and result in 0 in the
last line. The up-converted parts resulting from $a_i$ and $theta_i$
just recovers the original laser phase noise at
$n omega_(upright(m) \, i) + Delta omega_(upright(p))$. Hence, in this
framework, the laser phase noise $p_i$ can be down-converted only once,
and if we try to downconvert it twice, the original laser phase noise is
reproduced.

Let us start the same cascaded analysis with the modulation amplitude
and phase noises. Contrary to the laser phase noise down-conversion in
#ref(<eq:pi2aithetai2pi>), $a_i$ and $theta_i$
are different noise sources. Therefore, they are not expected to cancel
even if we investigate them at the same frequency. However, due to the
cancellation at the second down-conversion of the laser phase noise
above, the modulation amplitude and phase noises also have the limited
number of down-conversions in this framework: up to two
down-conversions. The double down-conversions can be formulated as

#block[
$ a_i \( n omega_(upright(m) \, i) + Delta omega_(upright(a)) \; m_(upright(a)) \, rho \) & arrow.r p_i \( \( n - 1 \) omega_(upright(m) \, i) + Delta omega_(upright(a)) \; frac(m_0 m_(upright(a)), 2) \, rho - phi.alt_(upright(t a r) \, i)^(upright(s b)) \) arrow.r cases(delim: "{", a_i \( \( n - 2 \) omega_(upright(m) \, i) + Delta omega_(upright(a)) \; m_(upright(a)) / 2 \, rho - 2 phi.alt_(upright(t a r) \, i)^(upright(s b)) \) & , theta_i \( \( n - 2 \) omega_(upright(m) \, i) + Delta omega_(upright(a)) \; m_(upright(a)) / 2 \, rho - 2 phi.alt_(upright(t a r) \, i)^(upright(s b)) - pi / 2 \) \, & )\
theta_i \( n omega_(upright(m) \, i) + Delta omega_(upright(theta)) \; m_(upright(theta)) \, rho \) & arrow.r p_i \( \( n - 1 \) omega_(upright(m) \, i) + Delta omega_(upright(theta)) \; frac(m_0 m_(upright(theta)), 2) \, rho - phi.alt_(upright(t a r) \, i)^(upright(s b)) - pi / 2 \) arrow.r cases(delim: "{", a_i \( \( n - 2 \) omega_(upright(m) \, i) + Delta omega_(upright(theta)) \; m_(upright(theta)) / 2 \, rho - 2 phi.alt_(upright(t a r) \, i)^(upright(s b)) - pi / 2 \) & , theta_i \( \( n - 2 \) omega_(upright(m) \, i) + Delta omega_(upright(theta)) \; m_(upright(theta)) / 2 \, rho - 2 phi.alt_(upright(t a r) \, i)^(upright(s b)) - pi \) . & ) $<eq:ai2pi2ai>

]
The first right arrows only consider the frequency downconversion,
neglecting the upconverted part in
#ref(label("eq:ai2pi")) If we
down-convert the resulting noise around
$\( n - 2 \) omega_(upright(m) \, i)$ once more, the same cancelation as
#ref(<eq:pi2aithetai2pi>) happens again.

#figure(image("source/ghz_diagram.pdf", width: 12.9cm),
  caption: [
    Diagram comprehensively visualizing coupling of the laser and
    modulation noise to phase extraction by a phasemeter. Blue arrows
    represent the coupling of noise at the heterodyne (or observation)
    band $Delta f$, discussed in #link(<sec:het_band>)[3]. Black arrows
    represent the virtual frequency conversion of noises around the
    integer multiple of the modulation frequency
    $omega_(upright(m) \, i)$ that are captured by the trigonometric
    analysis in #link(<sub:mod_band_trig>)[4.1]. Red arrows represent
    the modulation-band noise coupling, which can only be found in the
    sideband analysis in #link(<sub:mod_band_sideband>)[4.2]. The
    modulation-band noise coupling via the second-order modulation
    sidebands is not depicted. The noise scaling factors on individual
    paths are written in square brackets. The dashed arrows from
    $p_i \( 2 f_m + Delta f \)$ to $a_i \( f_m + Delta f \)$ and
    $theta_i \( f_m + Delta f \)$ represents the fact that the
    down-conversion exist but it does not couple to the heterodyne or
    observation band with further down conversions as derived in
    #ref(<eq:pi2aithetai2pi>).
  ]
)
<fig:ghz_diagram>

The analysis of the virtual cascaded down-conversions is visualized in
#link(<fig:ghz_diagram>)[3] in black. The noise analysis in this section
is naturally connected to that of the heterodyne-band noise via the
downconversion.

== Sideband analysis
<sub:mod_band_sideband>
The trigonometric analysis in #link(<sub:mod_band_trig>)[4.1] captures
many of the coupling paths from the modulation-band noise, however, not
all of them. There is a missing coupling mechanism via the mixing
between the modulation sideband and phase noise sidebands that arises
from the fact that #ref(<eq:phi_m>) is the phase of an
electromagnetic field. In this section, we search for the noise coupling
via the interaction of the modulation and the laser phase noise by
expanding the phase of the single electromagnetic field to sidebands.
The coupling of the modulation amplitude and phase noise is expected to
be fully covered in #link(<sub:mod_band_trig>)[4.1]\; hence, we focus on
the laser phase noise in this section.

The electromagnetic field in #ref(<eq:Ei_phim>) with
the laser phase noise $p_i$ under
$p_i = m_(upright(p)) cos \( \( n omega_(upright(m) \, i) + Delta omega_(upright(p)) \) tau + rho \)$
($n in bb(N)$) and $n_i = a_i = theta_i = 0$ reads

#block[
$ E_i & = A_i dot.op exp \( j omega_i tau + j phi.alt_(upright(t a r) \, i)^(upright(c a r)) + j m_(upright(p)) cos \( \( n omega_(upright(m) \, i) + Delta omega_(upright(p)) \) tau + rho \) + j m_0 cos \( omega_(upright(m) \, i) tau + phi.alt_(upright(t a r) \, i)^(upright(s b)) \) \)\
 & approx A_i dot.op upright(e)^(j \( omega_i tau + phi.alt_(upright(t a r) \, i)^(upright(c a r)) \)) dot.op \( J_0 \( m_0 \) + sum_(k = 1)^oo j^k J_k \( m_0 \) {upright(e)^(j k \( omega_(upright(m) \, i) tau + phi.alt_(upright(t a r) \, i)^(upright(s b)) \)) + upright(e)^(- j k \( omega_(upright(m) \, i) tau + phi.alt_(upright(t a r) \, i)^(upright(s b)) \))} \)\
 & dot.op \( J_0 \( m_(upright(p)) \) + j J_1 \( m_(upright(p)) \) upright(e)^(j \( \( n omega_(upright(m) \, i) + Delta omega_(upright(p)) \) tau + rho \)) + j J_1 \( m_(upright(p)) \) upright(e)^(- j \( \( n omega_(upright(m) \, i) + Delta omega_(upright(p)) \) tau + rho \)) \)\
 & = A_i dot.op upright(e)^(j \( omega_i tau + phi.alt_(upright(t a r) \, i)^(upright(c a r)) \)) dot.op \( cal(S)_0 + sum_(k = 1)^oo \( cal(S)_(+ k) + cal(S)_(- k) \) \) dot.op \( J_0 \( m_(upright(p)) \) + cal(P)_(+ n) + cal(P)_(- n) \) \, $

]
where $ cal(S)_0 & colon.eq J_0 \( m_0 \) \,\
cal(S)_(+ k) & colon.eq j^k J_k \( m_0 \) upright(e)^(j k \( omega_(upright(m) \, i) tau + phi.alt_(upright(t a r) \, i)^(upright(s b)) \)) \,\
cal(S)_(- k) & colon.eq j^k J_k \( m_0 \) upright(e)^(- j k \( omega_(upright(m) \, i) tau + phi.alt_(upright(t a r) \, i)^(upright(s b)) \)) \,\
cal(P)_(+ n) & colon.eq j J_1 \( m_(upright(p)) \) upright(e)^(j \( \( n omega_(upright(m) \, i) + Delta omega_(upright(p)) \) tau + rho \)) \,\
cal(P)_(- n) & colon.eq j J_1 \( m_(upright(p)) \) upright(e)^(- j \( \( n omega_(upright(m) \, i) + Delta omega_(upright(p)) \) tau + rho \)) . $<eq:Ssub>
$cal(S)$ represents the carrier or the modulation sidebands, and
$cal(P)$ represents the noise sidebands. Note that we for now consider
the modulation sidebands higher than the first-order, while the noise
sidebands sticks to its first-order terms.

The noise couplings missed by the trigonometric analysis in
#link(<sub:mod_band_trig>)[4.1] is the interaction between
$cal(S)_(plus.minus k)$ and $cal(P)$. Of the possible combinations,
those between $cal(S)_(+)$ and $cal(P)_(+)$ or $cal(S)_(-)$ and
$cal(P)_(-)$ push the noise sideband far away from the carrier or the
modulation sidebands, which is expected not to result in significant
noise coupling at the end within the PR signal in
#ref(<eq:spr>). Hence, let us focus on the following two
terms, $ cal(T)_k^(- n) & = cal(P)_(- n) cal(S)_(+ k)\
 & = j^(k + 1) J_k \( m_0 \) J_1 \( m_(upright(p)) \) upright(e)^(- j \( \( \( n - k \) omega_(upright(m) \, i) + Delta omega_(upright(p)) \) tau - k phi.alt_(upright(t a r) \, i)^(upright(s b)) + rho \)) \,\
cal(T)_(- k)^n & = cal(P)_(+ n) cal(S)_(- k)\
 & = j^(k + 1) J_k \( m_0 \) J_1 \( m_(upright(p)) \) upright(e)^(j \( \( \( n - k \) omega_(upright(m) \, i) + Delta omega_(upright(p)) \) tau - k phi.alt_(upright(t a r) \, i)^(upright(s b)) + rho \)) . $<eq:Tsub>
The superscript and subscript of $cal(T)$ represent the integer
associated with the noise sideband $cal(P)$ and the modulation sideband
$cal(S)$, respectively.

The division of $cal(T)$ by $cal(S)$ reveals how the noise sidebands get
associated with individual beatnotes:

#block[
$ cal(T)_k^(- n) \/ cal(S)_0 & = j^(k + 1) frac(J_k \( m_0 \) J_1 \( m_(upright(p)) \), J_0 \( m_0 \)) exp \[ - j \( \( \( n - k \) omega_(upright(m) \, i) + Delta omega_(upright(p)) \) tau - k phi.alt_(upright(t a r) \, i)^(upright(s b)) + rho \) \] \,\
cal(T)_k^(- n) \/ cal(S)_(+ 1) & = j^k frac(J_k \( m_0 \) J_1 \( m_(upright(p)) \), J_1 \( m_0 \)) exp \[ - j \( \( \( n - k + 1 \) omega_(upright(m) \, i) + Delta omega_(upright(p)) \) tau - \( k - 1 \) phi.alt_(upright(t a r) \, i)^(upright(s b)) + rho \) \] \,\
cal(T)_k^(- n) \/ cal(S)_(- 1) & = j^k frac(J_k \( m_0 \) J_1 \( m_(upright(p)) \), J_1 \( m_0 \)) exp \[ - j \( \( \( n - k - 1 \) omega_(upright(m) \, i) + Delta omega_(upright(p)) \) tau - \( k + 1 \) phi.alt_(upright(t a r) \, i)^(upright(s b)) + rho \) \] \,\
cal(T)_(- k)^n \/ cal(S)_0 & = j^(k + 1) frac(J_k \( m_0 \) J_1 \( m_(upright(p)) \), J_0 \( m_0 \)) exp \[ j \( \( \( n - k \) omega_(upright(m) \, i) + Delta omega_(upright(p)) \) tau - k phi.alt_(upright(t a r) \, i)^(upright(s b)) + rho \) \] \,\
cal(T)_(- k)^n \/ cal(S)_(+ 1) & = j^k frac(J_k \( m_0 \) J_1 \( m_(upright(p)) \), J_1 \( m_0 \)) exp \[ j \( \( \( n - k - 1 \) omega_(upright(m) \, i) + Delta omega_(upright(p)) \) tau - \( k + 1 \) phi.alt_(upright(t a r) \, i)^(upright(s b)) + rho \) \] \,\
cal(T)_(- k)^n \/ cal(S)_(- 1) & = j^k frac(J_k \( m_0 \) J_1 \( m_(upright(p)) \), J_1 \( m_0 \)) exp \[ j \( \( \( n - k + 1 \) omega_(upright(m) \, i) + Delta omega_(upright(p)) \) tau - \( k - 1 \) phi.alt_(upright(t a r) \, i)^(upright(s b)) + rho \) \] . $<eq:Tnk_norm>

]
Each represents a noise single sideband around an individual tone, which
is interpreted as the combination of coherent amplitude and phase noises
as discussed in #link(<app:ssb>)[10]. Hence, if the noise single
sideband associated with $cal(S)_(k') \( k' in { 0 \, + 1 \, - 1 } \)$
has the frequency of $Delta omega_(upright(p))$ in the heterodyne band,
it could finally couple to the phase measurement of heterodyne beatnotes
through the amplitude and phase noises at $Delta omega_(upright(p))$ of
the beatnote composed of $cal(S)_(k')$. This suggests that our interest
is the combination of $n$ and $k$ that ends up with the frequency of
$Delta omega_(upright(p))$ by removing $omega_(upright(m) \, i)$.

Let us first stick to the first-order modulation sideband ($k = 1$), and
also consider only $n in { 1 \, 2 }$. Regarding the coupling via the
carrier,
#ref(label("eq:Tnk_norm"))
suggest that $n = k$ is required; therefore, the only possible pair is
$n = k = 1$. Focusing on those terms, we get
$ cal(T)_1^(- 1) \/ cal(S)_0 & + cal(T)_(- 1)^1 \/ cal(S)_0\
 & = - frac(J_1 \( m_0 \), J_0 \( m_0 \)) m_(upright(p)) cos \( Delta omega_(upright(p)) tau - phi.alt_(upright(t a r) \, i)^(upright(s b)) + rho \)\
 & approx 1 / m_0 dot.op \( - frac(m_0^2, 2 J_0 \( m_0 \)) m_(upright(p)) cos \( Delta omega_(upright(p)) tau - phi.alt_(upright(t a r) \, i)^(upright(s b)) + rho \) \) . $<eq:T1-1_sum>
This just reproduces the coupling path captured in
#link(<sub:mod_band_trig>)[4.1]:
$p_i \( omega_(upright(m) \, i) + Delta omega_(upright(p)) \)$ virtually
turns to $a_i \( Delta omega_(upright(p)) \)$ and
$theta_i \( Delta omega_(upright(p)) \)$ (see
#ref(<eq:pi2ai_2thetai>)), out of which only
$a_i \( Delta omega_(upright(p)) \)$ remains here as
$theta_i \( Delta omega_(upright(p)) \)$ has no coupling path through
the carrier. The second line in #ref(<eq:T1-1_sum>)
explicitly shows this by decomposing the result into the coupling factor
$1 \/ m_0$ arising from the frequency downconversion in
#ref(<eq:pi2ai_2thetai>) and the form of the
heterodyne-band modulation amplitude noise in the carrier-carrier
beatnote in
#ref(label("eq:scar_prifo")), #ref(label("eq:sc2sb_prifo")).

On the other hand, regarding the noise coupling via the modulation
sidebands,
#ref(label("eq:Tnk_norm"))
suggest that $k = 1$ and $n = 2$ are required, which give
$ cal(T)_(- 1)^2 \/ cal(S)_(+ 1) & = m_(upright(p)) / 2 exp \[ j \( Delta omega_(upright(p)) tau - 2 phi.alt_(upright(t a r) \, i)^(upright(s b)) + rho + pi \/ 2 \) \] \,\
cal(T)_1^(- 2) \/ cal(S)_(- 1) & = m_(upright(p)) / 2 exp \[ - j \( Delta omega_(upright(p)) tau - 2 phi.alt_(upright(t a r) \, i)^(upright(s b)) + rho - pi \/ 2 \) \] \, $<eq:T21_S1>
According to #link(<app:ssb>)[10], the upper single sideband is
equivalent to the coherent amplitude and phase modulations with the
latter delayed by $pi \/ 2$ against the former. Therefore, the coupling
paths can be written as
$  & p_i \( 2 omega_(upright(m) \, i) + Delta omega_(upright(p)) \; m_(upright(p)) \, rho \)\
 & arrow.r_(upright("via usb"))^(upright("")) {a_i \( Delta omega_(upright(p)) \; m_(upright(p)) / 2 \, rho - 2 phi.alt_(upright(t a r) \, i)^(upright(s b)) + pi \/ 2 \)\
theta_i \( Delta omega_(upright(p)) \; m_(upright(p)) / 2 \, rho - 2 phi.alt_(upright(t a r) \, i)^(upright(s b)) \)\
 & arrow.r_(upright("via lsb"))^(upright("")) {a_i \( Delta omega_(upright(p)) \; m_(upright(p)) / 2 \, rho - 2 phi.alt_(upright(t a r) \, i)^(upright(s b)) - pi \/ 2 \)\
theta_i \( Delta omega_(upright(p)) \; m_(upright(p)) / 2 \, rho - 2 phi.alt_(upright(t a r) \, i)^(upright(s b)) - pi \) $<eq:pi_2fm_viasb>
This shows that the effective phase shift differs between the coupling
paths via the upper modulation sideband $cal(S)_(+ 1)$ in
#ref(<eq:pi_2fm_viasb>) or the lower
modulation sideband $cal(S)_(- 1)$ in
#ref(<eq:pi_2fm_viasb>). This noise coupling
is directly converted from
$2 omega_(upright(m) \, i) + Delta omega_(upright(p))$ to
$Delta omega_(upright(p))$, which is visualized in
#link(<fig:ghz_diagram>)[3] in red.

Let us also consider the second-order modulation sidebands ($k = 2$)
because the modulation depth $m_0$ would not necessarily be small,
unlike the noise amplitude, and could cause noise coupling
$prop J_2 \( m_0 \) tilde.op O \( m_0^2 \)$. On the other hand, we did
not consider the second-order modulation sideband in analysis of the
heterodyne-band noise coupling in #link(<sec:het_band>)[3] because it
would appear as the beatnote between the second-order sidebands of
interfering laser beams. Such a beatnote could cause noise coupling,
however, the coupling factor would be
$prop J_2^2 \( m_0 \) tilde.op O \( m_0^4 \)$, which would be small.

Regarding the second-order coupling via the beam carrier, $n = k = 2$
gives $ cal(T)_2^(- 2) \/ cal(S)_0 & + cal(T)_(- 2)^2 \/ cal(S)_0\
 & = - j frac(J_2 \( m_0 \), J_0 \( m_0 \)) m_(upright(p)) cos \( Delta omega_(upright(p)) tau - 2 phi.alt_(upright(t a r) \, i)^(upright(s b)) + rho \) \, $<eq:T2-2_sum>
which is the pure phase noise with the amplitude of
$frac(J_2 \( m_0 \), J_0 \( m_0 \)) m_(upright(p))$ at
$Delta omega_(upright(p))$. Hence, e.g., if $Delta omega_(upright(p))$
is the frequency in the observation band, this noise appears in the
final carrier phase extraction as is through the carrier self noise
coupling.

On the other hand, regarding the second-order coupling through the
modulation sidebands, $k = 2$ and $n = 1$ for
#ref(label("eq:Tnk_norm"))
give
$ cal(T)_2^(- 1) \/ cal(S)_(+ 1) & = frac(J_2 \( m_0 \) J_1 \( m_(upright(p)) \), J_1 \( m_0 \)) exp \[ - j \( Delta omega_(upright(p)) tau - phi.alt_(upright(t a r) \, i)^(upright(s b)) + rho + pi \) \] \,\
cal(T)_(- 2)^1 \/ cal(S)_(- 1) & = frac(J_2 \( m_0 \) J_1 \( m_(upright(p)) \), J_1 \( m_0 \)) exp \[ j \( Delta omega_(upright(p)) tau - phi.alt_(upright(t a r) \, i)^(upright(s b)) + rho + pi \) \] . $<eq:T12_S1>
Similarly to #ref(<eq:pi_2fm_viasb>), each
produces a noise lower single sideband, which results in
$  & p_i \( omega_(upright(m) \, i) + Delta omega_(upright(p)) \; m_(upright(p)) \, rho \)\
 & arrow.r_(upright("via usb"))^(upright("")) {a_i \( Delta omega_(upright(p)) \; frac(J_2 \( m_0 \) m_(upright(p)), 2 J_1 \( m_0 \)) \, rho - phi.alt_(upright(t a r) \, i)^(upright(s b)) + pi \)\
theta_i \( Delta omega_(upright(p)) \; frac(J_2 \( m_0 \) m_(upright(p)), 2 J_1 \( m_0 \)) \, rho - phi.alt_(upright(t a r) \, i)^(upright(s b)) + frac(3 pi, 2) \)\
 & arrow.r_(upright("via lsb"))^(upright("")) {a_i \( Delta omega_(upright(p)) \; frac(J_2 \( m_0 \) m_(upright(p)), 2 J_1 \( m_0 \)) \, rho - phi.alt_(upright(t a r) \, i)^(upright(s b)) + pi \)\
theta_i \( Delta omega_(upright(p)) \; frac(J_2 \( m_0 \) m_(upright(p)), 2 J_1 \( m_0 \)) \, rho - phi.alt_(upright(t a r) \, i)^(upright(s b)) + frac(3 pi, 2) \) $<eq:pi_fm_viasb>

#figure(image("source/sideband_noise.pdf", width: 8.6cm),
  caption: [
    Single beam optical spectrum with the laser phase noise $p_i$ in the
    noise sideband picture. The modulation sidebands are depicted up to
    the second-order. $f_(upright(m) \, i)$ is a modulation frequency,
    and $Delta f_(upright(p))$ is an offset frequency from an integer
    multiple of $f_(upright(m) \, i)$, which can be either of
    heterodyne-band or observation-band frequencies. The colored noise
    sidebands correspond to the discussed coupling paths as follows:
    Red:
    #ref(label("eq:T21_S1")), #ref(label("eq:pi_2fm_viasb"))\;
    Green: #ref(<eq:T2-2_sum>)\; Blue:
    #ref(label("eq:T12_S1")), #ref(label("eq:pi_fm_viasb")).
    Abbreviations: usb = upper sideband; lsb = lower sideband.
  ]
)
<fig:sideband_noise>

#link(<fig:sideband_noise>)[4] visualizes the optical spectrum of a
single laser beam with the carrier and modulation sidebands in black and
the noise sidebands discussed in this section in color. Their coherence
properties are discussed in the next section.

== Coherence
<sub:mod_band_coherence>
As shown in #link(<fig:ghz_diagram>)[3], a single modulation-band noise
has various coupling paths. Therefore, it is important to properly track
individual coupling paths and consider the coherence between them to
evaluate the impact on the final measured phase. In this section, we
discuss the noise coherence taking specific noises as examples: noises
at $n omega_(upright(m) \, i) + epsilon.alt$ where $n in { 1 \, 2 }$ and
$epsilon.alt$ is a tiny angular frequency offset in the observation band
as used in
#ref(label("eq:s_add_cite")), #ref(label("eq:IQdemod_cite")).

First, the laser phase noise $p_i$ around the modulation frequency
$omega_(upright(m) \, i)$ is, according to
#ref(<eq:pi2ai_2thetai>), down-converted to the
modulation amplitude and phase noises in the observation band as,

#block[
$ p_i \( omega_(upright(m) \, i) + epsilon.alt \; m_(upright(p)) \, rho \) & arrow.r {a_i \( epsilon.alt \; m_(upright(p)) / m_0 \, rho - phi.alt_(upright(t a r) \, i)^(upright(s b)) \)\
theta_i \( epsilon.alt \; m_(upright(p)) / m_0 \, rho - phi.alt_(upright(t a r) \, i)^(upright(s b)) - pi / 2 \)\
 & arrow.r_(upright("extraction"))^(upright("phase")) cases(delim: "{", 0 + 0 = 0 & upright("for ") phi.alt_(upright(r e a d))^(upright(c a r)), 0 + m_(upright(p)) / m_0 dot.op cos \( rho - phi.alt_(upright(t a r) \, i)^(upright(s b)) - pi / 2 \) = m_(upright(p)) / m_0 dot.op cos \( rho - phi.alt_(upright(t a r) \, i)^(upright(s b)) - pi / 2 \) & upright("for ") phi.alt_(upright(r e a d))^(upright(u s b)), 0 - m_(upright(p)) / m_0 dot.op cos \( rho - phi.alt_(upright(t a r) \, i)^(upright(s b)) - pi / 2 \) = - m_(upright(p)) / m_0 dot.op cos \( rho - phi.alt_(upright(t a r) \, i)^(upright(s b)) - pi / 2 \) & upright("for ") phi.alt_(upright(r e a d))^(upright(l s b)) \,) $<eq:pi_fmfinband>
where the first arrow represents the virtual down-conversion, and the
second arrow represents phase extraction by the phasemeter with the
right-hand side as the coupled noises. There is no influence on the
measured carrier phase $phi.alt_(upright(r e a d))^(upright(c a r))$,
while the sideband phases are affected off-phase; therefore, the noise
cannot be suppressed by the combination in
#ref(<eq:sbcombi>).

Second, according to
#ref(label("eq:pi_2fm_viasb")),
the laser phase noise around the double modulation frequency
$2 omega_(upright(m) \, i)$ reads
$ p_i \( 2 omega_(upright(m) \, i) & + epsilon.alt \; m_(upright(p)) \, rho \)\
 & arrow.r_(upright("extraction"))^(upright("phase")) cases(delim: "{", 0 & upright("for ") phi.alt_(upright(r e a d))^(upright(c a r)), hat(a)_i \( epsilon.alt \; m_p / 2 \, rho - 2 phi.alt_(upright(t a r) \, i)^(upright(s b)) + pi / 2 \) + hat(theta)_i \( epsilon.alt \; m_p / 2 \, rho - 2 phi.alt_(upright(t a r) \, i)^(upright(s b)) \) = m_(upright(p)) / 2 dot.op cos \( rho - 2 phi.alt_(upright(t a r) \, i)^(upright(s b)) \) & upright("for ") phi.alt_(upright(r e a d))^(upright(u s b)), hat(a)_i \( epsilon.alt \; m_p / 2 \, rho - 2 phi.alt_(upright(t a r) \, i)^(upright(s b)) - pi / 2 \) + hat(theta)_i \( epsilon.alt \; m_p / 2 \, rho - 2 phi.alt_(upright(t a r) \, i)^(upright(s b)) - pi \) = m_(upright(p)) / 2 dot.op cos \( rho - 2 phi.alt_(upright(t a r) \, i)^(upright(s b)) \) & upright("for ") phi.alt_(upright(r e a d))^(upright(l s b)) \,) $<eq:pi_2fmfinband>
where we express the coupled term of the noise $x_i$ in the measured
phases by $hat(x)_i$. According to
#ref(<tab:noise_couplings>),
$theta_i \( epsilon.alt \)$ is the self noise coupling, and the coupling
to $phi.alt_(upright(r e a d))^(upright(u s b))$
($phi.alt_(upright(r e a d))^(upright(l s b))$) occurs through usb
(lsb). Hence,
#ref(label("eq:pi_2fm_viasb"))
were applied to $phi.alt_(upright(r e a d))^(upright(u s b))$ and
$phi.alt_(upright(r e a d))^(upright(l s b))$, respectively. As the
sideband phases are affected in-phase, the noise can be completely
removed by the combination in #ref(<eq:sbcombi>).
Regarding the carrier,
$p_i \( 2 omega_(upright(m) \, i) + epsilon.alt \)$ has no influence on
the measured carrier phase $phi.alt_(upright(r e a d))^(upright(c a r))$
either; however, if we consider the second-order modulation sidebands,
there is a noise coupling as shown in
#ref(<eq:T2-2_sum>).

Third, considering
#ref(label("eq:ai2pi")), #ref(label("eq:pi_2fmfinband")),
the modulation amplitude noise $a_i$ around $omega_(upright(m) \, i)$
couples as,
$ a_i \( omega_(upright(m) \, i) + epsilon.alt \; m_(upright(a)) \, rho \) & arrow.r p_i \( epsilon.alt \; frac(m_0 m_(upright(a)), 2) \, rho - phi.alt_(upright(t a r) \, i)^(upright(s b)) \) + p_i \( 2 omega_(upright(m) \, i) + epsilon.alt \; frac(m_0 m_(upright(a)), 2) \, rho + phi.alt_(upright(t a r) \, i)^(upright(s b)) \)\
 & arrow.r_(upright("extraction"))^(upright("phase")) cases(delim: "{", frac(m_0 m_(upright(a)), 2) cos \( rho - phi.alt_(upright(t a r) \, i)^(upright(s b)) \) + 0 = frac(m_0 m_(upright(a)), 2) cos \( rho - phi.alt_(upright(t a r) \, i)^(upright(s b)) \) & upright("for ") phi.alt_(upright(r e a d))^(upright(c a r)), frac(m_0 m_(upright(a)), 2) cos \( rho - phi.alt_(upright(t a r) \, i)^(upright(s b)) \) + frac(m_(upright(a)) m_0, 4) dot.op cos \( rho - phi.alt_(upright(t a r) \, i)^(upright(s b)) \) = 3 / 4 m_0 m_(upright(a)) cos \( rho - phi.alt_(upright(t a r) \, i)^(upright(s b)) \) & upright("for ") phi.alt_(upright(r e a d))^(upright(u s b)), frac(m_0 m_(upright(a)), 2) cos \( rho - phi.alt_(upright(t a r) \, i)^(upright(s b)) \) + frac(m_(upright(a)) m_0, 4) dot.op cos \( rho - phi.alt_(upright(t a r) \, i)^(upright(s b)) \) = 3 / 4 m_0 m_(upright(a)) cos \( rho - phi.alt_(upright(t a r) \, i)^(upright(s b)) \) & upright("for ") phi.alt_(upright(r e a d))^(upright(l s b)) \,) $<eq:ai_fmfinband>
while $a_i$ around $2 omega_(upright(m) \, i)$ can be derived by
#ref(<eq:ai2pi2ai>) as,
$ a_i \( 2 omega_(upright(m) \, i) + epsilon.alt \; m_(upright(a)) \, rho \) & arrow.r {a_i \( epsilon.alt \; m_(upright(a)) / 2 \, rho - 2 phi.alt_(upright(t a r) \, i)^(upright(s b)) \)\
theta_i \( epsilon.alt \; m_(upright(a)) / 2 \, rho - 2 phi.alt_(upright(t a r) \, i)^(upright(s b)) - pi / 2 \)\
 & arrow.r_(upright("extraction"))^(upright("phase")) cases(delim: "{", 0 + 0 = 0 & upright("for ") phi.alt_(upright(r e a d))^(upright(c a r)), 0 + m_(upright(a)) / 2 dot.op cos \( rho - 2 phi.alt_(upright(t a r) \, i)^(upright(s b)) - pi / 2 \) = m_(upright(a)) / 2 dot.op cos \( rho - 2 phi.alt_(upright(t a r) \, i)^(upright(s b)) - pi / 2 \) & upright("for ") phi.alt_(upright(r e a d))^(upright(u s b)), 0 - m_(upright(a)) / 2 dot.op cos \( rho - 2 phi.alt_(upright(t a r) \, i)^(upright(s b)) - pi / 2 \) = - m_(upright(a)) / 2 dot.op cos \( rho - 2 phi.alt_(upright(t a r) \, i)^(upright(s b)) - pi / 2 \) & upright("for ") phi.alt_(upright(r e a d))^(upright(l s b)) .) $<eq:ai_2fmfinband>

]
Therefore, $a_i$ at $omega_(upright(m) \, i) + epsilon.alt$ in
#ref(<eq:ai_fmfinband>) affects not only the
sideband phases but also the carrier phase. The impact on the sideband
phases is in-phase; hence, it can be removed by the sideband combination
in #ref(<eq:sbcombi>). On the other hand, $a_i$ at
$2 omega_(upright(m) \, i) + epsilon.alt$ in
#ref(<eq:ai_2fmfinband>) has noise coupling to
only the sideband phases, which are off-phase and cannot be suppressed
by the combination in #ref(<eq:sbcombi>).

Finally, the modulation phase noise $theta_i$ can be easily derived via
comparison with $a_i$, i.e.,
#ref(label("eq:ai_fmfinband")), #ref(label("eq:ai_2fmfinband")).
Regarding $theta_i$ at $omega_(upright(m) \, i) + epsilon.alt$,
#ref(label("eq:ai2pi")) suggest
that we can add the $- pi \/ 2$ phase shift to the contribution of
$p_i \( epsilon.alt \)$ and $+ pi \/ 2$ to the contribution of
$p_i \( 2 omega_(upright(m) \, i) + epsilon.alt \)$ in
#ref(<eq:ai_fmfinband>). This results in
$1 / 2 m_0 m_theta sin \( rho - phi.alt_(upright(t a r) \, i)^(upright(s b)) \)$
for $phi.alt_(upright(r e a d))^(upright(c a r))$ and
$1 / 4 m_0 m_(upright(theta)) sin \( rho - phi.alt_(upright(t a r) \, i)^(upright(s b)) \)$
for $phi.alt_(upright(r e a d))^(upright(u s b))$ and
$phi.alt_(upright(r e a d))^(upright(l s b))$\; the noise coupling to
the sideband can be removed by the combination in
#ref(<eq:sbcombi>). For $theta_i$ at
$2 omega_(upright(m) \, i) + epsilon.alt$, comparing
#ref(label("eq:ai2pi2ai")),we
find that the result is given by shifting the phase of
#ref(<eq:ai_2fmfinband>) by $- pi \/ 2$\;
therefore, the relative phase between
$phi.alt_(upright(r e a d))^(upright(u s b))$ and
$phi.alt_(upright(r e a d))^(upright(l s b))$ does not change from
#ref(<eq:ai_2fmfinband>), and the combination in
#ref(<eq:sbcombi>) cannot suppress the noise.

= Verification
<sec:verification>
#figure(image("source/sim_flow.pdf", width: 100%),
  caption: [
    Diagram highlighting the processing steps of the numerical
    experiment. All plots are amplitude spectra, instead of ASDs, to
    properly assess the height of monotonic tones. The noise coupling
    factor for an individual beatnote is computed by the ratio of the
    coupled noise in its measured phase (bottom right) to the injected
    noise (top left). Regarding the plots of the power spectrum, the
    results of the modulation amplitude noise $a_i$ at
    $2 omega_(upright(h e t))$ are taken as an example.
  ]
)
<fig:sim_flow>

We so far derived various noise couplings analytically based on some
approximations like the linear approximation and the sideband expression
of the phase modulation. In order to confirm that our analytical
framework really covers the main noise couplings, we report on a
numerical experiment in this section. The numerical simulation was
implemented, as written below, so that it does not impose any linear
approximation. Therefore, the agreement between the analysis and the
numerical simulation guaranties that the framework for the systematic
search in
#ref(label("sec:het_band")), #ref(label("sec:mod_band"))
maintains sufficient precision for the primary noise couplings. The
setup of the numerical experiment is described below and is also shown
in #link(<fig:sim_flow>)[5].

Contrary to the PR signal with the first-order modulation sidebands in
#ref(<eq:spr>), we generate a time series according to
$ tilde(s)_(upright(p r)) \( tau \) = cos \( omega_(upright(h e t)) t + tilde(phi.alt)_1 \( t \) - tilde(phi.alt)_2 \( t \) \) \, $<eq:tildespr>
where
$ tilde(phi.alt)_i \( t \) = p_i \( t \) + m_0 \( 1 + a_i \( t \) \) cos \( omega_(upright(m) \, i) t + theta_i \( t \) \) . $<eq:tildephii>
We use LISA-like parameters: The modulation frequencies
$omega_(upright(m) \, i)$ are assumed at
$omega_(upright(m) \, 1) \/ \( 2 pi \) = 3 times 5 times 19 times 2^23 = 2.39075328 med upright("G") upright("Hz")$,
$omega_(upright(m) \, 2) \/ \( 2 pi \) = 19 times 17 times 113 times 2^16 = 2.391998464 med upright("G") upright("Hz")$.
The nominal modulation depth $m_0$ was set at 0.584~rad, which invests
16~% of the optical power for the sidebands. The heterodyne frequency
$omega_(upright(h e t)) \/ \( 2 pi \)$ was set at 10~MHz.

Since we do not perform any further expansion, the highest frequency
components of #ref(<eq:tildespr>) will be in the GHz
range. To avoid these being aliased into our measurement band, we
initially use a relatively high sampling rate of 1.28~GHz for the
heterodyne-band noises and 12.8~GHz for the modulation-band noises to
produce a first instance of the signal which is then immediately
filtered and downsampled to a final rate of 80~MHz. We then perform a
standard I/Q demodulation on these downsampled signals at three
frequencies: $omega_(upright(h e t))$ for the carrier-carrier beatnote,
$omega_(upright(h e t)) - omega_(upright(m) \, 1) + omega_(upright(m) \, 2)$
for the usb-usb beatnote, and
$omega_(upright(h e t)) + omega_(upright(m) \, 1) - omega_(upright(m) \, 2)$
for the lsb-lsb beatnote. The low-pass filter in the I/Q demodulation is
designed from a Kaiser window, with a transition band from 500~kHz to
1~MHz and a suppression of 240~db. Hence, 500~kHz defines the bandwidth
of the phasemeter output.

Due to the high initial sampling rate, it is infeasible in this setup to
produce sufficiently long data streams to reach the actual LISA
measurement band of 0.1~mHz to 1~Hz. For each noise source, we generate
a synthetic data stream with the sample size of $10^7$. Considering the
sampling rates mentioned above, the lowest frequency bin we can reach is
128~Hz for the heterodyne-band noise and 1.28~kHz for the
modulation-band noise.

To verify individual noise couplings, we inject a monotonic noise at the
target noise frequency with an offset frequency of 30~kHz and a noise
amplitude of $10^(- 4)$ with the units of rad for $p_i$ and $theta_i$
and no unit for $a_i$. In this way, the coupled noise appears at 30~kHz
in a phase measured by the I/Q demodulation, as shown on the bottom
right in #link(<fig:sim_flow>)[5]. Finally, comparing the height of the
coupled noise peak at 30~kHz in the amplitude spectrum with the injected
amplitude of $10^(- 4)$, we can derive the magnitude of a noise coupling
factor. To compare the simulation result with analysis in the time
domain, the coupling factors derived in simulation is multiplied by a
factor of $sqrt(2)$ because the height of the coupled noise peak in the
amplitude spectrum corresponds to the root-mean-square value, which
needs to be converted to the amplitude.

#link(<fig:het_noise_sim>)[6] shows the result for the heterodyne-band
noise. The coupling factors (black horizontal lines), derived from the
analysis in #link(<sec:het_band>)[3], all agree with the numerical
simulation shown in the colored markers. The simulation and the analysis
are consistent also in terms of the sideband combination in
#ref(<eq:sbcombi>): the colored stars (simulation)
always coincide with the vertically-capped black lines (analysis), while
the colored stars do not appear when the black lines are not shown. This
confirms that our analysis properly calculates not only the magnitude of
the coupled noises but also their phases, in other words, coherence.
There are some colored markers in the gray area below 3~×~10#super[−2].
Our analytical framework does not predict those couplings found in
simulation; hence, they are expected to arise from the outside of our
framework, e.g., couplings from the second- or higher-order modulation
sidebands. From these results, we conclude that we were able to capture
all major couplings of the three types of noise in the heterodyne
frequency band using the analytical framework in
#link(<sec:het_band>)[3].

#figure(image("source/het_noise_sim.pdf", width: 8.6cm),
  caption: [
    Comparison of analysis (black horizontal lines with different cap
    styles) from #ref(<tab:noise_couplings>)
    and numerical simulation (circles, up triangles, down triangles, or
    stars) for heterodyne-band noises in terms of the noise coupling
    factor in the time domain. Top: coupling factors of the laser phase
    noise $p_i$\; Middle: coupling factors of the modulation amplitude
    noise $a_i$\; Bottom: coupling factors of the modulation phase noise
    $theta_i$. The x axis is a different noise frequency resulting from
    a combination of the heterodyne frequency $f_(upright(h e t))$ and
    the modulation offset frequency $Delta f_(upright(m))$. Our
    analytical framework in #link(<sec:het_band>)[3] predicts no
    coupling below 3~×~10#super[−2], which is grayed.
  ]
)
<fig:het_noise_sim>

Regarding the modulation-band noises analyzed in
#link(<sec:mod_band>)[4], we have numerous couplings around
$omega_(upright(m) \, i)$ and $2 omega_(upright(m) \, i)$ with in-band
or heterodyne-band frequency offsets. Hence, instead of showing all
possible noise couplings, we take the offset frequencies of
$epsilon.alt$ and $2 omega_(upright(h e t))$ as examples. The reason of
the choices is that the former is the most fundamental example and the
latter is one of the frequencies with the most variety of couplings. The
analytical solutions for the coupling of the noises with the offset of
$epsilon.alt$ are given in #link(<sub:mod_band_coherence>)[4.3]. The
same type of analysis can be found for noises with the offset of
$2 omega_(upright(h e t))$ in #link(<app:2fhet>)[11]. The comparison
between the analysis and the numerical simulation is summarized in
#link(<fig:mod_noise_sim>)[7]. They are consistent, and the analysis
could catch all the major couplings from the noises in the modulation
band. This guaranties that the diagram in #link(<fig:ghz_diagram>)[3]
efficiently describes the coupling mechanisms, and we properly track the
coherence between different coupling paths using the analytical
framework in #link(<sec:mod_band>)[4]. The red lines represent the
analytical results of coupling from the second-order modulation
sidebands, namely the cases of $k = 2$ that scale with $J_2 \( m_0 \)$
in #link(<sub:mod_band_sideband>)[4.2]. They are apparently secondary
noises, but are too large to easily ignore. For example, the coupling
factors of $p_i \( 2 omega_(upright(m) \, i) + epsilon.alt \)$ in the
plot (= orange on top) are $3.2 times 10^(- 2)$ and $3.5 times 10^(- 1)$
for the carrier-carrier beatnote (circle) and the sideband-sideband
beatnotes (triangles), respectively. Particularly in the LISA case, the
precision requirement on phase extraction is two-order more stringent
for the carrier-carrier than for the sideband-sideband. Hence, the
influence of the second-order coupling on the carrier-carrier beatnote
can become comparable to or larger than that of the first-order
couplings on the sideband-sideband beatnotes.

#figure(image("source/mod_noise_sim.pdf", width: 8.6cm),
  caption: [
    Comparison of analysis (black or red horizontal lines) and numerical
    simulation (circles, up triangles, down triangles,or stars) for
    modulation-band noises in terms of the noise coupling factor in the
    time domain. Top: noises with the offset of $epsilon.alt$, \;
    Bottom: noises with the offset of $2 omega_(upright(h e t))$, . The
    x axis gives different noise sources in different frequency regimes.
    The units of y axis depends on the noise sources: rad/rad for the
    laser phase noise $p_i$ and the modulation phase noise $theta_i$ and
    rad/1 for the modulation amplitude noise $a_i$. Red lines represent
    the analytical results of couplings from the second-order modulation
    sidebands, namely the cases of $k = 2$ that scale with
    $J_2 \( m_0 \)$ in #link(<sub:mod_band_sideband>)[4.2].
  ]
)
<fig:mod_noise_sim>

= Application
<sec:application>
To demonstrate the application of this study, we consider the case where
one defines noise requirements from a target sensitivity of phase
extraction in ASD. We particularly focus on heterodyne-band noise here
to concisely show a use case.

As presented in #link(<app:conversion>)[9], the time-domain coupling
factors in #ref(<tab:noise_couplings>) can be
converted to those in ASD by a factor of $sqrt(2)$. In addition, as
mentioned at the end of #link(<sub:framework_strategy>)[2.4],
considering incoherent noise contributions with the same noise amplitude
from the two interfering beams, a coupling factor gains another factor
of $sqrt(2)$. Hence, a total phase noise caused by a noise source $x$
($in { p \, v \, a \, theta }$) in phase extraction of a beatnote $y$
($in { upright(c a r) \, upright(u s b) \, upright(l s b) \, upright(u s b) - upright(l s b) }$)
can be computed by an incoherent sum:
$ tilde(X)^y = sqrt(sum_omega \( 2 \| C_(tau \, omega)^y \| tilde(x)_omega \)^2) = 2 sqrt(sum_omega \( \| C_(tau \, omega)^y \| tilde(x)_omega \)^2) \, $<eq:Xy>
where $tilde(x)_omega$ is the ASD of the noise $x$ at a relevant
frequency $omega$ in one of the two beams, and $C_(tau \, omega)^y$ is
its time-domain coupling factor to the beatnote $y$.

In the case like LISA where the whole system comprises multiple
heterodyne interferometers with different time-dependent heterodyne
frequencies, a noise requirement should be defined over a wide frequency
band, instead of at specific frequencies. For this purpose,
$tilde(x)_omega$ in #ref(<eq:Xy>) is replaced by a common
broadband noise representation $tilde(x)_(upright(b a n d))$. If a
requirement for $tilde(X)^y$ is written by
$tilde(X)_(upright(r e q))^y$, one way to formulate the requirement of
the individual noise source would be the following:
$ tilde(x)_(upright(b a n d \, r e q)) & = min_(y in { upright(c a r) \, upright(u s b) \, upright(l s b) \, upright(u s b) - upright(l s b) }) tilde(x)_(upright(b a n d \, r e q))^y\
 & = min_(y in { upright(c a r) \, upright(u s b) \, upright(l s b) \, upright(u s b) - upright(l s b) }) frac(tilde(X)_(upright(r e q))^y, 2 sqrt(sum_omega \| C_(tau \, omega)^y \|^2)) . $<eq:x_band>

#block[
#figure(
  align(center)[#table(
    columns: 2,
    align: (center,center,),
    table.header([Parameter], [Value],),
    table.hline(),
    [], [],
    [Nominal carrier heterodyne frequency
    $f_(upright(h e t))$], [10~MHz],
    [Carrier heterodyne bandwidth], [30~MHz],
    [Modulation frequency offset $Delta f_(upright(m))$], [1.245~MHz],
    [Modulation depth $m_0$], [0.584~rad],
    [EOM $V_pi$], [3.5~V],
    [Phase extraction requirement (carrier)
    $tilde(X)_(upright(r e q))^(upright(c a r))$], [0.6~μrad~#super[−1]],
    [Phase extraction requirement (sidebands)
    $tilde(X)_(upright(r e q))^(upright(s b))$], [60~μrad~#super[−1]],
  )]
  , caption: [Parameters used to derive requirements. The phase
  extraction requirement $tilde(X)_(upright(r e q))^(upright(s b))$ is
  applied to either of usb, lsb, or their combination ("usb-lsb") in
  #ref(<eq:sbcombi>). ]
  , kind: table
  )

] <tab:req_param>
Using LISA-like parameters in #link(<tab:req_param>)[3], we apply
#ref(<eq:x_band>) to individual noise sources and
compute heterodyne-band requirements, as shown in
#link(<fig:het_noise_req>)[8]. All markers are based on the nominal
heterodyne frequency of 10~MHz. However, it varies up to the heterodyne
bandwidth 30~MHz over time; therefore, the requirements are defined to
the double heterodyne frequency 60~MHz.
$tilde(x)_(upright(b a n d \, r e q))^y$ in
#ref(<eq:x_band>) for
$y in { upright(c a r) \, upright(u s b) \, upright(u s b) - upright(l s b) }$
is shown in black, orange, and cyan horizontal lines, and the minimum
one out of the three becomes a requirement. With the particular
parameters in #link(<tab:req_param>)[3], the noise coupling to the
carrier phase extraction is dominant and determines the requirements on
all noise sources:
$tilde(x)_(upright(b a n d \, r e q)) = tilde(x)_(upright(b a n d \, r e q))^(upright(c a r))$.
Apart from the carrier, it would be notable that the combination of the
sideband phases in #ref(<eq:sbcombi>) is particularly
helpful to mitigate the coupling of the laser noise, the top panel of
#link(<fig:het_noise_req>)[8], because it could relax the requirement
derived from the sideband phase extraction by more than one order of
magnitude:
$tilde(p)_(upright(b a n d \, r e q))^(upright(u s b - l s b)) gt.double tilde(p)_(upright(b a n d \, r e q))^(upright(u s b))$.
The results are also summarized in #link(<tab:req_results>)[4].

#figure(image("source/het_noise_req.pdf", width: 8.6cm),
  caption: [
    Requirements on noise sources ($p_i$, $v_i$, $a_i$, and $theta_i$)
    with the parameters in #link(<tab:req_param>)[3]. Regarding the
    laser noise in the top panel, we derived the requirement in
    frequency instead of phase following convention. The modulation
    additive voltage noise $v_i$ in the second panel is analyzed from
    the laser phase noise via $V_pi$ as shown in
    #ref(<eq:m_i>). Markers show individual contributions
    to the requirement levels $tilde(x)_(upright(b a n d \, r e q))^y$
    in #ref(<eq:x_band>):
    $tilde(X)_(upright(r e q))^y \/ 2 sqrt(\| C_(tau \, omega)^y \|^2)$.
    Due to the reciprocal formulation, the individual contributions are
    higher than the resulting sum for each $y$. However, for
    #ref(<eq:x_band>) the minimum (and therefore most
    stringent) of each y (sum) is chosen as a requirement. Although the
    markers are computed with the nominal carrier heterodyne frequency
    of 10~MHz, it varies from 5~MHz--30~MHz in the LISA case; hence, the
    requirement is defined up to the double heterodyne frequency, namely
    60~MHz.
  ]
)
<fig:het_noise_req>

#block[
#figure(
  align(center)[#table(
    columns: 3,
    align: (center,center,center,),
    table.header([Noise], [Requirement], [Dominant coupling],),
    table.hline(),
    [], [], [],
    [$dot(p)_i$], [3.84~Hz~#super[−1]], [$p_i \( Delta omega_(upright(m)) \)$
    \[usb,lsb$arrow.r$car\]],
    [$v_i$], [659~nV~#super[−1]], [$p_i \( 2 omega_(upright(h e t)) \)$
    \[car$arrow.r$car\]],
    [$a_i$], [2.82~×~10#super[−6]~1~#super[−1]], [$a_i \( 2 omega_(upright(h e t)) \)$
    \[car$arrow.r$car\]],
    [$theta_i$], [35.0~μrad~#super[−1]], [$theta_i \( 2 omega_(upright(h e t)) plus.minus Delta omega_(upright(m)) \)$
    \[usb,lsb$arrow.r$car\]],
  )]
  , caption: [Summary of the requirements shown in
  #link(<fig:het_noise_req>)[8] with the LISA-like parameters in
  #link(<tab:req_param>)[3]. Dominant coupling shows the coupling path
  in brackets, which tells if it is self or mutual noise coupling (also
  see #ref(<tab:noise_couplings>)). ]
  , kind: table
  )

] <tab:req_results>
In this section, we demonstrate only the use case of heterodyne-band
noise analysis. Necessary requirements highly depend on experiments and
their verification approach. It would also be possible to set up a
verification test in such a way that the modulation-band noise is
naturally tested by looking at just a noise floor in the heterodyne band
as it couples via the heterodyne band, as shown in
#link(<fig:ghz_diagram>)[3].

= Conclusion
<sec:conclusion>
Heterodyne interferometry is a versatile tool used in many fields of
precision science. The technology is often combined with a laser phase
modulation to extract additional information of an experimental setup,
e.g., intersatellite clock noise transfer for GW detection in space.

In this paper, in the format of spaceborne GW detectors, we study
additional noise couplings caused by the phase modulation especially in
the high frequency regimes like heterodyne or modulation bands, which
were not well explored before. In addition to the modulation noise, the
laser noise is also discussed in the same framework. In
#link(<sec:het_band>)[3], we systematically derive all possible noise
couplings from the heterodyne band based on interactions between
heterodyne beatnotes in a PR signal in #ref(<eq:spr>). All
couplings found are listed in
#ref(<tab:noise_couplings>). In
#link(<sec:mod_band>)[4], we shift the frequency band of interest to the
even higher frequency regime, i.e., the modulation band. We show that in
this case, we can first rewrite the noise in a different form via
trigonometric analysis or sideband analysis, focusing on a single
electromagnetic field. This enables us to transform the noise in the
modulation band to the noise in the heterodyne band with amplitude
scaling factors, which then can be combined with the discussion in
#link(<sec:het_band>)[3] to compute the total coupling factor. In
#link(<sec:verification>)[5], we verify the couplings derived
analytically by comparison with the numerical simulation. Contrary to
the analysis, the simulation does not rely on any approximation, e.g.,
the first-order approximation. Therefore, the agreement between the
analysis and the simulation confirms that our analytical framework
successfully captures primary noise couplings. Finally, in
#link(<sec:application>)[6], we demonstrate a use case of this study
taking the LISA-like setup as an example. This show how we could derive
requirements on each noise source ($p_i \, v_i \, a_i \,$ and $theta_i$)
based on the target precision of phase extraction by a phasemeter and
the noise coupling factors derived in this paper.

It should be noted that unlike the aliased laser frequency
noise~@Yamamoto2022@Staab2024@Vidal2025, the coupling of the
high-frequency noise discussed in this paper cannot be suppressed by any
filtering. This means that the only possible treatment is to mitigate
the noise sources themselves or fine-tune a few parameters like
$Delta omega_(upright(m))$. In addition, although a pseudorandom-noise
(PRN) signal for the intersatellite absolute
ranging~@Sutton2010@Esteban2011@Xie2023@Yamamoto2024@Euringer2024@Yamamoto2025
is not explicitly discussed, it can be considered as a constituent of
the additive voltage noise $v_i$ in the phase modulation signal in
#ref(<eq:Vmi>). As discussed in #link(<sec:framework>)[2],
$v_i$ turns into $n_i$ in the optical domain, which is indistinguishable
from the laser phase noise $p_i$\; therefore, the discussion of the
laser phase noise $p_i$ is also informative for the design of binary PRN
codes and their spectra. Also, we remark that if we utilize optical
frequency comb for clock
treatment~@Tinto2015@Vinckier2020@Tan2022@Yamamoto2025B, we could remove
the EOM, which as a result eliminates any noise couplings in this paper,
except for the self noise coupling for the carrier in
#ref(<tab:noise_couplings>):
$p_i \( epsilon.alt \)$ and $p_i \( 2 omega_(upright(h e t)) \)$.

We expect that this study establishes a good demonstration of the
systematic search for noise coupling in heterodyne interferometry or
precision optical metrology systems more in general. Besides, in the
context of spaceborne GW detectors, the result is expected to provide
necessary information to define requirements on essential devices, like
laser transmitters and phase modulators. A future work is to explore the
high-frequency noise in the format of spaceborne GW detectors more
deeply: the behaviour of these high-frequency noises in time-delay
interferometry~@Tinto1999@Vallisneri2005.

#block[
K.Y., H.L., K.N., and R.D. acknowledge the support from the NASA Physics
of the Cosmos (PhysCOS) program. K.Y.'s work is supported by NASA under
Award No. 80GSFC24M0006. H.L.'s work is supported by the NASA Space
Technology Mission Directorate Early Career Initiative Award.

O.H. and L.W. gratefully acknowledge the support by the Deutsches
Zentrum für Luft- und Raumfahrt (DLR) with funding of the Federal
Ministry for Economic Affairs and Energy based on a resolution of the
Deutsche Bundestag (FKZ 50OQ1801 and FKZ 50OQ2301).

]
= Additive readout noise
<sub:framework_readout>
Let us derive a general formula for the coupling of additive readout
noise in phase extraction with a phasemeter based on its working
principle~@Shaddock2006. The phase-locked loop (PLL) on a phasemeter
extracts the phase of the input sinusoidal signal with a band-pass
effect around the input signal frequency. As an input to the phasemeter,
we consider the following signal:
$ s = k cos \( omega tau + phi.alt_k \) + l cos \( \( omega + epsilon.alt \) tau + phi.alt_l \) \, $<eq:s_add>
where the first term is a primary signal and $phi.alt_k$ is a target
phase to extract, and the second term is the monotonic representation of
the additive noise at $omega + epsilon.alt$ where
$epsilon.alt lt.double omega$. We assume that the noise amplitude $l$ is
much smaller than the nominal signal amplitude $k$: $l lt.double k$. The
scope is how the second term disturbs the phase extraction of the first
term.

We model the phase extraction by a simple I/Q demodulation. The I and Q
values are formulated by $ I & = s dot.op cos \( omega tau \)\
 & = k cos \( omega tau + phi.alt_k \) dot.op cos \( omega tau \) + l cos \( \( omega + epsilon.alt \) tau + phi.alt_l \) dot.op cos \( omega tau \)\
 & arrow.r_()^(upright("LPF")) \( k cos phi.alt_k + l cos \( epsilon.alt tau + phi.alt_l \) \) \/ 2 \,\
Q & = s dot.op sin \( omega tau \)\
 & = k cos \( omega tau + phi.alt_k \) dot.op sin \( omega tau \) + l cos \( \( omega + epsilon.alt \) tau + phi.alt_l \) dot.op sin \( omega tau \)\
 & arrow.r_()^(upright("LPF")) \( k sin phi.alt_k + l sin \( epsilon.alt tau + phi.alt_l \) \) \/ 2 \, $<eq:IQ>
where “LPF\" represents the low-pass filtering to filter out the second
harmonic of the input signal. The phase extraction is achieved by
$arctan$ of their ratio as
$ phi.alt_(upright(r e a d)) & = arctan \( Q \/ I \)\
 & = arctan \( frac(k sin phi.alt_k + l sin \( epsilon.alt tau + phi.alt_l \), k cos phi.alt_k + l cos \( epsilon.alt tau + phi.alt_l \)) \)\
 & approx phi.alt_k + phi.alt_(upright(e r r)) \,\
phi.alt_(upright(e r r)) & = l \/ k dot.op sin \( epsilon.alt tau + phi.alt_l - phi.alt_k \) \, $<eq:IQdemod>
where $l lt.double k$ is used in the last line in
#ref(<eq:IQdemod>). This suggests that the phase noise
amplitude is determined by the ratio of the noise amplitude $l$ to the
signal amplitude $k$ in the input signal in
#ref(<eq:s_add>). Also, the resulting angular frequency
of the noise is $epsilon.alt$\; therefore, if the angular frequency
offset $epsilon.alt$ is in the science observation band (namely 0.1~mHz
to 1~Hz for LISA), the noise appears in the final phase readout in the
band. Although we model phase extraction with I/Q demodulation in this
section, the noise coupling does not change in the PLL-based phasemeter
as long as the tracking bandwidth is sufficiently higher than the
frequencies of the signal of interest.

= Coupling factor conversion
<app:conversion>
In this paper, we use a monotonic noise representation and analyze its
coupling to a measured phase in the time domain. However, in practice,
the noise to deal with is stochastic, and we are interested in its
coupling to the measured phase in terms of the amplitude spectral
density (ASD) in the frequency domain. In this section, the conversion
of the coupling factor between the time and frequency domains is
discussed.

Following #ref(<eq:x_i>), let us define the monotonic
noise $n$ in the time domain,
$ n \( tau \) = m_(upright(n)) cos \( omega_(upright(n)) tau + rho \) \, $<eq:noise_representation>
where $omega_(upright(n))$ is an angular frequency. As discussed in
#link(<sub:framework_readout>)[8], of our interest is the sum of the
signal frequency $omega_s$ (or a frequency that results in $omega_s$
after some down- or up-conversions) and a small offset $epsilon.alt$ in
the observation band: $omega_(upright(n)) = omega_s + epsilon.alt$.
$rho$ is a given stochastic phase. $m_(upright(n))$ is also random;
however, considering it as a long-term rms value, it can be replaced by
$ m_(upright(n)) & = sqrt(2) dot.op sqrt(2 n_0 b) \, $<eq:m_n_n0> as
discussed around Eq. (26) in @Wissel2022. Assuming a white noise, $n_0$
is the noise floor in power spectral density (PSD), and
$b = 1 med upright("Hz")$, which is the white noise bandwidth we
consider. The factor of $sqrt(2)$ in #ref(<eq:m_n_n0>)
reflects the fact that the mixing process in PLL of a phasemeter wraps
the uncorrelated noise powers below and above the primary signal
frequency $omega_s$ (namely, at
$omega_(upright(n)) = omega_s plus.minus epsilon.alt$) around
$f = 0 med upright("Hz")$, which result in the phase noise at
$epsilon.alt$ with the PSD noise floor increased by $2$ in the
phasemeter output. Therefore, to represent the total coupling of the
noise at $omega_(upright(n))$ by a single monotonic tone in
#ref(<eq:noise_representation>), we
applied a factor of $sqrt(2)$ to $m_(upright(n))$ in
#ref(<eq:m_n_n0>).

An important question is how to relate a noise coupling factor of
$n \( tau \)$ to the one of the PSD (or ASD) noise floor $n_0$ (or
$sqrt(n_0)$). In other words, we need to drive the relation between the
coupling factors of $C_tau$ in the time domain and $C_(upright(a s d))$
in units of ASD in the following expressions of the phasemeter output
phases,
$ phi.alt_(upright(r e a d)) \( tau \) & = phi.alt \( tau \) + C_tau dot.op m_(upright(n)) sin \( epsilon.alt_n tau + rho - phi.alt \) \,\
S_(phi.alt_(upright(r e a d))) \( omega \) & = S_phi.alt \( omega \) + C_(upright(a s d))^2 dot.op n_0 . $<eq:phi_read_time>
#ref(<eq:phi_read_time>) is written in the time
domain, while #ref(<eq:phi_read_time>) is in
units of PSD. $sin \( epsilon.alt_n tau + rho - phi.alt \)$ comes from
the down-conversion of the noise in
#ref(<eq:noise_representation>) by a
given target signal represented by $cos \( omega_s + phi.alt \)$. This
happens in the mixing process on a phasemeter. $phi.alt$ is the target
phase to extract, and $S_phi.alt$ is its PSD.

We can now derive the noise coupling in PSD from the time-domain
expression in #ref(<eq:phi_read_time>) by
calculating its variance and normalizing it by a 1~Hz bandwidth ($= b$),
$ S_n approx E \[ \( C_tau dot.op m_(upright(n)) sin \( epsilon.alt_n tau + rho - phi.alt \) \)^2 \] \/ b = 2 C_tau^2 n_0 . $<eq:S_n>
By equating it to the noise term in
#ref(<eq:phi_read_time>), we end up with
$ 2 C_tau^2 n_0 & = C_(upright(a s d))^2 dot.op n_0\
 & arrow.l.r.double C_(upright(a s d)) = sqrt(2) \| C_tau \| . $<eq:Casd_Ctau>
Therefore, we can easily switch between the noise coupling factor in the
time and frequency domain via a factor of $sqrt(2)$. Considering this
fact, the discussion in
#ref(label("sec:het_band")), #ref(label("sec:mod_band")),
including the summary in
#ref(<tab:noise_couplings>), sticks to the
time domain.

= Single sideband
<app:ssb>
We recall the formulation of a single sideband here. Let us consider an
electromagnetic field at $omega$ with a single sideband at $Delta omega$
$ E & = A \( 1 + a upright(e)^(j Delta omega t) \) upright(e)^(j omega t) \, $<eq:E_ussb>
where we assume $Delta omega > 0$\; hence, this is an upper single
sideband. #ref(<eq:E_ussb>) suggests that the single
sideband modulates both the phase and the amplitude of the field. If we
decompose this into amplitude and phase, we get
$ E & = A \( 1 + a / 2 upright(e)^(j Delta omega t) + a / 2 upright(e)^(j Delta omega t) + a / 2 upright(e)^(- j Delta omega t) - a / 2 upright(e)^(- j Delta omega t) \) upright(e)^(j omega t)\
 & = A \( 1 + a / 2 \( upright(e)^(j Delta omega t) + upright(e)^(- j Delta omega t) \) + a / 2 \( upright(e)^(j Delta omega t) - upright(e)^(- j Delta omega t) \) \) upright(e)^(j omega t)\
 & approx A \( 1 + a / 2 \( upright(e)^(j Delta omega t) + upright(e)^(- j Delta omega t) \) \) dot.op \( 1 + a / 2 \( upright(e)^(j Delta omega t) - upright(e)^(- j Delta omega t) \) \) upright(e)^(j omega t)\
 & approx A \( 1 + a cos \( Delta omega t \) \) upright(e)^(j \( omega t + a cos \( Delta omega t - pi \/ 2 \) \)) . $<eq:E_ussb2>
Therefore, the upper single sideband can be interpreted as the
combination of an amplitude modulation and a coherent phase modulation
with the phase delay of $pi \/ 2$. The lower single sideband can be
easily derived with the replacement as
$Delta omega arrow.r - Delta omega$,
$ E & = A \( 1 + a upright(e)^(- j Delta omega t) \) upright(e)^(j omega t)\
 & approx A \( 1 + a cos \( - Delta omega t \) \) upright(e)^(j \( omega t + a sin \( - Delta omega t \) \))\
 & = A \( 1 + a cos \( Delta omega t \) \) upright(e)^(j \( omega t + a cos \( Delta omega t + pi \/ 2 \) \)) . $<eq:E_lssb>
Hence, the lower single sideband can be interpreted as the combination
of the amplitude modulation and the coherent phase modulation with the
phase advancement of $pi \/ 2$. Note that the amplitude of the single
sideband $a$ directly becomes the amplitude of the amplitude and phase
modulations.

= modulation-band noise with the $2 omega_(upright(h e t))$ offset
<app:2fhet>
Similarly as #link(<sub:mod_band_coherence>)[4.3], we provide the
coherence analysis of various coupling paths from the modulation-band
noise with the $2 omega_(upright(h e t))$ offset from the integer
multiple of the modulation frequency $omega_(m \, i)$ in this section.
According to #ref(<eq:pi2ai_2thetai>), the laser
phase noise $p_i$ at $omega_(m \, i) + 2 omega_(upright(h e t))$ becomes

#block[
$ p_i \( omega_(upright(m) \, i) + 2 omega_(upright(h e t)) \; m_(upright(p)) \, rho \) & arrow.r {a_i \( 2 omega_(upright(h e t)) \; m_(upright(p)) / m_0 \, rho - phi.alt_(upright(t a r) \, i)^(upright(s b)) \)\
theta_i \( 2 omega_(upright(h e t)) \; m_(upright(p)) / m_0 \, rho - phi.alt_(upright(t a r) \, i)^(upright(s b)) - pi / 2 \)\
 & arrow.r_(upright("extraction"))^(upright("phase")) cases(delim: "{", - m_(upright(p)) / m_0 dot.op frac(m_0^2, 4 J_0 \( m_0 \)) sin \( rho - phi.alt_(upright(t a r) \, i)^(upright(s b)) - 2 phi.alt_(upright(t a r))^(upright(c a r)) \) + 0 = - frac(m_(upright(p)) m_0, 4 J_0 \( m_0 \)) sin \( rho - phi.alt_(upright(t a r) \, i)^(upright(s b)) - 2 phi.alt_(upright(t a r))^(upright(c a r)) \) & upright("for ") phi.alt_(upright(r e a d))^(upright(c a r)), m_(upright(p)) / m_0 dot.op 1 / 2 sin \( rho - phi.alt_(upright(t a r) \, i)^(upright(s b)) - 2 phi.alt_(upright(t a r))^(upright(c a r)) \) + m_(upright(p)) / m_0 dot.op 1 / 2 cos \( rho - phi.alt_(upright(t a r) \, i)^(upright(s b)) - 2 phi.alt_(upright(t a r))^(upright(c a r)) - pi / 2 \) = m_(upright(p)) / m_0 sin \( rho - phi.alt_(upright(t a r) \, i)^(upright(s b)) - 2 phi.alt_(upright(t a r))^(upright(c a r)) \) & upright("for ") phi.alt_(upright(r e a d))^(upright(u s b)), m_(upright(p)) / m_0 dot.op 1 / 2 sin \( rho - phi.alt_(upright(t a r) \, i)^(upright(s b)) - 2 phi.alt_(upright(t a r))^(upright(c a r)) \) - m_(upright(p)) / m_0 dot.op 1 / 2 cos \( rho - phi.alt_(upright(t a r) \, i)^(upright(s b)) - 2 phi.alt_(upright(t a r))^(upright(c a r)) - pi / 2 \) = 0 & upright("for ") phi.alt_(upright(r e a d))^(upright(l s b)) .) $<eq:pi_fm2fhet>
Following
#ref(label("eq:pi_2fm_viasb")),
the laser phase noise $p_i$ at
$2 omega_(upright(m) \, i) + 2 omega_(upright(h e t))$ becomes
$ p_i \( 2 omega_(upright(m) \, i) & + 2 omega_(upright(h e t)) \; m_(upright(p)) \, rho \)\
 & arrow.r_(upright("extraction"))^(upright("phase")) cases(delim: "{", 0 & upright("for ") phi.alt_(upright(r e a d))^(upright(c a r)), hat(a)_i \( 2 omega_(upright(h e t)) \; m_p / 2 \, rho - 2 phi.alt_(upright(t a r) \, i)^(upright(s b)) - pi / 2 \) + hat(theta)_i \( 2 omega_(upright(h e t)) \; m_p / 2 \, rho - 2 phi.alt_(upright(t a r) \, i)^(upright(s b)) - pi \) = - m_(upright(p)) / 2 cos \( rho - 2 phi.alt_(upright(t a r) \, i)^(upright(s b)) - 2 phi.alt_(upright(t a r))^(upright(c a r)) \) & upright("for ") phi.alt_(upright(r e a d))^(upright(u s b)), hat(a)_i \( 2 omega_(upright(h e t)) \; m_p / 2 \, rho - 2 phi.alt_(upright(t a r) \, i)^(upright(s b)) + pi / 2 \) + hat(theta)_i \( 2 omega_(upright(h e t)) \; m_p / 2 \, rho - 2 phi.alt_(upright(t a r) \, i)^(upright(s b)) \) = 0 & upright("for ") phi.alt_(upright(r e a d))^(upright(l s b)) .) $<eq:pi_2fm2fhet>
Similarly to #ref(<eq:pi_2fmfinband>), we
express the coupled term of the noise $x_i$ in the measured phases by
$hat(x)_i$. According to
#ref(<tab:noise_couplings>),
$a_i \( 2 omega_(upright(h e t)) \)$ and
$theta_i \( 2 omega_(upright(h e t)) \)$ are the mutual noise coupling
between the usb-usb and lsb-lsb beatnotes: the lsb-lsb beatnote affects
$phi.alt_(upright(r e a d))^(upright(u s b))$, or vice versa. Hence,
#ref(label("eq:pi_2fm_viasb"))
are applied to $phi.alt_(upright(r e a d))^(upright(l s b))$ and
$phi.alt_(upright(r e a d))^(upright(u s b))$, respectively.

On the other hand, from
#ref(label("eq:ai2pi")), #ref(label("eq:pi_2fm2fhet")),
the modulation amplitude noise at
$omega_(upright(m) \, i) + 2 omega_(upright(h e t))$ and
$2 omega_(upright(m) \, i) + 2 omega_(upright(h e t))$ couples as,
$ a_i \( omega_(upright(m) \, i) + 2 omega_(upright(h e t)) \; m_(upright(a)) \, rho \) & arrow.r p_i \( 2 omega_(upright(h e t)) \; frac(m_0 m_(upright(a)), 2) \, rho - phi.alt_(upright(t a r) \, i)^(upright(s b)) \) + p_i \( 2 omega_(upright(m) \, i) + 2 omega_(upright(h e t)) \; frac(m_0 m_(upright(a)), 2) \, rho + phi.alt_(upright(t a r) \, i)^(upright(s b)) \)\
 & arrow.r_(upright("extraction"))^(upright("phase")) cases(delim: "{", - frac(m_0 m_(upright(a)), 4) cos \( rho - phi.alt_(upright(t a r) \, i)^(upright(s b)) - 2 phi.alt_(upright(t a r))^(upright(c a r)) \) + 0 = - frac(m_0 m_(upright(a)), 4) cos \( rho - phi.alt_(upright(t a r) \, i)^(upright(s b)) - 2 phi.alt_(upright(t a r))^(upright(c a r)) \) & upright("for ") phi.alt_(upright(r e a d))^(upright(c a r)), - frac(m_0 m_(upright(a)), 4) cos \( rho - phi.alt_(upright(t a r) \, i)^(upright(s b)) - 2 phi.alt_(upright(t a r))^(upright(c a r)) \) - frac(m_0 m_(upright(a)), 4) cos \( rho - phi.alt_(upright(t a r) \, i)^(upright(s b)) - 2 phi.alt_(upright(t a r))^(upright(c a r)) \) = - frac(m_0 m_(upright(a)), 2) cos \( rho - phi.alt_(upright(t a r) \, i)^(upright(s b)) - 2 phi.alt_(upright(t a r))^(upright(c a r)) \) & upright("for ") phi.alt_(upright(r e a d))^(upright(u s b)), - frac(m_0 m_(upright(a)), 4) cos \( rho - phi.alt_(upright(t a r) \, i)^(upright(s b)) - 2 phi.alt_(upright(t a r))^(upright(c a r)) \) + 0 = - frac(m_0 m_(upright(a)), 4) cos \( rho - phi.alt_(upright(t a r) \, i)^(upright(s b)) - 2 phi.alt_(upright(t a r))^(upright(c a r)) \) & upright("for ") phi.alt_(upright(r e a d))^(upright(l s b)) \,)\
a_i \( 2 omega_(upright(m) \, i) + 2 omega_(upright(h e t)) \; m_(upright(a)) \, rho \) & arrow.r {a_i \( 2 omega_(upright(h e t)) \; m_(upright(a)) / 2 \, rho - 2 phi.alt_(upright(t a r) \, i)^(upright(s b)) \)\
theta_i \( 2 omega_(upright(h e t)) \; m_(upright(a)) / 2 \, rho - 2 phi.alt_(upright(t a r) \, i)^(upright(s b)) - pi / 2 \)\
 & arrow.r_(upright("extraction"))^(upright("phase")) cases(delim: "{", - frac(m_0^2 m_(upright(a)), 8 J_0 \( m_0 \)) sin \( rho - 2 phi.alt_(upright(t a r))^(upright(c a r)) - 2 phi.alt_(upright(t a r) \, i)^(upright(s b)) \) + 0 = - frac(m_0^2 m_(upright(a)), 8 J_0 \( m_0 \)) sin \( rho - 2 phi.alt_(upright(t a r))^(upright(c a r)) - 2 phi.alt_(upright(t a r) \, i)^(upright(s b)) \) & upright("for ") phi.alt_(upright(r e a d))^(upright(c a r)), m_(upright(a)) / 4 sin \( rho - 2 phi.alt_(upright(t a r) \, i)^(upright(s b)) - 2 phi.alt_(upright(t a r))^(upright(c a r)) \) + m_(upright(a)) / 4 cos \( rho - 2 phi.alt_(upright(t a r) \, i)^(upright(s b)) - 2 phi.alt_(upright(t a r))^(upright(c a r)) - pi / 2 \) = m_(upright(a)) / 2 sin \( rho - 2 phi.alt_(upright(t a r) \, i)^(upright(s b)) - 2 phi.alt_(upright(t a r))^(upright(c a r)) \) & upright("for ") phi.alt_(upright(r e a d))^(upright(u s b)), m_(upright(a)) / 4 sin \( rho - 2 phi.alt_(upright(t a r) \, i)^(upright(s b)) - 2 phi.alt_(upright(t a r))^(upright(c a r)) \) - m_(upright(a)) / 4 cos \( rho - 2 phi.alt_(upright(t a r) \, i)^(upright(s b)) - 2 phi.alt_(upright(t a r))^(upright(c a r)) - pi / 2 \) = 0 & upright("for ") phi.alt_(upright(r e a d))^(upright(l s b)) .) $<eq:ai_fm2fhet>

]
Regarding the modulation phase noise,
$theta_i$\($omega_(upright(m) \, i) + 2 omega_(upright(h e t))$)
effectively has the additional minus sign in the coupling from
$p_i$\($2 omega_(upright(m) \, i) + 2 omega_(upright(h e t))$) to that
of #ref(<eq:ai_fm2fhet>) because
#ref(<eq:ai2pi>) suggests the $pi$ phase shift
between $p_i$\($2 omega_(upright(h e t)) \)$ and
$p_i$\($2 omega_(upright(m) \, i) + 2 omega_(upright(h e t)) \)$.
Concerning
$theta_i$\($2 omega_(upright(m) \, i) + 2 omega_(upright(h e t))$), the
result (to be precise, the coupled noise amplitude) is effectively the
same as $a_i$\($2 omega_(upright(m) \, i) + 2 omega_(upright(h e t))$)
above because both
#ref(label("eq:ai2pi2ai"))
show the same relative phase shift between the resulting $a_i$ and
$theta_i$: the $pi \/ 2$ delay of $theta_i$ against $a_i$.

#bibliography("source/main.bib", style: "ieee", title: [References])
