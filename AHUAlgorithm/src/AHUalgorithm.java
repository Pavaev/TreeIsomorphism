import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;

/**
 * Created by Daniel Shchepetov on 01.05.2016.
 */
public class AHUalgorithm {


    public static String getResult(RootedTree tree1, RootedTree tree2) {

        //if there is a difference in count of nodes
        if (tree1.nodes.size() != tree2.nodes.size()) {
            return "No";
        }

        //iteration on levels
        for (int i = tree1.nodes.size() - 1; i >= 0; i--) {

           /* //if there is a difference in count of nodes at current level
            if (tree1.nodes.get(i).size() != tree2.nodes.get(i).size()) {
                return "No";
            } */
            ArrayList<Node> tempNodes = tree1.nodes.get(i);
            String canName1 = getCanonicalName(tempNodes, tree1.graph);
            tempNodes = tree2.nodes.get(i);
            String canName2 = getCanonicalName(tempNodes, tree2.graph);

            //compare canonical names.
            if (!canName1.equals(canName2)) {
                return "No";
            }

        }

        return "Yes";
    }


    private static String getCanonicalName(ArrayList<Node> tempNodes, int[][] graph) {
        MarkComparator comp = new MarkComparator();
        CortageComparator comp1 = new CortageComparator();
        ArrayList<Node> notLeaves = new ArrayList();
        //nodes at current level
        for (Node tempNode : tempNodes) {
            //if it is not a leave
            if (!tempNode.getMark().equals("0")) {
                //get children
                ArrayList<Node> children = tempNode.getChildren();

                children.sort(comp);
                String cort = "";
                //get a cortage
                for (int i = 0; i < children.size(); i++) {
                    cort = cort + children.get(i).getMark();
                }
                System.out.println(cort);
                tempNode.setCortage(cort);
                notLeaves.add(tempNode);
            }

        }
        System.out.println("_____________________");
        if (notLeaves.isEmpty()) {
            return "";
        }
        //lexicographically sorting
        Collections.sort(notLeaves, comp1);
        int mark = 1;
        String canName = "";
        String cortage = notLeaves.get(0).getCortage();
        for (Node notLeave : notLeaves) {
            canName = canName + cortage;
            if (!cortage.equals(notLeave.getCortage())) {
                mark++;
                cortage = notLeave.getCortage();
            }
            notLeave.setMark(Integer.toString(mark));

        }
        System.out.println("Canonical Name: " + canName);
        return canName;
    }

}
