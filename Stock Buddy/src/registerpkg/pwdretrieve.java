package registerpkg;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import user.User;

/**
 * Servlet implementation class pwdretrieve
 */
@WebServlet("/pwdretrieve")
public class pwdretrieve extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public pwdretrieve() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email1=request.getParameter("fpwd");
Connection con = null; 
		 Context envContext = null;
		 System.out.print("jjjj");
			try { 
				
						User user=new User();
						String[] uname_passwd=user.fetchPassword(email1); 
						request.setAttribute("uname", uname_passwd[0]);
							 request.setAttribute("pwd",uname_passwd[1]);
							 request.setAttribute("email", email1);
							 RequestDispatcher rd=request.getRequestDispatcher("SendForgotMsg");
							   rd.forward(request,response);
							  
				}
			catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}




			
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
