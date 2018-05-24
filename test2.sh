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
  for i in 1..50 loop
    fname := (dbms_random.string('A',30));
    lname := (dbms_random.string('A',30));
    EXECUTE IMMEDIATE 'INSERT INTO CUSTOMERS(CUSTOMER_ID,CUST_FIRST_NAME,CUST_LAST_NAME) VALUES((select MAX(CUSTOMER_ID) from CUSTOMERS)+1,:fn,:ln)' using fname,lname;
  /*EXECUTE IMMEDIATE 'UPDATE CUSTOMERS SET CUST_FIRST_NAME=:fn,CUST_LAST_NAME=:ln WHERE CUSTOMER_ID=:pro' using fname,lname,i;
    EXECUTE IMMEDIATE 'UPDATE PRODUCT_DESCRIPTIONS SET TRANSLATED_NAME=:fn,TRANSLATED_DESCRIPTION=:ln WHERE PRODUCT_ID=:pro' using fname,lname,i;
    EXECUTE IMMEDIATE 'DELETE FROM orders where ORDER_ID=:del' using i; */
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
