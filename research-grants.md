# Research/Grants

## CESMIX PSAAP

~~~
<img style="padding-right:10px" align="left" width="150" src="/assets/images/cesmix.jpg"\>
~~~

The Center for Exascale Simulation of Materials in Extreme Environments (CESMIX) seeks to advance the state-of-the-art in predictive simulation by connecting quantum and molecular simulations of materials with state-of-the-art programming languages, compiler technologies, and software performance engineering tools, underpinned by rigorous approaches to statistical inference and uncertainty quantification.
Our motivating problem is to predict the degradation of complex (disordered and multi-component) materials under extreme loading, inaccessible to direct experimental observation. This application represents a technology domain of intense current interest, and exemplifies an important class of scientific problems — involving material interfaces in extreme environments.

* https://computing.mit.edu/cesmix/

## **Robust Neural Differential Models for Navigation and Beyond (AIA)**

<center> <em> <b>Julia Lab brings SciML expertise to initiative for the development of a robust alternative to GPS-based navigation of aircrafts </b> </em></center>

```
<img style="padding-right:10px" align="left" width="150" src="/assets/images/aia.png"\>
```

There are several different GPS-alternatives being researched across the DoD and civilian sectors to address a GPS alternative; however, each alternative comes with additional costs and use cases. Magnetic Navigation presents an alternative GPS system that relies on magnetic resonance of the Earth – a system that is largely known and unchanging – to navigate. Some of the current problems with magnetic navigation involve 1) reducing excess noise on the system, such as magnetic outputs from the Aircraft itself, 2) determining position at a real-time pace or speeds consistent with military systems, and 3) combining with other systems to present a full-alternative GPS system. The present project looks into using robust neural differential models to solve magnetic navigation shortcomings and provide a viable alternative to GPS.

