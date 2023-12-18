#ifndef PLAYER_H
#define PLAYER_H

#define LEFTBORDER 0
#define RIGHTBORDER 256
#define TOPBORDER 256
#define BOTTOMBORDER 512
#define MAPHEIGHT 64*8
#define MAPWIDTH 32*8

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