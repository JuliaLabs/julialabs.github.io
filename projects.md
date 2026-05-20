# Postdoc Projects

~~~
<div class="project-card">
<h2 class="project-title">Postdoctoral Research Position: Scientific Machine Learning for Next-Generation QSP Models</h2>
~~~

**MIT Computer Science and Artificial Intelligence Laboratory (CSAIL)**  
**Principal Investigators: Professor Alan Edelman & Dr. Chris Rackauckas**

We are seeking a highly motivated postdoctoral researcher to join a collaborative research project between MIT and GSK, focusing on the integration of Scientific Machine Learning (SciML) with Quantitative Systems Pharmacology (QSP) models. This exciting opportunity combines cutting-edge computational methods with pharmaceutical research to develop next-generation high-fidelity predictive models.

**Duration:** 2 years · **Location:** MIT CSAIL, Cambridge, MA · **Contact:** crackauc@mit.edu

~~~
<details class="project-expand">
<summary>Read more</summary>
~~~

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
- Demonstrated major contributions to open source libraries on the topic, in particular Julia open source libraries and those from the [SciML organization](https://sciml.ai/)
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

### About the Environment

This position offers a unique opportunity to work at the intersection of computational science and pharmaceutical research. You will be part of the vibrant Julia Lab at MIT while collaborating with industry partners at GSK. You will be integrated with the Kendall Square pharmaceutical community, which hosts many of the largest pharmaceutical firms in the world. The research will contribute to open source software development and aims to produce high-impact publications.

### Application Process

Please submit a cover letter, CV with publication list, contact information for three references, and a brief research statement (1–2 pages). **Application Deadline:** Open until filled.

~~~
</details>
</div>
~~~

# Projects (PhD/MEng/UROP)

If you are interested in any of these projects and are a current MIT student looking for a UROP or MEng please reach out to the mentor listed next to project.

### Methods in Scientific Machine Learning

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

### Numerical linear algebra projects 
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

~~~
<style>
  /* h1 = page section dividers, aligned with other site section titles */
  .franklin-content h1 {
    font-size: 16px !important;
    color: var(--text-1, #1c2c28) !important;
    font-weight: 700 !important;
    letter-spacing: -0.01em !important;
    text-transform: none !important;
    border-bottom: none !important;
    padding-bottom: 0.4em !important;
    margin-top: 2.4em !important;
    margin-bottom: 1em !important;
  }
  /* suppress double rule when project-card immediately follows h1 */
  .franklin-content h1 + .project-card {
    border-top: none;
    margin-top: 0;
  }

  /* project title (h2 inside .project-card) — subordinate */
  .franklin-content .project-title,
  .project-card .project-title {
    color: var(--text-2, #3c5050) !important;
    font-size: 15px !important;
    font-weight: 700 !important;
    letter-spacing: normal !important;
    text-transform: none !important;
    border-bottom: 0 !important;
    padding-bottom: 6px !important;
    margin-top: 0 !important;
  }

  .franklin-content h2 {
    color: var(--text-1) !important;
    font-size: 14px !important;
    font-weight: 700 !important;
    letter-spacing: normal !important;
    text-transform: none !important;
  }

  .project-card {
    padding: 14px 10px;
    margin: 0 -10px;
    border-top: 1px solid var(--rule);
    border-radius: 6px;
    transition: background 0.15s;
  }
  .project-card:hover {
    background: rgba(27, 92, 72, 0.06);
  }
  .project-expand {
    margin-top: 10px;
  }
  .project-expand > summary {
    display: inline-flex;
    align-items: center;
    gap: 5px;
    cursor: pointer;
    font-size: 13px;
    font-weight: 600;
    color: var(--accent, #134535);
    list-style: none;
    user-select: none;
  }
  .project-expand > summary::-webkit-details-marker { display: none; }
  .project-expand > summary::after {
    content: "›";
    font-size: 15px;
    transition: transform 0.2s;
    display: inline-block;
  }
  .project-expand[open] > summary::after {
    transform: rotate(90deg);
  }
  .project-expand > summary:hover {
    color: var(--text-1, #1c2c28);
  }
  .project-card h3,
  .project-card h4 {
    color: var(--text-2, #3c5050) !important;
    font-size: 15px !important;
    font-weight: 700 !important;
    letter-spacing: normal !important;
    text-transform: none !important;
    margin-top: 0 !important;
    border-bottom: 0 !important;
    padding-bottom: 4px !important;
  }
</style>
<script>
  document.addEventListener("DOMContentLoaded", function () {
    var content = document.querySelector(".franklin-content");
    if (!content) return;
    var nodes = Array.from(content.childNodes);
    var sections = [];
    var current = null;
    var activeSectionTitle = "";
    nodes.forEach(function (node) {
      var tag = node.nodeName;
      if (tag === "H1") {
        if (current) sections.push(current);
        current = null;
        activeSectionTitle = node.textContent.trim();
        return;
      }
      if (tag === "H3" || tag === "H4") {
        if (current) sections.push(current);
        current = { heading: node, children: [], sectionTitle: activeSectionTitle };
      } else if (current) {
        /* stop collecting if we hit an H1 or H2 section boundary */
        if (tag === "H2") {
          sections.push(current);
          current = null;
        } else {
          current.children.push(node);
        }
      }
    });
    if (current) sections.push(current);
    sections.forEach(function (sec) {
      var card = document.createElement("div");
      card.className = "project-card";
      if (sec.sectionTitle === "Projects (PhD/MEng/UROP)") {
        card.className += " project-card--student";
      }
      sec.heading.parentNode.insertBefore(card, sec.heading);
      card.appendChild(sec.heading);
      sec.children.forEach(function (child) { card.appendChild(child); });
    });
  });
</script>
~~~
