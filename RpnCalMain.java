
import java.io.Console;
import java.text.DecimalFormat;
import java.util.Stack;

public class RpnCalMain {

    static String command;
    static boolean newCommand = false;



    public static void main(String[] args) {

        Console console = System.console();
        if (console == null) {
            System.err.println("No console is available to run RPN.");
            System.exit(1);
        }
        
        //System.out.println(console);
    	//System.out.println(command);
    	//System.out.println(newCommand);
    	
        Calculator calculator = new Calculator();
        //System.out.println(calculator);

        System.out.println("Enter your expression to calculate RPN :, or 'exit:' to quit:");

        boolean keepRunning = true;
        while (keepRunning) {
            String inputString = console.readLine(": ");
            
            if ("exit".equals(inputString)) 
            {
                keepRunning = false;
             } 
            else 
            {
                try {
         			//System.out.println(inputString);
               
                    calculator.eval(inputString);
                    
                
                     } 
                     catch (CalculatorException e) 
                     {
                            System.out.println(e.getMessage());
                	 }

                DecimalFormat fmt = new DecimalFormat("0.##########");
         		//System.out.println(fmt);
                
                Stack<Double> stack = calculator.getValuesStack();
         		//System.out.println(stack);

                System.out.print("Stack: ");
                for (Double value : stack) 
                {
                    System.out.print(fmt.format(value));
                    System.out.print(" ");
                }
                //System.out.printf("%n prem");
                System.out.printf("%n");
            }
        }
    }
}
