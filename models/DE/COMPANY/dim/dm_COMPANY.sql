with
     A as (select * from {{ref('stg_CH2MCCAL') }}),
     B as (select * from {{ref('stg_CH2MCCALKB') }}),
     C as (select * from {{ref('stg_CH2MCAL') }}),
     D as (select * from {{ref('stg_CH2MCALKB') }})

select 
    A.H2CHOKCALCD AS H2CHOKCAL_CD,
    B.H2CHOKCALNAM AS H2CHOKCAL_CD_NM,
    C.H2CALCD AS H2CAL_CD,
    D.H2CALNAM AS H2CAL_CD_NM,
    C.H2HOLFRSTWRPRDFLG AS H2HOLFRSTWRPRD_FLG,
    C.H2LGRKYFLG AS H2LGRKY_FLG,
    A.EFFDT AS EFFDT,
    TO_VARCHAR(A.H2FY) AS H2FY,
    A.H2YM AS H2YM,
    A.H2DT AS H2DT,
    date_from_parts(to_number(substr(A.H2YM,1,4)),to_number(substr(A.H2YM,5.2)),to_number(A.H2DT)) AS H2YMD,
    C.H2DAYCD AS H2DAY_CD,
    CASE C.H2DAYCD
      WHEN '1' THEN '日'
      WHEN '2' THEN '月'
      WHEN '3' THEN '火'
      WHEN '4' THEN '水'
      WHEN '5' THEN '木'
      WHEN '6' THEN '金'
      WHEN '7' THEN '土'
      ELSE NULL
    END AS H2DAY_CD_NM,
    A.H2CHOKCD AS H2CHOK_CD,
    A.H2CHOKKYFLG AS H2CHOKKY_FLG,
    CASE A.H2CHOKKYFLG
      WHEN '1' THEN '0'
      WHEN '0' THEN '1'
      ELSE NULL
    END AS H2CHOKKADO_FLG
FROM A --直カレンダーマスタ
    LEFT OUTER JOIN B ON A.H2CHOKCALCD = B.H2CHOKCALCD --直カレンダー区分マスタ
    LEFT OUTER JOIN C ON B.H2CALCD = C.H2CALCD AND A.H2FY = C.H2FY AND A.EFFDT = C.EFFDT AND A.H2YM = C.H2YM AND A.H2DT = C.H2DT --カレンダーマスタ
    LEFT OUTER JOIN D ON C.H2CALCD = D.H2CALCD --カレンダー区分マスタ
  WHERE
    CASE 
      WHEN SUBSTR(CURRENT_DATE(), 6, 5) >= '04-01' THEN YEAR(CURRENT_DATE())
      WHEN SUBSTR(CURRENT_DATE(), 6, 5) <= '03-31' THEN YEAR(CURRENT_DATE()) -1
    END -1 <= A.H2FY