Write-Host "Run Commerce Lite locally" -ForegroundColor Yellow

Write-Host "`nLooking for Visual Studio 2017..."
if(Test-Path -Path "C:\Program Files (x86)\Microsoft Visual Studio\2017\Community")
{
    #Borrowed from https://stackoverflow.com/questions/2124753/how-can-i-use-powershell-with-the-visual-studio-command-prompt
    pushd "C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\Common7\Tools"
    cmd /c "VsDevCmd.bat&set" |
    foreach {
      if ($_ -match "=") {
        $v = $_.split("="); set-item -force -path "ENV:\$($v[0])"  -value "$($v[1])"
      }
    }
    popd
    Write-Host "Visual Studio 2017 Community Command Prompt variables set." -ForegroundColor Yellow
}
elseif(Test-Path -Path "C:\Program Files (x86)\Microsoft Visual Studio\2017\Professional")
{
    #Borrowed from https://stackoverflow.com/questions/2124753/how-can-i-use-powershell-with-the-visual-studio-command-prompt
    pushd "C:\Program Files (x86)\Microsoft Visual Studio\2017\Professional\Common7\Tools"
    cmd /c "VsDevCmd.bat&set" |
    foreach {
      if ($_ -match "=") {
        $v = $_.split("="); set-item -force -path "ENV:\$($v[0])"  -value "$($v[1])"
      }
    }
    popd
    Write-Host "Visual Studio 2017 Professional Command Prompt variables set." -ForegroundColor Yellow
}
elseif(Test-Path -Path "C:\Program Files (x86)\Microsoft Visual Studio\2017\Enterprise")
{
    #Borrowed from https://stackoverflow.com/questions/2124753/how-can-i-use-powershell-with-the-visual-studio-command-prompt
    pushd "C:\Program Files (x86)\Microsoft Visual Studio\2017\Enterprise\Common7\Tools"
    cmd /c "VsDevCmd.bat&set" |
    foreach {
      if ($_ -match "=") {
        $v = $_.split("="); set-item -force -path "ENV:\$($v[0])"  -value "$($v[1])"
      }
    }
    popd
    Write-Host "Visual Studio 2017 Enterprise Command Prompt variables set." -ForegroundColor Yellow
}
else
{
    Write-Host "Visual Studio 2017 not foud for building. :(" -ForegroundColor Red
}


Write-Host "`nBuilding solution..."
devenv tmf.sln /build Debug

Write-Host "`nRunning Docker Compose Up..."
docker build --no-cache .\django\CommerceManager\CommerceManager
docker-compose  -f "docker-compose.yml" -f "docker-compose.override.yml" -f "obj\Docker\docker-compose.vs.debug.g.yml" up -d --force-recreate


$commercelitesql = docker inspect --format="{{range .NetworkSettings.Networks}}{{.IPAddress}} {{end}}" commercelite-sql
Write-Host "`nCommerceLite SQL running at $commercelitesql" -ForegroundColor Green

while($true)
{
        $sqlClient = New-Object System.Data.SqlClient.SqlConnection
        $sqlClient.ConnectionString = "Data Source=$commercelitesql;Integrated Security=false;user id=sa;password=Passw0rd!;Initial Catalog=master;Connect Timeout=3;"

        try
        {
            $sqlClient.Open()
            Write-Host "SQL Server ready!"
            break
        }
        catch
        {
            Sleep 5
            Write-Host "Waiting for SQL Server to be ready for seeding..."
        } 
}

sqlcmd -S $commercelitesql -U SA -P 'Passw0rd!' -i .\dot-net\db-scripts\CreateDatabase.sql
sqlcmd -S $commercelitesql -U SA -P 'Passw0rd!' -i .\dot-net\db-scripts\SchemaCreation.sql 
sqlcmd -S $commercelitesql -U SA -P 'Passw0rd!' -i .\dot-net\db-scripts\SeedData.sql
sqlcmd -S $commercelitesql -U SA -P 'Passw0rd!' -i .\dot-net\db-scripts\SeedMoreData.sql

$commerceliteapi = docker inspect --format="{{range .NetworkSettings.Networks}}{{.IPAddress}} {{end}}" commercelite-api
Write-Host "`nCommerceLite API running at $commerceliteapi" -ForegroundColor Green

$commercelitemanager = docker inspect --format="{{range .NetworkSettings.Networks}}{{.IPAddress}} {{end}}" "commercelite-manager"
Write-Host "`nCommerceLite Manager running at $commercelitemanager" -ForegroundColor Green

Write-Host "`n`nYou can now open a web browser and enter: http://$commercelitemanager .`n`n" -ForegroundColor Green

Read-Host "Press any key to terminate..."
docker kill commercelite-api
docker kill commercelite-sql
docker kill commercelite-manager
