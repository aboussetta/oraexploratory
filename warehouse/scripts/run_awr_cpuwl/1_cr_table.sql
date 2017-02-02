-- the final table, get col names from the script 
drop table AWR_CPUWL purge;
  CREATE TABLE "AWR_CPUWL"
   (
         "INSTNAME"      CHAR(255),
         "DB_ID"         CHAR(255),
         "HOSTNAME"      CHAR(255),
         "ID"            CHAR(255),
         "TM"            TIMESTAMP(3),
         "INST"          CHAR(255),
         "DUR"           CHAR(255),
         "CPU"           CHAR(255),
         "LOADAVG"       CHAR(255),
         "AAS_CPU"       CHAR(255),
         "RSRCMGRPCT"    CHAR(255),
         "OSCPUPCT"      CHAR(255),
         "OSCPUSYS"      CHAR(255),
         "OSCPUIO"       CHAR(255)
   );

