
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../css/home-style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
</head>
    <!--Header-->
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
            
           <!--table-->
           
   