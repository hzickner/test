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
	.DB $02, $00, $03, $00
	.DB $02, $02, $00, $00
	.DB $04, $03, $00, $02
	.DB $00, $01, $00, $01
	.DB $00, $02, $02, $03
	.DB $02, $00, $03, $01
	.DB $00, $03, $03, $02
	.DB $02, $02, $00, $00
;            .DB 20 $01,         ; PPU address (screen0, line 2)
	.DB >(scr_mem+1*32), <(scr_mem+1*32)
	.DB $20			; control byte: VRAM line, ptr inc, 32bytes of data
	.DB $02
	.DB $02, $00, $02, $01
	.DB $00, $01, $00, $02
	.DB $00, $02, $02, $03
	.DB $03, $03, $00, $03
	.DB $04, $03, $00, $03
	.DB $02, $00, $00, $03
	.DB $00, $02, $00, $7f
	.DB $04, $03, $03
;            .DB 20 $04,         ; PPU address (screen0, line 3)
	.DB >(scr_mem+2*32), <(scr_mem+2*32)
	.DB $20			; control byte: VRAM line, ptr inc, 32bytes of data
	.DB $01, $02
	.DB $00, $03, $00, $02
	.DB $00, $7f, $02, $02
	.DB $02, $00, $00, $00
	.DB $03, $02, $03, $02
	.DB $00, $01, $00, $7f
	.DB $7f, $02, $02, $00
	.DB $7f, $7f, $7f, $02
	.DB $00, $01
;            .DB 20 $02,         ; PPU address (screen0, line 4)
	.DB >(scr_mem+3*32), <(scr_mem+3*32)
	.DB $20			; control byte: VRAM line, ptr inc, 32bytes of data
	.DB $00, $03, $02
	.DB $02, $00, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $02, $00
	.DB $7f, $00, $7f, $7f
	.DB $00, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $03
	.DB $00
;            .DB 20 $02,         ; PPU address (screen0, line 5)
	.DB >(scr_mem+4*32), <(scr_mem+4*32)
	.DB $20			; control byte: VRAM line, ptr inc, 32bytes of data
	.DB $01, $00, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $02, $03
