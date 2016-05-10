/**
 * Created by Daniel Shchepetov on 08.05.2016.
 */

//for sorting
public class CortageComparator implements java.util.Comparator<Node> {

    @Override
    public int compare(Node n1, Node n2) {
        String num1 = n1.getCortage();
        String num2 = n2.getCortage();
        if (num1.compareTo(num2)>0) {
            return 1;
        } else if (num1.compareTo(num2)<0) {
            return -1;
        } else {
            return 0;
        }


    }
}