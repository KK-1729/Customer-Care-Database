-- For the Call Operative employees, display their employee id, name, no. of calls processed and their ratings. 
-- If no of calls processed by the employee is ‘0’ then set the value to be NULL and if the employee has not been rated,  
-- set the rating to ‘0’.
SELECT ep.emp_id, ep.name, NULLIF(no_of_calls_processed, 0) "No. of Calls",
    NVL(rating, 0) "Rating" FROM Employee ep, Call_operative co WHERE ep.emp_id = co.emp_id;


-- Display the details of the requests such as id, description, date, status made by the customer with the id CT111 in the 
-- order of the dates the requests were made.
SELECT rq.req_id, description, date_of_request, status FROM Customer cu JOIN
    Raises ra ON cu.cus_id = ra.cus_id JOIN Request rq ON ra.req_id = rq.req_id
    WHERE cu.cus_id = 'CT111' ORDER BY date_of_request;


-- Display the payment transaction history of the customers who live in Mumbai.
SELECT payment_id, cus_id, amount FROM Payment WHERE cus_id IN (
    SELECT cus_id FROM Customer WHERE address LIKE '%Mumbai%'
);


-- Display the plan details of the customer with the user entered customer id.
SELECT pl.type, pl.data, pl.validity FROM Plans_available pl WHERE (1) = (
    SELECT COUNT(DISTINCT(cus_id)) FROM Sim_card sc WHERE sc.cus_id = &cus_id 
        AND sc.plan_id = pl.plan_id
);


-- Display the plans provided by the company that offer 3gb/day data or the plans that cost less than 1500 rupees.
(SELECT * FROM Plans_available WHERE data = '3GB/Day')
    UNION
        (SELECT * FROM Plans_available WHERE amount < 1500);


-- Display the id, name and phone numbers of the employees.
SELECT ep.emp_id, name, phone FROM Employee ep LEFT JOIN Phone p ON ep.emp_id = p.emp_id;


-- Display the plans available in the order of their popularity based on the number of users.
SELECT plan_id, COUNT(DISTINCT(cus_id)) "No. of users" FROM
    Sim_card GROUP BY plan_id ORDER BY COUNT(DISTINCT(cus_id)) DESC;


-- Display the different modes of payment that have been used to pay at least Rs. 1000 and the total amount 
-- paid using those modes. 
SELECT mode_of_payment, SUM(amount) "Total Amount" FROM Payment GROUP by
    mode_of_payment HAVING SUM(amount) > 1000;