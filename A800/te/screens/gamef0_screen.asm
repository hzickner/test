GAME_F0_screen:            
;            .DB 20 00
; 20   ; $bf3b: $7f, 20 00 20   Data
;            .DB $28, $2b, $2b, $2b,   ; $bf3f: $28, $2b, $2b, $2b,   Data
;            .DB $29, $2a, $28, $2a,   ; $bf43: $29, $2a, $28, $2a,   Data
;            .DB 75 $28, $2b, $2b,   ; $bf47: 75 $28, $2b, $2b,   Data
;            .DB $2a, $28, $2a, $28,   ; $bf4b: $2a, $28, $2a, $28,   Data
;            .DB $2b, $28, $2b, $2a,   ; $bf4f: $2b, $28, $2b, $2a,   Data
;            .DB $2b, $28, $2c, $2b,   ; $bf53: $2b, $28, $2c, $2b,   Data
;            .DB $2b, $28, $2a, 75   ; $bf57: $2b, $28, $2a, 75   Data
;            .DB $28, $29, $28, $2b,   ; $bf5b: $28, $29, $28, $2b,   Data
;            .DB 20 20
	.DB >(scr_mem+0*32), <(scr_mem+0*32)
	.DB $20			; control byte: VRAM line, ptr inc, $32,bytes of data
	.DB $29
	.DB $28, $28, $2b, $28
	.DB $2b, $2a, $2b, $28
	.DB $29, $28, $28, $2a
	.DB $2a, $2a, $28, $28
	.DB $2a, $2a, $28, $2a
	.DB $28, $2a, $28, $2a
	.DB $2a, $28, $28, $2a
	.DB $28, $2a, $2b
;            .DB 20 40
	.DB >(scr_mem+1*32), <(scr_mem+1*32)
	.DB $20			; control byte: VRAM line, ptr inc, $32,bytes of data
	.DB $28, $29
	.DB $28, $28, $2a, $2a
	.DB $28, $2a, $28, $28
	.DB $2b, $60, $61, $61
	.DB $61, $61, $61, $61
	.DB $61, $61, $61, $61
	.DB $62, $60, $61, $61
	.DB $61, $61, $61, $61
	.DB $62, $28
;            .DB 20 60   ; $bfa3: $62, $28, 20 60   Data
	.DB >(scr_mem+2*32), <(scr_mem+2*32)
	.DB $20			; control byte: VRAM line, ptr inc, $32,bytes of data
	.DB $2b, $2b, $60
	.DB $61, $61, $61, $61
	.DB $61, $61, $62, $2b
	.DB $63, $7f, $15, $12
	.DB $17, $0e, $1c, $24
	.DB $7f, $7f, $7f, $64
	.DB $63, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $64
	.DB $2b
;            .DB 20 $2a,
	.DB >(scr_mem+3*32), <(scr_mem+3*32)
	.DB $20			; control byte: VRAM line, ptr inc, $32,bytes of data
	.DB $2b, $28, $63, $7f
	.DB $24, $1d, $22, $19
	.DB $0e, $64, $2b, $65
	.DB $66, $66, $66, $66
	.DB $66, $66, $66, $66
	.DB $66, $66, $67, $63
	.DB $1d, $18, $19, $7f
	.DB $7f, $7f, $64, $2b
;            .DB 20 a0
	.DB >(scr_mem+4*32), <(scr_mem+4*32)
	.DB $20			; control byte: VRAM line, ptr inc, $32,bytes of data
	.DB $2a
	.DB $28, $65, $66, $66
	.DB $66, $66, $66, $66
	.DB $67, $28, $68, $69
	.DB $69, $69, $69, $69
	.DB $69, $69, $69, $69
	.DB $69, $6a, $63, $00
	.DB $00, $00, $00, $00
	.DB $00, $64, $2b
;            .DB 20 c0
	.DB >(scr_mem+5*32), <(scr_mem+5*32)
	.DB $20			; control byte: VRAM line, ptr inc, $32,bytes of data
	.DB $2a, $2a
	.DB $2a, $28, $2b, $2c
	.DB $2b, $2b, $2a, $2a
	.DB $2b, $6b, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $6c, $63, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $64, $28
