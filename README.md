# Module 7: Pewlett-Hackard Analysis

# Purpose and Overview:
In an effort to "future-proof" their company, Pewlett-Hackard (PH), is scrutinizing their records to determine which employees will likely retire based on age and which employees are eligible for a mentorship program.  This analysis was completed using PostgreSQL as a database and PG Admin as the user interface.

# Results: 

* The "Retirment Titles" CSV projects that 133,777 employees are due to retire.  This query returns the employee number, the employee's first and last name, the employee's title, and the employee's "to" and "from" dates.  The employees were filtered [based on birth date](https://github.com/laurlen2112/Pewlett-Hackard-Analysis/blob/main/resources/del_1_retirement_code.png).  As dicussed in the next bullet, this CSV over-projects the number of reitirng employees because it captures the employees with previous titles as well as their current titles so there are duplicate entries.  For example, the second employee, employee number 10004 is listed on [rows 2 and 3 of this CSV](https://github.com/laurlen2112/Pewlett-Hackard-Analysis/blob/main/resources/retirement_titles_CSV.png).

* The "Unique Titles" CSV demostrates that over 72,000 employees are projected to retire.  The CSV lists the employee's number, name, and title.  This query uses the ["Distinct On"](https://github.com/laurlen2112/Pewlett-Hackard-Analysis/blob/main/resources/del_%201_unique_titles_code.png) ability of Postgres to filter out duplicate entries decribed above.  For example, [here](https://github.com/laurlen2112/Pewlett-Hackard-Analysis/blob/main/resources/unique_titles_csv.png), employee number 10004 is only visible on row 2 of this csv.

* The ["Retiring Titles" CSV](https://github.com/laurlen2112/Pewlett-Hackard-Analysis/blob/main/resources/retiring%20titles%20csv.png) shows projected retirements [grouped by](https://github.com/laurlen2112/Pewlett-Hackard-Analysis/blob/main/resources/del_1_count_code.png) job title and the expected retirments per position.  The Senior Engineer and the Senior Staff positions will the most vacancies since the CSV projects that each position type will have an estimated 24,000 retiring employees.

* The ["Mentorship Eligibility" CSV](https://github.com/laurlen2112/Pewlett-Hackard-Analysis/blob/main/resources/mentorship_elig.png) shows over 1500 employees are eligible for the mentorship program.  Employees were filtered based on birth date and job title.  [This query](https://github.com/laurlen2112/Pewlett-Hackard-Analysis/blob/main/resources/del_2_code.png) returns the employee's number, first and last name, birth date, "to" and "from" date, and title.  


# Summary:

address 2 questions and purpose 2 additional queries

As a long term strategy, P
