set emacs_dir=D:\usr\emacs-24.0.90
set HOME=d:\
cd bin\mew-6.4
mew.exe

rem »Øµ½~/.emacs.d
cd ..\.. 
xcopy /r /e /h /y  dll\* %emacs_dir%\bin
xcopy /r /e /h /-y   script\msys-bashrc %HOME%\.bashrc

cd bin
Everything-1.2.1.371.exe

ctags -f %emacs_dir%\lisp\TAGS -e -R %emacs_dir%\lisp

mkdir %HOME%\.ssh
xcopy /r/e/h /-y dotsshconfig %HOME%/\.ssh\config
cd ..

del c:\WINDOWS\system32\find.exe
del c:\WINDOWS\system32\dllcache\find.exe
del c:\WINDOWS\system32\find.exe

script\emacs-w32.reg

xcopy /y %emacs_dir%\bin\emacsclient.exe  %emacs_dir%\bin\ec.exe 
pause
