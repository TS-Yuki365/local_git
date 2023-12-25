with stg_CH2MCCALKB as(
     select * 
     from {{ source('SNOWPIPE_DB_ADMINISTRATION','SNOWPIPE_DB_CH2MCCALKB') }}
)
select * from stg_CH2MCCALKB
where ldts = (select max(ldts) from stg_CH2MCCALKB)