; Processor	  : 6809 []
; Target assembler: Motorola FreeWare Assembler

; ===========================================================================

; [00000001 BYTES: COLLAPSED SEGMENT MUXLatch. PRESS CTRL-NUMPAD+ TO EXPAND]
; ===========================================================================

; [00000014 BYTES: COLLAPSED SEGMENT ECLKStrobes. PRESS	CTRL-NUMPAD+ TO	EXPAND]
; ===========================================================================

; [00000002 BYTES: COLLAPSED SEGMENT ENVDAC. PRESS CTRL-NUMPAD+	TO EXPAND]
; ===========================================================================

; Segment type:	Pure code
		; segment ROM
		org $E200
; assume dp = $EA

; =============== S U B	R O U T	I N E =======================================


MainLoop:
		orcc	#$50 ; 'P'
		lda	#$EA ; 'ê'
		tfr	a, dp		; dp = 0xea
		lda	#$19
		sta	<unk_EAF2	; =$19
		ldx	#$F062
		lda	#$FF
		ldb	#$14

loc_E211:				; CODE XREF: MainLoop+17j
		sta	,x
		leax	$FFBB,x
		decb
		bne	loc_E211
		lda	#$18
		sta	MUXLatch
		lda	#$20 ; ' '
		sta	MUXLatch
		lds	#$E1FC

Infinite2_andcc_BF:			; CODE XREF: VoiceProcess+F8j
		andcc	#$BF ; '¿'

InfiniteLoop2:				; CODE XREF: MainLoop+2Bj
		clr	<unk_EAF6
		bra	InfiniteLoop2
; End of function MainLoop


; =============== S U B	R O U T	I N E =======================================


VoiceProcess:
		lds	#$E1FC
		lda	#$EA ; 'ê'
		tfr	a, dp
		ldx	#$F05D
		lda	#$14
		sta	<EAF5_currentvoice
		ldb	#$19		; b=19
		lda	<unk_EAF1
		beq	loc_E244
		addb	#$2C ; ','      ; b=$19+$2C

loc_E244:				; CODE XREF: VoiceProcess+13j
		subb	<unk_EAF2
		stb	<unk_EAF3
		ldb	<unk_EAF2
		stb	<unknown1
		clr	<unk_EAF6
		bra	loc_E258
; ---------------------------------------------------------------------------

loc_E250:				; CODE XREF: VoiceProcess+109j
		clr	<unk_EAF6
		lda	5,x
		lbeq	resetvoicedac	; y = 0

loc_E258:				; CODE XREF: VoiceProcess+21j
		lda	2,x
		bne	stu_x_$16
		lda	1,x
		bne	stu_2_x_$16
		lda	0,x
		bne	loc_E2AA
		bra	loc_E2D6
; ---------------------------------------------------------------------------

stu_2_x_$16:				; CODE XREF: VoiceProcess+31j
		clr	1,x
		lda	0,x
		bne	loc_E2A3
		lda	<unknown1
		inca
		lda	a,x
		bmi	loc_E2D6
		adda	<unknown1
		leau	a,x
		stu	$16,x
		clra
		clrb
		sta	$18,x
		std	$10,x
		lda	#1
		sta	4,x
		bra	loc_E2D6
; ---------------------------------------------------------------------------

stu_x_$16:				; CODE XREF: VoiceProcess+2Dj
		clr	2,x
		clr	1,x
		lda	0,x
		bne	loc_E2A3
		clra
		clrb
		std	8,x
		ldb	<unknown1
		addb	#$2C ; ','      ; b+=44
		leau	b,x		; u=b+x
		stu	$16,x
		lda	#1
		sta	4,x
		bra	loc_E2D6
; ---------------------------------------------------------------------------

loc_E2A3:				; CODE XREF: VoiceProcess+3Dj
					; VoiceProcess+61j
		clr	3,x
		clr	0,x
		jmp	resetvoiceeclk
; ---------------------------------------------------------------------------

loc_E2AA:				; CODE XREF: VoiceProcess+35j
		clra
		clrb
		std	8,x
		std	$10,x
		lda	<unk_EAF3
		beq	loc_E2BB
		adda	<unknown1
		sta	<unk_EAF2
		sta	<unknown1

loc_E2BB:				; CODE XREF: VoiceProcess+86j
		lda	<unknown1
		lda	a,x
		adda	<unknown1
		leau	a,x
		stu	$16,x
		stb	$18,x
		lda	#$F1 ; 'ñ'
		sta	4,x
		clr	0,x
		ldu	#eclk1		; load current eclk for	voice
		ldb	<EAF5_currentvoice
		stb	b,u

loc_E2D6:				; CODE XREF: VoiceProcess+37j
					; VoiceProcess+44j ...
		lda	4,x
		beq	resetvoiceeclk
		suba	#$10
		bcs	loc_E2E0
		sta	4,x

loc_E2E0:				; CODE XREF: VoiceProcess+AFj
		jsr	VoiceProcessStuff ; [x+16]
		ldd	$14,x
		adda	4,x
		bcc	skipareset
		lda	#$FF		; a = 0xFF (eclk)

skipareset:				; CODE XREF: VoiceProcess+BBj
		sta	3,x
		subd	#$110
		bcc	loc_E303	; y=[x+14]
		clr	4,x
		clr	3,x

resetvoiceeclk:				; CODE XREF: VoiceProcess+7AJ
					; VoiceProcess+ABj
		ldy	#0
		bra	setvoiceeclk_pre
; ---------------------------------------------------------------------------

resetvoicedac:				; CODE XREF: VoiceProcess+27j
		ldy	#0		; y = 0
		bra	setvoicedac
; ---------------------------------------------------------------------------

loc_E303:				; CODE XREF: VoiceProcess+C4j
		ldy	$14,x		; y=[x+14]

setvoiceeclk_pre:			; CODE XREF: VoiceProcess+CEj
		ldb	<EAF5_currentvoice
		cmpb	#20
		beq	aftersetvoicedac ; if(currentvoice == 20) skip eclk/dac	sets

setvoiceeclk:
		ldu	#eclk1
		sta	b,u		; eclk[voice (b)] = a

