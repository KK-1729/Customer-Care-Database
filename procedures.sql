-- Implement and test a PL/SQL procedure involving cursor to display the feedback rating and 
-- content of a particular service request.
CREATE OR REPLACE PROCEDURE feedback_details(id char) IS
    CURSOR feeds IS SELECT rating, content FROM Feedback WHERE req_id = id;
    f feeds%rowtype;

    BEGIN
        OPEN feeds;
        FETCH feeds INTO f;
        dbms_output.put_line('Rating : ' || f.rating);
        dbms_output.put_line('Content : ' || f.content);
        CLOSE feeds;
    END;

EXEC feedback_details('RQ290');


-- Implement and test a PL/SQL procedure involving a cursor to display the amount paid of 
-- different payments done by a customer based on his/her id.
CREATE OR REPLACE PROCEDURE get_payment_details(id varchar) IS
    CURSOR payment_detail IS SELECT amount, mode_of_payment FROM Payment, Customer
        WHERE payment.cus_id = customer.cus_id AND customer.cus_id = id;
    x payment_detail%rowtype;
    name Customer.name%type;

    BEGIN
        SELECT cu.name INTO name FROM Customer cu WHERE cus_id = id;
        dbms_output.put_line('The payments done by ' || name || ' are : ');
        dbms_output.put_line('Amount' || chr(9) || 'Mode Of Payment');
        FOR x IN payment_detail LOOP
            dbms_output.put_line(x.amount || x.mode_of_payment);
        END LOOP;
    END;

EXEC get_payment_details('CT675');