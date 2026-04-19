#AIM: 
#To write a shell program to display the Fibonacci series up to a given number of terms. 
 
#ALGORITHM: 
#1. Read the number of terms. 
#2. Initialize first two values as 0 and 1. 
#3. Display the first two terms. 
#4. Use a loop to generate remaining terms. 
#5. Display the Fibonacci series. 
 
#PROGRAM  
#!/bin/bash 
echo "Enter number of terms:" 
read n 
a=0 
b=1 
echo "Fibonacci Series:" 
echo $a 
echo $b 
for (( i=2; i<n; i++ )) 
do 
  c=$((a + b)) 
  echo $c 
  a=$b 
  b=$c 
done


#EXECUTION PROCEDURE: 
#1. Create a file fibonacci.sh. 
#2. Type the program and save it. 
#3. Provide execute permission. 
#4. Execute the program
 
#SAMPLE OUTPUT: 
 
#Enter number of terms: 
#5 
#Fibonacci Series: 
#0 
#1 
#1 
#2 
#3 
 
 
 
#RESULT: 
#Thus, the shell program to generate the Fibonacci series was executed successfully.