#ifndef PLAYER_H
#define PLAYER_H

#define LEFTBORDER 0
#define RIGHTBORDER 240
#define TOPBORDER 0
#define BOTTOMBORDER 160

// structs
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

//variables
PLAYER player;
OBJ_ATTR shadowOAM[128];
int lives;

//functions
void initPlayer(PLAYER* player);
void drawPlayer(PLAYER* player);
void updatePlayer(PLAYER* player);

#endif