with stg_ORGMASTER as(
     select *
     from {{ source('SNOWPIPE_DB_ADMINISTRATION','SNOWPIPE_DB_ORGMASTER')}}
)
select * from stg_ORGMASTER
where ldts = (select max(ldts) from stg_ORGMASTER)
