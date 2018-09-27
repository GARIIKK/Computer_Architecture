#include <stdio.h>
#include "sort.h"
void sort(int *array , int N)
{
	int frst_cnt;
	int scnd_cnt;
	int the_tmp;
	for(frst_cnt = 0;frst_cnt < N - 1;frst_cnt++)
	{
	int min_index = frst_cnt;
	for(scnd_cnt = frst_cnt + 1;scnd_cnt < N;scnd_cnt ++)
	{
		if(array[scnd_cnt] < array[min_index]){
		min_index = scnd_cnt;
	}
}	
	the_tmp = array[frst_cnt];
	array[frst_cnt] = array[min_index];
	array[min_index] = the_tmp;
}		
}
