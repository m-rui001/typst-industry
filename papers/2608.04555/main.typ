#set page(paper: "us-letter", margin: (x: 47pt, y: 50pt), numbering: "1")
#set text(font: "New Computer Modern", size: 10pt)
#set par(justify: true, leading: 0.56em)
#set heading(numbering: "1")
#set math.equation(numbering: "(1)")
#show figure.caption: set text(size: 9pt)
#show figure.where(kind: table): set figure.caption(position: top)
#show table: set text(size: 8.5pt)
#show table: set table(inset: (x: 3pt, y: 3pt))

#title[Photogalvanic second harmonic generation in Si#sub[3]N#sub[4] for 1 Hz level on-chip metrology and spectroscopy]

#align(center)[Andrei Diakonov#super[1], Roy Zektzer#super[2], Xiyuan Lu#super[3,4], Kartik Srinivasan#super[3,4], and Liron Stern#super[1]]

#align(center, text(size: 8.5pt)[
  #super[1] Institute of Applied Physics, The Hebrew University of Jerusalem, Israel \
  #super[2] Alexander Kofkin Faculty of Engineering, Bar-Ilan University, Israel \
  #super[3] Physical Measurement Laboratory, National Institute of Standards and Technology, Gaithersburg, MD, USA \
  #super[4] Joint Quantum Institute, University of Maryland, College Park, MD, USA
])

#pad(x: 25pt)[The coherent photogalvanic (PG) effect induces an effective
$chi^(\( 2 \))$ nonlinearity in the widely available but natively
$chi^(\( 3 \))$ silicon nitride integrated photonic platform, unlocking
a pathway toward chip-scale precision spectroscopy and optical
clockworks. In the context of second harmonic generation (SHG), the
underlying physics relies on the induction of an internal electric field
whose character depends on the phase matching approach. When the
fundamental and second harmonic waves are directly phase-matched,
typically through an intermodal scheme, a spatially uniform electric
field is created. When there is a phase-mismatch between fundamental and
second harmonic, a spatially-varying electric field is generated, and
enables quasi phase-matching. Even though the quasi phase-matching
approach is highly flexible and tunable, it has been shown that it can
be accompanied by an offset of the second harmonic frequency, dependent
on the pump power and detuning. This raises the question of whether
direct phase matching can support metrologically compatible SHG. Here,
we test the preservation of the (2:1) frequency ratio in directly
phase-matched PG-SHG by comparing the fundamental and doubled optical
frequencies in a silicon nitride microresonator. We find a $< 1$~Hz
frequency offset, in contrast to previous observations in
quasi-phase-matched PG-SHG. Furthermore, we measure a residual
fractional frequency instability of the PG-SHG induced noise of
$2 times 10^(- 15)$ at 1~s, averaging down to the $10^(- 16)$ level at
1000~s, with deviations from exact doubling below 1 Hz over multi-hour
operation, serving as an upper bound on any additional instability
introduced by the PG-SHG process. Together, these results establish
directly phase-matched PG-SHG as a metrologically compatible route to
effective $chi^(\( 2 \))$ functionality in silicon nitride, combining
sub-Hz frequency-ratio fidelity with low residual instability and high
coherence on a mature integrated photonics platform for optical
clockwork, self-referencing, and precision spectroscopy.]

