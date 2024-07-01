<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EasyShopping</title>
    <link rel="stylesheet" href="css/details.css">
    <link rel="stylesheet" href="css/style_1.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.1.1/css/all.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
<nav>
            <img src="image/logo3.png" width="160px" >
            <div class="onglets">
                <p class="link"><a href="welcome.jsp"><i class="fa-solid fa-house-chimney"></i>Home</a></p>
                <p class="link"><a href="login.jsp"><i class='fab fa-elementor'></i> Mes commandes</a></p>
                <p class="link"><a href="about_us.jsp"><i class="fa-solid fa-circle-info"></i> A propos</a></p>
                <p class="link"><a href="login.jsp"><i class="fa-solid fa-cart-shopping"></i> Panier</a></p>
            </div>
</nav>

<div class="small-container single-product">
    <h2><a class="back" href="welcome.jsp"><i class='fas fa-arrow-circle-left'> Back</i></a></h2>
    <%
String id=request.getParameter("id");
try{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from product where id='"+id+"'");
	while(rs.next()){
		
%>
    <div class="row">
        <div class="col-2">
            <img src="image/<%=rs.getString(6) %>" width="400px">
        </div>
        <div class="col-2">
            <h1><%=rs.getString(2) %></h1>
            <p>Catégorie : <%=rs.getString(3) %></p>
            <h4>Prix : <%=rs.getString(4) %> MAD</h4>
            <p>Quantité : <input class="qte" type="number" value="1" name="quantity"><p><br>
            <a href="login.jsp" class="btn">Add to cart</a>
        </div>
    </div>
    <%
}
}catch(Exception e){
	System.out.print(e);
}
%>
</div>
 <%@include file="footer.jsp" %>
</body>
</html>