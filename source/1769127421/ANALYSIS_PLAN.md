# Titanic Research Questions: Analytical Framework & Plan

## Overview
This analysis addresses three interconnected research questions about the Titanic disaster, focusing on mechanisms rather than predictions. The goal is to design analytical steps that help readers understand *how* to evaluate different hypotheses about class effects, rule application consistency, and missing data bias.

---

## Research Questions & Analytical Approach

### **RQ1: Class-Survival Gap Mediation**
**Question:** How much of the class–survival gap is explained by *access/constraints* (location, deck, cabin proximity) versus *policy* ("women and children first")?

**Available Data Proxies:**
- **Access/Constraints**: Cabin availability (Cabin), Fare (correlates with location/deck quality), Embarked (boarding point)
- **Policy**: Sex, Age, combined with Class interactions
- **Mediation Indicator**: Cabin letter (proxies deck), Fare distribution across classes

**Analytical Strategy:**
1. **Baseline Model**: Fit logistic regression with Pclass only → get class effects (β₁, β₃)
2. **Full Model**: Add Sex, Age, and access proxies (Cabin availability, Fare, Embarked)
3. **Comparison**: 
   - How much does the Pclass coefficient shrink when access proxies are added?
   - Residual class effect = unexplained by access (possibly policy-driven)
4. **Sensitivity Check**: Compare models with/without Age + Sex to isolate "women and children first" effect

**Key Metrics:**
- Class effect in baseline vs full model (quantify shrinkage %)
- Contribution of each proxy to coefficient reduction
- Survival rates by combination of (Class, Cabin availability, Fare quartile)

**Visualization Ideas:**
- Coefficient plot comparing models
- Heatmap: Survival by Class × Cabin Availability
- Distribution of Fare by Class and Survival status

---

### **RQ2: Gender/Age Rules & Social Visibility**
**Question:** Were "women and children first" rules applied consistently, or did they vary by travel context (family/group) and social visibility (fare/title)?

**Available Data Proxies:**
- **Travel Context**: Family size from SibSp + Parch; create groups (alone, small family, large group)
- **Social Visibility**: Extract Title from Name (Mr, Mrs, Miss, Master, Dr, etc.); Fare as proxy
- **Rule Application**: Sex × Age × Class × Context interactions

**Analytical Strategy:**
1. **Construct Variables:**
   - Extract titles from Name field
   - Create travel context variable: alone (SibSp+Parch=0), paired (1), small family (2-3), large group (4+)
   - Age groups: child (<18), adult (18-50), senior (50+)

2. **Base Case Analysis:**
   - Overall survival by Sex, Age, Class (baseline for "women and children first")
   - Quantify the effect size (how strong is the sex effect? how strong is age effect?)

3. **Interaction Tests:**
   - Sex × Travel Context: Did being alone change sex-based survival advantage?
   - Title × Class: Did title (social role) modify class-survival relationship?
   - Age × Family Size: Did older children in families survive differently?

4. **Consistency Assessment:**
   - Calculate survival gaps (sex, age) separately for each travel context and class
   - If rules were consistent, gaps should be similar across groups
   - If rules varied, gaps will differ systematically

**Key Metrics:**
- Female survival advantage (gap) by travel context and class
- Child survival advantage (gap) by travel context and class
- Variance in gender/age gaps across subgroups

**Visualization Ideas:**
- Faceted bar plots: Survival rate by Sex × Context × Class
- Violin plots: Age distribution of survivors vs non-survivors by Sex
- Heatmap: Female survival advantage by Class × Family Context

---

### **RQ3: Missing Data Patterns & Sensitivity**
**Question:** Are patterns of missingness (Cabin, Age) systematically related to class/embarkation/survival, and how sensitive are conclusions to different assumptions?

**Missing Data in Dataset:**
- **Cabin**: 687/891 missing (77.1%) - strongly related to class (1st: 18.5% missing, 3rd: 98% missing)
- **Age**: 177/891 missing (19.9%) - distributed across classes
- **Embarked**: 2/891 missing (0.2%) - negligible

**Analytical Strategy:**

1. **Missingness Patterns:**
   - Quantify missingness by Pclass, Sex, Survived status
   - Test association: Is missingness significantly different across survival outcomes?
   - Interpretation: High Cabin missingness in 3rd class could mean:
     - a) 3rd class passengers were truly in unidentified spaces
     - b) Record-keeping was worse for lower classes
     - c) Both (structural + administrative inequality)

