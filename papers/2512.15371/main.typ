// Typst adaptation of Xue et al., arXiv:2512.15371v1 (CC0 1.0).
// https://arxiv.org/abs/2512.15371v1
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

  title: [Network localization governs social contagion dynamics with

macro-level reinforcement],

  authors: (

    ( name: [Leyang Xue],

      affiliation: [Department of Systems Science and International Academic Center of Complex Systems, Beijing Normal University, Zhuhai, China; School of Systems Science, Beijing Normal University, Beijing, China],

      email: "" ),

    ( name: [Kai-Cheng Yang],

      affiliation: [School of Computing, Binghamton University, Binghamton, NY, USA; Network Science Institute, Northeastern University, Boston, MA, USA],

      email: "" ),

    ( name: [Peng-Bi Cui],

      affiliation: [Department of Systems Science and International Academic Center of Complex Systems, Beijing Normal University, Zhuhai, China; School of Systems Science, Beijing Normal University, Beijing, China],

      email: "" ),

    ( name: [Zengru Di],

      affiliation: [Department of Systems Science and International Academic Center of Complex Systems, Beijing Normal University, Zhuhai, China; School of Systems Science, Beijing Normal University, Beijing, China],

      email: "" ),

    ),

  date: [arXiv v1 ? 2025-12-17],

  abstract-title: [Abstract],

  abstract: [The spread of ideas, behaviors, and technologies generally

depends on feedback mechanisms operating across multiple scales.

Previous studies have extensively examined pairwise transmission and

local reinforcement. However, the role of macro-level social

influence---where widespread adoption enhances further

adoption---remains understudied. Here, we focus on a contagion process

that incorporates both pairwise interactions and macro-level

reinforcement. We show that the contagion undergoes a shift from

continuous to mixed-order transition as macro-level influence exceeds a

reinforcement threshold. Simulations on various real-world networks

indicate that network localization governs the contagion outcomes by

determining the critical point and the reinforcement threshold. Building

on this insight, we develop a structural metric linking network

localization to contagion dynamics, revealing a key trade-off: networks

that facilitate weak contagion tend to experience slower diffusion and

lower adoption rates, while networks that suppress weak contagions

enable faster and more widespread adoption. These findings challenge the

conventional belief that stronger local connectivity uniformly promotes

contagion.



],

  pagenumbering: "1",

  cols: 1,

  doc,

)





= Introduction

<introduction>

Contagion processes characterize the dissemination of new ideas,

technologies, products, and behaviors, playing a central role in the

functioning of socio-economic systems. Understanding the mechanisms

underlying these processes provides key insights into collective

decision-making and adoption dynamics across a wide range of

disciplines~ \[1, 2, 3\], including management science, economics,

sociology, psychology, and physics~ \[4, 5, 6\]. Because empirical

studies often face substantial confounding factors, modeling approaches

have become essential tools for analyzing and predicting social

diffusion patterns~ \[7, 8\]. Network science offers a principled

framework to examine contagion pathways and uncover the mechanisms

driving emergent collective behaviors in diffusion processes~ \[9, 10\].



Classical contagion models typically assume pairwise transmission with a

constant and independent probability between susceptible and adopting

individuals~ \[11, 12\]. However, real adoption behaviors frequently

require reinforcement from multiple exposures before individuals commit

to new behaviors~ \[13, 14, 15, 16\]. This has motivated the development

of threshold models~ \[17\], simplicial and higher-order contagion

models~ \[3, 18\], and hypergraph-based frameworks~ \[19\]. These models

primarily emphasize the role of local reinforcement through interacting

neighborhoods~ \[58\], communities~ \[20, 21\], simplices, or

hyperedges~ \[3, 18, 19, 22, 23\], in producing nonlinear adoption

patterns.



However, the rise of digital communication, large-scale media exposure,

and platform-driven recommendation systems has amplified the influence

of macro-level social signals on individual adoption decisions.

Empirical studies have documented abrupt increases in adoption rates

driven by visibility, popularity, and network effects at the population

scale~ \[24, 25, 26, 29, 30\]. Examples include the rapid spread of

online platforms such as Facebook, Twitter, and Threads~ \[25, 27, 28\],

as well as viral dissemination of digital content and AI tools~ \[31,

32\]. These dynamics highlight that the global fraction of adopters can

directly reinforce micro-level transmission, thereby creating a positive

feedback loop that accelerates adoption.



Macro-level reinforcement can arise from various mechanisms, including

psychological conformity to emerging social norms~ \[33, 34, 35, 16\],

network effects that enhance product utility in large user bases~ \[36,

37, 38\], and cost reductions driven by economies of scale~ \[8, 39,

40\]. Regardless of its origins, such system-level reinforcement couples

the global state of adoption back into local transmission dynamics.

Capturing this macro--micro interaction requires a modeling framework

that integrates global reinforcement with local contagion processes

while accounting for underlying network structure, a connection that

remains insufficiently explored in existing contagion models.



To close this gap, we develop a model that captures the interplay

between macro-level reinforcement and local pairwise transmission,

incorporating varying levels of feedback intensity. The contagion

process is modeled using a Susceptible-Infectious-Recovered (SIR)-like

framework~ \[11\], where word-of-mouth effects~ \[41\] drive initial

adoption. Macro-level influence is represented as the increasing

adoption likelihood as the total number of adopters grows. Specifically,

transmissibility $beta'$ is defined by two key components: (1) the

inherent initial attractiveness of the contagion, $beta$, and (2) a

macro-level social influence or reinforcement term

$alpha frac(R \( t \), N)$, where $R \( t \)$ and $N$ denote the number

of adopters and the total population size, respectively, and $alpha$

represents the feedback strength.



Simulations on diverse real-world networks reveal a critical threshold

in inherent attractiveness, $beta_c$, below which outbreaks cannot

occur. When macro-level influence exceeds a critical value $alpha_c$

(i.e., the reinforcement threshold), the outbreak size at $beta_c$

exhibits an abrupt jump associated with critical scaling behavior. This

indicates that sufficiently strong global feedback transforms gradual

diffusion into an abrupt mixed-order (hybrid) transition.



We identify $alpha_c$ as the onset of mixed-order criticality and show

that it is closely tied to network localization strength, providing a

clear structural interpretation. To quantify this relationship, we

propose a localization metric that predicts $alpha_c$ directly from

network topology and reveals a fundamental trade-off: for networks with

fixed density, lowering $beta_c$ inevitably raises $alpha_c$, and vice

versa. Consequently, strongly localized networks can trigger contagion

with low intrinsic attractiveness but restrict the final adoption size,

whereas weakly localized networks require higher intrinsic

attractiveness yet can sustain a much broader spread.



Our findings challenge classical diffusion theory, which posits that

networks with high degree heterogeneity or strong clustering are optimal

for lowering contagion thresholds. Instead, we show that such structural

features can localize spreading dynamics and restrict global outbreaks,

especially when macro-level reinforcement interacts with network

localization. By bridging micro-level transmission and macro-level

reinforcement, our framework provides a unified perspective on how

network structure shapes diffusion dynamics, offering new strategies for

both promoting beneficial adoption and mitigating undesirable contagion.



= Model

<subsec:model>

Consider a socio-economic system represented as a network of $N$

individuals (nodes) connected by $L$ links (edges). Initially, most

nodes are in a susceptible state (denoted by $S$) and can transition to

an adopter state (denoted by $A$) when influenced by neighboring

adopters. The adoption occurs with a probability $beta'$, representing

the reinforced transmission probability along local connections.

Additionally, adopters may lose interest and transition to a recovered

state (denoted by $R$) with probability $mu$ per time step. The

contagion dynamics are described as follows:

