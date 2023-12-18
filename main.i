# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
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
# 2 "main.c" 2
# 1 "mode0.h" 1
# 32 "mode0.h"
typedef struct {
 u16 tileimg[8192];
} CB;



typedef struct {
 u16 tilemap[1024];
} SB;
# 3 "main.c" 2
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
# 4 "main.c" 2
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
# 5 "main.c" 2
# 1 "spritesheet.h" 1
# 21 "spritesheet.h"
extern const unsigned short spritesheetTiles[16384];


extern const unsigned short spritesheetPal[256];
# 6 "main.c" 2
# 1 "spaceBg.h" 1
# 22 "spaceBg.h"
extern const unsigned short spaceBgTiles[3648];


extern const unsigned short spaceBgMap[1024];


extern const unsigned short spaceBgPal[256];
# 7 "main.c" 2
# 1 "tileset.h" 1
# 21 "tileset.h"
extern const unsigned short tilesetTiles[16384];


extern const unsigned short tilesetPal[256];
# 8 "main.c" 2
# 1 "gameMap.h" 1







extern const unsigned short gameMapMap[2048];
# 9 "main.c" 2
# 1 "winScreen.h" 1
# 22 "winScreen.h"
extern const unsigned short winScreenTiles[4368];


extern const unsigned short winScreenMap[1024];


extern const unsigned short winScreenPal[256];
# 10 "main.c" 2
# 1 "loseScreen.h" 1
# 22 "loseScreen.h"
extern const unsigned short loseScreenTiles[4656];


extern const unsigned short loseScreenMap[1024];


extern const unsigned short loseScreenPal[256];
# 11 "main.c" 2
# 1 "pauseScreen.h" 1
# 22 "pauseScreen.h"
extern const unsigned short pauseScreenTiles[5024];


extern const unsigned short pauseScreenMap[1024];


extern const unsigned short pauseScreenPal[256];
# 12 "main.c" 2
# 1 "startScreen.h" 1
# 22 "startScreen.h"
extern const unsigned short startScreenTiles[4528];


extern const unsigned short startScreenMap[1024];


extern const unsigned short startScreenPal[256];
# 13 "main.c" 2
# 1 "instructionsScreen.h" 1
# 22 "instructionsScreen.h"
extern const unsigned short instructionsScreenTiles[6304];


extern const unsigned short instructionsScreenMap[1024];


extern const unsigned short instructionsScreenPal[256];
# 14 "main.c" 2
# 1 "game.h" 1



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
# 5 "game.h" 2




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
# 15 "main.c" 2
# 1 "storyScreen.h" 1
# 22 "storyScreen.h"
extern const unsigned short storyScreenTiles[8384];


extern const unsigned short storyScreenMap[1024];


extern const unsigned short storyScreenPal[256];
# 16 "main.c" 2
# 1 "spaceshipBg.h" 1
# 22 "spaceshipBg.h"
extern const unsigned short spaceshipBgTiles[2096];


extern const unsigned short spaceshipBgMap[1024];


extern const unsigned short spaceshipBgPal[256];
# 17 "main.c" 2
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
# 18 "main.c" 2
# 1 "spaceBgLong.h" 1
# 22 "spaceBgLong.h"
extern const unsigned short spaceBgLongTiles[3616];


extern const unsigned short spaceBgLongMap[2048];


extern const unsigned short spaceBgLongPal[256];
# 19 "main.c" 2


# 1 "startScreenMusic.h" 1


extern const unsigned int startScreenMusic_sampleRate;
extern const unsigned int startScreenMusic_length;
extern const signed char startScreenMusic_data[];
# 22 "main.c" 2
# 1 "gameScreenMusic.h" 1


extern const unsigned int gameScreenMusic_sampleRate;
extern const unsigned int gameScreenMusic_length;
extern const signed char gameScreenMusic_data[];
# 23 "main.c" 2
# 1 "pauseScreenMusic.h" 1


extern const unsigned int pauseScreenMusic_sampleRate;
extern const unsigned int pauseScreenMusic_length;
extern const signed char pauseScreenMusic_data[];
# 24 "main.c" 2





u16 oldButtons;
u16 buttons;
OBJ_ATTR shadowOAM[128];
int notTheFirstTime = 0;


void goToStart();
void start();
void goToInstructions();
void instructions();
void goToGame();
void game();
void goToPause();
void pause();
void goToWin();
void win();
void goToLose();
void lose();
void story();
void goToStory();
void initialize();


enum STATE {START, STORY, INSTRUCTIONS, GAME, PAUSE, WIN, LOSE};
int state;

int main() {

    initialize();
    while(1) {
        oldButtons = buttons;
        buttons = (*(volatile unsigned short*) 0x04000130);

        switch (state) {
            case START:
                start();
                break;
            case STORY:
                story();
                break;
            case INSTRUCTIONS:
                instructions();
                break;
            case GAME:
                game();
                break;
            case PAUSE:
                pause();
                break;
            case WIN:
                win();
                break;
            case LOSE:
                lose();
                break;
        }
    }
    return 0;
}

