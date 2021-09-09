
#SingleInstance Force
SendMode Input
SetWorkingDir, C:

    URLDownloadToFile, https://github.com/AlaoisMC/RZHD/raw/main/upd_new.ini, %A_WorkingDir%\RZHD\Conf\upd_new.ini
    IniRead, updater_upd, %A_WorkingDir%\RZHD\Conf\upd_new.ini, VER_UPD, updater_upd
    IniRead, updater, %A_WorkingDir%\RZHD\Conf\upd_last.ini, VER, updater

    if (updater<updater_upd)
    {
        MsgBox, , Автообновление, Обновления найдены`nПожалуйста подождите, 2
        URLDownloadToFile, https://github.com/AlaoisMC/RZHD/blob/main/update.exe?raw=true, %A_WorkingDir%\RZHD\update.exe
        FileDelete, %A_WorkingDir%\RZHD\README.txt
        URLDownloadToFile, https://github.com/AlaoisMC/RZHD/raw/main/README.txt, %A_WorkingDir%\RZHD\README.txt
        Sleep, 2000
        Run, %A_WorkingDir%\RZHD\README.txt
        IniWrite, %updater_upd%, %A_WorkingDir%\RZHD\Conf\upd_last.ini, VER, updater
        FileDelete, %A_WorkingDir%\RZHD\Conf\upd_new.ini
    }
    Else
    {
        MsgBox, , Автообновление, Обновлений нет`nЗапуск программы, 2
        FileDelete, %A_WorkingDir%\RZHD\Conf\upd_new.ini
    }

    IniRead, runs, %A_WorkingDir%\RZHD\Conf\config.ini, RZHD, runs
    if (runs!=1)
    {

        fileinstall, C:\Programs\GitRepo\AHK-for-RZHD-Province-4\README.txt, %A_WorkingDir%\RZHD\README.txt, 1
            Run, %A_WorkingDir%\RZHD\README.txt
        Sleep, 5000
        fileinstall, C:\Programs\GitRepo\AHK-for-RZHD-Province-4\Pic\ржд.png, %A_WorkingDir%\RZHD\Pic\ржд.png, 1
            fileinstall, C:\Programs\GitRepo\AHK-for-RZHD-Province-4\Pic\maps.jpg, %A_WorkingDir%\RZHD\Pic\maps.jpg, 1
            fileinstall, C:\Programs\GitRepo\AHK-for-RZHD-Province-4\Pic\info.png, %A_WorkingDir%\RZHD\Pic\info.png, 1
            fileinstall, C:\Programs\GitRepo\AHK-for-RZHD-Province-4\Pic\ржд4.ico, %A_WorkingDir%\RZHD\Pic\ржд4.ico, 1
            IfExist, %A_WorkingDir%\RZHD\Conf\config.ini
            Gosub, ReadSettings
        Gui, 6: Show, NA xCenter yCenter w400 h300, First start
        Gui, 6: -Caption
        Gui, 6: Font, s25 Bold, Times new Roman
        Gui, 6: add, text, cE5E5E5 x41 y7 +BackGroundTrans , Введите информацию
        Gui, 6: Font,
        Gui, 6: Font, s15, Times new Roman
        Gui, 6: add, text, cE5E5E5 x45 y50 h25 +BackGroundTrans,Имя 
        Gui, 6: add, text, cE5E5E5 x45 y80 h25 +BackGroundTrans ,Фамилия
        Gui, 6: add, text, cE5E5E5 x45 y110 h25 +BackGroundTrans ,Тег
        Gui, 6: add, text, cE5E5E5 x45 y140 h25 +BackGroundTrans ,Звание
        Gui, 6: add, text, cE5E5E5 x45 y180 h25 +BackGroundTrans ,Должность
        Gui, 6: add, text, cE5E5E5 x45 y210 h25 +BackGroundTrans ,Номер `nудостоверения
        Gui, 6: add, text, cE5E5E5 x45 y250 h25 +BackGroundTrans ,Дата выдачи `nудостоверения
        Gui, 6: Add, Edit, x190 y50	h25 w150 vName, %Name%
        Gui, 6: Add, Edit, x190 y80 h25 w150 vLastName, %LastName%
        Gui, 6: Add, Edit, x190 y110 h25 w150 vTag, %Tag%
        Gui, 6: Add, DropDownList, x190 y140 h25 w200 r5 vZvanie, Слесарь-электрик|Монтёр пути|Машинист-стажёр|Диспетчер-стажёр|Машинист без класса|Машинист 3-его класса|Машинист 2-ого класса|Машинист 1-ого класса|Машинист-Инструктор|Диспетчер 4-ого класса|Диспетчер 3-его класса|Диспетчер 2-ого класса|Диспетчер 1-ого класса|Дорожный Диспетчер|Старший машинист-инструктор|Заместитель начальника дирекции|Заместитель начальника отдела|Начальник дирекции|Начальник дирекции отдела|Начальник депо
        Gui, 6: Add, DropDownList, x190 y180 h25 w150 r5 vDolznost, ТЧМИС|НЗ-УЦ|НЗ-Т|НЗ-УЦ|НОДК|Н-Т|Н-УД|Н
        Gui, 6: Add, Edit, x190 y220 h25 w150 vNumber, %Number%
        Gui, 6: Add, Edit, x190 y260 h25 w150 vDate, %Date%
        Gui, 6: Add, Button, x140 y295 h30 w150 gButtonSave1, Save
        Gui, 6: add, picture, x0 y0 w410 h330, %A_WorkingDir%\RZHD\Pic\ржд.png
        Return
    }

ReadSettings:
    IniRead, Name , %A_WorkingDir%\RZHD\Conf\config.ini, RZHD, Name
    IniRead, LastName, %A_WorkingDir%\RZHD\Conf\config.ini, RZHD, LastName
    IniRead, Tag, %A_WorkingDir%\RZHD\Conf\config.ini, RZHD, Tag
    IniRead, Zvanie, %A_WorkingDir%\RZHD\Conf\config.ini, RZHD, Zvanie
    IniRead, Dolznost, %A_WorkingDir%\RZHD\Conf\config.ini, RZHD, Dolznost
    IniRead, Number, %A_WorkingDir%\RZHD\Conf\config.ini, RZHD, Number
    IniRead, Date, %A_WorkingDir%\RZHD\Conf\config.ini, RZHD, Date
    IniRead, Check2, %A_WorkingDir%\RZHD\Conf\config.ini, RZHD, Check2
    IniRead, Check3, %A_WorkingDir%\RZHD\Conf\config.ini, RZHD, Check3
    IniRead, Check4, %A_WorkingDir%\RZHD\Conf\config.ini, RZHD, Check4
    IniRead, Check5, %A_WorkingDir%\RZHD\Conf\config.ini, RZHD, Check5
    Gosub, Main
Return

