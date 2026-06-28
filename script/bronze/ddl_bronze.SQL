/*
===============================================================================
Create Bronze Layer Tables
===============================================================================

Script Purpose:
    This script creates all tables required for the bronze layer
    of the Trendique Data Warehouse project.

    The bronze layer stores raw transactional and master data
    loaded directly from source systems before cleansing,
    transformation, and modeling.

WARNING:
    Running this script will drop existing bronze tables
    and permanently delete all stored data.

    Ensure backups exist before execution.
===============================================================================
*/

USE Trendique;
GO


/*=============================================================================
    CUSTOMER TABLES
=============================================================================*/

-- Drop and recreate Customer Table
DROP TABLE IF EXISTS bronze.customers;
GO

CREATE TABLE bronze.customers
(
    cst_id                 NVARCHAR(50),
    fll_nme                NVARCHAR(50),
    em                     NVARCHAR(100),
    cty                    NVARCHAR(50),
    ctry                   NVARCHAR(50),
    brd_dte                NVARCHAR(50),
    grd                    NVARCHAR(50)
);
GO


/*=============================================================================
    PRODUCT TABLES
=============================================================================*/

-- Drop and recreate Product Table
DROP TABLE IF EXISTS bronze.products;
GO

CREATE TABLE bronze.products
(
    prd_id                 NVARCHAR(50),
    prd_nm                 NVARCHAR(50),
    ctg                    NVARCHAR(50),
    sctg                   NVARCHAR(50),
    brnd                   NVARCHAR(50),
    unt_pr                 INT,
    cst_pr                 INT,
    stk_qty                INT,
    spp                    NVARCHAR(50)
);
GO


/*=============================================================================
    TRANSACTION TABLES
=============================================================================*/

-- Drop and recreate Transaction Table
DROP TABLE IF EXISTS bronze.transactions;
GO

CREATE TABLE bronze.transactions
(
    trns_id                NVARCHAR(50),
    trns_dte               NVARCHAR(50),
    cst_id                 NVARCHAR(50),
    prd_id                 NVARCHAR(50),
    qty                    INT,
    ord_value              INT,
    pm                     NVARCHAR(50),
    ord_sts                NVARCHAR(50),
    chnl                   NVARCHAR(50),
    nts                    NVARCHAR(50)
);
GO


/*=============================================================================
    VALIDATION
=============================================================================*/

SELECT
    TABLE_SCHEMA,
    TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_SCHEMA = 'bronze';
GO
