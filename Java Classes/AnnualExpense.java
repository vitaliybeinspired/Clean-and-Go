import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.*;
import java.text.DecimalFormat;

public class AnnualExpense {

    public static void annual(Connection conn) {
        try {

            boolean done = false;
            do {
                printMenu();
                System.out.print("Type in your option: ");
                System.out.flush();
                String ch = readLine();
                System.out.println();
                switch (ch.charAt(0)) {
                    case '1':
                        AnnualSupplyExpenses(conn);
                        break;
                    case '2':
                        annualExpenses(conn);
                        break;
                    case 'q':
                        done = true;
                        break;
                    default:
                        System.out.println(" Not a valid option ");
                } //switch
            } while (!done);


        } catch (SQLException ex) {
            System.out.println(ex);
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {

            }
        }
    }

    private static void AnnualSupplyExpenses(Connection conn) throws SQLException, IOException {

        //STEP1: CREATE VARIABLE OF TYPE STATEMENT
        Statement stmt = conn.createStatement();
        // STEP 2 DEFINE A STRING THAT IS = TO YOUR query SQL Statement
        // String query = ""
        String query = "select sum(AmountDue) as AnnualSupplyExpense\n" +
                "from Sells join Assets on Sells.A_ID = Assets.A_ID\n" +
                "\t\t   join CleanSupplies on Assets.A_ID = CleanSupplies.A_ID;";
        stmt = conn.prepareStatement(query);

        System.out.println("    Annual Supply Expenses");
        System.out.println("--------------------------------------------------\n");
        // Step 3: Declare a variable with ResultSet type
        ResultSet rset = stmt.executeQuery(query);
        while (rset.next()) {
            double Expense = rset.getDouble(1);

            System.out.printf("$%.2f\n", Expense);

        }


    }


    private static void annualExpenses(Connection c) throws SQLException, IOException {
        //statement and query
        Statement s = c.createStatement();
        String q = "SELECT(SELECT SUM(salary)FROM Employee) + (SELECT SUM(Rent)FROM Building) + (SELECT SUM(MaintPrice)FROM Equipment) + (SELECT SUM(AmountDue) FROM Sells);";
        s = c.prepareStatement(q);

        //iterating through rset from query
        ResultSet r = s.executeQuery(q);
        while (r.next()) {
            double count = r.getDouble(1);
            System.out.printf("$%.2f\n", count);
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
        System.out.println("\n *************************************" +
                "\n     1. Expenses " +
                "\n *************************************");
        System.out.println("(1) Annual Cleaning Supply Expenses. ");
        System.out.println("(2) Annual Expenses. ");
        System.out.println("(q) Quit. \n");
    }

}