set emacs_dir=D:\usr\emacs-24.0.90
set HOME=d:\
cd bin\mew-6.4
mew.exe

rem �ص�~/.emacs.d
cd ..\.. 
xcopy /r /e /h /y  dll\* %emacs_dir%\bin
xcopy /r /e /h /-y   script\msys-bashrc %HOME%\.bashrc

cd bin
Everything-1.2.1.371.exe

mkdir %HOME%\.ssh
xcopy /r/e/h /-y dotsshconfig %HOME%/\.ssh\config
pause
