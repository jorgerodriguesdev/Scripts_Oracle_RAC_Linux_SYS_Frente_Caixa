col object_name format a30

select XIDUSN,b.object_name,ORACLE_USERNAME  from v$locked_object a , dba_objects b
where a.object_id = b.object_id
order by a.object_id
/