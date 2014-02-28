import java.util.*;
import java.lang.*;
import java.io.*;
import java.awt.Point;

/** (c) 2013 Aaron M. Taylor
 * This class provides the solution to Project Euler problem 81
 * 
 */
public class MinPathSum {
    //the size of the matrix being read in
    private static final int M_SIZE = 80;
    //name of the file to be read in, must be in local directory
    private static final String fileName = "matrix.txt";
    
    /* Reads in the matrix into a 2D array format for analysis
     * prints the tree and calls method to find maximum path
     */
    public static void main(String[] args) {
	int[][] matrixIn = new int[M_SIZE][M_SIZE];
	Scanner sc;
	try {
	    sc = new Scanner ( new BufferedReader(new FileReader(fileName)) );	    
	    int x = 0;
	    int y = 0;
	    // reads file into bottom left of 2D array
	    while ( sc.hasNextInt() ) {
		int num = sc.nextInt();
		matrixIn[x][y] = num;
		x++;
		if ( x == M_SIZE ) {
		    x = 0;
		    y++;
		}
	    }
	} catch (Exception e) {
	    System.out.println(e.toString());
	}
	S÷ystem.out.println( "minPath: " + minPathRD(matrixIn,M_SIZE));
    }

    /* Finds the minimal path through the tree moving only right and downward
     */
    private static int minPathRD( int matrix[][], int size ) {
	// creates priority queue and sums array and puts in initial values
	PriorityQueue<Node> queue = new PriorityQueue<Node>(101);
	Node next = new Node(0,0,matrix[0][0]);
	// while destination node is not yet reached
	Node cur;
	while ( !((next.getX() == (size-1)) && (next.getY() == (size-1)))) {
	    cur = next;
	    
	    Point nextP = smallestNeighborDR(matrix,cur.getX(),cur.getY(), size);
	    System.out.println(nextP);
	    // enter next smallest value in priority queue
	    next = new Node((int)nextP.getX(),(int)nextP.getY(),cur.getPath() + matrix[(int)nextP.getX()][(int)nextP.getY()]);
	    System.out.println(next);
	    queue.add(next);
	    next = queue.poll();
	    try {
		Thread.sleep(500);
	    } catch (Exception e) { 
		System.out.println(e);
	    }
	}
	return next.getPath();
    }

    //determine which neighbor is the smallest
    private static Point smallestNeighborDR( int matrix[][], int x, int y, int size ) {
	Point next = new Point();
	int minVal = 1000000;
	if ( (x + 1 < size) ) { // to the right
	    System.out.println("right");
	    next = new Point( x + 1, y );
	    minVal = matrix[x+1][y];
	}
	if ( (y + 1 < size) && ( matrix[x][y + 1] < minVal ) ) { // just below
	    System.out.println("down");
	    next = new Point( x, y + 1 );
	    minVal = matrix[x][y+1];
	}
	return next;
    }
}

// this class is used in the sums matrix of minPathRD to maintain path lengths,
// and is comparable to allow for the use of a priority queue
class Node implements Comparable {
    
    int xValue, yValue, pathValue;

    public Node ( int x, int y, int path ) {
	xValue = x;
	yValue = y;
	pathValue = path;
    }

    public int getX () { return xValue; }
    public int getY () { return yValue; }
    public int getPath () { return pathValue; }

    public int compareTo ( Object o ) {
	Node n = (Node)o;
	return pathValue - n.getPath();
    }
    public String toString() { return "x:"+xValue+" y:"+yValue+" pathValue:"+pathValue; }
}