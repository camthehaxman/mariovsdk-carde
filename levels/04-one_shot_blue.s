.INCLUDE "levels/macro.inc"

.4byte 0                      @ checksum will go here
.4byte level_size             @ level data size
.byte WORLD_DK_JUNGLE         @ theme (background and tileset)
.byte 0
.byte 0
.byte 0x13                    @ music
.2byte level_size             @ level data size (again)
.2byte 0x96                   @ unknown
level_name "アスレチック"
.byte 0x00, 0x01, 0x00, 0x00  @ settings
@ unknown data (JP only)
.byte 0xE3, 0x82, 0xA2, 0xE3, 0x82, 0xB9, 0xE3, 0x83, 0xAC, 0xE3, 0x83, 0x81
.byte 0xE3, 0x83, 0x83, 0xE3, 0x82, 0xAF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
.byte 0x00, 0x00, 0x00, 0x00

level_begin:
.INCBIN "levels/04-one_shot_blue.lvl.lz"
level_size = . - level_begin