setvoicedac:				; CODE XREF: VoiceProcess+D4j
		lda	#32
		sta	MUXLatch	; mux =	reset
		sty	ENVDAC1		; dac =	y = [x+14]
		lda	<EAF5_currentvoice
		adda	#4
		sta	MUXLatch	; mux =	voice (b)

aftersetvoicedac:			; CODE XREF: VoiceProcess+DEj
		cmpx	#x_endcheck
		lbeq	Infinite2_andcc_BF
		bcs	Infinite_FF	; interrupt busy loop stuff?
		lda	#$19
		sta	<unknown1	; =0x19
		clr	<unk_EAF3
		leax	$FFBB,x
		dec	<EAF5_currentvoice ; currentvoice--
		lbpl	loc_E250	; if(currentvoice > 0)
		bra	Infinite_FE
; ---------------------------------------------------------------------------

Infinite_FF:				; CODE XREF: VoiceProcess+FCj
		lda	#$FF		; interrupt busy loop stuff?
		bra	InfiniteLoop
; ---------------------------------------------------------------------------

Infinite_FE:				; CODE XREF: VoiceProcess+10Dj
		lda	#$FE ; 'þ'
		bra	InfiniteLoop
; End of function VoiceProcess

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR VoiceProcessStuff

Infinite_FD:				; CODE XREF: VoiceProcessStuff+Ej
		lda	#$FD ; 'ý'
		bra	InfiniteLoop
; ---------------------------------------------------------------------------

Infinite_FC:				; CODE XREF: VoiceProcessStuff+11j
					; VoiceProcessStuff+24j
		lda	#$FC ; 'ü'

InfiniteLoop:				; CODE XREF: VoiceProcess+111j
					; VoiceProcess+115j ...
		sta	<unk_EAF6
		bra	InfiniteLoop
; END OF FUNCTION CHUNK	FOR VoiceProcessStuff

; =============== S U B	R O U T	I N E =======================================

; [x+16]

VoiceProcessStuff:			; CODE XREF: VoiceProcess:loc_E2E0P

; FUNCTION CHUNK AT E344 SIZE 0000000A BYTES

		ldy	$16,x

loc_E352:				; CODE XREF: ROM:E3DBJ	ROM:E3E6J ...
		ldb	<unknown1
		leau	b,x
		stu	<unk_EAF7
		tfr	y, d
		subd	<unk_EAF7
		bmi	Infinite_FD
		tsta
		bne	Infinite_FC
		cmpb	#$2C ; ','
		bcs	TableJumper1	; if (b	< $2C)
		cmpb	#$31 ; '1'
		bcs	loc_E3C7	; if (b	< $31)
		bhi	loc_E370	; if (b	> $31)
		ldd	#$FFFF		; if (b	== 31)
		bra	std_$8		; $8 is	$FFFF
; ---------------------------------------------------------------------------

loc_E370:				; CODE XREF: VoiceProcessStuff+1Bj
		cmpb	#$32 ; '2'
		bhi	Infinite_FC	; if (b	> $32)
		clra			; if (b	== 32)
		clrb
		bra	std_$8		; $8 is	$0
; ---------------------------------------------------------------------------

TableJumper1:				; CODE XREF: VoiceProcessStuff+15j
		lda	,y+		; [y], y++
		tfr	a, b
		anda	#3
		beq	TableJumper2	; if (((a=b) & 3) == 0)
		ldu	#TableJmp1	; table
		aslb
		andb	#%11110
		jmp	[b,u]		; jmp TableJmp1[b<<1 & 0x1E]
					;
					; some kind of arg preparation for below jump?
; ---------------------------------------------------------------------------

TableJumper2:				; CODE XREF: VoiceProcessStuff+30j
		ldu	#TableJmp2	; table
		lsrb
		jmp	[b,u]		; jmp TableJmp2[b]
; ---------------------------------------------------------------------------

std_$8:					; CODE XREF: VoiceProcessStuff+20j
					; VoiceProcessStuff+28j ...
		std	8,x

loc_E390:				; CODE XREF: VoiceProcessStuff+7Bj
					; ROM:E9D1J
		sty	$16,x
		ldb	$12,x
		mul
		pshs	a,b
		lda	$12,x
		ldb	9,x
		mul
		addd	#$FF
		addd	,s++
		bcs	loc_E3B7
		pshs	a
		ldb	$12,x
		lda	8,x
		mul
		addb	,s+
		adca	#0
		std	$14,x		; [x+14] value
		rts
; ---------------------------------------------------------------------------

loc_E3B7:				; CODE XREF: VoiceProcessStuff+57j
		pshs	a
		ldb	$12,x
		lda	8,x
		mul
		addb	,s+
		adca	#1
		std	$14,x		; [x+14] value
		rts
; ---------------------------------------------------------------------------

loc_E3C7:				; CODE XREF: VoiceProcessStuff+19j
					; ROM:E865j ...
		ldd	8,x
		bra	loc_E390
; End of function VoiceProcessStuff

; ---------------------------------------------------------------------------

ldd_y_12bit_$FFF0_std_$8:		; DATA XREF: ROM:TableJmp1o
		ldb	-1,y
		lda	,y+
		andb	#$F0 ; 'ð'
		bra	std_$8
; ---------------------------------------------------------------------------

ldd_y_12bit_$FFF0_std_$A:		; DATA XREF: ROM:TableJmp1o
		ldb	-1,y
		lda	,y+
		andb	#$F0 ; 'ð'
		std	$A,x
		jmp	loc_E352
; ---------------------------------------------------------------------------

ldd_y_12bit_$FFF0_std_$C:		; DATA XREF: ROM:TableJmp1o
		ldb	-1,y
		lda	,y+
		andb	#$F0 ; 'ð'
		std	$C,x
		jmp	loc_E352
; ---------------------------------------------------------------------------

ldd_$A_std_$8:				; DATA XREF: ROM:TableJmp2o
		ldd	$A,x
		jmp	std_$8
; ---------------------------------------------------------------------------

ldd_$C_std_$8:				; DATA XREF: ROM:TableJmp2o
		ldd	$C,x
		jmp	std_$8
; ---------------------------------------------------------------------------

ldd_$C_std_$A:				; DATA XREF: ROM:TableJmp2o
		ldd	$C,x
		std	$A,x
		jmp	loc_E352
; ---------------------------------------------------------------------------

