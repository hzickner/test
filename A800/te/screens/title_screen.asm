TITLE_SCREEN_DATA:
;            .DB 20 00         ; PPU address $2000 (screen0, line 0)
;	.DB >(scr_mem+0*32), <(scr_mem+0*32)
;	.DB $20			; control byte: VRAM line, ptr inc, 32bytes of data
;	.DB $00, $01, $00
;	.DB $01, $02, $00, $03
;	.DB $03, $02, $02, $03
;	.DB $00, $01, $00, $02
;	.DB $00, $03, $02, $02
;	.DB $00, $04, $03, $03
;	.DB $03, $02, $03, $03
;	.DB $02, $00, $02, $02
;	.DB $03 
;            .DB 20 20         ; PPU address (screen0, line 1)
	.DB >(scr_mem+0*32), <(scr_mem+0*32)
	.DB $20			; control byte: VRAM line, ptr inc, 32bytes of data
	.DB $82, $80, $83, $80
	.DB $82, $82, $80, $80
	.DB $84, $83, $80, $82
	.DB $80, $81, $80, $81
	.DB $80, $82, $82, $83
	.DB $82, $80, $83, $81
	.DB $80, $83, $83, $82
	.DB $82, $82, $80, $80
;            .DB 20 $81,         ; PPU address (screen0, line 2)
	.DB >(scr_mem+1*32), <(scr_mem+1*32)
	.DB $20			; control byte: VRAM line, ptr inc, 32bytes of data
	.DB $82
	.DB $82, $80, $82, $81
	.DB $80, $81, $80, $82
	.DB $80, $82, $82, $83
	.DB $83, $83, $80, $83
	.DB $84, $83, $80, $83
	.DB $82, $80, $80, $83
	.DB $80, $82, $80, $7f
	.DB $84, $83, $83
;            .DB 20 $84,         ; PPU address (screen0, line 3)
	.DB >(scr_mem+2*32), <(scr_mem+2*32)
	.DB $20			; control byte: VRAM line, ptr inc, 32bytes of data
	.DB $81, $82
	.DB $80, $83, $80, $82
	.DB $80, $7f, $82, $82
	.DB $82, $80, $80, $80
	.DB $83, $82, $83, $82
	.DB $80, $81, $80, $7f
	.DB $7f, $82, $82, $80
	.DB $7f, $7f, $7f, $82
	.DB $80, $81
;            .DB 20 $82,         ; PPU address (screen0, line 4)
	.DB >(scr_mem+3*32), <(scr_mem+3*32)
	.DB $20			; control byte: VRAM line, ptr inc, 32bytes of data
	.DB $80, $83, $82
	.DB $82, $80, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $82, $80
	.DB $7f, $80, $7f, $7f
	.DB $80, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $83
	.DB $80
;            .DB 20 $82,         ; PPU address (screen0, line 5)
	.DB >(scr_mem+4*32), <(scr_mem+4*32)
	.DB $20			; control byte: VRAM line, ptr inc, 32bytes of data
	.DB $81, $80, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $82, $83
;            .DB 20 c0         ; PPU address (screen0, line 6)
	.DB >(scr_mem+5*32), <(scr_mem+5*32)
	.DB $20			; control byte: VRAM line, ptr inc, 32bytes of data
	.DB $80
	.DB $7f, $7f, $05, $06
	.DB $07, $08, $09, $07
	.DB $0A, $07, $07, $05
	.DB $06, $07, $08, $09
	.DB $07, $05, $0B, $0C
	.DB $07, $7f, $0d, $0e
	.DB $07, $09, $0f, $10
	.DB $7f, $83, $80
;            .DB 20 e0         ; PPU address (screen0, line 7)
	.DB >(scr_mem+6*32), <(scr_mem+6*32)
	.DB $20			; control byte: VRAM line, ptr inc, 32bytes of data
	.DB $81, $80
	.DB $7f, $05, $11, $07
	.DB $12, $09, $07, $7f
	.DB $0A, $07, $05, $11
	.DB $07, $12, $09, $07
	.DB $05, $07, $13, $07
	.DB $7f, $05, $14, $15
	.DB $09, $7f, $7f, $7f
	.DB $83, $83
