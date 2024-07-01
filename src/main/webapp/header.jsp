<%@page errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.1.1/css/all.css">
    <script src='https://kit.fontawesome.com/a076d05399.js'></script>
</head>
<body>
    <!-- barre de navigation-->
    <nav>
        <% String name=session.getAttribute("name").toString(); %>
        <img src="image/logo3.png" width="160px">
        <div class="onglets">

            <p class="link"><a href="home.jsp"><i class="fa-solid fa-house-chimney"></i>Home </p></a>

            <p class="link"><a href="myOrders.jsp"><i class='fab fa-elementor'></i>Mes commandes </p></a>
            <p class="link"><a href="myCart.jsp"><i class="fa-solid fa-cart-shopping"></i> Panier</p></a>
            <form action="searchHome1.jsp" method="post">
                <input type="search" placeholder="rechercher" name="search">
            </form>
            <p class="link"><i class="fa-solid fa-user"></i><%out.println(name); %></p>
            <p class="link"><a href="logout.jsp"><i class='fas fa-share-square'></i></a></p>
        </div>
    </nav>