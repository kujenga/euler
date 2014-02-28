import java.util.*;
import java.lang.*;

public class FibonacciEvens {
    public static void main(String args[]){
	System.out.println("finding sum of even fibonacci numbers up to four million");

	ArrayList<Integer> evenFibs = new ArrayList<Integer>();

	recListEvenFibonaccis(evenFibs, 1, 1, 4000000);
	System.out.println(evenFibs);

	Integer total = 0;
	for (Integer x: evenFibs)
	    total += x;
	System.out.println(total);
    }

    public static void recListEvenFibonaccis(ArrayList<Integer> evenFibs, Integer one, Integer two, Integer max){
	Integer next = one+two;
	if (next<=max && (next%2)==0)
	    evenFibs.add(next);
	//recursive call within bounds
	if (next<=max)
	    recListEvenFibonaccis(evenFibs, two, next, max);
    }

}