;            .DB 21 00         ; PPU address (screen0, line 8)
;            .DB 20
	.DB >(scr_mem+7*32), <(scr_mem+7*32)
	.DB $20			; control byte: VRAM line, ptr inc, 32bytes of data
	.DB $83, $7f, $7f
	.DB $29, $7f, $2a, $7f
	.DB $2b, $2a, $7f, $2c
	.DB $2d, $29, $7f, $2a
	.DB $7f, $2b, $2a, $2e
	.DB $2a, $2f, $2a, $7f
	.DB $2e, $2a, $30, $31
	.DB $7f, $7f, $7f, $83
	.DB $83
;            .DB 21 20         ; PPU address (screen0, line 9)
	.DB >(scr_mem+8*32), <(scr_mem+8*32)
	.DB $20			; control byte: VRAM line, ptr inc, 32bytes of data
	.DB $80, $7f, $7f, $7f
	.DB $7f, $2a, $7f, $7f
	.DB $2a, $32, $33, $7f
	.DB $7f, $7f, $2a, $7f
	.DB $7f, $2a, $2e, $34
	.DB $35, $2a, $7f, $36
	.DB $2a, $37, $38, $7f
	.DB $7f, $83, $80, $83
;            .DB 21 $81,         ; PPU address (screen0, line 10)
	.DB >(scr_mem+9*32), <(scr_mem+9*32)
	.DB $20			; control byte: VRAM line, ptr inc, 32bytes of data
	.DB $81
	.DB $82, $80, $7f, $7f
	.DB $07, $7f, $7f, $07
	.DB $16, $17, $7f, $7f
	.DB $7f, $07, $7f, $7f
	.DB $07, $18, $7f, $7f
	.DB $07, $7f, $19, $15
	.DB $07, $1a, $7f, $7f
	.DB $82, $83, $80
;            .DB 21 $84,         ; PPU address (screen0, line 11)
	.DB >(scr_mem+10*32), <(scr_mem+10*32)
	.DB $20			; control byte: VRAM line, ptr inc, 32bytes of data
	.DB $80, $83
	.DB $7f, $7f, $7f, $07
	.DB $7f, $7f, $07, $7f
	.DB $1b, $1c, $7f, $7f
	.DB $07, $7f, $7f, $07
	.DB $05, $9d, $7f, $07
	.DB $7f, $05, $1e, $07
	.DB $09, $7f, $7f, $7f
	.DB $80, $83
;            .DB 21 $82,         ; PPU address (screen0, line 12)
	.DB >(scr_mem+11*32), <(scr_mem+11*32)
	.DB $20			; control byte: VRAM line, ptr inc, 32bytes of data
	.DB $80, $81, $80
	.DB $7f, $7f, $1f, $7f
	.DB $7f, $1f, $7f, $20
	.DB $1f, $7f, $7f, $1f
	.DB $7f, $7f, $1f, $21
	.DB $22, $7f, $1f, $7f
	.DB $21, $22, $24, $25
	.DB $7f, $7f, $7f, $83
	.DB $81
;            .DB 21 $82,         ; PPU address (screen0, line 13)
	.DB >(scr_mem+12*32), <(scr_mem+12*32)
	.DB $20			; control byte: VRAM line, ptr inc, 32bytes of data
	.DB $80, $80, $7f, $7f
	.DB $7f, $1f, $7f, $7f
	.DB $1f, $20, $1f, $1f
	.DB $7f, $7f, $1f, $7f
	.DB $7f, $1f, $21, $1f
	.DB $26, $1f, $7f, $21
	.DB $1f, $27, $28, $7f
	.DB $7f, $7f, $83, $80
;	      .DB 21 c0         ; PPU address (screen0, line 14)
	.DB >(scr_mem+13*32), <(scr_mem+13*32)
	.DB $20			; control byte: VRAM line, ptr inc, 32bytes of data
	.DB $84
	.DB $83, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $82, $80
;            .DB 21 e0         ; PPU address (screen0, line 15)
	.DB >(scr_mem+14*32), <(scr_mem+14*32)
	.DB $20			; control byte: VRAM line, ptr inc, 32bytes of data
	.DB $82, $80
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $82
	.DB $82, $83
