import java.io.BufferedReader;

import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.*;

public class Client {

    public static void main(String args[]) {
        Connection conn = null;
        try {

            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/CleanandGo?serverTimezone=UTC&useSSL=TRUE";
            String user = "student";
            String pass = "password";
            conn = DriverManager.getConnection(url, user, pass);

            boolean done = false;
            do {
                printMenu();
                System.out.print("Type in your option: ");
                System.out.flush();
                String ch = readLine();
                System.out.println();
                switch (ch.charAt(0)) {
                    case '1':
                        Employee emp = new Employee(conn);
			emp.empMenu();
                        break;
                    case '2':
			Equipment equip = new Equipment(conn);
                        equip.equipMenu();
                        break;
                    case '3':
                        Supplies supply = new Supplies();
                        supply.supply(conn);
                        break;
                    case '4':
	                    Insert insert = new Insert();
                    	insert.insertMenu(conn);
                        break;
                    case '5':
                        AnnualExpense annual = new AnnualExpense();
                        annual.annual(conn);

                        break;
                    case 'q':
                        done = true;
                        break;
                    default:
                        System.out.println(" Not a valid option ");
                } //switch
            } while (!done);

        } catch (ClassNotFoundException e) {
            System.out.println("Could not load the driver");
        } catch (SQLException ex) {
            System.out.println(ex);
        }  finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) { /* ignored */}
            }
        }
    }

    static String readEntry(String prompt) {
        try {
            StringBuffer buffer = new StringBuffer();
            System.out.print(prompt);
            System.out.flush();
            int c = System.in.read();
            while(c != '\n' && c != -1) {
                buffer.append((char)c);
                c = System.in.read();
            }
            return buffer.toString().trim();
        } catch (IOException e) {
            return "";
        }
    }

    private static String readLine() {
        InputStreamReader isr = new InputStreamReader(System.in);
        BufferedReader br = new BufferedReader(isr, 1);
        String line = "";

        try {
            line = br.readLine();
        } catch (IOException e) {
            System.out.println("Error in SimpleIO.readLine: " +
                    "IOException was thrown");
            System.exit(1);
        }
        return line;
    }

    private static void printMenu() {

        // check correct login before going to this menu
        System.out.println("\n        SELECT OPTIONS ");
        System.out.println("(1) Employee. ");
        System.out.println("(2) Equipment. ");
        System.out.println("(3) Supplies. ");
        System.out.println("(4) Insert. ");
        System.out.println("(5) Expenses. ");
        System.out.println("(q) Quit. \n");
    }

}
    
