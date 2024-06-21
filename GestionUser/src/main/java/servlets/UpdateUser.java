package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import beans.Utilisateur;
import dao.UtilisateurDAO;

@WebServlet("/update")
public class UpdateUser extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Utilisateur utilisateur = UtilisateurDAO.show(id);
        if (utilisateur != null) {
            request.setAttribute("utilisateur", utilisateur);
            request.getRequestDispatcher("/WEB-INF/modifierUtilisateur.jsp").forward(request, response);
        } else {
            response.sendRedirect("listUser");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String nom = request.getParameter("nom");
        String prenom = request.getParameter("prenom");
        String login = request.getParameter("login");
        String password = request.getParameter("password");

        Utilisateur utilisateur = new Utilisateur(id, nom, prenom, login, password);
        boolean success = UtilisateurDAO.update(utilisateur);
        if (success) {
            request.setAttribute("message", "Utilisateur modifié avec succès");
        } else {
            request.setAttribute("message", "Erreur lors de la modification");
        }
        response.sendRedirect("listUser"); // ou forward selon le besoin
    }
}
