Shridhik John
shjohn@ucsc.edu
Lab 2
Section number 41037

*Went to a Social Science 1 lab section for Lab understanding and Ming Ong Lab Thursday 7-8 PM TA for help 

Class Codes: 
0x6010
0234

Q: Describe what you learned, what was surprising, what worked well and what did not.

A: I actually learned a lot in this lab! There were moments where my lab would not run due to the error of not having a sender for my receiver or reciter for my sender, and I realized that the program actually brings you to the page with the missing sender/receiver which really helped. I learned how the MUX worked which is pretty interesting to me. Being  able to store values and keep track with a register was pretty surprising. It was hard piecing together and understanding this lab, but it was really cool having an end product and knowing all the details of getting there. Being able to invert the numbers for 2's complement was the hardest part due to my inverter issues and misunderstanding of the MUX. Subtracting was easily the hardest part, however understanding the concept was surprisingly easy, its only the implementation that was difficult. The keypad we used was also a really cool device to come to understand. My most difficult issue had a surprisingly simple solution. I was wondering how we could invert the values straight from input. The solution was to store the original value in a variable before it was flipped by the inverter and sent to the adder. Overall the project worked well and only took me about two days to finish. 
Q: Discuss issues you had building the circuit.

A: The entire lab made no sense to me at first, however the lab section I went to really gave me a good understanding of how to break apart and look at this lab in pieces.When I tried building the circuit on my own, I had no idea how to utilize the multiplexer. I knew I had to use it, however I had no idea what symbols like s and E stood for on the multiplexer. I was stuck making the inverter because I didn't know how to use and understand the multiplexer, however once I understood it, everything mad sense. Building such a large adder was difficult to comprehend, however the in class explanation made it easy to understand. Learning how to copy paste saved me a huge amount of time.

Q: Describe what you added to each module to make debugging easier.

A: I made my own sender and receivers that worked as temp variables to test my logic. I attached my test senders/receiver to switches and leds to see if my logic was right. I did this with each module to make debugging easier. 

Q: What happens when you subtract a larger number from a smaller number? Does the result make sense? What happens when you add two numbers that won’t fit in 6 bits? 

A: When you subtract a large number from a smaller number, you're supposed to get a negative number, however negative numbers can't be displayed on the display. What I noticed is that in instead of -1, the display prints out 3f, and for -2 there is a 3e and so on. as you decrease by negative one, we range from 3f to 30, and once you're done with that you decrease from 2f - 20, and once you get to 00, the display resets to 3f. Although this doesn't completely make sense to me, this is a systematic pattern, and I would like to understand how -1 is equivalent to 3f. As I incremented by 1 to find the largest number that can be displayed, I realize that F is 15 which is the largest number you can fit in hexadecimal, however beyond that, 16 is used to display 10, and 17 is used to display 11, and this continues up to 3f before it is reset back to 0.