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

void initPlayer(PLAYER* player) {
    player -> x = 50;
    player -> y = 100;
    player -> vel = 1;
    player -> height = 16;
    player -> width = 16;
    player -> direction = 'u';
    player -> isMoving = 0;
    player -> timeUntilNextFrame = 10;
    player -> currentFrame = 0;
    player -> numFrames = 4;
    mgba_printf("WE did it patrick we initialized the player!");
}
void drawPlayer(PLAYER* player) {
    shadowOAM[0].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(player -> y);
    shadowOAM[0].attr1 = ATTR1_SMALL | ATTR1_X(player -> x);
    // mgba_printf("Player X: %d", player->x);
    if (player -> isMoving == 0) {
        if (player -> direction == 'u') {
            shadowOAM[0].attr2 = ATTR2_TILEID(0,6);
        } else if (player -> direction == 'l') {
            shadowOAM[0].attr2 = ATTR2_TILEID(0,4);
        }  else if (player -> direction == 'r') {
            shadowOAM[0].attr2 = ATTR2_TILEID(0,2);
        }  else {
            shadowOAM[0].attr2 = ATTR2_TILEID(0,0);
        }

    } else if (player -> direction == 'l') {
        shadowOAM[0].attr2 = ATTR2_TILEID(player -> currentFrame * 2 ,4);
    } else if (player -> direction == 'r') {
        shadowOAM[0].attr2 = ATTR2_TILEID(player -> currentFrame * 2 ,2);
    } else if (player -> direction == 'u') {
        shadowOAM[0].attr2 = ATTR2_TILEID(player -> currentFrame * 2, 6);
    } else {
        shadowOAM[0].attr2 = ATTR2_TILEID(player -> currentFrame * 2, 0);
    }
}
void updatePlayer(PLAYER* player) {
    //resets ismoving
    player -> isMoving = 0;
    
    
    if(BUTTON_HELD(BUTTON_LEFT)) {
        player -> isMoving = 1;
        if ((player -> x - player -> vel) > LEFTBORDER) {
            player -> x -= player -> vel;
            player -> direction = 'l';
        }
    }
    if (BUTTON_HELD(BUTTON_RIGHT)) {
        player -> isMoving = 1;
        if ((player -> x + player -> vel) < RIGHTBORDER) {
            player -> x += player -> vel;
            player -> direction = 'r';
            mgba_printf("headed right");
        }
    }
    if (BUTTON_HELD(BUTTON_UP)) {
        player -> isMoving = 1;
        if ((player -> y + player -> vel) > TOPBORDER) {
            player -> y -= player -> vel;
            player -> direction = 'u';
        }
    }
    if (BUTTON_HELD(BUTTON_DOWN)) {
        player -> isMoving = 1;
        if ((player -> y - player -> vel) < BOTTOMBORDER) {
            player -> y += player -> vel;
            player -> direction = 'd';
        }
    }
    if (BUTTON_PRESSED(BUTTON_RSHOULDER)) {
        seedPotato(player);
    }
    if (BUTTON_PRESSED(BUTTON_A)) {
        waterPotato(player);
        pickPotato(player);
    }
    //animation
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
}