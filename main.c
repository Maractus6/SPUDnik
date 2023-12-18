#include "gba.h"
#include "mode0.h"
#include "sprites.h"
#include "print.h"
#include "spritesheet.h"
#include "spaceBg.h"
#include "tileset.h"
#include "gameMap.h"
#include "winScreen.h"
#include "loseScreen.h"
#include "pauseScreen.h"
#include "startScreen.h"
#include "instructionsScreen.h"
#include "game.h"
#include "storyScreen.h"
#include "spaceshipBg.h"
#include "digitalSounds.h"
#include "spaceBgLong.h"

//audio
#include "startScreenMusic.h"
#include "gameScreenMusic.h"
#include "pauseScreenMusic.h"




//variables
u16 oldButtons;
u16 buttons;
OBJ_ATTR shadowOAM[128];
int notTheFirstTime = 0;

// state prototypes
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

//state function stuff
enum STATE {START, STORY, INSTRUCTIONS, GAME, PAUSE, WIN, LOSE};
int state;

int main() {

    initialize();
    while(1) {
        oldButtons = buttons;
        buttons = REG_BUTTONS;
        //state machine
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
//init program function
void initialize() {
    mgba_open();
    //enable stuff
    REG_DISPCTL = MODE(0) | BG_ENABLE(0) | SPRITE_ENABLE;
    REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(12) | BG_4BPP | 1;
    REG_BG1CNT = BG_SIZE_TALL | BG_CHARBLOCK(2) | BG_SCREENBLOCK(24) | BG_4BPP | 0;
    //audio
    setupInterrupts();
    setupSounds();
    //sprites
    DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen / 2);
    DMANow(3, spritesheetPal, SPRITE_PALETTE, spritesheetPalLen / 2);
    //background
    DMANow(3, spaceBgPal, BG_PALETTE, spaceBgPalLen / 2);
    DMANow(3, tilesetTiles, &CHARBLOCK[2], tilesetTilesLen / 2);
    hideSprites();
    DMANow(3, shadowOAM, OAM, 512);
    goToStart();
}
//changes state to start
void goToStart() {
    DMANow(3, startScreenTiles, &CHARBLOCK[0], startScreenTilesLen / 2);
    DMANow(3, startScreenMap, &SCREENBLOCK[12], startScreenMapLen / 2);
    DMANow(3, startScreenPal, BG_PALETTE, startScreenPalLen / 2);
    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;
    REG_BG1HOFF = 0;
    REG_BG1VOFF = 0;
    initGame();
    state = START;
    playSoundA(startScreenMusic_data, startScreenMusic_length, 1);
}
//start loop
void start() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStory();
    }
}

void goToStory() {
    DMANow(3, storyScreenTiles, &CHARBLOCK[0], storyScreenTilesLen / 2);
    DMANow(3, storyScreenMap, &SCREENBLOCK[12], storyScreenMapLen / 2);
    DMANow(3, storyScreenPal, BG_PALETTE, storyScreenPalLen / 2);
    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;
    REG_BG1HOFF = 0;
    REG_BG1VOFF = 0;
    state = STORY;
}

void story() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToInstructions();
    }
}
//changes state to instruction
void goToInstructions() {
    DMANow(3, instructionsScreenTiles, &CHARBLOCK[0], instructionsScreenTilesLen / 2);
    DMANow(3, instructionsScreenMap, &SCREENBLOCK[12], instructionsScreenMapLen / 2);
    DMANow(3, instructionsScreenPal, BG_PALETTE, instructionsScreenPalLen / 2);
    hideSprites();
    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;
    REG_BG1HOFF = 0;
    REG_BG1VOFF = 0;
    DMANow(3, shadowOAM, OAM, 512);
    state = INSTRUCTIONS;
}
//intruction loop
void instructions() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToGame();
    }

}
//change state to game
void goToGame() {
    REG_DISPCTL = MODE(0) | BG_ENABLE(0) | BG1_ENABLE | SPRITE_ENABLE;
    DMANow(3, spaceBgLongTiles, &CHARBLOCK[0], spaceBgLongTilesLen / 2);
    DMANow(3, spaceBgLongMap, &SCREENBLOCK[12], spaceBgLongMapLen / 2);
    DMANow(3, tilesetPal, BG_PALETTE, tilesetPalLen / 2);
    if (notTheFirstTime == 0) {
        DMANow(3, gameMapMap, &SCREENBLOCK[24], gameMapMapLen / 2);
        DMANow(3, tilesetTiles, &CHARBLOCK[2], tilesetTilesLen / 2);
        DMANow(3, shadowOAM, OAM, 128*4);
        REG_BG1CNT = BG_SIZE_TALL | BG_CHARBLOCK(2) | BG_SCREENBLOCK(24) | 0 | BG_4BPP;
        for (int i = 0; i < gameMapMapLen / 2; i++) {
            SCREENBLOCK[24].tilemap[i] |= gameMapMap[i];
            SCREENBLOCK[24].tilemap[i] |= TILEMAP_ENTRY_PALROW(1);
        } 
    }
    DMANow(3, spaceBgLongPal, BG_PALETTE, spaceBgPalLen / 2);
    REG_BG0CNT = BG_SIZE_WIDE | BG_CHARBLOCK(0) | BG_SCREENBLOCK(12) | BG_4BPP | 1;
    
    playSoundA(gameScreenMusic_data, gameScreenMusic_length, 1);

    

    //fix bg palatte to get game map to use palrow 2

    state = GAME;
}