;            .DB 22 00         ; PPU address (screen0, line 16)
	.DB >(scr_mem+15*32), <(scr_mem+15*32)
	.DB $20			; control byte: VRAM line, ptr inc, 32bytes of data
	.DB $81, $80, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $60, $61, $7f, $7f
	.DB $7f, $82, $81, $80
	.DB $80
;            .DB 22 20         ; PPU address (screen0, line 17)
	.DB >(scr_mem+16*32), <(scr_mem+16*32)
	.DB $20			; control byte: VRAM line, ptr inc, 32bytes of data
	.DB $83, $83, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $31, $7f, $32
	.DB $33, $7f, $34, $7f
	.DB $7f, $80, $82, $83
;            .DB 22 $81,         ; PPU address (screen0, line 18)
	.DB >(scr_mem+17*32), <(scr_mem+17*32)
	.DB $20			; control byte: VRAM line, ptr inc, 32bytes of data
	.DB $80
	.DB $82, $83, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $59, $5a, $5b, $5c
	.DB $7f, $5d, $5e, $7f
	.DB $7f, $83, $83
;            .DB 22 $84,         ; PPU address (screen0, line 19)
	.DB >(scr_mem+18*32), <(scr_mem+18*32)
	.DB $20			; control byte: VRAM line, ptr inc, 32bytes of data
	.DB $80, $83
	.DB $80, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $51, $52
	.DB $53, $54, $55, $56
	.DB $57, $58, $7f, $81
	.DB $80, $80
;            .DB 22 $82,         ; PPU address (screen0, line 20)
	.DB >(scr_mem+19*32), <(scr_mem+19*32)
	.DB $20			; control byte: VRAM line, ptr inc, 32bytes of data
	.DB $83, $81, $80
	.DB $7f, $7f, $7f, $7f
	.DB $e2, $e3, $e4, $e5
	.DB $7f, $e4, $e6, $e7
	.DB $e8, $e6, $7f, $7f
	.DB $7f, $09, $0a, $0b
	.DB $0c, $0d, $0e, $0f
	.DB $10, $7f, $80, $81
	.DB $80
;	.DB 22 $82,         ; PPU address (screen0, line 21)
	.DB >(scr_mem+20*32), <(scr_mem+20*32)
	.DB $20			; control byte: VRAM line, ptr inc, 32bytes of data
	.DB $83, $80, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $29, $2a, $2b, $2c
	.DB $2d, $2e, $2f, $30
	.DB $7f, $7f, $83, $82
;            .DB 22 c0         ; PPU address (screen0, line 22)
	.DB >(scr_mem+21*32), <(scr_mem+21*32)
	.DB $20			; control byte: VRAM line, ptr inc, 32bytes of data
	.DB $82
	.DB $80, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $49
	.DB $4a, $4b, $4c, $4d
	.DB $4e, $4f, $50, $7f
	.DB $7f, $80, $83
;            .DB 22 e0         ; PPU address (screen0, line 23)
	.DB >(scr_mem+22*32), <(scr_mem+22*32)
	.DB $20			; control byte: VRAM line, ptr inc, 32bytes of data
	.DB $82, $82
	.DB $80, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $69, $6a
	.DB $6b, $6c, $6d
	.DB $6e, $6f, $70, $7f, $7f
	.DB $81, $80
;            .DB 23 00         ; PPU address (screen0, line 24)
	.DB >(scr_mem+23*32), <(scr_mem+23*32)
	.DB $20			; control byte: VRAM line, ptr inc, 32bytes of data
	.DB $83, $83, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $80
	.DB $83
;            .DB 23 20         ; PPU address (screen0, line 25)
	.DB >(scr_mem+24*32), <(scr_mem+24*32)
	.DB $20			; control byte: VRAM line, ptr inc, 32bytes of data
	.DB $80, $83, $7f, $82
	.DB $81, $80, $7f, $7f
	.DB $7f, $74, $75, $F1
	.DB $F3, $f2, $f3, $7f
	.DB $7f, $f6, $f7, $f8
	.DB $f9, $fa, $fb, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $82, $82, $80
