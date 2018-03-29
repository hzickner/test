TYPE_SCREEN_DATA:
;            .DB 20 00         ; PPU address $2000 (screen0, line 0)
;            .DB 20            ; control byte: VRAM line, ptr inc, $32,bytes of data
;            .DB $ab, $a9,
;            .DB $a8, $aa, $aa, $a8,   ; $b67f: $a8, $aa, $aa, $a8,   Data
;            .DB $ab, $ab, $aa, $ab,   ; $b683: $ab, $ab, $aa, $ab,   Data
;            .DB $aa, $ab, $aa, $a9,   ; $b687: $aa, $ab, $aa, $a9,   Data
;            .DB $a8, $ab, $aa, $aa,   ; $b68b: $a8, $ab, $aa, $aa,   Data
;            .DB $aa, $a8, $a9, $aa,   ; $b68f: $aa, $a8, $a9, $aa,   Data
;            .DB $a8, $ab, $ab, $aa,   ; $b693: $a8, $ab, $ab, $aa,   Data
;            .DB $aa, $ab, $aa, $ab,   ; $b697: $aa, $ab, $aa, $ab,   Data
;            .DB $a9, $a8,
;            .DB 20 20   ; $b69b: $a9, $a8, 20 20   Data
	.DB >(scr_mem+0*32), <(scr_mem+0*32)
	.DB $20			; control byte: VRAM line, ptr inc, $32,bytes of data
	.DB $ab, $ab, $ab
	.DB $ac, $ab, $a9, $a8
	.DB $a8, $ab, $ab, $ab
	.DB $aa, $a8, $a8, $aa
	.DB $aa, $a8, $ab, $aa
	.DB $ab, $a8, $aa, $aa
	.DB $a8, $ab, $ac, $ab
	.DB $a8, $ab, $ab, $ab
	.DB $ab
;            .DB 20 $a9,
	.DB >(scr_mem+1*32), <(scr_mem+1*32)
	.DB $20			; control byte: VRAM line, ptr inc, $32,bytes of data
	.DB $ab, $a8, $ab, $aa
	.DB $a8, $a8, $aa, $aa
	.DB $a8, $a8, $aa, $aa
	.DB $a8, $aa, $aa, $aa
	.DB $a8, $aa, $ab, $ab
	.DB $aa, $a9, $a8, $aa
	.DB $a8, $aa, $a8, $a9
	.DB $a8, $a8, $a8, $ab
;            .DB 20 $ac,
	.DB >(scr_mem+2*32), <(scr_mem+2*32)
	.DB $20			; control byte: VRAM line, ptr inc, $32,bytes of data
	.DB $a8
	.DB $ab, $ab, $30, $31
	.DB $31, $31, $31, $31
	.DB $31, $31, $31, $31
	.DB $31, $31, $31, $32
	.DB $ab, $a8, $a8, $ab
	.DB $a8, $ac, $ab, $ab
	.DB $ac, $ab, $a8, $aa
	.DB $ab, $aa, $a8
;            .DB 20 $aa,
	.DB >(scr_mem+3*32), <(scr_mem+3*32)
	.DB $20			; control byte: VRAM line, ptr inc, 32bytes of data
	.DB $aa, $ab
	.DB $a8, $33, $7f, $10
	.DB $0a, $16, $0e, $7f
	.DB $7f, $1d, $22, $19
	.DB $0e, $7f, $34, $aa
	.DB $aa, $a8, $aa, $ab
	.DB $aa, $a8, $ab, $aa
	.DB $a8, $a9, $a8, $aa
	.DB $a8, $ab
;            .DB 20 $aa,   ; $b727: $a8, $ab, 20 $aa,   Data
	.DB >(scr_mem+4*32), <(scr_mem+4*32)
	.DB $20			; control byte: VRAM line, ptr inc, 32bytes of data
	.DB $ab, $a8, $ab
	.DB $35, $36, $36, $36
	.DB $36, $36, $36, $36
	.DB $36, $36, $36, $36
	.DB $36, $37, $a9, $a8
	.DB $aa, $ab, $a8, $ab
	.DB $aa, $a8, $ac, $ab
	.DB $ab, $ac, $ab, $aa
	.DB $ab
