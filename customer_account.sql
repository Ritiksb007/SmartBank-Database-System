CREATE SCHEMA Customer_Account;
CREATE SCHEMA Customer_Offerings;
CREATE SCHEMA Branch_Operations;

CREATE TABLE Customer_Account.Customers (
    Customer_ID SERIAL PRIMARY KEY,
    Name VARCHAR(100),
    Address VARCHAR(100),
    Phone_Number BIGINT,
    Email VARCHAR(100),
    Date_Of_Birth DATE,
    National_ID VARCHAR(20)
);

CREATE TABLE Customer_Account.Accounts (
    Account_ID SERIAL PRIMARY KEY,
    Customer_ID INTEGER REFERENCES Customer_Account.Customers(Customer_ID),
    Account_Type VARCHAR(10) CHECK (Account_Type IN ('Savings', 'Current')),
    Balance DECIMAL(15, 2),
    Opening_Date DATE,
    Branch_Name VARCHAR(50)
);

CREATE TABLE Customer_Account.Transactions (
    Transaction_ID SERIAL PRIMARY KEY,
    Account_ID INTEGER REFERENCES Customer_Account.Accounts(Account_ID),
    Transaction_Date TIMESTAMP,
    Transaction_Type VARCHAR(20) CHECK (Transaction_Type IN ('Deposit', 'Withdrawal', 'Transfer')),
    Amount DECIMAL(15, 2),
    Transaction_Mode VARCHAR(20) CHECK (Transaction_Mode IN ('Branch', 'ATM', 'Mobile', 'Online')),
    Remarks VARCHAR(100)
);

CREATE TABLE Customer_Account.Cards (
    Card_ID SERIAL PRIMARY KEY,
    Account_ID INTEGER REFERENCES Customer_Account.Accounts(Account_ID),
    Card_Type VARCHAR(10) CHECK (Card_Type IN ('Debit', 'Credit')),
    Card_Number CHAR(16),
    Expiry_Date DATE,
    CVV CHAR(3),
    Issued_Date DATE,
    Card_Status VARCHAR(10) CHECK (Card_Status IN ('Active', 'Blocked', 'Expired'))
);

CREATE TABLE Customer_Account.Documents (
    Document_ID SERIAL PRIMARY KEY,
    Document_Type VARCHAR(100),
    Associated_With VARCHAR(100),
    Associated_ID INTEGER,
    Upload_Date DATE,
    Expiry_Date DATE,
    Verified VARCHAR(3) CHECK (Verified IN ('Yes', 'No'))
);

SELECT * FROM Customer_Account.Customers;
SELECT * FROM  Customer_Account.Accounts;
SELECT * FROM Customer_Account.Transactions;
SELECT * FROM Customer_Account.Cards;
SELECT * FROM Customer_Account.Documents;


INSERT INTO Customer_Account.Customers 
    (Customer_ID,Name, Address, Phone_Number, Email, Date_Of_Birth, National_ID) 
