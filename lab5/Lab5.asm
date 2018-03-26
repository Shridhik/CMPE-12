# Program File: Lab5.asm
# Author: Shridhik John
# shjohn@ucsc.edu
# Lab 5
# Section number 41037
# turning number from decimal to binary

# PSEUDOCODE
# prompt for user input number
# First load word as a string
# load bit by bit and subtract the ASCII value by 48 to find the real input value
# check if first bit is negative, if negative, print negative sign and move onto next number if not print first number
# print value by looping through and printing bit by bit
# repeat process but store user input into a register by adding registers with the value of the number
# you can get the input by getting the register value, multiplying it by ten, and then adding the next number if it exists, otherwise do not multiply by ten
# remove negative sign when determining number
# if negative, go to a seperate loop to do twos complement
# to do twos complement, flip the bits with a not, and then add a one one to that value and then print each number
# else go through a branch that just prints each number
# mask the number with logical shifts (using the and operation ) one at a time, and print each masked number one at a time

.text

main:

 # Prompt for user input number
 li $v0, 4
 la $a0, prompt
 syscall

 # skip line 
 li $v0, 4
 la $a0, NL
 syscall 
 

# printing out the read string as a decimal for user  
lw $s0, ($a1) # store address of string into s0
lb $t1, ($s0) # s0 points to the first digit to begin with, and stores the ascii value in t1
beq $t1, 0x2d, printnegative # if first bit is negative print a negative sign 


Loop:
	lb $t1, ($s0) # s0 points to the first digit to begin with, and stores the ascii value in t1
	beq $t1, 0, Continue # if t1 is equal to 0, break out of the loop   #inside the loop you want to increment
	subi $s1, $t1, 0x30  # turn the ascii value of t1 into decimal  
	#print digit 
	move $a0, $s1 
	li $v0, 1
	syscall 
	addi $s0, $s0, 1 # increment $s0 to look at next digit
	b Loop
	
printnegative:	lb $t1, ($s0) # s0 points to the first digit to begin with, and stores the ascii value in t1
 		li $v0, 4
 		la $a0, negativesign 
 		syscall  # print negative sign
		addi $s0, $s0, 1 # increment $s0 to look at next digit
		b Loop # after printing the negative sign, continue the process to print out the rest of the normal word 

#turning string into decimal for the computer  	
Continue: 
	li $t3, 0
	lw $s0, ($a1) # store address of string into s0
	lb $t1, ($s0) # s0 points to the first digit to begin with, and stores the ascii value in t1
	beq $t1, 0x2d, isnegative



 Loop2: 
	lb $t1, ($s0) # s0 points to the first digit to begin with, and stores the ascii value in t1
	#beq $t1, 0x2d, negate
	beqz $t1, Next # if t1 is equal to 0, break out of the loop   #inside the loop you want to increment
	subi $s1, $t1, 0x30  # turn the ascii value of t1 into decimal
	mul $t3, $t3, 10 # multiply the first number with 10 so you can add the next number
	add $t3, $t3, $s1 # add the next number
	addi $s0, $s0, 1 # increment $s0 to look at next digit
	b Loop2

isnegative: 
	lb $t1, ($s0)
	li $t4, 1
	addi $s0, $s0, 1 # increment $s0 to look at next digit
	b Loop2
# now that $t3 has the decimal value, we turn it from decimal to binary


Next: 

 	# Prompt2 
 	li $v0, 4
 	la $a0, prompt2
 	syscall # Print "This number in binary is 
 
	beq $t4, 1, binarynegative  # if the flag $t4 shows that it is negative, go to binary negative
	beq $t4, 0, binarypositive  # if the flag is not on, continue onto normal binary prining proecess
	
	
binarypositive:
 	
	li $t5, 2147483648 # 2 to the power 32 in binary, we need this number to shift the 1 down to mask and print the value
printbin:
	beq $t5, 0, exit # if we have reached the last number (indicated by null), exit
	and $t6, $t5, $t3 # and $t5 with $t3 as a mask and store calue in $t6
	beqz $t6, printzero # if $t6 is 0, print 0
	li $v0, 4
 	la $a0, print1
 	syscall # prints 1 if not taken into the 0 branch
 	srl $t5, $t5, 1 # shift right logical that moves the 1 right
 	b printbin # makes printbin a loop
	
	
	
printzero: 
	li $v0, 4
 	la $a0, print0
 	syscall # prints 0 
 	srl $t5, $t5, 1  # shift right logical that moves the 1 right
 	b printbin # goes back into loop for print bin to check if number is 1 or a 0	
 	
	

 
 binarynegative:     # binary negative will find the 2s compliment of the number
 	li $t5, 2147483648
 	not $t3, $t3   # flips bits
 	addu $t3, $t3, 1 # add one 
 	
 
 printbinneg:  # same loop as printing positive number, but only occurs after twos comoplement 
 	beq $t5, 0, exit
	and $t6, $t5, $t3
	beqz $t6, printzero # go to printzero branch to print a 0
	li $v0, 4
 	la $a0, print1 
 	syscall # print1
 	srl $t5, $t5, 1 	
 	b printbinneg
 	
 	

exit: 	
	move $s0, $t3
 	 # Exit the program
 	li $v0, 10
 	syscall
 	


.data
prompt: .asciiz "User input number: "
NL: .asciiz "\n" #The string to print.
Checkpoint: .asciiz "\nYou have reached the checkpoint  \n "
Checkpoint2: .asciiz "\nYou have reached the checkpoint, your number is negative \n "
negativesign: .asciiz "-"
prompt2: .asciiz "\nThis number in binary is: \n"
print0: .asciiz "0"
print1: .asciiz "1"