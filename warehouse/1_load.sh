#!/bin/bash

./scripts/sed.sh

sqlplus -s /nolog <<-EOF
connect run_awr/run_awr

@scripts/run_awr_cpuwl/3_cr_ext.sql
select count(*) from awr_cpuwl_ext;

@scripts/1_load.sql
select count(*) from awr_cpuwl;

EOF
echo '-----'
