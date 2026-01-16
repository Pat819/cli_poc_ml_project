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

## 2) Work location and tooling constraints

- Work inside: `@source/`


---

## 3) Deliverable: Quarto report + rendered HTML

Design and create a detailed **Quarto report** that would answer the user's research question, consider the following coponents if suitable

### QMD expectation

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

- In each section, clearl document the logic and reasoning behind your steps. Why did you decide to go with this code chunch and how did it help answer the research question?
- Also, comment your code to explain what each part does inline.

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
## Workflow expectation: iterative report development (3 cycles)

### Goal
Produce a high-quality, reproducible report by iterating through a write → render → review → improve loop three times, versioning progress with Git each cycle.

---

## Iteration loop (repeat 3 times)

### 1) Draft / revise the source
- Update the report source file(s) to improve:
  - structure and clarity
  - analysis depth and correctness
  - visuals, tables, and narrative flow
  - explicit answers to the guiding questions/objectives

### 2) Render the output
- Render the report to the target format (e.g., HTML).
- Ensure the build completes with zero errors.
- If the render fails, fix issues and re-render until it succeeds.

### 3) Review the rendered output
- Read the latest rendered output (not just the source).
- Check for:
  - completeness relative to the objectives
  - correctness of results and interpretation
  - clarity, readability, and narrative coherence
  - presentation quality (figures, labels, headings, TOC)
  - reproducibility (consistent results, no brittle steps)

### 4) Identify improvements
- Write down the top gaps or weaknesses visible in the rendered output.
- Make targeted improvements in the source to address them.

### 5) Version control (end of each iteration)
- Stage changes for both source and rendered output (as required).
- Commit with an iteration-tagged message (e.g., `iter1: ...`, `iter2: ...`, `iter3: ...`).
- Push commits to the working branch.

---

## Completion criteria (after iteration 3)
- The rendered report fully addresses the objectives with clear, well-supported conclusions.
- The project builds cleanly with zero errors.
- The Git history shows three iteration commits, each reflecting meaningful improvement.