$ S_i \( t - 1 \) + A_j \( t - 1 \) & arrow.r^(beta' \( t \)) & A_i \( t \) + A_j \( t \) \,\

A_i \( t - 1 \) & arrow.r^mu & R_i \( t \) \, $<eq:eqs1> where

$Y_i \( t \)$ ($Y in { S \, A \, R }$) denotes the state of node $i$ at

time $t$. Local transmission occurs only between directly connected

nodes $i$ and $j$. The contagion process stops once all adopters have

transitioned to the recovered state.



#figure(image("Fig1.svg"),

  caption: [

    #strong[Definition and behavior of the proposed model]. (a) The

    diagram depicts the contagion process within a simplified network

    consisting of eight nodes. The transmissibility, $beta' \( t \)$, of

    the SIR-like model depends on both intrinsic attractiveness, $beta$,

    and macro-level reinforcement, $alpha frac(R \( t - 1 \), N)$. At

    time $t$, an adopter tries to convert two susceptible neighbors,

    with the macro-level influence contribution to transmissibility

    being $alpha 3 / 8$, since there are three recovered nodes in the

    system. At time $t + 1$, the level of feedback intensity rises to

    $alpha 4 / 8$ due to the addition of one more recovered node. (b)

    The final proportion of recovered nodes, $R \( oo \) \/ N$, is

    depicted as a function of $beta$ for three different values of

    $alpha$ across three real-world networks (Advogato, Enron-Large, and

    CondMat networks). Dots represent simulation results, while solid

    lines denote theoretical predictions derived from the dynamic

    message passing (DMP) method. As the level of feedback intensity

    increases, the contagion exhibits a finite jump in the outbreak

    size, as indicated by the gray backgrounds. Additional details are

    provided in the main text. (c) Phase diagrams for the same networks

    as in (b) are divided by a vertical line at the critical point

    $beta_c$, separating the "vanished" and "prevalent" contagion

    states. In the former state, the contagion decays, while in the

    latter state, it spreads widely. Solid lines~($alpha < alpha_c$)

    indicate continuous transitions, while dashed

    curves~($alpha > alpha_c$) indicate transitions that develop a

    finite jump in outbreak size. The white dot marks the value of

    $alpha_c$ at which this qualitative change in transition behavior

    occurs.

  ]

)

<fig:1>



To incorporate macro-level reinforcement~ \[46, 33, 47\], we adopt a

linear feedback mechanism inspired by the classical Bass diffusion

model~ \[7\], where the adoption rate increases linearly with the

cumulative number of adopters. This formulation is supported by

empirical studies~ \[34, 7, 1\], which report approximately linear

increases in adoption likelihood during the early and intermediate

stages of diffusion. Although real-world reinforcement mechanisms may

display nonlinear effects such as thresholds or saturation, this linear

approximation provides a parsimonious yet empirically grounded

representation that captures the core features of macro-level

reinforcement while maintaining analytical tractability for exploring

the role of network structure in contagion dynamics.



Specifically, the time-dependent transmissibility $beta'$ is defined as:

$ beta' \( t \) = min (1 \, #h(0em) beta + alpha frac(R \( t - 1 \), N)) \, alpha gt.eq 0 \, beta' in [0 \, 1] . $<eq:eqs3>

Here, $beta$ represents the intrinsic attractiveness of the contagion~

\[1\], while $alpha frac(R \( t - 1 \), N)$ captures the macro-level

influence from cumulative adoption. As $R \( t - 1 \)$ increases, the

probability that a susceptible individual adopts also increases,

reflecting the reinforcing effect of collective behavior. The parameter

$alpha$ controls the level of feedback intensity, and the upper bound

ensures that $beta' \( t \)$ remains within the valid probability range.

An overview of the model is illustrated in Fig.~@fig:1\(a).



= Result

<result>

== Phase Transition

<phase-transition>

To characterize the behavior of our model, we perform simulations across

a range of $beta$ and $alpha$ values on various real-world networks.

Results for three representative networks are shown in Fig.~@fig:1\(b).

Additionally, we apply the dynamic message passing (DMP) method to

theoretically track the final market penetration, i.e.,

$frac(R \( oo \), N)$. The theoretical predictions exhibit strong

agreement with simulation results. The simulation procedures and the DMP

method are described in Appendices A and C, respectively, while

information on the network datasets and additional results is provided

in the Supplemental Material~ \[48\].



Through extensive analysis, we identify key phenomena that shed light on

the contagion process. In the absence of macro-level reinforcement

(i.e., $alpha = 0$), our model reduces to the classical SIR model. As

$beta$ surpasses a critical threshold $beta_c$, the system undergoes a

continuous transition from the "vanished" state, where contagion fails

to spread, to the "prevalent" state, where a finite fraction of

individuals eventually adopt. The introduction of macro-level

reinforcement fundamentally alters these dynamics. When this feedback

strength is sufficiently high, the final adoption size at $beta_c$

exhibits an abrupt jump, while still displaying critical scaling

behavior near the critical point (see Supplemental Material~ \[49\],

Sec.~B.2).



This qualitative change reflects the emergence of a mixed-order

transition, in which an abrupt jump coexists with critical behavior

rather than a purely first-order transition. In particular, the

intrinsic threshold $beta_c$ remains unchanged across different values

of $alpha$ (see Supplemental Material~ \[50\], Sec.~B.3), since

macro-level reinforcement only becomes operative once adopters already

exist, requiring $beta gt.eq beta_c$ for contagion to spread initially.



We further identify a reinforcement threshold, $alpha_c$, beyond which

contagion exhibits a mixed-order phase transition (see plots with gray

backgrounds in Fig.~@fig:1\(b))~ \[51, 52\]. We refer to this threshold

as the onset of mixed-order criticality and provide a numerical

estimation method in Appendix D. The model's behavior is thus

characterized by the tuple $\( beta_c \, alpha_c \)$, which partitions

the phase space into distinct regions, as shown in Fig.~@fig:1\(c).

These thresholds have important real-world implications: $beta_c$

represents the intrinsic attractiveness required to trigger an outbreak,

while $alpha_c$ determines the level of feedback intensity needed to

induce an abrupt but hybrid global adoption surge. Networks with lower

$alpha_c$ values generally exhibit faster diffusion and higher adoption

rates (see Supplemental Material~ \[53\], Sec.~B.1).



#figure(image("Fig2.svg"),

  caption: [

    #strong[Critical point~($beta_c$) and reinforcement

    threshold~($alpha_c$) for real-world networks]. (a) Comparison

    between simulated and predicted values of $beta_c$, based on

    Eq.~(@eq:eqs23). (b) Comparison between simulated and predicted

    values of $alpha_c$, derived from Eq.~(@eq:alpha_l). Each dot

    represents a real-world network, and the solid diagonal lines

    ($y = x$) indicate where predicted values match simulated results.

    The mean squared logarithmic errors (MSLE) between simulations and

    predictions are annotated in each plot.

  ]

)

<fig:2>



== Quantifying the critical point and reinforcement threshold of phase transition

<quantifying-the-critical-point-and-reinforcement-threshold-of-phase-transition>

Given the critical roles of $beta_c$ (the critical point) and $alpha_c$

(the reinforcement threshold), accurately estimating their values is

essential to understand contagion dynamics in networked populations.

While these thresholds can be determined numerically, the process

requires extensive simulations, making it prohibitively expensive (see

Appendix A for details). Here, we demonstrate that both $beta_c$ and

$alpha_c$ are inherently determined by the network structure and can be

efficiently calculated using simple algebraic expressions derived from

the non-backtracking matrix $bold(B)$~ \[45\].



In the previous section, we established that the simulated value of

$beta_c$ is independent of the macro-level feedback. Therefore, it can

be approximated by the epidemic threshold of the SIR model~ \[54\]:

$ beta_c = frac(mu, rho \( bold(B) \) + mu - 1) \, $<eq:eqs23> where

