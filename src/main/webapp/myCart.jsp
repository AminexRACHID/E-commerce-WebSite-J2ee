<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/style_1.css">
<link rel="stylesheet" href="css/myCart.css">
<title>panier</title>
<style>
h3
{
	color: red;
	text-align: center;
}
</style>
</head>
<body>
<br><br>
<div style="color: black; text-align: center; font-size: 30px;">Panier <i class='fas fa-cart-arrow-down'></i></div>
<br><br>
<%
String msg=request.getParameter("msg");
if("notPossible".equals(msg)){
%>
<h3 class="alert" >Il n'y a qu'une seule Quantité ! Alors cliquez sur supprimer !</h3>
<%} %>
<%
if("inc".equals(msg)){
%>
<h3 class="alert" >Quantité incrémenté avec succès !</h3>
<%} %>
<%
if("dec".equals(msg)){
%>
<h3 class="alert" >Quantité décrémenté avec succès !</h3>
<%} %>
<%
if("removed".equals(msg)){ 
%>
<h3 class="alert" color="black">produit supprimé avec succès</h3>
<%} %>
<br><br>
<table width="100%">
<thead>
<%
String email=session.getAttribute("email").toString();
int total=0;
int sno=0;
try{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs1=st.executeQuery("select sum(total) from cart where email='"+email+"' and address is NULL");
	while(rs1.next()){
		total=rs1.getInt(1);
		
	}

%>
          <tr>
            <th scope="col" style="background-color: #6C55F9;color:white;">Totale: <%out.println(total); %> </th>
            <%if(total>0){ %><th scope="col"><a href="addressPaymentForOrder.jsp">Commander</a></th><%} %>
          </tr>
        </thead>
        <thead>
          <tr>
          <th scope="col">S.No</th>
            <th scope="col">Nom du produit</th>
            <th scope="col">Categorie</th>
            <th scope="col"> prix</th>
            <th scope="col">Quantité</th>
            <th scope="col">Prix Totale</th>
            <th scope="col">Supprimer <i class='fas fa-trash-alt'></i></th>
          </tr>
        </thead>
        <tbody>
      <%
      ResultSet rs=st.executeQuery("select * from product inner join cart on product.id=cart.product_id and cart.email='"+email+"' and cart.address is NULL ");
      while(rs.next()){
      %>
          <tr>
			<%sno=sno+1; %>
           <td><%out.println(sno); %></td>
            <td><%=rs.getString(2) %></td>
            <td><%=rs.getString(3) %></td>
            <td><%=rs.getString(4) %> MAD</td>
            <td><a href="incDecQuantityAction.jsp?id=<%=rs.getString(1)%>&quantity=inc"><i class='fas fa-plus-circle'></i></a> <%=rs.getString(9) %> <a href="incDecQuantityAction.jsp?id=<%=rs.getString(1)%>&quantity=dec"><i class='fas fa-minus-circle'></i></a></td>
            <td><%=rs.getString(11) %> MAD</td>
            <td><a href="removeFromCart.jsp?id=<%=rs.getString(1)%>">Supprimer <i class='fas fa-trash-alt'></i></a></td>
          </tr>
<%
      }
}catch(Exception e){
	
}
%>
        </tbody>
      </table>
      <br>
      <br>
      <br>
	
</body>
</html>