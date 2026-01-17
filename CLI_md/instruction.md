## 0) Git hygiene

- Ensure you’re on the `main` branch:
  - `git checkout main`
- Pull the latest changes from remote:
  - `git pull`

---

## 1) Data locations

- Train and test CSV files are in: `@data/`
- Data description is in: `@CLI_md/data_description.md`

---

## 2) Work location 

- Work inside: `@source/`


---

## 3) QMD expectation

#### Header

---
title: 
author: "CLI Copilot"
format:
  html:
    toc: true
    toc-depth: 3
    code-fold: show
    self-contained: true
execute:
  echo: true
  warning: false
  message: false
---

#### Sections

- In each section, the should be a text chuck for each code chunk that clearly document the logic and reasoning behind your steps. 
- Why did you decide to go with this code chunck?
- How did it help answer the research question?
- Also, comment your code to explain what each part does inline.
- I need everything in **GREAT DETAILS** try as hard as possible to explain everything.

#### ggplot desing
- go with a consistent minimalist theme
- Think carefully about color palettes (e.g., viridis, RColorBrewer)
- Ensure all plots have clear titles, axis labels, and legends
- legends position should always be bottom


#### Tables design
- Use `knitr::kable()` for better formatting
---

## 4) File naming

Output files must include:
- a timestamp, and
- an explicit focus in the filename

Example pattern:
- `YYYYMMDD_HHMM_(Topic).qmd`
- and the corresponding `.html`

---
## Workflow expectation: iterative report development 

### Goal
Produce a high-quality, reproducible report by iterating through a write → render → review → improve loop 
Use R with a strong emphasis on tidyverse and ggplot2.
You may install additional R packages if needed.

---

## Iteration loop 

### 1) Create and publish a new git branch, then start the first `.qmd`
- Create and switch to a new descriptive branch.
- Push the branch immediately so progress is backed up remotely.
- Create an initial `.qmd` that functions as a **baseline analysis scaffold**:
  - Include the preferred Quarto YAML header.
  - Load libraries, define helper functions, set seeds, and configure consistent plotting themes.
  - Import and validate data (types, ranges, missingness, duplicates).
  - Add clearly named sections aligned to the research questions.
  - Implement a first-pass EDA + baseline models that directly target the questions.
- Keep the `.qmd` runnable end-to-end from a clean environment.

---

### 2) Render the output (and enforce correctness)
- Render the report to HTML.
- The render **must** complete with zero errors.
- If the render fails:
  - fix the underlying cause (packages, code, paths, chunk options, assumptions)
  - re-render until it compiles cleanly
- Treat the rendered HTML as the “source of truth” for what a reader will see.

---

### 3) Review the rendered HTML and upgrade the report in a new `.qmd`
- Read the latest rendered `.html` output (not just the source).
- Create a new `.qmd` version intended for **final reporting quality**, using what you learned from the HTML:
  - Preserve working code, but improve structure, narrative flow, and interpretability.
  - For every major section, add a dedicated **Results** text block that:
    - summarizes the key patterns shown in figures/tables
    - states the direction and magnitude of effects where possible
    - explicitly links the evidence back to the research questions
  - Use graphics/tables from the rendered HTML as the anchor:
    - interpret what they show
    - refine or replace plots/tables that do not support clear conclusions
- Evaluate the HTML output against these checks:
  - **Completeness:** are all objectives/questions answered explicitly?
  - **Correctness:** are claims supported by outputs? are assumptions stated?
  - **Interpretation quality:** do you distinguish association vs explanation where relevant?
  - **Clarity:** readable headings, coherent story, minimal jargon, strong transitions
  - **Presentation:** informative titles/captions, labeled axes, consistent formatting, TOC works
  - **Reproducibility:** deterministic outputs, no brittle paths, minimal manual steps
- Propose and implement additional analyses/visualizations/refinements as needed, such as:
  - interaction plots / marginal effects / predicted probability curves
  - sensitivity checks (alternative encodings/binnings, robustness to missingness)
  - diagnostics and validation summaries to justify conclusions

### 4) Version control 
- Stage changes for both source and rendered output (as required).
- Commit with an iteration-tagged message 
- Push commits to the working branch.

### 5) **Make Sure** Create a pull request 
- After completing the third iteration, create a pull request to merge changes into `main` using gh pr create (provide title/body in the command or via flags).
