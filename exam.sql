SELECT
    FORMAT(ArrivalDate, 'yyyy-MM-dd') AS ArrivalDate,
    AdultsCount,
    ChildrenCount
FROM Bookings AS b
INNER JOIN Rooms AS r ON b.RoomId = r.Id
ORDER BY r.Price DESC, b.ArrivalDate ASC;


SELECT
    h.Id,
    h.Name
FROM Hotels AS h
INNER JOIN HotelsRooms AS hr ON h.Id = hr.HotelId
INNER JOIN Rooms AS r ON hr.RoomId = r.Id AND r.Type = 'VIP Apartment'
INNER JOIN Bookings AS b ON h.Id = b.HotelId
GROUP BY h.Id, h.Name
ORDER BY COUNT(b.HotelId) DESC;

SELECT
    h.Id,
    h.Name
FROM Hotels AS h
INNER JOIN HotelsRooms AS hr ON h.Id = hr.HotelId
INNER JOIN Rooms AS r ON hr.RoomId = r.Id AND r.Type = 'VIP Apartment'
INNER JOIN Bookings AS b ON h.Id = b.HotelId
GROUP BY h.Id, h.Name
ORDER BY COUNT(b.HotelId) DESC;



SELECT t.Id, t.Name, t.PhoneNumber
FROM Tourists AS t
LEFT JOIN Bookings AS b ON t.Id = b.TouristId 
WHERE b.TouristId IS NULL
ORDER BY Name ASC;


SELECT TOP(10)
    h.Name AS HotelName,
    d.Name AS DestinationName,
    c.Name AS CountryName
FROM Bookings AS b
INNER JOIN Hotels AS h ON b.HotelId = h.Id
INNER JOIN Destinations AS d ON h.DestinationId = d.Id
INNER JOIN Countries AS c ON d.CountryId = c.Id
WHERE b.ArrivalDate < '2023-12-31'
AND (h.Id % 2 <> 0)
ORDER BY CountryName, b.ArrivalDate ASC


SELECT
    h.Name AS HotelName,
    r.Price AS RoomPrice
FROM Tourists AS t
INNER JOIN Bookings AS b ON t.Id = b.TouristId
INNER JOIN Hotels AS h ON b.HotelId = h.Id
INNER JOIN Rooms AS r ON b.RoomId = r.Id
WHERE (t.Name NOT LIKE '%EZ')
ORDER BY RoomPrice DESC;


SELECT
    h.Name AS HotelName,
    SUM(DATEDIFF(day,b.ArrivalDate,b.DepartureDate)*r.Price) AS HotelRevenue
FROM Bookings AS b
INNER JOIN Hotels AS h ON b.HotelId = h.Id
INNER JOIN Rooms AS r ON b.RoomId = r.Id
GROUP BY h.Name
ORDER BY HotelRevenue DESC;


CREATE OR ALTER PROCEDURE usp_SearchByCountry @country NVARCHAR(100)
AS
BEGIN
    SELECT 
		t.Name,
		t.PhoneNumber,
		t.Email,
		COUNT(b.TouristId) AS CountOfBookings
	FROM Tourists AS t
	INNER JOIN Bookings AS b ON t.ID = b.TouristId
	INNER JOIN Countries AS c ON t.CountryId = c.Id
	WHERE  c.Name = @country
	GROUP BY t.Name, t.PhoneNumber,t.Email
	ORDER BY Name, CountOfBookings DESC;
END;

EXEC usp_SearchByCountry 'Greece'



