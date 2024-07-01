.INCLUDE "levels/macro.inc"

.4byte 0                      @ checksum will go here
.4byte level_size             @ level data size
.byte WORLD_SPOOKY_HOUSE      @ theme (background and tileset)
.byte 0
.byte 0
.byte 0x1D                    @ music
.2byte level_size             @ level data size (again)
.2byte 0x96                   @ unknown
level_name "The Thwamplet"
.byte 0x10, 0x01, 0x00, 0x00  @ settings

level_begin:
.INCBIN "levels/08-the_thwamplet.lvl.lz"
level_size = . - level_begin
