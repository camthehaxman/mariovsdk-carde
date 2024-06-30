@ World themes
WORLD_MARIO_TOY_CO      = 0
WORLD_DK_JUNGLE         = 1
WORLD_FIRE_MOUNTAIN     = 2
WORLD_SPOOKY_HOUSE      = 3
WORLD_MYSTIC_FOREST     = 4
WORLD_TWILIGHT_CITY     = 5

.macro LEVEL_NAME name
1:
	.ascii "\name"
	.org 1b + 32
.endm
