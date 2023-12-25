with stg_CH2MCCAL as(
     select * 
     from {{ source('SNOWPIPE_DB_ADMINISTRATION','SNOWPIPE_DB_CH2MCCAL') }}
)
select * from stg_CH2MCCAL
where ldts = (select max(ldts) from stg_CH2MCCAL)
