# SAMS Design Document
By Calista Yeo

Video overview: https://youtu.be/__bbyzAuwBQ?si=l6Y9C5sx8FV3bsiy

## Scope
This database serves the purpose of Student Attendance Management System(SAMS) in a university. The courses and classes are designed specifically for Bachelor degree. As such, included in the scope is:
- Departments, including name
- Lecturers, including name, birthdate, email, highest degree earned, job title, hire date, and department reference
- Courses, including title, credits, prerequisites(if present), semester, department reference
- Students, including name, birthdate, enrollment year, and department reference
- Course Selections, including student reference, the on-going semester and academic year when the student take courses, and course references
- Classes, including course reference, lecturer reference, academic year, meeting day, class start time, class end time, meeting location, and capacity of the class
- Attendances, including class reference, student reference, and the status('absent', 'sick', 'permit', 'attend') of said student on each week

Out of scope are elements like admissions, student activities, and other non-core attributes

## Functional Requirements
- A student may take another department's course
- A student may take 3-5 courses per semester, with the value of 3 or 4 credits per course
- In meetings (classes), students can have their attendance status marked as 'present,' 'permit,' 'sick,' or 'absent'
- Students may select courses from the previous or following semester based on course prerequisites
- Lecturers could read, update, and delete the status column on attendance table

## Representation
Entities are captured in SQLITE3 tables with the following schema.

### Entities
#### departments:
- id, specifies the primary key with `INTEGER` data type.
- name, specifies the name of department with `TEXT` data type. The `NOT NULL` constraint ensures each department has a name.

#### lecturers:
- id, specifies the primary key with `INTEGER` data type.
- department_id, this column stores the ID of the department the lecturer belongs to. This column references the `id` primary key of the `departments` table using a `FOREIGN KEY` constraint.
- name, specifies a lecturer's full name along with their degree. This column has `TEXT` data type which ensures it can store first, middle, last name and degrees, also the `NOT NULL` constraint ensures the column always filled.
- birthdate, specifies a lecturer's date of birth with `date` data type. This column has `NOT NULL` constraint.
- email, which stores the lecturer's email address. The `TEXT` data type allows for email addresses of varying lengths. The `NOT NULL` constraint ensures an email address is provided for each lecturer.
- highest_degree, which stores the lecturer's highest academic degree (e.g., PhD, Master's). The `TEXT` data type allows for various degree titles. The `NOT NULL` constraint ensures a degree is specified for each lecturer.
- job_title, which specifies the lecturer's job title using a `TEXT` data type. The `CHECK` constraint restricts the inserted data only to the specified valued. The `NOT NULL` constraint ensures a job title is selected for each lecturer.
- hire_date, this column stores the lecturer's hire date. The `DATE` data type ensures the data format is appropriate for storing dates. The `NOT NULL` constraint ensures a hire date is provided for each lecturer.

#### courses:
- id, specifies the primary key with `INTEGER` data type.
- title, specifies the course's title with `TEXT` data type. The `NOT NULL` constraint ensures the title won't be left out.
- credits, which stores the credit value of a course. This column has `INTEGER` data type and `NOT NULL` constraint that ensures credit is provided.
- prerequisites, which stores the prerequisite of usually a subsquent or advanced course. This column has `TEXT` data type and `NOT NULL` constraint so the column always contains a value. This column has the default value of `-` or the equivalent of null.
- semester, which stores the basis semester for the course. The datatype is `TEXT` that has the `CHECK` constraint to make sure the value is restricted. This column has the `NOT NULL` constraint which ensures semester is provided for each course.
- department_id, this column stores the ID of department the course belongs to. This column references the `id` primary key of the `departments` table using a `FOREIGN KEY` constraint.

#### students:
- id, specifies the primary key with `INTEGER` data type.
- department_id, this column stores the ID of department the student belongs to. This column references the `id` primary key of the `departments` table using a `FOREIGN KEY` constraint.
- name, specifies a student's full name. This column has `TEXT` data type which ensures it can store first, middle, last name and degrees, also the `NOT NULL` constraint ensures the column always filled.
- birthdate, specifies a student's date of birth with `DATE` data type. This column has `NOT NULL` constraint.
- enrollment_year, this column has `TEXT` data type that ensures it can store when the year a student enrolled. This column has `NOT NULL` constraint.

