with
    orgmaster as (select * from {{ref('dm_DE_ORGMASTER') }})

select
      orgmaster.SZCD
     ,orgmaster.BMNCD
     ,orgmaster.BMNNAM
     ,orgmaster.RSKBMNNAM
     ,orgmaster.BUCD
     ,orgmaster.SSKBUNAM1
     ,orgmaster.RSKBUNAM
     ,orgmaster.STKCD
     ,orgmaster.SSKSTKNAM
     ,orgmaster.RSKSTKNAM
     ,orgmaster.EBNSMS1
     ,orgmaster.EBNSMS2
     ,orgmaster.KKRGCD
     ,orgmaster.SSKKKRGNAM
     ,orgmaster.RSKKRGNAM
     ,orgmaster.LOCCD
     ,orgmaster.LOCNAM
     ,orgmaster.KMCD
from orgmaster