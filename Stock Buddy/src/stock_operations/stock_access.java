package stock_operations;

import stock.Stock;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class stock_access
 */
@WebServlet("/stockaccess")
public class stock_access extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public stock_access() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Stock s=new Stock();
		
		String stock_name=request.getParameter("comp");
		String uname=request.getParameter("uname");
		int val=s.fetch_stock_val(stock_name);
		String val_string=String.valueOf(val);
		System.out.println(stock_name+val_string);
		response.setContentType("text/html");  
        response.setCharacterEncoding("UTF-8"); 
        response.getWriter().write(val_string); 
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
