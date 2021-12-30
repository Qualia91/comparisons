import java.util.Collection;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.*;

class Main {
    public static void main(String[] args) {
        List<Integer> myList = new ArrayList<Integer>();
        for (int i = 1; i < 20; i++) {
            myList.add(i);
        }
        
        // Convert it into a Stream
        Stream<Integer> myStream = myList.stream();

        // Square elements
        // Take only ones less than 50
        // Multiply remaining together
        int result = myStream
            .map(elem -> elem * elem)
            .filter(elem -> elem < 50)
            .reduce(1, (acc, elem) -> acc * elem);

        System.out.println(result);
    }
}