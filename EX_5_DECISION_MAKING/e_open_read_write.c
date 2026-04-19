/*e) Program using open(), read(), and write() 
 
Aim 
To perform file operations using low-level system calls. 
 
Algorithm 
1. Open a file using open(). 
2. Read contents using read(). 
3. Write contents to output using write(). 
 
Source Code */
#include <stdio.h> 
#include <fcntl.h> 
#include <unistd.h> 
int main() { 
    int fd; 
    char buffer[100]; 
    fd = open("test.txt", O_RDONLY); 
    read(fd, buffer, 100); 
    write(1, buffer, 100); 
    close(fd); 
    return 0; 
} 
 
 
 
 
/*Sample Output 
(File contents of test.txt displayed) 
 
 
 
Result 
Thus, file operations were successfully performed using open(), read(), and write() system calls.*/