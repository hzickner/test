	ICL "a800_inc.asm"
	ICL "te_constants.asm"

;-------------------------------------------------------------------------------
; zero page variables
;-------------------------------------------------------------------------------
	org $0080
TEMP1		.DS	2
TEMP1_N		.DS	2
TEMP2		.DS	2
B1		.DS	1	; temp variable for main thread
B1_N		.DS	1	; temp variable for nmi thread
B2		.DS	1
B2_N		.DS	1
B3		.DS	1
B4		.DS	1
BGS_USED	.DS	1
BUTTONS_ALL	.DS	1	; cur plr bits for buttons pressed A B Select Start Up Down Left Right
BUTTONS_NEW	.DS	1	; cur plr bits for just pressed buttons
COUNTDOWN	.DS	1
CUR_PLR		.DS	1	; 0 / 1 for PLR1 / PLR2
GAME_FUNC_INDEX	.DS	1
GAME_MODE	.DS	1
JOY1_RAW_NEW	.DS	1
JOY1_RAW_ALL	.DS	1
JOY2_RAW_NEW	.DS	1
JOY2_RAW_ALL	.DS	1
N_PLR		.DS	1
vNMIEN		.DS	1
NMI_FUNC_INDEX	.DS	1
OAM_USED	.DS	1
PF_PTR		.DS	2	; pointer to playfield data
PREVIEW_FLAG	.DS	1
SEL_TYPE	.DS	1
SEL_MUSIC	.DS	1
SPAWN_ID	.DS	1	; id of last spawned tetrimino
SPR_PTR_INDEX	.DS	1
SPR_X		.DS	1
SPR_Y		.DS	1
T_COUNT		.DS	1	; count tetriminoes, contributes to RANDOM selection
TETR_NEXT	.DS	1	; next tetrimino max value 18

; game vars for cur plr
	.align $10
TETR_X		.DS	1	; X coordinate of current tetrimino
TETR_Y		.DS	1	; Y coordinate of current tetrimino
TETR_OR		.DS	1	; Orientation of current tetrimino
DAS_TIMER	.DS	1	; timer for delayed auto shift when holding left/right
SEL_LEVEL	.DS	1
GAME_PHASE	.DS	1	; jump table index
DAR_TIMER	.DS	1	; down autorepeat timer
ST_LINES	.DS	2
ST_SCORE	.DS	3
SEL_HEIGHT	.DS	1

G_VARS		equ	TETR_X
; saved game vars for plr 1
	.align $10
P1_X		.DS	1
P1_Y		.DS	1
P1_OR		.DS	1
P1_DAS		.DS	1	
P1_LEVEL	.DS	1
P1_PHASE	.DS	1
P1_DAR		.DS	1	; down autorepeat timer
P1_LINES	.DS	2	;  2byte 3digit BCD P1_LINES counter
P1_SCORE	.DS	3	; 3byte packed BCD score counter low byte first
P1_HEIGHT	.DS	1

G_VARS1		equ	P1_X
; saved game vars for plr 1
	.align $10
P2_X		.DS	1
P2_Y		.DS	1
P2_OR		.DS	1
P2_DAS		.DS	1
P2_LEVEL	.DS	1
P2_PHASE	.DS	1
P2_DAR		.DS	1	; down autorepeat timer
P2_LINES	.DS	2	;  2byte 3digit BCD P1_LINES counter
P2_SCORE	.DS	3	; 3byte packed BCD score counter low byte first
P2_HEIGHT	.DS	1

G_VARS2		equ	P2_X

;-------------------------------------------------------------------------------
; variables
;-------------------------------------------------------------------------------	
	org $2200
	
; sprites
OAMBASE		.DS	$100

; statistics
STATBASE	.DS	$100
TYPE_COUNTERS	= STATBASE+$f0		; 7 2byte 3digit counters in packed BCD format

; playfield
PLAYFIELD	.DS	$100

PLAYFIELD2	.DS	$100

; sound
SND_BASE	.DS	$100

; highscores
HS_BASE		.DS	$100
HS_DATA		=	HS_BASE
HS_NAMES	=	HS_BASE
HS_POINTS       = 	HS_BASE+$30
HS_POINTSB	=	HS_BASE+$3c
HS_LEVEL        =	HS_BASE+$48	; 1 byte, typeA from $0748, typeB from $074c
HS_INITMARK	=	HS_BASE+$50

; saved bg tiles
BG_SAVE		.DS	$100
	
	org $3000

;-------------------------------------------------------------------------------
; std functions
;-------------------------------------------------------------------------------
	ICL "lib/memset.asm"

;-------------------------------------------------------------------------------
; calls function dependant on GAME_FUNC_INDEX
.proc call_game_func
	ldx GAME_FUNC_INDEX
	lda jt_h,x
	pha
	lda jt_l,x
	pha
	rts
	
jt_h: 
	.DB >(game_init_screen-1), >(game_func1-1), >(game_func2-1), >(game_func3-1)
	.DB >(game_func4-1), >(game_func5-1), >(game_abort_test-1), >(game_pause_mode-1), >(game_loop_to2-1)

jt_l:
	.DB <(game_init_screen-1), <(game_func1-1), <(game_func2-1), <(game_func3-1)
	.DB <(game_func4-1), <(game_func5-1), <(game_abort_test-1), <(game_pause_mode-1), <(game_loop_to2-1)	
.endp

;-------------------------------------------------------------------------------
; calls function dependant on GAME_FUNC_INDEX
.proc call_gamephase_func
	ldx GAME_PHASE
	lda jt_h,x
	pha
	lda jt_l,x
	pha
	rts
	
jt_h: 
	.DB >(phase_func0-1), >(phase_func1-1)

jt_l:
	.DB <(phase_func0-1), <(phase_func1-1)
.endp

;-------------------------------------------------------------------------------
; calls function dependant on GAME_MODE
.proc call_mode_func
	ldx GAME_MODE
	lda jt_h,x
	pha
	lda jt_l,x
	pha
	rts
	
jt_h: 
	.DB >(mode_func_legal-1), >(mode_func_title-1), >(mode_func_type-1),  >(mode_func_level-1)
	.DB >(mode_func_gamedemo-1)

jt_l:
	.DB <(mode_func_legal-1), <(mode_func_title-1), <(mode_func_type-1),  <(mode_func_level-1)
	.DB <(mode_func_gamedemo-1)	
.endp

;-------------------------------------------------------------------------------
; calls function dependant on NMI_FUNC_INDEX
.proc call_nmi_func
	ldx NMI_FUNC_INDEX
	lda jt_h,x
	pha
	lda jt_l,x
	pha
	rts
	
jt_h: 
	.DB >(nmi_func0-1), >(nmi_func1-1)

jt_l:
	.DB <(nmi_func0-1), <(nmi_func1-1)	
.endp

;-------------------------------------------------------------------------------
; dli setup function
.proc dli_setup
	lda #!DLI_ON
	and vNMIEN
	sta NMIEN
	sta vNMIEN
	
	lda #<dli_title
	ldx #>dli_title
	
	sei
	sta VDSLST
	stx VDSLST+1
	cli
	
	lda #DLI_ON
	ora vNMIEN
	sta NMIEN
	sta vNMIEN
	
	rts
.endp	

;-------------------------------------------------------------------------------
; dli function for mode title
.proc dli_title

dli0:
	pha

	lda #<dli1
	sta VDSLST
	lda #>dli1
	sta VDSLST+1
		
	lda #$98
	sta WSYNC
	sta COLPF1
		
	pla
	rti

dli1:
	pha

	lda #<dli2
	sta VDSLST
	lda #>dli2
	sta VDSLST+1
		
	lda PALETTE1_DATA+1
	sta WSYNC
	sta COLPF1
		
	pla
	rti
	
dli2:
	pha

	lda #<dli0
	sta VDSLST
	lda #>dli0
	sta VDSLST+1
		
	lda #>font_title2
	sta WSYNC
	sta CHBASE
		
	pla
	rti	
.endp

;-------------------------------------------------------------------------------
; waits for vblank
; set sprite RAM to $ff
.proc frame_clear_sprite_ram

	jsr frame_func
	
	lda #$ff
	ldx #$01
	ldy #>OAMBASE
	jsr memset_page		; set sprite data to $ff

	rts
.endp
;-------------------------------------------------------------------------------
; arg A - number of frames
.proc Nframe_clear_sprite_ram
	sta COUNTDOWN
loop	jsr frame_clear_sprite_ram
	lda COUNTDOWN
	bne loop
	rts
.endp
	
;-------------------------------------------------------------------------------
; waits for vblank + snd frame
.proc frame_func
;            jsr snd__e000      ; $aa45: 20 00 e0  
	lda RTCLOK+2
@	cmp RTCLOK+2
	beq @-			; wait for VBLANK
	rts
.endp            

;-------------------------------------------------------------------------------
; wait vbl disable/enable rendering
.proc frame_GR_rendering_off
	lda #0
	sta SDMCTL
	jsr frame_func

	rts
.endp
.proc frame_GR_rendering_on
	lda #NARROW_PF | FETCH_DMA | PLAYER_ONELINE
	sta SDMCTL
	jsr frame_func
	
	rts
.endp	

;-------------------------------------------------------------------------------
; called via jump table
; game_func0
.proc game_init_screen
	jsr frame_GR_rendering_off
	jsr nmi_disable
;            lda #$03
;            jsr MMCsetreg1
;            lda #$03
;            jsr MMCsetreg2	; use CHR bank 3 for nametable an sprites
;
	ldx #3
	jsr GR_load_palette	; use color palette 2;

	lda #<GAME_F0_screen
	ldx #>GAME_F0_screen
	jsr GR_copy_data		; load screen data

	lda #<(scr_mem+3*32+3)
	sta TEMP1
	lda #>(scr_mem+3*32+3)	; screen pos for game type ('A' or 'B')
	sta TEMP1+1
	ldy #0
	lda SEL_TYPE
	bne s_typeB		; if (typeA) {
	lda #$0a
	sta (TEMP1),y
	lda #<(scr_mem+4*32+24)
	sta TEMP1
	lda #>(scr_mem+4*32+24)	; screen pos for high score
	sta TEMP1+1
	lda HS_POINTS
	jsr GRwrite_packedBCD
	lda HS_POINTS+1
	jsr GRwrite_packedBCD
	lda HS_POINTS+2
	jsr GRwrite_packedBCD	; write high score  
	jmp s1			; } endif

s_typeB:
	lda #$0b
	sta (TEMP1),y		; write 'B'
	lda #<(scr_mem+4*32+24)
	sta TEMP1
	lda #>(scr_mem+4*32+24)	; screen pos for high score
	sta TEMP1+1
	lda HS_POINTSB
	jsr GRwrite_packedBCD
	lda HS_POINTSB+1
	jsr GRwrite_packedBCD
	lda HS_POINTSB+2
	jsr GRwrite_packedBCD  ; write high score
	ldx #$00
