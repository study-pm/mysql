-- Check current database;
SELECT DATABASE();

-- Show database settings
SHOW CREATE DATABASE specialization;

-- Show specific database
SHOW DATABASES LIKE '<database_name>';

-- Show tables
SHOW TABLES;

-- Show tables structure
DESCRIBE education;
DESCRIBE specialty;
SHOW COLUMNS FROM worker;
SHOW COLUMNS IN specialty;

-- Show table constraints
SHOW CREATE TABLE education;

-- Show indexes for table
SHOW INDEXES IN education;
SHOW INDEXES FROM worker;

-- Show users
SELECT user, host, authentication_string FROM mysql.user;

-- Check current user
SELECT USER();
SELECT CURRENT_USER();

-- Show user privileges
SHOW GRANTS FOR viewer@localhost;

-- Show procedure
SHOW CREATE PROCEDURE addWorker;
