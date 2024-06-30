.macro LEVEL_NAME name
1:
	.ascii "\name"
	.org 1b + 32
.endm
