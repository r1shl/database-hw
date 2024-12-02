-- task 1
    
SELECT DISTINCT b.cust_name
FROM restBill b
JOIN restRoom_management rm ON b.table_no IN (
    SELECT table_no 
    FROM restRest_table 
    WHERE room_name = rm.room_name
)
JOIN restStaff s ON rm.headwaiter = s.staff_no
WHERE b.bill_total > 450.00 AND s.first_name = 'Charles';

-- task 2

SELECT s.first_name, s.surname
FROM restRoom_management rm
JOIN restStaff s ON rm.headwaiter = s.staff_no
WHERE rm.room_name = (
    SELECT r.room_name
    FROM restRest_table r
    JOIN restBill b ON r.table_no = b.table_no
    WHERE b.cust_name = 'Nerida Smith' AND b.bill_date = 160111
);

-- task 3

SELECT cust_name
FROM restBill
WHERE bill_total = (
    SELECT MIN(bill_total)
    FROM restBill
);


-- task 4

SELECT s.first_name, s.surname
FROM restStaff s
WHERE s.staff_no NOT IN (
    SELECT DISTINCT waiter_no
    FROM restBill
);


-- task 5

SELECT b.cust_name, s.first_name AS headwaiter_first_name, s.surname AS headwaiter_surname, r.room_name
FROM restBill b
JOIN restRest_table t ON b.table_no = t.table_no
JOIN restRoom_management r ON t.room_name = r.room_name AND b.bill_date = r.room_date
JOIN restStaff s ON r.headwaiter = s.staff_no
WHERE b.bill_total = (
    SELECT MAX(bill_total)
    FROM restBill
);