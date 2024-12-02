-- 1

SELECT s.first_name, s.surname 
FROM restStaff s
JOIN restBill b ON s.staff_no = b.waiter_no
WHERE b.cust_name = 'Tanya Singh';

-- 2
SELECT rm.room_date 
FROM restRoom_management rm
JOIN restStaff s ON rm.headwaiter = s.staff_no
WHERE s.first_name = 'Charles' 
  AND rm.room_name = 'Green' 
  AND rm.room_date BETWEEN 160201 AND 160229;

-- 3

SELECT s.first_name, s.surname 
FROM restStaff s
WHERE s.headwaiter = (SELECT headwaiter FROM restStaff WHERE first_name = 'Zoe' AND surname = 'Ball');

-- 4

SELECT b.cust_name, b.bill_total AS amount_spent, s.first_name AS waiter_first_name, s.surname AS waiter_surname
FROM restBill b
JOIN restStaff s ON b.waiter_no = s.staff_no
ORDER BY amount_spent DESC;

-- 5

SELECT DISTINCT s.first_name, s.surname 
FROM restStaff s
JOIN restBill b1 ON s.staff_no = b1.waiter_no
JOIN restBill b2 ON b1.table_no = b2.table_no
WHERE b2.bill_no IN (14, 17);

-- 6
SELECT DISTINCT s.first_name, s.surname 
FROM restStaff s
WHERE s.staff_no IN (
    SELECT headwaiter FROM restRoom_management 
    WHERE room_name = 'Blue' AND room_date = 160312
    UNION
    SELECT waiter_no FROM restBill 
    WHERE table_no IN (SELECT table_no FROM restRest_table WHERE room_name = 'Blue')
      AND bill_date = 160312
);