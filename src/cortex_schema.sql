USE ROLE sysadmin;

/*--
• database, schema, warehouse and stage creation
--*/

-- create demo database
CREATE OR REPLACE DATABASE cortex_analyst_demo;

-- create schema
CREATE OR REPLACE SCHEMA cortex;

-- create warehouse
CREATE OR REPLACE WAREHOUSE cortex_analyst_wh
    WAREHOUSE_SIZE = 'large'
    WAREHOUSE_TYPE = 'standard'
    AUTO_SUSPEND = 60
    AUTO_RESUME = TRUE
    INITIALLY_SUSPENDED = TRUE
COMMENT = 'warehouse for cortex analyst demo';


USE WAREHOUSE cortex_analyst_wh;

CREATE STAGE raw_data DIRECTORY = (ENABLE = TRUE);

create database PUBLIC_DB;

