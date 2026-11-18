#import "cross-section.typ": radial-inset
#set document(title: "Stiffness and Buckling Behavior of Woven Columns")
#set page(paper: "us-letter", margin: (x: 17mm, y: 20mm), numbering: "1")
#set text(font: "New Computer Modern", size: 11.5pt)
#set par(justify: true, leading: .55em, first-line-indent: 1em)
#set heading(numbering: "1.1")
#show heading: set text(font: "Arial")
#set figure(supplement: [Figure])
#set figure.caption(separator: [. ])
#show figure.caption: set text(font: "Arial", size: 9pt)
#set math.equation(numbering: "(1)", supplement: none)

#text(font: "Arial", size: 20pt, weight: "bold")[Stiffness and Buckling Behavior of Woven Columns]

#text(font: "Arial", size: 12pt, weight: "bold")[Jaimie Krankel#super[1], Guowei Wayne Tu#super[2], and #link("mailto:filipov@umich.edu")[Evgueni T. Filipov]#super("1,2,*")]

#text(size: 9pt, font: "Arial")[
  #super[1] Deployable and Reconfigurable Structures Laboratory, Department of Mechanical Engineering, University of Michigan, Ann Arbor, MI, USA \
  #super[2] Deployable and Reconfigurable Structures Laboratory, Department of Civil Engineering, University of Michigan, Ann Arbor, MI, USA \
  \* E-mail: #link("mailto:filipov@umich.edu")[filipov\@umich.edu]
]

#text(font: "Arial", weight: "bold")[ABSTRACT]
#block[Woven shell structures are beneficial for applications requiring lightweight, damage resilience, and design tunability, such as in wearable devices, soft robotics, and aerospace systems. A fundamental component of woven structures is the woven column. While the mechanical properties of a woven column can be determined using sophisticated finite element (FE) simulations, these FE models are computationally expensive and do not explain the underlying mechanics behind scaling relationships. In this work, we derive purely analytical models for the buckling load and stiffness of woven columns, and discuss the criteria that lead to different buckling modes of the woven columns. The simulated results based on our models closely match experimental data across various weave design parameters. This work advances our understanding of the mechanics of woven systems and serves as a baseline for the design of next-generation hierarchical structures and materials.]

#text(size: 9pt)[*Keywords:* woven structure, analytical model, shell buckling, local buckling]

= Introduction

<introduction>

The long-standing craft of weaving has gained traction in modern engineering due to its mechanical strength, damage tolerance, and lightweight properties. These intrinsic benefits of weaving make it suitable for smart material devices, soft robotics, aerospace applications, and more @wayne@tu2025engineering@tu2024origami@JING2025113262@WANG2022115246. The plain weave (@fig:1\(a)), in which perpendicular weavers alternate over and under each other, is the most commonly implemented pattern. This simple weave pattern achieves tight interlocking of material, making for strong and durable structures @ABUBAKAR2013575. Previous work shows that plain woven 3D shell structures have much greater resilience @wayne yet they share similar stiffness to their continuous counterparts, as demonstrated in @fig:1\(b).

Similar to the continuous cylindrical shell, the woven column is a fundamental unit of 3D woven shell structures. Cylindrical shell buckling has been widely studied, and there exist closed-form solutions for their behaviors@hilburger2020buckling@hutchinson2018knockdowns@MA2023110330. Woven column buckling behaviors, however, are more complicated due to local interactions between weavers (@fig:1\(c)). Recent work on woven materials has focused on implementing finite element analysis techniques @KUMAR2025107736@JUNIOR2024104274@NILAKANTAN20102300@Nguyen2018 and semi-analytical modeling @LUO2021108503@Dabiryan2022@ElMessiry2018 to determine mechanical properties such as stiffness and buckling behaviors. These models require large computational power, and unlike an analytical model, they can only provide limited insight on the underlying mechanics of the system behavior. Moreover, the mechanical behavior of the cylindrical woven column unit has remained unexplored.

In this work, we derive purely analytical models for the stiffness and buckling forces of woven columns. Through physical experiments we explore the axial behavior of the column and verify the analytical models. We then classify global and local buckling modes of woven columns, and determine relationships between the buckling mode and the width of weavers. Our models and findings explain scaling laws where the stiffness and buckling load of woven columns change with the thickness and width of weavers. This work provides tools for choosing suitable weaver parameters for 3D woven column structures when they are to be designed for various potential engineering applications.

