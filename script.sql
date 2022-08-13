DROP TABLE IF EXISTS job_grades 
GO
CREATE TABLE job_grades (
    grade_level NVARCHAR(2) NOT NULL PRIMARY KEY,
    lowest_sal DECIMAL NOT NULL,
    highest_sal DECIMAL NOT NULL
);
GO

INSERT INTO job_grades (grade_level, lowest_sal, highest_sal) VALUES
    (N'A', 1000, 2999),
    (N'B', 3000, 5999),
    (N'C', 6000, 9999),
    (N'D', 10000, 14999),
    (N'E', 15000, 24999),
    (N'F', 25000, 40000)


DROP TABLE IF EXISTS job_history
GO
DROP TABLE IF EXISTS employees
GO
DROP TABLE IF EXISTS jobs
GO
DROP TABLE IF EXISTS departments
GO
DROP TABLE IF EXISTS locations
GO
DROP TABLE IF EXISTS countries
GO
DROP TABLE IF EXISTS regions
GO

CREATE TABLE regions (
    region_id INT NOT NULL PRIMARY KEY,
    region_name NVARCHAR(25) NOT NULL
);
GO

INSERT INTO regions (region_id, region_name) VALUES
    (1, N'Europe'),
    (2, N'Americas'),
    (3, N'Asia'),
    (4, N'Middle East and Africa')


CREATE TABLE countries (
    country_id CHAR(2) NOT NULL PRIMARY KEY,
    country_name NVARCHAR(40) NOT NULL,
    region_id INT NOT NULL,
    CONSTRAINT fk_countries_regions FOREIGN KEY (region_id) REFERENCES regions (region_id),
);
GO

INSERT INTO countries (country_id, country_name, region_id) VALUES
    (N'AR', N'Argentina', 2),
    (N'AU', N'Australia', 3),
    (N'BE', N'Belgium', 1),
    (N'BR', N'Brazil', 2),
    (N'CA', N'Canada', 2),
    (N'CH', N'Switzerland', 1),
    (N'CN', N'China', 3),
    (N'DE', N'Germany', 1),
    (N'DK', N'Denmark', 1),
    (N'EG', N'Egypt', 4),
    (N'FR', N'France', 1),
    (N'HK', N'HongKong', 3),
    (N'IL', N'Israel', 4),
    (N'IN', N'India', 3),
    (N'IT', N'Italy', 1),
    (N'JP', N'Japan', 3),
    (N'KW', N'Kuwait', 4),
    (N'MX', N'Mexico', 2),
    (N'NG', N'Nigeria', 4),
    (N'NL', N'Netherlands', 1),
    (N'SG', N'Singapore', 3),
    (N'UK', N'United Kingdom', 1),
    (N'US', N'United States of America', 2),
    (N'ZM', N'Zambia', 4),
    (N'ZW', N'Zimbabwe', 4)


CREATE TABLE locations (
    location_id INT NOT NULL PRIMARY KEY,
    street_address NVARCHAR(25),
    postal_code NVARCHAR(12),
    city NVARCHAR(30),
    state_province NVARCHAR(20),
    country_id CHAR(2),
    CONSTRAINT fk_locations_countries FOREIGN KEY (country_id) REFERENCES countries (country_id),
)
GO

