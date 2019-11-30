

import java.io.BufferedReader;

import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.*;

    public class client {

        public static void main(String args[]) {
            Connection conn = null;
            try {

                Class.forName("com.mysql.cj.jdbc.Driver");
                String url = "jdbc:mysql://localhost:3306/CleanandGo?serverTimezone=UTC&useSSL=TRUE";
                String user = "student";
                String pass = "password";
                conn = DriverManager.getConnection(url, user, pass);

                

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
            System.out.println("(a) Employee. ");
            System.out.println("(b) Equipment. ");
            System.out.println("(c) Supplies. ");
            System.out.println("(d) Insert. ");
            System.out.println("(e) Expenses. ");
            System.out.println("(q) Quit. \n");
        }

    }
    
