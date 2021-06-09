-- Customer
CREATE TABLE Customer (
    cus_id char(5) NOT NULL,
    username varchar(15) NOT NULL,
    password varchar(16) NOT NULL,
    name varchar(30),
    address varchar(50),
    CONSTRAINT pk_customer PRIMARY KEY(cus_id),
    CONSTRAINT ck_password1 CHECK (REGEXP_LIKE (password,'^[a-zA-Z0-9@!#$]{8,16}$'))
);

-- Employee
CREATE TABLE Employee (
    emp_id char(5) NOT NULL,
    username varchar(15) NOT NULL,
    password varchar(16) NOT NULL,
    name varchar(30),
    CONSTRAINT pk_employee PRIMARY KEY(emp_id),
    CONSTRAINT ck_password2 CHECK (REGEXP_LIKE (password,'^[a-zA-Z0-9@!#$]{8,16}$'))
);

-- Call Operative
CREATE TABLE Call_operative (
    emp_id char(5) NOT NULL,
    no_of_calls_processed number(6),
    rating number(3,2),
    CONSTRAINT fk_callOperative FOREIGN KEY (emp_id) REFERENCES 
    Employee(emp_id),
    CONSTRAINT ck_rating CHECK (rating >= 1 AND rating <= 5)
);

-- Service Team
CREATE TABLE Service_team (
    emp_id char(5) NOT NULL,
    no_of_requests_processed number(6),
    CONSTRAINT pk_serviceTeam PRIMARY KEY (emp_id),
    CONSTRAINT fk_serviceTeam FOREIGN KEY (emp_id) REFERENCES 
    Employee(emp_id)
);

-- Plans Available
CREATE TABLE Plans_available (
    plan_id char(5) NOT NULL,
    type varchar(15),
    amount number(*,2),
    data varchar(15),
    validity varchar(10),
    CONSTRAINT pk_plans PRIMARY KEY (plan_id)
);

-- Sim Card
CREATE TABLE Sim_card (
    mobile_no char(10) NOT NULL,
    cus_id char(5) NOT NULL,
    aadhar_linked char(12),
    plan_id char(5) NOT NULL,
    status varchar(10),
    CONSTRAINT pk_simCard PRIMARY KEY (mobile_no),
    CONSTRAINT fk1_simCard FOREIGN KEY (cus_id) REFERENCES Customer(cus_id),
    CONSTRAINT fk2_simCard FOREIGN KEY (plan_id) REFERENCES 
    Plans_available(plan_id)
);

-- Request
CREATE TABLE Request (
    req_id char(5) NOT NULL,
    description varchar(50),
    emp_id char(5) NOT NULL,
    status varchar(20),
    date_of_request DATE,
    CONSTRAINT pk_request PRIMARY KEY (req_id),
    CONSTRAINT fk_request FOREIGN KEY (emp_id) REFERENCES 
    Service_team(emp_id)
);

-- Payment
CREATE TABLE Payment (
    payment_id char(5) NOT NULL,
    amount number(*,2),
    mode_of_payment varchar(20),
    cus_id char(5) NOT NULL,
    CONSTRAINT pk_payment PRIMARY KEY (payment_id),
    CONSTRAINT fk_payment FOREIGN KEY (cus_id) REFERENCES Customer (cus_id),
    CONSTRAINT ck_mode CHECK (mode_of_payment IN ('Credit Card', 
    'Debit Card', 'Net Banking', 'UPI'))
);

-- Feedback
CREATE TABLE Feedback (
    s_no number(*) NOT NULL,
    cus_id char(5) NOT NULL,
    req_id char(5) NOT NULL,
    content varchar(50),
    rating number(1),
    CONSTRAINT pk_feedback PRIMARY KEY (s_no),
    CONSTRAINT fk1_feedback FOREIGN KEY (cus_id) REFERENCES Customer (cus_id),
    CONSTRAINT fk2_feedback FOREIGN KEY (req_id) REFERENCES Request (req_id),
    CONSTRAINT ck_fRating CHECK (rating >= 1 AND rating <= 5)
);

-- Address
CREATE TABLE Address (
    emp_id char(5) NOT NULL,
    address varchar(30),
    CONSTRAINT fk_address FOREIGN KEY (emp_id) REFERENCES Employee (emp_id)
);

-- Phone
CREATE TABLE Phone (
    emp_id char(5) NOT NULL,
    phone number(10),
    CONSTRAINT fk_phone FOREIGN KEY (emp_id) REFERENCES Employee (emp_id)
);

-- Raises
CREATE TABLE Raises (
    cus_id char(5) NOT NULL,
    req_id char(5) NOT NULL,
    CONSTRAINT fk1_raises FOREIGN KEY (cus_id) REFERENCES Customer (cus_id),
    CONSTRAINT fk2_raises FOREIGN KEY (req_id) REFERENCES Request (req_id)
);