#columns(2, gutter: 17pt)[
Integrated nonlinear photonics has enabled compact and phase-coherent
light sources for applications in precision spectroscopy, frequency
metrology, optical frequency division, and microwave
generation~@stern2020direct@spencerOpticalfrequencySynthesizerUsing2018@newman2019architecture@sun2024integrated.
Many of these applications require coherent second harmonic generation
(SHG) for their critical functions such as spectral extension for
probing ultra-narrow atomic and molecular transitions and $f$-$2 f$
self-referencing for frequency comb stabilization. Achieving stable and
accurate SHG in a fully integrated platform is therefore of central
importance in precision applications. Platforms that possess an
intrinsic $chi^(\( 2 \))$ nonlinearity, such as lithium
niobate~@zhu2021integrated@boes2023lithium, aluminum
nitride~@guo2016second, and silicon carbide~@lukin20204H, are becoming
increasingly mature and accessible. On the other hand, silicon nitride,
though an amorphous thin film that does not possess a $chi^(\( 2 \))$
nonlinearity in bulk, has been shown to support SHG through the coherent
photogalvanic (PG) effect. Here, a photo-induced DC electric field
combines with the medium's $chi^(\( 3 \))$ nonlinearity to produce an
effective $chi^(\( 2 \))$ response~@porcel2017photo@billat2017large.
Silicon nitride is of particular interest due to its broad transparency
window, high Kerr nonlinearity, ultra-low loss~@blumenthal2018silicon,
CMOS compatibility~@moss2013CMOS, potential for hybrid laser
integration~@tran2022extending@heim2025hybrid and established foundry
fabrication on up to 300~mm wafers~@ou2025300mm. This maturity has
enabled extensive research into nonlinear optical processes including
Kerr frequency comb generation~@gaeta2019photonic, optical parametric
oscillation~@lu2026photonic, second- and third-harmonic
generation~@levy2011harmonic, and cascaded nonlinear optical
processes~@hu2022photo.

#figure(image("source/Figs/Fig_1_concept.pdf", width: 90.0%), placement: top, scope: "parent",
  caption: [
    Highly stable photogalvanic second harmonic generation (PG-SHG): a)
    Schematic description of the PG-SHG physical mechanism based on
    direct phase-matching (PM) and potential additional noise
    $epsilon.alt$ introduced by the process, for example, due to charge
    dynamics associated with the DC electric field
    (E$""_(upright("DC"))$) creation via the PG effect. b) Long-term
    stability requirement: the effect of $epsilon.alt$ is negligible
    only when it is masked by a target system whose instability
    (represented by the Overlapping Allan deviation - OADev) is
    sufficiently large. c) Any noise $epsilon.alt$ associated with
    PG-SHG can affect the stability of the optical clock output
    ($f_(r e p)$ and carrier envelope offset frequency, $f_(C E O)$, is
    dependent on $epsilon.alt$), as well as the performance of high-end
    PG-SHG atomic spectroscopy.
  ]
)
<fig:concept>

PG-SHG can be achieved through two main phase-matching approaches:
quasi-phase matching, where phase-mismatch between fundamental and
second harmonic waves creates a spatial modulation of the DC electric
field whose wavenumber automatically compensates the mismatch, and
direct phase matching, where fundamental and second harmonic waves
propagate in modes of different transverse order that have the same
phase velocity. To achieve the efficiency needed for applications such
as self-referencing of octave-spanning microcombs or frequency doubling
of continuous wave lasers, resonant enhancement of SHG is essential. The
above phase-matching strategies have both been implemented in
microrings~@lu2021efficient@nitiss2022optically. The automatic
quasi-phase matching approach~@nitiss2022optically has been particularly
compelling with regards to its flexibility, with recent achievements
including ultra-broadband SHG in reconfigurable coupled-ring
structures~@clementi2025ultrabroadband, and its combination with
self-injection locking to achieve low-phase-noise lasers near 780~nm and
532~nm~@li2023high@wang2026integrated@yuan2025efficient. Recently,
however, work utilizing automatic quasi-phase matching has reported
frequency shifts on the order of 10~Hz to 200~Hz and attributed them to
the PG effect creating a spatio-temporal electric field pattern, with
the shift value related to pump laser power and cavity
detuning~@zhou2025self. Such offsets directly challenge the assumption
that photogalvanic SHG preserves an exact $2 : 1$ frequency relationship
and therefore raise a fundamental concern for its use in precision
frequency conversion. It remains unknown whether these offsets are
intrinsic to the photogalvanic mechanism, arise specifically from
automatic quasi-phase matching, or can be avoided through direct phase
matching. Consequently, the long-term frequency accuracy and
metrological fidelity of resonantly enhanced PG-SHG remains unclear.