loop1:	lda height_frame_data,x
	inx
	sta TEMP1
	lda height_frame_data,x
	inx
	sta TEMP1+1			; set PPU address from table
	ldy #0
loop2:	lda height_frame_data,x		; read table values
	inx
	cmp #$fe
	beq loop1			; if ($fe read) loop1 new screen address
	cmp #$fd
	beq s_fd			; if ($fd read) exit loop
	sta (TEMP1),y
	iny
	bne loop2		; always jump
;
s_fd:	
	lda #<(scr_mem+24*32+27)
	sta TEMP1
	lda #>(scr_mem+24*32+27)	; screen pos for start height
	sta TEMP1+1
	lda SEL_HEIGHT
	and #$0f
	ldy #0
	sta (TEMP1),y
;; for typeA and typeB
s1:
	jsr nmi_enable
	jsr frame_clear_sprite_ram
	jsr frame_GR_rendering_on
	jsr frame_clear_sprite_ram  ; //TODO 3 frame_funtions?
;            lda #$01           ; $869f: a9 01     
;            sta P1_PHASE            ; $86a1: 85 68     
;            sta P2_PHASE            ; $86a3: 85 88     
;            lda P1_LEVEL            ; $86a5: a5 67     
;            sta $64            ; $86a7: 85 64     
;            lda $87            ; $86a9: a5 87     
;            sta $84            ; $86ab: 85 84     
	inc GAME_FUNC_INDEX	; game_func1

	rts
.endp

;-------------------------------------------------------------------------------
; called via jumptable
; game_func1
.proc game_func1 
	lda #$ef
	ldx #1
	ldy #>PLAYFIELD
	jsr memset_page		; fill page 4 with $ef

	ldx #$0d
	lda #$00
loop1:	sta TYPE_COUNTERS,x
	dex
	bpl loop1		; clear type counters

;            lda #$05           ; $86ef: a9 05     
;            sta $60            ; $86f1: 85 60     
;            sta $80            ; $86f3: 85 80     
	lda #$00           ; $86f5: a9 00     
;            sta $61            ; $86f7: 85 61     
;            sta $81            ; $86f9: 85 81     
;            sta $69            ; $86fb: 85 69     
;            sta $89            ; $86fd: 85 89     
;            sta $65            ; $86ff: 85 65     
;            sta $85            ; $8701: 85 85     
;            sta $bb            ; $8703: 85 bb     
;            sta $bc            ; $8705: 85 bc     
	sta P1_SCORE            ; $8707: 85 73     
	sta P1_SCORE+1            ; $8709: 85 74     
	sta P1_SCORE+2            ; $870b: 85 75     
;            sta $93            ; $870d: 85 93     
;            sta $94            ; $870f: 85 94     
;            sta $95            ; $8711: 85 95     
;            sta P1_LINES            ; $8713: 85 70     
;            sta P1_LINES+1            ; $8715: 85 71     
;            sta $90            ; $8717: 85 90     
;            sta $91            ; $8719: 85 91     
;            sta $a4            ; $871b: 85 a4     
;            sta $d8            ; $871d: 85 d8     
;            sta $d9            ; $871f: 85 d9     
;            sta $da            ; $8721: 85 da     
;            sta $db            ; $8723: 85 db     
;            sta $ba            ; $8725: 85 ba     
;            sta $ce            ; $8727: 85 ce     
;            sta $cf            ; $8729: 85 cf     
;            sta DEMO_COUNTER            ; $872b: 85 d3     
;            sta $d1            ; $872d: 85 d1     
	sta SPAWN_ID
;            lda #$dd           ; $8731: a9 dd     
;            sta $d2            ; $8733: 85 d2     
;            lda #$03           ; $8735: a9 03     
;            sta NMI_FUNC_INDEX   ; use nmi_func3
	lda #$a0           ; $8739: a9 a0     
	sta P1_DAR            ; $873b: 85 6e     
	sta P2_DAR            ; $873d: 85 8e     
	jsr gamedemo_spawn
;            sta $62            ; $8742: 85 62     
;            sta $82            ; $8744: 85 82     
;            jsr incr_tetr_type_counter
;            ldx #RANDOM           ; $8749: a2 17     
;            ldy #$02           ; $874b: a0 02     
;            jsr nextRandom         ; $874d: 20 47 ab  
	jsr gamedemo_spawn
	sta TETR_NEXT
;            sta $a6            ; $8755: 85 a6     
;            lda SEL_TYPE            ; $8757: a5 c1     
;            beq @s_typeA         ; $8759: f0 06     
;            lda #$25           ; $875b: a9 25     
;            sta P1_LINES            ; $875d: 85 70     
;            sta $90            ; $875f: 85 90     
;@s_typeA:   lda #$47           ; $8761: a9 47     
;            sta $a3            ; $8763: 85 a3     
	jsr frame_clear_sprite_ram
	jsr game_init_start_lines
;            ldx SEL_MUSIC
;            lda MUSIC_TABLE,x
;            jsr snd_setMUSIC
	inc GAME_FUNC_INDEX	; next game_func2	
	rts
.endp

;-------------------------------------------------------------------------------
; called via jumptable
; game_func1
.proc game_func2
;            lda #$03
;            jsr MMCsetreg1
;            lda #$03
;            jsr MMCsetreg2     ; CHR page 3 for bkg and sprites
;            lda #$00
;            sta OAM_USED       ; no sprites allocated
;            inc $65            ; $8892: e6 65     
;            inc $85            ; $8894: e6 85     
;            lda $a4            ; $8896: a5 a4     
;            beq @skip1         ; $8898: f0 02     
;            inc $a4            ; $889a: e6 a4     
skip1:	lda JOY1_RAW_NEW            ; $889c: a5 f5     
	and #BUTTON_SELECT
	beq skip2		; if (not BUTTON_SELECT)
	lda PREVIEW_FLAG 
	eor #$01
	sta PREVIEW_FLAG	;      flip bit 0 in PREVIEW_FLAG flag
skip2:	inc GAME_FUNC_INDEX	; continue with game_func3
	rts
.endp

;-------------------------------------------------------------------------------
; called via jumptable
; game_func1
.proc game_func3
;            lda #$05           ; $9cbf: a9 05     
;            sta TEMP2+1            ; $9cc1: 85 a9     
	lda P1_PHASE
	cmp #$00
	beq skip1
	lda N_PLR
	cmp #$01
	beq skip4		; if (1 player) exit to game_func4

;	lda #$04
;	sta TEMP2+1
	lda P2_PHASE
	cmp #$00
	bne skip4
skip1:	lda N_PLR     
	cmp #$01
	beq skip2
;            lda #$09           ; $9cdf: a9 09     
;            sta GAME_FUNC_INDEX            ; $9ce1: 85 a7     
;            rts                ; $9ce3: 60        
;
skip2:	lda #$03
;            sta NMI_FUNC_INDEX            ; $9ce6: 85 bd     
;            lda N_PLR            ; $9ce8: a5 be     
;            cmp #$01           ; $9cea: c9 01     
;            bne @skip3         ; $9cec: d0 03     
;            jsr __a0ee         ; $9cee: 20 ee a0  
skip3:	lda #$01
	sta P1_PHASE
	sta P2_PHASE
;            lda #$ef           ; $9cf7: a9 ef     
;            ldx #$04           ; $9cf9: a2 04     
;            ldy #$05           ; $9cfb: a0 05     
;            jsr memset         ; fill page 4-5 with $ef
;            lda #$00           ; $9d00: a9 00     
;            sta $69            ; $9d02: 85 69     
;            sta $89            ; $9d04: 85 89     

	jsr frame_clear_sprite_ram
	lda #MODE_LEVEL
	sta GAME_MODE
	rts			; return to level selection?

skip4:	inc GAME_FUNC_INDEX	; continue with game_func4
	rts
.endp

;-------------------------------------------------------------------------------
; called via jumptable
; game_func1
.proc game_func4
	jsr plr1_init
;            jsr __81b2         ; $8177: 20 b2 81  
	jsr game_write_tetr         ; $817a: 20 0a 8a  
;            jsr __87ae         ; $817d: 20 ae 87  
	jsr game_tetr_preview
	inc GAME_FUNC_INDEX	; continue with game_func5     
	rts
.endp

;-------------------------------------------------------------------------------
; called via jumptable
; game_func5
; some 2player specific calls
.proc game_func5
;            lda N_PLR
;            cmp #$02
;            bne @skip1         ; if (2 players) {
;            jsr __8792         ; $818c: 20 92 87  
;            jsr __81d9         ; $818f: 20 d9 81  
;            jsr game_write_tetr         ; $8192: 20 0a 8a  
;            jsr __87c8         ; $8195: 20 c8 87 } endif 
skip1:	inc GAME_FUNC_INDEX	; continue with game_abort_test     
	rts
.endp

;-------------------------------------------------------------------------------
; called via jumptable
; test for abort with start+select+option
.proc game_abort_test
	lda JOY1_RAW_ALL
	cmp #BUTTON_START | BUTTON_SELECT | BUTTON_OPTION
	beq skip1		; if ( not (buttons) ) {
	inc GAME_FUNC_INDEX	; continue with game_pause_mode     
	rts			; }        

