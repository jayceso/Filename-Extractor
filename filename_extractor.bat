::Made by jayceso
@echo off
title Filename Extractor
color 0a
setlocal enabledelayedexpansion

:: Prompt the user for a directory location
set /p directory=Location: 

:: Check if the entered directory exists
if not exist "%directory%" (
    cls
    echo Not a valid directory
    endlocal
    pause
    exit /b
)

:: Set the output file path
set outputfile=%directory%\Filenames.csv

:: Delete the existing output file if it exists
if exist "%outputfile%" del "%outputfile%"

:: Recursively iterate through all files in the specified directory
for /r "%directory%" %%a in (*) do (
    
    :: Exclude files with .txt, .csv, and .bat extensions
    if /i not "%%~xa"==".txt" if /i not "%%~xa"==".csv" if /i not "%%~xa"==".bat" (

        :: Extract the filename without the extension
        set "filenames=%%~na"

        :: Extract the name of the parent folder
        for %%F in ("%%~dpa.") do set "lastfolder=%%~nxF"
        
        :: Append the parent folder name and filename to the output CSV file
        echo !lastfolder!,!filenames! >> "%outputfile%"
    )
)    
:: End the local environment changes
endlocal
pause
