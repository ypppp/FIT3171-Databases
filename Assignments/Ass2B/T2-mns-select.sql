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
    service_code, service_desc, '$' || service_stdfee
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


/*2(e)*/
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer



/*2(f)*/
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer



/*2(g)*/
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer
