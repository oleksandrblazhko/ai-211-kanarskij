import java.sql.*;  
import oracle.jdbc.driver.*;

class TestCases {
    public static void main(final String[] args) {
        int testCaseResult = 0; // 0 = Passed -1 = Failed
try {
            // load Oracle JDBC-driver
            DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
            
            // open connect to DB
            Connection con = DriverManager.getConnection(
                    "jdbc:oracle:thin:@91.219.60.189:1521/XEPDB1",
                    args[0], // get login as 1st command line parameter
                    args[1]); // get password as 2nd command line parameter 

            // create template string with PL/SQL-function "GetTemperature"
            CallableStatement cstmt1 = con.prepareCall("{? = call GetTemperature(?,?)}");
            cstmt1.registerOutParameter(1, Types.NUMERIC);

            // Test Case 1
            System.out.print("TC1 ( 'User is \"Anatoliy\" and region is \"Odessa\"' ) := ");
              cstmt1.setString(2, "Anatoliy");
            cstmt1.setString(3, "Odessa");
            cstmt1.executeUpdate();
p  ld
            // analyze TestCase-result
            if (cstmt1.getInt(1) == 1) {
                System.out.println("Passed");
            } else {System.out.println("Failed");
                 testCaseResult = -1;
            }
klm  sa
            // Test Case 2
            System.out.print("TC2 ( 'Empty user and region is \"Odessa\"' ) := ");
            cstmt1.setString(2, null);
            cstmt1.setString(3, "Odessa");
            cstmt1.executeUpdate();

            // analyze TestCase-result
            if (cstmt1.getInt(1) == -1) {
                System.out.println("Passed");
            } else {
                System.out.println("Failed");
                testCaseResult = -1;
            }

	    // Test Case 3
            System.out.print("TC3 ( 'User is \"Anatoliy\" and empty region' ) := ");
            cstmt1.setString(2, "Anatoliy");
            cstmt1.setString(3, null);
            cstmt1.executeUpdate();

            // analyze TestCase-result
            if (cstmt1.getInt(1) == -1) {
                System.out.println("Passed");
            } else {
                System.out.println("Failed");
                testCaseResult = -1;
            }

	    // Test Case 4
            System.out.print("TC4 ( 'User is \"Anatoliy\" and region is \"Odessa 2+2=4\"' ) := ");
            cstmt1.setString(2, "Anatoliy");
            cstmt1.setString(3, "Odessa 2+2=4");
            cstmt1.executeUpdate();

            // analyze TestCase-result
            if (cstmt1.getInt(1) == -1) {
                System.out.println("Passed");
            } else {
                System.out.println("Failed");
                testCaseResult = -1;
            }

	    // Test Case 5
            System.out.print("TC5 ( 'User is \"Anatoliy\" and region is \"I love chicken with sauce and you\"' ) := ");
            cstmt1.setString(2, "Anatoliy");
            cstmt1.setString(3, "I love chicken with sauce and you");
            cstmt1.executeUpdate();

            // analyze TestCase-result
            if (cstmt1.getInt(1) == -1) {
                System.out.println("Passed");
            } else {
                System.out.println("Failed");
                testCaseResult = -1;
            }

            // close connection
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        System.exit(testCaseResult);
    }
}
 
