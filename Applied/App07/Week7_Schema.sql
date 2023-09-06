/*
Databases Week 7 Applied Class
week7_schema.sql

Author: Yee Perng Yew

*/

/* 7.2*/
/* DDL for Student-Unit-Enrolment model (using ALTER TABLE)*/
/**/

/**/
/* Place DROP commands at head of schema file*/
/**/



/* Create Tables*/
/* Here using both table and column constraints*/
/**/

CREATE TABLE student (
    stu_nbr   NUMBER(8) NOT NULL,
    stu_lname VARCHAR2(50) NOT NULL,
    stu_fname VARCHAR2(50) NOT NULL,
    stu_dob   DATE NOT NULL
);

COMMENT ON COLUMN student.stu_nbr IS
    'Student number';

COMMENT ON COLUMN student.stu_lname IS
    'Student last name';

COMMENT ON COLUMN student.stu_fname IS
    'Student first name';

COMMENT ON COLUMN student.stu_dob IS
    'Student date of birth';

/* Add STUDENT constraints here */

ALTER TABLE student ADD CONSTRAINT student_pk PRIMARY KEY ( stu_nbr );

ALTER TABLE student ADD CONSTRAINT chk_stu_nbr CHECK ( stu_nbr > 10000000 );

/* Add UNIT data types here */
CREATE TABLE unit (
    unit_code,
    unit_name
);

COMMENT ON COLUMN unit.unit_code IS
    'Unit code';

COMMENT ON COLUMN unit.unit_name IS
    'Unit name';

/* Add UNIT constraints here */

ALTER TABLE unit ADD CONSTRAINT unit_pk PRIMARY KEY ( unit_code );

ALTER TABLE unit ADD CONSTRAINT unique_unitname UNIQUE ( unit_name );

/* Add ENROLMENT attributes and data types here */
CREATE TABLE enrolment (
    stu_nbr        NUMBER(8) NOT NULL,
    unit_code      CHAR(7) NOT NULL,
    enrol_year     NUMBER(4) NOT NULL,
    enrol_semester CHAR(1) NOT NULL,
    enrol_mark     NUMBER(3),
    enrol_grade    CHAR(2)
);

COMMENT ON COLUMN enrolment.stu_nbr IS
    'Student number';

COMMENT ON COLUMN enrolment.unit_code IS
    'Unit code';

COMMENT ON COLUMN enrolment.enrol_year IS
    'Enrolment year';

COMMENT ON COLUMN enrolment.enrol_semester IS
    'Enrolment semester';

COMMENT ON COLUMN enrolment.enrol_mark IS
    'Enrolment mark (real)';

COMMENT ON COLUMN enrolment.enrol_grade IS
    'Enrolment grade (letter)';

/* Add ENROLMENT constraints here */

ALTER TABLE enrolment
    ADD CONSTRAINT enrolment_pk PRIMARY KEY ( stu_nbr,
                                              unit_code,
                                              enrol_year,
                                              enrol_semester );

ALTER TABLE enrolment
    ADD CONSTRAINT enrolment_student_fk FOREIGN KEY ( stu_nbr )
        REFERENCES student ( stu_nbr );

ALTER TABLE enrolment
    ADD CONSTRAINT enrolment_unit_fk FOREIGN KEY ( unit_code )
        REFERENCES unit ( unit_code );

ALTER TABLE enrolment
    ADD CONSTRAINT chk_enrol_semester CHECK ( enrolment_semester IN ( '1', '2', '3' )
    );