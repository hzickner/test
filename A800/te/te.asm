	ICL "a800_inc.asm"
	ICL "te_constants.asm"

;-------------------------------------------------------------------------------
; zero page variables
;-------------------------------------------------------------------------------
	org $0080
TEMP1		.DS	2
TEMP2		.DS	2
B1		.DS	1
B2		.DS	1
COUNTDOWN	.DS	1
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
PREVIEW_FLAG	.DS	1

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
	.DB >(mode_func_legal-1), >(mode_func_title-1), >(mode_func_type-1)

jt_l:
	.DB <(mode_func_legal-1), <(mode_func_title-1), <(mode_func_type-1)	
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
; copy data to screen
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
	lda b1
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
;            lda #$00
;            ldx #$02
;            ldy #$02
;            jsr memset         ; clear sprite data //TODO why?
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
;            inc $8000          ; $82d1: ee 00 80  ; ROM write
;            lda #%10000        ; mirrorring: one screen; PRG: 32K $8000 siwitchable at $C000; CHR: switch 2 4K banks
;            jsr MMCsetreg0
	lda #$01			; set nmi function for this mode (write PPUCTRL with nametable 0, write scroll regs with 0)
	sta NMI_FUNC_INDEX
	jsr frame_GR_rendering_off
	jsr nmi_disable

	lda #>font_type
	sta CHBAS

;            jsr PPU_copy_data
;            DW PALETTE_DATA_MODE1_2_3
;            
	lda #<TYPE_SCREEN_DATA
	ldx #>TYPE_SCREEN_DATA
	jsr GR_copy_data		; load screen data

;
;            lda #$00
;            jsr MMCsetreg1     ; CHR0 bank
;            lda #$00
;            jsr MMCsetreg2     ; CHR1 bank
	jsr nmi_enable
	jsr frame_clear_sprite_ram
	jsr frame_GR_rendering_on
	jsr frame_clear_sprite_ram
;            ldx SEL_MUSIC
;            lda MUSIC_TABLE,x
;            jsr snd_setMUSIC

