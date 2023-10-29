--*****PLEASE ENTER YOUR DETAILS BELOW*****
--T3-mns-json.sql

--Student ID: 32205481
--Student Name: Yee Perng Yew
--Unit Code: FIT3171
--Applied Class No: 02

/* Comments for your marker:




*/

/*3(a)*/
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT TO GENERATE 
-- THE COLLECTION OF JSON DOCUMENTS HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer

SET PAGESIZE 100

SELECT
    JSON_OBJECT ( '_id' VALUE a.appt_no, 'datetime' VALUE to_char(a.appt_datetime, 'DD/MM/YY HH24:MI' ),
                'provider_code' VALUE p.provider_code, 'provider_name' VALUE
                p.provider_title
                || '. '
                || p.provider_fname
                || ' '
                || p.provider_lname, 'item_totalcost' Value v.apptserv_itemcost,
                'no_of_items' value sum(m.as_item_quantity),
                'items' VALUE JSON_OBJECT (
                                'id' VALUE i.item_id,
                                'desc' VALUE i.item_desc,
                                'standardcost' VALUE i.item_stdcost,
                                'quantity' value m.as_item_quantity)
    FORMAT JSON )
    || ','
FROM
    mns.appointment a
    JOIN mns.provider p on a.provider_code = p.provider_code
    JOIN mns.appt_serv v on a.appt_no = v.appt_no
    join mns.apptservice_item m on v.appt_no = m.appt_no
    join mns.item i on m.item_id = i.item_id
GROUP BY
    a.appt_no, a.appt_datetime, p.provider_code, p.provider_title, p.provider_fname, p.provider_lname,
    v.apptserv_itemcost, m.as_item_quantity, i.item_id, i.item_desc, i.item_stdcost 
ORDER BY
    a.appt_no;

