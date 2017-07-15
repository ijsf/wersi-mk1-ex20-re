; ---------------------------------------------------------------------------

envstring12	struc ;	(sizeof=0x13)	; XREF:	ROM:strEnvDynLinUp/r
					; ROM:strEnvDynExpUp/r ...
id:		fcb ?
field_1:	fcb 18 dup(?)		; string(C)
envstring12	ends

; ---------------------------------------------------------------------------

envstring11	struc ;	(sizeof=0x12)	; XREF:	ROM:strEnvExpUp/r
					; ROM:strEnvExpDown/r ...
id:		fcb ?
field_1:	fcb 17 dup(?)		; string(C)
envstring11	ends

; ---------------------------------------------------------------------------

envstring10	struc ;	(sizeof=0x11)	; XREF:	ROM:strNoAttackPhases/r
					; ROM:strNoReleasePhases/r ...
id:		fcb ?
field_1:	fcb 16 dup(?)		; string(C)
envstring10	ends

; ---------------------------------------------------------------------------

NoteFreq	struc ;	(sizeof=0x4)	; XREF:	ROM:_NoteFreqTable/r
a1:		fcb ?
b2:		fcb ?			; base 10
c3:		fdb ?			; base 10
NoteFreq	ends

; ---------------------------------------------------------------------------

MIDIVoice	struc ;	(sizeof=0x4)	; XREF:	ROM:_MIDITable/r
mask:		fcb ?
statusType:	fcb ?			; base 2
fnPtr:		fdb ?			; offset (00000000)
MIDIVoice	ends

; ---------------------------------------------------------------------------

NoteMapEntry	struc ;	(sizeof=0x3)	; XREF:	ROM:_NoteMapping/r
note:		fcb ?
ptr:		fdb ?
NoteMapEntry	ends

; ---------------------------------------------------------------------------

EnvTableType	struc ;	(sizeof=0xC)	; XREF:	ROM:tableEnvStuff/r
field_0:	fcb ?			; block	identifier (ascii)
field_1:	fcb ?
field_2:	fdb ?			; jump destination address
field_4:	fdb ?
field_6:	fdb ?
field_8:	fdb ?
field_A:	fdb ?
EnvTableType	ends

; ---------------------------------------------------------------------------

SysExRequest	struc ;	(sizeof=0x4)	; XREF:	ROM:SysExTable/r
blockId:	fcb ?			; block	identifier (ascii)
blockLength:	fcb ?			; block	length (length of data)
funcAddr:	fdb ?			; jump destination address
SysExRequest	ends


;
; Input	MD5   :	EAAE042A514A1742BFA8FEC2D50B19E3
; Input	CRC32 :	713AFA09


; Processor	  : 6809 []
; Target assembler: Motorola FreeWare Assembler

; ===========================================================================

; ---------------------------------------------------------------------------
; Format      :	Binary file
; Base Address:	0000h Range: 8000h - 10000h Loaded length: 00008000h
; ===========================================================================

; Segment type:	Pure code
		; segment ROM
		org $8000
; assume dp = 0

loc_8000:				; DATA XREF: ROM:E317w
		lda	#0
		tfr	a, dp

loc_8004:				; CODE XREF: ROM:EB11J
		orcc	#$50 ; 'P'
		ldx	#$8027
		ldb	#4

loc_800B:				; CODE XREF: ROM:8010j
		lda	,x+
		sta	[,x++]
		decb
		bne	loc_800B
		clra
		sta	unk_120
		lda	#$10

loc_8018:				; CODE XREF: ROM:801Cj
		sta	unk_11B
		deca
		bne	loc_8018
		inca
		sta	unk_120
		sta	unk_11B
		bra	loc_8033
; ---------------------------------------------------------------------------
		fcb   0
		fcb 1, 1, 7, 1,	2, 0, 1, $39, 3, 1, $40
; ---------------------------------------------------------------------------

loc_8033:				; CODE XREF: ROM:8025j	ROM:8044j ...
		ldx	#$2000

loc_8036:				; CODE XREF: ROM:804Fj
		lda	,x
		coma
		sta	,x
		lda	,x
		coma
		adda	,x
		sta	,x
		inc	,x
		bne	loc_8033
		tst	,x
		bne	loc_8033
		leax	1,x
		cmpx	#$3D50
		bcs	loc_8036
		clra
		sta	unk_121
		sta	unk_11B

loc_8058:				; CODE XREF: ROM:8088j	ROM:8097j
		ldx	#$200

loc_805B:				; CODE XREF: ROM:8060j
		clr	,x+
		cmpx	#$2000
		bcs	loc_805B
		ldx	#$200
		ldu	#$E200

loc_8068:				; CODE XREF: ROM:8070j
		lda	,u+
		sta	,x+
		cmpu	#$EAF1
		bcs	loc_8068
		ldx	#$1FF0

loc_8075:				; CODE XREF: ROM:807Cj
		lda	,u+
		sta	,x+
		cmpx	#$2000
		bcs	loc_8075
		ldx	#$200
		ldu	#$E200

loc_8084:				; CODE XREF: ROM:808Ej
		lda	,u+
		cmpa	,x+
		bne	loc_8058
		cmpu	#$EAF1
		bcs	loc_8084
		ldx	#$1FF0

loc_8093:				; CODE XREF: ROM:809Cj
		lda	,u+
		cmpa	,x+
		bne	loc_8058
		cmpx	#$2000
		bcs	loc_8093
		lda	#$80 ; 'Ä'
		sta	unk_121
		ldd	#$FF12
		ldx	#$2E5A

loc_80A9:				; CODE XREF: ROM:80ACj
		sta	,x+
		decb
		bne	loc_80A9
		ldb	#$FF
		std	unk_2905
		sta	unk_2907
		ldd	#$200
		std	unk_2D52
		ldu	#$81AD
		ldy	#$201E
		ldb	#8

loc_80C5:				; CODE XREF: ROM:80CEj
		ldx	,u++
		stx	[,u]
		ldx	,u++
		stx	,y++
		decb
		bne	loc_80C5
		lds	word_81AF
		lda	#2
		sta	unk_201D
		pshs	dp
		ldb	#6
		pshs	b
		ldx	#$80EE

loc_80E2:				; CODE XREF: ROM:80E8j
		ldd	,x++
		std	[,x++]
		dec	,s
		bne	loc_80E2
		leas	1,s
		bra	loc_8106
; ---------------------------------------------------------------------------
		fcb   7
		fcb $CF, 1, $82, 0, 1, 1, $84, $FF, 4, 1, $86, 1, 0, 1
		fcb $80, $87, 1, 1, $80, $C2, $82, 1, $80
; ---------------------------------------------------------------------------

loc_8106:				; CODE XREF: ROM:80ECj
		ldb	#6
		stb	unk_2D5D
		jsr	sub_B7B0
		jsr	sub_8BFA
		clra
		ldx	#$2005
		ldy	#$21F3
		leau	$17,x

loc_811C:				; CODE XREF: ROM:8132j
		pshs	a,x,y,u
		jsr	sub_AA05
		puls	u,y,x,a
		beq	loc_812D
		inc	,x
		pshu	a
		ldb	#$80 ; 'Ä'
		stb	,y

loc_812D:				; CODE XREF: ROM:8123j
		leay	3,y
		inca
		cmpa	#$14
		bcs	loc_811C
		stu	1,x
		lda	#1
		sta	unk_2002
		ldu	#$B683
		jsr	sub_B650
		cmpd	,x
		beq	loc_8151
		std	,x
		cmpd	,x
		bne	loc_8182
		lda	#$8B ; 'ã'
		bra	loc_8153
; ---------------------------------------------------------------------------

loc_8151:				; CODE XREF: ROM:8144j
		lda	#$B

loc_8153:				; CODE XREF: ROM:814Fj
		sta	unk_2002
		ldu	#$B68C
		jsr	sub_B650
		cmpd	,x
		beq	loc_816F
		std	,x
		cmpd	,x
		bne	loc_8182
		lda	unk_2002
		oraa	#$80 ; 'Ä'
		bra	loc_8172
; ---------------------------------------------------------------------------

loc_816F:				; CODE XREF: ROM:815Fj
		lda	unk_2002

loc_8172:				; CODE XREF: ROM:816Dj	ROM:81EEj
		adda	#$A
		sta	unk_2002
		bpl	loc_8182
		ldd	#$AF02
		sta	unk_3D70
		stb	unk_3D72

loc_8182:				; CODE XREF: ROM:814Bj	ROM:8166j ...
		lda	#4
		sta	unk_201D
		lda	,s+
		bne	locret_8194
		ldd	#$78 ; 'x'
		std	unk_2CF7
		jmp	loc_B8E5
; ---------------------------------------------------------------------------

locret_8194:				; CODE XREF: ROM:8189j
		rts

; =============== S U B	R O U T	I N E =======================================


sub_8195:				; CODE XREF: sub_8195+Cj sub_89E0+59P	...
		pshs	x
		jsr	sub_81CD
		jsr	sub_81CD
		puls	x
		leax	-1,x
		bne	sub_8195
		rts
; End of function sub_8195

; ---------------------------------------------------------------------------
		fcb 1, 2, 4, 8,	$10, $20, $40, $80, $3B, $81, $F2
word_81AF:	fdb $206C		; DATA XREF: ROM:80D0r
		fcb $B5
		fcb $92	; í
		fcb $20
		fcb $A2	; ¢
		fcb $FA	; ˙
		fcb $91	; ë
		fcb $21	; !
		fcb $82	; Ç
		fcb $FB	; ˚
		fcb $63	; c
		fcb $21	; !
		fcb $B8	; ∏
		fcb $B9	; π
		fcb $E1	; ·
		fcb $21	; !
		fcb $EE	; Ó
		fcb $CE	; Œ
		fcb $9E	; û
		fcb $20
		fcb $D8	; ÿ
		fcb $90	; ê
		fcb $B3	; ≥
		fcb $21	; !
		fcb $16
		fcb $EB	; Î
		fcb   1
		fcb $21	; !
		fcb $4C	; L

; =============== S U B	R O U T	I N E =======================================


sub_81CD:				; CODE XREF: sub_8195+2P sub_8195+5P ...
		ldx	#$201E
		lda	-2,x
		sts	a,x
		adda	#2
		cmpa	-1,x
		bcs	loc_81DC
		clra

loc_81DC:				; CODE XREF: sub_81CD+Cj
		sta	-2,x
		lds	a,x
		rts
; End of function sub_81CD

; ---------------------------------------------------------------------------
		bra	loc_8202
; ---------------------------------------------------------------------------
		fcb $21	; !
		fcb $B8	; ∏
		fcb $20
; ---------------------------------------------------------------------------
		inc	0,y
		eorb	<unk_21
		lbra	loc_A33A
; ---------------------------------------------------------------------------
		brn	loc_8172
		neg	<word_0
		ldx	#$824E
		stx	unk_2000
		jsr	sub_FD3F
		lda	unk_132
		bpl	loc_820A
		ldb	#$FF

loc_8202:				; CODE XREF: ROM:81E2j
		stb	unk_2A0B
		ldb	#$F
		stb	unk_2CFC

loc_820A:				; CODE XREF: ROM:81FEj
		lda	#$80 ; 'Ä'
		sta	unk_2D01
		andcc	#$AF ; 'Ø'
		jsr	loc_CC06
		jsr	sub_89E0
		clr	unk_21F0
		jsr	loc_B7BF
		lda	unk_2002
		cmpa	#1
		bls	loc_822F
		ldb	unk_3D50
		jsr	sub_82C8
		lda	#$30 ; '0'
		sta	unk_2CF6

loc_822F:				; CODE XREF: ROM:8222j
		jsr	sub_D354
		jsr	SysExUnknown2
		lda	#$10
		sta	unk_201D

loc_823A:				; CODE XREF: ROM:824Cj
		jsr	sub_81CD
		jsr	sub_B78A
		beq	loc_8246
		jsr	[unk_2000]

loc_8246:				; CODE XREF: ROM:8240j
		jsr	sub_B131
		jsr	sub_BE50
		bra	loc_823A

; =============== S U B	R O U T	I N E =======================================


sub_824E:				; CODE XREF: ROM:A3DBP
		ldx	#$8260

loc_8251:				; CODE XREF: sub_824E+10j ROM:A675J ...
		cmpb	,x
		bcs	loc_825C
		cmpb	1,x
		bhi	loc_825C
		jmp	[2,x]
; ---------------------------------------------------------------------------

loc_825C:				; CODE XREF: sub_824E+5j sub_824E+9j
		leax	4,x
		bra	loc_8251
; End of function sub_824E

; ---------------------------------------------------------------------------
		fcb $38, $3F, $82, $B5,	$30, $30, $83, $E5, $31, $31, $83
		fcb $E1, $32, $34, $83,	$FF, $35, $37, $84, $9C, $10, $10
		fcb $84, $98, $11, $11,	$B5, $1B, $12, $2F, $84, $E8, $92
		fcb $AF, $84, $E8, 0, 7, $D3, $9F, 8, $F, $D5, 7, 0, $FF
		fcb $81, $E1

; =============== S U B	R O U T	I N E =======================================


sub_8290:				; CODE XREF: sub_82C8+6FP sub_82C8+93P ...
		pshs	a,b
		ldb	#8
		mul
		ldx	#$222F
		leax	d,x
		puls	pc,b,a
; End of function sub_8290


; =============== S U B	R O U T	I N E =======================================


sub_829C:				; CODE XREF: sub_82C8+C6P sub_82C8+E5P ...
		pshs	b
		ldb	#8
		mul
		ldx	#$2233
		lda	d,x
		puls	b
; End of function sub_829C


; =============== S U B	R O U T	I N E =======================================


_LoadICBUnknown:			; CODE XREF: sub_82C8+105P
					; sub_82C8+112P ...
		pshs	a,b
		deca
		ldb	#22
		mul
		ldx	#ICBUnknown1
		leax	d,x
		puls	pc,b,a
; End of function _LoadICBUnknown

; ---------------------------------------------------------------------------
		subb	#$38 ; '8'
		lda	unk_2002
		cmpa	#1
		bhi	loc_82BF
		rts
; ---------------------------------------------------------------------------

loc_82BF:				; CODE XREF: ROM:82BCj
		lda	unk_3D51
		bita	#$10
		beq	sub_82C8
		addb	#8

; =============== S U B	R O U T	I N E =======================================


sub_82C8:				; CODE XREF: ROM:8227P	ROM:82C4j
		pshs	b
		lda	unk_2E0C
		bmi	loc_82D7
		oraa	#$80 ; 'Ä'
		sta	unk_2E0C
		jsr	sub_9533

loc_82D7:				; CODE XREF: sub_82C8+5j
		lda	unk_3D50
		jsr	sub_B84A
		lda	,s
		jsr	sub_B854
		lda	,s
		sta	unk_3D50
		lda	unk_2E0F
		anda	#$42 ; 'B'
		sta	,s
		jsr	sub_A2CB
		lda	unk_10D4
		beq	loc_8306
		lda	unk_2E0F
		anda	#$42 ; 'B'
		cmpa	,s
		beq	loc_8306
		clra
		sta	unk_10D4
		jsr	sub_959A

loc_8306:				; CODE XREF: sub_82C8+2Cj sub_82C8+35j
		leas	1,s
		jsr	sub_B4CD
		lda	unk_2E0C
		bmi	loc_8313
		jsr	sub_9533

loc_8313:				; CODE XREF: sub_82C8+46j
		clr	word_22EF
		ldu	#$2E37
		lda	#$18
		sta	word_22EF+1
		ldx	#$24EF
		bra	loc_832C
; ---------------------------------------------------------------------------

loc_8323:				; CODE XREF: sub_82C8+83j
		sta	word_22EF+1
		ldx	word_22F1
		leax	$FFA8,x

loc_832C:				; CODE XREF: sub_82C8+59j
		stx	word_22F1
		ldx	#$8B4F
		lda	a,x
		sta	unk_21F0
		jsr	sub_8290
		stx	unk_21F1
		ldb	,-u
		pshs	u
		jsr	sub_85A6
		puls	u
		lda	word_22EF+1
		suba	#4
		bne	loc_8323
		lda	#$17
		ldu	#$3D4E
		ldy	#$8B70

loc_8356:				; CODE XREF: sub_82C8+B7j
		ldx	#$8BE2
		ldb	a,x
		jsr	sub_8290
		stb	5,x
		clr	7,x
		pshs	a,x
		lda	a,u
		beq	loc_8378
		deca
		jsr	sub_8290
		ldb	5,x
		andb	#$10
		ldx	1,s
		orab	5,x
		stb	5,x
		lda	a,y

loc_8378:				; CODE XREF: sub_82C8+9Ej
		sta	4,x
		puls	x,a
		deca
		cmpa	#8
		bcc	loc_8356
		clra
		sta	unk_21F0
		sta	word_22EF
		ldx	#$222F
		stx	unk_21F1
		jsr	sub_829C
		sta	word_22EF+1
		stx	word_22F1
		jsr	sub_877C
		jsr	sub_8923
		jsr	sub_D354
		jsr	sub_FE0B
		jsr	sub_DEE9
		jsr	sub_DCA6
		lda	#8

loc_83AB:				; CODE XREF: sub_82C8+F4j
		pshs	a
		jsr	sub_829C
		tsta
		puls	a
		beq	loc_83BB
		ldb	$11,x
		jsr	sub_856C

loc_83BB:				; CODE XREF: sub_82C8+EBj
		deca
		bmi	loc_83AB
		lda	#$20 ; ' '
		pshs	a
		ldx	#$259F

loc_83C5:				; CODE XREF: sub_82C8+108j
					; sub_82C8+115j
		jsr	sub_875A
		lda	$10,x
		beq	loc_83D2
		jsr	_LoadICBUnknown
		bra	loc_83C5
; ---------------------------------------------------------------------------

loc_83D2:				; CODE XREF: sub_82C8+103j
		lda	,s
		suba	#4
		ble	locret_83DF
		sta	,s
		jsr	_LoadICBUnknown
		bra	loc_83C5
; ---------------------------------------------------------------------------

locret_83DF:				; CODE XREF: sub_82C8+10Ej
		puls	pc,a
; End of function sub_82C8

; ---------------------------------------------------------------------------
		lda	#0
		bra	loc_83E7
; ---------------------------------------------------------------------------
		lda	#1

loc_83E7:				; CODE XREF: ROM:83E3j
		sta	unk_21F0
		clr	word_22EF
		jsr	sub_8290
		stx	unk_21F1
		jsr	sub_829C
		sta	word_22EF+1
		stx	word_22F1
		jmp	sub_D354
; ---------------------------------------------------------------------------
		subb	#$31 ; '1'
		stb	word_22EF

loc_8404:				; CODE XREF: ROM:8454J	ROM:8494J
		ldx	unk_21F1
		lda	4,x
		jsr	_LoadICBUnknown
		ldb	word_22EF
		andb	#3
		pshs	b
		clrb
		tsta
		beq	loc_8429

loc_8417:				; CODE XREF: ROM:8427j
		cmpb	,s
		bcc	loc_842B
		incb
		tst	$10,x
		beq	loc_8429
		lda	$10,x
		jsr	_LoadICBUnknown
		bra	loc_8417
; ---------------------------------------------------------------------------

loc_8429:				; CODE XREF: ROM:8415j	ROM:841Fj
		orab	#$80 ; 'Ä'

loc_842B:				; CODE XREF: ROM:8419j
		stb	word_22EF
		sta	word_22EF+1
		stx	word_22F1
		leas	1,s
		jmp	sub_D354
; ---------------------------------------------------------------------------
		ldx	unk_21F1
		lda	6,x
		beq	loc_8457
		pshs	a
		clra
		sta	6,x
		lda	4,x

loc_8447:				; CODE XREF: ROM:844Dj
		jsr	_LoadICBUnknown
		lda	$10,x
		bne	loc_8447
		puls	a
		sta	$10,x
		jmp	loc_8404
; ---------------------------------------------------------------------------

loc_8457:				; CODE XREF: ROM:843Ej
		lda	word_22EF
		bita	#$80 ; 'Ä'
		bne	locret_8497
		bita	#3
		bne	loc_847B
		lda	4,x
		jsr	_LoadICBUnknown
		lda	$10,x
		jsr	_LoadICBUnknown
		lda	$10,x
		clr	$10,x
		ldx	unk_21F1
		sta	6,x
		jmp	sub_D354
; ---------------------------------------------------------------------------

loc_847B:				; CODE XREF: ROM:8460j
		lda	4,x
		bra	loc_8484
; ---------------------------------------------------------------------------

loc_847F:				; CODE XREF: ROM:848Aj
		cmpa	word_22EF+1
		beq	loc_848C

loc_8484:				; CODE XREF: ROM:847Dj
		jsr	_LoadICBUnknown
		lda	$10,x
		bra	loc_847F
; ---------------------------------------------------------------------------

loc_848C:				; CODE XREF: ROM:8482j
		clr	$10,x
		ldx	unk_21F1
		sta	6,x
		jmp	loc_8404
; ---------------------------------------------------------------------------

locret_8497:				; CODE XREF: ROM:845Cj
		rts
; ---------------------------------------------------------------------------
		ldb	#$C
		bra	loc_84A0
; ---------------------------------------------------------------------------
		subb	#$35 ; '5'
		aslb
		aslb

loc_84A0:				; CODE XREF: ROM:849Aj
		ldx	#$84D8
		leax	b,x
		ldb	unk_3D51
		eorb	,x+
		bitb	#$50 ; 'P'
		beq	loc_84B5
		lda	unk_2002
		cmpa	#$A
		bls	locret_84D7

loc_84B5:				; CODE XREF: ROM:84ACj
		andb	,x+
		bitb	#$A0 ; '†'
		beq	loc_84C4
		lda	unk_128
		bita	#$10
		beq	loc_84C4
		andb	#$5F ; '_'

loc_84C4:				; CODE XREF: ROM:84B9j	ROM:84C0j
		stb	unk_3D51
		lda	,x+
		pshs	x
		bitb	-3,x

loc_84CD:				; CODE XREF: ROM:84DCj
		jsr	sub_B839
		puls	x
		lda	,x
		jmp	sub_B83B
; ---------------------------------------------------------------------------

locret_84D7:				; CODE XREF: ROM:84B3j
		rts
; ---------------------------------------------------------------------------
		fcb $10
		fcb $DF	; ﬂ
; ---------------------------------------------------------------------------
		puls	y,x,b,a
		bra	loc_84CD
; ---------------------------------------------------------------------------
		fcb $36
		fcb $35	; 5
		fcb $40
		fcb $7F
		fcb $37	; 7
		fcb $10
		fcb $80
		fcb $BF	; ø
		fcb $10
		fcb $37	; 7
		fcb $BD	; Ω
		fcb $B7	; ∑
		fcb $DF	; ﬂ
		fcb $BD	; Ω
		fcb $85	; Ö
		fcb $A6	; ¶
		fcb $BD	; Ω
		fcb $89	; â
		fcb $23	; #
		fcb $BD	; Ω
		fcb $87	; á
		fcb $7C	; |
		fcb $7E	; ~
		fcb $D3	; ”
		fcb $54	; T

; =============== S U B	R O U T	I N E =======================================


sub_84F7:				; CODE XREF: _MIDIFnProgram+31P
		pshs	a,b
		bitb	#$40 ; '@'
		bne	loc_8505
		andb	#$3F ; '?'
		cmpb	#$14
		bls	loc_850B

locret_8503:				; CODE XREF: sub_84F7+12j sub_84F7+16j
		puls	pc,b,a
; ---------------------------------------------------------------------------

loc_8505:				; CODE XREF: sub_84F7+4j
		andb	#$3F ; '?'
		cmpb	#$15
		bhi	locret_8503

loc_850B:				; CODE XREF: sub_84F7+Aj
		cmpa	#$18
		bcc	locret_8503
		puls	u
		lda	unk_21F0
		ldb	word_22EF+1
		ldx	unk_21F1
		ldy	word_22F1
		pshs	a,b,x,y
		lda	word_22EF
		pshs	a
		tfr	u, d
		pshs	a
		jsr	sub_829C
		sta	word_22EF+1
		stx	word_22F1
		puls	a
		cmpa	#8
		bcs	loc_8540
		ldx	#$3D4E
		lda	a,x
		beq	loc_8555
		deca

loc_8540:				; CODE XREF: sub_84F7+3Fj
		sta	unk_21F0
		jsr	sub_8290
		stx	unk_21F1
		clr	word_22EF
		jsr	sub_85A6
		jsr	sub_8923
		jsr	sub_877C

loc_8555:				; CODE XREF: sub_84F7+46j
		puls	a
		sta	word_22EF
		puls	y,x,b,a
		sta	unk_21F0
		stb	word_22EF+1
		stx	unk_21F1
		sty	word_22F1
		jmp	sub_D354
; End of function sub_84F7


; =============== S U B	R O U T	I N E =======================================


sub_856C:				; CODE XREF: sub_82C8+F0P sub_85A6+5CP
		pshs	a,b
		ldb	unk_3D6F
		bitb	#1
		bne	locret_85A4
		bitb	#$40 ; '@'
		beq	locret_85A4
		cmpa	#7
		bhi	locret_85A4
		ldx	#$2E11
		lda	a,x
		beq	locret_85A4
		adda	#$BF ; 'ø'
		jsr	_MIDITransmitA
		ldb	1,s
		cmpb	#$41 ; 'A'
		bne	loc_8592
		clra
		bra	loc_85A1
; ---------------------------------------------------------------------------

loc_8592:				; CODE XREF: sub_856C+21j
		tfr	b, a
		anda	#$3F ; '?'
		deca
		aslb
		bcc	loc_859C
		adda	#$28 ; '('

loc_859C:				; CODE XREF: sub_856C+2Cj
		aslb
		bcc	loc_85A1
		adda	#$13

loc_85A1:				; CODE XREF: sub_856C+24j sub_856C+31j
		jsr	_MIDITransmitA

locret_85A4:				; CODE XREF: sub_856C+7j sub_856C+Bj ...
		puls	pc,b,a
; End of function sub_856C


; =============== S U B	R O U T	I N E =======================================


sub_85A6:				; CODE XREF: sub_82C8+79P sub_84F7+55P ...
		lda	word_22EF+1
		pshs	a,b
		ldx	unk_21F1
		clr	6,x
		ldu	#$8BA0
		lda	unk_21F0
		cmpa	#2
		bhi	loc_85E6
		beq	loc_85DD
		ldu	#$8BC1
		ldx	#$2E5C
		pshs	a
		asla
		asla
		leax	a,x
		lda	word_22EF
		anda	#$BF ; 'ø'
		sta	word_22EF
		anda	#$7F ; ''
		ldb	#$FF

loc_85D4:				; CODE XREF: sub_85A6+33j
		stb	a,x
		inca
		cmpa	#4
		bcs	loc_85D4
		puls	a

loc_85DD:				; CODE XREF: sub_85A6+14j
		ldx	unk_21F1
		lda	5,x
		anda	#$BF ; 'ø'
		sta	5,x

loc_85E6:				; CODE XREF: sub_85A6+12j
		lda	word_22EF
		bita	#3
		beq	loc_85F5
		ldu	#$8BA0
		stu	unk_22F3
		bra	loc_8605
; ---------------------------------------------------------------------------

loc_85F5:				; CODE XREF: sub_85A6+45j
		stu	unk_22F3
		anda	#$7F ; ''
		sta	word_22EF
		ldb	1,s
		lda	unk_21F0
		jsr	sub_856C

loc_8605:				; CODE XREF: sub_85A6+4Dj
		ldb	1,s
		ldx	word_22F1
		tst	word_22EF
		bpl	loc_8638
		stb	0,x
		lda	word_22EF
		anda	#$7F ; ''
		sta	word_22EF
		ldu	unk_22F3
		lda	word_22EF+1
		lda	a,u
		sta	$10,x
		sta	,s
		sta	word_22EF+1
		jsr	_LoadICBUnknown
		stx	word_22F1
		bra	loc_8638
; ---------------------------------------------------------------------------

loc_8631:				; CODE XREF: sub_85A6+180j
		sta	,s
		ldb	0,x
		jsr	_LoadICBUnknown

loc_8638:				; CODE XREF: sub_85A6+67j sub_85A6+89j
		pshs	x
		jsr	_SysExICB
		puls	x
		ldb	1,s
		stb	$11,x
		lda	6,x
		pshs	a,x
		ldx	#$25B5
		ldb	$B,x
		cmpb	3,s
		bne	loc_8655
		clr	$B,x
		bra	loc_8657
; ---------------------------------------------------------------------------

loc_8655:				; CODE XREF: sub_85A6+A9j
		bhi	loc_86D6

loc_8657:				; CODE XREF: sub_85A6+ADj
		bita	#8
		bne	loc_866F
		ldu	1,s
		ldb	1,u
		jsr	sub_A202
		bita	#$20 ; ' '
		bne	loc_866F
		ldx	#$25B5
		lda	$B,x
		beq	loc_86AD
		bra	loc_86D2
; ---------------------------------------------------------------------------

loc_866F:				; CODE XREF: sub_85A6+B3j sub_85A6+BEj
		lda	$A,x
		cmpa	unk_21F0
		beq	loc_86A1
		jsr	sub_8290
		lda	4,x
		beq	loc_86A1

loc_867D:				; CODE XREF: sub_85A6+F9j
		jsr	_LoadICBUnknown
		lda	$12,x
		anda	#$F7 ; '˜'
		bita	#$80 ; 'Ä'
		beq	loc_868B
		eora	#4

loc_868B:				; CODE XREF: sub_85A6+E1j
		pshs	a
		ldb	1,x
		jsr	sub_A202
		anda	#$13
		oraa	,s+
		sta	$12,x
		jsr	sub_872F
		lda	$10,x
		bne	loc_867D

loc_86A1:				; CODE XREF: sub_85A6+CEj sub_85A6+D5j
		lda	3,s
		ldx	#$25B5
		sta	$B,x
		lda	unk_21F0
		sta	$A,x

loc_86AD:				; CODE XREF: sub_85A6+C5j
		ldu	1,s
		ldb	1,u
		jsr	_SysExVCF
		ldx	unk_21F1
		lda	7,x
		bita	#$F
		beq	loc_86D2
		anda	#$FC ; '¸'
		pshs	a
		ldu	#$25B8
		lda	,u
		anda	#3
		oraa	,s+
		sta	7,x
		lda	,u
		anda	#$FC ; '¸'
		sta	,u

loc_86D2:				; CODE XREF: sub_85A6+C7j
					; sub_85A6+115j
		puls	x,a
		bra	loc_86F6
; ---------------------------------------------------------------------------

loc_86D6:				; CODE XREF: sub_85A6:loc_8655j
		ldb	$A,x
		puls	x,a
		cmpb	unk_21F0
		beq	loc_86F6
		bita	#8
		beq	loc_86F6
		anda	#$F7 ; '˜'
		bita	#$80 ; 'Ä'
		beq	loc_86EB
		eora	#4

loc_86EB:				; CODE XREF: sub_85A6+141j
		pshs	a
		ldb	1,x
		jsr	sub_A202
		anda	#$13
		oraa	,s+

loc_86F6:				; CODE XREF: sub_85A6+12Ej
					; sub_85A6+137j ...
		sta	$12,x
		jsr	sub_872F
		lda	,s
		bsr	sub_875A
		clr	$15,x
		lda	0,x
		beq	loc_872A
		ldb	0,x
		andb	#$3F ; '?'
		bita	#$40 ; '@'
		bne	loc_8715
		cmpb	#$14
		bhi	loc_871C
		bra	loc_871A
; ---------------------------------------------------------------------------

loc_8715:				; CODE XREF: sub_85A6+167j
		cmpb	unk_2002
		bhi	loc_871C

loc_871A:				; CODE XREF: sub_85A6+16Dj
		sta	1,s

loc_871C:				; CODE XREF: sub_85A6+16Bj
					; sub_85A6+172j
		ldu	unk_22F3
		lda	,s
		lda	a,u
		sta	$10,x
		lbne	loc_8631

loc_872A:				; CODE XREF: sub_85A6+15Fj
		clr	$10,x
		puls	pc,b,a
; End of function sub_85A6


; =============== S U B	R O U T	I N E =======================================


sub_872F:				; CODE XREF: sub_85A6+F3P
					; sub_85A6+153P ...
		ldu	#$873A
		anda	#$1F
		lda	a,u
		sta	$13,x
		rts
; End of function sub_872F

; ---------------------------------------------------------------------------
		fcb $80	; Ä
		fcb   8
		fcb $18, $48, $40, 0, $10, $40,	$28, $28, $58, $28, $20
		fcb $20, $50, $20, $38,	$68, $38, $38, $30, $60, $30, $30
		fcb $78, $78, $78, $78,	$70, $70, $70, $70

; =============== S U B	R O U T	I N E =======================================


sub_875A:				; CODE XREF: sub_82C8:loc_83C5P
					; sub_85A6+158p ...
		pshs	a,x

loc_875C:				; CODE XREF: sub_875A+Aj
		jsr	sub_8C73
		bne	loc_8766
		jsr	sub_81CD
		bra	loc_875C
; ---------------------------------------------------------------------------

loc_8766:				; CODE XREF: sub_875A+5j
		clr	,x
		puls	a
		deca
		ldu	,s
		sta	1,x
		ldb	4,u
		stb	2,x
		ldb	3,u
		stb	4,x
		jsr	sub_AA82
		puls	pc,x
; End of function sub_875A


; =============== S U B	R O U T	I N E =======================================


sub_877C:				; CODE XREF: sub_82C8+CFP sub_84F7+5BP ...
		ldx	#$25B5
		lda	0,x
		bita	#$80 ; 'Ä'
		bne	loc_8790
		lda	unk_2E0E
		anda	#$F0 ; ''
		sta	unk_2E0E
		jsr	sub_DEE9

loc_8790:				; CODE XREF: sub_877C+7j
		lda	unk_2E77
		ldb	unk_2E0E
		bitb	#2
		bne	loc_879F
		lda	2,x
		sta	unk_2E77

loc_879F:				; CODE XREF: sub_877C+1Cj
		sta	unk_2D2F
		sta	2,x
		lda	unk_2E76
		bitb	#1
		bne	loc_87B8
		ldb	1,x
		cmpb	#$80 ; 'Ä'
		bne	loc_87B2
		clrb

loc_87B2:				; CODE XREF: sub_877C+33j
		sex
		std	unk_2D29
		bra	loc_87BB
; ---------------------------------------------------------------------------

loc_87B8:				; CODE XREF: sub_877C+2Dj
		jsr	sub_B39C

loc_87BB:				; CODE XREF: sub_877C+3Aj
		ldy	#$2E78
		ldu	#$2E79
		ldb	unk_2E0E
		bitb	#$C
		bne	loc_87CE
		ldd	4,x
		std	unk_2E78

loc_87CE:				; CODE XREF: sub_877C+4Bj
		jsr	sub_B3A7
		leau	6,x
		pulu	b,a
		orcc	#$10
		std	unk_2D3E
		pulu	b,a
		std	unk_2D40
		andcc	#$EF ; 'Ô'
		lda	3,x
		bita	#$80 ; 'Ä'
		bne	loc_87ED
		ldd	#0
		std	unk_2D2B

loc_87ED:				; CODE XREF: sub_877C+69j
		lda	0,x
		anda	#$40 ; '@'
		pshs	a
		lda	unk_2D01
		anda	#$40 ; '@'
		eora	,s+
		beq	loc_8809
		orcc	#$10

loc_87FE:
		eora	unk_2D01
		sta	unk_2D01
		sta	unk_101
		andcc	#$EF ; 'Ô'

loc_8809:				; CODE XREF: sub_877C+7Ej
		lda	3,x
		anda	#$70 ; 'p'
		cmpa	#$60 ; '`'
		bne	loc_8823
		ldb	#$60 ; '`'
		orcc	#$10
		stb	unk_2D32
		ldd	#0
		std	unk_2D36
		sta	unk_2D35
		bra	loc_8838
; ---------------------------------------------------------------------------

loc_8823:				; CODE XREF: sub_877C+93j
		cmpa	#$70 ; 'p'
		bne	loc_8838
		ldb	7,x
		aslb
		clra
		orcc	#$10
		std	unk_2D33
		sta	unk_2D32
		lda	#4
		sta	unk_2D35

loc_8838:				; CODE XREF: sub_877C+A5j sub_877C+A9j
		andcc	#$EF ; 'Ô'
		ldb	unk_25B8
		andb	#$C
		lsrb
		lsrb
		cmpb	#3
		bcs	loc_8852
		lda	unk_25C0
		jsr	_LoadICBUnknown
		ldb	2,x
		bra	loc_8857
; ---------------------------------------------------------------------------
		fcb $3D	; =
		fcb $3E, $3F
; ---------------------------------------------------------------------------

loc_8852:				; CODE XREF: sub_877C+C7j
		ldu	#$884F
		ldb	b,u

loc_8857:				; CODE XREF: sub_877C+D1j
		ldx	#$1076
		lda	unk_AF1
		bne	loc_8862
		leax	$2C,x

loc_8862:				; CODE XREF: sub_877C+E1j
		jsr	_SysExAMPL
		com	unk_AF1
		ldx	#$25B5
		lda	$B,x
		bne	loc_8888

loc_886F:				; CODE XREF: sub_877C+110j
		ldu	#$1153
		ldb	#$15
		mul
		lda	d,u
		bne	locret_88CE
		orcc	#$10
		lda	unk_2D01
		anda	#$EC ; 'Ï'
		sta	unk_101
		sta	unk_2D01
		bra	loc_88CC
; ---------------------------------------------------------------------------

loc_8888:				; CODE XREF: sub_877C+F1j
		ldb	0,x
		bitb	#$33 ; '3'
		beq	loc_886F
		ldu	#$1153
		ldb	#$15
		mul
		lda	d,u
		bne	loc_88A9
		orcc	#$10
		lda	unk_2D01
		anda	#$EC ; 'Ï'
		sta	unk_101
		sta	unk_2D01
		orcc	#$10
		bra	loc_88AB
; ---------------------------------------------------------------------------

loc_88A9:				; CODE XREF: sub_877C+11Aj
		bsr	sub_88CF

loc_88AB:				; CODE XREF: sub_877C+12Bj
		lda	0,x
		anda	#$20 ; ' '
		pshs	a
		bne	loc_88B8
		lda	#$FF
		sta	unk_105F

loc_88B8:				; CODE XREF: sub_877C+135j
		lda	unk_2D01
		anda	#$20 ; ' '
		eora	,s+
		beq	locret_88CE
		orcc	#$10
		eora	unk_2D01
		sta	unk_2D01
		sta	unk_101

loc_88CC:				; CODE XREF: sub_877C+10Aj
		andcc	#$EF ; 'Ô'

locret_88CE:				; CODE XREF: sub_877C+FBj
					; sub_877C+143j
		rts
; End of function sub_877C


; =============== S U B	R O U T	I N E =======================================


sub_88CF:				; CODE XREF: sub_877C:loc_88A9p
					; ROM:9416P
		lda	,x
		pshs	cc,b,u
		ldu	#$8903
		bita	#$10
		beq	loc_88F0
		ldb	unk_25CD
		andb	#$D8 ; 'ÿ'
		pshs	b
		orcc	#$10
		ldb	unk_2D02
		andb	#$27 ; '''
		orab	,s+
		stb	unk_102
		stb	unk_2D02

loc_88F0:				; CODE XREF: sub_88CF+9j
		anda	#$1F
		orcc	#$10
		ldb	unk_2D01
		andb	#$E0 ; '‡'
		orab	a,u
		stb	unk_2D01
		stb	unk_101
		puls	pc,u,b,cc
; End of function sub_88CF

; ---------------------------------------------------------------------------
		fcb   0
		fcb 1, 2, 3, 8,	9, $A, $B, $10,	$11, $12, $13, $18, $19
		fcb $1A, $1B, 4, 5, 6, 7, $C, $D, $E, $F, $14, $15, $16
		fcb $17, $1C, $1D, $1E,	$1F

; =============== S U B	R O U T	I N E =======================================


sub_8923:				; CODE XREF: sub_82C8+D2P sub_84F7+58P ...
		clra
		pshs	a

loc_8926:				; CODE XREF: sub_8923+30j
		jsr	sub_8290
		lda	4,x
		beq	loc_894D
		jsr	_LoadICBUnknown

loc_8930:				; CODE XREF: sub_8923+28j
		cmpa	unk_25C0
		bne	loc_893C
		lda	unk_25B5
		bita	#$10
		bne	loc_8958

loc_893C:				; CODE XREF: sub_8923+10j
		lda	$12,x
		bita	#$10
		bne	loc_8958
		lda	$10,x
		beq	loc_894D
		jsr	_LoadICBUnknown
		bra	loc_8930
; ---------------------------------------------------------------------------

loc_894D:				; CODE XREF: sub_8923+8j sub_8923+23j
		inc	,s
		lda	,s
		cmpa	#8
		bls	loc_8926
		clra
		bra	loc_8967
; ---------------------------------------------------------------------------

loc_8958:				; CODE XREF: sub_8923+17j sub_8923+1Ej
		anda	#3
		asla
		asla
		asla
		sta	,s
		lda	9,x
		bita	#$18
		bne	loc_8967
		oraa	,s

loc_8967:				; CODE XREF: sub_8923+33j sub_8923+40j
		leas	1,s
; End of function sub_8923


; =============== S U B	R O U T	I N E =======================================


sub_8969:				; CODE XREF: sub_C5B9+1CP
		sta	unk_25CE
		bita	#$18
		bne	loc_8971
		rts
; ---------------------------------------------------------------------------

loc_8971:				; CODE XREF: sub_8969+5j
		anda	#7
		cmpa	#1
		bhi	loc_89A2
		ldb	unk_25CD
		andb	#7
		cmpb	#1
		bhi	loc_89A2
		tsta
		beq	loc_8991
		tstb
		bne	loc_89A2
		ldb	unk_3D54
		bitb	#8
		beq	loc_89A2
		ldb	#$C
		bra	loc_899D
; ---------------------------------------------------------------------------

loc_8991:				; CODE XREF: sub_8969+18j
		tstb
		beq	loc_89A2
		ldb	unk_3D54
		bitb	#$10
		beq	loc_89A2
		ldb	#$F4 ; 'Ù'

loc_899D:				; CODE XREF: sub_8969+26j
		stb	unk_2D23
		bra	loc_89A5
; ---------------------------------------------------------------------------

loc_89A2:				; CODE XREF: sub_8969+Cj sub_8969+15j	...
		clr	unk_2D23

loc_89A5:				; CODE XREF: sub_8969+37j
		ldx	#$89D0
		asla
		ldx	a,x
		lda	#$D
		pshs	a
		ldy	#$2D09
		orcc	#$10

loc_89B5:				; CODE XREF: sub_8969+52j
		ldd	,x++
		std	,y++
		dec	,s
		bne	loc_89B5
		tst	,y+
		bne	loc_89C5
		ldd	-3,y
		std	,y

loc_89C5:				; CODE XREF: sub_8969+56j
		andcc	#$EF ; 'Ô'
		leas	1,s
		lda	unk_25CE
		sta	unk_25CD
		rts
; End of function sub_8969

; ---------------------------------------------------------------------------
		bitb	#7
		bitb	#$21 ; '!'
		bitb	#$55 ; 'U'
		bitb	#$3B ; ';'
		bitb	#$6F ; 'o'
		bitb	#$3B ; ';'
		bitb	#$3B ; ';'
		bitb	#$3B ; ';'

; =============== S U B	R O U T	I N E =======================================


sub_89E0:				; CODE XREF: ROM:8214P
		lda	unk_3D50
		cmpa	#$10
		bcc	loc_8A0F
		ldd	unk_3D52
		bpl	loc_89ED
		nega

loc_89ED:				; CODE XREF: sub_89E0+Aj
		cmpa	#$18
		bhi	loc_8A0F
		tstb
		bpl	loc_89F5
		negb

loc_89F5:				; CODE XREF: sub_89E0+12j
		cmpb	#$20 ; ' '
		bhi	loc_8A0F
		ldx	#$3D55
		lda	,x+
		cmpa	#$10
		bcc	loc_8A0F
		lda	#$10

loc_8A04:				; CODE XREF: sub_89E0+2Bj
		ldb	,x+
		cmpb	#8
		bhi	loc_8A0F
		deca
		bne	loc_8A04
		bra	loc_8A11
; ---------------------------------------------------------------------------

loc_8A0F:				; CODE XREF: sub_89E0+5j sub_89E0+Fj ...
		lda	#$80 ; 'Ä'

loc_8A11:				; CODE XREF: sub_89E0+2Dj
		oraa	unk_2002
		bmi	loc_8A1D
		cmpa	#1
		bls	loc_8A1D
		jmp	loc_8B0B
; ---------------------------------------------------------------------------

loc_8A1D:				; CODE XREF: sub_89E0+34j sub_89E0+38j
		anda	#$7F ; ''
		sta	unk_2002
		ldu	#$1F6D
		stu	word_1F29
		ldx	#$DD27
		jsr	strcpy		; x=src, u=dst

loc_8A2E:				; CODE XREF: sub_89E0+51j
		jsr	sub_B78A
		bne	loc_8A2E
		clra
		pshs	a

loc_8A36:				; CODE XREF: sub_89E0+6Fj
		ldx	#$78 ; 'x'
		jsr	sub_8195
		ldb	#$40 ; '@'
		jsr	sub_A0CF
		lda	word_5FFF
		coma
		sta	word_5FFF
		cmpa	word_5FFF
		beq	loc_8A63
		dec	,s
		bne	loc_8A36
		ldu	#$1F6D
		stu	word_1F29
		ldx	#$DD38
		jsr	strcpy		; x=src, u=dst
		ldx	#$1F40
		jsr	sub_8195

loc_8A63:				; CODE XREF: sub_89E0+6Bj
		leas	1,s
		clra
		ldx	#$2E04

loc_8A69:				; CODE XREF: sub_89E0+8Ej
		sta	,x+
		cmpx	#$2E11
		bcs	loc_8A69
		ldx	#$2E19
		ldu	#$3D5E
		lda	#8

loc_8A78:				; CODE XREF: sub_89E0+9Dj
		sta	,-x
		sta	,-u
		deca
		bne	loc_8A78
		lda	#8
		clrb
		ldx	#$3D5E

loc_8A85:				; CODE XREF: sub_89E0+A8j
		stb	,x+
		deca
		bne	loc_8A85
		sta	unk_3D55
		ldd	#$1010
		ldx	#$3D66
		std	,x++
		std	,x++
		std	,x++
		std	,x++
		ldx	#$8B1C
		ldb	#$11

loc_8AA0:				; CODE XREF: sub_89E0+C5j
		lda	,x+
		sta	[,x++]
		decb
		bne	loc_8AA0
		lda	#$17

loc_8AA9:				; CODE XREF: sub_89E0+F9j
		jsr	sub_8290
		ldu	#$8BE2
		ldb	a,u
		stb	5,x
		clr	7,x
		ldu	#$8B88
		ldb	a,u
		stb	4,x
		sta	unk_21F0
		stx	unk_21F1
		stb	word_22EF+1
		tfr	b, a
		jsr	_LoadICBUnknown
		stx	word_22F1
		clr	$14,x
		ldb	#3
		jsr	sub_85A6
		lda	unk_21F0
		deca
		bpl	loc_8AA9
		lda	#$F
		sta	unk_3D50

loc_8AE0:				; CODE XREF: sub_89E0+106j
		jsr	sub_A348
		dec	unk_3D50
		bpl	loc_8AE0
		clr	unk_3D50
		clr	unk_21F0
		ldx	#$222F
		stx	unk_21F1
		lda	#$14
		pshs	a

loc_8AF8:				; CODE XREF: sub_89E0+121j
		ldb	,s
		addb	#$41 ; 'A'
		jsr	sub_A20E
		dec	,s
		bpl	loc_8AF8
		leas	1,s
		ldu	#$1F2B
		stu	word_1F29

loc_8B0B:				; CODE XREF: sub_89E0+3AJ
		ldx	#ICBUnknown1
		ldb	#1
		jsr	_SysExICB
		ldu	#ICBUnknown1
		ldb	#$41 ; 'A'
		jsr	sub_A14F
		rts
; End of function sub_89E0

; ---------------------------------------------------------------------------
		fcb 0
		fcb $3D	; =
		fcb $51, 0, $3D, $53, 6, $3D, $54, $C, $3D, $52, $A, $2E
		fcb $19, $1D, $2E, $1A,	$FF, $2E, $1B, $34, $2E, $1C, 5
		fcb $2E, $1D, $D2, $2E,	$1E, 2,	$2E, $D, $A0, $2E, $E
		fcb $52, $2E, $69, $82,	$2E, $F, $98, $2E, $C, 1, $3D
		fcb $6F, 2, $3D, $6E, 8, 7, 7, 7, 7, 6,	6, 6, 6, 5, 5
		fcb 5, 5, 4, 4,	4, 4, 3, 3, 3, 3, 2, 2,	2, 2, 1, 1, 1
		fcb 1, 0, 0, 0,	0, $20,	$1C, $18, $14, $10, $C,	8, 4, $20
		fcb $1C, $18, $14, $10,	$C, 8, 4, $20, $1C, $18, $14, $10
		fcb $C,	8, 4, $20, $1C,	$1C, $20, $1C, $1C, $20, $1C, $20
		fcb $1C, $18, $14, $10,	$C, 8, 4, $20, $1C, $18, $14, $10
		fcb $C,	8, 4, 0, 0, 1, 2, 3, 0,	5, 6, 7, 0, 9, $A, $B
		fcb 0, $D, $E, $F, 0, $11, $12,	$13, 0,	$15, $16, $17
		fcb 0, $19, $1A, $1B, 0, $1D, $1E, $1F,	0, 0, 1, 2, 3
		fcb $C,	5, 6, 7, 4, 9, $A, $B, $18, $D,	$E, $F,	8, $11
		fcb $12, $13, 0, $15, $16, $17,	$10, $19, $1A, $1B, $14
		fcb $1D, $1E, $1F, $9C,	$8C, $8C, $AC, $AC, $8C, $AC, $AC
		fcb $AC, $AC, $AC, $AC,	$AC, $AC, $AC, $AC, $AC, $AC, $AC
		fcb $AC, $AC, $AC, $AC,	$AC

; =============== S U B	R O U T	I N E =======================================


sub_8BFA:				; CODE XREF: ROM:810EP
		pshs	cc
		orcc	#$50 ; 'P'
		ldx	#$2A11
		stx	unk_2A0D
		stx	unk_2A0F
		ldx	#$10EC
		stx	unk_10E8
		stx	unk_10EA
		ldx	#$2B10
		stx	unk_2B0C
		stx	unk_2B0E
		ldx	#$1D0D
		stx	unk_1C19
		ldb	#$79 ; 'y'
		ldx	#$1488

loc_8C24:				; CODE XREF: sub_8BFA+31j
		jsr	sub_8CA2
		leax	$10,x
		decb
		bne	loc_8C24
		puls	pc,cc
; End of function sub_8BFA


; =============== S U B	R O U T	I N E =======================================


sub_8C2F:				; CODE XREF: ROM:93E4P	sub_B8D7+5J
		cmpa	,u
		bls	locret_8C3B
		lda	,u
		bne	loc_8C3C
		inc	,u
		stb	1,u

locret_8C3B:				; CODE XREF: sub_8C2F+2j
		rts
; ---------------------------------------------------------------------------

loc_8C3C:				; CODE XREF: sub_8C2F+6j
		inc	,u
		leax	1,u
		leax	a,x
		stb	,x
		pshs	a

loc_8C46:				; CODE XREF: sub_8C2F+23j
		cmpb	-1,x
		bcc	locret_8C54
		lda	-1,x
		sta	,x
		stb	,-x
		dec	,s
		bne	loc_8C46

locret_8C54:				; CODE XREF: sub_8C2F+19j
		puls	pc,a
; End of function sub_8C2F


; =============== S U B	R O U T	I N E =======================================


sub_8C56:				; CODE XREF: sub_B8DF+3J
		lda	,u
		bne	loc_8C5B
		rts
; ---------------------------------------------------------------------------

loc_8C5B:				; CODE XREF: sub_8C56+2j
		leax	1,u

loc_8C5D:				; CODE XREF: sub_8C56+Cj
		cmpb	,x+
		beq	loc_8C65
		deca
		bne	loc_8C5D
		rts
; ---------------------------------------------------------------------------

loc_8C65:				; CODE XREF: sub_8C56+9j
		dec	,u
		deca
		bne	loc_8C6B
		rts
; ---------------------------------------------------------------------------

loc_8C6B:				; CODE XREF: sub_8C56+12j sub_8C56+1Aj
		ldb	,x+
		stb	-2,x
		deca
		bne	loc_8C6B
		rts
; End of function sub_8C56


; =============== S U B	R O U T	I N E =======================================


sub_8C73:				; CODE XREF: sub_875A:loc_875CP
					; sub_902D:loc_903DP ...
		pshs	cc
		orcc	#$10
		tst	unk_1C18
		bne	loc_8C81

loc_8C7C:				; CODE XREF: sub_8C91+Fj
		puls	cc
		orcc	#4
		rts
; ---------------------------------------------------------------------------

loc_8C81:				; CODE XREF: sub_8C73+7j sub_8C91+Dj
		dec	unk_1C18
		ldu	unk_1C19
		pulu	x
		stu	unk_1C19
		puls	cc
		andcc	#$FB ; '˚'
		rts
; End of function sub_8C73


; =============== S U B	R O U T	I N E =======================================


sub_8C91:				; CODE XREF: _NoteFn2+6FP
					; _NoteFn2+118P
		pshs	cc
		pshs	a
		orcc	#$10
		lda	unk_1C18
		cmpa	#2
		puls	a
		bhi	loc_8C81
		bra	loc_8C7C
; End of function sub_8C91


; =============== S U B	R O U T	I N E =======================================


sub_8CA2:				; CODE XREF: sub_8BFA:loc_8C24P
					; _NoteFn1+53P	...
		clr	0,x
		pshs	cc
		orcc	#$10
		inc	unk_1C18
		ldu	unk_1C19
		pshu	x
		stu	unk_1C19
		puls	pc,cc
; End of function sub_8CA2


; =============== S U B	R O U T	I N E =======================================


sub_8CB5:				; CODE XREF: _NoteFn2+7DP
		leau	-$C,u
		pshs	u
		bra	loc_8CBD
; ---------------------------------------------------------------------------

loc_8CBB:				; CODE XREF: sub_8CB5+Ej
		stu	,s

loc_8CBD:				; CODE XREF: sub_8CB5+4j
		ldu	$C,u
		beq	loc_8CC5
		cmpa	2,u
		bhi	loc_8CBB

loc_8CC5:				; CODE XREF: sub_8CB5+Aj
		stu	$C,x
		puls	u
		stx	$C,u
		rts
; End of function sub_8CB5


; =============== S U B	R O U T	I N E =======================================


sub_8CCC:				; CODE XREF: _NoteFn1+1AP
		leau	-$C,u
		bra	loc_8CD6
; ---------------------------------------------------------------------------

loc_8CD0:				; CODE XREF: sub_8CCC+Cj
		cmpa	2,x
		beq	loc_8CDB
		tfr	x, u

loc_8CD6:				; CODE XREF: sub_8CCC+2j
		ldx	$C,u
		bne	loc_8CD0
		rts
; ---------------------------------------------------------------------------

loc_8CDB:				; CODE XREF: sub_8CCC+6j
		ldd	$C,x
		std	$C,u
		andcc	#$FB ; '˚'
		rts
; End of function sub_8CCC


; =============== S U B	R O U T	I N E =======================================


sub_8CE2:				; CODE XREF: sub_BE50+340P
		ldx	,u
		beq	locret_8CEE

loc_8CE6:				; CODE XREF: sub_8CE2+Aj
		cmpa	2,x
		beq	loc_8CEF
		ldx	$C,x
		bne	loc_8CE6

locret_8CEE:				; CODE XREF: sub_8CE2+2j
		rts
; ---------------------------------------------------------------------------

loc_8CEF:				; CODE XREF: sub_8CE2+6j
		andcc	#$FB ; '˚'
		rts
; End of function sub_8CE2


; =============== S U B	R O U T	I N E =======================================


sub_8CF2:				; CODE XREF: _NoteFn1+8AP
		ldd	2,u
		std	$E,x
		stx	2,u
		rts
; End of function sub_8CF2


; =============== S U B	R O U T	I N E =======================================


sub_8CF9:
		leau	-$C,u

loc_8CFB:				; CODE XREF: sub_8CF9+8j
		cmpx	$E,u
		beq	loc_8D04
		ldu	$E,u
		bne	loc_8CFB
		rts
; ---------------------------------------------------------------------------

loc_8D04:				; CODE XREF: sub_8CF9+4j
		ldd	$E,x
		std	$E,u
		andcc	#$FB ; '˚'
		rts
; End of function sub_8CF9


; =============== S U B	R O U T	I N E =======================================


sub_8D0B:				; CODE XREF: sub_9067+BP

; FUNCTION CHUNK AT 8D18 SIZE 00000003 BYTES

		ldx	2,u
		beq	locret_8D17

loc_8D0F:				; CODE XREF: sub_8D13+2j
		cmpa	2,x
		beq	loc_8D18
; End of function sub_8D0B


; =============== S U B	R O U T	I N E =======================================


sub_8D13:				; CODE XREF: sub_9067+14P
		ldx	$E,x
		bne	loc_8D0F

locret_8D17:				; CODE XREF: sub_8D0B+2j
		rts
; End of function sub_8D13

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_8D0B

loc_8D18:				; CODE XREF: sub_8D0B+6j
		andcc	#$FB ; '˚'
		rts
; END OF FUNCTION CHUNK	FOR sub_8D0B
; ---------------------------------------------------------------------------
unk_8D1B:	fcb $2E	; .		; DATA XREF: ROM:9369o
		fcb $52, $2E, $53, $2E,	$54, $2E, $55, $2E, $56, $2E, $57
		fcb $2E, $58, $2E, $59,	$2E, $64, $2E, $64, $2E, $64, $2E
		fcb $64, $2E, $66, $2E,	$66, $2E, $66, $2E, $66, $2E, $65
		fcb $2E, $65, $2E, $65,	$2E, $65, $2E, $64, $2E, $64, $2E
		fcb $64, $2E, $64, $2E,	$67, $2E, $67, $2E, $67, $2E, $67
		fcb $2E, $64, $2E, $64,	$2E, $64, $2E, $64, $FE, $80, $40
		fcb $10, $FE, $80, $40,	$10, $FF, $80, $40, $10, $80, $40
		fcb $10, 8, $80, $40, $10, 8, $FE, $40,	$10, 8,	$40, $10
		fcb 8, 4, $FF, $10, 8, 4, $80, $40, $10, 8, 3, 0, $22
		fcb $47, 4, 4, $22, $4F, 7, $1C, $22, $67, 6, $30, $12
		fcb $40, $1E, $50, $2A,	$60, $FF, $70

; =============== S U B	R O U T	I N E =======================================


_NoteFn2:				; CODE XREF: _MIDIFnToneOn:loc_BA76P
					; sub_BE50+3FP	...
		jsr	sub_9617
		beq	loc_8D9B
		rts
; ---------------------------------------------------------------------------

loc_8D9B:				; CODE XREF: _NoteFn2+3j
		ldu	#$D780
		pshs	b
		ldb	unk_3D54
		andb	#6
		ldu	b,u
		puls	b
		ldb	b,u
		pshs	a,x,u
		stb	2,s
		lda	unk_10D3
		cmpa	#3
		bcc	loc_8DC1
		ldu	#$C0FA
		lda	a,u
		oraa	unk_2BE7
		sta	unk_2BE7

loc_8DC1:				; CODE XREF: _NoteFn2+1Fj
		lda	unk_10D3
		cmpa	#8
		bcs	loc_8DD2
		ldu	unk_10D5
		lda	4,u
		ldu	#$8B4F
		lda	a,u

loc_8DD2:				; CODE XREF: _NoteFn2+31j
		asla
		asla
		sta	3,s
		lda	,s
		ldu	#$8D8B

loc_8DDB:				; CODE XREF: _NoteFn2+48j
		cmpa	,u++
		bhi	loc_8DDB
		lda	-1,u
		sta	4,s
		ldu	unk_10D5
		ldd	4,u
		stb	1,s

loc_8DEA:				; CODE XREF: _NoteFn2+67j
		jsr	_LoadICBUnknown
		ldb	5,x
		andb	#$70 ; 'p'
		cmpb	#$30 ; '0'
		bcs	loc_8E01
		cmpb	4,s
		beq	loc_8E01
		lda	$10,x
		bne	loc_8DEA
		jmp	locret_8F08
; ---------------------------------------------------------------------------

loc_8E01:				; CODE XREF: _NoteFn2+5Ej _NoteFn2+62j
		stx	unk_10D7
		jsr	sub_8C91
		lbeq	locret_8F08
		sta	4,x
		lda	,s
		ldu	unk_10D5
		jsr	sub_8CB5

loc_8E15:				; CODE XREF: _NoteFn2+127j
					; _NoteFn2+139J
		lda	#$40 ; '@'
		ldb	unk_10D3
		std	0,x
		lda	#$FF
		sta	5,x
		ldu	#$8D5B
		lda	3,s
		lda	a,u
		sta	9,x
		ldd	,s
		std	2,x
		ldd	2,s
		sta	$A,x
		aslb
		stb	8,x
		lda	1,s
		bmi	loc_8E47
		ldu	unk_10D7
		ldb	4,u
		jsr	_LoadNoteFreqTable
		asla
		ldb	$A,x
		stb	$B,x
		bra	loc_8E5F
; ---------------------------------------------------------------------------

loc_8E47:				; CODE XREF: _NoteFn2+A1j
		ldu	unk_10D7
		ldb	4,u
		jsr	_LoadNoteFreqTable
		asla
		pshs	a
		ldb	5,u
		andb	#$F
		lda	$A,x
		jsr	sub_E026
		puls	b
		sta	$B,x

loc_8E5F:				; CODE XREF: _NoteFn2+B0j
		mul
		std	6,x
		lda	8,x
		ldu	#$8D1B
		lda	[a,u]
		pshs	a
		mul
		addd	#$FF
		ldb	,s
		sta	,s
		lda	6,x
		mul
		addb	,s+
		adca	#0
		cmpd	#$10
		bls	loc_8E83
		jsr	sub_8F9D

loc_8E83:				; CODE XREF: _NoteFn2+E9j
		ldu	#0
		stu	$E,x
		ldu	unk_10D7
		lda	$10,u
		beq	loc_8ED1

loc_8E90:				; CODE XREF: _NoteFn2+171j
		pshs	x

loc_8E92:				; CODE XREF: _NoteFn2+10Fj
		jsr	_LoadICBUnknown
		ldb	5,x
		andb	#$70 ; 'p'
		cmpb	#3
		bcs	loc_8EA8
		cmpb	6,s
		beq	loc_8EAA
		lda	$10,x
		bne	loc_8E92
		puls	pc,u,y,x,a
; ---------------------------------------------------------------------------

loc_8EA8:				; CODE XREF: _NoteFn2+106j
		inc	5,s

loc_8EAA:				; CODE XREF: _NoteFn2+10Aj
		stx	unk_10D7
		jsr	sub_8C91
		puls	u
		beq	locret_8F08
		stx	$E,u
		sta	4,x
		ldb	#2
		bitb	3,s
		lbeq	loc_8E15
		ldb	1,s
		bitb	#2
		beq	loc_8ECA
		orab	#1
		bra	loc_8ECC
; ---------------------------------------------------------------------------

loc_8ECA:				; CODE XREF: _NoteFn2+12Fj
		andb	#$FE ; '˛'

loc_8ECC:				; CODE XREF: _NoteFn2+133j
		stb	1,s
		jmp	loc_8E15
; ---------------------------------------------------------------------------

loc_8ED1:				; CODE XREF: _NoteFn2+F9j
		lda	1,s
		bita	#$40 ; '@'
		beq	locret_8F08
		lda	unk_10D3
		cmpa	#3
		bcc	locret_8F08
		ldu	#$8D7F
		asla
		asla
		leau	a,u
		lda	,u+
		sta	unk_10D3
		ldb	,u+
		ldu	,u++
		lda	4,u
		beq	locret_8F08
		stb	3,s
		ldb	5,u
		stb	1,s
		pshs	a,x
		stu	unk_10D5
		lda	3,s
		ldb	5,s
		jsr	sub_9617
		puls	x,a
		bra	loc_8E90
; ---------------------------------------------------------------------------

locret_8F08:				; CODE XREF: _NoteFn2+69J _NoteFn2+72j ...
		puls	pc,u,x,a
; End of function _NoteFn2


; =============== S U B	R O U T	I N E =======================================


_NoteFn1:				; CODE XREF: sub_95E1+16P
					; _MIDIFnToneOn+39P ...
		jsr	sub_9674
		ldu	#$D780
		pshs	b
		ldb	unk_3D54
		andb	#6
		ldu	b,u
		puls	b
		ldb	b,u
		orcc	#4
		pshs	cc,a,b
		ldu	unk_10D5
		jsr	sub_8CCC
		lbeq	locret_8F9B
		lda	unk_10D3
		cmpa	#3
		bcc	loc_8F40
		lda	unk_10D3
		ldu	#$C0FA
		lda	a,u
		oraa	unk_2BE7
		sta	unk_2BE7

loc_8F40:				; CODE XREF: _NoteFn1+26j
					; _NoteFn1:loc_8F99j
		lda	,x
		oraa	#$80 ; 'Ä'
		sta	,x
		bita	#$70 ; 'p'
		beq	loc_8F62
		bita	#2
		beq	loc_8F55
		inc	unk_10E7
		ldx	$E,x
		bra	loc_8F99
; ---------------------------------------------------------------------------

loc_8F55:				; CODE XREF: _NoteFn1+42j
		bita	#$40 ; '@'
		beq	loc_8F6F
		ldd	$E,x
		pshs	a,b
		jsr	sub_8CA2
		bra	loc_8F97
; ---------------------------------------------------------------------------

loc_8F62:				; CODE XREF: _NoteFn1+3Ej
		lda	#$FB ; '˚'
		anda	,s
		sta	,s
		lda	2,s
		sta	$A,x
		jsr	sub_8FDF

loc_8F6F:				; CODE XREF: _NoteFn1+4Dj
		ldd	$E,x
		pshs	a,b
		lda	1,x
		cmpa	unk_10D3
		beq	loc_8F91
		sta	unk_10D3
		ldb	#8
		mul
		ldu	#$222F
		leau	d,u
		stu	unk_10D5
		ldd	3,s
		pshs	x
		jsr	sub_9674
		puls	x

loc_8F91:				; CODE XREF: _NoteFn1+6Ej
		ldu	unk_10D5
		jsr	sub_8CF2

loc_8F97:				; CODE XREF: _NoteFn1+56j
		ldx	,s++

loc_8F99:				; CODE XREF: _NoteFn1+49j
		bne	loc_8F40

locret_8F9B:				; CODE XREF: _NoteFn1+1Dj
		puls	pc,b,a,cc
; End of function _NoteFn1


; =============== S U B	R O U T	I N E =======================================


sub_8F9D:				; CODE XREF: _NoteFn2+EBP
		pshs	x
		lda	1,x
		bne	loc_8FA8
		ldb	unk_10D4
		bne	loc_8FB7

loc_8FA8:				; CODE XREF: sub_8F9D+4j
		ldb	unk_3D54
		bitb	#$80 ; 'Ä'
		bne	loc_8FB7
		cmpa	#2
		beq	loc_8FB7
		cmpa	#5
		bne	loc_8FBC

loc_8FB7:				; CODE XREF: sub_8F9D+9j sub_8F9D+10j	...
		ldb	2,x
		jsr	sub_9067

loc_8FBC:				; CODE XREF: sub_8F9D+18j
		lda	unk_10E6
		cmpa	#$28 ; '('
		bcc	locret_8FDD
		ldu	unk_10EA
		stx	,u++
		lda	0,x
		oraa	#2
		sta	0,x
		inc	unk_10E6
		cmpu	#$113C
		bcs	loc_8FDA
		ldu	#$10EC

loc_8FDA:				; CODE XREF: sub_8F9D+38j
		stu	unk_10EA

locret_8FDD:				; CODE XREF: sub_8F9D+24j
		puls	pc,x
; End of function sub_8F9D


; =============== S U B	R O U T	I N E =======================================


sub_8FDF:				; CODE XREF: _NoteFn1+62P
		lda	,x
		bita	#$70 ; 'p'
		bne	locret_902C
		ldb	1,x
		bne	loc_8FF4
		ldb	unk_10D4
		beq	loc_8FF4
		oraa	#4
		sta	0,x
		bra	locret_902C
; ---------------------------------------------------------------------------

loc_8FF4:				; CODE XREF: sub_8FDF+8j sub_8FDF+Dj
		ldb	5,x
		ldu	#$94C3
		aslb
		ldu	b,u
		lda	$1A,u
		bmi	locret_902C
		pshs	b
		lda	$A,x
		ldb	3,x
		bitb	#4
		bne	loc_900D
		lda	#$40 ; '@'

loc_900D:				; CODE XREF: sub_8FDF+2Aj
		ldb	#$FF
		stb	1,u
		sta	$C,u
		ldb	5,x
		addb	,s+
		ldu	#$21F3
		leau	b,u
		lda	,u
		oraa	#2
		sta	,u
		lda	,x
		oraa	#$10
		sta	,x
		ldb	5,x
		bra	sub_902D
; ---------------------------------------------------------------------------

locret_902C:				; CODE XREF: sub_8FDF+4j sub_8FDF+13j	...
		rts
; End of function sub_8FDF


; =============== S U B	R O U T	I N E =======================================


sub_902D:				; CODE XREF: sub_8FDF+4Bj sub_959A+30P
		pshs	a,b,x,y,u
		lda	4,x
		jsr	_LoadICBUnknown
		ldb	3,x
		jsr	sub_A1F6
		cmpb	#$FF
		beq	locret_9065

loc_903D:				; CODE XREF: sub_902D+18j
		jsr	sub_8C73
		bne	loc_9047
		jsr	sub_81CD
		bra	loc_903D
; ---------------------------------------------------------------------------

loc_9047:				; CODE XREF: sub_902D+13j
		ldu	2,s
		ldb	1,s
		stb	2,x
		lda	$A,u
		ldb	3,u
		bitb	#4
		bne	loc_9057
		lda	#$40 ; '@'

loc_9057:				; CODE XREF: sub_902D+26j
		sta	$B,x
		lda	4,u
		deca
		sta	1,x
		lda	#4
		sta	0,x
		jsr	sub_AA82

locret_9065:				; CODE XREF: sub_902D+Ej
		puls	pc,u,y,x,b,a
; End of function sub_902D


; =============== S U B	R O U T	I N E =======================================


sub_9067:				; CODE XREF: sub_8F9D+1CP
		pshs	a,b,x,u
		jsr	sub_8290
		pshs	x
		ldu	,s
		lda	3,s
		jsr	sub_8D0B
		bra	loc_907E
; ---------------------------------------------------------------------------

loc_9077:				; CODE XREF: sub_9067+1Dj sub_9067+46j
		lda	3,s
		ldu	,s
		jsr	sub_8D13

loc_907E:				; CODE XREF: sub_9067+Ej
		beq	loc_90AF
		lda	,x
		bita	#$60 ; '`'
		bne	loc_9077
		ldb	5,x
		pshs	b
		aslb
		addb	,s
		ldu	#$21F3
		leau	b,u
		puls	b
		lda	,u
		oraa	#4
		sta	,u
		lda	,x
		oraa	#$20 ; ' '
		sta	,x
		ldu	#$94C3
		aslb
		ldu	b,u
		lda	#$FF
		sta	2,u
		inc	unk_10CE
		bra	loc_9077
; ---------------------------------------------------------------------------

loc_90AF:				; CODE XREF: sub_9067:loc_907Ej
		leas	2,s
		puls	pc,u,x,b,a
; End of function sub_9067

; ---------------------------------------------------------------------------
		jsr	sub_81CD

loc_90B6:				; CODE XREF: ROM:90F3j	ROM:loc_9194j ...
		lda	unk_25B8
		bpl	loc_90ED
		ldu	#$1153
		lda	unk_25C0
		ldb	#21
		mul
		leau	d,u
		ldb	,u
		beq	loc_90ED
		ldb	b,u
		addb	unk_3D52
		lda	unk_25C0
		jsr	_LoadICBUnknown
		addb	7,x
		cmpb	#$19
		bls	loc_90DF
		cmpb	#$5A ; 'Z'
		bls	loc_90E3

loc_90DF:				; CODE XREF: ROM:90D9j
		clra
		clrb
		bra	loc_90EA
; ---------------------------------------------------------------------------

loc_90E3:				; CODE XREF: ROM:90DDj
		subb	#$1A
		lda	#7
		mul
		lsra
		rorb

loc_90EA:				; CODE XREF: ROM:90E1j
		std	unk_2D2B

loc_90ED:				; CODE XREF: ROM:90B9j	ROM:90C8j
		jsr	sub_81CD
		lda	unk_10E6
		beq	loc_90B6
		suba	unk_10E7
		lbeq	loc_918D
		suba	word_2005
		lble	loc_918D
		suba	unk_10CE
		lble	loc_918D
		pshs	a
		cmpa	unk_113E
		bcs	loc_911A
		lda	unk_113E
		beq	loc_918B
		sta	,s
		bra	loc_9156
; ---------------------------------------------------------------------------

loc_911A:				; CODE XREF: ROM:910Fj
		ldy	#$1167
		sta	,y
		ldx	#$113E
		lda	,x+
		suba	#2
		asla
		leax	a,x

loc_912A:				; CODE XREF: ROM:9154j
		stx	unk_113C
		ldx	#$113F
		lda	#$FF
		pshs	a

loc_9134:				; CODE XREF: ROM:9145j
		ldd	,x++
		cmpa	,x
		bcc	loc_9142
		ldu	,x
		stu	-2,x
		std	,x
		clr	,s

loc_9142:				; CODE XREF: ROM:9138j
		cmpx	unk_113C
		bls	loc_9134
		lda	,s+
		bne	loc_9156
		dec	,y
		beq	loc_9156
		leax	-4,x
		cmpx	#$113F
		bcc	loc_912A

loc_9156:				; CODE XREF: ROM:9118j	ROM:9149j ...
		ldu	#$21F3

loc_9159:				; CODE XREF: ROM:9189j
		ldx	#$113E
		lda	,x+
		beq	loc_918B
		deca
		sta	-1,x
		asla
		inca
		lda	a,x
		pshs	a
		asla
		ldy	#$94C3
		ldy	a,y
		ldb	#$FF
		stb	2,y
		adda	,s+
		ldb	a,u
		orab	#4
		stb	a,u
		inca
		ldb	[a,u]
		orab	#$20 ; ' '
		stb	[a,u]
		inc	unk_10CE
		dec	,s
		bne	loc_9159

loc_918B:				; CODE XREF: ROM:9114j	ROM:915Ej
		leas	1,s

loc_918D:				; CODE XREF: ROM:90F8j	ROM:90FFj ...
		ldy	unk_10E8
		lda	unk_10E6

loc_9194:				; CODE XREF: ROM:91B8j
		lbeq	loc_90B6
		ldx	,y++
		stx	unk_10CF
		lda	0,x
		bpl	loc_91BA
		dec	unk_10E7
		jsr	sub_8CA2
		cmpy	#$113C
		bcs	loc_91B1
		ldy	#$10EC

loc_91B1:				; CODE XREF: ROM:91ABj
		sty	unk_10E8
		dec	unk_10E6
		bra	loc_9194
; ---------------------------------------------------------------------------

loc_91BA:				; CODE XREF: ROM:919Fj
		lda	word_2005
		lbeq	loc_90B6
		jsr	sub_8C73
		lbeq	loc_90B6
		stx	unk_10D1
		dec	unk_10E6
		cmpy	#$113C
		bcs	loc_91D8
		ldy	#$10EC

loc_91D8:				; CODE XREF: ROM:91D2j
		sty	unk_10E8
		ldx	#$2005
		dec	,x+
		ldu	,x
		pulu	a
		stu	,x
		pshs	a
		asla
		adda	,s
		ldx	#$21F3
		leax	a,x
		lda	0,x
		anda	#$80 ; 'Ä'
		oraa	#$11
		sta	0,x
		ldu	unk_10CF
		stu	1,x
		lda	,u
		anda	#$BD ; 'Ω'
		oraa	#8
		sta	0,u
		lda	,s
		sta	5,u
		ldy	unk_10D1
		sta	2,y
		lda	$A,u
		ldb	3,u
		bitb	#4
		bne	loc_921A
		lda	#$40 ; '@'

loc_921A:				; CODE XREF: ROM:9216j
		sta	$B,y
		lda	4,u
		deca

loc_921F:
		sta	1,y
		inca
		jsr	_LoadICBUnknown
		stx	unk_10D7
		lda	$13,x
		sta	5,y
		ldb	4,x
		cmpb	#$40 ; '@'
		bne	loc_923A
		lda	#$10
		ldx	#$2C78
		bra	loc_925B
; ---------------------------------------------------------------------------

loc_923A:				; CODE XREF: ROM:9231j
		cmpb	#$55 ; 'U'
		bne	loc_9245
		lda	#$12
		ldx	#$2C7C
		bra	loc_925B
; ---------------------------------------------------------------------------

loc_9245:				; CODE XREF: ROM:923Cj
		ldb	3,x
		cmpb	#$40 ; '@'
		bne	loc_9252
		lda	#$14
		ldx	#$2C78
		bra	loc_925B
; ---------------------------------------------------------------------------

loc_9252:				; CODE XREF: ROM:9249j
		cmpb	#$55 ; 'U'
		bne	loc_9275
		lda	#$16
		ldx	#$2C7C

loc_925B:				; CODE XREF: ROM:9238j	ROM:9243j ...
		ldu	#$81A4
		ldb	1,y
		lsrb
		lsrb
		lsrb
		leax	b,x
		ldb	1,y
		andb	#7
		ldb	b,u
		bitb	,x
		beq	loc_9275
		eorb	,x
		stb	,x
		bra	loc_9277
; ---------------------------------------------------------------------------

loc_9275:				; CODE XREF: ROM:9254j	ROM:926Dj
		lda	#2

loc_9277:				; CODE XREF: ROM:9273j
		sta	0,y
		ldu	unk_10CF
		ldx	unk_10D7
		ldb	2,u
		addb	unk_3D52
		lda	5,x
		bita	#$80 ; 'Ä'
		beq	loc_928C
		ldb	#$2D ; '-'

loc_928C:				; CODE XREF: ROM:9288j
		sex
		pshs	a,b
		ldb	7,x
		sex
		addd	,s++

loc_9294:				; CODE XREF: ROM:9299j
		bpl	loc_929E	; // 91	entries	defined	in _NoteFreqTable
		addd	#12		; if (d	< 0) d += 12
		bra	loc_9294
; ---------------------------------------------------------------------------

loc_929B:				; CODE XREF: ROM:92A2j
		subd	#12

loc_929E:				; CODE XREF: ROM:loc_9294j
		cmpd	#90		; // 91	entries	defined	in _NoteFreqTable
		bgt	loc_929B	; if (d	> 90) {	d -= 12	}
		pshs	b
		aslb			; 2x 16-bit arithmetic left shift (a=hi, b=lo)
					; D (16-bit) = [A,B] (2x 8-bit)
		rola
		aslb
		rola			; d *= 4
		ldu	#_NoteFreqTable	; (12 MHz / 32.70 (C-1)) >> 7 =	2867
					; (12 MHz / 65.41 (C-2)) >> 7 =	1433
					; (12 MHz / 69.30 (C#2)) >> 6 =	2706
		leau	d,u		; u += d
		lda	1,u		; a = *(u+1)
		sta	8,y		; // y = 0x10D1	(coprocessor) ?
		pshs	y,u
		ldb	4,x
		jsr	_LoadNoteFreqTable
		puls	u,y
		bpl	loc_92C2
		leau	364,u		; u += 364

loc_92C2:				; CODE XREF: ROM:92BCj
		puls	b
		lda	unk_10D9
		beq	loc_92D8

loc_92C9:				; CODE XREF: ROM:92CBj
		subb	#12
		bpl	loc_92C9	; if (b	> 0) { b -= 12 }
		addb	#12
		pshs	x
		ldx	#$10DA
		lda	b,x
		puls	x

loc_92D8:				; CODE XREF: ROM:92C7j
		adda	8,x
		pshs	a
		lda	20,x
		ldx	unk_10CF
		ldb	3,x
		bitb	#$20 ; ' '
		bne	loc_92E9	; a += (stack[0] = a) =	instrument tuning/pitch	shift?
		clra			; a=0

loc_92E9:				; CODE XREF: ROM:92E6j
		adda	,s		; a += (stack[0] = a) =	instrument tuning/pitch	shift?
		adda	unk_3D53	; tuning? pitch/shift
		bne	RecalcTunedFreq	; jump if (ICB tuning +	tuning setting)	!= 0,
					; otherwise the	value from NoteFreq can	be used	straight away?
		leas	1,s
		ldd	2,u		; a,b =	d = [NoteFreq+2] = frequency 16-bit
		bra	UseFreq		; *(y+9) = 16-bit freq // d = freq
; ---------------------------------------------------------------------------

RecalcTunedFreq:			; CODE XREF: ROM:92EEj
		sta	,s		; [,s] = detune
		bpl	loc_92FB
		nega			; handle negative

loc_92FB:				; CODE XREF: ROM:92F8j
		ldb	3,u
		mul			; a (detune) * b (lo 16-bit freq)
		adca	#0		; a += carry bit
		ldb	,s		; b = [,s] = detune
		pshs	a
		bpl	loc_9307
		negb			; handle negative

loc_9307:				; CODE XREF: ROM:9304j
		lda	2,u
		mul			; b (detune) * a (hi 16-bit of prev mul)
		addb	,s+
		adca	#0		; a += carry bit
		addd	#3		; a += 3
		lsra			; 2x 16-bit arithmetic right shift
					; *= 4
		rorb
		lsrb
		rora
		tst	,s+
		bpl	loc_931D	; d += [NoteFreq+2]
		nega
		negb
		sbca	#0

loc_931D:				; CODE XREF: ROM:9317j
		addd	2,u		; d += [NoteFreq+2]

UseFreq:				; CODE XREF: ROM:92F4j
		std	9,y		; *(y+9) = 16-bit freq // d = freq
		ldd	,u		; a,b =	d = [NoteFreq+0],[NoteFreq+1]
		stb	6,y		; *(y+6) = 8-bit [NoteFreq+1]?
		ldu	unk_10CF
		ldb	3,u		; b = [NoteFreq+3] = low 16-bit	of freq
		bitb	#%10000
		beq	loc_9330
		oraa	#$80 ; 'Ä'      ; if([NoteFreq+2,3] >= 4096) a = [NoteFreq+0] =| 0x80

loc_9330:				; CODE XREF: ROM:932Cj
		ldb	unk_2E0D
		bitb	#%10000
		bne	loc_933E
		ldb	unk_2E0E
		bitb	#$60 ; '`'
		beq	loc_9340	; *(y+7) = [NoteFreq+0]	adjusted

loc_933E:				; CODE XREF: ROM:9335j
		oraa	#$40 ; '@'

loc_9340:				; CODE XREF: ROM:933Cj
		sta	7,y		; *(y+7) = [NoteFreq+0]	adjusted
		ldx	unk_10D1
		jsr	sub_AA32
		lda	,s
		asla
		ldu	#$94C3
		ldu	a,u
		lda	8,y
		sta	$A,u
		ldy	unk_10D7
		ldx	unk_10CF
		lda	$A,x
		ldb	3,x
		bitb	#4
		bne	loc_9365
		lda	#$40 ; '@'

loc_9365:				; CODE XREF: ROM:9361j
		sta	$C,u
		pshs	u
		ldu	#unk_8D1B
		ldb	8,x
		ldb	[b,u]
		pshs	b
		lda	7,x
		mul
		addd	#$FF
		ldb	,s
		sta	,s
		lda	6,x
		mul
		addb	,s+
		adca	#0
		puls	u
		std	$12,u
		ldb	2,y
		leax	$19,u
		pshs	u
		jsr	_SysExAMPL
		puls	u
		lda	$1A,u
		bpl	loc_93AB
		cmpa	#$FF
		beq	loc_93AB
		ldx	unk_10CF
		ldb	1,x
		cmpb	#2
		beq	loc_93AB
		anda	#$7F ; ''
		sta	$1A,u

loc_93AB:				; CODE XREF: ROM:9397j	ROM:939Bj ...
		clra
		clrb
		pshs	cc
		orcc	#$10
		sta	5,u
		std	1,u
		coma
		sta	,u
		sta	3,u
		puls	cc
		ldx	unk_10D1
		jsr	sub_AA82
		ldy	unk_10CF
		lda	#$FF
		ldb	4,y
		ldu	#$25D4
		sta	b,u
		ldu	#$2D67
		lda	#8
		sta	b,u
		lda	#$15
		ldb	4,y
		mul
		ldu	#$1153
		leau	d,u
		ldb	2,y
		lda	#$14
		jsr	sub_8C2F
		lda	4,y
		jsr	_LoadICBUnknown
		lda	$12,x
		bita	#$10
		beq	loc_940B
		lda	unk_25CD
		anda	#$D8 ; 'ÿ'
		pshs	a
		orcc	#$10
		lda	unk_2D02
		anda	#$27 ; '''
		oraa	,s+
		sta	unk_102
		sta	unk_2D02
		andcc	#$EF ; 'Ô'

loc_940B:				; CODE XREF: ROM:93F1j
		lda	4,y
		ldx	#$25B5
		cmpa	$B,x
		lbne	loc_94B3
		jsr	sub_88CF
		ldx	#$25B5
		lda	3,x
		anda	#$60 ; '`'
		cmpa	#$40 ; '@'
		bhi	loc_948F
		ldb	unk_2D28
		beq	loc_942F
		lda	3,x
		bita	#$10
		beq	loc_948F

loc_942F:				; CODE XREF: ROM:9427j
		lda	3,x
		anda	#3
		ldu	#$94BF
		lda	a,u
		beq	loc_9473
		ldb	8,x
		addb	9,x
		pshs	b
		ldb	$A,y
		lsrb
		subb	#$40 ; '@'
		bpl	loc_944E
		pshs	a
		mul
		suba	,s+
		bra	loc_944F
; ---------------------------------------------------------------------------

loc_944E:				; CODE XREF: ROM:9445j
		mul

loc_944F:				; CODE XREF: ROM:944Cj
		pshs	a
		ldu	#$2D3E
		adda	9,x
		bvc	loc_945A
		lda	#$7F ; ''

loc_945A:				; CODE XREF: ROM:9456j
		bpl	loc_945D
		clra

loc_945D:				; CODE XREF: ROM:loc_945Aj
		sta	3,u
		suba	7,x
		sta	,u
		puls	a
		asra
		adda	,s+
		bvc	loc_946C
		lda	#$7F ; ''

loc_946C:				; CODE XREF: ROM:9468j
		bpl	loc_946F
		clra

loc_946F:				; CODE XREF: ROM:loc_946Cj
		suba	3,u
		sta	2,u

loc_9473:				; CODE XREF: ROM:9438j
		clrb
		lda	3,x
		bita	#$20 ; ' '
		orcc	#$10
		beq	loc_947E
		ldb	#$40 ; '@'

loc_947E:				; CODE XREF: ROM:947Aj
		stb	unk_2D32
		clra
		clrb
		std	unk_2D36
		sta	unk_2D35
		coma
		sta	unk_2D28
		andcc	#$EF ; 'Ô'

loc_948F:				; CODE XREF: ROM:9422j	ROM:942Dj
		lda	0,x
		bita	#$20 ; ' '
		beq	loc_94B3
		lda	8,y
		ldu	#$8D1B
		lda	[a,u]
		ldb	$B,y
		mul
		ldx	#$105D
		std	$12,x
		clrb
		clra
		std	1,x
		coma
		sta	,x
		sta	3,x
		sta	5,x
		sta	unk_25D4

loc_94B3:				; CODE XREF: ROM:9412j	ROM:9493j
		leas	1,s
		lda	unk_10E6
		lbne	loc_918D
		jmp	loc_90B6
; ---------------------------------------------------------------------------
		neg	<unk_55
; ---------------------------------------------------------------------------
		fcb $AA	; ™
; ---------------------------------------------------------------------------
		stu	unk_AF9
; ---------------------------------------------------------------------------
		fcb  $B
		fcb $3E	; >
		fcb  $B
; ---------------------------------------------------------------------------
		subd	#$BC8
		inc	<byte_D
		inc	<byte_52
		inc	<unk_97
; ---------------------------------------------------------------------------
		fcb  $C
; ---------------------------------------------------------------------------
		ldd	<byte_D
		brn	loc_94E3
		ror	$D,x
		adda	$D,x
		subb	unk_E35
		jmp	<unk_7A
; ---------------------------------------------------------------------------
		jmp	<unk_BF
; ---------------------------------------------------------------------------
		clr	<unk_4

loc_94E3:				; CODE XREF: ROM:94D4j
		clr	<unk_49
		clr	<unk_8E
		clr	<byte_D3
; ---------------------------------------------------------------------------
		fcb $10
		fcb $18
; ---------------------------------------------------------------------------
		ldx	unk_2237
; ---------------------------------------------------------------------------
		fcb $26	; &
; ---------------------------------------------------------------------------
		ror	<unk_BE
		bhi	loc_9521+1
		bne	loc_9524
		rts
; ---------------------------------------------------------------------------
		tst	unk_2E0C
		bmi	loc_9524
		lda	unk_2BE7
		oraa	#5
		sta	unk_2BE7
		pshs	x
		ldb	#0

loc_9507:				; CODE XREF: ROM:9513j
		tfr	x, u

loc_9509:				; CODE XREF: ROM:950Dj
		stb	1,x
		ldx	$E,x
		bne	loc_9509
		tfr	u, x
		ldx	$C,x
		bne	loc_9507
		ldx	unk_222F
		stx	$C,u
		puls	x
		stx	unk_222F
		clra
		clrb

loc_9521:				; CODE XREF: ROM:94F1j
		std	unk_2237

loc_9524:				; CODE XREF: ROM:94F3j	ROM:94F9j
		lda	2,x
		pshs	a
		lda	unk_2E0C
		anda	#$80 ; 'Ä'
		oraa	,s+
		sta	unk_2E0C
		rts

; =============== S U B	R O U T	I N E =======================================


sub_9533:				; CODE XREF: sub_82C8+CP sub_82C8+48P	...
		lda	unk_2E0C
		bmi	loc_956B
		ldx	unk_222F
		beq	locret_9599
		cmpa	2,x
		bls	locret_9599
		ldu	#0
		pshs	u
		ldb	#1
		bra	loc_954E
; ---------------------------------------------------------------------------

loc_954A:				; CODE XREF: sub_9533+21j
		cmpa	2,x
		bls	loc_9556

loc_954E:				; CODE XREF: sub_9533+15j
		stb	1,x
		stx	,s
		ldx	$C,x
		bne	loc_954A

loc_9556:				; CODE XREF: sub_9533+19j
		ldx	,s++
		beq	locret_9599
		ldu	unk_222F
		stu	unk_2237
		ldu	$C,x
		stu	unk_222F
		clr	$C,x
		clr	$D,x
		bra	loc_9591
; ---------------------------------------------------------------------------

loc_956B:				; CODE XREF: sub_9533+3j
		ldx	unk_2237
		beq	locret_9599
		ldb	#0

loc_9572:				; CODE XREF: sub_9533+4Bj
		tfr	x, u

loc_9574:				; CODE XREF: sub_9533+45j
		stb	1,x
		ldx	$E,x
		bne	loc_9574
		tfr	u, x
		ldx	$C,x
		bne	loc_9572
		ldx	unk_222F
		stx	$C,u
		ldx	unk_2237
		stx	unk_222F
		clr	unk_2237
		clr	unk_2238

loc_9591:				; CODE XREF: sub_9533+36j
		lda	unk_2BE7
		oraa	#5
		sta	unk_2BE7

locret_9599:				; CODE XREF: sub_9533+8j sub_9533+Cj ...
		rts
; End of function sub_9533


; =============== S U B	R O U T	I N E =======================================


sub_959A:				; CODE XREF: sub_82C8+3BP sub_BF83+AP	...
		pshs	a,b,x,y,u
		ldu	#$2225

loc_959F:				; CODE XREF: sub_959A+43j
		ldu	$C,u
		beq	locret_95DF
		leax	,u

loc_95A5:				; CODE XREF: sub_959A+41j
		lda	,x
		bita	#$40 ; '@'
		bne	loc_95D9
		bita	#4
		beq	loc_95D9
		ldb	5,x
		pshs	b
		aslb
		addb	,s
		ldy	#$21F3
		leay	b,y
		puls	b
		lda	,x
		oraa	#$10
		sta	,x
		lda	,y
		oraa	#2
		sta	,y
		jsr	sub_902D
		aslb
		ldy	#$94C3
		ldy	b,y
		lda	#$FF
		sta	1,y

loc_95D9:				; CODE XREF: sub_959A+Fj sub_959A+13j
		ldx	$E,x
		bne	loc_95A5
		bra	loc_959F
; ---------------------------------------------------------------------------

locret_95DF:				; CODE XREF: sub_959A+7j
		puls	pc,u,y,x,b,a
; End of function sub_959A


; =============== S U B	R O U T	I N E =======================================


sub_95E1:				; CODE XREF: ROM:loc_BB53P
		pshs	a,b

loc_95E3:				; CODE XREF: sub_95E1+23j
		sta	unk_10D3
		jsr	sub_8290
		stx	unk_10D5
		leax	-$C,x

loc_95EE:				; CODE XREF: sub_95E1+1Bj
		ldx	$C,x
		beq	loc_95FE
		lda	2,x
		clrb
		pshs	x
		jsr	_NoteFn1
		puls	x
		bra	loc_95EE
; ---------------------------------------------------------------------------

loc_95FE:				; CODE XREF: sub_95E1+Fj
		inc	,s
		lda	,s
		cmpa	1,s
		bls	loc_95E3
		puls	pc,b,a
; End of function sub_95E1


; =============== S U B	R O U T	I N E =======================================


sub_9608:				; CODE XREF: envModulesDisplay+3P
		ldx	#$AFB
		ldd	#$FF14

loc_960E:				; CODE XREF: sub_9608+Cj
		sta	,x
		leax	$45,x
		decb
		bne	loc_960E
		rts
; End of function sub_9608


; =============== S U B	R O U T	I N E =======================================


sub_9617:				; CODE XREF: _NoteFn2P	_NoteFn2+16CP
		orcc	#4
		pshs	cc,a,b
		ldb	unk_3D6F
		bitb	#1
		bne	locret_9672
		lda	unk_10D3
		bitb	#2
		bne	loc_963A
		ldb	word_2005
		cmpb	#4
		bhi	locret_9672
		clr	,s
		cmpa	#8
		bcs	loc_963E
		suba	#7
		bra	loc_9645
; ---------------------------------------------------------------------------

loc_963A:				; CODE XREF: sub_9617+10j
		cmpa	#8
		bcc	locret_9672

loc_963E:				; CODE XREF: sub_9617+1Dj
		ldx	#$2E11
		lda	a,x
		beq	locret_9672

loc_9645:				; CODE XREF: sub_9617+21j
		adda	#$8F ; 'è'
		jsr	_MIDITransmitA
		lda	1,s
		adda	#$24 ; '$'
		anda	#$7F ; ''
		jsr	_MIDITransmitA
		ldx	unk_10D5
		lda	5,x
		bita	#8
		beq	loc_9660
		lda	2,s
		bra	loc_966C
; ---------------------------------------------------------------------------

loc_9660:				; CODE XREF: sub_9617+43j
		lda	unk_10D3
		asla
		asla
		asla
		ldx	#$8D1B
		lda	[a,x]
		lsra

loc_966C:				; CODE XREF: sub_9617+47j
		bne	loc_966F
		inca

loc_966F:				; CODE XREF: sub_9617:loc_966Cj
		jsr	_MIDITransmitA

locret_9672:				; CODE XREF: sub_9617+9j sub_9617+17j	...
		puls	pc,b,a,cc
; End of function sub_9617


; =============== S U B	R O U T	I N E =======================================


sub_9674:				; CODE XREF: _NoteFn1P	_NoteFn1+82P
		pshs	a,b
		ldb	unk_3D6F
		bitb	#1
		bne	locret_96C0
		lda	unk_10D3
		cmpa	#8
		bcs	loc_968C
		bitb	#2
		bne	locret_96C0
		suba	#7
		bra	loc_9693
; ---------------------------------------------------------------------------

loc_968C:				; CODE XREF: sub_9674+Ej
		ldx	#$2E11
		lda	a,x
		beq	locret_96C0

loc_9693:				; CODE XREF: sub_9674+16j
		ldx	unk_10D5
		ldb	5,x
		bitb	#8
		bne	loc_96AD
		adda	#$8F ; 'è'
		jsr	_MIDITransmitA
		lda	,s
		adda	#36		; C1?
		anda	#$7F ; ''
		jsr	_MIDITransmitA
		clra
		bra	loc_96BD
; ---------------------------------------------------------------------------

loc_96AD:				; CODE XREF: sub_9674+26j
		adda	#$7F ; ''
		jsr	_MIDITransmitA
		lda	,s
		adda	#36		; C1?
		anda	#$7F ; ''
		jsr	_MIDITransmitA
		lda	1,s

loc_96BD:				; CODE XREF: sub_9674+37j
		jsr	_MIDITransmitA

locret_96C0:				; CODE XREF: sub_9674+7j sub_9674+12j	...
		puls	pc,b,a
; End of function sub_9674


; =============== S U B	R O U T	I N E =======================================


sub_96C2:

; FUNCTION CHUNK AT 971E SIZE 00000040 BYTES

		lda	#7
		sta	<byte_B0
		ldx	<byte_68
		ldu	#$2C00
		lda	<byte_83
		bne	loc_96D2

loc_96CF:				; CODE XREF: sub_96C2+1Cj
		jmp	tableEnvUnkEnd
; ---------------------------------------------------------------------------

loc_96D2:				; CODE XREF: sub_96C2+Bj
		bpl	loc_96DA
		lda	#$31 ; '1'
		sta	,x+
		bra	loc_96DC
; ---------------------------------------------------------------------------

loc_96DA:				; CODE XREF: sub_96C2:loc_96D2j
		bsr	sub_96EC

loc_96DC:				; CODE XREF: sub_96C2+16j
		lda	<byte_84
		beq	loc_96CF
		bpl	loc_96E8
		lda	#$32 ; '2'
		sta	,x+
		bra	loc_971E
; ---------------------------------------------------------------------------

loc_96E8:				; CODE XREF: sub_96C2+1Ej
		bsr	sub_96EC
		bra	loc_971E
; End of function sub_96C2


; =============== S U B	R O U T	I N E =======================================


sub_96EC:				; CODE XREF: sub_96C2:loc_96DAp
					; sub_96C2:loc_96E8p ...
		ldb	#6
		anda	#$3F ; '?'
		mul
		subb	#4
		stb	,x+
		rts
; End of function sub_96EC


; =============== S U B	R O U T	I N E =======================================


sub_96F6:
		lda	#5
		sta	<byte_B0
		ldx	<byte_68
		ldu	#$2C00
		lda	<byte_83
		bne	loc_9706

loc_9703:				; CODE XREF: sub_96F6+1Cj
		jmp	loc_9A2E
; ---------------------------------------------------------------------------

loc_9706:				; CODE XREF: sub_96F6+Bj
		bpl	loc_970E
		lda	#$2A ; '*'
		sta	,x+
		bra	loc_9710
; ---------------------------------------------------------------------------

loc_970E:				; CODE XREF: sub_96F6:loc_9706j
		bsr	sub_96EC

loc_9710:				; CODE XREF: sub_96F6+16j
		lda	<byte_84
		beq	loc_9703
		bpl	loc_971C
		lda	#$FF
		sta	,x+
		bra	loc_971E
; ---------------------------------------------------------------------------

loc_971C:				; CODE XREF: sub_96F6+1Ej
		bsr	sub_96EC
; End of function sub_96F6

; START	OF FUNCTION CHUNK FOR sub_96C2

loc_971E:				; CODE XREF: sub_96C2+24j sub_96C2+28j ...
		clra
		sta	<byte_AF

loc_9721:				; CODE XREF: sub_96C2+97j
		ldy	#$2C85
		leay	a,y
		lda	,y
		sta	<byte_B1
		cmpa	#$13
		bcs	loc_9731
		lda	#$12

loc_9731:				; CODE XREF: sub_96C2+6Bj
		ldb	#$C
		mul
		ldy	#$9945
		leay	d,y
		ldb	#6

loc_973C:				; CODE XREF: sub_96C2+7Fj
		lda	,y++
		sta	,x+
		decb
		bne	loc_973C
		leax	-6,x
		leay	-$C,y
		ldb	<byte_B1
		aslb
		sty	<byte_B1
		ldy	#$98EF
		jsr	[b,y]
		inc	<byte_AF
		lda	<byte_AF
		cmpa	<byte_B0
		bcs	loc_9721
		jmp	loc_F1E9
; END OF FUNCTION CHUNK	FOR sub_96C2

; =============== S U B	R O U T	I N E =======================================


envModulesProcess:
		ldx	word_22F1
		ldb	2,x		; b=*(x+2)
		ldx	#$2600
		jsr	_SysExAMPL
		ldx	#$2600
		ldu	#$2C00
		jsr	envProcessUnkAmpl1
		lbeq	loc_9853
		ldx	#$2600
		lda	,x+
		cmpa	#$31 ; '1'
		bne	loc_9783
		lda	#$81 ; 'Å'
		bra	loc_978B
; ---------------------------------------------------------------------------

loc_9783:				; CODE XREF: envModulesProcess+1Fj
		cmpa	#2
		lbne	specialenvelope
		lda	#1

loc_978B:				; CODE XREF: envModulesProcess+23j
		sta	<byte_83
		lda	,x+
		cmpa	#$32 ; '2'
		bne	loc_9797
		ldb	#$C8 ; '»'
		bra	loc_97A5
; ---------------------------------------------------------------------------

loc_9797:				; CODE XREF: envModulesProcess+33j
		jsr	envProcessUnknown2
		bne	specialenvelope
		cmpb	#7
		lbcc	specialenvelope
		incb
		orab	#$40 ; '@'

loc_97A5:				; CODE XREF: envModulesProcess+37j
		stb	<byte_84
		lda	#7
		bra	loc_97F2
; ---------------------------------------------------------------------------
		ldx	word_22F1
		ldb	3,x
		ldx	#$2600
		jsr	_SysExFREQ
		ldx	#$2600
		ldu	#$2C00
		jsr	envProcessUnkFreq1
		lbeq	loc_9853
		ldx	#$2600
		lda	,x+
		cmpa	#$2A ; '*'
		bne	loc_97D0
		lda	#$81 ; 'Å'
		bra	loc_97D6
; ---------------------------------------------------------------------------

loc_97D0:				; CODE XREF: envModulesProcess+6Cj
		cmpa	#2
		bne	specialenvelope
		lda	#1

loc_97D6:				; CODE XREF: envModulesProcess+70j
		sta	<byte_83
		lda	,x+
		cmpa	#$FF
		bne	loc_97E2
		ldb	#$C6 ; '∆'
		bra	loc_97EE
; ---------------------------------------------------------------------------

loc_97E2:				; CODE XREF: envModulesProcess+7Ej
		jsr	envProcessUnknown2
		bne	specialenvelope
		cmpb	#5
		bcc	specialenvelope
		incb
		orab	#$40 ; '@'

loc_97EE:				; CODE XREF: envModulesProcess+82j
		stb	<byte_84
		lda	#5

loc_97F2:				; CODE XREF: envModulesProcess+4Bj
		clrb
		stb	<byte_82
		std	<byte_AF
		ldu	#$2C00

loc_97FA:				; CODE XREF: envModulesProcess+F3j
		ldy	#tableEnvStuff

loc_97FE:				; CODE XREF: envModulesProcess+B5j
		ldb	#1

loc_9800:				; CODE XREF: envModulesProcess+D3j
		lda	b,y
		coma
		lsrb
		anda	b,x
		aslb
		cmpa	b,y
		beq	loc_982D
		inc	<byte_B0
		leay	12,y		; y += 12
		cmpy	#tableEnvUnkEnd
		bcs	loc_97FE

specialenvelope:			; CODE XREF: envModulesProcess+27j
					; envModulesProcess+3Cj ...
		clra
		sta	<byte_82
		sta	<byte_83
		sta	<byte_84
		lda	#2
		sta	word_2CE1
		clr	byte_2CC3
		ldx	#strSpecialEnvelope
		ldu	#$1F99
		jmp	strcpy		; x=src, u=dst
; ---------------------------------------------------------------------------

loc_982D:				; CODE XREF: envModulesProcess+ABj
		addb	#3
		cmpb	#$C
		bcs	loc_9800
		sty	<byte_B1
		ldy	#tableEnvFuncsFreq ; table of envelope func ptrs
		ldb	<byte_B0
		aslb
		jsr	[b,y]
		ldb	<byte_B0
		ldy	#$2C85
		lda	<byte_82
		stb	a,y
		clr	<byte_B0
		inc	<byte_82
		lda	<byte_82
		cmpa	<byte_AF
		bcs	loc_97FA

loc_9853:				; CODE XREF: envModulesProcess+14j
					; envModulesProcess+61j
		lda	<byte_84
		bpl	loc_9869
		anda	#$3F ; '?'
		deca
		ldx	#$2C85
		leax	a,x
		deca

loc_9860:				; CODE XREF: envModulesProcess+109j
		ldb	,-x
		bne	loc_9869
		dec	<byte_84
		deca
		bne	loc_9860

loc_9869:				; CODE XREF: envModulesProcess+F7j
					; envModulesProcess+104j
		lda	<byte_83
		sta	<byte_82
		jmp	envModulesDisplay
; End of function envModulesProcess


; =============== S U B	R O U T	I N E =======================================


envProcessUnknown2:			; CODE XREF: envModulesProcess:loc_9797P
					; envModulesProcess:loc_97E2P
		clrb
		suba	#2
		bls	locret_987A

loc_9875:				; CODE XREF: envProcessUnknown2+8j
		incb
		suba	#6
		bhi	loc_9875

locret_987A:				; CODE XREF: envProcessUnknown2+3j
		rts
; End of function envProcessUnknown2

; ---------------------------------------------------------------------------
strNoAttackPhases:envstring10 <$10, "NO ATTACK PHASES">
strNoReleasePhases:envstring10 <$10, "NO RELEASE PHASE">
		envstring10 <$10, "  = OFF         ">
strSpecialEnvelope:envstring10 <$10, "SPECIAL ENVELOPE"> ; DATA XREF: envModulesProcess+C6o
tableEnvStrings:fdb strEnvNOP,strEnvLinUp ; DATA XREF: envModulesDisplay+49o
		fdb strEnvExpUp,strEnvDynLinUp
		fdb strEnvDynExpUp,strEnvLinDown
		fdb strEnvExpDown,strEnvDynLinDown
		fdb strEnvDynExpDown,strConstAbs
		fdb strEnvConstRel,strEnvStepAbs
		fdb strEnvStepRel,strDynRemain
		fdb strEnvKeyWeight,strEnvVibrato1
		fdb strEnvVibrato2,strEnvNoise
		fdb strEnvRepeat1,strEnvRepeat2
		fdb strEnvRepeat3,strEnvRepeat4
		fdb strEnvRepeat5,strEnvRepeat6
tableEnvFuncsAmpl:fdb fnEnvNOP,fnEnvUpDownA ; x	+= 6 (module size = 6)
		fdb fnEnvUpDownA,fnEnvUpDownA ;
		fdb fnEnvUpDownA,fnEnvUpDownA ;	x = envelope data?
		fdb fnEnvUpDownA,fnEnvUpDownA ;	u = time?
		fdb fnEnvUpDownA,fnEnvConst ; y	= envelope value???
		fdb fnEnvConst,fnEnvStep
		fdb fnEnvStep,fnEnvDynRemain
		fdb fnEnvKeyWeight,fnEnvVibrato1
		fdb fnEnvVibrato2,fnEnvNoise
		fdb fnEnvRepeat,fnEnvRepeat
		fdb fnEnvRepeat,fnEnvRepeat
		fdb fnEnvRepeat,fnEnvRepeat
tableEnvFuncsFreq:fdb fnEnvNOP,fnEnvUpDownB ; DATA XREF: envModulesProcess+D8o
		fdb fnEnvUpDownB,fnEnvUpDownB ;	x += 6 (module size = 6)
		fdb fnEnvUpDownB,fnEnvUpDownB ;
		fdb fnEnvUpDownB,fnEnvUpDownB ;	x = envelope data?
		fdb fnEnvUpDownB,fnEnvConstB ; u = time?
		fdb fnEnvConstB,fnEnvStepB ; y = envelope value???
		fdb fnEnvStepB,fnEnvConstB
		fdb fnEnvKeyWeightB,fnEnvVibrato1B
		fdb fnEnvVibrato2B,fnEnvNoiseB
		fdb fnEnvRepeatB
tableEnvStuff:	EnvTableType <	   0,	   0,	   0,	   0,	   0,	   0,	   0>
					; DATA XREF: envModulesProcess:loc_97FAo
		EnvTableType <	   3,	 $F0,	 $FF,  $6800,	$DF0,	 $FF,  $C03F>
		EnvTableType <	   2,	 $F0,	 $FF,  $E000,	$DF0,	 $FF,  $C03F>
		EnvTableType <	 $BC,	   0,	 $FF,  $6800,	$DF0,	 $FF,  $C03F>
		EnvTableType <	 $BC,	   0,	 $FF,  $E400,	$DF0,	 $FF,  $C03F>
		EnvTableType <	   3,	 $F0,	 $FF,  $8800,	$9F0,	 $FF,  $C03F>
		EnvTableType <	   2,	 $F0,	 $FF,  $F000,	$9F0,	 $FF,  $C03F>
		EnvTableType <	 $BC,	   0,	 $FF,  $8800,	$9F0,	 $FF,  $C03F>
		EnvTableType <	 $BC,	   0,	 $FF,  $F400,	$9F0,	 $FF,  $C03F>
		EnvTableType <	   1,	 $F0,	 $FF,	   0,	 $FF,	   0,	   0>
		EnvTableType <	   5,	 $F0,	 $FF,	   0,	 $FF,	   0,	   0>
		EnvTableType <	   1,	 $F0,	 $FF,	$1F0,	 $FF,	   0,	   0>
		EnvTableType <	   5,	 $F0,	 $FF,	$5F0,	 $FF,	   0,	   0>
		EnvTableType <	 $BC,	   0,	 $FF,	   0,	 $FF,	$C00,	 $3F>
		EnvTableType <	 $60,	   0,  $DC00,  $BC00,	 $FF,  $6800,  $6000>
		EnvTableType <	   0,	   0,	   0,  $8000,	 $FF,	 $FF,	 $FF>
		EnvTableType <	   0,	   0,	   0,  $9000,	 $FF,	 $FF,	 $FF>
		EnvTableType <	   0,	   0,	   0,  $1000,	   0,	 $FF,	 $FF>
		EnvTableType <	   2,	 $F0,	 $FF,	   0,	 $FF,  $1800,	 $3F>
tableEnvUnkEnd:	fcb $CC	; Ã		; CODE XREF: sub_96C2:loc_96CFJ
					; DATA XREF: envModulesProcess+B1o
		fcb   2
		fcb $1B
		fcb $20
		fcb   3
; ---------------------------------------------------------------------------

loc_9A2E:				; CODE XREF: sub_96F6:loc_9703J
		ldd	#$2FF
		std	,x++
		lda	#$A0 ; '†'
		sta	,x+
		clra
		clrb
		std	<byte_B1
		lda	#6
		sta	<byte_AF

loc_9A3F:				; CODE XREF: ROM:9A91j
		ldb	,u++
		lsrb

loc_9A42:				; CODE XREF: ROM:9A55j
		clra
		stb	2,x
		bne	loc_9A57
		leax	3,x
		ldd	,u++
		cmpd	<byte_B1
		beq	loc_9A8F
		leax	-3,x
		leau	-2,u
		incb
		bra	loc_9A42
; ---------------------------------------------------------------------------

loc_9A57:				; CODE XREF: ROM:9A45j
		std	<byte_6E
		sta	<byte_B0
		std	<byte_74
		ldd	,u++
		subd	<byte_B1
		bcc	loc_9A69
		nega
		negb
		sbca	#0
		com	<byte_B0

loc_9A69:				; CODE XREF: ROM:9A61j
		std	<byte_72
		jsr	sub_F2F6
		ldd	<byte_76
		std	<byte_70
		tst	<byte_B0
		bpl	loc_9A7A
		nega
		negb
		sbca	#0

loc_9A7A:				; CODE XREF: ROM:9A74j
		std	,x++
		leax	1,x
		jsr	envProcessUnkInt1
		ldd	<byte_B1
		tst	<byte_B0
		bpl	loc_9A8B
		subd	<byte_70
		bra	loc_9A8D
; ---------------------------------------------------------------------------

loc_9A8B:				; CODE XREF: ROM:9A85j
		addd	<byte_70

loc_9A8D:				; CODE XREF: ROM:9A89j
		std	<byte_B1

loc_9A8F:				; CODE XREF: ROM:9A4Ej
		dec	<byte_AF
		bne	loc_9A3F
		ldd	-2,u
		std	,x++
		lda	$FFEA,x
		bmi	loc_9AB4
		lda	#$80 ; 'Ä'
		sta	,x+
		jsr	sub_9D19
		lda	,u++
		coma
		sta	,x+
		lda	#$B4 ; '¥'
		ldb	,u
		std	,x++
		ldd	#$701B
		std	,x
		rts
; ---------------------------------------------------------------------------

loc_9AB4:				; CODE XREF: ROM:9A9Aj
		lda	#$90 ; 'ê'
		sta	,x+
		ldd	4,u
		std	1,x
		jsr	sub_9D69
		jmp	loc_F1E9

; =============== S U B	R O U T	I N E =======================================


envProcessUnkAmpl1:			; CODE XREF: envModulesProcess+11P
		ldd	,x++
		cmpd	#539
		bra	loc_9AD0
; ---------------------------------------------------------------------------

envProcessUnkFreq1:			; CODE XREF: envModulesProcess+5EP
		ldd	,x++
		cmpd	#767

loc_9AD0:				; CODE XREF: envProcessUnkAmpl1+6j
		bne	locret_9B1C
		lda	,x+
		cmpa	#$A0 ; '†'
		bne	locret_9B1C
		lda	#6
		sta	<byte_AF
		clra
		clrb			; a,b =	0
					; (d = (a<<8)|b)

loc_9ADE:				; CODE XREF: envProcessUnkAmpl1+3Cj
		std	<byte_B1	; *0xB1	= (u16)d
		ldd	,x++		; +=2
		std	<byte_6E	; *0x6E	= (u16)d
		ldb	,x+		; +=1
		clra
		std	<byte_70
		aslb
		stb	,u+
		sta	,u+
		jsr	envProcessUnkInt1
		ldd	<byte_70
		addd	#8
		andb	#$F0 ; ''
		addd	<byte_B1
		std	,u++
		dec	<byte_AF
		bne	loc_9ADE	; *0xB1	= (u16)d
		leax	3,x
		lda	$FFE9,x
		bmi	loc_9B1D	; branch if minus
		jsr	envProcessUnkInt2
		lda	,x+
		coma
		clrb
		std	,u++
		lda	1,x
		clrb
		std	,u

loc_9B15:				; CODE XREF: envProcessUnkAmpl1+62j
		clra
		sta	<byte_83
		sta	<byte_84
		orcc	#4

locret_9B1C:				; CODE XREF: envProcessUnkAmpl1:loc_9AD0j
					; envProcessUnkAmpl1+14j
		rts
; ---------------------------------------------------------------------------

loc_9B1D:				; CODE XREF: envProcessUnkAmpl1+43j
		jsr	envProcessUnkInt3
		ldd	-2,x
		std	,u
		bra	loc_9B15
; End of function envProcessUnkAmpl1

; ---------------------------------------------------------------------------
strStandardEnvelope:envstring10	<$10, "STANDARD ENVELOP"> ; DATA XREF: envModulesDisplay+38o
strEnvNOP:	envstring10 <$10, "  = NOP         "> ; DATA XREF: ROM:tableEnvStringso

; =============== S U B	R O U T	I N E =======================================

; x += 6 (module size =	6)
;
; x = envelope data?
; u = time?
; y = envelope value???

fnEnvNOP:				; DATA XREF: ROM:tableEnvFuncsAmplo
					; ROM:tableEnvFuncsFreqo
		leax	6,x
		leau	4,u		; u += 4
		rts
; End of function fnEnvNOP


; =============== S U B	R O U T	I N E =======================================

; start	chain of subroutine calls

envF1_:					; CODE XREF: fnEnvStep+3P
		bsr	*+2
; End of function envF1_


; =============== S U B	R O U T	I N E =======================================


envF1:					; CODE XREF: envF1_p fnEnvUpDownA+7p ...
		lda	1,u
		anda	1,y
		oraa	,y		; a = (([u+1]) & ([y+1])) | [y]
		ldb	,u++		; b = [u]; u +=	2;
		std	,x++		; [x] =	((a<<8)|b); x += 2;

envFReturn:				; CODE XREF: envF2+8j envF3+9j ...
		leay	4,y		; y += 4
		rts
; End of function envF1


; =============== S U B	R O U T	I N E =======================================


envF2_:					; CODE XREF: fnEnvStepB+3P
		bsr	*+2
; End of function envF2_


; =============== S U B	R O U T	I N E =======================================


envF2:					; CODE XREF: envF2_p ROM:9BA5p ...
		ldb	,x+
		andb	1,y		; b = [x++] & [y+1]
		lda	,x+		; a = [x++]
		std	,u++		; [u] =	((a<<8)|b); u += 2;
		bra	envFReturn	; y += 4
; End of function envF2


; =============== S U B	R O U T	I N E =======================================


envF3_:					; CODE XREF: fnEnvRepeat+AP
		bsr	*+2
; End of function envF3_


; =============== S U B	R O U T	I N E =======================================


envF3:					; CODE XREF: envF3_p fnEnvConst+AP
		lda	,u++
		lsra			; a = [u]/2; u += 2;
		adca	#0		; add carry in a
		leax	1,x		; ++x
		sta	,x+		; [x++]	= a
		bra	envFReturn	; y += 4
; End of function envF3


; =============== S U B	R O U T	I N E =======================================


envF4_:					; CODE XREF: fnEnvRepeatB+3P
		bsr	*+2
; End of function envF4_


; =============== S U B	R O U T	I N E =======================================


envF4:					; CODE XREF: envF4_p fnEnvConstB+AP
		clrb
		leax	1,x		; ++x
		lda	,x+
		asla			; a = ([x++])*2
		sbca	#0		; subtract carry in a
		std	,u++		; [u++]	= d
		bra	envFReturn	; y += 4
; End of function envF4


; =============== S U B	R O U T	I N E =======================================

; y=[0xB1]

fnEnvUpDownA:				; DATA XREF: ROM:tableEnvFuncsAmplo
		ldy	<byte_B1
		com	,u		; [u] =	~[u]
		com	1,u		; [u+1]	= ~[u+1]
		bsr	envF1
		com	-1,u		; [u-1]	= ~[u-1]
		com	-2,u		; [u-2]	= ~[u-2]
		leay	2,y		; y += 2
		leax	1,x		; x++
		bsr	envF1
		tfr	x, d		; d = x
		subd	<byte_68
		subd	#3
		orab	,y
		stb	,x+
		rts
; End of function fnEnvUpDownA

; ---------------------------------------------------------------------------

fnEnvUpDownB:				; DATA XREF: ROM:tableEnvFuncsFreqo
		ldy	<byte_B1	; y=[0xB1]
		bsr	envF2
		com	-1,u
		com	-2,u
		leay	2,y
		leax	1,x
		bsr	envF2
		leax	1,x
		rts
; ---------------------------------------------------------------------------
strEnvLinUp:	envstring10 <$10, "  = LINEAR UP   "> ; DATA XREF: ROM:tableEnvStringso
strEnvExpUp:	envstring11 <$11, "  = EXPON. UP    "> ; DATA XREF: ROM:tableEnvStringso
strEnvDynLinUp:	envstring12 <$12, "  = DYN. LIN. UP  "> ; DATA XREF: ROM:tableEnvStringso
strEnvDynExpUp:	envstring12 <$12, "  = DYN. EXP. UP  "> ; DATA XREF: ROM:tableEnvStringso
strEnvLinDown:	envstring10 <$10, "  = LINEAR DOWN "> ; DATA XREF: ROM:tableEnvStringso
strEnvExpDown:	envstring11 <$11, "  = EXPON. DOWN  "> ; DATA XREF: ROM:tableEnvStringso
strEnvDynLinDown:envstring12 <$12, "  = DYN. LIN. DOWN"> ; DATA XREF: ROM:tableEnvStringso
strEnvDynExpDown:envstring12 <$12, "  = DYN. EXP. DOWN"> ; DATA XREF: ROM:tableEnvStringso

; =============== S U B	R O U T	I N E =======================================

; y=[0xB1]

fnEnvStep:				; DATA XREF: ROM:tableEnvFuncsAmplo
		ldy	<byte_B1
		jsr	envF1_		; start	chain of subroutine calls
; End of function fnEnvStep

; START	OF FUNCTION CHUNK FOR fnEnvConst

envReturnAdd2x:				; CODE XREF: fnEnvConst+Fj
					; fnEnvStepB+6j ...
		leax	2,x		; x += 2
		rts
; END OF FUNCTION CHUNK	FOR fnEnvConst

; =============== S U B	R O U T	I N E =======================================


fnEnvConst:				; CODE XREF: fnEnvDynRemainp
					; DATA XREF: ROM:tableEnvFuncsAmplo

arg_0		=  2

; FUNCTION CHUNK AT 9C4C SIZE 00000003 BYTES

		ldy	<byte_B1
		leau	2,u		; u += 2
		jsr	envF1
		leau	-4,u		; u -= 4
		jsr	envF3
		leau	2,u		; u += 2
		bra	envReturnAdd2x	; x += 2
; End of function fnEnvConst


; =============== S U B	R O U T	I N E =======================================


fnEnvStepB:				; DATA XREF: ROM:tableEnvFuncsFreqo
		ldy	<byte_B1
		jsr	envF2_
		bra	envReturnAdd2x	; x += 2
; End of function fnEnvStepB


; =============== S U B	R O U T	I N E =======================================


fnEnvConstB:				; DATA XREF: ROM:tableEnvFuncsFreqo
		ldy	<byte_B1
		leau	2,u
		jsr	envF2
		leau	-4,u
		jsr	envF4
		leau	2,u
		bra	envReturnAdd2x	; x += 2
; End of function fnEnvConstB

; ---------------------------------------------------------------------------
strConstAbs:	envstring12 <$12, "  = CONST. ABSOL. "> ; DATA XREF: ROM:tableEnvStringso
strEnvConstRel:	envstring12 <$12, "  = CONST. RELAT. "> ; DATA XREF: ROM:tableEnvStringso
strEnvStepAbs:	envstring10 <$10, "  = STEP ABSOLUT"> ; DATA XREF: ROM:tableEnvStringso
strEnvStepRel:	envstring10 <$10, "  = STEP RELATIV"> ; DATA XREF: ROM:tableEnvStringso

; =============== S U B	R O U T	I N E =======================================


fnEnvDynRemain:				; DATA XREF: ROM:tableEnvFuncsAmplo
		bsr	fnEnvConst
		lda	-3,x
		bne	loc_9CC9
		inc	-3,x

loc_9CC9:				; CODE XREF: fnEnvDynRemain+4j
		tfr	x, d
		subd	<byte_68
		subd	#4
		stb	-1,x
		rts
; End of function fnEnvDynRemain

; ---------------------------------------------------------------------------
strDynRemain:	envstring11 <$11, "  = DYN. REMAIN  "> ; DATA XREF: ROM:tableEnvStringso

; =============== S U B	R O U T	I N E =======================================


fnEnvKeyWeight:				; DATA XREF: ROM:tableEnvFuncsAmplo
		lda	,u++
		ldb	,u++
		mul
		adca	#0
		sta	3,x
		leax	6,x
		rts
; End of function fnEnvKeyWeight


; =============== S U B	R O U T	I N E =======================================


fnEnvKeyWeightB:			; DATA XREF: ROM:tableEnvFuncsFreqo
		clrb
		lda	3,x
		std	,u++
		lda	#1
		std	,u++
		leax	6,x
		rts
; End of function fnEnvKeyWeightB

; ---------------------------------------------------------------------------
strEnvKeyWeight:envstring10 <$10, "  = KEY WEIGHT  "> ; DATA XREF: ROM:tableEnvStringso

; =============== S U B	R O U T	I N E =======================================


fnEnvVibrato1:				; DATA XREF: ROM:tableEnvFuncsAmplo
		leax	3,x
		bsr	sub_9D19
		lda	word_2C1E
		coma
		sta	,x+
		rts
; End of function fnEnvVibrato1


; =============== S U B	R O U T	I N E =======================================


sub_9D19:				; CODE XREF: ROM:9AA0P
					; fnEnvVibrato1+2p
		ldd	,u++
		std	<byte_72
		ldb	,u++
		stb	1,x
		lda	#1
		std	<byte_74
		jsr	sub_F2F6
		lda	<byte_77
		adca	#0
		sta	,x++
		rts
; End of function sub_9D19


; =============== S U B	R O U T	I N E =======================================


fnEnvVibrato1B:				; DATA XREF: ROM:tableEnvFuncsFreqo
		leax	3,x
		bsr	envProcessUnkInt2
		lda	,x+
		coma
		clrb
		std	word_2C1E
		rts
; End of function fnEnvVibrato1B


; =============== S U B	R O U T	I N E =======================================


envProcessUnkInt2:			; CODE XREF: envProcessUnkAmpl1+45P
					; fnEnvVibrato1B+2p
		lda	1,x
		clrb
		std	2,u
		ldb	,x
		mul
		adda	,x
		addd	#8
		andb	#$F0 ; ''
		std	,u
		leau	4,u
		leax	2,x
		rts
; End of function envProcessUnkInt2

; ---------------------------------------------------------------------------
strEnvVibrato1:	envstring10 <$10, "  = VIBRATO 1   "> ; DATA XREF: ROM:tableEnvStringso

; =============== S U B	R O U T	I N E =======================================


fnEnvVibrato2:				; DATA XREF: ROM:tableEnvFuncsAmplo
		leax	3,x
		ldd	word_2C1E
		std	1,x
; End of function fnEnvVibrato2


; =============== S U B	R O U T	I N E =======================================


sub_9D69:				; CODE XREF: ROM:9ABCP
		ldb	,u++
		clra
		std	<byte_74
		stb	,x+
		ldd	,x
		bsr	sub_9D76
		ldd	,u++
; End of function sub_9D69


; =============== S U B	R O U T	I N E =======================================


sub_9D76:				; CODE XREF: sub_9D69+9p
		std	<byte_72
		jsr	sub_F2F6
		ldd	<byte_76
		cmpd	#$100
		bcs	loc_9D85
		ldb	#$FF

loc_9D85:				; CODE XREF: sub_9D76+Bj
		stb	,x+
		rts
; End of function sub_9D76


; =============== S U B	R O U T	I N E =======================================


fnEnvVibrato2B:				; DATA XREF: ROM:tableEnvFuncsFreqo
		leax	3,x
		bsr	envProcessUnkInt3
		ldd	-2,x
		std	word_2C1E
		rts
; End of function fnEnvVibrato2B


; =============== S U B	R O U T	I N E =======================================


envProcessUnkInt3:			; CODE XREF: envProcessUnkAmpl1:loc_9B1DP
					; fnEnvVibrato2B+2p
		lda	,x+
		clrb
		std	,u++
		sta	<byte_74
		ldb	1,x
		bsr	sub_9DA8
		std	,u++
		lda	,x
		bsr	sub_9DA6
		std	,x++
		rts
; End of function envProcessUnkInt3


; =============== S U B	R O U T	I N E =======================================


sub_9DA6:				; CODE XREF: envProcessUnkInt3+Fp
		ldb	<byte_74
; End of function sub_9DA6


; =============== S U B	R O U T	I N E =======================================


sub_9DA8:				; CODE XREF: envProcessUnkInt3+9p
		mul
		addd	#8
		andb	#$F0 ; ''
		rts
; End of function sub_9DA8

; ---------------------------------------------------------------------------
strEnvVibrato2:	envstring10 <$10, "  = VIBRATO 2   "> ; DATA XREF: ROM:tableEnvStringso

; =============== S U B	R O U T	I N E =======================================


fnEnvNoise:				; DATA XREF: ROM:tableEnvFuncsAmplo
		leax	4,x
		lda	,u++
		lsra
		adca	#0
		sta	1,x
		lda	,u++
		sta	,x++
		rts
; End of function fnEnvNoise


; =============== S U B	R O U T	I N E =======================================


fnEnvNoiseB:				; DATA XREF: ROM:tableEnvFuncsFreqo
		leax	4,x
		lda	1,x
		asla
		sbca	#0
		clrb
		std	,u++
		lda	,x++
		std	,u++
		rts
; End of function fnEnvNoiseB

; ---------------------------------------------------------------------------
strEnvNoise:	envstring11 <$11, "  = NOISE MODUL. "> ; DATA XREF: ROM:tableEnvStringso

; =============== S U B	R O U T	I N E =======================================


fnEnvRepeat:				; DATA XREF: ROM:tableEnvFuncsAmplo
		subb	#$24 ; '$'
		lda	#3
		mul
		pshs	b
		ldy	<byte_B1
		jsr	envF3_
		tfr	x, d
		subd	<byte_68
		subb	#$A
		subb	,s+
		andb	3,y
		orab	2,y
		stb	1,x
		leax	2,x
		rts
; End of function fnEnvRepeat


; =============== S U B	R O U T	I N E =======================================


fnEnvRepeatB:				; DATA XREF: ROM:tableEnvFuncsFreqo
		ldy	<byte_B1
		jsr	envF4_
		leax	1,x
		ldb	,x+
		andb	3,y
		clra
		pshs	a,b
		tfr	x, d
		subd	#$2600
		subd	#$C
		subd	,s++
		std	<byte_72
		ldb	#6
		std	<byte_74
		jsr	sub_F2F6
		lda	<byte_77
		adda	<byte_B0
		cmpa	#$18
		bcc	locret_9E39
		sta	<byte_B0

locret_9E39:				; CODE XREF: fnEnvRepeatB+28j
		rts
; End of function fnEnvRepeatB

; ---------------------------------------------------------------------------
strEnvRepeat1:	envstring10 <$10, "  = REPEAT -1 PH"> ; DATA XREF: ROM:tableEnvStringso
strEnvRepeat2:	envstring10 <$10, "  = REPEAT -2 PH"> ; DATA XREF: ROM:tableEnvStringso
strEnvRepeat3:	envstring10 <$10, "  = REPEAT -3 PH"> ; DATA XREF: ROM:tableEnvStringso
strEnvRepeat4:	envstring10 <$10, "  = REPEAT -4 PH"> ; DATA XREF: ROM:tableEnvStringso
strEnvRepeat5:	envstring10 <$10, "  = REPEAT -5 PH"> ; DATA XREF: ROM:tableEnvStringso
strEnvRepeat6:	envstring10 <$10, "  = REPEAT -6 PH"> ; DATA XREF: ROM:tableEnvStringso

; =============== S U B	R O U T	I N E =======================================


env_Repeat:
		ldx	<byte_B9
		ldx	<byte_CA
		ldx	<byte_F4
		ldx	<byte_F9
		stx	<byte_4E
		stx	<byte_52
		stx	<byte_86
		stx	<byte_F8
; End of function env_Repeat


; =============== S U B	R O U T	I N E =======================================


sub_9EB0:				; CODE XREF: ROM:9ECAp	ROM:loc_9F54P ...
		ldb	<unk_80
		bitb	#$40 ; '@'
		beq	locret_9EB8
		andb	#$3F ; '?'

locret_9EB8:				; CODE XREF: sub_9EB0+4j ROM:9EBBj ...
		rts
; End of function sub_9EB0

; ---------------------------------------------------------------------------
		lda	<byte_82
		beq	locret_9EB8
		ldb	<byte_83
		anda	#$40 ; '@'
		bne	loc_9EC5
		ldb	<byte_84

loc_9EC5:				; CODE XREF: ROM:9EC1j
		stb	<byte_82
		jmp	envModulesDisplay
; ---------------------------------------------------------------------------
		bsr	sub_9EB0
		beq	locret_9EB8
		lda	<byte_82
		beq	loc_9EDC
		clra
		sta	<byte_83
		sta	<byte_84
		sta	<byte_82
		jmp	envModulesDisplay
; ---------------------------------------------------------------------------

loc_9EDC:				; CODE XREF: ROM:9ED0j
		ldb	#$81 ; 'Å'
		stb	<byte_83
		stb	<byte_82
		orab	#$40 ; '@'
		stb	<byte_84
		lda	#7
		ldx	#$2C85
		clrb

loc_9EEC:				; CODE XREF: ROM:9EEFj
		stb	,x+
		deca
		bne	loc_9EEC
		jmp	envModulesDisplay
; ---------------------------------------------------------------------------
		ldd	#$FFFF
		bra	loc_9EFC
; ---------------------------------------------------------------------------
		ldd	#$101

loc_9EFC:				; CODE XREF: ROM:9EF7j
		addb	<byte_82
		andb	#$3F ; '?'
		beq	locret_9F4D
		cmpb	<byte_8C
		bhi	locret_9F4D
		ldb	<byte_83
		beq	locret_9F4D
		adda	<byte_82
		bmi	loc_9F28
		bita	#$40 ; '@'
		bne	loc_9F1E
		pshs	a
		ldb	<byte_84
		andb	#$3F ; '?'
		cmpb	,s+
		bhi	loc_9F48
		bra	loc_9F46
; ---------------------------------------------------------------------------

loc_9F1E:				; CODE XREF: ROM:9F10j
		pshs	a
		ldb	<byte_84
		cmpb	,s+
		bls	loc_9F48
		bra	locret_9F4D
; ---------------------------------------------------------------------------

loc_9F28:				; CODE XREF: ROM:9F0Cj
		anda	#$7F ; ''
		bita	#$40 ; '@'
		bne	loc_9F3A
		pshs	a
		ldb	<byte_84
		andb	#$3F ; '?'
		cmpb	,s+
		bhi	loc_9F48
		bra	locret_9F4D
; ---------------------------------------------------------------------------

loc_9F3A:				; CODE XREF: ROM:9F2Cj
		ldb	<byte_84
		pshs	a
		andb	#$7F ; ''
		cmpb	,s+
		bls	loc_9F48
		bra	locret_9F4D
; ---------------------------------------------------------------------------

loc_9F46:				; CODE XREF: ROM:9F1Cj
		oraa	#$80 ; 'Ä'

loc_9F48:				; CODE XREF: ROM:9F1Aj	ROM:9F24j ...
		sta	<byte_82
		jmp	envModulesDisplay
; ---------------------------------------------------------------------------

locret_9F4D:				; CODE XREF: ROM:9F00j	ROM:9F04j ...
		rts
; ---------------------------------------------------------------------------
		lda	#$FF
		bra	loc_9F54
; ---------------------------------------------------------------------------
		fcb $86	; Ü
		fcb   1
; ---------------------------------------------------------------------------

loc_9F54:				; CODE XREF: ROM:9F50j
		jsr	sub_9EB0
		beq	locret_9F4D
		ldb	<byte_82
		bmi	locret_9F4D
		bitb	#$40 ; '@'
		beq	loc_9F65
		subb	<byte_84
		bra	loc_9F67
; ---------------------------------------------------------------------------

loc_9F65:				; CODE XREF: ROM:9F5Fj
		subb	<byte_83

loc_9F67:				; CODE XREF: ROM:9F63j
		addb	#$11
		pshs	b
		ldb	<byte_82
		andb	#$3F ; '?'
		ldx	#$2C84
		leax	b,x
		adda	,x
		bpl	loc_9F7C
		puls	a
		bra	loc_9F81
; ---------------------------------------------------------------------------

loc_9F7C:				; CODE XREF: ROM:9F76j
		cmpa	,s+
		bls	loc_9F81
		clra

loc_9F81:				; CODE XREF: ROM:9F7Aj	ROM:9F7Ej
		sta	,x
		jmp	envModulesDisplay
; ---------------------------------------------------------------------------
		jsr	sub_9EB0
		beq	locret_9FF7
		lda	<byte_82
		bmi	locret_9FF7
		ldx	#$2C84
		anda	#$3F ; '?'
		pshs	a
		leax	a,x
		cmpa	<byte_8C
		bcs	loc_9FA0
		clr	,x
		bra	loc_9FC1
; ---------------------------------------------------------------------------

loc_9FA0:				; CODE XREF: ROM:9F9Aj	ROM:9FACj
		ldb	1,x
		cmpb	#$12
		bcs	loc_9FA7
		decb

loc_9FA7:				; CODE XREF: ROM:9FA4j
		stb	,x+
		cmpx	#$2C8B
		bcs	loc_9FA0
		clrb
		stb	,x
		asla
		asla
		ldx	#$2BFC
		leax	a,x

loc_9FB8:				; CODE XREF: ROM:9FBFj
		ldd	4,x
		std	,x++
		cmpx	#$2C1E
		bcs	loc_9FB8

loc_9FC1:				; CODE XREF: ROM:9F9Ej
		lda	<byte_84
		anda	#$3F ; '?'
		ldb	,s
		cmpa	,s+
		bhi	loc_9FDF
		ldx	#$2C84

loc_9FCE:				; CODE XREF: ROM:9FD5j
		ldb	a,x
		bne	loc_9FF4
		inca
		cmpa	<byte_8C
		bls	loc_9FCE
		ldb	<byte_84
		orab	#$80 ; 'Ä'
		stb	<byte_84
		bra	loc_9FF2
; ---------------------------------------------------------------------------

loc_9FDF:				; CODE XREF: ROM:9FC9j
		dec	<byte_84
		deca
		pshs	a
		cmpb	,s+
		bne	loc_9FF4
		cmpb	<byte_83
		bne	loc_9FF0
		orab	#$80 ; 'Ä'
		stb	<byte_83

loc_9FF0:				; CODE XREF: ROM:9FEAj
		orab	#$80 ; 'Ä'

loc_9FF2:				; CODE XREF: ROM:9FDDj
		stb	<byte_82

loc_9FF4:				; CODE XREF: ROM:9FD0j	ROM:9FE6j
		jmp	envModulesDisplay
; ---------------------------------------------------------------------------

locret_9FF7:				; CODE XREF: ROM:9F89j	ROM:9F8Dj ...
		rts
; ---------------------------------------------------------------------------
		jsr	sub_9EB0
		beq	locret_9FF7
		lda	<byte_82
		anda	#$3F ; '?'
		cmpa	<byte_8C
		bcc	locret_9FF7
		lda	<byte_8C
		ldx	#$2C84
		ldb	a,x
		bne	locret_9FF7
		lda	<byte_82
		bita	#$40 ; '@'
		bne	loc_A02E
		inc	<byte_84
		ldb	<byte_84
		andb	#$3F ; '?'
		cmpb	<byte_8C
		bls	loc_A024
		ldb	<byte_8C
		addb	#$C1 ; '¡'
		stb	<byte_84

loc_A024:				; CODE XREF: ROM:A01Cj
		anda	#$3F ; '?'
		ldb	<byte_83
		bpl	loc_A036
		sta	<byte_83
		bra	loc_A036
; ---------------------------------------------------------------------------

loc_A02E:				; CODE XREF: ROM:A012j
		anda	#$7F ; ''
		ldb	<byte_84
		bpl	loc_A036
		sta	<byte_84

loc_A036:				; CODE XREF: ROM:A028j	ROM:A02Cj ...
		sta	<byte_82
		anda	#$3F ; '?'
		leax	a,x
		clrb

loc_A03D:				; CODE XREF: ROM:A046j
		lda	,x
		stb	,x+
		tfr	a, b
		cmpx	#$2C8C
		bcs	loc_A03D
		lda	<byte_82
		anda	#$3F ; '?'
		asla
		asla
		ldx	#$2C00
		leax	a,x
		pshs	x
		ldx	#$2C20

loc_A058:				; CODE XREF: ROM:A05Ej
		ldd	-6,x
		std	,--x
		cmpx	,s
		bhi	loc_A058
		leas	2,s

; =============== S U B	R O U T	I N E =======================================


envModulesDisplay:			; CODE XREF: envModulesProcess+10FJ
					; ROM:9EC7J ...
		clrb
		stb	<unk_6B
		jsr	sub_9608
		lda	<byte_82
		beq	loc_A091
		lda	<byte_82
		bita	#$40 ; '@'
		beq	loc_A074
		ldb	#1

loc_A074:				; CODE XREF: envModulesDisplay+Ej
		stb	word_2CE1
		clrb
		stb	byte_2CC3
		tsta
		bpl	loc_A0A3
		ldx	#$988C
		cmpa	<byte_84
		beq	loc_A09D
		ldx	#$987B
		cmpa	<byte_83
		beq	loc_A09D
		ldx	#$989D
		bra	loc_A0B0
; ---------------------------------------------------------------------------

loc_A091:				; CODE XREF: envModulesDisplay+8j
		ldb	#2
		stb	word_2CE1
		clrb
		stb	byte_2CC3
		ldx	#strStandardEnvelope

loc_A09D:				; CODE XREF: envModulesDisplay+21j
					; envModulesDisplay+28j
		ldu	#$1F99
		jmp	strcpy		; x=src, u=dst
; ---------------------------------------------------------------------------

loc_A0A3:				; CODE XREF: envModulesDisplay+1Aj
		ldx	#$2C84
		anda	#$3F ; '?'
		lda	a,x
		asla
		ldx	#tableEnvStrings ; table of env	module ptrs
		ldx	a,x

loc_A0B0:				; CODE XREF: envModulesDisplay+2Dj
		ldu	#$1F99
		jsr	strcpy		; x=src, u=dst
		lda	<byte_82
		anda	#$3F ; '?'
		asla
		deca
		jsr	sub_F627
		std	unk_1F9A
		rts
; End of function envModulesDisplay


; =============== S U B	R O U T	I N E =======================================


sub_A0C3:				; CODE XREF: sub_A14F+12J sub_A180+2J	...
		pshs	a

loc_A0C5:				; CODE XREF: sub_A0C3+8j
		pulu	b,a
		std	,x++
		dec	,s
		bne	loc_A0C5
		puls	pc,a
; End of function sub_A0C3


; =============== S U B	R O U T	I N E =======================================


sub_A0CF:				; CODE XREF: sub_89E0+5EP _SysExICBP ...
		bitb	#$80 ; 'Ä'
		beq	loc_A0F3
		lda	unk_2CF6
		bmi	loc_A11A
; End of function sub_A0CF

; START	OF FUNCTION CHUNK FOR sub_A127

loc_A0D8:				; CODE XREF: sub_A127+4j
		ldy	#$A137
		lda	unk_128
		anda	#$30 ; '0'
		bne	loc_A0E9
		bitb	#$40 ; '@'
		bne	loc_A11A
		bra	loc_A0FD
; ---------------------------------------------------------------------------

loc_A0E9:				; CODE XREF: sub_A127-46j
		cmpa	#$20 ; ' '
		bne	loc_A11A
		bitb	#$40 ; '@'
		beq	loc_A11A
		bra	loc_A0FB
; ---------------------------------------------------------------------------

loc_A0F3:				; CODE XREF: sub_A0CF+2j sub_A127-2j ...
		ldy	#$A12D
		bitb	#$40 ; '@'
		beq	loc_A0FD

loc_A0FB:				; CODE XREF: sub_A127-36j
		leay	5,y

loc_A0FD:				; CODE XREF: sub_A127-40j sub_A127-2Ej
		andb	#$3F ; '?'
		pshs	cc,b
		ldd	,y++
		std	unk_2903
		orcc	#$50 ; 'P'
		lda	unk_2800
		anda	#$8F ; 'è'
		oraa	,y+
		sta	unk_100
		sta	unk_2800
		ldy	,y
		puls	pc,b,cc
; ---------------------------------------------------------------------------

loc_A11A:				; CODE XREF: sub_A0CF+7j sub_A127-42j	...
		ldd	#$4D2D
		ldu	#$4552
		jsr	loc_CCE2
		ldb	#1
		bra	loc_A0F3
; END OF FUNCTION CHUNK	FOR sub_A127

; =============== S U B	R O U T	I N E =======================================


sub_A127:				; CODE XREF: sub_B650+1FP

; FUNCTION CHUNK AT A0D8 SIZE 0000004F BYTES

		bitb	#$80 ; 'Ä'
		beq	loc_A0F3
		bra	loc_A0D8
; End of function sub_A127

; ---------------------------------------------------------------------------
		fcb $29
		fcb   7
		fcb $30
		fcb $40	; @
		fcb 0
		fcb $29	; )
		fcb   5
		fcb   0
		fcb $FE
		fcb $4A
		fcb $29
		fcb   7
		fcb $50
		fcb $40
		fcb 0
		fcb $29
		fcb 6
		fcb $50
		fcb $FE	; ˛
		fcb $4A

; =============== S U B	R O U T	I N E =======================================


_SysExICB:				; CODE XREF: sub_85A6+94P
					; sub_89E0+130P ...
		jsr	sub_A0CF
		decb
		aslb
		clra
		addd	2,y
		ldd	d,y
		leau	d,y
		bra	loc_A15F
; End of function _SysExICB


; =============== S U B	R O U T	I N E =======================================


sub_A14F:				; CODE XREF: sub_89E0+138P
		jsr	sub_A0CF
		decb
		aslb
		clra
		addd	2,y
		ldd	d,y
		leax	d,y
		clr	[unk_2903]

loc_A15F:				; CODE XREF: _SysExICB+Cj
		lda	#8
		jmp	sub_A0C3
; End of function sub_A14F


; =============== S U B	R O U T	I N E =======================================


_SysExVCF:				; CODE XREF: sub_85A6+10BP ROM:A785P ...
		jsr	sub_A0CF
		aslb
		clra
		addd	4,y
		ldd	d,y
		leau	d,y
		bra	sub_A180
; End of function _SysExVCF


; =============== S U B	R O U T	I N E =======================================


sub_A171:				; CODE XREF: sub_A20E+4FP ROM:A8A3P
		jsr	sub_A0CF
		aslb
		clra
		addd	4,y
		ldd	d,y
		leax	d,y
		clr	[unk_2903]
; End of function sub_A171


; =============== S U B	R O U T	I N E =======================================


sub_A180:				; CODE XREF: _SysExVCF+Bj sub_A20E+47P
		lda	#5
		jmp	sub_A0C3
; End of function sub_A180


; =============== S U B	R O U T	I N E =======================================


_SysExAMPL:				; CODE XREF: sub_877C:loc_8862P
					; ROM:938FP ...
		jsr	sub_A0CF
		aslb
		clra
		addd	6,y
		ldd	d,y
		leau	d,y
		bra	loc_A1A1
; End of function _SysExAMPL


; =============== S U B	R O U T	I N E =======================================


sub_A192:				; CODE XREF: sub_A20E+69P ROM:A8BFP ...
		jsr	sub_A0CF
		aslb
		clra
		addd	6,y
		ldd	d,y
		leax	d,y
		clr	[unk_2903]

loc_A1A1:				; CODE XREF: _SysExAMPL+Bj
		lda	#$16
		jmp	sub_A0C3
; End of function sub_A192


; =============== S U B	R O U T	I N E =======================================


_SysExFREQ:				; CODE XREF: envModulesProcess+55P
					; sub_A20E+73P	...
		jsr	sub_A0CF
		aslb
		clra
		addd	8,y
		ldd	d,y
		leau	d,y
		bra	loc_A1C2
; End of function _SysExFREQ


; =============== S U B	R O U T	I N E =======================================


sub_A1B3:				; CODE XREF: sub_A20E+7BP ROM:A8DBP
		jsr	sub_A0CF
		aslb
		clra
		addd	8,y
		ldd	d,y
		leax	d,y
		clr	[unk_2903]

loc_A1C2:				; CODE XREF: _SysExFREQ+Bj
		lda	#$10
		jmp	sub_A0C3
; End of function sub_A1B3


; =============== S U B	R O U T	I N E =======================================


_SysExRELWAVE:				; CODE XREF: sub_A20E+8AP ROM:A8EFP ...
		jsr	sub_A0CF
		aslb
		clra
		addd	$A,y
		ldd	d,y
		leau	d,y
		bra	loc_A1E3
; End of function _SysExRELWAVE


; =============== S U B	R O U T	I N E =======================================


sub_A1D4:				; CODE XREF: sub_A20E+92P ROM:A8F7P ...
		jsr	sub_A0CF
		aslb
		clra
		addd	$A,y
		ldd	d,y
		leax	d,y
		clr	[unk_2903]

loc_A1E3:				; CODE XREF: _SysExRELWAVE+Bj
		lda	#$6A ; 'j'
		jmp	sub_A0C3
; End of function sub_A1D4


; =============== S U B	R O U T	I N E =======================================


_LoadNoteFreqTable:			; CODE XREF: _NoteFn2+A8P _NoteFn2+B7P ...
		jsr	sub_A0CF
		aslb
		clra
		addd	10,y
		ldd	d,y
		leay	d,y
		lda	,y
		rts
; End of function _LoadNoteFreqTable


; =============== S U B	R O U T	I N E =======================================


sub_A1F6:				; CODE XREF: sub_902D+9P
		jsr	sub_A0CF
		aslb
		clra
		addd	8,y
		ldd	d,y
		ldd	d,y
		rts
; End of function sub_A1F6


; =============== S U B	R O U T	I N E =======================================


sub_A202:				; CODE XREF: sub_85A6+B9P sub_85A6+E9P ...
		jsr	sub_A0CF
		aslb
		clra
		addd	4,y
		ldd	d,y
		lda	d,y
		rts
; End of function sub_A202


; =============== S U B	R O U T	I N E =======================================


sub_A20E:				; CODE XREF: sub_89E0+11CP
		decb
		pshs	b
		ldx	word_22F1

loc_A214:				; CODE XREF: sub_A20E+B8J
		tfr	x, u
		jsr	sub_A0CF
		aslb
		clra
		addd	2,y
		ldd	d,y
		leax	d,y
		lda	5,u
		anda	#$8F ; 'è'
		ldb	$12,u
		std	5,x
		ldd	7,u
		std	7,x
		ldb	#7
		pshs	x,u
		leax	9,x
		leau	9,u

loc_A236:				; CODE XREF: sub_A20E+2Dj
		pulu	a
		sta	,x+
		decb
		bne	loc_A236
		ldx	,s
		ldu	2,s
		ldb	4,s
		andb	#$3F ; '?'
		cmpb	#$15
		bcc	loc_A264
		ldb	4,s
		stb	1,x
		ldb	1,u
		ldx	#$2803
		ldu	#$25B5
		jsr	sub_A180
		ldu	#$2803
		ldb	4,s
		jsr	sub_A171
		ldu	2,s
		bra	loc_A26A
; ---------------------------------------------------------------------------

loc_A264:				; CODE XREF: sub_A20E+39j
		ldb	4,s
		subb	#$15
		stb	1,x

loc_A26A:				; CODE XREF: sub_A20E+54j
		ldb	2,u
		ldx	#$2803
		jsr	_SysExAMPL
		ldu	#$2803
		ldb	4,s
		jsr	sub_A192
		ldu	2,s
		ldb	3,u
		ldx	#$2803
		jsr	_SysExFREQ
		ldu	#$2803
		ldb	4,s
		jsr	sub_A1B3
		ldu	2,s
		ldb	$15,u
		andb	#$F
		addb	4,u
		ldx	#$2803
		jsr	_SysExRELWAVE
		ldu	#$2803
		ldb	4,s
		jsr	sub_A1D4
		puls	u,x
		lda	,s
		ldb	,s
		sta	2,x
		std	3,x
		clr	0,x
		lda	$10,u
		beq	locret_A2C9
		andb	#$3F ; '?'
		cmpb	#$15
		bcc	locret_A2C9
		ldb	,s
		addb	#$16
		stb	0,x
		decb
		stb	,s
		jsr	_LoadICBUnknown
		jmp	loc_A214
; ---------------------------------------------------------------------------

locret_A2C9:				; CODE XREF: sub_A20E+A4j sub_A20E+AAj
		puls	pc,b
; End of function sub_A20E


; =============== S U B	R O U T	I N E =======================================


sub_A2CB:				; CODE XREF: sub_82C8+26P
		bsr	sub_A319
		aslb
		clra
		addd	0,y
		ldd	d,y
		leau	d,y
		ldx	#$2233

loc_A2D8:				; CODE XREF: sub_A2CB+21j
		pulu	b,a
		std	,x
		clra
		sta	2,x
		bitb	#$C
		bne	loc_A2E5
		lda	#$C

loc_A2E5:				; CODE XREF: sub_A2CB+16j
		sta	3,x
		leax	8,x
		cmpx	#$2273
		bcs	loc_A2D8
		lda	,u+
		ldx	#$2E04

loc_A2F3:				; CODE XREF: sub_A2CB+32j
		clr	,x+
		lsra
		bcc	loc_A2FA
		com	-1,x

loc_A2FA:				; CODE XREF: sub_A2CB+2Bj
		cmpx	#$2E0A
		bcs	loc_A2F3
		ldb	#$2D ; '-'

loc_A301:				; CODE XREF: sub_A2CB+3Bj
		pulu	a
		sta	,x+
		decb
		bne	loc_A301
		ldx	#$25B5
		lda	#6
		jsr	sub_A0C3
		ldx	#$2505
		lda	#$58 ; 'X'
		jsr	sub_A0C3
		rts
; End of function sub_A2CB


; =============== S U B	R O U T	I N E =======================================


sub_A319:				; CODE XREF: sub_A2CBp	sub_A348p
		ldb	unk_3D50
		orab	#$40 ; '@'
		lda	unk_3D51
		bita	#$20 ; ' '
		beq	loc_A345
		orab	#$80 ; 'Ä'
		lda	unk_128
		anda	#$30 ; '0'
		beq	loc_A332
		cmpa	#$20 ; ' '
		beq	loc_A345

loc_A332:				; CODE XREF: sub_A319+13j
		lda	unk_3D51
		anda	#$DF ; 'ﬂ'
		sta	unk_3D51

loc_A33A:				; CODE XREF: ROM:81EBj
		andb	#$7F ; ''
		pshs	b
		lda	#$36 ; '6'
		jsr	sub_B83B
		puls	b

loc_A345:				; CODE XREF: sub_A319+Aj sub_A319+17j
		jmp	sub_A0CF
; End of function sub_A319


; =============== S U B	R O U T	I N E =======================================


sub_A348:				; CODE XREF: sub_89E0:loc_8AE0P
		bsr	sub_A319
		aslb
		clra
		addd	0,y
		ldd	d,y
		leax	d,y
		ldu	#$2233

loc_A355:				; CODE XREF: sub_A348+17j
		ldd	,u
		std	,x++
		leau	8,u
		cmpu	#$2273
		bcs	loc_A355
		ldu	#$2E0A
		ldb	#$20 ; ' '
		clra
		pshs	a,b

loc_A369:				; CODE XREF: sub_A348+2Bj
		lda	,-u
		anda	1,s
		adda	,s
		sta	,s
		lsr	1,s
		bcc	loc_A369
		sta	,x+
		ldu	#$2E0A
		ldb	#$15

loc_A37C:				; CODE XREF: sub_A348+39j
		pulu	a
		sta	,x+
		decb
		bne	loc_A37C
		ldu	#$2E5A
		ldb	#$12

loc_A388:				; CODE XREF: sub_A348+45j
		pulu	a
		sta	,x+
		decb
		bne	loc_A388
		ldu	#$2337

loc_A392:				; CODE XREF: sub_A348+56j
		lda	$11,u
		sta	,x+
		leau	$58,u
		cmpu	#$2547
		bcs	loc_A392
		ldu	#$25B5
		lda	#6
		jsr	sub_A0C3
		ldu	#$2505
		lda	#$58 ; 'X'
		jsr	sub_A0C3
		clr	[unk_2903]
		puls	pc,b,a
; End of function sub_A348

; ---------------------------------------------------------------------------

loc_A3B6:				; CODE XREF: ROM:A431j	ROM:A43Aj ...
		ldb	#8
		jsr	sub_B8D7
		ldx	#$A3C2
		stx	unk_2000

locret_A3C1:				; CODE XREF: ROM:A3C4j
		rts
; ---------------------------------------------------------------------------
		cmpb	#8
		bne	locret_A3C1
		clr	unk_2CE7
		jsr	sub_B8DF
		jsr	sub_D354
		ldx	#$824E
		stx	unk_2000
		rts
; ---------------------------------------------------------------------------

loc_A3D6:				; CODE XREF: ROM:A6D2J	ROM:A70CJ ...
		ldu	unk_2903
		pshs	u
		jsr	sub_824E
		puls	b,a
		std	unk_2903

loc_A3E3:				; CODE XREF: ROM:A7DAJ	ROM:A8FDj ...
		clr	unk_2CE7

loc_A3E6:				; CODE XREF: ROM:A4F7J	ROM:A5E4J
		clr	byte_2CC3
		clr	[unk_2903]

loc_A3ED:				; CODE XREF: ROM:A3F4j
		jsr	sub_81CD
		lda	[unk_2903]
		bpl	loc_A3ED
		ldx	#$824E
		stx	unk_2000
		rts

; =============== S U B	R O U T	I N E =======================================


sub_A3FD:				; CODE XREF: ROM:loc_A464p
		ldd	#$3131
		pshs	a,b,u

loc_A402:				; CODE XREF: sub_A3FD+Ej
		clra
		ldb	,x+
		addd	,s
		std	,s
		cmpx	2,s
		bcs	loc_A402
		puls	x,b,a
		addd	,x
		rts
; End of function sub_A3FD

; ---------------------------------------------------------------------------
		anda	$E,y
		bita	-2,y
		anda	2,y
		anda	-$F,x
		lda	-8,y
		lda	-$C,y
		lda	0,s
		lda	[b,u]
		lda	#4
		eora	unk_2CE7
		sta	unk_2CE7
		clr	byte_2CC3
		rts
; ---------------------------------------------------------------------------
		lda	unk_2CF6
		bmi	loc_A3B6
		lda	unk_128
		anda	#$30 ; '0'
		cmpa	#$20 ; ' '
		lbne	loc_A3B6
		lda	unk_2CE7
		oraa	#1
		sta	unk_2CE7
		clr	byte_2CC3
		jsr	sub_81CD
		ldb	#$C0 ; '¿'
		jsr	sub_A0CF
		ldx	#$4000
		ldu	#$4F64
		lda	unk_2CE7
		bita	#4
		beq	loc_A464
		ldx	#$6000
		ldu	#$6F64

loc_A464:				; CODE XREF: ROM:A45Cj
		bsr	sub_A3FD
		lbne	loc_A3B6
		ldx	#$4000
		ldu	#$4000
		clrb
		lda	unk_2CE7
		bita	#4
		beq	loc_A480
		ldx	#$6000
		ldu	#$6000
		ldb	#$A

loc_A480:				; CODE XREF: ROM:A476j
		stb	unk_2801
		lda	#$20 ; ' '
		pshs	a,x

loc_A487:				; CODE XREF: ROM:A4ABj
		pshs	x
		ldx	#$2803
		ldb	#$C0 ; '¿'
		jsr	sub_A0CF
		lda	#$80 ; 'Ä'
		jsr	sub_A0C3
		puls	x
		pshs	u
		ldu	#$2803
		ldb	#$40 ; '@'
		jsr	sub_A0CF
		lda	#$80 ; 'Ä'
		jsr	sub_A0C3
		puls	u
		dec	,s
		bne	loc_A487
		lda	#8
		sta	,s
		ldx	1,s
		leax	$4A,x

loc_A4B6:				; CODE XREF: ROM:A4D7j
		lda	#8
		pshs	a,x

loc_A4BA:				; CODE XREF: ROM:A4CDj
		jsr	sub_A4FA
		lda	$11,x
		deca
		jsr	sub_A51B
		inca
		sta	$11,x
		leax	$16,x
		dec	,s
		bne	loc_A4BA
		puls	x,a
		leax	$FA,x
		dec	,s
		bne	loc_A4B6
		puls	x,a
		lda	#$14
		pshs	a
		leax	$7D0,x

loc_A4E3:				; CODE XREF: ROM:A4EBj
		jsr	sub_A4FA
		leax	$10,x
		dec	,s
		bne	loc_A4E3
		leas	1,s
		lda	unk_2CE7
		anda	#$FE ; '˛'
		sta	unk_2CE7
		jmp	loc_A3E6

; =============== S U B	R O U T	I N E =======================================


sub_A4FA:				; CODE XREF: ROM:loc_A4BAP
					; ROM:loc_A4E3P
		pshs	x
		lda	,x
		bita	#$3F ; '?'
		bne	loc_A505
		clra
		bra	loc_A509
; ---------------------------------------------------------------------------

loc_A505:				; CODE XREF: sub_A4FA+6j
		deca
		bsr	sub_A51B
		inca

loc_A509:				; CODE XREF: sub_A4FA+9j
		sta	,x+
		lda	#4
		pshs	a

loc_A50F:				; CODE XREF: sub_A4FA+1Dj
		lda	,x
		bsr	sub_A51B
		sta	,x+
		dec	,s
		bne	loc_A50F
		puls	pc,x,a
; End of function sub_A4FA


; =============== S U B	R O U T	I N E =======================================


sub_A51B:				; CODE XREF: ROM:A4C1P	sub_A4FA+Cp ...
		bpl	locret_A53D
		bita	#$40 ; '@'
		beq	locret_A53D
		anda	#$7F ; ''
		cmpa	#$55 ; 'U'
		bcc	loc_A532
		adda	unk_2801

loc_A52A:				; CODE XREF: sub_A51B+15j
		cmpa	#$55 ; 'U'
		bcs	locret_A53D
		suba	#$A
		bra	loc_A52A
; ---------------------------------------------------------------------------

loc_A532:				; CODE XREF: sub_A51B+Aj
		adda	unk_2801

loc_A535:				; CODE XREF: sub_A51B+20j
		cmpa	#$6A ; 'j'
		bcs	locret_A53D
		suba	#$A
		bra	loc_A535
; ---------------------------------------------------------------------------

locret_A53D:				; CODE XREF: sub_A51Bj	sub_A51B+4j ...
		rts
; End of function sub_A51B

; ---------------------------------------------------------------------------
		lda	unk_128
		anda	#$30 ; '0'
		cmpa	#$20 ; ' '
		lbne	loc_A3B6
		lda	unk_2CE7
		oraa	#2
		sta	unk_2CE7
		clr	byte_2CC3
		jsr	sub_81CD
		ldu	#$4000
		clrb
		lda	unk_2CE7
		bita	#4
		beq	loc_A567
		ldu	#$6000
		ldb	#$A

loc_A567:				; CODE XREF: ROM:A560j
		stb	unk_2801
		lda	#$20 ; ' '
		pshs	a,u
		ldx	#$4000

loc_A571:				; CODE XREF: ROM:A598j
		pshs	x
		ldx	#$2803
		clr	unk_2CF6
		ldb	#$40 ; '@'
		jsr	sub_A0CF
		lda	#$80 ; 'Ä'
		jsr	sub_A0C3
		puls	x
		pshs	u
		ldu	#$2803
		ldb	#$C0 ; '¿'
		jsr	sub_A0CF
		lda	#$80 ; 'Ä'
		jsr	sub_A0C3
		puls	u
		dec	,s
		bne	loc_A571
		lda	#8
		sta	,s
		ldx	1,s
		leax	$4A,x

loc_A5A3:				; CODE XREF: ROM:A5C4j
		lda	#8
		pshs	a,x

loc_A5A7:				; CODE XREF: ROM:A5BAj
		jsr	sub_A5E7
		lda	$11,x
		deca
		jsr	sub_A608
		inca
		sta	$11,x
		leax	$16,x
		dec	,s
		bne	loc_A5A7
		puls	x,a
		leax	$FA,x
		dec	,s
		bne	loc_A5A3
		puls	x,a
		lda	#$14
		pshs	a
		leax	$7D0,x

loc_A5D0:				; CODE XREF: ROM:A5D8j
		jsr	sub_A5E7
		leax	$10,x
		dec	,s
		bne	loc_A5D0
		leas	1,s
		lda	unk_2CE7
		anda	#$FD ; '˝'
		sta	unk_2CE7
		jmp	loc_A3E6

; =============== S U B	R O U T	I N E =======================================


sub_A5E7:				; CODE XREF: ROM:loc_A5A7P
					; ROM:loc_A5D0P
		pshs	x
		lda	0,x
		bita	#$3F ; '?'
		bne	loc_A5F2
		clra
		bra	loc_A5F6
; ---------------------------------------------------------------------------

loc_A5F2:				; CODE XREF: sub_A5E7+6j
		deca
		bsr	sub_A608
		inca

loc_A5F6:				; CODE XREF: sub_A5E7+9j
		sta	,x+
		lda	#4
		pshs	a

loc_A5FC:				; CODE XREF: sub_A5E7+1Dj
		lda	,x
		bsr	sub_A608
		sta	,x+
		dec	,s
		bne	loc_A5FC
		puls	pc,x,a
; End of function sub_A5E7


; =============== S U B	R O U T	I N E =======================================


sub_A608:				; CODE XREF: ROM:A5AEP	sub_A5E7+Cp ...
		bita	#$40 ; '@'
		beq	locret_A633
		bmi	locret_A633
		cmpa	#$40 ; '@'
		beq	locret_A633
		cmpa	#$55 ; 'U'
		beq	locret_A633
		cmpa	#$55 ; 'U'
		bcc	loc_A625
		suba	unk_2801

loc_A61D:				; CODE XREF: sub_A608+1Bj
		cmpa	#$40 ; '@'
		bcc	loc_A631
		adda	#$A
		bra	loc_A61D
; ---------------------------------------------------------------------------

loc_A625:				; CODE XREF: sub_A608+10j
		suba	unk_2801

loc_A628:				; CODE XREF: sub_A608+27j
		cmpa	#$55 ; 'U'
		bcc	loc_A631
		adda	unk_2801
		bra	loc_A628
; ---------------------------------------------------------------------------

loc_A631:				; CODE XREF: sub_A608+17j sub_A608+22j
		oraa	#$80 ; 'Ä'

locret_A633:				; CODE XREF: sub_A608+2j sub_A608+4j ...
		rts
; End of function sub_A608

; ---------------------------------------------------------------------------
		lda	#1
		bra	loc_A63A
; ---------------------------------------------------------------------------
		lda	#$FF

loc_A63A:				; CODE XREF: ROM:A636j
		ldx	word_22F1
		ldb	4,x
		bitb	#$40 ; '@'
		lbeq	loc_A3B6
		pshs	a
		jsr	_LoadNoteFreqTable
		tfr	a, b
		andb	#$80 ; 'Ä'
		pshs	b
		adda	1,s
		anda	#$7F ; ''
		oraa	,s++
		sta	,y
		anda	#$7F ; ''
		ldb	#$C9 ; '…'
		mul

loc_A65D:				; DATA XREF: sub_E026+50r
		jmp	loc_CCC2
; ---------------------------------------------------------------------------
		lda	unk_2CE7
		oraa	#$40 ; '@'
		sta	unk_2CE7
		clr	byte_2CC3
		ldx	#$A672
		stx	unk_2000
		rts
; ---------------------------------------------------------------------------
		ldx	#$A9E9
		jmp	loc_8251
; ---------------------------------------------------------------------------
		stb	unk_2802
		jsr	sub_B7DF
		stb	unk_2801
		ldx	#$A68C
		stx	unk_2000
		tfr	b, a
		jmp	sub_B82E
; ---------------------------------------------------------------------------
		ldx	#$A9ED
		jmp	loc_8251
; ---------------------------------------------------------------------------
		jsr	sub_B7DF
		pshs	b
		jsr	sub_B868
		jsr	sub_81CD
		ldb	unk_2801
		cmpb	,s
		bne	loc_A6A9
		leas	1,s
		jmp	loc_A3B6
; ---------------------------------------------------------------------------

loc_A6A9:				; CODE XREF: ROM:A6A2j
		jsr	sub_A0CF
		decb
		aslb
		clra
		addd	2,y
		ldd	d,y
		leau	d,y
		ldb	0,u
		beq	loc_A6C5
		jsr	sub_A0CF
		decb
		aslb
		clra
		addd	2,y
		ldd	d,y
		leau	d,y

loc_A6C5:				; CODE XREF: ROM:A6B7j
		puls	a
		sta	0,u
		lda	unk_2801
		jsr	sub_B868
		ldb	unk_2802
		jmp	loc_A3D6
; ---------------------------------------------------------------------------
		lda	unk_2CE7
		oraa	#$80 ; 'Ä'
		sta	unk_2CE7
		clr	byte_2CC3
		ldx	#$A6E7
		stx	unk_2000
		rts
; ---------------------------------------------------------------------------
		ldx	#$A9E5
		jmp	loc_8251
; ---------------------------------------------------------------------------
		pshs	b
		jsr	sub_B7DF

loc_A6F2:				; CODE XREF: ROM:A706j
		pshs	b
		jsr	sub_A0CF
		decb
		aslb
		clra
		addd	2,y
		ldd	d,y
		leau	d,y
		puls	b
		addb	#$15
		cmpb	0,u
		beq	loc_A6F2
		clr	0,u
		puls	b
		jmp	loc_A3D6
; ---------------------------------------------------------------------------
		sta	-1,x
		sta	5,y
		sta	$B,y
		sta	$B,y
		sta	$B,y
		sta	$B,y
		sta	$B,y
		sta	$B,y
		ldu	#$A731
		jmp	loc_A7F0
; ---------------------------------------------------------------------------
		ldu	#$A731
		jmp	loc_A7F7
; ---------------------------------------------------------------------------
		ldu	#$A731
		jmp	loc_A807
; ---------------------------------------------------------------------------
		ldx	#$A9A9
		jmp	loc_8251
; ---------------------------------------------------------------------------
		subb	#8
		ldu	#$A731
		jmp	loc_A808
; ---------------------------------------------------------------------------
		jsr	sub_B7DF
		lda	unk_2CE7
		lsra
		ldx	#$2803
		pshs	a
		jsr	_SysExICB
		lsr	,s
		bcc	loc_A75B
		ldb	unk_2803
		ldx	#$2803
		jsr	_SysExICB

loc_A75B:				; CODE XREF: ROM:A750j
		puls	a
		ldx	word_22F1
		lsra
		bcc	loc_A79C
		ldb	0,x
		pshs	a,b,x
		lda	#8
		ldu	#$2803
		jsr	sub_A0C3
		ldx	word_22F1
		ldb	1,s
		stb	0,x
		lda	6,x
		ldb	unk_25C0
		cmpb	word_22EF+1
		bne	loc_A794
		ldb	1,x
		ldx	#$25B5
		jsr	_SysExVCF
		ldx	word_22F1
		lda	6,x
		bita	#8
		bne	loc_A794
		clr	unk_25C0

loc_A794:				; CODE XREF: ROM:A77Ej	ROM:A78Fj
		jsr	sub_C713
		jsr	sub_D354
		puls	x,b,a

loc_A79C:				; CODE XREF: ROM:A761j
		lsra
		bcc	loc_A7B4
		pshs	a,x
		ldb	unk_2804
		stb	1,x
		ldx	#$25B5
		jsr	_SysExVCF
		jsr	sub_877C
		jsr	sub_DC3E
		puls	x,a

loc_A7B4:				; CODE XREF: ROM:A79Dj
		lsra
		bcc	loc_A7BC
		ldb	unk_2805
		stb	2,x

loc_A7BC:				; CODE XREF: ROM:A7B5j
		lsra
		bcc	loc_A7C4
		ldb	unk_2806
		stb	3,x

loc_A7C4:				; CODE XREF: ROM:A7BDj
		lsra
		bcc	loc_A7CC
		ldb	unk_2807
		stb	4,x

loc_A7CC:				; CODE XREF: ROM:A7C5j
		lsra
		bcc	loc_A7D4
		ldb	unk_2806
		stb	2,x

loc_A7D4:				; CODE XREF: ROM:A7CDj
		lda	word_22EF+1
		jsr	sub_875A
		jmp	loc_A3E3
; ---------------------------------------------------------------------------
		sta	unk_4FD5-*-4,pc
		eora	4,x
		eora	4,x
		eora	4,x
		eora	4,x
		eora	4,x
		eora	4,x
		ldu	#$A829

loc_A7F0:				; CODE XREF: ROM:A722J
		lda	#1
		bra	loc_A7F9
; ---------------------------------------------------------------------------
		ldu	#$A829

loc_A7F7:				; CODE XREF: ROM:A728J
		lda	#2

loc_A7F9:				; CODE XREF: ROM:A7F2j
		pshs	a
		lda	unk_2CE7
		anda	#$FC ; '¸'
		oraa	,s+
		bra	loc_A810
; ---------------------------------------------------------------------------
		ldu	#$A829

loc_A807:				; CODE XREF: ROM:A72EJ
		lsrb

loc_A808:				; CODE XREF: ROM:A73CJ	ROM:A834j
		ldx	#$81A4
		lda	b,x
		eora	unk_2CE7

loc_A810:				; CODE XREF: ROM:A802j
		sta	unk_2CE7
		clr	byte_2CC3
		bita	#3
		beq	loc_A822
		bita	#$FC ; '¸'
		beq	loc_A822
		stu	unk_2000
		rts
; ---------------------------------------------------------------------------

loc_A822:				; CODE XREF: ROM:A818j	ROM:A81Cj ...
		ldx	#$824E
		stx	unk_2000
		rts
; ---------------------------------------------------------------------------
		ldx	#$A9B9
		jmp	loc_8251
; ---------------------------------------------------------------------------
		subb	#8
		ldu	#$A829
		bra	loc_A808
; ---------------------------------------------------------------------------
		jsr	sub_B7DF
		lda	unk_2CE7
		lsra
		lsra
		bcc	loc_A842
		addb	#$15

loc_A842:				; CODE XREF: ROM:A83Ej
		decb
		pshs	a,b
		jsr	sub_A0CF
		aslb
		clra
		addd	2,y
		ldd	d,y
		leax	d,y
		puls	b,a
		lsra
		bcc	loc_A890
		pshs	a,b,x
		ldu	unk_21F1
		lda	5,u
		pshs	a
		ldu	word_22F1
		ldd	1,u
		std	1,x
		ldd	3,u
		std	3,x
		lda	5,u
		ldb	$12,u
		std	5,x
		lda	7,u
		sta	7,x
		lda	8,u
		puls	b
		bitb	#$20 ; ' '
		beq	loc_A87F
		adda	$14,u

loc_A87F:				; CODE XREF: ROM:A87Aj
		sta	8,x
		ldb	#7
		leax	9,x
		leau	9,u

loc_A887:				; CODE XREF: ROM:A88Cj
		pulu	a
		sta	,x+
		decb
		bne	loc_A887
		puls	x,b,a

loc_A890:				; CODE XREF: ROM:A853j
		lsra
		bcc	loc_A8A8
		pshs	a,b,x
		lda	unk_2CE7
		bita	#2
		beq	loc_A89E
		subb	#$15

loc_A89E:				; CODE XREF: ROM:A89Aj
		stb	1,x
		ldu	#$25B5
		jsr	sub_A171
		puls	x,b,a

loc_A8A8:				; CODE XREF: ROM:A891j
		lsra
		bcc	loc_A8C4
		stb	2,x
		pshs	a,b,x
		ldx	#$2803
		ldu	word_22F1
		ldb	2,u
		jsr	_SysExAMPL
		ldu	#$2803
		ldb	1,s
		jsr	sub_A192
		puls	x,b,a

loc_A8C4:				; CODE XREF: ROM:A8A9j
		lsra
		bcc	loc_A8E0
		stb	3,x
		pshs	a,b,x
		ldx	#$2803
		ldu	word_22F1
		ldb	3,u
		jsr	_SysExFREQ
		ldu	#$2803
		ldb	1,s
		jsr	sub_A1B3
		puls	x,b,a

loc_A8E0:				; CODE XREF: ROM:A8C5j
		lsra
		bcc	loc_A8FC
		stb	4,x
		pshs	a,b,x
		ldx	#$2803
		ldu	word_22F1
		ldb	4,u
		jsr	_SysExRELWAVE
		ldu	#$2803
		ldb	1,s
		jsr	sub_A1D4
		puls	x,b,a

loc_A8FC:				; CODE XREF: ROM:A8E1j
		lsra
		lbcc	loc_A3E3
		stb	2,x
		pshs	a,b,x
		ldx	#$2803
		ldu	word_22F1
		ldb	3,u
		jsr	_SysExFREQ
		ldu	#$2803
		ldb	1,s
		jsr	sub_A192
		leas	4,s
		jmp	loc_A3E3
; ---------------------------------------------------------------------------
		adca	$D,y
		adca	-$F,y
		adca	-8,y
		adca	-8,y
		adca	-8,y
		adca	-8,y
		adca	-8,y
		adca	-8,y
		lda	#1
		bra	loc_A933
; ---------------------------------------------------------------------------
		lda	#2

loc_A933:				; CODE XREF: ROM:A92Fj
		eora	unk_2CE7
		bra	loc_A941
; ---------------------------------------------------------------------------
		lsrb

loc_A939:				; CODE XREF: ROM:A95Cj
		ldx	#$81A4
		lda	b,x
		eora	unk_2CE7

loc_A941:				; CODE XREF: ROM:A936j
		sta	unk_2CE7
		clr	byte_2CC3
		bita	#3
		lbeq	loc_A822
		ldx	#$A954
		stx	unk_2000
		rts
; ---------------------------------------------------------------------------
		ldx	#$A9C9
		jmp	loc_8251
; ---------------------------------------------------------------------------
		subb	#8
		bra	loc_A939
; ---------------------------------------------------------------------------
		pshs	b
		jsr	sub_B7DF
		lda	unk_2CE7
		bita	#1
		beq	loc_A970
		pshs	a,b
		bsr	sub_A97D
		puls	b,a

loc_A970:				; CODE XREF: ROM:A968j
		bita	#2
		beq	loc_A978
		addb	#$15
		bsr	sub_A97D

loc_A978:				; CODE XREF: ROM:A972j
		puls	b
		jmp	loc_A3D6

; =============== S U B	R O U T	I N E =======================================


sub_A97D:				; CODE XREF: ROM:A96Cp	ROM:A976p
		decb
		pshs	a
		jsr	sub_A0CF
		aslb
		clra
		addd	2,y
		ldd	d,y
		leax	d,y
		puls	a
		ldb	#$40 ; '@'
		bita	#4
		bne	loc_A999
		ldb	#$55 ; 'U'
		bita	#8
		beq	loc_A99C

loc_A999:				; CODE XREF: sub_A97D+14j
		stb	4,x
		rts
; ---------------------------------------------------------------------------

loc_A99C:				; CODE XREF: sub_A97D+1Aj
		anda	#$F0 ; ''
		pshs	a
		lda	5,x
		anda	#$F
		oraa	,s+
		sta	5,x
		rts
; End of function sub_A97D

; ---------------------------------------------------------------------------
		fcb $12
		fcb $2F
		fcb $A7	; ß
		fcb $3F
		fcb 8
		fcb   8
		fcb $A7
		fcb $1F
		fcb 9
		fcb   9
		fcb $A7
		fcb $25	; %
		fcb $A
		fcb  $F
		fcb $A7
		fcb $37	; 7
		fcb $26
		fcb $2F	; /
		fcb $A8
		fcb $36	; 6
		fcb 8
		fcb   8
		fcb $A7
		fcb $ED	; Ì
		fcb   9
		fcb   9
		fcb $A7
		fcb $F4	; Ù
		fcb $A
		fcb $F
		fcb $A8
		fcb $2F	; /
		fcb $26
		fcb $2F
		fcb $A9
		fcb $5E
		fcb 8
		fcb 8
		fcb $A9
		fcb $2D
		fcb 9
		fcb 9
		fcb $A9
		fcb $31
		fcb $A
		fcb  $F
		fcb $A9
		fcb $5A	; Z
		fcb $30
		fcb $30	; 0
		fcb $82
		fcb $4E	; N
		fcb $31
		fcb $31	; 1
		fcb $82
		fcb $4E	; N
		fcb $32
		fcb $34	; 4
		fcb $82
		fcb $4E	; N
		fcb $26
		fcb $2F	; /
		fcb $A6
		fcb $ED	; Ì
		fcb $26	; &
		fcb $2F	; /
		fcb $A6
		fcb $78	; x
		fcb $26
		fcb $2F	; /
		fcb $A6
		fcb $92
		fcb $37	; 7
		fcb $37
		fcb $82	; Ç
		fcb $4E	; N
		fcb $10
		fcb $10
		fcb $82	; Ç
		fcb $4E	; N
		fcb  $E
; ---------------------------------------------------------------------------
		jmp	<unk_A3
; ---------------------------------------------------------------------------
		fcb $D6	; ÷
		fcb   0
		fcb   7
		fcb $A3	; £
		fcb $D6	; ÷
		fcb   0
		fcb $FF
		fcb $A3	; £
		fcb $B6	; ∂

; =============== S U B	R O U T	I N E =======================================


sub_AA05:				; CODE XREF: ROM:811EP
		jsr	sub_8C73
		sta	2,x
		ldd	#$4000
		std	3,x
		clra
		sta	5,x
		lda	#$A
		sta	0,x
		jsr	sub_AA82
		lda	#$14

loc_AA1B:				; CODE XREF: sub_AA05+17j
		deca
		bne	loc_AA1B
		lda	unk_128
		bita	#1
		bne	loc_AA2E
		clr	unk_2B03
		sta	unk_11E
		andcc	#$FB ; '˚'
		rts
; ---------------------------------------------------------------------------

loc_AA2E:				; CODE XREF: sub_AA05+1Ej
		clr	unk_2B03
		rts
; End of function sub_AA05


; =============== S U B	R O U T	I N E =======================================


sub_AA32:				; CODE XREF: ROM:9345P
		lda	#$D4 ; '‘'
		sta	3,x
		lda	7,x
		bita	#$20 ; ' '
		bne	loc_AA64
		bita	#$10
		bne	loc_AA59
		lda	6,x
		cmpa	#$20 ; ' '
		bcs	loc_AA4B

loc_AA46:				; CODE XREF: sub_AA32+2Bj
		lda	#$41 ; 'A'
		sta	4,x
		rts
; ---------------------------------------------------------------------------

loc_AA4B:				; CODE XREF: sub_AA32+12j
		cmpa	#$10
		bcs	loc_AA54
		lda	#$81 ; 'Å'
		sta	4,x
		rts
; ---------------------------------------------------------------------------

loc_AA54:				; CODE XREF: sub_AA32+1Bj
		lda	#$A1 ; '°'
		sta	4,x
		rts
; ---------------------------------------------------------------------------

loc_AA59:				; CODE XREF: sub_AA32+Cj
		lda	8,x
		cmpa	#$5D ; ']'
		bhi	loc_AA46
		lda	#1
		sta	4,x
		rts
; ---------------------------------------------------------------------------

loc_AA64:				; CODE XREF: sub_AA32+8j
		anda	#$F
		ldu	#$AA6E
		lda	a,u
		sta	4,x
		rts
; End of function sub_AA32

; ---------------------------------------------------------------------------
		fcb 1, 1, 1, 1,	1, 1, 1, 1, $41, $81, $A1, $A1,	$A1, $A1
		fcb $A1, $A1, $A1, $A1,	$A1, $A1

; =============== S U B	R O U T	I N E =======================================


sub_AA82:				; CODE XREF: sub_875A+1DP sub_902D+35P ...
		pshs	cc
		orcc	#$10
		ldu	unk_2A0F
		stx	,u++
		cmpu	#$2B03
		bcs	loc_AA94
		ldu	#$2A11

loc_AA94:				; CODE XREF: sub_AA82+Dj
		stu	unk_2A0F
		inc	unk_2A0C
		lda	unk_2B03
		bne	locret_AAA2
		jsr	sub_AACD

locret_AAA2:				; CODE XREF: sub_AA82+1Bj
		puls	pc,cc
; End of function sub_AA82

; ---------------------------------------------------------------------------
		fcb $AA
		fcb $F4	; Ù
		fcb $AB
		fcb $1B
		fcb $AB
		fcb $6F	; o
		fcb $AB
		fcb $8B	; ã
		fcb $AB
		fcb $91	; ë
		fcb $AB	; ´
		fcb $D2	; “
		fcb $AB	; ´
		fcb $F3	; Û
		fcb $AB	; ´
		fcb $12
		fcb $AC	; ¨
		fcb   5
		fcb $AC	; ¨
		fcb $17
		fcb $AC	; ¨
		fcb $1E
		fcb $AC	; ¨
		fcb $30	; 0

; =============== S U B	R O U T	I N E =======================================


sub_AABC:				; CODE XREF: ROM:C1E4P
		com	unk_2B06
		ldu	unk_2B04
		beq	sub_AACD
		lda	#$FF
		sta	5,u
		clra
		clrb
		std	unk_2B04
; End of function sub_AABC


; =============== S U B	R O U T	I N E =======================================


sub_AACD:				; CODE XREF: sub_AA82+1DP sub_AABC+6j	...
		clr	unk_2B03
		tst	unk_2A0C
		bne	loc_AAD9
		sta	unk_11E
		rts
; ---------------------------------------------------------------------------

loc_AAD9:				; CODE XREF: sub_AACD+6j
		ldu	unk_2A0D
		ldx	,u++
		cmpu	#$2B03
		bcs	loc_AAE7
		ldu	#$2A11

loc_AAE7:				; CODE XREF: sub_AACD+15j
		stu	unk_2A0D
		dec	unk_2A0C
		lda	,x
		ldu	#$AAA4
		jmp	[a,u]
; End of function sub_AACD

; ---------------------------------------------------------------------------
		jsr	sub_AC37
		pshs	x
		ldb	2,x
		ldx	#0
		jsr	_SysExRELWAVE
		ldx	,s
		ldb	4,x
		ldx	#$D4 ; '‘'
		jsr	_SysExFREQ
		puls	x
		lda	#$1F
		sta	byte_F4

loc_AB12:				; CODE XREF: ROM:AB8EJ	ROM:AC02J
		sta	unk_11E
		jsr	sub_8CA2
		jmp	sub_AACD
; ---------------------------------------------------------------------------
		fdb $BDAC
; ---------------------------------------------------------------------------

locret_AB1D:				; CODE XREF: ROM:AC14J	ROM:AC2DJ
		pulu	pc,y,b,a
; ---------------------------------------------------------------------------
		asr	<unk_85
		bra	loc_AB48+1
; ---------------------------------------------------------------------------
		lbra	unk_AAB
; ---------------------------------------------------------------------------
		lbne	loc_BD0F+1
		ror	<byte_C1
		swi
		bcs	loc_AB32
		clrb
		bra	loc_AB3A
; ---------------------------------------------------------------------------

loc_AB32:				; CODE XREF: ROM:AB2Dj
		ldy	#$AC88
		aslb
		clra
		ldb	[d,y]

loc_AB3A:				; CODE XREF: ROM:AB30j
		ldy	#$F5 ; 'ı'
		ldu	3,x
		stu	,y++
		stb	,y+
		ldd	5,x
		oraa	#1

loc_AB48:				; CODE XREF: ROM:AB21j
		std	,y++
		ldd	7,x
		std	,y++
		ldd	9,x
		std	,y++
		lda	$B,x
		sta	,y
		sta	unk_11E
		lda	2,x
		sta	unk_2B06
		ldu	#$104
		sta	a,u
		ldu	#$94C3
		asla
		ldd	a,u
		std	unk_2B04
		jmp	sub_8CA2
; ---------------------------------------------------------------------------
		jsr	sub_AC37
		clra
		sta	byte_F8
		lda	$B,x
		sta	unk_FE
		sta	unk_11E
		lda	2,x
		sta	unk_2B06
		ldu	#$104
		sta	a,u
		jmp	sub_8CA2
; ---------------------------------------------------------------------------
		jsr	sub_AC8B
		jmp	loc_AB12
; ---------------------------------------------------------------------------
		lda	#$FF
		sta	unk_2B03
		lda	1,x
		beq	loc_ABCB
		ldd	#$440
		ldy	#$F8 ; '¯'
		std	,y++
		clra
		clrb
		std	,y
		clr	1,x
		ldu	unk_2A0D
		leau	-2,u
		cmpu	#$2A11
		bcc	loc_ABB7
		ldu	#$2B01

loc_ABB7:				; CODE XREF: ROM:ABB2j
		stu	unk_2A0D
		inc	unk_2A0C
		sta	unk_11E
		lda	2,x
		sta	unk_2B06
		ldu	#$104
		sta	a,u
		rts
; ---------------------------------------------------------------------------

loc_ABCB:				; CODE XREF: ROM:AB98j
		lda	#$8A ; 'ä'
		sta	byte_F8
		bra	loc_ABE0
; ---------------------------------------------------------------------------
		lda	#4
		ldb	3,x
		ldy	#$F8 ; '¯'
		std	,y++
		ldd	4,x
		std	,y

loc_ABE0:				; CODE XREF: ROM:ABD0j
		jsr	sub_AC8B
		sta	unk_11E
		lda	2,x
		sta	unk_2B06
		ldu	#$104
		sta	a,u
		jmp	sub_8CA2
; ---------------------------------------------------------------------------
		jsr	sub_AC37
		pshs	x
		ldb	2,x
		ldx	#0
		jsr	_SysExRELWAVE
		puls	x
		jmp	loc_AB12
; ---------------------------------------------------------------------------
		jsr	sub_AC37
		ldb	#$40 ; '@'

loc_AC0A:				; CODE XREF: ROM:AC1Cj
		pshs	x
		ldx	#0
		jsr	_SysExRELWAVE
		puls	x
		jmp	locret_AB1D+1
; ---------------------------------------------------------------------------
		jsr	sub_AC37
		ldb	#$55 ; 'U'
		bra	loc_AC0A
; ---------------------------------------------------------------------------
		jsr	sub_AC37
		ldb	#$40 ; '@'

loc_AC23:				; CODE XREF: ROM:AC35j
		pshs	x
		ldx	#$D4 ; '‘'
		jsr	_SysExFREQ
		puls	x
		jmp	locret_AB1D+1
; ---------------------------------------------------------------------------
		jsr	sub_AC37
		ldb	#$55 ; 'U'
		bra	loc_AC23

; =============== S U B	R O U T	I N E =======================================


sub_AC37:				; CODE XREF: ROM:AAF4P	ROM:AB6FP ...
		lda	1,x
		anda	#$1F
		pshs	a

loc_AC3D:				; CODE XREF: sub_AC8B+3j
		lda	$FF
		lda	#$FF
		sta	unk_2B03
		ldd	unk_2D4E
		cmpd	#$D7 ; '◊'
		bcs	loc_AC78
		cmpd	#$3FB
		bcc	loc_AC78
		cmpd	#$15C
		bcs	loc_AC74
		cmpd	#$2D3
		bcc	loc_AC74
		cmpd	#$1AA
		bcs	loc_AC70
		cmpd	#$261
		bcc	loc_AC70
		lda	#$E0 ; '‡'
		bra	loc_AC7A
; ---------------------------------------------------------------------------

loc_AC70:				; CODE XREF: sub_AC37+2Dj sub_AC37+33j
		lda	#$C0 ; '¿'
		bra	loc_AC7A
; ---------------------------------------------------------------------------

loc_AC74:				; CODE XREF: sub_AC37+21j sub_AC37+27j
		lda	#$A0 ; '†'
		bra	loc_AC7A
; ---------------------------------------------------------------------------

loc_AC78:				; CODE XREF: sub_AC37+15j sub_AC37+1Bj
		lda	#$80 ; 'Ä'

loc_AC7A:				; CODE XREF: sub_AC37+37j sub_AC37+3Bj ...
		oraa	,s+
		sta	unk_121
		ldd	unk_2D4E
		ldu	#$AD09
		lda	d,u
		sta	$FF
		rts
; End of function sub_AC37


; =============== S U B	R O U T	I N E =======================================


sub_AC8B:				; CODE XREF: ROM:AB8BP	ROM:loc_ABE0P
		clra
		pshs	a
		bra	loc_AC3D
; End of function sub_AC8B

; ---------------------------------------------------------------------------
		neg	<byte_B1
		neg	<unk_B2
		neg	<unk_B3
		neg	<byte_B4
		neg	<unk_B5
		neg	<unk_B6
		neg	<unk_B7
		neg	<unk_B8
		neg	<byte_B9
		neg	<unk_BA
		neg	<unk_BB
		neg	<unk_BC
		neg	<unk_BD
		neg	<unk_BE
		neg	<unk_BF
		neg	<unk_C0
		neg	<byte_C1
		neg	<byte_C1
		neg	<unk_C2
		neg	<unk_C3
		neg	<unk_C4
		neg	<unk_C4
		neg	<byte_C5
		neg	<byte_C5
		neg	<unk_C6
		neg	<unk_C7
		neg	<unk_C7
		neg	<unk_C8
		neg	<unk_C8
		neg	<unk_C9
		neg	<unk_C9
		neg	<byte_CA
		neg	<byte_CA
		neg	<unk_CB
		neg	<unk_CB
		neg	<unk_CC
		neg	<unk_CC
		neg	<unk_CC
		neg	<unk_CD
		neg	<unk_CD
		neg	<unk_CE
		neg	<unk_CE
		neg	<unk_CE
		neg	<unk_CF
		neg	<unk_CF
		neg	<unk_CF
		neg	<unk_D0
		neg	<unk_D0
		neg	<unk_D0
		neg	<unk_D1
		neg	<unk_D1
		neg	<unk_D1
		neg	<unk_D2
		neg	<unk_D2
		neg	<unk_D2
		neg	<byte_D3
		neg	<byte_D3
		neg	<byte_D3
		neg	<byte_D3
		jsr	8,x
		neg	<unk_7F
		clr	unk_7F7F
		clr	unk_7E7E
		jmp	unk_7D7D
; ---------------------------------------------------------------------------
		fcb $7D	; }
		fcb $7C	; |
		fcb $7C	; |
		fcb $7C, $7B, $7B, $7B,	$7A, $7A, $79, $79, $79, $78, $78
		fcb $78, $77, $77, $77,	$76, $76, $76, $75, $75, $75, $74
		fcb $74, $74, $73, $73,	$73, $73, $72, $72, $72, $71, $71
		fcb $71, $70, $70, $70,	$6F, $6F, $6F, $6E, $6E, $6E, $6D
		fcb $6D, $6D, $6C, $6C,	$6C, $6B, $6B, $6B, $6A, $6A, $6A
		fcb $69, $69, $69, $69,	$68, $68, $68, $67, $67, $67, $66
		fcb $66, $66, $65, $65,	$65, $64, $64, $64, $64, $63, $63
		fcb $63, $62, $62, $62,	$61, $61, $61, $60, $60, $60, $60
		fcb $5F, $5F, $5F, $5E,	$5E, $5E, $5D, $5D, $5D, $5D, $5C
		fcb $5C, $5C, $5B, $5B,	$5B, $5A, $5A, $5A, $5A, $59, $59
		fcb $59, $58, $58, $58,	$58, $57, $57, $57, $56, $56, $56
		fcb $56, $55, $55, $55,	$54, $54, $54, $54, $53, $53, $53
		fcb $52, $52, $52, $52,	$51, $51, $51, $50, $50, $50, $50
		fcb $4F, $4F, $4F, $4E,	$4E, $4E, $4E, $4D, $4D, $4D, $4C
		fcb $4C, $4C, $4C, $4B,	$4B, $4B, $4B, $4A, $4A, $4A, $49
		fcb $49, $49, $49, $48,	$48, $48, $48, $47, $47, $47, $46
		fcb $46, $46, $46, $45,	$45, $45, $45, $44, $44, $44, $44
		fcb $43, $43, $43, $42,	$42, $42, $42, $41, $41, $41, $41
		fcb $40, $40, $40, $40,	$7F, $7E, $7E, $7D, $7D, $7C, $7C
		fcb $7B, $7B, $7A, $7A,	$79, $79, $78, $78, $77, $77, $76
		fcb $75, $75, $74, $74,	$73, $73, $72, $72, $71, $71, $70
		fcb $70, $6F, $6F, $6E,	$6E, $6D, $6D, $6C, $6C, $6C, $6B
		fcb $6B, $6A, $6A, $69,	$69, $68, $68, $67, $67, $66, $66
		fcb $65, $65, $64, $64,	$63, $63, $62, $62, $61, $61, $60
		fcb $60, $5F, $5F, $5E,	$5E, $5E, $5D, $5D, $5C, $5C, $5B
		fcb $5B, $5A, $5A, $59,	$59, $58, $58, $57, $57, $56, $56
		fcb $56, $55, $55, $54,	$54, $53, $53, $52, $52, $51, $51
		fcb $51, $50, $50, $4F,	$4F, $4E, $4E, $4D, $4D, $4C, $4C
		fcb $4C, $4B, $4B, $4A,	$4A, $49, $49, $48, $48, $48, $47
		fcb $47, $46, $46, $45,	$45, $44, $44, $44, $43, $43, $42
		fcb $42, $41, $41, $41,	$40, $7F, $7E, $7E, $7D, $7C, $7B
		fcb $7A, $79, $78, $78,	$77, $76, $75, $74, $73, $72, $72
		fcb $71, $70, $6F, $6E,	$6D, $6D, $6C, $6B, $6A, $69, $68
		fcb $68, $67, $66, $65,	$64, $63, $63, $62, $61, $60, $5F
		fcb $5E, $5E, $5D, $5C,	$5B, $5A, $5A, $59, $58, $57, $56
		fcb $55, $55, $54, $53,	$52, $51, $51, $50, $4F, $4E, $4D
		fcb $4D, $4C, $4B, $4A,	$49, $49, $48, $47, $46, $45, $45
		fcb $44, $43, $42, $42,	$41, $40, $7E, $7D, $7B, $7A, $78
		fcb $77, $75, $74, $72,	$71, $6F, $6D, $6C, $6A, $69, $67
		fcb $66, $64, $63, $61,	$60, $5E, $5D, $5B, $5A, $58, $57
		fcb $55, $54, $52, $51,	$4F, $4E, $4C, $4B, $49, $48, $46
		fcb $45, $43, $42, $40,	$3F, $3D, $3C, $3A, $39, $38, $36
		fcb $35, $33, $32, $30,	$2F, $2D, $2C, $2A, $29, $28, $26
		fcb $25, $23, $22, $20,	$1F, $1E, $1C, $1B, $19, $18, $16
		fcb $15, $14, $12, $11,	$F, $E,	$D, $B,	$A, 8, 7, 6, 4
		fcb 3, 1, 0, $81, $83, $84, $86, $87, $88, $8A,	$8B, $8C
		fcb $8E, $8F, $91
		fcb $92, $93, $95, $96,	$97, $99, $9A, $9B, $9D, $9E, $9F
		fcb $A1, $A2, $A3, $A5,	$A6, $A7, $A9, $AA, $AB, $AD, $AE
		fcb $AF, $B1, $B2, $B3,	$B5, $B6, $B7, $B9, $BA, $BB, $BD
		fcb $BE, $BF, $C0, $C2,	$C3, $C4, $C6, $C7, $C8, $C9, $CB
		fcb $CC, $CD, $CF, $D0,	$D1, $D2, $D4, $D5, $D6, $D8, $D9
		fcb $DA, $DB, $DD, $DE,	$DF, $E0, $E2, $E3, $E4, $E5, $E7
		fcb $E8, $E9, $EA, $EC,	$ED, $EE, $EF, $F1, $F2, $F3, $F4
		fcb $F5, $F7, $F8, $F9,	$FA, $FC, $FD, $BF, $C0, $C0, $C1
		fcb $C1, $C2, $C3, $C3,	$C4, $C4, $C5, $C6, $C6, $C7, $C7
		fcb $C8, $C9, $C9, $CA,	$CA, $CB, $CC, $CC, $CD, $CD, $CE
		fcb $CF, $CF, $D0, $D0,	$D1, $D1, $D2, $D3, $D3, $D4, $D4
		fcb $D5, $D6, $D6, $D7,	$D7, $D8, $D8, $D9, $DA, $DA, $DB
		fcb $DB, $DC, $DC, $DD,	$DE, $DE, $DF, $DF, $E0, $E0, $E1
		fcb $E1, $E2, $E3, $E3,	$E4, $E4, $E5, $E5, $E6, $E6, $E7
		fcb $E8, $E8, $E9, $E9,	$EA, $EA, $EB, $EB, $EC, $ED, $ED
		fcb $EE, $EE, $EF, $EF,	$F0, $F0, $F1, $F1, $F2, $F3, $F3
		fcb $F4, $F4, $F5, $F5,	$F6, $F6, $F7, $F7, $F8, $F8, $F9
		fcb $F9, $FA, $FB, $FB,	$FC, $FC, $FD, $FD, $FE, $FE, $FF
		fcb $C0, $C0, $C0, $C0,	$C1, $C1, $C1, $C1, $C2, $C2, $C2
		fcb $C2, $C3, $C3, $C3,	$C3, $C4, $C4, $C4, $C4, $C5, $C5
		fcb $C5, $C6, $C6, $C6,	$C6, $C7, $C7, $C7, $C7, $C8, $C8
		fcb $C8, $C8, $C9, $C9,	$C9, $C9, $CA, $CA, $CA, $CA, $CA
		fcb $CB, $CB, $CB, $CB,	$CC, $CC, $CC, $CC, $CD, $CD, $CD
		fcb $CD, $CE, $CE, $CE,	$CE, $CF, $CF, $CF, $CF, $D0, $D0
		fcb $D0, $D0, $D1, $D1,	$D1, $D1, $D1, $D2, $D2, $D2, $D2
		fcb $D3, $D3, $D3, $D3,	$D4, $D4, $D4, $D4, $D5, $D5, $D5
		fcb $D5, $D5, $D6, $D6,	$D6, $D6, $D7, $D7, $D7, $D7, $D8
		fcb $D8, $D8, $D8, $D8,	$D9, $D9, $D9, $D9, $DA, $DA, $DA
		fcb $DA, $DA, $DB, $DB,	$DB, $DB, $DC, $DC, $DC, $DC, $DC
		fcb $DD, $DD, $DD, $DD,	$DE, $DE, $DE, $DE, $DE, $DF, $DF
		fcb $DF, $DF, $E0, $E0,	$E0, $E0, $E0, $E1, $E1, $E1, $E1
		fcb $E1, $E2, $E2, $E2,	$E2, $E3, $E3, $E3, $E3, $E3, $E4
		fcb $E4, $E4, $E4, $E4,	$E5, $E5, $E5, $E5, $E5, $E6, $E6
		fcb $E6, $E6, $E7, $E7,	$E7, $E7, $E7, $E8, $E8, $E8, $E8
		fcb $E8, $E9, $E9, $E9,	$E9, $E9, $EA, $EA, $EA, $EA, $EA
		fcb $EB, $EB, $EB, $EB,	$EB, $EC, $EC, $EC, $EC, $EC, $ED
		fcb $ED, $ED, $ED, $ED,	$EE, $EE, $EE, $EE, $EE, $EF, $EF
		fcb $EF, $EF, $EF, $F0,	$F0, $F0, $F0, $F0, $F1, $F1, $F1
		fcb $F1, $F1, $F2, $F2,	$F2, $F2, $F2, $F3, $F3, $F3, $F3
		fcb $F3, $F3, $F4, $F4,	$F4, $F4, $F4, $F5, $F5, $F5, $F5
		fcb $F5, $F6, $F6, $F6,	$F6, $F6, $F6, $F7, $F7, $F7, $F7
		fcb $F7, $F8, $F8, $F8,	$F8, $F8, $F9, $F9, $F9, $F9, $F9
		fcb $F9, $FA, $FA, $FA,	$FA, $FA, $FB, $FB, $FB, $FB, $FB
		fcb $FB, $FC, $FC, $FC,	$FC, $FC, $FC, $FD, $FD, $FD, $FD
		fcb $FD, $FE, $FE, $FE,	$FE, $FE, $FE, $FF, $FF, $FF, $C0
		fcb $C0, $C0, $C0, $C0,	$18, $19, $1A, $1F, $1D, $1B, $1E
		fcb $1C, $30, $31, $32,	$33, $34
		fcb $35, $36, $37, $28,	$29, $2A, $2B, $2C, $2D, $2E, $2F
		fcb $2E, $3C, $2E, $50,	$2E, $3D, $2E, $5A, $2E, $3E, $2E
		fcb $5B, $2E, $3F, $2E,	$67

; =============== S U B	R O U T	I N E =======================================


sub_B131:				; CODE XREF: ROM:loc_8246P
		lda	#$2E ; '.'
		tfr	a, dp
		lda	unk_3D6F
		bita	#1
		bne	loc_B144
		bita	#$3C ; '<'
		beq	loc_B144
		lda	<unk_11
		bra	loc_B145
; ---------------------------------------------------------------------------

loc_B144:				; CODE XREF: sub_B131+9j sub_B131+Dj
		clra

loc_B145:				; CODE XREF: sub_B131+11j
		sta	<byte_37
		lda	<unk_4
		beq	loc_B172
		ldb	#$12
		ldu	#$2E1F
		ldx	#$2E5A

loc_B153:				; CODE XREF: sub_B131+27j
		pulu	a
		sta	,x+
		decb
		bne	loc_B153
		ldx	#$B121
		lda	[,x]
		tfr	a, b
		mul
		addd	#$FF
		tfr	a, b
		lda	[2,x]
		jsr	sub_B3CF
		sta	[2,x]
		bra	loc_B193
; ---------------------------------------------------------------------------

loc_B172:				; CODE XREF: sub_B131+18j
		ldb	#4
		stb	<word_0
		ldx	#$B121

loc_B179:				; CODE XREF: sub_B131+60j
		ldu	,x++
		ldy	,x++
		lda	,u
		tfr	a, b
		mul
		addd	#$FF
		tfr	a, b
		lda	,y
		jsr	sub_B3CF
		sta	,y
		dec	<word_0
		bne	loc_B179

loc_B193:				; CODE XREF: sub_B131+3Fj
		ldb	word_22EF
		bitb	#$40 ; '@'
		beq	loc_B1B2
		ldb	unk_21F0
		ldx	#$2E5C
		cmpb	#1
		bhi	loc_B1B2
		bcs	loc_B1A9
		ldx	#$2E60

loc_B1A9:				; CODE XREF: sub_B131+73j
		ldb	word_22EF
		andb	#3
		lda	<unk_67
		sta	b,x

loc_B1B2:				; CODE XREF: sub_B131+67j sub_B131+71j
		lda	<unk_38
		ldb	<unk_6B
		mul
		addd	#$FF
		tfr	a, b
		lda	<unk_6C
		jsr	sub_B462
		lda	<unk_50
		ldb	<byte_D
		bitb	#2
		beq	loc_B1CF
		ldb	<unk_6C
		mul
		addd	#$FF

loc_B1CF:				; CODE XREF: sub_B131+96j
		sta	<unk_51
		lda	<unk_3B
		suba	<unk_1C
		bhi	loc_B1DA
		clrb
		bra	loc_B1F9
; ---------------------------------------------------------------------------

loc_B1DA:				; CODE XREF: sub_B131+A4j
		tfr	a, b
		mul
		sta	<word_0
		ldb	<unk_1D
		mul
		sta	<word_0+1
		lda	<word_0
		ldb	<unk_1D
		mul
		addb	<word_0+1
		adda	#0
		beq	loc_B1F1
		ldb	#$FF

loc_B1F1:				; CODE XREF: sub_B131+BCj
		lda	<unk_6A
		mul
		addd	#$FF
		tfr	a, b

loc_B1F9:				; CODE XREF: sub_B131+A7j
		lda	<byte_6E
		jsr	sub_B4A0
		lda	<unk_5A
		ldb	<byte_D
		bitb	#$20 ; ' '
		beq	loc_B20C
		coma
		ldb	<byte_6E
		mul
		adda	<unk_5A

loc_B20C:				; CODE XREF: sub_B131+D3j
		ldb	<byte_E
		bitb	#$40 ; '@'
		beq	loc_B22C
		ldb	<byte_72
		bmi	loc_B22C
		ldb	unk_2D59
		sta	<word_0
		addb	#$80 ; 'Ä'
		lda	<unk_1B
		mul
		coma
		ldb	<word_0
		mul
		lsr	<word_0
		adda	<word_0
		bcc	loc_B22C
		lda	#$FF

loc_B22C:				; CODE XREF: sub_B131+DFj sub_B131+E3j ...
		ldu	#$2E52
		ldx	#$2E5C
		ldb	#4
		std	<word_0

loc_B236:				; CODE XREF: sub_B131+111j
		lda	<word_0
		ldb	,x+
		mul
		addd	#$FF
		sta	,u+
		dec	<word_0+1
		bne	loc_B236
		ldb	#4
		lda	<unk_5B
		std	<word_0

loc_B24A:				; CODE XREF: sub_B131+125j
		lda	<word_0
		ldb	,x+
		mul
		addd	#$FF
		sta	,u+
		dec	<word_0+1
		bne	loc_B24A
		ldb	<byte_E
		bitb	#$3F ; '?'
		beq	loc_B28A
		ldb	<unk_39
		stb	<word_0
		lda	#$F
		mul
		adda	<word_0
		bcc	loc_B26B
		lda	#$FF

loc_B26B:				; CODE XREF: sub_B131+136j
		tfr	a, b
		lda	<unk_71
		jsr	sub_B429
		ldb	<byte_E
		bitb	#$10
		beq	loc_B28A
		ldb	<unk_71
		lda	<unk_71
		asla
		rolb
		rola
		anda	#3
		adcb	#0
		adca	#0
		std	unk_2D52
		ldb	<byte_E

loc_B28A:				; CODE XREF: sub_B131+12Bj
					; sub_B131+145j
		bitb	#$E0 ; '‡'
		beq	loc_B2D7
		lda	<byte_3A
		ldb	#$80 ; 'Ä'
		cmpa	#$76 ; 'v'
		bhi	loc_B29D
		sta	<word_0
		ldb	#$14
		mul
		bra	loc_B2A8
; ---------------------------------------------------------------------------

loc_B29D:				; CODE XREF: sub_B131+163j
		cmpa	#$8A ; 'ä'
		bls	loc_B2AC
		sta	<word_0
		coma
		ldb	#$14
		mul
		nega

loc_B2A8:				; CODE XREF: sub_B131+16Aj
		adda	<word_0
		tfr	a, b

loc_B2AC:				; CODE XREF: sub_B131+16Ej
		lda	<byte_72
		jsr	sub_B3EF
		ldb	<byte_E
		bitb	#$80 ; 'Ä'
		beq	loc_B2D7
		ldb	<byte_72
		lda	<unk_69
		mul
		aslb
		rola
		rolb
		rola
		rolb
		exg	a, b
		anda	#3
		subb	<unk_69
		sbca	#0
		subb	<unk_69

loc_B2CB:
		sbca	#0
		addd	unk_2D52
		bpl	loc_B2DA
		ldd	#0
		bra	loc_B2DA
; ---------------------------------------------------------------------------

loc_B2D7:				; CODE XREF: sub_B131+15Bj
					; sub_B131+184j
		ldd	unk_2D52

loc_B2DA:				; CODE XREF: sub_B131+19Fj
					; sub_B131+1A4j
		std	<word_0
		clrb
		lda	<byte_D
		bita	#$80 ; 'Ä'
		beq	loc_B2F5
		lda	<byte_6E
		ldb	<unk_1E
		mul
		aslb
		rola
		rolb
		andb	#1
		exg	a, b
		subb	<byte_6E
		sbca	#0
		bra	loc_B2F6
; ---------------------------------------------------------------------------

loc_B2F5:				; CODE XREF: sub_B131+1B0j
		clra

loc_B2F6:				; CODE XREF: sub_B131+1C2j
		addd	<word_0
		bpl	loc_B2FE
		clra
		clrb
		bra	loc_B307
; ---------------------------------------------------------------------------

loc_B2FE:				; CODE XREF: sub_B131+1C7j
		cmpd	#$400
		blt	loc_B307
		ldd	#$3FF

loc_B307:				; CODE XREF: sub_B131+1CBj
					; sub_B131+1D1j
		std	unk_2D50
		ldx	#$25B5
		lda	$B,x
		bne	loc_B315
		sta	unk_2D30
		rts
; ---------------------------------------------------------------------------

loc_B315:				; CODE XREF: sub_B131+1DEj
		ldb	,x
		bitb	#$40 ; '@'
		bne	loc_B320
		clr	unk_2D30
		bra	loc_B32C
; ---------------------------------------------------------------------------

loc_B320:				; CODE XREF: sub_B131+1E8j
		lda	$A,x
		asla
		asla
		ldu	#$8D1B
		lda	[a,u]
		sta	unk_2D30

loc_B32C:				; CODE XREF: sub_B131+1EDj
		lda	<byte_77
		ldb	<byte_E
		bitb	#2
		beq	loc_B33A
		lda	<unk_71
		sta	<byte_77
		sta	2,x

loc_B33A:				; CODE XREF: sub_B131+201j
		ldb	<byte_D
		bitb	#8
		beq	loc_B346
		adda	<unk_6C
		bcc	loc_B346
		lda	#$FF

loc_B346:				; CODE XREF: sub_B131+20Dj
					; sub_B131+211j
		sta	unk_2D2F
		ldy	#$2E78
		ldu	#$2E79
		lda	<unk_71
		ldb	<byte_E
		bitb	#4
		beq	loc_B35A
		sta	,y

loc_B35A:				; CODE XREF: sub_B131+225j
		bitb	#8
		beq	loc_B360
		sta	,u

loc_B360:				; CODE XREF: sub_B131+22Bj
		jsr	sub_B3A7
		ldb	<byte_E
		bitb	#1
		beq	loc_B370
		lda	<unk_71
		sta	<byte_76
		jsr	sub_B39C

loc_B370:				; CODE XREF: sub_B131+236j
		lda	<byte_D
		bita	#$40 ; '@'
		bne	loc_B37A
		clra
		clrb
		bra	loc_B382
; ---------------------------------------------------------------------------

loc_B37A:				; CODE XREF: sub_B131+243j
		ldb	<byte_6E
		lda	#$7E ; '~'
		mul
		tfr	a, b
		clra

loc_B382:				; CODE XREF: sub_B131+247j
		std	<word_0
		lda	<byte_D
		bita	#4
		beq	loc_B393
		ldb	<unk_6B
		lsrb
		negb
		addb	<unk_6C
		sex
		bra	loc_B396
; ---------------------------------------------------------------------------

loc_B393:				; CODE XREF: sub_B131+257j
		ldd	#0

loc_B396:				; CODE XREF: sub_B131+260j
		addd	<word_0
		std	unk_2D2D
		rts
; End of function sub_B131


; =============== S U B	R O U T	I N E =======================================


sub_B39C:				; CODE XREF: sub_877C:loc_87B8P
					; sub_B131+23CP
		tfr	a, b
		subb	#$80 ; 'Ä'
		sex
		std	unk_2D29
		stb	1,x
		rts
; End of function sub_B39C


; =============== S U B	R O U T	I N E =======================================


sub_B3A7:				; CODE XREF: sub_877C:loc_87CEP
					; sub_B131:loc_B360P
		ldb	,y
		stb	4,x
		pshs	x
		comb
		tfr	b, a
		mul
		ldb	#$3F ; '?'
		mul
		addd	#$106
		std	unk_2D3A
		ldb	,u
		ldx	,s
		stb	5,x
		comb
		tfr	b, a
		mul
		ldb	#$3F ; '?'
		mul
		addd	#$106
		std	unk_2D3C
		puls	pc,x
; End of function sub_B3A7


; =============== S U B	R O U T	I N E =======================================


sub_B3CF:				; CODE XREF: sub_B131+39P sub_B131+59P ...
		sta	<unk_3
		subb	<unk_3
		beq	locret_B3EE
		bcc	loc_B3E2
		negb
		lda	#$FC ; '¸'
		cmpb	#4
		bhi	loc_B3EA
		lda	#$FF
		bra	loc_B3EA
; ---------------------------------------------------------------------------

loc_B3E2:				; CODE XREF: sub_B3CF+6j
		lda	#4
		cmpb	#4
		bhi	loc_B3EA
		lda	#1

loc_B3EA:				; CODE XREF: sub_B3CF+Dj sub_B3CF+11j	...
		adda	<unk_3
		andcc	#$FB ; '˚'

locret_B3EE:				; CODE XREF: sub_B3CF+4j
		rts
; End of function sub_B3CF


; =============== S U B	R O U T	I N E =======================================


sub_B3EF:				; CODE XREF: sub_B131+17DP
		subb	#$80 ; 'Ä'
		bmi	loc_B3FB
		addb	<unk_73
		bcc	loc_B400
		ldb	#$FF
		bra	loc_B400
; ---------------------------------------------------------------------------

loc_B3FB:				; CODE XREF: sub_B3EF+2j
		addb	<unk_73
		bcs	loc_B400
		clrb

loc_B400:				; CODE XREF: sub_B3EF+6j sub_B3EF+Aj ...
		bsr	sub_B3CF
		bne	loc_B407
		sta	<byte_72
		rts
; ---------------------------------------------------------------------------

loc_B407:				; CODE XREF: sub_B3EF+13j
		sta	<byte_72
		sta	<unk_2
		lda	<byte_37
		beq	locret_B428
		ldb	unk_3D6F
		bitb	#4
		beq	locret_B428
		adda	#$DF ; 'ﬂ'
		jsr	_MIDITransmitA
		clra
		lsr	<unk_2
		rora
		lsra
		jsr	_MIDITransmitA
		lda	<unk_2
		jsr	_MIDITransmitA

locret_B428:				; CODE XREF: sub_B3EF+1Ej sub_B3EF+25j
		rts
; End of function sub_B3EF


; =============== S U B	R O U T	I N E =======================================


sub_B429:				; CODE XREF: sub_B131+13EP
		stb	<unk_2
		addb	<byte_74
		bcc	loc_B431
		ldb	#$FF

loc_B431:				; CODE XREF: sub_B429+4j
		bsr	sub_B3CF
		bne	loc_B438
		sta	<unk_71
		rts
; ---------------------------------------------------------------------------

loc_B438:				; CODE XREF: sub_B429+Aj
		sta	<unk_71
		lda	<byte_37
		beq	locret_B461
		ldb	unk_3D6F
		bitb	#8
		beq	locret_B461
		adda	#$AF ; 'Ø'
		jsr	_MIDITransmitA
		lda	#$21 ; '!'
		jsr	_MIDITransmitA
		clra
		lsr	<unk_2
		rora
		lsra
		jsr	_MIDITransmitA
		lda	#1
		jsr	_MIDITransmitA
		lda	<unk_2
		jsr	_MIDITransmitA

locret_B461:				; CODE XREF: sub_B429+13j sub_B429+1Aj
		rts
; End of function sub_B429


; =============== S U B	R O U T	I N E =======================================


sub_B462:				; CODE XREF: sub_B131+8DP
		std	<word_0
		lda	<byte_6D
		mul
		addd	#$FF
		tfr	a, b
		lda	<word_0
		jsr	sub_B3CF
		bne	loc_B476
		sta	<unk_6C
		rts
; ---------------------------------------------------------------------------

loc_B476:				; CODE XREF: sub_B462+Fj
		sta	<unk_6C
		lda	<byte_37
		beq	locret_B49F
		ldb	unk_3D6F
		bitb	#$10
		beq	locret_B49F
		adda	#$AF ; 'Ø'
		jsr	_MIDITransmitA
		lda	#$24 ; '$'
		jsr	_MIDITransmitA
		clra
		lsr	<word_0+1
		rora
		lsra
		jsr	_MIDITransmitA
		lda	#4
		jsr	_MIDITransmitA
		lda	<word_0+1
		jsr	_MIDITransmitA

locret_B49F:				; CODE XREF: sub_B462+18j sub_B462+1Fj
		rts
; End of function sub_B462


; =============== S U B	R O U T	I N E =======================================


sub_B4A0:				; CODE XREF: sub_B131+CAP
		addb	<unk_6F
		bcc	loc_B4A6
		ldb	#$FF

loc_B4A6:				; CODE XREF: sub_B4A0+2j
		jsr	sub_B3CF
		bne	loc_B4AE
		sta	<byte_6E
		rts
; ---------------------------------------------------------------------------

loc_B4AE:				; CODE XREF: sub_B4A0+9j
		sta	<byte_6E
		lsra
		cmpa	<byte_70
		beq	locret_B4CC
		sta	<byte_70
		lda	<byte_37
		beq	locret_B4CC
		ldb	unk_3D6F
		bitb	#$20 ; ' '
		beq	locret_B4CC
		adda	#$CF ; 'œ'
		jsr	_MIDITransmitA
		lda	<byte_70
		jsr	_MIDITransmitA

locret_B4CC:				; CODE XREF: sub_B4A0+13j sub_B4A0+19j ...
		rts
; End of function sub_B4A0


; =============== S U B	R O U T	I N E =======================================


sub_B4CD:				; CODE XREF: sub_82C8+40P
		lda	unk_2E04
		bne	loc_B4F6
		ldu	#$2E21
		ldx	#$2E5C
		pulu	y,b,a
		std	,x++
		sty	,x++
		pulu	y,b,a
		std	,x++
		sty	,x++
		ldu	#$2E2E
		ldx	#$2E69
		pulu	y,a
		sta	,x+
		sty	,x++
		jsr	sub_B56A

loc_B4F6:				; CODE XREF: sub_B4CD+3j
		ldd	#$200
		std	unk_2D52
		lda	#$80 ; 'Ä'
		stb	unk_2E71
		sta	unk_2E72
		sta	unk_2E73
		stb	unk_2E6F
		stb	unk_2E74
		comb
		stb	unk_2E6D
		stb	unk_2E66
		stb	unk_2E65
		stb	unk_2E64
		rts
; End of function sub_B4CD

; ---------------------------------------------------------------------------
		lda	#$11
		ldb	unk_2CFC
		cmpb	#5
		bne	loc_B52C
		ldx	#$2E6E
		ldu	#$2E6A
		bra	loc_B552
; ---------------------------------------------------------------------------

loc_B52C:				; CODE XREF: ROM:B522j
		cmpb	#2
		bne	loc_B538
		ldx	#$2E6C
		ldu	#$2E6B
		bra	loc_B552
; ---------------------------------------------------------------------------

loc_B538:				; CODE XREF: ROM:B52Ej
		cmpb	#6
		bne	loc_B567
		ldu	#$2E69
		ldb	,u
		cmpb	#$FF
		bcs	loc_B563
		ldb	unk_2E72
		subb	#$80 ; 'Ä'
		bpl	loc_B54F
		negb
		bmi	loc_B563

loc_B54F:				; CODE XREF: ROM:B54Aj
		rolb
		bra	loc_B55A
; ---------------------------------------------------------------------------

loc_B552:				; CODE XREF: ROM:B52Aj	ROM:B536j
		ldb	,u
		cmpb	#$FF
		bcs	loc_B563
		ldb	,x

loc_B55A:				; CODE XREF: ROM:B550j
		stb	,u
		cmpb	#$FF
		bcc	loc_B563
		jmp	sub_B82E
; ---------------------------------------------------------------------------

loc_B563:				; CODE XREF: ROM:B543j	ROM:B54Dj ...
		ldb	#$FF
		stb	,u

loc_B567:				; CODE XREF: ROM:B53Aj
		jmp	sub_B83B

; =============== S U B	R O U T	I N E =======================================


sub_B56A:				; CODE XREF: sub_B4CD+26P
					; ROM:loc_D437P
		lda	#$11
		ldb	unk_2CFC
		cmpb	#5
		bne	loc_B578
		ldb	unk_2E6A
		bra	loc_B588
; ---------------------------------------------------------------------------

loc_B578:				; CODE XREF: sub_B56A+7j
		cmpb	#2
		bne	loc_B581
		ldb	unk_2E6B
		bra	loc_B588
; ---------------------------------------------------------------------------

loc_B581:				; CODE XREF: sub_B56A+10j
		cmpb	#6
		bne	loc_B58F
		ldb	unk_2E69

loc_B588:				; CODE XREF: sub_B56A+Cj sub_B56A+15j
		cmpb	#$FF
		beq	loc_B58F
		jmp	sub_B82E
; ---------------------------------------------------------------------------

loc_B58F:				; CODE XREF: sub_B56A+19j sub_B56A+20j
		jmp	sub_B83B
; End of function sub_B56A

; ---------------------------------------------------------------------------
		lda	#$80 ; 'Ä'
		sta	unk_2CF6

loc_B597:				; CODE XREF: ROM:B612J	ROM:B619j ...
		jsr	sub_B6A7
		jsr	unk_CE76
		lda	unk_128
		anda	#$30 ; '0'
		cmpa	unk_2CF6
		beq	loc_B5FC
		tsta
		beq	loc_B5D4
		cmpa	#$20 ; ' '
		beq	loc_B5BC
		sta	unk_2CF6
		ldd	#$4E4F
		ldu	#$2043
		jsr	loc_CCE2
		bra	loc_B5F6
; ---------------------------------------------------------------------------

loc_B5BC:				; CODE XREF: ROM:B5ACj
		oraa	#$80 ; 'Ä'
		sta	unk_2CF6
		ldu	#$B695
		bra	loc_B5DC
; ---------------------------------------------------------------------------

loc_B5C6:				; CODE XREF: ROM:B5E3j
		ldd	#$432D
		ldu	#$4552
		jsr	loc_CCE2
		ldd	#$78 ; 'x'
		bra	loc_B5F9
; ---------------------------------------------------------------------------

loc_B5D4:				; CODE XREF: ROM:B5A8j
		oraa	#$80 ; 'Ä'
		sta	unk_2CF6
		ldu	#$B69E

loc_B5DC:				; CODE XREF: ROM:B5C4j
		bsr	sub_B650
		beq	loc_B5FC
		cmpd	,x
		bne	loc_B5C6
		lda	unk_2CF6
		anda	#$30 ; '0'
		sta	unk_2CF6
		ldd	#$432D
		ldu	#$4F4B
		jsr	loc_CCE2

loc_B5F6:				; CODE XREF: ROM:B5BAj
		ldd	#$BB8

loc_B5F9:				; CODE XREF: ROM:B5D2j
		std	unk_2CF7

loc_B5FC:				; CODE XREF: ROM:B5A5j	ROM:B5DEj
		ldu	#$B683
		lda	[,u]
		bne	loc_B609
		bsr	sub_B62D
		leau	9,u
		bsr	sub_B62D

loc_B609:				; CODE XREF: ROM:B601j
		ldu	#$B695
		lda	[,u]
		bne	loc_B615
		bsr	sub_B62D
		jmp	loc_B597
; ---------------------------------------------------------------------------

loc_B615:				; CODE XREF: ROM:B60Ej
		leau	9,u
		lda	[,u]
		lbne	loc_B597
		lda	#$FF
		sta	[,u]
		ldd	#$4D2D
		ldu	#$4552
		jsr	loc_CCE2
		jmp	loc_B597

; =============== S U B	R O U T	I N E =======================================


sub_B62D:				; CODE XREF: ROM:B603p	ROM:B607p ...
		lda	#$7F ; ''
		sta	[,u]
		bsr	sub_B650
		beq	locret_B64F
		coma
		std	,x
		cmpa	,x
		beq	loc_B649
		pshs	x,u
		ldd	#$572D
		ldu	#$4552
		jsr	loc_CCE2
		puls	u,x

loc_B649:				; CODE XREF: sub_B62D+Dj
		com	,x
		lda	#$FF
		sta	[,u]

locret_B64F:				; CODE XREF: sub_B62D+6j
		rts
; End of function sub_B62D


; =============== S U B	R O U T	I N E =======================================


sub_B650:				; CODE XREF: ROM:813EP	ROM:8159P ...
		clra
		pshs	a
		ldx	5,u
		ldd	3,u
		bra	loc_B66B
; ---------------------------------------------------------------------------

loc_B659:				; CODE XREF: sub_B650+13j sub_B650+26j
		addb	,x+
		adca	#0
		cmpx	7,u
		beq	loc_B67A
		dec	,s
		bne	loc_B659
		pshs	a,b,x,u
		bsr	sub_B6A7
		puls	u,x,b,a

loc_B66B:				; CODE XREF: sub_B650+7j
		pshs	a,b
		ldb	2,u
		jsr	sub_A127
		lda	[,u]
		puls	b,a
		bne	loc_B659
		puls	pc,a
; ---------------------------------------------------------------------------

loc_B67A:				; CODE XREF: sub_B650+Fj
		leas	1,s
		nega
		negb
		sbca	#0
		tst	[,u]
		rts
; End of function sub_B650

; ---------------------------------------------------------------------------
		fcb $29	; )
		fcb 5, $40, $31, $31, $40, 0, $4F, $64,	$29, 5,	$40, $31
		fcb $31, $60, 0, $6F, $64, $29,	6, $C0,	$31, $31, $40
		fcb 0, $4F, $64, $29, 7, $80, 0, 0, $40, 0, $7F, $FE

; =============== S U B	R O U T	I N E =======================================


sub_B6A7:				; CODE XREF: ROM:loc_B597P
					; sub_B650+17p
		jsr	sub_B6B8
		jsr	sub_B974
		lda	unk_2CF3
		beq	loc_B6B5
		dec	unk_2CF3

loc_B6B5:				; CODE XREF: sub_B6A7+9j
		jmp	sub_81CD
; End of function sub_B6A7


; =============== S U B	R O U T	I N E =======================================


sub_B6B8:				; CODE XREF: sub_B6A7P
		jmp	[unk_2CF4]
; End of function sub_B6B8

; ---------------------------------------------------------------------------
		lda	unk_122
		bita	#$80 ; 'Ä'
		beq	loc_B6CA

loc_B6C3:				; CODE XREF: ROM:B6E0j	ROM:B737J
		ldx	#$B6BC
		stx	unk_2CF4
		rts
; ---------------------------------------------------------------------------

loc_B6CA:				; CODE XREF: ROM:B6C1j
		lda	#2
		sta	unk_2CF3

loc_B6CF:				; CODE XREF: ROM:B6D9j
		ldx	#$B6D6
		stx	unk_2CF4
		rts
; ---------------------------------------------------------------------------
		tst	unk_2CF3
		bne	loc_B6CF
		lda	unk_122
		bita	#$80 ; 'Ä'
		bne	loc_B6C3
		lda	#1
		tfr	a, dp
		sta	<unk_19
		lda	#$3F ; '?'
		sta	<byte_20
		sta	<unk_1B
		clra
		sta	<byte_20
		ldb	#$10

loc_B6F3:				; CODE XREF: ROM:B6FEj
		lda	<unk_22
		anda	#$3F ; '?'
		eora	#$3F ; '?'
		bne	loc_B702
		sta	<unk_1B
		decb
		bne	loc_B6F3
		bra	loc_B70E
; ---------------------------------------------------------------------------

loc_B702:				; CODE XREF: ROM:B6F9j
		subb	#$10
		negb

loc_B705:				; CODE XREF: ROM:B70Aj
		lsra
		bcs	loc_B70C
		addb	#$10
		bra	loc_B705
; ---------------------------------------------------------------------------

loc_B70C:				; CODE XREF: ROM:B706j
		bsr	_SysExSwitch

loc_B70E:				; CODE XREF: ROM:B700j
		jsr	sub_B9A6

loc_B711:				; CODE XREF: ROM:B71Dj
		ldx	#$B718
		stx	unk_2CF4
		rts
; ---------------------------------------------------------------------------
		lda	unk_122
		bita	#$80 ; 'Ä'
		beq	loc_B711

loc_B71F:				; CODE XREF: ROM:B735j
		lda	#2
		sta	unk_2CF3

loc_B724:				; CODE XREF: ROM:B72Ej
		ldx	#$B72B
		stx	unk_2CF4
		rts
; ---------------------------------------------------------------------------
		tst	unk_2CF3
		bne	loc_B724
		lda	unk_122
		bita	#$80 ; 'Ä'
		beq	loc_B71F
		jmp	loc_B6C3

; =============== S U B	R O U T	I N E =======================================


_SysExSwitch:				; CODE XREF: ROM:loc_B70Cp
		lda	unk_3D6F
		bita	#1
		bne	sub_B76A
		bita	#$80 ; 'Ä'
		beq	sub_B76A
		pshs	b,x
		ldx	#_SysExSwitchBuffer

loc_B74A:				; CODE XREF: _SysExSwitch+18j
		lda	,x+
		jsr	_MIDITransmitA
		cmpx	#$B7AE
		bcs	loc_B74A
		lda	,s
		anda	#$F
		oraa	,x+
		jsr	_MIDITransmitA
		lda	,s
		lsra
		lsra
		lsra
		lsra
		oraa	,x
		jsr	_MIDITransmitA
		puls	x,b
; End of function _SysExSwitch


; =============== S U B	R O U T	I N E =======================================


sub_B76A:				; CODE XREF: _SysExSwitch+5j
					; _SysExSwitch+9j ...
		lda	unk_2CB6
		cmpa	#8
		bcs	loc_B772
		rts
; ---------------------------------------------------------------------------

loc_B772:				; CODE XREF: sub_B76A+5j
		pshs	x
		ldx	unk_2CB9
		stb	,x+
		inca
		sta	unk_2CB6
		cmpx	#$2CC3
		bcs	loc_B785
		ldx	#$2CBB

loc_B785:				; CODE XREF: sub_B76A+16j
		stx	unk_2CB9
		puls	pc,x
; End of function sub_B76A


; =============== S U B	R O U T	I N E =======================================


sub_B78A:				; CODE XREF: ROM:823DP
					; sub_89E0:loc_8A2EP
		lda	unk_2CB6
		bne	loc_B790
		rts
; ---------------------------------------------------------------------------

loc_B790:				; CODE XREF: sub_B78A+3j
		ldx	unk_2CB7
		ldb	,x+
		deca
		sta	unk_2CB6
		cmpx	#$2CC3
		bcs	loc_B7A1
		ldx	#$2CBB

loc_B7A1:				; CODE XREF: sub_B78A+12j
		stx	unk_2CB7
		rts
; End of function sub_B78A

; ---------------------------------------------------------------------------
_SysExSwitchBuffer:fcb $F0 ; 		; DATA XREF: _SysExSwitch+Do
		fcb $25	; %
		fcb 1
		fcb $73	; s
		fcb $67	; g
		fcb $50	; P
		fcb $40	; @
		fcb $31	; 1
		fcb $20
		fcb $10
		fcb   0

; =============== S U B	R O U T	I N E =======================================


sub_B7B0:				; CODE XREF: ROM:810BP
		ldx	#$B6BC
		stx	unk_2CF4
		ldx	#$2CBB
		stx	unk_2CB9
		stx	unk_2CB7

loc_B7BF:				; CODE XREF: ROM:821AP
		clra
		ldb	#$2C ; ','
		ldx	#$2CC3

loc_B7C5:				; CODE XREF: sub_B7B0+18j
		sta	,x+
		decb
		bne	loc_B7C5
		lda	#0
		jsr	sub_B82E
		lda	unk_2CFC
		beq	locret_B7DE
		lda	#5
		jsr	sub_B82E
		lda	#7
		jmp	sub_B82E
; ---------------------------------------------------------------------------

locret_B7DE:				; CODE XREF: sub_B7B0+22j
		rts
; End of function sub_B7B0


; =============== S U B	R O U T	I N E =======================================


sub_B7DF:				; CODE XREF: ROM:A67BP	ROM:A692P ...
		lda	unk_3D51
		subb	#$12
		bne	loc_B7ED
		bita	#$80 ; 'Ä'
		bne	loc_B7ED

loc_B7EA:				; CODE XREF: sub_B7DF+34j
		ldb	#$41 ; 'A'
		rts
; ---------------------------------------------------------------------------

loc_B7ED:				; CODE XREF: sub_B7DF+5j sub_B7DF+9j
		cmpb	#$14
		bcs	loc_B818
		subb	#$12
		bita	#$80 ; 'Ä'
		beq	loc_B80A
		orab	#$40 ; '@'
		lda	unk_128
		anda	#$30 ; '0'
		cmpa	#$20 ; ' '
		bne	locret_B82B
		lda	unk_2CF6
		bmi	locret_B82B
		orab	#$80 ; 'Ä'
		rts
; ---------------------------------------------------------------------------

loc_B80A:				; CODE XREF: sub_B7DF+16j
		bita	#$40 ; '@'
		beq	loc_B810
		addb	#$A

loc_B810:				; CODE XREF: sub_B7DF+2Dj
		cmpb	unk_2002
		bhi	loc_B7EA
		orab	#$40 ; '@'
		rts
; ---------------------------------------------------------------------------

loc_B818:				; CODE XREF: sub_B7DF+10j
		incb
		bita	#$80 ; 'Ä'
		beq	locret_B82B
		lda	unk_128
		anda	#$30 ; '0'
		bne	locret_B82B
		lda	unk_2CF6
		bmi	locret_B82B
		orab	#$80 ; 'Ä'
; End of function sub_B7DF

; START	OF FUNCTION CHUNK FOR sub_B868

locret_B82B:				; CODE XREF: sub_B7DF+21j sub_B7DF+26j ...
		rts
; END OF FUNCTION CHUNK	FOR sub_B868
; ---------------------------------------------------------------------------
		bcc	sub_B83B

; =============== S U B	R O U T	I N E =======================================


sub_B82E:				; CODE XREF: ROM:A689J	ROM:B560J ...
		jsr	sub_B941
		orab	a,x

loc_B833:				; CODE XREF: sub_B83B+6j sub_B843+5j
		stb	a,x
		clr	byte_2CC3
		rts
; End of function sub_B82E


; =============== S U B	R O U T	I N E =======================================


sub_B839:				; CODE XREF: ROM:loc_84CDP
					; sub_B868+3Ep	...
		bne	sub_B82E
; End of function sub_B839


; =============== S U B	R O U T	I N E =======================================


sub_B83B:				; CODE XREF: ROM:84D4J	sub_A319+27P ...
		jsr	sub_B941
		comb
		andb	a,x
		bra	loc_B833
; End of function sub_B83B


; =============== S U B	R O U T	I N E =======================================


sub_B843:				; CODE XREF: ROM:D423P
		jsr	sub_B941
		eorb	a,x
		bra	loc_B833
; End of function sub_B843


; =============== S U B	R O U T	I N E =======================================


sub_B84A:				; CODE XREF: sub_82C8+12P
		cmpa	#8
		bcs	loc_B850
		suba	#8

loc_B850:				; CODE XREF: sub_B84A+2j
		adda	#$38 ; '8'
		bra	sub_B83B
; End of function sub_B84A


; =============== S U B	R O U T	I N E =======================================


sub_B854:				; CODE XREF: sub_82C8+17P
		cmpa	#8
		bcs	loc_B860
		adda	#$30 ; '0'
		bsr	sub_B82E
		lda	#$35 ; '5'
		bra	sub_B82E
; ---------------------------------------------------------------------------

loc_B860:				; CODE XREF: sub_B854+2j
		adda	#$38 ; '8'
		bsr	sub_B82E
		lda	#$35 ; '5'
		bra	sub_B83B
; End of function sub_B854


; =============== S U B	R O U T	I N E =======================================


sub_B868:				; CODE XREF: ROM:A697P	ROM:A6CCP ...

; FUNCTION CHUNK AT B82B SIZE 00000001 BYTES

		ldb	unk_3D51
		andb	#$3F ; '?'
		bita	#$80 ; 'Ä'
		beq	loc_B873
		orab	#$80 ; 'Ä'

loc_B873:				; CODE XREF: sub_B868+7j
		bita	#$40 ; '@'
		beq	loc_B891
		anda	#$1F
		deca
		bmi	locret_B82B
		cmpa	#$B
		bcs	loc_B886
		suba	#$B
		orab	#$40 ; '@'
		bra	loc_B88D
; ---------------------------------------------------------------------------

loc_B886:				; CODE XREF: sub_B868+16j
		deca
		bpl	loc_B88D
		lda	#$12
		bra	loc_B89A
; ---------------------------------------------------------------------------

loc_B88D:				; CODE XREF: sub_B868+1Cj sub_B868+1Fj
		adda	#$26 ; '&'
		bra	loc_B89A
; ---------------------------------------------------------------------------

loc_B891:				; CODE XREF: sub_B868+Dj
		anda	#$1F
		deca
		lbmi	locret_B82B
		adda	#$12

loc_B89A:				; CODE XREF: sub_B868+23j sub_B868+27j
		stb	unk_3D51
		bsr	sub_B82E
		lda	#$10
		ldb	unk_3D51
		bitb	#$80 ; 'Ä'
		bsr	sub_B839
		lda	#$37 ; '7'
		ldb	unk_3D51
		bitb	#$40 ; '@'
		bra	sub_B839
; End of function sub_B868


; =============== S U B	R O U T	I N E =======================================


sub_B8B1:				; CODE XREF: sub_D354P
		ldy	#$2CC4
		ldx	#$B8C7
		ldb	#$10

loc_B8BA:				; CODE XREF: sub_B8B1+10j
		lda	,y
		anda	,x+
		sta	,y+
		decb
		bne	loc_B8BA
		stb	byte_2CC3
		rts
; End of function sub_B8B1

; ---------------------------------------------------------------------------
		fcb   3
		fcb   3
		fcb 1, 1, 1, 9,	9, 9, 9, 9, 9, 9, 9, 9,	9, 9

; =============== S U B	R O U T	I N E =======================================


sub_B8D7:				; CODE XREF: ROM:A3B8P
		ldu	#$2CE9
		lda	#5
		jmp	sub_8C2F
; End of function sub_B8D7


; =============== S U B	R O U T	I N E =======================================


sub_B8DF:				; CODE XREF: ROM:A3C9P
		ldu	#$2CE9
		jmp	sub_8C56
; End of function sub_B8DF

; ---------------------------------------------------------------------------

loc_B8E5:				; CODE XREF: ROM:8191J
		ldd	#$78 ; 'x'
		std	unk_2CF7

loc_B8EB:				; CODE XREF: ROM:B909j
		jsr	unk_CE39
		clr	unk_2CD4
		ldx	#$B90C
		bsr	sub_B92C
		lda	unk_2CB6
		bne	locret_B90B
		jsr	unk_CE52
		com	unk_2CD4
		ldx	#$B91C
		bsr	sub_B92C
		lda	unk_2CB6
		beq	loc_B8EB

locret_B90B:				; CODE XREF: ROM:B8F9j
		rts
; ---------------------------------------------------------------------------
		fcb  $C
		fcb  $C
		fcb $D,	$D, $C,	4, 5, 5, 4, 4, 4, 0, $A, $A, $A, $A, 3
		fcb 3, 2, 2, 3,	$B, $A,	$A, $B,	$B, $B,	$F, 5, 5, 5, 5

; =============== S U B	R O U T	I N E =======================================


sub_B92C:				; CODE XREF: ROM:B8F4p	ROM:B904p
		ldb	#$10
		ldu	#$2CC4

loc_B931:				; CODE XREF: sub_B92C+Aj
		lda	,x+
		sta	,u+
		decb
		bne	loc_B931
		jsr	sub_B9A6
		ldx	unk_2CF7
		jmp	sub_8195
; End of function sub_B92C


; =============== S U B	R O U T	I N E =======================================


sub_B941:				; CODE XREF: sub_B82EP	sub_B83BP ...
		ldx	#$2CC4
		cmpa	#$10
		bcc	loc_B94C
		cmpa	#8
		bcc	loc_B95A

loc_B94C:				; CODE XREF: sub_B941+5j
		ldb	#1

loc_B94E:				; CODE XREF: sub_B941+17j
		cmpa	#$10
		bcc	loc_B955
		andb	#$3F ; '?'
		rts
; ---------------------------------------------------------------------------

loc_B955:				; CODE XREF: sub_B941+Fj
		suba	#$10
		aslb
		bra	loc_B94E
; ---------------------------------------------------------------------------

loc_B95A:				; CODE XREF: sub_B941+9j
		ldx	#$2CD4
		ldb	unk_2CFC
		cmpb	#$13
		bls	loc_B966
		ldb	#$13

loc_B966:				; CODE XREF: sub_B941+21j
		leax	b,x
		ldb	#1
		suba	#8

loc_B96C:				; CODE XREF: sub_B941+2Fj
		deca
		bmi	loc_B972
		aslb
		bcc	loc_B96C

loc_B972:				; CODE XREF: sub_B941+2Cj
		clra
		rts
; End of function sub_B941


; =============== S U B	R O U T	I N E =======================================


sub_B974:				; CODE XREF: sub_B6A7+3P
		ldu	#$2CE9
		ldb	,u
		beq	loc_B9A0
		lda	unk_2D87
		bne	loc_B9A0
		ldy	#$B82E
		com	-1,u
		bne	loc_B98C
		ldy	#$B83B

loc_B98C:				; CODE XREF: sub_B974+12j
		pshs	b

loc_B98E:				; CODE XREF: sub_B974+23j
		lda	b,u
		jsr	,y
		ldb	,s
		decb
		stb	,s
		bne	loc_B98E
		leas	1,s
		lda	#$A
		sta	unk_2D87

loc_B9A0:				; CODE XREF: sub_B974+5j sub_B974+Aj
		tst	byte_2CC3
		beq	sub_B9A6
		rts
; End of function sub_B974


; =============== S U B	R O U T	I N E =======================================


sub_B9A6:				; CODE XREF: ROM:loc_B70EP sub_B92C+CP ...
		ldu	#$2CD4
		ldb	unk_2CFC
		cmpb	#$13
		bls	loc_B9B2
		ldb	#$13

loc_B9B2:				; CODE XREF: sub_B9A6+8j
		ldb	b,u
		pshs	b
		ldx	#$2CCC
		ldb	#8

loc_B9BB:				; CODE XREF: sub_B9A6+20j
		lda	,x
		anda	#$FE ; '˛'
		lsr	,s
		adca	#0
		sta	,x+
		decb
		bne	loc_B9BB
		ldx	#$2CD4
		lda	#1
		tfr	a, dp
		ldb	#$10

loc_B9D1:				; CODE XREF: sub_B9A6+34j
		lda	,-x
		sta	unk_120
		sta	unk_11B
		decb
		bne	loc_B9D1
		comb
		stb	,-x
		puls	pc,a
; End of function sub_B9A6

; ---------------------------------------------------------------------------

_MIDIFnSystemReset:			; CODE XREF: ROM:B9E9j
					; DATA XREF: ROM:_MIDITableo
		jsr	sub_81CD
		lda	unk_3D6E
		bita	#1
		bne	_MIDIFnSystemReset
; START	OF FUNCTION CHUNK FOR _MIDIFnToneOn

_MIDITableHandler:			; CODE XREF: _MIDIFnToneOn-4Bj
					; _MIDIFnToneOn-36j ...
		bsr	sub_BA31
		bpl	_MIDITableHandler

loc_B9EF:				; CODE XREF: _MIDIFnToneOn+4j
					; _MIDIFnToneOn+Bj ...
		ldx	#_MIDITable
		ldb	#$A

loc_B9F4:				; CODE XREF: _MIDIFnToneOn-38j
		lda	unk_2A09
		anda	,x+
		cmpa	,x+
		beq	loc_BA04
		leax	2,x
		decb
		bne	loc_B9F4
		bra	_MIDITableHandler
; ---------------------------------------------------------------------------

loc_BA04:				; CODE XREF: _MIDIFnToneOn-3Dj
		lda	unk_2A09
		jmp	[,x]
; END OF FUNCTION CHUNK	FOR _MIDIFnToneOn
; ---------------------------------------------------------------------------
_MIDITable:	MIDIVoice <$F0,	%10010000, _MIDIFnToneOn>
					; DATA XREF: _MIDIFnToneOn:loc_B9EFo
		MIDIVoice <$F0,	%10000000, _MIDIFnToneOff>
		MIDIVoice <$F0,	%10110000, _MIDIFnWheel2>
		MIDIVoice <$F0,	%11100000, _MIDIFnWheel1>
		MIDIVoice <$F0,	%11010000, _MIDIFnAfterTouch>
		MIDIVoice <$F0,	%11000000, _MIDIFnProgram>
		MIDIVoice <$FF,	%11110000, _MIDIFnSysExStart>
		MIDIVoice <$FF,	%11110111, _MIDIFnSysExEnd>
		MIDIVoice <$FF,	%11110110, _MIDIFnTuning>
		MIDIVoice <$FF,	%11111111, _MIDIFnSystemReset>

; =============== S U B	R O U T	I N E =======================================


sub_BA31:				; CODE XREF: _MIDIFnToneOn:_MIDITableHandlerp
					; _MIDIFnToneOn:loc_BA3Ap ...
		jsr	sub_FB4B
		sta	unk_2A09
		rts
; End of function sub_BA31


; =============== S U B	R O U T	I N E =======================================


_MIDIFnToneOn:				; DATA XREF: ROM:_MIDITableo

; FUNCTION CHUNK AT B9EB SIZE 0000001E BYTES

		bsr	sub_BA7B

loc_BA3A:				; CODE XREF: _MIDIFnToneOn+12j
					; _MIDIFnToneOn+21j ...
		bsr	sub_BA31
		bmi	loc_B9EF
		sta	unk_2909
		bsr	sub_BA31
		bmi	loc_B9EF
		lda	unk_3D6E
		bita	#2
		beq	loc_BA3A
		lda	unk_2908
		ldb	unk_2A0B
		beq	loc_BA5E
		ldx	#$3D56
		lda	a,x
		beq	loc_BA3A
		deca
		bra	loc_BA60
; ---------------------------------------------------------------------------

loc_BA5E:				; CODE XREF: _MIDIFnToneOn+1Aj
		adda	#8

loc_BA60:				; CODE XREF: _MIDIFnToneOn+24j
		sta	unk_10D3
		jsr	sub_8290
		lda	4,x
		beq	loc_BA3A
		stx	unk_10D5
		bsr	_MIDINoteCheck
		bne	loc_BA76
		jsr	_NoteFn1
		bra	loc_BA3A
; ---------------------------------------------------------------------------

loc_BA76:				; CODE XREF: _MIDIFnToneOn+37j
		jsr	_NoteFn2
		bra	loc_BA3A
; End of function _MIDIFnToneOn


; =============== S U B	R O U T	I N E =======================================


sub_BA7B:				; CODE XREF: _MIDIFnToneOnp
					; _MIDIFnToneOffp ...
		ldb	unk_2A0A
		beq	loc_BA87
		anda	#$F
		sta	unk_2908
		bra	locret_BA8D
; ---------------------------------------------------------------------------

loc_BA87:				; CODE XREF: sub_BA7B+3j
		lda	unk_3D55
		sta	unk_2908

locret_BA8D:				; CODE XREF: sub_BA7B+Aj
		rts
; End of function sub_BA7B


; =============== S U B	R O U T	I N E =======================================


_MIDIFnToneOff:				; DATA XREF: ROM:_MIDITableo
		bsr	sub_BA7B

loc_BA90:				; CODE XREF: _MIDIFnToneOff+16j
					; _MIDIFnToneOff+25j ...
		bsr	sub_BA31
		lbmi	loc_B9EF
		sta	unk_2909
		bsr	sub_BA31
		lbmi	loc_B9EF
		lda	unk_3D6E
		bita	#2
		beq	loc_BA90
		lda	unk_2908
		ldb	unk_2A0B
		beq	loc_BAB8
		ldx	#$3D56
		lda	a,x
		beq	loc_BA90
		deca
		bra	loc_BABA
; ---------------------------------------------------------------------------

loc_BAB8:				; CODE XREF: _MIDIFnToneOff+1Ej
		adda	#8

loc_BABA:				; CODE XREF: _MIDIFnToneOff+28j
		sta	unk_10D3
		jsr	sub_8290
		lda	4,x
		beq	loc_BA90
		stx	unk_10D5
		bsr	_MIDINoteCheck
		jsr	_NoteFn1
		bra	loc_BA90
; End of function _MIDIFnToneOff


; =============== S U B	R O U T	I N E =======================================


_MIDINoteCheck:				; CODE XREF: _MIDIFnToneOn+35p
					; _MIDIFnToneOff+39p
		lda	unk_2909
		suba	#$24 ; '$'      ; Note C1 (lowest)?
		bpl	loc_BAD9

_MIDINoteNegative:			; CODE XREF: _MIDINoteCheck+9j
		adda	#12		; Scale	up to above C1
		bmi	_MIDINoteNegative ; Scale up to	above C1

loc_BAD9:				; CODE XREF: _MIDINoteCheck+5j
		ldb	unk_2A09
		rts
; End of function _MIDINoteCheck


; =============== S U B	R O U T	I N E =======================================


_MIDIFnWheel2:				; DATA XREF: ROM:_MIDITableo
		sta	unk_2908
		anda	#$F
		cmpa	unk_3D55
		lbne	_MIDITableHandler

loc_BAE9:				; CODE XREF: _MIDIFnWheel2+43j
					; ROM:BB56j ...
		jsr	sub_BA31
		lbmi	loc_B9EF
		sta	unk_2909
		jsr	sub_BA31
		lbmi	loc_B9EF
		lda	unk_3D6F
		bita	#2
		bne	loc_BB13
		lda	unk_2908
		jsr	_MIDITransmitA
		lda	unk_2909
		jsr	_MIDITransmitA
		lda	unk_2A09
		jsr	_MIDITransmitA

loc_BB13:				; CODE XREF: _MIDIFnWheel2+22j
		ldx	#_NoteMapping
		ldb	#11
		lda	unk_2909	; MIDI note? - normal note range = [0x24,0x61]
		bra	loc_BB22
; ---------------------------------------------------------------------------

loc_BB1D:				; CODE XREF: _MIDIFnWheel2+47j
		leax	3,x
		decb
		beq	loc_BAE9

loc_BB22:				; CODE XREF: _MIDIFnWheel2+3Ej
		cmpa	,x
		bne	loc_BB1D
		jmp	[1,x]
; End of function _MIDIFnWheel2

; ---------------------------------------------------------------------------
_NoteMapping:	NoteMapEntry <$7B, $BB4A> ; DATA XREF: _MIDIFnWheel2:loc_BB13o
		NoteMapEntry <$7C, $BB58>
		NoteMapEntry <$7D, $BB5C>
		NoteMapEntry <$7E, $BB4A>
		NoteMapEntry <$7F, $BB4A>
		NoteMapEntry <1, $BB65>
		NoteMapEntry <$21, $BB75>
		NoteMapEntry <4, $BB81>
		NoteMapEntry <$24, $BB91>
		NoteMapEntry <$40, $BBCF>
		NoteMapEntry <$41, $BBB8>
; ---------------------------------------------------------------------------

loc_BB4A:				; CODE XREF: ROM:BB63j
		ldd	#$817
		tst	unk_2A0B
		beq	loc_BB53
		clra

loc_BB53:				; CODE XREF: ROM:BB50j
		jsr	sub_95E1
		bra	loc_BAE9
; ---------------------------------------------------------------------------
		lda	#$FF
		bra	loc_BB5D
; ---------------------------------------------------------------------------
		clra

loc_BB5D:				; CODE XREF: ROM:BB5Aj
		sta	unk_2A0A
		jsr	byte_F642+$155
		bra	loc_BB4A
; ---------------------------------------------------------------------------
		lda	unk_2E74
		ldb	unk_3D6E
		bitb	#8
		bsr	sub_BB9D

loc_BB6F:				; CODE XREF: ROM:BB7Fj
		sta	unk_2E74
		jmp	loc_BAE9
; ---------------------------------------------------------------------------
		lda	unk_2E74
		ldb	unk_3D6E
		bitb	#8
		bsr	loc_BBAA
		bra	loc_BB6F
; ---------------------------------------------------------------------------
		lda	unk_2E6D
		ldb	unk_3D6E
		bitb	#$10
		bsr	sub_BB9D

loc_BB8B:				; CODE XREF: ROM:BB9Bj
		sta	unk_2E6D
		jmp	loc_BAE9
; ---------------------------------------------------------------------------
		ldb	unk_3D6E
		lda	unk_2E6D
		bitb	#$10
		bsr	loc_BBAA
		bra	loc_BB8B

; =============== S U B	R O U T	I N E =======================================


sub_BB9D:				; CODE XREF: ROM:BB6Dp	ROM:BB89p
		beq	loc_BBB6

loc_BB9F:				; CODE XREF: _MIDIFnWheel1+30p
		anda	#1
		pshs	a
		lda	unk_2A09
		asla
		oraa	,s+
		rts
; ---------------------------------------------------------------------------

loc_BBAA:				; CODE XREF: ROM:BB7Dp	ROM:BB99p
		beq	loc_BBB6

loc_BBAC:				; CODE XREF: _MIDIFnWheel1+21p
		anda	#$FE ; '˛'
		ldb	unk_2A09
		aslb
		aslb
		adca	#0
		rts
; ---------------------------------------------------------------------------

loc_BBB6:				; CODE XREF: sub_BB9Dj
					; sub_BB9D:loc_BBAAj
		clra
		rts
; End of function sub_BB9D

; ---------------------------------------------------------------------------
		fcb $B6	; ∂
		fcb $3D	; =
		fcb $6E	; n
		fcb $85	; Ö
		fcb $10
		fcb $27	; '
		fcb  $D
		fcb $B6	; ∂
		fcb $2A	; *
		fcb   9
		fcb $27	; '
		fcb   5
		fcb $BD	; Ω
		fcb $C0	; ¿
		fcb $11
		fcb $20
		fcb   3
		fcb $BD	; Ω
		fcb $BF	; ø
		fcb $F6	; ˆ
		fcb $7E	; ~
		fcb $BA	; ∫
		fcb $E9	; È
		fcb $B6	; ∂
		fcb $3D	; =
		fcb $6E	; n
		fcb $85	; Ö
		fcb $10
		fcb $27	; '
		fcb $F6	; ˆ
		fcb $B6	; ∂
		fcb $2A	; *
		fcb   9
		fcb $27	; '
		fcb   5
		fcb $BD	; Ω
		fcb $BF	; ø
		fcb $9E	; û
		fcb $20
		fcb $EC	; Ï
		fcb $BD	; Ω
		fcb $BF	; ø
		fcb $83	; É
		fcb $20
		fcb $E7	; Á

; =============== S U B	R O U T	I N E =======================================


_MIDIFnWheel1:				; DATA XREF: ROM:_MIDITableo
		ldb	unk_3D6E
		bitb	#4
		lbeq	_MIDITableHandler
		ldb	unk_2A0A
		bne	loc_BBFC
		anda	#$F
		cmpa	unk_3D55
		lbne	_MIDITableHandler

loc_BBFC:				; CODE XREF: _MIDIFnWheel1+Cj
					; _MIDIFnWheel1+35j
		jsr	sub_BA31
		lbmi	loc_B9EF
		lda	unk_2E73
		bsr	loc_BBAC
		sta	unk_2E73
		jsr	sub_BA31
		lbmi	loc_B9EF
		lda	unk_2E73
		bsr	loc_BB9F
		sta	unk_2E73
		bra	loc_BBFC
; End of function _MIDIFnWheel1


; =============== S U B	R O U T	I N E =======================================


_MIDIFnAfterTouch:			; DATA XREF: ROM:_MIDITableo
		ldb	unk_3D6E
		bitb	#$20 ; ' '
		lbeq	_MIDITableHandler
		ldb	unk_2A0A
		bne	loc_BC33
		anda	#$F
		cmpa	unk_3D55
		lbne	_MIDITableHandler

loc_BC33:				; CODE XREF: _MIDIFnAfterTouch+Cj
					; _MIDIFnAfterTouch+22j
		jsr	sub_BA31
		lbmi	loc_B9EF
		asla
		sta	unk_2E6F
		bra	loc_BC33
; End of function _MIDIFnAfterTouch


; =============== S U B	R O U T	I N E =======================================


_MIDIFnProgram:				; DATA XREF: ROM:_MIDITableo
		jsr	sub_BA7B

loc_BC43:				; CODE XREF: _MIDIFnProgram+Fj
					; _MIDIFnProgram+34j
		jsr	sub_BA31
		lbmi	loc_B9EF
		ldb	unk_3D6E
		bitb	#$40 ; '@'
		beq	loc_BC43
		ldb	#$41 ; 'A'
		tsta
		beq	loc_BC6C
		ldb	#1
		cmpa	#$28 ; '('
		bcs	loc_BC60
		addb	#$80 ; 'Ä'
		suba	#$28 ; '('

loc_BC60:				; CODE XREF: _MIDIFnProgram+1Aj
		cmpa	#$14
		bcs	loc_BC68
		addb	#$41 ; 'A'
		suba	#$14

loc_BC68:				; CODE XREF: _MIDIFnProgram+22j
		pshs	a
		addb	,s+

loc_BC6C:				; CODE XREF: _MIDIFnProgram+14j
		lda	unk_2908
		adda	#8
		jsr	sub_84F7
		bra	loc_BC43
; End of function _MIDIFnProgram

; ---------------------------------------------------------------------------

_MIDIFnTuning:				; DATA XREF: ROM:_MIDITableo
		lda	#12
		sta	unk_3D52	; shift?
		clr	unk_3D53	; pitch?
		jmp	_MIDITableHandler

; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

_MIDIFnSysExEnd:			; CODE XREF: ROM:BC89j	ROM:BC90j
					; DATA XREF: ...
		jmp	_MIDITableHandler
; End of function _MIDIFnSysExEnd

; ---------------------------------------------------------------------------

_MIDIFnSysExStart:			; DATA XREF: ROM:_MIDITableo
		jsr	sub_BA31
		cmpa	#$25 ; '%'
		bne	_MIDIFnSysExEnd
		jsr	sub_BA31
		cmpa	#1
		bne	_MIDIFnSysExEnd

loc_BC92:				; CODE XREF: ROM:BCE0j	ROM:loc_BD38J
		ldx	#$2908
		ldu	#$BE0F

loc_BC98:				; CODE XREF: ROM:BCD2j
		lda	unk_290A
		sta	unk_2A08

loc_BC9E:				; CODE XREF: ROM:BCD9j
		pshs	x,u
		jsr	sub_BA31
		puls	u,x
		anda	#$F0 ; ''
		cmpa	,u+
		lbne	loc_B9EF
		lda	unk_2A09
		anda	#$F
		sta	,x
		pshs	x,u
		jsr	sub_BA31
		puls	u,x
		anda	#$F0 ; ''
		cmpa	,u+
		lbne	loc_B9EF
		lda	unk_2A09
		asla
		asla
		asla
		asla
		oraa	,x
		sta	,x+
		cmpu	#$BE17
		bne	loc_BC98
		leau	-2,u
		dec	unk_2A08
		bne	loc_BC9E
		lda	unk_3D6E
		bita	#$80 ; 'Ä'
		beq	loc_BC92
		ldu	#$2908
		lda	,u+
		ldx	#$BDC1

loc_BCEA:				; CODE XREF: ROM:BD0Bj
		cmpa	,x+
		bne	loc_BD06
		ldb	,u+
		cmpb	,x+
		bcs	loc_BD0D
		cmpb	,x+
		bhi	loc_BD0D
		ldb	,u+
		cmpb	,x+
		bne	loc_BD0D
		ldb	-2,u
		jsr	[,x]
		lda	#$20 ; ' '
		bra	loc_BD0F
; ---------------------------------------------------------------------------

loc_BD06:				; CODE XREF: ROM:BCECj
		leax	5,x
		cmpx	#$BDF7
		bcs	loc_BCEA

loc_BD0D:				; CODE XREF: ROM:BCF2j	ROM:BCF6j ...
		lda	#$3F ; '?'

loc_BD0F:				; CODE XREF: ROM:BD04j	ROM:AB26j
		ldb	unk_2CFC
		cmpb	#$10
		bne	loc_BD38
		ldu	#$2908
		ldb	,u+
		pshs	a,b
		ldx	#$DCBA
		ldb	,u
		andb	#$F
		ldb	b,x
		lda	,u
		lsra
; ---------------------------------------------------------------------------
		fcb $44
		fcb $44
		fcb $44
		fcb $A6
		fcb $86
		fcb $1F
		fcb 3
		fcb $35
		fcb 6
; ---------------------------------------------------------------------------
		jsr	unk_CD4F
		jsr	sub_81CD

loc_BD38:				; CODE XREF: ROM:BD14j
		jmp	loc_BC92

; =============== S U B	R O U T	I N E =======================================


_SysExTransmit:				; CODE XREF: _SysExTransmitFIXP
		leax	,u
		ldu	#SysExTable	; u = *(0xBDF7)	// start of 0xBDF7 to 0xBE0F table
					;
					; table	size = 24 bytes
					; entry	size = 4 bytes
					; entries = 24/4 = 6
					;
					; table	entries	(in u):
					; 0 = entry.id = block id (ascii)
					; 1 = entry.len	= block	length (length of data)
					; 2,3 =	entry.funcAddr = jump destination address
					;
					; sysex	buffer msgs (in	x):
					; 0 = buffer.id	= block	id (ascii)
					; 1 = buffer.addr = block address
					; 2 = buffer.len = block length	(length	of data)
					; [data]
		lda	,x		; a = *x // buffer[n].id
		ldx	#$2908		; x = *(0x2908)

_SysExTransmit_Find:			; CODE XREF: _SysExTransmit+14j
		cmpa	,u+		; (a ==	*(u++))	// buffer[n].id	== entry[k].id
		beq	_SysExTransmit_Send ; *(x++) = a // buffer[n].id = entry[k].id
		leau	3,u		; u += 3
		cmpu	#SysExUnknown	; (*u == *(0xBE0F)) // table end
		bcs	_SysExTransmit_Find ; (a == *(u++)) // buffer[n].id == entry[k].id
		lda	#$3F ; '?'
		sta	,x
		rts
; ---------------------------------------------------------------------------

_SysExTransmit_Send:			; CODE XREF: _SysExTransmit+Cj
		sta	,x+		; *(x++) = a //	buffer[n].id = entry[k].id
		ldb	,x+		; b = *(x++) //	b = buffer[n].addr
		lda	,u+		; a = *(u++) //	a = entry[k].len
		sta	,x+		; *(x++) = a //	buffer[n].len =	a = entry[k].len
		jsr	[,u]		; call u // entry[2,3],	sysex block func
		pshs	x		; STACK[0] = x
		lda	#$F0 ; ''      ; F0: SysEx begin
		jsr	_MIDITransmitA
		lda	#$25 ; '%'      ; 25: Wersi id
		jsr	_MIDITransmitA
		lda	#1		; 01: MK1/EX20 id
		jsr	_MIDITransmitA
		ldx	#$2908		; x = *(0x2908)
		ldu	#SysExUnknown	; (*u == *(0xBE0F)) // table end, start	of 0x70,60,50,40,30,20,10,00

_SysExTransmit_Loop:			; CODE XREF: _SysExTransmit:loc_BDA2j
					; _SysExTransmit:loc_BDA6j
		lda	,x
		anda	#$F		; a = *x & 0xF // LO 4 bits
		oraa	,u+
		pshs	x,u		; save x,u
		jsr	_MIDITransmitA
		puls	u,x		; restore u,x
		lda	,x+
		lsra
		lsra
		lsra
		lsra			; a = *(x++) >>	4 // HI	4 bits
		oraa	,u+
		pshs	x,u		; save x,u
		jsr	_MIDITransmitA
		puls	u,x		; restore u,x
		cmpx	,s		; x == STACK[0]
		beq	_SysExTransmit_Done

loc_BD97:				; CODE XREF: _SysExTransmit+61j
		lda	unk_1E26	; 0x1E26 // MIDI send buffer/queue length
		cmpa	#$FC ; '¸'
		bhi	loc_BD97	; while(*(0x1E26) > 0xFC) {} //	FIX1, was 0xFD
		cmpu	#SysExUnknown2	; (u ==	*(0xBE17))

loc_BDA2:				; branch if carry set
		bcs	_SysExTransmit_Loop
		leau	-2,u		; u -= 2

loc_BDA6:
		bra	_SysExTransmit_Loop
; ---------------------------------------------------------------------------

_SysExTransmit_Done:			; CODE XREF: _SysExTransmit+5Aj
		puls	pc,x
; End of function _SysExTransmit

; ---------------------------------------------------------------------------
		ldx	#$2C00
		lda	#$20 ; ' '
		clr	unk_2C6B
		jmp	sub_A0C3
; ---------------------------------------------------------------------------
		ldb	,u
		cmpb	#$60 ; '`'
		bcc	locret_BDC0
		stb	-2,u
		jmp	sub_B76A
; ---------------------------------------------------------------------------

locret_BDC0:				; CODE XREF: ROM:BDB9j
		rts
; ---------------------------------------------------------------------------
		fcb $69
		fcb $41	; A
		fcb $6B	; k
		fcb $10
		fcb $A1
		fcb $4F	; O
		fcb $76
		fcb $40	; @
		fcb $54	; T
		fcb $A
		fcb $A1	; °
		fcb $71	; q
		fcb $61	; a
		fcb $40
		fcb $69
		fcb $2C	; ,
		fcb $A1	; °
		fcb $92	; í
		fcb $66	; f
		fcb $40	; @
		fcb $69	; i
		fcb $20
		fcb $A1	; °
		fcb $B3	; ≥
		fcb $77	; w
		fcb $40	; @
		fcb $69	; i
		fcb $B1	; ±
		fcb $A1	; °
		fcb $D4	; ‘
		fcb $71	; q
		fcb $40	; @
		fcb $69	; i
		fcb $D4	; ‘
		fcb $A1	; °
		fcb $D4	; ‘
		fcb $73	; s
		fcb   0
		fcb   0
		fcb   1
		fcb $BD	; Ω
		fcb $B5	; µ
		fcb $74	; t
		fcb   0
		fcb   0
		fcb $40	; @
		fcb $BD	; Ω
		fcb $AA	; ™
		fcb $72	; r
		fcb   0
		fcb $FF
		fcb   1
		fdb $E1F8		; FIX 1b
SysExTable:	SysExRequest <$69, $10,	$A141> ; DATA XREF: _SysExTransmit+2o
		SysExRequest <$76, $A, $A164> ;	$69 = i	ICF instrument control block
		SysExRequest <$61, $2C,	$A185> ; $76 = v VCF filter block
		SysExRequest <$66, $20,	$A1A6> ; $61 = a AMPL amplitude	envelope block
					; $66 =	f FREQ frequency envelope block
					; $77 =	w RELWAVE rel. wavetable block
					; $71 =	q FIXWAVE fix. wavetable block
		fcb $77	; w
		fcb $B1	; ±
		fcb $A1	; °
		fcb $C7	; «
		fcb $71	; q
		fcb $D4	; ‘
		fcb $A1	; °
		fcb $C7	; «
SysExUnknown:	fcb $70, $60, $50, $40,	$30, $20, $10, 0 ; DATA	XREF: _SysExTransmit+10o
					; _SysExTransmit+39o
SysExUnknown2:	fcb $39			; CODE XREF: ROM:8232P
					; DATA XREF: _SysExTransmit+63o
; ---------------------------------------------------------------------------
		pshs	a,b,x
		lda	unk_128
		bita	#4
		bne	loc_BE4C
		ldb	unk_2B0B
		cmpb	#$20 ; ' '
		bcs	loc_BE35
		ldb	unk_2800
		andb	#$7F ; ''
		stb	unk_2800
		stb	unk_100
		bra	loc_BE4C
; ---------------------------------------------------------------------------

loc_BE35:				; CODE XREF: ROM:BE26j
		incb
		stb	unk_2B0B
		ldd	unk_131
		ldx	unk_2B0C
		std	,x++
		cmpx	#$2B50
		bcs	loc_BE49
		ldx	#$2B10

loc_BE49:				; CODE XREF: ROM:BE44j
		stx	unk_2B0C

loc_BE4C:				; CODE XREF: ROM:BE1Fj	ROM:BE33j
		jmp	[unk_1D0D]

; =============== S U B	R O U T	I N E =======================================


sub_BE50:				; CODE XREF: ROM:8249P	sub_BE50+20j ...

; FUNCTION CHUNK AT C06A SIZE 00000012 BYTES
; FUNCTION CHUNK AT C0FD SIZE 000000E0 BYTES

		tst	unk_2B0B
		beq	loc_BEB8
		ldx	unk_2B0E
		ldd	,x++
		cmpx	#$2B50
		bcs	loc_BE62
		ldx	#$2B10

loc_BE62:				; CODE XREF: sub_BE50+Dj
		stx	unk_2B0E
		dec	unk_2B0B
		bita	#$40 ; '@'
		beq	loc_BE94
		anda	#$3F ; '?'
		cmpa	#$3C ; '<'
		bhi	sub_BE50
		clr	unk_10D3
		ldx	#$222F
		tst	unk_2E0C
		bmi	loc_BE88
		cmpa	unk_2E0C
		bcc	loc_BE88
		inc	unk_10D3
		ldx	#$2237

loc_BE88:				; CODE XREF: sub_BE50+2Bj sub_BE50+30j
		tst	4,x
		beq	sub_BE50
		stx	unk_10D5
		jsr	_NoteFn2
		bra	sub_BE50
; ---------------------------------------------------------------------------

loc_BE94:				; CODE XREF: sub_BE50+1Aj
		anda	#$3F ; '?'
		cmpa	#$3C ; '<'
		bhi	sub_BE50
		clr	unk_10D3
		ldx	#$222F
		tst	unk_2E0C
		bmi	loc_BEB0
		cmpa	unk_2E0C
		bcc	loc_BEB0
		inc	unk_10D3
		ldx	#$2237

loc_BEB0:				; CODE XREF: sub_BE50+53j sub_BE50+58j
		stx	unk_10D5
		jsr	_NoteFn1
		bra	sub_BE50
; ---------------------------------------------------------------------------

loc_BEB8:				; CODE XREF: sub_BE50+3j
		orcc	#$50 ; 'P'
		lda	unk_2800
		oraa	#$80 ; 'Ä'
		sta	unk_2800
		sta	unk_100
		andcc	#$AF ; 'Ø'
		ldb	unk_128
		andb	#$C0 ; '¿'
		pshs	b,x
		comb
		andb	unk_2B07
		andb	unk_2B08
		stb	2,s
		ldb	unk_2B08
		comb
		andb	unk_2B07
		andb	,s
		stb	1,s
		ldb	unk_2B07
		stb	unk_2B08
		puls	b
		stb	unk_2B07
		clra
		ldb	unk_3D6F
		bitb	#1
		bne	loc_BEFB
		bitb	#$10
		beq	loc_BEFB
		lda	<unk_11

loc_BEFB:				; CODE XREF: sub_BE50+A3j sub_BE50+A7j
		sta	unk_2B09
		lda	unk_2E0F
		bita	#$1F
		lbeq	loc_BF3E
		ldb	,s
		bitb	#$40 ; '@'
		beq	loc_BF22
		lda	unk_2B09
		beq	loc_BF20
		adda	#$AF ; 'Ø'
		jsr	_MIDITransmitA
		lda	#$40 ; '@'
		jsr	_MIDITransmitA
		clra
		jsr	_MIDITransmitA

loc_BF20:				; CODE XREF: sub_BE50+C0j
		bsr	sub_BF83

loc_BF22:				; CODE XREF: sub_BE50+BBj
		ldb	1,s
		bitb	#$40 ; '@'
		beq	loc_BF3E
		lda	unk_2B09
		beq	loc_BF3C
		adda	#$AF ; 'Ø'
		jsr	_MIDITransmitA
		lda	#$40 ; '@'
		jsr	_MIDITransmitA
		lda	#$7F ; ''
		jsr	_MIDITransmitA

loc_BF3C:				; CODE XREF: sub_BE50+DBj
		bsr	sub_BF9E

loc_BF3E:				; CODE XREF: sub_BE50+B3j sub_BE50+D6j
		lda	unk_2E0F
		bita	#$F8 ; '¯'
		beq	loc_BF7E
		ldb	,s
		bitb	#$80 ; 'Ä'
		beq	loc_BF61
		lda	unk_2B09
		beq	loc_BF5E
		adda	#$AF ; 'Ø'
		jsr	_MIDITransmitA
		lda	#$41 ; 'A'
		jsr	_MIDITransmitA
		clra
		jsr	_MIDITransmitA

loc_BF5E:				; CODE XREF: sub_BE50+FEj
		jsr	sub_BFF6

loc_BF61:				; CODE XREF: sub_BE50+F9j
		ldb	1,s
		bitb	#$80 ; 'Ä'
		beq	loc_BF7E
		lda	unk_2B09
		beq	loc_BF7B
		adda	#$AF ; 'Ø'
		jsr	_MIDITransmitA
		lda	#$41 ; 'A'
		jsr	_MIDITransmitA
		lda	#$7F ; ''
		jsr	_MIDITransmitA

loc_BF7B:				; CODE XREF: sub_BE50+11Aj
		jsr	sub_C011

loc_BF7E:				; CODE XREF: sub_BE50+F3j
					; sub_BE50+115j
		puls	b,a
		jmp	loc_C06A
; End of function sub_BE50


; =============== S U B	R O U T	I N E =======================================


sub_BF83:				; CODE XREF: sub_BE50:loc_BF20p
		lda	unk_2E0F
		bita	#2
		beq	loc_BF93
		clr	unk_10D4
		jsr	sub_959A
		lda	unk_2E0F

loc_BF93:				; CODE XREF: sub_BF83+5j
		bita	#4
		beq	locret_BF9D
		ldd	#$294
		std	unk_2D56

locret_BF9D:				; CODE XREF: sub_BF83+12j
		rts
; End of function sub_BF83


; =============== S U B	R O U T	I N E =======================================


sub_BF9E:				; CODE XREF: sub_BE50:loc_BF3Cp
		lda	unk_2E0F
		bita	#1
		beq	loc_BFAB
		jsr	sub_C5B9
		lda	unk_2E0F

loc_BFAB:				; CODE XREF: sub_BF9E+5j
		bita	#2
		beq	loc_BFB4
		ldb	#$FF
		stb	unk_10D4

loc_BFB4:				; CODE XREF: sub_BF9E+Fj
		bita	#4
		beq	loc_BFC4
		ldx	#$D500
		stx	unk_2D54
		ldx	#$42 ; 'B'
		stx	unk_2D56

loc_BFC4:				; CODE XREF: sub_BF9E+18j
		bita	#8
		beq	loc_BFD5
		ldb	unk_3D52
		decb
		cmpb	#6
		bcc	loc_BFD2
		ldb	#$11

loc_BFD2:				; CODE XREF: sub_BF9E+30j
		stb	unk_3D52

loc_BFD5:				; CODE XREF: sub_BF9E+28j
		bita	#$10
		beq	locret_BFF5
		ldb	unk_3D50
		decb
		bpl	loc_BFE1
		ldb	#$F

loc_BFE1:				; CODE XREF: sub_BF9E+3Fj
		cmpb	#8
		bcs	locret_BFF5
		subb	#8
		pshs	b
		ldb	#$35 ; '5'
		jsr	sub_B76A
		puls	b
		addb	#$38 ; '8'
		jmp	sub_B76A
; ---------------------------------------------------------------------------

locret_BFF5:				; CODE XREF: sub_BF9E+39j sub_BF9E+45j
		rts
; End of function sub_BF9E


; =============== S U B	R O U T	I N E =======================================


sub_BFF6:				; CODE XREF: sub_BE50:loc_BF5EP
		lda	unk_2E0F
		bita	#$40 ; '@'
		beq	loc_C006
		clr	unk_10D4
		jsr	sub_959A
		lda	unk_2E0F

loc_C006:				; CODE XREF: sub_BFF6+5j
		bita	#$80 ; 'Ä'
		beq	locret_C010
		ldd	#$294
		std	unk_2D56

locret_C010:				; CODE XREF: sub_BFF6+12j
		rts
; End of function sub_BFF6


; =============== S U B	R O U T	I N E =======================================


sub_C011:				; CODE XREF: sub_BE50:loc_BF7BP
		lda	unk_2E0F
		bita	#$20 ; ' '
		beq	loc_C01E
		jsr	sub_C5B9
		lda	unk_2E0F

loc_C01E:				; CODE XREF: sub_C011+5j
		bita	#$40 ; '@'
		beq	loc_C027
		ldb	#$FF
		stb	unk_10D4

loc_C027:				; CODE XREF: sub_C011+Fj
		bita	#$80 ; 'Ä'
		beq	loc_C037
		ldx	#$D500
		stx	unk_2D54
		ldx	#$42 ; 'B'
		stx	unk_2D56

loc_C037:				; CODE XREF: sub_C011+18j
		bita	#8
		beq	loc_C048
		ldb	unk_3D52
		incb
		cmpb	#$11
		bls	loc_C045
		ldb	#6

loc_C045:				; CODE XREF: sub_C011+30j
		stb	unk_3D52

loc_C048:				; CODE XREF: sub_C011+28j
		bita	#$10
		beq	locret_C069
		ldb	unk_3D50
		incb
		cmpb	#$10
		bcs	loc_C055
		clrb

loc_C055:				; CODE XREF: sub_C011+41j
		cmpb	#8
		bcs	loc_C064
		subb	#8
		pshs	b
		ldb	#$35 ; '5'
		jsr	sub_B76A
		puls	b

loc_C064:				; CODE XREF: sub_C011+46j
		addb	#$38 ; '8'
		jmp	sub_B76A
; ---------------------------------------------------------------------------

locret_C069:				; CODE XREF: sub_C011+39j
		rts
; End of function sub_C011

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_BE50

loc_C06A:				; CODE XREF: sub_BE50+130J
		ldu	#$C0D6
		bsr	sub_C07C
		ldu	#$C0E2
		bsr	sub_C07C
		ldu	#$C0EE
		bsr	sub_C07C
		jmp	loc_C0FD
; END OF FUNCTION CHUNK	FOR sub_BE50

; =============== S U B	R O U T	I N E =======================================


sub_C07C:				; CODE XREF: sub_BE50+21Dp
					; sub_BE50+222p ...
		lda	unk_2BE7
		bita	,u
		bne	loc_C092
		bita	1,u
		beq	locret_C091
		oraa	,u
		sta	unk_2BE7
		lda	#1
		sta	[2,u]

locret_C091:				; CODE XREF: sub_C07C+9j
		rts
; ---------------------------------------------------------------------------

loc_C092:				; CODE XREF: sub_C07C+5j
		lda	[2,u]
		bne	locret_C0D5
		lda	,u
		oraa	1,u
		coma
		anda	unk_2BE7
		sta	unk_2BE7
		lda	#$FF
		pshs	a
		clrb
		ldx	[4,u]
		beq	loc_C0C0
		ldy	6,u
		leay	1,y

loc_C0B1:				; CODE XREF: sub_C07C+42j
		lda	2,x
		cmpa	,y
		beq	loc_C0B9
		clr	,s

loc_C0B9:				; CODE XREF: sub_C07C+39j
		sta	,y+
		incb
		ldx	$C,x
		bne	loc_C0B1

loc_C0C0:				; CODE XREF: sub_C07C+2Ej
		cmpb	[6,u]
		beq	loc_C0CA
		stb	[6,u]
		clr	,s

loc_C0CA:				; CODE XREF: sub_C07C+47j
		puls	a
		coma
		beq	locret_C0D5
		sta	[8,u]
		sta	[$A,u]

locret_C0D5:				; CODE XREF: sub_C07C+19j sub_C07C+51j
		rts
; End of function sub_C07C

; ---------------------------------------------------------------------------
		fcb 2, 1, $2D, $63, $22, $2F, $2B, $50,	$2B, $8E, $2B
		fcb $8F, 8, 4, $2D, $64, $22, $37, $2B,	$90, $2B, $CE
		fcb $2B, $CF, $20, $10,	$2D, $65, $22, $3F, $2B, $D0, $2B
		fcb $DE, $2B, $DF, 1, 4, $10
; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_BE50

loc_C0FD:				; CODE XREF: sub_BE50+229J
		lda	unk_2E06
		bne	loc_C114
		cmpa	unk_2BE5
		lbeq	locret_C1DC
		sta	unk_2BE5
		ldu	#$2BE0
		clr	,u
		jmp	loc_C1AC
; ---------------------------------------------------------------------------

loc_C114:				; CODE XREF: sub_BE50+2B0j
		cmpa	unk_2BE5
		bne	loc_C126
		lda	unk_2B8E
		bne	loc_C129
		lda	unk_2BCE
		bne	loc_C129
		jmp	locret_C1DC
; ---------------------------------------------------------------------------

loc_C126:				; CODE XREF: sub_BE50+2C7j
		sta	unk_2BE5

loc_C129:				; CODE XREF: sub_BE50+2CCj
					; sub_BE50+2D1j
		clra
		sta	unk_2B8E
		sta	unk_2BCE
		ldx	#$2B50
		ldy	#$2B90
		ldu	#$2BE0
		clr	,u
		lda	,x
		lbeq	loc_C1AC
		leax	a,x
		ldb	,y
		lbeq	loc_C1AC
		cmpb	#4
		bls	loc_C150
		ldb	#4

loc_C150:				; CODE XREF: sub_BE50+2FCj
		pshs	b

loc_C152:				; CODE XREF: sub_BE50+356j
		leay	1,y
		lda	,x
		suba	,y
		bmi	loc_C168

loc_C15A:				; CODE XREF: sub_BE50+310j
		cmpa	#$C
		bcs	loc_C162
		suba	#$C
		bra	loc_C15A
; ---------------------------------------------------------------------------

loc_C162:				; CODE XREF: sub_BE50+30Cj
		tsta
		beq	loc_C171
		nega
		bra	loc_C173
; ---------------------------------------------------------------------------

loc_C168:				; CODE XREF: sub_BE50+308j
		nega

loc_C169:				; CODE XREF: sub_BE50+31Fj
		cmpa	#$C
		bcs	loc_C171
		suba	#$C
		bra	loc_C169
; ---------------------------------------------------------------------------

loc_C171:				; CODE XREF: sub_BE50+313j
					; sub_BE50+31Bj
		suba	#$C

loc_C173:				; CODE XREF: sub_BE50+316j
		adda	,x
		bpl	loc_C179
		adda	#$C

loc_C179:				; CODE XREF: sub_BE50+325j
		ldb	,u
		beq	loc_C186

loc_C17D:				; CODE XREF: sub_BE50+332j
		cmpa	b,u
		beq	loc_C1A4
		decb
		bne	loc_C17D
		ldb	,u

loc_C186:				; CODE XREF: sub_BE50+32Bj
		incb
		stb	,u
		sta	b,u
		pshs	x,y,u
		ldu	#$225F
		jsr	sub_8CE2
		bne	loc_C1A2
		stu	unk_10D5
		ldb	#6
		stb	unk_10D3
		ldb	#$80 ; 'Ä'
		jsr	_NoteFn2

loc_C1A2:				; CODE XREF: sub_BE50+343j
		puls	u,y,x

loc_C1A4:				; CODE XREF: sub_BE50+32Fj
		dec	,s
		lbne	loc_C152
		leas	1,s

loc_C1AC:				; CODE XREF: sub_BE50+2C1J
					; sub_BE50+2EEj ...
		ldx	unk_225F
		beq	locret_C1DC

loc_C1B1:				; CODE XREF: sub_BE50+38Aj
		lda	2,x
		ldb	,u
		beq	loc_C1C0
		leay	1,u

loc_C1B9:				; CODE XREF: sub_BE50+36Ej
		cmpa	,y+
		beq	loc_C1D8
		decb
		bne	loc_C1B9

loc_C1C0:				; CODE XREF: sub_BE50+365j
		pshs	a,u
		lda	#6
		sta	unk_10D3
		ldx	#$225F
		stx	unk_10D5
		puls	a
		ldb	#$80 ; 'Ä'
		jsr	_NoteFn1
		puls	u
		bra	loc_C1AC
; ---------------------------------------------------------------------------

loc_C1D8:				; CODE XREF: sub_BE50+36Bj
		ldx	$C,x
		bne	loc_C1B1

locret_C1DC:				; CODE XREF: sub_BE50+2B5j
					; sub_BE50+2D3J ...
		rts
; END OF FUNCTION CHUNK	FOR sub_BE50
; ---------------------------------------------------------------------------
		lda	unk_128
		bita	#1
		bne	loc_C1EA
		jsr	sub_AABC
		lda	unk_128

loc_C1EA:				; CODE XREF: ROM:C1E2j
		bita	#2
		lbne	locret_C506
		lda	unk_181
		lda	unk_182
		lda	#$2D ; '-'
		tfr	a, dp
		ldb	<unk_2
		orab	#$20 ; ' '
		stb	unk_102
		ldu	unk_1071
		stu	unk_139
		andb	#$D8 ; 'ÿ'
		orab	#6
		stb	<unk_2
		stb	unk_102
		lda	<unk_5D
		bita	#1
		bne	loc_C24F
		lda	unk_123
		ldx	#$2E38
		ldb	<unk_3
		bmi	loc_C23B
		sta	b,x
		incb
		cmpb	#4
		bcc	loc_C22B
		stb	<unk_3
		bra	loc_C242
; ---------------------------------------------------------------------------

loc_C22B:				; CODE XREF: ROM:C225j
		comb
		stb	<unk_3
		ldb	<unk_4
		incb
		cmpb	#$18
		bcs	loc_C237
		ldb	#4

loc_C237:				; CODE XREF: ROM:C233j
		stb	<unk_4
		bra	loc_C242
; ---------------------------------------------------------------------------

loc_C23B:				; CODE XREF: ROM:C21Ej
		ldb	<unk_4
		sta	b,x
		clrb
		stb	<unk_3

loc_C242:				; CODE XREF: ROM:C229j	ROM:C239j
		lda	#$FF
		sta	unk_11C
		ldx	#$B109
		lda	b,x
		sta	unk_11C

loc_C24F:				; CODE XREF: ROM:C214j
		lda	<word_0
		ldx	#$C257
		asla
		jmp	[a,x]
; ---------------------------------------------------------------------------
		fcb $C3	; √
		fcb $9F	; ü
		fcb $C2	; ¬
		fcb $6F, $C2, $91, $C2,	$96, $C2, $D7, $C3, $82, $C3, $9F
		fcb $C3, $A9, 7, 2, 3, 4, 5, 7,	7, 1, $D6, $23,	$1D, $2B
		fcb 9, $D3, $24, $10, $93, $21,	$23, $B, $20, 7, $D3, $24
		fcb $10, $93, $21, $24,	2, $DC,	$21, $DD, $24, $D3, $26
		fcb $DD, $26, $CE, $2D,	9, $20,	8, $CE,	$2D, $11, $20
		fcb 3, $CE, $2D, $19, $A6, $41,	$2B, $A, $AB, $C4, $A7
		fcb $C4, $A1, $42, $2D,	$C, $20, 8, $AB, $C4, $A7, $C4
		fcb $A1, $43, $2E, 2, $60, $41,	$D6, $26, $EB, $44, $2A
		fcb 1, $53, $58, $5C, $A6, $46,	$3D, $AB, $45, $97, 7
		fcb $E6, $47, $A6, $C4,	$2B, 3,	$3D, $20, 3, $40, $3D
		fcb $50, $DB, 7, $1F, $98, $3D,	$8B, $3C, $7E, $C3, $AD
		fcb $96, $35, $8E, $C2,	$DE, $6E, $96, $C2, $E4, $C3, $1D
		fcb $C3, $19, $8E, $2D,	$3E, $DC, $36, $97, 7, $D3, $3A
		fcb $DD, $36, $24, $52,	$D6, $3E, $DB, $3F, $58, $4F, $DD
		fcb $33, $96, $32, $85,	$40, $27, $B, $86, 2, $97, $35
		fcb $CC, 0, 0, $DD, $38, $20, $F, $85, $20, $27, 7, $CC
		fcb 0, 0, $DD, $36, $20, 4, $86, 4, $97, $35, $DC, $33
		fcb $20, $3E, $8E, $2D,	$40, $DC, $38, $97, 7, $D3, $3C
		fcb $DD, $38, $24, $19,	$D6, $40, $DB, $41, $58, $4F, $DD
		fcb $33, $96, $32, $85,	$20, $27, $DD, $CC, 0, 0, $DD
		fcb $36, $97, $35, $DC,	$33, $20, $18, $96, 7, $E6, $84
		fcb $2A, 5, $3D, $90, 7, $20, 1, $3D, $AB, 1, $C3, 0, $FF
		fcb $58, $49, $1F, $89,	$4F, $DD, $33, $D3, $29, $D3, $2B
		fcb $D3, $2D, $C3, 0, $80, $2A,	4, $4F,	$5F, $20, $43
		fcb $10, $83, 1, $99, $23, 5, $CC, $FF,	$FF, $20, $38
		fcb $34, 2, $86, $A0, $3D, $6D,	$E0, $27, $2F, $8B, $A0
		fcb $20, $2B, 3, $31, $26, $19,	$96, $2F, $F6, $2D, 1
		fcb $C5, $13, $26, 4, $4F, $5F,	$20, $1A, $C5, 8, $26
		fcb 3, $5F, $20, $13, $5F, $44,	$56, $20, $E, $5F, $D7
		fcb 0, $53, $D7, $31, $96, $30,	$20, 4,	$B6, $2E, $51
		fcb $5F, $1F, 2, $D6, 2, $CA, $20, $F7,	1, 2, $10, $BF
		fcb 1, $39, $C4, $D8, $DA, 0, $D7, 2, $F7, 1, 2, $C4, 7
		fcb $8E, $C2, $67, $E6,	$85, $D7, 0, $C1, 1, $10, $26
		fcb 1, $1B, $4F, $97, $58, $F6,	$2E, $E, $C5, $40, $27
		fcb $17, $D7, $58, $B6,	$2E, $72, $80, $80, $2A, 3, $40
		fcb $F,	$58, $F6, $2E, $69, $3D, $CB, $7F, $58,	$49, $F6
		fcb $2E, $E, $C5, $20, $27, $B,	$D7, $58, $BB, $2E, $71
		fcb $24, 4, $86, $FF, $20, $15,	$F6, $2E, $D, $C5, $10
		fcb $27, $B, $D7, $58, $BB, $2E, $6E, $24, 4, $86, $FF
		fcb $20, 3, $4D, $27, $68, $97,	$5A, $B6, $2E, $19, $5F
		fcb $D3, $5B, $DD, $5B,	$85, $40, $27, 1, $40, $84, $7F
		fcb $8E, $C4, $3E, $A6,	$86, $D6, $5A, $3D, $C3, 0, $FF
		fcb $D,	$5B, $2A, 1, $40, $97, $59, 4, $5A, $20, $4A, 0
		fcb 3, 6, 9, $C, $10, $13, $16,	$19, $1C, $1F, $22, $25
		fcb $28, $2B, $2E, $31,	$33, $36, $39, $3C, $3F, $41, $44
		fcb $47, $49, $4C, $4E
		fcb $51, $53, $55, $58,	$5A, $5C, $5E, $60, $62, $64, $66
		fcb $68, $6A, $6B, $6D,	$6F, $70, $71, $73, $74, $75, $76
		fcb $78, $79, $7A, $7A,	$7B, $7C, $7D, $7D, $7E, $7E, $7E
		fcb $7F, $7F, $7F, $7F,	$CC, 0,	0, $97,	$58, $DD, $59
		fcb $DD, $5B, $DC, $54,	$27, 8,	$D3, $56, $24, 2, $4F
		fcb $5F, $DD, $54, $1F,	$89, $1D, $D3, $50, $10, $93, $50
		fcb $25, 6, $4F, $5F, $DD, $54,	$DC, $50, $DD, 7, $D6
		fcb $58, $27, $27, $F6,	$2E, $1A, $96, $59, $27, $20, $2A
		fcb 6, $3D, $B0, $2E, $1A, $20,	1, $3D,	$1F, $89, $1D
		fcb $D3, 7, $2B, $B, $10, $83, 4, 0, $25, $C, $CC, 3, $FF
		fcb $20, 7, $CC, 0, 0, $20, 2, $DC, 7, $10, $B3, $2D, $4E
		fcb $27, $14, $FD, $2D,	$4E, $B6, $2B, 3, $26, $C, $BD
		fcb $8C, $73, $27, 7, $C6, 6, $E7, 0, $BD, $AA,	$82, $F7
		fcb 1, $1D, $A,	$5D, $26, $12, $C6, 6, $D7, $5D, $8E, $2D
		fcb $63, $C6, $25, $A6,	$80, $27, 2, $6A, $1F, $5A, $26
		fcb $F7
; ---------------------------------------------------------------------------

locret_C506:				; CODE XREF: ROM:C1ECj
		rti
; ---------------------------------------------------------------------------
		fcb   0
		fcb 1, 7, $F8, 0, $10, $B3, 0, 4, $FF, 7, $F8, $55, $48
		fcb $92, 0, $FA, $FF, 7, $F8, $AA, $70,	$70, 0,	1, $18
		fcb 0, 1, 7, $F8, 0, $10, $B3, 0, 4, $FF, 7, $F8, $55
		fcb $48, $92, 0, $FA, $FF, 7, $F8, $AA,	$70, $70, 0, 9
		fcb $9C, 0, 1, 7, $F8, 0, $48, $65, 4, 4, $FF, 7, $F8
		fcb $55, $48, $65, 4, $FA, $FF,	7, $F8,	$AA, $48, $65
		fcb 4, 0, $E0, 0, 1, 7,	$F8, 0,	$20, $C0, 0, 4,	$FF, 7
		fcb $F8, $55, $20, $C0,	0, $FA,	$FF, 7,	$F8, $AA, $20
		fcb $C0, 0, 0, $85, 0, 1, $A, $F5, 0, $30, $2D,	2, 4, $FF
		fcb 6, $F9, $55, $48, $2D, 2, $FA, $FF,	$17, $E8, $AA
		fcb $60, $2D, 2, 0, $C8, $C5, $99, $C5,	$9D, $C5, $A4
		fcb $C5, $A8, $C5, $AC,	$C5, $B9, $C6, $C, $C6,	$10, $86
		fcb $40, $20, 2, $86, $80, $B8,	$25, $CD, $20, $2C, $86
		fcb 3, $20, 6, $86, 2, $20, 2, $86, 4, $34, 2, $B6, $25
		fcb $CD, $84, $F8, $AB,	$E0, $20, $17

; =============== S U B	R O U T	I N E =======================================


sub_C5B9:				; CODE XREF: sub_BF9E+7P sub_C011+7P
		lda	unk_25CD
		anda	#7
		cmpa	#1
		bhi	loc_C5C9
		lda	unk_25CD
		eora	#1
		bra	loc_C5D0
; ---------------------------------------------------------------------------

loc_C5C9:				; CODE XREF: sub_C5B9+7j
		lda	unk_25CD
		anda	#$F8 ; '¯'
		adda	#1

loc_C5D0:				; CODE XREF: sub_C5B9+Ej
		ldx	word_22F1
		sta	9,x
		jsr	sub_8969
; End of function sub_C5B9


; =============== S U B	R O U T	I N E =======================================


sub_C5D8:				; CODE XREF: sub_C713+A4P sub_D354+3AP

; FUNCTION CHUNK AT D14D SIZE 00000004 BYTES

		clra
		ldb	unk_3D54
		bitb	#8
		beq	loc_C5E2
		oraa	#$40 ; '@'

loc_C5E2:				; CODE XREF: sub_C5D8+6j
		bitb	#$10
		beq	loc_C5E8
		oraa	#$80 ; 'Ä'

loc_C5E8:				; CODE XREF: sub_C5D8+Cj
		ldb	unk_25CD
		bitb	#$80 ; 'Ä'
		bpl	loc_C5F1
		oraa	#2

loc_C5F1:				; CODE XREF: sub_C5D8+15j
		bitb	#$40 ; '@'
		beq	loc_C5F7
		oraa	#1

loc_C5F7:				; CODE XREF: sub_C5D8+1Bj
		andb	#7
		ldx	#$C604
		oraa	b,x
		sta	unk_2CD8
		jmp	loc_D14D
; End of function sub_C5D8

; ---------------------------------------------------------------------------
		fcb   0
		fcb $20
		fcb 8, 4, $10, 0, 0, 0,	$86, 8,	$20, 2,	$86, $10, $B8
		fcb $3D, $54, $B7, $3D,	$54, $20, $BE, $C7, 2, $C7, 6
		fcb $C6, $FE, $C6, $2A,	$C6, $B6, $C6, $BA, $C6, $DA, $C8
		fcb $94, $86, 8, $B8, $2C, $D5,	$8E, $25, $B5, $E6, $B
		fcb $26, $23, $85, 8, $10, $27,	0, $CF,	$FE, $22, $F1
		fcb $E6, $41, $34, 2, $BD, $A1,	$64, $8E, $25, $B5, $B6
		fcb $21, $F0, $F6, $22,	$F0, $ED, $A, $BD, $DC,	$3E, $35
		fcb 2, $7E, $C7, $B, $F1, $22, $F0, $22, $4C, $26, $13
		fcb $85, 8, $10, $26, 0, $A5, $E6, 0, $C5, $20,	$10, $26
		fcb 0, $9D, $6F, $B, $7E, $C7, $B, $85,	$60, $10, $26
		fcb 0, $92, $E6, $A, $F1, $21, $F0, $27, $BC, $34, $16
		fcb $1F, $98, $E6, 0, $C4, $13,	$E7, $61, $BD, $82, $90
		fcb $30, $14, $20, $10,	$BD, $82, $A8, $A6, $88, $12, $84
		fcb $F7, $AA, $61, $A7,	$88, $12, $BD, $87, $2F, $A6, $88
		fcb $10, $26, $EB, $35,	$16, $20, $92, $85, 8, $27, $5D
		fcb $E6, $A, $F1, $21, $F0, $27, $56, $39, $86,	$10, $20
		fcb $4E, $86, $20, $B8,	$2C, $D5, $BE, $22, $F1, $E6, $88
		fcb $12, $85, $20, $27,	9, $CA,	$20, $C4, $3F, $F7, $2C
		fcb $D5, $20, $29, $C4,	$DF, $E7, $88, $12, $7E, $C7, $CA
		fcb $86, $40, $B8, $2C,	$D5, $85, $40, $10, $27, 0, $E5
		fcb $B6, $25, $B5, $84,	$13, $8A, $40, $BE, $22, $F1, $E6
		fcb $88, $12, $C5, $80,	$27, 2,	$8A, 4,	$B7, $2C, $D5
		fcb $7E, $D1, $4D, $86,	4, $20,	6, $86,	1, $20,	2, $86
		fcb 2, $B8, $2C, $D5, $10, $8E,	$25, $B5, $85, $60, $26
		fcb $40

; =============== S U B	R O U T	I N E =======================================


sub_C713:				; CODE XREF: ROM:loc_A794P
		anda	#$1F
		asla
		asla
		ldu	#$C7F4
		leau	a,u
		lda	,u
		sta	unk_2CD5
		lda	1,u
		ldx	word_22F1
		sta	$12,x
		ldb	$A,y
		cmpb	unk_21F0
		bne	loc_C749
		ldb	$B,y
		cmpb	word_22EF+1
		bls	loc_C73B
		bita	#8
		beq	loc_C749

loc_C73B:				; CODE XREF: sub_C713+22j
		lda	0,y
		anda	#$EC ; 'Ï'
		oraa	2,u
		sta	0,y
		bita	#$33 ; '3'
		bne	loc_C749
		clr	$B,y

loc_C749:				; CODE XREF: sub_C713+1Bj sub_C713+26j ...
		lda	9,x
		anda	#$E7 ; 'Á'
		oraa	3,u
		sta	9,x
		bra	loc_C797
; ---------------------------------------------------------------------------
		bita	#$40 ; '@'
		beq	loc_C77F
		bita	#$20 ; ' '
		bne	sub_C7CA
		ldx	word_22F1
		anda	#$57 ; 'W'
		sta	unk_2CD5
		ldb	$12,x
		andb	#$7F ; ''
		bita	#4
		beq	loc_C76E
		orab	#$80 ; 'Ä'

loc_C76E:				; CODE XREF: sub_C713+57j
		stb	$12,x
		anda	#$13
		pshs	a
		lda	0,y
		anda	#$EC ; 'Ï'
		oraa	,s+
		sta	0,y
		bra	loc_C797
; ---------------------------------------------------------------------------

loc_C77F:				; CODE XREF: sub_C713+42j
		pshs	a
		anda	#$1F
		ldu	#$C874
		puls	b
		andb	#$E0 ; '‡'
		orab	a,u
		stb	unk_2CD5
		ldx	word_22F1
		andb	#$BF ; 'ø'
		stb	$12,x

loc_C797:				; CODE XREF: sub_C713+3Ej sub_C713+6Aj
		lda	$12,x
		ldb	9,x
		pshs	a,b
		bra	loc_C7AA
; ---------------------------------------------------------------------------

loc_C7A0:				; CODE XREF: sub_C713+9Dj
		jsr	_LoadICBUnknown
		ldd	,s
		sta	$12,x
		stb	9,x

loc_C7AA:				; CODE XREF: sub_C713+8Bj
		jsr	sub_872F
		lda	$10,x
		bne	loc_C7A0
		leas	2,s
		jsr	sub_8923
		jsr	sub_C5D8
		jsr	sub_877C
		jsr	sub_DC3E
		lda	unk_2CD5
		bita	#$60 ; '`'
		beq	sub_C7CA
; End of function sub_C713

; START	OF FUNCTION CHUNK FOR sub_C7CA

loc_C7C7:				; CODE XREF: sub_C7CA+28j
		jmp	loc_D14D
; END OF FUNCTION CHUNK	FOR sub_C7CA

; =============== S U B	R O U T	I N E =======================================


sub_C7CA:				; CODE XREF: sub_C713+46j sub_C713+B2j ...

; FUNCTION CHUNK AT C7C7 SIZE 00000003 BYTES

		ldx	word_22F1
		lda	$12,x
		anda	#$1F
		bita	#8
		beq	loc_C7DF
		pshs	a
		lda	unk_25B5
		anda	#$13
		oraa	,s+

loc_C7DF:				; CODE XREF: sub_C7CA+Aj
		bita	#$10
		beq	loc_C7EF
		pshs	a
		lda	unk_25CD
		lsra
		lsra
		lsra
		anda	#3
		oraa	,s+

loc_C7EF:				; CODE XREF: sub_C7CA+17j
		sta	unk_2CD5
		bra	loc_C7C7
; End of function sub_C7CA

; ---------------------------------------------------------------------------
		fcb   3
		fcb   3
word_C7F6:	fdb 0
		fcb   1
		fcb   1
		fcb   0
		fcb   0
		fcb   2
		fcb   2
		fcb   0
		fcb   0
		fcb   3
		fcb   3
		fcb   0
		fcb   0
		fcb   7
		fcb   7
		fcb   0
		fcb   0
		fcb   5
		fcb   5
		fcb   0
		fcb   0
		fcb   6
		fcb   6
		fcb   0
		fcb   0
		fcb   7
		fcb   7
		fcb   0
		fcb   0
		fcb  $B
		fcb   8
		fcb   3
		fcb   0
		fcb   9
		fcb   8
		fcb   1
		fcb   0
		fcb  $A
		fcb   8
		fcb   2
		fcb   0
		fcb  $B
		fcb   8
		fcb   3
		fcb   0
		fcb  $F
		fcb  $C
		fcb   3
		fcb   0
		fcb  $D
		fcb  $C
		fcb   1
		fcb   0
		fcb  $E
		fcb  $C
		fcb   2
		fcb   0
		fcb  $F
		fcb  $C
		fcb   3
		fcb   0
		fcb $13
		fcb $10
		fcb   0
		fcb $18
		fcb $11
		fcb $10
		fcb   0
		fcb   8
		fcb $12
		fcb $10
		fcb   0
		fcb $10
		fcb $13
		fcb $10
		fcb   0
		fcb $18
		fcb $17
		fcb $14
		fcb   0
		fcb $18
		fcb $15
		fcb $14
		fcb   0
		fcb   8
		fcb $16
		fcb $14
		fcb   0
		fcb $10
		fcb $17
		fcb $14
		fcb   0
		fcb $18
		fcb $1B
		fcb   8
		fcb $10
		fcb $18
		fcb $19
		fcb   8
		fcb $10
		fcb   8
		fcb $1A
		fcb   8
		fcb $10
		fcb $10
		fcb $1B
		fcb   8
		fcb $10
		fcb $18
		fcb $1F
		fcb  $C
		fcb $10
		fcb $18
		fcb $1D
		fcb  $C
		fcb $10
		fcb   8
		fcb $1E
		fcb  $C
		fcb $10
		fcb $10
		fcb $1F
		fcb  $C
		fcb $10
		fcb $18
		fcb $20
		fcb $21	; !
		fcb $22	; "
		fcb $23	; #
		fcb $27	; '
		fcb $25	; %
		fcb $26	; &
		fcb $27	; '
		fcb $28	; (
		fcb $28	; (
		fcb $2A	; *
		fcb $2A	; *
		fcb $2C	; ,
		fcb $2C	; ,
		fcb $2E	; .
		fcb $2E	; .
		fcb $30	; 0
		fcb $31	; 1
		fcb $30	; 0
		fcb $31	; 1
		fcb $34	; 4
		fcb $35	; 5
		fcb $34	; 4
		fcb $35	; 5
		fcb $38	; 8
		fcb $38	; 8
		fcb $38	; 8
		fcb $38	; 8
		fcb $3C	; <
		fcb $3C	; <
		fcb $3C	; <
		fcb $3C	; <
; ---------------------------------------------------------------------------
		lda	word_22EF
		lbmi	locret_C92D
		ldx	unk_21F1
		lda	5,x
		anda	#$BF ; 'ø'
		sta	5,x
		ldx	word_22F1
		ldb	word_22EF+1
		lda	$10,x
		bne	loc_C8E7
		lda	word_22EF
		anda	#3
		beq	locret_C92D
		cmpb	unk_25C0
		bne	loc_C8BE
		clr	unk_25C0

loc_C8BE:				; CODE XREF: ROM:C8B9j
		ldx	unk_21F1
		leax	-$C,x

loc_C8C3:				; CODE XREF: ROM:C8D2j
		lda	$10,x
		beq	locret_C92D
		cmpa	word_22EF+1
		beq	loc_C8D4
		jsr	_LoadICBUnknown
		tfr	a, b
		bra	loc_C8C3
; ---------------------------------------------------------------------------

loc_C8D4:				; CODE XREF: ROM:C8CBj
		clr	$10,x
		stb	word_22EF+1
		stx	word_22F1
		lda	word_22EF
		oraa	#$80 ; 'Ä'
		sta	word_22EF
		bra	loc_C924
; ---------------------------------------------------------------------------

loc_C8E7:				; CODE XREF: ROM:C8ADj	ROM:C91Fj
		cmpb	unk_25C0
		bne	loc_C8EF
		clr	unk_25C0

loc_C8EF:				; CODE XREF: ROM:C8EAj
		pshs	a,x,u
		jsr	_LoadICBUnknown
		tfr	b, a
		jsr	sub_875A
		ldu	1,s
		stu	3,s
		stx	1,s
		lda	#$16

loc_C901:				; CODE XREF: ROM:C906j
		ldb	,x+
		stb	,u+
		deca
		bne	loc_C901
		puls	u,x,b
		lda	unk_25C0
		bne	loc_C919
		lda	$12,x
		bita	#8
		beq	loc_C919
		stb	unk_25C0

loc_C919:				; CODE XREF: ROM:C90Dj	ROM:C914j
		stb	$10,u
		lda	$10,x
		bne	loc_C8E7
		clr	$10,u

loc_C924:				; CODE XREF: ROM:C8E5j
		jsr	sub_877C
		jsr	sub_8923
		jmp	sub_D354
; ---------------------------------------------------------------------------

locret_C92D:				; CODE XREF: ROM:C897j	ROM:C8B4j ...
		rts
; ---------------------------------------------------------------------------
_NoteFreqTable:	NoteFreq <   $25,      1,   2867> ; DATA XREF: ROM:92AAo
		NoteFreq <   $25,      1,   2706> ; (12	MHz / 32.70 (C-1)) >> 7	= 2867
		NoteFreq <   $25,      1,   2554> ; (12	MHz / 65.41 (C-2)) >> 7	= 1433
		NoteFreq <   $25,      1,   2411> ; (12	MHz / 69.30 (C#2)) >> 6	= 2706
		NoteFreq <   $25,      1,   2275>
		NoteFreq <   $25,      1,   2148>
		NoteFreq <   $25,      3,   2027>
		NoteFreq <   $25,      6,   1913>
		NoteFreq <   $25,      9,   1806>
		NoteFreq <   $25,     12,   1705>
		NoteFreq <   $25,     15,   1609>
		NoteFreq <   $25,     18,   1519>
		NoteFreq <   $25,     21,   1433>
		NoteFreq <   $26,     24,   2706>
		NoteFreq <   $26,     27,   2554>
		NoteFreq <   $26,     30,   2411>
		NoteFreq <   $26,     33,   2275>
		NoteFreq <   $26,     36,   2148>
		NoteFreq <   $26,     39,   2027>
		NoteFreq <   $26,     42,   1913>
		NoteFreq <   $26,     45,   1806>
		NoteFreq <   $26,     48,   1705>
		NoteFreq <   $26,     51,   1609>
		NoteFreq <   $26,     54,   1519>
		NoteFreq <   $26,     57,   1433>
		NoteFreq <   $27,     60,   2706>
		NoteFreq <   $27,     63,   2554>
		NoteFreq <   $27,     66,   2411>
		NoteFreq <   $27,     69,   2275>
		NoteFreq <   $27,     72,   2148>
		NoteFreq <   $27,     75,   2027>
		NoteFreq <   $27,     78,   1913>
		NoteFreq <   $27,     81,   1806>
		NoteFreq <   $27,     84,   1705>
		NoteFreq <   $27,     87,   1609>
		NoteFreq <   $27,     90,   1519>
		NoteFreq <   $27,     93,   1433>
		NoteFreq <   $28,     96,   2706>
		NoteFreq <   $28,     99,   2554>
		NoteFreq <   $28,    102,   2411>
		NoteFreq <   $28,    105,   2275>
		NoteFreq <   $28,    108,   2148>
		NoteFreq <   $28,    111,   2027>
		NoteFreq <   $28,    114,   1913>
		NoteFreq <   $28,    117,   1806>
		NoteFreq <   $28,    120,   1705>
		NoteFreq <   $28,    123,   1609>
		NoteFreq <   $28,    126,   1519>
		NoteFreq <   $28,    129,   1433>
		NoteFreq <   $29,    132,   2706>
		NoteFreq <   $29,    135,   2554>
		NoteFreq <   $29,    138,   2411>
		NoteFreq <   $29,    141,   2275>
		NoteFreq <   $29,    144,   2148>
		NoteFreq <   $29,    147,   2027>
		NoteFreq <   $29,    150,   1913>
		NoteFreq <   $29,    153,   1806>
		NoteFreq <   $29,    156,   1705>
		NoteFreq <   $29,    159,   1609>
		NoteFreq <   $29,    162,   1519>
		NoteFreq <   $29,    165,   1433>
		NoteFreq <   $2A,    168,   2706>
		NoteFreq <   $2A,    171,   2554>
		NoteFreq <   $2A,    174,   2411>
		NoteFreq <   $2A,    177,   2275>
		NoteFreq <   $2A,    180,   2148>
		NoteFreq <   $2A,    183,   2027>
		NoteFreq <   $2A,    186,   1913>
		NoteFreq <   $2A,    189,   1806>
		NoteFreq <   $2A,    192,   1705>
		NoteFreq <   $2A,    195,   1609>
		NoteFreq <   $2A,    198,   1519>
		NoteFreq <   $2A,    201,   1433>
		NoteFreq <   $2A,    204,   1353>
		NoteFreq <   $2A,    207,   1277>
		NoteFreq <   $2A,    210,   1205>
		NoteFreq <   $2A,    213,   1138>
		NoteFreq <   $2A,    219,   1074>
		NoteFreq <   $2A,    222,   1014>
		NoteFreq <   $2A,    225,    957>
		NoteFreq <   $2A,    228,    903>
		NoteFreq <   $2A,    231,    852>
		NoteFreq <   $2A,    234,    804>
		NoteFreq <   $2A,    237,    759>
		NoteFreq <   $2A,    240,    717>
		NoteFreq <   $2A,    243,    676>
		NoteFreq <   $2A,    246,    638>
		NoteFreq <   $2A,    249,    603>
		NoteFreq <   $2A,    252,    569>
		NoteFreq <   $2A,    255,    537>
		NoteFreq <   $2A,    255,    507>
		fcb $14
		fcb $FF
		fcb   8
		fcb $F5	; ı
		fcb $14
		fcb $FF
		fcb   8
		fcb $75	; u
		fcb $15
		fcb $FF
		fcb  $F
		fcb $F6	; ˆ
		fcb $15
		fcb $FF
		fcb  $F
		fcb $11
		fcb $15
		fcb $FF
		fcb  $E
		fcb $38	; 8
		fcb $15
		fcb $FF
		fcb  $D
		fcb $6C	; l
		fcb $15
		fcb $FF
		fcb  $C
		fcb $AB	; ´
		fcb $15
		fcb $FF
		fcb  $B
		fcb $F5	; ı
		fcb $15
		fcb $FF
		fcb  $B
		fcb $49	; I
		fcb $15
		fcb $FF
		fcb  $A
		fcb $A7	; ß
		fcb $15
		fcb $FF
		fcb  $A
		fcb  $E
		fcb $15
		fcb $FF
		fcb   9
		fcb $7E	; ~
		fcb $15
		fcb $FF
		fcb   8
		fcb $F5	; ı
		fcb $15
		fcb $FF
		fcb   8
		fcb $75	; u
		fcb $15
		fcb $FF
		fcb   7
		fcb $FB	; ˚
		fcb $15
		fcb $FF
		fcb   7
		fcb $88	; à
		fcb $15
		fcb $FF
		fcb   7
		fcb $1C
		fcb $15
		fcb $FF
		fcb   6
		fcb $B6	; ∂
		fcb $15
		fcb $EF	; Ô
		fcb   6
		fcb $AB	; ´
		fcb $15
		fcb $DE	; ﬁ
		fcb   6
		fcb $AB	; ´
		fcb $15
		fcb $CE	; Œ
		fcb   6
		fcb $AA	; ™
		fcb $15
		fcb $BF	; ø
		fcb   6
		fcb $A9	; ©
		fcb $15
		fcb $B1	; ±
		fcb   6
		fcb $A6	; ¶
		fcb $15
		fcb $A3	; £
		fcb   6
		fcb $A9	; ©
		fcb $15
		fcb $96	; ñ
		fcb   6
		fcb $AB	; ´
		fcb $15
		fcb $8A	; ä
		fcb   6
		fcb $AA	; ™
		fcb $15
		fcb $7F	; 
		fcb   6
		fcb $A7	; ß
		fcb $15
		fcb $74	; t
		fcb   6
		fcb $A9	; ©
		fcb $15
		fcb $6A	; j
		fcb   6
		fcb $A7	; ß
		fcb $15
		fcb $60	; `
		fcb   6
		fcb $AB	; ´
		fcb $15
		fcb $57	; W
		fcb   6
		fcb $AB	; ´
		fcb $15
		fcb $4F	; O
		fcb   6
		fcb $A5	; •
		fcb $15
		fcb $47	; G
		fcb   6
		fcb $A4	; §
		fcb $15
		fcb $3F	; ?
		fcb   6
		fcb $A9	; ©
		fcb $15
		fcb $38	; 8
		fcb   6
		fcb $A6	; ¶
		fcb $15
		fcb $31	; 1
		fcb   6
		fcb $A9	; ©
		fcb $15
		fcb $2B	; +
		fcb   6
		fcb $A3	; £
		fcb $15
		fcb $25	; %
		fcb   6
		fcb $A2	; ¢
		fcb $15
		fcb $1F
		fcb   6
		fcb $A7	; ß
		fcb $15
		fcb $1A
		fcb   6
		fcb $9F	; ü
		fcb $15
		fcb $14
		fcb   6
		fcb $B1	; ±
		fcb $15
		fcb $10
		fcb   6
		fcb $A1	; °
		fcb $15
		fcb  $B
		fcb   6
		fcb $AB	; ´
		fcb $15
		fcb   7
		fcb   6
		fcb $A5	; •
		fcb $15
		fcb   3
		fcb   6
		fcb $A4	; §
		fcb   5
		fcb $3F	; ?
		fcb   6
		fcb $A9	; ©
		fcb   5
		fcb $3B	; ;
		fcb   6
		fcb $B4	; ¥
		fcb   5
		fcb $38	; 8
		fcb   6
		fcb $A9	; ©
		fcb   5
		fcb $35	; 5
		fcb   6
		fcb $A3	; £
		fcb   5
		fcb $32	; 2
		fcb   6
		fcb $A2	; ¢
		fcb   5
		fcb $2F	; /
		fcb   6
		fcb $A7	; ß
		fcb   5
		fcb $2C	; ,
		fcb   6
		fcb $B2	; ≤
		fcb   5
		fcb $2A	; *
		fcb   6
		fcb $9D	; ù
		fcb   5
		fcb $27	; '
		fcb   6
		fcb $B6	; ∂
		fcb   5
		fcb $25	; %
		fcb   6
		fcb $AB	; ´
		fcb   5
		fcb $23	; #
		fcb   6
		fcb $A5	; •
		fcb   5
		fcb $21	; !
		fcb   6
		fcb $A4	; §
		fcb   5
		fcb $1F
		fcb   6
		fcb $A9	; ©
		fcb   5
		fcb $1D
		fcb   6
		fcb $B4	; ¥
		fcb   5
		fcb $1C
		fcb   6
		fcb $8C	; å
		fcb   5
		fcb $1A
		fcb   6
		fcb $A3	; £
		fcb   5
		fcb $18
		fcb   6
		fcb $C4	; ƒ
		fcb   5
		fcb $17
		fcb   6
		fcb $A7	; ß
		fcb   5
		fcb $16
		fcb   6
		fcb $8D	; ç
		fcb   5
		fcb $14
		fcb   6
		fcb $C6	; ∆
		fcb   5
		fcb $13
		fcb   6
		fcb $B6	; ∂
		fcb   5
		fcb $12
		fcb   6
		fcb $AB	; ´
		fcb   5
		fcb $11
		fcb   6
		fcb $A5	; •
		fcb   5
		fcb $10
		fcb   6
		fcb $A4	; §
		fcb   5
		fcb  $F
		fcb   6
		fcb $A9	; ©
		fcb   5
		fcb  $E
		fcb   6
		fcb $B4	; ¥
		fcb   5
		fcb  $D
		fcb   6
		fcb $C8	; »
		fcb   5
		fcb  $C
		fcb   6
		fcb $E4	; ‰
		fcb   5
		fcb  $C
		fcb   6
		fcb $81	; Å
		fcb   5
		fcb  $B
		fcb   6
		fcb $A7	; ß
		fcb   5
		fcb  $A
		fcb   6
		fcb $D9	; Ÿ
		fcb   5
		fcb  $A
		fcb   6
		fcb $77	; w
		fcb   5
		fcb   9
		fcb   6
		fcb $B6	; ∂
		fcb   5
		fcb   9
		fcb   6
		fcb $56	; V
		fcb   5
		fcb   8
		fcb   6
		fcb $A5	; •
		fcb   5
		fcb   7
		fcb   7
		fcb  $E
		fcb   5
		fcb   7
		fcb   6
		fcb $A9	; ©
		fcb   5
		fcb   7
		fcb   6
		fcb $49	; I
		fcb   5
		fcb   6
		fcb   6
		fcb $C8	; »
		fcb   5
		fcb   6
		fcb   6
		fcb $66	; f
		fcb   5
		fcb   5
		fcb   7
		fcb  $C
		fcb   5
		fcb   5
		fcb   6
		fcb $A7	; ß
		fcb   5
		fcb   5
		fcb   6
		fcb $47	; G
		fcb   5
		fcb   4
		fcb   7
		fcb $1C
		fcb   5
		fcb   4
		fcb   6
		fcb $B6	; ∂
		fcb   5
		fcb   4
		fcb   6
		fcb $56	; V
; ---------------------------------------------------------------------------

loc_CC06:				; CODE XREF: ROM:8211P
		ldx	#$1F2B
		lda	#$20 ; ' '

loc_CC0B:				; CODE XREF: ROM:CC10j
		sta	,x+
		cmpx	#$1FAF
		bcs	loc_CC0B
		ldx	#$DD14
		ldu	#$1F41
		jsr	strcpy		; x=src, u=dst
		ldx	#$DD00
		ldu	#$1F2B
		jsr	strcpy		; x=src, u=dst
		ldx	#$DDC4
		ldu	#$1F83
		jsr	strcpy		; x=src, u=dst
		ldx	#$1F2B
		stx	word_1F29
		rts
; ---------------------------------------------------------------------------
		lda	word_2005
		cmpa	word_1FB5
		bcc	loc_CC3F
		sta	word_1FB5

loc_CC3F:				; CODE XREF: ROM:CC3Aj
		ldb	#$FF
		lda	,x
		bne	loc_CC4F
		lda	word_2D66
		bne	locret_CC8F
		lda	#$19
		sta	word_2D66

loc_CC4F:				; CODE XREF: ROM:CC43j
		stb	word_1F2B
		ldb	#$40 ; '@'
		jsr	sub_A0CF
		ldb	#$5F ; '_'
		lda	word_5FFF
		coma
		sta	word_5FFF
		cmpa	word_5FFF
		bne	loc_CC67
		ldb	#$20 ; ' '

loc_CC67:				; CODE XREF: ROM:CC63j
		cmpb	word_1F32
		beq	loc_CC74
		stb	word_1F32
		lda	#$FF
		sta	word_1F2B

loc_CC74:				; CODE XREF: ROM:CC6Aj
		ldb	word_2005
		addb	#$30 ; '0'
		lda	#$2C ; ','
		cmpb	#$3A ; ':'
		bcs	loc_CC81
		ldb	#$2A ; '*'

loc_CC81:				; CODE XREF: ROM:CC7Dj
		std	word_1F3D+1
		sta	word_1F38
		tst	word_1FAF
		bmi	locret_CC8F
		std	word_1F3D

locret_CC8F:				; CODE XREF: ROM:CC48j	ROM:CC8Aj
		rts
; ---------------------------------------------------------------------------

loc_CC90:				; CODE XREF: sub_D354+20P
		ldb	word_22EF
		bmi	loc_CCB0
		tsta
		beq	loc_CCB0
		jsr	_LoadICBUnknown
		leau	$A,x
		ldy	#$1F2B
		lda	#$FF
		sta	,y+
		pulu	x,b,a
		std	,y++
		stx	,y++
		pulu	b,a
		std	,y
		rts
; ---------------------------------------------------------------------------

loc_CCB0:				; CODE XREF: ROM:CC93j	ROM:CC96j
		lda	#$FF
		ldy	#$1F2B
		sta	,y+
		ldd	#$2020
		std	,y++
		std	,y++
		std	,y++
		rts
; ---------------------------------------------------------------------------

loc_CCC2:				; CODE XREF: ROM:loc_A65DJ sub_D5B9+7P ...
		ldu	#$1F39
		ldb	#$20 ; ' '
		stb	,u+
		tfr	a, b
		lda	#$2B ; '+'
		tstb
		bpl	loc_CCD3
		negb
		lda	#$2D ; '-'

loc_CCD3:				; CODE XREF: ROM:CCCEj
		sta	,u
		clra
		sta	word_1FAF

loc_CCD9:				; CODE XREF: ROM:CD1Bj	ROM:CD20j
		jsr	sub_CD74

loc_CCDC:				; CODE XREF: ROM:CCEBj
		lda	#$FF
		sta	word_1F2B
		rts
; ---------------------------------------------------------------------------

loc_CCE2:				; CODE XREF: sub_A127-7P ROM:B5B7P ...
		std	word_1F38+1
		stu	word_1F3B

loc_CCE8:				; CODE XREF: ROM:CCF3j
		clr	word_1FAF
		bra	loc_CCDC
; ---------------------------------------------------------------------------
		std	word_1F34
		stu	word_1F36
		bra	loc_CCE8
; ---------------------------------------------------------------------------

loc_CCF5:				; CODE XREF: ROM:DFDBP
		ldu	#$1F39
		ldb	#$20 ; ' '
		stb	,u+
		ldb	#$FF
		stb	word_1FAF
		tfr	a, b
		mul
		pshs	a
		lda	#$E
		mul
		ldb	,s
		sta	,s
		lda	#$E
		mul
		addb	,s+
		adca	#0
		addd	#$16
		cmpd	#$384
		bls	loc_CCD9
		ldd	#$384
		bra	loc_CCD9
; ---------------------------------------------------------------------------

loc_CD22:				; CODE XREF: ROM:loc_FBA3P ROM:FBBBP
		ldx	#$1F49
		std	,x++
		stu	,x
		ldx	#$1F41
		lda	#$FF
		sta	,x+
		lda	word_1D15
		asla
		asla
		ldu	#$CD43
		leau	a,u
		ldd	,u++
		std	,x++
		ldd	,u
		std	,x
		rts
; ---------------------------------------------------------------------------
		fcb $4D	; M
		fcb $49	; I
		fcb $44	; D
		fcb $49	; I
		fcb $4D	; M
		fcb $49	; I
		fcb $44	; D
		fcb $32	; 2
		fcb $4D	; M
		fcb $39	; 9
		fcb $4B	; K
		fcb $36	; 6
unk_CD4F:	fcb $8E	; é		; CODE XREF: ROM:BD32P
		fcb $1F
		fcb $50	; P
		fcb $20
		fcb $D1	; —

; =============== S U B	R O U T	I N E =======================================

; x=src, u=dst

strcpy:					; CODE XREF: sub_89E0+4BP sub_89E0+7AP ...
		lda	#$FF
		sta	,u+
		ldb	,x+

loc_CD5A:				; CODE XREF: strcpy+Bj
		lda	,x+
		sta	,u+
		decb
		bne	loc_CD5A
		rts
; End of function strcpy

; ---------------------------------------------------------------------------

loc_CD62:				; CODE XREF: ROM:D459J
		stx	word_1F29
		lda	#$FF
		sta	,x
		rts
; ---------------------------------------------------------------------------
		lda	#$20 ; ' '
		ldb	#$16

loc_CD6E:				; CODE XREF: ROM:CD71j
		sta	,x+
		decb
		bne	loc_CD6E
		rts

; =============== S U B	R O U T	I N E =======================================


sub_CD74:				; CODE XREF: ROM:loc_CCD9P
		pshs	a,x
		ldx	#$1FB0
		clra
		sta	,x
		sta	1,x
		sta	2,x
		inca
		sta	3,x

loc_CD83:				; CODE XREF: sub_CD74+37j
		lsr	,s
		rorb
		bcc	loc_CD96
		lda	3,x
		adda	1,x
		daa
		sta	1,x
		lda	2,x
		adca	,x
		daa
		sta	,x

loc_CD96:				; CODE XREF: sub_CD74+12j
		tst	,s
		bne	loc_CD9D
		tstb
		beq	loc_CDAD

loc_CD9D:				; CODE XREF: sub_CD74+24j
		lda	3,x
		adda	3,x
		daa
		sta	3,x
		lda	2,x
		adca	2,x
		daa
		sta	2,x
		bra	loc_CD83
; ---------------------------------------------------------------------------

loc_CDAD:				; CODE XREF: sub_CD74+27j
		lda	word_1FAF
		bpl	loc_CDBE
		lda	,x
		bne	loc_CDBA
		lda	#$20 ; ' '
		bra	loc_CDBC
; ---------------------------------------------------------------------------

loc_CDBA:				; CODE XREF: sub_CD74+40j
		adda	#$30 ; '0'

loc_CDBC:				; CODE XREF: sub_CD74+44j
		sta	,u

loc_CDBE:				; CODE XREF: sub_CD74+3Cj
		lda	1,x
		lsra
		lsra
		lsra
		lsra
		bne	loc_CDCD
		lda	#$20 ; ' '
		ldb	,x
		beq	loc_CDDA
		clra

loc_CDCD:				; CODE XREF: sub_CD74+50j
		adda	#$30 ; '0'
		tst	word_1FAF
		bpl	loc_CDDA
		ldb	#$2E ; '.'
		stb	1,u
		leau	1,u

loc_CDDA:				; CODE XREF: sub_CD74+56j sub_CD74+5Ej
		sta	1,u
		lda	1,x
		anda	#$F
		adda	#$30 ; '0'
		sta	2,u
		tst	word_1FAF
		bpl	locret_CDEB
		leau	-1,u

locret_CDEB:				; CODE XREF: sub_CD74+73j
		puls	pc,x,a
; End of function sub_CD74

; ---------------------------------------------------------------------------
		fcb $34	; 4
		fcb   6
		fcb $A6	; ¶
		fcb $80	; Ä
		fcb $6D	; m
		fcb $E4	; ‰
		fcb $27	; '
		fcb $18
		fcb $84	; Ñ
		fcb $7F	; 
		fcb $81	; Å
		fcb $5F	; _
		fcb $23	; #
		fcb   2
		fcb $80	; Ä
		fcb $20
		fcb $81	; Å
		fcb $20
		fcb $24	; $
		fcb   2
		fcb $86	; Ü
		fcb $20
		fcb $81	; Å
		fcb $2E	; .
		fcb $27	; '
		fcb   4
		fcb $81	; Å
		fcb $2C	; ,
		fcb $26	; &
		fcb   2
		fcb $6C	; l
		fcb $61	; a
		fcb $C6	; ∆
		fcb   8
		fcb $34	; 4
		fcb   7
		fcb $1A
		fcb $50	; P
		fcb $68	; h
		fcb $61	; a
		fcb $46	; F
		fcb $84	; Ñ
		fcb $C0	; ¿
		fcb $8A	; ä
		fcb $40	; @
		fcb $B7	; ∑
		fcb   1
		fcb $20
		fcb $84	; Ñ
		fcb $BF	; ø
		fcb $B7	; ∑
		fcb   1
		fcb $20
		fcb $6A	; j
		fcb $62	; b
		fcb $26	; &
		fcb $ED	; Ì
		fcb $35	; 5
		fcb   7
		fcb $34	; 4
		fcb $10
		fcb $BD	; Ω
		fcb $B6	; ∂
		fcb $A7	; ß
		fcb $35	; 5
		fcb $10
		fcb $6A	; j
		fcb $61	; a
		fcb $26	; &
		fcb $BC	; º
		fcb $4F	; O
		fcb $B7	; ∑
		fcb   1
		fcb $20
		fcb $35	; 5
		fcb $86	; Ü
unk_CE39:	fcb $8E	; é		; CODE XREF: ROM:loc_B8EBP
		fcb $DC	; ‹
		fcb $CA	;  
		fcb $B6	; ∂
		fcb   1
		fcb $32	; 2
		fcb $2A	; *
		fcb   4
		fcb $A6	; ¶
		fcb $80	; Ä
		fcb $30	; 0
		fcb $86	; Ü
		fcb $CE	; Œ
		fcb $1F
		fcb $57	; W
		fcb $BD	; Ω
		fcb $CD	; Õ
		fcb $54	; T
		fcb $8E	; é
		fcb $1F
		fcb $57	; W
		fcb $BD	; Ω
		fcb $CD	; Õ
		fcb $62	; b
		fcb $39	; 9
unk_CE52:	fcb $8E	; é		; CODE XREF: ROM:B8FBP
		fcb $DC	; ‹
		fcb $EE	; Ó
		fcb $CE	; Œ
		fcb $1F
		fcb $57	; W
		fcb $BD	; Ω
		fcb $CD	; Õ
		fcb $54	; T
		fcb $F6	; ˆ
		fcb $20
		fcb   5
		fcb $CE	; Œ
		fcb $1F
		fcb $58	; X
		fcb $4F	; O
		fcb $B7	; ∑
		fcb $1F
		fcb $AF	; Ø
		fcb $BD	; Ω
		fcb $CD	; Õ
		fcb $74	; t
		fcb $CE	; Œ
		fcb $1F
		fcb $63	; c
		fcb $F6	; ˆ
		fcb $20
		fcb   2
		fcb $C4	; ƒ
		fcb $7F	; 
		fcb $5A	; Z
		fcb $4F	; O
		fcb $BD	; Ω
		fcb $CD	; Õ
		fcb $74	; t
		fcb $39	; 9
unk_CE76:	fcb $BE	; æ		; CODE XREF: ROM:B59AP
		fcb $1F
		fcb $29	; )
		fcb $8C	; å
		fcb $1F
		fcb $2B	; +
		fcb $27	; '
		fcb   5
		fcb $A6	; ¶
		fcb $84	; Ñ
		fcb $26	; &
		fcb   4
		fcb $39	; 9
		fcb $BD	; Ω
		fcb $CC	; Ã
		fcb $34	; 4
		fcb $6F	; o
		fcb $80	; Ä
		fcb $34	; 4
		fcb $10
		fcb $8E	; é
		fcb $CE	; Œ
		fcb $9B	; õ
		fcb $4F	; O
		fcb $C6	; ∆
		fcb   3
		fcb $BD	; Ω
		fcb $CD	; Õ
		fcb $ED	; Ì
		fcb $35	; 5
		fcb $10
		fcb $43	; C
		fcb $C6	; ∆
		fcb $10
		fcb $7E	; ~
		fcb $CD	; Õ
		fcb $ED	; Ì
		fcb $C0	; ¿
		fcb $FF
		fcb $AF	; Ø
		fcb $BD	; Ω
		fcb $81	; Å
		fcb $CD	; Õ
		fcb $86	; Ü
		fcb $20
		fcb $34	; 4
		fcb   2
		fcb $8E	; é
		fcb $22	; "
		fcb $F5	; ı
		fcb $CE	; Œ
		fcb $25	; %
		fcb $D5	; ’
		fcb $10
		fcb $8E	; é
		fcb $2D	; -
		fcb $67	; g
		fcb $A6	; ¶
		fcb   5
		fcb $84	; Ñ
		fcb $70	; p
		fcb $27	; '
		fcb $34	; 4
		fcb $E6	; Ê
		fcb $C4	; ƒ
		fcb $27	; '
		fcb $30	; 0
		fcb $E6	; Ê
		fcb $A4	; §
		fcb $26	; &
		fcb $2C	; ,
		fcb $E7	; Á
		fcb $C4	; ƒ
		fcb $44	; D
		fcb $44	; D
		fcb $44	; D
		fcb $34	; 4
		fcb $50	; P
		fcb $CE	; Œ
		fcb $CE	; Œ
		fcb $F8	; ¯
		fcb $AD	; ≠
		fcb $D6	; ÷
		fcb $BD	; Ω
		fcb $8C	; å
		fcb $73	; s
		fcb $27	; '
		fcb $19
		fcb $86	; Ü
		fcb  $C
		fcb $A7	; ß
		fcb $84	; Ñ
		fcb $A6	; ¶
		fcb $64	; d
		fcb $80	; Ä
		fcb $20
		fcb $40	; @
		fcb $A7	; ß
		fcb   1
		fcb $EE	; Ó
		fcb $E4	; ‰
		fcb $E6	; Ê
		fcb $C8	; »
		fcb $15
		fcb $C4	; ƒ
		fcb  $F
		fcb $EB	; Î
		fcb $44	; D
		fcb $E7	; Á
		fcb   2
		fcb $BD	; Ω
		fcb $AA	; ™
		fcb $82	; Ç
		fcb $35	; 5
		fcb $50	; P
		fcb $30	; 0
		fcb $88	; à
		fcb $16
		fcb $33	; 3
		fcb $41	; A
		fcb $31	; 1
		fcb $21	; !
		fcb $6A	; j
		fcb $E4	; ‰
		fcb $26	; &
		fcb $BB	; ª
		fcb $32	; 2
		fcb $61	; a
		fcb $20
		fcb $39	; 9
		fcb $CF	; œ
		fcb $2D	; -
		fcb $CF	; œ
		fcb   8
		fcb $CF	; œ
		fcb $20
		fcb $CF	; œ
		fcb $2D	; -
		fcb $CF	; œ
		fcb $2D	; -
		fcb $CF	; œ
		fcb $2D	; -
		fcb $CF	; œ
		fcb $2D	; -
		fcb $CF	; œ
		fcb $2D	; -
		fcb $A6	; ¶
		fcb $88	; à
		fcb $15
		fcb $2B	; +
		fcb   9
		fcb $4C	; L
		fcb $81	; Å
		fcb   4
		fcb $25	; %
		fcb  $A
		fcb $8B	; ã
		fcb $80	; Ä
		fcb $20
		fcb   6
		fcb $4A	; J
		fcb $81	; Å
		fcb $80	; Ä
		fcb $26	; &
		fcb   1
		fcb $4F	; O
		fcb $A7	; ß
		fcb $88	; à
		fcb $15
		fcb $39	; 9
		fcb $A6	; ¶
		fcb $88	; à
		fcb $15
		fcb $4C	; L
		fcb $81	; Å
		fcb   4
		fcb $23	; #
		fcb   1
		fcb $4F	; O
		fcb $A7	; ß
		fcb $88	; à
		fcb $15
		fcb $39	; 9
		fcb $6F	; o
		fcb $88	; à
		fcb $15
		fcb $39	; 9
		fcb $FE	; ˛
		fcb $22	; "
		fcb $2F	; /
		fcb $26	; &
		fcb   6
		fcb $86	; Ü
		fcb $FF
		fcb $20
		fcb   8
		fcb $EE	; Ó
		fcb $4C	; L
		fcb $6D	; m
		fcb $4C	; L
		fcb $26	; &
		fcb $FA	; ˙
		fcb $A6	; ¶
		fcb $42	; B
		fcb $B7	; ∑
		fcb $25	; %
		fcb $CF	; œ
		fcb $5F	; _
		fcb $4F	; O
		fcb $FD	; ˝
		fcb $25	; %
		fcb $D2	; “
		fcb $8E	; é
		fcb $21	; !
		fcb $F3	; Û
		fcb $10
		fcb $8E	; é
		fcb $94	; î
		fcb $C3	; √
		fcb $CE	; Œ
		fcb $11
		fcb $3E	; >
		fcb $6F	; o
		fcb $C0	; ¿
		fcb $A6	; ¶
		fcb $84	; Ñ
		fcb $10
		fcb $2A	; *
		fcb   1
		fcb $5F	; _
		fcb $85	; Ö
		fcb $10
		fcb $26	; &
		fcb $32	; 2
		fcb $85	; Ö
		fcb $40	; @
		fcb $10
		fcb $26	; &
		fcb   1
		fcb $55	; U
		fcb $34	; 4
		fcb $76	; v
		fcb $B6	; ∂
		fcb $10
		fcb $E6	; Ê
		fcb $BA	; ∫
		fcb $2B	; +
		fcb  $B
		fcb $BA	; ∫
		fcb $2B	; +
		fcb   3
		fcb $10
		fcb $26	; &
		fcb   1
		fcb $44	; D
		fcb $BD	; Ω
		fcb $8C	; å
		fcb $73	; s
		fcb $10
		fcb $27	; '
		fcb   1
		fcb $3D	; =
		fcb $86	; Ü
		fcb   8
		fcb $A7	; ß
		fcb $84	; Ñ
		fcb $E7	; Á
		fcb   2
		fcb $86	; Ü
		fcb $FF
		fcb $A7	; ß
		fcb   1
		fcb $BD	; Ω
		fcb $AA	; ™
		fcb $82	; Ç
		fcb $35	; 5
		fcb $76	; v
		fcb $8A	; ä
		fcb $40	; @
		fcb $A7	; ß
		fcb $84	; Ñ
		fcb $7E	; ~
		fcb $D0	; –
		fcb $BB	; ª
		fcb $34	; 4
		fcb $76	; v
		fcb $10
		fcb $AE	; Æ
		fcb $A4	; §
		fcb $EE	; Ó
		fcb   1
		fcb $FF
		fcb $25	; %
		fcb $D0	; –
		fcb $85	; Ö
		fcb   6
		fcb $26	; &
		fcb $7E	; ~
		fcb $A6	; ¶
		fcb $43	; C
		fcb $2A	; *
		fcb $7A	; z
		fcb $85	; Ö
		fcb   1
		fcb $27	; '
		fcb $44	; D
		fcb $A6	; ¶
		fcb $41	; A
		fcb $26	; &
		fcb $40	; @
		fcb $A6	; ¶
		fcb $42	; B
		fcb $B1	; ±
		fcb $25	; %
		fcb $CF	; œ
		fcb $27	; '
		fcb $39	; 9
		fcb $A6	; ¶
		fcb $48	; H
		fcb $8E	; é
		fcb $8D	; ç
		fcb $1B
		fcb $A6	; ¶
		fcb $96	; ñ
		fcb $F6	; ˆ
		fcb $2E	; .
		fcb $67	; g
		fcb $3D	; =
		fcb $4C	; L
		fcb $34	; 4
		fcb   2
		fcb $F6	; ˆ
		fcb $3D	; =
		fcb $54	; T
		fcb $C5	; ≈
		fcb   1
		fcb $27	; '
		fcb $42	; B
		fcb $E6	; Ê
		fcb $47	; G
		fcb $3D	; =
		fcb $C3	; √
		fcb   0
		fcb $FF
		fcb $E6	; Ê
		fcb $E4	; ‰
		fcb $A7	; ß
		fcb $E4	; ‰
		fcb $A6	; ¶
		fcb $46	; F
		fcb $3D	; =
		fcb $EB	; Î
		fcb $E0	; ‡
		fcb $89	; â
		fcb   0
		fcb $10
		fcb $A3	; £
		fcb $A8	; ®
		fcb $12
		fcb $24	; $
		fcb $3C	; <
		fcb $EC	; Ï
		fcb $A8	; ®
		fcb $12
		fcb $83	; É
		fcb   1
		fcb   0
		fcb $22	; "
		fcb $34	; 4
		fcb $CC	; Ã
		fcb   1
		fcb   0
		fcb $20
		fcb $2F	; /
		fcb $A6	; ¶
		fcb $48	; H
		fcb $8E	; é
		fcb $8D	; ç
		fcb $1B
		fcb $A6	; ¶
		fcb $96	; ñ
		fcb $34	; 4
		fcb   2
		fcb $E6	; Ê
		fcb $44	; D
		fcb $F1	; Ò
		fcb $25	; %
		fcb $C0	; ¿
		fcb $26	; &
		fcb  $E
		fcb $E6	; Ê
		fcb $4B	; K
		fcb $3D	; =
		fcb $10
		fcb $B3	; ≥
		fcb $25	; %
		fcb $D2	; “
		fcb $23	; #
		fcb   3
		fcb $FD	; ˝
		fcb $25	; %
		fcb $D2	; “
		fcb $A6	; ¶
		fcb $E4	; ‰
		fcb $E6	; Ê
		fcb $47	; G
		fcb $3D	; =
		fcb $C3	; √
		fcb   0
		fcb $FF
		fcb $E6	; Ê
		fcb $E4	; ‰
		fcb $A7	; ß
		fcb $E4	; ‰
		fcb $A6	; ¶
		fcb $46	; F
		fcb $3D	; =
		fcb $EB	; Î
		fcb $E0	; ‡
		fcb $89	; â
		fdb $ED
		fcb $A8	; ®
		fcb $12
		fcb $A6	; ¶
		fcb $23	; #
		fcb $10
		fcb $26, 0, $73, $BE, $25, $D0,	$CE, $11, $53, $E6, 4
		fcb $86, $15, $3D, $33,	$CB, $A6, 4, $34, $42, $E6, 2
		fcb $BD, $8C, $56, $B6,	$25, $C0, $27, 8, $A1, $E4, $27
		fcb 4, $35, $42, $20, $15, $35,	$42, $A6, $C4, $26, $F
		fcb $1A, $10, $F6, $2D,	1, $C4,	$F8, $F7, 1, 1,	$F7, $2D
		fcb 1, $1C, $EF, $EC, $E4, $8E,	$20, 5,	$6C, $80, $EE
		fcb $84, $36, 4, $EF, $84, $85,	4, $27,	3, $7A,	$10, $CE
		fcb $BE, $25, $D0, $A6,	$84, $2B, 6, $8A, $40, $A7, $84
		fcb $20, $12, $A6, 1, $C6, 8, $3D, $CE,	$22, $2F, $33
		fcb $CB, $BD, $8C, $F9,	$27, 3,	$BD, $8C, $A2, $35, $76
		fcb $86, $80, $A7, $84,	$20, $24, $E6, $40, $C5, $20, $26
		fcb $1C, $E6, $49, $C1,	$FF, $27, $16, $3D, $E6, $40, $C5
		fcb $10, $27, 4, $44, $44, $44,	$44, $E6, $61, $EE, $66
		fcb $ED, $C1, $EF, $66,	$7C, $11, $3E, $35, $76, $30, 3
		fcb $31, $22, $5C, $C1,	$14, $10, $25, $FE, $90, $FC, $25
		fcb $D2, $FD, $10, $6F,	$B6, $25, $BF, $BD, $82, $90, $AE
		fcb $84, $26, $12, $CE,	$3D, $56, $C6, $10, $8E, $22, $6F
		fcb $4C, $A1, $C0, $26,	8, $10,	$AE, $84, $27, 3, $7E
		fcb $CE, $9E, $30, 8, $5A, $26,	$EF, $B6, $25, $D4, $27
		fcb 6, $B7, $10, $5E, $7F, $25,	$D4, $B6, $2D, $28, $10
		fcb $27, $FD, $9C, $7F,	$2D, $28, $B6, $25, $B8, $84, $60
		fcb $81, $40, $10, $26,	$FD, $8E, $1A, $10, $C6, $40, $F7
		fcb $2D, $32, $C6, 2, $F7, $2D,	$35, $CC, 0, 0,	$FD, $2D
		fcb $38, $1C, $EF, $7E,	$CE, $9E, $84, $39, $D1, $37, $D1
		fcb $51, $D1, $68, $D1,	$82, $D1, $E9, $D2, $B1, $D3, $49
		fcb $B6, $22, $EF, $88,	$40, $B7, $22, $EF, $F6, $2C, $D4
		fcb $C4, $FD, $85, $40,	$27, 2,	$CA, 2,	$F7, $2C, $D4
; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_C5D8

loc_D14D:				; CODE XREF: sub_C5D8+29J
					; sub_C7CA:loc_C7C7J ...
		clr	byte_2CC3
		rts
; END OF FUNCTION CHUNK	FOR sub_C5D8
; ---------------------------------------------------------------------------
		ldb	unk_2CD4
		andb	#$FB ; '˚'
		lda	unk_2E04
		coma
		beq	loc_D160
		lda	#$FF
		orab	#4

loc_D160:				; CODE XREF: ROM:D15Aj
		sta	unk_2E04
		stb	unk_2CD4
		bra	loc_D14D
; ---------------------------------------------------------------------------
		ldb	unk_2CD4
		andb	#$F7 ; '˜'
		lda	unk_2E0C
		eora	#$80 ; 'Ä'
		sta	unk_2E0C
		bmi	loc_D179
		orab	#8

loc_D179:				; CODE XREF: ROM:D175j
		stb	unk_2CD4
		clr	byte_2CC3
		jmp	sub_9533
; ---------------------------------------------------------------------------
		clr	unk_2E06
		ldb	unk_2CD4
		eorb	#$10
		stb	unk_2CD4
		bitb	#$10
		bne	loc_D1A0
		bitb	#$20 ; ' '
		bne	loc_D1DF

; =============== S U B	R O U T	I N E =======================================


sub_D195:				; CODE XREF: sub_D195+3Cp
		ldx	unk_21F1
		lda	5,x
		anda	#$BF ; 'ø'
		sta	5,x
		bra	loc_D1C9
; ---------------------------------------------------------------------------

loc_D1A0:				; CODE XREF: ROM:D18Fj
		bitb	#$20 ; ' '
		bne	loc_D1CC
		clrb
		ldx	unk_21F1
		lda	4,x

loc_D1AA:				; CODE XREF: sub_D195+1Cj
		incb
		jsr	_LoadICBUnknown
		lda	$10,x
		bne	loc_D1AA
		cmpb	#4
		bls	loc_D1C0
		lda	unk_2CD4
		anda	#$EF ; 'Ô'
		sta	unk_2CD4
		rts
; ---------------------------------------------------------------------------

loc_D1C0:				; CODE XREF: sub_D195+20j
		ldx	unk_21F1
		lda	5,x
		oraa	#$40 ; '@'

loc_D1C7:				; CODE XREF: ROM:D20Aj	ROM:D20Ej ...
		sta	5,x

loc_D1C9:				; CODE XREF: sub_D195+9j sub_D195+48j
		jmp	loc_D14D
; ---------------------------------------------------------------------------

loc_D1CC:				; CODE XREF: sub_D195+Dj ROM:D1FAj
		lda	#$FF
		sta	unk_2E06
		bsr	sub_D195
		bsr	sub_D214
		ldb	unk_2CD4
		orab	#$30 ; '0'

loc_D1DA:				; CODE XREF: ROM:D1E7j
		stb	unk_2CD4
		bra	loc_D1C9
; End of function sub_D195

; ---------------------------------------------------------------------------

loc_D1DF:				; CODE XREF: ROM:D193j	ROM:D212j
		clr	unk_2E06
		ldb	unk_2CD4
		andb	#$CF ; 'œ'
		bra	loc_D1DA
; ---------------------------------------------------------------------------
		clr	unk_2E06
		ldb	unk_2CD4
		eorb	#$20 ; ' '
		stb	unk_2CD4
		bitb	#$20 ; ' '
		beq	loc_D210
		bitb	#$10
		bne	loc_D1CC
		ldx	unk_21F1
		lda	5,x
		ldb	word_22EF
		bitb	#2
		bne	loc_D20C
		oraa	#3
		bra	loc_D1C7
; ---------------------------------------------------------------------------

loc_D20C:				; CODE XREF: ROM:D206j
		oraa	#2
		bra	loc_D1C7
; ---------------------------------------------------------------------------

loc_D210:				; CODE XREF: ROM:D1F6j
		bitb	#$10
		bne	loc_D1DF

; =============== S U B	R O U T	I N E =======================================


sub_D214:				; CODE XREF: sub_D195+3Ep
		ldx	unk_21F1
		lda	5,x
		ldb	word_22EF
		bitb	#2
		bne	loc_D224
		anda	#$FC ; '¸'
		bra	loc_D1C7
; ---------------------------------------------------------------------------

loc_D224:				; CODE XREF: sub_D214+Aj
		anda	#$FD ; '˝'
		bra	loc_D1C7
; End of function sub_D214


; =============== S U B	R O U T	I N E =======================================


sub_D228:				; CODE XREF: sub_D354+2EP
		clrb
		ldx	unk_21F1
		lda	6,x
		beq	loc_D232
		orab	#1

loc_D232:				; CODE XREF: sub_D228+6j
		lda	word_22EF
		bita	#$40 ; '@'
		beq	loc_D23B
		orab	#2

loc_D23B:				; CODE XREF: sub_D228+Fj
		lda	unk_2E04
		beq	loc_D242
		orab	#4

loc_D242:				; CODE XREF: sub_D228+16j
		lda	unk_2E0C
		bmi	loc_D249
		orab	#8

loc_D249:				; CODE XREF: sub_D228+1Dj
		ldx	unk_21F1
		lda	5,x		; DATA XREF: ROM:EA37r
		bita	#$40 ; '@'
		beq	loc_D290
		pshs	b
		ldx	#$8D81
		lda	unk_21F0
		asla
		asla
		ldx	a,x
		ldb	4,x
		beq	loc_D28E
		ldx	unk_21F1
		leax	-$C,x

loc_D267:				; CODE XREF: sub_D228+51j
		cmpb	$10,x
		beq	loc_D288
		lda	$10,x
		beq	loc_D28E
		cmpa	word_22EF+1
		beq	loc_D27B
		jsr	_LoadICBUnknown
		bra	loc_D267
; ---------------------------------------------------------------------------

loc_D27B:				; CODE XREF: sub_D228+4Cj sub_D228+5Ej
		jsr	_LoadICBUnknown
		cmpb	$10,x
		beq	loc_D28E
		lda	$10,x
		bne	loc_D27B

loc_D288:				; CODE XREF: sub_D228+42j
		puls	b
		orab	#$10
		bra	loc_D290
; ---------------------------------------------------------------------------

loc_D28E:				; CODE XREF: sub_D228+38j sub_D228+47j ...
		puls	b

loc_D290:				; CODE XREF: sub_D228+28j sub_D228+64j
		ldx	unk_21F1
		lda	word_22EF
		anda	#2
		bne	loc_D29C
		lda	#1

loc_D29C:				; CODE XREF: sub_D228+70j
		bita	5,x
		beq	loc_D2A4
		orab	#$20 ; ' '
		bra	loc_D2AB
; ---------------------------------------------------------------------------

loc_D2A4:				; CODE XREF: sub_D228+76j
		lda	unk_2E06
		beq	loc_D2AB
		orab	#$30 ; '0'

loc_D2AB:				; CODE XREF: sub_D228+7Aj sub_D228+7Fj
		stb	unk_2CD4
		jmp	loc_D14D
; End of function sub_D228

; ---------------------------------------------------------------------------
		lda	unk_2CD4
		oraa	#$40 ; '@'
		sta	unk_2CD4
		ldx	#$D2DA
		stx	unk_2000
		jmp	loc_D14D
; ---------------------------------------------------------------------------
		fcb $38, $3F, $D2, $E0,	$12, $2F, $D2, $FD, $E,	$E, $D3
		fcb $38, $35, $37, $82,	$4E, $10, $10, $82, $4E, 0, $FF
		fcb $D3, $22, $8E, $D2,	$C2, $7E, $82, $51, $B6, $3D, $50
		fcb $34, 6, $C0, $38, $B6, $3D,	$51, $85, $10, $27, 2
		fcb $CB, 8, $F7, $3D, $50, $BD,	$A3, $48, $35, 2, $B7
		fcb $3D, $50, $20, $10,	$34, 4,	$BD, $B7, $DF, $C5, $40
		fcb $26, 4, $32, $61, $20, $18,	$BD, $A2, $E, $B6, $2C
		fcb $D4, $84, $BF, $B7,	$2C, $D4, $7F, $2C, $C3, $35, 4
		fcb $8E, $82, $4E, $BF,	$20, 0,	$6E, $84, $C6, $E, $BD
		fcb $B8, $D7, $8E, $D3,	$2E, $BF, $20, 0, $39, $C1, $E
		fcb $27, 1, $39, $C6, $E, $BD, $B8, $DF, $B6, $2C, $D4
		fcb $84, $BF, $B7, $2C,	$D4, $8E, $82, $4E, $BF, $20, 0
		fcb $7E, $D1, $4D, $B6,	$2C, $D4, $84, $7F, $B7, $2C, $D4
		fcb $7E, $94, $EB

; =============== S U B	R O U T	I N E =======================================


sub_D354:				; CODE XREF: ROM:loc_822FP
					; sub_82C8+D5P	...

; FUNCTION CHUNK AT F42A SIZE 000000E5 BYTES

		jsr	sub_B8B1
		lda	word_22EF
		anda	#3
		beq	loc_D363
		adda	#$31 ; '1'
		jsr	sub_B82E

loc_D363:				; CODE XREF: sub_D354+8j
		lda	word_22EF
		bmi	loc_D371
		ldx	word_22F1
		lda	$11,x
		jsr	sub_B868

loc_D371:				; CODE XREF: sub_D354+12j
		lda	word_22EF+1
		jsr	loc_CC90
		lda	unk_21F0
		ldx	#$D39D
		lda	a,x
		jsr	sub_B82E
		jsr	sub_D228
		jsr	sub_C7CA
		jsr	sub_DE86
		jsr	sub_FE2C
		jsr	sub_C5D8
		jsr	sub_DC3E
		jsr	sub_D5B9
		jsr	sub_FDC6
		jmp	loc_F42A
; End of function sub_D354

; ---------------------------------------------------------------------------
		leay	-$10,y
		lda	unk_2CFC
		cmpa	#7
		bcc	loc_D3C2
		pshs	b
		jsr	sub_B83B
		lda	,s
		sta	unk_2CFC
		lda	,s
		jsr	sub_B82E
		puls	a
		cmpa	#7
		bne	loc_D426
		lda	#0
		jsr	sub_B82E
		bra	loc_D426
; ---------------------------------------------------------------------------

loc_D3C2:				; CODE XREF: ROM:D3A4j
		suba	#7
		cmpb	#3
		bhi	loc_D3E1
		pshs	a,b
		anda	#3
		jsr	sub_B83B
		lda	1,s
		jsr	sub_B82E
		puls	a
		anda	#$FC ; '¸'
		adda	,s+
		adda	#7
		sta	unk_2CFC
		bra	loc_D426
; ---------------------------------------------------------------------------

loc_D3E1:				; CODE XREF: ROM:D3C6j
		cmpb	#7
		bne	loc_D401
		clra
		sta	unk_2CFC
		pshs	a
		jsr	sub_B82E
		inc	,s
		lda	,s

loc_D3F2:				; CODE XREF: ROM:D3FBj
		jsr	sub_B83B
		inc	,s
		lda	,s
		cmpa	#8
		bcs	loc_D3F2
		puls	a
		bra	loc_D426
; ---------------------------------------------------------------------------

loc_D401:				; CODE XREF: ROM:D3E3j
		pshs	a,b
		anda	#3
		beq	loc_D40F
		jsr	sub_B83B
		lda	#0
		jsr	sub_B82E

loc_D40F:				; CODE XREF: ROM:D405j
		puls	a
		anda	#$FC ; '¸'
		ldb	,s
		subb	#4
		ldx	#$D478
		eora	b,x
		adda	#7
		sta	unk_2CFC
		puls	a
		jsr	sub_B843

loc_D426:				; CODE XREF: ROM:D3B9j	ROM:D3C0j ...
		lda	unk_2CFC
		cmpa	#$13
		bcs	loc_D437
		bhi	loc_D431
		bra	loc_D47B
; ---------------------------------------------------------------------------

loc_D431:				; CODE XREF: ROM:D42Dj
		clr	unk_2CE7
		clr	byte_2CC3

loc_D437:				; CODE XREF: ROM:D42Bj
		jsr	sub_B56A
		jsr	sub_D5B9
		lda	unk_2CFC
		cmpa	#$B
		bcs	loc_D44C
		cmpa	#$E
		bhi	loc_D44C
		ldb	#$2C ; ','
		tfr	b, dp

loc_D44C:				; CODE XREF: ROM:D442j	ROM:D446j
		ldx	#$D460

loc_D44F:				; CODE XREF: ROM:D45Ej
		cmpa	,x
		bcs	loc_D45C
		cmpa	1,x
		bhi	loc_D45C
		ldx	2,x
		jmp	loc_CD62
; ---------------------------------------------------------------------------

loc_D45C:				; CODE XREF: ROM:D451j	ROM:D455j
		leax	4,x
		bra	loc_D44F
; ---------------------------------------------------------------------------
		fcb   0
		fcb  $A
		fcb $1F, $2B, $B, $C, $1F, $57,	$D, $D,	$1F, $99, $E, $E
		fcb $1F, $83, $10, $11,	$1F, $41, 0, $FF, $1F, $2B, 4
		fcb 8, $10
; ---------------------------------------------------------------------------

loc_D47B:				; CODE XREF: ROM:D42Fj
		ldx	#$D483
		stx	unk_2000
		bra	loc_D4DF
; ---------------------------------------------------------------------------
		ldx	#$D489
		jmp	loc_8251
; ---------------------------------------------------------------------------
		asl	<unk_F
		andb	<byte_B1
		neg	<unk_3
		andb	<unk_B5
		lsr	<unk_7
		andb	<unk_99
		neg	<$FF
		sbca	#$4E ; 'N'
		pshs	b
		lda	#3

loc_D49D:				; CODE XREF: ROM:D4A5j
		pshs	a
		jsr	sub_B83B
		puls	a
		deca
		bne	loc_D49D
		ldx	#$824E
		stx	unk_2000
		puls	b
		jmp	,x
; ---------------------------------------------------------------------------
		subb	#4
		bra	loc_D4B8
; ---------------------------------------------------------------------------
		negb
		addb	#3

loc_D4B8:				; CODE XREF: ROM:D4B3j
		ldx	#$10DA
		lda	#$1E
		tst	b,x
		beq	loc_D4C2
		clra

loc_D4C2:				; CODE XREF: ROM:D4BFj
		sta	b,x
		ldx	#$10D9
		clr	,x+
		lda	#$C

loc_D4CB:				; CODE XREF: ROM:D4D3j
		ldb	,x+
		beq	loc_D4D2
		stb	unk_10D9

loc_D4D2:				; CODE XREF: ROM:D4CDj
		deca
		bne	loc_D4CB
		lda	unk_10D9
		beq	loc_D4DF
		lda	#$FF
		sta	unk_10D9

loc_D4DF:				; CODE XREF: ROM:D481j	ROM:D4D8j
		ldx	#$10DA
		lda	#3

loc_D4E4:				; CODE XREF: ROM:D4EEj
		ldb	,x+
		pshs	a,x
		jsr	sub_B839
		puls	x,a
		deca
		bpl	loc_D4E4
		ldb	#1
		pshs	b
		clrb

loc_D4F5:				; CODE XREF: ROM:D4FDj
		lda	,x+
		beq	loc_D4FB
		orab	,s

loc_D4FB:				; CODE XREF: ROM:D4F7j
		asl	,s
		bne	loc_D4F5
		leas	1,s
		stb	unk_2CE7
		jmp	loc_D14D
; ---------------------------------------------------------------------------
		lda	unk_2CFC
		asla
		ldx	#$D515
		ldx	a,x
		subb	#8
		aslb
		jmp	[b,x]
; ---------------------------------------------------------------------------
		fcb $D1	; —
		fcb $27	; '
		fcb $C6, $1A, $DD, $D5,	$D5, $73, $C5, $89, $DB, $8C, $DE
		fcb $BB, $DE, $EE, $DF,	$50, $FD, $9E, $FD, $CF, $F3, $D9
		fcb $F5, $1D, $9E, $A0,	$F6, $41, $F6, $8C, $F8, $C1, $F9
		fcb 0, $F9, $2C, $D5, $63, $D5,	$63, $D5, $63, $D5, $63
		fcb $A4, $12, $A7, $F, $A7, $DD, $A9, $1D, $D5,	$63, $D5
		fcb $63, $D5, $63, $D5,	$63, $D5, $63, $D5, $63, $D5, $63
		fcb $D5, $63, $E0, $C1,	$E0, $F7, $E1, $48, $D9, $88, $D1
		fcb $50, $D1, $50, $D1,	$50, $D1, $50, $D1, $50, $D1, $50
		fcb $D1, $50, $D1, $50,	$D5, $DE, $D6, $9B, $D7, $50, $D5
		fcb $83, $D5, $83, $D5,	$83, $D5, $83, $D5, $83, $54, $C0
		fcb 3, $CE, $D5, $D8, $33, $C5,	$BE, $22, $F1, $A6, 7
		fcb $5F, $A1, $C4, $2C,	$A, $8B, $C, $CB, $C, $20, $F6
		fcb $80, $C, $C0, $C, $A1, $41,	$2C, $F8, $A7, 7, $34
		fcb 4, $20, 9, $BD, $82, $A8, $E6, $E4,	$EB, 7,	$E7, 7
		fcb $A6, $88, $10, $26,	$F2, $35, 4

; =============== S U B	R O U T	I N E =======================================


sub_D5B9:				; CODE XREF: sub_D354+40P ROM:D43AP ...
		ldx	word_22F1
		lda	7,x
		pshs	a
		jsr	loc_CCC2
		puls	a
		ldx	#$D5D9
		ldb	#8

loc_D5CA:				; CODE XREF: sub_D5B9+16j
		cmpa	,x+
		blt	loc_D5D2
		aslb
		bcc	loc_D5CA
		lsrb

loc_D5D2:				; CODE XREF: sub_D5B9+13j
		stb	unk_2CD7
		jmp	loc_D14D
; End of function sub_D5B9

; ---------------------------------------------------------------------------
		fcb $80	; Ä
		fcb $EE, $FA, 6, $12, $7F, $B6,	$2C, $D7, $88, 1, $85
		fcb 1, $10, $27, 0, $B7, $85, 2, $27, 7, $86, 3, $C6, $14
		fcb $7E, $D6, $B2, $86,	5, $B7,	$2C, $D7, $7F, $2C, $C3
		fcb $8E, $D6, $A, $BF, $20, 0, $B6, $3D, $52, $80, $C
		fcb $7E, $CC, $C2, $C1,	$B, $10, $25, 1, $5D, $C1, $F
		fcb $10, $22, 1, $5B, $C0, $D, $26, 8, $C6, $C,	$20, $C
		fcb 6, $11, $11, 6, $FB, $3D, $52, $CE,	$D6, $1E, $8D
		fcb $A,	$F7, $3D, $52, $1F, $98, $80, $C, $7E, $CC, $C2
		fcb $E1, $C4, $2C, 2, $E6, $41,	$E1, $42, $2F, 2, $E6
		fcb $43, $39, $86, 1, $B7, $2C,	$D7, $7F, $2C, $C3, $8E
		fcb $D6, $57, $BF, $20,	0, $BE,	$22, $F1, $A6, 7, $7E
		fcb $CC, $C2, $C1, $B, $10, $25, 1, $10, $C1, $F, $10
		fcb $22, 1, $E,	$BE, $22, $F1, $C0, $D,	$26, $13, $5F
		fcb $34, $14, $6F, 7, $A6, $88,	$10, $27, $20, $BD, $82
		fcb $A8, $20, $F4, $C0,	$CB, $40, $35, $34, $14, $CE, $D6
		fcb $79, $EB, 7, $8D, $AE, $E7,	7, $A6,	$88, $10, $27
		fcb 7, $BD, $82, $A8, $E6, $E4,	$20, $EE, $35, $14, $A6
		fcb 7, $7E, $CC, $C2, $B6, $2C,	$D7, $88, 2, $85, 2, $26
		fcb $A,	$BD, $D5, $B9, $8E, $82, $4E, $BF, $20,	0, $39
		fcb $86, 2, $C6, 8, $F7, $2C, $FA, $B7,	$2C, $D7, $7F
		fcb $2C, $C3, $8E, $D6,	$CA, $BF, $20, 0, $BE, $22, $F1
		fcb $A6, $85, $40, $7E,	$CC, $C2, $BE, $22, $F1, $C1, $B
		fcb $10, $25, 0, $9A, $C1, $F, $10, $22, 0, $98, $B6, $2C
		fcb $FA, $C0, $D, $26, $1A, $34, 2, $6F, $86, $A6, $88
		fcb $10, $27, 7, $BD, $82, $A8,	$A6, $E4, $20, $F2, $35
		fcb 2, $4F, $7E, $CC, $C2, $C0,	0, $40,	0, $50,	$34, $16
		fcb $CE, $D6, $F6, $EB,	$86, $BD, $D6, $34, $E7, $86, $A6
		fcb $88, $10, $27, 7, $BD, $82,	$A8, $EC, $E4, $20, $ED
		fcb $35, $16, $A6, $86,	$40, $7E, $CC, $C2, $86, 6, $B7
		fcb $2C, $D7, $7F, $2C,	$C3, $8E, $D7, $2A, $BF, $20, 0
		fcb $39, $C1, $B, $25, $3F, $C1, $F, $22, $3F, $C0, $D
		fcb $26, 7, $7F, $3D, $53, $4F,	$7E, $CC, $C2, $50, $FB
		fcb $3D, $53, $CE, $D6,	$F6, $BD, $D6, $34, $F7, $3D, $53
		fcb $1F, $98, $40, $7E,	$CC, $C2, $B6, $2C, $D7, $88, 4
		fcb $85, 4, $27, $B, $85, 2, $26, $BE, $85, 1, $10, $26
		fcb $FE, $91, $39, $85,	2, $10,	$26, $FF, $44, $7E, $D6
		fcb $41, $C1, 8, $24, 7, $34, 4, $BD, $D5, $B9,	$35, 4
		fcb $8E, $82, $4E, $BF,	$20, 0,	$6E, $84, $D7, $88, $D8
		fcb 8, $D8, $88, $D9, 8, $19, $19, $19,	$19, $1A, $1A
		fcb $1A, $1B, $1B, $1B,	$1C, $1C, $1C, $1D, $1D, $1D, $1E
		fcb $1E, $1F, $1F, $1F,	$20, $20, $21, $21, $22, $22, $22
		fcb $23, $23, $24, $24,	$25, $25, $26, $27, $27, $28, $28
		fcb $29, $2A, $2A, $2B,	$2B, $2C, $2D, $2E, $2E, $2F, $30
		fcb $31, $31, $32, $33,	$34, $35, $36, $37, $38, $39, $3A
		fcb $3B, $3C, $3D, $3E,	$3F, $41, $42, $43, $45, $46, $47
		fcb $49, $4B, $4C, $4E,	$50, $51, $53, $55, $57
		fcb $5A, $5C, $5E, $61,	$63, $66, $69, $6C, $6F, $73, $76
		fcb $7A, $7E, $82, $86,	$8B, $90, $96, $9B, $A2, $A8, $AF
		fcb $B7, $C0, $C9, $D3,	$DE, $EB, $F9, $FF, $FF, $FF, $FF
		fcb $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF
		fcb $FF, $FF, $FF, 8, 8, 8, 8, 8, 8, 9,	9, 9, 9, $A, $A
		fcb $A,	$A, $A,	$B, $B,	$B, $B,	$C, $C,	$C, $C,	$D, $D
		fcb $D,	$E, $E,	$E, $F,	$F, $F,	$10, $10, $10, $11, $11
		fcb $11, $12, $12, $13,	$13, $14, $14, $14, $15, $15, $16
		fcb $16, $17, $17, $18,	$19, $19, $1A, $1A, $1B, $1C, $1C
		fcb $1D, $1E, $1F, $1F,	$20, $21, $22, $23, $24, $25, $26
		fcb $27, $28, $29, $2A,	$2C, $2D, $2E, $30, $31, $33, $35
		fcb $36, $38, $3A, $3C,	$3F, $41, $43, $46, $49, $4C, $4F
		fcb $52, $56, $5A, $5F,	$63, $69, $6E, $74, $7B, $83, $8C
		fcb $95, $A0, $AD, $BB,	$CC, $E0, $F7, $FF, $FF, $FF, $FF
		fcb $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF
		fcb $FF, $FF, $FF, 3, 3, 3, 3, 3, 3, 4,	4, 4, 4, 4, 5
		fcb 5, 5, 5, 6,	6, 6, 6, 6, 7, 7, 7, 8,	8, 8, 8, 9, 9
		fcb 9, $A, $A, $A, $B, $B, $B, $C, $C, $C, $D, $D, $E
		fcb $E,	$E, $F,	$F, $10, $10, $11, $11,	$12, $12, $13
		fcb $13, $14, $15, $15,	$16, $16, $17, $18, $19, $19, $1A
		fcb $1B, $1C, $1D, $1E,	$1F, $1F, $21, $22, $23, $24, $25
		fcb $26, $28, $29, $2A,	$2C, $2E, $2F, $31, $33, $35, $37
		fcb $39, $3C, $3E, $41,	$44, $47, $4A, $4E, $51, $56, $5A
		fcb $5F, $65, $6A, $71,	$78, $81, $8A, $94, $A0, $AE, $BE
		fcb $D1, $E7, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF
		fcb $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, 1, 1
		fcb 1, 1, 1, 1,	2, 2, 2, 2, 2, 3, 3, 3,	3, 4, 4, 4, 4
		fcb 4, 5, 5, 5,	6, 6, 6, 6, 7, 7, 7, 8,	8, 8, 9, 9, 9
		fcb $A,	$A, $A,	$B, $B,	$C, $C,	$C, $D,	$D, $E,	$E, $F
		fcb $F,	$10, $10, $11, $11, $12, $13, $13, $14,	$14, $15
		fcb $16, $17, $17, $18,	$19, $1A, $1B, $1C, $1D, $1D, $1F
		fcb $20, $21, $22, $23,	$24, $26, $27, $28, $2A, $2C, $2D
		fcb $2F, $31, $33, $35,	$37, $3A, $3C, $3F, $42, $45, $48
		fcb $4C, $4F, $54, $58,	$5D, $63, $68, $6F, $76, $7F, $88
		fcb $92, $9E, $AC, $BC,	$CF, $E5, $FF, $FF, $FF, $FF, $FF
		fcb $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF
		fcb $FF, $FF, $D9, $98,	$D9, $D0, $D9, $F6, $DA, $1E, $D1
		fcb $50, $D1, $50, $DB,	$64, $DB, $76, $B6, $2C, $E7, $8A
		fcb 1, $B7, $2C, $E7, $7F, $2C,	$C3, $B6, $2E, $3A, $80
		fcb $80, $81, $64, $2F,	$B, $CC, $2A, $2A, $CE,	$2A, $2A
		fcb $BD, $CC, $E2, $20,	7, $81,	$9C, $2D, $F1, $BD, $CC
		fcb $C2, $BD, $81, $CD,	$BD, $B7, $8A, $27, $DD, $C1, 8
		fcb $26, $D9, $7F, $2C,	$E7, $7E, $D1, $4D, $B6, $2C, $E7
		fcb $8A, 2, $B7, $2C, $E7, $7F
		fcb $2C, $C3, $B6, $2E,	$39, $C6, $64, $3D, $BD, $CC, $C2
		fcb $BD, $81, $CD, $BD,	$B7, $8A, $27, $EF, $C1, 9, $26
		fcb $EB, $7F, $2C, $E7,	$7E, $D1, $4D, $B6, $2C, $E7, $8A
		fcb 4, $B7, $2C, $E7, $7F, $2C,	$C3, $B6, $2E, $3B, $C6
		fcb $64, $3D, $80, $32,	$BD, $CC, $C2, $BD, $81, $CD, $BD
		fcb $B7, $8A, $27, $ED,	$C1, $A, $26, $E9, $7F,	$2C, $E7
		fcb $7E, $D1, $4D, $8E,	$20, 5,	$A6, $84, $26, $D, $B6
		fcb $2B, 6, $2A, 5, $4A, $26, 2, $86, $9C, $7E,	$CC, $C2
		fcb $F6, $2C, $E7, $CA,	8, $F7,	$2C, $E7, $7F, $2C, $C3
		fcb $C6, 1, $E7, $84, $A6, $98,	1, $8E,	$DA, $4D, $BF
		fcb $20, 0, $7E, $CC, $C2, $8E,	$DA, $53, $7E, $82, $51
		fcb $C,	$C, $DA, $73, $D, $D, $DA, $A8,	$10, $10, $DA
		fcb $ED, $B, $B, $DA, $D0, $C, $C, $DB,	2, $D, $D, $DB
		fcb 6, $12, $21, $DB, $12, 0, $FF, $D1,	$50, $B6, $20
		fcb 5, $81, 1, $26, $43, $FE, $20, 6, $CC, $20,	$1C, $B3
		fcb $20, 6, $F7, $2C, $FA, $27,	$35, $37, 2, $34, 2, $5A
		fcb $26, $F9, $F6, $2C,	$FA, $35, 2, $B7, $2C, $FB, $20
		fcb 4, $35, 2, $36, 2, $5A, $26, $F9, $B6, $2C,	$FB, $36
		fcb 2, $7E, $CC, $C2, $B6, $20,	5, $81,	1, $26,	$E, $FE
		fcb $20, 6, $CC, $20, $1B, $B3,	$20, 6,	$26, $C, $7F, $20
		fcb 5, $CC, $65, $6D, $CE, $70,	$74, $7E, $CC, $E2, $33
		fcb $41, $FF, $20, 6, $37, 2, $7E, $CC,	$C2, $8E, $82
		fcb $4E, $BF, $20, 0, $7F, $2C,	$E7, $7F, $2C, $C3, $CC
		fcb $20, $1C, $B3, $20,	6, $F7,	$20, 5,	$CC, $20, $20
		fcb $1F, 3, $7E, $CC, $E2, $8E,	$22, $2F, $BF, $2C, $FA
		fcb $8D, $33, $8E, $DA,	$FC, $BF, $20, 0, $39, $8E, $DA
		fcb $5F, $7E, $82, $51,	$86, 2,	$20, 2,	$86, $FE, $BE
		fcb $2C, $FA, $30, $86,	$BF, $2C, $FA, $20, $16, $C0, $12
		fcb $34, 4, $FC, $2C, $FA, $58,	$49, $58, $49, $58, $49
		fcb $58, $49, $EA, $E0,	$FD, $2C, $FA, $1F, 1, $34, $10
		fcb $10, $8E, $DC, $BA,	$8C, 2,	0, $24,	$C, $8C, 1, 0
		fcb $25, 7, $CC, $20, $20, $1F,	3, $20,	4, $EC,	$84, $8D
		fcb $A,	$BD, $CC, $E2, $35, 6, $8D, 3, $7E, $CC, $ED, $34
		fcb 6, $A6, $61, $8D, 4, $1F, 3, $35, 6, $1F, $89, $44
		fcb $44, $44, $44, $A6,	$A6, $C4, $F, $E6, $A5,	$39, $86
		fcb $40, $B8, $2C, $E7,	$B7, $2C, $E7, $4F, $B7, $29, 5
		fcb $B7, $29, 6, $7E, $D1, $4D,	$B6, $2C, $E7, $85, $40
		fcb $27, $F6, $C6, $40,	$BD, $A0, $CF, $73, $4F, $64, $86
		fcb $FF, $1F, $8B, $7E,	$80, 4,	$DB, $9C, $DB, $CA, $DC
		fcb $20, $DC, $24, $DC,	$9A, $DC, $9A, $DC, $9A, $DC, $9A
		fcb $BE, $22, $F1, $A6,	$88, $12, $85, 8, $27, $79, $B6
		fcb $25, $B5, $88, $40,	$B7, $25, $B5, $C6, $40, $85, $40
		fcb $26, 1, $5F, $34, 4, $1A, $10, $B6,	$2D, 1,	$84, $BF
		fcb $AA, $E0, $B7, $2D,	1, $B7,	1, 1, $1C, $EF,	$20, $74
		fcb $8E, $25, $B5, $A6,	0, $88,	$20, $E6, $B, $26, $10
		fcb $85, $20, $27, $42
		fcb $F6, $21, $F0, $E7,	$A, $F6, $22, $F0, $E7,	$B, $20
		fcb $36, $E6, $A, $F1, $21, $F0, $27, $16, $E6,	$B, $F1
		fcb $22, $F0, $22, $2C,	$34, 2,	$1F, $98, $BD, $82, $A8
		fcb $A6, 6, $84, $F7, $A7, 6, $35, 2, $85, $20,	$26, $15
		fcb $34, 2, $A6, $B, $BD, $82, $A8, $E6, $88, $12, $35
		fcb 2, $8E, $25, $B5, $C5, 8, $26, 2, $6F, $B, $A7, 0
		fcb $20, $1C, $39, $C6,	4, $20,	2, $C6,	8, $B6,	$25, $BF
		fcb $B1, $21, $F0, $26,	$F1, $B6, $25, $B5, $85, $20, $27
		fcb $EA, $F8, $25, $B8,	$F7, $25, $B8, $BD, $88, $3A

; =============== S U B	R O U T	I N E =======================================


sub_DC3E:				; CODE XREF: ROM:A7AFP	sub_C713+AAP ...
		ldb	unk_2CD9
		andb	#$F0 ; ''
		ldx	#$25B5
		lda	$A,x
		cmpa	unk_21F0
		bne	loc_DC63
		lda	0,x
		bita	#$20 ; ' '
		beq	loc_DC55
		orab	#2

loc_DC55:				; CODE XREF: sub_DC3E+13j
		bita	#$40 ; '@'
		beq	loc_DC5B
		orab	#1

loc_DC5B:				; CODE XREF: sub_DC3E+19j
		lda	3,x
		anda	#$C
		pshs	a
		orab	,s+

loc_DC63:				; CODE XREF: sub_DC3E+Dj
		stb	unk_2CD9
		lda	0,x
		lsra
		lsra
		anda	#3
		ldb	3,x
		bitb	#$80 ; 'Ä'
		beq	loc_DC74
		oraa	#8

loc_DC74:				; CODE XREF: sub_DC3E+32j
		andb	#$70 ; 'p'
		cmpb	#$70 ; 'p'
		beq	loc_DC94
		bitb	#$10
		beq	loc_DC80
		oraa	#4

loc_DC80:				; CODE XREF: sub_DC3E+3Ej
		andb	#$60 ; '`'
		bne	loc_DC88
		oraa	#$10
		bra	loc_DC94
; ---------------------------------------------------------------------------

loc_DC88:				; CODE XREF: sub_DC3E+44j
		cmpb	#$60 ; '`'
		bne	loc_DC90
		oraa	#$80 ; 'Ä'
		bra	loc_DC94
; ---------------------------------------------------------------------------

loc_DC90:				; CODE XREF: sub_DC3E+4Cj
		pshs	b
		oraa	,s+

loc_DC94:				; CODE XREF: sub_DC3E+3Aj sub_DC3E+48j ...
		sta	unk_2CDB
		jmp	loc_D14D
; End of function sub_DC3E

; ---------------------------------------------------------------------------
		lsrb
		ldx	#$81A4
		lda	unk_2E0D
		eora	b,x
		sta	unk_2E0D

; =============== S U B	R O U T	I N E =======================================


sub_DCA6:				; CODE XREF: sub_82C8+DEP
		lda	unk_2E0D
		anda	#$F0 ; ''
		pshs	a
		lda	unk_2CD9
		anda	#$F
		oraa	,s+
		sta	unk_2CD9
		jmp	loc_D14D
; End of function sub_DCA6

; ---------------------------------------------------------------------------
		fcb $30	; 0
; ---------------------------------------------------------------------------
		leay	-$E,y
		leau	-$C,y
		puls	y,x,b,a
		pulu	y,x,dp
		rts
; ---------------------------------------------------------------------------
		fcb $41, $42, $43, $44,	$45, $46, $11, $57, $45, $52, $53
		fcb $49, $20, $20, $4D,	$4B, $31, $20, $20, $56, $31, $2E
		fcb $32, $31, $11, $57,	$45, $52, $53, $49, $20, $20, $45
		fcb $58, $32, $30, $20,	$56, $31, $2E, $32, $31, $11, $20
		fcb $20, $20, $20, $56,	$4F, $49, $43, $45, $53, $2C, $20
		fcb $20, $20, $20, $43,	$56, $13, $20, $20, $20, $20, $20
		fcb $20, $20, $2C, $4D,	$49, $44, $49, $2C, $20, $20, $20
		fcb $20, $2C, $20, $12,	$4D, $49, $44, $49, $20, $54, $2E
		fcb $53, $54, $4F, $50,	$20, $52, $2E, $20, $20, $20, $20
		fcb $10, $43, $56, $20,	$52, $41, $4D, $20, $56, $45, $52
		fcb $49, $46, $59, $20,	$20, $20, $10, $2A, $2A, $20, $4E
		fcb $4F, $20, $43, $56,	$2D, $52, $41, $4D, $20, $2A, $2A
		fcb $2A, $11, $4F, $4E,	$4C, $59, $20, $52, $49, $47, $48
		fcb $54, $20, $56, $31,	$2B, $56, $32, $10, $53, $55, $42
		fcb $2D, $56, $4F, $49,	$43, $45, $20, $4F, $46, $46, $20
		fcb $21, $20, $10, $20,	$20, $44, $52, $41, $57, $42, $41
		fcb $52, $20, $4D, $4F,	$44, $45, $20, $20, $10, $20, $53
		fcb $59, $4E, $54, $48,	$45, $53, $45, $20, $4D, $4F, $44
		fcb $45, $20, $20, $10,	$20, $20, $41, $4E, $41, $4C, $59
		fcb $53, $45, $20, $4D,	$4F, $44, $45, $20, $20, $14, $42
		fcb $2E, $20, $20, $20,	$54, $2E, $20, $20, $20, $41, $2E
		fcb $20, $20, $20, $53,	$2E, $20, $20, $20, $10, $47, $41
		fcb $49, $4E, $20, $20,	$20, $20, $20, $20, $20, $20, $20
		fcb $20, $20, $20, $10,	$20, $20, $20, $4E, $45, $57, $3D
		fcb $20, $20, $20, $20,	$20, $20, $20, $20, $20, $DD, $E5
		fcb $DE, $49, $DE, $4D,	$DE, $5F, $DE, $63, $DE, $76, $DE
		fcb $7A, $DE, $7E, $F6,	$2C, $D6, $C8, 1, $BE, $21, $F1
		fcb $CE, $25, $B8
		fdb $C501
; ---------------------------------------------------------------------------
		beq	loc_DE23
		andb	#$E1 ; '·'
		lda	7,x
		anda	#$F
		asla
		pshs	a
		orab	,s+
		stb	unk_2CD6
		lda	7,x
		anda	#3
		pshs	a
		lda	,u
		anda	#$FC ; '¸'
		oraa	,s+
		sta	,u
		lda	5,x
		anda	#$F3 ; 'Û'
		pshs	a
		lda	7,x
		anda	#$C
		oraa	,s+
		sta	5,x
		clr	7,x
		jmp	loc_D14D
; ---------------------------------------------------------------------------

loc_DE23:				; CODE XREF: ROM:DDF2j
		lda	,u
		anda	#3
		pshs	a
		lda	,u
		anda	#$FC ; '¸'
		sta	,u
		lda	5,x
		anda	#$C
		oraa	,s
		sta	,s
		lda	5,x
		anda	#$F3 ; 'Û'
		sta	5,x
		lda	7,x
		anda	#$F0 ; ''
		oraa	,s+
		sta	7,x
		lda	5,x
		bra	loc_DE8B
; ---------------------------------------------------------------------------
		lda	#1
		bra	loc_DE4F
; ---------------------------------------------------------------------------
		lda	#2

loc_DE4F:				; CODE XREF: ROM:DE4Bj
		ldb	unk_2CD6
		bitb	#1
		beq	locret_DE75
		ldx	#$25B8
		eora	,x
		sta	,x
		bra	sub_DE86
; ---------------------------------------------------------------------------
		lda	#4
		bra	loc_DE65
; ---------------------------------------------------------------------------
		lda	#8

loc_DE65:				; CODE XREF: ROM:DE61j
		ldb	unk_2CD6
		bitb	#1
		beq	locret_DE75
		ldx	unk_21F1
		eora	5,x
		sta	5,x
		bra	loc_DE8B
; ---------------------------------------------------------------------------

locret_DE75:				; CODE XREF: ROM:DE54j	ROM:DE6Aj
		rts
; ---------------------------------------------------------------------------
		lda	#2
		bra	loc_DE80
; ---------------------------------------------------------------------------
		lda	#4
		bra	loc_DE80
; ---------------------------------------------------------------------------
		lda	#8

loc_DE80:				; CODE XREF: ROM:DE78j	ROM:DE7Cj
		eora	unk_2E0D
		sta	unk_2E0D

; =============== S U B	R O U T	I N E =======================================


sub_DE86:				; CODE XREF: sub_D354+34P ROM:DE5Dj
		ldx	unk_21F1
		lda	5,x

loc_DE8B:				; CODE XREF: ROM:DE47j	ROM:DE73j
		anda	#$C
		ldu	#$25B5
		ldb	$B,u
		beq	loc_DEA3
		ldb	$A,u
		cmpb	unk_21F0
		bne	loc_DEA3
		pshs	a
		lda	3,u
		anda	#3
		oraa	,s+

loc_DEA3:				; CODE XREF: sub_DE86+Cj sub_DE86+13j
		asla
		beq	loc_DEA8
		oraa	#1

loc_DEA8:				; CODE XREF: sub_DE86+1Ej
		pshs	a
		lda	unk_2E0D
		asla
		asla
		asla
		asla
		anda	#$E0 ; '‡'
		oraa	,s+
		sta	unk_2CD6
		jmp	loc_D14D
; End of function sub_DE86

; ---------------------------------------------------------------------------
		ldu	<unk_CB
		ldu	<unk_CB
		ldu	<unk_CB
		ldu	<unk_CB
		ldu	<unk_CB
		ldu	<unk_CB
		ldu	<unk_CB
		ldu	<unk_CB
		lsrb
		ldx	#$81A4
		lda	b,x
		eora	unk_2E0E
		bita	#$F
		beq	loc_DEE0
		ldb	unk_25B5
		orab	#$80 ; 'Ä'
		stb	unk_25B5

loc_DEE0:				; CODE XREF: ROM:DED6j
		sta	unk_2E0E
; START	OF FUNCTION CHUNK FOR sub_DEE9

loc_DEE3:				; CODE XREF: sub_DEE9+3j
		sta	unk_2CDA
		jmp	loc_D14D
; END OF FUNCTION CHUNK	FOR sub_DEE9

; =============== S U B	R O U T	I N E =======================================


sub_DEE9:				; CODE XREF: sub_82C8+DBP sub_877C+11P

; FUNCTION CHUNK AT DEE3 SIZE 00000006 BYTES

		lda	unk_2E0E
		bra	loc_DEE3
; End of function sub_DEE9

; ---------------------------------------------------------------------------
		ldu	<unk_FE
		stu	<unk_2
		stu	<unk_C
		stu	<unk_10
		stu	<unk_1A
		stu	<unk_1E
		stu	<unk_22
		stu	<unk_39
		lda	#4
		bra	loc_DF04
; ---------------------------------------------------------------------------
		lda	#8

loc_DF04:				; CODE XREF: ROM:DF00j
		eora	unk_25B5
		sta	unk_25B5
		bra	loc_DF4A
; ---------------------------------------------------------------------------
		lda	#$10
		bra	loc_DF12
; ---------------------------------------------------------------------------
		lda	#$80 ; 'Ä'

loc_DF12:				; CODE XREF: ROM:DF0Ej
		eora	unk_25B8
		sta	unk_25B8
		bra	loc_DF4A
; ---------------------------------------------------------------------------
		lda	#0
		bra	loc_DF24
; ---------------------------------------------------------------------------
		lda	#$20 ; ' '
		bra	loc_DF24
; ---------------------------------------------------------------------------
		lda	#$40 ; '@'

loc_DF24:				; CODE XREF: ROM:DF1Cj	ROM:DF20j
		pshs	a
		ldx	#$25B8
		lda	,x
		coma
		bita	#$70 ; 'p'
		bne	loc_DF32
		oraa	#$10

loc_DF32:				; CODE XREF: ROM:DF2Ej
		oraa	#$60 ; '`'
		coma
		oraa	,s+
		bra	loc_DF42
; ---------------------------------------------------------------------------
		lda	#$60 ; '`'
		ldx	#$25B8
		oraa	,x
		anda	#$EF ; 'Ô'

loc_DF42:				; CODE XREF: ROM:DF37j
		cmpa	,x
		bne	loc_DF48
		oraa	#$70 ; 'p'

loc_DF48:				; CODE XREF: ROM:DF44j
		sta	,x

loc_DF4A:				; CODE XREF: ROM:DF0Aj	ROM:DF18j
		jsr	sub_877C
		jmp	sub_DC3E
; ---------------------------------------------------------------------------
		stu	<byte_60
		stu	<unk_64
		stu	<byte_68
		stu	<unk_75
		cmpb	<unk_50
		cmpb	<unk_50
		cmpb	<unk_50
		cmpb	<unk_50
		lda	#1
		bra	loc_DF77
; ---------------------------------------------------------------------------
		lda	#2
		bra	loc_DF6A
; ---------------------------------------------------------------------------
		lda	#4

loc_DF6A:				; CODE XREF: ROM:DF66j
		pshs	a
		lda	unk_2CDC
		anda	#$F6 ; 'ˆ'
		eora	,s+
		bra	loc_DF80
; ---------------------------------------------------------------------------
		lda	#8

loc_DF77:				; CODE XREF: ROM:DF62j
		pshs	a
		lda	unk_2CDC
		anda	#$F0 ; ''
		oraa	,s+

loc_DF80:				; CODE XREF: ROM:DF73j
		sta	unk_2CDC
		clr	byte_2CC3
		clra
		ldx	#$DF8F
		stx	unk_2000
		bra	loc_DF9E
; ---------------------------------------------------------------------------
		cmpb	#$C
		bcs	loc_DFEC
		cmpb	#$F
		bhi	loc_DFF0
		subb	#$C
		ldx	#$E002
		lda	b,x

loc_DF9E:				; CODE XREF: ROM:DF8Dj
		ldu	#$25B5
		ldb	unk_2CDC
		bitb	#1
		beq	loc_DFB0
		adda	7,u
		anda	#$7F ; ''
		sta	7,u
		bra	loc_DFD8
; ---------------------------------------------------------------------------

loc_DFB0:				; CODE XREF: ROM:DFA6j
		bitb	#2
		beq	loc_DFC2
		adda	6,u
		sta	6,u
		adda	7,u
		bitb	#4
		beq	loc_DFD8
		sta	9,u
		bra	loc_DFD8
; ---------------------------------------------------------------------------

loc_DFC2:				; CODE XREF: ROM:DFB2j
		bitb	#4
		beq	loc_DFCE
		adda	9,u
		anda	#$7F ; ''
		sta	9,u
		bra	loc_DFD8
; ---------------------------------------------------------------------------

loc_DFCE:				; CODE XREF: ROM:DFC4j
		bitb	#8
		beq	loc_DFD8
		adda	8,u
		sta	8,u
		adda	9,u

loc_DFD8:				; CODE XREF: ROM:DFAEj	ROM:DFBCj ...
		tsta
		bmi	loc_DFE0
		jsr	loc_CCF5
		bra	loc_DFE9
; ---------------------------------------------------------------------------

loc_DFE0:				; CODE XREF: ROM:DFD9j
		ldd	#$7377
		ldu	#$6170
		jsr	loc_CCE2

loc_DFE9:				; CODE XREF: ROM:DFDEj
		jmp	sub_877C
; ---------------------------------------------------------------------------

loc_DFEC:				; CODE XREF: ROM:DF91j
		cmpb	#8
		bcc	loc_DFFA

loc_DFF0:				; CODE XREF: ROM:DF95j
		clr	unk_2CDC
		pshs	b
		jsr	sub_D5B9
		puls	b

loc_DFFA:				; CODE XREF: ROM:DFEEj
		ldx	#$824E
		stx	unk_2000
		jmp	,x
; ---------------------------------------------------------------------------
		andb	word_FF01
		inc	<unk_E0
		rts
; ---------------------------------------------------------------------------
		fcb $E0	; ‡
		fcb $3C	; <
		fcb $E0, $3F, $E0, $42,	$E0, $6E, $E0, $77, $E0, $74, $E0
		fcb $89, $E0, $59, $E0,	$77, $E0, $74, $E0, $89, $E0, $6A
		fcb $E0, $77, $E0, $74,	$E0, $89

; =============== S U B	R O U T	I N E =======================================


sub_E026:				; CODE XREF: _NoteFn2+C3P
		pshs	a,b,u
		lda	3,x
		bita	#8
		beq	loc_E06A
		ldu	#$E006
		andb	#$F
		aslb
		ldu	b,u
		jmp	,u
; ---------------------------------------------------------------------------
		neg	<byte_20
		asr	<word_0+1
		bra	loc_E042
; ---------------------------------------------------------------------------
		fcb 2, $20, 1, 3
; ---------------------------------------------------------------------------

loc_E042:				; CODE XREF: sub_E026+16j
		ldb	$A,x
		lda	unk_10D3
		cmpa	#8
		bcc	loc_E04D
		ldb	#$FF

loc_E04D:				; CODE XREF: sub_E026+23j
		lda	-1,u

loc_E04F:				; CODE XREF: sub_E026+2Dj
		beq	loc_E0BD
		lsrb
		deca
		bra	loc_E04F
; ---------------------------------------------------------------------------

loc_E055:				; CODE XREF: sub_E026+37j sub_E026+6Fj ...
		clr	,s
		bra	locret_E0BF
; ---------------------------------------------------------------------------
		ldb	$A,x

loc_E05B:				; CODE XREF: sub_E026+4Bj
		subb	#$6E ; 'n'
		bcs	loc_E055
		clra
		aslb
		rola
		aslb
		rola
		cmpd	#$FF
		bls	loc_E0BD

loc_E06A:				; CODE XREF: sub_E026+6j
		ldb	#$FF
		bra	loc_E0BD
; ---------------------------------------------------------------------------
		ldb	$A,x
		comb
		bra	loc_E05B
; ---------------------------------------------------------------------------
		ldd	unk_2001
		addd	loc_A65D+2
		suba	$A,x
		bls	loc_E085
		tfr	a, b
		mul
		adca	#0
		coma
		bra	loc_E08B
; ---------------------------------------------------------------------------

loc_E085:				; CODE XREF: sub_E026+55j
		lda	#$FF
		bra	loc_E08B
; ---------------------------------------------------------------------------
		lda	$A,x

loc_E08B:				; CODE XREF: sub_E026+5Dj sub_E026+61j
		sta	,s
		ldb	1,s
		bitb	#8
		bne	loc_E0A9
		cmpa	#$6E ; 'n'
		bcc	loc_E055
		cmpa	#$6E ; 'n'
		bls	locret_E0BF
		ldb	#0
		mul
		lsra
		rorb
		nega
		negb
		sbca	#0
		addd	#0
		bra	loc_E0BD
; ---------------------------------------------------------------------------

loc_E0A9:				; CODE XREF: sub_E026+6Bj
		bitb	#4
		bne	locret_E0BF
		cmpa	#$6E ; 'n'
		bls	loc_E055
		cmpa	#$6E ; 'n'
		bcc	locret_E0BF
		ldb	#0
		mul
		lsra
		rorb
		subd	#0

loc_E0BD:				; CODE XREF: sub_E026:loc_E04Fj
					; sub_E026+42j	...
		stb	,s

locret_E0BF:				; CODE XREF: sub_E026+31j sub_E026+73j ...
		puls	pc,u,b,a
; End of function sub_E026

; ---------------------------------------------------------------------------
		subb	[,u++]
		subb	[,u++]
		subb	[,u++]
		subb	[,u++]
		subb	[,u++]
		subb	[,u++]
		subb	[-$1F23,pc]
		lsrb
		ldx	#$81A4
		lda	b,x
		sta	unk_2CE7
		jmp	loc_D14D
; ---------------------------------------------------------------------------
		lda	unk_2CE7
		beq	locret_E0F6
		ldx	#$2E18

loc_E0E5:				; CODE XREF: ROM:E0E8j
		lsra
		leax	1,x
		bcc	loc_E0E5
		subb	#$D
		addb	,x
		stb	,x
		lda	#$64 ; 'd'
		mul
		jmp	loc_CCC2
; ---------------------------------------------------------------------------

locret_E0F6:				; CODE XREF: ROM:E0E0j
		rts
; ---------------------------------------------------------------------------
		cmpb	-6,x
		cmpb	7,x
		cmpb	$B,x
		cmpb	-$E,x
		cmpb	<unk_50
		cmpb	<unk_50
		cmpb	-1,x
		cmpb	3,y
		lda	#$FF
		bra	sub_E10D
; ---------------------------------------------------------------------------
		lda	#1

; =============== S U B	R O U T	I N E =======================================


sub_E10D:				; CODE XREF: ROM:E109j	ROM:E126p
		adda	unk_2CFA
		bpl	loc_E116
		lda	#5
		bra	loc_E11B
; ---------------------------------------------------------------------------

loc_E116:				; CODE XREF: sub_E10D+3j
		cmpa	#6
		bcs	loc_E11B
		clra

loc_E11B:				; CODE XREF: sub_E10D+7j sub_E10D+Bj
		sta	unk_2CFA
		rts
; End of function sub_E10D

; ---------------------------------------------------------------------------
		ldb	#$FF
		bra	loc_E125
; ---------------------------------------------------------------------------
		ldb	#1

loc_E125:				; CODE XREF: ROM:E121j
		clra
		bsr	sub_E10D
		ldx	word_22F1
		adda	#$A
		pshs	b
		addb	a,x
		subb	#$20 ; ' '
		andb	#$3F ; '?'
		addb	#$20 ; ' '
		cmpb	#$2E ; '.'
		beq	loc_E13F
		cmpb	#$2C ; ','
		bne	loc_E141

loc_E13F:				; CODE XREF: ROM:E139j
		addb	,s

loc_E141:				; CODE XREF: ROM:E13Dj
		stb	a,x
		leas	1,s
		jmp	sub_D354
; ---------------------------------------------------------------------------
		cmpb	-5,u
		cmpb	-8,u
		cmpb	<unk_50
		cmpb	<unk_50
		cmpb	<unk_50
		cmpb	<unk_50
		cmpb	<unk_50
		cmpb	<unk_50
		com	unk_2A0B
		lda	unk_2CE7
		anda	#$FD ; '˝'
		oraa	#1
		ldb	unk_2A0B
		beq	loc_E169
		oraa	#2

loc_E169:				; CODE XREF: ROM:E165j
		sta	unk_2CE7
		jmp	loc_D14D
; ---------------------------------------------------------------------------
		tsta
		stu	byte_FFFF
		stu	byte_FFFF
		stu	byte_FFFF
		stu	byte_FFFF
		stu	byte_FFFF
		stu	byte_FFFF
		stu	byte_FFFF
		stu	byte_FFFF
		stu	byte_FFFF
		stu	byte_FFFF
		stu	byte_FFFF
		stu	byte_FFFF
		stu	byte_FFFF
		stu	byte_FFFF
		stu	byte_FFFF
		stu	byte_FFFF
		stu	byte_FFFF
		stu	byte_FFFF
		stu	byte_FFFF
		stu	byte_FFFF
		stu	byte_FFFF
		stu	byte_FFFF
		stu	byte_FFFF
		stu	byte_FFFF
		stu	byte_FFFF
		stu	byte_FFFF
		stu	byte_FFFF
		stu	byte_FFFF
		stu	byte_FFFF
		stu	byte_FFFF
		stu	byte_FFFF
		stu	byte_FFFF
		stu	byte_FFFF
		stu	byte_FFFF
		stu	byte_FFFF
		stu	byte_FFFF
		stu	byte_FFFF
		stu	byte_FFFF
		stu	byte_FFFF
		stu	byte_FFFF
		stu	byte_FFFF
		stu	byte_FFFF
		stu	byte_FFFF
		stu	byte_FFFF
		stu	byte_FFFF
; ---------------------------------------------------------------------------
		fcb $FF

; =============== S U B	R O U T	I N E =======================================

; FIX1 insert

_SysExTransmitFIX:
		jsr	_SysExTransmit
		lda	#$F7 ; '˜'
		jmp	_MIDITransmitA
; End of function _SysExTransmitFIX

; ---------------------------------------------------------------------------
		orcc	#$50 ; 'P'      ; COPROCESSOR START
		lda	#$EA ; 'Í'
		tfr	a, dp
		lda	#$19
		sta	<unk_F2
		ldx	#$F062
		lda	#$FF
		ldb	#$14

loc_E211:				; CODE XREF: ROM:E217j
		sta	,x
		leax	$FFBB,x
		decb
		bne	loc_E211
		lda	#$18
		sta	unk_4000
		lda	#$20 ; ' '
		sta	unk_4000
		lds	#$E1FC

loc_E227:				; CODE XREF: ROM:E325j
		andcc	#$BF ; 'ø'

loc_E229:				; CODE XREF: ROM:E22Bj
		clr	<unk_F6
		bra	loc_E229
; ---------------------------------------------------------------------------
		lds	#$E1FC
		lda	#$EA ; 'Í'
		tfr	a, dp
		ldx	#$F05D
		lda	#$14
		sta	<unk_F5
		ldb	#$19
		lda	<byte_F1
		beq	loc_E244
		addb	#$2C ; ','

loc_E244:				; CODE XREF: ROM:E240j
		subb	<unk_F2
		stb	<unk_F3
		ldb	<unk_F2
		stb	<byte_F4
		clr	<unk_F6
		bra	loc_E258
; ---------------------------------------------------------------------------

loc_E250:				; CODE XREF: ROM:E336j
		clr	<unk_F6
		lda	5,x
		lbeq	loc_E2FD

loc_E258:				; CODE XREF: ROM:E24Ej
		lda	2,x
		bne	loc_E288
		lda	1,x
		bne	loc_E266
		lda	0,x
		bne	loc_E2AA
		bra	loc_E2D6
; ---------------------------------------------------------------------------

loc_E266:				; CODE XREF: ROM:E25Ej
		clr	1,x
		lda	0,x
		bne	loc_E2A3
		lda	<byte_F4
		inca
		lda	a,x
		bmi	loc_E2D6
		adda	<byte_F4
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

loc_E288:				; CODE XREF: ROM:E25Aj
		clr	2,x
		clr	1,x
		lda	0,x
		bne	loc_E2A3
		clra
		clrb
		std	8,x
		ldb	<byte_F4
		addb	#$2C ; ','
		leau	b,x
		stu	$16,x
		lda	#1
		sta	4,x
		bra	loc_E2D6
; ---------------------------------------------------------------------------

loc_E2A3:				; CODE XREF: ROM:E26Aj	ROM:E28Ej
		clr	3,x
		clr	0,x
		jmp	loc_E2F7
; ---------------------------------------------------------------------------

loc_E2AA:				; CODE XREF: ROM:E262j
		clra
		clrb
		std	8,x
		std	$10,x
		lda	<unk_F3
		beq	loc_E2BB
		adda	<byte_F4
		sta	<unk_F2
		sta	<byte_F4

loc_E2BB:				; CODE XREF: ROM:E2B3j
		lda	<byte_F4
		lda	a,x
		adda	<byte_F4
		leau	a,x
		stu	$16,x
		stb	$18,x
		lda	#$F1 ; 'Ò'
		sta	4,x
		clr	0,x
		ldu	#$6004
		ldb	<unk_F5
		stb	b,u

loc_E2D6:				; CODE XREF: ROM:E264j	ROM:E271j ...
		lda	4,x
		beq	loc_E2F7
		suba	#$10
		bcs	loc_E2E0
		sta	4,x

loc_E2E0:				; CODE XREF: ROM:E2DCj
		jsr	sub_E34E
		ldd	$14,x
		adda	4,x
		bcc	loc_E2EC
		lda	#$FF

loc_E2EC:				; CODE XREF: ROM:E2E8j
		sta	3,x
		subd	#$110
		bcc	loc_E303
		clr	4,x
		clr	3,x

loc_E2F7:				; CODE XREF: ROM:E2A7J	ROM:E2D8j
		ldy	#0
		bra	loc_E307
; ---------------------------------------------------------------------------

loc_E2FD:				; CODE XREF: ROM:E254j
		ldy	#0
		bra	loc_E312
; ---------------------------------------------------------------------------

loc_E303:				; CODE XREF: ROM:E2F1j
		ldy	$14,x

loc_E307:				; CODE XREF: ROM:E2FBj
		ldb	<unk_F5
		cmpb	#$14
		beq	loc_E322
		ldu	#$6004
		sta	b,u

loc_E312:				; CODE XREF: ROM:E301j
		lda	#$20 ; ' '
		sta	unk_4000
		sty	loc_8000+1
		lda	<unk_F5
		adda	#4
		sta	unk_4000

loc_E322:				; CODE XREF: ROM:E30Bj
		cmpx	#$EAF9
		lbeq	loc_E227
		bcs	loc_E33C
		lda	#$19
		sta	<byte_F4
		clr	<unk_F3
		leax	$FFBB,x
		dec	<unk_F5
		lbpl	loc_E250
		bra	loc_E340
; ---------------------------------------------------------------------------

loc_E33C:				; CODE XREF: ROM:E329j
		lda	#$FF
		bra	loc_E34A
; ---------------------------------------------------------------------------

loc_E340:				; CODE XREF: ROM:E33Aj
		lda	#$FE ; '˛'
		bra	loc_E34A
; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_E34E

loc_E344:				; CODE XREF: sub_E34E+Ej
		lda	#$FD ; '˝'
		bra	loc_E34A
; ---------------------------------------------------------------------------

loc_E348:				; CODE XREF: sub_E34E+11j sub_E34E+24j
		lda	#$FC ; '¸'

loc_E34A:				; CODE XREF: ROM:E33Ej	ROM:E342j ...
		sta	<unk_F6
		bra	loc_E34A
; END OF FUNCTION CHUNK	FOR sub_E34E

; =============== S U B	R O U T	I N E =======================================


sub_E34E:				; CODE XREF: ROM:loc_E2E0P

; FUNCTION CHUNK AT E344 SIZE 0000000A BYTES

		ldy	22,x

loc_E352:				; CODE XREF: ROM:E3DBJ	ROM:E3E6J ...
		ldb	<byte_F4
		leau	b,x
		stu	<unk_F7
		tfr	y, d
		subd	<unk_F7
		bmi	loc_E344
		tsta
		bne	loc_E348
		cmpb	#44
		bcs	loc_E378
		cmpb	#49
		bcs	loc_E3C7
		bhi	loc_E370
		ldd	#$FFFF
		bra	loc_E38E
; ---------------------------------------------------------------------------

loc_E370:				; CODE XREF: sub_E34E+1Bj
		cmpb	#$32 ; '2'
		bhi	loc_E348
		clra
		clrb
		bra	loc_E38E
; ---------------------------------------------------------------------------

loc_E378:				; CODE XREF: sub_E34E+15j
		lda	,y+
		tfr	a, b		; a=b
		anda	#%11		; a=a&3
		beq	loc_E388	; jump if a==0
		ldu	#$EA0F
		aslb			; b*=2
		andb	#%11110		; b&=0x1E
		jmp	[b,u]
; ---------------------------------------------------------------------------

loc_E388:				; CODE XREF: sub_E34E+30j
		ldu	#$EA2F
		lsrb
		jmp	[b,u]
; ---------------------------------------------------------------------------

loc_E38E:				; CODE XREF: sub_E34E+20j sub_E34E+28j ...
		std	8,x

loc_E390:				; CODE XREF: sub_E34E+7Bj ROM:E9D1J
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
		std	$14,x
		rts
; ---------------------------------------------------------------------------

loc_E3B7:				; CODE XREF: sub_E34E+57j
		pshs	a
		ldb	$12,x
		lda	8,x
		mul
		addb	,s+
		adca	#1
		std	$14,x
		rts
; ---------------------------------------------------------------------------

loc_E3C7:				; CODE XREF: sub_E34E+19j ROM:E865j ...
		ldd	8,x
		bra	loc_E390
; End of function sub_E34E

; ---------------------------------------------------------------------------
		ldb	-1,y
		lda	,y+
		andb	#$F0 ; ''
		bra	loc_E38E
; ---------------------------------------------------------------------------
		ldb	-1,y
		lda	,y+
		andb	#$F0 ; ''
		std	$A,x
		jmp	loc_E352
; ---------------------------------------------------------------------------
		ldb	-1,y
		lda	,y+
		andb	#$F0 ; ''
		std	$C,x
		jmp	loc_E352
; ---------------------------------------------------------------------------
		ldd	$A,x
		jmp	loc_E38E
; ---------------------------------------------------------------------------
		ldd	$C,x
		jmp	loc_E38E
; ---------------------------------------------------------------------------
		ldd	$C,x
		std	$A,x
		jmp	loc_E352
; ---------------------------------------------------------------------------
		ldd	8,x

loc_E3FC:				; DATA XREF: ROM:FDD1w
		std	$A,x

loc_E3FE:
		jmp	loc_E352
; ---------------------------------------------------------------------------
		ldd	8,x
		std	$C,x
		jmp	loc_E352
; ---------------------------------------------------------------------------
		ldd	$A,x
		std	$C,x
		jmp	loc_E352
; ---------------------------------------------------------------------------
		ldb	<byte_F4
		leau	b,x
		ldb	,y+
		bmi	loc_E43D
		bitb	#$40 ; '@'
		bne	loc_E42C
		andb	#$3F ; '?'
		cmpb	#$30 ; '0'
		bcc	loc_E426
		ldd	b,u
		jmp	loc_E38E
; ---------------------------------------------------------------------------

loc_E426:				; CODE XREF: ROM:E41Fj
		subb	#$30 ; '0'
		clra
		jmp	loc_E38E
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
		jmp	loc_E38E
; ---------------------------------------------------------------------------

loc_E44D:				; CODE XREF: ROM:E445j
		subb	#$30 ; '0'
		tfr	b, a
		clrb
		jmp	loc_E38E
; ---------------------------------------------------------------------------

loc_E455:				; CODE XREF: ROM:E43Fj
		andb	#$3F ; '?'
		cmpb	#$30 ; '0'
		lbcc	loc_E352
		lda	8,x
		sta	b,u
		jmp	loc_E352
; ---------------------------------------------------------------------------
		ldb	<byte_F4
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
		ldb	<byte_F4
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
		ldb	-1,y
		lda	,y+
		andb	#$F0 ; ''
		addd	8,x
		jmp	loc_E38E
; ---------------------------------------------------------------------------
		ldb	-1,y
		lda	,y+
		andb	#$F0 ; ''
		addd	$A,x
		std	$A,x
		jmp	loc_E352
; ---------------------------------------------------------------------------
		ldb	-1,y
		lda	,y+
		andb	#$F0 ; ''
		addd	$C,x
		std	$C,x
		jmp	loc_E352
; ---------------------------------------------------------------------------
		ldd	$A,x
		addd	8,x
		jmp	loc_E38E
; ---------------------------------------------------------------------------
		ldd	$C,x
		addd	8,x
		lbcc	loc_E38E
		ldd	#$FFFF
		jmp	loc_E38E
; ---------------------------------------------------------------------------
		ldd	$C,x
		addd	$A,x
		std	$A,x
		jmp	loc_E352
; ---------------------------------------------------------------------------
		ldd	8,x
		addd	$A,x
		std	$A,x
		jmp	loc_E352
; ---------------------------------------------------------------------------
		ldd	$A,x
		addd	$C,x
		std	$C,x
		jmp	loc_E352
; ---------------------------------------------------------------------------
		ldd	8,x
		addd	$C,x
		std	$C,x
		jmp	loc_E352
; ---------------------------------------------------------------------------
		ldd	8,x
		subd	$A,x
		jmp	loc_E38E
; ---------------------------------------------------------------------------

loc_E583:				; DATA XREF: ROM:EA72w
		ldd	8,x
		subd	$C,x
		lbcc	loc_E38E
		clra
		clrb
		jmp	loc_E38E
; ---------------------------------------------------------------------------
		ldd	$A,x
		subd	$C,x
		std	$A,x
		jmp	loc_E352
; ---------------------------------------------------------------------------
		ldd	$A,x
		subd	8,x
		std	$A,x
		jmp	loc_E352
; ---------------------------------------------------------------------------
		ldd	$C,x
		subd	$A,x
		std	$C,x
		jmp	loc_E352
; ---------------------------------------------------------------------------
		ldd	$C,x
		subd	8,x
		std	$C,x
		jmp	loc_E352
; ---------------------------------------------------------------------------
		ldd	8,x
		tst	$A,x
		lbeq	loc_E38E
		lda	$A,x
		nega
		bra	loc_E5D8
; ---------------------------------------------------------------------------
		ldd	8,x
		tst	$C,x
		lbeq	loc_E38E
		lda	$C,x
		nega
		bra	loc_E5D8
; ---------------------------------------------------------------------------
		lda	$C,x
		bra	loc_E5D8
; ---------------------------------------------------------------------------
		lda	$A,x
		bra	loc_E5D8
; ---------------------------------------------------------------------------
		lda	,y+

loc_E5D8:				; CODE XREF: ROM:E5BFj	ROM:E5CCj ...
		pshs	a
		ldb	9,x
		mul
		ldb	,s
		sta	,s
		lda	8,x
		mul
		addb	,s+
		adca	#0
		jmp	loc_E38E
; ---------------------------------------------------------------------------
		lda	$C,x
		lbeq	loc_E352
		nega
		bra	loc_E5FA
; ---------------------------------------------------------------------------
		lda	$C,x
		bra	loc_E5FA
; ---------------------------------------------------------------------------
		lda	,y+

loc_E5FA:				; CODE XREF: ROM:E5F2j	ROM:E5F6j
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
		lda	$A,x
		lbeq	loc_E352
		nega
		bra	loc_E61E
; ---------------------------------------------------------------------------
		lda	$C,x
		bra	loc_E61E
; ---------------------------------------------------------------------------
		lda	,y+

loc_E61E:				; CODE XREF: ROM:E616j	ROM:E61Aj
		pshs	a
		ldb	$D,x
		mul
		ldb	,s
		sta	,s
		lda	$C,x
		mul
		addb	,s+
		adca	#0
		std	$C,x
		jmp	loc_E352
; ---------------------------------------------------------------------------
		lda	$C,x
		bra	loc_E63D
; ---------------------------------------------------------------------------
		lda	$A,x
		bra	loc_E63D
; ---------------------------------------------------------------------------

loc_E63B:				; DATA XREF: ROM:EA90r
		lda	,y+

loc_E63D:				; CODE XREF: ROM:E635j	ROM:E639j ...
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
		lbcc	loc_E38E
		ldd	#$FFFF
		jmp	loc_E38E
; ---------------------------------------------------------------------------
		lda	$C,x
		bra	loc_E65F
; ---------------------------------------------------------------------------
		lda	,y+

loc_E65F:				; CODE XREF: ROM:E65Bj
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
		bcc	loc_E676
		ldd	#$FFFF

loc_E676:				; CODE XREF: ROM:E671j
		std	$A,x
		jmp	loc_E352
; ---------------------------------------------------------------------------
		lda	$A,x
		bra	loc_E681
; ---------------------------------------------------------------------------
		lda	,y+

loc_E681:				; CODE XREF: ROM:E67Dj
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
		bcc	loc_E698
		ldd	#$FFFF

loc_E698:				; CODE XREF: ROM:E693j
		std	$C,x
		jmp	loc_E352
; ---------------------------------------------------------------------------
		lda	$A,x
		ldb	,y
		mul
		tsta
		bne	loc_E6B4
		pshs	b
		lda	$B,x
		ldb	,y+
		mul
		addb	,s+
		adca	#0
		lbcc	loc_E6B7

loc_E6B4:				; CODE XREF: ROM:E6A3j
		ldd	#$FFFF

loc_E6B7:				; CODE XREF: ROM:E6B0j
		std	$A,x
		jmp	loc_E352
; ---------------------------------------------------------------------------
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
		ldb	-1,y
		lda	,y+
		andb	#$F0 ; ''
		cmpd	8,x
		lbcs	loc_E797
		lbeq	loc_E790
		jmp	loc_E783
; ---------------------------------------------------------------------------
		ldb	-1,y
		lda	,y+
		andb	#$F0 ; ''
		cmpd	$A,x
		lbcs	loc_E797
		lbeq	loc_E790
		jmp	loc_E783
; ---------------------------------------------------------------------------
		ldb	-1,y
		lda	,y+
		andb	#$F0 ; ''
		cmpd	$C,x
		lbcs	loc_E797
		beq	loc_E790
		bra	loc_E783
; ---------------------------------------------------------------------------
		ldb	-1,y
		lda	,y+
		andb	#$F0 ; ''
		cmpd	8,x
		bhi	loc_E797
		beq	loc_E790
		bra	loc_E783
; ---------------------------------------------------------------------------
		ldb	-1,y
		lda	,y+
		andb	#$F0 ; ''
		cmpd	$A,x
		bhi	loc_E797
		beq	loc_E790
		bra	loc_E783
; ---------------------------------------------------------------------------
		ldb	-1,y
		lda	,y+
		andb	#$F0 ; ''
		cmpd	$C,x
		bhi	loc_E797
		beq	loc_E790
		bra	loc_E783
; ---------------------------------------------------------------------------
		ldd	8,x
		cmpd	$A,x
		bhi	loc_E797
		beq	loc_E790
		bra	loc_E783
; ---------------------------------------------------------------------------
		ldd	8,x
		cmpd	$C,x
		bhi	loc_E797
		beq	loc_E790
		bra	loc_E783
; ---------------------------------------------------------------------------
		ldd	$A,x
		cmpd	$C,x
		bhi	loc_E797
		beq	loc_E790
		bra	loc_E783
; ---------------------------------------------------------------------------
		ldd	$A,x
		cmpd	8,x
		bhi	loc_E797
		beq	loc_E790
		bra	loc_E783
; ---------------------------------------------------------------------------
		ldd	$C,x
		cmpd	$A,x
		bhi	loc_E797
		beq	loc_E790
		bra	loc_E783
; ---------------------------------------------------------------------------
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
		bita	#$C0 ; '¿'
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
		bcc	cmp56mul10
		adda	<byte_F4
		leay	a,x
		jmp	loc_E352
; ---------------------------------------------------------------------------

cmp56mul10:				; CODE XREF: ROM:E7B0j
		cmpa	#56
		bcc	sub55mul12
		suba	#$2F ; '/'
		ldb	10,x
		mul
		leay	b,y
		jmp	loc_E352
; ---------------------------------------------------------------------------

sub55mul12:				; CODE XREF: ROM:E7BBj
		suba	#55
		ldb	12,x
		mul
		leay	b,y
		jmp	loc_E352
; ---------------------------------------------------------------------------
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
		lda	$10,x
		bne	loc_E7E4
		lda	$A,x
		sta	$10,x
		bne	loc_E7A0
		leay	1,y
		jmp	loc_E352
; ---------------------------------------------------------------------------
		lda	$10,x
		bne	loc_E7E4
		lda	$C,x
		sta	$10,x
		bne	loc_E7A0
		leay	1,y
		jmp	loc_E352
; ---------------------------------------------------------------------------
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
		lda	$11,x
		bne	loc_E827
		lda	$A,x
		sta	$11,x
		lbne	loc_E7A0
		leay	1,y
		jmp	loc_E352
; ---------------------------------------------------------------------------
		lda	$11,x
		bne	loc_E827
		lda	$C,x
		sta	$11,x
		lbne	loc_E7A0
		leay	1,y
		jmp	loc_E352
; ---------------------------------------------------------------------------
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
		ldd	$A,x
		pshs	a,b
		ldd	$C,x
		std	$A,x
		puls	b,a
		std	$C,x
		jmp	loc_E352
; ---------------------------------------------------------------------------
		ldd	$A,x
		nega
		negb
		sbca	#0
		std	$A,x
		jmp	loc_E352
; ---------------------------------------------------------------------------
		ldd	$C,x
		nega
		negb
		sbca	#0
		std	$C,x
		jmp	loc_E352
; ---------------------------------------------------------------------------
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
		jmp	loc_E38E
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
		jmp	loc_E38E
; ---------------------------------------------------------------------------
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
		jmp	loc_E5D8
; ---------------------------------------------------------------------------

loc_E90E:				; CODE XREF: ROM:E907j
		lda	2,y
		jmp	loc_E63D
; ---------------------------------------------------------------------------
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
		bita	#%1000000
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
		lbcc	loc_E38E
		ldd	#0
		jmp	loc_E38E
; ---------------------------------------------------------------------------

loc_E991:				; CODE XREF: ROM:E97Fj
		addd	$A,x
		lbcc	loc_E38E
		ldd	#$FFFF
		jmp	loc_E38E
; ---------------------------------------------------------------------------
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
		bsr	sub_E9FE
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
		bsr	sub_E9FE	; DATA XREF: ROM:FDD4w
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
		bsr	sub_E9FE
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

; =============== S U B	R O U T	I N E =======================================


sub_E9FE:				; CODE XREF: ROM:loc_E9BEp ROM:E9D4p ...
		ldd	$E,x
		bne	loc_EA04
		lda	#$DB ; '€'

loc_EA04:				; CODE XREF: sub_E9FE+2j
		aslb
		rola
		bcc	loc_EA0C
		eorb	#$87 ; 'á'
		eora	#$1D

loc_EA0C:				; CODE XREF: sub_E9FE+8j
		std	$E,x
		rts
; End of function sub_E9FE

; ---------------------------------------------------------------------------
fntable1:	fdb $EA2F
; ---------------------------------------------------------------------------
		addd	d,u
		addd	[,--u]
; ---------------------------------------------------------------------------
		fdb $E3DE
; ---------------------------------------------------------------------------
		orab	$F,y
		bitb	-2,x
		bitb	9,y
		bitb	-$A,y
		orab	$F,y
		ldb	[d,u]
; ---------------------------------------------------------------------------
		fdb $E6EF
; ---------------------------------------------------------------------------
		stb	3,x
		orab	$F,y
		stb	-$C,x
		stb	3,y
		stb	-$E,y
		eorb	-3,u
		stb	[,u++]
; ---------------------------------------------------------------------------
		fcb $E7	; Á
		fcb $F0	; 
; ---------------------------------------------------------------------------
		eorb	1,x
		adcb	[-$17EE,pc]
		eorb	-9,y
		eorb	$A,u
		adcb	[,u]
		stb	1,u
		stb	$C,u
		stb	-9,u
		adcb	$E762,s
		stb	-8,s
		stb	$D,s
; ---------------------------------------------------------------------------
		fdb $E88F
; ---------------------------------------------------------------------------
		addd	$E3EE,s
		addd	[,--s]
; ---------------------------------------------------------------------------
		fdb $E89A
		fdb $E3FA
; ---------------------------------------------------------------------------
		andb	1,x
		andb	8,x
		eorb	,x+
		bitb	3,u
		bitb	$A,u
		bitb	-8,u
		stb	,y+
		bitb	1,s
		bitb	-$D,s
		bitb	$A,s
		eorb	$FFE5,s
		inc	loc_E583
; ---------------------------------------------------------------------------
		fcb $E5	; Â
		fcb $90	; ê
; ---------------------------------------------------------------------------
		adcb	-$D,x
		bitb	[-$1A55,x]
		bitb	,-y
		eorb	b,y
		andb	$F,x
		andb	4,s
		andb	,u++
		ldb	[-$1A2A,pc]
		bitb	[-$1A,s]
		andcc	#$E6 ; 'Ê'
		cmpx	loc_E63B
		ldb	-3,u
		ldb	-1,s
; ---------------------------------------------------------------------------
		fcb $E5	; Â
		fcb $D2	; “
		fcb $E5	; Â
		fcb $CE	; Œ
		fcb $E5
		fcb $F4
		fcb $E6
		fcb $18
		fcb $E6
		fcb $37	; 7
		fcb $E6
		fcb $33	; 3
		fcb $E6
		fcb $59	; Y
		fcb $E6
		fcb $7B	; {
		fcb $E5
		fcb $B4	; ¥
		fcb $E5
		fcb $C1	; ¡
		fcb $E5
		fcb $EB	; Î
		fcb $E6
		fcb  $F
		fcb 0
		fcb   3
		fcb 6
		fcb   9
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
		fcb $2B	; +
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
		fcb $E2
		fcb   0
		fcb $EA	; Í
		fcb $F0	; 
		fcb $EA	; Í
		fcb $F0	; 
		fcb $E2	; ‚
		fcb $2D	; -
		fcb $EA	; Í
		fcb $F0	; 
		fcb $EA	; Í
		fcb $F0	; 
		fcb $EA	; Í
		fcb $F0	; 
		fcb $E2	; ‚
		fcb   0
; ---------------------------------------------------------------------------

loc_EB01:				; CODE XREF: ROM:EB1Fj	ROM:EB45j ...
		jsr	sub_81CD
		lda	#$2C ; ','
		tfr	a, dp
		lda	unk_AF6
		beq	loc_EB14
		orcc	#$50 ; 'P'
		tfr	a, dp
		jmp	loc_8004
; ---------------------------------------------------------------------------

loc_EB14:				; CODE XREF: ROM:EB0Bj
		coma
		sta	unk_AF6
		lda	<unk_80
		bmi	loc_EB47
		jsr	loc_EB8D
		bne	loc_EB01
		coma
		sta	<unk_6B
		ldy	#$ECC7
		sty	<unk_64
		jsr	loc_ED09
		pshs	dp
		jsr	sub_81CD
		puls	dp
		ldy	#$ECEB
		sty	<unk_64
		jsr	loc_ED09
		jsr	sub_F1F0
		jsr	sub_F1F8
		bra	loc_EB01
; ---------------------------------------------------------------------------

loc_EB47:				; CODE XREF: ROM:EB1Aj
		ldb	<unk_61
		bne	loc_EB61
		jsr	loc_EB8D
		ldb	#$FF
		stb	<unk_6B
		stb	<unk_61
		ldx	#$EB87
		lda	<unk_80
		anda	#$3F ; '?'
		asla
		jsr	[a,x]
		clra
		sta	<unk_62

loc_EB61:				; CODE XREF: ROM:EB49j
		lda	<unk_80
		bita	#$40 ; '@'
		beq	loc_EB7B
		jsr	loc_EB8D
		bne	loc_EB7B
		sta	<unk_62
		coma
		sta	<unk_6B
		lda	<unk_80
		anda	#$3F ; '?'
		ldx	#$EB81
		asla
		jsr	[a,x]

loc_EB7B:				; CODE XREF: ROM:EB65j	ROM:EB6Aj
		jsr	loc_EC39
		jmp	loc_EB01
; ---------------------------------------------------------------------------
		std	[a,y]
		lda	<unk_C2
		lda	<unk_F6
		ldu	8,y
		sta	<unk_5E
		sta	<unk_AB

loc_EB8D:				; CODE XREF: ROM:EB1CP	ROM:EB4BP ...
		ldu	#$2E40
		ldx	#$2C40
		ldy	#$2C00
		lda	#$10
		sta	<byte_AF
		clra
		sta	<byte_B0
		lda	<unk_80
		bita	#3
		bne	loc_EBB1
		lda	<unk_81
		bita	#$10
		beq	loc_EBB1
		leay	$20,y
		lda	#$10
		sta	<byte_B0

loc_EBB1:				; CODE XREF: ROM:EBA2j	ROM:EBA8j ...
		ldd	,x
		std	<byte_B1
		suba	,u
		bpl	loc_EBBA
		nega

loc_EBBA:				; CODE XREF: ROM:EBB7j
		cmpa	#8
		bcs	loc_EBC7
		lda	,u+
		clrb
		stb	<unk_6B
		std	,x++
		bra	loc_EBDE
; ---------------------------------------------------------------------------

loc_EBC7:				; CODE XREF: ROM:EBBCj
		ldd	<byte_B1
		adda	,u+
		rora
		rorb
		addd	<byte_B1
		rora
		rorb
		std	,x++
		eora	<byte_B1
		anda	#$FE ; '˛'
		beq	_SysExTransformSub
		clrb
		stb	<unk_6B
		eora	<byte_B1

loc_EBDE:				; CODE XREF: ROM:EBC5j
		anda	#$FE ; '˛'
		cmpa	#$FE ; '˛'
		bne	loc_EBE5
		inca

loc_EBE5:				; CODE XREF: ROM:EBE2j
		std	,y
		lda	<byte_B0
		sta	<byte_60

_SysExTransformSub:			; CODE XREF: ROM:EBD7j
		leay	2,y
		inc	<byte_B0
		dec	<byte_AF
		bne	loc_EBB1
		lda	<unk_6B
		bne	locret_EC2D
		lda	unk_3D6F
		bita	#1
		bne	loc_EC2C
		bita	#$80 ; 'Ä'
		beq	loc_EC2C
		ldx	#SysExTransformBuffer

loc_EC05:				; CODE XREF: ROM:EC0Dj
		lda	,x+
		jsr	_MIDITransmitA
		cmpx	#$EC37
		bcs	loc_EC05
		ldu	#$2C00

loc_EC12:				; CODE XREF: ROM:EC2Aj
		lda	,u
		anda	#$F
		oraa	,x
		jsr	_MIDITransmitA
		lda	,u+
		lsra
		lsra
		lsra
		lsra
		oraa	1,x
		jsr	_MIDITransmitA
		cmpu	#$2C40
		bcs	loc_EC12

loc_EC2C:				; CODE XREF: ROM:EBFCj	ROM:EC00j
		clra

locret_EC2D:				; CODE XREF: ROM:EBF5j
		rts
; ---------------------------------------------------------------------------
SysExTransformBuffer:fcb $F0		; DATA XREF: ROM:EC02o
		fcb $25	; %
		fcb 1
		fcb $74	; t
		fcb $67
		fcb $50
		fcb $40	; @
		fcb $30	; 0
		fcb $24
		fcb $10
		fcb 0
; ---------------------------------------------------------------------------

loc_EC39:				; CODE XREF: ROM:loc_EB7BP
		lda	<unk_62
		lbne	locret_ECC6
		coma
		sta	<unk_62
		lda	<byte_60
		inca
		jsr	sub_F627
		std	unk_1F84
		lda	<byte_60
		asla
		ldx	#$2C00
		ldd	a,x
		lsra
		rorb
		lsra
		rorb
		lsra
		rorb
		lsra
		rorb
		ldu	#$1F8B
		sta	<unk_B3
		clra
		sta	<byte_AF
		sta	<byte_B0
		sta	<byte_B1
		inca
		sta	<unk_B2

loc_EC6A:				; CODE XREF: ROM:EC92j
		lsr	<unk_B3
		rorb
		bcc	loc_EC7D
		lda	<unk_B2
		adda	<byte_B0
		daa
		sta	<byte_B0
		lda	<byte_B1
		adca	<byte_AF
		daa
		sta	<byte_AF

loc_EC7D:				; CODE XREF: ROM:EC6Dj
		tst	<unk_B3
		bne	loc_EC84
		tstb
		beq	loc_EC94

loc_EC84:				; CODE XREF: ROM:EC7Fj
		lda	<unk_B2
		adda	<unk_B2
		daa
		sta	<unk_B2
		lda	<byte_B1
		adca	<byte_B1
		daa
		sta	<byte_B1
		bra	loc_EC6A
; ---------------------------------------------------------------------------

loc_EC94:				; CODE XREF: ROM:EC82j
		lda	<byte_AF
		lsra
		lsra
		lsra
		lsra
		ldb	<byte_AF
		andb	#$F
		addd	#$3030
		std	,u
		ldd	<byte_B0
		lsra
		lsra
		lsra
		lsra
		ldb	<byte_B0
		andb	#$F
		addd	#$3030
		std	2,u
		ldb	#3

loc_ECB4:				; CODE XREF: ROM:ECBFj
		lda	,u
		cmpa	#$30 ; '0'
		bne	loc_ECC1
		lda	#$20 ; ' '
		sta	,u+
		decb
		bne	loc_ECB4

loc_ECC1:				; CODE XREF: ROM:ECB8j
		lda	#$FF
		sta	unk_1F83

locret_ECC6:				; CODE XREF: ROM:EC3Bj
		rts
; ---------------------------------------------------------------------------
		bge	*+2

loc_ECC9:				; CODE XREF: ROM:ECC7j
		rol	<unk_81
		jmp	<unk_3D
; ---------------------------------------------------------------------------
		sbcb	unk_2C78
		suba	#$40 ; '@'
		subb	#$20 ; ' '
		neg	-$10,x
		negb
		leax	8,x
		nega
		bra	loc_ED3C
; ---------------------------------------------------------------------------
		fcb $10
		fcb $30	; 0
		fcb   8
		fcb $28	; (
		fcb $18
		fcb   8
		fcb $20
		fcb $10
		fcb $30	; 0
		fcb   8
		fcb $30	; 0
		fcb   8
		fcb $28	; (
		fcb $18
		fcb   8
		fcb $2C	; ,
		fcb $12
		fcb   7
		fcb $7B	; {
		fcb $13
		fcb $3F	; ?
		fcb $2C	; ,
		fcb $2C	; ,
		fcb $7C	; |
		fcb $40	; @
		fcb $20
		fcb $60	; `
		fcb $10
		fcb $50	; P
		fcb $30	; 0
		fcb   8
		fcb $20
		fcb $10
		fcb $30	; 0
		fcb   8
		fcb $28	; (
		fcb $18
		fcb   8
		fcb $10
		fcb   8
		fcb $18
		fcb   8
		fcb $28	; (
		fcb $18
		fcb   8
; ---------------------------------------------------------------------------

loc_ED09:				; CODE XREF: ROM:EB2BP	ROM:EB3CP
		ldd	5,y
		std	<byte_68
		ldb	2,y
		stb	<byte_AF
		ldx	,y
		ldd	#0
		std	<byte_74

loc_ED18:				; CODE XREF: ROM:ED21j
		ldb	,x++
		clra
		addd	<byte_74
		std	<byte_74
		dec	<byte_AF
		bne	loc_ED18
		ldd	<byte_74
		bne	loc_ED2C
		ldx	<byte_68
		clr	,x
		rts
; ---------------------------------------------------------------------------

loc_ED2C:				; CODE XREF: ROM:ED25j
		lda	4,y
		ldb	<unk_75
		mul
		sta	<byte_AF
		lda	4,y
		ldb	<byte_74
		mul
		addb	<byte_AF
		addb	3,y

loc_ED3C:				; CODE XREF: ROM:ECDAj
		lda	#$32 ; '2'
		mul
		std	<unk_6C
		ldd	#$FFFF
		std	unk_2C91
		std	unk_2C93
		ldu	#$EE28

loc_ED4D:				; CODE XREF: ROM:ED60j
		bsr	sub_ED67
		pshs	y,u
		jsr	sub_ED7D
		jsr	loc_EF2E
		jsr	sub_F100
		puls	u,y
		cmpu	#$EE16
		bhi	loc_ED4D
		bsr	sub_ED67
		jmp	sub_F100

; =============== S U B	R O U T	I N E =======================================


sub_ED67:				; CODE XREF: ROM:loc_ED4Dp ROM:ED62p
		ldb	,-u
		stb	<unk_6A
		ldx	<byte_68
		ldb	,-u
		clra
		leax	d,x
		stx	<unk_66
		ldd	,--u
		std	<unk_97
		ldd	,--u
		std	<unk_95
		rts
; End of function sub_ED67


; =============== S U B	R O U T	I N E =======================================


sub_ED7D:				; CODE XREF: ROM:ED51P
		ldx	#$2600
		lda	<unk_97
		lsra
		sta	<byte_AF
		clra
		clrb

loc_ED87:				; CODE XREF: sub_ED7D+Ej
		std	,x++
		dec	<byte_AF
		bne	loc_ED87
		ldu	,y
		lda	2,y
		sta	<byte_AF
		leay	9,y
		ldb	#6
		subb	<unk_96
		mul
		leay	d,y

loc_ED9C:				; CODE XREF: sub_ED7D+36j
		ldx	#$2600
		ldb	,y+
		clra
		leax	d,x
		ldd	,u++
		lsra
		rorb
		addd	,x
		bpl	loc_EDAF
		jsr	sub_F0B4

loc_EDAF:				; CODE XREF: sub_ED7D+2Dj
		std	,x
		dec	<byte_AF
		bne	loc_ED9C
		rts
; End of function sub_ED7D

; ---------------------------------------------------------------------------
		lda	<unk_81
		anda	#$E0 ; '‡'
		asla
		asla
		asla
		asla
		ldx	#$EDC3
		jmp	[a,x]
; ---------------------------------------------------------------------------
		std	[,--u]
		std	[,--u]
		std	[,--u]
		std	[,--u]
		std	[,--u]
		std	[,--u]
		std	[,--u]
		std	[,--u]
		ldd	#$F81
		std	<unk_6C
		clrb
		lda	<unk_81
		anda	#$F

loc_EDDD:				; CODE XREF: ROM:EDE4j
		lsra
		bcs	loc_EDE7
		beq	locret_EDE6

loc_EDE2:				; CODE XREF: ROM:EE0Ej
		addb	#6
		bra	loc_EDDD
; ---------------------------------------------------------------------------

locret_EDE6:				; CODE XREF: ROM:EDE0j
		rts
; ---------------------------------------------------------------------------

loc_EDE7:				; CODE XREF: ROM:EDDEj
		pshs	a,b
		ldx	#$EE10
		leau	b,x
		pulu	b,a
		std	<unk_95
		pulu	b,a
		std	<unk_97
		ldx	<byte_68
		ldb	,u+
		clra
		leax	d,x
		stx	<unk_66
		ldb	,u+
		stb	<unk_6A
		jsr	sub_EE9D
		jsr	loc_EF2E
		jsr	sub_F100
		puls	b,a
		bra	loc_EDE2
; ---------------------------------------------------------------------------
		fcb $40
		fcb 6
		fcb   1
		fcb 0
		fcb   1
		fcb 0
		fcb $40	; @
		fcb 6
		fcb   1
		fcb 0
		fcb $41	; A
		fcb   1
		fcb $20
		fcb   5
		fcb   0
		fcb $80	; Ä
		fcb $81	; Å
		fcb   2
		fcb $10
; ---------------------------------------------------------------------------
		lsr	<word_0
		nega
		cmpa	3,x
		ldx	word_22F1
		ldb	4,x
		ldx	#$2803
		jsr	_SysExRELWAVE
		ldx	#$2804
		ldu	#$2C91
		ldb	#$40 ; '@'
		bsr	sub_EE84
		ldb	#$40 ; '@'
		bsr	sub_EE84
		ldb	#$20 ; ' '
		bsr	sub_EE84
		ldb	#$10
		bsr	sub_EE84
		clrb
		lda	<unk_81
		anda	#$F

loc_EE4E:				; CODE XREF: ROM:EE55j
		lsra
		bcs	loc_EE60
		beq	loc_EE57
		addb	#6
		bra	loc_EE4E
; ---------------------------------------------------------------------------

loc_EE57:				; CODE XREF: ROM:EE51j
		clra
		clrb
		std	unk_2C91
		std	unk_2C93
		rts
; ---------------------------------------------------------------------------

loc_EE60:				; CODE XREF: ROM:EE4Fj
		ldu	#$EE10
		leau	b,u
		pulu	b,a
		std	<unk_95
		pulu	b,a
		std	<unk_97
		ldx	#$2803
		ldb	,u+
		clra
		leax	d,x
		stx	<unk_66
		ldb	,u+
		stb	<unk_6A
		jsr	sub_EEEF
		jsr	loc_EF2E
		jmp	loc_F200

; =============== S U B	R O U T	I N E =======================================


sub_EE84:				; CODE XREF: ROM:EE3Bp	ROM:EE3Fp ...
		clr	<byte_AF

loc_EE86:				; CODE XREF: sub_EE84+10j
		lda	,x+
		suba	#$80 ; 'Ä'
		bpl	loc_EE8D
		nega

loc_EE8D:				; CODE XREF: sub_EE84+6j
		cmpa	<byte_AF
		bls	loc_EE93
		sta	<byte_AF

loc_EE93:				; CODE XREF: sub_EE84+Bj
		decb
		bne	loc_EE86
		lda	<byte_AF
		asla
		inca
		sta	,u+
		rts
; End of function sub_EE84


; =============== S U B	R O U T	I N E =======================================


sub_EE9D:				; CODE XREF: ROM:EE03P
		ldu	#$2C00
		ldy	#$2600
		ldd	<unk_97
		lsra
		rorb
		stb	<unk_B5
		lda	<unk_95
		lsra
		sta	<byte_AF
		ldd	#0
		std	,y
		std	2,y
		sta	<byte_B0

loc_EEB8:				; CODE XREF: sub_EE9D+30j
		bsr	sub_EF1E
		stb	<byte_B0
		leax	d,y
		pulu	b,a
		lsra
		rorb
		std	,x++
		ldd	#0
		std	,x
		ldb	<byte_B0
		dec	<byte_AF
		bne	loc_EEB8
		lda	<unk_95
		lsra
		deca
		sta	<byte_AF
		leau	-2,u

loc_EED7:				; CODE XREF: sub_EE9D+4Fj
		bsr	sub_EF1E
		stb	<byte_B0
		leax	d,y
		ldd	,--u
		lsra
		rorb
		std	,x++
		ldd	#0
		std	,x
		ldb	<byte_B0
		dec	<byte_AF
		bne	loc_EED7
		rts
; End of function sub_EE9D


; =============== S U B	R O U T	I N E =======================================


sub_EEEF:				; CODE XREF: ROM:EE7BP
		ldu	<unk_66
		ldy	#$2600
		ldd	<unk_97
		lsra
		rorb
		stb	<unk_B5
		lda	<unk_95
		sta	<byte_AF
		clra
		clrb
		sta	<byte_B0
		bra	loc_EF09
; ---------------------------------------------------------------------------

loc_EF05:				; CODE XREF: sub_EEEF+2Cj
		bsr	sub_EF1E
		stb	<byte_B0

loc_EF09:				; CODE XREF: sub_EEEF+14j
		leax	d,y
		lda	,u+
		suba	#$80 ; 'Ä'
		clrb
		std	,x++
		ldd	#0
		std	,x
		ldb	<byte_B0
		dec	<byte_AF
		bne	loc_EF05
		rts
; End of function sub_EEEF


; =============== S U B	R O U T	I N E =======================================


sub_EF1E:				; CODE XREF: sub_EE9D:loc_EEB8p
					; sub_EE9D:loc_EED7p ...
		lda	<unk_B5
		sta	<byte_B1
		bra	loc_EF26
; ---------------------------------------------------------------------------

loc_EF24:				; CODE XREF: sub_EF1E+Cj
		lsr	<byte_B1

loc_EF26:				; CODE XREF: sub_EF1E+4j
		eorb	<byte_B1
		bitb	<byte_B1
		beq	loc_EF24
		clra
		rts
; End of function sub_EF1E

; ---------------------------------------------------------------------------

loc_EF2E:				; CODE XREF: ROM:ED54P	ROM:EE06P ...
		lda	<unk_96
		sta	<unk_9B
		ldx	#$2600
		stx	<unk_9C
		ldd	#4
		std	<unk_9E
		leau	b,x
		stu	<unk_A0
		ldd	<unk_97
		leay	d,x
		sty	<unk_99
		ldd	#0
		sta	<unk_A6
		std	<byte_A2
		ldd	#$7FFF
		std	<unk_A4
		lda	#$40 ; '@'
		sta	<unk_A7
		ldy	#$F379
		bra	loc_EF9E
; ---------------------------------------------------------------------------

loc_EF5D:				; CODE XREF: ROM:F0A5j
		pshs	dp,y
		jsr	sub_81CD
		puls	y,dp
		lsr	<unk_A7
		ldd	#$7FFF
		std	<unk_A4
		ldd	#0
		sta	<unk_A6
		std	<byte_A2
		ldb	<byte_9F
		aslb
		stb	<byte_9F
		ldx	#$2600
		stx	<unk_9C
		leau	d,x
		stu	<unk_A0
		bra	loc_EF9E
; ---------------------------------------------------------------------------

loc_EF82:				; CODE XREF: ROM:F09Fj
		stx	<unk_9C
		ldd	<unk_9E
		leau	d,x
		lda	<unk_A6
		adda	<unk_A7
		anda	#$7F ; ''
		sta	<unk_A6
		ldd	a,y
		std	<byte_A2
		lda	<unk_A6
		adda	#$20 ; ' '
		anda	#$7F ; ''
		ldd	a,y
		std	<unk_A4

loc_EF9E:				; CODE XREF: ROM:EF5Bj	ROM:EF80j ...
		ldd	<byte_A2
		beq	loc_EFCA
		std	<byte_6E
		ldd	2,u
		beq	loc_EFCA
		std	<byte_70
		jsr	envProcessUnkInt1
		ldd	<byte_6E
		tst	<byte_A2
		bpl	loc_EFB5
		subd	2,u

loc_EFB5:				; CODE XREF: ROM:EFB1j
		tst	2,u
		bpl	loc_EFBB
		subd	<byte_A2

loc_EFBB:				; CODE XREF: ROM:EFB7j
		asl	<byte_70
		rolb
		rola
		asl	<byte_70
		adcb	#0
		adca	#0
		bvc	loc_EFCA
		jsr	sub_F0B4

loc_EFCA:				; CODE XREF: ROM:EFA0j	ROM:EFA6j ...
		std	<unk_AD
		ldd	<unk_A4
		beq	loc_EFF8
		std	<byte_6E
		ldd	,u
		beq	loc_EFF8
		std	<byte_70
		jsr	envProcessUnkInt1
		ldd	<byte_6E
		tst	<unk_A4
		bpl	loc_EFE3
		subd	,u

loc_EFE3:				; CODE XREF: ROM:EFDFj
		tst	,u
		bpl	loc_EFE9
		subd	<unk_A4

loc_EFE9:				; CODE XREF: ROM:EFE5j
		asl	<byte_70
		rolb
		rola
		asl	<byte_70
		adcb	#0
		adca	#0
		bvc	loc_EFF8
		jsr	sub_F0B4

loc_EFF8:				; CODE XREF: ROM:EFCEj	ROM:EFD4j ...
		subd	<unk_AD
		bvc	loc_EFFF
		jsr	sub_F0AA

loc_EFFF:				; CODE XREF: ROM:EFFAj
		std	<unk_A9
		ldd	<unk_A4
		beq	loc_F02D
		std	<byte_6E
		ldd	2,u
		beq	loc_F02D
		std	<byte_70
		jsr	envProcessUnkInt1
		ldd	<byte_6E
		tst	<unk_A4
		bpl	loc_F018
		subd	2,u

loc_F018:				; CODE XREF: ROM:F014j
		tst	2,u
		bpl	loc_F01E
		subd	<unk_A4

loc_F01E:				; CODE XREF: ROM:F01Aj
		asl	<byte_70
		rolb
		rola
		asl	<byte_70
		adcb	#0
		adca	#0
		bvc	loc_F02D
		jsr	sub_F0B4

loc_F02D:				; CODE XREF: ROM:F003j	ROM:F009j ...
		std	<unk_AD
		ldd	<byte_A2
		beq	loc_F05B
		std	<byte_6E
		ldd	,u
		beq	loc_F05B
		std	<byte_70
		jsr	envProcessUnkInt1
		ldd	<byte_6E
		tst	<byte_A2
		bpl	loc_F046
		subd	,u

loc_F046:				; CODE XREF: ROM:F042j
		tst	,u
		bpl	loc_F04C
		subd	<byte_A2

loc_F04C:				; CODE XREF: ROM:F048j
		asl	<byte_70
		rolb
		rola
		asl	<byte_70
		adcb	#0
		adca	#0
		bvc	loc_F05B
		jsr	sub_F0B4

loc_F05B:				; CODE XREF: ROM:F031j	ROM:F037j ...
		addd	<unk_AD
		bvc	loc_F062
		jsr	sub_F0B4

loc_F062:				; CODE XREF: ROM:F05Dj
		std	<unk_AB
		ldd	,x
		subd	<unk_A9
		bvc	loc_F06C
		bsr	sub_F0AA

loc_F06C:				; CODE XREF: ROM:F068j
		std	,u
		ldd	,x
		addd	<unk_A9
		bvc	loc_F076
		bsr	sub_F0B4

loc_F076:				; CODE XREF: ROM:F072j
		std	,x
		ldd	2,x
		subd	<unk_AB
		bvc	loc_F080
		bsr	sub_F0AA

loc_F080:				; CODE XREF: ROM:F07Cj
		std	2,u
		ldd	2,x
		addd	<unk_AB
		bvc	loc_F08A
		bsr	sub_F0B4

loc_F08A:				; CODE XREF: ROM:F086j
		std	2,x
		ldd	<unk_9E
		leax	d,u
		leau	d,x
		cmpu	<unk_99
		lbls	loc_EF9E
		ldx	<unk_9C
		leax	4,x
		cmpx	<unk_A0
		lbcs	loc_EF82
		dec	<unk_9B
		lbne	loc_EF5D
		rts

; =============== S U B	R O U T	I N E =======================================


sub_F0AA:				; CODE XREF: ROM:EFFCP	ROM:F06Ap ...
		pshs	a
		tfr	cc, a
		eora	#1
		tfr	a, cc
		puls	a
; End of function sub_F0AA


; =============== S U B	R O U T	I N E =======================================


sub_F0B4:				; CODE XREF: sub_ED7D+2FP ROM:EFC7P ...
		rora
		rorb
		pshs	cc,a,b,x
		ldd	<unk_A9
		asra
		rorb
		adcb	#0
		adca	#0
		std	<unk_A9
		ldd	<unk_AB
		asra
		rorb
		adcb	#0
		adca	#0
		std	<unk_AB
		ldd	<unk_AD
		asra
		rorb
		adcb	#0
		adca	#0
		std	<unk_AD
		ldx	#$2600
		lda	<unk_95
		pshs	a

loc_F0DD:				; CODE XREF: sub_F0B4+3Fj
		ldd	,x
		asra
		rorb
		adcb	#0
		adca	#0
		std	,x++
		ldd	,x
		asra
		rorb
		adcb	#0
		adca	#0
		std	,x++
		dec	,s
		bne	loc_F0DD
		leas	1,s
		puls	x,b,a,cc
		adcb	#0
		adca	#0
		bvs	sub_F0B4
		rts
; End of function sub_F0B4


; =============== S U B	R O U T	I N E =======================================


sub_F100:				; CODE XREF: ROM:ED57P	ROM:ED64J ...
		ldd	unk_2600
		bne	loc_F113
		ldb	#$80 ; 'Ä'
		lda	<unk_95
		ldu	<unk_66

loc_F10B:				; CODE XREF: sub_F100+Ej
		stb	,u+
		deca
		bne	loc_F10B
		jmp	loc_F1CE
; ---------------------------------------------------------------------------

loc_F113:				; CODE XREF: sub_F100+3j
		std	<byte_74
		ldd	#$FFFF
		std	<byte_76
		lda	#9
		sta	<byte_AF
		ldu	#$2C91
		ldb	<unk_6A
		lda	b,u
		lsra
		clrb
		bra	loc_F12B
; ---------------------------------------------------------------------------

loc_F129:				; CODE XREF: sub_F100+37j
		aslb
		rola

loc_F12B:				; CODE XREF: sub_F100+27j
		subd	<byte_74
		bcc	loc_F131
		addd	<byte_74

loc_F131:				; CODE XREF: sub_F100+2Dj
		rol	<byte_77
		rol	<byte_76
		dec	<byte_AF
		bne	loc_F129
		ldd	<byte_76
		coma
		comb
		std	<byte_76
		ldb	<unk_95
		stb	<byte_AF
		clra
		clrb
		std	<byte_74
		ldx	#$2600
		ldu	<unk_66
		ldd	<byte_76
		lsra
		rorb
		subd	#$80 ; 'Ä'
		std	<unk_B3

loc_F155:				; CODE XREF: sub_F100+A6j
		lda	1,x
		ldb	<byte_77
		mul
		sta	<byte_B1
		clra
		ldb	<byte_76
		beq	loc_F163
		ldb	1,x

loc_F163:				; CODE XREF: sub_F100+5Fj
		addb	<byte_B1
		std	<byte_B1
		lda	,x
		adda	#$80 ; 'Ä'
		ldb	<byte_77
		mul
		addd	<byte_B1
		bcc	loc_F178
		ldb	#1
		stb	<byte_B1
		bra	loc_F17A
; ---------------------------------------------------------------------------

loc_F178:				; CODE XREF: sub_F100+70j
		clr	<byte_B1

loc_F17A:				; CODE XREF: sub_F100+76j
		sta	<unk_B2
		clra
		ldb	<byte_76
		beq	loc_F185
		ldb	,x
		addb	#$80 ; 'Ä'

loc_F185:				; CODE XREF: sub_F100+7Fj
		addd	<byte_B1
		subd	<unk_B3
		cmpd	#$100
		bcs	loc_F191
		ldb	#$FF

loc_F191:				; CODE XREF: sub_F100+8Dj
		stb	,u+
		leax	4,x
		subb	#$80 ; 'Ä'
		bpl	loc_F19A
		negb

loc_F19A:				; CODE XREF: sub_F100+97j
		tfr	b, a
		mul
		tfr	a, b
		clra
		addd	<byte_74
		std	<byte_74
		dec	<byte_AF
		bne	loc_F155
		ldd	<byte_74
		beq	loc_F1CE
		ldd	<unk_6C
		std	<byte_72
		jsr	sub_F2F6
		ldd	<byte_76
		bne	loc_F1BB
		ldb	#1
		bra	loc_F1C5
; ---------------------------------------------------------------------------

loc_F1BB:				; CODE XREF: sub_F100+B5j
		cmpd	#$40 ; '@'
		bcs	loc_F1C5
		lda	#$7F ; ''
		bra	loc_F1CE
; ---------------------------------------------------------------------------

loc_F1C5:				; CODE XREF: sub_F100+B9j sub_F100+BFj
		stb	<byte_72
		clr	<unk_73
		jsr	sub_F333
		lda	<byte_77

loc_F1CE:				; CODE XREF: sub_F100+10J sub_F100+AAj ...
		ldb	<unk_6A
		ldu	#$2C8D
		sta	b,u
		lda	#3
		sta	<byte_AF
		lda	,u+		; DATA XREF: ROM:FDD8w

loc_F1DB:				; CODE XREF: sub_F100+E3j
		cmpa	,u+
		bhi	loc_F1E1
		lda	-1,u

loc_F1E1:				; CODE XREF: sub_F100+DDj
		dec	<byte_AF
		bne	loc_F1DB
		ldu	<byte_68
		sta	,u

loc_F1E9:				; CODE XREF: sub_96C2+99J ROM:9ABFJ ...
		lda	word_22EF+1
		cmpa	#$20 ; ' '
		bne	sub_F1F8
; End of function sub_F100


; =============== S U B	R O U T	I N E =======================================


sub_F1F0:				; CODE XREF: ROM:EB3FP
		ldd	#$FFFF
		std	<unk_78
		std	<unk_7A
		rts
; End of function sub_F1F0


; =============== S U B	R O U T	I N E =======================================


sub_F1F8:				; CODE XREF: ROM:EB42P	sub_F100+EEj
		ldd	#$FFFF
		std	<unk_7C
		std	<byte_7E
		rts
; End of function sub_F1F8

; ---------------------------------------------------------------------------

loc_F200:				; CODE XREF: ROM:EE81J
		ldb	<unk_95
		decb
		stb	<byte_AF
		clra
		clrb
		std	<byte_74
		ldu	#$2604
		ldd	-4,u
		bpl	loc_F214
		nega
		negb
		sbca	#0

loc_F214:				; CODE XREF: ROM:F20Ej
		lsra
		rorb
		std	<byte_B1

loc_F218:				; CODE XREF: ROM:F232j
		ldd	,u
		bpl	loc_F220
		nega
		negb
		sbca	#0

loc_F220:				; CODE XREF: ROM:F21Aj
		cmpd	<byte_B1
		bhi	loc_F227
		clra
		clrb

loc_F227:				; CODE XREF: ROM:F223j
		std	,u++
		cmpd	<byte_74
		bls	loc_F230
		std	<byte_74

loc_F230:				; CODE XREF: ROM:F22Cj
		dec	<byte_AF
		bne	loc_F218
		ldd	#$FFFF
		std	<byte_72
		jsr	sub_F2F6
		ldd	<byte_76
		std	<unk_B3
		ldb	<unk_95
		lsrb
		stb	<byte_AF
		ldu	#$2604
		ldx	#$2C00

loc_F24B:				; CODE XREF: ROM:F26Ej
		ldd	,u++
		bsr	sub_F27C
		std	<byte_B1
		ldd	,u++
		bsr	sub_F27C
		addd	<byte_B1
		bcc	loc_F25C
		ldd	#$FFFF

loc_F25C:				; CODE XREF: ROM:F257j
		std	<byte_72
		jsr	sub_F333
		lda	<byte_77
		ldb	<byte_76
		beq	loc_F26A
		ldd	#$FFFF

loc_F26A:				; CODE XREF: ROM:F265j
		std	,x++
		dec	<byte_AF
		bne	loc_F24B
		clra
		clrb
		bra	loc_F276
; ---------------------------------------------------------------------------

loc_F274:				; CODE XREF: ROM:F279j
		std	,x++

loc_F276:				; CODE XREF: ROM:F272j
		cmpx	#$2C40
		bcs	loc_F274
		rts

; =============== S U B	R O U T	I N E =======================================


sub_F27C:				; CODE XREF: ROM:F24Dp	ROM:F253p
		beq	locret_F29B
		std	<byte_6E
		ldd	<unk_B3
		std	<byte_70
		jsr	envProcessUnkInt1
		ldd	<byte_70
		std	<byte_6E
		jsr	envProcessUnkInt1
		ldd	<byte_6E
		asl	<byte_70
		adcb	#0
		adca	#0
		bcc	locret_F29B
		ldd	#$FFFF

locret_F29B:				; CODE XREF: sub_F27Cj	sub_F27C+1Aj
		rts
; End of function sub_F27C


; =============== S U B	R O U T	I N E =======================================


envProcessUnkInt1:			; CODE XREF: ROM:9A7EP
					; envProcessUnkAmpl1+2CP ...
		lda	<unk_6F
		ldb	<unk_71
		mul
		pshs	a,b
		lda	<byte_6E
		ldb	<unk_71
		mul
		addb	,s+
		adca	#0
		pshs	a,b
		bcs	loc_F2DB
		lda	<unk_6F
		ldb	<byte_70
		mul
		addd	,s
		std	,s
		bcs	loc_F2CB
		lda	<byte_6E
		ldb	<byte_70
		mul
		addb	,s+
		adca	#0
		std	<byte_6E
		puls	b,a
		std	<byte_70
		rts
; ---------------------------------------------------------------------------

loc_F2CB:				; CODE XREF: envProcessUnkInt1+1Dj
					; envProcessUnkInt1+48j
		lda	<byte_6E
		ldb	<byte_70
		mul
		addb	,s+
		adca	#1
		std	<byte_6E
		puls	b,a
		std	<byte_70
		rts
; ---------------------------------------------------------------------------

loc_F2DB:				; CODE XREF: envProcessUnkInt1+12j
		lda	<unk_6F
		ldb	<byte_70
		mul
		addd	,s
		std	,s
		bcc	loc_F2CB
		lda	<byte_6E
		ldb	<byte_70
		mul
		addb	,s+
		adca	#2
		std	<byte_6E
		puls	b,a
		std	<byte_70
		rts
; End of function envProcessUnkInt1


; =============== S U B	R O U T	I N E =======================================


sub_F2F6:				; CODE XREF: ROM:9A6BP	sub_9D19+CP ...
		clr	<byte_76
		clr	<byte_77
		ldd	<byte_74
		bne	loc_F32A
		coma
		comb
		std	<byte_76
		rts
; ---------------------------------------------------------------------------

loc_F303:				; CODE XREF: sub_F2F6+38j
		ldd	#1
		std	<unk_B3
		ldd	<byte_74

loc_F30A:				; CODE XREF: sub_F2F6+22j
		bmi	loc_F31C
		aslb
		rola
		cmpd	<byte_72
		bhi	loc_F31A
		asl	<byte_B4
		rol	<unk_B3
		tsta
		bra	loc_F30A
; ---------------------------------------------------------------------------

loc_F31A:				; CODE XREF: sub_F2F6+1Bj
		lsra
		rorb

loc_F31C:				; CODE XREF: sub_F2F6:loc_F30Aj
		subd	<byte_72
		nega
		negb
		sbca	#0
		std	<byte_72
		ldd	<byte_76
		addd	<unk_B3
		std	<byte_76

loc_F32A:				; CODE XREF: sub_F2F6+6j
		ldd	<byte_72
		subd	<byte_74
		bcc	loc_F303
		addd	<byte_72
		rts
; End of function sub_F2F6


; =============== S U B	R O U T	I N E =======================================


sub_F333:				; CODE XREF: sub_F100+C9P ROM:F25EP
		clra
		clrb
		std	<byte_76
		lda	#$40 ; '@'
		std	<byte_74
		ldd	<byte_72
		beq	locret_F378

loc_F33F:				; CODE XREF: sub_F333+2Ej
		ldd	<byte_72
		subd	<byte_76
		bcs	loc_F355
		subd	<byte_74
		bcs	loc_F355
		std	<byte_72
		ldd	<byte_76
		lsra
		rorb
		addd	<byte_74
		std	<byte_76
		bra	loc_F359
; ---------------------------------------------------------------------------

loc_F355:				; CODE XREF: sub_F333+10j sub_F333+14j
		lsr	<byte_76
		ror	<byte_77

loc_F359:				; CODE XREF: sub_F333+20j
		ldd	<byte_74
		lsra
		rorb
		lsra
		rorb
		std	<byte_74
		bne	loc_F33F
		ldd	<byte_76
		addd	<byte_76
		addd	#1
		subd	<byte_72
		cmpd	<byte_72
		bcc	locret_F378
		ldd	<byte_76
		addd	#1
		std	<byte_76

locret_F378:				; CODE XREF: sub_F333+Aj sub_F333+3Cj
		rts
; End of function sub_F333

; ---------------------------------------------------------------------------
		fcb   0
		fcb   0
byte_F37B:	fcb $C,	$8C, $18, $F9, $25, $28, $30, $FB, $3C,	$56, $47
		fcb $1C, $51, $33, $5A,	$82, $62, $F1, $6A, $6D, $70, $E2
		fcb $76, $41, $7A, $7C,	$7D, $89, $7F, $61, $7F, $FF, $7F
		fcb $61, $7D, $89, $7A,	$7C, $76, $41, $70, $E2, $6A, $6D
		fcb $62, $F1, $5A, $82,	$51, $33, $47, $1C, $3C, $56, $30
		fcb $FB, $25, $28, $18,	$F9, $C, $8C, 0, 0, $F3, $74, $E7
		fcb 7, $DA, $D8, $CF, 5, $C3, $AA, $B8,	$E4, $AE, $CD
		fcb $A5, $7E, $9D, $F, $95, $93, $8F, $1E, $89,	$BF, $85
		fcb $84, $82, $77, $80,	$9F, $F3, $E9, $F3, $F1, $F4, $E6
		fcb $F4, 3, $F4, $E6, $F4, $E6,	$F4, $1A, $F4, $22, $96
		fcb $80, $88, $80, $84,	$BF, $20, $41, $96, $80, $2A, $F6
		fcb $88, $40, $8A, $80,	$20, $37, $96, $81, $88, $80, $97
		fcb $81, $20, $13, $4F,	$20, 6,	$86, $20, $20, 2, $86
		fcb $40, $97, $63, $96,	$81, $84, $9F, $9A, $63, $97, $81
		fcb $86, $80, $20, $18,	$86, $81, $C6, 7, $D7, $8C, $20
		fcb $10, $86, $82, $C6,	5, $D7,	$8C, $20, 8
; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_D354

loc_F42A:				; CODE XREF: sub_D354+46J
		lda	#$2C ; ','
		tfr	a, dp
		lda	<unk_80
		anda	#$BF ; 'ø'

loc_F432:				; CODE XREF: ROM:loc_F55AJ
		clrb
		sta	<unk_80
		bmi	loc_F43E
		orab	#1
		ldx	#$DD6B
		bra	loc_F479
; ---------------------------------------------------------------------------

loc_F43E:				; CODE XREF: sub_D354+20E1j
		ldx	#$DD8D
		bita	#$40 ; '@'
		beq	loc_F44A
		ldx	#$DD7C
		orab	#2

loc_F44A:				; CODE XREF: sub_D354+20EFj
		anda	#$3F ; '?'
		bne	loc_F468
		lda	<unk_81
		bpl	loc_F454
		orab	#4

loc_F454:				; CODE XREF: sub_D354+20FCj
		anda	#$60 ; '`'
		bne	loc_F45C
		orab	#8
		bra	loc_F479
; ---------------------------------------------------------------------------

loc_F45C:				; CODE XREF: sub_D354+2102j
		cmpa	#$20 ; ' '
		bne	loc_F464
		orab	#$10
		bra	loc_F479
; ---------------------------------------------------------------------------

loc_F464:				; CODE XREF: sub_D354+210Aj
		orab	#$20 ; ' '
		bra	loc_F479
; ---------------------------------------------------------------------------

loc_F468:				; CODE XREF: sub_D354+20F8j
		cmpa	#2
		bne	loc_F470
		orab	#$80 ; 'Ä'
		bra	loc_F472
; ---------------------------------------------------------------------------

loc_F470:				; CODE XREF: sub_D354+2116j
		orab	#$40 ; '@'

loc_F472:				; CODE XREF: sub_D354+211Aj
		pshs	b,x
		jsr	envModulesDisplay
		puls	x,b

loc_F479:				; CODE XREF: sub_D354+20E8j
					; sub_D354+2106j ...
		stb	unk_2CDF
		clr	byte_2CC3
		ldu	#$1F57
		jsr	strcpy		; x=src, u=dst
		lda	<unk_80
		bmi	loc_F48A
		rts
; ---------------------------------------------------------------------------

loc_F48A:				; CODE XREF: sub_D354+2133j
		ldb	word_22EF
		bmi	loc_F49B
		ldb	word_22EF+1
		cmpb	#$1F
		bcc	loc_F4A5
		ldx	#$DD49
		bra	loc_F49E
; ---------------------------------------------------------------------------

loc_F49B:				; CODE XREF: sub_D354+2139j
		ldx	#$DD5A

loc_F49E:				; CODE XREF: sub_D354+2145j
		clra
		sta	<unk_80
		ldb	#1
		bra	loc_F479
; ---------------------------------------------------------------------------

loc_F4A5:				; CODE XREF: sub_D354+2140j
		beq	loc_F4AC
		ldu	#$F50F
		bra	loc_F4AF
; ---------------------------------------------------------------------------

loc_F4AC:				; CODE XREF: sub_D354:loc_F4A5j
		ldu	#$F516

loc_F4AF:				; CODE XREF: sub_D354+2156j
		bita	#$40 ; '@'
		beq	loc_F4E7
		ldb	,u+
		ldx	word_22F1
		anda	#$3F ; '?'
		bne	loc_F4D6
		ldu	,u
		pshs	b,x,u
		ldb	4,x
		ldx	#$2803
		jsr	_SysExRELWAVE
		ldu	#$2803
		ldb	,s
		jsr	sub_A1D4
		puls	u,x,b
		stb	4,x
		bra	loc_F4E4
; ---------------------------------------------------------------------------

loc_F4D6:				; CODE XREF: sub_D354+2166j
		cmpa	#1
		bne	loc_F4E0
		stb	2,x
		ldu	2,u
		bra	loc_F4E4
; ---------------------------------------------------------------------------

loc_F4E0:				; CODE XREF: sub_D354+2184j
		stb	3,x
		ldu	4,u

loc_F4E4:				; CODE XREF: sub_D354+2180j
					; sub_D354+218Aj
		stu	<byte_68
		rts
; ---------------------------------------------------------------------------

loc_F4E7:				; CODE XREF: sub_D354+215Dj
		anda	#$3F ; '?'
		bne	loc_F4EF
		ldu	1,u
		bra	loc_F4F9
; ---------------------------------------------------------------------------

loc_F4EF:				; CODE XREF: sub_D354+2195j
		cmpa	#1
		bne	loc_F4F7
		ldu	3,u
		bra	loc_F4F9
; ---------------------------------------------------------------------------

loc_F4F7:				; CODE XREF: sub_D354+219Dj
		ldu	5,u

loc_F4F9:				; CODE XREF: sub_D354+2199j
					; sub_D354+21A1j
		stu	<byte_68
		clrb
		stb	<unk_61
		lda	<unk_80
		anda	#$3F ; '?'
		bne	loc_F50C
		lda	<unk_81
		bita	#$10
		beq	loc_F50C
		ldb	#$10

loc_F50C:				; CODE XREF: sub_D354+21AEj
					; sub_D354+21B4j
		stb	<byte_60
		rts
; END OF FUNCTION CHUNK	FOR sub_D354
; ---------------------------------------------------------------------------
		nega
		mul
		sbcb	unk_3DA6
		mul

loc_F515:				; CODE XREF: ROM:F51Ej
		sbcb	<unk_55
		swi
		bge	loc_F558
		subb	-1,y
		inc	<unk_F5
		blt	loc_F515
		leay	[b,s]
		puls	pc,u,y,x,b,cc
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------
		fcb $F5	; ı
		fcb $6B	; k
		fcb $F5	; ı
		fcb $77	; w
		fcb $F5	; ı
		fcb $AB	; ´
		fcb $F5	; ı
		fcb $AF	; Ø
		fcb $86	; Ü
		fcb   1
		fcb $20
		fcb  $A
		fcb $86	; Ü
		fcb   2
		fcb $20
		fcb   6
		fcb $86	; Ü
		fcb   4
		fcb $20
		fcb   2
		fcb $86	; Ü
		fcb   8
; ---------------------------------------------------------------------------

loc_F53B:				; CODE XREF: ROM:F587j	ROM:F58Dj ...
		ldb	unk_2CE0
		bitb	#$20 ; ' '
		bne	loc_F55D
		sta	<unk_63
		bita	#$C
		bne	loc_F54E
		lda	<unk_81
		anda	#$E0 ; '‡'
		bra	loc_F552
; ---------------------------------------------------------------------------

loc_F54E:				; CODE XREF: ROM:F546j
		lda	<unk_81
		anda	#$F0 ; ''

loc_F552:				; CODE XREF: ROM:F54Cj
		oraa	<unk_63
		sta	<unk_81
		bsr	sub_F599

loc_F558:				; CODE XREF: ROM:F518j
		lda	#$80 ; 'Ä'

loc_F55A:				; CODE XREF: ROM:F578j
		jmp	loc_F432
; ---------------------------------------------------------------------------

loc_F55D:				; CODE XREF: ROM:F540j
		eora	<unk_81
		sta	<unk_81
		bita	#$F
		bne	sub_F599
		oraa	#1
		sta	<unk_81
		bra	sub_F599
; ---------------------------------------------------------------------------
		lda	<unk_81
		bita	#3
		beq	sub_F599
		eora	#$10
		sta	<unk_81
		bra	sub_F599
; ---------------------------------------------------------------------------
		fcb $F6	; ˆ
; ---------------------------------------------------------------------------
		bge	loc_F55A
		eorb	#$20 ; ' '
		stb	unk_2CE0
		bitb	#$20 ; ' '
		bne	loc_F5A4
		lda	#1
		bitb	#1
		bne	loc_F53B
		lda	#2
		bitb	#2
		bne	loc_F53B
		lda	#4
		bitb	#4
		bne	loc_F53B
		lda	#8
		bra	loc_F53B

; =============== S U B	R O U T	I N E =======================================


sub_F599:				; CODE XREF: ROM:F556p	ROM:F563j ...
		ldb	unk_2CE0
		andb	#$20 ; ' '
		anda	#$1F
		sta	<unk_63
		orab	<unk_63

loc_F5A4:				; CODE XREF: ROM:F581j
		stb	unk_2CE0
		clr	byte_2CC3
		rts
; End of function sub_F599

; ---------------------------------------------------------------------------
		fcb $86
; ---------------------------------------------------------------------------
		stu	unk_2002
		lda	#1
		ldb	<unk_80
		bmi	loc_F5B6
		rts
; ---------------------------------------------------------------------------

loc_F5B6:				; CODE XREF: ROM:F5B3j
		bitb	#$40 ; '@'
		bne	loc_F5E3
		ldu	#$1F57
		ldx	#$DDB3
		sta	<unk_63
		jsr	strcpy		; x=src, u=dst
		lda	<unk_63
		ldx	<byte_68
		ldb	,x
		andb	#$80 ; 'Ä'
		stb	<unk_63
		adda	,x
		anda	#$7F ; ''
		oraa	<unk_63
		sta	,x
		asla
		jsr	sub_F624
		std	unk_1F5D
		clr	<unk_6B
		jmp	loc_F1E9
; ---------------------------------------------------------------------------

loc_F5E3:				; CODE XREF: ROM:F5B8j
		sta	<unk_63
		lda	<unk_81
		anda	#$F
		ldx	#$2C91

loc_F5EC:				; CODE XREF: ROM:F5F5j	ROM:loc_F5F7j
		ldb	,x+
		lsra
		bcc	loc_F5F7
		addb	<unk_63
		stb	-1,x
		bra	loc_F5EC
; ---------------------------------------------------------------------------

loc_F5F7:				; CODE XREF: ROM:F5EFj
		bne	loc_F5EC
		ldu	#$1F57
		ldx	#$DD9E
		jsr	strcpy		; x=src, u=dst
		ldu	#$2C91
		ldy	#$1F5A
		lda	#4
		sta	<unk_63

loc_F60D:				; CODE XREF: ROM:F618j
		lda	,u+
		jsr	sub_F624
		std	,y
		leay	5,y
		dec	<unk_63
		bne	loc_F60D
		lda	#$FF
		sta	unk_1F57
		clr	<unk_6B
		jmp	loc_F1E9

; =============== S U B	R O U T	I N E =======================================


sub_F624:				; CODE XREF: ROM:F5D8P	ROM:F60FP
		ldb	#$64 ; 'd'
		mul
; End of function sub_F624


; =============== S U B	R O U T	I N E =======================================


sub_F627:				; CODE XREF: envModulesDisplay+5AP
					; ROM:EC45P
		tfr	a, b
		clra
		bra	loc_F62D
; ---------------------------------------------------------------------------

loc_F62C:				; CODE XREF: sub_F627+8j
		inca

loc_F62D:				; CODE XREF: sub_F627+3j
		subb	#$A
		bcc	loc_F62C
		addb	#$A
		ldx	#$DCBA
		ldb	b,x
		tsta
		bne	loc_F63E
		lda	#$20 ; ' '
		rts
; ---------------------------------------------------------------------------

loc_F63E:				; CODE XREF: sub_F627+12j
		lda	a,x
		rts
; End of function sub_F627

; ---------------------------------------------------------------------------
		fcb $F6	; ˆ
byte_F642:	fcb $51, $F6, $55, $F6,	$69, $F6, $69, $F6, $69, $F6, $69
		fcb $F6, $69, $F6, $69,	$86, $FF, $20, 2, $86, 1, $9B
		fcb $60, $84, $1F, $D6,	$80, $C5, 3, $27, 2, $84, $F, $97
		fcb $60, $4F, $97, $62,	$39, $8E, $F6, $7C, $30, $85, $96
		fcb $60, $CE, $2C, 0, $48, $33,	$C6, $EC, $C4, $E3, $84
		fcb $ED, $C4, $4F, $97,	$6B, $39, $F9, $C0, $FF, $60, $FF
		fcb $F0, 0, $10, 0, $A0, 6, $40, $F6, $9C, $F7,	$15, $F7
		fcb $79, $F7, $9F, $F6,	$CA, $F6, $CA, $F6, $CA, $F6, $CA
		fcb $B6, $2C, $E3, $8A,	1, $B7,	$2C, $E3, $7F, $2C, $C3
		fcb $B6, $3D, $55, $8E,	$3D, $56, $E6, $86, $8E, $FA, $88
		fcb $E6, $85, $86, $3E,	$1F, 3,	$B6, $3D, $55, $48, $8E
		fcb $FA, $68, $EC, $86,	$BD, $CC, $E2, $8E, $F6, $CB, $BF
		fcb $20, 0, $39, $8E, $F8, $81,	$7E, $82, $51, $B6, $3D
		fcb $55, $4C, $84, $F, $B7, $3D, $55, $20, $CB,	$B6, $3D
		fcb $55, $8E, $3D, $56,	$E6, $86, $C4, 7, $5C, $E7, $86
		fcb $8D, 2, $20, $BA, $5A, $34,	6, $86,	8, $3D,	$CE, $22
		fcb $34, $33, $CB, $35,	6, $8E,	$8B, $70, $E6, $85, $8B
		fcb 8, $BD, $82, $90, $E7, 4, $E6, 5, $C4, $E3,	$34, 4
		fcb $E6, $C4, $C4, $1C,	$EA, $E0, $E7, 5, $39, $B6, $2C
		fcb $E3, $8A, 2, $B7, $2C, $E3,	$7F, $2C, $C3, $B6, $1D
		fcb $F,	$8E, $3D, $56, $E6, $86, $8E, $FA, $88,	$E6, $85
		fcb $86, $3E, $1F, 3, $B6, $1D,	$F, $48, $8E, $FA, $68
		fcb $EC, $86, $BD, $CC,	$E2, $8E, $F7, $44, $BF, $20, 0
		fcb $39, $8E, $F8, $91,	$7E, $82, $51, $B6, $1D, $F, $4C
		fcb $84, $F, $B7, $1D, $F, $B1,	$3D, $55, $27, $F5, $20
		fcb $C6, $B6, $1D, $F, $8E, $3D, $56, $E6, $86,	$5C, $E7
		fcb $86, $C1, 8, $23, $B, $6F, $86, $8B, 8, $BD, $82, $90
		fcb $6F, 4, $20, $AC, $BD, $F6,	$ED, $20, $A7, $B6, $2A
		fcb $A,	$43, $F6, $2C, $E3, $B7, $2A, $A, $27, 9, $86
		fcb $FF, $B7, $2A, $A, $CA, 4, $20, 2, $C4, $FB, $F7, $2C
		fcb $E3, $7F, $2C, $C3,	$39, $F6, $2C, $E3, $B6, $2A, $A
		fcb $20, $E4, $B6, $2C,	$E3, $8A, 8, $B7, $2C, $E3, $7F
		fcb $2C, $C3, $B6, $1D,	$12, $8E, $3D, $66, $F6, $2C, $E3
		fcb $C4, $CF, $EA, $86,	$F7, $2C, $E3, $7F, $2C, $C3, $8E
		fcb $FA, $89, $E6, $86,	$86, $3C, $1F, 3, $B6, $1D, $12
		fcb $8E, $2E, $11, $A6,	$86, $48, $8E, $FA, $66, $EC, $86
		fcb $BD, $CC, $E2, $8E,	$F7, $DE, $BF, $20, 0, $39, $8E
		fcb $F8, $A1, $7E, $82,	$51, $B6, $1D, $12, $8E, $2E, $11
		fcb $E6, $86, $5C, $E7,	$86, $C1, $10, $23, $B7, $6F, $86
		fcb $20, $B3, $B6, $1D,	$12, $4C, $84, 7, $B7, $1D, $12
		fcb $20, $A8, $B6, $1D,	$12, $8E, $3D, $66, $E6, $86, $C8
		fcb $10, $E7, $86, $8E,	$2E, $11, $A6, $86, $8B, $AF, $34
		fcb 4, $BD, $FC, $2D, $35, 2, $85, $10,	$26, $C, $86, $7D
		fcb $BD, $FC, $2D, $4F,	$BD, $FC, $2D, $7E, $F7, $AA, $86
		fcb $7C, $BD, $FC, $2D,	$4F, $BD, $FC, $2D, $7E, $F7, $AA
		fcb $B6, $1D, $12, $8E,	$3D, $66, $E6, $86, $C8, $20
		fcb $E7, $86, $8E, $2E,	$11, $A6, $86, $8B, $AF, $34, 4
		fcb $BD, $FC, $2D, $35,	2, $85,	$20, $26, $C, $86, $7F
		fcb $BD, $FC, $2D, $4F,	$BD, $FC, $2D, $7E, $F7, $AA, $86
		fcb $7E, $BD, $FC, $2D,	$4F, $BD, $FC, $2D, $7E, $F7, $AA
		fcb $B6, $2A, $A, $84, 4, $B7, $2C, $E3, $7F, $2C, $C3
		fcb $8E, $82, $4E, $BF,	$20, 0,	$6E, $84, $E, $E, $F6
		fcb $D1, $F, $F, $F6, $DC, 8, 8, $F6, $9C, 8, $F, $F8
		fcb $6E, $E, $E, $F7, $4A, $F, $F, $F7,	$5A, 9,	9, $F7
		fcb $15, 8, $F,	$F8, $6E, $F, $F, $F7, $F7, $E,	$E, $F7
		fcb $E4, $D, $D, $F8, $38, $C, $C, $F8,	2, $B, $B, $F7
		fcb $9F, 8, $F,	$F8, $6E, 0, 7,	$F8, $6E, 0, $FF, $82
		fcb $4E, $F8, $ED, $F8,	$ED, $F8, $D1, $F8, $D9, $F8, $DF
		fcb $F8, $E7, $F8, $ED,	$F8, $ED, $8D, $1A, $86, $80, $B7
		fcb $2E, $73, $39, $8D,	$12, $7F, $2E, $74, $39, $8D, $C
		fcb $86, $FF, $B7, $2E,	$6D, $39, $8D, 4, $7F, $2E, $6F
		fcb $39, $54, $8E, $81,	$A4, $E6, $85, $F8, $3D, $6E, $F7
		fcb $3D, $6E, $F7, $2C,	$E4, $7F, $2C, $C3, $39, $F9, $10
		fcb $F9, $10, $F9, $10,	$F9, $10, $F9, $10, $F9, $10, $F9
		fcb $10, $F9, $10, $54,	$8E, $81, $A4, $E6, $85, $F8, $3D
		fcb $6F, $F7, $3D, $6F,	$B6, $3D, $6E, $B7, $2C, $E4, $B6
		fcb $3D, $6F, $B7, $2C,	$E5, $7F, $2C, $C3, $39, $F9, $3C
		fcb $F9, $D5, $F9, $E1,	$F9, $E1, $F9, $E1, $F9, $E1, $F9
		fcb $E1, $F9, $E1, $B6,	$2C, $E6, $8A, 1, $B7, $2C, $E6
		fcb $7F, $2C, $C3, $BD,	$F9, $AE, $8E, $F9, $51, $BF, $20
		fcb 0, $39, $8E, $F9, $57, $7E,	$82, $51, 8, 8,	$F9, $5F
		fcb 0, $FF, $F9, $9B, $B6, $3D,	$6E, $8A, 1, $B7, $3D
		fcb $6E, $B6, $3D, $6F,	$8A, 1,	$B7, $3D, $6F, $B6, $1D
		fcb $15, $4C, $81, 3, $25, 1, $4F, $B7,	$1D, $15, $C6
		fcb 7, $3D, $8E, $F9, $C0, $30,	$85, $EC, $81, $EE, $81
		fcb $34, $10, $BD, $CC,	$ED, $35, $10, $A6, $80, $B7, 1
		fcb $81, $EC, $84, $FD,	1, $84,	$7E, $F9, $1C, $B6, $2C
		fcb $E6, $84, $FE, $B7,	$2C, $E6, $7F, $2C, $C3, $8E, $82
		fcb $4E, $BF, $20, 0, $6E, $84,	$B6, $1D, $15, $C6, 7
		fcb $3D, $8E, $F9, $C0,	$30, $85, $EC, $81, $EE, $84, $7E
		fcb $CC, $ED, $6D, $69,	$64, $69, $82, 0, 1, $6D, $69
		fcb $64, $32, $82, 0, 0, $6D, $39, $6B,	$36, $86, 0, $C
		fcb $B6, $2C, $E6, $88,	2, $B7,	$2C, $E6, $7F, $2C, $C3
		fcb $39, $54, $8E, $81,	$A4, $A6, $85, $BA, $2C, $E6, $B7
		fcb $2C, $E6, $7F, $2C,	$C3, $34, 4, $8E, 0, $78, $BD
		fcb $FA, $5B, $35, 2, $BD, $82,	$90, $F6, $2C, $E6, $C5
		fcb 2, $27, 7, $B6, $22, $F0, $A7, 4, $20, $33,	$E6, 4
		fcb $34, $16, $CE, $8B,	$70, $E6, $C6, $E7, 4, $BE, $21
		fcb $F1, $A6, 4, $BD, $82, $A8,	$B1, $22, $F0, $26, 8
		fcb $E6, $88, $11, $20,	$F, $BD, $82, $A8, $E6,	0, $A6
		fcb $88, $10, $27, 5, $B1, $22,	$F0, $26, $F1, $35, 2
		fcb $BD, $84, $F7, $35,	$14, $FE, $21, $F1, $A6
		fcb $45, $84, $C, $34, 2, $A6, 5, $84, $F3, $AA, $E0, $A7
		fcb 5, $B6, $2C, $E6, $84, 2, $B7, $2C,	$E6, $7F, $2C
		fcb $C3, $39, $34, 2, $BD, $81,	$CD, $6A, $E4, $26, $F9
		fcb $35, $82, $20, $20,	$20, $31, $20, $32, $20, $33, $20
		fcb $34, $20, $35, $20,	$36, $20, $37, $20, $38, $20, $39
		fcb $31, $30, $31, $31,	$31, $32, $31, $33, $31, $34, $31
		fcb $35, $31, $36, $20,	$31, $32, $33, $34, $35, $36, $37
		fcb $38, $BD, $81, $CD,	$B6, $3D, $6E, $B7, $2C, $E4, $BD
		fcb $81, $CD, $B6, $3D,	$6E, $85, 1, $27, $F6, $B7, $2C
		fcb $E4, $7F, $2C, $C3,	$34, 1,	$1A, $50, $B6, $3D, $6F
		fcb $85, 1, $27, 9, $86, 3, $B7, 1, $40, $86, $15, $20
		fcb 5, $B6, $1D, $14, $84, $7F,	$B7, 1,	$40, $B7, $1D
		fcb $14, $8E, $FD, 3, $BF, $1D,	$D, $35, 1, $CC, 8, $17
		fcb $7D, $2A, $B, $27, 1, $4F, $BD, $95, $E1, $B6, $1D
		fcb $16, $27, $15, $8E,	$FD, $7A, $30, 4, $44, $24, $FB
		fcb $EC, $81, $EE, $84,	$34, $46, $BD, $CC, $E2, $35, $46
		fcb $20, 6, $CC, $73, $74, $CE,	$6F, $70, $BD, $CD, $4F
		fcb $BD, $81, $CD, $B6,	$3D, $6E, $85, 1, $26, $F6, $4F
		fcb $B7, $1D, $1A, $B7,	$1D, $19, $B7, $1D, $18, $7F, $1D
		fcb $16, $1A, $50, $B6,	$1D, $14, $8A, $80, $B7, 1, $40
		fcb $B7, $1D, $14, $8E,	$FC, $A0, $BF, $1D, $D,	$B6, 1
		fcb $41, $B6, 1, $40, $B6, 1, $41, $1C,	$AF, $CC, $20
		fcb $20, $CE, $20, $20,	$BD, $CD, $4F, $7E, $FA, $9A
; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_FB4B

loc_FB41:				; CODE XREF: sub_FB4B+3j
		lda	unk_3D6E
		bita	#1
		bne	loc_FB60
		jsr	sub_81CD
; END OF FUNCTION CHUNK	FOR sub_FB4B

; =============== S U B	R O U T	I N E =======================================


sub_FB4B:				; CODE XREF: sub_BA31P

; FUNCTION CHUNK AT FB41 SIZE 0000000A BYTES

		lda	unk_1D18
		beq	loc_FB41
		ldb	unk_1D19
		ldx	#$1D9B
		lda	b,x
		incb
		stb	unk_1D19
		dec	unk_1D18
		rts
; ---------------------------------------------------------------------------

loc_FB60:				; CODE XREF: sub_FB4B-5j
		lda	#$FF
		rts
; End of function sub_FB4B

; ---------------------------------------------------------------------------
		jsr	sub_81CD
		lda	unk_3D6F
		sta	unk_2CE5
		bra	loc_FBA6
; ---------------------------------------------------------------------------

loc_FB6E:				; CODE XREF: ROM:FB76j	ROM:FBBEJ
		jsr	sub_81CD
		lda	unk_3D6F
		bita	#1
		beq	loc_FB6E
		sta	unk_2CE5
		clr	byte_2CC3
		clr	unk_1D13
		bsr	sub_FBC1
		lda	unk_1D17
		beq	loc_FB9D
		ldx	#$FD7A

loc_FB8B:				; CODE XREF: ROM:FB8Ej
		leax	4,x
		lsra
		bcc	loc_FB8B
		ldd	,x++
		ldu	,x
		pshs	a,b,u
		jsr	loc_CCE2
		puls	u,b,a
		bra	loc_FBA3
; ---------------------------------------------------------------------------

loc_FB9D:				; CODE XREF: ROM:FB86j
		ldd	#$7374
		ldu	#$6F70

loc_FBA3:				; CODE XREF: ROM:FB9Bj
		jsr	loc_CD22

loc_FBA6:				; CODE XREF: ROM:FB6Cj	ROM:FBAEj
		jsr	sub_81CD
		lda	unk_3D6F
		bita	#1
		bne	loc_FBA6
		bsr	sub_FBC1
		clr	unk_1D17
		ldd	#$2020
		ldu	#$2020
		jsr	loc_CD22
		jmp	loc_FB6E

; =============== S U B	R O U T	I N E =======================================


sub_FBC1:				; CODE XREF: ROM:FB81p	ROM:FBB0p
		pshs	cc
		orcc	#$50 ; 'P'
		lda	unk_3D6E
		bita	#1
		beq	loc_FBD9
		lda	#3
		sta	unk_140
		lda	#$15
		sta	unk_140
		sta	unk_1D14

loc_FBD9:				; CODE XREF: sub_FBC1+9j
		clra
		sta	unk_1E28
		sta	unk_1E27
		sta	unk_1E26
		ldx	#$2E18
		ldu	#$3D6D
		lda	#8
		pshs	a

loc_FBED:				; CODE XREF: sub_FBC1+5Bj
		lda	,x
		beq	loc_FC16
		adda	#$AF ; 'Ø'
		jsr	_MIDITransmitA
		lda	#$7C ; '|'
		ldb	,u
		bitb	#$10
		bne	loc_FC00
		lda	#$7D ; '}'

loc_FC00:				; CODE XREF: sub_FBC1+3Bj
		bsr	_MIDITransmitA
		clra
		bsr	_MIDITransmitA
		lda	#$7E ; '~'
		ldb	,u
		bitb	#$20 ; ' '
		bne	loc_FC0F
		lda	#$7F ; ''

loc_FC0F:				; CODE XREF: sub_FBC1+4Aj
		jsr	_MIDITransmitA
		clra
		jsr	_MIDITransmitA

loc_FC16:				; CODE XREF: sub_FBC1+2Ej
		leax	-1,x
		leau	-1,u
		dec	,s
		bne	loc_FBED
		leas	1,s
		puls	cc

loc_FC22:				; CODE XREF: sub_FBC1+69j
		jsr	sub_81CD
		lda	unk_1D14
		bita	#$20 ; ' '
		bne	loc_FC22
		rts
; End of function sub_FBC1


; =============== S U B	R O U T	I N E =======================================


_MIDITransmitA:				; CODE XREF: sub_856C+1AP
					; sub_856C:loc_85A1P ...
		tsta
		bpl	loc_FC3D
		cmpa	#$F0 ; ''
		bcc	loc_FC3A
		cmpa	unk_1D13
		bne	loc_FC3A
		rts
; ---------------------------------------------------------------------------

loc_FC3A:				; CODE XREF: _MIDITransmitA+5j
					; _MIDITransmitA+Aj
		sta	unk_1D13

loc_FC3D:				; CODE XREF: _MIDITransmitA+1j
		pshs	cc,x
		ldb	unk_1E26
		bne	loc_FC63
		ldb	unk_1D14
		bitb	#$20 ; ' '
		bne	loc_FC63
		clr	unk_1D13
		orcc	#$50 ; 'P'
		orab	#$20 ; ' '
		stb	unk_140
		stb	unk_1D14
		ldx	#$FD07
		stx	unk_1D10
		sta	unk_141
		puls	pc,x,cc
; ---------------------------------------------------------------------------

loc_FC63:				; CODE XREF: _MIDITransmitA+15j
					; _MIDITransmitA+1Cj
		ldx	#$1EA9
		ldb	unk_1E28
		sta	b,x
		inc	unk_1E28
		orcc	#$50 ; 'P'
		inc	unk_1E26
		beq	loc_FC8E
		lda	unk_1D14
		bita	#$20 ; ' '
		beq	loc_FC7E
		puls	pc,x,cc
; ---------------------------------------------------------------------------

loc_FC7E:				; CODE XREF: _MIDITransmitA+4Dj
		oraa	#$20 ; ' '
		sta	unk_1D14
		sta	unk_140
		ldx	#$FD07
		stx	unk_1D10
		puls	pc,x,cc
; ---------------------------------------------------------------------------

loc_FC8E:				; CODE XREF: _MIDITransmitA+46j
		lda	unk_1D17
		oraa	#$40 ; '@'
		sta	unk_1D17
		lda	unk_3D6F
		oraa	#1
		sta	unk_3D6F
		puls	pc,x,cc
; End of function _MIDITransmitA


; =============== S U B	R O U T	I N E =======================================


_MIDITransmitACIA:
		lda	unk_140
		bita	#$80 ; 'Ä'
		beq	loc_FD03
		bita	#1
		beq	loc_FD03
		anda	#$30 ; '0'
		bne	loc_FCE4
		ldb	unk_141
		cmpb	#$F8 ; '¯'
		bcs	loc_FCCB
		ldx	#$1E1E
		lda	unk_1E1D
		stb	a,x
		inca
		anda	#7
		sta	unk_1E1D
		inc	unk_1E1B
		jmp	[unk_1D10]
; ---------------------------------------------------------------------------

loc_FCCB:				; CODE XREF: _MIDITransmitACIA+14j
		inc	unk_1D18
		beq	loc_FCDF
		ldx	#$1D9B
		lda	unk_1D1A
		stb	a,x
		inc	unk_1D1A
		jmp	[unk_1D10]
; ---------------------------------------------------------------------------

loc_FCDF:				; CODE XREF: _MIDITransmitACIA+2Ej
		lda	#$40 ; '@'
		dec	unk_1D18

loc_FCE4:				; CODE XREF: _MIDITransmitACIA+Dj
		oraa	word_1D15+1
		sta	word_1D15+1
		ldb	unk_3D6E
		orab	#1
		stb	unk_3D6E
		lda	unk_1D14
		anda	#$7F ; ''
		sta	unk_140
		sta	unk_1D14
		ldx	#$FD03
		stx	unk_1D0D

loc_FD03:				; CODE XREF: _MIDITransmitACIA+5j
					; _MIDITransmitACIA+9j
		jmp	[unk_1D10]
; End of function _MIDITransmitACIA

; ---------------------------------------------------------------------------
		lda	unk_140
		bita	#$80 ; 'Ä'
		beq	loc_FD3C
		bita	#2
		beq	loc_FD3C
		lda	unk_1E26
		beq	loc_FD2B
		dec	unk_1E26
		ldb	unk_1E27
		ldx	#$1EA9
		lda	b,x
		sta	unk_141
		inc	unk_1E27
		puls	x,b,a
		rti
; ---------------------------------------------------------------------------

loc_FD2B:				; CODE XREF: ROM:FD15j
		lda	unk_1D14
		anda	#$DF ; 'ﬂ'
		sta	unk_140
		sta	unk_1D14
		ldx	#$FD3C
		stx	unk_1D10

loc_FD3C:				; CODE XREF: ROM:FD0Cj	ROM:FD10j
		puls	x,b,a
		rti

; =============== S U B	R O U T	I N E =======================================


sub_FD3F:				; CODE XREF: ROM:81F8P
		lda	#%11
		sta	unk_140
		ldb	#21
		stb	unk_140
		stb	unk_1D14
		lda	unk_3D6F
		ldx	#$FD3C
		bita	#1
		bne	loc_FD59
		ldx	#$FD07

loc_FD59:				; CODE XREF: sub_FD3F+15j
		stx	unk_1D10
		sta	unk_2CE5
		lda	unk_3D6E
		ldx	#$FD03
		bita	#1
		bne	loc_FD6E
		orab	#$80 ; 'Ä'
		ldx	#$FCA0

loc_FD6E:				; CODE XREF: sub_FD3F+28j
		stx	unk_1D0D
		stb	unk_1D14
		stb	unk_140
		sta	unk_2CE4
		clr	byte_2CC3
		rts
; End of function sub_FD3F

; ---------------------------------------------------------------------------
		fcb $70	; p
		fcb $72, $6F, $31, $70,	$72, $6F, $32, $70, $72, $6F, $33
		fcb $70, $72, $6F, $34,	$66, $72, $61, $6D, $6F, $76, $72
		fcb $75, $6F, $76, $66,	$6C, $6D, $69, $73, $74, $FD, $AE
		fcb $FD, $AE, $FD, $AE,	$FD, $AE, $FD, $AE, $FD, $AE, $FD
		fcb $AE, $FD, $AE, $54,	$8E, $81, $A4, $A6, $85, $B8, $2E
		fcb $F,	$B7, $2E, $F, $B7, $2C,	$DD, $7F, $2C, $C3, $7F
		fcb $10, $D4, $7E, $95,	$9A

; =============== S U B	R O U T	I N E =======================================


sub_FDC6:				; CODE XREF: sub_D354+43P
		lda	unk_2E0F
		sta	unk_2CDD
		jmp	loc_D14D
; End of function sub_FDC6

; ---------------------------------------------------------------------------
		fcb $FD	; ˝
		fcb $DF	; ﬂ
; ---------------------------------------------------------------------------
		std	loc_E3FC+1
		stb	[-$1403,pc]
		stu	[-$C03,pc]
		stu	word_FE03
		lda	#2
		bra	loc_FE05
; ---------------------------------------------------------------------------
		lda	#4
		bra	loc_FE05
; ---------------------------------------------------------------------------
		lda	#1
		bra	loc_FDF5
; ---------------------------------------------------------------------------
		lda	#2
		bra	loc_FDF5
; ---------------------------------------------------------------------------
		lda	#4
		bra	loc_FDF5
; ---------------------------------------------------------------------------
		lda	#8

loc_FDF5:				; CODE XREF: ROM:FDE9j	ROM:FDEDj ...
		ldx	word_22F1
		eora	5,x
		sta	5,x
		jmp	sub_FE2C
; ---------------------------------------------------------------------------
		fdb $8601
; ---------------------------------------------------------------------------
		bra	loc_FE05
; ---------------------------------------------------------------------------
word_FE03:	fdb $8680		; DATA XREF: ROM:FDDCw
; ---------------------------------------------------------------------------

loc_FE05:				; CODE XREF: ROM:FDE1j	ROM:FDE5j ...
		eora	unk_3D54
		sta	unk_3D54

; =============== S U B	R O U T	I N E =======================================


sub_FE0B:				; CODE XREF: sub_82C8+D8P
		lda	unk_3D54
		ldb	unk_2CDE
		andb	#$3C ; '<'
		bita	#$80 ; 'Ä'
		bne	loc_FE19
		orab	#$80 ; 'Ä'

loc_FE19:				; CODE XREF: sub_FE0B+Aj
		bita	#1
		beq	loc_FE1F
		orab	#$40 ; '@'

loc_FE1F:				; CODE XREF: sub_FE0B+10j
		anda	#6
		lsra
		pshs	a
		orab	,s+
		stb	unk_2CDE
		jmp	loc_D14D
; End of function sub_FE0B


; =============== S U B	R O U T	I N E =======================================


sub_FE2C:				; CODE XREF: sub_D354+37P ROM:FDFCJ
		ldx	word_22F1
		lda	5,x
		anda	#$F
		asla
		asla
		pshs	a
		lda	unk_2CDE
		anda	#$C3 ; '√'
		oraa	,s+
		sta	unk_2CDE
		jmp	loc_D14D
; End of function sub_FE2C

; ---------------------------------------------------------------------------
		fcb   0
		fcb   0
		fcb 0, 0, 0, 0,	0, $C, 0, $2C, 0, $80, 0, $AA, 0, $FE
		fcb 1, $52, $41, $B6, $42, $B0,	$43, $AA, $44, $A4, $45
		fcb $9E, $46, $98, $47,	$92, $48, $8C, $61, $B6, $62, $B0
		fcb $63, $AA, $64, $A4,	$65, $9E, $66, $98, $67, $92, $68
		fcb $8C, $3F, $42, $49,	$86, $49, $96, $49, $A6, $49, $B6
		fcb $49, $C6, $49, $D6,	$49, $E6, $49, $F6, $4A, 6, $4A
		fcb $16, $69, $86, $69,	$96, $69, $A6, $69, $B6, $69, $C6
		fcb $69, $D6, $69, $E6,	$69, $F6, $6A, 6, $6A, $16, $40
		fcb $7C, $4A, $26, $4A,	$36, $4A, $46, $4A, $56, $4A, $66
		fcb $4A, $76, $4A, $86,	$4A, $96, $4A, $A6, $4A, $B6, $6A
		fcb $26, $6A, $36, $6A,	$46, $6A, $56, $6A, $66, $6A, $76
		fcb $6A, $86, $6A, $96,	$6A, $A6, $6A, $B6, $3F, $52, $4A
		fcb $C6, $4A, $D0, $4A,	$DA, $4A, $E4, $4A, $EE, $4A, $F8
		fcb $4B, 2, $4B, $C, $4B, $16, $4B, $20, $6A, $C6, $6A
		fcb $D0, $6A, $DA, $6A,	$E4, $6A, $EE, $6A, $F8, $6B, 2
		fcb $6B, $C, $6B, $16, $6B, $20, $3F, $5C, $4B,	$2A, $4B
		fcb $56, $4B, $82, $4B,	$AE, $4B, $DA, $4C
word_FF01:	fdb $64C		; DATA XREF: ROM:E002r
		fcb $32	; 2
		fcb $4C	; L
		fcb $5E, $4C, $8A, $4C,	$B6, $6B, $2A, $6B, $56, $6B, $82
		fcb $6B, $AE, $6B, $DA,	$6C, 6,	$6C, $32, $6C, $5E, $6C
		fcb $8A, $6C, $B6, $40,	$96, $4C, $E2, $4D, $E,	$4D, $3A
		fcb $4D, $66, $4D, $92,	$4D, $BE, $4D, $EA, $4E, $16, $4E
		fcb $42, $4E, $6E, $6C,	$E2, $6D, $E, $6D, $3A,	$6D, $66
		fcb $6D, $92, $6D, $BE,	$6D, $EA, $6E, $16, $6E, $42, $6E
		fcb $6E, $3F, $88, $4E,	$9A, $4E, $BA, $4E, $DA, $4E, $FA
		fcb $4F, $1A, $4F, $3A,	$4F, $5A, $4F, $7A, $4F, $9A, $4F
		fcb $BA, $6E, $9A, $6E,	$BA, $6E, $DA, $6E, $FA, $6F, $1A
		fcb $6F, $3A, $6F, $5A,	$6F, $7A, $6F, $9A, $6F, $BA, $40
		fcb $C2, $4F, $DA, $4F,	$FA, $50, $1A, $50, $3A, $50, $5A
		fcb $50, $7A, $50, $9A,	$50, $BA, $50, $DA, $50, $FA, $6F
		fcb $DA, $6F, $FA, $70,	$1A, $70, $3A, $70, $5A, $70, $7A
		fcb $70, $9A, $70, $BA,	$70, $DA, $70, $FA, $3F, $A8, $51
		fcb $1C, $51, $F0, $52,	$C4, $53, $98, $54, $6C, $55, $40
		fcb $56, $14, $56, $E8,	$57, $BC, $58, $90, $71, $1C, $71
		fcb $F0, $72, $C4, $73,	$98, $74, $6C, $75, $40, $76, $14
		fcb $76, $E8, $77, $BC,	$78, $90, $40, $E2, $59, $64, $5A
		fcb $38, $5B, $C, $5B, $E0, $5C, $B4, $5D, $88,	$5E, $5C
		fcb $5F, $30, $60, 4, $60, $D8,	$79, $64, $7A, $38, $7B
		fcb $C,	$7B, $E0, $7C, $B4, $7D, $88, $7E, $5C,	$7F, $30
		fcb $80, 4, $80, $D8, $80, 0, $81, $AC,	$81, $AC, $BE
		fcb $18, $C1, $DD, $81,	$AC, $81, $AC, $80
byte_FFFF:	fcb 0			; DATA XREF: ROM:E170w	ROM:E173w ...
; end of 'ROM'


		end
