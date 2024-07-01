<%@page import="project.ConnectionProvider" %>
<%@page import="project.addNewProductAction" %>
<%@page import="java.sql.*" %>
<%@include file="adminHeader.jsp" %>
<html>
<head>
<link rel="stylesheet" href="../css/addNewProduct-style.css">
 <link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.1.1/css/all.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Add New Product</title>
</head>
<body>
<br>
<%
String msg=request.getParameter("msg");
if("done".equals(msg)){
%>
<h3 class="alert">Produit ajouté avec succès !</h3>
<%} %>
<%
if("wrong".equals(msg)){
%>
<h3 class="alert">Quelque chose s'est mal passé !! réessayer!</h3>
<%} %>
<%
int id=1;
try{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select max(id) from product ");
	while(rs.next()){
		id=rs.getInt(1);
		id=id+1;
	}
}catch(Exception e){}
%>
<br><br>
<form action="../addNewProductAction" method="post" enctype="multipart/form-data">
<br>
<div style="color: black; text-align: center; font-size: 30px;" >ID Produit:<%out.println(id); %> </div><br>
<input type="hidden" name="id" value="<%out.println(id); %>">

<div class="left-div">
 <h3>Entrer Nom</h3>
 <input class="input-style" type="text" name="name" placeholder="Enter Name" required>

</div>

<div class="right-div">
<h3>Entrer Catégorie</h3>
 <input class="input-style" type="text" name="category" placeholder="Enter Category" required>

</div>

<div class="left-div">
<h3>Entrer Prix</h3>
 <input class="input-style" type="number" name="price" placeholder="Enter Price" required>

</div>

<div class="right-div">
<h3>Active</h3>
 <select class="input-style" name="active">
 <option value="Yes">Yes</option>
 <option value="No">No</option>
 </select>

</div>
<br><br><br>
<div class="midle-div">
<h3>Entrer Image</h3>
 <input class="input-style" type="file" name="image" >
</div>
<br><br><br>
 <button class="button" >Sauvegarder<i class='far fa-arrow-alt-circle-right'></i></button>
</form>
<br><br><br><br>


</body>
</html>