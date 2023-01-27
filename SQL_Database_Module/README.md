# Pewlett_Hackard_Analysis
## Overview of the Pewlett Hackard Analysis:

This week, students were introduced to SQL (standard query language), a powerful tool that many commercial, academic and public sector organizations use to manage large volumes of data within a relational environment.
SQL allows the user to create, read, update and delete data (CRUD), as well explore, reformat and export data to help solve many types of problems. SQL helps manage data to make it easier to use programming languages such as Python, Java, C# and R. 
In addition to gaining a familiarity with using SQL, this week’s module incorporates key concepts and skills development including:
- Working with pgAdmin and PostgreSQL
- Designing an Entity Relational Diagram
- Creating tables in SQL
- Understating primary and foreign keys and relationships between tables
- Importing and exporting data into pgAdmin.
- Joining tables
- Writing SQL statements

In addition to gaining a familiarity with using SQL, the Pewlett-Hackard simulation offers a real-world example where Bobby, a data analyst in the Human Resources department, is given a project to determine the impacts of a wave of expected retirements representing a significant portion of the company’s workforce. 

Using SQL, Bobby’s task is to create insights and analysis that highlight the impacts by title and department, as well as create analytics to support a mentorship program.

## Results: 

- In looking at the retirement-eligible employees, most of the retirement eligible positions are in Development and Production,  however, there is also a significant number of employees in the Sales and Customer Service categories which could have future impacts on Revenue and Client Satisfaction.

![](https://github.com/vjtrom/Pewlett_Hackard_Analysis/blob/main/images/silver_tsunami_counts.png)

- The aggregate number of Engineers retiring, including Assistant Engineer, Engineer and Senior Engineer, represents 50% (half) of all the employees eligible for retirement. 

- While the data shows that the manager count is only 2 eligible positions, logic would suggest that this number is under-represented. More analysis is needed to determine the true management count. It might be related to the position titles not being categorized correctly. 

![](https://github.com/vjtrom/Pewlett_Hackard_Analysis/blob/main/images/retiring_titles.png)

- The mentorship program has different percentages of Engineering and Staff roles than the employees in those roles that are eligible for retirement. This means that more mentors might be needed in certain areas versus others, in order to align the resources with the position types of the retirees.  

## Summary:  

Based on the analysis, there are 72,458 retirement-eligible employees. Most of these positions are in the Engineer and Senior Engineer roles, as well as Staff and Senior Staff. With so many employees in these roles potentially retiring, the organization may have difficulty meeting future development and production goals.

Regarding the mentorship program, the analysis shows that there are 1,549 employees that are eligible for instructing in this program. That may not be enough to cover all of the needs of developing the employees who replace the retiring employees. More analysis is needed to see if the number of mentors can be increased. 


![](https://github.com/vjtrom/Pewlett_Hackard_Analysis/blob/main/images/silver_tsunami.png)