;            .DB 20 c0         ; PPU address (screen0, line 6)
;	.DB >(scr_mem+6*32), <(scr_mem+6*32)
;	.DB $20			; control byte: VRAM line, ptr inc, 32bytes of data
;	.DB $00,   ; $b2eb: 20 c0 20 $00,   Data
;	.DB $7f, $7f, c3 c4   ; $b2ef: $7f, $7f, c3 c4   Data
;	.DB c5 c6 c7 c5   ; $b2f3: c5 c6 c7 c5   Data
;	.DB c8 c9 ca c3   ; $b2f7: c8 c9 ca c3   Data
;            .DB c4 c5 c6 c7   ; $b2fb: c4 c5 c6 c7   Data
;            .DB c5 bc c0 c1   ; $b2$7f,: c5 bc c0 c1   Data
;            .DB c5 $7f, cb cc   ; $b303: c5 $7f, cb cc   Data
;            .DB be bf b0 b1   ; $b307: be bf b0 b1   Data
;            .DB $7f, $03, $00,
;            .DB 20 e0         ; PPU address (screen0, line 7)
;            .DB 20
;            .DB $01, $00,   ; $b30f: e0 20 $01, $00,   Data
;            .DB $7f, d3 d4 d5   ; $b313: $7f, d3 d4 d5   Data
;            .DB d6 d7 d5 $7f,   ; $b317: d6 d7 d5 $7f,   Data
;            .DB d9 da d3 d4   ; $b31b: d9 da d3 d4   Data
;            .DB d5 d6 d7 d5   ; $b31f: d5 d6 d7 d5   Data
;            .DB 9c d0 d1 d5   ; $b323: 9c d0 d1 d5   Data
;            .DB $7f, e8 e9 ce   ; $b327: $7f, e8 e9 ce   Data
;            .DB cf $7f, $7f, $7f,   ; $b32b: cf $7f, $7f, $7f,   Data
;            .DB $03, $03,
;            .DB 21 00         ; PPU address (screen0, line 8)
;            .DB 20
;            .DB $03, $7f, $7f,   ; $b333: 20 $03, $7f, $7f,   Data
;            .DB e3 $7f, d5 $7f,   ; $b337: e3 $7f, d5 $7f,   Data
;            .DB e7 d5 $7f, c2   ; $b33b: e7 d5 $7f, c2   Data
;            .DB ea e3 $7f, d5   ; $b33f: ea e3 $7f, d5   Data
;            .DB $7f, e7 d5 9c   ; $b3$01,: $7f, e7 d5 9c   Data
;            .DB e0 e1 d5 $7f,   ; $b347: e0 e1 d5 $7f,   Data
;            .DB af fd 5c df   ; $b34b: af fd 5c df   Data
;            .DB $7f, $7f, $7f, $03,   ; $b34f: $7f, $7f, $7f, $03,   Data
;            .DB $03,
;            .DB 21 20         ; PPU address (screen0, line 9)
;            .DB 20   ; $b353: $03, 21 20 20   Data
;            .DB $00, $7f, $7f, $7f,   ; $b357: $00, $7f, $7f, $7f,   Data
;            .DB $7f, d5 $7f, $7f,   ; $b35b: $7f, d5 $7f, $7f,   Data
;            .DB d5 e4 d2 $7f,   ; $b35f: d5 e4 d2 $7f,   Data
;            .DB $7f, $7f, d5 $7f,   ; $b363: $7f, $7f, d5 $7f,   Data
;            .DB $7f, d5 ac f0   ; $b367: $7f, d5 ac f0   Data
;            .DB f1 d5 $7f, b3   ; $b36b: f1 d5 $7f, b3   Data
;            .DB fd 6c 7e $7f,   ; $b36f: fd 6c 7e $7f,   Data
;            .DB $7f, $03, $00, $03,   ; $b3$00,: $7f, $03, $00, $03,   Data
;            .DB 21 $01,         ; PPU address (screen0, line 10)
;            .DB 20
;            .DB $01,   ; $b377: 21 $01, 20 $01,   Data
;            .DB $02, $00, $7f, $7f,   ; $b37b: $02, $00, $7f, $7f,   Data
;            .DB d5 $7f, $7f, d5   ; $b37f: d5 $7f, $7f, d5   Data
;            .DB f4 e2 $7f, $7f,   ; $b3$00,: f4 e2 $7f, $7f,   Data
;            .DB $7f, d5 $7f, $7f,   ; $b387: $7f, d5 $7f, $7f,   Data
;            .DB d5 7c $7f, $7f,   ; $b38b: d5 7c $7f, $7f,   Data
;            .DB d5 $7f, 7d 5d   ; $b38f: d5 $7f, 7d 5d   Data
;            .DB fd a3 $7f, $7f,   ; $b393: fd a3 $7f, $7f,   Data
;            .DB $02, $03, $00,
;            .DB 21 $04,         ; PPU address (screen0, line 11)
;            .DB 20
;            .DB $00, $03,   ; $b39b: $04, 20 $00, $03,   Data
;            .DB $7f, $7f, $7f, d5   ; $b39f: $7f, $7f, $7f, d5   Data
;            .DB $7f, $7f, d5 $7f,   ; $b3a3: $7f, $7f, d5 $7f,   Data
;            .DB f2 cd $7f, $7f,   ; $b3a7: f2 cd $7f, $7f,   Data
;            .DB d5 $7f, $7f, d5   ; $b3ab: d5 $7f, $7f, d5   Data
;            .DB 8c 8d $7f, d5   ; $b3af: 8c 8d $7f, d5   Data
;            .DB $7f, 8c 6d fd   ; $b3b3: $7f, 8c 6d fd   Data
;            .DB 7f $7f, $7f, $7f,   ; $b3b7: 7f $7f, $7f, $7f,   Data
;            .DB $00, $03,
;            .DB 21 $02,         ; PPU address (screen0, line 12)
;            .DB 20
;            .DB $02, $01, $00,   ; $b3bf: 20 $02, $01, $00,   Data
;            .DB $7f, $7f, d5 $7f,   ; $b3c3: $7f, $7f, d5 $7f,   Data
;            .DB $7f, d5 $7f, dc   ; $b3c7: $7f, d5 $7f, dc   Data
;            .DB dd $7f, $7f, d5   ; $b3cb: dd $7f, $7f, d5   Data
;            .DB $7f, $7f, d5 9c   ; $b3cf: $7f, $7f, d5 9c   Data
;            .DB 9d $7f, d5 $7f,   ; $b3d3: 9d $7f, d5 $7f,   Data
;            .DB 9c 9d 8e 8f   ; $b3d7: 9c 9d 8e 8f   Data
;            .DB $7f, $7f, $7f, $03,   ; $b3db: $7f, $7f, $7f, $03,   Data
;            .DB $01,
;            .DB 21 $02,         ; PPU address (screen0, line 13)
;            .DB 20   ; $b3df: $01, 21 $02, 20   Data
;            .DB $00, $00, $7f, $7f,   ; $b3e3: $00, $00, $7f, $7f,   Data
;            .DB $7f, e5 $7f, $7f,   ; $b3e7: $7f, e5 $7f, $7f,   Data
;            .DB e5 eb ec ed   ; $b3eb: e5 eb ec ed   Data
;            .DB $7f, $7f, e5 $7f,   ; $b3ef: $7f, $7f, e5 $7f,   Data
;            .DB $7f, e5 ac ad   ; $b3f3: $7f, e5 ac ad   Data
;            .DB ae e5 $7f, ac   ; $b3f7: ae e5 $7f, ac   Data
;            .DB ad 9e 9f $7f,   ; $b3fb: ad 9e 9f $7f,   Data
;            .DB $7f, $7f, $03, $00,   ; $b3$7f,: $7f, $7f, $03, $00,   Data
;            .DB 21 c0         ; PPU address (screen0, line 14)
	.DB >(scr_mem+13*32), <(scr_mem+13*32)
	.DB $20			; control byte: VRAM line, ptr inc, 32bytes of data
	.DB $04
	.DB $03, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $02, $00
