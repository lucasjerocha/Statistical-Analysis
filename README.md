# Statistical_Analysis_inR
This repository contains the project report for the Applied Statistics in Engineering course, where we analyzed data related to lubricant packaging processes.

# Introduction
This project was undertaken as part of the Applied Statistics in Engineering course, focusing on data analysis using R programming language. The data used throughout the exercises was imported from an Excel file related to Group 12.

To analyze the behavior of each variable, various tests were employed with a significance level of 5% and 95% confidence intervals. As these variables are real data, negative values are not expected. Therefore, it was necessary to observe the variables to eliminate these values for a correct analysis.

The process is described in three distinct phases: filling, labeling, and packaging. Our report follows the structure provided by the course instructor to ensure completeness and adherence to the assignment guidelines.

# Questions
# Question 1: Probabilistic Characterization of Velo
In this question, we characterize the probabilistic behavior of the variable Velo, aiming to determine if it follows a Normal, Chi-square, or Uniform distribution. Initially, a histogram analysis suggests a Normal distribution. Subsequent tests including Anderson-Darling, Kolmogorov-Smirnoff, and Shapiro-Wilk tests confirm that Velo follows a Normal distribution.

# Question 2: Ideal Behavior of Press
We examine whether the behavior of the variable Press, with mean 350 and standard deviation 121, conforms to a Normal distribution. Tests including Chi-square, Kolmogorov-Smirnoff, and Anderson-Darling indicate that Press does not follow the ideal Normal distribution.

# Question 3: Complaints about Packaging Proportions
Complaints from distributors suggest discrepancies in the proportions of packaging types (A, B, M). Statistical tests, including a Chi-square test, confirm that the complaints are justified, indicating that the delivered proportions do not match the requested ratios.

# Question 4: Linear Relationship of Tempo with Velo, Espe, and Resis
We explore if the variable Tempo can be linearly explained by Velo, Espe, and Resis. Regression analysis shows that only Velo significantly contributes to explaining Tempo, while Espe and Resis do not.

# Question 5: Linear Relationship of Custo with Multiple Variables
Analyzing the linear relationship between Custo and several variables (Velo, Press, Volu, Espe, Resis, Tempo), we find that only Velo, Press, and Tempo show a significant linear relationship. Statistical tests confirm that Espe, Resis, and Volu can be removed from the model without significantly affecting its explanatory power.

# Question 6: Describing Custo for Packaging Type M
a) We determine if a linear approximation using VeloM, PressM, VoluM, and TempoM is justified. Regression analysis suggests that only VeloM and TempoM show significant linear relationships with CustoM.

b) Testing the significance of VeloM in explaining CustoM confirms that VeloM can be excluded without affecting the model.

c) We establish a 95% confidence interval for CustoM based on PressM, VoluM, and TempoM, ensuring these variables collectively explain CustoM.

d) Investigating if labeling defects influence Custo, regression analysis shows no significant change in Custo due to labeling defects.

# Question 7: Average Cost Comparison Across Packaging Types
We analyze if the average cost is similar across packaging types (A, B, M). Statistical tests reveal significant differences in mean costs among the three types of packaging.

# Conclusion
This repository contains the complete report on our statistical analysis for the Applied Statistics in Engineering course. Each question was systematically addressed using appropriate statistical techniques and tests, providing insights into the variables' behaviors and relationships within the lubricant packaging process.

# Repository Contents
grupo12_LucasRocha en.pdf: Detailed report on statistical analysis.

dataset.csv: Folder containing relevant data files used for analysis.

Code.r: Folder containing R scripts used for data import, analysis, and visualization.

For further details, please refer to the complete report in grupo12_LucasRocha en.pdf
