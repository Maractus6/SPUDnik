
//{{BLOCK(spaceBg)

//======================================================================
//
//	spaceBg, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 236 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 7552 + 2048 = 10112
//
//	Time-stamp: 2023-11-08, 13:29:36
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_SPACEBG_H
#define GRIT_SPACEBG_H

#define spaceBgTilesLen 7552
extern const unsigned short spaceBgTiles[3776];

#define spaceBgMapLen 2048
extern const unsigned short spaceBgMap[1024];

#define spaceBgPalLen 512
extern const unsigned short spaceBgPal[256];

#endif // GRIT_SPACEBG_H

//}}BLOCK(spaceBg)