$rho \( bold(B) \)$ is the largest eigenvalue of the non-backtracking

matrix $bold(B)$. For simplicity, we set $mu = 1$, yielding a threshold

approximation of $1 \/ rho \( bold(B) \)$. To validate this

approximation, we compare the predicted and simulated values of $beta_c$

across 74 real-world networks, as shown in Fig.~@fig:2\(a). The results

demonstrate a strong agreement, with minor deviations consistent with

previous reports~ \[56\].



The case for $alpha_c$ is more complex. When macro-level reinforcement

is sufficiently strong, the final adoption size at $beta_c$ exhibit a

finite jump, reflecting an avalanche-like activation of susceptible

individuals once $beta$ surpasses the threshold. This abrupt collective

response arises when a positive feedback loop forms between the

increasing number of adopters and the reinforced transmissibility

$beta'$. However, the presence of macro-level reinforcement alone is

insufficient to produce such behavior. For an avalanche to occur, a

substantial fraction of individuals must have similar adoption

probabilities, enabling many of them to become activated nearly

simultaneously. These probabilities vary across individuals due to

differences in network connectivity~ \[11, 57, 58\]. For example,

well-connected individuals are more likely to be exposed to contagion

and adopt compared to those with fewer connections. Previous studies

suggest that adoption probability can be approximated using the

non-backtracking centrality~ \[59, 60\], defined as:

$ x_i = sum_j A_(i j) v_(j arrow.r i) \, $<eq:nbc> where $x_i$

represents the centrality of node $i$, $A_(i j)$ is an element of the

adjacency matrix $bold(A)$, and $v_(j arrow.r i)$ denotes the component

of the principal eigenvector associated with the non-backtracking matrix

$bold(B)$.



#figure(image("Fig3.svg"),

  caption: [

    #strong[Effect of network localization on the contagion process]. We

    simulate the proposed model with the parameters $alpha = 1$ and

    $beta = beta_c$ (the theoretical critical value) on two synthetic

    networks, shown in (a) and (b), respectively. The network in (b) is

    generated by randomly rewiring the edges of the real-world network

    in (a), while preserving its degree sequence. Node sizes correspond

    to non-backtracking centrality, with gray nodes indicating the final

    susceptible states and blue nodes indicating the final recovered

    states; the initial seed is marked in orange. The histograms display

    the distribution of node non-backtracking centrality indices, with

    each bar's color reflecting the proportion of recovered nodes within

    the respective bin. The figure also includes annotations for the

    localization metric, $cal(L)$, for both networks. For the critical

    thresholds, we observe $beta_c = 0.104$, and $alpha_c = 1.17$ for

    network (a), and $beta_c = 0.183 \, alpha_c = 0.58$ for network (b).

  ]

)

<fig:3>



Based on this heuristic, mixed-order transition behavior is more likely

to occur in networks with smaller variances in their node centrality

measures. To illustrate this, we present diffusion outcomes on two

synthetic networks in Fig.~@fig:3. While these networks share the same

degree sequence, differences in their connectivity patterns result in

distinct non-backtracking centrality distributions, the reinforcement

threshold $alpha_c$, and final states. In particular, the network in

Fig.~@fig:3\(a) has a small subset of highly central nodes, while the

rewired network in Fig.~@fig:3\(b) displays a more homogeneous

centrality distribution. By definition, network (a) has stronger

localization strength than network (b). Consequently, in network (a),

recovered nodes tend to be more central, with diffusion concentrated

around highly connected nodes, whereas in network (b), contagion spreads

more evenly across the network.



To quantify this property, we define the localization strength $cal(L)$

as:

$ cal(L) = frac(sqrt(1 / N sum_(i = 1)^N \( x_i - chevron.l x_i chevron.r \)^2), chevron.l x_i chevron.r chevron.l k chevron.r) \, $<eq:localization_strength>

where the numerator represents the standard deviation of node

non-backtracking centrality measures. The denominator, given by the

product of the average centrality and the average degree, ensures

comparability of $cal(L)$ across different networks. The value of

$cal(L)$ for both networks in Fig.~@fig:3 illustrates how this metric

quantifies localization strength.



By analyzing the values of $cal(L)$ and $alpha_c$ across different

networks, we observe a positive correlation between them, which we

capture with the empirical relationship:

$ alpha_c = lambda cal(L)^eta \, $<eq:alpha_l> where $lambda$ and $eta$

are parameters determined empirically. To avoid overfitting on

real-world networks, we fit Eq.~(@eq:alpha_l) using a collection of

synthetic networks, resulting in $lambda = 2.63$ and $eta = 1.00$ (see

Appendix D for details). We then validate this relationship by comparing

the simulated $alpha_c$ values with their predicted counterparts,

$2.63 cal(L)$, across our collection of real-world networks in

Fig.~@fig:2\(b), finding excellent agreement. This relationship enables

prediction of $alpha_c$ for any network based solely on its topology,

eliminating the need for extensive simulations. For practical

applications, Eq.~(@eq:alpha_l) can also be fitted directly on specific

real-world networks to refine the estimates of $lambda$ and $eta$.



We acknowledge that alternative methods exist for quantifying network

localization strength. For instance, the inverse participation ratio

(IPR) is widely used in the literature for this purpose~ \[45\]. Other

measures include substituting $x_i$ in Eq.~(@eq:localization_strength)

with eigenvector centrality~ \[61\], or using the Gini coefficient to

measure the variance~ \[62\]. However, our definition in

Eq.~(@eq:localization_strength) provides the most accurate predictions

for $alpha_c$ (see Supplemental Material~ \[63\], Sec.~B.4 for a

comparison with alternative definitions).



#figure(image("Fig4.svg", width: 60.0%),

  caption: [

    #strong[Relationship between the critical point and the

    reinforcement threshold]. Values of $beta_c$ and $alpha_c$ are

    obtained through numerical simulations. Each marker represents a

    network, with its position indicating the corresponding intrinsic

    threshold and reinforcement threshold. Solid lines illustrate the

    relationship between $beta_c$ and $alpha_c$ as described by

    Eq.~(@eq:beta_alpha_relation) for the specified average degree. (a)

    Equation~(@eq:beta_alpha_relation) is plotted with

    $chevron.l k chevron.r = 2$. (b) Networks are categorized by average

    degree, with lines representing different $chevron.l k chevron.r$

    values. A logarithmic scale is used to highlight finer details. (c)

    Adjusting network assortativity yields configurations with varying

    $beta_c$ and $alpha_c$ values for four selected real-world networks

    (InterdisPhysics, Delicious, Advogato, Fb-pages-artist). Arrows

    indicate the directions of these changes. (d) Similar to (c), but

    applied to three scale-free networks generated by the configuration

    model.

  ]

)

<fig:4>



Beyond predicting the reinforcement threshold, Eq.~(@eq:alpha_l) allows

us to analytically examine the relationship between $beta_c$ and

$alpha_c$. For random uncorrelated networks, we have the following

relationship:

$ beta_c = frac(1, chevron.l k chevron.r^3 \( alpha_c \/ lambda \)^(2 \/ eta) + chevron.l k chevron.r - 1) \, $<eq:beta_alpha_relation>

where the average degree $chevron.l k chevron.r$ quantifies the

network's edge density (see Appendix E for the derivation of

Eq.~(@eq:beta_alpha_relation)). Since all networks considered satisfy

$chevron.l k chevron.r > 2$, Eq.~(@eq:beta_alpha_relation) indicates

that $beta_c$ decreases monotonically with $alpha_c$, and that higher

$chevron.l k chevron.r$ values lead to lower values of both $beta_c$ and

$alpha_c$.



As previously noted, a smaller $beta_c$ allows contagion with lower

attractiveness to spread, whereas a smaller $alpha_c$ enables faster

