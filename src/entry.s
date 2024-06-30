	.SECTION .text

@ Application entry point

	.GLOBAL _entry
_entry: @ 0x02000000
	@ Jump to the AgbMain function
	ldr r1, _pool @ =AgbMain
	bx r1
_pool: .4byte AgbMain
