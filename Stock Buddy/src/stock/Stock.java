package stock;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Connection;





import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;

import javax.servlet.RequestDispatcher;



public class Stock {
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
		
	public int insert_watchlist(String uname,String stock_name,int price)
	{
	try{
				  
				  Connection con=this.connect_db();
				  String sql = 
				  "insert into watchlist values (?,?)";
				  PreparedStatement pst = 
				  con.prepareStatement(sql);
				  
				  pst.setString(1, uname);
				  System.out.println("a");
				  pst.setString(2, stock_name);
				  
				  pst.executeUpdate();
				  sql="Update stock set stock_val=? where symbol=?";
				   pst =con.prepareStatement(sql);
				  pst.setInt(1, price);
				  
				  System.out.println("a");
				  pst.setString(2, stock_name);
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
	public int fetch_stock_val(String stock_name)
	{
		int flag=0;
		int stock_val=0;
		try{
							
			Connection con=this.connect_db();
		
			String sql = 
						  "select stock_val from stock where stock_symbol=?";
							PreparedStatement pst = 
									  con.prepareStatement(sql);
							pst.setString(1, stock_name);
							ResultSet rs;
							rs = pst.executeQuery();
							while(rs.next())
							{
								stock_val=rs.getInt("stock_val");		
							}
							return stock_val;
		
				}
		catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		return stock_val;
	}
	public int purchased_shares(String username,String stock_name)
	{
		int num_shares_purchased=0;
		try{
		Connection con=this.connect_db();
		System.out.println("username"+username);
		String sql = 
				  "select num_shares from purchase1 where stock_name=? and user_name=?";
					PreparedStatement pst = 
							  con.prepareStatement(sql);
					pst.setString(1, stock_name);
					pst.setString(2, username);
					ResultSet rs;
					rs = pst.executeQuery();
					while(rs.next())
					{
						num_shares_purchased=rs.getInt(1);		
					}
					return num_shares_purchased;
		}
		catch(Exception e)
		{
			
		}
					return num_shares_purchased;

	}
	public void purchase(String user_name,int num_shares,String stock_name)
	{
	try{
		 	      System.out.println("Try");
		 	     System.out.println("num_shares"+num_shares);
		 	   
				  Connection con=this.connect_db();
				  int num_shares_purchased=this.purchased_shares(user_name, stock_name);
				  
				  if (num_shares_purchased>0)
				  {
					  System.out.println("if");
					  num_shares_purchased+=num_shares;
					  System.out.println("num_shares_purchased"+num_shares_purchased);
					  String sql = 
							  "update purchase1 set num_shares=? where user_name=? and stock_name=?";
							  PreparedStatement pst = 
							  con.prepareStatement(sql);
							  pst.setInt(1, num_shares_purchased);
							  pst.setString(2, user_name);
							  pst.setString(3, stock_name);
							  pst.executeUpdate();
				  }
				  else{
					  System.out.println("else");
					  String sql = 
							  "insert into purchase1 (user_name,num_shares,stock_name) values (?,?,?)";
							  PreparedStatement pst = 
							  con.prepareStatement(sql);
							  pst.setString(1, user_name);
							  System.out.println("b");
							  pst.setInt(2, num_shares);
							  pst.setString(3, stock_name);
							  pst.executeUpdate();
							  pst.close();
				  }
				  
				  
				  
				  con.close();
	}
	catch(SQLException e)
	{
		  System.out.println("SQLException caught: " 
		  + e.getMessage());
	}
	
	
   }
	public int sell_shares(String username,String stock_name)
	{
		int num_shares_purchased=0;
		try{
		Connection con=this.connect_db();
		System.out.println("username"+username);
		String sql = 
				  "select num_shares from sell1 where stock_name=? and user_name=?";
					PreparedStatement pst = 
							  con.prepareStatement(sql);
					pst.setString(1, stock_name);
					pst.setString(2, username);
					ResultSet rs;
					rs = pst.executeQuery();
					while(rs.next())
					{
						num_shares_purchased=rs.getInt(1);		
					}
					return num_shares_purchased;
		}
		catch(Exception e)
		{
			
		}
					return num_shares_purchased;

	}
	public void sell(String user_name,int num_shares,String stock_name)
	{
	try{
		 	      //System.out.println("Try");
				  Connection con=this.connect_db();
				  int num_shares_sold=this.sell_shares(user_name, stock_name);
				  if (num_shares_sold>0)
				  {
					  
					  num_shares_sold+=num_shares;
					  String sql = 
							  "update sell1 set num_shares=? where user_name=? and stock_name=?";
							  PreparedStatement pst = 
							  con.prepareStatement(sql);
							  pst.setInt(1, num_shares_sold);
							  pst.setString(2, user_name);
							  pst.setString(3, stock_name);
							  pst.executeUpdate();
					}
				   else{
					  System.out.println("else");
					  String sql = 
							  "insert into sell1 (user_name,num_shares,stock_name) values (?,?,?)";
							  PreparedStatement pst = 
							  con.prepareStatement(sql);
							  pst.setString(1, user_name);
							  System.out.println("b");
							  pst.setInt(2, num_shares);
							  pst.setString(3, stock_name);
							  pst.executeUpdate();
							  pst.close();
				   		}	
				  this.sell_purchase(user_name, num_shares, stock_name);
				  
				  
				  
				  con.close();
	}
	catch(SQLException e)
	{
		  System.out.println("SQLException caught: " 
		  + e.getMessage());
	}
	
	
   }
	public void sell_purchase(String user_name,int num_shares,String stock_name)
	{
	try{
		 	      System.out.println("Try");
		 	     System.out.println("num_shares"+num_shares);
		 	   
				  Connection con=this.connect_db();
				  int num_shares_purchased=this.purchased_shares(user_name, stock_name);
					  System.out.println("if");
					  num_shares_purchased-=num_shares;
					  System.out.println("num_shares_purchased"+num_shares_purchased);
					  String sql = 
							  "update purchase1 set num_shares=? where user_name=? and stock_name=?";
							  PreparedStatement pst = 
							  con.prepareStatement(sql);
							  pst.setInt(1, num_shares_purchased);
							  pst.setString(2, user_name);
							  pst.setString(3, stock_name);
							  pst.executeUpdate();
							  pst.close();
							  con.close();
	}
	catch(SQLException e)
	{
		  System.out.println("SQLException caught: " 
		  + e.getMessage());
	}
	
	
   }
	public void transaction(String user_name,int num_shares, int amount,String stock_name,String buy_sell)
	{
	try{
				  
				  Connection con=this.connect_db();
				  String sql = 
				  "insert into transactions(user_name,num_shares,amt,date_time,stock_name,buy_sell) values (?,?,?,?,?,?)";
				  PreparedStatement pst = 
				  con.prepareStatement(sql);
				  System.out.println("3");
				  pst.setString(1, user_name);
				  System.out.println("a");
				  //pst.setInt(2, transaction_id);
				  System.out.println("b");
				  pst.setInt(2, num_shares);
				  pst.setInt(3, amount);
				  DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
				   //get current date time with Date()
				   Date date = new Date();
				   java.sql.Date d=new java.sql.Date(date.getTime());
				// java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
				 pst.setDate(4, d);
				  pst.setString(5, stock_name);
				  pst.setString(6, buy_sell);
				  pst.executeUpdate();
				  pst.close();
				  con.close();
	}
	catch(SQLException e)
	{
		  System.out.println("SQLException caught: " 
		  + e.getMessage());
	}
  }
	public ArrayList fetch_watchlist_companies(String uname)
	{
		
		ArrayList watchlist=new ArrayList();
		
		try{
							
			Connection con=this.connect_db();
			
			String sql = 
						  "select * from watchlist where user_name=?";
							PreparedStatement pst = 
									  con.prepareStatement(sql);
							pst.setString(1, uname);
							 ResultSet rs;
							  rs = pst.executeQuery();
								while(rs.next())
								{
										
										watchlist.add(rs.getString(1));
								}
								return watchlist;
		
				}
		catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		return watchlist;
		
	}

	public static String fetch_volume(String username)
	{
		String num_shares_purchased="";
		
		try{
			//System.out.println("hi");
			 Class.forName("com.mysql.jdbc.Driver");
		Connection con= (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/se_project", "root", "ramya");
		
		String sql = 
				  "select sum(num_shares)  from transactions where user_name=? group by date_time";
					PreparedStatement pst = 
							  con.prepareStatement(sql);
					
					pst.setString(1, username);
					ResultSet rs;
					rs = pst.executeQuery();
					int i=0;
					while(rs.next())
					{
						num_shares_purchased+=rs.getInt(1);
						num_shares_purchased+=" ";
						i+=1;
					}
					for (i=0;i<3;i++)
						System.out.println(num_shares_purchased);
					return ((num_shares_purchased));
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return ((num_shares_purchased));

	}
	public static String fetch_date(String username)
	{
		 
		String date="";
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con= (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/se_project", "root", "ramya");
		
		System.out.println("username"+username);
		String sql = 
				  "select date_time from transactions where user_name=? group by date_time";
					PreparedStatement pst = 
							  con.prepareStatement(sql);
					
					pst.setString(1, username);
					ResultSet rs;
					rs = pst.executeQuery();
					int i=0;
					while(rs.next())
					{
						date+=rs.getString(1);
						date+=" ";
						i=i+1;
					}
					System.out.print(date);
					return date;
		}
		catch(Exception e)
		{
			
		}
					return date;

	}
	
}