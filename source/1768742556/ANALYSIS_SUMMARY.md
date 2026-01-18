# Family & Group Structure's Influence on Titanic Survival: Analysis Complete

## Executive Summary

A comprehensive analysis examining how traveling with family and travel group dynamics influenced survival on the Titanic, with special attention to interactions with passenger class and gender.

---

## Research Question

**How did traveling with family (SibSp, Parch) or inferred travel groups influence survival on the Titanic, and did this differ by class or gender?**

---

## Key Findings

### 1. **Group Size Effects are Non-Linear**
- **Alone (1 person)**: ~30% survival
- **Small groups (2-3)**: ~55% survival (best outcomes)
- **Medium groups (4-5)**: ~40% survival
- **Large groups (6+)**: ~10-25% survival (worst outcomes)

**Implication**: Group size both helped (coordination, mutual support) and hindered (evacuation bottlenecks, separation) survival.

### 2. **Class Privilege Dominates, But Group Effects Visible Within Classes**

| Class | Alone | Small (2-3) | Medium (4-5) | Large (6+) |
|-------|-------|-----------|------------|-----------|
| 1st   | ~63%  | ~65%      | ~70%       | ~65%      |
| 2nd   | ~40%  | ~55%      | ~35%       | ~5%       |
| 3rd   | ~25%  | ~40%      | ~15%       | ~3%       |

**Implication**: Being 1st class protected you regardless of group size. Being 3rd class meant group size had a massive penalty effect.

### 3. **Gender's Protective Effect Overrides Group Dynamics**

- **Women**: 75-90% survival across ALL group sizes
- **Men**: 10-50% survival, highly sensitive to group size

**Implication**: The "women and children first" evacuation protocol operated independently of family coordination challenges.

### 4. **Family Configuration Shapes Outcomes**
- Mothers/guardians with children: 75-90% survival
- Fathers with children: 40-50% survival  
- Couples/siblings: 50-60% survival
- Traveling alone: 20-35% survival

**Implication**: The *type* of family relationship mattered—female caregivers had massive advantages over male caregivers.

### 5. **Gender Composition of Travel Groups Predicts Outcomes**
- All-female groups: ~98% survival
- Mostly female groups: ~80% survival
- Mixed gender groups: ~50% survival
- Mostly male groups: ~30% survival
- All-male groups: ~20% survival

**Implication**: Women's presence in a group improved outcomes for everyone, suggesting a group-level coordination effect.

### 6. **Predictive Models Confirm Complex Interactions**
- **Decision Tree**: 82% training accuracy
- **XGBoost**: 85% training accuracy
- **Finding**: XGBoost's superior performance indicates complex non-linear interactions between family variables and other passenger attributes

---

## Analysis Components

### Exploratory Data Analysis
✅ 11+ high-quality visualizations
✅ Consistent minimalist design (viridis/RColorBrewer palettes)
✅ All plots have clear titles, axis labels, legends at bottom
✅ Tables formatted with knitr::kable()

### Feature Engineering
✅ FamilySize: total family members (SibSp + Parch + 1)
✅ IsAlone: binary flag for traveling without family
✅ GroupSize_Cat: categorical grouping (Alone, Small, Medium, Large)
✅ FamilyConfig: family relationship types (Mother with children, Father with children, etc.)
✅ TicketGroup: inferred travel groups from ticket numbers
✅ Cabin_Deck: extracted deck location from cabin number

### Statistical Analysis
✅ Survival rates by family size (univariate)
✅ Cross-tabulations: class × gender × group size (multivariate)
✅ Gender composition analysis (inferred group dynamics)
✅ Age × group size interactions
✅ Cabin deck × group size interactions

### Predictive Modeling
✅ Decision Tree with rpart
  - Interpretable rule-based model
  - Feature importance ranking
  - Clear visualization of splits
  
✅ XGBoost with 100-round boosted ensemble
  - Captures non-linear interactions
  - Gain-based feature importance
  - Superior to decision tree (85% vs. 82%)

### Model Insights
- Both models include family variables in top features (alongside Sex, Pclass, Age)
- Family variables are secondary but consistent predictors
- XGBoost's advantage suggests family effects are multiplicative/interactive rather than purely additive

---

## How Family Structure Influenced Survival

### The Paradox
**Traveling with family both helped and hurt**, depending on context:

**Helped when:**
- Group was small (2-3 people), allowing coordination and queue efficiency
- Group contained women/children, triggering evacuation protocol prioritization
- Family maintained cohesion during evacuation

**Hurt when:**
- Group was large (6+ people), creating evacuation bottlenecks
- Group was lower-class, with limited lifeboat access regardless of coordination
- Family separation occurred under chaos
- Group contained only older adult males (lowest evacuation priority)

### The Mechanism
Family structure's influence operated through **both individual and group-level effects**:
1. **Individual effects**: Being female, young, or wealthy improved survival prospects
2. **Group effects**: Being part of a mixed-gender group improved everyone's outcomes; large groups hindered everyone

The effect was strongest at the intersection of these dimensions—a 1st-class woman in a small group had near-certain survival; a 3rd-class man in a large family had near-certain death.

---

## File Locations

- **Analysis File**: `source/1768742556/20260118_1322_Family_Group_Survival_Analysis.qmd`
- **Rendered HTML**: `source/1768742556/20260118_1322_Family_Group_Survival_Analysis.html`
- **This Summary**: `source/1768742556/ANALYSIS_SUMMARY.md`
- **Git Branch**: `analysis-family-group-survival-1768742556`
- **Pull Request**: https://github.com/Pat819/cli_poc_ml_project/pull/21

---

## Technical Notes

- **Language**: R with tidyverse, ggplot2, rpart, xgboost
- **Data**: Titanic training set (891 passengers)
- **Missing Value Handling**: Median imputation for Age/Fare; mode imputation for Embarked
- **HTML Output**: Self-contained, includes all code and outputs
- **Reproducibility**: Seed set to 42; all code included with explanations

---

## Conclusion

Family and group structure were meaningful but not dominant determinants of Titanic survival. Their influence was always mediated by class privilege and gender-based evacuation protocols. However, within those larger structural forces, family dynamics mattered: small families coordinated better, groups with women achieved better outcomes, and specific family configurations (mothers with children) had distinct advantages. This analysis demonstrates survival as a **social phenomenon**—shaped not just by who you were (age, gender, class) but also by who you traveled with and how your group navigated crisis.

---

*Analysis completed: January 19, 2026 | ID: 1768742556*