void initialize() {
    mgba_open();

    (*(volatile unsigned short*) 0x04000000) = ((0) & 7) | (1 << (8 + (0 % 4))) | (1 << 12);
    (*(volatile unsigned short*) 0x04000008) = (0 << 14) | ((0) << 2) | ((12) << 8) | (0 << 7) | 1;
    (*(volatile unsigned short*) 0x0400000A) = (2 << 14) | ((2) << 2) | ((24) << 8) | (0 << 7) | 0;

    setupInterrupts();
    setupSounds();

    DMANow(3, spritesheetTiles, &((CB*) 0x06000000)[4], 32768 / 2);
    DMANow(3, spritesheetPal, ((u16*) 0x5000200), 512 / 2);

    DMANow(3, spaceBgPal, ((unsigned short*) 0x05000000), 512 / 2);
    DMANow(3, tilesetTiles, &((CB*) 0x06000000)[2], 32768 / 2);
    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*) 0x7000000), 512);
    goToStart();
}

void goToStart() {
    DMANow(3, startScreenTiles, &((CB*) 0x06000000)[0], 9056 / 2);
    DMANow(3, startScreenMap, &((SB*) 0x06000000)[12], 2048 / 2);
    DMANow(3, startScreenPal, ((unsigned short*) 0x05000000), 512 / 2);
    (*(volatile unsigned short*) 0x04000010) = 0;
    (*(volatile unsigned short*) 0x04000012) = 0;
    (*(volatile unsigned short*) 0x04000014) = 0;
    (*(volatile unsigned short*) 0x04000016) = 0;
    initGame();
    state = START;
    playSoundA(startScreenMusic_data, startScreenMusic_length, 1);
}

void start() {
    if ((!(~(oldButtons) & ((1 << 3))) && (~(buttons) & ((1 << 3))))) {
        goToStory();
    }
}

void goToStory() {
    DMANow(3, storyScreenTiles, &((CB*) 0x06000000)[0], 16768 / 2);
    DMANow(3, storyScreenMap, &((SB*) 0x06000000)[12], 2048 / 2);
    DMANow(3, storyScreenPal, ((unsigned short*) 0x05000000), 512 / 2);
    (*(volatile unsigned short*) 0x04000010) = 0;
    (*(volatile unsigned short*) 0x04000012) = 0;
    (*(volatile unsigned short*) 0x04000014) = 0;
    (*(volatile unsigned short*) 0x04000016) = 0;
    state = STORY;
}

void story() {
    if ((!(~(oldButtons) & ((1 << 3))) && (~(buttons) & ((1 << 3))))) {
        goToInstructions();
    }
}

void goToInstructions() {
    DMANow(3, instructionsScreenTiles, &((CB*) 0x06000000)[0], 12608 / 2);
    DMANow(3, instructionsScreenMap, &((SB*) 0x06000000)[12], 2048 / 2);
    DMANow(3, instructionsScreenPal, ((unsigned short*) 0x05000000), 512 / 2);
    hideSprites();
    (*(volatile unsigned short*) 0x04000010) = 0;
    (*(volatile unsigned short*) 0x04000012) = 0;
    (*(volatile unsigned short*) 0x04000014) = 0;
    (*(volatile unsigned short*) 0x04000016) = 0;
    DMANow(3, shadowOAM, ((OBJ_ATTR*) 0x7000000), 512);
    state = INSTRUCTIONS;
}

void instructions() {
    if ((!(~(oldButtons) & ((1 << 3))) && (~(buttons) & ((1 << 3))))) {
        goToGame();
    }

}

void goToGame() {
    (*(volatile unsigned short*) 0x04000000) = ((0) & 7) | (1 << (8 + (0 % 4))) | ((1 << (8 + (1 % 4)))) | (1 << 12);
    DMANow(3, spaceBgLongTiles, &((CB*) 0x06000000)[0], 7232 / 2);
    DMANow(3, spaceBgLongMap, &((SB*) 0x06000000)[12], 4096 / 2);
    DMANow(3, tilesetPal, ((unsigned short*) 0x05000000), 512 / 2);
    if (notTheFirstTime == 0) {
        DMANow(3, gameMapMap, &((SB*) 0x06000000)[24], (4096) / 2);
        DMANow(3, tilesetTiles, &((CB*) 0x06000000)[2], 32768 / 2);
        DMANow(3, shadowOAM, ((OBJ_ATTR*) 0x7000000), 128*4);
        (*(volatile unsigned short*) 0x0400000A) = (2 << 14) | ((2) << 2) | ((24) << 8) | 0 | (0 << 7);
        for (int i = 0; i < (4096) / 2; i++) {
            ((SB*) 0x06000000)[24].tilemap[i] |= gameMapMap[i];
            ((SB*) 0x06000000)[24].tilemap[i] |= ((1 & 15) << 12);
        }
    }
    DMANow(3, spaceBgLongPal, ((unsigned short*) 0x05000000), 512 / 2);
    (*(volatile unsigned short*) 0x04000008) = (1 << 14) | ((0) << 2) | ((12) << 8) | (0 << 7) | 1;

    playSoundA(gameScreenMusic_data, gameScreenMusic_length, 1);





    state = GAME;
}


