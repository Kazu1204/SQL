#!/bin/sh

sqlplus -S "ic_user/ic_user" <<END
begin
  loop
    null;
  end loop;
end;
/
END

