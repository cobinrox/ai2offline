# ai2offline
Develop MIT AI2 Apps Offline on Windows Using Docker Container

References:
- https://github.com/mit-cml/appinventor-sources
- REM https://github.com/himgodfreyho/appinventor-docker

1.  Download project from github
2.  Change to the ai2offline directory
3.  Edit the file `2_compile.bat` and replace the environment variable `AI2_SOURCE_DIR` with the path to one up from the ai2offline directory, e.g. `C:\Users\myUserName\gitprojects\appinventor-sources`
4.  Run the batch files
    * 0_download_ai2_source.bat
    * 1_dbuildimage.bat
    * 2_dcompile.bat
5. Run the AI2 companion server:
    * 3_run_ai_server.bat
6. Point your browser at: `localhost:8888`


