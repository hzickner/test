; overwrites some parts of level_screen_data
LEVEL_SCREEN_DATA2:
;            .DB 3f 0a         ; address $3f0a pallette
;            .DB 01            ; 1 byte
;            .DB 16            ; Data
;            .DB 20 6d         ; address $206d
	.DB >(scr_mem+2*32+13), <(scr_mem+2*32+13)
	.DB 01            ; 1 byte
	.DB $0a            ; Data
;            .DB 20 f3         ; address $20f3
	.DB >(scr_mem+6*32+19), <(scr_mem+6*32+19)
	.DB $48            ; don't inc ptr, 8bytes
	.DB $7f            ; $c965: 20 f3 48 ff   Data
;            .DB 21 13
	.DB >(scr_mem+7*32+19), <(scr_mem+7*32+19)
	.DB $48 
	.DB $7f           ; Data
;            .DB 21 33
	.DB >(scr_mem+8*32+19), <(scr_mem+8*32+19)
	.DB $48
	.DB $7f            ; Data
;            .DB 21 53
	.DB >(scr_mem+9*32+19), <(scr_mem+9*32+19)
	.DB $47
	.DB $7f   ; $c971: 21 53 47 ff   Data
;            .DB 21 73
	.DB >(scr_mem+10*32+19), <(scr_mem+10*32+19)
	.DB $47
	.DB $7f   ; $c975: 21 73 47 ff   Data
;            .DB 21 93
	.DB >(scr_mem+11*32+19), <(scr_mem+11*32+19)
	.DB $47
	.DB $7f   ; $c979: 21 93 47 ff   Data
;            .DB 21 b3
	.DB >(scr_mem+12*32+19), <(scr_mem+12*32+19)
	.DB $47
	.DB $7f   ; $c97d: 21 b3 47 ff   Data
;            .DB 21 d3
	.DB >(scr_mem+13*32+19), <(scr_mem+13*32+19)
	.DB $47
	.DB $7f   ; $c981: 21 d3 47 ff   Data
;            .DB 22 33
	.DB >(scr_mem+16*32+19), <(scr_mem+16*32+19)
	.DB $48
	.DB $7f   ; $c985: 22 33 48 ff   Data
;            .DB 22 53
	.DB >(scr_mem+17*32+19), <(scr_mem+17*32+19)
	.DB $48
	.DB $7f   ; $c989: 22 53 48 ff   Data
;            .DB 22 73
	.DB >(scr_mem+18*32+19), <(scr_mem+18*32+19)
	.DB $48
	.DB $7f   ; $c98d: 22 73 48 ff   Data
;            .DB 22 93
	.DB >(scr_mem+19*32+19), <(scr_mem+19*32+19)
	.DB $47
	.DB $7f   ; $c991: 22 93 47 ff   Data
;            .DB 22 b3
	.DB >(scr_mem+20*32+19), <(scr_mem+20*32+19)
	.DB $47
	.DB $7f   ; $c995: 22 b3 47 ff   Data
;            .DB 22 d3
	.DB >(scr_mem+21*32+19), <(scr_mem+21*32+19)
	.DB $47
	.DB $7f   ; $c999: 22 d3 47 ff   Data
;            .DB 22 f3
	.DB >(scr_mem+22*32+19), <(scr_mem+22*32+19)
	.DB $47
	.DB $7f   ; $c99d: 22 f3 47 ff   Data
;            .DB 23 13
	.DB >(scr_mem+23*32+19), <(scr_mem+23*32+19)
	.DB $47
	.DB $7f   ; $c9a1: 23 13 47 ff   Data

	.DB $ff
; end of data