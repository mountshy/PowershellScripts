#### Find Users that haven't logged in for X days and Disable

$DayCount = 90
$Date = [DateTime]::Today.AddDays(0 - $DayCount)
$FileDate = $Date.ToFileTime()
$OU = 'OU=Employees,OU=Users,OU=Example,DC=XXX,DC=local'

Get-ADUser -Filter {LastLogonTimeStamp -lt $FileDate -and Enabled -eq $true} -SearchBase $OU | 
Disable-ADAccount -Confirm

#############################################
