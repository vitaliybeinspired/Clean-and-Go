import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.*;

    public class Supplies {

        public static void main(String args[]) {
            Connection conn = null;
            try {

                Class.forName("com.mysql.cj.jdbc.Driver");
                String url = "jdbc:mysql://localhost:3306/CleanandGo?serverTimezone=UTC&useSSL=TRUE";
                String user, pass;
                user = readEntry("userid : ");
                pass = readEntry("password: ");
                conn = DriverManager.getConnection(url, user, pass);

                boolean done = false;
                do {
                    printMenu();
                    System.out.print("Type in your option: ");
                    System.out.flush();
                    String ch = readLine();
                    System.out.println();
                    switch (ch.charAt(0)) {
                        case '1': ProductSuppliers(conn);
                            break;
                        case '2':
                            CleaningSuppliesAlert(conn);
                            break;
                        case 'q': done = true;
                            break;
                        default:
                            System.out.println(" Not a valid option ");
                    } //switch
                } while (!done);


            } catch (ClassNotFoundException e) {
                System.out.println("Could not load the driver");
            } catch (SQLException ex) {
                System.out.println(ex);
            } catch (IOException e) {
                e.printStackTrace();
            } finally {
                if (conn != null) {
                    try {
                        conn.close();
                    } catch (SQLException e) { /* ignored */}
                }
            }
        }

        private static void ProductSuppliers(Connection conn) throws SQLException, IOException {

            //STEP1: CREATE VARIABLE OF TYPE STATEMENT
            Statement stmt = conn.createStatement();
           // STEP 2 DEFINE A STRING THAT IS = TO YOUR query SQL Statement
           // String query = ""
            String query = "select Supplier_Name, Cname as Item\n" +
                    "from Supplier join Sells on Supplier.Supplier_ID = Sells.Supplier_ID \n" +
                    "\t\t\t  join Assets on Sells.A_ID = Assets.A_ID \n" +
                    "              join CleanSupplies on Assets.A_ID = CleanSupplies.A_ID;";

            stmt = conn.prepareStatement(query);

            System.out.println("    Product Suppliers");
            System.out.println("--------------------------------------------------\n");
            // Step 3: Declare a variable with ResultSet type
            ResultSet rset = stmt.executeQuery(query);
            while(rset.next()){
                String Supplier_Name = rset.getString(1);
                String Item = rset.getString(2);
                System.out.println(Supplier_Name + ": " + Item);
            }

            //Execute your Query and store the return in the declared variable from step 3



            // Write a loop to read all the returned rows from the query execution


           //Close the statement

        }


        private static void CleaningSuppliesAlert(Connection conn) throws SQLException, IOException {
            //STEP1: CREATE VARIABLE OF TYPE STATEMENT
            Statement stmt = conn.createStatement();
            // STEP 2 DEFINE A STRING THAT IS = TO YOUR query SQL Statement
            // String query = ""
            String query = "select *\n" +
                    "from CleanSupplies\n" +
                    "where Inventory < SafetyInfo;";
            stmt = conn.prepareStatement(query);

            System.out.println("    Cleaning Supplies Alert");
            System.out.println("--------------------------------------------------\n");
            // Step 3: Declare a variable with ResultSet type
            ResultSet rset = stmt.executeQuery(query);
            while(rset.next()){
                String A_ID = rset.getString(1);
                String CName = rset.getString(2);
                String CUsage = rset.getString(3);
                String Inventory = rset.getString(4);
                String SafetyInfo = rset.getString(5);

                System.out.println(A_ID + " " + CName + " " + CUsage + " " + Inventory + " " + SafetyInfo);
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
            System.out.println("\n *************************************" +
                               "\n     2.Supplies " +
                               "\n *************************************");
            System.out.println("(1) Product suppliers. ");
            System.out.println("(2) Cleaning Supplies Alert. ");
            System.out.println("(q) Quit. \n");
        }

/// NOT PART OF THIS MENU
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
            while(rset.next()){
                double Expense = rset.getDouble(1);
                System.out.println("$" + Expense);
            }


        }




    }

