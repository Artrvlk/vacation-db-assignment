-- Customers
INSERT INTO Customer (name, email, phone) VALUES
('Alice Miller', 'alice@example.com', '123-456-7890'),
('Bob Smith', 'bob@example.com', '234-567-8901'),
('Charlie Johnson', 'charlie@example.com', '345-678-9012'),
('Diana Prince', 'diana@example.com', '456-789-0123'),
('Eve Adams', 'eve@example.com', '567-890-1234'),
('Frank Castle', 'frank@example.com', '678-901-2345'),
('Grace Lee', 'grace@example.com', '789-012-3456'),
('Hank Pym', 'hank@example.com', '890-123-4567'),
('Ivy Walker', 'ivy@example.com', '901-234-5678'),
('Jack Reacher', 'jack@example.com', '012-345-6789');

-- Packages
INSERT INTO Package (name, price, type) VALUES
('Ski Beginner Pack', 120.00, 'Beginner'),
('Ski Pro Pack', 250.00, 'Advanced'),
('Snowboard Fun', 150.00, 'Intermediate'),
('Family Winter Deal', 400.00, 'Family'),
('Weekend Blast', 180.00, 'Weekend');

-- Skipasses
INSERT INTO Skipass (type, duration_days, price) VALUES
('Basic', 1, 30.00),
('Standard', 3, 75.00),
('Premium', 5, 110.00),
('Weekend', 2, 50.00),
('Family', 7, 150.00);

-- Reservations
INSERT INTO Reservation (customer_id, start_date, end_date, total_price) VALUES
(1, '2025-12-01', '2025-12-05', 480.00),
(2, '2025-12-10', '2025-12-12', 300.00),
(3, '2026-01-01', '2026-01-07', 700.00),
(4, '2025-12-20', '2025-12-25', 600.00),
(5, '2026-01-10', '2026-01-15', 550.00),
(6, '2025-12-15', '2025-12-17', 200.00),
(7, '2026-01-05', '2026-01-08', 330.00),
(8, '2026-01-11', '2026-01-13', 290.00),
(9, '2025-12-28', '2026-01-02', 580.00),
(10, '2025-12-05', '2025-12-08', 310.00);

-- ReservationPackage links
INSERT INTO ReservationPackage (reservation_id, package_id) VALUES
(1, 1), (1, 5),
(2, 2),
(3, 4),
(4, 3),
(5, 4),
(6, 1),
(7, 2),
(8, 3),
(9, 5),
(10, 1);

-- ReservationSkipass links
INSERT INTO ReservationSkipass (reservation_id, skipass_id) VALUES
(1, 2),
(2, 3),
(3, 5),
(4, 4),
(5, 1),
(6, 2),
(7, 2),
(8, 1),
(9, 3),
(10, 4);