skip1:	;jsr snd_reset_call ; else {  
	lda #MODE_LEGAL
	sta GAME_MODE		; back to legal screen
	rts
.endp

;-------------------------------------------------------------------------------
; called via jumptable
; handle PAUSE mode
.proc game_pause_mode
	lda GAME_MODE
	cmp #MODE_DEMO
	bne skip1		; if (demo mode) {
	lda JOY1_RAW_NEW
	cmp #BUTTON_START
	bne skip1
	lda #MODE_TITLE
	sta GAME_MODE		;    if (start pressed) set game_mode to title screen
	rts
;            jmp @skip5         ;    ret with next game_func
				; } else {
skip1:
;	lda NMI_FUNC_INDEX
;	cmp #$03
;	bne @skip5         ; if (!nmi_func3) ret with next game_func
	lda JOY1_RAW_NEW
	and #BUTTON_START
	beq skip5
;            bne @skip2         ; //TODO replace with beq @skip5
;            jmp @skip5         ; if (start pressed) ret with next game_func
;
;@skip2:     lda P1_PHASE
;            cmp #$0a
;            bne @skip3         ; //TODO replace with beq @skip5
;            jmp @skip5         ; if ( P1_PHASE == 10 ) ret with next game_func
;
;@skip3:     lda #$05           ; $a3aa: a9 05     
;            sta $068d          ; sound related
;            lda #$00
;            sta NMI_FUNC_INDEX ; use nmi_func0
	jsr frame_func		; to clear JOY1_RAW_NEW
;            lda #%00010110     ; BKG_left, SPR_left, SPR //TODO why toggle BKG off?
;            sta PPUMASK
;            lda #$ff
;            ldx #$02
;            ldy #$02
;            jsr memset
;            
loop1:	lda #14			; loop {
	sta SPR_X
	lda #14
	sta SPR_Y
	lda #$05
	sta SPR_PTR_INDEX
	jsr spr_drawtoMem	; draw sprite 5 ('PAUSE' string) to mem at 112,119
	lda JOY1_RAW_NEW
	cmp #BUTTON_START
	beq skip4
	jsr frame_clear_sprite_ram
	jmp loop1		; } loop until start pressed

skip4:
;     lda #%00011110     ; BKG_left, SPR_left, BKG, SPR
;            sta PPUMASK        ; re enable BKG rendering  
;            lda #$00           ; $a3e4: a9 00     
;            sta $068d          ; sound related
;            sta $69            ; $a3e9: 85 69     
;            lda #$03
;            sta NMI_FUNC_INDEX ; use nmi_func3
skip5:	inc GAME_FUNC_INDEX	; continue with game_func8
	rts
.endp

;-------------------------------------------------------------------------------
; called via jumptable
.proc game_loop_to2
	lda #$02
	sta GAME_FUNC_INDEX ; back to game_func2
	rts
.endp
						
;-------------------------------------------------------------------------------
; write start lines to playfield
; only for typeB
; thread main
; called from game_func1
; TEMP2 - loop counter
.proc game_init_start_lines     
	lda SEL_TYPE
	bne skip1
	beq skip4		; if (typeA) return

skip1:	lda #12
	sta TEMP2
				; outer loop (12..0)     
loop1:	lda TEMP2
;            beq @skip3         ; //TODO remove: checked at loop end
;            lda #20
	sec
	sbc TEMP2
	sta TEMP2+1		; 20-loopcounter (8..19)
;            lda #$00           ; $87f2: a9 00     
;            sta $69            ; $87f4: 85 69     
;            sta $89            ; $87f6: 85 89
;     
	lda #$09
	sta B1			; loop counter loop2 (9..0)
    
loop2:
;	     ldx #RANDOM
;            ldy #$02
;            jsr nextRandom
	lda RANDOM
	and #07
	tay			; index = rnd(0..7)
;            lda LINE_TILES,y   ; load tile value
;            sta $ab            ; $880b: 85 ab     
;            ldx TEMP2+1            ; $880d: a6 a9     
;            lda mul10_table,x       ; load another table value (8..19outer counter)
;            clc                ; $8812: 18        
;            adc $aa            ; $8813: 65 aa     
;            tay                ; $8815: a8        
;            lda $ab            ; $8816: a5 ab     
;            sta PLAYFIELD,y    ; position = loop counter + 10*outer loop counter (80..199), store tile at position
	dec B1
	bpl loop2

skip2:
loop3:
;     ldx #RANDOM
;            ldy #$02
;            jsr nextRandom
	lda RANDOM
	and #$0f
	cmp #10
	bpl loop3		; rnd(0..9)
;            sta $ac            ; $8833: 85 ac     
;            ldx TEMP2+1            ; $8835: a6 a9     
;            lda mul10_table,x       ; $8837: bd d6 96  
;            clc                ; $883a: 18        
;            adc $ac            ; $883b: 65 ac     
;            tay                ; $883d: a8        
;            lda #$ef           ; $883e: a9 ef     
;            sta PLAYFIELD,y    ; position = rnd0..9 + 10*outer loop counter (80..199), store empty tile at position
;                               ; one empty tile per line
;            jsr frame_clear_sprite_ram ; next frame //TODO remove
	dec TEMP2
	bne loop1		; while (TEMP2 > 0)
;     
;@skip3:     ldx #200
;@loop4:     lda PLAYFIELD,x
;            sta PLAYFIELD2,x
;            dex
;            bne @loop4         ; copy PLAYFIELD (1..200) to PLAYFIELD2 (1..200) //TODO used?
	ldx P1_HEIGHT
	lda PF_CLEAR_BYTES,x	; get number of bytes to clear from top of playfield  
	tay
	lda #$7f		; clear value
loop5:	sta PLAYFIELD,y
	dey
;            cpy #$ff
	bpl loop5		; clear top of playfield
;            ldx $99            ; height for 2nd PF //TODO what is $99?
;            lda PF_CLEAR_BYTES,x
;            tay
;            lda #$ef
;@loop6:     sta PLAYFIELD2,y
;            dey
;            cpy #$ff
;            bne @loop6         ; clear top of 2nd PF
skip4:	rts
.endp

;-------------------------------------------------------------------------------
; write preview tetr to sprite mem
.proc game_tetr_preview
	lda PREVIEW_FLAG
	bne skip1		; if (flag set) exit
	lda #25
	sta SPR_X
	lda #14
	sta SPR_Y		; set coordinates
	ldx TETR_NEXT
	lda PREVIEW_SPRITE_TABLE,x 
	sta SPR_PTR_INDEX
	jmp spr_drawtoMem

skip1:	rts
.endp

;-------------------------------------------------------------------------------
; write tetrimino to spr_RAM
.proc game_write_tetr
	lda TETR_X
	clc
	adc #13
	sta B2
;            lda N_PLR
;            cmp #$01
;            beq @skip1		; if (2 players) {
;            lda B2
;            sec
;            sbc #64
;            sta B2		;   B2-=64
;            lda CUR_PLR
;            cmp #$01
;            beq @skip1		;   if (CUR_PLR != 1) {
;            lda B2
;            adc #111		;	B2+=111 } 
;            sta B2		
;				; } endif    
skip1:	clc
	lda TETR_Y
	clc
	adc #7		; *8+47
	sta B1    
	lda TETR_OR       
	asl
	asl
	sta TEMP2
	asl
	adc TEMP2	; *12
	tax
	ldy OAM_USED
	lda #$04
	sta TEMP2+1		; loop counter
loop1:	lda tetrimino_table,x	; load y - offset
	clc
	adc B1			; *8 + B3
	sta OAMBASE,y		; write to sprite mem
	sta B1
	inc OAM_USED
	iny
	inx
	lda tetrimino_table,x	; load tile id
	sta OAMBASE,y		; wite to sprite mem
	inc OAM_USED
	iny
	inx
	lda #$02
	sta OAMBASE,y		; wite spr attribute
	lda B1
	cmp #6
	bcs skip2		; if (B1 < 71) {
	inc OAM_USED
	dey
	lda #$7f
	sta OAMBASE,y		;   write tile id #$ff
	iny
	iny
	lda #$00		;   write spr_x 0
	sta OAMBASE,y
	jmp skip3		;   skip3
				; } endif
skip2:	inc OAM_USED
	iny
	lda tetrimino_table,x	; load x - offset
	clc
	adc B2			; *8 + B2
	sta OAMBASE,y
skip3:	inc OAM_USED
	iny
	inx
	dec TEMP2+1
	bne loop1
	rts
.endp

;-------------------------------------------------------------------------------
; ret A - spawntable entry
.proc gamedemo_spawn
	lda GAME_MODE
	cmp #MODE_DEMO
	bne TETR_spawn     ; if (demo_mode) {
;	ldx DEMO_COUNTER
;	inc DEMO_COUNTER
;	lda DEMO_DATA,x    ; read table value
;            lsr
;            lsr
;            lsr
;            lsr                ; /16
;            and #$07           ; mod 8, bits4-6 -> index (0..7)
;            tax                ; 
;            lda spawn_table,x  ; read from spawn table
;            rts                ; } else TETR_spawn
;
;;-------------------------------------------------------------------------------
;; spawns a new tetrimino
TETR_spawn:
	inc T_COUNT
	lda RANDOM
	clc
	adc T_COUNT
	and #$07		;  random 0..7
	cmp #$07
	beq spawn_invalid	; if (7) ivalid spawn
	tax
	lda spawn_table,x	; get new spwan_id
	cmp SPAWN_ID
	bne spawn_use		; if (new != old) spawn_use
spawn_invalid:     
	lda RANDOM
	and #$07		; random 0..7
	clc
	adc SPAWN_ID		; random 0..25 (max spawn_id=18)

l1:	cmp #$07
	bcc s1
	sec
	sbc #$07
	bpl l1			; modulo 7

s1:	tax			; x = 0..6
	lda spawn_table,x
spawn_use:
	sta SPAWN_ID
	rts
.endp            
            
;-------------------------------------------------------------------------------
; copy data to screen
; thread main
; SRC pointer in AX
; TEMP1 - src, TEMP2 - dst, B1 - addrinc	
.proc GR_copy_data
	sta TEMP1
	stx TEMP1+1		; get src pointer to TEMP1
	ldy #$00		; Y=0
	jmp process_data
	
copy_bytes:
	sta TEMP2+1		; set high byte of dst     
	
	inc TEMP1
	bne @+
	inc TEMP1+1		; inc source pointer
@			
	lda (TEMP1),y		; read next byte from TEMP1 pointer
	sta TEMP2		; set low byte of dst

	inc TEMP1
	bne @+
	inc TEMP1+1		; inc source pointer
@	
	
	lda (TEMP1),y		; read next byte from TEMP1 pointer (bit7 VRAM inc line, bit6 ptr inc off, bit 0..5 byte counter)
	asl			; A *= 2, bit7 to carry, toggles VRAM address increment
	pha			; save A
	lda #32
	bcs skip
	lda #1			; VRAM address increment: right
skip:	sta B1			; set VRAM address increment

	pla			; restore A
	asl			; A *= 2, original bit 6 to carry
	php			; save flags
	ldx #0
	bcc skip2		; if (bit6 of control byte) {
	ldx #01
	inc TEMP1
	bne @+
	inc TEMP1+1		; inc source pointer
@				;   shift read index from control to data byte (not incremented in read loop)
				; } endif

skip2:
	stx B2			; store inc src flag
	plp			; restore flags (flags after 2 asl of original A)
	clc
	bne skip3
	sec			; if lower 6bits of original A clear set carry else clear (0 means write 128bytes)
skip3:	ror			; rotate carry to bit 7
	lsr			; carry is in bit 6 bits 0..5 are equal to original A
	tax			; initialize counter
loop:	
	lda B2
	bne skip4
	inc TEMP1
	bne @+
	inc TEMP1+1		; inc source pointer
@				; if !carry increment pointer
skip4:	lda (TEMP1),y
	sta (TEMP2),y
	clc
	lda B1
	adc TEMP2
	sta TEMP2
	lda #0
	adc TEMP2+1
	sta TEMP2+1		; increment dst pointer by 1 or 32
	dex			; dec loop counter
	bne loop		; read X bytes from TEMP1 ptr carry controls if ptr is incremented, write to TEMP2

	inc TEMP1
	bne @+
	inc TEMP1+1		; inc source pointer
@	

process_data:

	lda (TEMP1),y
	bpl copy_bytes
	rts			; until bit7 set in read byte

;skip5:      
;            cmp #$60
;            bne @skip2         ; if (*TEMP1 == $60)
;            pla
;            sta TEMP1+1
;            pla
;            sta TEMP1
;            ldy #$02           ; TEMP1 = pop; Y=2
;            bne next_address   ; always jump
;
;@skip2:     cmp #$4c
;            bne copy_PPU_bytes ; if (*TEMP1 == $4c)
;            lda TEMP1
;            pha
;            lda TEMP1+1
;            pha                ; push TEMP1 - manipulates return address
;            iny                ; Y = 1
;            lda (TEMP1),y
;            tax                ; X = *(TEMP1+1)
;            iny
;            lda (TEMP1),y      ; A = *(TEMP+2)
;            sta $01
;            stx $00            ; TEMP = AX
;            bcs @loop          ; end while

.endp

;-------------------------------------------------------------------------------
; init GR mode	
.proc GR_init

	ldx #<GRDL
	ldy #>GRDL

	lda RTCLOK+2
@:	cmp RTCLOK+2
	beq @-		; wait 1 VSYNC

	sei		; disable interrupts
	stx SDLSTL	
	sty SDLSTH	; set DLIST
	cli		; enable interrupts

	lda #>font_legal
	sta CHBAS	; set default font

	lda RTCLOK+2
@:	cmp RTCLOK+2
	beq @-		; wait 1 VSYNC

	rts
.endp

;-------------------------------------------------------------------------------
; load color palette
; arg X number of palette	
.proc GR_load_palette
	lda PAL_PTR_LOW,x
	sta TEMP1
	lda PAL_PTR_HIGH,x
	sta TEMP1+1

	ldy #4
l1:	lda (TEMP1),y
	sta COLOR0,y
	dey
	bpl l1
			
	rts
.endp

;-------------------------------------------------------------------------------
; restore BG before sprites are drawn
.proc GR_restoreBG
	ldx #0
	ldy #0
loop:	cpx BGS_USED
	beq ret
	
	lda BG_SAVE,x
	sta TEMP1
	inx
	lda BG_SAVE,x
	sta TEMP1+1
	inx
	
	lda BG_SAVE,x
	sta (TEMP1),y
	inx
	
	bpl loop	
ret:	sty BGS_USED
	rts
.endp

;-------------------------------------------------------------------------------
; update SW sprites on screen
; thread NMI
; //TODO move pointer arithmetik out of nmi code
.proc GR_updateSprites
	jsr GR_restoreBG
	ldx #0
	stx B1_N
loop:	cpx OAM_USED
	beq ret
	
	lda OAMBASE,x		; read y
	asl
	rol B1_N
	asl
	rol B1_N
	asl
	rol B1_N
	asl
	rol B1_N
	asl			; *32
	rol B1_N
	clc
	adc #<scr_mem
	sta TEMP1_N
	lda B1_N
	adc #>scr_mem
	sta TEMP1_N+1
	
	inx
	lda OAMBASE,x		; read index
	
	inx
	;lda OAM_BASE,y		; read attribute
	
	inx
	ldy OAMBASE,x		; read x
	sta B1_N
	lda (TEMP1_N),y
	sta B2_N			; save BG tile
	lda B1_N
	sta (TEMP1_N),y		; write to screen
	sty B1_N
	
	ldy BGS_USED
	lda B2_N
	sta BG_SAVE+2,y		; write BG tile to backup
	lda B1_N
	clc
	adc TEMP1_N
	sta BG_SAVE,y
	lda #0
	sta B1_N			; clear B1 for next loop
	adc TEMP1_N+1
	sta BG_SAVE+1,y		; write scr_adr to backup
	iny
	iny
	iny
	sty BGS_USED		; count used backup storage
	 
	inx
	bpl loop
ret:	rts
.endp            

;-------------------------------------------------------------------------------
; copy highscore data to screen
; main thread
.proc GR_writeHSdata
;            lda N_PLR
;            cmp #$01
;            beq @onePLR
;            jmp @return
;
;@onePLR:
	lda #<SCORE_SCREEN_DATA
	ldx #>SCORE_SCREEN_DATA
	jsr GR_copy_data

	lda #$00
	sta TEMP2+1
	lda SEL_TYPE
	beq skip1
	lda #$04
	sta TEMP2+1		; if (type = A) TEMP2+1=0 else TEMP2+1=4
loop:     
skip1:	lda TEMP2+1
	and #$03		; mod 4
	asl			; *2
	tax			; index = (A mod 4) * 2; (0 2 4 6)
	lda HS_SCRadr_table,x	; table read  
	sta TEMP1  
	lda HS_SCRadr_table+1,x	; read high byte
	sta TEMP1+1  
	lda TEMP2+1
	asl			; *2
	sta TEMP2
	asl			; *4
	clc
	adc TEMP2		; *6
	tay			; index = A * 6 (one table entry has 6 bytes, first entry typeA: 0, typeB: 24)
	ldx #$06		; loop counter
loop2:	lda HS_NAMES,y		; read index to table from RAM
	sty TEMP2
	tay
	lda HS_CHAR_TABLE,y	; read table data
	ldy #0
	sta (TEMP1),y		; write tile
	inc TEMP1
	ldy TEMP2
	iny
	dex
	bne loop2		; write 6 tiles to screen (high score name)

	lda #$7f
	ldy #0
	sta (TEMP1),y		; write ' '
	inc TEMP1

	lda TEMP2+1
	sta TEMP2
	asl			; *2
	clc
	adc TEMP2		; *3
	tax			; index = A * 3 (one table entry has 3 bytes)
	lda HS_POINTS,x
	jsr GRwrite_packedBCD
	inx
	lda HS_POINTS,x
	jsr GRwrite_packedBCD
	inx
	lda HS_POINTS,x
	jsr GRwrite_packedBCD	; write score

	lda #$7f      
	sta (TEMP1),y		; write ' '
	inc TEMP1
	ldx TEMP2+1    
	lda HS_LEVEL,x
	tax
	lda HS_LEVEL_TABLE,x
	jsr GRwrite_packedBCD	; write level  
	inc TEMP2+1
	lda TEMP2+1            ; inc counter
	cmp #$03
	beq ret
	cmp #$07
	beq ret
	jmp loop		; loop until counter=3 (typeA) or counter=7 (typeB)

ret:	rts
.endp

;-------------------------------------------------------------------------------
; write packed BCD
; writes 2 decimal digits coded in high and low 4 bits of A to screen
; arg - A 2digit BCD
; TEMP1 - dest
.proc GRwrite_packedBCD
	ldy #0
	sta TEMP2
	and #$f0
	lsr
	lsr
	lsr
	lsr
	sta (TEMP1),y
	inc TEMP1
	lda TEMP2
	and #$0f
	sta (TEMP1),y
	inc TEMP1
	rts
.endp            
	
;-------------------------------------------------------------------------------
; main function, program entry	
.proc main

	cld
	;sei
	lda #0

	sta SDMCTL		; rendering off
	
	sta TEMP1
	sta TEMP1+1
	ldy #TEMP1+2		; addr of TEMP1 + 2
l1:	sta (TEMP1),y
	iny
	bne l1			; clear remaining zero page after TEMP1 var

	lda #>SND_BASE
	sta TEMP1+1
	sty TEMP1

	sec
	sbc #>OAMBASE
	tax			; x+1 = pages to clear
	tya			; A = 0
clearloop:	
	sta (TEMP1),y
	dey
	bne clearloop
	dec TEMP1+1
	dex
	bpl clearloop		; clear pages SND_BASE down to OAMBASE
	
	lda HS_INITMARK
	cmp #$12
	bne HS_init
	lda HS_INITMARK+1
	cmp #$34
	bne HS_init
	lda HS_INITMARK+2
	cmp #$56
	bne HS_init
	lda HS_INITMARK+3
	cmp #$78
	bne HS_init
	lda HS_INITMARK+4
	cmp #$9a
	bne HS_init		; test if data HS_INITMARK is initialized
	jmp skip_HSinit		; skip initialization  

HS_init:
	ldx #0
l2:	lda HS_INIT_DATA,x
	cmp #$ff
	beq HS_init2
	sta HS_DATA,x
	inx
	bne l2			; copy data from ROM $ad67 to RAM $0700 until end marker $FF is read (80 bytes $700-$749)

HS_init2:
	lda #$12
	sta HS_INITMARK
	lda #$34
	sta HS_INITMARK+1
	lda #$56
	sta HS_INITMARK+2
	lda #$78
	sta HS_INITMARK+3
	lda #$9a
	sta HS_INITMARK+4	; set INITMARK

skip_HSinit:

;            ldy #$00
;            sty HSCROLL
;            sty PPUSCROLL
;            ldy #$00
;            sty VSCROLL
;            sty PPUSCROLL      ; init scroll position to top left
;            lda #$90
;            sta CTRL
;            sta PPUCTRL        ; set PPUCTRL to 10010000  (NMI enabled, background table $1000)
	jsr nmi_init
	jsr GR_init

;            jsr APU_init
;            jsr snd_reset_call         ; //TODO necessary? calls part of APU_init again
;            lda #$c0
;            sta $0100
;            lda #$80
;            sta $0101
;            lda #$35           
;            sta $0103
;            lda #$ac
;            sta $0104          ; variable initializations

	jsr frame_GR_rendering_off
	jsr nmi_disable

	lda #<scr_mem
	sta TEMP1
	lda #>scr_mem
	sta TEMP1+1
	ldx #>SCR_MEMSIZE
	ldy #<SCR_MEMSIZE
	lda #$7F
	jsr memset		; fill screen ram
	
	;lda #$ef
	;ldy #>PLAYFIELD
	;ldx #2
	;jsr memset_page		; fill PLAYFIELD 1 and 2 with $ef //TODO check if necessary done in game_func
	jsr nmi_enable
	jsr frame_clear_sprite_ram
	jsr frame_GR_rendering_on
	jsr frame_clear_sprite_ram
;            lda #$0e           ; $8126: a9 0e     
;            sta $34            ; $8128: 85 34     
	lda #$00
	sta GAME_FUNC_INDEX     
	sta GAME_MODE
	lda #$01
	sta N_PLR
	lda #$00
	sta RTCLOK+1
mainloop:     
	jsr call_mode_func
	cmp GAME_FUNC_INDEX
	bne skip1         ; if (ret_value of mode_func == GAME_FUNC_INDEX)
	jsr frame_clear_sprite_ram ;  frame_clear_sprite ram
skip1:	lda GAME_MODE
;            cmp #MODE_DEMO
;            bne @skip2         ; if (MODE_DEMO) {
;            lda $d2            ; $8148: a5 d2     
;            cmp #$df           ; $814a: c9 df     
;            bne @skip2         ; $814c: d0 0c     
;            lda #$dd           ; $814e: a9 dd     
;            sta $d2            ; $8150: 85 d2     
;            lda #$00           ; $8152: a9 00     
;            sta FRAMECOUNT+1
;            lda #MODE_TITLE
;            sta GAME_MODE      ;  set GAME_MODE to MODE_TITLE
;                               ; } endif     
skip2:
	jmp mainloop
.endp

;-------------------------------------------------------------------------------
; display copyright screeen
; 4.25s(255f) not interruptible
; 4.25s(255f) interruptible with start
; continue with title screen
; ret value A = $FF
.proc mode_func_legal
;            jsr snd_reset_call
	lda #$00
	sta NMI_FUNC_INDEX	; set nmi function for this mode, resets nametable nr and scroll every frame
	jsr frame_GR_rendering_off
	jsr nmi_disable
	
	lda #>font_legal
	sta CHBAS
       
	ldx #0
	jsr GR_load_palette	; use color palette 0

	lda #<LEGAL_SCREEN_DATA
	ldx #>LEGAL_SCREEN_DATA
	jsr GR_copy_data	; load screen data

	jsr nmi_enable
	jsr frame_clear_sprite_ram
	jsr frame_GR_rendering_on
;	jsr frame_clear_sprite_ram ; sprite ram $ff
;            lda #$00
;            ldx #$02
;            ldy #$02
;            jsr memset         ; clear sprite data $00 //TODO why?
;
	lda #$ff		; set counter
	jsr Nframe_clear_sprite_ram         
				; 255 frames of legal screen
	lda #$ff
	sta TEMP2		; init loop counter //TEMP1 used in frame_clear_sprite_ram
loop:	lda JOY1_RAW_NEW
	cmp #BUTTON_START
	beq next_mode		; procede to title screen if start pressed
	jsr frame_clear_sprite_ram
	dec TEMP2
	bne loop		; loop runs 255 iterations interruptible with start button

next_mode:
	inc GAME_MODE
	rts
.endp

;-------------------------------------------------------------------------------
; display title screen
; exit to game type selection with start
; exit to MODE_SETUP_DEMO after timeout (17s-21s NTSC)
.proc mode_func_title
;            jsr snd_reset_call
	lda #$00
	sta NMI_FUNC_INDEX ; set nmi function for this mode, resets nametable nr and scroll every frame
;            sta $d0            ; $8256: 85 d0     
	sta PREVIEW_FLAG	; //TODO init here?
	jsr frame_GR_rendering_off
	jsr nmi_disable
	jsr dli_setup

	lda #>font_title1
	sta CHBAS

	ldx #1
	jsr GR_load_palette	; use color palette 1;

	lda #<TITLE_SCREEN_DATA
	ldx #>TITLE_SCREEN_DATA
	jsr GR_copy_data	; load screen data

	jsr nmi_enable
	jsr frame_clear_sprite_ram
	jsr frame_GR_rendering_on
	jsr frame_clear_sprite_ram

	lda #$00
	sta RTCLOK+1		; reset high byte of frame counter     
;                               ; title screen loop
loop:	jsr frame_clear_sprite_ram
	lda JOY1_RAW_NEW
	cmp #BUTTON_START
	beq skip1
	lda RTCLOK+1
	cmp #$05
	beq skip2
	jmp loop		; end of title screen loop

skip1:	;lda #$02           ; $829f: a9 02     
	;sta sndEFFECT      ; sound related?
	inc GAME_MODE
	rts			; exit to game type selection after start is pressed

skip2:	;lda #$02           ; $82a7: a9 02     
;            sta sndEFFECT      ; sound related?
;            lda #MODE_SETUP_DEMO
	lda #MODE_LEGAL
	sta GAME_MODE
	rts                ; exit to MODE_SETUP_DEMO after about 5*256 frames
.endp

;-------------------------------------------------------------------------------
; game type selection
.proc mode_func_type
	lda #$01			; set nmi function for this mode (write PPUCTRL with nametable 0, write scroll regs with 0)
	sta NMI_FUNC_INDEX
	jsr frame_GR_rendering_off
	jsr nmi_disable

	lda #>font_type
	sta CHBAS

	ldx #2
	jsr GR_load_palette	; use color palette 2;

;            jsr PPU_copy_data
;            DW PALETTE_DATA_MODE1_2_3
;            
	lda #<TYPE_SCREEN_DATA
	ldx #>TYPE_SCREEN_DATA
	jsr GR_copy_data		; load screen data

	jsr nmi_enable
	jsr frame_clear_sprite_ram
	jsr frame_GR_rendering_on
	jsr frame_clear_sprite_ram
;            ldx SEL_MUSIC
;            lda MUSIC_TABLE,x
;            jsr snd_setMUSIC

loop:  
	lda JOY1_RAW_NEW
	cmp #BUTTON_R
	bne skip1		; if (BUTTON_R) {
	lda #TYPE_B
	sta SEL_TYPE
;	lda #$01
;            sta sndEFFECT
	jmp skip2
	
skip1:	;lda JOY1_RAW_NEW	; //TODO reload not necessary
	cmp #BUTTON_L
	bne skip2		; } else if (BUTTON_L) {
	lda #TYPE_A
	sta SEL_TYPE
;            lda #$01
;            sta sndEFFECT
				; } endif  
skip2:	lda JOY1_RAW_NEW	; //TODO remove reload
	cmp #BUTTON_D
	bne skip3		; if (BUTTON_D) {
;	lda #$01
;            sta sndEFFECT
	lda SEL_MUSIC
	cmp #$03
	beq skip4		;   if (SEL_MUSIC != 3) {
	inc SEL_MUSIC
;	ldx SEL_MUSIC
;            lda MUSIC_TABLE,x
;            jsr snd_setMUSIC   ;     set next music} endif
				; } endif (Button_D)
skip3:	lda JOY1_RAW_NEW 
	cmp #BUTTON_U		; if (BUTTON_U) {
	bne skip4
;	lda #$01
;            sta sndEFFECT
	lda SEL_MUSIC
	beq skip4		;   if (SEL_MUSIC != 0)
	dec SEL_MUSIC
;            ldx SEL_MUSIC
;            lda MUSIC_TABLE,x
;            jsr snd_setMUSIC   ;     set prev music} endif
				; } endif (Button_U)