ldd_$8_std_$A:				; DATA XREF: ROM:TableJmp2o
		ldd	8,x
		std	$A,x
		jmp	loc_E352
; ---------------------------------------------------------------------------

ldd_$8_std_$C:				; DATA XREF: ROM:TableJmp2o
		ldd	8,x
		std	$C,x
		jmp	loc_E352
; ---------------------------------------------------------------------------

ldd_$A_std_$C:				; DATA XREF: ROM:TableJmp2o
		ldd	$A,x
		std	$C,x
		jmp	loc_E352
; ---------------------------------------------------------------------------

loc_E40F:				; DATA XREF: ROM:TableJmp2o
		ldb	<unknown1
		leau	b,x
		ldb	,y+
		bmi	loc_E43D
		bitb	#$40 ; '@'
		bne	loc_E42C
		andb	#$3F ; '?'
		cmpb	#$30 ; '0'
		bcc	loc_E426
		ldd	b,u
		jmp	std_$8
; ---------------------------------------------------------------------------

loc_E426:				; CODE XREF: ROM:E41Fj
		subb	#$30 ; '0'
		clra
		jmp	std_$8
; ---------------------------------------------------------------------------

loc_E42C:				; CODE XREF: ROM:E419j
		andb	#$3F ; '?'
		cmpb	#$30 ; '0'
		lbcc	loc_E352
		leau	b,u
		ldd	8,x
		std	,u
		jmp	loc_E352
; ---------------------------------------------------------------------------

loc_E43D:				; CODE XREF: ROM:E415j
		bitb	#$40 ; '@'
		bne	loc_E455
		andb	#$3F ; '?'
		cmpb	#$30 ; '0'
		bcc	loc_E44D
		lda	b,u
		clrb
		jmp	std_$8
; ---------------------------------------------------------------------------

loc_E44D:				; CODE XREF: ROM:E445j
		subb	#$30 ; '0'
		tfr	b, a
		clrb
		jmp	std_$8
; ---------------------------------------------------------------------------

loc_E455:				; CODE XREF: ROM:E43Fj
		andb	#$3F ; '?'
		cmpb	#$30 ; '0'
		lbcc	loc_E352
		lda	8,x
		sta	b,u
		jmp	loc_E352
; ---------------------------------------------------------------------------

loc_E464:				; DATA XREF: ROM:TableJmp2o
		ldb	<unknown1
		leau	b,x
		ldb	,y+
		bmi	loc_E496
		bitb	#$40 ; '@'
		bne	loc_E485
		andb	#$3F ; '?'
		cmpb	#$30 ; '0'
		bcc	loc_E47D
		ldd	b,x
		std	$A,x
		jmp	loc_E352
; ---------------------------------------------------------------------------

loc_E47D:				; CODE XREF: ROM:E474j
		subb	#$30 ; '0'
		clra
		std	$A,x
		jmp	loc_E352
; ---------------------------------------------------------------------------

loc_E485:				; CODE XREF: ROM:E46Ej
		andb	#$3F ; '?'
		cmpb	#$30 ; '0'
		lbcc	loc_E352
		leau	b,u
		ldd	$A,x
		std	,u
		jmp	loc_E352
; ---------------------------------------------------------------------------

loc_E496:				; CODE XREF: ROM:E46Aj
		bitb	#$40 ; '@'
		bne	loc_E4B2
		andb	#$3F ; '?'
		cmpb	#$30 ; '0'
		bcc	loc_E4A8
		lda	b,u
		clrb
		std	$A,x
		jmp	loc_E352
; ---------------------------------------------------------------------------

loc_E4A8:				; CODE XREF: ROM:E49Ej
		subb	#$30 ; '0'
		tfr	b, a
		clra
		std	$A,x
		jmp	loc_E352
; ---------------------------------------------------------------------------

loc_E4B2:				; CODE XREF: ROM:E498j
		andb	#$3F ; '?'
		cmpb	#$30 ; '0'
		lbcc	loc_E352
		lda	$A,x
		sta	b,u
		jmp	loc_E352
; ---------------------------------------------------------------------------

loc_E4C1:				; DATA XREF: ROM:TableJmp2o
		ldb	<unknown1
		leau	b,x
		ldb	,y+
		bmi	loc_E4F3
		bitb	#$40 ; '@'
		bne	loc_E4E2
		andb	#$3F ; '?'
		cmpb	#$30 ; '0'
		bcc	loc_E4DA
		ldd	b,x
		std	$C,x
		jmp	loc_E352
; ---------------------------------------------------------------------------

loc_E4DA:				; CODE XREF: ROM:E4D1j
		subb	#$30 ; '0'
		clra
		std	$C,x
		jmp	loc_E352
; ---------------------------------------------------------------------------

loc_E4E2:				; CODE XREF: ROM:E4CBj
		andb	#$3F ; '?'
		cmpb	#$30 ; '0'
		lbcc	loc_E352
		leau	b,u
		ldd	$C,x
		std	,u
		jmp	loc_E352
; ---------------------------------------------------------------------------

loc_E4F3:				; CODE XREF: ROM:E4C7j
		bitb	#$40 ; '@'
		bne	loc_E50F
		andb	#$3F ; '?'
		cmpb	#$30 ; '0'
		bcc	loc_E505
		lda	b,u
		clrb
		std	$C,x
		jmp	loc_E352
; ---------------------------------------------------------------------------

loc_E505:				; CODE XREF: ROM:E4FBj
		subb	#$30 ; '0'
		tfr	b, a
		clrb
		std	$C,x
		jmp	loc_E352
; ---------------------------------------------------------------------------

loc_E50F:				; CODE XREF: ROM:E4F5j
		andb	#$3F ; '?'
		cmpb	#$30 ; '0'
		lbcc	loc_E352
		lda	$C,x
		sta	b,u
		jmp	loc_E352
; ---------------------------------------------------------------------------

addd_y_$8:				; DATA XREF: ROM:TableJmp1o
		ldb	-1,y
		lda	,y+
		andb	#$F0 ; 'ð'
		addd	8,x
		jmp	std_$8
; ---------------------------------------------------------------------------

addd_y_$A:				; DATA XREF: ROM:TableJmp1o
		ldb	-1,y
		lda	,y+
		andb	#$F0 ; 'ð'
		addd	$A,x
		std	$A,x
		jmp	loc_E352
