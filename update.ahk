#SingleInstance Force 
SetWorkingDir, C:

    IfnotExist, %A_WorkingDir%\RZHD 
    {
        FileCreateDir, %A_WorkingDir%\RZHD
        FileCreateDir, %A_WorkingDir%\RZHD\Conf
        FileCreateDir, %A_WorkingDir%\RZHD\Pic
    }

    IfnotExist, %A_WorkingDir%\RZHD\RZHD.exe
    {
        MsgBox, , Автообновление, Обновления найдены`nПожалуйста подождите, 2
        URLDownloadToFile, https://github.com/AlaoisMC/RZHD/blob/main/RZHD.exe?raw=true, %A_WorkingDir%\RZHD\RZHD.exe
        FileCreateShortcut, %A_WorkingDir%\RZHD\update.exe, %A_Desktop%\AHK для РЖД.lnk, , , , %A_WorkingDir%\RZHD\Pic\ржд4.ico
        URLDownloadToFile, https://github.com/AlaoisMC/RZHD/raw/main/upd_new.ini, %A_WorkingDir%\RZHD\Conf\upd_new.ini
        IniRead, rzhd_upd, %A_WorkingDir%\RZHD\Conf\upd_new.ini, VER_UPD, rzhd_upd
        IniWrite, %rzhd_upd%, %A_WorkingDir%\RZHD\Conf\upd_last.ini, VER, rzhd
        IniWrite, 0, %A_WorkingDir%\RZHD\Conf\upd_last.ini, VER, updater
        Run, %A_WorkingDir%\RZHD\RZHD.exe
        ExitApp
    }

    URLDownloadToFile, https://github.com/AlaoisMC/RZHD/raw/main/upd_new.ini, %A_WorkingDir%\RZHD\Conf\upd_new.ini
    IniRead, rzhd_upd, %A_WorkingDir%\RZHD\Conf\upd_new.ini, VER_UPD, rzhd_upd
    IniRead, rzhd, %A_WorkingDir%\RZHD\Conf\upd_last.ini, VER, rzhd

    if (rzhd<rzhd_upd)
    {
        MsgBox, , Автообновление, Обновления найдены`nПожалуйста подождите, 2
        URLDownloadToFile, https://github.com/AlaoisMC/RZHD/blob/main/RZHD.exe?raw=true, %A_WorkingDir%\RZHD\RZHD.exe
        IniWrite, %rzhd_upd%, %A_WorkingDir%\RZHD\Conf\upd_last.ini, VER, rzhd
        FileDelete, %A_WorkingDir%\RZHD\Conf\upd_new.ini
        FileDelete, %A_WorkingDir%\RZHD\README.txt
        URLDownloadToFile, https://github.com/AlaoisMC/RZHD/raw/main/README.txt, %A_WorkingDir%\RZHD\README.txt
        Sleep, 2000
        Run, %A_WorkingDir%\RZHD\README.txt
        Run, %A_WorkingDir%\RZHD\RZHD.exe
        ExitApp
    }
    Else
    {
        MsgBox, , Автообновление, Обновлений нет`nЗапуск программы, 2
        FileDelete, %A_WorkingDir%\RZHD\Conf\upd_new.ini
        Run, %A_WorkingDir%\RZHD\RZHD.exe
        ExitApp
    }