skip4:	lda JOY1_RAW_NEW
	cmp #BUTTON_START
	bne skip5		; if (BUTTON_Start) {
;            lda #$02
;            sta sndEFFECT
	inc GAME_MODE		;   go to level selection
	rts			; } endif

skip5:	lda JOY1_RAW_NEW
	cmp #BUTTON_OPTION	; if (BUTTON_B) {
	bne skip6
;            lda #$02
;            sta sndEFFECT
	lda #$00
	sta RTCLOK+1
	dec GAME_MODE		;   go back to title screen
	rts			; } endif

skip6:
	ldx #8
	lda SEL_TYPE
	beq @+
	ldx #20	
@	stx SPR_X

	lda #7
	sta SPR_Y
	
	lda #$01
	sta SPR_PTR_INDEX
	
	lda RTCLOK+2
	and #$03
	bne skip7		; every 4th frame do {
	lda #$02		;   SPR_PTR_INDEX= 2
	sta SPR_PTR_INDEX  	; } else SPR_PTR_INDEX = 1     
skip7:	jsr spr_drawtoMem
	lda SEL_MUSIC		; A = 0..3
	asl
	clc
	adc #17			; *2+17
	sta SPR_Y
	lda #83
	sta SPR_PTR_INDEX
	lda #13
	sta SPR_X
	lda RTCLOK+2
	and #$03
	bne skip8		; every 4th frame do {
	lda #$02		;   SPR_PTR_INDEX= 2
	sta SPR_PTR_INDEX	; } else SPR_PTR_INDEX = 83     