; ---------------------------------------------------------------------------

addd_y_$C:				; DATA XREF: ROM:TableJmp1o
		ldb	-1,y
		lda	,y+
		andb	#$F0 ; 'ð'
		addd	$C,x
		std	$C,x
		jmp	loc_E352
; ---------------------------------------------------------------------------

addd_$A$8:				; DATA XREF: ROM:TableJmp2o
		ldd	$A,x
		addd	8,x
		jmp	std_$8
; ---------------------------------------------------------------------------

addd_$C$8:				; DATA XREF: ROM:TableJmp2o
		ldd	$C,x
		addd	8,x
		lbcc	std_$8
		ldd	#$FFFF
		jmp	std_$8
; ---------------------------------------------------------------------------

addd_$C$A:				; DATA XREF: ROM:TableJmp2o
		ldd	$C,x
		addd	$A,x
		std	$A,x
		jmp	loc_E352
; ---------------------------------------------------------------------------

addd_$8$A:				; DATA XREF: ROM:TableJmp2o
		ldd	8,x
		addd	$A,x
		std	$A,x
		jmp	loc_E352
; ---------------------------------------------------------------------------

addd_$A$C:				; DATA XREF: ROM:TableJmp2o
		ldd	$A,x
		addd	$C,x
		std	$C,x
		jmp	loc_E352
; ---------------------------------------------------------------------------

addd_$8$C:				; DATA XREF: ROM:TableJmp2o
		ldd	8,x
		addd	$C,x
		std	$C,x
		jmp	loc_E352
; ---------------------------------------------------------------------------

subd_$8$A:				; DATA XREF: ROM:TableJmp2o
		ldd	8,x
		subd	$A,x
		jmp	std_$8
; ---------------------------------------------------------------------------

subd_$8$C:				; DATA XREF: ROM:TableJmp2o
		ldd	8,x
		subd	$C,x
		lbcc	std_$8
		clra
		clrb
		jmp	std_$8
; ---------------------------------------------------------------------------

subd_$A$C:				; DATA XREF: ROM:TableJmp2o
		ldd	$A,x
		subd	$C,x
		std	$A,x
		jmp	loc_E352
; ---------------------------------------------------------------------------

subd_$A$8:				; DATA XREF: ROM:TableJmp2o
		ldd	$A,x
		subd	8,x
		std	$A,x
		jmp	loc_E352
; ---------------------------------------------------------------------------

subd_$C$A:				; DATA XREF: ROM:TableJmp2o
		ldd	$C,x
		subd	$A,x
		std	$C,x
		jmp	loc_E352
; ---------------------------------------------------------------------------

subd_$C$8:				; DATA XREF: ROM:TableJmp2o
		ldd	$C,x
		subd	8,x
		std	$C,x
		jmp	loc_E352
; ---------------------------------------------------------------------------

lddtst_$8$A_$9$8:			; DATA XREF: ROM:TableJmp2o
		ldd	8,x
		tst	$A,x
		lbeq	std_$8
		lda	$A,x
		nega
		bra	mul_$9$8
; ---------------------------------------------------------------------------

lddtst_$8$C_$9$8:			; DATA XREF: ROM:TableJmp2o
		ldd	8,x
		tst	$C,x
		lbeq	std_$8
		lda	$C,x
		nega
		bra	mul_$9$8
; ---------------------------------------------------------------------------

lda_$C_$9$8:				; DATA XREF: ROM:TableJmp2o
		lda	$C,x
		bra	mul_$9$8
; ---------------------------------------------------------------------------

lda_$A_$9$8:				; DATA XREF: ROM:TableJmp2o
		lda	$A,x
		bra	mul_$9$8
; ---------------------------------------------------------------------------

lda_y_$9$8:				; DATA XREF: ROM:TableJmp2o
		lda	,y+

mul_$9$8:				; CODE XREF: ROM:E5BFj	ROM:E5CCj ...
		pshs	a
		ldb	9,x
		mul
		ldb	,s
		sta	,s
		lda	8,x
		mul
		addb	,s+
		adca	#0
		jmp	std_$8
; ---------------------------------------------------------------------------

ldabeq_$C_$B$A:				; DATA XREF: ROM:TableJmp2o
		lda	$C,x
		lbeq	loc_E352
		nega
		bra	mul_$B$A
; ---------------------------------------------------------------------------

lda_$C_$B$A:				; DATA XREF: ROM:TableJmp2o
		lda	$C,x
		bra	mul_$B$A
; ---------------------------------------------------------------------------

lda_y_$B$A:				; DATA XREF: ROM:TableJmp2o
		lda	,y+

mul_$B$A:				; CODE XREF: ROM:E5F2j	ROM:E5F6j
		pshs	a
		ldb	$B,x
		mul
		ldb	,s
		sta	,s
		lda	$A,x
		mul
		addb	,s+
		adca	#0
		std	$A,x
		jmp	loc_E352
; ---------------------------------------------------------------------------

ldabeq_$A_$D$C:				; DATA XREF: ROM:TableJmp2o
		lda	$A,x		; a=[x+0xA]
		lbeq	loc_E352
		nega
		bra	mul_$D$C
; ---------------------------------------------------------------------------

lda_$C_$D$C:				; DATA XREF: ROM:TableJmp2o
		lda	$C,x		; a=[x+0xC]
		bra	mul_$D$C
; ---------------------------------------------------------------------------

lda_y_$D$C:				; DATA XREF: ROM:TableJmp2o
		lda	,y+		; a=[y++]

mul_$D$C:				; CODE XREF: ROM:E616j	ROM:E61Aj
		pshs	a
		ldb	$D,x
		mul			; a * [x+0xD]
		ldb	,s
		sta	,s
		lda	$C,x
		mul			; [x+0xC] * a
		addb	,s+
		adca	#0
		std	$C,x
		jmp	loc_E352
; ---------------------------------------------------------------------------

lda_$C_$9$8_2:				; DATA XREF: ROM:TableJmp2o
		lda	$C,x
		bra	mul_$9$8_2
; ---------------------------------------------------------------------------

lda_$A_$9$8_2:				; DATA XREF: ROM:TableJmp2o
		lda	$A,x
		bra	mul_$9$8_2
