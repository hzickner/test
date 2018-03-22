LEVEL_SCREEN_DATA:
;            .DB 20 00
;             20
;            .DB $2c,   ; $badb: 20 00 20 $2c,   Data
;            .DB $2b, $2c, $2b, $2b,   ; $badf: $2b, $2c, $2b, $2b,   Data
;            .DB $28, $2b, $29, $28,   ; $bae3: $28, $2b, $29, $28,   Data
;            .DB $2b, $2b, $2b, $28,   ; $bae7: $2b, $2b, $2b, $28,   Data
;            .DB $2a, $2b, $2a, $2b,   ; $baeb: $2a, $2b, $2a, $2b,   Data
;            .DB $2a, $28, $2b, $28,   ; $baef: $2a, $28, $2b, $28,   Data
;            .DB $2a, $2a, $2a, $28,   ; $baf3: $2a, $2a, $2a, $28,   Data
;            .DB $29, $28, $2b, $2b,   ; $baf7: $29, $28, $2b, $2b,   Data
;            .DB $2a, $2a, $2b,
;            .DB 20 20
	.DB >(scr_mem+0*32), <(scr_mem+0*32)
	.DB $20			; control byte: VRAM line, ptr inc, $32,bytes of data
	.DB $2a, $28
	.DB $2a, $28, $2b, $2a
	.DB $2b, $2b, $29, $28
	.DB $2b, $2a, $2a, $28
	.DB $2a, $28, $2a, $28
	.DB $2a, $2a, $28, $29
	.DB $2a, $28, $2a, $28
	.DB $29, $28, $2a, $2a
	.DB $28, $28
;            .DB 20 $29,   ; $bb1f: $28, $28, 20 $29,   Data
	.DB >(scr_mem+1*32), <(scr_mem+1*32)
	.DB $20			; control byte: VRAM line, ptr inc, $32,bytes of data
	.DB $2a, $2a, $2a
	.DB $28, $2a, $28, $28
	.DB $28, $28, $2a, $28
	.DB $38, $39, $39, $39
	.DB $39, $39, $39, $39
	.DB $39, $3a, $28, $2a
	.DB $2a, $2a, $28, $28
	.DB $2a, $2a, $2b, $2c
	.DB $2b
;            .DB 20 $2c,
	.DB >(scr_mem+2*32), <(scr_mem+2*32)
	.DB $20			; control byte: VRAM line, ptr inc, $32,bytes of data
	.DB $2a, $2b, $2b, $38
	.DB $39, $39, $39, $39
	.DB $39, $39, $39, $3b
	.DB $7f, $0b, $24, $1d
	.DB $22, $19, $0e, $7f
	.DB $3c, $39, $39, $39
	.DB $39, $39, $39, $39
	.DB $3a, $28, $2a, $28
;            .DB 20 $2a,
	.DB >(scr_mem+3*32), <(scr_mem+3*32)
	.DB $20			; control byte: VRAM line, ptr inc, $32,bytes of data
	.DB $2b
	.DB $2b, $2b, $3b, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $3d, $3e
	.DB $3e, $3e, $3e, $3e
	.DB $3e, $3e, $3e, $3f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $3c
	.DB $29, $2a, $28
;            .DB 20 $2a,
	.DB >(scr_mem+4*32), <(scr_mem+4*32)
	.DB $20			; control byte: VRAM line, ptr inc, $32,bytes of data
	.DB $2b, $28
	.DB $2b, $3b, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $3c, $28
	.DB $2a, $2b
;            .DB 20 c0   ; $bbab: $2a, $2b, 20 c0   Data
	.DB >(scr_mem+5*32), <(scr_mem+5*32)
	.DB $20			; control byte: VRAM line, ptr inc, $32,bytes of data
	.DB $2a, $28, $28
	.DB $3b, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $3c, $2c, $2b
	.DB $2b
;            .DB 20 e0
	.DB >(scr_mem+6*32), <(scr_mem+6*32)
	.DB $20			; control byte: VRAM line, ptr inc, $32,bytes of data
	.DB $29, $2a, $28, $3b
	.DB $7f, $7f, $7f, $7f
	.DB $44, $45, $45, $45
	.DB $45, $45, $46, $7f
	.DB $7f, $7f, $7f, $44
	.DB $45, $45, $45, $45
	.DB $45, $45, $46, $7f
	.DB $3c, $2a, $28, $28
