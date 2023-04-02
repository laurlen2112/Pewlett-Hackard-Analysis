# Pewlett-Hackard Analysis

# Purpose and Overview:
In an effort to "future-proof" the company, Pewlett-Hackard (PH) is scrutinizing their records to determine which employees will likely retire based on birth year and which employees are eligible for a mentorship program.  This analysis was completed using PostgreSQL and PG Admin.

# Results: 

* The "Retirement Titles" CSV calculates that over 133,000 employees are due to retire based on [birth year](https://github.com/laurlen2112/Pewlett-Hackard-Analysis/blob/main/resources/del_1_retirement_code.png).  This query returns employee number, employee name, job title, and "to" and "from" dates.  This query over-anticipates the number of retiring employees because it captures employees with their previous and current job titles so there are duplicate entries.  By way of example, employee number 10004 is listed on rows 3 and 4 of [this CSV](https://github.com/laurlen2112/Pewlett-Hackard-Analysis/blob/main/resources/retirement_titles_CSV.png) holding a different job title in each row.

<img src ="https://github.com/laurlen2112/Pewlett-Hackard-Analysis/blob/main/resources/bullet%201.png" width = "900" height ="200"/>

* The "Unique Titles" CSV forecasts that over 72,000 employees will retire.  The CSV contains employee number, name, and title.  This query uses the ["distinct on"](https://github.com/laurlen2112/Pewlett-Hackard-Analysis/blob/main/resources/del_%201_unique_titles_code.png) ability of PostgreSQL to filter out the duplicate entries described above.  For example, [here](https://github.com/laurlen2112/Pewlett-Hackard-Analysis/blob/main/resources/unique_titles_csv.png), employee number 10004 is only visible on row 3 of this CSV in his current position as Senior Engineer.

<img src =https://github.com/laurlen2112/Pewlett-Hackard-Analysis/blob/main/resources/bullet%202.png" width = "800" height ="200"/>

* The ["Retiring Titles"](https://github.com/laurlen2112/Pewlett-Hackard-Analysis/blob/main/resources/retiring%20titles.png) CSV shows anticipated retirements [grouped by](https://github.com/laurlen2112/Pewlett-Hackard-Analysis/blob/main/resources/del_1_count_code.png) job title and counts the expected retirements per position.  Based on this information, the Senior Engineer and the Senior Staff positions will realize the most vacancies due to retirement.

<img src ="https://github.com/laurlen2112/Pewlett-Hackard-Analysis/blob/main/resources/bullet%203.png" width = "800" height ="200"/>

* The ["Mentorship Eligibility"](https://github.com/laurlen2112/Pewlett-Hackard-Analysis/blob/main/resources/mentorship_elig.png) CSV shows that over 1500 employees are eligible for the mentorship program.  Employees were filtered based on birth year and "distinct on" eliminated duplicate entries.  [This query](https://github.com/laurlen2112/Pewlett-Hackard-Analysis/blob/main/resources/del_2_code.png) returns employee number, name, birth date, "to" and "from" date, and title.  

<img src ="https://github.com/laurlen2112/Pewlett-Hackard-Analysis/blob/main/resources/bullet%204.png" width = "900" height ="200"/>


# Summary:

Based on this analysis, 72,458 employees will likely retire leaving vacancies in those roles.  Since there are 1549 employees that qualify for the mentorship program, the data also confirms that there are enough retirement-ready employees to mentor employees eligible for the mentorship program.

The current pool of mentorship-eligible employees is small because they were chosen based on the birth year of 1965.  By contrast, the pool of retirement-ready employees was filtered by birth year over a 3 year span, 1952 to 1955, resulting in a much larger number of retirement-ready employees.  Therefore, it is suggested that PH enlarge the pool of mentorship-eligible employees by expanding the birth year filter in subsequent queries. 

Additionally, it should create a table similar to the "Retiring Titles" table that contains the count of mentorship-eligible employees [grouped by title](https://github.com/laurlen2112/Pewlett-Hackard-Analysis/blob/main/resources/suggested_code.png).  The resulting [table](https://github.com/laurlen2112/Pewlett-Hackard-Analysis/blob/main/resources/mentor_vs_retire.png) will enable PH to easily compare the mentorship-eligible employees on a per title basis with the retiring employees on a per title basis.

<img src ="https://github.com/laurlen2112/Pewlett-Hackard-Analysis/blob/main/resources/paragraph%203.png"/>
 
Finally, PH should also drill down on the data provided in the "Retiring Titles" CSV.  For example, it could [run an additional query](https://github.com/laurlen2112/Pewlett-Hackard-Analysis/blob/main/resources/Screen%20Shot%202022-05-25%20at%201.06.01%20PM.png) to show forecasted retirements on a per title, per department basis.  This query will [provide information](https://github.com/laurlen2112/Pewlett-Hackard-Analysis/blob/main/resources/drill_count.png) as to whether there is an even distribution of anticipated retirements among departments because it will show the count of retiring titles on a per department basis. This query will provide PH a sense as to which departments may need more resources in the future.

<img src ="https://github.com/laurlen2112/Pewlett-Hackard-Analysis/blob/main/resources/paragraph%204.png" width = "900" height ="700"/>
