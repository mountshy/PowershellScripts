###### Find XP Computers that haven't logged in for 30 days and export to CSV
$DayCount = 30
$Date = [DateTime]::Today.AddDays(0 - $DayCount)
$FileDate = $Date.ToFileTime()

Get-ADComputer -Filter {LastLogonTimeStamp -lt $FileDate -and OperatingSystem -like "Windows XP*"} -Properties cn,LastLogonTimeStamp,operatingSystemVersion,operatingSystem | 
Select-Object @{Name = "Name"; Expression = {$_.cn}}, @{Name = "OS"; Expression = {$_.operatingSystem}}, @{Label='Last Logon Time';;Expression={[datetime]::FromFileTime($_.'LastLogonTimeStamp')}} |
Export-Csv -Path "C:\users\$env:USERNAME\Desktop\oldcomputers.csv"
######
