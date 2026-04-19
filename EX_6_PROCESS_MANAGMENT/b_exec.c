/*b) Program using exec() System Call 

Aim 
To replace the current process image with a new process using the exec() system call. 
 
Algorithm 
1. Create a child process using fork(). 
2. Use exec() in the child process to execute a new program. 
3. Parent process waits for the child. 
Source Code*/ 
#include <stdio.h> 
#include <unistd.h> 
#include <sys/wait.h> 
int main() { 
    pid_t pid; 
    pid = fork(); 
    if (pid == 0) { 
        execl("/bin/ls", "ls", NULL); 
        printf("Exec failed\n"); 
    } else { 
        wait(NULL); 
        printf("Parent process completed\n"); 
    } 
    return 0; 
} 
 
 
/*Execution Procedure 
1. Create file using vi exec.c. 
2. Compile using gcc exec.c. 
3. Execute using ./a.out. 
 

Sample Output 
file1.txt 
file2.txt 
exec.c 
Parent process completed 
 
 
Result 
Thus, a new program was successfully executed using the exec() system call. */
