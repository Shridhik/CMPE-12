//-----------------------------------------------------------------------------
// DeadBeef.java
// shjohn@unix.ucsc.edu
// Shridhik John
// 1 - 13 - 18
// This program is to iterate through a set of integers (1-1000) and output one of four outputs depending on
//the number: if the number is divisible (no remainder) by 4, then the output is “DEAD.” If the number is
//evenly divisible by 9, then the output is “BEEF.” If the output is divisible by both 4 and 9, then the output
//should be “DEADBEEF.” Lastly, if the output is not divisible by either 4 or 9, then the number itself should
//be printed. 
//-----------------------------------------------------------------------------

import java.io.*;
import java.util.Scanner;

public class DeadBeef{
    public static void main(String[] args) throws IOException{
	PrintWriter out = new PrintWriter("Output.txt");
	for(int i = 1; i <= 1000; i++){
		if(i%4 == 0 && i%9 == 0){
			out.println("DEADBEEF");
		}
		else if(i%4 == 0){
			out.println("DEAD");
		}
		else if(i%9 == 0){
			out.println("BEEF");
		}
		else{
			out.println(i);
		}
	}
out.close();
}
}

		
