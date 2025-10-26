-- Airbnb Clone Database Sample Data (Seeding Script)
-- Project: ALX Airbnb Database Module
-- Author: Doe Shuaib
-- Date: October 2025



-- USERS

INSERT INTO users (first_name, last_name, email, password_hash, phone_number, role)
VALUES
('Alice', 'Johnson', 'alice.johnson@example.com', 'hashedpassword123', '+254712345678', 'guest'),
('Brian', 'Kamau', 'brian.kamau@example.com', 'hashedpassword456', '+254798765432', 'host'),
('Caroline', 'Smith', 'caroline.smith@example.com', 'hashedpassword789', '+254711223344', 'host'),
('David', 'Otieno', 'david.otieno@example.com', 'hashedpassword999', '+254700111222', 'guest'),
('Admin', 'User', 'admin@airbnbclone.com', 'secureadminhash', '+254799000111', 'admin');


-- PROPERTIES

INSERT INTO properties (host_id, title, description, location, price_per_night, property_type, number_of_bedrooms, number_of_bathrooms)
VALUES
(2, 'Cozy Apartment in Nairobi', 'A beautiful 2-bedroom apartment in Westlands, Nairobi.', 'Nairobi, Kenya', 75.00, 'apartment', 2, 1),
(2, 'Beachfront Villa in Mombasa', 'Luxury villa with ocean view and private pool.', 'Mombasa, Kenya', 220.00, 'villa', 4, 3),
(3, 'Modern Studio in Kisumu', 'Affordable and modern studio near the lake.', 'Kisumu, Kenya', 50.00, 'studio', 1, 1),
(3, 'Countryside Cottage in Nyeri', 'Peaceful 3-bedroom cottage surrounded by nature.', 'Nyeri, Kenya', 120.00, 'cottage', 3, 2);


-- PROPERTY AMENITIES

INSERT INTO property_amenities (property_id, amenity_name)
VALUES
(1, 'WiFi'),
(1, 'Smart TV'),
(1, 'Parking'),
(2, 'Swimming Pool'),
(2, 'Air Conditioning'),
(2, 'Private Chef'),
(3, 'WiFi'),
(3, 'Lake View'),
(4, 'Fireplace'),
(4, 'Garden');


-- BOOKINGS

INSERT INTO bookings (property_id, guest_id, check_in_date, check_out_date, status)
VALUES
(1, 1, '2025-11-10', '2025-11-15', 'confirmed'),
(2, 4, '2025-12-01', '2025-12-07', 'pending'),
(3, 1, '2025-10-15', '2025-10-18', 'cancelled'),
(4, 4, '2025-11-20', '2025-11-23', 'confirmed');


-- PAYMENTS

INSERT INTO payments (booking_id, amount, payment_method, payment_status)
VALUES
(1, 375.00, 'credit_card', 'paid'),
(2, 1540.00, 'paypal', 'pending'),
(3, 150.00, 'mobile_money', 'refunded'),
(4, 360.00, 'credit_card', 'paid');


-- REVIEWS

INSERT INTO reviews (property_id, guest_id, rating, comment)
VALUES
(1, 1, 5, 'Amazing place, very clean and comfortable!'),
(2, 4, 4, 'Beautiful villa, though WiFi was slow.'),
(4, 4, 5, 'Loved the peaceful atmosphere and nature.'),
(3, 1, 3, 'Affordable but could use better furniture.');


