-- Change the address of the customer with id = CT675 to “10-09/A, Sector - 6, Mumbai”
UPDATE Customer SET address = '10-09/A, Sector - 6, Mumbai' WHERE cus_id = 'CT675';

-- Change the plan of the customer with id = CT928 from PN514 to PN890
UPDATE Sim_card SET plan_id = 'PN890' WHERE cus_id = 'CT928';

-- Set the status of all the requests made on 14th May 2021 to “Resolved”
UPDATE Request SET status = 'Resolved' WHERE date_of_request = to_date('14-05-2021', 'dd-mm-yyyy');

-- Modify the rating given by the customer with the id = CT675 for the request RQ290 to “3”
UPDATE Feedback SET rating = 3 WHERE cus_id = 'CT675' AND req_id = 'RQ290';