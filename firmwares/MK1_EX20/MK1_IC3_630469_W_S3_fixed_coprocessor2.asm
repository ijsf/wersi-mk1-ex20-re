; Input	MD5   :	45D860D9D4625D9CE804869AF1342D34
; Input	CRC32 :	B6A14562


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

; bit 4: IRQ flag (1): IRQ disabled
; bit 6: FIRQ mask flag	(1): FIRQ disabled

Entry:
		orcc	#%1010000
		lda	#$EA ; 'ê'
		tfr	a, dp		; dp = 0xea
		lda	#$19
		sta	<unk_EAF2	; =$19
		ldx	#$F062
		lda	#$FF
		ldb	#$14

loc_E211:				; CODE XREF: Entry+17j
		sta	,x
		leax	$FFBB,x		; -$45
		decb
		bne	loc_E211
		lda	#$18
		sta	MUXLatch
		lda	#$20 ; ' '
		sta	MUXLatch
		lds	#$E1FC

Infinite2_andcc_BF:			; CODE XREF: IRQVector+F8j
		andcc	#%10111111	; clear	FIRQ mask flag:	FIRQ enabled

InfiniteLoop2:				; CODE XREF: Entry+2Bj
		clr	<unk_EAF6
		bra	InfiniteLoop2
; End of function Entry


; =============== S U B	R O U T	I N E =======================================


IRQVector:
		lds	#$E1FC
		lda	#$EA ; 'ê'
		tfr	a, dp		; dp = 0xEA
		ldx	#$F05D
		lda	#$14
		sta	<EAF5_currentvoice
		ldb	#25		; b=$19
		lda	<byte_EAF1
		beq	loc_E244
		addb	#$2C ; ','      ; b=$19+$2C

loc_E244:				; CODE XREF: IRQVector+13j
		subb	<unk_EAF2
		stb	<byte_EAF3
		ldb	<unk_EAF2
		stb	<unknown1
		clr	<unk_EAF6
		bra	loc_E258
; ---------------------------------------------------------------------------

IRQVector_forloop:			; CODE XREF: IRQVector+109j
		clr	<unk_EAF6
		lda	5,x
		lbeq	resetvoicedac	; y = 0

loc_E258:				; CODE XREF: IRQVector+21j
		lda	2,x
		bne	stu_x_$16	; if [x+$2] != 0
		lda	1,x
		bne	stu_2_x_$16	; if [x+$1] != 0
		lda	0,x
		bne	loc_E2AA	; if [x+$0] != 0
		bra	IRQVector_chk_eventually
; ---------------------------------------------------------------------------

stu_2_x_$16:				; CODE XREF: IRQVector+31j
		clr	1,x
		lda	0,x
		bne	clear_$0$3	; [x+$3] = 0
		lda	<unknown1
		inca
		lda	a,x
		bmi	IRQVector_chk_eventually
		adda	<unknown1
		leau	a,x
		stu	$16,x
		clra
		clrb
		sta	$18,x
		std	$10,x
		lda	#1
		sta	4,x
		bra	IRQVector_chk_eventually
; ---------------------------------------------------------------------------

stu_x_$16:				; CODE XREF: IRQVector+2Dj
		clr	2,x
		clr	1,x
		lda	0,x
		bne	clear_$0$3	; [x+$3] = 0
		clra
		clrb
		std	8,x
		ldb	<unknown1
		addb	#$2C ; ','      ; b+=44
		leau	b,x		; u=b+x
		stu	$16,x
		lda	#1
		sta	4,x
		bra	IRQVector_chk_eventually
; ---------------------------------------------------------------------------

clear_$0$3:				; CODE XREF: IRQVector+3Dj
					; IRQVector+61j
		clr	3,x		; [x+$3] = 0
		clr	0,x		; [x+$0] = 0
		jmp	resetvoiceeclk
; ---------------------------------------------------------------------------

loc_E2AA:				; CODE XREF: IRQVector+35j
		clra
		clrb
		std	8,x		; [x+$8]=0
		std	$10,x		; [x+$10] = 0
		lda	<byte_EAF3
		beq	loc_E2BB
		adda	<unknown1
		sta	<unk_EAF2
		sta	<unknown1

loc_E2BB:				; CODE XREF: IRQVector+86j
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

IRQVector_chk_eventually:		; CODE XREF: IRQVector+37j
					; IRQVector+44j ...
		lda	4,x
		beq	resetvoiceeclk
		suba	#$10
		bcs	loc_E2E0
		sta	4,x

loc_E2E0:				; CODE XREF: IRQVector+AFj
		jsr	VoiceProcessStuff ; [x+16]
		ldd	$14,x
		adda	4,x
		bcc	skipareset
		lda	#$FF		; a = 0xFF (eclk)

skipareset:				; CODE XREF: IRQVector+BBj
		sta	3,x
		subd	#$110
		bcc	loc_E303	; y=[x+14]
		clr	4,x
		clr	3,x

resetvoiceeclk:				; CODE XREF: IRQVector+7AJ
					; IRQVector+ABj
		ldy	#0
		bra	setvoiceeclk_pre
; ---------------------------------------------------------------------------

resetvoicedac:				; CODE XREF: IRQVector+27j
		ldy	#0		; y = 0
		bra	setvoicedac
; ---------------------------------------------------------------------------

loc_E303:				; CODE XREF: IRQVector+C4j
		ldy	$14,x		; y=[x+14]

setvoiceeclk_pre:			; CODE XREF: IRQVector+CEj
		ldb	<EAF5_currentvoice
		cmpb	#20
		beq	aftersetvoicedac ; if(currentvoice == 20) skip eclk/dac	sets

setvoiceeclk:
		ldu	#eclk1
		sta	b,u		; eclk[voice (b)] = a

setvoicedac:				; CODE XREF: IRQVector+D4j
		lda	#32
		sta	MUXLatch	; mux =	reset
		sty	ENVDAC1		; dac =	y = [x+14]
		lda	<EAF5_currentvoice
		adda	#4
		sta	MUXLatch	; mux =	voice (b)

aftersetvoicedac:			; CODE XREF: IRQVector+DEj
		cmpx	#x_endcheck
		lbeq	Infinite2_andcc_BF ; clear FIRQ	mask flag: FIRQ	enabled
		bcs	Infinite_FF	; interrupt busy loop stuff?
		lda	#$19
		sta	<unknown1	; =0x19
		clr	<byte_EAF3
		leax	$FFBB,x		; x -= $45
		dec	<EAF5_currentvoice ; currentvoice--
		lbpl	IRQVector_forloop ; if(currentvoice > 0)
		bra	Infinite_FE
; ---------------------------------------------------------------------------

Infinite_FF:				; CODE XREF: IRQVector+FCj
		lda	#$FF		; interrupt busy loop stuff?
		bra	InfiniteLoop
; ---------------------------------------------------------------------------

Infinite_FE:				; CODE XREF: IRQVector+10Dj
		lda	#$FE ; 'þ'
		bra	InfiniteLoop
; End of function IRQVector

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR VoiceProcessStuff

Infinite_FD:				; CODE XREF: VoiceProcessStuff+Ej
		lda	#$FD ; 'ý'
		bra	InfiniteLoop
; ---------------------------------------------------------------------------

