# Postdoc Projects

## Postdoctoral Research Position: Scientific Machine Learning for Next-Generation QSP Models

**MIT Computer Science and Artificial Intelligence Laboratory (CSAIL)**  
**Principal Investigators: Professor Alan Edelman & Dr. Chris Rackauckas**

### Position Overview

We are seeking a highly motivated postdoctoral researcher to join a collaborative research project between MIT and GSK, focusing on the integration of Scientific Machine Learning (SciML) with Quantitative Systems Pharmacology (QSP) models. This exciting opportunity combines cutting-edge computational methods with pharmaceutical research to develop next-generation high-fidelity predictive models.

### Research Focus

The successful candidate will work on developing and training advanced emulator models using stiff ODE QSP systems, with applications to HIV, HBV, and/or other disease models. The research will also explore automated discovery of missing elements of models using universal differential equations. The project aims to assess whether combining QSP model emulation with available data can produce superior predictive accuracy compared to traditional approaches.

### Key Responsibilities

- Develop and train state-of-the-art emulator models using stiff ODE QSP describing disease models (HIV, HBV, and/or others)
- Build predictive ML models using preclinical and clinical training data
- Create SciML models combining QSP/QST frameworks with clinical datasets
- Integrate novel datasets (e.g., Omics data) with traditional QSP approaches
- Develop open source Julia software packages for the research community
- Collaborate closely with GSK researchers through regular meetings
- Publish research findings in high-impact journals and present at conferences

### Required Qualifications

- PhD in Computer Science, Applied Mathematics, Computational Biology, Bioengineering, or related field
- Strong programming experience in Julia (preferred) or willingness to learn
- Experience with differential equations, particularly stiff ODEs
- Background in machine learning and scientific computing
- Knowledge of pharmacometrics, systems biology, or related fields
- Strong publication record and communication skills

### Preferred Qualifications

- Experience with Scientific Machine Learning (SciML) frameworks
- Background in pharmacokinetic/pharmacodynamic modeling
- Familiarity with quantitative systems pharmacology
- Experience with neural ODEs or physics-informed neural networks
- Knowledge of pharmaceutical drug development processes

### Position Details

- **Duration:** 2 years with possibility of extension
- **Start Date:** As soon as possible
- **Location:** MIT CSAIL, Cambridge, MA
- **Funding:** Fully funded position with competitive salary and benefits
- **Travel:** Opportunities for conference travel and professional development

### About the Environment

This position offers a unique opportunity to work at the intersection of computational science and pharmaceutical research. You will be part of the vibrant Julia Lab at MIT while collaborating with industry partners at GSK. You will be integrated with the Kendall Square pharmaceutical community, which hosts many of the largest pharmaceutical firms in the world. The research will contribute to open source software development and aims to produce high-impact publications.

Regular interactions with GSK researchers will provide valuable industry perspective and potential career networking opportunities. The successful candidate will have access to cutting-edge computational resources and will be encouraged to participate in the broader SciML and Julia communities.

### Application Process

Please submit the following materials:

1. Cover letter describing research interests and relevant experience
2. Current CV including publication list
3. Contact information for three professional references
4. Brief research statement (1-2 pages) outlining your vision for this project

**Application Deadline:** Open until filled  
**Contact:** Dr. Chris Rackauckas (crackauc@mit.edu)

# Projects (PhD/MEng/UROP)

If you are interested in any of these projects and are a current MIT student looking for a UROP or MEng please reach out to the mentor listed next to project.

## Methods in Scientific Machine Learning

A large list of projects in scientific machine learning can be found [here](https://sciml.ai/dev/#projects_lists). Take that list as a set of ideas from which larger projects can be chosen.

#### AMDGPU.jl
Mentor: Julian Samaroo

- Implement support for various ROCm libraries: rocSOLVER, rocSPARSE, MIOpen, etc.
- Build ROCm libraries as JLLs
- Explore integration with ROCm debugging and profiling tooling

### Compiler based automatic-differentiation -- Enzyme.jl

[Enzyme.jl](https://github.com/EnzymeAD/Enzyme.jl) is the Julia frontend to the Enzyme automatic-differentiation engine.

- Improved JIT compilation for Enzyme
  - Compile on Demand / Parallel JIT
  - Caching of Enzyme AD results
  - Caching of inference results for reducing inital latency 

### General Julia compiler infrastructure

- Improvements to Julia integration with native debuggers and profilers
  - Better native debug-information (DWARF)
  - Pretty-printers for GDB
- Debug-information on demand
- Exploring profile-guided optimization

### Accelerate learning by automatically reducing the size of the training dataset.

Feasibility study on reducing the size of an a-HfO2 dataset using a parallel method based on HDBSCAN and ACE. A parallel Julia implementation of a state of the art method will be required as well as the proposal of an improved version aligned to [CESMIX](https://computing.mit.edu/cesmix/) objectives.
Description [here](https://docs.google.com/document/d/1SWAanEWQkpsbr2lqetMO3uvdX_QK-Z7dwrgPaM1Dl0o/edit?usp=sharing). 
Contact: Emmanuel Lujan (eljn AT mit DOT edu)

### Accelerate interatomic force calculations by composing novel machine learning potentials in Julia.

One of the main challenges of atomistic simulations is the acceleration of force calculations. Machine learning potentials promise the accuracy of first-principles methods at a lower computational cost.  Simplifying the creation of these potentials (composed of data, descriptors and learning methods) enables systematizing the search for those combinations that exceed the accuracy and performance of the state of the art. This requires the development of new software abstractions and parallel tools. 
A more detailed description of the project can be found [here](https://docs.google.com/document/d/1mcZlfOULcqglCNqnCJ-ya1E39CLUircjMhfBtQhXP0k/edit?usp=sharing). 
Contact: Emmanuel Lujan (eljn AT mit DOT edu).

## Numerical linear algebra projects 
Mentors: Rabab Alomairy and Evelyne Ringoot

E.g. matrix decompositions algorithms for GPUS, migration of BLAS routines (C) to Julia language and other numerical linear algebra. Interested students who have taken 18.06 or equivalent, and have experience in either julia or C/C++, (great if experience with slurm/supercomputers), please reach out to Evelyne Ringoot and Rabab Alomairy with a resume and github profile link.

# Projects (additional for 18.337)

### Gaussian Elimination Growth

In 1990 Trefethen and Schreiber produced an influential paper on the average case stability of Gaussian elimination with partial and
complete pivoting: [paper link](https://people.maths.ox.ac.uk/trefethen/publication/PDF/1990_44.pdf). In Eq. (6.2) and Figure 6.2 they
suggest (with a clear caveat)  that the growth is n^(2/3) and n^(1/2).  Some years later I histogrammed some values of n maybe
1000, 2000, and 4000 (I'd have to dig it up -- buried in my files), and perhaps I histogrammed g/n^(1/2) or g/n^(2/3) and found
one lined up nice and the other did not.  See what you can find.

### Generic LAPACK

Over the years people have said that an LAPACK rewritten in Julia could have more interesting properties, and also have a smaller codebase
if done carefully.   Find something in [Generic Linear Algebra.jl](https://github.com/JuliaLinearAlgebra/GenericLinearAlgebra.jl) that
is not there currently and add to it, and check that it runs at least as fast as original LAPACK, but perhaps works on quaternions, or funny
number fields, or matrices of matrices etc., and that you can run autodiff on these constructs.

