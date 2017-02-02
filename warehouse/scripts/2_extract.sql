
select 
trim(INSTNAME  ) INSTNAME   ,
trim(DB_ID     ) DB_ID      ,
trim(HOSTNAME  ) HOSTNAME   ,
trim(ID        ) ID         ,
trim(TO_CHAR(tm,'MM/DD/YY HH24:MI:SS')) TM,
trim(INST      ) INST       ,
trim(DUR       ) DUR        ,
trim(CPU       ) CPU        ,
trim(LOADAVG   ) LOADAVG    ,
trim(AAS_CPU   ) AAS_CPU    ,
trim(RSRCMGRPCT) RSRCMGRPCT ,
trim(OSCPUPCT  ) OSCPUPCT   ,
trim(OSCPUSYS  ) OSCPUSYS   ,
trim(OSCPUIO   ) OSCPUIO     from awr_cpuwl;