Infinite_FC:				; CODE XREF: VoiceProcessStuff+11j
					; VoiceProcessStuff+24j
		lda	#$FC ; 'ü'

InfiniteLoop:				; CODE XREF: IRQVector+111j
					; IRQVector+115j ...
		sta	<unk_EAF6
		bra	InfiniteLoop
; END OF FUNCTION CHUNK	FOR VoiceProcessStuff

; =============== S U B	R O U T	I N E =======================================

; [x+16]

VoiceProcessStuff:			; CODE XREF: IRQVector:loc_E2E0P

; FUNCTION CHUNK AT E344 SIZE 0000000A BYTES

		ldy	$16,x

VoiceProcessStuff_:			; CODE XREF: set_y12bitFFF0_std_$A+8J
					; set_y12bitFFF0_std_$C+8J ...
		ldb	<unknown1
		leau	b,x
		stu	<word_EAF7
		tfr	y, d
		subd	<word_EAF7
		bmi	Infinite_FD
		tsta
		bne	Infinite_FC
		cmpb	#$2C ; ','
		bcs	TableJumper1	; if (b	< $2C)
		cmpb	#$31 ; '1'
		bcs	ldd_$8_mulmulmul_rts ; if (b < $31)
		bhi	loc_E370	; if (b	> $31)
		ldd	#$FFFF		; if (b	== 31)
		bra	std_$8_mulmulmul_rts ; $8 is $FFFF
; ---------------------------------------------------------------------------

loc_E370:				; CODE XREF: VoiceProcessStuff+1Bj
		cmpb	#$32 ; '2'
		bhi	Infinite_FC	; if (b	> $32)
		clra			; if (b	== 32)
		clrb
		bra	std_$8_mulmulmul_rts ; $8 is $0
; ---------------------------------------------------------------------------

TableJumper1:				; CODE XREF: VoiceProcessStuff+15j
		lda	,y+		; [y], y++
		tfr	a, b		; b = a	= [y]
		anda	#%11
		beq	TableJumper2	; if multiple of 4
					;
					; $0 ->	REG $0
					; $1 ->	LIT $2
					; $2 ->	LIT $4
					; $3 ->	LIT $6
					; $4 ->	REG $2
					; $5 ->	LIT $A
					; $6 ->	LIT $C
					; $7 ->	LIT $E
					; $8 ->	REG $4
					;
					; REG:
					; LIT: if(i%4 != 0) i*2
		ldu	#TableYOps	; table
		aslb			; lslb
		andb	#%11110
		jmp	[b,u]
; ---------------------------------------------------------------------------

TableJumper2:				; CODE XREF: VoiceProcessStuff+30j
		ldu	#TableROps	; table
		lsrb
		jmp	[b,u]
; ---------------------------------------------------------------------------

std_$8_mulmulmul_rts:			; CODE XREF: VoiceProcessStuff+20j
					; VoiceProcessStuff+28j ...
		std	8,x

mulmulmul_rts:				; CODE XREF: VoiceProcessStuff+7Bj
					; noise_$8+34J
		sty	$16,x
		ldb	$12,x
		mul
		pshs	a,b
		lda	$12,x
		ldb	9,x
		mul
		addd	#$FF
		addd	,s++
		bcs	mul_rts
		pshs	a
		ldb	$12,x
		lda	8,x
		mul
		addb	,s+
		adca	#0
		std	$14,x		; [x+14] value
		rts
; ---------------------------------------------------------------------------

mul_rts:				; CODE XREF: VoiceProcessStuff+57j
		pshs	a
		ldb	$12,x
		lda	8,x
		mul
		addb	,s+
		adca	#1
		std	$14,x		; [x+14] value
		rts
; ---------------------------------------------------------------------------

ldd_$8_mulmulmul_rts:			; CODE XREF: VoiceProcessStuff+19j
					; dec_mod_$18_with_y_signed+8j	...
		ldd	8,x
		bra	mulmulmul_rts
; End of function VoiceProcessStuff


; =============== S U B	R O U T	I N E =======================================


set_y12bitFFF0_std_$8:			; DATA XREF: ROM:TableYOpso
		ldb	-1,y
		lda	,y+
		andb	#$F0 ; 'ð'
		bra	std_$8_mulmulmul_rts
; End of function set_y12bitFFF0_std_$8


; =============== S U B	R O U T	I N E =======================================


set_y12bitFFF0_std_$A:			; DATA XREF: ROM:TableYOpso
		ldb	-1,y
		lda	,y+
		andb	#$F0 ; 'ð'
		std	$A,x
		jmp	VoiceProcessStuff_
; End of function set_y12bitFFF0_std_$A


; =============== S U B	R O U T	I N E =======================================


set_y12bitFFF0_std_$C:			; DATA XREF: ROM:TableYOpso
		ldb	-1,y
		lda	,y+
		andb	#$F0 ; 'ð'
		std	$C,x
		jmp	VoiceProcessStuff_
; End of function set_y12bitFFF0_std_$C


; =============== S U B	R O U T	I N E =======================================


set_$A_std_$8:				; DATA XREF: ROM:TableROpso
		ldd	$A,x
		jmp	std_$8_mulmulmul_rts
; End of function set_$A_std_$8


; =============== S U B	R O U T	I N E =======================================


set_$C_std_$8:				; DATA XREF: ROM:TableROpso
		ldd	$C,x
		jmp	std_$8_mulmulmul_rts
; End of function set_$C_std_$8


; =============== S U B	R O U T	I N E =======================================


set_$C_std_$A:				; DATA XREF: ROM:TableROpso
		ldd	$C,x
		std	$A,x
		jmp	VoiceProcessStuff_
; End of function set_$C_std_$A


; =============== S U B	R O U T	I N E =======================================


set_$8_std_$A:				; DATA XREF: ROM:TableROpso
		ldd	8,x
		std	$A,x
		jmp	VoiceProcessStuff_
; End of function set_$8_std_$A


; =============== S U B	R O U T	I N E =======================================


set_$8_std_$C:				; DATA XREF: ROM:TableROpso
		ldd	8,x
		std	$C,x
		jmp	VoiceProcessStuff_
; End of function set_$8_std_$C


; =============== S U B	R O U T	I N E =======================================


set_$A_std_$C:				; DATA XREF: ROM:TableROpso
		ldd	$A,x
		std	$C,x
		jmp	VoiceProcessStuff_
; End of function set_$A_std_$C


; =============== S U B	R O U T	I N E =======================================


sub_E40F:				; DATA XREF: ROM:TableROpso
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
		jmp	std_$8_mulmulmul_rts
; ---------------------------------------------------------------------------

loc_E426:				; CODE XREF: sub_E40F+10j
		subb	#$30 ; '0'
		clra
		jmp	std_$8_mulmulmul_rts
; ---------------------------------------------------------------------------

loc_E42C:				; CODE XREF: sub_E40F+Aj
		andb	#$3F ; '?'
		cmpb	#$30 ; '0'
		lbcc	VoiceProcessStuff_
		leau	b,u
		ldd	8,x
		std	,u
		jmp	VoiceProcessStuff_
; ---------------------------------------------------------------------------

loc_E43D:				; CODE XREF: sub_E40F+6j
		bitb	#$40 ; '@'
		bne	loc_E455
		andb	#$3F ; '?'
		cmpb	#$30 ; '0'
		bcc	loc_E44D
		lda	b,u
		clrb
		jmp	std_$8_mulmulmul_rts
