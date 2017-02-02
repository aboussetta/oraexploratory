
## Do the following:

### configuration and environment file
	config.sh

### create main table
	cr_cpuwl.sql

### generate and create external table
  gen_cpuwl_ext.ctl
	cr_cpuwl_ext.ctl

### load data
	1_load.sh
	  sed.sh
	  1_load.sql

### extract data
	2_extract.sh
	  2_extract.sql

### restart tables
	scripts/truncate.sh