INSERT INTO locations (location_id, street_address, postal_code, city, state_province, country_id) VALUES
    (1000, N'1297 Via Cola di Rie', N'989', N'Roma', N'', N'IT'),
    (1100, N'93091 Calle della Testa', N'10934', N'Venice', N'', N'IT'),
    (1200, N'2017 Shinjuku-ku', N'1689', N'Tokyo', N'Tokyo Prefecture', N'JP'),
    (1300, N'9450 Kamiya-cho', N'6823', N'Hiroshima', N'', N'JP'),
    (1400, N'2014 Jabberwocky Rd', N'26192', N'Southlake', N'Texas', N'US'),
    (1500, N'2011 Interiors Blvd', N'99236', N'South San Francisco', N'California', N'US'),
    (1600, N'2007 Zagora St', N'50090', N'South Brunswick', N'New Jersey', N'US'),
    (1700, N'2004 Charade Rd', N'98199', N'Seattle', N'Washington', N'US'),
    (1800, N'147 Spadina Ave', N'M5V 2L7', N'Toronto', N'Ontario', N'CA'),
    (1900, N'6092 Boxwood St', N'YSW 9T2', N'Whitehorse', N'Yukon', N'CA'),
    (2000, N'40-5-12 Laogianggen', N'190518', N'Beijing', N'', N'CN'),
    (2100, N'1298 Vileparle (E)', N'490231', N'Bombay', N'Maharashtra', N'IN'),
    (2200, N'12-98 Victoria Street', N'2901', N'Sydney', N'New South Wales', N'AU'),
    (2300, N'198 Clementi North', N'540198', N'Singapore', N'', N'SG'),
    (2400, N'8204 Arthur St', N'', N'London', N'', N'UK'),
    (2500, N'"Magdalen Centre', N' The Oxford ', N'OX9 9ZB', N'Oxford', N'UK'),
    (2600, N'9702 Chester Road', N'9629850293', N'Stretford', N'Manchester', N'UK'),
    (2700, N'Schwanthalerstr. 7031', N'80925', N'Munich', N'Bavaria', N'DE'),
    (2800, N'Rua Frei Caneca 1360', N'01307-002', N'Sao Paulo', N'Sao Paulo', N'BR'),
    (2900, N'20 Rue des Corps-Saints', N'1730', N'Geneva', N'Geneve', N'CH'),
    (3000, N'Murtenstrasse 921', N'3095', N'Bern', N'BE', N'CH'),
    (3100, N'Pieter Breughelstraat 837', N'3029SK', N'Utrecht', N'Utrecht', N'NL'),
    (3200, N'Mariano Escobedo 9991', N'11932', N'Mexico City', N'"Distrito Federal', N'MX')


CREATE TABLE departments (
    department_id INT NOT NULL PRIMARY KEY,
    department_name NVARCHAR(30) NOT NULL,
    manager_id INT,
    location_id INT NOT NULL,
    CONSTRAINT fk_departments_locations FOREIGN KEY (location_id) REFERENCES locations (location_id),
)
GO

INSERT INTO departments ([department_id], [department_name], [manager_id], [location_id]) VALUES
    (10, N'Administration', 200, 1700),
    (20, N'Marketing', 201, 1800),
    (30, N'Purchasing', 114, 1700),
    (40, N'Human Resources', 203, 2400),
    (50, N'Shipping', 121, 1500),
    (60, N'IT', 103, 1400),
    (70, N'Public Relations', 204, 2700),
    (80, N'Sales', 145, 2500),
    (90, N'Executive', 100, 1700),
    (100, N'Finance', 108, 1700),
    (110, N'Accounting', 205, 1700),
    (120, N'Treasury', 0, 1700),
    (130, N'Corporate Tax', 0, 1700),
    (140, N'Control And Credit', 0, 1700),
    (150, N'Shareholder Services', 0, 1700),
    (160, N'Benefits', 0, 1700),
    (170, N'Manufacturing', 0, 1700),
    (180, N'Construction', 0, 1700),
    (190, N'Contracting', 0, 1700),
    (200, N'Operations', 0, 1700),
    (210, N'IT Support', 0, 1700),
    (220, N'NOC', 0, 1700),
    (230, N'IT Helpdesk', 0, 1700),
    (240, N'Government Sales', 0, 1700),
    (250, N'Retail Sales', 0, 1700),
    (260, N'Recruiting', 0, 1700),
    (270, N'Payroll', 0, 1700)

-- TODO create foreign key from manager_id to employees

