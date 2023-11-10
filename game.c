#include "gba.h"
#include "mode0.h"
#include "sprites.h"
#include "print.h"
#include "spritesheet.h"
#include "spaceBg.h"
#include "tileset.h"
#include "gameMap.h"
#include "player.h"
#include "game.h"

//struct arrays
POTATO potatoArr[POTATOCOUNT];
int numPotatoesInHand = 10;

int potatoYield = 2;

//initalizes the potatos
void initPotatoes() {
    int index = 1; //used OAMindex (1 - 11)
    for (int i = 0; i < POTATOCOUNT; i++) {
        potatoArr[i].OAMIndex = index;
        potatoArr[i].height = 16;
        potatoArr[i].width = 16;
        potatoArr[i].active = 0;
        potatoArr[i].numStage = 5;
        index++;
    }

}
//intializes the game
void initGame() {
    initPlayer(&player);
    initPotatoes();
}

//plant the potato
void seedPotato(PLAYER* player) {
    int found = 0;
    for (int i = 0; i < POTATOCOUNT; i++) {
        if ((potatoArr[i].active == 0) && (found == 0)) {
            potatoArr[i].active = 1;
            potatoArr[i].x = player -> x + 10;
            potatoArr[i].y = player -> y;
            potatoArr[i].watered = 0;
            potatoArr[i].timeUntilNextStage = 120;
            potatoArr[i].currentStage = 0;
            found = 1;
            numPotatoesInHand--;
            break;
        }
    }
}
//waters the potato
void waterPotato(PLAYER* player) {
        for (int i = 0; i < POTATOCOUNT; i++) {
            if (collision(player -> x, player -> y, player -> width, player -> height,
             potatoArr[i].x, potatoArr[i].y, potatoArr[i].width, potatoArr[i].height) 
             && potatoArr[i].active) {
                potatoArr[i].watered = 1;
                mgba_printf("plant watered");
            }
        }

}

//collects a fully grown potato
void pickPotato(PLAYER* player) {
        for (int i = 0; i < POTATOCOUNT; i++) {
            if (collision(player -> x, player -> y, player -> width, player -> height,
             potatoArr[i].x, potatoArr[i].y, potatoArr[i].width, potatoArr[i].height) 
             && potatoArr[i].active && (potatoArr[i].currentStage == potatoArr -> numStage - 1)) {
                numPotatoesInHand += potatoYield;
                potatoArr[i].active = 0;
            }
        }
    }
}
//updates the game
void updateGame() {
    updatePlayer(&player);
    waterPotato(&player);
    updatePotato();
}

void updateNumPotatoes() {
    
}

void drawNumPotatoes() {
    // shadowOAM[potatoArr[i].OAMIndex].attr0 = ATTR0_REGULAR | ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(10);
    // shadowOAM[potatoArr[i].OAMIndex].attr1 = ATTR1_SMALL | ATTR1_X(150);
    // shadowOAM[potatoArr[i].OAMIndex].attr2 = ATTR2_PRIORITY(1) | ATTR2_TILEID(10, 8);
}

//draws the game
void drawGame() {
    drawPlayer(&player);
    drawPotato();
}

//updates the potato
void updatePotato() {
    for (int i = 0; i < POTATOCOUNT; i++) {
        if (potatoArr[i].active && potatoArr[i].watered) {
            potatoArr[i].timeUntilNextStage--;
        }
        if (potatoArr[i].timeUntilNextStage == 0 && (potatoArr[i].currentStage != potatoArr[i].numStage - 1)) {
            potatoArr[i].watered = 0;
            potatoArr[i].timeUntilNextStage = 120;
            potatoArr[i].currentStage++;
        }

    }

}
//draws the potato depending on the current stage of growth
void drawPotato() {
    for (int i = 0; i < POTATOCOUNT; i++) {
        if (potatoArr[i].active) {
            shadowOAM[potatoArr[i].OAMIndex].attr0 = ATTR0_REGULAR | ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(potatoArr[i].y);
            shadowOAM[potatoArr[i].OAMIndex].attr1 = ATTR1_SMALL | ATTR1_X(potatoArr[i].x);
            shadowOAM[potatoArr[i].OAMIndex].attr2 = ATTR2_PRIORITY(1) | ATTR2_TILEID(potatoArr[i].currentStage * 2, 8);
        } else {
            shadowOAM[potatoArr[i].OAMIndex].attr0 = ATTR0_HIDE;
        }
    }
}