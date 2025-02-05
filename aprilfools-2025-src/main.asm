		include	"Debugger.asm"
		
; VARIABLES:

VdpCtrl:    equ $C00004  ; VDP control port
VdpData:    equ $C00000  ; VDP data port
HvCounter:  equ $C00008  ; H/V counter

VDPREG_MODE1:     equ $8000  ; Mode register #1
VDPREG_MODE2:     equ $8100  ; Mode register #2
VDPREG_MODE3:     equ $8B00  ; Mode register #3
VDPREG_MODE4:     equ $8C00  ; Mode register #4

VDPREG_PLANEA:    equ $8200  ; Plane A table address
VDPREG_PLANEB:    equ $8400  ; Plane B table address
VDPREG_SPRITE:    equ $8500  ; Sprite table address
VDPREG_WINDOW:    equ $8300  ; Window table address
VDPREG_HSCROLL:   equ $8D00  ; HScroll table address

VDPREG_SIZE:      equ $9000  ; Plane A and B size
VDPREG_WINX:      equ $9100  ; Window X split position
VDPREG_WINY:      equ $9200  ; Window Y split position
VDPREG_INCR:      equ $8F00  ; Autoincrement
VDPREG_BGCOL:     equ $8700  ; Background color
VDPREG_HRATE:     equ $8A00  ; HBlank interrupt rate

VDPREG_DMALEN_L:  equ $9300  ; DMA length (low)
VDPREG_DMALEN_H:  equ $9400  ; DMA length (high)
VDPREG_DMASRC_L:  equ $9500  ; DMA source (low)
VDPREG_DMASRC_M:  equ $9600  ; DMA source (mid)
VDPREG_DMASRC_H:  equ $9700  ; DMA source (high)

VRAM_ADDR_CMD:  equ $40000000
CRAM_ADDR_CMD:  equ $C0000000
VSRAM_ADDR_CMD: equ $40000010

VRAM_SIZE:    equ 65536
CRAM_SIZE:    equ 128
VSRAM_SIZE:   equ 80

GFXMODE_256x224:      equ %00000000
GFXMODE_320x224:      equ %10000001
GFXMODE_256x448:      equ %00000110
GFXMODE_320x448:      equ %10000111
GFXMODE_256x224_SH:   equ %00001000
GFXMODE_320x224_SH:   equ %10001001
GFXMODE_256x448_SH:   equ %00001110
GFXMODE_320x448_SH:   equ %10001111

IoCtrl1: equ $A10009   ; 1P control port
IoCtrl2: equ $A1000B   ; 2P control port
IoData1: equ $A10003   ; 1P data port
IoData2: equ $A10005   ; 2P data port

Z80Ram:     equ $A00000  ; Where Z80 RAM starts
Z80BusReq:  equ $A11100  ; Z80 bus request line
Z80Reset:   equ $A11200  ; Z80 reset line



; END OF VARIABLES

; MACROS

align macro
	cnop 0,\1
	endm
	
SetGfxMode macro mode
    move.w  #VDPREG_MODE4|(mode), (VdpCtrl)
    endm
	
PauseZ80: macro
    move.w  #$100, (Z80BusReq)
@WaitZ80\@:
    btst    #0, (Z80BusReq)
    bne.s   @WaitZ80\@
    endm
	
ResumeZ80: macro
    move.w  #$000, (Z80BusReq)
    endm
	
FastPauseZ80: macro
    move.w  #$100, (Z80BusReq)
    endm
	
; END OF MACROS
	
StartOfRom:
Vectors:			dc.l $FFFE00, EntryPoint, BusError, AddressError
					dc.l IllegalInstr, ZeroDivide, ChkInstr, TrapvInstr
					dc.l PrivilegeViol, Trace, Line1010Emu,	Line1111Emu
					dc.l ErrorExcept, ErrorExcept, ErrorExcept, ErrorExcept
					dc.l ErrorExcept, ErrorExcept, ErrorExcept, ErrorExcept
					dc.l ErrorExcept, ErrorExcept, ErrorExcept, ErrorExcept
					dc.l ErrorExcept, ErrorTrap, ErrorTrap, ErrorTrap
					dc.l ErrorTrap,	ErrorTrap, ErrorTrap, ErrorTrap
					dc.l ErrorTrap,	ErrorTrap, ErrorTrap, ErrorTrap
					dc.l ErrorTrap,	ErrorTrap, ErrorTrap, ErrorTrap
					dc.l ErrorTrap,	ErrorTrap, ErrorTrap, ErrorTrap
					dc.l ErrorTrap,	ErrorTrap, ErrorTrap, ErrorTrap
					dc.l ErrorTrap,	ErrorTrap, ErrorTrap, ErrorTrap
					dc.l ErrorTrap,	ErrorTrap, ErrorTrap, ErrorTrap
					dc.l ErrorTrap,	ErrorTrap, ErrorTrap, ErrorTrap
					dc.l ErrorTrap,	ErrorTrap, ErrorTrap, ErrorTrap
					dc.b 'SEGA MEGA DRIVE ' ; Hardware system ID
Date:				dc.b 'WRSTUDIOS 2025  ' ; Release date
Title_Local:		dc.b 'Sunrise (April Fools)                           ' ; Domestic name
Title_Int:			dc.b 'Sunrise (April Fools)                           ' ; International name
Serial:				dc.b 'GM 00001009-00'   ; Serial/version number
Checksum:			dc.w 0
					dc.b 'J               ' ; I/O support