In this paper, we demonstrate metrologically compatible PG-SHG with
direct phase matching in a silicon nitride microring~@lu2021efficient by
verifying the (2:1) frequency-ratio fidelity. We measure the stability
of the $2 : 1$ frequency ratio between the fundamental and doubled light
and quantify the corresponding fractional frequency instability over
extended timescales. We observe a residual instability at the
$2 times 10^(- 15)$ level at 1~s integration time, averaging down to the
$10^(- 16)$ level at 1000~s, with the deviation from the exact doubling
falling within the margin of the measurement uncertainty, and the
induced nonlinaer response remaining stable for up to 5~hrs. Moreover,
the offset observed due to the pump detuning is of the order of the
measurement uncertainty, in contrast with the aforementioned approach
using the automatic quasi phase-matching approach~@zhou2025self. These
measurements establish an upper bound on the contribution of PG-SHG to
frequency instability and systematic uncertainty, demonstrating that
photogalvanic $chi^(\( 2 \))$ in silicon nitride can support
phase-coherent and stable frequency doubling.

#figure(image("source/Figs/Fig_2_phase_matching.pdf", width: 95.0%), placement: top, scope: "parent",
  caption: [
    Photogalvanic phase matching and experimental setup. a) A silicon
    nitride microring resonator (MRR) in an add-drop configuration is
    used to generate photogalvanic second-harmonic generation (PG-SHG).
    In the quasi-phase-matching (QPM) approach, a dynamic
    spatio-temporal grating is formed, schematically adapted from
    Ref.~@zhou2025self. This grating introduces an additional degree of
    freedom in the energy- and momentum-conservation picture and can
    lead to pump-detuning-dependent offsets of the generated
    second-harmonic frequency. In the direct phase-matching approach,
    phase matching is achieved between two resonator modes of different
    order, avoiding the need for a self-organized QPM grating. Instead,
    we hypothesize that direct phase matching provides a
    detuning-independent frequency-doubling condition with no offset in
    the second harmonic frequency, and examine this hypothesis in this
    work. b) Schematic comparison between QPM-based PG-SHG, where the
    generated second-harmonic frequency can depend on pump detuning, and
    directly phase-matched PG-SHG, where the (2:1) frequency relation is
    expected to be preserved independently of pump detuning. This makes
    direct phase matching particularly attractive for compact optical
    atomic clocks and other precision frequency-conversion applications.
    c) Experimental setup. A pump laser (at 1560~nm) is amplified by an
    erbium-doped fiber amplifier (EDFA) and coupled into the MRR near
    resonance, resulting in PG-SHG (at 780 nm). Fiber-to-chip coupling
    for intracavity-power monitoring and SHG collection is performed
    using lensed fibers (spacing of 160 $mu$m). The pump laser is
    stabilized to a maser-referenced difference-frequency comb (DFC).
    Balanced photodetectors are used to measure the pump and SHG beat
    notes against the DFC, and synchronized frequency counters (FCs) are
    used to extract the deviation ($epsilon.alt$) from exact doubling.
    An electrical spectrum analyzer (ESA) and an oscilloscope are used
    for electrical characterization of the beat signals. The inset shows
    a photograph of the chip during PG-SHG operation, with visible (780
    nm) emission and lensed-fiber tails.
  ]
)
<fig:setup>

Before describing our experimental work in detail, we provide additional
application context in Figure~@fig:concept. In SHG, the generated
frequency can be evaluated as $2 f_0 + epsilon.alt$, where $epsilon.alt$
captures all deviations from ideal doubling, including additional
frequency noise and systematic offsets present in the experimentally
obtained signal (see Fig.@fig:concept \[a\]). The discrepancy can arise
from physical mechanisms, such as the dynamics of the charges which
establish a DC field in the PG effect, as well as from experimental
systematic contributions. We evaluate the stability and frequency
fidelity of PG-SHG in a SiN microring resonator, focusing on the
requirements imposed by future integrated systems for precision
metrology and high-resolution spectroscopy. First, we assess the
frequency accuracy of the process by measuring any systematic offset
from exact doubling. Second, we evaluate the stability of the (2:1)
frequency ratio over time, which determines whether the frequency
uncertainty can average down during extended measurements. Third, we
examine short-time phase noise and coherence preservation, which
determine suitability for narrow-linewidth operation and high-resolution
spectroscopy.

