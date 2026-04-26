1. #include <stdio.h> 
2.  
3. /** 
4.  * Function to solve Tower of Hanoi problem 
5.  * @param diskNumber: Number of disks to move 
6.  * @param source: Starting rod 
7.  * @param destination: Target rod 
8.  * @param auxiliary: Intermediate rod 
9.  */ 
10. void towerOfHanoi(int diskNumber, char source, char destination, char auxiliary) 
11. {
    12.     /* Base Condition: Only one disk to move */ 
13.     if (diskNumber == 1) { 
14.         printf("Move disk 1 from %c to %c\n", source, destination); 
15.         return; 
16.     } 
17.  
18.     /* Step 1: Move n-1 disks from source to auxiliary */ 
19.     towerOfHanoi(diskNumber - 1, source, auxiliary, destination); 
20.  
21.     /* Step 2: Move the nth disk from source to destination */ 
22.     printf("Move disk %d from %c to %c\n", diskNumber, source, destination); 
23.  
24.     /* Step 3: Move n-1 disks from auxiliary to destination */ 
25.     towerOfHanoi(diskNumber - 1, auxiliary, destination, source); 
26. } 
27.  
28. int main() { 
29.     int n; 
30.  
31.     printf("Enter number of disks: "); 
32.     if (scanf("%d", &n) != 1 || n <= 0) { 
33.         printf("Please enter a valid positive integer.\n"); 
34.         return 1; 
35.     } 
36.  
37.     printf("\nRequired moves:\n"); 
38.     towerOfHanoi(n, 'S', 'D', 'A'); 
39.  
40.     return 0; 
41. } 