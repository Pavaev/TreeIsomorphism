import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedList;
import java.util.Random;

/**
 * Created by Daniel Shchepetov on 07.05.2016.
 */
public class RootedTree {
    public int[][] graph;
    ArrayList<Node> nodes = new ArrayList<>();

    //for sorting by levels
    Comparator comp = new Comparator();


    public RootedTree(int size) {
        graph = generate(size);
        int root = 0;
        int level = 0;

        //get nodes with marked leaves
        nodes = getNodes(graph, root, level);

        //sorting by levels
        Collections.sort(nodes, comp);
        for (int j = 0; j < nodes.size(); j++) {
            System.out.println(nodes.get(j).getValue() + " " + nodes.get(j).getLevel()+" "+nodes.get(j).getMark());
        }
    }

    private ArrayList<Node> getNodes(int[][] graph, int tempNode, int level) {
        boolean isMark = false;
        Node node = new Node(tempNode);
        node.setLevel(level);
        for (int i = 1; i < graph.length; i++) {
            if (graph[tempNode][i] == 1) {
                isMark = true;
                getNodes(graph, i, level + 1);
            }
        }

        //mark leaves: 0 = it's leave
        if (isMark == false) {
            node.setMark(0);
        }
        nodes.add(node);
        return nodes;
    }

    //strange generation, I don't fully understand how it is works.
    static int[][] generate(int size) {
        int[][] temp = new int[size][size];
        Random rand = new Random(System.currentTimeMillis());
        for (int i = size - 1; i > 0; i--) {
            temp[Math.abs(rand.nextInt()) % i][i] = 1;
        }

//this code is only for result
        for (int i = 0; i < size; i++) {
            for (int j = 0; j < size; j++) {
                if (temp[i][j] == 1) {
                    System.out.println(i + " -> " + j + ";");
                }
            }
        }
        /*
        for (int i = 0; i < size; i++) {
            for (int j = 0; j < size; j++) {

                System.out.print(temp[i][j] + " ");
            }
            System.out.println();
        }
*/
        return temp;
    }
}
