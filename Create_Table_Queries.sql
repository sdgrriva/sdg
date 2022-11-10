
select column_name, data_type from sales_order;


select column_name, is_nullable, data_type, character_maximum_length, numeric_precision, datetime_precision
from information_schema.columns
where table_schema = 'LANDING_MAG'
and table_name = 'SALES_ORDER'
and column_name in('entity_id',
'state',
'status',
'coupon_code',
'coupon_rule_name',
'store_id',
'discount_amount',
'shipping_amount',
'reward_currency_amount',
'grand_total',
'total_qty_ordered',
'quote_id',
'oms_cancel_reason_code',
'shipping_address_id',
'shipping_method',
'created_at')
order by ordinal_position asc;

select column_name, is_nullable, data_type, character_maximum_length, numeric_precision, datetime_precision
from information_schema.columns
where table_schema = 'LANDING_MAG'
and table_name = 'SALES_ORDER'
and column_name in('entity_id'
                   , 'state'
                   ,'status'
                   ,'coupon_code'
                   ,'coupon_rule_name'
                   ,'store_id'
                   ,'discount_amount'
                   ,'shipping_amount'
                   ,'reward_currency_amount'
                   ,'grand_total'
                   ,'total_qty_ordered'
                   ,'quote_id'
                   ,'oms_cancel_reason_code'
                   ,'shipping_address_id'
                   ,'shipping_method'
                   ,'created_at'
                  )
order by ordinal_position asc;


SELECT TOP 10 * FROM SALES_ORDER;
SELECT TOP 10 * FROM SALES_ORDER_ITEM;
SELECT TOP 10 * FROM QUOTE;
SELECT TOP 10 * FROM QUOTE_ITEM;
/*
Sales_Order
Sales_Order_Item
Quote
Quote_Item
Quote_address
sales_order_status_state
sales_order_status
salesrule_coupon
salesrule
store
oms_cancel_reason -- we need to load this into Snowflake first
sales_order_address
catalog_product_entity
catalog_product_entity_varchar
eav_attribute
catalog_category_product
*/



select
'create table ' ''||TABLE_NAME||'' ' ('
  listagg(''||COLUMN_NAME||'' ', ' ''||DATA||'', ' ')
  name varchar(100) not null,
  active boolean default true
);
from btech.cfg.mag_info_schema;

SELECT 
    listagg(TABLE_NAME, ', ') AS ODS_TABLE_NAME, --WITHIN GROUP (ORDER BY TABLE_NAME) AS TABLE_NAME,
    listagg(ODS_COLUMN_NAME, ', ') AS ODS_COLUMN_NAMES,-- WITHIN GROUP (ORDER BY COLUMN_NAME) AS COLUMN_NAMES,
    listagg(IS_NULLABLE, ', ') AS ODS_IS_NULLABLE,-- WITHIN GROUP (ORDER BY IS_NULLABLE) AS IS_NULLABLE,
    listagg(ODS_DATA_TYPE, ', ') AS ODS_DATA_TYPES, --WITHIN GROUP (ORDER BY ODS_DATA_TYPE) AS ODS_DATA_TYPE
    listagg(ODS_CHARACTER_MAXIMUM_LENGTH, ', ') AS ODS_CHARACTER_MAXIMUM_LENGTHS,
    listagg(ODS_NUMERIC_PRECISION, ', ') AS ODS_NUMERIC_PRECISIONS,
    listagg(ODS_DATETIME_PRECISION, ', ') AS ODS_DATETIME_PRECISIONS
FROM MAG_INFO_SCHEMA
ORDER BY ODS_COLUMN_NAME;


