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

            //if there is a difference in count of nodes at current level
            if (tree1.nodes.get(i).size() != tree2.nodes.get(i).size()) {
                return "No";
            }
            ArrayList<Node> tempNodes = tree1.nodes.get(i);
            ArrayList<String> canName1 = getCortages(tempNodes, tree1.graph);
            tempNodes = tree2.nodes.get(i);
            ArrayList<String> canName2 = getCortages(tempNodes, tree2.graph);

            //if there is a difference between notLeaves count
            if (canName1.size() != canName2.size()) {
                return "No";
            }
            //compare cortages
            for (int j = 0; j < canName1.size(); j++) {

                if (!canName1.get(j).equals(canName2.get(j))) {
                    return "No";
                }

            }

        }

        return "Yes";
    }


    private static ArrayList<String> getCortages(ArrayList<Node> tempNodes, int[][] graph) {
        MarkComparator markComp = new MarkComparator();
        CortageComparator cortComp = new CortageComparator();

        ArrayList<Node> notLeaves = new ArrayList<Node>();
        //nodes at current level
        for (Node tempNode : tempNodes) {
            //if it is not a leave
            if (!tempNode.getMark().equals("0")) {
                //get children
                ArrayList<Node> children = tempNode.getChildren();

                children.sort(markComp);
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

        ArrayList<String> cortageList = new ArrayList<String>();

        //if there is no leaves, return empty list
        if (notLeaves.isEmpty()) {
            return cortageList;
        }
        //lexicographically sorting
        Collections.sort(notLeaves, cortComp);
        int mark = 1;
        String cortage = notLeaves.get(0).getCortage();
        for (Node notLeave : notLeaves) {
            cortageList.add(cortage);
            if (!cortage.equals(notLeave.getCortage())) {
                mark++;
                cortage = notLeave.getCortage();
            }
            notLeave.setMark(Integer.toString(mark));

        }

        return cortageList;
    }

}