VALUES
(1, 'John Doe', '123 Elm Street, New York', '9876543210', 'johndoe@example.com', '1985-02-15', ' S854321987'),
(2, 'Jane Smith', '456 Maple Avenue, Chicago', '8765432109', 'janesmith@example.com', '1990-08-22', 'B987654321'),
(3, 'Mike Johnson', '789 Pine Lane, Houston', '7654321098', 'mikejohnson@example.com', '1982-11-10', 'C654321987'),
(4, 'Emily Davis', '321 Oak Boulevard, San Francisco', '6543210987', 'emilydavis@example.com', '1995-03-05', 'D321098765'),
(5, 'David Brown', '654 Cedar Road, Miami', '5432109876', 'davidbrown@example.com', '1988-07-19', 'E543210987'),
(6, 'Sophia Wilson', '987 Birch Lane, Boston', '4321098765', 'sophiawilson@example.com', '1993-01-12', 'F654789321'),
(7, 'James Taylor', '222 Willow Way, Seattle', '3210987654', 'jamestaylor@example.com', '1987-12-25', 'G987321654'),
(8, 'Olivia Martinez', '333 Redwood Drive, Denver', '2109876543', 'oliviamartinez@example.com', '1999-09-30', 'H321654987'),
(9, 'Lucas Anderson', '888 Cypress Avenue, Atlanta', '1987654321', 'lucasanderson@example.com', '1992-04-18', 'I654123987'),
(10, 'Amelia Thompson', '777 Magnolia Street, Dallas', '5678901234', 'ameliathompson@example.com', '1983-08-08', 'J456123789'),
(11, 'Evelyn Murphy', '123 Maple Street, Austin', '6781234560', 'evelynmurphy@example.com', '1993-06-21', 'K123456780'),
(12, 'Samuel Hughes', '234 Oak Avenue, Dallas', '7892345671', 'samuelhughes@example.com', '1991-02-15', 'L234567891'),
(13, 'Victoria Rogers', '345 Pine Road, Denver', '8903456782', 'victoriarogers@example.com', '1985-08-09', 'M345678912'),
(14, 'Sebastian Cook', '456 Cedar Lane, Atlanta', '9014567893', 'sebastiancook@example.com', '1998-11-13', 'N456789123'),
(15, 'Zoe Campbell', '567 Willow Way, Chicago', '1235678904', 'zoecampbell@example.com', '1994-05-17', 'O567890234'),
(16, 'Jack Sanders', '678 Redwood Avenue, Miami', '2346789015', 'jacksanders@example.com', '1990-03-11', 'P678901345'),
(17, 'Lillian Cooper', '789 Spruce Drive, Seattle', '3457890126', 'lilliancooper@example.com', '1989-09-25', 'Q789012456'),
(18, 'Daniel Morgan', '890 Sycamore Boulevard, San Diego', '4568901237', 'danielmorgan@example.com', '1992-07-08', 'R890123567'),
(19, 'Hannah Jenkins', '901 Magnolia Street, Phoenix', '5679012348', 'hannahjenkins@example.com', '1996-12-30', 'S901234678'),
(20, 'Ryan Foster', '101 Birch Lane, Houston', '6780123459', 'ryanfoster@example.com', '1993-04-05', 'T012345789'),
(21, 'Leah Patterson', '202 Cypress Avenue, Austin', '7891234567', 'leahpatterson@example.com', '1990-10-14', 'U123456890'),
(22, 'Aaron Ross', '303 Maple Boulevard, Chicago', '8902345678', 'aaronross@example.com', '1988-02-28', 'V234567901'),
(23, 'Madison Howard', '404 Pine Drive, San Francisco', '9013456789', 'madisonhoward@example.com', '1995-01-09', 'W345678912'),
(24, 'Henry Ramirez', '505 Oak Street, Dallas', '1234567890', 'henryramirez@example.com', '1987-03-23', 'X456789023'),
(25, 'Elizabeth Ward', '606 Cedar Avenue, Houston', '2345678901', 'elizabethward@example.com', '1991-06-19', 'Y567890134'),
(26, 'Lucas Bailey', '707 Willow Lane, New York', '3456789012', 'lucasbailey@example.com', '1986-09-12', 'Z678901245'),
(27, 'Scarlett Brooks', '808 Redwood Road, Boston', '4567890123', 'scarlettbrooks@example.com', '1998-11-03', 'AA789012356'),
(28, 'Eli Gray', '909 Spruce Avenue, Denver', '5678901234', 'eligray@example.com', '1989-04-27', 'BB890123467'),
(29, 'Natalie Wood', '1010 Sycamore Way, Phoenix', '6789012345', 'nataliewood@example.com', '1994-07-06', 'CC901234578'),
(30, 'Carter Bell', '1011 Magnolia Lane, Atlanta', '7890123456', 'carterbell@example.com', '1990-01-19', 'DD012345689'),
(31, 'Chloe Martinez', '123 Oak Lane, New York', '8901234561', 'chloemartinez@example.com', '1995-07-19', 'EE123456781'),
(32, 'Isaac James', '234 Maple Boulevard, Boston', '7892345672', 'isaacjames@example.com', '1993-11-22', 'FF987654322'),
(33, 'Avery Lopez', '345 Cedar Street, Atlanta', '6783456783', 'averylopez@example.com', '1991-02-13', 'GG654321983'),
(34, 'Grace Carter', '456 Spruce Avenue, Dallas', '5674567894', 'gracecarter@example.com', '1990-04-15', 'HH321098764'),
(35, 'Owen Wilson', '567 Birch Drive, Chicago', '4565678568', 'owenwilson@example.com', '1992-08-12', 'II543210988'),
(36, 'Sophia Anderson', '678 Cypress Road, Miami', '3456789016', 'sophiaanderson@example.com', '1996-06-10', 'JJ654789324'),
(37, 'Ethan Perez', '789 Pine Lane, Houston', '2347890127', 'ethanperez@example.com', '1989-03-05', 'KK987321655'),
(38, 'Zoe Scott', '890 Magnolia Avenue, Phoenix', '1238901238', 'zoescott@example.com', '1988-12-11', 'LL321654988'),
(39, 'Luke Murphy', '901 Redwood Boulevard, Seattle', '8901234569', 'lukemurphy@example.com', '1990-09-14', 'MM654123978'),
(40, 'Scarlett Lee', '101 Spruce Street, Denver', '7892345678', 'scarlettlee@example.com', '1987-01-24', 'NN456123781'),
(41, 'Ella Young', '202 Cedar Avenue, San Francisco', '6783456787', 'ellayoung@example.com', '1994-05-18', 'OO789654322'),
(42, 'Mason Brown', '303 Oak Way, Dallas', '5674567896', 'masonbrown@example.com', '1991-03-30', 'PP321765498'),
(43, 'Lily Ramirez', '404 Birch Road, New York', '4565678905', 'lilyramirez@example.com', '1993-06-29', 'QQ123654789'),
(44, 'Jack Martinez', '505 Pine Lane, Atlanta', '3456789014', 'jackmartinez@example.com', '1986-08-04', 'RR543210965'),
(45, 'Grace Foster', '606 Maple Boulevard, Houston', '2347890123', 'gracefoster@example.com', '1998-07-21', 'SS765432109'),
(46, 'Henry Hill', '707 Willow Avenue, Seattle', '1238901232', 'henryhill@example.com', '1992-10-25', 'TT654321908'),
(47, 'Amelia Baker', '808 Redwood Drive, Phoenix', '8901234561', 'ameliabaker@example.com', '1995-04-14', 'UU543219876'),
(48, 'Oliver Reed', '909 Spruce Lane, Dallas', '7892345670', 'oliverreed@example.com', '1988-08-18', 'VV765432198'),
(49, 'Harper Morgan', '1010 Cedar Way, Boston', '6783456789', 'harpermorgan@example.com', '1987-03-22', 'WW432109876'),
(50, 'Logan Bennett', '1011 Birch Avenue, Denver', '5674567891', 'loganbennett@example.com', '1990-09-11', 'XX123456789'),
(51, 'Aria Wood', '123 Spruce Street, New York', '4565678902', 'ariawood@example.com', '1994-01-03', 'YY456789012'),
(52, 'Noah Bell', '234 Maple Boulevard, Miami', '3456789013', 'noahbell@example.com', '1989-11-10', 'ZZ567890123'),
(53, 'Luna Gray', '345 Cedar Lane, San Francisco', '2347890124', 'lunagray@example.com', '1985-06-15', 'AA678901234'),
(54, 'Henry Carter', '456 Pine Way, Atlanta', '1238901235', 'henrycarter@example.com', '1991-07-09', 'BB789012345'),
(55, 'Emily Ross', '567 Birch Avenue, Houston', '8901234566', 'emilyross@example.com', '1993-09-25', 'CC890123456'),
(56, 'James Rivera', '678 Magnolia Street, Boston', '7892345677', 'jamesrivera@example.com', '1988-03-12', 'DD901234567'),
(57, 'Chloe Cooper', '789 Willow Drive, Chicago', '6783456788', 'chloecooper@example.com', '1996-12-06', 'EE012345678'),
(58, 'Mila King', '890 Redwood Boulevard, Seattle', '5674567899', 'milaking@example.com', '1989-05-22', 'FF123456789'),
(59, 'Ethan Howard', '901 Cedar Way, Denver', '4565678900', 'ethanhoward@example.com', '1990-10-01', 'GG234567890'),
(60, 'Sophia Adams', '101 Birch Lane, Phoenix', '3456789011', 'sophiaadams@example.com', '1992-02-14', 'HH345678901'),
(61, 'Ella Carter', '101 Spruce Street, New York', '8901234567', 'ellacarter@example.com', '1994-01-12', 'AA123456781'),
(62, 'Henry Turner', '202 Sycamore Lane, Chicago', '7890123456', 'henryturner@example.com', '1989-05-22', 'BB987654322'),
(63, 'Liam Scott', '303 Maple Avenue, Houston', '6789012345', 'liamscott@example.com', '1991-03-11', 'CC654321983'),
(64, 'Grace Hill', '404 Pine Road, San Francisco', '5678901234', 'gracehill@example.com', '1986-07-05', 'DD321098764'),
(65, 'Mason Adams', '505 Birch Drive, Miami', '4567890123', 'masonadams@example.com', '1988-02-19', 'EE543210988'),
(66, 'Ava White', '606 Cedar Lane, Boston', '3456789012', 'avawhite@example.com', '1992-08-15', 'FF654789324'),
(67, 'Ethan Harris', '707 Willow Way, Seattle', '2345678901', 'ethanharris@example.com', '1995-04-20', 'GG987321655'),
(68, 'Sophia Clark', '808 Oak Avenue, Denver', '1234567890', 'sophiaclark@example.com', '1990-11-10', 'HH321654988'),
(69, 'Noah Lewis', '909 Redwood Street, Atlanta', '9876543211', 'noahlewis@example.com', '1984-06-25', 'II654123978'),
(70, 'Harper King', '1001 Cypress Road, Dallas', '8765432102', 'harperking@example.com', '1997-09-15', 'JJ456123781'),
(71, 'Alexander Bennett', '1002 Magnolia Lane, Phoenix', '7654321098', 'alexanderbennett@example.com', '1985-03-10', 'KK789654322'),
(72, 'Isabella Young', '1003 Spruce Drive, New York', '6543210987', 'isabellayoung@example.com', '1998-07-30', 'LL321765498'),
(73, 'Matthew Baker', '1004 Sycamore Boulevard, Chicago', '5432109876', 'matthewbaker@example.com', '1996-01-12', 'MM123654789'),
(74, 'Charlotte Rivera', '1005 Maple Avenue, Houston', '4321098765', 'charlotterivera@example.com', '1991-12-01', 'NN543210965'),
(75, 'Daniel Perez', '1006 Pine Street, San Francisco', '3210987654', 'danielperez@example.com', '1992-10-18', 'OO765432109'),
(76, 'Mia Brooks', '1007 Birch Avenue, Miami', '2109876543', 'miabrooks@example.com', '1993-08-05', 'PP654321908'),
(77, 'Logan Foster', '1008 Cedar Road, Boston', '1987654321', 'loganfoster@example.com', '1989-03-25', 'QQ543219876'),
(78, 'Abigail Reed', '1009 Willow Street, Seattle', '1098765432', 'abigailreed@example.com', '1994-06-10', 'RR765432198'),
(79, 'Benjamin Gray', '1010 Oak Avenue, Denver', '9876543201', 'benjamingray@example.com', '1987-11-05', 'SS432109876'),
(80, 'Emily Morris', '1011 Redwood Drive, Atlanta', '8765432198', 'emilymorris@example.com', '1995-02-14', 'TT123456789');


