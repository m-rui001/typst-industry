#figure(image("source/SM_XRR.pdf", width: 80.0%),
  caption: [
    The XRR raw data of (a) 18 nm NiO and (b) 49 nm Pt.
  ]
)
<SF1>

#figure(image("source/SM_AFM.pdf", width: 45.0%),
  caption: [
    The atomic force microscopy image of Pt(3 nm)/NiO(3 u.c.)/PMN-PT heterostructure. The scale bar is 1 $mu$m.
  ]
)
<SF2>

#figure(image("source/SM_PE.pdf", width: 100.0%),
  caption: [
    The polarization--electric field hysteresis loop of PMN--PT substrate.
  ]
)
<SF3>

#figure(image("source/SM_resistivity.pdf", width: 100.0%),
  caption: [
    The temperature-dependent resistivity for $P_arrow.t$ state and $P_arrow.b$ state, respectively.
  ]
)
<SF4>

#figure(image("source/SM_AHE_raw.pdf", width: 100.0%),
  caption: [
    The raw data of AHE resistance as a function of out-of-plane magnetic field for $P_arrow.t$ state and $P_arrow.b$ state, respectively.
  ]
)
<SF5>

#figure(image("source/SM_temperature_dependent_AHE.pdf", width: 100.0%),
  caption: [
    The AHE resistance under different temperature for (a) $P_arrow.t$ state and (b) $P_arrow.b$ state, respectively. The temperature dependent saturated $R_(upright("AHE"))$ for both states are summarized in (c).
  ]
)
<SF6>

#pagebreak(weak: true)
#figure(image("source/SM_L3.pdf", width: 80.0%),
  caption: [
    The Ni $L_3$ edge XAS results for $P_arrow.t$ state and $P_arrow.b$ states, respectively.
  ]
)
<SF7>

#figure(image("source/SM_XAS_exclude_Ni_defects.pdf", width: 80.0%),
  caption: [
    Ni $L_3$-edge spectra of metallic Ni \[Phys. Rev. B 101, 115137 (2020)\] and this work. The dash line indicates the peak position of metallic Ni, excluding the Ni defects in Pt for AHE.
  ]
)
<SF8>

#pagebreak(weak: true)
#figure(image("source/SM_voltage_dependent_AHE.pdf", width: 80.0%),
  caption: [
    The AHE resistance under different E$""_(upright("gate"))$ for (a) $P_arrow.t$ state and (b) $P_arrow.b$ state, respectively.
  ]
)
<SF9>

#strong[The DFT calculation of $bold(J)_(upright(bold(e x)))$ in electron/hole doped NiO]

The DFT calculation is performed using the Vienna #emph[Ab initio] Simulation Package (VASP). The projector-augmented-wave (PAW) pseudopotential was utilized to treat the core electrons. The Perdew--Burke--Ernzerhof (PBE) functional, based on the generalized gradient approximation (GGA) for exchange-correlation, was chosen to simulate the electron interactions. The cutoff energy is set to 450~eV for all calculations. The Brillouin zone is sampled by a Monkhorst-Pack $4 times 4 times 4$ $k$-point mesh. To simplify the calculation, we only calculated the nearest exchange interaction between Ni atoms, expressed as $J_(upright("ex"))$. The schematic of the NiO primary unit cell is shown in Figure~@SF8\(a), as the rhombohedral unit cell vectors are given as $\( 1 \, 1 \/ 2 \, 1 \/ 2 \)_a$, where $a = 4.2$ Å. For each individual Ni that couples to the nearest Ni, the exchange coupling energy is expressed as $J_(upright("ex")) upright(bold(S))_1 dot.op upright(bold(S))_2$, where the magnitude of $upright(bold(S))_(1 \, 2)$ equals 1 for Ni$""^(2 +)$. Thus, our strategy is to calculate the energy of AFM NiO ($E_(upright("AFM"))$ where $J_(upright("ex")) < 0$), as well as the energy of ferromagnetic (FM) NiO ($E_(upright("FM"))$ where $J_(upright("ex")) > 0$). The density of states (DOS) for AFM NiO and FM NiO are shown in Figure~@SF8\(b) and Figure~@SF8\(c) with a certain band gap, indicating that both are insulators. However, the band gap of FM NiO is narrower than that of AFM NiO. By determining the energy difference between AFM and FM NiO, represented by $Delta E = E_(upright("AFM")) - E_(upright("FM"))$ and dependent on the number of charges per unit cell ($N$) as illustrated in Figure~@SF8\(d), we can subsequently compute the exchange interaction $J_(upright("ex")) = Delta E \/ \( 24 S^2 \)$.

#pagebreak(weak: true)
#figure(image("source/SM_DFT.pdf", width: 100.0%),
  caption: [
    The details of DFT calculation. (a) The schematic of primary unit cell of NiO for DFT calculation. Only two Ni atoms are contained. The yellow balls are Ni atoms, red balls are oxygen atoms. (b) The calculated DOS as a function of energy of AFM NiO. (c) The calculated DOS as a function of energy of FM NiO. (d) The calculated $Delta E$ as a function of number of charge per unit cell.
  ]
)
<SF10>

#pagebreak(weak: true)
#figure(image("source/SM_AHE_4uc_NiO.pdf", width: 80.0%),
  caption: [
    Normalized AHE resistance for the $P_arrow.t$ and $P_arrow.b$ states in a Pt(3 nm)/NiO(4 u.c.) heterostructure on a PMN-PT substrate.
  ]
)
<SF11>