;            .DB 20 c0
	.DB >(scr_mem+5*32), <(scr_mem+5*32)
	.DB $20			; control byte: VRAM line, ptr inc, $32,bytes of data
	.DB $a9, $a8, $aa, $aa
	.DB $a8, $aa, $a9, $a8
	.DB $aa, $aa, $aa, $a8
	.DB $aa, $aa, $aa, $a8
	.DB $aa, $a8, $a9, $a8
	.DB $aa, $a8, $aa, $aa
	.DB $a8, $aa, $a8, $a8
	.DB $aa, $a8, $ab, $a8
;            .DB 20 e0
	.DB >(scr_mem+6*32), <(scr_mem+6*32)
	.DB $20			; control byte: VRAM line, ptr inc, $32,bytes of data
	.DB $a8
	.DB $a9, $a8, $a9, $a8
	.DB $ab, $a8, $38, $39
	.DB $39, $39, $39, $39
	.DB $39, $39, $39, $3a
	.DB $ab, $ab, $b8, $b9
	.DB $b9, $b9, $b9, $b9
	.DB $b9, $b9, $b9, $ba
	.DB $a9, $a8, $ab
;            .DB 21 00
	.DB >(scr_mem+7*32), <(scr_mem+7*32)
	.DB $20			; control byte: VRAM line, ptr inc, $32,bytes of data
	.DB $aa, $a8
	.DB $aa, $a8, $aa, $aa
	.DB $a8, $3b, $7f, $0a
	.DB $24, $1d, $22, $19
	.DB $0e, $7f, $3c, $ab
	.DB $a8, $bb, $7f, $0b
	.DB $24, $1d, $22, $19
	.DB $0e, $7f, $bc, $a8
	.DB $aa, $ab
;            .DB 21 20   ; $b7b3: $aa, $ab, 21 20   Data
	.DB >(scr_mem+8*32), <(scr_mem+8*32)
	.DB $20			; control byte: VRAM line, ptr inc, $32,bytes of data
	.DB $a9, $a8, $ab
	.DB $aa, $aa, $ab, $ab
	.DB $3d, $3e, $3e, $3e
	.DB $3e, $3e, $3e, $3e
	.DB $3e, $3f, $aa, $a8
	.DB $bd, $be, $be, $be
	.DB $be, $be, $be, $be
	.DB $be, $bf, $a9, $a8
	.DB $a8
;            .DB 21 $a9,
	.DB >(scr_mem+9*32), <(scr_mem+9*32)
	.DB $20			; control byte: VRAM line, ptr inc, $32,bytes of data
	.DB $ab, $aa, $aa, $a8
	.DB $ab, $a8, $aa, $ab
	.DB $ac, $ab, $ac, $ab
	.DB $ab, $aa, $aa, $ab
	.DB $ac, $ab, $aa, $aa
	.DB $aa, $a8, $ab, $aa
	.DB $ab, $a9, $aa, $a8
	.DB $aa, $a8, $aa, $ab
;            .DB 21 $ac,
	.DB >(scr_mem+10*32), <(scr_mem+10*32)
	.DB $20			; control byte: VRAM line, ptr inc, $32,bytes of data
	.DB $a8
	.DB $a9, $aa, $a8, $aa
	.DB $aa, $a8, $a8, $aa
	.DB $a8, $aa, $a8, $aa
	.DB $aa, $a8, $a8, $aa
	.DB $a8, $ab, $aa, $aa
	.DB $ab, $aa, $ab, $ab
	.DB $a8, $ab, $aa, $aa
	.DB $aa, $a8, $ab
;            .DB 21 $aa,
	.DB >(scr_mem+11*32), <(scr_mem+11*32)
	.DB $20			; control byte: VRAM line, ptr inc, $32,bytes of data
	.DB $ab, $a8
	.DB $ab, $30, $31, $31
	.DB $31, $31, $31, $31
	.DB $31, $31, $31, $31
	.DB $31, $31, $32, $aa
	.DB $aa, $a8, $ab, $a8
	.DB $ab, $a8, $a8, $aa
	.DB $ab, $a9, $a8, $aa
	.DB $ab, $a8