; ---------------------------------------------------------------------------

loc_E44D:				; CODE XREF: sub_E40F+36j
		subb	#$30 ; '0'
		tfr	b, a
		clrb
		jmp	std_$8_mulmulmul_rts
; ---------------------------------------------------------------------------

loc_E455:				; CODE XREF: sub_E40F+30j
		andb	#$3F ; '?'
		cmpb	#$30 ; '0'
		lbcc	VoiceProcessStuff_
		lda	8,x
		sta	b,u
		jmp	VoiceProcessStuff_
; End of function sub_E40F


; =============== S U B	R O U T	I N E =======================================


sub_E464:				; DATA XREF: ROM:TableROpso
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
		jmp	VoiceProcessStuff_
; ---------------------------------------------------------------------------

loc_E47D:				; CODE XREF: sub_E464+10j
		subb	#$30 ; '0'
		clra
		std	$A,x
		jmp	VoiceProcessStuff_
; ---------------------------------------------------------------------------

loc_E485:				; CODE XREF: sub_E464+Aj
		andb	#$3F ; '?'
		cmpb	#$30 ; '0'
		lbcc	VoiceProcessStuff_
		leau	b,u
		ldd	$A,x
		std	,u
		jmp	VoiceProcessStuff_
; ---------------------------------------------------------------------------

loc_E496:				; CODE XREF: sub_E464+6j
		bitb	#$40 ; '@'
		bne	loc_E4B2
		andb	#$3F ; '?'
		cmpb	#$30 ; '0'
		bcc	loc_E4A8
		lda	b,u
		clrb
		std	$A,x
		jmp	VoiceProcessStuff_
; ---------------------------------------------------------------------------

loc_E4A8:				; CODE XREF: sub_E464+3Aj
		subb	#$30 ; '0'
		tfr	b, a
		clra
		std	$A,x
		jmp	VoiceProcessStuff_
; ---------------------------------------------------------------------------

loc_E4B2:				; CODE XREF: sub_E464+34j
		andb	#$3F ; '?'
		cmpb	#$30 ; '0'
		lbcc	VoiceProcessStuff_
		lda	$A,x
		sta	b,u
		jmp	VoiceProcessStuff_
; End of function sub_E464


; =============== S U B	R O U T	I N E =======================================


sub_E4C1:				; DATA XREF: ROM:TableROpso
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
		jmp	VoiceProcessStuff_
; ---------------------------------------------------------------------------

loc_E4DA:				; CODE XREF: sub_E4C1+10j
		subb	#$30 ; '0'
		clra
		std	$C,x
		jmp	VoiceProcessStuff_
; ---------------------------------------------------------------------------

loc_E4E2:				; CODE XREF: sub_E4C1+Aj
		andb	#$3F ; '?'
		cmpb	#$30 ; '0'
		lbcc	VoiceProcessStuff_
		leau	b,u
		ldd	$C,x
		std	,u
		jmp	VoiceProcessStuff_
; ---------------------------------------------------------------------------

loc_E4F3:				; CODE XREF: sub_E4C1+6j
		bitb	#$40 ; '@'
		bne	loc_E50F
		andb	#$3F ; '?'
		cmpb	#$30 ; '0'
		bcc	loc_E505
		lda	b,u
		clrb
		std	$C,x
		jmp	VoiceProcessStuff_
; ---------------------------------------------------------------------------

loc_E505:				; CODE XREF: sub_E4C1+3Aj
		subb	#$30 ; '0'
		tfr	b, a
		clrb
		std	$C,x
		jmp	VoiceProcessStuff_
; ---------------------------------------------------------------------------

loc_E50F:				; CODE XREF: sub_E4C1+34j
		andb	#$3F ; '?'
		cmpb	#$30 ; '0'
		lbcc	VoiceProcessStuff_
		lda	$C,x
		sta	b,u
		jmp	VoiceProcessStuff_
; End of function sub_E4C1


; =============== S U B	R O U T	I N E =======================================


add_y12bitFFF0_$8:			; DATA XREF: ROM:TableYOpso
		ldb	-1,y
		lda	,y+
		andb	#$F0 ; 'ð'
		addd	8,x
		jmp	std_$8_mulmulmul_rts
; End of function add_y12bitFFF0_$8


; =============== S U B	R O U T	I N E =======================================


add_y12bitFFF0_$A:			; DATA XREF: ROM:TableYOpso
		ldb	-1,y
		lda	,y+
		andb	#$F0 ; 'ð'
		addd	$A,x
		std	$A,x
		jmp	VoiceProcessStuff_
; End of function add_y12bitFFF0_$A


; =============== S U B	R O U T	I N E =======================================


add_y12bitFFF0_$C:			; DATA XREF: ROM:TableYOpso
		ldb	-1,y
		lda	,y+
		andb	#$F0 ; 'ð'
		addd	$C,x
		std	$C,x
		jmp	VoiceProcessStuff_
; End of function add_y12bitFFF0_$C


; =============== S U B	R O U T	I N E =======================================


add_$A_$8_std_$8:			; DATA XREF: ROM:TableROpso
		ldd	$A,x
		addd	8,x
		jmp	std_$8_mulmulmul_rts
; End of function add_$A_$8_std_$8


; =============== S U B	R O U T	I N E =======================================


add_$C_$8_std_$8:			; DATA XREF: ROM:TableROpso
		ldd	$C,x
		addd	8,x
		lbcc	std_$8_mulmulmul_rts
		ldd	#$FFFF
		jmp	std_$8_mulmulmul_rts
; End of function add_$C_$8_std_$8


; =============== S U B	R O U T	I N E =======================================


add_$C_$A_std_$A:			; DATA XREF: ROM:TableROpso
		ldd	$C,x
		addd	$A,x
		std	$A,x
		jmp	VoiceProcessStuff_
; End of function add_$C_$A_std_$A


; =============== S U B	R O U T	I N E =======================================


add_$8_$A_std_$A:			; DATA XREF: ROM:TableROpso
		ldd	8,x
		addd	$A,x
		std	$A,x
		jmp	VoiceProcessStuff_
; End of function add_$8_$A_std_$A


; =============== S U B	R O U T	I N E =======================================


add_$A_$C_std_$C:			; DATA XREF: ROM:TableROpso
		ldd	$A,x
		addd	$C,x
		std	$C,x
		jmp	VoiceProcessStuff_
; End of function add_$A_$C_std_$C


; =============== S U B	R O U T	I N E =======================================


add_$8_$C_std_$C:			; DATA XREF: ROM:TableROpso
		ldd	8,x
		addd	$C,x
		std	$C,x
		jmp	VoiceProcessStuff_
; End of function add_$8_$C_std_$C


; =============== S U B	R O U T	I N E =======================================

; [$8] = [$8] -	[$A]

subt_$8_$A_std_$8:			; DATA XREF: ROM:TableROpso
		ldd	8,x
		subd	$A,x
		jmp	std_$8_mulmulmul_rts
; End of function subt_$8_$A_std_$8


; =============== S U B	R O U T	I N E =======================================


subt_$8_$C_std_$8:			; DATA XREF: ROM:TableROpso
		ldd	8,x
		subd	$C,x
		lbcc	std_$8_mulmulmul_rts
		clra			; if negative, store 0
		clrb
		jmp	std_$8_mulmulmul_rts
