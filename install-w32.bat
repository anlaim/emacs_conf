set emacs_dir=D:\usr\emacs-24.0.90
set HOME=d:\
cd bin\mew-6.4
mew.exe

rem »Øµ½~/.emacs.d
cd ..\.. 
xcopy /r /e /h /y  dll\* %emacs_dir%\bin
xcopy /r /e /h   script\msys-bashrc %HOME%\.bashrc
pause
