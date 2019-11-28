import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.*;

    public class Template {

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
                        case 'a':
                        	findWeeklyEquipmentMschedule(conn);
                        	break;
                        case 'b':
                        	findAvgDailyEquipmentUsage(conn);
                        	break;
                        case 'c':
                        	findEmpWeeklySchedule(conn);
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
        
        private static void findWeeklyEquipmentMschedule(Connection conn) throws SQLException, IOException {
        	Statement stmt = conn.createStatement();
        	//enter date of beginning/end of week
        	String startDay, endDay;
        	startDay = readEntry("Enter Week Start Date: "); //2019-11-18
        	endDay = readEntry("Enter Week End Date: "); //2019-11-24
        	String query = "select ME.NextMaintDate as WeeklyMaintenanceSchedule,  ME.EquipmentID\n" + 
        					"from MSchedule as ME\n" + 
        					"where (ME.EquipmentID = 01 and  ME.NextMaintDate between" + "\"" + startDay + "\"" + " and" + "\"" + endDay + "\"" + "); ";
        	PreparedStatement p = conn.prepareStatement(query);
        	
        	ResultSet rset;
        	
        	ResultSet r = stmt.executeQuery(query);
        	System.out.println("          Weekly Maintenance Schedule of Equipment ");
        	System.out.println("--------------------------------------------------\n");
        	while(r.next()) {
        		String WeeklyMaintenanceSchedule = r.getString(1);
        		System.out.println("Maintenance needed: " + WeeklyMaintenanceSchedule);
        	}
        	
        	System.out.println("--------------------------------------------------\n");
        	
        }
        
        private static void findEmpWeeklySchedule(Connection conn) throws SQLException, IOException {
        	Statement stmt = conn.createStatement();
        	String empID;
        	empID = readEntry("Enter Employee SSN: ");
        	System.out.println();
        	
        	String query = " select S.Workday, S.StartTime, S.EndTime\n" + 
        			"from Employee as E left join Eschedule as S\n" + 
        			"on E.SSN = S.ESSN\n" + 
        			"where (E.SSN = " + empID + " and S.Workday between \"2019-11-18\" and \"2019-11-24\");";
        	PreparedStatement p = conn.prepareStatement(query);
        	
        	ResultSet rset;
        	
        	ResultSet r = stmt.executeQuery(query);
        	System.out.println("          Employee Schedule for " + empID );
        	System.out.println("--------------------------------------------------\n");
        	while(r.next()) {
        		String Workday = r.getString(1);
        		String StartTime = r.getString(2);
        		String EndTime = r.getString(3);
        		System.out.println("Workday: " + Workday + ", " + "StartTime: " + StartTime + ", " + "EndTime: " + EndTime);
        	}
        	
        	System.out.println("--------------------------------------------------\n");
        	
        }
        
        private static void findAvgDailyEquipmentUsage(Connection conn) throws SQLException, IOException {
        	Statement stmt = conn.createStatement();
        	String query = "select E.E_ID as EquipmentID, count(U.A_ID)/365 as AvgDailyUsage\n" + 
        				"from Equipment as E left join Uses as U\n" + 
        				"on E.A_ID = U.A_ID\n" + 
        				"where (U.TimeofUse between \"2019-01-01 00:00:00\" and \"2019-12-31 23:59:59\")\n" + 
        				"group by E.E_ID asc;";
        	PreparedStatement p = conn.prepareStatement(query);
        	
        	ResultSet rset;
        	
        	ResultSet r = stmt.executeQuery(query);
        	System.out.println("          Equipment Average Daily Usage ");
        	System.out.println("--------------------------------------------------\n");
        	while(r.next()) {
        		String EquipmentID = r.getString(1);
        		String AvgUsage = r.getString(2);
        		System.out.println("EquipmentID: " + EquipmentID + ", " + "AvgUsage: " + AvgUsage);
        	}
        	
        	System.out.println("--------------------------------------------------\n");
        	
        }

        private static void findHighestPaid(Connection conn) throws SQLException, IOException {

            //STEP1: CREATE VARIABLE OF TYPE STATEMENT
            Statement stmt = conn.createStatement();
           // STEP 2 DEFINE A STRING THAT IS = TO YOUR query SQL Statement
            String query = "select lname, ssn, salary from employee order by salary";
            PreparedStatement p = conn.prepareStatement(query);
            
           

            // Step 3: Declare a variable with ResultSet type
            ResultSet rset;
            //Execute your Query and store the return in the declared variable from step 3
            ResultSet r = stmt.executeQuery(query);
            while(r.next()) {
            	String lname = r.getString(1);
            	String ssn = r.getString(2);
            	double salary = r.getDouble(3);
            	
            	System.out.println(lname + " " + ssn + " " + salary);
            }
            
               

            System.out.println("    HIGHEST PAID WORKERS");
            System.out.println("--------------------------------------------------\n");

            // Write a loop to read all the returned rows from the query execution


           //Close the statement
            //Close objects
            p.close();
            conn.close();
        }


        private static void findMostWorked(Connection conn) throws SQLException, IOException {

          // Complete this method following the same steps above to return the required information

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
            System.out.println("\n        QUERY OPTIONS ");
            System.out.println("(a) Weekly Maintenance Schedule of Equipment.");
            System.out.println("(b) Average Daily Usage of Equipment for the current year.");
            System.out.println("(c) Print Employee Schedule.");
            
            System.out.println("(q) Quit. \n");
        }

    }

