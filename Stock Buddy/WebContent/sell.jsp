<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr" lang="en-US" xml:lang="en">
 <jsp:useBean id="user" class="registerpkg.userdata" scope="session"  />
<head>
<style>

width: 500px;
}
.ui-dialog-osx {
    -moz-border-radius: 0 0 8px 8px;
    -webkit-border-radius: 0 0 8px 8px;
    border-radius: 0 0 8px 8px; border-width: 0 8px 8px 8p;
}
.heading {
margin: 1px;
color: #fff;
padding: 3px 10px;
cursor: pointer;
position: relative;
background-color:#c30;
}
body { font: normal normal normal 10px/1.5 Arial, Helvetica, sans-serif; }
.content {
padding: 5px 10px;
background-color:#fafafa;
}
p { padding: 5px 0; }

    </style>
   
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title >Stock Buddy</title>
     
    <meta name="description" content="Description" />
    <meta name="keywords" content="Keywords" />


    <link rel="stylesheet" href="style.css" type="text/css" media="screen" />
    <!--[if IE 6]><link rel="stylesheet" href="style.ie6.css" type="text/css" media="screen" /><![endif]-->
    <!--[if IE 7]><link rel="stylesheet" href="style.ie7.css" type="text/css" media="screen" /><![endif]-->

       <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.16/jquery-ui.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" />


<script type="text/javascript">
jQuery(document).ready(function() {
	
	$("#num_stock").dialog({ autoOpen: false });
	
	$("#num_stock").dialog({
		 modal: true,
		draggable: false,
		resizable: false,
		position: ['center', 'top'],
		show: 'blind',
		hide: 'blind',
		width: 400,
		dialogClass:'ui-dialog-osx'
	});
});
//call dialog and the dialog should stay opened until the close button is pressed 
jQuery(document).ready(function() {
setTimeout(function ()
{
 $.mobile.changePage
 (
	 '#num_stock', 
	 {
	 transition: 'pop',
	  role: 'dialog'
	  
	 }
 );
 
}, 10
);
return false;
});

function db_access_stock_val(servlet_name,num_shares)
{		window.uname='<%=user.getuname()%>';
		window.comp_name=name;
		$.get(servlet_name,{stock_val:num_shares,uname:uname,comp:comp},function(responseText) {
			if (responseText=="1")
					alert("Your shares have been sold");
			
			
			else
				alert("You don't have enough stocks");
			
	
		
	});
}
jQuery(document).ready(function() {
$("a[rel^='like']").click(function(){
	window.comp = this.dataset['para2'];
	$("#num_stock").dialog("open");
   
});
});
</script>
<script>

jQuery(document).ready(function() {
		
			$("#confirm").click(function()
				{
				
				var num=$("#num_shares").val();
				
				if (num<1)
					alert("Invalid share value");
				else{
					db_access_stock_val("sell",num);
					$( "#num_stock" ).dialog("close");
				}
				
				 
				
				});
			
				
		});				
		
</script> 
</head>
<body>
<div id="art-main">
    <div class="art-sheet">
        <div class="art-sheet-tl"></div>
        <div class="art-sheet-tr"></div>
        <div class="art-sheet-bl"></div>
        <div class="art-sheet-br"></div>
        <div class="art-sheet-tc"></div>
        <div class="art-sheet-bc"></div>
        <div class="art-sheet-cl"></div>
        <div class="art-sheet-cr"></div>
        <div class="art-sheet-cc"></div>
        <div class="art-sheet-body">
            <div class="art-header">
                <div class="art-header-clip">
                    <div class="art-header-png"></div>
                    <div class="art-header-jpeg"></div>
                </div>
                <div class="art-headerobject"></div>
                <div class="art-logo">
                                  <h1 class="art-logo-name"><a href="./index.html">Stock buddy</a></h1>
                                                 <h2 class="art-logo-text"> Enhances your trading experience</h2>
                                </div>
            </div>
            <div class="cleared reset-box"></div>
<div class="art-nav">
	<div class="art-nav-l"></div>
	<div class="art-nav-r"></div>
<div class="art-nav-outer">
	<ul class="art-hmenu">
		<li>
			<a href="newhome1.jsp" class="active"><span class="l"></span><span class="r"></span><span class="t">Home</span></a></li>	
		<li>
			<a href="browse_main.jsp"><span class="l"></span><span class="r"></span><span class="t">Browse</span></a> 
            
		</li>
        <li>
			<a href="sell.jsp"><span class="l"></span><span class="r"></span><span class="t">Sell</span></a></li>

<li>
			<a href="transaction.jsp"><span class="l"></span><span class="r"></span><span class="t">Transaction History</span></a>
            
		</li> 
        
        <li>
			<a href="watchlist.jsp"><span class="l"></span><span class="r"></span><span class="t">WatchList</span></a>
            
		</li> 
		        <li>
			<a href="viewbalance.jsp"><span class="l"></span><span class="r"></span><span class="t">View Balance</span></a>
            
		</li>  
		 <li>
			<a href="options.jsp"><span class="l"></span><span class="r"></span><span class="t">Options</span></a>
            
		</li>
			<li>
			<a href="logout.jsp"><span class="l"></span><span class="r"></span><span class="t">Logout</span></a>
            
		</li>	
	</ul>
    
</div>

</div>
<div class="cleared reset-box"></div>
<div class="art-content-layout">
                <div class="art-content-layout-row">
                    <div class="art-layout-cell art-content">
