<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<html>
<head>
<link rel="stylesheet" href="css/bill.css">
<title>Bill</title>
</head>
<body>
<%
String email=session.getAttribute("email").toString();
try{
	int total=0;
	int sno=0;
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select sum(total) from cart where email='"+email+"' and status='bill'");
	while(rs.next()){
		total=rs.getInt(1);
	}
	ResultSet rs2=st.executeQuery("select * from users inner join cart where cart.email='"+email+"' and cart.status='bill' and users.email='"+email+"'");
	while(rs2.next()){
		String name=rs2.getString(1).substring(0,1).toUpperCase()+rs2.getString(1).substring(1,rs2.getString(1).length()).toLowerCase()+" "+rs2.getString(2).toUpperCase();
%>
<h2>EasyShopping</h2>

<hr>
<div class="left-div"><h3>Nom: <span><%out.println(name); %></span>  </h3></div>
<div class="right-div-right"><h3>Email: <span><%out.println(email); %></span> </h3></div>
<div class="right-div"><h3>Numéro de télé: <span><%=rs2.getString(19) %></span>  </h3></div>  

<div class="left-div"><h3>Date commande: <span><%=rs2.getString(20) %></span>  </h3></div>
<div class="right-div-right"><h3>Mode de paiement: <span><%=rs2.getString(22) %></span>  </h3></div>
<div class="right-div"><h3>Date de livraison: <span><%=rs2.getString(21) %></span>  </h3></div> 

<div class="left-div"><h3>Transaction Id: <span><%=rs2.getString(23) %></span> </h3></div>
<div class="right-div-right"><h3>Ville: <span><%=rs2.getString(16) %></span>  </h3></div> 
<div class="right-div"><h3>Adresse: <span><%=rs2.getString(15) %></span>  </h3></div> 

<div class="left-div"><h3>Région: <span><%=rs2.getString(17) %></span>  </h3></div>
<div class="right-div-right"><h3>Pays: <span><%=rs2.getString(18) %></span> </h3></div>  

<hr>
<%break;} %>

	
	<br>
	
<table id="customers">
<h2>Détails du produit</h2>
  <tr>
    <th>S.No</th>
    <th>Nom du produit</th>
    <th>categorie</th>
    <th>Prix</th>
    <th>Quantité</th>
     <th>Prix Totale</th>
  </tr>
  <%
  ResultSet rs1=st.executeQuery("select * from cart inner join product where cart.product_id=product.id and cart.email='"+email+"' and cart.status='bill'");
  while(rs1.next()){
	  sno=sno+1;
  
  %>
  <tr>
    <td><%out.println(sno); %></td>
    <td><%=rs1.getString(17) %></td>
    <td><%=rs1.getString(18) %></td>
    <td><%=rs1.getString(19) %></td>
    <td><%=rs1.getString(3) %></td>
     <td><%=rs1.getString(5) %> DH</td>
  </tr>
  <tr>
<%} %>
</table>
<h3 class="total">Totale:<%out.println(total); %> DH </h3>
<a href="continueShopping.jsp"><button class="button left-button">Continuer vos achats</button></a>
<a onclick="window.print();"><button class="button right-button">Imprimer</button></a>
<br><br><br><br>
<%
}catch(Exception e){
	System.out.println(e);
}%>
</body>
</html>