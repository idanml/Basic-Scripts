# Basic-Scripts

## mytask.ps1
create new txt file on c:\output path and open a notepad in edit mode of this file

## mytask2.ps1
get 2 variable - TaskName and WaitSeconds
Create a new scheduled task with the name of TaskName Variable, the task will run "mytask.ps1" every 1 min for WaitSeconds (variable) then disable.

### functions
* Create-Task - new scheduled task
* Change-TaskStatus - Toggle the task status enable-disable
* Get-AllTasks - display all tasks from "mytasks" folder

```
.\mytask2.ps1 -TaskName "MyCoolTaskName" -WaitSeconds "120"
```

## Password-vslidator.sh
validate that the password cpntain at least 10 chracters, at least one number, low letter and capital letter, return an appropriate messaage
```
./password-validator.sh "MyP@ssw0rd!"
```
