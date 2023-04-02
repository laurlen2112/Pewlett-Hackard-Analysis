# Pewlett-Hackard Analysis

# Purpose and Overview:
To ensure the long-term viability of the company, Pewlett-Hackard (PH) has undertaken an initiative to "future-proof" its operations. As part of this effort, PH has carefully reviewed its records to identify employees who are likely to retire based on their birth year, as well as those who are eligible for a mentorship program. This analysis was conducted using PostgreSQL and PG Admin.

# Results: 

* According to the analysis conducted on the "Retirement Titles" CSV, it appears that over 133,000 employees are expected to retire based on their [birth year](https://github.com/laurlen2112/Pewlett-Hackard-Analysis/blob/main/resources/del_1_retirement_code.png). This particular query provides information on the employee number, name, job title, and the duration of their employment. However, it's worth noting that this query may overestimate the number of retiring employees, as it includes duplicate entries for some individuals who hold multiple job titles. For example, employee number 10004 appears on rows 3 and 4 of the ["Retirement Titles" CSV](https://github.com/laurlen2112/Pewlett-Hackard-Analysis/blob/main/resources/retirement_titles_CSV.png) with different job titles listed in each row.

<img src ="https://github.com/laurlen2112/Pewlett-Hackard-Analysis/blob/main/resources/bullet%201.png" width = "900" height ="200"/>

* According to the "Unique Titles" CSV, it is predicted that more than 72,000 employees will retire. This CSV includes details such as employee number, name, and job title. To eliminate any duplicate entries, this query utilizes PostgreSQL's ["distinct on"](https://github.com/laurlen2112/Pewlett-Hackard-Analysis/blob/main/resources/del_%201_unique_titles_code.png) capability. As an illustration, employee number 10004 appears only once in the [CSV on row 3](https://github.com/laurlen2112/Pewlett-Hackard-Analysis/blob/main/resources/unique_titles_csv.png), listed as a Senior Engineer in his current position.

<img src ="https://github.com/laurlen2112/Pewlett-Hackard-Analysis/blob/main/resources/bullet%202.png" width = "800" height ="200"/>

The CSV titled ["Retiring Titles"](https://github.com/laurlen2112/Pewlett-Hackard-Analysis/blob/main/resources/retiring%20titles.png) displays the projected retirements categorized by job title, along with the number of expected retirements for each position. As per this data, the roles of Senior Engineer and Senior Staff are anticipated to experience the highest number of vacancies due to retirements. The corresponding image shows the retirements grouped by job title and counts the expected retirements per position.

<img src = "https://github.com/laurlen2112/Pewlett-Hackard-Analysis/blob/main/resources/bullet%203.png" width = "800" height = "200"/>

According to the ["Mentorship Eligibility"](https://github.com/laurlen2112/Pewlett-Hackard-Analysis/blob/main/resources/mentorship_elig.png) CSV, more than 1500 employees meet the eligibility criteria for the mentorship program. The employees were filtered based on their birth year, and the "distinct on" feature was used to remove any duplicate entries. As a result, [the query](https://github.com/laurlen2112/Pewlett-Hackard-Analysis/blob/main/resources/del_2_code.png) provides details such as employee number, name, birth date, "to" and "from" dates, and job title for each eligible employee.

<img src ="https://github.com/laurlen2112/Pewlett-Hackard-Analysis/blob/main/resources/bullet%204.png" width = "900" height ="200"/>


# Summary:

The analysis indicates that approximately 72,458 employees are expected to retire, resulting in significant job vacancies. The data also confirms that there are 1,549 employees who meet the eligibility criteria for the mentorship program. This implies that there are enough retirement-ready employees who can be mentors to those who are eligible for the mentorship program.

However, the current pool of mentorship-eligible employees is small as it was determined based on the birth year of 1965. On the other hand, the pool of retirement-ready employees was filtered over a three-year span, from 1952 to 1955, resulting in a much larger number of retirement-ready employees. Therefore, it is recommended that Pewlett-Hackard (PH) expand the birth year filter in subsequent queries to increase the pool of mentorship-eligible employees.

Furthermore, PH should create a table similar to the "Retiring Titles" table that displays the count of mentorship-eligible employees [grouped by title](https://github.com/laurlen2112/Pewlett-Hackard-Analysis/blob/main/resources/suggested_code.png). This will enable easy [comparison between](https://github.com/laurlen2112/Pewlett-Hackard-Analysis/blob/main/resources/mentor_vs_retire.png) the mentorship-eligible employees and retiring employees on a per title basis, allowing PH to identify areas where mentorship programs are most needed.

<img src ="https://github.com/laurlen2112/Pewlett-Hackard-Analysis/blob/main/resources/paragraph%203.png"/>

Lastly, Pewlett-Hackard (PH) should conduct a more granular analysis of the data presented in the "Retiring Titles" CSV. For instance, PH could execute [an additional query](https://github.com/laurlen2112/Pewlett-Hackard-Analysis/blob/main/resources/Screen%20Shot%202022-05-25%20at%201.06.01%20PM.png) that breaks down the projected retirements on a per title, per department basis. [This query](https://github.com/laurlen2112/Pewlett-Hackard-Analysis/blob/main/resources/drill_count.png) will reveal whether the anticipated retirements are evenly distributed across departments by displaying the count of retiring titles for each department. By analyzing this data, PH will be able to identify departments that may require additional resources in the future.

<img src ="https://github.com/laurlen2112/Pewlett-Hackard-Analysis/blob/main/resources/paragraph%204.png" width = "900" height ="700"/>
