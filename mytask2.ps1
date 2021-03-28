param($TaskName, $WaitSeconds)

#Create New task
function  Create-Task{
    param (
        [string]$taskName
    )
    $task = Get-ScheduledTask | Where-Object { $_.TaskName -eq $taskName }
    if ($null -eq $task) {
    $taskAction = New-ScheduledTaskAction -Execute 'C:\Windows\system32\WindowsPowerShell\v1.0\powershell.exe' -Argument 'C:\mytask.ps1'
    $taskTrigger = New-ScheduledTaskTrigger -at (Get-Date) -Once -RepetitionInterval (New-TimeSpan -Minutes 1)
    $taskprincipal = New-ScheduledTaskPrincipal -RunLevel Highest -UserId "windows"
    Register-ScheduledTask -TaskName $taskName -Action $taskAction -Trigger $taskTrigger -Principal $taskprincipal -TaskPath "mytasks"
    }
    else {
    Write-Host "$taskName already exist, task eanbled for $WaitSeconds seconds"
    $task | Enable-ScheduledTask
    }
}

#Enable-Disable task
function  Change-TaskStatus{
    param (
        [string]$taskName
    )
    $task = Get-ScheduledTask | Where-Object { $_.TaskName -eq $taskName }
    if ($null -ne $task) {
        if ($task.State -eq 'ready')
        {
        $task | Disable-ScheduledTask
        }
        else
        {
        $task | Enable-ScheduledTask 
        }
    }
}

#get all my tasks
function Get-AllTasks {
    Get-ScheduledTask | Where-Object { ($_.TaskPath -eq "\mytasks\") -and ($_.State -eq "ready") } | ForEach-Object {Write-Host (-join($_.TaskPath,$_.TaskName)) }
}

Create-Task -taskName $TaskName
Start-Sleep -s $WaitSeconds
Change-TaskStatus -taskName $TaskName
Get-AllTasks