#### course_selections:
- id, specifies the primary key with `INTEGER` data type.
- student_id, this column stores the ID of student that selects the courses. This column references the `id` primary key of the `students` table using a `FOREIGN KEY` constraint.
- semester, which stores what semester were the courses taken by the student. The datatype is `TEXT` with `CHECK` constraint that may only accept the value of 1 to 9. This column has the `NOT NULL` constraint which ensures semester is provided when selecting courses.
- academic_year, which stores the year/term when courses were taken by the student. The datatype is `TEXT` and has `NOT NULL` constraint which ensures academic year is provided.
- course_1, this column references the `id` primary key of `courses` table using a `FOREIGN KEY` constraint.
- course_2, this column references the `id` primary key of `courses` table using a `FOREIGN KEY` constraint.
- course_3, this column references the `id` primary key of `courses` table using a `FOREIGN KEY` constraint.
- course_4, this column references the `id` primary key of `courses` table using a `FOREIGN KEY` constraint.
- course_5, this column references the `id` primary key of `courses` table using a `FOREIGN KEY` constraint.

#### classes:
- id, specifies the primary key with `INTEGER` data type.
- course_id, this column references the `id` primary key of `courses` table using a `FOREIGN KEY` constraint.
- lecturer_id, this column references the `id` primary key of `lecturers` table using a `FOREIGN KEY` constraint.
- academic_year, which stores the year/term when courses were taken by the student. The datatype is `TEXT` and has `NOT NULL` constraint which ensures academic year is provided.
- meeting_day, which stores the day the class was held. The datatype is `TEXT` with `CHECK` constraint that may only accept values within the range of days in a week. The column has `NOT NULL` constraint which ensures the day is always known.
- start_time, which stores the time when the class starts. The datatype is `TEXT` which makes updating or adding data flexible, this column also `NOT NULL` constraint.
- end_time, which stores the time when the class ends. The datatype is `TEXT` which makes updating or adding data flexible, this column also `NOT NULL` constraint.
- meeting_location, which stores the room/location the class taken place. This column has `TEXT` datatype and `NOT NULL` constraint.
- capacity, which specifies the maximum  enrollment, which is the number of students it can accommodate. This column has `INTEGER` datatype and `NOT NULL` constraint.

#### attendances:
- id, specifies the primary key with `INTEGER` data type.
- class_id, this column stores the ID of specific class for which attendance is recorded. This column references the `id` primary key of the `classes` table using a `FOREIGN KEY` constraint.
- student_id, this column stores the ID of student that selects the courses. This column references the `id` primary key of the `students` table using a `FOREIGN KEY` constraint.
- week_n, this column stores the status of the student in week_n. This column has TEXT datatype, and `CHECK` constraint that accepts value of either absent, sick, permit, or attend.

### Relationships
![ERD of SAMS](/attend.drawio.png)
Descriptions:
- A department may offer many courses, but it must offer at least one.
- A department may have many lecturers, but it must have at least one.
- A lecturer may teach several classes, but they must teach at least one class.
- A course may have several classes, but it must have at least one.
- A course may be taken by many students, but it must be taken by at least one student.
- A class may have many students, but it must at least have one.
- A class may record several attendances.
- A student may have many attendances throughout a 14-week class.

## Optimizations
### views:
- "student_course_details". This view defines the necessary details, which includes the student's name, the semester and academic year the courses are taken, and the courses themselves."
- "class_details". This view include information about the course title, the lecturer teaching the class, the academic year it starts, the start and end times, the location and day of the class, and the capacity.
- "attendance_details". This view offers information such as individual student names, their course titles, and their attendance record for each week.

## Limitations
- The database contains only the necesarry tables or views for managing university students' attendances. Functionality for other purposes might not be supported.
