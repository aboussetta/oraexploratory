drop table AWR_CPUWL_EXT purge; 

-- the external table
        -- CREATE DIRECTORY statements needed for files
        ------------------------------------------------------------------------
        CREATE OR REPLACE DIRECTORY AWR_STAGE_DIR AS '/home/oracle/dba/run_awr/stage/';
        CREATE OR REPLACE DIRECTORY AWR_STAGE_DIR_LOG AS '/home/oracle/dba/run_awr/stage/log/';


        -- CREATE TABLE statement for external table:
        ------------------------------------------------------------------------
        CREATE TABLE "AWR_CPUWL_EXT"
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
        )
        ORGANIZATION external
        (
          TYPE oracle_loader
          DEFAULT DIRECTORY AWR_STAGE_DIR
          ACCESS PARAMETERS
          (
            RECORDS DELIMITED BY NEWLINE CHARACTERSET US7ASCII
            BADFILE 'AWR_STAGE_DIR_LOG':'cpuwl_all.bad'
            DISCARDFILE 'AWR_STAGE_DIR_LOG':'cpuwl_all.discard'
            LOGFILE 'AWR_STAGE_DIR_LOG':'cpuwl_all.log_xt'
            READSIZE 1048576
            FIELDS TERMINATED BY "," LDRTRIM
            MISSING FIELD VALUES ARE NULL
            REJECT ROWS WITH ALL NULL FIELDS
            (
              "INSTNAME" CHAR(255)
                TERMINATED BY ",",
              "DB_ID" CHAR(255)
                TERMINATED BY ",",
              "HOSTNAME" CHAR(255)
                TERMINATED BY ",",
              "ID" CHAR(255)
                TERMINATED BY ",",
              "TM" CHAR(255)
                TERMINATED BY ","
                DATE_FORMAT DATE MASK "MM/DD/YY HH24:MI:SS",
              "INST" CHAR(255)
                TERMINATED BY ",",
              "DUR" CHAR(255)
                TERMINATED BY ",",
              "CPU" CHAR(255)
                TERMINATED BY ",",
              "LOADAVG" CHAR(255)
                TERMINATED BY ",",
              "AAS_CPU" CHAR(255)
                TERMINATED BY ",",
              "RSRCMGRPCT" CHAR(255)
                TERMINATED BY ",",
              "OSCPUPCT" CHAR(255)
                TERMINATED BY ",",
              "OSCPUSYS" CHAR(255)
                TERMINATED BY ",",
              "OSCPUIO" CHAR(255)
                TERMINATED BY ","
            )
          )
          location
          (
            'cpuwl_all.csv'
          )
        )REJECT LIMIT UNLIMITED;