;            .DB 20 e0   ; $c02f: $64, $28, 20 e0   Data
	.DB >(scr_mem+6*32), <(scr_mem+6*32)
	.DB $20			; control byte: VRAM line, ptr inc, $32,bytes of data
	.DB $2a, $28, $2a
	.DB $2a, $28, $2a, $28
	.DB $2a, $2a, $28, $28
	.DB $6b, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $6c
	.DB $63, $1c, $0c, $18
	.DB $1b ,$0e, $7f, $64
	.DB $2b
;            .DB 21 00
	.DB >(scr_mem+7*32), <(scr_mem+7*32)
	.DB $20			; control byte: VRAM line, ptr inc, $32,bytes of data
	.DB $2b, $60, $61, $61
	.DB $61, $61, $61, $61
	.DB $61, $61, $62, $6b
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $6c, $63
	.DB $00, $00, $00, $00
	.DB $00, $00, $64, $2a
;            .DB 21 20
	.DB >(scr_mem+8*32), <(scr_mem+8*32)
	.DB $20			; control byte: VRAM line, ptr inc, $32,bytes of data
	.DB $2b
	.DB $63, $52, $53, $54
	.DB $55, $56, $57, $0c
	.DB $1c, $64, $6b, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $6c, $63, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $64, $2b
;            .DB 21 40
	.DB >(scr_mem+9*32), <(scr_mem+9*32)
	.DB $20			; control byte: VRAM line, ptr inc, $32,bytes of data
	.DB $28, $63
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $64, $6b, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $6c, $65, $66, $66
	.DB $66, $66, $66, $66
	.DB $67, $2b
;            .DB 21 60   ; $c0bb: $67, $2b, 21 60   Data
	.DB >(scr_mem+10*32), <(scr_mem+10*32)
	.DB $20			; control byte: VRAM line, ptr inc, $32,bytes of data
	.DB $28, $63, $7f
	.DB $74, $75, $76, $7f
	.DB $7f, $7f, $7f, $64
	.DB $6b, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $6c
	.DB $2a, $2a, $2a, $28
	.DB $2a, $2a, $2b, $2a
	.DB $28
;            .DB 21 $2a,
	.DB >(scr_mem+11*32), <(scr_mem+11*32)
	.DB $20			; control byte: VRAM line, ptr inc, $32,bytes of data
	.DB $28, $63, $7f, $7f
	.DB $78, $7f, $00, $00
	.DB $00, $7f, $64, $6b
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $6c, $68
	.DB $69, $69, $69, $69
	.DB $6a, $28, $2b, $2a
;	.DB 21 a0
	.DB >(scr_mem+12*32), <(scr_mem+12*32)
	.DB $20			; control byte: VRAM line, ptr inc, $32,bytes of data
	.DB $28
	.DB $63, $7f, $74, $75
	.DB $76, $7f, $7f, $7f
	.DB $7f, $64, $6b, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $6c, $6b, $17
	.DB $0e, $21, $1d, $6c
	.DB $29, $28, $2a
;            .DB 21 c0
	.DB >(scr_mem+13*32), <(scr_mem+13*32)
	.DB $20			; control byte: VRAM line, ptr inc, $32,bytes of data
	.DB $2b, $63
	.DB $7f, $7f, $7c, $7b
	.DB $00, $00, $00, $7f
	.DB $64, $6b, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $6c, $6b, $7f, $7f
	.DB $7f, $7f, $6c, $28
	.DB $29, $28
;            .DB 21 e0   ; $c147: $29, $28, 21 e0   Data
	.DB >(scr_mem+14*32), <(scr_mem+14*32)
	.DB $20			; control byte: VRAM line, ptr inc, $32,bytes of data
	.DB $2b, $63, $7f
	.DB $f4, $f7, $7f, $7f
	.DB $7f, $7f, $7f, $64
	.DB $6b, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $6c
	.DB $6b, $7f, $7f, $7f
	.DB $7f, $6c, $2a, $28
	.DB $2c
;            .DB 22 00
	.DB >(scr_mem+15*32), <(scr_mem+15*32)
	.DB $20			; control byte: VRAM line, ptr inc, $32,bytes of data
	.DB $2b, $63, $7f, $7f
	.DB $fa, $fb, $00, $00
	.DB $00, $7f, $64, $6b
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $6c, $6b
	.DB $7f, $7f, $7f, $7f
	.DB $6c, $29, $28, $2a
