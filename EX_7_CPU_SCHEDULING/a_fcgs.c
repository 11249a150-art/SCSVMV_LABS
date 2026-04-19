/*AIM 
To implement and analyze different CPU scheduling algorithms such as FIFO (FCFS), Round 
Robin, and Shortest Job First (SJF) using C programming. 
 
a) FIFO (FCFS) Scheduling Algorithm 
Aim 
To implement the First Come First Serve (FCFS) CPU scheduling algorithm. 
Algorithm 
1. Read number of processes. 
2. Read burst time for each process. 
3. Calculate waiting time for each process. 
4. Calculate turnaround time. 
5. Display waiting time and turnaround time. 
Source Code*/ 
#include <stdio.h> 
int main() { 
    int n, i; 
    int bt[10], wt[10], tat[10]; 
    printf("Enter number of processes: "); 
    scanf("%d", &n); 
    printf("Enter burst times:\n"); 
    for (i = 0; i < n; i++) 
        scanf("%d", &bt[i]); 
    wt[0] = 0; 
    for (i = 1; i < n; i++) 
        wt[i] = wt[i-1] + bt[i-1]; 
    for (i = 0; i < n; i++) 
        tat[i] = wt[i] + bt[i]; 
    printf("\nProcess\tBT\tWT\tTAT\n"); 
    for (i = 0; i < n; i++) 
        printf("P%d\t%d\t%d\t%d\n", i+1, bt[i], wt[i], tat[i]);  
    return 0; 
} 
 
 
 
/*Sample Input 
Enter number of processes: 3 
Enter burst times: 
5 3 8 
Sample Output 
Process BT WT TAT 
P1      5  0  5 
P2      3  5  8 
P3      8  8  16 
 
 
Result 
Thus, FCFS scheduling algorithm was implemented successfully. */