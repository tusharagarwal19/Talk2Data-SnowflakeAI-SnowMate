create or replace TABLE PUBLIC_DB.PUBLIC.CHARGEBACK_DATA (
	START_TIME TIMESTAMP_NTZ(9),
	DOMAIN_NAME VARCHAR(16777216),
	USER_NAME VARCHAR(16777216),
	ROLE_NAME VARCHAR(16777216),
	WAREHOUSE_NAME VARCHAR(16777216),
	WAREHOUSE_SIZE VARCHAR(16777216),
	CREDITS_ATTRIBUTED_COMPUTE NUMBER(10,8),
	QUERY_TEXT VARCHAR(16777216),
	QUERY_TYPE VARCHAR(16777216),
	TOTAL_ELAPSED_TIME NUMBER(38,0)
);



-- Insert data into the CHARGEBACK_DATA table
insert into PUBLIC.CHARGEBACK_DATA (
    START_TIME,         -- TIMESTAMP
    DOMAIN_NAME,        -- VARCHAR
    USER_NAME,          -- VARCHAR
    ROLE_NAME,          -- VARCHAR
    WAREHOUSE_NAME,     -- VARCHAR
    CREDITS_ATTRIBUTED_COMPUTE, -- DECIMAL
    QUERY_TEXT,         -- VARCHAR
    QUERY_TYPE,         -- VARCHAR
    TOTAL_ELAPSED_TIME, -- INTEGER
    WAREHOUSE_SIZE      -- VARCHAR
)
SELECT
    -- Use 'date_time_between' with actual datetime objects instead of strings
    FAKE('en_US', 'date_between', 
         {'start_date': '-365d','end_date':'today'})::TIMESTAMP AS START_TIME,
   DOMAIN_NAME,
    -- Select from a fixed list of usernames
    CHOSEN_USERNAME AS USER_NAME,
    ROLE_NAME,
    WAREHOUSE_NAME,
    CASE 
        WHEN QUERY_TYPE IN ('SHOW', 'DESCRIBE', 'LIST') THEN 0
        ELSE ROUND(TOTAL_ELAPSED_TIME / 1000 * WAREHOUSE_MULTIPLIER, 4) 
    END AS CREDITS_ATTRIBUTED_COMPUTE,
    QUERY_TEXT,
    QUERY_TYPE,
    TOTAL_ELAPSED_TIME,
    WAREHOUSE_SIZE
FROM (
    SELECT
        DOMAIN_NAME,
        CASE 
            WHEN UNIFORM(0, 1, RANDOM()) < 0.5 THEN DOMAIN_NAME || '_USER' 
            ELSE DOMAIN_NAME || '_ADMIN' 
        END AS ROLE_NAME,
        DOMAIN_NAME || '_WH' AS WAREHOUSE_NAME,
        CASE FLOOR(UNIFORM(1, 8, RANDOM()))
            WHEN 1 THEN 'XS'
            WHEN 2 THEN 'S'
            WHEN 3 THEN 'M'
            WHEN 4 THEN 'L'
            WHEN 5 THEN 'XL'
            WHEN 6 THEN 'XXL'
            WHEN 7 THEN 'XXXL'
            ELSE 'XXXXL'
        END AS WAREHOUSE_SIZE,
        CASE 
            WHEN WAREHOUSE_SIZE = 'XS' THEN 0.5
            WHEN WAREHOUSE_SIZE = 'S' THEN 1
            WHEN WAREHOUSE_SIZE = 'M' THEN 1.5
            WHEN WAREHOUSE_SIZE = 'L' THEN 2
            WHEN WAREHOUSE_SIZE = 'XL' THEN 3
            WHEN WAREHOUSE_SIZE = 'XXL' THEN 4
            WHEN WAREHOUSE_SIZE = 'XXXL' THEN 5
            ELSE 6
        END AS WAREHOUSE_MULTIPLIER,
        CASE 
            WHEN UNIFORM(0, 1, RANDOM()) < 0.5 THEN 'SELECT * FROM SALES'
            WHEN UNIFORM(0, 1, RANDOM()) < 0.7 THEN 'SELECT * FROM CUSTOMERS'
            WHEN UNIFORM(0, 1, RANDOM()) < 0.85 THEN 'SELECT * FROM LOCATIONS'
            ELSE 'SELECT * FROM STORES'
        END AS QUERY_TEXT,
        'SELECT' AS QUERY_TYPE,
        ROUND(UNIFORM(500, 1500, RANDOM())) AS TOTAL_ELAPSED_TIME,
        -- Choose usernames from a fixed list
        CHOSEN_USERNAME
    FROM (
        SELECT DOMAIN_NAME,
            CHOSEN_USERNAME
        FROM (
            VALUES 
                ('ESG', 'jason'), 
                ('RAD', 'paullin'), 
                ('FSA', 'benjamin22'), 
                ('MIM', 'jennifervega'), 
                ('ESG', 'mdavis'),
                ('RAD', 'jodysharp'), 
                ('FSA', 'jessicakoch'), 
                ('MIM', 'karennelson'), 
                ('ESG', 'jamieevans'), 
                ('RAD', 'snoble'),
                ('ESG', 'ywilliams'),
                ('MIM', 'gchung'),
                ('FSA', 'fmendez')
        ) AS USER_TABLE(DOMAIN_NAME, CHOSEN_USERNAME)
        CROSS JOIN table(generator(rowcount => 10000)) 
    )
) t;