skip8:	jsr spr_drawtoMem
	jsr frame_clear_sprite_ram
	jmp loop
.endp

;-------------------------------------------------------------------------------
; level selection
; B1 - level height and selection flag
.proc mode_func_level

;            jsr snd_reset_call
	lda #$01
	sta NMI_FUNC_INDEX		; set nmi function for this mode (write PPUCTRL with nametable 0, write scroll regs with 0)
	jsr frame_GR_rendering_off
	jsr nmi_disable

;  
;            jsr PPU_copy_data
;            DW PALETTE_DATA_MODE1_2_3
;
	lda #<LEVEL_SCREEN_DATA
	ldx #>LEVEL_SCREEN_DATA
	jsr GR_copy_data		; load screen data

	ldx COLOR2
	ldy COLOR3
	stx COLOR3
	sty COLOR2			; swap colors in case of type B

	lda SEL_TYPE
	bne skip1
	
	stx COLOR2
	sty COLOR3
					; if (type A) use level_screen_data2
	lda #<LEVEL_SCREEN_DATA2
	ldx #>LEVEL_SCREEN_DATA2
	jsr GR_copy_data

skip1:
	jsr GR_writeHSdata
	jsr nmi_enable
	jsr frame_clear_sprite_ram
	jsr frame_GR_rendering_on
	jsr frame_clear_sprite_ram
	lda #$00
	sta B1			; init level height and selection flag
;            sta B5
loop1:	lda P1_LEVEL
	cmp #10
	bcc skip2		; if (A < 10) skip2
	sec
	sbc #10
	sta P1_LEVEL
	jmp loop1		; LEVEL = LEVEL mod 10
;
skip2:
loop0:
;     lda #$00
;            sta CUR_PLR            ; CUR_PLR = 0 //TODO remove: not used
	lda P1_LEVEL
	sta SEL_LEVEL
	lda P1_HEIGHT
	sta SEL_HEIGHT
	jsr update_sel_sprites
	lda SEL_LEVEL
	sta P1_LEVEL
	lda SEL_HEIGHT
	sta P1_HEIGHT		; save selected values
	lda JOY1_RAW_NEW
	cmp #BUTTON_START
	bne not_start		; if (BUTTON_Start) {
	lda JOY1_RAW_ALL
	cmp #BUTTON_A | BUTTON_START
	bne skip3		;   if (JOY1_RAW_ALL == 144) {
	lda P1_LEVEL
	clc
	adc #10			;     LEVEL += 10
	sta P1_LEVEL		;   } endif
skip3:	lda #$00
	sta GAME_FUNC_INDEX            ; GAME_FUNC_INDEX = 0
;            lda #$02
;            sta sndEFFECT
	inc GAME_MODE       
	rts				; exit to next mode_game } endif 

not_start:
	lda JOY1_RAW_NEW
	cmp #BUTTON_OPTION
	bne not_B			; if (BUTTON_B) {
;            lda #$02
;            sta sndEFFECT
	dec GAME_MODE
	rts				; exit to previous mode_type } endif
;
not_B:
;@loop2:     ldx #RANDOM
;            ldy #$02
;            jsr nextRandom
;            lda RANDOM
;            and #$0f
;            cmp #$0a
;            bpl @loop2         ; get RANDOM < 10 (0..9)
;            sta $7a            ; $7a = rnd(0..9)
;@loop3:     ldx #RANDOM
;            ldy #$02
;            jsr nextRandom
;            lda RANDOM
;            and #$0f
;            cmp #$0a
;            bpl @loop3         ; get RANDOM < 10 (0..9)
;            sta $9a            ; $9a = rnd(0..9)
	jsr frame_clear_sprite_ram
	jmp loop0			; next frame
