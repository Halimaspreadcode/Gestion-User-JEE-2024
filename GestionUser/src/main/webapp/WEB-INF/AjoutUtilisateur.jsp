<%@page import="beans.Utilisateur"%>
<%@page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Ajout d'un utilisateur</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 40px;
        }
        input, label {
            margin-top: 10px;
            display: block;
        }
        input[type="text"], input[type="password"] {
            width: 200px;
            padding: 10px;
            margin-bottom: 10px;
        }
        input[type="submit"] {
            padding: 10px 20px;
            color: white;
            background-color: #007BFF;
            border: none;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <h2>Ajout d'un nouveau utilisateur</h2>
    <% String error = (String) request.getAttribute("error"); %>
    <% if (error != null) { %>
        <p style="color: red"><%= error %></p>
    <% } %>
    <form method="POST">
        <label>Nom:</label>
        <input type="text" name="nom" required="required">
        <label>Prénom:</label>
        <input type="text" name="prenom" required="required">
        <label>Login:</label>
        <input type="text" name="login" required="required">
        <label>Mot de Passe:</label>
        <input type="password" name="password" required="required">
        <input type="submit" value="Ajouter">
    </form>
    <p><a href="./listUser">Retour à la liste des utilisateurs</a></p>
</body>
</html>
