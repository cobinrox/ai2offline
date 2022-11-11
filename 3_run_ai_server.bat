@echo OFF
REM Run the ai2 companion server inside the ai2s docker container.
REM
REM https://github.com/himgodfreyho/appinventor-docker
REM
REM

REM Run the continer
REM docker rm -f ai2 2>NUL
REM docker run -it -v "C:\Users\name\gitprojects\appinventor-sources:/root/appinventor-sources/" -p 8888:8888 --name ai2 ai2

echo "Starting server, may take a while for server to completely start up, please stand by"

docker exec -it ai2s startserver.sh
IF %ERRORLEVEL% NEQ 0 (
   echo "**** ERROR STARTING UP THE APP-INVENTOR SERVER"
) ELSE (
   echo "Server started, open your browser to localhost:88888."
   echo "Then click on the [Click Here to use your Google Account to login] link."
   echo "Then click the [Sign in as Administrator] check box and click the [Login] button"
   echo "Warning the AI2Emulator must be installed separately and started separately"
   echo "'tis best to start the AI2Emulator as an administrator"
)