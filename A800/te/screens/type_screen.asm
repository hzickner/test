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
	.DB $ab, $ab, $38, $39
	.DB $39, $39, $39, $39
	.DB $39, $39, $39, $3a
	.DB $a9, $a8, $ab
;            .DB 21 00
	.DB >(scr_mem+7*32), <(scr_mem+7*32)
	.DB $20			; control byte: VRAM line, ptr inc, $32,bytes of data
	.DB $aa, $a8
	.DB $aa, $a8, $aa, $aa
	.DB $a8, $3b, $7f, $0a
	.DB $24, $1d, $22, $19
	.DB $0e, $7f, $3c, $ab
	.DB $a8, $3b, $7f, $0b
	.DB $24, $1d, $22, $19
	.DB $0e, $7f, $3c, $a8
	.DB $aa, $ab
;            .DB 21 20   ; $b7b3: $aa, $ab, 21 20   Data
	.DB >(scr_mem+8*32), <(scr_mem+8*32)
	.DB $20			; control byte: VRAM line, ptr inc, $32,bytes of data
	.DB $a9, $a8, $ab
	.DB $aa, $aa, $ab, $ab
	.DB $3d, $3e, $3e, $3e
	.DB $3e, $3e, $3e, $3e
	.DB $3e, $3f, $aa, $a8
	.DB $3d, $3e, $3e, $3e
	.DB $3e, $3e, $3e, $3e
	.DB $3e, $3f, $a9, $a8
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
;            .DB 20
;            .DB $ab, $a8,   ; $b81f: $aa, 20 $ab, $a8,   Data
;            .DB $ab, $30, $31, $31,   ; $b823: $ab, $30, $31, $31,   Data
;            .DB $31, $31, $31, $31,   ; $b827: $31, $31, $31, $31,   Data
;            .DB $31, $31, $31, $31,   ; $b82b: $31, $31, $31, $31,   Data
;            .DB $31, $31, $32, $aa,   ; $b82f: $31, $31, $32, $aa,   Data
;            .DB $aa, $a8, $ab, $a8,   ; $b833: $aa, $a8, $ab, $a8,   Data
;            .DB $ab, $a8, $a8, $aa,   ; $b837: $ab, $a8, $a8, $aa,   Data
;            .DB $ab, $a9, $a8, $aa,   ; $b83b: $ab, $a9, $a8, $aa,   Data
;            .DB $ab, $a8,
;            .DB 21 $aa,   ; $b83f: $ab, $a8, 21 $aa,   Data
;            .DB 20
;            .DB $ab, $aa, $ab,   ; $b843: 20 $ab, $aa, $ab,   Data
;            .DB 33 ff 16 1e   ; $b847: 33 ff 16 1e   Data
;            .DB 1c 12 0c ff   ; $b84b: 1c 12 0c ff   Data
;            .DB 1d 22 19 0e   ; $b84f: 1d 22 19 0e   Data
;            .DB ff 34 $aa, $a9,   ; $b853: ff 34 $aa, $a9,   Data
;            .DB $a8, $aa, $ab, $ab,   ; $b857: $a8, $aa, $ab, $ab,   Data
;            .DB $aa, $aa, $ab, $a8,   ; $b85b: $aa, $aa, $ab, $a8,   Data
;            .DB $ab, $a9, $a8, $aa,   ; $b85f: $ab, $a9, $a8, $aa,   Data
;            .DB $a8,
;            .DB 21 c0
;            .DB 20   ; $b863: $a8, 21 c0 20   Data
;            .DB $aa, $a8, $a8, 35   ; $b867: $aa, $a8, $a8, 35   Data
;            .DB 36 36 36 36   ; $b86b: 36 36 36 36   Data
;            .DB 36 36 36 36   ; $b86f: 36 36 36 36   Data
;            .DB 36 36 36 36   ; $b873: 36 36 36 36   Data
;            .DB 37 $ab, $a8, $aa,   ; $b877: 37 $ab, $a8, $aa,   Data
;            .DB $ab, $a8, $ab, $ac,   ; $b87b: $ab, $a8, $ab, $ac,   Data
;            .DB $ab, $a8, $ab, $a8,   ; $b87f: $ab, $a8, $ab, $a8,   Data
;            .DB $ab, $aa, $aa, $ab,   ; $b883: $ab, $aa, $aa, $ab,   Data
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
;            .DB 20
;            .DB $aa, $a8,   ; $b8ab: 00 20 $aa, $a8,   Data
;            .DB $aa, $aa, $a8, $a8,   ; $b8af: $aa, $aa, $a8, $a8,   Data
;            .DB $ab, $a8, $aa, $aa,   ; $b8b3: $ab, $a8, $aa, $aa,   Data
;            .DB $ab, $ab, 28 29   ; $b8b7: $ab, $ab, 28 29   Data
;            .DB 29 29 29 29   ; $b8bb: 29 29 29 29   Data
;            .DB 29 29 29 29   ; $b8bf: 29 29 29 29   Data
;            .DB 29 2a $aa, $aa,   ; $b8c3: 29 2a $aa, $aa,   Data
;            .DB $aa, $a8, $ac, $ab,   ; $b8c7: $aa, $a8, $ac, $ab,   Data
;            .DB $aa, $a8,
;            .DB 22 20   ; $b8cb: $aa, $a8, 22 20   Data
;            .DB 20
;            .DB $aa, $a8, $ac,   ; $b8cf: 20 $aa, $a8, $ac,   Data
;            .DB $ab, $ab, $ab, $aa,   ; $b8d3: $ab, $ab, $ab, $aa,   Data
;            .DB $aa, $a8, $ab, $a8,   ; $b8d7: $aa, $a8, $ab, $a8,   Data
;            .DB $ab, 2b ff ff   ; $b8db: $ab, 2b ff ff   Data
;            .DB ff ff ff ff   ; $b8df: ff ff ff ff   Data
;            .DB ff ff ff ff   ; $b8e3: ff ff ff ff   Data
;            .DB 2c $aa, $aa, $aa,   ; $b8e7: 2c $aa, $aa, $aa,   Data
;            .DB $a8, $aa, $a8, $aa,   ; $b8eb: $a8, $aa, $a8, $aa,   Data
;            .DB $aa,
;            .DB 22 $a9,
;            .DB 20   ; $b8ef: $aa, 22 $a9, 20   Data
;            .DB $ab, $ab, $aa, $a8,   ; $b8f3: $ab, $ab, $aa, $a8,   Data
;            .DB $ab, $a9, $a8, $a9,   ; $b8f7: $ab, $a9, $a8, $a9,   Data
;            .DB $a8, $a9, $a8, $ab,   ; $b8fb: $a8, $a9, $a8, $ab,   Data
;            .DB 2b ff 16 1e   ; $b8ff: 2b ff 16 1e   Data
;            .DB 1c 12 0c 53   ; $b903: 1c 12 0c 53   Data
;            .DB 54 01 ff 2c   ; $b907: 54 01 ff 2c   Data
;            .DB $ab, $aa, $ab, $ac,   ; $b90b: $ab, $aa, $ab, $ac,   Data
;            .DB $ab, $a9, $aa, $a8,   ; $b90f: $ab, $a9, $aa, $a8,   Data
;            .DB 22 $ac,
;            .DB 20
;            .DB $a8,   ; $b913: 22 $ac, 20 $a8,   Data
;            .DB $aa, $ab, $ab, $ab,   ; $b917: $aa, $ab, $ab, $ab,   Data
;            .DB $a8, $ab, $ab, $ab,   ; $b91b: $a8, $ab, $ab, $ab,   Data
;            .DB $a8, $ab, $a8, 2b   ; $b91f: $a8, $ab, $a8, 2b   Data
;            .DB ff ff ff ff   ; $b923: ff ff ff ff   Data
;            .DB ff ff ff ff   ; $b927: ff ff ff ff   Data
;            .DB ff ff 2c $aa,   ; $b92b: ff ff 2c $aa,   Data
;            .DB $ab, $ab, $aa, $a8,   ; $b92f: $ab, $ab, $aa, $a8,   Data
;            .DB $a8, $ab, $ab,
;            .DB 22 $aa,
;            .DB 20
;            .DB $a8, $ab,   ; $b937: $aa, 20 $a8, $ab,   Data
;            .DB $a8, $ab, $a8, $a9,   ; $b93b: $a8, $ab, $a8, $a9,   Data
;            .DB $a8, $a8, $a9, $a8,   ; $b93f: $a8, $a8, $a9, $a8,   Data
;            .DB $aa, $ab, 2b ff   ; $b943: $aa, $ab, 2b ff   Data
;            .DB 16 1e 1c 12   ; $b947: 16 1e 1c 12   Data
;            .DB 0c 53 54 02   ; $b94b: 0c 53 54 02   Data
;            .DB ff 2c $ab, $a8,   ; $b94f: ff 2c $ab, $a8,   Data
;            .DB $a8, $ab, $ac, $ab,   ; $b953: $a8, $ab, $ac, $ab,   Data
;            .DB $ab, $aa,
;            .DB 22 $aa,   ; $b957: $ab, $aa, 22 $aa,   Data
;            .DB 20
;            .DB $a8, $a9, $a8,   ; $b95b: 20 $a8, $a9, $a8,   Data
;            .DB $aa, $a8, $a8, $ac,   ; $b95f: $aa, $a8, $a8, $ac,   Data
;            .DB $ab, $a8, $ac, $ab,   ; $b963: $ab, $a8, $ac, $ab,   Data
;            .DB $a8, 2b ff ff   ; $b967: $a8, 2b ff ff   Data
;            .DB ff ff ff ff   ; $b96b: ff ff ff ff   Data
;            .DB ff ff ff ff   ; $b96f: ff ff ff ff   Data
;            .DB 2c $a9, $a8, $aa,   ; $b973: 2c $a9, $a8, $aa,   Data
;            .DB $ab, $aa, $a8, $aa,   ; $b977: $ab, $aa, $a8, $aa,   Data
;            .DB $a8,
;            .DB 22 c0
;            .DB 20   ; $b97b: $a8, 22 c0 20   Data
;            .DB $ab, $a8, $aa, $aa,   ; $b97f: $ab, $a8, $aa, $aa,   Data
;            .DB $aa, $a8, $aa, $a8,   ; $b983: $aa, $a8, $aa, $a8,   Data
;            .DB $ab, $aa, $a8, $ab,   ; $b987: $ab, $aa, $a8, $ab,   Data
;            .DB 2b ff 16 1e   ; $b98b: 2b ff 16 1e   Data
;            .DB 1c 12 0c 53   ; $b98f: 1c 12 0c 53   Data
;            .DB 54 03 ff 2c   ; $b993: 54 03 ff 2c   Data
;            .DB $a8, $a9, $a8, $a8,   ; $b997: $a8, $a9, $a8, $a8,   Data
;            .DB $ab, $aa, $aa, $ab,   ; $b99b: $ab, $aa, $aa, $ab,   Data
;            .DB 22 e0
;            .DB 20
;            .DB $a8,   ; $b99f: 22 e0 20 $a8,   Data
;            .DB $a9, $aa, $a8, $aa,   ; $b9a3: $a9, $aa, $a8, $aa,   Data
;            .DB $aa, $ab, $aa, $ab,   ; $b9a7: $aa, $ab, $aa, $ab,   Data
;            .DB $aa, $aa, $a8, 2b   ; $b9ab: $aa, $aa, $a8, 2b   Data
;            .DB ff ff ff ff   ; $b9af: ff ff ff ff   Data
;            .DB ff ff ff ff   ; $b9b3: ff ff ff ff   Data
;            .DB ff ff 2c $aa,   ; $b9b7: ff ff 2c $aa,   Data
;            .DB $a8, $aa, $aa, $a8,   ; $b9bb: $a8, $aa, $aa, $a8,   Data
;            .DB $a9, $a8, $a8,
;            .DB 23 00
;            .DB 20
;            .DB $ab, $a8,   ; $b9c3: 00 20 $ab, $a8,   Data
;            .DB $aa, $a9, $a8, $ab,   ; $b9c7: $aa, $a9, $a8, $ab,   Data
;            .DB $a8, $ab, $a8, $aa,   ; $b9cb: $a8, $ab, $a8, $aa,   Data
;            .DB $aa, $ab, 2b ff   ; $b9cf: $aa, $ab, 2b ff   Data
;            .DB ff ff 18 0f   ; $b9d3: ff ff 18 0f   Data
;            .DB 0f ff ff ff   ; $b9d7: 0f ff ff ff   Data
;            .DB ff 2c $aa, $aa,   ; $b9db: ff 2c $aa, $aa,   Data
;            .DB $aa, $a8, $aa, $a8,   ; $b9df: $aa, $a8, $aa, $a8,   Data
;            .DB $ac, $ab,
;            .DB 23 20   ; $b9e3: $ac, $ab, 23 20   Data
;            .DB 20
;            .DB $a8, $ac, $ab,   ; $b9e7: 20 $a8, $ac, $ab,   Data
;            .DB $a8, $a9, $a8, $aa,   ; $b9eb: $a8, $a9, $a8, $aa,   Data
;            .DB $aa, $a8, $ab, $ab,   ; $b9ef: $aa, $a8, $ab, $ab,   Data
;            .DB $a8, 2b ff ff   ; $b9f3: $a8, 2b ff ff   Data
;            .DB ff ff ff ff   ; $b9f7: ff ff ff ff   Data
;            .DB ff ff ff ff   ; $b9fb: ff ff ff ff   Data
;            .DB 2c $ac, $ab, $ab,   ; $b9ff: 2c $ac, $ab, $ab,   Data
;            .DB $ab, $aa, $ab, $aa,   ; $ba03: $ab, $aa, $ab, $aa,   Data
;            .DB $a8,
;            .DB 23 $a9,
;            .DB 20   ; $ba07: $a8, 23 $a9, 20   Data
;            .DB $ab, $aa, $a8, $ab,   ; $ba0b: $ab, $aa, $a8, $ab,   Data
;            .DB $a8, $a9, $aa, $a8,   ; $ba0f: $a8, $a9, $aa, $a8,   Data
;            .DB $ab, $ab, $a9, $a8,   ; $ba13: $ab, $ab, $a9, $a8,   Data
;            .DB 2d 2e 2e 2e   ; $ba17: 2d 2e 2e 2e   Data
;            .DB 2e 2e 2e 2e   ; $ba1b: 2e 2e 2e 2e   Data
;            .DB 2e 2e 2e 2f   ; $ba1f: 2e 2e 2e 2f   Data
;            .DB $aa, $a8, $ab, $a9,   ; $ba23: $aa, $a8, $ab, $a9,   Data
;            .DB $a8, $ab, $aa, $aa,   ; $ba27: $a8, $ab, $aa, $aa,   Data
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
