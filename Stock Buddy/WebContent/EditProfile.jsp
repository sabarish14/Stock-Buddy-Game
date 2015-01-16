<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Stock Buddy</title>
</head>
<%
	String name = request.getParameter("name");
	String username = request.getParameter("username");
	String phoneNo = request.getParameter("phoneNo");
	String email = request.getParameter("email");

	Connection con = null;
	Statement st = null;
	String pass = "";
	int id = 0;
	try {
		 Class.forName("com.mysql.jdbc.Driver");
		//  System.out.println("Loaded driver");
		    // setup the connection with the DB.
		     con=null;
		    con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/se_project", "root", "ramya");		
		    st = con.createStatement();
		ResultSet rs = st
				.executeQuery("select * from user where name= '"
						+ name + "'");
		st = con.createStatement();
		int i = st.
				executeUpdate("update name set name='"
								+ name + "'");							// NAME
		out.println("Name changed successfully");
		
		rs = st.
				executeQuery("select * from user where user_name='"
						+ username + "'");								// USER NAME
		i = st.
				executeUpdate("update username set username='"
								+ username + "'");
		out.println("User Name changed successfully");
		rs = st.
				executeQuery("select * from phoneNo where phoneNo='"
						+ phoneNo + "'");								// PHONE NO.
		i = st.
				executeUpdate("update phoneNo set phoneNo='"
								+ phoneNo + "'");
		out.println("Phone Number changed successfully");	
		
		rs = st.
				executeQuery("select * from user where email_id='"
						+ email + "'");								// EMAIL
		i = st.
				executeUpdate("update user set email_id='"
								+ email + "'");
		out.println("Email changed successfully");		
		st.close();
		con.close();
	} catch (Exception e) {
		out.println(e);
	}
%>