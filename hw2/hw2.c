#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include "sort.h"
int printToFile(FILE *aFile , float sort_time)
{
	if(aFile == NULL){
		return -1;
}
	fprintf(aFile,"%.8f\n",sort_time);
	return 0;
}


int main (int argc,char *argv[])
{	
	char *file_name;
	if(argc == 1){
	exit(1);
}
	file_name = malloc(strlen(argv[1])*sizeof(*file_name));
	strcpy(file_name,argv[1]);
	FILE *aFile = fopen(file_name,"w");
	struct timespec start, end;
	float final_time;
	int G_SIZE = 0;
	for(int i = 0;i < 31;i++)
	{
		int array[G_SIZE];
	for(int j = 0;j < G_SIZE;j++)
	{
		array[j] = rand() % 1000 + 1;
	}
		clock_gettime (CLOCK_REALTIME, &start);
		sort(array,G_SIZE);
		clock_gettime (CLOCK_REALTIME, &end);
		final_time = (end.tv_sec - start.tv_sec)+ 0.000000001*(end.tv_nsec - start.tv_nsec);
		printToFile(aFile,final_time);	
		printf("Time of sorting in seconds for %i size = %.8f\n",G_SIZE,final_time);
		G_SIZE += 4000;
}
	free(file_name);
	fclose(aFile);

	
	return 0;
}