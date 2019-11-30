import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.*;


public class Equipment {
	Connection conn;
	
	public Equipment() {
		try {

	        Class.forName("com.mysql.cj.jdbc.Driver");
	        String url = "jdbc:mysql://localhost:3306/CleanandGo?serverTimezone=UTC&useSSL=TRUE";
	        String user, pass;
//	        user = readEntry("userid : ");
//	        pass = readEntry("password: ");
	        user = "student";
	        pass = "password";
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
	                	findWeeklyEquipmentMschedule(conn);
	                	break;
	                case '2':
	                	findAvgDailyEquipmentUsage(conn);
	                	break;
	                case '3':
	                	CountEquipment(conn);
	                	break;
	                case '4': done = true;
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
		startDay = readEntry("Enter Week Start Date: "); //use 2019-11-18 //use monday as start of week
		endDay = readEntry("Enter Week End Date: "); //use 2019-11-24 //use sunday as end of week
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

//	

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
	
	private static void CountEquipment(Connection c) throws SQLException, IOException {
    	//statement and query
    	Statement s = c.createStatement();
    	String q = "SELECT E_Type, Count(*) FROM Equipment AS TotalEquipment GROUP BY E_Type;";
    	s = c.prepareStatement(q);
    	
    	//iterating through rset from query
    	ResultSet r = s.executeQuery(q);
    	System.out.println("          Total Number of Equipment ");
		System.out.println("--------------------------------------------------\n");
    	while(r.next())
    	{
    		String eType = r.getString(1);
    		int count = r.getInt(2);
    		System.out.println("Type: " + eType + ", Count: " + count);
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

    private static void printMenu() {
        System.out.println("\n        QUERY OPTIONS ");
        System.out.println("(1) Weekly Maintenance Schedule of Equipment.");
        System.out.println("(2) Average Daily Usage of Equipment for the current year.");
        System.out.println("(3) Total Number of Equipment.");
        
        System.out.println("(4) Quit. \n");
    }
}

//private static void findEmpWeeklySchedule(Connection conn) throws SQLException, IOException {
//	Statement stmt = conn.createStatement();
//	String empID;
//	empID = readEntry("Enter Employee SSN: "); //use 111000111
//	System.out.println();
//
//	String startDay, endDay;
//	startDay = readEntry("Enter Week Start Date: "); //use 2019-11-18 //use monday as start of week
//	endDay = readEntry("Enter Week End Date: "); //use 2019-11-24 //use sunday as end of week
//	String query = " select S.Workday, S.StartTime, S.EndTime\n" + 
//		"from Employee as E left join Eschedule as S\n" + 
//		"on E.SSN = S.ESSN\n" + 
//		"where (E.SSN = " + empID + " and S.Workday between " +  "\"" + startDay + "\"" + " and" + "\"" + endDay + "\"" + ");";
//	PreparedStatement p = conn.prepareStatement(query);
//
//	ResultSet rset;
//
//	ResultSet r = stmt.executeQuery(query);
//	System.out.println("          Employee Schedule for " + empID );
//	System.out.println("--------------------------------------------------\n");
//	while(r.next()) {
//		String Workday = r.getString(1);
//		String StartTime = r.getString(2);
//		String EndTime = r.getString(3);
//		System.out.println("Workday: " + Workday + ", " + "StartTime: " + StartTime + ", " + "EndTime: " + EndTime);
//	}
//
//	System.out.println("--------------------------------------------------\n");
//
//}
