#Borrowed from https://stackoverflow.com/questions/2124753/how-can-i-use-powershell-with-the-visual-studio-command-prompt

pushd "C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\Common7\Tools"
cmd /c "VsDevCmd.bat&set" |
foreach {
  if ($_ -match "=") {
    $v = $_.split("="); set-item -force -path "ENV:\$($v[0])"  -value "$($v[1])"
  }
}
popd
Write-Host "`nVisual Studio 2017 Community Command Prompt variables set." -ForegroundColor Yellow

Write-Host "Building solution..."
devenv tmf.sln /build Debug

Write-Host "Running Docker Compose Up..."

docker-compose  -f "docker-compose.yml" -f "docker-compose.override.yml" -f "obj\Docker\docker-compose.vs.debug.g.yml" up -d

$commercelitesql = docker inspect --format="{{range .NetworkSettings.Networks}}{{.IPAddress}} {{end}}" commercelite-sql

sqlcmd -S $commercelitesql -U SA -P 'Passw0rd!' -i .\dot-net\db-scripts\CreateDatabase.sql
sqlcmd -S $commercelitesql -U SA -P 'Passw0rd!' -i .\dot-net\db-scripts\SchemaCreation.sql 
sqlcmd -S $commercelitesql -U SA -P 'Passw0rd!' -i .\dot-net\db-scripts\SeedData.sql

$commerceliteapi = docker inspect --format="{{range .NetworkSettings.Networks}}{{.IPAddress}} {{end}}" commercelite-api
Write-Host "CommerceLite API running at $commerceliteapi"


