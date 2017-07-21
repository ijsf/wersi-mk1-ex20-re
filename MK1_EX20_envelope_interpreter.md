# MK1/EX20 Envelope programming

(All values in hex unless stated otherwise.)

The 6809 master CPU loads and handles all envelope data and sends it to the 6809 co CPU.
The co CPU processes all envelope data for each of the 20 voices, and generates all necessary amplitude/frequency envelope signals.

Envelopes can be standard, editable, or special (non-editable). We only consider editable and special envelopes here.

Data structure from high to low level:

1. Voice preset data (ICB+VCF+AMPL+FREQ+WAVE+etc.)
2. AMPL/FREQ envelope data
3. Envelope module data
4. Instruction data

Envelope data, stored as part of a voice preset in AMPL or FREQ voice data, consists of 6 bytes per envelope module.

Each module is a small subroutine/program consisting of a few instructions that implements a particular envelope action.
A number of these modules are implemented in the MK1/EX20 button interface and can be edited.
However, non-standard modules are frequently used in the factory ROM presets.
These will trigger a "special envelope" event and cannot be edited in the interface.

Each instruction consist of an opcode and a number of operand (parameter) bits.

When the master CPU loads envelope data, it uses a table defining all standard envelope modules.
Each table entry contains a data and a mask, which is used to check whether the given envelope data matches any module in the table.
The mask is necessary to mask out operands (which can be anything) from the opcodes.

## Interpreter

The envelope interpreter uses the following variables:

* y register: ptr to current module data, used to decode relevant operands.
* d8: 16-bit double word register at offset $8
* dA: 16-bit double word register at offset $A
* dC: 16-bit double word register at offset $C
* w8: 8-bit word register at offset $8 (aliases d8)
* wA: 8-bit word register at offset $A (aliases dA)
* wC: 8-bit word register at offset $C (aliases dC)

## Instructions

Opcodes are encoded in 8 bits. The interpreter distinguishes two types:

1. **y operations**: e.g. used to load in operands (parameters) using y and store result in a register.
2. **register operations**: e.g. used to perform operations on registers.

If opcode is a multiple of 4 (e.g. first 2 bits are 0), it is a **register operation**.
Otherwise, it is a **y operation**.

Opcode table:

```
y[AA BB] represents the bit mask used to decode the operands,
AA represents the first byte including the opcode,
BB represents the second byte.

y[F0 FF] yields a 12-bit operand encoded in both bytes.
y[00 FF] an 8-bit operand encoded in the second byte.

---

00  TableROps[0]  ???

04  TableROps[1]  w10 = (w10--) % y[00 FF]
08  TableROps[2]  w10 = (w10--) % wA
0C  TableROps[3]  w10 = (w10--) % wC

10  TableROps[4]  ??? noise

14  TableROps[5]  w11 = (w11--) % y[00 FF]
18  TableROps[6]  w11 = (w11--) % wA
1C  TableROps[7]  w11 = (w11--) % wC

20  TableROps[8]  ???

24  TableROps[9]  if(d8 > dA)
28  TableROps[A]  if(d8 > dC)
2C  TableROps[B]  if(dA > dC)

30  TableROps[C]  ???

34  TableROps[D]  if(dA > d8)
38  TableROps[E]  if(dC > d8)
3C  TableROps[F]  if(dC > dA)

40  TableROps[10] dA = ~dA (-dA)

44  TableROps[11] d8 = dA
48  TableROps[12] d8 = dC
4C  TableROps[13] dA = dC

50  TableROps[14] dC = ~dC (-dC)

54  TableROps[15] dA = d8
58  TableROps[16] dC = d8
5C  TableROps[17] dC = dA

60  TableROps[18] swap(dA, dC)

64  TableROps[19] d8 += dA
68  TableROps[1A] d8 += dC
6C  TableROps[1B] dA += dC

70  TableROps[1C] ???

74  TableROps[1D] dA += d8
78  TableROps[1E] dC += d8
7C  TableROps[1F] dC += dA

80  TableROps[20] ??? vibrato 1

84  TableROps[21] d8 -= dA
88  TableROps[22] d8 -= dC
8C  TableROps[23] dA -= dC

90  TableROps[24] ??? vibrato 2

94  TableROps[25] dA -= d8
98  TableROps[26] dC -= d8
9C  TableROps[27] dC -= dA

A0  TableROps[28] ???

A4  TableROps[29] ???
A8  TableROps[2A] ???
AC  TableROps[2B] ???

B0  TableROps[2C] dA *= y[00 FF], or $FFFF on overflow

B4  TableROps[2D] d8 *= y[00 FF]
B8  TableROps[2E] dA *= y[00 FF]
BC  TableROps[2F] dC *= y[00 FF]

C0  TableROps[30] dC *= y[00 FF], or $FFFF on overflow

C4  TableROps[31] d8 = d8 + (d8 * y[00 FF]), or $FFFF on overflow
C8  TableROps[32] dA = dA + (dA * y[00 FF]), or $FFFF on overflow
CC  TableROps[33] dC = dC + (dC * y[00 FF]), or $FFFF on overflow

D0  TableROps[34] d8 *= dA
D4  TableROps[35] d8 *= dC
D8  TableROps[36] dA *= dC
DC  TableROps[37] dC *= dC

E0  TableROps[38] d8 = d8 + (d8 * dA), or $FFFF on overflow
E4  TableROps[39] d8 = d8 + (d8 * dC), or $FFFF on overflow
E8  TableROps[3A] dA = dA + (dA * dC), or $FFFF on overflow
EC  TableROps[3B] dC = dC + (dC * dA), or $FFFF on overflow

F0  TableROps[3C] ???
F4  TableROps[3D] ???
F8  TableROps[3E] ???
FC  TableROps[3F] ???

```

## Standard envelope modules

Notation using 12-byte notation as used in ROM.
First byte contains the opcode bits.
Second byte contains the operand (parameter) bitmask for the first byte.

### NOP

```
00 00   00 00   00 00   00 00   00 00   00 00
```

### Linear up

```
03 F0   00 FF   68 00   0D F0   00 FF   C0 3F
```

### Exponential up

```
02 F0   00 FF   E0 00   0D F0   00 FF   C0 3F
```

### Dynamic linear up

```
BC 00   00 FF   68 00   0D F0   00 FF   C0 3F
```

### Dynamic exponential up

```
BC 00   00 FF   E4 00   0D F0   00 FF   C0 3F
```

### Linear down

```
03 F0   00 FF   88 00   09 F0   00 FF   C0 3F
```

### Exponential down

```
02 F0   00 FF   F0 00   09 F0   00 FF   C0 3F
```

### Dynamic linear down

```
BC 00   00 FF   88 00   09 F0   00 FF   C0 3F
```

### Dynamic exponential down

```
BC 00   00 FF   F4 00   09 F0   00 FF   C0 3F
```

### Constant absolute

```
01 F0   00 FF   00 00   00 FF   00 00   00 00
```

### Constant relative

```
05 F0   00 FF   00 00   00 FF   00 00   00 00
```

### Step absolute

```
01 F0   00 FF   01 F0   00 FF   00 00   00 00
```

### Step relative

```
05 F0   00 FF   05 F0   00 FF   00 00   00 00
```

### Dynamic remain

```
BC 00   00 FF   00 00   00 FF   0C 00   00 3F
```

### Key weight

```
60 00   DC 00   BC 00   00 FF   68 00   60 00
```

### Vibrato 1

```
00 00   00 00   80 00   00 FF   00 FF   00 FF
```

### Vibrato 2

```
00 00   00 00   90 00   00 FF   00 FF   00 FF
```

### Noise

```
00 00   00 00   10 00   00 00   00 FF   00 FF
```

### Repeat

```
02 F0   00 FF   00 00   00 FF   18 00   00 3F
```