.endp

;-------------------------------------------------------------------------------
; called during gameplay and demo
; //TODO remove
.proc mode_func_gamedemo
	jsr call_game_func
	rts
.endp  

;-------------------------------------------------------------------------------
; nmi function, called every vblank
.proc nmi
	jsr call_nmi_func
	dec COUNTDOWN		; countdown
	lda COUNTDOWN
	cmp #$ff
	bne skip
	inc COUNTDOWN		; reset counter to 0 in case of underflow
skip:      
	jsr GR_updateSprites
	lda #$00
	sta OAM_USED

;            lda #$00
;            sta HSCROLL
;            sta PPUSCROLL
;            sta VSCROLL
;            sta PPUSCROLL      ; reset scroll position
;            lda #$01
;            sta VBLANK         ; set VBLANK flag
	jsr nmi_handle_input

	jmp XITVBV
.endp

;-------------------------------------------------------------------------------
; enable/disable NMI
.proc nmi_disable
	lda #0
	sta NMIEN
	sta vNMIEN
	sta BGS_USED
	rts
.endp

.proc nmi_enable
	lda #VBI_ON
	ora vNMIEN
	sta NMIEN
	sta vNMIEN
	rts
.endp

;-------------------------------------------------------------------------------
; function 00 called by table_jump_nmi
; entry of dynamic jump
.proc nmi_func0
;            lda CTRL
;            and #$fc           ; nametable 0
;            sta CTRL
;            lda #$00
;            sta HSCROLL
;            sta PPUSCROLL
;            sta VSCROLL
;            sta PPUSCROLL      ; no scrolling
	rts
.endp            

;-------------------------------------------------------------------------------
; function 01 called by table_jump_nmi
; //TODO almost identical to PPU_reset_nametable_scrolling
.proc nmi_func1
;PPU_reset_scrolling:
;            lda CTRL
;            and #$fc           ; nametable 0
;            sta CTRL
;            sta PPUCTRL
;            lda #$00
;            sta HSCROLL
;            sta PPUSCROLL
;            sta VSCROLL
;            sta PPUSCROLL
	rts
.endp	

;-------------------------------------------------------------------------------
; helper function to set vbi vector
.proc nmi_init
	ldy #<nmi
	ldx #>nmi
	lda #07			; 7 for deferred vector
	jmp SETVBV
.endp

;-------------------------------------------------------------------------------
; called from nmi
.proc nmi_handle_input     
	lda GAME_MODE
	cmp #MODE_DEMO
	;beq nmi_handle_input_demo	//TODO
	jsr read_joy_safe  ; if (GAME_MODE != DEMO) read controllers and return
	rts
.endp

;-------------------------------------------------------------------------------
; clear tetrimino orientation $13 is empty tetr
.proc phase_func0
	lda #$13
	sta TETR_OR
	rts
.endp	

.proc phase_func1
	jsr tetr_shift
	jsr tetr_rotate
;	jsr tetr_down
	rts
.endp    
            
;-------------------------------------------------------------------------------
; set playfield, controls and game variables to plr1
; copy some variables
.proc plr1_init
	lda #$01
	sta CUR_PLR
	lda #>PLAYFIELD
	sta PF_PTR+1
	lda JOY1_RAW_NEW
	sta BUTTONS_NEW
	lda JOY1_RAW_ALL
	sta BUTTONS_ALL

	ldx #$f
loop1:	lda G_VARS1,x   
	sta G_VARS,x    
	dex
	bpl loop1

	rts
.endp            

;-------------------------------------------------------------------------------
; read 2controllers and option keys
; thread nmi 
.proc read_joy
	lda #0
	sta JOY1_RAW_NEW
	sta JOY2_RAW_NEW
	
	lda TRIG0
	lsr
	ror JOY1_RAW_NEW
			
	lda CONSOL
	lsr
	ror JOY1_RAW_NEW
	lsr
	ror JOY1_RAW_NEW
	lsr
	ror JOY1_RAW_NEW

	lda PORTA
	tay
	and #$0F
	ora JOY1_RAW_NEW
	eor #$FF
	sta JOY1_RAW_NEW
	
	tya
	lsr
	lsr
	lsr
	lsr
	ora JOY2_RAW_NEW
	eor #$0F
	sta JOY2_RAW_NEW
	
	lda TRIG1
	bne @+
	lda #%00010000
	ora JOY2_RAW_NEW
	sta JOY2_RAW_NEW	
@

	rts
.endp

;-------------------------------------------------------------------------------
; read controller safe, 2 consecutive reads ANDed together
; thread nmi  
.proc read_joy_safe     
	jsr read_joy

	lda JOY1_RAW_NEW
	sta TEMP2+1
	lda JOY2_RAW_NEW
	sta B1_N
	jsr read_joy

	lda JOY1_RAW_NEW
	and TEMP2+1  
	sta JOY1_RAW_NEW
	lda JOY2_RAW_NEW
	and B1_N  
	sta JOY2_RAW_NEW
	ldx #$01
loop:	lda JOY1_RAW_NEW,x
	tay
	eor JOY1_RAW_ALL,x
	and JOY1_RAW_NEW,x
	sta JOY1_RAW_NEW,x
	sty JOY1_RAW_ALL,x          ; joy = (joy eor old) and joy f5-new pressed button, f7-all pressed buttons
	dex
	bpl loop
	rts
.endp

;-------------------------------------------------------------------------------
; read SPR_PTR_INDEX
; draw this sprite of one or multiple tiles to RAM
.proc spr_drawtoMem  
	lda SPR_PTR_INDEX
	asl
	tax			; X = 2*SPR_PTR_INDEX
	lda sprPTR__table,x
	sta TEMP2
	inx
	lda sprPTR__table,x
	sta TEMP2+1		; get PTR to sprite to TEMP2     
	ldx OAM_USED		; get offset to OAMBASE to X
	ldy #$00
loop:	lda (TEMP2),y		; while (*TEMP2 != FF) do {
	cmp #$ff
	beq skip
	clc
	adc SPR_Y  
	sta OAMBASE,x		; write tile y
	inx    
	iny
	lda (TEMP2),y  
	sta OAMBASE,x		; write tile index
	inx      
	iny      
	lda (TEMP2),y  
	sta OAMBASE,x
	inx       
	iny    
	lda (TEMP2),y    
	clc       
	adc SPR_X   
	sta OAMBASE,x		; write tile x
	inx      
	iny      
	stx OAM_USED
	jmp loop		; } end while
skip:	rts
.endp

;-------------------------------------------------------------------------------
.proc tetr_check_valid
	lda TETR_Y
	asl
	sta TEMP2
	asl
	asl
	clc
	adc TEMP2
	adc TETR_X
	sta TEMP2		; y*10+x = PF coord //TODO test use of mul10_table
	lda TETR_OR
	asl
	asl
	sta TEMP2+1
	asl
	clc
	adc TEMP2+1
	tax			; or * 12 = index to tetr_table
	ldy #$00
	lda #$04
	sta B2			; loop counter: check 4 tiles
loop:	lda tetrimino_table,x	; get y offset of tile
	clc
	adc TETR_Y		; add ycoord
	adc #$02		; +2 //TODO remove addition compare with 20 instead
	cmp #22			; if (>=22)    
	bcs false		;   return false
	lda tetrimino_table,x	; get y offset of tile
	asl
	sta B3
	asl
	asl
	clc
	adc B3			; *10 = pf offset of tile
	clc
	adc TEMP2		; add pf coord of tetr
	sta B4
	inx
	inx
	lda tetrimino_table,x	; get x offset of tile
	clc
	adc B4			; ad to pf coord
	tay
	lda (PF_PTR),y		; read playfield value
	cmp #$7f     
	bcc false		; if (!empty) return false     
	lda tetrimino_table,x	; read x offset
	clc       
	adc TETR_X		; add x coord
	cmp #10
	bcs false		; if (tileX >= 10) return false
	inx        
	dec B2
	bne loop		; next tile

	lda #$00
	sta TEMP2		; //TODO remove, use ret value A
	rts			; return true

false:	lda #$ff
	sta TEMP2		; //TODO remove, use ret value A
	rts			; return false
.endp

;-------------------------------------------------------------------------------
; rotate tetrimino
.proc tetr_rotate
	lda TETR_OR
	sta B1			; save old orientation
	clc
	lda TETR_OR
	asl
	tax			; line of rot_table = 2 * orientation
	lda BUTTONS_NEW		; button value
	and #BUTTON_A
;	cmp #BUTTON_A		; //TODO not necessary? and sets zero flag  
	bne skip1		; if (button A) pressed   
	inx			;   next index for clockwise rot
	lda rot_table,x
	sta TETR_OR		;   new orientation ID
	jsr tetr_check_valid	;   test for valid orientation
	bne restoreOR		;   if (not valid) restore orientation
;	lda #$05
;            sta sndEFFECT
	rts			;   return

				; else
skip1:	lda BUTTONS_NEW		; button value
	and #BUTTON_U
;            cmp #BUTTON_B      ; //TODO not necessary?   
	bne ret			; if (button B) !pressed return  
	lda rot_table,x		;  CCW rot
	sta TETR_OR		;  new orientation ID
	jsr tetr_check_valid	;  test for valid orientation
	bne restoreOR		;  if (not valid) restore orientation
;            lda #$05
;            sta sndEFFECT
	rts			;  return

restoreOR:
	lda B1
	sta TETR_OR		; restore tetr orientation

ret:	rts
.endp

;-------------------------------------------------------------------------------
.proc tetr_shift
	lda TETR_X
	sta B1			; save xpos
	lda BUTTONS_ALL    
	and #BUTTON_D
	bne ret			; if (Button_D) return
	lda BUTTONS_NEW     
	and #BUTTON_L | BUTTON_R	; if (L or R JUST pressed) skip1
	bne skip1
      
	lda BUTTONS_ALL
	and #BUTTON_L | BUTTON_R
	beq ret			; if (L or R holding) {
	inc DAS_TIMER		;   inc autoshift timer
	lda DAS_TIMER
	cmp #16     
	bmi ret			;   if (timer < 16) return
	lda #10			;   timer = 10 
	sta DAS_TIMER     
	jmp skip2		; } endif

skip1:	lda #$00    
	sta DAS_TIMER		; timer = 0
skip2:	lda BUTTONS_ALL
	and #BUTTON_R
	beq skip3		; if (!R) skip3
	inc TETR_X		; x++
	jsr tetr_check_valid 
	bne restore		; if (! valid) restore
;	lda #$03
;            sta sndEFFECT
	jmp ret

skip3:	lda BUTTONS_ALL
	and #BUTTON_L
	beq ret
	dec TETR_X
	jsr tetr_check_valid
	bne restore
;	lda #$03
;	sta sndEFFECT
	jmp ret