* [AIA website](https://aia.mit.edu/)
* [MIT AIA announcement](https://news.mit.edu/2019/mit-and-us-air-force-sign-agreement-new-ai-accelerator-0520)
* [Defense One article](https://www.defenseone.com/technology/2020/07/air-forces-latest-gps-alternative-earths-magnetic-fields/167387/)
* link to Chris' Air Force award announcement?

## **NeuralSPICE: Accelerated Simulation and Design of Electrical Circuits**

<center> <em> <b>Julia Computing joins initiative to bring new AI techniques to the microelectronic simulation space </b> </em></center>

Julia Computing has been awarded funding by the US Defense Advanced Research Projects Agency (DARPA) to accelerate simulation of Analog and Mixed-Signal circuit models using state of the art machine learning and artificial intelligence techniques such as continuous-time echo state networks. Funding was awarded as part of DARPA’s Intelligent Auto-Generation and Composition of Surrogate Models (Ditto) effort. 

Julia Computing is partnering with Boston-based quantum computing startup QuEra Computing to demonstrate these novel capabilities for simulations of the control electronics of QuEra’s neutral atom quantum computers. QuEra’s sophisticated designs stretch the boundaries of traditional simulation tooling, making significant acceleration in simulation performance all the more crucial. Julia Computing intends to make these capabilities available to the larger industry in the near future. 

* [Press release](https://juliacomputing.com/media/2021/03/darpa-ditto) 

## **Accelerating Coupled HVAC-Building Simulation with a Neural Component Architecture (ARPA-E HVAC)**

<center> <em> <b>Julia SciML ecosystem supports the design of more energy efficient buildings </b> </em></center>

Julia Computing, Inc. will develop a neural component machine learning tool to reduce the total energy consumption of heating, ventilation, and air conditioning (HVAC) systems in buildings. As of 2012, buildings consume 40 percent of the nation’s primary energy, with HVAC systems comprising a significant portion of this consumption. It has been demonstrated that the use of modeling and simulation tools in the design of a building can yield significant energy savings—up to 27 percent of total energy consumption. However, these simulation tools are still too slow to be practically useful. Julia Computing seeks to improve upon these tools using the latest computing and mathematical technologies in differentiable programming and composable software to enhance the ability of engineers to design more energy efficient buildings.

* [Project listing](https://arpa-e.energy.gov/technologies/projects/accelerating-coupled-hvacbuilding-simulation-neural-component-architecture)

## **High-fidelity Accelerated Design of High-performance Electrochemical Systems (ARPA-E CMU)**

<center> <em> <b>Julia’s SciML ecosystem applied to accelerate battery research </b> </em></center>

```
<img style="padding-right:10px" align="left" width="150" src="/assets/images/arpa_e_cmu.png"\>
```

This project involves software development efforts for accelerated solution of differential and algebraic equations describing the kinetics of the electrochemical systems, integration of these solvers with machine learning approaches, and global optimization over the chemical design space. The high-value candidates will be tested experimentally, validating the entire approach. We are generating cell-scale battery models from porous-electrode theory (such as the P2D/DFN model) from [PyBaMM](https://https//www.pybamm.org) in [ModelingToolkit.jl](https://github.com/SciML/ModelingToolkit.jl) to leverage the simulating power of the [SciML ecosystem](https://github.com/SciML) - either using Method of Lines (finite differences then ODE/DAE solvers) or by surrogatization with Physics-Informed Neural Networks. We will also develop hybrid models that directly incorporate experimental data into the models.

* [Project website](https://www.cmu.edu/aced/) 
* [Press release](https://www.cmu.edu/energy/news-multimedia/2019/arpa-e-award.html) 

## **Composable Next Generation Software Framework for Space Weather Data Assimilation and Uncertainty Quantification (SWQU)**

<center> <em> <b>Julia to be the backbone of a new software framework for space weather forcasting </b> </em></center>

```
<img style="padding-right:10px" align="left" width="150" src="/assets/images/swqu.png"\>
```

The forecasting and reanalysis of space weather events poses a major challenge for many activities in space and beyond. For example, solar storms can damage the power supply infrastructure and computer networks on earth but also impact crucially space exploration and satellite traffic management. As a consequence, improved space weather prediction capabilities can unlock to tremendous societal and economic opportunities such as improved internet coverage via satellite mega-constellations. 

This multi-disciplinary project brings together teams from various institutions and fields to extend the computational capabilities in the realm of space weather modeling. As part of a larger NSF and NASA initiative motivated by the White House  [National Space Weather Strategy and Action Plan](https://www.whitehouse.gov/wp-content/uploads/2019/03/National-Space-Weather-Strategy-and-Action-Plan-2019.pdf), the main objective of this project is to build a *Julia-based*, *composable*, *sustainable*, and *portable* open-source software framework for the model-based analysis of space weather. To that end, the project seeks to develop scalable algorithms for simulation of large-scale, high-fidelity models, reduced order modeling, data assimilation, and uncertainty propagation. These algorithms are then integrated and distributed to the wider space weather modeling community in form of a composable software framework build in Julia.  

* [MIT announcement](https://news.mit.edu/2020/mit-led-team-will-develop-software-forecast-space-storms-0910) 
* [Haystack announcement](https://www.haystack.mit.edu/news/haystack-joins-mit-led-team-to-forecast-space-weather/) 
* [UCSD announcement](https://ucsdnews.ucsd.edu/pressrelease/spacestormforecasting) 
* [UMICH announcement](https://news.umich.edu/more-than-5m-to-improve-solar-storm-forecasts/) 
* [NASA/NSF announcement](https://www.nsf.gov/news/special_reports/announcements/090120.01.jsp) 
* [Science News Article](https://www.sciencenews.org/article/sun-solar-storms-earth-havoc-space-weather-forecasts) 

## **Building an open platform for pandemic modeling**

<center> <em> <b>Julia as modeling platform to connect the infectious disease modeling community </b> </em></center>

Mathematical modeling of infectious disease transmission is an important tool in forecasting future trends of pandemics, such as COVID-19, and in evaluating ‘*what if*’ projections of different interventions. Yet, different models tend to give different results. To draw robust conclusions from modeling, it is important to consider multiple models, which can be facilitated by expanding the modeling community, as models tend to reflect the people that develop them, and by bringing models and model developers together to compare and contrast models. The aims of this project are: to expand and empower the next generation of models and modelers; to act as an incubator for a platform for comparisons of infectious disease models, both in terms of computers and people; and hence enable swift and more robust policy decisions for current and future pandemics.

* [Microsoft announcement](https://www.microsoft.com/en-us/research/collaboration/studies-in-pandemic-preparedness/) 

## **Optimization Under Uncertainty: A Generalized Koopman Expectation Framework**

<center> <em> <b>Efficient uncertainty quantification in hybrid systems via novel Koopman operator approach </b> </em></center>

```
<img style="padding-right:10px" align="left" width="150" src="/assets/images/koopman.png"\>
```

For dynamical systems involving decision making, the success of the system greatly depends on its ability to make good decisions with incomplete and uncertain information. By leveraging the Koopman operator and its adjoint property, we introduce the Koopman Expectation, an efficient method for computing expectations as propagated through a dynamical system. Unlike other Koopman operator-based approaches in the literature, this is possible without an explicit representation of the Koopman operator. This project explores the application of this new uncertainty quantification technique in the context of optimization under uncertainty. 

## **Digital Wells for Optimal Production and Drainage (NORWAY)**

```
<img style="padding-right:10px" align="left" width="150" src="/assets/images/norway.png"\>
```

Affordable and clean energy for everyone, and actions for an improved climate, are two of United Nations Sustainable Development Goals. Any realistic energy solution must combine the entire portfolio of possible energy sources with a gradual transition from the current fossil based economy to a fully sustainable energy economy. To improve the climate in this transition, energy efficiency in oil production must be maximized together with profit.

The project aims at developing new methods, algorithms, and tools for oil production with maximized profit and minimum energy consumption under uncertain information. Uncertainties relate to (i) unknown future prices/cost, (ii) uncertainties in operational allocation, and (iii) uncertain knowledge of reservoir and equipment.

* [USN announcement](https://www.usn.no/english/research/our-research/technology/telemark-modeling-and-control-center/digital-wells-for-optimal-production-and-drainage-digiwell)

## **Neural Component Architecture to Accelerate Modeling & Simulation**

* https://www.sbir.gov/sbirsearch/detail/1704651 (project listing, not a press release)
* https://www.nsf.gov/awardsearch/showAward?AWD_ID=1938400 (project listing, not a press release)

## **SWIFT: Adaptive RFI Cancellation for Radio Science Observatories**

* [NSF project listing (?)](https://www.nsf.gov/pubs/2021/nsf21539/nsf21539.htm) 

## **Neural Surrogates for Augmenting Models of Complex Dynamical Systems** (FORD)

<center> <em> <b>Julia Lab uses Neural PDEs for battery simulation </b> </em></center>

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

## **Convergence of Bayesian inverse methods and scientific machine learning in Earth system models through universal differentiable programming**

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

## **Scientific Machine Learning for Simulation and Control in Large Scale Power Systems** 

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

## KOLOKOTRONES

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

## SANDIA

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

## CLIMA

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

## Julia CI

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

## GPU4GEO

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

## Gridap

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

## NLopt

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

## Transcription Modeling

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

