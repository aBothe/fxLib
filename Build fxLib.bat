@echo off

cd src

..\buildlib "..\lib\fx.lib" -i"fx" -ddoc"..\man\candydoc\candy.ddoc" -docdir"..\man\fxLib"

pause