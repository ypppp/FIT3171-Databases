--*****PLEASE ENTER YOUR DETAILS BELOW*****
--T2-mns-insert.sql

--Student ID: 32205481
--Student Name: Yee Perng Yew
--Unit Code: FIT3171
--Applied Class No: 02

/* Comments for your marker:




*/

--------------------------------------
--INSERT INTO emergency_contact
--------------------------------------

    INSERT INTO emergency_contact VALUES (
        0001,
        'John',
        'Smith',
        '0491570156'
);

    INSERT INTO emergency_contact VALUES (
        0002,
        'Hannson',
        'Lim',
        '0491570157'
);

    INSERT INTO emergency_contact VALUES (
        0003,
        'Dylan',
        'Chai',
        '0491570158'
);

    INSERT INTO emergency_contact VALUES (
        0004,
        'Victor',
        'Ang',
        '0491570159'
);

    INSERT INTO emergency_contact VALUES (
        0005,
        'Isabel',
        'Er',
        '0491570160'
);

    INSERT INTO emergency_contact VALUES (
        0006,
        'Audrey',
        'Chio',
        '0491570161'
);

    INSERT INTO emergency_contact VALUES (
        0007,
        'Claire',
        'Koh',
        '0491570162'
);

    INSERT INTO emergency_contact VALUES (
        0008,
        'Leonaka',
        'Choo',
        '0491570163'
);

--------------------------------------
--INSERT INTO patient
--------------------------------------

INSERT INTO patient VALUES (
    1001,
    'Zyta',
    'Smith',
    'Batesford Rd',
    'Melbourne',
    'VIC',
    '3148',
    TO_DATE('19-Jul-2010', 'dd-Mon-yyyy'),
    '0491570164',
    'Zytasmith@gmail.com',
    0001
);

INSERT INTO patient VALUES (
    1002,
    'Anna',
    'Smith',
    'Batesford Rd',
    'Melbourne',
    'VIC',
    '3148',
    TO_DATE('19-Jul-2010', 'dd-Mon-yyyy'),
    '0491570165',
    'Annasmith@gmail.com',
    0001
);

INSERT INTO patient VALUES (
    1003,
    'Joy',
    'Tee',
    '30-34 Station St',
    'Sydney',
    'NSW',
    '2233',
    TO_DATE('30-Dec-2004', 'dd-Mon-yyyy'),
    '0491570166',
    'Joytee@gmail.com',
    0003
);

INSERT INTO patient VALUES (
    1004,
    'Joshua',
    'Lim',
    '126 Ellenborough St',
    'Ipswich City',
    'QLD',
    '4305',
    TO_DATE('21-Dec-2009', 'dd-Mon-yyyy'),
    '0491570167',
    'Joshualim@gmail.com',
    0002
);

INSERT INTO patient VALUES (
    1005,
    'Jeanette',
    'Lim',
    '126 Ellenborough St',
    'Ipswich City',
    'QLD',
    '4305',
    TO_DATE('21-Dec-2009', 'dd-Mon-yyyy'),
    '0491570168',
    'Jeanettelim@gmail.com',
    0002
);

INSERT INTO patient VALUES (
    1006,
    'Vicum',
    'Ang',
    '160 OConnell St',
    'Adelaide',
    'SA',
    '5006',
    TO_DATE('10-Apr-2020', 'dd-Mon-yyyy'),
    '0882675069',
    'Vicumang@gmail.com',
    0004
);

INSERT INTO patient VALUES (
    1007,
    'Wayne',
    'Ng',
    '7/127 Charles St',
    'Launceston',
    'TAS',
    '7250',
    TO_DATE('25-May-2018', 'dd-Mon-yyyy'),
    '0363310984',
    'Wayneng@gmail.com',
    0005
);

INSERT INTO patient VALUES (
    1008,
    'Phenyo',
    'Chio',
    '393 Camberwell Rd',
    'Melbourne',
    'VIC',
    '3126',
    TO_DATE('14-Jan-2021', 'dd-Mon-yyyy'),
    '0390773763',
    'Phenyochio@gmail.com',
    0006
);

INSERT INTO patient VALUES (
    1009,
    'Kane',
    'Koh',
    '1062 Dandenong Rd',
    'Melbourne',
    'VIC',
    '3145',
    TO_DATE('13-Oct-2003', 'dd-Mon-yyyy'),
    '0395723155',
    'Kanekoh@gmail.com',
    0007
);

