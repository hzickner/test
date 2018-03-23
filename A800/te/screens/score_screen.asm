; screen data for score table from line 17..25            
SCORE_SCREEN_DATA:            
;            .DB 22 20		; line 17
	.DB >(scr_mem+16*32), <(scr_mem+16*32)
	.DB $20			; control byte: VRAM line, ptr inc, $32,bytes of data
	.DB $2a, $2a, $28, $3b
	.DB $7f, $41, $2e, $2e
	.DB $2e, $2e, $2e, $2e
	.DB $2e, $2e, $2e, $2e
	.DB $2e, $2e, $2e, $2e
	.DB $2e, $2e, $2e, $2e
	.DB $2e, $2e, $42, $7f
	.DB $3c, $2c, $2b, $2b
;            .DB 22 $29,
	.DB >(scr_mem+17*32), <(scr_mem+17*32)
	.DB $20			; control byte: VRAM line, ptr inc, $32,bytes of data
	.DB $2b
	.DB $2a, $2b, $3b, $7f
	.DB $40, $7f, $7f, $7f
	.DB $7f, $17, $0a, $16
	.DB $0e, $7f, $7f, $1c
	.DB $0c, $18, $1b, $0e
	.DB $7f, $7f, $15, $1f
	.DB $7f, $40, $7f, $3c
	.DB $2a, $28, $28
;            .DB 22 $2c,
	.DB >(scr_mem+18*32), <(scr_mem+18*32)
	.DB $20			; control byte: VRAM line, ptr inc, $32,bytes of data
	.DB $2b, $2b
	.DB $2b, $3b, $7f, $4c
	.DB $2e, $2e, $2e, $2e
	.DB $2e, $2e, $2e, $2e
	.DB $2e, $2e, $2e, $2e
	.DB $2e, $2e, $2e, $2e
	.DB $2e, $2e, $2e, $2e
	.DB $4e, $7f, $3c, $2a
	.DB $2a, $2b
;            .DB 22 $2a,   ; $c865: $2a, $2b, 22 $2a,   Data
	.DB >(scr_mem+19*32), <(scr_mem+19*32)
	.DB $20			; control byte: VRAM line, ptr inc, $32,bytes of data
	.DB $28, $2b, $28
	.DB $3b, $7f, $40, $7f
	.DB $01, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $40
	.DB $7f, $3c, $2b, $2b
	.DB $28
;            .DB 22 $2a,
	.DB >(scr_mem+20*32), <(scr_mem+20*32)
	.DB $20			; control byte: VRAM line, ptr inc, $32,bytes of data
	.DB $2a, $28, $2b, $3b
	.DB $7f, $40, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $40, $7f
	.DB $3c, $2b, $2a, $2b
;            .DB 22 c0
	.DB >(scr_mem+21*32), <(scr_mem+21*32)
	.DB $20			; control byte: VRAM line, ptr inc, $32,bytes of data
	.DB $2c
	.DB $2b, $2b, $3b, $7f
	.DB $40, $7f, $02, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $40, $7f, $3c
	.DB $2b, $2b, $28
;            .DB 22 e0
	.DB >(scr_mem+22*32), <(scr_mem+22*32)
	.DB $20			; control byte: VRAM line, ptr inc, $32,bytes of data
	.DB $2a, $28
	.DB $2b, $3b, $7f, $40
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $40, $7f, $3c, $28
	.DB $2b, $2a
;            .DB 23 00   ; $c8f1: $2b, $2a, 23 00   Data
	.DB >(scr_mem+23*32), <(scr_mem+23*32)
	.DB $20			; control byte: VRAM line, ptr inc, $32,bytes of data
	.DB $2b, $2b, $28
	.DB $3b, $7f, $40, $7f
	.DB $03, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $40
	.DB $7f, $3c, $2b, $2a
	.DB $28
;            .DB 23 20
	.DB >(scr_mem+24*32), <(scr_mem+24*32)
	.DB $20			; control byte: VRAM line, ptr inc, $32,bytes of data
	.DB $2b, $29, $28, $3b
	.DB $7f, $2d, $2e, $2e
	.DB $2e, $2e, $2e, $2e
	.DB $2e, $2e, $2e, $2e
	.DB $2e, $2e, $2e, $2e
	.DB $2e, $2e, $2e, $2e
	.DB $2e, $2e, $2f, $7f
	.DB $3c, $2a, $2a, $28
;            .DB 23 e0
;            .DB 20
;            .DB aa   ; $c939: 23 e0 20 aa   Data
;            .DB 00 00 00 00   ; $c93d: 00 00 00 00   Data
;            .DB 00 00 aa aa   ; $c941: 00 00 aa aa   Data
;            .DB 00 00 00 00   ; $c945: 00 00 00 00   Data
;            .DB 00 00 aa aa   ; $c949: 00 00 aa aa   Data
;            .DB $2a, $2a, $2a, $2a,   ; $c94d: $2a, $2a, $2a, $2a,   Data
;            .DB $2a, $2a, aa 0a   ; $c951: $2a, $2a, aa 0a   Data
;            .DB 0a 0a 0a 0a   ; $c955: 0a 0a 0a 0a   Data
;            .DB 0a 0a 0a
	.DB $ff
; end of data
