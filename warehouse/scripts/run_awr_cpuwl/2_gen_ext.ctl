-- generate the create external table commands
--  1) get column names from the SQL script
--  2) then execue with:
--          sqlldr run_awr/run_awr 2_gen_ext.ctl
--  3) extract the CREATE DIRECTORY and CREATE TABLE sections from the output 2_gen_ext.log
--  4) create the 3_cr_ext.sql from 2_gen_ext.log with all cols CHAR(255) except the TM with TIMESTAMP(3)
--      also change the table name and file names accordingly

    options (external_table=generate_only)
    load data
    infile '/home/oracle/dba/run_awr/stage/cpuwl.csv'
    badfile '/home/oracle/dba/run_awr/stage/cpuwl.bad'
    discardfile '/home/oracle/dba/run_awr/stage/cpuwl.discard'
    truncate
    into table AWR_CPUWL
    fields terminated by ','
    trailing nullcols
    (
         "INSTNAME"                       ,
         "DB_ID"                          ,
         "HOSTNAME"                       ,
         "ID"                             ,
         "TM" date "MM/DD/YY HH24:MI:SS"  ,
         "INST"                           ,
         "DUR"                            ,
         "CPU"                            ,
         "LOADAVG"                        ,
         "AAS_CPU"                        ,
         "RSRCMGRPCT"                     ,
         "OSCPUPCT"                       ,
         "OSCPUSYS"                       ,
         "OSCPUIO"
    )
