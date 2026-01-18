## 1) Git hygiene

- Ensure you’re on the `main` branch:
  - `git checkout main`
- Pull the latest changes from remote:
  - `git pull`

---

## 2) Data locations

- Train and test CSV files are in: `@data/`
- Data description is in: `@CLI_md/data_description.md`

---

---
## Workflow expectation: iterative report development 

### Goal
Produce a high-quality, reproducible report that propose analysis component to help answering research questions using best practices in data analysis and visualization.
Use R with a strong emphasis on tidyverse and ggplot2.
You may install additional R packages if needed.

---

## Worlflow 

### 1) Create and publish a new git branch, then start the first `.qmd`
- Create and switch to a new descriptive branch.
- Push the branch immediately so progress is backed up remotely.
- Follow the follow steps to create the main analysis .qmd and render it to a corresponding .html report
---

### 2) Expectation of the .qmd file
- You need to consider carefully of what data you have access to and the research question
- Detail a plan how you will approach the analysis
- **Important** For every section and for every code chunk you produced, there should be a **VERY DETAIL** paragraph to explain
  - what you are doing,
  - why you are doing it,
  - what assumptions you are making,
  - How is the action helps to address the research question
- For example, if your report have 3 sections (A, B, C) and each section have 3 code chunks (1, 2, 3), then you should have at least 9 paragraphs to explain your logic behind each code chunk
- **Important** Avoid drawing conclusio or observations, your job is to designs steps to help answer the research question, not to answer it directly. Focus on *how* to make a decision, not *what* the decision is.
  - Do not hullucinate, everything should be based on facts
  - Use logical reasoning to guide user to make their own conclusion.

#### qmd Header

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
#### ggplot desing
- go with a consistent minimalist theme
- Think carefully about color palettes (e.g., viridis, RColorBrewer)
- Ensure all plots have clear titles, axis labels, and legends
- legends position should always be bottom

#### Tables design
- All table should be compiled with `knitr::kable()` for better formatting
- **Make sure** all table formatting are consistent across the report

#### File naming

Output files must include:
- a timestamp, and
- an explicit focus in the filename

Example pattern:
- `YYYYMMDD_HHMM_(Topic).qmd`
- and the corresponding `.html`

### 3) Render the .html report
- **Make Sure** Render the report to HTML.
- The render **must** complete with zero errors.
- If the render fails:
  - fix the underlying cause (packages, code, paths, chunk options, assumptions)
  - re-render until it compiles cleanly
- Treat the rendered HTML as the “source of truth” for what a reader will see.

### 4) Check if both .qmd and .html is present
- If any of the files is missing, repeat step 2 and step 3
- **ONLY WHEN** both files are present, proceed to step 5

### 5) Version control 
- Stage changes for both source and rendered output (as required).
- Push commits to the working branch.

### 6) **Make Sure** Create a pull request 
- With the report compiled, create a pull request to merge changes into `main` using gh pr create (provide title/body in the command or via flags).