The relevance of the above measurements on applications is illustrated
in Fig.~#ref(<fig:concept>, supplement: none)\(b)-(c). In optical atomic clocks
(Fig.~#ref(<fig:concept>, supplement: none)\(c), top), an optical frequency comb (OFC) is
employed to transfer the relative stability from an optical frequency
atomic reference to the OFC repetition rate (the microwave
output)~@fortier201920. A critical element in this stability transfer,
known as optical frequency division (OFD), is stabilization of the OFC
carrier-envelope offset frequency ($f_(upright("CEO"))$) via
self-referencing with SHG, where any additional noise introduced by the
doubling procedure directly affects the clock output stability. In
high-resolution spectroscopy (Fig.~#ref(<fig:concept>, supplement: none)\(c),bottom), additional
noise introduced in SHG can degrade coherence and compromise accurate
linewidth measurements. We quantify the long-term noise behavior of any
deviation in perfect SHG ($epsilon.alt$) using the Overlapping Allan
Deviation (OADev) as shown in Fig.@fig:concept\(b). By comparing the
OADev of the PG-SHG process to the target stability, we can determine
its impact.

#figure(image("source/Figs/Fig_4_epsilons_alt.pdf", width: 95.0%), placement: top, scope: "parent",
  caption: [
    Photogalvanic SHG offset in direct phase-matching: a) SHG power
    dependence (normalized to the maximum SHG power) on the pump
    detuning. Four measurement points are identified by the solid
    circles, and denote detunings where
    $chevron.l epsilon.alt chevron.r$ was measured (inset). b) Time
    traces of the measurements corresponding to the points shown in (a)
    from which the $chevron.l epsilon.alt chevron.r$ values and
    accompanying error margins were obtained, where the error margins
    are the 95~% confidence intervals of the Allan deviation. c)
    Histogram of the combined measurement (pure statistical type A
    evaluation) consisting of the 4 distinct points in (b), exhibiting a
    gaussian distribution with
    $chevron.l epsilon.alt chevron.r = \( - 0.2 med plus.minus med 1.46 \)$~Hz,
    demonstrating the lack of correlation between the measurements.
  ]
)
<fig:epsilons>