INSERT INTO patient VALUES (
    1010,
    'Sher',
    'Lee',
    '620 Victoria St',
    'Melbourne',
    'VIC',
    '3121',
    TO_DATE('25-Feb-2002', 'dd-Mon-yyyy'),
    '0394216006',
    'Sherlee@gmail.com',
    0008
);





        
        

--------------------------------------
--INSERT INTO appointment
--------------------------------------

Insert into appointment values (
    1000001,
    TO_DATE('01-May-2023 08:30', 'dd-Mon-yyyy hh24:mi'),
    01,
    'S',
    1001,
    'END001',
    001,
    NULL  
);

Insert into appointment values (
    1000002,
    TO_DATE('01-MAY-2023 08:30', 'dd-Mon-yyyy hh24:mi'),
    02,
    'L',
    1002,
    'GEN002',
    002,
    NULL  
);

Insert into appointment values (
    1000003,
    TO_DATE('01-MAY-2023 09:00', 'dd-Mon-yyyy hh24:mi'),
    01,
    'T',
    1003,
    'GEN003',
    001,
    NULL  
);

Insert into appointment values (
    1000004,
    TO_DATE('01-MAY-2023 10:00', 'dd-Mon-yyyy hh24:mi'),
    01,
    'S',
    1004,
    'GEN001',
    001,
    NULL  
);

Insert into appointment values (
    1000005,
    TO_DATE('01-MAY-2023 10:00', 'dd-Mon-yyyy hh24:mi'),
    02,
    'T',
    1005,
    'ORS001',
    002,
    NULL  
);

Insert into appointment values (
    1000006,
    TO_DATE('08-MAY-2023 08:45', 'dd-Mon-yyyy hh24:mi'),
    03,
    'T',
    1006,
    'END001',
    003,
    NULL  
);

Insert into appointment values (
    1000007,
    TO_DATE('08-MAY-2023 09:45', 'dd-Mon-yyyy hh24:mi'),
    03,
    'T',
    1007,
    'GEN002',
    003,
    NULL  
);

Insert into appointment values (
    1000008,
    TO_DATE('08-MAY-2023 09:45', 'dd-Mon-yyyy hh24:mi'),
    01,
    'S',
    1001,
    'END001',
    001,
    1000001  
);

Insert into appointment values (
    1000009,
    TO_DATE('08-MAY-2023 11:45', 'dd-Mon-yyyy hh24:mi'),
    04,
    'L',
    1008,
    'GEN002',
    004,
    NULL  
);

Insert into appointment values (
    1000010,
    TO_DATE('08-MAY-2023 12:15', 'dd-Mon-yyyy hh24:mi'),
    02,
    'T',
    1003,
    'GEN003',
    002,
    1000003
);

Insert into appointment values (
    1000011,
    TO_DATE('15-MAY-2023 10:00', 'dd-Mon-yyyy hh24:mi'),
    05,
    'S',
    1009,
    'GEN001',
    005,
    NULL
);

Insert into appointment values (
    1000012,
    TO_DATE('15-MAY-2023 13:15', 'dd-Mon-yyyy hh24:mi'),
    03,
    'L',
    1010,
    'ORS001',
    002,
    NULL
);

Insert into appointment values (
    1000013,
    TO_DATE('15-MAY-2023 14:15', 'dd-Mon-yyyy hh24:mi'),
    04,
    'L',
    1002,
    'GEN002',
    004,
    1000002
);

Insert into appointment values (
    1000014,
    TO_DATE('15-MAY-2023 14:15', 'dd-Mon-yyyy hh24:mi'),
    01,
    'S',
    1004,
    'GEN001',
    001,
    1000004
);

Insert into appointment values (
    1000015,
    TO_DATE('15-MAY-2023 14:45', 'dd-Mon-yyyy hh24:mi'),
    01,
    'L',
    1006,
    'END001',
    001,
    1000006
);

Insert into appointment values (
    1000016,
    TO_DATE('15-MAY-2023 16:30', 'dd-Mon-yyyy hh24:mi'),
    05,
    'T',
    1008,
    'GEN002',
    005,
    1000009
);