#figure(image("source/figure1.png", width: 100%),

  caption: [#strong[Overview of the woven columns and their buckling behaviors which are explored in this work]. #strong[a.] Fabrication of a plain woven column, which is a fundamental unit for 3D woven shell structures. We assemble the vertical and horizontal weavers (left) into a woven column (right) using a plain weave pattern. #strong[b.] A comparison shows that a woven column (top) does not experience permanent damage after buckling, whereas a continuous column (bottom) made with the same amount of material experiences plastic deformation and fracture. #strong[c.] Buckling modes of twelve different woven columns, where localized out-of-plane deformations of weavers contribute to buckling of the columns. The buckling pattern is dependent on the parameters of the vertical and horizontal weavers. Scale bars are 5 cm.]

)

<fig:1>

= Mechanics model derivation

<Sec:Modeling>

We use fundamental mechanics theory to derive models for the stiffness and critical buckling loads of a thin-walled, densely woven column. These models are based on geometric parameters and material properties of the vertical and horizontal weavers we use to fabricate the columns.

== Buckling of woven columns

<buckling-of-woven-columns>

We assume that prior to buckling, the deformation of the woven columns is small and linear. Thus, we estimate that the critical buckling load of a woven column is the sum of the critical load of its vertical weavers and that of its horizontal weavers: $P_(c r \, med t o t a l) = P_(c r \, med h) + P_(c r \, med v)$. We first consider the critical load of vertical weavers $P_(c r \, med v)$. To simplify our model, we assume that the adjacent vertical weavers in a woven column initially buckle independently. Furthermore, by assuming a densely woven cylinder, each segment of a vertical weaver along its length also behaves independently. The load on a weaver with a small initial out-of-plane displacement can be approximated by the buckling force of an initially straight weaver since this force is minimally greater. Illustrated in @fig:2\(a), the buckling force of the combined vertical weavers is then governed by the buckling force of a singular segment. Based on the Euler buckling theory, $P_(c r \, med v)$ is dependent on the width of vertical weavers $w_v$, the thickness of vertical weavers $t_v$, and the width of horizontal weavers $w_h$ (which is also the length of each segment of a vertical weaver): @hibbeler2015mechanics $ P_(c r \, med v) = n_v frac(pi^2 E dot.op w_v t_v^3, w_h^2) \, $#label("eqn:P_cr,v") where $n_v$ is the total number of vertical weavers and $E$ is the Young's modulus of the material.

Next, we consider the critical buckling load of the horizontal weavers $P_(c r \, med h)$. These weavers are assumed to be short cylindrical shells with axisymmetric sinusoidal initial perturbations. Based on previous research on thin-walled cylinders @hilburger2020buckling, the critical buckling load of a horizontal weaver is dependent on its normalized thickness $t_h \/ R$ (where $t_h$ is the thickness of horizontal weavers and $R$ is the radius of the woven column) and the surface area of the horizontal weaver $A_f$. We use Koiter's knockdown factor $beta$ to account for the influence of the initial sinusoidal perturbation on the buckling load: @hutchinson2018knockdowns $ P_(c r \, med h) = beta dot.op frac(E \( t_h \/ R \), sqrt(3 \( 1 - nu^2 \))) dot.op A_f \, $#label("eqn:P_cr,h") where $nu$ is the Poisson's ratio. Axisymmetric sinusoidal perturbations greatly reduce the buckling force compared to a perfect cylindrical shell. To account for this influence, Koiter's knockdown factor $beta$ is solved implicitly using material parameters and the imperfection perturbation size $delta_h$ shown in @fig:2\(b) @koiter1963knockdowns: $ beta dot.op #scale(x: 180%, y: 180%)[\(] delta_h / t_h #scale(x: 180%, y: 180%)[\)] = #scale(x: 180%, y: 180%)[\(] 4 / 27 \( 1 - nu^2 \) #scale(x: 180%, y: 180%)[\)]^(1 \/ 2) \( 1 - beta \)^2 . $<eqn:beta> The perturbation term $delta_h$ in Eq. @eqn:beta is calculated by approximating the horizontal weaver as a polygonal section with $n_v$ sides where the length of each side is $w_v$. Then $delta_h$ is the average distance of this polygon from a circle of equal circumference. Equivalently, we take half the distance between its maximum and minimum radii as in @fig:2\(b) to calculate the $delta_h$: $ delta_h = 1 / 2 #scale(x: 240%, y: 240%)[\(] frac(w_v, 2 sin \( pi / n_v \)) + frac(w_v, 2 tan \( pi / n_v \)) #scale(x: 240%, y: 240%)[\)] . $<eqn:delta_h>

