Shridhik John
shjohn@ucsc.edu
Lab 4
Section number 41037

Magic Numbers: 9671  0x1224 3333

Q: Describe what you learned, what was surprising, what worked well and what did not

A: In this lab I learned MIPS. I learned how to write loops. Loops are branches (using labels) that are recursive. Coditional statements are just branches under certain conditions. bgt (the greater than function) was very useful, along with eqz (equal to zero) which helped me find the numbers divisible by 4 and 9 (remainder of 0). I followed the suggested steps from the lab handout. I worked hello world, and then learned how to take in inputs. I then got the main loop to work, and then i got the conditional statements to work. Getting Dead, Beef, and DeadBeef to print in the right spots was the hardest part of the assignment, but I realize it was only difficult because I kept calling the conditional statements inside the loop. 


Q1. In theory, how large can N be before your program fails? What determines this limit?

A1: Since we are storing our value into a 32 bit register, 2,147,483,647 is the largest number that our program can process. This number is the maximum positive value for a 32-bit signed integer, and therefore the largest input we accept. I tested this by putting in a number thats just one more than this input (2,147,483,648), and as expected, the program failed.

Q2. The text of your prompt (“Please enter a number:”) is stored in the processor’s memory. After assembling your program, what is the range of addresses in which this string is stored?

A2:By looking at the address of where I stored the prompt, I was able to find the range of the area I stored the prompt in. The value is stored from 0 - 25. 25 in hex is 19 which explains why the address goes from 0x10010000 - 0x10010019 in hex.

Q3. Of the instructions you used, which were pseudo-ops (instructions that are not part of the MIPS instruction language, that were translated into other instructions by the assembler)? How do the assembled instructions produce the appropriate result?

A3: Most of the code that I wrote are pseudo operations. Everything besides syscall is a pseudo operation. Pseudo Operations consist of operations like li which are list input, and la, remu, beqz, etc. The assembled instructions produce the appropriate result by translating the code into Basic using the Assembler.

Q4. How many registers did you use in writing this program? Could you have used fewer registers? Describe how, or explain why you cannot.

A4: gp and sp are registers that are always being used. I used 7 registers besides these two, so in total I used 9 registers. If I used less variables, I could have reduced the amount of registers I used. 

