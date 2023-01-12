/*Retrieve all the information from 
the cd.facilities table?*/
SELECT * FROM cd.facilities;
/*list of only facility names and costs.*/
SELECT name,membercost FROM cd.facilities;
/*list of facilities that charge a 
fee to members*/
SELECT * FROM cd.facilities
WHERE membercost != 0;
/*list of facilities that charge a fee 
to members, and that fee is less than 
1/50th of the monthly maintenance cost*/
SELECT facid,name,membercost,monthlymaintenance 
FROM cd.facilities
WHERE membercost<(0.02*monthlymaintenance) 
AND membercost>0;
/*list of all facilities with the word 
'Tennis' in their name*/
SELECT * FROM cd.facilities
WHERE name LIKE '%Tennis%';
/*details of facilities with ID 1 and 5.
without using the OR operator*/
SELECT * FROM cd.facilities
WHERE facid IN (1,5);
/*list of members who joined after
the start of September 2012*/
SELECT * FROM cd.members
WHERE TO_CHAR(joindate,'MM-YYYY')>='09-2012';
/*ordered list of the first 10 surnames in the members 
table The list must not contain duplicates.*/
SELECT DISTINCT surname FROM cd.members
ORDER BY surname
LIMIT 10;
/*date of your last member*/
SELECT MAX(joindate) FROM cd.members;
/*count of the number of facilities that 
have a cost to guests of 10 or more*/
SELECT COUNT(*) FROM cd.facilities
WHERE guestcost>=10;
/*list of the total number of slots booked 
per facility in the month of September 2012
(facility id and slots, sorted by the number of slots)*/
SELECT facid,SUM(slots) AS total_slots
FROM cd.bookings
WHERE TO_CHAR(starttime,'MM-YYYY')='09-2012'
GROUP BY facid
ORDER BY SUM(slots);
/*list of facilities with more than 1000 slots booked. 
(facility id and total slots, sorted by facility id.)*/
SELECT facid,SUM(slots) AS total_slots
FROM cd.bookings
GROUP BY facid
HAVING SUM(slots) > 1000
ORDER BY facid;
/*list of the start times for bookings for tennis
courts, for the date '2012-09-21'(start time and 
facility name pairings, ordered by the time)*/
SELECT starttime,name 
FROM cd.facilities
INNER JOIN cd.bookings 
ON cd.bookings.facid = cd.facilities.facid
WHERE name IN ('Tennis Court 1', 'Tennis Court 2')
AND starttime>='2012-09-21' AND starttime<'2012-09-22'
ORDER BY starttime;
/*list of the start times for bookings by members
named 'David Farrell'*/
SELECT cd.bookings.starttime
FROM cd.bookings
INNER JOIN cd.members
ON cd.bookings.memid=cd.members.memid
WHERE cd.members.firstname||' '||cd.members.surname='David Farrell'