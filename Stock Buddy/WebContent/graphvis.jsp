<%@page import="stock.Stock"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <jsp:useBean id="user" class="registerpkg.userdata" scope="session"  />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr" lang="en-US" xml:lang="en">

<head>
  <meta content="text/html;charset=utf-8" http-equiv="Content-Type">
  <meta content="utf-8" http-equiv="encoding">
  <title>Graph2d Test</title>

  <style type="text/css">
    body, html {
      font-family: sans-serif;
    }
  </style>

  <script src="vis.js"></script>
  <link href="vis.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="visualization"></div>

<script type="text/javascript">


  var container = document.getElementById('visualization');
  var items = [];
  
  
  //TODO: ADD POINTS HERE
  var num_shares='<%=Stock.fetch_volume(user.getuname())%>';
  var date='<%=Stock.fetch_date(user.getuname())%>';
  var num = num_shares.split(' ');
  var date = date.split(' ');
 // alert(num);
  var k=0;
  for (var i = 0; i < num.length-1; i++) {
	  
  	setPoint(date[k], num[i], i);
  	//alert(date[k]+" "+num[i]);
  	k+=2;
  }
  
  /*setPoint('2014-11-15', 10, 1);
  setPoint('2014-11-16', 15, 2);
  setPoint('2014-11-11', 18, 3);*/
  var dataset = new vis.DataSet(items);
  
  //var dataset = new vis.DataSet(items);
 // var dataset = new vis.DataSet(items);
  //TODO: Set start / end date
  /*var options = {
    start: '2014-06-10',
    end: '2014-06-18'
  };*/
  //TODO: Set start / end date
  var options = {
    start: '2014-11-11',
    end: '2014-11-19'
  };
  
  
  var graph2d = new vis.Graph2d(container, dataset, options);
  
  
  
  //Sets index point i to x,y
  function setPoint(x, y, i)
  {
	  items[i] = {x: x, y: y};
  }

</script>
</body>
</html>