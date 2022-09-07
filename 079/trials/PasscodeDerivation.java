import structure5.*

public class PasscodeDerivation {
    
    public static int main( String[] args ) {
	int[] keys = new int[50];
	Scanner sc;
	PasscodeDerivation pd;
        try {
	    // reads in the sample keys from the keylog file
            sc = new Scanner (new BufferedReader(new FileReader("keylog.txt")));        
            int i = 0;
	    while ( sc.hasNextInt() ) {
                keys[i] = sc.nextInt();
                i++
            }
	} catch (Exception e) {
            System.out.println(e.toString());
        }
	

    }
    
}