SELECT * FROM Customer_Account.Customers;

-- Accounts Table:

INSERT INTO Customer_Account.Accounts (Account_ID, Customer_ID, Account_Type, Balance, Opening_Date, Branch_Name) 
VALUES
(1, 1, 'Savings', 2500.75, '2020-01-15', 'New York'),
(2, 2, 'Current', 5000.00, '2019-07-20', 'Chicago'),
(3, 3, 'Savings', 12000.50, '2021-03-12', 'Houston'),
(4, 4, 'Savings', 750.00, '2022-06-10', 'San Francisco'),
(5, 5, 'Current', 9200.00, '2020-11-25', 'Miami'),
(6, 6, 'Savings', 6300.30, '2018-09-18', 'Boston'),
(7, 7, 'Current', 8300.10, '2023-02-22', 'Seattle'),
(8, 8, 'Savings', 2800.50, '2021-08-13', 'Denver'),
(9, 9, 'Current', 4500.90, '2020-04-15', 'Atlanta'),
(10, 10, 'Savings', 1500.00, '2019-12-01', 'Dallas'),
(11, 11, 'Savings', 3200.75, '2020-05-20', 'Austin'),
(12, 12, 'Current', 7200.00, '2022-03-05', 'Dallas'),
(13, 13, 'Savings', 8900.10, '2019-06-30', 'Denver'),
(14, 14, 'Current', 1500.50, '2021-01-12', 'Atlanta'),
(15, 15, 'Savings', 5600.00, '2020-10-10', 'Chicago'),
(16, 16, 'Savings', 2300.00, '2022-02-25', 'New York'),
(17, 17, 'Current', 9700.90, '2019-07-07', 'San Diego'),
(18, 18, 'Savings', 8100.50, '2021-11-22', 'Phoenix'),
(19, 19, 'Current', 4900.75, '2020-03-18', 'Houston'),
(20, 20, 'Savings', 2500.00, '2023-01-01', 'San Francisco'),
(21, 21, 'Savings', 3200.00, '2020-08-14', 'New York'),
(22, 22, 'Current', 4100.50, '2021-07-22', 'Chicago'),
(23, 23, 'Savings', 5900.75, '2020-10-05', 'Houston'),
(24, 24, 'Savings', 8600.00, '2022-04-16', 'San Francisco'),
(25, 25, 'Current', 6700.20, '2019-06-30', 'Miami'),
(26, 26, 'Savings', 2400.50, '2021-12-01', 'Boston'),
(27, 27, 'Current', 7500.00, '2023-03-10', 'Seattle'),
(28, 28, 'Savings', 1900.90, '2020-11-18', 'Denver'),
(29, 29, 'Current', 8900.00, '2019-09-24', 'Atlanta'),
(30, 30, 'Savings', 4500.50, '2021-02-28', 'Dallas'),
(31, 31, 'Savings', 7800.20, '2022-07-05', 'Austin'),
(32, 32, 'Current', 6300.00, '2020-06-12', 'Dallas'),
(33, 33, 'Savings', 5400.75, '2019-08-15', 'Denver'),
(34, 34, 'Current', 2900.50, '2021-05-20', 'Atlanta'),
(35, 35, 'Savings', 8700.00, '2020-09-11', 'Chicago'),
(36, 36, 'Savings', 6100.50, '2022-01-30', 'New York'),
(37, 37, 'Current', 9200.00, '2021-06-14', 'San Diego'),
(38, 38, 'Savings', 7600.50, '2019-10-09', 'Phoenix'),
(39, 39, 'Current', 3400.75, '2020-04-21', 'Houston'),
(40, 40, 'Savings', 5800.00, '2022-08-31', 'San Francisco'),
(41, 41, 'Savings', 6900.50, '2021-09-25', 'New York'),
(42, 42, 'Current', 4500.00, '2020-12-15', 'Chicago'),
(43, 43, 'Savings', 8100.75, '2019-03-28', 'Houston'),
(44, 44, 'Savings', 2500.50, '2021-10-19', 'San Francisco'),
(45, 45, 'Current', 7100.00, '2020-07-04', 'Miami'),
(46, 46, 'Savings', 3600.90, '2022-02-10', 'Boston'),
(47, 47, 'Current', 5200.50, '2019-11-22', 'Seattle'),
(48, 48, 'Savings', 4900.75, '2020-05-09', 'Denver'),
(49, 49, 'Current', 6600.00, '2021-04-12', 'Atlanta'),
(50, 50, 'Savings', 3100.50, '2023-01-20', 'Dallas'),
(51, 51, 'Savings', 4300.25, '2021-05-14', 'Los Angeles'),
(52, 52, 'Current', 7200.50, '2020-09-22', 'Chicago'),
(53, 53, 'Savings', 5600.75, '2019-08-05', 'Houston'),
(54, 54, 'Savings', 8300.00, '2022-03-16', 'San Francisco'),
(55, 55, 'Current', 6800.40, '2020-11-30', 'Miami'),
(56, 56, 'Savings', 2400.60, '2021-04-01', 'Boston'),
(57, 57, 'Current', 7900.00, '2018-12-10', 'Seattle'),
(58, 58, 'Savings', 2700.85, '2020-01-18', 'Denver'),
(59, 59, 'Current', 8400.00, '2021-08-24', 'Atlanta'),
(60, 60, 'Savings', 4700.50, '2022-05-28', 'Dallas'),
(61, 61, 'Savings', 6800.35, '2019-09-05', 'Austin'),
(62, 62, 'Current', 6500.00, '2020-02-12', 'Dallas'),
(63, 63, 'Savings', 5600.75, '2018-10-15', 'Denver'),
(64, 64, 'Current', 3100.40, '2022-06-20', 'Atlanta'),
(65, 65, 'Savings', 8700.20, '2020-07-11', 'Chicago'),
(66, 66, 'Savings', 6400.50, '2021-12-30', 'New York'),
(67, 67, 'Current', 9200.90, '2019-04-14', 'San Diego'),
(68, 68, 'Savings', 7100.50, '2020-03-09', 'Phoenix'),
(69, 69, 'Current', 3200.85, '2021-11-21', 'Houston'),
(70, 70, 'Savings', 5800.00, '2022-09-30', 'San Francisco'),
(71, 71, 'Savings', 7100.50, '2020-10-25', 'Los Angeles'),
(72, 72, 'Current', 4600.00, '2021-01-15', 'Chicago'),
(73, 73, 'Savings', 8200.75, '2020-02-28', 'Houston'),
(74, 74, 'Savings', 2900.50, '2022-11-19', 'San Francisco'),
(75, 75, 'Current', 7100.80, '2020-06-04', 'Miami'),
(76, 76, 'Savings', 3700.90, '2021-03-10', 'Boston'),
(77, 77, 'Current', 5300.50, '2019-08-22', 'Seattle'),
(78, 78, 'Savings', 5000.75, '2020-04-09', 'Denver'),
(79, 79, 'Current', 6800.10, '2021-07-12', 'Atlanta'),
(80, 80, 'Savings', 3200.50, '2023-02-20', 'Dallas'),
(81, 10, 'Savings', 4500.25, '2021-03-12', 'New York'),
(82, 10, 'Current', 7800.50, '2022-08-15', 'New York'),
(83, 20, 'Savings', 3100.40, '2019-05-22', 'Chicago'),
(84, 20, 'Current', 5400.75, '2021-11-05', 'Chicago'),
(85, 35, 'Savings', 8600.00, '2020-03-18', 'San Francisco'),
(86, 35, 'Current', 9200.85, '2022-09-30', 'San Francisco'),
(87, 42, 'Savings', 7100.90, '2021-02-14', 'Houston'),
(88, 42, 'Current', 4200.35, '2023-06-19', 'Houston'),
(89, 42, 'Savings', 3300.50, '2020-12-01', 'Austin'),
(90, 58, 'Savings', 5300.75, '2018-07-10', 'Denver'),
(91, 58, 'Current', 7800.20, '2022-05-25', 'Denver'),
(92, 58, 'Savings', 8900.00, '2023-01-12', 'Miami'),
(93, 63, 'Savings', 6100.40, '2020-06-14', 'Boston'),
(94, 63, 'Current', 2500.75, '2022-10-08', 'Boston'),
(95, 76, 'Savings', 7100.50, '2021-01-22', 'Los Angeles'),
(96, 76, 'Current', 4900.20, '2019-09-15', 'Los Angeles'),
(97, 76, 'Savings', 3300.85, '2022-04-30', 'Seattle'),
(98, 80, 'Savings', 4700.60, '2020-07-05', 'Atlanta'),
(99, 80, 'Current', 9200.10, '2021-12-12', 'Atlanta'),
(100, 80, 'Savings', 8200.90, '2023-02-25', 'Phoenix'),
(101, 15, 'Savings', 3600.40, '2020-03-18', 'Dallas'),
(102, 15, 'Current', 5800.30, '2022-01-20', 'Dallas'),
(103, 15, 'Savings', 4400.70, '2021-08-22', 'Austin'),
(104, 29, 'Savings', 5600.20, '2019-10-10', 'San Diego'),
(105, 29, 'Current', 8700.50, '2023-03-11', 'San Diego'),
(106, 52, 'Savings', 3800.25, '2020-05-09', 'Chicago'),
(107, 52, 'Current', 7500.90, '2021-11-06', 'Chicago'),
(108, 52, 'Savings', 6200.40, '2022-07-15', 'Houston'),
(109, 40, 'Savings', 3100.80, '2019-12-20', 'Phoenix'),
(110, 40, 'Current', 8200.50, '2023-04-01', 'Phoenix');

