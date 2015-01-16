package stock_operations;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.User;

/**
 * Servlet implementation class watchlistNotification
 */
@WebServlet("/watchlistNotification")
public class watchlistNotification extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public watchlistNotification() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		User u=new User();
		Float threshold=Float.valueOf(request.getParameter("threshold"));
		String uname=request.getParameter("uname");
		//System.out.println(uname);
		u.insert_threshold(uname, threshold);
		String email=u.fetch_email(uname);
		 request.setAttribute("email", email);
		 request.setAttribute("threshold", threshold);
		 RequestDispatcher rd=request.getRequestDispatcher("ThresholdNotify");
		 rd.forward(request,response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
