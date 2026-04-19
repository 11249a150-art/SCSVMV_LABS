b. grep Command 


Description 
grep is used to search for a specific pattern or word in a file. 
Syntax 
grep [options] pattern filename 
Common Options 
• -i : Case insensitive search 
• -r : Recursive search 
• -n : Display line numbers 
  
 
Examples 
grep "Linux" file.txt 
Searches for the word Linux in file.txt. 
grep -i "os" file.txt 
Searches for os ignoring case. 
ps -ef | grep root 
Displays processes owned by the root user using pipe.