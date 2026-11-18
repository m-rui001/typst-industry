#import "feedback.typ": feedback-diagram
#set page(paper: "us-letter", margin: (x: 53pt, top: 51pt, bottom: 50pt), numbering: "1")
#set text(font: "New Computer Modern", size: 10pt)
#set par(justify: true, leading: .39em, first-line-indent: 1em)
#set heading(numbering: "I.")
#set figure(supplement: [Fig.])
#set figure.caption(separator: [. ])
#show figure.caption: set text(size: 9pt)
#set math.equation(numbering: "(1)", supplement: none)

#set math.equation(numbering: n => "(" + (if n == 6 { "6a" } else if n == 7 { "6b" } else { str(n - int(n > 7)) }) + ")", supplement: none)

#set document(title: "Supplemental Material ? Active compensation of the AC Stark shift in a two-photon rubidium optical frequency reference using power modulation")
#align(center)[
  #text(size: 14pt, weight: "bold")[Supplemental Material ? Active compensation of the AC Stark shift in a two-photon rubidium optical frequency reference using power modulation]

  Yorick Andeweg#super[1,2], John Kitching#super[1], and Matthew T. Hummon#super[1]

  #text(style: "italic")[
    #super[1] National Institute of Standards and Technology, Boulder, Colorado, United States \
    #super[2] University of Colorado Boulder, Boulder, Colorado, United States
  ]
]

#show: body => columns(2, gutter: 16pt, body)

#figure(layout(size => feedback-diagram(size.width, show-steering: true)),
  caption: [
    A high-level block diagram of the ACS method for suppressing the AC Stark shift in a generic CW frequency reference. This diagram is identical to Fig. 1 in the main text, except that here we explicitly show the locked oscillator frequency $nu_(upright("LO"))$ as the sum of the LO free-running frequency $nu_(upright("free"))$ and the LO steering signal $nu_(upright("steer"))$ applied to maintain lock, as our stability limit derivation refers to these frequencies.
  ]
)
<fig_supmat_abstracted_diagram>

#emph[Derivation of ACS stability limit]---This section presents a derivation of the stability limit imposed on clocks employing the auto-compensated shift (ACS), Eq. (3) in the main text. @fig_supmat_abstracted_diagram shows a block diagram of the ACS method, with labels indicating the various frequencies that appear in the derivation. This derivation has the following parts:

#block[
#set enum(numbering: "(a)", start: 1)
+ Derive an expression for the LO steering signal $nu_(upright("steer"))$ that stabilizes the locked oscillator frequency $nu_(upright("LO"))$, including both the effect of the applied modulation and two noisy terms, $nu_(upright("free"))$ and $nu_(upright("servo noise"))$, which have spectral components at $f_(upright("PM"))$.

+ Describe how the two noisy terms lead to low-frequency noise on $xi$.

+ Describe how this noise on $xi$ translates to noise on the OFR's stable output frequency, $nu_(upright("LO"))$.

+ Assign power spectral densities $S_(nu \, upright("free"))$ and $S_(nu \, upright("servo"))$ to the noisy terms in part (a) and propagate these fluctuations to the noise on $nu_(upright("LO"))$.
]

\(a) In ACS, the optical power $P$ is modulated at a frequency $f_(upright("PM"))$: $ P \( t \) = P_0 \[ 1 + A sin \( 2 pi f_(upright("PM")) t \) \] . $<eq_power_modulation_sup> This perturbs the atomic transition frequency $nu_(upright("trans"))$: $ nu_(upright("trans")) \( t \) = nu_0 + c P \( t \) $<eq_light_shift> where $nu_0$ is the unperturbed transition frequency and $c$ is the AC Stark shift coefficient. Let us follow the modulation effect upstream to $nu_(upright("steer"))$. The primary feedback loop locks the interrogation frequency $nu_(upright("int"))$ to the transition frequency with some noise: $ nu_(upright("int")) \( t \) = nu_(upright("trans")) \( t \) - nu_(upright("servo noise")) \( t \) $<eq_servo_lock> where $nu_(upright("servo noise")) \( t \)$ is a rapidly-fluctuating term that averages to zero, representing photon shot noise, technical noise, or any other noise source that limits the short-term performance of the primary feedback loop. (The sign on $nu_(upright("servo noise")) \( t \)$ is arbitrary; we make it negative here to aid the clarity later on in the derivation.) Substituting Eq. (@eq_servo_lock) into Eq. (@eq_light_shift) and using the fact that $nu_(upright("int")) = nu_(upright("LO")) + xi P$, we find $ nu_(upright("LO")) & = nu_0 + c P \( t \) - xi P \( t \) - nu_(upright("servo noise")) \( t \) $<eq_vint_lock> Next, we can write the locked oscillator frequency $nu_(upright("LO"))$ as the sum of the rapidly fluctuating free-running LO frequency $nu_(upright("free")) \( t \)$ and a steering term $nu_(upright("steer")) \( t \)$ provided by the fast primary feedback loop. Substituting this into Eq. (@eq_vint_lock) and solving for the steering term yields $ nu_(upright("steer")) \( t \) = nu_0 + c P \( t \) - xi P \( t \) - nu_(upright("servo noise")) \( t \) - nu_(upright("free")) \( t \) . $<eq_nu_steer>

