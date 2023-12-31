# 1 "player.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "player.c"
# 1 "gba.h" 1




typedef signed char s8;
typedef unsigned char u8;
typedef signed short s16;
typedef unsigned short u16;
typedef signed int s32;
typedef unsigned int u32;
typedef signed long long s64;
typedef unsigned long long u64;
typedef void (*ihp)(void);






extern volatile unsigned short* videoBuffer;
# 48 "gba.h"
int collision(int x1, int y1, int width1, int height1, int x2, int y2, int width2, int height2);


void waitForVBlank();
# 67 "gba.h"
extern unsigned short oldButtons;
extern unsigned short buttons;



typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;
extern DMA *dma;
# 98 "gba.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);
# 2 "player.c" 2
# 1 "mode0.h" 1
# 32 "mode0.h"
typedef struct {
 u16 tileimg[8192];
} CB;



typedef struct {
 u16 tilemap[1024];
} SB;
# 3 "player.c" 2
# 1 "sprites.h" 1
# 10 "sprites.h"
typedef struct {
  u16 attr0;
  u16 attr1;
  u16 attr2;
  u16 fill;
} OBJ_ATTR;



extern OBJ_ATTR shadowOAM[128];
# 64 "sprites.h"
void hideSprites();


typedef struct {
    int x;
    int y;
    int xVel;
    int yVel;
    int width;
    int height;
    int timeUntilNextFrame;
    int direction;
    int isAnimating;
    int currentFrame;
    int numFrames;
    u8 oamIndex;
} SPRITE;
# 4 "player.c" 2
# 1 "print.h" 1
# 25 "print.h"
# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 1 3 4
# 9 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 1 3 4
# 12 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 1 3 4







# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 1 3 4
# 28 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_newlib_version.h" 1 3 4
# 29 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 2 3 4
# 9 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 2 3 4
# 41 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4

# 41 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef signed char __int8_t;

typedef unsigned char __uint8_t;
# 55 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef short int __int16_t;

typedef short unsigned int __uint16_t;
# 77 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long int __int32_t;

typedef long unsigned int __uint32_t;
# 103 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __int64_t;

typedef long long unsigned int __uint64_t;
# 134 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef signed char __int_least8_t;

typedef unsigned char __uint_least8_t;
# 160 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef short int __int_least16_t;

typedef short unsigned int __uint_least16_t;
# 182 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long int __int_least32_t;

typedef long unsigned int __uint_least32_t;
# 200 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __int_least64_t;

typedef long long unsigned int __uint_least64_t;
# 214 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __intmax_t;







typedef long long unsigned int __uintmax_t;







typedef int __intptr_t;

typedef unsigned int __uintptr_t;
# 13 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 1 3 4
# 35 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 3 4
       
       
       
       
       
       
       
# 187 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 3 4
       
       
       
       
       
       
       
# 14 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_stdint.h" 1 3 4
# 20 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_stdint.h" 3 4
typedef __int8_t int8_t ;



typedef __uint8_t uint8_t ;







typedef __int16_t int16_t ;



typedef __uint16_t uint16_t ;







typedef __int32_t int32_t ;



typedef __uint32_t uint32_t ;







typedef __int64_t int64_t ;



typedef __uint64_t uint64_t ;






typedef __intmax_t intmax_t;




typedef __uintmax_t uintmax_t;




typedef __intptr_t intptr_t;




typedef __uintptr_t uintptr_t;
# 15 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4






typedef __int_least8_t int_least8_t;
typedef __uint_least8_t uint_least8_t;




typedef __int_least16_t int_least16_t;
typedef __uint_least16_t uint_least16_t;




typedef __int_least32_t int_least32_t;
typedef __uint_least32_t uint_least32_t;




typedef __int_least64_t int_least64_t;
typedef __uint_least64_t uint_least64_t;
# 51 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast8_t;
  typedef unsigned int uint_fast8_t;
# 61 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast16_t;
  typedef unsigned int uint_fast16_t;
# 71 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast32_t;
  typedef unsigned int uint_fast32_t;
