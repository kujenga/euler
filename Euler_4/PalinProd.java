import java.lang.*;

public class PalinProd {

    private static Boolean isPalindromic(int i)
    {
	String str = "" + i;
	int l = str.length();
	int n = 0;
	while ( n < l ) {
	    if( str.charAt(n) != str.charAt(l-n-1) ) return false;
	    n++;
	}
	return true;
    }

    public static void main(String[] args)
    {
	int biggest = 0;
	for (int x = 0; x < 1000; x++) {
	    for (int y = 0; y < 1000; y++) {
		if( (x*y > biggest) && isPalindromic(x*y) ) {
		    System.out.println("biggest so far: "+ (x*y));
		    biggest = x*y;
		}
	    }
	}
    }

}