import java.util.ArrayList;
import java.util.Iterator;

class Main {
    public static void main(String[] args) {
        
        // Index iteration
        for (int i = 0; i < 5; i++) {
            System.out.print(i);
        }

        System.out.println();

        // For each loop
        int[] values = {0,1,2,3,4};
        for (int i : values) {
            System.out.print(i);
        }

        System.out.println();

        // Iterator
        ArrayList<Integer> valuesArray = new ArrayList<>();
        valuesArray.add(0);
        valuesArray.add(1);
        valuesArray.add(2);
        valuesArray.add(3);
        valuesArray.add(4);
        Iterator<Integer> iter = valuesArray.iterator();
        while(iter.hasNext()) {
            System.out.print(iter.next());
        }

        System.out.println();

        // Recursion
        RecLoop(0);

    }

    public static void RecLoop(int index) {
        System.out.print(index);
        index++;
        if (index < 5) {
            RecLoop(index);
        }
        return;
    }
}