;            .DB 21 $aa,   ; $b83f: $ab, $a8, 21 $aa,   Data
	.DB >(scr_mem+12*32), <(scr_mem+12*32)
	.DB $20			; control byte: VRAM line, ptr inc, $32,bytes of data
	.DB $ab, $aa, $ab
	.DB $33, $7f, $16, $1e
	.DB $1c, $12, $0c, $7f
	.DB $1d, $22, $19, $0e
	.DB $7f, $34, $aa, $a9
	.DB $a8, $aa, $ab, $ab
	.DB $aa, $aa, $ab, $a8
	.DB $ab, $a9, $a8, $aa
	.DB $a8
;            .DB 21 c0
	.DB >(scr_mem+13*32), <(scr_mem+13*32)
	.DB $20			; control byte: VRAM line, ptr inc, $32,bytes of data
	.DB $aa, $a8, $a8, $35
	.DB $36, $36, $36, $36
	.DB $36, $36, $36, $36
	.DB $36, $36, $36, $36
	.DB $37, $ab, $a8, $aa
	.DB $ab, $a8, $ab, $ac
	.DB $ab, $a8, $ab, $a8
	.DB $ab, $aa, $aa, $ab
;            .DB 21 e0
	.DB >(scr_mem+14*32), <(scr_mem+14*32)
	.DB $20			; control byte: VRAM line, ptr inc, $32,bytes of data
	.DB $ac
	.DB $ab, $ab, $aa, $aa
	.DB $ab, $aa, $a9, $a8
	.DB $aa, $aa, $aa, $a8
	.DB $aa, $aa, $aa, $a8
	.DB $aa, $aa, $a8, $aa
	.DB $a8, $a8, $aa, $a8
	.DB $aa, $aa, $a8, $a8
	.DB $aa, $ab, $a8
;            .DB 22 00
	.DB >(scr_mem+15*32), <(scr_mem+15*32)
	.DB $20			; control byte: VRAM line, ptr inc, $32,bytes of data
	.DB $aa, $a8
	.DB $aa, $aa, $a8, $a8
	.DB $ab, $a8, $aa, $aa
	.DB $ab, $ab, $41, $2e
	.DB $2e, $2e, $2e, $2e
	.DB $2e, $2e, $2e, $2e
	.DB $2e, $42, $aa, $aa
	.DB $aa, $a8, $ac, $ab
	.DB $aa, $a8
;            .DB 22 20   ; $b8cb: $aa, $a8, 22 20   Data
	.DB >(scr_mem+16*32), <(scr_mem+16*32)
	.DB $20			; control byte: VRAM line, ptr inc, $32,bytes of data
	.DB $aa, $a8, $ac
	.DB $ab, $ab, $ab, $aa
	.DB $aa, $a8, $ab, $a8
	.DB $ab, $40, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $40, $aa, $aa, $aa
	.DB $a8, $aa, $a8, $aa
	.DB $aa
;            .DB 22 $a9,
	.DB >(scr_mem+17*32), <(scr_mem+17*32)
	.DB $20			; control byte: VRAM line, ptr inc, $32,bytes of data
	.DB $ab, $ab, $aa, $a8
	.DB $ab, $a9, $a8, $a9
	.DB $a8, $a9, $a8, $ab
	.DB $40, $7f, $16, $1e
	.DB $1c, $12, $0c, $7f
	.DB $7f, $01, $7f, $40
	.DB $ab, $aa, $ab, $ac
	.DB $ab, $a9, $aa, $a8
;            .DB 22 $ac,
	.DB >(scr_mem+18*32), <(scr_mem+18*32)
	.DB $20			; control byte: VRAM line, ptr inc, $32,bytes of data
	.DB $a8
	.DB $aa, $ab, $ab, $ab
	.DB $a8, $ab, $ab, $ab
	.DB $a8, $ab, $a8, $40
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $40, $aa
	.DB $ab, $ab, $aa, $a8
	.DB $a8, $ab, $ab
