<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="css/addressPaymentForOrder-style.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.1.1/css/all.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>EasyShopping</title>
<script>
if(window.history.forward(1) !=null)
	window.history.forward(1);
</script>
</head>
<body>
<br><br>
<h2 align="center">Passez à la commande</h2>
<br><br>
<table>
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
          <th scope="col"><a href="myCart.jsp"><i class='fas fa-arrow-circle-left'> Back</i></a></th>
            <th scope="col" style="background-color:#6C55F9;color:white;">Totale: <%out.println(total); %> DH </th>
          </tr>
        </thead>
        <thead>
          <tr>
          <th scope="col">S.No</th>
            <th scope="col">Nom du produit</th>
            <th scope="col">Categorie</th>
            <th scope="col">prix</th>
            <th scope="col">Quantité</th>
            <th scope="col">Prix Totale</th>
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
            <td> <%=rs.getString(4) %></td>
            <td><%=rs.getString(9) %> </td>
            <td><%=rs.getString(11) %> DH </td>
            </tr>
        <%
        }
      %>    
        </tbody>
      </table>

<br><div class="scrol"><p><i class="fa-solid fa-down-long"></i></p></div><br>
<form action="addressPaymentForOrderAction.jsp" method="post">
 <div class="left-div">
 <h3>Entrer l'adresse</h3>
<input class="input-style" type="text" name="address"  placeholder="Entrer Address" required>
 </div>

<div class="right-div">
<h3>Entrer la ville</h3>
<input class="input-style" type="text" name="city" placeholder="Entrer City" required>
</div> 

<div class="left-div">
<h3>Entrer Région</h3>
<input class="input-style" type="text" name="state" placeholder="Entrer State" required>
</div>

<div class="right-div">
<h3>Entrer le pays</h3>
<input class="input-style" type="text" name="country"  placeholder="Entrer Country" required>
</div>
<div class="left-div">
<h3>Sélectionnez le mode de paiement</h3>
 <select class="input-style" name="paymentMethod">
 <option value="Cash on delivery(COD)">Cash on delivery(COD)</option>
  <option value="Online Payement">Online Payement</option>
 </select>
</div>

<div class="right-div">
<h3>ID de Transaction </h3>
<input class="input-style" type="text" name="transactionId"  placeholder="Entrer Transaction ID">
</div>

<div class="left-div">
<h3>Numéro de téléphone</h3>
<input class="input-style" type="text" name="mobileNumber" placeholder="Entrer Mobile Number" required>
</div>
<div class="right-divs">
<button class="button" type="submit">Passez à la facture & Enregistrer <i class='far fa-arrow-alt-circle-right'></i></button>
</div>
</form>
<%
      
}
catch(Exception e){
	System.out.println(e);
}
%>

      <!-- pied de page-->
<footer>
        <p>&copy; Contactez-nous au_____06 56 62 49 63</p>
        <div class="social-media">
            <p><i class="fa-brands fa-instagram"></i></p>
            <p><i class="fa-brands fa-facebook"></i></p>
            <p><i class="fa-brands fa-twitter"></i></p>
            <p><i class="fa-brands fa-whatsapp"></i></p>
        </div>
    </footer>

</body>
</html>
