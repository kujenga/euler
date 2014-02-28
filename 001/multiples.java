import java.lang.*;
import java.util.*;

public class multiples{

    public static void main(String args[]) {
	System.out.println("finding multiples...");

	Integer max = Integer.valueOf(args[0]);

	ArrayList<Integer> allMults = new ArrayList<Integer>();

	
	for(Integer i = 1; i < max; i++) {
	    if ((i%3==0)||(i%5==0))
		allMults.add(i);
	}
	System.out.println(allMults);
	Integer total = 0;
	for(Integer x: allMults)
	    total += x;
	System.out.println(total);
    }
}