//game loop
void game() {
    updateGame();
    drawGame();
    waitForVBlank();
    REG_BG0HOFF = (spaceHoff / 8) % 512;
    REG_BG1HOFF = hoff;
    REG_BG1VOFF = voff;
    DMANow(3, shadowOAM, OAM, 128*4);
    if (currLives == 0) {
        goToLose();
    }
    if (totalCycles == 20) {
        goToWin();
    }

    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
    }
    
}

// void goToSpaceship() {
//     MODE(0) | BG_ENABLE(0) | SPRITE_ENABLE;
//     DMANow(3, spaceshipBgTiles, &CHARBLOCK[0], spaceshipBgTilesLen / 2);
//     DMANow(3, spaceshipBgMap, &SCREENBLOCK[12], spaceshipBgMapLen / 2);
//     DMANow(3, spaceshipBgPal, BG_PALETTE, spaceshipBgPalLen / 2);
//     REG_BG0HOFF = 0;
//     REG_BG0VOFF = 0;
//     REG_BG1HOFF = 0;
//     REG_BG1VOFF = 0;
// }

// void spaceship() {

// }

//function to go to Pause
void goToPause() {
    REG_DISPCTL = MODE(0) | BG_ENABLE(0) | SPRITE_ENABLE;
    REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(12) | 1 | BG_4BPP;
    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;
    REG_BG1HOFF = 0;
    REG_BG1VOFF = 0;
    DMANow(3, pauseScreenTiles, &CHARBLOCK[0], pauseScreenTilesLen / 2);
    DMANow(3, pauseScreenMap, &SCREENBLOCK[12], pauseScreenMapLen / 2);
    DMANow(3, pauseScreenPal, BG_PALETTE, pauseScreenPalLen / 2);
    hideSprites();

    shadowOAM[20].attr0 = ATTR0_REGULAR | ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(70);
    shadowOAM[20].attr1 = ATTR1_SMALL | ATTR1_X(10*totalCycles);
    shadowOAM[20].attr2 = ATTR2_PALROW(1) |ATTR2_PRIORITY(1) | ATTR2_TILEID(1, 10);
    DMANow(3, shadowOAM, OAM, 512);
    state = PAUSE;
    playSoundA(pauseScreenMusic_data, pauseScreenMusic_length, 1);
    notTheFirstTime = 1;
    initPauseSpaceship();
}
//pause loop
void pause() {
    updatePauseSpaceship();
    drawPauseSpaceship();
    DMANow(3, shadowOAM, OAM, 512);
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToGame();
    }
}
// function to go to win
void goToWin() {
    REG_DISPCTL = MODE(0) | BG_ENABLE(0) | SPRITE_ENABLE;
    DMANow(3, winScreenTiles, &CHARBLOCK[0], winScreenTilesLen / 2);
    DMANow(3, winScreenMap, &SCREENBLOCK[12], winScreenMapLen / 2);
    DMANow(3, winScreenPal, BG_PALETTE, winScreenPalLen / 2);
    hideSprites();
    REG_BG0HOFF = 0;
    REG_BG1HOFF = 0;
    REG_BG1VOFF = 0;
    DMANow(3, shadowOAM, OAM, 512);
    state = WIN;
    playSoundA(pauseScreenMusic_data, pauseScreenMusic_length, 1);
    notTheFirstTime = 0;
}
// win loop
void win() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}
//going to lose function
void goToLose() {
    REG_DISPCTL = MODE(0) | BG_ENABLE(0) | SPRITE_ENABLE;
    DMANow(3, loseScreenTiles, &CHARBLOCK[0], loseScreenTilesLen / 2);
    DMANow(3, loseScreenMap, &SCREENBLOCK[12], loseScreenMapLen / 2);
    DMANow(3, loseScreenPal, BG_PALETTE, loseScreenPalLen / 2);
    hideSprites();
    REG_BG0HOFF = 0;
    REG_BG1HOFF = 0;
    REG_BG1VOFF = 0;
    DMANow(3, shadowOAM, OAM, 512);
    state = LOSE;
    playSoundA(pauseScreenMusic_data, pauseScreenMusic_length, 1);
    notTheFirstTime = 0;
}

//lose function
void lose() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}

void initialize();