;            .DB 22 $aa,
	.DB >(scr_mem+19*32), <(scr_mem+19*32)
	.DB $20			; control byte: VRAM line, ptr inc, $32,bytes of data
	.DB $a8, $ab
	.DB $a8, $ab, $a8, $a9
	.DB $a8, $a8, $a9, $a8
	.DB $aa, $ab, $40, $7f
	.DB $16, $1e, $1c, $12
	.DB $0c, $7f, $7f, $02
	.DB $7f, $40, $ab, $a8
	.DB $a8, $ab, $ac, $ab
	.DB $ab, $aa
;            .DB 22 $aa,   ; $b957: $ab, $aa, 22 $aa,   Data
	.DB >(scr_mem+20*32), <(scr_mem+20*32)
	.DB $20			; control byte: VRAM line, ptr inc, $32,bytes of data
	.DB $a8, $a9, $a8
	.DB $aa, $a8, $a8, $ac
	.DB $ab, $a8, $ac, $ab
	.DB $a8, $40, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $40, $a9, $a8, $aa
	.DB $ab, $aa, $a8, $aa
	.DB $a8
;            .DB 22 c0
	.DB >(scr_mem+21*32), <(scr_mem+21*32)
	.DB $20			; control byte: VRAM line, ptr inc, $32,bytes of data
	.DB $ab, $a8, $aa, $aa
	.DB $aa, $a8, $aa, $a8
	.DB $ab, $aa, $a8, $ab
	.DB $40, $7f, $16, $1e
	.DB $1c, $12, $0c, $7f
	.DB $7f, $03, $7f, $40
	.DB $a8, $a9, $a8, $a8
	.DB $ab, $aa, $aa, $ab
;            .DB 22 e0
	.DB >(scr_mem+22*32), <(scr_mem+22*32)
	.DB $20			; control byte: VRAM line, ptr inc, $32,bytes of data
	.DB $a8
	.DB $a9, $aa, $a8, $aa
	.DB $aa, $ab, $aa, $ab
	.DB $aa, $aa, $a8, $40
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $40, $aa
	.DB $a8, $aa, $aa, $a8
	.DB $a9, $a8, $a8
;            .DB 23 00
	.DB >(scr_mem+23*32), <(scr_mem+23*32)
	.DB $20			; control byte: VRAM line, ptr inc, $32,bytes of data
	.DB $ab, $a8
	.DB $aa, $a9, $a8, $ab
	.DB $a8, $ab, $a8, $aa
	.DB $aa, $ab, $40, $7f
	.DB $7f, $7f, $18, $0f
	.DB $0f, $7f, $7f, $7f
	.DB $7f, $40, $aa, $aa
	.DB $aa, $a8, $aa, $a8
	.DB $ac, $ab
;            .DB 23 20   ; $b9e3: $ac, $ab, 23 20   Data
	.DB >(scr_mem+24*32), <(scr_mem+24*32)
	.DB $20			; control byte: VRAM line, ptr inc, $32,bytes of data
	.DB $a8, $ac, $ab
	.DB $a8, $a9, $a8, $aa
	.DB $aa, $a8, $ab, $ab
	.DB $a8, $40, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $40, $ac, $ab, $ab
	.DB $ab, $aa, $ab, $aa
	.DB $a8
;            .DB 23 $a9,
	.DB >(scr_mem+25*32), <(scr_mem+25*32)
	.DB $20			; control byte: VRAM line, ptr inc, $32,bytes of data
	.DB $ab, $aa, $a8, $ab
	.DB $a8, $a9, $aa, $a8
	.DB $ab, $ab, $a9, $a8
	.DB $2d, $2e, $2e, $2e
	.DB $2e, $2e, $2e, $2e
	.DB $2e, $2e, $2e, $2f
	.DB $aa, $a8, $ab, $a9
	.DB $a8, $ab, $aa, $aa
