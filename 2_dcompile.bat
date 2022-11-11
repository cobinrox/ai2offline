@echo OFF

REM Compiles MIT App Inventor source code using a pre-built
REM docker container that acts as both a "build server" and
REM an app-inventor "run server"
REM Reference:
REM https://github.com/himgodfreyho/appinventor-docker
REM
REM
SET AI2_BUILD_SERVER_IMAGE=ai2s
SET AI2_BUILD_SERVER_CONTAINER=ai2s
SET AI2_SOURCE_DIR=C:\Users\name\gitprojects\appinventor-sources

echo "Stopping %AI2_BUILD_SERVER_CONTAINER% ..."
docker rm -f %AI2_BUILD_SERVER_CONTAINER% >nul 2>&1
echo "Starting %AI2_BUILD_SERVER_CONTAINER% ..."
docker run -d -v "%AI2_SOURCE_DIR%:/root/appinventor-sources/" -p 8888:8888 --name %AI2_BUILD_SERVER_IMAGE% %AI2_BUILD_SERVER_CONTAINER%
IF %ERRORLEVEL% NEQ 0 (
  echo "***** ERROR ERROR ERROR COULD NOT RUN THE %AI2_BUILD_SERVER_IMAGE% IMAGE AS A CONTAINER"
  EXIT /B
)

echo "Creating auth key for build ..."
docker exec -w /root/appinventor-sources/appinventor %AI2_BUILD_SERVER_CONTAINER% ant MakeAuthKey

echo "Compiling the mit app-inventor source code at [%AI2_SOURCE_DIR%] ..."
echo "   (This may take a LONNNNNNNNNGGGGGGGGGGGG time, please stand by...)"
docker exec -w /root/appinventor-sources/appinventor %AI2_BUILD_SERVER_CONTAINER% ant
IF %ERRORLEVEL% NEQ 0 (
   echo "**** ERROR DURING COMPILE"
) ELSE (
   echo "... Compile completed."
)