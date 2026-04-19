/*AIM: 
  To write and execute C programs to implement memory allocation techniques such as 
First Fit, Best Fit, and Worst Fit and to analyze their behavior. 
 
DESCRIPTION 
Memory allocation methods are used by the operating system to allocate memory blocks 
to processes efficiently. This experiment demonstrates how different allocation strategies select 
memory blocks based on size and availability. 
 
a) FIRST FIT MEMORY ALLOCATION 
 
AIM 
To allocate memory using the First Fit strategy. 
 
ALGORITHM 
1. Read number of memory blocks and their sizes. 
2. Read number of processes and their memory requirements. 
3. Allocate the first block that is large enough. 
4. Display allocation results. 
 
SOURCE CODE*/ 
#include <stdio.h> 
int main() { 
    int nb, np, i, j; 
    int block[10], process[10], alloc[10]; 
    printf("Enter number of blocks: "); 
    scanf("%d", &nb); 
    printf("Enter block sizes:\n"); 
    for (i = 0; i < nb; i++) 
        scanf("%d", &block[i]); 
    printf("Enter number of processes: "); 
    scanf("%d", &np); 
    printf("Enter process sizes:\n"); 
    for (i = 0; i < np; i++) { 
        scanf("%d", &process[i]); 
        alloc[i] = -1; 
    } 
    for (i = 0; i < np; i++) { 
        for (j = 0; j < nb; j++) { 
            if (block[j] >= process[i]) { 
                alloc[i] = j; 
                block[j] -= process[i]; 
                break; 
            } 
        } 
    } 
    printf("\nProcess\tSize\tBlock\n"); 
    for (i = 0; i < np; i++) { 
        printf("P%d\t%d\t", i+1, process[i]); 
        if (alloc[i] != -1) 
            printf("B%d\n", alloc[i]+1); 
        else 
            printf("Not Allocated\n"); 
    } 
    return 0; 
} 
 
 
/*SAMPLE INPUT 
Enter number of blocks: 5 
Enter block sizes: 
100 500 200 300 600 
Enter number of processes: 4 
Enter process sizes: 
212 417 112 426 
SAMPLE OUTPUT 
Process Size Block 
P1      212  B2 
P2      417  B5 
P3      112  B2 
P4      426  Not Allocated 
 

RESULT 
Thus, memory was allocated using the First Fit method.*/