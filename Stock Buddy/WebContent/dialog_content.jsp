<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div id="dialog"  title="Stock Price">
    <span class="ui-state-default"><span class="ui-icon ui-icon-info" style="float:left; margin:0 7px 0 0;"></span></span>
    <div style="margin-left: 23px;"> 
    
    <p> The Stock price is:   </p>
    <button id="buy"> Buy </button>
    <button id="close_dialogbox"> OK </button>
    </div>
	
</div>
<!--The stock price is <%=request.getAttribute("stockprice")%>  -->

</body>
</html>