# If doing this on a client that just has the client tools and no database engine then you have to use 32 bit Powershell as Microsoft
# have not provided a 64 bit assembly for the client tools distribution.
# If you are running this on a server that has the database engine then you don't need to use 32 bit Powershell as the 64 bit assembly
# is present in the C:\Program Files\Microsoft SQL Server\120\Shared directory
 
# For SQL 2014 you have to add the reference to Microsoft.SqlServer.XE.Core.dll. You don't need this for SQL 2012
 
Add-Type -Path 'C:\Program Files\Microsoft SQL Server\130\Shared\Microsoft.SqlServer.XE.Core.dll'
Add-Type -Path 'C:\Program Files\Microsoft SQL Server\130\Shared\Microsoft.SqlServer.XEvent.Linq.dll'
 
$events = New-Object Microsoft.SqlServer.XEvent.Linq.QueryableXEventData('.\AF_xe_reader.xel')
 
#$events | Foreach-Object { $_.Actions | Where-Object { $_.Name -eq 'client_hostname' } } | Group-Object Value

$events | Foreach-Object { Write-Host $_.name }