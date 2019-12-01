import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.*;

public class Employee {
	public static Connection conn;
	
	public Employee(Connection c) {
		conn = c;
	}
	
	static void empMenu() {
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
                     	findEmpWeeklySchedule();
                     	break;
                     case '4': done = true;
                         break;
                     default:
                         System.out.println(" Not a valid option ");
                 } //switch
             } while (!done);


        }  catch (SQLException ex) {
            System.out.println(ex);
        } catch (IOException e) {
            e.printStackTrace();
        } 
	}
	
	private static void findEmpWeeklySchedule() throws SQLException, IOException {
    	Statement stmt = conn.createStatement();
    	String empID;
    	empID = readEntry("Enter Employee SSN: "); //use 111000111
    	System.out.println();
    	
    	String startDay, endDay;
    	startDay = readEntry("Enter Week Start Date: "); //use 2019-11-18 //use monday as start of week
    	endDay = readEntry("Enter Week End Date: "); //use 2019-11-24 //use sunday as end of week
    	String query = " select S.Workday, S.StartTime, S.EndTime\n" + 
    			"from Employee as E left join Eschedule as S\n" + 
    			"on E.SSN = S.ESSN\n" + 
    			"where (E.SSN = " + empID + " and S.Workday between " +  "\"" + startDay + "\"" + " and" + "\"" + endDay + "\"" + ");";
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

    static void printMenu() {
        System.out.println("\n        EMPLOYEE - QUERY OPTIONS ");
        System.out.println("(1) Employee Weekly Schedule.");
        System.out.println("(4) Quit. \n");
    }
}
