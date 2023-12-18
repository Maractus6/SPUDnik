# 1 "game.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "game.c"
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
# 2 "game.c" 2
# 1 "mode0.h" 1
# 32 "mode0.h"
typedef struct {
 u16 tileimg[8192];
} CB;



typedef struct {
 u16 tilemap[1024];
} SB;
# 3 "game.c" 2
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
# 4 "game.c" 2
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
# 5 "game.c" 2
# 1 "spritesheet.h" 1
# 21 "spritesheet.h"
extern const unsigned short spritesheetTiles[16384];


extern const unsigned short spritesheetPal[256];
# 6 "game.c" 2
# 1 "spaceBg.h" 1
# 22 "spaceBg.h"
extern const unsigned short spaceBgTiles[3648];


extern const unsigned short spaceBgMap[1024];


extern const unsigned short spaceBgPal[256];
# 7 "game.c" 2
# 1 "tileset.h" 1
# 21 "tileset.h"
extern const unsigned short tilesetTiles[16384];


extern const unsigned short tilesetPal[256];
# 8 "game.c" 2
# 1 "gameMap.h" 1







extern const unsigned short gameMapMap[2048];
# 9 "game.c" 2
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
# 10 "game.c" 2
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
# 11 "game.c" 2
# 1 "digitalSounds.h" 1



void setupSounds();
void playSoundA(const signed char* sound, int length, int loops);
void playSoundB(const signed char* sound, int length, int loops);

void pauseSounds();
void unpauseSounds();
void stopSounds();
# 49 "digitalSounds.h"
typedef struct{
    const signed char* data;
    int dataLength;
    int isPlaying;
    int looping;
    int durationInVBlanks;
    int vBlankCount;
} SOUND;

SOUND soundA;
SOUND soundB;
# 12 "game.c" 2

# 1 "minecraftEating.h" 1


extern const unsigned int minecraftEating_sampleRate;
extern const unsigned int minecraftEating_length;
extern const signed char minecraftEating_data[];
# 14 "game.c" 2
# 1 "wateringPlant.h" 1


extern const unsigned int wateringPlant_sampleRate;
extern const unsigned int wateringPlant_length;
extern const signed char wateringPlant_data[];
# 15 "game.c" 2
# 1 "minecraftDirt.h" 1


extern const unsigned int minecraftDirt_sampleRate;
extern const unsigned int minecraftDirt_length;
extern const signed char minecraftDirt_data[];
# 16 "game.c" 2


POTATO potatoArr[12];
LIVES livesArr[12];
SPACESHIP spaceship;
PAUSESPACESHIP pauseSpaceship;
enum SOILID {SOIL1 = 16, SOIL2 = 17, SOIL3 = 48, SOIL4 = 49};


int numPotatoes;
int potatoYield;
int maxLives = 8;
int spaceshipColl;
int currLives;
int totalCycles;
int timeUntilNextCycle;
int amtWater = 10;
int hoff = 0;
int voff = 32 * 8;
int spaceHoff = 0;
int waterAdded = 8;
int maxWater = 30;
int cheat = 0;
int plantCycle = 300;
int lowHealthAnimationCount = 10;
int isWatering;


void initPotatoes() {
    int index = 1;
    for (int i = 0; i < 12; i++) {
        potatoArr[i].OAMIndex = index;
        potatoArr[i].height = 16;
        potatoArr[i].width = 16;
        potatoArr[i].active = 0;
        potatoArr[i].numStage = 5;
        index++;
    }

}

void initPauseSpaceship() {
    pauseSpaceship.currentFrame = 0;
    pauseSpaceship.totalFrames = 4;
    pauseSpaceship.timeUntilNextStage = 4000;
}


void initSpaceship() {
    spaceship.x = 200;
    spaceship.y = 110;
    spaceship.OAMIndex = 30;
    spaceship.height = 34;
    spaceship.width = 29;
}


void initGame() {
    initPlayer(&player);
    initPotatoes();
    initSpaceship();
    numPotatoes = 15;
    potatoYield = 2;
    maxLives = 8;
    currLives = 8;
    totalCycles = 0;
    timeUntilNextCycle = 300;
    spaceshipColl = 0;
    amtWater = 8;
    cheat = 0;
}