We compute the buckling force of the horizontal weavers using Eqs. (#ref(label("eqn:P_cr,h"))), (@eqn:beta), and (@eqn:delta_h). We then add it to the buckling force of the vertical weavers Eq. (#ref(label("eqn:P_cr,v"))) to obtain the buckling force of the entire woven column.

== Stiffness of woven columns

<stiffness-of-woven-columns>

Considering the linear deformation where the displacement is infinitesimally small, we assume that the stiffness of a woven column is the sum of the stiffness of its horizontal weavers $k_h$ and the stiffness of its vertical weavers $k_v$: $k_(t o t a l) = k_h + k_v$. We first consider the vertical weaver stiffness $k_v$. We assume that the vertical weavers deform sinusoidally as they are compressed, and that bending deformations store significantly more energy than axial deformations. All vertical weavers act in parallel and resist bending deformations. The slender vertical weavers mainly bend about the favored axis of bending (the horizontal axis), but they also bend about the less favored axis of bending (the vertical axis). Therefore, the vertical weavers take on a curved cross-section due to the nature of weaving, and this pre-curvature increases their stiffness significantly by a factor $alpha$ @Pini2016@Taffetani2019@PhysRevLett.113.214301. We balance forces and moments at the location of the greatest perturbation (as in @fig:2\(a)) to obtain a dependence of the axial load of the weaver $P_v$ on flexural rigidity $E I$, number of vertical weavers $n_v$, out-of-plane curvature of the weaver $kappa$, and linear displacement perturbation $delta_v$. Note that $kappa$ and $delta_v$ are both functions of the axial displacement $Delta$. We calculate the stiffness as the derivative of axial load with respect to axial displacement: $ k_v = alpha dot.op n_v / n_h dot.op frac(d, d Delta) #scale(x: 240%, y: 240%)[\(] E I frac(kappa \( Delta \), delta_v \( Delta \)) #scale(x: 240%, y: 240%)[\)] $<eqn:k_v1> The factor $alpha$ accounts for the significant effect of curvature induced stiffness @Pini2016@Taffetani2019@PhysRevLett.113.214301, which increases with vertical weaver width. We apply Pini's equation @Pini2016 to the vertical weaver segments, using the radius of the woven column $R$: $ alpha = frac(w_v^4, 60 t_v^2) #scale(x: 120%, y: 120%)[\(] delta_v \( frac(n_h pi, L - Delta) \)^2 - nu / R #scale(x: 120%, y: 120%)[\)]^2 + 1 $<eqn:alpha>

Assuming the out-of-plane displacement $delta_v$ is small and that each vertical weaver deforms sinusoidally with $n_h$ half-waves, we determine the maximum curvature $kappa$ of the vertical weavers using the curvature formula @colley2018vector. At the location where the maximum curvature occurs, the curvature reduces to $ kappa = delta_v #scale(x: 180%, y: 180%)[\(] frac(n_h pi, L - Delta) #scale(x: 180%, y: 180%)[\)]^2 . $<eqn:curvature> Because $kappa prop delta_v$ in Eq. (@eqn:curvature), the derivative in Eq. (@eqn:k_v1) simplifies without further calculation of $delta_v$. Therefore, we combine Eqs. (@eqn:k_v1), (@eqn:alpha), and (@eqn:curvature) into $ k_v = #scale(x: 180%, y: 180%)[\(] frac(w_v^4, 60 t_v^2) #scale(x: 120%, y: 120%)[\(] delta_v \( frac(n_h pi, L - Delta) \)^2 - nu / R #scale(x: 120%, y: 120%)[\)]^2 + 1 #scale(x: 180%, y: 180%)[\)] dot.op 2 n_v / n_h E I frac(\( n_h pi \)^2, \( L - Delta \)^3) . $<eqn:k_v>

Horizontal weavers act in series and deform axially in response to loading. The contact area $A$ is the area between vertical weavers where adjacent horizontal weavers make contact, as shown in @fig:2\(b). Thus, the contribution of the horizontal weavers to stiffness is $ k_h = frac(E n_v t_h^2, n_h w_h) . $<eqn:k_h>

We sum Eqs. (@eqn:k_v) and (@eqn:k_h) to obtain the overall stiffness of a woven column.

#figure(block(width: 12cm)[
    #place(top + left, dx: 12cm * 514 / 800, dy: 12cm * 195 / 800, radial-inset(12cm * 286 / 800))
    #image("weaver-model-base.png", width: 100%)
  ],

  caption: [#strong[Derivation of the stiffness and the buckling load of a woven column.] #strong[a.] Schematic of the vertical weavers. Each segment of a vertical weaver is modeled as an independent column undergoing buckling. To derive stiffness, the inner force and bending moment are analyzed at locations of maximum curvature. #strong[b.] Schematic of the horizontal weavers. Horizontal weavers are modeled as axisymmetric sinusoidally perturbed cylindrical shells stacked on top of one another. The horizontal cross-section is approximated as a polygon with $n_v$ sides. Given a cross-section, the perturbation $delta_h$ is derived by averaging $R_(m a x)$ and $R_(m i n)$. The contact area $A$ for deriving the horizontal stiffness is taken as the total contact area between adjacent horizontal weavers.]

)

