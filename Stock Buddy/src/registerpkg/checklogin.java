package registerpkg;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import user.User;

/**
 * Servlet implementation class checklogin
 */
@WebServlet("/checklogin")
public class checklogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public checklogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int flag=0;
		PrintWriter out=response.getWriter();
		String uname=request.getParameter("uname");
		String pwd=request.getParameter("pwd");
		
		out.println("1");
		 try { 
		
					User u=new User();
					String name=u.login_check(uname, pwd);
					if(name.equals(""))
					{
						
						RequestDispatcher rd= request.getRequestDispatcher("loginfail_new.html");
					    rd.forward(request, response);
						
					}
					
					else
					{
						HttpSession session = request.getSession(false);
						
						 request.setAttribute("name", name);
						 request.setAttribute("uname", uname);
						 RequestDispatcher rd=request.getRequestDispatcher("newhome.jsp");
						 rd.forward(request,response);
		                    
		                
		               
		                						
					}
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
