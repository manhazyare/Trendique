
/*
===============================================================================
Create Silver Layer Tables
===============================================================================

Script Purpose:
    This script creates all tables required for the silver layer
    of the Trendique Data Warehouse project.

    The silver layer stores cleaned, standardized, and transformed
    data derived from the bronze layer.

    Additional metadata columns are included to support
    auditing and warehouse tracking.

WARNING:
    Running this script will drop existing silver tables
    and permanently delete their data.
===============================================================================
*/

USE Trendique;
GO


/*=============================================================================
    CUSTOMER TABLES
=============================================================================*/

-- Drop and recreate Customer Table
DROP TABLE IF EXISTS silver.customers;
GO

CREATE TABLE silver.customers
(
    cst_id                 NVARCHAR(50),
    fll_nme                NVARCHAR(50),
    em                     NVARCHAR(100),
    cty                    NVARCHAR(50),
    ctry                   NVARCHAR(50),
    brd_dte                DATE,
    grd                    NVARCHAR(50),

    dwh_create_date        DATETIME2 DEFAULT GETDATE()
);
GO


/*=============================================================================
    PRODUCT TABLES
=============================================================================*/

-- Drop and recreate Product Table
DROP TABLE IF EXISTS silver.products;
GO

CREATE TABLE silver.products
(
    prd_id                 NVARCHAR(50),
    prd_nm                 NVARCHAR(50),
    ctg                    NVARCHAR(50),
    sctg                   NVARCHAR(50),
    brnd                   NVARCHAR(50),
    unt_pr                 INT,
    cst_pr                 INT,
    stk_qty                INT,
    spp                    NVARCHAR(50),

    dwh_create_date        DATETIME2 DEFAULT GETDATE()
);
GO


/*=============================================================================
    TRANSACTION TABLES
=============================================================================*/

-- Drop and recreate Transaction Table
DROP TABLE IF EXISTS silver.transactions;
GO

CREATE TABLE silver.transactions
(
    trns_id                NVARCHAR(50),
    trns_dte               DATE,
    cst_id                 NVARCHAR(50),
    prd_id                 NVARCHAR(50),
    qty                    INT,
    ord_value              INT,
    pm                     NVARCHAR(50),
    ord_sts                NVARCHAR(50),
    chnl                   NVARCHAR(50),
    nts                    NVARCHAR(250),

    dwh_create_date        DATETIME2 DEFAULT GETDATE()
);
GO


/*=============================================================================
    VALIDATION
=============================================================================*/

SELECT
    TABLE_SCHEMA,
    TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_SCHEMA = 'silver';
GO