diffusion and higher adoption. Thus, networks with lower $beta_c$ and

$alpha_c$ values are generally more effective at facilitating broad

diffusion. To assess real-world networks' efficacy, we plot them in the

($beta_c$, $alpha_c$) plane in Fig.~@fig:4\(a), including a reference

curve from Eq.~(@eq:beta_alpha_relation) with

$chevron.l k chevron.r = 2$, which serves as an upper bound. Most

networks align closely with or fall below this curve, supporting our

theoretical framework. Many networks cluster near the origin, suggesting

that real-world networks tend to be optimized for social contagion.

There are a few exceptions, primarily among collaboration networks,

which may be hindered by cultural or knowledge barriers in knowledge

transfer~ \[64\].



To better visualize these relationships, Fig.~@fig:4\(b) reproduces

Fig.~@fig:4\(a) using a logarithmic scale, incorporating troughs from

Eq.~(@eq:beta_alpha_relation) with varying $chevron.l k chevron.r$

values and color-coded markers representing network average degrees.

Most networks fall within the predicted troughs, validating our theory

on the relationship between the intrinsic threshold $beta_c$ and the

reinforcement threshold $alpha_c$. As shown earlier, $beta_c$ and

$alpha_c$ regulate the contagion processes: to maximize the number of

adopters, one would need to minimize both of them. However,

Eq.~(@eq:beta_alpha_relation) suggests that this is only achievable by

increasing the density of the networks (i.e., adding new connections).

When the network density is fixed, Eq.~(@eq:beta_alpha_relation)

introduces a trade-off: increasing localization strength (larger

$cal(L)$) would reduce $beta_c$ but increase $alpha_c$, and vice versa.



Under this constraint, we show that rewiring the network while

preserving edge density can adjust the values of $beta_c$ and $alpha_c$.

A particularly effective method is the Xulvi-Brunet--Sokolov algorithm~

\[65\], which modifies the localization strength by tuning network

assortativity (see Supplemental Material~ \[66\], Sec.~B.7). Increasing

assortativity enhances localization strength, raising $alpha_c$ while

lowering $beta_c$. Figure~@fig:4\(c) illustrates this effect on four

networks, confirming that Eq.~(@eq:beta_alpha_relation) holds. This

approach extends to synthetic networks, as shown in Fig.~@fig:4\(d).

Additionally, scatter plots of the predicted $alpha_c$ and $beta_c$

values exhibit patterns consistent with Fig.~@fig:4, further validating

our theoretical framework regarding the relationship between them (see

Supplemental Material~ \[67\], Sec.~B.6).



= Discussion

<discussion>

In this paper, we present a comprehensive analysis of a contagion

process that explicitly couples micro-level pairwise transmission with

macro-level positive feedback. Without macro-level reinforcement, the

system undergoes a continuous transition from a vanished state to a

prevalent state as the intrinsic attractiveness of the contagion

increases. Once the reinforcement strength exceeds a threshold

$alpha_c$, the final outbreak size exhibits an abrupt jump that is

nevertheless accompanied by critical behavior, a hallmark of mixed-order

criticality. This demonstrates the profound impact of macro-level

reinforcement on contagion dynamics.



To contextualize these findings within the broader landscape of

contagion research, we note that abrupt or explosive epidemic growth has

been observed in other irreversible spreading models, including those

driven by higher-order interactions~ \[42\] and collapse phenomena in

limited-resource detection processes~ \[43\]. In these systems, strongly

nonlinear outbreak curves emerge even though the underlying phase

transition remains continuous. Our work complements these studies by

revealing a distinct mechanism that produces mixed-order

transitions---characterized by an abrupt order-parameter jump

accompanied by critical behavior---through the interplay between global

reinforcement and structural localization.



Based on this insight, we identify network localization strength as a

key structural factor governing the onset of mixed-order behavior. To

quantify this property, we introduce the metric $cal(L)$, derived from

non-backtracking centrality, which captures heterogeneity in node-level

infection probabilities for percolation-like (irreversible) dynamics. By

accounting for path redundancy and avoiding overcounting from short

cycles, $cal(L)$ enables accurate prediction of the reinforcement

threshold $alpha_c$ directly from network topology. Its predictive power

stands in contrast to classical localization measures such as the

inverse participation ratio (IPR)~ \[44\], which were designed for

linear SIS processes and are less suited to percolation-like contagion

with feedback. Across diverse networks, $cal(L)$ consistently

outperforms IPR and other localization metrics in estimating $alpha_c$.

Its algebraic simplicity also suggests its potential applicability to

other dynamical processes on networks.



Beyond predicting the onset of mixed-order behavior, $cal(L)$ also

reveals a quantitative relationship between the intrinsic critical point

$beta_c$ and the reinforcement threshold $alpha_c$. This relationship

provides a practical framework for evaluating and optimizing contagion

efficiency in socio-economic systems. When promoting contagion, low

values of both thresholds are desirable and can be facilitated by

increasing network edge density. When edge density is fixed, however, a

fundamental trade-off emerges: lowering one threshold inevitably raises

the other. Consequently, highly attractive contagions benefit from

targeting populations with large $beta_c$ (and thus smaller $alpha_c$),

while less attractive contagions can still achieve global spread in

populations with lower $beta_c$, albeit more gradually.



Finally, although our analysis focuses on linear macro-level

reinforcement, real contagion processes often involve nonlinear forms of

global influence, including thresholds, saturation, and diminishing

returns. Linear reinforcement nevertheless serves as a standard

first-order approximation that maintains analytical tractability while

exposing the fundamental interaction between feedback and topology.

Therefore, this framework establishes a solid foundation for future

extensions incorporating nonlinear reinforcement functions in networked

diffusion systems.



#block[

This work was supported by the Key Program of the National Natural

Science Foundation of China (Grant No.~71731002), and by the Guangdong

Basic and Applied Basic Research Foundation (Grant

Nos.~2024A1515012692). Leyang Xue acknowledges the support of the China

Scholarship Council Program and the Israeli Sandwich Scholarship. The

authors thank Claudio Castellano for the helpful comments and

suggestions.



]

= Numerical simulations

<numerical-simulations>

In each realization, one node is randomly assigned the $A$ (adopter)

state to initiate the diffusion process, while all other nodes are set

to the $S$ (susceptible) state. The diffusion then proceeds according to

the model rules until it reaches an absorbing state, where no further

transmission is possible. Throughout this study, the recovery

probability $mu$ is fixed at $1$ for simplicity.



In our model, the critical point $beta_c$ is determined numerically by

identifying the maximum value of susceptibility, defined as

$ chi = frac(sqrt(chevron.l r \( oo \)^2 chevron.r - chevron.l r \( oo \) chevron.r^2), chevron.l r \( oo \) chevron.r) . $<eq:chi>

To ensure reliability, we perform $10^4$ independent realizations to

compute the first and second moments of $r \( oo \)$ for a given network

under identical parameters.



To determine $alpha_c$, we classify phase transitions by examining the

mass distribution of $r \( oo \)$ at the predicted $beta_c$ values,

varying $alpha$ across numerous independent realizations. Abrupt

transitions are identified by the appearance of an isolated peak

representing giant recovered clusters~ \[57\]. Additional details and

illustrative examples are provided in the Supplemental Material~ \[68\],

Sec.~B.5.



= Non-backtracking matrix and non-backtracking centrality

<non-backtracking-matrix-and-non-backtracking-centrality>

Given the central role of the non-backtracking matrix in our theoretical

analysis, we provide a brief introduction here. In an undirected network

with $L$ edges, the non-backtracking matrix $bold(B)$ is a

$2 L times 2 L$ non-symmetric matrix in which rows and columns

correspond to directed edges $j arrow.r i$, representing edges directed

