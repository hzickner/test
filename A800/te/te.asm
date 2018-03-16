	ICL "a800_inc.asm"
	ICL "te_constants.asm"

;-------------------------------------------------------------------------------
; zero page variables
;-------------------------------------------------------------------------------
	org $0080
TEMP1		.DS	2
TEMP2		.DS	2
B1		.DS	1
COUNTDOWN	.DS	1
GAME_FUNC_INDEX	.DS	1
GAME_MODE	.DS	1
JOY1_RAW	.DS	1
N_PLR		.DS	1
NMI_DIS		.DS	1
NMI_FUNC_INDEX	.DS	1
OAM_USED	.DS	1

;-------------------------------------------------------------------------------
; variables
;-------------------------------------------------------------------------------	
	org $2200
	
; sprites
OAMBASE		.DS	$100

; statistics
STATBASE	.DS	$100

; playfield
PLAYFIELD	.DS	$100

PLAYFIELD2	.DS	$100

; sound
SND_BASE	.DS	$100

; highscores
HS_BASE		.DS	$100
HS_DATA		=	HS_BASE
HS_INITMARK	=	HS_BASE+$50
	
	org $3000

;-------------------------------------------------------------------------------
; std functions
;-------------------------------------------------------------------------------
	ICL "lib/memset.asm"

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
	.DB >(mode_func_legal-1)

jt_l:
	.DB <(mode_func_legal-1)	
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
	.DB >(nmi_func0-1)

jt_l:
	.DB <(nmi_func0-1)	
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
	lda #NARROW_PF | PLAYER_DMA | MISSILE_DMA | FETCH_DMA | PLAYER_ONELINE
	sta SDMCTL
	jsr frame_func
	
	rts
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

	lda #>font1
	sta CHBAS	; set default font

	lda RTCLOK+2
@:	cmp RTCLOK+2
	beq @-		; wait 1 VSYNC

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
; //TODO set mode legal charset
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
	
	lda #$ef
	ldy #>PLAYFIELD
	ldx #2
	jsr memset_page		; fill PLAYFIELD 1 and 2 with $ef
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
;            
;            jsr PPU_copy_data
;            DW PALETTE_DATA_FUNC_LEGAL
;
;            jsr PPU_copy_data
;            DW LEGAL_SCREEN_DATA
;
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
loop:	lda JOY1_RAW
	cmp #BUTTON_START
	beq next_mode     ; procede to title screen if start pressed
	jsr frame_clear_sprite_ram
	dec TEMP2
	bne loop          ; loop runs 255 iterations interruptible with start button

next_mode:
	inc GAME_MODE
	rts
.endp

;-------------------------------------------------------------------------------
; nmi function, called every vblank
.proc nmi
	lda NMI_DIS
	bne exit		; check if nmi is disabled
	
	lda #$00
	sta OAM_USED
	jsr call_nmi_func
	dec COUNTDOWN		; countdown
	lda COUNTDOWN
	cmp #$ff
	bne skip
	inc COUNTDOWN		; reset counter to 0 in case of underflow
skip:      
;	jsr PPU_updateSprites

;            lda #$00
;            sta HSCROLL
;            sta PPUSCROLL
;            sta VSCROLL
;            sta PPUSCROLL      ; reset scroll position
;            lda #$01
;            sta VBLANK         ; set VBLANK flag
;            jsr nmi_handle_input
exit:
	jmp XITVBV
.endp

;-------------------------------------------------------------------------------
; enable/disable NMI
.proc nmi_disable
	lda #$FF
	sta NMI_DIS
	rts
.endp

.proc nmi_enable
	lda #00
	sta NMI_DIS
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
; helper function to set vbi vector
.proc nmi_init
	ldy #<nmi
	ldx #>nmi
	lda #07			; 7 for deferred vector
	jmp SETVBV
.endp

;-------------------------------------------------------------------------------
; static data
;-------------------------------------------------------------------------------	

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

;-------------------------------------------------------------------------------
; static data with alignment
;-------------------------------------------------------------------------------	

; fonts
.align $400
font1:
font_legal:
	INS "font/blue.fnt"
	
; display list
.align $400
GRDL:
	.DB $70				; 1 x 8 blank scanlines
	.DB $44				; antic mode 4 screen ptr follows text mode 5 colors
	.DW scr_mem	
	.DB $04,$04,$04,$04,$04
	.DB $04,$04,$04,$04,$04,$04
	.DB $04,$04,$04,$04,$04,$04
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