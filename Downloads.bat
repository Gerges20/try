@echo off

:: ����� RDP
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0 /f
netsh advfirewall firewall set rule group="Remote Desktop" new enable=Yes

:: ����� ��������
set password=@#Disala123456
powershell -Command "Set-LocalUser -Name 'runneradmin' -Password (ConvertTo-SecureString -AsPlainText '%password%' -Force)"

:: ������� IP
for /f "tokens=2 delims=:" %%a in ('ipconfig ^| findstr /i "IPv4" ^| findstr /v "169.254"') do set myip=%%a
set myip=%myip:~1%

:: ����� ��� ��������
set myuser=runneradmin

:: ��� �������� �� ���
echo IP Address : %myip% > rdp-info.txt
echo Username   : %myuser% >> rdp-info.txt
echo Password   : %password% >> rdp-info.txt

:: ��� ����� ��� ��������
notepad rdp-info.txt