\(b) The secondary feedback loop uses a lock-in amplifier to detect a tone at $f_(upright("PM"))$ on $nu_(upright("steer")) \( t \)$, given by Eq. (@eq_nu_steer). Clearly, this includes the terms containing $P \( t \)$, but perhaps less obviously, it can include the rapidly fluctuating terms $nu_(upright("free"))$ and $nu_(upright("servo noise"))$ as well. Suppose that these terms each have a spectral component at $f_(upright("PM"))$: \$\$\\label{eq\_define\_pqrs}
$ nu_(upright("free"))(t) = p sin(2 pi f_(upright("PM")) t) + q cos(2 pi f_(upright("PM")) t)
  \ + "other spectral components" $ <eq_define_pq>
$ nu_(upright("servo noise"))(t) = r sin(2 pi f_(upright("PM")) t) + s cos(2 pi f_(upright("PM")) t)
  \ + "other spectral components" $ <eq_define_rs>
where the signed amplitudes $p$, $q$, $r$, and $s$ vary slowly compared to $f_(upright("PM"))$ and average to zero. The lock-in amplifier in the secondary feedback loop does not detect the cosine terms, since they are 90out of phase with the applied perturbation (Eq. (@eq_power_modulation_sup)), but it detects the sine terms. The complete signal detected by this lock-in amplifier is as follows: $ nu_(upright("steer, detected")) = \( c P_0 A - xi P_0 A - r - p \) sin \( 2 pi f_(upright("PM")) t \) $ The secondary feedback loop tunes $xi$ to eliminate this detected tone, yielding $ xi = c - frac(r, P_0 A) - frac(p, P_0 A) . $<eq_xi> Recall that the secondary feedback loop is intended to tune $xi$ to match $c$ in order to render $nu_(upright("LO"))$ insensitive to power fluctuations. The additional terms represent slowly-fluctuating noise.

\(c) Let us see how this noise on $xi$ perturbs the stable output frequency, $nu_(upright("LO"))$. Substituting Eq. (@eq_xi) into Eq. (@eq_vint_lock) yields $ nu_(upright("LO")) & = \[ t \] nu_0 & + c P \( t \) - (c - frac(r, P_0 A) - frac(p, P_0 A)) P \( t \)\
 & - nu_(upright("servo noise")) \( t \)\
 & = \[ t \] nu_0 & + p / A + p sin \( 2 pi f_(upright("PM")) t \)\
 & + r / A + r sin \( 2 pi f_(upright("PM")) t \) - nu_(upright("servo noise")) \( t \)\
 $<eq_tone_and_error> using Eq. (@eq_power_modulation_sup) for the expression $P \( t \)$. The terms $p / A$ and $r / A$ cause the greatest perturbations, since $A < 1$. Let us see how these terms fluctuate at long times.

