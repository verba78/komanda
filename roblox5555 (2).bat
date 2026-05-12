@echo off
chcp 65001 > nul
cd /d "%~dp0"

set "BIN=%~dp0bin\"
set "LISTS=%~dp0lists\"

cd /d "%BIN%"

start "zapret: roblox" /min "%BIN%winws.exe" ^
--wf-tcp=80,443,30000-60000 ^
--wf-udp=443,30000-60000 ^
--filter-tcp=80,443 ^
--hostlist="%LISTS%list-general.txt" ^
--dpi-desync=fake,fakedsplit ^
--dpi-desync-repeats=4 ^
--dpi-desync-fooling=md5sig ^
--new ^
--filter-udp=443 ^
--dpi-desync=fake ^
--dpi-desync-repeats=4 ^
--new ^
--filter-udp=30000-60000 ^
--dpi-desync=fake ^
--dpi-desync-any-protocol=1 ^
--dpi-desync-repeats=6