;            .DB 21 e0         ; PPU address (screen0, line 15)
	.DB >(scr_mem+14*32), <(scr_mem+14*32)
	.DB $20			; control byte: VRAM line, ptr inc, 32bytes of data
	.DB $02, $00
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $02
	.DB $02, $03
;            .DB 22 00         ; PPU address (screen0, line 16)
	.DB >(scr_mem+15*32), <(scr_mem+15*32)
	.DB $20			; control byte: VRAM line, ptr inc, 32bytes of data
	.DB $01, $00, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $60, $61, $7f, $7f
	.DB $7f, $02, $01, $00
	.DB $00
;            .DB 22 20         ; PPU address (screen0, line 17)
	.DB >(scr_mem+16*32), <(scr_mem+16*32)
	.DB $20			; control byte: VRAM line, ptr inc, 32bytes of data
	.DB $03, $03, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $31, $7f, $32
	.DB $33, $7f, $34, $7f
	.DB $7f, $00, $02, $03
;            .DB 22 $01,         ; PPU address (screen0, line 18)
	.DB >(scr_mem+17*32), <(scr_mem+17*32)
	.DB $20			; control byte: VRAM line, ptr inc, 32bytes of data
	.DB $00
	.DB $02, $03, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $59, $5a, $5b, $5c
	.DB $7f, $5d, $5e, $7f
	.DB $7f, $03, $03
;            .DB 22 $04,         ; PPU address (screen0, line 19)
	.DB >(scr_mem+18*32), <(scr_mem+18*32)
	.DB $20			; control byte: VRAM line, ptr inc, 32bytes of data
	.DB $02, $03
	.DB $00, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $51, $52
	.DB $53, $54, $55, $56
	.DB $57, $58, $7f, $01
	.DB $00, $00
;            .DB 22 $02,         ; PPU address (screen0, line 20)
	.DB >(scr_mem+19*32), <(scr_mem+19*32)
	.DB $20			; control byte: VRAM line, ptr inc, 32bytes of data
	.DB $03, $01, $00
	.DB $7f, $7f, $7f, $7f
	.DB $62, $63, $64, $65
	.DB $7f, $64, $66, $67
	.DB $68, $66, $7f, $7f
	.DB $7f, $09, $0a, $0b
	.DB $0c, $0d, $0e, $0f
	.DB $10, $7f, $00, $01
	.DB $00
