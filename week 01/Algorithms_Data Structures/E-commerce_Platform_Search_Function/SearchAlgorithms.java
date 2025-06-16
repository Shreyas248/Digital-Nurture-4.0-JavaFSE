import java.util.Arrays;
import java.util.Comparator;

public class SearchAlgorithms {

    public static Product linearSearch(Product[] products, int targetId) {
        for (Product product : products) {
            if (product.getProductId() == targetId) {
                return product;
            }
        }
        return null;
    }

    public static Product binarySearch(Product[] products, int targetId) {
        int left = 0, right = products.length - 1;

        while (left <= right) {
            int mid = left + (right - left) / 2;
            if (products[mid].getProductId() == targetId)
                return products[mid];
            else if (products[mid].getProductId() < targetId)
                left = mid + 1;
            else
                right = mid - 1;
        }

        return null;
    }

    public static void sortProductsById(Product[] products) {
        Arrays.sort(products, Comparator.comparingInt(Product::getProductId));
    }
}
