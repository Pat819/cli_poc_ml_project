# Titanic Disaster Research: Mechanisms of Class-Based Inequality

## Quick Start

**Main Report**: Open `20260123_1118_Titanic_Research_Questions.html` in a web browser to view the complete analysis.

**Source Code**: Edit `20260123_1118_Titanic_Research_Questions.qmd` to modify analyses or regenerate the report.

---

## What's Here

### 📋 Documentation

1. **COMPLETION_SUMMARY.md** - Executive summary of the project, deliverables, and findings
2. **ANALYSIS_PLAN.md** - Detailed analytical framework explaining the research questions and methodology
3. **README.md** (this file) - Quick navigation guide

### 📊 Analysis

1. **20260123_1118_Titanic_Research_Questions.html** (1.5 MB)
   - Rendered HTML report with interactive table of contents
   - All code and outputs visible
   - Self-contained (no external dependencies)

2. **20260123_1118_Titanic_Research_Questions.qmd** (37 KB)
   - Source file in R/Quarto format
   - 33 code chunks with detailed explanations
   - Uses tidyverse, ggplot2, mice, broom, knitr
   - Can be re-rendered to update analyses

### 🔍 Supporting Scripts

- **data_exploration.R** - Initial exploratory analysis used to understand the dataset

---

## The Three Research Questions

### **RQ1: Access vs. Policy**
How much of the class–survival gap reflects physical constraints (access, location) versus policy rules ("women and children first")?

**Methods**: Mediation analysis comparing class-only vs. class + access proxy models

### **RQ2: Rule Consistency**
Were gender and age-based survival rules applied uniformly across all passenger groups, or did they vary by travel context and social visibility?

**Methods**: Interaction testing and stratified analysis by class and travel context

### **RQ3: Missing Data**
Are patterns of missing data systematically related to class and survival? How sensitive are conclusions to different missing-data assumptions?

**Methods**: Descriptive analysis of missingness patterns, chi-square tests, and multiple imputation sensitivity analysis

---

## Key Findings (Summary)

- **RQ1**: Access proxies (cabin, fare) explain ~20-30% of class effect; substantial class effect remains, suggesting both access and policy matter
- **RQ2**: Gender/age rule application varied by class; gaps larger in 1st class (~60% female advantage) than 3rd class (~10-20%)
- **RQ3**: Cabin missingness is concentrated in 3rd class (98% vs. 18% in 1st); findings robust to multiple imputation

---

## How to Use

### View the Report
Simply open `20260123_1118_Titanic_Research_Questions.html` in any web browser. No software required.

### Modify and Regenerate
1. Edit `20260123_1118_Titanic_Research_Questions.qmd` in RStudio or any text editor
2. In R, run:
   ```r
   quarto::quarto_render('20260123_1118_Titanic_Research_Questions.qmd', output_format='html')
   ```
3. Updated `20260123_1118_Titanic_Research_Questions.html` will be generated

### Verify Analysis
1. Ensure R 4.5.1+ is installed
2. Install required packages:
   ```r
   install.packages(c("tidyverse", "broom", "knitr", "mice"))
   ```
3. Run individual code chunks interactively to explore results

---

## Design Principles

This analysis emphasizes:

✅ **Transparency**: All assumptions, limitations, and reasoning explicitly documented  
✅ **Reproducibility**: All numbers dynamically referenced; no hardcoded values  
✅ **Rigor**: Logistic regression, mediation analysis, interaction testing, multiple imputation  
✅ **Humility**: Presents evidence without claiming definitive causal conclusions  
✅ **Clarity**: Each section explains what is being tested and why  

The report is designed to help readers evaluate competing hypotheses rather than to provide a single "answer."

---

## Technical Details

- **Language**: R 4.5.1
- **Platform**: macOS (works on Linux/Windows with R installed)
- **Key Packages**: tidyverse, ggplot2, broom, mice, knitr, quarto
- **Analysis Type**: Logistic regression with mediation framework, interaction testing, multiple imputation
- **Visualizations**: ggplot2 with minimalist theme and RColorBrewer color palettes
- **Tables**: All formatted with knitr::kable()

---

## Data Sources

- **train.csv**: Titanic training dataset (891 passengers, 12 variables)
- Located in: `../../data/train.csv` (relative to this directory)
- Data dictionary available in: `../../CLI_md/data_description.md`

---

## Project Status

✅ Complete and ready for review

- All research questions operationalized and analyzed
- Report rendered to HTML with zero errors
- Code fully documented and reproducible
- Committed to git and pushed to remote (PR #25)

---

## For Further Reading

See "Recommendations for Further Analysis" in Section 5 of the HTML report for suggestions on extending this work:

- Qualitative integration with historical sources
- Three-way interaction models
- Structural equation modeling (SEM)
- Sensitivity to unobserved confounding (Rosenbaum bounds)

---

## Questions?

Refer to:
1. **COMPLETION_SUMMARY.md** for project overview
2. **ANALYSIS_PLAN.md** for methodological framework
3. **HTML Report** (Section 5) for interpretation guidance
4. **.qmd Source** for code comments and technical details

---

**Analysis Date**: January 23, 2026  
**Timestamp**: 20260123_1118  
**Analyst**: CLI Copilot

Last updated: 2026-01-23
