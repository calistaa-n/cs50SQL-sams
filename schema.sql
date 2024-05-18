CREATE TABLE "departments" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE "lecturers" (
    "id" INTEGER,
    "department_id" INTEGER,
    "name" TEXT NOT NULL,
    "birthdate" DATE NOT NULL,
    "email" TEXT NOT NULL,
    "highest_degree" TEXT NOT NULL,
    "job_title" TEXT CHECK("job_title" IN ('Lecturer', 'Assistant Professor', 'Associate Professor', 'Professor', 'Department Head')) NOT NULL,
    "hire_date" DATE NOT NULL,
     PRIMARY KEY("id"),
     FOREIGN KEY ("department_id") REFERENCES "departments"("id")
);

CREATE TABLE "courses" (
    "id" INTEGER,
    "title" TEXT NOT NULL,
    "credits" INTEGER NOT NULL,
    "prerequisites" TEXT NOT NULL DEFAULT '-',
    "semester" TEXT CHECK("semester" IN ('1', '2', '3', '4','5','6','7','8','9')) NOT NULL,
    "department_id" INTEGER,
    PRIMARY KEY("id"),
    FOREIGN KEY ("department_id") REFERENCES "departments"("id")
);

CREATE TABLE "students" (
    "id" INTEGER,
    "department_id" INTEGER,
    "name" TEXT NOT NULL,
    "birthdate" DATE NOT NULL,
    "enrollment_year" TEXT NOT NULL,
    PRIMARY KEY("id"),
    FOREIGN KEY ("department_id") REFERENCES "departments"("id")
);

CREATE TABLE "course_selections" (
    "id" INTEGER,
    "student_id" INTEGER,
    "semester" TEXT CHECK("semester" IN ('1', '2', '3', '4','5','6','7','8','9')) NOT NULL,
    "academic_year" TEXT NOT NULL,
    "course_1" INTEGER,
    "course_2" INTEGER,
    "course_3" INTEGER,
    "course_4" INTEGER,
    "course_5" INTEGER,
    PRIMARY KEY("id"),
    FOREIGN KEY("student_id") REFERENCES "students"("id"),
    FOREIGN KEY("course_1") REFERENCES "courses"("id"),
    FOREIGN KEY("course_2") REFERENCES "courses"("id"),
    FOREIGN KEY("course_3") REFERENCES "courses"("id"),
    FOREIGN KEY("course_4") REFERENCES "courses"("id"),
    FOREIGN KEY("course_5") REFERENCES "courses"("id")
);

CREATE VIEW "student_course_details" AS
SELECT "students"."name", "cselect"."semester", "cselect"."academic_year", "c1"."title" AS "course 1", "c2"."title" AS "course 2", "c3"."title" AS "course 3", "c4"."title" AS "course 4", "c5"."title" AS "course 5" FROM "course_selections" AS "cselect"
JOIN "students" ON "students"."id" = "cselect"."student_id"
JOIN "courses" AS "c1" ON "c1"."id" = "cselect"."course_1"
JOIN "courses" AS "c2" ON "c2"."id" = "cselect"."course_2"
JOIN "courses" AS "c3" ON "c3"."id" = "cselect"."course_3"
JOIN "courses" AS "c4" ON "c4"."id" = "cselect"."course_4"
JOIN "courses" AS "c5" ON "c5"."id" = "cselect"."course_5";

CREATE TABLE "classes" (
    "id" INTEGER,
    "course_id" INTEGER,
    "lecturer_id" INTEGER,
    "academic_year" TEXT NOT NULL,
    "meeting_day" TEXT CHECK("meeting_day" IN ('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday')) NOT NULL,
    "start_time" TEXT NOT NULL,
    "end_time" TEXT NOT NULL,
    "meeting_location" TEXT NOT NULL,
    "capacity" INTEGER NOT NULL,
    PRIMARY KEY("id"),
    FOREIGN KEY ("course_id") REFERENCES courses("id"),
    FOREIGN KEY ("lecturer_id") REFERENCES lecturers("id")
);

CREATE VIEW "class_details" AS
SELECT
    courses.title AS course, lecturers.name AS lecturer, classes.academic_year, classes.meeting_day,
    classes.start_time AS start_time, classes.end_time AS end_time,
    classes.meeting_location, classes.capacity
FROM classes
JOIN courses ON courses.id = classes.course_id
JOIN lecturers ON lecturers.id = classes.lecturer_id;

CREATE TABLE "attendances" (
    "id" INTEGER,
    "class_id" INTEGER,
    "student_id" INTEGER,
    "week_1" TEXT CHECK("week_1" IN ('absent', 'sick', 'permit', 'attend')),
    "week_2" TEXT CHECK("week_2" IN ('absent', 'sick', 'permit', 'attend')),
    "week_3" TEXT CHECK("week_3" IN ('absent', 'sick', 'permit', 'attend')),
    "week_4" TEXT CHECK("week_4" IN ('absent', 'sick', 'permit', 'attend')),
    "week_5" TEXT CHECK("week_5" IN ('absent', 'sick', 'permit', 'attend')),
    "week_6" TEXT CHECK("week_6" IN ('absent', 'sick', 'permit', 'attend')),
    "week_7" TEXT CHECK("week_7" IN ('absent', 'sick', 'permit', 'attend')),
    "week_8" TEXT CHECK("week_8" IN ('absent', 'sick', 'permit', 'attend')),
    "week_9" TEXT CHECK("week_9" IN ('absent', 'sick', 'permit', 'attend')),
    "week_10" TEXT CHECK("week_10" IN ('absent', 'sick', 'permit', 'attend')),
    "week_11" TEXT CHECK("week_11" IN ('absent', 'sick', 'permit', 'attend')),
    "week_12" TEXT CHECK("week_12" IN ('absent', 'sick', 'permit', 'attend')),
    "week_13" TEXT CHECK("week_13" IN ('absent', 'sick', 'permit', 'attend')),
    "week_14" TEXT CHECK("week_14" IN ('absent', 'sick', 'permit', 'attend')),
    PRIMARY KEY("id"),
    FOREIGN KEY ("class_id") REFERENCES classes("id"),
    FOREIGN KEY ("student_id") REFERENCES students("id")
);

CREATE VIEW "attendance_details" AS
SELECT
    "courses"."title" AS course, "students"."name" AS student,
    A."week_1",  A."week_2",  A."week_3",  A."week_4",  A."week_5",
    A."week_6",  A."week_7",  A."week_8",  A."week_9",  A."week_10",
    A."week_11", A."week_12",  A."week_13",  A."week_14" FROM attendances AS A
JOIN students ON A.student_id = students.id
JOIN classes ON classes.id = A.class_id
JOIN courses ON courses.id = classes.course_id;

CREATE INDEX "week_index" ON "attendances"("week_1","week_2", "week_3", "week_4", "week_5", "week_6", "week_7", "week_8", "week_9", "week_10", "week_11", "week_12", "week_13", "week_14");


