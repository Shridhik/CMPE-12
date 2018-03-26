# Program File: Lab5.asm
# Author: Shridhik John
# shjohn@ucsc.edu
# Lab 6
# Section number 41037
# Vignere Encryption//Decryption functions in mips

# PSEUDOCODE 
#EncryptChar
# Go step by step and create encrypt char, encrypt string, and then decrypt char, and then decrypt string.
# For encrypt char I used the algorythm found on the wikipedia page. You add the key with the string, nd then find the remainder when dividing by 26, you then add 65 to get back to the capital lettters value
# Do all of this into variable $t0, and then finally move vairable $t0 to $v0 since the desires output should be stored in $v0
# make sure you check if its lowercase or not, if its lowercase, just subtract by 32 in the beginning and add 97 at the end before algorythm
# jr ra at the end of function to head back to next line after the jal call

#EncryptString
# for encrypt string make sure you skip over everything that is not a capital or lowercase word, but do not skip the key
# make sure you repeat the key once it ends, but do not exit the loop, stay in the loop, and only exit the loop once the string is finished being read
# loop through the string one byte at a time, go through they key and strings letter to encrypt at the same time, using encrypt char, make sure to use stacks
# if there is a special character, do not encrypt it, just send the character to the array (a2) instead, and then continue the loop 
# check all edge cases, if key is done, loop the key, only exist encrypt string once the string has no characters left

#DecryptChar
# same as encrypt char, but we have to subtract instead of add

#DecryptString
# same as encryptstring but you call decrypt char inside instead
# ascii characters start as 68 - 90 for A-z and 97-112 for a-z, skip everything else
# rename the branches you use when copying encryptstring, otherwise your branches will get confused


.text
# beginning main for testing purposes
# la $a2, testES_result	
	#li $a0, 'Z' # testing to see if input registers work
	#li $a1, 'B' #testing to see if input registers work
#jal EncryptChar
#jal EncryptString
#jal DecryptChar
#jal DecryptString
#exit: 	
 #Exit the program
 #	li $v0, 10
 #	syscall	
 
 
 
 #start of EncryptChar

	
 	EncryptChar:
 	
 	bgt $a0, 96, __lowercaseexception
	add $t0, $a0, $a1 # add character with Key A + B returns 65 + 66 and goes into t0
	rem $t0, $t0, 26 #loop if there is a remainder , loops around alphabet
	add $t0, $t0, 65 # adds 65
	move $v0, $t0 # desired output must be in $v0
	#b print #testing print statement
	jr $ra #you have encrypted uppercase character, you can go back to rest of the code with the encrypted charavter in $v0
	
	__lowercaseexception:
	sub $a0, $a0, 32 # subtract by 32 to make the lowercase ascii value equivalent to the capital letters so that we can reuse the capital letter's encryption code
	add $t0, $a0, $a1 # add character with Key
	rem $t0, $t0, 26 #loop if there is a remainder , loops around alphabet
	add $t0, $t0, 97 # we want to add 97 because lowercase letters are 97 numbers down the list
	move $v0, $t0 # desired output must be in $v0
	jr $ra
	
#end of EncryptChar

