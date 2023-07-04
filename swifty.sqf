echo off
for /f "usebackq delims=|" %%f in (`dir /b "D:\cgqc_repo\cgqc"`) do (mklink /d "D:\repo\cgqc\%%f" "D:\repo\cgqc\%%f")
pause


// Recursive script  
	set "source=D:\cgqc_repo\training"
    set "target=D:\repo\training"
    set "exclude=D:\repo\training\repo_output.json"

    forfiles /P "%source%" /C 
	"cmd /c if @isdir==TRUE (if not @file==\"%exclude%\" mklink /d \"%target%\@file\" @path ) else ( mklink \"%target%\@file\" @path )"




@echo off
set "Folder1=D:\cgqc_repo\cgqc"
set "Folder2=D:\repo\cgqc"


del "%Folder1%\*.srf"
del /s /q "%Folder2%\*" > nul
D:\cgqc_repo\swifty-cli.exe create D:\cgqc_repo\repo_cgqc.json %Folder1% -nocopy

for /r "%Folder1%" %%F in (*) do (
    set "FilePath=%%F"
    set "RelativePath=!FilePath:%Folder1%=%Folder2%!"
    mklink "!RelativePath!" "!FilePath!" > nul
)





// CGQC mods 
@addons
@addons_2023
@addons_AI
@core_mk3


//Copies symlinks
xcopy /b /i "D:\cgqc_repo\CGQC\@addons" "D:\repo\CGQC\@addons" &
xcopy /b /i "D:\cgqc_repo\CGQC\@addons_2023" "D:\repo\CGQC\@addons_2023" &
xcopy /b /i "D:\cgqc_repo\CGQC\@addons_AI" "D:\repo\CGQC\@addons_AI" &
xcopy /b /i "D:\cgqc_repo\CGQC\@core_mk3" "D:\repo\CGQC\@core_mk3"

xcopy /b /i "D:\repo\CGQC\@addons" "D:\repo\CGQC2\@addons" &
xcopy /b /i "D:\repo\CGQC\@addons_2023" "D:\repo\CGQC2\@addons_2023" &
xcopy /b /i "D:\repo\CGQC\@addons_AI" "D:\repo\CGQC2\@addons_AI" &
xcopy /b /i "D:\repo\CGQC\@core_mk3" "D:\repo\CGQC2\@core_mk3"


// Training Repo
@3CB Factions
@ace 
@ACRE2
@addons
@addons_2023
@addons_AI
@Bozcaada
@Canadian_SOF_LITE_mas
@CBA_A3
@core_mk3
@CUP Terrains - Core
@CUP Terrains - Maps
@Dagger Island Training Complex Beta
@Global Ops Terrains
@JSRS SOUNDMOD
@Novogorsk
@RHSAFRF
@RHSGREF
@RHSSAF
@RHSUSAF
@Tier One Weapons
@Zulu Headless Client ZHC


xcopy /b /i "D:\cgqc_repo\training\@3CB Factions" "D:\repo\training\@3CB Factions" &
xcopy /b /i "D:\cgqc_repo\training\@ace" "D:\repo\training\@ace" &
xcopy /b /i "D:\cgqc_repo\training\@ACRE2" "D:\repo\training\@ACRE2" &
xcopy /b /i "D:\cgqc_repo\training\@addons" "D:\repo\training\@addons" &
xcopy /b /i "D:\cgqc_repo\training\@addons_2023" "D:\repo\training\@addons_2023" &
xcopy /b /i "D:\cgqc_repo\training\@addons_AI" "D:\repo\training\@addons_AI" &
xcopy /b /i "D:\cgqc_repo\training\@Bozcaada" "D:\repo\training\@Bozcaada" &
xcopy /b /i "D:\cgqc_repo\training\@Canadian_SOF_LITE_mas" "D:\repo\training\@Canadian_SOF_LITE_mas" &
xcopy /b /i "D:\cgqc_repo\training\@CBA_A3" "D:\repo\training\@CBA_A3" &
xcopy /b /i "D:\cgqc_repo\training\@core_mk3" "D:\repo\training\@core_mk3" &
xcopy /b /i "D:\cgqc_repo\training\@CUP Terrains - Core" "D:\repo\training\@CUP Terrains - Core" &
xcopy /b /i "D:\cgqc_repo\training\@CUP Terrains - Maps" "D:\repo\training\@CUP Terrains - Maps" &
xcopy /b /i "D:\cgqc_repo\training\@Dagger Island Training Complex Beta" "D:\repo\training\@Dagger Island Training Complex Beta" &
xcopy /b /i "D:\cgqc_repo\training\@Global Ops Terrains" "D:\repo\training\@Global Ops Terrains" &
xcopy /b /i "D:\cgqc_repo\training\@JSRS SOUNDMOD" "D:\repo\training\@JSRS SOUNDMOD" &
xcopy /b /i "D:\cgqc_repo\training\@Novogorsk" "D:\repo\training\@Novogorsk" &
xcopy /b /i "D:\cgqc_repo\training\@RHSAFRF" "D:\repo\training\@RHSAFRF" &
xcopy /b /i "D:\cgqc_repo\training\@RHSGREF" "D:\repo\training\@RHSGREF" &
xcopy /b /i "D:\cgqc_repo\training\@RHSSAF" "D:\repo\training\@RHSSAF" &
xcopy /b /i "D:\cgqc_repo\training\@Tier One Weapons" "D:\repo\training\@Tier One Weapons" &
xcopy /b /i "D:\cgqc_repo\training\@Zulu Headless Client ZHC" "D:\repo\training\@Zulu Headless Client ZHC"
