/*b) Program using wait() System Call 

Aim 
To demonstrate parent–child synchronization using wait(). 
 
Algorithm 
1. Create a child process using fork(). 
2. Parent waits until child completes execution. 
3. Display process termination message. */
 
//Source Code 
#include <stdio.h> 
#include <sys/types.h> 
#include <sys/wait.h> 
#include <unistd.h> 
int main() { 
    pid_t pid = fork(); 
    if (pid == 0) { 
        printf("Child process executing\n"); 
    } else { 
        wait(NULL); 
        printf("Parent process resumes after child\n"); 
    } 
    return 0; 
} 
 
 
/*Result 
Thus, the parent process waited successfully for the child using wait().*/