SELECT * FROM Customer_Account.Accounts;

-- Transaction Table:

INSERT INTO Customer_Account.Transactions (Transaction_ID, Account_ID, Transaction_Date, Transaction_Type, Amount, Transaction_Mode, Remarks)
VALUES
(1, 2, '2023-01-15', 'Deposit', 1500.00, 'Branch', 'Initial Deposit'),
(2, 2, '2023-02-10', 'Withdrawal', 500.00, 'ATM', 'ATM Cash Withdrawal'),
(3, 4, '2023-03-01', 'Deposit', 750.00, 'Mobile', 'Mobile Transfer'),
(4, 4, '2023-03-20', 'Withdrawal', 300.00, 'Branch', 'Utility Bill Payment'),
(5, 5, '2022-11-25', 'Deposit', 2500.00, 'Online', 'Online Transfer'),
(6, 5, '2023-01-10', 'Withdrawal', 1000.00, 'ATM', 'ATM Cash Withdrawal'),
(7, 5, '2023-02-15', 'Deposit', 2000.00, 'Branch', 'Salary Credit'),
(8, 7, '2023-04-05', 'Deposit', 3000.00, 'Online', 'Savings Deposit'),
(9, 7, '2023-05-01', 'Withdrawal', 500.00, 'Mobile', 'Mobile Bill Payment'),
(10, 10, '2022-12-15', 'Deposit', 1500.00, 'ATM', 'Initial Deposit'),
(11, 12, '2023-06-20', 'Withdrawal', 750.00, 'Branch', 'Rent Payment'),
(12, 14, '2023-02-25', 'Deposit', 2000.00, 'Online', 'Online Transfer'),
(13, 14, '2023-03-15', 'Deposit', 1000.00, 'Branch', 'Salary Credit'),
(14, 16, '2022-12-30', 'Deposit', 2300.00, 'Mobile', 'Savings Deposit'),
(15, 18, '2023-01-12', 'Withdrawal', 900.00, 'ATM', 'ATM Cash Withdrawal'),
(16, 18, '2023-02-22', 'Deposit', 3000.00, 'Branch', 'Bonus Credit'),
(17, 20, '2023-01-25', 'Deposit', 2500.00, 'Online', 'Savings Deposit'),
(18, 22, '2023-03-10', 'Withdrawal', 1500.00, 'Branch', 'Utility Bill Payment'),
(19, 24, '2023-04-15', 'Deposit', 4000.00, 'ATM', 'Initial Deposit'),
(20, 25, '2023-02-08', 'Deposit', 2200.00, 'Online', 'Savings Credit'),
(21, 25, '2023-03-10', 'Withdrawal', 1500.00, 'ATM', 'ATM Cash Withdrawal'),
(22, 28, '2023-03-18', 'Deposit', 1900.00, 'Branch', 'Initial Deposit'),
(23, 30, '2023-05-05', 'Withdrawal', 1200.00, 'Online', 'Bill Payment'),
(24, 35, '2023-06-10', 'Deposit', 5600.00, 'Branch', 'Salary Credit'),
(25, 36, '2023-05-15', 'Deposit', 6100.00, 'Mobile', 'Savings Deposit'),
(26, 37, '2023-03-28', 'Withdrawal', 2000.00, 'ATM', 'Cash Withdrawal'),
(27, 40, '2023-04-22', 'Deposit', 4000.00, 'Branch', 'Initial Deposit'),
(28, 40, '2023-05-12', 'Deposit', 1800.00, 'Online', 'Bonus Credit'),
(29, 45, '2023-06-30', 'Withdrawal', 1000.00, 'Mobile', 'Mobile Bill Payment'),
(30, 50, '2023-02-20', 'Deposit', 3100.00, 'ATM', 'Initial Deposit'),
(31, 50, '2023-04-18', 'Withdrawal', 800.00, 'Branch', 'Utility Bill Payment'),
(32, 52, '2023-03-05', 'Deposit', 2000.00, 'Branch', 'Initial Deposit'),
(33, 52, '2023-04-01', 'Withdrawal', 1500.00, 'ATM', 'Cash Withdrawal'),
(34, 53, '2023-01-25', 'Deposit', 3500.00, 'Online', 'Savings Deposit'),
(35, 55, '2023-02-15', 'Withdrawal', 1200.00, 'Mobile', 'Mobile Bill Payment'),
(36, 55, '2023-03-05', 'Deposit', 4000.00, 'Branch', 'Bonus Credit'),
(37, 56, '2022-12-20', 'Deposit', 2800.00, 'ATM', 'Initial Deposit'),
(38, 56, '2023-01-15', 'Withdrawal', 700.00, 'Mobile', 'Mobile Transfer'),
(39, 57, '2023-02-28', 'Deposit', 1500.00, 'Online', 'Online Transfer'),
(40, 58, '2023-04-10', 'Deposit', 3300.00, 'Branch', 'Salary Credit'),
(41, 58, '2023-05-01', 'Withdrawal', 800.00, 'ATM', 'Utility Payment'),
(42, 59, '2023-03-22', 'Deposit', 2500.00, 'Mobile', 'Savings Credit'),
(43, 60, '2023-02-18', 'Deposit', 2700.00, 'Online', 'Initial Deposit'),
(44, 61, '2023-06-12', 'Withdrawal', 1500.00, 'Branch', 'Loan Payment'),
(45, 62, '2023-01-10', 'Deposit', 3100.00, 'Mobile', 'Savings Deposit'),
(46, 62, '2023-02-05', 'Deposit', 2000.00, 'ATM', 'Bonus Credit'),
(47, 63, '2023-04-20', 'Withdrawal', 1200.00, 'Mobile', 'Mobile Transfer'),
(48, 64, '2023-06-15', 'Deposit', 2900.00, 'Online', 'Salary Credit'),
(49, 66, '2023-03-18', 'Deposit', 3500.00, 'Branch', 'Savings Deposit'),
(50, 66, '2023-05-22', 'Withdrawal', 1000.00, 'ATM', 'Bill Payment'),
(51, 68, '2023-02-25', 'Deposit', 2300.00, 'Mobile', 'Savings Deposit'),
(52, 68, '2023-04-10', 'Deposit', 4500.00, 'Online', 'Bonus Credit'),
(53, 69, '2023-01-15', 'Withdrawal', 2000.00, 'Branch', 'Loan Payment'),
(54, 70, '2023-03-12', 'Deposit', 3200.00, 'ATM', 'Initial Deposit'),
(55, 71, '2023-05-01', 'Withdrawal', 700.00, 'Mobile', 'Mobile Transfer'),
(56, 72, '2023-06-08', 'Deposit', 1700.00, 'Branch', 'Utility Payment'),
(57, 74, '2023-01-22', 'Deposit', 2800.00, 'Online', 'Savings Credit'),
(58, 75, '2023-02-12', 'Deposit', 3000.00, 'ATM', 'Initial Deposit'),
(59, 75, '2023-04-15', 'Withdrawal', 900.00, 'Mobile', 'Mobile Transfer'),
(60, 77, '2023-03-05', 'Deposit', 4000.00, 'Online', 'Salary Credit'),
(61, 78, '2023-01-18', 'Withdrawal', 600.00, 'Branch', 'Utility Bill Payment'),
(62, 79, '2023-02-20', 'Deposit', 4500.00, 'ATM', 'Savings Deposit'),
(63, 79, '2023-05-05', 'Deposit', 5000.00, 'Mobile', 'Bonus Credit'),
(64, 80, '2023-03-01', 'Withdrawal', 1300.00, 'Online', 'Loan Payment'),
(65, 81, '2023-06-10', 'Deposit', 2100.00, 'Branch', 'Utility Payment'),
(66, 82, '2023-02-18', 'Withdrawal', 800.00, 'Mobile', 'Mobile Bill Payment'),
(67, 83, '2023-03-20', 'Deposit', 1800.00, 'ATM', 'Initial Deposit'),
(68, 85, '2023-05-22', 'Deposit', 3600.00, 'Online', 'Savings Credit'),
(69, 86, '2023-04-18', 'Deposit', 2300.00, 'Mobile', 'Bonus Credit'),
(70, 87, '2023-01-15', 'Withdrawal', 900.00, 'Branch', 'Loan Payment');

