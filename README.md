# Module 7: Pewlett-Hackard Analysis

# Purpose and Overview:
In an effort to "future-proof" their company, Pewlett-Hackard(PH) is scrutinizing their records to determine which employees will likely retire soon based on age and which employees are eligible for a mentorship program.  This analysis was completed through the use of PostgreSQL as a database and PG Admin as the user interface.

# Results: 

* The "retirment titles" csv projects 133,777 employees as due to retire.  This query returns the employee number, the employee's first and last name, the employee's title, and the employee's "to" and "from" dates.  The employees were filtered [based on birth date](https://github.com/laurlen2112/Pewlett-Hackard-Analysis/blob/main/resources/del_1_retirement_code.png).  As dicussed in the next bullet, this CSV over-projects the number of reitirng employees because it captures the employees and their previous titles as well as their current titles.  For example, the second employee, employee number 10004 is listed on [rows 2 and 3 of this CSV](https://github.com/laurlen2112/Pewlett-Hackard-Analysis/blob/main/resources/retirement_titles_CSV.png).

* The "unique titles" CSV demostrates that over 72,000 employees are projected to retire and list the employee's number, name, and title.  This query uses the ["Distinct On"](https://github.com/laurlen2112/Pewlett-Hackard-Analysis/blob/main/resources/del_%201_unique_titles_code.png) ability of Postgres to filter out duplicate entries of employees that have changed titles during their duration with the company.  [Here](https://github.com/laurlen2112/Pewlett-Hackard-Analysis/blob/main/resources/unique_titles_csv.png), employee number 10004 is only visible on row 2 of this csv.

* The ["retiring titles" CSV](https://github.com/laurlen2112/Pewlett-Hackard-Analysis/blob/main/resources/retiring%20titles%20csv.png) shows that over 50,000 employees will be retiring in the near future.  The projected retirements are [grouped by](https://github.com/laurlen2112/Pewlett-Hackard-Analysis/blob/main/resources/del_1_count_code.png) job title with the amount of each project retirement per title.  The Senior Engineer and Senior Staff positions will have many upcoming vacancies since the CSV projects that each position have an estimated 24,000 retiring employees.

* The ["mentorship eligibility" CSV](https://github.com/laurlen2112/Pewlett-Hackard-Analysis/blob/main/resources/mentorship_elig.png) show over 1500 employees are eligible for the mentorship program.  [The query](https://github.com/laurlen2112/Pewlett-Hackard-Analysis/blob/main/resources/del_2_code.png) returns the employee's number, first and last name, birth date, "to" and "from" date, and title.  These employees were born during 1965 .... make a conclusion and show code.


# Summary:

address 2 questions and purpose 2 additional queries