;	.DB 22 $02,         ; PPU address (screen0, line 21)
	.DB >(scr_mem+20*32), <(scr_mem+20*32)
	.DB $20			; control byte: VRAM line, ptr inc, 32bytes of data
	.DB $03, $00, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $29, $2a, $2b, $2c
	.DB $2d, $2e, $2f, $30
	.DB $7f, $7f, $03, $02
;            .DB 22 c0         ; PPU address (screen0, line 22)
	.DB >(scr_mem+21*32), <(scr_mem+21*32)
	.DB $20			; control byte: VRAM line, ptr inc, 32bytes of data
	.DB $02
	.DB $00, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $c9
	.DB $ca, $cb, $cc, $cd
	.DB $ce, $cf, $d0, $7f
	.DB $7f, $00, $03
;            .DB 22 e0         ; PPU address (screen0, line 23)
	.DB >(scr_mem+22*32), <(scr_mem+22*32)
	.DB $20			; control byte: VRAM line, ptr inc, 32bytes of data
	.DB $02, $02
	.DB $00, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $69, $6a
	.DB $6b, $6c, $6d
	.DB $6e, $6f, $70, $7f, $7f
	.DB $01, $00
;            .DB 23 00         ; PPU address (screen0, line 24)
	.DB >(scr_mem+23*32), <(scr_mem+23*32)
	.DB $20			; control byte: VRAM line, ptr inc, 32bytes of data
	.DB $03, $03, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $00
	.DB $03
;            .DB 23 20         ; PPU address (screen0, line 25)
	.DB >(scr_mem+24*32), <(scr_mem+24*32)
	.DB $20			; control byte: VRAM line, ptr inc, 32bytes of data
	.DB $00, $03, $7f, $02
	.DB $01, $00, $7f, $7f
	.DB $7f, $74, $75, $71
	.DB $73, $72, $73, $7f
	.DB $7f, $76, $77, $78
	.DB $79, $7a, $7b, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $02, $02, $00
;	.DB 23 $01,         ; PPU address (screen0, line 26)
	.DB >(scr_mem+25*32), <(scr_mem+25*32)
	.DB $20			; control byte: VRAM line, ptr inc, 32bytes of data
	.DB $03
	.DB $03, $7f, $7f, $00
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $7f, $7f, $7f
	.DB $7f, $03, $7f, $7f
	.DB $7f, $04, $03
;            .DB 23 $04,         ; PPU address (screen0, line 27)
	.DB >(scr_mem+26*32), <(scr_mem+26*32)
	.DB $20			; control byte: VRAM line, ptr inc, 32bytes of data
	.DB $00, $00
	.DB $03, $7f, $7f, $7f
	.DB $02, $03, $7f, $7f
	.DB $7f, $7f, $03, $02
	.DB $02, $03, $7f, $01
	.DB $00, $01, $00, $03
	.DB $7f, $03, $03, $02
	.DB $03, $01, $02, $00
	.DB $02, $00
;            .DB 23 $02,         ; PPU address (screen0, line 28)
	.DB >(scr_mem+27*32), <(scr_mem+27*32)
	.DB $20			; control byte: VRAM line, ptr inc, 32bytes of data
	.DB $04, $03, $01
	.DB $00, $7f, $03, $03
	.DB $02, $00, $02, $01
	.DB $00, $03, $02, $03
	.DB $00, $03, $03, $02
	.DB $00, $02, $03, $01
	.DB $00, $02, $03, $00
	.DB $00, $03, $02, $03
	.DB $02
;            .DB 23 $02,         ; PPU address (screen0, line 29)
;            .DB 20   ; $b60f: $02, 23 $02, 20   Data
;            .DB $02, $00, $00, $02,   ; $b613: $02, $00, $00, $02,   Data
;            .DB $02, $00, $02, $02,   ; $b617: $02, $00, $02, $02,   Data
;            .DB $00, $03, $00, $02,   ; $b61b: $00, $03, $00, $02,   Data
;            .DB $00, $03, $03, $02,   ; $b61f: $00, $03, $03, $02,   Data
;            .DB $03, $00, $01, $02,   ; $b623: $03, $00, $01, $02,   Data
;            .DB $00, $00, $00, $04,   ; $b627: $00, $00, $00, $04,   Data
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