;            .DB 23 60,
	.DB >(scr_mem+26*32), <(scr_mem+26*32)
	.DB $20			; control byte: VRAM line, ptr inc, $32,bytes of data
	.DB $ab
	.DB $ab, $aa, $aa, $a8
	.DB $a8, $ac, $ab, $ab
	.DB $ab, $a8, $ab, $aa
	.DB $aa, $aa, $a8, $ab
	.DB $aa, $ab, $a9, $aa
	.DB $a8, $a9, $a8, $ac
	.DB $ab, $ab, $a8, $ab
	.DB $a8, $ab, $ab
;            .DB 23 80,
	.DB >(scr_mem+27*32), <(scr_mem+27*32)
	.DB $20			; control byte: VRAM line, ptr inc, $32,bytes of data
	.DB $ab, $aa
	.DB $aa, $a8, $ab, $ab
	.DB $aa, $a8, $ab, $a8
	.DB $a9, $a8, $ab, $ac
	.DB $ab, $aa, $aa, $a8
	.DB $ab, $a8, $ab, $aa
	.DB $a8, $ab, $aa, $a8
	.DB $a8, $aa, $ab, $a9
	.DB $a8, $ab
;            .DB 23 a0,   ; $ba6f: $a8, $ab, 23 $aa,   Data
;            .DB 20
;            .DB $a8, $aa, $aa,   ; $ba73: 20 $a8, $aa, $aa,   Data
;            .DB $ab, $ab, $ab, $a9,   ; $ba77: $ab, $ab, $ab, $a9,   Data
;            .DB $a8, $a8, $ab, $a8,   ; $ba7b: $a8, $a8, $ab, $a8,   Data
;            .DB $ab, $ab, $aa, $a8,   ; $ba7f: $ab, $ab, $aa, $a8,   Data
;            .DB $aa, $a9, $a8, $a8,   ; $ba83: $aa, $a9, $a8, $a8,   Data
;            .DB $aa, $aa, $a8, $aa,   ; $ba87: $aa, $aa, $a8, $aa,   Data
;            .DB $aa, $a8, $aa, $aa,   ; $ba8b: $aa, $a8, $aa, $aa,   Data
;            .DB $ab, $a8, $a8, $aa,   ; $ba8f: $ab, $a8, $a8, $aa,   Data
;            .DB $a8,
;            .DB 23 c0
;            .DB 20   ; $ba93: $a8, 23 c0 20   Data
;            .DB 2a 0a 0a 0a   ; $ba97: 2a 0a 0a 0a   Data
;            .DB 8a aa aa aa   ; $ba9b: 8a aa aa aa   Data
;            .DB a2 $ac, 50 50   ; $ba9f: a2 $ac, 50 50   Data
;            .DB 98 aa aa aa   ; $baa3: 98 aa aa aa   Data
;            .DB 6a 56 55 55   ; $baa7: 6a 56 55 55   Data
;            .DB 19 0a 0a 8a   ; $baab: 19 0a 0a 8a   Data
;            .DB 22 00 00 00   ; $baaf: 22 00 00 00   Data
;            .DB 88 aa aa aa   ; $bab3: 88 aa aa aa   Data
;            .DB 23 e0
;            .DB 20
;            .DB aa   ; $bab7: 23 e0 20 aa   Data
;            .DB aa aa 00 00   ; $babb: aa aa 00 00   Data
;            .DB 00 aa aa aa   ; $babf: 00 aa aa aa   Data
;            .DB aa aa 00 00   ; $bac3: aa aa 00 00   Data
;            .DB 00 aa aa aa   ; $bac7: 00 aa aa aa   Data
;            .DB aa aa 00 00   ; $bacb: aa aa 00 00   Data
;            .DB 00 aa aa 0a   ; $bacf: 00 aa aa 0a   Data
;            .DB 0a 0a 0a 0a   ; $bad3: 0a 0a 0a 0a   Data
;            .DB 0a 0a 0a
	.DB $ff            ; end of processing
;end of TYPE_SCREEN_DATA
