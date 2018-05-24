set echo on
set line 500
col name for a15
select name,type,total_mb,free_mb from v$asm_diskgroup;
