package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import beans.Utilisateur;
import dao.UtilisateurDAO;

@WebServlet("/add")
public class AddUser extends HttpServlet {

    private static final String VUE_AJOUT_UTILISATEUR = "/WEB-INF/AjoutUtilisateur.jsp";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        getServletContext().getRequestDispatcher(VUE_AJOUT_UTILISATEUR).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nom = request.getParameter("nom");
        String prenom = request.getParameter("prenom");
        String login = request.getParameter("login");
        String password = request.getParameter("password");

        if(nom.isEmpty() || prenom.isEmpty() || login.isEmpty() || password.isEmpty()) {
            request.setAttribute("error", "Tous les champs sont obligatoires.");
            getServletContext().getRequestDispatcher(VUE_AJOUT_UTILISATEUR).forward(request, response);
            return;
        }

        if (UtilisateurDAO.existsByLogin(login)) {
            request.setAttribute("error", "Le login existe déjà. Veuillez en choisir un autre.");
            getServletContext().getRequestDispatcher(VUE_AJOUT_UTILISATEUR).forward(request, response);
            return;
        }

        Utilisateur user = UtilisateurDAO.create(nom, prenom, login, password);
        response.sendRedirect("./listUser");
    }
}
