<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>

<% 
String fname=request.getParameter("fname");
String lname=request.getParameter("lname");
String email=request.getParameter("email");
String password=request.getParameter("password");
String mobileNumber=request.getParameter("mobileNumber");
String adress="";
String city="";
String state="";
String country="";
try{
	Connection con=ConnectionProvider.getCon();
	PreparedStatement ps=con.prepareStatement("insert into users values(?,?,?,?,?,?,?,?,?)");
	ps.setString(1, fname);
	ps.setString(2, lname);
	ps.setString(3, email);
	ps.setString(4, password);
	ps.setString(5, mobileNumber);
	ps.setString(6, adress);
	ps.setString(7, city);
	ps.setString(8, state);
	ps.setString(9, country);
	ps.executeUpdate();
	response.sendRedirect("signup.jsp?msg=valid");
	
}catch(Exception e){
	System.out.print(e);
	response.sendRedirect("signup.jsp?msg=invalid");
	
}

%>