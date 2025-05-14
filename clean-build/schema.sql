-- Customers
CREATE TABLE Customer (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20)
);

-- Reservations
CREATE TABLE Reservation (
    reservation_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    start_date DATE,
    end_date DATE,
    total_price DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);

-- Packages
CREATE TABLE Package (
    package_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    price DECIMAL(10, 2),
    type VARCHAR(50)
);

-- Skipasses
CREATE TABLE Skipass (
    skipass_id INT AUTO_INCREMENT PRIMARY KEY,
    type VARCHAR(50),
    duration_days INT,
    price DECIMAL(10, 2)
);

-- Reservation <-> Package (many-to-many)
CREATE TABLE ReservationPackage (
    reservation_id INT,
    package_id INT,
    PRIMARY KEY (reservation_id, package_id),
    FOREIGN KEY (reservation_id) REFERENCES Reservation(reservation_id),
    FOREIGN KEY (package_id) REFERENCES Package(package_id)
);

-- Reservation <-> Skipass (many-to-many)
CREATE TABLE ReservationSkipass (
    reservation_id INT,
    skipass_id INT,
    PRIMARY KEY (reservation_id, skipass_id),
    FOREIGN KEY (reservation_id) REFERENCES Reservation(reservation_id),
    FOREIGN KEY (skipass_id) REFERENCES Skipass(skipass_id)
);