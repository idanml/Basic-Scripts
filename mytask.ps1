Set-Content -Path "C:\output.txt" -Force -Value "I love the bootcamp"
Start-Process C:\Windows\system32\notepad.exe -filepath "c:\output.txt"