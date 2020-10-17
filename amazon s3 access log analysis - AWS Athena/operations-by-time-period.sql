/* To show all operations performed on an object in a specific time period: */

SELECT *
FROM s3_access_logs_db.mybucket_logs
WHERE Key='prefix/images/picture.jpg' AND
parse_datetime(requestdatetime,'dd/MMM/yyyy:HH:mm:ss Z') 
BETWEEN parse_datetime('2020-09-18:07:00:00','yyyy-MM-dd:HH:mm:ss')
AND
parse_datetime('2020-09-18:08:00:00','yyyy-MM-dd:HH:mm:ss');

/* To show how much data a specific IP address transferred in a specific time period: */

SELECT SUM(bytessent) as uploadtotal, 
SUM(objectsize) as downloadtotal, 
SUM(bytessent + objectsize) AS total FROM s3_access_logs_db.mybucket_logs WHERE remoteIP='1.2.3.4' and parse_datetime(requestdatetime,'dd/MMM/yyyy:HH:mm:ss Z') BETWEEN parse_datetime('2020-07-01','yyyy-MM-dd') and parse_datetime('2020-08-01','yyyy-MM-dd');