
--What is fxLib?

A library for creating basic Win32 Apps with just a small amount of code. 
There are also several small tools e.g. for reading the current RAM usage, establishing internet connections (building up TCP/UDP listeners),
creating primitive line diagrams and pie charts.




-- How to build the import library?

Just run the "Build fxLib.bat". Note that the dmd.exe must be accessible through the %PATH% environment variable!

I made an extra tool for compiling&linking all library files automatically. So no further configuration required.

Right after building the fx.lib file, 
copy it to your local dmd2 installation, 
so e.g. to C:\dmd2\windows\lib\




-- How to use it?

To use most features of fxLib,
simply add the 2 following lines to your code header:

import fx.myfx;

pragma(lib,"fx.lib");




-- What about a sample application?

Just spend a look into the 'examples' directory.