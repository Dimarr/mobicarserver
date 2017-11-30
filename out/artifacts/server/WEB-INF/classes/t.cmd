Set Process=java
:start
tasklist | Find /i "%Process%.exe" || (goto Else)
:THEN
Echo %Process% work
Goto start
:ELSE
java NioServer
Goto start
