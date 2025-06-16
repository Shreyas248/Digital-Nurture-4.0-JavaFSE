public class Main {
    public static void main(String[] args) {
        Product[] products = {
            new Product(101, "Laptop", "Electronics"),
            new Product(203, "Shoes", "Footwear"),
            new Product(150, "Phone", "Electronics"),
            new Product(99, "Book", "Stationery")
        };

        // Linear Search
        Product result1 = SearchAlgorithms.linearSearch(products, 150);
        System.out.println("Linear Search Result: " + (result1 != null ? result1 : "Not Found"));

        // Sort for Binary Search
        SearchAlgorithms.sortProductsById(products);

        // Binary Search
        Product result2 = SearchAlgorithms.binarySearch(products, 150);
        System.out.println("Binary Search Result: " + (result2 != null ? result2 : "Not Found"));
    }
}
