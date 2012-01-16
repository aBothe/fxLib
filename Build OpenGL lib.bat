@echo off

cd src

..\buildlib "..\lib\gl.lib" -i"opengl" -ddoc"..\man\candydoc\candy.ddoc" -docdir"..\man\OpenGl"

pause