; End of function subt_$8_$C_std_$8


; =============== S U B	R O U T	I N E =======================================


subt_$A_$C_std_$A:			; DATA XREF: ROM:TableROpso
		ldd	$A,x
		subd	$C,x
		std	$A,x
		jmp	VoiceProcessStuff_
; End of function subt_$A_$C_std_$A


; =============== S U B	R O U T	I N E =======================================


subt_$A_$8_std_$A:			; DATA XREF: ROM:TableROpso
		ldd	$A,x
		subd	8,x
		std	$A,x
		jmp	VoiceProcessStuff_
; End of function subt_$A_$8_std_$A


; =============== S U B	R O U T	I N E =======================================


subt_$C_$A_std_$C:			; DATA XREF: ROM:TableROpso
		ldd	$C,x
		subd	$A,x
		std	$C,x
		jmp	VoiceProcessStuff_
; End of function subt_$C_$A_std_$C


; =============== S U B	R O U T	I N E =======================================


subt_$C_$8_std_$C:			; DATA XREF: ROM:TableROpso
		ldd	$C,x
		subd	8,x
		std	$C,x
		jmp	VoiceProcessStuff_
; End of function subt_$C_$8_std_$C


; =============== S U B	R O U T	I N E =======================================


mul_neg_$A_$8$9:			; DATA XREF: ROM:TableROpso
		ldd	8,x
		tst	$A,x
		lbeq	std_$8_mulmulmul_rts ; if 0
		lda	$A,x
		nega
		bra	mul___$8$9
; End of function mul_neg_$A_$8$9


; =============== S U B	R O U T	I N E =======================================


mul_neg_$C_$8$9:			; DATA XREF: ROM:TableROpso
		ldd	8,x
		tst	$C,x
		lbeq	std_$8_mulmulmul_rts ; if [x+$C] zero, keep value
		lda	$C,x
		nega
		bra	mul___$8$9
; End of function mul_neg_$C_$8$9


; =============== S U B	R O U T	I N E =======================================


mul_$C_$8$9:				; DATA XREF: ROM:TableROpso
		lda	$C,x
		bra	mul___$8$9
; End of function mul_$C_$8$9


; =============== S U B	R O U T	I N E =======================================


mul_$A_$8$9:				; DATA XREF: ROM:TableROpso
		lda	$A,x
		bra	mul___$8$9
; End of function mul_$A_$8$9


; =============== S U B	R O U T	I N E =======================================


mul_y_$8$9:				; DATA XREF: ROM:TableROpso
		lda	,y+
; End of function mul_y_$8$9

; START	OF FUNCTION CHUNK FOR vibrato1

mul___$8$9:				; CODE XREF: mul_neg_$A_$8$9+Bj
					; mul_neg_$C_$8$9+Bj ...
		pshs	a
		ldb	9,x
		mul
		ldb	,s
		sta	,s
		lda	8,x
		mul
		addb	,s+
		adca	#0
		jmp	std_$8_mulmulmul_rts
; END OF FUNCTION CHUNK	FOR vibrato1

; =============== S U B	R O U T	I N E =======================================


mul_neg_$C_$A$B:			; DATA XREF: ROM:TableROpso
		lda	$C,x
		lbeq	VoiceProcessStuff_
		nega
		bra	mul___$A$B
; End of function mul_neg_$C_$A$B


; =============== S U B	R O U T	I N E =======================================


mul_$C_$A$B:				; DATA XREF: ROM:TableROpso
		lda	$C,x
		bra	mul___$A$B
; End of function mul_$C_$A$B


; =============== S U B	R O U T	I N E =======================================


mul_y_$A$B:				; DATA XREF: ROM:TableROpso
		lda	,y+
; End of function mul_y_$A$B


; =============== S U B	R O U T	I N E =======================================


mul___$A$B:				; CODE XREF: mul_neg_$C_$A$B+7j
					; mul_$C_$A$B+2j
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
		jmp	VoiceProcessStuff_
; End of function mul___$A$B


; =============== S U B	R O U T	I N E =======================================

; a=[x+0xA]

mul_neg_$A_$C$D:			; DATA XREF: ROM:TableROpso
		lda	$A,x
		lbeq	VoiceProcessStuff_
		nega
		bra	mul___$C$D	; 8-bit	(y) with 16-bit	multiply
; End of function mul_neg_$A_$C$D


; =============== S U B	R O U T	I N E =======================================

; a=[x+0xC]

mul_$C_$C$D:				; DATA XREF: ROM:TableROpso
		lda	$C,x
		bra	mul___$C$D	; 8-bit	(y) with 16-bit	multiply
; End of function mul_$C_$C$D


; =============== S U B	R O U T	I N E =======================================


mul_y_$C$D:				; DATA XREF: ROM:TableROpso
		lda	,y+
; End of function mul_y_$C$D


; =============== S U B	R O U T	I N E =======================================

; 8-bit	(y) with 16-bit	multiply

mul___$C$D:				; CODE XREF: mul_neg_$A_$C$D+7j
					; mul_$C_$C$D+2j
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
		jmp	VoiceProcessStuff_
; End of function mul___$C$D


; =============== S U B	R O U T	I N E =======================================


mad_$C_$8$9:				; DATA XREF: ROM:TableROpso
		lda	$C,x
		bra	mad___$8$9
; End of function mad_$C_$8$9


; =============== S U B	R O U T	I N E =======================================


mad_$A_$8$9:				; DATA XREF: ROM:TableROpso
		lda	$A,x
		bra	mad___$8$9
; End of function mad_$A_$8$9


; =============== S U B	R O U T	I N E =======================================


mad_y_$8$9:				; DATA XREF: ROM:TableROpso
		lda	,y+
; End of function mad_y_$8$9

; START	OF FUNCTION CHUNK FOR vibrato1

mad___$8$9:				; CODE XREF: mad_$C_$8$9+2j
					; mad_$A_$8$9+2j ...
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
		lbcc	std_$8_mulmulmul_rts
		ldd	#$FFFF
		jmp	std_$8_mulmulmul_rts
; END OF FUNCTION CHUNK	FOR vibrato1

; =============== S U B	R O U T	I N E =======================================


mad_$C_$A$B:				; DATA XREF: ROM:TableROpso
		lda	$C,x
		bra	mulw___$A$B
; End of function mad_$C_$A$B


; =============== S U B	R O U T	I N E =======================================


mad_y_$A$B:				; DATA XREF: ROM:TableROpso
		lda	,y+

mulw___$A$B:				; CODE XREF: mad_$C_$A$B+2j
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
		bcc	mulw___$A$B_std
		ldd	#$FFFF

mulw___$A$B_std:			; CODE XREF: mad_y_$A$B+14j
		std	$A,x
		jmp	VoiceProcessStuff_
; End of function mad_y_$A$B


; =============== S U B	R O U T	I N E =======================================


mad_$A_$C$D:				; DATA XREF: ROM:TableROpso
		lda	$A,x
		bra	mulw___$C$D
; End of function mad_$A_$C$D


; =============== S U B	R O U T	I N E =======================================


mad_y_$C$D:				; DATA XREF: ROM:TableROpso
		lda	,y+

