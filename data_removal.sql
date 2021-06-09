-- Discontinue all the plans that cost less than Rs 400
DELETE FROM Plans_available WHERE amount < 400;

-- Delete all the requests that have been resolved
DELETE FROM Request WHERE status = 'Resolved';

-- Delete the details of the employee with id = EP011
DELETE FROM Employee WHERE emp_id = 'EP011';

-- Delete the feedback given by the customer with id = CT928
DELETE FROM Feedback WHERE cus_id = 'CT928';