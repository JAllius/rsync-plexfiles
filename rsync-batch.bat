@echo off
set win_src[0]=V:\unsecured
set win_src[1]=Z:\Games

for /F "tokens=2 delims==" %%s in ('set win_src[') do (
echo %%s
set win_src_path=%%s
echo %win_src_path%
)

PAUSE

set win_src_path=V:\secured
set src_drive=%win_src_path:\=/%
set win_dst_path= %~dp0
set dst_drive=%win_dst_path:\=/%

echo Make sure the following paths are correct and don't include / in file or folder names
echo SRC: %win_src_path% 
echo DST: %win_dst_path%

for %%g in ("%win_src_path%") do set foldername=%%~nxg

choice /c yn /m "Yes or No"
if errorlevel==2 exit

wsl sudo sh -c "mkdir -p /mnt/src_rsync_drive/%foldername%; mount -r -t drvfs %src_drive% /mnt/src_rsync_drive/%foldername%; mkdir -p /mnt/dst_rsync_drive; mount -t drvfs %dst_drive% /mnt/dst_rsync_drive; rsync -av /mnt/src_rsync_drive/%foldername% /mnt/dst_rsync_drive"
echo Last complete rsync: %DATE% %TIME%>%win_dst_path%\rsync_date.txt
PAUSE
::echo Window closes in 3 seconds.
::timeout 3 >nul
exit