from node $j$ to node $i$. The elements of $bold(B)$ are defined as

follows:

$ B_(z arrow.r i \, j arrow.r z') = {1 #h(2em) & i f quad z' = z \, j eq.not i \,\

0 #h(2em) & o t h e r w i s e .\

 $<eq:eqs19>



When all nodes in the network belong to a strongly connected giant

component, the non-backtracking matrix is non-negative and irreducible.

According to the Perron-Frobenius theorem~ \[69\], there exists a

positive leading eigenvector $v_(j arrow.r i)$ associated with the

largest eigenvalue $lambda_B$:

$ lambda_B v_(j arrow.r i) = sum_(k arrow.r m) B_(j arrow.r i \, k arrow.r m) v_(k arrow.r m) . $

The element $v_(j arrow.r i)$ of this leading eigenvector represents the

centrality of node $j$, excluding any influence from node $i$. The

non-backtracking centrality of node $i$ is then defined as:

$ x_i = sum_j A_(i j) v_(j arrow.r i) . $<eq:eqs25> Unlike eigenvector

centrality, non-backtracking centrality mitigates the "self-inflating"

effect associated with hub nodes~ \[45, 56\].



= Dynamic Message Passing method

<subsubsec:dmp>

To analytically determine the outbreak size and threshold, we use the

dynamic message passing (DMP) method. DMP is widely applied in contagion

studies as it prevents backtracking to the source node, thereby avoiding

mutual transmission effects~ \[70, 71, 54\]. This method effectively

predicts the probability of each node being in a given state at time

$t$, particularly in tree-like networks, and is robust to various

initial conditions.



First, we derive the exact equations that govern the DMP method. Let

$P_S^i \( t \)$, $P_A^i \( t \)$, and $P_R^i \( t \)$ denote the

probabilities of node $i$ being in the susceptible ($S$), adopted ($A$),

or recovered ($R$) state at time $t$, respectively. These probabilities

satisfy the following constraint:

$ P_A^i \( t \) + P_S^i \( t \) + P_R^i \( t \) = 1 . $<eq:sum_to_one>



The recovery of an adopted node $i$ occurs independently, regardless of

its neighbors' states. Therefore, the probability of node $i$ being in

the recovered state at time $t$, denoted $P_R^i \( t \)$, is given by:

$ P_R^i \( t \) = P_R^i \( t - 1 \) + mu P_A^i \( t - 1 \) \, $<eq:eqs4>

where $mu$ is the fixed recovery probability. To find the overall

fraction of recovered nodes in the network at time $t$, we sum

$P_R^i \( t \)$ across all nodes:

$ R \( t \) = sum_(i = 1)^N P_R^i \( t \) . $<eq:eqs5> Inserting

Eq.~(@eq:eqs5) into Eq.~(@eq:eqs3) yields:

$ beta' \( t \) = min (1 \, #h(0em) beta + alpha frac(sum_(i = 1)^N P_R^i \( t - 1 \), N)) \, $<eq:eqs7>

where $beta' \( t \)$ increases with $R \( t - 1 \)$ until it reaches a

maximum value of 1.



For a susceptible node $i$, the probability of remaining in the

susceptible state up to time $t$, denoted $P_S^i \( t \)$, can be

described as:

$ P_S^i \( t \) = P_S^i \( 0 \) Phi_i \( t \) \, $<eq:eqs8> where

$Phi_i \( t \)$ is the probability that node $i$ has not received

successful transmissions from any adopted neighbors by time $t$. The DMP

approach assumes that the network is tree-like, so each neighbor of node

$i$'s evolves independently. However, if node $i$ is influenced by a

neighbor node $z$ and switches to the adopted state ($A$), it may

attempt to influence another neighbor node $z'$. This interdependence

introduces a challenge, as the transitions of nodes $z$ and $z'$ become

correlated once $i$ adopts the contagion.



To address this issue, we assume that the focal node $i$ is in a cavity

state and define $theta^(z arrow.r i) \( t \)$ as the probability that

node $i$ has not been successfully influenced by node $z$ up to time

$t$. Consequently, $Phi_i \( t \)$ can be factorized as

$product_(z in partial i) theta^(z arrow.r i) \( t \)$, where

$partial i$ represents the set of neighbors of node $i$. Substituting

this expression into Eq.~(@eq:eqs8) gives:

$ P_S^i \( t \) = P_S^i \( 0 \) product_(z in partial i) theta^(z arrow.r i) \( t \) . $<eq:eqs9>



In message-passing, directionality is preserved, meaning that

$theta^(i arrow.r z) \( t \) eq.not theta^(z arrow.r i) \( t \)$ in

undirected networks. We treat each undirected edge as two directed edges

pointing in opposite directions. Initially, we set

$theta^(z arrow.r i) \( 0 \) = 1$ for all edges in the network. As time

progresses, $theta^(z arrow.r i) \( t - 1 \)$ decreases as the contagion

is transmitted from node $z$ to node $i$ with probability

$beta' \( t \) phi.alt^(z arrow.r i) \( t - 1 \)$, where

$phi.alt^(z arrow.r i) \( t - 1 \)$ represents the probability that the

adopted node $z$ has not yet passed the contagion to node $i$ by time

$t - 1$. Accordingly, $theta^(z arrow.r i) \( t \)$ updates according to

the rule:

$ theta^(z arrow.r i) \( t \) = theta^(z arrow.r i) \( t - 1 \) - beta' \( t \) phi.alt^(z arrow.r i) \( t - 1 \) . $<eq:eqs10>



To derive the expression for $phi.alt^(z arrow.r i) \( t \)$, we first

recognize that $phi.alt^(z arrow.r i) \( t \)$ decreases when node $z$

(currently in the adopted state $A$) recovers, or it transmits the

contagion to node $i$, or both events occur simultaneously. The

probabilities for these events are $mu$, $beta' \( t \)$, and

$mu beta' \( t \)$, respectively. Additionally,

$phi.alt^(z arrow.r i) \( t \)$ can increase if node $z$, originally in

the susceptible state $S$, switches to the adopted state $A$. The rate

of this change, $Delta P_S^(z arrow.r i) \( t \)$, can be expressed as

the difference between the probabilities of node $z$ remaining

susceptible at consecutive times, i.e.,

$P_S^(z arrow.r i) \( t - 1 \) - P_S^(z arrow.r i) \( t \)$. Here,

$P_S^(z arrow.r i) \( t \)$ represents the probability of node $z$

remaining in state $S$ after interacting with the node $i$ in the cavity

state. Combining these elements, we have:



#block[

$ phi.alt^(z arrow.r i) \( t \) & = & phi.alt^(z arrow.r i) \( t - 1 \) - beta' \( t \) phi.alt^(z arrow.r i) \( t - 1 \) - mu phi.alt^(z arrow.r i) \( t - 1 \) + mu beta' \( t \) phi.alt^(z arrow.r i) \( t - 1 \)\

 &  & + P_S^(z arrow.r i) \( t - 1 \) - P_S^(z arrow.r i) \( t \)\

 & = & \( 1 - beta' \( t \) \) \( 1 - mu \) phi.alt^(z arrow.r i) \( t - 1 \) + P_S^(z arrow.r i) \( t - 1 \) - P_S^(z arrow.r i) \( t \) . $<eq:eqs11>



]

Next, we need to explicitly define $P_S^(z arrow.r i) \( t \)$. Since we

are treating node $i$ as a cavity, node $z$ will remain susceptible as

long as it is not influenced by any of its neighbors other than $i$.

Using Eq.~(@eq:eqs9), the probability that node $z$ remains susceptible

while $i$ is a cavity is given by:

$ P_S^(z arrow.r i) \( t \) = P_S^z \( 0 \) product_(j in partial z \\ i) theta^(j arrow.r z) \( t \) \, $<eq:eqs12>

where $partial z \\ i$ represents the set of neighbors of $z$, excluding

$i$. At $t = 0$, we set the initial condition as

$P_S^(z arrow.r i) \( 0 \) = 1$ if $z$ is not the initial adopter, and

$P_S^(z arrow.r i) \( 0 \) = 0$ if $z$ is the seed node. This can be

compactly represented by

$P_S^(z arrow.r i) \( 0 \) = 1 - delta_(q_z \( 0 \) \, A)$, where

$delta_(q_z \( 0 \) \, A)$ is the Kronecker delta function indicating

the initial state of node $z$.



Using Eqs.~(@eq:eqs7), (@eq:eqs10)-(@eq:eqs12), we can finally compute

the trajectories of $theta^(z arrow.r i) \( t \)$,

$phi.alt^(z arrow.r i) \( t \)$, and $P_S^(z arrow.r i) \( t \)$,

starting with the following initial conditions:

$ theta^(z arrow.r i) \( 0 \) & = & 1 \,\

phi.alt^(z arrow.r i) \( 0 \) & = & P_A^z \( 0 \) = delta_(q_z \( 0 \) \, A) \,\

P_S^(z arrow.r i) \( 0 \) & = & P_S^z \( 0 \) = 1 - delta_(q_z \( 0 \) \, A) . $<eq:eqs13>

Additionally, by incorporating the initial conditions

$P_R^i \( 0 \) = 0$ and $beta' \( 0 \) = beta$ into

Eqs.~(@eq:sum_to_one), (@eq:eqs4), (@eq:eqs7), and

(@eq:eqs9)-(@eq:eqs12), we can compute the complete trajectories of

$P_S^i \( t \)$, $P_A^i \( t \)$, $P_R^i \( t \)$, ultimately

determining the order parameter $R \( oo \)$. The DMP approach used here

has a computational complexity of $O \( L \)$, where $L$ denotes the

number of edges in the network.



= Relationship between reinforcement threshold and localization strength

<relationship-between-reinforcement-threshold-and-localization-strength>

To characterize the relationship between the localization strength

$cal(L)$ and $alpha_c$, we begin by calculating their values across

various network models and real-world networks (see Supplemental

Material~ \[55\], Sec.~A.2) and visualizing them We observe that

$alpha_c$ increases linearly with $cal(L)$ on a logarithmic scale,

suggesting a relationship of the form

$ln alpha_c = eta ln cal(L) + delta$, or equivalently,

$alpha_c = lambda cal(L)^eta$, where $lambda = e^delta$. The parameters

$eta$ and $delta$ are estimated from the data. To avoid overfitting the

real-world networks, we apply the least squares method to fit this

relationship to a set of network models, yielding $eta = 1.00$ and

$lambda = 2.63$. Therefore, we have $alpha_c = 2.63 cal(L)$. This

relationship allows us to estimate $alpha_c$ based on network topology.



= Relationship between critical point and reinforcement threshold

<relationship-between-critical-point-and-reinforcement-threshold>

With the analytical expressions of $alpha_c$ and $beta_c$, we can now

explore their relationship. In uncorrelated random networks, the

components of the leading eigenvector in the non-backtracking matrix are

determined by node degrees, as expressed in Eq.~(@eq:eqs26)~ \[56\],

$ v_(j arrow.r i) tilde.op k_j - 1 . $<eq:eqs26> Using this

approximation, we can represent the non-backtracking centrality for node

$i$ as:

$ x_i = sum_j A_(i j) v_(j arrow.r i) tilde.op sum_j frac(k_i k_j, N chevron.l k chevron.r) \( k_j - 1 \) = frac(chevron.l k^2 chevron.r - chevron.l k chevron.r, chevron.l k chevron.r) k_i \, $<eq:eqs27>

where we replace $A_(i j)$ by its expectation in annealed networks,

$hat(A)_(i j) = frac(k_i k_j, N chevron.l k chevron.r)$. The first

moment of $x_i$ then becomes:

$ chevron.l x_i chevron.r = frac(sum_i x_i, N) tilde.op chevron.l k^2 chevron.r - chevron.l k chevron.r . $<eq:eqs28>

Substituting Eqs.~(@eq:eqs27) and (@eq:eqs28) into the expression for

localization strength, Eq.~(@eq:localization_strength), we obtain:

$ cal(L) = sqrt(chevron.l k^2 chevron.r - chevron.l k chevron.r^2) / chevron.l k chevron.r^2 . $<eq:eqs29>

This result shows that $cal(L)$ depends solely on the first- and

second-order moments of $chevron.l k chevron.r$. Similarly, in annealed

networks~ \[56\], $beta_c$ can be written as:

$ beta_c = frac(chevron.l k chevron.r, chevron.l k^2 chevron.r - chevron.l k chevron.r) . $<eq:eqs30>

Combining Eqs.~(@eq:eqs29) and (@eq:eqs30), we have:

$ beta_c = frac(1, chevron.l k chevron.r^3 cal(L)^2 + chevron.l k chevron.r - 1) . $<eq:eqs31>



Finally, by incorporating the relationship

$alpha_c = lambda cal(L)^eta$, we can express $beta_c$ in terms of

$alpha_c$:

$ beta_c = frac(1, chevron.l k chevron.r^3 \( alpha_c \/ lambda \)^(2 \/ eta) + chevron.l k chevron.r - 1) . $<eq:eqs32>



#heading(level: 1, numbering: none)[Data availability]

<data-availability>

All data supporting this study are available on Mendeley

Data~(#link("https://data.mendeley.com/datasets/d848h7rcdg")) and are

described in detail in the Supplemental Material~ \[72\].



#heading(level: 1, numbering: none)[References]

\[1\] Everett~M Rogers. #emph[Diffusion of innovations]. New York: The
Free Press, 2003.

\[2\] Johan Ugander, Lars Backstrom, Cameron Marlow, and Jon Kleinberg.
Structural diversity in social contagion. #emph[Proc. Natl. Acad. Sci.
U.S.A.], 109(16):5962--5966, 2012.

\[3\] Iacopo Iacopini, Giovanni Petri, Alain Barrat, and Vito Latora.
Simplicial models of social contagion. #emph[Nat. Commun.], 10(1):2485,
\2019.

\[4\] Rabik~Ar Chatterjee and Jehoshua Eliashberg. The innovation
diffusion process in a heterogeneous population: A micromodeling
approach. #emph[Manage Sci], 36(9):1057--1079, 1990.

\[5\] Frances~Stokes Berry and William~D Berry. Innovation and diffusion
models in policy research. #emph[Theories of the policy process], pages
253--297, 2018.

\[6\] Gabriel~E. Kreindler and H.~Peyton Young. Rapid innovation
diffusion in social networks. #emph[Proc. Natl. Acad. Sci.],
111:10881--10888, 2014.

\[7\] Frank~M Bass. A new product growth for model consumer durables.
#emph[Manage Sci], 15(5):215--227, 1969.

\[8\] Elmar Kiesling, Markus Günther, Christian Stummer, and Lea~M
Wakolbinger. Agent-based simulation of innovation diffusion: a review.
#emph[Cent Eur J Oper Res], 20(2):183--230, 2012.

\[9\] Giulia Cencetti, Diego Andrés Contreras, Marco Mancastroppa, and
Alain Barrat. Distinguishing simple and complex contagion processes on
networks. #emph[Phys. Rev. Lett.], 130(24):247401, 2023.

\[10\] Yichuan Jiang and J.~C. Jiang. Diffusion in social networks: A
multiagent perspective. #emph[IEEE Trans. Syst. Man Cybern. Syst.],
45(2):198--213, 2014.

\[11\] Romualdo Pastor-Satorras, Claudio Castellano, Piet Van~Mieghem,
and Alessandro Vespignani. Epidemic processes in complex networks.
#emph[Rev. Mod. Phys.], 87:925--979, Aug 2015.

\[12\] Luís MA Bettencourt, Ariel Cintrón-Arias, David I Kaiser, Carlos
Castillo-Chávez. The power of a good idea: Quantitative modeling of the
spread of ideas from epidemiological models. #emph[Physica A],
364:513--536, 2006.

\[13\] Damon Centola and Michael Macy. Complex contagions and the
weakness of long ties. #emph[American Journal of Sociology],
113(3):702--734, 2007. The University of Chicago Press.

\[14\] Damon Centola. The spread of behavior in an online social network
experiment. #emph[Science], 329(5996):1194--1197, 2010.

\[15\] Damon Centola. #emph[How Behavior Spreads: The Science of Complex
Contagions]. Volume 3. Princeton University Press, Princeton, NJ, 2018.

