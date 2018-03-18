LEGAL_SCREEN_DATA:
;            .DB 20 00         ; PPU address $2000 (screen0, line 0)
;            .DB 20            ; control byte: VRAM line, ptr inc, 32bytes of data //TODO test use of compression bit
;            .DB ff ff ff ff
;            .DB ff ff ff ff
;            .DB ff ff ff ff
;            .DB ff ff ff ff
;            .DB ff ff ff ff
;            .DB ff ff ff ff
;            .DB ff ff ff ff
;            .DB ff ff ff ff   ; 32 data bytes

;            .DB 20 20         ; PPU address $2020 (screen0, line 1)
	.DB >scr_mem, <scr_mem
	.DB $60			; control byte: VRAM line, ptr no inc, 32bytes of data
	.DB $7F			; wite 32x
;            .DB 20 40         ; PPU address $2040 (screen0, line 2)
	.DB >(scr_mem+1*32), <(scr_mem+1*32)
	.DB $60			; control byte: VRAM line, ptr no inc, 32bytes of data
	.DB $7F			; wite 32x
;            .DB 20 60         ; PPU address $2060 (screen0, line 3)
	.DB >(scr_mem+2*32), <(scr_mem+2*32)
	.DB $60			; control byte: VRAM line, ptr no inc, 32bytes of data
	.DB $7F			; wite 32x
;            .DB 20 80         ; PPU address (screen0, line 4)
	.DB >(scr_mem+3*32), <(scr_mem+3*32)
	.DB $60			; control byte: VRAM line, ptr no inc, 32bytes of data
	.DB $7F			; wite 32x
;            .DB 20 a0 20      ; PPU address (screen0, line 5)
	.DB >(scr_mem+4*32), <(scr_mem+4*32)
	.DB $60			; control byte: VRAM line, ptr no inc, 32bytes of data
	.DB $7F			; wite 32x
;            .DB 20 c0         ; PPU address (screen0, line 6)
	.DB >(scr_mem+5*32), <(scr_mem+5*32)
	.DB $20			; control byte: VRAM line, ptr inc, 32bytes of data
	.DB $7F, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $1d
	.DB $16, $7f, $0a, $17
	.DB $0d, $7f, $fd, $fe
	.DB $2f, $37, $36, $35
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f
;            .DB 20 e0         ; PPU address (screen0, line 7)
	.DB >(scr_mem+6*32), <(scr_mem+6*32)
	.DB $60			; control byte: VRAM line, ptr no inc, 32bytes of data
	.DB $7F			; wite 32x
;            .DB 21 00         ; PPU address (screen0, line 8)
	.DB >(scr_mem+7*32), <(scr_mem+7*32)
	.DB $20			; control byte: VRAM line, ptr inc, 32bytes of data
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $5f, $6b, $58
	.DB $7f, $4e, $55, $4e
	.DB $4c, $5d, $5b, $58
	.DB $57, $58, $5b, $50
	.DB $5d, $4e, $4c, $51
	.DB $57, $52, $4c, $4a
	.DB $7f, $7f, $7f, $7f
;            .DB 21 20         ; PPU address (screen0, line 9)
	.DB >(scr_mem+8*32), <(scr_mem+8*32)
	.DB $60			; control byte: VRAM line, ptr no inc, 32bytes of data
	.DB $7F			; wite 32x
;            .DB 21 40         ; PPU address (screen0, line 10)
	.DB >(scr_mem+9*32), <(scr_mem+9*32)
	.DB $20			; control byte: VRAM line, ptr inc, 32bytes of data
	.DB $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $68, $6a, $4e
	.DB $55, $58, $5b, $50
	.DB $6a, $69, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f
;            .DB 21 60         ; PPU address (screen0, line 11)
	.DB >(scr_mem+10*32), <(scr_mem+10*32)
	.DB $60			; control byte: VRAM line, ptr no inc, 32bytes of data
	.DB $7F			; wite 32x
