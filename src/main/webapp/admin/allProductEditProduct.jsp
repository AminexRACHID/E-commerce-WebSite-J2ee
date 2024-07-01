<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="adminHeader.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.1.1/css/all.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>EasyShopping</title>
<style>
h3
{
	color: red;
	text-align: center;
}
</style>
</head>
<body>
<br><br><br><br>
<div style="color: black; text-align: center; font-size: 30px;">Tous les produits && Modifier les produits <i class='fab fa-elementor'></i></div>
<br><br><br>
<%
String msg=request.getParameter("msg");
if("done".equals(msg)){
%>
<h3 class="alert" >Produit ajouté avec succès !</h3>
<%} %>
<%
if("wrong".equals(msg)){
%>
<h3 class="alert">Quelque chose s'est mal passé !! réessayer!</h3>
<%} %>
<table>
        <thead>
          <tr>
            <th scope="col">ID</th>
            <th scope="col">Nom</th>
            <th scope="col">Catégorie</th>
            <th scope="col">Prix</th>
            <th>Status</th>
            <th scope="col">Modifier <i class='fas fa-pen-fancy'></i></th>
          </tr>
        </thead>
        <tbody>
       <%
       try{
    	   Connection con=ConnectionProvider.getCon();
    	   Statement st=con.createStatement();
    	   ResultSet rs=st.executeQuery("select * from product");
    	   while(rs.next()){
       %>
          <tr>
            <td><%=rs.getString(1) %></td>
            <td><%=rs.getString(2) %></td>
            <td><%=rs.getString(3) %></td>
            <td><%=rs.getString(4) %> MAD</td>
            <td><%=rs.getString(5) %></td>
            <td><a href="editProduct.jsp?id=<%=rs.getString(1) %>">Modifier <i class='fas fa-pen-fancy'></i></a></td>
          </tr>
         <%
    	   }
       }catch(Exception e){
    	   System.out.print(e);
       }
         %>
        </tbody>
      </table>
      <br>
      <br>
      <br>

</body>
</html>