<fig:2>

= Fabrication and experimental methods

<fabrication-and-experimental-methods>

We conducted a parametric study and validated our models through physical experimentation on woven cylindrical column samples. We constructed samples varying: (1) vertical weaver thickness $t_v$, (2) horizontal weaver thickness $t_h$, (3) vertical weaver width $w_v$, (4) horizontal weaver width $w_h$, and (5) sample height $h$. We construct a base woven column with $t_v = t_h = 0.191$ mm, $w_v = w_h = 20$ mm, and $h = 140$ mm. We then conduct five experiments, each keeping one parameter constant and varying the other four.

Our samples are woven by hand from vertical and horizontal strips of Mylar#super[®] polyester connected by a vertical seam of split pins (@fig:3\(a)). For studies with consistent vertical weaver thickness, we cut the vertical weavers from a continuous Mylar#super[®] sheet and leave a 10 mm connection at the top and bottom (@fig:3\(a)). This connection at the two ends assists fabrication and facilitates consistency in spacing, but may cause varying end effects when the vertical weaver thickness varies. In our parametric study where the thickness of vertical weavers varies, we instead connect vertical weavers using two additional rows of split pins (@fig:3\(b)). We maintain consistent tightness of the weaving across all samples by scaling the spacing between weavers proportionally to the thickness of weavers@banerjee2014weaving@lord1982weaving.

We obtained the experimental buckling force, stiffness, and qualitative buckling mode for each woven sample using plate-to-plate compression loading between two acrylic plates (@fig:3\(b), c, and d). The samples were compressed at a rate of 15 mm/min using a Mark-10#super[®] ESM 1500 single-column tabletop testing system with a 250 N load cell. Force and displacement are recorded at a sampling rate of 20 Hz until a global maximum force is reached. Buckling force is taken as the peak load experienced and stiffness is taken by numerically differentiating the data to find the maximum instantaneous slope before the buckling force is reached (@fig:3\(e)). To account for precision error in sample fabrication, we tested three identical samples of each variation and calculated the average values and error ranges.

#figure(image("source/figure3.png", width: 15cm),

  caption: [#strong[Fabrication of woven columns and the test setup]. #strong[a.] Assembly of a column where vertical weavers are connected at the top and bottom. This design maintains consistent spacing in samples, but can only be used for testing in which the thickness of vertical weavers remains constant. Scale bars are 4 cm. #strong[b.] Assembly of a column where vertical weavers are mechanically joined using split pins at the top and bottom of horizontal weavers. This design maintains consistent end effects, and is only used in a few of our tests where vertical thickness varies. Scale bars are 4 cm. #strong[c.] Test setup using Mark-10#super[®] ESM 1500 single-column tabletop testing system. #strong[d.] Schematic for plate-to-plate compression loading of woven columns. Vertical and horizontal weavers are both assumed to be deformed with sinusoidal deflections. #strong[e.] A typical force--displacement curve obtained from an experiment with the buckling force and stiffness measured.]

)

<fig:3>

= Results

<results>

Parametric studies were performed by varying horizontal weaver width $w_h$, vertical weaver width $w_v$, horizontal weaver material thickness $t_h$, vertical weaver material thickness $t_v$, and sample height $h$. We observed and classified the different buckling modes of woven columns, and we validated our mechanics models for the buckling force and stiffness of woven columns against the experimental data.

== Buckling mode classification

<buckling-mode-classification>

