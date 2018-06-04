#### Move disabled users to OU

$OU = 'OU=Employees,OU=Users,OU=Example,DC=XXX,DC=local'
$DisabledOU = 'OU=DisabledUsers,OU=Users,OU=Example,DC=XXX,DC=local'

Get-ADUser -Filter {Enabled -eq $false} -SearchBase $OU | 
Select-Object DistinguishedName | 
foreach {
Move-ADObject -Identity $_.DistinguishedName -TargetPath $DisabledOU
}

#############################################
