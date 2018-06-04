###### Remove XP Computers that haven't logged in for 30 days
$DayCount = 30
$Date = [DateTime]::Today.AddDays(0 - $DayCount)
$FileDate = $Date.ToFileTime()
$OU = 'OU=DisabledPCs,OU=Computers,OU=Example,DC=XXX,DC=local'

Get-ADComputer -Filter {LastLogonTimeStamp -lt $FileDate -and OperatingSystem -like "Windows XP*"} -Properties cn,LastLogonTimeStamp,operatingSystemVersion,operatingSystem | 
Remove-ADComputer -Confirm
######
