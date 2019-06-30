//
//  Query.swift
//  Zoomcar
//
//  Created by prithvi-pt2335 on 30/06/19.
//  Copyright © 2019 prithvi-pt2335. All rights reserved.
//

import Foundation

class Query{
    
    static var createTableQuery = """
CREATE TABLE IF NOT EXISTS booking (Booking_Id INT PRIMARY KEY NOT NULL, User_Id INT NOT NULL, Car_Id INT NOT NULL, Delivery_Address VARCHAR NOT NULL, Pickup_Address VARCHAR NOT NULL, Delivery_City VARCHAR NOT NULL, Pickup_City VARCHAR NOT NULL, Booking_Date DATETIME NOT NULL, Start_Date DATETIME NOT NULL, End_Date DATETIME NOT NULL, FOREIGN KEY (User_Id) REFERENCES user (User_Id));
    CREATE TABLE IF NOT EXISTS branch (Branch_Id INT NOT NULL PRIMARY KEY, City_Name VARCHAR NOT NULL, State_Name VARCHAR NOT NULL, Address VARCHAR NOT NULL, Total_Executives_Available INT NOT NULL, Total_Cars_Available INT NOT NULL, Contact_Number VARCHAR(15) NOT NULL);
    CREATE TABLE IF NOT EXISTS car (Car_Id INT NOT NULL PRIMARY KEY, car_image TEXT, Branch_Id INT NOT NULL, Car_Number VARCHAR NOT NULL, Car_Name VARCHAR NOT NULL, Car_Model VARCHAR NOT NULL, Car_Group VARCHAR NOT NULL, Fuel_Type VARCHAR NOT NULL, Transmission VARCHAR NOT NULL, Rent_Per_day INT NOT NULL, Free_Km INT NOT NULL, Additional_Km_Fee INT NOT NULL, total_rating INT, no_of_votes INT, no_of_bags INT, no_of_seats STRING, carAdvance INT, FOREIGN KEY (Branch_Id) REFERENCES branch (Branch_Id));
    CREATE TABLE IF NOT EXISTS Offers (Offer_Name VARCHAR NOT NULL PRIMARY KEY, Discount_Percentage INT NOT NULL);
    CREATE TABLE IF NOT EXISTS payment (Payment_Id INT NOT NULL PRIMARY KEY, Booking_Id INT, Offer_Applied VARCHAR, Amount_Paid VARCHAR NOT NULL, Payment_Date DATETIME NOT NULL, Payment_Mode VARCHAR);
    CREATE TABLE IF NOT EXISTS user (User_Id INT NOT NULL PRIMARY KEY, User_Name VARCHAR NOT NULL, Mobile_Number VARCHAR NOT NULL, Residential_Address VARCHAR NOT NULL, City VARCHAR NOT NULL, Pincode INT NOT NULL, Gender VARCHAR NOT NULL, Licence_Number VARCHAR NOT NULL);
    CREATE TABLE IF NOT EXISTS user_authentication (User_Id INT NOT NULL PRIMARY KEY, Password VARCHAR NOT NULL);
    CREATE TABLE IF NOT EXISTS Wallet (Wallet_Id INT PRIMARY KEY NOT NULL, User_Id INTEGER NOT NULL UNIQUE, Balance INT NOT NULL, FOREIGN KEY (User_Id) REFERENCES user (User_Id));
    CREATE TABLE IF NOT EXISTS Flag (flag BOOLEAN);
"""
  static var insertQuery = """
-- Table: booking
INSERT INTO booking (Booking_Id, User_Id, Car_Id, Delivery_Address, Pickup_Address, Delivery_City, Pickup_City, Booking_Date, Start_Date, End_Date) VALUES (100200, 1001, 1001, 'Kattankulathur, Nandivaram Guduvancheri, Kancheepuram, Tamil Nadu - 603203,India', 'G K Chennai Motors, 18 Erikarai Salai, Nesapakkam, Chennai, Tamil Nadu 600078, India', 'Chennai', 'Chennai', '2019-08-23 00:00:00', '2019-08-24 05:22:23', '2019-08-25 00:00:00');
INSERT INTO booking (Booking_Id, User_Id, Car_Id, Delivery_Address, Pickup_Address, Delivery_City, Pickup_City, Booking_Date, Start_Date, End_Date) VALUES (100201, 1001, 1002, 'Bangalore Palace, Jayamahal, Bengaluru, Karnataka 560006, India', 'Bangalore Agarwal Bhavan, 79 Narayana Guru Salai, Choolai, Chennai, Tamil Nadu 600112, India', 'Bangalore', 'Chennai', '2019-08-25 00:00:00', '2019-08-26 00:00:00', '2019-08-27 00:00:00');
INSERT INTO booking (Booking_Id, User_Id, Car_Id, Delivery_Address, Pickup_Address, Delivery_City, Pickup_City, Booking_Date, Start_Date, End_Date) VALUES (100202, 1001, 1007, 'Swimming Pool - Oakwood, 24 Vittal Mallya Road, UB City, Bangalore, Karnataka - 560066, India', 'RR Layout, Bengaluru, Karnataka, India', 'Bangalore', 'Bangalore', '2019-08-27 00:00:00', '2019-08-28 05:05:05', '2019-08-29 00:00:00');
INSERT INTO booking (Booking_Id, User_Id, Car_Id, Delivery_Address, Pickup_Address, Delivery_City, Pickup_City, Booking_Date, Start_Date, End_Date) VALUES (100203, 1001, 1008, 'N.k And M Sons, Chickpete, Bengaluru, Karnataka, India', 'Kattankulathur, Nandivaram Guduvancheri, Kancheepuram, Tamil Nadu - 603203,India', 'Bangalore', 'Chennai', '2019-08-29 00:00:00', '2019-08-30 00:00:00', '2019-09-01 00:00:00');
INSERT INTO booking (Booking_Id, User_Id, Car_Id, Delivery_Address, Pickup_Address, Delivery_City, Pickup_City, Booking_Date, Start_Date, End_Date) VALUES (100204, 1001, 1015, 'Bangalore Palace, Jayamahal, Bengaluru, Karnataka 560006, India', 'Kattankulathur, Nandivaram Guduvancheri, Kancheepuram, Tamil Nadu - 603203,India', 'Bangalore', 'Chennai', '2019-09-01 00:00:00', '2019-09-02 00:00:00', '2019-09-03 00:00:00');
INSERT INTO booking (Booking_Id, User_Id, Car_Id, Delivery_Address, Pickup_Address, Delivery_City, Pickup_City, Booking_Date, Start_Date, End_Date) VALUES (100205, 1001, 1012, 'Bangalore Agarwal Bhavan, 79 Narayana Guru Salai, Choolai, Chennai, Tamil Nadu 600112, India', 'G K Chennai Motors, 18 Erikarai Salai, Nesapakkam, Chennai, Tamil Nadu 600078, India', 'Chennai', 'Chennai', '2019-09-03 00:00:00', '2019-09-04 00:00:00', '2019-09-05 00:00:00');
INSERT INTO booking (Booking_Id, User_Id, Car_Id, Delivery_Address, Pickup_Address, Delivery_City, Pickup_City, Booking_Date, Start_Date, End_Date) VALUES (100206, 1001, 1009, 'Chennai New Bypass, Varadharajapuram, Chennai, Tamil Nadu, India', 'Kempegowda International Airport Bengaluru, Kempegowda International Airport Bengaluru, Administration Block, Devanhalli, Karnataka 560300, India', 'Chennai', 'Bangalore', '2019-09-05 00:00:00', '2019-09-06 00:00:00', '2019-09-07 00:00:00');
INSERT INTO booking (Booking_Id, User_Id, Car_Id, Delivery_Address, Pickup_Address, Delivery_City, Pickup_City, Booking_Date, Start_Date, End_Date) VALUES (100207, 1001, 1010, 'Sathyabama University, Rajiv Gandhi Road, Jeppiaar Nagar, Chennai, Tamilnadu 600119, India', 'Bangalore City Football Club, Banaswadi, Bengaluru, Karnataka 560043, India', 'Chennai', 'Bangalore', '2019-09-07 00:00:00', '2019-09-08 00:00:00', '2019-01-08 15:17:34');
INSERT INTO booking (Booking_Id, User_Id, Car_Id, Delivery_Address, Pickup_Address, Delivery_City, Pickup_City, Booking_Date, Start_Date, End_Date) VALUES (100208, 1001, 1003, 'Arignar Anna Zoological Park, Vandalur, Chennai, Tamil Nadu 600048, India', 'Poo Mani Store, Peerkankaranai, Chennai, Tamil Nadu, India', 'Chennai', 'Chennai', '2019-01-08 15:17:34', '2019-03-01 00:00:00', '2019-03-02 00:00:00');
INSERT INTO booking (Booking_Id, User_Id, Car_Id, Delivery_Address, Pickup_Address, Delivery_City, Pickup_City, Booking_Date, Start_Date, End_Date) VALUES (100209, 1001, 1004, 'Kattankulathur, Nandivaram Guduvancheri, Kancheepuram, Tamil Nadu - 603203,India', 'K O Shop, 105 5th Cross Road, Indiranagar, Bengaluru, Karnataka 560008, India', 'Chennai', 'Bangalore', '2019-03-02 00:00:00', '2019-03-03 00:00:00', '2019-03-04 00:00:00');
INSERT INTO booking (Booking_Id, User_Id, Car_Id, Delivery_Address, Pickup_Address, Delivery_City, Pickup_City, Booking_Date, Start_Date, End_Date) VALUES (100210, 1001, 1005, 'G K Chennai Motors, 18 Erikarai Salai, Nesapakkam, Chennai, Tamil Nadu 600078, India', 'K O Shop, 105 5th Cross Road, Indiranagar, Bengaluru, Karnataka 560008, India', 'Chennai', 'Bangalore', '2019-03-04 00:00:00', '2019-03-05 00:00:00', '2019-03-06 00:00:00');
INSERT INTO booking (Booking_Id, User_Id, Car_Id, Delivery_Address, Pickup_Address, Delivery_City, Pickup_City, Booking_Date, Start_Date, End_Date) VALUES (100211, 1001, 1006, 'Sathyabama University, Rajiv Gandhi Road, Jeppiaar Nagar, Chennai, Tamilnadu 600119, India', 'K O Shop, 105 5th Cross Road, Indiranagar, Bengaluru, Karnataka 560008, India', 'Chennai', 'Bangalore', '2019-03-06 00:00:00', '2019-03-07 00:00:00', '2019-03-08 00:00:00');
INSERT INTO booking (Booking_Id, User_Id, Car_Id, Delivery_Address, Pickup_Address, Delivery_City, Pickup_City, Booking_Date, Start_Date, End_Date) VALUES (100212, 1001, 1011, 'Chennai New Bypass, Varadharajapuram, Chennai, Tamil Nadu, India', 'Bangalore City Football Club, Banaswadi, Bengaluru, Karnataka 560043, India', 'Chennai', 'Bangalore', '2019-03-08 00:00:00', '2019-03-09 00:00:00', '2019-03-10 00:00:00');
INSERT INTO booking (Booking_Id, User_Id, Car_Id, Delivery_Address, Pickup_Address, Delivery_City, Pickup_City, Booking_Date, Start_Date, End_Date) VALUES (100213, 1001, 1013, 'Poo Mani Store, Peerkankaranai, Chennai, Tamil Nadu, India', 'Kempegowda International Airport Bengaluru, Kempegowda International Airport Bengaluru, Administration Block, Devanhalli, Karnataka 560300, India', 'Chennai', 'Chennai', '2019-03-10 00:00:00', '2019-03-11 00:00:00', '2019-03-12 00:00:00');
INSERT INTO booking (Booking_Id, User_Id, Car_Id, Delivery_Address, Pickup_Address, Delivery_City, Pickup_City, Booking_Date, Start_Date, End_Date) VALUES (100214, 1001, 1014, 'G K Chennai Motors, 18 Erikarai Salai, Nesapakkam, Chennai, Tamil Nadu 600078, India', 'G K Chennai Motors, 18 Erikarai Salai, Nesapakkam, Chennai, Tamil Nadu 600078, India', 'Chennai', 'Chennai', '2019-03-12 00:00:00', '2019-03-13 00:00:00', '2019-03-14 00:00:00');
INSERT INTO booking (Booking_Id, User_Id, Car_Id, Delivery_Address, Pickup_Address, Delivery_City, Pickup_City, Booking_Date, Start_Date, End_Date) VALUES (100215, 1001, 1001, 'Kattankulathur, Nandivaram Guduvancheri, Kancheepuram, Tamil Nadu - 603203,India', 'N.k And M Sons, Chickpete, Bengaluru, Karnataka, India', 'Chennai', 'Bangalore', '2019-03-14 00:00:00', '2019-03-15 00:00:00', '2019-03-16 00:00:00');


-- Table: branch

INSERT INTO branch (Branch_Id, City_Name, State_Name, Address, Total_Executives_Available, Total_Cars_Available, Contact_Number) VALUES (101, 'Chennai', 'Tamilnadu', 'Tower B 2nd Floor, Cathdral Road Gopalapuram Chennai 600086 ', 5, 2, '9999999999');
INSERT INTO branch (Branch_Id, City_Name, State_Name, Address, Total_Executives_Available, Total_Cars_Available, Contact_Number) VALUES (102, 'Bangalore', 'Karnataka', '2nd Floor, 543, CMH Road, Indiranagar, Bangalore - 560038.', 10, 1, '9888888888');

-- Table: car

INSERT INTO car (Car_Id, car_image, Branch_Id, Car_Number, Car_Name, Car_Model, Car_Group, Fuel_Type, Transmission, Rent_Per_day, Free_Km, Additional_Km_Fee, total_rating, no_of_votes, no_of_bags, no_of_seats, carAdvance) VALUES (1001, 'FordEcoSport', 101, 'AP-02-BK-1', 'Ford Ecosport', 'Ecosport', 'SUV', 'Petrol', 'Manual', 900, 150, 14, 42, 9, 4, '5 Seater', 20);
INSERT INTO car (Car_Id, car_image, Branch_Id, Car_Number, Car_Name, Car_Model, Car_Group, Fuel_Type, Transmission, Rent_Per_day, Free_Km, Additional_Km_Fee, total_rating, no_of_votes, no_of_bags, no_of_seats, carAdvance) VALUES (1002, 'SuzukiSwift', 101, 'AP-01-BI-1', 'Maruti Swift', 'Swift', 'Hatchback', 'Diesel', 'Automatic', 750, 200, 16, 44, 10, 3, '5 Seater', 30);
INSERT INTO car (Car_Id, car_image, Branch_Id, Car_Number, Car_Name, Car_Model, Car_Group, Fuel_Type, Transmission, Rent_Per_day, Free_Km, Additional_Km_Fee, total_rating, no_of_votes, no_of_bags, no_of_seats, carAdvance) VALUES (1003, 'Honda Jazz', 102, 'TN-07-JK-1', 'Honda Jazz', 'Jazz', 'Hatchback', 'Diesel', 'Manual', 800, 290, 18, 40, 10, 2, '5 Seater', 25);
INSERT INTO car (Car_Id, car_image, Branch_Id, Car_Number, Car_Name, Car_Model, Car_Group, Fuel_Type, Transmission, Rent_Per_day, Free_Km, Additional_Km_Fee, total_rating, no_of_votes, no_of_bags, no_of_seats, carAdvance) VALUES (1004, 'i20', 102, 'TN-02-BK-1', 'Hyundai i20

', 'i20', 'Hatchback', 'Petrol', 'Automatic', 700, 100, 15, 45, 10, 2, '5 Seater', 25);
INSERT INTO car (Car_Id, car_image, Branch_Id, Car_Number, Car_Name, Car_Model, Car_Group, Fuel_Type, Transmission, Rent_Per_day, Free_Km, Additional_Km_Fee, total_rating, no_of_votes, no_of_bags, no_of_seats, carAdvance) VALUES (1005, 'nexon', 101, 'KL-02-BK-1', 'Tata Nexon
', 'Nexon', 'Hatchback', 'Petrol', 'Automatic', 650, 125, 14, 75, 18, 4, '5 Seater', 25);
INSERT INTO car (Car_Id, car_image, Branch_Id, Car_Number, Car_Name, Car_Model, Car_Group, Fuel_Type, Transmission, Rent_Per_day, Free_Km, Additional_Km_Fee, total_rating, no_of_votes, no_of_bags, no_of_seats, carAdvance) VALUES (1006, 'brezza', 102, 'KA-07-JK-1', 'Maruti Brezza

', 'Brezza', 'SUV', 'Diesel', 'Manual', 950, 180, 19, 55, 12, 4, '5 Seater', 35);
INSERT INTO car (Car_Id, car_image, Branch_Id, Car_Number, Car_Name, Car_Model, Car_Group, Fuel_Type, Transmission, Rent_Per_day, Free_Km, Additional_Km_Fee, total_rating, no_of_votes, no_of_bags, no_of_seats, carAdvance) VALUES (1007, 'Mahindra KUV100', 101, 'AP-12-BK-1', 'Mahindra KUV 100

', 'KUV1 00', 'Hatchback', 'Petrol', 'Automatic', 725, 190, 17, 24, 6, 2, '5 Seater', 18);
INSERT INTO car (Car_Id, car_image, Branch_Id, Car_Number, Car_Name, Car_Model, Car_Group, Fuel_Type, Transmission, Rent_Per_day, Free_Km, Additional_Km_Fee, total_rating, no_of_votes, no_of_bags, no_of_seats, carAdvance) VALUES (1008, 'hyundai verna', 102, 'DL-01-ZE-12', 'Hyundai Verna', 'Verna', 'Sedan', 'Diesel', 'Manual', 850, 300, 19, 75, 18, 2, '5 Seater', 33);
INSERT INTO car (Car_Id, car_image, Branch_Id, Car_Number, Car_Name, Car_Model, Car_Group, Fuel_Type, Transmission, Rent_Per_day, Free_Km, Additional_Km_Fee, total_rating, no_of_votes, no_of_bags, no_of_seats, carAdvance) VALUES (1009, 'scorpio', 102, 'DL-02-BK-1', 'Mahindra Scorpio

', 'Scorpio', 'SUV', 'Diesel', 'Automatic', 1200, 100, 21, 22, 5, 6, '7 Seater', 20);
INSERT INTO car (Car_Id, car_image, Branch_Id, Car_Number, Car_Name, Car_Model, Car_Group, Fuel_Type, Transmission, Rent_Per_day, Free_Km, Additional_Km_Fee, total_rating, no_of_votes, no_of_bags, no_of_seats, carAdvance) VALUES (1010, 'Ford Freestyle', 101, 'MH-07-JK-1', 'Ford Freestyle

', 'Freestyle', 'Hatchback', 'Diesel', 'Manual', 700, 400, 16, 88, 20, 4, '5 Seater', 20);
INSERT INTO car (Car_Id, car_image, Branch_Id, Car_Number, Car_Name, Car_Model, Car_Group, Fuel_Type, Transmission, Rent_Per_day, Free_Km, Additional_Km_Fee, total_rating, no_of_votes, no_of_bags, no_of_seats, carAdvance) VALUES (1011, 'creta', 101, 'MH-12-BK-1', 'Hyundai Creta

', 'Creta', 'SUV', 'Petrol', 'Manual', 790, 100, 15, 99, 22, 4, '5 Seater', 17);
INSERT INTO car (Car_Id, car_image, Branch_Id, Car_Number, Car_Name, Car_Model, Car_Group, Fuel_Type, Transmission, Rent_Per_day, Free_Km, Additional_Km_Fee, total_rating, no_of_votes, no_of_bags, no_of_seats, carAdvance) VALUES (1012, 'liva', 102, 'MH-01-BI-1', 'Toyota Etios Liva

', 'Liva', 'Hatchback', 'Petrol', 'Manual', 550, 180, 12, 44, 15, 0, '5 Seater', 10);
INSERT INTO car (Car_Id, car_image, Branch_Id, Car_Number, Car_Name, Car_Model, Car_Group, Fuel_Type, Transmission, Rent_Per_day, Free_Km, Additional_Km_Fee, total_rating, no_of_votes, no_of_bags, no_of_seats, carAdvance) VALUES (1013, 'Ford Figo', 101, 'KL-09-BK-1', 'Ford Figo', 'Figo', 'Hatchback', 'Petrol', 'Manual', 250, 100, 13, 300, 70, 3, '5 Seater', 25);
INSERT INTO car (Car_Id, car_image, Branch_Id, Car_Number, Car_Name, Car_Model, Car_Group, Fuel_Type, Transmission, Rent_Per_day, Free_Km, Additional_Km_Fee, total_rating, no_of_votes, no_of_bags, no_of_seats, carAdvance) VALUES (1014, 'xylo', 102, 'KL-07-BK-1', 'Mahindra Xylo
', 'Xylo', 'SUV', 'Petrol', 'Automatic', 900, 120, 19, 120, 28, 4, '9 Seater', 20);
INSERT INTO car (Car_Id, car_image, Branch_Id, Car_Number, Car_Name, Car_Model, Car_Group, Fuel_Type, Transmission, Rent_Per_day, Free_Km, Additional_Km_Fee, total_rating, no_of_votes, no_of_bags, no_of_seats, carAdvance) VALUES (1015, 'Mahindra XUV300', 101, 'MH-02-BI-1', 'Mahindra XUV 300', 'XUV 300', 'SUV', 'Diesel', 'Manual', 950, 120, 18, 100, 22, 3, '5 Seater', 16);

-- Table: Offers
INSERT INTO Offers (Offer_Name, Discount_Percentage) VALUES ('CARWOW', 99);
INSERT INTO Offers (Offer_Name, Discount_Percentage) VALUES ('SuperCar', 25);

-- Table: payment
INSERT INTO payment (Payment_Id, Booking_Id, Offer_Applied, Amount_Paid, Payment_Date, Payment_Mode) VALUES (1, 100200, 'None', '1380', '2019-08-23 00:00:00', 'VISA CARD');
INSERT INTO payment (Payment_Id, Booking_Id, Offer_Applied, Amount_Paid, Payment_Date, Payment_Mode) VALUES (2, 100201, 'None', '1275', '2019-08-25 00:00:00', 'VISA CARD');
INSERT INTO payment (Payment_Id, Booking_Id, Offer_Applied, Amount_Paid, Payment_Date, Payment_Mode) VALUES (3, 100202, 'None', '1155', '2019-08-27 00:00:00', 'VISA CARD');
INSERT INTO payment (Payment_Id, Booking_Id, Offer_Applied, Amount_Paid, Payment_Date, Payment_Mode) VALUES (4, 100203, 'None', '1430', '2019-08-29 00:00:00', 'VISA CARD');
INSERT INTO payment (Payment_Id, Booking_Id, Offer_Applied, Amount_Paid, Payment_Date, Payment_Mode) VALUES (5, 100204, 'None', '1402', '2019-09-01 00:00:00', 'VISA CARD');
INSERT INTO payment (Payment_Id, Booking_Id, Offer_Applied, Amount_Paid, Payment_Date, Payment_Mode) VALUES (6, 100205, 'None', '905', '2019-09-03 00:00:00', 'VISA CARD');
INSERT INTO payment (Payment_Id, Booking_Id, Offer_Applied, Amount_Paid, Payment_Date, Payment_Mode) VALUES (7, 100206, 'None', '1740', '2019-09-05 00:00:00', 'VISA CARD');
INSERT INTO payment (Payment_Id, Booking_Id, Offer_Applied, Amount_Paid, Payment_Date, Payment_Mode) VALUES (8, 100207, 'None', '1140', '2019-09-07 00:00:00', 'MASTER CARD');
INSERT INTO payment (Payment_Id, Booking_Id, Offer_Applied, Amount_Paid, Payment_Date, Payment_Mode) VALUES (9, 100208, 'None', '1300', '2019-01-08 15:17:34', 'MASTER CARD');
INSERT INTO payment (Payment_Id, Booking_Id, Offer_Applied, Amount_Paid, Payment_Date, Payment_Mode) VALUES (10, 100209, 'None', '1175', '2019-03-02 00:00:00', 'MASTER CARD');
INSERT INTO payment (Payment_Id, Booking_Id, Offer_Applied, Amount_Paid, Payment_Date, Payment_Mode) VALUES (11, 100210, 'None', '1112', '2019-03-04 00:00:00', 'MASTER CARD');
INSERT INTO payment (Payment_Id, Booking_Id, Offer_Applied, Amount_Paid, Payment_Date, Payment_Mode) VALUES (12, 100211, 'None', '1582', '2019-03-06 00:00:00', 'MASTER CARD');
INSERT INTO payment (Payment_Id, Booking_Id, Offer_Applied, Amount_Paid, Payment_Date, Payment_Mode) VALUES (13, 100212, 'None', '1224', '2019-03-08 00:00:00', 'MASTER CARD');
INSERT INTO payment (Payment_Id, Booking_Id, Offer_Applied, Amount_Paid, Payment_Date, Payment_Mode) VALUES (14, 100213, 'None', '612', '2019-03-10 00:00:00', 'MASTER CARD');
INSERT INTO payment (Payment_Id, Booking_Id, Offer_Applied, Amount_Paid, Payment_Date, Payment_Mode) VALUES (15, 100214, 'None', '1380', '2019-03-12 00:00:00', 'MASTER CARD');
INSERT INTO payment (Payment_Id, Booking_Id, Offer_Applied, Amount_Paid, Payment_Date, Payment_Mode) VALUES (16, 100215, 'SuperCar', '1110', '2019-03-14 00:00:00', 'MASTER CARD');

-- Table: user

INSERT INTO user (User_Id, User_Name, Mobile_Number, Residential_Address, City, Pincode, Gender, Licence_Number) VALUES (1001, 'primo', '2147483647', 'No.2 , Park street , Thiruvanmiyur', 'Chennai', 600041, 'Male', 'MH14201100628');
INSERT INTO user (User_Id, User_Name, Mobile_Number, Residential_Address, City, Pincode, Gender, Licence_Number) VALUES (1002, 'Katy', '9566294732', 'No.22,South Plaza , Indira Nagar', 'Chennai', 600020, 'Female', 'TN12345678901');
INSERT INTO user (User_Id, User_Name, Mobile_Number, Residential_Address, City, Pincode, Gender, Licence_Number) VALUES (1003, 'p', '2', 'w', 'q', 2, 'e', 'ww');
INSERT INTO user (User_Id, User_Name, Mobile_Number, Residential_Address, City, Pincode, Gender, Licence_Number) VALUES (1004, 'k9', '007', 'qwertyuioplkjhgfdsazxcvbnm', 'qwert', 12345, 'other', '1234');
INSERT INTO user (User_Id, User_Name, Mobile_Number, Residential_Address, City, Pincode, Gender, Licence_Number) VALUES (1005, 'Vrishank(Jona''s', '78', 'yu', 'chennai', 600009, 'f', '678');
INSERT INTO user (User_Id, User_Name, Mobile_Number, Residential_Address, City, Pincode, Gender, Licence_Number) VALUES (1006, 'hu', '67', 'yu', 'vg', 789, 't', '67');

-- Table: user_authentication
INSERT INTO user_authentication (User_Id, Password) VALUES (1001, 'hello');
INSERT INTO user_authentication (User_Id, Password) VALUES (1002, 'hii');
INSERT INTO user_authentication (User_Id, Password) VALUES (1003, 'bye');
INSERT INTO user_authentication (User_Id, Password) VALUES (1004, 'good');
INSERT INTO user_authentication (User_Id, Password) VALUES (1005, 'toll');
INSERT INTO user_authentication (User_Id, Password) VALUES (1006, 'rex');


-- Table: Wallet
INSERT INTO Wallet (Wallet_Id, User_Id, Balance) VALUES (5001, 1001, 2221088);

-- Table: Flag
INSERT INTO Flag (flag) VALUES (TRUE);


-- Index: PRIMARY
CREATE INDEX "PRIMARY" ON booking (Booking_Id);

-- Index: primarykey
CREATE INDEX primarykey ON branch (Branch_Id);

-- Index: user_idx
CREATE INDEX user_idx ON booking (User_Id);

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
"""

    
    
}