; ---------------------------------------------------------------------------

lda_y_$9$8_2:				; DATA XREF: ROM:TableJmp2o
		lda	,y+

mul_$9$8_2:				; CODE XREF: ROM:E635j	ROM:E639j ...
		pshs	a
		ldb	9,x
		mul
		ldb	,s
		sta	,s
		lda	8,x
		mul
		addb	,s+
		adca	#0
		addd	8,x
		lbcc	std_$8
		ldd	#$FFFF
		jmp	std_$8
; ---------------------------------------------------------------------------

lda_$C_$B$A_2:				; DATA XREF: ROM:TableJmp2o
		lda	$C,x
		bra	mul_$B$A_2
; ---------------------------------------------------------------------------

lda_y_$B$A_2:				; DATA XREF: ROM:TableJmp2o
		lda	,y+

mul_$B$A_2:				; CODE XREF: ROM:E65Bj
		pshs	a
		ldb	$B,x
		mul
		ldb	,s
		sta	,s
		lda	$A,x
		mul
		addb	,s+
		adca	#0
		addd	$A,x
		bcc	std_$A
		ldd	#$FFFF

std_$A:					; CODE XREF: ROM:E671j
		std	$A,x
		jmp	loc_E352
; ---------------------------------------------------------------------------

lda_$A_$D$C_2:				; DATA XREF: ROM:TableJmp2o
		lda	$A,x
		bra	mul_$D$C_2
; ---------------------------------------------------------------------------

lda_y_$D$C_2:				; DATA XREF: ROM:TableJmp2o
		lda	,y+

mul_$D$C_2:				; CODE XREF: ROM:E67Dj
		pshs	a
		ldb	$D,x
		mul
		ldb	,s
		sta	,s
		lda	$C,x
		mul
		addb	,s+
		adca	#0
		addd	$C,x
		bcc	std_$C
		ldd	#$FFFF

std_$C:					; CODE XREF: ROM:E693j
		std	$C,x
		jmp	loc_E352
; ---------------------------------------------------------------------------

loc_E69D:				; DATA XREF: ROM:TableJmp2o
		lda	$A,x
		ldb	,y
		mul
		tsta
		bne	ldd_const$FFFF
		pshs	b
		lda	$B,x
		ldb	,y+
		mul
		addb	,s+
		adca	#0
		lbcc	std_$A_2

ldd_const$FFFF:				; CODE XREF: ROM:E6A3j
		ldd	#$FFFF

std_$A_2:				; CODE XREF: ROM:E6B0j
		std	$A,x
		jmp	loc_E352
; ---------------------------------------------------------------------------

loc_E6BC:				; DATA XREF: ROM:TableJmp2o
		lda	$C,x
		ldb	,y
		mul
		tsta
		bne	loc_E6D3
		pshs	b
		lda	$D,x
		ldb	,y+
		mul
		addb	,s+
		adca	#0
		lbcc	loc_E6D6

loc_E6D3:				; CODE XREF: ROM:E6C2j
		ldd	#$FFFF

loc_E6D6:				; CODE XREF: ROM:E6CFj
		std	$C,x
		jmp	loc_E352
; ---------------------------------------------------------------------------

loc_E6DB:				; DATA XREF: ROM:TableJmp1o
		ldb	-1,y
		lda	,y+
		andb	#$F0 ; 'ð'
		cmpd	8,x
		lbcs	loc_E797
		lbeq	loc_E790
		jmp	loc_E783
; ---------------------------------------------------------------------------

loc_E6EF:				; DATA XREF: ROM:TableJmp1o
		ldb	-1,y
		lda	,y+
		andb	#$F0 ; 'ð'
		cmpd	$A,x
		lbcs	loc_E797
		lbeq	loc_E790
		jmp	loc_E783
; ---------------------------------------------------------------------------

loc_E703:				; DATA XREF: ROM:TableJmp1o
		ldb	-1,y
		lda	,y+
		andb	#$F0 ; 'ð'
		cmpd	$C,x
		lbcs	loc_E797
		beq	loc_E790
		bra	loc_E783
; ---------------------------------------------------------------------------

loc_E714:				; DATA XREF: ROM:TableJmp1o
		ldb	-1,y
		lda	,y+
		andb	#$F0 ; 'ð'
		cmpd	8,x
		bhi	loc_E797
		beq	loc_E790
		bra	loc_E783
; ---------------------------------------------------------------------------

loc_E723:				; DATA XREF: ROM:TableJmp1o
		ldb	-1,y
		lda	,y+
		andb	#$F0 ; 'ð'
		cmpd	$A,x
		bhi	loc_E797
		beq	loc_E790
		bra	loc_E783
; ---------------------------------------------------------------------------

loc_E732:				; DATA XREF: ROM:TableJmp1o
		ldb	-1,y
		lda	,y+
		andb	#$F0 ; 'ð'
		cmpd	$C,x
		bhi	loc_E797
		beq	loc_E790
		bra	loc_E783
; ---------------------------------------------------------------------------

loc_E741:				; DATA XREF: ROM:TableJmp2o
		ldd	8,x
		cmpd	$A,x
		bhi	loc_E797
		beq	loc_E790
		bra	loc_E783
; ---------------------------------------------------------------------------

loc_E74C:				; DATA XREF: ROM:TableJmp2o
		ldd	8,x
		cmpd	$C,x
		bhi	loc_E797
		beq	loc_E790
		bra	loc_E783
; ---------------------------------------------------------------------------

loc_E757:				; DATA XREF: ROM:TableJmp2o
		ldd	$A,x
		cmpd	$C,x
		bhi	loc_E797
		beq	loc_E790
		bra	loc_E783
; ---------------------------------------------------------------------------

loc_E762:				; DATA XREF: ROM:TableJmp2o
		ldd	$A,x
		cmpd	8,x
		bhi	loc_E797
		beq	loc_E790
		bra	loc_E783
; ---------------------------------------------------------------------------

loc_E76D:				; DATA XREF: ROM:TableJmp2o
		ldd	$C,x
		cmpd	$A,x
		bhi	loc_E797
		beq	loc_E790
		bra	loc_E783
; ---------------------------------------------------------------------------

