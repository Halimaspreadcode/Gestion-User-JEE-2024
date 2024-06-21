<%@page import="beans.Utilisateur"%>
<%@page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Modifier Utilisateur</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            margin: 40px;
            color: #333;
        }
        form {
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        label {
            display: block;
            margin-bottom: 5px;
        }
        input[type="text"], input[type="password"] {
            width: calc(100% - 22px);
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        input[type="submit"] {
            background-color: #5C85F1;
            color: white;
            border: none;
            padding: 10px 20px;
            text-transform: uppercase;
            border-radius: 4px;
            cursor: pointer;
            transition: background 0.3s ease;
        }
        input[type="submit"]:hover {
            background-color: #3a66db;
        }
        a {
            text-decoration: none;
            color: #5C85F1;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <h1>Modifier un Utilisateur</h1>
    <% Utilisateur utilisateur = (Utilisateur) request.getAttribute("utilisateur"); %>
    <% if (utilisateur != null) { %>
        <form action="update" method="post">
		    <input type="hidden" name="id" value="<%= utilisateur.getId() %>">
		    <label for="nom">Nom:</label>
		    <input type="text" id="nom" name="nom" value="<%= utilisateur.getNom() %>"><br>
		    <label for="prenom">Prénom:</label>
		    <input type="text" id="prenom" name="prenom" value="<%= utilisateur.getPrenom() %>"><br>
		    <label for="login">Login:</label>
		    <input type="text" id="login" name="login" value="<%= utilisateur.getLogin() %>"><br>
		    <label for="password">Mot de Passe:</label>
		    <input type="password" id="password" name="password" value="<%= utilisateur.getPassword() %>"><br>
		    <input type="submit" value="Modifier">
		</form>
    <% } else { %>
        <p>Aucun utilisateur à modifier.</p>
    <% } %>
    <a href="listUser">Retour à la liste des utilisateurs</a>
</body>
</html>
