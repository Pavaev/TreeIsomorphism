import java.util.ArrayList;
import java.util.Random;

/**
 * Created by Daniel Shchepetov on 07.05.2016.
 */
public class RootedTree implements Cloneable {
    public int[][] graph;
    ArrayList<ArrayList<Node>> nodes = new ArrayList<>();

    public RootedTree(RootedTree tree) {
        this.nodes = (ArrayList<ArrayList<Node>>) tree.nodes.clone();
        this.graph = tree.graph;
    }

    public RootedTree(int size) {
        graph = generate(size);
        int root = 0;
        int level = 0;

        //get nodes with marked leaves
        nodes = getNodes(graph, root, level);

      /*  for (int j = 0; j < nodes.size(); j++) {
            ArrayList<Node> list = nodes.get(j);
            System.out.println("__________________________________________________________");
            for (int q = 0; q < list.size(); q++) {
                System.out.println(list.get(q).getValue() + " " + list.get(q).getLevel() + " " + list.get(q).getMark() + " " + j);
            }

        } */
    }

    private ArrayList<ArrayList<Node>> getNodes(int[][] graph, int tempNode, int level) {
        boolean notLeave = false;
        Node node = new Node(tempNode);
        node.setLevel(level);

        //if ArrayList for current level doesn't exist, create it
        if (nodes.size() - 1 < level) {
            ArrayList<Node> levelList = new ArrayList<Node>();
            nodes.add(levelList);
        }
        for (int i = 1; i < graph.length; i++) {
            if (graph[tempNode][i] == 1) {
                notLeave = true;
                getNodes(graph, i, level + 1);
            }
        }

        //mark leaves: 0 = is leave
        if (notLeave == false) {
            node.setMark(0);
        }
        nodes.get(level).add(node);


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
