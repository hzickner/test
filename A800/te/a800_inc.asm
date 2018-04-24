; memory locations
CASINI		equ	$02
RTCLOK		equ	$12		; high byte of 3byte frame counter
DOSVEC		equ	$0A
DOSINI		equ	$0C
VDSLST		equ	$200		; pointer to DLI routine
SDMCTL		equ	$22F
SDLSTL		equ	$230
SDLSTH		equ	$231
COLOR0		equ	$2C4
COLOR1		equ	$2C5
COLOR2		equ	$2C6
COLOR3		equ	$2C7
COLOR4		equ	$2C8
CHBAS		equ	$2F4
ICPTL  		equ	$0346
ICPTH  		equ	$0347

TRIG0		equ	$D010
TRIG1		equ	$D011
PAL		equ	$D014	; NTSC if bits 1-3 set
COLPF0		equ	$D016
COLPF1		equ	$D017
COLPF2		equ	$D018
COLPF3		equ	$D019
COLBK		equ	$D01A
CONSOL		equ	$D01F
RANDOM		equ	$D20A
PORTA		equ	$D300
CHBASE		equ	$D409
WSYNC		equ	$D40A
VCOUNT		equ	$D40B
NMIEN		equ	$D40E

SETVBV		equ	$E45C
XITVBV		equ	$E462
COLDSV		equ	$E477

; defines

; SDMCTL
NARROW_PF	equ	%00000001
STD_PF		equ	%00000010
WIDE_PF		equ	%00000011
MISSILE_DMA	equ	%00000100
PLAYER_DMA	equ	%00001000
PLAYER_ONELINE	equ	%00010000
FETCH_DMA	equ	%00100000

; NMIEN
DLI_ON		equ	%10000000
VBI_ON		equ	%01000000