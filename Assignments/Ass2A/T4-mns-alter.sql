--*****PLEASE ENTER YOUR DETAILS BELOW*****
--T4-mns-alter.sql

--Student ID: Yee Perng Yew
--Student Name: 32205481
--Unit Code: FIT3171
--Applied Class No: 02

/* Comments for your marker:




*/

--4(a)

SELECT
patient_no,
COUNT(*) AS number_of_appointments
FROM
appointment
GROUP BY
patient_no
ORDER BY
patient_no;


--4(b)


--4(c)

