-- =============================================
-- Office Management System - Database Setup
-- =============================================

USE CRUD;
GO

-- =============================================
-- Option 1: Create a VIEW to map Students table to Users
-- (Recommended - No code changes needed)
-- =============================================

-- Drop existing view if it exists
IF OBJECT_ID('dbo.Users', 'V') IS NOT NULL
    DROP VIEW dbo.Users;
GO

-- Create view mapping Students to Users
-- This maps Phone_No to Email field
CREATE VIEW dbo.Users
AS
SELECT
    Id,
    Name,
    Phone_No AS Email,  -- Map Phone_No to Email
    Address
FROM dbo.Students;
GO

-- =============================================
-- Test the view
-- =============================================
SELECT * FROM dbo.Users;
GO

-- =============================================
-- Optional: Insert sample data into Students table
-- =============================================
/*
INSERT INTO dbo.Students (Name, Address, Phone_No)
VALUES 
    ('John Doe', '123 Main Street', 'john@example.com'),
    ('Jane Smith', '456 Elm Avenue', 'jane@example.com'),
    ('Bob Johnson', '789 Oak Drive', 'bob@example.com');
GO
*/

-- =============================================
-- Alternative Option 2: Create separate Users table
-- (Use this if you don't want to use Students table)
-- =============================================
/*
-- Drop existing table if it exists
IF OBJECT_ID('dbo.Users', 'U') IS NOT NULL
    DROP TABLE dbo.Users;
GO

-- Create Users table
CREATE TABLE dbo.Users
(
    Id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    Name NVARCHAR(200) NOT NULL,
    Email NVARCHAR(200) NOT NULL,
    Address NVARCHAR(200) NOT NULL
);
GO

-- Insert sample data
INSERT INTO dbo.Users (Name, Email, Address)
VALUES 
    ('John Doe', 'john@example.com', '123 Main Street'),
    ('Jane Smith', 'jane@example.com', '456 Elm Avenue'),
    ('Bob Johnson', 'bob@example.com', '789 Oak Drive');
GO
*/

-- =============================================
-- Verify the setup
-- =============================================
PRINT 'Database setup completed successfully!';
PRINT 'Verify by running: SELECT * FROM dbo.Users';
GO
