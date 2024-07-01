
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign In</title>
    <link rel="stylesheet" href="css/style_2.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.1.1/css/all.css">
</head>
<body>
<!-- barre de navigation-->
 <nav>
    <img src="image/logo3.png" width="160px" >
    <div class="onglets">
        <p class="link"> <a href="welcome.jsp"><i class="fa-solid fa-house-chimney"></i>Home</a></p> 
        <p class="link"><a href="login.jsp"><i class='fab fa-elementor'></i> Mes commandes</a></p>
        <p class="link"><a href="about_us.jsp"><i class="fa-solid fa-circle-info"></i> A propos</a></p>
        <p class="link"><a href="login.jsp"><i class="fa-solid fa-cart-shopping"></i> Panier</a></p> 
    </div>
</nav>
<section>
<form class="formm" action="loginAction.jsp" method="post" > 
    <h1> Connecter </h1>
    
    <%
    String msg=request.getParameter("msg");
    if("notexist".equals(msg)){
    %>
    <h2 align="center" color="red">Incorrect Username or Password</h2>
    <%} %>
    <%
    if("invalid".equals(msg)){
    %>
    <h2 align="center" color="red">Some thing Went Wrong! try Again !!</h2>
    <%} %>
    
    <div class="imputs">
       <p class="U"><i class="fa-solid fa-user"></i>  Email</p>
      <input class="inp" type="email" placeholder="entrer votre email" name="email" required><br><br>
      <p class="U"><i class="fa-solid fa-lock"></i> Password</p>
      <input class="inp" type="password" placeholder="entrer votre password" name="password" required>
    </div>
    <div >
        <button type="submit">Connecter</button>
    </div>
    <p align="center" class="sign-up">Ou s'inscrire par ici </p>
    <p align="center" class="sign-up0"><a href="signup.jsp">S'INSCRIRE</a></p>
</form>
</section>
   <%@include file="footer.jsp" %>
</body>
</html>