void game() {
    updateGame();
    drawGame();
    waitForVBlank();
    (*(volatile unsigned short*) 0x04000010) = (spaceHoff / 8) % 512;
    (*(volatile unsigned short*) 0x04000014) = hoff;
    (*(volatile unsigned short*) 0x04000016) = voff;
    DMANow(3, shadowOAM, ((OBJ_ATTR*) 0x7000000), 128*4);
    if (currLives == 0) {
        goToLose();
    }
    if (totalCycles == 20) {
        goToWin();
    }

    if ((!(~(oldButtons) & ((1 << 3))) && (~(buttons) & ((1 << 3))))) {
        goToPause();
    }

}
# 230 "main.c"
void goToPause() {
    (*(volatile unsigned short*) 0x04000000) = ((0) & 7) | (1 << (8 + (0 % 4))) | (1 << 12);
    (*(volatile unsigned short*) 0x04000008) = (0 << 14) | ((0) << 2) | ((12) << 8) | 1 | (0 << 7);
    (*(volatile unsigned short*) 0x04000010) = 0;
    (*(volatile unsigned short*) 0x04000012) = 0;
    (*(volatile unsigned short*) 0x04000014) = 0;
    (*(volatile unsigned short*) 0x04000016) = 0;
    DMANow(3, pauseScreenTiles, &((CB*) 0x06000000)[0], 10048 / 2);
    DMANow(3, pauseScreenMap, &((SB*) 0x06000000)[12], 2048 / 2);
    DMANow(3, pauseScreenPal, ((unsigned short*) 0x05000000), 512 / 2);
    hideSprites();

    shadowOAM[20].attr0 = (0 << 8) | (0 << 13) | (0 << 14) | ((70) & 0xFF);
    shadowOAM[20].attr1 = (1 << 14) | ((10*totalCycles) & 0x1FF);
    shadowOAM[20].attr2 = (((1) & 0xF) << 12) |(((1) & 3) << 10) | (((10) * (32) + (1)) & 0x3FF);
    DMANow(3, shadowOAM, ((OBJ_ATTR*) 0x7000000), 512);
    state = PAUSE;
    playSoundA(pauseScreenMusic_data, pauseScreenMusic_length, 1);
    notTheFirstTime = 1;
    initPauseSpaceship();
}

void pause() {
    updatePauseSpaceship();
    drawPauseSpaceship();
    DMANow(3, shadowOAM, ((OBJ_ATTR*) 0x7000000), 512);
    if ((!(~(oldButtons) & ((1 << 3))) && (~(buttons) & ((1 << 3))))) {
        goToGame();
    }
}

void goToWin() {
    (*(volatile unsigned short*) 0x04000000) = ((0) & 7) | (1 << (8 + (0 % 4))) | (1 << 12);
    DMANow(3, winScreenTiles, &((CB*) 0x06000000)[0], 8736 / 2);
    DMANow(3, winScreenMap, &((SB*) 0x06000000)[12], 2048 / 2);
    DMANow(3, winScreenPal, ((unsigned short*) 0x05000000), 512 / 2);
    hideSprites();
    (*(volatile unsigned short*) 0x04000010) = 0;
    (*(volatile unsigned short*) 0x04000014) = 0;
    (*(volatile unsigned short*) 0x04000016) = 0;
    DMANow(3, shadowOAM, ((OBJ_ATTR*) 0x7000000), 512);
    state = WIN;
    playSoundA(pauseScreenMusic_data, pauseScreenMusic_length, 1);
    notTheFirstTime = 0;
}

void win() {
    if ((!(~(oldButtons) & ((1 << 3))) && (~(buttons) & ((1 << 3))))) {
        goToStart();
    }
}

void goToLose() {
    (*(volatile unsigned short*) 0x04000000) = ((0) & 7) | (1 << (8 + (0 % 4))) | (1 << 12);
    DMANow(3, loseScreenTiles, &((CB*) 0x06000000)[0], 9312 / 2);
    DMANow(3, loseScreenMap, &((SB*) 0x06000000)[12], 2048 / 2);
    DMANow(3, loseScreenPal, ((unsigned short*) 0x05000000), 512 / 2);
    hideSprites();
    (*(volatile unsigned short*) 0x04000010) = 0;
    (*(volatile unsigned short*) 0x04000014) = 0;
    (*(volatile unsigned short*) 0x04000016) = 0;
    DMANow(3, shadowOAM, ((OBJ_ATTR*) 0x7000000), 512);
    state = LOSE;
    playSoundA(pauseScreenMusic_data, pauseScreenMusic_length, 1);
    notTheFirstTime = 0;
}


void lose() {
    if ((!(~(oldButtons) & ((1 << 3))) && (~(buttons) & ((1 << 3))))) {
        goToStart();
    }
}

void initialize();
