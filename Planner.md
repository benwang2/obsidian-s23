<center> <h1>Rutgers University - Planner</h1> </center>


# Semester Overview

## Enrolled courses
- `01:198:314` - [Principles of Programming Languages](https://courses.cs.rutgers.edu/courses/314/classes/spring_2023_kremer/)
- `01:198:142` - [Data 101](https://dev7796.github.io/data101_tutorial/)
- `01:198:461` - [Machine Learning Principles](./MachineLearning461/Syllabus)
- `01:960:463` - [Regression Methods](./Regression463/Syllabus.pdf)

# Tasks
## Recent work
```dataview
TABLE course as Course, dateformat(file.mtime, "cccc, h:mm a, MMM dd") AS "Last modified"
FROM #lectureNotes
WHERE course != "CS_XXX"
SORT file.mtime DESC
LIMIT 5
```


# Schedule
### Assignments
```dataview
TABLE WITHOUT ID
	file.link as File, course as Course, dateformat(due,"cccc, MMM dd") as "Due date"
FROM #Assignments 
WHERE date(due)+dur(1 day) > date(now)
SORT due ASC
LIMIT 4
```




### Relevant Dates
```dataview
TABLE WITHOUT ID
	course as Course, truncate(title,30) as Title, dateformat(due, "ccc, MMM dd") as Date
FROM csv("Tables/relevant_dates.csv")
WHERE date(now)-dur(1 day) < date(due)
SORT due ASC
LIMIT 10
```

