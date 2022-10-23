@echo off

::docker run --name ejs --rm --detach --publish 3000:3000 ejs-node

docker run ^
  -d ^
  --rm ^
  --name ejs ^
  -p 3000:3000 ^
  -v ejs:/app/data ^
  -v /app/node_modules ^
  -v "C:/SPA/docker/logs-app-minin:/app" ^
  slimbde/ejs-node