
/**
 * Created by Daniel Shchepetov on 01.05.2016.
 */
public class Main {
    public static void main(String[] args) throws CloneNotSupportedException {
        RootedTree tree1 = new RootedTree(10000);

        //copy tree1 to tree2
         RootedTree tree2 = new RootedTree(tree1);
        //RootedTree tree2 = new RootedTree(10000);
        System.out.println(AHUalgorithm.getResult(tree1, tree2));
    }
}



