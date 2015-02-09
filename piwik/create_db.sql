CREATE DATABASE piwikdb;
CREATE USER piwikadmin@localhost IDENTIFIED BY 'piwikpassword';
GRANT ALL PRIVILEGES ON piwikdb.* TO piwikadmin@localhost;
FLUSH PRIVILEGES;
exit
