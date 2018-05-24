#!/bin/sh

sqlplus -S "ic_user/ic_user"@node1.oracle.com:1521/pdb1 <<END
begin
  loop
    null;
  end loop;
end;
/
END