mulw___$C$D:				; CODE XREF: mad_$A_$C$D+2j
		pshs	a
		ldb	$D,x
		mul			; d = a,b = a *	[x+$D]
		ldb	,s
		sta	,s
		lda	$C,x
		mul			; d = a,b = a *	[x+$C]
		addb	,s+		; b (lo) += 1st	mul hi
		adca	#0		; add carry
		addd	$C,x
		bcc	mulw___$C$D_std	; if less than
		ldd	#$FFFF

mulw___$C$D_std:			; CODE XREF: mad_y_$C$D+14j
		std	$C,x
		jmp	VoiceProcessStuff_
; End of function mad_y_$C$D


; =============== S U B	R O U T	I N E =======================================

; 8-bit	(y) by 16-bit multiply

mul_y_$A$B_max:				; DATA XREF: ROM:TableROpso
		lda	$A,x
		ldb	,y
		mul
		tsta
		bne	mul_y_$A$B_reset
		pshs	b
		lda	$B,x
		ldb	,y+
		mul
		addb	,s+
		adca	#0
		lbcc	mul_y_$A$B_std

mul_y_$A$B_reset:			; CODE XREF: mul_y_$A$B_max+6j
		ldd	#$FFFF

mul_y_$A$B_std:				; CODE XREF: mul_y_$A$B_max+13j
		std	$A,x
		jmp	VoiceProcessStuff_
; End of function mul_y_$A$B_max


; =============== S U B	R O U T	I N E =======================================

; 8-bit	(y) by 16-bit multiply

mul_y_$C$D_max:				; DATA XREF: ROM:TableROpso
		lda	$C,x
		ldb	,y
		mul			; [x+$C] * [y]
		tsta
		bne	mul_y_$C$D_reset ; if mul overflowed past 8-bit
		pshs	b		; store	b (lo 8-bit) on	stack
		lda	$D,x
		ldb	,y+
		mul
		addb	,s+		; add b	on stack to b
		adca	#0		; add carry to a
		lbcc	mul_y_$C$D_std

mul_y_$C$D_reset:			; CODE XREF: mul_y_$C$D_max+6j
		ldd	#$FFFF

mul_y_$C$D_std:				; CODE XREF: mul_y_$C$D_max+13j
		std	$C,x
		jmp	VoiceProcessStuff_
; End of function mul_y_$C$D_max


; =============== S U B	R O U T	I N E =======================================

; lower	than

islt_y12bitFFF0_$8:			; DATA XREF: ROM:TableYOpso

; FUNCTION CHUNK AT E783 SIZE 0000001D BYTES
; FUNCTION CHUNK AT E7AC SIZE 00000025 BYTES

		ldb	-1,y
		lda	,y+
		andb	#$F0 ; 'ð'
		cmpd	8,x
		lbcs	epi_jumper	; epilogue = last 8 bits of 6-byte module data,
					; containing the next instruction to jump to, if any
		lbeq	is_equal	; else if equal
		jmp	is_false	; evaluates to false
; End of function islt_y12bitFFF0_$8


; =============== S U B	R O U T	I N E =======================================

; lower	than

islt_y12bitFFF0_$A:			; DATA XREF: ROM:TableYOpso
		ldb	-1,y
		lda	,y+
		andb	#$F0 ; 'ð'
		cmpd	$A,x
		lbcs	epi_jumper	; epilogue = last 8 bits of 6-byte module data,
					; containing the next instruction to jump to, if any
		lbeq	is_equal	; else if equal
		jmp	is_false	; evaluates to false
; End of function islt_y12bitFFF0_$A


; =============== S U B	R O U T	I N E =======================================

; lower	than

islt_y12bitFFF0_$C:			; DATA XREF: ROM:TableYOpso
		ldb	-1,y
		lda	,y+
		andb	#$F0 ; 'ð'
		cmpd	$C,x
		lbcs	epi_jumper	; epilogue = last 8 bits of 6-byte module data,
					; containing the next instruction to jump to, if any
		beq	is_equal	; else if equal
		bra	is_false	; evaluates to false
; End of function islt_y12bitFFF0_$C


; =============== S U B	R O U T	I N E =======================================

; greater than

isgt_y12bitFFF0_$8:			; DATA XREF: ROM:TableYOpso
		ldb	-1,y
		lda	,y+
		andb	#$F0 ; 'ð'
		cmpd	8,x
		bhi	epi_jumper	; epilogue = last 8 bits of 6-byte module data,
					; containing the next instruction to jump to, if any
		beq	is_equal	; else if equal
		bra	is_false	; evaluates to false
; End of function isgt_y12bitFFF0_$8


; =============== S U B	R O U T	I N E =======================================

; greater than

isgt_y12bitFFF0_$A:			; DATA XREF: ROM:TableYOpso
		ldb	-1,y
		lda	,y+
		andb	#$F0 ; 'ð'
		cmpd	$A,x
		bhi	epi_jumper	; epilogue = last 8 bits of 6-byte module data,
					; containing the next instruction to jump to, if any
		beq	is_equal	; else if equal
		bra	is_false	; evaluates to false
; End of function isgt_y12bitFFF0_$A


; =============== S U B	R O U T	I N E =======================================

; greater than

isgt_y12bitFFF0_$C:			; DATA XREF: ROM:TableYOpso
		ldb	-1,y
		lda	,y+
		andb	#$F0 ; 'ð'
		cmpd	$C,x
		bhi	epi_jumper	; epilogue = last 8 bits of 6-byte module data,
					; containing the next instruction to jump to, if any
		beq	is_equal	; else if equal
		bra	is_false	; evaluates to false
; End of function isgt_y12bitFFF0_$C


; =============== S U B	R O U T	I N E =======================================


isgt_$8_$A:				; DATA XREF: ROM:TableROpso
		ldd	8,x
		cmpd	$A,x
		bhi	epi_jumper	; epilogue = last 8 bits of 6-byte module data,
					; containing the next instruction to jump to, if any
		beq	is_equal	; else if equal
		bra	is_false	; evaluates to false
; End of function isgt_$8_$A


; =============== S U B	R O U T	I N E =======================================


isgt_$8_$C:				; DATA XREF: ROM:TableROpso
		ldd	8,x
		cmpd	$C,x
		bhi	epi_jumper	; epilogue = last 8 bits of 6-byte module data,
					; containing the next instruction to jump to, if any
		beq	is_equal	; else if equal
		bra	is_false	; evaluates to false
; End of function isgt_$8_$C


; =============== S U B	R O U T	I N E =======================================


isgt_$A_$C:				; DATA XREF: ROM:TableROpso
		ldd	$A,x
		cmpd	$C,x
		bhi	epi_jumper	; epilogue = last 8 bits of 6-byte module data,
					; containing the next instruction to jump to, if any
		beq	is_equal	; else if equal
		bra	is_false	; evaluates to false
; End of function isgt_$A_$C


; =============== S U B	R O U T	I N E =======================================


isgt_$A_$8:				; DATA XREF: ROM:TableROpso
		ldd	$A,x
		cmpd	8,x
		bhi	epi_jumper	; epilogue = last 8 bits of 6-byte module data,
					; containing the next instruction to jump to, if any
		beq	is_equal	; else if equal
		bra	is_false	; evaluates to false
; End of function isgt_$A_$8


; =============== S U B	R O U T	I N E =======================================