\[16\] Douglas Guilbeault, Joshu Becker, and Damon Centola.
#emph[Complex Contagions: A Decade in Review], pages 3--25. Springer
International Publishing, Cham, 2018.

\[17\] Duncan~J Watts. A simple model of global cascades on random
networks. #emph[Proc. Natl. Acad. Sci. U.S.A.], 99(9):5766--5771, 2002.

\[18\] Sandeep Chowdhary, Aanjaneya Kumar, Giulia Cencetti, Iacopo
Iacopini, and Federico Battiston. Simplicial contagion in temporal
higher-order networks. #emph[J. Phys. Complex.], 2(3):035019, 2021.

\[19\] Guilherme Ferraz de Arruda, Giovanni Petri, and Yamir Moreno.
Social contagion models on hypergraphs. #emph[Phys. Rev. Res.],
2(2):023032, 2020.

\[20\] Zhen Su, Wei Wang, Lixiang Li, H.~Eugene Stanley, and Lidia A.
Braunstein. Optimal community structure for social contagions. #emph[New
J. Phys.], 20(5):053053, 2018.

\[21\] Guillaume St-Onge, Iacopo Iacopini, Vito Latora, Alain Barrat,
Giovanni Petri, Antoine Allard, and Laurent Hébert-Dufresne. Influential
groups for seeding and sustaining nonlinear contagion in heterogeneous
hypergraphs. #emph[Commun. Phys.], 5(1):25, 2022.

