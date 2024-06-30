.INCLUDE "levels/macro.inc"

.4byte 0                      @ checksum will go here
.4byte level_size             @ level data size
.byte WORLD_SPOOKY_HOUSE      @ theme (background and tileset)
.byte 0
.byte 0
.byte 0x1D                    @ music
.2byte level_size             @ level data size (again)
.2byte 0x96                   @ unknown
level_name "ドッスンのとりで"
.byte 0x10, 0x01, 0x00, 0x00  @ settings
@ unknown data (JP only)
.byte 0xE3, 0x83, 0x89, 0xE3, 0x83, 0x83, 0xE3, 0x82, 0xB9, 0xE3, 0x83, 0xB3
.byte 0xE3, 0x81, 0xAE, 0xE3, 0x81, 0xA8, 0xE3, 0x82, 0x8A, 0xE3, 0x81, 0xA7, 0x00, 0x00, 0x00, 0x00
.byte 0x00, 0x00, 0x00, 0x00

level_begin:
.INCBIN "levels/08-the_thwamplet.lvl.lz"
level_size = . - level_begin