void toggleCheat() {
    cheat = !cheat;
    mgba_printf("cheat toggled");
    if (cheat) {
        plantCycle = 300 / 2;
        amtWater = 30;
        for (int i = 0; i < 12; i++) {
            potatoArr[i].timeUntilNextStage /= 2;
        }
    } else {
        plantCycle = 300;
    }
}


void tillField(PLAYER* player) {

    if ((((SB*) 0x06000000)[24].tilemap[(((player -> y / 8) + 1) * (32) + ((player -> x / 8)))] != ((SOIL1 & 1023) | (((1 & 15) << 12))))
     && (((SB*) 0x06000000)[24].tilemap[(((player -> y / 8) + 1) * (32) + ((player -> x / 8)))] != ((SOIL2 & 1023) | (((1 & 15) << 12))))
     && (((SB*) 0x06000000)[24].tilemap[(((player -> y / 8) + 1) * (32) + ((player -> x / 8)))] != ((SOIL3 & 1023) | (((1 & 15) << 12))))
     && (((SB*) 0x06000000)[24].tilemap[(((player -> y / 8) + 1) * (32) + ((player -> x / 8)))] != ((SOIL4 & 1023) | (((1 & 15) << 12))))
     && (((SB*) 0x06000000)[24].tilemap[(((player -> y / 8) + 1) * (32) + ((player -> x / 8) + 1))] != ((SOIL1 & 1023) | (((1 & 15) << 12))))
     && (((SB*) 0x06000000)[24].tilemap[(((player -> y / 8) + 1) * (32) + ((player -> x / 8) + 1))] != ((SOIL3 & 1023) | (((1 & 15) << 12))))
     && (((SB*) 0x06000000)[24].tilemap[(((player -> y / 8) + 1) * (32) + ((player -> x / 8) + 1))] != ((SOIL4 & 1023) | (((1 & 15) << 12))))
     && (((SB*) 0x06000000)[24].tilemap[(((player -> y / 8) + 2) * (32) + ((player -> x / 8)))] != ((SOIL1 & 1023) | (((1 & 15) << 12))))
     && (((SB*) 0x06000000)[24].tilemap[(((player -> y / 8) + 2) * (32) + ((player -> x / 8)))] != ((SOIL2 & 1023) | (((1 & 15) << 12))))
     && (((SB*) 0x06000000)[24].tilemap[(((player -> y / 8) + 2) * (32) + ((player -> x / 8)))] != ((SOIL4 & 1023) | (((1 & 15) << 12))))
     && (((SB*) 0x06000000)[24].tilemap[(((player -> y / 8) + 2) * (32) + ((player -> x / 8) + 1))] != ((SOIL1 & 1023) | (((1 & 15) << 12))))
     && (((SB*) 0x06000000)[24].tilemap[(((player -> y / 8) + 2) * (32) + ((player -> x / 8) + 1))] != ((SOIL2 & 1023) | (((1 & 15) << 12))))
     && (((SB*) 0x06000000)[24].tilemap[(((player -> y / 8) + 2) * (32) + ((player -> x / 8) + 1))] != ((SOIL3 & 1023) | (((1 & 15) << 12))))
     && (player -> y > (32 * 8))) {

        ((SB*) 0x06000000)[24].tilemap[(((player -> y / 8) + 1) * (32) + ((player -> x / 8)))]
        = (SOIL1 & 1023) | ((1 & 15) << 12);
        ((SB*) 0x06000000)[24].tilemap[(((player -> y / 8) + 1) * (32) + ((player -> x / 8) + 1))]
        = (SOIL2 & 1023) | ((1 & 15) << 12);
        ((SB*) 0x06000000)[24].tilemap[(((player -> y / 8) + 2) * (32) + ((player -> x / 8)))]
        = (SOIL3 & 1023) | ((1 & 15) << 12);
        ((SB*) 0x06000000)[24].tilemap[(((player -> y / 8) + 2) * (32) + ((player -> x / 8) + 1))]
        = (SOIL4 & 1023) | ((1 & 15) << 12);
        playSoundB(minecraftDirt_data, minecraftDirt_length , 0);
     }
}


