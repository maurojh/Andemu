IF "%HOME%"=="" ECHO HOME não está definida, definindo HOME...
IF "%HOME%"=="" MKDIR C:\hemacs
IF "%HOME%"=="" SETX HOME=C:\hemacs

set pasta=%cd%
set pasta=%pasta:\=/%

echo (add-to-list 'load-path "%pasta%") (load "criarprojeto") > %HOME%\.emacs
