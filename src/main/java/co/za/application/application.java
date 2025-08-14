package co.za.application;
import java.util.*;;

public class application {

    public static void main(String[] args) {
        System.out.println("Welcome to the Calculator Application!");
        Scanner scanner = new Scanner(System.in);
        System.out.print("Enter first number: ");
        double num1 = scanner.nextDouble();
        System.out.print("Enter second number: ");
        double num2 = scanner.nextDouble();
        System.out.print("Enter an operator (+, -, *, /): ");
        char operator = scanner.next().charAt(0);
        double result;
        switch (operator) {
            case '+':
                result = num1 + num2;
                break;
            case '-':
                result = num1 - num2;
                break;
            case '*':
                result = num1 * num2;
                break;
            case '/':
                result = num1 / num2;
                break;
            default:
                System.out.println("Invalid operator!");
                scanner.close();
                System.out.println("Please restart the application and try again.");
                return;
        }
        System.out.println("Result: " + result);

        scanner.close();
        System.out.println("Thank you for using the Calculator Application!");
    }

        
}
    

