#AIM: 
#To write a shell program to find the biggest of two given numbers. 
 
#ALGORITHM:  
#1. Read two numbers from the user. 
#2. Compare the two numbers. 
#3. Display the larger number. 
 
#PROGRAM: 
#!/bin/bash 
echo "Enter first number:" 
read a 
echo "Enter second number:" 
read b 
if [ $a -gt $b ] 
then 
  echo "Biggest number is $a" 
else 
  echo "Biggest number is $b" 
fi 
 
#EXECUTION PROCEDURE: 
#1. Create a file big2.sh. 
#2. Enter the program and save it. 
#3. Give execution permission using chmod +x big2.sh. 
#4. Run the program using ./big2.sh. 
 
 
#SAMPLE OUTPUT 
#Enter first number: 
#10 
#Enter second number: 
#25 
#Biggest number is 25 
 
 
#RESULT: 
#Thus, the shell program to find the biggest of two numbers was executed successfully. 