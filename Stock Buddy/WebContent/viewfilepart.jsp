<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="user" class="registerpkg.userdata" scope="session"></jsp:useBean>

<html>
<head>
    <!--s
    Created by Artisteer v3.0.0.39952
    Base template (without user's data) checked by http://validator.w3.org : "This page is valid XHTML 1.0 Transitional"
    -->
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>New Page</title>
    <meta name="description" content="Description" />
    <meta name="keywords" content="Keywords" />


    <link rel="stylesheet" href="style.css" type="text/css" media="screen" />
    <!--[if IE 6]><link rel="stylesheet" href="style.ie6.css" type="text/css" media="screen" /><![endif]-->
    <!--[if IE 7]><link rel="stylesheet" href="style.ie7.css" type="text/css" media="screen" /><![endif]-->

    <script type="text/javascript" src="jquery.js"></script>
    <script type="text/javascript" src="script.js"></script>
    <script type="text/javascript">
	function display()
	{
		window.blur();
		window.alert("Mail is sent to your email id!");
	}
	</script>
</head>
<body>
<%@ page import="javax.sql.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.naming.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.io.File"%>
<%@page import="java.io.FileInputStream"%>

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
                                 <h1 class="art-logo-name"><a href="./index.html">Secure Vault**</a></h1>
                                                 <h2 class="art-logo-text"></h2>
                                </div>
            </div>
            <div class="cleared reset-box"></div>
<div class="art-nav">
	<div class="art-nav-l"></div>
	<div class="art-nav-r"></div>
<div class="art-nav-er">
	<ul class="art-hmenu">
		<li>
			<a href="./new-page.html" class="active"><span class="l"></span><span class="r"></span><span class="t">Home</span></a></li>	
		<li>
			<a href="./new-page-2.html"><span class="l"></span><span class="r"></span><span class="t">About us</span></a> 
            
		</li>
        <li>
			<a href="./new-page-2.html"><span class="l"></span><span class="r"></span><span class="t">Features</span></a></li>
<li>
			<a href="./new-page-2.html"><span class="l"></span><span class="r"></span><span class="t">Search</span></a>
            
		</li> 
        <li>
			<a href="./new-page-2.html"><span class="l"></span><span class="r"></span><span class="t">Contact us</span></a>
            
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

<font color="#CC66FF" face="Comic Sans MS, cursive" size="+1">Welcome,
<%=user.getUname()%>
</font>
<p>
<form>
<fieldset>
<%
PrintWriter o=response.getWriter();
String name=request.getParameter("id");


Context envContext;
try {
	envContext = new InitialContext();
  Context initContext  = (Context)envContext.lookup("java:/comp/env");
  DataSource ds = (DataSource)initContext.lookup("jdbc/MyDataSource");
// Get a database connection
Connection con = ds.getConnection(); 
Statement stmt=con.createStatement();
Blob image=null;
String fname;
ResultSet rs;
System.out.println(name);
rs = stmt.executeQuery("select filename,file from savefile1 where filename='"+name+"'");  
if (rs.next()) {  
fname=rs.getString(1);
 image = rs.getBlob(2);
 
 
} 

byte[] bdata=image.getBytes(1, (int)(image.length()));
String fileType = name.substring(name.indexOf(".")+1,name.length());
if (fileType.trim().equalsIgnoreCase("txt"))
{
response.setContentType( "text/plain" );
}
else if (fileType.trim().equalsIgnoreCase("doc"))
{
response.setContentType( "application/msword" );
}
else if (fileType.trim().equalsIgnoreCase("xls"))
{
response.setContentType( "application/vnd.ms-excel" );
}
else if (fileType.trim().equalsIgnoreCase("pdf"))
{
response.setContentType( "application/pdf" );
}
else if (fileType.trim().equalsIgnoreCase("ppt"))
{
response.setContentType( "application/ppt" );
}
else
{
response.setContentType( "application/octet-stream" );
}


// forces download
String headerKey = "Content-Disposition";
String headerValue = String.format("attachment; filename=\"%s\"", name);
response.setHeader(headerKey, headerValue);
response.setHeader("cache-control", "must-revalidate");

/* 
// obtains response's output stream
OutputStream outStream = response.getOutputStream();
 
byte[] buffer = new byte[4096];
int bytesRead = -1;
 
while ((bytesRead = inStream.read(buffer)) != -1) {
    outStream.write(buffer, 0, bytesRead);
}
 
inStream.close();
outStream.close();      
}*/


//response.setHeader("Content-Disposition","attachment; filename=\""+name+"\"");
//response.setHeader("cache-control", "must-revalidate");
ServletOutputStream outs = response.getOutputStream();
outs.write(bdata);
outs.flush();
outs.close();
/*String encrdata=new String(bdata);
//String decrdata = AESencrp.decrypt(encrdata);
out.println(encrdata);
String s=request.getContentType();
response.setContentType(s); 
/*
InputStream in = image.getBinaryStream();  

int length = (int) image.length();  
int bufferSize = 1024;  
response.resetBuffer();
response.reset();
OutputStream out1 = response.getOutputStream(); 
byte[] buffer = new byte[bufferSize]; 

while ((length = in.read(buffer)) != -1) {  
o.println(buffer);
 o.println("ddhdhdh");
 out1.write(buffer, 0, length);
 
} 
*/
} 
catch (Exception e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
%>
</fieldset>
</form></p>
<p>&nbsp;</p>
<p>&nbsp;</p>
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
		<a href="./new-page.html" class="active"><span class="l"></span><span class="r"></span><span class="t">Facebook</span></a>
	</li>	
	<li>
		<a href="./new-page-2.html"><span class="l"></span><span class="r"></span><span class="t">Twitter</span></a>
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
                <div class="art-blockheader">
                    <h3 class="t"><center>  Current update   </center>                 </h3>
                </div>
                <div class="art-blockcontent">
                    <div class="art-blockcontent-tl"></div>
                    <div class="art-blockcontent-tr"></div>
                    <div class="art-blockcontent-bl"></div>
                    <div class="art-blockcontent-br"></div>
                    <div class="art-blockcontent-tc"></div>
                    <div class="art-blockcontent-bc"></div>
                    <div class="art-blockcontent-cl"></div>
                    <div class="art-blockcontent-cr"></div>
                </div><marquee direction="up" height="120" scrollAmount=2 scrollDelay=70><p>Any queries contact +91-9380453949</p><br><br><p >Times Now magazine have rated Secure Vault as one of the best website to secure our personal data</p></marquee><br><br>
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
                       
                        <p><a href="#">Contact Us</a> | <a href="#">Disclaimer</a> </p><p>Copyright � 2013. All Rights Reserved.</p>
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

