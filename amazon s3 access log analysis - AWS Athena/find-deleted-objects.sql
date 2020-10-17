/* To find the log for a deleted object: */

SELECT * FROM s3_access_logs_db.mybucket_logs WHERE 
key = 'images/picture.jpg' AND operation like '%DELETE%';


/* To show who deleted an object and when, including the timestamp, IP address, and AWS Identity and Access Management (IAM) user: */

SELECT requestdatetime, remoteip, requester, key FROM s3_access_logs_db.mybucket_logs WHERE 
key = 'images/picture.jpg' AND operation like '%DELETE%';