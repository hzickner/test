; A - value
; X - size H
; Y - size L
; PTR1 - dest
.proc memset
	
	sty B1		; temp storage for low byte of size
	
	cpx #0		
	beq l1		; less than one page

	ldy #0
l2	sta (TEMP1),Y
	dey
	bne l2		; fill one page

	inc TEMP1+1
	dex
	bne l2		; advance to next page
		
l1	ldy B1
	beq l3
l4	dey
	sta (TEMP1),Y
	bne l4		; remaining bytes
l3	
	rts
.endp

;-------------------------------------------------------------------------------
; fill mem pages with A
; args A, X, Y
; A - value to write
; Y - first page
; X - nr of pages
.proc memset_page
	sty TEMP1+1
	ldy #0
	sty TEMP1
	
l1	sta (TEMP1),y
	dey
	bne l1
	inc TEMP1+1
	dex
	bne l1

	rts
.endp	
