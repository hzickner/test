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
;            .DB 20 40   ; $bb1f: $28, $28, 20 40   Data
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
;            .DB 21 40   ; $bc37: $2b, $28, 21 40   Data
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
;            .DB 20   ; $bc5b: $2b, 21 $2c, 20   Data
;            .DB $2a, $2a, $2b, $3b,   ; $bc5f: $2a, $2a, $2b, $3b,   Data
;            .DB $7f, $7f, 2b 00   ; $bc63: $7f, $7f, 2b 00   Data
;            .DB 2b 01 2b 02   ; $bc67: 2b 01 2b 02   Data
;            .DB 2b 03 2b 04   ; $bc6b: 2b 03 2b 04   Data
;            .DB 2c $7f, $7f, 2b   ; $bc6f: 2c $7f, $7f, 2b   Data
;            .DB 00 2b 01 2b   ; $bc73: 00 2b 01 2b   Data
;            .DB 02 2c $7f, $7f,   ; $bc77: 02 2c $7f, $7f,   Data
;            .DB $3c, $2b, $2b, $28,   ; $bc7b: $3c, $2b, $2b, $28,   Data
;            .DB 21 $2a,
;             20
;            .DB $2b,   ; $bc7f: 21 $2a, 20 $2b,   Data
;            .DB $2b, $28, $3b, $7f,   ; $bc83: $2b, $28, $3b, $7f,   Data
;            .DB $7f, 4c 2e 4d   ; $bc87: $7f, 4c 2e 4d   Data
;            .DB 2e 4d 2e 4d   ; $bc8b: 2e 4d 2e 4d   Data
;            .DB 2e 4d 2e 4e   ; $bc8f: 2e 4d 2e 4e   Data
;            .DB $7f, $7f, 4c 2e   ; $bc93: $7f, $7f, 4c 2e   Data
;            .DB 4d 2e 4d 2e   ; $bc97: 4d 2e 4d 2e   Data
;            .DB 4e $7f, $7f, $3c,   ; $bc9b: 4e $7f, $7f, $3c,   Data
;            .DB $28, $2b, $2a,
;            .DB 21 $2a,
;             20
;            .DB $2b, $2a,   ; $bca3: $2a, 20 $2b, $2a,   Data
;            .DB $2b, $3b, $7f, $7f,   ; $bca7: $2b, $3b, $7f, $7f,   Data
;            .DB 2b 05 2b 06   ; $bcab: 2b 05 2b 06   Data
;            .DB 2b 07 2b 08   ; $bcaf: 2b 07 2b 08   Data
;            .DB 2b 09 2c $7f,   ; $bcb3: 2b 09 2c $7f,   Data
;            .DB $7f, 2b 03 2b   ; $bcb7: $7f, 2b 03 2b   Data
;            .DB 04 2b 05 2c   ; $bcbb: 04 2b 05 2c   Data
;            .DB $7f, $7f, $3c, $2b,   ; $bcbf: $7f, $7f, $3c, $2b,   Data
;            .DB $2a, $28,
;            .DB 21 c0   ; $bcc3: $2a, $28, 21 c0   Data
;            .DB 20
;            .DB $2b, $2b, $28,   ; $bcc7: 20 $2b, $2b, $28,   Data
;            .DB $3b, $7f, $7f, 2d   ; $bccb: $3b, $7f, $7f, 2d   Data
;            .DB 2e 51 2e 51   ; $bccf: 2e 51 2e 51   Data
;            .DB 2e 51 2e 51   ; $bcd3: 2e 51 2e 51   Data
;            .DB 2e 2f $7f, $7f,   ; $bcd7: 2e 2f $7f, $7f,   Data
;            .DB 2d 2e 51 2e   ; $bcdb: 2d 2e 51 2e   Data
;            .DB 51 2e 2f $7f,   ; $bcdf: 51 2e 2f $7f,   Data
;            .DB $7f, $3c, $2a, $2a,   ; $bce3: $7f, $3c, $2a, $2a,   Data
;            .DB $28,
;            .DB 21 e0
;             20   ; $bce7: $28, 21 e0 20   Data
;            .DB $28, $2b, $2a, $3b,   ; $bceb: $28, $2b, $2a, $3b,   Data
;            .DB $7f, $7f, $7f, $7f,   ; $bcef: $7f, $7f, $7f, $7f,   Data
;            .DB $7f, $7f, $7f, $7f,   ; $bcf3: $7f, $7f, $7f, $7f,   Data
;            .DB $7f, $7f, $7f, $7f,   ; $bcf7: $7f, $7f, $7f, $7f,   Data
;            .DB $7f, $7f, $7f, $7f,   ; $bcfb: $7f, $7f, $7f, $7f,   Data
;            .DB $7f, $7f, $7f, $7f,   ; $bcff: $7f, $7f, $7f, $7f,   Data
;            .DB $7f, $7f, $7f, $7f,   ; $bd03: $7f, $7f, $7f, $7f,   Data
;            .DB $3c, $29, $2a, $28,   ; $bd07: $3c, $29, $2a, $28,   Data
;            .DB 22 00
;             20
;            .DB $2b,   ; $bd0b: 22 00 20 $2b,   Data
;            .DB $2a, $28, $3b, $7f,   ; $bd0f: $2a, $28, $3b, $7f,   Data
;            .DB $7f, $7f, $7f, $7f,   ; $bd13: $7f, $7f, $7f, $7f,   Data
;            .DB $7f, $7f, $7f, $7f,   ; $bd17: $7f, $7f, $7f, $7f,   Data
;            .DB $7f, $7f, $7f, $7f,   ; $bd1b: $7f, $7f, $7f, $7f,   Data
;            .DB $7f, $7f, $7f, $7f,   ; $bd1f: $7f, $7f, $7f, $7f,   Data
;            .DB $7f, $7f, $7f, $7f,   ; $bd23: $7f, $7f, $7f, $7f,   Data
;            .DB $7f, $7f, $7f, $3c,   ; $bd27: $7f, $7f, $7f, $3c,   Data
;            .DB $28, $2a, $2b,
;            .DB 22 20
;             20
;            .DB $2a, $2a,   ; $bd2f: 20 20 $2a, $2a,   Data
;            .DB $28, $3b, $7f, $41,   ; $bd33: $28, $3b, $7f, $41,   Data
;            .DB $2e, $2e, $2e, $2e,   ; $bd37: $2e, $2e, $2e, $2e,   Data
;            .DB $2e, $2e, $2e, $2e,   ; $bd3b: $2e, $2e, $2e, $2e,   Data
;            .DB $2e, $2e, $2e, $2e,   ; $bd3f: $2e, $2e, $2e, $2e,   Data
;            .DB $2e, $2e, $2e, $2e,   ; $bd43: $2e, $2e, $2e, $2e,   Data
;            .DB $2e, $2e, $2e, $2e,   ; $bd47: $2e, $2e, $2e, $2e,   Data
;            .DB $42, $7f, $3c, $2c,   ; $bd4b: $42, $7f, $3c, $2c,   Data
;            .DB $2b, $2b,
;            .DB 22 40   ; $bd4f: $2b, $2b, 22 40   Data
;            .DB 20
;            .DB $2b, $2a, $2b,   ; $bd53: 20 $2b, $2a, $2b,   Data
;            .DB $3b, $7f, 2b $7f,   ; $bd57: $3b, $7f, 2b $7f,   Data
;            .DB $7f, $7f, $7f, 17   ; $bd5b: $7f, $7f, $7f, 17   Data
;            .DB 0a 16 0e $7f,   ; $bd5f: 0a 16 0e $7f,   Data
;            .DB $7f, 1c 0c 18   ; $bd63: $7f, 1c 0c 18   Data
;            .DB 1b 0e $7f, $7f,   ; $bd67: 1b 0e $7f, $7f,   Data
;            .DB 15 1f $7f, 2c   ; $bd6b: 15 1f $7f, 2c   Data
;            .DB $7f, $3c, $2a, $28,   ; $bd6f: $7f, $3c, $2a, $28,   Data
;            .DB $28,
;            .DB 22 $2c,
;            .DB 20   ; $bd73: $28, 22 $2c, 20   Data
;            .DB $2b, $2b, $2b, $3b,   ; $bd77: $2b, $2b, $2b, $3b,   Data
;            .DB $7f, 4c 2e 2e   ; $bd7b: $7f, 4c 2e 2e   Data
;            .DB 2e 2e 2e 2e   ; $bd7f: 2e 2e 2e 2e   Data
;            .DB 2e 2e 2e 2e   ; $bd83: 2e 2e 2e 2e   Data
;            .DB 2e 2e 2e 2e   ; $bd87: 2e 2e 2e 2e   Data
;            .DB 2e 2e 2e 2e   ; $bd8b: 2e 2e 2e 2e   Data
;            .DB 2e 2e 4e $7f,   ; $bd8f: 2e 2e 4e $7f,   Data
;            .DB $3c, $2a, $2a, $2b,   ; $bd93: $3c, $2a, $2a, $2b,   Data
;            .DB 22 $2a,
;            .DB 20
;            .DB $28,   ; $bd97: 22 $2a, 20 $28,   Data
;            .DB $2b, $28, $3b, $7f,   ; $bd9b: $2b, $28, $3b, $7f,   Data
;            .DB 2b $7f, 01 $7f,   ; $bd9f: 2b $7f, 01 $7f,   Data
;            .DB $7f, $7f, $7f, $7f,   ; $bda3: $7f, $7f, $7f, $7f,   Data
;            .DB $7f, $7f, $7f, $7f,   ; $bda7: $7f, $7f, $7f, $7f,   Data
;            .DB $7f, $7f, $7f, $7f,   ; $bdab: $7f, $7f, $7f, $7f,   Data
;            .DB $7f, $7f, $7f, $7f,   ; $bdaf: $7f, $7f, $7f, $7f,   Data
;            .DB $7f, 2c $7f, $3c,   ; $bdb3: $7f, 2c $7f, $3c,   Data
;            .DB $2b, $2b, $28,
;            .DB 22 $2a,
;            .DB 20
;            .DB $2a, $28,   ; $bdbb: $2a, 20 $2a, $28,   Data
;            .DB $2b, $3b, $7f, 2b   ; $bdbf: $2b, $3b, $7f, 2b   Data
;            .DB $7f, $7f, $7f, $7f,   ; $bdc3: $7f, $7f, $7f, $7f,   Data
;            .DB $7f, $7f, $7f, $7f,   ; $bdc7: $7f, $7f, $7f, $7f,   Data
;            .DB $7f, $7f, $7f, $7f,   ; $bdcb: $7f, $7f, $7f, $7f,   Data
;            .DB $7f, $7f, $7f, $7f,   ; $bdcf: $7f, $7f, $7f, $7f,   Data
;            .DB $7f, $7f, $7f, $7f,   ; $bdd3: $7f, $7f, $7f, $7f,   Data
;            .DB 2c $7f, $3c, $2b,   ; $bdd7: 2c $7f, $3c, $2b,   Data
;            .DB $2a, $2b,
;            .DB 22 c0   ; $bddb: $2a, $2b, 22 c0   Data
;            .DB 20
;            .DB $2c, $2b, $2b,   ; $bddf: 20 $2c, $2b, $2b,   Data
;            .DB $3b, $7f, 2b $7f,   ; $bde3: $3b, $7f, 2b $7f,   Data
;            .DB 02 $7f, $7f, $7f,   ; $bde7: 02 $7f, $7f, $7f,   Data
;            .DB $7f, $7f, $7f, $7f,   ; $bdeb: $7f, $7f, $7f, $7f,   Data
;            .DB $7f, $7f, $7f, $7f,   ; $bdef: $7f, $7f, $7f, $7f,   Data
;            .DB $7f, $7f, $7f, $7f,   ; $bdf3: $7f, $7f, $7f, $7f,   Data
;            .DB $7f, $7f, $7f, 2c   ; $bdf7: $7f, $7f, $7f, 2c   Data
;            .DB $7f, $3c, $2b, $2b,   ; $bdfb: $7f, $3c, $2b, $2b,   Data
;            .DB $28,
;            .DB 22 e0
;            20   ; $bdff: $28, 22 e0 20   Data
;            .DB $2a, $28, $2b, $3b,   ; $be03: $2a, $28, $2b, $3b,   Data
;            .DB $7f, 2b $7f, $7f,   ; $be07: $7f, 2b $7f, $7f,   Data
;            .DB $7f, $7f, $7f, $7f,   ; $be0b: $7f, $7f, $7f, $7f,   Data
;            .DB $7f, $7f, $7f, $7f,   ; $be0f: $7f, $7f, $7f, $7f,   Data
;            .DB $7f, $7f, $7f, $7f,   ; $be13: $7f, $7f, $7f, $7f,   Data
;            .DB $7f, $7f, $7f, $7f,   ; $be17: $7f, $7f, $7f, $7f,   Data
;            .DB $7f, $7f, 2c $7f,   ; $be1b: $7f, $7f, 2c $7f,   Data
;            .DB $3c, $28, $2b, $2a,   ; $be1f: $3c, $28, $2b, $2a,   Data
;            .DB 23 00
;            .DB 20
;            .DB $2b,   ; $be23: 23 00 20 $2b,   Data
;            .DB $2b, $28, $3b, $7f,   ; $be27: $2b, $28, $3b, $7f,   Data
;            .DB 2b $7f, 03 $7f,   ; $be2b: 2b $7f, 03 $7f,   Data
;            .DB $7f, $7f, $7f, $7f,   ; $be2f: $7f, $7f, $7f, $7f,   Data
;            .DB $7f, $7f, $7f, $7f,   ; $be33: $7f, $7f, $7f, $7f,   Data
;            .DB $7f, $7f, $7f, $7f,   ; $be37: $7f, $7f, $7f, $7f,   Data
;            .DB $7f, $7f, $7f, $7f,   ; $be3b: $7f, $7f, $7f, $7f,   Data
;            .DB $7f, 2c $7f, $3c,   ; $be3f: $7f, 2c $7f, $3c,   Data
;            .DB $2b, $2a, $28,
;            .DB 23 20
;            .DB 20
;            .DB $2b, 40   ; $be47: 20 20 $2b, 40   Data
;            .DB 73 $3b, $7f, 2d   ; $be4b: 73 $3b, $7f, 2d   Data
;            .DB 2e 2e 2e 2e   ; $be4f: 2e 2e 2e 2e   Data
;            .DB 2e 2e 2e 2e   ; $be53: 2e 2e 2e 2e   Data
;            .DB 2e 2e 2e 2e   ; $be57: 2e 2e 2e 2e   Data
;            .DB 2e 2e 2e 2e   ; $be5b: 2e 2e 2e 2e   Data
;            .DB 2e 2e 2e 2e   ; $be5f: 2e 2e 2e 2e   Data
;            .DB 2f $7f, $3c, $2a,   ; $be63: 2f $7f, $3c, $2a,   Data
;            .DB $2a, $28,
;            .DB 23 40   ; $be67: $2a, $28, 23 40   Data
;            .DB 20
;            .DB $2b, $28, $2b,   ; $be6b: 20 $2b, $28, $2b,   Data
;            .DB $3b, $7f, $7f, $7f,   ; $be6f: $3b, $7f, $7f, $7f,   Data
;            .DB $7f, $7f, $7f, $7f,   ; $be73: $7f, $7f, $7f, $7f,   Data
;            .DB $7f, $7f, $7f, $7f,   ; $be77: $7f, $7f, $7f, $7f,   Data
;            .DB $7f, $7f, $7f, $7f,   ; $be7b: $7f, $7f, $7f, $7f,   Data
;            .DB $7f, $7f, $7f, $7f,   ; $be7f: $7f, $7f, $7f, $7f,   Data
;            .DB $7f, $7f, $7f, $7f,   ; $be83: $7f, $7f, $7f, $7f,   Data
;            .DB $7f, $3c, $2b, $2c,   ; $be87: $7f, $3c, $2b, $2c,   Data
;            .DB $2b,
;            .DB 23 $2c,
;            .DB 20   ; $be8b: $2b, 23 $2c, 20   Data
;            .DB $28, $29, $28, $3d,   ; $be8f: $28, $29, $28, $3d,   Data
;            .DB $3e, $3e, $3e, $3e,   ; $be93: $3e, $3e, $3e, $3e,   Data
;            .DB $3e, $3e, $3e, $3e,   ; $be97: $3e, $3e, $3e, $3e,   Data
;            .DB $3e, $3e, $3e, $3e,   ; $be9b: $3e, $3e, $3e, $3e,   Data
;            .DB $3e, $3e, $3e, $3e,   ; $be9f: $3e, $3e, $3e, $3e,   Data
;            .DB $3e, $3e, $3e, $3e,   ; $bea3: $3e, $3e, $3e, $3e,   Data
;            .DB $3e, $3e, $3e, $3e,   ; $bea7: $3e, $3e, $3e, $3e,   Data
;            .DB $3f, $2b, $2a, $28,   ; $beab: $3f, $2b, $2a, $28,   Data
;            .DB 23 $2a,
;            20
;            .DB $2b,   ; $beaf: 23 $2a, 20 $2b,   Data
;            .DB $28, $29, $28, $2b,   ; $beb3: $28, $29, $28, $2b,   Data
;            .DB $2a, $2a, $2b, $2a,   ; $beb7: $2a, $2a, $2b, $2a,   Data
;            .DB $2a, $2a, $28, $29,   ; $bebb: $2a, $2a, $28, $29,   Data
;            .DB $28, $29, $28, $2c,   ; $bebf: $28, $29, $28, $2c,   Data
;            .DB $2b, $29, $2a, $28,   ; $bec3: $2b, $29, $2a, $28,   Data
;            .DB $2b, $2a, 43 $28,   ; $bec7: $2b, $2a, 43 $28,   Data
;            .DB $2a, $2b, $2a, $2b,   ; $becb: $2a, $2b, $2a, $2b,   Data
;            .DB $2a, $28, $2b,
;            .DB 23 $2a,
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