CREATE TABLE jobs (
    job_id VARCHAR(10) NOT NULL PRIMARY KEY,
    job_title NVARCHAR(35) NOT NULL,
    min_salary DECIMAL,
    max_salary DECIMAL
)
GO

INSERT INTO jobs (job_id, job_title, min_salary, max_salary) VALUES
    (N'AC_ACCOUNT', N'Public Accountant', 4200, 9000),
    (N'AC_MGR', N'Accounting Manager', 8200, 16000),
    (N'AD_ASST', N'Administration Assistant', 3000, 6000),
    (N'AD_PRES', N'President', 20000, 40000),
    (N'AD_VP', N'Administration Vice President', 15000, 30000),
    (N'FI_ACCOUNT', N'Accountant', 4200, 9000),
    (N'FI_MGR', N'Finance Manager', 8200, 16000),
    (N'HR_REP', N'Human Resources Representative', 4000, 9000),
    (N'IT_PROG', N'Programmer', 4000, 10000),
    (N'MK_MAN', N'Marketing Manager', 9000, 15000),
    (N'MK_REP', N'Marketing Representative', 4000, 9000),
    (N'PR_REP', N'Public Relations Representative', 4500, 10500),
    (N'PU_CLERK', N'Purchasing Clerk', 2500, 5500),
    (N'PU_MAN', N'Purchasing Manager', 8000, 15000),
    (N'SA_MAN', N'Sales Manager', 10000, 20000),
    (N'SA_REP', N'Sales Representative', 6000, 12000),
    (N'SH_CLERK', N'Shipping Clerk', 2500, 5500),
    (N'ST_CLERK', N'Stock Clerk', 2000, 5000),
    (N'ST_MAN', N'Stock Manager', 5500, 8500)


CREATE TABLE employees (
    employee_id INT NOT NULL PRIMARY KEY,
    first_name NVARCHAR(20),
    last_name NVARCHAR(25),
    email NVARCHAR(25),
    phone_number NVARCHAR(20),
    hire_date DATE,
    job_id VARCHAR(10),
    salary DECIMAL,
    commission_pct DECIMAL,
    manager_id INT,
    department_id INT NOT NULL,
    CONSTRAINT fk_employees_departments FOREIGN KEY (department_id) REFERENCES departments (department_id),
)
GO

INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) VALUES
    (100, N'Steven', N'King', N'SKING', N'515.123.4567', N'2003-06-17', N'AD_PRES', 24000.00, 0.00, 0, 90),
    (101, N'Neena', N'Kochhar', N'NKOCHHAR', N'515.123.4568', N'2005-09-21', N'AD_VP', 17000.00, 0.00, 100, 90),
    (102, N'Lex', N'De Haan', N'LDEHAAN', N'515.123.4569', N'2001-01-13', N'AD_VP', 17000.00, 0.00, 100, 90),
    (103, N'Alexander', N'Hunold', N'AHUNOLD', N'590.423.4567', N'2006-01-03', N'IT_PROG', 9000.00, 0.00, 102, 60),
    (104, N'Bruce', N'Ernst', N'BERNST', N'590.423.4568', N'2007-05-21', N'IT_PROG', 6000.00, 0.00, 103, 60),
    (105, N'David', N'Austin', N'DAUSTIN', N'590.423.4569', N'2005-06-25', N'IT_PROG', 4800.00, 0.00, 103, 60),
    (106, N'Valli', N'Pataballa', N'VPATABAL', N'590.423.4560', N'2006-02-05', N'IT_PROG', 4800.00, 0.00, 103, 60),
    (107, N'Diana', N'Lorentz', N'DLORENTZ', N'590.423.5567', N'2007-02-07', N'IT_PROG', 4200.00, 0.00, 103, 60),
    (108, N'Nancy', N'Greenberg', N'NGREENBE', N'515.124.4569', N'2002-08-17', N'FI_MGR', 12000.00, 0.00, 101, 100),
    (109, N'Daniel', N'Faviet', N'DFAVIET', N'515.124.4169', N'2002-08-16', N'FI_ACCOUNT', 9000.00, 0.00, 108, 100),
    (110, N'John', N'Chen', N'JCHEN', N'515.124.4269', N'2005-09-28', N'FI_ACCOUNT', 8200.00, 0.00, 108, 100),
    (111, N'Ismael', N'Sciarra', N'ISCIARRA', N'515.124.4369', N'2005-09-30', N'FI_ACCOUNT', 7700.00, 0.00, 108, 100),
    (112, N'Jose Manuel', N'Urman', N'JMURMAN', N'515.124.4469', N'2006-03-07', N'FI_ACCOUNT', 7800.00, 0.00, 108, 100),
    (113, N'Luis', N'Popp', N'LPOPP', N'515.124.4567', N'2007-12-07', N'FI_ACCOUNT', 6900.00, 0.00, 108, 100),
    (114, N'Den', N'Raphaely', N'DRAPHEAL', N'515.127.4561', N'2002-12-07', N'PU_MAN', 11000.00, 0.00, 100, 30),
    (115, N'Alexander', N'Khoo', N'AKHOO', N'515.127.4562', N'2003-05-18', N'PU_CLERK', 3100.00, 0.00, 114, 30),
    (116, N'Shelli', N'Baida', N'SBAIDA', N'515.127.4563', N'2005-12-24', N'PU_CLERK', 2900.00, 0.00, 114, 30),
    (117, N'Sigal', N'Tobias', N'STOBIAS', N'515.127.4564', N'2005-07-24', N'PU_CLERK', 2800.00, 0.00, 114, 30),
    (118, N'Guy', N'Himuro', N'GHIMURO', N'515.127.4565', N'2006-11-15', N'PU_CLERK', 2600.00, 0.00, 114, 30),
    (119, N'Karen', N'Colmenares', N'KCOLMENA', N'515.127.4566', N'2007-08-10', N'PU_CLERK', 2500.00, 0.00, 114, 30),
    (120, N'Matthew', N'Weiss', N'MWEISS', N'650.123.1234', N'2004-07-18', N'ST_MAN', 8000.00, 0.00, 100, 50),
    (121, N'Adam', N'Fripp', N'AFRIPP', N'650.123.2234', N'2005-04-10', N'ST_MAN', 8200.00, 0.00, 100, 50),
    (122, N'Payam', N'Kaufling', N'PKAUFLIN', N'650.123.3234', N'2003-05-01', N'ST_MAN', 7900.00, 0.00, 100, 50),
    (123, N'Shanta', N'Vollman', N'SVOLLMAN', N'650.123.4234', N'2005-10-10', N'ST_MAN', 6500.00, 0.00, 100, 50),
    (124, N'Kevin', N'Mourgos', N'KMOURGOS', N'650.123.5234', N'2007-11-16', N'ST_MAN', 5800.00, 0.00, 100, 50),
    (125, N'Julia', N'Nayer', N'JNAYER', N'650.124.1214', N'2005-07-16', N'ST_CLERK', 3200.00, 0.00, 120, 50),
    (126, N'Irene', N'Mikkilineni', N'IMIKKILI', N'650.124.1224', N'2006-09-28', N'ST_CLERK', 2700.00, 0.00, 120, 50),
    (127, N'James', N'Landry', N'JLANDRY', N'650.124.1334', N'2007-01-14', N'ST_CLERK', 2400.00, 0.00, 120, 50),
    (128, N'Steven', N'Markle', N'SMARKLE', N'650.124.1434', N'2008-03-08', N'ST_CLERK', 2200.00, 0.00, 120, 50),
    (129, N'Laura', N'Bissot', N'LBISSOT', N'650.124.5234', N'2005-08-20', N'ST_CLERK', 3300.00, 0.00, 121, 50),
    (130, N'Mozhe', N'Atkinson', N'MATKINSO', N'650.124.6234', N'2005-10-30', N'ST_CLERK', 2800.00, 0.00, 121, 50),
    (131, N'James', N'Marlow', N'JAMRLOW', N'650.124.7234', N'2005-02-16', N'ST_CLERK', 2500.00, 0.00, 121, 50),
    (132, N'TJ', N'Olson', N'TJOLSON', N'650.124.8234', N'2007-04-10', N'ST_CLERK', 2100.00, 0.00, 121, 50),
    (133, N'Jason', N'Mallin', N'JMALLIN', N'650.127.1934', N'2004-06-14', N'ST_CLERK', 3300.00, 0.00, 122, 50),
    (134, N'Michael', N'Rogers', N'MROGERS', N'650.127.1834', N'2006-08-26', N'ST_CLERK', 2900.00, 0.00, 122, 50),
    (135, N'Ki', N'Gee', N'KGEE', N'650.127.1734', N'2007-12-12', N'ST_CLERK', 2400.00, 0.00, 122, 50),
    (136, N'Hazel', N'Philtanker', N'HPHILTAN', N'650.127.1634', N'2008-02-06', N'ST_CLERK', 2200.00, 0.00, 122, 50),
    (137, N'Renske', N'Ladwig', N'RLADWIG', N'650.121.1234', N'2003-07-14', N'ST_CLERK', 3600.00, 0.00, 123, 50),
    (138, N'Stephen', N'Stiles', N'SSTILES', N'650.121.2034', N'2005-10-26', N'ST_CLERK', 3200.00, 0.00, 123, 50),
    (139, N'John', N'Seo', N'JSEO', N'650.121.2019', N'2006-02-12', N'ST_CLERK', 2700.00, 0.00, 123, 50),
    (140, N'Joshua', N'Patel', N'JPATEL', N'650.121.1834', N'2006-04-06', N'ST_CLERK', 2500.00, 0.00, 123, 50),
    (141, N'Trenna', N'Rajs', N'TRAJS', N'650.121.8009', N'2003-10-17', N'ST_CLERK', 3500.00, 0.00, 124, 50),
    (142, N'Curtis', N'Davies', N'CDAVIES', N'650.121.2994', N'2005-01-29', N'ST_CLERK', 3100.00, 0.00, 124, 50),
    (143, N'Randall', N'Matos', N'RMATOS', N'650.121.2874', N'2006-03-15', N'ST_CLERK', 2600.00, 0.00, 124, 50),
    (144, N'Peter', N'Vargas', N'PVARGAS', N'650.121.2004', N'2006-07-09', N'ST_CLERK', 2500.00, 0.00, 124, 50),
    (145, N'John', N'Russell', N'JRUSSEL', N'011.44.1344.429268', N'2004-10-01', N'SA_MAN', 14000.00, 0.40, 100, 80),
    (146, N'Karen', N'Partners', N'KPARTNER', N'011.44.1344.467268', N'2005-01-05', N'SA_MAN', 13500.00, 0.30, 100, 80),
    (147, N'Alberto', N'Errazuriz', N'AERRAZUR', N'011.44.1344.429278', N'2005-03-10', N'SA_MAN', 12000.00, 0.30, 100, 80),
    (148, N'Gerald', N'Cambrault', N'GCAMBRAU', N'011.44.1344.619268', N'2007-10-15', N'SA_MAN', 11000.00, 0.30, 100, 80),
    (149, N'Eleni', N'Zlotkey', N'EZLOTKEY', N'011.44.1344.429018', N'2008-01-29', N'SA_MAN', 10500.00, 0.20, 100, 80),
    (150, N'Peter', N'Tucker', N'PTUCKER', N'011.44.1344.129268', N'2005-01-30', N'SA_REP', 10000.00, 0.30, 145, 80),
    (151, N'David', N'Bernstein', N'DBERNSTE', N'011.44.1344.345268', N'2005-03-24', N'SA_REP', 9500.00, 0.25, 145, 80),
    (152, N'Peter', N'Hall', N'PHALL', N'011.44.1344.478968', N'2005-08-20', N'SA_REP', 9000.00, 0.25, 145, 80),
    (153, N'Christopher', N'Olsen', N'COLSEN', N'011.44.1344.498718', N'2006-03-30', N'SA_REP', 8000.00, 0.20, 145, 80),
    (154, N'Nanette', N'Cambrault', N'NCAMBRAU', N'011.44.1344.987668', N'2006-12-09', N'SA_REP', 7500.00, 0.20, 145, 80),
    (155, N'Oliver', N'Tuvault', N'OTUVAULT', N'011.44.1344.486508', N'2007-11-23', N'SA_REP', 7000.00, 0.15, 145, 80),
    (156, N'Janette', N'King', N'JKING', N'011.44.1345.429268', N'2004-01-30', N'SA_REP', 10000.00, 0.35, 146, 80),
    (157, N'Patrick', N'Sully', N'PSULLY', N'011.44.1345.929268', N'2004-03-04', N'SA_REP', 9500.00, 0.35, 146, 80),
    (158, N'Allan', N'McEwen', N'AMCEWEN', N'011.44.1345.829268', N'2004-08-01', N'SA_REP', 9000.00, 0.35, 146, 80),
    (159, N'Lindsey', N'Smith', N'LSMITH', N'011.44.1345.729268', N'2005-03-10', N'SA_REP', 8000.00, 0.30, 146, 80),
    (160, N'Louise', N'Doran', N'LDORAN', N'011.44.1345.629268', N'2005-12-15', N'SA_REP', 7500.00, 0.30, 146, 80),
    (161, N'Sarath', N'Sewall', N'SSEWALL', N'011.44.1345.529268', N'2006-11-03', N'SA_REP', 7000.00, 0.25, 146, 80),
    (162, N'Clara', N'Vishney', N'CVISHNEY', N'011.44.1346.129268', N'2005-11-11', N'SA_REP', 10500.00, 0.25, 147, 80),
    (163, N'Danielle', N'Greene', N'DGREENE', N'011.44.1346.229268', N'2007-03-19', N'SA_REP', 9500.00, 0.15, 147, 80),
    (164, N'Mattea', N'Marvins', N'MMARVINS', N'011.44.1346.329268', N'2008-01-24', N'SA_REP', 7200.00, 0.10, 147, 80),
    (165, N'David', N'Lee', N'DLEE', N'011.44.1346.529268', N'2008-02-23', N'SA_REP', 6800.00, 0.10, 147, 80),
    (166, N'Sundar', N'Ande', N'SANDE', N'011.44.1346.629268', N'2008-03-24', N'SA_REP', 6400.00, 0.10, 147, 80),
    (167, N'Amit', N'Banda', N'ABANDA', N'011.44.1346.729268', N'2008-04-21', N'SA_REP', 6200.00, 0.10, 147, 80),
    (168, N'Lisa', N'Ozer', N'LOZER', N'011.44.1343.929268', N'2005-03-11', N'SA_REP', 11500.00, 0.25, 148, 80),
    (169, N'Harrison', N'Bloom', N'HBLOOM', N'011.44.1343.829268', N'2006-03-23', N'SA_REP', 10000.00, 0.20, 148, 80),
    (170, N'Tayler', N'Fox', N'TFOX', N'011.44.1343.729268', N'2006-01-24', N'SA_REP', 9600.00, 0.20, 148, 80),
    (171, N'William', N'Smith', N'WSMITH', N'011.44.1343.629268', N'2007-02-23', N'SA_REP', 7400.00, 0.15, 148, 80),
    (172, N'Elizabeth', N'Bates', N'EBATES', N'011.44.1343.529268', N'2007-03-24', N'SA_REP', 7300.00, 0.15, 148, 80),
    (173, N'Sundita', N'Kumar', N'SKUMAR', N'011.44.1343.329268', N'2008-04-21', N'SA_REP', 6100.00, 0.10, 148, 80),
    (174, N'Ellen', N'Abel', N'EABEL', N'011.44.1644.429267', N'2004-05-11', N'SA_REP', 11000.00, 0.30, 149, 80),
    (175, N'Alyssa', N'Hutton', N'AHUTTON', N'011.44.1644.429266', N'2005-03-19', N'SA_REP', 8800.00, 0.25, 149, 80),
    (176, N'Jonathon', N'Taylor', N'JTAYLOR', N'011.44.1644.429265', N'2006-03-24', N'SA_REP', 8600.00, 0.20, 149, 80),
    (177, N'Jack', N'Livingston', N'JLIVINGS', N'011.44.1644.429264', N'2006-04-23', N'SA_REP', 8400.00, 0.20, 149, 80),
    (178, N'Kimberely', N'Grant', N'KGRANT', N'011.44.1644.429263', N'2007-05-24', N'SA_REP', 7000.00, 0.15, 149, 80),
    (179, N'Charles', N'Johnson', N'CJOHNSON', N'011.44.1644.429262', N'2008-01-04', N'SA_REP', 6200.00, 0.10, 149, 80),
    (180, N'Winston', N'Taylor', N'WTAYLOR', N'650.507.9876', N'2006-01-24', N'SH_CLERK', 3200.00, 0.00, 120, 50),
    (181, N'Jean', N'Fleaur', N'JFLEAUR', N'650.507.9877', N'2006-02-23', N'SH_CLERK', 3100.00, 0.00, 120, 50),
    (182, N'Martha', N'Sullivan', N'MSULLIVA', N'650.507.9878', N'2007-06-21', N'SH_CLERK', 2500.00, 0.00, 120, 50),
    (183, N'Girard', N'Geoni', N'GGEONI', N'650.507.9879', N'2008-02-03', N'SH_CLERK', 2800.00, 0.00, 120, 50),
    (184, N'Nandita', N'Sarchand', N'NSARCHAN', N'650.509.1876', N'2004-01-27', N'SH_CLERK', 4200.00, 0.00, 121, 50),
    (185, N'Alexis', N'Bull', N'ABULL', N'650.509.2876', N'2005-02-20', N'SH_CLERK', 4100.00, 0.00, 121, 50),
    (186, N'Julia', N'Dellinger', N'JDELLING', N'650.509.3876', N'2006-06-24', N'SH_CLERK', 3400.00, 0.00, 121, 50),
    (187, N'Anthony', N'Cabrio', N'ACABRIO', N'650.509.4876', N'2007-02-07', N'SH_CLERK', 3000.00, 0.00, 121, 50),
    (188, N'Kelly', N'Chung', N'KCHUNG', N'650.505.1876', N'2005-06-14', N'SH_CLERK', 3800.00, 0.00, 122, 50),
    (189, N'Jennifer', N'Dilly', N'JDILLY', N'650.505.2876', N'2005-08-13', N'SH_CLERK', 3600.00, 0.00, 122, 50),
    (190, N'Timothy', N'Gates', N'TGATES', N'650.505.3876', N'2006-07-11', N'SH_CLERK', 2900.00, 0.00, 122, 50),
    (191, N'Randall', N'Perkins', N'RPERKINS', N'650.505.4876', N'2007-12-19', N'SH_CLERK', 2500.00, 0.00, 122, 50),
    (192, N'Sarah', N'Bell', N'SBELL', N'650.501.1876', N'2004-02-04', N'SH_CLERK', 4000.00, 0.00, 123, 50),
    (193, N'Britney', N'Everett', N'BEVERETT', N'650.501.2876', N'2005-03-03', N'SH_CLERK', 3900.00, 0.00, 123, 50),
    (194, N'Samuel', N'McCain', N'SMCCAIN', N'650.501.3876', N'2006-07-01', N'SH_CLERK', 3200.00, 0.00, 123, 50),
    (195, N'Vance', N'Jones', N'VJONES', N'650.501.4876', N'2007-03-17', N'SH_CLERK', 2800.00, 0.00, 123, 50),
    (196, N'Alana', N'Walsh', N'AWALSH', N'650.507.9811', N'2006-04-24', N'SH_CLERK', 3100.00, 0.00, 124, 50),
    (197, N'Kevin', N'Feeney', N'KFEENEY', N'650.507.9822', N'2006-05-23', N'SH_CLERK', 3000.00, 0.00, 124, 50),
    (198, N'Donald', N'OConnell', N'DOCONNEL', N'650.507.9833', N'2007-06-21', N'SH_CLERK', 2600.00, 0.00, 124, 50),
    (199, N'Douglas', N'Grant', N'DGRANT', N'650.507.9844', N'2008-01-13', N'SH_CLERK', 2600.00, 0.00, 124, 50),
    (200, N'Jennifer', N'Whalen', N'JWHALEN', N'515.123.4444', N'2003-09-17', N'AD_ASST', 4400.00, 0.00, 101, 10),
    (201, N'Michael', N'Hartstein', N'MHARTSTE', N'515.123.5555', N'2004-02-17', N'MK_MAN', 13000.00, 0.00, 100, 20),
    (202, N'Pat', N'Fay', N'PFAY', N'603.123.6666', N'2005-08-17', N'MK_REP', 6000.00, 0.00, 201, 20),
    (203, N'Susan', N'Mavris', N'SMAVRIS', N'515.123.7777', N'2002-06-07', N'HR_REP', 6500.00, 0.00, 101, 40),
    (204, N'Hermann', N'Baer', N'HBAER', N'515.123.8888', N'2002-06-07', N'PR_REP', 10000.00, 0.00, 101, 70),
    (205, N'Shelley', N'Higgins', N'SHIGGINS', N'515.123.8080', N'2002-06-07', N'AC_MGR', 12008.00, 0.00, 101, 110),
    (206, N'William', N'Gietz', N'WGIETZ', N'515.123.8181', N'2002-06-07', N'AC_ACCOUNT', 8300.00, 0.00, 205, 110)


