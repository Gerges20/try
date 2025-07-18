@echo off

:: ÊİÚíá RDP
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0 /f
netsh advfirewall firewall set rule group="Remote Desktop" new enable=Yes

:: ÅÚÏÇÏ ÇáÈÇÓæÑÏ
set password=@#Disala123456
powershell -Command "Set-LocalUser -Name 'runneradmin' -Password (ConvertTo-SecureString -AsPlainText '%password%' -Force)"

:: ÇÓÊÎÑÇÌ IP
for /f "tokens=2 delims=:" %%a in ('ipconfig ^| findstr /i "IPv4" ^| findstr /v "169.254"') do set myip=%%a
set myip=%myip:~1%

:: ÊÚííä ÇÓã ÇáãÓÊÎÏã
set myuser=runneradmin

:: ÍİÙ ÇáÈíÇäÇÊ İí ãáİ
echo IP Address : %myip% > rdp-info.txt
echo Username   : %myuser% >> rdp-info.txt
echo Password   : %password% >> rdp-info.txt

:: ÚÑÖ Çáãáİ ÈÚÏ ÇáÅäÊåÇÁ
notepad rdp-info.txt
