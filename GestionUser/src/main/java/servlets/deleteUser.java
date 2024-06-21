package servlets;

import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;
import dao.UtilisateurDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/delete")
public class deleteUser extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");

        if (id.matches("[0-9]+")) {
            UtilisateurDAO.delete(Integer.parseInt(id));
            response.sendRedirect("./listUser");
        }
    }
}
