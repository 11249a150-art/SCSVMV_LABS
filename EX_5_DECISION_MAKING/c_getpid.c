/*c) Program using getpid() System Call 
 
Aim 
To display the process ID using getpid(). 
 
Source Code */
#include <stdio.h> 
#include <unistd.h> 
int main() { 
    printf("Process ID: %d\n", getpid()); 
    return 0; 
} 
 
 
 
 
/*Sample Output 
Process ID: 3456 
 
Result 
Thus, the process ID was displayed using getpid().*/