restore:
	lda B1
	sta TETR_X
	lda #$10
	sta DAS_TIMER
	
ret:	rts
.endp

;-------------------------------------------------------------------------------
; updates sprites for level and lines selection
; B1 - flag: 0 level select, 1 height sel
.proc update_sel_sprites
	lda JOY1_RAW_NEW
	cmp #BUTTON_R
	bne skip2		; if (BUTTON_R) {
;            lda #$01
;            sta sndEFFECT
	lda B1
	bne skip1
	lda SEL_LEVEL
	cmp #9
	beq skip2
	inc SEL_LEVEL
	bne skip2		; always jump
skip1:	lda SEL_HEIGHT
	cmp #5
	beq skip2
	inc SEL_HEIGHT		;   increment level or height dependent on B1 up to maxvalue
				; } endif      
skip2:	lda JOY1_RAW_NEW
	cmp #BUTTON_L
	bne skip4		; if (BUTTON_L) {
;            lda #$01
;            sta sndEFFECT
	lda B1
	bne skip3
	lda SEL_LEVEL
	beq skip4
	dec SEL_LEVEL
	bpl skip4		; always jump
skip3:	lda SEL_HEIGHT
	beq skip4
	dec SEL_HEIGHT		;   decrement level or height dependent on B1 minvalue=0
				; } endif
skip4:	lda JOY1_RAW_NEW
	cmp #BUTTON_D
	bne skip6		; if (BUTTON_D) {
;            lda #$01
;            sta sndEFFECT
	lda B1
	bne skip5
	lda SEL_LEVEL
	cmp #5
	bpl skip6
	clc
	adc #5
	sta SEL_LEVEL
	bpl skip6		; always jump
skip5:	lda SEL_HEIGHT
	cmp #$03
	bpl skip6
	clc
	adc #3
	sta SEL_HEIGHT		;   next level or height row dependent on B1
				; } endif
skip6:	lda JOY1_RAW_NEW
	cmp #BUTTON_U
	bne skip8		; if (BUTTON_U) {
;            lda #$01
;            sta sndEFFECT
	lda B1
	bne skip7
	lda SEL_LEVEL
	cmp #$05
	bmi skip8
	sec
	sbc #5
	sta SEL_LEVEL
	bpl skip8		; always jump
skip7:	lda SEL_HEIGHT
	cmp #$03
	bmi skip8
	sec			; //TODO check remove of sec
	sbc #3
	sta SEL_HEIGHT		;   prev level or height row dependent on B1
				; } endif
skip8:	lda SEL_TYPE
	beq level_spr
	lda JOY1_RAW_NEW
	cmp #BUTTON_A
	bne level_spr		; if (BUTTON_A && typeB) {
;            lda #$01
;            sta sndEFFECT
	lda B1
	eor #$01
	sta B1			;   toggle B1 flag
				; } endif     
