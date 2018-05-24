set echo on
set line 500
col member for a40
select group#,status,sequence#,members,first_change# from v$LOG;
select V$LOG.group#,v$LOGFILE.member from v$LOG,v$LOGFILE where V$LOG.group# = V$LOGFILE.group#;
