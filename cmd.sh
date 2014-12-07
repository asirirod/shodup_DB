#!/bin/sh -x
# Replace UUUUU by your mysql user name, and DDDDD by the
# name of the database in which you want to load the tables.

USER="root"
DATABASE="shodup"

mysql -f --local-infile=1 -u $USER -p $DATABASE < cre.sql
mysql -f --local-infile=1 -u $USER -p $DATABASE < load.sql
