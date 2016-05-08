/**
 * Created by Daniel Shchepetov on 08.05.2016.
 */
public class MarkComparator implements java.util.Comparator<Node> {

    @Override
    public int compare(Node n1, Node n2) {
        String num1 = n1.getMark();
        String num2 = n2.getMark();
        if (Integer.parseInt(num1) > Integer.parseInt(num2)) {
            return 1;
        } else if (Integer.parseInt(num1) < Integer.parseInt(num2)) {
            return -1;
        } else {
            return 0;
        }


    }
}