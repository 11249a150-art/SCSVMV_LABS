/*AIM: 
To implement process management in Linux using the system calls fork() and exec() and 
to understand process creation and program execution. 
 
a) Program using fork() System Call 
Aim 
To create a child process using the fork() system call and observe parent and child 
execution. 
Algorithm 
1. Create a new process using fork(). 
2. Check the return value of fork(). 
3. If return value is 0, it is the child process. 
4. If return value is positive, it is the parent process. 
5. Display process IDs. 
 
Source Code*/ 
#include <stdio.h> 
#include <unistd.h> 
int main() { 
    pid_t pid; 
    pid = fork(); 
    if (pid == 0) { 
        printf("Child Process\n"); 
        printf("Child PID: %d\n", getpid()); 
    } else { 
        printf("Parent Process\n"); 
        printf("Parent PID: %d\n", getpid()); 
    } 
    return 0; 
} 
 
 
/*Execution Procedure 
1. Open terminal. 
2. Create file using vi fork.c. 
3. Compile using gcc fork.c. 
4. Execute using. /a.out. 
 
Sample Output 
Parent Process 
Parent PID: 3450 
Child Process 
Child PID: 3451 
 
  
Result 
Thus, a child process was successfully created using the fork() system call. */