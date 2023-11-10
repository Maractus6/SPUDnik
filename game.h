#ifndef GAME_H
#define GAME_H

#include "player.h"
#define POTATOCOUNT 12

extern int lives;
extern int PotatoFrames;


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

void drawPotato();
void updatePotato();
void waterPotato(PLAYER* player);
void seedPotato(PLAYER* player);
void pickPotato(PLAYER* player);
void initGame();
void updateGame();
void drawGame();


#endif
