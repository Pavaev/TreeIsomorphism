/**
 * Created by Daniel Shchepetov on 07.05.2016.
 */
public class Comparator implements java.util.Comparator<Node> {

    @Override
    public int compare(Node n1, Node n2) {
        int num1 = n1.getLevel();
        int num2 = n2.getLevel();
        if (num1 < num2) {
            return 1;
        } else if (num1 > num2) {
            return -1;
        } else {
            return 0;
        }


    }
}
