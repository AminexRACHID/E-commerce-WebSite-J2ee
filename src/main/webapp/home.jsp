<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="header.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EasyShopping</title>
    <link rel="stylesheet" href="css/style_1.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.1.1/css/all.css">
</head>
<body>
    <!-- header -->
    <header>
        <h1>Bienvenue<br> sur notre<span class="marked"> Site </span>de vente en ligne</h1>
    </header>
    <%
String msg=request.getParameter("msg");
if("added".equals(msg)){
%>
<h3 class="alert" style="color: red; text-align: center;">Produit ajouté avec succès !</h3>
<%} %>
<%
if("exist".equals(msg)){
%>
<h3 class="alert" style="color: red; text-align: center;">Le produit existe déjà dans votre panier ! Quantité augmentée !</h3>
<%} %>
<%
if("invalid".equals(msg)){
%>
<h3 class="alert" style="color: red; text-align: center;">Quelque chose s'est mal passé !! réessayer!</h3>
<%} %>
    <!-- section principal -->
    <section class="main">
        <!-- les cartes-->
        <div class="cards">
            <%
            try{
            	Connection con=ConnectionProvider.getCon();
            	Statement st=con.createStatement();
	            ResultSet rs=st.executeQuery("select * from product where active='Yes'");
	            while(rs.next()){
            %>
            <div class="card">
            <a href="details-card.jsp?id=<%=rs.getString(1) %>">
                <img src="image/<%=rs.getString(6) %>">
                <div class="card-header">
                    <h4 class="title"><%=rs.getString(3) %></h4>
                    <h4 class="prise"><%=rs.getString(4) %> MAD</h4>
                </div>
                </a>
                <div class="card-body">
                    <p><%=rs.getString(2) %></p>
                    <a href="addToCartAction.jsp?id=<%=rs.getString(1) %>">Add <i class='fas fa-cart-plus'></i></a>
                </div>
            </div>
            <%
	            }
            }catch(Exception e){
	            System.out.println(e);
            }
            %>
        </div>    
    </section>
    <%@include file="footer.jsp" %>
</body>

</html>