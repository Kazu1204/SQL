#!/bin/sh
sqlplus APUSR_SN01_SB01/apusr_sn01_sb01@ORCL11g<< EOF
set serveroutput on

var num1 number;
var num2 number;
var num3 number;
var fn varchar2;
var ln varchar2;

declare
  cusid number;
  ordid number;

begin
  for i in 1..100 loop
    EXECUTE IMMEDIATE '(select MAX(CUSTOMER_ID) from CUSTOMERS)' into cusid;
    cusid := cusid + 1;
    EXECUTE IMMEDIATE '(select MIN(ORDER_ID) from ORDERS)' into ordid;
    EXECUTE IMMEDIATE 'INSERT INTO CUSTOMERS(CUSTOMER_ID,CUST_FIRST_NAME,CUST_LAST_NAME) VALUES(:num1,:fn,:ln)' using cusid,'Jackson','Michael';
    EXECUTE IMMEDIATE 'UPDATE CUSTOMERS SET CUST_FIRST_NAME=:fn,CUST_LAST_NAME=:ln WHERE CUSTOMER_ID=:num2' using 'Bowie','David',i;
    EXECUTE IMMEDIATE 'DELETE FROM ORDERS WHERE ORDER_ID=:num3' using ordid;
    commit;
  end loop;
end;
/
exit
EOF
