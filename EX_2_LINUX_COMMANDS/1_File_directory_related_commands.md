AIM: 
To understand and practice basic Linux commands used for file and directory management, 
process and system status monitoring, text file operations, and file permission handling in a Linux 
operating system environment. 
 
DESCRIPTION: 
Linux provides a powerful command-line interface that allows users to interact with the 
operating system efficiently. In this experiment, commonly used Linux commands are practiced 
and categorized into file and directory related commands, process and status information 
commands, text-related commands, and file permission commands. These commands help users 
manage files, monitor system performance, manipulate text files, and control access permissions.


a. File and Directory Related Commands 
These commands are used to navigate the file system and manage files and directories. 
1. pwd (Print Working Directory) 
Displays the current working directory. 
pwd 
2. ls (List) 
Lists files and directories. 
ls 
ls -l 
ls -a 
3. cd (Change Directory) 
Changes the current directory. 
cd Documents 
4. mkdir (Make Directory)  
Creates a new directory. 
mkdir oslab 
5. mkdir -p 
Creates parent and subdirectories. 
mkdir -p cse/os/lab 
6. rmdir 
Deletes an empty directory. 
rmdir oslab 
7. touch 
Creates an empty file. 
touch file.txt 
8. cp (Copy) 
Copies files or directories. 
cp file1.txt file2.txt 
cp -r dir1 dir2 
9. mv (Move / Rename) 
Moves or renames files. 
mv old.txt new.txt 
10. rm (Remove) 
Deletes files or directories. 
rm file.txt 
rm -r folder 
11. file 
Identifies file type. 
file file.txt 
12. stat 
Displays detailed file information. 
 
stat file.txt