public class FinancialForecast {

    public static double predictFutureValue(double initialValue, double rate, int years) {
        if (years == 0) {
            return initialValue; 
        }
        return predictFutureValue(initialValue, rate, years - 1) * (1 + rate);
    }

    public static void main(String[] args) {
        double initialInvestment = 10000;
        double annualGrowthRate = 0.07; 
        int years = 5;

        double futureValue = predictFutureValue(initialInvestment, annualGrowthRate, years);
        System.out.printf("Predicted future value after %d years: %.2f\n", years, futureValue);
    }
}