SELECT * FROM Customer_Account.Transactions;

-- Step 1: Update the Accounts table
UPDATE Customer_Account.Accounts
SET Balance = (
    -- Step 2: Use a subquery to calculate the new balance
    SELECT 
        COALESCE(
            -- Step 3: Compute the total transaction amount (using CASE to handle different types)
            SUM(
                CASE
                    WHEN T.Transaction_Type = 'Deposit' THEN T.Amount -- Add deposit amounts
                    WHEN T.Transaction_Type = 'Withdrawal' THEN -T.Amount -- Subtract withdrawal amounts
                    ELSE 0 -- No change for other transaction types
                END
            ),
            0 -- Step 4: Use COALESCE to handle NULL sums (e.g., no transactions) by setting them to 0
        ) + Accounts.Balance  -- Step 5: Add the current account balance to the transaction total
    FROM Customer_Account.Transactions T -- Step 6: Reference the Transactions table to calculate transaction sums
    WHERE T.Account_ID = Customer_Account.Accounts.Account_ID -- Step 7: Match transactions to the corresponding account
);

-- Card Table

INSERT INTO Customer_Account.Cards (Card_ID, Account_ID, Card_Type, Card_Number, Expiry_Date, CVV, Issued_Date, Card_Status) VALUES
(1, 1, 'Debit', '1234567812345678', '2026-01-15', '123', '2020-01-15', 'Active'),
(2, 2, 'Credit', '2345678923456789', '2025-07-20', '456', '2019-07-20', 'Active'),
(3, 3, 'Debit', '3456789034567890', '2026-03-12', '789', '2021-03-12', 'Active'),
(4, 4, 'Debit', '4567890145678901', '2024-06-10', '321', '2022-06-10', 'Expired'),
(5, 5, 'Credit', '5678901256789012', '2025-11-25', '654', '2020-11-25', 'Active'),
(6, 6, 'Debit', '6789012367890123', '2024-09-18', '987', '2018-09-18', 'Expired'),
(7, 7, 'Credit', '7890123478901234', '2026-02-22', '111', '2023-02-22', 'Active'),
(8, 8, 'Debit', '8901234589012345', '2025-08-13', '222', '2021-08-13', 'Active'),
(9, 9, 'Credit', '9012345690123456', '2025-04-15', '333', '2020-04-15', 'Active'),
(10, 10, 'Debit', '0123456701234567', '2024-12-01', '444', '2019-12-01', 'Expired'),
(11, 11, 'Debit', '1234567811123456', '2026-05-20', '555', '2020-05-20', 'Active'),
(12, 12, 'Credit', '2345678922123457', '2025-03-05', '666', '2022-03-05', 'Active'),
(13, 13, 'Debit', '3456789033123458', '2026-06-30', '777', '2019-06-30', 'Active'),
(14, 14, 'Credit', '4567890144123459', '2025-01-12', '888', '2021-01-12', 'Active'),
(15, 15, 'Debit', '5678901255123460', '2024-10-10', '999', '2020-10-10', 'Expired'),
(16, 16, 'Debit', '6789012366123461', '2026-02-25', '123', '2022-02-25', 'Active'),
(17, 17, 'Credit', '7890123477123462', '2025-07-07', '234', '2019-07-07', 'Active'),
(18, 18, 'Debit', '8901234588123463', '2025-11-22', '345', '2021-11-22', 'Active'),
(19, 19, 'Credit', '9012345699123464', '2026-03-18', '456', '2020-03-18', 'Active'),
(20, 20, 'Debit', '0123456710123465', '2024-01-01', '567', '2023-01-01', 'Expired'),
(21, 25, 'Credit', '1234567822123466', '2026-12-30', '678', '2021-09-10', 'Active'),
(22, 30, 'Debit', '2345678933123467', '2025-10-20', '789', '2020-10-20', 'Active'),
(23, 35, 'Credit', '3456789044123468', '2026-07-10', '321', '2021-07-10', 'Active'),
(24, 40, 'Debit', '4567890155123469', '2024-08-31', '654', '2022-08-31', 'Expired'),
(25, 50, 'Debit', '5678901266123470', '2025-01-20', '987', '2023-01-20', 'Active'),
(26, 55, 'Credit', '6789012377123471', '2024-11-30', '111', '2020-11-30', 'Expired'),
(27, 60, 'Debit', '7890123488123472', '2025-05-28', '222', '2022-05-28', 'Active'),
(28, 66, 'Credit', '8901234599123473', '2026-12-30', '333', '2021-12-30', 'Active'),
(29, 70, 'Debit', '9012345610123474', '2024-09-30', '444', '2022-09-30', 'Expired'),
(30, 75, 'Debit', '0123456721123475', '2025-06-04', '555', '2021-06-04', 'Active'),
(31, 80, 'Credit', '1234567832123476', '2024-04-15', '666', '2023-04-15', 'Expired'),
(32, 52, 'Debit', '2345678943123477', '2026-09-22', '777', '2020-09-22', 'Active'),
(33, 22, 'Credit', '3456789054123478', '2025-07-22', '888', '2021-07-22', 'Active'),
(34, 18, 'Debit', '4567890165123479', '2026-05-15', '999', '2021-05-15', 'Active'),
(35, 9, 'Credit', '5678901276123480', '2025-08-24', '123', '2020-08-24', 'Active'),
(36, 12, 'Debit', '1234567845123481', '2026-02-20', '123', '2022-02-20', 'Active'),
(37, 15, 'Credit', '2345678956123482', '2025-05-10', '234', '2021-05-10', 'Active'),
(38, 25, 'Debit', '3456789067123483', '2024-12-15', '345', '2020-12-15', 'Expired'),
(39, 33, 'Credit', '4567890178123484', '2026-07-01', '456', '2022-07-01', 'Active'),
(40, 44, 'Debit', '5678901289123485', '2025-10-25', '567', '2021-10-25', 'Active'),
(41, 47, 'Credit', '6789012390123486', '2024-03-15', '678', '2020-03-15', 'Expired'),
(42, 53, 'Debit', '7890123401123487', '2026-01-30', '789', '2022-01-30', 'Active'),
(43, 62, 'Credit', '8901234512123488', '2025-08-20', '111', '2021-08-20', 'Active'),
(44, 67, 'Debit', '9012345623123489', '2024-07-05', '222', '2020-07-05', 'Expired'),
(45, 69, 'Credit', '0123456734123490', '2026-11-10', '333', '2022-11-10', 'Active'),
(46, 72, 'Debit', '1234567845123491', '2025-09-12', '444', '2021-09-12', 'Active'),
(47, 74, 'Credit', '2345678956123492', '2024-05-30', '555', '2020-05-30', 'Expired'),
(48, 78, 'Debit', '3456789067123493', '2026-03-18', '666', '2022-03-18', 'Active'),
(49, 79, 'Credit', '4567890178123494', '2025-07-22', '777', '2021-07-22', 'Active'),
(50, 80, 'Debit', '5678901289123495', '2026-06-15', '888', '2022-06-15', 'Active');


