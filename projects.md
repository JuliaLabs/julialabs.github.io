# Projects (MEng/UROP)

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