isgt_$C_$A:				; DATA XREF: ROM:TableROpso
		ldd	$C,x
		cmpd	$A,x
		bhi	epi_jumper	; epilogue = last 8 bits of 6-byte module data,
					; containing the next instruction to jump to, if any
		beq	is_equal	; else if equal
		bra	is_false	; evaluates to false
; End of function isgt_$C_$A


; =============== S U B	R O U T	I N E =======================================


isgt_$C_$8:				; DATA XREF: ROM:TableROpso
		ldd	$C,x
		cmpd	8,x
		bhi	epi_jumper	; epilogue = last 8 bits of 6-byte module data,
					; containing the next instruction to jump to, if any
		beq	is_equal	; else if equal
		bra	*+2		; evaluates to false
; End of function isgt_$C_$8

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR islt_y12bitFFF0_$8

is_false:				; CODE XREF: islt_y12bitFFF0_$8+11J
					; islt_y12bitFFF0_$A+11J ...
		lda	,y+		; evaluates to false
		lbpl	VoiceProcessStuff_
		bita	#$40 ; '@'
		beq	epi_C0_jump	; epilogue processing
		jmp	VoiceProcessStuff_
; ---------------------------------------------------------------------------

is_equal:				; CODE XREF: islt_y12bitFFF0_$8+Dj
					; islt_y12bitFFF0_$A+Dj ...
		lda	,y+		; else if equal
		bpl	epi_C0_jump	; epilogue processing
		jmp	VoiceProcessStuff_
; ---------------------------------------------------------------------------

epi_jumper:				; CODE XREF: islt_y12bitFFF0_$8+9j
					; islt_y12bitFFF0_$A+9j ...
		lda	,y+		; epilogue = last 8 bits of 6-byte module data,
					; containing the next instruction to jump to, if any
		bita	#%11000000	; check	for C0 mask
		bne	epi_C0_jump	; epilogue processing
		jmp	VoiceProcessStuff_
; END OF FUNCTION CHUNK	FOR islt_y12bitFFF0_$8

; =============== S U B	R O U T	I N E =======================================

; if not zero

somexortest:				; CODE XREF: dec_mod_$10_with_y+Cj
					; dec_mod_$10_with_y:dec_mod_$10j ...
		lda	,y+
		bpl	epi_C0_jump	; if positive
		eora	7,x
		bita	#%1000000
		lbne	VoiceProcessStuff_
; End of function somexortest

; START	OF FUNCTION CHUNK FOR islt_y12bitFFF0_$8

epi_C0_jump:				; CODE XREF: islt_y12bitFFF0_$8+B0j
					; islt_y12bitFFF0_$8+B7j ...
		anda	#%111111	; epilogue processing
		cmpa	#$30 ; '0'      ; check for $30 (+$C0 = $F0)
		bcc	epi_C0_jump_10	; $30 ($F0) to $38 ($F8)
		adda	<unknown1
		leay	a,x		; y = x	+ a
					;
					; recalculates the pointer for y
					; assumes x contains a pointer to the current module data (probably start)
		jmp	VoiceProcessStuff_
; ---------------------------------------------------------------------------

epi_C0_jump_10:				; CODE XREF: islt_y12bitFFF0_$8+D5j
		cmpa	#$38 ; '8'      ; $30 ($F0) to $38 ($F8)
		bcc	epi_C0_jump_12	; $38 ($F8) and	higher
		suba	#$2F ; '/'
		ldb	10,x
		mul
		leay	b,y		; y += (a - $2F) * 10
					; skips	(a) 5-byte modules (10-byte with mask)
		jmp	VoiceProcessStuff_
; ---------------------------------------------------------------------------

epi_C0_jump_12:				; CODE XREF: islt_y12bitFFF0_$8+E0j
		suba	#$37 ; '7'      ; $38 ($F8) and higher
		ldb	12,x		; 6 (module size) * 2 =	envelope module	data size of 12
		mul
		leay	b,y		; y += (a - $37) * 12
					; skips	(a) modules 6-byte modules (12-byte with mask)
		jmp	VoiceProcessStuff_
; END OF FUNCTION CHUNK	FOR islt_y12bitFFF0_$8

; =============== S U B	R O U T	I N E =======================================

; decrease with	modulus, mod op	in y

dec_mod_$10_with_y:			; DATA XREF: ROM:TableROpso
		leay	1,y
		lda	$10,x		; a=[x+10]
		bne	dec_mod_$10	; if [x+10] != 0
		lda	-1,y		; if [x+10] == 0
		sta	$10,x		; [x+10] = [y+1-1] = [y]
		bne	somexortest	; if not zero
		leay	1,y
		jmp	VoiceProcessStuff_
; ---------------------------------------------------------------------------

dec_mod_$10:				; CODE XREF: dec_mod_$10_with_y+5j
					; dec_mod_$10_with_$A+3j ...
		bmi	somexortest	; if not zero
		dec	$10,x		; [x+10]--
		bne	somexortest	; if not zero
		leay	1,y
		jmp	VoiceProcessStuff_
; End of function dec_mod_$10_with_y


; =============== S U B	R O U T	I N E =======================================


dec_mod_$10_with_$A:			; DATA XREF: ROM:TableROpso
		lda	$10,x
		bne	dec_mod_$10	; if not zero
		lda	$A,x
		sta	$10,x
		bne	somexortest	; if not zero
		leay	1,y
		jmp	VoiceProcessStuff_
; End of function dec_mod_$10_with_$A


; =============== S U B	R O U T	I N E =======================================


dec_mod_$10_with_$C:			; DATA XREF: ROM:TableROpso
		lda	$10,x
		bne	dec_mod_$10	; if not zero
		lda	$C,x
		sta	$10,x
		bne	somexortest	; if not zero
		leay	1,y
		jmp	VoiceProcessStuff_
; End of function dec_mod_$10_with_$C


; =============== S U B	R O U T	I N E =======================================


dec_mod_$11_with_y:			; DATA XREF: ROM:TableROpso
		leay	1,y
		lda	$11,x
		bne	dec_mod_$11
		lda	-1,y
		sta	$11,x
		lbne	somexortest	; if not zero
		leay	1,y
		jmp	VoiceProcessStuff_
; ---------------------------------------------------------------------------

dec_mod_$11:				; CODE XREF: dec_mod_$11_with_y+5j
					; dec_mod_$11_with_$A+3j ...
		lbmi	somexortest	; if not zero
		dec	$11,x
		lbne	somexortest	; if not zero
		leay	1,y
		jmp	VoiceProcessStuff_
; End of function dec_mod_$11_with_y


; =============== S U B	R O U T	I N E =======================================


dec_mod_$11_with_$A:			; DATA XREF: ROM:TableROpso
		lda	$11,x
		bne	dec_mod_$11
		lda	$A,x
		sta	$11,x
		lbne	somexortest	; if not zero
		leay	1,y
		jmp	VoiceProcessStuff_
; End of function dec_mod_$11_with_$A


; =============== S U B	R O U T	I N E =======================================


dec_mod_$11_with_$C:			; DATA XREF: ROM:TableROpso
		lda	$11,x
		bne	dec_mod_$11
		lda	$C,x
		sta	$11,x
		lbne	somexortest	; if not zero
		leay	1,y
		jmp	VoiceProcessStuff_
; End of function dec_mod_$11_with_$C


