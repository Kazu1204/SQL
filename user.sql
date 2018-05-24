set line 500
col username for a30
col default_tablespace for a30
select username,default_tablespace from dba_users where username like 'APUSR%';

col owner for a30
col object_name for a40 
select distinct owner,object_name from dba_objects
where owner like 'APUSR%'
order by owner;
