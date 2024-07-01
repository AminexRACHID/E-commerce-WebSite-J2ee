<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="adminHeader.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="../css/ordersReceived-style.css">
 <link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.1.1/css/all.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>EasyShopping</title>
<style>
.th-style
{ width: 25%;}
</style>
</head>
<body>
<br><br><br>
<div style="color: black; text-align: center; font-size: 30px;">Commandes Recues <i class="fas fa-archive"></i></div>
<br><br>
<%
String msg=request.getParameter("msg");
if("cancel".equals(msg)){
%>
<h3 class="alert">Commande annulée avec succès!</h3>
<%} %>
<%
if("delivered".equals(msg)){
%>
<h3 class="alert">Mise à jour réussie!</h3>
<%} %>
<% if("invalid".equals(msg)){%>
<h3 class="alert">Quelque chose s'est mal passé !! réessayer!</h3>
<%} %>

<table id="customers">
          <tr>
          <th>Numéro de télé</th>
            <th scope="col">Nom du produit</th>
            <th scope="col">Quantité</th>
            <th scope="col">Prix Totale</th>
            <th>Addresse</th>
            <th>Ville</th>
            <th>Région</th>
            <th>pays</th>
            <th scope="col">date de commande</th>
             <th scope="col">Date de livraison</th>
              <th scope="col">T-ID</th>
              <th scope="col">Statut</th>
              <th scope="col">Annuler commande</th>
              <th scope="col">Commande livrée <i class='fas fa-dolly'></i></th>
          </tr>
 <%

 try{
	 Connection con=ConnectionProvider.getCon();
	 Statement st=con.createStatement();
	 ResultSet rs=st.executeQuery("select * from cart inner join product where cart.product_id= product.id  and cart.orderDate is not NULL and cart.status='processing'");
	 while(rs.next()){

%>
      
          <tr>
          <td><%=rs.getString(10) %></td>
            <td><%=rs.getString(17) %></td>
            <td><%=rs.getString(3) %></td>
            <td> <%=rs.getString(5) %> MAD</td>
                <td><%=rs.getString(6) %></td>
               <td><%=rs.getString(7) %></td>
                <td><%=rs.getString(8) %></td>
                 <td><%=rs.getString(9) %></td>
             <td><%=rs.getString(11) %></td>
              <td><%=rs.getString(12) %></td>
               <td><%=rs.getString(14) %></td>
               <td><%=rs.getString(15) %></td>
               <td><a href="cancelOrdersAction.jsp?id=<%=rs.getString(2)%>&email=<%=rs.getString(1)%>">Annuler <i class='fas fa-window-close'></i></a></td>
                <td><a href="deliveredOrdersAction.jsp?id=<%=rs.getString(2)%>&email=<%=rs.getString(1)%>">livré <i class='fas fa-dolly'></i></a></td>
            </tr>
<%	 
	 } 
 }catch(Exception e){
	 
 }
 %>
        </table>
      <br>
      <br>
      <br>

</body>
</html>