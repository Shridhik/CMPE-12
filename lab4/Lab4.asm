# Program File: Lab4.asm
# Author: Shridhik John
# shjohn@ucsc.edu
# Lab 4
# Section number 41037
# if the input number is divisible by 4, then the output is “DEAD.” If the number is 
# evenly divisible by 9, then the output is “BEEF.” If the output is divisible by both 4 and 9, then the output
# should be “DEADBEEF.” Lastly, if the output is not divisible by either 4 or 9, then the number itself should
# be printed.

.text

main:

 # Prompt for the integer to enter
 li $v0, 4
 la $a0, prompt
 syscall

 # Read the integer and save it in $s0
 li $v0, 5
 syscall
 move $s0, $v0

# start at 1
li $t0, 1
li $t3, -4

#initializes t3 and t4 as 4 and 9
li $t3, 4
li $t4, 9

# if t0 is greater s0, Exit
Loop: bgt  $t0, $s0, Exit
	li $v0, 1  # prints integer
	la $a0, ($t0) # prints current value (t0)
#stores remainder value of value%4 in t1 and value%9 inside t2
	remu $t1,$t0, $t3
	remu $t2, $t0, $t4
	beqz $t1, Step1
	beqz $t2, Step2
	beq $t0, $s0, finish
	
	#prints the number	
	syscall

		 
	# Skips a line after every number
	li $v0, 4
	la $a0, NL
	syscall


	# increment and loop
	addi $t0, $t0, 1
	b Loop


 # Output the number
 li $v0, 1
 move $a0, $s0
 syscall
 
Exit:
 # Exit the program
 li $v0, 10
 syscall

Step1:
	li $v0, 4
 	la $a0, Dead
 	syscall
 	beqz $t2, Step2
   	beq $t0, $s0, Exit	


 	
 	# Skips a line after every number
	li $v0, 4
	la $a0, NL
	syscall


	# increment and loop
	addi $t0, $t0, 1
	b Loop
 
Step2:

	li $v0, 4
 	la $a0, Beef
 	beq $t0, $s0, finish	
 	syscall


	# Skips a line after every number
	li $v0, 4
	la $a0, NL
	syscall


	# increment and loop
	addi $t0, $t0, 1
	b Loop

finish:

	#prints the number	
	syscall


	# increment and loop
	addi $t0, $t0, 1
	b Loop

.data
prompt: .asciiz "Please enter a number N: "
NL: .asciiz "\n" #The string to print.
helloWorld: .asciiz  "hello World"
Dead: .asciiz "DEAD"
Beef: .asciiz "BEEF"

