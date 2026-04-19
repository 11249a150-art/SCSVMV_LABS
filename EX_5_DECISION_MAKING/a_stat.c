//AIM: 
//To write and execute C programs using various UNIX/Linux system calls to understand 
//file handling, process management, and directory operations. 
 
//a) Program using stat() System Call 
//Aim 
//To obtain file information using the stat() system call. 
 
//Algorithm 
//1. Read file name from the user. 
//2. Use stat() to retrieve file details. 
//3. Display file size, inode number, and permissions. 
 
//Source Code 
#include <stdio.h> 
#include <sys/stat.h> 
int main() { 
    struct stat st; 
    char fname[50]; 
    printf("Enter file name: "); 
    scanf("%s", fname); 
    stat(fname, &st); 
    printf("File size: %ld bytes\n", st.st_size); 
    printf("Inode number: %ld\n", st.st_ino); 
    printf("Permissions: %o\n", st.st_mode); 
    return 0; 
} 
 
 
 
//Sample Output 
//Enter file name: test.txt 
//File size: 120 bytes 
//Inode number: 256874 
//Permissions: 100644 
 
 
 
//Result 
//Thus, file information was successfully obtained using stat() system call.