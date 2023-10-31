--*****PLEASE ENTER YOUR DETAILS BELOW*****
--T2-mns-select.sql

--Student ID: 32205481
--Student Name: Yee Perng Yew
--Unit Code: FIT3171
--Applied Class No: 02

/* Comments for your marker:




*/

/*2(a)*/
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer

SELECT
    *
FROM
    mns.item
WHERE item_stock >= 50
AND item_desc LIKE '%composite%'
order by item_stock DESC;





/*2(b)*/
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer

SELECT
    p.provider_code,
    p.provider_title
    || '. '
    || p.provider_fname
    || ' '
    || p.provider_lname AS provider_name
FROM
         mns.provider p
    JOIN mns.specialisation s
    ON p.spec_id = s.spec_id
WHERE
    s.spec_name = 'Paediatric dentistry'
ORDER BY
    p.provider_lname,
    p.provider_fname,
    p.provider_code;



/*2(c)*/
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer

SELECT
    service_code,
    service_desc,
    lpad(to_char(service_stdfee, '$9999.99'),
         14,
         ' ') AS service_stdfee
FROM
    mns.service
WHERE
    service_stdfee > (
        SELECT
            AVG(service_stdfee)
        FROM
            mns.service
    )
ORDER BY
    service_stdfee DESC,
    service_code;



/*2(d)*/
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer

SELECT
    a.appt_no,
    a.appt_datetime,
    p.patient_no,
    p.patient_fname
    || ' '
    || p.patient_lname AS patient_name,
    lpad(to_char((s.apptserv_fee + s.apptserv_itemcost), '$9999.99'),
         22,
         ' ')          AS appointment_total_cost
FROM
         mns.appointment a
    JOIN mns.patient   p
    ON a.patient_no = p.patient_no
    JOIN mns.appt_serv s
    ON a.appt_no = s.appt_no
GROUP BY
    a.appt_no,
    a.appt_datetime,
    p.patient_no,
    p.patient_fname,
    p.patient_lname,
    s.apptserv_fee,
    s.apptserv_itemcost
HAVING
    MAX(s.apptserv_fee + s.apptserv_itemcost) = (
        SELECT
            MAX(SUM(s.apptserv_fee) + SUM(s.apptserv_itemcost))
        FROM
                 mns.appointment a
            JOIN mns.appt_serv s
            ON a.appt_no = s.appt_no
        GROUP BY
            s.apptserv_fee,
            s.apptserv_itemcost
    )
ORDER BY
    a.appt_no;


/*2(e)*/
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer

SELECT
    s.service_code,
    s.service_desc,
    s.service_stdfee,
    round((AVG(v.apptserv_fee) - s.service_stdfee),
          2) AS service_fee_deferential
FROM
         mns.service s
    JOIN mns.appt_serv v
    ON s.service_code = v.service_code
GROUP BY
    s.service_code,
    s.service_desc,
    s.service_stdfee
ORDER BY
    s.service_code;



/*2(f)*/
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer

SELECT
p.patient_no,
    p.patient_fname
    || ' '
    || p.patient_lname AS patient_name,
    ( 2023 - extract(year from p.patient_dob)) AS current_age,
    ( COUNT(a.patient_no)) AS NUMAPPTS,
    lpad(round((((count(a.patient_no) - 1)/
    COUNT(a.patient_no)) * 100), 1), 10) || '%' AS followups
    
FROM
         mns.appointment a
    JOIN mns.patient   p
    ON a.patient_no = p.patient_no
Group by
p.patient_no, p.patient_fname, p.patient_lname, p.patient_dob
order by
p.patient_no;



/*2(g)*/
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer

SELECT
    p.provider_code,
    lpad(nvl(to_char(count(p.provider_code)), '-'),13) as numberappts,
    lpad(nvl(to_char(nullif(nvl((sum(s.apptserv_fee)),0) + nvl((sum(s.apptserv_itemcost)),0), 0)), '-'),10) as Totalfees
FROM
    mns.provider p
    left outer Join mns.appointment a
    on p.provider_code = a.provider_code
    left outer join mns.appt_serv s
    on a.appt_no = s.appt_no
group by
    p.provider_code
order by
p.provider_code;

--SELECT
--    p.provider_code,
--    count(p.provider_code) as numberappts
----   lpad('$' ||(sum(s.apptserv_fee) + nvl(sum(s.apptserv_itemcost), 0)), 10)
----   as Totalfees
--FROM
--         mns.appointment a
--    left outer JOIN mns.provider   p
--    ON a.provider_code = p.provider_code
--    left outer JOIN mns.appt_serv s
--    ON a.appt_no = s.appt_no
--Group by
--p.provider_code
--order by
--p.provider_code;
