with stg_CH2MCALKB as(
     select *
     from {{ source('SNOWPIPE_DB_ADMINISTRATION','SNOWPIPE_DB_CH2MCALKB') }}
)
select * from stg_CH2MCALKB
where ldts = (select max(ldts) from stg_CH2MCALKB)