\[22\] Guilherme Ferraz de Arruda, Giovanni Petri, Pablo Martin
Rodriguez, and Yamir Moreno. Multistability, intermittency, and hybrid
transitions in social contagion models on hypergraphs. #emph[Nat.
Commun.], 14(1):1375, 2023.

\[23\] Guilherme Ferraz de Arruda, Alberto Aleta, and Yamir Moreno.
Contagion dynamics on higher-order networks. #emph[Nat. Rev. Phys.],
6(8):468--482, 2024.

\[24\] Jukka-Pekka Onnela and Felix Reed-Tsochas. Spontaneous emergence
of social influence in online systems. #emph[Proc. Natl. Acad. Sci.],
107(43):18375--18380, 2010.

\[25\] Jameson L. Toole, Meeyoung Cha, and Marta C. González. Modeling
the adoption of innovations in the presence of geographic and media
influences. #emph[PLoS One], 7(1):e29528, 2012.

\[26\] Zhenfeng Ma, Zhiyong Yang, and Mehdi Mourali. Consumer adoption
of new products: Independent versus interdependent self-perspectives.
#emph[J. Mark.], 78(2):101--117, 2014.

\[27\] Haewoon Kwak, Changhyun Lee, Hosung Park, and Sue Moon. What is
Twitter, a social network or a news media? In #emph[Proceedings of the
19th International Conference on World Wide Web], pages 591--600, April
\2010.

\[28\] Fabio Duarte. Number of ChatGPT Users (Nov 2024). Exploding
Topics, November 12, 2024. Accessed November 13, 2024.
#link("https://explodingtopics.com/blog/chatgpt-users").

\[29\] Wenjing Duan, Bin Gu, and Andrew B. Whinston. Informational
cascades and software adoption on the internet: an real-world
investigation. #emph[MIS Quarterly], pages 23--48, 2009.

\[30\] Hyeon Jo and Youngsok Bang. Analyzing ChatGPT adoption drivers
with the TOEK framework. #emph[Sci. Rep.], 13(1):22606, 2023.

\[31\] Soroush Vosoughi, Deb Roy, and Sinan Aral. The spread of true and
false news online. #emph[Science], 359(6380):1146--1151, 2018.

\[32\] V.~Kumar, Abdul~R. Ashraf, and Waqar Nadeem. -powered marketing:
What, where, and how? #emph[Int. J. Inf. Manag.], 77:102783, 2024.

\[33\] Daire McCoy and Seán Lyons. Consumer preferences and the
influence of networks in electric vehicle diffusion: An agent-based
microsimulation in ireland. #emph[Energy Res. Soc. Sci.], 3:89--101,
\2014.

\[34\] H~Peyton Young. Innovation diffusion in heterogeneous
populations: Contagion, social influence, and social learning. #emph[Am
Econ Rev], 99(5):1899--1924, 2009.

\[35\] Ching-Wen Chen, Hung-Yi Chang, Juin-Han Chen, and Richard Weng.
Elucidating the role of conformity in innovative smartphones. #emph[Int.
J. Mob. Commun.], 14(1):56--78, 2016.

\[36\] Michael~L. Katz and Carl Shapiro. Product introduction with
network externalities. #emph[J Ind Econ], 40(1):55--83, 1992.

\[37\] Detlef Schoder. Forecasting the success of telecommunication
services in the presence of network effects. #emph[Inf. Econ. Policy],
12(2):181--200, 2000.

\[38\] Jeffrey~H Rohlfs. #emph[Bandwagon effects in high-technology
industries]. MIT press, 2003.

\[39\] Frederic~M Scherer and David Ross. Industrial market structure
and economic performance. #emph[University of Illinois at
Urbana-Champaign's Academy for entrepreneurial leadership historical
research reference in entrepreneurship], 1990.

\[40\] Edgar~K Browning and Mark~A Zupan. #emph[Microeconomics: Theory
and applications]. John Wiley & Sons, 2020.

\[41\] Francis~A Buttle. Word of mouth: understanding and managing
referral marketing. #emph[J. Strateg. Mark.], 6(3):241--254, 1998.

\[42\] F.~Malizia, A.~Guzmán, I.~Iacopini, and I.~Z.~Kiss. Disentangling
the role of heterogeneity and hyperedge overlap in explosive contagion
on higher-order networks. #emph[Phys. Rev. Lett.], 135(20):207401, 2025.

\[43\] S.~Lamata-Otı́n, A.~Reyna-Lara, D.~Soriano-Paños, V.~Latora, and
J.~Gómez-Gardeñes. Collapse transition in epidemic spreading subject to
detection with limited resources. #emph[Phys. Rev. E], 108(2):024305,
\2023.

\[44\] A.~V. Goltsev, S.~N. Dorogovtsev, J.~G. Oliveira, and J.~F.~F.
Mendes. Localization and spreading of diseases in complex networks.
#emph[Phys. Rev. Lett.], 109:128702, Sep 2012.

\[45\] Travis Martin, Xiao Zhang, and M.~E.~J. Newman. Localization and
centrality in networks. #emph[Phys. Rev. E], 90:052808, Nov 2014.

\[46\] Catherine~SE Bale, Nicholas~J McCullen, Timothy~J Foxon,
Alastair~M Rucklidge, and William~F Gale. Harnessing social networks for
promoting adoption of energy technologies in the domestic sector.
#emph[Energy Policy], 63:833--844, 2013.

