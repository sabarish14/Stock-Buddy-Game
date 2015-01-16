package registerpkg;
import java.io.IOException;
import java.sql.Connection;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import user.User;

/**
 * Servlet implementation class regisdb
 */
@WebServlet("/regisdb")
public class regisdb extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	Connection con;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public regisdb() {
        super();
        con=null;

    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User u=new User();
		String title=request.getParameter("title");
		String fname=request.getParameter("fname");
		String lname=request.getParameter("lname");
		String uname=request.getParameter("uname");
		String pwd=request.getParameter("pwd");
		String email=request.getParameter("email");
		String mobno=request.getParameter("mobno");
		 
		 u.register(uname, pwd, title, fname, lname, mobno, email);
		 request.setAttribute("email", email);
		 request.setAttribute("pwd",pwd);
		 RequestDispatcher rd=request.getRequestDispatcher("SendMail");
		 rd.forward(request,response);
	}
		

	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
