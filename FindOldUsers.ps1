#### Find Users that haven't logged in in X days and print to CSV

$DayCount = 90
$Date = [DateTime]::Today.AddDays(0 - $DayCount)
$FileDate = $Date.ToFileTime()
$OU = 'OU=Employees,OU=Users,OU=Example,DC=XXX,DC=local'

Get-ADUser -Filter {LastLogonTimeStamp -lt $FileDate -and Enabled -eq $true} -SearchBase $OU -Properties name,SamAccountName,LastLogonTimeStamp | 
Select-Object @{Name = "Name"; Expression = {$_.name}}, @{Name = "Username"; Expression = {$_.SamAccountName}}, @{Label='Last Logon Time';;Expression={[datetime]::FromFileTime($_.'LastLogonTimeStamp')}} |
Export-Csv -Path "C:\users\$env:USERNAME\Desktop\oldusers.csv"

#############################################