loc_E778:				; DATA XREF: ROM:TableJmp2o
		ldd	$C,x
		cmpd	8,x
		bhi	loc_E797
		beq	loc_E790
		bra	*+2
; ---------------------------------------------------------------------------

loc_E783:				; CODE XREF: ROM:E6ECJ	ROM:E700J ...
		lda	,y+
		lbpl	loc_E352
		bita	#$40 ; '@'
		beq	loc_E7AC
		jmp	loc_E352
; ---------------------------------------------------------------------------

loc_E790:				; CODE XREF: ROM:E6E8j	ROM:E6FCj ...
		lda	,y+
		bpl	loc_E7AC
		jmp	loc_E352
; ---------------------------------------------------------------------------

loc_E797:				; CODE XREF: ROM:E6E4j	ROM:E6F8j ...
		lda	,y+
		bita	#$C0 ; 'À'
		bne	loc_E7AC
		jmp	loc_E352
; ---------------------------------------------------------------------------

loc_E7A0:				; CODE XREF: ROM:E7DDj	ROM:loc_E7E4j ...
		lda	,y+
		bpl	loc_E7AC
		eora	7,x
		bita	#$40 ; '@'
		lbne	loc_E352

loc_E7AC:				; CODE XREF: ROM:E78Bj	ROM:E792j ...
		anda	#$3F ; '?'
		cmpa	#$30 ; '0'
		bcc	loc_E7B9
		adda	<unknown1
		leay	a,x
		jmp	loc_E352
; ---------------------------------------------------------------------------

loc_E7B9:				; CODE XREF: ROM:E7B0j
		cmpa	#$38 ; '8'
		bcc	loc_E7C7
		suba	#$2F ; '/'
		ldb	$A,x
		mul
		leay	b,y
		jmp	loc_E352
; ---------------------------------------------------------------------------

loc_E7C7:				; CODE XREF: ROM:E7BBj
		suba	#$37 ; '7'
		ldb	$C,x
		mul
		leay	b,y
		jmp	loc_E352
; ---------------------------------------------------------------------------

loc_E7D1:				; DATA XREF: ROM:TableJmp2o
		leay	1,y
		lda	$10,x
		bne	loc_E7E4
		lda	-1,y
		sta	$10,x
		bne	loc_E7A0
		leay	1,y
		jmp	loc_E352
; ---------------------------------------------------------------------------

loc_E7E4:				; CODE XREF: ROM:E7D6j	ROM:E7F3j ...
		bmi	loc_E7A0
		dec	$10,x
		bne	loc_E7A0
		leay	1,y
		jmp	loc_E352
; ---------------------------------------------------------------------------

loc_E7F0:				; DATA XREF: ROM:TableJmp2o
		lda	$10,x
		bne	loc_E7E4
		lda	$A,x
		sta	$10,x
		bne	loc_E7A0
		leay	1,y
		jmp	loc_E352
; ---------------------------------------------------------------------------

loc_E801:				; DATA XREF: ROM:TableJmp2o
		lda	$10,x
		bne	loc_E7E4
		lda	$C,x
		sta	$10,x
		bne	loc_E7A0
		leay	1,y
		jmp	loc_E352
; ---------------------------------------------------------------------------

loc_E812:				; DATA XREF: ROM:TableJmp2o
		leay	1,y
		lda	$11,x
		bne	loc_E827
		lda	-1,y
		sta	$11,x
		lbne	loc_E7A0
		leay	1,y
		jmp	loc_E352
; ---------------------------------------------------------------------------

loc_E827:				; CODE XREF: ROM:E817j	ROM:E83Aj ...
		lbmi	loc_E7A0
		dec	$11,x
		lbne	loc_E7A0
		leay	1,y
		jmp	loc_E352
; ---------------------------------------------------------------------------

loc_E837:				; DATA XREF: ROM:TableJmp2o
		lda	$11,x
		bne	loc_E827
		lda	$A,x
		sta	$11,x
		lbne	loc_E7A0
		leay	1,y
		jmp	loc_E352
; ---------------------------------------------------------------------------

loc_E84A:				; DATA XREF: ROM:TableJmp2o
		lda	$11,x
		bne	loc_E827
		lda	$C,x
		sta	$11,x
		lbne	loc_E7A0
		leay	1,y
		jmp	loc_E352
; ---------------------------------------------------------------------------

loc_E85D:				; DATA XREF: ROM:TableJmp2o
		lda	,y+
		lbeq	loc_E352
		leay	-2,y
		lbmi	loc_E3C7
		ldb	$18,x
		bne	loc_E874
		sta	$18,x
		jmp	loc_E3C7
; ---------------------------------------------------------------------------

loc_E874:				; CODE XREF: ROM:E86Cj
		dec	$18,x
		lbne	loc_E3C7
		leay	2,y
		jmp	loc_E352
; ---------------------------------------------------------------------------

loc_E880:				; DATA XREF: ROM:TableJmp2o
		ldd	$A,x
		pshs	a,b
		ldd	$C,x
		std	$A,x
		puls	b,a
		std	$C,x
		jmp	loc_E352
; ---------------------------------------------------------------------------

loc_E88F:				; DATA XREF: ROM:TableJmp2o
		ldd	$A,x
		nega
		negb
		sbca	#0
		std	$A,x
		jmp	loc_E352
; ---------------------------------------------------------------------------

loc_E89A:				; DATA XREF: ROM:TableJmp2o
		ldd	$C,x
		nega
		negb
		sbca	#0
		std	$C,x
		jmp	loc_E352
; ---------------------------------------------------------------------------

loc_E8A5:				; DATA XREF: ROM:TableJmp2o
		leay	-1,y
		lda	$18,x
		bne	loc_E8B1
		lda	#3
		sta	$18,x

loc_E8B1:				; CODE XREF: ROM:E8AAj
		leau	a,y
		lda	$10,x
		bne	loc_E8BC

loc_E8B8:				; CODE XREF: ROM:E8D9j
		lda	,u
		bra	loc_E8C1
; ---------------------------------------------------------------------------

loc_E8BC:				; CODE XREF: ROM:E8B6j
		lbmi	loc_E3C7
		deca

loc_E8C1:				; CODE XREF: ROM:E8BAj
		beq	loc_E8CD
		sta	$10,x
		ldd	-2,u
		addd	8,x
		jmp	std_$8
