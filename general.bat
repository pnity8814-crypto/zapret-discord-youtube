@echo off
cd /d "%~dp0"
set BIN=%~dp0bin\

:: Перехватываем веб-трафик, порты авторизации Xbox/Microsoft и порт Майнкрафта
set ARGS=--wf-tcp=80,443,3074,25565 --wf-udp=443,3074,50000-65535

:: Запуск с продвинутым методом split (разбиение пакетов), который чинит авторизацию Microsoft
"%BIN%winws.exe" %ARGS% --filter-tcp=80,443,3074,25565 --dpi-desync=split --dpi-desync-split-pos=1 --dpi-desync-repeats=2 --filter-udp=443,3074 --dpi-desync=fake
