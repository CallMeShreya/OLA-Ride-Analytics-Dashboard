CREATE DATABASE ola_project;

USE ola_project;

CREATE TABLE bookings (booking_id INT,customer_name VARCHAR(50),fare INT);-- 
CREATE TABLE ola_bookings (
    Date DATE,
    Time TIME,
    Booking_ID VARCHAR(50),
    Booking_Status VARCHAR(100),
    Customer_ID VARCHAR(50),
    Vehicle_Type VARCHAR(50),
    Pickup_Location VARCHAR(100),
    Drop_Location VARCHAR(100),
    V_TAT VARCHAR(50),
    C_TAT VARCHAR(50),
    Canceled_Rides_by_Customer VARCHAR(255),
    Canceled_Rides_by_Driver VARCHAR(255),
    Incomplete_Rides VARCHAR(50),
    Incomplete_Rides_Reason VARCHAR(255),
    Booking_Value DECIMAL(10,2),
    Payment_Method VARCHAR(50),
    Ride_Distance DECIMAL(10,2),
    Driver_Ratings DECIMAL(3,1),
    Customer_Rating DECIMAL(3,1)
);

SELECT COUNT(*)
FROM ola_bookings;
SELECT *
FROM ola_bookings
LIMIT 10;

SELECT COUNT(*) AS Total_Successful_Bookings
FROM ola_bookings
WHERE Booking_Status = 'Success';

SELECT Booking_Status,
COUNT(*) AS Total_Rides
FROM ola_bookings
GROUP BY Booking_Status;

SELECT Vehicle_Type,
COUNT(*) AS Total_Rides
FROM ola_bookings
group by Vehicle_Type
order by Total_Rides DESC;

SELECT Vehicle_Type,
ROUND(AVG(Customer_Rating),2) AS Avg_Customer_Rating
FROM ola_bookings
GROUP BY Vehicle_Type
ORDER BY Avg_Customer_Rating DESC;

SELECT Vehicle_Type,
ROUND(AVG(Driver_Ratings),2) AS Avg_Driver_Rating
FROM ola_bookings
GROUP BY Vehicle_Type
ORDER BY Avg_Driver_Rating DESC;

SELECT Vehicle_Type,
ROUND(SUM(Booking_Value),2) AS Revenue
FROM ola_bookings
WHERE Booking_Status = 'Success'
GROUP BY Vehicle_Type
ORDER BY Revenue DESC;

-- TASK 1: Retrieve all successful bookings
SELECT *
FROM ola_bookings
WHERE Booking_Status = 'Success';

-- TASK 2: Find the average ride distance for each vehicle type
SELECT Vehicle_Type,
ROUND(AVG(Ride_Distance),2) AS Avg_Ride_Distance
FROM ola_bookings
GROUP BY Vehicle_Type;

-- TASK 3: Get the total number of cancelled rides by customers
SELECT COUNT(*) AS Customer_Cancelled_Rides
FROM ola_bookings
WHERE Booking_Status = 'Canceled by Customer';

-- TASK 4: List the top 5 customers who booked the highest number of rides
SELECT Customer_ID,
COUNT(*) AS Total_Rides
FROM ola_bookings
GROUP BY Customer_ID
ORDER BY Total_Rides DESC
LIMIT 5;

-- TASK 5: Get the number of rides cancelled by drivers due to personal and car-related issues
SELECT COUNT(*) AS Driver_Cancelled_Rides
FROM ola_bookings
WHERE Canceled_Rides_by_Driver = 'Personal & Car related issue';

-- TASK 6: Find the maximum and minimum driver ratings for Prime Sedan bookings
SELECT
MAX(Driver_Ratings) AS Max_Rating,
MIN(Driver_Ratings) AS Min_Rating
FROM ola_bookings
WHERE Vehicle_Type = 'Prime Sedan';

-- TASK 7: Retrieve all rides where payment was made using UPI
SELECT *
FROM ola_bookings
WHERE Payment_Method = 'UPI';

-- TASK 8: Find the average customer rating per vehicle type
SELECT Vehicle_Type,
ROUND(AVG(Customer_Rating),2) AS Avg_Customer_Rating
FROM ola_bookings
GROUP BY Vehicle_Type
ORDER BY Avg_Customer_Rating DESC;

-- TASK 9: Calculate the total booking value of rides completed successfully
SELECT ROUND(SUM(Booking_Value),2) AS Total_Revenue
From ola_bookings
Where Booking_Status = 'Success';

-- TASK 10: List all incomplete rides along with the reason
SELECT Incomplete_Rides,
Incomplete_Rides_Reason
FROM ola_bookings
WHERE Incomplete_Rides = 'Yes';