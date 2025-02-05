@echo off
rem RELEASE BUILD
asm68k /k /m /o ws+ /o op+ /o os+ /o ow+ /o oz+ /o oaq+ /o osq+ /o omq+ /o ae- /o v+ /p main.asm, sunrise.bin, sunrise.sym, sunrise.lst
convsym.exe sunrise.sym sunrise.bin -a
rompad.exe sunrise.bin 255 0
fixheadr.exe sunrise.bin

rem DEBUG BUILD
asm68k /k /m /o ws+ /o op+ /o os+ /o ow+ /o oz+ /o oaq+ /o osq+ /o omq+ /o ae- /o v+ /p /e __DEBUG__=1 main.asm, sunrise.debug.bin, sunrise.debug.sym, sunrise.debug.lst
convsym.exe sunrise.debug.sym sunrise.debug.bin -a
rompad.exe sunrise.debug.bin 255 0
fixheadr.exe sunrise.debug.bin
pause