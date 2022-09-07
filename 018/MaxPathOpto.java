import java.util.*;
import java.lang.*;
import java.io.*;

/** (c) 2013 Aaron M. Taylor
 * This class provides to solutions to Project Euler problems 18 and 67
 * The efficient and necessary solution is to move from bottom to top of the triangle
 * this eliminates choices as the algorithm progresses rather than creating them.
 */
public class MaxPath {
    //the size of the tree being read in
    private static final int TRS = 15;
    //name of the file to be read in, must be in local directory
    private static final String fileName = "nums.txt";
    
    /* Reads in the tree into a 2D array format for analysis
     * prints the tree and calls method to find maximum path
     */
    public static void main(String[] args) {
	int[][] treeIn = new int[TRS][TRS];
	Scanner sc;
	try {
	    sc = new Scanner ( new BufferedReader(new FileReader(fileName)) );	    
	    int l = 0;
	    int n = 0;
	    // reads file into bottom left of 2D array
	    // 
	    while ( sc.hasNextInt() ) {
		int i = sc.nextInt();
		treeIn[l][n] = i;
		n++;
		if ( n == (l+1) ) {
		    n = 0;
		    l++;
		}
	    }
	    printTree(treeIn);
	} catch (Exception e) {
	    System.out.println(e.toString());
	}
	System.out.println( "maxPathBottomUp: "+ maxPathBottomUp(treeIn));
    }

    /* This method builds a tree of sums from the original
     * each new node is the maximum possible up to that point.
     */
    public static int maxPathBottomUp( int[][] tree ) {
	int[][] sums = new int[TRS][TRS];
	int r = TRS;
	//initializing sums array
	for (int i = 0; i < TRS; i++) {
	    sums[TRS-1][i] = tree[TRS-1][i];
	}
	for ( int y = TRS-2; y >= 0; y-- ) {
	    for (int x = 0; (x < TRS) && (tree[y][x] != 0); x++ ) {
		if (sums[y+1][x] > sums[y+1][x+1]) {
		    sums[y][x] = sums[y+1][x] + tree[y][x];
		} else {
		    sums[y][x] = sums[y+1][x+1] + tree[y][x];
		}
	    }
	}	
	return sums[0][0];
    }

    public static void printTree( int [][] treeIn ) {
	int len = 1;
	for ( int []line : treeIn ) {
	    
	    for (int x = 0; x < (TRS - len); x++) {
		System.out.print("  ");
	    }
	    for (int i: line) {
		if ( i != 0 ) {
		    System.out.printf(" %02d ",i);
		}
	    }
	    System.out.println("");
	    len++;
	}
    }
}