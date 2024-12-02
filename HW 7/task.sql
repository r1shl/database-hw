-- Q1

CREATE VIEW samsBills AS
SELECT first_name, surname, bill_date, cust_name, bill_total
FROM restBill B
JOIN restStaff S ON B.waiter_no = S.staff_no
WHERE first_name = "Sam" AND surname = "Pitt";

-- Q2

SELECT * 
FROM samsBills
WHERE bill_total > 400;

-- Q3

CREATE VIEW roomTotals AS
SELECT RM.room_name, SUM(bill_total) AS total_sum
FROM restRoom_management RM
JOIN restRest_table RT ON RM.room_name = RT.room_name
JOIN restBill B ON RT.table_no = B.table_no
GROUP BY RM.room_name;

-- Q4

CREATE VIEW teamTotals AS
SELECT CONCAT(S1.first_name, ' ', S1.surname) AS headwaiter_name, 
    SUM(bill_total) AS total_sum
FROM restStaff S1
JOIN restStaff S2 ON S1.staff_no = S2.headwaiter
JOIN restBill B ON S2.staff_no = B.waiter_no
GROUP BY S1.staff_no, S1.first_name, S1.surname;