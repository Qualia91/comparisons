import java.util.function.Consumer;
import java.time.Duration;
import java.time.Instant;
class Main {
    public static void main(String[] args) {
        
        // Recursion
        System.out.println("Fib number 20 is: " + FibRec(20));
        RunAndTime(Main::FibRec, "FibRec", 35);

        // Iterative
        System.out.println("Fib number 20 is: " + FibIter(20));
        RunAndTime(Main::FibIter, "FibIter", 100000);

    }

    public static int FibRec(int index) {
        if (index == 0) {
            return 0;
        } else if (index < 2) {
            return 1;
        } else {
            return FibRec(index - 1) + FibRec(index - 2);
        }
    }

    public static int FibIter(int index) {
        return FibIter(index, 0, 1);
    }

    public static int FibIter(int index, int acc, int next) {
        if (index == 0) {
            return acc;
        } else {
            return FibIter(index - 1, next, acc + next);
        }
    }

    public static void RunAndTime(Consumer<Integer> func, String name, int iters) {
        Instant start = Instant.now();
        func.accept(iters);
        Instant end = Instant.now();
        Duration timeElapsed = Duration.between(start, end);
        System.out.println(name + " took " + (timeElapsed.toMillis() / 1000.0) + " seconds to find fib number " + iters);
    }
}