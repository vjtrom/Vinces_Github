# School District Analysis - Module 4
## 1. Overview of the school district analysis:

Python itself is a powerful tool, but when combined with Pandas, an open-source library that contains high-performance analytics tools, the combination is even more impactful. In this week’s module, students were introduced to the Pandas library of functions and features, as well as how it integrates with Python. To access these tools, students were instructed on using the distribution software Anaconda and a module within it called Jupyter Notebook. Using the Jupyter Notebook interface allowed easier editing and running of code, giving students the opportunity to build programs through partitioning and modularizing the development flow. 

In addition to gaining a familiarity with these tools, students were given a real-world simulation to see how Python and Pandas can be applied and how they work together. The ***PyCity Schools*** model incorporates key concepts and skills development that will help students build a foundation in coding and managing data. These include:

- Launching Jupyter Notebook files 
- Creating a development environment.
- Reading CSV files into a Pandas DataFrame.
- Building and formatting DataFrames with Pandas
- Working with the elements within a Dataframe such as rows, columns, parameters and elements
- Understanding how Pandas functions can be applied to the DataFrame
- Working with data types and how to locate, group and retrieve values and sets of values within a DataFrame.
- Merging, filtering, slicing, and sorting a DataFrame.
- Performing mathematical calculations on columns of a DataFrame or Series.

The ***PyCity Schools*** simulation model offers a real-world example where Maria, your boss, assigns a project for you to aggregate, calculate and prepare school performance scores for the PyCity School Board. Specifically, certain grades have been altered and there appears to be academic dishonesty. Using Python and Pandas, your job is to read a CSV data file, convert it to a DataFrame, replace ninth-grade reading and math scores at Thomas High school,  develop the School District Analysis, and create a written report detailing the results.


## 2. Results: 
### - How is the district summary affected?

Since Thomas High School (THS) 9th grade reading and math scores were in question, the simulation requires replacing those scores with “NaN” (Not a number). (Note, this is not the same as replacing the scores with the value of zero.) When the scores were revised, the metrics in the School District Summary also changed. While Total Schools and Budget remained the same, the Average Reading and Math Scores, as well as the % Passing Scores for Reading, Math and Overall were revised to reflect the exclusion of the THS 9th grade class. 

#### Original
![SCD Summary_Orig](https://github.com/vjtrom/School_District_Analysis/blob/main/images/School_District_Summary_original.png)
#### Revised
![SCD Summary_Rev](https://github.com/vjtrom/School_District_Analysis/blob/main/images/School_District_Summary_rev.png)

### - How is the school summary affected?

Similarly, revised scores for THS 9th grade had an impact on that school’s performance. Specifically, % Passing Reading changed from 97.3% to 97.0%, % Passing Math from 93.3% to 93.1% , and % Overall Passing went from 90.9% to 90.6%. Total Students, Budget, and Per Student Budget remained the same.

#### Original
![School_Summary_Orig](https://github.com/vjtrom/School_District_Analysis/blob/main/images/School_Summary_original.png)
#### Revised
![School_Summary_Rev](https://github.com/vjtrom/School_District_Analysis/blob/main/images/School_Summary_revised.png)

### - How does replacing the ninth graders’ math and reading scores affect Thomas High School’s performance relative to the other schools?

When revising the THS School 9th grade scores to NaN, the overall ranking of THS as second best relative to the others remains unchanged. THS still falls in second place. 

### - How does replacing the ninth-grade scores affect the following:

- Math and reading scores by grade - Since the 9th grade at THS was revised, ninth grade scores across all schools will decline. 
- Scores by school spending – Thomas High School falls under the $631-$645 spending per student, so the scores for this category declined.
 
#### Original
![School_by_spending_orig](https://github.com/vjtrom/School_District_Analysis/blob/main/images/School_budget-per_original.png)
#### Revised
![School_by_spending_Rev](https://github.com/vjtrom/School_District_Analysis/blob/main/images/School_budget_per_revised.png)

- Scores by school size – Thomas High School falls under the Medium School Size (1000-1999), therefore, the scores for this category declined.
 
#### Original
![size_original](https://github.com/vjtrom/School_District_Analysis/blob/main/images/School_Size_original2.png)
#### Revised
![size_revised](https://github.com/vjtrom/School_District_Analysis/blob/main/images/School_Size_revised.png)

- Scores by school type – Since THS is a Charter school, scores for this type of school declined.

#### Original
![type_original](https://github.com/vjtrom/School_District_Analysis/blob/main/images/School_By_type_original.png)
#### Revised
![type_revised](https://github.com/vjtrom/School_District_Analysis/blob/main/images/School_By_type_revised.png)

## 3.  Summary: 
Summarize four changes in the updated school district analysis after reading and math scores for the ninth grade at Thomas High School have been replaced with NaNs:

- Average Math Scores declined from 78.99 to 78.93
- Average Reading Scores declined from 81.88 to 81.86
- % Passing Math declined from 74.98 to 74.76
- % Passing Reading declined from 84.81 to 85.66
- % Overall Passing declined from 65.17 to 64.86
