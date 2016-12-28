# Wersi firmware collection

This directory holds a collection of firmwares for 1980's Wersi DMS-based hardware, including the CX7, DX5, DX10 / EX10, DH11, DX50 and MK1 / EX20.

This repository focuses on the MK1 / EX20 firmwares, and also provides new patched firmwares to fix any critical MIDI SysEx bugs.

## MK1 / EX20

Notes for MK1 / EX20 firmwares:

    630369U MK1 IC3 Ver. 1.10 (AF20)
    630369W MK1 IC3 Ver. 1.11 (AF20)
    630813N MK1 IC5 Ver. 1.11 (AF20)
    
    630469V	MK1	IC3 Ver. 1.16 (AF20) - Patch available
    630814F	MK1	IC5 Ver. 1.16 (AF20)
    
    630469W	MK1	IC3 Ver. 1.21 (AF21) 15.04.87 - Wersi MK1 S3 - Patch available
            MK1	IC5 Ver. 1.21 (AF21) 21.04.87 - Wersi MK1 S3

All firmwares support both the MK1 and EX20 hardware, and are thus interchangable.

Depending on the version of the MK1 and EX20, the hardware is either equipped with a AF20 (switched capacitor) or AF21 (SSM2044) filter board. The firmware must match this filter board, or the hardware will not start properly.

### Known bugs

A number of known critical bugs exist in the original firmware that prevent SysEx from working properly.

* Corrupted SysEx messages for blocks due to missing `0xF7` stop byte.
* Corrupted SysEx messages for transform and switch due to missing `0xF7` stop byte.

Any firmwares marked as "patched" above will have the bugs fixed for which a fix is available.

## Other firmwares

Notes for any of the other firmwares:

    630469B	CX7	IC21
    630469A	CX7	IC22
    630289F	CX7	IC23
    
    630299A	DH11 IC2
    
    630369V	DX10 IC3 Ver. 1.10 (AF20, no EX10R)
    630813P	DX10 IC5 Ver. 1.10 (AF20, no EX10R)
    
    630469Z	DX10 IC3 Ver. 1.23 (AF21)
    630814A	DX10 IC5 Ver. 1.23 (AF21)
    
    630822Q	DX10 IC3 Ver. 1.60 (AF21)
    630814Z	DX10 IC5 Ver. 1.60 (AF21)
