CREATE TABLE Customer (
    customer_id SERIAL PRIMARY KEY,
    name TEXT,
    email TEXT UNIQUE,
    phone TEXT
);


CREATE TABLE Reservation (
    reservation_id SERIAL PRIMARY KEY,
    customer_id INTEGER,
    start_date DATE,
    end_date DATE,
    total_price NUMERIC(10, 2),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);


CREATE TABLE Package (
    package_id SERIAL PRIMARY KEY,
    name TEXT,
    price NUMERIC(10, 2),
    type TEXT
);


CREATE TABLE Skipass (
    skipass_id SERIAL PRIMARY KEY,
    type TEXT,
    duration_days INTEGER,
    price NUMERIC(10, 2)
);


CREATE TABLE ReservationPackage (
    reservation_id INTEGER,
    package_id INTEGER,
    PRIMARY KEY (reservation_id, package_id),
    FOREIGN KEY (reservation_id) REFERENCES Reservation(reservation_id),
    FOREIGN KEY (package_id) REFERENCES Package(package_id)
);


CREATE TABLE ReservationSkipass (
    reservation_id INTEGER,
    skipass_id INTEGER,
    PRIMARY KEY (reservation_id, skipass_id),
    FOREIGN KEY (reservation_id) REFERENCES Reservation(reservation_id),
    FOREIGN KEY (skipass_id) REFERENCES Skipass(skipass_id)
);