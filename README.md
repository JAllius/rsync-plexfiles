# rsync-plexfiles

Batch script that is used to sync an existing folder with a backup drive. Place file in target location and change the win_src_path to source directory.
Uses a weird combination of a Windows Host system with WSL subsystem, which has rsync installed. There are probably better solutions to sync files to a BitLocker encrypted drive, but it works for this scenario.

And the batch script doesn't work yet, so run several times if there are several root sourcefolders :D
