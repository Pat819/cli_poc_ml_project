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

### 1) Create and publish a new git branch and start with a .qmd file
- Start a qmd file with proposed scripts that would help to address the research questions

### 2) Render the output
- Render the report to the target format (e.g., HTML).
- Ensure the build completes with zero errors.
- If the render fails, fix issues and re-render until it succeeds.

### 3) Review the rendered output
- Read the latest rendered .html output (not just the source).
- Focus on the generated graphics, tables and use these information to address the research questions
- Check for:
  - completeness relative to the objectives
  - correctness of results and interpretation
  - clarity, readability, and narrative coherence
  - presentation quality (figures, labels, headings, TOC)
  - reproducibility (consistent results, no brittle steps)
- Propose additional analyses, visualizations, or refinements needed.

### 4) Make all new discovery and necessary adjustments to the .qmd file.
- Based on the new information and findings from step 3, conduct further analysis on .qmd to refine and enhance the report.
- In each section, all another text chunk to report all the main results based on the tables and figures output based on the .html in step 3.
- How did the new results help answer the research questions?

### 5) Version control 
- Stage changes for both source and rendered output (as required).
- Commit with an iteration-tagged message 
- Push commits to the working branch.

### 6) **Make Sure** Create a pull request 
- After completing the third iteration, create a pull request to merge changes into `main` using gh pr create (provide title/body in the command or via flags).