void animateLowHealth() {
    lowHealthAnimationCount--;
    if (lowHealthAnimationCount < 10) {

        ((u16*) 0x5000200)[1] = (((0) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10);
        if (lowHealthAnimationCount == 0) {
            lowHealthAnimationCount = 20;
        }
    }
    else {
        ((u16*) 0x5000200)[1] = (((26) & 31) | ((6) & 31) << 5 | ((4) & 31) << 10);
    }
}


void seedPotato(PLAYER* player) {
    int found = 0;

    mgba_printf("%d", (SOIL1 & 1023));
    if (((SB*) 0x06000000)[24].tilemap[(((player -> y / 8) + 1) * (32) + (((player -> x) / 8)))]
    == ((SOIL1 & 1023) | (((1 & 15) << 12)))) {
        for (int i = 0; i < 12; i++) {
            if ((potatoArr[i].active == 0) && (found == 0)) {
                potatoArr[i].active = 1;
                potatoArr[i].x = player -> x - player -> x % 8;
                potatoArr[i].y = player -> y - player -> y % 8 + 4;
                potatoArr[i].watered = 0;
                potatoArr[i].timeUntilNextStage = plantCycle;
                potatoArr[i].currentStage = 0;
                found = 1;
                numPotatoes--;
                if (numPotatoes < 0) {
                    numPotatoes = 0;
                }
                break;
            }
        }
    }
}

void waterPotato(PLAYER* player) {
        for (int i = 0; i < 12; i++) {
            if (collision(player -> x, player -> y, player -> width, player -> height,
             potatoArr[i].x, potatoArr[i].y, potatoArr[i].width, potatoArr[i].height)
             && (potatoArr[i].active && amtWater > 0) && (potatoArr[i].watered == 0)
             && potatoArr[i].currentStage != potatoArr[i].numStage - 1) {
                potatoArr[i].watered = 1;

                if (!cheat) {
                    amtWater--;
                }
                playSoundB(wateringPlant_data, wateringPlant_length, 0);
                isWatering = 90;
            }
        }
}


void pickPotato(PLAYER* player) {
        for (int i = 0; i < 12; i++) {
            if (collision(player -> x, player -> y, player -> width, player -> height,
             potatoArr[i].x, potatoArr[i].y, potatoArr[i].width, potatoArr[i].height)
             && potatoArr[i].active && (potatoArr[i].currentStage == potatoArr -> numStage - 1)) {
                numPotatoes += potatoYield;
                potatoArr[i].active = 0;
            }
        }
}


void eatPotato() {
    if ((numPotatoes > 0) && (currLives < maxLives)) {
        numPotatoes--;
        currLives++;
        playSoundB(minecraftEating_data, minecraftEating_length, 0);


    }
}


void updateLives() {
    timeUntilNextCycle--;
    if (timeUntilNextCycle == 0) {
        timeUntilNextCycle = 300;
        currLives--;
        totalCycles++;
    }
    if (currLives < 4) {
        animateLowHealth();
    } else {
        ((u16*) 0x5000200)[1] = (((26) & 31) | ((6) & 31) << 5 | ((4) & 31) << 10);
    }
}


void drawLives() {
    int index = 15;
    for (int i = 0; i < currLives; i++) {
        shadowOAM[index].attr0 = (0 << 8) | (0 << 13) | (0 << 14) | ((5) & 0xFF);
        shadowOAM[index].attr1 = (0 << 14) | ((2 + (i * 10)) & 0x1FF);
        shadowOAM[index].attr2 = (((0) & 0xF) << 12) | (((0) & 3) << 10) | (((10) * (32) + (0)) & 0x3FF);
        index++;
    }
    for (int i = currLives; i < maxLives; i++) {
        shadowOAM[index].attr0 = (0 << 8) | (0 << 13) | (0 << 14) | ((5) & 0xFF);
        shadowOAM[index].attr1 = (0 << 14) | ((2 + (i * 10)) & 0x1FF);
        shadowOAM[index].attr2 = (((0) & 0xF) << 12) | (((0) & 3) << 10) | (((11) * (32) + (0)) & 0x3FF);
        index++;
    }

}

void updateNumWater(PLAYER* player) {
    if (collision(player -> x - hoff, player -> y - voff, player -> width, player -> height,
     100 - hoff, 300 - voff, 32, 32) && ((!(~(oldButtons) & ((1 << 0))) && (~(buttons) & ((1 << 0)))))) {
        if (amtWater + waterAdded < maxWater) {
            amtWater += waterAdded;
        } else if (amtWater + waterAdded > maxWater && (amtWater < maxWater)) {
            amtWater = maxWater;
        }
    }
}

void drawNumWater() {

    shadowOAM[23].attr0 = (0 << 8) | (0 << 13) | (0 << 14) | ((5) & 0xFF);
    shadowOAM[23].attr1 = (1 << 14) | ((210) & 0x1FF);
    shadowOAM[23].attr2 = (((0) & 0xF) << 12) | (((0) & 3) << 10) | (((8) * (32) + (12)) & 0x3FF);

    if (cheat) {
            shadowOAM[24].attr0 = (0 << 8) | (0 << 13) | (0 << 14) | ((10) & 0xFF);
            shadowOAM[24].attr1 = (0 << 14) | ((225) & 0x1FF);
            shadowOAM[24].attr2 = (((0) & 0xF) << 12) | (((0) & 3) << 10) | (((1) * (32) + (20)) & 0x3FF);
            shadowOAM[25].attr0 = (2 << 8);
    } else {
        if (amtWater >= 10) {
            shadowOAM[24].attr0 = (0 << 8) | (0 << 13) | (0 << 14) | ((10) & 0xFF);
            shadowOAM[24].attr1 = (0 << 14) | ((225) & 0x1FF);
            shadowOAM[24].attr2 = (((0) & 0xF) << 12) | (((0) & 3) << 10) | (((1) * (32) + (((amtWater / 10) % 10) + 10)) & 0x3FF);
        } else {
            shadowOAM[24].attr0 = (2 << 8);

        }
            shadowOAM[25].attr0 = (0 << 8) | (0 << 13) | (0 << 14) | ((10) & 0xFF);
            shadowOAM[25].attr1 = (0 << 14) | ((230) & 0x1FF);
            shadowOAM[25].attr2 = (((0) & 0xF) << 12) | (((0) & 3) << 10) | (((1) * (32) + ((amtWater % 10) + 10)) & 0x3FF);

    }
}

void drawNumPotatoes() {

    shadowOAM[12].attr0 = (0 << 8) | (0 << 13) | (0 << 14) | ((5) & 0xFF);
    shadowOAM[12].attr1 = (1 << 14) | ((180) & 0x1FF);
    shadowOAM[12].attr2 = (((2) & 0xF) << 12) | (((0) & 3) << 10) | (((8) * (32) + (10)) & 0x3FF);

    if (numPotatoes >= 10) {
        shadowOAM[13].attr0 = (0 << 8) | (0 << 13) | (0 << 14) | ((10) & 0xFF);
        shadowOAM[13].attr1 = (0 << 14) | ((195) & 0x1FF);
        shadowOAM[13].attr2 = (((0) & 0xF) << 12) | (((0) & 3) << 10) | (((1) * (32) + (((numPotatoes / 10) % 10) + 10)) & 0x3FF);
    } else {
        shadowOAM[13].attr0 = (2 << 8);

    }
        shadowOAM[14].attr0 = (0 << 8) | (0 << 13) | (0 << 14) | ((10) & 0xFF);
        shadowOAM[14].attr1 = (0 << 14) | ((200) & 0x1FF);
        shadowOAM[14].attr2 = (((0) & 0xF) << 12) | (((0) & 3) << 10) | (((1) * (32) + ((numPotatoes % 10) + 10)) & 0x3FF);
}



void updatePotato() {
    for (int i = 0; i < 12; i++) {
        if (potatoArr[i].active && potatoArr[i].watered) {
            potatoArr[i].timeUntilNextStage--;
        }
        if (potatoArr[i].timeUntilNextStage == 0 && (potatoArr[i].currentStage != potatoArr[i].numStage - 1)) {
            potatoArr[i].watered = 0;
            potatoArr[i].timeUntilNextStage = plantCycle;
            potatoArr[i].currentStage++;
        }
    }

}

void drawPotato() {
    for (int i = 0; i < 12; i++) {
        if (potatoArr[i].active) {
            shadowOAM[potatoArr[i].OAMIndex].attr0 = (0 << 8) | (0 << 13) | (0 << 14) | ((potatoArr[i].y - voff) & 0xFF);
            shadowOAM[potatoArr[i].OAMIndex].attr1 = (1 << 14) | ((potatoArr[i].x - hoff) & 0x1FF);
            shadowOAM[potatoArr[i].OAMIndex].attr2 = (((2) & 0xF) << 12) | (((0) & 3) << 10) | (((8) * (32) + (potatoArr[i].currentStage * 2)) & 0x3FF);
        } else {
            shadowOAM[potatoArr[i].OAMIndex].attr0 = (2 << 8);
        }
    }
}


void drawWaterMachine() {
    shadowOAM[22].attr0 = (0 << 8) | (0 << 13) | (0 << 14) | ((300 - voff) & 0xFF);
    shadowOAM[22].attr1 = (3 << 14) | ((100 - hoff) & 0x1FF);
    shadowOAM[22].attr2 = (((4) & 0xF) << 12) | (((0) & 3) << 10) | (((10) * (32) + (4)) & 0x3FF);
}



void drawSpaceship() {
    shadowOAM[spaceship.OAMIndex].attr0 = (0 << 8) | (0 << 13) | (2 << 14) | ((spaceship.y - voff) & 0xFF);
    shadowOAM[spaceship.OAMIndex].attr1 = (3 << 14) | ((spaceship.x - hoff) & 0x1FF);
    shadowOAM[spaceship.OAMIndex].attr2 = (((3) & 0xF) << 12) | (((0) & 3) << 10) | (((2) * (32) + (14)) & 0x3FF);
}


void updateGame() {
    updatePlayer(&player);
    updateLives();
    updatePotato();
    updateNumWater(&player);
    spaceHoff++;
    if (isWatering > 0) {
        isWatering--;
    }
}


void drawGame() {
    drawPlayer(&player);
    drawPotato();
    drawNumPotatoes();
    drawNumWater();
    drawLives();
    drawSpaceship();
    drawWaterMachine();

}

void updatePauseSpaceship() {
    pauseSpaceship.timeUntilNextStage--;
    if (pauseSpaceship.timeUntilNextStage == 0) {
        pauseSpaceship.currentFrame++;
        pauseSpaceship.timeUntilNextStage = 4000;
        if (pauseSpaceship.currentFrame >= pauseSpaceship.totalFrames) {
            pauseSpaceship.currentFrame = 0;
        }
    }
}


void drawPauseSpaceship() {
    shadowOAM[20].attr0 = (0 << 8) | (0 << 13) | (0 << 14) | ((70) & 0xFF);
    shadowOAM[20].attr1 = (1 << 14) | ((10*totalCycles) & 0x1FF);
    if (pauseSpaceship.currentFrame == 1) {
        shadowOAM[20].attr2 = (((1) & 0xF) << 12) |(((1) & 3) << 10) | (((12) * (32) + (1)) & 0x3FF);
    } else if (pauseSpaceship.currentFrame == 3 ){
        shadowOAM[20].attr2 = (((1) & 0xF) << 12) |(((1) & 3) << 10) | (((14) * (32) + (1)) & 0x3FF);
    } else {
        shadowOAM[20].attr2 = (((1) & 0xF) << 12) |(((1) & 3) << 10) | (((10) * (32) + (1)) & 0x3FF);
    }
}


void setupInterrupts() {

 (*(unsigned short*) 0x04000208) = 0;

    (*(unsigned short*) 0x04000200) = (1 << 0) | (1 << ((2 % 4) + 3)) | (1 << ((3 % 4) + 3));
    (*(unsigned short*) 0x04000004) = (1 << 3);
    (*(ihp*) 0x03007FFC) = &interruptHandler;

 (*(unsigned short*) 0x04000208) = 1;

}


void interruptHandler() {

 (*(unsigned short*) 0x04000208) = 0;

 if ((*(volatile unsigned short*) 0x04000202) & (1 << 0)) {


        soundA.vBlankCount++;
        if (soundA.vBlankCount >= soundA.durationInVBlanks) {
            if (soundA.looping) {
                playSoundA(soundA.data, soundA.dataLength, soundA.looping);
            } else {
                soundA.isPlaying = 0;
                (*(volatile unsigned short*) 0x0400010A) = (0 << 7);
                dma[1].cnt = 0;
            }
        }


        if (soundB.isPlaying) {
            soundB.vBlankCount++;
            if (soundB.vBlankCount >= soundB.durationInVBlanks) {
                if (soundB.looping) {
                    playSoundB(soundB.data, soundB.dataLength, soundB.looping);
                } else {
                    soundB.isPlaying = 0;
                    (*(volatile unsigned short*) 0x0400010E) = (0 << 7);
                    dma[2].cnt = 0;
                }
            }
        }

 }
    (*(volatile unsigned short*) 0x04000202) = (*(volatile unsigned short*) 0x04000202);
    (*(unsigned short*) 0x04000208) = 1;

}
