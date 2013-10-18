#define APPLE -999999
#define REALSIZE 18
#define SIZE 20

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

	int i = 0;
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
					if(*boardElm<APPLE)
					{
						len++;
						board[rand()%(SIZE-2)+1][rand()%(SIZE-2)+1] = APPLE;
					}
					*boardElm = len;
				}
				nib_put_scr(x, y, '-');
				if(*boardElm>0)
				{
					nib_put_scr(x, y, '#');
					i==1;
				}
				if(*boardElm<APPLE)
					nib_put_scr(x, y, '0');
			}
		if(i!=1)
			break;
	}
}
