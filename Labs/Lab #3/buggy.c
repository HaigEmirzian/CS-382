#include "buggy.h"
//Pledge: I pledge my honor that I have abided by the Stevens Honor System.
//Name: Haig Emirzian
void init(int* arr, int size, int* counter) {
	for (int i = 0; i < size; i ++) {
		arr[i] = 0;
	}
	(*counter) = 0;
}

void add(int* arr, int i, int* count) {
	//deference needed
	//arr[++count] = i;
	arr[*count] = i;
	//dereference count
	(*count)++;
	
}

// Places i at index count, incrementing cound once it is placed



void print_array(int* arr, int count) {
	for (int i = 0; i < count; i ++)
		printf("%d ", arr[i]);
	printf("\n");
}

int contains(int* arr, int count, int target) {

	int i;
	for (i = 0; i < count; i++) //no semi-colon required and change to i++ to increase once i occurs
	{
		if (arr[i] == target)
			return 1;
		// else       //prematurely exits program
		// 	return 0;
	}
	return 0;
}
