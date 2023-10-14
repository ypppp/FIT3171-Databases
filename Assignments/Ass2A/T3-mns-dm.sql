--*****PLEASE ENTER YOUR DETAILS BELOW*****
--T3-mns-dm.sql

--Student ID: Yee Perng Yew
--Student Name: 32205481
--Unit Code: FIT3171
--Applied Class No: 02

/* Comments for your marker:




*/


--3(a)

DROP SEQUENCE emergency_contact_seq;

CREATE SEQUENCE emergency_contact_seq START WITH 100 INCREMENT BY 5;

DROP SEQUENCE patient_seq;

CREATE SEQUENCE patient_seq START WITH 100 INCREMENT BY 5;

DROP SEQUENCE appointment_seq;

CREATE SEQUENCE appointment_seq START WITH 100 INCREMENT BY 5;

--3(b)

    INSERT INTO emergency_contact VALUES (
        0001,
        'Jonathan',
        'Robey',
        '0412523122'
);

INSERT INTO patient VALUES (
    1001,
    'Laura',
    'Robey',
    '45 Chester St',
    'Melbourne',
    'VIC',
    '3166',
    TO_DATE('23-Sep-2010', 'dd-Mon-yyyy'),
    '0395683868',
    'Laurarobey@gmail.com',
    0001
);

INSERT INTO patient VALUES (
    1002,
    'Lachlan',
    'Robey',
    '45 Chester St',
    'Melbourne',
    'VIC',
    '3166',
    TO_DATE('23-Nov-2012', 'dd-Mon-yyyy'),
    '0397648564',
    'Lachlanrobey@gmail.com',
    0001
);

Insert into appointment values (
    1000001,
    TO_DATE('04-Sep-2023 15:30', 'dd-Mon-yyyy hh24:mi'),
    02,
    'S',
    1001,
    'GEN001',
    006,
    NULL  
);

Insert into appointment values (
    1000002,
    TO_DATE('04-Sep-2023 16:00', 'dd-Mon-yyyy hh24:mi'),
    02,
    'S',
    1002,
    'GEN001',
    006,
    NULL  
);

--3(c)

Insert into appointment values (
    1000003,
    TO_DATE('14-Sep-2023 16:00', 'dd-Mon-yyyy hh24:mi'),
    02,
    'S',
    1002,
    'GEN001',
    014,
    1000002 
);



--3(d)

UPDATE appointment
SET
    appt_datetime = TO_DATE('18-Sep-2023 16:00', 'dd-Mon-yyyy hh24:mi')
WHERE
    appt_no = 1000003;
    
--3(e)