<div class="art-post">
    <div class="art-post-body">
<div class="art-post-inner art-article">
  <div class="art-postcontent">
   <H1>Click number of stocks to sell </H1>

        <% 
            Connection connection = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/se_project", "root", "ramya");

            Statement statement = connection.createStatement() ;
            String sql="select num_shares as Num_of_shares,stock_name from purchase1 where user_name=? and num_shares>0" ; 
            PreparedStatement pst =connection.prepareStatement(sql);
    		pst.setString(1, user.getuname());
    		ResultSet resultset = pst.executeQuery();
            
        %>

        <TABLE BORDER="1">
            <TR>
                
                <TH>Number of Shares</TH>
                <TH>Stock name</TH>
              
            </TR>
            <% while(resultset.next()){ %>
            <TR>
                
                <TD> <a href="#" rel="like{{num}}" data-para1= <%= resultset.getString(1)%> data-para2=<%=resultset.getString(2)%> > <%= resultset.getString(1) %></a></TD>
                <TD> <%= resultset.getString(2) %></TD>
                
            </TR>
            <% } %>
        </TABLE>
		<div id = "num_stock" title = "Sell Shares">
    <span class="ui-state-default"><span class="ui-icon ui-icon-info" style="float:left; margin:0 7px 0 0;"></span></span>
        <div style="margin-left: 23px;"> 
    <label>Enter number of Shares: </label>
    <input type="text" id="num_shares" name="name" value="" />
    <input type="button" id="confirm"  value="Confirm" />
    <input type="button" id="text_reset" value=" Reset "/>
    	</div>
	</div>
              </div>
                <div class="cleared"></div>
                </div>

		<div class="cleared"></div>
    </div>
</div>

                      <div class="cleared"></div>
                    </div>
                    <div class="art-layout-cell art-sidebar1">
<div class="art-vmenublock">
    <div class="art-vmenublock-tl"></div>
    <div class="art-vmenublock-tr"></div>
    <div class="art-vmenublock-bl"></div>
    <div class="art-vmenublock-br"></div>
    <div class="art-vmenublock-tc"></div>
    <div class="art-vmenublock-bc"></div>
    <div class="art-vmenublock-cl"></div>
    <div class="art-vmenublock-cr"></div>
    <div class="art-vmenublock-cc"></div>
    <div class="art-vmenublock-body">
                <div class="art-vmenublockheader">
                   <h3 class="t"><bold><center>
                      <strong>visit our page</strong>
                    </center></bold></h3>
                </div>
                <div class="art-vmenublockcontent">
                    <div class="art-vmenublockcontent-tl"></div>
                    <div class="art-vmenublockcontent-tr"></div>
                    <div class="art-vmenublockcontent-bl"></div>
                    <div class="art-vmenublockcontent-br"></div>
                    <div class="art-vmenublockcontent-tc"></div>
                    <div class="art-vmenublockcontent-bc"></div>
                    <div class="art-vmenublockcontent-cl"></div>
                    <div class="art-vmenublockcontent-cr"></div>
                    <div class="art-vmenublockcontent-cc"></div>
                    <div class="art-vmenublockcontent-body">
                <ul class="art-vmenu">
	<li>
		<a href="https://www.facebook.com/StockBuddy2014" class="active"><span class="l"></span><span class="r"></span><span class="t">Facebook</span></a>
	</li>	
	<li>
		<a href="https://twitter.com/StockBuddy2014"><span class="l"></span><span class="r"></span><span class="t">Twitter</span></a>
	</li>
</ul>
                
                                		<div class="cleared"></div>
                    </div>
                </div>
		<div class="cleared"></div>
    </div>
</div>
<div class="art-block">
    <div class="art-block-tl"></div>
    <div class="art-block-tr"></div>
    <div class="art-block-bl"></div>
    <div class="art-block-br"></div>
    <div class="art-block-tc"></div>
    <div class="art-block-bc"></div>
    <div class="art-block-cl"></div>
    <div class="art-block-cr"></div>
    <div class="art-block-cc"></div>
    <div class="art-block-body">
                
                <center>
                <div class="art-blockcontent">
                  <div ></div>
                    <div ></div>
                    <div></div>
                    <div ></div>
                    <div></div>
                    <div></div>
                    <div ></div>
                    <div ></div>
                    <div class="art-blockcontent-cc"></div>
                    <div class="art-blockcontent-body">
                    
                                
                                		<div class="cleared"></div>
                    </div>
                    
                </div><marquee direction="up" height="120" scrollAmount=2 scrollDelay=70><p >Times  magazine have rated Stock Buddy as one of the best website to learn Stock market trading</p></marquee><br><br>
		<div class="cleared"></div>
    </div>
</div>

                      <div class="cleared"></div>
                    </div>
                </div>
            </div>
            <div class="cleared"></div>
            
    		<div class="cleared"></div>
        </div>
    </div>
    <div class="art-footer">
        <div class="art-footer-t"></div>
        <div class="art-footer-b"></div>
        <div class="art-footer-body">
            <div class="art-footer-center">
                <div class="art-footer-wrapper">
                    <div class="art-footer-text">
                       
                        <p><a href="#">Contact Us</a> | <a href="#">Disclaimer</a> </p><p>Copyright © 2014. All Rights Reserved.</p>
                        <div class="cleared"></div>
                    </div>
                </div>
            </div>
            <div class="cleared"></div>
        </div>
    </div>
</div>

</body>
</html>
