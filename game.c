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
#include "digitalSounds.h"
//audio
#include "minecraftEating.h"
#include "wateringPlant.h"
#include "minecraftDirt.h"

//struct arrays
POTATO potatoArr[POTATOCOUNT];
LIVES livesArr[LIVESCOUNT];
SPACESHIP spaceship;
PAUSESPACESHIP pauseSpaceship;
enum SOILID {SOIL1 = 16, SOIL2 = 17, SOIL3 = 48, SOIL4 = 49};

//variables
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
int plantCycle = CYCLE;
int lowHealthAnimationCount = 10;
int isWatering;

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
//inits the spaceship on the pause screen
void initPauseSpaceship() {
    pauseSpaceship.currentFrame = 0;
    pauseSpaceship.totalFrames = 4;
    pauseSpaceship.timeUntilNextStage = 4000;
}

//initalizes spaceship object
void initSpaceship() {
    spaceship.x = 200;
    spaceship.y = 110;
    spaceship.OAMIndex = 30;
    spaceship.height = 34;
    spaceship.width = 29;
}

//intializes the game
void initGame() {
    initPlayer(&player);
    initPotatoes();
    initSpaceship();
    numPotatoes = 15;
    potatoYield = 2;
    maxLives = 8;
    currLives = 8;
    totalCycles = 0;
    timeUntilNextCycle = CYCLE;
    spaceshipColl = 0;
    amtWater = 8;
    cheat = 0;
}

//toggles on/off the cheat
void toggleCheat() {
    cheat = !cheat;
    mgba_printf("cheat toggled");
    if (cheat) {
        plantCycle = CYCLE / 2;
        amtWater = 30;
        for (int i = 0; i < POTATOCOUNT; i++) {
            potatoArr[i].timeUntilNextStage /= 2;
        }
    } else {
        plantCycle = CYCLE;
    }
}

//tills the field
void tillField(PLAYER* player) {
    //checks if player is standing on a spot overlapping tilemod
    if ((SCREENBLOCK[24].tilemap[OFFSET((player -> x / 8) , (player -> y / 8) + 1, 32)] != (TILEMAP_ENTRY_TILEID(SOIL1) | (TILEMAP_ENTRY_PALROW(1))))
     && (SCREENBLOCK[24].tilemap[OFFSET((player -> x / 8) , (player -> y / 8) + 1, 32)] != (TILEMAP_ENTRY_TILEID(SOIL2) | (TILEMAP_ENTRY_PALROW(1)))) 
     && (SCREENBLOCK[24].tilemap[OFFSET((player -> x / 8) , (player -> y / 8) + 1, 32)] != (TILEMAP_ENTRY_TILEID(SOIL3) | (TILEMAP_ENTRY_PALROW(1))))
     && (SCREENBLOCK[24].tilemap[OFFSET((player -> x / 8) , (player -> y / 8) + 1, 32)] != (TILEMAP_ENTRY_TILEID(SOIL4) | (TILEMAP_ENTRY_PALROW(1))))
     && (SCREENBLOCK[24].tilemap[OFFSET((player -> x / 8) + 1, (player -> y / 8) + 1, 32)] != (TILEMAP_ENTRY_TILEID(SOIL1) | (TILEMAP_ENTRY_PALROW(1)))) 
     && (SCREENBLOCK[24].tilemap[OFFSET((player -> x / 8) + 1, (player -> y / 8) + 1, 32)] != (TILEMAP_ENTRY_TILEID(SOIL3) | (TILEMAP_ENTRY_PALROW(1))))
     && (SCREENBLOCK[24].tilemap[OFFSET((player -> x / 8) + 1, (player -> y / 8) + 1, 32)] != (TILEMAP_ENTRY_TILEID(SOIL4) | (TILEMAP_ENTRY_PALROW(1))))
     && (SCREENBLOCK[24].tilemap[OFFSET((player -> x / 8), (player -> y / 8) + 2, 32)] != (TILEMAP_ENTRY_TILEID(SOIL1) | (TILEMAP_ENTRY_PALROW(1)))) 
     && (SCREENBLOCK[24].tilemap[OFFSET((player -> x / 8), (player -> y / 8) + 2, 32)] != (TILEMAP_ENTRY_TILEID(SOIL2) | (TILEMAP_ENTRY_PALROW(1))))
     && (SCREENBLOCK[24].tilemap[OFFSET((player -> x / 8), (player -> y / 8) + 2, 32)] != (TILEMAP_ENTRY_TILEID(SOIL4) | (TILEMAP_ENTRY_PALROW(1))))
     && (SCREENBLOCK[24].tilemap[OFFSET((player -> x / 8) + 1, (player -> y / 8) + 2, 32)] != (TILEMAP_ENTRY_TILEID(SOIL1) | (TILEMAP_ENTRY_PALROW(1)))) 
     && (SCREENBLOCK[24].tilemap[OFFSET((player -> x / 8) + 1, (player -> y / 8) + 2, 32)] != (TILEMAP_ENTRY_TILEID(SOIL2) | (TILEMAP_ENTRY_PALROW(1))))
     && (SCREENBLOCK[24].tilemap[OFFSET((player -> x / 8) + 1, (player -> y / 8) + 2, 32)] != (TILEMAP_ENTRY_TILEID(SOIL3) | (TILEMAP_ENTRY_PALROW(1))))
     && (player -> y > (32 * 8))) {
        //tilemap mod
        SCREENBLOCK[24].tilemap[OFFSET((player -> x / 8) , (player -> y / 8) + 1, 32)]
        = TILEMAP_ENTRY_TILEID(SOIL1) | TILEMAP_ENTRY_PALROW(1);
        SCREENBLOCK[24].tilemap[OFFSET((player -> x / 8) + 1, (player -> y / 8) + 1, 32)]
        = TILEMAP_ENTRY_TILEID(SOIL2) | TILEMAP_ENTRY_PALROW(1);
        SCREENBLOCK[24].tilemap[OFFSET((player -> x / 8), (player -> y / 8) + 2, 32)]
        = TILEMAP_ENTRY_TILEID(SOIL3) | TILEMAP_ENTRY_PALROW(1); 
        SCREENBLOCK[24].tilemap[OFFSET((player -> x / 8) + 1, (player -> y / 8) + 2, 32)]
        = TILEMAP_ENTRY_TILEID(SOIL4) | TILEMAP_ENTRY_PALROW(1);  
        playSoundB(minecraftDirt_data, minecraftDirt_length , 0);
     }
}

