package bk10;

public class temp {

    public double celsiusToFahrenheit(double celsius) {
        return (celsius * 9/5) + 32;
    }

    public double fahrenheitToCelsius(double fahrenheit) {
        return (fahrenheit - 32) * 5/9;
    }

    public static void main(String[] args) {
        temp converter = new temp();

        System.out.println("25°C to Fahrenheit: " + converter.celsiusToFahrenheit(25));
        System.out.println("77°F to Celsius: " + converter.fahrenheitToCelsius(77));
    }
}

