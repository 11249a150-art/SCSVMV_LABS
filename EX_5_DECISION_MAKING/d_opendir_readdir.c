d) Program using opendir() and readdir() 
 
Aim 
To list files in a directory using directory system calls. 
 
Algorithm 
1. Open directory using opendir(). 
2. Read entries using readdir(). 
3. Display file names. 
 
Source Code 
#include <stdio.h> 
#include <dirent.h> 
int main() { 
    DIR *dir; 
    struct dirent *entry; 
    dir = opendir("."); 
    while ((entry = readdir(dir)) != NULL) { 
        printf("%s\n", entry->d_name); 
    } 
    closedir(dir); 
    return 0; 
} 
 
 
Result 
Thus, directory contents were listed using opendir() and readdir().