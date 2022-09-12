$path = convert-path ..\..\..\Program\NotITG*.exe
echo "Program path is $path"
(get-content -encoding utf8 ..\metrics.ini) -replace '^ExecParams="[^"]+"',"ExecParams=`"$path`"" `
| out-string `
| %{[Text.Encoding]::UTF8.GetBytes($_)} `
| set-content -encoding byte -path ..\metrics.ini
echo "Updated metrics.ini"
(new-object -comobject wscript.shell).popup("done.",0,"Enable_Restart.bat",0)
