#ifndef GAME_H
#define GAME_H

#include "player.h"
#define POTATOCOUNT 12
#define CYCLE 300
#define LIVESCOUNT 12

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
}   POTATO;

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
}   SPACESHIP;

typedef struct {
    int x;
    int y;
    int currentFrame;
    int totalFrames;
    int timeUntilNextStage;
}   PAUSESPACESHIP;


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

#endif
