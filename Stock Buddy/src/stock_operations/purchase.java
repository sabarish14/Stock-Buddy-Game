package stock_operations;
import stock.Stock;
import user.User;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class purchase
 */
@WebServlet("/purchase")
public class purchase extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public purchase() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		Stock s=new Stock();
		User u=new User();
		String stock_name=request.getParameter("comp");
		String user_name=request.getParameter("uname");
		int num_shares=Integer.parseInt(request.getParameter("stock_val"));
		Float val1=Float.parseFloat(request.getParameter("price"));
		int val=Math.round(val1);
		int amount=num_shares*val;
		int currentBalance=u.check_bal(user_name);
		System.out.println("balance"+user_name);
		if( (currentBalance-amount)>=0)
		{
			System.out.println("If");
			u.updateBalance(user_name,currentBalance-amount);
			s.purchase(user_name,num_shares, stock_name);
			s.transaction(user_name,num_shares, amount, stock_name,"Purchased");
			response.setContentType("text/html");  
	        response.setCharacterEncoding("UTF-8"); 
	        response.getWriter().write("1"); 
		}
				
		else 
		{
			response.setContentType("text/html");  
	        response.setCharacterEncoding("UTF-8"); 
	        response.getWriter().write("0"); 
		}	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
