import java.util.*;
import java.lang.*;
import java.io.*;
import java.awt.Point;

public class MaxPath {

    private static final int TRS = 100;

    private int[][] tree;
    private PriorityQueue<Path> queue = new PriorityQueue<Path>( 15 );

    public static void main(String[] args) {
	int[][] treeIn = new int[TRS][TRS];
	Scanner sc;
	try {
	    sc = new Scanner ( new BufferedReader(new FileReader("triangle.txt")) );	    
	    int l = 0;
	    int n = 0;
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
	    MaxPath mp = new MaxPath( treeIn );
	} catch (Exception e) {
	    System.out.println(e.toString());
	}
    }

    public MaxPath ( int [][] treeIn ) {
	tree = treeIn;
	Path maxEle = maxPathElegant();
	System.out.println( maxEle.toString(tree) );
	System.out.println( "maxPathBottomUp: "+ maxPathBottomUp());
    }    

    public int maxPathBottomUp() {
	int[][] sums = new int[TRS][TRS];
	int r = TRS;
	//initializing sums array
	for (int i = 0; i < TRS; i++) {
	    sums[TRS-1][i] = tree[TRS-1][i];
	}
	for ( int y = TRS-2; y >= 0; y-- ) {
	    for (int x = 0; (x < TRS) && (tree[y][x] != 0); x++ ) {
		//System.out.println("x:"+x+" y:"+y+" tree[y][x]:"+tree[y][x]);
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
	int len = 0;
	for ( int []line : treeIn ) {
	    len++;
	    for (int x = 0; x < (TRS - len); x++) {
		System.out.print("  ");
	    }
	    for (int i: line) {
		if ( i != 0 ) {
		    if ( i < 10 )
			System.out.print( i + "   " );
		    else
			System.out.print( i + "  " );
		}
	    }
	    System.out.println("");
	}
    }

    public Path maxPathElegant() {
	int r = TRS;
	int sIndex = 0;
	//initializing queue
	for (int v : tree[TRS-1]) {
	    queue.add( new Path(new Point(sIndex,r-1),v) );
	    sIndex++;
	}	
	int k = 0;
	while(k < 1000) {

	    Path top = queue.poll();
	    Point cur = top.getTopPoint();
	    Point next = biggestAbove(cur);
	    //System.out.println("top: "+top+" next: "+next);
	    if (next == null) {
		//System.out.println("done");
		return top;
	    } else {
		//System.out.println("top: "+top);
		int nextW = tree[(int)next.getY()][(int)next.getX()];
		//System.out.println("next: "+next+" weight: "+nextW);
		top.addElement(next,nextW);
		queue.offer(top);
		
	    }
	    k++;
	}
	return null;
    }


    private Point biggestAbove(Point p) {
	//System.out.println("biggestAbove: "+p);
	int row = (int)p.getY();
	int col = (int)p.getX();
	if ( row == 0 ) { //reached top element
	    return null;
	} else if ( col == 0 ) { //element on left side of graph
	    return new Point(col,row-1);
	} else if ( col == row ) { //element on right side of graph
	    return new Point(col-1,row-1);
	} else { //element in the middle of the graph
	    if (tree[row-1][col-1] > tree[row-1][col]) {
		return new Point(col-1,row-1);
	    } else {
		return new Point(col,row-1);
	    }
	}
    }
}