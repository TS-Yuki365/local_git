with stg_CH2MCAL as(
     select *
     from {{ source('SNOWPIPE_DB_ADMINISTRATION', 'SNOWPIPE_DB_CH2MCAL') }}
)
select * from stg_CH2MCAL
where ldts = (select max(ldts) from stg_CH2MCAL)

