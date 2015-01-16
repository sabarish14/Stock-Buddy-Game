package sample;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;

public class MySQLAccess {
  private Connection connect = null;
  private Statement statement = null;
  private PreparedStatement preparedStatement = null;
  private ResultSet resultSet = null;

  public void readDataBase() throws Exception {
    //try {
      // this will load the MySQL driver, each DB has its own driver
      Class.forName("com.mysql.jdbc.Driver");
      System.out.println("Loaded driver");
      // setup the connection with the DB.
      // setup the connection with the DB.
      
      Connection Hello = DriverManager.getConnection("jdbc:mysql://localhost:3306/se_project", "root", "ramya");
      System.out.println("DB connected");
    	}
} 

