#AIM: 
#To write a shell program to find the factorial of a given number. 
 
#ALGORITHM: 
#1. Read a number from the user. 
#2. Initialize factorial value to 1. 
#3. Use a loop to multiply numbers from 1 to the given number. 
#4. Display the factorial. 
 
#PROGRAM: 
#!/bin/bash 
echo "Enter a number:" 
read n 
fact=1 
for (( i=1; i<=n; i++ )) 
do 
  fact=$((fact * i)) 
done 
echo "Factorial of $n is $fact"  
 
#EXECUTION PROCEDURE: 
#1. Create a file factorial.sh. 
#2. Enter and save the program. 
#3. Provide execute permission. 
#4. Run the program. 
 
#SAMPLE OUTPUT: 
#Enter a number: 
#5 
#Factorial of 5 is 120 
 
  
#RESULT: 
#Thus, the shell program to find the factorial of a number was executed successfully. 