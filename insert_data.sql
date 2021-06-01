-- Customer:
INSERT INTO Customer VALUES('CT675', 'johnwalker123', 'Jonnyw@123$', 
    'John Walker', '12-15/A, Sector - 5, Navi Mumbai');

INSERT INTO Customer VALUES('CT111', 'petergreg716', 'Peteg@71#', 
    'Peter Gregory', '909-1/2E, 49th St, Cybercity, Hyderabad');

INSERT INTO Customer VALUES('CT928', 'richardhend00', 'Richyh@99!',
    'Richard Hendrics', '4196 Town Rd, SE #202, Chennai');


-- Employee:
INSERT INTO Employee VALUES('EP024', 'tomandrews999', 'Tommy@321$', 
    'Thomas Andrews'); 

INSERT INTO Employee VALUES('EP456', 'harrypotter7', 'Thechosenone@12',
    'Harry Potter'); 

INSERT INTO Employee VALUES('EP777', 'ronweasly323', 'Ronweasly$655', 
    'Ronald Weasly'); 

INSERT INTO Employee VALUES('EP890', 'julianarms609', 'Julian@54#', 
    'Julian Armstrong'); 


-- Call Operative:
INSERT INTO Call_operative VALUES('EP024', 512, 4.1);

INSERT INTO Call_operative VALUES('EP890', 1167, 4.5);


-- Service Team:
INSERT INTO Service_team VALUES('EP456', 2445);

INSERT INTO Service_team VALUES('EP777', 1890);


-- Plans Available:
INSERT INTO Plans_available VALUES('PN112', 'Postpaid', 549, '3GB/Day',
    '84days');

INSERT INTO Plans_available VALUES('PN514', 'Prepaid', 1299, '5GB/Day',
    '100days');

INSERT INTO Plans_available VALUES('PN890', 'Postpaid', 1699, 'Unlimited',
    '84days');


-- Sim Card:
INSERT INTO Sim_card VALUES('8688855380', 'CT928', '472416160863', 'PN514',
    'Active');

INSERT INTO Sim_card VALUES('9800078324', 'CT675', '368867094567', 'PN112',
    'Active');

INSERT INTO Sim_card VALUES('7899999670', 'CT111', '564448907634', 'PN890',
    'Active');


-- Request:
INSERT INTO Request VALUES('RQ290', 'Outgoing calls not working', 'EP456', 
    'Processing', to_date('12-05-2021','dd-mm-yyyy')); 

INSERT INTO Request VALUES('RQ097', 'Mobile Data not working', 'EP777', 
    'Resolving', to_date('30-04-2021','dd-mm-yyyy'));  

INSERT INTO Request VALUES('RQ006', 'Incoming calls not working', 'EP456', 
    'Resolving',  to_date('14-05-2021','dd-mm-yyyy')); 


-- Payment:
INSERT INTO Payment VALUES('PY390', 1349.5, 'Credit Card', 'CT928');

INSERT INTO Payment VALUES('PY572', 1799.99, 'Net Banking', 'CT111');

INSERT INTO Payment VALUES('PY899', 575.13, 'UPI', 'CT675');


-- Feedback:
INSERT INTO Feedback VALUES(47, 'CT928', 'RQ097', 'Good service and very 
    fast', 5);

INSERT INTO Feedback VALUES(890, 'CT111', 'RQ006', 'Good but can be 
    improved', 3);

INSERT INTO Feedback VALUES(1089, 'CT675', 'RQ290', 'Could be done a bit 
    more quickly', 4);


-- Address:
INSERT INTO Address VALUES('EP024', '4245 Blaine St NE, Hyderabad');

INSERT INTO Address VALUES('EP024', '7609 Mckinley Ave, Hyderabad');

INSERT INTO Address VALUES('EP777', '422 Grimmauld Place, Hyderabad');

INSERT INTO Address VALUES('EP890', '7/F, Estate-6, Hyderabad');

INSERT INTO Address VALUES('EP456', '4335 Wisconsin, Hyderabad');

INSERT INTO Address VALUES('EP456', '5723 Morgan Ave, Hyderabad');


-- Phone:
INSERT INTO Phone VALUES('EP777', 9032377480);

INSERT INTO Phone VALUES('EP777', 9866558257);

INSERT INTO Phone VALUES('EP890', 8977775609);

INSERT INTO Phone VALUES('EP890', 7099890768);

INSERT INTO Phone VALUES('EP456', 8555690324);

INSERT INTO Phone VALUES('EP024', 9768909877);


-- Raises:
INSERT INTO Raises VALUES('CT675','RQ290');

INSERT INTO Raises VALUES('CT928','RQ097');

INSERT INTO Raises VALUES('CT111','RQ006');
