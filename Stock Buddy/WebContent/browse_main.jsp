<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <jsp:useBean id="user" class="registerpkg.userdata" scope="session"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr" lang="en-US" xml:lang="en">
<head>
<style>
.plus
{
width : 3px;
height : 3px;
position : right;

}
.layer1 {

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
   <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.16/jquery-ui.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" />


<script type="text/javascript" >
var Markit = {};
/**
* Define the QuoteService.
* First argument is symbol (string) for the quote. Examples: AAPL, MSFT, JNJ, GOOG.
* Second argument is fCallback, a callback function executed onSuccess of API.
*/
Markit.QuoteService = function(sSymbol, fCallback) {
    this.symbol = sSymbol;
    this.fCallback = fCallback;
    this.DATA_SRC = "http://dev.markitondemand.com/Api/v2/Quote/jsonp";
    this.makeRequest();
};
/**
* Ajax success callback. fCallback is the 2nd argument in the QuoteService constructor.
*/
Markit.QuoteService.prototype.handleSuccess = function(jsonResult) {
    this.fCallback(jsonResult);
};
/**
* Ajax error callback
*/
Markit.QuoteService.prototype.handleError = function(jsonResult) {
    console.error(jsonResult);
};
/** 
* Starts a new ajax request to the Quote API
*/
Markit.QuoteService.prototype.makeRequest = function() {
    //Abort any open requests
    if (this.xhr) { this.xhr.abort(); }
    //Start a new request
    this.xhr = $.ajax({
        data: { symbol: this.symbol },
        url: this.DATA_SRC,
        dataType: "jsonp",
        success: this.handleSuccess,
        error: this.handleError,
        context: this
    });
};

</script>
<script type="text/javascript">

	$(function()
			{
		$("a[rel^='like']").click(function(){
			  
							
			   var para1 = this.dataset['para1'];
				
			   new Markit.QuoteService(para1, function(jsonResult) {
				    //Catch errors
					    if (!jsonResult || jsonResult.Message){
					        this.renderAlert(jsonResult);
					        return;
					    }
						
						window.price=jsonResult.LastPrice;
						dialog_display(jsonResult.Symbol,jsonResult.LastPrice,jsonResult.Change,this.formatChgPct(jsonResult.ChangePercent),jsonResult.Timestamp);

					    this.success(jsonResult);		    
			});
		});
	
	});
	

	Markit.QuoteService.prototype.success = function(jsonResult){
		
				
				window.price=jsonResult.LastPrice;
				dialog_display(jsonResult.Symbol,jsonResult.LastPrice,jsonResult.Change,this.formatChgPct(jsonResult.ChangePercent),jsonResult.Timestamp)
				
				};

	Markit.QuoteService.prototype.formatChgPct = function(chg){
		//the quote API returns negative numbers already,
		//so we just need to add the + sign to positive numbers
		return (chg <= 0) ? chg.toFixed(2) : "+" + chg.toFixed(2);	
	};
	


</script>
<script type="text/javascript">
jQuery(document).ready(function() {
  jQuery(".content").hide();
  //toggle the componenet with class msg_body
  jQuery(".heading").click(function()
  {
    jQuery(this).next(".content").slideToggle(500);
  });
});
</script>
<script>
/*
 function db_access_stock_val(servlet_name,name)
{
		window.comp_name=name;
		window.uname='<%=user.getuname()%>';
		
		$.get(servlet_name,{comp:name,uname:uname},function(responseText) {
			dialog_display(name,responseText);
	
		
	});
}*/
function db_access_watchlist(servlet_name,name)
{
		window.comp_name=name;
		window.uname='<%=user.getuname()%>';
		
		$.get(servlet_name,{comp:name,uname:uname,price:price},function(responseText) {
			alert("Added to Favorites");
	
		
	});
}
function db_access_purchase(servlet_name,stock_val)
{
		window.uname='<%=user.getuname()%>';

		$.get(servlet_name,{uname:uname,comp:symbol,stock_val:stock_val,price:price},function(responseText) {
		if (responseText=="0"){
			alert("Your balance is insufficient for the purchase");	
		}
		else{
			alert("Your purchase has been processed.");
		}
		
	});
}

function dialog_display(Symbol,LastPrice,Change,ChangePercent,Timestamp)
{
	$("#dialog").html("Symbol        :"+Symbol+ "<br />"
					+ "<br />LastPrice     :"+LastPrice+"<br />"
					+ "<br />Change        :"+Change+"<br />"
					+ "<br />ChangePercent :"+ChangePercent+"<br />"
					+ "<br />Timestamp     :"+Timestamp+"<br />"+ "<br />Click Buy to proceed");
	$( "#dialog" ).dialog( "open" );	
	window.price=LastPrice;
	window.symbol=Symbol;
//	store_comp_name(val);
}


</script>
<script type="text/javascript">

	$(function()
			{
		$("a[rel^='plus']").click(function(){
			  
			
			   var para1 = this.dataset['para1'];
			//   alert(para1);
			   new Markit.QuoteService(para1, function(jsonResult) {
				    //Catch errors
					    if (!jsonResult || jsonResult.Message){
					        this.renderAlert(jsonResult);
					        return;
					    }

					    this.success(jsonResult);
					    db_access_watchlist("watchlist",para1);
			});
		});
	
	});
	

	Markit.QuoteService.prototype.success = function(jsonResult){
		
				window.price=jsonResult.LastPrice;
			//	dialog_display(jsonResult.Symbol,jsonResult.LastPrice,jsonResult.Change,this.formatChgPct(jsonResult.ChangePercent),jsonResult.Timestamp)
				//alert(jsonResult.Change);
				};

	Markit.QuoteService.prototype.formatChgPct = function(chg){
		//the quote API returns negative numbers already,
		//so we just need to add the + sign to positive numbers
		return (chg <= 0) ? chg.toFixed(2) : "+" + chg.toFixed(2);	
	};
	


</script>

<script>
jQuery(document).ready(function() {
	$( "#dialog" ).dialog({ autoOpen: false });
	$( "#num_stock" ).dialog({ autoOpen: false });
	$("#dialog").dialog({
		 modal: true,
		draggable: false,
		resizable: false,
		position: ['center', 'top'],
		show: 'blind',
		hide: 'blind',
		width: 400,
		dialogClass: 'ui-dialog-osx',
		buttons: {
	       "BUY": function()
							{
	    	   $("#dialog").dialog("close");
				$("#num_stock").dialog("open");
							}
				}
	
	});
	$("#num_stock").dialog({
		 modal: true,
		draggable: false,
		resizable: false,
		position: ['center', 'top'],
		show: 'blind',
		hide: 'blind',
		width: 400,
		dialogClass: 'ui-dialog-osx',
	});
});
jQuery(document).ready(function() {
		
			$("#confirm").click(function()
				{
					
				var num=$("#num_shares").val();
				if (num<1)
					alert("Invalid share value");
				db_access_purchase("purchase",num);
				$( "#num_stock" ).dialog("close");
				
				 
				
				});
			// call dialog and the dialog should stay opened 		         until the close button is pressed 
				setTimeout(function ()
			  {
				 $.mobile.changePage
				 (
					 '#dialog', 
					 {
					 transition: 'pop',
					  role: 'dialog'
					  
					 }
				 );
			  }, 10
			  );
				return false;
				
		});				
		



</script> 
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title >Stock Buddy</title>
     
    <meta name="description" content="Description" />
    <meta name="keywords" content="Keywords" />


    <link rel="stylesheet" href="style.css" type="text/css" media="screen" />
 
    
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
  <div class = "intro">
<p class = "main"> <b><i>Click on the company name to view its Stock price.</i></b> </p>
<div class="layer1">
<p class="heading">Tech Based Companies </p>

<div class="content">
<ul>

<li><a href="#" rel="like{{num}}" data-para1="GOOGL">Google</a>
<a class="plus" href="#" rel="plus{{num}}" data-para1="GOOGL"> <img src="plus.jpg" ></a>
</li> 
<li><a href="#" rel="like{{num}}" data-para1="AAPL">Apple</a>
<a class="plus" href="#" rel="plus{{num}}" data-para1="AAPL"> <img src="plus.jpg" ></a>
</li>

<li><a href="#" rel="like{{num}}" data-para1="IRBT">IROBOT</a>
<a class="plus" href="#" rel="plus{{num}}" data-para1="IRBT"> <img src="plus.jpg" ></a>
</li>

<li><a href="#" rel="like{{num}}" data-para1="GPRO">Gopro</a>
<a class="plus" href="#" rel="plus{{num}}" data-para1="GPRO"> <img src="plus.jpg" ></a>
</li>
<li><a href="#" rel="like{{num}}" data-para1="YHOO">Yahoo</a>
<a class="plus" href="#" rel="plus{{num}}" data-para1="YHOO"> <img src="plus.jpg" ></a>
</li>
<li><a href="#" rel="like{{num}}" data-para1="MSFT">Microsoft</a>
<a class="plus" href="#" rel="plus{{num}}" data-para1="MSFT"> <img src="plus.jpg" ></a>
</li>
<li><a href="#" rel="like{{num}}" data-para1="IBM">IBM</a>
<a class="plus" href="#" rel="plus{{num}}" data-para1="IBM"> <img src="plus.jpg" ></a>
</li>
</ul>

</div>
<p class="heading">Pharma Companies </p>

<div class="content">
<ul>

<li><a href="#" rel="like{{num}}" data-para1="MRK">Merck</a> 
<a class="plus" href="#" rel="plus{{num}}" data-para1="MRK"> <img src="plus.jpg" ></a>
</li>
<li><a href="#" rel="like{{num}}" data-para1="PFE">Phizer</a>
<a class="plus" href="#" rel="plus{{num}}" data-para1="PFE"> <img src="plus.jpg" ></a>
</li>
<li><a href="#" rel="like{{num}}" data-para1="AMGN">Amgen</a>
<a class="plus" href="#" rel="plus{{num}}" data-para1="AMGN"> <img src="plus.jpg" ></a>
</li>
<li><a href="#" rel="like{{num}}" data-para1="CVS">CVS</a>
<a class="plus" href="#" rel="plus{{num}}" data-para1="CVS"> <img src="plus.jpg" ></a>
</li>

<li><a href="#" rel="like{{num}}" data-para1="JNJ">Johnson and Johnson</a>
<a class="plus" href="#" rel="plus{{num}}" data-para1="JNJ"> <img src="plus.jpg" ></a>
</li>
<li><a href="#" rel="like{{num}}" data-para1="ABBV">AbbVie</a>
<a class="plus" href="#" rel="plus{{num}}" data-para1="ABBV"> <img src="plus.jpg" ></a>
</li>



</ul>

</div>

<p class="heading">Big Data Companies </p>

<div class="content">
<ul>

<li><a href="#" rel="like{{num}}" data-para1="TDC">TeraData</a>
<a class="plus" href="#" rel="plus{{num}}" data-para1="TDC"> <img src="plus.jpg" ></a>
</li>
<li><a href="#" rel="like{{num}}" data-para1="ORCL">Oracle</a>
<a class="plus" href="#" rel="plus{{num}}" data-para1="ORCL"> <img src="plus.jpg" ></a>
</li>

</ul>

</div>
<p class="heading">Automobile Companies </p>

<div class="content">
<ul>

<li><a href="#" rel="like{{num}}" data-para1="EGLE">Eagle</a>
<a class="plus" href="#" rel="plus{{num}}" data-para1="EGLE"> <img src="plus.jpg" ></a>
</li>
<li><a href="#" rel="like{{num}}" data-para1="FCAU">Chrysler</a>
<a class="plus" href="#" rel="plus{{num}}" data-para1="FCAU"> <img src="plus.jpg" ></a>
</li>
<li><a href="#" rel="like{{num}}" data-para1="GM">General Motors</a>
<a class="plus" href="#" rel="plus{{num}}" data-para1="GM"> <img src="plus.jpg" ></a>
</li>
<li><a href="#" rel="like{{num}}" data-para1="F">Ford</a>
<a class="plus" href="#" rel="plus{{num}}" data-para1="F"> <img src="plus.jpg" ></a>
</li>

<li><a href="#" rel="like{{num}}" data-para1="FCAU">Fiat</a>
<a class="plus" href="#" rel="plus{{num}}" data-para1="FCAU"> <img src="plus.jpg" ></a>
</li>



</ul>

</div>


<p class="heading">Online Retail Companies </p>

<div class="content">
<ul>

<li><a href="#" rel="like{{num}}" data-para1="AMZN">Amazon</a>
<a class="plus" href="#" rel="plus{{num}}" data-para1="AMZN"> <img src="plus.jpg" ></a>
</li>
<li><a href="#" rel="like{{num}}" data-para1="WMT">Walmart</a>
<a class="plus" href="#" rel="plus{{num}}" data-para1="WMT"> <img src="plus.jpg" ></a>
</li>
<li><a href="#" rel="like{{num}}" data-para1="Ebay">Ebay</a>
<a class="plus" href="#" rel="plus{{num}}" data-para1="EBay"> <img src="plus.jpg" ></a>
</li>
<li><a href="#" rel="like{{num}}" data-para1="KSS">Kohls</a>
<a class="plus" href="#" rel="plus{{num}}" data-para1="KSS"> <img src="plus.jpg" ></a>
</li>
<li><a href="#" rel="like{{num}}" data-para1="SHLD">Sears</a>
<a class="plus" href="#" rel="plus{{num}}" data-para1="SHLD"> <img src="plus.jpg" ></a>
</li>
<li><a href="#" rel="like{{num}}" data-para1="BBY">Best Buy</a>
<a class="plus" href="#" rel="plus{{num}}" data-para1="BBY"> <img src="plus.jpg" ></a>
</li>


</ul>

</div>

<div id="dialog"  title="Stock Price">
    <span class="ui-state-default"><span class="ui-icon ui-icon-info" style="float:left; margin:0 7px 0 0;"></span></span>
    <div style="margin-left: 23px;"> 
    </div>
	
</div>


<div id = "num_stock" title = "Buy Shares">
    <span class="ui-state-default"><span class="ui-icon  	ui-icon-info" style="float:left; margin:0 7px 0 0;"></span></span>
        <div style="margin-left: 23px;"> 
    <label>Enter number of Shares: </label>
    <input type="text" id="num_shares" name="name" value="" />
    <input type="button" id="confirm"  value="Confirm" />
    <input type="button" id="text_reset" value=" Reset "/>
    	</div>
</div>
</div>
                
</div>

                      
                    </div>
                    <div class="art-layout-cell art-sidebar1">

     <div class="cleared"></div>
                    </div>
                </div>
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
