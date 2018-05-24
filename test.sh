#!/bin/sh
sqlplus APUSR_SN01_SB01/apusr_sn01_sb01@ORCL11g<< EOF
set serveroutput on

var cus number;
var pro number;
var del number;
var fn varchar2;
var ln varchar2;

declare
  cusid number;
  proid number;
  delid number;
  fname varchar2(30);
  lname varchar2(30);

begin
  for i in 1..5000 loop
    fname := (dbms_random.string('A',30));
    lname := (dbms_random.string('A',30));
    EXECUTE IMMEDIATE 'select trunc(dbms_random.value(12391223,999912239)) from dual' into cusid;
    EXECUTE IMMEDIATE 'select trunc(dbms_random.value(1,1000)) from dual' into proid;
    EXECUTE IMMEDIATE 'select trunc(dbms_random.value(1,4500000)) from dual' into delid;
    EXECUTE IMMEDIATE 'INSERT INTO CUSTOMERS(CUSTOMER_ID,CUST_FIRST_NAME,CUST_LAST_NAME) VALUES(:cus,:fn,:ln)' using cusid,fname,lname;
    EXECUTE IMMEDIATE 'UPDATE CUSTOMERS SET CUST_FIRST_NAME=:fn,CUST_LAST_NAME=:ln WHERE CUSTOMER_ID=:pro' using fname,lname,proid;
    EXECUTE IMMEDIATE 'UPDATE PRODUCT_DESCRIPTIONS SET TRANSLATED_NAME=:fn,TRANSLATED_DESCRIPTION=:ln WHERE PRODUCT_ID=:pro' using fname,lname,proid;
    EXECUTE IMMEDIATE 'DELETE FROM orders where ORDER_ID=:del' using delid;
    commit;
  /*dbms_output.put_line(cusid);
    dbms_output.put_line(proid);
    dbms_output.put_line(fname);
    dbms_output.put_line(lname);*/
  end loop;
end;
/
exit
EOF
