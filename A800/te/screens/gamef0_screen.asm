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
;	.DB >(scr_mem+7*32), <(scr_mem+7*32)
;	.DB $20			; control byte: VRAM line, ptr inc, $32,bytes of data
;            .DB 20
;            .DB $28, $63, $7f,   ; $c0bf: 20 $28, $63, $7f,   Data
;            .DB 40 41 42 $7f,   ; $c0c3: 40 41 42 $7f,   Data
;            .DB $7f, $7f, $7f, $64,   ; $c0c7: $7f, $7f, $7f, $64,   Data
;            .DB $6b, $7f, $7f, $7f,   ; $c0cb: $6b, $7f, $7f, $7f,   Data
;            .DB $7f, $7f, $7f, $7f,   ; $c0cf: $7f, $7f, $7f, $7f,   Data
;            .DB $7f, $7f, $7f, $6c,   ; $c0d3: $7f, $7f, $7f, $6c,   Data
;            .DB $2a, $2a, $2a, $28,   ; $c0d7: $2a, $2a, $2a, $28,   Data
;            .DB $2a, $2a, $2b, $2a,   ; $c0db: $2a, $2a, $2b, $2a,   Data
;            .DB $28,
;            .DB 21 $2a,
; 20   ; $c0df: $28, 21 $2a, 20   Data
;            .DB $28, $63, $7f, 50   ; $c0e3: $28, $63, $7f, 50   Data
;            .DB 51 52 00 00   ; $c0e7: 51 52 00 00   Data
;            .DB 00 $7f, $64, $6b,   ; $c0eb: 00 $7f, $64, $6b,   Data
;            .DB $7f, $7f, $7f, $7f,   ; $c0ef: $7f, $7f, $7f, $7f,   Data
;            .DB $7f, $7f, $7f, $7f,   ; $c0f3: $7f, $7f, $7f, $7f,   Data
;            .DB $7f, $7f, $6c, $68,   ; $c0f7: $7f, $7f, $6c, $68,   Data
;            .DB $69, $69, $69, $69,   ; $c0fb: $69, $69, $69, $69,   Data
;            .DB $6a, $28, $2b, $2a,   ; $c0ff: $6a, $28, $2b, $2a,   Data
;            .DB 21 a0
; 20
;            .DB $28,   ; $c103: 21 a0 20 $28,   Data
;            .DB $63, $7f, 49 4a   ; $c107: $63, $7f, 49 4a   Data
;            .DB 4b $7f, $7f, $7f,   ; $c10b: 4b $7f, $7f, $7f,   Data
;            .DB $7f, $64, $6b, $7f,   ; $c10f: $7f, $64, $6b, $7f,   Data
;            .DB $7f, $7f, $7f, $7f,   ; $c113: $7f, $7f, $7f, $7f,   Data
;            .DB $7f, $7f, $7f, $7f,   ; $c117: $7f, $7f, $7f, $7f,   Data
;            .DB $7f, $6c, $6b, 17   ; $c11b: $7f, $6c, $6b, 17   Data
;            .DB 0e 21 1d $6c,   ; $c11f: 0e 21 1d $6c,   Data
;            .DB $29, $28, $2a,
;            .DB 21 c0
;       20
;            .DB $2b, $63,   ; $c127: c0 20 $2b, $63,   Data
;            .DB $7f, 59 5a 5b   ; $c12b: $7f, 59 5a 5b   Data
;            .DB 00 00 00 $7f,   ; $c12f: 00 00 00 $7f,   Data
;            .DB $64, $6b, $7f, $7f,   ; $c133: $64, $6b, $7f, $7f,   Data
;            .DB $7f, $7f, $7f, $7f,   ; $c137: $7f, $7f, $7f, $7f,   Data
;            .DB $7f, $7f, $7f, $7f,   ; $c13b: $7f, $7f, $7f, $7f,   Data
;            .DB $6c, $6b, $7f, $7f,   ; $c13f: $6c, $6b, $7f, $7f,   Data
;            .DB $7f, $7f, $6c, $28,   ; $c143: $7f, $7f, $6c, $28,   Data
;            .DB $29, $28,
;            .DB 21 e0   ; $c147: $29, $28, 21 e0   Data
;            .DB 20
;            .DB $2b, $63, $7f,   ; $c14b: 20 $2b, $63, $7f,   Data
;            .DB 46 47 $7f, $7f,   ; $c14f: 46 47 $7f, $7f,   Data
;            .DB $7f, $7f, $7f, $64,   ; $c153: $7f, $7f, $7f, $64,   Data
;            .DB $6b, $7f, $7f, $7f,   ; $c157: $6b, $7f, $7f, $7f,   Data
;            .DB $7f, $7f, $7f, $7f,   ; $c15b: $7f, $7f, $7f, $7f,   Data
;            .DB $7f, $7f, $7f, $6c,   ; $c15f: $7f, $7f, $7f, $6c,   Data
;            .DB $6b, $7f, $7f, $7f,   ; $c163: $6b, $7f, $7f, $7f,   Data
;            .DB $7f, $6c, $2a, $28,   ; $c167: $7f, $6c, $2a, $28,   Data
;            .DB $2c,
;            .DB 22 00
;          20   ; $c16b: $2c, 22 00 20   Data
;            .DB $2b, $63, $7f, 56   ; $c16f: $2b, $63, $7f, 56   Data
;            .DB 57 58 00 00   ; $c173: 57 58 00 00   Data
;            .DB 00 $7f, $64, $6b,   ; $c177: 00 $7f, $64, $6b,   Data
;            .DB $7f, $7f, $7f, $7f,   ; $c17b: $7f, $7f, $7f, $7f,   Data
;            .DB $7f, $7f, $7f, $7f,   ; $c17f: $7f, $7f, $7f, $7f,   Data
;            .DB $7f, $7f, $6c, $6b,   ; $c183: $7f, $7f, $6c, $6b,   Data
;            .DB $7f, $7f, $7f, $7f,   ; $c187: $7f, $7f, $7f, $7f,   Data
;            .DB $6c, $29, $28, $2a,   ; $c18b: $6c, $29, $28, $2a,   Data
;            .DB 22 20
; 20
;            .DB $28,   ; $c18f: 22 20 20 $28,   Data
;            .DB $63, $7f, 60 61   ; $c193: $63, $7f, 60 61   Data
;            .DB $7f, $7f, $7f, $7f,   ; $c197: $7f, $7f, $7f, $7f,   Data
;            .DB $7f, $64, $6b, $7f,   ; $c19b: $7f, $64, $6b, $7f,   Data
;            .DB $7f, $7f, $7f, $7f,   ; $c19f: $7f, $7f, $7f, $7f,   Data
;            .DB $7f, $7f,         ; $c1a3: $7f, $7f,         Data
;            .DB $7f, $7f, $7f, $6c,   ; $c1a5: $7f, $7f, $7f, $6c,   Data
;            .DB $6b, $7f, $7f, $7f,   ; $c1a9: $6b, $7f, $7f, $7f,   Data
;            .DB $7f, $6c, $2b, $2a,   ; $c1ad: $7f, $6c, $2b, $2a,   Data
;            .DB $2b,
;            .DB 22 40
; 20   ; $c1b1: $2b, 22 40 20   Data
;            .DB $2b, $63, $7f, 62   ; $c1b5: $2b, $63, $7f, 62   Data
;            .DB 63 $7f, 00 00   ; $c1b9: 63 $7f, 00 00   Data
;            .DB 00 $7f, $64, $6b,   ; $c1bd: 00 $7f, $64, $6b,   Data
;            .DB $7f, $7f, $7f, $7f,   ; $c1c1: $7f, $7f, $7f, $7f,   Data
;            .DB $7f, $7f, $7f, $7f,   ; $c1c5: $7f, $7f, $7f, $7f,   Data
;            .DB $7f, $7f, $6c, 35   ; $c1c9: $7f, $7f, $6c, 35   Data
;            .DB 36 36 36 36   ; $c1cd: 36 36 36 36   Data
;            .DB 37 $28, $2b, $2b,   ; $c1d1: 37 $28, $2b, $2b,   Data
;            .DB 22 60
; 20
;            .DB $28,   ; $c1d5: 22 60 20 $28,   Data
;            .DB $63, $7f, 43 44   ; $c1d9: $63, $7f, 43 44   Data
;            .DB 45 $7f, $7f, $7f,   ; $c1dd: 45 $7f, $7f, $7f,   Data
;            .DB $7f, $64, $6b, $7f,   ; $c1e1: $7f, $64, $6b, $7f,   Data
;            .DB $7f, $7f, $7f, $7f,   ; $c1e5: $7f, $7f, $7f, $7f,   Data
;            .DB $7f, $7f, $7f, $7f,   ; $c1e9: $7f, $7f, $7f, $7f,   Data
;            .DB $7f, $6c, $60, $61,   ; $c1ed: $7f, $6c, $60, $61,   Data
;            .DB $61, $61, $61, $61,   ; $c1f1: $61, $61, $61, $61,   Data
;            .DB $62, $2b, $28,
;            .DB 22 $2a,
; 20
;            .DB $28, $63,   ; $c1f9: $2a, 20 $28, $63,   Data
;            .DB $7f, 53 54 55   ; $c1fd: $7f, 53 54 55   Data
;            .DB 00 00 00 $7f,   ; $c201: 00 00 00 $7f,   Data
;            .DB $64, $6b, $7f, $7f,   ; $c205: $64, $6b, $7f, $7f,   Data
;            .DB $7f, $7f, $7f, $7f,   ; $c209: $7f, $7f, $7f, $7f,   Data
;            .DB $7f, $7f, $7f, $7f,   ; $c20d: $7f, $7f, $7f, $7f,   Data
;            .DB $6c, $63, 15 0e   ; $c211: $6c, $63, 15 0e   Data
;            .DB 1f 0e 15 $64,   ; $c215: 1f 0e 15 $64,   Data
;            .DB $2b, $2a,
;            .DB 22 a0   ; $c219: $2b, $2a, 22 a0   Data
;            .DB 20
;            .DB $28, $63, $7f,   ; $c21d: 20 $28, $63, $7f,   Data
;            .DB 4c 4d 4e $7f,   ; $c221: 4c 4d 4e $7f,   Data
;            .DB $7f, $7f, $7f, $64,   ; $c225: $7f, $7f, $7f, $64,   Data
;            .DB $6b, $7f, $7f, $7f,   ; $c229: $6b, $7f, $7f, $7f,   Data
;            .DB $7f, $7f, $7f, $7f,   ; $c22d: $7f, $7f, $7f, $7f,   Data
;            .DB $7f, $7f, $7f, $6c,   ; $c231: $7f, $7f, $7f, $6c,   Data
;            .DB $63, $7f, $7f, $7f,   ; $c235: $63, $7f, $7f, $7f,   Data
;            .DB $7f, $7f, $64, $28,   ; $c239: $7f, $7f, $64, $28,   Data
;            .DB $2b,
;            .DB 22 c0
;  20   ; $c23d: $2b, 22 c0 20   Data
;            .DB $2b, $63, $7f, 5c   ; $c241: $2b, $63, $7f, 5c   Data
;            .DB 5d 5e 00 00   ; $c245: 5d 5e 00 00   Data
;            .DB 00 $7f, $64, $6b,   ; $c249: 00 $7f, $64, $6b,   Data
;            .DB $7f, $7f, $7f, $7f,   ; $c24d: $7f, $7f, $7f, $7f,   Data
;            .DB $7f, $7f, $7f, $7f,   ; $c251: $7f, $7f, $7f, $7f,   Data
;            .DB $7f, $7f, $6c, $65,   ; $c255: $7f, $7f, $6c, $65,   Data
;            .DB $66, $66, $66, $66,   ; $c259: $66, $66, $66, $66,   Data
;            .DB $66, $67, $2a, $2b,   ; $c25d: $66, $67, $2a, $2b,   Data
;            .DB 22 e0
; 20
;            .DB $28,   ; $c261: 22 e0 20 $28,   Data
;            .DB $63, $7f, $7f, $7f,   ; $c265: $63, $7f, $7f, $7f,   Data
;            .DB $7f, $7f, $7f, $7f,   ; $c269: $7f, $7f, $7f, $7f,   Data
;            .DB $7f, $64, $6b, $7f,   ; $c26d: $7f, $64, $6b, $7f,   Data
;            .DB $7f, $7f, $7f, $7f,   ; $c271: $7f, $7f, $7f, $7f,   Data
;            .DB $7f, $7f, $7f, $7f,   ; $c275: $7f, $7f, $7f, $7f,   Data
;            .DB $7f, $6c, $2b, $2a,   ; $c279: $7f, $6c, $2b, $2a,   Data
;            .DB 75 $28, $2b, $29,   ; $c27d: 75 $28, $2b, $29,   Data
;            .DB $2a, $28, $28,
;            .DB 23 00 
;20;
;            .DB $2b, $63,   ; $c285: 00 20 $2b, $63,   Data
;            .DB $7f, 64 65 66   ; $c289: $7f, 64 65 66   Data
;            .DB 00 00 00 $7f,   ; $c28d: 00 00 00 $7f,   Data
;            .DB $64, $6b, $7f, $7f,   ; $c291: $64, $6b, $7f, $7f,   Data
;            .DB $7f, $7f, $7f, $7f,   ; $c295: $7f, $7f, $7f, $7f,   Data
;            .DB $7f, $7f, $7f, $7f,   ; $c299: $7f, $7f, $7f, $7f,   Data
;            .DB $6c, 74 $28, $28,   ; $c29d: $6c, 74 $28, $28,   Data
;            .DB $2a, $2b, $28, $2b,   ; $c2a1: $2a, $2b, $28, $2b,   Data
;            .DB $2a, $2a,
;            .DB 23 20   ; $c2a5: $2a, $2a, 23 20   Data
;            .DB 20
;            .DB $2b, $63, $7f,   ; $c2a9: 20 $2b, $63, $7f,   Data
;            .DB $7f, $7f, $7f, $7f,   ; $c2ad: $7f, $7f, $7f, $7f,   Data
;            .DB $7f, $7f, $7f, $64,   ; $c2b1: $7f, $7f, $7f, $64,   Data
;            .DB $6b, $7f, $7f, $7f,   ; $c2b5: $6b, $7f, $7f, $7f,   Data
;            .DB $7f, $7f, $7f, $7f,   ; $c2b9: $7f, $7f, $7f, $7f,   Data
;            .DB $7f, $7f, $7f, $6c,   ; $c2bd: $7f, $7f, $7f, $6c,   Data
;            .DB $28, $2a, $2a, $2b,   ; $c2c1: $28, $2a, $2a, $2b,   Data
;            .DB $28, $29, $28, $29,   ; $c2c5: $28, $29, $28, $29,   Data
;            .DB $28,
;            .DB 23 40
; 20   ; $c2c9: $28, 23 40 20   Data
;            .DB $28, $65, $66, $66,   ; $c2cd: $28, $65, $66, $66,   Data
;            .DB $66, $66, $66, $66,   ; $c2d1: $66, $66, $66, $66,   Data
;            .DB $66, $66, $67, 35   ; $c2d5: $66, $66, $67, 35   Data
;            .DB 36 36 36 36   ; $c2d9: 36 36 36 36   Data
;            .DB 36 36 36 36   ; $c2dd: 36 36 36 36   Data
;            .DB 36 36 37 $2b,   ; $c2e1: 36 36 37 $2b,   Data
;            .DB $2c, $2b, $28, $2b,   ; $c2e5: $2c, $2b, $28, $2b,   Data
;            .DB $28, $2a, $28, $2b,   ; $c2e9: $28, $2a, $28, $2b,   Data
;            .DB 23 60
;            .DB 20
;            .DB $2b,   ; $c2ed: 23 60 20 $2b,   Data
;            .DB $2b, $2a, 75 $28,   ; $c2f1: $2b, $2a, 75 $28,   Data
;            .DB $29, $2a, $28, $2b,   ; $c2f5: $29, $2a, $28, $2b,   Data
;            .DB $2a, $2b, $2a, $2b,   ; $c2f9: $2a, $2b, $2a, $2b,   Data
;            .DB $2b, $29, $28, $29,   ; $c2fd: $2b, $29, $28, $29,   Data
;            .DB $2a, $28, $2a, $2a,   ; $c301: $2a, $28, $2a, $2a,   Data
;            .DB $2a, $28, $2b, $2a,   ; $c305: $2a, $28, $2b, $2a,   Data
;            .DB $28, $2a, $2b, $2b,   ; $c309: $28, $2a, $2b, $2b,   Data
;            .DB $2a, $2a, $28,
;            .DB 23 $2a,
; 20
;            .DB $2b, $2a,   ; $c311: $2a, 20 $2b, $2a,   Data
;            .DB $2b, $28, $2b, $28,   ; $c315: $2b, $28, $2b, $28,   Data
;            .DB $2b, $29, $28, $2b,   ; $c319: $2b, $29, $28, $2b,   Data
;            .DB $2a, $28, $2b, $2b,   ; $c31d: $2a, $28, $2b, $2b,   Data
;            .DB $2b, $2b, $28, $2b,   ; $c321: $2b, $2b, $28, $2b,   Data
;            .DB $2c, $2b, $29, $28,   ; $c325: $2c, $2b, $29, $28,   Data
;            .DB $2b, $2a, $28, $2a,   ; $c329: $2b, $2a, $28, $2a,   Data
;            .DB $2b, $28, $2b, $2a,   ; $c32d: $2b, $28, $2b, $2a,   Data
;            .DB $2a, $2a,
;            .DB 23 a0   ; $c331: $2a, $2a, 23 a0   Data
;            .DB 20
;            .DB $2a, $28, $28,   ; $c335: 20 $2a, $28, $28,   Data
;            .DB $2a, $2a, $28, $2b,   ; $c339: $2a, $2a, $28, $2b,   Data
;            .DB $28, $2a, $2a, $28,   ; $c33d: $28, $2a, $2a, $28,   Data
;            .DB $2b, $28, $2b, $28,   ; $c341: $2b, $28, $2b, $28,   Data
;            .DB $2b, $29, $28, $2a,   ; $c345: $2b, $29, $28, $2a,   Data
;            .DB $28, $2b, $2b, $2a,   ; $c349: $28, $2b, $2b, $2a,   Data
;            .DB $2a, $28, $2b, $2b,   ; $c34d: $2a, $28, $2b, $2b,   Data
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