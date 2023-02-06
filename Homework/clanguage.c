/*
 Pledge: I pledge my honor that I have abided by the Stevens Honor System.
 Name: Haig Emirzian
 Algo: Bubble sort
 Bonus: No
*/

#include <stdio.h>

void strcpy(char* src, char* dst) {
/* Your code here */
    int i = 0;

copy:
    //dereference to include each index into dst
    *dst = *src;
    //increment to copy other indices
    src++;
    dst++;
    i++;
    //if i is less than the size, loop back
    if(i < 100){
        goto copy;
    }
    
}

int dot_prod(char* vec_a, char* vec_b, int length, int size_elem) {
/* Your code here
Do not cast the vectors directly, such as
int* va = (int*)vec_a;
*/
    int dotProduct = 0;
    int i = 0;

loop:
    if(i < length * size_elem){
        //dot product formula
        dotProduct = dotProduct + *((int*)(vec_a + i)) * *((int*)(vec_b + i));
        //i needs to be incremented in respect to the element's size raither than i++
        i += size_elem;
        goto loop;
    } else{
        return dotProduct;
    }
}

//swap method for bubble method
void swap(int *xp, int *yp){
    int temp = *xp;
    *xp = *yp;
    *yp = temp;
}

//bubble sort algo
void bubbleSort(int arr[], int n){
    int i, j;
    for (i = 0; i < n-1; i++)
        for (j = 0; j < n-i-1; j++)
            if (arr[j] > arr[j+1])
                swap(&arr[j], &arr[j+1]);
}
    
void sort_nib(int* arr, int length) {
/* Your code here */
    int nibbles[length * 8];
    int mask = 15;
    int sorted[length];

    //deconstructs to bitshift and mask
    for (int i = 0; i < length; i++){
        for(int j = 0; j < 8; j++){
            nibbles[(i*8) + j] = (*(arr + i) >> (j * 4)) & mask;
        }
    }

    //sorting algo
    bubbleSort(nibbles, length * 8);

    //rebuilds deconstructed elements
    for (int i = 0; i < length; i++){
        for(int j = 0; j < 8; j++){
            *(arr) = (*(arr) << 4) + nibbles[(i * 8) + j];
        }
        arr++;
    }
}

int main() {

    char str1[] = "382 is the best!";
    char str2[100] = {0};

    strcpy(str1, str2);
    puts(str1);
    puts(str2);

    int vec_a[3] = {12,34,10};
    int vec_b[3] = {10,20,30};
    int dot = dot_prod((char*)vec_a, (char*)vec_b, 3, sizeof(int));

    printf("%d\n", dot);    


    int arr[3] = {0x12BFDA09, 0x9089CDBA, 0x56788910};

    sort_nib(arr, 3);
    for (int i = 0; i < 3; i ++) {
        printf("0x%08x ", arr[i]);
    }

    puts("");

    return 0;
}
