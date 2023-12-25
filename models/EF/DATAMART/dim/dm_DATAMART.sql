with
    company as (select * from {{ ref('dm_COMPANY') }}) 

select 
      company.H2CHOKCAL_CD
     ,company.H2CHOKCAL_CD_NM
     ,company.H2CAL_CD
     ,company.H2CAL_CD_NM
     ,company.H2HOLFRSTWRPRD_FLG
     ,company.H2LGRKY_FLG
     ,company.H2FY
     ,company.H2YM
     ,company.H2DT
     ,company.H2YMD
     ,company.H2DAY_CD
     ,company.H2DAY_CD_NM
     ,company.H2CHOK_CD
     ,company.H2CHOKKY_FLG
     ,company.H2CHOKKADO_FLG
from company