In our parametric study, we vary the widths of vertical and horizontal weavers. We observed a strong correlation of buckling behavior with the weaver widths (@fig:4\(a)). We define the buckling behavior of a column as local if it experiences any local maxima in its force-displacement curve before 95% of the buckling force is reached. We define these local maxima as force values in which all forces within a $plus.minus$0.4 mm displacement range are less than 93% of the local maximum value (@fig:4\(c)). We define the buckling behavior of the column as global if it does not exhibit these local maxima before peak buckling is reached (@fig:4\(b)). By using this criterion to distinguish local and global buckling modes, we can determine an approximate first-order boundary between local and global buckling regions by: $w_h = 2.6 w_v - 40$. That is, if $2.6 w_v - w_h > 40$ then the column is more likely to buckle locally. Otherwise, it is more likely to buckle globally.

For the columns that experience the global buckling mode, under large deformations the horizontal and vertical weavers tend to deform together, typically into a diamond pattern. Even for this global buckling scenario, we believe that local buckling of vertical and horizontal weavers remains the precipitating factor, consistent with our assumptions in Section @Sec:Modeling. Meanwhile, for local buckling modes, initial buckling can occur in multiple locations before the system reaches a peak load. We observe more global buckling in columns with wider horizontal weavers and narrower vertical weavers because these patterns allow the cylinder to buckle between horizontal boundaries. Meanwhile, when vertical weavers are wider and horizontal weavers are narrower, the additional curvature of the vertical weavers counteracts buckling across horizontal boundaries, which results in more complicated local behaviors.

We observe that for columns experiencing global buckling, the force-displacement behavior before peak load is more predictable than for locally buckling columns. Therefore, applications requiring repeatable or predictable deformation such as in buckling-enabled soft robotics or mechanical computing may benefit from woven structures that undergo a global buckling mode. Our results suggest that the desired buckling modes for 3D woven structure can be specifically designed by adjusting the widths of the vertical and horizontal weavers.



== Scaling relationships of buckling load

<scaling-relationships-of-buckling-load>

The buckling force of a woven column increases with both the thicknesses of its vertical and horizontal weavers, as validated in @fig:5\(a) and b. Buckling force increases proportionally to the thickness of vertical weavers cubed ($P_(upright(c r)) prop t_v^3$), resulting from the relationship of vertical weaver buckling force to the second moment of inertia (@fig:5\(a)). Buckling force increases with the thickness of horizontal weavers as a result of the horizontal weaver buckling force component (@fig:5\(b)).

Shown in @fig:5\(d) and e, our buckling force model is validated against variation in the widths of vertical and horizontal weavers. Increases in the width of vertical weavers $w_v$ cause greater initial sinusoidal imperfections in horizontal weavers, making the horizontal weavers and the entire column more prone to buckling (@fig:5\(d)). When the width of horizontal weavers $w_h$ is varied, our idealized model predicts that for small widths of horizontal weavers, the vertical weavers will experience higher-order sinusoidal wave patterns and higher buckling forces (@fig:5\(e)). In reality, inconsistencies in weaving allow for weak spots where the vertical weavers form uneven waves and the resulting buckling force is lower than predicted. These defects become more likely when horizontal weavers are less wide and vertical weavers have more segmental waves, so a realistically fabricated column will not experience substantial increases in buckling forces as the horizontal weaver widths become small (@fig:5\(e)). This effect on buckling force is most apparent in our data when horizontal and vertical widths are both less than 15 mm. In contrast, when the width of horizontal weavers $w_h$ increases, the vertical weavers have few segmental waves and the buckling force approaches a constant, which is accurately captured by our theoretical model (@fig:5\(e)).

When considering the column height, there is a negligible effect on the buckling force compared to other parameters (@fig:5\(c)). Our model, similar to classical models for cylindrical shell buckling @hutchinson2018knockdowns, does not account for the height of the column, so it matches this trend well. This result further supports our initial assumption, where local buckling of the vertical and horizontal weavers, rather than global system buckling, drive the behavior of the system.



#figure(image("source/figure4.png", width: 15cm),

  caption: [#strong[Comparison of buckling modes]. #strong[a.] Depending on the widths of horizontal and vertical weavers in a woven column, the buckling mode of the column switches between global, local, and combination modes. #strong[b.] Typical force--displacement curve for a column that experiences global buckling into a diamond pattern, with no pre-buckling behavior observed. #strong[c.] Typical force--displacement curve for a column that experiences local buckling, where pre-buckling is observed, and local force maxima occur before a peak force is obtained.]

)

<fig:4>

== Scaling relationships of stiffness

<scaling-relationships-of-stiffness>