loop:  
;	     lda #$ff
;            ldx #$02
;            ldy #$02
;            jsr memset		;// TODO why?
;            lda JOY1_RAW_NEW
;            cmp #BUTTON_R
;            bne skip1          ; if (BUTTON_R) {
;            lda #TYPE_B
;            sta SEL_TYPE
;            lda #$01
;            sta sndEFFECT
;            jmp skip2
;
;skip1:      lda JOY1_RAW_NEW
;            cmp #BUTTON_L
;            bne skip2          ; } else if (BUTTON_L) {
;            lda #TYPE_A
;            sta SEL_TYPE
;            lda #$01
;            sta sndEFFECT
;                               ; } endif  
;skip2:      lda JOY1_RAW_NEW
;            cmp #BUTTON_D
;            bne skip3          ; if (BUTTON_D) {
;            lda #$01
;            sta sndEFFECT
;            lda SEL_MUSIC
;            cmp #$03
;            beq skip4          ;   if (SEL_MUSIC != 3) {
;            inc SEL_MUSIC
;            ldx SEL_MUSIC
;            lda MUSIC_TABLE,x
;            jsr snd_setMUSIC   ;     set next music} endif
;			       ; } endif (Button_D)
;skip3:      lda JOY1_RAW_NEW 
;            cmp #BUTTON_U      ; if (BUTTON_U) {
;            bne skip4
;            lda #$01
;            sta sndEFFECT
;            lda SEL_MUSIC
;            beq skip4          ;   if (SEL_MUSIC != 0)
;            dec SEL_MUSIC
;            ldx SEL_MUSIC
;            lda MUSIC_TABLE,x
;            jsr snd_setMUSIC   ;     set prev music} endif
;                               ; } endif (Button_U)
skip4:	lda JOY1_RAW_NEW
	cmp #BUTTON_START
	bne skip5		; if (BUTTON_Start) {
;            lda #$02
;            sta sndEFFECT
;            inc GAME_MODE      ;   go to level selection //TODO
	lda MODE_LEGAL
	sta GAME_MODE
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
;
skip6:	ldy #$00
;            lda SEL_TYPE
;            asl
;            sta TEMP2
;            asl
;            adc TEMP2
;            asl
;            asl
;            asl
;            asl                ; A *= 96 (A = 0 or 96) //TODO reduce to conditional assign
;            clc
;            adc #63            ; +=63
;            sta SPR_X          ; SPR_X = 63 or 159
;            lda #63
;            sta SPR_Y
;            lda #$01
;            sta SPR_PTR_INDEX
;            lda FRAMECOUNT
;            and #$03
;            bne @skip7         ; every 4th frame do {
;            lda #$02           ;   SPR_PTR_INDEX= 2
;            sta SPR_PTR_INDEX  ; } else SPR_PTR_INDEX = 1     
;@skip7:     jsr spr_drawtoMem
;            lda SEL_MUSIC      ; A = 0..3
;            asl
;            asl
;            asl
;            asl
;            clc
;            adc #143           ; *16+143
;            sta SPR_Y
;            lda #$53           ; 83
;            sta SPR_PTR_INDEX
;            lda #103
;            sta SPR_X
;            lda FRAMECOUNT
;            and #$03
;            bne @skip8         ; every 4th frame do {
;            lda #$02           ;   SPR_PTR_INDEX= 2
;            sta SPR_PTR_INDEX  ; } else SPR_PTR_INDEX = 83     
;@skip8:     jsr spr_drawtoMem
	jsr frame_clear_sprite_ram
	jmp loop
.endp

;-------------------------------------------------------------------------------
; nmi function, called every vblank
.proc nmi
	
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
	jsr nmi_handle_input

	jmp XITVBV
.endp

;-------------------------------------------------------------------------------
; enable/disable NMI
.proc nmi_disable
	lda #0
	sta NMIEN
	sta vNMIEN
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
; read 2controllers and option keys 
.proc read_joy
	lda #0
	sta JOY1_RAW_NEW
	sta JOY2_RAW_NEW
	
	lda TRIG0
	eor #$FF
	lsr
	ror JOY1_RAW_NEW
			
	lda TRIG1
	eor #$FF
	lsr
	ror JOY2_RAW_NEW

	lda CONSOL
	eor #$FF
	lsr
	ror JOY1_RAW_NEW
	lsr
	ror JOY1_RAW_NEW
	lsr
	ror JOY1_RAW_NEW

	clc
	ror JOY2_RAW_NEW
	ror JOY2_RAW_NEW
	ror JOY2_RAW_NEW

	lda PORTA
	eor #$FF
	tay
	and #$0F
	ora JOY1_RAW_NEW
	sta JOY1_RAW_NEW
	
	tya
	lsr
	lsr
	lsr
	lsr
	ora JOY2_RAW_NEW
	sta JOY2_RAW_NEW
	
	rts
.endp

;-------------------------------------------------------------------------------
; read controller safe, 2 consecutive reads ANDed together  
.proc read_joy_safe     
	jsr read_joy
;            jsr read_joy2
	lda JOY1_RAW_NEW
	sta TEMP2+1
	lda JOY2_RAW_NEW
	sta $aa  
	jsr read_joy
;            jsr read_joy2
	lda JOY1_RAW_NEW
	and TEMP2+1  
	sta JOY1_RAW_NEW
	lda JOY2_RAW_NEW
	and $aa  
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
; static data
;-------------------------------------------------------------------------------	
	ICL "screens/legal_screen.asm"
	ICL "screens/title_screen.asm"
	ICL "screens/type_screen.asm"
	
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

PAL_PTR_HIGH:
	.DB >PALETTE0_DATA, >PALETTE1_DATA

PAL_PTR_LOW:
	.DB <PALETTE0_DATA, <PALETTE1_DATA

PALETTE0_DATA:
	.DB $0e, $ac, $3a, $96, $00
PALETTE1_DATA:
	.DB $2c, $c8, $34, $0a, $00	

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