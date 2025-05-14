-- 1. Customers with future reservations that include a skipass
SELECT c.name,
       SUM(DATEDIFF(r.end_date, r.start_date)) AS total_nights
FROM Customer c
JOIN Reservation r ON c.customer_id = r.customer_id
JOIN ReservationSkipass rs ON r.reservation_id = rs.reservation_id
WHERE r.start_date > CURDATE()
GROUP BY c.name
ORDER BY total_nights DESC;

-- 2. Most booked package
SELECT p.name, COUNT(*) AS total_booked
FROM Package p
JOIN ReservationPackage rp ON p.package_id = rp.package_id
GROUP BY p.package_id
ORDER BY total_booked DESC
LIMIT 1;

-- 3. Reservations with price above 500
SELECT * FROM Reservation
WHERE total_price > 500;

-- 4. Total revenue from packages in Dec 2025 – Jan 2026
SELECT SUM(p.price) AS revenue
FROM Reservation r
JOIN ReservationPackage rp ON r.reservation_id = rp.reservation_id
JOIN Package p ON rp.package_id = p.package_id
WHERE r.start_date BETWEEN '2025-12-01' AND '2026-01-31';

-- 5. Skipasses booked more than once
SELECT s.type, COUNT(*) AS total
FROM Skipass s
JOIN ReservationSkipass rs ON s.skipass_id = rs.skipass_id
GROUP BY s.skipass_id
HAVING COUNT(*) > 1;

-- 6. Customers who booked both package and skipass
SELECT DISTINCT c.name
FROM Customer c
JOIN Reservation r ON c.customer_id = r.customer_id
JOIN ReservationPackage rp ON r.reservation_id = rp.reservation_id
JOIN ReservationSkipass rs ON r.reservation_id = rs.reservation_id;