/*
===============================================================================
Create Database and Schemas
===============================================================================

Script Purpose:
    This script creates a new database named 'Trendique'.

    If the database already exists, it will be dropped and recreated.

    The script also creates the following schemas:

        - bronze  → Raw data layer
        - silver  → Cleaned and transformed data
        - gold    → Business-ready analytical data

WARNING:
    Running this script deletes the existing Trendique database
    and all stored data.

    Make sure backups exist before execution.
===============================================================================
*/

USE master;
GO

-- ============================================================================
-- Drop Existing Database (If Exists)
-- ============================================================================

IF EXISTS (
    SELECT 1
    FROM sys.databases
    WHERE name = 'Trendique'
)
BEGIN
    ALTER DATABASE Trendique
    SET SINGLE_USER WITH ROLLBACK IMMEDIATE;

    DROP DATABASE Trendique;
END
GO


-- ============================================================================
-- Create Database
-- ============================================================================

CREATE DATABASE Trendique;
GO


-- ============================================================================
-- Switch Database
-- ============================================================================

USE Trendique;
GO


-- ============================================================================
-- Create Schemas
-- ============================================================================

CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO


-- ============================================================================
-- Validation
-- ============================================================================

SELECT name
FROM sys.schemas;
GO
