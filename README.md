# Module 7: Pewlett-Hackard Analysis

# Purpose and Overview:
In an effort to "future-proof" their company, Pewlett-Hackard (PH), is scrutinizing their records to determine which employees will likely retire based on age and which employees are eligible for a mentorship program.  This analysis was completed using PostgreSQL as a database and PG Admin as the user interface.

# Results: 

* The "Retirement Titles" CSV projects that 133,777 employees are due to retire.  This query returns the employee number, the employee's first and last name, the employee's title, and the employee's "to" and "from" dates.  The employees were filtered [based on birth date](https://github.com/laurlen2112/Pewlett-Hackard-Analysis/blob/main/resources/del_1_retirement_code.png).  This query over-projects the number of retiring employees because it captures employees with their previous and current job titles so there are duplicate entries.  By way of example, employee number 10004 is listed on [rows 2 and 3 of this CSV](https://github.com/laurlen2112/Pewlett-Hackard-Analysis/blob/main/resources/retirement_titles_CSV.png).

* The "Unique Titles" CSV demonstrates that over 72,000 employees are projected to retire.  The CSV contains employee number, name, and title.  This query uses the ["distinct on"](https://github.com/laurlen2112/Pewlett-Hackard-Analysis/blob/main/resources/del_%201_unique_titles_code.png) ability of Postgres to filter out duplicate entries described above.  For example, [here](https://github.com/laurlen2112/Pewlett-Hackard-Analysis/blob/main/resources/unique_titles_csv.png), employee number 10004 is only visible on row 2 of this csv.

* The ["Retiring Titles" CSV](https://github.com/laurlen2112/Pewlett-Hackard-Analysis/blob/main/resources/retiring%20titles.png) shows projected retirements [grouped by](https://github.com/laurlen2112/Pewlett-Hackard-Analysis/blob/main/resources/del_1_count_code.png) job title and counts the expected retirements per position.  Based on this information, the Senior Engineer and the Senior Staff positions will realize the most vacancies because it is projected that each position may see about 24,000 employees retire.

* The ["Mentorship Eligibility" CSV](https://github.com/laurlen2112/Pewlett-Hackard-Analysis/blob/main/resources/mentorship_elig.png) shows over that 1500 employees are eligible for the mentorship program.  Employees were filtered based on birth year and "distinct on" elimiated duplicate entries.  [This query](https://github.com/laurlen2112/Pewlett-Hackard-Analysis/blob/main/resources/del_2_code.png) returns the employee's number, first and last name, birth date, "to" and "from" date, and title.  


# Summary:

Based on this analysis, the information shows that the number of projected retirements is 72,000 employees. The data also shows that there are enough retirement-ready employees to mentor the mentor-eligible employees because there are only 1550 employees that qualify for the mentorship program.

The current pool of mentorship-eligible employees is small because they were chosen based on the birth year of 1965.  By contrast, the pool of retirement-ready employees was filtered by birth year from 1952 to 1955.  Since the retire-ready employees are filtered based on a 3 year span, it makes sense that their number would be greater than the mentorship eligible employees.  Therefore, it is suggested that PH enlarge the pool of employees eligible for the mentorship program by expanding the birth year filter in additional queries. Additionally, it should create a table similar to the Retiring Titles table, that shows the count of possible mentorship employees grouped by title.  This will provide a good comparison point to get a sense of how many employees are due to retire with employees eligible for the mentorship program. 

PH should also drill down on the data provided in the Retiring Titles CSV, which shows a large amount of Senior Engineers and Senior Staff due to retire. For example, it could run additional queries to show which departments these employees work within.  This will show if there is an even distribution of projected retirements among departments or if one or more departments may have a larger retirement pool, which means that department would need additional resources to replace retirements.  
