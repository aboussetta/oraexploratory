
-- merge to main
MERGE INTO awr_cpuwl s1
USING awr_cpuwl_ext s0 
  ON (
        s1.DB_ID    = s0.DB_ID
    AND s1.ID       = s0.ID
    AND s1.TM       = s0.TM
    AND s1.INST     = s0.INST
  )
WHEN MATCHED THEN
  UPDATE SET 
    s1.INSTNAME   = s0.INSTNAME  ,
    s1.HOSTNAME   = s0.HOSTNAME  ,
    s1.DUR        = s0.DUR       ,
    s1.CPU        = s0.CPU       ,
    s1.LOADAVG    = s0.LOADAVG   ,
    s1.AAS_CPU    = s0.AAS_CPU   ,
    s1.RSRCMGRPCT = s0.RSRCMGRPCT,
    s1.OSCPUPCT   = s0.OSCPUPCT  ,
    s1.OSCPUSYS   = s0.OSCPUSYS  ,
    s1.OSCPUIO    = s0.OSCPUIO  
WHEN NOT MATCHED THEN 
  INSERT VALUES (
    s0.INSTNAME  ,    
    s0.DB_ID     ,
    s0.HOSTNAME  ,
    s0.ID        ,
    s0.TM        ,
    s0.INST      ,
    s0.DUR       ,
    s0.CPU       ,
    s0.LOADAVG   ,
    s0.AAS_CPU   ,
    s0.RSRCMGRPCT,
    s0.OSCPUPCT  ,
    s0.OSCPUSYS  ,
    s0.OSCPUIO  );
commit;

