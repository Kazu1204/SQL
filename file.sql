set lines 500
set echo on
col TABLESPACE_NAME  format a17
col file_name        format 9999999
col FILE_NAME        format a35
col STATUS           format a10
col MBYTES           format 9,999,990
col INCRE            format 9,999,990
col AUTOEXTENSIBLE   format a7
col ONLINE_STATUS    format a7
select
  file_id,
  tablespace_name,
  file_name,
  status,
  bytes/1024/1024 mbytes,
  increment_by,
  autoextensible,
  online_status
from
  dba_data_files;