RomStartLoc:		dc.l StartOfRom		; ROM start
RomEndLoc:			dc.l EndOfRom-1	; ROM end
RamStartLoc:		dc.l $FF0000		; RAM start
RamEndLoc:			dc.l $FFFFFF		; RAM end
SRAMSupport:		dc.l $20202020		; change to $5241E020 to create	SRAM
					dc.l $20202020		; SRAM start
					dc.l $20202020		; SRAM end
Notes:				dc.b '                                                    '
Region:				dc.b 'JUE             ' ; Region

; ===========================================================================

ErrorTrap:
		nop	
		nop	
		bra.s	ErrorTrap
; ===========================================================================

EntryPoint:
		bsr.w	VDPSetup
		SetGfxMode GFXMODE_256x224
		FastPauseZ80
		move.b  #$40, (IoCtrl1)   ; 1P control port
		move.b  #$40, (IoData1)   ; 1P data port
		move.b  #$40, (IoCtrl2)   ; 2P control port
		move.b  #$40, (IoData2)   ; 2P data port
		ResumeZ80
		bsr.w	ReadJoypad
		jmp	MainGameLoop
		rts
		
VDPSetup:
		tst.w   (VdpCtrl)
		lea     (VdpCtrl), a0
    
		move.w  #VDPREG_MODE1|$04, (a0)    ; Mode register #1
		move.w  #VDPREG_MODE2|$04, (a0)    ; Mode register #2
		move.w  #VDPREG_MODE3|$00, (a0)    ; Mode register #3
		move.w  #VDPREG_MODE4|$81, (a0)    ; Mode register #4
		
		move.w  #VDPREG_PLANEA|$30, (a0)   ; Plane A address
		move.w  #VDPREG_PLANEB|$07, (a0)   ; Plane B address
		move.w  #VDPREG_SPRITE|$78, (a0)   ; Sprite address
		move.w  #VDPREG_WINDOW|$34, (a0)   ; Window address
		move.w  #VDPREG_HSCROLL|$3D, (a0)  ; HScroll address
		
		move.w  #VDPREG_SIZE|$01, (a0)     ; Tilemap size
		move.w  #VDPREG_WINX|$00, (a0)     ; Window X split
		move.w  #VDPREG_WINY|$00, (a0)     ; Window Y split
		move.w  #VDPREG_INCR|$02, (a0)     ; Autoincrement
		move.w  #VDPREG_BGCOL|$00, (a0)    ; Background color
		move.w  #VDPREG_HRATE|$FF, (a0)    ; HBlank IRQ rate
		
		; Stuff we'll use a lot
		moveq   #0, d0          ; To write zeroes
		lea     (VdpCtrl), a0   ; VDP control port
		lea     (VdpData), a1   ; VDP data port
		
		; Clear VRAM
		move.l  #VRAM_ADDR_CMD, (a0)
		move.w  #(VRAM_SIZE/4)-1, d1
	@ClearVram:
		move.l  d0, (a1)
		dbf     d1, @ClearVram
		
		; Clear CRAM
		move.l  #CRAM_ADDR_CMD, (a0)
		move.w  #(CRAM_SIZE/4)-1, d1
	@ClearCram:
		move.l  d0, (a1)
		dbf     d1, @ClearCram
		
		; Clear VSRAM
		move.l  #VSRAM_ADDR_CMD, (a0)
		move.w  #(VSRAM_SIZE/4)-1, d1
	@ClearVsram:
		move.l  d0, (a1)
		dbf     d1, @ClearVsram
		rts
		
ReadJoypad:
		; a0 = IoData1 for player 1
		;    = IoData2 for player 2
		
		FastPauseZ80        ; Pause Z80 for a bit
		
		move.b  #$40, (a0)  ; Do 1st step
		nop                 ; D-pad, B and C
		nop
		nop
		nop
		move.b  (a0), d0
		
		move.b  #$00, (a0)  ; Do 2nd step
		nop                 ; A and Start
		nop
		nop
		nop
		move.b  (a0), d1
		
		ResumeZ80           ; Z80 can run now
		
		and.b   #$3F, d0    ; Rearrange bits
		and.b   #$30, d1    ; into SACBRLDU
		lsl.b   #2, d1
		or.b    d1, d0
		
		; Now d0 contains all the buttons
		; May want to use a NOT if you prefer
		; 1 = pressed and 0 = released
		rts
		
; ==============================================================

MainGameLoop:
		move.b	($FFFFF600).w,d0 ; load	Game Mode
		andi.w	#$1C,d0
		jsr	GameModeArray(pc,d0.w) ; jump to apt location in ROM
		bra.s	MainGameLoop
; ===========================================================================
; ---------------------------------------------------------------------------
; Main game mode array
; ---------------------------------------------------------------------------

GameModeArray:
		bra.w	WRScreen	; Sega Screen ($00)
; ===========================================================================
		bra.w	TitleScreen	; Title	Screen ($04)
; ===========================================================================
		bra.w	Level		; Normal Level ($08)
; ===========================================================================
		bra.w	Credits		; Credits ($1C)
; ===========================================================================
		rts

WRScreen:
		bra.s	*
		rts
		
TitleScreen:
		bra.s	*
		rts
		
Level:
		bra.s	*
		rts
		
Credits:
		bra.s	*
		rts

; ==============================================================
; --------------------------------------------------------------
; Debugging modules
; --------------------------------------------------------------

   include   "ErrorHandler.asm"

; --------------------------------------------------------------
; WARNING!
;	DO NOT put any data from now on! DO NOT use ROM padding!
;	Symbol data should be appended here after ROM is compiled
;	by ConvSym utility, otherwise debugger modules won't be able
;	to resolve symbol names.
; --------------------------------------------------------------

; end of 'ROM'
EndOfRom:


		END
