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



//variables
u16 oldButtons;
u16 buttons;
OBJ_ATTR shadowOAM[128];

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
void initialize();

//state function stuff
enum STATE {START, INSTRUCTIONS, GAME, PAUSE, WIN, LOSE};
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
                pause();
                break;
        }
    }
    return 0;
}
//init program function
void initialize() {
    mgba_open();
    //enable stuff
    REG_DISPCTL = MODE(0) | BG_ENABLE(0) | BG_ENABLE(1) | SPRITE_ENABLE;
    REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(8);
    REG_BG1CNT = BG_SIZE_SMALL | BG_CHARBLOCK(2) | BG_SCREENBLOCK(23);
    //sprites
    DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen / 2);
    DMANow(3, spritesheetPal, SPRITE_PALETTE, spritesheetPalLen / 2);
    //background
    DMANow(3, spaceBgPal, BG_PALETTE, spaceBgPalLen / 2);
    DMANow(3, tilesetTiles, &CHARBLOCK[2], tilesetTilesLen / 2);
    hideSprites();
    DMANow(3, shadowOAM, OAM, 512);
    initGame();
    goToStart();
}
//changes state to start
void goToStart() {
    DMANow(3, startScreenTiles, &CHARBLOCK[0], startScreenTilesLen / 2);
    DMANow(3, startScreenMap, &SCREENBLOCK[8], startScreenMapLen / 2);
    state = START;
}
//start loop
void start() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToInstructions();
        mgba_printf("button pressed");
    }
}
//changes state to instruction
void goToInstructions() {
    DMANow(3, instructionsScreenTiles, &CHARBLOCK[0], instructionsScreenTilesLen / 2);
    DMANow(3, instructionsScreenMap, &SCREENBLOCK[8], instructionsScreenMapLen / 2);
    hideSprites();
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
    DMANow(3, spaceBgTiles, &CHARBLOCK[0], spaceBgTilesLen / 2);
    DMANow(3, spaceBgMap, &SCREENBLOCK[8], spaceBgMapLen / 2);
    DMANow(3, gameMapMap, &SCREENBLOCK[23], gameMapMapLen / 2);
    //fix bg palatte to get game map to use palrow 2

    state = GAME;
}

//game loop
void game() {
    updateGame();
    drawGame();
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128*4);

    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
    }
    // if (lives == 0) {
    //     goToLose();
    // }
    // if (timeLeft == 0) {
    //     goToWin();
    // }
}

//function to go to Pause
void goToPause() {
    DMANow(3, pauseScreenTiles, &CHARBLOCK[0], pauseScreenTilesLen / 2);
    DMANow(3, pauseScreenMap, &SCREENBLOCK[8], pauseScreenMapLen / 2);
    hideSprites();
    DMANow(3, shadowOAM, OAM, 512);
    state = PAUSE;
}
//pause loop
void pause() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToGame();
    }
}
// function to go to win
void goToWin() {
    DMANow(3, winScreenTiles, &CHARBLOCK[0], winScreenTilesLen / 2);
    DMANow(3, winScreenMap, &SCREENBLOCK[8], winScreenMapLen / 2);
    hideSprites();
    DMANow(3, shadowOAM, OAM, 512);
}
// win loop
void win() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}
//going to lose function
void goToLose() {
    DMANow(3, loseScreenTiles, &CHARBLOCK[0], loseScreenTilesLen / 2);
    DMANow(3, loseScreenMap, &SCREENBLOCK[8], loseScreenMapLen / 2);
    hideSprites();
    DMANow(3, shadowOAM, OAM, 512);
}

//lose function
void lose() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}

void initialize();

