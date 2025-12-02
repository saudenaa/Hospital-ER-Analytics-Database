



--Name: Amy Sauden 
--Database: ER_Hospital

USE MASTER;
GO
--1.Create Server Login

--Admin Full Access
CREATE LOGIN ER_Admin WITH PASSWORD = 'Admin@123';
GO

--Limited Access
CREATE LOGIN ER_Limited WITH PASSWORD = 'Limit@123';

--Read-Only Access
CREATE LOGIN ER_ReadOnly WITH PASSWORD = 'ReadOnly@123';
GO

--2 Map Logins to Database Users
USE ER_Hospital;
GO
--Create users in the ER_hospital  database 
CREATE USER ER_Admin_User FOR LOGIN ER_Admin;
CREATE USER ER_Limited_User FOR LOGIN ER_Limited;
CREATE USER ER_ReadOnly_User FOR LOGIN ER_ReadOnly

--3. Grant Permission
--3.1 Administrator: Full access to everything
EXEC sp_addrolemember 'db_owner', 'ER_Admin_User';
GO
--3.2 Read only User : Can only view (select) data
EXEC sp_addrolemember 'db_datareader', 'ER_ReadOnly_User';
GO
--3.3 Limited User: Can view and insert data, but cannot delet or alter
GRANT SELECT, INSERT ON SCHEMA::dbo TO ER_Limited_User;
REVOKE DELETE, ALTER ON SCHEMA::dbo FROM ER_Limited_User;
GO
--4.Verification Queries 
-- To verify that the user users were created correctly 
SELECT name, type_desc FROM sys.database_principals WHERE name LIKE 'ER_%';
Go

--Check Server Logins:
SELECT name, type_desc FROM sys.server_principals WHERE name LIKE 'ER_%';
GO