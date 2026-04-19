c. awk Command 


Description 
awk is a powerful pattern scanning and processing language used to extract and manipulate data 
from files. 


Syntax 
awk 'pattern {action}' filename 


Examples 
awk '{print $1}' file.txt 
Prints the first column of the file. 
awk '{print $1, $3}' file.txt 
Prints first and third columns. 
df -h | awk '{print $1, $5}' 
Displays file system name and disk usage using pipe. 