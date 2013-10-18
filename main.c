/*********************************************************************
 *
 * Copyright (C) 2003,  Blekinge Institute of Technology
 *
 * Filename:      main.c
 * Author:        Simon Kagstrom <ska@bth.se>
 * Description:   main function for nibbles game.
 *
 * $Id: main.c 1369 2005-01-20 20:57:54Z ska $
 *
 ********************************************************************/
#include <stdio.h>  /* printf */
#include <stdlib.h> /* atoi */

extern void start_game(int len, int n_apples);

int main(int argc, char *argv[])
{
  int len, apples;

  if (argc < 3)
    {
      printf("Usage: %s LEN APPLES\n", argv[0]);
      return 1;
    }

  len = atoi(argv[1]);
  apples = atoi(argv[2]);

  start_game(len, apples);
  return 0;
}
/*
void start_game(int len, int n_apples)
{

	int y;
	int x;
	int board[SIZE][SIZE];
	for(x = 0; x < SIZE*SIZE; x++)
		*(&board[0][0]+x) = 0;

	for(x=0; x < n_apples; x++)
		board[rand()%(SIZE-2)+1][rand()%(SIZE-2)+1] = APPLE;

	board[10][3] = len;
	int dir = -1;

	while(1==1)
	{
		usleep(100000);
		int key = nib_poll_kbd();
		if(key == 258)
			dir = -SIZE;
		if(key == 259)
			dir = SIZE;
		if(key == 260)
			dir = 1;
		if(key == 261)
			dir = -1;
		for(y = 1; y < SIZE-1; y++)
			for(x = 1; x < SIZE-1; x++)
			{
				int* boardElm = &board[y][x];
				(*boardElm)--;
				if(*(boardElm+dir)==len-(dir<1) && *boardElm < 1)
				{
					if(boardElm<APPLE)
					{
						len++;
						board[rand()%(SIZE-2)+1][rand()%(SIZE-2)+1] = APPLE;
					}
					board[y][x] = len;
				}
				nib_put_scr(x, y, '-');
				if(board[y][x]>0)
					nib_put_scr(x, y, '#');
				if(board[y][x]<APPLE)
					nib_put_scr(x, y, '0');
			}
	}
}
*/
