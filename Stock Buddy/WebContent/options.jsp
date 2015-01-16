<%@page import="user.User"%>
<jsp:useBean id="user" class="registerpkg.userdata" scope="session"></jsp:useBean>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr" lang="en-US" xml:lang="en">
<head>
    
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title >Stock Buddy</title>
     
    <meta name="description" content="Description" />
    <meta name="keywords" content="Keywords" />


    <link rel="stylesheet" href="style.css" type="text/css" media="screen" />
    <!--[if IE 6]><link rel="stylesheet" href="style.ie6.css" type="text/css" media="screen" /><![endif]-->
    <!--[if IE 7]><link rel="stylesheet" href="style.ie7.css" type="text/css" media="screen" /><![endif]-->

    <script type="text/javascript" src="jquery.js"></script>
    <script type="text/javascript" src="script.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script>
	$(document).ready(function()
	{
	  	$("button").click(function()
		{
	    	<%
	    		User u = new User();
	    		u.resetAccount(user.getuname());
	    	%>
	    	alert("Account Reset");
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
<button>Reset Account</button>


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

<%@ page import="user.User" %>
 

