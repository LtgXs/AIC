::[Bat To Exe Converter]
::
::fBE1pAF6MU+EWHreyHcjLQlHcDepA0O7OpEZ++Pv4Pq7JZHr0yrURK7OzrvOCe4A/kToedYO2ntJkPdbFlVdZhfL
::fBE1pAF6MU+EWHreyHcjLQlHcDepA0O7OpEZ++Pv4Pq7JZHr0yrURK7OzrvOCe4A/kToedYO2ntJkPcvABpLdlz8dG8=
::fBE1pAF6MU+EWHreyHcjLQlHcDepA0O7OpEZ++Pv4Pq7JZHr0yrURK7OzrvOCe4A/kToedYO2ntJkPdbFlVcch7L
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFCh/cyyDAE+/Fb4I5/jHaDZxJYX2aMMqbICb87qdNOEf5gXHeZc+3kYP1sIPA3s=
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF25
::cxAkpRVqdFKZSTk=
::cBs/ulQjdF25
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpSI=
::egkzugNsPRvcWATEpSI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+IeA==
::cxY6rQJ7JhzQF1fEqQJgZkkEAlbRcjva
::ZQ05rAF9IBncCkqN+0xwdVsEAlbScjnpSOV8
::ZQ05rAF9IAHYFVzEqQITJBpHRESrMniuB7kQ7fqb
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQITJBpHRESrMniuB7kQ7fqb
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJGyX8VAjFCh/cyyDAE+/Fb4I5/jHaDZxJYX2aMMqbICb87qdNOEf5gXHeZc+3kZ5lMofBFtxcAG/bwM4rHwMs3yAVw==
::YB416Ek+ZW8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
copy 7z.dll %windir%
copy 7z.exe %windir%

taskkill /f /im "Clash for Windows.exe"
del /f /s /q "%userprofile%\AppData\Local\Programs\Clash for Windows"
rd /s /q "%userprofile%\AppData\Local\Programs\Clash for Windows"
del /f /s /q "%appdata%\clash_win"
rd /s /q "%appdata%\clash_win"

md "%userprofile%\AppData\Local\Programs\Clash for Windows"
7z x "%appdata%\Clash.7z" -o"%userprofile%\AppData\Local\Programs\Clash for Windows"

explorer "%userprofile%\AppData\Local\Programs\Clash for Windows\Clash for Windows.exe"

copy "%userprofile%\AppData\Local\Programs\Clash for Windows\Clash.lnk" "C:\ProgramData\Microsoft\Windows\Start Menu\Programs"
copy "%userprofile%\AppData\Local\Programs\Clash for Windows\Clash.lnk" "%userprofile%\Desktop\"