;            .DB 21 00
	.DB >(scr_mem+7*32), <(scr_mem+7*32)
	.DB $20			; control byte: VRAM line, ptr inc, $32,bytes of data
	.DB $28
	.DB $2a, $2b, $3b, $7f
	.DB $7f, $7f, $7f, $47
	.DB $15, $0e, $1f, $0e
	.DB $15, $48, $7f, $7f
	.DB $7f, $7f, $47, $11
	.DB $0e, $12, $10, $11
	.DB $1d, $48, $7f, $3c
	.DB $2a, $2a, $2b
;            .DB 21 20
	.DB >(scr_mem+8*32), <(scr_mem+8*32)
	.DB $20			; control byte: VRAM line, ptr inc, $32,bytes of data
	.DB $2c, $2b
	.DB $2b, $3b, $7f, $7f
	.DB $7f, $7f, $49, $4a
	.DB $4a, $4a, $4a, $4a
	.DB $4b, $7f, $7f, $7f
	.DB $7f, $49, $4a, $4a
	.DB $4a, $4a, $4a, $4a
	.DB $4b, $7f, $3c, $2b
	.DB $2b, $28
;            .DB 21 $29,   ; $bc37: $2b, $28, 21 $29,   Data
	.DB >(scr_mem+9*32), <(scr_mem+9*32)
	.DB $20			; control byte: VRAM line, ptr inc, $32,bytes of data
	.DB $2a, $28, $28
	.DB $3b, $7f, $7f, $41
	.DB $2e, $50, $2e, $50
	.DB $2e, $50, $2e, $50
	.DB $2e, $42, $7f, $7f
	.DB $41, $2e, $50, $2e
	.DB $50, $2e, $42, $7f
	.DB $7f, $3c, $2b, $2a
	.DB $2b
;            .DB 21 $2c,
	.DB >(scr_mem+10*32), <(scr_mem+10*32)
	.DB $20			; control byte: VRAM line, ptr inc, $32,bytes of data
	.DB $2a, $2a, $2b, $3b
	.DB $7f, $7f, $40, $00
	.DB $40, $01, $40, $02
	.DB $40, $03, $40, $04
	.DB $40, $7f, $7f, $40
	.DB $00, $40, $01, $40
	.DB $02, $40, $7f, $7f
	.DB $3c, $2b, $2b, $28
;            .DB 21 $2a,
	.DB >(scr_mem+11*32), <(scr_mem+11*32)
	.DB $20			; control byte: VRAM line, ptr inc, $32,bytes of data
	.DB $2b
	.DB $2b, $28, $3b, $7f
	.DB $7f, $4c, $2e, $4d
	.DB $2e, $4d, $2e, $4d
	.DB $2e, $4d, $2e, $4e
	.DB $7f, $7f, $4c, $2e
	.DB $4d, $2e, $4d, $2e
	.DB $4e, $7f, $7f, $3c
	.DB $28, $2b, $2a
;            .DB 21 $2a,
	.DB >(scr_mem+12*32), <(scr_mem+12*32)
	.DB $20			; control byte: VRAM line, ptr inc, $32,bytes of data
	.DB $2b, $2a
	.DB $2b, $3b, $7f, $7f
	.DB $40, $05, $40, $06
	.DB $40, $07, $40, $08
	.DB $40, $09, $40, $7f
	.DB $7f, $40, $03, $40
	.DB $04, $40, $05, $40
	.DB $7f, $7f, $3c, $2b
	.DB $2a, $28
;            .DB 21 c0   ; $bcc3: $2a, $28, 21 c0   Data
	.DB >(scr_mem+13*32), <(scr_mem+13*32)
	.DB $20			; control byte: VRAM line, ptr inc, $32,bytes of data
	.DB $2b, $2b, $28
	.DB $3b, $7f, $7f, $2d
	.DB $2e, $51, $2e, $51
	.DB $2e, $51, $2e, $51
	.DB $2e, $2f, $7f, $7f
	.DB $2d, $2e, $51, $2e
	.DB $51, $2e, $2f, $7f
	.DB $7f, $3c, $2a, $2a
	.DB $28
