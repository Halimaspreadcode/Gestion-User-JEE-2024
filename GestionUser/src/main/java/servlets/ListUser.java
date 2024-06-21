package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import beans.Utilisateur;
import dao.UtilisateurDAO;

@WebServlet("/listUser")
public class ListUser extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Utilisateur> utilisateurs = UtilisateurDAO.lister();
        request.setAttribute("utilisateurs", utilisateurs);
        request.getRequestDispatcher("/WEB-INF/listerUtilisateur.jsp").forward(request, response);
    }
}