SELECT * FROM Customer_Account.Cards;

-- Documents Table:
INSERT INTO Customer_Account.Documents (Document_ID, Document_Type, Associated_With, Associated_ID, Upload_Date, Expiry_Date, Verified)
VALUES
(1, 'Proof of Identity', 'Customer', 1, '2022-01-15', NULL, 'Yes'),
(2, 'Proof of Address', 'Customer', 2, '2022-02-20', NULL, 'Yes'),
(3, 'Loan Agreement', 'Loan', 101, '2023-03-05', '2026-03-05', 'Yes'),
(4, 'Mortgage Deed', 'Loan', 102, '2022-10-12', '2032-10-12', 'No'),
(5, 'Tax Returns', 'Customer', 3, '2023-06-18', NULL, 'Yes'),
(6, 'Proof of Employment', 'Loan', 103, '2023-04-25', NULL, 'Yes'),
(7, 'Account Opening Form', 'Account', 1001, '2022-11-01', NULL, 'Yes'),
(8, 'Signature Specimen', 'Customer', 4, '2022-09-10', NULL, 'Yes'),
(9, 'KYC Form', 'Customer', 5, '2023-01-01', NULL, 'No'),
(10, 'Guarantor Statement', 'Loan', 104, '2023-05-12', NULL, 'Yes'),
(11, 'Proof of Business', 'Loan', 105, '2023-07-20', NULL, 'No'),
(12, 'Insurance Policy', 'Loan', 106, '2022-12-15', '2027-12-15', 'Yes'),
(13, 'Credit Report', 'Customer', 6, '2023-03-10', NULL, 'Yes'),
(14, 'Branch Establishment Certificate', 'Branch', 1, '1990-05-12', NULL, 'Yes'),
(15, 'Branch License', 'Branch', 2, '1985-07-20', '2035-07-20', 'Yes'),
(16, 'Customer Declaration Form', 'Customer', 7, '2023-08-25', NULL, 'No'),
(17, 'Power of Attorney', 'Loan', 107, '2023-02-10', '2030-02-10', 'Yes'),
(18, 'Passport Copy', 'Customer', 8, '2023-09-15', NULL, 'Yes'),
(19, 'PAN Card Copy', 'Customer', 9, '2023-04-01', NULL, 'Yes'),
(20, 'Property Valuation Report', 'Loan', 108, '2023-06-05', NULL, 'No'),
(21, 'Proof of Tax Payment', 'Loan', 109, '2022-11-20', NULL, 'Yes'),
(22, 'Driver’s License', 'Customer', 10, '2023-02-22', NULL, 'Yes'),
(23, 'Loan Pre-Approval Letter', 'Loan', 110, '2023-03-01', NULL, 'Yes'),
(24, 'Bank Statement', 'Customer', 11, '2023-05-15', NULL, 'Yes'),
(25, 'Employment Contract', 'Loan', 111, '2023-01-12', NULL, 'Yes'),
(26, 'Birth Certificate', 'Customer', 12, '2023-07-10', NULL, 'No'),
(27, 'National ID Card', 'Customer', 13, '2023-08-15', NULL, 'Yes'),
(28, 'Business Registration Certificate', 'Loan', 112, '2022-09-30', NULL, 'Yes'),
(29, 'Credit Card Agreement', 'Account', 2001, '2023-06-25', NULL, 'No'),
(30, 'Debit Card Agreement', 'Account', 2002, '2023-07-10', NULL, 'Yes');

SELECT * FROM Customer_Account.Documents;

-- TASK:
-- 1. Round off all balances in accounts to zero decimal places:

UPDATE Customer_Account.Accounts
SET Balance = ROUND(Balance, 0);

SELECT Account_ID, Balance
FROM Customer_Account.Accounts;

-- 2. Generate a substring from the Transaction_Mode column (e.g., first 5 characters):

