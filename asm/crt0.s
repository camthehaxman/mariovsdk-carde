	.INCLUDE "macro.inc"

	.SECTION .text

	.GLOBAL _entry
_entry: @ 0x02000000
	ldr r1, _02000008 @ =main
	bx r1
_02000008: .4byte main
