package user;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Connection;





import javax.servlet.RequestDispatcher;

import com.mysql.jdbc.Statement;



public class User {
	
	Connection connect_db()
	{
		Connection con=null;
		try
		{ 
			
		    // this will load the MySQL driver, each DB has its own driver
		    Class.forName("com.mysql.jdbc.Driver");
		  System.out.println("Loaded driver");
		    // setup the connection with the DB.
		     con=null;
		    con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/se_project", "root", "ramya");
		    System.out.println("DB connected"); 
		    return con;
		 
		 } 
		 catch(java.lang.Exception e) { 
		 e.printStackTrace(); 
		 System.err.print(e.getClass().getName()); 
		 System.err.println(e.getMessage()); 
		 
		 }
		return con;
	}
		
	public int register(String uname,String pwd, String title,String fname,String lname,String mobno,String email)
	{
	try{
				  
				  Connection con=this.connect_db();
				  String sql = 
				  "insert into user values (?,?,?,?,?,?,?,?)";
				  PreparedStatement pst = 
				  con.prepareStatement(sql);
				  System.out.println("3");
				  pst.setString(1, uname);
				  System.out.println("a");
				  pst.setString(2, pwd);
				  System.out.println("b");
				  pst.setString(3, title);
				  System.out.println("c");
				  pst.setString(4, fname);
				  System.out.println("d");
				  pst.setString(5, lname);
				  System.out.println("e");
				  pst.setString(6, mobno);
				  System.out.println("f");
				  pst.setString(7, email);
				  pst.setFloat(8, 0);
				  System.out.println("g");
				  pst.executeUpdate();
				  System.out.println("4");
				   sql = 
						  "insert into wallet values (?,?)";
				   pst=con.prepareStatement(sql);
				   con.prepareStatement(sql);
				   pst.setString(1, uname);
				   pst.setInt(2, 1000);
				   pst.executeUpdate();
				  pst.close();
				  con.close();
				  return 1;
			}
			catch(SQLException e)
			{
				  System.out.println("SQLException caught: " 
				  + e.getMessage());
			}
			return 1;
				  

		}
	public int update(String uname,String pwd, String title,String fname,String lname,String mobno,String email)
	{
	try{
				  
				  Connection con=this.connect_db();
				  String sql = 
				  "update user set pass_wd=?, first_name=? last_name= values (?,?,?,?,?,?,?,?)";
				  PreparedStatement pst = 
				  con.prepareStatement(sql);
				  System.out.println("3");
				  pst.setString(1, uname);
				  System.out.println("a");
				  pst.setString(2, pwd);
				  System.out.println("b");
				  pst.setString(3, title);
				  System.out.println("c");
				  pst.setString(4, fname);
				  System.out.println("d");
				  pst.setString(5, lname);
				  System.out.println("e");
				  pst.setString(6, mobno);
				  System.out.println("f");
				  pst.setString(7, email);
				  pst.setFloat(8, 0);
				  System.out.println("g");
				  pst.executeUpdate();
				  System.out.println("4");
				   sql = 
						  "insert into wallet values (?,?)";
				   pst=con.prepareStatement(sql);
				   con.prepareStatement(sql);
				   pst.setString(1, uname);
				   pst.setInt(2, 1000);
				   pst.executeUpdate();
				  pst.close();
				  con.close();
				  return 1;
			}
			catch(SQLException e)
			{
				  System.out.println("SQLException caught: " 
				  + e.getMessage());
			}
			return 1;
				  

		}

