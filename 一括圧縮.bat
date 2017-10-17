:FILEDROP
cd /d %~dp0
mkdir output
:REPEAT
ffmpeg.exe -i %1 -vf scale=iw/2:ih/2 "output/%~n1.mp4"
if "%~2"=="" GOTO EXIT
shift
GOTO REPEAT
:EXIT
