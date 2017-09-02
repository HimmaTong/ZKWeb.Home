@echo off
echo this script is for build and publish demo site
echo please ensure you have this directory layout
echo - zkweb
echo   - tools
echo - zkweb.home
echo   - publish.bat
echo.

echo building project...
cd src\ZKWeb.Home.AspNetCore
dotnet restore
dotnet build -c Release -f net461
cd ..\..

echo building plugins...
cd src\ZKWeb.Home.Console
dotnet restore
dotnet run -c Release -f net461
cd ..\..

echo publishing website...
..\ZKWeb\Tools\WebsitePublisher.Cmd.Windows\ZKWeb.Toolkits.WebsitePublisher.Cmd.exe -r src\ZKWeb.Home.AspNetCore -n "zkweb.home" -o "..\..\publish"
pause