#start of EncryptString
	EncryptString:
	la $t4, ($a0) # string we need to decrypt
	la $t5, ($a1) # key 
	la $t6, ($a1) # used if we hve to restart the key 
	
	
	__Loop: # a loop to go through every character
	
	lb $a0, ($t4) # s0 points to the first digit to begin with, and stores the ascii value in t1
	lb $a1, ($t5) # loads new byte of key 
	#continue if still in word
	bgt $a0, 122, __skipnumber #first check if ascii value is greater than 122, if so you want to ignore
	bgt $a0, 96, __stay # check if ascii value is greater than 96, if so you want to stay since value is between a-z
	bgt $a0, 90, __skipnumber # check if ascii value is greater than 90, if so you want to ignore
	bgt $a0, 64, __stay # check if ascii value is greater than 64, if so you want to continue onto stay since value is between A-Z
	bgt $a0, 0, __skipnumber # check if ascii value is greater than 0, if so you want to ignore
	
	__stay:
	beq $a0, 0, __restofcode #Continue # if t1 is equal to 0, break out of the loop   #inside the loop you want to increment
	beq $a1, 0, __restart # restart key if key comes to an end 

	sw $ra, ($sp) #use of stack
	subi $sp, $sp, 4
	jal EncryptChar # encrypt each character
	addi $sp, $sp, 4
	lw $ra, ($sp)
	sb $v0, ($a2) #store character value into array	
	# prints string contents of a2
	#move $a0, $a2 
	#li $v0, 4
	#syscall	
	addi $t4, $t4, 1 # increments string bit
	addi $t5, $t5, 1 # increments key bit
	addi $a2, $a2, 1 #increment array
	b __Loop #loop to next letter
	
	__restart:
	la $t5, ($t6) # restart key
	
	b __Loop
	
	
	__skipnumber:
	move $v0, $a0 # move the contents of character youre looking at into the value so return is just like that of encryptchar
	sb $v0, ($a2) # stores the value of $v0 in array 
	
	#print statement
	#move $a0, $a2
	#li $v0, 4
	#syscall
	
	#increments string and key
	addi $t4, $t4, 1 
	addi $a2, $a2, 1
	b __Loop
	#exit branch for encrytstring
	__restofcode:
	jr $ra
 	
 # end of Encrypt String
 	

	
 #start of DecryptChar

	
 	DecryptChar:
 	#li $a0, 'x' # testing to see if input registers work
	#li $a1, 'R' #testing to see if input registers work
 	bgt $a0, 96, __declowercase
	sub $t0, $a0, $a1 # add character with Key A + B returns 65 + 66 and goes into t0
	blez $t0, __negtva
	__plzcomebacka:
	rem $t1, $t0, 26 #loop if there is a remainder , loops around alphabet
	add $t0, $t1, 65 # adds 65
	move $v0, $t0
	#b print #testing print statement
	#jumpreturna:
	jr $ra 
	
	__declowercase:
	sub $a0, $a0, 32
	sub $t0, $a0, $a1 # add character with Key
	blez $t0, __negtvb
	__plzcomebackb:
	rem $t1, $t0, 26 #loop if there is a remainder , loops around alphabet
	add $t0, $t1, 97 # we want to add 97 because lowercase letters are 97 numbers down the list
	move $v0, $t0
	#b print
	#jumpreturnb:
	jr $ra
	
	__negtva: # if its negative, add 26 and go back to code 
	add $t0, $t0, 26
	b __plzcomebacka
	
	__negtvb: #if its negative go back to code 
	add $t0, $t0, 26
	b __plzcomebackb
	
#end of DecryptChar

#start of Decrypt String




	DecryptString:
	#la $a0, string # load string into a0 since thats what we need for input
 	#la $a1, key # load key into a1 since thats what we need for input
	la $t4, ($a0)
	la $t5, ($a1)
	la $t6, ($a1)
	
	
	__Loop2:
	
	lb $a0, ($t4) # s0 points to the first digit to begin with, and stores the ascii value in t1
	lb $a1, ($t5) # loads new byte of key 
	
	#continue if still in word
	
	bgt $a0, 122, __skipnumber2 #first check if ascii value is greater than 122, if so you want to ignore
	bgt $a0, 96, __stay2 # if code reaches here, value is from a-z, so continue onto stay2
	bgt $a0, 90, __skipnumber2 # if code reaches here, the value is between Z and a, so you want to skip
	bgt $a0, 64, __stay2 # if code reaches here, continue onto stay2, because value is between A-Z
	bgt $a0, 0, __skipnumber2 # if code reaches here, value is less than A, so between 0 and A, go to skip number 2
	#continue hereif value is accepted
	__stay2:
	beq $a0, 0, __restofcode2 #Continue # if t1 is equal to 0, break out of the loop   #inside the loop you want to increment
	beq $a1, 0, __restart2 # restart the key if it ends

	
	sw $ra, ($sp) # use of stacks
	subi $sp, $sp, 4
	jal DecryptChar #decrypt character
	addi $sp, $sp, 4
	lw $ra, ($sp)
	sb $v0, ($a2)
	
	# prints string contents of a2
	#move $a0, $a2 
	#li $v0, 4
	#syscall
	
	
	addi $t4, $t4, 1 # increments string bit
	addi $t5, $t5, 1 # increments key bit
	addi $a2, $a2, 1 
	b __Loop2
	
	__restart2:
	la $t5, ($t6)
	
	b __Loop2
	
	#skip number 2 allows value to be stored into the encrypted string array, and then moves onto the next character
	__skipnumber2:
	move $v0, $a0 # move the contents of character youre looking at into the value so return is just like that of encryptchar
	sb $v0, ($a2) # stores the value of $v0 in array 
	#increments string and key
	addi $t4, $t4, 1
	addi $a2, $a2, 1
	b __Loop2
	#exit branch for encrytstring
	__restofcode2:
	jr $ra
 	
#end of decrypt string

 	
 # print characters in decrypt string	
#print:
#move $v1, $v0
  # li  $v0, 11           # service 1 is print integer
   #add $a0, $v1, $zero  # load desired value into argument register $a0, using pseudo-op
   #syscall
   #b jumpreturna

.data
#string: .asciiz "N"
#key: .asciiz "B"
#testES_result: 		.space 	 	31				