; ---------------------------------------------------------------------------

loc_E8CD:				; CODE XREF: ROM:loc_E8C1j
		lda	$18,x
		adda	#3
		leau	a,y
		sta	$18,x
		cmpa	#$12
		bls	loc_E8B8
		clr	$18,x
		clr	$10,x
		leay	,u
		ldd	-2,y
		jmp	std_$8
; ---------------------------------------------------------------------------

loc_E8E8:				; DATA XREF: ROM:TableJmp2o
		leay	-1,y
		lda	7,x
		bita	#$40 ; '@'
		lbne	loc_E3C7
		lda	$10,x
		bne	loc_E900
		com	$18,x
		lda	3,y
		lbeq	loc_E3C7

loc_E900:				; CODE XREF: ROM:E8F5j
		deca
		sta	$10,x
		lda	$18,x
		beq	loc_E90E
		lda	1,y
		jmp	mul_$9$8
; ---------------------------------------------------------------------------

loc_E90E:				; CODE XREF: ROM:E907j
		lda	2,y
		jmp	mul_$9$8_2
; ---------------------------------------------------------------------------

loc_E913:				; DATA XREF: ROM:TableJmp2o
		leay	-1,y
		lda	7,x
		bita	#$40 ; '@'
		lbne	loc_E3C7
		lda	$18,x
		bne	loc_E93F
		lda	1,y
		lbeq	loc_E3C7
		sta	$18,x
		ldd	8,x
		std	$A,x
		ldd	#0
		std	$C,x
		ldb	2,y
		std	$10,x
		ldb	3,y
		std	$E,x
		bra	loc_E958
; ---------------------------------------------------------------------------

loc_E93F:				; CODE XREF: ROM:E920j
		cmpa	#1
		beq	loc_E958
		dec	$18,x
		ldd	$10,x
		addb	2,y
		adca	#0
		std	$10,x
		ldd	$E,x
		addb	3,y
		adca	#0
		std	$E,x

loc_E958:				; CODE XREF: ROM:E93Dj	ROM:E941j
		ldd	$C,x
		addd	$10,x
		std	$C,x
		bita	#$40 ; '@'
		beq	loc_E964
		nega

loc_E964:				; CODE XREF: ROM:E961j
		anda	#$7F ; ''
		ldu	#$EAAF
		lda	a,u
		pshs	a
		ldb	$F,x
		mul
		adca	#0
		ldb	,s
		sta	,s
		lda	$E,x
		mul
		addb	,s+
		adca	#0
		tst	$C,x
		bpl	loc_E991
		std	8,x
		ldd	$A,x
		subd	8,x
		lbcc	std_$8
		ldd	#0
		jmp	std_$8
; ---------------------------------------------------------------------------

loc_E991:				; CODE XREF: ROM:E97Fj
		addd	$A,x
		lbcc	std_$8
		ldd	#$FFFF
		jmp	std_$8
; ---------------------------------------------------------------------------

loc_E99D:				; DATA XREF: ROM:TableJmp2o
		leay	-1,y
		lda	$18,x
		bne	loc_E9AF
		lda	8,x
		sta	1,y
		lda	3,y
		sta	$18,x
		bra	loc_E9B4
; ---------------------------------------------------------------------------

loc_E9AF:				; CODE XREF: ROM:E9A2j
		bmi	loc_E9BE
		dec	$18,x

loc_E9B4:				; CODE XREF: ROM:E9ADj
		bne	loc_E9BE
		clr	$18,x
		leay	4,y
		jmp	loc_E352
; ---------------------------------------------------------------------------

loc_E9BE:				; CODE XREF: ROM:loc_E9AFj
					; ROM:loc_E9B4j
		bsr	loc_E9FE
		lda	2,y
		pshs	a
		lsr	,s
		mul
		suba	,s
		sta	,s+
		ldb	9,x
		adda	1,y
		std	8,x
		jmp	loc_E390
; ---------------------------------------------------------------------------

loc_E9D4:				; DATA XREF: ROM:TableJmp2o
		bsr	loc_E9FE
		lda	,y
		clrb
		lsra
		rorb
		pshs	a,b
		lda	$E,x
		ldb	,y+
		mul
		subd	,s++
		std	$A,x
		jmp	loc_E352
; ---------------------------------------------------------------------------

loc_E9E9:				; DATA XREF: ROM:TableJmp2o
		bsr	loc_E9FE
		lda	,y
		clrb
		lsra
		rorb
		pshs	a,b
		lda	$E,x
		ldb	,y+
		mul
		subd	,s++
		std	$C,x
		jmp	loc_E352
; ---------------------------------------------------------------------------

loc_E9FE:				; CODE XREF: ROM:loc_E9BEp
					; ROM:loc_E9D4p ...
		ldd	$E,x
		bne	loc_EA04
		lda	#$DB ; 'Û'

loc_EA04:				; CODE XREF: ROM:EA00j
		aslb
		rola
		bcc	loc_EA0C
		eorb	#$87 ; '‡'
		eora	#$1D

loc_EA0C:				; CODE XREF: ROM:EA06j
		std	$E,x
		rts
; ---------------------------------------------------------------------------
TableJmp1:	fdb TableJmp2			    ,ldd_y_12bit_$FFF0_std_$8	     
					; DATA XREF: VoiceProcessStuff+32o
		fdb ldd_y_12bit_$FFF0_std_$A	    ,ldd_y_12bit_$FFF0_std_$C	      ;	1: const abs, step abs
		fdb TableJmp2			    ,addd_y_$8			      ;	2: exp up, exp down, repeat
		fdb addd_y_$A			    ,addd_y_$C			      ;	3: lin up, lin down
		fdb TableJmp2			    ,loc_E6DB			      ;	4:
		fdb loc_E6EF			    ,loc_E703			      ;	5: const rel, step rel
		fdb TableJmp2			    ,loc_E714			      ;	6:
		fdb loc_E723			    ,loc_E732			      ;	7:
