/*AIM: 
To write and execute a C program to avoid deadlock using Banker’s Algorithm and to 
determine whether the system is in a safe state. 
 
DESCRIPTION 
Banker’s Algorithm is a deadlock avoidance algorithm that checks for safe resource 
allocation. It ensures that the system allocates resources only if the allocation leads to a safe state, 
thereby preventing deadlock. 
 
ALGORITHM 
1. Read number of processes and number of resources. 
2. Read allocation matrix. 
3. Read maximum requirement matrix. 
4. Read available resources. 
5. Calculate the need matrix. 
6. Find a safe sequence of execution. 
7. Display whether the system is in a safe state. 
 
SOURCE CODE*/ 
#include <stdio.h> 
int main() { 
    int n, m, i, j, k; 
    int alloc[10][10], max[10][10], need[10][10]; 
    int avail[10], finish[10] = {0}, safeSeq[10]; 
    printf("Enter number of processes: "); 
    scanf("%d", &n); 
 
    printf("Enter number of resources: "); 
    scanf("%d", &m); 
    printf("Enter allocation matrix:\n"); 
    for (i = 0; i < n; i++)  
        for (j = 0; j < m; j++) 
            scanf("%d", &alloc[i][j]); 
    printf("Enter maximum matrix:\n"); 
    for (i = 0; i < n; i++) 
        for (j = 0; j < m; j++) 
            scanf("%d", &max[i][j]); 
    printf("Enter available resources:\n"); 
    for (i = 0; i < m; i++) 
        scanf("%d", &avail[i]); 
    for (i = 0; i < n; i++) 
        for (j = 0; j < m; j++) 
            need[i][j] = max[i][j] - alloc[i][j]; 
    for (k = 0; k < n; k++) { 
        for (i = 0; i < n; i++) { 
            if (!finish[i]) { 
                int flag = 1; 
                for (j = 0; j < m; j++) { 
                    if (need[i][j] > avail[j]) { 
                        flag = 0; 
                        break; 
                    } 
                } 
                if (flag) { 
                    for (j = 0; j < m; j++) 
                        avail[j] += alloc[i][j]; 
                    safeSeq[k] = i; 
                    finish[i] = 1; 
                } 
            } 
        } 
    } 
    int safe = 1; 
    for (i = 0; i < n; i++) { 
        if (!finish[i]) { 
            safe = 0;
            break; 
        } 
    } 
    if (safe) { 
        printf("\nSystem is in SAFE state.\nSafe sequence: "); 
        for (i = 0; i < n; i++) 
            printf("P%d ", safeSeq[i]); 
    } else { 
        printf("\nSystem is in DEADLOCK state.\n"); 
    } 
    return 0; 
} 
 
 
/*EXECUTION PROCEDURE 
1. Open terminal. 
2. Create a file using vi banker.c. 
3. Compile the program using gcc banker.c. 
4. Execute the program using ./a.out. 
5. Enter the required input values. 
 
SAMPLE INPUT 
Enter number of processes: 5 
Enter number of resources: 3 
 
Allocation Matrix: 
0 1 0 
2 0 0 
3 0 2 
2 1 1 
0 0 2 
Maximum Matrix: 
7 5 3 
3 2 2 
9 0 2  
2 2 2 
4 3 3 
 
Available Resources: 
3 3 2 
 
SAMPLE OUTPUT 
System is in SAFE state. 
Safe sequence: P1 P3 P4 P0 P2 
 
 
RESULT 
Thus, deadlock was successfully avoided using Banker’s Algorithm and the system was found to 
be in a safe state.*/