Shridhik John
shjohn@ucsc.edu
Lab 6
Section number 41037
README.txt

Magic Numbers: 0b1100

• Describe what you learned, what was surprising, what worked well and what did not
	
A: I learned a lot in the lab, I believe the biggest take away from this program is the use of subroutines. I had to get very good at the use of arguments, and variables. I had a lot of branches inside my functions, and those worked pretty well. I would not be able to do as well as I did in this assignment without the help of print statements. I had print statements throughout my code, and it really helped me make sure I was on the right track.



• Answer the following questions: 
1. What additional test code did you write? Why? Did it work? 
	
	I had to write many additional print statements. I also had to write a main and exit function to execute and test all the functions I had created. These print statements saved my life because at many times I had no idea what was being passed through my registers. The code we were expected to submit expected us to return our value inside a register, however I needed print statements to make sure I knew exactly what was in my registers. 

2. What happens when you attempt encryption with a keystring that has illegal characters (for
example, “NotALegalKey”? Why?

	If you tried encryption with a keystroking that is invalid (not all capital letters), the code would still try to encrypt it, however the math would be off since you could be adding with a number that is potentially less than or greater than 0-26.

3. How would you write a recursive subroutine (a subroutine that calls itself)?
	
	To write a recursive subroutine, you have to call Jal within the function you called Jal on. For example, if I called Jal encryptString within my encryptString subroutine's code, this program would be recursive.

4. According to MIPS calling conventions, arguments should be passed in the $a registers. There
are only 4 of these registers. What could you do to pass more than 4 arguments into a
subroutine?

	One way to get around the restriction of having only 4 arguments would be utilizing stacks. With stacks you have a copy of old memory, and you are able to manipulate new memory as well. This access to copies gives you the ability to pass more than 4 arguments into a subroutine.