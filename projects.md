# Projects (MEng/UROP)

If you are interested in any of these projects and are a current MIT student looking for a UROP or MEng please reach out
to the mentor listed next to project.

## Methods in Scientific Machine Learning

A large list of projects in scientific machine learning can be found at https://sciml.ai/dev/#projects_lists. Take that
list as a set of ideas from which larger projects cna be chosen.

## Julia Compiler/Runtime for HPC
Mentor: Valentin Churavy

We have many projects for working on compiler or runtimes in the context of scientific computing, the topics below can
serve as inspiration.


### Accelerated computing
- Caching for GPU kernel compilation

#### KernelAbstractions.jl
[KernelAbstractions.jl](https://github.com/JuliaGPU/KernelAbstractions.jl) provides a common interface for writing
GPU kernels in Julia and executing them on multiple platforms.


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

## CESMIX

### Accelerate learning by automatically reducing the size of the training dataset.

Feasibility study on reducing the size of an a-HfO2 dataset using a parallel method based on HDBSCAN and ACE. A parallel Julia implementation of a state of the art method will be required as well as the proposal of an improved version aligned to [CESMIX](https://computing.mit.edu/cesmix/) objectives.
Description [here](https://docs.google.com/document/d/1SWAanEWQkpsbr2lqetMO3uvdX_QK-Z7dwrgPaM1Dl0o/edit?usp=sharing). 
Contact: Emmanuel Lujan (eljn AT mit DOT edu)