SELECT 
'select '''||TABLE_NAME||''' as Table_name,count(*) from LANDING_MAG."'||TABLE_NAME||'" UNION ' 
FROM CFG.MAG_LOADING_TABLE_NAME;

// DYNAMIC QUERY -- CHANGING TABLES' NAME
SELECT ----METTI ANCHE LO SCHEMA NAME!!!!!!!!
'CREATE IF NOT EXISTS TABLE CFG.'||TABLE_NAME||' (' ||LISTAGG(COLUMN_NAME, ', ') ||') '
--CASE
--    WHEN LISTAGG(ODS_DATA_TYPE) = 'NUMBER' THEN 'NUMBER'
--    WHEN LISTAGG(ODS_DATA_TYPE) = 'TEXT'   THEN 'TEXT'
--END
    
   /* case 
        when column1 = 1 then 'one'
        when column1 = 2 then 'two'
        when column1 is null then 'NULL'
        else 'other'
    end as result
    */
-- FROM (SELECT 
--    listagg(TABLE_NAME, ', ') AS ODS_TABLE_NAME, --WITHIN GROUP (ORDER BY TABLE_NAME) AS TABLE_NAME,
--    listagg(ODS_COLUMN_NAME, ', ') AS ODS_COLUMN_NAMES,-- WITHIN GROUP (ORDER BY COLUMN_NAME) AS COLUMN_NAMES,
--    listagg(IS_NULLABLE, ', ') AS ODS_IS_NULLABLE,-- WITHIN GROUP (ORDER BY IS_NULLABLE) AS IS_NULLABLE,
--    listagg(ODS_DATA_TYPE, ', ') AS ODS_DATA_TYPES, --WITHIN GROUP (ORDER BY ODS_DATA_TYPE) AS ODS_DATA_TYPE
--    listagg(ODS_CHARACTER_MAXIMUM_LENGTH, ', ') AS ODS_CHARACTER_MAXIMUM_LENGTHS,
--    listagg(ODS_NUMERIC_PRECISION, ', ') AS ODS_NUMERIC_PRECISIONS,
--    listagg(ODS_DATETIME_PRECISION, ', ') AS ODS_DATETIME_PRECISIONS
FROM MAG_INFO_SCHEMA
GROUP BY TABLE_NAME
;




SELECT 
    TABLE_NAME,--listagg(TABLE_NAME, ', ') AS ODS_TABLE_NAME, --WITHIN GROUP (ORDER BY TABLE_NAME) AS TABLE_NAME,
    listagg(ODS_COLUMN_NAME, ', ') AS ODS_COLUMN_NAMES,-- WITHIN GROUP (ORDER BY COLUMN_NAME) AS COLUMN_NAMES,
    listagg(IS_NULLABLE, ', ') AS ODS_IS_NULLABLE,-- WITHIN GROUP (ORDER BY IS_NULLABLE) AS IS_NULLABLE,
    listagg(ODS_DATA_TYPE, ', ') AS ODS_DATA_TYPES, --WITHIN GROUP (ORDER BY ODS_DATA_TYPE) AS ODS_DATA_TYPE
    listagg(ODS_CHARACTER_MAXIMUM_LENGTH, ', ') AS ODS_CHARACTER_MAXIMUM_LENGTHS,
    listagg(ODS_NUMERIC_PRECISION, ', ') AS ODS_NUMERIC_PRECISIONS,
    listagg(ODS_DATETIME_PRECISION, ', ') AS ODS_DATETIME_PRECISIONS
FROM MAG_INFO_SCHEMA
GROUP BY TABLE_NAME
ORDER BY ODS_COLUMN_NAME
;


SELECT
    'CREATE TABLE IF NOT EXISTS  ' ||TABLE_NAME|| ' (' || listagg(COLUMN_NAME, ' ') || ' '||
    
CASE ODS_DATA_TYPE
WHEN 'NUMBER' THEN 'NUMBER('||ODS_NUMERIC_PRECISION||', 0)'
WHEN 'TEXT' THEN 'TEXT('||ODS_CHARACTER_MAXIMUM_LENGTH||')'
WHEN 'DATETIME' THEN 'DATETIME('||ODS_DATETIME_PRECISION||')'
END, ','


FROM BTECH.CFG.MAG_INFO_SCHEMA
GROUP BY TABLE_NAME ||
');';
FROM BTECH.CFG.MAG_INFO_SCHEMA
GROUP BY TABLE_NAME;


CREATE OR REPLACE TABLE ||TABLE_NAME||
FROM BTECH.CFG.MAG_INFO_SCHEMA;





select
'create table if not exists ODS_MAG.' || TABLE_NAME || ' (' || (
    select
    listagg(COLUMN_NAME || ' ' ||
        CASE is1.ODS_DATA_TYPE
            WHEN 'NUMBER' THEN 'NUMBER(' || ODS_NUMERIC_PRECISION || ', 0)'
            WHEN 'TEXT' THEN 'TEXT(' || ODS_CHARACTER_MAXIMUM_LENGTH || ')'
            WHEN 'DATETIME' THEN 'DATETIME(' || ODS_DATETIME_PRECISION || ')'
            END, ',') WITHIN GROUP (order by COLUMN_NAME)
    
    from BTECH.CFG.MAG_INFO_SCHEMA is1
    group by table_name) || ');'
from (select distinct table_name from BTECH.CFG.MAG_INFO_SCHEMA);




select
'create table if not exists ODS_MAG.' || TABLE_NAME || ' (' || (
    select
    listagg(COLUMN_NAME || ' ' ||
        CASE is1.ODS_DATA_TYPE
            WHEN 'NUMBER' THEN 'NUMBER(' || ODS_NUMERIC_PRECISION || ', 0)'
            WHEN 'TEXT' THEN 'TEXT(' || ODS_CHARACTER_MAXIMUM_LENGTH || ')'
            WHEN 'DATETIME' THEN 'DATETIME(' || ODS_DATETIME_PRECISION || ')'
            END, ',') WITHIN GROUP (order by COLUMN_NAME)
    
    from mag_information_schema_external_source is1
    group by table_name) || ');'
from (select distinct table_name from mag_information_schema_external_source);