level_spr:
	lda B1			; B1 toggles flickering, only active selector flickers
	bne skip10
	lda RTCLOK+2		; if (B1 == 0) {
	and #$03
	beq lines_spr		;   dont draw level_sel_sprite every 4th frame
skip10:	ldx SEL_LEVEL
	lda SPR_SEL_Y_TABLE,x	; get y coord from table
	sta SPR_Y
	lda #$00
	sta SPR_PTR_INDEX	; use sprite 0
;	ldx SEL_LEVEL       ; //TODO: remove reload of X
	lda SPR_SEL_X_TABLE,x	; get x coord from table
	sta SPR_X
;            lda CUR_PLR
;            cmp #$01
;            bne @skip11:       ; if (CUR_PLR == 1) { //TODO remove: never true
;            clc
;            lda SPR_Y
;            adc #80            ;   SPR_Y += 80
;            sta SPR_Y          ; } endif
;@skip11:    
	jsr spr_drawtoMem	; draw level_sel_sprite
;
lines_spr:
	lda SEL_TYPE
	beq ret			; if (typeA) return
	lda B1
	beq skip13		; if (!active line_sel) skip blinking
	lda RTCLOK+2
	and #$03
	beq ret
skip13:	ldx SEL_HEIGHT
	lda SPR_LINE_SEL_Y_TABLE,x
	sta SPR_Y		; y coord
	lda #$00
	sta SPR_PTR_INDEX	; use sprite0
;            ldx SEL_HEIGHT
	lda SPR_LINE_SEL_X_TABLE,x
	sta SPR_X		; x coord
;            lda CUR_PLR
;            cmp #$01
;            bne @skip14:       ; if (CUR_PLR == 1) { //TODO remove: never true
;            clc
;            lda SPR_Y
;            adc #$50           ;   SPR_Y += 80
;            sta SPR_Y          ; } endif
;@skip14::   
	jsr spr_drawtoMem
ret:	rts
.endp

;-------------------------------------------------------------------------------
; static data
;-------------------------------------------------------------------------------	
	ICL "screens/legal_screen.asm"
	ICL "screens/title_screen.asm"
	ICL "screens/type_screen.asm"
	ICL "screens/level_screen.asm"
	ICL "screens/level_screen2.asm"		;//TODO minimize data
	ICL "screens/score_screen.asm"
	ICL "screens/gamef0_screen.asm"

;-------------------------------------------------------------------------------
; screen data for the display of start height 
height_frame_data:
;            .DB 22 f7         ; PPU address
	.DW (scr_mem+22*32+23)
	.DB $60, $61
	.DB $61, $61, $61, $61
	.DB $61, $62
	.DB $fe            ; control byte: new address follows
;            .DB 23 17         ; PPU address
	.DW (scr_mem+23*32+23)
	.DB $63, $11, $0e
	.DB $12, $10, $11, $1d
	.DB $64
	.DB $fe
;            .DB 23 37   ; $86c4: $64, fe 23 37   Data
	.DW (scr_mem+24*32+23)
	.DB $63, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $64
	.DB $fe
;            .DB 23 57
	.DW (scr_mem+25*32+23)
	.DB $65
	.DB $66, $66, $66, $66
	.DB $66, $66, $67
	.DB $fd            ; control byte
;44bytes end of data

; table of chars for name in high score list
; propably 44 entries
HS_CHAR_TABLE:
            ;.hex 24 0a 0b 0c   ; $a08c: 24 0a 0b 0c   Data
	.DB $24, $0a, $0b, $0c
            ;.hex 0d 0e 0f 10   ; $a090: 0d 0e 0f 10   Data
	.DB $0d, $0e, $0f, $10
            ;.hex 11 12 13 14   ; $a094: 11 12 13 14   Data
	.DB $11, $12, $13, $14
            ;.hex 15 16 17 18   ; $a098: 15 16 17 18   Data
	.DB $15, $16, $17, $18
            ;.hex 19 1a 1b 1c   ; $a09c: 19 1a 1b 1c   Data
	.DB $19, $1a, $1b, $1c
            ;.hex 1d 1e 1f 20   ; $a0a0: 1d 1e 1f 20   Data
	.DB $1d, $1e, $1f, $20
            ;.hex 21 22 23 00   ; $a0a4: 21 22 23 00   Data
	.DB $21, $22, $23, $24
            ;.hex 01 02 03 04   ; $a0a8: 01 02 03 04   Data
	.DB $01, $02, $03, $04
            ;.hex 05 06 07 08   ; $a0ac: 05 06 07 08   Data
	.DB $05, $06, $07, $08
            ;.hex 09 25 4f 5e   ; $a0b0: 09 25 4f 5e   Data
	.DB $09, $25, $4f, $5e
            ;.hex 5f 6e 6f ff   ; $a0b4: 5f 6e 6f ff   Data
	.DB $5f, $6e, $6f, $7f
	
; 80 bytes of data copied to page 7 $700-$749 for init of high score table
HS_INIT_DATA:
	.DB $08, $0f, $17, $01
	.DB $12, $04, $0f, $14
	.DB $01, $13, $01, $0e
	.DB $0c, $01, $0e, $03
	.DB $05, $2b, $00, $00
	.DB $00, $00, $00, $00
	.DB $01, $0c, $05, $18
	.DB $2b, $2b, $14, $0f
	.DB $0e, $19, $2b, $2b
	.DB $0e, $09, $0e, $14
	.DB $05, $0e, $00, $00
	.DB $00, $00, $00, $00
	.DB $01, $00, $00, $00
	.DB $75, $00, $00, $50
	.DB $00, $00, $00, $00
	.DB $00, $20, $00, $00
	.DB $10, $00, $00, $05
	.DB $00, $00, $00, $00
	.DB $09, $05, $00, $00
	.DB $09, $05, $00, $00
	.DB $ff            		; $FF marks end of data
; end of data

; table of levels for HS list
; table[i] return packed_bcd(i) for i==0..49
; //TODO shorten table? limit maxlevel 
HS_LEVEL_TABLE:
            .DB $00, $01, $02, $03   ; $a0bc: 00 01 02 03   Data
            .DB $04, $05, $06, $07   ; $a0c0: 04 05 06 07   Data
            .DB $08, $09, $10, $11   ; $a0c4: 08 09 10 11   Data
            .DB $12, $13, $14, $15   ; $a0c8: 12 13 14 15   Data
            .DB $16, $17, $18, $19   ; $a0cc: 16 17 18 19   Data
            .DB $20, $21, $22, $23   ; $a0d0: 20 21 22 23   Data
            .DB $24, $25, $26, $27   ; $a0d4: 24 25 26 27   Data
            .DB $28, $29, $30, $31   ; $a0d8: 28 29 30 31   Data
            .DB $32, $33, $34, $35   ; $a0dc: 32 33 34 35   Data
            .DB $36, $37, $38, $39   ; $a0e0: 36 37 38 39   Data
            .DB $40, $41, $42, $43   ; $a0e4: 40 41 42 43   Data
            .DB $44, $45, $46, $47   ; $a0e8: 44 45 46 47   Data
            .DB $48, $49         ; $a0ec: 48 49         Data
; 50bytes end of table

;-------------------------------------------------------------------------------
; table of screen addresses
; 3 16bit entries
HS_SCRadr_table:
;            .hex 22 89 22 c9   ; 9,20; 9,22
;            .hex 23 09         ; 9,24
	.DW scr_mem+19*32+9, scr_mem+21*32+9, scr_mem+23*32+9
; 6bytes end of table	


PAL_PTR_HIGH:
	.DB >PALETTE0_DATA, >PALETTE1_DATA, >PALETTE2_DATA, >PALETTE3_DATA

PAL_PTR_LOW:
	.DB <PALETTE0_DATA, <PALETTE1_DATA, <PALETTE2_DATA, <PALETTE3_DATA

PALETTE0_DATA:
	.DB $0e, $ac, $3a, $96, $00
PALETTE1_DATA:
	.DB $2c, $c8, $34, $0a, $00
PALETTE2_DATA:
	.DB $0a, $2e, $34, $94, $00	
PALETTE3_DATA:
	.DB $0a, $ae, $84, $98, $00
	
;-------------------------------------------------------------------------------
; returns number of playfield bytes to clear initially for height x 
PF_CLEAR_BYTES:
	.DB 200, 170, 150, 120
	.DB 100, 80
            ;.hex c8 aa 96 78   ; $8876: c8 aa 96 78   Data
            ;.hex 64 50         ; $887a: 64 50         Data
; 6bytes end of data

;-------------------------------------------------------------------------------
; sprite numbers for tetr ids (not all ids are valid spawn ids)
PREVIEW_SPRITE_TABLE:
	.DB $00, $00, $06, $00
	.DB $00, $00, $00, $09
	.DB $08, $00, 11, $07
	.DB $00, $00, 10, $00
	.DB $00, $00, 12
;19bytes end of table

;-------------------------------------------------------------------------------
; Tetrimino rotation
; line number is index to tetrimino table
;                CCW CW
; 38 bytes
rot_table:  .DB $03, $01        ;  Tl  Tr 0 is Tu
            .DB $00, $02        ;  Tu  Td 1 is Tr
            .DB $01, $03
            .DB $02, $00
            .DB $07, $05
            .DB $04, $06
            .DB $05, $07
            .DB $06, $04
            .DB $09, $09
            .DB $08, $08
            .DB $0a, $0a
            .DB $0c, $0c
            .DB $0b, $0b
            .DB $10, $0e
            .DB $0d, $0f
            .DB $0e, $10
            .DB $0f, $0d
            .DB $12, $12         ;  Ih  Ih 17 is Iv
            .DB $11, $11         ;  Iv  Iv 18 is Ih
; 38bytes end of rot_table

;-------------------------------------------------------------------------------
; spawn table
; spawn orientation for every tetrimino type            
spawn_table:
	.DB $02, $07, $08, $0a   ; T J Z O
	.DB $0b, $0e, $12, $02   ; S L I T //TODO do we need last entry?
; end of spawn_table 8bytes
	
;-------------------------------------------------------------------------------
; contains pointers to sprite definitions
sprPTR__table:
	.DW sprPTR0
	.DW sprPTR1
	.DW sprPTR2
	.DS 4
	.DW sprPTR5
	.DW sprPTR6
	.DW sprPTR7
	.DW sprPTR8
	.DW sprPTR9
	.DW sprPTR10
	.DW sprPTR11
	.DW sprPTR12
	.DS 140
	.DW sprPTR83

;-------------------------------------------------------------------------------
; definition of sprites
; 			y_off	index	attribute	x_off
; solid square of 16x16 used for level selection 
sprPTR0:	.DB 	$00,	$fc,	$20,		$00
		.DB	$00,	$fc,	$20,		$01
		.DB	$01,	$fc,	$20,		$00
		.DB	$01,	$fc,	$20,		$01
		.DB	$ff	; end marker

;			y_off	index	attribute	x_off
; triangle right and left with offsetx 3a used for type selection 
sprPTR1:	.DB	$00,	$27,	$00,		$00
		.DB	$00,	$27,	$40,		7
		.DB	$ff	; endMarker

; empty space used for flickering effect
sprPTR2:	.DB	$00,	$7f,	$00,		$00
		.DB	$ff	; endMarker

; string 'PAUSE'            
sprPTR5:            
		.DB 	$00,	$19,	$00,		$00
		.DB	$00,	$0a,	$00,		$01
		.DB	$00,	$1e,	$00,		$02
		.DB	$00,	$1c,	$00,		$03
		.DB	$00,	$0e,	$00,		$04
		.DB	$ff

; 'T' tetrimino            
sprPTR6:
		.DB 	$00,	$58,	$02,		$00
		.DB	$00,	$58,	$02,		$01
		.DB	$00,	$58,	$02,		$02
		.DB	$01,	$58,	$02,		$01
		.DB	$ff
		
; 'S' tetrimino
sprPTR7:
		.DB	$00, 	$59,	$02,		$01
		.DB     $00,	$59,	$02,		$02
		.DB	$01,	$59,	$02,		$00
		.DB     $01,	$59,	$02,		$01
		.DB	$FF

; 'Z' terimino
sprPTR8:            
		.DB	$00, 	$d9,	$02,		$00
		.DB     $00,	$d9,	$02,		$01
		.DB	$01,	$d9,	$02,		$01
		.DB     $01,	$d9,	$02,		$02
		.DB	$FF

; 'J' tetrimino
sprPTR9:
		.DB	$00, 	$59,	$02,		$00
		.DB     $00,	$59,	$02,		$01
		.DB	$00,	$59,	$02,		$02
		.DB     $01,	$59,	$02,		$02
		.DB	$FF

; 'L' tetrimino
sprPTR10:           
		.DB	$00, 	$d9,	$02,		$00
		.DB     $00,	$d9,	$02,		$01
		.DB	$00,	$d9,	$02,		$02
		.DB     $01,	$d9,	$02,		$00
		.DB	$FF

; 'O' tetrimino
sprPTR11:            
		.DB	$00, 	$58,	$02,		$00
		.DB     $00,	$58,	$02,		$01
		.DB	$01,	$58,	$02,		$00
		.DB     $01,	$58,	$02,		$01
		.DB	$FF

; 'I' tetrimino
sprPTR12:            
		.DB	$00, 	$58,	$02,		$00
		.DB     $00,	$58,	$02,		$01
		.DB	$00,	$58,	$02,		$02
		.DB     $00,	$58,	$02,		$03
		.DB	$FF
                                                		
; triangle right and left with offsetx 4a used for music selection 
sprPTR83:	.DB	$00,	$27,	$00,		$00
		.DB	$00,	$27,	$40,		9
		.DB	$ff	; endMarker

;-------------------------------------------------------------------------------
; table of x coords for line selection sprite
; 6 entries                        
SPR_LINE_SEL_X_TABLE:
;            .hex 9c ac bc
;            .hex 9c ac bc
	.DB 19, 21, 23
	.DB 19, 21, 23
; end of table            

;-------------------------------------------------------------------------------
; table of y coords for line selection sprite
; 6 entries            
SPR_LINE_SEL_Y_TABLE:
;            .hex 53 53 53
;            .hex 63 63 63
	.DB 9, 9, 9
	.DB 11, 11, 11
; 6bytes end of table

;-------------------------------------------------------------------------------
; table of x coords for level selection sprite
; 10 entries for level 0..9            
SPR_SEL_X_TABLE:
;            .hex 34 44 54 64 74
;            .hex 34 44 54 64 74
	.DB 6, 8, 10, 12, 14
	.DB 6, 8, 10, 12, 14
; 10bytes end of table

;-------------------------------------------------------------------------------
; table of y coords for level selection sprite
; 10 entries for level 0..9
SPR_SEL_Y_TABLE:
;            .hex 53 53 53 53 53
;            .hex 63 63 63 63 63
	.DB 9, 9, 9, 9, 9
	.DB 11, 11, 11, 11, 11
; 10bytes end of table

;-------------------------------------------------------------------------------
; tetriminos
;                Y0 T0 X0  Y1 T1 X1  Y2 T2 X2  Y3 T3 X3
tetrimino_table:
            .DB $00, $58, $ff,  $00, $58, $00,  $00, $58, $01,  $ff, $58, $00   ; 00: T up
            .DB $ff, $58, $00,  $00, $58, $00,  $00, $58, $01,  $01, $58, $00   ; $01,: T right
            .DB $00, $58, $ff,  $00, $58, $00,  $00, $58, $01,  $01, $58, $00   ; 02: T down (spawn)
            .DB $ff, $58, $00,  $00, $58, $ff,  $00, $58, $00,  $01, $58, $00   ; 03: T left
            .DB $ff, $58, $00,  $00, $58, $00,  $01, $58, $ff,  $01, $58, $00   ; 04: J left
            .DB $ff, $58, $ff,  $00, $58, $ff,  $00, $58, $00,  $00, $58, $01
            .DB $ff, $58, $00,  $ff, $58, $01,  $00, $58, $00,  $01, $58, $00
            .DB $00, $58, $ff,  $00, $58, $00,  $00, $58, $01,  $01, $58, $01
            .DB $00, $59, $ff,  $00, $59, $00,  $01, $59, $00,  $01, $59, $01
            .DB $ff, $59, $01,  $00, $59, $00,  $00, $59, $01,  $01, $59, $00
            .DB $00, $58, $ff,  $00, $58, $00,  $01, $58, $ff,  $01, $58, $00
            .DB $00, $58, $00,  $00, $58, $01,  $01, $58, $ff,  $01, $58, $00
            .DB $ff, $58, $00,  $00, $58, $00,  $00, $58, $01,  $01, $58, $01
            .DB $ff, $59, $00,  $00, $59, $00,  $01, $59, $00,  $01, $59, $01
            .DB $00, $59, $ff,  $00, $59, $00,  $00, $59, $01,  $01, $59, $ff
            .DB $ff, $59, $ff,  $ff, $59, $00,  $00, $59, $00,  $01, $59, $00
            .DB $ff, $59, $01,  $00, $59, $ff,  $00, $59, $00,  $00, $59, $01
            .DB $fe, $58, $00,  $ff, $58, $00,  $00, $58, $00,  $01, $58, $00   ; 17: I up down
            .DB $00, $58, $fe,  $00, $58, $ff,  $00, $58, $00,  $00, $58, $01   ; 18: I left right
            .DB $00, $ff, $00,  $00, $ff, $00,  $00, $ff, $00,  $00, $ff, $00   ; 19: $13 invalid tetrimino
;-------------------------------------------------------------------------------
; end of tetriminos
; 20x12 bytes 240bytes

;-------------------------------------------------------------------------------
; static data with alignment
;-------------------------------------------------------------------------------	

; fonts
.align $400
font_legal:
	INS "font/te_legal.fnt"
font_title1:
	INS "font/te_title1.fnt"
font_title2:
	INS "font/te_title2.fnt"
font_type:
	INS "font/te_type.fnt"			
	
; display list
.align $400
GRDL:
	.DB $70				; 1 x 8 blank scanlines
	.DB $44				; antic mode 4 screen ptr follows text mode 5 colors
	.DW scr_mem	
	.DB $04,$04,$04,$04,$04
	.DB $04,$04,$84,$04,$84,$04
	.DB $84,$04,$04,$04,$04,$04
	.DB $04,$04,$04,$04,$04,$04
	.DB $04,$04,$04,$04		; 28 lines of mode 4
	.DB $41				; wait vbl and jump to start
	.DW GRDL
; 36bytes end of display list
SCR_MEMSIZE = 32*28			; 896bytes SCR RAMsize	

;-------------------------------------------------------------------------------
; RAM data with alignment
;-------------------------------------------------------------------------------	
.align $1000
scr_mem		.DS	SCR_MEMSIZE

;-------------------------------------------------------------------------------
; start vector
;-------------------------------------------------------------------------------
	run main	