;            .DB 22 20
	.DB >(scr_mem+16*32), <(scr_mem+16*32)
	.DB $20			; control byte: VRAM line, ptr inc, $32,bytes of data
	.DB $28
	.DB $63, $7f, $74, $77
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $64, $6b, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f
	.DB $7f, $7f, $7f, $6c
	.DB $6b, $7f, $7f, $7f
	.DB $7f, $6c, $2b, $2a
	.DB $2b
;            .DB 22 40
	.DB >(scr_mem+17*32), <(scr_mem+17*32)
	.DB $20			; control byte: VRAM line, ptr inc, $32,bytes of data
	.DB $2b, $63, $7f, $79
	.DB $78, $7f, $00, $00
	.DB $00, $7f, $64, $6b
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $6c, $6d
	.DB $6e, $6e, $6e, $6e
	.DB $6f, $28, $2b, $2b
;            .DB 22 60
	.DB >(scr_mem+18*32), <(scr_mem+18*32)
	.DB $20			; control byte: VRAM line, ptr inc, $32,bytes of data
	.DB $28
	.DB $63, $7f, $7f, $75
	.DB $76, $7f, $7f, $7f
	.DB $7f, $64, $6b, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $6c, $60, $61
	.DB $61, $61, $61, $61
	.DB $62, $2b, $28
;            .DB 22 $2a,
	.DB >(scr_mem+19*32), <(scr_mem+19*32)
	.DB $20			; control byte: VRAM line, ptr inc, $32,bytes of data
	.DB $28, $63
	.DB $7f, $79, $78, $7f
	.DB $00, $00, $00, $7f
	.DB $64, $6b, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $6c, $63, $15, $0e
	.DB $1f, $0e, $15, $64
	.DB $2b, $2a
;            .DB 22 a0   ; $c219: $2b, $2a, 22 a0   Data
	.DB >(scr_mem+20*32), <(scr_mem+20*32)
	.DB $20			; control byte: VRAM line, ptr inc, $32,bytes of data
	.DB $28, $63, $7f
	.DB $f4, $f5, $f6, $7f
	.DB $7f, $7f, $7f, $64
	.DB $6b, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $6c
	.DB $63, $7f, $7f, $7f
	.DB $7f, $7f, $64, $28
	.DB $2b
;            .DB 22 c0
	.DB >(scr_mem+21*32), <(scr_mem+21*32)
	.DB $20			; control byte: VRAM line, ptr inc, $32,bytes of data
	.DB $2b, $63, $7f, $f9
	.DB $7f, $7f, $00, $00
	.DB $00, $7f, $64, $6b
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $6c, $65
	.DB $66, $66, $66, $66
	.DB $66, $67, $2a, $2b
;            .DB 22 e0
	.DB >(scr_mem+22*32), <(scr_mem+22*32)
	.DB $20			; control byte: VRAM line, ptr inc, $32,bytes of data
	.DB $28
	.DB $63, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $64, $6b, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $6c, $2b, $2a
	.DB $29, $28, $2b, $29
	.DB $2a, $28, $28
;            .DB 23 00 
	.DB >(scr_mem+23*32), <(scr_mem+23*32)
	.DB $20			; control byte: VRAM line, ptr inc, $32,bytes of data
	.DB $2b, $63
	.DB $7d, $7e, $7a, $7b
	.DB $00, $00, $00, $7f
	.DB $64, $6b, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $6c, $29, $28, $28
	.DB $2a, $2b, $28, $2b
	.DB $2a, $2a
;            .DB 23 20   ; $c2a5: $2a, $2a, 23 20   Data
	.DB >(scr_mem+24*32), <(scr_mem+24*32)
	.DB $20			; control byte: VRAM line, ptr inc, $32,bytes of data
	.DB $2b, $63, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $64
	.DB $6b, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $6c
	.DB $28, $2a, $2a, $2b
	.DB $28, $29, $28, $29
	.DB $28
;            .DB 23 40
	.DB >(scr_mem+25*32), <(scr_mem+25*32)
	.DB $20			; control byte: VRAM line, ptr inc, $32,bytes of data
	.DB $28, $65, $66, $66
	.DB $66, $66, $66, $66
	.DB $66, $66, $67, $6d
	.DB $6e, $6e, $6e, $6e
	.DB $6e, $6e, $6e, $6e
	.DB $6e, $6e, $6f, $2b
	.DB $2c, $2b, $28, $2b
	.DB $28, $2a, $28, $2b
