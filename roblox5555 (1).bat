@echo off
chcp 65001 > nul
cd /d "%~dp0"

call service.bat status_zapret
call service.bat check_updates
call service.bat load_game_filter
echo:

set "BIN=%~dp0bin\"
set "LISTS=%~dp0lists\"

:: Порты Roblox
set "ROBLOX_TCP=30055,30056,30057,30058"
set "ROBLOX_UDP=49152-65535"

cd /d "%BIN%"

start "zapret: roblox" /min "%BIN%winws.exe" ^
--wf-tcp=80,443,2053,2083,2087,2096,8443,%ROBLOX_TCP%,%GameFilter% ^
--wf-udp=443,19294-19344,50000-50100,%ROBLOX_UDP%,%GameFilter% ^
--filter-udp=443 ^
--hostlist="%LISTS%list-general.txt" ^
--hostlist-exclude="%LISTS%list-exclude.txt" ^
--ipset-exclude="%LISTS%ipset-exclude.txt" ^
--dpi-desync=fake ^
--dpi-desync-repeats=6 ^
--dpi-desync-fake-quic="%BIN%quic_initial_www_google_com.bin" ^
--new ^
--filter-udp=%ROBLOX_UDP% ^
--dpi-desync=fake ^
--dpi-desync-repeats=6 ^
--dpi-desync-any-protocol=1 ^
--new ^
--filter-tcp=%ROBLOX_TCP% ^
--dpi-desync=fake ^
--dpi-desync-repeats=4 ^
--new ^
--filter-tcp=443 ^
--hostlist="%LISTS%list-google.txt" ^
--ip-id=zero ^
--dpi-desync=fake,fakedsplit ^
--dpi-desync-repeats=6 ^
--dpi-desync-fooling=ts ^
--dpi-desync-fakedsplit-pattern=0x00 ^
--dpi-desync-fake-tls="%BIN%tls_clienthello_www_google_com.bin" ^
--new ^
--filter-tcp=80,443 ^
--hostlist="%LISTS%list-general.txt" ^
--hostlist-exclude="%LISTS%list-exclude.txt" ^
--ipset-exclude="%LISTS%ipset-exclude.txt" ^
--dpi-desync=fake,fakedsplit ^
--dpi-desync-repeats=6 ^
--dpi-desync-fooling=ts ^
--dpi-desync-fakedsplit-pattern=0x00 ^
--dpi-desync-fake-tls="%BIN%tls_clienthello_www_google_com.bin"