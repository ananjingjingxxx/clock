:: runsisi AT hust.edu.cn

@echo off

set keyName=restclock
set programName=Clock.exe
set disabled=1

REG QUERY HKCU\Software\Microsoft\Windows\CurrentVersion\Run /v restclock > nul 2>&1

if %errorlevel% == 0 (
    echo ��������������ȡ��������?
    set disabled=0
) else (
    echo δ����������������������?
)

echo=
CHOICE /C YC /M "ȷ���밴 Y��ȡ���밴 C��"

if %errorlevel% == 1 (
    if %disabled% == 0 (
        REG DELETE HKCU\Software\Microsoft\Windows\CurrentVersion\Run /f /v %keyName%
    ) else (
        REG ADD HKCU\Software\Microsoft\Windows\CurrentVersion\Run /f /v %keyName% /t REG_SZ /d "%cd%\%programName%"
    )
)

pause