CREATE TABLE job_history (
    employee_id INT NOT NULL,
    start_date DATE,
    end_date DATE,
    job_id VARCHAR(10),
    department_id INT,
    CONSTRAINT pk_job_history PRIMARY KEY CLUSTERED (employee_id, start_date),
    CONSTRAINT fk_job_history_departments FOREIGN KEY (department_id) REFERENCES departments (department_id),
    CONSTRAINT fk_job_history_jobs FOREIGN KEY (job_id) REFERENCES jobs (job_id),
    CONSTRAINT fk_job_history_employees FOREIGN KEY (employee_id) REFERENCES employees (employee_id),
)
GO

INSERT INTO job_history (employee_id, start_date, end_date, job_id, department_id) VALUES
    (101, N'1997-09-21', N'2001-10-27', N'AC_ACCOUNT', 110),
    (101, N'2001-10-28', N'2005-03-15', N'AC_MGR', 110),
    (102, N'2001-01-13', N'2006-07-24', N'IT_PROG', 60),
    (114, N'2006-03-24', N'2007-12-31', N'ST_CLERK', 50),
    (122, N'2007-01-01', N'2007-12-31', N'ST_CLERK', 50),
    (176, N'2006-03-24', N'2006-12-31', N'SA_REP', 80),
    (176, N'2007-01-01', N'2007-12-31', N'SA_MAN', 80),
    (200, N'1995-09-17', N'2001-06-17', N'AD_ASST', 90),
    (200, N'2002-07-01', N'2006-12-31', N'AC_ACCOUNT', 90),
    (201, N'2004-02-17', N'2007-12-19', N'MK_REP', 20)


