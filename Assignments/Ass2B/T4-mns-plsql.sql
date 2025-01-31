--*****PLEASE ENTER YOUR DETAILS BELOW*****
--T4-mns-plsql.sql

--Student ID: 32205481
--Student Name: Yee Perng Yew
--Unit Code: FIT3171
--Applied Class No: 02

/* Comments for your marker:

*/

SET SERVEROUTPUT ON

--4(a) 
-- Complete the procedure below
CREATE OR REPLACE PROCEDURE prc_insert_appt_serv (
    p_appt_no      IN NUMBER,
    p_service_code IN CHAR,
    p_output       OUT VARCHAR2
) AS
var_appt_no_found NUMBER;
var_service_code_found NUMBER;
var_provider_code CHAR;
var_provider_found NUMBER;

BEGIN

    SELECT
        COUNT(*)
    INTO var_appt_no_found
    FROM
        appointment
    WHERE
        appt_no = p_appt_no;
        
    SELECT
        COUNT(*)
    INTO var_service_code_found
    FROM
        service
    WHERE
        service_code = p_service_code;
    
    SELECT
        provider_code
    INTO var_provider_code
    FROM
        provider_service
    WHERE
        service_code = p_service_code;
        
    IF ( var_appt_no_found = 0 ) THEN 
            p_output := 'Invalid appointment number, new appointment service cancelled';
        ELSE
            IF ( var_service_code_found = 0 ) THEN 
                p_output := 'Invalid service code, new appointment service cancelled';
            ELSE
            
                SELECT
                    COUNT(*)
                INTO var_provider_code
                FROM 
                    provider_service
                WHERE 
                    service_code = p_service_code;
                    
                IF ( var_provider_code = 0 ) THEN 
                    p_output := 'Provider is unable to provide the services, new appointment service cancelled';         
                ELSE
                    INSERT INTO appt_serv VALUES(
                        p_appt_no,
                        p_service_code,
                        null,
                        null
                    );
                    p_output := 'The new appointment service has been recorded';
                    
                    END IF;
                END IF;
            END IF;               
               
    
END prc_insert_appt_serv;
/

-- Write Test Harness for 4(a)

insert into appt_serv
      values (1,'EX03',null,null);
  
--before value
select *
from appt_serv
where appt_no = 1;

--execute the procedure 
DECLARE
    output VARCHAR2(200);
BEGIN
    --call the procedure - invalid service_code
    prc_insert_appt_serv(1,'LO05', output);
    dbms_output.put_line(output);
END;
/

--execute the procedure 
DECLARE
    output VARCHAR2(200);
BEGIN
    --call the procedure - success
    prc_insert_appt_serv(1,'EX03',output);
    dbms_output.put_line(output);
END;
/

--execute the procedure 
DECLARE
    output VARCHAR2(200);
BEGIN
    --call the procedure - fail, duplicate
    prc_insert_appt_serv(1,'EX03', output);
    dbms_output.put_line(output);
END;
/

--after value 
select * from appt_serv;

rollback;


--4(b) 
--Write your trigger statement, 
--finish it with a slash(/) followed by a blank line

CREATE OR REPLACE TRIGGER mainttain_item_stock
AFTER INSERT or DELETE or UPDATE ON APPTSERVICE_ITEM 
FOR EACH ROW
BEGIN
    if inserting then 
    update item i 
    set i.item_stock = : i.item_stock - as.item.quantity
     where upper(item_id) = upper(:old.item_id);

    dbms_output.put_line ('item stock has been updated');
    
    end if;
    
    
    if deleting then
    update item i
    set i.item_stock = i.item_stock + as.item.quantity
    where item_id = i.item_id;
    
    dbms_output.put_line ('item stock has been updated');
    
    end if;
    
    if updating then
    update item i
    set i.item_stock = i.item_stock - as.item.quantity
    where item_id = i.item_id;
    
    dbms_output.put_line ('item stock has been updated');
    
    end if;
  
  
end;
/

    
-- Write Test Harness for 4(b)