;            .DB 21 e0
	.DB >(scr_mem+14*32), <(scr_mem+14*32)
	.DB $20			; control byte: VRAM line, ptr inc, $32,bytes of data
	.DB $28, $2b, $2a, $3b
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $3c, $29, $2a, $28
;            .DB 22 00
	.DB >(scr_mem+15*32), <(scr_mem+15*32)
	.DB $20			; control byte: VRAM line, ptr inc, $32,bytes of data
	.DB $2b
	.DB $2a, $28, $3b, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $3c
	.DB $28, $2a, $2b
;            .DB 22 20
	.DB >(scr_mem+16*32), <(scr_mem+16*32)
	.DB $20			; control byte: VRAM line, ptr inc, $32,bytes of data
	.DB $2a, $2a
	.DB $28, $3b, $7f, $41
	.DB $2e, $2e, $2e, $2e
	.DB $2e, $2e, $2e, $2e
	.DB $2e, $2e, $2e, $2e
	.DB $2e, $2e, $2e, $2e
	.DB $2e, $2e, $2e, $2e
	.DB $42, $7f, $3c, $2c
	.DB $2b, $2b
;            .DB 22 $29,   ; $bd4f: $2b, $2b, 22 $29,   Data
	.DB >(scr_mem+17*32), <(scr_mem+17*32)
	.DB $20			; control byte: VRAM line, ptr inc, $32,bytes of data
	.DB $2b, $2a, $2b
	.DB $3b, $7f, $40, $7f
	.DB $7f, $7f, $7f, $17
	.DB $0a, $16, $0e, $7f
	.DB $7f, $1c, $0c, $18
	.DB $1b, $0e, $7f, $7f
	.DB $15, $1f, $7f, $40
	.DB $7f, $3c, $2a, $28
	.DB $28
;            .DB 22 $2c,
	.DB >(scr_mem+18*32), <(scr_mem+18*32)
	.DB $20			; control byte: VRAM line, ptr inc, $32,bytes of data
	.DB $2b, $2b, $2b, $3b
	.DB $7f, $4c, $2e, $2e
	.DB $2e, $2e, $2e, $2e
	.DB $2e, $2e, $2e, $2e
	.DB $2e, $2e, $2e, $2e
	.DB $2e, $2e, $2e, $2e
	.DB $2e, $2e, $4e, $7f
	.DB $3c, $2a, $2a, $2b
;            .DB 22 $2a,
	.DB >(scr_mem+19*32), <(scr_mem+19*32)
	.DB $20			; control byte: VRAM line, ptr inc, $32,bytes of data
	.DB $28
	.DB $2b, $28, $3b, $7f
	.DB $40, $7f, $01, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $40, $7f, $3c
	.DB $2b, $2b, $28
;            .DB 22 $2a,
	.DB >(scr_mem+20*32), <(scr_mem+20*32)
	.DB $20			; control byte: VRAM line, ptr inc, $32,bytes of data
	.DB $2a, $28
	.DB $2b, $3b, $7f, $40
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $40, $7f, $3c, $2b
	.DB $2a, $2b
;            .DB 22 c0   ; $bddb: $2a, $2b, 22 c0   Data
	.DB >(scr_mem+21*32), <(scr_mem+21*32)
	.DB $20			; control byte: VRAM line, ptr inc, $32,bytes of data
	.DB $2c, $2b, $2b
	.DB $3b, $7f, $40, $7f
	.DB $02, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $40
	.DB $7f, $3c, $2b, $2b
	.DB $28
;            .DB 22 e0
	.DB >(scr_mem+22*32), <(scr_mem+22*32)
	.DB $20			; control byte: VRAM line, ptr inc, $32,bytes of data
	.DB $2a, $28, $2b, $3b
	.DB $7f, $40, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $40, $7f
	.DB $3c, $28, $2b, $2a
;            .DB 23 00
	.DB >(scr_mem+23*32), <(scr_mem+23*32)
	.DB $20			; control byte: VRAM line, ptr inc, $32,bytes of data
	.DB $2b
	.DB $2b, $28, $3b, $7f
	.DB $40, $7f, $03, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $40, $7f, $3c
	.DB $2b, $2a, $28
;            .DB 23 20
	.DB >(scr_mem+24*32), <(scr_mem+24*32)
	.DB $20			; control byte: VRAM line, ptr inc, $32,bytes of data
	.DB $2b, $29
	.DB $28, $3b, $7f, $2d
	.DB $2e, $2e, $2e, $2e
	.DB $2e, $2e, $2e, $2e
	.DB $2e, $2e, $2e, $2e
	.DB $2e, $2e, $2e, $2e
	.DB $2e, $2e, $2e, $2e
	.DB $2f, $7f, $3c, $2a
	.DB $2a, $28
