	ICL "a800_inc.asm"

;-------------------------------------------------------------------------------
; zero page variables
;-------------------------------------------------------------------------------
	org $0080
TEMP1		.DS	2	

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
	
	org $3000
.proc main

	cld
	;sei
	lda #0

	sta SDMCTL		; rendering off
	
	ldx #TEMP1		; address of TEMP1
	stx TEMP1
	sta TEMP1+1
	ldy #2
l1:	sta (TEMP1),y
	iny
	bne l1			; clear remaining zero page

	ldy #>HS_BASE
	sty TEMP+1
	sta TEMP

	lda SND_BASE
	sec
	sbc OAMBASE
	tax
	lda #0
clearloop:	
	sta (TEMP1),y
	dey
	bne clearloop
	dec TEMP1+1
	dex
	bpl clearloop		; clear pages SND_BASE down to OAMBASE
	
; main program continued
;main3:      ldy #>$0600
;            sty TEMP1+1
;            ldy #<$0600
;            sty TEMP1
;            lda #$00
;clear_loop: sta (TEMP1),y
;            dey
;            bne clear_loop     ; clear page 6 $600..$6FF RAM
;            dec $01
;            bpl clear_loop     ; continue down to page 0
;            lda $0750
;            cmp #$12
;            bne HS_init
;            lda $0751
;            cmp #$34
;            bne HS_init
;            lda $0752
;            cmp #$56
;            bne HS_init
;            lda $0753
;            cmp #$78
;            bne HS_init
;            lda $0754
;            cmp #$9a
;            bne HS_init        ; test if data $750-$754 is initialized
;            jmp skip_d700init  ; skip initialization  
;
;            ldx #$00           ; //TODO dead code?
;  
;HS_init:    lda HS_INIT_DATA,x    ; x is still 0
;            cmp #$ff
;            beq HS_init2
;            sta HS_DATA,x
;            inx
;            jmp HS_init      ; copy data from ROM $ad67 to RAM $0700 until end marker $FF is read (80 bytes $700-$749)
;
;HS_init2:   lda #$12
;            sta $0750
;            lda #$34
;            sta $0751
;            lda #$56
;            sta $0752
;            lda #$78
;            sta $0753
;            lda #$9a
;            sta $0754          ; init $750-$754
;skip_d700init:
;            ldx #$89           
;            stx RANDOM
;            dex
;            stx RANDOM+1       ; random seed $8889
;            ldy #$00
;            sty HSCROLL
;            sty PPUSCROLL
;            ldy #$00
;            sty VSCROLL
;            sty PPUSCROLL      ; init scroll position to top left
;            lda #$90
;            sta CTRL
;            sta PPUCTRL        ; set PPUCTRL to 10010000  (NMI enabled, background table $1000)
;            lda #$06           ; $80d8: a9 06     
;            sta PPUMASK        ; set PPUMASK 110
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
;            jsr frame_PPU_rendering_off         ; $80f7: 20 52 aa  
;            jsr PPU_disableNMI
;            lda #$20
;            jsr PPU_nameFF_attribute00
;            lda #$24
;            jsr PPU_nameFF_attribute00
;            lda #$28
;            jsr PPU_nameFF_attribute00
;            lda #$2c
;            jsr PPU_nameFF_attribute00         ; //TODO check mirroring, not necessary to fill 4 tables
;            lda #$ef
;            ldx #$04
;            ldy #$05
;            jsr memset         ; fill page 4-5 with $ef
;            jsr PPU_enableNMI
;            jsr frame_clear_sprite_ram
;            jsr frame_PPU_rendering_on
;            jsr frame_clear_sprite_ram
;            lda #$0e           ; $8126: a9 0e     
;            sta $34            ; $8128: 85 34     
;            lda #$00
;            sta GAME_FUNC_INDEX            ; $812c: 85 a7     
;            sta GAME_MODE
;            lda #$01
;            sta N_PLR
;            lda #$00           ; $8134: a9 00     
;            sta FRAMECOUNT+1            ; $8136: 85 b2     
;@mainloop:  jsr table_jump_game_mode
;            cmp GAME_FUNC_INDEX            ; $813b: c5 a7     
;            bne @skip1         ; $813d: d0 03     
;            jsr frame_clear_sprite_ram         ; $813f: 20 2f aa  
;@skip1:     lda GAME_MODE
;            cmp #MODE_DEMO
;            bne @skip2         ; if (MODE_DEMO) {
;            lda $d2            ; $8148: a5 d2     
;            cmp #$df           ; $814a: c9 df     
;            bne @skip2         ; $814c: d0 0c     
;            lda #$dd           ; $814e: a9 dd     
;            sta $d2            ; $8150: 85 d2     
;            lda #$00           ; $8152: a9 00     
;            sta FRAMECOUNT+1            ; $8154: 85 b2     
;            lda #MODE_TITLE
;            sta GAME_MODE      ;  set GAME_MODE to MODE_TITLE
;                               ; } endif     
;@skip2:     jmp @mainloop

loop:
	jmp loop
.endp

	run main	