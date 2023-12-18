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
    shadowOAM[0].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(player -> y - voff);
    shadowOAM[0].attr1 = ATTR1_SMALL | ATTR1_X(player -> x - hoff);
    // mgba_printf("Player X: %d", player->x);

    if (player -> isMoving == 0) {
        if (player -> direction == 'u') {
            shadowOAM[0].attr2 = ATTR2_TILEID(0,6);
            if (isWatering) {
                shadowOAM[0].attr2 = ATTR2_TILEID(8,6);
            }
        } else if (player -> direction == 'l') {
            shadowOAM[0].attr2 = ATTR2_TILEID(0,4);
            if (isWatering) {
                shadowOAM[0].attr2 = ATTR2_TILEID(8,4);
            }
        }  else if (player -> direction == 'r') {
            shadowOAM[0].attr2 = ATTR2_TILEID(0,2);
            if (isWatering) {
                shadowOAM[0].attr2 = ATTR2_TILEID(8,2);
            }
        }  else {
            shadowOAM[0].attr2 = ATTR2_TILEID(0,0);
            if (isWatering) {
                shadowOAM[0].attr2 = ATTR2_TILEID(10,2);
            }
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
            //mgba_printf("hoff: %d", hoff);
            player -> direction = 'l';
        }
    }
    if (BUTTON_HELD(BUTTON_RIGHT)) {
        player -> isMoving = 1;
        if ((player -> x + player -> vel) < (RIGHTBORDER - player->width)) {
            player -> x += player -> vel;
            //mgba_printf("hoff: %d", hoff);
            player -> direction = 'r';
            //mgba_printf("headed right");
        }
    }
    if (BUTTON_HELD(BUTTON_UP)) {
        player -> isMoving = 1;
        if ((player -> y + player -> vel) > TOPBORDER) {
            player -> y -= player -> vel;

            //mgba_printf("voff: %d", voff);
            player -> direction = 'u';
        }
    }
    if (BUTTON_HELD(BUTTON_DOWN)) {
        player -> isMoving = 1;
        if ((player -> y - player -> vel) < (BOTTOMBORDER - player -> height)) {
            player -> y += player -> vel;
           // mgba_printf("voff: %d", voff);
            player -> direction = 'd';
        }
    }
    if (BUTTON_PRESSED(BUTTON_RSHOULDER)) {
        seedPotato(player);
    }
    if (BUTTON_PRESSED(BUTTON_LSHOULDER)) {
        tillField(player);
    }
    if (BUTTON_PRESSED(BUTTON_A)) {
        waterPotato(player);
        pickPotato(player);
    }
    if (BUTTON_PRESSED(BUTTON_B)) {
        eatPotato();
    }

    if (BUTTON_PRESSED(BUTTON_RSHOULDER) && BUTTON_PRESSED(BUTTON_LSHOULDER)) {
        toggleCheat(player);
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

    // Complex movement
    // Center on the player
    hoff = player -> x - (SCREENWIDTH - player -> width) / 2;
    voff = player -> y - (SCREENHEIGHT - player -> height) / 2;
    
    // Don't go out of bounds
    if ((voff + SCREENHEIGHT) > MAPHEIGHT /*- (TOPBORDER - 80)*/) {
        //mgba_printf("I am setting vertical");
        voff = MAPHEIGHT - SCREENHEIGHT;
    } else if (voff < TOPBORDER - (SCREENHEIGHT / 2)){
        voff = TOPBORDER - (SCREENHEIGHT / 2);
    }
    if ((hoff + SCREENWIDTH) > MAPWIDTH) {
        hoff = MAPWIDTH - SCREENWIDTH;
    } else if (hoff < 0){
        hoff = 0;
    }
}