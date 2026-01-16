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
- Use **R**, with a strong emphasis on:
  - **tidyverse**
  - **ggplot2**
- You may install additional R packages if needed.

---

## 3) Deliverable: Quarto report + rendered HTML

Design and create a detailed **Quarto report** that would answer the user's research question, consider the following coponents if suitable

### Preferred QMD header

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

### EDA
- Data structure, missingness, distributions

### Statistical modeling

### Generalisation check (train vs test)

---

## 4) File naming

Output files must include:
- a timestamp, and
- an explicit focus in the filename

Example pattern:
- `YYYYMMDD_HHMM_(Topic).qmd`
- and the corresponding `.html`

---

## 5) Render workflow and correctness

- Write the `.qmd` in `@source/`
- Render to `.html`
- If rendering fails:
  - fix the `.qmd`
  - re-render until it compiles with zero errors
- After rendering succeeds:
  - read the rendered HTML output
  - write a clear analysis + conclusion that answers the research questions
- If needed:
  - revise the `.qmd`
  - re-render the final HTML

---

## 6) Git delivery

After the final HTML is successfully produced:
- Create a new branch (descriptive name)
- Commit the `.qmd` and `.html` outputs
- Push/publish the branch
- Create a PR via CLI (without opening the browser):
  - Use `gh pr create` (provide title/body in the command or via flags)
