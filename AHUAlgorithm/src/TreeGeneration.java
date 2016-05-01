import java.util.Random;

/**
 * Created by Daniel Shchepetov on 01.05.2016.
 */
public class TreeGeneration {
    final static int SIZE = 10;

    static int[][] generate() {
        int[][] graph = new int[SIZE][SIZE];
        Random rand = new Random(System.currentTimeMillis());
        for (int i = SIZE - 1; i > 0; i--) {
            graph[Math.abs(rand.nextInt()) % i][i] = 1;
        }
        /*
        This code is for checking results and it would be removed

        for (int i = 0; i < SIZE; i++) {
            for (int j = 0; j < SIZE; j++) {
                if (graph[i][j] == 1) {
                    System.out.println(i + " -> " + j + ";");
                }
            }
        }
        for (int i = 0; i < SIZE; i++) {
            for (int j = 0; j < SIZE; j++) {

                System.out.print(graph[i][j]+" ");
            }
            System.out.println();
        }
        */
        return graph;
    }
}