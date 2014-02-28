import java.util.*;
import java.lang.*;
import java.io.*;
import java.awt.Point;


public class Path implements Comparable {
    
    private double averageWeight;

    private LinkedList<Point> indicies;

    public Path ( Path curPath ) {
	indicies = new LinkedList<Point>( curPath.getList() );
	averageWeight = curPath.avgWeight();;
    }

    public Path ( Point startPos, int startWeight ) {
	indicies = new LinkedList<Point>();
	indicies.add(startPos);
	averageWeight = (double)startWeight;
    }

    public void addElement( Point pos, int weight ) {
	averageWeight *= (double)indicies.size();  //increases value for averaging
	indicies.addFirst(pos);
	//System.out.println("adding element: "+pos.toString());
	averageWeight += (double)weight;
	averageWeight /= (double)indicies.size();
    }

    public double avgWeight() { return averageWeight; }
    public Point getTopPoint() { return indicies.getFirst(); }    
    private LinkedList<Point> getList() { return indicies; }    

    public int compareTo( Object o ) {
	Path other = (Path)o;
	return (int)(other.avgWeight() - averageWeight);
    }

    public String toString( int[][] tree) {
	String out = indicies.size()+" elements with average weight "+averageWeight+" with:\n";
	int wt = 0;
	for (Point p: indicies) {
	    //System.out.println(p);
	    int w = tree[(int)p.getY()][(int)p.getX()];
	    wt += w;
	    out = out + "i"+(int)p.getY()+": "+(int)p.getX()+" weight: "+w+"\n";
	}
	out += "total weight : "+wt+"\n";
	return out;
    }

    public String toString() {
	String str = "avgWeight: " +averageWeight +" "+ indicies.toString();
	str = str.replaceAll("java.awt.Point","");
	return str;
    }
}