;            .DB 23 $29,   ; $be67: $2a, $28, 23 $29,   Data
	.DB >(scr_mem+25*32), <(scr_mem+25*32)
	.DB $20			; control byte: VRAM line, ptr inc, $32,bytes of data
	.DB $2b, $28, $2b
	.DB $3b, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $3c, $2b, $2c
	.DB $2b
;            .DB 23 $2c,
	.DB >(scr_mem+26*32), <(scr_mem+26*32)
	.DB $20			; control byte: VRAM line, ptr inc, $32,bytes of data
	.DB $28, $29, $28, $3d
	.DB $3e, $3e, $3e, $3e
	.DB $3e, $3e, $3e, $3e
	.DB $3e, $3e, $3e, $3e
	.DB $3e, $3e, $3e, $3e
	.DB $3e, $3e, $3e, $3e
	.DB $3e, $3e, $3e, $3e
	.DB $3f, $2b, $2a, $28
;           .DB 23 $2a
	.DB >(scr_mem+27*32), <(scr_mem+27*32)
	.DB $20			; control byte: VRAM line, ptr inc, $32,bytes of data
	.DB $2b
	.DB $28, $29, $28, $2b
	.DB $2a, $2a, $2b, $2a
	.DB $2a, $2a, $28, $29
	.DB $28, $29, $28, $2c
	.DB $2b, $29, $2a, $28
	.DB $2b, $2a, $29, $28
	.DB $2a, $2b, $2a, $2b
	.DB $2a, $28, $2b
;           .DB 23 $2a,
;            20
;            .DB $2b, $2a,   ; $bed3: $2a, 20 $2b, $2a,   Data
;            .DB $28, $2a, $2a, $28,   ; $bed7: $28, $2a, $2a, $28,   Data
;            .DB $2b, $28, $2a, 43   ; $bedb: $2b, $28, $2a, 43   Data
;            .DB $28, $2a, $28, $2b,   ; $bedf: $28, $2a, $28, $2b,   Data
;            .DB $2b, $2b, $2a, $28,   ; $bee3: $2b, $2b, $2a, $28,   Data
;            .DB $28, $2a, $2a, $28,   ; $bee7: $28, $2a, $2a, $28,   Data
;            .DB $2b, $28, $2c, $2b,   ; $beeb: $2b, $28, $2c, $2b,   Data
;            .DB $2a, $28, $2a, $28,   ; $beef: $2a, $28, $2a, $28,   Data
;            .DB $2a, $2a,
;            .DB 23 c0   ; $bef3: $2a, $2a, 23 c0   Data
;            .DB 20
;            .DB aa aa aa   ; $bef7: 20 aa aa aa   Data
;            .DB aa aa aa aa   ; $befb: aa aa aa aa   Data
;            .DB aa aa 55 a9   ; $beff: aa aa 55 a9   Data
;            .DB aa 9a a6 a5   ; $bf03: aa 9a a6 a5   Data
;            .DB aa aa d5 fa   ; $bf07: aa aa d5 fa   Data
;            .DB fa f8 fa 7a   ; $bf0b: fa f8 fa 7a   Data
;            .DB aa aa dd $7f,   ; $bf0f: aa aa dd $7f,   Data
;            .DB $7f, $7f, $7f, 77   ; $bf13: $7f, $7f, $7f, 77   Data
;            .DB aa
;            .DB 23 e0
;            20   ; $bf17: aa 23 e0 20   Data
;            .DB aa 00 00 00   ; $bf1b: aa 00 00 00   Data
;            .DB 00 00 00 aa   ; $bf1f: 00 00 00 aa   Data
;            .DB aa 00 00 00   ; $bf23: aa 00 00 00   Data
;            .DB 00 00 00 aa   ; $bf27: 00 00 00 aa   Data
;            .DB aa $2a, $2a, $2a,   ; $bf2b: aa $2a, $2a, $2a,   Data
;            .DB $2a, $2a, $2a, aa   ; $bf2f: $2a, $2a, $2a, aa   Data
;            .DB 0a 0a 0a 0a   ; $bf33: 0a 0a 0a 0a   Data
;            .DB 0a 0a 0a 0a   ; $bf37: 0a 0a 0a 0a   Data
	.DB $ff
; end of data
