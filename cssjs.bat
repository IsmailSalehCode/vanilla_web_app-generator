ECHO OFF 
SET templName=vanilla_project
@REM  %templName% - variable, referencing the name of the folder, containing the template files

SET source = %~dp0%templName%
@REM  %~dp0 - environment arguments, forming the full path of the folder in which this bat file resides. For more information: https://stackoverflow.com/a/112135/16882316
@REM  %source% - variable, storing the source path of the template items we need to transfer. The variable is formed by concatenating the values of %templName% and %~dp0

set /p "newFolderName=Enter name for the new project: "
@REM  Prompt user for setting the value of %newFolderName%, which will be the designated directory for the transfer of files.

md %newFolderName%
@REM  Creating the folder (the designated directory, referenced in line 10) in the active user path.

SET destination= %cd%\%newFolderName%
:: %destination% - full path of the destination, where template files must be pasted.

robocopy %~dp0%templName% %destination% /E
:: robocopy - function, which copies file data from one location to another. For more information: https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/robocopy

start %destination% .c

cmd /c
:: Terminate cmd 