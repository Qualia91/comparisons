class Node<T> {
    private T val;
    private Node<T> left = null;
    private Node<T> right = null;

    public Node(T val) {
        this.val = val;
    }
    public Node(T val, Node<T> left, Node<T> right) {
        this.val = val;
        this.left = left;
        this.right = right;
    }

    public void setVal(T val) {
        this.val = val;
    }
    public void setLeft(Node<T> left) {
        this.left = left;
    }
    public void setRight(Node<T> right) {
        this.right = right;
    }

    public T getVal() { return this.val; }
    public Node<T> getLeft() { return this.left; }
    public Node<T> getRight() { return this.right; }

    public String toString() {
        if (left != null && right != null) {
            return left.toString() + ", " 
                + val.toString() + ", " 
                + right.toString();
        } else if (left != null) {
            return  left.toString() + ", " 
                + val.toString();
        } else if (right != null) {
            return val.toString() + ", " 
                + right.toString();
        }
        return val.toString();
    }
}
class Main {
    public static void main(String[] args) {
        Node<Integer> root = new Node<Integer>(
            100, 
            new Node<Integer>(1), 
            new Node<Integer>(50, null, new Node<Integer>(7)));
        System.out.println(root.toString());
    }
}