The stiffness of the woven column increases with respect to both its vertical and horizontal weaver thicknesses, as validated in @fig:6\(a) and b. By increasing vertical weaver thickness $t_v$, we increase the bending modulus of the vertical weavers by a factor of thickness cubed $t_v^3$, resulting in a stiffer structure (@fig:6\(a)). By increasing the horizontal weaver thickness $t_h$, we increase the horizontal weaver stiffness proportionally to their thickness squared ($k prop t_h^2$). This increase is because the contact area between adjacent horizontal weavers increases with the thickness squared (@fig:6\(b)).

Shown in @fig:6\(d) and e, our stiffness model is validated against variation in vertical and horizontal weaver width. As the vertical weaver width $w_v$ increases, the vertical weavers exhibit more curvature about the less favored vertical axis of bending, resulting in additional curvature-induced stiffness from the vertical weavers (@fig:6\(d)). As $w_v$ decreases, the contact area between horizontal weavers increases, resulting in increased stiffness due to the horizontal weaver component of stiffness. As the horizontal weaver width $w_h$ decreases, the vertical weavers have smaller periods with greater curvature relative to displacement, and thus higher stiffness (@fig:6\(e)). In both cases, increasing the overall stiffness of the column can be achieved by having the vertical weavers contribute a larger portion of stiffness than the horizontal weavers.

When considering the height of the columns in @fig:6\(c), the stiffness increases for shorter columns because of the contribution of the horizontal weavers. The stiffness increases exponentially for shorter columns because when keeping $w_h$ constant, we have $h prop n_h$ hence the relationship follows from $k_h prop 1 / n_h$.

#figure(image("figure6-visible.svg", width: 15cm),

  caption: [#strong[Influence of design parameters on the stiffness of woven columns]. Stiffness with respect to: #strong[a.] Vertical weaver thickness, #strong[b.] Horizontal weaver thickness, #strong[c.] Column height, #strong[d.] Vertical weaver width, #strong[e.] Horizontal weaver width. #strong[f.] Schematic of all design parameters.]

)

<fig:6>

#figure(image("figure5-visible.svg", width: 15cm),

  caption: [#strong[Influence of design parameters on buckling forces of woven columns]. Buckling force with respect to: #strong[a.] Vertical weaver thickness, #strong[b.] Horizontal weaver thickness, #strong[c.] Column height, #strong[d.] Vertical weaver width, #strong[e.] Horizontal weaver width. #strong[f.] Schematic of all design parameters.]

)

<fig:5>

= Conclusions

<conclusions>

We created analytical models that predict the buckling force and stiffness of cylindrical woven columns made from a dense planar weave. The models are based on the geometry of the columns and basic mechanics principles, which makes the models versatile and simple to use. The models have been validated with experimental data considering different parameters, including weaver widths, weaver thicknesses, and column height. Our models explain the underlying mechanics behind buckling force and stiffness trends in woven structures and serve as a closed-form tool for design. We determined that while both vertical and horizontal weavers contribute to the overall column buckling force and stiffness, in some cases one or the other will have a larger influence on tuning a specific property. When thickness of either horizontal or vertical weavers is increased, both the buckling capacity and the stiffness increase. When we increase the width of horizontal weavers, the buckling capacity remains constant and the stiffness decreases. When we increase the width of vertical weavers, the buckling capacity decreases while the stiffness increases. Our results can inform design for efficient material use by identifying which weaver parameters can be changed to achieve a desired structural property.

We established predictive guidelines for the buckling mode of a column. We categorized a column's buckling mode as local if the column experiences local maxima in its force-displacement curve before buckling. A column's buckling mode is categorized as global if the column does not experience local maxima before buckling. These modes are largely dependent on horizontal and vertical weaver widths, and the transition between modes can be described by a linear relationship between horizontal and vertical weaver widths. Columns with larger vertical weaver widths and smaller horizontal weaver widths typically experience local buckling. Columns with smaller vertical weaver widths and larger horizontal weaver widths typically experience global buckling where the structure deforms into a diamond pattern. Our findings serve to guide the design of woven structures such that favorable behaviors and buckling modes can be achieved, and buckling load and stiffness can be analytically calculated. These hierarchical woven structures have potential for future engineering applications in soft intelligent robots, flexible metamaterials, customizable wearable devices, and more.

#heading(level: 1, numbering: none)[Acknowledgements]

<acknowledgements>

The authors acknowledge support from the Air Force Office of Scientific Research under award number FA9550-22-1-0321. The paper reflects the views and opinions of the authors, and not necessarily those of the funding entities.

#pagebreak()
#bibliography("source/article.bib", style: "nature")


