-- task 1
SELECT s.first_name, s.surname, b.bill_date, COUNT(b.bill_no) AS num_bills
FROM restBill b
JOIN restStaff s ON b.waiter_no = s.staff_no
GROUP BY s.staff_no, b.bill_date
HAVING COUNT(b.bill_no) >= 2;


 -- task 2
SELECT r.room_name, COUNT(t.table_no) AS num_large_tables
FROM restRest_table t
JOIN restRoom_management r ON t.room_name = r.room_name
WHERE t.no_of_seats > 6
GROUP BY r.room_name;


-- task 3
SELECT r.room_name, SUM(b.bill_total) AS total_bills
FROM restBill b
JOIN restRest_table t ON b.table_no = t.table_no
JOIN restRoom_management r ON t.room_name = r.room_name
GROUP BY r.room_name;


-- task 4
SELECT s.first_name AS headwaiter_first_name, s.surname AS headwaiter_surname, SUM(b.bill_total) AS total_bill_amount
FROM restRoom_management rm
JOIN restStaff s ON rm.headwaiter = s.staff_no
JOIN restRest_table t ON rm.room_name = t.room_name
JOIN restBill b ON t.table_no = b.table_no
GROUP BY s.staff_no
ORDER BY total_bill_amount DESC;


-- task 5
SELECT b.cust_name, AVG(b.bill_total) AS avg_spent
FROM restBill b
GROUP BY b.cust_name
HAVING AVG(b.bill_total) > 400;


-- task 6
SELECT s.first_name, s.surname, COUNT(b.bill_no) AS num_bills
FROM restBill b
JOIN restStaff s ON b.waiter_no = s.staff_no
GROUP BY s.staff_no, b.bill_date
HAVING COUNT(b.bill_no) >= 3;