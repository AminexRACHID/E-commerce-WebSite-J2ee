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
        <h1>Bienvenue sur notre Site de vente en ligne </h1>
    </header>
    <!-- section principal -->
    <section class="main">
        <!-- les cartes-->
        <div class="cards">
		 <%
			int z=0;
			try{
				String search=request.getParameter("search");
				Connection con=ConnectionProvider.getCon();
				Statement st=con.createStatement();
				ResultSet rs=st.executeQuery("select * from product where name like '%"+search+"%' or category like '%"+search+"%' and active='Yes'");
				while(rs.next()){
					z=1;
				
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
            <%if(z==0){ %>
	<h1 style="color:red; text-align: center;">Rien à montrer</h1>
	<%} %>
        </div>    
    </section>
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