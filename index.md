@def title = "Franklin Sandbox"
@def hasmath = true
@def hascode = true

@@emergency-box
**Covid-19 RELATED EFFORTS:** The Julia Lab at MIT's Computer Science and AI Laboratory ([CSAIL](https://www.csail.mit.edu/)) and the Julia Community at large are hard at work building the best tools for scientists worldwide from the low level compilers to parallel, GPU computation of the alphabet soup of models.

* Drug Development Life Cycle
    * [Julia Lab speeds up the drug approval process](http://news.mit.edu/2019/julia-lab-joins-team-speed-drug-approval-process-0125)
    * [PUMAS: Pharmaceutical Modelling and Simulation](https://tutorials.pumas.ai/)r
* Epidemiological Models
    * [Pathogen.jl: Simulation, visualization, and inference tools for modelling the spread of infectious diseases](https://github.com/jangevaare/Pathogen.jl)
    * [Infectious Disease Transmission Network Modelling with Julia](https://arxiv.org/abs/2002.05850)
    * [COVID-19 in Denmark: A model](https://doktormike.gitlab.io/post/covid-19/)
    * [Gillespie.jl](https://github.com/sdwfrost/Gillespie.jl). For a reference on Gillespie methods check out this excellent review by Des Higham.
    * [SEIR model](https://github.com/ChrisRackauckas/universal_differential_equations/tree/master/SEIR_exposure) by Dr. Chris Rackauckas from the lab
* Scientific Machine Learning
    * See some results on COVID-19 data in [this presentation](https://drive.google.com/file/d/1NxFOtpNHl7oXpdSLM06TEN_oO8QylPYx/view) on Physics-informed machine learning with language-wide automatic differentiation.
    * [SciML: An Open Source Software Organization for Scientific Machine Learning](https://sciml.ai/2020/03/29/SciML.html)
* Timely MIT Class (Spring 2020) (6s083/18s190) Computational Thinking with Applications to Covid-19
    * [Class Front Page](https://github.com/mitmath/6S083)
    * [Class Syllabus and Materials](https://github.com/mitmath/6S083/blob/master/syllabus.md)
    * With thanks to MIT's [Schwarzman College of Computing](https://computing.mit.edu/), [Dept of EECS](https://www.eecs.mit.edu/), and [Dept of Mathematics](https://math.mit.edu/).
@@

[Julia](http://julialang.org/) is a programming language created by [Jeff Bezanson](https://github.com/JeffBezanson), [Alan Edelman](http://www-math.mit.edu/%7Eedelman), [Stefan Karpinski](http://karpinski.org/), and [Viral B. Shah](https://github.com/viralbshah) in 2009, released publicly in 2012, Julia now  has over ten million downloads.

News flash: Wilkinson Prize for Julia! ([MIT News December 26, 2018 ](http://news.mit.edu/2018/julia-language-co-creators-win-james-wilkinson-prize-numerical-software-1226))

News flash from Google's Jeff Dean: Julia + TPUs = fast and easily
expressible Machine Learning Computations. ([tweet October 23, 2018](https://twitter.com/JeffDean/status/1054951415339192321))

The Julia lab embraces openness and the solving of human problems.
Today, the Julia Lab collaborates with a variety of researchers on real-world problems and applications, while simultaneously working on the core language and its ecosystem.

# Publications

@@csl-bib-body

  @@csl-entry Bezanson, Jeff, Jake Bolewski, and Jiahao Chen. 2018. “Fast Flexible Function Dispatch in Julia.” _ArXiv:1808.03370 [Cs]_, August. [http://arxiv.org/pdf/1808.03370.pdf](http://arxiv.org/pdf/1808.03370.pdf).
  @@
  @@csl-entry Bezanson, Jeff, Jiahao Chen, Stefan Karpinski, Viral Shah, and Alan Edelman. 2014. “Array Operators Using Multiple Dispatch: A Design Methodology for Array Implementations in Dynamic Languages.” In _Proceedings of ACM SIGPLAN International Workshop on Libraries, Languages, and Compilers for Array Programming_, 56:56–56:61. ARRAY’14. New York, NY, USA: ACM. [https://doi.org/10.1145/2627373.2627383](https://doi.org/10.1145/2627373.2627383).
  @@
  @@csl-entry Bezanson, Jeff, Alan Edelman, Stefan Karpinski, and Viral Shah. 2017. “Julia: A Fresh Approach to Numerical Computing.” _SIAM Review_ 59 (1): 65–98. [https://doi.org/10.1137/141000671](https://doi.org/10.1137/141000671).
  @@
  @@csl-entry Bezanson, Jeff, Stefan Karpinski, Viral B. Shah, and Alan Edelman. 2012. “Julia: A Fast Dynamic Language for Technical Computing.” _ArXiv:1209.5145 [Cs]_, September. [http://arxiv.org/pdf/1209.5145.pdf](http://arxiv.org/pdf/1209.5145.pdf).
  @@
  @@csl-entry Bezanson, Jeffrey Werner. 2015. “Abstraction in Technical Computing.” Thesis, Massachusetts Institute of Technology. [http://dspace.mit.edu/handle/1721.1/99811](http://dspace.mit.edu/handle/1721.1/99811).
  @@
  @@csl-entry Chen, Jiahao. 2018. “Linguistic Relativity and Programming Languages.” _ArXiv:1808.03916 [Cs, Stat]_, August. [http://arxiv.org/pdf/1808.03916.pdf](http://arxiv.org/pdf/1808.03916.pdf).
  @@
  @@csl-entry Chen, Jiahao, and Alan Edelman. 2014. “Parallel Prefix Polymorphism Permits Parallelization, Presentation &amp; Proof.” In _Proceedings of the 1st First Workshop for High Performance Technical Computing in Dynamic Languages_, 47–56. HPTCDL ’14. Piscataway, NJ, USA: IEEE Press. [https://doi.org/10.1109/HPTCDL.2014.9](https://doi.org/10.1109/HPTCDL.2014.9) [http://jiahao.github.io/parallel-prefix/](http://jiahao.github.io/parallel-prefix/).
  @@
  @@csl-entry Chen, Jiahao, Andreas Noack, and Alan Edelman. 2018. “Fast Computation of the Principal Components of Genotype Matrices in Julia.” _ArXiv:1808.03374 [Cs, Math, q-Bio, Stat]_, August. [http://arxiv.org/pdf/1808.03374.pdf](http://arxiv.org/pdf/1808.03374.pdf).
  @@
  @@csl-entry Chen, Jiahao, Jarrett Revels, and Alan Edelman. 2016. “Robust Benchmarking in Noisy Environments.” _Proceedings of the 20th Annual IEEE High Performance Extreme Computing Conference_, August. [http://arxiv.org/pdf/1608.04295.pdf](http://arxiv.org/pdf/1608.04295.pdf).
  @@
  @@csl-entry Chen, Jiahao, and Weijian Zhang. 2016. “The Right Way to Search Evolving Graphs.” _Proceedings of GABB’2016 - Graph Algorithms Building Blocks Workshop_, January. [http://arxiv.org/pdf/1601.08189.pdf](http://arxiv.org/pdf/1601.08189.pdf).
  @@
  @@csl-entry Innes, Mike, Stefan Karpinski, Viral Shah, David Barber, Pontus Stenetorp, Tim Besard, James Bradbury, et al. 2018. “On Machine Learning and Programming Languages.” _SysML_. [https://www.sysml.cc/doc/37.pdf](https://www.sysml.cc/doc/37.pdf).
  @@
  @@csl-entry Leonard, Paul B., Edward B. Duffy, Robert F. Baldwin, Brad H. McRae, Viral B. Shah, and Tanmay K. Mohapatra. 2017. “GFlow: Software for Modelling Circuit Theory-Based Connectivity at Any Scale.” _Methods in Ecology and Evolution_ 8 (4): 519–26. [https://doi.org/10.1111/2041-210X.12689](https://doi.org/10.1111/2041-210X.12689).
  @@
  @@csl-entry Palamadai Natarajan, Ekanathan. 2017. “Portable and Productive High-Performance Computing.” Thesis, Massachusetts Institute of Technology. [http://dspace.mit.edu/handle/1721.1/108988](http://dspace.mit.edu/handle/1721.1/108988).
  @@
  @@csl-entry Regier, Jeffrey, Kiran Pamnany, Keno Fischer, Andreas Noack, Maximilian Lam, Jarrett Revels, Steve Howard, et al. 2018. “Cataloging the Visible Universe Through Bayesian Inference at Petascale.” In _2018 IEEE International Parallel and Distributed Processing Symposium (IPDPS)_, 44–53. [https://doi.org/10.1109/IPDPS.2018.00015](https://doi.org/10.1109/IPDPS.2018.00015).
  @@
  @@csl-entry Revels, Jarrett, Miles Lubin, and Theodore Papamarkou. 2016. “Forward-Mode Automatic Differentiation in Julia.” _AD2016 - 7th International Conference on Algorithmic Differentiation_, July. [http://arxiv.org/pdf/1607.07892.pdf](http://arxiv.org/pdf/1607.07892.pdf).
  @@
  @@csl-entry Shah, Viral, Alan Edelman, Stefan Karpinski, Jeff Bezanson, and Jeremy Kepner. 2013. “Novel Algebras for Advanced Analytics in Julia.” In _2013 IEEE High Performance Extreme Computing Conference (HPEC)_, 1–4. [https://doi.org/10.1109/HPEC.2013.6670347](https://doi.org/10.1109/HPEC.2013.6670347).
  @@

<!-- end of csl-bib-body -->
@@

# Conferences

* Jarrett Revels, "Automatic Differentiation in the Julia Language." **SIAM Manchester Julia Workshop 2016**.
* Jarrett Revels, "Automatic Differentiation in the Julia Language." **AD2016 - 7th International Conference on Algorithmic Differentiation**.
* Jarrett Revels, "ForwardDiff.jl: Fast Derivatives Made Easy." **JuliaCon 2016**.


# Past Research


The Julia Lab specializes in collaborating with other groups to solve messy real-world computational problems.

#### Statistical genomics

Existing bioinformatics tools aren't performant enough to handle the exabytes of data produced by modern genomics research each year, and general purpose linear algebra libraries are not optimized to take advantage of this data's inherent structure.
To address this problem, the Julia Lab is developing specialized algorithms for principal component analysis and statistical fitting that will enable genomics researchers to analyze data at the same rapid pace that it is produced.

This project is an exciting interdisciplinary collaboration with [Dr. Stavros Papadopoulos](http://people.csail.mit.edu/stavrosp/) (Senior Research Scientist at [Intel Labs](http://pcl.intel-research.net/)) and [Prof. Nikolaos Patsopoulos](http://connects.catalyst.harvard.edu/Profiles/display/Person/45505) (Assistant Professor at [Brigham and Women's Hospital](http://www.brighamandwomens.org/), [the Broad Institute](https://www.broadinstitute.org/) and [Harvard Medical School](http://hms.harvard.edu/)).

#### Financial Fraud Detection

\imstyle{/assets/flash-crash.png}{width:60%;margin:auto;display:block;}

A single stock exchange generates high-frequency trading (HFT) data at a rate of ~2.2 terabytes per month.
Automatic identification of suspicious financial transactions in these high-throughput HFT data streams is an active area of research.
The Julia Lab contributes to the battle against financial fraud by designing out-of-core analytics for anomaly detection.

#### Medical Data Analytics

\imstyle{/assets/heartbeat.png}{width:60%;margin:auto;display:block;}

Hospitals, like many large organizations, collect much more data than can be usefully processed and analyzed by human experts using today's available software.
Oftentimes, these small-scale analyses can overlook statistical clues that might have rendered substantial improvements to patient care.

In collaboration with [Harvard Medical School](http://hms.harvard.edu/), the Julia Lab has worked on tools for rapidly identifying potential indicators of irregularities in medical data, equipping doctors and healthcare providers with the analytics they need to make informed medical decisions.

#### Numerical Linear Algebra and Parallel Computing

\imstyle{/assets/parallel-prefix.png}{width:60%;margin:auto;display:block;}

The Julia Lab leads the [JuliaParallel](https://github.com/JuliaParallel)    organization, which maintains the following projects:

* [DistributedArrays.jl](https://github.com/JuliaParallel/DistributedArrays.jl): a native Julia distributed array implementation
* [MPI.jl](https://github.com/JuliaParallel/MPI.jl): a wrapper for [Message Passing Interface (MPI)](https://en.wikipedia.org/wiki/Message_Passing_Interface)
* [ClusterManagers.jl](https://github.com/JuliaParallel/ClusterManagers.jl): Julia support for different job queue systems commonly used on compute clusters
* [Dagger.jl](https://github.com/JuliaParallel/Dagger.jl): a [Dask](https://github.com/dask/dask)-like framework for out-of-core and parallel computation
* [Elemental.jl](https://github.com/JuliaParallel/Elemental.jl): a wrapper for [Elemental](http://libelemental.org/), a distributed linear algebra/optimization library developed by Prof. [Jack Poulson](http://web.stanford.edu/~poulson/)
* [ScaLAPACK.jl](https://github.com/JuliaParallel/ScaLAPACK.jl): a wrapper for the [Scalable Linear Algebra Package](http://www.netlib.org/scalapack/)
* [HDFS.jl](https://github.com/JuliaParallel/HDFS.jl): a wrapper for the [Hadoop Distributed FileSystem](https://hadoop.apache.org/docs/current/hadoop-project-dist/hadoop-hdfs/HdfsUserGuide.html)
* [Elly.jl](https://github.com/JuliaParallel/Elly.jl): a client for [Apache YARN](https://hadoop.apache.org/docs/current/hadoop-yarn/hadoop-yarn-site/YARN.html)


The Julia Lab also collaborates with [Prof. Steven G. Johnson](http://math.mit.edu/%7Estevenj/) and [Jared Crean](https://github.com/JaredCrean2) in the development of [PETSc.jl](https://github.com/JaredCrean2/PETSc.jl), a wrapper for the [Portable, Extensible Toolkit for Scientific Computation](http://www.mcs.anl.gov/petsc).


# People

#### Current Members

* [Prof. Alan Edelman](http://www-math.mit.edu/%7Eedelman) (Principal Investigator)
* [Dr. Jeremy Kepner - Founding Sponsor ](http://www.mit.edu/%7Ekepner/) (MIT Lincoln Laboratory)
* [Dr. Chris Rackauckas](http://chrisrackauckas.com/) (Applied Math Instructor)
* [Prof. David P. Sanders](http://sistemas.fciencias.unam.mx/%7Edsanders/) (Visiting Professor)
* [Peter Ahrens](https://github.com/peterahrens) (PhD Student)
* [Sung Woo Jeong](https://math.mit.edu/directory/profile.php?pid=1782) (PhD Student)
* [Albert Gnadt](https://www.linkedin.com/in/albert-gnadt-8a195138/) (PhD Student)
* [Valentin Churavy](https://github.com/vchuravy) (PhD Student)
* [Ranjan Anantharaman](https://github.com/ranjanan) (PhD Student)
* [Shashi Gowda](http://shashi.biz) (PhD Student)
* Cooper Sloan (M.Eng.)
* Jerry Lingjie Mei (Undergraduate)
* Adelaide (Addy) Chambers (Undergraduate)
* Luana Lara (Undergraduate)
* Lin Pease (Undergraduate)
* Kelly Shen (Undergraduate)
* Mark Wang (Undergraduate)
* Collin Warner (Undergraduate)

#### Alumni

* [Prof. Ivan Slapničar](http://marjan.fesb.hr/%7Eslap/index1.html) (Visiting Professor, Fall 2014)
* [Dr. Jeff Bezanson](https://github.com/JeffBezanson) (PhD Student, Fall 2009-Spring2015)
* [Dr. Matt Bauman](https://github.com/mbauman) (Visiting PhD Student, Fall 2015)
* [Stefan Karpinski](http://karpinski.org) (Data Scientist, Summer 2013-Fall 2014)
* [Jameson Nash](https://github.com/vtjnash) (Undergraduate Student, Summer 2013)
* [Weijian Zhang](https://github.com/weijianzhang) (Visiting Student, Spring 2016)
* [Jake Bolewski](https://github.com/jakebolewski) (Research Engineer, Summer 2014-Spring 2016)
* [Oscar Blumberg](https://github.com/carnaval) (Visiting Masters Student, Spring-Summer 2015)
* [Keno Fischer](https://github.com/keno) (Undergraduate Student, Summer 2013 and Summer 2014)
* [Runpeng Liu](http://runpeng.mit.edu) (Undergraduate Student, Fall 2015)
* [Dr. Xianyi Zhang](https://github.com/xianyi) (Postdoctoral Associate, 2016)
* [Dr. Eka Palamadai](http://people.csail.mit.edu/epn/epn.html) (PhD Student, Fall 2011-Spring 2016)
* [Valentin Churavy](https://github.com/vchuravy) (Visiting PhD Student, Summer-Fall 2016)
* [Tim Besard](https://github.com/maleadt) (Visiting PhD Student, Summer-Fall 2016)
* [David A. Gold](https://github.com/davidagold) (Visiting PhD Student, Summer 2016)
* Jacob Higgins (Undergraduate, Summer 2016)
* [Dr. Andreas Noack](https://github.com/andreasnoack) (Postdoctoral Associate)
* [Dr. Jiahao Chen](https://jiahao.github.io/) (Research Scientist, Fall 2013-Spring 2017)
* [Jarrett Revels](https://github.com/jrevels) (Research Engineer)
* [Dr. Deniz Yuret](http://www.denizyuret.com) (Visiting Professor)


#### Collaborators

The Julia group is grateful for numerous collaborations at MIT and around the world:

* [Prof. Steven G. Johnson](http://math.mit.edu/%7Estevenj/) (MIT Mathematics)
* [Prof. Juan Pablo Vielma](http://www.mit.edu/%7Ejvielma/) (MIT Sloan)
* [Dr. Vijay Ivaturi](https://github.com/vjd)(University of Maryland, Baltimore)
* [Dr. Homer Reid](http://homerreid.dyndns.org) (MIT Mathematics)
* [Dr. Alex Townsend](http://math.mit.edu/%7Eajt/) (Cornell  )
* [Dr. Jean Yang](http://jeanyang.com) (MIT CSAIL alum, Harvard Medical School)
* [The JuliaOpt team](http://www.juliaopt.org) team at the [Operations Research Center](http://web.mit.edu/orc/www/)
* [Joey Huchette](http://www.mit.edu/%7Ehuchette)
* [Yee Sian Ng](http://orc.scripts.mit.edu/people/student.php?name=yeesian)
* [Miles Lubin](http://www.mit.edu/%7Emlubin/)
* [Simon Kornblith](http://simonster.com) (MIT Brain and Cognitive Sciences)
* [Jon Malmaud](http://malmaud.com) (MIT Brain and Cognitive Sciences)
* [Spencer Russell](http://ssfrr.com/) (MIT Media Lab)
* [Chiyuan Zhang](http://pluskid.org) (MIT CSAIL), author of the popular [Mocha.jl](https://github.com/pluskid/Mocha.jl) framework for deep learning
* [Zenna Tavares](http://zenna.org) (MIT CSAIL) author of the [Sigma.jl](https://github.com/zenna/Sigma.jl) probabilistic programming environment
* [Jared Crean](https://github.com/JaredCrean2) ([Rensselaer Polytechnic Institute](http://rpi.edu/))

# Sponsorship


We thank NSF, Amazon,  [DARPA XDATA](http://www.darpa.mil/program/xdata), the [Intel Science and Technology Center for Big Data](http://istc-bigdata.org), [Saudi Aramco](http://www.saudiaramco.com/en/home.html), the MIT [Institute for Soldier Nanosystems](http://isnweb.mit.edu), and [NIH BD2K](https://datascience.nih.gov/bd2k) for their generous financial support.

The Julia Lab is a member of the [bigdata@CSAIL MIT Big Data Initiative](http://bigdata.csail.mit.edu) and gratefully acknowledges sponsorship from the [MIT EECS SuperUROP Program](https://superurop.eecs.mit.edu) and the [MIT UROP Office](http://web.mit.edu/urop) for our talented undergraduate researchers.

~~~
<div style="text-align:center;">
~~~
\imstyle{/assets/mit-logo.svg}{width:20%;margin-right:40px;vertical-align:middle;}
\imstyle{/assets/csail-logo.png}{width:25%;margin-right:40px;vertical-align:middle;}
\imstyle{/assets/mit-math-logo.png}{width:30%;vertical-align:middle;}
~~~
</div>
~~~
