/*c) WORST FIT MEMORY ALLOCATION 
 
AIM 
To allocate memory using the Worst Fit strategy. 
 
ALGORITHM 
1. Choose the largest available block. 
2. Allocate memory. 
3. Display results. 
 
SOURCE CODE */ 
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
        int worst = -1; 
        for (j = 0; j < nb; j++) { 
            if (block[j] >= process[i]) { 
                if (worst == -1 || block[j] > block[worst]) 
                    worst = j; 
            } 
        } 
        if (worst != -1) { 
            alloc[i] = worst; 
            block[worst] -= process[i]; 
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
P1      212  B5 
P2      417  B2 
P3      112  B5 
P4      426  Not Allocated 
 
 
RESULT 
Thus, memory was allocated using the Worst Fit method.*/