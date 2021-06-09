-- Implement and test a PL/SQL function involving cursor to display the employee_id of the 
-- employee that processed a particular service request and also display the date of request
-- and the status of that request
CREATE OR REPLACE FUNCTION find_emp_details(id char)
    RETURN char IS employee_id Request.emp_id%type;
    CURSOR emp IS SELECT emp_id, date_of_request, status FROM Request
        WHERE req_id = id;
    em emp%rowtype;

    BEGIN
        OPEN emp;
	    FETCH emp INTO em;
	    dbms_output.put_line('Employee Id : ' || em.emp_id);
        dbms_output.put_line('Date of Request :' || em.date_of_request);
        dbms_output.put_line('Status : ' || em.status);
        CLOSE emp;
        RETURN employee_id;
    END;

DECLARE
    e char(5);
BEGIN
    e := find_emp_details('RQ097');
END; 


-- Implement and test a PL/SQL function involving cursor to display the aadhar number linked 
-- to a particular mobile number along with the id of the customer using the mobile 
-- number and the id of the plan currently in use.
CREATE OR REPLACE FUNCTION find_cus_details(mobile)
    RETURN char(12) IS aadhar Sim_card.aadhar_linked%type;
    CURSOR cus_details IS SELECT aadhar_linked, cus_id, plan_id FROM Sim_card WHERE mobile_no = mobile;
    cu cus_details%rowtype;

    BEGIN
        OPEN cus_details;
	    FETCH cus_details INTO cu;
	    dbms_output.put_line('Aadhar number : ' || cu.aadhar_linked);
        dbms_output.put_line('Customer Id : ' || cu.cus_id);
        dbms_output.put_line('Plan Id : ' || cu.plan_id);
        CLOSE cus_details;
        RETURN aadhar;
    END;

DECLARE
    a char(12);
BEGIN
    a := find_cus_details('8688855380');
END;