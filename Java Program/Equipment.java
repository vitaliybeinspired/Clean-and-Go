import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.*;


public class Equipment {
	public static Connection conn;
	
	public Equipment(Connection c) {
		conn = c;
	}
	
	static void equipMenu() {
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
                     	findWeeklyEquipmentMschedule();
                     	break;
                     case '2':
                     	findAvgDailyEquipmentUsage();
                     	break;
                     case '3':
                     	CountEquipment();
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
	


	static void findWeeklyEquipmentMschedule() throws SQLException, IOException {
		Statement stmt = conn.createStatement();
		//enter date of beginning/end of week
		String startDay, endDay;
		startDay = readEntry("Enter Week Start Date (Use complete date - YYYY-MM-DD): "); //use 2019-11-18 //use monday as start of week
		endDay = readEntry("Enter Week End Date (Use complete date - YYYY-MM-DD): "); //use 2019-11-24 //use sunday as end of week
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

	static void findAvgDailyEquipmentUsage() throws SQLException, IOException {
		Statement stmt = conn.createStatement();
		String year;
		year = readEntry("Enter year: ");
		String query = "select E.E_ID as EquipmentID, count(U.A_ID)/365 as AvgDailyUsage\n" + 
					"from Equipment as E left join Uses as U\n" + 
					"on E.A_ID = U.A_ID\n" + 
					"where (U.TimeofUse between " + "\"" + year + "-01-01 00:00:00\" and \"" + year + "-12-31 23:59:59\")\n" + 
					"group by E.E_ID asc;";
		PreparedStatement p = conn.prepareStatement(query);
	
		ResultSet rset;
	
		ResultSet r = stmt.executeQuery(query);
		System.out.println("          Equipment Average Daily Usage in: " + year);
		System.out.println("--------------------------------------------------\n");
		while(r.next()) {
			String EquipmentID = r.getString(1);
			String AvgUsage = r.getString(2);
			System.out.println("EquipmentID: " + EquipmentID + ", " + "AvgUsage: " + AvgUsage);
		}
	
		System.out.println("--------------------------------------------------\n");
	
	}
	
	static void CountEquipment() throws SQLException, IOException {
    	//statement and query
    	Statement s = conn.createStatement();
    	String q = "SELECT E_Type, Count(*) FROM Equipment AS TotalEquipment GROUP BY E_Type;";
    	s = conn.prepareStatement(q);
    	
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

    static void printMenu() {
        System.out.println("\n        EQUIPMENT - QUERY OPTIONS ");
        System.out.println("(1) Weekly Maintenance Schedule of Equipment.");
        System.out.println("(2) Average Daily Usage of Equipment for the current year.");
        System.out.println("(3) Total Number of Equipment.");
        
        System.out.println("(4) Quit. \n");
    }
}