ButtonSave1:
    Gui, 6: Submit, NoHide
    MsgBox, , Save Window, Настройки успешно сохранены `nПерезапустите приложение, 3
    IniWrite, 1, %A_WorkingDir%\RZHD\Conf\config.ini, RZHD, runs
    IniWrite, %Name% , %A_WorkingDir%\RZHD\Conf\config.ini, RZHD, Name
    IniWrite, %LastName%, %A_WorkingDir%\RZHD\Conf\config.ini, RZHD, LastName
    IniWrite, %Tag%, %A_WorkingDir%\RZHD\Conf\config.ini, RZHD, Tag
    IniWrite, %Zvanie%, %A_WorkingDir%\RZHD\Conf\config.ini, RZHD, Zvanie
    IniWrite, %Dolznost%, %A_WorkingDir%\RZHD\Conf\config.ini, RZHD, Dolznost
    IniWrite, %Number%, %A_WorkingDir%\RZHD\Conf\config.ini, RZHD, Number
    IniWrite, %Date%, %A_WorkingDir%\RZHD\Conf\config.ini, RZHD, Date
ExitApp
Return

Main:
    Gui, 1: Show, xCenter yCenter w640 h240, AHK для РЖД
    Gui, 1: -Caption
    Gui, 1: Font, s20 Bold, Times New Roman
    Gui, 1: Add, Text,x230 y10 +BackGroundTrans,Главное меню
    Gui, 1: Add, Text,x30 y70 +BackGroundTrans,О вас:
    Gui, 1: Font,
    Gui, 1: Font,s15 Bold, Times New Roman
    Gui, 1: Add, Text, x30 y105 +BackGroundTrans, ФИО:
    Gui, 1: Add, Text, x30 y130 +BackGroundTrans, Должность:
    Gui, 1: Add, Text, x30 y155 +BackGroundTrans, Звание:
    Gui, 1: Add, Text, x30 y180 +BackGroundTrans, Удостоверение:
    Gui, 1: Font,
    Gui, 1: Font,s15, Times New Roman
    Gui, 1: Add, Radio, x15 y50 Checked +BackGroundTrans, Отыгровки
    Gui, 1: Add, Radio, x135 y50 gWindow2 +BackGroundTrans, АСКД
    Gui, 1: Add, Radio, x215 y50 gWindow3 +BackGroundTrans, ТЧМ→ДНЦ 
    Gui, 1: Add, Radio, x345 y50 gWindow4 +BackGroundTrans, ДНЦ→ТЧМ
    Gui, 1: Add, Radio, x475 y50 gWindow5 +BackGroundTrans, Собеседование
    Gui, 1: Add, Text, x90 y105 +BackGroundTrans, [%Tag%] %Name% %LastName%
    Gui, 1: Add, Text, x145 y130 +BackGroundTrans, %Dolznost%
    Gui, 1: Add, Text, x105 y155 +BackGroundTrans, %Zvanie%
    Gui, 1: Add, Text, x180 y180 +BackGroundTrans, № %Number% от %Date%
    Gui, 1: Add, Button, x30 y210 w200 h30 +BackGroundTrans gConfRewrite, Перезаписать данные
    Gui, 1: Add, Button, x520 y210 w100 h30 +BackGroundTrans gExit, Выйти
    Gui, 1: Font,
    Gui, 1: Font, s13 underline, Times New Roman
    Gui, 1: Add, Link, x30 y240, <a href="https://github.com/AlaoisMC">Создатель</a>
    Gui, 1: Add, Picture, x10 y10 w25 h25 gInfo1, %A_WorkingDir%\RZHD\Pic\info.png
    Gui, 1: Font,
    Gui, 1: Font, s10 underline, Times New Roman
    Gui, 1: Add, Text, x40 y15 +BackGroundTrans, ← нажми на меня
Return

Window2:
    Gui, 1: Destroy
    Gui, 2: Show, xCenter yCenter w400 h220, AHK для АСКД
    Gui, 2: -Caption
    Gui, 2: Font, s20 bold, Times New Roman
    Gui, 2: Add, Text, x110 y10 +BackGroundTrans, AHK для АСКД
    Gui, 2: Font
    Gui, 2: Font, s15, Times New Roman
    Gui, 2: Add, Text, x20 y40 +BackGroundTrans, В какую смену
    Gui, 2: Add, Text, x20 y70 +BackGroundTrans, Время отправления
    Gui, 2: Add, Text, x20 y100 +BackGroundTrans, Номер расписания
    Gui, 2: Add, Text, x20 y130 +BackGroundTrans, Номер ПАССа
    Gui, 2: Add, Radio, x196 y40 +BackGroundTrans gSmena, 1-ую
    Gui, 2: Add, Radio, x266 y40 +BackGroundTrans gSmena, 2-ую
    Gui, 2: Add, Radio, x336 y40 +BackGroundTrans gSmena, 3-ю
    Gui, 2: Add, Edit, x216 y70 w150 h25 +BackGroundTrans vTime
    Gui, 2: Add, Edit, x216 y100 w150 h25 +BackGroundTrans vRaspisanie
    Gui, 2: Add, Radio, x216 y130 +BackGroundTrans gTrain, 1
    Gui, 2: Add, Radio, x256 y130 +BackGroundTrans gTrain, 2
    Gui, 2: Add, Radio, x296 y130 +BackGroundTrans gTrain, 3
    Gui, 2: Add, Radio, x336 y130 +BackGroundTrans gTrain, 4
    Gui, 2: Add, Checkbox, x20 y160 +BackGroundTrans vCheck2, Для включения нажмите галочку
    Gui, 2: Add, Link, x20 y180, <a href="https://forum.gtaprovince.ru/topic/410005-rzhd-raspisanie-dvizheniya-poezdov/">Расписание движения поездов</a>
    Gui, 2: Add, Button, x20 y210 w75 h30 +BackGroundTrans gReload, Назад
    Gui, 2: Add, Button, x140 y210 w110 h30 +BackGroundTrans gSave, Сохранить
    Gui, 2: Add, Button, x280 y210 w100 h30 +BackGroundTrans gMaps, Карта
    Gui, 2: Add, Picture, x10 y10 w25 h25 gInfo2, %A_WorkingDir%\RZHD\Pic\info.png
Return 

Window3:
    Gui, 1: Destroy
    Gui, 3: Show, xCenter yCenter w400 h220, AHK для ТЧМ→ДНЦ 
    Gui, 3: -Caption
    Gui, 3: Font, s20 bold, Times New Roman
    Gui, 3: Add, Text, x80 y10 +BackGroundTrans, AHK для ТЧМ→ДНЦ 
    Gui, 3: Font
    Gui, 3: Font, s15, Times New Roman
    Gui, 3: Add, Text, x20 y40 +BackGroundTrans, В какую смену
    Gui, 3: Add, Text, x20 y70 +BackGroundTrans, Время отправления
    Gui, 3: Add, Text, x20 y100 +BackGroundTrans, Номер расписания
    Gui, 3: Add, Text, x20 y130 +BackGroundTrans, Номер ПАССа
    Gui, 3: Add, Radio, x196 y40 +BackGroundTrans gSmena, 1-ую
    Gui, 3: Add, Radio, x266 y40 +BackGroundTrans gSmena, 2-ую
    Gui, 3: Add, Radio, x336 y40 +BackGroundTrans gSmena, 3-ю
    Gui, 3: Add, Edit, x216 y70 +BackGroundTrans w150 h25 vTime
    Gui, 3: Add, Edit, x216 y100 +BackGroundTrans w150 h25 vRaspisanie
    Gui, 3: Add, Radio, x216 y130 +BackGroundTrans gTrain, 1
    Gui, 3: Add, Radio, x256 y130 +BackGroundTrans gTrain, 2
    Gui, 3: Add, Radio, x296 y130 +BackGroundTrans gTrain, 3
    Gui, 3: Add, Radio, x336 y130 +BackGroundTrans gTrain, 4
    Gui, 3: Add, Checkbox, x20 y160 +BackGroundTrans vCheck3, Для включения нажмите галочку
    Gui, 3: Add, Link, x20 y180, <a href="https://forum.gtaprovince.ru/topic/410005-rzhd-raspisanie-dvizheniya-poezdov/">Расписание движения поездов</a>
    Gui, 3: Add, Button, x20 y210 w75 h30 +BackGroundTrans gReload, Назад
    Gui, 3: Add, Button, x140 y210 w110 h30 +BackGroundTrans gSave, Сохранить
    Gui, 3: Add, Button, x280 y210 w100 h30 +BackGroundTrans gMaps, Карта
    Gui, 3: Add, Picture, x10 y10 w25 h25 gInfo3, %A_WorkingDir%\RZHD\Pic\info.png
Return

Window4:
    Gui, 1: Destroy
    Gui, 4: Show, w400 h600, ДНЦ→ТЧМ
    Gui, 4: -Caption
    Gui, 4: Font, s20 bold, Times New Roman
    Gui, 4: Add, Text, x120 y10 +BackGroundTrans, ДНЦ→ТЧМ
    Gui, 4: Font
    Gui, 4: Font, s15, Times New Roman
    Gui, 4: Add, Text, x20 y50 +BackGroundTrans, Фамилия ПАСС-1
    Gui, 4: Add, Text, x20 y80 +BackGroundTrans, Время выезда ПАСС-1
    Gui, 4: Add, Text, x20 y110 +BackGroundTrans, Номер расписания`nПАСС-1
    Gui, 4: Add, Edit, x216 y50 w150 h25 +BackGroundTrans vLastName1
    Gui, 4: Add, Edit, x216 y80 w150 h25 +BackGroundTrans vTime1
    Gui, 4: Add, Edit, x216 y110 w150 h25 +BackGroundTrans vRaspisanie1
    Gui, 4: Add, Text, x20 y170 +BackGroundTrans, Фамилия ПАСС-2
    Gui, 4: Add, Text, x20 y200 +BackGroundTrans, Время выезда ПАСС-2
    Gui, 4: Add, Text, x20 y230 +BackGroundTrans, Номер расписания`nПАСС-2
    Gui, 4: Add, Edit, x216 y170 w150 h25 +BackGroundTrans vLastName2
    Gui, 4: Add, Edit, x216 y200 w150 h25 +BackGroundTrans vTime2
    Gui, 4: Add, Edit, x216 y230 w150 h25 +BackGroundTrans vRaspisanie2
    Gui, 4: Add, Text, x20 y290 +BackGroundTrans, Фамилия ПАСС-3
    Gui, 4: Add, Text, x20 y320 +BackGroundTrans, Время выезда ПАСС-3
    Gui, 4: Add, Text, x20 y350 +BackGroundTrans, Номер расписания`nПАСС-3
    Gui, 4: Add, Edit, x216 y290 w150 h25 +BackGroundTrans vLastName3
    Gui, 4: Add, Edit, x216 y320 w150 h25 vTime3
    Gui, 4: Add, Edit, x216 y350 w150 h25 +BackGroundTrans vRaspisanie3
    Gui, 4: Add, Text, x20 y410 +BackGroundTrans, Фамилия ПАСС-4
    Gui, 4: Add, Text, x20 y440 +BackGroundTrans, Время выезда ПАСС-4
    Gui, 4: Add, Text, x20 y470 +BackGroundTrans, Номер расписания`nПАСС-4
    Gui, 4: Add, Edit, x216 y410 w150 h25 +BackGroundTrans vLastName4
    Gui, 4: Add, Edit, x216 y440 w150 h25 +BackGroundTrans vTime4
    Gui, 4: Add, Edit, x216 y470 w150 h25 +BackGroundTrans vRaspisanie4
    Gui, 4: Add, Text, x20 y520 +BackGroundTrans, Номер ПАССа
    Gui, 4: Add, Checkbox, x216 y520 +BackGroundTrans vTrain1, 1
    Gui, 4: Add, Checkbox, x256 y520 +BackGroundTrans vTrain2, 2
    Gui, 4: Add, Checkbox, x296 y520 +BackGroundTrans vTrain3, 3
    Gui, 4: Add, Checkbox, x336 y520 +BackGroundTrans vTrain4, 4
    Gui, 4: Add, Checkbox, x10 y550 +BackGroundTrans vCheck4, Для включения нажмите галочку
    Gui, 4: Add, Button, x20 y580 w75 h30 +BackGroundTrans gReload, Назад
    Gui, 4: Add, Button, x150 y580 w110 h30 +BackGroundTrans gSave, Сохранить
    Gui, 4: Add, Picture, x10 y10 w25 h25 gInfo4, %A_WorkingDir%\RZHD\Pic\info.png
Return

Window5:
    Gui, 1: Destroy
    Gui, 11: Show, w400 h390, Собеседование
    Gui, 11: -Caption
    Gui, 11: Font, s20 bold, Times New Roman
    Gui, 11: Add, Text, x60 y10 +BackGroundTrans, AHK для Собеседования
    Gui, 11: Font
    Gui, 11: Font, s17 bold, Times New Roman
    Gui, 11: Add, Text, x100 y320 +BackGroundTrans, Alt + 2 - Не подходите! 
    Gui, 11: Font
    Gui, 11: Font, s15, Times New Roman
    Gui, 11: Add, Text, x20 y50 +BackGroundTrans, 1) Узнаете ФИО, возраст и образование
    Gui, 11: Add, Text, x20 y80 +BackGroundTrans, 2) Просьба передать паспорт
    Gui, 11: Add, Text, x20 y110 +BackGroundTrans, 3) Отыгровки изучения паспорта
    Gui, 11: Add, Text, x20 y140 +BackGroundTrans, 4) Просьба присесть
    Gui, 11: Add, Text, x20 y170 +BackGroundTrans, 5) Просьба встать в NONRP
    Gui, 11: Add, Text, x20 y200 +BackGroundTrans, 6) Вопрос про термин в RP чат
    Gui, 11: Add, Text, x20 y230 +BackGroundTrans, 7) Вопрос про термин в NONRP чат
    Gui, 11: Add, Text, x20 y260 +BackGroundTrans, 8) Вопрос: Что над головой?
    Gui, 11: Add, Text, x20 y290 +BackGroundTrans, 9) Подходите!
    Gui, 11: Add, Checkbox, x20 y350 +BackGroundTrans vCheck5, Для включения нажмите галочку
    Gui, 11: Add, Button, x150 y380 w110 h30 +BackGroundTrans gSave, Сохранить
    Gui, 11: Add, Button, x20 y380 w75 h30 +BackGroundTrans gReload, Назад
    Gui, 11: Add, Picture, x10 y10 w25 h25 gInfo5, %A_WorkingDir%\RZHD\Pic\info.png
Return

Maps:
    Gui, 5: +AlwaysOnTop
    Gui, 5: Show,x0 y0 w800 h800 , Карта РЖД
    Gui, 5: Add, Picture, x0 y0 w800 h800, %A_WorkingDir%\RZHD\Pic\maps.jpg
Return

ConfRewrite:
    FileDelete, %A_WorkingDir%\RZHD\Conf\config.ini
    MsgBox, , Save Window, Перезапустите приложение, 3
ExitApp
Return

Smena:
    Smena := A_GuiControl
return

Train:
    Train := A_GuiControl
return

Save:
    Gui Submit, NoHide
    MsgBox, ,Save Window, Настройки успешно сохранены, 3
Return

Check2:
    Check2 := A_GuiControl
Return

Check3:
    Check3 := A_GuiControl
Return

Check4:
    Check4 := A_GuiControl
Return

Check5:
    Check5 := A_GuiControl
Return

Train1:
    Train1 := A_GuiControl
Return

Train2:
    Train2 := A_GuiControl
Return

Train3:
    Train3 := A_GuiControl
Return

Train4:
    Train4 := A_GuiControl
Return

Info1:
    Gui, 7: Show, w300 h200
    Gui, 7: +AlwaysOnTop
    Gui, 7: -Caption
    Gui, 7: Color, FFFFAA
    Gui, 7: Font, s20 bold, Times New Roman
    Gui, 7: Add, Text, x40 y5, Горячие клавиши
    Gui, 7: Font,
    Gui, 7: Font, s15 bold, Times New Roman
    Gui, 7: Add, Text, x10 y50, Удостоверение:
    Gui, 7: Add, Text, x10 y80, Часы: 
    Gui, 7: Add, Text, x10 y110, Рация /fracvoice:
    Gui, 7: Add, Text, x10 y140, Рация /r: 
    Gui, 7: Add, Text, x10 y170, Рация /rb:
    Gui, 7: Font,
    Gui, 7: Font, s15, Times New Roman
    Gui, 7: Add, Text, x160 y50, Shift + 1
    Gui, 7: Add, Text, x75 y80, Shift + 2
    Gui, 7: Add, Text, x170 y110, Shift + 3
    Gui, 7: Add, Text, x100 y140, Shift + 4
    Gui, 7: Add, Text, x110 y170, Shift + 5
    Gui, 7: Add, Button, x200 y200 w100 h25 gBack, Назад 
Return

Info2:
    Gui, 8: Show, w300 h200
    Gui, 8: +AlwaysOnTop
    Gui, 8: -Caption
    Gui, 8: Color, FFFFAA
    Gui, 8: Font, s20 bold, Times New Roman
    Gui, 8: Add, Text, x40 y10, Горячие клавиши
    Gui, 8: Font,
    Gui, 8: Font, s15 bold, Times New Roman
    Gui, 8: Add, Text, x10 y50, Запуск:
    Gui, 8: Add, Text, x10 y80, Рация /r: 
    Gui, 8: Add, Text, x10 y110, Рация /rb:
    Gui, 8: Font,
    Gui, 8: Font, s15, Times New Roman
    Gui, 8: Add, Text, x90 y50, Alt + 1
    Gui, 8: Add, Text, x100 y80, Shift + 4
    Gui, 8: Add, Text, x110 y110, Shift + 5
    Gui, 8: Add, Button, x200 y200 w100 h25 gBack, Назад 
Return

Info3:
    Gui, 9: Show, w300 h200
    Gui, 9: +AlwaysOnTop
    Gui, 9: -Caption
    Gui, 9: Color, FFFFAA 
    Gui, 9: Font, s20 bold, Times New Roman
    Gui, 9: Add, Text, x40 y10, Горячие клавиши
    Gui, 9: Font,
    Gui, 9: Font, s15 bold, Times New Roman
    Gui, 9: Add, Text, x10 y50, Запуск:
    Gui, 9: Add, Text, x10 y80, Рация /r: 
    Gui, 9: Add, Text, x10 y110, Рация /rb:
    Gui, 9: Font,
    Gui, 9: Font, s15, Times New Roman
    Gui, 9: Add, Text, x90 y50, Alt + 1
    Gui, 9: Add, Text, x100 y80, Shift + 4
    Gui, 9: Add, Text, x110 y110, Shift + 5
    Gui, 9: Add, Button, x200 y200 w100 h25 gBack, Назад
Return

Info4:
    Gui, 10: Show, w300 h240
    Gui, 10: +AlwaysOnTop
    Gui, 10: -Caption
    Gui, 10: Color, FFFFAA 
    Gui, 10: Font, s20 bold, Times New Roman
    Gui, 10: Add, Text, x40 y10, Горячие клавиши
    Gui, 10: Font,
    Gui, 10: Font, s15 bold, Times New Roman
    Gui, 10: Add, Text, x10 y50, ПАСС-1:
    Gui, 10: Add, Text, x10 y80, ПАСС-2:
    Gui, 10: Add, Text, x10 y110, ПАСС-3:
    Gui, 10: Add, Text, x10 y140, ПАСС-4:
    Gui, 10: Add, Text, x10 y170, Рация /r: 
    Gui, 10: Add, Text, x10 y200, Рация /rb:
    Gui, 10: Font,
    Gui, 10: Font, s15, Times New Roman
    Gui, 10: Add, Text, x100 y50, Alt + 1 
    Gui, 10: Add, Text, x100 y80, Alt + 2
    Gui, 10: Add, Text, x100 y110, Alt + 3
    Gui, 10: Add, Text, x100 y140, Alt + 4
    Gui, 10: Add, Text, x100 y170, Shift + 4
    Gui, 10: Add, Text, x110 y200, Shift + 5
    Gui, 10: Add, Button, x200 y230 w100 h25 gBack, Назад
Return

Info5:
    Gui, 12: Show, w300 h200
    Gui, 12: +AlwaysOnTop
    Gui, 12: -Caption
    Gui, 12: Color, FFFFAA
    Gui, 12: Font, s20 bold, Times New Roman
    Gui, 12: Add, Text, x40 y5, Горячие клавиши
    Gui, 12: Font,
    Gui, 12: Font, s15 bold, Times New Roman
    Gui, 12: Add, Text, x10 y50, Запуск:
    Gui, 12: Add, Text, x10 y80, Не подходите: 
    Gui, 12: Font,
    Gui, 12: Font, s15, Times New Roman
    Gui, 12: Add, Text, x160 y50, Alt + 1
    Gui, 12: Add, Text, x160 y80, Alt + 2
    Gui, 12: Add, Button, x200 y200 w100 h25 gBack, Назад 
Return

Back:
    Gui, 7: Destroy
    Gui, 8: Destroy
    Gui, 9: Destroy
    Gui, 10: Destroy
    Gui, 12: Destroy
Return

Reload:
    IniWrite, 0, %A_WorkingDir%\RZHD\Conf\config.ini, RZHD, Check2
    IniWrite, 0, %A_WorkingDir%\RZHD\Conf\config.ini, RZHD, Check3
    IniWrite, 0, %A_WorkingDir%\RZHD\Conf\config.ini, RZHD, Check4
    IniWrite, 0, %A_WorkingDir%\RZHD\Conf\config.ini, RZHD, Check5
    Reload
Return

Exit:
    IniWrite, 0, %A_WorkingDir%\RZHD\Conf\config.ini, RZHD, Check2
    IniWrite, 0, %A_WorkingDir%\RZHD\Conf\config.ini, RZHD, Check3
    IniWrite, 0, %A_WorkingDir%\RZHD\Conf\config.ini, RZHD, Check4
    IniWrite, 0, %A_WorkingDir%\RZHD\Conf\config.ini, RZHD, Check5
ExitApp
Return

+4::
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 300
    SendInput, /r{Space}
Return

+5::
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 300
    SendInput, /rb{Space}
Return

#If (Check2 == "0" and Check3 == "0" and Check4 == "0" and Check5 == "0") ;отыгровки
    #usehook
+1:: Gosub % "UDO" (I6 := !I6 || I6 = 2 ? 1 : ++I6)
UDO1:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, Здравствуйте, %Dolznost% ТЧЭ-1 "Мирный" %Name% %LastName%. {enter}
    SendInput, {t}
    sleep 1000
    SendInput, /do Удостоверение лежит в нагрудном кармане.{enter}
    SendInput, {t}
    sleep 1000
    SendInput, /me достал удостоверение из кармана и показал его{enter}
    SendInput, {t}
    sleep 1000
    SendInput, /do Удостоверение сотрудника ОАО "РЖД" №%Number%.{enter}
    SendInput, {t}
    sleep 1000
    SendInput, /do | %Name% %LastName% |.{enter}
    SendInput, {t}
    sleep 1000
    SendInput, /do | %Zvanie% %Dolznost% | Выдано %Date% |.{enter}
return
UDO2:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /me закрыл удостоверение и положил его обратно в нагрудный карман{enter}
    SendInput, {t}
    sleep 1000
    SendInput, /do Удостоверение лежит в нагрудном кармане.{enter}
return

+2::
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /me взглянул на Рабочие часы с фирменной гравировкой "ТЧЭ-1 Мирный"{Enter}
    m = 60
    m -= %A_Min%
    s = 60
    s -= %A_Sec%
    SendInput, {t}
    sleep 1000
    SendInput, /do Время на часах | %A_Hour%:%A_Min%:%A_Sec% | Дата : %A_DD%.%A_MM%.%A_YYYY% |{Enter}
    SendInput, {t}
    sleep 500
    SendInput, /paytime{Enter}
    SendInput, {t}
    sleep 500
    SendInput, /exptime{Enter}
    SendInput, {t}
    sleep 500
    SendInput, /timestamp{Enter}
Return

+3:: Gosub % "FRACVOICE" (I5 := !I5 || I5 = 2 ? 1 : ++I5)
FRACVOICE1:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /do Рация закреплена на груди. {enter}
    SendInput, {t}
    sleep 1000
    SendInput, /me снял рацию с груди и начал говорить в нее {enter}
    SendInput, {t}
    sleep 1000
    SendInput, /fracvoice 1 {enter}
return
FRACVOICE2:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /do Рация в руке. {enter}
    SendInput, {t}
    sleep 1000
    SendInput, /me закрепил рацию на груди {enter}
    SendInput, {t}
    sleep 1000
    SendInput, /do Рация закреплена на груди. {enter}
    SendInput, {t}
    sleep 1000
    SendInput, /fracvoice 0 {enter}
return

#If (Check2 != "0" and Train == "1") ;ПАСС-1-АСКД
    #usehook
!1:: Gosub % "ASKD1" (I := !I || I = 12 ? 1 : ++I)
ASKD11:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /r [%Tag%] Машинист %LastName% явился на %Smena% смену в %Time%. {enter}
return
ASKD12:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /r [%Tag%] Принимаю 1-ый состав, беру %Raspisanie% расписание. {enter}
return
ASKD13:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /r [ПАСС-1] Докладывает %LastName%, принял 1-ый локомотив, заполнил документацию. {enter}
return
ASKD14:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /r [ПАСС-1] Убраны башмаки, откручен ручной, продута тормозная магистраль. {enter}
return
ASKD15:
    SendInput, {t}
    sleep 1000
    SendInput, /r [ПАСС-1] Докладывает %LastName%, из депо вижу белый.{enter}
    SendInput, {t}
    sleep 1000
    SendInput, /r [ПАСС-1] Следую на 1-ый путь станции Мирный до выходного красного.{enter}
return
ASKD16:
    SendInput, {t}
    sleep 1000
    SendInput, /r [ПАСС-1] Докладывает %LastName%, прибыл под посадку на станцию Мирный. {enter}
return
ASKD17:
    SendInput, {t}
    sleep 1000
    SendInput, /r [ПАСС-1] Зеленый вижу, следую на 4-ый боковой станции Невский до НМ4. {enter}
return
ASKD18:
    SendInput, {t}
    sleep 1000
    SendInput, /r [ПАСС-1] Докладывает %LastName%, прибыл на 4-ый боковой станции Невский. {enter}
return
ASKD19:
    SendInput, {t}
    sleep 1000
    SendInput, /r [ПАСС-1] Следую на 2-ой путь станции Приволжск, Горель проследую без остановки. {enter}
return
ASKD110:
    SendInput, {t}
    sleep 1000
    SendInput, /r [ПАСС-1] Докладывает %LastName%, прибыл на 2-ой путь станции Приволжск. {enter}
return
ASKD111:
    SendInput, {t}
    sleep 1000
    SendInput, /r [ПАСС-1] Вижу зеленый, следую на 1-ю канаву Депо, Жуковский проследую без остановки. {enter}
return
ASKD112:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /r [ПАСС-1] Докладывает %LastName%, прибыл в депо на 2-ю канаву. {enter}
    SendInput, {t}
    sleep 1000
    SendInput, /r [ПАСС-1] Локомотив закрепляю. {enter}
    SendInput, {t}
    sleep 1000
    SendInput, /r [ПАСС-1] Локомотив закрепил, документацию сдал. Смену сдал. Спасибо за сопровождение{!} {enter}
return

#If (Check2 != "0" and Train == "2") ;ПАСС-2-АСКД
    #usehook
!1:: Gosub % "ASKD2" (I := !I || I = 12 ? 1 : ++I)
ASKD21:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /r [%Tag%] Машинист %LastName% явился на %Smena% смену в %Time%. {enter}
return
ASKD22:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /r [%Tag%] Принимаю 2-ой состав, беру %Raspisanie% расписание. {enter}
return
ASKD23:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /r [ПАСС-2] Докладывает %LastName%, принял 2-ой локомотив, заполнил документацию. {enter}
return
ASKD24:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /r [ПАСС-2] Убраны башмаки, откручен ручной, продута тормозная магистраль. {enter}
return
ASKD25:
    SendInput, {t}
    sleep 1000
    SendInput, /r [ПАСС-2] Докладывает %LastName%, из депо вижу белый, следую на 1-ый путь станции Мирный до выходного красного. {enter}
return
ASKD26:
    SendInput, {t}
    sleep 1000
    SendInput, /r [ПАСС-2] Докладывает %LastName%, прибыл под посадку на станцию Мирный. {enter}
return
ASKD27:
    SendInput, {t}
    sleep 1000
    SendInput, /r [ПАСС-2] Зеленый вижу, следую на 4-ый боковой станции Невский до НМ4. {enter}
return
ASKD28:
    SendInput, {t}
    sleep 1000
    SendInput, /r [ПАСС-2] Докладывает %LastName%, прибыл на 4-ый боковой станции Невский. {enter}
return
ASKD29:
    SendInput, {t}
    sleep 1000
    SendInput, /r [ПАСС-2] Следую на 2-ой путь станции Приволжск, Горель проследую без остановки. {enter}
return
ASKD210:
    SendInput, {t}
    sleep 1000
    SendInput, /r [ПАСС-2] Докладывает %LastName%, прибыл на 2-ой путь станции Приволжск. {enter}
return
ASKD211:
    SendInput, {t}
    sleep 1000
    SendInput, /r [ПАСС-2] Вижу зеленый, следую на 1-ю канаву Депо, Жуковский проследую без остановки. {enter}
return
ASKD212:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /r [ПАСС-2] Докладывает %LastName%, прибыл в депо на 2-ю канаву. {enter}
    SendInput, {t}
    sleep 1000
    SendInput, /r [ПАСС-2] Локомотив закрепляю. {enter}
    SendInput, {t}
    sleep 1000
    SendInput, /r [ПАСС-2] Локомотив закрепил, документацию сдал. Смену сдал. Спасибо за сопровождение{!} {enter}
return

#If (Check2 != "0" and Train == "3") ;ПАСС-3-АСКД
    #usehook
!1:: Gosub % "ASKD3" (I := !I || I = 12 ? 1 : ++I)
ASKD31:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /r [%Tag%] Машинист %LastName% явился на %Smena% смену в %Time%. {enter}
return
ASKD32:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /r [%Tag%] Принимаю 3-ий состав, беру %Raspisanie% расписание. {enter}
return
ASKD33:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /r [ПАСС-3] Докладывает %LastName%, принял 3-ий локомотив, заполнил документацию. {enter}
return
ASKD34:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /r [ПАСС-3] Убраны башмаки, откручен ручной, продута тормозная магистраль. {enter}
return
ASKD35:
    SendInput, {t}
    sleep 1000
    SendInput, /r [ПАСС-3] Докладывает %LastName%, из депо вижу белый,{Enter}
    SendInput, {t}
    sleep 1000
    SendInput, /r [ПАСС-3] следую на 1-ый путь станции Приволжск до выходного красного. {Enter}
return
ASKD36:
    SendInput, {t}
    sleep 1000
    SendInput, /r [ПАСС-3] Докладывает %LastName%, прибыл под посадку на станцию Приволжск. {enter}
return
ASKD37:
    SendInput, {t}
    sleep 1000
    SendInput, /r [ПАСС-3] Зеленый вижу, следую на 1-ый путь станции Невский до ЧМ1. {enter}
return
ASKD38:
    SendInput, {t}
    sleep 1000
    SendInput, /r [ПАСС-3] Докладывает %LastName%, прибыл на 1-ый путь станции станции Невский. {enter}
return
ASKD39:
    SendInput, {t}
    sleep 1000
    SendInput, /r [ПАСС-3] Вижу зеленый, следую на 2-ой путь станции Мирный. {enter}
return
ASKD310:
    SendInput, {t}
    sleep 1000
    SendInput, /r [ПАСС-3] Докладывает %LastName%, прибыл на 2-ой путь станции Мирный. {enter}
return
ASKD311:
    SendInput, {t}
    sleep 1000
    SendInput, /r [ПАСС-3] Вижу зеленый, следую на 2-ю канаву Депо. {enter}
return
ASKD312:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /r [ПАСС-3] Докладывает %LastName%, прибыл в депо на 2-ю канаву. {enter}
    SendInput, {t}
    sleep 1000
    SendInput, /r [ПАСС-3] Локомотив закрепляю. {enter}
    SendInput, {t}
    sleep 1000
    SendInput, /r [ПАСС-3] Локомотив закрепил, документацию сдал. Смену сдал. Спасибо за сопровождение{!} {enter}
return

#If (Check2 != "0" and Check == "АСКД", Train == "4") ;ПАСС-4-АСКД
    #usehook
!1:: Gosub % "ASKD4" (I := !I || I = 12 ? 1 : ++I)
Fou:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /r [%Tag%] Машинист %LastName% явился на %Smena% смену в %Time%. {enter}
return
ASKD42:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /r [%Tag%] Принимаю 4-ый состав, беру %Raspisanie% расписание. {enter}
return
ASKD43:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /r [ПАСС-4] Докладывает %LastName%, принял 4-ый локомотив, заполнил документацию. {enter}
return
ASKD44:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /r [ПАСС-4] Убраны башмаки, откручен ручной, продута тормозная магистраль. {enter}
return
ASKD45:
    SendInput, {t}
    sleep 1000
    SendInput, /r [ПАСС-4] Докладывает %LastName%, из депо вижу белый,{Enter}
    SendInput, {t}
    sleep 1000
    SendInput, /r [ПАСС-4] следую на 1-ый путь станции Приволжск до выходного красного. {Enter}
return
ASKD46:
    SendInput, {t}
    sleep 1000
    SendInput, /r [ПАСС-4] Докладывает %LastName%, прибыл под посадку на станцию Приволжск. {enter}
return
ASKD47:
    SendInput, {t}
    sleep 1000
    SendInput, /r [ПАСС-4] Зеленый вижу, следую на 1-ый путь станции Невский до ЧМ1. {enter}
return
ASKD48:
    SendInput, {t}
    sleep 1000
    SendInput, /r [ПАСС-4] Докладывает %LastName%, прибыл на 1-ый путь станции станции Невский. {enter}
return
ASKD49:
    SendInput, {t}
    sleep 1000
    SendInput, /r [ПАСС-4] Вижу зеленый, следую на 2-ой путь станции Мирный. {enter}
return
ASKD410:
    SendInput, {t}
    sleep 1000
    SendInput, /r [ПАСС-4] Докладывает %LastName%, прибыл на 2-ой путь станции Мирный. {enter}
return
ASKD411:
    SendInput, {t}
    sleep 1000
    SendInput, /r [ПАСС-4] Вижу зеленый, следую на 2-ю канаву Депо. {enter}
return
ASKD412:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /r [ПАСС-4] Докладывает %LastName%, прибыл в депо на 2-ю канаву. {enter}
    SendInput, {t}
    sleep 1000
    SendInput, /r [ПАСС-4] Локомотив закрепляю. {enter}
    SendInput, {t}
    sleep 1000
    SendInput, /r [ПАСС-4] Локомотив закрепил, документацию сдал. Смену сдал. Спасибо за сопровождение{!} {enter}
return

#If (Check3 != "0" and Train == "1") ;ПАСС-1-ДНЦ
    #usehook
!1:: Gosub % "DNC1" (I := !I || I = 15 ? 1 : ++I)
DNC11:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /r [%Tag%] Машинист %LastName% явился на %Smena% смену в %Time%. {enter}
return
DNC12:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /r [%Tag%] Понятно, принимаем 1-ый состав, берем %Raspisanie% расписание. {enter}
return
DNC13:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /cr Докладывает %LastName%, приняли 1-ый локомотив, заполнили документацию. {enter}
return
DNC14:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /cr Понятно, убираем башмаки, откручиваем ручной, продуваем тормозную магистраль.ТЧМ %LastName%. {enter}
return
DNC15:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /cr Докладывает %LastName%, магистраль продули, башмаки убрали, состав готов к выезду на линию. {enter}
return
DNC16:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /cr Понятно, из депо вижу белый, следуем на 1-ый путь станции Мирный до выходного красного. {enter}
return
DNC17:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /cr Прибыли под посадку на станцию Мирный.ТЧМ %LastName%. {enter}
return
DNC18:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /cr Понятно, зеленый вижу, следуем на 4-ый боковой станции Невский до НМ4.ТЧМ %LastName%. {enter}
return
DNC19:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /cr Диспетчер{!} Прибыли на 4-ый боковой станции Невский.ТЧМ %LastName%. {enter}
return
DNC110:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /cr Понятно, вижу зеленый, следуем на 2-ой путь станции Приволжск.{enter}
    SendInput, {t}
    sleep 1000
    SendInput, /cr Горель проследуем без остановки.ТЧМ %LastName%. {enter}
return
DNC111:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /cr Диспетчер{!} Прибыли на 2-ой путь станции Приволжск.ТЧМ %LastName%. {enter}
return
DNC112:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /cr Понятно, вижу зеленый, следуем на 1-ю канаву Депо.{enter}
    SendInput, {t}
    sleep 1000
    SendInput, /cr Жуковский проследуем без остановки.ТЧМ %LastName%. {enter}
return
DNC113:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /r [%Tag%] Диспетчер{!} Прибыли в депо на 1-ю канаву.ТЧМ %LastName%. {enter}
return
DNC114:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /r [%Tag%] Понятно, закрепляем локомотив.ТЧМ %LastName%. {enter}
return
DNC115:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /r [%Tag%] Локомотив закрепил, документацию сдал. Смену сдал. Спасибо за сопровождение{!} {enter}
return

#If (Check3 != "0" and Train == "2") ;ПАСС-2-ДНЦ
    #usehook
!1:: Gosub % "DNC2" (I := !I || I = 15 ? 1 : ++I)
DNC21:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /r [%Tag%] Машинист %LastName% явился на %Smena% смену в %Time%. {enter}
return
DNC22:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /r [%Tag%] Понятно, принимаем 2-ой состав, берем %Raspisanie% расписание. {enter}
return
DNC23:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /cr Докладывает %LastName%, приняли 2-ой локомотив, заполнили документацию. {enter}
return
DNC24:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /cr Понятно, убираем башмаки, откручиваем ручной, продуваем тормозную магистраль.ТЧМ %LastName%. {enter}
return
DNC25:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /cr Докладывает %LastName%, магистраль продули, башмаки убрали, состав готов к выезду на линию. {enter}
return
DNC26:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /cr Понятно, из депо вижу белый, следуем на 1-ый путь станции Мирный до выходного красного. {enter}
return
DNC27:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /cr Прибыли под посадку на станцию Мирный.ТЧМ %LastName%. {enter}
return
DNC28:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /cr Понятно, зеленый вижу, следуем на 4-ый боковой станции Невский до НМ4.ТЧМ %LastName%. {enter}
return
DNC29:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /cr Диспетчер{!} Прибыли на 4-ый боковой станции Невский.ТЧМ %LastName%. {enter}
return
DNC210:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /cr Понятно, вижу зеленый, следуем на 2-ой путь станции Приволжск.{enter}
    SendInput, {t}
    sleep 1000
    SendInput, /cr Горель проследуем без остановки.ТЧМ %LastName%. {enter}
return
DNC211:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /cr Диспетчер{!} Прибыли на 2-ой путь станции Приволжск.ТЧМ %LastName%. {enter}
return
DNC212:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /cr Понятно, вижу зеленый, следуем на 1-ю канаву Депо.{enter}
    SendInput, {t}
    sleep 1000
    SendInput, /cr Платформу Жуковский проследуем без остановки.ТЧМ %LastName%. {enter}
return
DNC213:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /r [%Tag%] Диспетчер{!} Прибыли в депо на 1-ю канаву.ТЧМ %LastName%. {enter}
return
DNC214:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /r [%Tag%] Понятно, закрепляем локомотив.ТЧМ %LastName%. {enter}
return
DNC215:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /r [%Tag%] Локомотив закрепил, документацию сдал. Смену сдал. Спасибо за сопровождение{!} {enter}
return

#If (Check3 != "0" and Train == "3") ;ПАСС-3-ДНЦ
    #usehook
!1:: Gosub % "DNC3" (I := !I || I = 15 ? 1 : ++I)
DNC31:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /r [%Tag%] Машинист %LastName% явился на %Smena% смену в %Time%. {enter}
return
DNC32:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /r [%Tag%] Понятно, принимаем 3-ий состав, берем %Raspisanie% расписание. {enter}
return
DNC33:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /cr Докладывает %LastName%, приняли 3-ий локомотив, заполнили документацию. {enter}
return
DNC34:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /cr Понятно, убираем башмаки, откручиваем ручной, продуваем тормозную магистраль.ТЧМ %LastName%. {enter}
return
DNC35:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /cr Докладывает %LastName%, магистраль продули, башмаки убрали, состав готов к выезду на линию. {enter}
return
DNC36:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /cr Понятно, из депо вижу белый, следуем на 1-ый путь станции Приволжск до выходного красного. {enter}
return
DNC37:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /cr Прибыли под посадку на 1-ый путь станции Приволжск.ТЧМ %LastName%. {enter}
return
DNC38:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /cr Понятно, зеленый вижу, следуем на 1-ый путь станции Невский до ЧМ1.ТЧМ %LastName%. {enter}
return
DNC39:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /cr Диспетчер{!} Прибыли на 1-ый путь станции Невский.ТЧМ %LastName%. {enter}
return
DNC310:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /cr Понятно, вижу зеленый, следуем на 2-ой путь станции Мирный.ТЧМ %LastName%.{enter}
return
DNC311:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /cr Диспетчер{!} Прибыли на 2-ой путь станции Мирный.ТЧМ %LastName%. {enter}
return
DNC312:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /cr Понятно, вижу зеленый, следуем на 2-ю канаву Депо.ТЧМ %LastName%.{enter}
return
DNC313:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /r [%Tag%] Диспетчер{!} Прибыли в депо на 2-ю канаву.ТЧМ %LastName%. {enter}
return
DNC314:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /r [%Tag%] Понятно, закрепляем локомотив.ТЧМ %LastName%. {enter}
return
DNC315:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /r [%Tag%] Локомотив закрепил, документацию сдал. Смену сдал. Спасибо за сопровождение{!} {enter}
return

#If (Check3 != "0" and Train == "4") ;ПАСС-4-ДНЦ
    #usehook
!1:: Gosub % "DNC4" (I := !I || I = 15 ? 1 : ++I)
DNC41:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /r [%Tag%] Машинист %LastName% явился на %Smena% смену в %Time%. {enter}
return
DNC42:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /r [%Tag%] Понятно, принимаем 4-ый состав, берем %Raspisanie% расписание. {enter}
return
DNC43:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /cr Докладывает %LastName%, приняли 4-ый локомотив, заполнили документацию. {enter}
return
DNC44:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /cr Понятно, убираем башмаки, откручиваем ручной, продуваем тормозную магистраль.ТЧМ %LastName%. {enter}
return
DNC45:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /cr Докладывает %LastName%, магистраль продули, башмаки убрали, состав готов к выезду на линию. {enter}
return
DNC46:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /cr Понятно, из депо вижу белый, следуем на 1-ый путь станции Приволжск до выходного красного. {enter}
return
DNC47:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /cr Прибыли под посадку на 1-ый путь станции Приволжск.ТЧМ %LastName%. {enter}
return
DNC48:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /cr Понятно, зеленый вижу, следуем на 1-ый путь станции Невский до ЧМ1.ТЧМ %LastName%. {enter}
return
DNC49:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /cr Диспетчер{!} Прибыли на 1-ый путь станции Невский.ТЧМ %LastName%. {enter}
return
DNC410:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /cr Понятно, вижу зеленый, следуем на 2-ой путь станции Мирный.ТЧМ %LastName%.{enter}
return
DNC411:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /cr Диспетчер{!} Прибыли на 2-ой путь станции Мирный.ТЧМ %LastName%. {enter}
return
DNC412:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /cr Понятно, вижу зеленый, следуем на 2-ю канаву Депо.ТЧМ %LastName%.{enter}
return
DNC413:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /r [%Tag%] Диспетчер{!} Прибыли в депо на 2-ю канаву.ТЧМ %LastName%. {enter}
return
DNC414:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /r [%Tag%] Понятно, закрепляем локомотив.ТЧМ %LastName%. {enter}
return
DNC415:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /r [%Tag%] Локомотив закрепил, документацию сдал. Смену сдал. Спасибо за сопровождение{!} {enter}
return

#If (Check4 != "0" and Train1 == "1") ;ДНЦ ПАСС-1
    #usehook
!1:: Gosub % "DISP1" (I1 := !I1 || I1 = 15 ? 1 : ++I1)
DISP11:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /r [%Tag%] Понятно %LastName1%, явились на смену. Принимайте 1-ый состав, поедите %Raspisanie1% расписанием.{enter}
return
DISP12:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /r [%Tag%] Верно, выполняйте. %Tag% %LastName%.{enter}
return
DISP13:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /tr 1 Понятно, приняли 1-ый состав.{enter}
    SendInput, {t}
    sleep 1000
    SendInput, /tr 1 Убирайте башмаки, откручивайте ручном тормоз, продувайте тормозную магистраль.{enter}
return
DISP14:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /tr 1 Верно, выполняйте. %Tag% %LastName%.{enter}
return
DISP15:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /tr 1 Понятно, состав готов к выезду.Из депо вам белый,станция Мирный принимает на 1-ый путь.{enter}
    SendInput, {t}
    sleep 1000
    SendInput, /tr 1 Следуете до выходного НМ1 красного с остановкой перед ним. Отправление в %Time1%.{enter}
return
DISP16:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /tr 1 Верно, выполняйте. %Tag% %LastName%.{enter}
return
DISP17:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /tr 1 Понятно, прибыли под посадку на станцию Мирный. Выходной вам зеленый.{enter}
    SendInput, {t}
    sleep 1000
    SendInput, /tr 1 Следуете на 4-ый боковой станции Невский до выходного НМ4 запрещающего.{enter}
return
DISP18:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /tr 1 Верно, выполняйте. %Tag% %LastName%.{enter}
return
DISP19:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /tr 1 Понятно, прибыли на 4-ый боковой станции Невский. Выходной НМ4 вам зеленый.{enter}
    SendInput, {t}
    sleep 1000
    SendInput, /tr 1 Следуете на 2-ой путь станции Приволжск, до НМ2 запрещающего.{enter}
    SendInput, {t}
    sleep 1000
    SendInput, /tr 1 Платформу Гарель проследуете без остановки.{enter}
return
DISP110:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /tr 1 Верно, выполняйте. %Tag% %LastName%.{enter}
return
DISP111:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /tr 1 Понятно, прибыли на 2-ой путь станции Приволжск. Выходной НМ2 вам зеленый.{enter}
    SendInput, {t}
    sleep 1000
    SendInput, /tr 1 Следуете в депо на 1-ю канаву, платформу Жуковский проследуете без остановки.{enter}
return
DISP112:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /tr 1 Верно, выполняйте. %Tag% %LastName%.{enter}
return
DISP113:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /r [%Tag%] Понятно, прибыли на 1-ю канаву. Закрепляйте локомотив.{enter}
return
DISP114:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /r [%Tag%] Верно, выполняйте.{enter}
return
DISP115:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /r [%Tag%] Понятно, закрепили, документацию и смену сдали. Спасибо за работу!{enter}
return

#If (Check4 != "0" and Train2 == "1") ;ДНЦ ПАСС-2
    #usehook
!2:: Gosub % "DISP2" (I2 := !I2 || I2 = 15 ? 1 : ++I2)
DISP21:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /r [%Tag%] Понятно %LastName2%, явились на смену. Принимайте 2-ой состав, поедите %Raspisanie2% расписанием.{enter}
return
DISP22:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /r [%Tag%] Верно, выполняйте. %Tag% %LastName%.{enter}
return
DISP23:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /tr 2 Понятно, приняли 2-ой состав.{enter}
    SendInput, {t}
    sleep 1000
    SendInput, /tr 2 Убирайте башмаки, откручивайте ручном тормоз, продувайте тормозную магистраль.{enter}
return
DISP24:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /tr 2 Верно, выполняйте. %Tag% %LastName%.{enter}
return
DISP25:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /tr 2 Понятно, состав готов к выезду.Из депо вам белый,станция Мирный принимает на 1-ый путь.{enter}
    SendInput, {t}
    sleep 1000
    SendInput, /tr 2 Следуете до выходного НМ1 красного с остановкой перед ним. Отправление в %Time2%.{enter}
return
DISP26:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /tr 2 Верно, выполняйте. %Tag% %LastName%.{enter}
return
DISP27:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /tr 2 Понятно, прибыли под посадку на станцию Мирный. Выходной вам зеленый.{enter}
    SendInput, {t}
    sleep 1000
    SendInput, /tr 2 Следуете на 4-ый боковой станции Невский до выходного НМ4 запрещающего.{enter}
return
DISP28:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /tr 2 Верно, выполняйте. %Tag% %LastName%.{enter}
return
DISP29:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /tr 2 Понятно, прибыли на 4-ый боковой станции Невский. Выходной НМ4 вам зеленый.{enter}
    SendInput, {t}
    sleep 1000
    SendInput, /tr 2 Следуете на 2-ой путь станции Приволжск, до НМ2 запрещающего.{enter}
    SendInput, {t}
    sleep 1000
    SendInput, /tr 2 Платформу Гарель проследуете без остановки.{enter}
return
DISP210:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /tr 2 Верно, выполняйте. %Tag% %LastName%.{enter}
return
DISP211:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /tr 2 Понятно, прибыли на 2-ой путь станции Приволжск. Выходной НМ2 вам зеленый.{enter}
    SendInput, {t}
    sleep 1000
    SendInput, /tr 2 Следуете в депо на 1-ю канаву, платформу Жуковский проследуете без остановки.{enter}
return
DISP212:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /tr 2 Верно, выполняйте. %Tag% %LastName%.{enter}
return
DISP213:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /r [%Tag%] Понятно, прибыли на 1-ю канаву. Закрепляйте локомотив.{enter}
return
DISP214:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /r [%Tag%] Верно, выполняйте.{enter}
return
DISP215:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /r [%Tag%] Понятно, закрепили, документацию и смену сдали. Спасибо за работу!{enter}
return

#If (Check4 != "0" and Train3 == "1") ;ДНЦ ПАСС-3
    #usehook
!3:: Gosub % "DISP3" (I3 := !I3 || I3 = 15 ? 1 : ++I3)
DISP31:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /r [%Tag%] Понятно %LastName3%, явились на смену. Принимайте 3-ий состав, поедите %Raspisanie3% расписанием.{enter}
return
DISP32:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /r [%Tag%] Верно, выполняйте. %Tag% %LastName%.{enter}
return
DISP33:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /tr 3 Понятно, приняли 3-ий состав.{enter}
    SendInput, {t}
    sleep 1000
    SendInput, /tr 3 Убирайте башмаки, откручивайте ручном тормоз, продувайте тормозную магистраль.{enter}
return
DISP34:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /tr 3 Верно, выполняйте. %Tag% %LastName%.{enter}
return
DISP35:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /tr 3 Понятно, состав готов к выезду.Из депо вам белый,станция Приволжск принимает на 1-ый путь.{enter}
    SendInput, {t}
    sleep 1000
    SendInput, /tr 3 Следуете до выходного ЧМ1 красного с остановкой перед ним. Отправление в %Time3%.{enter}
return
DISP36:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /tr 3 Верно, выполняйте. %Tag% %LastName%.{enter}
return
DISP37:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /tr 3 Понятно, прибыли на 1-ый путь станции Приволжск. Выходной ЧМ1 вам зеленый.{enter}
    SendInput, {t}
    sleep 1000
    SendInput, /tr 3 Следуете на 1-ый путь станции Невский до выходного ЧМ1 запрещающего.{enter}
    SendInput, {t}
    sleep 1000
    SendInput, /tr 3 Платформу Гарель проследуете без остановки.{enter}
return
DISP38:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /tr 3 Верно, выполняйте. %Tag% %LastName%.{enter}
return
DISP39:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /tr 3 Понятно, прибыли на 1-ый путь станции Невский. Выходной ЧМ1 вам зеленый.{enter}
    SendInput, {t}
    sleep 1000
    SendInput, /tr 3 Следуете на 2-ой путь станции Мирный, до ЧМ2 запрещающего.{enter}
return
DISP310:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /tr 3 Верно, выполняйте. %Tag% %LastName%.{enter}
return
DISP311:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /tr 3 Понятно, прибыли на 2-ой путь станции Мирный. Выходной ЧМ2 вам зеленый.{enter}
    SendInput, {t}
    sleep 1000
    SendInput, /tr 3 Следуете в депо на 2-ю канаву.{enter}
return
DISP312:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /tr 3 Верно, выполняйте. %Tag% %LastName%.{enter}
return
DISP313:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /r [%Tag%] Понятно, прибыли на 2-ю канаву. Закрепляйте локомотив.{enter}
return
DISP314:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /r [%Tag%] Верно, выполняйте.{enter}
return
DISP315:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /r [%Tag%] Понятно, закрепили, документацию и смену сдали. Спасибо за работу!{enter}
return

#If (Check4 != "0" and Train4 == "1") ;ДНЦ ПАСС-4
    #usehook
!4:: Gosub % "DISP4" (I4 := !I4 || I4 = 15 ? 1 : ++I4)
DISP41:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /r [%Tag%] Понятно %LastName4%, явились на смену. Принимайте 4-ый состав, поедите %Raspisanie4% расписанием.{enter}
return
DISP42:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /r [%Tag%] Верно, выполняйте. %Tag% %LastName%.{enter}
return
DISP43:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /tr 4 Понятно, приняли 4-ый состав.{enter}
    SendInput, {t}
    sleep 1000
    SendInput, /tr 4 Убирайте башмаки, откручивайте ручном тормоз, продувайте тормозную магистраль.{enter}
return
DISP44:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /tr 4 Верно, выполняйте. %Tag% %LastName%.{enter}
return
DISP45:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /tr 4 Понятно, состав готов к выезду.Из депо вам белый,станция Приволжск принимает на 1-ый путь.{enter}
    SendInput, {t}
    sleep 1000
    SendInput, /tr 4 Следуете до выходного ЧМ1 красного с остановкой перед ним. Отправление в %Time4%.{enter}
return
DISP46:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /tr 4 Верно, выполняйте. %Tag% %LastName%.{enter}
return
DISP47:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /tr 4 Понятно, прибыли на 1-ый путь станции Приволжск. Выходной ЧМ1 вам зеленый.{enter}
    SendInput, {t}
    sleep 1000
    SendInput, /tr 4 Следуете на 1-ый путь станции Невский до выходного ЧМ1 запрещающего.{enter}
    SendInput, {t}
    sleep 1000
    SendInput, /tr 4 Платформу Гарель проследуете без остановки.{enter}
return
DISP48:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /tr 4 Верно, выполняйте. %Tag% %LastName%.{enter}
return
DISP49:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /tr 4 Понятно, прибыли на 1-ый путь станции Невский. Выходной ЧМ1 вам зеленый.{enter}
    SendInput, {t}
    sleep 1000
    SendInput, /tr 4 Следуете на 2-ой путь станции Мирный, до ЧМ2 запрещающего.{enter}
return
DISP410:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /tr 4 Верно, выполняйте. %Tag% %LastName%.{enter}
return
DISP411:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /tr 4 Понятно, прибыли на 2-ой путь станции Мирный. Выходной ЧМ2 вам зеленый.{enter}
    SendInput, {t}
    sleep 1000
    SendInput, /tr 4 Следуете в депо на 2-ю канаву.{enter}
return
DISP412:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /tr 4 Верно, выполняйте. %Tag% %LastName%.{enter}
return
DISP413:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /r [%Tag%] Понятно, прибыли на 2-ю канаву. Закрепляйте локомотив.{enter}
return
DISP414:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /r [%Tag%] Верно, выполняйте.{enter}
return
DISP415:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /r [%Tag%] Понятно, закрепили, документацию и смену сдали. Спасибо за работу!{enter}
return

#If (Check5 != "0") ;Собеседование
    #usehook
!1:: Gosub % "SOBES" (I7 := !I7 || I7 = 10 ? 1 : ++I7)
SOBES1:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /say Здравствуйте{!} Ваше ФИО, возраст и образование{!}{enter}
    SendInput, {t}
    sleep 1000
    SendInput, /b Всё пишите в чат.{enter}
return
SOBES2:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, Хорошо, передайте мне ваш паспорт{!}{enter}
    SendInput, {t}
    sleep 1000
    SendInput, /b Передавать по РП, через /me и /do.{enter}
return
SOBES3:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /b /pass id (id - число рядом с ником){enter}
    SendInput, {t}
    sleep 1000
    SendInput, /me взял паспорт{enter}
    SendInput, {t}
    sleep 1000
    SendInput, /me изучил паспорт, после чего отдал человеку напротив{enter}
return
SOBES4:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, Присядьте{!}{enter}
return
SOBES5:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /b Вставайте{!}{enter}
return
SOBES6:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, Вставайте.{enter}
return
SOBES7:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, Что такое МГ{?}{enter}
return
SOBES8:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /b Что такое РП, ТК, ДМ, ПГ (по ВПС) - значение терминов. {enter}
return
SOBES9:
    SendMessage, 0x50,, 0x4190419,, A 
    SendInput, {t}
    sleep 1000
    SendInput, Что у меня над головой?{enter}
return
SOBES10:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, Гражданин, Вы прошли{!} Проходите за мной.{enter}
return

#If (Check5 != "0") ;Собеседование
    #usehook
!2:: 
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {t}
    sleep 1000
    SendInput, /say Гражданин, к сожалению, Вы нам не подходите, покиньте пожалуйста парковку ОАО "РЖД"{!}{enter}
Return