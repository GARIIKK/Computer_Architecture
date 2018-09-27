#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <string.h>
#define G_SIZE 150
/*char* search( char *fullList , char *presentsList)
{
	int firstCounter;   
	int secondCounter = 0;
	position = 0;  
	int FullListLen = strlen(fullList);
	int PresentsListLen = strlen(presentsList);    
	if(SentenceLen < WordLen ){
        return -2;
}
	for(firstCounter = 0; firstCounter <= FullListLen - PresentsListLen ; firstCounter ++){
		if(FullListLen[firstCounter] == PresentsListLen[secondCounter] && secondCounter < FullListLen){
                	if(FullListLen[firstCounter + 1] == PresentsListLen[secondCounter + 1]){ 
			position = firstCounter;
}       
}
}
    return position ;
}*/
int readFromFile(char **namesArray)
{
	FILE *theFile = fopen("nameList.txt","r");
	if(theFile == NULL){
		printf("Your file is not found!\n");
		return -1;
}
	else
	fseek(theFile,0,SEEK_END);
	int size = ftell(theFile);
	fseek(theFile,0,SEEK_SET);
	fgets(*namesArray,size,theFile);
	fclose(theFile);
	return 0;	
}
int printToFile(FILE *aFile , char **studentList, int len)
{
	if(studentList == NULL){
		return -1;
}
	for(int i = 0;i < len;i++){
		fputs(studentList[i],aFile);
	if( i < len - 1){	
		fprintf(aFile," ");
}
}
	fclose(aFile);
	return 0;
}

int main (int argc, char *argv[])
{
	FILE *aFile = fopen("StudList.txt","w");
	char *nameArray[G_SIZE];
	char *listName[G_SIZE];
	for(int i = 0;i < argc ;i++){
		nameArray[i] = argv[i+1];
}
	for(int i = 0;i < argc - 1;i++){

		printf("%i - %s\n",i,nameArray[i]);
}
	int len = argc - 1;
	printToFile(aFile,nameArray,len);
	readFromFile(listName);
	printf("The List of DK-61:%s\n",*listName);
	
	if(argc != 1){
		printf("List on lesson:");
}
	else{
		printf("ETO POZORISHE!!!\n");
}
	for(int i = 1;i < argc;i++){
		printf(" %s ",argv[i]);
}
	int a = 10 + 1 - argc;
		printf("\n%i students absent\n",a);


	return 0;
}