# 81 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef long long int int_fast64_t;
  typedef long long unsigned int uint_fast64_t;
# 10 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 2 3 4
# 26 "print.h" 2
# 35 "print.h"

# 35 "print.h"
uint8_t mgba_open(void);
void mgba_printf_level(int level, const char* ptr, ...);
void mgba_printf(const char* string, ...);
void mgba_break(void);
void mgba_close(void);
# 5 "player.c" 2
# 1 "spritesheet.h" 1
# 21 "spritesheet.h"
extern const unsigned short spritesheetTiles[16384];


extern const unsigned short spritesheetPal[256];
# 6 "player.c" 2
# 1 "spaceBg.h" 1
# 22 "spaceBg.h"
extern const unsigned short spaceBgTiles[3648];


extern const unsigned short spaceBgMap[1024];


extern const unsigned short spaceBgPal[256];
# 7 "player.c" 2
# 1 "tileset.h" 1
# 21 "tileset.h"
extern const unsigned short tilesetTiles[16384];


extern const unsigned short tilesetPal[256];
# 8 "player.c" 2
# 1 "gameMap.h" 1







extern const unsigned short gameMapMap[2048];
# 9 "player.c" 2
# 1 "player.h" 1
# 12 "player.h"
typedef struct {
    int x;
    int y;
    int vel;
    int height;
    int width;
    int isMoving;
    int timeUntilNextFrame;
    int currentFrame;
    int numFrames;
    char direction;
} PLAYER;


PLAYER player;
OBJ_ATTR shadowOAM[128];
int lives;


void initPlayer(PLAYER* player);
void drawPlayer(PLAYER* player);
void updatePlayer(PLAYER* player);
# 10 "player.c" 2
# 1 "game.h" 1
# 9 "game.h"
extern int currLives;
extern int PotatoFrames;
extern int totalCycles;
extern int spaceshipColl;
extern int hoff;
extern int voff;
extern int spaceHoff;
extern int isWatering;

typedef struct {
    int x;
    int y;
    int OAMIndex;
    int height;
    int width;
    int active;
    int watered;
    int timeUntilNextStage;
    int currentStage;
    int numStage;
} POTATO;

typedef struct {
    int active;
    int OAMIndex;
} LIVES;

typedef struct {
    int x;
    int y;
    int OAMIndex;
    int height;
    int width;
} SPACESHIP;

typedef struct {
    int x;
    int y;
    int currentFrame;
    int totalFrames;
    int timeUntilNextStage;
} PAUSESPACESHIP;


void drawPotato();
void updatePotato();
void waterPotato(PLAYER* player);
void seedPotato(PLAYER* player);
void pickPotato(PLAYER* player);
void initGame();
void updateGame();
void drawGame();
void updateNumPotatoes();
void drawNumPotatoes();
void eatPotato();
void drawLives();
void updateLives();
void drawSpaceship();
void drawWaterMachine();
void interactWithWaterMachine(PLAYER* player);
void toggleCheat();
void tillField();
void animateLowHealth();
void initSpaceship();

void setupInterrupts();
void interruptHandler();