Figure~@fig:setup\(a)-(b) illustrates a potential role of the
phase-matching approach in the above considerations. Quasi
phase-matching produces a spatio-temporal grating that self-adjusts to
the deviation between the pump and its second harmonic~@zhou2025self.
This adjustment results in an additional spatial term $Lambda$ and
temporal term $Omega$ in the energy-momentum conservation picture
(Fig.~#ref(<fig:setup>, supplement: none)\(a)), with $Omega$ depending on the pump detuning with
respect to its corresponding cavity resonance (Fig.~#ref(<fig:setup>, supplement: none)\(b)).
Direct phase-matching does not have an additional spatial term, and our
work addresses whether an additional temporal term (and accompanying
frequency shift) is observed. We do not measure any significant offset
or dependence on the pump frequency (see Fig.@fig:setup\[b\]),
suggesting that PG-SHG can be used for demanding metrology applications.

Our experimental setup is depicted in Fig.~#ref(<fig:setup>, supplement: none)\[c\]. The silicon
nitride microring is designed to provide a direct phase matching between
the pump resonance at frequency $f_0$ and its second harmonic at $2 f_0$
with integrated coupling waveguides at both frequencies
@lu2021efficient. A tunable laser amplified by means of an erbium-doped
fiber amplifier (EDFA) is used as a pump. After second-harmonic
generation is established, the pump laser is stabilized to a table-top
difference-frequency comb (DFC) referenced to a hydrogen maser,
suppressing pump-frequency excursions and enabling a cleaner measurement
of residual deviations from exact frequency doubling. On-chip and
off-chip coupling of light is performed by lensed fibers at 1550~nm and
780~nm, respectively. The large parameter space of the chip in terms of
the number of available devices imposes constraints on efficient input
and output coupling. Specifically, the distance of 160~$mu$m between the
1560~nm lensed fiber and the 780~nm lensed fiber (see
Fig.~#ref(<fig:setup>, supplement: none)\[c\]) forces, in our current realization, the part of
the fibers (up to 5 mm) to be suspended in the air, which might
contribute to the systematic measurement noise. The photonic chip is
mounted on a thermo-electric cooler (TEC), which is used to control the
temperature of the MRR. Finally, balanced detectors are used to monitor
the beat notes of the pump and SHG with respect to the stabilized DFC,
as well as for linewidth and phase noise measurements.

#figure(image("source/Figs/Fig_3_results.pdf"), placement: top, scope: "parent",
  caption: [
    PG-SHG stability and accuracy measurement: (a) Time trace of the SHG
    beat frequency, exhibiting a standard deviation of 3.26 Hz. The four
    segments correspond to successive relocking events. (b) Overlapping
    Allan deviation (OADev) of the SHG beat frequency; each color
    corresponds to a segment in (a), while the grey dashed line shows
    the combined result. The vertical bars indicate the uncertainty of
    each individual run, while the gray shaded region indicates the
    uncertainty (99~% confidence interval) of the combined run. The
    inset shows the beat note obtained by the ESA, which when fit to a
    Lorentzian, has a FWHM of (4.3~$plus.minus$~0.012)~Hz, where the one
    standard deviation uncertainty is obtained from the covariant matrix
    of the nonlinear fit. (c) Phase noise of the SHG beat (top, blue
    trace), together with the corresponding integrated linewidth
    (bottom), yielding a value of 13.5 Hz at 1 rad$""^2$.
  ]
)
<fig:results>

Our experimental setup is depicted in Fig.~#ref(<fig:setup>, supplement: none)\[c\]. The silicon
nitride microring is designed to provide a direct phase matching between
the pump resonance at frequency $f_0$ and its second harmonic at $2 f_0$
with integrated coupling waveguides at both frequencies
@lu2021efficient. A tunable laser amplified by means of an erbium-doped
fiber amplifier (EDFA) is used as a pump. After second-harmonic
generation is established, the pump laser is stabilized to a table-top
difference-frequency comb (DFC) referenced to a hydrogen maser,
suppressing pump-frequency excursions and enabling a cleaner measurement
of residual deviations from exact frequency doubling. On-chip and
off-chip coupling of light is performed by lensed fibers at 1550~nm and
780~nm, respectively. The large parameter space of the chip in terms of
the number of available devices imposes constraints on efficient input
and output coupling. Specifically, the distance of 160~$mu$m between the
1560~nm lensed fiber and the 780~nm lensed fiber (see
Fig.~#ref(<fig:setup>, supplement: none)\[c\]) forces, in our current realization, the part of
the fibers (up to 5 mm) to be suspended in the air, which might
contribute to the systematic measurement noise. The photonic chip is
mounted on a thermo-electric cooler (TEC), which is used to control the
temperature of the MRR. Finally, balanced detectors are used to monitor
the beat notes of the pump and SHG with respect to the stabilized DFC,
as well as for linewidth and phase noise measurements.

To initiate PG-SHG, we set our pump resonance at 1556.9 nm (300 mW input
power) with second harmonic output generated at 778.45 nm. Upon
successful SHG, the microring emits bright red light (100 $mu$W output
power including coupling losses) as is shown in Fig.~#ref(<fig:setup>, supplement: none)\[c\].
Multiplication of the pump frequency by a factor of 2 due to PG-SHG
implies (see supplementary materials) that the ratio between the two
monitored beats (pump and SHG) is also equal to 2. The pump is monitored
prior to entering the chip, while the SHG is measured at the output,
such that the measurement isolates contributions arising from the
nonlinear frequency conversion itself and from experimental systematics,
both encompassed by the $epsilon.alt$ term. The DFC used for beat-note
generation and the associated locking electronics are both referenced to
the same hydrogen maser, suppressing reference-chain inconsistencies.

To identify the specific offset between the pump laser and the MRR
resonance that gives the highest output SHG power and for the further
measurement of the SHG frequency dependence on pump detuning, we scanned
the pump laser and simultaneously monitored the SHG collection port (see
Fig.~#ref(<fig:epsilons>, supplement: none)\[a\]). The double-peak shape of the SHG response
strongly suggests that we are operating at perfectly phase-matched
conditions @roland2016phase. First, we set the pump detuning a few MHz
to the high-frequency side of the resonance peak, achieving highly
stable SHG operation sustained for up to 5 hours. Second, to demonstrate
that the direct phase-matching is largely independent of pump detuning,
we investigated four distinct points across the SHG curve, as shown in
Fig.~#ref(<fig:epsilons>, supplement: none)\(a). The overall pump detuning among all the
measurement points reached 860 MHz, which is a significant portion of
the whole direct phase-matched operation range as can be seen from the
plot. At each point the pump and SHG residual beat notes were monitored
simultaneously using synchronized frequency counters (FCs), and the
resulting time traces are shown in Fig.~#ref(<fig:epsilons>, supplement: none)\[b\]. From the
time traces obtained it was possible to compare the mean value of the
SHG with the mean value of the pump, which is essentially the mean value
of $epsilon.alt$. The values of $chevron.l epsilon.alt chevron.r$ are
shown in the inset of Fig.~#ref(<fig:epsilons>, supplement: none)\[a\] with their corresponding
error margins, and are (-0.6~$plus.minus$~1.07)~Hz,
(1.5~$plus.minus$~1.08)~Hz, (-0.92~$plus.minus$~1.93)~Hz, and
(0.42~$plus.minus$~1.77)~Hz (see Table 1). The error margin is defined
as the 95~% confidence interval of the Allan Deviation (ADev),
representing the statistical uncertainty of the frequency stability
measurements. This measurement demonstrates that for direct
phase-matching in PG-SHG, the pump detuning does not induce an offset in
the second harmonic exceeding the measurement uncertainty---a clear
contrast to the QPM case. The histogram of the combined measurement
consisting of all 4 measurement points (see Fig.~#ref(<fig:epsilons>, supplement: none)\[c\])
shows an even smaller $chevron.l epsilon.alt chevron.r$ of
(-0.2~$plus.minus$~1.46)~Hz, emphasizing the lack of correlation between
the different points.

#figure(
  align(center)[#table(
    columns: 3,
    align: (center,center,center,),
    [Measurement], [Absolute offset \[Hz\]], [Uncertainty \[Hz\]],
    [I], [-0.6], [$plus.minus$ 1.068],
    [II], [1.5], [$plus.minus$ 1.08],
    [III], [-0.92], [$plus.minus$ 1.93],
    [IV], [0.42], [$plus.minus$ 1.77],
  )]
  , caption: [Measured frequency offset of the PG-SHG process as a
  function of cavity detuning.]
  , kind: table
  ) <table1>
Further, we performed a long-term measurement of the SHG residual noise
$epsilon.alt$ to understand its suitability for demanding metrological
applications like optical atomic clocks. The different colors in
Fig.~#ref(<fig:results>, supplement: none)\[a\] denote measurement segments of {60, 40, 60, 20}
minutes, respectively. This segmentation arises from occasional loss of
lock and subsequent relocking. A standard deviation of 3.26 Hz is
obtained over a total measurement time of 3 hours, while the longest
PG-SHG operation obtained could last up to 5 hours. The overlapping
Allan deviation (OADev) obtained from the time traces characterizes the
residual stability of three consecutive measurement runs and of their
combined record. The uncertainty of each individual run is indicated by
vertical bars, while the uncertainty of the combined record is shown by
the pale gray shaded region, and corresponds to a 99~% confidence
interval. The mean value of the residual frequency trace yields an
absolute deviation from exact frequency doubling of
0.5$med upright(H z)$. In an $f - 2 f$ clockwork, any residual deviation
from exact doubling,
$epsilon.alt \( t \) = f_(upright(S H G)) \( t \) - 2 f_n \( t \)$,
appears directly as an additive error on the measured
carrier-envelope-offset beat. The mean value of $epsilon.alt$ therefore
represents a possible systematic bias in $f_(upright(C E O))$, while its
temporal fluctuations represent an added instability of the clockwork.
In our measurement, the mean residual offset of $0.5 med upright(H z)$
would correspond to a $0.5 med upright(H z)$ bias of the $f$-to-$2 f$
beat, or a fractional optical-frequency error of $1.3 times 10^(- 15)$
when referred to $780 med upright(n m)$. The measured instability of
$epsilon.alt$, reaching $3.3 times 10^(- 15)$ at $1 med upright(s)$ and
averaging down to $4.5 times 10^(- 16)$ at $1000 med upright(s)$,
therefore places an upper bound on the instability that PG-SHG would
contribute to an integrated $f - 2 f$ clockwork.

The obtained measurement, derived from the concatenation of all four
segments, is compatible with the best known miniaturized optical atomic
references@klinger2025cs@kitching2024next@andeweg2026active operating at
$approx 10^(- 14)$ relative frequency instability level at 1~s of the
integration time. Furthermore, our result accommodates this benchmark
with a sufficient margin, supporting the potential for even lower
instability levels. The coherence transfer of the SHG process on shorter
time scales has been further characterized by measuring the linewidth of
the residual signal and its phase noise. The inset of
Fig.~#ref(<fig:results>, supplement: none)\[b\] shows the beat linewidth obtained from the ESA
(resolution bandwidth of 1~Hz), where a close Lorentz approximation
results in a full-width at half maximum (FWHM) of
(4.3~$plus.minus$~0.012)~Hz. This measurement is consistent with the
obtained time trace standard value and indicates that the measurement
system is dominated by white frequency noise, that is additionally
backed up by a phase noise measurement with a clear $1 \/ f^2$ trend.
From the phase noise, we obtained the integrated linewidth at
1~rad$""^2$ of 13.5 Hz, consistent with all the other measurements.
Considering any additional unidentified systematic noise of the
measurement related to the properties of the detectors and electronic
amplifiers involved, such a result is readily compatible with the
requirements of a $< 1$~kHz-level spectroscopy @legaie2018sub and well
beyond.

While the stability characteristics have been demonstrated to be
compatible with the future integrated optical atomic clock architecture,
we have also addressed the question of accuracy. To verify the absence
of a constant frequency shift in case of a long-term measurement we have
calculated the difference between the mean value of the SHG beat
($macron(f)_(S H G) \)$ and doubled pump beat
($2 times macron(f)_(p u m p) \)$, as we did previously for different
pump detunings. For the 3 hour measurement of Fig.~#ref(<fig:results>, supplement: none), we
obtained an offset value of 0.63~Hz, which is statistically
insignificant with respect to the 0.5 Hz measurement uncertainty
extracted from the OADev and is in agreement with the values obtained
before. It is nevertheless instructive to put the hard upper bound on
the achievable stability transfer, which corresponds to
$1.63 times 10^(- 15)$ for a 780 nm carrier (see Table 1 for each
individual measurement).

#figure(
  align(center)[#table(
    columns: 3,
    align: (center,center,center,),
    [Measurement], [Absolute offset], [Relative offset],
    [I], [0.52 \[Hz\]], [$1.36 times 10^(- 15)$],
    [II], [0.32 \[Hz\]], [$0.84 times 10^(- 15)$],
    [III], [0.97 \[Hz\]], [$2.53 times 10^(- 15)$],
    [IV], [0.64 \[Hz\]], [$1.66 times 10^(- 15)$],
    [Total], [0.63 \[Hz\]], [$1.63 times 10^(- 15)$],
  )]
  , caption: [Measured frequency offset of the PG-SHG process relative
  to ideal 2:1 frequency doubling. Total stands for the combined
  measurement, denoted in gray in Fig.~#ref(<fig:results>, supplement: none).]
  , kind: table
  ) <table2>
It is also worth mentioning that along with Silicon Nitride other
material platforms demonstrate exceptional performance in non-linear
conversion. For example, periodically poled lithium niobate has emerged
as a leading platform for second-harmonic
generation~@zhu2021integrated@boes2023lithium. However, while
wafer-level fabrication of lithium niobate has advanced rapidly, driven
largely by industrial demand for optical modulation, wafer-level poling
remains challenging, in part because wafer-thickness variations require
adapted poling technologies~@lithium_wafer_1@chen2024adapted and because
high-power operation can be limited by photorefractive
effects~@sayem2026high. As a result, wafer-level periodic poling has not
yet become a standard scalable foundry process, and multi-project-wafer
(MPW) access to periodically poled lithium niobate remains limited.
Other material platforms, including aluminum nitride~@guo2016second and
silicon carbide~@lukin20204H, have also been explored, but their
thin-film growth and fabrication processes remain less standardized and
scalable than those of lithium niobate. Thus, even from the perspective
of the fabrication maturity and availability of MPW runs, Silicon
Nitride is the material of choice.

Given the growing interest in PG-SHG as a route to integrated
self-referencing~@zhou2025self@clementi2025ultrabroadband@clementi2023chip@lu2021efficient
for octave-spanning microcombs that can interface with optical frequency
standards near 780~nm~@moilleAllopticalNoiseQuenching2025, this work
verifies that directly phase-matched PG-SHG in Silicon Nitride can
preserve the $2 : 1$ frequency relation with the fidelity required for
an optical clockwork. We show that the absolute deviation from ideal
doubling remains at the $< 1$~Hz level over the explored pump-detuning
range, with no resolvable detuning-dependent offset within the 1~Hz
level measurement uncertainty. Over a three-hour measurement, the
residual fractional instability reaches $3.3 times 10^(- 15)$ at
$1 med upright(s)$ and averages down to $4.5 times 10^(- 16)$ at
$1000 med upright(s)$. We further find that the $2 : 1$ frequency ratio
is maintained with a residual offset of
($0.63 plus.minus 0.5 \) med upright(H z)$, corresponding to a
fractional optical-frequency error of $1.63 times 10^(- 15)$. These
measurements establish directly phase-matched PG-SHG in SiN as a
promising route for integrated self-referencing, compact optical
clockworks, and frequency-calibrated precision spectroscopy. The
measured low residual phase noise and integrated linewidth of
$13.5 med upright(H z)$ further demonstrate the suitability of PG-SHG
for high-coherence clockwork and spectroscopy applications. Overall,
these results establish an important metrological benchmark for
miniaturized integrated optical atomic clocks and precision
spectrometers, where $chi^(\( 3 \))$ and effective $chi^(\( 2 \))$
nonlinearities can coexist on a mature CMOS-compatible silicon nitride
platform. \
#strong[Acknowledgments] The authors thank Jordan Stone and Grégory
Moille for helpful conversations. X.L. and K.S. acknowledge the
NIST-on-a-chip program for funding support. NIST work was funded solely
by the U.S. government. X.L. also acknowledges Maryland Industrial
Partnerships for funding support. The fabrication was mainly performed
at the NIST Center for Nanoscale Science and Technology, and in part at
the Cornell NanoScale Facility, funded by the National Science
Foundation (NNCI-2025233). \
#strong[Data availability] The data that support the findings of this
study are available from the corresponding author upon reasonable
request.

#bibliography("source/PG-OPO.bib", style: "american-physics-society")
]
