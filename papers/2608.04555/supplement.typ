#set page(paper: "us-letter", margin: (x: 47pt, y: 50pt), numbering: "1")
#set text(font: "New Computer Modern", size: 10pt)
#set par(justify: true, leading: 0.56em)
#set heading(numbering: "1")
#set math.equation(numbering: "(1)")
#show figure.caption: set text(size: 9pt)
#show figure.where(kind: table): set figure.caption(position: top)
#show table: set text(size: 8.5pt)
#show table: set table(inset: (x: 3pt, y: 3pt))

#set text(size: 9.5pt)
#set par(leading: 0.48em)

#title[Supplementary material]

#align(center)[Andrei Diakonov, Roy Zektzer, Xiyuan Lu, Kartik Srinivasan, and Liron Stern]

= Photo-induced Second Harmonic Generation Procedure
<photo-induced-second-harmonic-generation-procedure>
After coupling the amplified pump laser to the MRR at the telecom
wavelength around the MRR resonance, we initiate the pump laser sweep of
approximately 20 GHz around the resonance and simultaneously monitor the
output power at the SHG port. In order to initiate the PG-SHG process,
it is necessary to adjust the polarization of the pump such that the
basic $T E_00$ mode of the MRR is coupled. By gradually moving the pump
wavelength while being continuously swept, we observe the characteristic
SHG peak appearing at the SHG output on the scope. It takes a few (5~s
to 10~s) in order for a peak to be formed for the first time after the
idle operation and to reach a steady-state. Concurrently, we monitor the
chip with a microscope and the initiation of PG-SHG is accompanied by
emerging red light, pulsating according to the frequency of the pump
sweep. After obtaining the characteristic ideal phase-matching SHG peak
for the first time, the re-initiation process is instantaneous. It is
then possible to identify the specific pump offset a few MHz aside from
the SHG peak, and by red-shifting the pump to this specific point, to
initiate a stable PG-SHG operation with a characteristic bright red
light emitted from the chip.

= Derivation of the beat relation between the fundamental and the second harmonic
<derivation-of-the-beat-relation-between-the-fundamental-and-the-second-harmonic>
Here, we want to derive the ratio between the two frequency beats of the
pump laser and the SHG light to isolate the residual noise components.
We define the first beat frequency, $f_(b 1)$, as the offset between the
pump laser and the $N$-th harmonic of the repetition rate of the DFC
around 1560 nm: $ f_(b 1) = f_(upright("pump")) - N f_r equiv Delta $
The second beat frequency, $f_(b 2)$, corresponds to the difference
between the SHG light and the corresponding closest tooth of the DFC
around 780 nm. Accounting for the PG-SHG induced frequency fluctuation
$epsilon.alt$, the relationship is expressed as:
$ f_(b 2) = \( 2 + epsilon.alt \) f_(upright("pump")) - 2 N f_r = \( 2 + epsilon.alt \) \( Delta + N f_r \) - 2 N f_r = 2 Delta + epsilon.alt Delta + epsilon.alt N f_r $

From these expressions, we can determine the ratio $alpha$:
$ alpha = f_(b 2) / f_(b 1) = 2 + epsilon.alt + frac(epsilon.alt N f_r, Delta) $
Alternatively, we define the difference $D$ as:
$ D = f_(b 2) - 2 f_(b 1) = epsilon.alt Delta + epsilon.alt N f_r approx epsilon.alt N f_r $
This difference $D$ yields a larger, more measurable quantity and serves
as an excellent approximation for the frequency offset (in Hz) of the
SHG from exact frequency doubling.

To evaluate the stability of this system, we analyze the fluctuations
$delta D$. The total error in $D$ is given by the expansion:
$ delta D = delta epsilon.alt Delta + epsilon.alt delta Delta + delta epsilon.alt N f_r + epsilon.alt N delta f_r approx delta epsilon.alt N f_r $
In this expansion, the terms are of vastly different magnitudes: the
first is $O \( 10^(- 8) \)$, the second $O \( 10^(- 18) \)$, the third
$tilde.op 1$, and the final term $O \( 10^(- 13) \)$. Consequently, the
fluctuation is dominated by the $delta epsilon.alt N f_r$ term. This
behavior is mirrored in the fluctuations of the second beat:
$ delta f_(b 2) = 2 delta Delta + delta epsilon.alt Delta + epsilon.alt delta Delta + delta epsilon.alt N f_r + epsilon.alt N delta f_r approx delta epsilon.alt N f_r $
This approximation holds under the condition
$2 delta Delta lt.double 1$, which is standard for systems under tight
phase-locking. Nevertheless, it is technically superior to analyze $D$
directly by measuring $f_(b 1)$ and $f_(b 2)$ in correlation.

Finally, we relate these terms to the total noise of the SHG signal. The
frequency of the SHG light is:
$ f_(upright("SHG")) = \( 2 + epsilon.alt \) \( Delta + N f_r \) $ The
resulting noise contribution is described by:
$ delta f_(upright("SHG")) = delta f_(b 2) + 2 N delta f_r $ By
utilizing this correlated measurement approach, we effectively eliminate
the common-mode pump noise and isolate the residual noise $epsilon.alt$
inherent to the conversion process.