//changes player color when low health
void animateLowHealth() {
    lowHealthAnimationCount--;
    if (lowHealthAnimationCount < 10) {
        //palette mod here
        SPRITE_PALETTE[1] = RGB(0,0,0);
        if (lowHealthAnimationCount == 0) {
            lowHealthAnimationCount = 20;
        }
    }
    else {
        SPRITE_PALETTE[1] = RGB(26,6,4);
    }
}

//plant the potato
void seedPotato(PLAYER* player) {
    int found = 0;
    //plants if is on soil
    mgba_printf("%d", TILEMAP_ENTRY_TILEID(SOIL1));
    if (SCREENBLOCK[24].tilemap[OFFSET(((player -> x) / 8), (player -> y / 8) + 1, 32)] 
    == (TILEMAP_ENTRY_TILEID(SOIL1) | (TILEMAP_ENTRY_PALROW(1)))) {
        for (int i = 0; i < POTATOCOUNT; i++) {
            if ((potatoArr[i].active == 0) && (found == 0)) {
                potatoArr[i].active = 1;
                potatoArr[i].x = player -> x  - player -> x % 8;
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
//waters the potato
void waterPotato(PLAYER* player) {
        for (int i = 0; i < POTATOCOUNT; i++) {
            if (collision(player -> x, player -> y, player -> width, player -> height,
             potatoArr[i].x, potatoArr[i].y, potatoArr[i].width, potatoArr[i].height) 
             && (potatoArr[i].active && amtWater > 0) && (potatoArr[i].watered == 0) 
             && potatoArr[i].currentStage != potatoArr[i].numStage - 1)  {
                potatoArr[i].watered = 1;
                //mgba_printf("plant watered");
                if (!cheat) {
                    amtWater--;
                }
                playSoundB(wateringPlant_data, wateringPlant_length, 0);
                isWatering = 90;
            }
        }
}

//collects a fully grown potato
void pickPotato(PLAYER* player) {
        for (int i = 0; i < POTATOCOUNT; i++) {
            if (collision(player -> x, player -> y, player -> width, player -> height,
             potatoArr[i].x, potatoArr[i].y, potatoArr[i].width, potatoArr[i].height) 
             && potatoArr[i].active && (potatoArr[i].currentStage == potatoArr -> numStage - 1)) {
                numPotatoes += potatoYield;
                potatoArr[i].active = 0;
            }
        }
}

//player eats potato
void eatPotato() {
    if ((numPotatoes > 0) && (currLives < maxLives)) {
        numPotatoes--;
        currLives++;
        playSoundB(minecraftEating_data, minecraftEating_length, 0);

        
    }
}

//updates the amt of lives player has
void updateLives() {
    timeUntilNextCycle--;
    if (timeUntilNextCycle == 0) {
        timeUntilNextCycle = CYCLE;
        currLives--;
        totalCycles++;
    }
    if (currLives < 4) {
        animateLowHealth();
    } else {
        SPRITE_PALETTE[1] = RGB(26,6,4);
    }
}

//draws out the hearts on screen
void drawLives() {
    int index = 15;
    for (int i = 0; i < currLives; i++) { //leave a space of 12
        shadowOAM[index].attr0 = ATTR0_REGULAR | ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(5);
        shadowOAM[index].attr1 = ATTR1_TINY | ATTR1_X(2 + (i * 10));
        shadowOAM[index].attr2 = ATTR2_PALROW(0) | ATTR2_PRIORITY(0) | ATTR2_TILEID(0, 10);
        index++;
    }
    for (int i = currLives; i < maxLives; i++) {
        shadowOAM[index].attr0 = ATTR0_REGULAR | ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(5);
        shadowOAM[index].attr1 = ATTR1_TINY | ATTR1_X(2 + (i * 10));
        shadowOAM[index].attr2 = ATTR2_PALROW(0) | ATTR2_PRIORITY(0) | ATTR2_TILEID(0, 11);
        index++;
    }

}
//updates the amt of water in inventory
void updateNumWater(PLAYER* player) {
    if (collision(player -> x - hoff, player -> y - voff, player -> width, player -> height,
     100 - hoff, 300 - voff, 32, 32) && (BUTTON_PRESSED(BUTTON_A))) {
        if (amtWater + waterAdded < maxWater) {
            amtWater += waterAdded;
        } else if (amtWater + waterAdded >  maxWater && (amtWater < maxWater)) {
            amtWater = maxWater;
        }
    }
}
//draws the amt of water on screen
void drawNumWater() {
    //draw water
    shadowOAM[23].attr0 = ATTR0_REGULAR | ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(5);
    shadowOAM[23].attr1 = ATTR1_SMALL | ATTR1_X(210);
    shadowOAM[23].attr2 = ATTR2_PALROW(0) | ATTR2_PRIORITY(0) | ATTR2_TILEID(12, 8);
    //draw tens place
    if (cheat) {
            shadowOAM[24].attr0 = ATTR0_REGULAR | ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(10);
            shadowOAM[24].attr1 = ATTR1_TINY | ATTR1_X(225);
            shadowOAM[24].attr2 = ATTR2_PALROW(0) | ATTR2_PRIORITY(0) | ATTR2_TILEID(20,1);
            shadowOAM[25].attr0 = ATTR0_HIDE;
    } else {
        if (amtWater >= 10) {
            shadowOAM[24].attr0 = ATTR0_REGULAR | ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(10);
            shadowOAM[24].attr1 = ATTR1_TINY | ATTR1_X(225);
            shadowOAM[24].attr2 = ATTR2_PALROW(0) | ATTR2_PRIORITY(0) | ATTR2_TILEID(((amtWater / 10) % 10) + 10, 1);
        } else {
            shadowOAM[24].attr0 = ATTR0_HIDE;
        //draw ones place
        }
            shadowOAM[25].attr0 = ATTR0_REGULAR | ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(10);
            shadowOAM[25].attr1 = ATTR1_TINY | ATTR1_X(230);
            shadowOAM[25].attr2 = ATTR2_PALROW(0) | ATTR2_PRIORITY(0) | ATTR2_TILEID((amtWater % 10) + 10, 1);
            
    }
}
//draws out the amt of potatoes on screen
void drawNumPotatoes() {
    //draw potato
    shadowOAM[12].attr0 = ATTR0_REGULAR | ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(5);
    shadowOAM[12].attr1 = ATTR1_SMALL | ATTR1_X(180);
    shadowOAM[12].attr2 = ATTR2_PALROW(2) | ATTR2_PRIORITY(0) | ATTR2_TILEID(10, 8);
    //draw tens place
    if (numPotatoes >= 10) {
        shadowOAM[13].attr0 = ATTR0_REGULAR | ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(10);
        shadowOAM[13].attr1 = ATTR1_TINY | ATTR1_X(195);
        shadowOAM[13].attr2 = ATTR2_PALROW(0) | ATTR2_PRIORITY(0) | ATTR2_TILEID(((numPotatoes / 10) % 10) + 10, 1);
    } else {
        shadowOAM[13].attr0 = ATTR0_HIDE;
    //draw ones place
    }
        shadowOAM[14].attr0 = ATTR0_REGULAR | ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(10);
        shadowOAM[14].attr1 = ATTR1_TINY | ATTR1_X(200);
        shadowOAM[14].attr2 = ATTR2_PALROW(0) | ATTR2_PRIORITY(0) | ATTR2_TILEID((numPotatoes % 10) + 10, 1);
}


//updates the potato
void updatePotato() {
    for (int i = 0; i < POTATOCOUNT; i++) {
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
//draws the potato depending on the current stage of growth
void drawPotato() {
    for (int i = 0; i < POTATOCOUNT; i++) {
        if (potatoArr[i].active) {
            shadowOAM[potatoArr[i].OAMIndex].attr0 = ATTR0_REGULAR | ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(potatoArr[i].y - voff);
            shadowOAM[potatoArr[i].OAMIndex].attr1 = ATTR1_SMALL | ATTR1_X(potatoArr[i].x - hoff);
            shadowOAM[potatoArr[i].OAMIndex].attr2 = ATTR2_PALROW(2) | ATTR2_PRIORITY(0) | ATTR2_TILEID(potatoArr[i].currentStage * 2, 8);
        } else {
            shadowOAM[potatoArr[i].OAMIndex].attr0 = ATTR0_HIDE;
        }
    }
}

//draws the water machine
void drawWaterMachine() {
    shadowOAM[22].attr0 = ATTR0_REGULAR | ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(300 - voff);
    shadowOAM[22].attr1 = ATTR1_LARGE | ATTR1_X(100 - hoff);
    shadowOAM[22].attr2 = ATTR2_PALROW(4) | ATTR2_PRIORITY(0) | ATTR2_TILEID(4, 10);
}


//draws the spaceship sprite
void drawSpaceship() {
    shadowOAM[spaceship.OAMIndex].attr0 = ATTR0_REGULAR | ATTR0_4BPP | ATTR0_TALL | ATTR0_Y(spaceship.y - voff);
    shadowOAM[spaceship.OAMIndex].attr1 = ATTR1_LARGE | ATTR1_X(spaceship.x - hoff);
    shadowOAM[spaceship.OAMIndex].attr2 = ATTR2_PALROW(3) | ATTR2_PRIORITY(0) | ATTR2_TILEID(14, 2);
}

//updates the game
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

//draws the game
void drawGame() {
    drawPlayer(&player);
    drawPotato();
    drawNumPotatoes();
    drawNumWater();
    drawLives();
    drawSpaceship();
    drawWaterMachine();

}
//updates the animation frame of the spaceship on pause screen
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

//draws the spaceship on the pause screen
void drawPauseSpaceship() {
    shadowOAM[20].attr0 = ATTR0_REGULAR | ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(70);
    shadowOAM[20].attr1 = ATTR1_SMALL | ATTR1_X(10*totalCycles);
    if (pauseSpaceship.currentFrame == 1) {
        shadowOAM[20].attr2 = ATTR2_PALROW(1) |ATTR2_PRIORITY(1) | ATTR2_TILEID(1, 12);
    } else if (pauseSpaceship.currentFrame == 3 ){
        shadowOAM[20].attr2 = ATTR2_PALROW(1) |ATTR2_PRIORITY(1) | ATTR2_TILEID(1, 14);
    } else {
        shadowOAM[20].attr2 = ATTR2_PALROW(1) |ATTR2_PRIORITY(1) | ATTR2_TILEID(1, 10);
    }
}

//set up interrupts
void setupInterrupts() {

	REG_IME = 0;
    
    REG_IE = IRQ_VBLANK | IRQ_TIMER(2) | IRQ_TIMER(3);
    REG_DISPSTAT = DISPSTAT_VBLANK_IRQ;
    REG_INTERRUPT = &interruptHandler;

	REG_IME = 1;

}

//interrupt handler
void interruptHandler() {

	REG_IME = 0;

	if (REG_IF & IRQ_VBLANK) {

        //Handle soundA
        soundA.vBlankCount++;
        if (soundA.vBlankCount >= soundA.durationInVBlanks) {
            if (soundA.looping) {
                playSoundA(soundA.data, soundA.dataLength, soundA.looping);
            } else {
                soundA.isPlaying = 0;
                REG_TM2CNT = TIMER_OFF;
                dma[1].cnt = 0;
            }
        }

        //Handle soundB
        if (soundB.isPlaying) {
            soundB.vBlankCount++;
            if (soundB.vBlankCount >= soundB.durationInVBlanks) {
                if (soundB.looping) {
                    playSoundB(soundB.data, soundB.dataLength, soundB.looping);
                } else {
                    soundB.isPlaying = 0;
                    REG_TM3CNT = TIMER_OFF;
                    dma[2].cnt = 0;
                }
            }
        }

	}
    REG_IF = REG_IF;
    REG_IME = 1;

}