2. **Sensitivity to Different Assumptions:**
   - **Assumption 1 (MCAR - Missing Completely At Random)**: Treat missing as random loss
   - **Assumption 2 (MAR - Missing At Random)**: Missing Cabin info predictable from observed data
   - **Assumption 3 (MNAR - Missing Not At Random)**: Missing data indicates 3rd class isolation/lack of cabin assignment
   
3. **Quantify Sensitivity:**
   - Run models under different missing data handling:
     - a) Complete case analysis (drop missing rows)
     - b) Simple mean/median imputation
     - c) Multiple imputation
   - Compare results: Do conclusions about Class effects change depending on assumption?

**Key Metrics:**
- Missingness rates by Class, Sex, Survived
- Chi-square test: Missingness vs Survival status (overall and by class)
- Coefficient changes across different imputation strategies

**Visualization Ideas:**
- Missing data heatmap: Rows (ordered by class/survival) × Columns (variables), shading shows missingness
- Missingness patterns by Class and Survival (stacked bar or mosaic plot)
- Sensitivity plot: Class coefficient estimates under different assumptions

---

## Report Structure

### Section 1: Data Overview & Missingness
- Load and describe the dataset
- Document missingness patterns
- Establish baseline survival rates and class breakdown

### Section 2: Access & Constraints (RQ1)
- Baseline class-only model
- Add access proxies (Cabin, Fare, Embarked)
- Compare coefficients and quantify mediation
- Visualize class-survival relationship under different model specifications

### Section 3: Rule Application & Social Context (RQ2)
- Create derived variables (Title, Travel Context, Age Groups)
- Analyze overall gender and age effects
- Examine how effects vary by context and class
- Visualize consistency (or lack thereof) in rule application

### Section 4: Missing Data Sensitivity (RQ3)
- Characterize missingness patterns statistically
- Run analyses under different missing data assumptions
- Document how conclusions change (or remain robust)
- Highlight implications for interpretation of class effects

### Section 5: Synthesis
- Summarize findings without drawing conclusions
- Highlight trade-offs and ambiguities in the evidence
- Guide reader on how to interpret the evidence for each RQ

---

## Technical Specifications

**Tools & Packages:**
- **Language**: R (version 4.5.1)
- **Core Libraries**: tidyverse (dplyr, ggplot2, tidyr, stringr)
- **Additional Packages**:
  - `broom` - for tidy model output
  - `mice` - for multiple imputation
  - `car` - for Anova and model comparisons
  - `knitr` - for table formatting
  - `ggplot2` - consistent theming (theme_minimal + custom colors)

**Model Approach:**
- Logistic regression for all analyses (binomial outcome: Survived 0/1)
- Interpret coefficients in log-odds, present as odds ratios where helpful
- Use interaction terms to test heterogeneity in effects

**Visualization Standards:**
- **Theme**: `theme_minimal()` with custom gridlines
- **Colors**: Use viridis or RColorBrewer for consistency
- **Layout**: Legends positioned at bottom, clear titles and axis labels
- **Reproducibility**: All numbers referenced dynamically from code chunks

---

## Key Assumptions & Caveats

1. **Cabin as Access Proxy**: Assumes cabin availability indicates deck location/access, though missing values may reflect record-keeping bias rather than true absence of cabin assignment.

2. **Title as Social Status**: Extract from names may capture occupation, marital status, or simple courtesy titles—all imperfect proxies for social visibility.

3. **Family Context**: Assumes SibSp + Parch accurately capture travel groups, though some passengers with SibSp/Parch=0 may have traveled with unrelated companions.

4. **Missing Data Mechanism**: Unknown whether missingness is MCAR, MAR, or MNAR. Analysis tests sensitivity but cannot definitively determine true mechanism.

5. **Cause vs. Association**: All analyses are observational. Coefficients reflect associations, not causal effects. Mediation analysis relies on sequential ignorability assumptions.

---

## Next Steps

1. Create timestamped .qmd file with this analytical plan embedded
2. Implement data preparation and variable engineering
3. Fit models and generate visualizations
4. Write detailed narrative explaining each code chunk
5. Render to HTML and review for clarity and completeness
6. Iterate if additional analyses strengthen arguments
7. Commit and create pull request