; =============== S U B	R O U T	I N E =======================================

; decrease with	modulus, mod op	in y
; if y < 0, dont decrease?

dec_mod_$18_with_y_signed:		; DATA XREF: ROM:TableROpso
		lda	,y+
		lbeq	VoiceProcessStuff_ ; if	zero
		leay	-2,y
		lbmi	ldd_$8_mulmulmul_rts ; if a < 0	(register N=1)
		ldb	$18,x		; b=[x+$18]
		bne	dec_mod_$18_with_y_signed_ ; if	not zero
		sta	$18,x		; if zero
					; [x+$18]=a
		jmp	ldd_$8_mulmulmul_rts
; ---------------------------------------------------------------------------

dec_mod_$18_with_y_signed_:		; CODE XREF: dec_mod_$18_with_y_signed+Fj
		dec	$18,x		; [x+$18]--
		lbne	ldd_$8_mulmulmul_rts ; if not zero
		leay	2,y
		jmp	VoiceProcessStuff_
; End of function dec_mod_$18_with_y_signed


; =============== S U B	R O U T	I N E =======================================


swap_$A_$C:				; DATA XREF: ROM:TableROpso
		ldd	$A,x
		pshs	a,b
		ldd	$C,x
		std	$A,x
		puls	b,a
		std	$C,x
		jmp	VoiceProcessStuff_
; End of function swap_$A_$C


; =============== S U B	R O U T	I N E =======================================


neg_$A:					; DATA XREF: ROM:TableROpso
		ldd	$A,x
		nega
		negb
		sbca	#0
		std	$A,x
		jmp	VoiceProcessStuff_
; End of function neg_$A


; =============== S U B	R O U T	I N E =======================================


neg_$C:					; DATA XREF: ROM:TableROpso
		ldd	$C,x
		nega
		negb
		sbca	#0
		std	$C,x
		jmp	VoiceProcessStuff_
; End of function neg_$C


; =============== S U B	R O U T	I N E =======================================


weird:					; DATA XREF: ROM:TableROpso
		leay	-1,y
		lda	$18,x		; a=[x+$18]
		bne	loc_E8B1	; if not zero
		lda	#3
		sta	$18,x		; [x+18]=3

loc_E8B1:				; CODE XREF: weird+5j
		leau	a,y		; u=[y+a] where	a is:
					;
					; [x+$18] if not zero
					; else 3
					; -
		lda	$10,x		; a=[x+$10]
		bne	loc_E8BC

loc_E8B8:				; CODE XREF: weird+34j
		lda	,u		; a=[u]
		bra	loc_E8C1
; ---------------------------------------------------------------------------

loc_E8BC:				; CODE XREF: weird+11j
		lbmi	ldd_$8_mulmulmul_rts
		deca

loc_E8C1:				; CODE XREF: weird+15j
		beq	loc_E8CD
		sta	$10,x
		ldd	-2,u
		addd	8,x
		jmp	std_$8_mulmulmul_rts
; ---------------------------------------------------------------------------

loc_E8CD:				; CODE XREF: weird:loc_E8C1j
		lda	$18,x
		adda	#3
		leau	a,y
		sta	$18,x
		cmpa	#18
		bls	loc_E8B8	; a=[u]
		clr	$18,x
		clr	$10,x
		leay	,u
		ldd	-2,y
		jmp	std_$8_mulmulmul_rts
; End of function weird


; =============== S U B	R O U T	I N E =======================================


vibrato1:				; DATA XREF: ROM:TableROpso

; FUNCTION CHUNK AT E5D8 SIZE 00000013 BYTES
; FUNCTION CHUNK AT E63D SIZE 0000001C BYTES

		leay	-1,y
		lda	7,x
		bita	#$40 ; '@'
		lbne	ldd_$8_mulmulmul_rts
		lda	$10,x
		bne	loc_E900
		com	$18,x
		lda	3,y
		lbeq	ldd_$8_mulmulmul_rts

loc_E900:				; CODE XREF: vibrato1+Dj
		deca
		sta	$10,x
		lda	$18,x
		beq	loc_E90E
		lda	1,y
		jmp	mul___$8$9
; ---------------------------------------------------------------------------

loc_E90E:				; CODE XREF: vibrato1+1Fj
		lda	2,y
		jmp	mad___$8$9
; End of function vibrato1


; =============== S U B	R O U T	I N E =======================================


vibrato2:				; DATA XREF: ROM:TableROpso
		leay	-1,y
		lda	7,x
		bita	#$40 ; '@'
		lbne	ldd_$8_mulmulmul_rts
		lda	$18,x
		bne	loc_E93F
		lda	1,y
		lbeq	ldd_$8_mulmulmul_rts
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

loc_E93F:				; CODE XREF: vibrato2+Dj
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

loc_E958:				; CODE XREF: vibrato2+2Aj vibrato2+2Ej
		ldd	$C,x
		addd	$10,x
		std	$C,x
		bita	#$40 ; '@'
		beq	loc_E964
		nega

loc_E964:				; CODE XREF: vibrato2+4Ej
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
		lbcc	std_$8_mulmulmul_rts
		ldd	#0
		jmp	std_$8_mulmulmul_rts
; ---------------------------------------------------------------------------

loc_E991:				; CODE XREF: vibrato2+6Cj
		addd	$A,x
		lbcc	std_$8_mulmulmul_rts
		ldd	#$FFFF
		jmp	std_$8_mulmulmul_rts
; End of function vibrato2


; =============== S U B	R O U T	I N E =======================================


noise_$8:				; DATA XREF: ROM:TableROpso
		leay	-1,y
		lda	$18,x
		bne	loc_E9AF
		lda	8,x
		sta	1,y
		lda	3,y
		sta	$18,x
		bra	loc_E9B4
; ---------------------------------------------------------------------------

loc_E9AF:				; CODE XREF: noise_$8+5j
		bmi	loc_E9BE
		dec	$18,x

loc_E9B4:				; CODE XREF: noise_$8+10j
		bne	loc_E9BE
		clr	$18,x
		leay	4,y
		jmp	VoiceProcessStuff_
; ---------------------------------------------------------------------------

loc_E9BE:				; CODE XREF: noise_$8:loc_E9AFj
					; noise_$8:loc_E9B4j
		bsr	NoiseFunc
		lda	2,y
		pshs	a
		lsr	,s
		mul
		suba	,s
		sta	,s+
		ldb	9,x
		adda	1,y
		std	8,x
		jmp	mulmulmul_rts
; End of function noise_$8


; =============== S U B	R O U T	I N E =======================================


weirdmul_y_$E_to_$A:			; DATA XREF: ROM:TableROpso
		bsr	NoiseFunc
		lda	,y
		clrb
		lsra
		rorb
		pshs	a,b		; y/2 (9-bit)?
		lda	$E,x
		ldb	,y+
		mul
		subd	,s++		; d = (y * [x+$E]) - (y	/ 2)?
		std	$A,x
		jmp	VoiceProcessStuff_
; End of function weirdmul_y_$E_to_$A


; =============== S U B	R O U T	I N E =======================================


weirdmul_y_$E_to_$C:			; DATA XREF: ROM:TableROpso
		bsr	NoiseFunc
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
		jmp	VoiceProcessStuff_
; End of function weirdmul_y_$E_to_$C


; =============== S U B	R O U T	I N E =======================================


