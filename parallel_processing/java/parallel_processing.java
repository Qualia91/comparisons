import java.util.ArrayList;
import java.util.concurrent.Future;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
class Main {
    public static ExecutorService executor = 
        Executors.newFixedThreadPool(5);
    public static void main(String[] args) throws Exception {
        int[][] matrix = {
            {0,1,2,3,4},
            {5,6,7,8,9},
            {10,11,12,13,14},
            {5,6,7,8,9},
            {0,1,2,3,4}
        };
        ArrayList<Future<int[]>> futures = new ArrayList<>();
        for (int i = 0; i < matrix.length; i++) {
            futures.add(calculate(matrix[i]));
        }
        int index = 0;
        for (Future<int[]> future : futures) {
            int[] updatedRow = future.get();
            for (int i = 0; i < updatedRow.length; i++) {
                matrix[index][i] = updatedRow[i];
            }
        }
        printMatrix(matrix);
        executor.shutdownNow();
    }
    public static Future<int[]> calculate(int[] row) {        
        return executor.submit(() -> {
            for (int i = 0; i < row.length; i++) {
                row[i] = row[i] * 2;
            }
            return row;
        });
    }
    public static void printMatrix(int[][] matrix) {        
        for (int i = 0; i < matrix.length; i++) {
            for (int j = 0; j < matrix[i].length; j++) {
                System.out.printf("%3d", matrix[i][j]);
            }
            System.out.println();
        }
    }
}