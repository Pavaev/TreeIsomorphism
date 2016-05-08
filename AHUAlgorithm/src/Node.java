import java.io.Serializable;
import java.util.ArrayList;

/**
 * Created by Daniel Shchepetov on 07.05.2016.
 */
public class Node implements Cloneable {
    private int parent;
    private int value;
    private int level;
    private String mark = "-1";
    private ArrayList<Node> children = new ArrayList();
    private String cortage;

    public Node(int value) {
        this.value = value;
    }

    public Node() {

    }

    public int getValue() {
        return value;
    }

    public void setValue(int value) {
        this.value = value;
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

    public String getMark() {
        return mark;
    }

    public void setMark(String mark) {
        this.mark = mark;
    }

    public ArrayList<Node> getChildren() {
        return children;
    }

    public void setChild(Node child) {
        children.add(child);
    }

    public void setChildren(ArrayList<Node> children) {
        this.children = children;
    }

    public String getCortage() {
        return cortage;
    }

    public void setCortage(String cortage) {
        this.cortage = cortage;
    }
}
