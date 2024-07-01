<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="header.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/style_1.css">
<link rel="stylesheet" href="css/myCart.css">
<title>Mes commandes</title>
</head>
<body>
<br><br>
<div style="color: black; text-align: center; font-size: 30px;">Mes commandes <i class='fab fa-elementor'></i></div>
<br><br>
<table>
        <thead>
          <tr>
            <th scope="col">S.No</th>
            <th scope="col">Nom du produit</th>
            <th scope="col">categorie</th>
            <th scope="col">Prix</th>
            <th scope="col">Quantité</th>
            <th scope="col"> Prix Totale</th>
            <th scope="col">Date commande</th>
             <th scope="col">Date de livraison prévue</th>
             <th scope="col">Mode de paiement</th>
              <th scope="col">Statut</th>
              
          </tr>
        </thead>
        <tbody>
<%
int sno=0;
try{
	String email=session.getAttribute("email").toString();
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from cart inner join product where cart.product_id=product.id and cart.email='"+email+"' and cart.orderDate is not NULL");
	while(rs.next()){
		sno=sno+1;
%>
          <tr>
            <td><%out.println(sno); %></td>
            <td><%=rs.getString(17) %></td>
            <td><%=rs.getString(18) %></td>
            <td><%=rs.getString(19) %> DH </td>
            <td><%=rs.getString(3) %></td>
            <td><%=rs.getString(5) %> DH </td>
             <td><%=rs.getString(11) %> </td>
              <td><%=rs.getString(12) %> </td>
               <td><%=rs.getString(13) %> </td>
               <td><%=rs.getString(15) %> </td>
            </tr>
         <%
	}
}catch(Exception e){
	System.out.println(e);
}
         %>
        </tbody>
      </table>
      <br>
      <br>
      <br>
</body>
</html>