;            .DB 21 80         ; PPU address (screen0, line 12)
	.DB >(scr_mem+11*32), <(scr_mem+11*32)
	.DB $20			; control byte: VRAM line, ptr inc, 32bytes of data
	.DB $7f, $7f, $7f, $38
	.DB $39, $38, $3a, $3b
	.DB $3c, $7f, $15, $12
	.DB $0c, $0e, $17, $1c
	.DB $0e, $0d, $7f, $1d
	.DB $18, $7f, $57, $52
	.DB $57, $5d, $4e, $57
	.DB $4d, $58, $7f, $7f
;            .DB 21 a0         ; PPU address (screen0, line 13)
	.DB >(scr_mem+12*32), <(scr_mem+12*32)
	.DB $60			; control byte: VRAM line, ptr no inc, 32bytes of data
	.DB $7F			; wite 32x
;            .DB 21 c0         ; PPU address (screen0, line 14)
	.DB >(scr_mem+13*32), <(scr_mem+13*32)
	.DB $20			; control byte: VRAM line, ptr inc, 32bytes of data
	.DB $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $fd, $fe, $af
	.DB $b7, $b6, $b7, $7f
	.DB $57, $52, $57, $5d
	.DB $4e, $57, $4d, $58
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f
;            .DB 21 e0         ; PPU address (screen0, line 15)
	.DB >(scr_mem+14*32), <(scr_mem+14*32)
	.DB $60			; control byte: VRAM line, ptr no inc, 32bytes of data
	.DB $7F			; wite 32x
;            .DB 22 00         ; PPU address (screen0, line 16)
	.DB >(scr_mem+15*32), <(scr_mem+15*32)
	.DB $20			; control byte: VRAM line, ptr inc, 32bytes of data
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $0a, $15
	.DB $15, $7f, $1b, $12
	.DB $10, $11, $1d, $1c
	.DB $7f, $1b, $0e, $1c
	.DB $0e, $1b, $1f, $0e
	.DB $0d, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
;            .DB 22 20         ; PPU address (screen0, line 17)
	.DB >(scr_mem+16*32), <(scr_mem+16*32)
	.DB $60			; control byte: VRAM line, ptr no inc, 32bytes of data
	.DB $7F			; wite 32x
;            .DB 22 40         ; PPU address (screen0, line 18)
	.DB >(scr_mem+17*32), <(scr_mem+17*32)
	.DB $20			; control byte: VRAM line, ptr inc, 32bytes of data
	.DB $7f, $7f
	.DB $7f, $7f, $18, $1b
	.DB $12, $10, $12, $17
	.DB $0a, $15, $7f, $0c
	.DB $18, $17, $0c, $0e
	.DB $19, $1d, $25, $0d
	.DB $0e, $1c, $12, $10
	.DB $17, $7f, $7f, $7f
	.DB $7f, $7f
;            .DB 22 60         ; PPU address (screen0, line 19)
	.DB >(scr_mem+18*32), <(scr_mem+18*32)
	.DB $60			; control byte: VRAM line, ptr no inc, 32bytes of data
	.DB $7F			; wite 32x
;            .DB 22 80         ; PPU address (screen0, line 20)
	.DB >(scr_mem+19*32), <(scr_mem+19*32)
	.DB $20			; control byte: VRAM line, ptr inc, 32bytes of data
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $0a
	.DB $17, $0d, $7f, $19
	.DB $1b, $18, $10, $1b
	.DB $0a, $16, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
;            .DB 22 a0         ; PPU address (screen0, line 21)
	.DB >(scr_mem+20*32), <(scr_mem+20*32)
	.DB $60			; control byte: VRAM line, ptr no inc, 32bytes of data
	.DB $7F			; wite 32x
;            .DB 22 c0         ; PPU address (screen0, line 22)
	.DB >(scr_mem+21*32), <(scr_mem+21*32)
	.DB $20			; control byte: VRAM line, ptr inc, 32bytes of data
	.DB $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $0b, $22, $7f
	.DB $4a, $55, $4e, $61
	.DB $4e, $62, $7f, $59
	.DB $4a, $63, $51, $52
	.DB $5d, $57, $58, $5f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f