void initPauseSpaceship();
void drawPauseSpaceship();
void updatePauseSpaceship();
# 11 "player.c" 2
void initPlayer(PLAYER* player) {
    player -> x = 16;
    player -> y = 272;
    player -> vel = 1;
    player -> height = 16;
    player -> width = 16;
    player -> direction = 'u';
    player -> isMoving = 0;
    player -> timeUntilNextFrame = 10;
    player -> currentFrame = 0;
    player -> numFrames = 4;
}
void drawPlayer(PLAYER* player) {
    shadowOAM[0].attr0 = (0 << 13) | (0 << 14) | ((player -> y - voff) & 0xFF);
    shadowOAM[0].attr1 = (1 << 14) | ((player -> x - hoff) & 0x1FF);


    if (player -> isMoving == 0) {
        if (player -> direction == 'u') {
            shadowOAM[0].attr2 = (((6) * (32) + (0)) & 0x3FF);
            if (isWatering) {
                shadowOAM[0].attr2 = (((6) * (32) + (8)) & 0x3FF);
            }
        } else if (player -> direction == 'l') {
            shadowOAM[0].attr2 = (((4) * (32) + (0)) & 0x3FF);
            if (isWatering) {
                shadowOAM[0].attr2 = (((4) * (32) + (8)) & 0x3FF);
            }
        } else if (player -> direction == 'r') {
            shadowOAM[0].attr2 = (((2) * (32) + (0)) & 0x3FF);
            if (isWatering) {
                shadowOAM[0].attr2 = (((2) * (32) + (8)) & 0x3FF);
            }
        } else {
            shadowOAM[0].attr2 = (((0) * (32) + (0)) & 0x3FF);
            if (isWatering) {
                shadowOAM[0].attr2 = (((2) * (32) + (10)) & 0x3FF);
            }
        }

    } else if (player -> direction == 'l') {
        shadowOAM[0].attr2 = (((4) * (32) + (player -> currentFrame * 2)) & 0x3FF);
    } else if (player -> direction == 'r') {
        shadowOAM[0].attr2 = (((2) * (32) + (player -> currentFrame * 2)) & 0x3FF);
    } else if (player -> direction == 'u') {
        shadowOAM[0].attr2 = (((6) * (32) + (player -> currentFrame * 2)) & 0x3FF);

    } else {
        shadowOAM[0].attr2 = (((0) * (32) + (player -> currentFrame * 2)) & 0x3FF);

    }
}
void updatePlayer(PLAYER* player) {

    player -> isMoving = 0;


    if((~(buttons) & ((1 << 5)))) {
        player -> isMoving = 1;
        if ((player -> x - player -> vel) > 0) {
            player -> x -= player -> vel;

            player -> direction = 'l';
        }
    }
    if ((~(buttons) & ((1 << 4)))) {
        player -> isMoving = 1;
        if ((player -> x + player -> vel) < (256 - player->width)) {
            player -> x += player -> vel;

            player -> direction = 'r';

        }
    }
    if ((~(buttons) & ((1 << 6)))) {
        player -> isMoving = 1;
        if ((player -> y + player -> vel) > 256) {
            player -> y -= player -> vel;


            player -> direction = 'u';
        }
    }
    if ((~(buttons) & ((1 << 7)))) {
        player -> isMoving = 1;
        if ((player -> y - player -> vel) < (512 - player -> height)) {
            player -> y += player -> vel;

            player -> direction = 'd';
        }
    }
    if ((!(~(oldButtons) & ((1 << 8))) && (~(buttons) & ((1 << 8))))) {
        seedPotato(player);
    }
    if ((!(~(oldButtons) & ((1 << 9))) && (~(buttons) & ((1 << 9))))) {
        tillField(player);
    }
    if ((!(~(oldButtons) & ((1 << 0))) && (~(buttons) & ((1 << 0))))) {
        waterPotato(player);
        pickPotato(player);
    }
    if ((!(~(oldButtons) & ((1 << 1))) && (~(buttons) & ((1 << 1))))) {
        eatPotato();
    }

    if ((!(~(oldButtons) & ((1 << 8))) && (~(buttons) & ((1 << 8)))) && (!(~(oldButtons) & ((1 << 9))) && (~(buttons) & ((1 << 9))))) {
        toggleCheat(player);
    }


    if (player -> isMoving) {
            player -> timeUntilNextFrame--;
        if (player -> timeUntilNextFrame == 0) {
            player -> currentFrame++;
            if (player -> currentFrame >= player -> numFrames) {
                player -> currentFrame = 0;
            }
            player -> timeUntilNextFrame = 10;
        }
    } else {
        player -> currentFrame = 1;
        player -> timeUntilNextFrame = 10;
    }



    hoff = player -> x - (240 - player -> width) / 2;
    voff = player -> y - (160 - player -> height) / 2;


    if ((voff + 160) > 64*8 ) {

        voff = 64*8 - 160;
    } else if (voff < 256 - (160 / 2)){
        voff = 256 - (160 / 2);
    }
    if ((hoff + 240) > 32*8) {
        hoff = 32*8 - 240;
    } else if (hoff < 0){
        hoff = 0;
    }
}