SELECT SUBSTRING(Transaction_Mode, 1, 5) AS Transaction_Mode_Substring
FROM Customer_Account.Transactions;

-- 3. Check if the Customer_Email field contains '@bank.com' using string functions:

SELECT Customer_ID, Email
FROM Customer_Account.Customers
WHERE Email LIKE '%@bank.com%';

-- 4. Get the current system date and time using system functions:

SELECT CURRENT_TIMESTAMP;

-- 5. Format the Opening_Date of accounts in ‘YYYY-MM-DD’ format:

SELECT TO_CHAR(Opening_Date, 'YYYY-MM-DD') AS Formatted_Opening_Date
FROM Customer_Account.Accounts;

-- 6. Return the ASCII value of the first character in Manager_Name:

SELECT ASCII(SUBSTRING(Manager_Name, 1, 1)) AS First_Char_ASCII
FROM Branch_Operations.Branches;

-- 7. Calculate the age of customers based on their date of birth:

SELECT Customer_ID, 
       FLOOR((CURRENT_DATE - Date_Of_Birth) / 365.25) AS Age
FROM Customer_Account.Customers;

-- 8. Verify the Phone_Number after replacing all non-numeric characters:

SELECT Customer_ID, 
       Phone_Number, 
       REGEXP_REPLACE(Phone_Number::TEXT, '[^0-9]', '', 'g') AS Cleaned_Phone_Number
FROM Customer_Account.Customers;


-- 3. Joins

-- 1. Find all customers with no uploaded documents (Outer Join):

SELECT c.Customer_ID, c.Name
FROM Customer_Account.Customers c
LEFT JOIN Customer_Account.Documents d 
    ON c.Customer_ID = d.Associated_ID AND d.Associated_With = 'Customer'
WHERE d.Document_ID IS NULL;

-- 2. List products that have been launched in branches located in a specific city (Inner Join):

SELECT p.Product_ID, p.Product_Name, b.City
FROM Customer_Offerings.Products p
INNER JOIN Branch_Operations.Branches b ON p.Branch_ID = b.Branch_ID
WHERE b.City = 'Specific City';

-- 3. Fetch the total transaction amount per branch using Joins:

SELECT b.Branch_ID, b.Branch_Name, SUM(t.Amount) AS Total_Transaction_Amount
FROM Branch_Operations.Branches b
INNER JOIN Customer_Account.Accounts a ON b.Branch_ID = b.Branch_ID
INNER JOIN Customer_Account.Transactions t ON a.Account_ID = t.Account_ID
GROUP BY b.Branch_ID, b.Branch_Name;


SELECT column_name
FROM information_schema.columns
WHERE table_name = 'Accounts' AND table_schema = 'Customer_Account';



-- 4. Identify customers with active insurance and active accounts using multiple Joins:

SELECT DISTINCT c.Customer_ID, c.Name
FROM Customer_Account.Customers c
INNER JOIN Customer_Account.Accounts a ON c.Customer_ID = a.Customer_ID AND a.Account_Type = 'Current'
INNER JOIN Customer_Offerings.Insurance i ON c.Customer_ID = i.Customer_ID AND i.Policy_Status = 'Active';

-- 6. List all accounts and their respective branch managers (Inner Join):

SELECT a.Account_ID, a.Account_Type, b.Branch_Name, m.Manager_Name
FROM Customer_Account.Accounts a
INNER JOIN Branch_Operations.Branches b ON b.Branch_ID = b.Branch_ID
INNER JOIN Branch_Operations.Branches m ON b.Manager_Name = m.Manager_Name;


-- 8. Fetch customers who have both loans and active insurance policies (Inner Join):

SELECT DISTINCT c.Customer_ID, c.Name
FROM Customer_Account.Customers c
INNER JOIN  Customer_Offerings.Loans l ON c.Customer_ID = l.Customer_ID
INNER JOIN  Customer_Offerings.Insurance i ON c.Customer_ID = i.Customer_ID AND i.Policy_Status = 'Active';

-- Task 4: Subqueries

-- 9. Get a list of customers with no active accounts:

SELECT c.Customer_ID, c.Name
FROM Customer_Account.Customers c
LEFT JOIN Customer_Account.Accounts a ON c.Customer_ID = a.Customer_ID
WHERE a.Account_Type != 'Active' OR a.Customer_ID IS NULL;

-- 10. Find employees hired after the most recent branch establishment date:

SELECT e.Employee_ID, e.Name
FROM Branch_Operations.Employees e
WHERE e.Hire_Date > (
    SELECT MAX(b.Established_Date)
    FROM Branch_Operations.Branches b
);
-- 11. Fetch accounts opened in branches with fewer than 10 employees:

SELECT a.Account_ID, a.Account_Type, b.Branch_Name
FROM Customer_Account.Accounts a
INNER JOIN Branch_Operations.Branches b ON b.Branch_ID = b.Branch_ID
WHERE (
    SELECT COUNT(*)
    FROM Branch_Operations.Employees e
    WHERE e.Branch_ID = b.Branch_ID
) < 10;

-- 12. Identify insurance policies with coverage amounts greater than the maximum loan amount:

SELECT i.Policy_ID, i.Coverage_Amount
FROM Customer_Offerings.Insurance i
WHERE i.Coverage_Amount > (
    SELECT MAX(l.Loan_Amount)
    FROM Customer_Offerings.Loans l
);
-- 13. List all customers who have not uploaded documents:

SELECT c.Customer_ID, c.Name
FROM Customer_Account.Customers c
LEFT JOIN Customer_Account.Documents d ON c.Customer_ID = d.Associated_ID
WHERE d.Document_ID IS NULL;

-- 14. Fetch branches where total transactions exceed 10 million:

SELECT b.Branch_ID, b.Branch_Name
FROM Branch_Operations.Branches b
INNER JOIN Customer_Account.Transactions t ON b.Branch_ID = b.Branch_ID
GROUP BY b.Branch_ID, b.Branch_Name
HAVING SUM(t.Amount) > 10000000;

-- 16. Get the names of customers whose total loan amount is below their account balance:

SELECT c.Name
FROM Customer_Account.Customers c
INNER JOIN Customer_Account.Accounts a ON c.Customer_ID = a.Customer_ID
INNER JOIN Customer_Offerings.Loans l ON c.Customer_ID = l.Customer_ID
GROUP BY c.Customer_ID
HAVING SUM(l.Loan_Amount) < SUM(a.Balance);

--Task 5. Over Clause:

-- Assign ranks to customers based on the total balance in their accounts:

SELECT Customer_ID, SUM(Balance) AS Total_Balance,
       RANK() OVER (ORDER BY SUM(Balance) DESC) AS Rank
FROM Customer_Account.Accounts
GROUP BY Customer_ID;

-- Calculate the cumulative premium amount collected for each insurance type:

SELECT Policy_Type, Premium_Amount,
       SUM(Premium_Amount) OVER (PARTITION BY Policy_Type ORDER BY Coverage_Amount) AS Cumulative_Premium
FROM  Customer_Offerings.Insurance;

-- Determine the difference between an employee's salary and the average salary of their branch:

SELECT Employee_ID, Branch_ID, Salary,
       Salary - AVG(Salary) OVER (PARTITION BY Branch_ID) AS Salary_Difference
FROM Branch_Operations.Employees;

-- Assign a row number to each document uploaded by customers:
SELECT Associated_ID, Document_ID, Upload_Date,
       ROW_NUMBER() OVER (PARTITION BY Associated_ID ORDER BY Upload_Date) AS Row_Number