;            .DB 23 60
	.DB >(scr_mem+26*32), <(scr_mem+26*32)
	.DB $20			; control byte: VRAM line, ptr inc, $32,bytes of data
	.DB $2b
	.DB $2b, $2a, $29, $28
	.DB $29, $2a, $28, $2b
	.DB $2a, $2b, $2a, $2b
	.DB $2b, $29, $28, $29
	.DB $2a, $28, $2a, $2a
	.DB $2a, $28, $2b, $2a
	.DB $28, $2a, $2b, $2b
	.DB $2a, $2a, $28
;            .DB 23 $2a,
	.DB >(scr_mem+27*32), <(scr_mem+27*32)
	.DB $20			; control byte: VRAM line, ptr inc, $32,bytes of data
	.DB $2b, $2a
	.DB $2b, $28, $2b, $28
	.DB $2b, $29, $28, $2b
	.DB $2a, $28, $2b, $2b
	.DB $2b, $2b, $28, $2b
	.DB $2c, $2b, $29, $28
	.DB $2b, $2a, $28, $2a
	.DB $2b, $28, $2b, $2a
	.DB $2a, $2a
;            .DB 23 a0   ; $c331: $2a, $2a, 23 a0   Data
;	.DB >(scr_mem+28*32), <(scr_mem+28*32)
;	.DB $20			; control byte: VRAM line, ptr inc, $32,bytes of data
;	.DB $2a, $28, $28,   ; $c335: 20 $2a, $28, $28,   Data
;	.DB $2a, $2a, $28, $2b,   ; $c339: $2a, $2a, $28, $2b,   Data
;	.DB $28, $2a, $2a, $28,   ; $c33d: $28, $2a, $2a, $28,   Data
;	.DB $2b, $28, $2b, $28,   ; $c341: $2b, $28, $2b, $28,   Data
;	.DB $2b, $29, $28, $2a,   ; $c345: $2b, $29, $28, $2a,   Data
;	.DB $28, $2b, $2b, $2a,   ; $c349: $28, $2b, $2b, $2a,   Data
;	.DB $2a, $28, $2b, $2b,   ; $c34d: $2a, $28, $2b, $2b,   Data
;            .DB $2a, $28, $29, $28,   ; $c351: $2a, $28, $29, $28,   Data
;            .DB $2b,
;            .DB 23 c0
; 20   ; $c355: $2b, 23 c0 20   Data
;            .DB $7f, $7f, $7f, $7f,   ; $c359: $7f, $7f, $7f, $7f,   Data
;            .DB $7f, $7f, $7f, $7f,   ; $c35d: $7f, $7f, $7f, $7f,   Data
;            .DB $7f, $7f, $7f, af   ; $c361: $7f, $7f, $7f, af   Data
;            .DB af ef $7f, $7f,   ; $c365: af ef $7f, $7f,   Data
;            .DB bf 2f cf aa   ; $c369: bf 2f cf aa   Data
;            .DB aa ee $7f, $7f,   ; $c36d: aa ee $7f, $7f,   Data
;            .DB bb 22 cc aa   ; $c371: bb 22 cc aa   Data
;            .DB aa ee $7f, $7f,   ; $c375: aa ee $7f, $7f,   Data
;            .DB 23 e0
;            .DB 20
;            .DB bb   ; $c379: 23 e0 20 bb   Data
;            .DB 22 cc aa aa   ; $c37d: 22 cc aa aa   Data
;            .DB ee $7f, $7f, bb   ; $c381: ee $7f, $7f, bb   Data
;            .DB 22 cc aa aa   ; $c385: 22 cc aa aa   Data
;            .DB ee $7f, $7f, fb   ; $c389: ee $7f, $7f, fb   Data
;            .DB f2 fc fa fa   ; $c38d: f2 fc fa fa   Data
;            .DB fe $7f, $7f, 0f   ; $c391: fe $7f, $7f, 0f   Data
;            .DB 0f 0f 0f 0f   ; $c395: 0f 0f 0f 0f   Data
;            .DB 0f 0f 0f
	.DB $ff
; end of data