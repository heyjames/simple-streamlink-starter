@echo off
rem In command prompt, type "s.bat <channel> [worst|best|720p]"

set channel=%1
set resolution=%2

rem Exit if no channel argument is provided
if "%channel%" == "" (
	exit /b
)

rem Set resolution to 360p if no value is provided
if "%resolution%" == "" (
	set resolution=360p
)

rem echo %channel%
rem echo %resolution%

python "C:\Users\<PATH>\Documents\<PATH>\streamlink\streamlink-script.py" --twitch-disable-ads twitch.tv/%channel% %resolution%