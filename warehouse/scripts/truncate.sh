sqlplus -s /nolog <<-EOF
connect run_awr/run_awr

truncate table awr_cpuwl;
select count(*) from awr_cpuwl;

EOF
echo '-----'

