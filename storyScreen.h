
//{{BLOCK(storyScreen)

//======================================================================
//
//	storyScreen, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 524 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 16768 + 2048 = 19328
//
//	Time-stamp: 2023-11-14, 12:41:11
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_STORYSCREEN_H
#define GRIT_STORYSCREEN_H

#define storyScreenTilesLen 16768
extern const unsigned short storyScreenTiles[8384];

#define storyScreenMapLen 2048
extern const unsigned short storyScreenMap[1024];

#define storyScreenPalLen 512
extern const unsigned short storyScreenPal[256];

#endif // GRIT_STORYSCREEN_H

//}}BLOCK(storyScreen)
