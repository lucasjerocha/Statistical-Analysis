# Statistical Analysis in R

This repository contains the project report for the Applied Statistics in Engineering course, where we analyzed data related to lubricant packaging processes.

## Introduction

This project was undertaken as part of the Applied Statistics in Engineering course, focusing on data analysis using the R programming language. The data used throughout the exercises were imported from an Excel file related to Group 12.

To ensure accurate analysis, variables were inspected for negative values, which were removed as they were not expected in the dataset. The analysis proceeded through three phases: filling, labeling, and packaging, following the structure provided by the course instructor to maintain completeness and adherence to assignment guidelines.

## Questions

### Question 1: Probabilistic Characterization of Velo

We characterize the probabilistic behavior of the variable Velo to determine if it follows a Normal, Chi-square, or Uniform distribution. Initial histogram analysis suggests a Normal distribution, which is confirmed by subsequent Anderson-Darling, Kolmogorov-Smirnoff, and Shapiro-Wilk tests.

### Question 2: Ideal Behavior of Press

We examine whether the behavior of the variable Press conforms to a Normal distribution with a mean of 350 and standard deviation of 121. Statistical tests, including Chi-square, Kolmogorov-Smirnoff, and Anderson-Darling, indicate that Press does not follow the ideal Normal distribution.

### Question 3: Complaints about Packaging Proportions

Complaints from distributors regarding discrepancies in packaging proportions (A, B, M) are statistically confirmed using Chi-square tests, highlighting deviations from requested ratios.

### Question 4: Linear Relationship of Tempo with Velo, Espe, and Resis

Regression analysis explores the linear relationship between Tempo and variables Velo, Espe, and Resis. Results indicate that only Velo significantly contributes to explaining Tempo, while Espe and Resis do not.

### Question 5: Linear Relationship of Custo with Multiple Variables

We analyze the linear relationship between Custo and variables (Velo, Press, Volu, Espe, Resis, Tempo). Significant relationships are found with Velo, Press, and Tempo, with Espe, Resis, and Volu deemed non-significant through statistical tests.

### Question 6: Describing Custo for Packaging Type M

a) Regression analysis assesses linear relationships of CustoM with VeloM, PressM, VoluM, and TempoM, identifying significant relationships with VeloM and TempoM.

b) Significance testing shows VeloM can be excluded without impacting the model.

c) A 95% confidence interval for CustoM based on PressM, VoluM, and TempoM is established to collectively explain CustoM.

d) Labeling defects are assessed for impact on Custo, revealing no significant effect through regression analysis.

### Question 7: Average Cost Comparison Across Packaging Types

Statistical tests compare average costs across packaging types (A, B, M), revealing significant differences in mean costs among the three types.

## Conclusion

This repository contains a comprehensive report on the statistical analysis conducted for the Applied Statistics in Engineering course. Each question was addressed systematically using appropriate statistical techniques, providing insights into variable behaviors and relationships within the lubricant packaging process.

## Repository Contents

- **grupo12_LucasRocha_en.pdf**: Detailed report on statistical analysis.
- **dataset.csv**: Folder containing relevant data files used for analysis.
- **Code.r**: Folder containing R scripts used for data import, analysis, and visualization.

For detailed information and implementation, please refer to the complete report in **grupo12_LucasRocha_en.pdf**.

