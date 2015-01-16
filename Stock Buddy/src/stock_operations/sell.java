package stock_operations;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import stock.Stock;
import user.User;

/**
 * Servlet implementation class sell
 */
@WebServlet("/sell")
public class sell extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public sell() {
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
		
		int num_shares=Integer.parseInt(request.getParameter("stock_val"));
		System.out.println("num_shares"+num_shares);
		String user_name=request.getParameter("uname");
		String stock_name=request.getParameter("comp");
		int val=s.fetch_stock_val(stock_name);
		int amount=num_shares*val;
		int num_shares_purchased=s.purchased_shares(user_name, stock_name);
		System.out.println("num_shares_purchased"+num_shares_purchased);
		if (num_shares>num_shares_purchased)
		{
			
			response.setContentType("text/html");  
	        response.setCharacterEncoding("UTF-8"); 
	        response.getWriter().write("0"); 
		}
		else
		{
				int currentBalance=u.check_bal(user_name);
			
				u.updateBalance(user_name,currentBalance+amount);
				//System.out.println("current bal"+ currentBalance+"amount"+amount);
				s.sell(user_name,num_shares,stock_name);
				s.transaction(user_name,num_shares, amount, stock_name,"Sold");
				response.setContentType("text/html");  
		        response.setCharacterEncoding("UTF-8"); 
		        response.getWriter().write("1"); 
			
				
		}
	}

	
/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
