import java.util.ArrayList;

/**
 * Created by Daniel Shchepetov on 07.05.2016.
 */
public class Node {
    private int parent;
    private ArrayList children;
    private int value;
    private int level;
    private int mark = -1;

    public Node(int value) {
        this.value = value;
    }

    public int getValue() {
        return value;
    }

    public void setValue(int value) {
        this.value = value;
    }

    public ArrayList getChildren() {
        return children;
    }

    public void setChildren(int child) {
        children.add(child);
    }

    public int getParent() {
        return parent;
    }

    public void setParent(int parent) {
        this.parent = parent;
    }

    public int getLevel() {
        return level;
    }

    public void setLevel(int level) {
        this.level = level;
    }

    public int getMark() {
        return mark;
    }

    public void setMark(int mark) {
        this.mark = mark;
    }
}