;	.DB 23 $81,         ; PPU address (screen0, line 26)
	.DB >(scr_mem+25*32), <(scr_mem+25*32)
	.DB $20			; control byte: VRAM line, ptr inc, 32bytes of data
	.DB $83
	.DB $83, $7f, $7f, $80
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $83, $7f, $7f
	.DB $7f, $84, $83
;            .DB 23 $84,         ; PPU address (screen0, line 27)
	.DB >(scr_mem+26*32), <(scr_mem+26*32)
	.DB $20			; control byte: VRAM line, ptr inc, 32bytes of data
	.DB $80, $80
	.DB $83, $7f, $7f, $7f
	.DB $82, $83, $7f, $7f
	.DB $7f, $7f, $83, $82
	.DB $82, $83, $7f, $81
	.DB $80, $81, $80, $83
	.DB $7f, $83, $83, $82
	.DB $83, $81, $82, $80
	.DB $82, $80
;            .DB 23 $82,         ; PPU address (screen0, line 28)
	.DB >(scr_mem+27*32), <(scr_mem+27*32)
	.DB $20			; control byte: VRAM line, ptr inc, 32bytes of data
	.DB $84, $83, $81
	.DB $80, $7f, $83, $83
	.DB $82, $80, $82, $81
	.DB $80, $83, $82, $83
	.DB $80, $83, $83, $82
	.DB $80, $82, $83, $81
	.DB $80, $82, $83, $80
	.DB $80, $83, $82, $83
	.DB $82
;            .DB 23 $02,         ; PPU address (screen0, line 29)
;            .DB 20   ; $b60f: $02, 23 $02, 20   Data
;            .DB $02, $00, $00, $02,   ; $b613: $02, $00, $00, $02,   Data
;            .DB $02, $00, $02, $02,   ; $b617: $02, $00, $02, $02,   Data
;            .DB $00, $03, $00, $02,   ; $b61b: $00, $03, $00, $02,   Data
;            .DB $00, $03, $03, $02,   ; $b61f: $00, $03, $03, $02,   Data
;            .DB $03, $00, $01, $02,   ; $b623: $03, $00, $01, $02,   Data
;            .DB $00, $00, $00, $84,   ; $b627: $00, $00, $00, $04,   Data
;            .DB $03, $00, $03, $02,   ; $b62b: $03, $00, $03, $02,   Data
;            .DB $02, $00, $02, $00,   ; $b62f: $02, $00, $02, $00,   Data
;            .DB 23 c0
;            .DB 20
;            .DB aa   ; $b633: 23 c0 20 aa   Data
;            .DB aa aa aa aa   ; $b637: aa aa aa aa   Data
;            .DB aa aa aa ea   ; $b63b: aa aa aa ea   Data
;            .DB fa fa fa fa   ; $b63f: fa fa fa fa   Data
;            .DB fa fa ba a6   ; $b6$01,: fa fa ba a6   Data
;            .DB a5 a5 a5 a5   ; $b647: a5 a5 a5 a5   Data
;            .DB a5 a5 aa 2a   ; $b64b: a5 a5 aa 2a   Data
;            .DB 00 00 00 00   ; $b64f: 00 00 00 00   Data
;            .DB 00 00 aa
;            .DB 23 e0
;            .DB 20
;            .DB a2 00   ; $b657: e0 20 a2 00   Data
;            .DB 00 00 00 $7f,   ; $b65b: 00 00 00 $7f,   Data
;            .DB $7f, aa aa 00   ; $b65f: $7f, aa aa 00   Data
;            .DB 00 00 00 $7f,   ; $b663: 00 00 00 $7f,   Data
;            .DB $7f, aa aa a2   ; $b667: $7f, aa aa a2   Data
;            .DB a7 a5 $02, $02,   ; $b66b: a7 a5 $02, $02,   Data
;            .DB $02, aa 0a 0a   ; $b66f: $02, aa 0a 0a   Data
;            .DB 0a 0a 0a 0a   ; $b673: 0a 0a 0a 0a   Data
;            .DB 0a 0a 
	.DB $ff            ; end of data