\[47\] Sebastiano~A Delre, Wander Jager, Tammo~HA Bijmolt, and Marco~A
Janssen. Will it spread or not? the effects of social influences and
network topology on innovation diffusion. #emph[J Prod Innov Manage],
27(2):267--282, 2010.

\[48\] See Supplemental Material at \[URL\] for details on the network
datasets and additional numerical results.

\[49\] See Supplemental Material at \[URL\] for details on the
mixed-order (hybrid) phase transition and the associated scaling
analyses (Sec.~B.2).

\[50\] See Supplemental Material at \[URL\] for details on the effect of
macro-level reinforcement on the intrinsic threshold $beta_c$
(Sec.~B.3).

\[51\] S~Boccaletti, JA~Almendral, S~Guan, I~Leyva, Z~Liu,
I~Sendiña-Nadal, Z~Wang, and Y~Zou. Explosive transitions in complex
networks' structure and dynamics: Percolation and synchronization.
#emph[Phys. Rep.], 660:1--94, 2016.

\[52\] Raissa~M D'Souza, Jesus Gómez-Gardenes, Jan Nagler, and Alex
Arenas. Explosive phenomena in complex networks. #emph[Adv. Phys.],
68(3):123--223, 2019.

\[53\] See Supplemental Material at \[URL\] for details on the
implications of the reinforcement threshold $alpha_c$ (Sec.~B.1).

\[54\] Andreas Koher, Hartmut H.~K. Lentz, James~P. Gleeson, and Philipp
Hövel. Contact-based model for epidemic spreading on temporal networks.
#emph[Phys. Rev. X], 9:031017, Aug 2019.

\[55\] See Supplemental Material at \[URL\] for details on the network
models (Sec.~A.2).

\[56\] Romualdo Pastor-Satorras and Claudio Castellano. The localization
of non-backtracking centrality in networks and its physical
consequences. #emph[Sci. Rep.], 10(1):1--12, 2020.

\[57\] Weiran Cai, Li~Chen, Fakhteh Ghanbarnejad, and Peter Grassberger.
. #emph[Nat. Phys.], 11(11):936--940, 2015.

\[58\] Peng-Bi Cui, Wei Wang, Shi-Min Cai, Tao Zhou, Ying-Cheng Lai,
et~al. Close and ordinary social contacts: How important are they in
promoting large-scale contagion? #emph[Phys. Rev. E], 98(5):052311,
\2018.

\[59\] Munik Shrestha, Samuel~V Scarpino, and Cristopher Moore.
Message-passing approach for recurrent-state epidemic models on
networks. #emph[Phys. Rev. E], 92(2):022821, 2015.

\[60\] G. Timár, S.~N. Dorogovtsev, and J.~F.~F. Mendes. Localization of
nonbacktracking centrality on dense subgraphs of sparse networks.
#emph[Phys. Rev. E], 107:014301, Jan 2023.

\[61\] Phillip Bonacich. Factoring and weighting approaches to status
scores and clique identification. #emph[J Math Sociol], 2(1):113--120,
\1972.

\[62\] RB~Bendel, SS~Higgins, JE~Teberg, and DA~Pyke. Comparison of
skewness coefficient, coefficient of variation, and gini coefficient as
inequality measures within populations. #emph[Oecologia],
78(3):394--400, 1989.

\[63\] See Supplemental Material at \[URL\] for a comparison of
different approaches to quantify the localization strength and their
performance in predicting $alpha_c$ (Sec.~B.4).

\[64\] Margaret~L Sheng, Shen-Yao Chang, Thompson Teo, and Yuh-Feng Lin.
Knowledge barriers, knowledge transfer, and innovation competitive
advantage in healthcare settings. #emph[Manag. Decis.], 51(3):461--478,
\2013.

\[65\] R.~Xulvi-Brunet and I.~M. Sokolov. Reshuffling scale-free
networks: From random to assortative. #emph[Phys. Rev. E], 70:066102,
Dec 2004.

\[66\] See Supplemental Material at \[URL\] for details on tuning the
localization strength of networks (Sec.~B.7).

\[67\] See Supplemental Material at \[URL\] for an analysis of the
relation between the predicted critical threshold $beta_c$ and the
reinforcement threshold $alpha_c$ (Sec.~B.6).

\[68\] See Supplemental Material at \[URL\] for details on identifying
the class of phase transitions (Sec.~B.5).

\[69\] Roger~A Horn and Charles~R Johnson. #emph[Matrix analysis].
Cambridge university press, 2012.

\[70\] Brian Karrer and M.~E.~J. Newman. Message passing approach for
general epidemic models. #emph[Phys. Rev. E], 82:016101, Jul 2010.

\[71\] Andrey~Y. Lokhov, Marc Mézard, Hiroki Ohta, and Lenka Zdeborová.
Inferring the origin of an epidemic with a dynamic message-passing
algorithm. #emph[Phys. Rev. E], 90:012801, Jul 2014.

\[72\] See Supplemental Material at \[URL\] for detailed descriptions of
the data used in this study.

\[73\] Ryan~A. Rossi and Nesreen~K. Ahmed. The network data repository
with interactive graph analytics and visualization. In #emph[AAAI],
\2015.

\[74\] Krzysztof~J Cios and Lukasz~A Kurgan. Trends in data mining and
knowledge discovery. In #emph[Advanced techniques in knowledge discovery
and data mining], pages 1--26. Springer, 2005.

\[75\] Vladimir Batagelj and Andrej Mrvar. Analysis of large networks.
In #emph[Proceedings of Pajek Workshop at XXVI Sunbelt Conference],
\2006.

\[76\] Jure Leskovec and Andrej Krevl. : Stanford large network dataset
collection. #link("http://snap.stanford.edu/data"), June 2014.

\[77\] Albert-László Barabási. #emph[Network Science]. Cambridge
University Press, 2016.

\[78\] K.-I. Goh, B.~Kahng, and D.~Kim. Universal behavior of load
distribution in scale-free networks. #emph[Phys. Rev. Lett.], 87:278701,
Dec 2001.

\[79\] B.~Gross, I.~Bonamassa, and S.~Havlin. Fractal fluctuations at
mixed-order transitions in interdependent networks.
#emph[Phys.~Rev.~Lett.], 129(26):268301, 2022.

\[80\] I.~Bonamassa, B.~Gross, J.~Kertész, and S.~Havlin. Hybrid
universality classes of systemic cascades. #emph[Nat.~Commun.], 16:1415,
\2025.

\[81\] J.~Korbel, S.~Havlin, and S.~Thurner. Microscopic origin of
abrupt mixed-order phase transitions. #emph[Nat.~Commun.], 16:2628,
\2025.

\[82\] A.~Bunde and S.~Havlin. Fractals and disordered systems.
#emph[Springer], 2012.

\[83\] A.~Bar and D.~Mukamel. Mixed-order phase transition in a
one-dimensional model. #emph[Phys.~Rev.~Lett.], 112(1):015701, 2014.

\[84\] D.~Stauffer and A.~Aharony. Introduction to percolation theory.
(Taylor & Francis, 2018).

\[85\] D.~Zhou, A.~Bashan, R.~Cohen, Y.~Berezin, N.~Shnerb, and
S.~Havlin. Simultaneous first- and second-order percolation transitions
in interdependent networks. #emph[Phys.~Rev.~E], 90(1):012803, 2014.

\[86\] B.~Gross, I.~Volotsenko, Y.~Sallem, N.~Yadid, I.~Bonamassa,
S.~Havlin, and A.~Frydman. The random cascading origin of abrupt
transitions in interdependent systems. #emph[Nat.~Commun.], 16:5869,
\2025.

\[87\] D.~Dilmoney, B.~Gross, S.~Havlin, and N.~M.~Shnerb. Dynamics of
critical cascades in interdependent networks. #emph[Phys.~Rev.~Lett.],
134(18):187401, 2025.
