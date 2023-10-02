SELECT p.PeakName, r.RiverName, LOWER(LEFT(p.PeakName, LEN(p.PeakName)-1) + r.RiverName)Mix
FROM Peaks p, Rivers r
WHERE RIGHT(p.PeakName,1)=LEFT(r.RiverName,1)
ORDER BY Mix;