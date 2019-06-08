try
{
	add-type -path "C:\Program Files (x86)\Microsoft SQL Server\140\Tools\Binn\ManagementStudio\Extensions\Application\Microsoft.SqlServer.Dac.dll"
	$dacService = new-object Microsoft.SqlServer.Dac.DacServices "Server=localhost,1433;User Id=sa;Password=yourStrong(!)Password;"
	$dp = [Microsoft.SqlServer.Dac.DacPackage]::Load("C:\Users\Joseph\Source\Repos\SqlServerDacPac\DatabaseJOS\bin\Ghana\DatabaseJOS.dacpac")
	$dacService.deploy($dp, "Prueba55", "True") #2nd parameter is db name
}
Catch
    {
        Write-Host "$fileName deployment has been failed"  -foregroundcolor "red"
         $Error | format-list -force
        Write-Host $Error[0].Exception.ParentContainsErrorRecordException;
        Break
    }