.INCLUDE "levels/macro.inc"

.4byte 0                      @ checksum will go here
.4byte level_size             @ level data size
.byte WORLD_MARIO_TOY_CO      @ theme (background and tileset)
.byte 0
.byte 0
.byte 0x09                    @ music
.2byte level_size             @ level data size (again)
.2byte 0x012C                 @ unknown
level_name "The Long Way"
.byte 0x20, 0x01, 0x00, 0x00  @ settings

level_begin:
.INCBIN "levels/03-the_long_way.lvl.lz"
level_size = . - level_begin
