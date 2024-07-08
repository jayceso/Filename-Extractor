# Filename-Extractor
Extracting filenames and their parent folder names into a CSV file.

## Overview
A simple batch script for **Windows** to extract filenames and their parent folder names from a specified directory and its subdirectories.

## Why I Made This
This script was created for work purposes. My daily task was to copy filenames and folder names from projects and manually input them into Excel, which was time-consuming. Because im lazy, I created this poorly simple batch script.

## Features
- Scans a specified directory for files
- Extract Filenames and their parent folder names
- Excludes files with extension `.txt`,`.csv`,`.bat` (optional) - *most of the filenames i need to extract, does not include these extensions*
- Outputs in CSV format

## How To Use
1. **Download** the `filename_extractor.bat` script
2. **Run** the script
3. **Enter the path directory** to extract the filenames.

### Example

For example, suppose you have this structure:
```
C:\Projects\
    ├── Project1\
    │   ├── File1.jpg
    │   ├── File2.docx
    │   └── ...
    └── Project2\
        ├── SubfolderName\
        │   ├── File3.png
        │   └── ...
        ├── File4.pdf
        └── File5.exe
```
Run the script and enter the directory: `C:\Projects\`. The script will generate `Filenames.csv` in that directory. The contents will be:

| Folder Names | File Names |
|---|---|
| Project1 | File1 |
| Project1 | File2 |
| SubfolderName | File3 |
| Project2 | File4 |
| Project2 | File5 | 

## NOTES
- If you want to remove the exclusions, remove this line:

```
29       if /i not "%%~xa"==".txt" if /i not "%%~xa"==".csv" if /i not "%%~xa"==".bat" (
```