TableJmp2:	fdb loc_E85D			    ; 0
					; DATA XREF: VoiceProcessStuff:TableJumper2o
					; ROM:TableJmp1o
		fdb loc_E7D1			    ; 1	; a=[x+0xA]
		fdb loc_E7F0			    ; 2
		fdb loc_E801			    ; 3
		fdb loc_E99D			    ; 4
		fdb loc_E812			    ; 5
		fdb loc_E837			    ; 6
		fdb loc_E84A			    ; 7
		fdb loc_E9D4			    ; 8
		fdb loc_E741			    ; 9
		fdb loc_E74C			    ; $A
		fdb loc_E757			    ; $B
		fdb loc_E9E9			    ; $C
		fdb loc_E762			    ; $D
		fdb loc_E778			    ; $E
		fdb loc_E76D			    ; $F
		fdb loc_E88F			    ; $10
		fdb ldd_$A_std_$8		    ; $11
		fdb ldd_$C_std_$8		    ; $12
		fdb ldd_$C_std_$A		    ; $13
		fdb loc_E89A			    ; $14
		fdb ldd_$8_std_$A		    ; $15
		fdb ldd_$8_std_$C		    ; $16
		fdb ldd_$A_std_$C		    ; $17
		fdb loc_E880			    ; $18
		fdb addd_$A$8			    ; $19
		fdb addd_$C$8			    ; $1A
		fdb addd_$C$A			    ; $1B
		fdb loc_E7A0			    ; $1C
		fdb addd_$8$A			    ; $1D
		fdb addd_$8$C			    ; $1E
		fdb addd_$A$C			    ; $1F
		fdb loc_E8E8			    ; $20
		fdb subd_$8$A			    ; $21
		fdb subd_$8$C			    ; $22
		fdb subd_$A$C			    ; $23
		fdb loc_E913			    ; $24
		fdb subd_$A$8			    ; $25
		fdb subd_$C$8			    ; $26
		fdb subd_$C$A			    ; $27
		fdb loc_E8A5			    ; $28
		fdb loc_E40F			    ; $29
		fdb loc_E464			    ; $2A
		fdb loc_E4C1			    ; $2B
		fdb loc_E69D			    ; $2C
		fdb lda_y_$9$8			    ; $2D
		fdb lda_y_$B$A			    ; $2E
		fdb lda_y_$D$C			    ; $2F
		fdb loc_E6BC			    ; $30
		fdb lda_y_$9$8_2		    ; $31
		fdb lda_y_$B$A_2		    ; $32
		fdb lda_y_$D$C_2		    ; $33
		fdb lda_$A_$9$8			    ; $34
		fdb lda_$C_$9$8			    ; $35
		fdb lda_$C_$B$A			    ; $36
		fdb lda_$C_$D$C			    ; $37
		fdb lda_$A_$9$8_2		    ; $38
		fdb lda_$C_$9$8_2		    ; $39
		fdb lda_$C_$B$A_2		    ; $3A
		fdb lda_$A_$D$C_2		    ; $3B
		fdb lddtst_$8$A_$9$8		    ; $3C
		fdb lddtst_$8$C_$9$8		    ; $3D
		fdb ldabeq_$C_$B$A		    ; $3E
		fdb ldabeq_$A_$D$C		    ; $3F
		fcb 0
		fcb 3
		fcb 6
		fcb 9
		fcb $C
		fcb $10
		fcb $13
		fcb $16
		fcb $19
		fcb $1C
		fcb $1F
		fcb $22	; "
		fcb $25	; %
		fcb $28	; (
		fcb $2B
		fcb $2E	; .
		fcb $31	; 1
		fcb $33	; 3
		fcb $36	; 6
		fcb $39	; 9
		fcb $3C	; <
		fcb $3F	; ?
		fcb $41	; A
		fcb $44	; D
		fcb $47	; G
		fcb $49	; I
		fcb $4C	; L
		fcb $4E	; N
		fcb $51	; Q
		fcb $53	; S
		fcb $55	; U
		fcb $58	; X
		fcb $5A	; Z
		fcb $5C	; \
		fcb $5E	; ^
		fcb $60	; `
		fcb $62	; b
		fcb $64	; d
		fcb $66	; f
		fcb $68	; h
		fcb $6A	; j
		fcb $6B	; k
		fcb $6D	; m
		fcb $6F	; o
		fcb $70	; p
		fcb $71	; q
		fcb $73	; s
		fcb $74	; t
		fcb $75	; u
		fcb $76	; v
		fcb $78	; x
		fcb $79	; y
		fcb $7A	; z
		fcb $7A	; z
		fcb $7B	; {
		fcb $7C	; |
		fcb $7D	; }
		fcb $7D	; }
		fcb $7E	; ~
		fcb $7E	; ~
		fcb $7E	; ~
		fcb $7F	; 
		fcb $7F	; 
		fcb $7F	; 
		fcb $7F	; 
		fcb $3B	; ;
; end of 'ROM'

; ===========================================================================

; Segment type:	Regular
		; segment RAM
		org $EAF1
; assume dp = $EA
unk_EAF1:	fcb $E2	; â		; DATA XREF: VoiceProcess+11r
unk_EAF2:	fcb   0			; DATA XREF: MainLoop+8w
					; VoiceProcess:loc_E244r ...
unk_EAF3:	fcb $EA	; ê		; DATA XREF: VoiceProcess+19w
					; VoiceProcess+84r ...
unknown1:	fcb $F0			; DATA XREF: VoiceProcess+1Dw
					; VoiceProcess+3Fr ...
EAF5_currentvoice:fcb $EA ; ê		; DATA XREF: VoiceProcess+Dw
					; VoiceProcess+A5r ...
unk_EAF6:	fcb $F0	; ð		; DATA XREF: MainLoop:InfiniteLoop2w
					; VoiceProcess+1Fw ...
unk_EAF7:	fcb $E2	; â		; DATA XREF: VoiceProcessStuff+8w
					; VoiceProcessStuff+Cr
		fcb $2D	; -
x_endcheck:	fcb $EA	; ê		; DATA XREF: VoiceProcess:aftersetvoicedaco
		fcb $F0	; ð
		fcb $EA	; ê
		fcb $F0	; ð
		fcb $EA	; ê
		fcb $F0	; ð
		fcb $E2	; â
; end of 'RAM'

; ===========================================================================

; [00001500 BYTES: COLLAPSED SEGMENT MASTER. PRESS CTRL-NUMPAD+	TO EXPAND]
