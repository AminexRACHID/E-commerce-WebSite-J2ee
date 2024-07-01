<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inscription</title>
    <link rel="stylesheet" href="css/style3.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.1.1/css/all.css">
</head>
<body>
 <!-- barre de navigation-->
    <nav>
        <img src="image/logo3.png" width="160px" >
        <div class="onglets">
            <p class="link"><a href="welcome.jsp"><i class="fa-solid fa-house-chimney"></i>Home</a> </p>
           <p class="link"><a href="signup.jsp"><i class='fab fa-elementor'></i> Mes commandes</a> </p>
            <p class="link"><a href="about_us.jsp"><i class="fa-solid fa-circle-info"></i> A propos</a></p>
            <p class="link"><a href="signup.jsp"><i class="fa-solid fa-cart-shopping"></i> Panier</a></p> 
        </div>
    </nav>
    <section>
    <form class="formm" action="signupAction.jsp" method="post"> 
        <h1> S'inscrire </h1>
        <%
        String msg=request.getParameter("msg");
        if("valid".equals(msg)){
        %>	
        <h2 align="center" color="green">Inscription réussie !! </h2>
        <% }%>
        <%
        if("invalid".equals(msg)){
        %>
        <h2 align="center" color="red">Quelque chose s'est mal passé ! Réessayer !! </h2>
        <%} %>
        
        <div class="imputs">
          <p class="U"><i class="fa-solid fa-user"></i>  nom</p>
          <input class="inp" type="text" placeholder="entrer votre nom" name="fname" required><br><br>
          <p class="U"><i class="fa-solid fa-user"></i>  prenom</p>
          <input class="inp" type="text" placeholder="entrer votre prenom" name="lname" required><br><br>
          <p class="U"><i class="fa-solid fa-envelope"></i>  Email</p>
          <input class="inp" type="email" placeholder="entrer votre email" name="email" required><br><br>
          <p class="U"><i class="fa-solid fa-phone"></i>  Téléphone</p>
          <input class="inp" type="number" placeholder="entrer votre numéro de telephone" name="mobileNumber" required><br><br>
          <p class="U"><i class="fa-solid fa-lock"></i> Password</p>
          <input class="inp" type="password" placeholder="entrer votre password" name="password" required>
        </div>
        <div >
            <input class="submit" type="submit" value="S'inscrire">
        </div>
        <p align="center" class="sign-up">Déjà un membre ? </p>
        <p align="center" class="sign-up0"><a href="login.jsp"> CONNECTEZ-VOUS</a></p>
    </form>
    </section>
      <%@include file="footer.jsp" %>
</body>
</html>