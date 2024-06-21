<%@page import="java.util.List"%>
<%@page import="beans.Utilisateur"%>
<%@page contentType="text/html;charset=UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> <!-- Directive JSTL -->

<!DOCTYPE html>
<html>
<head>
    <title>Liste des Utilisateurs</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 40px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        .button-link {
            display: inline-block;
            padding: 5px 10px;
            margin: 2px;
            background-color: #007BFF;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            text-align: center;
        }
        .button-link:hover, .button-link:focus {
            background-color: #0056b3;
            color: white;
            text-decoration: none;
        }
        .button-delete {
            background-color: #FF6347; /* Tomato */
        }
        .button-delete:hover, .button-delete:focus {
            background-color: #FF4500; /* OrangeRed */
        }
    </style>
</head>
<body>
    <h1>Liste des Utilisateurs</h1>
    <p><a href="./add" class="button-link">Ajouter un nouvel utilisateur</a></p>
    <c:choose>
        <c:when test="${empty utilisateurs}">
            <p>Aucun utilisateur disponible.</p>
        </c:when>
        <c:otherwise>
            <table>
                <thead>
                    <tr>
                        <th>Prénom</th>
                        <th>Nom</th>
                        <th>Login</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${utilisateurs}" var="utilisateur">
                        <tr>
                            <td>${utilisateur.prenom}</td>
                            <td>${utilisateur.nom}</td>
                            <td>${utilisateur.login}</td>
                            <td>
                                <a href="./update?id=${utilisateur.id}" class="button-link">Modifier</a>
                                <a href="./delete?id=${utilisateur.id}" class="button-link button-delete" onclick="return confirm('Êtes-vous sûr de vouloir supprimer cet utilisateur ?');">Supprimer</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:otherwise>
    </c:choose>
</body>
</html>