FROM Customer_Account.Documents;

-- Calculate the running total of coverage amounts for active insurance policies:

SELECT Policy_ID, Coverage_Amount,
       SUM(Coverage_Amount) OVER (PARTITION BY Policy_Status ORDER BY Start_Date) AS Running_Total_Coverage
FROM Customer_Offerings.Insurance
WHERE Policy_Status = 'Active';

-- Rank products within each branch based on their Launch_Date:

SELECT Product_ID, Branch_ID, Launch_Date,
       RANK() OVER (PARTITION BY Branch_ID ORDER BY Launch_Date) AS Product_Rank
FROM Customer_Offerings.Products;

-- Fetch the cumulative sum of salaries in each branch:

SELECT Branch_ID, Salary,
       SUM(Salary) OVER (PARTITION BY Branch_ID ORDER BY Employee_ID) AS Cumulative_Salary
FROM Branch_Operations.Employees;

--Task: 6. RANK(), DENSE_RANK(), ROW_NUMBER()

-- 9. Assign row numbers to employees based on their hire dates for each branch:

SELECT Employee_ID, Branch_ID, Hire_Date,
       ROW_NUMBER() OVER (PARTITION BY Branch_ID ORDER BY Hire_Date) AS Row_Num
FROM Branch_Operations.Employees;

-- 10. Rank insurance policies by their coverage amount using RANK():

SELECT Policy_ID, Policy_Type, Coverage_Amount,
       RANK() OVER (ORDER BY Coverage_Amount DESC) AS Rank
FROM Customer_Offerings.Insurance;

-- 11. Assign dense ranks to branches based on the total number of products they offer:

SELECT Branch_ID, COUNT(Product_ID) AS Total_Products,
       DENSE_RANK() OVER (ORDER BY COUNT(Product_ID) DESC) AS Dense_Rank
FROM  Customer_Offerings.Products
GROUP BY Branch_ID;
-- 12. Rank products within each branch by their Launch_Date using DENSE_RANK():

SELECT Product_ID, Branch_ID, Launch_Date,
       DENSE_RANK() OVER (PARTITION BY Branch_ID ORDER BY Launch_Date) AS Product_Rank
FROM Customer_Offerings.Products;

-- 14. Rank accounts by their Opening_Date for each Account_Type using RANK():

SELECT Account_ID, Account_Type, Opening_Date,
       RANK() OVER (PARTITION BY Account_Type ORDER BY Opening_Date) AS Account_Rank
FROM Customer_Account.Accounts;

-- 15. Assign dense ranks to customers based on the total number of transactions:

SELECT Account_ID, COUNT(Transaction_ID) AS Total_Transactions,
       DENSE_RANK() OVER (ORDER BY COUNT(Transaction_ID) DESC) AS Customer_Rank
FROM Customer_Account.Transactions
GROUP BY Account_ID;
-- 16. Rank employees within each branch by their Hire_Date using RANK():

SELECT Employee_ID, Branch_ID, Hire_Date,
       RANK() OVER (PARTITION BY Branch_ID ORDER BY Hire_Date) AS Employee_Rank
FROM Branch_Operations.Employees;

-- Task:7. Aggregate Functions with PARTITION BY

-- 9. Determine the total coverage amount of policies for each customer:

SELECT Customer_ID, 
       SUM(Coverage_Amount) AS Total_Coverage_Amount
FROM Customer_Offerings.Insurance
GROUP BY Customer_ID;
-- 10. Find the minimum balance for accounts partitioned by Account_Type:

SELECT Account_ID, Account_Type, Balance,
       MIN(Balance) OVER (PARTITION BY Account_Type) AS Min_Balance
FROM Customer_Account.Accounts;
-- 11. Calculate the count of accounts for each branch using PARTITION BY:

SELECT Branch_Name, Account_ID,
       COUNT(Account_ID) OVER (PARTITION BY Branch_Name) AS Account_Count
FROM Customer_Account.Accounts;
-- 12. Fetch the total transaction amounts grouped by Transaction_Mode:

SELECT Transaction_Mode,
       SUM(Amount) AS Total_Transaction_Amount
FROM Customer_Account.Transactions
GROUP BY Transaction_Mode;
-- 13. Determine the average salary for employees partitioned by their position:

SELECT Employee_ID, Position, Salary,
       AVG(Salary) OVER (PARTITION BY Position) AS Avg_Salary
FROM Branch_Operations.Employees;

-- Task:9. Views
-- 9. Create a View to Show Total Transaction Amounts per Account

CREATE VIEW TotalTransactionAmounts AS
SELECT Account_ID, SUM(Amount) AS Total_Amount
FROM Customer_Account.Transactions
GROUP BY Account_ID;

SELECT * FROM TotalTransactionAmounts;
-- 10. Create a View for Customers with Active Insurance Policies
CREATE VIEW ActiveInsuranceCustomers AS
SELECT DISTINCT c.Customer_ID, c.Name, i.Policy_ID, i.Policy_Type, i.Start_Date, i.End_Date
FROM Customer_Account.Customers c
JOIN Customer_Offerings.Insurance i ON c.Customer_ID = i.Customer_ID
WHERE i.Policy_Status = 'Active';


SELECT * FROM ActiveInsuranceCustomers;
-- 11. Fetch Data from a View Showing Employees Earning Above the Branch Average Salary
CREATE VIEW EmployeesAboveBranchAvgSalary AS
SELECT e.Employee_ID, e.Name, e.Salary, e.Branch_ID
FROM Branch_Operations.Employees e
JOIN (
    SELECT Branch_ID, AVG(Salary) AS Avg_Salary
    FROM Branch_Operations.Employees
    GROUP BY Branch_ID
) b_avg ON e.Branch_ID = b_avg.Branch_ID
WHERE e.Salary > b_avg.Avg_Salary;

SELECT * FROM EmployeesAboveBranchAvgSalary;
-- 12. Create a View for Accounts with Multiple Uploaded Documents

CREATE VIEW AccountsWithMultipleDocuments AS
SELECT Associated_ID, COUNT(Document_ID) AS Document_Count
FROM Customer_Account.Documents
GROUP BY Associated_ID
HAVING COUNT(Document_ID) > 1;

SELECT * FROM AccountsWithMultipleDocuments;
-- 13. Create a View Showing Products Launched After 2020

CREATE VIEW ProductsLaunchedAfter2020 AS
SELECT Product_ID, Product_Name, Launch_Date
FROM Customer_Offerings.Products
WHERE Launch_Date > '2020-01-01';

SELECT * FROM ProductsLaunchedAfter2020;

-- Task:10. Indexing

-- 9. Create a Filtered Index for Transaction_Mode = 'Online'

CREATE INDEX idx_TransactionMode_Online
ON Customer_Account.Transactions (Transaction_Mode)
WHERE Transaction_Mode = 'Online';
-- 10. Create an Index on Policy_Type in the Insurance Table

CREATE INDEX idx_PolicyType
ON Customer_Offerings.Insurance (Policy_Type);

-- 12. Drop an Existing Index on Phone_Number in the Customers Table

DROP INDEX idx_PhoneNumber
ON Customer_Account.Customers;
-- 13. Create a Unique Index on Card_Status in the Cards Table

CREATE UNIQUE INDEX idx_CardStatus_Unique
ON Cards (Card_Status);