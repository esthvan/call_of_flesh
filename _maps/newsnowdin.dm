#if !defined(MAP_FILE)

        #include "map_files\Stalker\old\newsnowdin.dmm"

        #define MAP_FILE "newsnowdin.dmm"
        #define MAP_NAME "stalker_snow"
		#define MAP_TRANSITION_CONFIG list(MAIN_STATION = CROSSLINKED, CENTCOMM = SELFLOOPING)
#elif !defined(MAP_OVERRIDE)

	#warn a map has already been included, ignoring newsnowdin.dmm.

#endif