\(d) Suppose that $nu_(upright("free"))$ and $nu_(upright("servo noise"))$ have one-sided power spectral densities (PSD's) $S_(nu \, upright("free"))$ and $S_(nu \, upright("servo"))$ respectively. The amplitudes $p$ and $r$ can then be said to have PSD's of their own at frequencies below the bandwidth $1 \/ T$ of the secondary feedback loop, given by $ S_p \( f < 1 \/ T \) & = 2 S_(nu \, upright("free")) \( f_(upright("PM")) \)\
S_r \( f < 1 \/ T \) & = 2 S_(nu \, upright("servo")) \( f_(upright("PM")) \) \, $ as described in Ref. @audoin_limit_1991. The PSD of the troublesome frequency terms $p / A + r / A$ on $nu_(upright("LO"))$ is then $  & S_(nu \, upright("LO")) \( f < 1 \/ T \)\
 & = 1 / A^2 \[ S_p \( f < 1 \/ T \) + S_r \( f < 1 \/ T \) \]\
 & = 2 / A^2 \[ S_(nu \, upright("free")) \( f_(upright("PM")) \) + S_(nu \, upright("servo")) \( f_(upright("PM")) \) \] $<eq_error_noise> Substituting this into the standard formula for the Allan deviation of a white noise spectrum @rutman_characterization_1991, and dividing by $nu_(upright("LO"))$ to make it fractional, we arrive at the stability limit equation we present in the main text: $ sigma_y = 1 / nu_(upright("LO")) sqrt(frac(S_(nu \, upright("free")) \( f_(upright("PM")) \) + S_(nu \, upright("servo")) \( f_(upright("PM")) \), tau)) 1 / A . $<eq_stability_limit_sup>

#figure(image("source/Noise_Spectra.png", width: 100%),
  caption: [
    The frequency noise spectrum (one-sided PSD) of our laser. The horizontal dashed line shows the white noise level predicted at low frequencies by Eq. (@eq_error_noise). For the ACS data shown here, $T = 5.6 upright(" s")$ and $A = 0.19$.
  ]
)
<fig_noise_spectra>

#emph[Frequency noise spectrum of our laser]---@fig_noise_spectra shows the frequency noise spectrum of our laser when it is unlocked, locked with ACS, and locked without ACS. For noise frequencies below 10 Hz, we obtain this spectrum by heterodyning our clock laser with a frequency comb, measuring the beat frequency on a counter, and performing a Fourier transform during postprocessing. To measure the noise spectrum at frequencies greater than 10 Hz, we pass the beat note through a frequency-to-voltage converter and into an FFT analyzer. The small gaps in the data are where we removed spikes at harmonics of the power line frequency (60 Hz).

The purple curve represents $S_(nu \, upright("free"))$, the noise spectrum of the free-running laser. The blue curve shows the noise spectrum of the locked laser $S_(nu \, upright("LO"))$ with only the fast primary feedback loop active (ACS off). From comparison of these two spectra we can observe the servo bump of the fast primary feedback loop around $2 times 10^3$ Hz, and a white-noise floor of the primary servo near $10^2 med upright("Hz")^2 \/ upright("Hz")$. To estimate the long-term stability limit for the laser when ACS is enabled using Eqs. (11) and (12), we can estimate the value $S_(nu \, upright("free")) \( f_(upright("PM")) \)$ directly from the free running laser PSD, and $S_(nu \, upright("servo")) \( f_(upright("PM")) \) = S_(nu \, upright("LO")) \( f_(upright("PM")) \)$ when ACS is off. At $f_(upright("PM")) = 223 upright(" Hz")$, these curves have values of $125 plus.minus 8 upright(" Hz")^2 \/ upright("Hz")$ and $130 plus.minus 9 upright(" Hz")^2 \/ upright("Hz")$ respectively, determined by averaging data points in a $plus.minus 30 upright(" Hz")$ window around $223 upright(" Hz")$. Substituting these values into Eq. (@eq_error_noise) gives the predicted white noise level for ACS at low frequencies ($f < 1 \/ T$), shown by the dashed line in @fig_noise_spectra. The uncertainty intervals in this analysis, shown graphically by a thin shaded region around the dashed line, denote standard error.

@fig_noise_spectra motivates our choice of $223 upright(" Hz")$ for $f_(upright("PM"))$. Choosing a lower frequency would worsen the ACS stability limit because of the higher value of $S_(nu \, upright("free"))$, but choosing a higher frequency would offer little improvement, as the stability limit would become limited by $S_(nu \, upright("servo"))$. We chose a prime number for $f_(upright("PM"))$ to avoid aliasing with other frequencies in the lab.

#bibliography("source/references.bib", style: "ieee")
