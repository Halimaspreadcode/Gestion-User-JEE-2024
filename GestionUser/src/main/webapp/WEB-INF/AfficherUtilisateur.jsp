<%@page import="beans.Utilisateur"%>
<%@page pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<p> 
<a href="/gesusers/listerUtilisateur">retour</a>
 </p>
<% Utilisateur user = (Utilisateur) request.getAttribute("utilisateur"); %>
<% if(user==null){ %>
	<p>Aucun utilisateur disponible</p>
<%} else{ %>
<h2>Informations:</h2>
       	<b> Nom:</b>  <%= user.getNom() %> <br>
    <b>    Pr�nom: </b> <%= user.getPrenom() %> <br>
    <b>    Login: </b> <%= user.getLogin() %> <br>
    <b>    Mot de Passe: </b> <%= user.getPassword() %> <br>
<% } %>
</body>
</html>