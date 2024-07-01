
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EasyShopping</title>
    <link rel="stylesheet" href="../css/admin_home.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.1.1/css/all.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<body>
    <!-- barre de navigation-->
    <nav>
        <div></div>
        <div class="onglets">
			<% String email=session.getAttribute("email").toString(); %>
            <p class="link"> <a href="addNewProduct.jsp"><i class='fas fa-plus-square'></i> Ajouter un produit </a></p>
            <p class="link">  <a href="allProductEditProduct.jsp"> <i class='fab fa-elementor'></i> Editer un Produit</a></p>
            <p class="link">  <a href="ordersReceived.jsp"><i class="fas fa-archive"></i> Commandes Recues </a></p>
            <p class="link">  <a href="cancelOrders.jsp"><i class='fas fa-window-close'></i>Commandes annulées </a></p>
            <p class="link">  <a href="deliveredOrders.jsp"><i class='fas fa-dolly'></i> Commandes livrées </a></p>
            <p class="link">  <a href="../logout.jsp"><i class='fas fa-share-square'></i> Se déconnecter </a></p>
           
        </div>
    </nav>
    <section><h1>Bienvenue<br> admin</h1></section>
    


        
    
</body>

</html>