	public String login_check(String uname,String pwd)
	{
		int flag=0;
		String first_name="";
		try{
							
			Connection con=this.connect_db();
		
			String sql = 
						  "select user_name,passwd,first_name from user where user_name=?";
							PreparedStatement pst = 
									  con.prepareStatement(sql);
							pst.setString(1, uname);
							 ResultSet rs;
							  rs = pst.executeQuery();
								while(rs.next())
								{
										
										String uname1=rs.getString("user_name");
										String pwd1=rs.getString("passwd");
										
										if(pwd1.equals(pwd) && uname1.equals(uname))
										{                               
											flag=1;
											first_name=rs.getString("first_name");
											break;
										}
								}
								return first_name;
		
				}
		catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		return first_name;
	}
	public String[] fetchPassword(String email)
	{
		
		String uname1="";
		String pwd1="";
		String uname_passwd[]=new String[2];
		try{
							
			Connection con=this.connect_db();
		
			String sql = 
						  "select user_name,passwd from user where email_id=?";
							PreparedStatement pst = 
									  con.prepareStatement(sql);
							pst.setString(1, email);
							 ResultSet rs;
							  rs = pst.executeQuery();
								while(rs.next())
								{
										
										uname1=rs.getString("user_name");
										pwd1=rs.getString("passwd");
										
										
								}
								uname_passwd[0]=uname1;
								uname_passwd[1]=pwd1;
								return uname_passwd;
		
				}
		catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		return uname_passwd;
	}

public int check_bal(String uname)
{
	
	int balance=0;	
	try{
					
		Connection con=this.connect_db();
	
		String sql = 
					  "select balance from wallet where user_name=?";
						PreparedStatement pst = 
								  con.prepareStatement(sql);
						pst.setString(1, uname);
						System.out.println(uname);
						 ResultSet rs;
						  rs = pst.executeQuery();
							while(rs.next())
							{
									
									balance=rs.getInt("balance");
							}
							System.out.print(balance);
							return balance;
		}
		catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
	}
	return balance;
}
public void updateBalance(String uname,int balance)
{			
		Connection con=this.connect_db();
		try
		{
			String sql ="Update wallet set balance=? where user_name=?";
			PreparedStatement pst=con.prepareStatement(sql);
			con.prepareStatement(sql);
			pst.setInt(1, balance);
			pst.setString(2,uname);
			pst.executeUpdate();
			pst.close();
			con.close();
		}
		catch(Exception e)
		{
			
		}
}
//Clears the users transactions data and resets balance to 1000;
public void resetAccount(String uname)
{
	  Statement sqlStatement = null;
	  try
	  {
		  Connection con=this.connect_db();
		  String sql="Delete from transactions where user_name=?" ; 
	      PreparedStatement pst =con.prepareStatement(sql);
	      pst.setString(1, uname);
	      int rowsAffected = pst.executeUpdate();
	      
	      
		   sql="Delete from purchase1 where user_name=?" ; 
	       pst =con.prepareStatement(sql);
	      pst.setString(1, uname);
		 rowsAffected = pst.executeUpdate();
		 
		 
		  sql="Delete from watchlist where user_name=?" ; 
	       pst =con.prepareStatement(sql);
	      pst.setString(1, uname);
		 rowsAffected = pst.executeUpdate();
		 
		 sql="Delete from sell1 where user_name=?" ; 
	       pst =con.prepareStatement(sql);
	      pst.setString(1, uname);
		 rowsAffected = pst.executeUpdate();
		 System.out.println("balance module");
		  updateBalance(uname, 1000);
	  }
	  catch(SQLException e)
	  {
		  System.out.println("SQLException caught: " 
		  + e.getMessage());
	  }
}
public void insert_threshold(String uname,float threshold)
{
	Connection con=this.connect_db();
	  String  sql = 
			  "update user set threshold=? where user_name=?";
	  try
	  {
		    PreparedStatement pst =con.prepareStatement(sql);
		   con.prepareStatement(sql);
		   pst.setString(2, uname);
		   pst.setFloat(1, threshold);
		   pst.executeUpdate();
		  pst.close();
		  con.close();
	  }
	  catch(Exception e)
	  {
		  
	  }
}
public String fetch_email(String uname)
{
	
	String email="";
	try{
						
		Connection con=this.connect_db();
	
		String sql = 
					  "select email_id from user where user_name=?";
						PreparedStatement pst = 
								  con.prepareStatement(sql);
						pst.setString(1, uname);
						 ResultSet rs;
						  rs = pst.executeQuery();
							while(rs.next())
							{
									
									 email=rs.getString("email_id");
									
									
							}									
						
	
			}
	catch (SQLException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	}
	return email;
}
}