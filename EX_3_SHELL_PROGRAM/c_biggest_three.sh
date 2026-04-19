#AIM:  
#To write a shell program to find the biggest of three given numbers.  
 
#ALGORITHM: 
#1. Read three numbers from the user. #
#2. Compare the numbers using condition#al statements. 
#3. Display the largest number.# 
 
#PROGRAM: 
#!/bin/bash 
echo "Enter three numbers:" 
read a 
read b 
read c 
if [ $a -gt $b ] && [ $a -gt $c ] 
then 
  echo "Biggest number is $a" 
elif [ $b -gt $c ] 
then 
  echo "Biggest number is $b" 
else 
  echo "Biggest number is $c" 
fi 

 
#EXECUTION PROCEDURE: 
#1. Create a file big3.sh. 
#2. Type the program and save it. 
#3. Provide execute permission. 
#4. Execute using ./big3.sh 
 
#SAMPLE OUTPUT: 
#Enter three numbers: 
#12 
#45 
#30 
#Biggest number is 45 
 
  
 
#RESULT: 
#Thus, the shell program to find the biggest of three numbers was executed successfully.