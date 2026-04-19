d. sed Command 


Description 
sed (Stream Editor) is used to perform text transformations such as substitution, deletion, and 
insertion. 


Syntax 
sed 'command' filename


Examples 
sed 's/Linux/UNIX/' file.txt 
Replaces the first occurrence of Linux with UNIX in each line. 
sed 's/Linux/UNIX/g' file.txt 
Replaces all occurrences of Linux with UNIX. 
sed '2d' file.txt 
Deletes the second line of the file. 
ls | sed 's/.txt/.doc/' 
Replaces .txt with .doc in output using pipe.