;            .DB 22 e0         ; PPU address (screen0, line 23)
	.DB >(scr_mem+22*32), <(scr_mem+22*32)
	.DB $60			; control byte: VRAM line, ptr no inc, 32bytes of data
	.DB $7F			; wite 32x
;            .DB 23 00         ; PPU address (screen0, line 24)
	.DB >(scr_mem+23*32), <(scr_mem+23*32)
	.DB $60			; control byte: VRAM line, ptr no inc, 32bytes of data
	.DB $7F			; wite 32x
;            .DB 23 20         ; PPU address (screen0, line 25)
	.DB >(scr_mem+24*32), <(scr_mem+24*32)
	.DB $60			; control byte: VRAM line, ptr no inc, 32bytes of data
	.DB $7F			; wite 32x
;            .DB 23 40         ; PPU address (screen0, line 26)
	.DB >(scr_mem+25*32), <(scr_mem+25*32)
	.DB $60			; control byte: VRAM line, ptr no inc, 32bytes of data
	.DB $7F			; wite 32x
;            .DB 23 60         ; PPU address (screen0, line 27)
	.DB >(scr_mem+26*32), <(scr_mem+26*32)
	.DB $60			; control byte: VRAM line, ptr no inc, 32bytes of data
	.DB $7F			; wite 32x
;            .DB 23 80         ; PPU address (screen0, line 28)
	.DB >(scr_mem+27*32), <(scr_mem+27*32)
	.DB $60			; control byte: VRAM line, ptr no inc, 32bytes of data
	.DB $7F			; wite 32x

;            .DB 23 a0         ; PPU address (screen0, line 29)
; 20 ff   ; $b1af: 23 a0 20 ff   Data
;            .DB ff ff ff ff   ; $b1b3: ff ff ff ff   Data
;            .DB ff ff ff ff   ; $b1b7: ff ff ff ff   Data
;            .DB ff ff ff ff   ; $b1bb: ff ff ff ff   Data
;            .DB ff ff ff ff   ; $b1bf: ff ff ff ff   Data
;            .DB ff ff ff ff   ; $b1c3: ff ff ff ff   Data
;            .DB ff ff ff ff   ; $b1c7: ff ff ff ff   Data
;            .DB ff ff ff ff   ; $b1cb: ff ff ff ff   Data
;            .DB ff ff ff
;            .DB 23 c0		; 32byte of attribute data
;            .DB 20 ff ff   ; $b1d3: c0 20 ff ff   Data
;            .DB ff ff ff ff   ; $b1d7: ff ff ff ff   Data
;            .DB ff ff ff ff   ; $b1db: ff ff ff ff   Data
;            .DB ff ff 5f df   ; $b1df: ff ff 5f df   Data
;            .DB ff ff bf 00   ; $b1e3: ff ff bf 00   Data
;            .DB 00 00 00 00   ; $b1e7: 00 00 00 00   Data
;            .DB 00 cc f7 45   ; $b1eb: 00 cc f7 45   Data
;            .DB 5d 1f 0f 03   ; $b1ef: 5d 1f 0f 03   Data
;            .DB 00 0c
;            .DB 23 e0         ; 32byte of attribute data
;            .DB 20 ff ff ff   ; $b1f7: 20 ff ff ff   Data
;            .DB ff ff ff ff   ; $b1fb: ff ff ff ff   Data
;            .DB ff ff ff bf   ; $b1ff: ff ff ff bf   Data
;            .DB af af af af   ; $b203: af af af af   Data
;            .DB ff ff ff ff   ; $b207: ff ff ff ff   Data
;            .DB ff ff ff ff   ; $b20b: ff ff ff ff   Data
;            .DB ff 0f 0f 0f   ; $b20f: ff 0f 0f 0f   Data
;            .DB 0f 0f 0f 0f   ; $b213: 0f 0f 0f 0f   Data
;            .DB 0f 
	.DB $ff	; end of data processing
; end of legal screen data