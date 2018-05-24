set echo on
set line 500
col tablespace_name for a40
col contents for a15
select tablespace_name,contents,segment_space_management from dba_tablespaces;
select 
        d.tablespace_name, 
        現サイズ "現サイズ[MB]", 
        round(現サイズ-空き容量) "使用量[MB]", 
        round((1 - (空き容量/現サイズ))*100) "使用率(%)", 
        空き容量 "空き容量[MB]" 
from 
(SELECT tablespace_name, round(SUM(bytes)/(1024*1024)) "現サイズ" 
FROM dba_data_files GROUP BY tablespace_name) d, 
(SELECT tablespace_name, round(SUM(bytes)/(1024*1024)) "空き容量" 
FROM dba_free_space GROUP BY tablespace_name) f 
where d.tablespace_name=f.tablespace_name; 