NoiseFunc:				; CODE XREF: noise_$8:loc_E9BEp
					; weirdmul_y_$E_to_$Ap	...
		ldd	$E,x
		bne	loc_EA04
		lda	#$DB ; 'Û'

loc_EA04:				; CODE XREF: NoiseFunc+2j
		aslb
		rola
		bcc	loc_EA0C
		eorb	#$87 ; '‡'
		eora	#$1D

loc_EA0C:				; CODE XREF: NoiseFunc+8j
		std	$E,x
		rts
; End of function NoiseFunc

; ---------------------------------------------------------------------------
TableYOps:	fdb TableROps			    ; 0	; DATA XREF: VoiceProcessStuff+32o
		fdb set_y12bitFFF0_std_$8	    ; 1	; lower	than
		fdb set_y12bitFFF0_std_$A	    ; 2
		fdb set_y12bitFFF0_std_$C	    ; 3
		fdb TableROps			    ; 4
		fdb add_y12bitFFF0_$8		    ; 5
		fdb add_y12bitFFF0_$A		    ; 6
		fdb add_y12bitFFF0_$C		    ; 7
		fdb TableROps			    ; 8
		fdb islt_y12bitFFF0_$8		    ; 9
		fdb islt_y12bitFFF0_$A		    ; $A
		fdb islt_y12bitFFF0_$C		    ; $B
		fdb TableROps			    ; $C
		fdb isgt_y12bitFFF0_$8		    ; $D
		fdb isgt_y12bitFFF0_$A		    ; $E
		fdb isgt_y12bitFFF0_$C		    ; $F
TableROps:	fdb dec_mod_$18_with_y_signed	    ; 0
					; DATA XREF: VoiceProcessStuff:TableJumper2o
					; ROM:TableYOpso
		fdb dec_mod_$10_with_y		    ; 1	; [$8] = [$8] -	[$A]
		fdb dec_mod_$10_with_$A		    ; 2
		fdb dec_mod_$10_with_$C		    ; 3
		fdb noise_$8			    ; 4
		fdb dec_mod_$11_with_y		    ; 5
		fdb dec_mod_$11_with_$A		    ; 6
		fdb dec_mod_$11_with_$C		    ; 7
		fdb weirdmul_y_$E_to_$A		    ; 8
		fdb isgt_$8_$A			    ; 9
		fdb isgt_$8_$C			    ; $A
		fdb isgt_$A_$C			    ; $B
		fdb weirdmul_y_$E_to_$C		    ; $C
		fdb isgt_$A_$8			    ; $D
		fdb isgt_$C_$8			    ; $E
		fdb isgt_$C_$A			    ; $F
		fdb neg_$A			    ; $10
		fdb set_$A_std_$8		    ; $11
		fdb set_$C_std_$8		    ; $12
		fdb set_$C_std_$A		    ; $13
		fdb neg_$C			    ; $14
		fdb set_$8_std_$A		    ; $15
		fdb set_$8_std_$C		    ; $16
		fdb set_$A_std_$C		    ; $17
		fdb swap_$A_$C			    ; $18
		fdb add_$A_$8_std_$8		    ; $19
		fdb add_$C_$8_std_$8		    ; $1A
		fdb add_$C_$A_std_$A		    ; $1B
		fdb somexortest			    ; $1C
		fdb add_$8_$A_std_$A		    ; $1D
		fdb add_$8_$C_std_$C		    ; $1E
		fdb add_$A_$C_std_$C		    ; $1F
		fdb vibrato1			    ; $20
		fdb subt_$8_$A_std_$8		    ; $21
		fdb subt_$8_$C_std_$8		    ; $22
		fdb subt_$A_$C_std_$A		    ; $23
		fdb vibrato2			    ; $24
		fdb subt_$A_$8_std_$A		    ; $25
		fdb subt_$C_$8_std_$C		    ; $26
		fdb subt_$C_$A_std_$C		    ; $27
		fdb weird			    ; $28
		fdb sub_E40F			    ; $29
		fdb sub_E464			    ; $2A
		fdb sub_E4C1			    ; $2B
		fdb mul_y_$A$B_max		    ; $2C
		fdb mul_y_$8$9			    ; $2D
		fdb mul_y_$A$B			    ; $2E
		fdb mul_y_$C$D			    ; $2F
		fdb mul_y_$C$D_max		    ; $30
		fdb mad_y_$8$9			    ; $31
		fdb mad_y_$A$B			    ; $32
		fdb mad_y_$C$D			    ; $33
		fdb mul_$A_$8$9			    ; $34
		fdb mul_$C_$8$9			    ; $35
		fdb mul_$C_$A$B			    ; $36
		fdb mul_$C_$C$D			    ; $37
		fdb mad_$A_$8$9			    ; $38
		fdb mad_$C_$8$9			    ; $39
		fdb mad_$C_$A$B			    ; $3A
		fdb mad_$A_$C$D			    ; $3B
		fdb mul_neg_$A_$8$9		    ; $3C
		fdb mul_neg_$C_$8$9		    ; $3D
		fdb mul_neg_$C_$A$B		    ; $3E
		fdb mul_neg_$A_$C$D		    ; $3F
		fcb 0			; key weight?
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

; =============== S U B	R O U T	I N E =======================================


nullsub_1:
		rti
; End of function nullsub_1

; end of 'ROM'

; ===========================================================================

; Segment type:	Regular
		; segment RAM
		org $EAF1
; assume dp = $EA
byte_EAF1:	fcb $E2			; DATA XREF: IRQVector+11r
unk_EAF2:	fcb   0			; DATA XREF: Entry+8w
					; IRQVector:loc_E244r ...
byte_EAF3:	fcb $EA			; DATA XREF: IRQVector+19w
					; IRQVector+84r ...
unknown1:	fcb $F0	; ð		; DATA XREF: IRQVector+1Dw
					; IRQVector+3Fr ...
EAF5_currentvoice:fcb $EA		; DATA XREF: IRQVector+Dw
					; IRQVector+A5r ...
unk_EAF6:	fcb $F0	; ð		; DATA XREF: Entry:InfiniteLoop2w
					; IRQVector+1Fw ...
word_EAF7:	fdb $E22D		; DATA XREF: VoiceProcessStuff+8w
					; VoiceProcessStuff+Cr
x_endcheck:	fdb $EAF0		; DATA XREF: IRQVector:aftersetvoicedaco
		fdb $EAF0
		fdb $EAF0
		fdb $E200		; $EAF1	to $EB01
; end of 'RAM'                          ;
					; 1. used by master to setup vectors/isrs for coprocessor
					; ($EAF1,$EB01 maps to $FFF0,$FFFF for coprocessor)
					;
					; 2. afterwards, used as scratchpad/RAM	for coprocessor
					;
					; ---
					;
					; $FFF0: RESERVED: $E200 / Entry
					; $FFF2: SWI3: $EAF0 / nullsub
					; $FFF4: SWI2: $EAF0 / nullsub
					; $FFF6: FIRQ: $EAF0 / nullsub
					; $FFF8: IRQ: $E22D / IRQVector
					; $FFFA: SWI: $EAF0 / nullsub
					; $FFFC: NMI: $EAF0 / nullsub
					; $FFFE: RESET:	$E200 /	Entry
; ===========================================================================
		end
