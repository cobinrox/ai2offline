@echo OFF
REM build docker image that will provide capability to both
REM compile the app-inventor source and run the app-inventor server

REM to use compose file:
docker-compose build

REM or to build from command line using only the Dockerfile:
REM docker build -t ai2s .
