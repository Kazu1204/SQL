set echo on
set line 500
col name for a40
select current_scn,checkpoint_change# from v$database;
select file#,name,checkpoint_change#,status from v$datafile_header;
