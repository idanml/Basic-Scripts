Set-Content -Path "C:\output.txt" -Force -Value "I love the bootcamp" #create (if needed) and write to the txt file
Start-Process C:\Windows\system32\notepad.exe -filepath "c:\output.txt" #open notepad edit mode of the txt file
