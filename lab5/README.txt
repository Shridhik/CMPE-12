Shridhik John
shjohn@ucsc.edu
Lab 5
Section number 41037
README.txt

Magic Numbers: 0b1010
	       0x0745
	       0123

*Went to TA's lab multiple times, and walked through pseudocode with people (Srija, and Rishab) at lab to get an understanding of what to do. We did make sure we all worked on our actual code seperatley. 

1. What happens if the user inputs a number that is too large to fit in a 32-bit 2SC number?

A: 2^32 is the max amount of bits we can't store in a 32-bit 2SC number, this number in decimal is 2,147,483,647. In binary this fills out all 32 bits with a 0 followed by 1s. As soon as we go above this number, we loop and start from the beginning and start from the value of 0. It gets cut off after 32 bits.

2. What happens if the user inputs a number that is too small (large magnitude, but negative) to fit
in a 32-bit 2SC number?

A: The same thing occurs in which the number gets cut off with the last 32 bits. 

3. What is the difference between the “mult” and the “multu” instructions? Which one did you use, and why?

A: Mult is signed multiplication and multu is unsigned multiplication. I used signed multiplication, however I don't think it makes a difference for this project since we needed the absolute value of the number anyways (after looking over the negative sign). We just needed the value of the number, and this would always be positive, so it does not matter if I used unsigned or signed multiplication. I used "multiple" since the program can accept negative numbers as input. 

4. Consider how you might write a binary-to-decimal converter, in which the user inputs a string of
ASCII “0”s and “1”s and your code prints an equivalent decimal string. How would you write your code? How is the BDC like the DBC, and how is it different?

A: We would still have to read and print each bit one at a time, just like we did for decimal to binary. However, instead of multiplying our decimal number by 10 and then adding the next number, for binary to decimal we would  would multiply the binary number by 2 and then add. This would give us our number in decimal, and to print this number out we would print the value stored inside the register in which the sum of all the ones and zeros are stored. 