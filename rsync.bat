@echo off
set win_src_path=V:\unsecured
set src_drive=%win_src_path:\=/%
set win_dst_path= %~dp0
set dst_drive=%win_dst_path:\=/%

echo Make sure the following paths are correct and don't include / in file or folder names
echo SRC: %win_src_path% 
echo DST: %win_dst_path%

for %%g in ("%win_src_path%") do set foldername=%%~nxg

choice /c yn /m "Yes or No"
if errorlevel==2 exit

wsl sudo sh -c "mkdir -p /mnt/src_rsync_drive/%foldername%; mount -r -t drvfs %src_drive% /mnt/src_rsync_drive/%foldername%; mkdir -p /mnt/dst_rsync_drive; mount -t drvfs %dst_drive% /mnt/dst_rsync_drive; rsync -av /mnt/src_rsync_drive/%foldername% /mnt/dst_rsync_drive --delete-delay"
echo Last comlete rsync: %DATE% %TIME%>%win_dst_path%\rsync_date.txt
PAUSE
::echo Window closes in 3 seconds.
::timeout 3 >nul
exit